/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f6.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f6.s,v 1.1 2007/05/11 17:22:39 drp Exp $"
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
	setx	0xD9055427805B6403,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xE,	%g1
	set	0x7,	%g2
	set	0x6,	%g3
	set	0xC,	%g4
	set	0x0,	%g5
	set	0x9,	%g6
	set	0x8,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0x6,	%i1
	set	-0x3,	%i2
	set	-0x5,	%i3
	set	-0xD,	%i4
	set	-0x1,	%i5
	set	-0xD,	%i6
	set	-0x3,	%i7
	!# Local registers
	set	0x22BE0B6A,	%l0
	set	0x5CDA8222,	%l1
	set	0x7EA9C819,	%l2
	set	0x355522C4,	%l3
	set	0x5BF37680,	%l4
	set	0x6C52CA64,	%l5
	set	0x05FD8258,	%l6
	!# Output registers
	set	0x185F,	%o0
	set	0x0AFA,	%o1
	set	-0x0031,	%o2
	set	0x0D0E,	%o3
	set	0x1B0C,	%o4
	set	0x1158,	%o5
	set	-0x0E26,	%o6
	set	-0x155B,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA0BABD9126B05A71)
	INIT_TH_FP_REG(%l7,%f2,0xF34781560AF0871A)
	INIT_TH_FP_REG(%l7,%f4,0xAA7C93D7DC0E4E75)
	INIT_TH_FP_REG(%l7,%f6,0x73369E00CA5999F5)
	INIT_TH_FP_REG(%l7,%f8,0x729BCE5D988BB1D8)
	INIT_TH_FP_REG(%l7,%f10,0x2EDAA8119636227A)
	INIT_TH_FP_REG(%l7,%f12,0x3956BC4AC9A5A584)
	INIT_TH_FP_REG(%l7,%f14,0x1ED67F41D1135ADA)
	INIT_TH_FP_REG(%l7,%f16,0xD1726C3060E95B92)
	INIT_TH_FP_REG(%l7,%f18,0x500FE02E1AA903B7)
	INIT_TH_FP_REG(%l7,%f20,0xF46235683E41D268)
	INIT_TH_FP_REG(%l7,%f22,0x071A07CFC18E44EA)
	INIT_TH_FP_REG(%l7,%f24,0x92A4FE20AD48A1F6)
	INIT_TH_FP_REG(%l7,%f26,0xE8DABF146703649B)
	INIT_TH_FP_REG(%l7,%f28,0x36A10C387965BC04)
	INIT_TH_FP_REG(%l7,%f30,0x548B288EAD4CAA1D)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xA04, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fandnot2	%f28,	%f20,	%f16
	movrlz	%g3,	%o5,	%l4
	addcc	%o0,	%l6,	%i0
	stx	%g7,	[%l7 + 0x38]
	mova	%xcc,	%i1,	%g4
	fmovrdgz	%i6,	%f24,	%f22
	fmovdn	%xcc,	%f7,	%f11
	addcc	%l2,	%o4,	%i3
	nop
	set	0x1C, %i7
	ldsh	[%l7 + %i7],	%g6
	fmovd	%f2,	%f14
	sub	%o7,	%i4,	%i5
	movne	%icc,	%l1,	%g2
	fmovdn	%icc,	%f25,	%f29
	move	%icc,	%i2,	%g1
	stb	%l3,	[%l7 + 0x29]
	subccc	%o6,	%i7,	%o2
	udiv	%l5,	0x1A78,	%o1
	sub	%l0,	0x03A0,	%g5
	movg	%xcc,	%o3,	%o5
	fones	%f9
	lduw	[%l7 + 0x4C],	%l4
	sdivx	%o0,	0x1F04,	%l6
	addcc	%g3,	0x02D5,	%g7
	orncc	%i1,	0x0610,	%g4
	umulcc	%i0,	%i6,	%o4
	udivx	%l2,	0x08DA,	%g6
	subccc	%o7,	%i3,	%i5
	addcc	%l1,	0x0AF7,	%i4
	sub	%i2,	%g1,	%l3
	movrlz	%o6,	%i7,	%g2
	fmovrdgz	%l5,	%f12,	%f16
	movvs	%xcc,	%o2,	%l0
	array32	%o1,	%g5,	%o5
	fmovsle	%icc,	%f23,	%f16
	addcc	%o3,	0x042C,	%o0
	fmovd	%f10,	%f30
	xnor	%l4,	%g3,	%g7
	fmovdneg	%xcc,	%f5,	%f21
	andcc	%l6,	0x0D68,	%g4
	alignaddr	%i1,	%i6,	%o4
	fmovdle	%icc,	%f27,	%f15
	fmovrdlez	%l2,	%f28,	%f22
	ldub	[%l7 + 0x51],	%g6
	edge8n	%i0,	%i3,	%i5
	fpackfix	%f2,	%f1
	xnorcc	%o7,	0x0534,	%l1
	fornot2	%f8,	%f4,	%f28
	ldx	[%l7 + 0x58],	%i4
	ldsh	[%l7 + 0x44],	%g1
	edge16n	%i2,	%o6,	%l3
	andcc	%i7,	%g2,	%l5
	srl	%l0,	0x04,	%o2
	fmovsvc	%xcc,	%f4,	%f16
	movneg	%xcc,	%o1,	%g5
	movcs	%xcc,	%o5,	%o0
	movcs	%xcc,	%l4,	%g3
	mulscc	%g7,	0x1537,	%o3
	add	%g4,	%i1,	%l6
	lduh	[%l7 + 0x72],	%o4
	addc	%l2,	%i6,	%g6
	xorcc	%i3,	%i5,	%o7
	fnegd	%f20,	%f30
	andcc	%l1,	0x006A,	%i4
	fcmpd	%fcc1,	%f14,	%f12
	fxors	%f3,	%f29,	%f30
	fmovsvc	%icc,	%f24,	%f0
	movne	%icc,	%g1,	%i0
	edge16l	%o6,	%i2,	%l3
	movrgez	%g2,	%l5,	%i7
	array8	%l0,	%o2,	%o1
	pdist	%f8,	%f16,	%f6
	ldd	[%l7 + 0x38],	%f6
	udiv	%o5,	0x1D68,	%o0
	and	%g5,	0x0B28,	%g3
	stw	%l4,	[%l7 + 0x38]
	fmovdg	%icc,	%f12,	%f11
	movcc	%icc,	%g7,	%o3
	orn	%g4,	0x1E34,	%l6
	ld	[%l7 + 0x60],	%f15
	movvs	%icc,	%o4,	%i1
	movcc	%icc,	%l2,	%i6
	fmovrslz	%i3,	%f4,	%f13
	std	%f26,	[%l7 + 0x10]
	smul	%g6,	0x0E69,	%o7
	fmovsa	%xcc,	%f22,	%f10
	edge16l	%i5,	%i4,	%l1
	fsrc1	%f24,	%f16
	lduh	[%l7 + 0x0E],	%i0
	lduw	[%l7 + 0x2C],	%o6
	movne	%xcc,	%g1,	%i2
	fmovs	%f3,	%f23
	movl	%icc,	%l3,	%g2
	st	%f1,	[%l7 + 0x70]
	std	%f4,	[%l7 + 0x40]
	fabsd	%f16,	%f12
	ldsh	[%l7 + 0x14],	%l5
	fmuld8ulx16	%f1,	%f23,	%f20
	or	%l0,	%i7,	%o1
	movleu	%icc,	%o5,	%o2
	mova	%xcc,	%o0,	%g3
	fcmpeq16	%f18,	%f14,	%l4
	fnands	%f4,	%f18,	%f23
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%g4
	xnor	%g7,	%g4,	%l6
	mova	%xcc,	%o3,	%i1
	fpadd32s	%f17,	%f15,	%f29
	andn	%l2,	0x1BBF,	%o4
	sth	%i3,	[%l7 + 0x76]
	sra	%g6,	0x1F,	%i6
	std	%f26,	[%l7 + 0x60]
	ldsh	[%l7 + 0x38],	%o7
	lduw	[%l7 + 0x5C],	%i5
	movrne	%i4,	%i0,	%l1
	fmovrdlez	%g1,	%f6,	%f10
	xorcc	%o6,	%i2,	%g2
	stw	%l5,	[%l7 + 0x08]
	stb	%l0,	[%l7 + 0x31]
	udiv	%l3,	0x00EF,	%o1
	andcc	%i7,	0x04A0,	%o5
	fmovsneg	%icc,	%f19,	%f27
	srax	%o2,	0x14,	%g3
	movgu	%icc,	%l4,	%g5
	sethi	0x0720,	%g7
	save %o0, %g4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i1,	%l6,	%o4
	movg	%xcc,	%i3,	%g6
	sdivcc	%l2,	0x1120,	%o7
	fpadd32s	%f11,	%f1,	%f23
	fsrc1s	%f16,	%f15
	fcmpne16	%f16,	%f22,	%i6
	fmuld8ulx16	%f4,	%f12,	%f16
	fxnor	%f28,	%f12,	%f14
	fmovrse	%i4,	%f28,	%f13
	save %i5, 0x12D5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i0,	0x19,	%o6
	nop
	set	0x60, %o4
	ldsb	[%l7 + %o4],	%g1
	move	%icc,	%g2,	%l5
	movrgz	%l0,	%l3,	%i2
	ldd	[%l7 + 0x20],	%o0
	alignaddrl	%i7,	%o2,	%o5
	sethi	0x0E1E,	%g3
	addc	%l4,	%g7,	%g5
	orn	%o0,	%o3,	%g4
	movvc	%icc,	%i1,	%l6
	fnot1	%f8,	%f2
	fpack32	%f24,	%f20,	%f24
	andcc	%i3,	0x1F86,	%g6
	movvc	%icc,	%l2,	%o7
	fmovspos	%xcc,	%f13,	%f25
	edge8l	%o4,	%i4,	%i5
	movcc	%xcc,	%i6,	%i0
	fmovrsgez	%l1,	%f2,	%f25
	fmuld8ulx16	%f13,	%f30,	%f2
	movvs	%xcc,	%o6,	%g2
	srlx	%g1,	0x15,	%l0
	fpsub16s	%f8,	%f19,	%f20
	movre	%l5,	0x3C9,	%l3
	fmul8sux16	%f30,	%f24,	%f26
	edge16	%o1,	%i2,	%i7
	fmovse	%xcc,	%f22,	%f17
	fcmps	%fcc2,	%f4,	%f31
	movrgz	%o2,	0x06A,	%o5
	fmovsneg	%icc,	%f31,	%f15
	addccc	%g3,	%g7,	%g5
	fnot2s	%f0,	%f7
	orn	%o0,	%o3,	%g4
	sth	%l4,	[%l7 + 0x5A]
	fsrc2	%f8,	%f10
	fornot1	%f24,	%f0,	%f8
	mulx	%i1,	0x1A34,	%l6
	edge8ln	%i3,	%l2,	%o7
	sir	0x1127
	udivcc	%g6,	0x109C,	%i4
	fmovdge	%icc,	%f13,	%f9
	ldsw	[%l7 + 0x70],	%i5
	udivcc	%o4,	0x1AB9,	%i6
	edge8	%l1,	%o6,	%i0
	movrgz	%g2,	%l0,	%g1
	sub	%l3,	0x1DE9,	%o1
	st	%f18,	[%l7 + 0x3C]
	alignaddr	%i2,	%i7,	%l5
	udivcc	%o2,	0x1BE1,	%o5
	ldsw	[%l7 + 0x14],	%g3
	array8	%g5,	%o0,	%o3
	andncc	%g4,	%g7,	%l4
	fexpand	%f28,	%f30
	fmovrsgz	%l6,	%f6,	%f4
	ldsh	[%l7 + 0x2E],	%i3
	orncc	%i1,	%l2,	%o7
	movrlez	%i4,	%i5,	%o4
	movle	%xcc,	%i6,	%l1
	sdiv	%g6,	0x0285,	%i0
	edge8	%o6,	%l0,	%g2
	fmovsge	%icc,	%f2,	%f8
	edge16n	%g1,	%l3,	%o1
	ldd	[%l7 + 0x48],	%f26
	movrlez	%i7,	%i2,	%o2
	xnorcc	%l5,	%g3,	%g5
	fmovrsne	%o0,	%f30,	%f19
	orn	%o3,	%g4,	%g7
	lduw	[%l7 + 0x2C],	%o5
	movrgez	%l6,	%i3,	%l4
	edge32n	%l2,	%o7,	%i1
	or	%i4,	%o4,	%i5
	udivcc	%l1,	0x0A74,	%g6
	movgu	%icc,	%i6,	%i0
	smul	%o6,	%g2,	%g1
	addccc	%l0,	%o1,	%l3
	fcmple16	%f16,	%f4,	%i7
	umul	%i2,	%o2,	%g3
	ldsb	[%l7 + 0x34],	%g5
	fmovdcc	%xcc,	%f11,	%f26
	movl	%icc,	%l5,	%o0
	movpos	%icc,	%o3,	%g7
	movge	%icc,	%o5,	%l6
	sethi	0x1726,	%g4
	or	%i3,	0x016A,	%l2
	movn	%icc,	%l4,	%o7
	lduw	[%l7 + 0x30],	%i1
	sra	%o4,	%i4,	%i5
	srlx	%l1,	%g6,	%i0
	udivcc	%o6,	0x1F73,	%g2
	movn	%icc,	%g1,	%i6
	movre	%o1,	0x3B0,	%l0
	fnor	%f24,	%f4,	%f8
	edge32l	%l3,	%i2,	%i7
	movpos	%icc,	%o2,	%g5
	ldsb	[%l7 + 0x12],	%g3
	fpsub16	%f6,	%f14,	%f26
	sdiv	%o0,	0x0996,	%o3
	fmovrsgez	%g7,	%f9,	%f12
	fpackfix	%f28,	%f20
	alignaddr	%l5,	%o5,	%g4
	ld	[%l7 + 0x74],	%f0
	sdivx	%l6,	0x1960,	%i3
	sra	%l4,	%o7,	%l2
	fpsub16	%f6,	%f2,	%f8
	stw	%i1,	[%l7 + 0x48]
	fandnot1s	%f15,	%f13,	%f2
	sth	%o4,	[%l7 + 0x0A]
	fmovrde	%i5,	%f6,	%f18
	fpadd16s	%f11,	%f31,	%f19
	movre	%l1,	0x0FC,	%g6
	fxors	%f14,	%f29,	%f9
	fpackfix	%f14,	%f20
	ldsw	[%l7 + 0x38],	%i4
	edge32ln	%o6,	%g2,	%i0
	xnor	%i6,	%o1,	%l0
	ldsw	[%l7 + 0x08],	%g1
	srax	%l3,	%i2,	%o2
	movleu	%xcc,	%g5,	%g3
	stb	%o0,	[%l7 + 0x63]
	movrgez	%o3,	0x3A0,	%g7
	xnor	%l5,	0x003B,	%i7
	srax	%g4,	0x0D,	%l6
	ldd	[%l7 + 0x18],	%i2
	fnot1	%f12,	%f20
	fmovscs	%icc,	%f16,	%f29
	andncc	%l4,	%o5,	%o7
	xnor	%i1,	%o4,	%l2
	sdiv	%i5,	0x0587,	%g6
	movrne	%l1,	0x2FF,	%i4
	move	%xcc,	%o6,	%g2
	array32	%i0,	%o1,	%i6
	ldsb	[%l7 + 0x56],	%g1
	mulscc	%l0,	%l3,	%o2
	andncc	%i2,	%g5,	%g3
	fnot2	%f26,	%f14
	movle	%icc,	%o0,	%o3
	umulcc	%l5,	%g7,	%i7
	ldd	[%l7 + 0x70],	%f10
	fmovrsgez	%l6,	%f8,	%f27
	or	%i3,	0x1334,	%g4
	lduw	[%l7 + 0x44],	%l4
	fmovspos	%xcc,	%f5,	%f5
	edge32	%o7,	%i1,	%o4
	edge32n	%l2,	%o5,	%g6
	edge32n	%l1,	%i5,	%o6
	srl	%i4,	0x19,	%i0
	xnor	%g2,	0x0B09,	%i6
	smul	%g1,	%l0,	%o1
	sllx	%o2,	0x16,	%l3
	fexpand	%f5,	%f18
	movleu	%icc,	%g5,	%g3
	movne	%xcc,	%o0,	%o3
	sub	%l5,	0x05BB,	%g7
	smul	%i2,	%i7,	%l6
	fmovsge	%icc,	%f11,	%f23
	andn	%i3,	%g4,	%o7
	movpos	%icc,	%l4,	%o4
	edge32	%l2,	%o5,	%g6
	st	%f0,	[%l7 + 0x1C]
	subccc	%i1,	%i5,	%l1
	ldsb	[%l7 + 0x27],	%i4
	sth	%i0,	[%l7 + 0x42]
	subccc	%g2,	%o6,	%i6
	edge32n	%l0,	%g1,	%o1
	orn	%o2,	%l3,	%g3
	fmul8x16au	%f11,	%f6,	%f6
	movn	%icc,	%o0,	%g5
	movneg	%xcc,	%l5,	%g7
	movcs	%icc,	%o3,	%i2
	edge32	%i7,	%l6,	%i3
	fcmps	%fcc1,	%f4,	%f9
	fmul8x16al	%f28,	%f27,	%f0
	subcc	%o7,	%l4,	%g4
	movle	%xcc,	%o4,	%o5
	mulscc	%l2,	0x1D79,	%i1
	popc	0x1A64,	%i5
	mova	%xcc,	%l1,	%g6
	fmul8ulx16	%f28,	%f24,	%f16
	edge32n	%i4,	%i0,	%g2
	sir	0x1669
	movcs	%icc,	%i6,	%o6
	sth	%g1,	[%l7 + 0x6A]
	xnor	%l0,	%o2,	%o1
	srl	%g3,	0x00,	%o0
	st	%f20,	[%l7 + 0x7C]
	fmovdcc	%xcc,	%f18,	%f13
	fpadd16s	%f30,	%f3,	%f10
	restore %l3, 0x1929, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x44],	%f20
	fmovdpos	%xcc,	%f5,	%f3
	stb	%g7,	[%l7 + 0x67]
	orncc	%o3,	%g5,	%i2
	movrne	%l6,	%i3,	%o7
	fmovdl	%icc,	%f25,	%f18
	fmovsle	%xcc,	%f21,	%f10
	fmovdl	%icc,	%f6,	%f15
	andncc	%l4,	%i7,	%g4
	edge16l	%o5,	%l2,	%i1
	move	%xcc,	%o4,	%i5
	movrgz	%l1,	%g6,	%i0
	ldsh	[%l7 + 0x20],	%g2
	orncc	%i4,	%i6,	%g1
	movre	%l0,	0x28D,	%o2
	xnor	%o6,	0x0465,	%g3
	ldd	[%l7 + 0x10],	%o0
	fnegd	%f8,	%f2
	fmovsvc	%icc,	%f17,	%f20
	xnorcc	%l3,	%l5,	%g7
	smulcc	%o0,	0x00A7,	%o3
	movleu	%xcc,	%i2,	%g5
	faligndata	%f18,	%f28,	%f30
	ldd	[%l7 + 0x58],	%f6
	fnors	%f22,	%f30,	%f23
	fcmpeq16	%f6,	%f30,	%i3
	sethi	0x1006,	%l6
	edge8	%o7,	%l4,	%g4
	ldd	[%l7 + 0x40],	%f0
	alignaddr	%o5,	%l2,	%i7
	movleu	%icc,	%o4,	%i5
	sethi	0x1524,	%l1
	sth	%g6,	[%l7 + 0x7A]
	srlx	%i1,	0x14,	%g2
	movn	%icc,	%i4,	%i0
	xorcc	%g1,	%l0,	%i6
	fmovd	%f12,	%f22
	orncc	%o2,	%o6,	%o1
	fmovse	%xcc,	%f18,	%f14
	addcc	%l3,	0x0F0F,	%l5
	andcc	%g3,	%g7,	%o3
	xorcc	%i2,	0x1D2E,	%o0
	movcs	%xcc,	%g5,	%i3
	movrgez	%o7,	%l6,	%l4
	addccc	%o5,	0x0522,	%l2
	save %i7, 0x020A, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o4,	0x05,	%l1
	srlx	%g6,	0x04,	%i5
	edge32l	%i1,	%g2,	%i4
	fmovspos	%xcc,	%f7,	%f31
	edge8ln	%i0,	%l0,	%i6
	ldx	[%l7 + 0x28],	%g1
	movrgz	%o2,	%o1,	%l3
	movg	%icc,	%o6,	%l5
	ldsw	[%l7 + 0x48],	%g3
	ldx	[%l7 + 0x48],	%g7
	ldub	[%l7 + 0x30],	%i2
	sllx	%o0,	%g5,	%i3
	movne	%xcc,	%o3,	%l6
	andn	%o7,	0x002D,	%o5
	addc	%l4,	%l2,	%g4
	xnorcc	%o4,	0x0D9B,	%i7
	subccc	%l1,	0x0402,	%i5
	xor	%i1,	0x0E7F,	%g6
	edge8n	%g2,	%i0,	%i4
	subc	%l0,	0x1807,	%i6
	ldd	[%l7 + 0x10],	%o2
	sra	%g1,	0x1D,	%l3
	sethi	0x14F1,	%o6
	fmovscs	%xcc,	%f30,	%f21
	array16	%l5,	%g3,	%g7
	srax	%o1,	%o0,	%g5
	subccc	%i2,	%i3,	%l6
	subccc	%o7,	0x1C26,	%o3
	smulcc	%o5,	0x1169,	%l4
	srax	%g4,	%o4,	%i7
	ldd	[%l7 + 0x50],	%f4
	smul	%l1,	%l2,	%i1
	fcmped	%fcc0,	%f28,	%f16
	movcs	%icc,	%i5,	%g6
	edge16l	%i0,	%g2,	%l0
	sllx	%i6,	%o2,	%i4
	fmovdneg	%xcc,	%f11,	%f14
	alignaddr	%g1,	%o6,	%l5
	movpos	%xcc,	%g3,	%l3
	lduw	[%l7 + 0x4C],	%g7
	ldub	[%l7 + 0x7F],	%o0
	edge8	%o1,	%i2,	%g5
	fmovsvs	%icc,	%f0,	%f29
	movpos	%xcc,	%l6,	%i3
	sdivcc	%o7,	0x1B55,	%o5
	mulscc	%o3,	%g4,	%o4
	movrlz	%i7,	0x324,	%l4
	subcc	%l1,	0x141E,	%i1
	fmul8sux16	%f10,	%f14,	%f10
	array32	%l2,	%g6,	%i5
	std	%f26,	[%l7 + 0x30]
	sethi	0x0320,	%i0
	faligndata	%f22,	%f6,	%f16
	movre	%g2,	0x1E0,	%l0
	edge32n	%i6,	%o2,	%g1
	sdivcc	%i4,	0x0001,	%o6
	stx	%l5,	[%l7 + 0x40]
	fpsub16	%f22,	%f6,	%f0
	fmovscc	%icc,	%f25,	%f11
	smul	%g3,	0x101C,	%l3
	xor	%o0,	0x0AE0,	%o1
	movle	%xcc,	%g7,	%i2
	fcmpd	%fcc0,	%f16,	%f8
	xor	%l6,	0x1AB1,	%i3
	std	%f26,	[%l7 + 0x68]
	sdivx	%g5,	0x15B8,	%o7
	srlx	%o3,	%o5,	%g4
	lduh	[%l7 + 0x4E],	%i7
	fmovrdlz	%l4,	%f28,	%f24
	addc	%o4,	%l1,	%i1
	alignaddrl	%g6,	%i5,	%i0
	edge8l	%l2,	%l0,	%i6
	orn	%g2,	0x1686,	%g1
	xnorcc	%i4,	0x0CC2,	%o2
	udivcc	%o6,	0x1E13,	%g3
	fcmple32	%f8,	%f30,	%l5
	fmovsvs	%xcc,	%f6,	%f6
	fpsub16s	%f9,	%f28,	%f15
	sth	%l3,	[%l7 + 0x0E]
	movpos	%icc,	%o0,	%g7
	udivx	%o1,	0x10B1,	%i2
	subcc	%l6,	%g5,	%o7
	subccc	%i3,	0x088D,	%o5
	ldx	[%l7 + 0x48],	%o3
	udivx	%g4,	0x15D5,	%l4
	bshuffle	%f2,	%f28,	%f4
	movn	%icc,	%o4,	%i7
	sra	%i1,	%l1,	%i5
	ldsh	[%l7 + 0x36],	%i0
	orn	%l2,	0x0BE1,	%g6
	fcmped	%fcc3,	%f16,	%f6
	mulx	%l0,	0x190F,	%g2
	fmovrdne	%g1,	%f30,	%f4
	ldsb	[%l7 + 0x20],	%i6
	srlx	%o2,	0x16,	%i4
	mulx	%o6,	%l5,	%l3
	nop
	set	0x41, %o7
	ldub	[%l7 + %o7],	%g3
	umulcc	%g7,	0x0875,	%o0
	sir	0x015A
	fmovsvc	%icc,	%f7,	%f18
	xnorcc	%o1,	0x13BA,	%l6
	ld	[%l7 + 0x54],	%f11
	movg	%icc,	%g5,	%o7
	edge8n	%i3,	%o5,	%i2
	movleu	%xcc,	%g4,	%o3
	fmovsa	%xcc,	%f28,	%f2
	fmovrdgez	%o4,	%f0,	%f12
	edge16n	%l4,	%i7,	%l1
	xor	%i5,	%i0,	%i1
	stx	%g6,	[%l7 + 0x38]
	sth	%l0,	[%l7 + 0x16]
	fmovdvc	%icc,	%f31,	%f31
	sth	%l2,	[%l7 + 0x30]
	alignaddr	%g2,	%i6,	%g1
	umulcc	%i4,	%o6,	%l5
	andn	%l3,	%g3,	%o2
	udivcc	%o0,	0x0769,	%o1
	alignaddr	%g7,	%l6,	%o7
	addcc	%i3,	0x06F7,	%g5
	movneg	%xcc,	%i2,	%o5
	fmovdn	%xcc,	%f6,	%f8
	addcc	%o3,	0x0872,	%o4
	movrlez	%l4,	%i7,	%g4
	fnot2	%f16,	%f18
	for	%f12,	%f4,	%f6
	orn	%l1,	%i5,	%i0
	fpsub16	%f24,	%f28,	%f20
	move	%xcc,	%g6,	%l0
	srax	%i1,	%l2,	%g2
	fmovse	%xcc,	%f15,	%f4
	xnorcc	%i6,	%g1,	%i4
	sra	%l5,	0x0C,	%o6
	ld	[%l7 + 0x4C],	%f17
	st	%f13,	[%l7 + 0x48]
	array16	%g3,	%o2,	%l3
	mova	%icc,	%o1,	%g7
	move	%icc,	%l6,	%o0
	fpack32	%f10,	%f2,	%f30
	nop
	set	0x46, %l3
	ldsh	[%l7 + %l3],	%i3
	fxors	%f4,	%f11,	%f16
	movpos	%xcc,	%g5,	%i2
	fmul8sux16	%f4,	%f4,	%f24
	st	%f7,	[%l7 + 0x38]
	movvc	%icc,	%o7,	%o5
	alignaddr	%o4,	%o3,	%l4
	sethi	0x13FF,	%i7
	xorcc	%g4,	%l1,	%i0
	sllx	%i5,	0x10,	%g6
	fxnor	%f6,	%f2,	%f8
	fors	%f10,	%f1,	%f27
	fpmerge	%f20,	%f4,	%f12
	array8	%l0,	%l2,	%g2
	subcc	%i1,	0x1478,	%g1
	edge16ln	%i6,	%i4,	%l5
	stw	%o6,	[%l7 + 0x20]
	fmovscc	%icc,	%f5,	%f20
	mulscc	%o2,	%l3,	%o1
	for	%f22,	%f8,	%f4
	edge16	%g7,	%g3,	%o0
	array8	%l6,	%g5,	%i2
	fnot1	%f0,	%f10
	andcc	%i3,	0x1F34,	%o5
	fsrc1s	%f29,	%f2
	andn	%o4,	%o7,	%o3
	movl	%icc,	%l4,	%g4
	sethi	0x1F92,	%i7
	smul	%l1,	0x0BBA,	%i5
	umulcc	%i0,	0x1CAE,	%l0
	sll	%l2,	%g2,	%g6
	fmuld8ulx16	%f21,	%f31,	%f28
	andcc	%g1,	%i6,	%i4
	array8	%l5,	%o6,	%o2
	subcc	%l3,	%o1,	%i1
	mulscc	%g7,	0x158D,	%g3
	subc	%o0,	0x1D12,	%g5
	alignaddr	%l6,	%i2,	%i3
	fmul8x16	%f21,	%f30,	%f14
	addccc	%o4,	%o5,	%o7
	andncc	%l4,	%g4,	%o3
	movre	%i7,	0x074,	%i5
	edge32n	%i0,	%l0,	%l2
	ld	[%l7 + 0x54],	%f20
	fxors	%f5,	%f11,	%f12
	fmovda	%icc,	%f29,	%f12
	addccc	%g2,	0x0A3B,	%l1
	fmovrdlez	%g1,	%f8,	%f14
	fcmpgt32	%f10,	%f0,	%g6
	movge	%xcc,	%i4,	%l5
	xor	%o6,	%o2,	%l3
	movgu	%xcc,	%o1,	%i1
	movgu	%xcc,	%i6,	%g7
	fxors	%f18,	%f9,	%f28
	popc	%g3,	%g5
	srl	%l6,	0x02,	%i2
	sth	%o0,	[%l7 + 0x6A]
	or	%o4,	0x130D,	%o5
	edge16l	%i3,	%l4,	%g4
	fmovsne	%xcc,	%f21,	%f22
	movcs	%xcc,	%o7,	%o3
	fzeros	%f17
	movpos	%icc,	%i5,	%i7
	bshuffle	%f28,	%f28,	%f18
	andcc	%i0,	0x0CCA,	%l0
	nop
	set	0x18, %l4
	ldd	[%l7 + %l4],	%l2
	sethi	0x12ED,	%l1
	fandnot2	%f30,	%f0,	%f0
	xor	%g2,	%g1,	%g6
	fmul8ulx16	%f6,	%f14,	%f10
	movvc	%icc,	%l5,	%o6
	fornot2s	%f0,	%f21,	%f4
	sll	%i4,	0x0B,	%l3
	sdiv	%o1,	0x1796,	%o2
	stw	%i6,	[%l7 + 0x7C]
	movrlz	%i1,	0x1EC,	%g3
	ldd	[%l7 + 0x20],	%f24
	fmovse	%icc,	%f12,	%f13
	orcc	%g5,	0x0878,	%g7
	std	%f4,	[%l7 + 0x68]
	srl	%l6,	%i2,	%o0
	movrlz	%o5,	%o4,	%l4
	edge16ln	%g4,	%i3,	%o7
	movne	%icc,	%o3,	%i5
	addccc	%i0,	%i7,	%l0
	edge8l	%l2,	%g2,	%l1
	xnor	%g1,	0x0DF5,	%g6
	ld	[%l7 + 0x7C],	%f5
	fmovrdgez	%l5,	%f10,	%f20
	subcc	%i4,	0x16F8,	%l3
	move	%xcc,	%o1,	%o6
	movrgez	%o2,	0x3A1,	%i1
	sllx	%i6,	0x08,	%g5
	fmovdvs	%xcc,	%f28,	%f4
	movrgz	%g3,	%g7,	%i2
	orn	%o0,	0x0B15,	%l6
	sth	%o4,	[%l7 + 0x44]
	sllx	%o5,	0x0C,	%g4
	ldsh	[%l7 + 0x3C],	%i3
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%l4
	fcmpne32	%f18,	%f4,	%o7
	array16	%o3,	%i5,	%i7
	lduh	[%l7 + 0x34],	%l0
	faligndata	%f12,	%f4,	%f8
	edge8l	%l2,	%g2,	%l1
	sdivcc	%i0,	0x1788,	%g1
	movg	%icc,	%g6,	%l5
	movvs	%icc,	%i4,	%l3
	array32	%o1,	%o6,	%o2
	ldsh	[%l7 + 0x2E],	%i6
	fmovdleu	%icc,	%f22,	%f0
	fmovsvs	%xcc,	%f17,	%f0
	movcc	%xcc,	%i1,	%g3
	lduh	[%l7 + 0x64],	%g5
	fmovrdgz	%g7,	%f26,	%f6
	movpos	%icc,	%i2,	%o0
	alignaddrl	%l6,	%o5,	%o4
	fmovsgu	%icc,	%f21,	%f16
	addcc	%i3,	0x185C,	%g4
	array32	%o7,	%o3,	%i5
	nop
	set	0x17, %l5
	stb	%i7,	[%l7 + %l5]
	stb	%l0,	[%l7 + 0x3C]
	and	%l4,	0x1253,	%l2
	xnor	%g2,	0x0913,	%l1
	orncc	%i0,	%g6,	%g1
	sdivx	%l5,	0x0541,	%l3
	fmovdleu	%xcc,	%f31,	%f24
	edge8n	%i4,	%o6,	%o2
	udivcc	%o1,	0x1FC0,	%i6
	fcmpne32	%f0,	%f14,	%g3
	popc	0x0E49,	%i1
	st	%f22,	[%l7 + 0x34]
	movn	%icc,	%g7,	%i2
	lduh	[%l7 + 0x7A],	%o0
	xnor	%l6,	0x1F57,	%o5
	fones	%f28
	udivx	%g5,	0x14E4,	%i3
	ldx	[%l7 + 0x58],	%o4
	fnor	%f18,	%f20,	%f2
	udiv	%g4,	0x1059,	%o7
	nop
	set	0x58, %g3
	std	%f28,	[%l7 + %g3]
	edge32	%o3,	%i5,	%l0
	movvs	%icc,	%l4,	%i7
	edge8ln	%l2,	%g2,	%i0
	nop
	set	0x6A, %g4
	lduh	[%l7 + %g4],	%l1
	movvc	%xcc,	%g6,	%l5
	udiv	%g1,	0x070D,	%i4
	addcc	%o6,	%l3,	%o2
	edge8ln	%i6,	%o1,	%g3
	fmovsa	%xcc,	%f23,	%f24
	edge32ln	%g7,	%i1,	%i2
	popc	0x02F5,	%l6
	array8	%o0,	%g5,	%o5
	fxnor	%f8,	%f20,	%f14
	st	%f18,	[%l7 + 0x70]
	xorcc	%i3,	%o4,	%o7
	mulscc	%g4,	0x1D73,	%i5
	edge16ln	%o3,	%l0,	%i7
	smulcc	%l2,	%g2,	%l4
	fsrc2	%f6,	%f20
	smul	%l1,	0x1216,	%g6
	ld	[%l7 + 0x1C],	%f15
	lduh	[%l7 + 0x14],	%i0
	edge16	%g1,	%i4,	%o6
	fpsub16	%f18,	%f2,	%f30
	subccc	%l3,	%l5,	%o2
	xnorcc	%o1,	%g3,	%i6
	srax	%i1,	%i2,	%l6
	mulx	%g7,	%g5,	%o0
	sethi	0x1D3F,	%i3
	subcc	%o5,	%o7,	%g4
	movvc	%xcc,	%o4,	%i5
	fmovrslez	%l0,	%f12,	%f14
	movne	%xcc,	%o3,	%l2
	subcc	%g2,	0x0B0A,	%l4
	sdivcc	%i7,	0x093E,	%g6
	lduh	[%l7 + 0x52],	%i0
	smul	%g1,	0x01FB,	%i4
	fones	%f20
	xorcc	%l1,	%l3,	%l5
	stw	%o6,	[%l7 + 0x18]
	ld	[%l7 + 0x50],	%f12
	movrlez	%o1,	%g3,	%i6
	sub	%i1,	%i2,	%o2
	stw	%l6,	[%l7 + 0x20]
	udivcc	%g7,	0x0CB1,	%o0
	fpsub32	%f20,	%f4,	%f12
	fpadd16s	%f8,	%f29,	%f11
	edge16n	%i3,	%g5,	%o7
	alignaddr	%o5,	%o4,	%g4
	udiv	%l0,	0x0CD8,	%o3
	edge16	%l2,	%i5,	%g2
	srlx	%l4,	0x1D,	%g6
	movvs	%icc,	%i7,	%i0
	pdist	%f16,	%f14,	%f14
	edge8	%g1,	%l1,	%l3
	stx	%i4,	[%l7 + 0x20]
	andn	%o6,	0x1D75,	%l5
	srl	%g3,	%i6,	%i1
	fxors	%f14,	%f18,	%f0
	fmovscs	%icc,	%f5,	%f23
	movl	%icc,	%i2,	%o1
	move	%xcc,	%o2,	%g7
	st	%f16,	[%l7 + 0x64]
	movvs	%icc,	%l6,	%o0
	edge8ln	%i3,	%g5,	%o7
	ldsw	[%l7 + 0x34],	%o5
	fmovsleu	%icc,	%f25,	%f16
	nop
	set	0x64, %l2
	ldsw	[%l7 + %l2],	%o4
	movneg	%icc,	%l0,	%g4
	movne	%icc,	%l2,	%i5
	bshuffle	%f16,	%f4,	%f24
	edge8	%o3,	%l4,	%g6
	mova	%icc,	%i7,	%g2
	srl	%i0,	0x10,	%l1
	ldsh	[%l7 + 0x44],	%g1
	mulx	%i4,	0x0259,	%l3
	fmovda	%xcc,	%f2,	%f11
	udiv	%o6,	0x0800,	%l5
	edge8l	%i6,	%g3,	%i2
	fmovrslez	%i1,	%f29,	%f2
	subc	%o2,	%o1,	%l6
	xnor	%g7,	0x14F8,	%o0
	edge32l	%i3,	%g5,	%o7
	movrlez	%o5,	0x39D,	%o4
	popc	%l0,	%l2
	fands	%f26,	%f9,	%f4
	fmovdgu	%icc,	%f3,	%f23
	ldd	[%l7 + 0x70],	%f0
	stw	%g4,	[%l7 + 0x0C]
	movcc	%xcc,	%i5,	%o3
	movrgz	%g6,	0x2BD,	%i7
	andcc	%g2,	0x10FF,	%l4
	ldsw	[%l7 + 0x3C],	%i0
	mova	%icc,	%l1,	%i4
	sll	%g1,	%l3,	%l5
	movpos	%icc,	%o6,	%g3
	lduh	[%l7 + 0x5A],	%i2
	sra	%i6,	%i1,	%o1
	fmovsl	%icc,	%f6,	%f4
	fcmpne16	%f22,	%f4,	%o2
	bshuffle	%f18,	%f26,	%f14
	ldsb	[%l7 + 0x29],	%l6
	srlx	%o0,	0x08,	%g7
	fmovsge	%icc,	%f16,	%f27
	move	%icc,	%i3,	%o7
	edge32n	%o5,	%o4,	%l0
	add	%g5,	0x10D5,	%g4
	addccc	%l2,	0x0F72,	%i5
	edge8n	%o3,	%g6,	%i7
	lduw	[%l7 + 0x38],	%g2
	movvs	%icc,	%i0,	%l4
	fmovdvs	%xcc,	%f1,	%f1
	addc	%l1,	%g1,	%l3
	edge32	%i4,	%l5,	%o6
	movvs	%xcc,	%i2,	%i6
	movle	%icc,	%g3,	%o1
	srlx	%o2,	0x13,	%l6
	udiv	%i1,	0x017B,	%g7
	fornot2	%f10,	%f0,	%f14
	srl	%o0,	%i3,	%o5
	array8	%o4,	%l0,	%g5
	sethi	0x1EBA,	%o7
	mulscc	%g4,	%l2,	%o3
	nop
	set	0x38, %i3
	lduw	[%l7 + %i3],	%i5
	edge32	%i7,	%g2,	%g6
	popc	0x1C88,	%i0
	sth	%l4,	[%l7 + 0x3A]
	orcc	%l1,	0x1519,	%g1
	umul	%l3,	0x1619,	%l5
	movrlez	%o6,	0x144,	%i4
	sllx	%i2,	%i6,	%o1
	umul	%g3,	0x05F0,	%l6
	save %o2, 0x1577, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i1,	[%l7 + 0x5E]
	subccc	%o0,	%i3,	%o4
	or	%l0,	%g5,	%o7
	popc	%g4,	%o5
	fmovse	%xcc,	%f29,	%f26
	move	%icc,	%o3,	%l2
	smulcc	%i7,	0x094D,	%g2
	ld	[%l7 + 0x18],	%f27
	andncc	%g6,	%i0,	%i5
	edge8	%l4,	%l1,	%l3
	array16	%l5,	%o6,	%i4
	ldd	[%l7 + 0x20],	%g0
	umul	%i6,	%o1,	%g3
	movl	%icc,	%l6,	%i2
	array16	%o2,	%g7,	%i1
	movpos	%xcc,	%i3,	%o4
	mova	%icc,	%o0,	%l0
	udivx	%g5,	0x066E,	%o7
	fmovdne	%xcc,	%f0,	%f7
	xnor	%g4,	%o3,	%l2
	array32	%o5,	%i7,	%g6
	fmovrsne	%i0,	%f30,	%f29
	ldd	[%l7 + 0x68],	%i4
	orn	%l4,	0x0FB4,	%g2
	subc	%l1,	0x09A4,	%l5
	edge32l	%l3,	%o6,	%g1
	addcc	%i6,	%o1,	%i4
	movvc	%icc,	%g3,	%i2
	fcmpeq32	%f22,	%f6,	%l6
	sll	%g7,	0x14,	%i1
	andn	%i3,	0x0892,	%o2
	movgu	%xcc,	%o0,	%o4
	stx	%l0,	[%l7 + 0x38]
	ldd	[%l7 + 0x20],	%g4
	movcc	%icc,	%o7,	%g4
	fmovd	%f26,	%f28
	popc	0x06D1,	%l2
	movcs	%icc,	%o5,	%o3
	udiv	%i7,	0x0B24,	%i0
	edge8ln	%i5,	%g6,	%g2
	subccc	%l4,	%l5,	%l3
	fmovsvc	%xcc,	%f31,	%f15
	movrlz	%o6,	%g1,	%i6
	sllx	%l1,	0x0E,	%o1
	save %g3, 0x1D4A, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i4,	%g7,	%l6
	stx	%i1,	[%l7 + 0x40]
	smul	%o2,	0x1A4C,	%i3
	edge8ln	%o4,	%o0,	%l0
	udivx	%o7,	0x0B87,	%g4
	fmovrsgez	%g5,	%f3,	%f7
	fpsub16	%f24,	%f0,	%f26
	edge32ln	%l2,	%o5,	%o3
	xnor	%i0,	0x1FCB,	%i5
	lduh	[%l7 + 0x3E],	%i7
	array8	%g6,	%l4,	%g2
	ld	[%l7 + 0x34],	%f18
	edge32l	%l3,	%l5,	%g1
	sra	%i6,	%o6,	%l1
	andn	%o1,	%g3,	%i4
	save %g7, 0x130C, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i1,	%o2,	%i3
	ldx	[%l7 + 0x40],	%i2
	edge32n	%o4,	%o0,	%l0
	fmovsa	%xcc,	%f22,	%f18
	fmovrdlez	%g4,	%f20,	%f30
	addcc	%g5,	0x04D2,	%o7
	movgu	%icc,	%l2,	%o5
	movg	%xcc,	%o3,	%i5
	movleu	%icc,	%i0,	%g6
	stw	%l4,	[%l7 + 0x20]
	ldd	[%l7 + 0x68],	%f0
	ld	[%l7 + 0x4C],	%f12
	subc	%i7,	%g2,	%l3
	sllx	%g1,	%l5,	%i6
	fone	%f26
	fmovsleu	%icc,	%f12,	%f13
	st	%f29,	[%l7 + 0x40]
	movleu	%icc,	%l1,	%o6
	popc	%g3,	%o1
	or	%i4,	%g7,	%i1
	addc	%o2,	%i3,	%l6
	movrne	%i2,	%o4,	%l0
	sub	%o0,	%g4,	%o7
	edge8l	%l2,	%g5,	%o3
	sll	%o5,	0x1B,	%i0
	fmovdle	%icc,	%f26,	%f8
	alignaddrl	%i5,	%g6,	%l4
	umulcc	%g2,	0x0027,	%i7
	fsrc1	%f0,	%f28
	sub	%g1,	0x0D5E,	%l3
	fmuld8sux16	%f11,	%f14,	%f20
	movle	%xcc,	%i6,	%l1
	mulx	%o6,	%g3,	%l5
	add	%i4,	%o1,	%i1
	sth	%o2,	[%l7 + 0x74]
	edge32	%i3,	%g7,	%i2
	movrne	%l6,	%o4,	%l0
	ldd	[%l7 + 0x40],	%g4
	andncc	%o7,	%o0,	%l2
	ldub	[%l7 + 0x0B],	%o3
	array32	%g5,	%i0,	%o5
	xnor	%i5,	%g6,	%g2
	edge16l	%l4,	%i7,	%g1
	array32	%l3,	%i6,	%o6
	xnor	%l1,	%l5,	%i4
	orncc	%o1,	0x0C78,	%i1
	fmul8x16al	%f25,	%f21,	%f10
	addccc	%g3,	%o2,	%g7
	orn	%i2,	0x075C,	%l6
	fcmpd	%fcc1,	%f18,	%f0
	edge16l	%i3,	%l0,	%o4
	movvc	%xcc,	%g4,	%o7
	movvs	%icc,	%o0,	%o3
	sdivcc	%g5,	0x107D,	%i0
	fmul8x16	%f0,	%f2,	%f0
	subc	%o5,	0x0633,	%i5
	move	%icc,	%g6,	%g2
	andcc	%l4,	0x0871,	%i7
	mova	%icc,	%l2,	%g1
	edge32n	%l3,	%i6,	%l1
	fmovdcs	%xcc,	%f26,	%f12
	edge32n	%l5,	%i4,	%o1
	alignaddr	%i1,	%o6,	%g3
	xnor	%g7,	%i2,	%l6
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	srax	%i3,	0x07,	%o4
	lduh	[%l7 + 0x7E],	%g4
	mulx	%o0,	0x1651,	%o3
	add	%o7,	%g5,	%i0
	movrne	%i5,	0x110,	%g6
	ld	[%l7 + 0x3C],	%f26
	fxor	%f16,	%f22,	%f0
	mulx	%g2,	%l4,	%o5
	subcc	%l2,	%i7,	%l3
	edge16	%g1,	%i6,	%l5
	fnor	%f26,	%f18,	%f26
	stx	%l1,	[%l7 + 0x48]
	alignaddrl	%o1,	%i1,	%i4
	ldub	[%l7 + 0x6B],	%o6
	fcmpne32	%f2,	%f8,	%g3
	fmovsg	%icc,	%f21,	%f27
	sethi	0x0563,	%i2
	orncc	%g7,	%l6,	%l0
	addccc	%o2,	0x1EA6,	%i3
	movn	%icc,	%o4,	%g4
	addc	%o3,	%o0,	%g5
	movvc	%xcc,	%i0,	%i5
	edge16n	%o7,	%g2,	%g6
	umul	%o5,	0x03D1,	%l2
	sdivx	%i7,	0x1FA1,	%l4
	move	%icc,	%l3,	%g1
	fpackfix	%f18,	%f30
	movge	%xcc,	%i6,	%l5
	edge32n	%l1,	%i1,	%o1
	alignaddrl	%i4,	%o6,	%i2
	orn	%g7,	0x19CE,	%l6
	fpackfix	%f6,	%f20
	fnors	%f7,	%f4,	%f22
	xorcc	%l0,	0x18FE,	%o2
	edge16	%g3,	%o4,	%g4
	subccc	%o3,	0x1812,	%i3
	save %g5, 0x0994, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%i5
	edge8ln	%o7,	%g2,	%g6
	fmovda	%xcc,	%f10,	%f29
	fcmpne16	%f6,	%f16,	%o0
	movrgz	%o5,	0x202,	%i7
	ldx	[%l7 + 0x18],	%l4
	and	%l2,	0x1B3B,	%l3
	fmovrdgez	%i6,	%f20,	%f26
	ldub	[%l7 + 0x69],	%l5
	fmovd	%f16,	%f16
	sth	%l1,	[%l7 + 0x7C]
	sdivcc	%i1,	0x09F9,	%o1
	array32	%g1,	%i4,	%o6
	fmovsneg	%xcc,	%f2,	%f17
	sllx	%i2,	0x14,	%g7
	mova	%icc,	%l0,	%o2
	movrgz	%g3,	0x21E,	%o4
	orn	%g4,	0x169D,	%l6
	ldsh	[%l7 + 0x6C],	%o3
	movrgz	%i3,	%i0,	%g5
	movl	%xcc,	%i5,	%g2
	restore %g6, 0x08CC, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o0,	0x061C,	%i7
	fmovrdgz	%o5,	%f18,	%f22
	edge8l	%l4,	%l2,	%i6
	movle	%xcc,	%l5,	%l1
	addc	%l3,	%i1,	%o1
	subccc	%g1,	0x08D9,	%o6
	edge16l	%i4,	%g7,	%i2
	fmovrse	%o2,	%f30,	%f23
	movrgez	%l0,	0x1E5,	%g3
	fmul8sux16	%f20,	%f0,	%f22
	edge32	%o4,	%l6,	%o3
	array16	%i3,	%i0,	%g5
	std	%f10,	[%l7 + 0x20]
	movcc	%icc,	%i5,	%g4
	and	%g6,	%o7,	%g2
	add	%i7,	0x00D6,	%o5
	movrgz	%l4,	%l2,	%i6
	sdivx	%l5,	0x0442,	%o0
	st	%f20,	[%l7 + 0x58]
	stb	%l1,	[%l7 + 0x20]
	fexpand	%f19,	%f6
	st	%f11,	[%l7 + 0x58]
	edge16ln	%i1,	%o1,	%g1
	xnor	%o6,	0x1434,	%i4
	srlx	%g7,	0x07,	%i2
	mulx	%o2,	%l0,	%g3
	udivx	%o4,	0x1D94,	%l6
	movrne	%l3,	%i3,	%o3
	edge32ln	%g5,	%i5,	%i0
	movrlz	%g4,	0x194,	%g6
	movle	%icc,	%o7,	%g2
	addccc	%o5,	0x0D07,	%i7
	movpos	%icc,	%l4,	%i6
	mulx	%l2,	%o0,	%l1
	sub	%i1,	%l5,	%o1
	fnegd	%f18,	%f14
	xor	%g1,	%i4,	%o6
	srax	%i2,	%o2,	%g7
	sethi	0x025D,	%g3
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	save %i3, 0x0B52, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g5,	%l0
	edge8l	%i5,	%g4,	%g6
	sdivx	%i0,	0x119F,	%g2
	edge16	%o5,	%i7,	%l4
	or	%o7,	%i6,	%l2
	fcmpne16	%f20,	%f24,	%l1
	edge8	%i1,	%l5,	%o1
	edge8	%o0,	%g1,	%o6
	edge8	%i4,	%i2,	%g7
	xor	%o2,	0x0A91,	%g3
	addc	%l6,	0x1DB4,	%o4
	sdiv	%i3,	0x12A6,	%o3
	fcmpes	%fcc1,	%f9,	%f20
	edge16	%g5,	%l3,	%i5
	sdivx	%g4,	0x00BB,	%g6
	movl	%xcc,	%l0,	%g2
	sdivx	%i0,	0x1F07,	%o5
	umulcc	%i7,	0x1D50,	%l4
	movl	%xcc,	%i6,	%l2
	sir	0x0E98
	sdivcc	%l1,	0x10AA,	%i1
	fmul8x16au	%f12,	%f14,	%f2
	ldsh	[%l7 + 0x64],	%o7
	fmovdpos	%xcc,	%f29,	%f4
	mulx	%o1,	0x1DF5,	%o0
	fmuld8sux16	%f2,	%f29,	%f28
	movcs	%xcc,	%l5,	%g1
	fmovdvs	%icc,	%f9,	%f23
	fpsub16	%f12,	%f20,	%f12
	st	%f26,	[%l7 + 0x3C]
	sir	0x05BD
	edge16n	%i4,	%o6,	%i2
	array8	%g7,	%o2,	%g3
	edge32ln	%o4,	%i3,	%o3
	array16	%l6,	%g5,	%l3
	fmovrdgz	%g4,	%f8,	%f8
	fmovscc	%icc,	%f13,	%f11
	fabss	%f3,	%f15
	edge32	%g6,	%i5,	%l0
	sdivcc	%g2,	0x10EE,	%i0
	array32	%o5,	%l4,	%i7
	array32	%l2,	%i6,	%l1
	ldsb	[%l7 + 0x3C],	%i1
	fcmpgt32	%f12,	%f28,	%o7
	edge32n	%o0,	%o1,	%g1
	stx	%l5,	[%l7 + 0x20]
	addc	%i4,	%i2,	%g7
	fmovsle	%icc,	%f16,	%f26
	move	%xcc,	%o2,	%o6
	addc	%o4,	0x06EC,	%i3
	fcmple16	%f6,	%f22,	%o3
	or	%l6,	%g5,	%g3
	movvs	%xcc,	%g4,	%g6
	udivx	%i5,	0x1A51,	%l3
	edge8	%g2,	%l0,	%i0
	edge32ln	%l4,	%i7,	%l2
	movl	%xcc,	%o5,	%l1
	fmovdne	%icc,	%f5,	%f23
	mova	%icc,	%i1,	%o7
	xnorcc	%o0,	%o1,	%i6
	movle	%xcc,	%l5,	%i4
	edge32ln	%g1,	%g7,	%i2
	movle	%xcc,	%o2,	%o6
	stb	%i3,	[%l7 + 0x1E]
	srl	%o4,	%l6,	%o3
	movrlez	%g5,	0x257,	%g3
	fsrc2	%f6,	%f22
	fones	%f19
	ldsh	[%l7 + 0x24],	%g4
	movcc	%icc,	%g6,	%l3
	edge16n	%g2,	%l0,	%i5
	ldsh	[%l7 + 0x5A],	%i0
	fmovrdne	%i7,	%f6,	%f10
	stx	%l4,	[%l7 + 0x50]
	or	%l2,	0x17C4,	%o5
	fmovdpos	%icc,	%f0,	%f16
	faligndata	%f2,	%f0,	%f22
	edge32	%l1,	%i1,	%o7
	fpsub16	%f10,	%f0,	%f14
	sub	%o1,	%i6,	%l5
	edge32l	%o0,	%i4,	%g7
	movrne	%g1,	0x0CF,	%o2
	sll	%i2,	%i3,	%o4
	alignaddr	%l6,	%o6,	%o3
	mova	%xcc,	%g5,	%g3
	movpos	%icc,	%g4,	%g6
	sethi	0x11CF,	%l3
	subc	%l0,	%g2,	%i5
	movn	%xcc,	%i7,	%i0
	edge8ln	%l4,	%l2,	%l1
	fandnot1	%f24,	%f12,	%f2
	fones	%f15
	std	%f20,	[%l7 + 0x70]
	nop
	set	0x28, %g6
	lduh	[%l7 + %g6],	%i1
	addcc	%o7,	%o5,	%i6
	movl	%xcc,	%o1,	%o0
	fxor	%f16,	%f2,	%f30
	movcc	%icc,	%l5,	%g7
	movvc	%xcc,	%i4,	%g1
	stx	%o2,	[%l7 + 0x30]
	movg	%xcc,	%i2,	%o4
	stw	%l6,	[%l7 + 0x2C]
	movrne	%o6,	%o3,	%i3
	fmuld8sux16	%f13,	%f27,	%f4
	for	%f8,	%f2,	%f26
	orn	%g3,	%g4,	%g6
	fcmpeq16	%f8,	%f28,	%l3
	fandnot2	%f20,	%f16,	%f26
	array8	%l0,	%g2,	%g5
	stx	%i7,	[%l7 + 0x28]
	udivx	%i0,	0x1FD0,	%i5
	umulcc	%l4,	%l1,	%l2
	xnorcc	%o7,	%i1,	%o5
	movcc	%xcc,	%i6,	%o0
	movcs	%xcc,	%o1,	%g7
	sra	%i4,	0x05,	%l5
	fmovrdlz	%o2,	%f30,	%f26
	sdivx	%g1,	0x1B6B,	%o4
	popc	%i2,	%l6
	array16	%o3,	%o6,	%g3
	edge8n	%g4,	%g6,	%i3
	restore %l0, 0x170A, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g5,	0x17,	%g2
	fand	%f16,	%f16,	%f4
	edge8	%i0,	%i5,	%l4
	fmovdvc	%xcc,	%f13,	%f5
	lduh	[%l7 + 0x3E],	%i7
	fmovrde	%l1,	%f12,	%f12
	stb	%l2,	[%l7 + 0x3E]
	movrne	%o7,	0x394,	%i1
	ldd	[%l7 + 0x40],	%f28
	siam	0x3
	movre	%o5,	0x1C7,	%i6
	addcc	%o1,	0x1912,	%o0
	stx	%i4,	[%l7 + 0x58]
	srl	%g7,	0x18,	%l5
	movrlz	%g1,	0x16F,	%o2
	smul	%i2,	%o4,	%l6
	fnand	%f16,	%f24,	%f8
	fxors	%f4,	%f5,	%f17
	edge32	%o6,	%o3,	%g4
	ld	[%l7 + 0x6C],	%f1
	nop
	set	0x14, %g7
	stw	%g6,	[%l7 + %g7]
	fnands	%f0,	%f26,	%f6
	save %i3, 0x0F3B, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l3, %l0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g5,	0x0DB1,	%i0
	edge8ln	%i5,	%l4,	%i7
	edge32l	%l2,	%o7,	%l1
	sllx	%o5,	0x0A,	%i1
	movrne	%i6,	%o0,	%i4
	edge16n	%o1,	%g7,	%l5
	andn	%o2,	%i2,	%o4
	popc	%g1,	%l6
	movneg	%icc,	%o3,	%g4
	and	%o6,	%g6,	%g3
	ldd	[%l7 + 0x40],	%f2
	ldd	[%l7 + 0x48],	%f2
	subcc	%i3,	0x12A8,	%l0
	ldd	[%l7 + 0x50],	%g2
	array16	%g5,	%i0,	%i5
	popc	0x18DE,	%l3
	orncc	%i7,	%l4,	%o7
	mulx	%l1,	%o5,	%i1
	movgu	%icc,	%i6,	%o0
	sir	0x014C
	sth	%l2,	[%l7 + 0x70]
	movrgez	%i4,	0x2CA,	%o1
	ld	[%l7 + 0x1C],	%f28
	fornot1s	%f22,	%f10,	%f25
	movvs	%icc,	%l5,	%g7
	movneg	%xcc,	%o2,	%i2
	alignaddr	%g1,	%o4,	%l6
	fcmpd	%fcc3,	%f30,	%f16
	movle	%xcc,	%o3,	%g4
	fmul8x16	%f13,	%f22,	%f20
	movpos	%icc,	%g6,	%o6
	movre	%g3,	%l0,	%g2
	fmovse	%xcc,	%f13,	%f13
	movrgz	%i3,	%g5,	%i0
	umulcc	%l3,	0x11B8,	%i5
	subcc	%l4,	%o7,	%i7
	sth	%o5,	[%l7 + 0x32]
	andncc	%l1,	%i6,	%o0
	fmovdpos	%xcc,	%f31,	%f16
	fabsd	%f16,	%f14
	movl	%icc,	%l2,	%i1
	fcmped	%fcc1,	%f18,	%f22
	sll	%o1,	%i4,	%l5
	ldub	[%l7 + 0x79],	%g7
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	sir	0x0D0F
	std	%f2,	[%l7 + 0x18]
	movleu	%xcc,	%l6,	%o3
	edge8l	%g4,	%o4,	%g6
	udiv	%g3,	0x19F3,	%l0
	movrgez	%g2,	0x376,	%o6
	array32	%i3,	%i0,	%l3
	fmovsn	%icc,	%f31,	%f12
	array16	%g5,	%i5,	%l4
	srax	%i7,	%o5,	%o7
	sra	%l1,	%o0,	%i6
	save %l2, %o1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l5,	0x1FD5,	%g7
	subcc	%o2,	0x13C8,	%g1
	movne	%icc,	%i4,	%l6
	movgu	%xcc,	%i2,	%o3
	lduh	[%l7 + 0x1A],	%o4
	fmovdleu	%icc,	%f12,	%f2
	movrgez	%g4,	%g3,	%l0
	fnegd	%f18,	%f14
	edge32l	%g6,	%g2,	%i3
	movrne	%i0,	%o6,	%l3
	movrgez	%i5,	%g5,	%l4
	fmovdn	%xcc,	%f1,	%f3
	edge16ln	%i7,	%o5,	%o7
	movvc	%xcc,	%o0,	%l1
	orn	%l2,	0x1DD5,	%o1
	edge8n	%i6,	%l5,	%i1
	movl	%xcc,	%o2,	%g1
	mova	%icc,	%g7,	%l6
	movrgez	%i2,	%i4,	%o4
	movle	%icc,	%o3,	%g4
	sllx	%g3,	0x13,	%l0
	ldd	[%l7 + 0x20],	%f8
	alignaddrl	%g6,	%g2,	%i3
	edge32n	%o6,	%i0,	%i5
	edge16n	%l3,	%l4,	%g5
	movg	%icc,	%o5,	%o7
	fmovsl	%icc,	%f11,	%f0
	movne	%icc,	%o0,	%l1
	movl	%icc,	%i7,	%o1
	sub	%i6,	%l2,	%l5
	fnors	%f0,	%f9,	%f4
	sir	0x1C34
	fexpand	%f11,	%f14
	fpadd32s	%f12,	%f22,	%f22
	sdivx	%o2,	0x0484,	%i1
	fmovdn	%icc,	%f16,	%f28
	ldd	[%l7 + 0x70],	%f16
	movvs	%icc,	%g7,	%l6
	sll	%i2,	0x0F,	%i4
	stw	%g1,	[%l7 + 0x50]
	movpos	%icc,	%o4,	%o3
	subcc	%g4,	0x0FBC,	%l0
	stw	%g6,	[%l7 + 0x10]
	array32	%g2,	%g3,	%o6
	xnorcc	%i3,	0x1754,	%i0
	alignaddrl	%i5,	%l3,	%l4
	subccc	%g5,	%o7,	%o0
	movne	%icc,	%o5,	%i7
	xnor	%o1,	%l1,	%l2
	ldd	[%l7 + 0x38],	%f10
	movn	%xcc,	%i6,	%o2
	movn	%xcc,	%l5,	%g7
	movrlez	%l6,	0x2BB,	%i1
	movrgez	%i4,	0x2A8,	%i2
	edge8	%g1,	%o4,	%o3
	andcc	%g4,	0x0845,	%l0
	ldsw	[%l7 + 0x60],	%g2
	movleu	%icc,	%g6,	%o6
	smulcc	%g3,	%i0,	%i5
	sdivx	%i3,	0x12E7,	%l3
	restore %g5, 0x1528, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f20,	%f29
	umul	%o0,	%o5,	%o7
	movl	%xcc,	%o1,	%l1
	array32	%l2,	%i6,	%i7
	fmul8x16au	%f6,	%f7,	%f22
	std	%f4,	[%l7 + 0x28]
	fmovsn	%xcc,	%f19,	%f22
	sub	%o2,	%g7,	%l6
	fabss	%f24,	%f24
	stb	%i1,	[%l7 + 0x0D]
	edge8	%l5,	%i2,	%i4
	movneg	%icc,	%o4,	%g1
	addcc	%g4,	%l0,	%o3
	srlx	%g2,	%g6,	%g3
	smul	%i0,	%o6,	%i5
	movrlez	%i3,	%g5,	%l3
	ldsh	[%l7 + 0x32],	%o0
	stw	%o5,	[%l7 + 0x38]
	xnor	%l4,	%o1,	%l1
	popc	0x1160,	%o7
	fmovrdgz	%i6,	%f30,	%f20
	nop
	set	0x42, %i5
	stb	%i7,	[%l7 + %i5]
	stw	%l2,	[%l7 + 0x58]
	sll	%g7,	0x1D,	%l6
	xnor	%o2,	0x0EC7,	%l5
	edge16	%i1,	%i2,	%i4
	fornot1	%f16,	%f22,	%f8
	subccc	%g1,	0x0317,	%o4
	fmovs	%f15,	%f22
	ldd	[%l7 + 0x78],	%f0
	sra	%l0,	%o3,	%g4
	std	%f16,	[%l7 + 0x70]
	ld	[%l7 + 0x7C],	%f12
	edge32ln	%g2,	%g3,	%i0
	edge32ln	%o6,	%g6,	%i5
	movrlz	%g5,	0x024,	%i3
	fmovrsgez	%l3,	%f15,	%f18
	sll	%o5,	0x17,	%o0
	sethi	0x08FA,	%l4
	orcc	%l1,	0x0E2C,	%o1
	fpadd16	%f6,	%f10,	%f22
	umul	%i6,	0x18E9,	%o7
	udivx	%i7,	0x1AF4,	%g7
	movvs	%icc,	%l6,	%o2
	fmovsn	%xcc,	%f9,	%f27
	subc	%l2,	%l5,	%i1
	ldsb	[%l7 + 0x4C],	%i2
	subccc	%g1,	0x01A2,	%i4
	movne	%xcc,	%o4,	%l0
	fmovdg	%icc,	%f12,	%f11
	alignaddr	%o3,	%g2,	%g4
	fmovscs	%icc,	%f9,	%f31
	array8	%i0,	%o6,	%g6
	move	%icc,	%g3,	%g5
	addcc	%i5,	0x066A,	%i3
	ldsh	[%l7 + 0x60],	%l3
	andcc	%o5,	0x1A75,	%l4
	sdiv	%l1,	0x0013,	%o1
	fmovsn	%icc,	%f4,	%f2
	ldub	[%l7 + 0x6F],	%i6
	fnot1	%f8,	%f14
	sll	%o0,	%i7,	%g7
	fnor	%f22,	%f8,	%f6
	fcmpgt32	%f12,	%f14,	%o7
	movvc	%xcc,	%l6,	%o2
	fmovrdgez	%l2,	%f16,	%f14
	fmul8sux16	%f10,	%f28,	%f28
	umulcc	%l5,	0x0C0A,	%i1
	edge8l	%i2,	%i4,	%o4
	smul	%l0,	0x0668,	%o3
	add	%g1,	%g2,	%i0
	fornot2	%f26,	%f4,	%f28
	movre	%o6,	%g4,	%g6
	movvc	%xcc,	%g3,	%g5
	sir	0x097D
	srax	%i5,	%i3,	%o5
	movre	%l3,	%l4,	%l1
	andn	%i6,	%o1,	%i7
	xnorcc	%o0,	%g7,	%l6
	orncc	%o7,	0x0157,	%o2
	movl	%xcc,	%l5,	%i1
	stb	%i2,	[%l7 + 0x5F]
	movn	%xcc,	%l2,	%o4
	fsrc2s	%f6,	%f8
	alignaddrl	%i4,	%o3,	%l0
	movgu	%icc,	%g2,	%i0
	array16	%g1,	%g4,	%o6
	movpos	%icc,	%g3,	%g5
	ldx	[%l7 + 0x60],	%g6
	array32	%i5,	%o5,	%l3
	edge32	%i3,	%l1,	%l4
	movrgez	%o1,	0x36F,	%i6
	srl	%o0,	%g7,	%l6
	smulcc	%i7,	0x1880,	%o2
	movne	%xcc,	%l5,	%i1
	movrlez	%o7,	%l2,	%o4
	subccc	%i4,	%o3,	%l0
	orcc	%i2,	%g2,	%g1
	lduw	[%l7 + 0x74],	%g4
	movpos	%xcc,	%i0,	%o6
	and	%g3,	0x1018,	%g5
	fmovs	%f8,	%f15
	nop
	set	0x20, %i2
	stw	%g6,	[%l7 + %i2]
	addc	%o5,	0x0EA0,	%l3
	edge16l	%i5,	%i3,	%l4
	and	%o1,	%i6,	%o0
	stx	%g7,	[%l7 + 0x78]
	or	%l6,	%i7,	%l1
	ldsh	[%l7 + 0x46],	%l5
	fmovdvs	%xcc,	%f4,	%f29
	movrgez	%o2,	0x343,	%o7
	edge16l	%i1,	%o4,	%i4
	faligndata	%f16,	%f22,	%f30
	srlx	%o3,	0x02,	%l0
	movcs	%icc,	%i2,	%l2
	fxors	%f5,	%f22,	%f31
	edge32	%g2,	%g1,	%g4
	xnor	%o6,	%g3,	%i0
	edge32l	%g5,	%g6,	%l3
	orncc	%o5,	0x1457,	%i3
	fnot1	%f4,	%f28
	movn	%xcc,	%l4,	%o1
	edge32ln	%i5,	%o0,	%g7
	fzero	%f18
	fmovrslz	%i6,	%f2,	%f27
	edge32n	%i7,	%l1,	%l5
	alignaddrl	%l6,	%o7,	%o2
	fmul8sux16	%f26,	%f24,	%f24
	for	%f28,	%f2,	%f2
	fmovscc	%xcc,	%f0,	%f13
	sir	0x16C9
	fabss	%f25,	%f26
	sll	%o4,	%i4,	%i1
	fmuld8sux16	%f4,	%f21,	%f6
	mova	%icc,	%o3,	%l0
	movle	%icc,	%l2,	%g2
	xnorcc	%i2,	%g4,	%g1
	mova	%icc,	%g3,	%i0
	nop
	set	0x40, %g1
	lduh	[%l7 + %g1],	%o6
	xnorcc	%g6,	0x0903,	%g5
	sra	%l3,	%o5,	%i3
	move	%icc,	%o1,	%l4
	movcs	%icc,	%o0,	%i5
	andcc	%i6,	%i7,	%l1
	or	%l5,	0x1594,	%l6
	subcc	%g7,	%o7,	%o2
	ld	[%l7 + 0x20],	%f0
	edge32	%o4,	%i1,	%i4
	ldd	[%l7 + 0x58],	%f10
	movpos	%icc,	%o3,	%l2
	edge32ln	%l0,	%i2,	%g2
	umulcc	%g1,	%g3,	%g4
	std	%f10,	[%l7 + 0x20]
	edge32ln	%o6,	%g6,	%i0
	fmovs	%f7,	%f4
	fandnot1	%f6,	%f26,	%f10
	sub	%l3,	%o5,	%g5
	subccc	%i3,	%o1,	%o0
	movne	%icc,	%i5,	%l4
	stw	%i7,	[%l7 + 0x3C]
	srlx	%i6,	%l5,	%l6
	sdiv	%l1,	0x0F25,	%g7
	stw	%o7,	[%l7 + 0x10]
	fcmpne32	%f18,	%f22,	%o2
	subc	%i1,	%i4,	%o3
	fmovdleu	%xcc,	%f25,	%f7
	fmul8x16	%f25,	%f8,	%f0
	stw	%l2,	[%l7 + 0x50]
	ld	[%l7 + 0x30],	%f28
	addc	%l0,	%i2,	%g2
	movcc	%icc,	%g1,	%g3
	fandnot2	%f18,	%f10,	%f14
	movre	%o4,	0x01A,	%g4
	movcc	%icc,	%g6,	%o6
	and	%l3,	%i0,	%g5
	movpos	%icc,	%o5,	%i3
	fcmpne16	%f4,	%f16,	%o1
	fmovsne	%icc,	%f29,	%f24
	sethi	0x0F5E,	%o0
	mulscc	%i5,	%i7,	%l4
	movcs	%icc,	%l5,	%i6
	udivx	%l1,	0x0066,	%g7
	for	%f16,	%f22,	%f8
	umul	%o7,	%o2,	%i1
	ldd	[%l7 + 0x20],	%i4
	fmovspos	%xcc,	%f4,	%f17
	umulcc	%l6,	%l2,	%o3
	umulcc	%l0,	%i2,	%g1
	edge32ln	%g3,	%o4,	%g4
	fcmpgt32	%f28,	%f8,	%g6
	edge32	%g2,	%o6,	%l3
	alignaddrl	%g5,	%i0,	%o5
	edge8ln	%i3,	%o1,	%o0
	stx	%i5,	[%l7 + 0x58]
	edge32	%i7,	%l4,	%l5
	ldsw	[%l7 + 0x58],	%i6
	umul	%l1,	0x188C,	%g7
	ldd	[%l7 + 0x70],	%o6
	subcc	%i1,	%i4,	%o2
	xorcc	%l2,	0x02BD,	%l6
	sethi	0x0A06,	%o3
	addc	%i2,	0x0F73,	%l0
	fmovsge	%icc,	%f9,	%f25
	fnot1s	%f12,	%f15
	fcmpne16	%f14,	%f12,	%g3
	fmovrse	%g1,	%f3,	%f26
	array8	%g4,	%o4,	%g6
	fcmpgt16	%f18,	%f18,	%g2
	stw	%l3,	[%l7 + 0x64]
	andncc	%o6,	%i0,	%g5
	movrgez	%o5,	0x04C,	%o1
	movpos	%icc,	%i3,	%i5
	edge32n	%i7,	%l4,	%l5
	fmovse	%icc,	%f21,	%f7
	lduh	[%l7 + 0x0A],	%i6
	umulcc	%o0,	%g7,	%o7
	sdivx	%l1,	0x153B,	%i1
	movcc	%icc,	%i4,	%l2
	movvc	%xcc,	%l6,	%o3
	subcc	%i2,	%o2,	%l0
	sll	%g1,	0x0B,	%g3
	movrlez	%o4,	%g6,	%g4
	array32	%g2,	%o6,	%l3
	sir	0x109B
	or	%g5,	%i0,	%o5
	fnot2s	%f15,	%f31
	xor	%o1,	%i5,	%i7
	edge8n	%i3,	%l4,	%i6
	addcc	%l5,	0x13AC,	%g7
	movre	%o0,	0x062,	%l1
	and	%o7,	%i1,	%l2
	movcc	%icc,	%l6,	%i4
	ldx	[%l7 + 0x10],	%i2
	andn	%o2,	%l0,	%g1
	array32	%o3,	%o4,	%g6
	addccc	%g4,	0x0C42,	%g3
	ldsb	[%l7 + 0x3C],	%o6
	mova	%icc,	%l3,	%g5
	xor	%g2,	0x0542,	%i0
	ldsb	[%l7 + 0x43],	%o1
	or	%o5,	%i7,	%i3
	movleu	%xcc,	%i5,	%l4
	movneg	%icc,	%l5,	%g7
	fmovsleu	%icc,	%f30,	%f27
	smul	%o0,	0x17B4,	%l1
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	fmovda	%xcc,	%f28,	%f13
	movcs	%icc,	%l6,	%i4
	fpsub16	%f8,	%f26,	%f8
	fmovde	%xcc,	%f21,	%f11
	umul	%i2,	%l2,	%l0
	orcc	%o2,	0x0799,	%o3
	fmovd	%f30,	%f12
	fcmpgt32	%f24,	%f18,	%o4
	fmovscs	%icc,	%f28,	%f1
	smul	%g6,	0x13D8,	%g1
	movpos	%xcc,	%g4,	%g3
	edge16ln	%l3,	%o6,	%g5
	movne	%xcc,	%g2,	%o1
	popc	0x04E8,	%o5
	fmovrsgz	%i7,	%f8,	%f16
	ldsb	[%l7 + 0x17],	%i3
	ldd	[%l7 + 0x08],	%f2
	move	%xcc,	%i0,	%l4
	fpack16	%f14,	%f18
	array16	%i5,	%l5,	%g7
	sllx	%l1,	%o7,	%i1
	addc	%i6,	%l6,	%i4
	movvc	%icc,	%o0,	%i2
	fpsub16	%f16,	%f20,	%f18
	mulscc	%l0,	%l2,	%o3
	st	%f3,	[%l7 + 0x14]
	edge8n	%o4,	%o2,	%g6
	alignaddr	%g4,	%g3,	%g1
	edge32n	%o6,	%l3,	%g5
	fmovdpos	%xcc,	%f24,	%f26
	sdivx	%g2,	0x1801,	%o5
	sdivx	%o1,	0x02C9,	%i7
	stx	%i3,	[%l7 + 0x38]
	fmovdgu	%icc,	%f20,	%f8
	sdiv	%i0,	0x0AEB,	%l4
	alignaddr	%i5,	%g7,	%l5
	sth	%o7,	[%l7 + 0x70]
	xorcc	%i1,	%i6,	%l1
	umulcc	%l6,	%i4,	%o0
	subcc	%l0,	%i2,	%o3
	popc	%o4,	%o2
	ldx	[%l7 + 0x10],	%g6
	stx	%l2,	[%l7 + 0x70]
	smul	%g4,	0x169B,	%g3
	edge8	%o6,	%g1,	%g5
	addc	%l3,	%o5,	%o1
	addccc	%g2,	%i7,	%i0
	movle	%xcc,	%l4,	%i3
	fsrc2	%f10,	%f28
	movpos	%xcc,	%i5,	%g7
	ldd	[%l7 + 0x60],	%f18
	movrlz	%o7,	%i1,	%l5
	fand	%f18,	%f14,	%f0
	fands	%f22,	%f27,	%f8
	alignaddr	%i6,	%l1,	%l6
	andn	%o0,	0x084E,	%l0
	edge16	%i4,	%o3,	%o4
	srax	%o2,	0x08,	%i2
	movleu	%icc,	%g6,	%g4
	fmovrdlez	%g3,	%f10,	%f0
	mulscc	%o6,	%l2,	%g5
	add	%l3,	%g1,	%o1
	fpsub16	%f14,	%f24,	%f8
	xorcc	%o5,	%i7,	%i0
	st	%f12,	[%l7 + 0x1C]
	lduh	[%l7 + 0x6A],	%l4
	xor	%i3,	0x1BD5,	%i5
	fmovscs	%xcc,	%f27,	%f1
	movneg	%xcc,	%g7,	%g2
	movleu	%icc,	%o7,	%i1
	movg	%icc,	%l5,	%l1
	movge	%icc,	%l6,	%o0
	edge8n	%i6,	%i4,	%l0
	popc	%o3,	%o4
	edge16l	%o2,	%i2,	%g6
	orn	%g4,	0x05D8,	%g3
	ldsh	[%l7 + 0x30],	%l2
	array16	%g5,	%o6,	%l3
	movne	%xcc,	%g1,	%o5
	ldd	[%l7 + 0x30],	%f12
	fpadd16	%f26,	%f10,	%f4
	ld	[%l7 + 0x58],	%f2
	move	%icc,	%o1,	%i7
	mulscc	%i0,	0x0B4C,	%i3
	ldd	[%l7 + 0x50],	%l4
	movl	%icc,	%i5,	%g2
	stw	%o7,	[%l7 + 0x38]
	add	%g7,	%l5,	%i1
	fmovda	%xcc,	%f12,	%f15
	fpsub16s	%f5,	%f16,	%f15
	xnorcc	%l1,	%l6,	%i6
	edge8	%o0,	%l0,	%i4
	orn	%o3,	%o4,	%o2
	alignaddr	%g6,	%i2,	%g4
	sethi	0x1C5B,	%g3
	std	%f24,	[%l7 + 0x28]
	xnor	%g5,	%l2,	%o6
	sll	%g1,	%l3,	%o5
	xnor	%i7,	0x1CC8,	%o1
	lduw	[%l7 + 0x28],	%i0
	sllx	%l4,	%i3,	%g2
	sll	%o7,	0x09,	%g7
	movrlz	%l5,	0x296,	%i5
	fors	%f4,	%f1,	%f22
	or	%i1,	0x18CD,	%l6
	lduw	[%l7 + 0x10],	%i6
	fxnors	%f17,	%f26,	%f17
	movre	%l1,	0x0C4,	%l0
	st	%f4,	[%l7 + 0x5C]
	fxnor	%f18,	%f28,	%f18
	srl	%o0,	%o3,	%i4
	sir	0x0AD9
	fmovsneg	%icc,	%f20,	%f8
	edge32n	%o4,	%g6,	%o2
	movne	%icc,	%g4,	%i2
	sub	%g5,	0x1585,	%l2
	movcc	%icc,	%o6,	%g3
	fnand	%f0,	%f30,	%f24
	subccc	%l3,	0x0AB6,	%g1
	orcc	%i7,	%o5,	%o1
	lduh	[%l7 + 0x1E],	%i0
	orncc	%i3,	%l4,	%o7
	fmovrse	%g7,	%f5,	%f26
	ldd	[%l7 + 0x40],	%f4
	fmovsne	%xcc,	%f20,	%f6
	udivx	%g2,	0x105D,	%i5
	xnor	%l5,	0x101D,	%l6
	edge8l	%i1,	%l1,	%l0
	fmovdleu	%icc,	%f17,	%f0
	fcmple16	%f8,	%f14,	%o0
	fcmple16	%f18,	%f26,	%o3
	addc	%i4,	0x15EA,	%i6
	array32	%g6,	%o4,	%g4
	add	%o2,	0x054E,	%i2
	movn	%xcc,	%l2,	%o6
	fmul8sux16	%f26,	%f6,	%f26
	sra	%g5,	0x02,	%g3
	alignaddr	%l3,	%g1,	%i7
	xorcc	%o1,	0x04D3,	%o5
	srlx	%i0,	0x1B,	%i3
	fmovdne	%xcc,	%f12,	%f0
	or	%o7,	0x0F3C,	%g7
	save %l4, 0x1223, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f21,	%f11,	%f5
	lduw	[%l7 + 0x7C],	%i5
	subcc	%l5,	0x08ED,	%i1
	edge32	%l6,	%l1,	%l0
	movrne	%o0,	0x078,	%o3
	fmovdn	%icc,	%f6,	%f21
	sllx	%i4,	0x0E,	%i6
	fmovrdlz	%o4,	%f10,	%f6
	sir	0x0941
	andncc	%g6,	%g4,	%o2
	movrlz	%i2,	0x2F1,	%l2
	ldub	[%l7 + 0x73],	%g5
	array8	%g3,	%l3,	%o6
	movn	%icc,	%i7,	%o1
	umul	%g1,	%i0,	%o5
	edge16ln	%o7,	%g7,	%l4
	faligndata	%f26,	%f4,	%f2
	restore %i3, 0x16E6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	0x1F,	%i1
	movl	%xcc,	%l5,	%l1
	srl	%l6,	0x1F,	%l0
	edge16ln	%o0,	%i4,	%i6
	alignaddr	%o4,	%g6,	%o3
	ldd	[%l7 + 0x70],	%o2
	mova	%xcc,	%g4,	%i2
	umulcc	%g5,	%g3,	%l2
	fzero	%f24
	subcc	%l3,	%i7,	%o6
	or	%g1,	%i0,	%o1
	sll	%o5,	0x16,	%g7
	ldd	[%l7 + 0x78],	%f22
	fxnors	%f21,	%f16,	%f21
	movre	%l4,	0x1F8,	%o7
	movrgez	%i3,	0x02A,	%g2
	fxnor	%f22,	%f26,	%f18
	or	%i5,	0x081E,	%l5
	fmovrse	%i1,	%f18,	%f28
	movl	%xcc,	%l1,	%l6
	pdist	%f8,	%f16,	%f20
	fmovdge	%xcc,	%f29,	%f22
	fmovrsne	%o0,	%f21,	%f21
	sethi	0x0D37,	%l0
	sdivcc	%i6,	0x0D68,	%i4
	movrgz	%g6,	0x240,	%o3
	movcs	%icc,	%o2,	%g4
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	udivcc	%g3,	0x192B,	%i2
	andncc	%l3,	%l2,	%i7
	and	%g1,	0x03EB,	%i0
	fabss	%f15,	%f9
	ldsw	[%l7 + 0x20],	%o6
	umulcc	%o5,	0x0CB7,	%g7
	subc	%l4,	%o7,	%i3
	edge16l	%o1,	%g2,	%i5
	ldsb	[%l7 + 0x17],	%i1
	fmovde	%xcc,	%f10,	%f26
	fcmpes	%fcc2,	%f22,	%f26
	stw	%l5,	[%l7 + 0x70]
	edge32ln	%l6,	%l1,	%o0
	addc	%i6,	0x135C,	%l0
	fmovsn	%xcc,	%f28,	%f15
	subcc	%g6,	%o3,	%o2
	ldsb	[%l7 + 0x3C],	%g4
	sth	%o4,	[%l7 + 0x50]
	subcc	%i4,	0x0D8A,	%g3
	udivx	%g5,	0x12EB,	%l3
	fpack16	%f14,	%f13
	subc	%l2,	0x137E,	%i7
	std	%f12,	[%l7 + 0x70]
	fmovdge	%icc,	%f17,	%f12
	addc	%g1,	0x186B,	%i0
	edge32l	%o6,	%i2,	%g7
	array16	%o5,	%o7,	%i3
	fmovsle	%icc,	%f17,	%f7
	edge32n	%l4,	%g2,	%i5
	movpos	%icc,	%i1,	%l5
	movleu	%xcc,	%o1,	%l6
	edge16ln	%o0,	%l1,	%i6
	restore %g6, 0x1661, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o2,	%o3
	edge16n	%g4,	%o4,	%g3
	fmovse	%xcc,	%f10,	%f12
	edge32	%i4,	%l3,	%l2
	fmovdneg	%xcc,	%f7,	%f9
	array8	%i7,	%g1,	%i0
	fzeros	%f20
	movcc	%icc,	%o6,	%i2
	movn	%icc,	%g5,	%o5
	std	%f2,	[%l7 + 0x18]
	add	%g7,	%i3,	%l4
	array16	%g2,	%i5,	%o7
	movrlez	%i1,	%o1,	%l6
	fmovse	%icc,	%f12,	%f9
	movcc	%xcc,	%l5,	%o0
	fpsub16s	%f19,	%f29,	%f21
	addccc	%i6,	%g6,	%l1
	xorcc	%o2,	0x1AAB,	%l0
	edge8l	%o3,	%g4,	%o4
	edge32ln	%i4,	%g3,	%l2
	stx	%l3,	[%l7 + 0x10]
	mova	%xcc,	%g1,	%i0
	ldsw	[%l7 + 0x60],	%i7
	orn	%o6,	%i2,	%o5
	orn	%g5,	0x14E7,	%i3
	fmovsneg	%xcc,	%f17,	%f24
	movvc	%xcc,	%g7,	%l4
	move	%icc,	%g2,	%i5
	fzeros	%f18
	fmovrdgz	%o7,	%f12,	%f12
	movre	%o1,	0x18D,	%i1
	andn	%l5,	0x0BAC,	%l6
	addc	%i6,	%o0,	%g6
	fmovrslz	%o2,	%f20,	%f9
	ldd	[%l7 + 0x58],	%f20
	fcmpeq32	%f20,	%f12,	%l1
	nop
	set	0x5E, %o2
	stb	%l0,	[%l7 + %o2]
	movn	%xcc,	%o3,	%g4
	ldd	[%l7 + 0x28],	%f20
	fcmpne16	%f12,	%f0,	%o4
	subcc	%g3,	%l2,	%i4
	srax	%g1,	%l3,	%i7
	smul	%i0,	0x1C6C,	%o6
	movneg	%xcc,	%o5,	%g5
	sdivx	%i3,	0x15D1,	%g7
	ldsh	[%l7 + 0x76],	%i2
	stx	%g2,	[%l7 + 0x18]
	std	%f30,	[%l7 + 0x20]
	orcc	%i5,	%o7,	%l4
	udivcc	%o1,	0x1716,	%l5
	siam	0x4
	ldsw	[%l7 + 0x50],	%l6
	alignaddrl	%i6,	%i1,	%g6
	udiv	%o0,	0x1712,	%l1
	smul	%o2,	%l0,	%o3
	fcmpeq32	%f26,	%f6,	%g4
	movle	%xcc,	%g3,	%o4
	fandnot1	%f2,	%f30,	%f22
	mova	%xcc,	%l2,	%g1
	subccc	%i4,	0x1BCF,	%i7
	movcc	%xcc,	%l3,	%o6
	addccc	%i0,	0x1DB0,	%o5
	srlx	%i3,	%g7,	%g5
	movrlez	%i2,	%i5,	%o7
	sllx	%l4,	0x09,	%g2
	fnands	%f17,	%f16,	%f9
	std	%f22,	[%l7 + 0x38]
	or	%o1,	%l6,	%i6
	array16	%l5,	%i1,	%o0
	smulcc	%l1,	%o2,	%l0
	andcc	%o3,	0x14D0,	%g4
	move	%xcc,	%g6,	%g3
	sdivcc	%o4,	0x1435,	%g1
	fmul8x16au	%f18,	%f21,	%f2
	stb	%l2,	[%l7 + 0x31]
	fmovrdne	%i4,	%f12,	%f12
	umul	%l3,	%i7,	%i0
	stb	%o6,	[%l7 + 0x3B]
	sllx	%i3,	%o5,	%g7
	addccc	%i2,	0x0189,	%g5
	st	%f0,	[%l7 + 0x34]
	movpos	%xcc,	%i5,	%o7
	fabss	%f6,	%f3
	movleu	%xcc,	%g2,	%o1
	smulcc	%l4,	%i6,	%l5
	ldsw	[%l7 + 0x20],	%i1
	nop
	set	0x1A, %l0
	ldsh	[%l7 + %l0],	%l6
	movle	%xcc,	%l1,	%o2
	fnand	%f22,	%f20,	%f14
	movgu	%xcc,	%o0,	%o3
	edge32ln	%g4,	%l0,	%g3
	sra	%g6,	%g1,	%l2
	movgu	%icc,	%i4,	%o4
	fmovrse	%l3,	%f21,	%f14
	sth	%i7,	[%l7 + 0x1C]
	fandnot2s	%f10,	%f22,	%f12
	fornot1s	%f26,	%f8,	%f18
	udivx	%o6,	0x028C,	%i0
	ldub	[%l7 + 0x5F],	%o5
	srax	%i3,	%i2,	%g5
	sir	0x100B
	lduh	[%l7 + 0x4C],	%g7
	udivx	%o7,	0x024D,	%g2
	st	%f24,	[%l7 + 0x60]
	fandnot2	%f16,	%f20,	%f22
	movgu	%xcc,	%o1,	%i5
	fmovdg	%icc,	%f2,	%f1
	movvc	%icc,	%i6,	%l4
	movrgz	%l5,	0x072,	%i1
	fones	%f12
	udivcc	%l6,	0x06DA,	%o2
	stx	%o0,	[%l7 + 0x48]
	or	%l1,	%g4,	%o3
	movrlez	%g3,	%l0,	%g1
	andn	%g6,	0x1A8E,	%i4
	movcs	%xcc,	%l2,	%o4
	fxnor	%f10,	%f24,	%f22
	fnors	%f8,	%f10,	%f27
	fones	%f13
	popc	%i7,	%l3
	mova	%icc,	%i0,	%o6
	subc	%o5,	0x1328,	%i2
	udiv	%g5,	0x01F2,	%g7
	edge32	%i3,	%o7,	%g2
	movrlz	%o1,	%i6,	%l4
	alignaddrl	%l5,	%i1,	%l6
	fandnot1s	%f18,	%f27,	%f25
	movg	%icc,	%o2,	%o0
	save %l1, 0x1721, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g4,	%g3
	edge32l	%o3,	%l0,	%g6
	move	%icc,	%i4,	%l2
	lduh	[%l7 + 0x1A],	%g1
	udiv	%i7,	0x05C0,	%o4
	subc	%l3,	%o6,	%o5
	movn	%xcc,	%i0,	%i2
	movl	%icc,	%g5,	%g7
	movge	%icc,	%i3,	%g2
	add	%o7,	%i6,	%o1
	std	%f6,	[%l7 + 0x70]
	xnorcc	%l5,	0x067A,	%i1
	fmuld8sux16	%f2,	%f15,	%f30
	pdist	%f24,	%f2,	%f12
	array8	%l6,	%o2,	%o0
	mulscc	%l1,	%i5,	%l4
	fmul8ulx16	%f26,	%f12,	%f12
	fones	%f18
	andn	%g3,	%o3,	%g4
	srlx	%l0,	0x0B,	%g6
	fmovspos	%xcc,	%f17,	%f9
	alignaddr	%l2,	%i4,	%g1
	fcmpgt32	%f22,	%f14,	%o4
	fmovsgu	%icc,	%f26,	%f30
	fmovrdlz	%l3,	%f10,	%f8
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	subcc	%i0,	0x114C,	%i2
	lduh	[%l7 + 0x68],	%g7
	edge32ln	%g5,	%g2,	%i3
	fornot1	%f26,	%f12,	%f20
	fcmpes	%fcc2,	%f26,	%f21
	lduh	[%l7 + 0x3E],	%o7
	edge8	%i6,	%o1,	%i1
	movgu	%icc,	%l6,	%o2
	edge32ln	%l5,	%l1,	%o0
	edge32l	%l4,	%g3,	%i5
	addc	%o3,	%l0,	%g6
	fnot1	%f12,	%f10
	ldsb	[%l7 + 0x78],	%l2
	sdivx	%i4,	0x04AC,	%g4
	fmovsn	%xcc,	%f10,	%f12
	movrgz	%g1,	%o4,	%o6
	array16	%o5,	%l3,	%i7
	std	%f16,	[%l7 + 0x30]
	xor	%i0,	%i2,	%g5
	movrlz	%g7,	%i3,	%o7
	xnorcc	%g2,	0x1D42,	%i6
	srl	%i1,	%l6,	%o1
	restore %o2, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x18],	%l5
	lduh	[%l7 + 0x0A],	%g3
	edge16ln	%i5,	%o3,	%l4
	fandnot2s	%f20,	%f9,	%f13
	edge16n	%g6,	%l0,	%l2
	movre	%g4,	%g1,	%i4
	fmovsvs	%xcc,	%f5,	%f11
	movge	%xcc,	%o6,	%o4
	stx	%l3,	[%l7 + 0x50]
	add	%i7,	0x0351,	%o5
	umulcc	%i2,	%g5,	%i0
	sll	%i3,	0x1B,	%g7
	edge8ln	%g2,	%o7,	%i1
	movrlez	%i6,	0x311,	%l6
	smulcc	%o1,	0x0868,	%o2
	udiv	%o0,	0x0424,	%l1
	andcc	%l5,	%i5,	%o3
	fors	%f0,	%f7,	%f18
	udivcc	%l4,	0x19AD,	%g6
	umulcc	%l0,	0x09E6,	%l2
	stb	%g4,	[%l7 + 0x20]
	movleu	%xcc,	%g1,	%g3
	std	%f28,	[%l7 + 0x10]
	edge16	%i4,	%o4,	%o6
	fandnot1	%f10,	%f6,	%f4
	fmovsl	%xcc,	%f31,	%f19
	xor	%l3,	%o5,	%i7
	udiv	%g5,	0x1FCF,	%i2
	lduw	[%l7 + 0x78],	%i3
	edge16l	%i0,	%g2,	%g7
	andncc	%i1,	%i6,	%l6
	addcc	%o7,	0x0619,	%o2
	movge	%xcc,	%o1,	%l1
	ldsw	[%l7 + 0x7C],	%l5
	save %i5, %o3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	fpsub32	%f10,	%f4,	%f30
	for	%f14,	%f22,	%f14
	edge32l	%l2,	%g4,	%g3
	fmovsa	%xcc,	%f22,	%f24
	movcs	%xcc,	%g1,	%o4
	fandnot1	%f8,	%f28,	%f28
	udiv	%i4,	0x1E0A,	%o6
	movcc	%xcc,	%o5,	%i7
	and	%g5,	0x0538,	%i2
	addc	%l3,	%i3,	%g2
	edge16n	%g7,	%i1,	%i6
	move	%icc,	%l6,	%o7
	udiv	%i0,	0x1EA2,	%o1
	smul	%l1,	%o2,	%i5
	lduw	[%l7 + 0x24],	%l5
	ldx	[%l7 + 0x40],	%o3
	fone	%f16
	fnors	%f30,	%f24,	%f5
	array16	%l4,	%l0,	%g6
	fmovrslez	%o0,	%f9,	%f27
	edge32n	%l2,	%g4,	%g1
	array32	%o4,	%g3,	%o6
	smulcc	%o5,	%i4,	%g5
	orn	%i7,	0x0DF6,	%i2
	srax	%l3,	0x16,	%i3
	umul	%g7,	0x0926,	%g2
	fmovsleu	%xcc,	%f25,	%f21
	andn	%i1,	%l6,	%i6
	fcmpgt32	%f14,	%f28,	%o7
	st	%f14,	[%l7 + 0x30]
	for	%f2,	%f8,	%f0
	ldub	[%l7 + 0x33],	%i0
	smulcc	%l1,	%o2,	%i5
	movneg	%icc,	%l5,	%o3
	edge32	%l4,	%l0,	%o1
	fmovdgu	%icc,	%f5,	%f2
	ldsw	[%l7 + 0x40],	%g6
	andn	%l2,	0x1184,	%o0
	edge16l	%g1,	%o4,	%g4
	movrgez	%o6,	0x336,	%o5
	edge32l	%i4,	%g3,	%g5
	fand	%f8,	%f12,	%f8
	movg	%icc,	%i7,	%i2
	and	%l3,	%i3,	%g7
	edge8l	%i1,	%g2,	%i6
	fcmpeq32	%f6,	%f8,	%o7
	addccc	%i0,	%l1,	%l6
	umulcc	%i5,	0x1074,	%o2
	fabsd	%f20,	%f0
	stw	%o3,	[%l7 + 0x78]
	or	%l4,	0x13D3,	%l0
	edge32	%l5,	%g6,	%o1
	fnot1	%f24,	%f26
	addccc	%o0,	%g1,	%l2
	movrlez	%g4,	%o6,	%o5
	movneg	%icc,	%i4,	%o4
	fmovda	%xcc,	%f11,	%f10
	fmovsl	%icc,	%f16,	%f26
	array8	%g5,	%i7,	%g3
	fmul8x16au	%f26,	%f17,	%f16
	fmovde	%icc,	%f0,	%f17
	fexpand	%f19,	%f26
	mulx	%l3,	0x0DAE,	%i2
	mulx	%i3,	%i1,	%g7
	sethi	0x19D3,	%g2
	movle	%xcc,	%i6,	%o7
	movcc	%icc,	%l1,	%i0
	fmovdg	%xcc,	%f14,	%f27
	fmovsa	%xcc,	%f10,	%f3
	faligndata	%f0,	%f0,	%f2
	add	%l6,	%o2,	%o3
	movg	%icc,	%l4,	%i5
	edge32	%l5,	%g6,	%o1
	fmovsne	%xcc,	%f5,	%f14
	std	%f28,	[%l7 + 0x68]
	edge16	%o0,	%g1,	%l2
	movpos	%icc,	%g4,	%o6
	movgu	%icc,	%l0,	%o5
	array32	%o4,	%g5,	%i7
	ld	[%l7 + 0x14],	%f16
	fmovs	%f20,	%f15
	movle	%xcc,	%g3,	%l3
	sra	%i4,	0x00,	%i3
	sub	%i1,	%i2,	%g7
	movl	%icc,	%g2,	%i6
	addc	%o7,	0x1D8C,	%l1
	udivx	%i0,	0x16A2,	%o2
	andncc	%l6,	%l4,	%i5
	movrgz	%l5,	0x289,	%o3
	sub	%o1,	0x0DB8,	%o0
	xorcc	%g6,	%g1,	%g4
	andn	%l2,	%l0,	%o6
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%o4
	fnot1s	%f9,	%f27
	fmovrsgz	%o5,	%f22,	%f14
	sethi	0x16AC,	%i7
	fmovrsgez	%g3,	%f24,	%f19
	ld	[%l7 + 0x20],	%f24
	andncc	%g5,	%l3,	%i4
	movvc	%icc,	%i3,	%i2
	movn	%icc,	%g7,	%g2
	movleu	%xcc,	%i6,	%i1
	array16	%l1,	%i0,	%o7
	stb	%l6,	[%l7 + 0x27]
	sir	0x19B1
	ld	[%l7 + 0x40],	%f7
	fmovse	%icc,	%f29,	%f8
	save %o2, 0x1E5E, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x78],	%i5
	andn	%o3,	0x0EB2,	%l5
	udiv	%o0,	0x1584,	%o1
	fandnot2s	%f6,	%f11,	%f19
	udivcc	%g6,	0x1093,	%g4
	movre	%l2,	%g1,	%o6
	subcc	%l0,	%o4,	%i7
	edge32l	%o5,	%g5,	%l3
	srax	%g3,	%i3,	%i2
	array32	%g7,	%i4,	%i6
	orcc	%g2,	%l1,	%i0
	movge	%xcc,	%i1,	%l6
	edge16ln	%o2,	%o7,	%l4
	movcs	%xcc,	%o3,	%i5
	mulscc	%o0,	%l5,	%g6
	smulcc	%g4,	%o1,	%g1
	ld	[%l7 + 0x7C],	%f20
	ldd	[%l7 + 0x38],	%f30
	save %o6, 0x1E36, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o4,	%i7,	%o5
	movpos	%xcc,	%g5,	%l0
	sth	%l3,	[%l7 + 0x0A]
	edge8ln	%g3,	%i3,	%i2
	lduh	[%l7 + 0x26],	%g7
	ldsb	[%l7 + 0x15],	%i6
	alignaddrl	%i4,	%l1,	%i0
	edge16l	%g2,	%i1,	%o2
	smul	%l6,	0x007F,	%l4
	addc	%o3,	0x10DF,	%i5
	umulcc	%o0,	0x1141,	%o7
	fmovsvc	%icc,	%f28,	%f3
	orcc	%l5,	%g4,	%g6
	edge32l	%o1,	%g1,	%l2
	popc	%o6,	%o4
	srlx	%i7,	%g5,	%o5
	sll	%l3,	0x14,	%g3
	smulcc	%i3,	0x07BB,	%l0
	stb	%i2,	[%l7 + 0x6F]
	movg	%xcc,	%g7,	%i6
	or	%i4,	%l1,	%i0
	movle	%icc,	%g2,	%o2
	lduw	[%l7 + 0x54],	%l6
	movpos	%icc,	%l4,	%o3
	movrlz	%i5,	%o0,	%o7
	movgu	%icc,	%i1,	%l5
	movgu	%xcc,	%g4,	%o1
	udivx	%g6,	0x09F5,	%g1
	siam	0x2
	addcc	%o6,	0x1413,	%o4
	movgu	%icc,	%l2,	%i7
	addccc	%g5,	0x0B00,	%l3
	smulcc	%o5,	%i3,	%l0
	subcc	%g3,	0x0D45,	%i2
	fandnot2s	%f17,	%f9,	%f18
	lduw	[%l7 + 0x0C],	%i6
	subcc	%g7,	%i4,	%i0
	fpadd16	%f30,	%f26,	%f4
	xnorcc	%l1,	%o2,	%g2
	edge16	%l4,	%l6,	%i5
	lduh	[%l7 + 0x76],	%o3
	ldx	[%l7 + 0x38],	%o0
	stw	%i1,	[%l7 + 0x4C]
	srlx	%o7,	0x12,	%l5
	fmovscc	%icc,	%f29,	%f24
	bshuffle	%f20,	%f30,	%f24
	restore %o1, %g4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g1,	%o6,	%o4
	fcmps	%fcc0,	%f17,	%f25
	sethi	0x1228,	%i7
	sir	0x19F6
	orn	%l2,	%l3,	%o5
	stb	%g5,	[%l7 + 0x30]
	fmovdpos	%xcc,	%f7,	%f8
	movrlez	%i3,	0x1AB,	%g3
	sdivx	%l0,	0x02FF,	%i6
	andncc	%g7,	%i2,	%i4
	sth	%i0,	[%l7 + 0x52]
	nop
	set	0x0C, %i6
	sth	%l1,	[%l7 + %i6]
	fsrc2s	%f10,	%f22
	move	%icc,	%o2,	%l4
	ld	[%l7 + 0x64],	%f13
	fnors	%f19,	%f21,	%f0
	movn	%xcc,	%g2,	%i5
	movcs	%icc,	%l6,	%o0
	fandnot2	%f16,	%f6,	%f26
	mulx	%o3,	0x141A,	%i1
	udivx	%l5,	0x1F57,	%o7
	fpsub32s	%f19,	%f17,	%f4
	fmovsa	%icc,	%f15,	%f11
	subcc	%o1,	%g4,	%g1
	ldsw	[%l7 + 0x38],	%g6
	movvs	%icc,	%o4,	%i7
	popc	%o6,	%l3
	xor	%o5,	%g5,	%l2
	edge32l	%g3,	%i3,	%l0
	edge16	%i6,	%i2,	%g7
	and	%i0,	0x1054,	%l1
	or	%o2,	%l4,	%g2
	sir	0x1EF8
	xorcc	%i4,	%i5,	%o0
	edge32	%l6,	%o3,	%i1
	edge32	%o7,	%l5,	%o1
	movrgz	%g4,	0x009,	%g1
	fmovdn	%xcc,	%f19,	%f14
	ld	[%l7 + 0x74],	%f12
	movn	%xcc,	%o4,	%g6
	fnands	%f19,	%f0,	%f14
	subcc	%o6,	0x0749,	%l3
	andncc	%o5,	%i7,	%l2
	mulscc	%g3,	%g5,	%i3
	edge8n	%i6,	%l0,	%i2
	nop
	set	0x08, %g2
	stx	%i0,	[%l7 + %g2]
	smul	%g7,	%o2,	%l4
	pdist	%f30,	%f0,	%f0
	fmovdl	%icc,	%f11,	%f27
	orncc	%g2,	0x07CF,	%i4
	or	%i5,	0x0F08,	%l1
	andn	%o0,	%l6,	%o3
	fmovscc	%icc,	%f26,	%f3
	edge32n	%i1,	%o7,	%o1
	umulcc	%g4,	%l5,	%o4
	alignaddr	%g1,	%g6,	%l3
	ldsw	[%l7 + 0x24],	%o5
	andn	%i7,	0x10D8,	%o6
	orn	%l2,	0x0A39,	%g3
	addcc	%g5,	%i6,	%i3
	xnor	%l0,	0x1F7E,	%i2
	movrlz	%i0,	0x2D9,	%o2
	std	%f10,	[%l7 + 0x60]
	fpadd16s	%f20,	%f19,	%f31
	fmovrslez	%g7,	%f16,	%f28
	movrgz	%g2,	0x24E,	%l4
	sethi	0x1D63,	%i5
	sth	%i4,	[%l7 + 0x38]
	popc	%l1,	%o0
	ld	[%l7 + 0x1C],	%f19
	nop
	set	0x47, %i4
	ldub	[%l7 + %i4],	%o3
	movrlz	%i1,	0x26C,	%o7
	sth	%l6,	[%l7 + 0x20]
	edge8l	%o1,	%g4,	%o4
	movrlz	%l5,	%g6,	%l3
	umul	%o5,	%g1,	%o6
	sir	0x0CCD
	ldub	[%l7 + 0x4B],	%l2
	fzero	%f18
	edge8	%g3,	%g5,	%i7
	save %i3, 0x1D21, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%l0,	%f20,	%f16
	ldsb	[%l7 + 0x64],	%i0
	fxnors	%f28,	%f5,	%f3
	udivcc	%o2,	0x0C0E,	%g7
	orn	%g2,	%i2,	%i5
	lduw	[%l7 + 0x44],	%i4
	sir	0x172B
	edge8	%l4,	%o0,	%o3
	xnor	%i1,	0x10EE,	%l1
	movgu	%icc,	%l6,	%o7
	or	%o1,	%o4,	%g4
	movn	%icc,	%l5,	%l3
	save %g6, 0x0831, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%g1,	%g3
	movrlez	%l2,	0x0B1,	%i7
	fmovdcc	%icc,	%f14,	%f27
	sth	%g5,	[%l7 + 0x3A]
	fnands	%f14,	%f10,	%f19
	orncc	%i6,	%l0,	%i3
	alignaddr	%i0,	%g7,	%o2
	umul	%i2,	%g2,	%i4
	fnot1s	%f5,	%f1
	array8	%l4,	%i5,	%o3
	sir	0x1BC1
	lduw	[%l7 + 0x78],	%o0
	movge	%xcc,	%i1,	%l1
	movrgez	%o7,	%o1,	%o4
	ldx	[%l7 + 0x70],	%g4
	smulcc	%l5,	%l6,	%g6
	sethi	0x14ED,	%l3
	sth	%o5,	[%l7 + 0x34]
	std	%f26,	[%l7 + 0x48]
	fnot1	%f30,	%f28
	edge8n	%o6,	%g3,	%g1
	srax	%i7,	%l2,	%i6
	subcc	%g5,	0x1FAC,	%l0
	fmovdleu	%xcc,	%f15,	%f11
	sub	%i0,	0x158B,	%g7
	edge32	%o2,	%i2,	%g2
	alignaddrl	%i4,	%i3,	%i5
	fmovsle	%xcc,	%f13,	%f27
	and	%l4,	%o0,	%i1
	fpsub16	%f22,	%f8,	%f26
	sllx	%l1,	0x11,	%o3
	xorcc	%o7,	%o4,	%o1
	addc	%g4,	0x109E,	%l5
	stw	%l6,	[%l7 + 0x78]
	array8	%g6,	%o5,	%l3
	faligndata	%f6,	%f0,	%f20
	fpsub32	%f4,	%f10,	%f8
	fsrc1s	%f6,	%f17
	fmovdl	%xcc,	%f25,	%f23
	subc	%o6,	0x1994,	%g3
	addc	%g1,	%l2,	%i7
	edge16	%g5,	%l0,	%i6
	and	%g7,	%i0,	%o2
	movge	%xcc,	%i2,	%i4
	edge32l	%i3,	%g2,	%i5
	fmovrdgez	%o0,	%f2,	%f28
	fsrc2	%f6,	%f8
	movl	%icc,	%i1,	%l1
	andcc	%l4,	%o7,	%o4
	movrne	%o3,	0x300,	%o1
	xnor	%g4,	0x06B6,	%l5
	subccc	%l6,	0x1F31,	%g6
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	movge	%icc,	%g3,	%g1
	movl	%xcc,	%l2,	%i7
	movrlez	%l0,	0x0CF,	%i6
	edge32ln	%g7,	%g5,	%i0
	ld	[%l7 + 0x0C],	%f5
	stb	%o2,	[%l7 + 0x13]
	movge	%xcc,	%i2,	%i4
	fmovrdgez	%i3,	%f18,	%f10
	edge32n	%g2,	%i5,	%o0
	sdivcc	%l1,	0x0DEF,	%l4
	smulcc	%i1,	0x1EC8,	%o7
	smulcc	%o3,	0x15D9,	%o1
	ldd	[%l7 + 0x48],	%g4
	movgu	%xcc,	%l5,	%l6
	fmovrslz	%g6,	%f13,	%f17
	movleu	%xcc,	%l3,	%o4
	orncc	%o5,	%o6,	%g3
	ldub	[%l7 + 0x14],	%g1
	fmovrdlez	%i7,	%f12,	%f26
	movrgz	%l2,	%l0,	%g7
	pdist	%f0,	%f2,	%f22
	fmuld8ulx16	%f18,	%f28,	%f30
	umulcc	%g5,	%i0,	%i6
	sir	0x19D6
	edge16ln	%i2,	%i4,	%o2
	movrlez	%i3,	0x000,	%i5
	std	%f28,	[%l7 + 0x50]
	edge16l	%o0,	%g2,	%l1
	srlx	%i1,	0x07,	%o7
	fcmped	%fcc3,	%f2,	%f16
	edge32ln	%l4,	%o3,	%o1
	movre	%g4,	%l5,	%l6
	movg	%xcc,	%l3,	%g6
	fmovs	%f6,	%f5
	fcmpd	%fcc3,	%f8,	%f30
	movre	%o5,	%o4,	%o6
	movge	%xcc,	%g1,	%g3
	edge16	%l2,	%i7,	%l0
	fpadd16	%f20,	%f12,	%f2
	addc	%g7,	%i0,	%i6
	addcc	%g5,	0x1CF2,	%i4
	fmovsneg	%icc,	%f29,	%f0
	edge16ln	%o2,	%i3,	%i5
	move	%icc,	%i2,	%o0
	edge16ln	%g2,	%l1,	%o7
	edge32n	%l4,	%i1,	%o1
	movle	%icc,	%o3,	%l5
	edge16ln	%g4,	%l6,	%g6
	mulscc	%o5,	0x1200,	%l3
	andncc	%o4,	%o6,	%g1
	edge32l	%g3,	%i7,	%l2
	stb	%l0,	[%l7 + 0x40]
	fsrc1	%f10,	%f8
	andncc	%i0,	%g7,	%i6
	edge16ln	%g5,	%o2,	%i4
	fcmpgt16	%f14,	%f22,	%i3
	umulcc	%i2,	%i5,	%g2
	mulx	%o0,	0x1C5C,	%l1
	fmovrdgez	%o7,	%f22,	%f26
	umul	%l4,	0x135F,	%i1
	fmovsa	%xcc,	%f20,	%f18
	sllx	%o3,	%o1,	%g4
	ld	[%l7 + 0x18],	%f21
	andcc	%l5,	%l6,	%o5
	and	%g6,	0x04DE,	%o4
	edge16	%l3,	%g1,	%g3
	st	%f9,	[%l7 + 0x18]
	smulcc	%o6,	0x0313,	%i7
	movge	%icc,	%l2,	%l0
	edge32ln	%i0,	%g7,	%g5
	and	%i6,	%i4,	%i3
	movcs	%icc,	%i2,	%i5
	edge16	%g2,	%o0,	%l1
	udivx	%o2,	0x0888,	%l4
	lduh	[%l7 + 0x64],	%o7
	movrlez	%i1,	0x335,	%o1
	movge	%icc,	%g4,	%o3
	fmovsneg	%xcc,	%f1,	%f1
	fmovsle	%icc,	%f4,	%f5
	fmovrse	%l6,	%f28,	%f20
	edge8	%o5,	%l5,	%o4
	fandnot1s	%f9,	%f15,	%f17
	subccc	%g6,	0x0E3C,	%g1
	ldd	[%l7 + 0x10],	%l2
	movn	%icc,	%o6,	%g3
	edge8n	%l2,	%i7,	%i0
	mulx	%l0,	%g7,	%i6
	subccc	%i4,	%g5,	%i3
	edge8	%i2,	%i5,	%o0
	movrgez	%l1,	%g2,	%o2
	add	%o7,	%i1,	%o1
	movne	%xcc,	%l4,	%g4
	movrlz	%o3,	0x204,	%o5
	fmovdvs	%xcc,	%f5,	%f28
	fsrc2s	%f21,	%f0
	ldsb	[%l7 + 0x66],	%l6
	srax	%o4,	%l5,	%g1
	alignaddrl	%g6,	%o6,	%g3
	edge8l	%l3,	%l2,	%i7
	movgu	%icc,	%l0,	%g7
	sethi	0x01C3,	%i6
	movcc	%xcc,	%i4,	%g5
	edge16ln	%i3,	%i2,	%i0
	xnorcc	%i5,	%o0,	%l1
	edge32l	%o2,	%g2,	%o7
	fcmpd	%fcc1,	%f24,	%f16
	fors	%f2,	%f14,	%f8
	sir	0x1AE5
	ldsh	[%l7 + 0x7C],	%o1
	lduh	[%l7 + 0x78],	%l4
	udivx	%i1,	0x0EAE,	%g4
	fmul8x16	%f0,	%f30,	%f22
	orn	%o3,	0x00FA,	%o5
	movge	%icc,	%l6,	%o4
	udivx	%g1,	0x087D,	%g6
	nop
	set	0x38, %i0
	stb	%o6,	[%l7 + %i0]
	stx	%g3,	[%l7 + 0x68]
	orn	%l5,	0x0247,	%l2
	movvs	%xcc,	%i7,	%l0
	movre	%l3,	%i6,	%i4
	and	%g5,	%i3,	%g7
	edge32l	%i2,	%i5,	%o0
	ldd	[%l7 + 0x78],	%f6
	addccc	%l1,	%i0,	%o2
	edge32n	%o7,	%g2,	%l4
	edge32	%i1,	%g4,	%o1
	fandnot1s	%f23,	%f19,	%f14
	fpack16	%f0,	%f30
	ldsb	[%l7 + 0x30],	%o5
	or	%o3,	0x0A1C,	%o4
	edge16ln	%g1,	%g6,	%o6
	addccc	%l6,	%g3,	%l2
	smulcc	%i7,	%l0,	%l5
	edge32ln	%l3,	%i4,	%g5
	ldub	[%l7 + 0x65],	%i6
	edge16l	%g7,	%i3,	%i2
	fmovsvc	%icc,	%f7,	%f0
	fornot2s	%f31,	%f15,	%f7
	subc	%i5,	%o0,	%i0
	movg	%xcc,	%o2,	%o7
	movneg	%xcc,	%g2,	%l1
	fmovdcc	%xcc,	%f18,	%f29
	add	%i1,	0x12FD,	%g4
	add	%l4,	%o1,	%o3
	edge16	%o4,	%o5,	%g1
	smul	%g6,	%o6,	%g3
	xnor	%l2,	%l6,	%i7
	movrlz	%l0,	0x3A1,	%l3
	fpmerge	%f13,	%f4,	%f18
	edge8ln	%i4,	%g5,	%l5
	movrlez	%i6,	%i3,	%i2
	movg	%xcc,	%g7,	%i5
	fsrc1	%f26,	%f2
	subccc	%o0,	0x08FE,	%i0
	edge8	%o7,	%o2,	%g2
	fmovrsgz	%i1,	%f8,	%f24
	sub	%g4,	%l4,	%l1
	fxors	%f2,	%f29,	%f13
	movne	%icc,	%o1,	%o3
	lduh	[%l7 + 0x44],	%o5
	movcs	%icc,	%o4,	%g6
	xorcc	%g1,	0x1900,	%g3
	movne	%icc,	%l2,	%l6
	subc	%i7,	%l0,	%o6
	sra	%l3,	0x1C,	%g5
	movre	%i4,	0x033,	%i6
	fmovsvc	%xcc,	%f8,	%f6
	fands	%f17,	%f13,	%f18
	movn	%xcc,	%l5,	%i2
	edge8l	%g7,	%i3,	%i5
	fabss	%f24,	%f27
	sethi	0x1613,	%o0
	array8	%i0,	%o2,	%g2
	sdivcc	%i1,	0x0E28,	%g4
	ldsh	[%l7 + 0x4C],	%o7
	fzero	%f24
	ld	[%l7 + 0x1C],	%f26
	movg	%icc,	%l4,	%o1
	edge16ln	%l1,	%o5,	%o4
	sdiv	%o3,	0x1CB6,	%g6
	fmovsle	%xcc,	%f22,	%f11
	move	%icc,	%g3,	%l2
	andcc	%l6,	%g1,	%l0
	orncc	%i7,	0x1A2B,	%o6
	ldd	[%l7 + 0x40],	%l2
	movrlez	%g5,	%i6,	%i4
	edge16ln	%i2,	%g7,	%l5
	sth	%i3,	[%l7 + 0x0C]
	edge32ln	%i5,	%o0,	%o2
	movcs	%xcc,	%g2,	%i0
	udivcc	%i1,	0x1660,	%g4
	fcmpd	%fcc3,	%f14,	%f30
	mulx	%l4,	%o1,	%l1
	fmovdcs	%icc,	%f25,	%f18
	ldsh	[%l7 + 0x42],	%o7
	xnor	%o5,	%o3,	%o4
	stb	%g6,	[%l7 + 0x1B]
	fmovdn	%icc,	%f7,	%f7
	lduh	[%l7 + 0x76],	%g3
	sdiv	%l2,	0x1AF6,	%g1
	fcmpes	%fcc1,	%f13,	%f25
	std	%f22,	[%l7 + 0x48]
	orncc	%l0,	%l6,	%o6
	movrlz	%i7,	%l3,	%i6
	sra	%i4,	%g5,	%g7
	ldd	[%l7 + 0x70],	%l4
	andcc	%i2,	0x0656,	%i3
	ldd	[%l7 + 0x68],	%f20
	xor	%i5,	0x1A47,	%o0
	movl	%xcc,	%o2,	%i0
	edge8l	%g2,	%g4,	%i1
	umul	%l4,	%o1,	%l1
	edge16n	%o7,	%o3,	%o4
	xnor	%g6,	0x032E,	%g3
	movrgz	%l2,	0x3C8,	%g1
	fmovdgu	%xcc,	%f26,	%f17
	movvs	%icc,	%l0,	%l6
	subc	%o5,	0x1CEE,	%o6
	edge8ln	%l3,	%i7,	%i4
	sub	%i6,	%g7,	%l5
	edge32ln	%g5,	%i3,	%i5
	movne	%xcc,	%o0,	%o2
	movrne	%i0,	0x359,	%i2
	sdivcc	%g4,	0x0420,	%i1
	fornot2s	%f3,	%f7,	%f20
	edge32l	%g2,	%o1,	%l1
	smul	%l4,	0x160B,	%o3
	movcc	%xcc,	%o7,	%o4
	add	%g3,	0x092D,	%l2
	ldsw	[%l7 + 0x50],	%g6
	movrgez	%g1,	%l0,	%l6
	mulx	%o5,	%l3,	%i7
	fpack16	%f10,	%f11
	udiv	%i4,	0x0A87,	%o6
	ldx	[%l7 + 0x28],	%i6
	array32	%l5,	%g5,	%g7
	edge16ln	%i5,	%i3,	%o0
	alignaddrl	%i0,	%o2,	%i2
	movg	%xcc,	%i1,	%g2
	edge8	%g4,	%o1,	%l1
	sllx	%o3,	%l4,	%o4
	mova	%xcc,	%g3,	%l2
	fmovdn	%icc,	%f12,	%f16
	movpos	%icc,	%g6,	%o7
	movrlz	%g1,	%l6,	%l0
	array8	%o5,	%i7,	%i4
	add	%o6,	%i6,	%l3
	movneg	%icc,	%l5,	%g7
	bshuffle	%f30,	%f12,	%f18
	ldsw	[%l7 + 0x0C],	%g5
	array16	%i5,	%i3,	%i0
	movneg	%icc,	%o0,	%i2
	subcc	%o2,	%g2,	%g4
	fmovrslz	%o1,	%f18,	%f14
	sth	%l1,	[%l7 + 0x64]
	save %o3, 0x096B, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%i1,	%g3
	lduw	[%l7 + 0x1C],	%l2
	bshuffle	%f0,	%f0,	%f16
	fmovdge	%icc,	%f15,	%f2
	movrne	%o7,	%g6,	%l6
	lduh	[%l7 + 0x26],	%g1
	fmovdge	%icc,	%f10,	%f14
	movrlz	%l0,	%o5,	%i4
	sdivx	%i7,	0x1393,	%o6
	ldsh	[%l7 + 0x4E],	%i6
	andncc	%l5,	%l3,	%g7
	fmul8x16	%f0,	%f14,	%f12
	sdivx	%g5,	0x1D87,	%i3
	movvs	%icc,	%i5,	%i0
	popc	0x1F04,	%o0
	andncc	%o2,	%i2,	%g4
	fones	%f7
	edge16ln	%g2,	%o1,	%o3
	xorcc	%l1,	%o4,	%i1
	mova	%xcc,	%g3,	%l2
	andncc	%l4,	%o7,	%g6
	fmovdle	%xcc,	%f29,	%f30
	move	%xcc,	%l6,	%g1
	sllx	%o5,	%i4,	%i7
	fcmpne32	%f6,	%f10,	%o6
	ldd	[%l7 + 0x30],	%f18
	ldd	[%l7 + 0x18],	%f26
	ldd	[%l7 + 0x50],	%f18
	xor	%l0,	%i6,	%l3
	mulscc	%g7,	0x04EE,	%g5
	subc	%l5,	0x0C63,	%i5
	xor	%i3,	%i0,	%o2
	movvc	%xcc,	%o0,	%i2
	srlx	%g4,	%o1,	%o3
	movvc	%xcc,	%g2,	%l1
	fmovsg	%icc,	%f1,	%f13
	ldsb	[%l7 + 0x49],	%o4
	movle	%xcc,	%g3,	%i1
	edge8ln	%l4,	%l2,	%g6
	subc	%o7,	0x16B9,	%g1
	smulcc	%o5,	0x0D15,	%i4
	movl	%xcc,	%i7,	%o6
	sth	%l6,	[%l7 + 0x1A]
	edge8ln	%i6,	%l0,	%l3
	edge32n	%g7,	%g5,	%i5
	fmovdle	%icc,	%f1,	%f13
	movrgz	%l5,	%i0,	%i3
	movn	%xcc,	%o0,	%o2
	srax	%g4,	%i2,	%o1
	fpack16	%f0,	%f19
	ldub	[%l7 + 0x64],	%g2
	fexpand	%f25,	%f4
	ldsw	[%l7 + 0x3C],	%l1
	orcc	%o3,	%o4,	%i1
	movpos	%xcc,	%g3,	%l4
	st	%f17,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x5C],	%g6
	std	%f30,	[%l7 + 0x48]
	orncc	%l2,	0x0DF1,	%o7
	sth	%g1,	[%l7 + 0x6E]
	array8	%i4,	%o5,	%i7
	fmul8sux16	%f8,	%f20,	%f6
	ldd	[%l7 + 0x68],	%f12
	nop
	set	0x08, %l1
	ldsw	[%l7 + %l1],	%l6
	or	%i6,	0x1A62,	%o6
	std	%f24,	[%l7 + 0x58]
	ldsb	[%l7 + 0x22],	%l0
	array8	%g7,	%l3,	%g5
	movcs	%xcc,	%l5,	%i0
	stx	%i3,	[%l7 + 0x08]
	add	%i5,	%o0,	%o2
	ldsh	[%l7 + 0x24],	%i2
	movg	%xcc,	%g4,	%g2
	sllx	%o1,	0x0B,	%o3
	ldub	[%l7 + 0x18],	%l1
	movvs	%icc,	%i1,	%o4
	sethi	0x0082,	%l4
	ldsh	[%l7 + 0x5A],	%g3
	fmul8sux16	%f4,	%f26,	%f30
	fmovrde	%g6,	%f12,	%f0
	movle	%xcc,	%l2,	%o7
	mulx	%i4,	0x1F60,	%o5
	fmovdn	%icc,	%f28,	%f9
	fcmpes	%fcc3,	%f24,	%f25
	umul	%g1,	0x0DC4,	%l6
	fors	%f27,	%f0,	%f16
	fabss	%f12,	%f29
	movleu	%icc,	%i6,	%o6
	udivx	%i7,	0x1FB3,	%l0
	umulcc	%g7,	0x147D,	%g5
	std	%f12,	[%l7 + 0x58]
	fmuld8sux16	%f5,	%f26,	%f28
	restore %l5, %l3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i0,	%i5,	%o2
	edge32ln	%i2,	%o0,	%g2
	movrgz	%o1,	%o3,	%g4
	fmovrslez	%i1,	%f2,	%f9
	edge32ln	%l1,	%o4,	%g3
	sdivcc	%g6,	0x144F,	%l4
	edge32	%o7,	%l2,	%o5
	movrgz	%i4,	%l6,	%i6
	fmovdvs	%xcc,	%f6,	%f7
	stw	%g1,	[%l7 + 0x38]
	addc	%i7,	%l0,	%o6
	or	%g7,	%g5,	%l3
	movrlez	%l5,	0x250,	%i0
	fmovdl	%icc,	%f2,	%f6
	fandnot1	%f12,	%f8,	%f14
	fmovsvc	%icc,	%f2,	%f14
	udivx	%i3,	0x1F8B,	%i5
	ldsw	[%l7 + 0x70],	%i2
	ldd	[%l7 + 0x48],	%o2
	subc	%o0,	0x1EBF,	%o1
	array8	%o3,	%g2,	%g4
	mulx	%i1,	%o4,	%l1
	xnor	%g6,	0x02B1,	%g3
	fnand	%f2,	%f16,	%f12
	fxnors	%f24,	%f9,	%f24
	edge32l	%l4,	%l2,	%o7
	fcmple16	%f12,	%f0,	%o5
	udivcc	%l6,	0x1251,	%i6
	fmovs	%f31,	%f8
	andncc	%i4,	%g1,	%i7
	ldsb	[%l7 + 0x4B],	%o6
	move	%icc,	%g7,	%g5
	fmovrsgz	%l3,	%f12,	%f24
	movvs	%icc,	%l0,	%l5
	fandnot2	%f22,	%f10,	%f4
	sdivx	%i0,	0x09A5,	%i5
	edge16	%i2,	%o2,	%i3
	fpsub16	%f18,	%f10,	%f2
	fpsub32s	%f29,	%f8,	%f8
	array16	%o0,	%o3,	%o1
	fmovsgu	%xcc,	%f30,	%f0
	fmovsvs	%xcc,	%f11,	%f24
	sllx	%g4,	%i1,	%o4
	sll	%l1,	0x1E,	%g6
	edge8n	%g2,	%l4,	%g3
	andn	%l2,	%o5,	%o7
	ldd	[%l7 + 0x40],	%f0
	fcmped	%fcc1,	%f30,	%f30
	edge32ln	%l6,	%i6,	%g1
	sdivx	%i7,	0x1411,	%o6
	edge16n	%i4,	%g7,	%l3
	orcc	%g5,	%l0,	%i0
	edge8ln	%i5,	%i2,	%l5
	edge32ln	%i3,	%o0,	%o2
	orcc	%o3,	%o1,	%i1
	fnot2s	%f16,	%f29
	movrgz	%g4,	%l1,	%o4
	stw	%g6,	[%l7 + 0x3C]
	sth	%l4,	[%l7 + 0x2C]
	fcmpne32	%f6,	%f16,	%g2
	alignaddrl	%g3,	%l2,	%o5
	alignaddr	%o7,	%l6,	%i6
	or	%g1,	%i7,	%o6
	movvc	%xcc,	%g7,	%i4
	srax	%l3,	%l0,	%i0
	fxnors	%f25,	%f25,	%f14
	or	%g5,	%i5,	%l5
	movvc	%xcc,	%i3,	%i2
	fpmerge	%f22,	%f27,	%f24
	andcc	%o0,	0x1DDD,	%o2
	fandnot1	%f10,	%f28,	%f16
	subc	%o1,	0x08D4,	%i1
	fcmple16	%f18,	%f24,	%g4
	stx	%o3,	[%l7 + 0x30]
	subc	%o4,	0x16C5,	%l1
	movle	%xcc,	%g6,	%g2
	array16	%l4,	%l2,	%g3
	movrne	%o7,	%o5,	%l6
	movleu	%icc,	%i6,	%i7
	fmovsneg	%xcc,	%f13,	%f17
	udivcc	%g1,	0x05FD,	%g7
	xorcc	%o6,	%i4,	%l0
	orncc	%l3,	%g5,	%i0
	movcs	%icc,	%l5,	%i3
	save %i5, %o0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o2,	0x173B,	%i1
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	pdist	%f14,	%f22,	%f28
	movleu	%xcc,	%l1,	%g6
	stx	%g2,	[%l7 + 0x28]
	movvc	%icc,	%l4,	%o4
	fpack16	%f22,	%f22
	movrgz	%g3,	0x15A,	%o7
	movrlez	%l2,	%o5,	%i6
	save %i7, %l6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o6,	%i4,	%l0
	stb	%l3,	[%l7 + 0x4A]
	addcc	%g7,	0x1A10,	%g5
	nop
	set	0x7D, %i1
	ldub	[%l7 + %i1],	%l5
	ldx	[%l7 + 0x20],	%i0
	sdiv	%i3,	0x0EDF,	%o0
	movcs	%icc,	%i2,	%o2
	array8	%i1,	%g4,	%i5
	lduh	[%l7 + 0x08],	%o3
	srlx	%l1,	0x0D,	%o1
	edge16ln	%g2,	%l4,	%o4
	andcc	%g6,	0x1887,	%o7
	nop
	set	0x6C, %o5
	ldsw	[%l7 + %o5],	%l2
	fpack16	%f0,	%f25
	st	%f17,	[%l7 + 0x34]
	save %g3, 0x08FD, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o5,	%i7,	%g1
	smul	%l6,	0x1C7E,	%i4
	std	%f22,	[%l7 + 0x48]
	ldsw	[%l7 + 0x70],	%l0
	fmovdcs	%icc,	%f21,	%f18
	fmovsge	%icc,	%f16,	%f12
	movneg	%icc,	%l3,	%g7
	ldd	[%l7 + 0x18],	%f4
	restore %g5, 0x02C0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o6,	%i3,	%o0
	sth	%i0,	[%l7 + 0x52]
	sdivcc	%o2,	0x0136,	%i2
	ldsw	[%l7 + 0x54],	%g4
	mulscc	%i1,	0x1587,	%o3
	sethi	0x19A6,	%l1
	stx	%i5,	[%l7 + 0x18]
	array8	%g2,	%l4,	%o1
	or	%o4,	%o7,	%g6
	movcs	%icc,	%l2,	%i6
	ld	[%l7 + 0x5C],	%f3
	smul	%g3,	%i7,	%g1
	movcc	%icc,	%o5,	%l6
	and	%l0,	%i4,	%g7
	movvs	%icc,	%l3,	%l5
	edge16l	%o6,	%i3,	%g5
	movneg	%xcc,	%o0,	%i0
	addccc	%o2,	%g4,	%i1
	and	%i2,	0x06C8,	%l1
	smulcc	%i5,	0x0C03,	%g2
	ldd	[%l7 + 0x28],	%f24
	andncc	%l4,	%o1,	%o3
	edge8	%o4,	%g6,	%o7
	fmovdvs	%icc,	%f14,	%f27
	fandnot2	%f10,	%f12,	%f16
	lduh	[%l7 + 0x4A],	%i6
	sethi	0x10DF,	%g3
	addc	%i7,	%l2,	%g1
	xorcc	%l6,	0x1382,	%o5
	xorcc	%l0,	0x08AF,	%i4
	movrlz	%l3,	%l5,	%o6
	subcc	%i3,	%g7,	%g5
	andncc	%o0,	%o2,	%g4
	bshuffle	%f0,	%f2,	%f0
	sth	%i1,	[%l7 + 0x4E]
	sdivcc	%i0,	0x0E2E,	%i2
	std	%f26,	[%l7 + 0x28]
	subccc	%l1,	0x0581,	%g2
	orn	%i5,	0x08D9,	%l4
	sethi	0x0290,	%o1
	orcc	%o3,	0x06FF,	%o4
	umul	%g6,	%o7,	%i6
	srl	%g3,	%l2,	%i7
	fnegd	%f18,	%f14
	addc	%g1,	%o5,	%l0
	movneg	%xcc,	%l6,	%l3
	fornot2s	%f9,	%f14,	%f31
	fmul8x16al	%f18,	%f2,	%f20
	or	%l5,	%i4,	%i3
	alignaddr	%o6,	%g7,	%g5
	movneg	%xcc,	%o0,	%o2
	xnor	%g4,	%i1,	%i2
	sdivcc	%l1,	0x06AD,	%g2
	orn	%i5,	0x0A1E,	%l4
	subc	%o1,	0x0B74,	%i0
	umul	%o3,	0x09A8,	%o4
	faligndata	%f0,	%f28,	%f8
	edge8n	%g6,	%o7,	%g3
	fnot2	%f24,	%f24
	edge8n	%l2,	%i6,	%i7
	fcmpne16	%f26,	%f6,	%o5
	xnorcc	%l0,	0x1905,	%l6
	xorcc	%l3,	%l5,	%g1
	movcc	%icc,	%i4,	%o6
	fmovsa	%icc,	%f30,	%f25
	alignaddr	%i3,	%g7,	%g5
	fmovdvs	%xcc,	%f18,	%f8
	fcmpne32	%f20,	%f20,	%o2
	andncc	%g4,	%i1,	%i2
	fmovdgu	%icc,	%f21,	%f21
	movrgez	%l1,	0x220,	%g2
	movne	%icc,	%i5,	%l4
	ldub	[%l7 + 0x6D],	%o1
	edge32	%i0,	%o3,	%o4
	fmovsa	%xcc,	%f24,	%f30
	sth	%g6,	[%l7 + 0x32]
	movneg	%xcc,	%o7,	%o0
	movrlez	%g3,	0x1BC,	%i6
	smul	%i7,	0x1458,	%o5
	fmovsgu	%xcc,	%f4,	%f31
	edge32ln	%l0,	%l6,	%l3
	sll	%l2,	%g1,	%l5
	movrlz	%o6,	%i3,	%g7
	movcs	%icc,	%i4,	%o2
	movcs	%xcc,	%g4,	%i1
	fabss	%f30,	%f27
	add	%i2,	%g5,	%l1
	fsrc2s	%f29,	%f6
	ldd	[%l7 + 0x38],	%f14
	umulcc	%g2,	0x0FCC,	%i5
	fsrc2	%f28,	%f10
	stx	%o1,	[%l7 + 0x20]
	fmovdg	%icc,	%f29,	%f4
	sllx	%l4,	0x1A,	%o3
	stb	%i0,	[%l7 + 0x7E]
	xor	%g6,	%o7,	%o4
	fmuld8ulx16	%f15,	%f31,	%f6
	fmovde	%icc,	%f0,	%f7
	mulx	%g3,	%o0,	%i7
	addcc	%o5,	0x1520,	%l0
	sir	0x03BE
	ldub	[%l7 + 0x60],	%i6
	smul	%l3,	0x1566,	%l2
	lduw	[%l7 + 0x08],	%g1
	edge16	%l6,	%o6,	%l5
	edge8n	%g7,	%i3,	%i4
	edge16l	%g4,	%i1,	%i2
	sethi	0x19F1,	%g5
	fmovsvs	%xcc,	%f18,	%f17
	alignaddrl	%l1,	%g2,	%o2
	mulx	%i5,	0x0201,	%o1
	udiv	%o3,	0x1E6B,	%l4
	udivcc	%g6,	0x0904,	%o7
	sll	%o4,	0x14,	%g3
	edge8ln	%i0,	%i7,	%o5
	sra	%o0,	%l0,	%l3
	stb	%i6,	[%l7 + 0x12]
	movgu	%icc,	%g1,	%l6
	movn	%icc,	%l2,	%l5
	udivcc	%o6,	0x14F4,	%i3
	sra	%g7,	0x11,	%i4
	ldd	[%l7 + 0x78],	%f8
	fornot2	%f24,	%f14,	%f30
	ldd	[%l7 + 0x60],	%i0
	st	%f18,	[%l7 + 0x48]
	fxors	%f12,	%f6,	%f22
	fmovdcc	%icc,	%f8,	%f19
	fnegd	%f4,	%f22
	and	%i2,	%g4,	%l1
	fmovsge	%icc,	%f23,	%f15
	movrne	%g5,	%o2,	%i5
	fnot1	%f6,	%f10
	andn	%o1,	%g2,	%l4
	andncc	%g6,	%o3,	%o7
	umul	%g3,	0x1145,	%i0
	edge16	%o4,	%i7,	%o0
	ldd	[%l7 + 0x18],	%f12
	sllx	%l0,	%l3,	%i6
	fsrc1s	%f13,	%f14
	edge32n	%g1,	%o5,	%l6
	addcc	%l2,	%l5,	%i3
	movcc	%xcc,	%g7,	%o6
	movcc	%xcc,	%i1,	%i4
	movrlez	%i2,	%g4,	%g5
	umulcc	%o2,	%l1,	%o1
	movl	%icc,	%i5,	%l4
	fnegs	%f30,	%f30
	edge16n	%g2,	%o3,	%o7
	xor	%g6,	%i0,	%o4
	movneg	%icc,	%i7,	%o0
	array32	%l0,	%g3,	%l3
	movne	%xcc,	%i6,	%g1
	xorcc	%o5,	%l2,	%l5
	edge16ln	%i3,	%l6,	%o6
	xor	%i1,	%i4,	%i2
	fnands	%f20,	%f26,	%f30
	movneg	%icc,	%g7,	%g5
	popc	%g4,	%o2
	movrgz	%o1,	0x35E,	%i5
	subc	%l1,	%l4,	%g2
	stb	%o7,	[%l7 + 0x15]
	save %g6, 0x1838, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o4,	%i7,	%o3
	movge	%xcc,	%l0,	%o0
	movvc	%xcc,	%g3,	%i6
	edge8ln	%g1,	%o5,	%l2
	fmovrdlz	%l3,	%f6,	%f0
	faligndata	%f8,	%f16,	%f6
	edge8ln	%l5,	%l6,	%o6
	edge32l	%i3,	%i4,	%i1
	sll	%i2,	%g5,	%g4
	movrgz	%g7,	0x2D8,	%o1
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	array16	%l4,	%l1,	%o7
	fxors	%f30,	%f7,	%f30
	movne	%icc,	%g6,	%g2
	fmovrse	%i0,	%f6,	%f24
	ldsw	[%l7 + 0x38],	%o4
	fmovsg	%xcc,	%f11,	%f19
	ldsb	[%l7 + 0x44],	%i7
	fcmped	%fcc1,	%f0,	%f16
	edge32ln	%o3,	%l0,	%o0
	st	%f26,	[%l7 + 0x54]
	faligndata	%f6,	%f26,	%f8
	fpack16	%f8,	%f15
	sethi	0x0C04,	%g3
	fmovsn	%icc,	%f19,	%f17
	movpos	%icc,	%g1,	%i6
	subcc	%o5,	%l3,	%l2
	ldsb	[%l7 + 0x67],	%l6
	addccc	%o6,	0x1858,	%i3
	umul	%l5,	0x1D2D,	%i1
	fpack32	%f26,	%f26,	%f22
	movrgz	%i2,	0x383,	%i4
	movneg	%icc,	%g4,	%g7
	movl	%xcc,	%o1,	%o2
	ldsw	[%l7 + 0x30],	%g5
	edge16	%l4,	%l1,	%o7
	fand	%f10,	%f30,	%f24
	mulscc	%g6,	0x0D13,	%g2
	fmovrsgez	%i0,	%f6,	%f12
	orn	%o4,	%i5,	%i7
	sra	%l0,	%o0,	%o3
	subccc	%g1,	0x09BE,	%i6
	andncc	%g3,	%l3,	%o5
	movvc	%xcc,	%l2,	%o6
	xnorcc	%i3,	%l6,	%i1
	mulx	%i2,	%i4,	%g4
	fmul8ulx16	%f22,	%f30,	%f6
	sth	%l5,	[%l7 + 0x64]
	umul	%o1,	%o2,	%g5
	fcmpgt32	%f2,	%f14,	%l4
	st	%f20,	[%l7 + 0x64]
	edge8ln	%g7,	%o7,	%g6
	stb	%g2,	[%l7 + 0x49]
	mulscc	%l1,	%o4,	%i5
	movl	%icc,	%i0,	%l0
	movrne	%o0,	0x18C,	%i7
	fmovrdlz	%g1,	%f2,	%f8
	xor	%o3,	%g3,	%i6
	andncc	%o5,	%l2,	%l3
	sdivx	%o6,	0x1137,	%l6
	udivcc	%i1,	0x159F,	%i2
	mulscc	%i3,	0x046E,	%i4
	edge16	%g4,	%o1,	%o2
	sdiv	%g5,	0x0FB6,	%l5
	restore %g7, 0x178C, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o7,	%g6,	%g2
	sub	%o4,	0x0D78,	%i5
	edge32n	%i0,	%l0,	%o0
	edge16	%l1,	%g1,	%i7
	ldub	[%l7 + 0x6C],	%o3
	fpack16	%f24,	%f14
	addcc	%g3,	0x046C,	%o5
	fcmpgt32	%f22,	%f10,	%i6
	fpack16	%f14,	%f21
	or	%l2,	0x157C,	%l3
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	movgu	%icc,	%i2,	%i4
	fmovsvs	%icc,	%f16,	%f16
	ldd	[%l7 + 0x10],	%f4
	addccc	%i3,	0x00BB,	%o1
	udiv	%o2,	0x1460,	%g4
	stb	%l5,	[%l7 + 0x5B]
	fmovda	%xcc,	%f9,	%f20
	xorcc	%g7,	%l4,	%g5
	movpos	%xcc,	%o7,	%g6
	edge32	%g2,	%i5,	%o4
	st	%f8,	[%l7 + 0x7C]
	st	%f28,	[%l7 + 0x1C]
	fandnot1s	%f11,	%f3,	%f12
	sra	%i0,	0x03,	%l0
	lduh	[%l7 + 0x14],	%o0
	sll	%g1,	0x12,	%l1
	alignaddrl	%i7,	%g3,	%o5
	movne	%xcc,	%i6,	%l2
	andn	%l3,	%o3,	%o6
	sth	%l6,	[%l7 + 0x32]
	sllx	%i1,	%i4,	%i2
	edge16	%o1,	%o2,	%g4
	orn	%i3,	%g7,	%l4
	fmovdneg	%icc,	%f30,	%f21
	fzeros	%f3
	udivcc	%l5,	0x19F6,	%o7
	xnor	%g6,	%g5,	%g2
	alignaddr	%o4,	%i0,	%l0
	fnand	%f26,	%f18,	%f6
	sub	%i5,	%o0,	%g1
	or	%l1,	%i7,	%o5
	xor	%g3,	%l2,	%i6
	or	%o3,	%o6,	%l3
	movge	%icc,	%l6,	%i1
	edge16n	%i4,	%i2,	%o2
	edge8	%g4,	%o1,	%g7
	andncc	%i3,	%l4,	%l5
	movrlez	%o7,	%g5,	%g6
	fabss	%f13,	%f4
	xnor	%g2,	%i0,	%o4
	fpack32	%f0,	%f4,	%f18
	nop
	set	0x52, %o6
	lduh	[%l7 + %o6],	%l0
	sra	%i5,	0x16,	%g1
	movl	%icc,	%l1,	%i7
	alignaddrl	%o5,	%o0,	%l2
	fmovsvs	%icc,	%f11,	%f0
	lduw	[%l7 + 0x38],	%g3
	edge16ln	%o3,	%i6,	%o6
	edge8ln	%l6,	%i1,	%i4
	movl	%xcc,	%i2,	%l3
	movrlez	%o2,	0x1F4,	%g4
	alignaddr	%g7,	%i3,	%l4
	array16	%l5,	%o1,	%g5
	edge16	%o7,	%g6,	%g2
	movrgez	%i0,	0x323,	%l0
	array32	%o4,	%g1,	%i5
	andncc	%i7,	%l1,	%o0
	stx	%o5,	[%l7 + 0x30]
	sdivx	%g3,	0x1C2E,	%l2
	ldd	[%l7 + 0x20],	%f28
	mulx	%o3,	%i6,	%l6
	fabss	%f25,	%f23
	fxnor	%f0,	%f4,	%f28
	array16	%o6,	%i1,	%i2
	fmovrdgz	%i4,	%f6,	%f10
	popc	%o2,	%l3
	movleu	%xcc,	%g7,	%i3
	add	%l4,	%g4,	%o1
	udiv	%g5,	0x1EF9,	%o7
	subccc	%l5,	%g2,	%i0
	movpos	%icc,	%g6,	%l0
	fmovscs	%xcc,	%f0,	%f16
	sllx	%g1,	0x05,	%o4
	smul	%i7,	0x0891,	%i5
	fornot2s	%f6,	%f18,	%f18
	udiv	%o0,	0x058F,	%l1
	edge8	%o5,	%l2,	%o3
	movrlz	%g3,	%i6,	%o6
	ldub	[%l7 + 0x36],	%l6
	fmovdpos	%icc,	%f10,	%f8
	fmovs	%f8,	%f16
	movne	%xcc,	%i1,	%i4
	mulscc	%o2,	0x0AC8,	%i2
	udivx	%g7,	0x1FC5,	%l3
	save %i3, %l4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o1,	%o7,	%l5
	andcc	%g2,	%i0,	%g5
	ldd	[%l7 + 0x60],	%l0
	andncc	%g1,	%o4,	%g6
	ldub	[%l7 + 0x47],	%i7
	fmovdgu	%xcc,	%f27,	%f2
	smulcc	%i5,	%l1,	%o0
	ldsh	[%l7 + 0x7A],	%l2
	sub	%o5,	%o3,	%g3
	smul	%o6,	%l6,	%i6
	array32	%i1,	%o2,	%i4
	lduh	[%l7 + 0x4C],	%i2
	srax	%g7,	0x1A,	%i3
	andcc	%l4,	%g4,	%o1
	edge8n	%o7,	%l3,	%g2
	edge16	%l5,	%g5,	%l0
	edge32n	%i0,	%g1,	%o4
	movvs	%xcc,	%g6,	%i7
	edge8n	%l1,	%o0,	%l2
	movvs	%icc,	%i5,	%o5
	ldsb	[%l7 + 0x17],	%o3
	udivcc	%o6,	0x1DEB,	%l6
	ldx	[%l7 + 0x70],	%i6
	movle	%xcc,	%i1,	%o2
	xor	%g3,	0x1AD8,	%i2
	fmovdl	%icc,	%f12,	%f6
	umulcc	%i4,	%g7,	%l4
	orncc	%i3,	0x1E3C,	%g4
	edge16n	%o1,	%l3,	%g2
	sir	0x06A8
	st	%f23,	[%l7 + 0x58]
	and	%l5,	%g5,	%l0
	ldsb	[%l7 + 0x50],	%i0
	ld	[%l7 + 0x68],	%f19
	move	%xcc,	%g1,	%o7
	fnot2	%f10,	%f18
	sethi	0x145E,	%g6
	sth	%i7,	[%l7 + 0x18]
	stx	%l1,	[%l7 + 0x18]
	movvs	%icc,	%o4,	%l2
	movrne	%i5,	0x109,	%o0
	stb	%o5,	[%l7 + 0x5D]
	fpack16	%f26,	%f10
	srl	%o3,	0x09,	%l6
	udivx	%o6,	0x0525,	%i6
	sdivcc	%i1,	0x1703,	%o2
	fpack32	%f16,	%f18,	%f2
	srl	%g3,	0x07,	%i4
	popc	0x103E,	%g7
	orncc	%l4,	%i2,	%i3
	save %o1, %g4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l5,	%g2
	edge16	%g5,	%i0,	%g1
	and	%o7,	%g6,	%l0
	sdivx	%l1,	0x0B2B,	%o4
	movrgz	%l2,	%i5,	%o0
	umulcc	%i7,	%o3,	%o5
	subc	%l6,	0x19AD,	%o6
	array32	%i1,	%i6,	%o2
	fandnot1s	%f21,	%f23,	%f15
	edge16l	%g3,	%i4,	%g7
	sra	%i2,	0x02,	%i3
	edge16n	%o1,	%g4,	%l4
	fornot2s	%f27,	%f0,	%f11
	nop
	set	0x14, %o3
	stb	%l3,	[%l7 + %o3]
	orcc	%l5,	%g2,	%i0
	addccc	%g1,	%o7,	%g6
	fmovdvc	%xcc,	%f21,	%f19
	fmovdvc	%xcc,	%f6,	%f9
	umulcc	%g5,	0x187A,	%l1
	ldsh	[%l7 + 0x24],	%o4
	ldd	[%l7 + 0x20],	%l2
	add	%i5,	%l0,	%o0
	edge8n	%i7,	%o5,	%l6
	andn	%o3,	0x0481,	%o6
	addccc	%i6,	0x0B31,	%o2
	umul	%i1,	%i4,	%g7
	fxnor	%f28,	%f4,	%f22
	ldx	[%l7 + 0x08],	%g3
	udivcc	%i2,	0x00F0,	%i3
	fpadd16	%f18,	%f10,	%f30
	smul	%g4,	%o1,	%l3
	sir	0x0295
	umulcc	%l4,	%l5,	%i0
	fxnor	%f12,	%f4,	%f8
	fmovrsgz	%g1,	%f22,	%f0
	move	%icc,	%g2,	%o7
	edge8ln	%g5,	%l1,	%g6
	ldsw	[%l7 + 0x7C],	%o4
	ldsb	[%l7 + 0x29],	%i5
	movcs	%icc,	%l0,	%o0
	fnot2s	%f8,	%f12
	subc	%i7,	0x0042,	%o5
	edge32l	%l2,	%l6,	%o3
	fmovdneg	%xcc,	%f29,	%f7
	fsrc2s	%f8,	%f23
	movcc	%icc,	%o6,	%o2
	ldd	[%l7 + 0x70],	%i6
	xorcc	%i1,	0x1D60,	%g7
	or	%g3,	%i2,	%i3
	orncc	%i4,	%o1,	%g4
	orncc	%l3,	%l4,	%l5
	movleu	%xcc,	%i0,	%g1
	edge8	%o7,	%g2,	%l1
	ldd	[%l7 + 0x08],	%g6
	popc	%o4,	%i5
	movg	%xcc,	%g5,	%o0
	fors	%f31,	%f4,	%f18
	movn	%xcc,	%l0,	%i7
	movre	%l2,	%l6,	%o3
	ldsw	[%l7 + 0x0C],	%o6
	mova	%xcc,	%o5,	%i6
	fmul8x16au	%f21,	%f0,	%f28
	movle	%xcc,	%i1,	%o2
	movrlz	%g7,	0x094,	%i2
	fnegs	%f6,	%f3
	udivcc	%g3,	0x0F08,	%i4
	srlx	%o1,	0x17,	%g4
	sub	%i3,	%l4,	%l3
	orncc	%i0,	0x1FED,	%l5
	fcmps	%fcc3,	%f20,	%f30
	xor	%g1,	0x0EDD,	%o7
	restore %g2, 0x1A67, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l1,	0x0323,	%o4
	fcmpgt16	%f6,	%f10,	%g5
	ld	[%l7 + 0x70],	%f26
	fmovsn	%icc,	%f30,	%f0
	sethi	0x0770,	%o0
	edge16ln	%i5,	%l0,	%l2
	fornot1	%f4,	%f4,	%f22
	array16	%i7,	%o3,	%o6
	movvs	%icc,	%l6,	%o5
	fcmple32	%f20,	%f8,	%i6
	umulcc	%i1,	0x1DCB,	%o2
	fmovrdlz	%i2,	%f12,	%f12
	mulscc	%g7,	0x1BCE,	%i4
	movneg	%xcc,	%o1,	%g3
	orncc	%i3,	%l4,	%g4
	movneg	%icc,	%l3,	%i0
	edge32ln	%g1,	%l5,	%g2
	movpos	%xcc,	%o7,	%g6
	edge8l	%o4,	%l1,	%g5
	movrgz	%o0,	%l0,	%l2
	movpos	%xcc,	%i7,	%i5
	fmovsg	%xcc,	%f17,	%f26
	alignaddr	%o3,	%l6,	%o5
	fpadd16s	%f8,	%f12,	%f23
	alignaddr	%o6,	%i1,	%i6
	sth	%i2,	[%l7 + 0x78]
	sll	%g7,	0x0B,	%i4
	movle	%icc,	%o1,	%g3
	edge16n	%i3,	%l4,	%g4
	movg	%xcc,	%l3,	%i0
	andncc	%o2,	%g1,	%g2
	fnors	%f19,	%f19,	%f25
	ldub	[%l7 + 0x14],	%o7
	fcmpne16	%f14,	%f20,	%g6
	udivcc	%l5,	0x0F6D,	%l1
	fmovd	%f16,	%f18
	array32	%o4,	%g5,	%o0
	fmovscs	%icc,	%f13,	%f25
	movrgz	%l2,	%i7,	%i5
	movle	%icc,	%l0,	%o3
	fmovsa	%icc,	%f8,	%f31
	array16	%l6,	%o5,	%o6
	move	%xcc,	%i6,	%i1
	stx	%g7,	[%l7 + 0x20]
	movneg	%icc,	%i2,	%o1
	ldd	[%l7 + 0x28],	%f10
	subc	%i4,	%g3,	%i3
	fmovdvc	%xcc,	%f30,	%f1
	fcmpgt32	%f16,	%f2,	%l4
	popc	0x13B5,	%g4
	fpsub16s	%f6,	%f6,	%f8
	array16	%l3,	%o2,	%g1
	ld	[%l7 + 0x60],	%f23
	fors	%f10,	%f24,	%f8
	fpmerge	%f26,	%f9,	%f22
	alignaddr	%i0,	%o7,	%g2
	srl	%g6,	%l5,	%l1
	edge8n	%o4,	%o0,	%l2
	mulx	%g5,	0x02BB,	%i7
	fcmped	%fcc2,	%f28,	%f0
	fnor	%f26,	%f4,	%f16
	mova	%xcc,	%i5,	%l0
	movne	%icc,	%o3,	%l6
	movne	%icc,	%o5,	%o6
	movcs	%icc,	%i6,	%i1
	siam	0x4
	ld	[%l7 + 0x7C],	%f19
	fmovrdne	%g7,	%f28,	%f18
	movne	%icc,	%i2,	%i4
	lduh	[%l7 + 0x6A],	%g3
	addccc	%o1,	%i3,	%l4
	stw	%l3,	[%l7 + 0x74]
	movvs	%xcc,	%o2,	%g4
	fmovsn	%icc,	%f20,	%f7
	movpos	%xcc,	%g1,	%i0
	ld	[%l7 + 0x1C],	%f1
	edge8n	%g2,	%o7,	%l5
	fpsub16s	%f7,	%f6,	%f19
	mova	%icc,	%l1,	%g6
	fmovdcs	%xcc,	%f24,	%f17
	edge16ln	%o0,	%l2,	%o4
	move	%icc,	%g5,	%i7
	edge8ln	%i5,	%o3,	%l6
	sir	0x0358
	sdivcc	%o5,	0x15E4,	%o6
	movleu	%icc,	%l0,	%i1
	ldsw	[%l7 + 0x5C],	%g7
	sdiv	%i6,	0x1183,	%i2
	fmovrdne	%g3,	%f22,	%f30
	movg	%xcc,	%o1,	%i3
	edge8l	%i4,	%l3,	%l4
	fmovsgu	%icc,	%f28,	%f14
	ldsb	[%l7 + 0x1D],	%g4
	fpsub32s	%f13,	%f9,	%f1
	std	%f12,	[%l7 + 0x20]
	movl	%icc,	%g1,	%i0
	movrgz	%g2,	%o7,	%o2
	sth	%l1,	[%l7 + 0x08]
	fmovsvc	%icc,	%f8,	%f22
	ldub	[%l7 + 0x1A],	%g6
	fnot2	%f28,	%f26
	movvs	%icc,	%o0,	%l5
	sir	0x1297
	addcc	%l2,	%o4,	%g5
	srl	%i7,	%o3,	%i5
	and	%l6,	0x136C,	%o6
	movle	%icc,	%o5,	%l0
	fmovsle	%xcc,	%f21,	%f24
	edge16n	%i1,	%g7,	%i6
	andcc	%i2,	%o1,	%i3
	xor	%g3,	%i4,	%l3
	ldd	[%l7 + 0x60],	%f24
	fsrc2	%f14,	%f12
	fnegs	%f7,	%f26
	lduh	[%l7 + 0x12],	%l4
	movvc	%icc,	%g1,	%i0
	fones	%f0
	pdist	%f0,	%f12,	%f24
	andcc	%g4,	%o7,	%o2
	stw	%l1,	[%l7 + 0x0C]
	array32	%g2,	%o0,	%l5
	edge16	%l2,	%o4,	%g6
	fmovsvc	%icc,	%f18,	%f1
	xnorcc	%g5,	%o3,	%i7
	movpos	%icc,	%l6,	%i5
	fpadd32s	%f11,	%f23,	%f10
	subc	%o6,	0x0B37,	%l0
	edge16n	%o5,	%i1,	%g7
	fandnot2	%f6,	%f14,	%f4
	or	%i6,	%i2,	%i3
	lduh	[%l7 + 0x4C],	%g3
	fmovsl	%xcc,	%f3,	%f24
	edge16ln	%i4,	%l3,	%o1
	edge8	%g1,	%i0,	%g4
	ldsh	[%l7 + 0x54],	%l4
	fxors	%f25,	%f1,	%f0
	addcc	%o7,	%o2,	%g2
	sub	%l1,	%o0,	%l2
	edge8	%l5,	%g6,	%o4
	subcc	%o3,	0x0539,	%i7
	orncc	%g5,	%l6,	%o6
	stx	%i5,	[%l7 + 0x58]
	movrlz	%o5,	%l0,	%g7
	movneg	%xcc,	%i6,	%i2
	subcc	%i3,	%g3,	%i1
	mulscc	%i4,	0x156C,	%o1
	movrgz	%l3,	0x292,	%i0
	movrgez	%g4,	0x35E,	%l4
	edge16n	%g1,	%o2,	%g2
	fmovsa	%icc,	%f8,	%f14
	mulscc	%l1,	%o0,	%l2
	subccc	%o7,	%l5,	%g6
	umul	%o4,	0x1809,	%i7
	edge8n	%o3,	%g5,	%o6
	fpsub16	%f20,	%f24,	%f20
	siam	0x0
	array32	%i5,	%o5,	%l0
	movgu	%icc,	%l6,	%i6
	fmovs	%f18,	%f25
	array32	%g7,	%i3,	%g3
	edge32	%i1,	%i4,	%i2
	movrgz	%l3,	0x07D,	%i0
	or	%g4,	%l4,	%o1
	movne	%icc,	%g1,	%g2
	fnand	%f12,	%f30,	%f20
	stb	%l1,	[%l7 + 0x24]
	ld	[%l7 + 0x14],	%f19
	movneg	%icc,	%o0,	%l2
	fmovrdlz	%o2,	%f26,	%f0
	fornot2s	%f26,	%f17,	%f8
	fmovde	%icc,	%f24,	%f12
	andcc	%o7,	%g6,	%l5
	stw	%i7,	[%l7 + 0x58]
	sdivx	%o4,	0x194C,	%g5
	edge32	%o3,	%o6,	%o5
	fcmpne32	%f4,	%f10,	%i5
	umulcc	%l0,	0x1C90,	%i6
	alignaddrl	%l6,	%g7,	%i3
	edge8	%i1,	%i4,	%i2
	ldsb	[%l7 + 0x12],	%l3
	movle	%icc,	%g3,	%g4
	sll	%i0,	0x1D,	%l4
	smulcc	%g1,	0x1FDE,	%o1
	edge8	%g2,	%l1,	%o0
	movleu	%xcc,	%o2,	%o7
	udivcc	%l2,	0x16D0,	%l5
	fmul8sux16	%f4,	%f28,	%f26
	fcmped	%fcc1,	%f4,	%f22
	movge	%xcc,	%i7,	%o4
	fcmps	%fcc2,	%f24,	%f13
	udiv	%g5,	0x1F8F,	%g6
	movpos	%xcc,	%o6,	%o5
	xorcc	%i5,	0x0556,	%l0
	andncc	%i6,	%l6,	%o3
	stw	%g7,	[%l7 + 0x28]
	add	%i3,	%i1,	%i2
	fcmpeq32	%f24,	%f26,	%i4
	ld	[%l7 + 0x40],	%f21
	movrgez	%l3,	%g3,	%i0
	xnor	%l4,	%g1,	%g4
	movn	%xcc,	%g2,	%o1
	xnor	%o0,	0x1DDE,	%l1
	edge16	%o2,	%o7,	%l5
	srl	%i7,	0x0F,	%o4
	ldub	[%l7 + 0x26],	%g5
	umul	%g6,	%l2,	%o5
	stx	%i5,	[%l7 + 0x18]
	sdivx	%o6,	0x08FC,	%i6
	addccc	%l0,	%l6,	%o3
	fors	%f7,	%f17,	%f2
	array16	%i3,	%i1,	%i2
	sir	0x1103
	mova	%xcc,	%g7,	%l3
	movg	%xcc,	%g3,	%i4
	ldsb	[%l7 + 0x2F],	%l4
	srax	%g1,	%g4,	%g2
	alignaddr	%o1,	%i0,	%l1
	srax	%o0,	0x14,	%o7
	movg	%icc,	%l5,	%i7
	srax	%o2,	%o4,	%g5
	fmovsneg	%xcc,	%f8,	%f1
	movpos	%icc,	%g6,	%l2
	fmovsa	%icc,	%f27,	%f14
	subcc	%i5,	%o6,	%i6
	edge16l	%o5,	%l6,	%l0
	sra	%o3,	0x01,	%i1
	movrlz	%i3,	0x375,	%g7
	move	%icc,	%l3,	%g3
	edge8n	%i4,	%i2,	%g1
	mulscc	%g4,	%l4,	%g2
	move	%icc,	%i0,	%l1
	move	%icc,	%o1,	%o7
	movneg	%xcc,	%o0,	%i7
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	stb	%g5,	[%l7 + 0x50]
	fnand	%f26,	%f0,	%f30
	andcc	%l5,	%l2,	%i5
	movg	%xcc,	%o6,	%g6
	sdivcc	%o5,	0x128D,	%l6
	movrne	%i6,	0x3BF,	%l0
	sll	%i1,	0x17,	%i3
	umulcc	%o3,	%g7,	%g3
	fcmpgt32	%f30,	%f24,	%i4
	movne	%xcc,	%l3,	%g1
	alignaddrl	%g4,	%l4,	%g2
	ldd	[%l7 + 0x38],	%f26
	andcc	%i2,	%i0,	%l1
	edge32l	%o1,	%o7,	%i7
	fmovrsgez	%o0,	%f9,	%f19
	array32	%o4,	%o2,	%g5
	fpadd32s	%f14,	%f11,	%f31
	movgu	%xcc,	%l2,	%l5
	movrlz	%o6,	%i5,	%g6
	fmovsleu	%icc,	%f5,	%f19
	udivx	%o5,	0x1D0E,	%l6
	movg	%icc,	%i6,	%i1
	ldd	[%l7 + 0x48],	%i2
	movle	%xcc,	%l0,	%g7
	fsrc1s	%f2,	%f23
	ldd	[%l7 + 0x38],	%o2
	ldsb	[%l7 + 0x6F],	%g3
	movrgez	%i4,	%l3,	%g4
	edge16n	%l4,	%g1,	%i2
	ldub	[%l7 + 0x6F],	%g2
	fcmpes	%fcc0,	%f13,	%f30
	fnand	%f4,	%f22,	%f16
	nop
	set	0x28, %o1
	stw	%i0,	[%l7 + %o1]
	addcc	%l1,	0x1BCB,	%o7
	umul	%i7,	%o0,	%o1
	sdiv	%o2,	0x0F35,	%o4
	mulscc	%g5,	%l5,	%o6
	fpadd32s	%f16,	%f5,	%f14
	fmovsleu	%icc,	%f26,	%f28
	udivx	%i5,	0x0E9B,	%g6
	xnor	%l2,	0x0E09,	%l6
	mova	%xcc,	%i6,	%i1
	smul	%o5,	%i3,	%l0
	movvs	%xcc,	%g7,	%g3
	array16	%o3,	%l3,	%i4
	movgu	%icc,	%g4,	%l4
	alignaddrl	%i2,	%g2,	%g1
	srlx	%l1,	%o7,	%i7
	movl	%icc,	%i0,	%o0
	umul	%o1,	0x1322,	%o2
	fnot2	%f26,	%f30
	edge32	%g5,	%o4,	%l5
	sdivcc	%i5,	0x1549,	%g6
	ldx	[%l7 + 0x48],	%o6
	movvs	%xcc,	%l6,	%l2
	movge	%xcc,	%i1,	%i6
	fmovdl	%icc,	%f27,	%f14
	fmovrdgez	%o5,	%f22,	%f24
	ldsb	[%l7 + 0x36],	%i3
	sra	%g7,	%g3,	%l0
	mulx	%o3,	%i4,	%g4
	edge16l	%l4,	%i2,	%l3
	movpos	%icc,	%g1,	%g2
	movg	%icc,	%o7,	%i7
	sub	%l1,	0x04A0,	%i0
	fmovsa	%icc,	%f11,	%f15
	sra	%o1,	%o0,	%g5
	addcc	%o4,	%o2,	%l5
	movle	%xcc,	%g6,	%i5
	move	%xcc,	%o6,	%l6
	movcs	%icc,	%l2,	%i1
	stb	%i6,	[%l7 + 0x15]
	fcmpeq32	%f22,	%f4,	%o5
	sth	%g7,	[%l7 + 0x42]
	edge32n	%i3,	%l0,	%g3
	movrgez	%i4,	%o3,	%g4
	subccc	%l4,	0x024F,	%i2
	fmovsn	%xcc,	%f16,	%f6
	orncc	%l3,	0x03E4,	%g1
	edge8ln	%g2,	%i7,	%l1
	lduw	[%l7 + 0x58],	%i0
	xnorcc	%o7,	%o0,	%o1
	or	%g5,	0x0486,	%o2
	fmovdvs	%icc,	%f25,	%f9
	andcc	%o4,	0x1500,	%l5
	fpack32	%f2,	%f12,	%f20
	udivx	%g6,	0x1285,	%o6
	movre	%l6,	%i5,	%l2
	array32	%i6,	%i1,	%o5
	andcc	%g7,	%l0,	%g3
	edge8ln	%i4,	%i3,	%o3
	alignaddrl	%l4,	%g4,	%i2
	sir	0x0547
	edge16	%g1,	%l3,	%i7
	ldsw	[%l7 + 0x08],	%g2
	alignaddrl	%i0,	%o7,	%o0
	faligndata	%f6,	%f24,	%f28
	mulscc	%l1,	%o1,	%g5
	movleu	%icc,	%o2,	%l5
	fsrc2s	%f15,	%f2
	addccc	%o4,	%o6,	%l6
	movrgz	%i5,	0x378,	%l2
	lduw	[%l7 + 0x08],	%i6
	andn	%i1,	0x1FB7,	%o5
	sub	%g7,	%l0,	%g6
	fnot2	%f18,	%f8
	movpos	%xcc,	%g3,	%i3
	mova	%icc,	%o3,	%i4
	pdist	%f26,	%f22,	%f20
	lduw	[%l7 + 0x20],	%l4
	xorcc	%g4,	0x14C0,	%g1
	fmovd	%f24,	%f18
	smulcc	%i2,	0x0E7C,	%i7
	edge32	%g2,	%i0,	%o7
	edge32n	%l3,	%o0,	%l1
	stx	%g5,	[%l7 + 0x50]
	srax	%o1,	0x05,	%l5
	movgu	%icc,	%o2,	%o6
	movrgez	%l6,	%i5,	%o4
	or	%i6,	0x17B9,	%l2
	mulscc	%o5,	0x1DBD,	%i1
	movcs	%icc,	%l0,	%g6
	umulcc	%g3,	0x16C3,	%i3
	fmovsn	%icc,	%f8,	%f20
	fmovdneg	%icc,	%f24,	%f17
	movvs	%icc,	%o3,	%i4
	mulx	%g7,	%l4,	%g1
	nop
	set	0x28, %i7
	stx	%g4,	[%l7 + %i7]
	movrgez	%i2,	%g2,	%i7
	movleu	%xcc,	%i0,	%o7
	array16	%l3,	%o0,	%l1
	fmovrdlez	%g5,	%f6,	%f16
	bshuffle	%f12,	%f4,	%f6
	movle	%xcc,	%o1,	%o2
	sra	%o6,	0x06,	%l6
	sethi	0x070F,	%l5
	addcc	%i5,	0x13D7,	%i6
	sllx	%o4,	%l2,	%i1
	sethi	0x0824,	%o5
	andncc	%g6,	%l0,	%i3
	ldd	[%l7 + 0x30],	%f14
	array32	%g3,	%i4,	%g7
	sra	%o3,	%l4,	%g1
	sdiv	%i2,	0x02D2,	%g4
	alignaddrl	%i7,	%g2,	%i0
	subc	%l3,	%o7,	%l1
	mulx	%o0,	0x1D33,	%g5
	movvc	%icc,	%o1,	%o6
	array16	%l6,	%l5,	%i5
	save %i6, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f16,	%f0
	array32	%o2,	%i1,	%g6
	movcs	%xcc,	%l0,	%o5
	popc	%i3,	%i4
	smul	%g7,	%o3,	%l4
	srl	%g1,	%i2,	%g3
	fxor	%f8,	%f0,	%f10
	andcc	%g4,	%g2,	%i7
	array8	%i0,	%o7,	%l3
	ld	[%l7 + 0x60],	%f22
	movvs	%xcc,	%l1,	%g5
	srlx	%o0,	%o6,	%l6
	smulcc	%l5,	%i5,	%o1
	ldub	[%l7 + 0x49],	%i6
	addccc	%l2,	%o2,	%o4
	mulx	%i1,	0x1BFA,	%l0
	fsrc1	%f0,	%f4
	xor	%o5,	0x0107,	%g6
	sdiv	%i4,	0x00D0,	%i3
	edge8	%o3,	%g7,	%g1
	movneg	%icc,	%i2,	%l4
	ld	[%l7 + 0x70],	%f12
	fmovdcs	%xcc,	%f12,	%f23
	smul	%g3,	0x1136,	%g4
	orcc	%i7,	0x008C,	%g2
	movgu	%icc,	%i0,	%l3
	ldd	[%l7 + 0x50],	%o6
	fmovrslez	%l1,	%f22,	%f16
	fmul8x16au	%f29,	%f9,	%f8
	fnands	%f30,	%f20,	%f4
	movvc	%xcc,	%o0,	%o6
	addc	%l6,	0x1C26,	%l5
	or	%g5,	%o1,	%i5
	sll	%i6,	%l2,	%o4
	movrlz	%i1,	%l0,	%o5
	fmovsne	%xcc,	%f21,	%f15
	smul	%g6,	%o2,	%i3
	movn	%icc,	%i4,	%o3
	edge8l	%g7,	%i2,	%g1
	sir	0x1046
	movrlez	%g3,	%g4,	%l4
	fpadd16s	%f13,	%f24,	%f4
	andncc	%i7,	%i0,	%g2
	lduw	[%l7 + 0x7C],	%l3
	sethi	0x014C,	%l1
	fmovdvs	%xcc,	%f13,	%f26
	orcc	%o0,	%o6,	%o7
	sdivx	%l6,	0x177C,	%g5
	edge16	%l5,	%i5,	%o1
	stb	%i6,	[%l7 + 0x27]
	srl	%o4,	%i1,	%l0
	fandnot1s	%f23,	%f11,	%f26
	fzeros	%f18
	movrlez	%l2,	0x17A,	%o5
	sethi	0x1EE0,	%g6
	array8	%i3,	%o2,	%i4
	smulcc	%o3,	0x1C25,	%i2
	fmovdl	%xcc,	%f15,	%f25
	lduw	[%l7 + 0x5C],	%g1
	fmovdgu	%xcc,	%f18,	%f11
	edge8l	%g7,	%g3,	%l4
	edge16ln	%i7,	%i0,	%g4
	edge8ln	%g2,	%l1,	%l3
	sll	%o6,	%o7,	%o0
	sra	%g5,	0x16,	%l6
	edge8l	%i5,	%l5,	%o1
	movrlz	%i6,	%i1,	%l0
	addcc	%l2,	%o4,	%g6
	fzero	%f4
	edge8	%o5,	%i3,	%o2
	xnorcc	%o3,	0x10CA,	%i4
	fpsub32	%f26,	%f28,	%f8
	edge8	%i2,	%g7,	%g3
	ldd	[%l7 + 0x30],	%f12
	fmovsge	%icc,	%f25,	%f7
	udiv	%l4,	0x0F46,	%i7
	mulscc	%i0,	0x1A05,	%g4
	fmovsn	%xcc,	%f11,	%f8
	edge16l	%g2,	%l1,	%g1
	std	%f30,	[%l7 + 0x60]
	edge16n	%o6,	%o7,	%o0
	add	%g5,	0x1421,	%l6
	fmovdn	%icc,	%f12,	%f31
	addc	%i5,	0x1A22,	%l3
	fnors	%f13,	%f1,	%f8
	sll	%l5,	0x1D,	%i6
	edge32	%o1,	%l0,	%l2
	alignaddr	%i1,	%o4,	%g6
	movge	%xcc,	%i3,	%o5
	fabss	%f18,	%f2
	xor	%o3,	0x0B57,	%i4
	ldsw	[%l7 + 0x78],	%i2
	smul	%o2,	%g3,	%g7
	fcmple16	%f12,	%f28,	%l4
	addccc	%i0,	0x0395,	%i7
	fmovrsgez	%g2,	%f5,	%f9
	umul	%g4,	%g1,	%l1
	sdivx	%o6,	0x0BAD,	%o0
	st	%f16,	[%l7 + 0x6C]
	movle	%xcc,	%o7,	%l6
	alignaddrl	%i5,	%g5,	%l5
	fmovrsne	%l3,	%f9,	%f6
	xor	%o1,	0x1AFC,	%i6
	lduw	[%l7 + 0x6C],	%l2
	fcmpes	%fcc1,	%f18,	%f10
	andcc	%i1,	%o4,	%l0
	edge32ln	%g6,	%o5,	%i3
	fandnot2	%f20,	%f4,	%f26
	fmovsneg	%icc,	%f18,	%f17
	smulcc	%i4,	0x07E2,	%o3
	movge	%xcc,	%i2,	%o2
	sub	%g7,	0x1CEB,	%l4
	edge32n	%i0,	%i7,	%g3
	movne	%icc,	%g4,	%g2
	fexpand	%f23,	%f16
	movn	%xcc,	%g1,	%o6
	movneg	%icc,	%o0,	%l1
	movpos	%icc,	%o7,	%i5
	lduw	[%l7 + 0x4C],	%l6
	subc	%g5,	0x0FB4,	%l5
	fmuld8sux16	%f5,	%f4,	%f26
	umul	%o1,	0x020F,	%l3
	sra	%i6,	%l2,	%i1
	edge8	%l0,	%o4,	%g6
	movrgz	%o5,	%i4,	%o3
	fmovrdgz	%i3,	%f30,	%f30
	sethi	0x0359,	%i2
	fpack32	%f22,	%f6,	%f6
	subcc	%g7,	%o2,	%i0
	stw	%l4,	[%l7 + 0x58]
	popc	0x1E55,	%i7
	popc	%g4,	%g2
	fmovrse	%g3,	%f24,	%f19
	addcc	%o6,	%g1,	%l1
	sir	0x0E5C
	movpos	%icc,	%o0,	%o7
	fmul8x16au	%f2,	%f31,	%f4
	movge	%xcc,	%i5,	%l6
	stx	%g5,	[%l7 + 0x18]
	movvs	%icc,	%o1,	%l5
	andcc	%i6,	0x018D,	%l2
	subccc	%l3,	0x0155,	%l0
	edge16ln	%o4,	%g6,	%i1
	fnegs	%f11,	%f13
	srax	%i4,	%o5,	%i3
	array32	%o3,	%i2,	%g7
	movvs	%xcc,	%o2,	%l4
	movrlz	%i7,	%i0,	%g4
	udiv	%g2,	0x1BFF,	%o6
	sdivx	%g3,	0x1007,	%g1
	fpack16	%f26,	%f1
	fornot2s	%f14,	%f17,	%f3
	stx	%l1,	[%l7 + 0x10]
	edge32	%o7,	%i5,	%o0
	lduh	[%l7 + 0x70],	%g5
	edge8	%l6,	%o1,	%i6
	movre	%l5,	%l2,	%l3
	sdivx	%l0,	0x004E,	%g6
	and	%o4,	%i4,	%o5
	sth	%i1,	[%l7 + 0x24]
	edge16n	%i3,	%o3,	%i2
	movge	%xcc,	%g7,	%o2
	umul	%l4,	0x0B61,	%i7
	udivcc	%i0,	0x10E2,	%g2
	edge32n	%o6,	%g4,	%g1
	fsrc2s	%f9,	%f13
	fmovrdne	%l1,	%f22,	%f12
	movleu	%xcc,	%o7,	%i5
	edge8ln	%g3,	%o0,	%g5
	array32	%l6,	%o1,	%l5
	umulcc	%i6,	0x1EDD,	%l2
	edge32n	%l0,	%g6,	%l3
	sllx	%o4,	0x0F,	%i4
	xnorcc	%o5,	0x0B48,	%i1
	movre	%o3,	0x37C,	%i2
	smulcc	%g7,	0x027C,	%o2
	nop
	set	0x6D, %o0
	stb	%i3,	[%l7 + %o0]
	sra	%l4,	0x1A,	%i0
	fpsub16	%f30,	%f30,	%f14
	fmovspos	%icc,	%f21,	%f14
	orncc	%i7,	%o6,	%g2
	ld	[%l7 + 0x68],	%f23
	ld	[%l7 + 0x34],	%f30
	addcc	%g4,	0x1ED0,	%g1
	umulcc	%l1,	0x1CD2,	%i5
	lduh	[%l7 + 0x78],	%o7
	sethi	0x0A18,	%g3
	movrgz	%g5,	0x1BF,	%o0
	fmovs	%f25,	%f9
	smul	%o1,	%l6,	%i6
	edge8	%l5,	%l2,	%l0
	for	%f26,	%f2,	%f6
	movrgz	%g6,	0x02E,	%o4
	addccc	%l3,	0x17E9,	%o5
	fmul8ulx16	%f24,	%f30,	%f4
	sethi	0x0646,	%i1
	fnot2	%f30,	%f18
	fabsd	%f12,	%f22
	fornot2s	%f17,	%f4,	%f21
	move	%xcc,	%i4,	%i2
	movge	%xcc,	%o3,	%g7
	andcc	%i3,	0x15AE,	%l4
	fmovsvc	%icc,	%f25,	%f24
	sir	0x04F9
	smulcc	%o2,	%i7,	%i0
	srl	%g2,	%o6,	%g1
	subcc	%l1,	0x1A3E,	%g4
	subccc	%i5,	0x0267,	%o7
	movleu	%icc,	%g3,	%o0
	udivx	%g5,	0x0E36,	%o1
	subcc	%i6,	0x0E9D,	%l5
	sdiv	%l6,	0x129E,	%l0
	edge32l	%l2,	%o4,	%g6
	fmovrse	%l3,	%f3,	%f21
	ldsh	[%l7 + 0x62],	%o5
	alignaddrl	%i4,	%i1,	%i2
	popc	0x0C92,	%g7
	movrne	%o3,	0x169,	%l4
	fcmpeq32	%f10,	%f0,	%o2
	edge16	%i3,	%i7,	%i0
	movrgez	%g2,	0x335,	%o6
	ldx	[%l7 + 0x50],	%g1
	stb	%g4,	[%l7 + 0x5E]
	fpack32	%f18,	%f28,	%f26
	fmovdl	%icc,	%f17,	%f25
	fmovsvc	%xcc,	%f22,	%f27
	udiv	%l1,	0x15C9,	%o7
	movrgez	%g3,	%o0,	%g5
	orn	%o1,	%i6,	%l5
	ldd	[%l7 + 0x08],	%f10
	umul	%l6,	0x1A9F,	%i5
	fabsd	%f0,	%f30
	orncc	%l2,	0x0077,	%l0
	movrlz	%o4,	%l3,	%o5
	restore %i4, 0x0211, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f12,	%f0,	%f20
	movgu	%icc,	%i2,	%g6
	edge8n	%g7,	%o3,	%l4
	movrne	%o2,	0x2C5,	%i3
	fcmpd	%fcc0,	%f26,	%f4
	ld	[%l7 + 0x60],	%f1
	edge32l	%i7,	%g2,	%o6
	array16	%i0,	%g1,	%l1
	fmul8x16al	%f4,	%f3,	%f4
	xnor	%o7,	%g3,	%g4
	movrlez	%o0,	0x32E,	%o1
	xorcc	%g5,	%l5,	%i6
	fcmpd	%fcc1,	%f22,	%f20
	movneg	%xcc,	%l6,	%l2
	ldsh	[%l7 + 0x7A],	%i5
	udiv	%o4,	0x08BB,	%l3
	sllx	%l0,	%i4,	%o5
	andn	%i1,	0x1E28,	%g6
	save %i2, %o3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g7,	%o2,	%i7
	movvc	%icc,	%i3,	%g2
	fmovrsne	%o6,	%f6,	%f27
	edge8n	%g1,	%i0,	%o7
	subcc	%l1,	%g3,	%o0
	fornot2s	%f15,	%f15,	%f22
	movrne	%o1,	0x143,	%g5
	nop
	set	0x4C, %o7
	stw	%l5,	[%l7 + %o7]
	fpadd32s	%f13,	%f1,	%f6
	alignaddrl	%i6,	%l6,	%l2
	movre	%g4,	0x0EF,	%o4
	fmovsleu	%icc,	%f16,	%f27
	movne	%xcc,	%i5,	%l0
	edge16n	%i4,	%o5,	%i1
	andncc	%g6,	%i2,	%l3
	move	%icc,	%o3,	%l4
	addccc	%o2,	0x030D,	%g7
	fornot2	%f16,	%f24,	%f10
	sub	%i3,	%i7,	%g2
	movle	%icc,	%g1,	%i0
	fmul8x16au	%f6,	%f26,	%f10
	fmovrde	%o7,	%f30,	%f6
	smulcc	%o6,	0x12AC,	%l1
	for	%f22,	%f10,	%f26
	ldub	[%l7 + 0x17],	%g3
	fpadd32s	%f10,	%f9,	%f30
	movvc	%xcc,	%o1,	%g5
	movvc	%icc,	%o0,	%l5
	sethi	0x1CF7,	%l6
	fors	%f6,	%f28,	%f0
	movvs	%icc,	%i6,	%g4
	umul	%l2,	0x1B53,	%i5
	mulx	%l0,	0x155A,	%i4
	smul	%o5,	%i1,	%o4
	mova	%icc,	%i2,	%g6
	mova	%xcc,	%o3,	%l4
	movne	%icc,	%o2,	%g7
	sdiv	%l3,	0x0F63,	%i3
	movgu	%xcc,	%i7,	%g1
	edge8l	%g2,	%o7,	%o6
	fmovsl	%xcc,	%f10,	%f25
	fcmpne32	%f30,	%f20,	%l1
	edge8ln	%g3,	%o1,	%g5
	subc	%o0,	%i0,	%l5
	xnorcc	%i6,	0x13E4,	%l6
	andcc	%l2,	0x1A9F,	%g4
	movrgz	%i5,	%l0,	%o5
	fmovrsgez	%i1,	%f15,	%f9
	movpos	%xcc,	%i4,	%i2
	sll	%o4,	0x1F,	%o3
	edge8n	%l4,	%o2,	%g6
	fandnot1s	%f20,	%f8,	%f16
	ldsh	[%l7 + 0x6A],	%g7
	pdist	%f22,	%f12,	%f18
	movl	%xcc,	%i3,	%l3
	fandnot1s	%f2,	%f3,	%f10
	fcmps	%fcc3,	%f25,	%f30
	sdivx	%g1,	0x1E9B,	%g2
	movrlz	%i7,	0x0B4,	%o7
	fnot2	%f14,	%f24
	movle	%xcc,	%o6,	%g3
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	lduw	[%l7 + 0x7C],	%o1
	andncc	%i0,	%l5,	%o0
	fxnors	%f20,	%f21,	%f15
	movg	%icc,	%i6,	%l6
	edge32ln	%l2,	%i5,	%g4
	lduh	[%l7 + 0x1E],	%l0
	lduh	[%l7 + 0x7E],	%o5
	addc	%i4,	%i2,	%i1
	fmovsl	%xcc,	%f17,	%f10
	fpadd32	%f0,	%f24,	%f18
	fzero	%f20
	fandnot1	%f26,	%f24,	%f16
	array16	%o3,	%l4,	%o4
	movcc	%xcc,	%g6,	%o2
	sir	0x03CE
	edge32l	%i3,	%g7,	%g1
	andn	%g2,	%l3,	%i7
	movrne	%o6,	%g3,	%l1
	edge8n	%o7,	%o1,	%i0
	movgu	%icc,	%g5,	%o0
	edge16n	%l5,	%i6,	%l6
	movvc	%xcc,	%l2,	%g4
	movre	%i5,	%o5,	%i4
	fabss	%f18,	%f14
	ldsb	[%l7 + 0x7F],	%i2
	fnand	%f18,	%f0,	%f28
	movvs	%xcc,	%i1,	%l0
	sethi	0x0162,	%l4
	subc	%o3,	0x1BD3,	%o4
	move	%icc,	%g6,	%i3
	array8	%o2,	%g7,	%g1
	array8	%l3,	%g2,	%i7
	sdivcc	%g3,	0x0AEC,	%l1
	sdivcc	%o7,	0x101C,	%o1
	fmovdle	%xcc,	%f21,	%f8
	addccc	%i0,	0x194E,	%o6
	sra	%o0,	%g5,	%i6
	fmovdcs	%xcc,	%f29,	%f6
	ldsw	[%l7 + 0x5C],	%l6
	sdiv	%l5,	0x1F76,	%g4
	fcmple32	%f22,	%f10,	%i5
	umul	%l2,	%o5,	%i2
	fands	%f6,	%f12,	%f13
	movl	%xcc,	%i4,	%i1
	edge16n	%l0,	%l4,	%o3
	stw	%g6,	[%l7 + 0x7C]
	sub	%o4,	%i3,	%o2
	edge16ln	%g7,	%l3,	%g2
	edge8	%g1,	%g3,	%l1
	nop
	set	0x50, %o4
	ldsw	[%l7 + %o4],	%i7
	movvc	%xcc,	%o7,	%i0
	move	%icc,	%o6,	%o1
	orn	%g5,	0x1D8A,	%o0
	fzero	%f28
	movleu	%xcc,	%l6,	%i6
	movrlz	%g4,	%i5,	%l2
	fnors	%f20,	%f30,	%f30
	fcmpeq32	%f22,	%f2,	%l5
	andcc	%o5,	%i4,	%i1
	sll	%i2,	0x12,	%l0
	edge16ln	%l4,	%g6,	%o3
	fmul8x16au	%f22,	%f2,	%f20
	or	%i3,	0x04D0,	%o4
	addccc	%g7,	%o2,	%l3
	sra	%g1,	0x1F,	%g2
	popc	0x1A94,	%l1
	udivcc	%g3,	0x161E,	%i7
	movcs	%xcc,	%i0,	%o6
	array8	%o1,	%g5,	%o0
	movcs	%xcc,	%l6,	%o7
	fmovsle	%xcc,	%f23,	%f28
	movgu	%icc,	%g4,	%i5
	nop
	set	0x4A, %l3
	ldsb	[%l7 + %l3],	%l2
	mova	%xcc,	%i6,	%o5
	ldd	[%l7 + 0x50],	%f0
	lduh	[%l7 + 0x74],	%l5
	movn	%xcc,	%i1,	%i2
	movcs	%xcc,	%l0,	%i4
	smulcc	%l4,	%g6,	%i3
	edge16n	%o4,	%g7,	%o2
	sir	0x01E6
	movrgez	%o3,	0x1C0,	%g1
	fcmpes	%fcc1,	%f18,	%f3
	orn	%l3,	0x0ED0,	%l1
	fmul8x16au	%f18,	%f5,	%f6
	movleu	%xcc,	%g2,	%i7
	smulcc	%i0,	%o6,	%o1
	umul	%g5,	%g3,	%o0
	sub	%o7,	%l6,	%g4
	mulscc	%l2,	%i6,	%o5
	fcmpeq32	%f16,	%f16,	%i5
	fpack32	%f22,	%f4,	%f26
	umulcc	%l5,	%i1,	%l0
	sra	%i4,	0x08,	%i2
	orn	%l4,	%i3,	%o4
	restore %g7, 0x1720, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g6,	%o3,	%g1
	addcc	%l3,	0x0D64,	%l1
	edge32	%i7,	%g2,	%i0
	udivx	%o6,	0x1ED3,	%o1
	movcs	%icc,	%g5,	%o0
	movne	%xcc,	%o7,	%g3
	fmovrdgez	%g4,	%f10,	%f18
	movpos	%icc,	%l6,	%l2
	array16	%o5,	%i5,	%i6
	save %i1, 0x1EC5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f22,	%f14
	ld	[%l7 + 0x14],	%f1
	add	%i4,	0x1B2E,	%i2
	nop
	set	0x76, %l4
	ldub	[%l7 + %l4],	%l5
	fcmple16	%f0,	%f0,	%i3
	udivcc	%l4,	0x1444,	%o4
	fmovsle	%xcc,	%f1,	%f15
	xorcc	%o2,	%g6,	%o3
	lduh	[%l7 + 0x20],	%g1
	array8	%g7,	%l3,	%i7
	xnor	%g2,	%i0,	%l1
	save %o6, %o1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o7,	%o0,	%g4
	mulscc	%g3,	0x05F0,	%l6
	movg	%icc,	%l2,	%o5
	edge32l	%i6,	%i1,	%l0
	movne	%icc,	%i4,	%i2
	andncc	%i5,	%l5,	%i3
	sth	%o4,	[%l7 + 0x6C]
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	fandnot2s	%f6,	%f5,	%f28
	edge32ln	%o3,	%g1,	%l3
	fxors	%f26,	%f19,	%f25
	movge	%xcc,	%i7,	%g7
	udivcc	%i0,	0x0AEE,	%g2
	array16	%l1,	%o6,	%o1
	movrlz	%o7,	0x07B,	%o0
	andncc	%g4,	%g5,	%l6
	fnegd	%f28,	%f16
	fmovdn	%icc,	%f7,	%f8
	smulcc	%g3,	%o5,	%l2
	movgu	%icc,	%i1,	%l0
	move	%xcc,	%i6,	%i2
	srl	%i5,	0x17,	%i4
	srax	%i3,	%l5,	%o2
	movrne	%l4,	%g6,	%o4
	fmovsvs	%xcc,	%f8,	%f10
	array8	%g1,	%o3,	%i7
	stw	%l3,	[%l7 + 0x68]
	fmovde	%xcc,	%f4,	%f1
	sdivcc	%g7,	0x02A2,	%i0
	fzeros	%f15
	addcc	%g2,	%l1,	%o1
	lduh	[%l7 + 0x20],	%o7
	movleu	%xcc,	%o0,	%g4
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%f10
	udiv	%g5,	0x1A11,	%o6
	sethi	0x020A,	%g3
	edge32l	%o5,	%l2,	%l6
	alignaddrl	%i1,	%l0,	%i2
	fzero	%f8
	ldsh	[%l7 + 0x0A],	%i5
	std	%f26,	[%l7 + 0x20]
	fmovrdlz	%i4,	%f24,	%f12
	smulcc	%i6,	0x05FB,	%i3
	sdiv	%o2,	0x146E,	%l5
	movcs	%xcc,	%g6,	%l4
	popc	0x04AD,	%o4
	alignaddrl	%g1,	%o3,	%l3
	movpos	%icc,	%g7,	%i0
	save %i7, %g2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o7,	%o0,	%o1
	ldx	[%l7 + 0x20],	%g5
	ldx	[%l7 + 0x78],	%o6
	sll	%g3,	%g4,	%l2
	movgu	%icc,	%l6,	%o5
	ldsh	[%l7 + 0x4E],	%l0
	xnorcc	%i2,	0x07AA,	%i1
	edge32l	%i4,	%i6,	%i5
	subc	%i3,	0x0303,	%o2
	nop
	set	0x78, %g3
	stx	%l5,	[%l7 + %g3]
	ldx	[%l7 + 0x78],	%g6
	movneg	%icc,	%l4,	%o4
	fmovdpos	%icc,	%f4,	%f22
	ldd	[%l7 + 0x40],	%f8
	xnor	%o3,	%g1,	%l3
	save %i0, 0x1CA8, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f30,	%f22,	%g2
	orcc	%l1,	%o7,	%o0
	array8	%o1,	%g5,	%i7
	ldsb	[%l7 + 0x15],	%o6
	mova	%icc,	%g4,	%l2
	orn	%g3,	0x0A6D,	%l6
	movvc	%icc,	%l0,	%o5
	move	%xcc,	%i2,	%i1
	fandnot2	%f2,	%f18,	%f10
	ldx	[%l7 + 0x40],	%i6
	ldsb	[%l7 + 0x51],	%i5
	movg	%xcc,	%i3,	%i4
	umul	%l5,	%g6,	%o2
	stx	%o4,	[%l7 + 0x70]
	srl	%o3,	%l4,	%l3
	movg	%icc,	%g1,	%i0
	fornot2	%f14,	%f26,	%f4
	edge8	%g7,	%g2,	%o7
	popc	0x1D9D,	%l1
	smul	%o0,	%g5,	%i7
	and	%o1,	0x14A3,	%g4
	umul	%o6,	0x1777,	%l2
	movpos	%xcc,	%g3,	%l6
	edge16ln	%l0,	%o5,	%i1
	add	%i6,	%i5,	%i2
	alignaddrl	%i4,	%i3,	%g6
	movge	%icc,	%l5,	%o2
	movle	%xcc,	%o4,	%o3
	sdiv	%l3,	0x1D39,	%g1
	fmovdvs	%xcc,	%f2,	%f11
	edge16	%i0,	%l4,	%g7
	ldd	[%l7 + 0x48],	%o6
	orncc	%l1,	0x0376,	%g2
	sethi	0x00D5,	%o0
	sdivx	%i7,	0x1321,	%o1
	ldub	[%l7 + 0x5A],	%g5
	fnand	%f20,	%f14,	%f18
	edge8n	%g4,	%o6,	%l2
	srax	%g3,	%l0,	%o5
	sdivcc	%l6,	0x13B6,	%i6
	alignaddr	%i5,	%i1,	%i2
	fmovsg	%xcc,	%f24,	%f8
	lduw	[%l7 + 0x40],	%i3
	fmovsa	%xcc,	%f21,	%f31
	fmovspos	%xcc,	%f15,	%f6
	nop
	set	0x48, %l5
	ldsw	[%l7 + %l5],	%i4
	movcs	%icc,	%l5,	%g6
	edge8l	%o4,	%o2,	%l3
	orcc	%g1,	%o3,	%i0
	movrlez	%g7,	%l4,	%l1
	fmovspos	%xcc,	%f28,	%f5
	movg	%icc,	%g2,	%o7
	stb	%o0,	[%l7 + 0x53]
	fxors	%f19,	%f13,	%f28
	lduh	[%l7 + 0x5C],	%o1
	subccc	%g5,	%i7,	%o6
	movleu	%icc,	%l2,	%g4
	stx	%g3,	[%l7 + 0x10]
	movneg	%icc,	%o5,	%l6
	mulx	%i6,	%l0,	%i1
	fmovsleu	%icc,	%f29,	%f22
	fnand	%f10,	%f16,	%f6
	stb	%i2,	[%l7 + 0x3E]
	sth	%i3,	[%l7 + 0x5A]
	edge8ln	%i4,	%i5,	%g6
	umulcc	%l5,	0x0B42,	%o4
	fmul8sux16	%f28,	%f24,	%f10
	or	%l3,	%o2,	%g1
	movrlez	%o3,	0x1E1,	%i0
	st	%f21,	[%l7 + 0x60]
	fnegd	%f4,	%f26
	fmovdvc	%icc,	%f13,	%f29
	array16	%g7,	%l1,	%g2
	udivx	%l4,	0x0F2D,	%o7
	fmovrdlez	%o0,	%f16,	%f8
	move	%xcc,	%o1,	%i7
	fmul8ulx16	%f0,	%f6,	%f22
	movvc	%xcc,	%o6,	%g5
	fmuld8ulx16	%f7,	%f2,	%f6
	mulscc	%l2,	0x1100,	%g3
	mulscc	%g4,	0x107A,	%o5
	edge16	%i6,	%l0,	%i1
	fnands	%f9,	%f2,	%f20
	lduh	[%l7 + 0x6E],	%i2
	alignaddr	%i3,	%l6,	%i4
	array32	%g6,	%l5,	%i5
	array16	%l3,	%o4,	%g1
	restore %o3, %i0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o2,	0x02,	%g2
	sub	%l1,	%o7,	%l4
	ldsb	[%l7 + 0x45],	%o1
	movle	%icc,	%o0,	%o6
	umul	%g5,	0x01A4,	%i7
	movrgz	%g3,	0x18C,	%l2
	ldsh	[%l7 + 0x60],	%o5
	or	%i6,	0x07E4,	%l0
	siam	0x4
	fors	%f4,	%f4,	%f14
	stx	%i1,	[%l7 + 0x18]
	movcc	%icc,	%i2,	%g4
	lduh	[%l7 + 0x46],	%l6
	sra	%i4,	%i3,	%g6
	lduh	[%l7 + 0x72],	%l5
	fmovsge	%xcc,	%f6,	%f2
	xnorcc	%l3,	0x1D32,	%i5
	array16	%o4,	%o3,	%g1
	edge16l	%g7,	%i0,	%o2
	fmovdl	%xcc,	%f16,	%f10
	fmovse	%xcc,	%f27,	%f0
	ldsh	[%l7 + 0x7C],	%l1
	std	%f14,	[%l7 + 0x30]
	edge8	%o7,	%g2,	%o1
	ldub	[%l7 + 0x6F],	%l4
	movn	%xcc,	%o6,	%o0
	for	%f8,	%f2,	%f12
	movn	%icc,	%i7,	%g3
	movrgz	%l2,	0x2AF,	%o5
	xor	%i6,	%g5,	%l0
	edge16	%i1,	%g4,	%l6
	popc	0x12DE,	%i4
	movrgez	%i2,	%g6,	%i3
	edge32	%l3,	%i5,	%l5
	stb	%o3,	[%l7 + 0x59]
	xnorcc	%o4,	%g1,	%g7
	add	%i0,	%l1,	%o7
	fmovsne	%xcc,	%f31,	%f15
	move	%xcc,	%g2,	%o1
	alignaddrl	%o2,	%o6,	%l4
	sub	%o0,	%g3,	%l2
	movvc	%xcc,	%o5,	%i6
	alignaddr	%g5,	%i7,	%i1
	movg	%xcc,	%l0,	%l6
	fzeros	%f10
	bshuffle	%f6,	%f26,	%f26
	fandnot1	%f6,	%f26,	%f4
	nop
	set	0x1E, %g4
	lduh	[%l7 + %g4],	%g4
	fpsub16s	%f18,	%f13,	%f16
	orn	%i4,	%i2,	%g6
	ldub	[%l7 + 0x6C],	%i3
	fmovspos	%icc,	%f6,	%f1
	subcc	%i5,	0x0012,	%l3
	st	%f23,	[%l7 + 0x3C]
	movrgz	%l5,	0x2B0,	%o4
	movrgez	%g1,	0x1CF,	%o3
	udivx	%i0,	0x0567,	%g7
	movpos	%icc,	%o7,	%l1
	edge16	%o1,	%g2,	%o6
	movre	%o2,	%o0,	%g3
	edge8	%l2,	%l4,	%o5
	st	%f17,	[%l7 + 0x20]
	faligndata	%f4,	%f2,	%f20
	sdivcc	%g5,	0x02E8,	%i6
	addc	%i1,	0x0E30,	%i7
	movrlz	%l0,	%l6,	%g4
	edge16	%i4,	%i2,	%i3
	movrgez	%i5,	0x2C8,	%g6
	add	%l3,	0x1869,	%o4
	edge8ln	%l5,	%o3,	%g1
	lduw	[%l7 + 0x64],	%g7
	sllx	%i0,	0x1D,	%l1
	stb	%o7,	[%l7 + 0x34]
	mulx	%o1,	0x146A,	%g2
	movgu	%xcc,	%o2,	%o6
	array8	%g3,	%o0,	%l2
	sll	%l4,	0x07,	%g5
	stx	%o5,	[%l7 + 0x38]
	addc	%i1,	%i7,	%i6
	edge32l	%l0,	%g4,	%i4
	sethi	0x1796,	%l6
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f24
	lduh	[%l7 + 0x7E],	%i3
	edge8n	%i5,	%i2,	%l3
	sth	%g6,	[%l7 + 0x12]
	fpack32	%f26,	%f16,	%f18
	ldsw	[%l7 + 0x44],	%l5
	movrgez	%o3,	0x3E1,	%g1
	edge32	%o4,	%i0,	%l1
	fmovrslz	%o7,	%f10,	%f22
	fpadd16	%f4,	%f2,	%f16
	sethi	0x0811,	%g7
	udivcc	%g2,	0x0570,	%o2
	fmovsa	%xcc,	%f16,	%f5
	sdivx	%o6,	0x067C,	%g3
	subc	%o1,	%o0,	%l2
	edge16ln	%g5,	%o5,	%i1
	popc	0x058A,	%l4
	edge8l	%i6,	%i7,	%g4
	fmovrdlz	%i4,	%f8,	%f16
	addccc	%l6,	%l0,	%i3
	ldx	[%l7 + 0x58],	%i5
	sth	%i2,	[%l7 + 0x66]
	alignaddrl	%l3,	%l5,	%o3
	ldub	[%l7 + 0x19],	%g1
	movne	%icc,	%o4,	%g6
	mulscc	%l1,	%i0,	%g7
	mova	%icc,	%o7,	%g2
	fornot1	%f28,	%f0,	%f12
	fcmpgt32	%f2,	%f16,	%o2
	fpackfix	%f0,	%f25
	sethi	0x19E5,	%o6
	orn	%g3,	0x1D97,	%o1
	array16	%o0,	%g5,	%l2
	alignaddrl	%o5,	%i1,	%i6
	ld	[%l7 + 0x7C],	%f2
	fcmple32	%f8,	%f16,	%i7
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	mulscc	%l4,	%l0,	%i3
	sll	%i5,	%i2,	%l5
	srl	%l3,	0x1B,	%o3
	ldsw	[%l7 + 0x14],	%g1
	ldub	[%l7 + 0x55],	%o4
	smulcc	%l1,	0x03A0,	%g6
	fpadd16	%f2,	%f20,	%f22
	movpos	%xcc,	%i0,	%g7
	move	%icc,	%g2,	%o2
	edge8ln	%o6,	%o7,	%o1
	xorcc	%g3,	0x0DF6,	%o0
	edge8l	%l2,	%g5,	%i1
	subc	%o5,	%i7,	%i6
	srlx	%g4,	0x0E,	%l6
	subcc	%i4,	%l0,	%l4
	edge16ln	%i5,	%i3,	%l5
	restore %l3, %o3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o4,	%l1,	%g6
	bshuffle	%f18,	%f18,	%f16
	andcc	%i2,	0x0C72,	%i0
	alignaddrl	%g7,	%g2,	%o6
	subccc	%o2,	0x1F17,	%o1
	ldd	[%l7 + 0x78],	%f28
	movrgez	%g3,	0x106,	%o0
	fcmpeq32	%f6,	%f22,	%o7
	addc	%g5,	0x1B03,	%i1
	fmovrsgz	%l2,	%f5,	%f24
	addc	%o5,	%i7,	%g4
	sethi	0x148A,	%i6
	ldsh	[%l7 + 0x5C],	%i4
	fmovdvc	%icc,	%f14,	%f10
	ldsw	[%l7 + 0x08],	%l6
	udivcc	%l0,	0x065F,	%l4
	movcc	%icc,	%i5,	%l5
	save %l3, 0x1E29, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x58],	%g1
	andcc	%i3,	%l1,	%g6
	orncc	%i2,	0x1D77,	%o4
	move	%xcc,	%i0,	%g2
	mulscc	%o6,	%g7,	%o1
	fcmpes	%fcc0,	%f14,	%f4
	sdivx	%o2,	0x16B5,	%o0
	sethi	0x03E1,	%g3
	or	%g5,	%o7,	%i1
	addc	%o5,	%l2,	%i7
	movcc	%xcc,	%i6,	%i4
	lduh	[%l7 + 0x22],	%g4
	addcc	%l6,	0x0BE1,	%l4
	smul	%i5,	%l5,	%l3
	fcmped	%fcc3,	%f28,	%f30
	orn	%l0,	0x0614,	%g1
	subc	%i3,	%o3,	%g6
	xnor	%i2,	0x12C8,	%l1
	addcc	%i0,	0x069F,	%o4
	subcc	%o6,	0x1D0D,	%g7
	ldd	[%l7 + 0x18],	%o0
	udivx	%g2,	0x06E7,	%o2
	andn	%g3,	0x1C57,	%o0
	edge32	%g5,	%i1,	%o7
	subccc	%o5,	%l2,	%i6
	edge8l	%i4,	%g4,	%i7
	popc	0x04A1,	%l6
	addccc	%i5,	%l5,	%l3
	mova	%icc,	%l4,	%g1
	ldd	[%l7 + 0x18],	%f28
	st	%f31,	[%l7 + 0x44]
	edge8	%i3,	%l0,	%o3
	ldd	[%l7 + 0x38],	%f12
	alignaddrl	%g6,	%l1,	%i2
	movn	%xcc,	%i0,	%o4
	stw	%o6,	[%l7 + 0x64]
	fxnors	%f0,	%f2,	%f18
	movn	%icc,	%g7,	%o1
	movpos	%xcc,	%o2,	%g3
	andn	%o0,	%g2,	%i1
	edge16l	%o7,	%o5,	%g5
	addcc	%i6,	%l2,	%i4
	fones	%f21
	addc	%g4,	0x0D98,	%l6
	fpack16	%f22,	%f8
	sub	%i7,	%l5,	%i5
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	edge16	%i3,	%l0,	%o3
	sethi	0x1611,	%g1
	fmovdl	%xcc,	%f24,	%f23
	edge8	%g6,	%l1,	%i0
	sir	0x000D
	xorcc	%i2,	%o6,	%g7
	udivx	%o1,	0x1811,	%o4
	sdivx	%g3,	0x0F0C,	%o2
	edge16	%o0,	%g2,	%o7
	fmovsvs	%xcc,	%f24,	%f30
	edge16ln	%i1,	%o5,	%g5
	movleu	%icc,	%l2,	%i6
	sdivx	%i4,	0x164F,	%l6
	fnot1	%f6,	%f18
	andcc	%g4,	%i7,	%i5
	and	%l5,	0x1175,	%l3
	movle	%icc,	%l4,	%i3
	movneg	%icc,	%l0,	%g1
	smul	%g6,	0x1711,	%l1
	ldx	[%l7 + 0x10],	%o3
	movre	%i0,	%i2,	%g7
	fmovsvs	%xcc,	%f7,	%f7
	movge	%icc,	%o1,	%o6
	fnor	%f30,	%f6,	%f30
	orncc	%o4,	%o2,	%g3
	ldsb	[%l7 + 0x62],	%o0
	fmovsvs	%xcc,	%f6,	%f23
	udivx	%g2,	0x0F98,	%i1
	movl	%icc,	%o5,	%g5
	movrne	%o7,	0x154,	%i6
	smulcc	%i4,	0x0A04,	%l6
	fmovdcs	%xcc,	%f11,	%f8
	movre	%l2,	%i7,	%g4
	movle	%icc,	%i5,	%l3
	and	%l4,	0x0244,	%l5
	move	%xcc,	%i3,	%g1
	ldsh	[%l7 + 0x64],	%g6
	movleu	%xcc,	%l0,	%o3
	fpsub16s	%f25,	%f30,	%f15
	movrgz	%l1,	%i0,	%g7
	fones	%f25
	sdivx	%o1,	0x1943,	%o6
	fmovsgu	%xcc,	%f24,	%f26
	andcc	%i2,	0x0255,	%o4
	fornot2s	%f12,	%f0,	%f0
	edge8	%o2,	%g3,	%o0
	edge16	%i1,	%g2,	%o5
	fcmped	%fcc3,	%f30,	%f24
	edge8n	%o7,	%g5,	%i4
	fmovsne	%icc,	%f16,	%f19
	umulcc	%l6,	%i6,	%l2
	sethi	0x092F,	%i7
	udivcc	%g4,	0x1AA0,	%i5
	fmovdle	%xcc,	%f26,	%f28
	ldx	[%l7 + 0x70],	%l3
	edge16	%l4,	%i3,	%g1
	alignaddr	%l5,	%g6,	%o3
	srax	%l1,	%l0,	%i0
	edge32l	%g7,	%o6,	%i2
	bshuffle	%f20,	%f28,	%f6
	stb	%o4,	[%l7 + 0x0E]
	mova	%xcc,	%o2,	%g3
	subccc	%o0,	%o1,	%i1
	addc	%g2,	0x1045,	%o7
	orn	%o5,	%g5,	%l6
	nop
	set	0x78, %l2
	ldsh	[%l7 + %l2],	%i6
	movvs	%xcc,	%i4,	%l2
	save %g4, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f4,	%f26,	%f16
	fnot1	%f30,	%f6
	orn	%l4,	0x16FA,	%i3
	edge16	%i5,	%l5,	%g6
	fpack32	%f10,	%f30,	%f0
	fand	%f30,	%f26,	%f10
	sdiv	%g1,	0x070E,	%l1
	std	%f28,	[%l7 + 0x78]
	sll	%o3,	0x0C,	%l0
	edge32ln	%g7,	%i0,	%o6
	movleu	%icc,	%i2,	%o4
	fmovdle	%xcc,	%f4,	%f19
	sdiv	%g3,	0x01B2,	%o0
	edge8l	%o2,	%i1,	%g2
	add	%o1,	0x0769,	%o5
	edge8n	%o7,	%l6,	%g5
	edge32ln	%i4,	%l2,	%i6
	udivx	%i7,	0x0499,	%l3
	stw	%g4,	[%l7 + 0x48]
	lduw	[%l7 + 0x4C],	%l4
	fcmple16	%f8,	%f20,	%i3
	restore %l5, 0x0449, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i5,	0x0A0,	%l1
	fmovdn	%xcc,	%f15,	%f25
	fmovsne	%xcc,	%f3,	%f8
	stx	%o3,	[%l7 + 0x48]
	array16	%l0,	%g1,	%i0
	addc	%o6,	%g7,	%o4
	fmuld8ulx16	%f23,	%f11,	%f16
	sdivcc	%g3,	0x1ED6,	%i2
	movcs	%xcc,	%o0,	%o2
	fmovsneg	%icc,	%f19,	%f4
	andncc	%g2,	%i1,	%o1
	subcc	%o7,	%o5,	%l6
	fsrc1s	%f16,	%f22
	fpsub16	%f28,	%f4,	%f24
	save %g5, 0x1FDB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f29,	%f24,	%f4
	sth	%l2,	[%l7 + 0x54]
	array16	%i7,	%l3,	%i6
	stx	%l4,	[%l7 + 0x68]
	ldub	[%l7 + 0x4C],	%i3
	array8	%l5,	%g6,	%g4
	fmul8ulx16	%f8,	%f8,	%f18
	fexpand	%f14,	%f24
	mulscc	%l1,	0x045F,	%i5
	fmovdl	%icc,	%f7,	%f15
	fandnot1	%f4,	%f28,	%f22
	ldsh	[%l7 + 0x68],	%o3
	udiv	%g1,	0x1C66,	%l0
	fpackfix	%f8,	%f21
	sllx	%i0,	0x03,	%o6
	fand	%f24,	%f4,	%f8
	andn	%o4,	%g3,	%i2
	stb	%o0,	[%l7 + 0x3E]
	movvs	%xcc,	%o2,	%g2
	andncc	%i1,	%o1,	%o7
	xorcc	%g7,	0x1AFB,	%l6
	mulx	%g5,	0x09C2,	%o5
	orcc	%l2,	0x1305,	%i4
	sth	%l3,	[%l7 + 0x28]
	fabss	%f16,	%f4
	edge8	%i6,	%i7,	%i3
	subccc	%l4,	0x03C6,	%l5
	nop
	set	0x30, %g6
	stw	%g6,	[%l7 + %g6]
	srlx	%g4,	0x1C,	%i5
	smul	%l1,	%o3,	%l0
	alignaddrl	%g1,	%i0,	%o4
	edge16	%g3,	%o6,	%o0
	mova	%xcc,	%o2,	%g2
	move	%icc,	%i2,	%i1
	ldub	[%l7 + 0x75],	%o7
	srlx	%o1,	%g7,	%l6
	xnor	%g5,	%l2,	%i4
	edge16l	%l3,	%o5,	%i6
	addcc	%i7,	0x147E,	%i3
	fandnot2s	%f8,	%f26,	%f2
	movgu	%xcc,	%l5,	%l4
	ldsh	[%l7 + 0x76],	%g4
	ld	[%l7 + 0x48],	%f21
	nop
	set	0x28, %i5
	std	%f12,	[%l7 + %i5]
	sethi	0x0D86,	%g6
	movl	%icc,	%l1,	%o3
	st	%f3,	[%l7 + 0x14]
	fsrc2	%f8,	%f4
	sra	%l0,	%i5,	%g1
	sdivx	%i0,	0x004E,	%g3
	add	%o4,	%o0,	%o2
	ld	[%l7 + 0x74],	%f20
	udivcc	%o6,	0x13C1,	%i2
	srax	%i1,	0x1C,	%o7
	stw	%g2,	[%l7 + 0x60]
	movrgz	%g7,	0x044,	%o1
	stx	%g5,	[%l7 + 0x50]
	sll	%l2,	%i4,	%l6
	or	%l3,	0x1D50,	%i6
	edge16ln	%o5,	%i3,	%i7
	movcs	%xcc,	%l5,	%g4
	mulscc	%l4,	0x1263,	%g6
	ld	[%l7 + 0x0C],	%f23
	ldsh	[%l7 + 0x3A],	%l1
	fcmple32	%f2,	%f26,	%o3
	movcc	%icc,	%i5,	%l0
	movcs	%xcc,	%g1,	%g3
	fnot1	%f16,	%f10
	sub	%i0,	%o0,	%o4
	fmovscs	%xcc,	%f4,	%f26
	fsrc1s	%f29,	%f3
	fpadd32s	%f11,	%f11,	%f24
	edge16n	%o6,	%o2,	%i1
	sethi	0x08D0,	%o7
	movrgz	%i2,	0x1E2,	%g7
	fmovrslz	%g2,	%f3,	%f26
	sdivx	%g5,	0x1372,	%l2
	edge16l	%i4,	%l6,	%l3
	sth	%o1,	[%l7 + 0x5E]
	array8	%o5,	%i3,	%i7
	movcc	%icc,	%i6,	%g4
	edge32	%l5,	%g6,	%l4
	movl	%xcc,	%o3,	%l1
	fnegd	%f10,	%f8
	fmovspos	%xcc,	%f23,	%f7
	addccc	%l0,	0x14B6,	%i5
	ld	[%l7 + 0x48],	%f16
	fmovdvs	%icc,	%f15,	%f0
	nop
	set	0x28, %i2
	stx	%g1,	[%l7 + %i2]
	edge16ln	%g3,	%o0,	%o4
	srl	%o6,	0x0F,	%i0
	array32	%o2,	%o7,	%i2
	fmovdge	%xcc,	%f27,	%f13
	lduw	[%l7 + 0x4C],	%i1
	smulcc	%g2,	%g7,	%l2
	orn	%g5,	0x16FA,	%l6
	xor	%i4,	0x1CBD,	%l3
	edge8n	%o1,	%i3,	%o5
	lduw	[%l7 + 0x44],	%i6
	edge8	%g4,	%i7,	%g6
	srax	%l4,	%l5,	%o3
	udivx	%l0,	0x0A96,	%i5
	fcmple32	%f16,	%f10,	%g1
	udiv	%l1,	0x1026,	%g3
	movgu	%icc,	%o4,	%o0
	fabsd	%f0,	%f20
	movgu	%icc,	%i0,	%o6
	movre	%o2,	0x229,	%i2
	fandnot2	%f18,	%f12,	%f16
	st	%f11,	[%l7 + 0x5C]
	movrlez	%o7,	%g2,	%i1
	std	%f20,	[%l7 + 0x48]
	edge8	%l2,	%g5,	%g7
	stb	%i4,	[%l7 + 0x1E]
	edge16n	%l6,	%l3,	%i3
	smul	%o5,	0x0367,	%o1
	movcs	%xcc,	%g4,	%i6
	ldub	[%l7 + 0x36],	%i7
	xnorcc	%g6,	0x0CEA,	%l5
	stw	%l4,	[%l7 + 0x60]
	edge16ln	%l0,	%o3,	%i5
	movrlez	%g1,	%l1,	%g3
	fabsd	%f26,	%f28
	mova	%xcc,	%o0,	%i0
	orncc	%o6,	%o4,	%o2
	ldsh	[%l7 + 0x34],	%o7
	ldx	[%l7 + 0x70],	%g2
	edge8n	%i2,	%i1,	%l2
	movleu	%icc,	%g5,	%g7
	addccc	%l6,	%l3,	%i4
	fnot1s	%f3,	%f5
	movpos	%icc,	%o5,	%o1
	sdiv	%g4,	0x0033,	%i3
	umul	%i7,	0x0B8F,	%i6
	edge32ln	%g6,	%l5,	%l0
	lduh	[%l7 + 0x18],	%o3
	fpadd32s	%f1,	%f1,	%f6
	movrlez	%i5,	0x393,	%g1
	ldd	[%l7 + 0x78],	%l0
	movle	%xcc,	%g3,	%o0
	fmovdgu	%icc,	%f11,	%f14
	ldx	[%l7 + 0x38],	%l4
	st	%f25,	[%l7 + 0x58]
	andncc	%o6,	%o4,	%i0
	fxors	%f6,	%f8,	%f6
	fpack16	%f24,	%f6
	movpos	%icc,	%o2,	%g2
	movleu	%xcc,	%o7,	%i2
	edge16	%l2,	%i1,	%g5
	fmovsleu	%xcc,	%f4,	%f5
	udiv	%g7,	0x1C2A,	%l3
	xorcc	%i4,	%l6,	%o5
	fpack32	%f8,	%f22,	%f30
	fpackfix	%f12,	%f26
	srax	%g4,	0x19,	%o1
	edge8n	%i7,	%i6,	%g6
	fsrc1	%f20,	%f26
	edge16n	%i3,	%l5,	%o3
	sll	%i5,	0x02,	%l0
	edge16n	%g1,	%g3,	%l1
	mulscc	%l4,	%o6,	%o4
	array16	%i0,	%o0,	%o2
	movvs	%icc,	%o7,	%i2
	lduw	[%l7 + 0x34],	%l2
	ldd	[%l7 + 0x70],	%g2
	fmovrdne	%g5,	%f6,	%f16
	ldsw	[%l7 + 0x48],	%i1
	fnor	%f20,	%f30,	%f26
	mulx	%l3,	%g7,	%l6
	umul	%o5,	0x18BC,	%i4
	orncc	%g4,	%o1,	%i6
	movrgez	%i7,	0x2FC,	%g6
	edge16l	%i3,	%l5,	%i5
	fpack16	%f22,	%f5
	movre	%o3,	0x27B,	%l0
	ldsh	[%l7 + 0x4C],	%g3
	andn	%g1,	%l1,	%o6
	edge16l	%l4,	%i0,	%o4
	srax	%o2,	0x19,	%o0
	sdiv	%o7,	0x110A,	%i2
	fcmps	%fcc3,	%f11,	%f17
	movg	%icc,	%l2,	%g5
	xnorcc	%g2,	0x16D2,	%l3
	edge16n	%i1,	%g7,	%l6
	array32	%o5,	%i4,	%g4
	fxors	%f27,	%f9,	%f19
	bshuffle	%f16,	%f14,	%f28
	alignaddr	%i6,	%o1,	%g6
	edge32n	%i3,	%l5,	%i5
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	udiv	%g3,	0x073C,	%g1
	array32	%l1,	%l4,	%o6
	fmovde	%xcc,	%f8,	%f19
	addc	%i0,	0x038A,	%o2
	fmovdcc	%icc,	%f10,	%f14
	subc	%o4,	0x0285,	%o0
	edge8n	%o7,	%i2,	%l2
	move	%icc,	%g5,	%g2
	sir	0x05B0
	and	%i1,	%l3,	%g7
	sra	%l6,	0x0F,	%i4
	fornot2s	%f16,	%f16,	%f25
	fxnor	%f30,	%f22,	%f26
	sdivcc	%o5,	0x05B6,	%i6
	sllx	%g4,	%g6,	%i3
	movn	%icc,	%o1,	%l5
	andn	%i5,	0x166C,	%o3
	smulcc	%i7,	%l0,	%g1
	sll	%l1,	%l4,	%o6
	fxnors	%f18,	%f18,	%f12
	stb	%g3,	[%l7 + 0x2D]
	fmul8x16	%f22,	%f0,	%f16
	lduh	[%l7 + 0x36],	%o2
	stb	%i0,	[%l7 + 0x4C]
	sll	%o4,	%o0,	%o7
	addccc	%l2,	0x141F,	%g5
	edge32	%g2,	%i1,	%l3
	subc	%i2,	0x0259,	%l6
	mulx	%i4,	%o5,	%i6
	edge32l	%g4,	%g6,	%i3
	movl	%icc,	%o1,	%l5
	lduw	[%l7 + 0x48],	%i5
	mulx	%o3,	0x1136,	%i7
	fmovdl	%icc,	%f11,	%f17
	fcmple32	%f0,	%f18,	%g7
	sll	%l0,	0x15,	%l1
	sub	%l4,	%o6,	%g1
	move	%xcc,	%o2,	%i0
	movg	%xcc,	%g3,	%o0
	edge16n	%o7,	%l2,	%g5
	movcc	%xcc,	%o4,	%i1
	addc	%l3,	%i2,	%l6
	move	%xcc,	%i4,	%o5
	smul	%g2,	%g4,	%i6
	stx	%i3,	[%l7 + 0x38]
	fcmple16	%f28,	%f16,	%o1
	edge32l	%g6,	%l5,	%o3
	lduw	[%l7 + 0x40],	%i5
	and	%g7,	0x1286,	%i7
	st	%f29,	[%l7 + 0x60]
	addc	%l0,	%l1,	%l4
	stx	%g1,	[%l7 + 0x78]
	xnorcc	%o2,	0x029E,	%o6
	stx	%i0,	[%l7 + 0x50]
	movleu	%icc,	%o0,	%g3
	xorcc	%o7,	0x0487,	%l2
	orcc	%g5,	%o4,	%l3
	smulcc	%i2,	0x12B5,	%l6
	fsrc2s	%f4,	%f24
	ldsw	[%l7 + 0x1C],	%i4
	sdiv	%o5,	0x15F7,	%g2
	srax	%i1,	0x09,	%i6
	save %i3, 0x0849, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g6,	0x09DF,	%o1
	umulcc	%l5,	0x0939,	%o3
	fcmpgt32	%f16,	%f0,	%i5
	fornot1	%f26,	%f4,	%f28
	stx	%i7,	[%l7 + 0x60]
	orn	%l0,	0x01D2,	%l1
	movn	%xcc,	%g7,	%l4
	stw	%g1,	[%l7 + 0x08]
	movg	%xcc,	%o2,	%o6
	fmovs	%f10,	%f2
	fmul8x16au	%f27,	%f23,	%f12
	sdivx	%o0,	0x02DC,	%i0
	movn	%xcc,	%o7,	%l2
	subc	%g5,	%o4,	%l3
	edge16l	%i2,	%l6,	%g3
	movrlz	%o5,	%i4,	%i1
	ldsw	[%l7 + 0x20],	%g2
	andn	%i3,	%g4,	%i6
	edge8ln	%g6,	%l5,	%o3
	edge8ln	%i5,	%i7,	%o1
	movg	%icc,	%l1,	%l0
	fpackfix	%f24,	%f19
	ldx	[%l7 + 0x20],	%l4
	fmovrslz	%g1,	%f1,	%f16
	sll	%g7,	0x03,	%o6
	edge16ln	%o2,	%o0,	%o7
	addcc	%l2,	0x0E3D,	%i0
	xorcc	%o4,	%l3,	%i2
	fnegd	%f28,	%f0
	fmovdpos	%xcc,	%f24,	%f24
	sethi	0x02A2,	%l6
	sra	%g3,	%g5,	%o5
	fsrc2	%f16,	%f14
	fmovdne	%icc,	%f27,	%f30
	movcc	%icc,	%i4,	%i1
	fmovdleu	%icc,	%f7,	%f14
	edge16	%i3,	%g2,	%i6
	fsrc1s	%f8,	%f0
	movle	%icc,	%g6,	%l5
	movg	%icc,	%g4,	%o3
	stw	%i7,	[%l7 + 0x44]
	fmovrsgz	%i5,	%f15,	%f8
	fones	%f24
	ld	[%l7 + 0x58],	%f1
	sir	0x1456
	fsrc1	%f20,	%f6
	sdivcc	%l1,	0x08CE,	%o1
	udivx	%l0,	0x02C8,	%l4
	fmovsg	%xcc,	%f16,	%f5
	edge32l	%g7,	%o6,	%g1
	movrlz	%o2,	0x14B,	%o7
	stx	%o0,	[%l7 + 0x20]
	ldd	[%l7 + 0x28],	%f10
	movl	%xcc,	%i0,	%l2
	udiv	%l3,	0x1AB5,	%i2
	fandnot1	%f12,	%f16,	%f4
	sdiv	%l6,	0x1C4B,	%g3
	umulcc	%g5,	0x0C25,	%o4
	fmovsgu	%icc,	%f24,	%f18
	edge8	%i4,	%o5,	%i3
	edge16l	%g2,	%i6,	%i1
	sra	%g6,	%g4,	%l5
	fandnot1	%f6,	%f22,	%f6
	subcc	%i7,	0x0B06,	%i5
	alignaddr	%o3,	%o1,	%l0
	fcmpgt16	%f24,	%f4,	%l1
	sra	%l4,	0x14,	%o6
	smulcc	%g7,	%o2,	%g1
	orcc	%o7,	%o0,	%i0
	orcc	%l2,	%l3,	%l6
	stb	%i2,	[%l7 + 0x40]
	array16	%g3,	%g5,	%o4
	nop
	set	0x78, %g7
	stw	%i4,	[%l7 + %g7]
	fornot1	%f28,	%f10,	%f2
	movre	%i3,	%g2,	%i6
	nop
	set	0x64, %g1
	lduw	[%l7 + %g1],	%i1
	edge8n	%g6,	%g4,	%l5
	fmovrdne	%i7,	%f2,	%f12
	orcc	%i5,	%o3,	%o5
	fsrc2	%f24,	%f22
	sth	%o1,	[%l7 + 0x6A]
	fmovsvc	%xcc,	%f19,	%f21
	subcc	%l0,	%l1,	%l4
	ld	[%l7 + 0x70],	%f1
	sub	%g7,	0x0A39,	%o2
	movge	%xcc,	%g1,	%o7
	andncc	%o0,	%i0,	%o6
	fmovrdlz	%l3,	%f10,	%f16
	sth	%l2,	[%l7 + 0x4A]
	st	%f21,	[%l7 + 0x08]
	array8	%i2,	%l6,	%g5
	fmul8ulx16	%f14,	%f6,	%f20
	sth	%o4,	[%l7 + 0x70]
	udiv	%i4,	0x173D,	%i3
	fandnot1s	%f28,	%f23,	%f5
	popc	0x0973,	%g2
	edge16l	%g3,	%i6,	%g6
	sra	%g4,	0x1B,	%l5
	ldd	[%l7 + 0x38],	%i6
	stb	%i1,	[%l7 + 0x5E]
	udiv	%o3,	0x11D1,	%o5
	popc	%i5,	%l0
	movrlez	%o1,	0x09D,	%l1
	fnot1	%f28,	%f6
	fmovsg	%icc,	%f8,	%f13
	umulcc	%g7,	%o2,	%l4
	movre	%g1,	0x064,	%o0
	and	%i0,	%o7,	%l3
	edge16ln	%o6,	%i2,	%l2
	fmovrdgz	%l6,	%f30,	%f14
	movpos	%icc,	%o4,	%i4
	movle	%icc,	%g5,	%i3
	mova	%xcc,	%g2,	%i6
	umulcc	%g3,	%g6,	%l5
	sth	%g4,	[%l7 + 0x66]
	addcc	%i7,	%i1,	%o3
	sra	%o5,	%i5,	%l0
	alignaddrl	%o1,	%g7,	%o2
	popc	0x0EE9,	%l1
	nop
	set	0x48, %l0
	ldd	[%l7 + %l0],	%g0
	addccc	%o0,	%l4,	%o7
	sdiv	%i0,	0x014B,	%o6
	udiv	%l3,	0x1F08,	%l2
	sub	%i2,	0x1608,	%o4
	srax	%i4,	0x1F,	%g5
	bshuffle	%f28,	%f20,	%f14
	sethi	0x0166,	%i3
	ldsh	[%l7 + 0x3C],	%g2
	save %i6, 0x0809, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l6,	%l5
	movvs	%xcc,	%g4,	%g6
	edge8l	%i7,	%o3,	%i1
	ldx	[%l7 + 0x28],	%i5
	restore %l0, 0x0C7D, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o1,	%o2
	fsrc1s	%f5,	%f27
	movrlz	%g7,	%l1,	%g1
	array32	%o0,	%o7,	%l4
	movn	%xcc,	%o6,	%l3
	xnor	%l2,	%i0,	%o4
	or	%i2,	0x04FF,	%g5
	stw	%i3,	[%l7 + 0x18]
	xnor	%g2,	%i6,	%g3
	edge32	%l6,	%i4,	%g4
	edge16ln	%l5,	%g6,	%i7
	fmovd	%f24,	%f10
	movneg	%icc,	%o3,	%i5
	fmovsle	%xcc,	%f18,	%f3
	fmovsle	%xcc,	%f17,	%f19
	orn	%i1,	0x13B5,	%o5
	fcmple32	%f0,	%f4,	%l0
	sub	%o2,	0x09E0,	%o1
	movvs	%xcc,	%g7,	%l1
	orn	%g1,	%o7,	%l4
	xorcc	%o0,	%o6,	%l2
	fcmped	%fcc0,	%f24,	%f22
	popc	%l3,	%i0
	edge32n	%i2,	%o4,	%i3
	save %g2, %i6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g3,	[%l7 + 0x3F]
	and	%i4,	%g4,	%l6
	srlx	%g6,	0x00,	%i7
	udivx	%o3,	0x0A67,	%i5
	movne	%xcc,	%l5,	%i1
	andcc	%l0,	%o2,	%o1
	xor	%o5,	%l1,	%g7
	sra	%g1,	0x09,	%o7
	subcc	%o0,	0x0F66,	%l4
	add	%l2,	0x16DE,	%l3
	sdivcc	%i0,	0x1B15,	%i2
	mova	%icc,	%o4,	%o6
	movn	%xcc,	%i3,	%i6
	sdivcc	%g2,	0x11DE,	%g5
	andn	%g3,	0x1533,	%g4
	smulcc	%l6,	%g6,	%i7
	udiv	%o3,	0x0533,	%i4
	sub	%i5,	%i1,	%l5
	or	%o2,	%l0,	%o1
	addcc	%o5,	0x07CD,	%g7
	edge8ln	%g1,	%o7,	%l1
	movvc	%icc,	%l4,	%l2
	ldx	[%l7 + 0x30],	%l3
	movcs	%icc,	%o0,	%i2
	fabsd	%f26,	%f10
	fpsub32	%f6,	%f22,	%f30
	movleu	%icc,	%o4,	%o6
	fsrc2	%f6,	%f14
	fones	%f26
	movge	%xcc,	%i0,	%i3
	fcmpes	%fcc0,	%f28,	%f13
	xor	%i6,	0x00A9,	%g2
	lduh	[%l7 + 0x56],	%g5
	fmul8ulx16	%f8,	%f8,	%f6
	edge8	%g3,	%l6,	%g4
	fmovrdne	%g6,	%f8,	%f20
	fpack32	%f14,	%f18,	%f0
	edge8l	%i7,	%o3,	%i5
	and	%i1,	%i4,	%l5
	alignaddr	%o2,	%o1,	%o5
	sub	%l0,	0x0B13,	%g1
	movleu	%xcc,	%o7,	%l1
	movre	%g7,	%l2,	%l3
	sdivcc	%o0,	0x1A62,	%l4
	subccc	%o4,	0x0E60,	%o6
	umul	%i2,	0x1DB8,	%i0
	fnot1	%f28,	%f2
	movrgez	%i6,	0x1C8,	%g2
	sllx	%i3,	0x09,	%g3
	fandnot2	%f4,	%f22,	%f14
	subccc	%l6,	%g4,	%g6
	popc	0x1A6E,	%i7
	fmovdge	%xcc,	%f0,	%f29
	fmovspos	%icc,	%f1,	%f5
	lduh	[%l7 + 0x38],	%g5
	subcc	%i5,	0x1526,	%i1
	sethi	0x1E4B,	%i4
	add	%o3,	%o2,	%l5
	addc	%o1,	%l0,	%g1
	fabss	%f12,	%f15
	sllx	%o7,	%o5,	%g7
	sub	%l1,	0x1E71,	%l3
	alignaddrl	%o0,	%l2,	%o4
	umulcc	%o6,	0x0AE1,	%l4
	lduw	[%l7 + 0x14],	%i2
	edge8ln	%i6,	%i0,	%g2
	edge16	%i3,	%g3,	%l6
	std	%f22,	[%l7 + 0x70]
	addcc	%g4,	%i7,	%g6
	fnands	%f24,	%f21,	%f17
	umul	%g5,	%i5,	%i4
	fmovsa	%xcc,	%f28,	%f13
	movrlz	%o3,	%i1,	%l5
	sll	%o2,	%l0,	%g1
	fpack32	%f2,	%f12,	%f12
	xnorcc	%o7,	%o5,	%o1
	movrne	%g7,	0x3B7,	%l3
	popc	%l1,	%o0
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	ld	[%l7 + 0x60],	%f8
	movneg	%xcc,	%l4,	%i2
	movne	%icc,	%o6,	%i6
	popc	%g2,	%i0
	addccc	%g3,	0x14D8,	%i3
	andn	%g4,	0x0BF1,	%l6
	fnor	%f6,	%f26,	%f20
	fcmple32	%f14,	%f0,	%g6
	subccc	%i7,	%g5,	%i5
	udivx	%i4,	0x1842,	%i1
	smul	%l5,	0x18F6,	%o3
	lduh	[%l7 + 0x72],	%o2
	fmovdl	%icc,	%f25,	%f11
	fmovsn	%xcc,	%f19,	%f28
	nop
	set	0x7A, %o2
	ldsh	[%l7 + %o2],	%l0
	and	%g1,	0x05ED,	%o5
	movvc	%xcc,	%o7,	%g7
	alignaddr	%o1,	%l1,	%o0
	fpackfix	%f0,	%f24
	fmovsa	%icc,	%f17,	%f22
	fpsub16	%f10,	%f30,	%f0
	srlx	%l3,	%o4,	%l4
	fcmpeq16	%f24,	%f24,	%i2
	fnot2s	%f8,	%f30
	movre	%l2,	%o6,	%i6
	movleu	%icc,	%i0,	%g3
	restore %g2, 0x03AD, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x3
	save %l6, %g6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g4,	0x06DA,	%i5
	movl	%xcc,	%i4,	%g5
	movge	%xcc,	%l5,	%o3
	edge32	%i1,	%l0,	%g1
	sra	%o5,	%o2,	%g7
	xor	%o1,	0x18B8,	%o7
	addccc	%o0,	%l1,	%o4
	mova	%xcc,	%l4,	%i2
	fpadd16s	%f29,	%f13,	%f14
	umulcc	%l3,	0x03EC,	%o6
	fmovs	%f24,	%f30
	edge16	%i6,	%i0,	%l2
	orn	%g2,	%i3,	%l6
	udiv	%g6,	0x0CDB,	%g3
	xnor	%i7,	%i5,	%g4
	sth	%i4,	[%l7 + 0x0E]
	srl	%l5,	%o3,	%i1
	fcmpne16	%f12,	%f14,	%g5
	fmovspos	%xcc,	%f6,	%f6
	movl	%xcc,	%l0,	%o5
	subc	%g1,	0x0106,	%g7
	udivcc	%o2,	0x121B,	%o7
	array16	%o1,	%o0,	%o4
	edge8	%l4,	%l1,	%i2
	fmovdcs	%icc,	%f4,	%f20
	udiv	%l3,	0x1542,	%i6
	stw	%o6,	[%l7 + 0x5C]
	ldx	[%l7 + 0x38],	%l2
	stb	%i0,	[%l7 + 0x7B]
	srlx	%i3,	%l6,	%g6
	stx	%g3,	[%l7 + 0x50]
	fcmped	%fcc3,	%f26,	%f20
	fmovdneg	%xcc,	%f11,	%f18
	udivcc	%g2,	0x0DD0,	%i7
	edge32ln	%i5,	%i4,	%l5
	edge8n	%g4,	%o3,	%i1
	and	%g5,	%o5,	%l0
	addc	%g7,	0x1EBB,	%g1
	sll	%o2,	%o7,	%o1
	fcmple32	%f16,	%f6,	%o4
	nop
	set	0x70, %i6
	lduh	[%l7 + %i6],	%l4
	addcc	%o0,	%i2,	%l3
	ldsh	[%l7 + 0x36],	%i6
	xnorcc	%o6,	%l2,	%l1
	xor	%i0,	%l6,	%g6
	fmovspos	%icc,	%f9,	%f10
	movrne	%g3,	0x0C5,	%g2
	movg	%xcc,	%i7,	%i3
	sth	%i4,	[%l7 + 0x7E]
	subccc	%i5,	%g4,	%l5
	fzero	%f14
	movg	%xcc,	%o3,	%g5
	ldx	[%l7 + 0x60],	%o5
	stw	%i1,	[%l7 + 0x0C]
	sdivx	%g7,	0x00D5,	%g1
	mulx	%o2,	0x1CA1,	%l0
	stb	%o7,	[%l7 + 0x26]
	subcc	%o1,	%l4,	%o4
	fmovrdne	%i2,	%f12,	%f2
	xorcc	%o0,	0x105C,	%i6
	addc	%o6,	0x026F,	%l3
	ldd	[%l7 + 0x18],	%l0
	ldub	[%l7 + 0x67],	%i0
	orcc	%l2,	0x1AAA,	%g6
	fcmps	%fcc3,	%f12,	%f22
	subc	%g3,	0x0838,	%l6
	fmovsg	%xcc,	%f19,	%f2
	alignaddr	%i7,	%g2,	%i4
	edge8	%i3,	%i5,	%l5
	sth	%o3,	[%l7 + 0x52]
	edge8	%g5,	%o5,	%g4
	std	%f18,	[%l7 + 0x38]
	fmovdgu	%icc,	%f13,	%f20
	movre	%i1,	%g7,	%o2
	fcmple16	%f16,	%f28,	%g1
	fpadd16s	%f4,	%f16,	%f31
	udivx	%l0,	0x013C,	%o7
	add	%l4,	%o4,	%i2
	fands	%f23,	%f26,	%f14
	srl	%o0,	0x09,	%i6
	ldsw	[%l7 + 0x10],	%o6
	fpack32	%f6,	%f30,	%f8
	sdivcc	%l3,	0x0920,	%o1
	st	%f20,	[%l7 + 0x48]
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	udiv	%l2,	0x04DF,	%g6
	movl	%icc,	%l6,	%g3
	ldub	[%l7 + 0x23],	%i7
	edge32n	%g2,	%i3,	%i4
	sdiv	%i5,	0x193B,	%o3
	stb	%l5,	[%l7 + 0x26]
	fpadd32	%f26,	%f30,	%f6
	alignaddrl	%g5,	%g4,	%o5
	fmovsle	%xcc,	%f22,	%f29
	sub	%g7,	0x0F08,	%i1
	sdiv	%g1,	0x1C5C,	%l0
	andcc	%o7,	%l4,	%o2
	movl	%icc,	%i2,	%o4
	nop
	set	0x7C, %g2
	ldsw	[%l7 + %g2],	%o0
	for	%f20,	%f26,	%f14
	nop
	set	0x2E, %l6
	lduh	[%l7 + %l6],	%i6
	fmovsl	%icc,	%f20,	%f7
	movle	%icc,	%o6,	%o1
	fmovrdne	%l1,	%f4,	%f22
	xnor	%l3,	%i0,	%g6
	add	%l6,	%g3,	%l2
	fsrc1	%f20,	%f26
	ldx	[%l7 + 0x28],	%i7
	mulx	%i3,	%i4,	%g2
	movre	%o3,	0x235,	%l5
	movl	%xcc,	%g5,	%i5
	sub	%o5,	0x0C6E,	%g4
	fmuld8sux16	%f8,	%f20,	%f2
	umulcc	%g7,	%g1,	%l0
	fandnot1	%f28,	%f4,	%f10
	fpack16	%f4,	%f5
	addccc	%i1,	%l4,	%o7
	mova	%xcc,	%o2,	%i2
	orn	%o0,	0x0CE8,	%o4
	fmovsa	%xcc,	%f31,	%f7
	fmovrdne	%i6,	%f16,	%f24
	fornot2	%f12,	%f0,	%f18
	faligndata	%f30,	%f0,	%f22
	movrne	%o1,	%o6,	%l1
	add	%l3,	0x1519,	%g6
	movg	%xcc,	%i0,	%g3
	andcc	%l2,	%l6,	%i3
	ldx	[%l7 + 0x50],	%i7
	orn	%g2,	%o3,	%l5
	subc	%g5,	0x145D,	%i4
	alignaddrl	%o5,	%g4,	%g7
	mulx	%i5,	%g1,	%i1
	bshuffle	%f16,	%f0,	%f4
	pdist	%f28,	%f4,	%f20
	movle	%xcc,	%l0,	%l4
	alignaddr	%o2,	%o7,	%o0
	xor	%i2,	%o4,	%o1
	fmovrdgz	%i6,	%f12,	%f6
	movne	%xcc,	%o6,	%l1
	sub	%l3,	%i0,	%g3
	movrlz	%g6,	%l6,	%i3
	ldx	[%l7 + 0x60],	%i7
	fandnot1s	%f14,	%f23,	%f11
	movne	%icc,	%g2,	%o3
	sethi	0x11A8,	%l2
	fmovrsgz	%g5,	%f10,	%f21
	fone	%f2
	movrgez	%i4,	0x2DF,	%o5
	edge16n	%l5,	%g4,	%g7
	stw	%i5,	[%l7 + 0x10]
	srlx	%g1,	%l0,	%i1
	movrlez	%l4,	0x22C,	%o2
	srl	%o0,	0x0A,	%i2
	movrlez	%o7,	%o1,	%i6
	smulcc	%o4,	%l1,	%o6
	umulcc	%l3,	0x0104,	%i0
	fcmps	%fcc0,	%f22,	%f5
	fpack32	%f2,	%f6,	%f6
	movpos	%icc,	%g6,	%l6
	fmul8ulx16	%f2,	%f4,	%f10
	fmovrdgez	%i3,	%f6,	%f24
	fmul8ulx16	%f20,	%f10,	%f28
	movrne	%g3,	%i7,	%o3
	and	%l2,	0x0206,	%g5
	sdiv	%i4,	0x1561,	%o5
	save %g2, 0x07CC, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f6,	%f16,	%f20
	sth	%g4,	[%l7 + 0x64]
	edge8n	%i5,	%g7,	%l0
	movge	%xcc,	%g1,	%i1
	std	%f14,	[%l7 + 0x30]
	std	%f28,	[%l7 + 0x08]
	fabsd	%f18,	%f20
	edge16l	%l4,	%o0,	%o2
	fnor	%f20,	%f20,	%f22
	andn	%o7,	%o1,	%i2
	popc	%i6,	%o4
	fmovrde	%l1,	%f30,	%f6
	movvc	%icc,	%l3,	%o6
	or	%i0,	0x0757,	%l6
	fsrc2s	%f0,	%f11
	movcc	%icc,	%i3,	%g3
	xorcc	%i7,	0x1E13,	%o3
	movre	%l2,	0x18B,	%g6
	umul	%i4,	0x1E0F,	%o5
	ldsb	[%l7 + 0x7F],	%g2
	lduw	[%l7 + 0x28],	%l5
	xnor	%g5,	0x0658,	%i5
	array8	%g4,	%l0,	%g7
	and	%g1,	%l4,	%i1
	fmovspos	%icc,	%f12,	%f0
	ldd	[%l7 + 0x30],	%o0
	movrgez	%o7,	%o1,	%o2
	stw	%i2,	[%l7 + 0x4C]
	fpack16	%f10,	%f12
	movneg	%icc,	%o4,	%i6
	fmovd	%f28,	%f8
	orn	%l1,	0x1D08,	%o6
	fcmpeq32	%f12,	%f2,	%l3
	srax	%l6,	0x03,	%i0
	movgu	%icc,	%i3,	%g3
	alignaddrl	%i7,	%l2,	%g6
	fcmpeq32	%f20,	%f14,	%o3
	fmovsl	%icc,	%f22,	%f31
	mova	%icc,	%o5,	%g2
	edge32ln	%l5,	%g5,	%i5
	edge16l	%g4,	%i4,	%g7
	fandnot1	%f12,	%f20,	%f2
	movleu	%icc,	%g1,	%l4
	movrgez	%i1,	0x22D,	%l0
	array32	%o7,	%o0,	%o1
	edge8l	%o2,	%i2,	%i6
	sdiv	%o4,	0x0CA2,	%l1
	fcmpne16	%f12,	%f22,	%l3
	movge	%icc,	%l6,	%i0
	fsrc1s	%f17,	%f19
	addc	%o6,	%i3,	%g3
	fmovdge	%icc,	%f3,	%f24
	smulcc	%l2,	0x0CA6,	%i7
	sdivx	%g6,	0x0E88,	%o5
	fnands	%f0,	%f15,	%f3
	array8	%o3,	%l5,	%g5
	movvs	%icc,	%g2,	%g4
	movrlez	%i5,	0x19E,	%g7
	move	%xcc,	%i4,	%l4
	orn	%i1,	0x1086,	%l0
	std	%f14,	[%l7 + 0x08]
	edge16	%g1,	%o0,	%o7
	edge16n	%o1,	%o2,	%i2
	xorcc	%i6,	%o4,	%l3
	ldd	[%l7 + 0x08],	%f2
	xnor	%l6,	%l1,	%o6
	fmovrdgz	%i3,	%f30,	%f22
	fmovdgu	%icc,	%f29,	%f27
	movpos	%xcc,	%g3,	%i0
	fmovsl	%xcc,	%f29,	%f20
	movleu	%icc,	%l2,	%i7
	movneg	%icc,	%g6,	%o5
	sllx	%l5,	%o3,	%g2
	sll	%g4,	%i5,	%g5
	edge16n	%i4,	%l4,	%g7
	fexpand	%f2,	%f6
	xnor	%l0,	0x0925,	%g1
	fmovdcc	%icc,	%f29,	%f5
	lduh	[%l7 + 0x08],	%o0
	movle	%icc,	%i1,	%o1
	sra	%o2,	%i2,	%i6
	srax	%o4,	%l3,	%l6
	mulscc	%o7,	0x1BA0,	%o6
	fnand	%f24,	%f0,	%f10
	edge8ln	%i3,	%g3,	%i0
	sra	%l1,	%l2,	%g6
	sdivx	%o5,	0x1C14,	%l5
	sir	0x04AF
	edge8ln	%o3,	%i7,	%g4
	fmuld8sux16	%f7,	%f17,	%f26
	fcmple16	%f24,	%f30,	%g2
	udivx	%i5,	0x0283,	%g5
	sdivcc	%i4,	0x1538,	%l4
	fmovrse	%l0,	%f22,	%f27
	addccc	%g7,	0x069D,	%g1
	fpsub16	%f28,	%f4,	%f14
	subc	%o0,	%i1,	%o1
	movcc	%xcc,	%i2,	%o2
	andcc	%o4,	0x16D3,	%i6
	fnegs	%f1,	%f18
	smul	%l6,	0x02EB,	%l3
	lduh	[%l7 + 0x34],	%o7
	fxor	%f18,	%f24,	%f16
	movrgez	%i3,	0x24C,	%g3
	udiv	%i0,	0x0638,	%o6
	movn	%icc,	%l1,	%l2
	ldx	[%l7 + 0x68],	%g6
	andn	%o5,	%l5,	%i7
	movge	%xcc,	%o3,	%g2
	ldx	[%l7 + 0x60],	%i5
	movl	%icc,	%g4,	%g5
	ld	[%l7 + 0x0C],	%f22
	fmovdge	%xcc,	%f1,	%f1
	fcmpne32	%f20,	%f30,	%i4
	and	%l4,	0x1C8D,	%g7
	fpsub16s	%f13,	%f21,	%f17
	fcmpne16	%f30,	%f4,	%l0
	fmovsvs	%xcc,	%f19,	%f30
	xnorcc	%o0,	0x0F32,	%i1
	edge8	%g1,	%o1,	%i2
	edge8n	%o4,	%i6,	%o2
	fmul8sux16	%f22,	%f12,	%f26
	alignaddr	%l6,	%o7,	%i3
	orn	%g3,	0x15BA,	%l3
	and	%i0,	%o6,	%l1
	mova	%xcc,	%l2,	%o5
	ldx	[%l7 + 0x08],	%g6
	ldd	[%l7 + 0x48],	%f10
	nop
	set	0x31, %i0
	ldub	[%l7 + %i0],	%l5
	ldd	[%l7 + 0x08],	%f16
	sdivcc	%o3,	0x08E1,	%i7
	fmovrdne	%g2,	%f10,	%f4
	stw	%g4,	[%l7 + 0x2C]
	andncc	%g5,	%i4,	%i5
	sub	%l4,	%l0,	%o0
	edge16ln	%i1,	%g1,	%g7
	movcs	%xcc,	%o1,	%i2
	subccc	%o4,	0x0E05,	%i6
	movre	%o2,	%o7,	%i3
	fmuld8ulx16	%f27,	%f0,	%f10
	ldsh	[%l7 + 0x40],	%g3
	movne	%xcc,	%l3,	%l6
	movpos	%icc,	%i0,	%o6
	xnorcc	%l1,	0x19CE,	%o5
	edge32l	%l2,	%g6,	%l5
	fcmpne32	%f24,	%f18,	%i7
	orncc	%o3,	0x04A8,	%g4
	sdivx	%g2,	0x027C,	%g5
	movrlez	%i5,	%l4,	%l0
	movne	%icc,	%i4,	%i1
	edge32	%g1,	%o0,	%o1
	edge8l	%g7,	%o4,	%i6
	ldx	[%l7 + 0x38],	%i2
	fmovdle	%icc,	%f18,	%f7
	fand	%f14,	%f14,	%f2
	ldsw	[%l7 + 0x2C],	%o2
	orncc	%i3,	0x1B76,	%o7
	sllx	%g3,	%l6,	%l3
	fmovsa	%xcc,	%f20,	%f25
	fnot2	%f2,	%f8
	sir	0x1763
	ldd	[%l7 + 0x70],	%f10
	addccc	%o6,	0x0866,	%l1
	ldx	[%l7 + 0x30],	%i0
	sub	%o5,	%g6,	%l2
	edge16	%l5,	%i7,	%o3
	umulcc	%g2,	%g4,	%i5
	udivcc	%g5,	0x1F07,	%l4
	fandnot1s	%f5,	%f24,	%f1
	edge8l	%l0,	%i1,	%g1
	std	%f26,	[%l7 + 0x58]
	fmovdle	%xcc,	%f21,	%f24
	edge16n	%o0,	%o1,	%g7
	movneg	%xcc,	%i4,	%i6
	fmuld8sux16	%f28,	%f16,	%f10
	movrlez	%o4,	0x044,	%o2
	fsrc1s	%f4,	%f4
	std	%f10,	[%l7 + 0x08]
	fmovdgu	%xcc,	%f26,	%f20
	popc	%i3,	%o7
	ldsb	[%l7 + 0x4E],	%i2
	addc	%l6,	%l3,	%o6
	srax	%g3,	0x12,	%i0
	fnegs	%f29,	%f3
	andncc	%o5,	%l1,	%l2
	umulcc	%g6,	%i7,	%o3
	restore %g2, %l5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g5,	%l4,	%i5
	movge	%icc,	%l0,	%g1
	edge8n	%i1,	%o0,	%o1
	ldsw	[%l7 + 0x6C],	%g7
	sir	0x0A41
	fmovdne	%icc,	%f22,	%f31
	smulcc	%i4,	0x035A,	%i6
	edge32n	%o4,	%o2,	%i3
	movre	%o7,	%i2,	%l3
	stw	%l6,	[%l7 + 0x24]
	ldsh	[%l7 + 0x1C],	%g3
	fnor	%f18,	%f20,	%f12
	movre	%o6,	0x214,	%i0
	xnor	%l1,	0x14BB,	%o5
	orn	%g6,	0x03B1,	%l2
	movcs	%xcc,	%o3,	%i7
	fmovse	%icc,	%f23,	%f14
	fnors	%f16,	%f16,	%f12
	fpack16	%f30,	%f18
	movle	%icc,	%g2,	%l5
	smulcc	%g5,	0x1B4E,	%l4
	save %g4, %i5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i1,	0x3B3,	%g1
	fmovsvs	%icc,	%f26,	%f2
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fmovda	%xcc,	%f31,	%f20
	fmovsne	%xcc,	%f2,	%f17
	subcc	%i6,	%o4,	%o2
	srlx	%i4,	0x0E,	%o7
	smulcc	%i3,	0x1C82,	%l3
	xor	%l6,	0x0168,	%i2
	fmovrsgz	%g3,	%f9,	%f27
	save %o6, %l1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g6,	%l2,	%o3
	fmovsge	%icc,	%f17,	%f18
	xorcc	%o5,	0x1BBB,	%i7
	ldx	[%l7 + 0x68],	%l5
	fnands	%f21,	%f29,	%f22
	sir	0x0969
	movl	%xcc,	%g2,	%g5
	srlx	%g4,	0x1A,	%i5
	andncc	%l0,	%l4,	%i1
	movrgz	%g1,	0x0A2,	%o1
	st	%f26,	[%l7 + 0x54]
	stw	%g7,	[%l7 + 0x34]
	ldsb	[%l7 + 0x08],	%o0
	mulscc	%i6,	0x069C,	%o4
	fors	%f23,	%f25,	%f24
	addc	%o2,	0x138B,	%o7
	srax	%i4,	0x0C,	%i3
	fcmpes	%fcc3,	%f14,	%f21
	faligndata	%f6,	%f28,	%f14
	sir	0x1C7C
	movcs	%icc,	%l6,	%i2
	or	%g3,	%o6,	%l3
	xorcc	%l1,	%g6,	%i0
	or	%l2,	%o5,	%i7
	movrne	%l5,	%o3,	%g5
	fnot1s	%f9,	%f15
	ldx	[%l7 + 0x10],	%g2
	std	%f14,	[%l7 + 0x38]
	fmovrslz	%g4,	%f19,	%f21
	subcc	%i5,	0x0527,	%l0
	lduh	[%l7 + 0x72],	%i1
	ldub	[%l7 + 0x7B],	%g1
	movge	%xcc,	%l4,	%g7
	movcs	%icc,	%o1,	%o0
	srl	%o4,	%i6,	%o7
	movne	%icc,	%i4,	%i3
	umul	%o2,	%l6,	%g3
	addccc	%o6,	0x1947,	%i2
	ldx	[%l7 + 0x30],	%l3
	edge32n	%g6,	%i0,	%l2
	ldsb	[%l7 + 0x7D],	%l1
	stb	%o5,	[%l7 + 0x31]
	movpos	%xcc,	%i7,	%o3
	movrne	%l5,	%g2,	%g5
	fsrc2s	%f17,	%f18
	ld	[%l7 + 0x44],	%f21
	mova	%xcc,	%i5,	%g4
	alignaddr	%l0,	%g1,	%i1
	fmovrsgez	%l4,	%f15,	%f0
	andcc	%g7,	0x03A5,	%o1
	fnot2s	%f17,	%f24
	andcc	%o0,	0x1E53,	%o4
	movpos	%icc,	%i6,	%i4
	fnot1s	%f5,	%f18
	sll	%o7,	%i3,	%l6
	fands	%f18,	%f29,	%f4
	sethi	0x04F8,	%o2
	fmovsgu	%icc,	%f23,	%f13
	fabsd	%f30,	%f12
	fornot1s	%f24,	%f14,	%f25
	udivx	%g3,	0x0FE2,	%o6
	andcc	%i2,	%g6,	%i0
	addccc	%l3,	0x1D25,	%l1
	edge32ln	%l2,	%i7,	%o5
	or	%l5,	0x195C,	%o3
	fmuld8sux16	%f0,	%f7,	%f22
	alignaddr	%g5,	%i5,	%g2
	orcc	%l0,	%g4,	%g1
	mova	%icc,	%i1,	%g7
	sdiv	%l4,	0x0990,	%o0
	orncc	%o4,	0x05DC,	%o1
	orncc	%i6,	0x1510,	%o7
	orcc	%i4,	0x047E,	%i3
	move	%xcc,	%o2,	%l6
	mulx	%g3,	%o6,	%g6
	edge32n	%i2,	%i0,	%l1
	movcc	%xcc,	%l3,	%i7
	fcmple16	%f4,	%f6,	%l2
	or	%o5,	%l5,	%g5
	alignaddr	%o3,	%i5,	%g2
	orncc	%l0,	0x1FCA,	%g4
	andncc	%g1,	%i1,	%g7
	udiv	%o0,	0x1680,	%l4
	edge8ln	%o4,	%o1,	%i6
	fnor	%f2,	%f12,	%f20
	andncc	%i4,	%i3,	%o7
	popc	0x0032,	%o2
	fpsub16s	%f7,	%f31,	%f4
	sdivcc	%g3,	0x0825,	%l6
	srlx	%o6,	%g6,	%i2
	array8	%i0,	%l3,	%i7
	movvs	%xcc,	%l1,	%l2
	mulx	%o5,	0x1B07,	%g5
	sethi	0x0DF1,	%o3
	stb	%l5,	[%l7 + 0x0F]
	fmovsa	%xcc,	%f27,	%f18
	udivx	%i5,	0x0DCF,	%l0
	edge8l	%g2,	%g4,	%g1
	fmovsl	%icc,	%f0,	%f27
	edge8l	%i1,	%g7,	%o0
	or	%o4,	0x00BC,	%o1
	stb	%l4,	[%l7 + 0x6D]
	movvs	%xcc,	%i4,	%i3
	movpos	%xcc,	%o7,	%i6
	fmul8x16al	%f0,	%f22,	%f0
	lduw	[%l7 + 0x2C],	%g3
	fmovdcs	%xcc,	%f1,	%f29
	smul	%o2,	%o6,	%g6
	movrlez	%l6,	%i0,	%i2
	movcs	%icc,	%i7,	%l1
	umul	%l2,	0x19EC,	%l3
	restore %g5, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x34],	%i5
	fcmpgt32	%f18,	%f0,	%l5
	ldsb	[%l7 + 0x42],	%g2
	movrgz	%g4,	0x296,	%g1
	edge16l	%i1,	%l0,	%g7
	movrne	%o4,	%o0,	%o1
	edge16ln	%l4,	%i4,	%o7
	ldx	[%l7 + 0x18],	%i6
	udivx	%g3,	0x07A1,	%o2
	array32	%o6,	%i3,	%l6
	fzero	%f4
	andn	%i0,	%g6,	%i2
	add	%i7,	%l1,	%l3
	srlx	%g5,	%l2,	%o3
	udivcc	%o5,	0x129B,	%i5
	std	%f26,	[%l7 + 0x30]
	addcc	%l5,	%g2,	%g1
	mulx	%i1,	%l0,	%g7
	movcc	%icc,	%g4,	%o0
	umul	%o1,	0x1A84,	%l4
	array32	%i4,	%o7,	%i6
	movneg	%xcc,	%g3,	%o4
	ldub	[%l7 + 0x1A],	%o6
	orncc	%i3,	%l6,	%i0
	ldub	[%l7 + 0x0B],	%o2
	fzeros	%f20
	xor	%g6,	0x0186,	%i2
	sub	%i7,	%l1,	%g5
	fcmpes	%fcc1,	%f14,	%f21
	edge8	%l2,	%o3,	%o5
	udiv	%i5,	0x155B,	%l3
	movn	%icc,	%l5,	%g2
	sir	0x14CF
	array16	%i1,	%g1,	%l0
	movvc	%xcc,	%g4,	%o0
	movrlez	%o1,	%l4,	%g7
	lduw	[%l7 + 0x28],	%o7
	fabss	%f13,	%f13
	smulcc	%i4,	0x1CF7,	%g3
	xnorcc	%i6,	%o4,	%i3
	edge16ln	%l6,	%i0,	%o6
	xnor	%o2,	0x1FF9,	%g6
	movneg	%icc,	%i7,	%l1
	movrgz	%g5,	%l2,	%o3
	sra	%o5,	%i2,	%i5
	smul	%l5,	0x0942,	%g2
	sra	%l3,	%g1,	%i1
	edge8	%l0,	%o0,	%o1
	movl	%xcc,	%l4,	%g4
	srlx	%o7,	%g7,	%i4
	array16	%i6,	%g3,	%i3
	movrne	%o4,	0x17E,	%i0
	array16	%l6,	%o6,	%g6
	andn	%o2,	%i7,	%l1
	movrgz	%g5,	%l2,	%o3
	sir	0x1032
	sub	%i2,	0x11DD,	%o5
	fandnot1	%f16,	%f22,	%f0
	edge16n	%i5,	%g2,	%l3
	fmovspos	%xcc,	%f0,	%f14
	ldd	[%l7 + 0x50],	%l4
	fmovscc	%icc,	%f9,	%f15
	alignaddr	%g1,	%l0,	%o0
	save %o1, %i1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f22,	%f6,	%l4
	srax	%g7,	%o7,	%i4
	movvs	%icc,	%i6,	%i3
	fexpand	%f18,	%f20
	udiv	%g3,	0x12DD,	%i0
	sra	%o4,	%l6,	%o6
	sdivcc	%o2,	0x05A8,	%g6
	fandnot2s	%f18,	%f22,	%f11
	fone	%f14
	fcmpne16	%f2,	%f0,	%l1
	array32	%g5,	%i7,	%l2
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	edge16n	%i5,	%i2,	%g2
	orncc	%l5,	%g1,	%l0
	movre	%o0,	0x27B,	%o1
	movvs	%xcc,	%i1,	%l3
	edge32ln	%l4,	%g4,	%g7
	alignaddr	%i4,	%o7,	%i6
	mulx	%g3,	%i3,	%o4
	edge8l	%l6,	%i0,	%o2
	orn	%o6,	0x1A35,	%l1
	movrlz	%g5,	%i7,	%g6
	movcs	%icc,	%o3,	%o5
	orn	%l2,	%i5,	%g2
	addccc	%i2,	%l5,	%l0
	addcc	%g1,	0x09AE,	%o0
	sdivcc	%o1,	0x16E8,	%l3
	edge32	%i1,	%g4,	%l4
	fmovda	%icc,	%f8,	%f3
	mulscc	%g7,	0x04C1,	%o7
	stb	%i6,	[%l7 + 0x48]
	smul	%i4,	%g3,	%o4
	edge32ln	%l6,	%i0,	%o2
	fmovscc	%xcc,	%f10,	%f18
	mova	%xcc,	%i3,	%l1
	nop
	set	0x28, %i4
	ldsh	[%l7 + %i4],	%g5
	stx	%i7,	[%l7 + 0x50]
	edge16l	%g6,	%o3,	%o5
	addcc	%o6,	%i5,	%g2
	sra	%l2,	%l5,	%l0
	umul	%g1,	%i2,	%o0
	save %l3, 0x1FA4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %g4, 0x0B40, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o1,	0x1DA0,	%o7
	srl	%g7,	%i4,	%i6
	udivcc	%g3,	0x1398,	%l6
	movl	%xcc,	%i0,	%o2
	smul	%o4,	0x08BA,	%i3
	xor	%g5,	%i7,	%g6
	movcs	%icc,	%o3,	%o5
	smulcc	%o6,	0x12B7,	%l1
	ldsh	[%l7 + 0x64],	%i5
	addcc	%g2,	0x0D09,	%l5
	fxnors	%f25,	%f11,	%f20
	movre	%l0,	%g1,	%l2
	addccc	%i2,	%l3,	%i1
	fmovsneg	%xcc,	%f5,	%f10
	edge8	%o0,	%g4,	%l4
	stb	%o7,	[%l7 + 0x6A]
	sub	%o1,	%g7,	%i4
	xnor	%g3,	0x0CDB,	%i6
	fmul8x16	%f14,	%f30,	%f6
	srl	%i0,	%l6,	%o2
	sllx	%i3,	0x02,	%g5
	std	%f0,	[%l7 + 0x58]
	array32	%i7,	%o4,	%o3
	addcc	%g6,	0x15BF,	%o6
	sub	%o5,	%i5,	%g2
	stx	%l1,	[%l7 + 0x40]
	edge32ln	%l0,	%g1,	%l5
	edge8l	%i2,	%l3,	%l2
	movle	%xcc,	%i1,	%g4
	andcc	%l4,	%o7,	%o0
	edge16ln	%o1,	%i4,	%g7
	movgu	%xcc,	%i6,	%g3
	movrgez	%l6,	0x337,	%i0
	orcc	%o2,	%g5,	%i7
	movle	%xcc,	%i3,	%o3
	st	%f20,	[%l7 + 0x08]
	movvs	%icc,	%o4,	%o6
	edge8l	%g6,	%i5,	%g2
	fmovrsne	%o5,	%f27,	%f28
	orncc	%l1,	%g1,	%l5
	xor	%l0,	%l3,	%i2
	movn	%xcc,	%i1,	%l2
	fmovdle	%xcc,	%f22,	%f11
	movvs	%icc,	%g4,	%o7
	smulcc	%l4,	%o0,	%o1
	movvc	%xcc,	%g7,	%i6
	udivx	%i4,	0x1C0B,	%l6
	xorcc	%i0,	0x15E0,	%o2
	fmovsg	%xcc,	%f16,	%f17
	sdivcc	%g3,	0x09F1,	%g5
	sllx	%i7,	0x05,	%i3
	lduw	[%l7 + 0x18],	%o3
	srlx	%o6,	%o4,	%i5
	addccc	%g6,	0x0839,	%g2
	edge8l	%o5,	%g1,	%l5
	edge8l	%l1,	%l3,	%l0
	srax	%i1,	%i2,	%l2
	or	%o7,	%l4,	%o0
	sll	%o1,	0x1C,	%g7
	sdivx	%g4,	0x13E6,	%i4
	edge16ln	%i6,	%l6,	%i0
	xnorcc	%g3,	%g5,	%i7
	ld	[%l7 + 0x2C],	%f6
	addccc	%i3,	%o3,	%o2
	movg	%icc,	%o4,	%o6
	movrne	%i5,	0x1D2,	%g6
	fxnors	%f28,	%f21,	%f30
	xnorcc	%o5,	%g1,	%l5
	edge8l	%g2,	%l3,	%l1
	xor	%i1,	%i2,	%l0
	xnorcc	%o7,	0x1252,	%l2
	udivcc	%o0,	0x09BF,	%o1
	udivcc	%g7,	0x18BD,	%g4
	fpmerge	%f5,	%f6,	%f14
	stx	%i4,	[%l7 + 0x40]
	lduh	[%l7 + 0x3E],	%i6
	edge8n	%l6,	%i0,	%l4
	movgu	%icc,	%g3,	%g5
	ldsb	[%l7 + 0x11],	%i3
	movleu	%icc,	%i7,	%o2
	edge16	%o4,	%o6,	%o3
	fpsub16	%f16,	%f14,	%f20
	save %i5, %g6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g1,	%g2,	%l5
	fmovdvs	%icc,	%f29,	%f11
	fmovrslez	%l1,	%f30,	%f19
	fmovrdgz	%i1,	%f0,	%f14
	movn	%icc,	%l3,	%l0
	movgu	%icc,	%i2,	%o7
	srl	%o0,	0x1D,	%o1
	lduh	[%l7 + 0x6A],	%l2
	movrgez	%g4,	%g7,	%i6
	addcc	%i4,	%i0,	%l4
	andn	%g3,	0x10F4,	%g5
	orn	%l6,	0x18BE,	%i7
	fcmpes	%fcc1,	%f5,	%f20
	popc	%o2,	%i3
	orn	%o4,	%o6,	%o3
	orncc	%i5,	0x1393,	%o5
	sdiv	%g1,	0x0937,	%g6
	alignaddr	%l5,	%g2,	%i1
	fpackfix	%f26,	%f13
	array16	%l1,	%l3,	%i2
	movrlz	%l0,	%o0,	%o1
	alignaddrl	%o7,	%g4,	%g7
	sdivx	%l2,	0x07D2,	%i6
	nop
	set	0x50, %l1
	ldsb	[%l7 + %l1],	%i0
	srlx	%i4,	%g3,	%l4
	umul	%l6,	%i7,	%o2
	fabss	%f21,	%f2
	sethi	0x125F,	%g5
	subc	%i3,	%o6,	%o3
	edge16n	%i5,	%o5,	%g1
	array8	%o4,	%l5,	%g2
	addcc	%i1,	%g6,	%l1
	movgu	%icc,	%i2,	%l0
	save %l3, %o1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g4,	%g7,	%l2
	stx	%o0,	[%l7 + 0x10]
	subc	%i6,	0x0249,	%i0
	alignaddrl	%g3,	%l4,	%i4
	mulx	%l6,	0x1763,	%o2
	movneg	%xcc,	%g5,	%i3
	movg	%icc,	%o6,	%i7
	array32	%i5,	%o5,	%g1
	ldsb	[%l7 + 0x0E],	%o3
	edge8n	%o4,	%g2,	%i1
	fmovrse	%l5,	%f3,	%f22
	fpsub32s	%f10,	%f0,	%f30
	fmovrsgz	%l1,	%f1,	%f20
	std	%f8,	[%l7 + 0x68]
	subc	%g6,	0x02A1,	%i2
	fmovdcs	%icc,	%f17,	%f24
	or	%l0,	0x15D3,	%o1
	stb	%o7,	[%l7 + 0x2E]
	ldub	[%l7 + 0x0E],	%g4
	fmul8ulx16	%f26,	%f8,	%f20
	stx	%l3,	[%l7 + 0x38]
	xor	%l2,	%g7,	%i6
	movge	%icc,	%o0,	%i0
	movrgz	%g3,	%i4,	%l6
	fmovdvs	%icc,	%f29,	%f0
	edge8ln	%o2,	%g5,	%l4
	mulscc	%o6,	0x17DF,	%i3
	ldd	[%l7 + 0x58],	%f8
	udivx	%i7,	0x006B,	%o5
	orn	%g1,	0x1FDE,	%o3
	save %o4, %g2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l5,	%l1,	%i1
	add	%g6,	0x1EA3,	%i2
	ldub	[%l7 + 0x2B],	%l0
	sdiv	%o7,	0x0A4B,	%g4
	array16	%l3,	%o1,	%l2
	movneg	%xcc,	%g7,	%o0
	fsrc2	%f28,	%f0
	ldd	[%l7 + 0x28],	%i0
	fcmped	%fcc2,	%f28,	%f20
	movrlez	%i6,	0x19A,	%i4
	std	%f4,	[%l7 + 0x58]
	array8	%l6,	%g3,	%g5
	stx	%o2,	[%l7 + 0x78]
	array32	%l4,	%o6,	%i3
	movg	%icc,	%i7,	%o5
	movn	%xcc,	%g1,	%o3
	bshuffle	%f30,	%f26,	%f14
	subc	%o4,	%g2,	%l5
	popc	%i5,	%i1
	andncc	%l1,	%i2,	%l0
	srlx	%o7,	0x1A,	%g6
	fmuld8ulx16	%f4,	%f8,	%f18
	movcs	%icc,	%g4,	%l3
	sub	%l2,	%o1,	%g7
	edge16	%o0,	%i6,	%i0
	subccc	%l6,	%g3,	%i4
	orcc	%o2,	%l4,	%g5
	movpos	%icc,	%i3,	%i7
	sdiv	%o5,	0x0C8A,	%g1
	ldub	[%l7 + 0x39],	%o6
	edge16n	%o3,	%o4,	%g2
	edge32n	%i5,	%l5,	%i1
	ldsb	[%l7 + 0x2C],	%i2
	fmovde	%xcc,	%f5,	%f9
	sub	%l1,	0x075C,	%l0
	fone	%f22
	mulscc	%o7,	0x0739,	%g6
	movvc	%xcc,	%l3,	%l2
	alignaddr	%o1,	%g7,	%o0
	fsrc1s	%f1,	%f15
	edge32	%i6,	%g4,	%l6
	udiv	%g3,	0x053C,	%i4
	or	%o2,	0x1801,	%i0
	mova	%xcc,	%g5,	%i3
	sir	0x05EA
	udivx	%l4,	0x0FED,	%o5
	movl	%xcc,	%g1,	%o6
	ldx	[%l7 + 0x10],	%i7
	fsrc2	%f14,	%f20
	sra	%o4,	%g2,	%i5
	fpmerge	%f15,	%f5,	%f2
	fmovrdgez	%o3,	%f16,	%f16
	smul	%i1,	0x0272,	%l5
	fandnot2	%f26,	%f28,	%f0
	or	%i2,	%l0,	%o7
	save %l1, 0x1663, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l3,	0x1144,	%l2
	edge16n	%o1,	%o0,	%i6
	ldsw	[%l7 + 0x58],	%g7
	movvc	%icc,	%g4,	%l6
	edge8l	%g3,	%i4,	%i0
	sth	%o2,	[%l7 + 0x68]
	orcc	%i3,	0x0557,	%g5
	fmovscs	%xcc,	%f29,	%f7
	xnorcc	%l4,	%o5,	%o6
	sra	%g1,	%o4,	%i7
	movrne	%g2,	%o3,	%i1
	smul	%i5,	0x0BB6,	%l5
	sdivx	%i2,	0x0E0A,	%l0
	movgu	%icc,	%l1,	%o7
	fmovse	%icc,	%f14,	%f9
	andn	%g6,	%l3,	%l2
	movvs	%xcc,	%o1,	%i6
	fmovrdlez	%g7,	%f20,	%f16
	movne	%xcc,	%g4,	%o0
	umulcc	%l6,	%g3,	%i0
	stx	%i4,	[%l7 + 0x68]
	edge32	%o2,	%i3,	%l4
	fmovsvs	%xcc,	%f2,	%f0
	umul	%o5,	0x1B5C,	%g5
	srl	%g1,	%o6,	%o4
	sllx	%i7,	%g2,	%i1
	ldub	[%l7 + 0x0F],	%i5
	fpsub16s	%f5,	%f31,	%f25
	movg	%xcc,	%l5,	%o3
	xorcc	%l0,	0x0F56,	%i2
	edge16	%l1,	%g6,	%o7
	fmul8sux16	%f18,	%f16,	%f14
	edge32l	%l3,	%o1,	%i6
	fmovrdlz	%l2,	%f10,	%f22
	edge8l	%g4,	%g7,	%l6
	sdivx	%g3,	0x1CE2,	%i0
	bshuffle	%f26,	%f14,	%f28
	sll	%i4,	0x1D,	%o2
	edge8n	%i3,	%l4,	%o5
	movleu	%xcc,	%o0,	%g1
	fmul8ulx16	%f16,	%f18,	%f8
	mulx	%o6,	0x0A3A,	%o4
	movrne	%g5,	%i7,	%i1
	movvs	%icc,	%g2,	%i5
	udiv	%l5,	0x0ED6,	%o3
	fmovdneg	%xcc,	%f9,	%f18
	ldsb	[%l7 + 0x26],	%l0
	movrgez	%l1,	%i2,	%o7
	sdivcc	%l3,	0x05B1,	%o1
	fmovrdne	%i6,	%f16,	%f14
	array16	%g6,	%l2,	%g4
	st	%f9,	[%l7 + 0x08]
	fmovdl	%icc,	%f15,	%f7
	movrgez	%g7,	%l6,	%i0
	st	%f29,	[%l7 + 0x60]
	movg	%icc,	%i4,	%g3
	ldub	[%l7 + 0x12],	%i3
	ldsw	[%l7 + 0x1C],	%l4
	umul	%o2,	0x0304,	%o0
	movcs	%xcc,	%o5,	%o6
	srl	%o4,	0x0A,	%g5
	xnor	%g1,	%i7,	%i1
	fmovrsgez	%g2,	%f6,	%f8
	umulcc	%l5,	0x1264,	%o3
	ldsb	[%l7 + 0x27],	%i5
	ldub	[%l7 + 0x6A],	%l1
	movrne	%l0,	0x3F0,	%i2
	add	%o7,	0x13C2,	%o1
	sdiv	%i6,	0x0C06,	%g6
	movrlez	%l2,	%g4,	%l3
	movgu	%xcc,	%g7,	%l6
	and	%i4,	0x055F,	%g3
	sethi	0x1A44,	%i3
	and	%i0,	0x0744,	%l4
	edge32ln	%o0,	%o2,	%o6
	edge32n	%o5,	%o4,	%g5
	stb	%i7,	[%l7 + 0x23]
	alignaddrl	%i1,	%g1,	%g2
	movne	%xcc,	%o3,	%i5
	movg	%icc,	%l1,	%l0
	edge16n	%i2,	%o7,	%o1
	fmovdne	%xcc,	%f26,	%f27
	fcmpeq32	%f18,	%f22,	%l5
	movg	%xcc,	%i6,	%g6
	std	%f18,	[%l7 + 0x08]
	mulscc	%l2,	0x1CE4,	%g4
	movneg	%icc,	%g7,	%l3
	fmovsgu	%xcc,	%f8,	%f25
	movne	%xcc,	%l6,	%g3
	alignaddrl	%i3,	%i0,	%l4
	fmovs	%f17,	%f16
	mulscc	%o0,	%o2,	%i4
	movcs	%icc,	%o5,	%o4
	sth	%o6,	[%l7 + 0x12]
	stb	%i7,	[%l7 + 0x16]
	ld	[%l7 + 0x0C],	%f25
	addccc	%g5,	%i1,	%g2
	nop
	set	0x7C, %o5
	lduh	[%l7 + %o5],	%o3
	xnorcc	%g1,	0x1AF8,	%i5
	andcc	%l0,	0x035F,	%l1
	movpos	%icc,	%i2,	%o7
	array8	%l5,	%o1,	%i6
	srax	%g6,	0x01,	%g4
	movcc	%icc,	%g7,	%l3
	smul	%l6,	%l2,	%i3
	movle	%xcc,	%g3,	%i0
	fmul8x16au	%f4,	%f8,	%f30
	movn	%xcc,	%l4,	%o0
	movrgez	%i4,	0x0AE,	%o2
	edge32n	%o4,	%o6,	%o5
	array16	%i7,	%g5,	%g2
	subcc	%i1,	%o3,	%g1
	mulscc	%i5,	0x1FB3,	%l0
	edge32	%l1,	%i2,	%o7
	edge8ln	%o1,	%l5,	%g6
	fmovsvc	%xcc,	%f11,	%f15
	movrgz	%g4,	0x317,	%i6
	edge32	%l3,	%l6,	%g7
	smulcc	%i3,	%l2,	%i0
	mova	%icc,	%l4,	%o0
	bshuffle	%f8,	%f6,	%f4
	sub	%i4,	%o2,	%o4
	fmovdpos	%xcc,	%f6,	%f18
	fmul8x16al	%f1,	%f18,	%f8
	andcc	%o6,	%g3,	%o5
	movre	%g5,	%g2,	%i7
	sir	0x1EC5
	ldsw	[%l7 + 0x58],	%o3
	movleu	%icc,	%i1,	%g1
	st	%f7,	[%l7 + 0x44]
	alignaddr	%l0,	%l1,	%i2
	movrne	%i5,	0x32F,	%o7
	stb	%o1,	[%l7 + 0x16]
	srlx	%l5,	%g6,	%i6
	sllx	%l3,	0x1E,	%l6
	ldsh	[%l7 + 0x32],	%g4
	fmovdpos	%icc,	%f14,	%f11
	srlx	%i3,	0x09,	%g7
	movl	%icc,	%l2,	%i0
	fandnot1	%f30,	%f26,	%f24
	fmovsneg	%icc,	%f19,	%f3
	fexpand	%f1,	%f6
	mova	%icc,	%l4,	%o0
	ldsh	[%l7 + 0x70],	%i4
	fxnors	%f16,	%f7,	%f29
	sra	%o2,	0x08,	%o4
	fcmps	%fcc2,	%f20,	%f22
	fmul8ulx16	%f14,	%f8,	%f8
	stb	%g3,	[%l7 + 0x6A]
	lduw	[%l7 + 0x1C],	%o5
	movneg	%icc,	%g5,	%o6
	ldd	[%l7 + 0x28],	%f30
	udiv	%g2,	0x0E27,	%i7
	xor	%o3,	0x05CB,	%g1
	andn	%i1,	%l1,	%i2
	fornot2	%f18,	%f28,	%f0
	srax	%l0,	0x19,	%i5
	lduh	[%l7 + 0x68],	%o7
	fcmple32	%f10,	%f2,	%l5
	ldub	[%l7 + 0x51],	%o1
	popc	%g6,	%l3
	srlx	%i6,	%g4,	%l6
	movleu	%xcc,	%g7,	%i3
	edge32l	%l2,	%l4,	%i0
	move	%icc,	%o0,	%o2
	smulcc	%i4,	0x10B4,	%g3
	fmul8x16au	%f27,	%f6,	%f16
	array8	%o5,	%g5,	%o6
	sdivx	%o4,	0x1E49,	%g2
	fands	%f25,	%f26,	%f7
	orncc	%i7,	%g1,	%o3
	subccc	%l1,	0x10F1,	%i1
	alignaddr	%l0,	%i2,	%o7
	edge32n	%l5,	%o1,	%i5
	edge8n	%l3,	%g6,	%i6
	fcmpes	%fcc2,	%f12,	%f22
	movge	%xcc,	%g4,	%l6
	sra	%g7,	%l2,	%i3
	fors	%f4,	%f4,	%f1
	fcmps	%fcc1,	%f15,	%f30
	fmovde	%icc,	%f16,	%f29
	smul	%i0,	0x0C53,	%l4
	array32	%o0,	%o2,	%i4
	ldub	[%l7 + 0x0D],	%g3
	edge8ln	%o5,	%g5,	%o4
	sub	%o6,	0x0855,	%i7
	array16	%g1,	%g2,	%o3
	subcc	%l1,	0x0FB1,	%i1
	xor	%i2,	%l0,	%o7
	add	%l5,	%i5,	%l3
	fmovdpos	%icc,	%f8,	%f21
	movcc	%xcc,	%o1,	%i6
	subccc	%g4,	0x086F,	%l6
	array32	%g7,	%g6,	%i3
	orcc	%l2,	%l4,	%i0
	fmovde	%icc,	%f3,	%f3
	fmovrde	%o2,	%f28,	%f24
	fmuld8sux16	%f13,	%f7,	%f14
	edge32l	%i4,	%g3,	%o0
	fxnor	%f10,	%f22,	%f10
	fmovs	%f9,	%f18
	lduw	[%l7 + 0x70],	%g5
	edge32l	%o4,	%o5,	%o6
	sir	0x1507
	xnor	%i7,	0x0DDE,	%g2
	edge16n	%o3,	%g1,	%l1
	ldsw	[%l7 + 0x50],	%i2
	movvs	%xcc,	%i1,	%l0
	movleu	%icc,	%l5,	%i5
	stb	%o7,	[%l7 + 0x5B]
	movcc	%xcc,	%l3,	%o1
	sll	%g4,	0x1D,	%i6
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	fpack16	%f18,	%f7
	fnot2s	%f15,	%f9
	array32	%l2,	%i3,	%l4
	fmul8x16	%f5,	%f4,	%f14
	movvc	%icc,	%i0,	%i4
	movvs	%icc,	%o2,	%o0
	movneg	%xcc,	%g3,	%o4
	movneg	%xcc,	%o5,	%g5
	fpsub16s	%f13,	%f24,	%f12
	subcc	%o6,	%i7,	%g2
	fandnot1s	%f1,	%f11,	%f9
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%g0
	addccc	%o3,	0x0E2E,	%i2
	fmovsg	%xcc,	%f31,	%f14
	ld	[%l7 + 0x38],	%f25
	movg	%icc,	%l1,	%i1
	movg	%xcc,	%l0,	%i5
	fnot2s	%f22,	%f23
	fandnot2	%f16,	%f20,	%f22
	edge16	%o7,	%l5,	%l3
	fone	%f28
	addccc	%g4,	%i6,	%o1
	smul	%g7,	0x084F,	%g6
	movrlez	%l6,	0x20C,	%i3
	fpadd32	%f6,	%f16,	%f4
	array8	%l2,	%l4,	%i0
	st	%f15,	[%l7 + 0x78]
	addc	%o2,	%o0,	%g3
	andncc	%o4,	%o5,	%i4
	srlx	%o6,	0x0D,	%i7
	edge16ln	%g5,	%g2,	%o3
	edge32n	%i2,	%g1,	%l1
	fmovrsgz	%i1,	%f30,	%f23
	orcc	%i5,	%l0,	%o7
	st	%f11,	[%l7 + 0x50]
	edge16	%l3,	%l5,	%g4
	fcmped	%fcc1,	%f4,	%f14
	edge32	%o1,	%i6,	%g7
	movgu	%icc,	%l6,	%i3
	faligndata	%f18,	%f6,	%f16
	fmovdvs	%icc,	%f20,	%f28
	ldsw	[%l7 + 0x5C],	%l2
	fmovspos	%icc,	%f5,	%f24
	movne	%xcc,	%g6,	%i0
	add	%l4,	%o2,	%o0
	move	%xcc,	%g3,	%o5
	save %i4, 0x1F2B, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i7,	0x1D27,	%g5
	fmuld8ulx16	%f28,	%f24,	%f4
	subccc	%g2,	0x0E19,	%o3
	subcc	%o6,	0x0895,	%i2
	pdist	%f16,	%f4,	%f14
	edge16l	%g1,	%l1,	%i5
	udivx	%i1,	0x19B0,	%o7
	orn	%l0,	%l5,	%g4
	ldsb	[%l7 + 0x3E],	%l3
	mova	%xcc,	%i6,	%g7
	fcmple32	%f2,	%f22,	%l6
	ldx	[%l7 + 0x08],	%o1
	edge32	%i3,	%l2,	%i0
	movpos	%xcc,	%g6,	%o2
	fnot2s	%f21,	%f20
	fabss	%f19,	%f24
	movrgez	%o0,	%g3,	%l4
	fmovdne	%icc,	%f11,	%f6
	edge32	%o5,	%i4,	%o4
	edge32ln	%i7,	%g2,	%o3
	sir	0x15F2
	sra	%g5,	%o6,	%i2
	ldx	[%l7 + 0x78],	%g1
	edge16	%l1,	%i5,	%i1
	fcmpd	%fcc1,	%f26,	%f14
	srlx	%o7,	%l5,	%l0
	edge8	%g4,	%i6,	%l3
	subcc	%g7,	0x052E,	%l6
	fornot1s	%f20,	%f6,	%f7
	subcc	%i3,	0x12D2,	%o1
	fcmpeq16	%f22,	%f18,	%i0
	edge32	%l2,	%o2,	%o0
	fsrc1s	%f10,	%f23
	srl	%g3,	0x09,	%l4
	smul	%g6,	0x1ED8,	%o5
	edge8l	%i4,	%i7,	%g2
	sth	%o4,	[%l7 + 0x66]
	fmul8x16	%f14,	%f12,	%f0
	andn	%g5,	%o6,	%o3
	srax	%i2,	%l1,	%i5
	lduw	[%l7 + 0x50],	%i1
	movge	%icc,	%g1,	%o7
	fcmpes	%fcc2,	%f13,	%f21
	sth	%l0,	[%l7 + 0x46]
	fmovdvs	%xcc,	%f7,	%f23
	fmovdpos	%icc,	%f26,	%f24
	stb	%g4,	[%l7 + 0x15]
	stb	%l5,	[%l7 + 0x44]
	fcmpgt32	%f20,	%f8,	%l3
	fmovscc	%icc,	%f21,	%f5
	sdiv	%i6,	0x1BAA,	%l6
	fzeros	%f11
	stb	%i3,	[%l7 + 0x69]
	movrgez	%g7,	%o1,	%i0
	edge16l	%o2,	%l2,	%o0
	addc	%l4,	%g3,	%g6
	popc	0x1060,	%i4
	movn	%xcc,	%o5,	%g2
	stb	%o4,	[%l7 + 0x7A]
	fnot2	%f28,	%f30
	xnorcc	%i7,	0x05A3,	%g5
	fmovrdlez	%o6,	%f28,	%f18
	movpos	%icc,	%o3,	%l1
	and	%i2,	0x037F,	%i1
	fabsd	%f28,	%f6
	fmovdn	%icc,	%f28,	%f9
	ldub	[%l7 + 0x3A],	%i5
	movn	%icc,	%g1,	%l0
	edge32ln	%o7,	%g4,	%l5
	fmovdcc	%icc,	%f5,	%f17
	edge32l	%i6,	%l6,	%i3
	edge16l	%l3,	%o1,	%g7
	nop
	set	0x48, %o3
	ldsh	[%l7 + %o3],	%i0
	movn	%xcc,	%o2,	%o0
	andn	%l4,	%l2,	%g6
	movvc	%icc,	%i4,	%o5
	sethi	0x10B4,	%g3
	movg	%icc,	%o4,	%i7
	andncc	%g2,	%o6,	%o3
	movrne	%l1,	0x0C9,	%g5
	smulcc	%i2,	0x0F79,	%i5
	array32	%i1,	%l0,	%g1
	movpos	%icc,	%g4,	%l5
	sdiv	%i6,	0x13AD,	%l6
	or	%i3,	0x0992,	%l3
	add	%o7,	%o1,	%i0
	addcc	%o2,	%g7,	%l4
	fabss	%f13,	%f21
	fmovdneg	%xcc,	%f2,	%f27
	fmovdl	%xcc,	%f0,	%f2
	fmovrdlez	%l2,	%f14,	%f14
	srl	%o0,	%i4,	%g6
	array16	%g3,	%o5,	%i7
	fpack32	%f0,	%f8,	%f2
	srax	%o4,	%o6,	%o3
	fcmped	%fcc0,	%f8,	%f24
	array32	%g2,	%g5,	%l1
	sdivx	%i5,	0x1103,	%i2
	fxnor	%f10,	%f2,	%f2
	udivx	%i1,	0x12B5,	%l0
	smulcc	%g1,	0x0FBD,	%g4
	movrlez	%i6,	%l6,	%l5
	srax	%i3,	0x11,	%o7
	subcc	%l3,	0x04F5,	%i0
	movleu	%icc,	%o1,	%g7
	umul	%l4,	0x1D60,	%l2
	edge8	%o0,	%i4,	%o2
	nop
	set	0x4C, %o1
	ldub	[%l7 + %o1],	%g3
	fmovd	%f20,	%f6
	edge8	%g6,	%i7,	%o4
	fnot2s	%f13,	%f6
	popc	0x0F09,	%o5
	orcc	%o6,	0x1570,	%o3
	orn	%g5,	%g2,	%l1
	edge32l	%i5,	%i1,	%i2
	fors	%f14,	%f10,	%f3
	nop
	set	0x70, %i1
	sth	%l0,	[%l7 + %i1]
	restore %g1, %i6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f30,	%f0,	%g4
	ldub	[%l7 + 0x6B],	%l5
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	orncc	%l3,	0x104A,	%o1
	movgu	%xcc,	%g7,	%l4
	movvc	%xcc,	%l2,	%i0
	alignaddr	%i4,	%o2,	%g3
	fcmple16	%f24,	%f12,	%o0
	nop
	set	0x18, %o0
	stx	%i7,	[%l7 + %o0]
	fpsub32s	%f19,	%f21,	%f25
	fnot1s	%f18,	%f27
	srl	%g6,	%o5,	%o6
	subcc	%o4,	0x071B,	%o3
	edge8l	%g5,	%l1,	%g2
	movge	%xcc,	%i1,	%i5
	ldsh	[%l7 + 0x5E],	%i2
	fmovdgu	%icc,	%f2,	%f5
	edge32l	%g1,	%l0,	%l6
	orn	%i6,	%g4,	%l5
	sdivcc	%i3,	0x150B,	%o7
	sethi	0x08BF,	%o1
	fands	%f8,	%f17,	%f24
	edge8n	%g7,	%l3,	%l2
	udiv	%l4,	0x1117,	%i0
	ldsw	[%l7 + 0x20],	%i4
	addccc	%o2,	%o0,	%g3
	addccc	%g6,	%i7,	%o6
	edge16	%o4,	%o5,	%o3
	save %g5, 0x1BB0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g2,	%i5,	%i1
	movleu	%icc,	%i2,	%g1
	movneg	%xcc,	%l0,	%i6
	array32	%g4,	%l6,	%l5
	movleu	%icc,	%o7,	%i3
	restore %g7, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%l4
	fandnot2	%f12,	%f16,	%f18
	movneg	%icc,	%l3,	%i4
	movrgez	%o2,	0x2AD,	%i0
	move	%icc,	%o0,	%g6
	edge8	%g3,	%i7,	%o6
	movneg	%xcc,	%o4,	%o5
	smul	%g5,	%o3,	%l1
	alignaddrl	%g2,	%i1,	%i2
	fcmpd	%fcc1,	%f12,	%f4
	edge8ln	%g1,	%i5,	%i6
	fmul8ulx16	%f4,	%f2,	%f30
	move	%xcc,	%g4,	%l0
	fmovspos	%icc,	%f16,	%f15
	sdiv	%l5,	0x1C9F,	%l6
	lduw	[%l7 + 0x58],	%i3
	sdivcc	%g7,	0x0C70,	%o7
	sra	%l2,	0x01,	%l4
	xnor	%l3,	0x01D9,	%o1
	sll	%o2,	0x14,	%i0
	xnorcc	%o0,	%g6,	%g3
	udivcc	%i4,	0x1A4D,	%i7
	and	%o4,	0x1853,	%o5
	edge32n	%g5,	%o6,	%o3
	umulcc	%g2,	0x0807,	%l1
	movcs	%xcc,	%i2,	%g1
	srax	%i1,	%i6,	%g4
	fnegd	%f12,	%f26
	ldsh	[%l7 + 0x14],	%i5
	movle	%xcc,	%l5,	%l6
	movcc	%xcc,	%l0,	%i3
	fcmpes	%fcc2,	%f0,	%f12
	edge32	%o7,	%l2,	%g7
	mova	%xcc,	%l3,	%o1
	xnor	%l4,	0x0691,	%i0
	add	%o0,	0x10CA,	%o2
	edge8n	%g6,	%g3,	%i4
	fnot2s	%f30,	%f21
	st	%f7,	[%l7 + 0x68]
	addccc	%i7,	0x1FAF,	%o4
	movl	%xcc,	%o5,	%g5
	fmovsl	%xcc,	%f15,	%f22
	fandnot1	%f16,	%f18,	%f20
	or	%o6,	%g2,	%o3
	andn	%i2,	%g1,	%i1
	xor	%i6,	%g4,	%l1
	edge32ln	%l5,	%l6,	%i5
	udiv	%i3,	0x0F69,	%l0
	edge32ln	%l2,	%o7,	%g7
	alignaddr	%o1,	%l3,	%l4
	fmovrsne	%o0,	%f0,	%f20
	srl	%i0,	%g6,	%o2
	edge32ln	%i4,	%g3,	%i7
	xnor	%o5,	0x1E60,	%g5
	fnot1	%f20,	%f18
	edge32n	%o4,	%o6,	%g2
	fcmpeq32	%f22,	%f20,	%o3
	fxnor	%f2,	%f4,	%f8
	movne	%icc,	%g1,	%i1
	ldsw	[%l7 + 0x18],	%i2
	fpackfix	%f20,	%f31
	edge32	%i6,	%g4,	%l5
	array32	%l1,	%i5,	%i3
	edge8n	%l0,	%l6,	%o7
	srlx	%l2,	0x0F,	%g7
	popc	0x0AC4,	%l3
	subccc	%l4,	%o1,	%i0
	fsrc2s	%f1,	%f6
	fmovsl	%icc,	%f6,	%f9
	edge8l	%g6,	%o2,	%o0
	orn	%i4,	0x0C62,	%g3
	movvc	%xcc,	%i7,	%o5
	fmovsne	%xcc,	%f16,	%f8
	ldsw	[%l7 + 0x7C],	%o4
	edge8	%g5,	%o6,	%g2
	xnorcc	%o3,	0x0EA4,	%g1
	srl	%i2,	0x02,	%i1
	udivx	%i6,	0x0A1B,	%l5
	ldub	[%l7 + 0x2F],	%g4
	mulscc	%l1,	%i3,	%l0
	ld	[%l7 + 0x78],	%f23
	movle	%xcc,	%i5,	%o7
	subcc	%l2,	0x14E4,	%g7
	movl	%icc,	%l3,	%l4
	movre	%o1,	0x1BB,	%i0
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	stw	%o0,	[%l7 + 0x48]
	movne	%icc,	%g6,	%g3
	alignaddrl	%i4,	%i7,	%o4
	fandnot1s	%f30,	%f1,	%f2
	or	%g5,	0x1602,	%o6
	fmovdl	%icc,	%f19,	%f22
	xnorcc	%g2,	%o5,	%g1
	ldx	[%l7 + 0x30],	%o3
	fpack16	%f28,	%f24
	orcc	%i1,	%i6,	%i2
	addccc	%g4,	0x05B2,	%l5
	udivx	%l1,	0x0F0D,	%i3
	edge32l	%l0,	%o7,	%l2
	xnorcc	%g7,	%i5,	%l3
	movne	%xcc,	%o1,	%i0
	movre	%l6,	%l4,	%o2
	ldd	[%l7 + 0x28],	%o0
	edge8n	%g6,	%g3,	%i7
	movgu	%icc,	%i4,	%o4
	fxnors	%f16,	%f14,	%f6
	andn	%o6,	0x07B3,	%g5
	srl	%g2,	%o5,	%g1
	fexpand	%f18,	%f18
	fmovda	%icc,	%f31,	%f15
	smulcc	%o3,	0x16D9,	%i6
	movleu	%xcc,	%i2,	%i1
	orncc	%l5,	%g4,	%l1
	movrlez	%l0,	0x227,	%o7
	movge	%xcc,	%l2,	%i3
	xorcc	%i5,	0x08A2,	%l3
	movrlz	%o1,	0x0E5,	%g7
	fnand	%f6,	%f28,	%f24
	edge8	%i0,	%l6,	%o2
	and	%o0,	%l4,	%g6
	xnorcc	%g3,	0x09BD,	%i4
	array16	%i7,	%o6,	%g5
	xnorcc	%o4,	0x0B79,	%o5
	udivx	%g2,	0x1EE9,	%o3
	add	%i6,	0x07D6,	%g1
	movrgz	%i1,	0x0BF,	%i2
	stb	%l5,	[%l7 + 0x09]
	array8	%l1,	%g4,	%o7
	addc	%l2,	%i3,	%l0
	movrgez	%l3,	%o1,	%i5
	umul	%g7,	0x1933,	%l6
	smulcc	%o2,	0x0F66,	%o0
	xnorcc	%i0,	%g6,	%l4
	udivx	%i4,	0x09A3,	%g3
	addcc	%i7,	%o6,	%g5
	movre	%o5,	0x216,	%o4
	sra	%g2,	0x1A,	%o3
	or	%i6,	0x1477,	%i1
	sdivx	%i2,	0x0288,	%l5
	addccc	%l1,	%g1,	%o7
	fcmpgt16	%f10,	%f0,	%g4
	ldsw	[%l7 + 0x68],	%i3
	fcmpgt32	%f24,	%f6,	%l2
	fmovsgu	%xcc,	%f19,	%f25
	addccc	%l3,	%o1,	%i5
	fornot1s	%f20,	%f3,	%f13
	subcc	%g7,	%l0,	%l6
	lduh	[%l7 + 0x0C],	%o0
	movcc	%xcc,	%i0,	%g6
	popc	%l4,	%o2
	umulcc	%i4,	%g3,	%o6
	edge32	%g5,	%i7,	%o4
	or	%o5,	0x16C7,	%g2
	fandnot1s	%f18,	%f25,	%f27
	fnot2s	%f5,	%f12
	subccc	%o3,	0x05AE,	%i1
	array8	%i2,	%i6,	%l1
	andncc	%g1,	%o7,	%g4
	andn	%i3,	0x0277,	%l5
	smulcc	%l3,	0x18A4,	%o1
	ld	[%l7 + 0x7C],	%f5
	alignaddrl	%i5,	%l2,	%g7
	fmovdl	%xcc,	%f27,	%f2
	umulcc	%l0,	%o0,	%i0
	fmovsneg	%icc,	%f17,	%f25
	fmovsa	%xcc,	%f8,	%f16
	edge16n	%l6,	%g6,	%l4
	sdiv	%o2,	0x18EE,	%i4
	fmul8sux16	%f26,	%f0,	%f24
	movgu	%xcc,	%o6,	%g3
	udivx	%i7,	0x042F,	%g5
	array32	%o5,	%g2,	%o4
	movrlz	%i1,	%o3,	%i6
	movpos	%icc,	%l1,	%i2
	sub	%o7,	%g1,	%g4
	array32	%l5,	%i3,	%l3
	st	%f30,	[%l7 + 0x44]
	ldx	[%l7 + 0x70],	%o1
	edge16l	%l2,	%i5,	%l0
	ldsh	[%l7 + 0x7C],	%g7
	fmovdne	%xcc,	%f19,	%f5
	move	%xcc,	%i0,	%l6
	smulcc	%o0,	%g6,	%l4
	sdiv	%o2,	0x18AB,	%o6
	smulcc	%g3,	0x1535,	%i4
	fexpand	%f2,	%f0
	subcc	%i7,	0x0359,	%g5
	srlx	%g2,	0x0B,	%o4
	edge32ln	%o5,	%o3,	%i6
	fabss	%f14,	%f7
	movle	%icc,	%l1,	%i2
	xorcc	%o7,	%i1,	%g4
	sll	%l5,	0x0C,	%g1
	subccc	%i3,	0x1F4D,	%l3
	fmovda	%icc,	%f29,	%f13
	restore %o1, 0x15C7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l0,	0x1DBF,	%g7
	subcc	%i5,	0x02B3,	%i0
	sllx	%l6,	0x14,	%o0
	save %l4, 0x190C, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f2,	%f12,	%f6
	fnegs	%f24,	%f29
	movne	%xcc,	%g6,	%o6
	orn	%g3,	%i4,	%g5
	andcc	%i7,	%o4,	%g2
	movrne	%o5,	%i6,	%o3
	edge8ln	%i2,	%l1,	%i1
	movrgez	%o7,	0x24E,	%l5
	array16	%g4,	%g1,	%l3
	smulcc	%o1,	%i3,	%l0
	subc	%l2,	%g7,	%i0
	edge32n	%i5,	%l6,	%o0
	srlx	%l4,	%o2,	%o6
	umulcc	%g3,	%i4,	%g5
	move	%icc,	%i7,	%g6
	fmovdn	%icc,	%f7,	%f5
	subc	%g2,	%o5,	%o4
	mova	%xcc,	%i6,	%i2
	and	%o3,	%l1,	%i1
	xnorcc	%l5,	0x06A6,	%o7
	subccc	%g1,	0x1EE1,	%g4
	add	%o1,	0x09C9,	%i3
	sllx	%l3,	%l2,	%g7
	add	%i0,	%l0,	%l6
	udiv	%o0,	0x1CAF,	%l4
	stw	%o2,	[%l7 + 0x3C]
	sllx	%o6,	0x06,	%g3
	edge32	%i4,	%i5,	%g5
	fmul8x16al	%f18,	%f8,	%f16
	fmovsgu	%icc,	%f23,	%f4
	fpsub16s	%f26,	%f0,	%f26
	ld	[%l7 + 0x78],	%f9
	sdivcc	%i7,	0x02BE,	%g2
	movre	%o5,	0x154,	%g6
	fmul8x16au	%f15,	%f18,	%f18
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	smulcc	%o3,	%l1,	%i1
	nop
	set	0x46, %o7
	lduh	[%l7 + %o7],	%l5
	edge32	%o7,	%g1,	%i2
	movrne	%g4,	0x0A2,	%i3
	sth	%l3,	[%l7 + 0x0E]
	sll	%l2,	%g7,	%i0
	xnor	%l0,	0x0E05,	%l6
	fmovrdlez	%o1,	%f26,	%f20
	fsrc2s	%f10,	%f31
	edge32	%o0,	%o2,	%l4
	fmovsge	%xcc,	%f7,	%f10
	ldd	[%l7 + 0x40],	%f28
	array32	%g3,	%o6,	%i4
	udivcc	%i5,	0x0E1F,	%g5
	sub	%i7,	0x0EF9,	%g2
	fzeros	%f6
	std	%f26,	[%l7 + 0x68]
	ldd	[%l7 + 0x50],	%f24
	movrgz	%g6,	0x31A,	%o5
	srax	%i6,	0x1A,	%o3
	addc	%o4,	0x1C6B,	%l1
	stx	%i1,	[%l7 + 0x68]
	subccc	%o7,	0x0E8A,	%g1
	movrlez	%l5,	0x011,	%g4
	edge8	%i2,	%i3,	%l2
	movvc	%xcc,	%l3,	%g7
	array32	%l0,	%i0,	%l6
	xorcc	%o0,	0x1A90,	%o1
	mulscc	%l4,	%g3,	%o6
	xor	%i4,	0x01FD,	%i5
	edge32n	%o2,	%g5,	%g2
	fmovrdlez	%g6,	%f28,	%f16
	move	%icc,	%i7,	%i6
	popc	%o3,	%o5
	alignaddr	%o4,	%i1,	%l1
	ldd	[%l7 + 0x58],	%o6
	ldd	[%l7 + 0x28],	%f30
	xor	%g1,	0x0887,	%g4
	array32	%l5,	%i2,	%i3
	fnot1s	%f31,	%f13
	fmul8ulx16	%f12,	%f10,	%f26
	ldx	[%l7 + 0x68],	%l3
	srl	%g7,	%l2,	%l0
	edge16n	%l6,	%i0,	%o1
	sllx	%l4,	%o0,	%g3
	add	%o6,	%i5,	%i4
	fone	%f0
	fpsub32	%f0,	%f30,	%f0
	movrne	%o2,	%g5,	%g6
	move	%xcc,	%g2,	%i6
	sth	%i7,	[%l7 + 0x44]
	udivx	%o3,	0x03B3,	%o4
	fxor	%f16,	%f20,	%f14
	edge32ln	%i1,	%o5,	%o7
	addcc	%g1,	0x09F1,	%g4
	movl	%icc,	%l5,	%l1
	srax	%i2,	0x10,	%i3
	movleu	%icc,	%g7,	%l2
	ldub	[%l7 + 0x2A],	%l3
	fmul8sux16	%f4,	%f16,	%f0
	fmovscs	%xcc,	%f11,	%f19
	fmovdpos	%icc,	%f14,	%f24
	fmul8x16	%f6,	%f16,	%f16
	xnorcc	%l6,	%l0,	%o1
	movrlez	%i0,	%l4,	%o0
	mulscc	%o6,	0x0E59,	%i5
	addcc	%i4,	%o2,	%g3
	st	%f5,	[%l7 + 0x44]
	movl	%xcc,	%g5,	%g2
	srlx	%i6,	%g6,	%o3
	or	%i7,	%i1,	%o5
	umul	%o4,	0x1E92,	%o7
	udiv	%g1,	0x026F,	%l5
	movne	%xcc,	%l1,	%g4
	srl	%i3,	0x06,	%g7
	edge32l	%l2,	%i2,	%l6
	fxnors	%f20,	%f29,	%f19
	lduh	[%l7 + 0x34],	%l3
	array32	%o1,	%i0,	%l4
	srax	%o0,	0x07,	%l0
	fnor	%f20,	%f20,	%f22
	mulscc	%o6,	0x1952,	%i4
	srl	%i5,	%g3,	%g5
	and	%o2,	%i6,	%g2
	movne	%xcc,	%g6,	%i7
	alignaddr	%o3,	%i1,	%o5
	umul	%o7,	%g1,	%l5
	movneg	%icc,	%l1,	%o4
	andncc	%i3,	%g4,	%g7
	fcmple32	%f30,	%f0,	%l2
	movpos	%icc,	%l6,	%i2
	srlx	%l3,	%o1,	%l4
	fxnor	%f0,	%f28,	%f2
	umulcc	%i0,	0x18AC,	%o0
	movg	%xcc,	%l0,	%i4
	move	%icc,	%o6,	%i5
	orn	%g5,	0x0CE5,	%g3
	edge8n	%i6,	%o2,	%g2
	sub	%g6,	0x0AFC,	%o3
	edge8l	%i1,	%i7,	%o5
	ldub	[%l7 + 0x2E],	%g1
	movre	%l5,	%l1,	%o4
	movcs	%icc,	%o7,	%i3
	movgu	%xcc,	%g7,	%g4
	udiv	%l2,	0x1D1F,	%i2
	fpadd16s	%f28,	%f11,	%f28
	movre	%l3,	0x1C0,	%l6
	edge8ln	%o1,	%l4,	%i0
	fmovsge	%icc,	%f15,	%f14
	fmovrsgez	%l0,	%f19,	%f18
	orcc	%i4,	0x07AF,	%o6
	movrgez	%i5,	%o0,	%g5
	fmovrdlz	%i6,	%f14,	%f24
	movl	%icc,	%o2,	%g3
	orncc	%g2,	%o3,	%g6
	fmovd	%f28,	%f20
	edge8n	%i1,	%o5,	%i7
	fnot1s	%f9,	%f1
	addc	%g1,	%l5,	%o4
	addccc	%o7,	%i3,	%l1
	movl	%icc,	%g7,	%l2
	subc	%g4,	0x1BBC,	%l3
	subc	%l6,	0x0227,	%i2
	subcc	%o1,	%i0,	%l0
	orn	%l4,	0x1D0D,	%i4
	alignaddr	%o6,	%i5,	%o0
	fand	%f0,	%f30,	%f6
	ldub	[%l7 + 0x6A],	%g5
	array8	%o2,	%g3,	%g2
	addc	%i6,	0x1874,	%g6
	nop
	set	0x08, %i7
	ldub	[%l7 + %i7],	%i1
	edge16n	%o5,	%o3,	%g1
	subcc	%i7,	%l5,	%o4
	fcmpeq16	%f24,	%f12,	%o7
	addccc	%l1,	0x0706,	%g7
	fmovsa	%icc,	%f13,	%f20
	movneg	%icc,	%i3,	%l2
	mova	%xcc,	%l3,	%l6
	movrlz	%i2,	%o1,	%g4
	orcc	%l0,	0x13DD,	%l4
	movpos	%icc,	%i4,	%o6
	movg	%xcc,	%i5,	%i0
	subccc	%g5,	0x1B75,	%o2
	add	%g3,	0x011F,	%o0
	save %i6, %g2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f4,	%f30,	%i1
	fsrc2	%f6,	%f14
	movrne	%o3,	0x095,	%g1
	mulx	%o5,	0x1E5E,	%i7
	fmul8sux16	%f24,	%f12,	%f4
	xnorcc	%o4,	0x1056,	%l5
	umul	%l1,	0x05AA,	%g7
	fandnot1s	%f17,	%f31,	%f10
	addcc	%o7,	%l2,	%l3
	and	%i3,	0x0123,	%l6
	edge32	%o1,	%i2,	%g4
	subccc	%l4,	%i4,	%l0
	edge8ln	%o6,	%i0,	%g5
	edge16n	%i5,	%o2,	%o0
	srl	%i6,	0x10,	%g3
	udivx	%g6,	0x1B6F,	%g2
	fmovrdlez	%i1,	%f22,	%f20
	ld	[%l7 + 0x68],	%f20
	fabss	%f23,	%f12
	umul	%o3,	%g1,	%o5
	movrlez	%i7,	%l5,	%o4
	umulcc	%l1,	0x04D3,	%o7
	fnor	%f8,	%f28,	%f10
	lduw	[%l7 + 0x78],	%g7
	smul	%l3,	%i3,	%l6
	movcc	%xcc,	%o1,	%l2
	movleu	%xcc,	%g4,	%l4
	fcmps	%fcc1,	%f25,	%f12
	xnor	%i4,	%l0,	%o6
	andcc	%i2,	0x138B,	%i0
	sdiv	%g5,	0x0FD3,	%o2
	fnot2s	%f3,	%f14
	fmovdvc	%icc,	%f31,	%f1
	save %i5, %i6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o0,	%g2
	array32	%i1,	%g6,	%g1
	sllx	%o5,	%i7,	%o3
	movrgz	%o4,	%l5,	%o7
	add	%g7,	0x184B,	%l3
	smulcc	%i3,	0x1A24,	%l1
	movg	%xcc,	%o1,	%l6
	alignaddrl	%l2,	%l4,	%i4
	movn	%icc,	%g4,	%o6
	smulcc	%i2,	%i0,	%l0
	move	%xcc,	%o2,	%i5
	fcmps	%fcc1,	%f31,	%f23
	fpackfix	%f22,	%f0
	ldsb	[%l7 + 0x4D],	%i6
	edge32ln	%g5,	%o0,	%g3
	array8	%i1,	%g6,	%g1
	andcc	%g2,	0x0325,	%i7
	edge32ln	%o5,	%o4,	%l5
	edge32n	%o7,	%o3,	%g7
	ldsb	[%l7 + 0x40],	%l3
	movcc	%xcc,	%l1,	%o1
	save %i3, 0x1C76, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x18],	%f4
	orcc	%l4,	%l2,	%i4
	faligndata	%f6,	%f18,	%f16
	lduh	[%l7 + 0x2E],	%o6
	movg	%icc,	%g4,	%i2
	array32	%l0,	%i0,	%o2
	stw	%i6,	[%l7 + 0x14]
	ld	[%l7 + 0x30],	%f2
	addccc	%i5,	0x1E9D,	%o0
	srlx	%g5,	0x10,	%i1
	array8	%g6,	%g1,	%g2
	or	%g3,	0x0622,	%o5
	ldx	[%l7 + 0x58],	%i7
	sllx	%l5,	0x12,	%o7
	movn	%xcc,	%o4,	%g7
	edge16l	%l3,	%o3,	%l1
	fsrc1s	%f31,	%f29
	fmovrsgz	%o1,	%f9,	%f8
	ldd	[%l7 + 0x30],	%f0
	fmovdpos	%xcc,	%f14,	%f30
	fmovsg	%xcc,	%f26,	%f10
	andn	%l6,	%l4,	%i3
	stb	%i4,	[%l7 + 0x08]
	alignaddr	%o6,	%g4,	%l2
	orncc	%i2,	%i0,	%o2
	mulx	%l0,	%i5,	%i6
	movcs	%icc,	%g5,	%o0
	sir	0x020C
	movvc	%icc,	%i1,	%g1
	andncc	%g2,	%g3,	%g6
	movrlez	%i7,	%l5,	%o5
	st	%f13,	[%l7 + 0x70]
	fxors	%f28,	%f17,	%f31
	addccc	%o7,	%g7,	%o4
	sdivcc	%o3,	0x00AF,	%l3
	umul	%o1,	0x1B7E,	%l1
	edge32ln	%l6,	%l4,	%i4
	sra	%o6,	%g4,	%i3
	andncc	%i2,	%i0,	%l2
	or	%o2,	0x0948,	%i5
	fmovdvs	%xcc,	%f31,	%f24
	fcmpeq16	%f18,	%f16,	%l0
	sth	%i6,	[%l7 + 0x68]
	restore %o0, %i1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g2,	%g3,	%g6
	fpack32	%f10,	%f2,	%f24
	movre	%i7,	0x017,	%g1
	subcc	%o5,	%o7,	%l5
	sdiv	%g7,	0x0D62,	%o4
	movleu	%xcc,	%l3,	%o3
	movgu	%xcc,	%o1,	%l6
	ldub	[%l7 + 0x1F],	%l4
	fmovdcs	%xcc,	%f24,	%f20
	fcmpeq32	%f26,	%f20,	%l1
	udivcc	%o6,	0x06DE,	%i4
	stw	%i3,	[%l7 + 0x2C]
	edge16n	%i2,	%i0,	%l2
	umul	%o2,	0x086E,	%i5
	movvc	%xcc,	%g4,	%l0
	umulcc	%o0,	0x0F7B,	%i1
	andcc	%g5,	%i6,	%g3
	movle	%xcc,	%g6,	%i7
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	lduw	[%l7 + 0x4C],	%o7
	fnors	%f13,	%f1,	%f30
	ldsw	[%l7 + 0x7C],	%l5
	fand	%f6,	%f22,	%f8
	ldub	[%l7 + 0x08],	%g1
	stx	%g7,	[%l7 + 0x50]
	movvc	%icc,	%o4,	%l3
	std	%f10,	[%l7 + 0x40]
	fornot1	%f6,	%f14,	%f18
	addc	%o1,	%l6,	%l4
	fsrc1	%f12,	%f2
	ldsb	[%l7 + 0x43],	%o3
	movl	%icc,	%o6,	%i4
	ldx	[%l7 + 0x20],	%i3
	ldd	[%l7 + 0x48],	%f12
	fornot2s	%f31,	%f0,	%f2
	stx	%i2,	[%l7 + 0x40]
	sdivx	%l1,	0x0F94,	%l2
	sllx	%i0,	%i5,	%o2
	orcc	%g4,	%l0,	%i1
	for	%f6,	%f30,	%f4
	movrlz	%g5,	0x3D7,	%i6
	fornot2s	%f13,	%f7,	%f15
	sdivcc	%g3,	0x010D,	%o0
	edge8l	%g6,	%i7,	%o5
	edge8l	%g2,	%o7,	%g1
	orn	%l5,	%o4,	%l3
	xnor	%g7,	%l6,	%l4
	movrlz	%o1,	0x1F9,	%o3
	fmovsa	%icc,	%f25,	%f27
	edge16l	%i4,	%o6,	%i3
	fmovse	%xcc,	%f16,	%f15
	addc	%i2,	0x066D,	%l2
	umul	%i0,	0x1D4E,	%l1
	edge8ln	%o2,	%i5,	%g4
	movge	%xcc,	%i1,	%l0
	xnor	%i6,	%g5,	%o0
	mulx	%g3,	%g6,	%o5
	edge32n	%i7,	%o7,	%g1
	sub	%l5,	%o4,	%l3
	fxors	%f5,	%f11,	%f8
	edge32	%g2,	%l6,	%g7
	sll	%l4,	%o3,	%o1
	mulx	%o6,	0x04C5,	%i4
	subc	%i2,	0x0EBF,	%i3
	subccc	%l2,	%i0,	%o2
	fmovsl	%xcc,	%f30,	%f27
	stb	%i5,	[%l7 + 0x51]
	fmovdge	%icc,	%f0,	%f6
	srl	%g4,	%l1,	%i1
	fmovdgu	%icc,	%f11,	%f27
	smul	%i6,	0x1E5C,	%g5
	orncc	%l0,	0x1805,	%g3
	movcc	%xcc,	%o0,	%g6
	fmovdleu	%xcc,	%f25,	%f25
	alignaddrl	%o5,	%o7,	%g1
	ldsh	[%l7 + 0x26],	%i7
	edge8ln	%l5,	%l3,	%o4
	or	%l6,	%g2,	%g7
	xnor	%l4,	0x144B,	%o3
	udiv	%o1,	0x17DB,	%i4
	fcmpes	%fcc3,	%f2,	%f6
	movge	%icc,	%i2,	%i3
	fcmps	%fcc1,	%f24,	%f10
	fmovsgu	%xcc,	%f22,	%f21
	siam	0x7
	stx	%o6,	[%l7 + 0x10]
	ldd	[%l7 + 0x20],	%l2
	edge8ln	%o2,	%i5,	%i0
	sra	%g4,	%l1,	%i1
	move	%icc,	%i6,	%l0
	movgu	%icc,	%g5,	%o0
	movre	%g6,	%g3,	%o5
	movrne	%g1,	%o7,	%l5
	subcc	%l3,	%i7,	%o4
	udiv	%l6,	0x0B87,	%g2
	edge16l	%g7,	%l4,	%o3
	fzeros	%f16
	xor	%o1,	%i2,	%i3
	sdivcc	%o6,	0x1C94,	%i4
	std	%f22,	[%l7 + 0x48]
	lduw	[%l7 + 0x1C],	%l2
	edge8	%o2,	%i5,	%g4
	andn	%i0,	0x108E,	%i1
	ldd	[%l7 + 0x30],	%i6
	restore %l0, 0x0461, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g5,	%g6,	%g3
	pdist	%f30,	%f6,	%f8
	addcc	%o0,	%g1,	%o5
	edge32ln	%l5,	%l3,	%i7
	addc	%o7,	%l6,	%g2
	fmovrdgz	%o4,	%f14,	%f30
	sll	%g7,	0x15,	%l4
	movn	%icc,	%o1,	%i2
	fmul8sux16	%f24,	%f2,	%f8
	sdivx	%o3,	0x1EFE,	%i3
	sra	%o6,	0x00,	%l2
	fcmpeq32	%f6,	%f2,	%i4
	sllx	%i5,	0x04,	%o2
	edge32l	%i0,	%i1,	%i6
	movrne	%g4,	%l0,	%l1
	fabsd	%f12,	%f8
	fpadd32s	%f19,	%f4,	%f17
	fandnot2	%f6,	%f30,	%f0
	edge16l	%g5,	%g6,	%o0
	edge16l	%g1,	%o5,	%g3
	ldsh	[%l7 + 0x78],	%l5
	nop
	set	0x74, %l3
	sth	%i7,	[%l7 + %l3]
	edge8	%l3,	%l6,	%g2
	edge32n	%o4,	%g7,	%o7
	umul	%o1,	0x1326,	%l4
	movre	%o3,	%i2,	%i3
	udiv	%o6,	0x00CF,	%i4
	fmovscc	%icc,	%f28,	%f10
	addc	%l2,	%o2,	%i5
	andncc	%i1,	%i0,	%g4
	fpsub32s	%f25,	%f2,	%f7
	fnand	%f14,	%f28,	%f0
	fmovsleu	%icc,	%f26,	%f23
	faligndata	%f0,	%f8,	%f6
	movne	%xcc,	%l0,	%i6
	edge32	%g5,	%l1,	%o0
	sir	0x0D1D
	stw	%g6,	[%l7 + 0x1C]
	stx	%o5,	[%l7 + 0x08]
	fmovrslez	%g1,	%f21,	%f1
	andn	%g3,	0x05DB,	%l5
	move	%icc,	%l3,	%i7
	stb	%l6,	[%l7 + 0x6A]
	xorcc	%g2,	%g7,	%o7
	sub	%o1,	0x0FF6,	%o4
	movrne	%l4,	%i2,	%i3
	siam	0x2
	array32	%o6,	%i4,	%l2
	sllx	%o3,	%o2,	%i1
	ld	[%l7 + 0x40],	%f3
	fmovsgu	%xcc,	%f6,	%f29
	nop
	set	0x20, %o4
	lduw	[%l7 + %o4],	%i0
	movcs	%icc,	%i5,	%g4
	xnorcc	%i6,	0x0FE7,	%g5
	sll	%l1,	0x06,	%o0
	std	%f14,	[%l7 + 0x48]
	ldx	[%l7 + 0x38],	%l0
	fmovsle	%icc,	%f15,	%f14
	fxnors	%f8,	%f10,	%f29
	fandnot1s	%f26,	%f3,	%f4
	movcc	%xcc,	%o5,	%g1
	array16	%g6,	%g3,	%l5
	and	%i7,	%l6,	%g2
	fcmpes	%fcc0,	%f2,	%f4
	movvc	%xcc,	%l3,	%g7
	sdivcc	%o7,	0x1F74,	%o4
	andncc	%o1,	%l4,	%i2
	movre	%o6,	0x194,	%i4
	sll	%l2,	%i3,	%o3
	srl	%i1,	0x15,	%i0
	fpadd32	%f16,	%f12,	%f0
	movn	%icc,	%o2,	%g4
	movrgez	%i6,	0x0ED,	%i5
	lduh	[%l7 + 0x60],	%l1
	fors	%f0,	%f18,	%f2
	fors	%f24,	%f11,	%f22
	save %o0, 0x01C7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l0, 0x01D7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f0,	[%l7 + 0x60]
	orcc	%g6,	%g1,	%g3
	fmovdn	%xcc,	%f2,	%f15
	fmovscc	%icc,	%f5,	%f19
	srlx	%i7,	%l6,	%l5
	move	%icc,	%g2,	%l3
	sra	%g7,	%o4,	%o7
	sdivcc	%l4,	0x0307,	%i2
	subc	%o1,	0x18BE,	%o6
	fmovsg	%xcc,	%f0,	%f2
	edge8ln	%l2,	%i3,	%i4
	stx	%o3,	[%l7 + 0x20]
	fmul8ulx16	%f26,	%f6,	%f30
	orcc	%i0,	0x1E0C,	%i1
	movre	%g4,	0x209,	%o2
	ld	[%l7 + 0x60],	%f15
	subc	%i5,	%l1,	%o0
	fmovsvs	%xcc,	%f13,	%f5
	or	%g5,	%i6,	%o5
	umulcc	%l0,	%g1,	%g3
	fmul8x16au	%f9,	%f11,	%f20
	andcc	%i7,	0x0826,	%l6
	move	%xcc,	%g6,	%l5
	fmovrsgez	%l3,	%f13,	%f8
	sdivx	%g7,	0x18EC,	%g2
	fmovdl	%xcc,	%f13,	%f10
	sllx	%o4,	%o7,	%i2
	lduw	[%l7 + 0x20],	%o1
	edge8n	%l4,	%l2,	%o6
	fpsub16	%f24,	%f20,	%f4
	nop
	set	0x34, %l4
	ldsh	[%l7 + %l4],	%i3
	movcc	%xcc,	%i4,	%o3
	addc	%i0,	%i1,	%g4
	move	%xcc,	%i5,	%o2
	movrne	%o0,	0x38E,	%l1
	movneg	%icc,	%i6,	%g5
	fmul8x16al	%f15,	%f9,	%f24
	popc	%o5,	%l0
	fnors	%f12,	%f27,	%f2
	movrgez	%g1,	0x3E2,	%i7
	fornot2	%f8,	%f12,	%f10
	orcc	%g3,	0x124A,	%l6
	sra	%g6,	0x1D,	%l3
	move	%icc,	%l5,	%g7
	fxor	%f4,	%f18,	%f16
	movvc	%icc,	%o4,	%o7
	movcc	%icc,	%i2,	%o1
	ldsh	[%l7 + 0x0C],	%l4
	sll	%l2,	%g2,	%o6
	movg	%icc,	%i3,	%o3
	movre	%i0,	%i1,	%i4
	fxnor	%f14,	%f18,	%f20
	std	%f10,	[%l7 + 0x60]
	sdiv	%g4,	0x0AAA,	%o2
	edge16ln	%o0,	%i5,	%l1
	sir	0x0DEE
	andncc	%i6,	%o5,	%l0
	subcc	%g1,	%i7,	%g3
	movrlez	%l6,	0x0ED,	%g5
	udivx	%g6,	0x1E85,	%l3
	fcmpgt16	%f28,	%f12,	%l5
	alignaddr	%g7,	%o4,	%i2
	ldd	[%l7 + 0x58],	%f2
	edge16ln	%o1,	%o7,	%l4
	movre	%l2,	0x1D7,	%g2
	array32	%i3,	%o3,	%i0
	ldx	[%l7 + 0x28],	%i1
	edge8l	%o6,	%i4,	%o2
	srl	%o0,	%g4,	%l1
	fpadd32	%f10,	%f8,	%f30
	addc	%i6,	%o5,	%i5
	movre	%l0,	%i7,	%g1
	addcc	%g3,	%g5,	%g6
	sdivcc	%l3,	0x1A1B,	%l6
	sdivcc	%l5,	0x0F17,	%g7
	movg	%xcc,	%i2,	%o1
	add	%o7,	0x0EAB,	%l4
	ldsb	[%l7 + 0x64],	%l2
	std	%f14,	[%l7 + 0x78]
	addcc	%o4,	0x19DA,	%i3
	array32	%o3,	%g2,	%i1
	lduh	[%l7 + 0x24],	%i0
	ld	[%l7 + 0x74],	%f31
	andcc	%o6,	0x190E,	%i4
	movge	%xcc,	%o0,	%o2
	sll	%g4,	0x1D,	%i6
	stw	%l1,	[%l7 + 0x2C]
	fandnot2	%f2,	%f2,	%f4
	movrgz	%i5,	%l0,	%i7
	fnand	%f24,	%f0,	%f20
	fmovsleu	%xcc,	%f31,	%f17
	orncc	%o5,	0x10D1,	%g3
	movneg	%xcc,	%g5,	%g6
	array16	%l3,	%g1,	%l5
	edge8n	%g7,	%i2,	%o1
	xorcc	%o7,	0x08D5,	%l6
	movrne	%l4,	%l2,	%o4
	movne	%xcc,	%i3,	%g2
	sethi	0x1753,	%o3
	movvs	%xcc,	%i1,	%i0
	movvs	%xcc,	%i4,	%o6
	movrlz	%o0,	0x3C9,	%g4
	array32	%i6,	%o2,	%l1
	edge16n	%i5,	%l0,	%o5
	fnors	%f22,	%f30,	%f21
	fpadd16s	%f4,	%f13,	%f29
	xnor	%g3,	%i7,	%g5
	edge16n	%g6,	%g1,	%l3
	andn	%g7,	%l5,	%i2
	xnor	%o1,	0x12CB,	%o7
	sdivcc	%l4,	0x1AD9,	%l6
	sdiv	%o4,	0x1EEF,	%l2
	fmovrsne	%i3,	%f7,	%f12
	popc	%g2,	%i1
	movle	%icc,	%o3,	%i4
	popc	0x10B3,	%i0
	edge8l	%o6,	%g4,	%i6
	fmovrdgez	%o2,	%f2,	%f22
	orcc	%l1,	0x10D9,	%i5
	sra	%o0,	%o5,	%g3
	fmovsle	%xcc,	%f1,	%f7
	xorcc	%l0,	%i7,	%g6
	movcc	%icc,	%g5,	%l3
	movcs	%xcc,	%g1,	%l5
	fmovsvs	%xcc,	%f1,	%f27
	or	%i2,	%o1,	%o7
	subc	%l4,	%g7,	%l6
	orcc	%l2,	%o4,	%g2
	andncc	%i1,	%o3,	%i4
	sir	0x18CA
	move	%icc,	%i3,	%i0
	sll	%g4,	%o6,	%o2
	sllx	%i6,	%l1,	%i5
	pdist	%f30,	%f20,	%f18
	ldsh	[%l7 + 0x7C],	%o0
	xnor	%g3,	0x0FDC,	%o5
	ld	[%l7 + 0x3C],	%f29
	stw	%l0,	[%l7 + 0x30]
	movrlz	%i7,	%g5,	%l3
	ld	[%l7 + 0x78],	%f2
	xorcc	%g1,	0x033A,	%g6
	std	%f28,	[%l7 + 0x38]
	fcmped	%fcc0,	%f12,	%f8
	ldsw	[%l7 + 0x30],	%l5
	fmovrdgz	%i2,	%f2,	%f14
	edge32	%o7,	%o1,	%l4
	nop
	set	0x6B, %g3
	ldub	[%l7 + %g3],	%l6
	movre	%g7,	%o4,	%l2
	fmovrdlz	%g2,	%f12,	%f16
	popc	%i1,	%o3
	movre	%i3,	%i0,	%g4
	movge	%icc,	%i4,	%o2
	stx	%o6,	[%l7 + 0x20]
	fands	%f17,	%f2,	%f31
	siam	0x4
	addcc	%i6,	0x0456,	%i5
	stw	%o0,	[%l7 + 0x24]
	ldx	[%l7 + 0x78],	%g3
	and	%l1,	%o5,	%l0
	sllx	%g5,	0x0F,	%i7
	fnot1	%f8,	%f24
	movre	%l3,	%g1,	%l5
	edge8n	%i2,	%g6,	%o7
	popc	%l4,	%o1
	and	%g7,	%o4,	%l6
	ldub	[%l7 + 0x5B],	%g2
	movrlez	%i1,	%l2,	%i3
	edge8	%o3,	%i0,	%i4
	edge8ln	%o2,	%o6,	%g4
	popc	0x0166,	%i5
	save %o0, %i6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o5,	0x3FF,	%l0
	save %g3, %g5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f10
	fmovrslz	%g1,	%f21,	%f20
	fmovda	%icc,	%f2,	%f10
	subccc	%l5,	%i7,	%i2
	sdiv	%o7,	0x131B,	%l4
	and	%o1,	%g7,	%o4
	edge16	%g6,	%g2,	%l6
	movrlz	%l2,	0x3D0,	%i1
	sir	0x0C6A
	edge16	%o3,	%i3,	%i4
	nop
	set	0x72, %l5
	sth	%i0,	[%l7 + %l5]
	st	%f7,	[%l7 + 0x54]
	edge32	%o6,	%g4,	%o2
	sll	%i5,	0x07,	%o0
	sdivcc	%i6,	0x0295,	%l1
	srlx	%l0,	%o5,	%g5
	mova	%xcc,	%g3,	%l3
	subcc	%l5,	%i7,	%g1
	mulscc	%o7,	%l4,	%i2
	andcc	%o1,	0x11BD,	%o4
	ldsh	[%l7 + 0x58],	%g7
	subccc	%g2,	%g6,	%l6
	fmovse	%icc,	%f12,	%f30
	fabss	%f1,	%f26
	edge32n	%i1,	%o3,	%l2
	udivx	%i4,	0x0DCE,	%i0
	fcmpes	%fcc3,	%f25,	%f21
	edge32	%o6,	%g4,	%o2
	smulcc	%i3,	0x0708,	%i5
	fmovdcs	%icc,	%f0,	%f23
	fnegd	%f28,	%f24
	fxnor	%f30,	%f30,	%f16
	edge32l	%i6,	%l1,	%o0
	fmovdpos	%icc,	%f28,	%f7
	ldsh	[%l7 + 0x2C],	%o5
	udiv	%l0,	0x1127,	%g3
	xorcc	%g5,	%l3,	%i7
	mova	%xcc,	%l5,	%o7
	edge32	%l4,	%g1,	%o1
	andncc	%o4,	%i2,	%g7
	add	%g2,	0x13E9,	%l6
	andncc	%g6,	%o3,	%l2
	srax	%i4,	%i0,	%i1
	ldsb	[%l7 + 0x67],	%o6
	edge8ln	%g4,	%o2,	%i3
	move	%xcc,	%i5,	%i6
	edge32ln	%o0,	%l1,	%o5
	xnorcc	%l0,	0x0A7F,	%g3
	umul	%l3,	0x00C5,	%g5
	fmovsl	%icc,	%f15,	%f31
	stb	%l5,	[%l7 + 0x45]
	mulx	%i7,	%l4,	%o7
	fmovdneg	%icc,	%f24,	%f3
	xnorcc	%o1,	%g1,	%i2
	udiv	%g7,	0x0DAA,	%g2
	ld	[%l7 + 0x14],	%f8
	st	%f15,	[%l7 + 0x18]
	fcmpne16	%f16,	%f20,	%o4
	movgu	%icc,	%l6,	%g6
	popc	0x00EC,	%l2
	fmovda	%icc,	%f1,	%f14
	add	%i4,	%o3,	%i0
	movvc	%icc,	%o6,	%g4
	movrlz	%i1,	0x05A,	%i3
	fmul8x16	%f23,	%f14,	%f30
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	fpackfix	%f30,	%f9
	fzero	%f26
	edge8	%l1,	%o2,	%l0
	movrgz	%g3,	%l3,	%o5
	nop
	set	0x28, %g5
	std	%f20,	[%l7 + %g5]
	stw	%g5,	[%l7 + 0x4C]
	addccc	%l5,	%i7,	%l4
	popc	%o1,	%o7
	addccc	%i2,	%g1,	%g7
	fpackfix	%f4,	%f17
	movle	%icc,	%o4,	%l6
	ldsh	[%l7 + 0x1E],	%g2
	fpadd32	%f16,	%f2,	%f4
	array32	%l2,	%g6,	%i4
	sth	%o3,	[%l7 + 0x3E]
	movl	%icc,	%i0,	%o6
	sdiv	%i1,	0x1574,	%g4
	and	%i3,	%i6,	%i5
	movgu	%icc,	%o0,	%o2
	orncc	%l1,	%g3,	%l3
	std	%f24,	[%l7 + 0x50]
	movrgz	%l0,	%g5,	%l5
	subcc	%o5,	%i7,	%o1
	fmovrslez	%o7,	%f22,	%f29
	movpos	%xcc,	%i2,	%l4
	udivcc	%g7,	0x0804,	%o4
	fnegd	%f14,	%f22
	ldd	[%l7 + 0x78],	%f6
	fmovsn	%xcc,	%f30,	%f24
	movcc	%xcc,	%g1,	%g2
	udiv	%l6,	0x0B89,	%l2
	subcc	%i4,	%g6,	%o3
	sdivx	%o6,	0x0713,	%i1
	edge8ln	%g4,	%i3,	%i6
	stb	%i5,	[%l7 + 0x37]
	sll	%o0,	0x1B,	%o2
	nop
	set	0x40, %g4
	ldsw	[%l7 + %g4],	%l1
	fcmped	%fcc2,	%f20,	%f18
	ldx	[%l7 + 0x70],	%g3
	movvc	%icc,	%l3,	%i0
	fmovsa	%icc,	%f7,	%f25
	smulcc	%l0,	0x1BAD,	%l5
	movge	%xcc,	%g5,	%o5
	ldsw	[%l7 + 0x20],	%i7
	movneg	%icc,	%o1,	%o7
	movg	%icc,	%l4,	%i2
	stw	%g7,	[%l7 + 0x68]
	ldsh	[%l7 + 0x22],	%g1
	fxnor	%f16,	%f2,	%f28
	fsrc1	%f24,	%f24
	stx	%g2,	[%l7 + 0x78]
	subccc	%o4,	%l2,	%l6
	sra	%i4,	0x0B,	%o3
	sdivcc	%o6,	0x132F,	%g6
	alignaddrl	%i1,	%g4,	%i3
	fmovse	%icc,	%f9,	%f16
	stb	%i6,	[%l7 + 0x16]
	umulcc	%i5,	0x1E3E,	%o0
	nop
	set	0x44, %l2
	stb	%l1,	[%l7 + %l2]
	alignaddr	%g3,	%l3,	%i0
	udivcc	%o2,	0x1058,	%l5
	smul	%g5,	%o5,	%l0
	movle	%icc,	%o1,	%o7
	move	%xcc,	%l4,	%i2
	fmovrsgz	%i7,	%f11,	%f3
	alignaddr	%g7,	%g1,	%o4
	orcc	%g2,	0x01DF,	%l6
	alignaddrl	%i4,	%l2,	%o6
	alignaddr	%o3,	%i1,	%g4
	nop
	set	0x48, %i3
	std	%f12,	[%l7 + %i3]
	udivx	%i3,	0x19E3,	%i6
	orn	%i5,	%g6,	%o0
	udivx	%l1,	0x1290,	%g3
	edge32	%l3,	%o2,	%i0
	sth	%l5,	[%l7 + 0x2A]
	movne	%icc,	%o5,	%l0
	orn	%o1,	0x09A0,	%o7
	or	%g5,	%i2,	%i7
	umul	%l4,	%g7,	%g1
	fcmpgt32	%f0,	%f16,	%g2
	movrlz	%o4,	0x1A5,	%i4
	orcc	%l2,	%l6,	%o3
	movneg	%icc,	%o6,	%g4
	movpos	%icc,	%i1,	%i6
	fmovsvs	%xcc,	%f23,	%f10
	or	%i3,	%i5,	%o0
	ld	[%l7 + 0x64],	%f10
	movvc	%icc,	%g6,	%g3
	edge32ln	%l1,	%l3,	%i0
	orncc	%o2,	%o5,	%l5
	fmul8ulx16	%f12,	%f26,	%f30
	movre	%o1,	%l0,	%g5
	sllx	%o7,	0x15,	%i7
	fmovdle	%xcc,	%f30,	%f6
	array8	%l4,	%i2,	%g1
	alignaddr	%g7,	%o4,	%g2
	fone	%f12
	andncc	%l2,	%i4,	%o3
	ldsw	[%l7 + 0x48],	%l6
	fxnors	%f4,	%f7,	%f3
	udivx	%o6,	0x0EED,	%i1
	array8	%g4,	%i3,	%i5
	ldd	[%l7 + 0x50],	%i6
	alignaddr	%g6,	%o0,	%g3
	sdiv	%l1,	0x0CC0,	%l3
	movle	%icc,	%i0,	%o2
	stx	%o5,	[%l7 + 0x50]
	pdist	%f4,	%f18,	%f20
	srlx	%l5,	0x0D,	%o1
	ldub	[%l7 + 0x33],	%g5
	mulscc	%l0,	%i7,	%l4
	edge32ln	%o7,	%i2,	%g7
	and	%o4,	%g1,	%l2
	fnor	%f16,	%f22,	%f28
	edge8n	%i4,	%o3,	%g2
	fxors	%f7,	%f20,	%f6
	movg	%xcc,	%l6,	%i1
	movleu	%icc,	%o6,	%i3
	movvc	%icc,	%g4,	%i5
	subcc	%i6,	%o0,	%g3
	movneg	%icc,	%g6,	%l3
	movcs	%xcc,	%i0,	%l1
	umul	%o5,	0x09ED,	%o2
	mulx	%o1,	0x1176,	%l5
	fmovdpos	%icc,	%f31,	%f21
	movpos	%xcc,	%g5,	%l0
	sub	%i7,	0x16D0,	%o7
	srl	%i2,	%l4,	%o4
	restore %g7, %l2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o3,	%g2,	%i4
	movrgez	%i1,	%l6,	%o6
	ldd	[%l7 + 0x78],	%g4
	ldd	[%l7 + 0x28],	%i2
	fmovscs	%xcc,	%f13,	%f1
	mulx	%i5,	0x168F,	%o0
	andncc	%g3,	%g6,	%i6
	fcmple32	%f14,	%f14,	%i0
	addccc	%l1,	0x0FC5,	%o5
	fandnot2	%f6,	%f16,	%f24
	edge16n	%l3,	%o1,	%o2
	sdivx	%l5,	0x1D6B,	%l0
	movvc	%icc,	%i7,	%o7
	sra	%g5,	0x12,	%i2
	lduw	[%l7 + 0x70],	%l4
	udivx	%o4,	0x1574,	%l2
	andn	%g1,	%o3,	%g2
	alignaddr	%i4,	%g7,	%l6
	movrne	%i1,	%o6,	%g4
	sdiv	%i3,	0x03CE,	%o0
	ldd	[%l7 + 0x78],	%i4
	ldsb	[%l7 + 0x44],	%g3
	udiv	%g6,	0x18CE,	%i6
	pdist	%f0,	%f0,	%f6
	stx	%i0,	[%l7 + 0x20]
	edge8n	%o5,	%l3,	%o1
	edge16l	%o2,	%l1,	%l5
	movneg	%icc,	%l0,	%i7
	ldub	[%l7 + 0x7A],	%o7
	ldub	[%l7 + 0x70],	%g5
	srlx	%l4,	0x01,	%o4
	sdivcc	%i2,	0x0E24,	%g1
	edge16ln	%o3,	%g2,	%l2
	fmovse	%xcc,	%f0,	%f21
	andncc	%i4,	%l6,	%i1
	edge32n	%g7,	%o6,	%i3
	andncc	%g4,	%i5,	%g3
	stb	%o0,	[%l7 + 0x56]
	fpack32	%f0,	%f10,	%f28
	udivcc	%g6,	0x1463,	%i0
	for	%f16,	%f6,	%f22
	movcs	%icc,	%i6,	%o5
	fpsub32s	%f24,	%f27,	%f5
	sdiv	%o1,	0x0EB2,	%o2
	sra	%l3,	0x11,	%l5
	st	%f19,	[%l7 + 0x34]
	fcmped	%fcc1,	%f28,	%f14
	subccc	%l1,	0x1510,	%i7
	sllx	%l0,	%g5,	%o7
	edge32ln	%o4,	%l4,	%g1
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%o2
	ldd	[%l7 + 0x10],	%g2
	edge32l	%l2,	%i4,	%l6
	sub	%i2,	%g7,	%o6
	fpadd16	%f14,	%f16,	%f8
	umul	%i3,	%g4,	%i1
	fmuld8ulx16	%f27,	%f25,	%f10
	fandnot1	%f12,	%f22,	%f30
	array16	%i5,	%o0,	%g3
	ldsw	[%l7 + 0x40],	%g6
	xnorcc	%i0,	0x111F,	%o5
	fandnot2s	%f11,	%f9,	%f27
	ldub	[%l7 + 0x70],	%o1
	fmovdcs	%icc,	%f16,	%f25
	edge8n	%i6,	%l3,	%o2
	fcmpne32	%f30,	%f12,	%l5
	nop
	set	0x20, %i2
	stx	%i7,	[%l7 + %i2]
	addcc	%l0,	0x0FF8,	%l1
	movrlez	%o7,	%o4,	%g5
	fand	%f30,	%f28,	%f26
	fmovs	%f10,	%f25
	fcmple32	%f4,	%f24,	%g1
	edge8	%l4,	%g2,	%l2
	andn	%o3,	0x0C59,	%l6
	movcs	%xcc,	%i2,	%i4
	fcmpes	%fcc2,	%f30,	%f15
	orncc	%g7,	0x0925,	%i3
	fpsub16s	%f15,	%f20,	%f6
	movneg	%icc,	%o6,	%i1
	and	%g4,	%i5,	%o0
	edge8ln	%g6,	%i0,	%o5
	ld	[%l7 + 0x54],	%f15
	movrlz	%o1,	0x1CB,	%i6
	edge16n	%g3,	%l3,	%o2
	movl	%xcc,	%i7,	%l5
	fmovdcc	%xcc,	%f13,	%f14
	movrlz	%l1,	%o7,	%l0
	array16	%o4,	%g1,	%l4
	addccc	%g5,	%l2,	%g2
	ldd	[%l7 + 0x48],	%f8
	movge	%icc,	%o3,	%i2
	movre	%i4,	%g7,	%l6
	xor	%i3,	%i1,	%o6
	mova	%xcc,	%i5,	%o0
	sdivcc	%g6,	0x03DA,	%i0
	edge16ln	%o5,	%o1,	%g4
	fmovrdgz	%i6,	%f30,	%f24
	fsrc2s	%f7,	%f12
	fmovdleu	%xcc,	%f16,	%f20
	move	%xcc,	%g3,	%l3
	sdivx	%i7,	0x0405,	%o2
	fmuld8sux16	%f10,	%f4,	%f22
	fmovdcc	%xcc,	%f4,	%f24
	movrgz	%l5,	0x2ED,	%l1
	stx	%l0,	[%l7 + 0x10]
	st	%f11,	[%l7 + 0x28]
	fornot2	%f8,	%f8,	%f14
	array8	%o4,	%g1,	%o7
	ldx	[%l7 + 0x58],	%g5
	orncc	%l4,	%g2,	%l2
	fnegs	%f24,	%f25
	move	%xcc,	%i2,	%i4
	subc	%g7,	%l6,	%i3
	fpack16	%f16,	%f29
	or	%i1,	0x14BE,	%o6
	ld	[%l7 + 0x78],	%f18
	alignaddrl	%o3,	%i5,	%g6
	addccc	%i0,	%o5,	%o1
	std	%f2,	[%l7 + 0x50]
	udivcc	%g4,	0x082A,	%o0
	movrgz	%i6,	%g3,	%l3
	fcmpeq32	%f14,	%f10,	%o2
	ld	[%l7 + 0x44],	%f2
	movg	%xcc,	%i7,	%l1
	sdivcc	%l5,	0x1F45,	%o4
	mulscc	%l0,	%g1,	%g5
	edge32ln	%l4,	%o7,	%g2
	alignaddr	%i2,	%l2,	%g7
	movvs	%icc,	%l6,	%i4
	fandnot2s	%f13,	%f5,	%f18
	fmovs	%f18,	%f17
	edge8l	%i1,	%o6,	%i3
	ldx	[%l7 + 0x30],	%i5
	array32	%g6,	%i0,	%o3
	and	%o1,	%g4,	%o5
	andn	%i6,	0x130D,	%o0
	sllx	%l3,	0x1C,	%o2
	sir	0x1B59
	add	%g3,	0x08F2,	%l1
	andncc	%l5,	%o4,	%l0
	fpadd32s	%f14,	%f7,	%f31
	subcc	%i7,	0x1C25,	%g5
	array16	%g1,	%l4,	%g2
	movge	%xcc,	%i2,	%o7
	fmovsvs	%icc,	%f26,	%f1
	udivcc	%l2,	0x05AD,	%l6
	std	%f28,	[%l7 + 0x68]
	and	%g7,	%i4,	%i1
	nop
	set	0x7A, %g7
	ldsh	[%l7 + %g7],	%o6
	lduw	[%l7 + 0x14],	%i3
	edge16	%g6,	%i5,	%o3
	sth	%o1,	[%l7 + 0x36]
	sllx	%g4,	0x1B,	%i0
	fmovsa	%xcc,	%f13,	%f17
	sdivcc	%o5,	0x1A6B,	%i6
	alignaddr	%o0,	%l3,	%g3
	lduh	[%l7 + 0x50],	%o2
	movvs	%xcc,	%l1,	%l5
	edge8	%o4,	%i7,	%l0
	fand	%f20,	%f12,	%f8
	fxors	%f29,	%f10,	%f25
	andcc	%g1,	0x1501,	%g5
	andn	%l4,	0x0BD2,	%i2
	ldub	[%l7 + 0x62],	%o7
	ldsh	[%l7 + 0x6C],	%g2
	ldsw	[%l7 + 0x3C],	%l2
	movcc	%icc,	%l6,	%i4
	fxor	%f20,	%f22,	%f12
	mulx	%i1,	0x0269,	%o6
	sdivcc	%i3,	0x1FC0,	%g6
	smul	%i5,	0x0C50,	%o3
	movgu	%icc,	%o1,	%g7
	stw	%g4,	[%l7 + 0x30]
	fsrc1	%f2,	%f20
	fmovrslz	%i0,	%f7,	%f6
	movrgez	%i6,	0x0FC,	%o0
	movrlz	%l3,	%g3,	%o5
	fnegs	%f24,	%f26
	andncc	%l1,	%l5,	%o2
	movrgez	%i7,	0x1A2,	%o4
	udivx	%l0,	0x1E51,	%g1
	stw	%l4,	[%l7 + 0x74]
	array32	%g5,	%i2,	%o7
	edge8	%l2,	%l6,	%g2
	and	%i1,	%o6,	%i4
	subcc	%g6,	0x1F9C,	%i5
	fandnot2s	%f24,	%f22,	%f25
	fcmpeq32	%f10,	%f16,	%i3
	stx	%o3,	[%l7 + 0x10]
	ld	[%l7 + 0x34],	%f12
	add	%o1,	%g4,	%i0
	fornot2	%f30,	%f28,	%f6
	ldsh	[%l7 + 0x50],	%i6
	or	%g7,	%l3,	%g3
	fones	%f31
	fors	%f29,	%f23,	%f12
	fornot1s	%f2,	%f9,	%f2
	fnot1s	%f31,	%f21
	fand	%f2,	%f20,	%f4
	orcc	%o0,	%l1,	%o5
	fmovdvc	%icc,	%f3,	%f6
	edge8l	%l5,	%o2,	%o4
	fmovrsgz	%l0,	%f24,	%f4
	edge16l	%g1,	%l4,	%g5
	fzeros	%f30
	stx	%i7,	[%l7 + 0x70]
	edge32	%i2,	%l2,	%o7
	fmovrdlez	%l6,	%f8,	%f8
	andn	%g2,	%i1,	%i4
	fmul8x16au	%f3,	%f4,	%f0
	ld	[%l7 + 0x54],	%f11
	ldub	[%l7 + 0x6D],	%o6
	andn	%g6,	%i3,	%i5
	umul	%o1,	0x1784,	%g4
	stw	%i0,	[%l7 + 0x28]
	mulscc	%o3,	0x1DD6,	%g7
	mova	%icc,	%l3,	%g3
	sllx	%o0,	%i6,	%o5
	fcmpd	%fcc0,	%f14,	%f16
	sub	%l5,	%o2,	%o4
	sra	%l1,	0x03,	%g1
	xnorcc	%l4,	0x1568,	%g5
	stx	%l0,	[%l7 + 0x68]
	edge32l	%i2,	%l2,	%i7
	fmovscc	%xcc,	%f23,	%f9
	edge32n	%l6,	%g2,	%o7
	edge16n	%i4,	%i1,	%o6
	edge16	%i3,	%i5,	%o1
	array8	%g4,	%g6,	%o3
	sethi	0x0A10,	%i0
	subc	%g7,	0x0430,	%g3
	ld	[%l7 + 0x70],	%f31
	xorcc	%o0,	%l3,	%i6
	fcmpgt16	%f14,	%f26,	%o5
	movpos	%icc,	%o2,	%l5
	movre	%o4,	0x127,	%g1
	std	%f28,	[%l7 + 0x30]
	fmul8x16au	%f0,	%f0,	%f8
	edge16n	%l1,	%g5,	%l0
	edge32l	%i2,	%l4,	%i7
	udivcc	%l6,	0x0900,	%l2
	andcc	%g2,	0x0F60,	%o7
	fmovdcs	%icc,	%f19,	%f4
	sethi	0x16F4,	%i4
	subc	%i1,	%i3,	%o6
	std	%f14,	[%l7 + 0x68]
	fmovrsgez	%i5,	%f28,	%f12
	lduh	[%l7 + 0x24],	%o1
	fmovsgu	%icc,	%f4,	%f1
	movrlez	%g4,	%g6,	%o3
	fmovsg	%xcc,	%f29,	%f8
	andn	%g7,	%g3,	%o0
	fmovrdne	%i0,	%f24,	%f22
	xnorcc	%l3,	0x0BBF,	%i6
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f30
	fandnot1s	%f19,	%f30,	%f13
	fmovdge	%xcc,	%f31,	%f20
	ldd	[%l7 + 0x18],	%f24
	movvc	%icc,	%o5,	%o2
	edge8ln	%l5,	%o4,	%l1
	orncc	%g5,	%l0,	%g1
	movcc	%icc,	%i2,	%l4
	fabsd	%f30,	%f10
	orn	%i7,	%l6,	%l2
	movrlz	%g2,	0x165,	%o7
	movge	%xcc,	%i4,	%i1
	fmovdvs	%xcc,	%f7,	%f29
	fnot2	%f0,	%f8
	fmovdge	%icc,	%f18,	%f25
	edge32l	%o6,	%i5,	%o1
	movn	%icc,	%i3,	%g6
	movle	%xcc,	%g4,	%o3
	fornot2s	%f26,	%f6,	%f14
	srax	%g3,	%o0,	%g7
	alignaddr	%l3,	%i0,	%i6
	array8	%o2,	%l5,	%o5
	smulcc	%o4,	0x122F,	%g5
	movn	%icc,	%l1,	%g1
	faligndata	%f26,	%f4,	%f2
	or	%l0,	%l4,	%i2
	st	%f10,	[%l7 + 0x78]
	sth	%i7,	[%l7 + 0x52]
	smulcc	%l6,	0x07A3,	%l2
	movvc	%icc,	%g2,	%i4
	fmul8x16al	%f13,	%f23,	%f8
	addccc	%o7,	0x0552,	%o6
	sdivx	%i5,	0x0D72,	%i1
	movrlez	%i3,	0x2D4,	%o1
	movpos	%icc,	%g4,	%g6
	smul	%g3,	%o0,	%o3
	edge8l	%l3,	%i0,	%g7
	orn	%i6,	0x1391,	%l5
	fors	%f28,	%f16,	%f26
	subccc	%o5,	%o4,	%o2
	array16	%g5,	%l1,	%l0
	ldx	[%l7 + 0x78],	%l4
	xnor	%i2,	0x1220,	%i7
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fpadd32	%f16,	%f18,	%f30
	restore %g2, 0x1CCF, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l6,	%o6,	%o7
	movge	%icc,	%i1,	%i5
	fandnot1	%f0,	%f2,	%f30
	udivcc	%o1,	0x0297,	%g4
	movgu	%xcc,	%i3,	%g6
	lduw	[%l7 + 0x38],	%g3
	fmovdcs	%xcc,	%f2,	%f26
	mova	%icc,	%o3,	%o0
	save %l3, %g7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f28,	%f16,	%f4
	fmuld8sux16	%f29,	%f23,	%f10
	movneg	%xcc,	%i0,	%l5
	fmovsleu	%xcc,	%f19,	%f31
	fmuld8sux16	%f15,	%f1,	%f24
	addccc	%o4,	0x0D85,	%o2
	alignaddr	%o5,	%g5,	%l1
	sdiv	%l4,	0x131C,	%i2
	fornot1s	%f21,	%f7,	%f5
	sllx	%i7,	0x0E,	%g1
	smul	%l2,	0x01BA,	%l0
	edge32ln	%g2,	%l6,	%i4
	edge16n	%o6,	%i1,	%o7
	mulx	%o1,	%g4,	%i5
	movrlz	%i3,	%g3,	%g6
	mova	%xcc,	%o0,	%l3
	sdivcc	%g7,	0x008A,	%i6
	stx	%i0,	[%l7 + 0x50]
	fnors	%f15,	%f6,	%f27
	edge32	%l5,	%o4,	%o3
	fornot2s	%f27,	%f31,	%f9
	array32	%o2,	%g5,	%l1
	edge8ln	%l4,	%o5,	%i2
	mova	%xcc,	%g1,	%l2
	edge16	%l0,	%g2,	%l6
	fzeros	%f24
	subcc	%i4,	0x1DD6,	%i7
	movvc	%xcc,	%i1,	%o7
	umul	%o6,	0x07CB,	%g4
	xor	%i5,	%o1,	%g3
	srlx	%g6,	0x02,	%o0
	movcs	%icc,	%l3,	%g7
	edge32	%i6,	%i0,	%i3
	addccc	%l5,	0x1C8A,	%o4
	orncc	%o3,	0x0ECE,	%o2
	ldsb	[%l7 + 0x11],	%l1
	movne	%icc,	%g5,	%o5
	addc	%i2,	%g1,	%l4
	xnor	%l0,	0x1FFA,	%l2
	movneg	%icc,	%l6,	%g2
	orn	%i7,	0x0A01,	%i4
	fmovsvc	%xcc,	%f27,	%f19
	fpadd32	%f28,	%f30,	%f26
	xnorcc	%i1,	%o7,	%g4
	move	%xcc,	%o6,	%i5
	siam	0x6
	movrne	%g3,	0x0F3,	%o1
	smul	%o0,	%l3,	%g6
	udivx	%g7,	0x184F,	%i6
	ldx	[%l7 + 0x38],	%i0
	sth	%i3,	[%l7 + 0x38]
	umul	%o4,	%l5,	%o3
	edge16	%l1,	%o2,	%g5
	movrgez	%i2,	%g1,	%l4
	mova	%xcc,	%o5,	%l2
	fmuld8ulx16	%f0,	%f6,	%f22
	movg	%xcc,	%l0,	%g2
	movne	%xcc,	%l6,	%i4
	fmovd	%f18,	%f24
	fxors	%f25,	%f23,	%f8
	andcc	%i1,	0x04F8,	%o7
	sra	%i7,	0x01,	%g4
	orcc	%o6,	%i5,	%o1
	subccc	%o0,	0x0C8A,	%l3
	srl	%g3,	0x0C,	%g7
	ldub	[%l7 + 0x57],	%g6
	fpsub16	%f16,	%f20,	%f2
	ldx	[%l7 + 0x18],	%i6
	udivcc	%i3,	0x0572,	%i0
	fandnot2s	%f18,	%f19,	%f26
	sir	0x1281
	fnegd	%f28,	%f20
	srax	%l5,	0x03,	%o4
	movneg	%xcc,	%o3,	%l1
	addc	%o2,	%i2,	%g5
	movrne	%l4,	%o5,	%g1
	addcc	%l0,	0x09CB,	%l2
	movle	%icc,	%g2,	%l6
	xnorcc	%i4,	%o7,	%i1
	edge16	%i7,	%g4,	%i5
	sub	%o6,	%o0,	%o1
	movrne	%g3,	%l3,	%g6
	sethi	0x0DA5,	%i6
	movrgz	%g7,	0x142,	%i0
	fpmerge	%f8,	%f29,	%f24
	stx	%i3,	[%l7 + 0x50]
	xor	%l5,	0x0A66,	%o4
	lduw	[%l7 + 0x70],	%l1
	fmovscc	%icc,	%f25,	%f13
	edge16l	%o3,	%i2,	%o2
	movneg	%icc,	%g5,	%o5
	fcmpgt32	%f4,	%f24,	%l4
	andncc	%g1,	%l2,	%l0
	orcc	%l6,	0x0E7A,	%i4
	sub	%g2,	0x18C4,	%o7
	and	%i1,	%i7,	%g4
	movre	%i5,	0x3E8,	%o6
	sir	0x0501
	addcc	%o0,	%o1,	%l3
	sll	%g6,	%i6,	%g7
	stb	%g3,	[%l7 + 0x23]
	movne	%icc,	%i3,	%i0
	addccc	%l5,	%l1,	%o4
	ldd	[%l7 + 0x58],	%f18
	edge16ln	%o3,	%o2,	%g5
	fnegd	%f20,	%f28
	orncc	%i2,	%o5,	%g1
	edge32n	%l2,	%l0,	%l4
	ldub	[%l7 + 0x55],	%l6
	ldd	[%l7 + 0x78],	%f2
	fnegd	%f8,	%f0
	movrgez	%i4,	0x1FF,	%o7
	ldsw	[%l7 + 0x18],	%i1
	array8	%i7,	%g4,	%i5
	subccc	%g2,	%o0,	%o1
	fxnors	%f1,	%f17,	%f11
	subccc	%l3,	%o6,	%i6
	movvs	%icc,	%g7,	%g3
	fors	%f31,	%f29,	%f15
	addccc	%i3,	%g6,	%i0
	movvs	%xcc,	%l1,	%o4
	xorcc	%l5,	0x0283,	%o2
	xor	%o3,	0x01B6,	%g5
	stw	%i2,	[%l7 + 0x4C]
	sdiv	%g1,	0x0FC2,	%l2
	edge32l	%o5,	%l0,	%l4
	fnegd	%f4,	%f28
	sethi	0x1891,	%i4
	and	%l6,	0x0703,	%i1
	mulscc	%o7,	%g4,	%i7
	ld	[%l7 + 0x54],	%f1
	ldd	[%l7 + 0x40],	%f18
	movle	%icc,	%i5,	%o0
	edge32l	%o1,	%g2,	%l3
	edge32	%i6,	%o6,	%g3
	nop
	set	0x4E, %l0
	stb	%g7,	[%l7 + %l0]
	sdiv	%i3,	0x08E0,	%i0
	movge	%xcc,	%l1,	%o4
	fornot1	%f6,	%f24,	%f6
	stx	%l5,	[%l7 + 0x18]
	ld	[%l7 + 0x20],	%f31
	edge32ln	%o2,	%g6,	%o3
	edge16ln	%i2,	%g1,	%l2
	edge16l	%o5,	%l0,	%l4
	edge8	%g5,	%l6,	%i4
	stb	%o7,	[%l7 + 0x60]
	movl	%icc,	%g4,	%i7
	array16	%i1,	%o0,	%i5
	srlx	%o1,	%l3,	%g2
	sir	0x1E19
	edge16n	%o6,	%i6,	%g3
	fmovrsgz	%i3,	%f22,	%f28
	smulcc	%g7,	%l1,	%i0
	andncc	%l5,	%o4,	%o2
	sethi	0x1ABD,	%o3
	sllx	%g6,	%g1,	%l2
	movl	%icc,	%i2,	%l0
	fmovsn	%xcc,	%f1,	%f27
	or	%o5,	%l4,	%g5
	movleu	%icc,	%l6,	%i4
	sir	0x02E8
	nop
	set	0x08, %o2
	stw	%o7,	[%l7 + %o2]
	movgu	%icc,	%g4,	%i1
	udivcc	%o0,	0x0FF6,	%i5
	fmovrse	%i7,	%f10,	%f16
	fpsub32	%f28,	%f0,	%f24
	movneg	%xcc,	%l3,	%g2
	subc	%o6,	%o1,	%g3
	lduw	[%l7 + 0x68],	%i3
	fmovrsgz	%i6,	%f28,	%f30
	movrgez	%g7,	%i0,	%l5
	smul	%l1,	%o2,	%o3
	andn	%o4,	%g1,	%g6
	fsrc2s	%f15,	%f7
	fzeros	%f17
	popc	%i2,	%l2
	fnor	%f30,	%f30,	%f24
	fmovdvc	%icc,	%f25,	%f21
	edge8n	%o5,	%l4,	%l0
	movneg	%xcc,	%l6,	%i4
	edge8n	%g5,	%g4,	%o7
	fnot1s	%f3,	%f18
	bshuffle	%f16,	%f2,	%f10
	xor	%i1,	%o0,	%i5
	sllx	%l3,	0x14,	%i7
	fxors	%f24,	%f14,	%f29
	fmovrslez	%o6,	%f15,	%f7
	fsrc2	%f4,	%f12
	movl	%icc,	%o1,	%g3
	movg	%xcc,	%i3,	%g2
	fpadd32	%f2,	%f22,	%f18
	sdiv	%i6,	0x1F5F,	%i0
	ldd	[%l7 + 0x48],	%g6
	udiv	%l1,	0x0298,	%l5
	movpos	%icc,	%o3,	%o4
	ldsh	[%l7 + 0x36],	%o2
	fmovsge	%icc,	%f6,	%f9
	movrgz	%g6,	%g1,	%l2
	array16	%i2,	%l4,	%l0
	fmovdg	%xcc,	%f14,	%f23
	xnorcc	%l6,	%o5,	%g5
	fcmpne32	%f22,	%f20,	%g4
	fmovdneg	%xcc,	%f3,	%f26
	or	%i4,	0x19BF,	%o7
	sethi	0x1C81,	%o0
	fmovdg	%xcc,	%f3,	%f30
	std	%f16,	[%l7 + 0x38]
	movpos	%icc,	%i1,	%l3
	sir	0x00BC
	umulcc	%i5,	%o6,	%i7
	movvs	%icc,	%o1,	%i3
	movn	%xcc,	%g2,	%i6
	udivcc	%i0,	0x05E8,	%g7
	fnor	%f26,	%f30,	%f28
	st	%f3,	[%l7 + 0x64]
	addcc	%l1,	0x15A6,	%l5
	or	%o3,	%o4,	%o2
	ldd	[%l7 + 0x60],	%f0
	sir	0x1E6D
	save %g6, 0x1C35, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x28],	%l2
	movge	%xcc,	%g3,	%l4
	movl	%icc,	%i2,	%l6
	edge8l	%l0,	%g5,	%g4
	movrne	%i4,	%o7,	%o5
	movrne	%i1,	0x0FD,	%o0
	ldsb	[%l7 + 0x27],	%i5
	xorcc	%l3,	%o6,	%i7
	fandnot1s	%f20,	%f7,	%f6
	movcs	%xcc,	%o1,	%i3
	mova	%xcc,	%i6,	%i0
	save %g7, %l1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f4,	%f28,	%f14
	nop
	set	0x16, %i6
	sth	%l5,	[%l7 + %i6]
	andcc	%o4,	%o2,	%o3
	fmovdpos	%xcc,	%f7,	%f19
	movleu	%icc,	%g6,	%l2
	sdivcc	%g1,	0x1F32,	%l4
	ld	[%l7 + 0x7C],	%f16
	fcmps	%fcc3,	%f12,	%f27
	udivcc	%g3,	0x09D7,	%i2
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	xnor	%l0,	%o7,	%o5
	movrlez	%i4,	0x003,	%o0
	fmovsgu	%icc,	%f7,	%f5
	movge	%icc,	%i1,	%l3
	lduh	[%l7 + 0x62],	%i5
	edge16ln	%o6,	%i7,	%i3
	fmul8sux16	%f22,	%f26,	%f8
	move	%xcc,	%i6,	%o1
	movrgz	%i0,	%l1,	%g2
	umul	%l5,	%o4,	%o2
	fxnor	%f26,	%f10,	%f4
	srl	%g7,	%o3,	%g6
	lduw	[%l7 + 0x2C],	%l2
	and	%g1,	0x16FB,	%g3
	fmovde	%xcc,	%f10,	%f24
	addcc	%l4,	%l6,	%g5
	stb	%g4,	[%l7 + 0x2B]
	array8	%l0,	%o7,	%i2
	edge8	%i4,	%o5,	%i1
	st	%f16,	[%l7 + 0x64]
	subcc	%o0,	0x0CD1,	%l3
	mulx	%i5,	%i7,	%o6
	fcmpne16	%f26,	%f28,	%i6
	movre	%o1,	0x2BE,	%i0
	movl	%xcc,	%l1,	%i3
	smul	%g2,	0x0CA4,	%l5
	andcc	%o2,	0x0A16,	%g7
	srl	%o3,	%g6,	%l2
	subcc	%g1,	%g3,	%l4
	sdivx	%o4,	0x14C0,	%l6
	fmovdne	%xcc,	%f11,	%f12
	movrgez	%g5,	0x1F3,	%g4
	fmovdleu	%xcc,	%f29,	%f15
	edge8l	%l0,	%o7,	%i4
	orcc	%o5,	0x0F8D,	%i1
	fmovda	%icc,	%f31,	%f1
	fpadd32s	%f20,	%f8,	%f25
	udivcc	%i2,	0x194A,	%o0
	mulscc	%l3,	0x1890,	%i5
	movne	%icc,	%i7,	%o6
	restore %i6, %o1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f16,	%f10,	%f28
	sdiv	%i3,	0x1341,	%l1
	fmovdle	%icc,	%f4,	%f8
	movrgz	%l5,	0x35E,	%g2
	smul	%g7,	0x1E8A,	%o3
	edge32l	%g6,	%o2,	%g1
	movne	%xcc,	%l2,	%g3
	movvc	%icc,	%o4,	%l4
	smul	%g5,	0x1C0C,	%l6
	udivcc	%g4,	0x1377,	%o7
	movleu	%icc,	%i4,	%l0
	fmuld8ulx16	%f18,	%f3,	%f30
	fmovd	%f18,	%f12
	andcc	%o5,	%i1,	%i2
	movrlez	%l3,	0x147,	%o0
	fpack32	%f18,	%f0,	%f6
	movvs	%xcc,	%i7,	%i5
	edge16	%o6,	%o1,	%i0
	fnands	%f12,	%f10,	%f1
	xnor	%i6,	0x1E6D,	%l1
	sth	%i3,	[%l7 + 0x4C]
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	alignaddrl	%o3,	%g7,	%o2
	array32	%g6,	%g1,	%g3
	fmuld8sux16	%f24,	%f1,	%f0
	andcc	%l2,	0x0F0B,	%o4
	mulx	%g5,	0x0BE7,	%l4
	movle	%icc,	%l6,	%g4
	fsrc2s	%f19,	%f17
	fornot2	%f8,	%f28,	%f22
	fmovdl	%icc,	%f21,	%f25
	andncc	%o7,	%i4,	%l0
	movneg	%icc,	%i1,	%o5
	fmovdvs	%icc,	%f0,	%f2
	andcc	%l3,	%i2,	%o0
	umul	%i7,	0x11BB,	%o6
	array16	%o1,	%i5,	%i0
	edge32l	%l1,	%i6,	%g2
	sir	0x04F0
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%i3
	array32	%l5,	%g7,	%o3
	srl	%g6,	0x08,	%g1
	sdivx	%o2,	0x1E86,	%l2
	subcc	%g3,	%g5,	%o4
	sir	0x14B3
	movn	%icc,	%l6,	%l4
	ldsw	[%l7 + 0x78],	%g4
	sdivcc	%i4,	0x02C6,	%l0
	edge8	%o7,	%i1,	%l3
	fpadd32	%f6,	%f20,	%f4
	xor	%i2,	%o0,	%i7
	udivcc	%o5,	0x0EE5,	%o1
	movle	%xcc,	%o6,	%i5
	fmovsg	%icc,	%f17,	%f3
	movcc	%icc,	%i0,	%l1
	ld	[%l7 + 0x44],	%f17
	umul	%g2,	%i6,	%i3
	ldub	[%l7 + 0x43],	%g7
	xorcc	%l5,	0x0279,	%g6
	edge32n	%g1,	%o3,	%o2
	fmovdcs	%xcc,	%f0,	%f2
	sllx	%g3,	%l2,	%g5
	st	%f9,	[%l7 + 0x28]
	srl	%o4,	0x03,	%l6
	umul	%l4,	0x16E0,	%g4
	edge8	%i4,	%o7,	%l0
	orcc	%i1,	0x15EC,	%i2
	smul	%o0,	0x08EF,	%i7
	sub	%l3,	0x04A7,	%o5
	addc	%o1,	0x0AE2,	%i5
	fornot1	%f16,	%f16,	%f24
	movrlz	%o6,	0x06A,	%i0
	save %l1, 0x0A29, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i6,	%i3,	%l5
	movpos	%icc,	%g7,	%g1
	movrgz	%g6,	0x2B0,	%o2
	xor	%g3,	0x0E87,	%o3
	addccc	%l2,	%g5,	%o4
	srax	%l4,	0x1C,	%g4
	subccc	%l6,	%i4,	%l0
	edge16n	%o7,	%i1,	%i2
	lduh	[%l7 + 0x28],	%i7
	srl	%l3,	%o0,	%o1
	array32	%i5,	%o6,	%i0
	stx	%o5,	[%l7 + 0x18]
	edge8ln	%l1,	%g2,	%i6
	sethi	0x1D41,	%i3
	andcc	%l5,	%g7,	%g1
	fmovdne	%xcc,	%f25,	%f31
	stb	%o2,	[%l7 + 0x4A]
	sdiv	%g6,	0x084E,	%o3
	sub	%g3,	0x1F6D,	%l2
	srlx	%g5,	%o4,	%l4
	smul	%g4,	%l6,	%i4
	xnor	%o7,	%i1,	%l0
	edge16ln	%i7,	%l3,	%i2
	sll	%o1,	%i5,	%o6
	sra	%o0,	0x1D,	%i0
	movne	%xcc,	%l1,	%o5
	subcc	%i6,	0x0601,	%i3
	ldsh	[%l7 + 0x30],	%g2
	movle	%icc,	%g7,	%g1
	subcc	%l5,	0x0BA7,	%o2
	stw	%o3,	[%l7 + 0x3C]
	umulcc	%g3,	%g6,	%l2
	lduw	[%l7 + 0x30],	%g5
	orcc	%l4,	0x15AC,	%o4
	movleu	%xcc,	%l6,	%g4
	fmovdg	%xcc,	%f18,	%f25
	array16	%i4,	%i1,	%l0
	add	%o7,	0x157E,	%i7
	edge32n	%i2,	%l3,	%i5
	fnot2	%f14,	%f10
	fmovrdlz	%o1,	%f30,	%f28
	addcc	%o0,	0x1A46,	%i0
	srax	%l1,	%o6,	%i6
	movle	%xcc,	%i3,	%g2
	movcs	%xcc,	%g7,	%o5
	sllx	%g1,	0x1E,	%o2
	movg	%xcc,	%l5,	%o3
	ld	[%l7 + 0x38],	%f15
	smul	%g6,	0x0970,	%l2
	movrlez	%g5,	0x0A3,	%g3
	restore %o4, 0x1C8B, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f5,	%f28
	sdivx	%l6,	0x1AC7,	%i4
	addcc	%i1,	0x1569,	%l0
	umulcc	%g4,	%o7,	%i2
	fmovsa	%icc,	%f23,	%f12
	lduw	[%l7 + 0x20],	%l3
	movg	%icc,	%i5,	%o1
	orcc	%i7,	0x1272,	%o0
	fnors	%f17,	%f13,	%f28
	udivx	%l1,	0x09B5,	%i0
	and	%o6,	%i6,	%g2
	mulscc	%g7,	0x0692,	%o5
	fones	%f9
	popc	%i3,	%o2
	sra	%g1,	%l5,	%g6
	fxnors	%f1,	%f24,	%f2
	alignaddr	%l2,	%g5,	%o3
	movre	%o4,	%g3,	%l4
	movrgez	%i4,	0x3B6,	%i1
	movne	%icc,	%l0,	%g4
	nop
	set	0x18, %g2
	ldd	[%l7 + %g2],	%f2
	sllx	%o7,	%i2,	%l3
	subcc	%l6,	0x09CE,	%i5
	movvs	%icc,	%o1,	%o0
	edge32l	%i7,	%i0,	%l1
	stx	%o6,	[%l7 + 0x78]
	xnor	%i6,	%g7,	%o5
	movl	%xcc,	%g2,	%o2
	fcmpes	%fcc1,	%f22,	%f17
	edge8ln	%i3,	%g1,	%l5
	xnor	%g6,	0x184E,	%g5
	movleu	%icc,	%o3,	%o4
	ldsh	[%l7 + 0x50],	%g3
	umulcc	%l2,	0x0302,	%i4
	fpadd16s	%f25,	%f2,	%f0
	fmovspos	%xcc,	%f12,	%f17
	movrne	%i1,	%l4,	%l0
	ld	[%l7 + 0x30],	%f21
	fxors	%f9,	%f9,	%f24
	sdivcc	%g4,	0x0038,	%i2
	movn	%xcc,	%o7,	%l3
	fmovde	%xcc,	%f1,	%f22
	movcc	%xcc,	%l6,	%i5
	ldd	[%l7 + 0x10],	%o0
	fmuld8sux16	%f15,	%f29,	%f2
	movleu	%icc,	%o0,	%i0
	pdist	%f4,	%f14,	%f4
	sub	%l1,	%i7,	%i6
	movrgz	%g7,	0x311,	%o6
	popc	0x0947,	%o5
	fmovdleu	%icc,	%f3,	%f4
	movl	%xcc,	%o2,	%i3
	srl	%g1,	%g2,	%l5
	ld	[%l7 + 0x58],	%f29
	movl	%xcc,	%g5,	%g6
	array8	%o3,	%g3,	%l2
	edge8ln	%i4,	%o4,	%i1
	udiv	%l0,	0x0EE8,	%g4
	fcmpne16	%f6,	%f24,	%i2
	edge16ln	%o7,	%l4,	%l3
	edge16n	%l6,	%i5,	%o1
	ld	[%l7 + 0x24],	%f30
	array32	%i0,	%l1,	%o0
	fnor	%f30,	%f18,	%f6
	sra	%i7,	0x12,	%i6
	movvc	%xcc,	%g7,	%o6
	edge16ln	%o5,	%i3,	%o2
	movle	%icc,	%g1,	%l5
	fabss	%f30,	%f6
	subcc	%g2,	%g6,	%g5
	fzero	%f26
	movn	%xcc,	%g3,	%l2
	udivx	%i4,	0x1B20,	%o4
	andcc	%i1,	0x078C,	%o3
	movcs	%icc,	%l0,	%g4
	xnor	%o7,	%i2,	%l3
	fcmps	%fcc1,	%f2,	%f7
	fsrc2s	%f27,	%f16
	movcc	%icc,	%l4,	%i5
	movrgz	%l6,	0x077,	%o1
	movneg	%icc,	%i0,	%l1
	movrne	%i7,	%o0,	%g7
	fnand	%f16,	%f12,	%f0
	andncc	%o6,	%i6,	%o5
	edge8ln	%i3,	%g1,	%o2
	sth	%g2,	[%l7 + 0x68]
	save %g6, 0x1118, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f24,	%f16,	%f30
	edge8ln	%g3,	%g5,	%l2
	fmovsvs	%icc,	%f17,	%f1
	sth	%i4,	[%l7 + 0x42]
	xorcc	%i1,	0x0846,	%o3
	fcmple16	%f16,	%f16,	%l0
	addc	%o4,	0x1472,	%o7
	ldub	[%l7 + 0x0F],	%i2
	fmovsn	%xcc,	%f28,	%f19
	xorcc	%g4,	%l3,	%i5
	subccc	%l6,	0x0F2B,	%l4
	stx	%o1,	[%l7 + 0x08]
	movcs	%icc,	%i0,	%l1
	fcmpes	%fcc2,	%f21,	%f15
	movcs	%icc,	%i7,	%o0
	umul	%g7,	0x1ABB,	%o6
	movle	%xcc,	%o5,	%i6
	movgu	%icc,	%g1,	%o2
	stw	%i3,	[%l7 + 0x0C]
	fmovsne	%xcc,	%f24,	%f12
	umul	%g6,	0x01C4,	%l5
	stx	%g3,	[%l7 + 0x38]
	sdivx	%g2,	0x122B,	%g5
	fpadd32	%f6,	%f22,	%f14
	srl	%l2,	%i1,	%o3
	xnor	%i4,	%l0,	%o7
	sdivx	%i2,	0x1CA2,	%o4
	srax	%g4,	%i5,	%l3
	subcc	%l4,	%l6,	%i0
	fmovda	%icc,	%f7,	%f4
	ldub	[%l7 + 0x36],	%l1
	fmuld8sux16	%f14,	%f6,	%f20
	ldub	[%l7 + 0x6B],	%o1
	smul	%o0,	0x17E3,	%i7
	edge16l	%o6,	%o5,	%i6
	mulx	%g7,	%o2,	%i3
	umulcc	%g1,	%l5,	%g6
	alignaddr	%g2,	%g3,	%l2
	stx	%g5,	[%l7 + 0x28]
	fmovdl	%icc,	%f21,	%f25
	sdivcc	%o3,	0x1E0D,	%i4
	movleu	%xcc,	%l0,	%i1
	array32	%o7,	%o4,	%g4
	fpadd32	%f24,	%f0,	%f8
	alignaddrl	%i2,	%i5,	%l3
	stw	%l4,	[%l7 + 0x50]
	movn	%xcc,	%i0,	%l6
	edge32l	%l1,	%o1,	%o0
	fcmpne16	%f30,	%f20,	%o6
	fcmpgt32	%f0,	%f22,	%i7
	srl	%o5,	0x1C,	%i6
	sll	%o2,	0x08,	%g7
	lduh	[%l7 + 0x54],	%i3
	udiv	%l5,	0x0E77,	%g1
	fmovsge	%xcc,	%f27,	%f19
	fmovrde	%g2,	%f20,	%f26
	xorcc	%g3,	%g6,	%g5
	fors	%f18,	%f14,	%f18
	fzeros	%f1
	move	%icc,	%l2,	%o3
	subccc	%i4,	%i1,	%l0
	st	%f15,	[%l7 + 0x14]
	fpadd32s	%f8,	%f15,	%f3
	edge32n	%o4,	%o7,	%g4
	stw	%i2,	[%l7 + 0x78]
	sll	%l3,	%l4,	%i5
	udivcc	%i0,	0x070B,	%l6
	fcmple32	%f14,	%f10,	%o1
	srl	%o0,	0x0E,	%l1
	array32	%o6,	%i7,	%i6
	edge16	%o2,	%o5,	%g7
	subcc	%l5,	0x11EF,	%i3
	fcmpeq16	%f4,	%f20,	%g1
	xorcc	%g3,	%g6,	%g5
	movgu	%xcc,	%g2,	%l2
	movneg	%icc,	%i4,	%o3
	fmovs	%f28,	%f30
	sth	%l0,	[%l7 + 0x08]
	andn	%o4,	0x018D,	%i1
	fcmpeq32	%f18,	%f20,	%o7
	mulx	%i2,	0x1EDB,	%g4
	ldx	[%l7 + 0x30],	%l3
	movgu	%xcc,	%l4,	%i5
	move	%xcc,	%i0,	%l6
	fmovdneg	%icc,	%f27,	%f13
	xnor	%o1,	%o0,	%o6
	mova	%xcc,	%i7,	%i6
	fsrc2	%f4,	%f24
	array32	%o2,	%l1,	%o5
	edge32ln	%l5,	%g7,	%g1
	fpsub32s	%f31,	%f27,	%f23
	subc	%g3,	%i3,	%g5
	edge32ln	%g6,	%l2,	%g2
	sllx	%i4,	0x17,	%o3
	fornot2s	%f19,	%f24,	%f2
	xnorcc	%l0,	%i1,	%o4
	edge16	%i2,	%g4,	%l3
	sdivcc	%l4,	0x102F,	%i5
	fandnot1	%f26,	%f22,	%f20
	edge16	%o7,	%l6,	%o1
	subccc	%i0,	%o0,	%o6
	or	%i7,	%i6,	%l1
	fsrc1	%f16,	%f22
	movrlez	%o2,	%l5,	%o5
	edge32	%g7,	%g3,	%i3
	array32	%g1,	%g6,	%g5
	bshuffle	%f0,	%f30,	%f16
	edge32l	%g2,	%l2,	%i4
	sdivx	%o3,	0x02E1,	%i1
	stx	%l0,	[%l7 + 0x08]
	movle	%xcc,	%i2,	%o4
	udivcc	%l3,	0x0FB0,	%l4
	ldsh	[%l7 + 0x56],	%i5
	umul	%g4,	0x1BF7,	%o7
	mova	%xcc,	%o1,	%l6
	mulx	%i0,	%o0,	%i7
	fornot1	%f6,	%f20,	%f2
	alignaddrl	%o6,	%i6,	%l1
	fmovdg	%xcc,	%f30,	%f6
	movl	%xcc,	%o2,	%o5
	sdivx	%l5,	0x1C09,	%g7
	stx	%g3,	[%l7 + 0x08]
	addc	%i3,	%g6,	%g5
	array8	%g2,	%g1,	%l2
	umulcc	%o3,	%i4,	%l0
	edge16ln	%i2,	%o4,	%i1
	ldd	[%l7 + 0x08],	%l2
	umul	%l4,	0x1A7A,	%i5
	subc	%g4,	%o7,	%o1
	smul	%l6,	%o0,	%i7
	array32	%o6,	%i0,	%i6
	subc	%l1,	%o5,	%l5
	fcmpne16	%f6,	%f16,	%g7
	movre	%o2,	0x2DA,	%g3
	movgu	%xcc,	%i3,	%g6
	fpadd32s	%f19,	%f7,	%f14
	fmovs	%f30,	%f3
	xor	%g2,	%g5,	%g1
	andncc	%l2,	%i4,	%o3
	fnegs	%f20,	%f13
	movgu	%icc,	%l0,	%o4
	udiv	%i2,	0x0E86,	%i1
	sth	%l4,	[%l7 + 0x6E]
	sub	%l3,	0x0BEE,	%g4
	xnor	%i5,	0x128D,	%o1
	xorcc	%o7,	%o0,	%i7
	fornot2	%f6,	%f18,	%f10
	st	%f30,	[%l7 + 0x50]
	fsrc2s	%f27,	%f10
	movneg	%icc,	%o6,	%i0
	sra	%l6,	%i6,	%o5
	udivcc	%l5,	0x1CE2,	%l1
	srl	%o2,	0x17,	%g3
	fmul8x16au	%f11,	%f15,	%f16
	movrgez	%i3,	%g6,	%g7
	andn	%g2,	0x190D,	%g1
	popc	0x03D5,	%g5
	udivcc	%i4,	0x0CBE,	%o3
	lduw	[%l7 + 0x64],	%l0
	ldd	[%l7 + 0x48],	%o4
	movneg	%icc,	%l2,	%i1
	fmovsle	%icc,	%f10,	%f12
	and	%l4,	%l3,	%g4
	movneg	%xcc,	%i5,	%i2
	mulscc	%o7,	%o0,	%o1
	fmovdg	%xcc,	%f30,	%f27
	ldsh	[%l7 + 0x24],	%o6
	edge32	%i0,	%l6,	%i7
	edge16l	%o5,	%l5,	%i6
	movre	%o2,	0x29E,	%g3
	stb	%i3,	[%l7 + 0x56]
	orn	%g6,	%g7,	%l1
	movgu	%icc,	%g2,	%g5
	edge16n	%g1,	%i4,	%o3
	ldx	[%l7 + 0x48],	%l0
	add	%l2,	%i1,	%o4
	xnor	%l4,	0x18C0,	%l3
	fmovrdgz	%g4,	%f18,	%f24
	fmovdl	%icc,	%f25,	%f17
	fsrc2s	%f19,	%f26
	mulscc	%i5,	0x1F01,	%o7
	ldsh	[%l7 + 0x26],	%i2
	fmovd	%f18,	%f4
	fcmped	%fcc2,	%f6,	%f22
	movneg	%icc,	%o1,	%o6
	ldsh	[%l7 + 0x56],	%o0
	movcs	%icc,	%i0,	%i7
	array16	%o5,	%l5,	%l6
	xnor	%i6,	0x112A,	%g3
	fmul8x16	%f21,	%f2,	%f30
	movge	%xcc,	%o2,	%i3
	ldsh	[%l7 + 0x66],	%g6
	fsrc2s	%f23,	%f5
	sllx	%g7,	%l1,	%g5
	fpadd32	%f2,	%f8,	%f14
	ldsb	[%l7 + 0x0D],	%g1
	stw	%g2,	[%l7 + 0x60]
	addcc	%i4,	%l0,	%o3
	movrlz	%i1,	%l2,	%o4
	udivx	%l4,	0x0C1F,	%g4
	addccc	%l3,	0x17FF,	%o7
	fornot2	%f18,	%f22,	%f30
	movvc	%icc,	%i2,	%o1
	subc	%i5,	%o0,	%o6
	array16	%i0,	%i7,	%l5
	edge32l	%l6,	%o5,	%i6
	umulcc	%g3,	0x00EF,	%o2
	movre	%g6,	%g7,	%l1
	movvs	%icc,	%g5,	%i3
	andcc	%g2,	0x0B06,	%g1
	movg	%xcc,	%l0,	%o3
	subcc	%i4,	%i1,	%l2
	sth	%l4,	[%l7 + 0x3C]
	orncc	%o4,	%g4,	%l3
	andcc	%o7,	%o1,	%i2
	andcc	%i5,	%o0,	%i0
	edge8l	%o6,	%l5,	%i7
	sdivx	%o5,	0x1369,	%l6
	udivcc	%i6,	0x1364,	%o2
	edge8	%g3,	%g7,	%g6
	save %l1, 0x1400, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g5,	[%l7 + 0x28]
	move	%xcc,	%g1,	%l0
	fnor	%f26,	%f2,	%f8
	fcmple16	%f22,	%f2,	%o3
	movleu	%icc,	%g2,	%i4
	movle	%icc,	%l2,	%i1
	movle	%xcc,	%o4,	%g4
	movrgz	%l4,	0x1DA,	%o7
	fandnot1s	%f20,	%f1,	%f31
	movvc	%xcc,	%l3,	%i2
	alignaddr	%i5,	%o0,	%i0
	edge16l	%o6,	%o1,	%i7
	edge16ln	%o5,	%l6,	%l5
	fnot1s	%f21,	%f20
	lduw	[%l7 + 0x74],	%o2
	add	%i6,	%g7,	%g3
	ldsh	[%l7 + 0x58],	%g6
	sethi	0x010F,	%l1
	fmovsneg	%icc,	%f8,	%f8
	fandnot1	%f0,	%f28,	%f4
	andcc	%i3,	0x0CC8,	%g1
	alignaddrl	%g5,	%o3,	%l0
	edge16l	%i4,	%g2,	%l2
	andncc	%i1,	%g4,	%o4
	addc	%l4,	0x1738,	%o7
	xnor	%l3,	%i2,	%o0
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	andn	%o1,	0x191C,	%o6
	array16	%i7,	%o5,	%l5
	fmovscs	%icc,	%f3,	%f26
	edge16l	%l6,	%i6,	%g7
	movneg	%icc,	%o2,	%g3
	addc	%g6,	%i3,	%g1
	edge32n	%l1,	%g5,	%o3
	fexpand	%f5,	%f28
	srax	%i4,	0x0F,	%l0
	stx	%g2,	[%l7 + 0x10]
	edge32n	%i1,	%l2,	%o4
	or	%l4,	0x08F0,	%o7
	sethi	0x1A12,	%l3
	edge16l	%i2,	%o0,	%g4
	sdivcc	%i5,	0x16F9,	%o1
	ldub	[%l7 + 0x4A],	%o6
	udivx	%i7,	0x04B6,	%o5
	ldub	[%l7 + 0x35],	%l5
	lduh	[%l7 + 0x64],	%i0
	fandnot2s	%f9,	%f3,	%f31
	fpsub16	%f28,	%f24,	%f4
	movneg	%icc,	%i6,	%g7
	st	%f9,	[%l7 + 0x1C]
	orncc	%o2,	%l6,	%g3
	smulcc	%i3,	%g1,	%l1
	xnorcc	%g5,	%o3,	%g6
	sub	%i4,	%g2,	%l0
	fornot1	%f10,	%f2,	%f30
	orcc	%l2,	%i1,	%o4
	fxor	%f6,	%f16,	%f20
	save %l4, 0x0977, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x58, %i0
	stw	%o7,	[%l7 + %i0]
	ldx	[%l7 + 0x18],	%o0
	fpsub16s	%f7,	%f13,	%f31
	alignaddr	%i2,	%g4,	%o1
	fzeros	%f21
	st	%f30,	[%l7 + 0x34]
	fpadd16	%f18,	%f4,	%f10
	nop
	set	0x7C, %l6
	stw	%i5,	[%l7 + %l6]
	edge8	%o6,	%o5,	%i7
	fornot1	%f14,	%f26,	%f14
	fpsub32	%f4,	%f12,	%f26
	nop
	set	0x52, %i4
	sth	%i0,	[%l7 + %i4]
	umul	%l5,	0x12A1,	%i6
	ldd	[%l7 + 0x50],	%f12
	ldd	[%l7 + 0x50],	%f8
	fmovdgu	%xcc,	%f28,	%f27
	xnor	%o2,	%g7,	%g3
	alignaddrl	%i3,	%l6,	%l1
	movg	%icc,	%g1,	%g5
	udivcc	%o3,	0x06F9,	%g6
	sra	%i4,	0x06,	%l0
	fmul8x16	%f7,	%f24,	%f16
	orcc	%l2,	0x0A2D,	%g2
	movle	%xcc,	%o4,	%i1
	fmovrslz	%l4,	%f17,	%f19
	movn	%xcc,	%l3,	%o7
	andcc	%o0,	%g4,	%i2
	sth	%o1,	[%l7 + 0x60]
	fcmple32	%f18,	%f20,	%o6
	sra	%o5,	0x12,	%i7
	movvs	%xcc,	%i0,	%l5
	movvc	%xcc,	%i6,	%o2
	alignaddr	%i5,	%g3,	%g7
	smulcc	%i3,	%l1,	%g1
	lduw	[%l7 + 0x18],	%l6
	sth	%g5,	[%l7 + 0x08]
	fmovdle	%xcc,	%f9,	%f19
	fabss	%f27,	%f21
	sra	%g6,	%i4,	%l0
	fnor	%f24,	%f28,	%f16
	andncc	%o3,	%l2,	%g2
	andcc	%i1,	0x0317,	%o4
	stb	%l3,	[%l7 + 0x6B]
	umul	%l4,	0x0A69,	%o0
	mulscc	%g4,	%i2,	%o1
	edge32n	%o6,	%o5,	%i7
	movn	%xcc,	%i0,	%l5
	ld	[%l7 + 0x20],	%f14
	fone	%f30
	movge	%xcc,	%i6,	%o2
	array8	%i5,	%o7,	%g7
	andncc	%g3,	%i3,	%l1
	fnor	%f28,	%f12,	%f10
	edge16l	%l6,	%g1,	%g6
	movre	%g5,	%i4,	%o3
	umul	%l2,	%g2,	%i1
	movrlez	%l0,	%l3,	%l4
	smul	%o4,	0x17A8,	%o0
	edge16ln	%g4,	%i2,	%o6
	xor	%o1,	0x0AC1,	%i7
	sir	0x1EFF
	fcmple32	%f24,	%f6,	%i0
	fpadd16s	%f16,	%f6,	%f5
	alignaddrl	%l5,	%i6,	%o2
	st	%f11,	[%l7 + 0x3C]
	edge32n	%i5,	%o7,	%o5
	addc	%g7,	%i3,	%g3
	sdivcc	%l6,	0x127A,	%l1
	fcmpne16	%f16,	%f26,	%g6
	std	%f14,	[%l7 + 0x40]
	udivcc	%g5,	0x072F,	%g1
	alignaddrl	%i4,	%l2,	%o3
	restore %g2, %l0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f17,	%f28
	fmul8x16au	%f14,	%f13,	%f10
	xor	%i1,	0x1336,	%l4
	st	%f18,	[%l7 + 0x60]
	ldsw	[%l7 + 0x38],	%o4
	movn	%icc,	%g4,	%i2
	movleu	%icc,	%o6,	%o0
	fmovspos	%xcc,	%f30,	%f11
	edge32l	%i7,	%o1,	%l5
	subc	%i6,	%i0,	%o2
	fpadd16	%f16,	%f4,	%f2
	subccc	%i5,	0x03B1,	%o7
	ld	[%l7 + 0x3C],	%f20
	edge32n	%g7,	%i3,	%o5
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	orncc	%g5,	%g1,	%l1
	orncc	%l2,	0x1D97,	%o3
	alignaddrl	%i4,	%l0,	%g2
	array8	%l3,	%l4,	%o4
	fmovdle	%icc,	%f16,	%f9
	lduw	[%l7 + 0x14],	%g4
	add	%i1,	%i2,	%o0
	movrgz	%o6,	0x207,	%i7
	subcc	%l5,	%i6,	%i0
	stb	%o1,	[%l7 + 0x1B]
	save %i5, 0x0A95, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g7,	%o7
	xor	%i3,	0x00CB,	%o5
	xnorcc	%g3,	0x1F0D,	%l6
	edge16	%g5,	%g1,	%g6
	subcc	%l1,	%l2,	%o3
	fmovrdne	%l0,	%f6,	%f22
	and	%i4,	0x0C19,	%g2
	edge32l	%l4,	%l3,	%g4
	sllx	%o4,	%i2,	%o0
	fands	%f31,	%f13,	%f27
	array16	%i1,	%i7,	%l5
	stx	%o6,	[%l7 + 0x58]
	edge16l	%i0,	%i6,	%i5
	fcmple16	%f16,	%f16,	%o1
	ld	[%l7 + 0x7C],	%f5
	udivcc	%g7,	0x090B,	%o2
	subccc	%o7,	0x1235,	%i3
	sdivx	%o5,	0x137C,	%l6
	edge8n	%g5,	%g1,	%g6
	ldx	[%l7 + 0x40],	%g3
	fmovsn	%xcc,	%f8,	%f17
	sdivcc	%l1,	0x1362,	%o3
	ldd	[%l7 + 0x40],	%l2
	sllx	%i4,	0x19,	%g2
	fcmple16	%f20,	%f4,	%l0
	and	%l4,	%g4,	%o4
	umulcc	%l3,	0x0174,	%o0
	edge8ln	%i2,	%i7,	%i1
	fmovdvc	%icc,	%f24,	%f21
	fmovs	%f14,	%f4
	fpmerge	%f17,	%f15,	%f30
	edge32	%l5,	%i0,	%i6
	fsrc1	%f22,	%f18
	mulscc	%i5,	0x0C2A,	%o1
	fpack32	%f4,	%f6,	%f10
	movpos	%icc,	%g7,	%o6
	orcc	%o2,	%i3,	%o7
	addc	%o5,	%g5,	%l6
	edge16l	%g1,	%g6,	%g3
	ldub	[%l7 + 0x3B],	%l1
	fmovscs	%xcc,	%f21,	%f9
	movl	%icc,	%o3,	%l2
	fmovscs	%xcc,	%f30,	%f6
	movrlz	%i4,	0x1EA,	%g2
	movleu	%xcc,	%l4,	%g4
	fmovdn	%xcc,	%f29,	%f0
	ldx	[%l7 + 0x20],	%o4
	andncc	%l3,	%l0,	%o0
	movpos	%xcc,	%i2,	%i7
	sdivx	%i1,	0x1BAD,	%i0
	sdivx	%i6,	0x12FD,	%i5
	movcs	%icc,	%l5,	%o1
	orcc	%g7,	0x181F,	%o2
	std	%f28,	[%l7 + 0x18]
	sethi	0x0B26,	%i3
	subc	%o7,	%o6,	%g5
	nop
	set	0x78, %o5
	ldx	[%l7 + %o5],	%l6
	udiv	%g1,	0x1769,	%g6
	fmovdvc	%icc,	%f22,	%f1
	addcc	%g3,	0x16A4,	%o5
	fmovsge	%icc,	%f19,	%f3
	ldd	[%l7 + 0x18],	%o2
	move	%xcc,	%l1,	%i4
	fmovda	%xcc,	%f9,	%f30
	edge32l	%l2,	%g2,	%l4
	movcc	%xcc,	%o4,	%l3
	udivcc	%l0,	0x13D0,	%o0
	mova	%xcc,	%g4,	%i7
	sdivcc	%i2,	0x000D,	%i1
	orn	%i0,	%i5,	%i6
	ldsb	[%l7 + 0x22],	%o1
	movvc	%xcc,	%g7,	%o2
	andncc	%l5,	%i3,	%o6
	ldub	[%l7 + 0x23],	%g5
	movrgez	%o7,	0x1BA,	%g1
	fands	%f15,	%f16,	%f25
	fcmps	%fcc3,	%f2,	%f10
	fmovsle	%xcc,	%f17,	%f8
	movrlez	%l6,	0x035,	%g3
	edge8ln	%g6,	%o5,	%o3
	restore %l1, 0x0054, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g2,	%i4
	smul	%o4,	0x036E,	%l4
	xorcc	%l0,	%o0,	%g4
	movvc	%icc,	%l3,	%i7
	edge8ln	%i1,	%i0,	%i5
	ldsh	[%l7 + 0x48],	%i6
	andcc	%i2,	%o1,	%g7
	subc	%l5,	0x0E8E,	%i3
	mulx	%o6,	%g5,	%o2
	smulcc	%g1,	%o7,	%l6
	movne	%xcc,	%g6,	%o5
	mova	%icc,	%o3,	%l1
	and	%l2,	0x14FB,	%g3
	movrne	%g2,	%i4,	%l4
	addc	%o4,	%l0,	%g4
	mulx	%o0,	0x150E,	%l3
	subc	%i7,	0x0CCC,	%i1
	fzeros	%f0
	fmovsvs	%icc,	%f14,	%f20
	sdivcc	%i5,	0x1388,	%i6
	umul	%i0,	%i2,	%g7
	movrlz	%l5,	%o1,	%i3
	andcc	%o6,	%g5,	%o2
	mulx	%g1,	0x09A5,	%o7
	srax	%l6,	%g6,	%o5
	ldd	[%l7 + 0x28],	%o2
	movrne	%l1,	0x322,	%g3
	fnegd	%f10,	%f20
	movn	%xcc,	%l2,	%g2
	andcc	%i4,	%o4,	%l4
	sth	%l0,	[%l7 + 0x44]
	sll	%o0,	0x1C,	%g4
	ldsw	[%l7 + 0x70],	%l3
	xnor	%i1,	0x0716,	%i5
	movgu	%xcc,	%i7,	%i0
	fandnot1	%f6,	%f30,	%f26
	srlx	%i2,	%g7,	%l5
	sll	%o1,	0x0B,	%i6
	mulx	%i3,	0x191E,	%g5
	movvc	%icc,	%o6,	%o2
	movneg	%icc,	%o7,	%l6
	ldd	[%l7 + 0x78],	%g0
	move	%icc,	%o5,	%o3
	subc	%g6,	%l1,	%g3
	xorcc	%l2,	%g2,	%i4
	fnor	%f28,	%f2,	%f0
	subc	%l4,	0x07AB,	%o4
	and	%l0,	0x113C,	%g4
	edge32ln	%o0,	%l3,	%i5
	edge32ln	%i1,	%i7,	%i2
	andcc	%g7,	%l5,	%o1
	movrgez	%i6,	0x145,	%i3
	sra	%g5,	%o6,	%i0
	subcc	%o2,	%l6,	%o7
	udiv	%o5,	0x037C,	%g1
	movge	%icc,	%g6,	%o3
	movl	%xcc,	%g3,	%l1
	move	%icc,	%g2,	%l2
	movvs	%icc,	%i4,	%l4
	nop
	set	0x14, %o6
	ldsw	[%l7 + %o6],	%l0
	fpadd32	%f18,	%f24,	%f22
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%o4
	sra	%o0,	%g4,	%i5
	alignaddr	%i1,	%i7,	%i2
	st	%f16,	[%l7 + 0x60]
	fcmpgt16	%f18,	%f8,	%g7
	movleu	%xcc,	%l3,	%o1
	fmovscc	%xcc,	%f17,	%f17
	fmovdgu	%xcc,	%f24,	%f26
	ld	[%l7 + 0x0C],	%f27
	xnorcc	%l5,	%i6,	%i3
	fnand	%f6,	%f2,	%f18
	fornot2s	%f10,	%f8,	%f16
	ldub	[%l7 + 0x6F],	%o6
	smulcc	%i0,	0x12ED,	%g5
	fmovdn	%xcc,	%f2,	%f10
	sdivcc	%l6,	0x071E,	%o2
	movleu	%xcc,	%o5,	%o7
	fexpand	%f2,	%f6
	edge16ln	%g6,	%o3,	%g3
	edge8l	%g1,	%l1,	%l2
	stb	%i4,	[%l7 + 0x59]
	edge16ln	%g2,	%l4,	%o4
	sir	0x09DE
	andn	%l0,	0x1152,	%g4
	add	%i5,	0x0D2A,	%i1
	xnor	%i7,	%i2,	%g7
	nop
	set	0x56, %l1
	lduh	[%l7 + %l1],	%o0
	edge8	%o1,	%l3,	%i6
	umulcc	%i3,	0x0B86,	%o6
	fpmerge	%f6,	%f7,	%f30
	sdivx	%l5,	0x1DA1,	%g5
	sll	%i0,	%l6,	%o5
	fmul8x16al	%f9,	%f31,	%f10
	movn	%xcc,	%o2,	%g6
	fnegd	%f8,	%f24
	fmovscs	%xcc,	%f6,	%f4
	fmovsa	%xcc,	%f4,	%f15
	fmovdgu	%xcc,	%f14,	%f3
	fmovsvc	%xcc,	%f22,	%f28
	fpsub16s	%f2,	%f2,	%f30
	movcs	%icc,	%o3,	%g3
	movneg	%icc,	%o7,	%l1
	movcs	%xcc,	%g1,	%i4
	fpmerge	%f30,	%f30,	%f20
	pdist	%f20,	%f8,	%f4
	edge8	%l2,	%g2,	%l4
	alignaddrl	%l0,	%o4,	%i5
	fandnot2s	%f20,	%f19,	%f20
	movleu	%icc,	%i1,	%i7
	and	%i2,	%g4,	%g7
	fmuld8sux16	%f26,	%f8,	%f28
	sdivx	%o1,	0x0919,	%l3
	udivx	%i6,	0x1D5D,	%i3
	ldd	[%l7 + 0x68],	%f10
	edge8	%o6,	%l5,	%o0
	udiv	%i0,	0x16B9,	%l6
	edge32n	%o5,	%o2,	%g5
	movneg	%xcc,	%g6,	%g3
	smul	%o3,	0x111F,	%o7
	movpos	%icc,	%l1,	%g1
	array32	%i4,	%l2,	%l4
	st	%f11,	[%l7 + 0x34]
	udivcc	%l0,	0x122A,	%o4
	edge8l	%g2,	%i5,	%i7
	fmovsvc	%icc,	%f24,	%f1
	movcs	%xcc,	%i2,	%i1
	movrgz	%g4,	0x330,	%g7
	udivcc	%o1,	0x150E,	%l3
	and	%i6,	0x1AB9,	%o6
	edge8l	%i3,	%o0,	%i0
	subcc	%l5,	%l6,	%o5
	fcmpeq16	%f28,	%f14,	%g5
	movn	%xcc,	%o2,	%g6
	movcc	%xcc,	%g3,	%o7
	sdiv	%o3,	0x1418,	%l1
	fpadd32	%f0,	%f22,	%f14
	alignaddr	%g1,	%i4,	%l2
	ldsb	[%l7 + 0x75],	%l0
	movne	%xcc,	%o4,	%l4
	lduh	[%l7 + 0x2E],	%i5
	mulscc	%g2,	%i7,	%i2
	xorcc	%i1,	%g7,	%g4
	edge8l	%o1,	%l3,	%i6
	ldsw	[%l7 + 0x1C],	%i3
	edge16l	%o0,	%i0,	%o6
	movre	%l5,	0x09F,	%l6
	fmovda	%icc,	%f10,	%f30
	sdivx	%o5,	0x0ECD,	%o2
	mova	%icc,	%g6,	%g3
	array16	%g5,	%o3,	%o7
	fsrc1s	%f26,	%f10
	addcc	%g1,	0x12D8,	%l1
	fexpand	%f9,	%f6
	fmovdn	%xcc,	%f13,	%f12
	subccc	%i4,	%l2,	%l0
	edge32l	%o4,	%i5,	%l4
	udivcc	%i7,	0x136C,	%g2
	addccc	%i2,	%i1,	%g4
	fmovscc	%xcc,	%f3,	%f14
	movvc	%icc,	%o1,	%g7
	smulcc	%i6,	%l3,	%i3
	edge8ln	%i0,	%o6,	%o0
	smul	%l5,	0x1BB9,	%l6
	addcc	%o2,	0x1677,	%o5
	fmovda	%icc,	%f25,	%f7
	andn	%g6,	%g3,	%g5
	or	%o7,	%o3,	%g1
	sdivx	%l1,	0x07AA,	%l2
	srlx	%i4,	0x0A,	%l0
	fnor	%f2,	%f16,	%f28
	ldsb	[%l7 + 0x3D],	%o4
	std	%f22,	[%l7 + 0x28]
	or	%i5,	%i7,	%l4
	movneg	%icc,	%g2,	%i1
	edge8	%i2,	%o1,	%g7
	movrlz	%g4,	0x399,	%i6
	ldx	[%l7 + 0x18],	%i3
	edge16n	%l3,	%i0,	%o6
	edge32	%l5,	%o0,	%l6
	ldsb	[%l7 + 0x16],	%o2
	movrlez	%o5,	0x0BB,	%g6
	sub	%g5,	%o7,	%g3
	movcc	%icc,	%o3,	%l1
	fmovd	%f14,	%f16
	sir	0x0357
	sra	%l2,	%g1,	%i4
	edge8n	%o4,	%l0,	%i5
	movn	%xcc,	%l4,	%i7
	srax	%g2,	0x16,	%i2
	xor	%i1,	%g7,	%g4
	stw	%o1,	[%l7 + 0x40]
	array32	%i3,	%l3,	%i6
	movgu	%xcc,	%i0,	%l5
	mova	%icc,	%o0,	%l6
	fmovrdlz	%o6,	%f14,	%f6
	ldsh	[%l7 + 0x6E],	%o5
	edge32ln	%g6,	%g5,	%o2
	movrne	%g3,	0x2A1,	%o3
	sir	0x1502
	mulx	%l1,	0x1735,	%l2
	ldsw	[%l7 + 0x2C],	%g1
	ldd	[%l7 + 0x48],	%i4
	st	%f18,	[%l7 + 0x3C]
	alignaddr	%o4,	%o7,	%i5
	edge32	%l4,	%i7,	%l0
	stb	%g2,	[%l7 + 0x68]
	array8	%i2,	%g7,	%i1
	sdivx	%o1,	0x0B97,	%i3
	subccc	%l3,	0x0228,	%g4
	edge16n	%i6,	%i0,	%o0
	xnorcc	%l5,	%l6,	%o6
	umulcc	%g6,	%o5,	%g5
	fsrc1	%f26,	%f6
	movne	%icc,	%o2,	%g3
	fmovdgu	%xcc,	%f6,	%f4
	fmovrslz	%o3,	%f31,	%f3
	sir	0x0AAA
	nop
	set	0x7E, %o1
	stb	%l2,	[%l7 + %o1]
	alignaddr	%l1,	%g1,	%i4
	edge8	%o4,	%i5,	%o7
	move	%icc,	%l4,	%l0
	st	%f11,	[%l7 + 0x5C]
	fandnot1	%f24,	%f12,	%f6
	fmovdle	%icc,	%f23,	%f7
	fone	%f6
	ldsh	[%l7 + 0x70],	%i7
	sth	%i2,	[%l7 + 0x2C]
	xorcc	%g2,	0x0FAB,	%i1
	addc	%g7,	%o1,	%l3
	addcc	%g4,	0x1A28,	%i3
	movl	%icc,	%i6,	%i0
	alignaddr	%l5,	%l6,	%o0
	sdivx	%o6,	0x138A,	%o5
	edge32l	%g6,	%g5,	%o2
	ldsw	[%l7 + 0x3C],	%o3
	array16	%g3,	%l1,	%g1
	smul	%i4,	%l2,	%o4
	popc	%i5,	%l4
	fmovdne	%icc,	%f3,	%f4
	sethi	0x0CF8,	%o7
	movgu	%xcc,	%i7,	%i2
	movrlez	%g2,	0x1DE,	%l0
	fmovsne	%xcc,	%f30,	%f2
	edge8l	%g7,	%o1,	%l3
	subc	%i1,	0x12AE,	%g4
	movvs	%icc,	%i3,	%i0
	ldub	[%l7 + 0x31],	%l5
	fnegd	%f26,	%f18
	ldd	[%l7 + 0x30],	%i6
	sub	%o0,	%l6,	%o6
	smulcc	%o5,	0x0071,	%g6
	movpos	%icc,	%o2,	%o3
	srl	%g5,	%g3,	%l1
	sth	%i4,	[%l7 + 0x24]
	sll	%g1,	0x1B,	%o4
	edge32n	%i5,	%l4,	%o7
	xnor	%i7,	%i2,	%l2
	sllx	%l0,	0x09,	%g2
	stb	%o1,	[%l7 + 0x7A]
	move	%icc,	%l3,	%i1
	fmovdg	%xcc,	%f25,	%f4
	edge8n	%g7,	%g4,	%i3
	srax	%i0,	0x1F,	%l5
	subccc	%i6,	0x136B,	%l6
	srl	%o6,	0x00,	%o5
	fcmple16	%f4,	%f10,	%g6
	fcmps	%fcc1,	%f25,	%f18
	edge32ln	%o0,	%o3,	%g5
	sdivx	%o2,	0x1142,	%l1
	array8	%g3,	%i4,	%g1
	movge	%icc,	%o4,	%l4
	mova	%icc,	%o7,	%i7
	movl	%xcc,	%i5,	%l2
	orn	%l0,	0x1E29,	%i2
	edge32	%o1,	%l3,	%i1
	fcmps	%fcc1,	%f30,	%f15
	movg	%xcc,	%g7,	%g4
	fpadd16	%f12,	%f24,	%f10
	sllx	%i3,	%i0,	%g2
	edge16l	%l5,	%i6,	%o6
	movcs	%xcc,	%o5,	%g6
	edge32	%o0,	%l6,	%g5
	array16	%o3,	%o2,	%g3
	stb	%l1,	[%l7 + 0x1F]
	edge32n	%g1,	%i4,	%l4
	fnegs	%f24,	%f11
	xnor	%o7,	0x0618,	%o4
	popc	%i5,	%i7
	movrlez	%l2,	0x224,	%l0
	mulx	%o1,	%l3,	%i2
	subc	%i1,	%g4,	%i3
	movcs	%xcc,	%g7,	%g2
	fsrc1	%f30,	%f26
	orncc	%i0,	0x18ED,	%i6
	movg	%xcc,	%l5,	%o6
	udiv	%o5,	0x0DBA,	%o0
	sir	0x0ADA
	array16	%g6,	%g5,	%l6
	faligndata	%f4,	%f20,	%f0
	movvc	%icc,	%o3,	%g3
	srax	%l1,	%o2,	%i4
	fmovrdlz	%l4,	%f0,	%f4
	movrlz	%o7,	0x049,	%o4
	fpsub32s	%f10,	%f7,	%f14
	sth	%g1,	[%l7 + 0x48]
	ldx	[%l7 + 0x10],	%i5
	fmul8x16al	%f12,	%f7,	%f22
	or	%i7,	%l2,	%o1
	srax	%l3,	%i2,	%l0
	movgu	%icc,	%i1,	%i3
	fmovscs	%xcc,	%f26,	%f9
	edge32	%g4,	%g7,	%g2
	fcmpgt32	%f10,	%f12,	%i0
	movre	%l5,	%i6,	%o6
	movneg	%xcc,	%o0,	%g6
	addcc	%g5,	%o5,	%l6
	movre	%g3,	0x0A7,	%o3
	addccc	%l1,	0x1C02,	%o2
	srax	%l4,	0x1B,	%i4
	nop
	set	0x1C, %i1
	ldsh	[%l7 + %i1],	%o7
	move	%xcc,	%o4,	%i5
	fand	%f20,	%f18,	%f14
	fnot2s	%f0,	%f4
	srl	%g1,	0x1B,	%i7
	popc	0x07F1,	%l2
	add	%o1,	0x07C3,	%i2
	fcmpgt16	%f22,	%f4,	%l3
	lduw	[%l7 + 0x2C],	%i1
	array16	%l0,	%g4,	%i3
	array16	%g7,	%i0,	%l5
	popc	0x0897,	%g2
	fnor	%f4,	%f0,	%f28
	stb	%o6,	[%l7 + 0x6D]
	movg	%icc,	%o0,	%i6
	movvc	%xcc,	%g5,	%g6
	ldsh	[%l7 + 0x30],	%l6
	movgu	%xcc,	%g3,	%o3
	movrlez	%o5,	%l1,	%l4
	save %i4, 0x02F3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o4,	0x09DC,	%o7
	subccc	%i5,	0x018F,	%i7
	stx	%g1,	[%l7 + 0x48]
	edge32n	%l2,	%o1,	%l3
	srax	%i2,	%i1,	%l0
	orn	%i3,	0x1566,	%g7
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	movle	%icc,	%g2,	%o0
	movpos	%icc,	%i6,	%g5
	fmul8x16	%f12,	%f4,	%f0
	movvs	%icc,	%g6,	%o6
	movrgez	%g3,	%o3,	%o5
	save %l6, 0x0780, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l4,	%i4,	%o2
	edge8n	%o4,	%i5,	%i7
	andcc	%o7,	0x1E42,	%g1
	movrlz	%o1,	%l2,	%i2
	sra	%i1,	0x10,	%l0
	ldsw	[%l7 + 0x14],	%i3
	sdivx	%l3,	0x12CB,	%g7
	orcc	%i0,	0x0467,	%l5
	sllx	%g2,	0x04,	%g4
	xorcc	%o0,	%g5,	%i6
	movrlez	%g6,	%o6,	%o3
	umul	%g3,	0x1E10,	%l6
	andn	%o5,	%l4,	%l1
	movn	%xcc,	%i4,	%o2
	umul	%i5,	0x02CB,	%i7
	std	%f6,	[%l7 + 0x48]
	movcc	%xcc,	%o7,	%o4
	fmovsne	%xcc,	%f17,	%f1
	edge8n	%o1,	%l2,	%g1
	fmovsge	%icc,	%f17,	%f26
	add	%i1,	%i2,	%i3
	srax	%l3,	0x1E,	%l0
	srlx	%i0,	0x1D,	%g7
	edge16	%l5,	%g4,	%o0
	orn	%g5,	0x1E70,	%i6
	udivx	%g6,	0x1E9A,	%g2
	ld	[%l7 + 0x18],	%f7
	srlx	%o3,	%g3,	%l6
	or	%o6,	%o5,	%l1
	fmovrslez	%l4,	%f31,	%f3
	ldd	[%l7 + 0x58],	%o2
	movge	%xcc,	%i4,	%i7
	smulcc	%o7,	0x1E01,	%i5
	fmovrsgez	%o4,	%f0,	%f15
	array32	%o1,	%l2,	%i1
	edge8	%g1,	%i3,	%l3
	move	%xcc,	%l0,	%i2
	srlx	%i0,	0x09,	%g7
	or	%g4,	%l5,	%o0
	udivx	%i6,	0x1DB2,	%g6
	movgu	%icc,	%g5,	%o3
	addccc	%g3,	0x1642,	%g2
	sir	0x1BB5
	save %l6, 0x1F7C, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o5,	%l1,	%l4
	fmovsge	%xcc,	%f20,	%f29
	mova	%icc,	%o2,	%i4
	ldsw	[%l7 + 0x6C],	%o7
	edge32l	%i7,	%o4,	%o1
	stb	%l2,	[%l7 + 0x15]
	srl	%i1,	%i5,	%i3
	array32	%l3,	%g1,	%i2
	ldd	[%l7 + 0x60],	%f20
	fcmpgt32	%f24,	%f12,	%l0
	subc	%i0,	%g4,	%l5
	srlx	%o0,	0x17,	%g7
	fmovdneg	%icc,	%f19,	%f25
	udiv	%i6,	0x1AC3,	%g5
	lduh	[%l7 + 0x6A],	%o3
	mova	%icc,	%g3,	%g2
	popc	0x052F,	%l6
	fmovrdgez	%o6,	%f8,	%f30
	mulscc	%o5,	%g6,	%l4
	subc	%o2,	%i4,	%o7
	movvs	%icc,	%l1,	%o4
	fnors	%f2,	%f30,	%f15
	lduw	[%l7 + 0x60],	%i7
	fpadd32s	%f25,	%f16,	%f12
	movvc	%icc,	%l2,	%o1
	and	%i5,	%i3,	%l3
	sdivcc	%i1,	0x15F2,	%g1
	fmovs	%f17,	%f27
	orcc	%i2,	0x1EAE,	%i0
	fmovs	%f9,	%f18
	sllx	%l0,	%l5,	%o0
	sdiv	%g7,	0x1EDF,	%g4
	popc	%g5,	%o3
	movre	%i6,	%g3,	%g2
	edge32l	%o6,	%o5,	%g6
	movn	%icc,	%l4,	%l6
	sra	%o2,	%o7,	%i4
	sllx	%o4,	0x05,	%l1
	movl	%xcc,	%i7,	%o1
	fmovscc	%xcc,	%f28,	%f10
	fnands	%f8,	%f22,	%f8
	mulx	%l2,	0x1C74,	%i5
	fmuld8sux16	%f3,	%f14,	%f22
	fandnot2	%f24,	%f22,	%f22
	udivx	%i3,	0x083D,	%l3
	add	%g1,	0x08B7,	%i1
	fmovdpos	%xcc,	%f8,	%f8
	srl	%i0,	0x16,	%i2
	fcmpgt16	%f20,	%f22,	%l0
	fsrc1s	%f6,	%f22
	xnor	%o0,	%l5,	%g4
	movvc	%icc,	%g5,	%o3
	edge16	%i6,	%g7,	%g2
	edge16ln	%o6,	%o5,	%g6
	array32	%g3,	%l4,	%l6
	srlx	%o2,	%o7,	%i4
	addccc	%l1,	0x08E0,	%i7
	xor	%o1,	0x1401,	%l2
	edge16n	%i5,	%i3,	%l3
	fornot2	%f14,	%f28,	%f0
	movrlez	%o4,	%i1,	%i0
	umulcc	%g1,	0x0D75,	%i2
	fmul8x16	%f11,	%f30,	%f26
	mulscc	%l0,	0x18E4,	%l5
	umulcc	%g4,	0x1536,	%o0
	movrne	%o3,	0x16D,	%g5
	movle	%icc,	%i6,	%g7
	fnegs	%f21,	%f26
	edge8	%g2,	%o6,	%o5
	movrlz	%g3,	0x01A,	%l4
	andn	%g6,	0x043C,	%l6
	subc	%o7,	%o2,	%l1
	movgu	%xcc,	%i4,	%i7
	sth	%l2,	[%l7 + 0x58]
	or	%i5,	%i3,	%o1
	movvs	%xcc,	%l3,	%i1
	edge32n	%i0,	%g1,	%o4
	andn	%l0,	%i2,	%l5
	sra	%o0,	0x0C,	%o3
	ldsh	[%l7 + 0x0A],	%g5
	mulx	%g4,	%g7,	%g2
	save %o6, 0x10DB, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f8,	%f10
	edge16ln	%i6,	%g3,	%g6
	fone	%f2
	move	%icc,	%l6,	%l4
	ldx	[%l7 + 0x38],	%o2
	ld	[%l7 + 0x60],	%f12
	fmul8x16au	%f0,	%f6,	%f26
	popc	%o7,	%l1
	ldsh	[%l7 + 0x12],	%i7
	edge16n	%l2,	%i5,	%i4
	movpos	%xcc,	%i3,	%l3
	smul	%o1,	0x187D,	%i1
	sir	0x1026
	movn	%icc,	%g1,	%i0
	sir	0x02F8
	movcs	%icc,	%o4,	%l0
	fmuld8sux16	%f30,	%f27,	%f16
	save %i2, %o0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l5,	0x0482,	%g5
	movrgez	%g7,	%g2,	%o6
	movgu	%icc,	%o5,	%i6
	xnorcc	%g3,	%g6,	%l6
	edge16ln	%g4,	%l4,	%o2
	edge16ln	%l1,	%o7,	%l2
	fmovrdgz	%i7,	%f20,	%f28
	fcmpgt32	%f14,	%f14,	%i5
	udiv	%i3,	0x0ACC,	%i4
	edge8l	%l3,	%i1,	%o1
	nop
	set	0x08, %o0
	std	%f30,	[%l7 + %o0]
	sdiv	%g1,	0x068C,	%o4
	array16	%i0,	%l0,	%i2
	edge32l	%o3,	%o0,	%g5
	ld	[%l7 + 0x28],	%f26
	movn	%icc,	%g7,	%g2
	addc	%l5,	0x1ED3,	%o6
	edge32l	%i6,	%o5,	%g6
	umul	%g3,	%g4,	%l4
	srax	%l6,	%o2,	%l1
	move	%xcc,	%o7,	%i7
	movgu	%icc,	%l2,	%i5
	movn	%xcc,	%i3,	%i4
	fpsub32s	%f6,	%f5,	%f21
	fandnot2	%f8,	%f12,	%f24
	movleu	%xcc,	%i1,	%l3
	orn	%o1,	%o4,	%g1
	movpos	%xcc,	%i0,	%l0
	fmovd	%f26,	%f14
	movge	%xcc,	%o3,	%i2
	sdiv	%g5,	0x0DE4,	%o0
	umul	%g7,	%l5,	%o6
	fcmpes	%fcc1,	%f16,	%f14
	andn	%i6,	%o5,	%g2
	st	%f13,	[%l7 + 0x30]
	movneg	%icc,	%g3,	%g4
	popc	0x0B41,	%l4
	movvs	%xcc,	%g6,	%o2
	orcc	%l6,	%o7,	%i7
	lduw	[%l7 + 0x10],	%l1
	sra	%i5,	%i3,	%i4
	sub	%l2,	0x093C,	%i1
	fmovdpos	%xcc,	%f18,	%f7
	movcc	%icc,	%l3,	%o1
	sdiv	%g1,	0x175B,	%o4
	srax	%i0,	0x19,	%o3
	udiv	%l0,	0x1498,	%i2
	alignaddrl	%o0,	%g5,	%l5
	std	%f26,	[%l7 + 0x70]
	movleu	%xcc,	%g7,	%i6
	fmovdne	%xcc,	%f26,	%f3
	andncc	%o5,	%g2,	%g3
	stb	%o6,	[%l7 + 0x2F]
	alignaddrl	%g4,	%l4,	%o2
	sth	%l6,	[%l7 + 0x6C]
	fcmps	%fcc3,	%f16,	%f29
	sdivx	%o7,	0x0EED,	%g6
	sdiv	%i7,	0x02A4,	%i5
	stb	%l1,	[%l7 + 0x7E]
	array8	%i4,	%l2,	%i1
	movl	%icc,	%i3,	%o1
	ld	[%l7 + 0x78],	%f17
	movvc	%xcc,	%g1,	%l3
	movrlz	%i0,	0x1EB,	%o3
	move	%xcc,	%l0,	%i2
	movrgz	%o0,	%g5,	%l5
	movpos	%icc,	%g7,	%o4
	sra	%i6,	0x16,	%o5
	fpadd32	%f28,	%f4,	%f4
	movrgz	%g3,	%g2,	%g4
	movg	%icc,	%l4,	%o2
	movl	%icc,	%o6,	%o7
	stb	%g6,	[%l7 + 0x1A]
	edge16l	%l6,	%i7,	%l1
	fands	%f24,	%f16,	%f13
	and	%i5,	0x0123,	%i4
	andncc	%i1,	%i3,	%o1
	udivcc	%g1,	0x0DC7,	%l3
	movvc	%xcc,	%i0,	%l2
	sethi	0x0796,	%l0
	movre	%i2,	0x15F,	%o0
	nop
	set	0x12, %i7
	ldub	[%l7 + %i7],	%o3
	fmovdpos	%xcc,	%f31,	%f7
	subcc	%g5,	0x0DFB,	%l5
	sdivx	%o4,	0x1423,	%g7
	fmul8x16al	%f4,	%f17,	%f18
	sdivcc	%i6,	0x17C7,	%g3
	for	%f6,	%f26,	%f28
	fmovdge	%icc,	%f27,	%f23
	fcmpgt32	%f28,	%f22,	%g2
	or	%g4,	0x1254,	%o5
	edge8l	%o2,	%l4,	%o6
	sdivx	%g6,	0x0107,	%o7
	sir	0x0CEF
	sll	%l6,	0x08,	%l1
	ldsw	[%l7 + 0x10],	%i5
	udivx	%i4,	0x1B7F,	%i7
	sub	%i1,	0x17FB,	%i3
	mova	%icc,	%g1,	%o1
	movcc	%xcc,	%l3,	%l2
	movgu	%icc,	%l0,	%i2
	alignaddrl	%i0,	%o0,	%o3
	sub	%g5,	0x03C4,	%l5
	sub	%o4,	0x1A4C,	%i6
	ldd	[%l7 + 0x68],	%g6
	xnor	%g3,	%g4,	%o5
	fpack16	%f18,	%f7
	movgu	%icc,	%g2,	%o2
	movcc	%icc,	%o6,	%g6
	and	%o7,	%l4,	%l6
	array32	%i5,	%l1,	%i4
	subcc	%i7,	0x1224,	%i3
	edge16l	%g1,	%i1,	%o1
	fmul8sux16	%f10,	%f6,	%f12
	mulscc	%l2,	0x1763,	%l0
	andcc	%l3,	%i0,	%o0
	mulx	%i2,	%o3,	%l5
	nop
	set	0x58, %l3
	lduw	[%l7 + %l3],	%g5
	fmovde	%icc,	%f24,	%f8
	add	%o4,	%g7,	%g3
	sll	%i6,	%o5,	%g2
	sll	%o2,	%o6,	%g4
	fmovrslez	%g6,	%f16,	%f14
	andn	%l4,	%o7,	%l6
	lduh	[%l7 + 0x40],	%l1
	sethi	0x18B3,	%i4
	movrlez	%i7,	%i3,	%g1
	andncc	%i1,	%o1,	%l2
	fones	%f25
	addcc	%l0,	0x1EE9,	%l3
	addccc	%i0,	0x03C2,	%o0
	sllx	%i2,	%o3,	%l5
	mulx	%g5,	0x0797,	%o4
	fmovda	%icc,	%f1,	%f28
	stw	%i5,	[%l7 + 0x54]
	fpadd16s	%f27,	%f0,	%f31
	smul	%g7,	%g3,	%i6
	fpsub32	%f6,	%f6,	%f18
	srl	%g2,	0x17,	%o5
	array16	%o6,	%g4,	%g6
	movcc	%xcc,	%o2,	%l4
	movvs	%xcc,	%o7,	%l6
	smul	%i4,	0x021E,	%l1
	ld	[%l7 + 0x1C],	%f31
	fandnot2	%f8,	%f20,	%f12
	xor	%i3,	0x05CA,	%i7
	ldx	[%l7 + 0x70],	%g1
	edge16l	%i1,	%o1,	%l2
	edge16n	%l3,	%l0,	%i0
	movrlez	%i2,	%o0,	%l5
	xor	%g5,	%o3,	%o4
	ldsb	[%l7 + 0x61],	%g7
	fabsd	%f22,	%f4
	edge8l	%g3,	%i5,	%i6
	fmovrdlez	%g2,	%f24,	%f4
	orcc	%o6,	%g4,	%g6
	andcc	%o5,	%l4,	%o2
	st	%f17,	[%l7 + 0x60]
	move	%icc,	%l6,	%i4
	fmovsneg	%icc,	%f13,	%f8
	stb	%l1,	[%l7 + 0x71]
	mulx	%i3,	0x0A71,	%i7
	lduh	[%l7 + 0x6C],	%o7
	edge16	%i1,	%g1,	%l2
	movrgz	%o1,	0x2BB,	%l0
	xnorcc	%i0,	%l3,	%o0
	stx	%l5,	[%l7 + 0x70]
	movl	%xcc,	%g5,	%i2
	move	%icc,	%o4,	%o3
	sdivx	%g7,	0x1B9A,	%i5
	ldub	[%l7 + 0x6A],	%g3
	movg	%icc,	%i6,	%g2
	fcmple16	%f14,	%f28,	%o6
	edge8	%g4,	%g6,	%l4
	edge8ln	%o5,	%l6,	%o2
	edge16n	%i4,	%i3,	%i7
	andcc	%o7,	%l1,	%g1
	ldub	[%l7 + 0x7E],	%i1
	movl	%icc,	%l2,	%l0
	xorcc	%i0,	0x15CB,	%l3
	srl	%o0,	%o1,	%g5
	movle	%icc,	%i2,	%o4
	ldd	[%l7 + 0x60],	%f6
	fmovrsgz	%o3,	%f11,	%f31
	edge8n	%l5,	%i5,	%g7
	sethi	0x0A7E,	%g3
	movleu	%xcc,	%g2,	%i6
	movgu	%icc,	%o6,	%g6
	fmuld8ulx16	%f7,	%f17,	%f6
	addc	%l4,	%o5,	%l6
	fxor	%f22,	%f2,	%f30
	addccc	%o2,	0x1339,	%i4
	fandnot2s	%f5,	%f13,	%f21
	and	%g4,	%i3,	%o7
	fmovse	%icc,	%f31,	%f5
	ldd	[%l7 + 0x20],	%f18
	fandnot1s	%f4,	%f2,	%f20
	movpos	%xcc,	%i7,	%g1
	nop
	set	0x33, %o4
	stb	%l1,	[%l7 + %o4]
	std	%f12,	[%l7 + 0x38]
	edge32ln	%i1,	%l2,	%i0
	std	%f24,	[%l7 + 0x50]
	fnegs	%f30,	%f26
	edge16n	%l0,	%l3,	%o1
	sth	%o0,	[%l7 + 0x2E]
	edge16ln	%i2,	%g5,	%o3
	sth	%l5,	[%l7 + 0x46]
	movle	%xcc,	%i5,	%g7
	stb	%g3,	[%l7 + 0x61]
	orn	%o4,	0x10E7,	%g2
	movpos	%xcc,	%i6,	%o6
	lduw	[%l7 + 0x4C],	%l4
	srl	%g6,	%l6,	%o5
	subcc	%i4,	%g4,	%i3
	ld	[%l7 + 0x44],	%f3
	addcc	%o7,	0x1FC9,	%o2
	edge16l	%i7,	%l1,	%i1
	andncc	%g1,	%l2,	%i0
	umul	%l0,	0x008F,	%o1
	udivcc	%l3,	0x1106,	%o0
	fcmpne16	%f30,	%f20,	%i2
	fpmerge	%f7,	%f18,	%f24
	sllx	%g5,	%l5,	%i5
	fmovsg	%icc,	%f23,	%f25
	sethi	0x1594,	%o3
	edge32	%g7,	%g3,	%o4
	lduh	[%l7 + 0x60],	%i6
	xnor	%o6,	0x0DB4,	%g2
	move	%icc,	%g6,	%l6
	umul	%o5,	0x1B9D,	%i4
	edge8ln	%g4,	%l4,	%i3
	movre	%o2,	0x254,	%o7
	edge32l	%i7,	%i1,	%g1
	array32	%l2,	%i0,	%l1
	xorcc	%o1,	0x1612,	%l0
	save %o0, 0x1C9D, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f24
	edge32ln	%g5,	%l3,	%l5
	fcmple32	%f14,	%f22,	%o3
	fones	%f27
	fcmps	%fcc2,	%f22,	%f18
	fabsd	%f18,	%f26
	for	%f8,	%f30,	%f2
	fzeros	%f2
	orncc	%i5,	0x0D58,	%g7
	lduw	[%l7 + 0x1C],	%g3
	array16	%i6,	%o4,	%o6
	alignaddrl	%g2,	%l6,	%o5
	fpackfix	%f20,	%f20
	edge16n	%g6,	%g4,	%l4
	movvs	%xcc,	%i3,	%i4
	fmovrslz	%o2,	%f21,	%f27
	fxors	%f14,	%f5,	%f30
	mulx	%o7,	0x0AA9,	%i1
	andcc	%g1,	0x01ED,	%i7
	fmovdg	%icc,	%f23,	%f21
	stx	%l2,	[%l7 + 0x38]
	fornot2s	%f28,	%f3,	%f25
	movvs	%icc,	%l1,	%i0
	xnor	%o1,	0x0384,	%o0
	restore %l0, %g5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l3,	[%l7 + 0x38]
	xorcc	%l5,	%o3,	%g7
	add	%g3,	0x0D30,	%i5
	edge8	%i6,	%o6,	%o4
	movle	%xcc,	%l6,	%g2
	andncc	%g6,	%o5,	%l4
	smulcc	%g4,	0x1021,	%i3
	fmovsneg	%icc,	%f12,	%f22
	fmuld8sux16	%f8,	%f15,	%f0
	edge32n	%i4,	%o2,	%o7
	sethi	0x0F29,	%g1
	movvs	%xcc,	%i7,	%i1
	st	%f17,	[%l7 + 0x34]
	andn	%l2,	0x0393,	%l1
	subccc	%i0,	0x1130,	%o0
	array32	%o1,	%l0,	%i2
	fcmple16	%f10,	%f28,	%l3
	edge32	%l5,	%g5,	%o3
	smulcc	%g3,	0x062F,	%i5
	ldx	[%l7 + 0x48],	%g7
	fmovscs	%icc,	%f8,	%f8
	fmovrdgez	%o6,	%f14,	%f2
	move	%icc,	%i6,	%l6
	alignaddrl	%o4,	%g6,	%o5
	ldx	[%l7 + 0x78],	%g2
	movre	%g4,	%l4,	%i4
	movl	%icc,	%i3,	%o2
	mova	%xcc,	%o7,	%g1
	ld	[%l7 + 0x64],	%f31
	fmovscc	%icc,	%f20,	%f31
	alignaddrl	%i7,	%l2,	%l1
	fpsub16s	%f1,	%f0,	%f1
	udivx	%i1,	0x173F,	%o0
	edge8ln	%i0,	%l0,	%i2
	edge32ln	%l3,	%l5,	%g5
	edge16ln	%o3,	%o1,	%i5
	fcmpgt32	%f22,	%f22,	%g3
	fcmpeq16	%f6,	%f2,	%g7
	array8	%o6,	%i6,	%l6
	ldsw	[%l7 + 0x18],	%o4
	ldsb	[%l7 + 0x55],	%g6
	fnot2	%f4,	%f22
	sth	%g2,	[%l7 + 0x1E]
	ldd	[%l7 + 0x30],	%f10
	fmovdneg	%xcc,	%f29,	%f11
	smul	%o5,	%g4,	%l4
	movleu	%icc,	%i3,	%o2
	fnot1s	%f27,	%f18
	udiv	%i4,	0x1DA0,	%o7
	fmovrse	%g1,	%f10,	%f11
	srax	%l2,	0x1B,	%l1
	movvs	%icc,	%i7,	%o0
	lduh	[%l7 + 0x70],	%i0
	edge16l	%i1,	%l0,	%l3
	fcmped	%fcc1,	%f2,	%f20
	popc	%i2,	%g5
	fands	%f23,	%f7,	%f16
	movneg	%xcc,	%l5,	%o3
	movne	%xcc,	%i5,	%o1
	array8	%g7,	%g3,	%o6
	lduh	[%l7 + 0x78],	%i6
	umul	%l6,	0x1B22,	%g6
	alignaddr	%o4,	%o5,	%g2
	umul	%l4,	0x1020,	%i3
	movrgez	%g4,	%i4,	%o2
	array16	%o7,	%l2,	%g1
	movge	%xcc,	%i7,	%o0
	movneg	%xcc,	%i0,	%l1
	xnorcc	%i1,	0x03AD,	%l3
	andcc	%i2,	0x10B1,	%l0
	movgu	%xcc,	%l5,	%g5
	alignaddr	%o3,	%o1,	%i5
	subccc	%g7,	%o6,	%i6
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%g3
	ldsb	[%l7 + 0x45],	%l6
	fmovdne	%icc,	%f2,	%f8
	ldsw	[%l7 + 0x24],	%o4
	fmovdneg	%icc,	%f5,	%f9
	sllx	%g6,	0x1E,	%g2
	st	%f8,	[%l7 + 0x7C]
	movle	%icc,	%o5,	%l4
	st	%f4,	[%l7 + 0x4C]
	fpadd32	%f16,	%f22,	%f26
	xnor	%i3,	%i4,	%g4
	udivcc	%o2,	0x1945,	%o7
	sub	%g1,	%i7,	%o0
	fmovrslez	%l2,	%f30,	%f13
	popc	0x08C3,	%l1
	bshuffle	%f26,	%f16,	%f12
	udiv	%i1,	0x0F15,	%i0
	alignaddrl	%i2,	%l3,	%l0
	fmul8sux16	%f12,	%f14,	%f22
	movcc	%icc,	%g5,	%l5
	srl	%o3,	0x0A,	%i5
	alignaddr	%g7,	%o6,	%o1
	faligndata	%f8,	%f6,	%f10
	ldsb	[%l7 + 0x50],	%g3
	movcs	%xcc,	%l6,	%o4
	ldd	[%l7 + 0x60],	%f6
	orn	%g6,	0x1713,	%i6
	ldsh	[%l7 + 0x32],	%o5
	mulscc	%g2,	%i3,	%l4
	fmovdne	%xcc,	%f15,	%f25
	movcs	%icc,	%i4,	%g4
	fpsub16	%f30,	%f22,	%f14
	movvc	%xcc,	%o7,	%g1
	xnor	%o2,	%i7,	%o0
	udiv	%l1,	0x1553,	%l2
	movneg	%xcc,	%i0,	%i1
	movvs	%xcc,	%i2,	%l0
	stw	%l3,	[%l7 + 0x48]
	addcc	%g5,	0x1633,	%o3
	sethi	0x18F8,	%i5
	movrlz	%l5,	0x0A7,	%g7
	ldsh	[%l7 + 0x34],	%o1
	sdiv	%o6,	0x1DE0,	%l6
	addccc	%g3,	0x1903,	%o4
	edge8n	%i6,	%o5,	%g2
	stb	%g6,	[%l7 + 0x58]
	fzeros	%f12
	srl	%l4,	0x09,	%i3
	edge32ln	%g4,	%i4,	%o7
	srax	%o2,	0x15,	%i7
	ldd	[%l7 + 0x60],	%g0
	st	%f2,	[%l7 + 0x34]
	udiv	%o0,	0x07D4,	%l1
	sth	%i0,	[%l7 + 0x2A]
	edge32n	%i1,	%i2,	%l2
	umulcc	%l3,	0x0916,	%l0
	orncc	%g5,	0x0E9F,	%o3
	fmovd	%f6,	%f8
	movcs	%xcc,	%l5,	%i5
	subccc	%g7,	%o1,	%o6
	sth	%g3,	[%l7 + 0x1C]
	movrgz	%o4,	%i6,	%o5
	andn	%l6,	0x073A,	%g6
	and	%l4,	%g2,	%i3
	orn	%i4,	%g4,	%o2
	ldsw	[%l7 + 0x40],	%o7
	fornot2	%f14,	%f8,	%f10
	sdivcc	%i7,	0x03F9,	%o0
	smul	%g1,	0x0C95,	%l1
	udivx	%i0,	0x02A3,	%i1
	sdivx	%l2,	0x0E76,	%l3
	fpack32	%f14,	%f20,	%f24
	save %i2, 0x0C77, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f8,	[%l7 + 0x18]
	sdivcc	%o3,	0x0C2D,	%l5
	udivcc	%i5,	0x1757,	%l0
	xnorcc	%g7,	0x14B4,	%o1
	ldsb	[%l7 + 0x7C],	%o6
	sdiv	%g3,	0x1714,	%i6
	andcc	%o5,	0x011E,	%l6
	fmovdleu	%icc,	%f22,	%f9
	fmovrde	%g6,	%f8,	%f20
	alignaddr	%l4,	%g2,	%o4
	smulcc	%i3,	0x1CED,	%g4
	smulcc	%i4,	0x1691,	%o2
	movg	%xcc,	%i7,	%o7
	movn	%icc,	%o0,	%g1
	sth	%i0,	[%l7 + 0x40]
	fcmpgt32	%f2,	%f28,	%l1
	edge32l	%l2,	%l3,	%i1
	nop
	set	0x6C, %o7
	stw	%i2,	[%l7 + %o7]
	fzero	%f30
	movre	%o3,	%g5,	%i5
	srlx	%l5,	0x05,	%l0
	fpackfix	%f16,	%f28
	movge	%icc,	%g7,	%o6
	srl	%o1,	%i6,	%g3
	fmovsle	%icc,	%f25,	%f21
	movrgz	%l6,	%g6,	%o5
	nop
	set	0x48, %g3
	ldd	[%l7 + %g3],	%f26
	add	%l4,	%g2,	%o4
	sethi	0x1FFB,	%g4
	lduh	[%l7 + 0x6E],	%i3
	ldx	[%l7 + 0x20],	%o2
	movcs	%xcc,	%i7,	%i4
	fornot2	%f26,	%f6,	%f14
	fsrc2s	%f31,	%f26
	xnorcc	%o7,	%o0,	%g1
	array8	%l1,	%l2,	%l3
	fandnot2s	%f1,	%f21,	%f22
	and	%i1,	%i0,	%i2
	stx	%o3,	[%l7 + 0x50]
	movpos	%xcc,	%i5,	%l5
	stx	%l0,	[%l7 + 0x70]
	udivx	%g7,	0x0396,	%g5
	movre	%o1,	%i6,	%g3
	movrlez	%o6,	%g6,	%o5
	fornot1	%f0,	%f16,	%f24
	add	%l4,	%l6,	%o4
	movne	%icc,	%g4,	%i3
	movge	%icc,	%o2,	%i7
	movge	%xcc,	%i4,	%g2
	movcc	%icc,	%o7,	%o0
	ldsh	[%l7 + 0x24],	%g1
	sdiv	%l1,	0x0293,	%l3
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	sdivcc	%o3,	0x0822,	%i5
	srax	%l5,	0x05,	%l0
	sdivcc	%l2,	0x1BA4,	%g7
	orn	%g5,	0x0C31,	%o1
	array32	%i6,	%o6,	%g3
	lduw	[%l7 + 0x28],	%g6
	xnor	%o5,	%l6,	%l4
	or	%o4,	0x04A4,	%i3
	sir	0x1CCE
	movl	%xcc,	%g4,	%o2
	orncc	%i4,	%i7,	%o7
	movgu	%xcc,	%g2,	%g1
	fands	%f13,	%f16,	%f15
	ldx	[%l7 + 0x70],	%o0
	fmovrdlz	%l3,	%f26,	%f4
	fornot1s	%f4,	%f6,	%f10
	fmovrdgez	%l1,	%f12,	%f24
	fandnot1	%f14,	%f16,	%f16
	subccc	%i1,	0x1866,	%i0
	edge16l	%o3,	%i5,	%l5
	sub	%l0,	%l2,	%i2
	srlx	%g5,	0x06,	%g7
	fnor	%f8,	%f20,	%f20
	movrlez	%o1,	%o6,	%g3
	fandnot1	%f6,	%f18,	%f2
	fmovrdlez	%i6,	%f16,	%f24
	addc	%g6,	0x0CAE,	%l6
	stx	%o5,	[%l7 + 0x78]
	sdiv	%l4,	0x1DA3,	%o4
	andn	%i3,	0x00E2,	%g4
	fpsub32s	%f3,	%f18,	%f1
	lduh	[%l7 + 0x1C],	%i4
	ldub	[%l7 + 0x7C],	%i7
	movne	%icc,	%o2,	%o7
	movleu	%xcc,	%g2,	%o0
	fmovrdgz	%g1,	%f10,	%f6
	fmuld8sux16	%f31,	%f0,	%f20
	fmovdcs	%icc,	%f13,	%f28
	stw	%l3,	[%l7 + 0x74]
	movrne	%l1,	%i0,	%i1
	xnorcc	%o3,	%l5,	%l0
	edge32l	%l2,	%i2,	%i5
	orncc	%g5,	0x029C,	%o1
	sll	%o6,	%g7,	%i6
	fxnors	%f12,	%f22,	%f30
	sllx	%g3,	0x1B,	%l6
	alignaddrl	%o5,	%l4,	%o4
	umul	%g6,	%i3,	%i4
	movne	%icc,	%i7,	%o2
	movne	%xcc,	%g4,	%o7
	fmovsle	%xcc,	%f8,	%f15
	fnegd	%f8,	%f26
	udiv	%o0,	0x152F,	%g2
	umul	%g1,	0x0ED8,	%l3
	edge32ln	%i0,	%i1,	%l1
	fands	%f17,	%f27,	%f13
	andncc	%o3,	%l0,	%l2
	movre	%i2,	%i5,	%g5
	edge16n	%l5,	%o6,	%g7
	ldsw	[%l7 + 0x60],	%o1
	edge16l	%g3,	%l6,	%i6
	sethi	0x0EE1,	%o5
	sra	%l4,	0x1E,	%o4
	mova	%icc,	%g6,	%i3
	fmuld8sux16	%f19,	%f4,	%f26
	sethi	0x1643,	%i4
	movrlz	%o2,	0x1CF,	%g4
	ldx	[%l7 + 0x78],	%o7
	fmovsn	%icc,	%f27,	%f9
	ldd	[%l7 + 0x30],	%o0
	or	%g2,	0x0D67,	%g1
	edge16ln	%l3,	%i7,	%i0
	stw	%l1,	[%l7 + 0x1C]
	fmovse	%icc,	%f27,	%f18
	sdivx	%i1,	0x1782,	%l0
	movne	%xcc,	%l2,	%i2
	addccc	%o3,	0x1AE9,	%i5
	addccc	%g5,	%l5,	%g7
	lduw	[%l7 + 0x70],	%o6
	ldsb	[%l7 + 0x7E],	%g3
	edge16n	%l6,	%o1,	%o5
	andn	%l4,	0x1EB2,	%i6
	sethi	0x1D28,	%o4
	movl	%xcc,	%g6,	%i4
	fxor	%f12,	%f28,	%f4
	movrgez	%i3,	%o2,	%o7
	movl	%xcc,	%g4,	%g2
	fmovsleu	%icc,	%f20,	%f9
	addccc	%g1,	0x1351,	%l3
	movcs	%icc,	%i7,	%i0
	srlx	%o0,	0x15,	%l1
	movneg	%xcc,	%i1,	%l0
	udivcc	%l2,	0x0310,	%i2
	movrne	%i5,	0x0ED,	%o3
	or	%l5,	0x1697,	%g5
	orn	%g7,	%g3,	%o6
	edge32	%l6,	%o5,	%l4
	mulscc	%i6,	0x0CB3,	%o1
	movn	%xcc,	%g6,	%i4
	movneg	%xcc,	%o4,	%o2
	umulcc	%i3,	0x0E5E,	%g4
	movg	%xcc,	%g2,	%g1
	fnot2s	%f19,	%f14
	fcmpeq16	%f0,	%f14,	%l3
	edge8	%o7,	%i0,	%i7
	umulcc	%l1,	%o0,	%l0
	edge16ln	%i1,	%i2,	%l2
	addccc	%i5,	0x15B7,	%o3
	fmovrslz	%l5,	%f18,	%f14
	movneg	%xcc,	%g5,	%g3
	ldd	[%l7 + 0x70],	%f12
	umulcc	%g7,	%o6,	%l6
	edge16n	%o5,	%l4,	%o1
	udiv	%g6,	0x1C8B,	%i6
	alignaddr	%o4,	%o2,	%i4
	ldsw	[%l7 + 0x60],	%i3
	alignaddrl	%g2,	%g4,	%l3
	sdivx	%o7,	0x0F89,	%g1
	fmovdneg	%xcc,	%f31,	%f3
	fpsub16s	%f20,	%f19,	%f30
	fmovsgu	%xcc,	%f25,	%f4
	andcc	%i7,	0x0E03,	%i0
	udiv	%o0,	0x1251,	%l1
	ldd	[%l7 + 0x60],	%f12
	fornot1	%f2,	%f0,	%f8
	mova	%xcc,	%l0,	%i1
	fnor	%f16,	%f22,	%f16
	sethi	0x0A26,	%i2
	movrne	%i5,	0x31E,	%o3
	smulcc	%l2,	%g5,	%g3
	fpadd32s	%f11,	%f2,	%f16
	fones	%f26
	subc	%l5,	0x00B0,	%o6
	ldd	[%l7 + 0x60],	%i6
	fexpand	%f27,	%f22
	xorcc	%g7,	%o5,	%l4
	nop
	set	0x24, %l5
	lduw	[%l7 + %l5],	%g6
	edge32	%i6,	%o4,	%o2
	sll	%i4,	%o1,	%i3
	ldsb	[%l7 + 0x69],	%g4
	ldsh	[%l7 + 0x44],	%l3
	fmovspos	%xcc,	%f30,	%f23
	ld	[%l7 + 0x1C],	%f5
	srax	%o7,	0x0B,	%g2
	sir	0x0AC0
	restore %i7, %i0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f28,	%f18,	%f28
	umulcc	%o0,	%l0,	%l1
	movg	%xcc,	%i2,	%i1
	movre	%i5,	0x2E5,	%o3
	edge8l	%l2,	%g5,	%g3
	lduh	[%l7 + 0x10],	%o6
	movle	%xcc,	%l5,	%l6
	edge32	%o5,	%l4,	%g7
	sra	%g6,	%i6,	%o4
	sth	%o2,	[%l7 + 0x3C]
	edge8l	%i4,	%i3,	%g4
	fsrc2s	%f8,	%f3
	addccc	%l3,	0x016B,	%o1
	fmovsleu	%icc,	%f19,	%f6
	move	%icc,	%g2,	%o7
	addccc	%i0,	0x1D9B,	%g1
	srax	%i7,	%o0,	%l1
	fpmerge	%f26,	%f29,	%f8
	edge32ln	%l0,	%i1,	%i5
	fmovrslz	%o3,	%f3,	%f12
	fmovsleu	%xcc,	%f5,	%f23
	umulcc	%i2,	0x08C8,	%g5
	subcc	%l2,	%g3,	%l5
	srax	%l6,	0x06,	%o6
	fnot1s	%f25,	%f29
	udivx	%l4,	0x1386,	%g7
	alignaddr	%o5,	%i6,	%g6
	movl	%xcc,	%o2,	%o4
	sth	%i3,	[%l7 + 0x68]
	edge32n	%g4,	%i4,	%l3
	mulx	%g2,	0x10DB,	%o7
	fmovdvc	%xcc,	%f4,	%f24
	lduh	[%l7 + 0x4E],	%i0
	orn	%o1,	%i7,	%o0
	edge16	%l1,	%g1,	%l0
	orcc	%i1,	%i5,	%o3
	movl	%xcc,	%g5,	%l2
	array32	%i2,	%l5,	%g3
	xnorcc	%o6,	%l4,	%l6
	std	%f10,	[%l7 + 0x58]
	ld	[%l7 + 0x08],	%f5
	sllx	%g7,	0x09,	%o5
	ldd	[%l7 + 0x58],	%f28
	edge8ln	%i6,	%g6,	%o4
	edge8l	%i3,	%o2,	%g4
	sdivcc	%i4,	0x14B4,	%l3
	fandnot2s	%f6,	%f30,	%f15
	fpsub16	%f0,	%f0,	%f24
	addc	%g2,	0x187B,	%i0
	movg	%icc,	%o7,	%o1
	edge8	%o0,	%i7,	%g1
	sdivx	%l0,	0x0439,	%i1
	movvc	%icc,	%i5,	%o3
	orn	%l1,	%l2,	%g5
	movpos	%icc,	%l5,	%i2
	movvs	%icc,	%g3,	%o6
	fmovdne	%icc,	%f4,	%f15
	fmovrdlz	%l4,	%f10,	%f22
	popc	0x0EEA,	%l6
	fpadd32s	%f19,	%f7,	%f15
	or	%g7,	0x0429,	%o5
	movrlez	%i6,	0x080,	%o4
	sdivcc	%g6,	0x0A54,	%i3
	popc	0x177D,	%o2
	movcc	%xcc,	%i4,	%l3
	lduh	[%l7 + 0x46],	%g4
	stw	%g2,	[%l7 + 0x34]
	orcc	%i0,	%o1,	%o0
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	edge8l	%l0,	%i1,	%i5
	movle	%icc,	%o3,	%l1
	lduw	[%l7 + 0x6C],	%g5
	movne	%xcc,	%l5,	%l2
	smulcc	%i2,	%g3,	%o6
	movneg	%xcc,	%l4,	%l6
	andn	%o5,	%g7,	%i6
	mova	%icc,	%g6,	%i3
	ldsw	[%l7 + 0x58],	%o2
	fcmps	%fcc2,	%f4,	%f6
	mova	%icc,	%i4,	%o4
	edge8ln	%g4,	%l3,	%g2
	movge	%icc,	%i0,	%o0
	fsrc1	%f8,	%f2
	ldd	[%l7 + 0x58],	%o0
	fmovdne	%xcc,	%f11,	%f29
	udivcc	%g1,	0x1580,	%i7
	fornot1	%f22,	%f18,	%f4
	movre	%l0,	0x1C9,	%i1
	umul	%o7,	0x06FF,	%o3
	fmovspos	%xcc,	%f18,	%f3
	ldsb	[%l7 + 0x73],	%i5
	and	%g5,	%l1,	%l5
	edge32ln	%l2,	%i2,	%o6
	movle	%xcc,	%g3,	%l4
	edge8l	%l6,	%g7,	%i6
	andncc	%g6,	%o5,	%o2
	xor	%i3,	%i4,	%g4
	udivcc	%o4,	0x0E0F,	%g2
	edge16l	%i0,	%o0,	%l3
	fcmped	%fcc0,	%f28,	%f24
	movrlez	%o1,	0x356,	%g1
	sdivcc	%i7,	0x14B1,	%i1
	move	%icc,	%l0,	%o3
	ldsw	[%l7 + 0x3C],	%i5
	movle	%xcc,	%g5,	%o7
	addccc	%l1,	%l5,	%l2
	udivx	%i2,	0x17C6,	%g3
	restore %l4, 0x1B5A, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f21,	%f26
	addcc	%l6,	0x1C79,	%g7
	fmovspos	%icc,	%f29,	%f22
	addc	%g6,	%o5,	%i6
	fpadd16	%f30,	%f20,	%f4
	edge32n	%o2,	%i3,	%i4
	fmovsn	%icc,	%f30,	%f19
	sir	0x0BB3
	xnorcc	%g4,	0x0727,	%o4
	fpsub32s	%f14,	%f19,	%f20
	movl	%xcc,	%g2,	%o0
	stw	%l3,	[%l7 + 0x38]
	movcc	%icc,	%i0,	%g1
	movle	%icc,	%o1,	%i1
	edge16l	%i7,	%o3,	%l0
	addcc	%i5,	0x161A,	%o7
	sethi	0x001F,	%g5
	srax	%l1,	0x07,	%l5
	array16	%l2,	%g3,	%l4
	movge	%icc,	%i2,	%o6
	edge16	%l6,	%g6,	%g7
	sdivx	%o5,	0x06F6,	%o2
	movrlez	%i3,	%i4,	%i6
	movcs	%icc,	%o4,	%g2
	fmovrsne	%g4,	%f25,	%f26
	lduh	[%l7 + 0x74],	%o0
	xnor	%l3,	%i0,	%g1
	and	%o1,	0x0D0D,	%i1
	movre	%i7,	%l0,	%i5
	movvs	%icc,	%o3,	%g5
	fmovdl	%icc,	%f2,	%f17
	umulcc	%l1,	%o7,	%l2
	fmuld8sux16	%f7,	%f2,	%f20
	stw	%l5,	[%l7 + 0x0C]
	fxnors	%f31,	%f27,	%f19
	addc	%l4,	0x049F,	%g3
	edge32l	%i2,	%o6,	%l6
	movvs	%xcc,	%g7,	%o5
	fsrc1s	%f8,	%f7
	edge32l	%o2,	%g6,	%i4
	nop
	set	0x24, %g4
	sth	%i3,	[%l7 + %g4]
	srl	%i6,	%g2,	%g4
	fmovdle	%xcc,	%f24,	%f29
	fmovdne	%icc,	%f21,	%f21
	popc	%o0,	%l3
	xnorcc	%i0,	%g1,	%o1
	mulx	%o4,	0x08B5,	%i7
	edge16	%i1,	%l0,	%o3
	movgu	%xcc,	%i5,	%l1
	movcc	%xcc,	%g5,	%l2
	fors	%f18,	%f13,	%f10
	fcmped	%fcc0,	%f14,	%f22
	addcc	%l5,	%o7,	%l4
	alignaddrl	%i2,	%g3,	%o6
	fsrc1s	%f13,	%f6
	ldd	[%l7 + 0x38],	%f22
	srax	%l6,	%g7,	%o5
	fnor	%f0,	%f22,	%f20
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%o2
	andcc	%i4,	0x1A88,	%g6
	movrne	%i6,	0x199,	%i3
	movrne	%g4,	0x37D,	%g2
	stx	%o0,	[%l7 + 0x78]
	fmovsge	%icc,	%f11,	%f26
	ld	[%l7 + 0x54],	%f31
	ldx	[%l7 + 0x18],	%l3
	srlx	%g1,	%i0,	%o1
	udivx	%i7,	0x17C7,	%o4
	st	%f30,	[%l7 + 0x0C]
	addc	%i1,	%o3,	%i5
	array16	%l1,	%l0,	%g5
	movre	%l5,	%o7,	%l2
	orncc	%i2,	0x038C,	%l4
	fnot2s	%f18,	%f21
	xor	%g3,	0x1C18,	%o6
	addc	%l6,	%g7,	%o2
	edge16	%i4,	%g6,	%i6
	move	%icc,	%i3,	%g4
	add	%o5,	%o0,	%l3
	stw	%g2,	[%l7 + 0x40]
	movrlez	%g1,	0x302,	%i0
	orncc	%i7,	%o4,	%o1
	fmovsle	%xcc,	%f1,	%f30
	andn	%i1,	0x11C1,	%i5
	nop
	set	0x5A, %l2
	ldsb	[%l7 + %l2],	%o3
	movge	%icc,	%l1,	%l0
	movne	%xcc,	%g5,	%o7
	sll	%l5,	0x11,	%l2
	movrne	%l4,	0x097,	%g3
	xor	%i2,	0x000A,	%o6
	fabsd	%f0,	%f22
	orn	%l6,	0x14A4,	%g7
	stx	%o2,	[%l7 + 0x58]
	ldsh	[%l7 + 0x16],	%i4
	smulcc	%g6,	0x0870,	%i6
	ld	[%l7 + 0x58],	%f2
	sdivx	%i3,	0x0887,	%o5
	movpos	%xcc,	%o0,	%l3
	srax	%g4,	0x01,	%g1
	ldd	[%l7 + 0x20],	%f20
	srlx	%g2,	%i0,	%o4
	ldsh	[%l7 + 0x5C],	%o1
	mova	%icc,	%i7,	%i1
	srl	%o3,	%i5,	%l1
	movpos	%xcc,	%l0,	%g5
	fcmpes	%fcc1,	%f3,	%f11
	movre	%o7,	0x2D4,	%l2
	movpos	%xcc,	%l5,	%g3
	movrlz	%l4,	0x3D7,	%o6
	srl	%i2,	0x0C,	%g7
	addccc	%l6,	%i4,	%o2
	add	%i6,	0x1B4F,	%i3
	edge8ln	%g6,	%o5,	%l3
	ldx	[%l7 + 0x10],	%g4
	fcmpeq32	%f6,	%f28,	%o0
	sllx	%g1,	%g2,	%i0
	array16	%o1,	%o4,	%i7
	srax	%o3,	%i5,	%l1
	ldsw	[%l7 + 0x7C],	%l0
	st	%f5,	[%l7 + 0x40]
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	xor	%o7,	%l5,	%g3
	ldsw	[%l7 + 0x4C],	%l4
	array8	%i2,	%o6,	%g7
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%l6
	fzero	%f26
	ldsb	[%l7 + 0x53],	%o2
	ldub	[%l7 + 0x4E],	%i4
	fnot2s	%f10,	%f26
	or	%i3,	%i6,	%o5
	movge	%icc,	%g6,	%g4
	umul	%o0,	%g1,	%g2
	ldd	[%l7 + 0x20],	%i0
	udivcc	%o1,	0x0577,	%o4
	andncc	%i7,	%o3,	%i5
	edge16	%l1,	%l3,	%l0
	movrgz	%g5,	0x2A6,	%l2
	edge32	%i1,	%o7,	%g3
	smul	%l4,	0x1313,	%i2
	smul	%o6,	%l5,	%l6
	sub	%g7,	%i4,	%i3
	movneg	%icc,	%i6,	%o2
	umulcc	%g6,	%g4,	%o0
	fmul8x16al	%f4,	%f1,	%f24
	srlx	%g1,	0x0F,	%g2
	fcmped	%fcc3,	%f10,	%f24
	movleu	%icc,	%o5,	%o1
	fnot1s	%f7,	%f7
	xor	%i0,	0x12F4,	%i7
	alignaddr	%o4,	%i5,	%l1
	edge32n	%o3,	%l0,	%l3
	smul	%g5,	%l2,	%o7
	fandnot1s	%f8,	%f24,	%f3
	orcc	%i1,	%g3,	%i2
	umul	%o6,	0x0F24,	%l4
	movrlez	%l5,	0x2A6,	%g7
	sethi	0x0842,	%i4
	subcc	%i3,	%l6,	%i6
	fmovsn	%xcc,	%f19,	%f31
	and	%o2,	%g4,	%o0
	sethi	0x0456,	%g1
	fmovsle	%icc,	%f6,	%f14
	movre	%g6,	%o5,	%g2
	addc	%o1,	%i7,	%i0
	and	%i5,	0x14B1,	%o4
	xnor	%o3,	0x1C55,	%l0
	st	%f8,	[%l7 + 0x28]
	ldsw	[%l7 + 0x78],	%l3
	sra	%l1,	0x0E,	%l2
	mulscc	%g5,	%i1,	%o7
	movre	%g3,	0x31D,	%o6
	ldsh	[%l7 + 0x38],	%i2
	orn	%l4,	0x0953,	%l5
	umulcc	%g7,	0x04DC,	%i3
	movre	%i4,	0x2F6,	%l6
	subc	%i6,	%g4,	%o0
	movrgez	%g1,	0x190,	%g6
	fzeros	%f6
	movcs	%icc,	%o5,	%g2
	sllx	%o2,	0x1E,	%i7
	fandnot1s	%f18,	%f27,	%f23
	orcc	%o1,	%i5,	%i0
	subc	%o3,	%o4,	%l3
	udiv	%l1,	0x106E,	%l2
	mova	%icc,	%g5,	%l0
	fmovscc	%icc,	%f6,	%f9
	popc	0x0A00,	%i1
	fxor	%f8,	%f26,	%f18
	alignaddrl	%o7,	%g3,	%i2
	ldsw	[%l7 + 0x10],	%o6
	edge16	%l4,	%l5,	%g7
	edge8l	%i4,	%l6,	%i3
	subccc	%i6,	%o0,	%g1
	std	%f20,	[%l7 + 0x68]
	mulscc	%g4,	%g6,	%g2
	ldx	[%l7 + 0x68],	%o2
	fcmpgt32	%f20,	%f4,	%i7
	movg	%icc,	%o1,	%o5
	popc	0x13B2,	%i5
	movcs	%xcc,	%o3,	%i0
	sll	%o4,	0x10,	%l1
	movg	%icc,	%l3,	%g5
	smul	%l0,	%l2,	%o7
	umulcc	%g3,	%i2,	%o6
	edge32l	%l4,	%l5,	%g7
	udivx	%i1,	0x0778,	%i4
	std	%f18,	[%l7 + 0x08]
	and	%i3,	%l6,	%i6
	xor	%o0,	0x02BF,	%g4
	orcc	%g1,	%g6,	%o2
	fcmpeq32	%f10,	%f28,	%g2
	edge32	%i7,	%o1,	%o5
	move	%icc,	%i5,	%o3
	edge32n	%i0,	%o4,	%l1
	sra	%g5,	%l3,	%l0
	movrgz	%l2,	%o7,	%g3
	stb	%i2,	[%l7 + 0x70]
	movrlez	%l4,	0x221,	%l5
	orcc	%g7,	%o6,	%i4
	ldsw	[%l7 + 0x74],	%i3
	movle	%xcc,	%i1,	%l6
	xnorcc	%o0,	%i6,	%g4
	alignaddrl	%g1,	%o2,	%g6
	fmovdg	%icc,	%f22,	%f27
	movg	%icc,	%g2,	%o1
	andncc	%o5,	%i5,	%i7
	fcmpgt32	%f4,	%f2,	%i0
	edge8	%o4,	%o3,	%g5
	addccc	%l1,	%l3,	%l0
	or	%o7,	%g3,	%i2
	fmovsn	%xcc,	%f9,	%f5
	alignaddr	%l4,	%l5,	%g7
	edge32n	%l2,	%o6,	%i4
	save %i3, 0x1EEF, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l6,	[%l7 + 0x6E]
	sethi	0x1071,	%o0
	or	%i6,	0x0C0A,	%g1
	std	%f4,	[%l7 + 0x30]
	or	%g4,	%o2,	%g6
	umul	%o1,	0x1C66,	%g2
	sethi	0x0464,	%i5
	sdivx	%o5,	0x16E1,	%i0
	movge	%icc,	%o4,	%i7
	movvc	%xcc,	%o3,	%l1
	smul	%l3,	0x141E,	%l0
	fmovsne	%xcc,	%f10,	%f10
	fmovde	%icc,	%f7,	%f16
	srlx	%o7,	0x03,	%g5
	st	%f18,	[%l7 + 0x64]
	fpadd16s	%f3,	%f14,	%f5
	srax	%g3,	%l4,	%l5
	sllx	%g7,	%l2,	%o6
	fexpand	%f16,	%f8
	subccc	%i2,	0x10F7,	%i3
	fmovdcs	%icc,	%f31,	%f3
	ldsw	[%l7 + 0x20],	%i1
	fcmpgt16	%f12,	%f26,	%l6
	restore %o0, 0x0D31, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%g4,	%g1
	sll	%g6,	0x0B,	%o1
	movg	%xcc,	%o2,	%i5
	srlx	%g2,	%i0,	%o5
	array16	%o4,	%i7,	%o3
	movcc	%xcc,	%l1,	%l0
	movg	%xcc,	%l3,	%o7
	edge32	%g5,	%l4,	%g3
	fmuld8sux16	%f11,	%f26,	%f18
	addc	%l5,	%g7,	%o6
	edge8n	%l2,	%i2,	%i3
	edge32ln	%i1,	%o0,	%l6
	edge32l	%i6,	%i4,	%g4
	std	%f28,	[%l7 + 0x08]
	sdivcc	%g1,	0x1074,	%o1
	fnegd	%f8,	%f24
	fmovrslez	%o2,	%f12,	%f23
	fmovs	%f23,	%f11
	mova	%xcc,	%g6,	%i5
	movleu	%icc,	%i0,	%o5
	ldd	[%l7 + 0x38],	%f18
	edge16n	%o4,	%i7,	%g2
	fcmple32	%f16,	%f28,	%o3
	sdiv	%l0,	0x1C79,	%l1
	sra	%o7,	0x1B,	%l3
	sir	0x181F
	subcc	%g5,	0x19E4,	%l4
	fnands	%f21,	%f17,	%f12
	fand	%f28,	%f16,	%f12
	fmovdleu	%xcc,	%f20,	%f23
	edge16ln	%g3,	%g7,	%o6
	fnands	%f12,	%f22,	%f26
	sdiv	%l2,	0x0E74,	%l5
	movvc	%icc,	%i3,	%i2
	fors	%f12,	%f12,	%f28
	ldd	[%l7 + 0x58],	%i0
	movrgz	%l6,	0x3C1,	%o0
	movleu	%xcc,	%i4,	%i6
	movcs	%icc,	%g1,	%o1
	fmovdvc	%xcc,	%f18,	%f10
	fabss	%f31,	%f7
	movleu	%xcc,	%g4,	%o2
	sub	%i5,	%i0,	%g6
	ldd	[%l7 + 0x38],	%f16
	or	%o5,	0x190D,	%i7
	movre	%o4,	%g2,	%o3
	xorcc	%l0,	%o7,	%l3
	movneg	%xcc,	%l1,	%l4
	fmovrsgez	%g3,	%f21,	%f10
	sub	%g7,	%g5,	%o6
	array8	%l5,	%i3,	%i2
	edge8	%i1,	%l2,	%o0
	ldsb	[%l7 + 0x34],	%i4
	edge32n	%l6,	%i6,	%o1
	edge32n	%g1,	%g4,	%o2
	edge16	%i0,	%i5,	%g6
	nop
	set	0x30, %i3
	ldsw	[%l7 + %i3],	%o5
	xorcc	%o4,	0x0EDD,	%g2
	ldsb	[%l7 + 0x0F],	%o3
	array16	%l0,	%o7,	%l3
	edge32n	%l1,	%i7,	%g3
	stx	%g7,	[%l7 + 0x08]
	andcc	%g5,	0x03EB,	%l4
	fexpand	%f30,	%f20
	ldsh	[%l7 + 0x3A],	%l5
	stw	%o6,	[%l7 + 0x78]
	save %i3, %i2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f30,	%f19
	fmovrslz	%o0,	%f4,	%f2
	movneg	%icc,	%i4,	%l6
	fmovrslez	%i1,	%f30,	%f31
	stx	%i6,	[%l7 + 0x40]
	movl	%xcc,	%o1,	%g1
	movneg	%xcc,	%g4,	%o2
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	movpos	%xcc,	%o5,	%g2
	addc	%o4,	%l0,	%o3
	ldd	[%l7 + 0x18],	%o6
	edge16n	%l1,	%i7,	%l3
	nop
	set	0x20, %g7
	ldsh	[%l7 + %g7],	%g7
	move	%xcc,	%g3,	%g5
	edge16ln	%l5,	%o6,	%i3
	udivx	%i2,	0x1ADC,	%l2
	ld	[%l7 + 0x20],	%f9
	subcc	%o0,	%l4,	%i4
	movgu	%xcc,	%l6,	%i6
	and	%i1,	0x0C82,	%g1
	fcmpne32	%f18,	%f4,	%g4
	edge16ln	%o1,	%i5,	%g6
	udiv	%o2,	0x10F1,	%i0
	edge32	%o5,	%g2,	%o4
	fpadd32	%f6,	%f0,	%f0
	andn	%o3,	%l0,	%l1
	edge32l	%i7,	%l3,	%o7
	movgu	%icc,	%g7,	%g5
	edge32n	%l5,	%o6,	%g3
	movleu	%icc,	%i3,	%l2
	fmovse	%icc,	%f18,	%f6
	xorcc	%o0,	0x0284,	%l4
	orcc	%i4,	0x1261,	%i2
	subccc	%l6,	0x13F7,	%i6
	sra	%g1,	%i1,	%g4
	move	%icc,	%i5,	%o1
	lduw	[%l7 + 0x0C],	%o2
	edge16ln	%g6,	%i0,	%o5
	fmovdpos	%icc,	%f30,	%f6
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%o4
	subc	%g2,	0x135A,	%l0
	sll	%o3,	%l1,	%l3
	fcmps	%fcc0,	%f0,	%f16
	smul	%i7,	0x1037,	%o7
	movcs	%icc,	%g5,	%l5
	alignaddrl	%o6,	%g7,	%i3
	ldsb	[%l7 + 0x2A],	%l2
	fmovsn	%icc,	%f7,	%f17
	edge8	%g3,	%o0,	%i4
	sdivx	%l4,	0x1BF2,	%i2
	sir	0x192E
	movneg	%xcc,	%i6,	%l6
	sir	0x08E1
	nop
	set	0x48, %i2
	stw	%i1,	[%l7 + %i2]
	mulscc	%g4,	0x11A3,	%i5
	orn	%o1,	0x1E37,	%g1
	save %o2, 0x0974, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	0x28E,	%o4
	subc	%g2,	0x0786,	%l0
	movne	%icc,	%o5,	%l1
	edge32n	%l3,	%i7,	%o7
	subc	%o3,	0x1330,	%l5
	movneg	%xcc,	%g5,	%g7
	fpsub32	%f26,	%f10,	%f26
	edge16l	%i3,	%l2,	%o6
	movge	%icc,	%g3,	%o0
	fmovsl	%icc,	%f1,	%f26
	std	%f6,	[%l7 + 0x68]
	fzeros	%f7
	srl	%l4,	%i4,	%i6
	edge16	%l6,	%i1,	%i2
	edge16ln	%g4,	%i5,	%g1
	movne	%icc,	%o2,	%i0
	ldsw	[%l7 + 0x34],	%g6
	addccc	%o1,	0x032A,	%g2
	sdivx	%l0,	0x1FDF,	%o5
	lduw	[%l7 + 0x70],	%o4
	array16	%l1,	%i7,	%o7
	fmovrdlz	%o3,	%f26,	%f2
	fcmpd	%fcc2,	%f10,	%f24
	srax	%l3,	0x00,	%g5
	ldsw	[%l7 + 0x1C],	%g7
	orcc	%i3,	0x0522,	%l5
	fmovrdgez	%l2,	%f0,	%f20
	movcs	%icc,	%g3,	%o6
	subcc	%o0,	%i4,	%i6
	orcc	%l4,	%l6,	%i2
	nop
	set	0x34, %l0
	stw	%i1,	[%l7 + %l0]
	add	%i5,	0x0F4D,	%g4
	edge32n	%o2,	%g1,	%g6
	save %o1, 0x0BB1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l0,	%o5
	ldd	[%l7 + 0x40],	%o4
	movre	%l1,	0x3DD,	%i7
	ldsw	[%l7 + 0x30],	%g2
	andn	%o7,	%o3,	%l3
	udivx	%g7,	0x1DEE,	%i3
	fpadd32s	%f6,	%f19,	%f11
	fmovdl	%icc,	%f29,	%f24
	sllx	%l5,	0x06,	%l2
	fmovdvc	%icc,	%f30,	%f11
	movrne	%g3,	0x096,	%o6
	sdivx	%g5,	0x14E0,	%o0
	fmovse	%xcc,	%f7,	%f25
	umul	%i6,	0x1F39,	%l4
	sethi	0x1A1E,	%i4
	stx	%i2,	[%l7 + 0x70]
	andn	%i1,	%l6,	%g4
	addccc	%o2,	%i5,	%g1
	movrne	%o1,	0x31F,	%i0
	ldub	[%l7 + 0x4A],	%g6
	orn	%l0,	0x0B3B,	%o5
	lduw	[%l7 + 0x50],	%o4
	edge16l	%l1,	%i7,	%g2
	fandnot1s	%f20,	%f26,	%f6
	ldsw	[%l7 + 0x14],	%o3
	ldx	[%l7 + 0x38],	%o7
	movpos	%xcc,	%g7,	%i3
	umulcc	%l3,	0x0575,	%l2
	edge16	%l5,	%o6,	%g5
	add	%o0,	0x063D,	%g3
	umulcc	%l4,	0x119D,	%i4
	movle	%xcc,	%i2,	%i6
	srlx	%i1,	0x05,	%l6
	orn	%g4,	0x14A6,	%o2
	udivx	%g1,	0x13E7,	%i5
	sll	%o1,	0x02,	%i0
	edge32	%g6,	%o5,	%o4
	movrgez	%l0,	%i7,	%l1
	ldd	[%l7 + 0x48],	%o2
	addc	%o7,	0x0250,	%g2
	edge8ln	%g7,	%i3,	%l2
	orncc	%l5,	0x075C,	%o6
	sll	%g5,	%o0,	%l3
	alignaddr	%l4,	%g3,	%i4
	subcc	%i6,	0x029F,	%i1
	movl	%xcc,	%i2,	%l6
	xnor	%o2,	0x1C62,	%g4
	add	%g1,	0x0510,	%o1
	popc	0x053D,	%i0
	sdivcc	%g6,	0x19C2,	%i5
	lduw	[%l7 + 0x68],	%o4
	srl	%o5,	0x0F,	%l0
	subc	%i7,	0x1712,	%l1
	add	%o7,	0x0342,	%g2
	fornot2	%f30,	%f4,	%f20
	lduh	[%l7 + 0x60],	%o3
	movrgz	%i3,	%l2,	%g7
	alignaddrl	%l5,	%g5,	%o6
	fmul8ulx16	%f8,	%f18,	%f8
	sdiv	%l3,	0x023D,	%o0
	subcc	%g3,	0x15C7,	%i4
	fornot2s	%f13,	%f12,	%f21
	srlx	%i6,	%i1,	%l4
	movrlz	%l6,	0x216,	%o2
	udivx	%i2,	0x03B1,	%g1
	lduh	[%l7 + 0x54],	%o1
	stw	%i0,	[%l7 + 0x74]
	lduw	[%l7 + 0x64],	%g4
	popc	%i5,	%o4
	fabsd	%f28,	%f0
	ldx	[%l7 + 0x30],	%g6
	sra	%l0,	%o5,	%i7
	ldd	[%l7 + 0x48],	%l0
	smul	%o7,	0x0387,	%g2
	st	%f27,	[%l7 + 0x40]
	movrgz	%o3,	%i3,	%l2
	fcmpd	%fcc2,	%f24,	%f20
	ldsh	[%l7 + 0x7E],	%l5
	sdivcc	%g5,	0x0F51,	%o6
	fpsub32s	%f31,	%f3,	%f6
	movpos	%icc,	%g7,	%o0
	umulcc	%g3,	%i4,	%i6
	fmovdg	%xcc,	%f19,	%f18
	array8	%l3,	%l4,	%i1
	orn	%o2,	0x1187,	%i2
	udiv	%g1,	0x1E89,	%o1
	sir	0x00CD
	ldd	[%l7 + 0x08],	%i0
	fxnors	%f2,	%f15,	%f26
	sdivx	%l6,	0x14F0,	%g4
	movg	%icc,	%o4,	%i5
	fmovscc	%icc,	%f21,	%f28
	or	%g6,	%o5,	%i7
	stb	%l1,	[%l7 + 0x11]
	fsrc2s	%f0,	%f5
	fpsub32	%f14,	%f18,	%f0
	sir	0x023A
	xnorcc	%l0,	%o7,	%o3
	xnor	%i3,	0x0B4F,	%g2
	movcc	%xcc,	%l5,	%g5
	fmovrsne	%l2,	%f5,	%f11
	edge8n	%o6,	%g7,	%g3
	fmovdcs	%icc,	%f26,	%f0
	movn	%icc,	%o0,	%i6
	umulcc	%i4,	%l4,	%l3
	fandnot2s	%f10,	%f10,	%f5
	sdivcc	%i1,	0x077A,	%o2
	addc	%g1,	0x197C,	%o1
	addccc	%i2,	%i0,	%l6
	fmovdl	%xcc,	%f2,	%f3
	xnorcc	%o4,	0x13D2,	%g4
	fmovrslez	%g6,	%f8,	%f25
	or	%i5,	%i7,	%l1
	alignaddrl	%o5,	%o7,	%l0
	andcc	%o3,	0x1660,	%g2
	xnor	%l5,	%i3,	%g5
	fornot1	%f2,	%f2,	%f24
	xnor	%o6,	%g7,	%l2
	movcs	%icc,	%g3,	%i6
	fxors	%f26,	%f10,	%f9
	fmovda	%icc,	%f29,	%f13
	andcc	%i4,	0x1F33,	%o0
	movrgz	%l3,	0x0A5,	%i1
	st	%f9,	[%l7 + 0x1C]
	faligndata	%f10,	%f16,	%f18
	fmovsvc	%xcc,	%f20,	%f31
	xnor	%l4,	0x0DB7,	%g1
	ldsw	[%l7 + 0x0C],	%o2
	udiv	%o1,	0x05C2,	%i2
	or	%i0,	%l6,	%g4
	stw	%o4,	[%l7 + 0x78]
	ld	[%l7 + 0x3C],	%f17
	fandnot2	%f14,	%f4,	%f30
	std	%f10,	[%l7 + 0x40]
	movvc	%icc,	%g6,	%i7
	smul	%l1,	0x0960,	%i5
	udivcc	%o7,	0x1688,	%o5
	srax	%o3,	0x13,	%l0
	smulcc	%g2,	0x09D9,	%i3
	ldd	[%l7 + 0x10],	%f4
	lduh	[%l7 + 0x40],	%g5
	bshuffle	%f30,	%f16,	%f4
	edge32	%o6,	%g7,	%l2
	movvs	%xcc,	%g3,	%l5
	ldd	[%l7 + 0x78],	%i6
	sll	%i4,	%l3,	%o0
	srl	%l4,	0x02,	%g1
	addccc	%o2,	%o1,	%i2
	edge8l	%i0,	%i1,	%g4
	fornot2s	%f10,	%f11,	%f15
	movcc	%xcc,	%o4,	%l6
	fmovrsne	%g6,	%f7,	%f24
	fnot2s	%f2,	%f28
	fmul8sux16	%f12,	%f8,	%f26
	xnor	%i7,	0x0257,	%i5
	array32	%o7,	%l1,	%o3
	array16	%o5,	%g2,	%i3
	edge8l	%g5,	%l0,	%g7
	movvc	%xcc,	%l2,	%g3
	edge32l	%o6,	%i6,	%i4
	fmovsg	%icc,	%f6,	%f16
	edge32	%l5,	%o0,	%l4
	fmovsn	%icc,	%f15,	%f1
	ld	[%l7 + 0x78],	%f30
	xor	%l3,	0x1F71,	%g1
	movge	%xcc,	%o2,	%i2
	movrlez	%i0,	0x21B,	%i1
	addccc	%g4,	%o1,	%o4
	edge32l	%l6,	%i7,	%g6
	movne	%icc,	%i5,	%o7
	ldd	[%l7 + 0x28],	%f14
	udiv	%l1,	0x01E8,	%o5
	stb	%o3,	[%l7 + 0x6E]
	movrgz	%g2,	%g5,	%l0
	udivcc	%g7,	0x11D6,	%l2
	edge16	%g3,	%o6,	%i3
	mulx	%i6,	%l5,	%o0
	mulscc	%l4,	0x1071,	%l3
	movrgez	%i4,	0x30B,	%g1
	subcc	%o2,	%i0,	%i1
	ldsw	[%l7 + 0x58],	%g4
	fmovsvs	%xcc,	%f12,	%f5
	mova	%icc,	%i2,	%o4
	restore %l6, 0x1EF5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o1,	%i5
	addccc	%o7,	%g6,	%l1
	mova	%xcc,	%o3,	%g2
	alignaddr	%o5,	%g5,	%g7
	srax	%l0,	0x0A,	%g3
	edge16ln	%o6,	%i3,	%i6
	alignaddr	%l5,	%l2,	%o0
	srl	%l3,	0x16,	%i4
	edge16l	%l4,	%o2,	%g1
	fpsub32	%f4,	%f14,	%f4
	fandnot1s	%f7,	%f15,	%f23
	ldsb	[%l7 + 0x45],	%i0
	smul	%g4,	0x06D4,	%i2
	fmovsle	%xcc,	%f31,	%f19
	st	%f0,	[%l7 + 0x44]
	sra	%o4,	0x1B,	%i1
	edge32n	%l6,	%o1,	%i7
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	sub	%o3,	%g2,	%l1
	movpos	%icc,	%g5,	%g7
	ldx	[%l7 + 0x58],	%o5
	srlx	%g3,	0x1E,	%o6
	fcmple16	%f2,	%f18,	%i3
	fpackfix	%f2,	%f21
	sdiv	%i6,	0x13EB,	%l0
	edge16ln	%l2,	%l5,	%o0
	fmovsne	%xcc,	%f23,	%f29
	sra	%l3,	0x16,	%l4
	fnegs	%f22,	%f16
	fmovdle	%icc,	%f15,	%f18
	edge16n	%o2,	%i4,	%i0
	fandnot2	%f14,	%f22,	%f10
	ldsb	[%l7 + 0x32],	%g1
	std	%f24,	[%l7 + 0x68]
	subc	%g4,	%i2,	%o4
	stw	%l6,	[%l7 + 0x2C]
	bshuffle	%f8,	%f20,	%f26
	fxnors	%f13,	%f31,	%f9
	movg	%icc,	%o1,	%i7
	fors	%f16,	%f1,	%f8
	movleu	%xcc,	%i1,	%i5
	move	%xcc,	%o7,	%o3
	movleu	%xcc,	%g6,	%l1
	edge8ln	%g2,	%g7,	%g5
	udivcc	%g3,	0x1B9A,	%o5
	subcc	%o6,	%i6,	%l0
	orn	%l2,	%i3,	%o0
	edge32	%l5,	%l4,	%l3
	sll	%i4,	%o2,	%i0
	and	%g4,	0x1F80,	%g1
	fcmpeq32	%f12,	%f14,	%i2
	array16	%o4,	%o1,	%i7
	sdivx	%i1,	0x05A9,	%l6
	andn	%i5,	0x190A,	%o3
	fmovscc	%icc,	%f6,	%f9
	lduh	[%l7 + 0x48],	%g6
	fmovdcs	%xcc,	%f28,	%f19
	fmovdgu	%icc,	%f22,	%f23
	array32	%o7,	%g2,	%l1
	movgu	%icc,	%g5,	%g7
	sth	%g3,	[%l7 + 0x7C]
	add	%o6,	0x0A04,	%o5
	udivx	%l0,	0x067E,	%i6
	movl	%icc,	%i3,	%o0
	fmul8x16	%f2,	%f10,	%f4
	edge8	%l5,	%l4,	%l2
	movrgez	%l3,	0x318,	%o2
	sethi	0x1A5D,	%i0
	array16	%g4,	%g1,	%i4
	orcc	%o4,	0x059C,	%o1
	sethi	0x0683,	%i2
	edge8n	%i1,	%i7,	%l6
	sir	0x1E1C
	save %i5, %g6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g2,	%o3,	%g5
	movge	%icc,	%g7,	%g3
	movg	%xcc,	%l1,	%o5
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%f0
	movrlez	%l0,	%i6,	%i3
	fnand	%f30,	%f20,	%f16
	fxor	%f12,	%f12,	%f10
	movvc	%icc,	%o0,	%o6
	udivcc	%l4,	0x12E7,	%l2
	edge8l	%l3,	%o2,	%l5
	move	%icc,	%g4,	%i0
	srl	%g1,	%o4,	%i4
	save %o1, 0x1572, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x38]
	fxor	%f12,	%f10,	%f22
	andn	%i1,	%i7,	%l6
	movrlz	%i5,	%o7,	%g6
	array16	%o3,	%g2,	%g7
	srl	%g5,	0x16,	%g3
	fsrc1s	%f9,	%f26
	array32	%o5,	%l0,	%i6
	std	%f14,	[%l7 + 0x30]
	stb	%i3,	[%l7 + 0x10]
	stx	%l1,	[%l7 + 0x40]
	edge8ln	%o0,	%o6,	%l2
	srlx	%l4,	%l3,	%o2
	movne	%icc,	%g4,	%l5
	sdiv	%g1,	0x0A61,	%o4
	sllx	%i4,	0x04,	%o1
	edge16l	%i0,	%i1,	%i2
	alignaddr	%l6,	%i7,	%i5
	movg	%xcc,	%o7,	%o3
	sethi	0x1042,	%g2
	movcc	%xcc,	%g7,	%g6
	movne	%xcc,	%g3,	%o5
	xor	%l0,	%g5,	%i6
	movl	%xcc,	%l1,	%i3
	sllx	%o0,	0x0B,	%o6
	fnands	%f21,	%f19,	%f4
	fmovrslez	%l4,	%f6,	%f9
	ldub	[%l7 + 0x4A],	%l3
	movneg	%xcc,	%o2,	%l2
	fxors	%f9,	%f29,	%f3
	st	%f13,	[%l7 + 0x78]
	fones	%f11
	sdiv	%g4,	0x02CD,	%l5
	fmovsgu	%icc,	%f18,	%f30
	movvc	%xcc,	%g1,	%i4
	movvs	%xcc,	%o1,	%i0
	edge16ln	%o4,	%i1,	%i2
	sethi	0x0BC5,	%l6
	movcc	%xcc,	%i5,	%i7
	xor	%o7,	0x1490,	%g2
	fmovrse	%o3,	%f25,	%f23
	movl	%xcc,	%g7,	%g3
	xor	%g6,	0x0461,	%o5
	movrgez	%l0,	%g5,	%i6
	ld	[%l7 + 0x50],	%f18
	sth	%i3,	[%l7 + 0x5A]
	fmovda	%xcc,	%f19,	%f24
	and	%l1,	%o6,	%o0
	fcmpne16	%f28,	%f0,	%l4
	sth	%l3,	[%l7 + 0x0E]
	fmovsl	%icc,	%f29,	%f9
	stb	%o2,	[%l7 + 0x63]
	popc	%g4,	%l2
	sub	%g1,	%i4,	%l5
	movrlz	%i0,	0x00D,	%o1
	fpadd16s	%f11,	%f29,	%f31
	alignaddr	%i1,	%i2,	%o4
	udivcc	%i5,	0x1CD0,	%i7
	add	%l6,	%o7,	%o3
	fpadd16s	%f23,	%f7,	%f5
	sdiv	%g2,	0x0BF0,	%g3
	orn	%g6,	%o5,	%g7
	movle	%icc,	%g5,	%l0
	fmovsne	%xcc,	%f7,	%f5
	stw	%i3,	[%l7 + 0x28]
	addc	%l1,	%i6,	%o0
	array16	%o6,	%l3,	%o2
	fnot1s	%f4,	%f17
	andcc	%l4,	%l2,	%g1
	movg	%xcc,	%i4,	%l5
	edge16n	%g4,	%i0,	%o1
	umulcc	%i1,	0x180A,	%i2
	edge8ln	%o4,	%i5,	%i7
	movrlez	%l6,	0x293,	%o3
	subccc	%g2,	0x041D,	%g3
	nop
	set	0x78, %o2
	lduw	[%l7 + %o2],	%o7
	movneg	%icc,	%g6,	%g7
	restore %o5, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f20,	%f6
	stw	%l0,	[%l7 + 0x68]
	stb	%i6,	[%l7 + 0x56]
	udivx	%o0,	0x0350,	%o6
	movcc	%xcc,	%l3,	%l1
	xor	%l4,	%o2,	%g1
	movneg	%xcc,	%l2,	%i4
	fmovdge	%icc,	%f11,	%f23
	sdiv	%l5,	0x0B4B,	%g4
	sdivx	%o1,	0x00FF,	%i0
	stx	%i1,	[%l7 + 0x68]
	srl	%o4,	0x09,	%i2
	smulcc	%i7,	0x07D9,	%l6
	fmovdcc	%xcc,	%f20,	%f19
	save %i5, 0x1513, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f20,	%f3,	%f4
	fmovdne	%xcc,	%f18,	%f17
	movge	%icc,	%g3,	%o7
	st	%f5,	[%l7 + 0x44]
	fornot1s	%f7,	%f31,	%f31
	ldd	[%l7 + 0x10],	%o2
	lduh	[%l7 + 0x68],	%g6
	ld	[%l7 + 0x60],	%f29
	nop
	set	0x56, %g1
	ldub	[%l7 + %g1],	%o5
	fnor	%f10,	%f12,	%f28
	edge32	%g7,	%g5,	%i3
	edge32	%i6,	%o0,	%l0
	edge8l	%o6,	%l3,	%l1
	move	%icc,	%l4,	%g1
	array32	%o2,	%l2,	%i4
	movrgz	%l5,	%o1,	%i0
	edge32l	%g4,	%o4,	%i1
	alignaddrl	%i7,	%i2,	%l6
	srlx	%g2,	%i5,	%g3
	fabss	%f18,	%f4
	movcs	%xcc,	%o3,	%o7
	srl	%o5,	0x00,	%g6
	edge16l	%g7,	%g5,	%i3
	sub	%i6,	%l0,	%o6
	movrlez	%l3,	0x03A,	%l1
	sllx	%l4,	0x04,	%o0
	sllx	%o2,	0x12,	%g1
	array8	%l2,	%l5,	%i4
	fandnot2	%f22,	%f28,	%f0
	andcc	%o1,	%i0,	%o4
	lduw	[%l7 + 0x18],	%g4
	movrgez	%i1,	%i2,	%i7
	stw	%l6,	[%l7 + 0x40]
	umulcc	%g2,	0x1B27,	%g3
	ldsh	[%l7 + 0x24],	%o3
	fcmps	%fcc2,	%f6,	%f27
	edge8n	%o7,	%o5,	%i5
	sdiv	%g6,	0x0EF2,	%g7
	orn	%g5,	%i6,	%l0
	fmovscs	%icc,	%f13,	%f4
	ldsb	[%l7 + 0x13],	%o6
	movne	%icc,	%i3,	%l1
	fand	%f8,	%f4,	%f0
	add	%l4,	0x0607,	%l3
	fnot2s	%f23,	%f3
	xorcc	%o0,	0x14CC,	%g1
	fcmple16	%f2,	%f26,	%o2
	movleu	%xcc,	%l2,	%i4
	movcc	%xcc,	%o1,	%i0
	sdivcc	%o4,	0x1AA2,	%g4
	movg	%icc,	%l5,	%i2
	popc	%i7,	%i1
	orncc	%g2,	0x0BDA,	%g3
	udiv	%o3,	0x07B3,	%l6
	addcc	%o7,	%o5,	%g6
	stx	%i5,	[%l7 + 0x40]
	edge8l	%g7,	%g5,	%l0
	ld	[%l7 + 0x0C],	%f28
	movle	%xcc,	%o6,	%i6
	stb	%i3,	[%l7 + 0x71]
	fcmple32	%f10,	%f8,	%l1
	addcc	%l3,	%o0,	%l4
	sra	%g1,	%l2,	%i4
	subcc	%o2,	0x17F5,	%i0
	fpmerge	%f31,	%f12,	%f8
	pdist	%f14,	%f16,	%f4
	sub	%o1,	0x1AEB,	%g4
	ldsb	[%l7 + 0x16],	%l5
	add	%i2,	%o4,	%i1
	movge	%icc,	%i7,	%g2
	fnegd	%f6,	%f12
	fnand	%f12,	%f14,	%f0
	orcc	%o3,	0x04C3,	%g3
	fcmpgt32	%f22,	%f8,	%o7
	movneg	%icc,	%l6,	%o5
	faligndata	%f0,	%f10,	%f24
	sdivx	%i5,	0x095D,	%g7
	array8	%g6,	%l0,	%g5
	edge32l	%o6,	%i6,	%i3
	lduh	[%l7 + 0x66],	%l1
	fone	%f10
	movle	%icc,	%o0,	%l4
	subcc	%l3,	%g1,	%l2
	fmovdl	%xcc,	%f6,	%f27
	subccc	%o2,	%i4,	%o1
	sra	%g4,	%l5,	%i2
	movrgez	%o4,	0x0CB,	%i0
	movcc	%xcc,	%i7,	%i1
	fmovdcs	%icc,	%f6,	%f5
	stx	%o3,	[%l7 + 0x60]
	fmovsg	%icc,	%f11,	%f8
	movvc	%xcc,	%g3,	%o7
	sllx	%g2,	0x0E,	%o5
	ld	[%l7 + 0x5C],	%f9
	ld	[%l7 + 0x54],	%f4
	mova	%xcc,	%l6,	%i5
	fcmple16	%f0,	%f12,	%g6
	alignaddr	%g7,	%l0,	%g5
	save %o6, %i3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l1,	%o0,	%l4
	edge16n	%l3,	%l2,	%o2
	fnor	%f18,	%f28,	%f26
	mova	%icc,	%g1,	%o1
	movrlz	%i4,	%g4,	%l5
	fnot1	%f16,	%f18
	lduw	[%l7 + 0x3C],	%o4
	fmovrslez	%i0,	%f4,	%f24
	edge16ln	%i2,	%i1,	%o3
	fnands	%f13,	%f26,	%f11
	andncc	%g3,	%i7,	%g2
	st	%f20,	[%l7 + 0x08]
	lduh	[%l7 + 0x4A],	%o7
	fmuld8ulx16	%f13,	%f4,	%f18
	mulscc	%l6,	0x0F5A,	%i5
	edge16	%o5,	%g6,	%l0
	fmovrsgez	%g7,	%f10,	%f2
	and	%g5,	%o6,	%i6
	fandnot1s	%f7,	%f2,	%f15
	array32	%i3,	%o0,	%l1
	movn	%icc,	%l4,	%l3
	or	%o2,	%l2,	%o1
	xnor	%i4,	0x07AE,	%g4
	movge	%icc,	%g1,	%l5
	sdivx	%o4,	0x07D4,	%i2
	movg	%icc,	%i1,	%i0
	fandnot2s	%f1,	%f20,	%f20
	edge8	%o3,	%g3,	%g2
	edge16ln	%o7,	%l6,	%i5
	andncc	%o5,	%i7,	%g6
	smulcc	%g7,	0x12EC,	%g5
	movrlz	%o6,	0x070,	%l0
	fcmpgt16	%f24,	%f14,	%i6
	fandnot1s	%f12,	%f11,	%f22
	fabss	%f5,	%f31
	nop
	set	0x3F, %i0
	ldub	[%l7 + %i0],	%i3
	edge8l	%o0,	%l1,	%l4
	movl	%xcc,	%o2,	%l3
	movne	%xcc,	%o1,	%l2
	movcs	%icc,	%i4,	%g4
	ldub	[%l7 + 0x7C],	%l5
	sethi	0x02CD,	%g1
	stx	%o4,	[%l7 + 0x60]
	nop
	set	0x70, %g2
	stx	%i2,	[%l7 + %g2]
	lduw	[%l7 + 0x70],	%i1
	mova	%xcc,	%i0,	%o3
	sdivcc	%g2,	0x0474,	%o7
	movrgz	%g3,	%i5,	%l6
	alignaddr	%i7,	%o5,	%g7
	andcc	%g6,	0x16DA,	%o6
	edge16	%l0,	%i6,	%g5
	ldd	[%l7 + 0x20],	%f2
	fzeros	%f10
	sth	%i3,	[%l7 + 0x28]
	stx	%l1,	[%l7 + 0x08]
	add	%l4,	%o2,	%o0
	alignaddrl	%l3,	%l2,	%i4
	ldd	[%l7 + 0x40],	%f2
	mulscc	%g4,	%o1,	%g1
	alignaddrl	%l5,	%i2,	%i1
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	andcc	%i0,	0x0B15,	%o7
	movge	%icc,	%i5,	%g3
	addc	%l6,	0x1F04,	%o5
	subcc	%g7,	0x09CB,	%i7
	andncc	%g6,	%l0,	%i6
	xnorcc	%g5,	%i3,	%l1
	movl	%xcc,	%o6,	%o2
	fmovsge	%icc,	%f29,	%f15
	srax	%o0,	0x14,	%l4
	movneg	%xcc,	%l3,	%i4
	add	%l2,	%o1,	%g1
	fmovdneg	%xcc,	%f15,	%f24
	movle	%xcc,	%g4,	%i2
	edge32l	%l5,	%i1,	%o3
	sdivx	%g2,	0x04E2,	%i0
	stx	%o7,	[%l7 + 0x38]
	sth	%i5,	[%l7 + 0x52]
	fmovsleu	%xcc,	%f20,	%f19
	alignaddrl	%g3,	%o4,	%o5
	edge8	%l6,	%g7,	%g6
	fmovdcc	%xcc,	%f28,	%f7
	fmovdpos	%icc,	%f2,	%f10
	movgu	%xcc,	%i7,	%l0
	pdist	%f28,	%f10,	%f12
	srax	%g5,	%i6,	%l1
	popc	0x1EA2,	%o6
	smulcc	%o2,	%i3,	%o0
	fxnors	%f19,	%f17,	%f25
	udiv	%l3,	0x04EB,	%l4
	edge16l	%l2,	%i4,	%g1
	sdivx	%g4,	0x16C3,	%o1
	edge32	%i2,	%l5,	%i1
	edge32l	%g2,	%o3,	%i0
	fornot1	%f14,	%f4,	%f22
	ldsb	[%l7 + 0x4E],	%i5
	xnorcc	%g3,	0x0065,	%o7
	sra	%o5,	0x0B,	%o4
	mulscc	%l6,	%g6,	%i7
	sdiv	%l0,	0x1DF7,	%g5
	fpsub32	%f10,	%f0,	%f0
	pdist	%f14,	%f28,	%f14
	popc	0x130E,	%i6
	fnands	%f9,	%f24,	%f14
	fandnot2s	%f16,	%f30,	%f1
	nop
	set	0x3C, %i4
	lduw	[%l7 + %i4],	%g7
	movpos	%icc,	%o6,	%o2
	orcc	%l1,	%o0,	%l3
	movrgez	%l4,	%i3,	%i4
	mulx	%g1,	0x11D4,	%l2
	sll	%g4,	%o1,	%l5
	ld	[%l7 + 0x58],	%f4
	mova	%icc,	%i1,	%g2
	lduh	[%l7 + 0x0A],	%i2
	movrlz	%o3,	%i0,	%g3
	fsrc2	%f20,	%f16
	edge32l	%o7,	%i5,	%o5
	fpadd16	%f28,	%f28,	%f30
	movre	%o4,	%l6,	%i7
	edge16ln	%g6,	%g5,	%i6
	array8	%l0,	%o6,	%o2
	ldsb	[%l7 + 0x48],	%g7
	xnorcc	%l1,	%l3,	%l4
	edge16n	%i3,	%o0,	%i4
	move	%icc,	%g1,	%l2
	mulscc	%o1,	%g4,	%l5
	or	%i1,	0x1207,	%i2
	smul	%g2,	%i0,	%o3
	xor	%g3,	%o7,	%o5
	sethi	0x01B5,	%i5
	movrgez	%l6,	0x02B,	%o4
	movrne	%i7,	%g6,	%g5
	ldx	[%l7 + 0x70],	%i6
	fmovrdne	%o6,	%f28,	%f30
	edge32	%l0,	%o2,	%g7
	sub	%l3,	0x040A,	%l4
	movge	%icc,	%i3,	%o0
	movl	%icc,	%i4,	%l1
	nop
	set	0x20, %l6
	stb	%g1,	[%l7 + %l6]
	udivcc	%l2,	0x0D79,	%g4
	fcmpd	%fcc1,	%f22,	%f26
	fmul8x16	%f16,	%f10,	%f22
	andncc	%l5,	%i1,	%i2
	edge32l	%g2,	%o1,	%i0
	popc	%g3,	%o7
	movcc	%xcc,	%o3,	%o5
	nop
	set	0x71, %o5
	ldsb	[%l7 + %o5],	%i5
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f22
	and	%o4,	%l6,	%i7
	mulscc	%g6,	%g5,	%o6
	orncc	%l0,	%o2,	%i6
	mova	%icc,	%g7,	%l4
	fors	%f24,	%f15,	%f21
	sra	%i3,	0x00,	%o0
	smulcc	%i4,	0x1A97,	%l3
	fand	%f20,	%f6,	%f16
	fmovdn	%icc,	%f30,	%f19
	movn	%xcc,	%g1,	%l2
	umulcc	%l1,	%l5,	%i1
	lduw	[%l7 + 0x74],	%g4
	faligndata	%f8,	%f8,	%f26
	fpsub16	%f10,	%f6,	%f14
	addccc	%g2,	0x0CAA,	%o1
	movcs	%xcc,	%i2,	%i0
	edge16n	%o7,	%o3,	%g3
	xnor	%i5,	%o5,	%o4
	array32	%i7,	%l6,	%g6
	fpadd16	%f26,	%f0,	%f4
	fmovdcs	%xcc,	%f29,	%f31
	and	%g5,	%l0,	%o2
	fmovdvs	%icc,	%f14,	%f17
	ldsb	[%l7 + 0x38],	%o6
	fmovdcc	%xcc,	%f3,	%f22
	edge8ln	%g7,	%l4,	%i3
	srax	%o0,	0x16,	%i4
	umulcc	%l3,	0x1227,	%g1
	ldsh	[%l7 + 0x14],	%i6
	fsrc2s	%f20,	%f25
	smulcc	%l1,	0x128D,	%l2
	umulcc	%l5,	%g4,	%g2
	fmovsvs	%xcc,	%f3,	%f15
	sub	%i1,	%o1,	%i2
	addcc	%o7,	%o3,	%i0
	edge16	%g3,	%o5,	%i5
	fpsub16s	%f18,	%f25,	%f19
	sub	%o4,	%l6,	%i7
	movrgez	%g5,	%l0,	%o2
	edge32ln	%g6,	%g7,	%l4
	fcmps	%fcc0,	%f9,	%f22
	andn	%i3,	0x01E8,	%o0
	edge32	%o6,	%l3,	%g1
	movle	%xcc,	%i4,	%i6
	addcc	%l2,	%l5,	%l1
	sra	%g2,	0x11,	%g4
	movre	%o1,	%i2,	%o7
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%o2
	addcc	%i0,	0x0F06,	%i1
	array8	%g3,	%i5,	%o4
	add	%l6,	%o5,	%i7
	movg	%xcc,	%l0,	%g5
	edge16ln	%g6,	%o2,	%l4
	xorcc	%i3,	%g7,	%o6
	xnor	%o0,	%g1,	%l3
	andcc	%i4,	%i6,	%l5
	sll	%l2,	0x00,	%l1
	fmovsneg	%icc,	%f0,	%f21
	fcmpne32	%f4,	%f8,	%g4
	xnorcc	%o1,	0x1467,	%g2
	movcc	%xcc,	%o7,	%i2
	fmovda	%xcc,	%f26,	%f0
	movle	%icc,	%o3,	%i0
	fmovsa	%icc,	%f28,	%f28
	movn	%xcc,	%i1,	%i5
	fnot2s	%f20,	%f6
	smul	%g3,	%o4,	%l6
	fmul8sux16	%f26,	%f4,	%f16
	movrgz	%i7,	0x107,	%l0
	sth	%g5,	[%l7 + 0x18]
	fnand	%f16,	%f26,	%f24
	fmovrsgez	%g6,	%f25,	%f12
	fsrc2s	%f8,	%f20
	subccc	%o5,	0x1E6B,	%l4
	addcc	%o2,	%g7,	%o6
	edge16ln	%o0,	%i3,	%g1
	edge8ln	%l3,	%i4,	%i6
	movrlz	%l2,	%l5,	%g4
	movle	%xcc,	%l1,	%g2
	movre	%o1,	0x113,	%i2
	xnor	%o7,	0x15EB,	%o3
	movpos	%xcc,	%i1,	%i0
	stx	%g3,	[%l7 + 0x50]
	fmovrsne	%i5,	%f0,	%f8
	sdivx	%o4,	0x023C,	%i7
	fcmpgt16	%f2,	%f14,	%l0
	fnot2s	%f4,	%f13
	fmovdpos	%icc,	%f14,	%f9
	sdiv	%g5,	0x1544,	%g6
	andcc	%l6,	0x0ABA,	%o5
	ld	[%l7 + 0x40],	%f10
	alignaddr	%o2,	%g7,	%o6
	stx	%o0,	[%l7 + 0x70]
	xorcc	%i3,	%l4,	%l3
	movcs	%xcc,	%g1,	%i4
	fcmple16	%f28,	%f12,	%i6
	movl	%xcc,	%l2,	%g4
	fmovsvs	%icc,	%f27,	%f8
	sub	%l5,	%l1,	%g2
	orn	%i2,	%o1,	%o7
	and	%i1,	%i0,	%o3
	movrlez	%i5,	%g3,	%o4
	std	%f12,	[%l7 + 0x08]
	sllx	%i7,	0x11,	%g5
	subcc	%l0,	0x1707,	%l6
	smul	%g6,	0x1E5D,	%o5
	fmul8sux16	%f12,	%f8,	%f18
	fpsub16	%f14,	%f10,	%f24
	edge32	%g7,	%o6,	%o2
	sdiv	%o0,	0x1A10,	%l4
	alignaddr	%i3,	%g1,	%l3
	array16	%i6,	%i4,	%g4
	movrne	%l2,	0x3CD,	%l1
	add	%l5,	0x1CC5,	%i2
	movvc	%icc,	%g2,	%o7
	fmovsgu	%icc,	%f20,	%f13
	ldub	[%l7 + 0x7C],	%i1
	fmovsneg	%xcc,	%f14,	%f17
	movle	%icc,	%i0,	%o3
	sth	%i5,	[%l7 + 0x10]
	movne	%xcc,	%o1,	%g3
	movre	%i7,	0x134,	%g5
	addcc	%o4,	%l6,	%g6
	ldsw	[%l7 + 0x34],	%l0
	addc	%g7,	%o5,	%o6
	ldsw	[%l7 + 0x1C],	%o2
	ldd	[%l7 + 0x28],	%l4
	addc	%i3,	%g1,	%l3
	xnor	%i6,	%i4,	%g4
	udiv	%o0,	0x0C9D,	%l1
	sub	%l5,	0x02E0,	%i2
	ldx	[%l7 + 0x40],	%g2
	stw	%l2,	[%l7 + 0x64]
	movgu	%xcc,	%i1,	%i0
	alignaddrl	%o3,	%i5,	%o7
	ldsw	[%l7 + 0x1C],	%o1
	sll	%i7,	%g5,	%o4
	movvs	%icc,	%g3,	%l6
	fornot2s	%f11,	%f21,	%f29
	array8	%g6,	%g7,	%l0
	popc	%o6,	%o2
	array16	%o5,	%l4,	%g1
	array32	%i3,	%l3,	%i4
	lduw	[%l7 + 0x2C],	%g4
	mulx	%i6,	%l1,	%o0
	movne	%icc,	%l5,	%i2
	movleu	%icc,	%l2,	%i1
	sir	0x1D4F
	stb	%g2,	[%l7 + 0x77]
	sub	%o3,	0x0410,	%i5
	xorcc	%i0,	0x04FC,	%o1
	xor	%i7,	%o7,	%o4
	movpos	%xcc,	%g3,	%g5
	stw	%g6,	[%l7 + 0x18]
	orn	%g7,	0x0C14,	%l6
	mulscc	%o6,	%o2,	%o5
	movcc	%icc,	%l0,	%g1
	ldx	[%l7 + 0x78],	%l4
	edge32n	%l3,	%i4,	%i3
	fnot1s	%f31,	%f2
	add	%i6,	%l1,	%g4
	or	%l5,	0x1BE3,	%i2
	add	%l2,	0x0EFE,	%i1
	edge32ln	%o0,	%g2,	%i5
	edge32	%o3,	%o1,	%i0
	addc	%o7,	0x007C,	%i7
	ldsh	[%l7 + 0x44],	%o4
	edge16	%g3,	%g5,	%g7
	andncc	%l6,	%o6,	%g6
	edge32ln	%o2,	%o5,	%l0
	fmovdpos	%xcc,	%f20,	%f18
	sll	%l4,	%g1,	%i4
	ld	[%l7 + 0x24],	%f17
	movre	%l3,	%i3,	%i6
	edge16ln	%g4,	%l5,	%l1
	fxors	%f30,	%f26,	%f9
	movn	%icc,	%l2,	%i1
	movrlz	%i2,	0x33D,	%o0
	sdiv	%i5,	0x1DCE,	%o3
	movrgez	%g2,	%i0,	%o1
	sethi	0x0C0C,	%o7
	edge16	%o4,	%g3,	%g5
	sub	%i7,	%g7,	%o6
	nop
	set	0x66, %o6
	ldsh	[%l7 + %o6],	%g6
	nop
	set	0x45, %i1
	ldub	[%l7 + %i1],	%l6
	st	%f7,	[%l7 + 0x5C]
	xnorcc	%o5,	%l0,	%o2
	movne	%xcc,	%l4,	%g1
	umul	%l3,	0x029A,	%i4
	movrgz	%i6,	%g4,	%l5
	fmovsleu	%xcc,	%f25,	%f12
	nop
	set	0x1A, %o1
	ldub	[%l7 + %o1],	%l1
	fmovrdlez	%l2,	%f18,	%f20
	alignaddrl	%i1,	%i2,	%i3
	movge	%icc,	%o0,	%o3
	fmovdpos	%xcc,	%f23,	%f12
	std	%f10,	[%l7 + 0x78]
	movcc	%xcc,	%i5,	%i0
	umul	%o1,	%o7,	%g2
	movrne	%g3,	0x3DA,	%g5
	subcc	%i7,	%o4,	%g7
	edge32ln	%o6,	%g6,	%o5
	edge8	%l6,	%l0,	%l4
	sll	%g1,	0x11,	%l3
	udivx	%o2,	0x130D,	%i4
	subcc	%i6,	%l5,	%g4
	subcc	%l2,	%l1,	%i2
	sth	%i3,	[%l7 + 0x4E]
	array8	%i1,	%o0,	%o3
	ldsw	[%l7 + 0x58],	%i5
	udiv	%o1,	0x00C4,	%o7
	sra	%i0,	0x05,	%g3
	mulscc	%g5,	0x0421,	%i7
	movre	%o4,	0x364,	%g2
	ldsw	[%l7 + 0x24],	%g7
	udivx	%o6,	0x1763,	%g6
	popc	0x18CE,	%l6
	fnor	%f22,	%f10,	%f2
	andcc	%l0,	%o5,	%g1
	fsrc2s	%f10,	%f12
	movvs	%xcc,	%l3,	%o2
	edge16n	%l4,	%i4,	%l5
	movgu	%xcc,	%g4,	%l2
	fsrc2s	%f7,	%f11
	movl	%icc,	%i6,	%l1
	ldd	[%l7 + 0x70],	%i2
	restore %i1, %o0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i3,	[%l7 + 0x40]
	addc	%i5,	%o7,	%i0
	andncc	%g3,	%g5,	%o1
	mulscc	%o4,	%i7,	%g2
	movle	%icc,	%o6,	%g6
	pdist	%f24,	%f24,	%f16
	mulx	%l6,	0x1A5F,	%l0
	movrgez	%g7,	%o5,	%g1
	ld	[%l7 + 0x18],	%f5
	ldd	[%l7 + 0x08],	%f8
	sdivcc	%l3,	0x0A5F,	%o2
	fmovdge	%xcc,	%f6,	%f12
	fmovdle	%icc,	%f7,	%f9
	subccc	%i4,	0x0DB7,	%l4
	fpadd16	%f28,	%f4,	%f24
	edge8l	%g4,	%l5,	%i6
	ld	[%l7 + 0x64],	%f21
	umul	%l1,	%i2,	%i1
	lduw	[%l7 + 0x3C],	%l2
	lduw	[%l7 + 0x44],	%o0
	fsrc2s	%f18,	%f19
	lduw	[%l7 + 0x28],	%i3
	udiv	%o3,	0x0AE8,	%o7
	movre	%i0,	%i5,	%g5
	and	%o1,	%g3,	%o4
	array32	%i7,	%g2,	%g6
	smul	%l6,	%l0,	%g7
	fsrc2s	%f29,	%f23
	for	%f16,	%f14,	%f14
	fpsub16s	%f5,	%f12,	%f5
	fnot2	%f20,	%f24
	ldd	[%l7 + 0x08],	%o4
	srlx	%o6,	0x1F,	%l3
	popc	0x0C0A,	%g1
	movrne	%i4,	%l4,	%o2
	edge16	%g4,	%i6,	%l5
	edge16n	%i2,	%i1,	%l2
	edge8l	%o0,	%i3,	%o3
	movgu	%icc,	%o7,	%l1
	sethi	0x0952,	%i5
	fmovdpos	%icc,	%f13,	%f6
	array8	%i0,	%o1,	%g3
	fones	%f9
	fmovrde	%o4,	%f30,	%f14
	subcc	%i7,	%g2,	%g6
	movrlz	%g5,	%l6,	%l0
	movcc	%xcc,	%g7,	%o6
	ldsb	[%l7 + 0x4F],	%l3
	mulx	%o5,	0x1ECA,	%g1
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	srlx	%o2,	0x13,	%i6
	subcc	%i2,	%i1,	%l5
	xor	%l2,	%o0,	%i3
	fandnot2s	%f20,	%f20,	%f30
	movn	%xcc,	%o3,	%o7
	srl	%l1,	0x11,	%i0
	fxnors	%f5,	%f23,	%f22
	addcc	%i5,	0x1F3A,	%g3
	mulscc	%o4,	0x071D,	%i7
	movrgz	%g2,	%o1,	%g6
	andn	%l6,	%g5,	%g7
	fpackfix	%f2,	%f15
	lduw	[%l7 + 0x28],	%o6
	edge16l	%l0,	%o5,	%l3
	ldsh	[%l7 + 0x58],	%g1
	movrlez	%l4,	0x290,	%g4
	sth	%i4,	[%l7 + 0x60]
	sir	0x11DB
	fmovspos	%icc,	%f25,	%f2
	fcmpne16	%f16,	%f18,	%i6
	xor	%o2,	0x08EC,	%i2
	fnegd	%f6,	%f28
	sub	%l5,	0x1835,	%i1
	array8	%l2,	%i3,	%o0
	addccc	%o3,	0x0FA7,	%o7
	move	%icc,	%l1,	%i0
	sir	0x0661
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%g2
	stb	%o4,	[%l7 + 0x4E]
	addc	%i5,	0x00F9,	%g2
	xor	%o1,	0x0169,	%g6
	smulcc	%l6,	0x17A4,	%i7
	sdivx	%g5,	0x0DB5,	%g7
	movge	%icc,	%l0,	%o5
	movrne	%o6,	%g1,	%l4
	fmovsvs	%xcc,	%f14,	%f24
	andn	%g4,	0x0BF5,	%l3
	mulscc	%i4,	%o2,	%i6
	movrgz	%i2,	0x353,	%i1
	fpackfix	%f10,	%f7
	array8	%l2,	%i3,	%l5
	ldd	[%l7 + 0x68],	%f10
	movneg	%xcc,	%o3,	%o0
	fpadd32s	%f4,	%f14,	%f29
	fmovrslz	%l1,	%f9,	%f3
	edge32n	%o7,	%g3,	%o4
	lduh	[%l7 + 0x10],	%i5
	orncc	%i0,	%o1,	%g6
	st	%f18,	[%l7 + 0x4C]
	movrlez	%g2,	0x249,	%i7
	udiv	%l6,	0x17C7,	%g7
	movl	%xcc,	%l0,	%g5
	lduh	[%l7 + 0x22],	%o6
	movge	%icc,	%g1,	%o5
	nop
	set	0x29, %o0
	stb	%l4,	[%l7 + %o0]
	array32	%g4,	%l3,	%o2
	ldd	[%l7 + 0x28],	%i6
	subc	%i2,	%i1,	%l2
	movcs	%xcc,	%i3,	%l5
	movrlez	%i4,	0x2EE,	%o3
	xnor	%o0,	0x0BC4,	%o7
	orcc	%l1,	0x1302,	%o4
	fmovdle	%icc,	%f29,	%f23
	andn	%i5,	0x0098,	%g3
	fmovscs	%xcc,	%f25,	%f11
	fone	%f28
	sra	%o1,	%i0,	%g6
	movrgez	%g2,	%i7,	%l6
	nop
	set	0x52, %l3
	ldsb	[%l7 + %l3],	%l0
	edge16ln	%g5,	%g7,	%o6
	mulx	%g1,	%o5,	%l4
	ldx	[%l7 + 0x70],	%g4
	array32	%l3,	%i6,	%o2
	sll	%i2,	%l2,	%i1
	ldsb	[%l7 + 0x3B],	%i3
	udiv	%i4,	0x1BEE,	%l5
	movrgez	%o0,	0x01C,	%o7
	ld	[%l7 + 0x7C],	%f29
	smulcc	%l1,	0x1B62,	%o4
	addc	%i5,	0x13EE,	%o3
	array8	%o1,	%i0,	%g3
	orncc	%g6,	%g2,	%l6
	edge32ln	%i7,	%g5,	%l0
	mova	%icc,	%g7,	%g1
	fxor	%f10,	%f0,	%f28
	lduh	[%l7 + 0x5E],	%o6
	fandnot2s	%f14,	%f26,	%f15
	srl	%l4,	%g4,	%l3
	movle	%xcc,	%i6,	%o2
	movrlz	%i2,	0x3B3,	%l2
	andncc	%i1,	%o5,	%i4
	sth	%i3,	[%l7 + 0x46]
	fmul8sux16	%f0,	%f8,	%f26
	movg	%icc,	%o0,	%o7
	sll	%l1,	0x0B,	%l5
	alignaddrl	%o4,	%i5,	%o3
	move	%icc,	%i0,	%o1
	stx	%g3,	[%l7 + 0x18]
	sdivcc	%g2,	0x07FE,	%g6
	array8	%i7,	%l6,	%g5
	movgu	%icc,	%l0,	%g1
	ldsw	[%l7 + 0x70],	%o6
	movn	%icc,	%g7,	%g4
	ldsw	[%l7 + 0x68],	%l3
	or	%l4,	0x1A06,	%o2
	addccc	%i2,	0x167E,	%i6
	fsrc1s	%f10,	%f13
	movvc	%icc,	%i1,	%o5
	fxnors	%f17,	%f18,	%f16
	udiv	%i4,	0x0D4D,	%i3
	mova	%icc,	%l2,	%o0
	array8	%o7,	%l1,	%l5
	srax	%i5,	%o3,	%i0
	movne	%icc,	%o4,	%g3
	stw	%o1,	[%l7 + 0x5C]
	movge	%xcc,	%g2,	%g6
	fpack32	%f2,	%f20,	%f24
	ldd	[%l7 + 0x20],	%f2
	stx	%l6,	[%l7 + 0x20]
	edge16l	%g5,	%i7,	%g1
	movl	%xcc,	%o6,	%l0
	ldsb	[%l7 + 0x13],	%g4
	nop
	set	0x2B, %l4
	stb	%g7,	[%l7 + %l4]
	edge32n	%l3,	%o2,	%i2
	movneg	%icc,	%i6,	%l4
	ldsb	[%l7 + 0x48],	%i1
	fnot1	%f2,	%f4
	fcmpne16	%f20,	%f6,	%i4
	edge8ln	%o5,	%i3,	%l2
	sdivx	%o7,	0x1F41,	%l1
	fmovdvc	%xcc,	%f12,	%f17
	ldd	[%l7 + 0x28],	%f26
	stx	%o0,	[%l7 + 0x28]
	movle	%xcc,	%l5,	%i5
	fmovse	%icc,	%f7,	%f26
	fmovrslez	%o3,	%f14,	%f17
	edge16n	%i0,	%g3,	%o4
	nop
	set	0x10, %o7
	stx	%g2,	[%l7 + %o7]
	umul	%g6,	0x03E3,	%l6
	fnot1s	%f30,	%f8
	fmovdvc	%icc,	%f9,	%f4
	xnorcc	%g5,	%o1,	%i7
	pdist	%f18,	%f10,	%f28
	movvs	%icc,	%o6,	%l0
	alignaddr	%g4,	%g7,	%g1
	movgu	%xcc,	%o2,	%i2
	fmovrsgz	%i6,	%f20,	%f22
	fpack32	%f24,	%f18,	%f12
	ldsb	[%l7 + 0x22],	%l4
	fpack16	%f8,	%f5
	orn	%i1,	0x0109,	%l3
	movn	%icc,	%o5,	%i4
	fcmpd	%fcc2,	%f2,	%f4
	popc	0x146D,	%i3
	fcmps	%fcc2,	%f21,	%f11
	fmovsneg	%xcc,	%f16,	%f11
	edge32	%o7,	%l2,	%l1
	lduw	[%l7 + 0x30],	%o0
	fsrc2s	%f26,	%f13
	fnegd	%f2,	%f20
	lduw	[%l7 + 0x40],	%l5
	array32	%o3,	%i5,	%g3
	fsrc1s	%f18,	%f1
	edge32	%o4,	%i0,	%g2
	fmovrde	%l6,	%f14,	%f26
	fsrc2	%f28,	%f0
	fnegs	%f13,	%f26
	sub	%g5,	%o1,	%g6
	fcmpeq32	%f8,	%f8,	%o6
	movleu	%xcc,	%l0,	%i7
	ldsw	[%l7 + 0x24],	%g4
	ldsb	[%l7 + 0x74],	%g1
	fmovrslez	%o2,	%f2,	%f0
	subc	%i2,	%i6,	%g7
	ldsh	[%l7 + 0x1E],	%l4
	add	%l3,	%o5,	%i4
	edge8l	%i1,	%i3,	%o7
	edge32	%l1,	%l2,	%l5
	fcmped	%fcc2,	%f10,	%f20
	addc	%o3,	%i5,	%o0
	movrgz	%g3,	%i0,	%o4
	subc	%g2,	%l6,	%g5
	fmovsvs	%icc,	%f23,	%f13
	mulscc	%g6,	%o6,	%o1
	srl	%l0,	%g4,	%i7
	xnorcc	%o2,	0x11E8,	%g1
	st	%f16,	[%l7 + 0x38]
	fmovdvc	%icc,	%f4,	%f12
	movvs	%xcc,	%i2,	%g7
	sdivx	%i6,	0x060B,	%l4
	array8	%o5,	%l3,	%i4
	fcmpgt16	%f8,	%f14,	%i1
	sdivcc	%i3,	0x0AB2,	%l1
	fmovrsgz	%l2,	%f5,	%f16
	subcc	%o7,	0x1E55,	%o3
	movne	%xcc,	%i5,	%o0
	andcc	%l5,	0x08CB,	%g3
	movrlz	%i0,	0x1BC,	%o4
	fpadd16s	%f20,	%f21,	%f26
	nop
	set	0x48, %o4
	ldd	[%l7 + %o4],	%f16
	udivcc	%g2,	0x0415,	%g5
	udiv	%l6,	0x1D77,	%o6
	edge32l	%g6,	%l0,	%g4
	udivcc	%o1,	0x1EFE,	%o2
	addccc	%g1,	0x1574,	%i2
	edge8l	%g7,	%i6,	%l4
	fmovrdgez	%o5,	%f26,	%f30
	edge8l	%i7,	%l3,	%i1
	mulscc	%i4,	%i3,	%l2
	edge8ln	%o7,	%o3,	%l1
	fcmple32	%f16,	%f6,	%i5
	fmovsvc	%icc,	%f12,	%f11
	fmovsle	%xcc,	%f17,	%f23
	sethi	0x0FAC,	%l5
	fmovsne	%icc,	%f30,	%f4
	movneg	%icc,	%g3,	%o0
	edge16	%i0,	%o4,	%g5
	faligndata	%f10,	%f6,	%f10
	movge	%xcc,	%g2,	%o6
	fxors	%f1,	%f14,	%f26
	udivcc	%l6,	0x16FA,	%l0
	andn	%g6,	%g4,	%o1
	xorcc	%o2,	%i2,	%g7
	edge32n	%g1,	%l4,	%i6
	ldx	[%l7 + 0x58],	%i7
	lduw	[%l7 + 0x40],	%l3
	alignaddrl	%o5,	%i1,	%i3
	movcc	%icc,	%l2,	%o7
	srax	%i4,	0x1A,	%o3
	subcc	%i5,	%l5,	%l1
	movvs	%icc,	%o0,	%i0
	srl	%g3,	%g5,	%g2
	movle	%icc,	%o6,	%l6
	sllx	%o4,	%l0,	%g4
	orcc	%g6,	0x1C95,	%o1
	edge8ln	%i2,	%o2,	%g7
	movge	%xcc,	%g1,	%l4
	fmovdl	%xcc,	%f3,	%f6
	movneg	%icc,	%i6,	%l3
	movrne	%i7,	0x354,	%i1
	movneg	%xcc,	%o5,	%l2
	xor	%i3,	0x1C92,	%i4
	movrlz	%o7,	0x3E7,	%o3
	movrlz	%i5,	0x1C0,	%l1
	movgu	%xcc,	%l5,	%o0
	xor	%i0,	%g5,	%g2
	edge8	%g3,	%l6,	%o4
	fmuld8sux16	%f31,	%f7,	%f30
	udivcc	%o6,	0x1BAB,	%l0
	fmovdpos	%xcc,	%f13,	%f26
	fornot2	%f22,	%f4,	%f20
	fmuld8sux16	%f14,	%f9,	%f10
	array32	%g6,	%g4,	%o1
	umul	%i2,	0x0355,	%g7
	srl	%g1,	%l4,	%o2
	udivcc	%i6,	0x0FD9,	%l3
	array16	%i7,	%o5,	%i1
	fxors	%f8,	%f17,	%f22
	movrlz	%l2,	0x2EF,	%i3
	popc	0x1172,	%o7
	stw	%o3,	[%l7 + 0x6C]
	subccc	%i4,	0x08FE,	%l1
	add	%i5,	%l5,	%i0
	movpos	%xcc,	%g5,	%g2
	sethi	0x052C,	%g3
	sub	%l6,	0x03BC,	%o4
	movrlz	%o0,	%l0,	%g6
	ldd	[%l7 + 0x48],	%o6
	edge16l	%g4,	%i2,	%o1
	movcs	%xcc,	%g7,	%l4
	popc	0x13BD,	%g1
	std	%f14,	[%l7 + 0x08]
	subccc	%o2,	%i6,	%i7
	fmovrslez	%o5,	%f2,	%f1
	fmovsl	%xcc,	%f10,	%f10
	fsrc2	%f14,	%f8
	fmul8sux16	%f8,	%f12,	%f0
	and	%i1,	0x16D2,	%l2
	fmovdvc	%icc,	%f27,	%f5
	movgu	%icc,	%l3,	%i3
	mulscc	%o7,	%i4,	%l1
	srax	%o3,	0x1D,	%i5
	sllx	%i0,	0x0F,	%g5
	movcc	%xcc,	%g2,	%l5
	fmovdvs	%icc,	%f28,	%f17
	orcc	%l6,	0x15F4,	%o4
	movn	%icc,	%g3,	%o0
	ldx	[%l7 + 0x10],	%l0
	ldx	[%l7 + 0x38],	%o6
	array16	%g6,	%g4,	%o1
	movpos	%icc,	%i2,	%l4
	save %g1, %o2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i7,	0x10,	%g7
	and	%o5,	0x132D,	%l2
	sdivx	%l3,	0x0287,	%i3
	std	%f24,	[%l7 + 0x08]
	movvc	%xcc,	%o7,	%i4
	udivx	%l1,	0x1FBD,	%i1
	fcmpeq32	%f8,	%f12,	%o3
	sdivx	%i5,	0x1589,	%i0
	fandnot1s	%f15,	%f5,	%f4
	popc	0x1735,	%g5
	nop
	set	0x20, %l5
	std	%f4,	[%l7 + %l5]
	stb	%l5,	[%l7 + 0x70]
	movgu	%xcc,	%l6,	%o4
	std	%f22,	[%l7 + 0x68]
	srl	%g2,	%o0,	%g3
	smulcc	%o6,	0x061D,	%g6
	addc	%g4,	%o1,	%i2
	movrlez	%l0,	%g1,	%l4
	sir	0x1A37
	xnor	%o2,	%i6,	%i7
	edge16n	%g7,	%o5,	%l3
	srl	%l2,	%i3,	%i4
	andncc	%o7,	%l1,	%o3
	movrlez	%i5,	%i1,	%g5
	movrne	%l5,	%l6,	%i0
	fmovrslz	%g2,	%f1,	%f27
	fmovsneg	%xcc,	%f6,	%f8
	stx	%o0,	[%l7 + 0x60]
	std	%f8,	[%l7 + 0x18]
	edge8	%o4,	%g3,	%g6
	lduh	[%l7 + 0x5A],	%g4
	srlx	%o1,	%o6,	%i2
	move	%icc,	%g1,	%l4
	edge8	%o2,	%i6,	%i7
	save %g7, 0x16B8, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f22,	[%l7 + 0x48]
	sdivx	%l0,	0x055B,	%l2
	popc	%i3,	%i4
	edge16l	%l3,	%o7,	%l1
	fmovsgu	%icc,	%f10,	%f20
	sdivcc	%o3,	0x0B31,	%i1
	addc	%i5,	%l5,	%g5
	fmovdcs	%xcc,	%f24,	%f21
	movpos	%xcc,	%l6,	%i0
	move	%xcc,	%g2,	%o0
	movn	%xcc,	%g3,	%o4
	st	%f8,	[%l7 + 0x18]
	srlx	%g4,	%g6,	%o1
	fmul8x16au	%f20,	%f21,	%f30
	sdiv	%i2,	0x0EF2,	%g1
	ldd	[%l7 + 0x78],	%l4
	movgu	%xcc,	%o6,	%i6
	fornot1	%f0,	%f24,	%f26
	movg	%icc,	%i7,	%o2
	umulcc	%o5,	0x0DF1,	%g7
	edge32	%l0,	%i3,	%i4
	movrgz	%l2,	%l3,	%o7
	srlx	%l1,	0x1B,	%i1
	movrne	%i5,	0x364,	%o3
	andn	%g5,	%l6,	%l5
	stx	%i0,	[%l7 + 0x78]
	fmovsle	%xcc,	%f0,	%f0
	xorcc	%g2,	%g3,	%o4
	nop
	set	0x2C, %g4
	lduh	[%l7 + %g4],	%g4
	srax	%g6,	0x16,	%o1
	movrlz	%o0,	%g1,	%l4
	nop
	set	0x60, %g3
	std	%f18,	[%l7 + %g3]
	popc	0x14E5,	%o6
	orn	%i2,	0x0A70,	%i7
	andncc	%i6,	%o5,	%g7
	andncc	%l0,	%o2,	%i3
	edge32	%i4,	%l2,	%o7
	movrlz	%l3,	0x3FD,	%l1
	ldsw	[%l7 + 0x5C],	%i5
	fandnot2	%f10,	%f20,	%f20
	sethi	0x15A9,	%o3
	edge32	%g5,	%i1,	%l6
	edge16ln	%l5,	%i0,	%g3
	mulx	%o4,	%g4,	%g6
	sir	0x0BF8
	xnor	%o1,	0x0453,	%g2
	movne	%xcc,	%g1,	%l4
	nop
	set	0x48, %g5
	ldd	[%l7 + %g5],	%o0
	ldub	[%l7 + 0x2F],	%o6
	umul	%i7,	0x1CBA,	%i2
	mulx	%i6,	%g7,	%o5
	fmovde	%xcc,	%f13,	%f8
	fnot1	%f8,	%f30
	xorcc	%l0,	0x1359,	%o2
	srax	%i3,	%i4,	%o7
	xor	%l2,	0x0DFF,	%l1
	fmovsa	%xcc,	%f0,	%f5
	popc	0x117B,	%l3
	movgu	%icc,	%i5,	%g5
	ldub	[%l7 + 0x23],	%i1
	fornot1	%f2,	%f12,	%f18
	ldx	[%l7 + 0x10],	%l6
	addc	%l5,	%o3,	%g3
	edge8n	%i0,	%o4,	%g4
	movl	%xcc,	%g6,	%o1
	sra	%g2,	%g1,	%l4
	ldsw	[%l7 + 0x14],	%o0
	save %i7, %i2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g7,	%o5,	%o6
	array8	%l0,	%i3,	%i4
	fnands	%f26,	%f21,	%f25
	fmovrdgez	%o7,	%f18,	%f14
	movrne	%l2,	0x278,	%l1
	movg	%icc,	%l3,	%o2
	fmovspos	%xcc,	%f27,	%f13
	ld	[%l7 + 0x08],	%f6
	fcmpne32	%f2,	%f14,	%g5
	movvc	%icc,	%i5,	%l6
	fmuld8ulx16	%f19,	%f4,	%f22
	lduw	[%l7 + 0x58],	%l5
	xor	%i1,	%o3,	%g3
	fmovrsne	%i0,	%f14,	%f30
	edge8ln	%o4,	%g4,	%g6
	edge16ln	%o1,	%g2,	%l4
	sethi	0x14B9,	%g1
	edge32	%o0,	%i2,	%i6
	umulcc	%g7,	%i7,	%o6
	fmovdneg	%icc,	%f21,	%f18
	movrlez	%l0,	%i3,	%o5
	fsrc1s	%f16,	%f27
	movle	%icc,	%i4,	%l2
	umul	%l1,	0x0BF0,	%l3
	or	%o2,	%o7,	%i5
	addc	%l6,	%l5,	%g5
	fandnot2	%f12,	%f0,	%f24
	udiv	%i1,	0x1E42,	%g3
	movneg	%icc,	%i0,	%o3
	orn	%o4,	%g4,	%g6
	ldsb	[%l7 + 0x09],	%o1
	sdiv	%l4,	0x18B8,	%g1
	andncc	%g2,	%o0,	%i6
	movge	%icc,	%i2,	%i7
	array16	%g7,	%o6,	%i3
	movcs	%xcc,	%o5,	%l0
	movre	%l2,	0x165,	%i4
	xorcc	%l3,	0x1D77,	%o2
	alignaddr	%o7,	%i5,	%l6
	movvs	%xcc,	%l5,	%g5
	edge8ln	%l1,	%i1,	%g3
	fmovdcs	%xcc,	%f13,	%f17
	stx	%i0,	[%l7 + 0x28]
	fzero	%f6
	fcmpgt16	%f18,	%f18,	%o3
	edge16l	%o4,	%g6,	%o1
	edge8ln	%l4,	%g4,	%g2
	orn	%g1,	0x03F6,	%o0
	edge32n	%i6,	%i2,	%g7
	restore %o6, 0x0B67, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o5,	%l0
	mova	%icc,	%l2,	%i4
	fmul8ulx16	%f6,	%f30,	%f28
	move	%xcc,	%i3,	%l3
	addc	%o2,	0x108E,	%i5
	fmovscc	%xcc,	%f3,	%f15
	edge8ln	%o7,	%l6,	%l5
	movne	%xcc,	%g5,	%i1
	fmovsneg	%xcc,	%f19,	%f15
	sra	%g3,	%i0,	%l1
	edge16	%o3,	%o4,	%o1
	fmovdvs	%icc,	%f2,	%f6
	edge8l	%l4,	%g6,	%g2
	siam	0x6
	addcc	%g4,	%o0,	%i6
	popc	%g1,	%i2
	fmovsvc	%xcc,	%f12,	%f0
	fmovdcs	%icc,	%f27,	%f31
	udivcc	%o6,	0x0E71,	%g7
	smulcc	%i7,	%o5,	%l2
	movgu	%xcc,	%i4,	%i3
	ldsw	[%l7 + 0x28],	%l3
	fandnot1	%f8,	%f14,	%f10
	movrne	%o2,	%l0,	%o7
	smul	%i5,	%l5,	%l6
	udivx	%g5,	0x1954,	%i1
	sdivcc	%i0,	0x1DF7,	%g3
	sethi	0x01BD,	%o3
	ldub	[%l7 + 0x7A],	%l1
	orncc	%o4,	0x0CEF,	%o1
	orn	%g6,	%g2,	%g4
	ldd	[%l7 + 0x30],	%l4
	save %i6, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i2,	0x1915,	%g7
	movne	%xcc,	%i7,	%o5
	edge8n	%o6,	%l2,	%i3
	fcmps	%fcc2,	%f19,	%f8
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	edge16ln	%o7,	%i5,	%l5
	lduw	[%l7 + 0x68],	%l6
	movne	%xcc,	%l0,	%i1
	fmul8x16al	%f26,	%f26,	%f16
	edge16n	%i0,	%g5,	%g3
	fmovde	%xcc,	%f30,	%f3
	movpos	%xcc,	%l1,	%o4
	subc	%o3,	0x16F6,	%o1
	edge32l	%g2,	%g6,	%g4
	ld	[%l7 + 0x7C],	%f13
	ldsw	[%l7 + 0x20],	%l4
	andcc	%i6,	%g1,	%o0
	movn	%icc,	%g7,	%i7
	fmovs	%f19,	%f12
	add	%o5,	0x012E,	%o6
	fzeros	%f16
	edge32l	%l2,	%i2,	%l3
	fpackfix	%f14,	%f27
	movneg	%icc,	%o2,	%i4
	st	%f18,	[%l7 + 0x38]
	mova	%icc,	%i3,	%i5
	fmovdcs	%xcc,	%f2,	%f0
	edge16ln	%o7,	%l6,	%l0
	and	%l5,	0x1F3B,	%i1
	udivx	%g5,	0x1D1C,	%g3
	subcc	%i0,	0x1472,	%l1
	mulx	%o3,	0x088A,	%o4
	andn	%o1,	0x153A,	%g2
	st	%f9,	[%l7 + 0x70]
	sir	0x08C9
	edge32n	%g4,	%g6,	%i6
	movge	%icc,	%l4,	%g1
	fxors	%f28,	%f4,	%f4
	movl	%icc,	%g7,	%i7
	movne	%icc,	%o0,	%o6
	popc	0x1CB7,	%o5
	nop
	set	0x28, %i5
	ldx	[%l7 + %i5],	%i2
	fandnot1s	%f15,	%f30,	%f10
	fpadd32s	%f12,	%f13,	%f7
	movl	%icc,	%l3,	%l2
	edge8	%o2,	%i4,	%i3
	edge32ln	%o7,	%l6,	%l0
	alignaddr	%i5,	%i1,	%g5
	lduh	[%l7 + 0x6C],	%l5
	fnand	%f22,	%f22,	%f28
	mulscc	%g3,	%i0,	%o3
	smulcc	%l1,	0x1C3D,	%o1
	umulcc	%o4,	%g2,	%g6
	movl	%xcc,	%i6,	%l4
	ldsw	[%l7 + 0x1C],	%g4
	movpos	%xcc,	%g1,	%i7
	edge32ln	%g7,	%o6,	%o0
	edge32l	%i2,	%l3,	%o5
	stw	%o2,	[%l7 + 0x60]
	movge	%icc,	%i4,	%l2
	fnors	%f24,	%f7,	%f23
	sra	%i3,	0x00,	%l6
	fmovsg	%icc,	%f8,	%f13
	movl	%xcc,	%l0,	%i5
	fmovsn	%icc,	%f6,	%f20
	edge8n	%i1,	%o7,	%l5
	lduh	[%l7 + 0x46],	%g3
	edge8n	%g5,	%o3,	%l1
	smulcc	%o1,	0x1D55,	%i0
	andncc	%o4,	%g6,	%i6
	fandnot1	%f22,	%f20,	%f18
	fxnor	%f24,	%f14,	%f2
	ldsb	[%l7 + 0x15],	%g2
	edge32ln	%g4,	%l4,	%g1
	fmovsvs	%icc,	%f19,	%f12
	udivcc	%i7,	0x0555,	%o6
	movrlez	%o0,	0x2E6,	%g7
	smul	%l3,	0x18FE,	%i2
	restore %o2, 0x0F56, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i4,	%i3,	%l2
	xnor	%l0,	0x1CE3,	%i5
	lduw	[%l7 + 0x30],	%l6
	lduh	[%l7 + 0x36],	%i1
	sub	%l5,	%o7,	%g3
	movrne	%o3,	%l1,	%g5
	edge8l	%i0,	%o4,	%g6
	popc	%i6,	%g2
	stw	%o1,	[%l7 + 0x24]
	st	%f2,	[%l7 + 0x48]
	and	%l4,	0x0B10,	%g4
	subc	%g1,	0x1AB0,	%o6
	movvs	%xcc,	%i7,	%g7
	lduh	[%l7 + 0x7A],	%l3
	fmovscs	%icc,	%f22,	%f10
	umul	%i2,	0x053E,	%o0
	sdiv	%o2,	0x0242,	%o5
	srl	%i3,	0x06,	%l2
	ldub	[%l7 + 0x2A],	%l0
	edge16	%i5,	%i4,	%l6
	fmovsneg	%xcc,	%f30,	%f23
	edge16	%i1,	%o7,	%l5
	umulcc	%g3,	%o3,	%l1
	fands	%f14,	%f12,	%f9
	fmovsg	%xcc,	%f3,	%f15
	fpsub16	%f18,	%f18,	%f22
	sir	0x0D57
	fornot1s	%f19,	%f13,	%f30
	addcc	%i0,	%o4,	%g6
	st	%f26,	[%l7 + 0x64]
	array8	%i6,	%g2,	%o1
	ldsh	[%l7 + 0x76],	%g5
	movre	%l4,	0x0D2,	%g4
	movrgez	%o6,	%i7,	%g7
	subc	%l3,	0x1FB7,	%g1
	stx	%o0,	[%l7 + 0x50]
	lduh	[%l7 + 0x40],	%i2
	st	%f20,	[%l7 + 0x20]
	umulcc	%o5,	%o2,	%l2
	fmovsle	%xcc,	%f24,	%f17
	sra	%i3,	0x1A,	%i5
	fmovdle	%icc,	%f5,	%f15
	stw	%l0,	[%l7 + 0x1C]
	umulcc	%l6,	0x0929,	%i1
	movrlz	%i4,	0x39D,	%l5
	array16	%o7,	%g3,	%o3
	ldub	[%l7 + 0x62],	%i0
	array8	%o4,	%l1,	%g6
	edge16ln	%i6,	%o1,	%g5
	sdiv	%g2,	0x11DD,	%l4
	edge8	%o6,	%g4,	%i7
	fmovrslz	%g7,	%f6,	%f10
	fcmpeq16	%f0,	%f2,	%g1
	fmovrdne	%o0,	%f22,	%f2
	movrlz	%l3,	0x2A4,	%o5
	movrlez	%i2,	%l2,	%i3
	andn	%i5,	%o2,	%l0
	ldsh	[%l7 + 0x1E],	%i1
	movn	%icc,	%i4,	%l5
	sdivcc	%l6,	0x1B7A,	%o7
	stb	%g3,	[%l7 + 0x5A]
	xorcc	%i0,	0x0D3D,	%o4
	srlx	%o3,	0x0B,	%l1
	xorcc	%g6,	0x03F8,	%i6
	or	%g5,	0x1067,	%o1
	edge16n	%g2,	%o6,	%l4
	movle	%xcc,	%g4,	%g7
	lduh	[%l7 + 0x1C],	%i7
	movge	%icc,	%o0,	%g1
	movcs	%icc,	%o5,	%l3
	fcmple32	%f10,	%f10,	%i2
	sra	%l2,	0x0C,	%i5
	edge32ln	%o2,	%l0,	%i3
	edge16	%i1,	%i4,	%l6
	movrlez	%l5,	0x391,	%g3
	st	%f6,	[%l7 + 0x08]
	andncc	%o7,	%i0,	%o4
	fpack16	%f28,	%f12
	ldd	[%l7 + 0x60],	%o2
	fornot1	%f12,	%f22,	%f10
	fornot1s	%f13,	%f25,	%f7
	edge8ln	%g6,	%i6,	%l1
	popc	%g5,	%o1
	edge8	%o6,	%g2,	%g4
	movneg	%icc,	%l4,	%i7
	sth	%o0,	[%l7 + 0x1A]
	edge32l	%g1,	%g7,	%o5
	array8	%l3,	%i2,	%l2
	movcc	%icc,	%i5,	%o2
	edge8	%l0,	%i1,	%i4
	fmovrsne	%i3,	%f19,	%f6
	stw	%l6,	[%l7 + 0x64]
	movpos	%icc,	%g3,	%o7
	mova	%icc,	%l5,	%o4
	addccc	%o3,	0x1059,	%g6
	alignaddrl	%i0,	%i6,	%l1
	sth	%g5,	[%l7 + 0x5C]
	andcc	%o6,	0x0E07,	%o1
	umul	%g4,	%l4,	%g2
	movle	%xcc,	%o0,	%g1
	std	%f4,	[%l7 + 0x30]
	movcs	%icc,	%g7,	%o5
	movvs	%xcc,	%l3,	%i7
	movre	%i2,	0x33A,	%l2
	fnegs	%f8,	%f15
	xnorcc	%i5,	0x013D,	%o2
	udiv	%l0,	0x110A,	%i4
	ldd	[%l7 + 0x18],	%f0
	alignaddr	%i3,	%l6,	%g3
	movn	%icc,	%i1,	%l5
	nop
	set	0x60, %i3
	lduw	[%l7 + %i3],	%o7
	fmovrdne	%o4,	%f2,	%f30
	fpackfix	%f14,	%f2
	movg	%xcc,	%o3,	%g6
	movne	%icc,	%i0,	%i6
	sth	%g5,	[%l7 + 0x7C]
	stb	%l1,	[%l7 + 0x39]
	std	%f28,	[%l7 + 0x08]
	array32	%o6,	%o1,	%l4
	subcc	%g4,	%o0,	%g2
	edge8ln	%g1,	%o5,	%g7
	subc	%l3,	0x03B6,	%i2
	andcc	%l2,	0x1EFE,	%i7
	movge	%xcc,	%i5,	%o2
	movl	%xcc,	%l0,	%i3
	movn	%icc,	%i4,	%l6
	add	%i1,	%g3,	%l5
	xor	%o7,	%o4,	%g6
	lduh	[%l7 + 0x72],	%o3
	movrgz	%i0,	%i6,	%g5
	smul	%l1,	%o6,	%o1
	edge32ln	%g4,	%l4,	%o0
	mulx	%g2,	%o5,	%g7
	ldsb	[%l7 + 0x64],	%g1
	fandnot1	%f12,	%f6,	%f20
	xnorcc	%i2,	%l2,	%i7
	srl	%i5,	%l3,	%o2
	movvs	%xcc,	%l0,	%i3
	array8	%i4,	%i1,	%g3
	edge8l	%l5,	%l6,	%o4
	std	%f10,	[%l7 + 0x10]
	fornot1s	%f28,	%f16,	%f12
	array8	%g6,	%o7,	%o3
	movneg	%xcc,	%i0,	%g5
	fcmpes	%fcc3,	%f1,	%f3
	movvs	%icc,	%l1,	%o6
	umulcc	%i6,	%g4,	%o1
	edge16ln	%o0,	%l4,	%o5
	andcc	%g2,	%g1,	%g7
	addccc	%l2,	0x0059,	%i2
	ldub	[%l7 + 0x65],	%i5
	subcc	%l3,	%i7,	%o2
	sethi	0x1553,	%i3
	and	%i4,	%l0,	%g3
	sir	0x1A73
	srax	%l5,	%i1,	%l6
	ldx	[%l7 + 0x48],	%o4
	fone	%f6
	stw	%g6,	[%l7 + 0x28]
	edge16ln	%o7,	%i0,	%g5
	fzero	%f6
	sdivx	%l1,	0x0CCE,	%o3
	move	%icc,	%i6,	%g4
	edge8n	%o1,	%o0,	%o6
	fandnot2	%f20,	%f30,	%f8
	edge8l	%o5,	%g2,	%l4
	movre	%g7,	0x088,	%g1
	andn	%i2,	%l2,	%l3
	or	%i5,	%o2,	%i3
	movle	%xcc,	%i7,	%i4
	edge8n	%g3,	%l0,	%l5
	fnot1	%f30,	%f14
	movleu	%xcc,	%l6,	%o4
	ldd	[%l7 + 0x60],	%i0
	fpsub32	%f22,	%f20,	%f22
	st	%f31,	[%l7 + 0x44]
	mulscc	%o7,	0x1FE2,	%i0
	srl	%g5,	%l1,	%g6
	movrne	%o3,	%g4,	%i6
	edge8n	%o0,	%o1,	%o6
	alignaddrl	%g2,	%o5,	%l4
	subcc	%g7,	%g1,	%l2
	fmovsvs	%icc,	%f13,	%f4
	fmovrdgz	%i2,	%f24,	%f28
	movge	%xcc,	%i5,	%l3
	ldd	[%l7 + 0x50],	%o2
	movre	%i7,	%i4,	%g3
	xnorcc	%l0,	%l5,	%i3
	array16	%l6,	%i1,	%o7
	sra	%i0,	0x11,	%o4
	and	%l1,	0x19DB,	%g5
	xorcc	%g6,	0x0042,	%o3
	array8	%i6,	%g4,	%o1
	nop
	set	0x5C, %l2
	sth	%o0,	[%l7 + %l2]
	fsrc2s	%f15,	%f8
	ldd	[%l7 + 0x18],	%g2
	ldsb	[%l7 + 0x55],	%o6
	movne	%xcc,	%l4,	%o5
	addcc	%g1,	0x09B2,	%l2
	std	%f10,	[%l7 + 0x78]
	xor	%g7,	%i5,	%i2
	subc	%l3,	0x07C1,	%o2
	fpack16	%f14,	%f15
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	fornot1	%f20,	%f6,	%f26
	save %l0, %g3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f19,	%f29
	fmul8x16au	%f25,	%f17,	%f26
	ldsw	[%l7 + 0x2C],	%i3
	stx	%l6,	[%l7 + 0x20]
	move	%icc,	%o7,	%i1
	ldd	[%l7 + 0x28],	%o4
	udivcc	%l1,	0x03CC,	%g5
	fmovsl	%xcc,	%f4,	%f14
	fpsub16s	%f20,	%f11,	%f20
	move	%icc,	%g6,	%o3
	move	%icc,	%i6,	%i0
	orcc	%o1,	%o0,	%g2
	movvc	%xcc,	%g4,	%l4
	edge16n	%o5,	%o6,	%l2
	fand	%f30,	%f16,	%f4
	udivx	%g7,	0x0EA4,	%i5
	orncc	%i2,	0x17D6,	%g1
	edge8l	%o2,	%i4,	%i7
	movneg	%xcc,	%l0,	%l3
	movne	%xcc,	%l5,	%i3
	array32	%l6,	%g3,	%i1
	ldsw	[%l7 + 0x68],	%o4
	fcmpeq32	%f12,	%f22,	%l1
	edge8ln	%g5,	%o7,	%o3
	movleu	%xcc,	%g6,	%i6
	movrgz	%i0,	%o1,	%g2
	andncc	%g4,	%o0,	%o5
	umulcc	%o6,	0x0B9F,	%l4
	stw	%l2,	[%l7 + 0x34]
	fpmerge	%f14,	%f4,	%f26
	udivx	%g7,	0x0F01,	%i5
	sdivcc	%i2,	0x16A5,	%o2
	ldd	[%l7 + 0x60],	%f10
	umulcc	%g1,	%i7,	%l0
	orn	%l3,	0x18CC,	%l5
	ldd	[%l7 + 0x18],	%i2
	edge32	%l6,	%g3,	%i4
	udiv	%o4,	0x1511,	%i1
	xnorcc	%l1,	%g5,	%o7
	xnorcc	%o3,	0x1AA3,	%i6
	andncc	%g6,	%o1,	%i0
	edge16n	%g4,	%o0,	%g2
	fmovsneg	%icc,	%f16,	%f2
	fmovrdlez	%o5,	%f8,	%f20
	orncc	%l4,	0x1448,	%l2
	fmovspos	%icc,	%f17,	%f6
	srlx	%g7,	0x01,	%o6
	fnand	%f10,	%f6,	%f4
	edge16l	%i2,	%o2,	%g1
	faligndata	%f26,	%f18,	%f30
	movre	%i5,	%i7,	%l3
	move	%icc,	%l5,	%l0
	fmovsne	%xcc,	%f12,	%f16
	and	%l6,	0x0B6B,	%i3
	fpackfix	%f28,	%f21
	fmovspos	%xcc,	%f12,	%f3
	movrlz	%i4,	0x0BA,	%g3
	fmuld8ulx16	%f16,	%f21,	%f10
	fpadd16s	%f26,	%f21,	%f19
	srlx	%o4,	%l1,	%i1
	andn	%g5,	%o7,	%o3
	ldd	[%l7 + 0x60],	%f4
	sdivx	%i6,	0x056C,	%o1
	movn	%xcc,	%i0,	%g4
	fone	%f16
	fpack32	%f30,	%f4,	%f20
	xor	%o0,	%g2,	%o5
	xnor	%g6,	0x051C,	%l4
	xorcc	%l2,	%o6,	%g7
	sdivcc	%o2,	0x1620,	%i2
	fornot1s	%f10,	%f24,	%f1
	xorcc	%g1,	%i5,	%i7
	sdivcc	%l3,	0x0309,	%l5
	andn	%l6,	%l0,	%i3
	ldub	[%l7 + 0x09],	%i4
	fmovdneg	%xcc,	%f2,	%f8
	alignaddr	%o4,	%l1,	%g3
	sethi	0x1F78,	%g5
	edge8l	%o7,	%i1,	%i6
	sth	%o1,	[%l7 + 0x70]
	ldd	[%l7 + 0x28],	%i0
	edge8l	%o3,	%o0,	%g2
	movrlz	%o5,	%g6,	%l4
	fpadd16	%f16,	%f26,	%f6
	popc	%g4,	%o6
	sethi	0x1CF3,	%g7
	fmovrslz	%l2,	%f5,	%f11
	movrgz	%o2,	0x271,	%i2
	edge32l	%i5,	%i7,	%g1
	edge32ln	%l5,	%l6,	%l3
	orn	%l0,	0x1C98,	%i4
	fmovdcc	%xcc,	%f29,	%f19
	fsrc1	%f12,	%f10
	fxnor	%f16,	%f30,	%f12
	stw	%o4,	[%l7 + 0x30]
	srl	%l1,	0x1A,	%g3
	ldx	[%l7 + 0x10],	%i3
	fcmpes	%fcc1,	%f19,	%f9
	fcmpgt32	%f24,	%f8,	%g5
	mulx	%i1,	%i6,	%o1
	fnot2	%f14,	%f8
	fmovdge	%xcc,	%f8,	%f13
	fcmpeq32	%f12,	%f12,	%o7
	fand	%f30,	%f4,	%f28
	ldd	[%l7 + 0x40],	%i0
	movleu	%xcc,	%o0,	%g2
	fmovdpos	%xcc,	%f7,	%f11
	movle	%icc,	%o5,	%g6
	fmovsn	%xcc,	%f17,	%f15
	stx	%o3,	[%l7 + 0x48]
	umulcc	%l4,	%o6,	%g4
	lduw	[%l7 + 0x10],	%l2
	alignaddr	%o2,	%i2,	%g7
	mova	%xcc,	%i7,	%i5
	or	%g1,	0x0B54,	%l5
	ldsb	[%l7 + 0x46],	%l3
	edge8ln	%l6,	%i4,	%o4
	movg	%xcc,	%l0,	%l1
	movrgz	%i3,	%g3,	%i1
	sth	%i6,	[%l7 + 0x08]
	edge8	%o1,	%g5,	%i0
	addccc	%o0,	0x14FB,	%g2
	edge32l	%o7,	%g6,	%o5
	fmul8x16au	%f24,	%f30,	%f20
	stw	%o3,	[%l7 + 0x78]
	movvc	%icc,	%l4,	%g4
	subcc	%l2,	%o6,	%o2
	sth	%i2,	[%l7 + 0x7C]
	orncc	%i7,	%g7,	%g1
	edge8n	%l5,	%i5,	%l6
	array8	%i4,	%o4,	%l3
	fcmped	%fcc0,	%f24,	%f2
	mulscc	%l1,	0x1DED,	%l0
	mulx	%g3,	%i3,	%i6
	fpadd32	%f8,	%f28,	%f14
	addc	%i1,	%o1,	%i0
	edge32l	%o0,	%g5,	%g2
	or	%g6,	%o7,	%o3
	fmovrsgz	%l4,	%f12,	%f20
	addc	%o5,	0x1D25,	%l2
	movg	%icc,	%o6,	%o2
	movrlez	%i2,	%g4,	%i7
	fcmpes	%fcc0,	%f23,	%f21
	movvs	%icc,	%g7,	%g1
	udiv	%i5,	0x0BE4,	%l6
	movneg	%icc,	%l5,	%o4
	fmovsle	%xcc,	%f19,	%f27
	bshuffle	%f16,	%f26,	%f30
	movneg	%icc,	%i4,	%l1
	sir	0x030D
	umulcc	%l3,	0x1752,	%l0
	array16	%i3,	%i6,	%i1
	udiv	%g3,	0x0B01,	%o1
	fcmpd	%fcc0,	%f18,	%f10
	orn	%i0,	%g5,	%o0
	movvc	%icc,	%g6,	%g2
	fmovsneg	%xcc,	%f21,	%f17
	fmovsle	%icc,	%f10,	%f12
	move	%xcc,	%o3,	%o7
	movcc	%xcc,	%l4,	%o5
	st	%f14,	[%l7 + 0x70]
	fzero	%f4
	movneg	%icc,	%o6,	%o2
	edge32l	%i2,	%g4,	%i7
	xorcc	%l2,	0x0A65,	%g7
	stw	%g1,	[%l7 + 0x64]
	edge8l	%i5,	%l6,	%o4
	movne	%icc,	%i4,	%l1
	movrlz	%l5,	0x349,	%l3
	fmovrsne	%l0,	%f25,	%f22
	movl	%icc,	%i3,	%i6
	udivx	%i1,	0x0ED1,	%o1
	sir	0x03B2
	ldsw	[%l7 + 0x0C],	%g3
	fornot2s	%f3,	%f30,	%f10
	movrlz	%g5,	0x0B4,	%i0
	sdivcc	%o0,	0x0C61,	%g6
	edge32ln	%o3,	%o7,	%l4
	edge16ln	%g2,	%o6,	%o5
	array8	%o2,	%g4,	%i7
	movre	%l2,	%i2,	%g7
	subc	%i5,	%l6,	%g1
	fmul8x16	%f15,	%f14,	%f26
	udiv	%o4,	0x0A19,	%l1
	fmovrdne	%l5,	%f30,	%f6
	fmovsgu	%xcc,	%f14,	%f3
	sdivx	%l3,	0x1DA4,	%i4
	and	%l0,	0x1FE5,	%i3
	popc	0x1AAC,	%i6
	ldd	[%l7 + 0x60],	%f6
	fmovdn	%xcc,	%f20,	%f2
	sth	%i1,	[%l7 + 0x32]
	alignaddr	%g3,	%o1,	%i0
	movrlz	%g5,	0x2FF,	%g6
	fone	%f4
	ldd	[%l7 + 0x48],	%f22
	movpos	%icc,	%o3,	%o0
	and	%o7,	%l4,	%g2
	edge32	%o5,	%o2,	%g4
	xorcc	%i7,	%o6,	%i2
	edge16l	%l2,	%i5,	%l6
	movneg	%xcc,	%g7,	%o4
	smulcc	%g1,	%l1,	%l3
	udivcc	%i4,	0x0242,	%l5
	lduh	[%l7 + 0x48],	%l0
	fabss	%f15,	%f5
	fmovrdlz	%i6,	%f26,	%f8
	srax	%i3,	%i1,	%o1
	subccc	%i0,	%g3,	%g5
	movne	%icc,	%o3,	%g6
	fmovdneg	%icc,	%f10,	%f1
	movcc	%icc,	%o7,	%l4
	add	%o0,	%o5,	%o2
	fone	%f30
	fnot1	%f18,	%f20
	ldd	[%l7 + 0x28],	%f20
	movne	%icc,	%g4,	%g2
	fmovdcs	%xcc,	%f22,	%f7
	sra	%o6,	%i7,	%i2
	fpsub16s	%f28,	%f3,	%f12
	andn	%l2,	0x1181,	%i5
	addcc	%g7,	0x0250,	%o4
	addc	%g1,	%l1,	%l3
	fmovspos	%icc,	%f29,	%f29
	subcc	%l6,	0x0674,	%l5
	addcc	%i4,	0x0EB4,	%l0
	faligndata	%f14,	%f12,	%f10
	smulcc	%i6,	%i3,	%i1
	movg	%icc,	%o1,	%i0
	fnot2	%f6,	%f22
	subcc	%g3,	%g5,	%o3
	ldub	[%l7 + 0x1E],	%o7
	stx	%l4,	[%l7 + 0x10]
	smulcc	%o0,	0x0811,	%o5
	movcs	%icc,	%o2,	%g6
	sdivcc	%g2,	0x0A06,	%g4
	movleu	%xcc,	%o6,	%i7
	edge16ln	%i2,	%i5,	%g7
	movl	%icc,	%o4,	%l2
	edge8ln	%l1,	%g1,	%l6
	edge32ln	%l5,	%l3,	%l0
	fxnors	%f7,	%f10,	%f3
	stb	%i4,	[%l7 + 0x7D]
	movne	%xcc,	%i3,	%i1
	fmovrdgez	%i6,	%f28,	%f2
	sdivcc	%i0,	0x0743,	%g3
	restore %g5, %o3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f9,	%f0,	%f19
	sdivx	%l4,	0x0EF2,	%o0
	umulcc	%o5,	%o2,	%g6
	ldd	[%l7 + 0x10],	%g2
	edge32	%o1,	%g4,	%o6
	smul	%i2,	0x1F60,	%i7
	edge16	%g7,	%i5,	%l2
	fmovrdlz	%o4,	%f4,	%f26
	sir	0x110D
	sdivx	%l1,	0x0E97,	%l6
	sllx	%l5,	0x1A,	%g1
	edge16n	%l0,	%i4,	%l3
	srax	%i1,	%i3,	%i0
	movrlez	%i6,	0x176,	%g5
	fnegd	%f0,	%f10
	fornot2	%f26,	%f6,	%f26
	smul	%o3,	%o7,	%g3
	array16	%o0,	%l4,	%o5
	fnegs	%f3,	%f27
	fnot2	%f6,	%f12
	fmovrdne	%o2,	%f2,	%f20
	ldsh	[%l7 + 0x6E],	%g6
	fmovrde	%g2,	%f0,	%f22
	stx	%o1,	[%l7 + 0x48]
	fpack32	%f4,	%f4,	%f8
	fmovrde	%o6,	%f24,	%f12
	edge32	%g4,	%i2,	%g7
	movvs	%xcc,	%i7,	%i5
	fcmpeq16	%f12,	%f20,	%o4
	movrlz	%l1,	0x2B2,	%l2
	movcc	%xcc,	%l5,	%g1
	movrgez	%l0,	0x124,	%l6
	srlx	%i4,	%l3,	%i1
	movl	%icc,	%i3,	%i6
	srax	%g5,	0x14,	%o3
	ldx	[%l7 + 0x38],	%o7
	fmovd	%f26,	%f8
	fornot1s	%f28,	%f0,	%f28
	fpadd32	%f28,	%f22,	%f16
	edge8ln	%g3,	%o0,	%l4
	movle	%xcc,	%i0,	%o2
	movvs	%xcc,	%o5,	%g6
	and	%o1,	0x1759,	%g2
	subccc	%o6,	0x083C,	%i2
	fmovdcs	%icc,	%f28,	%f18
	faligndata	%f22,	%f30,	%f16
	sth	%g7,	[%l7 + 0x52]
	fmovsg	%xcc,	%f19,	%f21
	addc	%i7,	%g4,	%o4
	fmovs	%f13,	%f2
	udivcc	%i5,	0x095B,	%l2
	andn	%l5,	%g1,	%l0
	fmovsvs	%icc,	%f6,	%f1
	orncc	%l6,	0x0E7A,	%i4
	fcmple32	%f4,	%f30,	%l3
	or	%i1,	0x1567,	%i3
	orn	%l1,	0x0E42,	%g5
	fandnot2	%f10,	%f28,	%f18
	fcmple32	%f12,	%f8,	%o3
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%i6
	umul	%o7,	%g3,	%o0
	faligndata	%f22,	%f24,	%f26
	sllx	%l4,	0x0D,	%o2
	sdivx	%o5,	0x0806,	%i0
	xnor	%o1,	%g2,	%g6
	subcc	%i2,	0x18B8,	%g7
	ldx	[%l7 + 0x50],	%i7
	fpmerge	%f17,	%f9,	%f18
	movrgz	%g4,	%o6,	%o4
	stx	%i5,	[%l7 + 0x60]
	fmovscc	%icc,	%f0,	%f22
	move	%icc,	%l5,	%g1
	edge8ln	%l2,	%l0,	%i4
	movgu	%icc,	%l6,	%l3
	movrne	%i1,	0x1AA,	%i3
	fcmpd	%fcc1,	%f10,	%f0
	ldsh	[%l7 + 0x40],	%l1
	ldsh	[%l7 + 0x0E],	%g5
	edge16n	%o3,	%i6,	%o7
	st	%f5,	[%l7 + 0x1C]
	or	%g3,	0x12C4,	%l4
	movn	%icc,	%o0,	%o5
	fnand	%f16,	%f10,	%f22
	subccc	%o2,	0x14C0,	%o1
	orn	%g2,	%g6,	%i2
	orncc	%i0,	0x0B88,	%g7
	subc	%g4,	0x1D6E,	%o6
	movre	%o4,	%i7,	%l5
	fmovsvc	%icc,	%f16,	%f26
	xnor	%i5,	%g1,	%l2
	umul	%l0,	%l6,	%i4
	sethi	0x0B10,	%i1
	movcs	%icc,	%l3,	%l1
	andcc	%g5,	%i3,	%o3
	udivcc	%o7,	0x02F0,	%i6
	srlx	%l4,	0x01,	%o0
	fandnot1	%f28,	%f28,	%f10
	fpsub16s	%f13,	%f9,	%f2
	fmovdcs	%icc,	%f21,	%f10
	edge32	%o5,	%o2,	%o1
	fmovdvs	%xcc,	%f31,	%f29
	fcmpeq16	%f16,	%f16,	%g3
	edge8l	%g2,	%i2,	%i0
	movrne	%g7,	0x20B,	%g6
	sdivcc	%g4,	0x0CC2,	%o6
	edge16l	%i7,	%o4,	%l5
	fpackfix	%f30,	%f21
	movle	%xcc,	%g1,	%i5
	ld	[%l7 + 0x24],	%f11
	alignaddr	%l0,	%l2,	%i4
	mulscc	%l6,	0x09FE,	%l3
	fmovdcc	%icc,	%f14,	%f28
	std	%f24,	[%l7 + 0x38]
	add	%l1,	%g5,	%i1
	mova	%icc,	%i3,	%o3
	ldd	[%l7 + 0x40],	%o6
	movvc	%icc,	%l4,	%o0
	movvs	%icc,	%o5,	%i6
	addc	%o2,	0x06BF,	%g3
	fnot2s	%f24,	%f2
	edge32n	%g2,	%i2,	%o1
	array8	%g7,	%i0,	%g4
	st	%f13,	[%l7 + 0x1C]
	nop
	set	0x70, %i2
	lduw	[%l7 + %i2],	%o6
	sir	0x0922
	save %g6, 0x120A, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o4,	%l5,	%g1
	fmovsg	%icc,	%f31,	%f27
	umulcc	%l0,	0x1A86,	%l2
	xor	%i4,	%l6,	%l3
	mova	%xcc,	%i5,	%g5
	xnor	%l1,	0x1DB9,	%i1
	nop
	set	0x1E, %g7
	ldsh	[%l7 + %g7],	%i3
	add	%o3,	%o7,	%l4
	movcc	%icc,	%o0,	%o5
	array16	%i6,	%o2,	%g3
	ldub	[%l7 + 0x38],	%i2
	add	%g2,	%g7,	%i0
	fornot2	%f0,	%f14,	%f18
	fxnors	%f15,	%f31,	%f6
	ldx	[%l7 + 0x60],	%g4
	edge32n	%o1,	%o6,	%i7
	umul	%g6,	0x0E4B,	%l5
	andncc	%o4,	%l0,	%g1
	ldsw	[%l7 + 0x58],	%i4
	for	%f20,	%f2,	%f20
	subcc	%l6,	0x0887,	%l3
	movrne	%i5,	%g5,	%l2
	faligndata	%f12,	%f22,	%f6
	addccc	%l1,	%i3,	%o3
	and	%i1,	0x0066,	%l4
	nop
	set	0x78, %i6
	stw	%o0,	[%l7 + %i6]
	edge8ln	%o5,	%o7,	%o2
	sra	%i6,	0x18,	%i2
	movge	%icc,	%g2,	%g3
	fmovsn	%xcc,	%f5,	%f5
	st	%f16,	[%l7 + 0x4C]
	edge16	%g7,	%g4,	%i0
	movrlz	%o6,	0x163,	%o1
	stx	%g6,	[%l7 + 0x38]
	subccc	%i7,	0x0D7E,	%l5
	edge16n	%l0,	%g1,	%o4
	movne	%xcc,	%i4,	%l3
	movvc	%icc,	%i5,	%g5
	orn	%l2,	0x0C9E,	%l1
	fzero	%f12
	movpos	%xcc,	%l6,	%i3
	orncc	%i1,	%l4,	%o3
	sub	%o0,	%o7,	%o5
	edge16l	%i6,	%o2,	%g2
	fpsub16s	%f2,	%f19,	%f22
	mulscc	%i2,	0x0989,	%g3
	xnor	%g7,	0x1738,	%g4
	edge8ln	%i0,	%o1,	%g6
	fands	%f4,	%f26,	%f0
	andcc	%i7,	%o6,	%l0
	ldsw	[%l7 + 0x3C],	%l5
	andn	%o4,	0x1BE3,	%i4
	umul	%g1,	0x1D30,	%i5
	udivx	%g5,	0x1AF5,	%l2
	movl	%xcc,	%l1,	%l3
	sll	%l6,	%i3,	%l4
	fmovsvs	%icc,	%f26,	%f17
	andn	%o3,	0x001D,	%o0
	subc	%i1,	0x0F20,	%o7
	edge32ln	%i6,	%o2,	%o5
	orn	%i2,	0x009E,	%g2
	nop
	set	0x72, %o2
	ldub	[%l7 + %o2],	%g7
	movn	%xcc,	%g3,	%g4
	fmovda	%xcc,	%f14,	%f25
	edge8	%i0,	%g6,	%o1
	nop
	set	0x18, %g1
	stx	%o6,	[%l7 + %g1]
	stx	%i7,	[%l7 + 0x70]
	ldx	[%l7 + 0x18],	%l5
	edge32ln	%l0,	%o4,	%i4
	and	%i5,	0x079E,	%g5
	stb	%g1,	[%l7 + 0x22]
	move	%icc,	%l2,	%l1
	ldub	[%l7 + 0x73],	%l6
	fnot2s	%f13,	%f6
	subc	%i3,	0x1F1E,	%l4
	movleu	%icc,	%o3,	%o0
	smulcc	%l3,	0x18C1,	%i1
	edge8l	%i6,	%o7,	%o5
	edge8	%o2,	%i2,	%g7
	edge32	%g3,	%g2,	%i0
	fcmpgt16	%f24,	%f18,	%g4
	edge32n	%o1,	%g6,	%o6
	udivx	%l5,	0x1EEF,	%l0
	ldd	[%l7 + 0x20],	%o4
	orn	%i4,	0x1036,	%i5
	srax	%g5,	0x02,	%i7
	xor	%g1,	0x049E,	%l2
	movvc	%icc,	%l6,	%i3
	ldd	[%l7 + 0x78],	%l0
	or	%o3,	0x00D4,	%l4
	fmul8x16	%f22,	%f24,	%f12
	ldx	[%l7 + 0x58],	%l3
	lduh	[%l7 + 0x58],	%o0
	udiv	%i6,	0x10D9,	%i1
	movvc	%xcc,	%o7,	%o5
	pdist	%f16,	%f30,	%f18
	movle	%icc,	%i2,	%g7
	edge8	%o2,	%g2,	%g3
	edge8ln	%i0,	%g4,	%o1
	edge32n	%o6,	%l5,	%g6
	movrne	%l0,	%o4,	%i4
	ldx	[%l7 + 0x50],	%i5
	orncc	%g5,	0x0829,	%g1
	fmovsne	%icc,	%f11,	%f19
	fnands	%f7,	%f17,	%f15
	fmovdg	%xcc,	%f1,	%f20
	subcc	%i7,	%l6,	%i3
	subc	%l2,	%o3,	%l4
	sllx	%l1,	%l3,	%o0
	fmovsneg	%xcc,	%f14,	%f13
	lduw	[%l7 + 0x1C],	%i1
	alignaddr	%i6,	%o5,	%o7
	xor	%i2,	0x0C03,	%o2
	stw	%g2,	[%l7 + 0x50]
	subccc	%g3,	%g7,	%g4
	ldsw	[%l7 + 0x50],	%o1
	sllx	%o6,	%i0,	%l5
	edge16	%l0,	%g6,	%o4
	movrlz	%i5,	0x288,	%i4
	ldub	[%l7 + 0x10],	%g1
	fmovda	%icc,	%f26,	%f29
	save %g5, %l6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i7,	%l2
	save %o3, %l1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o0,	0x0174,	%i1
	srl	%i6,	%o5,	%l3
	mulscc	%i2,	%o2,	%g2
	fmul8x16au	%f4,	%f3,	%f2
	movne	%icc,	%g3,	%g7
	movrlez	%g4,	%o1,	%o6
	sdivcc	%i0,	0x11A0,	%o7
	movn	%icc,	%l5,	%g6
	udivcc	%l0,	0x0B80,	%i5
	nop
	set	0x6C, %i0
	lduw	[%l7 + %i0],	%i4
	std	%f18,	[%l7 + 0x30]
	fmovrdlz	%o4,	%f24,	%f12
	sll	%g5,	0x18,	%g1
	edge16l	%l6,	%i3,	%i7
	edge32n	%o3,	%l2,	%l1
	umulcc	%l4,	0x1F71,	%o0
	fmovspos	%icc,	%f21,	%f17
	smulcc	%i6,	%i1,	%l3
	stw	%o5,	[%l7 + 0x5C]
	fxor	%f6,	%f26,	%f8
	sll	%i2,	%g2,	%o2
	movrgz	%g3,	0x394,	%g4
	movleu	%xcc,	%g7,	%o6
	st	%f20,	[%l7 + 0x60]
	edge32ln	%i0,	%o1,	%l5
	sra	%g6,	%l0,	%o7
	xnor	%i4,	0x06BF,	%o4
	mova	%xcc,	%g5,	%g1
	udiv	%i5,	0x0B08,	%l6
	stb	%i7,	[%l7 + 0x5F]
	fmovdpos	%icc,	%f8,	%f8
	addc	%i3,	%o3,	%l1
	xnorcc	%l2,	%l4,	%o0
	edge8n	%i6,	%i1,	%o5
	edge32n	%i2,	%l3,	%g2
	popc	0x1FB8,	%o2
	orncc	%g4,	%g7,	%o6
	xorcc	%g3,	0x053A,	%i0
	orn	%o1,	%g6,	%l5
	fmovdvs	%xcc,	%f23,	%f8
	array32	%o7,	%l0,	%o4
	ld	[%l7 + 0x34],	%f23
	edge32	%g5,	%i4,	%i5
	fmovd	%f26,	%f14
	edge16l	%l6,	%g1,	%i3
	sllx	%i7,	0x02,	%o3
	sra	%l1,	0x03,	%l4
	subccc	%l2,	0x0121,	%o0
	movg	%icc,	%i6,	%i1
	edge32	%o5,	%l3,	%i2
	ldd	[%l7 + 0x70],	%f2
	alignaddr	%o2,	%g4,	%g7
	mulscc	%g2,	0x06D6,	%o6
	nop
	set	0x38, %l0
	ldsb	[%l7 + %l0],	%i0
	ldx	[%l7 + 0x30],	%g3
	ldsb	[%l7 + 0x71],	%o1
	move	%icc,	%l5,	%g6
	fmovdneg	%icc,	%f29,	%f12
	subcc	%o7,	0x19A2,	%l0
	fmul8x16au	%f7,	%f7,	%f4
	popc	%o4,	%g5
	for	%f10,	%f26,	%f14
	sethi	0x11E0,	%i4
	save %i5, 0x00F4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i3,	%g1,	%i7
	array16	%l1,	%o3,	%l2
	fxnors	%f20,	%f16,	%f11
	edge32	%l4,	%o0,	%i6
	edge16	%i1,	%o5,	%i2
	edge16l	%l3,	%o2,	%g4
	stb	%g7,	[%l7 + 0x3B]
	edge16	%g2,	%i0,	%g3
	lduw	[%l7 + 0x08],	%o6
	movrne	%l5,	%g6,	%o1
	ldd	[%l7 + 0x20],	%l0
	fpadd32s	%f29,	%f13,	%f19
	ldsh	[%l7 + 0x78],	%o4
	fmovrsgez	%o7,	%f28,	%f1
	fmovrslz	%g5,	%f23,	%f31
	movrlz	%i5,	%i4,	%i3
	fsrc2s	%f3,	%f11
	edge8ln	%g1,	%l6,	%l1
	movgu	%xcc,	%o3,	%i7
	movrlez	%l4,	%o0,	%l2
	fzero	%f2
	fcmpgt16	%f10,	%f4,	%i1
	srlx	%o5,	0x0C,	%i6
	edge16ln	%l3,	%o2,	%i2
	fmul8x16	%f6,	%f4,	%f28
	movrlz	%g7,	0x04F,	%g4
	edge32l	%i0,	%g3,	%o6
	st	%f17,	[%l7 + 0x1C]
	movpos	%xcc,	%l5,	%g2
	xor	%o1,	%l0,	%o4
	lduw	[%l7 + 0x70],	%o7
	movgu	%xcc,	%g5,	%i5
	edge16l	%i4,	%i3,	%g6
	fnot2s	%f29,	%f15
	xnorcc	%l6,	%g1,	%o3
	fmovdpos	%icc,	%f21,	%f28
	smulcc	%i7,	%l1,	%l4
	ld	[%l7 + 0x70],	%f17
	fmovsvs	%xcc,	%f0,	%f3
	ld	[%l7 + 0x60],	%f20
	sra	%l2,	0x1C,	%o0
	andn	%i1,	0x18F6,	%o5
	sll	%i6,	0x1B,	%l3
	fmovdgu	%xcc,	%f2,	%f15
	edge16l	%o2,	%g7,	%i2
	addc	%i0,	0x075B,	%g4
	sethi	0x1E4D,	%o6
	ldx	[%l7 + 0x50],	%g3
	and	%g2,	%o1,	%l5
	sdivcc	%o4,	0x1244,	%o7
	udivcc	%l0,	0x07CD,	%g5
	xnor	%i5,	%i4,	%i3
	movvs	%icc,	%g6,	%g1
	fmovrslz	%l6,	%f8,	%f8
	fsrc1s	%f28,	%f26
	xnor	%i7,	%l1,	%o3
	movvs	%icc,	%l4,	%o0
	edge8n	%i1,	%o5,	%l2
	array8	%l3,	%o2,	%g7
	sub	%i2,	%i0,	%g4
	array16	%o6,	%i6,	%g3
	stw	%o1,	[%l7 + 0x40]
	sdivcc	%l5,	0x12F7,	%g2
	fxors	%f12,	%f2,	%f19
	array8	%o4,	%o7,	%g5
	fcmpeq16	%f0,	%f2,	%l0
	fabss	%f29,	%f14
	array8	%i4,	%i3,	%g6
	movcc	%xcc,	%i5,	%g1
	andcc	%l6,	0x0BA2,	%l1
	sethi	0x12B6,	%o3
	fors	%f11,	%f8,	%f10
	array16	%i7,	%l4,	%o0
	fmul8ulx16	%f22,	%f6,	%f10
	edge16l	%i1,	%l2,	%o5
	fmovs	%f12,	%f21
	addcc	%o2,	%g7,	%l3
	add	%i0,	%i2,	%o6
	edge32ln	%i6,	%g4,	%g3
	fnors	%f19,	%f3,	%f7
	xnor	%l5,	%g2,	%o4
	xnorcc	%o1,	0x03C2,	%o7
	xor	%l0,	0x1AD8,	%i4
	edge8ln	%g5,	%g6,	%i5
	fmul8ulx16	%f4,	%f18,	%f10
	sethi	0x12AC,	%g1
	sir	0x0FF9
	movcs	%icc,	%l6,	%l1
	edge8	%o3,	%i7,	%i3
	srax	%l4,	%i1,	%l2
	lduw	[%l7 + 0x50],	%o0
	lduh	[%l7 + 0x5A],	%o5
	fmovdl	%xcc,	%f20,	%f23
	movg	%icc,	%g7,	%l3
	ldsb	[%l7 + 0x5C],	%i0
	nop
	set	0x5E, %i4
	ldub	[%l7 + %i4],	%i2
	ldd	[%l7 + 0x50],	%f24
	mulscc	%o2,	0x08FF,	%o6
	subccc	%g4,	0x0A6B,	%g3
	fmovdgu	%icc,	%f15,	%f10
	movne	%xcc,	%l5,	%g2
	addc	%o4,	%o1,	%i6
	mova	%xcc,	%o7,	%i4
	ldsw	[%l7 + 0x6C],	%g5
	std	%f2,	[%l7 + 0x50]
	edge16l	%g6,	%l0,	%i5
	ldsh	[%l7 + 0x4E],	%l6
	alignaddr	%g1,	%l1,	%o3
	movn	%xcc,	%i7,	%i3
	mulx	%i1,	0x024B,	%l2
	fcmple16	%f24,	%f16,	%l4
	ldsh	[%l7 + 0x38],	%o0
	edge16l	%o5,	%l3,	%g7
	movpos	%xcc,	%i0,	%o2
	lduh	[%l7 + 0x60],	%o6
	ldsh	[%l7 + 0x36],	%i2
	subc	%g4,	%g3,	%g2
	fpadd32s	%f31,	%f10,	%f25
	movcc	%xcc,	%l5,	%o4
	addcc	%i6,	0x0F01,	%o1
	movre	%i4,	0x1FD,	%o7
	edge16	%g5,	%l0,	%i5
	add	%l6,	0x184A,	%g6
	edge8n	%g1,	%l1,	%i7
	srax	%i3,	%i1,	%l2
	fmovdvc	%icc,	%f6,	%f19
	srax	%o3,	0x00,	%l4
	fmovdgu	%icc,	%f23,	%f4
	array32	%o5,	%o0,	%l3
	fmovsvs	%icc,	%f31,	%f18
	smul	%g7,	%i0,	%o2
	array32	%i2,	%o6,	%g3
	fmuld8sux16	%f9,	%f4,	%f24
	fmovsneg	%icc,	%f19,	%f6
	stb	%g2,	[%l7 + 0x34]
	ldx	[%l7 + 0x58],	%l5
	sir	0x06A0
	srlx	%o4,	%g4,	%o1
	andcc	%i6,	0x1580,	%i4
	sth	%g5,	[%l7 + 0x64]
	edge16	%l0,	%o7,	%i5
	fmovdvs	%icc,	%f1,	%f15
	fzero	%f26
	movrne	%l6,	%g6,	%l1
	ldx	[%l7 + 0x20],	%g1
	fmovsne	%xcc,	%f12,	%f4
	or	%i7,	0x07FD,	%i1
	fmovsg	%icc,	%f28,	%f26
	ldx	[%l7 + 0x60],	%l2
	xnorcc	%i3,	%l4,	%o3
	movvc	%icc,	%o5,	%l3
	fcmps	%fcc1,	%f6,	%f24
	ldd	[%l7 + 0x68],	%g6
	fmuld8sux16	%f4,	%f12,	%f0
	fmovdleu	%xcc,	%f18,	%f18
	fone	%f22
	or	%i0,	0x19D9,	%o0
	sdivcc	%o2,	0x029E,	%i2
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	subccc	%g3,	%g4,	%o1
	ldd	[%l7 + 0x30],	%f12
	move	%icc,	%i6,	%o4
	movre	%g5,	%i4,	%o7
	andcc	%l0,	0x088B,	%i5
	move	%icc,	%l6,	%l1
	fmovdg	%xcc,	%f7,	%f14
	ldsh	[%l7 + 0x12],	%g6
	sethi	0x142F,	%g1
	edge8n	%i1,	%l2,	%i7
	smul	%i3,	%l4,	%o5
	fmovsleu	%icc,	%f23,	%f23
	fcmpd	%fcc1,	%f16,	%f14
	fpackfix	%f16,	%f19
	fmovse	%icc,	%f24,	%f10
	fandnot1	%f18,	%f18,	%f30
	movn	%icc,	%l3,	%o3
	fmovdvc	%xcc,	%f6,	%f4
	umulcc	%g7,	%o0,	%o2
	fmul8x16au	%f11,	%f19,	%f12
	movleu	%xcc,	%i0,	%i2
	edge32n	%g2,	%l5,	%o6
	lduh	[%l7 + 0x64],	%g3
	fnegs	%f25,	%f8
	ldd	[%l7 + 0x40],	%f2
	stb	%o1,	[%l7 + 0x1B]
	edge16ln	%g4,	%i6,	%o4
	xor	%i4,	0x027F,	%o7
	sdivcc	%g5,	0x07C0,	%l0
	movne	%xcc,	%l6,	%l1
	edge32n	%g6,	%i5,	%g1
	xnor	%l2,	%i1,	%i7
	udivcc	%l4,	0x1E00,	%i3
	xor	%o5,	%o3,	%g7
	stw	%o0,	[%l7 + 0x18]
	fones	%f23
	array32	%o2,	%l3,	%i0
	edge32	%g2,	%i2,	%o6
	andcc	%l5,	%o1,	%g3
	movvc	%xcc,	%g4,	%i6
	orncc	%o4,	0x0168,	%o7
	ldd	[%l7 + 0x30],	%f16
	fmovscc	%xcc,	%f0,	%f18
	stw	%i4,	[%l7 + 0x40]
	sra	%g5,	0x0E,	%l6
	fxnor	%f2,	%f30,	%f28
	fones	%f18
	edge16ln	%l1,	%l0,	%i5
	movleu	%icc,	%g6,	%l2
	subccc	%g1,	0x1D27,	%i1
	movcc	%icc,	%i7,	%l4
	subc	%o5,	0x1CC5,	%i3
	movn	%icc,	%o3,	%o0
	fnot1	%f14,	%f2
	xnor	%g7,	0x0E98,	%o2
	srax	%i0,	0x00,	%l3
	movn	%xcc,	%i2,	%g2
	udivx	%o6,	0x1C5F,	%l5
	fmovsleu	%icc,	%f14,	%f1
	sethi	0x10B9,	%g3
	xorcc	%o1,	%i6,	%g4
	edge8l	%o7,	%o4,	%g5
	movg	%icc,	%i4,	%l1
	ldsh	[%l7 + 0x2A],	%l6
	udivx	%i5,	0x03C1,	%l0
	sra	%g6,	0x0E,	%g1
	movvs	%icc,	%i1,	%i7
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%l4
	addc	%l2,	0x0753,	%o5
	sdivcc	%o3,	0x1DDC,	%i3
	fmovdgu	%xcc,	%f14,	%f14
	array8	%o0,	%o2,	%i0
	edge32ln	%l3,	%g7,	%g2
	fmovrsgez	%i2,	%f19,	%f12
	addcc	%o6,	0x0C26,	%l5
	movgu	%icc,	%o1,	%g3
	movleu	%xcc,	%g4,	%o7
	movvs	%icc,	%o4,	%g5
	sdivx	%i4,	0x04CD,	%i6
	fmovrdgz	%l6,	%f12,	%f6
	addc	%l1,	%l0,	%g6
	sdivx	%g1,	0x0058,	%i1
	mulscc	%i7,	%i5,	%l4
	movn	%xcc,	%l2,	%o3
	lduw	[%l7 + 0x18],	%o5
	subc	%i3,	%o0,	%i0
	movre	%l3,	%o2,	%g2
	movge	%icc,	%g7,	%o6
	sir	0x1F1A
	fand	%f18,	%f30,	%f4
	sdivx	%l5,	0x14E8,	%i2
	edge16l	%g3,	%o1,	%o7
	movrne	%g4,	0x024,	%o4
	array16	%i4,	%g5,	%i6
	fpmerge	%f15,	%f31,	%f26
	addcc	%l6,	%l0,	%g6
	edge8	%g1,	%i1,	%l1
	fmul8x16	%f1,	%f22,	%f28
	st	%f20,	[%l7 + 0x1C]
	fones	%f30
	edge32ln	%i7,	%i5,	%l4
	udivcc	%o3,	0x1319,	%o5
	edge16l	%l2,	%o0,	%i3
	st	%f0,	[%l7 + 0x34]
	movneg	%xcc,	%l3,	%o2
	movrgez	%i0,	0x235,	%g7
	save %g2, %o6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f5,	%f24
	edge16ln	%i2,	%o1,	%o7
	sir	0x024B
	movne	%xcc,	%g3,	%o4
	fmovsleu	%xcc,	%f24,	%f15
	movvs	%xcc,	%g4,	%i4
	fmovdneg	%xcc,	%f15,	%f30
	fmovdle	%xcc,	%f27,	%f0
	and	%i6,	%g5,	%l0
	sdiv	%g6,	0x14F0,	%l6
	xnorcc	%g1,	0x0159,	%i1
	sdivx	%i7,	0x0523,	%i5
	ldub	[%l7 + 0x47],	%l1
	fandnot1s	%f11,	%f23,	%f2
	edge16ln	%l4,	%o3,	%o5
	array32	%o0,	%l2,	%i3
	lduw	[%l7 + 0x38],	%o2
	fornot1	%f16,	%f22,	%f4
	stb	%l3,	[%l7 + 0x39]
	fand	%f0,	%f4,	%f18
	ldd	[%l7 + 0x70],	%g6
	udiv	%g2,	0x149C,	%i0
	movvs	%icc,	%o6,	%i2
	ldx	[%l7 + 0x60],	%o1
	movl	%icc,	%o7,	%l5
	movrgez	%g3,	0x1D7,	%o4
	sdivcc	%i4,	0x1221,	%g4
	mulx	%g5,	%i6,	%g6
	movrgz	%l6,	%l0,	%g1
	restore %i7, %i5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l4,	0x14FD,	%l1
	movne	%icc,	%o5,	%o0
	fnors	%f6,	%f30,	%f0
	ldsh	[%l7 + 0x46],	%l2
	fandnot1s	%f14,	%f7,	%f24
	xorcc	%i3,	0x19A6,	%o3
	lduh	[%l7 + 0x26],	%l3
	ldsw	[%l7 + 0x44],	%o2
	sub	%g2,	%i0,	%o6
	movl	%icc,	%g7,	%i2
	move	%icc,	%o7,	%o1
	ldsw	[%l7 + 0x34],	%g3
	movrlez	%l5,	%i4,	%g4
	sll	%o4,	0x1A,	%i6
	ldd	[%l7 + 0x78],	%g4
	xorcc	%g6,	%l0,	%g1
	ldd	[%l7 + 0x30],	%i6
	fnot1s	%f26,	%f16
	smul	%l6,	%i5,	%l4
	orncc	%i1,	0x0EF6,	%o5
	fmovsge	%icc,	%f12,	%f23
	stb	%o0,	[%l7 + 0x3D]
	sll	%l2,	%l1,	%o3
	orn	%l3,	0x1005,	%o2
	sdivcc	%g2,	0x054E,	%i3
	fmovsvs	%icc,	%f10,	%f0
	ldx	[%l7 + 0x68],	%i0
	fmovdcs	%xcc,	%f31,	%f6
	array32	%o6,	%i2,	%g7
	stx	%o1,	[%l7 + 0x38]
	fxor	%f10,	%f8,	%f4
	andcc	%g3,	%l5,	%i4
	fnors	%f31,	%f7,	%f25
	edge32	%o7,	%g4,	%i6
	edge8l	%g5,	%g6,	%l0
	fone	%f28
	stb	%o4,	[%l7 + 0x45]
	ldx	[%l7 + 0x58],	%i7
	stx	%l6,	[%l7 + 0x40]
	umul	%i5,	0x0569,	%g1
	movn	%icc,	%i1,	%l4
	movneg	%xcc,	%o0,	%l2
	xorcc	%l1,	0x07CF,	%o3
	st	%f7,	[%l7 + 0x58]
	movg	%icc,	%l3,	%o2
	fsrc1	%f12,	%f18
	smul	%g2,	0x0C0B,	%i3
	fcmpeq16	%f26,	%f16,	%i0
	ldub	[%l7 + 0x67],	%o5
	edge16n	%o6,	%g7,	%i2
	ldsw	[%l7 + 0x3C],	%o1
	xorcc	%l5,	0x073A,	%i4
	stx	%g3,	[%l7 + 0x60]
	fandnot2s	%f31,	%f31,	%f13
	edge8	%o7,	%i6,	%g4
	movl	%xcc,	%g6,	%g5
	sra	%l0,	%o4,	%i7
	fpack32	%f20,	%f18,	%f18
	fcmpgt32	%f30,	%f18,	%i5
	movleu	%xcc,	%l6,	%g1
	xor	%l4,	0x1BE7,	%o0
	udivx	%i1,	0x16A4,	%l1
	movcc	%icc,	%o3,	%l3
	sra	%l2,	%o2,	%i3
	sir	0x049D
	andncc	%g2,	%i0,	%o6
	fnands	%f21,	%f20,	%f22
	sdivx	%o5,	0x06E8,	%g7
	edge32l	%o1,	%l5,	%i2
	st	%f9,	[%l7 + 0x70]
	addcc	%i4,	0x0333,	%g3
	orn	%o7,	%g4,	%g6
	edge32l	%g5,	%l0,	%o4
	lduw	[%l7 + 0x34],	%i6
	edge8n	%i7,	%i5,	%l6
	nop
	set	0x4A, %o5
	sth	%g1,	[%l7 + %o5]
	add	%l4,	%o0,	%i1
	orncc	%o3,	%l3,	%l2
	edge8	%l1,	%i3,	%o2
	lduw	[%l7 + 0x48],	%g2
	move	%xcc,	%o6,	%o5
	popc	0x1C2A,	%i0
	smulcc	%o1,	%g7,	%i2
	movleu	%icc,	%l5,	%g3
	xnorcc	%i4,	%o7,	%g4
	array8	%g6,	%l0,	%g5
	ldsb	[%l7 + 0x40],	%o4
	sll	%i7,	0x0B,	%i5
	lduh	[%l7 + 0x10],	%l6
	addcc	%i6,	0x1989,	%l4
	fmul8ulx16	%f10,	%f26,	%f4
	fsrc2	%f26,	%f4
	movl	%xcc,	%g1,	%i1
	edge32n	%o0,	%o3,	%l2
	orncc	%l1,	%i3,	%l3
	edge32	%o2,	%g2,	%o5
	movgu	%xcc,	%o6,	%o1
	edge32l	%i0,	%g7,	%l5
	ldd	[%l7 + 0x40],	%i2
	movgu	%xcc,	%i4,	%g3
	add	%g4,	0x0C9E,	%g6
	fmovsvs	%xcc,	%f18,	%f11
	fnot2s	%f0,	%f30
	stw	%l0,	[%l7 + 0x0C]
	fornot2s	%f13,	%f2,	%f7
	edge16ln	%g5,	%o4,	%o7
	andncc	%i7,	%i5,	%i6
	movne	%icc,	%l4,	%g1
	movg	%icc,	%i1,	%o0
	subcc	%o3,	%l6,	%l1
	addcc	%i3,	%l2,	%o2
	movvs	%icc,	%l3,	%g2
	ldd	[%l7 + 0x68],	%o4
	sethi	0x1E83,	%o1
	movn	%icc,	%i0,	%g7
	movleu	%icc,	%l5,	%o6
	orcc	%i2,	0x169C,	%g3
	sethi	0x1C8D,	%i4
	alignaddr	%g4,	%l0,	%g6
	move	%xcc,	%o4,	%g5
	add	%i7,	%o7,	%i5
	fmovdgu	%icc,	%f5,	%f0
	fsrc2s	%f19,	%f25
	move	%icc,	%l4,	%i6
	sllx	%g1,	%i1,	%o3
	edge32	%o0,	%l6,	%l1
	ldsb	[%l7 + 0x30],	%l2
	sub	%i3,	0x10BB,	%o2
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	fcmped	%fcc3,	%f20,	%f12
	xnor	%o5,	0x0C81,	%o1
	edge8n	%i0,	%g7,	%l5
	movpos	%xcc,	%i2,	%o6
	subcc	%g3,	%g4,	%i4
	ld	[%l7 + 0x2C],	%f23
	fandnot2s	%f25,	%f9,	%f4
	movrgez	%l0,	0x3A9,	%g6
	andcc	%o4,	0x0D11,	%i7
	sllx	%g5,	%o7,	%l4
	fandnot1	%f0,	%f22,	%f2
	sra	%i5,	%i6,	%i1
	xor	%g1,	0x1E47,	%o0
	xorcc	%o3,	%l1,	%l2
	movg	%icc,	%l6,	%i3
	edge16l	%o2,	%l3,	%g2
	orncc	%o5,	0x0F17,	%o1
	ldsh	[%l7 + 0x3A],	%i0
	or	%g7,	0x172A,	%l5
	ldsb	[%l7 + 0x79],	%o6
	popc	%g3,	%g4
	array32	%i2,	%i4,	%l0
	nop
	set	0x14, %l6
	ldsw	[%l7 + %l6],	%o4
	edge32l	%g6,	%i7,	%o7
	mova	%xcc,	%l4,	%i5
	stx	%g5,	[%l7 + 0x50]
	xnorcc	%i6,	0x0D11,	%i1
	array32	%g1,	%o3,	%o0
	movrgez	%l1,	0x134,	%l2
	ldub	[%l7 + 0x64],	%l6
	movrlz	%i3,	%o2,	%g2
	nop
	set	0x5F, %o3
	ldsb	[%l7 + %o3],	%l3
	sth	%o1,	[%l7 + 0x30]
	sth	%i0,	[%l7 + 0x34]
	movrne	%g7,	0x239,	%l5
	fmovrslez	%o6,	%f13,	%f6
	fmovsleu	%icc,	%f29,	%f26
	fmovrsne	%o5,	%f20,	%f7
	sra	%g3,	%i2,	%i4
	movle	%icc,	%l0,	%g4
	fnands	%f24,	%f14,	%f10
	srl	%o4,	0x1B,	%i7
	fmul8x16au	%f5,	%f8,	%f30
	ldsh	[%l7 + 0x2A],	%o7
	movrgz	%g6,	0x313,	%i5
	movg	%icc,	%l4,	%i6
	fpsub32s	%f27,	%f5,	%f23
	orcc	%g5,	%i1,	%o3
	edge8n	%g1,	%o0,	%l1
	ldub	[%l7 + 0x7F],	%l2
	sra	%l6,	%i3,	%g2
	alignaddrl	%o2,	%l3,	%o1
	fmovrsgz	%i0,	%f9,	%f10
	fmovda	%icc,	%f10,	%f13
	fmovda	%xcc,	%f29,	%f17
	alignaddr	%l5,	%g7,	%o6
	fmovd	%f0,	%f20
	addc	%g3,	0x1C6F,	%i2
	movcs	%xcc,	%i4,	%l0
	lduw	[%l7 + 0x3C],	%o5
	xnorcc	%g4,	%i7,	%o4
	restore %o7, %g6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l4,	%f8,	%f10
	stx	%i6,	[%l7 + 0x18]
	st	%f29,	[%l7 + 0x7C]
	edge32l	%g5,	%o3,	%i1
	fmovdcs	%xcc,	%f12,	%f21
	st	%f11,	[%l7 + 0x08]
	stb	%g1,	[%l7 + 0x54]
	srax	%o0,	0x08,	%l2
	subccc	%l1,	0x1999,	%i3
	ldd	[%l7 + 0x68],	%f12
	orncc	%g2,	0x0A43,	%o2
	movge	%xcc,	%l3,	%o1
	edge16	%l6,	%i0,	%g7
	movvc	%xcc,	%o6,	%l5
	ldd	[%l7 + 0x78],	%g2
	nop
	set	0x10, %l1
	lduh	[%l7 + %l1],	%i4
	movrlez	%l0,	%o5,	%g4
	sdivcc	%i7,	0x077D,	%i2
	subcc	%o4,	0x11AE,	%o7
	movg	%xcc,	%g6,	%l4
	ldx	[%l7 + 0x28],	%i6
	movrlez	%i5,	0x0A5,	%o3
	andn	%g5,	0x0D8A,	%i1
	fmovdn	%xcc,	%f18,	%f5
	edge8l	%g1,	%o0,	%l2
	fandnot2s	%f28,	%f4,	%f29
	fpack16	%f22,	%f5
	fsrc1	%f0,	%f14
	movrgez	%i3,	%g2,	%o2
	or	%l3,	%l1,	%l6
	sdivx	%o1,	0x00D4,	%g7
	ldsb	[%l7 + 0x0F],	%o6
	fmovs	%f25,	%f11
	fcmple16	%f2,	%f30,	%i0
	fpadd32	%f6,	%f4,	%f20
	movleu	%xcc,	%g3,	%l5
	fornot1s	%f20,	%f28,	%f29
	sdiv	%l0,	0x01EC,	%i4
	orncc	%g4,	0x009F,	%o5
	fors	%f26,	%f12,	%f11
	edge8	%i2,	%o4,	%o7
	fcmpeq32	%f24,	%f24,	%g6
	move	%icc,	%l4,	%i7
	stx	%i6,	[%l7 + 0x60]
	edge8n	%o3,	%g5,	%i1
	movvs	%xcc,	%g1,	%i5
	movvs	%icc,	%l2,	%o0
	edge32n	%i3,	%o2,	%l3
	array32	%l1,	%l6,	%g2
	orcc	%g7,	%o1,	%o6
	movrlez	%i0,	0x1C5,	%l5
	movcc	%xcc,	%g3,	%i4
	array16	%l0,	%o5,	%i2
	movg	%xcc,	%o4,	%o7
	ldsw	[%l7 + 0x50],	%g6
	movcs	%icc,	%l4,	%g4
	fmovse	%xcc,	%f24,	%f9
	umulcc	%i7,	%o3,	%i6
	ldub	[%l7 + 0x30],	%g5
	stx	%i1,	[%l7 + 0x50]
	edge8n	%g1,	%l2,	%i5
	fmul8sux16	%f8,	%f12,	%f24
	movvs	%icc,	%i3,	%o0
	edge8l	%o2,	%l3,	%l1
	movrgez	%l6,	%g2,	%g7
	add	%o6,	0x164D,	%o1
	fmovrdlez	%i0,	%f4,	%f8
	movvc	%xcc,	%l5,	%i4
	sethi	0x026E,	%g3
	orcc	%o5,	%l0,	%i2
	srl	%o4,	0x12,	%g6
	fnot2	%f2,	%f16
	movvc	%xcc,	%o7,	%l4
	alignaddrl	%g4,	%o3,	%i6
	sll	%g5,	%i1,	%g1
	move	%icc,	%i7,	%i5
	smulcc	%l2,	%i3,	%o2
	mulx	%o0,	%l3,	%l6
	movvs	%xcc,	%g2,	%g7
	lduh	[%l7 + 0x0A],	%o6
	mulx	%l1,	0x0173,	%i0
	ldub	[%l7 + 0x2B],	%o1
	fpadd16s	%f24,	%f14,	%f29
	udivcc	%l5,	0x0AD5,	%i4
	srax	%g3,	0x19,	%o5
	movge	%icc,	%i2,	%o4
	ldsw	[%l7 + 0x28],	%g6
	fnand	%f8,	%f24,	%f28
	fzeros	%f11
	sdivx	%l0,	0x1B8C,	%l4
	subccc	%g4,	0x1E1E,	%o7
	edge8l	%o3,	%i6,	%i1
	sir	0x102D
	xor	%g5,	0x1BCB,	%g1
	faligndata	%f18,	%f22,	%f14
	xnor	%i7,	%i5,	%l2
	fxnor	%f24,	%f16,	%f10
	orn	%i3,	0x1CF1,	%o2
	edge8ln	%o0,	%l6,	%l3
	orcc	%g2,	0x102C,	%o6
	movneg	%xcc,	%l1,	%i0
	movne	%xcc,	%o1,	%l5
	st	%f13,	[%l7 + 0x44]
	ldsh	[%l7 + 0x0A],	%i4
	ldsh	[%l7 + 0x56],	%g3
	ldx	[%l7 + 0x40],	%g7
	or	%o5,	%i2,	%g6
	movcs	%xcc,	%o4,	%l0
	orn	%l4,	0x1085,	%o7
	sdivx	%o3,	0x0055,	%i6
	nop
	set	0x5E, %o6
	lduh	[%l7 + %o6],	%g4
	movcs	%icc,	%g5,	%i1
	add	%g1,	%i5,	%i7
	st	%f22,	[%l7 + 0x40]
	fmovsleu	%icc,	%f15,	%f19
	addcc	%i3,	%o2,	%o0
	fabsd	%f24,	%f14
	smulcc	%l6,	0x0EE9,	%l2
	andn	%g2,	%o6,	%l3
	edge32ln	%l1,	%i0,	%l5
	xor	%o1,	0x0C03,	%i4
	movn	%xcc,	%g7,	%o5
	sub	%g3,	%g6,	%i2
	fzeros	%f23
	fcmpd	%fcc1,	%f16,	%f22
	stw	%l0,	[%l7 + 0x18]
	umul	%l4,	0x09E9,	%o4
	fsrc2	%f18,	%f20
	sll	%o3,	0x08,	%i6
	lduh	[%l7 + 0x0C],	%o7
	nop
	set	0x48, %i1
	stx	%g4,	[%l7 + %i1]
	subc	%g5,	0x0AED,	%i1
	edge32l	%g1,	%i7,	%i5
	ldx	[%l7 + 0x48],	%i3
	movvs	%icc,	%o0,	%o2
	popc	0x08F5,	%l2
	movl	%xcc,	%g2,	%o6
	movneg	%xcc,	%l3,	%l6
	fmovd	%f14,	%f2
	fmovdle	%xcc,	%f16,	%f2
	fmovsle	%icc,	%f22,	%f28
	fmovdgu	%xcc,	%f17,	%f13
	umulcc	%i0,	%l1,	%l5
	addc	%o1,	%i4,	%o5
	edge16	%g7,	%g3,	%i2
	fnot1s	%f22,	%f31
	alignaddr	%g6,	%l0,	%o4
	fnor	%f12,	%f24,	%f16
	srlx	%l4,	%o3,	%o7
	fandnot2	%f2,	%f22,	%f2
	movre	%i6,	0x02F,	%g5
	lduh	[%l7 + 0x5A],	%g4
	popc	%i1,	%i7
	umul	%g1,	%i3,	%o0
	movpos	%xcc,	%i5,	%o2
	edge32l	%l2,	%o6,	%g2
	addc	%l6,	0x09A3,	%l3
	srlx	%i0,	%l1,	%l5
	subc	%o1,	%o5,	%g7
	ldsw	[%l7 + 0x40],	%g3
	fnegd	%f30,	%f28
	mova	%xcc,	%i4,	%i2
	fmovdge	%xcc,	%f30,	%f11
	ldsh	[%l7 + 0x2E],	%l0
	movcs	%icc,	%o4,	%l4
	mulx	%g6,	%o7,	%i6
	xnorcc	%o3,	%g4,	%i1
	subccc	%i7,	%g5,	%g1
	fpack32	%f10,	%f12,	%f12
	fornot1s	%f27,	%f26,	%f22
	movneg	%xcc,	%i3,	%o0
	addccc	%o2,	0x0FBF,	%l2
	fcmple32	%f18,	%f12,	%i5
	movneg	%icc,	%g2,	%o6
	or	%l6,	%i0,	%l3
	ld	[%l7 + 0x20],	%f18
	std	%f22,	[%l7 + 0x70]
	edge8ln	%l5,	%l1,	%o1
	udiv	%o5,	0x0CB3,	%g3
	smul	%g7,	%i2,	%l0
	movleu	%xcc,	%o4,	%l4
	fmovrslz	%i4,	%f7,	%f8
	andn	%o7,	0x1F1A,	%i6
	fcmpgt32	%f6,	%f0,	%o3
	movrne	%g6,	%i1,	%g4
	movcs	%xcc,	%i7,	%g5
	umul	%g1,	%o0,	%i3
	movne	%xcc,	%l2,	%i5
	ldsw	[%l7 + 0x30],	%g2
	subc	%o6,	0x16E3,	%o2
	smul	%l6,	0x1114,	%l3
	srlx	%i0,	0x0D,	%l5
	xorcc	%o1,	%l1,	%o5
	add	%g7,	0x1E23,	%i2
	movcs	%xcc,	%l0,	%g3
	addcc	%l4,	%i4,	%o7
	sth	%i6,	[%l7 + 0x38]
	stb	%o3,	[%l7 + 0x43]
	mova	%icc,	%g6,	%i1
	sth	%o4,	[%l7 + 0x26]
	fmuld8ulx16	%f11,	%f8,	%f28
	edge16	%i7,	%g5,	%g1
	ldsb	[%l7 + 0x1B],	%g4
	udivcc	%i3,	0x1687,	%o0
	mulscc	%l2,	%g2,	%o6
	fmovrsgz	%o2,	%f29,	%f8
	lduh	[%l7 + 0x12],	%l6
	ld	[%l7 + 0x64],	%f9
	movleu	%xcc,	%l3,	%i5
	sdiv	%l5,	0x1159,	%o1
	movl	%xcc,	%i0,	%l1
	array16	%o5,	%g7,	%l0
	fnegs	%f26,	%f16
	edge32n	%i2,	%g3,	%i4
	movle	%xcc,	%o7,	%i6
	movle	%icc,	%l4,	%g6
	sethi	0x199D,	%i1
	fpackfix	%f28,	%f20
	fmovdpos	%icc,	%f24,	%f29
	movgu	%xcc,	%o4,	%o3
	fornot2	%f24,	%f16,	%f10
	sdiv	%g5,	0x1581,	%i7
	xorcc	%g1,	0x054F,	%i3
	movrgez	%o0,	%l2,	%g2
	movge	%icc,	%o6,	%g4
	movrlez	%o2,	0x205,	%l6
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	ldsb	[%l7 + 0x46],	%o1
	array8	%i0,	%l3,	%l1
	udivcc	%g7,	0x1E3A,	%o5
	stb	%i2,	[%l7 + 0x75]
	fmovse	%xcc,	%f11,	%f2
	fandnot2	%f24,	%f24,	%f30
	movpos	%xcc,	%g3,	%i4
	ldsb	[%l7 + 0x61],	%o7
	st	%f13,	[%l7 + 0x78]
	ldsb	[%l7 + 0x4B],	%l0
	fmovdn	%icc,	%f4,	%f9
	addccc	%i6,	0x1970,	%l4
	stx	%i1,	[%l7 + 0x10]
	ldd	[%l7 + 0x60],	%f4
	fcmpgt32	%f14,	%f4,	%o4
	ldx	[%l7 + 0x78],	%g6
	edge32	%o3,	%g5,	%g1
	array32	%i3,	%i7,	%o0
	fnegd	%f28,	%f22
	sth	%l2,	[%l7 + 0x66]
	movgu	%xcc,	%o6,	%g2
	fmovsneg	%icc,	%f24,	%f12
	sth	%g4,	[%l7 + 0x2E]
	ldd	[%l7 + 0x30],	%f10
	orncc	%l6,	0x0FE4,	%o2
	ldub	[%l7 + 0x36],	%l5
	edge8n	%o1,	%i0,	%l3
	subccc	%l1,	0x13C7,	%i5
	movrgez	%g7,	0x1C8,	%i2
	add	%g3,	%o5,	%i4
	subc	%l0,	0x1807,	%i6
	edge16l	%o7,	%l4,	%i1
	movcc	%xcc,	%o4,	%g6
	st	%f21,	[%l7 + 0x2C]
	addc	%g5,	0x003A,	%g1
	fmovsvs	%icc,	%f24,	%f9
	movrlez	%o3,	%i3,	%o0
	or	%i7,	%l2,	%g2
	ldd	[%l7 + 0x18],	%f12
	smulcc	%o6,	%g4,	%l6
	umulcc	%l5,	0x12CD,	%o1
	fmovdne	%xcc,	%f17,	%f11
	andn	%o2,	%l3,	%l1
	alignaddr	%i0,	%g7,	%i2
	sdivx	%g3,	0x0544,	%o5
	movvs	%icc,	%i4,	%l0
	sethi	0x0C15,	%i6
	umul	%i5,	%o7,	%l4
	edge32	%o4,	%i1,	%g5
	edge16n	%g1,	%g6,	%o3
	movgu	%icc,	%o0,	%i3
	array32	%i7,	%g2,	%l2
	edge8	%o6,	%g4,	%l6
	orncc	%o1,	0x1CBA,	%o2
	umulcc	%l5,	%l1,	%i0
	edge32ln	%l3,	%i2,	%g7
	edge8	%g3,	%i4,	%l0
	st	%f17,	[%l7 + 0x74]
	mova	%xcc,	%i6,	%o5
	alignaddr	%o7,	%i5,	%l4
	edge16n	%o4,	%g5,	%i1
	smul	%g6,	0x0F2B,	%o3
	addc	%o0,	0x10A3,	%i3
	fmovrslz	%g1,	%f18,	%f26
	fmovrde	%i7,	%f6,	%f4
	nop
	set	0x54, %i7
	ldub	[%l7 + %i7],	%g2
	fsrc1	%f28,	%f22
	edge8ln	%o6,	%g4,	%l6
	mulx	%l2,	0x0A10,	%o1
	srax	%l5,	%o2,	%l1
	add	%l3,	0x0258,	%i0
	smulcc	%i2,	0x0DFD,	%g3
	fmul8x16au	%f10,	%f3,	%f26
	srlx	%i4,	0x03,	%g7
	add	%i6,	0x0F1F,	%o5
	st	%f8,	[%l7 + 0x64]
	fpack16	%f14,	%f26
	array32	%o7,	%i5,	%l0
	ldd	[%l7 + 0x78],	%l4
	movn	%xcc,	%g5,	%o4
	sth	%i1,	[%l7 + 0x52]
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%g6
	movpos	%xcc,	%o3,	%i3
	std	%f28,	[%l7 + 0x08]
	move	%icc,	%g1,	%i7
	edge16l	%o0,	%o6,	%g2
	umul	%g4,	0x07A8,	%l2
	fmovdne	%xcc,	%f0,	%f6
	fpsub32s	%f4,	%f28,	%f8
	movge	%xcc,	%l6,	%l5
	movvc	%xcc,	%o2,	%o1
	smulcc	%l3,	0x0C37,	%i0
	fmovrsgz	%l1,	%f26,	%f17
	fmovsge	%xcc,	%f19,	%f14
	fands	%f22,	%f18,	%f13
	and	%g3,	%i2,	%g7
	mulscc	%i4,	0x09D5,	%o5
	sllx	%i6,	0x09,	%o7
	fands	%f13,	%f6,	%f18
	edge16	%i5,	%l4,	%g5
	movrlz	%l0,	%i1,	%g6
	fpackfix	%f22,	%f25
	fcmpes	%fcc1,	%f27,	%f18
	movrgz	%o4,	0x036,	%o3
	sllx	%i3,	%i7,	%g1
	ld	[%l7 + 0x20],	%f3
	stx	%o0,	[%l7 + 0x28]
	movvc	%xcc,	%o6,	%g4
	st	%f20,	[%l7 + 0x30]
	udivx	%l2,	0x17C9,	%l6
	umul	%g2,	0x01E1,	%l5
	fmovsneg	%xcc,	%f17,	%f23
	ldd	[%l7 + 0x18],	%f0
	fcmple16	%f0,	%f4,	%o2
	std	%f30,	[%l7 + 0x68]
	movgu	%xcc,	%l3,	%o1
	fmovde	%xcc,	%f14,	%f24
	fmovscs	%xcc,	%f25,	%f6
	ldd	[%l7 + 0x48],	%i0
	edge32	%g3,	%i2,	%l1
	fnegd	%f30,	%f8
	save %g7, 0x1EE9, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%i6,	%f18,	%f2
	fmovrsgz	%o7,	%f6,	%f23
	movg	%xcc,	%i4,	%l4
	udiv	%g5,	0x1FB5,	%i5
	stw	%i1,	[%l7 + 0x70]
	edge32l	%l0,	%g6,	%o4
	movrlez	%o3,	0x24D,	%i7
	smul	%i3,	0x13CB,	%o0
	fmovdle	%icc,	%f9,	%f9
	fmovse	%xcc,	%f24,	%f25
	stb	%o6,	[%l7 + 0x76]
	edge8	%g1,	%l2,	%g4
	sethi	0x0570,	%l6
	bshuffle	%f14,	%f10,	%f4
	ldd	[%l7 + 0x58],	%f24
	lduh	[%l7 + 0x12],	%l5
	umul	%g2,	0x106F,	%l3
	fmovsneg	%xcc,	%f11,	%f0
	srlx	%o1,	%o2,	%g3
	edge8	%i2,	%i0,	%l1
	movre	%o5,	0x144,	%i6
	edge32ln	%o7,	%g7,	%l4
	ldsw	[%l7 + 0x20],	%i4
	mulscc	%g5,	0x1FAA,	%i5
	std	%f12,	[%l7 + 0x40]
	movgu	%icc,	%i1,	%g6
	srl	%l0,	0x11,	%o4
	fmul8sux16	%f14,	%f24,	%f22
	sdivcc	%o3,	0x1BAA,	%i3
	fpsub32s	%f17,	%f2,	%f23
	smul	%o0,	%o6,	%g1
	movvc	%xcc,	%i7,	%g4
	sdiv	%l6,	0x1B87,	%l2
	xnor	%l5,	0x0978,	%l3
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%o1
	andncc	%o2,	%g2,	%i2
	udiv	%i0,	0x08C7,	%g3
	addccc	%o5,	%i6,	%o7
	nop
	set	0x60, %l4
	ldub	[%l7 + %l4],	%l1
	ldd	[%l7 + 0x48],	%f24
	fandnot1s	%f14,	%f15,	%f1
	fmovsne	%icc,	%f14,	%f26
	fmovdcc	%icc,	%f25,	%f19
	andcc	%l4,	%g7,	%i4
	sth	%g5,	[%l7 + 0x78]
	restore %i5, 0x0777, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g6,	%o4,	%l0
	movrlz	%i3,	%o3,	%o0
	edge32	%o6,	%g1,	%g4
	srlx	%i7,	%l2,	%l5
	andcc	%l3,	%o1,	%l6
	nop
	set	0x36, %l3
	ldsh	[%l7 + %l3],	%g2
	fmovrse	%o2,	%f4,	%f14
	movvs	%icc,	%i0,	%g3
	array32	%o5,	%i6,	%i2
	pdist	%f2,	%f0,	%f26
	sdivcc	%o7,	0x10FB,	%l4
	mulscc	%g7,	0x1C9B,	%l1
	fmovdle	%icc,	%f4,	%f15
	subcc	%g5,	0x0475,	%i5
	edge32	%i1,	%g6,	%o4
	smulcc	%i4,	%i3,	%o3
	addcc	%l0,	%o0,	%g1
	mulx	%o6,	0x0233,	%g4
	smul	%l2,	0x1DFD,	%l5
	movpos	%xcc,	%l3,	%i7
	edge8n	%o1,	%l6,	%g2
	sth	%o2,	[%l7 + 0x0E]
	edge8	%g3,	%o5,	%i0
	edge16ln	%i6,	%i2,	%o7
	fxor	%f10,	%f2,	%f24
	array8	%l4,	%l1,	%g5
	ldx	[%l7 + 0x28],	%g7
	umul	%i5,	0x1995,	%i1
	umulcc	%g6,	0x15F7,	%i4
	stw	%o4,	[%l7 + 0x34]
	movrne	%o3,	0x341,	%i3
	sethi	0x09BD,	%l0
	movvc	%icc,	%o0,	%o6
	movne	%xcc,	%g4,	%l2
	addcc	%l5,	%l3,	%i7
	fcmple16	%f14,	%f14,	%g1
	edge32	%o1,	%l6,	%o2
	fandnot1s	%f18,	%f17,	%f27
	edge8l	%g3,	%g2,	%i0
	subccc	%o5,	0x06C0,	%i6
	mulx	%i2,	0x0722,	%l4
	edge8ln	%o7,	%g5,	%g7
	fmovsneg	%icc,	%f20,	%f13
	or	%l1,	%i5,	%i1
	sll	%g6,	0x0A,	%o4
	fmovd	%f18,	%f28
	andncc	%o3,	%i4,	%l0
	fmovdleu	%icc,	%f14,	%f22
	fzero	%f6
	udivx	%o0,	0x0C27,	%i3
	ldsw	[%l7 + 0x44],	%o6
	and	%g4,	%l2,	%l3
	movrlez	%i7,	0x361,	%l5
	st	%f5,	[%l7 + 0x3C]
	sir	0x0BB7
	mulscc	%g1,	0x1185,	%l6
	lduw	[%l7 + 0x78],	%o1
	edge32	%g3,	%o2,	%i0
	array8	%o5,	%i6,	%i2
	fsrc2s	%f19,	%f28
	save %l4, %o7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g5,	0x01D3,	%g7
	addc	%l1,	%i1,	%i5
	subc	%o4,	%g6,	%i4
	fmovrdne	%o3,	%f30,	%f26
	subcc	%l0,	%o0,	%i3
	movre	%g4,	%l2,	%o6
	edge16n	%i7,	%l3,	%l5
	edge8	%g1,	%o1,	%l6
	movneg	%icc,	%o2,	%g3
	xor	%o5,	0x11AD,	%i0
	and	%i6,	0x03E5,	%l4
	edge8l	%o7,	%g2,	%i2
	fmovdleu	%icc,	%f16,	%f27
	fcmpgt32	%f24,	%f12,	%g7
	fmovrsne	%l1,	%f31,	%f2
	lduh	[%l7 + 0x5C],	%i1
	add	%g5,	0x049D,	%i5
	movvs	%icc,	%g6,	%o4
	ld	[%l7 + 0x3C],	%f25
	movrgez	%o3,	0x33D,	%i4
	ldd	[%l7 + 0x60],	%f28
	sethi	0x1D38,	%o0
	edge16	%i3,	%g4,	%l0
	fpadd16s	%f0,	%f29,	%f0
	fmovdneg	%xcc,	%f10,	%f17
	andcc	%o6,	%i7,	%l3
	fmovsgu	%icc,	%f29,	%f23
	fexpand	%f30,	%f8
	xnor	%l2,	0x187B,	%l5
	andncc	%o1,	%l6,	%o2
	fsrc2	%f4,	%f28
	movneg	%xcc,	%g3,	%g1
	movcc	%icc,	%o5,	%i6
	xor	%i0,	%l4,	%o7
	fpadd32	%f12,	%f8,	%f24
	fandnot1	%f10,	%f18,	%f2
	fmovrdgz	%g2,	%f24,	%f0
	stx	%g7,	[%l7 + 0x38]
	movne	%icc,	%i2,	%i1
	movrlez	%g5,	0x1AD,	%i5
	orncc	%g6,	0x1669,	%l1
	fmovdpos	%xcc,	%f23,	%f22
	movre	%o4,	%o3,	%o0
	fmovde	%icc,	%f25,	%f0
	xor	%i3,	%g4,	%i4
	lduh	[%l7 + 0x74],	%l0
	udivx	%i7,	0x0F29,	%l3
	for	%f4,	%f18,	%f8
	movg	%xcc,	%l2,	%o6
	orn	%l5,	0x0D7F,	%o1
	subccc	%o2,	%g3,	%g1
	umulcc	%o5,	%i6,	%i0
	movrgz	%l4,	0x136,	%o7
	edge16n	%l6,	%g7,	%i2
	fandnot1	%f4,	%f12,	%f22
	mova	%xcc,	%g2,	%i1
	edge16l	%g5,	%g6,	%l1
	movrlz	%o4,	0x341,	%o3
	sub	%i5,	%o0,	%i3
	xnorcc	%i4,	%l0,	%g4
	andcc	%i7,	0x02CD,	%l2
	sdivx	%o6,	0x1EC9,	%l3
	for	%f12,	%f0,	%f14
	fornot1s	%f0,	%f25,	%f23
	addcc	%l5,	0x1780,	%o1
	movrlz	%o2,	0x027,	%g3
	edge32n	%o5,	%i6,	%i0
	udivx	%l4,	0x0AF8,	%g1
	edge32l	%o7,	%l6,	%i2
	edge32ln	%g7,	%i1,	%g2
	fmovrdne	%g5,	%f12,	%f26
	andncc	%l1,	%g6,	%o4
	fmul8x16al	%f11,	%f6,	%f8
	fcmpgt32	%f0,	%f10,	%i5
	ldsw	[%l7 + 0x10],	%o3
	movvc	%xcc,	%i3,	%o0
	stw	%l0,	[%l7 + 0x1C]
	udivx	%i4,	0x0793,	%g4
	sdivcc	%i7,	0x0F3C,	%o6
	sethi	0x03CA,	%l2
	fnegd	%f30,	%f6
	edge32ln	%l5,	%o1,	%l3
	edge16ln	%g3,	%o2,	%o5
	movrgz	%i0,	0x061,	%i6
	mova	%xcc,	%l4,	%g1
	edge8n	%o7,	%l6,	%i2
	fands	%f3,	%f8,	%f30
	udiv	%g7,	0x05B1,	%i1
	movne	%icc,	%g2,	%g5
	orncc	%g6,	%l1,	%i5
	orcc	%o4,	%i3,	%o0
	movl	%icc,	%o3,	%i4
	movleu	%xcc,	%l0,	%g4
	sra	%o6,	%i7,	%l2
	srax	%o1,	0x09,	%l3
	sdiv	%g3,	0x1717,	%o2
	xorcc	%o5,	0x1B33,	%i0
	orcc	%l5,	%i6,	%g1
	ldsw	[%l7 + 0x7C],	%l4
	movrlz	%l6,	%i2,	%o7
	stx	%i1,	[%l7 + 0x38]
	ldsh	[%l7 + 0x38],	%g2
	movrgz	%g7,	%g6,	%l1
	sra	%i5,	0x0D,	%o4
	st	%f15,	[%l7 + 0x6C]
	lduh	[%l7 + 0x66],	%g5
	addcc	%i3,	%o0,	%o3
	ldd	[%l7 + 0x60],	%i4
	movrgez	%g4,	0x313,	%o6
	xor	%l0,	%i7,	%o1
	array16	%l2,	%g3,	%o2
	fxnor	%f26,	%f16,	%f8
	movl	%icc,	%o5,	%l3
	lduh	[%l7 + 0x2E],	%i0
	lduw	[%l7 + 0x28],	%i6
	addcc	%g1,	%l5,	%l4
	sdivx	%i2,	0x1FCF,	%l6
	sll	%i1,	%o7,	%g2
	movneg	%icc,	%g7,	%g6
	fpsub32s	%f6,	%f14,	%f19
	xorcc	%l1,	%i5,	%o4
	fpsub16	%f22,	%f28,	%f8
	or	%i3,	0x023D,	%o0
	fcmple32	%f18,	%f16,	%g5
	movleu	%icc,	%i4,	%g4
	srax	%o3,	%o6,	%l0
	umulcc	%o1,	%i7,	%l2
	fnot1s	%f29,	%f23
	andcc	%o2,	0x1BF1,	%g3
	fcmped	%fcc2,	%f16,	%f30
	edge16ln	%o5,	%i0,	%i6
	orn	%g1,	0x1641,	%l5
	sub	%l4,	%i2,	%l3
	sll	%i1,	0x1A,	%o7
	subccc	%l6,	%g7,	%g2
	ldx	[%l7 + 0x40],	%l1
	fcmps	%fcc2,	%f29,	%f10
	andcc	%i5,	0x142A,	%o4
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	movleu	%xcc,	%g5,	%g4
	edge32	%i4,	%o3,	%o6
	srl	%l0,	%i7,	%l2
	udivx	%o2,	0x1ACF,	%o1
	stw	%o5,	[%l7 + 0x78]
	st	%f15,	[%l7 + 0x4C]
	alignaddrl	%i0,	%i6,	%g3
	addcc	%l5,	0x1287,	%g1
	addcc	%l4,	%i2,	%i1
	popc	0x1AC6,	%l3
	andcc	%l6,	0x1334,	%g7
	mova	%xcc,	%o7,	%l1
	movrlz	%i5,	0x292,	%g2
	udivx	%o4,	0x0112,	%g6
	sir	0x1638
	edge8n	%i3,	%g5,	%g4
	edge8	%i4,	%o0,	%o6
	srax	%o3,	%i7,	%l0
	st	%f7,	[%l7 + 0x68]
	fcmple16	%f18,	%f12,	%l2
	edge8ln	%o2,	%o5,	%i0
	xorcc	%o1,	%g3,	%l5
	edge16ln	%i6,	%g1,	%i2
	st	%f17,	[%l7 + 0x64]
	fmuld8ulx16	%f9,	%f18,	%f6
	sethi	0x02D6,	%i1
	lduh	[%l7 + 0x3C],	%l3
	fmovsgu	%xcc,	%f29,	%f0
	edge16n	%l4,	%l6,	%o7
	ldd	[%l7 + 0x58],	%f0
	movvs	%icc,	%g7,	%i5
	ldd	[%l7 + 0x30],	%f6
	subcc	%l1,	0x0166,	%g2
	subccc	%o4,	0x1687,	%g6
	stb	%g5,	[%l7 + 0x17]
	edge16n	%g4,	%i3,	%i4
	sra	%o6,	0x15,	%o3
	sub	%o0,	0x1E06,	%i7
	movge	%icc,	%l2,	%o2
	edge32	%o5,	%l0,	%o1
	fzero	%f8
	movrgez	%g3,	0x16D,	%i0
	move	%xcc,	%l5,	%g1
	fmovspos	%xcc,	%f20,	%f5
	edge16ln	%i6,	%i2,	%l3
	sdivcc	%i1,	0x052D,	%l6
	edge32l	%o7,	%g7,	%i5
	addccc	%l4,	%l1,	%o4
	edge32n	%g2,	%g6,	%g4
	mulx	%g5,	0x1D43,	%i3
	movge	%icc,	%o6,	%o3
	sra	%i4,	0x0A,	%i7
	movleu	%xcc,	%l2,	%o0
	alignaddrl	%o5,	%l0,	%o1
	edge16ln	%o2,	%g3,	%i0
	ldx	[%l7 + 0x28],	%l5
	fandnot1	%f20,	%f22,	%f4
	lduw	[%l7 + 0x6C],	%i6
	smulcc	%i2,	0x0567,	%l3
	orn	%g1,	%l6,	%o7
	edge32	%g7,	%i5,	%i1
	edge16l	%l4,	%o4,	%g2
	fmovsn	%icc,	%f2,	%f9
	edge16	%g6,	%l1,	%g5
	umulcc	%g4,	0x0792,	%o6
	sll	%i3,	0x17,	%i4
	sra	%i7,	0x17,	%l2
	andcc	%o0,	0x0E08,	%o5
	lduw	[%l7 + 0x18],	%l0
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%o2
	st	%f16,	[%l7 + 0x58]
	alignaddr	%o2,	%o1,	%g3
	andn	%l5,	%i0,	%i2
	srax	%l3,	0x02,	%g1
	movle	%xcc,	%i6,	%l6
	movge	%xcc,	%o7,	%i5
	save %g7, %i1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%icc,	%f23,	%f21
	lduw	[%l7 + 0x0C],	%g2
	edge32ln	%l4,	%g6,	%g5
	st	%f31,	[%l7 + 0x7C]
	fmul8x16al	%f7,	%f15,	%f6
	stx	%g4,	[%l7 + 0x60]
	lduw	[%l7 + 0x3C],	%o6
	fnot2s	%f9,	%f29
	fmul8sux16	%f10,	%f2,	%f10
	lduh	[%l7 + 0x4E],	%l1
	fmovs	%f12,	%f16
	fmovrsgz	%i4,	%f7,	%f8
	fpadd16	%f16,	%f8,	%f14
	fpmerge	%f9,	%f16,	%f30
	edge32n	%i7,	%i3,	%l2
	move	%icc,	%o0,	%o5
	fmovdvs	%xcc,	%f20,	%f2
	movl	%icc,	%o3,	%l0
	array8	%o1,	%g3,	%l5
	orn	%i0,	0x0D21,	%i2
	srlx	%o2,	0x16,	%l3
	move	%xcc,	%i6,	%l6
	move	%xcc,	%g1,	%o7
	umulcc	%i5,	%i1,	%o4
	sdivcc	%g7,	0x070F,	%l4
	fcmpeq32	%f26,	%f0,	%g6
	movcs	%icc,	%g5,	%g4
	fands	%f26,	%f8,	%f26
	edge16ln	%o6,	%l1,	%i4
	fmovrdgz	%i7,	%f4,	%f10
	movn	%xcc,	%i3,	%g2
	sir	0x0EC9
	smulcc	%l2,	0x1F31,	%o5
	fmovrsne	%o3,	%f18,	%f25
	add	%l0,	0x049E,	%o1
	addccc	%g3,	0x1FDD,	%o0
	std	%f10,	[%l7 + 0x10]
	ldsh	[%l7 + 0x5C],	%l5
	fmovdg	%xcc,	%f16,	%f30
	array8	%i2,	%i0,	%o2
	orcc	%i6,	%l6,	%l3
	sethi	0x1BB6,	%o7
	sllx	%i5,	0x02,	%i1
	addcc	%g1,	0x17E7,	%o4
	andncc	%l4,	%g6,	%g7
	edge8ln	%g4,	%g5,	%l1
	edge8n	%i4,	%i7,	%o6
	edge16n	%i3,	%g2,	%l2
	ldsw	[%l7 + 0x54],	%o3
	alignaddr	%o5,	%l0,	%o1
	edge8l	%g3,	%o0,	%i2
	orcc	%l5,	%o2,	%i6
	movvc	%icc,	%l6,	%i0
	movg	%xcc,	%l3,	%o7
	sth	%i1,	[%l7 + 0x22]
	subcc	%i5,	%g1,	%l4
	udiv	%o4,	0x0F10,	%g7
	ldsh	[%l7 + 0x68],	%g6
	and	%g5,	%l1,	%g4
	restore %i7, %i4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i3,	%l2
	or	%o3,	%o5,	%l0
	array8	%o1,	%g2,	%o0
	sir	0x0B4E
	edge32n	%g3,	%i2,	%l5
	edge8l	%i6,	%o2,	%l6
	edge8n	%i0,	%l3,	%i1
	edge8	%i5,	%o7,	%l4
	sir	0x1893
	movvc	%xcc,	%o4,	%g7
	ldsh	[%l7 + 0x7C],	%g6
	mulscc	%g5,	%l1,	%g1
	movrlez	%g4,	0x2A0,	%i4
	ldsb	[%l7 + 0x22],	%i7
	fmovscc	%icc,	%f23,	%f8
	fpack32	%f24,	%f26,	%f8
	sllx	%i3,	%o6,	%l2
	sub	%o3,	0x184C,	%o5
	movvs	%icc,	%l0,	%g2
	save %o1, 0x0783, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i2,	%o0,	%l5
	movleu	%icc,	%i6,	%o2
	srl	%l6,	0x1D,	%i0
	st	%f6,	[%l7 + 0x54]
	srl	%l3,	0x0E,	%i1
	edge16	%o7,	%l4,	%i5
	andn	%g7,	0x1EB9,	%g6
	fnors	%f28,	%f15,	%f13
	fcmped	%fcc3,	%f24,	%f26
	udivx	%g5,	0x0B4F,	%o4
	edge32n	%g1,	%l1,	%i4
	movl	%icc,	%i7,	%g4
	srlx	%i3,	%l2,	%o3
	movleu	%xcc,	%o5,	%o6
	ldub	[%l7 + 0x43],	%l0
	edge16n	%o1,	%g3,	%i2
	movgu	%icc,	%o0,	%g2
	move	%icc,	%i6,	%o2
	subccc	%l5,	0x174A,	%l6
	ldx	[%l7 + 0x10],	%l3
	edge32n	%i0,	%o7,	%i1
	mulscc	%i5,	%g7,	%g6
	movgu	%xcc,	%g5,	%o4
	movl	%xcc,	%l4,	%g1
	movleu	%xcc,	%i4,	%l1
	addccc	%i7,	%i3,	%g4
	subccc	%l2,	%o3,	%o6
	andcc	%l0,	%o1,	%o5
	edge8ln	%g3,	%i2,	%o0
	fpack16	%f8,	%f11
	movne	%xcc,	%i6,	%o2
	fmovsa	%icc,	%f16,	%f22
	save %g2, 0x0AE5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l3,	0x17EF,	%i0
	array8	%l5,	%i1,	%i5
	ldd	[%l7 + 0x58],	%g6
	movcc	%xcc,	%g6,	%g5
	edge32ln	%o4,	%l4,	%g1
	ldsw	[%l7 + 0x20],	%i4
	fmovdleu	%xcc,	%f13,	%f31
	fmovdl	%icc,	%f25,	%f12
	edge16l	%o7,	%l1,	%i7
	fors	%f10,	%f25,	%f29
	ldd	[%l7 + 0x08],	%f30
	movre	%i3,	0x33C,	%l2
	sth	%g4,	[%l7 + 0x6C]
	fmovsa	%xcc,	%f16,	%f28
	sllx	%o3,	%o6,	%l0
	movvs	%xcc,	%o1,	%g3
	fmovdne	%icc,	%f5,	%f23
	orn	%i2,	0x15E1,	%o5
	st	%f30,	[%l7 + 0x20]
	movge	%icc,	%i6,	%o2
	edge32	%g2,	%l6,	%l3
	fmovrdgez	%o0,	%f8,	%f12
	movneg	%icc,	%l5,	%i1
	fands	%f2,	%f6,	%f10
	andn	%i0,	0x059B,	%g7
	fmovs	%f7,	%f19
	ldsh	[%l7 + 0x3A],	%g6
	movne	%xcc,	%g5,	%i5
	movleu	%xcc,	%l4,	%g1
	alignaddr	%i4,	%o4,	%o7
	edge32ln	%i7,	%i3,	%l1
	save %l2, 0x10E1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o6,	%g4,	%o1
	movg	%icc,	%l0,	%i2
	faligndata	%f24,	%f20,	%f16
	movn	%xcc,	%o5,	%g3
	sllx	%i6,	%g2,	%o2
	fxnors	%f10,	%f10,	%f31
	fmovsvs	%xcc,	%f5,	%f7
	move	%icc,	%l3,	%l6
	udivcc	%o0,	0x1A30,	%l5
	fnors	%f0,	%f19,	%f11
	mulscc	%i1,	0x1EFD,	%g7
	mulscc	%g6,	0x025B,	%g5
	array8	%i5,	%i0,	%l4
	fmovsle	%xcc,	%f20,	%f23
	andncc	%g1,	%o4,	%i4
	fmovrdlz	%o7,	%f4,	%f8
	fsrc2s	%f15,	%f8
	ldub	[%l7 + 0x55],	%i3
	fpadd32	%f20,	%f10,	%f22
	edge16n	%l1,	%i7,	%l2
	sth	%o6,	[%l7 + 0x0E]
	movne	%xcc,	%g4,	%o3
	array8	%o1,	%i2,	%l0
	pdist	%f4,	%f6,	%f16
	xnorcc	%o5,	0x0E27,	%g3
	udivx	%i6,	0x0488,	%o2
	siam	0x4
	fmovd	%f22,	%f12
	fnot1	%f14,	%f24
	array16	%l3,	%g2,	%o0
	fmovd	%f22,	%f20
	ldd	[%l7 + 0x68],	%f2
	move	%xcc,	%l5,	%i1
	srlx	%l6,	0x17,	%g7
	fnands	%f8,	%f11,	%f25
	move	%icc,	%g6,	%g5
	sra	%i5,	%i0,	%l4
	sdivcc	%o4,	0x11B6,	%i4
	fnot1	%f26,	%f14
	edge32l	%o7,	%i3,	%l1
	fmovsge	%icc,	%f12,	%f3
	movleu	%icc,	%i7,	%g1
	edge8n	%l2,	%o6,	%g4
	srl	%o1,	%o3,	%i2
	add	%o5,	0x1F11,	%l0
	fmovscs	%icc,	%f19,	%f0
	ld	[%l7 + 0x60],	%f22
	subc	%g3,	%i6,	%l3
	stx	%g2,	[%l7 + 0x18]
	addc	%o2,	%l5,	%i1
	edge8ln	%l6,	%g7,	%g6
	fandnot2	%f10,	%f22,	%f18
	stx	%o0,	[%l7 + 0x60]
	sdivcc	%g5,	0x0970,	%i0
	movre	%l4,	0x3C4,	%i5
	movl	%xcc,	%i4,	%o4
	srl	%o7,	0x1F,	%l1
	fandnot1	%f0,	%f8,	%f18
	fmovse	%icc,	%f29,	%f20
	ldd	[%l7 + 0x18],	%i2
	ldx	[%l7 + 0x20],	%g1
	ldsh	[%l7 + 0x34],	%l2
	or	%o6,	%g4,	%i7
	andn	%o3,	0x0C7E,	%i2
	edge16ln	%o5,	%o1,	%l0
	movn	%icc,	%g3,	%l3
	subcc	%i6,	%o2,	%l5
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	fcmps	%fcc2,	%f15,	%f7
	fmovdn	%xcc,	%f30,	%f12
	edge32n	%l6,	%g7,	%o0
	smul	%g6,	0x015C,	%i0
	array8	%g5,	%i5,	%i4
	alignaddrl	%o4,	%o7,	%l1
	lduw	[%l7 + 0x64],	%l4
	sir	0x0BF5
	movrlez	%i3,	0x3CD,	%g1
	edge32ln	%o6,	%l2,	%g4
	addc	%o3,	%i2,	%o5
	addccc	%i7,	0x12D9,	%l0
	fxnor	%f30,	%f30,	%f0
	addcc	%o1,	%l3,	%i6
	movpos	%icc,	%g3,	%l5
	fandnot2	%f6,	%f30,	%f4
	movn	%xcc,	%o2,	%i1
	andncc	%g2,	%g7,	%l6
	movl	%icc,	%o0,	%g6
	fcmpne32	%f12,	%f2,	%g5
	sllx	%i0,	%i5,	%i4
	or	%o7,	0x1147,	%o4
	popc	%l1,	%l4
	movg	%icc,	%g1,	%o6
	edge16n	%l2,	%g4,	%o3
	or	%i2,	%o5,	%i3
	sllx	%l0,	%i7,	%l3
	nop
	set	0x72, %l5
	ldub	[%l7 + %l5],	%o1
	sth	%g3,	[%l7 + 0x40]
	sir	0x0209
	smul	%i6,	0x1E4A,	%o2
	stb	%i1,	[%l7 + 0x2E]
	udivcc	%l5,	0x154F,	%g7
	movg	%xcc,	%l6,	%o0
	edge16l	%g2,	%g5,	%g6
	umul	%i5,	0x1C5A,	%i4
	fmovrdlz	%o7,	%f22,	%f12
	movgu	%xcc,	%i0,	%l1
	nop
	set	0x70, %o7
	ldsw	[%l7 + %o7],	%o4
	lduw	[%l7 + 0x68],	%l4
	xnor	%o6,	0x1852,	%l2
	orn	%g4,	%g1,	%i2
	addccc	%o5,	0x0C71,	%i3
	andn	%l0,	%i7,	%o3
	movne	%icc,	%o1,	%g3
	movleu	%xcc,	%l3,	%o2
	ldd	[%l7 + 0x60],	%f24
	udiv	%i6,	0x17CF,	%l5
	orncc	%i1,	0x0371,	%l6
	movcs	%icc,	%g7,	%o0
	movle	%icc,	%g5,	%g6
	fmovscc	%xcc,	%f27,	%f7
	movre	%i5,	0x0A8,	%g2
	movle	%icc,	%o7,	%i4
	movpos	%xcc,	%l1,	%o4
	srax	%l4,	%o6,	%i0
	std	%f16,	[%l7 + 0x20]
	fmuld8sux16	%f10,	%f25,	%f30
	sir	0x0592
	fmul8x16al	%f29,	%f29,	%f24
	fcmpes	%fcc1,	%f11,	%f29
	save %g4, %l2, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o5,	0x1F0A,	%g1
	ldd	[%l7 + 0x20],	%f2
	stb	%i3,	[%l7 + 0x3E]
	mova	%xcc,	%i7,	%o3
	fcmpgt32	%f30,	%f28,	%l0
	edge16l	%g3,	%o1,	%l3
	sethi	0x0159,	%i6
	edge16ln	%o2,	%i1,	%l6
	xor	%l5,	0x022D,	%o0
	smul	%g5,	0x19F4,	%g6
	stw	%g7,	[%l7 + 0x34]
	edge32ln	%g2,	%i5,	%i4
	movrlz	%l1,	%o4,	%o7
	restore %o6, 0x1B9C, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l4,	%g4
	edge16ln	%i2,	%o5,	%g1
	ldd	[%l7 + 0x08],	%f14
	fmovdvc	%icc,	%f22,	%f20
	subccc	%i3,	0x10FF,	%l2
	orn	%o3,	0x03D6,	%i7
	xor	%l0,	%g3,	%o1
	ldx	[%l7 + 0x28],	%i6
	ldx	[%l7 + 0x48],	%o2
	movn	%xcc,	%l3,	%i1
	edge32	%l5,	%o0,	%g5
	sdivx	%l6,	0x1416,	%g6
	movcs	%xcc,	%g2,	%g7
	fandnot2s	%f25,	%f25,	%f19
	subc	%i5,	%i4,	%l1
	srlx	%o7,	%o4,	%o6
	sth	%l4,	[%l7 + 0x6A]
	addccc	%g4,	0x045A,	%i0
	sra	%i2,	0x1D,	%o5
	subcc	%g1,	0x04AB,	%l2
	lduh	[%l7 + 0x0A],	%i3
	movre	%o3,	%l0,	%g3
	fmovrdne	%i7,	%f16,	%f10
	fmuld8ulx16	%f21,	%f21,	%f22
	fmovdpos	%icc,	%f14,	%f16
	save %o1, %i6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f23,	%f10,	%f20
	fmovsgu	%xcc,	%f18,	%f18
	andcc	%i1,	%l5,	%o2
	fnegd	%f6,	%f2
	sdivx	%g5,	0x07F0,	%l6
	sdivx	%g6,	0x1524,	%o0
	fpsub32	%f10,	%f22,	%f4
	sdiv	%g2,	0x18C2,	%i5
	andcc	%g7,	%i4,	%l1
	edge32	%o7,	%o4,	%o6
	sdivx	%l4,	0x1807,	%i0
	movn	%icc,	%i2,	%g4
	movpos	%xcc,	%g1,	%l2
	srl	%i3,	%o3,	%l0
	andn	%o5,	0x1A52,	%g3
	movrlez	%o1,	%i7,	%l3
	xnorcc	%i6,	%i1,	%l5
	fmovsne	%xcc,	%f7,	%f4
	orncc	%g5,	%o2,	%g6
	fmovd	%f16,	%f22
	fmovrsne	%l6,	%f6,	%f11
	andncc	%o0,	%g2,	%g7
	movgu	%xcc,	%i5,	%l1
	movcs	%xcc,	%o7,	%i4
	fmovrsne	%o4,	%f22,	%f28
	array32	%o6,	%i0,	%l4
	ldx	[%l7 + 0x38],	%g4
	fcmpeq16	%f22,	%f24,	%i2
	stx	%l2,	[%l7 + 0x20]
	fnot2s	%f8,	%f20
	fmovrsgez	%g1,	%f0,	%f26
	andcc	%o3,	0x009C,	%l0
	addc	%o5,	%i3,	%o1
	fmovrsgez	%i7,	%f10,	%f26
	sdiv	%l3,	0x0597,	%g3
	alignaddrl	%i6,	%l5,	%g5
	fands	%f16,	%f26,	%f0
	addc	%o2,	%i1,	%g6
	ldsh	[%l7 + 0x64],	%l6
	addcc	%o0,	0x0200,	%g7
	movrgz	%g2,	%l1,	%o7
	edge8l	%i4,	%o4,	%o6
	stx	%i0,	[%l7 + 0x50]
	ldsw	[%l7 + 0x50],	%l4
	fpsub16s	%f30,	%f19,	%f6
	fmovsa	%icc,	%f4,	%f13
	edge16	%i5,	%g4,	%i2
	save %g1, %l2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o5,	%l0
	fones	%f21
	fmovdn	%xcc,	%f10,	%f7
	fnegd	%f10,	%f12
	movpos	%icc,	%i3,	%o1
	umul	%l3,	%g3,	%i6
	popc	0x0C7C,	%i7
	srax	%l5,	%g5,	%o2
	fmuld8ulx16	%f4,	%f31,	%f6
	stw	%g6,	[%l7 + 0x68]
	ldsb	[%l7 + 0x4F],	%l6
	fzeros	%f23
	ldsw	[%l7 + 0x30],	%o0
	andn	%g7,	%g2,	%l1
	nop
	set	0x4A, %g3
	ldsb	[%l7 + %g3],	%o7
	udivcc	%i4,	0x0C09,	%o4
	movvc	%icc,	%o6,	%i1
	mova	%icc,	%l4,	%i5
	save %i0, %i2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g1,	0x14,	%l2
	sethi	0x089F,	%o3
	lduw	[%l7 + 0x60],	%l0
	movg	%xcc,	%o5,	%i3
	movn	%icc,	%l3,	%g3
	ldsh	[%l7 + 0x4E],	%i6
	xor	%i7,	0x0A62,	%l5
	fmovd	%f18,	%f2
	edge32l	%g5,	%o2,	%o1
	sra	%l6,	%o0,	%g7
	smulcc	%g6,	0x1813,	%l1
	fpadd32	%f26,	%f24,	%f12
	or	%o7,	%g2,	%i4
	std	%f12,	[%l7 + 0x48]
	movge	%icc,	%o4,	%i1
	ldx	[%l7 + 0x38],	%l4
	fcmpeq32	%f2,	%f10,	%o6
	fpadd16s	%f0,	%f30,	%f26
	movpos	%icc,	%i0,	%i5
	fmovdne	%xcc,	%f9,	%f8
	sll	%g4,	0x17,	%g1
	subc	%l2,	0x121B,	%i2
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	movneg	%icc,	%l3,	%g3
	andcc	%i6,	0x0DF5,	%o5
	fmul8ulx16	%f4,	%f28,	%f10
	edge16	%l5,	%i7,	%g5
	movrne	%o2,	0x0FD,	%l6
	ldub	[%l7 + 0x18],	%o1
	subccc	%o0,	0x1712,	%g6
	sethi	0x1E8B,	%g7
	mulscc	%o7,	%l1,	%g2
	nop
	set	0x30, %g4
	ldsh	[%l7 + %g4],	%o4
	fmovrdlez	%i4,	%f24,	%f18
	fcmpeq16	%f22,	%f24,	%l4
	std	%f4,	[%l7 + 0x68]
	fmuld8sux16	%f4,	%f29,	%f30
	subccc	%o6,	0x0CF3,	%i1
	sra	%i0,	%i5,	%g4
	array8	%g1,	%i2,	%l2
	udivx	%l0,	0x1227,	%o3
	movre	%i3,	%g3,	%i6
	movrlz	%l3,	0x044,	%l5
	fmovdg	%icc,	%f31,	%f2
	alignaddrl	%i7,	%g5,	%o5
	mulscc	%l6,	0x01EF,	%o1
	fand	%f6,	%f26,	%f30
	movre	%o0,	0x2F5,	%g6
	movvc	%icc,	%g7,	%o2
	sub	%o7,	%g2,	%o4
	sth	%l1,	[%l7 + 0x26]
	sll	%i4,	%l4,	%i1
	array16	%o6,	%i0,	%i5
	fmovrde	%g1,	%f8,	%f18
	add	%g4,	%l2,	%i2
	fmovsge	%xcc,	%f1,	%f4
	andcc	%l0,	0x057A,	%i3
	andncc	%o3,	%g3,	%l3
	movrgz	%i6,	0x0D3,	%i7
	add	%g5,	0x0013,	%l5
	movle	%xcc,	%l6,	%o1
	add	%o0,	0x1E6A,	%o5
	sdiv	%g7,	0x0191,	%o2
	andn	%o7,	0x159B,	%g6
	st	%f24,	[%l7 + 0x64]
	udivx	%o4,	0x18E6,	%g2
	sub	%l1,	%l4,	%i1
	fnands	%f4,	%f17,	%f5
	sth	%o6,	[%l7 + 0x44]
	stw	%i4,	[%l7 + 0x64]
	movleu	%xcc,	%i5,	%g1
	sra	%i0,	0x12,	%g4
	fexpand	%f18,	%f2
	subcc	%l2,	%l0,	%i3
	array16	%o3,	%g3,	%i2
	fabsd	%f24,	%f0
	addcc	%l3,	0x0293,	%i6
	sdivx	%i7,	0x0E89,	%g5
	fmovrdlez	%l5,	%f28,	%f26
	fmovda	%icc,	%f16,	%f31
	movge	%xcc,	%o1,	%o0
	edge32ln	%l6,	%g7,	%o5
	edge8ln	%o7,	%g6,	%o2
	srlx	%g2,	%o4,	%l1
	udivx	%i1,	0x0606,	%o6
	restore %l4, %i5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i0,	0x19AF,	%i4
	edge16l	%l2,	%l0,	%g4
	andncc	%o3,	%g3,	%i3
	movpos	%xcc,	%i2,	%l3
	stx	%i6,	[%l7 + 0x30]
	ld	[%l7 + 0x40],	%f14
	fmovrsgez	%g5,	%f14,	%f17
	movgu	%icc,	%l5,	%i7
	subc	%o1,	0x1F02,	%l6
	and	%g7,	%o5,	%o0
	edge8l	%g6,	%o2,	%o7
	lduh	[%l7 + 0x74],	%g2
	fnot1	%f12,	%f28
	edge8l	%o4,	%l1,	%o6
	addc	%l4,	0x038B,	%i1
	fxor	%f0,	%f0,	%f0
	fmovdgu	%xcc,	%f0,	%f17
	siam	0x2
	fmovsn	%xcc,	%f27,	%f31
	fcmpne32	%f20,	%f24,	%i5
	stx	%i0,	[%l7 + 0x30]
	ldsw	[%l7 + 0x24],	%g1
	movg	%icc,	%l2,	%i4
	udivx	%g4,	0x067B,	%l0
	srlx	%g3,	%i3,	%o3
	sllx	%i2,	0x1E,	%i6
	movneg	%icc,	%l3,	%g5
	stx	%l5,	[%l7 + 0x18]
	andcc	%i7,	%l6,	%o1
	sdiv	%g7,	0x1EF5,	%o0
	ldx	[%l7 + 0x60],	%o5
	alignaddr	%g6,	%o7,	%o2
	ldsb	[%l7 + 0x12],	%g2
	fmovdg	%xcc,	%f4,	%f7
	ldd	[%l7 + 0x38],	%f24
	sllx	%l1,	0x13,	%o4
	fandnot1s	%f4,	%f14,	%f31
	fmovrslz	%o6,	%f3,	%f16
	movvs	%xcc,	%i1,	%i5
	alignaddrl	%l4,	%g1,	%l2
	fandnot2	%f24,	%f18,	%f8
	ldsh	[%l7 + 0x6A],	%i4
	sub	%g4,	%l0,	%g3
	fmovdpos	%xcc,	%f24,	%f30
	andn	%i0,	%o3,	%i3
	smul	%i2,	%l3,	%g5
	fmovda	%xcc,	%f21,	%f27
	fcmpeq16	%f0,	%f2,	%l5
	popc	0x182A,	%i7
	udivx	%i6,	0x0672,	%o1
	stx	%g7,	[%l7 + 0x38]
	sethi	0x1BA1,	%l6
	mova	%xcc,	%o5,	%o0
	subccc	%o7,	%g6,	%g2
	umulcc	%l1,	0x0341,	%o2
	fmovdneg	%icc,	%f30,	%f3
	edge8ln	%o4,	%o6,	%i1
	movpos	%icc,	%i5,	%g1
	ldd	[%l7 + 0x38],	%f24
	movne	%icc,	%l2,	%l4
	addcc	%g4,	0x001A,	%i4
	nop
	set	0x79, %i5
	ldsb	[%l7 + %i5],	%g3
	movl	%icc,	%l0,	%i0
	array8	%i3,	%i2,	%l3
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	fmovsle	%xcc,	%f4,	%f1
	subc	%i6,	%o1,	%g7
	nop
	set	0x24, %i3
	stw	%l6,	[%l7 + %i3]
	ldsh	[%l7 + 0x1C],	%o5
	alignaddrl	%o0,	%o7,	%g6
	sll	%g2,	%l1,	%i7
	ldd	[%l7 + 0x10],	%f24
	movrne	%o4,	0x005,	%o2
	edge8ln	%i1,	%o6,	%g1
	alignaddr	%i5,	%l2,	%g4
	edge16l	%l4,	%i4,	%l0
	alignaddr	%i0,	%g3,	%i3
	stx	%l3,	[%l7 + 0x78]
	xor	%o3,	0x0C1C,	%i2
	edge16	%l5,	%i6,	%g5
	movleu	%xcc,	%g7,	%o1
	sdivcc	%o5,	0x1A94,	%o0
	addcc	%l6,	0x07E6,	%o7
	movre	%g2,	%g6,	%l1
	movne	%icc,	%o4,	%o2
	movpos	%icc,	%i1,	%o6
	fmovsa	%xcc,	%f25,	%f10
	subccc	%i7,	0x017D,	%i5
	movrlez	%l2,	%g1,	%g4
	ldx	[%l7 + 0x18],	%l4
	movge	%xcc,	%l0,	%i4
	fmovdne	%icc,	%f4,	%f7
	movrlz	%g3,	0x27A,	%i3
	fsrc2s	%f25,	%f25
	xnorcc	%l3,	0x0603,	%i0
	srl	%o3,	%l5,	%i2
	mova	%icc,	%g5,	%i6
	fmovsl	%xcc,	%f7,	%f5
	movneg	%xcc,	%o1,	%g7
	edge8ln	%o5,	%l6,	%o0
	umulcc	%g2,	0x0D91,	%o7
	st	%f22,	[%l7 + 0x5C]
	stb	%g6,	[%l7 + 0x57]
	srax	%l1,	%o4,	%i1
	movrgez	%o6,	%i7,	%o2
	fpsub16	%f4,	%f24,	%f30
	sdivcc	%l2,	0x1FEB,	%i5
	movrlz	%g4,	0x117,	%g1
	add	%l0,	%i4,	%g3
	fmovsle	%icc,	%f8,	%f27
	udivx	%l4,	0x05C6,	%l3
	movrgez	%i3,	%i0,	%o3
	fnors	%f29,	%f6,	%f22
	movcs	%icc,	%l5,	%g5
	fors	%f14,	%f29,	%f26
	save %i2, 0x02A6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i6,	[%l7 + 0x7C]
	alignaddrl	%g7,	%l6,	%o0
	movneg	%icc,	%o5,	%g2
	movrgez	%g6,	%o7,	%l1
	move	%xcc,	%o4,	%i1
	fabsd	%f6,	%f20
	umulcc	%o6,	%i7,	%l2
	edge32l	%o2,	%i5,	%g4
	fabss	%f6,	%f9
	stx	%l0,	[%l7 + 0x70]
	array8	%i4,	%g1,	%g3
	fpackfix	%f14,	%f0
	srlx	%l4,	0x0B,	%i3
	stx	%i0,	[%l7 + 0x60]
	fmuld8ulx16	%f30,	%f28,	%f22
	fmovdne	%icc,	%f23,	%f12
	movne	%xcc,	%o3,	%l5
	udiv	%l3,	0x0797,	%g5
	umulcc	%i2,	0x0CDC,	%i6
	movcs	%xcc,	%g7,	%l6
	mulscc	%o0,	0x00EA,	%o1
	pdist	%f24,	%f18,	%f24
	mulx	%g2,	%o5,	%g6
	fmovrdlez	%l1,	%f12,	%f8
	fmovdne	%icc,	%f2,	%f30
	movrlez	%o4,	%o7,	%o6
	movneg	%xcc,	%i7,	%i1
	ld	[%l7 + 0x08],	%f21
	std	%f14,	[%l7 + 0x08]
	alignaddr	%o2,	%i5,	%l2
	sdiv	%l0,	0x0770,	%g4
	umulcc	%i4,	0x1C68,	%g3
	fmul8sux16	%f20,	%f26,	%f14
	stx	%g1,	[%l7 + 0x48]
	edge8n	%l4,	%i0,	%o3
	ldd	[%l7 + 0x08],	%l4
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%i3
	fmovsneg	%xcc,	%f28,	%f29
	fmovde	%xcc,	%f21,	%f15
	fcmpne32	%f12,	%f28,	%g5
	movrgez	%i2,	%i6,	%l3
	popc	0x12BA,	%l6
	fpadd32s	%f25,	%f2,	%f22
	andcc	%g7,	%o1,	%g2
	orcc	%o5,	%o0,	%l1
	fnot1	%f18,	%f22
	popc	%g6,	%o7
	mulscc	%o4,	%i7,	%i1
	st	%f27,	[%l7 + 0x10]
	orn	%o2,	0x1D6C,	%i5
	nop
	set	0x60, %g6
	ldx	[%l7 + %g6],	%o6
	ldd	[%l7 + 0x50],	%f8
	edge32ln	%l0,	%g4,	%i4
	nop
	set	0x40, %i2
	ldx	[%l7 + %i2],	%g3
	movne	%icc,	%g1,	%l4
	edge16n	%l2,	%i0,	%l5
	movrne	%o3,	0x256,	%i3
	ldub	[%l7 + 0x3C],	%g5
	edge8n	%i2,	%i6,	%l3
	std	%f12,	[%l7 + 0x50]
	movg	%xcc,	%l6,	%o1
	edge32ln	%g7,	%g2,	%o5
	edge32n	%o0,	%g6,	%l1
	stb	%o7,	[%l7 + 0x7E]
	std	%f4,	[%l7 + 0x18]
	movne	%icc,	%o4,	%i7
	movl	%icc,	%i1,	%i5
	fmovdcs	%icc,	%f6,	%f24
	subc	%o2,	%l0,	%o6
	xnor	%i4,	0x0409,	%g3
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%g4
	fmovsne	%xcc,	%f0,	%f14
	stw	%l4,	[%l7 + 0x74]
	std	%f14,	[%l7 + 0x28]
	sth	%l2,	[%l7 + 0x52]
	mova	%icc,	%i0,	%g1
	add	%l5,	0x1E13,	%o3
	array16	%i3,	%i2,	%g5
	movn	%icc,	%i6,	%l3
	fcmps	%fcc3,	%f0,	%f6
	fnand	%f4,	%f24,	%f4
	fmovrdlz	%l6,	%f12,	%f12
	sdivx	%o1,	0x0C8F,	%g7
	movvs	%xcc,	%g2,	%o5
	movle	%xcc,	%o0,	%l1
	subccc	%g6,	0x18C5,	%o4
	sethi	0x0F97,	%o7
	sir	0x1DDF
	movge	%icc,	%i1,	%i5
	edge8	%o2,	%i7,	%o6
	fsrc2	%f26,	%f20
	movrgez	%i4,	0x0AB,	%g3
	edge16l	%g4,	%l4,	%l2
	addcc	%l0,	%i0,	%g1
	fmovde	%icc,	%f28,	%f25
	movvc	%icc,	%l5,	%i3
	sub	%o3,	%g5,	%i2
	edge32ln	%i6,	%l3,	%o1
	fmovdleu	%icc,	%f18,	%f9
	addc	%g7,	%g2,	%o5
	ldsb	[%l7 + 0x1B],	%o0
	array16	%l1,	%l6,	%o4
	srl	%o7,	0x03,	%g6
	fmul8x16al	%f27,	%f2,	%f6
	orn	%i1,	0x01BD,	%i5
	save %o2, 0x03F7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%i4,	%o6
	st	%f0,	[%l7 + 0x44]
	sethi	0x1D26,	%g3
	edge16ln	%g4,	%l2,	%l4
	addcc	%i0,	0x08EB,	%l0
	edge32ln	%l5,	%i3,	%o3
	ld	[%l7 + 0x2C],	%f0
	fmovrse	%g1,	%f1,	%f25
	fands	%f2,	%f0,	%f19
	fones	%f17
	edge16ln	%g5,	%i2,	%l3
	movvs	%xcc,	%o1,	%g7
	subcc	%g2,	0x00C5,	%o5
	bshuffle	%f30,	%f22,	%f22
	umulcc	%o0,	%l1,	%i6
	edge16ln	%o4,	%o7,	%l6
	ld	[%l7 + 0x44],	%f16
	subcc	%g6,	0x1E30,	%i1
	fand	%f16,	%f28,	%f24
	ld	[%l7 + 0x78],	%f3
	edge8ln	%i5,	%i7,	%o2
	save %o6, %g3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%g4,	%l4
	edge8n	%i0,	%l0,	%l5
	fcmpd	%fcc3,	%f6,	%f2
	fmovrdgez	%l2,	%f26,	%f22
	fmovdcs	%icc,	%f15,	%f27
	smulcc	%i3,	%o3,	%g5
	fpadd32	%f14,	%f4,	%f6
	movrne	%g1,	0x0A5,	%i2
	edge32n	%l3,	%o1,	%g7
	movge	%xcc,	%o5,	%o0
	st	%f17,	[%l7 + 0x20]
	fsrc1s	%f19,	%f4
	move	%xcc,	%g2,	%l1
	addc	%o4,	%o7,	%i6
	movg	%xcc,	%l6,	%g6
	udiv	%i5,	0x0941,	%i7
	edge16l	%i1,	%o6,	%o2
	movrne	%i4,	0x2FF,	%g4
	fmovrdgz	%l4,	%f18,	%f2
	xnor	%g3,	%i0,	%l0
	andncc	%l2,	%l5,	%o3
	edge8ln	%i3,	%g5,	%i2
	array8	%l3,	%o1,	%g7
	fzeros	%f1
	movleu	%xcc,	%g1,	%o5
	andcc	%g2,	%o0,	%l1
	umulcc	%o4,	%i6,	%o7
	edge8l	%g6,	%l6,	%i5
	edge8n	%i1,	%o6,	%o2
	fmovdleu	%icc,	%f29,	%f7
	sllx	%i7,	0x1E,	%i4
	edge16ln	%l4,	%g4,	%i0
	fmovrdne	%l0,	%f6,	%f0
	array8	%l2,	%g3,	%l5
	ldub	[%l7 + 0x68],	%o3
	ldsw	[%l7 + 0x58],	%i3
	udivcc	%g5,	0x01EC,	%l3
	movneg	%xcc,	%i2,	%g7
	restore %g1, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%o0
	lduw	[%l7 + 0x50],	%g2
	array16	%l1,	%o4,	%i6
	fnot2	%f12,	%f14
	movrlez	%o7,	%l6,	%g6
	fpmerge	%f9,	%f20,	%f24
	fmovrdlz	%i1,	%f16,	%f6
	movl	%icc,	%o6,	%o2
	edge32ln	%i7,	%i4,	%i5
	xnorcc	%g4,	%i0,	%l0
	ldx	[%l7 + 0x70],	%l4
	array32	%l2,	%l5,	%g3
	sll	%o3,	%g5,	%l3
	fnands	%f12,	%f30,	%f29
	sdivx	%i3,	0x0DCE,	%i2
	fcmpne32	%f12,	%f30,	%g7
	edge8ln	%o1,	%g1,	%o0
	subcc	%g2,	%o5,	%o4
	fcmpd	%fcc3,	%f4,	%f14
	smulcc	%i6,	0x0B27,	%o7
	fmovrdlez	%l1,	%f0,	%f16
	save %l6, 0x0A88, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i1,	0x3A8,	%o2
	sdivcc	%i7,	0x0C14,	%i4
	fmul8ulx16	%f4,	%f28,	%f16
	alignaddr	%o6,	%g4,	%i0
	mulx	%i5,	0x1789,	%l0
	std	%f12,	[%l7 + 0x30]
	orcc	%l4,	0x14BA,	%l5
	orcc	%g3,	%o3,	%g5
	ldub	[%l7 + 0x52],	%l2
	movrlez	%l3,	0x2D3,	%i2
	fsrc2s	%f5,	%f14
	sllx	%g7,	0x01,	%i3
	nop
	set	0x08, %l2
	ldd	[%l7 + %l2],	%f12
	lduw	[%l7 + 0x58],	%o1
	movne	%xcc,	%g1,	%g2
	movrlez	%o0,	%o4,	%i6
	edge8ln	%o7,	%o5,	%l6
	sdivcc	%g6,	0x16E6,	%i1
	movrgez	%l1,	0x35B,	%o2
	popc	%i4,	%o6
	orcc	%i7,	0x0259,	%g4
	edge8n	%i0,	%i5,	%l4
	fmovdne	%xcc,	%f22,	%f25
	add	%l0,	0x1105,	%l5
	edge8ln	%o3,	%g5,	%l2
	fmovdg	%icc,	%f16,	%f15
	movrlez	%l3,	%i2,	%g3
	fmovrse	%i3,	%f3,	%f23
	smulcc	%g7,	0x0E41,	%o1
	fnot2s	%f28,	%f12
	ldsh	[%l7 + 0x50],	%g1
	edge32n	%o0,	%o4,	%i6
	movcc	%xcc,	%o7,	%o5
	movn	%icc,	%l6,	%g2
	edge8l	%i1,	%g6,	%l1
	stw	%o2,	[%l7 + 0x74]
	lduh	[%l7 + 0x74],	%o6
	ld	[%l7 + 0x6C],	%f7
	nop
	set	0x20, %o2
	ldsh	[%l7 + %o2],	%i4
	ldsh	[%l7 + 0x38],	%g4
	xnorcc	%i0,	%i5,	%i7
	edge32n	%l4,	%l0,	%o3
	movge	%xcc,	%g5,	%l2
	mulscc	%l5,	%i2,	%l3
	fzeros	%f8
	sethi	0x066A,	%i3
	move	%icc,	%g7,	%o1
	edge32	%g3,	%o0,	%g1
	ldub	[%l7 + 0x3E],	%o4
	nop
	set	0x30, %g1
	stx	%o7,	[%l7 + %g1]
	movpos	%xcc,	%o5,	%i6
	stx	%l6,	[%l7 + 0x08]
	popc	0x1E8D,	%i1
	or	%g6,	0x0A62,	%g2
	fpadd16s	%f22,	%f26,	%f14
	movle	%icc,	%l1,	%o2
	edge16n	%o6,	%i4,	%i0
	sra	%g4,	0x1B,	%i7
	edge8	%i5,	%l4,	%o3
	fmovspos	%xcc,	%f25,	%f29
	xnor	%g5,	%l2,	%l0
	sdiv	%i2,	0x1C5B,	%l3
	siam	0x7
	sethi	0x08DB,	%i3
	movrgez	%l5,	0x2A8,	%o1
	add	%g3,	0x1A6D,	%g7
	fmovrdlez	%o0,	%f18,	%f8
	xnor	%o4,	%g1,	%o7
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%o5
	xnorcc	%i6,	%i1,	%l6
	srl	%g6,	%l1,	%g2
	popc	%o6,	%o2
	edge8	%i4,	%i0,	%g4
	srax	%i5,	%i7,	%o3
	movrgz	%g5,	%l4,	%l2
	addccc	%l0,	0x058B,	%i2
	alignaddrl	%l3,	%i3,	%l5
	udivx	%o1,	0x17DA,	%g7
	edge16	%g3,	%o0,	%o4
	sllx	%o7,	0x1F,	%g1
	movne	%icc,	%o5,	%i6
	sub	%l6,	%i1,	%l1
	pdist	%f26,	%f30,	%f12
	movle	%icc,	%g6,	%g2
	sll	%o2,	%i4,	%i0
	lduh	[%l7 + 0x76],	%o6
	umul	%g4,	0x00C8,	%i5
	movvs	%icc,	%i7,	%g5
	stb	%o3,	[%l7 + 0x67]
	ldx	[%l7 + 0x10],	%l4
	movrgez	%l0,	0x1B2,	%i2
	edge32n	%l2,	%i3,	%l5
	movneg	%xcc,	%l3,	%g7
	sub	%o1,	0x1B79,	%g3
	srax	%o4,	0x0A,	%o0
	edge8ln	%g1,	%o5,	%o7
	sra	%i6,	%l6,	%i1
	subc	%l1,	0x1E22,	%g6
	sll	%o2,	0x1A,	%i4
	movle	%icc,	%g2,	%o6
	ldd	[%l7 + 0x78],	%f4
	popc	0x1D0D,	%g4
	alignaddrl	%i0,	%i5,	%g5
	subcc	%i7,	0x14A4,	%o3
	edge32n	%l4,	%i2,	%l0
	movgu	%icc,	%i3,	%l5
	lduh	[%l7 + 0x68],	%l3
	sra	%l2,	0x11,	%o1
	sllx	%g3,	0x1C,	%g7
	popc	0x1BA2,	%o4
	fmovda	%xcc,	%f22,	%f20
	mova	%icc,	%g1,	%o5
	orncc	%o0,	%o7,	%i6
	fmovrsgez	%l6,	%f18,	%f0
	add	%l1,	0x0C9B,	%i1
	ldsh	[%l7 + 0x46],	%g6
	udiv	%o2,	0x1ECB,	%g2
	fpsub16	%f26,	%f18,	%f6
	movneg	%icc,	%o6,	%g4
	ldsh	[%l7 + 0x5E],	%i4
	ldub	[%l7 + 0x1B],	%i0
	xnor	%i5,	%g5,	%i7
	nop
	set	0x48, %i0
	sth	%l4,	[%l7 + %i0]
	ldub	[%l7 + 0x4A],	%i2
	ld	[%l7 + 0x50],	%f19
	lduh	[%l7 + 0x7C],	%l0
	stw	%o3,	[%l7 + 0x78]
	movrlez	%i3,	0x023,	%l5
	array8	%l3,	%o1,	%g3
	popc	%l2,	%g7
	fmovdge	%icc,	%f11,	%f13
	mulscc	%g1,	%o5,	%o0
	srl	%o7,	0x16,	%o4
	fnegd	%f6,	%f30
	movgu	%xcc,	%l6,	%l1
	movrlez	%i1,	0x327,	%i6
	fnot1s	%f22,	%f10
	mulx	%o2,	0x1F5A,	%g6
	ldd	[%l7 + 0x40],	%o6
	fcmpne32	%f6,	%f14,	%g4
	lduh	[%l7 + 0x16],	%i4
	fcmpgt16	%f30,	%f24,	%g2
	fmul8ulx16	%f28,	%f28,	%f0
	fandnot2s	%f29,	%f29,	%f5
	array16	%i5,	%i0,	%g5
	sub	%i7,	0x1B3A,	%l4
	sth	%l0,	[%l7 + 0x12]
	fmovrdne	%o3,	%f4,	%f6
	movle	%icc,	%i2,	%i3
	movg	%icc,	%l3,	%l5
	fabss	%f5,	%f5
	alignaddr	%o1,	%l2,	%g3
	fnand	%f10,	%f18,	%f16
	fnot1s	%f22,	%f20
	fmovs	%f18,	%f27
	edge8l	%g1,	%o5,	%g7
	edge32l	%o0,	%o7,	%l6
	fmovse	%icc,	%f18,	%f8
	fcmps	%fcc3,	%f4,	%f20
	edge16n	%l1,	%i1,	%i6
	bshuffle	%f20,	%f18,	%f0
	movg	%xcc,	%o4,	%g6
	movneg	%xcc,	%o6,	%g4
	movg	%xcc,	%o2,	%i4
	andn	%i5,	%g2,	%g5
	andcc	%i7,	%i0,	%l0
	edge8ln	%l4,	%i2,	%i3
	ldd	[%l7 + 0x40],	%f28
	and	%l3,	0x05A6,	%l5
	edge16	%o3,	%o1,	%g3
	array32	%l2,	%o5,	%g1
	popc	%o0,	%g7
	edge16	%o7,	%l6,	%i1
	sth	%l1,	[%l7 + 0x46]
	movcc	%icc,	%i6,	%g6
	add	%o4,	%g4,	%o6
	addcc	%i4,	%o2,	%g2
	mulscc	%g5,	0x0090,	%i7
	mulx	%i5,	%l0,	%i0
	edge32	%l4,	%i3,	%i2
	and	%l3,	0x0757,	%o3
	fcmpeq16	%f24,	%f10,	%o1
	movn	%xcc,	%g3,	%l5
	addcc	%l2,	%g1,	%o0
	ldub	[%l7 + 0x27],	%g7
	addccc	%o5,	0x1B72,	%l6
	move	%xcc,	%i1,	%o7
	edge16ln	%i6,	%l1,	%o4
	sdiv	%g6,	0x0AF5,	%o6
	fmovsneg	%icc,	%f1,	%f2
	array16	%g4,	%i4,	%g2
	movn	%xcc,	%o2,	%g5
	std	%f22,	[%l7 + 0x10]
	array16	%i7,	%l0,	%i5
	subc	%l4,	0x0A8B,	%i3
	ldx	[%l7 + 0x48],	%i2
	mulscc	%l3,	%i0,	%o1
	andn	%g3,	%o3,	%l5
	movrgz	%g1,	0x3A1,	%o0
	addc	%g7,	%l2,	%l6
	fmul8x16au	%f14,	%f6,	%f18
	umulcc	%o5,	0x1A05,	%o7
	smulcc	%i1,	%l1,	%i6
	movcs	%icc,	%g6,	%o6
	movcc	%xcc,	%g4,	%i4
	movvc	%icc,	%g2,	%o4
	srlx	%o2,	%i7,	%g5
	sdivx	%i5,	0x0126,	%l0
	edge32ln	%l4,	%i3,	%l3
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	movle	%xcc,	%o3,	%l5
	fmovrsgz	%o1,	%f2,	%f0
	addc	%g1,	0x0E6C,	%g7
	edge32ln	%o0,	%l6,	%l2
	movg	%icc,	%o7,	%i1
	fmovsn	%xcc,	%f8,	%f22
	sth	%o5,	[%l7 + 0x4A]
	movvs	%icc,	%l1,	%g6
	ldx	[%l7 + 0x20],	%i6
	fandnot1s	%f23,	%f26,	%f16
	addcc	%o6,	%i4,	%g4
	edge32n	%o4,	%g2,	%o2
	stb	%i7,	[%l7 + 0x1A]
	array16	%g5,	%i5,	%l4
	st	%f2,	[%l7 + 0x30]
	fpadd16s	%f15,	%f12,	%f24
	edge16ln	%l0,	%i3,	%i2
	stx	%l3,	[%l7 + 0x20]
	ldd	[%l7 + 0x08],	%g2
	movleu	%icc,	%o3,	%l5
	restore %i0, %o1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g1,	0x1714,	%o0
	movcc	%xcc,	%l2,	%l6
	ld	[%l7 + 0x18],	%f10
	stx	%i1,	[%l7 + 0x70]
	movrgez	%o7,	0x3D1,	%l1
	sra	%o5,	%g6,	%o6
	fnand	%f18,	%f8,	%f14
	fcmpgt32	%f0,	%f2,	%i4
	std	%f22,	[%l7 + 0x30]
	fcmple32	%f4,	%f10,	%g4
	ldd	[%l7 + 0x10],	%i6
	fmovscs	%xcc,	%f22,	%f11
	movg	%icc,	%g2,	%o4
	sdivcc	%i7,	0x1064,	%o2
	fone	%f16
	sdivx	%g5,	0x1804,	%l4
	sth	%i5,	[%l7 + 0x28]
	fmul8x16	%f1,	%f18,	%f14
	fmovrdlz	%l0,	%f6,	%f20
	fpsub16	%f12,	%f20,	%f28
	movvc	%icc,	%i2,	%l3
	andncc	%g3,	%i3,	%o3
	mulscc	%l5,	0x0C3B,	%o1
	mulscc	%g7,	%i0,	%o0
	stw	%g1,	[%l7 + 0x08]
	edge32ln	%l6,	%l2,	%i1
	popc	0x148D,	%l1
	subccc	%o5,	0x0B54,	%g6
	movn	%xcc,	%o7,	%i4
	stb	%o6,	[%l7 + 0x3C]
	fmovda	%xcc,	%f11,	%f27
	movl	%xcc,	%i6,	%g4
	addccc	%g2,	0x1553,	%o4
	fmovdleu	%xcc,	%f20,	%f15
	umul	%i7,	%g5,	%o2
	xnorcc	%l4,	%l0,	%i5
	ldsw	[%l7 + 0x24],	%l3
	ldsh	[%l7 + 0x64],	%g3
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	udivx	%l5,	0x118D,	%o1
	edge8n	%g7,	%o0,	%g1
	fpackfix	%f4,	%f8
	fmovrdgez	%l6,	%f12,	%f12
	fandnot2	%f24,	%f2,	%f30
	fpackfix	%f14,	%f7
	fmovsg	%xcc,	%f18,	%f19
	xnor	%l2,	0x009D,	%i0
	movrgz	%l1,	%o5,	%g6
	sll	%i1,	0x08,	%o7
	movrne	%i4,	%i6,	%o6
	fpsub16s	%f27,	%f4,	%f19
	smul	%g2,	%o4,	%i7
	ldsw	[%l7 + 0x70],	%g5
	fmovda	%xcc,	%f20,	%f9
	fmovrdgez	%o2,	%f10,	%f14
	movvc	%icc,	%g4,	%l0
	std	%f20,	[%l7 + 0x28]
	addcc	%i5,	%l4,	%g3
	fnors	%f8,	%f19,	%f30
	lduh	[%l7 + 0x60],	%l3
	movrgez	%o3,	0x006,	%i2
	fpadd32	%f8,	%f14,	%f2
	fnands	%f19,	%f7,	%f24
	edge32n	%l5,	%o1,	%g7
	srax	%o0,	%i3,	%g1
	movpos	%xcc,	%l2,	%l6
	fmovrdlez	%l1,	%f30,	%f14
	sra	%i0,	%o5,	%i1
	addccc	%o7,	%i4,	%i6
	orncc	%g6,	%o6,	%g2
	ldsw	[%l7 + 0x40],	%i7
	srax	%o4,	0x08,	%g5
	edge16n	%o2,	%l0,	%i5
	movneg	%icc,	%g4,	%g3
	sdivx	%l4,	0x016A,	%l3
	fmovdne	%icc,	%f15,	%f16
	stb	%o3,	[%l7 + 0x2B]
	faligndata	%f2,	%f10,	%f8
	movneg	%icc,	%l5,	%i2
	srlx	%o1,	0x06,	%o0
	fmovsleu	%xcc,	%f26,	%f11
	sub	%g7,	0x168B,	%g1
	edge8ln	%l2,	%l6,	%l1
	fpmerge	%f0,	%f28,	%f10
	fpackfix	%f18,	%f16
	movrne	%i0,	0x17F,	%o5
	movl	%icc,	%i1,	%o7
	movrgz	%i3,	%i4,	%g6
	move	%xcc,	%o6,	%g2
	ldsb	[%l7 + 0x12],	%i6
	array32	%o4,	%g5,	%o2
	andcc	%i7,	%l0,	%i5
	fmul8x16	%f21,	%f8,	%f22
	fmovsg	%icc,	%f12,	%f11
	addcc	%g3,	0x0742,	%g4
	movrne	%l4,	%o3,	%l3
	movne	%icc,	%l5,	%o1
	fmovdleu	%xcc,	%f21,	%f4
	srl	%i2,	0x07,	%g7
	srlx	%g1,	%l2,	%o0
	edge16	%l6,	%i0,	%l1
	ldd	[%l7 + 0x30],	%f22
	lduw	[%l7 + 0x30],	%i1
	movle	%xcc,	%o7,	%i3
	edge16l	%i4,	%g6,	%o6
	udivx	%g2,	0x060A,	%i6
	ldd	[%l7 + 0x78],	%o4
	sethi	0x1910,	%g5
	fmuld8sux16	%f31,	%f10,	%f2
	alignaddrl	%o5,	%o2,	%l0
	umul	%i5,	%i7,	%g4
	subcc	%g3,	0x14B5,	%l4
	movg	%xcc,	%o3,	%l5
	sdivcc	%l3,	0x0671,	%i2
	fmul8x16	%f25,	%f24,	%f30
	srax	%o1,	%g1,	%g7
	subccc	%o0,	%l2,	%i0
	fexpand	%f24,	%f4
	movre	%l1,	%i1,	%l6
	sth	%o7,	[%l7 + 0x18]
	srax	%i3,	0x1B,	%g6
	fpsub32s	%f11,	%f25,	%f16
	edge16	%o6,	%i4,	%g2
	lduw	[%l7 + 0x28],	%o4
	udivcc	%i6,	0x1BBF,	%o5
	fmovdleu	%xcc,	%f16,	%f6
	st	%f9,	[%l7 + 0x64]
	fpsub16s	%f14,	%f31,	%f10
	edge16	%g5,	%o2,	%l0
	edge32	%i7,	%g4,	%g3
	edge32l	%l4,	%i5,	%l5
	edge8	%o3,	%i2,	%l3
	udivcc	%g1,	0x0C71,	%o1
	stb	%o0,	[%l7 + 0x74]
	sth	%g7,	[%l7 + 0x5E]
	fmovsleu	%xcc,	%f28,	%f4
	fpsub16	%f2,	%f20,	%f30
	stb	%l2,	[%l7 + 0x3E]
	ldd	[%l7 + 0x48],	%l0
	fcmpeq32	%f6,	%f28,	%i1
	fpadd16s	%f28,	%f14,	%f13
	movvc	%xcc,	%i0,	%l6
	fmovsn	%xcc,	%f16,	%f17
	fsrc2s	%f31,	%f20
	orncc	%o7,	%i3,	%g6
	andcc	%i4,	0x078F,	%o6
	fzeros	%f11
	and	%g2,	0x0720,	%o4
	edge16	%i6,	%g5,	%o5
	movne	%icc,	%l0,	%o2
	ld	[%l7 + 0x3C],	%f24
	movvs	%icc,	%g4,	%g3
	edge16l	%l4,	%i5,	%l5
	subccc	%o3,	%i2,	%i7
	popc	%l3,	%o1
	alignaddr	%g1,	%o0,	%l2
	and	%l1,	%g7,	%i1
	edge32l	%i0,	%o7,	%l6
	and	%g6,	%i4,	%o6
	ld	[%l7 + 0x48],	%f26
	fmovdg	%icc,	%f24,	%f16
	fpadd16	%f2,	%f18,	%f10
	edge32l	%i3,	%g2,	%i6
	sethi	0x158E,	%g5
	fmovdle	%icc,	%f5,	%f18
	subc	%o5,	0x0E62,	%l0
	array8	%o2,	%o4,	%g3
	fors	%f16,	%f30,	%f29
	array16	%l4,	%g4,	%i5
	orcc	%l5,	0x19FD,	%o3
	fmovscc	%xcc,	%f27,	%f31
	movgu	%icc,	%i2,	%i7
	subcc	%o1,	%l3,	%o0
	fornot2s	%f1,	%f29,	%f6
	andn	%l2,	0x09F9,	%l1
	smulcc	%g1,	0x1845,	%g7
	std	%f4,	[%l7 + 0x08]
	fmovdne	%xcc,	%f20,	%f15
	fcmped	%fcc2,	%f14,	%f16
	srlx	%i1,	0x07,	%o7
	fmovdvc	%icc,	%f13,	%f13
	xorcc	%i0,	%g6,	%i4
	fmovsvs	%icc,	%f0,	%f9
	array8	%l6,	%o6,	%i3
	movcs	%xcc,	%g2,	%g5
	subcc	%i6,	0x0E0E,	%o5
	movrne	%l0,	%o2,	%g3
	ld	[%l7 + 0x68],	%f29
	subc	%l4,	0x01E7,	%o4
	ld	[%l7 + 0x14],	%f31
	fexpand	%f9,	%f10
	movl	%xcc,	%i5,	%g4
	sllx	%o3,	0x07,	%i2
	xnorcc	%l5,	0x042B,	%o1
	fmul8ulx16	%f18,	%f0,	%f30
	movne	%icc,	%l3,	%i7
	ldsw	[%l7 + 0x7C],	%l2
	edge32n	%l1,	%g1,	%o0
	fpack32	%f10,	%f2,	%f24
	movvs	%xcc,	%g7,	%o7
	fandnot2	%f24,	%f12,	%f22
	edge32l	%i1,	%i0,	%i4
	fmovde	%xcc,	%f29,	%f1
	for	%f0,	%f4,	%f20
	movleu	%xcc,	%g6,	%l6
	edge8l	%i3,	%g2,	%g5
	ldub	[%l7 + 0x76],	%o6
	ldx	[%l7 + 0x28],	%o5
	stx	%i6,	[%l7 + 0x68]
	movrlez	%l0,	0x0DF,	%g3
	or	%o2,	0x164E,	%l4
	or	%i5,	%g4,	%o3
	sllx	%i2,	0x15,	%o4
	fcmpgt32	%f18,	%f22,	%l5
	addc	%l3,	0x0691,	%i7
	edge8n	%o1,	%l1,	%l2
	smulcc	%g1,	0x0F0E,	%g7
	edge8ln	%o7,	%o0,	%i0
	sll	%i4,	%g6,	%l6
	sethi	0x192D,	%i3
	stx	%g2,	[%l7 + 0x30]
	move	%icc,	%g5,	%o6
	subccc	%o5,	0x1F91,	%i6
	move	%icc,	%i1,	%g3
	std	%f6,	[%l7 + 0x10]
	sllx	%o2,	0x17,	%l0
	movrgez	%l4,	%i5,	%o3
	xor	%i2,	%g4,	%o4
	orn	%l5,	%l3,	%i7
	xnorcc	%o1,	0x009C,	%l2
	array32	%g1,	%g7,	%l1
	movleu	%xcc,	%o0,	%i0
	fmovsge	%icc,	%f3,	%f11
	fmovdle	%icc,	%f27,	%f25
	move	%xcc,	%i4,	%o7
	fpadd16	%f24,	%f18,	%f18
	xorcc	%l6,	%g6,	%g2
	srax	%i3,	0x1A,	%g5
	srl	%o5,	0x1D,	%i6
	orn	%i1,	0x0974,	%g3
	edge8ln	%o2,	%o6,	%l4
	umulcc	%l0,	%o3,	%i2
	xnor	%g4,	0x0F2C,	%o4
	xor	%i5,	0x18AB,	%l3
	sir	0x17AA
	ldub	[%l7 + 0x6B],	%l5
	udivcc	%i7,	0x086E,	%l2
	move	%xcc,	%o1,	%g1
	addccc	%l1,	%g7,	%i0
	movle	%xcc,	%i4,	%o7
	fornot2	%f20,	%f2,	%f18
	andncc	%l6,	%o0,	%g6
	or	%i3,	0x1D15,	%g5
	fnegs	%f0,	%f14
	fxnor	%f2,	%f6,	%f20
	fnor	%f24,	%f18,	%f0
	movrne	%g2,	%o5,	%i1
	movne	%icc,	%g3,	%o2
	edge8	%o6,	%l4,	%l0
	orn	%i6,	0x1438,	%i2
	movn	%icc,	%g4,	%o4
	movn	%icc,	%i5,	%o3
	movleu	%icc,	%l3,	%l5
	srl	%i7,	0x07,	%l2
	ldsb	[%l7 + 0x75],	%o1
	xorcc	%g1,	0x04DD,	%g7
	sir	0x1005
	lduw	[%l7 + 0x6C],	%l1
	sdivcc	%i0,	0x00F9,	%i4
	fnot2s	%f11,	%f27
	movcc	%icc,	%o7,	%l6
	edge8ln	%o0,	%i3,	%g6
	fmovspos	%xcc,	%f21,	%f14
	fmovrse	%g2,	%f24,	%f30
	fmovrdne	%g5,	%f24,	%f26
	movpos	%icc,	%o5,	%i1
	fmovdge	%icc,	%f2,	%f25
	edge32n	%g3,	%o6,	%l4
	edge16ln	%o2,	%i6,	%i2
	edge8ln	%l0,	%o4,	%g4
	fmovrse	%i5,	%f19,	%f16
	subccc	%l3,	0x0617,	%l5
	sdiv	%i7,	0x05B2,	%o3
	ldsb	[%l7 + 0x2C],	%o1
	fxors	%f24,	%f7,	%f25
	addcc	%l2,	%g1,	%l1
	mova	%icc,	%g7,	%i0
	add	%o7,	%l6,	%i4
	movre	%o0,	%i3,	%g2
	sethi	0x0A14,	%g6
	umulcc	%g5,	%o5,	%g3
	edge8ln	%i1,	%o6,	%l4
	fmul8x16au	%f30,	%f21,	%f4
	orncc	%o2,	0x1FCD,	%i2
	array8	%l0,	%i6,	%o4
	udivcc	%i5,	0x10B5,	%l3
	udiv	%g4,	0x1983,	%i7
	ldub	[%l7 + 0x11],	%l5
	edge8l	%o1,	%o3,	%l2
	sub	%g1,	0x13DB,	%g7
	xor	%i0,	0x14BD,	%l1
	subccc	%l6,	%i4,	%o0
	sth	%o7,	[%l7 + 0x7C]
	movpos	%icc,	%i3,	%g6
	movre	%g2,	0x113,	%g5
	fpack32	%f22,	%f28,	%f20
	addc	%o5,	0x1D51,	%i1
	sub	%g3,	%l4,	%o2
	sethi	0x1856,	%o6
	fandnot1	%f10,	%f20,	%f20
	lduh	[%l7 + 0x0E],	%l0
	ldx	[%l7 + 0x30],	%i6
	fabsd	%f6,	%f12
	movneg	%icc,	%o4,	%i5
	smulcc	%i2,	0x159D,	%l3
	fmul8x16au	%f7,	%f20,	%f24
	fmul8x16al	%f30,	%f22,	%f26
	fcmps	%fcc2,	%f28,	%f31
	ldub	[%l7 + 0x72],	%i7
	fcmpne32	%f20,	%f6,	%l5
	movrgz	%g4,	%o3,	%o1
	fnot2s	%f10,	%f25
	fmovscs	%xcc,	%f18,	%f31
	edge32n	%l2,	%g1,	%g7
	movrlz	%i0,	0x15F,	%l6
	fmovdcs	%icc,	%f22,	%f24
	addc	%l1,	%i4,	%o7
	orcc	%i3,	%g6,	%o0
	and	%g2,	0x0453,	%o5
	movgu	%xcc,	%i1,	%g5
	fmul8ulx16	%f2,	%f28,	%f0
	srlx	%g3,	%l4,	%o6
	array8	%l0,	%i6,	%o2
	movrlez	%o4,	0x111,	%i5
	alignaddrl	%l3,	%i7,	%l5
	edge32ln	%i2,	%g4,	%o3
	stx	%o1,	[%l7 + 0x28]
	srax	%g1,	%l2,	%g7
	andncc	%i0,	%l1,	%i4
	fmovrslz	%l6,	%f4,	%f28
	sll	%o7,	0x01,	%g6
	umulcc	%i3,	%g2,	%o0
	sethi	0x0A63,	%o5
	fpsub16s	%f17,	%f24,	%f17
	fmul8x16	%f1,	%f16,	%f26
	fcmpeq32	%f16,	%f18,	%g5
	lduh	[%l7 + 0x0A],	%g3
	edge16l	%i1,	%l4,	%l0
	sllx	%i6,	%o6,	%o2
	udivx	%o4,	0x0111,	%l3
	fpsub16	%f30,	%f8,	%f4
	andncc	%i5,	%l5,	%i7
	srl	%g4,	0x02,	%o3
	movrlz	%o1,	0x36D,	%g1
	addc	%i2,	%g7,	%i0
	fsrc2	%f6,	%f18
	sir	0x0DEF
	movleu	%xcc,	%l2,	%l1
	edge8l	%i4,	%l6,	%o7
	sub	%i3,	%g2,	%g6
	fxnor	%f26,	%f2,	%f12
	movleu	%icc,	%o0,	%g5
	subcc	%o5,	%i1,	%g3
	edge32	%l4,	%l0,	%o6
	edge8l	%i6,	%o4,	%o2
	sll	%i5,	%l3,	%l5
	xnorcc	%g4,	%i7,	%o1
	andn	%g1,	%i2,	%g7
	ldub	[%l7 + 0x52],	%i0
	edge32n	%l2,	%o3,	%i4
	sth	%l6,	[%l7 + 0x7A]
	addccc	%l1,	%i3,	%o7
	fmovsgu	%xcc,	%f15,	%f10
	ldsh	[%l7 + 0x46],	%g6
	sethi	0x09C1,	%g2
	edge16	%o0,	%o5,	%g5
	ldx	[%l7 + 0x38],	%g3
	stw	%l4,	[%l7 + 0x74]
	alignaddrl	%l0,	%i1,	%i6
	edge8l	%o6,	%o4,	%i5
	mova	%icc,	%o2,	%l3
	movrne	%l5,	%i7,	%o1
	edge32l	%g1,	%g4,	%i2
	srl	%i0,	0x19,	%g7
	fmovdvs	%icc,	%f2,	%f25
	movg	%icc,	%o3,	%i4
	movrlez	%l2,	%l1,	%i3
	fmovscs	%xcc,	%f8,	%f29
	fmovrde	%l6,	%f2,	%f12
	fnegd	%f26,	%f14
	edge8n	%o7,	%g6,	%g2
	udiv	%o0,	0x14E7,	%o5
	sdivcc	%g3,	0x02A8,	%g5
	fmovrsgez	%l0,	%f12,	%f5
	fmovdle	%icc,	%f14,	%f21
	lduh	[%l7 + 0x56],	%i1
	edge16ln	%l4,	%o6,	%o4
	movrlez	%i5,	%o2,	%i6
	array32	%l5,	%i7,	%l3
	ldd	[%l7 + 0x10],	%o0
	edge8ln	%g1,	%g4,	%i2
	subc	%g7,	%i0,	%o3
	udivcc	%l2,	0x0CA3,	%i4
	sra	%i3,	0x15,	%l1
	fabsd	%f18,	%f20
	andn	%l6,	%o7,	%g2
	subccc	%o0,	0x075E,	%g6
	orcc	%o5,	0x06E3,	%g3
	udiv	%l0,	0x1915,	%i1
	ldd	[%l7 + 0x78],	%f20
	movcc	%xcc,	%l4,	%g5
	edge8l	%o6,	%o4,	%o2
	array16	%i5,	%l5,	%i6
	array8	%i7,	%o1,	%g1
	fmuld8ulx16	%f6,	%f5,	%f28
	alignaddr	%g4,	%l3,	%i2
	edge8	%i0,	%o3,	%g7
	alignaddr	%i4,	%l2,	%l1
	stb	%i3,	[%l7 + 0x5A]
	fmovda	%xcc,	%f0,	%f13
	movre	%o7,	0x122,	%l6
	array32	%g2,	%o0,	%g6
	fpsub32s	%f14,	%f14,	%f2
	ldd	[%l7 + 0x60],	%g2
	lduw	[%l7 + 0x3C],	%o5
	fornot2	%f2,	%f6,	%f28
	movrgz	%i1,	%l0,	%l4
	orncc	%o6,	%g5,	%o4
	subccc	%i5,	0x08EA,	%l5
	ldx	[%l7 + 0x50],	%i6
	alignaddr	%i7,	%o1,	%g1
	fmuld8sux16	%f11,	%f30,	%f28
	fmovdne	%xcc,	%f14,	%f24
	fmovdcc	%icc,	%f20,	%f2
	movrgz	%g4,	0x2FB,	%o2
	mova	%icc,	%i2,	%l3
	edge32l	%i0,	%g7,	%o3
	ldd	[%l7 + 0x30],	%l2
	andcc	%i4,	0x06CA,	%l1
	array16	%i3,	%o7,	%g2
	fmovdne	%xcc,	%f18,	%f9
	srlx	%o0,	0x12,	%g6
	andcc	%g3,	0x1130,	%l6
	umulcc	%i1,	%o5,	%l0
	movn	%icc,	%o6,	%g5
	ldd	[%l7 + 0x50],	%f14
	fcmple16	%f26,	%f26,	%l4
	fcmps	%fcc2,	%f11,	%f31
	or	%o4,	%i5,	%i6
	edge32	%l5,	%i7,	%o1
	subcc	%g1,	0x0D3D,	%o2
	edge16ln	%g4,	%l3,	%i0
	srax	%g7,	0x06,	%i2
	fmovsl	%icc,	%f6,	%f21
	sdivx	%l2,	0x1177,	%o3
	edge32l	%i4,	%i3,	%o7
	edge32ln	%g2,	%o0,	%g6
	fcmpne32	%f26,	%f6,	%l1
	ld	[%l7 + 0x10],	%f3
	addc	%g3,	%i1,	%o5
	add	%l6,	0x1C4C,	%l0
	smul	%g5,	%l4,	%o6
	array16	%o4,	%i6,	%l5
	andcc	%i5,	0x0351,	%i7
	lduw	[%l7 + 0x38],	%o1
	xorcc	%g1,	0x1A1B,	%o2
	fcmpd	%fcc3,	%f18,	%f8
	smul	%l3,	%g4,	%i0
	ldsh	[%l7 + 0x7C],	%g7
	edge32n	%i2,	%l2,	%o3
	fmovsne	%xcc,	%f25,	%f29
	fsrc1s	%f20,	%f6
	udiv	%i4,	0x13D1,	%i3
	fcmps	%fcc1,	%f27,	%f15
	movvc	%xcc,	%o7,	%g2
	ldsw	[%l7 + 0x40],	%g6
	sethi	0x1EC5,	%l1
	fones	%f25
	andn	%o0,	%i1,	%o5
	udivx	%l6,	0x01E3,	%l0
	edge16n	%g5,	%g3,	%l4
	alignaddrl	%o4,	%i6,	%o6
	movn	%xcc,	%l5,	%i5
	for	%f2,	%f24,	%f8
	udivcc	%o1,	0x09CF,	%g1
	movrlz	%o2,	0x371,	%i7
	fxnor	%f2,	%f18,	%f24
	nop
	set	0x5E, %i4
	lduh	[%l7 + %i4],	%l3
	ld	[%l7 + 0x68],	%f24
	movpos	%icc,	%g4,	%i0
	edge32ln	%g7,	%i2,	%o3
	addc	%i4,	0x1EDF,	%i3
	edge16ln	%o7,	%g2,	%g6
	alignaddrl	%l1,	%l2,	%i1
	movge	%xcc,	%o5,	%l6
	andn	%l0,	%o0,	%g5
	add	%g3,	%l4,	%o4
	save %i6, 0x1074, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x30, %l0
	ldd	[%l7 + %l0],	%f14
	fmovrdne	%i5,	%f16,	%f28
	move	%icc,	%o6,	%g1
	orn	%o1,	%i7,	%o2
	fpsub32	%f28,	%f16,	%f16
	fxors	%f23,	%f3,	%f22
	subccc	%g4,	%i0,	%l3
	edge8	%g7,	%o3,	%i2
	stx	%i4,	[%l7 + 0x10]
	movneg	%xcc,	%o7,	%g2
	ld	[%l7 + 0x3C],	%f14
	movneg	%xcc,	%i3,	%l1
	mulx	%l2,	%i1,	%g6
	xnor	%l6,	0x1366,	%o5
	movg	%icc,	%l0,	%g5
	popc	%o0,	%l4
	fmovsleu	%icc,	%f11,	%f15
	restore %o4, 0x021B, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x78],	%f10
	xnorcc	%l5,	%i6,	%i5
	movpos	%icc,	%o6,	%o1
	sll	%g1,	%i7,	%o2
	fnand	%f18,	%f8,	%f16
	fnand	%f18,	%f18,	%f20
	orcc	%g4,	0x1937,	%i0
	fornot1	%f18,	%f22,	%f4
	fornot2s	%f4,	%f5,	%f20
	sth	%l3,	[%l7 + 0x52]
	movgu	%xcc,	%g7,	%i2
	xnor	%o3,	0x0086,	%i4
	alignaddr	%g2,	%o7,	%i3
	movrgz	%l1,	0x10E,	%i1
	movvc	%xcc,	%l2,	%g6
	movrlz	%l6,	%o5,	%l0
	ldx	[%l7 + 0x08],	%g5
	addccc	%o0,	0x0F92,	%o4
	movl	%xcc,	%g3,	%l4
	andn	%l5,	%i6,	%o6
	andcc	%i5,	%o1,	%i7
	sll	%g1,	%o2,	%i0
	std	%f18,	[%l7 + 0x30]
	edge32	%g4,	%l3,	%i2
	ldub	[%l7 + 0x0F],	%g7
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%i4
	fxors	%f23,	%f25,	%f8
	array8	%g2,	%o3,	%o7
	fnot1s	%f16,	%f9
	and	%i3,	0x158A,	%i1
	move	%icc,	%l2,	%g6
	movgu	%icc,	%l6,	%l1
	array8	%o5,	%l0,	%g5
	add	%o4,	0x0B4F,	%g3
	fcmped	%fcc3,	%f8,	%f10
	edge8	%l4,	%l5,	%i6
	movgu	%xcc,	%o6,	%o0
	fnot2s	%f20,	%f24
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	movrlz	%g1,	%o2,	%g4
	std	%f8,	[%l7 + 0x70]
	movrlez	%l3,	0x02D,	%i2
	stb	%g7,	[%l7 + 0x38]
	fmovsneg	%xcc,	%f5,	%f0
	edge8	%i0,	%i4,	%g2
	stx	%o7,	[%l7 + 0x28]
	stx	%i3,	[%l7 + 0x50]
	movle	%icc,	%o3,	%i1
	xnor	%g6,	0x1B23,	%l6
	movvs	%icc,	%l2,	%l1
	ldd	[%l7 + 0x68],	%l0
	alignaddrl	%o5,	%g5,	%g3
	ldd	[%l7 + 0x58],	%f20
	mova	%xcc,	%o4,	%l4
	sra	%i6,	%o6,	%o0
	edge8l	%i5,	%l5,	%i7
	fmovde	%icc,	%f1,	%f24
	fcmps	%fcc0,	%f11,	%f16
	lduw	[%l7 + 0x30],	%g1
	fmovsg	%icc,	%f24,	%f24
	sethi	0x123B,	%o2
	srlx	%o1,	0x03,	%l3
	fcmple32	%f20,	%f8,	%i2
	sll	%g7,	%i0,	%g4
	mulscc	%g2,	0x0909,	%o7
	fcmpeq16	%f0,	%f4,	%i3
	array8	%i4,	%o3,	%i1
	edge8	%g6,	%l6,	%l2
	mulscc	%l0,	0x012A,	%l1
	restore %g5, %o5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l4,	%o4
	srax	%o6,	%i6,	%o0
	srax	%i5,	%i7,	%g1
	sir	0x0215
	sethi	0x091E,	%o2
	edge16l	%o1,	%l5,	%i2
	subccc	%l3,	%i0,	%g4
	std	%f10,	[%l7 + 0x28]
	ldsb	[%l7 + 0x19],	%g2
	fzero	%f30
	mulx	%o7,	0x0958,	%g7
	umul	%i3,	0x00CD,	%o3
	add	%i1,	0x1EF3,	%g6
	ld	[%l7 + 0x20],	%f11
	nop
	set	0x29, %g2
	ldsb	[%l7 + %g2],	%l6
	movre	%i4,	%l0,	%l2
	array8	%g5,	%l1,	%g3
	edge32n	%o5,	%o4,	%o6
	sdivcc	%i6,	0x19D8,	%o0
	smul	%i5,	%i7,	%l4
	fmul8ulx16	%f28,	%f2,	%f22
	fabsd	%f14,	%f4
	fmovdg	%xcc,	%f1,	%f5
	fmovdge	%icc,	%f1,	%f14
	orncc	%g1,	%o2,	%l5
	fmovde	%xcc,	%f28,	%f9
	lduw	[%l7 + 0x50],	%i2
	fmovdneg	%icc,	%f8,	%f15
	fnand	%f2,	%f26,	%f4
	movvs	%icc,	%o1,	%l3
	sub	%i0,	0x1678,	%g2
	ldsb	[%l7 + 0x10],	%g4
	ld	[%l7 + 0x78],	%f29
	sdivcc	%g7,	0x0170,	%i3
	edge16n	%o7,	%o3,	%i1
	fmovsge	%icc,	%f26,	%f9
	or	%g6,	0x06F3,	%i4
	lduw	[%l7 + 0x3C],	%l6
	addcc	%l2,	0x0A88,	%g5
	andcc	%l1,	%g3,	%o5
	fxors	%f23,	%f9,	%f23
	smulcc	%o4,	%o6,	%i6
	array8	%l0,	%i5,	%o0
	movre	%i7,	%g1,	%o2
	alignaddr	%l5,	%l4,	%i2
	sdivx	%o1,	0x14FA,	%i0
	ldd	[%l7 + 0x60],	%g2
	fmuld8ulx16	%f26,	%f15,	%f26
	mulx	%l3,	0x1880,	%g4
	umulcc	%g7,	0x1DC4,	%o7
	udivcc	%i3,	0x1DFC,	%o3
	fsrc1s	%f7,	%f9
	edge8	%g6,	%i4,	%i1
	udivcc	%l2,	0x08FE,	%l6
	xnorcc	%l1,	%g3,	%o5
	umul	%o4,	0x1666,	%g5
	edge8n	%o6,	%l0,	%i6
	movrne	%o0,	%i5,	%i7
	ldsw	[%l7 + 0x08],	%o2
	sub	%g1,	%l4,	%i2
	andncc	%l5,	%i0,	%g2
	fornot2	%f22,	%f14,	%f14
	ldsh	[%l7 + 0x66],	%o1
	sub	%l3,	%g7,	%o7
	sra	%g4,	0x16,	%i3
	orncc	%o3,	%i4,	%g6
	array32	%l2,	%l6,	%i1
	movre	%g3,	%l1,	%o5
	movrgz	%o4,	0x1C0,	%g5
	array8	%o6,	%i6,	%o0
	movrlz	%i5,	%i7,	%o2
	orcc	%l0,	0x18DC,	%l4
	sll	%g1,	%l5,	%i0
	fmovrdgz	%i2,	%f0,	%f12
	nop
	set	0x48, %o3
	sth	%g2,	[%l7 + %o3]
	movrne	%l3,	0x23F,	%o1
	xorcc	%o7,	0x003F,	%g4
	lduw	[%l7 + 0x34],	%i3
	umul	%o3,	0x1AEF,	%i4
	movrlz	%g6,	0x3C3,	%l2
	faligndata	%f22,	%f20,	%f18
	fpsub32	%f16,	%f6,	%f20
	fandnot1	%f16,	%f14,	%f8
	sra	%l6,	%g7,	%g3
	movne	%xcc,	%l1,	%i1
	fcmpgt16	%f18,	%f14,	%o4
	umulcc	%g5,	%o5,	%i6
	sra	%o0,	%o6,	%i5
	edge8l	%o2,	%i7,	%l4
	movrlez	%g1,	%l0,	%i0
	fabss	%f15,	%f31
	fmovda	%icc,	%f1,	%f24
	ldd	[%l7 + 0x38],	%l4
	andcc	%i2,	%g2,	%l3
	smul	%o7,	%g4,	%i3
	sdivx	%o1,	0x1805,	%o3
	popc	0x0209,	%i4
	movge	%icc,	%l2,	%l6
	sll	%g6,	0x0F,	%g7
	ld	[%l7 + 0x30],	%f1
	xor	%l1,	%i1,	%o4
	xnorcc	%g3,	0x17EA,	%o5
	orn	%i6,	0x0340,	%o0
	smul	%g5,	%o6,	%i5
	sllx	%o2,	0x1B,	%i7
	addcc	%l4,	0x10A0,	%l0
	fcmple32	%f28,	%f0,	%i0
	ldd	[%l7 + 0x48],	%f14
	fmovrdgz	%l5,	%f8,	%f8
	movg	%xcc,	%g1,	%g2
	movrgz	%l3,	0x178,	%o7
	umulcc	%i2,	0x16F9,	%i3
	movn	%xcc,	%o1,	%o3
	mulx	%g4,	%i4,	%l6
	sra	%g6,	0x10,	%g7
	movne	%xcc,	%l2,	%l1
	sdivcc	%o4,	0x0567,	%g3
	smul	%o5,	0x1996,	%i6
	popc	0x11B3,	%i1
	stb	%o0,	[%l7 + 0x29]
	edge16l	%g5,	%o6,	%i5
	mulx	%o2,	0x0DAA,	%l4
	andncc	%i7,	%l0,	%l5
	fmovde	%icc,	%f2,	%f30
	fmovsg	%icc,	%f4,	%f16
	orcc	%i0,	0x0240,	%g2
	edge16ln	%l3,	%o7,	%g1
	ldd	[%l7 + 0x28],	%i2
	ldd	[%l7 + 0x10],	%i2
	movgu	%xcc,	%o1,	%o3
	edge32	%i4,	%l6,	%g6
	edge16ln	%g4,	%g7,	%l1
	srlx	%l2,	0x1B,	%o4
	movrne	%o5,	%g3,	%i1
	movrlez	%i6,	%g5,	%o6
	movpos	%icc,	%i5,	%o0
	movne	%xcc,	%l4,	%o2
	umul	%i7,	0x1F12,	%l0
	movvc	%xcc,	%i0,	%g2
	stw	%l5,	[%l7 + 0x08]
	and	%o7,	0x10C6,	%g1
	sdivx	%l3,	0x06DE,	%i3
	fnors	%f8,	%f15,	%f16
	fmovsge	%icc,	%f8,	%f9
	movg	%xcc,	%i2,	%o3
	add	%i4,	%o1,	%l6
	fmovdcc	%xcc,	%f28,	%f3
	addc	%g6,	%g7,	%g4
	ldx	[%l7 + 0x70],	%l2
	movn	%icc,	%l1,	%o5
	andncc	%g3,	%i1,	%i6
	sir	0x1CCD
	movre	%o4,	%g5,	%o6
	udiv	%o0,	0x125B,	%l4
	xorcc	%o2,	%i7,	%l0
	xnor	%i0,	%i5,	%g2
	add	%o7,	0x04E5,	%g1
	addccc	%l5,	0x1FBF,	%l3
	lduh	[%l7 + 0x20],	%i3
	add	%i2,	%i4,	%o1
	move	%icc,	%l6,	%o3
	movvs	%icc,	%g6,	%g4
	edge8ln	%l2,	%l1,	%g7
	orncc	%o5,	0x02BB,	%g3
	edge16ln	%i1,	%i6,	%o4
	bshuffle	%f22,	%f6,	%f30
	mulscc	%o6,	%g5,	%o0
	fcmpgt32	%f12,	%f0,	%l4
	movvc	%icc,	%i7,	%l0
	edge8	%o2,	%i0,	%g2
	bshuffle	%f10,	%f12,	%f4
	fabsd	%f20,	%f0
	ldd	[%l7 + 0x58],	%i4
	stx	%g1,	[%l7 + 0x48]
	movcs	%xcc,	%l5,	%o7
	ldx	[%l7 + 0x28],	%i3
	ldsb	[%l7 + 0x28],	%l3
	fmovsle	%xcc,	%f21,	%f30
	movneg	%icc,	%i4,	%i2
	fmovdle	%icc,	%f3,	%f5
	addcc	%o1,	%l6,	%o3
	movge	%xcc,	%g4,	%l2
	ldx	[%l7 + 0x48],	%g6
	alignaddrl	%g7,	%o5,	%l1
	mova	%icc,	%i1,	%i6
	movg	%icc,	%o4,	%o6
	array8	%g5,	%o0,	%g3
	subccc	%i7,	0x04B7,	%l0
	andncc	%o2,	%i0,	%l4
	fxors	%f31,	%f8,	%f2
	fnand	%f26,	%f0,	%f12
	movg	%icc,	%i5,	%g1
	movre	%g2,	%o7,	%l5
	subccc	%l3,	0x0435,	%i3
	mulx	%i2,	0x13B3,	%i4
	fcmpne32	%f6,	%f24,	%o1
	array16	%l6,	%g4,	%l2
	srl	%g6,	0x1A,	%o3
	edge8	%o5,	%g7,	%l1
	udiv	%i1,	0x0341,	%o4
	orcc	%o6,	0x1319,	%g5
	udiv	%i6,	0x1D12,	%g3
	sth	%o0,	[%l7 + 0x26]
	movrlez	%i7,	0x38D,	%o2
	edge32	%l0,	%l4,	%i0
	ldsw	[%l7 + 0x74],	%g1
	ld	[%l7 + 0x34],	%f21
	alignaddr	%i5,	%o7,	%g2
	movrlez	%l3,	0x2EE,	%i3
	addccc	%l5,	0x16A6,	%i4
	ldx	[%l7 + 0x18],	%o1
	addccc	%l6,	%g4,	%l2
	edge32l	%i2,	%g6,	%o3
	mulx	%o5,	0x05C2,	%g7
	move	%icc,	%l1,	%i1
	andcc	%o6,	0x01B2,	%g5
	fmovdge	%xcc,	%f2,	%f8
	subccc	%i6,	%g3,	%o0
	subccc	%o4,	0x0F38,	%i7
	ld	[%l7 + 0x5C],	%f5
	ldd	[%l7 + 0x50],	%l0
	movleu	%xcc,	%l4,	%o2
	fcmpgt16	%f0,	%f20,	%i0
	fors	%f27,	%f8,	%f1
	fpadd16	%f6,	%f28,	%f28
	fcmpeq16	%f28,	%f16,	%g1
	edge16l	%i5,	%o7,	%l3
	fpmerge	%f16,	%f13,	%f26
	addcc	%i3,	%l5,	%i4
	add	%o1,	0x0B45,	%g2
	sth	%l6,	[%l7 + 0x7E]
	smulcc	%l2,	0x1D03,	%g4
	movpos	%xcc,	%i2,	%o3
	fxnors	%f13,	%f28,	%f21
	movvc	%xcc,	%g6,	%o5
	subc	%l1,	0x186D,	%g7
	movl	%xcc,	%i1,	%o6
	fcmpd	%fcc1,	%f28,	%f2
	orcc	%g5,	0x0052,	%i6
	fmuld8sux16	%f27,	%f11,	%f24
	save %g3, %o4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l0,	0x01,	%l4
	alignaddr	%o2,	%i7,	%i0
	edge32n	%i5,	%o7,	%g1
	mulscc	%i3,	%l5,	%i4
	fmovda	%xcc,	%f15,	%f30
	xorcc	%l3,	%g2,	%o1
	orn	%l2,	0x0E87,	%g4
	nop
	set	0x76, %l6
	ldub	[%l7 + %l6],	%i2
	edge16ln	%l6,	%o3,	%g6
	st	%f13,	[%l7 + 0x4C]
	fxnors	%f6,	%f14,	%f16
	fexpand	%f8,	%f22
	movne	%icc,	%l1,	%o5
	array32	%g7,	%o6,	%g5
	udivx	%i6,	0x16C9,	%i1
	fmovrslz	%g3,	%f13,	%f30
	lduw	[%l7 + 0x68],	%o0
	sethi	0x0BCA,	%o4
	sub	%l0,	%o2,	%i7
	edge8n	%i0,	%i5,	%o7
	fmovdvc	%icc,	%f2,	%f3
	fmovdleu	%icc,	%f26,	%f9
	sth	%g1,	[%l7 + 0x10]
	sub	%i3,	0x07A6,	%l4
	movleu	%icc,	%i4,	%l5
	sdiv	%l3,	0x0FB9,	%g2
	orcc	%l2,	0x072F,	%g4
	lduh	[%l7 + 0x28],	%i2
	ldx	[%l7 + 0x48],	%l6
	fandnot1	%f24,	%f28,	%f24
	udivcc	%o1,	0x02E5,	%o3
	movrlez	%g6,	0x37D,	%l1
	movgu	%icc,	%o5,	%g7
	ldd	[%l7 + 0x68],	%f26
	subc	%g5,	%o6,	%i1
	fmovdne	%xcc,	%f19,	%f0
	faligndata	%f20,	%f22,	%f10
	and	%i6,	0x13E8,	%o0
	fpmerge	%f7,	%f10,	%f26
	edge16l	%o4,	%g3,	%o2
	ldsb	[%l7 + 0x4E],	%i7
	fands	%f19,	%f3,	%f30
	xor	%l0,	%i5,	%o7
	movre	%g1,	%i0,	%l4
	movre	%i4,	%l5,	%l3
	fsrc1	%f14,	%f2
	movvc	%icc,	%i3,	%l2
	sdivcc	%g4,	0x0695,	%i2
	edge16	%l6,	%g2,	%o1
	std	%f4,	[%l7 + 0x10]
	fpackfix	%f10,	%f24
	mova	%icc,	%o3,	%g6
	edge16	%o5,	%l1,	%g7
	fmovsne	%icc,	%f12,	%f11
	movleu	%icc,	%g5,	%i1
	edge32l	%i6,	%o6,	%o0
	stw	%g3,	[%l7 + 0x68]
	movrgez	%o4,	%i7,	%o2
	sethi	0x0FD2,	%i5
	movvc	%xcc,	%o7,	%l0
	edge16n	%i0,	%l4,	%g1
	ldx	[%l7 + 0x38],	%l5
	lduw	[%l7 + 0x48],	%i4
	movrgz	%i3,	%l3,	%g4
	movvc	%icc,	%i2,	%l6
	subccc	%l2,	0x0BB7,	%g2
	and	%o1,	%g6,	%o5
	movge	%xcc,	%o3,	%g7
	ldsh	[%l7 + 0x38],	%g5
	fmovrdne	%i1,	%f28,	%f0
	orn	%i6,	%o6,	%l1
	edge32ln	%g3,	%o4,	%o0
	popc	0x1A76,	%o2
	movn	%icc,	%i7,	%o7
	save %i5, 0x17DE, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i0,	0x078,	%l4
	edge16n	%l5,	%g1,	%i4
	xnorcc	%l3,	0x16D7,	%g4
	fmovdl	%xcc,	%f25,	%f15
	andcc	%i2,	%l6,	%i3
	fmovrdne	%l2,	%f14,	%f28
	ldub	[%l7 + 0x46],	%g2
	sdivx	%g6,	0x10BA,	%o1
	fmovscs	%xcc,	%f21,	%f1
	subc	%o5,	%g7,	%g5
	ldsb	[%l7 + 0x3A],	%i1
	ldd	[%l7 + 0x08],	%f0
	lduh	[%l7 + 0x6A],	%i6
	andcc	%o3,	0x1BB3,	%o6
	udiv	%l1,	0x17A8,	%g3
	edge8n	%o4,	%o0,	%i7
	fcmpne16	%f16,	%f16,	%o7
	save %i5, 0x0B51, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f1,	%f15,	%f30
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f12
	addcc	%i0,	0x1657,	%l4
	movvc	%xcc,	%o2,	%l5
	fmovsl	%xcc,	%f18,	%f23
	edge32	%g1,	%l3,	%g4
	subc	%i4,	0x0513,	%i2
	fmovrdlz	%i3,	%f20,	%f28
	movcc	%icc,	%l6,	%g2
	stb	%g6,	[%l7 + 0x2D]
	movgu	%xcc,	%l2,	%o5
	movre	%o1,	%g5,	%g7
	subccc	%i6,	0x0A97,	%i1
	subcc	%o3,	0x18EC,	%l1
	movre	%g3,	%o6,	%o0
	fmovrdgez	%o4,	%f0,	%f22
	edge16n	%o7,	%i5,	%i7
	ldsw	[%l7 + 0x7C],	%l0
	nop
	set	0x30, %l1
	ldx	[%l7 + %l1],	%i0
	udivx	%o2,	0x0826,	%l4
	edge16ln	%l5,	%g1,	%g4
	sir	0x17BD
	orn	%i4,	%i2,	%i3
	fmovdcs	%icc,	%f3,	%f26
	fmovdleu	%xcc,	%f2,	%f31
	fnot1	%f14,	%f4
	movleu	%xcc,	%l6,	%g2
	movpos	%xcc,	%g6,	%l2
	movle	%xcc,	%l3,	%o5
	fmuld8sux16	%f23,	%f17,	%f18
	srlx	%g5,	%g7,	%o1
	fcmpd	%fcc1,	%f2,	%f4
	add	%i6,	%i1,	%l1
	nop
	set	0x5E, %i1
	sth	%o3,	[%l7 + %i1]
	orcc	%g3,	%o0,	%o6
	sub	%o7,	%i5,	%i7
	pdist	%f6,	%f12,	%f26
	udivx	%l0,	0x04B4,	%o4
	mova	%xcc,	%o2,	%i0
	add	%l5,	0x09BC,	%g1
	srax	%l4,	%g4,	%i2
	movvs	%icc,	%i4,	%l6
	fmovdcc	%xcc,	%f15,	%f22
	movrne	%i3,	%g2,	%l2
	umulcc	%g6,	%l3,	%g5
	fmovrde	%o5,	%f6,	%f18
	fexpand	%f1,	%f28
	st	%f10,	[%l7 + 0x0C]
	movgu	%icc,	%o1,	%g7
	smul	%i6,	0x0A8E,	%l1
	ldx	[%l7 + 0x78],	%o3
	fmovdpos	%xcc,	%f11,	%f7
	xorcc	%i1,	%o0,	%g3
	fmovdn	%xcc,	%f1,	%f9
	sll	%o6,	%o7,	%i7
	fpadd32s	%f29,	%f5,	%f26
	array32	%i5,	%l0,	%o4
	alignaddr	%o2,	%l5,	%g1
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	edge8	%i2,	%l4,	%i4
	stb	%l6,	[%l7 + 0x74]
	or	%g2,	0x1721,	%l2
	andcc	%g6,	%l3,	%g5
	fmovdpos	%xcc,	%f17,	%f19
	or	%o5,	%i3,	%o1
	nop
	set	0x18, %o0
	stw	%i6,	[%l7 + %o0]
	edge16l	%l1,	%g7,	%o3
	fzero	%f10
	movgu	%xcc,	%i1,	%o0
	fmovdg	%xcc,	%f10,	%f2
	fmovsl	%icc,	%f18,	%f21
	std	%f22,	[%l7 + 0x38]
	andn	%o6,	0x12BA,	%o7
	lduh	[%l7 + 0x54],	%g3
	andncc	%i5,	%l0,	%o4
	smulcc	%i7,	0x0D66,	%o2
	srax	%l5,	%i0,	%g1
	add	%i2,	%g4,	%l4
	sdivcc	%l6,	0x1220,	%g2
	udiv	%i4,	0x1B9D,	%g6
	fpadd16s	%f21,	%f8,	%f25
	ldub	[%l7 + 0x54],	%l2
	fornot1s	%f10,	%f17,	%f31
	ldub	[%l7 + 0x48],	%l3
	fcmpne32	%f8,	%f10,	%o5
	movcc	%xcc,	%i3,	%g5
	save %o1, 0x0B19, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i6,	0x048F,	%g7
	ldd	[%l7 + 0x28],	%f4
	smulcc	%i1,	%o0,	%o6
	sdivcc	%o7,	0x0C92,	%g3
	edge16n	%i5,	%l0,	%o3
	movrne	%o4,	0x2D3,	%i7
	sra	%l5,	%i0,	%g1
	movcc	%xcc,	%i2,	%g4
	sdivcc	%o2,	0x062D,	%l6
	sdivx	%g2,	0x0E25,	%i4
	fmovdcc	%icc,	%f4,	%f6
	fmovrslz	%g6,	%f26,	%f20
	edge32n	%l4,	%l2,	%o5
	srax	%l3,	0x1E,	%i3
	fmovsa	%icc,	%f24,	%f25
	xnor	%g5,	%o1,	%l1
	andn	%i6,	0x15EF,	%i1
	fmovsg	%xcc,	%f31,	%f7
	restore %o0, %g7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f30,	%f0
	fmovse	%icc,	%f4,	%f11
	movl	%xcc,	%o6,	%g3
	pdist	%f30,	%f26,	%f4
	andcc	%l0,	0x094A,	%i5
	movgu	%xcc,	%o3,	%i7
	ldub	[%l7 + 0x58],	%o4
	fnand	%f2,	%f2,	%f16
	bshuffle	%f6,	%f24,	%f12
	fnands	%f30,	%f5,	%f23
	fcmpeq32	%f18,	%f4,	%i0
	andcc	%l5,	0x03E1,	%i2
	lduw	[%l7 + 0x14],	%g4
	movle	%xcc,	%g1,	%l6
	fpsub16	%f0,	%f26,	%f2
	lduh	[%l7 + 0x0C],	%g2
	edge32l	%o2,	%g6,	%l4
	fmovrdgez	%l2,	%f26,	%f24
	fcmpne16	%f30,	%f26,	%o5
	smulcc	%i4,	0x02A3,	%i3
	umul	%l3,	%o1,	%g5
	fmuld8sux16	%f22,	%f26,	%f12
	fmovrsgez	%i6,	%f20,	%f21
	fandnot1	%f12,	%f14,	%f18
	umulcc	%i1,	%o0,	%g7
	fmovsl	%xcc,	%f6,	%f22
	and	%l1,	%o7,	%g3
	movgu	%xcc,	%o6,	%i5
	edge8	%l0,	%o3,	%i7
	sdivcc	%o4,	0x0F34,	%i0
	and	%i2,	%l5,	%g4
	movge	%xcc,	%l6,	%g1
	movvs	%icc,	%o2,	%g2
	sll	%g6,	%l2,	%o5
	sllx	%i4,	%i3,	%l4
	fpadd16	%f16,	%f2,	%f6
	movneg	%xcc,	%o1,	%g5
	fornot1s	%f18,	%f19,	%f3
	xor	%l3,	%i1,	%o0
	movcc	%icc,	%g7,	%l1
	alignaddr	%i6,	%o7,	%o6
	movrgez	%i5,	%l0,	%o3
	sra	%i7,	0x01,	%g3
	alignaddr	%i0,	%o4,	%i2
	stb	%l5,	[%l7 + 0x2C]
	movg	%xcc,	%l6,	%g4
	fsrc2s	%f18,	%f2
	ldub	[%l7 + 0x4D],	%g1
	orn	%o2,	%g2,	%l2
	fmovdle	%icc,	%f7,	%f24
	movvc	%icc,	%o5,	%g6
	orn	%i4,	0x1B77,	%i3
	sir	0x16D0
	edge16	%l4,	%g5,	%o1
	popc	%i1,	%o0
	sth	%l3,	[%l7 + 0x60]
	std	%f12,	[%l7 + 0x28]
	xnorcc	%l1,	%i6,	%o7
	fmuld8sux16	%f7,	%f21,	%f0
	stb	%o6,	[%l7 + 0x39]
	fmovsn	%icc,	%f31,	%f13
	subccc	%i5,	0x1560,	%g7
	fpsub16	%f14,	%f14,	%f24
	ldsb	[%l7 + 0x73],	%o3
	sdivx	%l0,	0x0A3F,	%g3
	lduw	[%l7 + 0x34],	%i7
	ldsw	[%l7 + 0x10],	%o4
	fmovsgu	%xcc,	%f2,	%f15
	array8	%i2,	%l5,	%l6
	array8	%g4,	%i0,	%g1
	fmovrse	%o2,	%f28,	%f0
	movne	%xcc,	%l2,	%o5
	for	%f30,	%f0,	%f16
	move	%xcc,	%g2,	%i4
	smul	%g6,	%l4,	%i3
	sethi	0x0D0E,	%g5
	srlx	%i1,	0x09,	%o0
	edge16n	%l3,	%o1,	%l1
	umulcc	%i6,	0x0AEE,	%o7
	sdivcc	%o6,	0x190A,	%g7
	popc	%i5,	%o3
	ldd	[%l7 + 0x60],	%f10
	xorcc	%g3,	%l0,	%i7
	movleu	%icc,	%i2,	%o4
	srlx	%l5,	%g4,	%l6
	sdivx	%i0,	0x0E90,	%g1
	fmovrslz	%o2,	%f17,	%f30
	and	%l2,	0x0B0B,	%g2
	sdiv	%o5,	0x1A2E,	%g6
	edge8ln	%l4,	%i3,	%g5
	movrlz	%i4,	0x128,	%o0
	edge16n	%l3,	%o1,	%i1
	edge32ln	%i6,	%o7,	%l1
	sll	%g7,	0x1B,	%o6
	udiv	%o3,	0x1657,	%g3
	srl	%l0,	0x12,	%i7
	add	%i5,	%o4,	%l5
	srax	%g4,	%l6,	%i2
	fcmple16	%f14,	%f4,	%i0
	subcc	%o2,	0x126E,	%l2
	movneg	%xcc,	%g2,	%o5
	stw	%g1,	[%l7 + 0x2C]
	fmovsgu	%xcc,	%f22,	%f24
	smulcc	%g6,	0x04D8,	%i3
	edge16ln	%g5,	%i4,	%l4
	sra	%l3,	0x0D,	%o1
	movrlez	%o0,	%i6,	%i1
	movpos	%icc,	%o7,	%g7
	xnorcc	%o6,	0x14AA,	%l1
	std	%f4,	[%l7 + 0x68]
	fmovd	%f30,	%f28
	mulx	%o3,	%g3,	%l0
	alignaddr	%i7,	%o4,	%l5
	ldsw	[%l7 + 0x74],	%i5
	fabss	%f11,	%f14
	or	%g4,	%l6,	%i2
	fnegd	%f6,	%f16
	edge8n	%i0,	%o2,	%l2
	movl	%icc,	%o5,	%g2
	orncc	%g6,	%g1,	%g5
	andncc	%i4,	%i3,	%l3
	fone	%f12
	xorcc	%l4,	0x052E,	%o1
	xnor	%o0,	0x17C8,	%i6
	srlx	%i1,	0x05,	%g7
	st	%f18,	[%l7 + 0x14]
	sir	0x10F0
	movpos	%icc,	%o7,	%o6
	movrgez	%l1,	%g3,	%o3
	move	%icc,	%l0,	%o4
	alignaddrl	%l5,	%i5,	%i7
	fcmpeq16	%f8,	%f0,	%g4
	ldd	[%l7 + 0x18],	%f6
	fpack16	%f24,	%f13
	nop
	set	0x09, %i7
	stb	%i2,	[%l7 + %i7]
	ldx	[%l7 + 0x20],	%l6
	movrgz	%o2,	%i0,	%o5
	fors	%f22,	%f22,	%f23
	movg	%xcc,	%l2,	%g6
	fmovrslez	%g1,	%f6,	%f9
	fcmple32	%f10,	%f24,	%g2
	movrlez	%g5,	%i3,	%l3
	umul	%l4,	0x156B,	%o1
	array32	%i4,	%o0,	%i6
	addccc	%i1,	%g7,	%o6
	xnorcc	%o7,	0x1DF1,	%g3
	movne	%xcc,	%o3,	%l1
	ldsh	[%l7 + 0x76],	%l0
	fmovsleu	%icc,	%f24,	%f28
	movre	%l5,	0x1E7,	%o4
	st	%f2,	[%l7 + 0x14]
	udivx	%i7,	0x1E9F,	%g4
	sllx	%i5,	0x02,	%i2
	subcc	%o2,	0x0A56,	%i0
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	edge32l	%o5,	%g6,	%g1
	fmovrsne	%g2,	%f31,	%f1
	xor	%g5,	0x0B7A,	%l3
	sub	%l4,	%o1,	%i4
	ldx	[%l7 + 0x48],	%o0
	edge16l	%i6,	%i1,	%i3
	fmovsgu	%icc,	%f24,	%f24
	andn	%g7,	%o7,	%g3
	fpsub16s	%f25,	%f28,	%f2
	movl	%xcc,	%o6,	%l1
	fandnot2s	%f19,	%f22,	%f24
	fmovdn	%icc,	%f25,	%f11
	fmovsle	%xcc,	%f8,	%f31
	array16	%o3,	%l5,	%l0
	srl	%i7,	0x00,	%o4
	movleu	%icc,	%g4,	%i2
	movg	%icc,	%i5,	%o2
	edge32l	%i0,	%l6,	%l2
	stw	%g6,	[%l7 + 0x7C]
	fnand	%f2,	%f28,	%f0
	fxor	%f22,	%f12,	%f6
	fmovsa	%xcc,	%f23,	%f31
	st	%f5,	[%l7 + 0x4C]
	fmovrdgez	%g1,	%f14,	%f14
	nop
	set	0x78, %l4
	std	%f18,	[%l7 + %l4]
	and	%o5,	%g5,	%l3
	fexpand	%f0,	%f10
	fpadd32s	%f12,	%f27,	%f18
	fmovsneg	%xcc,	%f22,	%f1
	ldd	[%l7 + 0x10],	%g2
	fmovsn	%icc,	%f8,	%f10
	ldd	[%l7 + 0x10],	%f4
	movneg	%xcc,	%l4,	%o1
	ldd	[%l7 + 0x30],	%f10
	orn	%o0,	%i6,	%i4
	fmovrdlz	%i3,	%f0,	%f14
	stx	%i1,	[%l7 + 0x50]
	fmovrdgz	%o7,	%f10,	%f4
	subccc	%g3,	0x0BE1,	%g7
	movrlz	%o6,	0x068,	%l1
	edge32l	%o3,	%l5,	%l0
	movne	%xcc,	%o4,	%i7
	fmovdgu	%xcc,	%f20,	%f20
	std	%f0,	[%l7 + 0x48]
	orncc	%i2,	0x11FC,	%i5
	sdiv	%o2,	0x0DF7,	%i0
	xnorcc	%g4,	%l2,	%l6
	udivx	%g1,	0x140D,	%o5
	umulcc	%g6,	0x0421,	%l3
	fnand	%f16,	%f22,	%f24
	movleu	%icc,	%g5,	%g2
	fmovdpos	%xcc,	%f8,	%f23
	move	%xcc,	%l4,	%o1
	sllx	%i6,	%i4,	%o0
	fnands	%f22,	%f3,	%f18
	mulscc	%i1,	0x059F,	%i3
	fcmps	%fcc2,	%f9,	%f8
	st	%f15,	[%l7 + 0x54]
	sir	0x1DFF
	fmovspos	%icc,	%f18,	%f10
	edge32	%o7,	%g3,	%o6
	fors	%f2,	%f21,	%f14
	fornot1	%f2,	%f6,	%f30
	sdiv	%l1,	0x1B10,	%g7
	sethi	0x1098,	%l5
	sdiv	%o3,	0x1560,	%l0
	alignaddrl	%i7,	%i2,	%i5
	fmovde	%icc,	%f26,	%f0
	movrne	%o4,	%i0,	%g4
	movrne	%o2,	0x37B,	%l2
	umul	%l6,	0x0460,	%o5
	fornot1s	%f26,	%f19,	%f17
	fmovda	%xcc,	%f19,	%f2
	array8	%g1,	%l3,	%g5
	smulcc	%g2,	%g6,	%l4
	edge16l	%o1,	%i6,	%i4
	fnor	%f12,	%f4,	%f8
	fzeros	%f25
	fsrc1	%f30,	%f30
	srax	%i1,	%i3,	%o7
	array8	%g3,	%o6,	%l1
	fcmpgt32	%f12,	%f10,	%g7
	edge32n	%l5,	%o0,	%o3
	fzeros	%f27
	edge8ln	%i7,	%l0,	%i5
	stx	%i2,	[%l7 + 0x08]
	lduh	[%l7 + 0x28],	%o4
	edge8ln	%g4,	%o2,	%i0
	edge32ln	%l6,	%l2,	%g1
	umulcc	%l3,	%g5,	%o5
	udivx	%g6,	0x1C40,	%l4
	fmovsa	%xcc,	%f0,	%f11
	std	%f16,	[%l7 + 0x70]
	fsrc1	%f22,	%f20
	srlx	%g2,	%i6,	%o1
	addccc	%i1,	0x1EF6,	%i3
	fexpand	%f28,	%f30
	nop
	set	0x38, %o1
	ldub	[%l7 + %o1],	%o7
	movre	%i4,	%o6,	%l1
	movrgez	%g3,	%g7,	%o0
	movpos	%xcc,	%o3,	%l5
	fmovdvc	%xcc,	%f28,	%f6
	movneg	%xcc,	%l0,	%i7
	orcc	%i5,	0x0EE5,	%i2
	sllx	%o4,	%o2,	%g4
	xnor	%i0,	%l2,	%l6
	ldd	[%l7 + 0x28],	%f30
	edge8n	%g1,	%g5,	%l3
	movcc	%icc,	%o5,	%l4
	edge8n	%g2,	%g6,	%o1
	array16	%i1,	%i3,	%i6
	mova	%icc,	%i4,	%o6
	sethi	0x1991,	%o7
	sra	%l1,	%g7,	%g3
	fxors	%f28,	%f2,	%f30
	fands	%f25,	%f23,	%f26
	movge	%icc,	%o0,	%l5
	ldd	[%l7 + 0x60],	%f14
	andcc	%l0,	0x1C06,	%o3
	stw	%i7,	[%l7 + 0x5C]
	fcmpeq32	%f14,	%f6,	%i5
	sdivx	%o4,	0x0ACB,	%i2
	movrne	%o2,	0x200,	%i0
	ldub	[%l7 + 0x24],	%g4
	addcc	%l2,	0x0820,	%g1
	move	%xcc,	%g5,	%l6
	movrne	%l3,	0x3B5,	%o5
	ldx	[%l7 + 0x68],	%l4
	movre	%g6,	0x395,	%o1
	movgu	%xcc,	%g2,	%i1
	fmovsg	%icc,	%f8,	%f30
	udivcc	%i6,	0x1D8E,	%i4
	fmul8x16au	%f25,	%f25,	%f22
	fnegd	%f14,	%f24
	movrne	%i3,	%o6,	%l1
	st	%f21,	[%l7 + 0x28]
	sdivcc	%g7,	0x01CE,	%g3
	edge16ln	%o7,	%o0,	%l0
	andncc	%l5,	%i7,	%i5
	fandnot2	%f8,	%f10,	%f4
	stx	%o3,	[%l7 + 0x08]
	edge8ln	%i2,	%o2,	%i0
	fmovsgu	%xcc,	%f4,	%f1
	sir	0x0847
	addcc	%g4,	%l2,	%o4
	array8	%g5,	%g1,	%l6
	fxors	%f15,	%f11,	%f20
	restore %l3, %l4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o1,	0x18D8,	%g2
	ldd	[%l7 + 0x68],	%f0
	movg	%icc,	%i1,	%g6
	fsrc2s	%f23,	%f25
	edge16n	%i4,	%i6,	%i3
	movgu	%icc,	%l1,	%g7
	movrgez	%o6,	0x374,	%o7
	save %g3, %l0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i7,	0x0B6F,	%o0
	movre	%o3,	0x12C,	%i5
	ldd	[%l7 + 0x10],	%f0
	fmovdle	%xcc,	%f22,	%f10
	movrne	%o2,	0x3BA,	%i0
	smul	%i2,	%l2,	%g4
	sll	%g5,	%g1,	%o4
	movle	%xcc,	%l6,	%l4
	mova	%icc,	%l3,	%o1
	sra	%o5,	0x1B,	%i1
	movge	%icc,	%g6,	%i4
	stb	%g2,	[%l7 + 0x0D]
	andncc	%i3,	%i6,	%g7
	array8	%l1,	%o7,	%g3
	fmovdcc	%xcc,	%f18,	%f21
	edge8l	%o6,	%l5,	%i7
	movrgz	%l0,	0x2D2,	%o3
	fmul8x16al	%f11,	%f14,	%f28
	stb	%o0,	[%l7 + 0x7A]
	ldd	[%l7 + 0x70],	%f20
	movleu	%xcc,	%o2,	%i5
	and	%i0,	%l2,	%g4
	addc	%i2,	%g1,	%g5
	orcc	%o4,	0x0957,	%l4
	subcc	%l6,	%o1,	%l3
	movpos	%icc,	%i1,	%g6
	movvc	%xcc,	%i4,	%o5
	sub	%i3,	%g2,	%g7
	alignaddr	%l1,	%o7,	%g3
	save %o6, %i6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i7,	%o3,	%l0
	ldd	[%l7 + 0x20],	%o2
	srlx	%i5,	%i0,	%o0
	nop
	set	0x50, %l3
	std	%f16,	[%l7 + %l3]
	edge16ln	%g4,	%i2,	%g1
	array8	%g5,	%o4,	%l4
	sdiv	%l6,	0x18CD,	%o1
	edge16n	%l3,	%l2,	%g6
	alignaddr	%i1,	%i4,	%i3
	movrgez	%o5,	%g2,	%g7
	sll	%o7,	0x18,	%g3
	movrgz	%l1,	%i6,	%o6
	for	%f28,	%f10,	%f4
	fxor	%f26,	%f6,	%f24
	movpos	%icc,	%i7,	%l5
	fmovsvc	%xcc,	%f12,	%f3
	movcs	%icc,	%l0,	%o2
	smul	%o3,	%i0,	%i5
	subccc	%g4,	%i2,	%g1
	sdiv	%o0,	0x0AE5,	%o4
	movrgez	%l4,	%l6,	%g5
	movg	%icc,	%l3,	%l2
	movleu	%icc,	%g6,	%o1
	orn	%i1,	%i3,	%o5
	edge8	%i4,	%g2,	%o7
	fandnot1	%f30,	%f10,	%f12
	orcc	%g3,	0x153D,	%l1
	udiv	%i6,	0x1FD7,	%o6
	fxnors	%f15,	%f15,	%f29
	fpadd16	%f6,	%f20,	%f28
	subc	%g7,	%l5,	%l0
	ldx	[%l7 + 0x70],	%o2
	std	%f28,	[%l7 + 0x78]
	fmovdg	%icc,	%f13,	%f15
	add	%i7,	%o3,	%i5
	fandnot2s	%f11,	%f10,	%f22
	fmul8ulx16	%f16,	%f0,	%f12
	fmovdvc	%xcc,	%f6,	%f9
	xnorcc	%i0,	%g4,	%i2
	movg	%icc,	%g1,	%o4
	add	%o0,	%l4,	%g5
	addc	%l6,	0x1904,	%l3
	fmovdge	%xcc,	%f1,	%f13
	edge32ln	%l2,	%o1,	%i1
	movn	%xcc,	%i3,	%g6
	fmovrsgz	%o5,	%f15,	%f29
	edge32	%i4,	%g2,	%g3
	ldx	[%l7 + 0x10],	%l1
	ldub	[%l7 + 0x26],	%o7
	fnot1	%f14,	%f0
	ldsb	[%l7 + 0x3B],	%i6
	movcc	%xcc,	%g7,	%o6
	fandnot2s	%f22,	%f6,	%f11
	smul	%l0,	0x05E5,	%l5
	movrgez	%o2,	0x337,	%o3
	stb	%i7,	[%l7 + 0x2B]
	movle	%xcc,	%i0,	%i5
	add	%g4,	%g1,	%i2
	sll	%o0,	%l4,	%o4
	edge32	%l6,	%g5,	%l2
	fpsub32	%f0,	%f2,	%f28
	udiv	%o1,	0x1953,	%l3
	orn	%i1,	0x0E0D,	%i3
	mova	%xcc,	%g6,	%i4
	movgu	%xcc,	%g2,	%g3
	umul	%l1,	%o7,	%i6
	fmovrsgz	%g7,	%f18,	%f24
	movcc	%xcc,	%o6,	%l0
	sdivx	%o5,	0x0604,	%o2
	addccc	%o3,	%l5,	%i0
	alignaddr	%i7,	%g4,	%g1
	movge	%icc,	%i5,	%o0
	movcc	%xcc,	%i2,	%l4
	stb	%o4,	[%l7 + 0x43]
	addccc	%g5,	%l6,	%o1
	fsrc2s	%f4,	%f27
	ldsw	[%l7 + 0x6C],	%l2
	save %i1, 0x00EA, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i3,	0x0E,	%i4
	fpsub32s	%f31,	%f27,	%f0
	subccc	%g2,	%g3,	%l1
	fmul8x16au	%f21,	%f7,	%f26
	ld	[%l7 + 0x68],	%f0
	udivx	%g6,	0x12C1,	%i6
	movge	%icc,	%o7,	%g7
	fmovdpos	%icc,	%f25,	%f6
	fcmpgt16	%f20,	%f0,	%o6
	movcc	%xcc,	%o5,	%o2
	move	%icc,	%l0,	%l5
	save %o3, 0x0845, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g4,	%g1,	%i5
	movrne	%i7,	0x018,	%o0
	movrgz	%l4,	0x0A6,	%i2
	fpsub16s	%f29,	%f12,	%f20
	ldx	[%l7 + 0x60],	%g5
	edge8	%l6,	%o1,	%o4
	ldsb	[%l7 + 0x3C],	%i1
	st	%f7,	[%l7 + 0x68]
	udivcc	%l2,	0x01AE,	%i3
	sdivx	%l3,	0x0574,	%i4
	fpadd16	%f8,	%f14,	%f22
	move	%xcc,	%g2,	%g3
	alignaddrl	%g6,	%l1,	%o7
	smulcc	%i6,	0x155D,	%g7
	popc	0x0197,	%o6
	add	%o2,	%l0,	%l5
	srlx	%o5,	0x11,	%i0
	orcc	%g4,	0x0443,	%o3
	ldsh	[%l7 + 0x2C],	%g1
	movn	%xcc,	%i7,	%i5
	sir	0x1EA3
	sth	%l4,	[%l7 + 0x7A]
	fxnors	%f15,	%f6,	%f23
	subc	%i2,	%o0,	%l6
	andncc	%g5,	%o1,	%o4
	sth	%i1,	[%l7 + 0x6E]
	fmuld8sux16	%f29,	%f30,	%f30
	fpack16	%f16,	%f21
	edge8ln	%l2,	%i3,	%i4
	edge16l	%l3,	%g3,	%g6
	movl	%icc,	%l1,	%o7
	edge16n	%g2,	%i6,	%g7
	ldd	[%l7 + 0x20],	%f16
	andncc	%o6,	%o2,	%l0
	move	%icc,	%l5,	%i0
	nop
	set	0x63, %l5
	ldsb	[%l7 + %l5],	%o5
	ldd	[%l7 + 0x10],	%g4
	edge16l	%o3,	%g1,	%i5
	array32	%i7,	%i2,	%l4
	movcc	%icc,	%l6,	%g5
	array16	%o1,	%o4,	%i1
	addc	%l2,	0x09FF,	%i3
	fnand	%f18,	%f26,	%f4
	fnot1s	%f19,	%f4
	sub	%i4,	0x1543,	%o0
	udiv	%l3,	0x05C3,	%g6
	addcc	%l1,	0x1AFC,	%o7
	st	%f0,	[%l7 + 0x64]
	edge32n	%g2,	%i6,	%g7
	subc	%g3,	%o2,	%l0
	orcc	%l5,	0x17FE,	%i0
	movn	%xcc,	%o5,	%g4
	fmovs	%f14,	%f8
	movne	%xcc,	%o3,	%g1
	orn	%o6,	%i5,	%i7
	fmovse	%icc,	%f6,	%f25
	subcc	%l4,	%i2,	%g5
	movge	%xcc,	%l6,	%o4
	orncc	%i1,	0x0BF5,	%o1
	fnors	%f4,	%f2,	%f6
	movne	%xcc,	%l2,	%i4
	lduh	[%l7 + 0x52],	%o0
	fmovscs	%xcc,	%f1,	%f3
	save %l3, %i3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g6,	0x19C8,	%g2
	fcmpgt16	%f14,	%f10,	%i6
	sdivx	%o7,	0x1B82,	%g7
	array16	%o2,	%g3,	%l0
	ldd	[%l7 + 0x40],	%i0
	udivx	%o5,	0x11B3,	%g4
	edge16l	%l5,	%o3,	%g1
	fornot2s	%f3,	%f15,	%f19
	nop
	set	0x7F, %o7
	stb	%o6,	[%l7 + %o7]
	udivx	%i5,	0x163C,	%l4
	edge16	%i2,	%g5,	%i7
	st	%f13,	[%l7 + 0x58]
	alignaddr	%l6,	%i1,	%o4
	fmovse	%icc,	%f10,	%f19
	srlx	%o1,	%l2,	%o0
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	srl	%l1,	0x0B,	%l3
	ld	[%l7 + 0x44],	%f7
	ldsw	[%l7 + 0x4C],	%g6
	fpadd16s	%f8,	%f0,	%f12
	nop
	set	0x40, %o4
	stx	%g2,	[%l7 + %o4]
	fmovdn	%xcc,	%f15,	%f0
	edge16ln	%i6,	%o7,	%o2
	udivcc	%g7,	0x06A8,	%l0
	sll	%g3,	0x11,	%o5
	st	%f10,	[%l7 + 0x70]
	andn	%g4,	%i0,	%l5
	sdivx	%g1,	0x0E90,	%o3
	save %i5, 0x0A10, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o6,	%i2
	fabss	%f12,	%f11
	sir	0x0844
	movne	%xcc,	%i7,	%g5
	alignaddr	%i1,	%o4,	%l6
	popc	%o1,	%l2
	movrgz	%o0,	0x295,	%i3
	fmovse	%xcc,	%f5,	%f17
	edge16n	%i4,	%l1,	%l3
	andcc	%g2,	0x1925,	%g6
	fnot1s	%f22,	%f18
	fcmple16	%f18,	%f8,	%o7
	fmovsgu	%xcc,	%f25,	%f8
	sir	0x0782
	nop
	set	0x6A, %g4
	sth	%o2,	[%l7 + %g4]
	edge16	%i6,	%l0,	%g7
	nop
	set	0x78, %i5
	ldx	[%l7 + %i5],	%o5
	fornot2s	%f7,	%f23,	%f13
	movvs	%xcc,	%g4,	%i0
	movvs	%xcc,	%l5,	%g1
	fmovdg	%icc,	%f19,	%f29
	addc	%o3,	0x0234,	%g3
	fxnors	%f24,	%f29,	%f28
	fmul8ulx16	%f26,	%f28,	%f0
	movrlz	%i5,	0x2AB,	%o6
	movn	%xcc,	%l4,	%i2
	fones	%f21
	alignaddrl	%g5,	%i1,	%i7
	popc	0x0BDA,	%o4
	fpadd16	%f22,	%f8,	%f6
	movvs	%xcc,	%l6,	%o1
	subc	%o0,	0x030F,	%i3
	edge16	%i4,	%l2,	%l3
	umulcc	%l1,	%g2,	%o7
	alignaddrl	%g6,	%i6,	%l0
	movrne	%o2,	%o5,	%g7
	add	%g4,	%i0,	%g1
	fornot1	%f18,	%f0,	%f6
	sllx	%o3,	%g3,	%i5
	xorcc	%l5,	%l4,	%i2
	ldsw	[%l7 + 0x6C],	%o6
	andncc	%g5,	%i7,	%i1
	fandnot2s	%f5,	%f25,	%f0
	sll	%l6,	0x0B,	%o1
	fmovrslez	%o4,	%f30,	%f11
	sub	%o0,	%i3,	%i4
	edge32l	%l3,	%l2,	%g2
	ld	[%l7 + 0x78],	%f13
	fmovrdgz	%l1,	%f22,	%f14
	subc	%g6,	0x1D0D,	%o7
	edge32ln	%i6,	%o2,	%l0
	movneg	%icc,	%g7,	%o5
	ldub	[%l7 + 0x20],	%g4
	fcmpeq32	%f4,	%f8,	%i0
	ldsw	[%l7 + 0x7C],	%o3
	movrne	%g1,	%i5,	%g3
	subcc	%l4,	0x0DDE,	%l5
	edge8n	%i2,	%o6,	%g5
	movge	%icc,	%i1,	%i7
	andcc	%l6,	0x08FE,	%o4
	movle	%xcc,	%o0,	%i3
	array8	%o1,	%i4,	%l3
	xnor	%l2,	%l1,	%g6
	fmovsl	%icc,	%f5,	%f0
	subc	%g2,	%o7,	%i6
	st	%f0,	[%l7 + 0x50]
	lduh	[%l7 + 0x74],	%l0
	orcc	%o2,	0x03E9,	%g7
	smul	%o5,	%i0,	%o3
	udivcc	%g1,	0x0A2F,	%i5
	mova	%icc,	%g4,	%l4
	srl	%l5,	0x07,	%i2
	popc	0x06E3,	%g3
	movl	%xcc,	%o6,	%g5
	addc	%i1,	0x1B2F,	%l6
	mova	%xcc,	%i7,	%o0
	edge8	%o4,	%o1,	%i3
	movcs	%icc,	%i4,	%l2
	movne	%xcc,	%l1,	%l3
	fmul8x16au	%f27,	%f26,	%f10
	fcmpd	%fcc3,	%f14,	%f28
	nop
	set	0x40, %g3
	std	%f22,	[%l7 + %g3]
	edge8l	%g6,	%g2,	%o7
	addcc	%i6,	0x126F,	%l0
	fcmple32	%f20,	%f20,	%o2
	mulx	%g7,	%i0,	%o3
	ldd	[%l7 + 0x08],	%o4
	orn	%g1,	0x0972,	%i5
	subc	%g4,	%l5,	%i2
	fornot2s	%f30,	%f7,	%f28
	ldd	[%l7 + 0x10],	%f30
	edge8ln	%g3,	%o6,	%g5
	fnot2	%f26,	%f28
	orcc	%l4,	%l6,	%i1
	ldx	[%l7 + 0x48],	%o0
	move	%xcc,	%i7,	%o4
	movpos	%xcc,	%i3,	%o1
	stb	%i4,	[%l7 + 0x11]
	movvs	%xcc,	%l2,	%l1
	addc	%l3,	0x172F,	%g2
	andncc	%o7,	%i6,	%l0
	andn	%g6,	%o2,	%g7
	xnorcc	%o3,	%i0,	%o5
	movpos	%xcc,	%i5,	%g1
	fcmpne32	%f4,	%f28,	%g4
	movre	%l5,	%g3,	%i2
	mulx	%g5,	0x0127,	%l4
	std	%f26,	[%l7 + 0x78]
	restore %o6, 0x0A2A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l6,	%o0
	addccc	%o4,	%i7,	%i3
	array32	%i4,	%o1,	%l1
	sdivcc	%l2,	0x049F,	%l3
	subccc	%g2,	0x004F,	%i6
	orncc	%o7,	0x1334,	%g6
	fxors	%f21,	%f17,	%f16
	xnor	%o2,	0x02CE,	%g7
	fmuld8ulx16	%f20,	%f4,	%f12
	xorcc	%o3,	0x0938,	%l0
	ldx	[%l7 + 0x78],	%o5
	fcmpne32	%f20,	%f18,	%i5
	st	%f28,	[%l7 + 0x1C]
	mulscc	%i0,	%g1,	%l5
	movgu	%xcc,	%g3,	%g4
	movrgz	%g5,	%i2,	%l4
	xnor	%o6,	0x0643,	%i1
	array16	%l6,	%o0,	%i7
	edge8ln	%i3,	%i4,	%o1
	fsrc2s	%f15,	%f11
	fmovrde	%l1,	%f22,	%f28
	udivcc	%o4,	0x09F6,	%l2
	fpmerge	%f17,	%f26,	%f14
	udiv	%l3,	0x011E,	%i6
	sub	%o7,	%g6,	%o2
	ldd	[%l7 + 0x60],	%f20
	xorcc	%g2,	%o3,	%g7
	movl	%xcc,	%l0,	%o5
	movge	%icc,	%i5,	%i0
	udivcc	%g1,	0x12B1,	%l5
	srax	%g3,	%g4,	%g5
	orcc	%l4,	%o6,	%i1
	for	%f12,	%f22,	%f8
	alignaddrl	%l6,	%i2,	%o0
	ldx	[%l7 + 0x10],	%i3
	edge16ln	%i7,	%i4,	%o1
	ldd	[%l7 + 0x60],	%l0
	fmovdn	%icc,	%f24,	%f10
	edge16l	%l2,	%l3,	%i6
	fand	%f20,	%f2,	%f18
	fmovrdlez	%o7,	%f2,	%f20
	movne	%icc,	%g6,	%o4
	movcs	%xcc,	%g2,	%o3
	umulcc	%g7,	0x05C8,	%l0
	fmovrsgez	%o5,	%f6,	%f16
	addcc	%o2,	%i5,	%i0
	movge	%icc,	%g1,	%g3
	fmovdne	%icc,	%f3,	%f5
	fmovsneg	%icc,	%f18,	%f1
	sir	0x0759
	subc	%g4,	0x191D,	%l5
	alignaddr	%l4,	%g5,	%i1
	mulscc	%o6,	%l6,	%i2
	save %i3, %i7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o1,	%l1
	fnot2s	%f20,	%f25
	fmul8ulx16	%f4,	%f30,	%f6
	sllx	%l2,	%l3,	%i6
	movle	%xcc,	%o7,	%i4
	sllx	%o4,	0x1C,	%g2
	fmovdg	%icc,	%f28,	%f10
	edge32ln	%o3,	%g6,	%g7
	smulcc	%o5,	0x0456,	%l0
	edge16ln	%o2,	%i0,	%i5
	ldsb	[%l7 + 0x32],	%g1
	nop
	set	0x7E, %i3
	sth	%g3,	[%l7 + %i3]
	nop
	set	0x3C, %g5
	ldsh	[%l7 + %g5],	%g4
	fcmpne16	%f30,	%f14,	%l5
	sra	%g5,	%l4,	%o6
	fmovrslz	%l6,	%f17,	%f24
	sth	%i1,	[%l7 + 0x42]
	subc	%i3,	0x18AF,	%i7
	ldd	[%l7 + 0x70],	%o0
	alignaddrl	%o1,	%i2,	%l1
	orncc	%l3,	0x099C,	%i6
	movg	%xcc,	%l2,	%o7
	movpos	%icc,	%i4,	%g2
	movvs	%icc,	%o4,	%o3
	xor	%g7,	%o5,	%g6
	movre	%l0,	0x150,	%o2
	mulx	%i0,	0x004F,	%i5
	or	%g3,	%g1,	%l5
	movle	%icc,	%g5,	%g4
	edge8ln	%o6,	%l4,	%l6
	xor	%i1,	%i3,	%i7
	andncc	%o1,	%i2,	%l1
	fmovda	%xcc,	%f28,	%f19
	sdiv	%o0,	0x03D6,	%l3
	fxnor	%f12,	%f28,	%f30
	andncc	%l2,	%o7,	%i4
	movle	%icc,	%g2,	%i6
	movpos	%icc,	%o3,	%g7
	addccc	%o5,	0x1C98,	%o4
	lduh	[%l7 + 0x50],	%g6
	fpadd16	%f28,	%f28,	%f14
	fmovsa	%icc,	%f16,	%f13
	fmul8sux16	%f20,	%f6,	%f12
	addccc	%l0,	0x1404,	%i0
	stb	%o2,	[%l7 + 0x52]
	array32	%g3,	%g1,	%l5
	subccc	%i5,	0x197E,	%g4
	movne	%xcc,	%g5,	%l4
	fmovsg	%xcc,	%f30,	%f8
	fmovsg	%xcc,	%f24,	%f12
	fpadd16	%f14,	%f6,	%f26
	sir	0x0D13
	ldd	[%l7 + 0x68],	%f24
	fandnot2	%f22,	%f16,	%f26
	movvc	%icc,	%l6,	%o6
	std	%f28,	[%l7 + 0x08]
	edge8l	%i1,	%i3,	%o1
	xnorcc	%i2,	0x0B94,	%i7
	edge32l	%o0,	%l1,	%l3
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	sth	%o7,	[%l7 + 0x2E]
	fnot2	%f10,	%f30
	edge8ln	%i6,	%g2,	%g7
	edge16	%o3,	%o5,	%o4
	smul	%l0,	0x04C2,	%i0
	movcc	%xcc,	%o2,	%g6
	movneg	%xcc,	%g1,	%l5
	smulcc	%g3,	0x00B4,	%g4
	srax	%i5,	%g5,	%l4
	array32	%l6,	%o6,	%i1
	addccc	%o1,	0x00CC,	%i2
	fcmpne16	%f18,	%f8,	%i3
	udivcc	%o0,	0x0D5E,	%l1
	orncc	%i7,	0x0515,	%l2
	smul	%l3,	0x0FDF,	%i4
	movvs	%xcc,	%i6,	%g2
	ldx	[%l7 + 0x60],	%o7
	xnor	%g7,	%o5,	%o3
	xorcc	%l0,	%i0,	%o2
	edge8n	%o4,	%g6,	%l5
	edge8ln	%g1,	%g3,	%g4
	edge8n	%g5,	%i5,	%l6
	lduh	[%l7 + 0x16],	%l4
	movg	%icc,	%i1,	%o1
	mulscc	%o6,	%i3,	%i2
	subccc	%o0,	0x0138,	%l1
	andcc	%i7,	%l3,	%l2
	lduw	[%l7 + 0x18],	%i4
	fands	%f14,	%f21,	%f27
	fnand	%f20,	%f16,	%f8
	xnorcc	%g2,	0x1A75,	%o7
	or	%i6,	0x0C51,	%g7
	ldsb	[%l7 + 0x22],	%o5
	ld	[%l7 + 0x48],	%f1
	subccc	%l0,	%o3,	%o2
	edge16ln	%o4,	%i0,	%g6
	restore %l5, %g1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	movneg	%icc,	%l6,	%l4
	srax	%i1,	%o6,	%o1
	edge16n	%i3,	%i2,	%o0
	array16	%l1,	%i7,	%l3
	alignaddr	%l2,	%g2,	%o7
	stb	%i4,	[%l7 + 0x42]
	edge8	%i6,	%g7,	%l0
	sethi	0x140B,	%o5
	fmovdcs	%xcc,	%f22,	%f24
	movge	%icc,	%o2,	%o4
	srax	%i0,	%o3,	%g6
	edge8ln	%l5,	%g1,	%g4
	movpos	%icc,	%i5,	%g3
	fmovsl	%icc,	%f24,	%f24
	movcc	%xcc,	%g5,	%l4
	fabsd	%f30,	%f14
	popc	%l6,	%o6
	subc	%i1,	0x1E0C,	%o1
	fmovs	%f9,	%f30
	movrlez	%i2,	0x388,	%o0
	fpackfix	%f6,	%f31
	sra	%l1,	0x1F,	%i3
	orn	%l3,	%l2,	%g2
	addc	%o7,	0x11CB,	%i7
	fmovsge	%icc,	%f12,	%f13
	srl	%i4,	0x10,	%g7
	movrgez	%i6,	%l0,	%o5
	sllx	%o4,	0x1D,	%i0
	fxnor	%f26,	%f30,	%f16
	fmovdn	%icc,	%f5,	%f24
	fmul8x16al	%f17,	%f13,	%f20
	edge16l	%o2,	%g6,	%o3
	orn	%g1,	%g4,	%l5
	alignaddrl	%g3,	%i5,	%l4
	addcc	%g5,	%o6,	%i1
	edge32	%l6,	%i2,	%o0
	sll	%o1,	0x06,	%l1
	fmuld8ulx16	%f15,	%f20,	%f4
	edge16l	%i3,	%l3,	%l2
	fand	%f16,	%f4,	%f28
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%o6
	fmovsle	%icc,	%f8,	%f30
	lduw	[%l7 + 0x3C],	%g2
	smul	%i4,	0x19F5,	%g7
	fnors	%f28,	%f2,	%f14
	fcmpgt32	%f22,	%f16,	%i6
	udivcc	%l0,	0x1F47,	%i7
	addc	%o4,	%o5,	%i0
	edge16ln	%g6,	%o3,	%g1
	fmovrdgz	%g4,	%f20,	%f16
	nop
	set	0x44, %i2
	lduw	[%l7 + %i2],	%l5
	orn	%g3,	0x0D06,	%i5
	fmovd	%f12,	%f28
	movrgz	%o2,	%g5,	%l4
	fmovdge	%icc,	%f27,	%f0
	addcc	%o6,	%l6,	%i2
	st	%f9,	[%l7 + 0x74]
	movl	%icc,	%i1,	%o1
	edge8l	%o0,	%l1,	%i3
	ldd	[%l7 + 0x58],	%f28
	fpadd32	%f2,	%f18,	%f20
	lduh	[%l7 + 0x42],	%l3
	movrlez	%o7,	0x21B,	%g2
	sethi	0x00CE,	%i4
	movle	%icc,	%g7,	%i6
	addccc	%l2,	%i7,	%o4
	st	%f18,	[%l7 + 0x68]
	sdivcc	%o5,	0x18D5,	%i0
	xor	%g6,	0x13B9,	%l0
	stw	%o3,	[%l7 + 0x7C]
	fsrc2	%f0,	%f10
	fcmpd	%fcc0,	%f2,	%f26
	udivx	%g4,	0x0A9E,	%l5
	umul	%g3,	%i5,	%g1
	fexpand	%f13,	%f26
	fmul8sux16	%f26,	%f26,	%f26
	movrlz	%g5,	0x039,	%o2
	ldd	[%l7 + 0x38],	%f4
	edge8ln	%l4,	%l6,	%i2
	array16	%i1,	%o6,	%o1
	sll	%o0,	%l1,	%i3
	bshuffle	%f26,	%f8,	%f8
	movleu	%icc,	%l3,	%g2
	movcs	%icc,	%o7,	%g7
	save %i6, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o4,	0x02,	%i4
	array16	%o5,	%i0,	%l0
	sll	%g6,	0x16,	%g4
	edge32	%l5,	%g3,	%i5
	subc	%g1,	%o3,	%o2
	ldub	[%l7 + 0x35],	%g5
	andcc	%l6,	0x14E4,	%l4
	fexpand	%f24,	%f20
	edge8ln	%i1,	%i2,	%o1
	movpos	%icc,	%o6,	%l1
	edge32ln	%i3,	%o0,	%g2
	ld	[%l7 + 0x44],	%f1
	udiv	%l3,	0x0DA0,	%o7
	fmovdvs	%xcc,	%f12,	%f30
	stx	%g7,	[%l7 + 0x10]
	array8	%i6,	%i7,	%o4
	orcc	%i4,	0x1299,	%o5
	ldsw	[%l7 + 0x14],	%l2
	orn	%i0,	0x1442,	%g6
	udiv	%g4,	0x0810,	%l0
	orncc	%g3,	0x0497,	%i5
	bshuffle	%f16,	%f30,	%f18
	srl	%l5,	%o3,	%g1
	movrlz	%o2,	0x25F,	%l6
	fmovrslez	%g5,	%f1,	%f30
	array16	%i1,	%i2,	%o1
	addcc	%o6,	0x0CC0,	%l1
	movle	%icc,	%i3,	%o0
	mova	%xcc,	%l4,	%g2
	alignaddr	%l3,	%o7,	%g7
	array8	%i7,	%o4,	%i4
	xnorcc	%i6,	%l2,	%i0
	fnot1	%f28,	%f4
	xor	%g6,	0x086D,	%g4
	lduh	[%l7 + 0x58],	%l0
	udivcc	%o5,	0x08BA,	%i5
	sdivx	%g3,	0x12F2,	%o3
	fnot1	%f8,	%f2
	edge32	%l5,	%g1,	%l6
	edge8n	%o2,	%i1,	%g5
	fabsd	%f0,	%f0
	fmovdleu	%icc,	%f21,	%f5
	fands	%f23,	%f9,	%f25
	edge16n	%o1,	%o6,	%i2
	sdiv	%l1,	0x0AE6,	%o0
	fmovrsne	%i3,	%f1,	%f8
	udivx	%l4,	0x1B40,	%g2
	udivcc	%o7,	0x1CB2,	%g7
	movrlez	%i7,	%o4,	%i4
	fmovse	%icc,	%f5,	%f31
	srlx	%l3,	0x09,	%l2
	ldsb	[%l7 + 0x26],	%i0
	movne	%xcc,	%i6,	%g4
	or	%l0,	%g6,	%o5
	addc	%i5,	0x1961,	%g3
	sra	%o3,	%l5,	%l6
	movgu	%xcc,	%o2,	%g1
	movne	%xcc,	%i1,	%g5
	srlx	%o1,	0x15,	%i2
	array16	%o6,	%l1,	%i3
	movre	%o0,	0x2B5,	%l4
	mulx	%g2,	%g7,	%i7
	sra	%o4,	%o7,	%l3
	sth	%l2,	[%l7 + 0x0C]
	xor	%i0,	%i6,	%g4
	udivx	%i4,	0x0223,	%l0
	array32	%g6,	%o5,	%i5
	lduw	[%l7 + 0x68],	%g3
	umul	%o3,	0x1EA7,	%l5
	movcc	%icc,	%l6,	%o2
	udiv	%g1,	0x0DA6,	%g5
	sir	0x1CE5
	fmovrslez	%o1,	%f0,	%f16
	movcs	%xcc,	%i1,	%i2
	movg	%xcc,	%o6,	%i3
	orn	%l1,	0x0B49,	%o0
	fabsd	%f12,	%f30
	edge16	%l4,	%g2,	%i7
	andncc	%g7,	%o4,	%o7
	ldx	[%l7 + 0x40],	%l3
	edge8l	%i0,	%i6,	%g4
	sllx	%l2,	%i4,	%l0
	ldd	[%l7 + 0x20],	%f10
	edge16ln	%o5,	%g6,	%g3
	fnot2s	%f0,	%f27
	edge16	%i5,	%o3,	%l6
	fpack32	%f24,	%f0,	%f8
	lduh	[%l7 + 0x62],	%l5
	smul	%o2,	%g1,	%g5
	srlx	%o1,	%i1,	%i2
	srax	%i3,	%l1,	%o6
	fmovspos	%icc,	%f15,	%f31
	restore %l4, %g2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%g6
	smulcc	%o4,	%o7,	%l3
	fmovdge	%icc,	%f29,	%f23
	stw	%i7,	[%l7 + 0x08]
	fcmpgt16	%f24,	%f30,	%i0
	lduh	[%l7 + 0x68],	%g4
	movg	%icc,	%l2,	%i4
	fsrc1	%f18,	%f22
	fcmpd	%fcc1,	%f22,	%f24
	addc	%l0,	0x1185,	%i6
	umul	%g6,	%g3,	%o5
	sllx	%i5,	%o3,	%l5
	lduh	[%l7 + 0x56],	%o2
	ldsb	[%l7 + 0x2C],	%g1
	array16	%l6,	%o1,	%i1
	xorcc	%i2,	%g5,	%i3
	subc	%o6,	%l4,	%g2
	fmul8x16al	%f1,	%f4,	%f8
	fcmps	%fcc1,	%f29,	%f31
	mova	%icc,	%o0,	%l1
	xor	%g7,	%o4,	%o7
	fpack32	%f26,	%f14,	%f28
	subcc	%l3,	%i0,	%g4
	udiv	%l2,	0x0279,	%i7
	subc	%l0,	%i4,	%g6
	edge32l	%g3,	%o5,	%i5
	sllx	%i6,	%o3,	%l5
	fmovrdgez	%o2,	%f16,	%f10
	nop
	set	0x20, %g7
	ldd	[%l7 + %g7],	%g0
	fmovsvs	%icc,	%f0,	%f26
	fnors	%f31,	%f28,	%f4
	fmul8x16au	%f6,	%f0,	%f0
	addccc	%o1,	%l6,	%i2
	stb	%i1,	[%l7 + 0x11]
	fzeros	%f15
	edge32n	%g5,	%o6,	%l4
	udivcc	%i3,	0x09A0,	%o0
	edge16ln	%g2,	%g7,	%l1
	fpadd16s	%f16,	%f24,	%f31
	fnot1s	%f12,	%f10
	ld	[%l7 + 0x2C],	%f21
	xorcc	%o4,	%l3,	%o7
	sdivcc	%g4,	0x18F2,	%i0
	lduh	[%l7 + 0x2E],	%l2
	ldsh	[%l7 + 0x24],	%i7
	fnands	%f26,	%f23,	%f13
	movleu	%icc,	%i4,	%g6
	movne	%icc,	%g3,	%o5
	movcc	%xcc,	%l0,	%i6
	movcc	%xcc,	%o3,	%i5
	edge8ln	%l5,	%g1,	%o1
	or	%o2,	0x1769,	%l6
	sdivcc	%i2,	0x0D3D,	%g5
	ldd	[%l7 + 0x50],	%f4
	movcc	%xcc,	%o6,	%l4
	fors	%f29,	%f10,	%f21
	movneg	%xcc,	%i3,	%o0
	mulscc	%g2,	0x01C9,	%g7
	sll	%i1,	%l1,	%o4
	fmovdpos	%xcc,	%f4,	%f15
	addccc	%l3,	%o7,	%i0
	subc	%g4,	0x09E7,	%i7
	andcc	%i4,	%l2,	%g6
	ldsb	[%l7 + 0x43],	%g3
	lduh	[%l7 + 0x46],	%l0
	sdivcc	%i6,	0x1B93,	%o5
	ldd	[%l7 + 0x18],	%o2
	srax	%i5,	0x1D,	%g1
	fmuld8ulx16	%f3,	%f3,	%f26
	movrlez	%o1,	0x31C,	%o2
	ldd	[%l7 + 0x40],	%f20
	sdivcc	%l6,	0x1457,	%i2
	nop
	set	0x50, %g1
	ldub	[%l7 + %g1],	%l5
	movge	%xcc,	%g5,	%l4
	st	%f13,	[%l7 + 0x44]
	movg	%xcc,	%i3,	%o0
	st	%f12,	[%l7 + 0x3C]
	array32	%o6,	%g2,	%g7
	stb	%i1,	[%l7 + 0x5A]
	ldub	[%l7 + 0x78],	%l1
	orn	%o4,	%o7,	%i0
	movpos	%icc,	%l3,	%i7
	sir	0x0E46
	umulcc	%g4,	%l2,	%i4
	stw	%g6,	[%l7 + 0x0C]
	lduh	[%l7 + 0x48],	%g3
	udiv	%l0,	0x0D7D,	%o5
	movg	%xcc,	%i6,	%o3
	addccc	%g1,	0x0E39,	%o1
	alignaddr	%i5,	%l6,	%i2
	stb	%o2,	[%l7 + 0x6E]
	fcmpgt32	%f28,	%f0,	%g5
	sir	0x1FE8
	orncc	%l5,	0x118F,	%i3
	mulscc	%l4,	%o6,	%g2
	mulx	%o0,	0x0BC7,	%i1
	sethi	0x10FF,	%l1
	addcc	%g7,	%o4,	%i0
	addccc	%o7,	0x13D9,	%l3
	sdivcc	%i7,	0x14BE,	%g4
	fpadd32s	%f22,	%f27,	%f1
	umul	%i4,	0x1F41,	%g6
	fabsd	%f30,	%f30
	array32	%l2,	%l0,	%o5
	sth	%g3,	[%l7 + 0x30]
	sir	0x10AD
	umulcc	%o3,	%i6,	%g1
	fnot2s	%f16,	%f30
	bshuffle	%f28,	%f10,	%f16
	udivcc	%i5,	0x15E2,	%o1
	edge32	%i2,	%l6,	%g5
	mulx	%l5,	0x1B44,	%i3
	fmovdgu	%icc,	%f30,	%f6
	st	%f12,	[%l7 + 0x44]
	srlx	%o2,	%o6,	%l4
	save %g2, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g7,	0x1A1A,	%l1
	stx	%i0,	[%l7 + 0x78]
	fmovscc	%icc,	%f22,	%f13
	for	%f16,	%f10,	%f0
	sir	0x0109
	edge8ln	%o7,	%o4,	%i7
	addcc	%g4,	0x10B3,	%l3
	xor	%i4,	0x10A1,	%l2
	fnands	%f4,	%f25,	%f22
	umul	%l0,	0x1B1F,	%g6
	orncc	%o5,	0x1540,	%g3
	ldsh	[%l7 + 0x10],	%o3
	fnot1	%f28,	%f18
	movre	%i6,	%g1,	%i5
	edge32ln	%i2,	%l6,	%o1
	movrgz	%g5,	0x3C4,	%i3
	edge8	%l5,	%o6,	%o2
	udivx	%l4,	0x03F2,	%g2
	faligndata	%f12,	%f4,	%f18
	movrgz	%i1,	%o0,	%g7
	orn	%l1,	0x01DA,	%o7
	smul	%i0,	0x0068,	%i7
	fand	%f24,	%f20,	%f2
	fmovspos	%icc,	%f27,	%f8
	movleu	%xcc,	%o4,	%l3
	sdivx	%i4,	0x1B60,	%g4
	fzeros	%f26
	array32	%l0,	%l2,	%o5
	and	%g6,	0x09E0,	%g3
	fornot2s	%f11,	%f26,	%f22
	movcs	%icc,	%i6,	%o3
	std	%f24,	[%l7 + 0x10]
	array32	%g1,	%i5,	%l6
	movrlz	%o1,	%i2,	%i3
	udiv	%l5,	0x0B07,	%g5
	udivcc	%o2,	0x1C0D,	%l4
	andcc	%o6,	%g2,	%o0
	sra	%i1,	0x1E,	%l1
	movcc	%xcc,	%o7,	%g7
	array8	%i0,	%i7,	%o4
	fmovdpos	%icc,	%f27,	%f6
	udivx	%l3,	0x0DB0,	%i4
	orn	%g4,	%l0,	%l2
	ldd	[%l7 + 0x10],	%o4
	fpack16	%f0,	%f18
	edge8l	%g6,	%g3,	%i6
	movgu	%xcc,	%g1,	%o3
	ldd	[%l7 + 0x10],	%i4
	sdivx	%o1,	0x00BF,	%l6
	subc	%i3,	0x1729,	%l5
	edge32	%g5,	%o2,	%i2
	and	%o6,	0x1A2E,	%l4
	sethi	0x193A,	%g2
	edge32l	%o0,	%i1,	%o7
	fnegd	%f8,	%f0
	udiv	%g7,	0x1C40,	%l1
	srax	%i7,	0x10,	%o4
	fnot2s	%f5,	%f24
	andcc	%l3,	0x1C91,	%i0
	movge	%icc,	%g4,	%l0
	move	%xcc,	%i4,	%o5
	fornot1s	%f8,	%f7,	%f10
	lduw	[%l7 + 0x50],	%l2
	ldx	[%l7 + 0x30],	%g6
	stb	%i6,	[%l7 + 0x67]
	addcc	%g1,	%g3,	%o3
	subccc	%i5,	%o1,	%i3
	fandnot1s	%f28,	%f4,	%f4
	smulcc	%l6,	0x196B,	%g5
	addcc	%o2,	%i2,	%o6
	fcmple16	%f8,	%f20,	%l5
	xor	%l4,	0x1C25,	%g2
	edge32l	%i1,	%o7,	%g7
	movcc	%xcc,	%l1,	%i7
	std	%f30,	[%l7 + 0x40]
	edge16	%o4,	%o0,	%i0
	ldub	[%l7 + 0x6D],	%l3
	mulx	%g4,	%l0,	%o5
	ldub	[%l7 + 0x59],	%l2
	edge32l	%g6,	%i6,	%i4
	movrlz	%g1,	0x31A,	%o3
	fmul8x16	%f13,	%f22,	%f30
	edge8ln	%i5,	%o1,	%i3
	andcc	%l6,	%g3,	%o2
	smulcc	%i2,	0x14AB,	%g5
	edge32n	%l5,	%l4,	%g2
	mulscc	%o6,	0x040C,	%i1
	movvc	%xcc,	%g7,	%o7
	subcc	%l1,	0x0223,	%i7
	andn	%o0,	%o4,	%i0
	lduw	[%l7 + 0x78],	%g4
	edge16l	%l0,	%o5,	%l3
	fmovsn	%icc,	%f3,	%f5
	fone	%f16
	ldsb	[%l7 + 0x4D],	%g6
	edge16ln	%l2,	%i6,	%g1
	movre	%i4,	%o3,	%i5
	fornot1s	%f6,	%f19,	%f5
	fandnot2s	%f27,	%f8,	%f31
	subccc	%i3,	0x026C,	%o1
	edge32	%l6,	%o2,	%g3
	movgu	%icc,	%i2,	%l5
	movre	%l4,	%g5,	%g2
	fmovsge	%icc,	%f27,	%f14
	fnot1s	%f21,	%f8
	array32	%i1,	%o6,	%g7
	fpackfix	%f4,	%f3
	xor	%l1,	%i7,	%o7
	umulcc	%o0,	%o4,	%g4
	fmovdneg	%xcc,	%f18,	%f16
	andncc	%i0,	%o5,	%l0
	fabss	%f8,	%f25
	movre	%g6,	%l3,	%i6
	andn	%g1,	0x1999,	%l2
	andncc	%o3,	%i4,	%i3
	fpsub16s	%f14,	%f9,	%f19
	umul	%i5,	%o1,	%l6
	edge8n	%o2,	%i2,	%g3
	sdivx	%l4,	0x18E0,	%g5
	fmovrdlz	%g2,	%f12,	%f6
	sethi	0x1596,	%l5
	xor	%i1,	%o6,	%l1
	xnorcc	%i7,	%o7,	%g7
	lduw	[%l7 + 0x08],	%o0
	sth	%o4,	[%l7 + 0x16]
	ldx	[%l7 + 0x78],	%g4
	fpadd32s	%f17,	%f5,	%f21
	fmovsgu	%xcc,	%f12,	%f9
	smulcc	%i0,	0x0B94,	%l0
	or	%o5,	0x0378,	%l3
	sdivcc	%g6,	0x0BC1,	%g1
	xnor	%i6,	%l2,	%o3
	fmovse	%icc,	%f8,	%f21
	edge8n	%i3,	%i5,	%i4
	mova	%xcc,	%o1,	%o2
	udiv	%l6,	0x0715,	%g3
	edge16n	%l4,	%g5,	%i2
	edge16	%l5,	%g2,	%i1
	fmovsge	%xcc,	%f14,	%f11
	fmul8x16	%f9,	%f22,	%f22
	andn	%l1,	0x1ADA,	%o6
	xorcc	%o7,	%i7,	%g7
	fcmpne32	%f26,	%f12,	%o4
	addc	%g4,	0x0D5D,	%o0
	lduh	[%l7 + 0x56],	%l0
	ldx	[%l7 + 0x48],	%i0
	ldd	[%l7 + 0x20],	%l2
	srlx	%g6,	%o5,	%g1
	edge8n	%l2,	%o3,	%i6
	mulscc	%i5,	%i4,	%i3
	movrlez	%o1,	0x0E6,	%l6
	movge	%icc,	%g3,	%o2
	andn	%g5,	%l4,	%i2
	movcs	%icc,	%l5,	%i1
	fmovsne	%icc,	%f16,	%f12
	and	%g2,	0x092D,	%l1
	addc	%o7,	%o6,	%g7
	sdivcc	%o4,	0x1538,	%g4
	movl	%icc,	%o0,	%l0
	movle	%icc,	%i0,	%l3
	movn	%icc,	%g6,	%i7
	ldsb	[%l7 + 0x12],	%o5
	fmovdvs	%icc,	%f21,	%f19
	fmovrse	%l2,	%f30,	%f29
	edge32	%g1,	%i6,	%o3
	stw	%i5,	[%l7 + 0x10]
	fmovrsne	%i4,	%f15,	%f8
	smulcc	%i3,	%o1,	%l6
	edge32l	%g3,	%g5,	%l4
	movrgz	%i2,	0x2BD,	%o2
	or	%i1,	0x18F6,	%l5
	subc	%l1,	%g2,	%o6
	add	%o7,	0x00F6,	%g7
	movrlez	%o4,	0x379,	%o0
	sth	%l0,	[%l7 + 0x42]
	fnand	%f20,	%f12,	%f22
	addccc	%i0,	0x05AB,	%g4
	fmul8x16au	%f23,	%f2,	%f28
	add	%g6,	0x1E3F,	%i7
	subccc	%o5,	%l3,	%g1
	fxor	%f20,	%f16,	%f14
	stx	%i6,	[%l7 + 0x28]
	movle	%xcc,	%l2,	%o3
	ldub	[%l7 + 0x1E],	%i4
	fmovrse	%i3,	%f17,	%f16
	edge8l	%o1,	%l6,	%i5
	edge16n	%g3,	%l4,	%g5
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	udivx	%l1,	0x12B8,	%g2
	array8	%i1,	%o6,	%o7
	popc	%g7,	%o4
	alignaddrl	%l0,	%o0,	%i0
	movcs	%icc,	%g4,	%i7
	movcc	%xcc,	%g6,	%o5
	ldsh	[%l7 + 0x30],	%l3
	restore %g1, %i6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%o3,	%f0,	%f12
	addccc	%i4,	%i3,	%o1
	ldub	[%l7 + 0x61],	%i5
	movl	%xcc,	%l6,	%g3
	sth	%g5,	[%l7 + 0x3C]
	sdivx	%l4,	0x1F5A,	%o2
	fnand	%f10,	%f16,	%f28
	save %i2, 0x0C8C, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l1,	0x196D,	%i1
	movrgez	%g2,	%o7,	%o6
	fpadd16s	%f11,	%f29,	%f10
	addcc	%o4,	%g7,	%o0
	xnor	%i0,	0x0E9D,	%l0
	siam	0x5
	andcc	%i7,	%g6,	%g4
	xor	%l3,	%g1,	%i6
	addcc	%o5,	0x08F4,	%o3
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%l2
	ldsb	[%l7 + 0x3A],	%i3
	movpos	%icc,	%i4,	%o1
	smul	%l6,	0x1F7B,	%g3
	orn	%g5,	%l4,	%i5
	xorcc	%i2,	0x19AD,	%l5
	movn	%xcc,	%l1,	%o2
	ldsh	[%l7 + 0x1C],	%g2
	smulcc	%o7,	%o6,	%i1
	srl	%o4,	%o0,	%g7
	sra	%i0,	%l0,	%i7
	sethi	0x03B8,	%g4
	sethi	0x075F,	%l3
	stw	%g6,	[%l7 + 0x44]
	edge32n	%g1,	%i6,	%o5
	alignaddr	%o3,	%l2,	%i4
	for	%f28,	%f4,	%f18
	mulscc	%i3,	0x1A12,	%o1
	srl	%l6,	0x1F,	%g5
	save %g3, %i5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i2,	%l5
	fandnot1s	%f26,	%f14,	%f20
	fmovsg	%xcc,	%f29,	%f9
	stw	%o2,	[%l7 + 0x44]
	lduw	[%l7 + 0x08],	%l1
	movneg	%xcc,	%g2,	%o6
	fmovdneg	%icc,	%f30,	%f16
	array32	%o7,	%o4,	%o0
	lduw	[%l7 + 0x2C],	%i1
	edge16ln	%g7,	%i0,	%i7
	array16	%g4,	%l0,	%l3
	fmul8ulx16	%f4,	%f20,	%f2
	addcc	%g6,	0x1FF0,	%g1
	srl	%i6,	%o5,	%l2
	subcc	%o3,	0x0C27,	%i4
	addcc	%o1,	0x0916,	%i3
	ldd	[%l7 + 0x58],	%i6
	ldsw	[%l7 + 0x30],	%g5
	smulcc	%i5,	%g3,	%l4
	edge32n	%i2,	%o2,	%l1
	fmovrsgez	%l5,	%f30,	%f31
	mulx	%g2,	%o7,	%o6
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	andncc	%i1,	%g7,	%i7
	array8	%g4,	%i0,	%l0
	orn	%g6,	%g1,	%i6
	sll	%l3,	%l2,	%o3
	fnand	%f30,	%f12,	%f16
	st	%f11,	[%l7 + 0x6C]
	stx	%o5,	[%l7 + 0x08]
	subccc	%o1,	%i3,	%i4
	addccc	%g5,	0x0B8E,	%i5
	restore %g3, %l6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o2,	%l1,	%l5
	array8	%g2,	%l4,	%o7
	save %o4, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o6,	%i7
	array16	%g4,	%g7,	%i0
	fpadd32s	%f12,	%f29,	%f0
	orcc	%l0,	0x1CF0,	%g6
	fsrc1	%f4,	%f22
	fors	%f16,	%f8,	%f14
	movrlz	%i6,	0x337,	%l3
	alignaddrl	%g1,	%o3,	%o5
	ldsb	[%l7 + 0x5F],	%l2
	edge32n	%o1,	%i3,	%g5
	ldd	[%l7 + 0x18],	%f10
	movpos	%icc,	%i4,	%g3
	ldub	[%l7 + 0x36],	%l6
	subcc	%i5,	%i2,	%o2
	addc	%l1,	0x12C4,	%l5
	edge32l	%l4,	%g2,	%o4
	fxors	%f8,	%f13,	%f26
	stx	%o0,	[%l7 + 0x08]
	fmul8x16	%f15,	%f8,	%f26
	fmovde	%xcc,	%f4,	%f24
	movrgz	%i1,	0x05F,	%o7
	movrne	%o6,	%g4,	%g7
	mova	%xcc,	%i7,	%l0
	popc	%g6,	%i6
	edge32n	%l3,	%g1,	%i0
	movne	%icc,	%o3,	%l2
	fpmerge	%f30,	%f0,	%f4
	movrne	%o1,	%i3,	%o5
	move	%icc,	%g5,	%i4
	pdist	%f28,	%f26,	%f4
	fmovrdgz	%l6,	%f24,	%f2
	fpadd32	%f12,	%f28,	%f26
	fmovsgu	%icc,	%f12,	%f19
	edge16	%i5,	%g3,	%o2
	fabsd	%f22,	%f12
	fpadd16s	%f17,	%f26,	%f13
	udivcc	%i2,	0x1E9A,	%l5
	srlx	%l4,	0x08,	%g2
	movl	%xcc,	%o4,	%l1
	edge16	%o0,	%i1,	%o7
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movne	%icc,	%o6,	%i7
	nop
	set	0x19, %o2
	ldsb	[%l7 + %o2],	%l0
	xnorcc	%i6,	0x1971,	%l3
	xorcc	%g1,	0x075B,	%g6
	orncc	%o3,	0x0347,	%i0
	fmovrsgz	%o1,	%f25,	%f28
	std	%f12,	[%l7 + 0x20]
	sdivcc	%i3,	0x1F5C,	%o5
	fand	%f12,	%f6,	%f8
	fornot1	%f10,	%f8,	%f2
	ldub	[%l7 + 0x1A],	%g5
	fnot2s	%f8,	%f25
	array16	%l2,	%l6,	%i5
	lduw	[%l7 + 0x14],	%g3
	fmovde	%xcc,	%f5,	%f3
	fmovs	%f6,	%f21
	sdivx	%o2,	0x1083,	%i4
	fmovdcs	%icc,	%f2,	%f0
	fmovrslz	%l5,	%f13,	%f12
	ld	[%l7 + 0x7C],	%f21
	popc	%i2,	%l4
	nop
	set	0x70, %i0
	stw	%o4,	[%l7 + %i0]
	fpsub32s	%f10,	%f2,	%f27
	move	%xcc,	%l1,	%o0
	array16	%i1,	%o7,	%g2
	fmovsa	%xcc,	%f15,	%f14
	udivx	%g4,	0x0FCE,	%o6
	sll	%i7,	%l0,	%i6
	addccc	%l3,	0x0A4A,	%g7
	mova	%xcc,	%g6,	%g1
	ldx	[%l7 + 0x08],	%i0
	edge8ln	%o1,	%i3,	%o3
	fmovspos	%icc,	%f26,	%f0
	movvs	%icc,	%g5,	%o5
	nop
	set	0x58, %i4
	sth	%l6,	[%l7 + %i4]
	fcmpeq16	%f28,	%f4,	%l2
	fpsub32	%f12,	%f20,	%f4
	fmovdneg	%icc,	%f6,	%f14
	and	%g3,	%i5,	%o2
	edge8ln	%l5,	%i4,	%l4
	movcc	%icc,	%i2,	%o4
	edge16	%o0,	%l1,	%o7
	ldsh	[%l7 + 0x32],	%i1
	edge32ln	%g4,	%g2,	%i7
	sdivx	%o6,	0x152C,	%l0
	smul	%i6,	0x0881,	%g7
	subcc	%l3,	%g1,	%g6
	movne	%icc,	%i0,	%o1
	ld	[%l7 + 0x58],	%f13
	udiv	%o3,	0x1CEF,	%g5
	fandnot2s	%f4,	%f29,	%f24
	ldsh	[%l7 + 0x58],	%i3
	sra	%o5,	0x07,	%l6
	umulcc	%l2,	%g3,	%i5
	movvc	%xcc,	%l5,	%i4
	stb	%l4,	[%l7 + 0x32]
	movrlez	%i2,	%o2,	%o4
	sir	0x0CE8
	sir	0x1AC4
	stx	%o0,	[%l7 + 0x68]
	orn	%o7,	0x14E6,	%l1
	movre	%i1,	0x1C7,	%g4
	alignaddr	%g2,	%i7,	%l0
	movrlez	%o6,	0x02D,	%i6
	subccc	%g7,	%g1,	%l3
	fmovs	%f2,	%f29
	movrlz	%i0,	%g6,	%o1
	edge8	%o3,	%i3,	%o5
	alignaddrl	%l6,	%l2,	%g3
	fmovspos	%icc,	%f16,	%f14
	add	%i5,	0x1359,	%g5
	edge16	%l5,	%l4,	%i2
	array8	%i4,	%o4,	%o0
	movcc	%xcc,	%o2,	%o7
	subc	%i1,	%g4,	%g2
	edge32ln	%l1,	%i7,	%o6
	fmul8x16al	%f19,	%f14,	%f26
	fnegs	%f18,	%f0
	edge16	%l0,	%g7,	%i6
	array8	%l3,	%g1,	%g6
	edge8l	%o1,	%i0,	%o3
	ldd	[%l7 + 0x10],	%i2
	movg	%xcc,	%l6,	%l2
	movle	%xcc,	%g3,	%i5
	array8	%o5,	%g5,	%l4
	fmovdcs	%icc,	%f28,	%f22
	edge32l	%i2,	%i4,	%o4
	ldd	[%l7 + 0x08],	%f18
	addccc	%o0,	%o2,	%o7
	edge16	%i1,	%g4,	%g2
	fmovsneg	%icc,	%f18,	%f21
	movne	%icc,	%l5,	%i7
	movne	%xcc,	%o6,	%l0
	movrgz	%g7,	%l1,	%i6
	fmovrdlz	%l3,	%f12,	%f4
	fandnot2s	%f0,	%f19,	%f24
	st	%f26,	[%l7 + 0x40]
	fnot1	%f14,	%f18
	movrne	%g6,	0x3ED,	%g1
	fmuld8ulx16	%f17,	%f24,	%f22
	subc	%o1,	0x1028,	%o3
	edge16l	%i3,	%l6,	%i0
	movvc	%icc,	%l2,	%g3
	add	%i5,	%o5,	%g5
	sth	%l4,	[%l7 + 0x14]
	edge8ln	%i2,	%i4,	%o0
	udivcc	%o2,	0x06E4,	%o4
	fmovrsne	%o7,	%f2,	%f7
	sdivx	%i1,	0x139A,	%g4
	faligndata	%f30,	%f26,	%f12
	ldd	[%l7 + 0x38],	%l4
	stx	%g2,	[%l7 + 0x20]
	addccc	%o6,	0x0DB7,	%l0
	movne	%xcc,	%g7,	%l1
	edge8ln	%i6,	%i7,	%l3
	umul	%g6,	0x0F2B,	%o1
	ldsb	[%l7 + 0x43],	%g1
	sllx	%i3,	%o3,	%i0
	ldsh	[%l7 + 0x66],	%l6
	edge8n	%g3,	%i5,	%o5
	fand	%f30,	%f0,	%f20
	ldx	[%l7 + 0x20],	%l2
	ldd	[%l7 + 0x48],	%g4
	ldub	[%l7 + 0x4B],	%i2
	movn	%icc,	%i4,	%l4
	lduw	[%l7 + 0x40],	%o0
	lduw	[%l7 + 0x60],	%o4
	orn	%o7,	0x158A,	%o2
	fmovrsne	%i1,	%f4,	%f24
	subc	%g4,	0x05A4,	%g2
	sll	%o6,	%l0,	%l5
	sdivcc	%l1,	0x088A,	%g7
	movrlez	%i6,	0x21A,	%l3
	movpos	%xcc,	%i7,	%g6
	sll	%o1,	0x0C,	%i3
	addc	%o3,	%i0,	%l6
	st	%f27,	[%l7 + 0x3C]
	srax	%g3,	0x0C,	%i5
	lduw	[%l7 + 0x70],	%g1
	lduh	[%l7 + 0x58],	%l2
	array32	%g5,	%o5,	%i4
	ldsw	[%l7 + 0x60],	%l4
	subc	%i2,	0x0291,	%o4
	edge32	%o7,	%o0,	%i1
	siam	0x4
	movre	%g4,	0x12A,	%g2
	movneg	%icc,	%o6,	%o2
	edge16	%l5,	%l1,	%g7
	xnorcc	%l0,	0x1DC8,	%i6
	fcmple32	%f10,	%f14,	%i7
	fcmple16	%f16,	%f20,	%g6
	movrgz	%o1,	%l3,	%o3
	sdiv	%i0,	0x199A,	%i3
	fmuld8sux16	%f30,	%f7,	%f10
	movle	%xcc,	%l6,	%i5
	sub	%g3,	0x1399,	%g1
	sub	%l2,	%o5,	%i4
	mova	%xcc,	%l4,	%i2
	movge	%xcc,	%g5,	%o4
	fxors	%f28,	%f4,	%f14
	movrne	%o0,	%o7,	%i1
	stw	%g4,	[%l7 + 0x1C]
	movrlez	%o6,	%o2,	%l5
	edge16n	%g2,	%l1,	%l0
	fmovd	%f30,	%f30
	sll	%g7,	0x04,	%i7
	ldub	[%l7 + 0x5D],	%i6
	mova	%xcc,	%o1,	%g6
	subccc	%l3,	0x18EA,	%o3
	sra	%i3,	%i0,	%i5
	array32	%g3,	%l6,	%l2
	umulcc	%o5,	0x0751,	%g1
	addccc	%l4,	0x0E19,	%i2
	popc	0x1E21,	%i4
	movvc	%icc,	%g5,	%o0
	fxor	%f22,	%f8,	%f30
	edge8l	%o7,	%i1,	%g4
	edge8l	%o6,	%o4,	%o2
	fmuld8ulx16	%f23,	%f29,	%f10
	fabss	%f8,	%f4
	movpos	%xcc,	%l5,	%l1
	movg	%icc,	%l0,	%g7
	smulcc	%g2,	0x00EE,	%i7
	edge32	%o1,	%i6,	%l3
	fpadd32s	%f23,	%f0,	%f7
	fmovsn	%icc,	%f27,	%f7
	movrne	%o3,	0x1AE,	%g6
	lduh	[%l7 + 0x36],	%i3
	movge	%xcc,	%i0,	%g3
	edge16n	%l6,	%i5,	%o5
	orncc	%g1,	%l4,	%i2
	sethi	0x0085,	%i4
	addccc	%l2,	%g5,	%o7
	fxor	%f10,	%f30,	%f2
	movle	%icc,	%i1,	%o0
	stx	%o6,	[%l7 + 0x40]
	udivx	%g4,	0x05F5,	%o4
	fmovsge	%icc,	%f27,	%f3
	fmuld8ulx16	%f29,	%f26,	%f28
	movneg	%icc,	%l5,	%o2
	sir	0x0B9F
	udiv	%l1,	0x0652,	%g7
	ldx	[%l7 + 0x50],	%l0
	edge16	%i7,	%o1,	%i6
	xorcc	%g2,	%l3,	%o3
	movgu	%icc,	%g6,	%i0
	edge32	%i3,	%g3,	%i5
	movvc	%icc,	%o5,	%g1
	array32	%l4,	%l6,	%i2
	stw	%i4,	[%l7 + 0x70]
	movge	%xcc,	%g5,	%l2
	srl	%o7,	0x14,	%i1
	movcc	%icc,	%o6,	%o0
	movcc	%icc,	%o4,	%l5
	movrne	%g4,	%l1,	%o2
	fxnor	%f12,	%f6,	%f8
	subcc	%l0,	%g7,	%i7
	edge16l	%i6,	%o1,	%g2
	fmovrdlz	%l3,	%f4,	%f16
	smulcc	%g6,	0x0E61,	%i0
	sth	%i3,	[%l7 + 0x18]
	fnegd	%f10,	%f8
	mulscc	%o3,	0x112E,	%i5
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%g3
	fcmped	%fcc1,	%f2,	%f8
	movrgez	%g1,	0x3FE,	%l4
	fmovscs	%xcc,	%f2,	%f28
	movle	%xcc,	%o5,	%i2
	xorcc	%l6,	0x08FD,	%g5
	mulx	%i4,	%l2,	%i1
	nop
	set	0x51, %l0
	ldub	[%l7 + %l0],	%o6
	movpos	%xcc,	%o7,	%o4
	fmovdneg	%xcc,	%f21,	%f14
	edge8	%o0,	%l5,	%l1
	movge	%xcc,	%o2,	%l0
	sub	%g7,	0x1EA2,	%g4
	movle	%icc,	%i6,	%o1
	array16	%i7,	%g2,	%l3
	movn	%icc,	%g6,	%i3
	movgu	%xcc,	%i0,	%i5
	movvs	%icc,	%o3,	%g1
	movgu	%icc,	%l4,	%g3
	movrlz	%o5,	%l6,	%i2
	subccc	%i4,	0x141A,	%l2
	add	%i1,	0x073A,	%g5
	movle	%xcc,	%o6,	%o4
	movcs	%xcc,	%o0,	%l5
	fpack32	%f2,	%f8,	%f16
	fnands	%f5,	%f25,	%f0
	ldsb	[%l7 + 0x36],	%o7
	edge32n	%l1,	%l0,	%o2
	fnors	%f3,	%f16,	%f29
	fmovrdlz	%g4,	%f24,	%f12
	fmovrse	%i6,	%f27,	%f12
	fpackfix	%f22,	%f24
	lduw	[%l7 + 0x50],	%g7
	fpadd32	%f26,	%f22,	%f26
	array8	%i7,	%g2,	%l3
	sra	%g6,	0x1B,	%i3
	ldsh	[%l7 + 0x18],	%o1
	sll	%i0,	%o3,	%g1
	move	%xcc,	%i5,	%l4
	edge8	%g3,	%o5,	%i2
	udivx	%l6,	0x0F4A,	%i4
	nop
	set	0x37, %o3
	ldub	[%l7 + %o3],	%l2
	fnands	%f13,	%f18,	%f5
	fcmple32	%f8,	%f18,	%g5
	movrlez	%i1,	0x265,	%o4
	umulcc	%o6,	0x0BEB,	%o0
	fmovsneg	%icc,	%f18,	%f25
	movrgz	%o7,	0x218,	%l5
	movrlez	%l0,	%l1,	%o2
	xnorcc	%g4,	%g7,	%i6
	edge16	%g2,	%l3,	%i7
	fnegd	%f30,	%f4
	movrne	%i3,	0x06B,	%g6
	ldd	[%l7 + 0x50],	%f28
	fpadd32s	%f29,	%f7,	%f20
	array16	%o1,	%o3,	%i0
	sll	%g1,	%l4,	%g3
	movvc	%xcc,	%o5,	%i5
	xnorcc	%i2,	%i4,	%l2
	srl	%l6,	%g5,	%i1
	edge8	%o6,	%o4,	%o7
	mulscc	%l5,	0x1534,	%l0
	fmovsge	%xcc,	%f8,	%f9
	movleu	%xcc,	%l1,	%o2
	alignaddrl	%g4,	%o0,	%i6
	addcc	%g2,	0x1160,	%g7
	xnor	%l3,	0x13A1,	%i7
	ldsh	[%l7 + 0x6E],	%i3
	sub	%o1,	0x0722,	%g6
	edge8	%o3,	%g1,	%i0
	ldsh	[%l7 + 0x7E],	%l4
	fmovdcs	%xcc,	%f20,	%f26
	fmovdvc	%icc,	%f7,	%f1
	edge8n	%g3,	%o5,	%i2
	fmovrde	%i5,	%f0,	%f24
	fmovrdgez	%i4,	%f28,	%f14
	srax	%l6,	%l2,	%i1
	andncc	%o6,	%g5,	%o7
	edge32ln	%l5,	%l0,	%o4
	edge32n	%l1,	%o2,	%o0
	umul	%g4,	0x1090,	%g2
	fcmpeq32	%f20,	%f12,	%i6
	fors	%f13,	%f6,	%f21
	stx	%l3,	[%l7 + 0x58]
	fmovsa	%xcc,	%f14,	%f11
	umul	%i7,	0x057F,	%i3
	edge16ln	%o1,	%g6,	%g7
	sra	%o3,	%g1,	%l4
	sdivx	%g3,	0x1B55,	%o5
	popc	0x144F,	%i0
	or	%i5,	0x0462,	%i4
	array8	%l6,	%i2,	%i1
	addc	%l2,	%o6,	%o7
	fmovsvc	%xcc,	%f9,	%f19
	fands	%f28,	%f30,	%f12
	stx	%g5,	[%l7 + 0x60]
	movpos	%xcc,	%l0,	%l5
	edge8l	%o4,	%o2,	%o0
	movvc	%icc,	%g4,	%g2
	orn	%l1,	%i6,	%i7
	edge16ln	%l3,	%i3,	%g6
	fmovdn	%xcc,	%f5,	%f0
	edge32ln	%g7,	%o1,	%g1
	stx	%o3,	[%l7 + 0x18]
	edge8n	%l4,	%o5,	%i0
	movrne	%g3,	0x1DB,	%i5
	umulcc	%l6,	0x0B85,	%i2
	sdivcc	%i4,	0x1DAC,	%i1
	edge16n	%o6,	%l2,	%g5
	fzero	%f22
	sth	%l0,	[%l7 + 0x74]
	lduh	[%l7 + 0x6C],	%o7
	lduw	[%l7 + 0x1C],	%l5
	and	%o4,	0x09EC,	%o0
	movre	%g4,	0x187,	%g2
	fmovrslz	%o2,	%f6,	%f8
	ldd	[%l7 + 0x48],	%f12
	movle	%icc,	%l1,	%i7
	fmovrsne	%l3,	%f7,	%f16
	restore %i3, 0x0B6A, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g7,	%i6,	%o1
	andcc	%g1,	0x17E1,	%l4
	stb	%o3,	[%l7 + 0x61]
	movrne	%i0,	0x00A,	%o5
	fcmple32	%f6,	%f22,	%i5
	lduw	[%l7 + 0x4C],	%l6
	ldsw	[%l7 + 0x38],	%g3
	ldsb	[%l7 + 0x60],	%i2
	edge16	%i4,	%i1,	%l2
	sll	%o6,	%g5,	%l0
	save %l5, 0x0048, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o4,	%g4,	%o0
	movrgz	%o2,	%l1,	%g2
	stx	%l3,	[%l7 + 0x40]
	orcc	%i3,	0x1AC4,	%g6
	alignaddrl	%g7,	%i7,	%i6
	std	%f10,	[%l7 + 0x30]
	movn	%icc,	%g1,	%o1
	alignaddrl	%o3,	%i0,	%o5
	popc	%i5,	%l4
	addcc	%g3,	%i2,	%i4
	umulcc	%i1,	0x0557,	%l2
	stx	%l6,	[%l7 + 0x68]
	edge16ln	%o6,	%l0,	%g5
	edge16	%o7,	%l5,	%g4
	movleu	%xcc,	%o4,	%o0
	fmovrsne	%o2,	%f17,	%f0
	movrgez	%g2,	0x2E5,	%l3
	alignaddr	%l1,	%g6,	%g7
	smulcc	%i7,	0x1775,	%i3
	srlx	%g1,	%i6,	%o1
	fmovdg	%xcc,	%f21,	%f17
	fmovrslez	%i0,	%f24,	%f17
	stw	%o3,	[%l7 + 0x30]
	ldx	[%l7 + 0x28],	%o5
	ld	[%l7 + 0x14],	%f19
	movrgz	%l4,	%i5,	%g3
	subccc	%i2,	0x16D2,	%i1
	lduw	[%l7 + 0x7C],	%l2
	edge32l	%i4,	%l6,	%l0
	subc	%g5,	0x0930,	%o7
	sub	%l5,	%g4,	%o6
	edge8n	%o4,	%o2,	%o0
	array8	%l3,	%l1,	%g6
	movcc	%icc,	%g2,	%i7
	srl	%g7,	%i3,	%g1
	movne	%icc,	%o1,	%i6
	or	%i0,	0x1F06,	%o3
	fnot1	%f22,	%f14
	movg	%xcc,	%l4,	%o5
	movrgz	%i5,	%g3,	%i1
	edge32n	%l2,	%i2,	%i4
	fmovdcc	%xcc,	%f20,	%f2
	ldub	[%l7 + 0x30],	%l0
	movrgz	%g5,	0x1FB,	%o7
	sdivcc	%l5,	0x0EB4,	%l6
	sra	%g4,	%o4,	%o2
	orcc	%o0,	%o6,	%l1
	fmovdne	%xcc,	%f15,	%f27
	addccc	%l3,	%g6,	%i7
	fmovdpos	%icc,	%f16,	%f6
	mulscc	%g2,	%i3,	%g1
	edge16l	%o1,	%i6,	%g7
	ldsw	[%l7 + 0x70],	%i0
	fmul8sux16	%f0,	%f14,	%f8
	fnot2s	%f14,	%f12
	fornot2	%f4,	%f0,	%f14
	edge16ln	%o3,	%o5,	%l4
	sir	0x1936
	movrlez	%i5,	0x392,	%i1
	save %l2, %g3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l0,	%i2
	fmul8sux16	%f30,	%f4,	%f26
	fnot1	%f0,	%f22
	srlx	%o7,	0x15,	%l5
	edge16ln	%l6,	%g4,	%o4
	sdivcc	%o2,	0x1863,	%o0
	srl	%g5,	%o6,	%l1
	fmovrslz	%l3,	%f26,	%f21
	movge	%xcc,	%g6,	%i7
	fcmple16	%f30,	%f0,	%g2
	sllx	%i3,	0x1D,	%o1
	fors	%f22,	%f25,	%f26
	movvc	%icc,	%i6,	%g7
	xorcc	%g1,	0x04AC,	%o3
	fpmerge	%f21,	%f8,	%f14
	fmovsle	%icc,	%f27,	%f11
	stw	%i0,	[%l7 + 0x34]
	movvs	%xcc,	%l4,	%i5
	edge32n	%o5,	%l2,	%i1
	umul	%i4,	%l0,	%i2
	movre	%g3,	0x3E1,	%l5
	edge16n	%o7,	%g4,	%o4
	orcc	%o2,	0x1CAC,	%o0
	nop
	set	0x78, %g2
	ldsb	[%l7 + %g2],	%g5
	movgu	%icc,	%l6,	%l1
	edge8	%o6,	%g6,	%i7
	fcmpeq16	%f28,	%f26,	%l3
	fandnot2s	%f26,	%f13,	%f30
	array8	%i3,	%g2,	%i6
	fmovdneg	%icc,	%f14,	%f18
	fmovdl	%icc,	%f14,	%f22
	fpsub16	%f16,	%f2,	%f0
	fmovdleu	%icc,	%f7,	%f25
	smul	%o1,	%g7,	%o3
	movvc	%icc,	%g1,	%i0
	movre	%l4,	0x1B9,	%o5
	subccc	%l2,	%i5,	%i4
	movcs	%icc,	%l0,	%i1
	fmovda	%xcc,	%f13,	%f15
	edge32n	%i2,	%l5,	%g3
	sdivx	%g4,	0x13A0,	%o4
	edge16	%o7,	%o0,	%g5
	movgu	%icc,	%l6,	%l1
	st	%f14,	[%l7 + 0x70]
	nop
	set	0x31, %l6
	ldub	[%l7 + %l6],	%o2
	edge8	%o6,	%g6,	%l3
	movrgez	%i3,	0x189,	%i7
	array16	%i6,	%g2,	%g7
	or	%o1,	0x08A3,	%g1
	subccc	%o3,	0x059B,	%i0
	movleu	%icc,	%l4,	%l2
	save %i5, 0x1A5F, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x30, %l1
	ldsw	[%l7 + %l1],	%l0
	fnot1s	%f4,	%f25
	ld	[%l7 + 0x38],	%f20
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	movneg	%icc,	%g3,	%g4
	move	%icc,	%o4,	%o7
	fmovsgu	%xcc,	%f21,	%f25
	orn	%l5,	0x021C,	%o0
	addccc	%g5,	%l1,	%o2
	sir	0x123A
	fcmpne32	%f0,	%f20,	%o6
	mulscc	%g6,	0x1442,	%l3
	ldsb	[%l7 + 0x22],	%l6
	alignaddr	%i7,	%i6,	%g2
	fcmple32	%f6,	%f16,	%g7
	xorcc	%o1,	0x0F91,	%g1
	movrlez	%o3,	0x354,	%i0
	movle	%xcc,	%l4,	%i3
	subccc	%i5,	0x0B50,	%l2
	std	%f22,	[%l7 + 0x68]
	movpos	%icc,	%l0,	%o5
	udiv	%i4,	0x08B0,	%i1
	or	%i2,	0x04E9,	%g3
	edge16n	%g4,	%o4,	%l5
	sethi	0x078B,	%o0
	fmovsneg	%icc,	%f31,	%f29
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%g4
	sth	%o7,	[%l7 + 0x0C]
	array32	%l1,	%o6,	%g6
	edge32n	%o2,	%l6,	%i7
	fpsub32s	%f5,	%f31,	%f3
	sll	%i6,	%l3,	%g7
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f26
	movrgez	%o1,	0x2E4,	%g1
	addc	%o3,	%g2,	%l4
	mulx	%i0,	0x10FA,	%i5
	pdist	%f0,	%f2,	%f2
	add	%i3,	%l0,	%l2
	lduh	[%l7 + 0x42],	%o5
	st	%f8,	[%l7 + 0x30]
	fxors	%f2,	%f27,	%f11
	sth	%i1,	[%l7 + 0x24]
	array32	%i4,	%g3,	%g4
	sdiv	%o4,	0x0E5D,	%l5
	edge8n	%i2,	%o0,	%g5
	movcs	%xcc,	%l1,	%o7
	sra	%g6,	%o2,	%l6
	movne	%icc,	%o6,	%i7
	xnor	%l3,	%g7,	%i6
	fmovsg	%xcc,	%f13,	%f26
	movrgez	%o1,	%o3,	%g1
	umul	%g2,	%l4,	%i5
	movneg	%icc,	%i3,	%i0
	xorcc	%l2,	0x0284,	%o5
	fornot1	%f26,	%f10,	%f20
	udivx	%i1,	0x0ACB,	%l0
	array16	%i4,	%g3,	%g4
	movn	%icc,	%l5,	%o4
	udiv	%i2,	0x1DD2,	%o0
	edge8	%g5,	%l1,	%g6
	movvs	%xcc,	%o2,	%o7
	addcc	%l6,	%o6,	%l3
	edge8l	%g7,	%i6,	%o1
	andncc	%i7,	%o3,	%g2
	sll	%g1,	%l4,	%i3
	movle	%icc,	%i0,	%i5
	stw	%l2,	[%l7 + 0x70]
	st	%f23,	[%l7 + 0x38]
	movcs	%xcc,	%i1,	%l0
	subccc	%o5,	0x12F6,	%g3
	udivx	%g4,	0x1DD6,	%i4
	sth	%o4,	[%l7 + 0x46]
	std	%f8,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f30
	sdivx	%l5,	0x09A9,	%o0
	fones	%f25
	andn	%g5,	%i2,	%l1
	fmovdcs	%icc,	%f29,	%f18
	addccc	%o2,	0x0D72,	%o7
	fcmps	%fcc1,	%f31,	%f22
	alignaddr	%l6,	%g6,	%o6
	edge8ln	%g7,	%i6,	%o1
	addccc	%i7,	0x0C2F,	%l3
	movvc	%icc,	%o3,	%g2
	ldx	[%l7 + 0x58],	%l4
	sdiv	%i3,	0x1131,	%g1
	fpmerge	%f13,	%f18,	%f10
	edge16ln	%i0,	%i5,	%i1
	edge32n	%l2,	%o5,	%g3
	movcs	%icc,	%l0,	%g4
	fnor	%f2,	%f26,	%f26
	array16	%o4,	%l5,	%i4
	movne	%xcc,	%g5,	%o0
	movg	%xcc,	%i2,	%l1
	fmovsgu	%icc,	%f9,	%f24
	fornot2s	%f1,	%f25,	%f15
	nop
	set	0x10, %i7
	stw	%o2,	[%l7 + %i7]
	edge32l	%l6,	%g6,	%o7
	fcmps	%fcc1,	%f29,	%f22
	fmovrsgez	%g7,	%f1,	%f26
	fcmped	%fcc3,	%f2,	%f20
	alignaddr	%o6,	%i6,	%i7
	smul	%o1,	0x092F,	%l3
	orn	%g2,	0x0BFE,	%l4
	fmovdle	%icc,	%f19,	%f12
	smul	%o3,	0x164A,	%g1
	std	%f4,	[%l7 + 0x30]
	edge16n	%i3,	%i0,	%i5
	movrlz	%i1,	0x1E8,	%l2
	subcc	%g3,	%o5,	%g4
	umulcc	%l0,	0x0487,	%o4
	mova	%xcc,	%l5,	%g5
	sll	%o0,	0x16,	%i2
	or	%i4,	%o2,	%l6
	fpsub16s	%f0,	%f18,	%f26
	movg	%xcc,	%l1,	%o7
	srax	%g6,	%g7,	%i6
	subccc	%i7,	%o6,	%l3
	sllx	%g2,	%l4,	%o3
	lduh	[%l7 + 0x50],	%g1
	fpadd16	%f4,	%f6,	%f16
	fors	%f13,	%f2,	%f10
	add	%i3,	%o1,	%i0
	std	%f14,	[%l7 + 0x70]
	edge32ln	%i5,	%i1,	%l2
	fsrc1s	%f7,	%f2
	ldub	[%l7 + 0x4B],	%o5
	ld	[%l7 + 0x14],	%f3
	fmovrdne	%g4,	%f4,	%f6
	umulcc	%l0,	%g3,	%o4
	subcc	%l5,	%g5,	%o0
	fsrc2s	%f24,	%f12
	andncc	%i4,	%i2,	%l6
	edge16n	%l1,	%o2,	%o7
	andn	%g6,	%i6,	%i7
	fmovsneg	%xcc,	%f29,	%f9
	edge16	%g7,	%l3,	%g2
	sllx	%l4,	0x11,	%o3
	movcc	%icc,	%g1,	%i3
	fsrc1s	%f1,	%f18
	fmovdgu	%xcc,	%f31,	%f30
	stw	%o6,	[%l7 + 0x48]
	fors	%f5,	%f12,	%f16
	orn	%o1,	0x19F2,	%i5
	sdiv	%i0,	0x1AA0,	%i1
	nop
	set	0x31, %l4
	ldub	[%l7 + %l4],	%o5
	movvs	%xcc,	%g4,	%l2
	fpsub16s	%f23,	%f21,	%f24
	alignaddrl	%l0,	%g3,	%l5
	fone	%f0
	movge	%icc,	%g5,	%o4
	popc	0x1FDB,	%i4
	ldsw	[%l7 + 0x6C],	%o0
	lduw	[%l7 + 0x5C],	%l6
	addc	%i2,	%o2,	%l1
	sra	%o7,	0x1B,	%i6
	lduh	[%l7 + 0x76],	%i7
	alignaddrl	%g7,	%l3,	%g6
	xor	%l4,	%o3,	%g1
	udivcc	%i3,	0x196D,	%o6
	ldx	[%l7 + 0x38],	%o1
	movrlez	%g2,	0x2E5,	%i0
	edge16ln	%i1,	%i5,	%o5
	srlx	%l2,	0x09,	%g4
	umul	%l0,	0x1A7D,	%l5
	fxnors	%f4,	%f7,	%f24
	edge8l	%g5,	%o4,	%g3
	std	%f28,	[%l7 + 0x50]
	edge32ln	%i4,	%o0,	%i2
	sllx	%o2,	%l6,	%l1
	sethi	0x157D,	%i6
	restore %i7, %g7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g6,	%l3
	fzero	%f8
	fmovda	%xcc,	%f19,	%f30
	fmovsgu	%icc,	%f1,	%f24
	fmovscs	%icc,	%f9,	%f29
	fmovsa	%xcc,	%f22,	%f19
	ld	[%l7 + 0x68],	%f4
	ld	[%l7 + 0x0C],	%f20
	mulx	%o3,	0x03C2,	%l4
	ldsw	[%l7 + 0x68],	%g1
	sllx	%o6,	%i3,	%g2
	ldsb	[%l7 + 0x13],	%i0
	xnorcc	%o1,	0x1DE0,	%i1
	array16	%o5,	%l2,	%g4
	movvs	%xcc,	%l0,	%i5
	edge8ln	%g5,	%l5,	%g3
	fsrc2s	%f6,	%f4
	edge8ln	%i4,	%o0,	%i2
	movrlez	%o4,	0x11A,	%o2
	sdiv	%l1,	0x070A,	%i6
	edge32l	%l6,	%g7,	%i7
	sdivcc	%o7,	0x1779,	%g6
	subccc	%o3,	0x16E2,	%l3
	stx	%l4,	[%l7 + 0x08]
	edge32l	%o6,	%g1,	%i3
	array8	%i0,	%o1,	%g2
	stx	%i1,	[%l7 + 0x78]
	fmovsgu	%icc,	%f25,	%f14
	edge16l	%l2,	%g4,	%l0
	and	%i5,	0x1AB2,	%o5
	ldsw	[%l7 + 0x70],	%g5
	movge	%xcc,	%l5,	%g3
	andcc	%i4,	%o0,	%i2
	andn	%o2,	%l1,	%o4
	fone	%f12
	andn	%l6,	0x07B1,	%g7
	fpadd16	%f14,	%f2,	%f14
	smul	%i6,	%o7,	%i7
	movpos	%xcc,	%o3,	%l3
	or	%g6,	0x1449,	%o6
	ldsb	[%l7 + 0x6C],	%g1
	sub	%i3,	0x100A,	%l4
	orncc	%o1,	0x063B,	%i0
	fors	%f16,	%f21,	%f10
	ldub	[%l7 + 0x69],	%i1
	or	%g2,	%l2,	%l0
	addccc	%i5,	0x0316,	%o5
	fmovsg	%icc,	%f5,	%f11
	fcmps	%fcc2,	%f22,	%f29
	movneg	%xcc,	%g5,	%g4
	fandnot2s	%f5,	%f5,	%f18
	movrlez	%g3,	%l5,	%o0
	ldd	[%l7 + 0x18],	%f30
	orcc	%i2,	0x0F94,	%o2
	fmovsvc	%xcc,	%f6,	%f5
	umulcc	%l1,	%i4,	%l6
	edge8ln	%g7,	%i6,	%o7
	sllx	%o4,	%o3,	%i7
	stx	%g6,	[%l7 + 0x18]
	mova	%icc,	%o6,	%g1
	movg	%xcc,	%i3,	%l3
	ldx	[%l7 + 0x48],	%o1
	array32	%l4,	%i1,	%i0
	fone	%f6
	ldx	[%l7 + 0x18],	%g2
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	srlx	%o5,	0x08,	%i5
	movre	%g4,	0x1AD,	%g5
	ldsh	[%l7 + 0x12],	%l5
	edge8n	%o0,	%g3,	%i2
	fmovdgu	%icc,	%f16,	%f5
	edge32n	%o2,	%i4,	%l6
	movrlez	%l1,	0x04F,	%g7
	array16	%o7,	%i6,	%o3
	array8	%o4,	%i7,	%g6
	movrgz	%o6,	0x04C,	%i3
	andcc	%l3,	0x1B93,	%o1
	edge16l	%l4,	%i1,	%g1
	array8	%g2,	%l0,	%i0
	sra	%o5,	0x16,	%i5
	sdiv	%g4,	0x09B3,	%g5
	smulcc	%l2,	%l5,	%o0
	subccc	%i2,	0x0C00,	%g3
	movrgz	%i4,	0x34F,	%l6
	addc	%l1,	0x179A,	%g7
	fmovda	%icc,	%f3,	%f4
	edge8l	%o7,	%o2,	%i6
	nop
	set	0x48, %o6
	std	%f10,	[%l7 + %o6]
	movleu	%xcc,	%o4,	%i7
	lduh	[%l7 + 0x22],	%g6
	orcc	%o6,	0x0635,	%i3
	edge8	%o3,	%l3,	%l4
	alignaddrl	%i1,	%g1,	%o1
	edge8l	%g2,	%i0,	%l0
	movvs	%icc,	%i5,	%o5
	ldsh	[%l7 + 0x7A],	%g4
	fone	%f8
	subcc	%l2,	%l5,	%o0
	mova	%icc,	%g5,	%i2
	sdiv	%g3,	0x1B0D,	%l6
	edge32n	%l1,	%i4,	%g7
	edge32	%o2,	%o7,	%o4
	ldsb	[%l7 + 0x27],	%i6
	movvc	%xcc,	%i7,	%o6
	movcc	%icc,	%g6,	%o3
	sth	%i3,	[%l7 + 0x70]
	fpadd16	%f18,	%f10,	%f10
	andncc	%l3,	%i1,	%l4
	popc	0x1198,	%g1
	movge	%xcc,	%g2,	%o1
	fmovse	%icc,	%f28,	%f29
	mulx	%l0,	%i5,	%i0
	ldsh	[%l7 + 0x7C],	%o5
	orcc	%l2,	0x1525,	%g4
	mulx	%l5,	0x01C2,	%o0
	orcc	%i2,	%g3,	%g5
	fmovsge	%icc,	%f13,	%f30
	and	%l6,	%i4,	%l1
	andcc	%g7,	0x1B9D,	%o7
	xor	%o2,	%i6,	%i7
	mulscc	%o4,	%o6,	%o3
	addcc	%g6,	%i3,	%l3
	stw	%i1,	[%l7 + 0x10]
	fmovrdlez	%l4,	%f8,	%f8
	addcc	%g2,	0x05D6,	%g1
	lduw	[%l7 + 0x5C],	%l0
	sth	%o1,	[%l7 + 0x70]
	movrlez	%i0,	0x120,	%i5
	edge8n	%l2,	%o5,	%l5
	movle	%icc,	%g4,	%o0
	mulscc	%i2,	0x1D2C,	%g5
	edge16l	%l6,	%i4,	%l1
	stw	%g7,	[%l7 + 0x48]
	fpadd16	%f24,	%f26,	%f2
	move	%icc,	%o7,	%o2
	fmovdcc	%icc,	%f4,	%f14
	alignaddr	%i6,	%i7,	%g3
	subccc	%o6,	%o3,	%g6
	movrne	%i3,	%o4,	%l3
	udivcc	%i1,	0x0243,	%l4
	stb	%g2,	[%l7 + 0x6E]
	fmovdn	%icc,	%f10,	%f28
	sth	%g1,	[%l7 + 0x16]
	movn	%xcc,	%o1,	%i0
	movg	%xcc,	%l0,	%l2
	edge8ln	%o5,	%l5,	%g4
	addc	%i5,	%o0,	%g5
	movpos	%icc,	%i2,	%l6
	movrne	%l1,	%g7,	%i4
	sth	%o2,	[%l7 + 0x18]
	srl	%i6,	%i7,	%o7
	edge16ln	%g3,	%o3,	%g6
	addccc	%o6,	%i3,	%o4
	fcmps	%fcc0,	%f0,	%f21
	fmul8ulx16	%f14,	%f16,	%f6
	std	%f20,	[%l7 + 0x28]
	fmovdgu	%xcc,	%f4,	%f26
	umulcc	%l3,	%i1,	%l4
	sub	%g1,	0x1A21,	%g2
	move	%xcc,	%i0,	%o1
	fmul8x16au	%f17,	%f3,	%f10
	edge8n	%l0,	%l2,	%o5
	smul	%l5,	0x0855,	%i5
	fmovdn	%xcc,	%f14,	%f26
	fmovdvc	%icc,	%f26,	%f21
	subccc	%g4,	%g5,	%o0
	st	%f30,	[%l7 + 0x24]
	edge8	%l6,	%i2,	%l1
	movrgz	%i4,	0x008,	%o2
	fmovspos	%icc,	%f10,	%f17
	udivcc	%g7,	0x16F4,	%i7
	std	%f6,	[%l7 + 0x18]
	fcmpeq32	%f18,	%f24,	%i6
	fnegd	%f10,	%f8
	fzero	%f12
	movg	%icc,	%g3,	%o7
	fpadd16s	%f13,	%f28,	%f7
	subccc	%g6,	%o3,	%o6
	fnegs	%f23,	%f27
	fcmpes	%fcc1,	%f1,	%f7
	srlx	%i3,	%l3,	%o4
	edge32l	%l4,	%g1,	%g2
	ldsh	[%l7 + 0x66],	%i0
	umulcc	%o1,	0x0BED,	%l0
	ldd	[%l7 + 0x48],	%f14
	movrgez	%i1,	0x0AF,	%l2
	srlx	%l5,	%o5,	%g4
	movrlz	%g5,	0x1EB,	%o0
	andn	%i5,	0x08B0,	%l6
	andn	%i2,	0x0A8E,	%l1
	edge8n	%o2,	%g7,	%i4
	st	%f8,	[%l7 + 0x0C]
	ldsw	[%l7 + 0x68],	%i6
	srax	%g3,	%i7,	%g6
	fzeros	%f2
	srax	%o3,	0x1F,	%o6
	movne	%xcc,	%i3,	%o7
	andcc	%l3,	%o4,	%g1
	fmovrdgez	%l4,	%f24,	%f4
	movpos	%icc,	%i0,	%g2
	fzero	%f22
	fmovsg	%icc,	%f8,	%f21
	sir	0x080A
	nop
	set	0x68, %l3
	stx	%l0,	[%l7 + %l3]
	fmovrdlez	%o1,	%f28,	%f14
	add	%l2,	0x00BA,	%i1
	andncc	%o5,	%g4,	%l5
	umul	%g5,	%o0,	%i5
	fxors	%f31,	%f17,	%f2
	sll	%l6,	0x12,	%l1
	std	%f20,	[%l7 + 0x20]
	udivcc	%i2,	0x0317,	%o2
	subc	%i4,	0x0A5F,	%g7
	fpadd16	%f10,	%f0,	%f22
	fpsub16s	%f19,	%f22,	%f17
	fmovrslez	%g3,	%f7,	%f24
	stw	%i6,	[%l7 + 0x08]
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%f18
	movle	%xcc,	%i7,	%o3
	lduw	[%l7 + 0x50],	%o6
	move	%xcc,	%g6,	%o7
	xnor	%i3,	%o4,	%g1
	fnand	%f18,	%f2,	%f14
	sir	0x062C
	umulcc	%l4,	%l3,	%i0
	alignaddrl	%g2,	%o1,	%l0
	subc	%i1,	%o5,	%l2
	lduw	[%l7 + 0x60],	%l5
	xnorcc	%g5,	0x1E39,	%g4
	sdiv	%o0,	0x1F77,	%l6
	array8	%l1,	%i2,	%o2
	movge	%icc,	%i5,	%i4
	movcs	%xcc,	%g3,	%i6
	fabss	%f28,	%f21
	movrlz	%g7,	0x386,	%o3
	add	%o6,	0x11A0,	%g6
	movvs	%icc,	%o7,	%i7
	xorcc	%o4,	%i3,	%l4
	subccc	%l3,	0x1CEA,	%g1
	ldd	[%l7 + 0x50],	%f18
	orn	%i0,	0x145E,	%o1
	fmovsneg	%xcc,	%f6,	%f25
	andn	%l0,	%g2,	%i1
	popc	0x063C,	%l2
	array8	%o5,	%g5,	%l5
	edge8n	%o0,	%g4,	%l1
	sth	%i2,	[%l7 + 0x3A]
	ld	[%l7 + 0x40],	%f25
	fcmpne32	%f4,	%f2,	%o2
	andcc	%i5,	%l6,	%i4
	movcs	%icc,	%g3,	%i6
	subcc	%o3,	0x1D14,	%g7
	edge8ln	%o6,	%o7,	%i7
	fmovdvc	%icc,	%f31,	%f10
	umulcc	%o4,	0x00E3,	%g6
	movpos	%icc,	%i3,	%l4
	movrlez	%l3,	%g1,	%i0
	edge8	%l0,	%o1,	%g2
	sethi	0x002E,	%i1
	fcmpeq16	%f30,	%f2,	%o5
	move	%xcc,	%g5,	%l5
	xnorcc	%l2,	%o0,	%g4
	edge8ln	%l1,	%i2,	%o2
	fmul8sux16	%f6,	%f10,	%f12
	movgu	%xcc,	%l6,	%i4
	lduw	[%l7 + 0x7C],	%g3
	movrgz	%i5,	%o3,	%g7
	srl	%i6,	%o7,	%i7
	fone	%f8
	fxnors	%f24,	%f29,	%f21
	movre	%o4,	%g6,	%o6
	nop
	set	0x7B, %o7
	ldsb	[%l7 + %o7],	%i3
	edge8ln	%l4,	%l3,	%g1
	edge8n	%i0,	%l0,	%o1
	addc	%g2,	%i1,	%g5
	move	%icc,	%o5,	%l2
	siam	0x4
	edge8n	%o0,	%g4,	%l1
	edge8n	%l5,	%o2,	%l6
	edge8l	%i2,	%i4,	%i5
	andcc	%o3,	%g3,	%i6
	lduw	[%l7 + 0x5C],	%g7
	movne	%xcc,	%i7,	%o7
	stb	%g6,	[%l7 + 0x6B]
	ldsh	[%l7 + 0x5E],	%o4
	stw	%i3,	[%l7 + 0x7C]
	movneg	%icc,	%o6,	%l4
	stb	%g1,	[%l7 + 0x7B]
	addccc	%i0,	%l3,	%o1
	lduh	[%l7 + 0x24],	%l0
	movvs	%icc,	%g2,	%g5
	save %i1, 0x1D1E, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o5,	%g4
	fnors	%f9,	%f4,	%f8
	ldsb	[%l7 + 0x62],	%o0
	andn	%l1,	0x1E76,	%o2
	fone	%f18
	fpmerge	%f31,	%f17,	%f8
	ldd	[%l7 + 0x48],	%i6
	edge32l	%i2,	%l5,	%i4
	addccc	%o3,	0x093A,	%g3
	edge32n	%i5,	%g7,	%i6
	array32	%i7,	%g6,	%o7
	fmovdn	%icc,	%f19,	%f21
	movge	%icc,	%o4,	%o6
	sdivx	%i3,	0x1CF0,	%l4
	sdiv	%i0,	0x0435,	%g1
	xnor	%o1,	%l0,	%g2
	sth	%g5,	[%l7 + 0x54]
	edge16ln	%l3,	%i1,	%o5
	sdivx	%l2,	0x0050,	%g4
	ldsb	[%l7 + 0x78],	%o0
	fmovscc	%icc,	%f8,	%f27
	array16	%l1,	%o2,	%i2
	ld	[%l7 + 0x74],	%f13
	fornot2s	%f29,	%f6,	%f30
	restore %l5, %l6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x70],	%g3
	sllx	%i4,	%i5,	%i6
	addc	%i7,	%g6,	%g7
	smulcc	%o4,	0x0424,	%o6
	udivx	%o7,	0x044F,	%l4
	fxnors	%f6,	%f13,	%f11
	edge8	%i3,	%i0,	%o1
	movrgz	%g1,	%l0,	%g2
	andn	%l3,	0x06D1,	%g5
	ld	[%l7 + 0x6C],	%f25
	alignaddr	%i1,	%l2,	%g4
	umul	%o0,	0x093E,	%o5
	movgu	%xcc,	%l1,	%i2
	movpos	%icc,	%o2,	%l6
	movne	%icc,	%o3,	%l5
	alignaddrl	%g3,	%i4,	%i6
	sethi	0x1D8B,	%i7
	movrlz	%i5,	%g7,	%o4
	movvs	%xcc,	%g6,	%o6
	srlx	%l4,	0x0D,	%o7
	udivcc	%i0,	0x1C4C,	%i3
	sdivx	%o1,	0x192F,	%g1
	move	%xcc,	%l0,	%g2
	popc	0x1972,	%g5
	fmovsvc	%xcc,	%f5,	%f31
	save %l3, 0x1CA6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f9,	%f15,	%f27
	umulcc	%g4,	%o0,	%o5
	orn	%i1,	%i2,	%o2
	movre	%l1,	%o3,	%l6
	fxor	%f16,	%f12,	%f10
	fandnot1s	%f28,	%f31,	%f28
	add	%l5,	0x0458,	%i4
	movleu	%icc,	%i6,	%i7
	andcc	%i5,	0x0DE7,	%g7
	movrlez	%g3,	0x2AA,	%g6
	smulcc	%o6,	0x14AA,	%o4
	fmovsvs	%xcc,	%f20,	%f19
	sdiv	%l4,	0x1B4E,	%i0
	edge32l	%i3,	%o7,	%o1
	fpadd32	%f4,	%f0,	%f18
	faligndata	%f10,	%f8,	%f24
	fabsd	%f28,	%f16
	ldub	[%l7 + 0x2C],	%l0
	fmovsge	%icc,	%f3,	%f21
	nop
	set	0x68, %o4
	ldsh	[%l7 + %o4],	%g1
	xor	%g2,	0x1165,	%l3
	sra	%g5,	0x04,	%l2
	sir	0x1EB1
	movge	%icc,	%g4,	%o5
	fmovrse	%i1,	%f16,	%f23
	fmovrdne	%i2,	%f22,	%f30
	edge16l	%o0,	%o2,	%l1
	nop
	set	0x0C, %o1
	lduw	[%l7 + %o1],	%l6
	movrne	%l5,	%o3,	%i4
	mova	%xcc,	%i7,	%i5
	st	%f3,	[%l7 + 0x60]
	sdivcc	%i6,	0x0F5C,	%g7
	sra	%g6,	0x07,	%g3
	movne	%xcc,	%o6,	%o4
	movgu	%icc,	%l4,	%i0
	fpadd16s	%f8,	%f29,	%f0
	and	%i3,	0x19A5,	%o7
	xnorcc	%o1,	%l0,	%g2
	ldx	[%l7 + 0x48],	%g1
	smulcc	%l3,	%g5,	%l2
	orn	%o5,	0x0C9C,	%i1
	fmul8x16au	%f20,	%f26,	%f8
	xorcc	%g4,	0x0BAE,	%o0
	fpsub32	%f24,	%f10,	%f6
	sllx	%i2,	0x0D,	%o2
	fmovrdgz	%l1,	%f14,	%f2
	movleu	%icc,	%l5,	%l6
	xnor	%o3,	0x0869,	%i7
	fmovsne	%xcc,	%f6,	%f8
	array8	%i5,	%i6,	%i4
	edge32ln	%g7,	%g6,	%o6
	orncc	%g3,	0x134D,	%l4
	ldsw	[%l7 + 0x64],	%i0
	srax	%i3,	%o4,	%o1
	mulx	%l0,	%o7,	%g2
	orn	%g1,	0x1B3B,	%l3
	sra	%g5,	%o5,	%i1
	fmovsneg	%xcc,	%f17,	%f19
	for	%f20,	%f14,	%f28
	movrgez	%g4,	0x280,	%o0
	fmovse	%xcc,	%f6,	%f12
	andcc	%l2,	0x0081,	%o2
	add	%i2,	0x10C3,	%l5
	array16	%l1,	%l6,	%i7
	sub	%o3,	0x1A27,	%i5
	fmovdge	%xcc,	%f11,	%f31
	movn	%icc,	%i6,	%g7
	st	%f4,	[%l7 + 0x50]
	sra	%i4,	%g6,	%o6
	fmovdgu	%xcc,	%f14,	%f9
	movg	%xcc,	%l4,	%i0
	edge8	%i3,	%g3,	%o4
	srax	%o1,	%o7,	%g2
	subcc	%g1,	0x0EDC,	%l3
	sdivcc	%l0,	0x1EDD,	%g5
	ld	[%l7 + 0x34],	%f17
	srlx	%i1,	0x0A,	%g4
	fcmpeq32	%f28,	%f30,	%o5
	xorcc	%o0,	0x0CDC,	%l2
	fmovdl	%icc,	%f3,	%f19
	fmovscs	%icc,	%f6,	%f1
	array32	%o2,	%l5,	%i2
	mova	%icc,	%l1,	%i7
	andncc	%l6,	%i5,	%i6
	movg	%xcc,	%g7,	%i4
	movpos	%icc,	%g6,	%o6
	addc	%l4,	0x0A50,	%o3
	movvc	%icc,	%i0,	%i3
	movrgz	%o4,	%o1,	%g3
	fmovrsgz	%o7,	%f19,	%f3
	srl	%g1,	%l3,	%g2
	stx	%l0,	[%l7 + 0x58]
	array8	%g5,	%g4,	%i1
	movleu	%xcc,	%o5,	%l2
	fmovrde	%o2,	%f0,	%f18
	subcc	%o0,	%l5,	%i2
	xnor	%i7,	%l1,	%l6
	udivcc	%i5,	0x1F84,	%i6
	srlx	%i4,	0x0E,	%g7
	fpsub16	%f6,	%f14,	%f20
	ldx	[%l7 + 0x30],	%o6
	fandnot1	%f28,	%f18,	%f24
	sllx	%l4,	%o3,	%i0
	edge32l	%i3,	%g6,	%o1
	ldsh	[%l7 + 0x3C],	%g3
	xnorcc	%o7,	%o4,	%g1
	array8	%g2,	%l0,	%g5
	smul	%g4,	%l3,	%o5
	sllx	%i1,	%o2,	%l2
	move	%icc,	%l5,	%o0
	mova	%icc,	%i2,	%i7
	lduw	[%l7 + 0x24],	%l1
	fmovdle	%icc,	%f3,	%f22
	movrgz	%l6,	0x225,	%i6
	movrne	%i4,	0x02E,	%g7
	movrlz	%i5,	%o6,	%l4
	edge8ln	%i0,	%o3,	%i3
	udivcc	%g6,	0x0756,	%o1
	nop
	set	0x5C, %g4
	ldub	[%l7 + %g4],	%o7
	fnot1s	%f29,	%f29
	sdivx	%g3,	0x03D0,	%g1
	orn	%g2,	0x0B84,	%o4
	fxors	%f14,	%f29,	%f25
	movn	%xcc,	%g5,	%l0
	xorcc	%g4,	%l3,	%i1
	lduh	[%l7 + 0x46],	%o5
	fnot1s	%f17,	%f30
	and	%l2,	%l5,	%o2
	sra	%i2,	0x03,	%o0
	udivx	%l1,	0x0162,	%l6
	edge16	%i6,	%i4,	%g7
	std	%f22,	[%l7 + 0x68]
	ldsw	[%l7 + 0x34],	%i5
	andcc	%i7,	%l4,	%o6
	ldd	[%l7 + 0x68],	%i0
	ldx	[%l7 + 0x28],	%o3
	movgu	%icc,	%i3,	%g6
	move	%icc,	%o7,	%g3
	movvc	%icc,	%g1,	%o1
	udivcc	%g2,	0x1DB1,	%o4
	ldsb	[%l7 + 0x3B],	%g5
	movle	%icc,	%g4,	%l3
	mova	%xcc,	%i1,	%l0
	umulcc	%o5,	%l5,	%l2
	fzeros	%f31
	edge32l	%i2,	%o0,	%o2
	ld	[%l7 + 0x18],	%f11
	sll	%l6,	0x12,	%l1
	xnorcc	%i4,	%g7,	%i5
	fmovdle	%xcc,	%f26,	%f31
	sth	%i7,	[%l7 + 0x1E]
	edge32	%l4,	%i6,	%i0
	or	%o6,	%i3,	%o3
	nop
	set	0x30, %i5
	std	%f24,	[%l7 + %i5]
	fpsub16s	%f14,	%f11,	%f21
	movgu	%icc,	%o7,	%g6
	std	%f2,	[%l7 + 0x60]
	edge8	%g1,	%o1,	%g2
	addccc	%g3,	%g5,	%o4
	movrlz	%l3,	0x2A4,	%i1
	lduh	[%l7 + 0x2A],	%g4
	mova	%xcc,	%o5,	%l5
	fmovrdne	%l2,	%f16,	%f10
	udiv	%i2,	0x1235,	%l0
	sdivx	%o0,	0x0A2E,	%l6
	movrgz	%o2,	%l1,	%i4
	fmovrde	%g7,	%f14,	%f22
	stx	%i5,	[%l7 + 0x10]
	edge16l	%l4,	%i7,	%i6
	edge32l	%i0,	%i3,	%o3
	fmovrdlez	%o6,	%f8,	%f6
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fcmpgt16	%f30,	%f2,	%g2
	movrne	%o1,	0x28E,	%g3
	srlx	%o4,	%l3,	%g5
	smul	%i1,	0x0A48,	%o5
	ldd	[%l7 + 0x40],	%f14
	fxnors	%f8,	%f21,	%f1
	smulcc	%g4,	%l5,	%l2
	mulx	%i2,	%o0,	%l0
	mulx	%o2,	0x09E7,	%l6
	xorcc	%l1,	0x10DA,	%i4
	and	%g7,	0x06A0,	%i5
	sra	%l4,	0x0E,	%i7
	sllx	%i0,	0x11,	%i3
	umul	%o3,	%i6,	%o6
	fmovsg	%icc,	%f30,	%f13
	array16	%g6,	%g1,	%g2
	movneg	%icc,	%o1,	%o7
	fcmpgt32	%f10,	%f16,	%g3
	fzeros	%f23
	srlx	%l3,	0x10,	%g5
	smul	%i1,	%o5,	%g4
	sra	%o4,	%l5,	%l2
	fmovdneg	%icc,	%f16,	%f12
	umulcc	%o0,	%i2,	%o2
	std	%f24,	[%l7 + 0x50]
	movg	%xcc,	%l6,	%l0
	subccc	%i4,	%g7,	%l1
	edge8ln	%i5,	%l4,	%i7
	fsrc2s	%f7,	%f28
	edge16l	%i3,	%i0,	%o3
	xnor	%i6,	0x19BB,	%g6
	fornot1	%f0,	%f18,	%f28
	andn	%g1,	%o6,	%o1
	edge32l	%o7,	%g2,	%g3
	edge32	%g5,	%i1,	%l3
	fmovspos	%icc,	%f6,	%f5
	xorcc	%g4,	0x131A,	%o5
	lduw	[%l7 + 0x3C],	%l5
	fmovsg	%xcc,	%f5,	%f22
	edge8	%l2,	%o0,	%o4
	xor	%i2,	%o2,	%l6
	edge32	%i4,	%g7,	%l1
	movneg	%icc,	%i5,	%l0
	fmovsle	%xcc,	%f23,	%f13
	fxors	%f12,	%f25,	%f7
	ldub	[%l7 + 0x36],	%l4
	stx	%i7,	[%l7 + 0x28]
	fnot1s	%f29,	%f20
	subccc	%i0,	0x1C22,	%i3
	addcc	%i6,	0x0556,	%g6
	ldsb	[%l7 + 0x61],	%o3
	ldub	[%l7 + 0x2C],	%o6
	st	%f4,	[%l7 + 0x1C]
	edge16l	%o1,	%g1,	%g2
	alignaddr	%o7,	%g3,	%i1
	sdivcc	%l3,	0x1E52,	%g5
	popc	0x14FF,	%o5
	movle	%icc,	%l5,	%g4
	ldub	[%l7 + 0x77],	%l2
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%o4
	ldsw	[%l7 + 0x5C],	%o0
	fmuld8sux16	%f2,	%f6,	%f4
	movpos	%xcc,	%o2,	%i2
	st	%f20,	[%l7 + 0x14]
	stb	%i4,	[%l7 + 0x19]
	andncc	%l6,	%g7,	%l1
	movpos	%xcc,	%l0,	%i5
	movrlz	%i7,	%i0,	%l4
	fnegs	%f15,	%f8
	array8	%i3,	%g6,	%i6
	andn	%o6,	0x0B34,	%o3
	edge16n	%o1,	%g2,	%o7
	array32	%g3,	%i1,	%l3
	alignaddr	%g1,	%g5,	%o5
	sra	%g4,	%l5,	%l2
	nop
	set	0x74, %g5
	ldsw	[%l7 + %g5],	%o0
	ld	[%l7 + 0x18],	%f20
	umulcc	%o2,	0x15DB,	%i2
	fxors	%f22,	%f23,	%f29
	nop
	set	0x5D, %g6
	stb	%o4,	[%l7 + %g6]
	srax	%l6,	0x10,	%g7
	fornot2	%f30,	%f4,	%f8
	fandnot2	%f10,	%f6,	%f10
	sethi	0x1E77,	%l1
	ldsw	[%l7 + 0x68],	%l0
	ldub	[%l7 + 0x33],	%i4
	andcc	%i5,	%i0,	%i7
	sra	%l4,	%g6,	%i6
	fmovse	%xcc,	%f30,	%f21
	subccc	%i3,	0x01D4,	%o3
	fcmpeq16	%f30,	%f14,	%o1
	std	%f30,	[%l7 + 0x10]
	sub	%o6,	0x1B76,	%g2
	fexpand	%f9,	%f28
	subccc	%o7,	0x190C,	%i1
	sll	%l3,	0x07,	%g1
	movge	%xcc,	%g3,	%o5
	movcc	%xcc,	%g4,	%l5
	edge32l	%l2,	%g5,	%o0
	edge8l	%o2,	%o4,	%l6
	subccc	%i2,	%l1,	%l0
	edge16l	%i4,	%g7,	%i5
	stb	%i7,	[%l7 + 0x0F]
	orcc	%i0,	%l4,	%i6
	edge32ln	%g6,	%i3,	%o3
	movgu	%icc,	%o1,	%o6
	edge16l	%g2,	%i1,	%o7
	movgu	%xcc,	%g1,	%l3
	edge16n	%g3,	%g4,	%l5
	movrgz	%o5,	0x2C9,	%g5
	stx	%o0,	[%l7 + 0x68]
	umul	%l2,	%o2,	%l6
	ldsh	[%l7 + 0x34],	%o4
	fors	%f19,	%f1,	%f25
	umulcc	%l1,	%i2,	%i4
	movg	%xcc,	%l0,	%g7
	add	%i7,	%i5,	%l4
	movvc	%icc,	%i0,	%i6
	ld	[%l7 + 0x14],	%f12
	ldd	[%l7 + 0x78],	%g6
	fpack16	%f14,	%f4
	subcc	%i3,	0x1FE0,	%o3
	udivx	%o1,	0x14C1,	%g2
	lduw	[%l7 + 0x08],	%o6
	alignaddrl	%i1,	%g1,	%l3
	udivx	%o7,	0x1558,	%g4
	fmul8ulx16	%f24,	%f28,	%f24
	xorcc	%g3,	%o5,	%g5
	lduw	[%l7 + 0x1C],	%l5
	xorcc	%o0,	0x153D,	%l2
	fmovsne	%xcc,	%f14,	%f12
	movcc	%xcc,	%o2,	%o4
	ldsw	[%l7 + 0x30],	%l1
	alignaddr	%l6,	%i4,	%l0
	fmul8x16	%f10,	%f28,	%f28
	fmovdcc	%icc,	%f17,	%f11
	addccc	%g7,	%i7,	%i2
	edge8	%i5,	%l4,	%i0
	xnorcc	%g6,	0x11AA,	%i6
	sllx	%i3,	0x0E,	%o3
	fmovrse	%o1,	%f18,	%f13
	ldub	[%l7 + 0x77],	%g2
	edge8l	%o6,	%i1,	%g1
	udivx	%l3,	0x1093,	%g4
	st	%f28,	[%l7 + 0x74]
	orn	%o7,	%o5,	%g5
	ldx	[%l7 + 0x60],	%g3
	edge16	%l5,	%l2,	%o0
	movge	%xcc,	%o2,	%l1
	sdivcc	%o4,	0x1A87,	%i4
	movn	%icc,	%l0,	%l6
	movgu	%icc,	%i7,	%i2
	movle	%icc,	%i5,	%g7
	sth	%i0,	[%l7 + 0x6A]
	udiv	%l4,	0x1E61,	%i6
	movgu	%icc,	%i3,	%g6
	udivx	%o1,	0x0CE5,	%g2
	sll	%o6,	0x02,	%i1
	st	%f28,	[%l7 + 0x28]
	fones	%f23
	fmovrdlz	%o3,	%f22,	%f26
	umulcc	%l3,	0x12C5,	%g1
	save %o7, %o5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g5,	%l5,	%l2
	sdivcc	%o0,	0x0785,	%g3
	edge16n	%o2,	%o4,	%i4
	edge16n	%l0,	%l6,	%l1
	fandnot1s	%f25,	%f12,	%f19
	smul	%i7,	%i5,	%i2
	and	%g7,	%i0,	%i6
	addccc	%l4,	%i3,	%g6
	addc	%o1,	%o6,	%g2
	lduw	[%l7 + 0x08],	%o3
	stw	%i1,	[%l7 + 0x5C]
	fmul8x16	%f1,	%f22,	%f22
	sethi	0x0256,	%l3
	xorcc	%o7,	%g1,	%g4
	mulx	%o5,	0x1EDE,	%g5
	move	%icc,	%l5,	%o0
	edge32n	%g3,	%l2,	%o2
	fornot1	%f28,	%f16,	%f8
	edge32	%o4,	%l0,	%i4
	udiv	%l6,	0x0C07,	%l1
	add	%i7,	0x0CBD,	%i5
	std	%f8,	[%l7 + 0x78]
	fand	%f26,	%f22,	%f0
	addc	%g7,	%i2,	%i0
	andn	%l4,	%i3,	%g6
	fmovsa	%xcc,	%f18,	%f23
	umulcc	%i6,	0x10F0,	%o6
	srl	%o1,	%g2,	%i1
	sdiv	%o3,	0x1972,	%o7
	lduw	[%l7 + 0x68],	%l3
	edge8ln	%g1,	%o5,	%g5
	movl	%xcc,	%g4,	%o0
	edge8ln	%g3,	%l5,	%o2
	orn	%o4,	0x0E0E,	%l2
	edge8	%l0,	%l6,	%i4
	movne	%xcc,	%i7,	%i5
	udiv	%l1,	0x0ABC,	%i2
	edge16	%i0,	%l4,	%g7
	movle	%icc,	%g6,	%i6
	movrgz	%i3,	0x1F7,	%o1
	addccc	%g2,	0x0A55,	%o6
	movvs	%icc,	%o3,	%o7
	fmovscs	%icc,	%f16,	%f13
	xnorcc	%i1,	%l3,	%o5
	save %g1, %g5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g4,	%l5,	%g3
	fmovsleu	%icc,	%f22,	%f9
	movrgz	%o2,	%o4,	%l2
	and	%l0,	0x060A,	%i4
	orn	%l6,	%i5,	%l1
	xnor	%i7,	%i2,	%l4
	ld	[%l7 + 0x54],	%f15
	ld	[%l7 + 0x4C],	%f17
	orcc	%i0,	0x0F9F,	%g6
	subccc	%i6,	0x01A0,	%i3
	smul	%o1,	0x0674,	%g2
	siam	0x0
	movcc	%icc,	%g7,	%o6
	add	%o7,	0x1504,	%i1
	srl	%l3,	0x15,	%o3
	restore %o5, %g1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o0,	%l5,	%g3
	std	%f12,	[%l7 + 0x20]
	edge8ln	%o2,	%o4,	%l2
	ldub	[%l7 + 0x45],	%l0
	andncc	%g4,	%i4,	%i5
	addcc	%l1,	0x0CA6,	%l6
	sub	%i2,	%i7,	%l4
	fmovdn	%icc,	%f23,	%f14
	movvc	%icc,	%g6,	%i0
	ldd	[%l7 + 0x08],	%f22
	fmovsvs	%xcc,	%f8,	%f10
	edge8ln	%i6,	%i3,	%o1
	popc	0x1FB2,	%g7
	fmovrslz	%g2,	%f13,	%f17
	udivx	%o7,	0x0618,	%i1
	ldsb	[%l7 + 0x08],	%o6
	stw	%o3,	[%l7 + 0x14]
	fnors	%f25,	%f21,	%f0
	udiv	%o5,	0x0A3C,	%l3
	andncc	%g1,	%o0,	%g5
	lduw	[%l7 + 0x74],	%g3
	pdist	%f0,	%f14,	%f0
	lduw	[%l7 + 0x60],	%l5
	srax	%o4,	0x19,	%o2
	movcc	%icc,	%l2,	%g4
	nop
	set	0x10, %g3
	stx	%l0,	[%l7 + %g3]
	andn	%i4,	0x0AB6,	%i5
	fmovse	%icc,	%f10,	%f19
	or	%l6,	0x0867,	%i2
	orcc	%l1,	0x11DA,	%i7
	nop
	set	0x50, %l2
	ldx	[%l7 + %l2],	%g6
	fsrc1	%f22,	%f10
	movvc	%xcc,	%i0,	%l4
	sdivcc	%i6,	0x02B3,	%i3
	srax	%o1,	0x10,	%g7
	fcmps	%fcc2,	%f28,	%f25
	movrlez	%o7,	%g2,	%o6
	fabsd	%f28,	%f26
	sethi	0x14A6,	%i1
	edge8ln	%o3,	%l3,	%o5
	fzeros	%f1
	ldd	[%l7 + 0x70],	%f4
	fnot1s	%f24,	%f20
	ldd	[%l7 + 0x68],	%g0
	xorcc	%g5,	0x19A3,	%o0
	array8	%l5,	%g3,	%o4
	std	%f22,	[%l7 + 0x38]
	fmovdg	%icc,	%f10,	%f15
	addc	%o2,	%g4,	%l0
	fornot2s	%f4,	%f3,	%f15
	edge32l	%i4,	%i5,	%l2
	ldd	[%l7 + 0x40],	%i2
	sethi	0x077D,	%l1
	fxors	%f31,	%f18,	%f15
	fmovdvc	%xcc,	%f22,	%f24
	fmovdvs	%xcc,	%f11,	%f12
	fandnot1	%f4,	%f12,	%f20
	std	%f2,	[%l7 + 0x10]
	sra	%i7,	%l6,	%g6
	andncc	%l4,	%i6,	%i0
	xor	%o1,	%g7,	%o7
	xnorcc	%g2,	0x0F10,	%i3
	movl	%xcc,	%o6,	%i1
	subccc	%l3,	%o5,	%o3
	array32	%g1,	%g5,	%l5
	fpadd32s	%f3,	%f5,	%f31
	fmovsl	%icc,	%f10,	%f26
	fornot2s	%f24,	%f28,	%f3
	fpackfix	%f30,	%f16
	sth	%o0,	[%l7 + 0x20]
	movrgez	%g3,	0x2E1,	%o2
	stb	%g4,	[%l7 + 0x0A]
	or	%l0,	%o4,	%i5
	subc	%l2,	%i2,	%l1
	edge8ln	%i7,	%l6,	%i4
	movvs	%xcc,	%l4,	%i6
	ldx	[%l7 + 0x48],	%i0
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	edge32n	%g2,	%i3,	%o6
	movvc	%xcc,	%i1,	%o7
	umulcc	%l3,	0x0663,	%o5
	orcc	%g1,	0x1BA3,	%g5
	movleu	%xcc,	%o3,	%o0
	fnot2	%f16,	%f30
	smul	%g3,	%l5,	%o2
	fmovrsgz	%l0,	%f26,	%f13
	mulscc	%o4,	%g4,	%i5
	subccc	%l2,	%l1,	%i2
	fzeros	%f10
	ld	[%l7 + 0x5C],	%f28
	movneg	%xcc,	%l6,	%i4
	movre	%l4,	0x07A,	%i6
	movge	%xcc,	%i7,	%i0
	ld	[%l7 + 0x54],	%f8
	sir	0x0DD7
	fcmps	%fcc3,	%f16,	%f12
	movn	%icc,	%g6,	%o1
	andcc	%g7,	0x1C49,	%i3
	movn	%xcc,	%o6,	%g2
	ldx	[%l7 + 0x40],	%o7
	movrlz	%l3,	%i1,	%g1
	edge16l	%o5,	%o3,	%o0
	edge8n	%g3,	%l5,	%g5
	addcc	%l0,	0x1987,	%o2
	fmovsvs	%xcc,	%f8,	%f10
	movneg	%icc,	%g4,	%o4
	andncc	%i5,	%l2,	%l1
	orcc	%l6,	0x176F,	%i4
	addc	%l4,	%i6,	%i7
	umulcc	%i2,	%g6,	%i0
	sub	%g7,	0x0F7A,	%i3
	array16	%o6,	%o1,	%g2
	andn	%o7,	%i1,	%g1
	movneg	%icc,	%o5,	%o3
	edge32	%o0,	%l3,	%g3
	srax	%g5,	%l5,	%l0
	fmovdvc	%icc,	%f14,	%f6
	xnor	%g4,	%o2,	%i5
	movneg	%icc,	%o4,	%l2
	mova	%xcc,	%l6,	%l1
	andcc	%l4,	0x127B,	%i4
	edge32	%i6,	%i2,	%i7
	add	%i0,	0x1EF0,	%g6
	edge8	%i3,	%o6,	%g7
	ld	[%l7 + 0x08],	%f26
	udivcc	%g2,	0x0B3E,	%o1
	movleu	%xcc,	%o7,	%g1
	movneg	%icc,	%i1,	%o5
	ldsh	[%l7 + 0x56],	%o3
	movpos	%xcc,	%o0,	%l3
	fxor	%f8,	%f0,	%f2
	fpackfix	%f18,	%f25
	addccc	%g3,	%g5,	%l0
	addccc	%l5,	0x1138,	%g4
	addccc	%i5,	0x1558,	%o2
	fxnors	%f24,	%f29,	%f12
	fmul8sux16	%f12,	%f24,	%f30
	ldsw	[%l7 + 0x50],	%o4
	xor	%l6,	%l2,	%l4
	udiv	%l1,	0x10E6,	%i4
	nop
	set	0x68, %i2
	stx	%i6,	[%l7 + %i2]
	stb	%i7,	[%l7 + 0x11]
	move	%icc,	%i0,	%i2
	fcmple16	%f22,	%f16,	%g6
	mulx	%i3,	%o6,	%g7
	save %g2, %o1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%icc,	%f3,	%f21
	orcc	%i1,	0x0ACA,	%o5
	fmovrdlz	%o7,	%f6,	%f28
	lduh	[%l7 + 0x72],	%o3
	save %o0, %g3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f25,	%f2,	%f8
	smul	%l3,	%l5,	%l0
	srl	%i5,	0x1C,	%o2
	mova	%icc,	%o4,	%l6
	fmovsn	%icc,	%f4,	%f9
	stx	%g4,	[%l7 + 0x38]
	fpackfix	%f8,	%f3
	movrlz	%l4,	0x243,	%l2
	movl	%icc,	%i4,	%l1
	fpadd16	%f4,	%f6,	%f0
	sllx	%i6,	%i7,	%i2
	stx	%g6,	[%l7 + 0x48]
	movne	%icc,	%i3,	%o6
	std	%f12,	[%l7 + 0x30]
	movrlz	%g7,	%i0,	%o1
	lduh	[%l7 + 0x2E],	%g2
	movvs	%icc,	%i1,	%o5
	sdiv	%g1,	0x11B5,	%o3
	fmovrsgez	%o7,	%f23,	%f5
	sdivcc	%g3,	0x0714,	%g5
	subcc	%o0,	%l5,	%l0
	or	%i5,	0x0ADA,	%l3
	andn	%o2,	0x0399,	%o4
	add	%g4,	%l6,	%l2
	lduh	[%l7 + 0x0E],	%l4
	fpadd16s	%f20,	%f10,	%f26
	edge8	%i4,	%l1,	%i6
	ld	[%l7 + 0x0C],	%f5
	ldsb	[%l7 + 0x51],	%i7
	edge32l	%i2,	%i3,	%g6
	umulcc	%o6,	0x00A3,	%g7
	save %o1, 0x0AC9, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g2,	%o5,	%g1
	mova	%icc,	%i1,	%o7
	movne	%xcc,	%o3,	%g5
	stb	%g3,	[%l7 + 0x5F]
	fmovrslez	%l5,	%f28,	%f19
	subc	%l0,	%i5,	%o0
	xnorcc	%l3,	%o2,	%g4
	save %l6, %l2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%o4,	%i4
	umulcc	%i6,	0x1257,	%l1
	mulscc	%i7,	0x1D39,	%i2
	sll	%i3,	0x06,	%g6
	lduh	[%l7 + 0x60],	%g7
	edge32n	%o1,	%o6,	%g2
	ld	[%l7 + 0x08],	%f30
	movle	%xcc,	%i0,	%g1
	or	%i1,	%o5,	%o7
	movrlz	%g5,	0x12A,	%g3
	subccc	%l5,	0x07C1,	%l0
	movcc	%xcc,	%i5,	%o0
	fornot1s	%f29,	%f19,	%f16
	umulcc	%l3,	%o2,	%o3
	srl	%g4,	0x0C,	%l2
	movre	%l4,	0x0F4,	%l6
	or	%o4,	0x01B9,	%i4
	fmovdge	%xcc,	%f28,	%f5
	add	%i6,	0x0E63,	%i7
	fcmpgt32	%f8,	%f26,	%l1
	movg	%xcc,	%i3,	%i2
	movrgz	%g6,	0x041,	%g7
	srlx	%o1,	0x13,	%g2
	fmovse	%xcc,	%f5,	%f24
	movvs	%xcc,	%i0,	%o6
	sdivx	%i1,	0x0493,	%g1
	fmovdne	%xcc,	%f13,	%f4
	edge16	%o7,	%g5,	%o5
	movrgez	%g3,	0x031,	%l5
	move	%xcc,	%i5,	%o0
	movrgz	%l3,	0x1F2,	%o2
	movneg	%xcc,	%o3,	%l0
	ldd	[%l7 + 0x50],	%f2
	srlx	%g4,	%l4,	%l6
	edge8ln	%o4,	%l2,	%i6
	fmovsg	%icc,	%f21,	%f22
	edge32n	%i4,	%i7,	%i3
	sub	%l1,	%g6,	%g7
	fmovsgu	%xcc,	%f26,	%f5
	array32	%i2,	%g2,	%o1
	edge16n	%i0,	%i1,	%o6
	ld	[%l7 + 0x18],	%f19
	mulx	%g1,	0x1DF3,	%g5
	movleu	%xcc,	%o5,	%g3
	movne	%icc,	%o7,	%i5
	fornot2s	%f1,	%f29,	%f26
	fmul8x16	%f19,	%f20,	%f14
	and	%o0,	%l3,	%l5
	xor	%o3,	0x0FF2,	%l0
	xor	%g4,	%l4,	%o2
	fmovsvs	%xcc,	%f22,	%f26
	ldd	[%l7 + 0x40],	%f12
	orncc	%o4,	%l6,	%i6
	fmovdgu	%xcc,	%f26,	%f12
	ldsw	[%l7 + 0x58],	%i4
	sra	%i7,	%i3,	%l1
	edge32l	%l2,	%g7,	%g6
	andncc	%g2,	%i2,	%o1
	array32	%i0,	%i1,	%g1
	ldsw	[%l7 + 0x50],	%o6
	fnor	%f4,	%f16,	%f24
	srl	%o5,	%g5,	%o7
	and	%i5,	0x1C32,	%g3
	sir	0x1F2C
	movrlz	%l3,	%o0,	%l5
	udiv	%o3,	0x172E,	%g4
	orcc	%l4,	0x0AC7,	%l0
	sra	%o2,	%l6,	%o4
	ldd	[%l7 + 0x68],	%f22
	umul	%i6,	%i4,	%i3
	movvs	%xcc,	%i7,	%l1
	edge8ln	%g7,	%g6,	%g2
	ldx	[%l7 + 0x18],	%i2
	array16	%l2,	%i0,	%o1
	array16	%i1,	%g1,	%o6
	ld	[%l7 + 0x14],	%f16
	edge32	%o5,	%o7,	%i5
	fmovdvs	%icc,	%f4,	%f21
	sdivcc	%g5,	0x1D87,	%l3
	sllx	%o0,	0x12,	%l5
	udivx	%g3,	0x192A,	%g4
	edge32	%o3,	%l4,	%o2
	srl	%l6,	0x0B,	%o4
	alignaddrl	%i6,	%i4,	%i3
	movg	%icc,	%i7,	%l0
	andn	%l1,	0x1A1F,	%g6
	add	%g7,	0x137B,	%g2
	ldsw	[%l7 + 0x40],	%l2
	edge32n	%i2,	%o1,	%i0
	xorcc	%i1,	0x094B,	%g1
	ldsb	[%l7 + 0x70],	%o6
	movcc	%icc,	%o7,	%i5
	popc	%o5,	%l3
	mulscc	%o0,	%l5,	%g5
	fcmpgt32	%f0,	%f6,	%g4
	popc	0x155F,	%o3
	orn	%g3,	0x03B5,	%l4
	andn	%l6,	%o2,	%o4
	andcc	%i4,	%i6,	%i7
	std	%f12,	[%l7 + 0x08]
	andcc	%l0,	0x0A47,	%l1
	umulcc	%g6,	%g7,	%g2
	edge32l	%l2,	%i3,	%i2
	fmovdl	%xcc,	%f27,	%f30
	array8	%i0,	%o1,	%g1
	subc	%i1,	0x1FB8,	%o7
	ldd	[%l7 + 0x70],	%i4
	fmovrdne	%o6,	%f0,	%f0
	fmovse	%icc,	%f16,	%f11
	fcmpne16	%f26,	%f0,	%o5
	orn	%l3,	%o0,	%l5
	sethi	0x1FD9,	%g4
	sethi	0x0167,	%g5
	movrlz	%g3,	%o3,	%l6
	movneg	%xcc,	%o2,	%l4
	subcc	%o4,	%i6,	%i4
	addcc	%l0,	%l1,	%g6
	sllx	%i7,	%g2,	%l2
	orncc	%g7,	0x18FE,	%i2
	ldd	[%l7 + 0x58],	%f2
	movle	%xcc,	%i3,	%i0
	sethi	0x1F66,	%o1
	fmuld8sux16	%f25,	%f15,	%f6
	srax	%i1,	%g1,	%o7
	subccc	%o6,	%i5,	%l3
	nop
	set	0x4F, %g7
	stb	%o5,	[%l7 + %g7]
	fpsub32	%f10,	%f0,	%f24
	save %l5, 0x069B, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g4,	%g5
	alignaddrl	%g3,	%l6,	%o3
	sth	%o2,	[%l7 + 0x7C]
	add	%o4,	%l4,	%i6
	ldsh	[%l7 + 0x0A],	%l0
	andcc	%i4,	%g6,	%i7
	stx	%g2,	[%l7 + 0x10]
	fmovsne	%icc,	%f10,	%f13
	restore %l1, %g7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i3,	0x11,	%i2
	addc	%i0,	0x155E,	%i1
	ldd	[%l7 + 0x48],	%o0
	fmovrsne	%o7,	%f25,	%f16
	andncc	%g1,	%o6,	%i5
	edge8ln	%o5,	%l5,	%o0
	edge16	%g4,	%g5,	%l3
	srax	%g3,	0x13,	%o3
	mulscc	%l6,	%o2,	%o4
	ldx	[%l7 + 0x48],	%i6
	ldd	[%l7 + 0x28],	%f0
	subcc	%l0,	%i4,	%g6
	and	%l4,	%g2,	%l1
	fmovsneg	%icc,	%f12,	%f15
	edge16	%g7,	%i7,	%l2
	fmovsa	%xcc,	%f21,	%f17
	fsrc2s	%f17,	%f5
	fmovdle	%xcc,	%f2,	%f30
	alignaddrl	%i3,	%i2,	%i1
	sll	%o1,	%i0,	%g1
	fands	%f29,	%f9,	%f25
	array32	%o7,	%o6,	%o5
	sra	%i5,	0x07,	%l5
	movrne	%o0,	0x33E,	%g5
	edge32n	%l3,	%g4,	%g3
	edge16n	%l6,	%o2,	%o3
	fmovdle	%xcc,	%f27,	%f14
	fmovde	%icc,	%f30,	%f14
	sdiv	%i6,	0x14C5,	%l0
	ldub	[%l7 + 0x41],	%i4
	fpsub32	%f26,	%f0,	%f20
	srlx	%g6,	%l4,	%o4
	andncc	%l1,	%g2,	%i7
	sth	%g7,	[%l7 + 0x20]
	sethi	0x1F1F,	%i3
	edge16	%l2,	%i1,	%i2
	xnorcc	%i0,	%g1,	%o1
	movrgz	%o6,	%o7,	%i5
	srl	%o5,	0x15,	%o0
	sth	%g5,	[%l7 + 0x50]
	edge32	%l3,	%g4,	%g3
	sth	%l5,	[%l7 + 0x72]
	sub	%o2,	%o3,	%l6
	sll	%l0,	0x0C,	%i6
	mulscc	%i4,	%g6,	%o4
	stw	%l4,	[%l7 + 0x5C]
	array32	%g2,	%i7,	%g7
	mulscc	%i3,	0x0E2F,	%l1
	mulx	%l2,	%i1,	%i0
	ldd	[%l7 + 0x30],	%f28
	sdiv	%g1,	0x1819,	%o1
	movne	%icc,	%o6,	%i2
	edge8ln	%o7,	%o5,	%o0
	fabsd	%f24,	%f18
	fmovdpos	%xcc,	%f13,	%f20
	edge32n	%g5,	%l3,	%g4
	movge	%xcc,	%i5,	%g3
	fmovdgu	%icc,	%f18,	%f6
	movg	%icc,	%l5,	%o3
	sir	0x15D2
	movleu	%xcc,	%o2,	%l0
	fpsub32s	%f22,	%f9,	%f12
	srax	%l6,	%i4,	%g6
	andncc	%o4,	%i6,	%g2
	fmovsg	%xcc,	%f21,	%f20
	fmovsneg	%icc,	%f11,	%f11
	fmovrse	%l4,	%f23,	%f5
	stb	%g7,	[%l7 + 0x2C]
	alignaddrl	%i3,	%i7,	%l2
	fmovsleu	%icc,	%f2,	%f15
	movrgz	%i1,	%i0,	%l1
	ldd	[%l7 + 0x10],	%f30
	edge16	%o1,	%g1,	%i2
	movrgez	%o6,	%o5,	%o0
	fmovscs	%xcc,	%f26,	%f5
	edge16n	%g5,	%l3,	%o7
	edge16	%i5,	%g3,	%g4
	fmovse	%icc,	%f14,	%f18
	edge16ln	%l5,	%o3,	%l0
	sdiv	%o2,	0x07C2,	%l6
	movrgz	%i4,	%o4,	%g6
	nop
	set	0x09, %i6
	stb	%g2,	[%l7 + %i6]
	movge	%icc,	%i6,	%l4
	fpadd32s	%f11,	%f31,	%f13
	mova	%xcc,	%i3,	%i7
	ldsw	[%l7 + 0x3C],	%g7
	add	%l2,	%i1,	%i0
	sdiv	%o1,	0x0552,	%l1
	movne	%icc,	%g1,	%o6
	mova	%xcc,	%i2,	%o5
	edge8ln	%o0,	%g5,	%o7
	fmovdcs	%icc,	%f0,	%f27
	fmuld8sux16	%f11,	%f25,	%f16
	addc	%l3,	0x1A8C,	%i5
	array8	%g4,	%g3,	%l5
	stx	%l0,	[%l7 + 0x68]
	movneg	%icc,	%o2,	%l6
	fpack16	%f16,	%f7
	orn	%i4,	0x1B0F,	%o4
	fnegs	%f1,	%f3
	xorcc	%o3,	%g2,	%i6
	addccc	%g6,	%i3,	%i7
	mulscc	%l4,	0x07BC,	%g7
	edge8	%i1,	%i0,	%l2
	sllx	%o1,	%l1,	%o6
	fsrc2s	%f22,	%f10
	fandnot1s	%f11,	%f21,	%f8
	fmovsgu	%icc,	%f28,	%f20
	movn	%xcc,	%i2,	%g1
	array16	%o5,	%g5,	%o0
	srax	%l3,	%i5,	%o7
	smulcc	%g4,	%g3,	%l5
	movcs	%icc,	%l0,	%l6
	fmul8x16	%f7,	%f4,	%f14
	xnor	%i4,	%o2,	%o3
	lduw	[%l7 + 0x58],	%o4
	ldd	[%l7 + 0x60],	%g2
	edge16ln	%g6,	%i3,	%i7
	stb	%l4,	[%l7 + 0x5C]
	sll	%i6,	%g7,	%i1
	movn	%xcc,	%i0,	%l2
	edge32n	%o1,	%l1,	%i2
	edge32n	%o6,	%o5,	%g5
	xorcc	%g1,	0x147E,	%l3
	smul	%o0,	0x0039,	%o7
	edge32	%g4,	%i5,	%l5
	fmul8x16	%f9,	%f0,	%f22
	save %g3, %l6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x3C],	%l0
	fnegs	%f13,	%f5
	ld	[%l7 + 0x10],	%f13
	sdivx	%o3,	0x1BBF,	%o2
	fnot1s	%f9,	%f2
	fcmps	%fcc1,	%f12,	%f30
	xnorcc	%o4,	%g6,	%g2
	add	%i3,	%i7,	%i6
	srl	%g7,	%l4,	%i1
	srlx	%i0,	0x16,	%l2
	smul	%o1,	%i2,	%o6
	fpackfix	%f16,	%f17
	movle	%icc,	%o5,	%g5
	mulx	%l1,	%g1,	%o0
	fmovsvc	%xcc,	%f12,	%f11
	nop
	set	0x67, %o2
	stb	%o7,	[%l7 + %o2]
	udivcc	%l3,	0x0807,	%i5
	movneg	%xcc,	%g4,	%g3
	array32	%l6,	%l5,	%i4
	st	%f30,	[%l7 + 0x4C]
	fmovdvc	%icc,	%f5,	%f26
	movrgez	%o3,	0x3FD,	%o2
	fornot2	%f10,	%f18,	%f30
	fnor	%f30,	%f12,	%f24
	subccc	%l0,	0x1896,	%o4
	sdivx	%g6,	0x00C2,	%i3
	ldsw	[%l7 + 0x44],	%g2
	udivcc	%i6,	0x1B1F,	%i7
	sethi	0x084B,	%l4
	ld	[%l7 + 0x08],	%f10
	movrgz	%i1,	0x39B,	%i0
	movrgez	%l2,	0x16D,	%g7
	fmovrse	%o1,	%f22,	%f1
	edge32ln	%o6,	%i2,	%g5
	edge16n	%o5,	%g1,	%l1
	edge32ln	%o7,	%o0,	%i5
	sra	%g4,	%l3,	%l6
	fpadd32	%f10,	%f4,	%f24
	movle	%icc,	%l5,	%g3
	movne	%xcc,	%i4,	%o2
	addcc	%l0,	%o4,	%o3
	fabsd	%f22,	%f4
	mova	%icc,	%g6,	%g2
	sub	%i6,	%i3,	%i7
	movne	%icc,	%i1,	%i0
	popc	0x1267,	%l2
	fpadd16s	%f8,	%f22,	%f0
	stb	%l4,	[%l7 + 0x27]
	edge16l	%g7,	%o6,	%o1
	sll	%i2,	0x07,	%g5
	ldsb	[%l7 + 0x4E],	%o5
	addc	%l1,	%o7,	%g1
	orn	%o0,	%i5,	%g4
	xorcc	%l3,	0x0AA7,	%l6
	stx	%l5,	[%l7 + 0x10]
	fmovdgu	%icc,	%f10,	%f9
	orncc	%i4,	%g3,	%o2
	or	%o4,	%l0,	%o3
	ldub	[%l7 + 0x0C],	%g2
	sra	%g6,	%i3,	%i6
	ldd	[%l7 + 0x58],	%f8
	movpos	%icc,	%i7,	%i1
	movvc	%icc,	%l2,	%i0
	ldub	[%l7 + 0x41],	%l4
	alignaddrl	%g7,	%o6,	%i2
	fandnot1	%f8,	%f20,	%f24
	sll	%g5,	0x1B,	%o5
	xnor	%o1,	0x089C,	%o7
	srl	%l1,	%g1,	%i5
	fmovsvs	%xcc,	%f22,	%f19
	fmovsl	%icc,	%f11,	%f31
	movgu	%xcc,	%g4,	%l3
	ldx	[%l7 + 0x50],	%o0
	fexpand	%f24,	%f18
	sdivcc	%l6,	0x1367,	%i4
	fone	%f28
	ldd	[%l7 + 0x50],	%f28
	movvc	%xcc,	%l5,	%g3
	fpadd32s	%f19,	%f22,	%f11
	array8	%o4,	%l0,	%o2
	fmovsvc	%xcc,	%f15,	%f14
	movge	%icc,	%o3,	%g2
	edge8n	%g6,	%i3,	%i6
	fmovrdlz	%i1,	%f10,	%f18
	fcmpeq32	%f28,	%f8,	%l2
	alignaddrl	%i0,	%i7,	%l4
	movrne	%o6,	0x33A,	%i2
	sethi	0x1FD0,	%g7
	sth	%o5,	[%l7 + 0x4E]
	movcs	%xcc,	%g5,	%o1
	udivcc	%o7,	0x046A,	%g1
	array32	%l1,	%i5,	%g4
	alignaddr	%l3,	%l6,	%o0
	udiv	%l5,	0x11A8,	%i4
	move	%icc,	%o4,	%g3
	mulx	%l0,	0x1629,	%o3
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	orcc	%g2,	%i6,	%i1
	subcc	%i3,	%i0,	%l2
	array8	%i7,	%o6,	%l4
	faligndata	%f12,	%f12,	%f20
	ld	[%l7 + 0x2C],	%f11
	edge32	%i2,	%o5,	%g7
	subccc	%o1,	0x0DA0,	%o7
	movpos	%icc,	%g5,	%l1
	edge16n	%g1,	%i5,	%l3
	fmovrdlz	%l6,	%f30,	%f6
	orcc	%g4,	0x0AF9,	%o0
	add	%i4,	%o4,	%g3
	movne	%xcc,	%l0,	%o3
	fmovdg	%xcc,	%f20,	%f1
	fpadd16s	%f11,	%f15,	%f27
	ldx	[%l7 + 0x08],	%l5
	mova	%xcc,	%o2,	%g6
	xor	%g2,	0x0616,	%i1
	alignaddrl	%i6,	%i0,	%l2
	ld	[%l7 + 0x20],	%f12
	array8	%i3,	%o6,	%l4
	sethi	0x027A,	%i7
	alignaddr	%o5,	%i2,	%g7
	edge8	%o7,	%g5,	%l1
	ld	[%l7 + 0x30],	%f10
	fpack16	%f14,	%f29
	ldsh	[%l7 + 0x38],	%o1
	xnorcc	%g1,	%i5,	%l3
	or	%l6,	%g4,	%i4
	udivx	%o0,	0x1780,	%o4
	andcc	%g3,	%l0,	%o3
	fmuld8ulx16	%f17,	%f23,	%f26
	sra	%o2,	0x08,	%l5
	movn	%xcc,	%g6,	%g2
	popc	0x0069,	%i1
	addcc	%i0,	0x0E31,	%l2
	edge32ln	%i6,	%i3,	%l4
	mulx	%i7,	0x1253,	%o5
	orncc	%o6,	%g7,	%i2
	movvs	%xcc,	%o7,	%l1
	fmovdcc	%icc,	%f25,	%f27
	fxors	%f25,	%f20,	%f23
	fcmps	%fcc0,	%f4,	%f23
	edge16	%g5,	%o1,	%i5
	alignaddrl	%g1,	%l3,	%g4
	fxors	%f25,	%f14,	%f21
	sdiv	%i4,	0x17A9,	%o0
	movl	%xcc,	%o4,	%g3
	edge8l	%l6,	%o3,	%l0
	st	%f28,	[%l7 + 0x6C]
	srax	%o2,	%l5,	%g6
	movrlz	%i1,	%i0,	%l2
	fnegs	%f24,	%f26
	movrgez	%i6,	%g2,	%l4
	ldsw	[%l7 + 0x0C],	%i3
	movneg	%xcc,	%i7,	%o6
	fmovdg	%icc,	%f28,	%f16
	fmovde	%icc,	%f13,	%f20
	st	%f16,	[%l7 + 0x60]
	fabss	%f26,	%f8
	movrlz	%o5,	%g7,	%o7
	edge16n	%l1,	%g5,	%i2
	movrgez	%i5,	0x212,	%o1
	sir	0x09DE
	fmovscs	%xcc,	%f6,	%f2
	add	%g1,	%l3,	%i4
	sllx	%o0,	%o4,	%g4
	fmuld8ulx16	%f21,	%f29,	%f2
	movl	%xcc,	%l6,	%g3
	stx	%o3,	[%l7 + 0x18]
	subccc	%o2,	0x00BE,	%l5
	lduw	[%l7 + 0x60],	%g6
	nop
	set	0x5C, %g1
	sth	%i1,	[%l7 + %g1]
	movneg	%icc,	%i0,	%l0
	movg	%icc,	%i6,	%g2
	edge32	%l2,	%i3,	%l4
	movcc	%xcc,	%o6,	%i7
	udiv	%g7,	0x0168,	%o5
	fmovsle	%xcc,	%f14,	%f20
	fpack16	%f16,	%f18
	andncc	%o7,	%l1,	%i2
	addcc	%i5,	0x15C5,	%g5
	ldsh	[%l7 + 0x1C],	%o1
	movrne	%l3,	0x2F4,	%g1
	move	%icc,	%o0,	%o4
	subc	%i4,	%g4,	%l6
	mulscc	%g3,	0x06F7,	%o3
	xorcc	%o2,	%g6,	%i1
	movn	%icc,	%l5,	%i0
	xnorcc	%l0,	%i6,	%l2
	fnors	%f24,	%f16,	%f12
	fmovrsne	%g2,	%f8,	%f8
	fpack16	%f4,	%f3
	edge32ln	%i3,	%o6,	%i7
	ldsh	[%l7 + 0x0A],	%g7
	lduw	[%l7 + 0x3C],	%o5
	sllx	%o7,	0x07,	%l1
	fnegs	%f4,	%f12
	add	%l4,	0x152E,	%i2
	lduh	[%l7 + 0x54],	%i5
	smul	%g5,	%o1,	%l3
	fmovsleu	%icc,	%f5,	%f23
	movleu	%xcc,	%g1,	%o0
	srlx	%i4,	%o4,	%l6
	add	%g3,	0x0DDF,	%g4
	sub	%o2,	%g6,	%o3
	fnot2	%f22,	%f8
	movrgz	%i1,	%l5,	%i0
	movvs	%xcc,	%l0,	%l2
	xorcc	%g2,	0x07EA,	%i6
	movrlez	%i3,	0x29B,	%i7
	fmuld8sux16	%f21,	%f29,	%f30
	smul	%g7,	%o6,	%o5
	srl	%l1,	0x18,	%l4
	fzeros	%f0
	sllx	%i2,	%i5,	%g5
	sllx	%o7,	0x07,	%l3
	std	%f26,	[%l7 + 0x50]
	fmovrse	%o1,	%f1,	%f27
	movn	%xcc,	%g1,	%o0
	fmovdvc	%xcc,	%f8,	%f26
	alignaddr	%i4,	%l6,	%g3
	addc	%o4,	%o2,	%g4
	movcs	%xcc,	%o3,	%i1
	movge	%icc,	%g6,	%l5
	sethi	0x1676,	%i0
	stw	%l0,	[%l7 + 0x6C]
	movcc	%icc,	%l2,	%i6
	srlx	%i3,	%i7,	%g7
	lduw	[%l7 + 0x48],	%o6
	lduw	[%l7 + 0x20],	%g2
	movvc	%xcc,	%l1,	%l4
	udiv	%o5,	0x16EE,	%i5
	movn	%icc,	%g5,	%i2
	edge8ln	%o7,	%l3,	%o1
	movrgz	%g1,	%i4,	%l6
	movre	%g3,	%o0,	%o4
	movrgz	%o2,	0x07F,	%g4
	and	%i1,	0x1E91,	%o3
	sllx	%l5,	0x15,	%i0
	alignaddr	%g6,	%l2,	%l0
	move	%xcc,	%i3,	%i7
	fmovrslez	%g7,	%f27,	%f15
	fpadd16s	%f6,	%f10,	%f1
	edge8ln	%i6,	%g2,	%l1
	ldsw	[%l7 + 0x64],	%o6
	edge32l	%l4,	%i5,	%o5
	fmovsne	%icc,	%f13,	%f23
	fmovdpos	%xcc,	%f29,	%f8
	fxnor	%f0,	%f28,	%f8
	movrlez	%g5,	%o7,	%i2
	mulx	%o1,	%l3,	%g1
	fandnot2	%f22,	%f18,	%f24
	movvs	%xcc,	%l6,	%i4
	movvs	%xcc,	%o0,	%o4
	alignaddrl	%g3,	%o2,	%g4
	lduh	[%l7 + 0x78],	%o3
	umulcc	%l5,	0x1627,	%i0
	xorcc	%g6,	%l2,	%l0
	subc	%i1,	0x01DF,	%i3
	subc	%g7,	0x077F,	%i6
	alignaddrl	%i7,	%l1,	%o6
	andcc	%g2,	%l4,	%o5
	save %i5, %g5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o1,	%l3,	%i2
	edge16l	%g1,	%i4,	%l6
	movge	%xcc,	%o0,	%o4
	fabss	%f23,	%f6
	ldsh	[%l7 + 0x6C],	%o2
	addc	%g4,	%g3,	%l5
	sllx	%o3,	0x0B,	%i0
	movvs	%icc,	%l2,	%l0
	nop
	set	0x7A, %i0
	sth	%i1,	[%l7 + %i0]
	ldd	[%l7 + 0x28],	%g6
	ldsh	[%l7 + 0x36],	%i3
	umulcc	%i6,	0x08CA,	%i7
	smul	%g7,	%o6,	%g2
	edge16l	%l1,	%l4,	%o5
	array8	%i5,	%o7,	%g5
	movneg	%icc,	%o1,	%i2
	movne	%icc,	%l3,	%i4
	fmovd	%f24,	%f28
	ldsh	[%l7 + 0x36],	%l6
	edge8n	%o0,	%g1,	%o4
	alignaddrl	%o2,	%g3,	%l5
	fmovdneg	%icc,	%f4,	%f13
	addcc	%g4,	%o3,	%l2
	umul	%l0,	%i0,	%i1
	lduh	[%l7 + 0x1A],	%i3
	sllx	%g6,	%i6,	%i7
	addccc	%g7,	%o6,	%g2
	orcc	%l1,	0x1771,	%l4
	xnor	%o5,	%o7,	%g5
	srax	%o1,	%i5,	%l3
	umul	%i2,	0x19CC,	%l6
	std	%f26,	[%l7 + 0x70]
	fcmpeq32	%f0,	%f24,	%i4
	addccc	%g1,	%o0,	%o4
	alignaddr	%g3,	%l5,	%o2
	ldsb	[%l7 + 0x3F],	%o3
	edge32n	%g4,	%l2,	%l0
	fcmpd	%fcc0,	%f28,	%f30
	movg	%xcc,	%i1,	%i0
	stx	%i3,	[%l7 + 0x40]
	movcs	%icc,	%i6,	%i7
	edge16ln	%g7,	%o6,	%g2
	sth	%l1,	[%l7 + 0x52]
	xnor	%g6,	0x078C,	%o5
	ldd	[%l7 + 0x48],	%f14
	fmovrslz	%o7,	%f4,	%f5
	fmovdn	%xcc,	%f22,	%f31
	smul	%l4,	0x0374,	%g5
	andncc	%o1,	%i5,	%i2
	fmovd	%f20,	%f2
	movpos	%xcc,	%l6,	%i4
	fmovs	%f31,	%f16
	xnorcc	%g1,	%l3,	%o4
	stx	%g3,	[%l7 + 0x48]
	udivcc	%l5,	0x0540,	%o0
	edge8n	%o2,	%g4,	%l2
	fmul8x16	%f19,	%f8,	%f10
	fmovdl	%icc,	%f2,	%f24
	andncc	%l0,	%o3,	%i1
	srl	%i3,	0x05,	%i6
	sth	%i7,	[%l7 + 0x4C]
	popc	0x1AF8,	%i0
	faligndata	%f24,	%f16,	%f10
	movgu	%xcc,	%g7,	%o6
	udivcc	%l1,	0x0E63,	%g6
	fmovs	%f25,	%f18
	bshuffle	%f28,	%f12,	%f22
	fmovrdlz	%o5,	%f26,	%f4
	fmovsgu	%icc,	%f29,	%f2
	sdiv	%o7,	0x04F2,	%l4
	sub	%g5,	0x1A7D,	%g2
	st	%f18,	[%l7 + 0x64]
	edge16ln	%i5,	%o1,	%i2
	std	%f26,	[%l7 + 0x78]
	fmul8x16	%f27,	%f28,	%f10
	fpadd32s	%f4,	%f31,	%f23
	fmovspos	%icc,	%f8,	%f21
	movrlez	%l6,	0x293,	%i4
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%l3
	fcmpgt32	%f16,	%f20,	%o4
	nop
	set	0x48, %i4
	ldsw	[%l7 + %i4],	%g3
	udiv	%g1,	0x02AD,	%l5
	fsrc2s	%f9,	%f19
	array32	%o2,	%g4,	%l2
	sdivcc	%l0,	0x0E71,	%o0
	fmovsleu	%icc,	%f19,	%f8
	movgu	%icc,	%i1,	%i3
	fmovs	%f22,	%f21
	fcmple16	%f26,	%f0,	%o3
	srl	%i7,	%i0,	%i6
	edge16	%g7,	%l1,	%o6
	sethi	0x021C,	%o5
	fmovrdlz	%o7,	%f0,	%f18
	edge8l	%l4,	%g6,	%g2
	fnot1s	%f4,	%f24
	edge32l	%g5,	%i5,	%i2
	orn	%o1,	%l6,	%l3
	fmul8ulx16	%f28,	%f4,	%f22
	movrne	%i4,	0x029,	%g3
	movn	%icc,	%g1,	%o4
	movleu	%icc,	%o2,	%g4
	and	%l5,	0x1D73,	%l0
	andncc	%o0,	%i1,	%i3
	mulscc	%l2,	%o3,	%i7
	ldub	[%l7 + 0x09],	%i6
	movg	%icc,	%g7,	%l1
	fmovdleu	%xcc,	%f13,	%f24
	movg	%xcc,	%o6,	%i0
	addcc	%o7,	0x147D,	%o5
	popc	%g6,	%l4
	ldx	[%l7 + 0x28],	%g5
	movge	%icc,	%g2,	%i5
	movrlez	%i2,	%o1,	%l6
	and	%l3,	%g3,	%g1
	xor	%i4,	%o4,	%g4
	addccc	%o2,	%l0,	%o0
	add	%i1,	%i3,	%l2
	fmovrdlez	%l5,	%f18,	%f30
	subccc	%i7,	%i6,	%o3
	sll	%g7,	0x16,	%l1
	fcmps	%fcc2,	%f4,	%f10
	movl	%icc,	%i0,	%o6
	andncc	%o7,	%g6,	%l4
	fpackfix	%f18,	%f14
	fandnot2s	%f18,	%f28,	%f1
	edge32	%g5,	%g2,	%o5
	edge32ln	%i5,	%i2,	%o1
	move	%icc,	%l6,	%l3
	mova	%xcc,	%g1,	%g3
	restore %i4, 0x1FE9, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%g4
	sdiv	%o2,	0x01EE,	%o0
	sdiv	%i1,	0x1BF7,	%i3
	sub	%l0,	%l5,	%i7
	nop
	set	0x30, %o3
	stx	%i6,	[%l7 + %o3]
	movre	%l2,	%o3,	%g7
	edge8l	%l1,	%o6,	%i0
	edge8l	%o7,	%g6,	%l4
	movpos	%xcc,	%g5,	%o5
	sethi	0x06A5,	%i5
	movle	%xcc,	%i2,	%o1
	subcc	%l6,	0x0A00,	%l3
	edge8	%g1,	%g2,	%i4
	st	%f10,	[%l7 + 0x14]
	xnorcc	%o4,	%g3,	%o2
	movpos	%xcc,	%g4,	%i1
	edge16ln	%i3,	%l0,	%o0
	orcc	%i7,	%l5,	%l2
	xorcc	%i6,	%g7,	%o3
	sdiv	%o6,	0x037D,	%i0
	fors	%f10,	%f20,	%f19
	movre	%o7,	%g6,	%l4
	fmovs	%f11,	%f22
	fmovdneg	%icc,	%f30,	%f1
	andncc	%g5,	%l1,	%o5
	fmovsn	%icc,	%f23,	%f14
	sll	%i5,	%o1,	%l6
	fmovsa	%icc,	%f6,	%f20
	fmovse	%icc,	%f30,	%f14
	ldsh	[%l7 + 0x14],	%l3
	smul	%g1,	0x1B00,	%i2
	xor	%g2,	%i4,	%o4
	siam	0x5
	fcmple32	%f4,	%f18,	%g3
	fpmerge	%f31,	%f13,	%f10
	movl	%icc,	%o2,	%g4
	alignaddrl	%i3,	%l0,	%i1
	alignaddr	%o0,	%l5,	%i7
	save %l2, 0x1F0E, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o3,	0x15B2,	%g7
	sllx	%i0,	0x07,	%o7
	array8	%o6,	%g6,	%l4
	st	%f31,	[%l7 + 0x64]
	array32	%l1,	%g5,	%i5
	fpack16	%f4,	%f9
	udivx	%o5,	0x1C3D,	%l6
	smulcc	%o1,	0x0042,	%g1
	fmovrsgez	%l3,	%f29,	%f11
	movleu	%icc,	%i2,	%g2
	sethi	0x1549,	%i4
	fmovdg	%xcc,	%f10,	%f14
	andn	%g3,	0x0807,	%o4
	andn	%o2,	0x0BEE,	%g4
	sra	%i3,	%i1,	%l0
	movre	%l5,	0x2A8,	%o0
	sir	0x0016
	subc	%l2,	%i7,	%o3
	sir	0x0500
	orn	%g7,	%i0,	%o7
	fsrc1	%f0,	%f6
	movrlez	%o6,	0x149,	%g6
	sub	%l4,	%l1,	%i6
	sllx	%i5,	0x1F,	%g5
	ldsh	[%l7 + 0x44],	%l6
	add	%o5,	0x0D8C,	%g1
	fone	%f30
	stw	%o1,	[%l7 + 0x0C]
	movn	%xcc,	%i2,	%g2
	and	%i4,	%g3,	%l3
	movrgez	%o2,	%g4,	%i3
	movge	%icc,	%i1,	%o4
	xnor	%l0,	0x1B8F,	%l5
	lduw	[%l7 + 0x58],	%l2
	movneg	%icc,	%i7,	%o0
	st	%f15,	[%l7 + 0x74]
	movge	%icc,	%o3,	%i0
	movre	%o7,	%o6,	%g6
	fmul8ulx16	%f16,	%f4,	%f0
	nop
	set	0x78, %g2
	ldsh	[%l7 + %g2],	%g7
	movge	%icc,	%l4,	%i6
	fmul8x16	%f24,	%f26,	%f2
	movrgez	%i5,	%l1,	%g5
	movneg	%icc,	%o5,	%l6
	addc	%o1,	0x0207,	%g1
	edge8l	%g2,	%i2,	%i4
	movleu	%xcc,	%g3,	%o2
	subcc	%l3,	0x10EC,	%g4
	mulx	%i3,	0x19BB,	%i1
	fands	%f31,	%f17,	%f11
	sdivx	%l0,	0x07FF,	%l5
	fmovspos	%xcc,	%f30,	%f9
	movneg	%xcc,	%o4,	%i7
	srl	%o0,	0x03,	%o3
	sdivx	%i0,	0x1C5F,	%o7
	ldd	[%l7 + 0x18],	%o6
	movne	%icc,	%l2,	%g7
	fnot1	%f20,	%f0
	andcc	%g6,	%l4,	%i5
	fmovrse	%l1,	%f23,	%f23
	fcmpd	%fcc1,	%f30,	%f24
	subc	%i6,	%g5,	%l6
	fmovdcc	%icc,	%f3,	%f30
	ld	[%l7 + 0x40],	%f12
	subcc	%o1,	%g1,	%o5
	fone	%f30
	array32	%g2,	%i2,	%i4
	sdiv	%g3,	0x0C5A,	%o2
	sdiv	%l3,	0x0C7E,	%i3
	movne	%xcc,	%i1,	%g4
	fones	%f1
	movg	%xcc,	%l5,	%l0
	edge32ln	%o4,	%o0,	%i7
	fmovdge	%xcc,	%f11,	%f24
	nop
	set	0x50, %l6
	lduh	[%l7 + %l6],	%i0
	addcc	%o3,	0x0E28,	%o7
	mulx	%l2,	%o6,	%g6
	addc	%g7,	0x1E38,	%i5
	fxnor	%f20,	%f8,	%f2
	edge32ln	%l1,	%l4,	%g5
	mulx	%l6,	0x14CE,	%o1
	addc	%g1,	0x0349,	%i6
	fone	%f10
	edge32l	%o5,	%i2,	%g2
	sdivcc	%i4,	0x0ABD,	%o2
	sllx	%l3,	%i3,	%i1
	fcmpne32	%f22,	%f0,	%g3
	edge32ln	%l5,	%g4,	%o4
	movcs	%icc,	%l0,	%i7
	umul	%i0,	0x03D2,	%o3
	edge16l	%o0,	%o7,	%o6
	stb	%g6,	[%l7 + 0x2C]
	fsrc2	%f28,	%f8
	udiv	%l2,	0x0892,	%g7
	std	%f20,	[%l7 + 0x50]
	movre	%i5,	0x020,	%l1
	fors	%f19,	%f25,	%f14
	fmovrslez	%g5,	%f30,	%f15
	or	%l4,	0x1A77,	%o1
	edge32	%g1,	%i6,	%l6
	stx	%o5,	[%l7 + 0x18]
	edge16	%g2,	%i2,	%i4
	sdivcc	%o2,	0x10B3,	%i3
	popc	%l3,	%i1
	movn	%icc,	%l5,	%g3
	nop
	set	0x38, %i1
	lduw	[%l7 + %i1],	%o4
	andncc	%l0,	%g4,	%i0
	srax	%i7,	%o3,	%o0
	fmul8ulx16	%f30,	%f30,	%f26
	fabsd	%f14,	%f16
	fcmped	%fcc3,	%f10,	%f18
	fornot1	%f16,	%f16,	%f24
	addccc	%o6,	0x0C0D,	%o7
	sethi	0x1B71,	%l2
	edge8n	%g6,	%i5,	%l1
	movcs	%icc,	%g5,	%l4
	movvs	%icc,	%o1,	%g1
	fmovdcs	%icc,	%f25,	%f20
	or	%g7,	%i6,	%l6
	movcs	%icc,	%g2,	%o5
	edge8	%i2,	%o2,	%i4
	array16	%i3,	%l3,	%i1
	movvs	%xcc,	%g3,	%l5
	and	%l0,	0x10A8,	%g4
	sll	%o4,	0x0D,	%i0
	movne	%icc,	%i7,	%o0
	xnor	%o6,	%o7,	%o3
	fsrc2s	%f10,	%f20
	addccc	%l2,	0x03A7,	%g6
	fornot2	%f8,	%f0,	%f2
	st	%f5,	[%l7 + 0x4C]
	movcs	%xcc,	%i5,	%g5
	xnor	%l4,	0x0503,	%o1
	fmovdne	%xcc,	%f9,	%f5
	sll	%g1,	%l1,	%i6
	fmuld8ulx16	%f4,	%f21,	%f14
	udiv	%l6,	0x1F39,	%g2
	sdiv	%o5,	0x1729,	%i2
	fcmpgt32	%f24,	%f2,	%g7
	edge16	%i4,	%i3,	%o2
	fmovrslez	%i1,	%f12,	%f19
	movn	%icc,	%l3,	%l5
	ld	[%l7 + 0x18],	%f24
	sra	%l0,	%g3,	%g4
	fmul8x16al	%f11,	%f24,	%f18
	stw	%o4,	[%l7 + 0x20]
	array16	%i0,	%o0,	%i7
	ldd	[%l7 + 0x70],	%f30
	ldsb	[%l7 + 0x60],	%o6
	ldsh	[%l7 + 0x3A],	%o3
	fabss	%f19,	%f12
	edge8l	%l2,	%o7,	%i5
	sdivcc	%g6,	0x03E3,	%g5
	sra	%o1,	%l4,	%g1
	std	%f20,	[%l7 + 0x28]
	edge8n	%l1,	%i6,	%l6
	ldsh	[%l7 + 0x48],	%g2
	mulscc	%i2,	0x1D4B,	%g7
	sll	%o5,	%i4,	%i3
	fmovdvs	%icc,	%f15,	%f27
	fsrc1	%f4,	%f20
	ldub	[%l7 + 0x7D],	%i1
	and	%l3,	%l5,	%o2
	subcc	%g3,	%g4,	%l0
	movrne	%i0,	0x00D,	%o0
	movcc	%xcc,	%i7,	%o4
	alignaddrl	%o3,	%o6,	%o7
	movn	%xcc,	%i5,	%g6
	sdivcc	%l2,	0x1017,	%o1
	orncc	%l4,	0x0B2C,	%g5
	subccc	%l1,	%g1,	%l6
	movge	%xcc,	%g2,	%i2
	ldsw	[%l7 + 0x7C],	%i6
	xorcc	%g7,	%i4,	%o5
	nop
	set	0x4F, %l1
	stb	%i1,	[%l7 + %l1]
	orn	%i3,	%l5,	%o2
	edge32ln	%l3,	%g4,	%g3
	sir	0x1337
	fmovdcc	%icc,	%f9,	%f21
	fmovrdlez	%i0,	%f10,	%f22
	fmovsneg	%xcc,	%f29,	%f5
	srax	%l0,	%o0,	%o4
	fmovde	%icc,	%f17,	%f12
	sir	0x15B6
	srl	%i7,	%o3,	%o7
	umulcc	%i5,	0x10A0,	%g6
	smul	%o6,	0x0AE2,	%l2
	movneg	%xcc,	%l4,	%o1
	lduh	[%l7 + 0x48],	%l1
	sllx	%g5,	%g1,	%l6
	sll	%g2,	%i2,	%i6
	nop
	set	0x20, %o0
	ldsw	[%l7 + %o0],	%i4
	orn	%g7,	0x0282,	%o5
	edge8l	%i1,	%i3,	%o2
	addcc	%l5,	%l3,	%g4
	move	%icc,	%g3,	%l0
	mulx	%o0,	%i0,	%o4
	fmovsleu	%icc,	%f16,	%f11
	fcmple16	%f24,	%f28,	%i7
	st	%f4,	[%l7 + 0x30]
	sethi	0x1311,	%o7
	fcmped	%fcc1,	%f26,	%f24
	andncc	%i5,	%o3,	%g6
	edge32n	%l2,	%o6,	%l4
	stx	%o1,	[%l7 + 0x60]
	xorcc	%l1,	0x137E,	%g1
	movcc	%xcc,	%g5,	%l6
	srax	%g2,	0x03,	%i6
	sir	0x119A
	or	%i4,	0x19D7,	%g7
	stw	%o5,	[%l7 + 0x70]
	udiv	%i1,	0x1F74,	%i3
	edge32l	%i2,	%l5,	%o2
	fnands	%f4,	%f30,	%f26
	movn	%icc,	%g4,	%g3
	edge16l	%l0,	%o0,	%l3
	lduh	[%l7 + 0x10],	%o4
	xnorcc	%i7,	%o7,	%i0
	mulx	%o3,	%i5,	%g6
	movgu	%icc,	%o6,	%l4
	srlx	%o1,	%l1,	%g1
	fxnor	%f24,	%f4,	%f30
	addcc	%l2,	0x0BD8,	%l6
	ldsw	[%l7 + 0x7C],	%g2
	fmovdg	%icc,	%f19,	%f25
	addcc	%i6,	%g5,	%g7
	sdiv	%o5,	0x0F79,	%i4
	fmovsge	%xcc,	%f28,	%f13
	mulx	%i3,	0x0192,	%i1
	fzeros	%f29
	fmovsne	%xcc,	%f9,	%f4
	fnegs	%f22,	%f25
	ldd	[%l7 + 0x48],	%f18
	srax	%l5,	0x15,	%o2
	edge8l	%g4,	%g3,	%i2
	movge	%icc,	%o0,	%l3
	sir	0x16BC
	mulscc	%o4,	0x0C1F,	%l0
	faligndata	%f10,	%f16,	%f4
	fmul8ulx16	%f20,	%f6,	%f18
	ldsb	[%l7 + 0x0F],	%o7
	sth	%i0,	[%l7 + 0x64]
	andn	%o3,	0x13C7,	%i7
	edge32l	%i5,	%o6,	%l4
	movleu	%icc,	%g6,	%l1
	xnorcc	%g1,	0x1D11,	%o1
	popc	%l6,	%l2
	mulx	%i6,	0x0D3E,	%g5
	edge32	%g2,	%g7,	%i4
	fmovsgu	%icc,	%f31,	%f27
	addccc	%i3,	0x1E7D,	%i1
	fmovscc	%icc,	%f0,	%f3
	movgu	%xcc,	%o5,	%l5
	mulscc	%o2,	0x1B25,	%g3
	array8	%g4,	%i2,	%l3
	sra	%o4,	%o0,	%l0
	fmovrdlz	%i0,	%f28,	%f16
	xnor	%o3,	0x0619,	%o7
	addc	%i7,	0x1302,	%o6
	ldd	[%l7 + 0x48],	%i4
	movleu	%xcc,	%g6,	%l4
	fnot1	%f6,	%f28
	fabss	%f19,	%f0
	stw	%g1,	[%l7 + 0x3C]
	udiv	%o1,	0x0257,	%l6
	popc	%l2,	%l1
	ld	[%l7 + 0x6C],	%f1
	movvc	%xcc,	%i6,	%g2
	ldub	[%l7 + 0x2F],	%g5
	fcmple16	%f20,	%f28,	%g7
	andncc	%i4,	%i1,	%o5
	sir	0x0119
	orn	%i3,	%l5,	%o2
	stx	%g3,	[%l7 + 0x70]
	fzero	%f14
	fmuld8ulx16	%f3,	%f21,	%f0
	array8	%g4,	%i2,	%l3
	sra	%o0,	0x0D,	%o4
	movrlz	%l0,	0x0EC,	%i0
	edge8ln	%o7,	%i7,	%o3
	fcmpne16	%f28,	%f26,	%o6
	sth	%i5,	[%l7 + 0x1A]
	umulcc	%l4,	%g6,	%o1
	andncc	%g1,	%l6,	%l2
	edge16n	%i6,	%l1,	%g2
	fcmps	%fcc3,	%f13,	%f7
	sra	%g7,	0x04,	%g5
	fmul8x16al	%f14,	%f16,	%f14
	array16	%i1,	%o5,	%i4
	edge16n	%i3,	%l5,	%o2
	movrne	%g3,	%g4,	%i2
	udiv	%l3,	0x163E,	%o4
	subccc	%l0,	%i0,	%o7
	movcc	%xcc,	%i7,	%o3
	umul	%o0,	%i5,	%o6
	alignaddr	%g6,	%l4,	%o1
	ldsw	[%l7 + 0x48],	%l6
	array32	%g1,	%i6,	%l1
	fpadd16s	%f7,	%f21,	%f15
	sth	%g2,	[%l7 + 0x46]
	fsrc2	%f24,	%f22
	fmovdvs	%icc,	%f31,	%f15
	sll	%g7,	%g5,	%l2
	movleu	%xcc,	%o5,	%i1
	smul	%i3,	%l5,	%i4
	fmovdneg	%xcc,	%f30,	%f8
	movrne	%g3,	0x113,	%g4
	array16	%o2,	%l3,	%i2
	fcmpd	%fcc2,	%f12,	%f16
	fmovrdlz	%o4,	%f6,	%f10
	fmovdcs	%icc,	%f28,	%f14
	siam	0x3
	fnor	%f16,	%f4,	%f30
	movgu	%icc,	%l0,	%o7
	fnors	%f24,	%f29,	%f16
	movleu	%icc,	%i0,	%i7
	fmovsleu	%xcc,	%f16,	%f10
	fmul8x16al	%f21,	%f29,	%f6
	stw	%o3,	[%l7 + 0x0C]
	popc	0x09B0,	%o0
	sethi	0x1627,	%i5
	movvc	%xcc,	%g6,	%l4
	addccc	%o1,	%l6,	%g1
	fmovsne	%icc,	%f27,	%f2
	andncc	%o6,	%l1,	%i6
	ldsw	[%l7 + 0x14],	%g2
	smulcc	%g5,	0x157D,	%l2
	andcc	%o5,	0x1B40,	%i1
	smulcc	%i3,	%l5,	%g7
	edge32	%i4,	%g3,	%g4
	movrgz	%o2,	0x170,	%l3
	stb	%o4,	[%l7 + 0x49]
	lduh	[%l7 + 0x44],	%i2
	ldd	[%l7 + 0x20],	%f2
	for	%f20,	%f22,	%f8
	andn	%l0,	0x08D1,	%i0
	array8	%i7,	%o7,	%o3
	alignaddrl	%i5,	%g6,	%l4
	movrlz	%o1,	%o0,	%g1
	smulcc	%l6,	0x1F4C,	%l1
	movrlz	%i6,	0x2CA,	%o6
	ld	[%l7 + 0x0C],	%f28
	fmovrsgz	%g5,	%f28,	%f10
	sub	%g2,	%l2,	%o5
	umul	%i3,	%i1,	%l5
	edge8l	%i4,	%g7,	%g3
	smulcc	%g4,	0x0A2D,	%o2
	andn	%o4,	0x18C0,	%i2
	alignaddrl	%l0,	%i0,	%l3
	xnor	%o7,	%i7,	%i5
	array16	%o3,	%g6,	%o1
	ldsh	[%l7 + 0x78],	%o0
	andcc	%l4,	0x1913,	%g1
	fmovsgu	%xcc,	%f15,	%f2
	fmovdcc	%xcc,	%f18,	%f23
	edge16	%l1,	%i6,	%l6
	fpmerge	%f23,	%f22,	%f12
	mova	%icc,	%o6,	%g2
	movneg	%icc,	%g5,	%l2
	array8	%i3,	%i1,	%o5
	udivx	%i4,	0x0AEF,	%l5
	stw	%g3,	[%l7 + 0x4C]
	fcmpne32	%f28,	%f16,	%g4
	subc	%o2,	0x175A,	%g7
	array8	%o4,	%i2,	%i0
	movgu	%xcc,	%l0,	%l3
	movcs	%xcc,	%i7,	%o7
	udivcc	%o3,	0x0D73,	%i5
	std	%f6,	[%l7 + 0x68]
	array16	%o1,	%g6,	%l4
	edge32n	%g1,	%l1,	%o0
	orcc	%i6,	0x0073,	%o6
	movrgez	%g2,	%g5,	%l6
	andncc	%l2,	%i3,	%i1
	edge8n	%o5,	%i4,	%l5
	movn	%icc,	%g3,	%g4
	sllx	%o2,	0x0F,	%o4
	ldub	[%l7 + 0x4C],	%i2
	sra	%g7,	0x03,	%l0
	smulcc	%l3,	0x0BC6,	%i0
	subccc	%i7,	0x0446,	%o7
	smul	%i5,	%o3,	%g6
	mulscc	%l4,	0x0107,	%g1
	orn	%o1,	0x068E,	%o0
	edge8ln	%l1,	%o6,	%g2
	fmovrde	%g5,	%f8,	%f14
	fmovsvc	%icc,	%f15,	%f4
	sdiv	%i6,	0x108F,	%l6
	orncc	%l2,	%i3,	%o5
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	fmovdleu	%xcc,	%f23,	%f6
	fmovsneg	%xcc,	%f6,	%f22
	movcc	%icc,	%g4,	%l5
	siam	0x4
	fmovdg	%icc,	%f26,	%f27
	fmovdn	%icc,	%f15,	%f24
	move	%xcc,	%o2,	%i2
	movgu	%icc,	%g7,	%l0
	movcc	%xcc,	%l3,	%i0
	andcc	%i7,	0x08B2,	%o4
	edge16l	%i5,	%o7,	%o3
	fmovscc	%icc,	%f3,	%f5
	fabsd	%f8,	%f10
	fpackfix	%f0,	%f7
	edge32ln	%g6,	%l4,	%g1
	fcmpne16	%f30,	%f10,	%o0
	fmovrsgez	%o1,	%f14,	%f0
	udivx	%l1,	0x191D,	%g2
	ldx	[%l7 + 0x50],	%g5
	fmovdvs	%xcc,	%f11,	%f4
	ldd	[%l7 + 0x58],	%o6
	fmovsge	%xcc,	%f28,	%f18
	fpadd16s	%f21,	%f26,	%f19
	fmovdle	%icc,	%f15,	%f29
	smulcc	%l6,	%i6,	%i3
	movn	%xcc,	%l2,	%o5
	fpack32	%f0,	%f12,	%f6
	movrlz	%i1,	0x0E7,	%i4
	orncc	%g3,	%l5,	%o2
	sethi	0x1057,	%g4
	movvc	%xcc,	%g7,	%i2
	orcc	%l3,	%i0,	%l0
	fxors	%f11,	%f22,	%f7
	smulcc	%i7,	%i5,	%o7
	movrlez	%o3,	%g6,	%o4
	fabss	%f4,	%f6
	edge32l	%l4,	%g1,	%o1
	smul	%l1,	0x0128,	%g2
	sdiv	%o0,	0x1335,	%o6
	xnor	%l6,	%i6,	%i3
	ld	[%l7 + 0x64],	%f8
	mulscc	%g5,	0x13FE,	%l2
	srlx	%i1,	0x07,	%i4
	fmovsge	%icc,	%f16,	%f18
	movn	%icc,	%o5,	%l5
	restore %o2, %g3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i2,	%g7,	%l3
	edge8l	%l0,	%i7,	%i5
	movcs	%xcc,	%o7,	%i0
	movvs	%icc,	%g6,	%o4
	movg	%icc,	%l4,	%o3
	sdivx	%g1,	0x013A,	%l1
	edge8	%o1,	%g2,	%o6
	popc	0x01B0,	%o0
	movpos	%xcc,	%i6,	%l6
	fcmpne16	%f14,	%f26,	%i3
	fcmpeq16	%f10,	%f26,	%g5
	sir	0x1F08
	addc	%l2,	0x1C26,	%i1
	orcc	%i4,	%l5,	%o2
	st	%f18,	[%l7 + 0x2C]
	orcc	%g3,	0x0F1B,	%o5
	fmovspos	%xcc,	%f22,	%f29
	sdivx	%i2,	0x1BD9,	%g4
	xnorcc	%g7,	%l3,	%l0
	movvs	%xcc,	%i5,	%i7
	movgu	%xcc,	%o7,	%g6
	ldx	[%l7 + 0x48],	%i0
	fpadd32s	%f5,	%f24,	%f27
	andn	%l4,	0x09C6,	%o4
	smul	%g1,	%o3,	%l1
	xor	%g2,	0x0225,	%o6
	fxor	%f18,	%f8,	%f20
	save %o0, 0x158C, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f29,	%f3
	movvc	%icc,	%i6,	%l6
	andcc	%g5,	0x0783,	%l2
	fmovdge	%xcc,	%f11,	%f13
	lduw	[%l7 + 0x2C],	%i1
	srax	%i3,	%i4,	%o2
	movg	%xcc,	%g3,	%l5
	st	%f31,	[%l7 + 0x3C]
	xnor	%i2,	0x01A7,	%g4
	ldub	[%l7 + 0x48],	%o5
	move	%xcc,	%l3,	%l0
	fexpand	%f21,	%f8
	fnor	%f18,	%f16,	%f12
	sdivcc	%i5,	0x1D97,	%g7
	movvs	%xcc,	%o7,	%i7
	sllx	%i0,	0x07,	%g6
	fmovrslez	%l4,	%f9,	%f9
	stb	%g1,	[%l7 + 0x64]
	subccc	%o4,	%o3,	%g2
	fnor	%f0,	%f24,	%f2
	edge32	%o6,	%o0,	%l1
	sub	%i6,	%l6,	%g5
	fmovdvc	%xcc,	%f27,	%f12
	subcc	%l2,	0x0FC9,	%i1
	edge32l	%i3,	%i4,	%o1
	faligndata	%f14,	%f22,	%f24
	movrgz	%o2,	%l5,	%g3
	addc	%i2,	%o5,	%g4
	sub	%l0,	%i5,	%g7
	srlx	%l3,	%o7,	%i7
	orcc	%i0,	0x006F,	%l4
	movneg	%icc,	%g1,	%o4
	stb	%g6,	[%l7 + 0x21]
	umulcc	%g2,	%o6,	%o0
	ldd	[%l7 + 0x70],	%f12
	ldd	[%l7 + 0x08],	%f10
	lduh	[%l7 + 0x12],	%o3
	array16	%i6,	%l6,	%g5
	orcc	%l1,	%l2,	%i3
	sra	%i1,	0x0D,	%i4
	edge8l	%o1,	%l5,	%o2
	movge	%xcc,	%i2,	%g3
	fmovs	%f6,	%f27
	or	%g4,	%o5,	%i5
	array32	%g7,	%l3,	%l0
	edge8l	%i7,	%i0,	%o7
	sdivcc	%g1,	0x13D9,	%l4
	fmovrdgz	%o4,	%f4,	%f22
	fmovsvs	%icc,	%f27,	%f30
	fexpand	%f16,	%f30
	sdivcc	%g6,	0x0923,	%o6
	sllx	%o0,	%o3,	%g2
	movne	%xcc,	%l6,	%g5
	umulcc	%l1,	0x15D1,	%i6
	mulx	%i3,	%i1,	%l2
	movrlz	%o1,	0x173,	%l5
	fmovdvs	%xcc,	%f15,	%f17
	st	%f29,	[%l7 + 0x3C]
	srlx	%i4,	%o2,	%i2
	sir	0x197F
	fpsub16	%f22,	%f30,	%f16
	edge8n	%g4,	%o5,	%i5
	fexpand	%f19,	%f12
	nop
	set	0x58, %l4
	stw	%g7,	[%l7 + %l4]
	fcmped	%fcc0,	%f6,	%f2
	movn	%xcc,	%l3,	%g3
	movgu	%icc,	%l0,	%i0
	fmovsn	%xcc,	%f5,	%f12
	movrlez	%i7,	0x1D3,	%o7
	lduw	[%l7 + 0x38],	%g1
	fsrc2	%f16,	%f2
	movgu	%xcc,	%l4,	%g6
	udivcc	%o6,	0x1E47,	%o4
	movre	%o3,	0x30C,	%o0
	edge16	%l6,	%g2,	%g5
	fones	%f4
	movrgz	%i6,	%l1,	%i3
	fmovdgu	%icc,	%f19,	%f22
	edge16n	%l2,	%i1,	%o1
	ldsw	[%l7 + 0x5C],	%i4
	sethi	0x05A2,	%o2
	movl	%xcc,	%i2,	%g4
	nop
	set	0x08, %i7
	stw	%l5,	[%l7 + %i7]
	fmovrde	%i5,	%f24,	%f20
	fcmpne16	%f24,	%f24,	%g7
	movvc	%icc,	%o5,	%l3
	xnor	%l0,	0x1BE2,	%g3
	edge8	%i7,	%o7,	%g1
	subccc	%i0,	%g6,	%o6
	movgu	%icc,	%o4,	%o3
	edge16	%o0,	%l4,	%l6
	fones	%f23
	ldsh	[%l7 + 0x4E],	%g5
	st	%f21,	[%l7 + 0x0C]
	addcc	%i6,	%l1,	%g2
	popc	%l2,	%i1
	sra	%i3,	%o1,	%i4
	st	%f19,	[%l7 + 0x20]
	andcc	%o2,	%g4,	%i2
	movpos	%icc,	%i5,	%l5
	subc	%g7,	%o5,	%l0
	array16	%l3,	%i7,	%o7
	add	%g1,	0x0A8C,	%g3
	movne	%xcc,	%g6,	%i0
	sub	%o6,	%o3,	%o4
	lduw	[%l7 + 0x70],	%o0
	sir	0x0F72
	udivx	%l6,	0x11A1,	%l4
	srlx	%i6,	%l1,	%g5
	fmovdcc	%xcc,	%f4,	%f9
	fpadd32	%f26,	%f2,	%f30
	sethi	0x1B0A,	%g2
	movn	%icc,	%l2,	%i1
	movleu	%icc,	%o1,	%i4
	fxors	%f23,	%f0,	%f15
	movre	%o2,	%g4,	%i2
	sth	%i5,	[%l7 + 0x6A]
	edge16n	%l5,	%g7,	%o5
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	srax	%i7,	%g1,	%g3
	fmovrsne	%g6,	%f5,	%f22
	add	%i0,	%o6,	%o7
	movn	%xcc,	%o3,	%o4
	mova	%icc,	%l6,	%o0
	sth	%l4,	[%l7 + 0x2E]
	andcc	%l1,	0x07A1,	%g5
	stx	%g2,	[%l7 + 0x30]
	fsrc1s	%f20,	%f26
	ld	[%l7 + 0x60],	%f19
	edge16ln	%l2,	%i1,	%o1
	movre	%i4,	%o2,	%i6
	umulcc	%i2,	%g4,	%l5
	xnorcc	%i5,	%o5,	%g7
	ldsw	[%l7 + 0x50],	%l0
	subcc	%i3,	0x1330,	%i7
	array16	%g1,	%l3,	%g6
	move	%icc,	%g3,	%i0
	movvc	%xcc,	%o7,	%o3
	addcc	%o6,	0x0D64,	%o4
	fmovsvc	%icc,	%f20,	%f25
	umulcc	%o0,	0x1460,	%l6
	fmovsge	%icc,	%f15,	%f7
	andn	%l4,	0x1BDF,	%l1
	movl	%xcc,	%g5,	%l2
	movrlz	%i1,	0x32E,	%o1
	smul	%g2,	%o2,	%i4
	movrlez	%i2,	%g4,	%i6
	fmul8ulx16	%f12,	%f24,	%f12
	andn	%l5,	%i5,	%g7
	ldx	[%l7 + 0x20],	%o5
	orcc	%l0,	0x0540,	%i3
	ldsw	[%l7 + 0x5C],	%i7
	edge8ln	%l3,	%g1,	%g6
	alignaddr	%i0,	%o7,	%o3
	addcc	%o6,	%o4,	%o0
	smulcc	%g3,	0x0ADB,	%l6
	array32	%l4,	%g5,	%l2
	fmul8sux16	%f22,	%f10,	%f24
	edge16ln	%i1,	%l1,	%o1
	movgu	%xcc,	%g2,	%i4
	fmovdvs	%icc,	%f16,	%f15
	smulcc	%o2,	%i2,	%i6
	fcmple16	%f16,	%f14,	%l5
	xnorcc	%i5,	%g4,	%g7
	edge8ln	%o5,	%i3,	%i7
	sdiv	%l3,	0x1714,	%l0
	edge32l	%g6,	%i0,	%g1
	edge8ln	%o7,	%o3,	%o4
	udiv	%o0,	0x1317,	%g3
	edge16	%o6,	%l6,	%g5
	bshuffle	%f8,	%f8,	%f30
	ldsh	[%l7 + 0x3A],	%l2
	fnot1	%f30,	%f30
	fcmped	%fcc3,	%f20,	%f26
	edge16	%l4,	%l1,	%o1
	movcc	%xcc,	%i1,	%i4
	ldsb	[%l7 + 0x29],	%g2
	fmovscc	%icc,	%f21,	%f24
	sdivcc	%o2,	0x00CC,	%i6
	fmovrdgz	%i2,	%f4,	%f18
	lduh	[%l7 + 0x56],	%i5
	movn	%xcc,	%l5,	%g4
	movg	%xcc,	%o5,	%i3
	fcmpne16	%f12,	%f10,	%i7
	edge32ln	%g7,	%l3,	%l0
	movpos	%xcc,	%i0,	%g1
	umulcc	%g6,	0x135B,	%o7
	alignaddr	%o4,	%o3,	%o0
	move	%icc,	%o6,	%l6
	movrgz	%g5,	0x2B9,	%g3
	nop
	set	0x14, %o6
	ldub	[%l7 + %o6],	%l4
	sdiv	%l1,	0x127B,	%o1
	fpadd32s	%f15,	%f12,	%f9
	srlx	%l2,	0x0E,	%i4
	edge16	%i1,	%g2,	%i6
	ldd	[%l7 + 0x20],	%f30
	ldd	[%l7 + 0x18],	%f8
	xorcc	%i2,	%i5,	%o2
	andn	%g4,	%o5,	%i3
	srl	%l5,	%g7,	%i7
	popc	%l3,	%i0
	stx	%l0,	[%l7 + 0x30]
	smulcc	%g1,	%o7,	%o4
	fzeros	%f27
	sra	%g6,	0x03,	%o3
	fmovrdgz	%o0,	%f0,	%f22
	fors	%f17,	%f7,	%f12
	sll	%o6,	%g5,	%g3
	sethi	0x1DE5,	%l6
	movleu	%xcc,	%l1,	%l4
	stb	%o1,	[%l7 + 0x38]
	addc	%i4,	0x1AE8,	%l2
	edge32n	%g2,	%i6,	%i1
	nop
	set	0x62, %l3
	ldsh	[%l7 + %l3],	%i2
	xor	%i5,	%g4,	%o2
	addccc	%i3,	%l5,	%g7
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%o5
	stx	%l3,	[%l7 + 0x78]
	fmovdcs	%icc,	%f26,	%f12
	orn	%i7,	%i0,	%l0
	fpack32	%f20,	%f12,	%f20
	orcc	%o7,	0x0B52,	%o4
	xorcc	%g6,	0x18B2,	%g1
	movge	%icc,	%o0,	%o6
	fmovdgu	%xcc,	%f23,	%f13
	movn	%xcc,	%o3,	%g3
	movg	%icc,	%l6,	%g5
	and	%l4,	0x051E,	%l1
	movge	%xcc,	%o1,	%l2
	movgu	%xcc,	%i4,	%g2
	alignaddr	%i6,	%i2,	%i1
	edge8n	%i5,	%g4,	%i3
	fone	%f18
	xor	%o2,	%g7,	%o5
	lduw	[%l7 + 0x30],	%l3
	stb	%i7,	[%l7 + 0x5F]
	orncc	%i0,	0x031C,	%l0
	movneg	%icc,	%l5,	%o7
	array32	%o4,	%g1,	%g6
	movpos	%icc,	%o6,	%o0
	lduh	[%l7 + 0x40],	%g3
	srax	%o3,	%l6,	%l4
	fmovrslez	%g5,	%f26,	%f11
	sth	%l1,	[%l7 + 0x76]
	array16	%l2,	%o1,	%g2
	sth	%i6,	[%l7 + 0x66]
	fmul8x16	%f3,	%f24,	%f0
	fnot2	%f18,	%f20
	fabsd	%f2,	%f2
	edge16l	%i4,	%i2,	%i1
	fmul8sux16	%f6,	%f0,	%f2
	stw	%i5,	[%l7 + 0x38]
	bshuffle	%f16,	%f8,	%f20
	st	%f10,	[%l7 + 0x40]
	fmovrdgez	%i3,	%f4,	%f0
	edge8n	%g4,	%o2,	%g7
	sra	%o5,	%l3,	%i7
	stb	%i0,	[%l7 + 0x19]
	xor	%l5,	0x1D28,	%l0
	movrlz	%o7,	%o4,	%g6
	edge32n	%g1,	%o6,	%g3
	subcc	%o0,	%o3,	%l6
	fmovdgu	%xcc,	%f30,	%f8
	movcc	%xcc,	%g5,	%l4
	movrgz	%l1,	0x3C5,	%o1
	fmovrdgz	%g2,	%f2,	%f20
	for	%f30,	%f22,	%f18
	pdist	%f0,	%f18,	%f0
	fnor	%f16,	%f26,	%f6
	fand	%f24,	%f0,	%f30
	array32	%l2,	%i4,	%i2
	ldx	[%l7 + 0x30],	%i6
	fpackfix	%f16,	%f5
	ldsb	[%l7 + 0x37],	%i5
	fpsub32	%f0,	%f28,	%f16
	save %i1, 0x1AA3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x34],	%o2
	sdivcc	%i3,	0x1A9E,	%g7
	umulcc	%o5,	%i7,	%i0
	mulscc	%l3,	%l0,	%o7
	array8	%o4,	%g6,	%g1
	edge8	%l5,	%o6,	%g3
	movvs	%icc,	%o3,	%o0
	movrlez	%g5,	%l4,	%l1
	umul	%o1,	0x0ADE,	%l6
	fcmple16	%f0,	%f6,	%g2
	lduw	[%l7 + 0x44],	%i4
	movrgz	%l2,	%i6,	%i2
	fmovdg	%xcc,	%f13,	%f25
	fandnot1s	%f0,	%f6,	%f2
	srax	%i5,	0x0C,	%i1
	sll	%o2,	0x13,	%i3
	movrgz	%g7,	%o5,	%i7
	ldsb	[%l7 + 0x42],	%g4
	sth	%i0,	[%l7 + 0x50]
	movrlz	%l3,	0x054,	%l0
	fmovrsgez	%o4,	%f17,	%f24
	addccc	%o7,	0x108F,	%g1
	udiv	%l5,	0x16DD,	%o6
	movn	%icc,	%g3,	%g6
	mulscc	%o3,	0x0992,	%o0
	andncc	%l4,	%l1,	%o1
	movge	%xcc,	%l6,	%g5
	stx	%i4,	[%l7 + 0x08]
	orncc	%g2,	0x0A7A,	%l2
	fmovrdlez	%i2,	%f14,	%f4
	alignaddr	%i6,	%i5,	%o2
	xor	%i1,	0x0E6C,	%g7
	movrgz	%i3,	%o5,	%g4
	lduh	[%l7 + 0x5E],	%i7
	movvs	%icc,	%i0,	%l3
	udiv	%o4,	0x13FA,	%o7
	movneg	%icc,	%g1,	%l5
	fcmpne16	%f16,	%f2,	%o6
	movneg	%icc,	%g3,	%l0
	movrlz	%o3,	0x0D7,	%g6
	stx	%o0,	[%l7 + 0x78]
	or	%l4,	%l1,	%o1
	movg	%xcc,	%l6,	%i4
	edge16ln	%g5,	%l2,	%i2
	andncc	%i6,	%g2,	%o2
	sllx	%i1,	%g7,	%i5
	fnot2s	%f4,	%f18
	movneg	%icc,	%o5,	%g4
	andncc	%i3,	%i7,	%i0
	fmovsne	%xcc,	%f23,	%f3
	ld	[%l7 + 0x78],	%f11
	addcc	%o4,	%o7,	%l3
	fcmpgt32	%f30,	%f12,	%l5
	fmul8x16au	%f20,	%f30,	%f0
	movcc	%xcc,	%o6,	%g3
	ldd	[%l7 + 0x78],	%g0
	nop
	set	0x20, %l5
	stx	%l0,	[%l7 + %l5]
	edge16	%o3,	%g6,	%l4
	movrne	%l1,	%o0,	%o1
	fmuld8sux16	%f10,	%f9,	%f10
	ld	[%l7 + 0x30],	%f12
	fmovdne	%xcc,	%f23,	%f23
	movvs	%xcc,	%i4,	%l6
	fornot2s	%f14,	%f13,	%f18
	fmul8ulx16	%f26,	%f30,	%f14
	edge32l	%g5,	%l2,	%i2
	fmovsleu	%xcc,	%f5,	%f5
	ldd	[%l7 + 0x38],	%f10
	sll	%i6,	0x03,	%g2
	ldub	[%l7 + 0x43],	%i1
	fnot1	%f30,	%f26
	alignaddr	%o2,	%g7,	%o5
	xnorcc	%i5,	0x076E,	%g4
	st	%f21,	[%l7 + 0x7C]
	fmovdcc	%xcc,	%f15,	%f1
	alignaddrl	%i3,	%i0,	%i7
	movcs	%xcc,	%o7,	%l3
	addc	%o4,	0x1FD9,	%o6
	ld	[%l7 + 0x7C],	%f15
	mulx	%l5,	%g3,	%l0
	addc	%o3,	0x12FE,	%g6
	xnorcc	%l4,	0x044F,	%l1
	sdivx	%o0,	0x189E,	%o1
	xnorcc	%g1,	%i4,	%l6
	subc	%l2,	%g5,	%i6
	udiv	%g2,	0x172D,	%i2
	edge16n	%o2,	%g7,	%o5
	fcmpgt32	%f8,	%f16,	%i1
	fsrc2	%f20,	%f18
	edge32l	%g4,	%i3,	%i0
	add	%i7,	0x17DC,	%o7
	movne	%icc,	%l3,	%o4
	move	%xcc,	%i5,	%o6
	edge32	%g3,	%l5,	%l0
	andn	%o3,	%l4,	%g6
	movrgz	%o0,	0x05D,	%l1
	edge8n	%o1,	%g1,	%l6
	array16	%i4,	%l2,	%i6
	fornot2s	%f1,	%f26,	%f29
	fmovdn	%xcc,	%f6,	%f23
	movrlez	%g5,	0x3C1,	%g2
	alignaddr	%i2,	%o2,	%g7
	udivcc	%o5,	0x0199,	%g4
	addccc	%i1,	%i0,	%i3
	sethi	0x0123,	%o7
	fornot1s	%f14,	%f1,	%f11
	ldd	[%l7 + 0x40],	%i6
	movgu	%xcc,	%o4,	%i5
	andcc	%l3,	%g3,	%o6
	array16	%l0,	%l5,	%l4
	add	%g6,	%o3,	%o0
	movrlez	%o1,	0x111,	%l1
	edge16l	%g1,	%i4,	%l6
	ldub	[%l7 + 0x2A],	%l2
	fcmpne16	%f26,	%f20,	%g5
	movgu	%xcc,	%i6,	%g2
	ldx	[%l7 + 0x18],	%i2
	ldd	[%l7 + 0x18],	%f0
	fmovsne	%icc,	%f16,	%f4
	edge8l	%o2,	%o5,	%g7
	st	%f14,	[%l7 + 0x24]
	edge8n	%i1,	%i0,	%g4
	sdivx	%o7,	0x01D3,	%i7
	sdivcc	%o4,	0x1A98,	%i3
	movn	%icc,	%i5,	%g3
	movgu	%icc,	%o6,	%l3
	fpadd16	%f16,	%f16,	%f0
	siam	0x0
	xorcc	%l5,	%l0,	%g6
	fmovrdlez	%o3,	%f4,	%f0
	mova	%xcc,	%o0,	%l4
	movne	%icc,	%o1,	%l1
	umulcc	%i4,	0x01EB,	%g1
	sdivcc	%l6,	0x0EB8,	%l2
	fmovsleu	%xcc,	%f6,	%f20
	movrne	%g5,	0x2BC,	%g2
	array8	%i2,	%o2,	%i6
	fmovdn	%icc,	%f0,	%f12
	fnegs	%f13,	%f7
	xnorcc	%g7,	%i1,	%o5
	fpadd16s	%f17,	%f10,	%f28
	sra	%i0,	0x1C,	%g4
	faligndata	%f14,	%f6,	%f6
	fornot2s	%f9,	%f17,	%f14
	sub	%i7,	0x02BE,	%o4
	add	%o7,	%i5,	%i3
	ldub	[%l7 + 0x4A],	%o6
	fcmpeq16	%f2,	%f8,	%l3
	and	%l5,	%g3,	%l0
	movvs	%xcc,	%g6,	%o3
	andcc	%o0,	0x0D2F,	%o1
	fmovsleu	%icc,	%f13,	%f27
	edge8ln	%l1,	%l4,	%g1
	edge16n	%i4,	%l2,	%l6
	edge32ln	%g2,	%i2,	%g5
	fnot1s	%f19,	%f0
	movvc	%xcc,	%i6,	%g7
	movvs	%icc,	%i1,	%o2
	array16	%i0,	%g4,	%o5
	fcmpeq32	%f12,	%f26,	%i7
	movl	%icc,	%o7,	%i5
	edge8ln	%i3,	%o4,	%l3
	movrgez	%o6,	0x252,	%l5
	fxnors	%f29,	%f12,	%f24
	movl	%icc,	%g3,	%g6
	sth	%o3,	[%l7 + 0x58]
	or	%l0,	0x1956,	%o0
	fzero	%f2
	movle	%xcc,	%l1,	%o1
	fcmpes	%fcc3,	%f8,	%f1
	lduh	[%l7 + 0x10],	%g1
	edge8l	%l4,	%i4,	%l6
	fandnot2	%f10,	%f30,	%f4
	addc	%l2,	0x0130,	%i2
	fcmpeq32	%f10,	%f4,	%g2
	orncc	%i6,	%g7,	%i1
	save %o2, %g5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f13,	[%l7 + 0x44]
	fmovsvc	%xcc,	%f4,	%f0
	sth	%g4,	[%l7 + 0x3E]
	ld	[%l7 + 0x5C],	%f5
	lduh	[%l7 + 0x5E],	%i7
	array16	%o7,	%i5,	%i3
	edge32n	%o4,	%o5,	%l3
	move	%icc,	%o6,	%l5
	fmovrdlez	%g3,	%f0,	%f6
	srl	%o3,	0x1B,	%l0
	edge32ln	%o0,	%g6,	%o1
	fmovrde	%g1,	%f22,	%f26
	popc	%l4,	%l1
	fmovrdlz	%l6,	%f4,	%f8
	stb	%i4,	[%l7 + 0x78]
	movcc	%xcc,	%l2,	%g2
	edge8ln	%i2,	%g7,	%i1
	add	%i6,	%g5,	%o2
	fcmpeq32	%f20,	%f14,	%i0
	fpack16	%f24,	%f20
	fmovsleu	%xcc,	%f22,	%f11
	sethi	0x1297,	%g4
	fpack16	%f4,	%f23
	udiv	%o7,	0x0359,	%i7
	andn	%i5,	%i3,	%o4
	alignaddrl	%o5,	%o6,	%l3
	fnegd	%f22,	%f24
	andcc	%g3,	%o3,	%l5
	umul	%l0,	%o0,	%o1
	andncc	%g1,	%l4,	%l1
	lduw	[%l7 + 0x54],	%g6
	movre	%i4,	%l2,	%g2
	orncc	%l6,	0x18FF,	%g7
	fcmps	%fcc2,	%f12,	%f5
	movne	%icc,	%i1,	%i6
	sth	%g5,	[%l7 + 0x5C]
	movrgz	%i2,	%i0,	%g4
	fmovdne	%xcc,	%f17,	%f19
	ldd	[%l7 + 0x38],	%f20
	stx	%o7,	[%l7 + 0x68]
	sth	%o2,	[%l7 + 0x0A]
	mulx	%i7,	0x1237,	%i3
	movvc	%icc,	%i5,	%o5
	sub	%o4,	%o6,	%l3
	ld	[%l7 + 0x60],	%f21
	subccc	%o3,	%g3,	%l5
	edge8l	%o0,	%o1,	%g1
	movrgez	%l0,	0x2E4,	%l4
	ldub	[%l7 + 0x72],	%l1
	movrlz	%g6,	%l2,	%g2
	movg	%xcc,	%l6,	%i4
	edge16l	%g7,	%i1,	%i6
	edge16n	%g5,	%i0,	%g4
	movne	%xcc,	%i2,	%o2
	fcmple16	%f30,	%f18,	%i7
	andncc	%i3,	%o7,	%i5
	fsrc2s	%f31,	%f11
	xnorcc	%o4,	%o5,	%o6
	xnorcc	%o3,	0x136E,	%l3
	fmovrdlez	%g3,	%f30,	%f8
	sethi	0x06A0,	%l5
	fmul8x16au	%f17,	%f28,	%f22
	edge32n	%o0,	%g1,	%o1
	edge16n	%l0,	%l1,	%g6
	alignaddrl	%l4,	%g2,	%l2
	fcmpgt16	%f24,	%f30,	%l6
	fone	%f28
	and	%g7,	0x09AB,	%i4
	fmul8x16au	%f1,	%f26,	%f0
	fmovsneg	%xcc,	%f0,	%f8
	sub	%i6,	%g5,	%i0
	add	%i1,	0x1890,	%g4
	smul	%o2,	%i7,	%i2
	fmovrdgz	%i3,	%f6,	%f4
	movcc	%icc,	%i5,	%o4
	fcmpne16	%f8,	%f22,	%o5
	and	%o6,	0x055C,	%o3
	mulx	%l3,	%o7,	%g3
	fmul8x16al	%f1,	%f14,	%f0
	movvc	%xcc,	%o0,	%l5
	ldub	[%l7 + 0x25],	%o1
	array32	%g1,	%l1,	%g6
	ldub	[%l7 + 0x69],	%l4
	fandnot1	%f12,	%f2,	%f2
	or	%g2,	%l2,	%l0
	xnor	%l6,	%i4,	%g7
	sethi	0x1F09,	%i6
	fmovdgu	%icc,	%f13,	%f0
	stb	%i0,	[%l7 + 0x34]
	add	%i1,	0x0161,	%g4
	sdivx	%o2,	0x0461,	%i7
	fandnot1	%f0,	%f22,	%f10
	edge16n	%i2,	%i3,	%g5
	movvs	%icc,	%i5,	%o4
	sdivx	%o5,	0x176D,	%o6
	fpack32	%f0,	%f18,	%f10
	movgu	%icc,	%o3,	%l3
	edge32n	%o7,	%o0,	%l5
	fcmpeq32	%f26,	%f28,	%g3
	fmovse	%icc,	%f20,	%f28
	subccc	%o1,	0x1E02,	%l1
	sub	%g6,	%g1,	%l4
	fmovrdlez	%g2,	%f4,	%f10
	mulx	%l0,	%l6,	%i4
	xnor	%l2,	0x05A8,	%g7
	restore %i6, 0x09DE, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i1,	[%l7 + 0x24]
	lduw	[%l7 + 0x68],	%g4
	sdivx	%i7,	0x14E7,	%o2
	sllx	%i2,	0x0D,	%g5
	movleu	%xcc,	%i5,	%o4
	ldsb	[%l7 + 0x71],	%i3
	movpos	%icc,	%o5,	%o3
	lduw	[%l7 + 0x14],	%l3
	mulx	%o6,	%o0,	%o7
	fnand	%f18,	%f12,	%f24
	srax	%l5,	0x1D,	%o1
	or	%g3,	0x1033,	%g6
	fabss	%f2,	%f31
	srlx	%l1,	%l4,	%g1
	edge16n	%g2,	%l0,	%i4
	ldub	[%l7 + 0x0A],	%l6
	fcmps	%fcc2,	%f28,	%f0
	udiv	%l2,	0x00CF,	%i6
	add	%i0,	0x0A18,	%i1
	array16	%g7,	%i7,	%o2
	save %g4, 0x1831, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i5,	%g5
	edge32n	%o4,	%o5,	%i3
	sdivcc	%l3,	0x0652,	%o3
	movre	%o6,	%o0,	%o7
	movge	%icc,	%o1,	%l5
	stw	%g3,	[%l7 + 0x10]
	fmovdneg	%icc,	%f4,	%f2
	movpos	%icc,	%g6,	%l4
	fpmerge	%f9,	%f31,	%f8
	fmovsgu	%icc,	%f14,	%f7
	std	%f24,	[%l7 + 0x40]
	sth	%g1,	[%l7 + 0x72]
	ldd	[%l7 + 0x68],	%l0
	xnor	%g2,	%i4,	%l0
	sdiv	%l6,	0x1B8E,	%l2
	movge	%icc,	%i6,	%i0
	sth	%i1,	[%l7 + 0x1E]
	fmovde	%icc,	%f21,	%f0
	array16	%g7,	%o2,	%i7
	fpadd32	%f8,	%f20,	%f12
	sir	0x0197
	subcc	%i2,	%g4,	%g5
	movgu	%icc,	%i5,	%o5
	array8	%i3,	%l3,	%o3
	addcc	%o6,	%o4,	%o0
	movgu	%icc,	%o7,	%l5
	fmovrdlez	%g3,	%f30,	%f24
	popc	0x0BBC,	%g6
	fmovse	%xcc,	%f14,	%f15
	sll	%l4,	0x03,	%g1
	movn	%icc,	%o1,	%g2
	orncc	%l1,	%l0,	%l6
	edge16l	%l2,	%i4,	%i0
	fpmerge	%f1,	%f14,	%f16
	movleu	%xcc,	%i6,	%g7
	ldx	[%l7 + 0x78],	%i1
	umulcc	%i7,	%i2,	%g4
	movn	%icc,	%o2,	%g5
	fcmpeq16	%f24,	%f2,	%i5
	popc	0x1CB9,	%i3
	fpadd32s	%f19,	%f29,	%f9
	fcmpne32	%f28,	%f14,	%l3
	orncc	%o5,	%o3,	%o4
	fmovsvc	%xcc,	%f27,	%f25
	and	%o0,	%o7,	%o6
	xor	%l5,	%g3,	%l4
	ldsb	[%l7 + 0x4A],	%g1
	ldd	[%l7 + 0x68],	%f24
	xnor	%o1,	0x1C82,	%g6
	edge32	%g2,	%l1,	%l0
	subcc	%l6,	%i4,	%i0
	udivx	%l2,	0x05C9,	%i6
	edge16	%g7,	%i7,	%i2
	smul	%g4,	%i1,	%g5
	xorcc	%o2,	%i3,	%i5
	stx	%o5,	[%l7 + 0x60]
	ldsh	[%l7 + 0x2A],	%l3
	movrgez	%o3,	%o4,	%o7
	sllx	%o6,	0x0C,	%l5
	fcmpne32	%f26,	%f4,	%g3
	ldx	[%l7 + 0x08],	%l4
	movvc	%icc,	%g1,	%o1
	udivx	%g6,	0x1F66,	%g2
	or	%o0,	0x04CF,	%l0
	edge8	%l1,	%i4,	%l6
	fmovsvc	%xcc,	%f24,	%f11
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	addcc	%g7,	0x12D0,	%i7
	xnor	%g4,	0x1CEF,	%i1
	fcmple16	%f8,	%f20,	%i2
	mulx	%o2,	%i3,	%i5
	movrgez	%g5,	0x35D,	%o5
	edge16n	%l3,	%o3,	%o4
	stx	%o6,	[%l7 + 0x68]
	edge8l	%o7,	%g3,	%l5
	fmovsa	%icc,	%f24,	%f30
	sethi	0x1A30,	%l4
	fpackfix	%f24,	%f26
	fmul8ulx16	%f0,	%f8,	%f14
	srlx	%o1,	0x07,	%g1
	fmovsneg	%xcc,	%f20,	%f9
	movrgz	%g2,	0x23E,	%g6
	edge16l	%o0,	%l0,	%i4
	movl	%icc,	%l6,	%i0
	edge32ln	%l1,	%l2,	%g7
	srlx	%i7,	%i6,	%i1
	restore %i2, 0x1B5D, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f19,	%f28,	%f11
	addc	%o2,	0x0CC5,	%i3
	edge16	%i5,	%o5,	%g5
	edge8n	%l3,	%o3,	%o4
	smul	%o6,	%g3,	%l5
	sethi	0x1512,	%o7
	fmovdleu	%xcc,	%f15,	%f30
	srl	%l4,	%g1,	%g2
	fcmpeq32	%f10,	%f24,	%o1
	edge32ln	%g6,	%o0,	%i4
	edge8ln	%l0,	%l6,	%l1
	alignaddrl	%l2,	%g7,	%i7
	orcc	%i0,	0x136E,	%i1
	sllx	%i2,	0x02,	%i6
	std	%f12,	[%l7 + 0x30]
	umul	%o2,	%i3,	%i5
	movn	%icc,	%g4,	%o5
	movvc	%xcc,	%g5,	%l3
	ldd	[%l7 + 0x18],	%f24
	array8	%o3,	%o4,	%o6
	ldd	[%l7 + 0x38],	%f12
	sdivcc	%l5,	0x0D36,	%o7
	addcc	%g3,	%g1,	%g2
	ldd	[%l7 + 0x38],	%f8
	fnot2	%f18,	%f4
	movg	%xcc,	%o1,	%l4
	fmovd	%f4,	%f6
	fmovdg	%xcc,	%f31,	%f18
	ld	[%l7 + 0x68],	%f3
	edge8ln	%o0,	%g6,	%l0
	movre	%l6,	0x27C,	%l1
	sllx	%i4,	%l2,	%g7
	edge32n	%i7,	%i1,	%i2
	fcmpes	%fcc1,	%f24,	%f4
	fxor	%f18,	%f6,	%f14
	sub	%i6,	0x172D,	%i0
	fzero	%f10
	movre	%i3,	%i5,	%g4
	fmovsle	%icc,	%f1,	%f5
	array16	%o5,	%g5,	%o2
	lduw	[%l7 + 0x78],	%o3
	std	%f26,	[%l7 + 0x18]
	ld	[%l7 + 0x0C],	%f30
	movrlez	%o4,	0x011,	%o6
	fmovrdlez	%l5,	%f12,	%f18
	and	%o7,	%g3,	%g1
	fnot2s	%f24,	%f11
	sll	%l3,	0x09,	%g2
	movrgez	%o1,	%o0,	%g6
	for	%f12,	%f10,	%f20
	sth	%l4,	[%l7 + 0x6C]
	movpos	%xcc,	%l0,	%l1
	for	%f24,	%f0,	%f14
	andncc	%i4,	%l2,	%g7
	save %l6, %i7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i1,	0x06A4,	%i6
	movn	%xcc,	%i3,	%i5
	mulscc	%i0,	%o5,	%g5
	movrgz	%g4,	%o3,	%o2
	sra	%o6,	%l5,	%o7
	sth	%g3,	[%l7 + 0x1E]
	andcc	%g1,	0x1229,	%o4
	ldx	[%l7 + 0x28],	%g2
	movgu	%icc,	%o1,	%o0
	addcc	%g6,	0x18B9,	%l4
	ldd	[%l7 + 0x18],	%f8
	movrlez	%l0,	%l3,	%l1
	faligndata	%f8,	%f10,	%f2
	orncc	%i4,	%l2,	%l6
	andncc	%i7,	%i2,	%i1
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	save %i0, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g5, 0x0AA0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o3,	%o2
	lduh	[%l7 + 0x4C],	%o6
	popc	0x07EB,	%o7
	fmovdl	%icc,	%f7,	%f14
	smul	%g3,	%g1,	%l5
	andncc	%o4,	%o1,	%g2
	fmovsl	%icc,	%f24,	%f22
	movrgz	%o0,	0x0EC,	%g6
	xnor	%l0,	0x0CAE,	%l4
	sub	%l1,	0x08D9,	%i4
	mova	%xcc,	%l2,	%l6
	sdiv	%i7,	0x031F,	%i2
	andncc	%l3,	%i6,	%i1
	fmovsgu	%icc,	%f11,	%f9
	fmovspos	%icc,	%f27,	%f0
	restore %i5, %i0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i3,	[%l7 + 0x18]
	fpsub16s	%f10,	%f31,	%f25
	ldsh	[%l7 + 0x08],	%g5
	edge16	%g4,	%o3,	%o5
	movcc	%icc,	%o6,	%o2
	edge16ln	%g3,	%o7,	%l5
	array8	%g1,	%o4,	%o1
	addcc	%o0,	%g6,	%l0
	movleu	%xcc,	%g2,	%l4
	movrne	%l1,	%l2,	%l6
	fpackfix	%f20,	%f21
	fandnot1s	%f14,	%f6,	%f6
	fnegd	%f26,	%f0
	smul	%i4,	0x1B92,	%i7
	stw	%i2,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x0C],	%i6
	fmovrdgez	%i1,	%f18,	%f2
	xnor	%i5,	%l3,	%i0
	movre	%g7,	0x26C,	%g5
	stx	%g4,	[%l7 + 0x60]
	movrlz	%i3,	0x149,	%o3
	edge16ln	%o5,	%o2,	%g3
	movre	%o7,	%l5,	%g1
	movge	%icc,	%o4,	%o1
	st	%f30,	[%l7 + 0x3C]
	movgu	%xcc,	%o6,	%o0
	fpadd16	%f0,	%f18,	%f20
	movrgez	%l0,	0x167,	%g2
	array16	%g6,	%l4,	%l2
	udivcc	%l6,	0x1706,	%l1
	edge8	%i7,	%i4,	%i2
	movvc	%xcc,	%i1,	%i5
	alignaddrl	%i6,	%i0,	%g7
	fmovsn	%xcc,	%f2,	%f23
	udiv	%g5,	0x10FD,	%l3
	ldd	[%l7 + 0x68],	%g4
	udiv	%i3,	0x093B,	%o5
	fmul8x16au	%f24,	%f30,	%f18
	movrne	%o3,	%o2,	%g3
	umul	%l5,	%g1,	%o7
	subccc	%o1,	%o4,	%o6
	edge16	%l0,	%o0,	%g6
	fsrc1s	%f1,	%f6
	addccc	%l4,	%g2,	%l6
	st	%f23,	[%l7 + 0x7C]
	fmul8x16	%f10,	%f30,	%f28
	movrgez	%l2,	0x3E8,	%i7
	srl	%l1,	0x0E,	%i4
	edge32	%i1,	%i5,	%i6
	addccc	%i0,	%i2,	%g5
	mulscc	%g7,	0x18B2,	%g4
	sll	%i3,	%l3,	%o3
	alignaddr	%o5,	%o2,	%l5
	fcmpne16	%f8,	%f22,	%g3
	fmovrdne	%g1,	%f10,	%f6
	nop
	set	0x34, %o4
	ldsw	[%l7 + %o4],	%o7
	add	%o1,	%o4,	%o6
	sdivx	%l0,	0x1885,	%g6
	fpadd16s	%f30,	%f6,	%f1
	fxnor	%f28,	%f22,	%f24
	edge16l	%o0,	%g2,	%l6
	add	%l2,	%l4,	%i7
	lduh	[%l7 + 0x56],	%l1
	movg	%icc,	%i1,	%i4
	orn	%i6,	0x1886,	%i5
	movcs	%xcc,	%i0,	%i2
	mulx	%g7,	%g4,	%g5
	smul	%l3,	0x1511,	%o3
	udiv	%i3,	0x0057,	%o2
	addccc	%l5,	0x0DCD,	%g3
	movcc	%icc,	%o5,	%o7
	fmovsneg	%xcc,	%f30,	%f29
	ldx	[%l7 + 0x40],	%g1
	movne	%icc,	%o4,	%o6
	sll	%o1,	0x00,	%g6
	stx	%l0,	[%l7 + 0x48]
	save %g2, 0x0380, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%icc,	%f0,	%f30
	fmul8x16al	%f9,	%f16,	%f20
	sdivcc	%o0,	0x164B,	%l4
	mulx	%i7,	%l1,	%l2
	movleu	%xcc,	%i1,	%i6
	xorcc	%i4,	%i0,	%i5
	andncc	%i2,	%g4,	%g5
	fnor	%f4,	%f12,	%f4
	srlx	%g7,	%l3,	%o3
	subcc	%o2,	%l5,	%g3
	movleu	%xcc,	%i3,	%o5
	smul	%g1,	%o4,	%o6
	ldd	[%l7 + 0x30],	%o0
	movne	%xcc,	%g6,	%o7
	mova	%xcc,	%l0,	%l6
	edge32l	%g2,	%l4,	%o0
	fone	%f26
	movge	%xcc,	%i7,	%l2
	alignaddrl	%i1,	%i6,	%l1
	movrne	%i4,	0x3D9,	%i5
	ldd	[%l7 + 0x30],	%i0
	edge8l	%g4,	%i2,	%g5
	fmul8x16au	%f5,	%f16,	%f6
	lduh	[%l7 + 0x1E],	%l3
	or	%o3,	0x1BE7,	%o2
	mulx	%l5,	%g7,	%g3
	subcc	%i3,	%o5,	%o4
	fnors	%f12,	%f25,	%f23
	smulcc	%o6,	%o1,	%g1
	movn	%xcc,	%g6,	%o7
	xnor	%l0,	%g2,	%l4
	fmovscs	%xcc,	%f15,	%f7
	movgu	%icc,	%o0,	%i7
	sethi	0x0D79,	%l2
	subccc	%i1,	0x1120,	%i6
	fmovsg	%xcc,	%f7,	%f23
	array8	%l1,	%l6,	%i4
	edge16l	%i5,	%i0,	%i2
	fmovrdlez	%g5,	%f30,	%f14
	smul	%g4,	0x05B5,	%o3
	smulcc	%l3,	0x1752,	%l5
	movrgz	%o2,	0x127,	%g3
	orncc	%g7,	0x11B1,	%i3
	fmuld8sux16	%f25,	%f0,	%f10
	edge32ln	%o4,	%o5,	%o1
	st	%f9,	[%l7 + 0x74]
	subcc	%g1,	0x064A,	%o6
	sdiv	%g6,	0x18A6,	%l0
	xnor	%o7,	0x03D6,	%l4
	edge8	%o0,	%g2,	%i7
	ldx	[%l7 + 0x10],	%l2
	ldd	[%l7 + 0x78],	%i6
	fmovsge	%xcc,	%f17,	%f4
	umulcc	%l1,	0x17AA,	%i1
	subccc	%i4,	%l6,	%i5
	fandnot2s	%f2,	%f10,	%f1
	addcc	%i2,	0x0284,	%i0
	xnorcc	%g4,	0x0AB3,	%o3
	stw	%g5,	[%l7 + 0x24]
	stw	%l3,	[%l7 + 0x0C]
	nop
	set	0x7E, %o1
	ldsb	[%l7 + %o1],	%o2
	fcmpne32	%f14,	%f2,	%l5
	movrne	%g7,	0x3DF,	%g3
	xor	%o4,	0x0C9C,	%i3
	movneg	%xcc,	%o1,	%o5
	movvs	%icc,	%g1,	%o6
	ldsb	[%l7 + 0x2E],	%g6
	edge32	%o7,	%l0,	%o0
	srax	%g2,	0x13,	%i7
	orn	%l2,	%l4,	%l1
	udivx	%i1,	0x09E4,	%i6
	addc	%l6,	%i4,	%i2
	ld	[%l7 + 0x20],	%f21
	sra	%i5,	%i0,	%g4
	xorcc	%o3,	%g5,	%l3
	movgu	%xcc,	%o2,	%l5
	move	%xcc,	%g3,	%g7
	ld	[%l7 + 0x6C],	%f30
	st	%f0,	[%l7 + 0x34]
	fnot2s	%f27,	%f10
	fone	%f20
	udivx	%i3,	0x0DBE,	%o1
	xnor	%o5,	0x1960,	%o4
	fands	%f22,	%f28,	%f3
	nop
	set	0x10, %i5
	lduw	[%l7 + %i5],	%o6
	sll	%g1,	%o7,	%g6
	std	%f16,	[%l7 + 0x10]
	xnorcc	%l0,	0x1886,	%g2
	fmovrdlz	%o0,	%f14,	%f14
	move	%icc,	%l2,	%l4
	movvc	%icc,	%i7,	%l1
	fpadd16	%f16,	%f30,	%f6
	sir	0x0487
	array8	%i6,	%l6,	%i4
	movneg	%icc,	%i2,	%i5
	fandnot1s	%f7,	%f24,	%f3
	fzero	%f20
	and	%i1,	0x04E9,	%i0
	movne	%icc,	%g4,	%o3
	sll	%g5,	%l3,	%l5
	movvc	%xcc,	%g3,	%g7
	fnegs	%f6,	%f0
	andcc	%i3,	%o2,	%o5
	and	%o4,	0x1574,	%o1
	movle	%xcc,	%g1,	%o6
	sir	0x169D
	srl	%g6,	0x0B,	%l0
	sth	%g2,	[%l7 + 0x4C]
	edge16l	%o0,	%o7,	%l2
	andn	%i7,	0x00AF,	%l4
	movleu	%xcc,	%l1,	%i6
	fmovrdne	%i4,	%f14,	%f22
	edge8ln	%l6,	%i2,	%i5
	mova	%xcc,	%i1,	%i0
	fmovde	%xcc,	%f27,	%f10
	andcc	%o3,	%g5,	%g4
	movge	%icc,	%l3,	%l5
	udiv	%g7,	0x1FFB,	%i3
	movrlz	%g3,	%o2,	%o5
	orncc	%o4,	%o1,	%o6
	fmovrdne	%g6,	%f30,	%f18
	edge16	%l0,	%g1,	%g2
	umulcc	%o7,	0x1BC9,	%l2
	edge32n	%o0,	%l4,	%i7
	movne	%icc,	%i6,	%i4
	lduw	[%l7 + 0x60],	%l1
	sdiv	%i2,	0x0572,	%l6
	stx	%i5,	[%l7 + 0x60]
	edge16ln	%i1,	%o3,	%g5
	fcmpes	%fcc2,	%f25,	%f14
	sllx	%g4,	%i0,	%l5
	movrgez	%g7,	%i3,	%g3
	array16	%o2,	%l3,	%o4
	movn	%xcc,	%o5,	%o1
	edge8ln	%o6,	%g6,	%g1
	fands	%f13,	%f5,	%f11
	xnor	%g2,	%o7,	%l0
	edge32ln	%o0,	%l4,	%i7
	subccc	%l2,	0x1FA8,	%i6
	edge16	%i4,	%l1,	%i2
	sllx	%l6,	0x11,	%i5
	umul	%o3,	%g5,	%i1
	fnands	%f16,	%f7,	%f7
	array16	%g4,	%l5,	%i0
	subccc	%i3,	%g3,	%o2
	andncc	%g7,	%o4,	%l3
	srax	%o1,	0x16,	%o6
	edge32	%o5,	%g1,	%g6
	stw	%g2,	[%l7 + 0x10]
	sdivcc	%l0,	0x1E52,	%o7
	popc	0x0F48,	%l4
	ldsh	[%l7 + 0x26],	%i7
	edge8n	%o0,	%l2,	%i4
	stw	%l1,	[%l7 + 0x28]
	andcc	%i6,	0x01E1,	%l6
	fzero	%f28
	andn	%i2,	%o3,	%g5
	mulx	%i5,	%i1,	%l5
	fmovdg	%xcc,	%f12,	%f22
	fmovsa	%icc,	%f4,	%f9
	ldx	[%l7 + 0x10],	%i0
	edge16	%g4,	%i3,	%o2
	edge16l	%g3,	%o4,	%l3
	edge32ln	%o1,	%o6,	%o5
	alignaddr	%g1,	%g6,	%g7
	smulcc	%g2,	%o7,	%l0
	fmovse	%xcc,	%f1,	%f12
	fandnot1s	%f21,	%f25,	%f29
	subc	%i7,	%l4,	%o0
	edge32	%l2,	%l1,	%i6
	pdist	%f0,	%f12,	%f30
	array16	%l6,	%i4,	%o3
	sra	%g5,	%i5,	%i1
	or	%l5,	%i0,	%g4
	andn	%i2,	0x19B4,	%o2
	udivcc	%i3,	0x186D,	%g3
	fmuld8ulx16	%f27,	%f11,	%f28
	andcc	%o4,	%o1,	%o6
	sdiv	%o5,	0x151C,	%g1
	edge8n	%l3,	%g6,	%g2
	fabss	%f18,	%f31
	xorcc	%g7,	%l0,	%i7
	movge	%xcc,	%o7,	%l4
	orcc	%l2,	0x0294,	%l1
	fxors	%f11,	%f16,	%f9
	fmovsn	%icc,	%f18,	%f23
	fmovsleu	%xcc,	%f10,	%f7
	movneg	%xcc,	%i6,	%o0
	andcc	%i4,	%o3,	%l6
	ldsb	[%l7 + 0x5A],	%i5
	ld	[%l7 + 0x5C],	%f5
	stw	%i1,	[%l7 + 0x60]
	fcmpgt16	%f22,	%f18,	%l5
	fornot1s	%f7,	%f20,	%f31
	fmovdcc	%icc,	%f7,	%f16
	orncc	%i0,	%g4,	%i2
	alignaddrl	%g5,	%o2,	%g3
	mulx	%o4,	%i3,	%o1
	fandnot2s	%f2,	%f5,	%f30
	ldx	[%l7 + 0x78],	%o6
	ldsw	[%l7 + 0x64],	%g1
	nop
	set	0x50, %i3
	stx	%l3,	[%l7 + %i3]
	pdist	%f6,	%f30,	%f2
	move	%xcc,	%o5,	%g6
	move	%icc,	%g2,	%g7
	fornot1s	%f15,	%f12,	%f11
	udivcc	%l0,	0x0557,	%i7
	addcc	%l4,	0x181A,	%o7
	popc	%l1,	%l2
	fnegd	%f0,	%f20
	movvs	%icc,	%i6,	%i4
	fmovrslez	%o0,	%f24,	%f20
	xorcc	%l6,	0x1E7D,	%i5
	sth	%o3,	[%l7 + 0x7A]
	edge32l	%i1,	%i0,	%g4
	movvc	%icc,	%i2,	%g5
	lduh	[%l7 + 0x2A],	%o2
	ld	[%l7 + 0x1C],	%f22
	or	%l5,	%g3,	%i3
	udivx	%o4,	0x0124,	%o6
	orncc	%g1,	%o1,	%l3
	andncc	%o5,	%g6,	%g7
	addc	%l0,	%i7,	%g2
	ldd	[%l7 + 0x30],	%l4
	lduw	[%l7 + 0x2C],	%l1
	edge8n	%o7,	%l2,	%i6
	srlx	%i4,	%l6,	%o0
	array8	%i5,	%i1,	%i0
	movcc	%icc,	%g4,	%o3
	fmovsg	%xcc,	%f25,	%f5
	fmovrdne	%i2,	%f10,	%f4
	fpadd32	%f30,	%f20,	%f12
	mulscc	%o2,	0x1108,	%l5
	fors	%f23,	%f31,	%f27
	movcs	%xcc,	%g5,	%i3
	movrgez	%o4,	0x35E,	%g3
	xor	%o6,	0x119E,	%o1
	fmul8x16	%f9,	%f8,	%f26
	movrgz	%l3,	%g1,	%g6
	nop
	set	0x7C, %g5
	sth	%g7,	[%l7 + %g5]
	fmovdl	%xcc,	%f6,	%f3
	xnorcc	%l0,	0x138C,	%o5
	ldsb	[%l7 + 0x63],	%i7
	edge8ln	%g2,	%l1,	%l4
	umulcc	%l2,	%o7,	%i4
	fmovd	%f30,	%f6
	movvc	%xcc,	%l6,	%o0
	fmovdle	%icc,	%f29,	%f30
	edge8	%i5,	%i6,	%i1
	orcc	%g4,	%o3,	%i2
	fmovsleu	%icc,	%f27,	%f29
	array8	%o2,	%i0,	%g5
	fsrc2	%f6,	%f6
	std	%f26,	[%l7 + 0x08]
	fpadd16	%f8,	%f8,	%f20
	movrgez	%i3,	%o4,	%g3
	andcc	%l5,	0x1472,	%o1
	movneg	%xcc,	%o6,	%g1
	andn	%l3,	%g6,	%g7
	nop
	set	0x50, %g6
	lduh	[%l7 + %g6],	%l0
	movcs	%icc,	%i7,	%g2
	mulx	%l1,	%l4,	%l2
	ld	[%l7 + 0x58],	%f16
	ld	[%l7 + 0x4C],	%f19
	movvs	%xcc,	%o5,	%o7
	ldub	[%l7 + 0x14],	%i4
	movvs	%xcc,	%o0,	%i5
	sub	%i6,	%i1,	%g4
	fornot2	%f18,	%f6,	%f26
	movgu	%icc,	%l6,	%i2
	mova	%xcc,	%o2,	%i0
	orcc	%o3,	%g5,	%o4
	srlx	%g3,	0x15,	%l5
	fmovda	%xcc,	%f19,	%f13
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	fmovrse	%o6,	%f7,	%f3
	fpadd16s	%f3,	%f27,	%f27
	orncc	%l3,	%g6,	%g1
	alignaddr	%g7,	%i7,	%g2
	ldsh	[%l7 + 0x64],	%l1
	movle	%xcc,	%l0,	%l2
	sllx	%o5,	%o7,	%i4
	fmovsn	%xcc,	%f29,	%f15
	fornot1	%f24,	%f18,	%f28
	edge32	%l4,	%o0,	%i5
	addccc	%i6,	%g4,	%i1
	movrlez	%i2,	%o2,	%l6
	orcc	%o3,	%g5,	%o4
	udivx	%i0,	0x0805,	%l5
	sdivcc	%g3,	0x1EEF,	%i3
	xor	%o1,	0x0610,	%l3
	fsrc2s	%f29,	%f30
	udivcc	%g6,	0x0256,	%o6
	sdivcc	%g7,	0x0886,	%i7
	andn	%g1,	0x18AA,	%l1
	movrgez	%l0,	%l2,	%o5
	fmul8ulx16	%f10,	%f12,	%f12
	add	%o7,	%i4,	%g2
	fone	%f20
	fornot2s	%f16,	%f18,	%f3
	sir	0x1535
	array8	%o0,	%i5,	%i6
	xnorcc	%g4,	%l4,	%i2
	orcc	%o2,	%l6,	%o3
	movneg	%xcc,	%i1,	%o4
	edge32ln	%g5,	%i0,	%g3
	edge8n	%i3,	%o1,	%l5
	andn	%g6,	%o6,	%l3
	mova	%icc,	%g7,	%i7
	smulcc	%l1,	%g1,	%l0
	xnor	%l2,	0x1ED4,	%o5
	stw	%i4,	[%l7 + 0x10]
	sdivcc	%g2,	0x10E0,	%o0
	ld	[%l7 + 0x3C],	%f18
	sra	%i5,	0x18,	%o7
	save %i6, %g4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	%o2,	%l6
	fmovdge	%icc,	%f15,	%f12
	xnor	%o3,	0x174A,	%o4
	fpadd16	%f2,	%f14,	%f14
	xnor	%g5,	0x1B10,	%i0
	popc	%i1,	%i3
	xnor	%g3,	0x0A96,	%l5
	sra	%g6,	%o1,	%l3
	and	%g7,	%o6,	%l1
	udiv	%g1,	0x05BD,	%i7
	mova	%icc,	%l0,	%o5
	fmovd	%f8,	%f26
	ldx	[%l7 + 0x58],	%l2
	edge32ln	%i4,	%o0,	%i5
	mova	%icc,	%g2,	%i6
	movrgez	%o7,	%g4,	%l4
	edge32ln	%o2,	%i2,	%l6
	orncc	%o3,	0x1918,	%o4
	movvc	%xcc,	%i0,	%g5
	edge16l	%i1,	%i3,	%l5
	fcmple32	%f18,	%f16,	%g6
	fmovscs	%xcc,	%f9,	%f3
	or	%g3,	%l3,	%g7
	edge32ln	%o6,	%l1,	%g1
	array32	%i7,	%o1,	%o5
	ldd	[%l7 + 0x20],	%l2
	addccc	%l0,	%o0,	%i4
	alignaddrl	%i5,	%g2,	%i6
	lduw	[%l7 + 0x7C],	%o7
	faligndata	%f24,	%f12,	%f28
	sdivcc	%l4,	0x03E6,	%g4
	mulscc	%o2,	0x0775,	%i2
	fmuld8ulx16	%f15,	%f3,	%f18
	edge32l	%o3,	%l6,	%o4
	movrgez	%i0,	%i1,	%g5
	orn	%l5,	%i3,	%g6
	sub	%l3,	%g3,	%g7
	movcc	%icc,	%l1,	%g1
	movle	%xcc,	%o6,	%o1
	ldsh	[%l7 + 0x3C],	%i7
	fmovsge	%xcc,	%f26,	%f23
	srax	%o5,	%l0,	%l2
	sir	0x09AE
	umulcc	%i4,	0x0226,	%i5
	xnor	%g2,	0x1754,	%o0
	fcmpeq32	%f6,	%f6,	%i6
	xorcc	%o7,	0x04BF,	%g4
	fmovdpos	%xcc,	%f19,	%f24
	sll	%o2,	%i2,	%o3
	or	%l4,	%o4,	%i0
	sub	%i1,	0x0B1E,	%g5
	fmovdcs	%xcc,	%f29,	%f18
	fmovdvs	%icc,	%f9,	%f1
	stw	%l6,	[%l7 + 0x78]
	edge32ln	%i3,	%l5,	%l3
	fmovdge	%icc,	%f15,	%f4
	sdiv	%g3,	0x1DFE,	%g6
	movrlez	%l1,	0x374,	%g1
	movgu	%icc,	%o6,	%o1
	alignaddrl	%g7,	%i7,	%o5
	srlx	%l2,	%l0,	%i4
	fornot2s	%f24,	%f16,	%f19
	movn	%icc,	%g2,	%o0
	st	%f20,	[%l7 + 0x1C]
	restore %i6, 0x15B4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%g4,	%o2
	fnegd	%f14,	%f14
	fcmpeq32	%f18,	%f2,	%o3
	fmovse	%icc,	%f29,	%f3
	fmovdne	%xcc,	%f22,	%f0
	fmul8x16al	%f1,	%f25,	%f26
	movrne	%i2,	0x028,	%l4
	fpmerge	%f31,	%f2,	%f24
	ld	[%l7 + 0x2C],	%f13
	movl	%xcc,	%o4,	%i1
	add	%g5,	%i0,	%i3
	edge16n	%l6,	%l5,	%g3
	udivx	%g6,	0x00AF,	%l1
	fcmpeq16	%f0,	%f4,	%g1
	sdiv	%o6,	0x1E95,	%l3
	orn	%o1,	%i7,	%g7
	ldub	[%l7 + 0x0F],	%l2
	edge16l	%o5,	%l0,	%g2
	udiv	%o0,	0x069C,	%i4
	movg	%xcc,	%o7,	%i6
	udivcc	%i5,	0x0DBB,	%g4
	fmovdpos	%xcc,	%f27,	%f13
	fpsub16s	%f14,	%f26,	%f17
	udiv	%o2,	0x12B1,	%o3
	fands	%f6,	%f19,	%f10
	ldub	[%l7 + 0x27],	%i2
	fcmpeq32	%f10,	%f22,	%o4
	movvc	%xcc,	%l4,	%i1
	movgu	%icc,	%g5,	%i0
	edge8	%i3,	%l6,	%g3
	srl	%g6,	%l5,	%g1
	stx	%o6,	[%l7 + 0x28]
	popc	%l3,	%l1
	srax	%i7,	%g7,	%l2
	mova	%xcc,	%o5,	%l0
	ldsw	[%l7 + 0x60],	%g2
	movcc	%icc,	%o1,	%o0
	fnot2s	%f0,	%f31
	movleu	%icc,	%o7,	%i6
	ldd	[%l7 + 0x78],	%f16
	movgu	%xcc,	%i4,	%g4
	move	%icc,	%i5,	%o2
	fandnot1s	%f20,	%f10,	%f22
	fcmple32	%f24,	%f12,	%o3
	sllx	%i2,	%l4,	%o4
	fpsub32	%f8,	%f20,	%f2
	udivx	%i1,	0x1AEA,	%g5
	movneg	%xcc,	%i0,	%l6
	fornot1s	%f1,	%f14,	%f25
	fzero	%f26
	mulscc	%g3,	0x0CD5,	%i3
	orcc	%l5,	0x1600,	%g1
	fmovrsgez	%o6,	%f13,	%f7
	edge32n	%l3,	%l1,	%i7
	ld	[%l7 + 0x70],	%f15
	array16	%g6,	%l2,	%o5
	nop
	set	0x10, %g3
	sth	%l0,	[%l7 + %g3]
	mova	%icc,	%g7,	%o1
	movrlez	%g2,	0x225,	%o7
	movneg	%xcc,	%o0,	%i6
	fandnot1	%f24,	%f24,	%f18
	movl	%xcc,	%g4,	%i4
	sdivx	%o2,	0x1200,	%i5
	addc	%i2,	%l4,	%o3
	ldd	[%l7 + 0x28],	%i0
	sdiv	%o4,	0x1039,	%i0
	fmovrsne	%g5,	%f8,	%f5
	edge32l	%g3,	%l6,	%i3
	save %g1, 0x08FD, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l3,	%o6,	%l1
	xorcc	%g6,	0x1EF1,	%l2
	sir	0x1E16
	fcmpes	%fcc0,	%f2,	%f17
	movneg	%xcc,	%i7,	%l0
	udivcc	%o5,	0x018C,	%g7
	andn	%o1,	0x16AF,	%g2
	fmovrsgz	%o0,	%f4,	%f12
	mulx	%o7,	0x0890,	%g4
	movrgez	%i6,	%o2,	%i4
	orcc	%i2,	%i5,	%o3
	edge32	%i1,	%o4,	%l4
	srlx	%i0,	0x09,	%g3
	addcc	%g5,	0x0EA7,	%i3
	fmuld8ulx16	%f14,	%f28,	%f8
	movg	%icc,	%g1,	%l5
	sdivx	%l6,	0x01AF,	%o6
	edge16	%l3,	%g6,	%l2
	movrlez	%l1,	%l0,	%i7
	sdivx	%o5,	0x07ED,	%g7
	movvs	%xcc,	%g2,	%o0
	stx	%o7,	[%l7 + 0x10]
	srax	%g4,	0x1F,	%o1
	std	%f14,	[%l7 + 0x18]
	smul	%i6,	%i4,	%o2
	smul	%i2,	0x0BC2,	%i5
	movn	%icc,	%i1,	%o3
	edge32	%o4,	%i0,	%l4
	fmovdleu	%xcc,	%f22,	%f15
	ld	[%l7 + 0x6C],	%f24
	edge16	%g5,	%g3,	%i3
	smulcc	%g1,	%l5,	%o6
	array32	%l6,	%l3,	%l2
	alignaddrl	%l1,	%l0,	%g6
	sllx	%i7,	%g7,	%g2
	pdist	%f8,	%f22,	%f6
	fands	%f18,	%f2,	%f11
	fpackfix	%f22,	%f31
	nop
	set	0x50, %l2
	stw	%o5,	[%l7 + %l2]
	popc	0x1DF2,	%o7
	stx	%g4,	[%l7 + 0x10]
	edge8l	%o0,	%o1,	%i4
	sth	%o2,	[%l7 + 0x4E]
	sethi	0x128E,	%i6
	fmovdge	%xcc,	%f24,	%f7
	fandnot2s	%f30,	%f13,	%f4
	array32	%i5,	%i2,	%o3
	alignaddr	%i1,	%o4,	%l4
	fmuld8sux16	%f25,	%f6,	%f6
	fandnot1	%f2,	%f14,	%f16
	fsrc1s	%f2,	%f5
	edge32	%i0,	%g5,	%g3
	fsrc2	%f30,	%f2
	udivcc	%i3,	0x1655,	%l5
	edge8	%g1,	%l6,	%l3
	mova	%icc,	%l2,	%o6
	stw	%l1,	[%l7 + 0x1C]
	edge32l	%l0,	%i7,	%g7
	srl	%g2,	0x0E,	%o5
	xnorcc	%g6,	%g4,	%o0
	srl	%o7,	%o1,	%o2
	move	%xcc,	%i4,	%i6
	fandnot1	%f10,	%f2,	%f26
	edge16	%i5,	%o3,	%i2
	movcs	%icc,	%i1,	%o4
	ldsb	[%l7 + 0x1E],	%l4
	add	%i0,	0x1368,	%g3
	sllx	%i3,	%g5,	%g1
	edge32l	%l5,	%l3,	%l2
	xor	%o6,	%l6,	%l1
	fxnors	%f24,	%f28,	%f11
	fmovsgu	%icc,	%f22,	%f27
	nop
	set	0x7E, %g4
	sth	%l0,	[%l7 + %g4]
	subc	%g7,	%g2,	%i7
	movrgez	%o5,	0x315,	%g4
	xnor	%o0,	0x1B1B,	%o7
	fmovsneg	%icc,	%f3,	%f15
	stx	%o1,	[%l7 + 0x68]
	movne	%xcc,	%g6,	%o2
	fxnor	%f24,	%f14,	%f0
	ldsw	[%l7 + 0x14],	%i6
	movl	%icc,	%i4,	%o3
	nop
	set	0x71, %g7
	stb	%i5,	[%l7 + %g7]
	udiv	%i2,	0x1F6D,	%i1
	umulcc	%l4,	0x0A23,	%i0
	edge16n	%g3,	%i3,	%g5
	st	%f25,	[%l7 + 0x70]
	alignaddrl	%g1,	%o4,	%l3
	andncc	%l2,	%o6,	%l5
	movpos	%xcc,	%l1,	%l6
	ldsw	[%l7 + 0x2C],	%g7
	mova	%xcc,	%l0,	%g2
	xnor	%i7,	0x0F05,	%g4
	alignaddrl	%o0,	%o5,	%o1
	orncc	%o7,	%g6,	%o2
	movne	%xcc,	%i6,	%o3
	sir	0x1CF7
	umulcc	%i4,	0x1D5D,	%i5
	movrlz	%i2,	0x302,	%i1
	fpsub16	%f0,	%f6,	%f20
	fpack32	%f8,	%f4,	%f22
	sllx	%i0,	0x11,	%g3
	move	%icc,	%i3,	%g5
	movvc	%xcc,	%l4,	%o4
	fcmple16	%f8,	%f0,	%l3
	edge16l	%g1,	%l2,	%o6
	fmovdvs	%icc,	%f14,	%f25
	nop
	set	0x17, %i6
	ldub	[%l7 + %i6],	%l1
	xor	%l6,	%g7,	%l0
	stw	%g2,	[%l7 + 0x58]
	fzeros	%f29
	sllx	%i7,	%g4,	%o0
	fnors	%f5,	%f1,	%f24
	fmovrsne	%l5,	%f16,	%f3
	xorcc	%o5,	0x006B,	%o7
	movrgz	%g6,	0x0F6,	%o2
	popc	%o1,	%i6
	movl	%icc,	%o3,	%i4
	pdist	%f8,	%f22,	%f20
	stb	%i5,	[%l7 + 0x40]
	ldd	[%l7 + 0x78],	%i0
	addcc	%i0,	%g3,	%i3
	array16	%i2,	%g5,	%l4
	fmovrdne	%o4,	%f28,	%f2
	fnegs	%f21,	%f14
	addccc	%g1,	%l2,	%l3
	addcc	%l1,	%l6,	%o6
	fmovsvc	%icc,	%f3,	%f4
	fsrc2	%f18,	%f24
	fmovrsgz	%l0,	%f21,	%f7
	fnot2s	%f18,	%f6
	fmovrdlz	%g2,	%f4,	%f14
	subcc	%g7,	0x11A2,	%i7
	movrgz	%g4,	%o0,	%o5
	fcmpes	%fcc2,	%f5,	%f18
	ldd	[%l7 + 0x50],	%l4
	fmovdle	%icc,	%f5,	%f13
	stb	%g6,	[%l7 + 0x2E]
	popc	0x1516,	%o7
	udivx	%o2,	0x0607,	%i6
	fcmpeq16	%f28,	%f6,	%o1
	movrgz	%i4,	%o3,	%i5
	fcmpgt32	%f24,	%f26,	%i1
	sdiv	%i0,	0x1716,	%g3
	stx	%i2,	[%l7 + 0x38]
	sdivx	%i3,	0x1EB2,	%l4
	stb	%g5,	[%l7 + 0x53]
	movpos	%xcc,	%g1,	%o4
	edge32ln	%l2,	%l1,	%l6
	fmovsge	%icc,	%f10,	%f3
	edge16n	%l3,	%o6,	%l0
	movgu	%xcc,	%g7,	%i7
	array32	%g4,	%o0,	%g2
	udiv	%l5,	0x063D,	%o5
	xnor	%g6,	0x0B6A,	%o7
	or	%i6,	0x0BB2,	%o1
	edge32n	%o2,	%o3,	%i4
	movvs	%xcc,	%i1,	%i0
	udivx	%i5,	0x1AF3,	%g3
	xnorcc	%i2,	0x0648,	%l4
	movvs	%icc,	%g5,	%g1
	fornot1	%f2,	%f12,	%f2
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	edge32ln	%i3,	%l6,	%o6
	movne	%xcc,	%l0,	%g7
	xnorcc	%l3,	%g4,	%o0
	fmuld8sux16	%f20,	%f23,	%f12
	xorcc	%g2,	0x13DF,	%i7
	st	%f24,	[%l7 + 0x34]
	fcmpeq16	%f18,	%f24,	%o5
	xor	%g6,	%o7,	%i6
	edge32ln	%o1,	%l5,	%o2
	umul	%o3,	%i1,	%i0
	movrlz	%i5,	0x122,	%i4
	movge	%xcc,	%i2,	%g3
	edge16l	%g5,	%g1,	%o4
	fmovsvs	%xcc,	%f3,	%f24
	st	%f12,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x34],	%l2
	andn	%l4,	0x13C1,	%i3
	movrne	%l1,	%o6,	%l6
	movrlz	%g7,	%l0,	%g4
	popc	0x1C5E,	%l3
	orcc	%o0,	0x1D63,	%i7
	subc	%o5,	%g2,	%g6
	movcs	%icc,	%o7,	%o1
	xnor	%l5,	0x13DC,	%i6
	and	%o2,	0x14B7,	%i1
	stx	%i0,	[%l7 + 0x10]
	movrlz	%o3,	0x392,	%i5
	movcs	%xcc,	%i4,	%g3
	nop
	set	0x30, %o2
	stx	%g5,	[%l7 + %o2]
	sir	0x0F7C
	fmovsvc	%icc,	%f18,	%f11
	fmovrdlz	%g1,	%f24,	%f30
	addc	%o4,	0x0B80,	%i2
	subc	%l4,	0x0841,	%l2
	edge32l	%i3,	%l1,	%o6
	mulx	%l6,	%g7,	%l0
	edge8ln	%l3,	%o0,	%g4
	srlx	%o5,	%g2,	%i7
	subc	%o7,	%g6,	%l5
	sethi	0x1D9F,	%o1
	st	%f29,	[%l7 + 0x40]
	orn	%i6,	0x1332,	%o2
	fmovdcc	%xcc,	%f1,	%f27
	ldsh	[%l7 + 0x34],	%i1
	fmovdvs	%icc,	%f9,	%f24
	move	%xcc,	%i0,	%i5
	sethi	0x113A,	%i4
	sdivcc	%o3,	0x1830,	%g5
	movrne	%g1,	0x35E,	%g3
	pdist	%f14,	%f16,	%f6
	orcc	%o4,	0x14F0,	%l4
	mulx	%l2,	0x1F4E,	%i2
	alignaddrl	%i3,	%l1,	%l6
	sethi	0x1B19,	%g7
	add	%l0,	%o6,	%l3
	edge8n	%g4,	%o0,	%o5
	movn	%xcc,	%g2,	%i7
	fmovrsgez	%o7,	%f30,	%f5
	fandnot1	%f10,	%f12,	%f26
	fmovrdlz	%l5,	%f28,	%f12
	andcc	%g6,	0x1E7C,	%i6
	umulcc	%o2,	%o1,	%i1
	popc	%i0,	%i4
	fornot1	%f10,	%f0,	%f16
	fand	%f8,	%f12,	%f8
	movl	%xcc,	%i5,	%g5
	sra	%g1,	0x18,	%g3
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%f20
	stx	%o3,	[%l7 + 0x20]
	edge16ln	%o4,	%l4,	%i2
	edge16l	%l2,	%l1,	%l6
	sth	%i3,	[%l7 + 0x3E]
	subc	%l0,	%o6,	%g7
	fmovscc	%xcc,	%f8,	%f13
	sir	0x1507
	edge16ln	%l3,	%g4,	%o0
	udiv	%g2,	0x0F98,	%o5
	fpackfix	%f20,	%f24
	addc	%i7,	0x0C8B,	%l5
	edge8ln	%g6,	%i6,	%o2
	srl	%o1,	0x09,	%i1
	nop
	set	0x6E, %i0
	ldsh	[%l7 + %i0],	%i0
	addccc	%o7,	0x1475,	%i4
	movleu	%icc,	%i5,	%g1
	save %g5, %g3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o4,	%i2,	%l2
	subc	%l4,	%l6,	%l1
	movvs	%xcc,	%l0,	%o6
	movrne	%i3,	%g7,	%g4
	fors	%f27,	%f15,	%f0
	fmovdneg	%xcc,	%f8,	%f9
	movle	%icc,	%o0,	%l3
	andncc	%o5,	%i7,	%g2
	edge32n	%l5,	%i6,	%o2
	edge32	%o1,	%g6,	%i0
	movcs	%xcc,	%o7,	%i1
	orncc	%i5,	%i4,	%g1
	movgu	%xcc,	%g3,	%g5
	st	%f17,	[%l7 + 0x20]
	ldd	[%l7 + 0x48],	%f30
	lduw	[%l7 + 0x18],	%o4
	subcc	%i2,	%l2,	%o3
	edge16	%l6,	%l4,	%l1
	movvs	%xcc,	%o6,	%i3
	fmovrsgz	%l0,	%f30,	%f20
	movge	%icc,	%g4,	%g7
	fxnor	%f16,	%f2,	%f8
	stx	%o0,	[%l7 + 0x40]
	fmovde	%xcc,	%f17,	%f3
	movvs	%icc,	%o5,	%l3
	and	%i7,	%l5,	%i6
	edge16n	%g2,	%o1,	%g6
	ldsh	[%l7 + 0x12],	%o2
	edge16ln	%o7,	%i1,	%i0
	smul	%i5,	%g1,	%g3
	subc	%g5,	%o4,	%i2
	sdiv	%i4,	0x0002,	%l2
	smul	%l6,	0x10E3,	%l4
	edge16l	%l1,	%o3,	%i3
	udiv	%o6,	0x0BF7,	%l0
	edge32	%g7,	%g4,	%o0
	or	%o5,	0x0FCE,	%l3
	sub	%i7,	%l5,	%g2
	fnands	%f26,	%f23,	%f9
	srl	%i6,	%g6,	%o2
	movrgz	%o1,	%i1,	%o7
	fmovsne	%icc,	%f10,	%f19
	popc	%i5,	%i0
	fxnors	%f4,	%f8,	%f26
	movl	%xcc,	%g3,	%g5
	sir	0x1BDA
	edge32n	%o4,	%g1,	%i4
	movge	%xcc,	%i2,	%l6
	stb	%l4,	[%l7 + 0x43]
	fmovrdlez	%l1,	%f6,	%f20
	sdivx	%o3,	0x1789,	%i3
	mova	%xcc,	%o6,	%l0
	xorcc	%l2,	0x05D5,	%g7
	movcs	%icc,	%o0,	%o5
	ld	[%l7 + 0x48],	%f31
	array16	%g4,	%i7,	%l3
	addc	%l5,	%g2,	%g6
	fpack16	%f28,	%f21
	stw	%i6,	[%l7 + 0x48]
	movpos	%icc,	%o2,	%i1
	udiv	%o7,	0x1E58,	%i5
	sra	%i0,	%g3,	%g5
	fcmpgt32	%f0,	%f14,	%o1
	for	%f20,	%f26,	%f10
	andncc	%o4,	%i4,	%g1
	xorcc	%l6,	0x1F66,	%l4
	nop
	set	0x4E, %o5
	stb	%i2,	[%l7 + %o5]
	mulx	%l1,	0x1118,	%o3
	stb	%o6,	[%l7 + 0x34]
	movrgz	%i3,	%l0,	%l2
	restore %g7, 0x01F0, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f6,	%f8
	st	%f26,	[%l7 + 0x58]
	stx	%o5,	[%l7 + 0x68]
	movle	%icc,	%i7,	%l3
	srl	%g4,	%l5,	%g6
	smulcc	%g2,	0x045C,	%o2
	edge32	%i6,	%i1,	%i5
	smulcc	%o7,	%g3,	%i0
	addccc	%g5,	0x1176,	%o1
	sdivx	%i4,	0x1599,	%g1
	fmovsge	%icc,	%f8,	%f11
	mulscc	%o4,	0x1531,	%l6
	fmovsleu	%xcc,	%f23,	%f2
	fxors	%f2,	%f9,	%f28
	fmovse	%xcc,	%f24,	%f12
	st	%f14,	[%l7 + 0x64]
	edge8	%i2,	%l1,	%l4
	popc	%o3,	%o6
	edge16	%l0,	%i3,	%l2
	and	%g7,	0x0EAD,	%o0
	ldsb	[%l7 + 0x0C],	%i7
	stw	%l3,	[%l7 + 0x60]
	stw	%g4,	[%l7 + 0x50]
	xnor	%o5,	0x0007,	%g6
	fmul8x16al	%f16,	%f11,	%f28
	nop
	set	0x12, %i4
	stb	%g2,	[%l7 + %i4]
	xor	%o2,	0x0ACD,	%i6
	array32	%i1,	%l5,	%i5
	edge8n	%g3,	%i0,	%o7
	fones	%f21
	movgu	%xcc,	%o1,	%g5
	sra	%g1,	0x1E,	%o4
	movrne	%l6,	%i4,	%l1
	orcc	%l4,	%o3,	%o6
	movcs	%icc,	%l0,	%i2
	udivx	%i3,	0x0F57,	%g7
	addcc	%l2,	%o0,	%i7
	movn	%icc,	%l3,	%o5
	fmul8x16au	%f19,	%f21,	%f10
	movpos	%icc,	%g6,	%g2
	fzero	%f0
	bshuffle	%f8,	%f24,	%f28
	alignaddr	%o2,	%g4,	%i1
	st	%f19,	[%l7 + 0x30]
	andncc	%i6,	%i5,	%g3
	ldsh	[%l7 + 0x14],	%l5
	fmuld8ulx16	%f16,	%f2,	%f22
	srax	%o7,	0x02,	%o1
	sth	%i0,	[%l7 + 0x2A]
	mulscc	%g5,	0x069E,	%g1
	edge16ln	%o4,	%i4,	%l6
	pdist	%f8,	%f12,	%f28
	fmul8ulx16	%f16,	%f4,	%f20
	udivcc	%l1,	0x17F5,	%l4
	addc	%o6,	0x1CC6,	%l0
	xnorcc	%o3,	%i2,	%g7
	lduh	[%l7 + 0x5E],	%l2
	fmovrsgez	%i3,	%f4,	%f18
	sdivcc	%i7,	0x1A61,	%l3
	fcmpgt16	%f30,	%f14,	%o0
	array8	%g6,	%g2,	%o5
	sir	0x1093
	umul	%g4,	%o2,	%i6
	movrlez	%i1,	%g3,	%l5
	array8	%i5,	%o7,	%i0
	fabsd	%f24,	%f4
	fmovrdlz	%g5,	%f12,	%f6
	and	%o1,	%g1,	%i4
	sub	%l6,	%l1,	%l4
	and	%o4,	0x00BE,	%l0
	udiv	%o6,	0x0635,	%o3
	xor	%i2,	0x14B0,	%l2
	fpsub32	%f20,	%f4,	%f6
	fcmped	%fcc0,	%f6,	%f22
	movpos	%xcc,	%g7,	%i3
	alignaddrl	%l3,	%i7,	%g6
	movpos	%icc,	%g2,	%o0
	move	%xcc,	%o5,	%g4
	fcmpeq16	%f18,	%f30,	%i6
	alignaddrl	%i1,	%g3,	%l5
	fcmpes	%fcc0,	%f31,	%f0
	array8	%o2,	%i5,	%o7
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	movrgz	%g1,	%i4,	%o1
	movrgz	%l1,	0x1BB,	%l4
	ldx	[%l7 + 0x30],	%o4
	or	%l0,	%o6,	%o3
	movgu	%xcc,	%i2,	%l2
	sll	%l6,	%g7,	%i3
	fand	%f12,	%f28,	%f20
	andncc	%i7,	%g6,	%g2
	for	%f24,	%f22,	%f2
	fnot1s	%f4,	%f9
	fcmped	%fcc0,	%f4,	%f16
	edge8ln	%l3,	%o5,	%g4
	fandnot1s	%f18,	%f9,	%f31
	movcc	%icc,	%i6,	%o0
	std	%f22,	[%l7 + 0x30]
	mulx	%g3,	0x1AFF,	%i1
	xnorcc	%o2,	0x1EF8,	%l5
	fandnot2	%f22,	%f8,	%f2
	ld	[%l7 + 0x14],	%f20
	mulx	%o7,	0x0363,	%i5
	andcc	%g5,	0x0506,	%i0
	edge8ln	%i4,	%o1,	%l1
	fzeros	%f19
	fsrc1s	%f24,	%f27
	ldsw	[%l7 + 0x48],	%g1
	movle	%xcc,	%o4,	%l4
	edge16ln	%l0,	%o6,	%o3
	xor	%l2,	%i2,	%l6
	umul	%i3,	%i7,	%g6
	nop
	set	0x60, %g1
	sth	%g2,	[%l7 + %g1]
	sra	%l3,	%g7,	%g4
	alignaddr	%i6,	%o0,	%o5
	add	%i1,	0x05B4,	%o2
	array32	%g3,	%l5,	%o7
	lduh	[%l7 + 0x0E],	%g5
	sth	%i5,	[%l7 + 0x5C]
	udivx	%i4,	0x1573,	%i0
	edge16	%l1,	%g1,	%o1
	movgu	%xcc,	%o4,	%l4
	ldub	[%l7 + 0x2C],	%o6
	movne	%xcc,	%l0,	%l2
	lduh	[%l7 + 0x60],	%o3
	stb	%l6,	[%l7 + 0x1C]
	subcc	%i3,	0x1E66,	%i2
	movvc	%icc,	%i7,	%g6
	edge8	%g2,	%l3,	%g7
	ldd	[%l7 + 0x30],	%f4
	fxor	%f12,	%f6,	%f18
	or	%i6,	0x1C4D,	%o0
	andcc	%o5,	0x18AB,	%g4
	movvc	%xcc,	%o2,	%g3
	sdiv	%i1,	0x1807,	%o7
	fpadd16s	%f2,	%f28,	%f12
	restore %g5, 0x0DE8, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i5,	%i0,	%l1
	edge8l	%i4,	%g1,	%o4
	sra	%l4,	%o1,	%o6
	edge32l	%l2,	%l0,	%o3
	edge32ln	%l6,	%i2,	%i7
	movgu	%xcc,	%g6,	%g2
	edge16l	%l3,	%g7,	%i6
	srax	%i3,	%o0,	%o5
	xnorcc	%g4,	%o2,	%i1
	fcmps	%fcc0,	%f5,	%f6
	fandnot2s	%f16,	%f8,	%f4
	udivx	%g3,	0x0C40,	%g5
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	srlx	%l5,	%l1,	%i4
	movvs	%xcc,	%i0,	%g1
	fmovsvs	%xcc,	%f8,	%f7
	sra	%o4,	%o1,	%l4
	stb	%l2,	[%l7 + 0x74]
	orncc	%o6,	0x1536,	%l0
	udivx	%l6,	0x1708,	%i2
	faligndata	%f20,	%f10,	%f6
	array8	%i7,	%g6,	%g2
	fmovsgu	%xcc,	%f9,	%f7
	subcc	%o3,	0x0AE5,	%l3
	smul	%i6,	0x0755,	%g7
	ldx	[%l7 + 0x50],	%o0
	andn	%i3,	0x1FB3,	%o5
	movn	%icc,	%g4,	%o2
	fcmpd	%fcc2,	%f4,	%f16
	movn	%icc,	%i1,	%g3
	fmovdcs	%icc,	%f19,	%f2
	fmovsle	%xcc,	%f29,	%f14
	fmovdpos	%xcc,	%f6,	%f7
	add	%o7,	%g5,	%l5
	fmovdvs	%xcc,	%f10,	%f29
	fmul8x16au	%f19,	%f21,	%f2
	stb	%l1,	[%l7 + 0x35]
	movpos	%icc,	%i5,	%i0
	stb	%i4,	[%l7 + 0x7F]
	fpsub32	%f20,	%f18,	%f26
	movvc	%xcc,	%o4,	%o1
	fmovdcs	%icc,	%f4,	%f23
	andncc	%l4,	%g1,	%l2
	ldx	[%l7 + 0x10],	%l0
	srax	%l6,	0x17,	%o6
	fcmple16	%f26,	%f28,	%i2
	edge8	%g6,	%g2,	%o3
	movleu	%xcc,	%i7,	%l3
	mova	%xcc,	%i6,	%g7
	edge16n	%i3,	%o5,	%g4
	xor	%o2,	0x1634,	%i1
	movpos	%icc,	%o0,	%o7
	udivx	%g3,	0x1FBE,	%g5
	fmovspos	%icc,	%f4,	%f0
	stx	%l1,	[%l7 + 0x50]
	array32	%l5,	%i0,	%i5
	smulcc	%o4,	%o1,	%l4
	sdivcc	%i4,	0x0A53,	%g1
	xnorcc	%l0,	%l2,	%o6
	smulcc	%i2,	0x1F92,	%l6
	stw	%g2,	[%l7 + 0x78]
	fnot2s	%f18,	%f12
	array16	%o3,	%g6,	%l3
	lduh	[%l7 + 0x10],	%i7
	srax	%g7,	0x05,	%i3
	movl	%xcc,	%o5,	%i6
	subccc	%g4,	%i1,	%o2
	fmovsa	%icc,	%f31,	%f9
	movrlz	%o0,	0x33E,	%g3
	movvs	%xcc,	%o7,	%g5
	xnorcc	%l5,	%l1,	%i5
	xorcc	%o4,	0x19FE,	%o1
	fnand	%f14,	%f18,	%f14
	ldd	[%l7 + 0x38],	%f4
	umul	%i0,	0x1855,	%l4
	fmovdcc	%icc,	%f15,	%f30
	srlx	%i4,	%l0,	%l2
	fmovsne	%xcc,	%f27,	%f1
	st	%f24,	[%l7 + 0x50]
	fmovse	%icc,	%f26,	%f0
	ldsh	[%l7 + 0x0A],	%o6
	edge32	%g1,	%l6,	%i2
	sub	%g2,	%o3,	%g6
	andn	%i7,	0x1E33,	%l3
	sdiv	%g7,	0x1E61,	%i3
	orncc	%i6,	%o5,	%g4
	udivx	%o2,	0x042B,	%o0
	fnegs	%f11,	%f9
	std	%f28,	[%l7 + 0x28]
	edge16	%i1,	%g3,	%g5
	movrgz	%l5,	0x319,	%l1
	movrlz	%o7,	0x366,	%i5
	save %o4, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x60],	%i4
	movn	%xcc,	%i0,	%l2
	movrlez	%l0,	0x246,	%o6
	sub	%g1,	%i2,	%l6
	fcmpeq16	%f26,	%f18,	%g2
	move	%icc,	%o3,	%i7
	sub	%l3,	0x098A,	%g6
	addccc	%i3,	0x0CA7,	%i6
	movpos	%icc,	%o5,	%g7
	edge32l	%g4,	%o0,	%i1
	ld	[%l7 + 0x64],	%f14
	addccc	%g3,	0x0C30,	%g5
	umul	%l5,	%l1,	%o7
	ldsw	[%l7 + 0x10],	%i5
	fmovdn	%xcc,	%f13,	%f18
	orn	%o2,	%o4,	%l4
	mulscc	%i4,	%o1,	%i0
	siam	0x6
	ldsh	[%l7 + 0x34],	%l2
	orncc	%o6,	0x003F,	%l0
	andncc	%g1,	%i2,	%l6
	sdivx	%g2,	0x0C2A,	%i7
	sdivcc	%l3,	0x157F,	%g6
	sll	%i3,	0x0B,	%i6
	sdiv	%o3,	0x0716,	%o5
	edge8ln	%g7,	%o0,	%g4
	fcmpne32	%f0,	%f22,	%i1
	edge8ln	%g3,	%g5,	%l1
	array32	%o7,	%i5,	%l5
	umulcc	%o2,	%o4,	%l4
	xor	%i4,	%o1,	%l2
	movpos	%xcc,	%o6,	%i0
	movcc	%icc,	%g1,	%l0
	subccc	%i2,	%l6,	%g2
	movle	%xcc,	%i7,	%g6
	fmovdle	%icc,	%f27,	%f15
	fcmped	%fcc3,	%f26,	%f30
	edge32l	%i3,	%l3,	%o3
	movrne	%i6,	%o5,	%o0
	edge8ln	%g4,	%i1,	%g7
	mulscc	%g5,	%g3,	%l1
	edge32	%i5,	%l5,	%o2
	movre	%o4,	%o7,	%l4
	array8	%o1,	%i4,	%l2
	sth	%o6,	[%l7 + 0x0C]
	srlx	%g1,	0x17,	%l0
	sll	%i0,	%l6,	%i2
	fornot2s	%f25,	%f22,	%f23
	fsrc2	%f16,	%f26
	sdiv	%i7,	0x0502,	%g6
	movle	%icc,	%g2,	%l3
	edge16n	%i3,	%i6,	%o3
	stb	%o5,	[%l7 + 0x58]
	mulscc	%o0,	%g4,	%g7
	mulscc	%i1,	%g3,	%g5
	mulx	%l1,	%i5,	%l5
	fmovdneg	%icc,	%f11,	%f31
	bshuffle	%f20,	%f12,	%f2
	movcs	%icc,	%o2,	%o4
	edge16l	%l4,	%o1,	%i4
	subc	%o7,	0x0BEC,	%o6
	edge32ln	%l2,	%l0,	%g1
	addccc	%l6,	0x0B75,	%i0
	fmovsneg	%xcc,	%f4,	%f24
	edge8ln	%i7,	%i2,	%g6
	xnorcc	%l3,	0x0B18,	%g2
	movgu	%xcc,	%i3,	%o3
	fnot1	%f26,	%f28
	movrgz	%i6,	0x2BF,	%o0
	edge32l	%g4,	%o5,	%i1
	movl	%icc,	%g3,	%g5
	movgu	%xcc,	%l1,	%g7
	restore %l5, 0x15E1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f5,	%f25
	umul	%o2,	%l4,	%o1
	ld	[%l7 + 0x3C],	%f25
	lduw	[%l7 + 0x30],	%o4
	subc	%o7,	0x0C7F,	%i4
	movrgez	%o6,	%l0,	%l2
	fnors	%f4,	%f2,	%f27
	umulcc	%g1,	%l6,	%i0
	stb	%i2,	[%l7 + 0x75]
	lduw	[%l7 + 0x38],	%i7
	fmovsg	%icc,	%f16,	%f15
	udivx	%g6,	0x18C6,	%l3
	sir	0x1F17
	fmovsa	%xcc,	%f7,	%f26
	udivcc	%i3,	0x0924,	%o3
	sdiv	%i6,	0x1327,	%o0
	sra	%g4,	0x1A,	%o5
	sll	%g2,	%g3,	%i1
	fcmped	%fcc3,	%f0,	%f20
	sth	%l1,	[%l7 + 0x5E]
	st	%f29,	[%l7 + 0x1C]
	movrgz	%g7,	%g5,	%l5
	umulcc	%i5,	0x06E2,	%l4
	xnor	%o2,	0x1E3F,	%o4
	ldsh	[%l7 + 0x5A],	%o7
	movvc	%icc,	%i4,	%o6
	movle	%icc,	%o1,	%l0
	fsrc1s	%f30,	%f6
	add	%l2,	%g1,	%l6
	sth	%i2,	[%l7 + 0x12]
	srax	%i0,	%i7,	%l3
	ldsh	[%l7 + 0x60],	%g6
	movne	%icc,	%i3,	%i6
	array32	%o3,	%g4,	%o0
	fnand	%f22,	%f8,	%f24
	andcc	%o5,	0x1F75,	%g3
	addccc	%g2,	%l1,	%i1
	xnorcc	%g5,	0x0D28,	%g7
	movl	%xcc,	%i5,	%l5
	array32	%l4,	%o4,	%o2
	orn	%i4,	%o7,	%o6
	movl	%icc,	%o1,	%l2
	orcc	%g1,	0x1958,	%l0
	edge8n	%i2,	%l6,	%i0
	sllx	%l3,	0x06,	%i7
	ldsw	[%l7 + 0x48],	%g6
	edge8n	%i6,	%o3,	%g4
	edge8ln	%o0,	%o5,	%i3
	movle	%icc,	%g3,	%l1
	sdiv	%g2,	0x1233,	%i1
	srax	%g7,	0x10,	%g5
	movge	%icc,	%l5,	%i5
	ldd	[%l7 + 0x28],	%o4
	stw	%l4,	[%l7 + 0x58]
	sir	0x14E0
	srl	%o2,	%o7,	%o6
	alignaddr	%i4,	%l2,	%o1
	andncc	%g1,	%i2,	%l0
	smulcc	%l6,	0x120D,	%i0
	movcs	%icc,	%i7,	%l3
	fcmpgt16	%f14,	%f10,	%i6
	fmovdgu	%xcc,	%f20,	%f27
	lduw	[%l7 + 0x68],	%g6
	andncc	%o3,	%o0,	%g4
	fcmpne16	%f18,	%f16,	%i3
	movvs	%xcc,	%o5,	%l1
	movpos	%icc,	%g3,	%i1
	fpack32	%f26,	%f0,	%f6
	sdiv	%g2,	0x1F38,	%g7
	umulcc	%g5,	%i5,	%l5
	ldsh	[%l7 + 0x46],	%o4
	srl	%l4,	0x01,	%o7
	alignaddr	%o2,	%i4,	%l2
	movcc	%icc,	%o6,	%o1
	sll	%i2,	%l0,	%g1
	sdivcc	%i0,	0x0CD4,	%l6
	movvc	%icc,	%l3,	%i6
	siam	0x1
	xor	%i7,	%g6,	%o3
	srlx	%g4,	%o0,	%o5
	subc	%l1,	%i3,	%g3
	andncc	%g2,	%i1,	%g5
	umul	%g7,	0x1523,	%i5
	move	%icc,	%o4,	%l5
	umulcc	%l4,	0x029D,	%o2
	smul	%i4,	%o7,	%o6
	movn	%xcc,	%o1,	%l2
	fmovde	%icc,	%f9,	%f4
	fornot1s	%f19,	%f14,	%f2
	array16	%i2,	%g1,	%i0
	array32	%l6,	%l0,	%i6
	fcmped	%fcc2,	%f18,	%f2
	xnorcc	%l3,	0x16E3,	%i7
	sll	%o3,	0x1D,	%g4
	orcc	%o0,	0x103E,	%g6
	movrne	%l1,	0x068,	%o5
	orncc	%i3,	0x0AC1,	%g2
	srl	%i1,	0x15,	%g3
	fcmps	%fcc1,	%f26,	%f21
	edge16	%g7,	%g5,	%i5
	nop
	set	0x46, %o3
	ldsh	[%l7 + %o3],	%l5
	nop
	set	0x78, %l0
	std	%f24,	[%l7 + %l0]
	fmovsn	%icc,	%f16,	%f13
	fpsub16s	%f31,	%f3,	%f11
	stx	%l4,	[%l7 + 0x28]
	udivx	%o4,	0x0464,	%o2
	movvc	%xcc,	%i4,	%o6
	stw	%o1,	[%l7 + 0x50]
	fmovrdne	%l2,	%f8,	%f4
	udivcc	%o7,	0x1CBE,	%i2
	edge32	%g1,	%i0,	%l6
	subcc	%i6,	%l0,	%l3
	ld	[%l7 + 0x3C],	%f11
	fzeros	%f29
	or	%i7,	0x1808,	%g4
	udiv	%o3,	0x1899,	%o0
	movl	%icc,	%g6,	%l1
	nop
	set	0x2C, %g2
	ldub	[%l7 + %g2],	%o5
	umul	%g2,	0x0A9A,	%i1
	movne	%xcc,	%g3,	%i3
	fmovsvc	%icc,	%f13,	%f27
	array32	%g7,	%i5,	%g5
	sub	%l5,	0x17EE,	%o4
	ldd	[%l7 + 0x08],	%l4
	alignaddr	%i4,	%o2,	%o6
	movrgz	%l2,	%o7,	%i2
	stw	%g1,	[%l7 + 0x0C]
	stx	%o1,	[%l7 + 0x78]
	sll	%i0,	0x17,	%i6
	udivx	%l0,	0x096C,	%l6
	andcc	%l3,	%g4,	%o3
	sdiv	%i7,	0x0CD9,	%o0
	fmovdle	%icc,	%f31,	%f18
	movvc	%xcc,	%g6,	%o5
	sub	%g2,	0x037D,	%l1
	move	%icc,	%i1,	%g3
	edge16	%i3,	%g7,	%g5
	alignaddrl	%l5,	%o4,	%l4
	fmovda	%icc,	%f8,	%f22
	nop
	set	0x34, %l6
	sth	%i5,	[%l7 + %l6]
	subccc	%i4,	%o2,	%o6
	edge16l	%l2,	%i2,	%g1
	fmovdle	%icc,	%f3,	%f15
	orn	%o1,	%i0,	%i6
	array32	%o7,	%l6,	%l0
	ldsh	[%l7 + 0x28],	%l3
	fmul8x16al	%f10,	%f2,	%f10
	fcmple16	%f12,	%f26,	%g4
	sll	%i7,	%o3,	%g6
	fnors	%f28,	%f11,	%f22
	array32	%o5,	%g2,	%l1
	orn	%o0,	0x0600,	%i1
	ldsb	[%l7 + 0x7E],	%g3
	fmovs	%f25,	%f26
	sdivcc	%g7,	0x1CE7,	%i3
	save %g5, %l5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o4,	0x082F,	%i4
	orcc	%o2,	0x1A98,	%i5
	srlx	%l2,	0x04,	%o6
	or	%i2,	%g1,	%i0
	fmovda	%xcc,	%f10,	%f23
	umul	%o1,	0x1F8D,	%i6
	andncc	%o7,	%l0,	%l6
	array8	%g4,	%i7,	%l3
	andn	%g6,	0x010F,	%o5
	movvc	%xcc,	%o3,	%l1
	fnegs	%f10,	%f31
	xorcc	%o0,	0x003D,	%g2
	nop
	set	0x08, %i1
	ldd	[%l7 + %i1],	%g2
	movneg	%icc,	%i1,	%g7
	lduh	[%l7 + 0x58],	%i3
	movre	%g5,	0x2C3,	%l4
	sdiv	%l5,	0x149C,	%i4
	movneg	%xcc,	%o4,	%o2
	fpadd16s	%f10,	%f5,	%f17
	andcc	%l2,	%i5,	%o6
	addc	%i2,	%g1,	%o1
	movle	%icc,	%i0,	%o7
	movneg	%xcc,	%l0,	%l6
	lduw	[%l7 + 0x14],	%i6
	fxor	%f4,	%f30,	%f12
	fcmped	%fcc2,	%f2,	%f26
	ldd	[%l7 + 0x60],	%g4
	array8	%l3,	%g6,	%i7
	ldx	[%l7 + 0x40],	%o3
	ldsb	[%l7 + 0x1F],	%l1
	siam	0x3
	edge32ln	%o0,	%g2,	%g3
	movrlz	%o5,	%g7,	%i1
	fornot2	%f10,	%f4,	%f2
	movleu	%icc,	%i3,	%g5
	move	%xcc,	%l4,	%i4
	fcmpd	%fcc3,	%f30,	%f30
	sir	0x018E
	fxnor	%f26,	%f6,	%f26
	movvs	%xcc,	%l5,	%o2
	fmovse	%icc,	%f0,	%f0
	fones	%f7
	orn	%o4,	0x0F68,	%l2
	addc	%i5,	0x0822,	%i2
	ldsb	[%l7 + 0x37],	%o6
	edge16	%g1,	%o1,	%o7
	fsrc1	%f10,	%f6
	sdivx	%l0,	0x1CDA,	%i0
	edge8	%i6,	%l6,	%l3
	array16	%g6,	%i7,	%o3
	std	%f14,	[%l7 + 0x48]
	alignaddrl	%g4,	%o0,	%l1
	subc	%g3,	0x0A0A,	%g2
	fmovdgu	%xcc,	%f28,	%f27
	fmovda	%xcc,	%f21,	%f24
	xorcc	%g7,	%o5,	%i1
	lduh	[%l7 + 0x38],	%i3
	edge16ln	%g5,	%l4,	%l5
	fmul8x16	%f3,	%f30,	%f0
	edge16	%o2,	%i4,	%l2
	ldx	[%l7 + 0x78],	%i5
	sth	%i2,	[%l7 + 0x3C]
	alignaddr	%o6,	%g1,	%o4
	array16	%o1,	%o7,	%l0
	move	%icc,	%i6,	%i0
	fabsd	%f12,	%f10
	fmovsne	%xcc,	%f25,	%f2
	fpack32	%f2,	%f2,	%f12
	udiv	%l3,	0x0813,	%l6
	nop
	set	0x48, %o0
	ldx	[%l7 + %o0],	%g6
	ldsh	[%l7 + 0x3E],	%o3
	array16	%g4,	%o0,	%l1
	sllx	%g3,	0x17,	%i7
	fcmpd	%fcc0,	%f14,	%f22
	ldub	[%l7 + 0x4E],	%g7
	andn	%g2,	%o5,	%i1
	ldsh	[%l7 + 0x5A],	%g5
	xorcc	%l4,	0x169D,	%i3
	sir	0x03AB
	array8	%l5,	%i4,	%l2
	movvs	%icc,	%i5,	%o2
	edge8	%o6,	%g1,	%o4
	ldsb	[%l7 + 0x34],	%o1
	stb	%i2,	[%l7 + 0x11]
	movcs	%icc,	%l0,	%o7
	fzeros	%f5
	fmovrdne	%i6,	%f0,	%f6
	ldsb	[%l7 + 0x1D],	%i0
	fcmpne16	%f14,	%f24,	%l3
	st	%f30,	[%l7 + 0x0C]
	st	%f2,	[%l7 + 0x64]
	movrne	%l6,	0x2CD,	%g6
	movrgz	%g4,	%o3,	%l1
	movvc	%icc,	%o0,	%i7
	smul	%g7,	0x0BF6,	%g3
	edge16l	%o5,	%i1,	%g5
	srl	%l4,	0x0E,	%i3
	addc	%g2,	0x04E3,	%l5
	mova	%xcc,	%l2,	%i5
	edge8l	%o2,	%o6,	%i4
	std	%f8,	[%l7 + 0x08]
	fmovrdlz	%o4,	%f6,	%f12
	fcmpd	%fcc2,	%f26,	%f0
	movneg	%icc,	%g1,	%i2
	udiv	%o1,	0x1E61,	%o7
	sir	0x0AD3
	movg	%xcc,	%i6,	%i0
	mulx	%l3,	%l0,	%g6
	fmovda	%xcc,	%f20,	%f24
	sdivx	%g4,	0x12BC,	%o3
	edge32n	%l6,	%l1,	%i7
	xorcc	%g7,	0x0365,	%g3
	stw	%o0,	[%l7 + 0x78]
	xor	%o5,	0x1B72,	%i1
	stb	%l4,	[%l7 + 0x4E]
	edge32	%g5,	%g2,	%i3
	xorcc	%l2,	0x121E,	%l5
	movl	%icc,	%i5,	%o2
	movrlez	%i4,	%o6,	%g1
	lduh	[%l7 + 0x38],	%i2
	movvs	%xcc,	%o4,	%o7
	movrne	%o1,	0x3FE,	%i6
	subc	%i0,	0x19DD,	%l3
	ldsh	[%l7 + 0x08],	%l0
	movcc	%xcc,	%g4,	%o3
	addc	%g6,	%l1,	%l6
	orncc	%i7,	0x11B6,	%g3
	subcc	%o0,	0x0D98,	%o5
	stx	%g7,	[%l7 + 0x10]
	fpack32	%f4,	%f14,	%f4
	movgu	%xcc,	%l4,	%g5
	stx	%i1,	[%l7 + 0x38]
	umul	%i3,	0x1A11,	%l2
	and	%g2,	0x087A,	%l5
	nop
	set	0x38, %l4
	std	%f8,	[%l7 + %l4]
	fxnors	%f0,	%f10,	%f0
	stb	%o2,	[%l7 + 0x19]
	mulscc	%i5,	0x1955,	%i4
	sdiv	%o6,	0x084C,	%g1
	movg	%icc,	%i2,	%o7
	edge32ln	%o4,	%i6,	%o1
	fmovsvs	%xcc,	%f13,	%f22
	mulscc	%i0,	%l3,	%g4
	edge8l	%l0,	%o3,	%l1
	alignaddr	%g6,	%i7,	%g3
	umulcc	%l6,	0x0418,	%o5
	fpadd16s	%f11,	%f20,	%f3
	movrlz	%g7,	0x2F5,	%l4
	fnor	%f2,	%f18,	%f22
	udiv	%g5,	0x14BE,	%o0
	sra	%i3,	0x00,	%l2
	lduh	[%l7 + 0x6C],	%i1
	array16	%l5,	%g2,	%o2
	fmovsgu	%icc,	%f28,	%f16
	move	%xcc,	%i5,	%o6
	edge8ln	%g1,	%i4,	%o7
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	stb	%o1,	[%l7 + 0x5B]
	array16	%i0,	%l3,	%o4
	add	%g4,	0x0111,	%l0
	movrlz	%o3,	0x169,	%g6
	fmovsgu	%xcc,	%f10,	%f11
	addccc	%i7,	0x1460,	%g3
	edge32ln	%l6,	%l1,	%o5
	st	%f24,	[%l7 + 0x28]
	addc	%g7,	%g5,	%o0
	movg	%icc,	%l4,	%l2
	mulx	%i3,	0x10DF,	%l5
	fcmped	%fcc0,	%f2,	%f2
	ldsw	[%l7 + 0x18],	%i1
	std	%f30,	[%l7 + 0x18]
	nop
	set	0x30, %l1
	stx	%o2,	[%l7 + %l1]
	edge32l	%g2,	%o6,	%i5
	alignaddrl	%i4,	%g1,	%o7
	fmovrdgez	%i6,	%f20,	%f30
	fzeros	%f24
	xnor	%o1,	0x19F8,	%i0
	restore %l3, %i2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f16
	movrgz	%l0,	0x0BB,	%o3
	movpos	%icc,	%o4,	%g6
	lduw	[%l7 + 0x50],	%i7
	movcs	%xcc,	%l6,	%l1
	ldub	[%l7 + 0x70],	%g3
	stb	%g7,	[%l7 + 0x11]
	edge8l	%o5,	%o0,	%l4
	fmovse	%icc,	%f17,	%f3
	andncc	%g5,	%i3,	%l5
	mulx	%i1,	0x136A,	%l2
	edge8	%g2,	%o2,	%o6
	move	%xcc,	%i4,	%g1
	popc	0x0A89,	%o7
	fsrc2s	%f30,	%f22
	fpackfix	%f2,	%f7
	subcc	%i5,	%o1,	%i6
	save %l3, %i0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l0,	%i2
	ldd	[%l7 + 0x70],	%o2
	ldx	[%l7 + 0x08],	%g6
	save %i7, 0x08E4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l1,	%g3,	%g7
	xor	%o4,	%o5,	%l4
	fxnor	%f6,	%f4,	%f4
	edge32n	%g5,	%i3,	%l5
	movvc	%xcc,	%o0,	%i1
	fmovsleu	%icc,	%f9,	%f11
	fmovs	%f8,	%f1
	edge32	%g2,	%o2,	%o6
	stx	%l2,	[%l7 + 0x30]
	xor	%i4,	%o7,	%i5
	mulscc	%o1,	0x0DD8,	%g1
	fsrc1s	%f20,	%f4
	movre	%i6,	0x3C4,	%i0
	movrgz	%l3,	0x372,	%g4
	fornot1s	%f18,	%f8,	%f9
	sra	%l0,	%o3,	%i2
	fpsub32	%f2,	%f14,	%f30
	edge16	%g6,	%i7,	%l6
	siam	0x4
	add	%g3,	0x19B9,	%g7
	edge32	%l1,	%o4,	%o5
	stw	%g5,	[%l7 + 0x48]
	nop
	set	0x18, %o6
	std	%f22,	[%l7 + %o6]
	lduw	[%l7 + 0x74],	%l4
	edge16l	%i3,	%l5,	%o0
	xnorcc	%g2,	0x1CDE,	%o2
	alignaddr	%o6,	%i1,	%i4
	fsrc1	%f20,	%f20
	fcmpes	%fcc0,	%f12,	%f6
	ldsh	[%l7 + 0x0A],	%l2
	st	%f7,	[%l7 + 0x64]
	fmovdleu	%icc,	%f28,	%f0
	mova	%icc,	%o7,	%i5
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	fcmps	%fcc1,	%f0,	%f30
	fnot2s	%f24,	%f1
	movne	%icc,	%l3,	%g4
	fmovdcc	%icc,	%f19,	%f2
	fmovs	%f26,	%f8
	fmovscs	%icc,	%f21,	%f17
	fmovrdne	%l0,	%f28,	%f10
	andn	%i6,	0x0ADB,	%i2
	movrgz	%g6,	%o3,	%i7
	sir	0x0D86
	movvc	%xcc,	%g3,	%g7
	edge8	%l1,	%l6,	%o5
	movrne	%g5,	0x16D,	%l4
	fxor	%f24,	%f12,	%f20
	xnor	%i3,	0x02AC,	%o4
	edge16	%o0,	%g2,	%l5
	array8	%o6,	%i1,	%o2
	fmuld8sux16	%f24,	%f17,	%f12
	fcmpd	%fcc3,	%f30,	%f0
	alignaddrl	%l2,	%o7,	%i4
	xnorcc	%g1,	0x111B,	%i5
	srl	%i0,	0x14,	%l3
	alignaddrl	%o1,	%g4,	%i6
	umulcc	%i2,	%l0,	%g6
	fmovrdne	%o3,	%f18,	%f12
	edge32n	%i7,	%g3,	%g7
	for	%f22,	%f2,	%f24
	edge16n	%l6,	%o5,	%l1
	array8	%g5,	%i3,	%l4
	sdivx	%o4,	0x15C8,	%o0
	udivcc	%g2,	0x1195,	%l5
	ldd	[%l7 + 0x08],	%o6
	movcs	%icc,	%o2,	%i1
	fornot1	%f28,	%f4,	%f20
	std	%f14,	[%l7 + 0x30]
	movleu	%icc,	%o7,	%l2
	ldx	[%l7 + 0x58],	%i4
	ldub	[%l7 + 0x78],	%g1
	ld	[%l7 + 0x4C],	%f17
	array32	%i5,	%l3,	%o1
	movvc	%icc,	%g4,	%i0
	movleu	%icc,	%i6,	%l0
	fabsd	%f4,	%f28
	fnand	%f6,	%f14,	%f4
	movpos	%xcc,	%i2,	%g6
	movg	%xcc,	%o3,	%g3
	sll	%i7,	0x08,	%l6
	movvc	%xcc,	%g7,	%l1
	fmovdn	%icc,	%f22,	%f24
	array16	%o5,	%g5,	%l4
	fnors	%f3,	%f0,	%f16
	movl	%icc,	%o4,	%o0
	mulscc	%i3,	%l5,	%o6
	sth	%o2,	[%l7 + 0x48]
	movrne	%i1,	0x208,	%o7
	nop
	set	0x30, %i7
	stx	%l2,	[%l7 + %i7]
	edge8	%i4,	%g1,	%g2
	movrgz	%i5,	0x308,	%l3
	mulscc	%o1,	0x0BCF,	%i0
	lduw	[%l7 + 0x44],	%g4
	smul	%l0,	0x17C3,	%i2
	xor	%i6,	0x1964,	%o3
	movpos	%icc,	%g3,	%g6
	movcs	%icc,	%i7,	%l6
	fcmped	%fcc3,	%f4,	%f26
	sdiv	%g7,	0x0497,	%l1
	mulscc	%g5,	%o5,	%o4
	fmovrdlez	%o0,	%f20,	%f8
	fmovdge	%icc,	%f10,	%f15
	mova	%xcc,	%l4,	%l5
	udiv	%o6,	0x1184,	%i3
	fmovrslez	%i1,	%f21,	%f30
	lduw	[%l7 + 0x7C],	%o2
	addc	%o7,	0x03D7,	%l2
	movre	%i4,	%g2,	%g1
	addcc	%i5,	%l3,	%o1
	fabss	%f1,	%f1
	addccc	%i0,	0x1700,	%g4
	movcs	%xcc,	%i2,	%i6
	fmovdg	%xcc,	%f28,	%f31
	orncc	%l0,	%o3,	%g6
	ldsh	[%l7 + 0x54],	%i7
	std	%f18,	[%l7 + 0x78]
	nop
	set	0x58, %o7
	lduw	[%l7 + %o7],	%g3
	or	%g7,	0x15BA,	%l6
	addc	%l1,	0x19AD,	%g5
	movn	%xcc,	%o4,	%o0
	movgu	%xcc,	%l4,	%o5
	ld	[%l7 + 0x78],	%f24
	fmovdneg	%xcc,	%f21,	%f7
	ldsh	[%l7 + 0x3A],	%o6
	mulscc	%l5,	0x0283,	%i1
	movrlez	%o2,	%o7,	%l2
	smul	%i4,	%i3,	%g1
	fnot2s	%f23,	%f2
	xnorcc	%i5,	0x146D,	%l3
	siam	0x0
	add	%g2,	0x0FA7,	%i0
	srlx	%o1,	0x11,	%i2
	srax	%g4,	%i6,	%l0
	ldx	[%l7 + 0x70],	%o3
	fmuld8ulx16	%f8,	%f21,	%f6
	udivcc	%i7,	0x0E4A,	%g3
	fmovscc	%icc,	%f26,	%f19
	srax	%g6,	%g7,	%l6
	fmovsge	%icc,	%f13,	%f11
	addccc	%l1,	%o4,	%o0
	movvs	%xcc,	%l4,	%g5
	fmovrdgez	%o5,	%f2,	%f2
	movcc	%icc,	%l5,	%o6
	lduh	[%l7 + 0x32],	%i1
	array32	%o7,	%o2,	%i4
	sub	%l2,	%i3,	%i5
	fmovdle	%icc,	%f11,	%f13
	fmovdleu	%xcc,	%f11,	%f23
	lduh	[%l7 + 0x5E],	%g1
	addc	%g2,	0x049B,	%i0
	movrgez	%o1,	%i2,	%g4
	sllx	%l3,	%l0,	%o3
	fnot2	%f4,	%f8
	umulcc	%i7,	0x021B,	%i6
	addc	%g6,	%g3,	%l6
	addc	%g7,	0x090C,	%l1
	lduh	[%l7 + 0x2C],	%o0
	sra	%l4,	%o4,	%o5
	movrlez	%g5,	%o6,	%l5
	add	%o7,	0x079E,	%o2
	popc	0x0194,	%i4
	movneg	%xcc,	%i1,	%l2
	movn	%icc,	%i5,	%g1
	fmovrdlz	%g2,	%f24,	%f0
	add	%i0,	%i3,	%i2
	fmovda	%icc,	%f7,	%f29
	movrlz	%o1,	%g4,	%l3
	sra	%l0,	%o3,	%i7
	fabsd	%f16,	%f28
	sth	%g6,	[%l7 + 0x78]
	sir	0x06B5
	array16	%g3,	%i6,	%l6
	stb	%l1,	[%l7 + 0x73]
	movneg	%icc,	%o0,	%g7
	st	%f23,	[%l7 + 0x44]
	xorcc	%o4,	0x07E0,	%o5
	fabsd	%f26,	%f20
	movn	%icc,	%g5,	%l4
	fmovsg	%xcc,	%f6,	%f23
	movgu	%icc,	%l5,	%o7
	mulscc	%o2,	%o6,	%i1
	mulscc	%l2,	%i4,	%i5
	fxnors	%f23,	%f29,	%f7
	movleu	%icc,	%g2,	%i0
	st	%f17,	[%l7 + 0x20]
	addccc	%g1,	0x1E89,	%i2
	ldub	[%l7 + 0x30],	%i3
	edge16ln	%o1,	%g4,	%l0
	edge16l	%l3,	%o3,	%i7
	edge32	%g3,	%i6,	%l6
	sdivx	%g6,	0x18CD,	%o0
	edge16l	%g7,	%l1,	%o4
	fmovrdlz	%g5,	%f26,	%f0
	fcmpd	%fcc1,	%f10,	%f2
	ldsb	[%l7 + 0x43],	%l4
	fmovrdne	%l5,	%f12,	%f8
	udivcc	%o7,	0x1367,	%o5
	sth	%o2,	[%l7 + 0x52]
	smul	%o6,	0x0EFC,	%l2
	sir	0x163E
	fmovrsgz	%i4,	%f7,	%f3
	stx	%i1,	[%l7 + 0x58]
	nop
	set	0x3D, %l3
	ldsb	[%l7 + %l3],	%g2
	fcmpeq16	%f6,	%f8,	%i0
	edge32	%i5,	%i2,	%i3
	fandnot1s	%f17,	%f1,	%f24
	edge16	%g1,	%o1,	%l0
	fpmerge	%f21,	%f22,	%f4
	movleu	%xcc,	%l3,	%g4
	ldsb	[%l7 + 0x50],	%o3
	alignaddrl	%i7,	%i6,	%l6
	smulcc	%g6,	0x05B2,	%o0
	ldsw	[%l7 + 0x78],	%g3
	edge16	%l1,	%g7,	%g5
	fones	%f9
	addccc	%o4,	%l5,	%o7
	ldsh	[%l7 + 0x30],	%l4
	array32	%o2,	%o5,	%l2
	fmovsge	%xcc,	%f29,	%f9
	sra	%o6,	0x0D,	%i1
	mova	%xcc,	%g2,	%i0
	edge8l	%i5,	%i2,	%i4
	srl	%i3,	0x14,	%g1
	sth	%o1,	[%l7 + 0x76]
	or	%l3,	%g4,	%o3
	edge8	%l0,	%i7,	%i6
	srax	%g6,	%l6,	%g3
	movcc	%icc,	%l1,	%g7
	xor	%o0,	0x041C,	%o4
	orncc	%g5,	0x166C,	%l5
	std	%f20,	[%l7 + 0x10]
	edge16ln	%o7,	%l4,	%o2
	mova	%icc,	%l2,	%o5
	subccc	%o6,	0x0CCE,	%i1
	edge8ln	%g2,	%i0,	%i5
	movge	%icc,	%i2,	%i4
	smul	%i3,	%g1,	%o1
	movge	%xcc,	%g4,	%l3
	movpos	%icc,	%o3,	%i7
	edge16n	%l0,	%i6,	%g6
	array32	%g3,	%l1,	%l6
	udiv	%g7,	0x0356,	%o0
	popc	%o4,	%l5
	edge8n	%o7,	%g5,	%o2
	movrgz	%l2,	%o5,	%l4
	array32	%o6,	%i1,	%i0
	edge8l	%i5,	%g2,	%i2
	andncc	%i4,	%i3,	%g1
	edge8ln	%o1,	%g4,	%o3
	fandnot1	%f28,	%f10,	%f4
	fmovdn	%xcc,	%f10,	%f19
	andncc	%l3,	%l0,	%i7
	nop
	set	0x7A, %o4
	stb	%g6,	[%l7 + %o4]
	udivx	%g3,	0x16F8,	%l1
	movvc	%xcc,	%i6,	%g7
	stw	%o0,	[%l7 + 0x1C]
	fsrc1	%f30,	%f18
	fzeros	%f16
	fmul8x16al	%f14,	%f14,	%f22
	stb	%o4,	[%l7 + 0x11]
	fmovda	%xcc,	%f22,	%f6
	array32	%l5,	%o7,	%g5
	nop
	set	0x42, %o1
	lduh	[%l7 + %o1],	%o2
	addc	%l6,	%o5,	%l2
	or	%o6,	0x1ECA,	%l4
	ldsw	[%l7 + 0x20],	%i1
	fnor	%f4,	%f2,	%f4
	fmovdgu	%xcc,	%f31,	%f28
	sllx	%i0,	0x1F,	%g2
	edge16l	%i2,	%i5,	%i3
	orncc	%i4,	0x0E34,	%g1
	edge16ln	%o1,	%g4,	%l3
	fmovdl	%icc,	%f8,	%f4
	fsrc2s	%f4,	%f12
	ldx	[%l7 + 0x28],	%l0
	save %i7, 0x1C86, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g3,	0x1B5E,	%l1
	fmovdle	%xcc,	%f13,	%f1
	move	%xcc,	%o3,	%i6
	movgu	%xcc,	%g7,	%o0
	fmovdn	%xcc,	%f22,	%f27
	xor	%o4,	%o7,	%l5
	movre	%g5,	0x23D,	%l6
	lduh	[%l7 + 0x46],	%o5
	fmovscc	%xcc,	%f25,	%f27
	fmovdneg	%xcc,	%f7,	%f28
	add	%o2,	%l2,	%o6
	fmovrdlz	%l4,	%f30,	%f10
	restore %i0, 0x0F3E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i2,	0x1B9D,	%i5
	xnor	%g2,	%i3,	%i4
	srlx	%o1,	%g4,	%g1
	ldsw	[%l7 + 0x74],	%l3
	edge16	%i7,	%g6,	%l0
	fcmpd	%fcc3,	%f18,	%f14
	movcs	%xcc,	%l1,	%o3
	sdiv	%i6,	0x0AA2,	%g7
	xnor	%o0,	%o4,	%g3
	st	%f4,	[%l7 + 0x38]
	fandnot1	%f2,	%f20,	%f10
	fsrc1	%f12,	%f22
	array32	%l5,	%o7,	%l6
	fmovsgu	%xcc,	%f25,	%f19
	fmul8x16au	%f27,	%f0,	%f6
	mova	%icc,	%g5,	%o2
	sdivx	%l2,	0x1E41,	%o5
	edge16	%o6,	%l4,	%i0
	fxors	%f3,	%f9,	%f19
	ldx	[%l7 + 0x28],	%i1
	movgu	%icc,	%i2,	%g2
	fmovdle	%xcc,	%f9,	%f25
	std	%f14,	[%l7 + 0x58]
	fnands	%f9,	%f21,	%f28
	fmovda	%icc,	%f2,	%f26
	xor	%i3,	0x1542,	%i5
	movrlez	%o1,	%g4,	%i4
	xnorcc	%l3,	0x03B8,	%i7
	sdivx	%g6,	0x107E,	%g1
	stx	%l1,	[%l7 + 0x40]
	array32	%o3,	%i6,	%l0
	fmovrsne	%g7,	%f27,	%f3
	fmul8x16al	%f17,	%f24,	%f12
	fpsub32s	%f6,	%f19,	%f9
	mulx	%o4,	0x0978,	%g3
	andncc	%o0,	%l5,	%l6
	ldsb	[%l7 + 0x7B],	%g5
	movpos	%icc,	%o7,	%l2
	smulcc	%o5,	%o6,	%o2
	fmovrsgz	%l4,	%f6,	%f5
	fcmped	%fcc3,	%f22,	%f14
	movvs	%icc,	%i1,	%i0
	fmul8x16	%f23,	%f28,	%f16
	stw	%i2,	[%l7 + 0x28]
	orcc	%i3,	%i5,	%o1
	edge8l	%g2,	%i4,	%l3
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	movle	%icc,	%g6,	%o3
	movcs	%icc,	%l1,	%i6
	sethi	0x1E3A,	%g7
	ldsw	[%l7 + 0x1C],	%o4
	movne	%icc,	%l0,	%o0
	fmovrdlz	%g3,	%f14,	%f10
	addc	%l5,	%l6,	%o7
	ld	[%l7 + 0x5C],	%f25
	alignaddrl	%g5,	%l2,	%o5
	movrne	%o2,	%o6,	%i1
	stx	%i0,	[%l7 + 0x48]
	add	%l4,	%i2,	%i5
	addccc	%i3,	%o1,	%g2
	movn	%xcc,	%i4,	%i7
	smulcc	%g4,	0x1225,	%g1
	ldd	[%l7 + 0x30],	%f0
	alignaddrl	%l3,	%g6,	%o3
	subc	%i6,	%l1,	%o4
	movne	%icc,	%g7,	%o0
	nop
	set	0x48, %l5
	ldx	[%l7 + %l5],	%l0
	edge16	%g3,	%l5,	%o7
	alignaddrl	%l6,	%g5,	%o5
	andn	%l2,	%o6,	%i1
	fnegd	%f6,	%f6
	movvc	%xcc,	%i0,	%o2
	edge32n	%i2,	%l4,	%i3
	fpsub16	%f4,	%f0,	%f4
	addccc	%i5,	%g2,	%o1
	movcc	%icc,	%i7,	%i4
	subccc	%g4,	%l3,	%g6
	edge32l	%g1,	%o3,	%l1
	save %o4, 0x1F89, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i6,	%o0,	%l0
	subc	%g3,	%o7,	%l5
	umulcc	%l6,	%o5,	%l2
	edge16ln	%o6,	%g5,	%i1
	movrlez	%i0,	0x3DF,	%o2
	movle	%xcc,	%l4,	%i2
	fpadd16	%f18,	%f6,	%f10
	umul	%i5,	0x0BA0,	%i3
	movg	%icc,	%g2,	%o1
	edge16ln	%i4,	%i7,	%l3
	edge32	%g4,	%g6,	%o3
	mova	%icc,	%l1,	%g1
	xnor	%g7,	0x1FFE,	%o4
	fandnot1	%f22,	%f12,	%f10
	movrne	%i6,	0x2C1,	%l0
	movrgz	%o0,	0x088,	%g3
	fmovrdlz	%o7,	%f2,	%f0
	and	%l6,	%l5,	%l2
	edge32ln	%o6,	%g5,	%o5
	sth	%i1,	[%l7 + 0x6C]
	movleu	%xcc,	%o2,	%i0
	mova	%icc,	%l4,	%i2
	st	%f3,	[%l7 + 0x34]
	sth	%i5,	[%l7 + 0x7A]
	fmovdgu	%xcc,	%f0,	%f25
	ldd	[%l7 + 0x68],	%f24
	movrne	%g2,	0x17D,	%i3
	movrne	%o1,	%i4,	%i7
	edge8l	%l3,	%g4,	%g6
	addcc	%l1,	%g1,	%o3
	movn	%icc,	%g7,	%o4
	fnot2	%f8,	%f24
	edge32	%l0,	%o0,	%g3
	fmovdgu	%icc,	%f25,	%f5
	andncc	%i6,	%l6,	%l5
	subccc	%o7,	0x0D46,	%o6
	fmovsne	%icc,	%f8,	%f1
	array32	%l2,	%g5,	%i1
	fmovdcs	%xcc,	%f29,	%f22
	stx	%o2,	[%l7 + 0x48]
	sub	%i0,	0x1EA3,	%o5
	edge8n	%i2,	%i5,	%g2
	fexpand	%f1,	%f10
	movrlz	%l4,	0x207,	%i3
	srax	%o1,	0x00,	%i7
	sethi	0x1904,	%l3
	udiv	%i4,	0x02B6,	%g4
	sdiv	%g6,	0x072E,	%l1
	subccc	%o3,	0x0378,	%g7
	edge32ln	%o4,	%l0,	%g1
	ldub	[%l7 + 0x78],	%o0
	mulscc	%i6,	%g3,	%l5
	movrlez	%o7,	0x2D9,	%l6
	movrgz	%l2,	0x0A8,	%o6
	st	%f6,	[%l7 + 0x14]
	fmovsgu	%icc,	%f4,	%f29
	movrgez	%g5,	0x22F,	%i1
	subcc	%i0,	%o5,	%i2
	or	%i5,	%g2,	%l4
	sra	%i3,	0x02,	%o1
	fmovdcc	%xcc,	%f21,	%f21
	fnegd	%f0,	%f10
	sdivx	%i7,	0x07E4,	%l3
	fornot2s	%f1,	%f4,	%f23
	sllx	%o2,	0x17,	%g4
	movrgz	%i4,	%g6,	%o3
	smulcc	%l1,	0x0DF5,	%o4
	edge8	%g7,	%l0,	%o0
	array16	%i6,	%g1,	%l5
	srlx	%g3,	%l6,	%l2
	edge8l	%o6,	%g5,	%i1
	movrgz	%i0,	0x037,	%o7
	edge16	%o5,	%i5,	%i2
	sethi	0x1AE1,	%g2
	movl	%icc,	%i3,	%o1
	movpos	%icc,	%i7,	%l4
	fmovsa	%icc,	%f10,	%f19
	stb	%l3,	[%l7 + 0x21]
	andncc	%o2,	%i4,	%g4
	ldsh	[%l7 + 0x78],	%o3
	edge16n	%l1,	%g6,	%g7
	fnot1s	%f29,	%f6
	lduw	[%l7 + 0x78],	%o4
	sllx	%l0,	%i6,	%o0
	movcs	%icc,	%l5,	%g1
	ldub	[%l7 + 0x33],	%l6
	fornot1s	%f1,	%f13,	%f4
	mulx	%l2,	%g3,	%g5
	movn	%xcc,	%i1,	%i0
	movrgz	%o7,	0x2C5,	%o5
	sra	%o6,	0x08,	%i5
	stw	%g2,	[%l7 + 0x58]
	fcmps	%fcc2,	%f5,	%f25
	movle	%icc,	%i3,	%o1
	nop
	set	0x58, %i3
	ldsw	[%l7 + %i3],	%i2
	srax	%l4,	%i7,	%l3
	lduw	[%l7 + 0x20],	%i4
	stw	%o2,	[%l7 + 0x74]
	mulscc	%o3,	%g4,	%l1
	fmovdg	%icc,	%f20,	%f16
	srax	%g6,	0x13,	%o4
	fmovrse	%g7,	%f1,	%f15
	or	%l0,	%o0,	%l5
	fpsub32s	%f8,	%f23,	%f5
	movrgez	%g1,	0x16B,	%i6
	ldub	[%l7 + 0x2A],	%l6
	or	%g3,	0x191B,	%l2
	lduw	[%l7 + 0x54],	%g5
	movne	%xcc,	%i0,	%o7
	st	%f21,	[%l7 + 0x5C]
	array8	%o5,	%i1,	%o6
	sub	%g2,	0x0904,	%i5
	ldsw	[%l7 + 0x38],	%i3
	movrne	%i2,	0x117,	%o1
	fpadd32s	%f3,	%f16,	%f15
	stw	%i7,	[%l7 + 0x18]
	fmovsgu	%icc,	%f3,	%f9
	mulx	%l4,	0x133D,	%i4
	addcc	%o2,	%o3,	%g4
	fmul8ulx16	%f20,	%f14,	%f18
	ld	[%l7 + 0x64],	%f28
	move	%icc,	%l3,	%g6
	fpsub16	%f4,	%f8,	%f4
	ldx	[%l7 + 0x60],	%l1
	movg	%icc,	%g7,	%o4
	srlx	%o0,	%l0,	%l5
	ldsb	[%l7 + 0x62],	%g1
	edge16ln	%l6,	%g3,	%i6
	movcs	%icc,	%l2,	%g5
	orncc	%o7,	%o5,	%i0
	andncc	%i1,	%o6,	%g2
	fnegs	%f13,	%f14
	udivcc	%i5,	0x18C5,	%i2
	andncc	%i3,	%i7,	%o1
	ld	[%l7 + 0x48],	%f30
	edge16l	%l4,	%i4,	%o2
	save %g4, 0x1670, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o3,	%g6,	%l1
	fmovsa	%xcc,	%f31,	%f24
	movne	%icc,	%g7,	%o4
	edge32l	%o0,	%l0,	%l5
	stw	%g1,	[%l7 + 0x18]
	ld	[%l7 + 0x44],	%f28
	lduh	[%l7 + 0x4A],	%g3
	ld	[%l7 + 0x54],	%f15
	move	%icc,	%i6,	%l2
	sll	%g5,	%o7,	%l6
	orncc	%i0,	0x116D,	%o5
	edge16l	%o6,	%g2,	%i1
	edge16n	%i5,	%i2,	%i3
	movvs	%icc,	%i7,	%l4
	edge16ln	%i4,	%o1,	%o2
	sllx	%l3,	0x19,	%g4
	movge	%xcc,	%o3,	%g6
	movre	%g7,	0x044,	%o4
	fornot1	%f14,	%f20,	%f20
	sub	%l1,	0x0E10,	%o0
	nop
	set	0x46, %g5
	sth	%l0,	[%l7 + %g5]
	fmovsa	%icc,	%f0,	%f30
	andncc	%l5,	%g3,	%g1
	orcc	%l2,	0x0212,	%g5
	xnor	%o7,	0x02A6,	%i6
	ldd	[%l7 + 0x58],	%i6
	umul	%i0,	0x0F5F,	%o6
	fmovdleu	%xcc,	%f31,	%f4
	movl	%icc,	%g2,	%o5
	movg	%xcc,	%i5,	%i2
	sir	0x0B4A
	fmovrdgz	%i3,	%f22,	%f22
	fmovsleu	%icc,	%f30,	%f10
	fmovdne	%xcc,	%f9,	%f2
	addc	%i7,	0x06ED,	%l4
	st	%f27,	[%l7 + 0x78]
	ldsw	[%l7 + 0x70],	%i1
	fmovdge	%xcc,	%f22,	%f11
	addc	%o1,	0x09EB,	%o2
	ldsh	[%l7 + 0x6E],	%l3
	movvs	%icc,	%g4,	%i4
	array8	%g6,	%g7,	%o4
	movre	%l1,	0x37E,	%o0
	fmovdcc	%icc,	%f12,	%f29
	fpsub16s	%f9,	%f14,	%f26
	popc	0x17F1,	%l0
	udiv	%l5,	0x1386,	%o3
	std	%f4,	[%l7 + 0x78]
	orn	%g3,	%l2,	%g5
	edge32ln	%g1,	%i6,	%l6
	xnorcc	%i0,	0x19AA,	%o6
	movcc	%icc,	%o7,	%g2
	mulscc	%o5,	%i2,	%i5
	sth	%i3,	[%l7 + 0x50]
	udivx	%l4,	0x095C,	%i1
	xnor	%o1,	0x1289,	%o2
	fmovdgu	%xcc,	%f12,	%f11
	lduw	[%l7 + 0x4C],	%l3
	std	%f24,	[%l7 + 0x38]
	mulx	%i7,	0x1CCB,	%g4
	subccc	%g6,	0x1E33,	%g7
	movcs	%xcc,	%o4,	%l1
	edge16ln	%i4,	%o0,	%l5
	nop
	set	0x18, %g6
	std	%f10,	[%l7 + %g6]
	mova	%xcc,	%o3,	%g3
	move	%icc,	%l2,	%l0
	fmovdge	%icc,	%f0,	%f30
	edge16	%g1,	%g5,	%i6
	movrlz	%l6,	%o6,	%i0
	movrgez	%g2,	%o7,	%i2
	subcc	%i5,	0x0CCC,	%o5
	fcmps	%fcc2,	%f22,	%f16
	sethi	0x05EB,	%i3
	fcmpne32	%f30,	%f2,	%l4
	udivcc	%i1,	0x135F,	%o2
	subcc	%l3,	%o1,	%i7
	fpmerge	%f6,	%f23,	%f30
	or	%g4,	0x0934,	%g7
	xorcc	%o4,	%l1,	%i4
	fmovrslez	%g6,	%f21,	%f15
	std	%f24,	[%l7 + 0x08]
	fmovda	%icc,	%f30,	%f23
	movne	%xcc,	%o0,	%o3
	mulscc	%l5,	0x0287,	%g3
	movvs	%icc,	%l2,	%g1
	st	%f20,	[%l7 + 0x4C]
	srlx	%l0,	0x0E,	%i6
	fxnors	%f14,	%f11,	%f11
	movvc	%xcc,	%g5,	%l6
	movrlz	%o6,	%g2,	%i0
	fcmpgt32	%f26,	%f4,	%o7
	edge32l	%i2,	%i5,	%i3
	fmuld8ulx16	%f28,	%f29,	%f24
	std	%f2,	[%l7 + 0x68]
	sllx	%o5,	%i1,	%o2
	umul	%l4,	%l3,	%i7
	ldd	[%l7 + 0x40],	%g4
	fpmerge	%f3,	%f9,	%f14
	umulcc	%g7,	%o4,	%l1
	addc	%o1,	0x1B56,	%i4
	sth	%g6,	[%l7 + 0x30]
	ldub	[%l7 + 0x6D],	%o0
	array16	%l5,	%o3,	%l2
	movrne	%g3,	0x0B6,	%l0
	movrlez	%i6,	0x20E,	%g1
	ldub	[%l7 + 0x48],	%l6
	edge32ln	%o6,	%g2,	%g5
	ldd	[%l7 + 0x18],	%f26
	array32	%i0,	%i2,	%o7
	movne	%xcc,	%i3,	%i5
	st	%f10,	[%l7 + 0x6C]
	movle	%xcc,	%i1,	%o2
	udivcc	%l4,	0x1FAA,	%o5
	ldsw	[%l7 + 0x48],	%l3
	fxor	%f28,	%f12,	%f28
	movne	%xcc,	%i7,	%g7
	sdiv	%g4,	0x09BC,	%o4
	addcc	%l1,	%i4,	%g6
	stw	%o1,	[%l7 + 0x18]
	andcc	%o0,	%o3,	%l5
	fandnot1s	%f27,	%f8,	%f22
	fmovsl	%xcc,	%f1,	%f17
	movrgz	%l2,	%l0,	%i6
	addccc	%g3,	0x021E,	%g1
	andcc	%l6,	%o6,	%g2
	fands	%f4,	%f30,	%f2
	sdivx	%g5,	0x10B9,	%i2
	edge16ln	%i0,	%o7,	%i3
	umulcc	%i5,	0x0D68,	%i1
	sllx	%l4,	%o2,	%o5
	fmovrsgez	%i7,	%f11,	%f24
	sdiv	%l3,	0x1E62,	%g7
	movrlez	%g4,	0x065,	%l1
	movgu	%xcc,	%o4,	%g6
	edge16ln	%o1,	%o0,	%o3
	addcc	%l5,	0x19BD,	%i4
	ldx	[%l7 + 0x60],	%l0
	sdivcc	%l2,	0x1683,	%i6
	movl	%icc,	%g3,	%g1
	st	%f21,	[%l7 + 0x30]
	udivcc	%o6,	0x14EA,	%g2
	andncc	%l6,	%i2,	%i0
	ldd	[%l7 + 0x68],	%f20
	ldsb	[%l7 + 0x41],	%o7
	bshuffle	%f14,	%f4,	%f20
	srl	%g5,	0x19,	%i3
	movvc	%xcc,	%i1,	%i5
	mova	%xcc,	%l4,	%o5
	movrlz	%o2,	0x1DF,	%l3
	movrgez	%i7,	%g7,	%g4
	andcc	%l1,	%g6,	%o4
	andncc	%o1,	%o0,	%l5
	udiv	%o3,	0x142E,	%i4
	fpsub16s	%f18,	%f10,	%f9
	edge16l	%l0,	%l2,	%i6
	fmovdleu	%xcc,	%f20,	%f26
	and	%g3,	0x1BD2,	%o6
	movge	%xcc,	%g2,	%g1
	save %i2, 0x11A4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f29,	%f21,	%f8
	sll	%o7,	%g5,	%l6
	movrlz	%i1,	0x0FF,	%i3
	fpadd16s	%f12,	%f21,	%f27
	edge8	%i5,	%l4,	%o2
	fcmpeq32	%f4,	%f22,	%l3
	smul	%o5,	0x01DE,	%i7
	movl	%icc,	%g4,	%l1
	ldsb	[%l7 + 0x33],	%g7
	umulcc	%o4,	0x0B1F,	%o1
	sdivcc	%g6,	0x053C,	%o0
	edge16n	%o3,	%l5,	%i4
	ldsh	[%l7 + 0x18],	%l0
	fzero	%f6
	fmovdl	%xcc,	%f23,	%f17
	sth	%l2,	[%l7 + 0x34]
	movneg	%icc,	%i6,	%g3
	movne	%xcc,	%o6,	%g2
	edge32	%i2,	%g1,	%o7
	edge16n	%g5,	%i0,	%l6
	bshuffle	%f28,	%f18,	%f10
	movrlez	%i3,	%i1,	%l4
	ldd	[%l7 + 0x58],	%f2
	movcc	%icc,	%o2,	%l3
	ldd	[%l7 + 0x60],	%f10
	fcmpne16	%f6,	%f2,	%i5
	fnands	%f6,	%f25,	%f30
	movrgez	%o5,	0x197,	%g4
	fcmpne16	%f10,	%f8,	%l1
	movn	%icc,	%g7,	%o4
	addccc	%o1,	0x162B,	%g6
	ld	[%l7 + 0x58],	%f5
	andncc	%i7,	%o3,	%l5
	edge8l	%i4,	%l0,	%o0
	movne	%icc,	%i6,	%l2
	addc	%o6,	%g3,	%g2
	subcc	%i2,	0x00CF,	%o7
	movcc	%xcc,	%g5,	%g1
	ldsw	[%l7 + 0x0C],	%l6
	array16	%i0,	%i3,	%l4
	sub	%o2,	0x0B4C,	%l3
	fzero	%f6
	xnor	%i1,	0x1ABF,	%i5
	fmovrse	%o5,	%f26,	%f3
	sir	0x0AA3
	mova	%xcc,	%g4,	%g7
	srl	%l1,	0x1A,	%o4
	fors	%f17,	%f12,	%f2
	fcmps	%fcc3,	%f19,	%f14
	fcmpeq16	%f0,	%f6,	%g6
	edge16l	%i7,	%o3,	%o1
	alignaddrl	%l5,	%l0,	%i4
	movleu	%xcc,	%i6,	%l2
	stb	%o0,	[%l7 + 0x17]
	movge	%xcc,	%o6,	%g2
	restore %i2, %o7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g5,	0x1D77,	%l6
	movrne	%i0,	0x0DF,	%i3
	ldd	[%l7 + 0x70],	%l4
	ldx	[%l7 + 0x18],	%o2
	edge32l	%l3,	%i1,	%i5
	alignaddrl	%o5,	%g1,	%g7
	fmovrdgz	%g4,	%f18,	%f16
	mulx	%l1,	%g6,	%i7
	movrgez	%o4,	%o1,	%o3
	fcmpne16	%f4,	%f2,	%l5
	edge8	%l0,	%i4,	%l2
	sdivx	%o0,	0x035A,	%i6
	fpadd32s	%f14,	%f12,	%f9
	edge32ln	%g2,	%i2,	%o6
	xor	%g3,	%o7,	%l6
	edge16n	%g5,	%i0,	%l4
	subccc	%i3,	%o2,	%i1
	add	%l3,	0x03D9,	%i5
	array32	%g1,	%o5,	%g4
	edge16ln	%l1,	%g6,	%i7
	edge8	%o4,	%o1,	%o3
	ldsw	[%l7 + 0x5C],	%l5
	movvs	%icc,	%l0,	%i4
	addc	%l2,	0x15ED,	%g7
	array32	%i6,	%o0,	%g2
	srlx	%o6,	%g3,	%o7
	ld	[%l7 + 0x28],	%f4
	movcs	%icc,	%l6,	%g5
	alignaddrl	%i0,	%l4,	%i2
	movrlez	%i3,	%o2,	%l3
	subccc	%i1,	%i5,	%g1
	movge	%xcc,	%o5,	%l1
	edge32l	%g6,	%g4,	%i7
	movrgez	%o4,	0x27E,	%o1
	edge8l	%l5,	%l0,	%o3
	udivcc	%i4,	0x149E,	%l2
	addc	%g7,	%i6,	%g2
	addccc	%o0,	0x1A19,	%g3
	srlx	%o6,	0x10,	%o7
	movpos	%icc,	%g5,	%l6
	xnor	%l4,	0x09C8,	%i2
	edge16	%i3,	%o2,	%i0
	edge8l	%i1,	%l3,	%i5
	alignaddrl	%o5,	%l1,	%g6
	fmovdcs	%xcc,	%f1,	%f31
	fmovsg	%xcc,	%f12,	%f23
	sub	%g1,	%i7,	%g4
	mulscc	%o4,	%l5,	%l0
	xnor	%o1,	%i4,	%o3
	fmovsge	%icc,	%f18,	%f25
	srlx	%g7,	%i6,	%l2
	movvc	%xcc,	%o0,	%g3
	fand	%f8,	%f2,	%f10
	orncc	%g2,	%o6,	%o7
	sdivcc	%l6,	0x16A7,	%g5
	movl	%xcc,	%l4,	%i3
	umul	%i2,	%o2,	%i1
	edge8ln	%l3,	%i5,	%o5
	fmovscc	%icc,	%f6,	%f7
	andcc	%i0,	%g6,	%l1
	fxor	%f18,	%f16,	%f30
	fnegd	%f28,	%f20
	movn	%xcc,	%g1,	%i7
	edge8n	%g4,	%o4,	%l0
	edge32	%l5,	%o1,	%o3
	edge16l	%i4,	%i6,	%g7
	st	%f22,	[%l7 + 0x2C]
	movn	%xcc,	%l2,	%o0
	edge32n	%g3,	%o6,	%o7
	fmovsg	%xcc,	%f27,	%f12
	fmovrsgz	%l6,	%f27,	%f6
	sllx	%g2,	0x14,	%l4
	edge32	%i3,	%g5,	%o2
	move	%xcc,	%i2,	%i1
	stx	%l3,	[%l7 + 0x70]
	ldsw	[%l7 + 0x60],	%i5
	lduh	[%l7 + 0x28],	%i0
	movge	%xcc,	%g6,	%l1
	fmul8ulx16	%f14,	%f0,	%f4
	orn	%g1,	0x0FB9,	%o5
	ldd	[%l7 + 0x38],	%g4
	addccc	%i7,	%l0,	%o4
	fmovrslez	%o1,	%f0,	%f2
	fmovrslez	%o3,	%f10,	%f19
	add	%l5,	0x03F4,	%i6
	alignaddrl	%g7,	%l2,	%o0
	alignaddrl	%i4,	%o6,	%o7
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%l6
	movpos	%xcc,	%g3,	%l4
	fpsub32	%f16,	%f10,	%f22
	fornot1s	%f17,	%f6,	%f10
	movne	%xcc,	%i3,	%g2
	fmovrsgz	%o2,	%f20,	%f4
	sll	%i2,	0x00,	%g5
	ldsb	[%l7 + 0x08],	%l3
	movne	%icc,	%i1,	%i0
	udivcc	%g6,	0x1F37,	%i5
	popc	0x0BF5,	%l1
	lduh	[%l7 + 0x7E],	%g1
	edge32	%g4,	%i7,	%o5
	fcmpne32	%f2,	%f0,	%l0
	edge16n	%o4,	%o1,	%l5
	andncc	%o3,	%g7,	%i6
	mulx	%l2,	%i4,	%o6
	fnot1	%f30,	%f0
	fmovrsne	%o7,	%f31,	%f12
	edge16l	%o0,	%l6,	%l4
	umul	%g3,	0x1AF6,	%g2
	movgu	%icc,	%o2,	%i3
	sdivcc	%i2,	0x0FFD,	%g5
	ldsb	[%l7 + 0x5B],	%l3
	lduw	[%l7 + 0x7C],	%i1
	edge8ln	%g6,	%i5,	%l1
	movcs	%icc,	%g1,	%i0
	movre	%i7,	%g4,	%o5
	andn	%l0,	0x029A,	%o1
	mulscc	%o4,	0x1CC8,	%o3
	movn	%xcc,	%l5,	%i6
	edge16l	%g7,	%i4,	%o6
	srl	%o7,	%o0,	%l2
	fmovdge	%xcc,	%f11,	%f6
	save %l6, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x58],	%f2
	udivcc	%o2,	0x0A37,	%i3
	fnors	%f3,	%f31,	%f4
	xor	%g2,	0x0C08,	%g5
	fxors	%f11,	%f9,	%f0
	st	%f14,	[%l7 + 0x18]
	sir	0x1D3F
	stw	%i2,	[%l7 + 0x68]
	mova	%icc,	%i1,	%l3
	fmovscs	%icc,	%f24,	%f19
	nop
	set	0x26, %l2
	ldsh	[%l7 + %l2],	%g6
	edge8	%l1,	%g1,	%i0
	udivx	%i5,	0x05A6,	%g4
	mulx	%i7,	%o5,	%l0
	edge8n	%o1,	%o3,	%o4
	mulx	%l5,	%i6,	%g7
	fnot1	%f18,	%f24
	fcmple32	%f16,	%f22,	%o6
	mulx	%i4,	0x031C,	%o0
	stw	%l2,	[%l7 + 0x68]
	edge16l	%l6,	%o7,	%g3
	sdivx	%o2,	0x1BA2,	%i3
	movge	%icc,	%g2,	%g5
	array8	%i2,	%l4,	%l3
	edge16n	%g6,	%l1,	%g1
	ldd	[%l7 + 0x50],	%f18
	andcc	%i1,	%i5,	%i0
	movg	%icc,	%g4,	%o5
	movrlez	%l0,	%i7,	%o3
	movre	%o4,	%l5,	%i6
	array16	%o1,	%o6,	%i4
	move	%icc,	%g7,	%o0
	movvs	%xcc,	%l2,	%l6
	movg	%xcc,	%g3,	%o7
	edge16ln	%o2,	%g2,	%i3
	smul	%i2,	0x142E,	%g5
	umulcc	%l3,	0x1382,	%l4
	fcmps	%fcc2,	%f18,	%f26
	fxnor	%f28,	%f8,	%f8
	umulcc	%g6,	%l1,	%g1
	ldsh	[%l7 + 0x7A],	%i1
	fmovdg	%icc,	%f4,	%f2
	sdiv	%i5,	0x0C32,	%i0
	udivcc	%o5,	0x16F3,	%g4
	fmovrdgez	%i7,	%f4,	%f4
	edge16l	%l0,	%o3,	%l5
	andcc	%o4,	%o1,	%i6
	ldsw	[%l7 + 0x6C],	%i4
	xorcc	%o6,	0x0F01,	%o0
	movrlez	%l2,	%l6,	%g3
	andncc	%g7,	%o7,	%o2
	smul	%g2,	%i3,	%i2
	movrlz	%l3,	0x041,	%g5
	edge8	%l4,	%l1,	%g6
	xorcc	%i1,	0x0241,	%i5
	mulscc	%i0,	0x02A4,	%o5
	subccc	%g1,	%i7,	%g4
	array32	%o3,	%l5,	%o4
	ldx	[%l7 + 0x18],	%l0
	edge16n	%o1,	%i4,	%i6
	nop
	set	0x20, %g4
	lduw	[%l7 + %g4],	%o6
	movpos	%icc,	%o0,	%l2
	stb	%l6,	[%l7 + 0x67]
	udivcc	%g3,	0x1B69,	%g7
	movpos	%xcc,	%o7,	%o2
	xnorcc	%i3,	%i2,	%g2
	fsrc1s	%f16,	%f29
	fmovrdlez	%l3,	%f26,	%f10
	edge8l	%l4,	%g5,	%l1
	sdiv	%i1,	0x03B6,	%g6
	srax	%i5,	%i0,	%g1
	ldd	[%l7 + 0x30],	%i6
	alignaddr	%o5,	%o3,	%g4
	fcmpne16	%f24,	%f16,	%o4
	xnor	%l0,	0x0FBD,	%l5
	edge16l	%o1,	%i4,	%i6
	ldub	[%l7 + 0x49],	%o6
	addc	%o0,	0x0236,	%l2
	orcc	%g3,	%g7,	%o7
	sdiv	%o2,	0x1BE7,	%l6
	fmovsleu	%xcc,	%f9,	%f22
	edge16n	%i2,	%g2,	%i3
	mulscc	%l3,	%g5,	%l1
	movg	%xcc,	%l4,	%i1
	sdivx	%i5,	0x0E31,	%i0
	ld	[%l7 + 0x1C],	%f11
	movrne	%g6,	0x15B,	%i7
	fmovdvc	%xcc,	%f21,	%f1
	movne	%icc,	%o5,	%g1
	subcc	%g4,	0x19C6,	%o4
	addcc	%o3,	0x1217,	%l5
	orncc	%l0,	%o1,	%i4
	subc	%i6,	%o0,	%l2
	array32	%g3,	%o6,	%o7
	movvs	%icc,	%g7,	%o2
	udivx	%i2,	0x09B1,	%l6
	xorcc	%i3,	%g2,	%g5
	orncc	%l1,	0x0FEB,	%l4
	fcmpgt16	%f14,	%f26,	%l3
	fnands	%f28,	%f17,	%f22
	alignaddrl	%i5,	%i0,	%i1
	movvs	%icc,	%g6,	%o5
	sub	%i7,	%g4,	%o4
	addc	%o3,	%l5,	%g1
	lduw	[%l7 + 0x74],	%o1
	addcc	%l0,	0x048F,	%i4
	movcc	%icc,	%i6,	%l2
	ldd	[%l7 + 0x60],	%g2
	ldd	[%l7 + 0x68],	%o6
	sll	%o7,	0x1A,	%g7
	fmovsneg	%icc,	%f29,	%f2
	movrgez	%o0,	%i2,	%l6
	save %i3, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l1,	%l4,	%g5
	sra	%i5,	0x18,	%l3
	movre	%i1,	0x364,	%i0
	edge16ln	%g6,	%i7,	%o5
	save %g4, %o3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l5,	0x1A78,	%g1
	xor	%o1,	%i4,	%l0
	array16	%i6,	%g3,	%o6
	pdist	%f4,	%f20,	%f6
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	movre	%o0,	%i2,	%o7
	xor	%i3,	%g2,	%l6
	sethi	0x0386,	%o2
	edge32l	%l4,	%g5,	%i5
	fcmpgt16	%f28,	%f4,	%l3
	movg	%icc,	%l1,	%i0
	fzeros	%f10
	srl	%g6,	%i7,	%o5
	edge8l	%g4,	%i1,	%o4
	movcc	%xcc,	%o3,	%l5
	movrgz	%g1,	0x2EE,	%i4
	smul	%o1,	%i6,	%l0
	ldsh	[%l7 + 0x28],	%o6
	udivx	%l2,	0x0298,	%g3
	fmovrde	%g7,	%f18,	%f24
	std	%f12,	[%l7 + 0x68]
	srl	%i2,	0x02,	%o0
	orn	%o7,	%i3,	%l6
	move	%xcc,	%g2,	%o2
	edge32l	%l4,	%g5,	%i5
	movrlez	%l3,	0x052,	%l1
	array16	%g6,	%i7,	%i0
	fnot1s	%f4,	%f5
	edge16	%o5,	%i1,	%o4
	sdivcc	%o3,	0x117C,	%l5
	sra	%g1,	0x0F,	%g4
	addc	%i4,	0x10CA,	%o1
	array8	%l0,	%o6,	%i6
	edge16	%g3,	%l2,	%g7
	ldd	[%l7 + 0x48],	%f12
	sra	%o0,	%i2,	%i3
	fmuld8ulx16	%f23,	%f7,	%f14
	fsrc1s	%f31,	%f13
	andn	%o7,	%g2,	%l6
	restore %l4, %g5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l3,	0x17,	%i5
	lduh	[%l7 + 0x62],	%g6
	mova	%xcc,	%i7,	%l1
	mova	%icc,	%i0,	%i1
	nop
	set	0x70, %g7
	stw	%o5,	[%l7 + %g7]
	alignaddrl	%o3,	%o4,	%l5
	addc	%g4,	0x092A,	%i4
	mova	%icc,	%o1,	%g1
	fpmerge	%f6,	%f0,	%f26
	fcmpne32	%f2,	%f16,	%l0
	stx	%i6,	[%l7 + 0x50]
	ldd	[%l7 + 0x20],	%f6
	fcmpne32	%f30,	%f24,	%o6
	udiv	%g3,	0x1A8D,	%g7
	fmovrse	%l2,	%f18,	%f12
	array16	%i2,	%o0,	%i3
	udivcc	%o7,	0x0441,	%l6
	lduh	[%l7 + 0x6A],	%l4
	smul	%g2,	0x198E,	%g5
	edge32n	%l3,	%o2,	%i5
	edge16ln	%i7,	%g6,	%l1
	umulcc	%i1,	0x1DCC,	%o5
	movneg	%xcc,	%o3,	%i0
	subcc	%l5,	%g4,	%i4
	subccc	%o1,	0x01E9,	%o4
	stb	%g1,	[%l7 + 0x2C]
	ldd	[%l7 + 0x38],	%f22
	ldx	[%l7 + 0x78],	%i6
	andncc	%l0,	%g3,	%o6
	mulx	%g7,	0x0310,	%l2
	umulcc	%o0,	%i2,	%o7
	stx	%i3,	[%l7 + 0x48]
	xor	%l4,	%g2,	%l6
	sdivcc	%g5,	0x05A7,	%l3
	ld	[%l7 + 0x2C],	%f10
	alignaddr	%i5,	%i7,	%g6
	stx	%o2,	[%l7 + 0x08]
	fpadd16	%f24,	%f18,	%f14
	fnot1	%f2,	%f8
	movcc	%icc,	%i1,	%l1
	fornot1	%f18,	%f24,	%f8
	fmovspos	%xcc,	%f24,	%f14
	and	%o5,	0x02B3,	%o3
	and	%l5,	0x06C0,	%g4
	edge32l	%i0,	%i4,	%o4
	array32	%g1,	%i6,	%o1
	faligndata	%f10,	%f16,	%f6
	edge8l	%l0,	%o6,	%g7
	orn	%l2,	%g3,	%o0
	addc	%i2,	%o7,	%i3
	smul	%l4,	0x01FC,	%l6
	edge32	%g5,	%g2,	%i5
	sub	%i7,	0x1CA1,	%l3
	edge8	%o2,	%g6,	%i1
	movg	%icc,	%l1,	%o5
	edge16	%o3,	%g4,	%i0
	orn	%i4,	%l5,	%g1
	ldsb	[%l7 + 0x26],	%i6
	ldub	[%l7 + 0x5D],	%o4
	sllx	%o1,	%l0,	%o6
	edge8	%g7,	%g3,	%o0
	movrgez	%i2,	%o7,	%l2
	movvc	%xcc,	%l4,	%i3
	sub	%g5,	%l6,	%i5
	movrgez	%i7,	%g2,	%l3
	ldsw	[%l7 + 0x10],	%g6
	movgu	%icc,	%o2,	%l1
	movrlz	%o5,	%o3,	%g4
	orcc	%i1,	0x072C,	%i0
	array8	%i4,	%g1,	%i6
	addccc	%l5,	%o1,	%o4
	sub	%o6,	%g7,	%l0
	movvs	%icc,	%g3,	%o0
	mulscc	%i2,	0x013C,	%l2
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	movcc	%xcc,	%l6,	%g5
	movvs	%xcc,	%i5,	%g2
	edge8l	%l3,	%i7,	%o2
	addc	%g6,	%l1,	%o5
	fmovdcc	%xcc,	%f1,	%f30
	lduw	[%l7 + 0x58],	%o3
	lduw	[%l7 + 0x64],	%g4
	srax	%i1,	%i4,	%i0
	edge16n	%i6,	%l5,	%g1
	popc	%o1,	%o6
	movcc	%icc,	%o4,	%l0
	sth	%g3,	[%l7 + 0x24]
	sll	%g7,	%i2,	%o0
	movn	%icc,	%l2,	%i3
	st	%f4,	[%l7 + 0x3C]
	ldsb	[%l7 + 0x79],	%l4
	movrlz	%o7,	%l6,	%i5
	for	%f16,	%f30,	%f30
	edge32ln	%g2,	%g5,	%i7
	ldub	[%l7 + 0x4D],	%o2
	mova	%xcc,	%l3,	%l1
	movl	%xcc,	%g6,	%o5
	array32	%o3,	%i1,	%g4
	movneg	%xcc,	%i0,	%i6
	subccc	%i4,	%g1,	%o1
	mulscc	%l5,	%o6,	%o4
	std	%f8,	[%l7 + 0x08]
	addcc	%l0,	%g3,	%g7
	ldub	[%l7 + 0x2A],	%i2
	addc	%o0,	0x0175,	%i3
	smul	%l2,	%l4,	%o7
	edge8l	%l6,	%i5,	%g2
	sth	%g5,	[%l7 + 0x66]
	or	%o2,	%l3,	%l1
	movne	%icc,	%i7,	%o5
	ldsb	[%l7 + 0x78],	%o3
	movn	%icc,	%i1,	%g4
	ldx	[%l7 + 0x38],	%g6
	ldx	[%l7 + 0x40],	%i6
	edge16	%i4,	%i0,	%o1
	movre	%l5,	%o6,	%g1
	fmovd	%f6,	%f12
	ldub	[%l7 + 0x2A],	%l0
	fcmps	%fcc1,	%f18,	%f21
	movg	%xcc,	%g3,	%g7
	subcc	%o4,	%i2,	%o0
	fmul8sux16	%f6,	%f12,	%f6
	movrne	%i3,	%l2,	%o7
	fmovrsne	%l4,	%f10,	%f7
	movne	%icc,	%l6,	%g2
	movrlz	%i5,	%g5,	%o2
	movgu	%icc,	%l1,	%i7
	fnegs	%f24,	%f12
	movg	%xcc,	%o5,	%o3
	fmuld8sux16	%f30,	%f7,	%f6
	orncc	%l3,	%g4,	%g6
	orn	%i1,	0x0531,	%i6
	fmul8x16al	%f6,	%f24,	%f0
	edge32	%i4,	%i0,	%o1
	ldub	[%l7 + 0x2B],	%o6
	fpsub16s	%f20,	%f20,	%f15
	std	%f4,	[%l7 + 0x68]
	movneg	%icc,	%g1,	%l0
	movge	%icc,	%g3,	%l5
	pdist	%f2,	%f24,	%f8
	or	%o4,	0x0A53,	%i2
	movrgz	%g7,	%o0,	%i3
	movre	%o7,	%l2,	%l6
	fmovdgu	%xcc,	%f0,	%f16
	fand	%f20,	%f30,	%f8
	fmovdgu	%xcc,	%f11,	%f9
	fnot2s	%f25,	%f17
	andcc	%l4,	0x1916,	%i5
	fornot2s	%f21,	%f31,	%f9
	sdivx	%g2,	0x0BE1,	%g5
	fornot1s	%f1,	%f0,	%f18
	fnegd	%f16,	%f20
	edge16	%o2,	%l1,	%o5
	sdiv	%o3,	0x06C1,	%i7
	movrgez	%g4,	0x373,	%l3
	sir	0x04B8
	fnot2s	%f22,	%f8
	ldd	[%l7 + 0x50],	%f12
	alignaddr	%g6,	%i1,	%i4
	fcmpes	%fcc2,	%f8,	%f8
	sra	%i0,	0x0A,	%o1
	srax	%o6,	0x1F,	%g1
	smulcc	%i6,	%l0,	%g3
	ldsh	[%l7 + 0x50],	%l5
	movre	%o4,	0x19D,	%i2
	udivx	%g7,	0x1505,	%i3
	fnegs	%f22,	%f4
	and	%o0,	%o7,	%l2
	sll	%l6,	0x1E,	%l4
	edge32l	%g2,	%g5,	%o2
	edge32	%i5,	%o5,	%o3
	edge16	%l1,	%i7,	%g4
	st	%f11,	[%l7 + 0x34]
	smulcc	%l3,	0x161A,	%g6
	movg	%xcc,	%i4,	%i0
	mulscc	%i1,	0x1E68,	%o1
	orcc	%g1,	0x0060,	%i6
	movrne	%l0,	0x2EE,	%g3
	sllx	%l5,	%o4,	%i2
	orn	%g7,	%o6,	%i3
	fxor	%f4,	%f6,	%f18
	edge16ln	%o0,	%o7,	%l2
	addc	%l6,	0x0F46,	%l4
	movrlz	%g2,	%g5,	%o2
	ldub	[%l7 + 0x6E],	%o5
	array8	%o3,	%i5,	%i7
	srl	%g4,	%l3,	%g6
	movcc	%icc,	%i4,	%l1
	fmul8sux16	%f2,	%f2,	%f16
	edge8ln	%i0,	%i1,	%g1
	save %o1, %l0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%l5,	%g3
	fmovscc	%icc,	%f5,	%f9
	sdivx	%o4,	0x133A,	%i2
	xor	%o6,	%g7,	%i3
	umulcc	%o0,	0x04EF,	%l2
	movcc	%icc,	%l6,	%o7
	and	%l4,	0x047C,	%g5
	movvc	%xcc,	%g2,	%o5
	edge32l	%o2,	%i5,	%o3
	fornot1	%f24,	%f16,	%f28
	edge8ln	%g4,	%i7,	%g6
	edge32l	%i4,	%l1,	%l3
	movg	%icc,	%i1,	%i0
	sethi	0x06B3,	%g1
	edge16n	%l0,	%o1,	%l5
	orncc	%i6,	%o4,	%i2
	fmovdl	%icc,	%f0,	%f15
	movpos	%xcc,	%o6,	%g7
	movne	%xcc,	%g3,	%o0
	sethi	0x13B0,	%l2
	fabsd	%f12,	%f28
	edge8n	%i3,	%l6,	%o7
	fandnot1s	%f16,	%f16,	%f2
	sdivcc	%l4,	0x0A47,	%g2
	fmuld8sux16	%f18,	%f14,	%f18
	array32	%g5,	%o2,	%i5
	subccc	%o3,	%g4,	%o5
	movrlz	%i7,	%g6,	%l1
	stw	%i4,	[%l7 + 0x50]
	xorcc	%i1,	%i0,	%l3
	sdiv	%l0,	0x0547,	%o1
	andncc	%l5,	%g1,	%i6
	ldsw	[%l7 + 0x5C],	%i2
	mulscc	%o4,	%o6,	%g3
	movpos	%xcc,	%g7,	%l2
	edge16	%o0,	%l6,	%i3
	fmovde	%icc,	%f29,	%f26
	mulscc	%l4,	0x1DFB,	%g2
	fcmpne32	%f30,	%f26,	%o7
	array8	%o2,	%g5,	%i5
	fnot2	%f30,	%f24
	fcmped	%fcc1,	%f20,	%f24
	orncc	%g4,	0x1EE7,	%o3
	xnorcc	%o5,	0x0B6A,	%i7
	mulscc	%g6,	%i4,	%i1
	fmul8sux16	%f10,	%f10,	%f4
	fpadd16	%f12,	%f4,	%f18
	sra	%i0,	%l3,	%l0
	movrgz	%o1,	0x04E,	%l5
	movre	%g1,	%l1,	%i2
	srlx	%i6,	0x05,	%o6
	ldd	[%l7 + 0x08],	%f6
	edge32	%o4,	%g7,	%g3
	movrgez	%l2,	%l6,	%o0
	fmovrsgz	%l4,	%f12,	%f12
	addc	%g2,	%o7,	%i3
	fxor	%f4,	%f30,	%f8
	nop
	set	0x6C, %g3
	ldsb	[%l7 + %g3],	%o2
	udivx	%g5,	0x0980,	%i5
	movrlz	%g4,	0x17D,	%o5
	fors	%f6,	%f17,	%f31
	lduh	[%l7 + 0x7C],	%o3
	edge16l	%g6,	%i7,	%i1
	fmovspos	%icc,	%f19,	%f12
	fcmpd	%fcc0,	%f20,	%f0
	fmovrslz	%i0,	%f6,	%f6
	fcmple16	%f24,	%f14,	%l3
	save %i4, 0x1B25, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f0
	stb	%l0,	[%l7 + 0x4A]
	movvs	%icc,	%g1,	%l1
	movge	%xcc,	%i2,	%l5
	st	%f31,	[%l7 + 0x74]
	mova	%xcc,	%i6,	%o6
	sth	%o4,	[%l7 + 0x22]
	fmovdle	%xcc,	%f24,	%f28
	fandnot2	%f22,	%f16,	%f4
	nop
	set	0x42, %o2
	stb	%g7,	[%l7 + %o2]
	movle	%icc,	%g3,	%l6
	orcc	%o0,	%l4,	%g2
	array16	%o7,	%l2,	%o2
	sdivcc	%i3,	0x1E22,	%i5
	smul	%g4,	0x1FBB,	%g5
	pdist	%f12,	%f8,	%f28
	movrlz	%o3,	%g6,	%i7
	xor	%o5,	0x0112,	%i1
	fone	%f22
	edge16ln	%l3,	%i0,	%o1
	movvs	%xcc,	%i4,	%g1
	addccc	%l1,	%l0,	%l5
	fmovrslez	%i6,	%f3,	%f0
	movvc	%icc,	%o6,	%i2
	fandnot1s	%f1,	%f26,	%f23
	movge	%icc,	%g7,	%o4
	edge32n	%g3,	%o0,	%l6
	smul	%g2,	0x1418,	%o7
	movcc	%xcc,	%l4,	%l2
	fsrc1s	%f9,	%f3
	fpack16	%f2,	%f20
	srl	%i3,	%i5,	%g4
	edge32l	%o2,	%o3,	%g5
	umul	%g6,	0x114E,	%i7
	fmovrsgez	%o5,	%f4,	%f29
	movl	%xcc,	%l3,	%i0
	fcmps	%fcc1,	%f25,	%f9
	addcc	%i1,	0x0900,	%i4
	edge16l	%o1,	%g1,	%l0
	movrlez	%l5,	0x0D0,	%i6
	mulscc	%l1,	0x1987,	%o6
	restore %i2, 0x0D7B, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g3,	%o0,	%o4
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	edge8l	%l2,	%l4,	%i5
	stb	%i3,	[%l7 + 0x62]
	srl	%g4,	%o3,	%g5
	umul	%g6,	%o2,	%i7
	pdist	%f10,	%f16,	%f10
	movre	%o5,	0x134,	%i0
	edge32n	%i1,	%l3,	%o1
	orn	%i4,	0x14BF,	%g1
	edge16ln	%l5,	%l0,	%i6
	fones	%f13
	movl	%xcc,	%l1,	%i2
	edge32l	%o6,	%g7,	%o0
	movrgez	%g3,	0x279,	%o4
	sdiv	%g2,	0x13E3,	%l6
	ldsh	[%l7 + 0x4A],	%l2
	fpack32	%f10,	%f8,	%f6
	movle	%icc,	%l4,	%o7
	orcc	%i5,	0x0096,	%i3
	edge8n	%g4,	%g5,	%g6
	fmovrslez	%o2,	%f2,	%f4
	fornot1s	%f24,	%f12,	%f8
	subcc	%o3,	0x0D7A,	%o5
	lduw	[%l7 + 0x14],	%i0
	movrgz	%i1,	%l3,	%i7
	fcmpgt16	%f16,	%f0,	%i4
	fnot1	%f8,	%f16
	edge16n	%o1,	%g1,	%l0
	sth	%i6,	[%l7 + 0x74]
	alignaddrl	%l1,	%i2,	%o6
	mova	%xcc,	%l5,	%o0
	movrne	%g3,	%g7,	%o4
	array8	%l6,	%g2,	%l2
	movne	%icc,	%o7,	%l4
	addc	%i5,	%i3,	%g5
	fmul8x16al	%f21,	%f9,	%f2
	umulcc	%g4,	0x1FE7,	%o2
	edge16ln	%o3,	%o5,	%i0
	stx	%i1,	[%l7 + 0x28]
	edge8l	%g6,	%l3,	%i4
	movgu	%xcc,	%i7,	%o1
	edge32ln	%g1,	%i6,	%l0
	edge8ln	%i2,	%l1,	%l5
	movrgz	%o6,	0x242,	%g3
	save %g7, %o0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l6,	0x0CA0,	%l2
	movge	%xcc,	%o7,	%l4
	orn	%i5,	%i3,	%g5
	fabss	%f5,	%f7
	fmovrslz	%g2,	%f29,	%f31
	ldd	[%l7 + 0x70],	%f22
	movrgz	%g4,	%o3,	%o2
	alignaddr	%i0,	%i1,	%o5
	umulcc	%g6,	0x1B9D,	%l3
	array8	%i4,	%o1,	%g1
	stx	%i6,	[%l7 + 0x10]
	edge8l	%i7,	%l0,	%l1
	fmovdn	%icc,	%f1,	%f29
	fors	%f26,	%f21,	%f10
	edge16n	%i2,	%l5,	%g3
	sdivx	%g7,	0x0192,	%o0
	sll	%o4,	%o6,	%l6
	fnegd	%f10,	%f2
	fxor	%f26,	%f0,	%f20
	fmovrdlz	%o7,	%f16,	%f30
	ldx	[%l7 + 0x28],	%l4
	fcmpes	%fcc1,	%f25,	%f3
	movre	%l2,	0x1E4,	%i5
	fnand	%f0,	%f28,	%f24
	addccc	%g5,	%i3,	%g4
	movrlz	%o3,	0x22E,	%o2
	fmovdgu	%xcc,	%f27,	%f17
	alignaddrl	%g2,	%i0,	%o5
	nop
	set	0x58, %i6
	stw	%g6,	[%l7 + %i6]
	fsrc1	%f6,	%f28
	xnor	%l3,	%i4,	%o1
	fsrc1	%f22,	%f10
	sdiv	%g1,	0x1B3A,	%i1
	addc	%i6,	0x02B1,	%l0
	sra	%l1,	%i7,	%i2
	udivx	%g3,	0x0FE4,	%l5
	move	%xcc,	%g7,	%o4
	udiv	%o6,	0x116F,	%o0
	ldd	[%l7 + 0x28],	%o6
	umulcc	%l6,	%l2,	%i5
	sllx	%l4,	%g5,	%i3
	mulx	%o3,	%g4,	%o2
	alignaddr	%g2,	%o5,	%i0
	movcc	%xcc,	%g6,	%i4
	fzero	%f28
	movn	%icc,	%l3,	%o1
	move	%icc,	%g1,	%i1
	ldsh	[%l7 + 0x34],	%i6
	edge16n	%l1,	%i7,	%i2
	srl	%g3,	0x1E,	%l5
	fnand	%f10,	%f26,	%f28
	movrgez	%g7,	%l0,	%o4
	edge16ln	%o0,	%o6,	%o7
	sdivx	%l6,	0x04BE,	%l2
	fcmpgt16	%f14,	%f24,	%l4
	andn	%g5,	%i5,	%o3
	add	%g4,	0x1A94,	%o2
	bshuffle	%f6,	%f12,	%f4
	fmovdle	%icc,	%f2,	%f3
	popc	%i3,	%g2
	smulcc	%i0,	0x1428,	%g6
	or	%i4,	%l3,	%o1
	andcc	%g1,	%i1,	%i6
	fmovdvs	%xcc,	%f25,	%f8
	fmovsn	%icc,	%f26,	%f24
	sdivx	%o5,	0x1DBE,	%l1
	fxnor	%f18,	%f6,	%f26
	movle	%xcc,	%i7,	%g3
	fmovdcc	%icc,	%f29,	%f0
	movcc	%xcc,	%i2,	%g7
	and	%l0,	0x1691,	%o4
	edge16l	%l5,	%o0,	%o7
	movl	%icc,	%l6,	%l2
	mova	%icc,	%o6,	%l4
	fsrc1	%f22,	%f2
	ldsb	[%l7 + 0x68],	%i5
	addc	%o3,	%g5,	%g4
	orn	%i3,	%o2,	%g2
	fcmps	%fcc0,	%f10,	%f20
	umul	%g6,	0x0BD3,	%i0
	srlx	%i4,	%l3,	%g1
	andncc	%i1,	%o1,	%o5
	and	%i6,	0x1FC5,	%i7
	mulscc	%l1,	0x1A3C,	%i2
	sdiv	%g3,	0x02CD,	%g7
	umul	%l0,	%o4,	%o0
	movrgz	%l5,	0x02E,	%l6
	movcs	%icc,	%o7,	%o6
	sdiv	%l2,	0x0F9F,	%i5
	nop
	set	0x40, %i0
	ldd	[%l7 + %i0],	%f16
	sra	%o3,	0x02,	%g5
	orn	%g4,	%l4,	%i3
	alignaddr	%g2,	%o2,	%g6
	edge32	%i0,	%l3,	%i4
	edge16ln	%g1,	%i1,	%o1
	edge8n	%i6,	%o5,	%l1
	addc	%i7,	0x12FF,	%g3
	movne	%icc,	%g7,	%l0
	fornot1s	%f27,	%f8,	%f3
	edge16ln	%o4,	%i2,	%l5
	ldd	[%l7 + 0x48],	%f18
	std	%f28,	[%l7 + 0x78]
	smulcc	%o0,	%l6,	%o6
	sethi	0x03DD,	%o7
	movleu	%icc,	%i5,	%l2
	mova	%icc,	%g5,	%o3
	orcc	%g4,	0x06A8,	%l4
	alignaddr	%i3,	%g2,	%o2
	movge	%xcc,	%i0,	%g6
	edge16	%i4,	%g1,	%l3
	fandnot2s	%f4,	%f14,	%f9
	edge16	%o1,	%i6,	%i1
	movleu	%icc,	%l1,	%i7
	movpos	%xcc,	%o5,	%g3
	orn	%g7,	%o4,	%l0
	subccc	%i2,	0x1FF2,	%l5
	mova	%icc,	%o0,	%o6
	std	%f10,	[%l7 + 0x40]
	lduw	[%l7 + 0x08],	%l6
	fone	%f10
	fmovdneg	%xcc,	%f18,	%f12
	movvs	%icc,	%i5,	%o7
	udiv	%l2,	0x1CEB,	%o3
	bshuffle	%f22,	%f30,	%f18
	movcs	%icc,	%g4,	%g5
	movrlz	%l4,	%g2,	%o2
	orcc	%i0,	0x0028,	%i3
	movle	%icc,	%i4,	%g1
	addccc	%g6,	0x05BB,	%o1
	movcc	%xcc,	%i6,	%i1
	edge8l	%l1,	%l3,	%i7
	fmovspos	%icc,	%f24,	%f17
	movcs	%xcc,	%g3,	%o5
	mulx	%o4,	%l0,	%i2
	movvc	%icc,	%g7,	%o0
	fmovdneg	%xcc,	%f14,	%f0
	udivcc	%o6,	0x1946,	%l6
	sub	%i5,	0x1CC2,	%o7
	movcs	%icc,	%l2,	%o3
	mulx	%g4,	%g5,	%l4
	umul	%l5,	%g2,	%i0
	movle	%xcc,	%o2,	%i4
	subcc	%g1,	0x09CD,	%i3
	sdivx	%g6,	0x1539,	%i6
	edge16	%o1,	%i1,	%l3
	fmovdn	%xcc,	%f3,	%f29
	lduw	[%l7 + 0x74],	%l1
	popc	0x1FF9,	%g3
	ldx	[%l7 + 0x08],	%o5
	array8	%i7,	%l0,	%o4
	fcmpeq32	%f28,	%f22,	%g7
	ldd	[%l7 + 0x38],	%f14
	fcmpes	%fcc3,	%f18,	%f27
	st	%f24,	[%l7 + 0x54]
	lduh	[%l7 + 0x40],	%o0
	edge16ln	%o6,	%l6,	%i2
	sdivx	%o7,	0x0450,	%l2
	fpsub16	%f14,	%f28,	%f20
	addc	%i5,	0x1057,	%o3
	restore %g5, 0x166E, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l5,	%l4,	%g2
	edge8	%i0,	%o2,	%g1
	fands	%f1,	%f31,	%f10
	addc	%i3,	0x068C,	%i4
	fpsub16	%f22,	%f18,	%f28
	mulx	%i6,	0x054B,	%o1
	xnorcc	%g6,	%i1,	%l3
	edge8ln	%l1,	%g3,	%i7
	smulcc	%l0,	%o4,	%o5
	add	%g7,	%o0,	%o6
	array32	%l6,	%o7,	%i2
	fabss	%f15,	%f22
	alignaddrl	%i5,	%o3,	%l2
	movleu	%xcc,	%g4,	%g5
	movcs	%icc,	%l4,	%l5
	fmovdl	%icc,	%f8,	%f26
	fsrc2	%f24,	%f6
	array32	%i0,	%o2,	%g2
	sir	0x05AC
	fmovsleu	%icc,	%f8,	%f3
	fmovse	%icc,	%f26,	%f14
	udiv	%i3,	0x1528,	%i4
	pdist	%f30,	%f10,	%f30
	subccc	%g1,	0x0A43,	%o1
	movg	%xcc,	%i6,	%i1
	stw	%g6,	[%l7 + 0x5C]
	movneg	%xcc,	%l1,	%g3
	fmovsneg	%icc,	%f10,	%f4
	fmovrdne	%l3,	%f10,	%f18
	fmovrdlez	%i7,	%f30,	%f22
	std	%f12,	[%l7 + 0x50]
	movle	%icc,	%l0,	%o4
	fmovrde	%g7,	%f12,	%f24
	fmovs	%f12,	%f22
	movrne	%o0,	%o6,	%l6
	alignaddrl	%o5,	%o7,	%i5
	fmovsvs	%icc,	%f11,	%f13
	edge32ln	%o3,	%i2,	%l2
	movle	%xcc,	%g4,	%l4
	pdist	%f28,	%f22,	%f16
	umul	%l5,	0x0C9E,	%i0
	ldx	[%l7 + 0x78],	%g5
	movn	%xcc,	%g2,	%o2
	edge8l	%i4,	%i3,	%o1
	fcmped	%fcc0,	%f0,	%f14
	subc	%i6,	%g1,	%i1
	movneg	%icc,	%l1,	%g6
	movpos	%xcc,	%g3,	%i7
	udiv	%l3,	0x0045,	%o4
	array16	%l0,	%o0,	%g7
	edge8ln	%o6,	%l6,	%o5
	lduh	[%l7 + 0x38],	%i5
	udiv	%o7,	0x16C5,	%i2
	lduw	[%l7 + 0x14],	%l2
	ldd	[%l7 + 0x60],	%o2
	fnot2	%f12,	%f4
	sth	%l4,	[%l7 + 0x1E]
	fmovrslez	%g4,	%f22,	%f11
	addccc	%l5,	0x012A,	%i0
	sllx	%g5,	0x0C,	%g2
	movrlz	%i4,	%o2,	%o1
	ld	[%l7 + 0x1C],	%f29
	movg	%icc,	%i3,	%i6
	ldd	[%l7 + 0x18],	%i0
	xnorcc	%g1,	0x14D3,	%g6
	sdivx	%l1,	0x055C,	%g3
	andn	%i7,	%o4,	%l3
	orncc	%o0,	%g7,	%o6
	andcc	%l0,	0x1C2B,	%o5
	array8	%l6,	%i5,	%o7
	nop
	set	0x38, %i2
	ldd	[%l7 + %i2],	%f12
	movvs	%xcc,	%i2,	%l2
	fmovdvc	%icc,	%f6,	%f10
	ld	[%l7 + 0x14],	%f30
	movvc	%icc,	%l4,	%o3
	movne	%xcc,	%l5,	%i0
	sub	%g4,	%g2,	%g5
	udivcc	%i4,	0x17ED,	%o1
	movvc	%icc,	%o2,	%i3
	nop
	set	0x0E, %i4
	sth	%i6,	[%l7 + %i4]
	fmovsl	%icc,	%f5,	%f26
	fnot2	%f22,	%f6
	lduw	[%l7 + 0x3C],	%g1
	addcc	%i1,	%l1,	%g3
	andn	%i7,	0x146F,	%g6
	array16	%l3,	%o0,	%g7
	fmovrsne	%o4,	%f27,	%f12
	movre	%l0,	0x0FB,	%o6
	ldsb	[%l7 + 0x36],	%o5
	std	%f12,	[%l7 + 0x38]
	fcmpgt16	%f28,	%f8,	%l6
	fxnors	%f30,	%f7,	%f8
	orncc	%o7,	0x053A,	%i2
	fmovrslz	%i5,	%f4,	%f19
	nop
	set	0x70, %g1
	std	%f8,	[%l7 + %g1]
	fcmpeq32	%f28,	%f20,	%l2
	move	%xcc,	%l4,	%o3
	smul	%l5,	0x1CCA,	%i0
	movcc	%xcc,	%g2,	%g4
	fcmple16	%f16,	%f28,	%g5
	edge32ln	%i4,	%o1,	%i3
	fmovdvs	%icc,	%f23,	%f9
	fmovs	%f3,	%f21
	edge32n	%o2,	%g1,	%i6
	mulx	%i1,	0x0540,	%l1
	movne	%xcc,	%i7,	%g3
	movcc	%xcc,	%g6,	%l3
	fands	%f12,	%f24,	%f6
	subccc	%g7,	0x18E6,	%o0
	srax	%o4,	0x07,	%o6
	edge16	%o5,	%l6,	%l0
	popc	0x0B72,	%i2
	ldd	[%l7 + 0x20],	%f24
	andn	%i5,	%l2,	%l4
	edge16l	%o3,	%o7,	%i0
	ldsw	[%l7 + 0x44],	%l5
	movn	%icc,	%g2,	%g5
	smul	%i4,	%g4,	%o1
	smulcc	%o2,	0x013C,	%i3
	movge	%xcc,	%g1,	%i1
	subccc	%l1,	%i6,	%i7
	udivx	%g3,	0x042A,	%l3
	ldsh	[%l7 + 0x40],	%g6
	fpack32	%f22,	%f14,	%f26
	movrlz	%g7,	0x18E,	%o4
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	movneg	%icc,	%o5,	%i2
	xor	%l0,	0x09F4,	%i5
	movpos	%xcc,	%l4,	%l2
	movrne	%o3,	0x1F8,	%o7
	st	%f21,	[%l7 + 0x0C]
	edge32ln	%l5,	%g2,	%g5
	movvs	%xcc,	%i0,	%i4
	movre	%g4,	%o1,	%i3
	movn	%xcc,	%o2,	%i1
	movleu	%icc,	%g1,	%i6
	move	%icc,	%l1,	%i7
	fmovsleu	%xcc,	%f25,	%f5
	fpmerge	%f9,	%f30,	%f0
	fornot1	%f30,	%f16,	%f0
	fmovrdlez	%l3,	%f0,	%f4
	alignaddrl	%g3,	%g7,	%g6
	fmovscc	%xcc,	%f0,	%f31
	movgu	%xcc,	%o4,	%o0
	srax	%o6,	%l6,	%o5
	fxnor	%f14,	%f26,	%f20
	mova	%xcc,	%i2,	%i5
	and	%l0,	0x09F3,	%l2
	fcmps	%fcc1,	%f0,	%f20
	sdivcc	%l4,	0x1D75,	%o3
	edge32n	%o7,	%l5,	%g2
	edge8l	%i0,	%i4,	%g4
	edge16l	%g5,	%o1,	%o2
	fxor	%f24,	%f0,	%f22
	orcc	%i3,	%i1,	%g1
	lduh	[%l7 + 0x4C],	%i6
	fcmpeq16	%f30,	%f20,	%l1
	ldub	[%l7 + 0x4D],	%l3
	fmovrde	%i7,	%f24,	%f12
	mulscc	%g3,	%g6,	%g7
	orncc	%o0,	0x115B,	%o6
	movrgez	%l6,	%o4,	%o5
	xor	%i2,	0x1181,	%l0
	fnot2s	%f9,	%f19
	pdist	%f20,	%f16,	%f22
	udivx	%l2,	0x1FFE,	%i5
	edge16	%l4,	%o7,	%o3
	srl	%l5,	0x19,	%g2
	movleu	%xcc,	%i0,	%i4
	lduh	[%l7 + 0x60],	%g4
	array8	%g5,	%o2,	%i3
	bshuffle	%f22,	%f10,	%f8
	addccc	%o1,	%i1,	%i6
	umul	%g1,	%l1,	%l3
	fpadd16	%f12,	%f12,	%f20
	fornot1s	%f19,	%f20,	%f21
	edge16n	%g3,	%i7,	%g6
	array16	%o0,	%g7,	%l6
	fxors	%f10,	%f24,	%f22
	udivx	%o4,	0x0AF0,	%o5
	edge16ln	%i2,	%o6,	%l0
	edge32	%i5,	%l4,	%o7
	fmul8x16au	%f30,	%f21,	%f8
	alignaddrl	%l2,	%o3,	%l5
	array8	%i0,	%g2,	%i4
	fmovdleu	%xcc,	%f22,	%f26
	movpos	%icc,	%g5,	%o2
	stb	%g4,	[%l7 + 0x6D]
	fcmpeq32	%f6,	%f26,	%i3
	fmovsge	%xcc,	%f30,	%f7
	sdivx	%i1,	0x1AF4,	%i6
	movpos	%icc,	%o1,	%g1
	and	%l3,	%g3,	%l1
	mulx	%i7,	0x0EA2,	%g6
	mova	%xcc,	%g7,	%l6
	sllx	%o4,	0x1D,	%o5
	array8	%i2,	%o0,	%o6
	smul	%l0,	%l4,	%o7
	fmul8ulx16	%f8,	%f4,	%f4
	srl	%l2,	0x0E,	%o3
	ldd	[%l7 + 0x70],	%f6
	alignaddrl	%i5,	%l5,	%g2
	fcmpne32	%f0,	%f0,	%i0
	fmovrdgz	%i4,	%f4,	%f26
	fones	%f16
	sethi	0x1250,	%g5
	orncc	%g4,	%i3,	%i1
	edge32l	%i6,	%o1,	%g1
	addcc	%o2,	0x0192,	%l3
	popc	0x1777,	%l1
	fcmple16	%f16,	%f22,	%i7
	movrlz	%g3,	0x030,	%g6
	edge16l	%g7,	%o4,	%l6
	fmovrdgz	%i2,	%f28,	%f12
	sra	%o5,	0x01,	%o0
	ldd	[%l7 + 0x30],	%l0
	addccc	%l4,	%o7,	%o6
	addc	%o3,	%i5,	%l5
	mulx	%l2,	0x1A6F,	%i0
	xnorcc	%i4,	0x00AA,	%g5
	fcmpne16	%f28,	%f16,	%g4
	fmuld8sux16	%f7,	%f14,	%f30
	nop
	set	0x08, %o3
	ldx	[%l7 + %o3],	%g2
	smulcc	%i1,	0x04F6,	%i6
	array16	%o1,	%g1,	%i3
	movrgez	%l3,	%l1,	%i7
	fornot2	%f8,	%f6,	%f28
	fmovdpos	%icc,	%f19,	%f14
	fandnot1s	%f28,	%f8,	%f27
	fpsub16	%f22,	%f4,	%f26
	alignaddrl	%g3,	%o2,	%g7
	edge16	%g6,	%l6,	%i2
	fmovrslz	%o5,	%f16,	%f19
	std	%f24,	[%l7 + 0x60]
	fxors	%f10,	%f25,	%f13
	orncc	%o4,	%l0,	%l4
	orcc	%o7,	0x16F4,	%o6
	fmovsl	%xcc,	%f16,	%f21
	movrgz	%o0,	%i5,	%l5
	fcmpd	%fcc1,	%f30,	%f24
	movn	%icc,	%l2,	%o3
	addccc	%i0,	0x12FB,	%i4
	mulx	%g5,	%g2,	%g4
	and	%i6,	%o1,	%g1
	add	%i1,	%i3,	%l3
	fsrc2	%f0,	%f24
	udiv	%l1,	0x10A1,	%i7
	movvc	%xcc,	%g3,	%o2
	sra	%g7,	0x11,	%l6
	fmovsvs	%icc,	%f26,	%f12
	umulcc	%g6,	0x086D,	%i2
	stw	%o5,	[%l7 + 0x40]
	movle	%icc,	%o4,	%l4
	srax	%o7,	%o6,	%o0
	addc	%l0,	0x1973,	%l5
	stx	%l2,	[%l7 + 0x60]
	edge32	%i5,	%o3,	%i4
	fnot2	%f28,	%f28
	fmovrde	%i0,	%f20,	%f8
	edge16	%g2,	%g5,	%g4
	movleu	%xcc,	%i6,	%o1
	movneg	%icc,	%i1,	%i3
	fpsub32	%f12,	%f14,	%f6
	xnor	%l3,	%l1,	%i7
	movrlz	%g3,	%g1,	%o2
	siam	0x2
	fmovrsne	%g7,	%f2,	%f10
	fcmpgt32	%f12,	%f8,	%l6
	fpadd16s	%f22,	%f14,	%f11
	fmovrde	%i2,	%f4,	%f26
	movvc	%icc,	%g6,	%o5
	movrgz	%l4,	0x12D,	%o7
	addcc	%o6,	%o0,	%o4
	fornot2	%f20,	%f26,	%f8
	or	%l0,	0x088A,	%l5
	fmovdcc	%xcc,	%f12,	%f29
	fmul8ulx16	%f2,	%f26,	%f20
	movcc	%icc,	%l2,	%i5
	andcc	%i4,	%o3,	%g2
	orcc	%i0,	0x077B,	%g4
	orncc	%g5,	0x0FC5,	%i6
	bshuffle	%f14,	%f6,	%f14
	fmul8x16au	%f21,	%f5,	%f2
	ldsh	[%l7 + 0x50],	%o1
	subcc	%i3,	0x16D6,	%i1
	edge8n	%l3,	%l1,	%g3
	array8	%g1,	%o2,	%i7
	fmovdneg	%xcc,	%f1,	%f10
	mulx	%l6,	0x0379,	%i2
	nop
	set	0x0A, %o5
	ldsh	[%l7 + %o5],	%g6
	movrgez	%o5,	%l4,	%g7
	orcc	%o6,	0x0E23,	%o0
	fmuld8sux16	%f14,	%f8,	%f18
	fmul8x16al	%f6,	%f30,	%f20
	lduw	[%l7 + 0x54],	%o7
	fmovrdlz	%l0,	%f8,	%f12
	sdiv	%o4,	0x0156,	%l5
	and	%i5,	0x0F69,	%i4
	lduw	[%l7 + 0x24],	%l2
	st	%f25,	[%l7 + 0x44]
	fmovse	%xcc,	%f27,	%f26
	edge32n	%o3,	%i0,	%g2
	fabsd	%f6,	%f26
	movleu	%icc,	%g4,	%i6
	movcc	%icc,	%g5,	%i3
	ldub	[%l7 + 0x48],	%o1
	ld	[%l7 + 0x64],	%f22
	movl	%icc,	%l3,	%l1
	or	%g3,	%g1,	%o2
	mulscc	%i7,	%i1,	%i2
	stx	%g6,	[%l7 + 0x48]
	fmul8x16au	%f29,	%f1,	%f8
	movrlz	%o5,	0x300,	%l4
	smul	%l6,	0x0B61,	%o6
	sethi	0x0E9D,	%g7
	fpack16	%f28,	%f2
	movvc	%icc,	%o0,	%o7
	movgu	%xcc,	%o4,	%l5
	edge8ln	%i5,	%i4,	%l2
	fpsub32	%f8,	%f4,	%f6
	sll	%l0,	%o3,	%i0
	movcc	%xcc,	%g2,	%g4
	fnot2	%f16,	%f4
	sth	%i6,	[%l7 + 0x1E]
	udivx	%g5,	0x0C7A,	%i3
	nop
	set	0x54, %g2
	stw	%l3,	[%l7 + %g2]
	lduh	[%l7 + 0x50],	%o1
	stw	%g3,	[%l7 + 0x70]
	addccc	%g1,	0x04AF,	%o2
	mulscc	%i7,	%i1,	%i2
	alignaddr	%l1,	%g6,	%l4
	fxors	%f6,	%f18,	%f23
	fmuld8ulx16	%f21,	%f15,	%f24
	fzeros	%f24
	fmuld8ulx16	%f26,	%f13,	%f4
	movcc	%icc,	%o5,	%o6
	movneg	%xcc,	%g7,	%o0
	movrlz	%o7,	0x3AB,	%l6
	andn	%o4,	%l5,	%i5
	andn	%i4,	%l2,	%o3
	edge16l	%l0,	%i0,	%g4
	sdivcc	%g2,	0x1646,	%i6
	pdist	%f28,	%f30,	%f18
	and	%i3,	%l3,	%o1
	andcc	%g3,	%g5,	%o2
	movneg	%xcc,	%g1,	%i7
	lduw	[%l7 + 0x34],	%i1
	sdivcc	%i2,	0x1050,	%l1
	pdist	%f4,	%f14,	%f30
	andn	%g6,	0x1BD9,	%l4
	fone	%f6
	movl	%xcc,	%o5,	%g7
	xorcc	%o6,	%o0,	%o7
	ldsb	[%l7 + 0x1B],	%o4
	smulcc	%l5,	0x154A,	%i5
	ldx	[%l7 + 0x68],	%i4
	movge	%xcc,	%l2,	%o3
	fmovdle	%icc,	%f0,	%f11
	xorcc	%l0,	0x1028,	%l6
	mulx	%i0,	0x08F3,	%g4
	movcc	%icc,	%i6,	%g2
	edge32l	%l3,	%o1,	%i3
	sth	%g3,	[%l7 + 0x26]
	add	%g5,	0x1521,	%g1
	smulcc	%i7,	0x09B3,	%o2
	sll	%i2,	0x0F,	%l1
	movn	%icc,	%i1,	%g6
	fpadd16s	%f30,	%f13,	%f0
	sra	%l4,	0x17,	%o5
	sth	%g7,	[%l7 + 0x5E]
	movneg	%xcc,	%o0,	%o6
	edge16	%o4,	%l5,	%o7
	fmovdle	%xcc,	%f20,	%f18
	ldd	[%l7 + 0x08],	%i4
	umul	%i4,	0x0824,	%o3
	edge32	%l2,	%l6,	%l0
	array32	%g4,	%i0,	%i6
	ldsb	[%l7 + 0x7A],	%l3
	fones	%f3
	subccc	%o1,	%g2,	%i3
	movg	%icc,	%g5,	%g1
	movrne	%g3,	%o2,	%i7
	fmovrdlez	%i2,	%f0,	%f22
	smulcc	%i1,	0x1854,	%g6
	movge	%xcc,	%l4,	%l1
	xnorcc	%g7,	0x0CFB,	%o0
	array32	%o5,	%o4,	%o6
	edge8l	%l5,	%i5,	%o7
	sethi	0x031D,	%i4
	ldd	[%l7 + 0x08],	%f6
	st	%f2,	[%l7 + 0x78]
	movg	%xcc,	%o3,	%l6
	fmul8x16al	%f28,	%f3,	%f28
	edge8l	%l0,	%l2,	%i0
	movgu	%xcc,	%g4,	%i6
	movg	%xcc,	%l3,	%g2
	array32	%o1,	%i3,	%g1
	ldub	[%l7 + 0x44],	%g3
	movle	%xcc,	%g5,	%i7
	xor	%i2,	%o2,	%i1
	and	%l4,	%g6,	%g7
	ldub	[%l7 + 0x47],	%o0
	movvs	%icc,	%l1,	%o5
	xor	%o4,	0x1605,	%o6
	movrgz	%i5,	%l5,	%i4
	xor	%o3,	0x1F07,	%l6
	fmovsa	%xcc,	%f27,	%f1
	fzeros	%f22
	sethi	0x0B85,	%l0
	udivcc	%o7,	0x1716,	%l2
	udivx	%g4,	0x01E0,	%i0
	mulscc	%l3,	%g2,	%i6
	array16	%o1,	%g1,	%i3
	fmovrdgez	%g3,	%f2,	%f28
	fones	%f29
	fmovde	%xcc,	%f31,	%f31
	fmuld8ulx16	%f14,	%f23,	%f0
	xor	%i7,	0x11F1,	%i2
	movneg	%xcc,	%g5,	%o2
	fmovscc	%xcc,	%f5,	%f26
	ldsh	[%l7 + 0x2A],	%l4
	fpackfix	%f4,	%f31
	ldsw	[%l7 + 0x50],	%i1
	movvs	%icc,	%g6,	%g7
	alignaddr	%o0,	%o5,	%l1
	fpsub32s	%f2,	%f18,	%f13
	mulscc	%o6,	%o4,	%l5
	mulscc	%i5,	%i4,	%o3
	st	%f4,	[%l7 + 0x7C]
	ldub	[%l7 + 0x4C],	%l0
	movvc	%icc,	%l6,	%o7
	sir	0x1587
	nop
	set	0x28, %l6
	sth	%l2,	[%l7 + %l6]
	movne	%icc,	%i0,	%l3
	edge32	%g2,	%i6,	%g4
	fmovdcs	%icc,	%f15,	%f14
	fpmerge	%f25,	%f11,	%f30
	sethi	0x0A6E,	%g1
	add	%i3,	%g3,	%o1
	fornot1	%f18,	%f24,	%f8
	edge16ln	%i2,	%g5,	%o2
	movle	%icc,	%l4,	%i7
	srax	%i1,	0x1C,	%g6
	orn	%o0,	%o5,	%g7
	sll	%l1,	%o6,	%l5
	edge32l	%o4,	%i5,	%o3
	movcs	%xcc,	%l0,	%l6
	ldsb	[%l7 + 0x6C],	%i4
	movle	%xcc,	%o7,	%i0
	mulx	%l3,	0x176A,	%l2
	umulcc	%g2,	%g4,	%g1
	fmovdne	%xcc,	%f14,	%f4
	movrlez	%i3,	0x2D2,	%g3
	movrlez	%i6,	%o1,	%g5
	fmovrslez	%i2,	%f4,	%f20
	ldsh	[%l7 + 0x18],	%l4
	movn	%icc,	%o2,	%i1
	movre	%g6,	%o0,	%i7
	edge32l	%o5,	%g7,	%o6
	movrlez	%l5,	%l1,	%o4
	xor	%o3,	%l0,	%i5
	subcc	%l6,	%i4,	%o7
	movg	%xcc,	%l3,	%i0
	restore %g2, %g4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l2,	%i3
	movne	%icc,	%i6,	%g3
	array8	%o1,	%i2,	%l4
	fsrc1s	%f16,	%f6
	fmovsneg	%xcc,	%f6,	%f1
	andn	%g5,	%o2,	%i1
	movle	%xcc,	%o0,	%i7
	movrlz	%o5,	%g7,	%o6
	movrgz	%l5,	%l1,	%o4
	orncc	%o3,	0x168F,	%l0
	nop
	set	0x18, %l0
	ldsw	[%l7 + %l0],	%i5
	movrlz	%l6,	0x237,	%i4
	mulscc	%o7,	%l3,	%i0
	movl	%icc,	%g2,	%g6
	array8	%g4,	%l2,	%g1
	stb	%i3,	[%l7 + 0x75]
	fcmpne16	%f10,	%f30,	%g3
	fcmpne32	%f28,	%f20,	%o1
	edge32l	%i6,	%i2,	%g5
	edge16ln	%l4,	%i1,	%o0
	stw	%i7,	[%l7 + 0x74]
	add	%o2,	0x0E8F,	%g7
	save %o5, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o6,	%f20,	%f20
	movgu	%icc,	%o3,	%o4
	movneg	%icc,	%l0,	%l6
	fmuld8sux16	%f17,	%f13,	%f20
	movvs	%xcc,	%i4,	%o7
	xor	%l3,	%i0,	%i5
	fmovdgu	%icc,	%f4,	%f20
	ldsh	[%l7 + 0x4C],	%g6
	alignaddr	%g4,	%l2,	%g2
	umulcc	%i3,	0x0FFF,	%g1
	movrne	%o1,	0x10A,	%i6
	movrlz	%g3,	%g5,	%l4
	umul	%i2,	0x04E2,	%i1
	fsrc2s	%f6,	%f4
	ldub	[%l7 + 0x32],	%o0
	mulscc	%o2,	0x0F70,	%g7
	array16	%o5,	%l5,	%i7
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	subcc	%o3,	0x1F2F,	%o4
	movrlez	%l0,	0x2CD,	%i4
	fmovsleu	%xcc,	%f8,	%f11
	save %o7, 0x070A, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f31,	%f25
	restore %i0, %i5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l3,	[%l7 + 0x10]
	xnorcc	%g4,	%l2,	%i3
	edge32l	%g2,	%o1,	%i6
	sra	%g3,	0x0B,	%g1
	movcc	%icc,	%g5,	%l4
	srlx	%i1,	%i2,	%o0
	srlx	%g7,	0x16,	%o5
	movvs	%xcc,	%l5,	%i7
	sdivx	%l1,	0x0C33,	%o2
	edge32n	%o6,	%o4,	%l0
	movcs	%xcc,	%o3,	%o7
	sdivcc	%l6,	0x02A8,	%i4
	nop
	set	0x14, %i1
	ldsb	[%l7 + %i1],	%i0
	ldx	[%l7 + 0x60],	%i5
	movre	%g6,	0x330,	%g4
	st	%f15,	[%l7 + 0x40]
	mulscc	%l3,	0x0AED,	%i3
	movrlz	%l2,	0x006,	%g2
	xnorcc	%o1,	0x09BB,	%i6
	fcmpd	%fcc0,	%f30,	%f26
	alignaddrl	%g1,	%g3,	%l4
	sra	%i1,	0x05,	%g5
	xor	%i2,	%g7,	%o5
	fmovdn	%icc,	%f18,	%f18
	mova	%icc,	%l5,	%o0
	sll	%i7,	0x15,	%o2
	fpadd32	%f6,	%f28,	%f2
	movl	%icc,	%o6,	%l1
	andncc	%o4,	%l0,	%o7
	andcc	%l6,	0x1FE4,	%i4
	andcc	%o3,	0x1932,	%i0
	fabss	%f28,	%f7
	movrlz	%i5,	%g6,	%l3
	movl	%xcc,	%i3,	%l2
	subcc	%g4,	%o1,	%g2
	movpos	%xcc,	%g1,	%i6
	subc	%g3,	0x0CF8,	%i1
	umul	%g5,	0x0A6D,	%i2
	ld	[%l7 + 0x1C],	%f30
	srl	%l4,	%o5,	%g7
	movne	%xcc,	%o0,	%i7
	sll	%l5,	%o6,	%o2
	fpadd32s	%f14,	%f14,	%f5
	orncc	%l1,	%l0,	%o4
	addcc	%o7,	%i4,	%l6
	edge32	%o3,	%i0,	%g6
	edge16ln	%l3,	%i3,	%i5
	umulcc	%l2,	%g4,	%o1
	sra	%g2,	%i6,	%g1
	std	%f20,	[%l7 + 0x68]
	movge	%xcc,	%i1,	%g5
	fmovrse	%i2,	%f29,	%f20
	fnot1s	%f0,	%f19
	edge32l	%l4,	%g3,	%g7
	ldd	[%l7 + 0x30],	%f22
	fxnors	%f15,	%f26,	%f1
	edge16	%o5,	%o0,	%l5
	movpos	%xcc,	%o6,	%i7
	fandnot1s	%f8,	%f3,	%f15
	alignaddrl	%o2,	%l0,	%l1
	movleu	%icc,	%o4,	%o7
	movle	%xcc,	%l6,	%i4
	std	%f16,	[%l7 + 0x28]
	edge8ln	%i0,	%g6,	%o3
	fmovdcs	%xcc,	%f11,	%f23
	ldx	[%l7 + 0x70],	%l3
	or	%i3,	0x0826,	%i5
	sub	%l2,	%g4,	%g2
	movvc	%icc,	%o1,	%i6
	smul	%i1,	0x13ED,	%g1
	edge8l	%g5,	%l4,	%i2
	fnegs	%f4,	%f4
	fmovdg	%xcc,	%f5,	%f18
	fmovsn	%icc,	%f28,	%f4
	edge16n	%g3,	%g7,	%o5
	alignaddr	%l5,	%o6,	%i7
	lduw	[%l7 + 0x58],	%o0
	ldsh	[%l7 + 0x48],	%o2
	fpsub32s	%f14,	%f10,	%f31
	sra	%l0,	0x1A,	%l1
	lduh	[%l7 + 0x20],	%o7
	fmovdle	%xcc,	%f31,	%f20
	fpackfix	%f30,	%f17
	umul	%l6,	0x0AD2,	%o4
	srlx	%i0,	0x03,	%i4
	array8	%g6,	%l3,	%i3
	movneg	%icc,	%i5,	%l2
	edge16n	%g4,	%o3,	%o1
	sdivx	%g2,	0x1646,	%i6
	stb	%g1,	[%l7 + 0x49]
	array8	%g5,	%l4,	%i2
	fors	%f12,	%f4,	%f7
	fmovdl	%icc,	%f8,	%f8
	alignaddrl	%i1,	%g7,	%g3
	sub	%o5,	%o6,	%i7
	mulscc	%l5,	0x1217,	%o0
	andn	%l0,	%l1,	%o7
	for	%f16,	%f10,	%f4
	edge16n	%l6,	%o4,	%i0
	alignaddrl	%i4,	%g6,	%o2
	fpadd32	%f24,	%f10,	%f22
	fcmpeq32	%f12,	%f24,	%l3
	fmuld8sux16	%f9,	%f1,	%f26
	fmovdleu	%xcc,	%f14,	%f9
	stw	%i5,	[%l7 + 0x40]
	stw	%l2,	[%l7 + 0x54]
	fandnot1s	%f7,	%f1,	%f7
	edge32l	%g4,	%i3,	%o1
	movvc	%icc,	%g2,	%o3
	edge16l	%g1,	%i6,	%g5
	fcmpgt32	%f10,	%f24,	%l4
	save %i2, 0x0F04, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f10,	%f0
	movleu	%icc,	%g7,	%g3
	subcc	%o5,	%i7,	%l5
	edge8n	%o0,	%l0,	%l1
	move	%icc,	%o7,	%o6
	ldx	[%l7 + 0x40],	%o4
	fmovda	%icc,	%f31,	%f0
	addc	%i0,	%i4,	%g6
	std	%f6,	[%l7 + 0x50]
	array8	%l6,	%l3,	%i5
	array8	%o2,	%g4,	%i3
	edge16n	%o1,	%g2,	%l2
	sth	%o3,	[%l7 + 0x60]
	sdivx	%i6,	0x132F,	%g5
	ldsh	[%l7 + 0x1C],	%g1
	movre	%l4,	0x2F0,	%i1
	fpadd32	%f16,	%f24,	%f18
	sllx	%g7,	0x03,	%i2
	fmovsgu	%xcc,	%f23,	%f15
	movl	%xcc,	%g3,	%o5
	srax	%l5,	%i7,	%l0
	fmovsle	%icc,	%f20,	%f23
	movcs	%xcc,	%o0,	%o7
	fnor	%f0,	%f12,	%f2
	movge	%xcc,	%o6,	%l1
	fone	%f22
	fmovdvc	%xcc,	%f18,	%f7
	umul	%o4,	0x1C75,	%i4
	fcmpne32	%f12,	%f24,	%g6
	smulcc	%l6,	%l3,	%i0
	sll	%i5,	0x07,	%g4
	xor	%i3,	0x0C8A,	%o1
	mulx	%o2,	0x0B28,	%l2
	movg	%xcc,	%g2,	%o3
	fsrc1s	%f27,	%f30
	movrlez	%i6,	0x3A5,	%g5
	popc	%l4,	%i1
	xorcc	%g1,	0x11C6,	%g7
	subcc	%i2,	%g3,	%l5
	srax	%o5,	%l0,	%o0
	addccc	%o7,	0x0AC9,	%o6
	smulcc	%i7,	0x03B8,	%l1
	fmovrslz	%o4,	%f8,	%f31
	save %g6, 0x0377, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l3,	0x058D,	%i0
	ldd	[%l7 + 0x28],	%f0
	movg	%xcc,	%l6,	%i5
	movrlez	%i3,	%g4,	%o2
	mulscc	%o1,	%g2,	%o3
	orncc	%i6,	0x01C3,	%g5
	fmovrsne	%l2,	%f25,	%f12
	fmovspos	%xcc,	%f19,	%f0
	fmovdvs	%xcc,	%f18,	%f4
	popc	0x047C,	%i1
	and	%g1,	0x0DB2,	%g7
	addcc	%i2,	%l4,	%g3
	fmovsneg	%xcc,	%f5,	%f7
	andn	%o5,	0x0DF2,	%l5
	mova	%xcc,	%o0,	%l0
	xnor	%o6,	0x0D9E,	%i7
	fpsub32	%f10,	%f20,	%f20
	movrgez	%o7,	%o4,	%l1
	subc	%i4,	0x0D9C,	%g6
	nop
	set	0x67, %l4
	ldub	[%l7 + %l4],	%l3
	addcc	%l6,	%i5,	%i3
	fmovsvs	%xcc,	%f16,	%f20
	fmuld8ulx16	%f29,	%f27,	%f28
	movne	%icc,	%g4,	%i0
	lduw	[%l7 + 0x28],	%o2
	orcc	%g2,	0x1C94,	%o1
	alignaddr	%o3,	%i6,	%g5
	st	%f19,	[%l7 + 0x38]
	sdivx	%l2,	0x1062,	%i1
	stb	%g7,	[%l7 + 0x64]
	move	%icc,	%g1,	%i2
	array16	%l4,	%g3,	%o5
	fmovdge	%xcc,	%f1,	%f8
	sub	%l5,	%o0,	%l0
	umul	%i7,	%o7,	%o4
	fornot1	%f2,	%f6,	%f0
	array16	%o6,	%l1,	%i4
	ld	[%l7 + 0x74],	%f15
	movle	%icc,	%l3,	%g6
	edge8n	%i5,	%i3,	%l6
	srlx	%g4,	0x1E,	%i0
	std	%f18,	[%l7 + 0x70]
	orcc	%o2,	%g2,	%o3
	subccc	%i6,	%g5,	%o1
	edge8ln	%l2,	%i1,	%g7
	edge16l	%i2,	%g1,	%l4
	movneg	%icc,	%o5,	%g3
	edge8n	%l5,	%l0,	%i7
	movrgz	%o0,	%o7,	%o6
	stw	%l1,	[%l7 + 0x0C]
	array32	%i4,	%l3,	%g6
	orncc	%i5,	0x08A9,	%i3
	movvs	%icc,	%l6,	%g4
	edge16n	%o4,	%i0,	%o2
	ldsh	[%l7 + 0x0C],	%g2
	movrgez	%o3,	0x0F0,	%g5
	lduw	[%l7 + 0x2C],	%i6
	fpadd16	%f4,	%f28,	%f24
	movge	%xcc,	%l2,	%i1
	sth	%g7,	[%l7 + 0x4C]
	edge32n	%i2,	%g1,	%o1
	fpsub32s	%f1,	%f29,	%f14
	alignaddrl	%o5,	%l4,	%l5
	movvs	%icc,	%g3,	%i7
	addccc	%o0,	%o7,	%o6
	lduw	[%l7 + 0x30],	%l1
	fnot2	%f6,	%f18
	movle	%icc,	%l0,	%l3
	sllx	%g6,	0x0D,	%i4
	stw	%i5,	[%l7 + 0x2C]
	fxor	%f26,	%f24,	%f28
	add	%l6,	%g4,	%o4
	siam	0x2
	sub	%i3,	0x0068,	%i0
	smulcc	%g2,	0x0B4D,	%o2
	sub	%o3,	%i6,	%l2
	array16	%g5,	%g7,	%i2
	fors	%f10,	%f16,	%f18
	subc	%i1,	%o1,	%o5
	fmovsleu	%xcc,	%f14,	%f1
	movre	%g1,	%l5,	%l4
	fsrc2s	%f16,	%f10
	movre	%i7,	0x26C,	%g3
	movgu	%xcc,	%o0,	%o6
	alignaddr	%l1,	%l0,	%l3
	edge32n	%o7,	%g6,	%i4
	fmul8x16	%f20,	%f8,	%f16
	save %l6, 0x0BA6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o4,	%g4,	%i0
	movle	%xcc,	%g2,	%i3
	movrlz	%o2,	0x29F,	%i6
	edge8ln	%o3,	%l2,	%g7
	movrgz	%i2,	%i1,	%o1
	edge8	%g5,	%g1,	%o5
	fmovdne	%xcc,	%f0,	%f10
	movrlez	%l4,	%l5,	%i7
	edge32n	%g3,	%o0,	%o6
	ldd	[%l7 + 0x78],	%f14
	movneg	%xcc,	%l1,	%l3
	xnorcc	%o7,	%g6,	%i4
	movrne	%l0,	0x3AD,	%i5
	movcc	%xcc,	%l6,	%g4
	fmovsa	%xcc,	%f23,	%f24
	st	%f2,	[%l7 + 0x0C]
	udivcc	%i0,	0x1893,	%g2
	udivcc	%o4,	0x1FB3,	%o2
	array16	%i6,	%o3,	%i3
	sdiv	%l2,	0x0D1D,	%i2
	udivx	%i1,	0x1505,	%g7
	movrlz	%o1,	%g5,	%g1
	edge16	%l4,	%l5,	%i7
	fpmerge	%f25,	%f19,	%f14
	fmovrdgz	%o5,	%f14,	%f30
	lduh	[%l7 + 0x72],	%o0
	edge8ln	%o6,	%g3,	%l1
	stw	%o7,	[%l7 + 0x64]
	umulcc	%l3,	0x0DDE,	%g6
	sdivx	%i4,	0x0276,	%l0
	fcmple16	%f6,	%f22,	%l6
	movrne	%g4,	%i0,	%i5
	ldx	[%l7 + 0x78],	%o4
	alignaddrl	%o2,	%i6,	%g2
	edge16	%i3,	%l2,	%i2
	addcc	%i1,	%g7,	%o3
	movpos	%xcc,	%o1,	%g1
	stw	%g5,	[%l7 + 0x24]
	srlx	%l5,	0x04,	%i7
	edge8	%o5,	%l4,	%o6
	movvs	%icc,	%g3,	%l1
	ldsb	[%l7 + 0x56],	%o7
	array16	%o0,	%g6,	%l3
	fmovdgu	%icc,	%f23,	%f31
	edge32l	%l0,	%i4,	%g4
	fmovdl	%icc,	%f16,	%f16
	udiv	%i0,	0x0CE9,	%i5
	edge32n	%l6,	%o2,	%o4
	movrgez	%g2,	0x0A8,	%i6
	ldd	[%l7 + 0x40],	%l2
	smulcc	%i2,	%i1,	%g7
	movrgez	%o3,	0x098,	%o1
	mova	%xcc,	%g1,	%i3
	subcc	%g5,	%i7,	%o5
	andcc	%l4,	%o6,	%g3
	addc	%l1,	0x14C1,	%l5
	sdivx	%o7,	0x0E3E,	%g6
	udiv	%l3,	0x0566,	%o0
	std	%f24,	[%l7 + 0x40]
	fornot1	%f0,	%f4,	%f14
	ldsw	[%l7 + 0x6C],	%i4
	stx	%l0,	[%l7 + 0x78]
	sethi	0x0EAE,	%i0
	and	%g4,	%l6,	%i5
	sdiv	%o2,	0x0748,	%o4
	lduh	[%l7 + 0x60],	%g2
	fmovd	%f22,	%f8
	sra	%i6,	%l2,	%i2
	smulcc	%g7,	%i1,	%o1
	fnot2s	%f7,	%f16
	edge8	%o3,	%i3,	%g5
	movgu	%icc,	%i7,	%g1
	ldx	[%l7 + 0x08],	%o5
	edge32l	%o6,	%g3,	%l4
	orn	%l1,	0x11E3,	%o7
	fmovrdgez	%g6,	%f2,	%f14
	umul	%l5,	0x0F07,	%l3
	edge16	%i4,	%l0,	%o0
	sdiv	%g4,	0x14CB,	%l6
	ldsb	[%l7 + 0x58],	%i0
	save %o2, 0x153E, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f20,	%f28,	%o4
	mulx	%g2,	0x15BF,	%l2
	lduh	[%l7 + 0x56],	%i6
	edge32ln	%i2,	%g7,	%i1
	subccc	%o3,	0x04BF,	%i3
	subc	%g5,	%o1,	%g1
	save %o5, 0x1998, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%o6
	edge8ln	%l4,	%l1,	%o7
	array16	%g6,	%l5,	%l3
	array8	%i4,	%g3,	%l0
	edge32l	%g4,	%o0,	%l6
	ld	[%l7 + 0x48],	%f9
	orncc	%i0,	0x1DBB,	%i5
	movge	%xcc,	%o2,	%o4
	fmovdneg	%icc,	%f27,	%f9
	lduh	[%l7 + 0x0C],	%g2
	sethi	0x0C9B,	%i6
	popc	%i2,	%g7
	move	%xcc,	%i1,	%o3
	movpos	%icc,	%l2,	%g5
	fmovrsgz	%o1,	%f29,	%f16
	movpos	%xcc,	%i3,	%o5
	orcc	%i7,	%o6,	%l4
	movrgz	%g1,	%o7,	%g6
	movleu	%icc,	%l5,	%l3
	xorcc	%i4,	%g3,	%l1
	st	%f13,	[%l7 + 0x14]
	movg	%xcc,	%l0,	%o0
	add	%g4,	%l6,	%i5
	subc	%o2,	0x150C,	%i0
	edge32ln	%o4,	%i6,	%i2
	fxnor	%f28,	%f4,	%f26
	ldsb	[%l7 + 0x2E],	%g2
	edge32ln	%g7,	%i1,	%l2
	sra	%o3,	%g5,	%o1
	movvs	%xcc,	%o5,	%i7
	fcmpeq32	%f12,	%f26,	%i3
	ld	[%l7 + 0x18],	%f0
	movpos	%xcc,	%l4,	%g1
	sdivcc	%o6,	0x0994,	%g6
	movl	%xcc,	%l5,	%l3
	movrgz	%i4,	0x2F8,	%o7
	ldd	[%l7 + 0x40],	%g2
	st	%f1,	[%l7 + 0x20]
	andncc	%l1,	%l0,	%o0
	fmovrsne	%l6,	%f19,	%f25
	alignaddrl	%g4,	%o2,	%i0
	movrlz	%i5,	0x34D,	%i6
	sdiv	%i2,	0x15FA,	%o4
	fmovdgu	%icc,	%f11,	%f23
	array8	%g2,	%g7,	%l2
	movg	%icc,	%o3,	%g5
	smul	%o1,	0x19E0,	%o5
	mulx	%i7,	%i3,	%l4
	addccc	%i1,	%g1,	%o6
	srl	%g6,	0x00,	%l5
	movge	%icc,	%l3,	%o7
	movneg	%icc,	%g3,	%l1
	or	%l0,	0x196B,	%o0
	edge16ln	%l6,	%g4,	%o2
	movrlez	%i0,	%i4,	%i6
	movrne	%i5,	0x3CF,	%i2
	fzeros	%f16
	fcmple32	%f12,	%f4,	%g2
	nop
	set	0x21, %o6
	ldub	[%l7 + %o6],	%o4
	movvc	%xcc,	%g7,	%o3
	sethi	0x09D2,	%g5
	movgu	%icc,	%o1,	%o5
	movrgez	%i7,	%l2,	%l4
	movrlz	%i1,	%g1,	%i3
	ldd	[%l7 + 0x08],	%g6
	movleu	%icc,	%o6,	%l3
	movle	%icc,	%o7,	%g3
	movpos	%icc,	%l1,	%l5
	nop
	set	0x3C, %o0
	stw	%o0,	[%l7 + %o0]
	ldsh	[%l7 + 0x60],	%l6
	ldd	[%l7 + 0x30],	%f10
	orcc	%l0,	%o2,	%g4
	orn	%i4,	0x18A7,	%i0
	movneg	%xcc,	%i6,	%i5
	srax	%i2,	0x1F,	%g2
	ldd	[%l7 + 0x58],	%f2
	orcc	%o4,	0x033D,	%g7
	mulx	%o3,	0x183D,	%g5
	sdivx	%o1,	0x14C9,	%o5
	movne	%xcc,	%l2,	%i7
	mova	%icc,	%l4,	%i1
	orn	%i3,	0x1302,	%g1
	movpos	%icc,	%g6,	%o6
	movcs	%xcc,	%l3,	%o7
	movleu	%icc,	%l1,	%g3
	alignaddr	%l5,	%l6,	%o0
	movrgz	%o2,	%g4,	%l0
	subcc	%i0,	%i4,	%i5
	fmovs	%f6,	%f4
	sdiv	%i2,	0x19B0,	%g2
	stx	%o4,	[%l7 + 0x28]
	movcc	%icc,	%g7,	%i6
	fones	%f23
	fpsub16	%f18,	%f0,	%f4
	mulx	%o3,	%o1,	%g5
	umulcc	%o5,	%l2,	%l4
	mulx	%i1,	0x082C,	%i3
	xorcc	%i7,	%g6,	%o6
	fabsd	%f22,	%f2
	std	%f24,	[%l7 + 0x70]
	st	%f26,	[%l7 + 0x40]
	st	%f13,	[%l7 + 0x30]
	sllx	%l3,	0x0D,	%o7
	array8	%l1,	%g1,	%g3
	addccc	%l5,	%o0,	%l6
	sth	%g4,	[%l7 + 0x56]
	umulcc	%o2,	0x0AC6,	%l0
	edge8ln	%i0,	%i5,	%i4
	fmul8x16al	%f20,	%f24,	%f2
	movgu	%icc,	%i2,	%o4
	movl	%xcc,	%g7,	%g2
	move	%icc,	%o3,	%i6
	fmovrdlez	%o1,	%f0,	%f14
	xnorcc	%o5,	0x140B,	%g5
	movpos	%icc,	%l2,	%l4
	ld	[%l7 + 0x2C],	%f1
	fnot2	%f0,	%f28
	fxnors	%f29,	%f27,	%f29
	alignaddr	%i1,	%i7,	%i3
	edge16	%o6,	%g6,	%o7
	lduw	[%l7 + 0x74],	%l1
	sub	%l3,	%g3,	%l5
	ldub	[%l7 + 0x7C],	%o0
	add	%g1,	%g4,	%o2
	umulcc	%l0,	0x18ED,	%l6
	sub	%i0,	0x0E34,	%i5
	ldx	[%l7 + 0x50],	%i2
	movneg	%xcc,	%i4,	%o4
	stw	%g7,	[%l7 + 0x14]
	udiv	%o3,	0x081F,	%i6
	subccc	%g2,	0x0763,	%o5
	edge32	%g5,	%o1,	%l4
	sir	0x1337
	fzeros	%f6
	addc	%i1,	0x17D6,	%l2
	udivcc	%i3,	0x1FF5,	%i7
	movcs	%xcc,	%g6,	%o6
	edge16ln	%o7,	%l3,	%g3
	andncc	%l1,	%l5,	%g1
	ldsh	[%l7 + 0x46],	%g4
	xorcc	%o2,	0x04D7,	%l0
	st	%f5,	[%l7 + 0x0C]
	movge	%icc,	%l6,	%o0
	andncc	%i0,	%i5,	%i4
	ldd	[%l7 + 0x78],	%i2
	xorcc	%g7,	0x1440,	%o3
	alignaddr	%i6,	%o4,	%g2
	sir	0x1612
	movl	%icc,	%g5,	%o1
	movge	%icc,	%o5,	%l4
	movpos	%icc,	%i1,	%l2
	orncc	%i7,	0x024F,	%g6
	movge	%icc,	%o6,	%i3
	ldd	[%l7 + 0x78],	%f2
	ldd	[%l7 + 0x18],	%f2
	orcc	%o7,	%l3,	%g3
	ldd	[%l7 + 0x48],	%f8
	edge32ln	%l5,	%l1,	%g1
	move	%xcc,	%g4,	%o2
	fxnor	%f28,	%f10,	%f16
	fmovdpos	%icc,	%f27,	%f9
	addcc	%l0,	0x1029,	%l6
	subccc	%i0,	0x06B2,	%i5
	fmovsle	%icc,	%f10,	%f31
	lduw	[%l7 + 0x5C],	%i4
	fzeros	%f17
	orncc	%i2,	0x1530,	%o0
	sir	0x0F0F
	andcc	%g7,	0x07B3,	%o3
	array32	%i6,	%o4,	%g2
	ldsw	[%l7 + 0x1C],	%g5
	movrlz	%o5,	0x0A7,	%l4
	fnegs	%f11,	%f18
	ldsb	[%l7 + 0x3F],	%o1
	xor	%l2,	0x14E3,	%i7
	xor	%g6,	0x130F,	%o6
	array16	%i1,	%o7,	%i3
	fmovrdne	%l3,	%f22,	%f4
	xnor	%l5,	0x183D,	%l1
	movneg	%icc,	%g1,	%g3
	array16	%o2,	%l0,	%l6
	movg	%xcc,	%i0,	%i5
	addc	%i4,	0x119C,	%g4
	addccc	%i2,	%g7,	%o0
	movre	%i6,	0x148,	%o3
	fmul8x16au	%f28,	%f16,	%f4
	fcmpne16	%f6,	%f18,	%g2
	movneg	%xcc,	%o4,	%g5
	movleu	%icc,	%o5,	%l4
	srlx	%o1,	%i7,	%g6
	movcs	%icc,	%o6,	%i1
	ldub	[%l7 + 0x22],	%l2
	std	%f6,	[%l7 + 0x20]
	nop
	set	0x48, %o7
	ldsw	[%l7 + %o7],	%i3
	edge16ln	%o7,	%l3,	%l1
	pdist	%f14,	%f22,	%f4
	fmovrslz	%g1,	%f15,	%f4
	udiv	%g3,	0x038C,	%l5
	movl	%icc,	%o2,	%l0
	fmovdcs	%icc,	%f4,	%f3
	fmovsle	%icc,	%f27,	%f15
	fmovrse	%i0,	%f29,	%f12
	sth	%l6,	[%l7 + 0x52]
	orncc	%i5,	0x0AFF,	%g4
	fxor	%f16,	%f6,	%f0
	movle	%icc,	%i4,	%i2
	movrlez	%g7,	0x0E4,	%o0
	addcc	%o3,	0x16F7,	%g2
	ld	[%l7 + 0x40],	%f11
	sth	%i6,	[%l7 + 0x50]
	fmovsa	%xcc,	%f29,	%f29
	xnorcc	%o4,	0x0BD7,	%o5
	ldub	[%l7 + 0x3B],	%g5
	std	%f12,	[%l7 + 0x68]
	or	%o1,	%i7,	%g6
	movgu	%xcc,	%o6,	%l4
	fmovdle	%icc,	%f7,	%f20
	orcc	%i1,	%l2,	%i3
	movrgz	%o7,	0x2C0,	%l1
	ldsb	[%l7 + 0x22],	%g1
	movvs	%icc,	%l3,	%g3
	stb	%o2,	[%l7 + 0x25]
	fands	%f4,	%f7,	%f7
	ldub	[%l7 + 0x1A],	%l0
	mulscc	%l5,	%i0,	%i5
	movleu	%icc,	%g4,	%l6
	sdivcc	%i2,	0x0D61,	%g7
	andncc	%o0,	%o3,	%i4
	andcc	%i6,	%o4,	%g2
	fmovrslez	%o5,	%f12,	%f4
	xorcc	%o1,	%g5,	%i7
	fmovspos	%xcc,	%f5,	%f14
	popc	%o6,	%g6
	popc	%l4,	%i1
	movcc	%icc,	%l2,	%i3
	xorcc	%l1,	0x13D0,	%g1
	stb	%l3,	[%l7 + 0x67]
	movgu	%icc,	%o7,	%o2
	sdivx	%g3,	0x161F,	%l5
	std	%f20,	[%l7 + 0x38]
	array8	%l0,	%i5,	%g4
	or	%i0,	%l6,	%i2
	edge8	%g7,	%o3,	%i4
	movvs	%xcc,	%i6,	%o0
	edge8l	%g2,	%o5,	%o1
	fmovrsne	%g5,	%f18,	%f19
	subcc	%i7,	%o4,	%g6
	movn	%icc,	%l4,	%i1
	udivcc	%o6,	0x06E0,	%i3
	addc	%l1,	0x1BC3,	%g1
	alignaddrl	%l3,	%o7,	%o2
	umulcc	%l2,	%l5,	%g3
	smul	%i5,	%g4,	%i0
	fpackfix	%f24,	%f11
	edge16l	%l6,	%l0,	%g7
	fmovsneg	%xcc,	%f24,	%f21
	edge16ln	%o3,	%i2,	%i6
	or	%i4,	0x1E1E,	%g2
	addccc	%o0,	0x10B4,	%o5
	fmuld8sux16	%f4,	%f23,	%f0
	and	%g5,	0x1A29,	%i7
	fmovdvc	%xcc,	%f22,	%f15
	movrlez	%o4,	%o1,	%l4
	alignaddr	%i1,	%g6,	%o6
	movneg	%xcc,	%i3,	%g1
	movle	%icc,	%l1,	%o7
	subccc	%l3,	%o2,	%l5
	movcc	%icc,	%g3,	%l2
	edge8ln	%g4,	%i5,	%i0
	ldd	[%l7 + 0x60],	%f30
	ldx	[%l7 + 0x58],	%l6
	sethi	0x1EDB,	%l0
	std	%f2,	[%l7 + 0x10]
	fornot1s	%f28,	%f25,	%f25
	or	%g7,	%o3,	%i2
	fornot1s	%f19,	%f20,	%f6
	edge16ln	%i4,	%g2,	%o0
	edge32ln	%o5,	%g5,	%i6
	subc	%i7,	%o4,	%l4
	xnorcc	%o1,	0x00C8,	%i1
	movrne	%o6,	%i3,	%g6
	and	%g1,	0x082A,	%l1
	alignaddrl	%o7,	%l3,	%o2
	sth	%l5,	[%l7 + 0x10]
	edge32ln	%l2,	%g4,	%i5
	subc	%g3,	%i0,	%l0
	srax	%g7,	%o3,	%l6
	edge8	%i4,	%i2,	%g2
	fmovdneg	%icc,	%f11,	%f16
	lduh	[%l7 + 0x6A],	%o5
	fpack16	%f6,	%f27
	movrgz	%g5,	0x0FD,	%i6
	movgu	%xcc,	%o0,	%o4
	fmovdne	%xcc,	%f0,	%f26
	orn	%i7,	%o1,	%l4
	movle	%xcc,	%o6,	%i1
	fpadd32	%f4,	%f16,	%f4
	nop
	set	0x38, %i7
	stb	%g6,	[%l7 + %i7]
	ldub	[%l7 + 0x11],	%g1
	edge32	%l1,	%i3,	%o7
	lduh	[%l7 + 0x7E],	%l3
	addcc	%l5,	0x1B8A,	%o2
	movneg	%icc,	%l2,	%g4
	sdiv	%g3,	0x1788,	%i0
	srax	%i5,	%l0,	%g7
	subcc	%o3,	0x159A,	%l6
	for	%f20,	%f22,	%f2
	addc	%i2,	0x0851,	%g2
	srlx	%i4,	0x0C,	%o5
	subcc	%i6,	0x0050,	%o0
	fmul8x16	%f26,	%f20,	%f24
	subc	%g5,	%o4,	%o1
	fzero	%f2
	subc	%l4,	%i7,	%i1
	fmovdleu	%xcc,	%f28,	%f24
	fmovsleu	%xcc,	%f22,	%f22
	edge32	%o6,	%g6,	%l1
	movvs	%icc,	%i3,	%g1
	edge16l	%l3,	%o7,	%o2
	edge32ln	%l2,	%g4,	%g3
	edge16	%l5,	%i0,	%l0
	andn	%i5,	%o3,	%l6
	addc	%i2,	0x0982,	%g7
	mulscc	%g2,	%o5,	%i6
	movne	%icc,	%o0,	%g5
	popc	%i4,	%o1
	movrgez	%l4,	0x194,	%o4
	ldsw	[%l7 + 0x64],	%i7
	movrgez	%o6,	%i1,	%g6
	edge32ln	%i3,	%l1,	%l3
	add	%g1,	0x038C,	%o2
	sth	%o7,	[%l7 + 0x5C]
	stx	%g4,	[%l7 + 0x10]
	fxor	%f26,	%f16,	%f26
	fabss	%f9,	%f30
	fmul8x16al	%f17,	%f21,	%f8
	ldub	[%l7 + 0x31],	%g3
	edge8n	%l5,	%l2,	%i0
	ld	[%l7 + 0x58],	%f3
	fnot1	%f30,	%f12
	st	%f26,	[%l7 + 0x78]
	fpmerge	%f17,	%f0,	%f4
	andncc	%i5,	%l0,	%o3
	edge8	%l6,	%i2,	%g2
	movvs	%icc,	%g7,	%o5
	fmul8sux16	%f6,	%f14,	%f4
	orncc	%i6,	0x0E9D,	%o0
	stw	%g5,	[%l7 + 0x30]
	orcc	%o1,	0x1D42,	%l4
	andn	%o4,	0x188A,	%i7
	edge8	%i4,	%o6,	%g6
	edge8	%i1,	%l1,	%i3
	movleu	%icc,	%g1,	%l3
	xnorcc	%o7,	%g4,	%g3
	fmovdn	%icc,	%f17,	%f12
	mulscc	%o2,	0x1E31,	%l2
	edge8l	%l5,	%i0,	%l0
	array16	%i5,	%l6,	%i2
	subccc	%g2,	%o3,	%g7
	andn	%o5,	%i6,	%g5
	edge32ln	%o0,	%o1,	%l4
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	xnorcc	%i4,	%i1,	%l1
	stw	%g6,	[%l7 + 0x54]
	sdivx	%i3,	0x17F4,	%g1
	fmovsleu	%xcc,	%f21,	%f19
	movrlz	%o7,	%g4,	%g3
	alignaddr	%o2,	%l3,	%l5
	alignaddr	%i0,	%l0,	%i5
	sdivx	%l6,	0x00F5,	%i2
	andncc	%l2,	%o3,	%g2
	std	%f30,	[%l7 + 0x48]
	fmovdg	%icc,	%f22,	%f6
	edge32n	%g7,	%i6,	%o5
	fornot2	%f20,	%f16,	%f22
	umulcc	%o0,	%g5,	%l4
	ldd	[%l7 + 0x70],	%f12
	ldsb	[%l7 + 0x4C],	%o1
	add	%i7,	%o6,	%o4
	fpsub16	%f8,	%f8,	%f18
	or	%i4,	%i1,	%g6
	fabsd	%f8,	%f8
	array16	%i3,	%g1,	%l1
	movrne	%o7,	%g3,	%g4
	fmovscs	%xcc,	%f25,	%f23
	move	%xcc,	%l3,	%l5
	sub	%o2,	0x0F6E,	%l0
	fmovsne	%xcc,	%f7,	%f11
	fnegs	%f29,	%f20
	edge32ln	%i0,	%i5,	%i2
	edge16l	%l2,	%o3,	%g2
	fmovse	%icc,	%f15,	%f0
	orn	%l6,	0x0FBF,	%i6
	movle	%icc,	%o5,	%o0
	udiv	%g5,	0x00C7,	%g7
	fmovdneg	%xcc,	%f22,	%f3
	sll	%o1,	0x10,	%i7
	stw	%l4,	[%l7 + 0x18]
	fpsub16s	%f27,	%f13,	%f19
	lduw	[%l7 + 0x68],	%o6
	mulx	%i4,	0x17D9,	%i1
	movvc	%xcc,	%o4,	%i3
	movvc	%icc,	%g6,	%g1
	faligndata	%f2,	%f30,	%f20
	pdist	%f26,	%f4,	%f0
	udiv	%o7,	0x14EC,	%g3
	umul	%g4,	%l3,	%l1
	movcc	%icc,	%l5,	%o2
	edge16n	%i0,	%i5,	%l0
	movvc	%icc,	%l2,	%o3
	ldsb	[%l7 + 0x2A],	%i2
	fnot1s	%f19,	%f30
	fmovrdlez	%l6,	%f2,	%f10
	orncc	%i6,	0x1DB7,	%g2
	srax	%o0,	%o5,	%g7
	fornot2	%f14,	%f12,	%f10
	edge8n	%o1,	%i7,	%g5
	movg	%icc,	%o6,	%i4
	sdiv	%i1,	0x1E02,	%l4
	fmovrsne	%o4,	%f28,	%f6
	movvs	%icc,	%g6,	%g1
	fcmps	%fcc3,	%f31,	%f17
	umulcc	%i3,	0x07AF,	%o7
	addc	%g4,	%l3,	%g3
	udivx	%l5,	0x1091,	%o2
	subcc	%l1,	0x0D87,	%i5
	andncc	%i0,	%l0,	%l2
	edge32n	%o3,	%i2,	%i6
	movcs	%xcc,	%l6,	%g2
	ldd	[%l7 + 0x20],	%f8
	fzero	%f12
	sdiv	%o0,	0x0978,	%o5
	srax	%o1,	%g7,	%g5
	edge16ln	%i7,	%i4,	%o6
	edge32	%i1,	%l4,	%o4
	fnor	%f24,	%f26,	%f30
	edge32	%g1,	%i3,	%o7
	smul	%g4,	%l3,	%g3
	orn	%l5,	%o2,	%g6
	movgu	%xcc,	%i5,	%i0
	umul	%l1,	0x018C,	%l0
	array8	%l2,	%o3,	%i2
	umul	%l6,	%i6,	%g2
	mova	%icc,	%o5,	%o1
	umulcc	%g7,	%g5,	%o0
	movneg	%xcc,	%i4,	%i7
	edge16	%i1,	%l4,	%o4
	srl	%o6,	0x08,	%i3
	xor	%o7,	0x0DD7,	%g4
	and	%l3,	0x14BB,	%g3
	mulx	%l5,	0x13C7,	%o2
	fors	%f13,	%f0,	%f28
	edge32	%g1,	%i5,	%g6
	movrlz	%i0,	0x066,	%l0
	smul	%l2,	%l1,	%i2
	srax	%o3,	%i6,	%l6
	movn	%xcc,	%g2,	%o5
	edge16ln	%g7,	%g5,	%o1
	smulcc	%i4,	0x1CB1,	%i7
	srl	%i1,	0x03,	%o0
	andncc	%o4,	%o6,	%l4
	mulscc	%o7,	%i3,	%g4
	save %g3, 0x1135, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o2,	%g1,	%l3
	fmovsl	%xcc,	%f13,	%f3
	ldsw	[%l7 + 0x4C],	%i5
	edge8ln	%i0,	%g6,	%l2
	ld	[%l7 + 0x54],	%f18
	movvs	%xcc,	%l0,	%i2
	movrgez	%o3,	%l1,	%l6
	sir	0x07E0
	umulcc	%i6,	%o5,	%g7
	sub	%g2,	0x1B46,	%o1
	ldsb	[%l7 + 0x73],	%i4
	movre	%g5,	0x2D1,	%i1
	edge32	%o0,	%o4,	%o6
	std	%f4,	[%l7 + 0x50]
	st	%f4,	[%l7 + 0x50]
	fnot2s	%f19,	%f31
	popc	%i7,	%o7
	subc	%l4,	0x1B7C,	%i3
	orn	%g3,	%l5,	%g4
	orn	%g1,	0x1205,	%l3
	or	%i5,	%o2,	%g6
	fmovdge	%xcc,	%f2,	%f13
	sub	%i0,	%l0,	%i2
	movrgez	%o3,	%l2,	%l1
	sth	%i6,	[%l7 + 0x66]
	nop
	set	0x10, %l3
	stx	%o5,	[%l7 + %l3]
	stb	%l6,	[%l7 + 0x41]
	movrgez	%g7,	0x24D,	%o1
	umul	%g2,	%i4,	%i1
	edge32n	%g5,	%o4,	%o0
	fcmple32	%f20,	%f14,	%i7
	edge32l	%o6,	%l4,	%i3
	edge32ln	%o7,	%l5,	%g3
	st	%f25,	[%l7 + 0x38]
	orn	%g4,	%g1,	%i5
	sll	%o2,	%g6,	%i0
	edge16ln	%l3,	%i2,	%l0
	stw	%l2,	[%l7 + 0x18]
	srl	%l1,	0x10,	%i6
	movvs	%icc,	%o3,	%o5
	array8	%g7,	%o1,	%g2
	ldub	[%l7 + 0x2B],	%l6
	edge16l	%i1,	%g5,	%o4
	fmovdle	%icc,	%f10,	%f19
	fmovdneg	%xcc,	%f7,	%f5
	edge32ln	%o0,	%i4,	%o6
	srlx	%i7,	%i3,	%l4
	movrlez	%o7,	0x1A6,	%g3
	orn	%l5,	0x08BA,	%g4
	add	%g1,	0x066D,	%i5
	edge16ln	%o2,	%g6,	%l3
	fpack16	%f18,	%f7
	stb	%i2,	[%l7 + 0x58]
	sth	%l0,	[%l7 + 0x26]
	movleu	%xcc,	%i0,	%l2
	movge	%xcc,	%i6,	%l1
	fmovdl	%icc,	%f26,	%f8
	ldsh	[%l7 + 0x26],	%o5
	fcmple16	%f2,	%f16,	%g7
	movneg	%xcc,	%o3,	%g2
	fmovsleu	%icc,	%f16,	%f13
	umulcc	%l6,	0x0490,	%i1
	sdiv	%o1,	0x0769,	%g5
	movneg	%xcc,	%o4,	%i4
	fors	%f6,	%f8,	%f2
	xorcc	%o0,	0x0B73,	%i7
	ldsw	[%l7 + 0x3C],	%o6
	udivx	%i3,	0x041F,	%o7
	fpsub32s	%f11,	%f28,	%f4
	lduh	[%l7 + 0x28],	%g3
	srlx	%l4,	0x12,	%g4
	fmul8x16	%f15,	%f20,	%f10
	sub	%g1,	%l5,	%i5
	movneg	%icc,	%o2,	%g6
	fmovrslez	%l3,	%f27,	%f7
	stb	%l0,	[%l7 + 0x10]
	sethi	0x1230,	%i0
	fzero	%f24
	fnot1s	%f23,	%f16
	fsrc1s	%f10,	%f13
	nop
	set	0x6C, %o4
	stw	%l2,	[%l7 + %o4]
	movge	%xcc,	%i2,	%i6
	udivcc	%l1,	0x1FCF,	%g7
	orncc	%o5,	0x1E0A,	%o3
	movrgz	%l6,	%g2,	%i1
	edge32l	%o1,	%g5,	%i4
	or	%o0,	%i7,	%o6
	mova	%icc,	%o4,	%o7
	movle	%xcc,	%g3,	%l4
	andn	%g4,	0x1622,	%g1
	sdiv	%l5,	0x0EC0,	%i3
	fcmple16	%f16,	%f20,	%o2
	lduh	[%l7 + 0x2C],	%i5
	array32	%l3,	%g6,	%l0
	stw	%i0,	[%l7 + 0x68]
	edge8l	%i2,	%i6,	%l2
	fsrc2	%f6,	%f26
	ldsh	[%l7 + 0x68],	%l1
	xnorcc	%g7,	%o5,	%l6
	fones	%f31
	movrgz	%g2,	%o3,	%o1
	movvs	%xcc,	%i1,	%i4
	movne	%icc,	%o0,	%g5
	fmuld8ulx16	%f7,	%f26,	%f6
	nop
	set	0x28, %l5
	stx	%o6,	[%l7 + %l5]
	nop
	set	0x19, %o1
	ldub	[%l7 + %o1],	%i7
	fmovdne	%xcc,	%f22,	%f24
	edge32	%o4,	%g3,	%l4
	smul	%o7,	%g1,	%g4
	edge32	%l5,	%i3,	%i5
	fornot2s	%f14,	%f9,	%f29
	smul	%l3,	%g6,	%o2
	fmovrdgez	%l0,	%f28,	%f8
	fmovsa	%xcc,	%f26,	%f11
	smulcc	%i0,	%i2,	%l2
	andn	%l1,	%g7,	%o5
	movrlez	%l6,	%g2,	%i6
	or	%o3,	0x1AD3,	%o1
	srl	%i1,	0x02,	%i4
	fandnot1	%f22,	%f22,	%f10
	fmovdcs	%icc,	%f3,	%f6
	ldd	[%l7 + 0x38],	%f12
	fcmpgt16	%f26,	%f6,	%g5
	stw	%o0,	[%l7 + 0x58]
	udiv	%i7,	0x069B,	%o4
	lduh	[%l7 + 0x40],	%o6
	addc	%l4,	%o7,	%g1
	srax	%g4,	%g3,	%l5
	and	%i3,	%l3,	%g6
	addcc	%i5,	%o2,	%i0
	xnorcc	%i2,	%l2,	%l0
	addcc	%g7,	0x141A,	%o5
	movvc	%xcc,	%l1,	%l6
	udiv	%i6,	0x1821,	%g2
	sdivcc	%o3,	0x02A1,	%i1
	orn	%o1,	%i4,	%o0
	movrgz	%i7,	0x088,	%o4
	ldsb	[%l7 + 0x0C],	%g5
	alignaddrl	%o6,	%o7,	%l4
	fornot1s	%f0,	%f22,	%f6
	addc	%g4,	0x136F,	%g3
	sdivx	%l5,	0x175F,	%g1
	fmovsle	%icc,	%f29,	%f27
	stw	%l3,	[%l7 + 0x1C]
	movleu	%icc,	%g6,	%i3
	fmovdle	%xcc,	%f10,	%f22
	subc	%o2,	0x0917,	%i0
	edge8n	%i5,	%i2,	%l0
	movpos	%icc,	%l2,	%g7
	movrlz	%l1,	%o5,	%i6
	movgu	%icc,	%g2,	%l6
	fmovdvs	%icc,	%f14,	%f11
	xor	%o3,	%o1,	%i4
	ldd	[%l7 + 0x68],	%i0
	edge16	%i7,	%o0,	%o4
	movge	%icc,	%g5,	%o6
	fmovrdgz	%o7,	%f30,	%f18
	fmovdn	%icc,	%f25,	%f15
	or	%g4,	0x00FC,	%l4
	stx	%g3,	[%l7 + 0x40]
	fmovrslez	%l5,	%f23,	%f30
	alignaddr	%l3,	%g1,	%g6
	movcc	%xcc,	%i3,	%i0
	array32	%o2,	%i5,	%i2
	move	%icc,	%l2,	%g7
	ldsw	[%l7 + 0x58],	%l0
	sdivcc	%o5,	0x14DB,	%l1
	array8	%i6,	%g2,	%l6
	std	%f30,	[%l7 + 0x38]
	st	%f19,	[%l7 + 0x70]
	ldx	[%l7 + 0x78],	%o3
	fmovdn	%icc,	%f1,	%f23
	stb	%i4,	[%l7 + 0x26]
	addcc	%o1,	0x1BA1,	%i1
	fcmpes	%fcc3,	%f31,	%f1
	restore %o0, 0x16CD, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o4,	%o6,	%o7
	movl	%xcc,	%g4,	%l4
	pdist	%f4,	%f18,	%f6
	smulcc	%g5,	0x01DA,	%g3
	movleu	%icc,	%l3,	%l5
	move	%xcc,	%g6,	%g1
	fpack32	%f0,	%f6,	%f14
	movge	%icc,	%i3,	%i0
	popc	0x13F5,	%o2
	sra	%i5,	0x1D,	%l2
	mova	%icc,	%i2,	%l0
	save %g7, %o5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g2,	%l6,	%o3
	and	%i4,	0x1DA2,	%o1
	ldsb	[%l7 + 0x41],	%i1
	edge16n	%l1,	%o0,	%i7
	sdiv	%o4,	0x0751,	%o6
	orn	%o7,	%l4,	%g4
	srax	%g5,	0x00,	%l3
	udivx	%g3,	0x12E9,	%g6
	mova	%icc,	%l5,	%g1
	movrgez	%i3,	%i0,	%o2
	fmovrse	%l2,	%f14,	%f8
	ldx	[%l7 + 0x40],	%i5
	edge16	%l0,	%g7,	%i2
	andcc	%i6,	%g2,	%l6
	smulcc	%o3,	0x1A8C,	%i4
	ldsb	[%l7 + 0x23],	%o1
	fone	%f0
	xorcc	%o5,	0x1449,	%i1
	sub	%l1,	%i7,	%o4
	sth	%o6,	[%l7 + 0x64]
	movg	%xcc,	%o0,	%l4
	sth	%g4,	[%l7 + 0x7E]
	fmovdleu	%icc,	%f30,	%f4
	ldub	[%l7 + 0x50],	%o7
	movleu	%xcc,	%l3,	%g3
	fmovdneg	%icc,	%f4,	%f31
	fmovrsgz	%g5,	%f6,	%f18
	and	%l5,	%g1,	%i3
	fmovdl	%xcc,	%f3,	%f1
	movg	%icc,	%g6,	%o2
	fsrc1	%f14,	%f22
	fabss	%f27,	%f20
	movle	%icc,	%l2,	%i5
	edge16n	%i0,	%g7,	%i2
	fxor	%f18,	%f14,	%f4
	fzeros	%f18
	movg	%icc,	%l0,	%g2
	edge8n	%l6,	%i6,	%o3
	fmovrdlz	%i4,	%f28,	%f0
	fpadd16s	%f17,	%f29,	%f12
	movrgez	%o5,	%o1,	%l1
	edge32l	%i1,	%o4,	%o6
	sub	%o0,	%i7,	%l4
	sth	%o7,	[%l7 + 0x70]
	edge8	%l3,	%g4,	%g3
	fcmple16	%f6,	%f4,	%g5
	sdivcc	%l5,	0x0508,	%g1
	movcc	%icc,	%g6,	%i3
	array16	%l2,	%i5,	%o2
	fxnor	%f24,	%f16,	%f20
	movle	%xcc,	%g7,	%i2
	stw	%i0,	[%l7 + 0x68]
	st	%f7,	[%l7 + 0x74]
	movg	%xcc,	%l0,	%l6
	sethi	0x1C3A,	%g2
	fmovdl	%xcc,	%f18,	%f12
	edge32ln	%i6,	%i4,	%o5
	or	%o3,	%l1,	%i1
	mulscc	%o1,	%o6,	%o4
	fcmple16	%f30,	%f0,	%o0
	alignaddr	%i7,	%o7,	%l3
	addcc	%g4,	%l4,	%g5
	movrgez	%l5,	0x3FE,	%g3
	fnor	%f24,	%f24,	%f22
	fmovdvc	%xcc,	%f11,	%f18
	xnor	%g6,	0x1A27,	%i3
	edge8l	%l2,	%i5,	%o2
	movvc	%xcc,	%g7,	%i2
	movcs	%xcc,	%g1,	%l0
	fmovrse	%l6,	%f20,	%f2
	mulx	%g2,	0x16CA,	%i6
	fmovrde	%i4,	%f22,	%f28
	fmovscs	%icc,	%f6,	%f1
	srlx	%i0,	%o5,	%l1
	movrlez	%o3,	0x321,	%i1
	sethi	0x12B3,	%o6
	std	%f22,	[%l7 + 0x48]
	ldsw	[%l7 + 0x10],	%o1
	mulx	%o0,	0x0410,	%i7
	movg	%icc,	%o4,	%l3
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	udivcc	%g4,	0x1BD0,	%g5
	udivx	%l5,	0x174D,	%g3
	fmovsneg	%xcc,	%f19,	%f4
	fmovrdgz	%g6,	%f0,	%f12
	subcc	%l2,	%i3,	%i5
	orn	%g7,	%o2,	%i2
	movvs	%icc,	%g1,	%l0
	restore %g2, %l6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i4,	%i0,	%l1
	movcc	%xcc,	%o5,	%i1
	fmovdg	%icc,	%f13,	%f8
	fsrc2	%f16,	%f8
	smul	%o3,	%o6,	%o1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3629
!	Type f   	: 5228
!	Type i   	: 16143
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xC01D9E41
.word 0xB42CC41E
.word 0x0F32756F
.word 0x215D3B68
.word 0x180EE081
.word 0x1731B47C
.word 0x4F562644
.word 0xFDABA3C9
.word 0x1774E974
.word 0xE674CC4F
.word 0x5B4E56F3
.word 0x9341723B
.word 0x96CAD586
.word 0xE6107A1C
.word 0x11C09672
.word 0x837A730B
.word 0xA3BD6627
.word 0x3391A18A
.word 0x22279195
.word 0x179DEC8A
.word 0xABCDFAAB
.word 0xF673090D
.word 0xB4E3B70C
.word 0x00F8B2A9
.word 0xD39A6727
.word 0xA52E04F8
.word 0x96D50F16
.word 0xE095A81C
.word 0x23741294
.word 0xC3F1965F
.word 0x9B3FECB4
.word 0x4B170774
.word 0x7755314B
.word 0x58D78482
.word 0xFB900CE0
.word 0x6293D6CD
.word 0xB75B3003
.word 0x439B5013
.word 0x3451A18A
.word 0xA1376FB5
.word 0xE39C84EB
.word 0x2E5A817E
.word 0x72A645C4
.word 0x3D6A4732
.word 0x5989E409
.word 0x9EA2197E
.word 0x3D4A800C
.word 0xB575B39A
.word 0x5FE64417
.word 0x7BB3C19C
.word 0xF0765191
.word 0xB484BBAA
.word 0x37B2EC4D
.word 0x14FFCEA9
.word 0xA47D6149
.word 0x28ECC8C6
.word 0x78B9DC0F
.word 0xBC53D4F6
.word 0x94CB10B0
.word 0x2AA201DA
.word 0x78CEE5E5
.word 0x87013246
.word 0x6F0AA949
.word 0x34A31174
.end
