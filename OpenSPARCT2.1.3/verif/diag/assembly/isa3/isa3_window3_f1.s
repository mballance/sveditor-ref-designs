/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f1.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f1.s,v 1.1 2007/05/11 17:22:35 drp Exp $"
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
	setx	0xCF16F97E10646964,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xC,	%g1
	set	0x8,	%g2
	set	0x7,	%g3
	set	0x7,	%g4
	set	0xC,	%g5
	set	0x5,	%g6
	set	0x6,	%g7
	!# Input registers
	set	-0xD,	%i0
	set	-0xC,	%i1
	set	-0x4,	%i2
	set	-0xB,	%i3
	set	-0x8,	%i4
	set	-0x2,	%i5
	set	-0xC,	%i6
	set	-0xD,	%i7
	!# Local registers
	set	0x5350915F,	%l0
	set	0x576190DE,	%l1
	set	0x73781353,	%l2
	set	0x2EF331AB,	%l3
	set	0x3355D9B5,	%l4
	set	0x00FBC8E7,	%l5
	set	0x34A0B181,	%l6
	!# Output registers
	set	0x0BCD,	%o0
	set	0x0EAE,	%o1
	set	0x0C1A,	%o2
	set	0x013D,	%o3
	set	-0x15E8,	%o4
	set	-0x1797,	%o5
	set	0x1291,	%o6
	set	0x0A35,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD6DD35CAFB5D5809)
	INIT_TH_FP_REG(%l7,%f2,0x1943624E4F7A3C0A)
	INIT_TH_FP_REG(%l7,%f4,0x754B1F28DF4B403E)
	INIT_TH_FP_REG(%l7,%f6,0x52202B578582133F)
	INIT_TH_FP_REG(%l7,%f8,0xE9DBA304F679D80D)
	INIT_TH_FP_REG(%l7,%f10,0xB39C0D279D3A4B9C)
	INIT_TH_FP_REG(%l7,%f12,0xC38B89F5CF86AA36)
	INIT_TH_FP_REG(%l7,%f14,0xA97C4CADCADA0268)
	INIT_TH_FP_REG(%l7,%f16,0x16A263A7012AFB76)
	INIT_TH_FP_REG(%l7,%f18,0xC7EDF21667757675)
	INIT_TH_FP_REG(%l7,%f20,0xF58DA7BA00A2B294)
	INIT_TH_FP_REG(%l7,%f22,0x8DEC526DA7059ED1)
	INIT_TH_FP_REG(%l7,%f24,0x04C991E459498C77)
	INIT_TH_FP_REG(%l7,%f26,0x893790F91A2953A8)
	INIT_TH_FP_REG(%l7,%f28,0x2175BBFB2177D92C)
	INIT_TH_FP_REG(%l7,%f30,0xACAE223DEA8385E9)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	ldd	[%l7 + 0x78],	%o4
	andncc	%i3,	%l0,	%i5
	edge8	%i6,	%g1,	%l5
	addccc	%g2,	0x02F7,	%l3
	ldsh	[%l7 + 0x56],	%i2
	sll	%g4,	%g3,	%l4
	stx	%l1,	[%l7 + 0x60]
	fmovdvc	%icc,	%f19,	%f2
	udivcc	%g7,	0x118D,	%i0
	srl	%g6,	%o7,	%o1
	edge32	%l6,	%g5,	%i7
	movpos	%icc,	%i4,	%o6
	fnegd	%f28,	%f28
	ld	[%l7 + 0x20],	%f21
	movvc	%icc,	%o3,	%i1
	fmovdleu	%xcc,	%f28,	%f25
	movge	%xcc,	%o5,	%o0
	sdiv	%l2,	0x18D5,	%o2
	movpos	%icc,	%o4,	%l0
	sdiv	%i5,	0x1F5C,	%i3
	mulx	%g1,	0x0FF6,	%l5
	fpadd32	%f26,	%f30,	%f26
	umulcc	%i6,	0x0B0A,	%l3
	umulcc	%g2,	0x0083,	%i2
	ldsh	[%l7 + 0x3E],	%g4
	popc	%l4,	%g3
	ld	[%l7 + 0x64],	%f19
	xnor	%g7,	0x1863,	%i0
	alignaddrl	%g6,	%l1,	%o1
	edge8n	%l6,	%o7,	%i7
	nop
	set	0x20, %g3
	stw	%g5,	[%l7 + %g3]
	fmovdleu	%icc,	%f22,	%f4
	addcc	%i4,	0x1085,	%o6
	movne	%xcc,	%o3,	%o5
	movrgz	%i1,	0x3B7,	%o0
	umul	%l2,	0x1135,	%o2
	ldsh	[%l7 + 0x14],	%l0
	fmul8x16	%f9,	%f20,	%f24
	fones	%f21
	edge8ln	%o4,	%i5,	%g1
	edge32ln	%i3,	%l5,	%l3
	sdivx	%g2,	0x06FD,	%i2
	edge8	%i6,	%g4,	%g3
	movne	%icc,	%g7,	%i0
	fpadd32	%f26,	%f2,	%f8
	movrgez	%g6,	%l4,	%o1
	or	%l6,	%l1,	%i7
	fmovs	%f10,	%f21
	ld	[%l7 + 0x5C],	%f11
	alignaddrl	%g5,	%i4,	%o6
	edge32n	%o7,	%o3,	%i1
	alignaddr	%o5,	%l2,	%o2
	save %o0, %l0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f22,	%f10,	%i5
	ldd	[%l7 + 0x18],	%f28
	ldd	[%l7 + 0x10],	%g0
	ldsb	[%l7 + 0x0B],	%l5
	sethi	0x1786,	%l3
	sir	0x1A0B
	bshuffle	%f20,	%f10,	%f22
	fmovrsgz	%g2,	%f22,	%f9
	movg	%xcc,	%i3,	%i2
	movvs	%xcc,	%g4,	%i6
	edge16	%g7,	%g3,	%g6
	lduh	[%l7 + 0x68],	%i0
	udivcc	%o1,	0x18FE,	%l4
	srax	%l1,	0x06,	%i7
	edge32ln	%l6,	%g5,	%i4
	and	%o6,	0x0D62,	%o7
	xorcc	%o3,	%i1,	%o5
	fmovrslz	%o2,	%f12,	%f15
	array16	%o0,	%l2,	%o4
	movcc	%xcc,	%l0,	%i5
	fmovse	%xcc,	%f20,	%f11
	xor	%l5,	%l3,	%g1
	ldub	[%l7 + 0x45],	%i3
	std	%f0,	[%l7 + 0x48]
	sdiv	%i2,	0x1C27,	%g4
	orcc	%i6,	0x1749,	%g2
	movn	%icc,	%g3,	%g7
	stb	%i0,	[%l7 + 0x2A]
	st	%f8,	[%l7 + 0x60]
	fmovse	%xcc,	%f28,	%f14
	add	%g6,	%l4,	%l1
	movrlz	%i7,	0x194,	%l6
	move	%xcc,	%o1,	%i4
	fnot2s	%f9,	%f25
	fabss	%f18,	%f30
	sdivcc	%o6,	0x1BC7,	%o7
	add	%g5,	0x0846,	%o3
	sra	%i1,	0x1B,	%o5
	fmovrdne	%o0,	%f30,	%f24
	movre	%l2,	%o2,	%o4
	sethi	0x00ED,	%l0
	udivx	%l5,	0x05AD,	%i5
	edge16l	%l3,	%g1,	%i2
	subc	%i3,	%i6,	%g2
	srlx	%g3,	%g4,	%g7
	array32	%g6,	%i0,	%l4
	faligndata	%f6,	%f18,	%f18
	edge16ln	%i7,	%l6,	%l1
	and	%i4,	%o6,	%o7
	umulcc	%g5,	0x1BBB,	%o3
	fornot1s	%f12,	%f14,	%f9
	alignaddr	%i1,	%o1,	%o0
	movl	%icc,	%l2,	%o2
	stb	%o4,	[%l7 + 0x25]
	smul	%l0,	0x0ECC,	%l5
	movn	%xcc,	%i5,	%o5
	fpack16	%f30,	%f4
	edge32ln	%g1,	%l3,	%i2
	subccc	%i3,	%g2,	%g3
	stw	%g4,	[%l7 + 0x0C]
	sllx	%i6,	%g6,	%g7
	movcc	%xcc,	%l4,	%i0
	andcc	%i7,	0x0A1E,	%l1
	movn	%icc,	%i4,	%l6
	fmovrde	%o7,	%f0,	%f24
	fmovrdgz	%g5,	%f12,	%f2
	edge16n	%o6,	%o3,	%o1
	ldsh	[%l7 + 0x7C],	%i1
	fmovrse	%l2,	%f29,	%f7
	movg	%xcc,	%o2,	%o4
	alignaddrl	%o0,	%l0,	%i5
	movrne	%l5,	%g1,	%o5
	fmovrdne	%l3,	%f12,	%f16
	ldsb	[%l7 + 0x4D],	%i3
	sth	%g2,	[%l7 + 0x5E]
	ld	[%l7 + 0x2C],	%f24
	smulcc	%g3,	%g4,	%i6
	edge16l	%i2,	%g7,	%g6
	lduw	[%l7 + 0x3C],	%i0
	edge32	%i7,	%l4,	%l1
	fnot2s	%f4,	%f25
	udivcc	%l6,	0x0430,	%i4
	sra	%o7,	%o6,	%o3
	subcc	%o1,	0x0DDD,	%g5
	stx	%l2,	[%l7 + 0x68]
	udivx	%o2,	0x0D65,	%i1
	restore %o4, %l0, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i5,	%l5
	stx	%g1,	[%l7 + 0x78]
	addc	%o5,	0x0E4C,	%l3
	edge8n	%i3,	%g3,	%g2
	sth	%g4,	[%l7 + 0x30]
	edge8	%i6,	%g7,	%g6
	fmovse	%xcc,	%f2,	%f29
	sdivcc	%i0,	0x155E,	%i2
	xorcc	%i7,	%l1,	%l4
	xnorcc	%i4,	0x1E1B,	%l6
	sra	%o6,	%o7,	%o1
	fmovrslez	%o3,	%f14,	%f23
	movpos	%xcc,	%g5,	%l2
	andn	%o2,	0x1C15,	%i1
	mulx	%l0,	%o4,	%i5
	mulx	%l5,	%o0,	%o5
	udiv	%g1,	0x1F27,	%l3
	nop
	set	0x70, %o7
	std	%f22,	[%l7 + %o7]
	fnot2	%f12,	%f0
	array16	%g3,	%i3,	%g2
	fmovsne	%xcc,	%f10,	%f12
	fmovdne	%icc,	%f23,	%f26
	array32	%g4,	%g7,	%g6
	ldx	[%l7 + 0x50],	%i6
	sll	%i2,	%i0,	%l1
	stx	%l4,	[%l7 + 0x20]
	array32	%i4,	%i7,	%o6
	nop
	set	0x5A, %g2
	stb	%o7,	[%l7 + %g2]
	ldsh	[%l7 + 0x4C],	%o1
	sll	%o3,	%g5,	%l2
	smulcc	%o2,	0x028A,	%l6
	sub	%l0,	%i1,	%o4
	fabss	%f20,	%f15
	sth	%i5,	[%l7 + 0x64]
	movcc	%xcc,	%o0,	%l5
	orcc	%o5,	0x0AF2,	%l3
	fpadd32	%f0,	%f22,	%f12
	movl	%icc,	%g3,	%i3
	sra	%g2,	0x1C,	%g4
	sir	0x0320
	ld	[%l7 + 0x18],	%f21
	fpmerge	%f2,	%f12,	%f10
	bshuffle	%f28,	%f6,	%f16
	ldub	[%l7 + 0x3C],	%g1
	edge16l	%g6,	%i6,	%g7
	edge8n	%i2,	%i0,	%l1
	addcc	%i4,	%i7,	%o6
	ldx	[%l7 + 0x68],	%l4
	xnor	%o7,	0x1EDA,	%o1
	add	%o3,	0x12EC,	%l2
	nop
	set	0x64, %l4
	lduw	[%l7 + %l4],	%g5
	move	%xcc,	%l6,	%l0
	sdivcc	%i1,	0x0AEB,	%o2
	fmovrsne	%i5,	%f5,	%f8
	movleu	%icc,	%o4,	%l5
	sethi	0x1988,	%o5
	ldd	[%l7 + 0x20],	%l2
	alignaddrl	%o0,	%g3,	%i3
	edge8l	%g2,	%g1,	%g6
	fexpand	%f7,	%f16
	edge32ln	%g4,	%g7,	%i2
	subc	%i6,	0x1384,	%i0
	fcmpeq16	%f16,	%f24,	%l1
	mulx	%i4,	0x0B15,	%o6
	xor	%i7,	0x0821,	%o7
	ldsw	[%l7 + 0x38],	%l4
	subcc	%o3,	%o1,	%l2
	andcc	%l6,	0x18AA,	%l0
	movpos	%icc,	%i1,	%o2
	sdiv	%g5,	0x137C,	%i5
	sllx	%l5,	0x0B,	%o5
	fmul8x16	%f26,	%f0,	%f6
	sethi	0x1A1E,	%o4
	or	%o0,	0x0FF1,	%g3
	edge16ln	%i3,	%l3,	%g2
	ldd	[%l7 + 0x38],	%g6
	xorcc	%g1,	%g7,	%i2
	ldd	[%l7 + 0x08],	%i6
	subcc	%g4,	%i0,	%i4
	add	%o6,	%i7,	%o7
	sub	%l4,	0x04A2,	%o3
	ldx	[%l7 + 0x78],	%o1
	edge16n	%l2,	%l6,	%l1
	fmovdge	%icc,	%f30,	%f2
	lduw	[%l7 + 0x6C],	%i1
	subcc	%o2,	%l0,	%g5
	edge32n	%l5,	%o5,	%i5
	ldub	[%l7 + 0x2E],	%o0
	ldsb	[%l7 + 0x72],	%g3
	edge16ln	%o4,	%l3,	%i3
	fmovde	%icc,	%f8,	%f14
	andn	%g6,	%g1,	%g7
	fpadd32s	%f6,	%f2,	%f5
	sdivcc	%g2,	0x1602,	%i2
	xnorcc	%i6,	0x01C7,	%i0
	addcc	%i4,	0x058E,	%g4
	fsrc2	%f20,	%f16
	sdiv	%o6,	0x0A31,	%o7
	subccc	%l4,	%o3,	%o1
	edge32ln	%i7,	%l2,	%l1
	movpos	%xcc,	%l6,	%i1
	movne	%xcc,	%l0,	%g5
	ldsw	[%l7 + 0x18],	%l5
	edge32	%o2,	%o5,	%o0
	udivcc	%i5,	0x1545,	%o4
	orncc	%g3,	0x0220,	%i3
	smulcc	%l3,	%g6,	%g1
	ldsw	[%l7 + 0x78],	%g7
	array32	%g2,	%i2,	%i0
	movleu	%xcc,	%i4,	%g4
	movvc	%xcc,	%i6,	%o6
	sll	%o7,	0x06,	%o3
	movcc	%xcc,	%o1,	%l4
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%f24
	fmuld8sux16	%f2,	%f26,	%f16
	movleu	%icc,	%i7,	%l2
	fnor	%f20,	%f6,	%f30
	fmovsa	%icc,	%f24,	%f10
	lduw	[%l7 + 0x14],	%l6
	edge16ln	%l1,	%l0,	%i1
	fmovscs	%icc,	%f25,	%f31
	alignaddr	%l5,	%g5,	%o2
	save %o5, 0x0E4F, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o0,	0x093,	%g3
	xnorcc	%o4,	%l3,	%i3
	edge32l	%g1,	%g6,	%g7
	fmovdvs	%xcc,	%f5,	%f1
	srax	%i2,	%g2,	%i0
	fmovspos	%icc,	%f31,	%f24
	edge16	%i4,	%g4,	%o6
	stw	%o7,	[%l7 + 0x34]
	edge16n	%o3,	%o1,	%l4
	xor	%i6,	0x0ADF,	%i7
	movl	%icc,	%l6,	%l1
	sra	%l0,	%l2,	%i1
	movne	%xcc,	%g5,	%l5
	movgu	%xcc,	%o2,	%o5
	movg	%icc,	%i5,	%o0
	subccc	%g3,	%l3,	%i3
	fpadd16s	%f31,	%f26,	%f11
	faligndata	%f26,	%f6,	%f12
	xor	%g1,	0x021C,	%o4
	fornot1s	%f3,	%f4,	%f13
	fcmpes	%fcc0,	%f9,	%f26
	sll	%g7,	%g6,	%g2
	sllx	%i2,	0x0B,	%i4
	fmul8sux16	%f26,	%f30,	%f22
	mova	%xcc,	%i0,	%g4
	fmovrdlez	%o6,	%f14,	%f10
	std	%f10,	[%l7 + 0x08]
	smulcc	%o3,	%o1,	%l4
	fpadd32	%f18,	%f20,	%f26
	fmovdn	%xcc,	%f11,	%f3
	ldx	[%l7 + 0x60],	%o7
	movne	%xcc,	%i7,	%l6
	movrgez	%l1,	0x36B,	%i6
	array16	%l0,	%l2,	%i1
	array16	%g5,	%o2,	%l5
	edge32ln	%o5,	%i5,	%o0
	movpos	%icc,	%g3,	%i3
	umul	%l3,	0x1908,	%g1
	popc	%o4,	%g7
	or	%g6,	%g2,	%i2
	sdiv	%i0,	0x18EA,	%i4
	sir	0x0BBE
	fmovsge	%icc,	%f13,	%f3
	movpos	%icc,	%g4,	%o3
	orn	%o1,	%o6,	%l4
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	andcc	%l6,	0x049D,	%i6
	stw	%l0,	[%l7 + 0x74]
	faligndata	%f10,	%f16,	%f8
	fmovde	%icc,	%f16,	%f27
	fmovdcc	%icc,	%f25,	%f30
	sth	%i1,	[%l7 + 0x68]
	smulcc	%g5,	%o2,	%l5
	udiv	%l2,	0x1DA2,	%i5
	edge32l	%o0,	%o5,	%i3
	and	%l3,	0x0B4C,	%g3
	lduw	[%l7 + 0x18],	%o4
	movre	%g7,	0x091,	%g1
	array16	%g2,	%g6,	%i0
	andncc	%i2,	%i4,	%o3
	popc	%g4,	%o1
	st	%f3,	[%l7 + 0x54]
	ldub	[%l7 + 0x2D],	%l4
	sir	0x1C5D
	sub	%o6,	0x0ACC,	%o7
	edge16l	%l1,	%l6,	%i6
	fmovd	%f30,	%f16
	ldd	[%l7 + 0x48],	%f10
	stb	%l0,	[%l7 + 0x1F]
	subccc	%i7,	%i1,	%o2
	movvs	%icc,	%l5,	%l2
	umulcc	%i5,	%o0,	%o5
	sll	%i3,	0x1F,	%g5
	movpos	%icc,	%g3,	%o4
	ldsb	[%l7 + 0x62],	%l3
	ldsw	[%l7 + 0x68],	%g7
	movre	%g2,	%g6,	%i0
	movgu	%icc,	%g1,	%i4
	sub	%o3,	%i2,	%o1
	xnorcc	%l4,	0x1A04,	%g4
	ld	[%l7 + 0x3C],	%f6
	addccc	%o6,	0x068C,	%o7
	or	%l1,	0x037C,	%l6
	fnot1s	%f31,	%f25
	subcc	%l0,	0x1941,	%i6
	edge8	%i7,	%o2,	%l5
	fmul8x16	%f19,	%f16,	%f26
	edge8	%l2,	%i1,	%o0
	ldx	[%l7 + 0x58],	%i5
	or	%i3,	%g5,	%g3
	nop
	set	0x5E, %i5
	ldsh	[%l7 + %i5],	%o4
	edge8l	%l3,	%g7,	%g2
	srax	%o5,	0x1E,	%i0
	edge8ln	%g1,	%i4,	%g6
	save %o3, 0x144A, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o1,	%l4,	%o6
	fpsub16	%f10,	%f24,	%f2
	edge32n	%o7,	%g4,	%l1
	sdivcc	%l0,	0x0596,	%l6
	st	%f24,	[%l7 + 0x28]
	smulcc	%i7,	%i6,	%o2
	ldsh	[%l7 + 0x7C],	%l5
	fmovdleu	%xcc,	%f18,	%f6
	movvs	%xcc,	%l2,	%o0
	sllx	%i1,	%i5,	%i3
	andncc	%g3,	%g5,	%o4
	fmovsl	%xcc,	%f20,	%f26
	fmovscs	%xcc,	%f13,	%f19
	sth	%l3,	[%l7 + 0x46]
	fpack16	%f0,	%f8
	mova	%xcc,	%g7,	%o5
	edge32ln	%i0,	%g1,	%i4
	for	%f14,	%f12,	%f26
	xnorcc	%g6,	0x1AAE,	%g2
	nop
	set	0x20, %l6
	std	%f30,	[%l7 + %l6]
	fmovsge	%icc,	%f5,	%f14
	mulscc	%o3,	%o1,	%l4
	ldsb	[%l7 + 0x0B],	%o6
	udivx	%i2,	0x06ED,	%g4
	udivcc	%l1,	0x07CF,	%l0
	stx	%l6,	[%l7 + 0x10]
	movcc	%icc,	%i7,	%o7
	fmul8x16al	%f31,	%f5,	%f20
	ldsh	[%l7 + 0x56],	%i6
	edge16	%l5,	%o2,	%l2
	movneg	%icc,	%i1,	%o0
	fcmpne16	%f8,	%f8,	%i5
	ldx	[%l7 + 0x48],	%i3
	fpsub16s	%f18,	%f15,	%f17
	for	%f2,	%f30,	%f24
	xor	%g5,	0x14DD,	%g3
	movrne	%o4,	%g7,	%l3
	sth	%i0,	[%l7 + 0x46]
	edge16l	%o5,	%i4,	%g1
	udiv	%g6,	0x09F6,	%o3
	umul	%o1,	%g2,	%o6
	fcmple16	%f12,	%f12,	%i2
	edge8n	%l4,	%l1,	%l0
	fmul8sux16	%f0,	%f2,	%f14
	subcc	%l6,	%g4,	%i7
	srax	%o7,	0x0E,	%i6
	movneg	%icc,	%l5,	%o2
	fxor	%f26,	%f8,	%f22
	sth	%l2,	[%l7 + 0x34]
	alignaddr	%i1,	%o0,	%i3
	alignaddrl	%g5,	%i5,	%o4
	fmovdneg	%icc,	%f29,	%f25
	add	%g3,	%l3,	%g7
	sra	%i0,	%i4,	%o5
	fmovde	%icc,	%f6,	%f0
	sethi	0x0274,	%g1
	movg	%icc,	%o3,	%g6
	stw	%g2,	[%l7 + 0x58]
	ldsh	[%l7 + 0x3E],	%o6
	edge16	%i2,	%o1,	%l4
	movg	%xcc,	%l1,	%l0
	ld	[%l7 + 0x54],	%f29
	edge16ln	%l6,	%i7,	%g4
	movrlz	%o7,	%l5,	%i6
	ldd	[%l7 + 0x60],	%f14
	restore %o2, %l2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i3,	[%l7 + 0x40]
	subcc	%o0,	0x051B,	%g5
	fabsd	%f22,	%f26
	fandnot2s	%f9,	%f7,	%f21
	nop
	set	0x10, %i0
	stw	%i5,	[%l7 + %i0]
	subcc	%o4,	0x00A0,	%g3
	alignaddr	%g7,	%l3,	%i0
	std	%f10,	[%l7 + 0x08]
	array16	%o5,	%i4,	%g1
	edge16n	%g6,	%o3,	%o6
	movvc	%xcc,	%g2,	%o1
	edge16l	%i2,	%l1,	%l4
	srax	%l6,	0x11,	%i7
	movneg	%icc,	%g4,	%l0
	fmovscc	%icc,	%f20,	%f15
	fpadd16	%f18,	%f26,	%f22
	fsrc1	%f2,	%f6
	popc	0x1357,	%o7
	and	%i6,	0x1362,	%l5
	fcmpeq16	%f26,	%f16,	%l2
	movrgz	%i1,	%i3,	%o2
	movneg	%xcc,	%g5,	%o0
	fmovse	%icc,	%f21,	%f24
	or	%i5,	%g3,	%o4
	movne	%icc,	%l3,	%i0
	movre	%g7,	0x1BB,	%i4
	udivx	%o5,	0x0726,	%g1
	movvc	%xcc,	%o3,	%o6
	andcc	%g2,	0x03D2,	%g6
	nop
	set	0x58, %g7
	std	%f8,	[%l7 + %g7]
	edge8ln	%i2,	%l1,	%l4
	movn	%icc,	%o1,	%i7
	sethi	0x1EBF,	%l6
	fmovse	%xcc,	%f28,	%f23
	smulcc	%g4,	0x08A6,	%o7
	st	%f9,	[%l7 + 0x0C]
	movle	%xcc,	%l0,	%i6
	fcmpne32	%f2,	%f10,	%l2
	alignaddrl	%l5,	%i1,	%o2
	stb	%i3,	[%l7 + 0x2F]
	srax	%g5,	0x16,	%o0
	ldd	[%l7 + 0x78],	%f6
	st	%f25,	[%l7 + 0x6C]
	nop
	set	0x6A, %g5
	ldsh	[%l7 + %g5],	%i5
	faligndata	%f6,	%f14,	%f30
	save %g3, %o4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f24,	%f0
	srlx	%l3,	0x1F,	%i4
	movpos	%icc,	%o5,	%g1
	fornot2	%f18,	%f30,	%f6
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%g7
	movre	%o6,	%o3,	%g6
	std	%f24,	[%l7 + 0x10]
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	sth	%l1,	[%l7 + 0x52]
	fmovsl	%icc,	%f24,	%f4
	edge32	%l4,	%o1,	%l6
	fexpand	%f14,	%f28
	srlx	%g4,	0x01,	%o7
	fandnot2	%f12,	%f2,	%f6
	ldub	[%l7 + 0x4E],	%i7
	sethi	0x19B5,	%l0
	edge8n	%l2,	%i6,	%i1
	sth	%l5,	[%l7 + 0x0E]
	edge32	%i3,	%o2,	%o0
	edge8n	%g5,	%i5,	%o4
	save %g3, 0x0822, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i0,	%i4,	%g1
	movgu	%icc,	%o5,	%g7
	ldd	[%l7 + 0x68],	%o6
	movgu	%icc,	%g6,	%o3
	edge32ln	%g2,	%l1,	%l4
	array16	%o1,	%l6,	%i2
	array16	%g4,	%i7,	%o7
	fmovsvc	%xcc,	%f19,	%f22
	mulx	%l0,	0x12F9,	%l2
	stw	%i6,	[%l7 + 0x60]
	array16	%i1,	%i3,	%l5
	lduh	[%l7 + 0x14],	%o2
	std	%f14,	[%l7 + 0x18]
	smul	%o0,	0x1241,	%i5
	movn	%xcc,	%g5,	%g3
	movgu	%xcc,	%o4,	%i0
	edge32n	%l3,	%i4,	%g1
	addcc	%o5,	%o6,	%g6
	fmovsl	%icc,	%f18,	%f14
	fmul8x16au	%f28,	%f22,	%f10
	array16	%o3,	%g7,	%l1
	restore %g2, 0x0ED2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%l4,	%i2,	%g4
	stb	%i7,	[%l7 + 0x59]
	udiv	%l6,	0x0380,	%o7
	fmovrdlz	%l0,	%f10,	%f18
	movg	%xcc,	%l2,	%i6
	fxor	%f30,	%f30,	%f0
	fmovdle	%icc,	%f1,	%f26
	ldub	[%l7 + 0x20],	%i3
	umul	%l5,	0x1122,	%o2
	fmovsn	%icc,	%f27,	%f12
	movvs	%xcc,	%o0,	%i1
	addcc	%g5,	%i5,	%o4
	xnor	%i0,	%l3,	%g3
	orn	%i4,	%o5,	%o6
	fmovsle	%xcc,	%f12,	%f4
	ldsw	[%l7 + 0x3C],	%g6
	ldub	[%l7 + 0x3A],	%g1
	fzeros	%f26
	orcc	%o3,	0x17DC,	%l1
	udivx	%g2,	0x1D80,	%g7
	fmovrse	%o1,	%f17,	%f14
	movrne	%i2,	%g4,	%l4
	udiv	%l6,	0x0AA7,	%i7
	udivcc	%l0,	0x0656,	%o7
	ldub	[%l7 + 0x65],	%l2
	srax	%i6,	%i3,	%l5
	array8	%o0,	%o2,	%g5
	fmovda	%xcc,	%f5,	%f9
	fmovsleu	%xcc,	%f3,	%f13
	ldsw	[%l7 + 0x34],	%i5
	edge32l	%i1,	%o4,	%i0
	movneg	%xcc,	%g3,	%i4
	addcc	%o5,	0x12E5,	%o6
	movcc	%icc,	%g6,	%l3
	movvc	%xcc,	%o3,	%l1
	array16	%g2,	%g7,	%g1
	fandnot1s	%f7,	%f9,	%f31
	ldd	[%l7 + 0x78],	%f14
	mulx	%i2,	%g4,	%o1
	alignaddr	%l4,	%i7,	%l6
	edge8n	%l0,	%l2,	%i6
	movl	%xcc,	%i3,	%o7
	edge32ln	%o0,	%l5,	%o2
	st	%f15,	[%l7 + 0x30]
	edge32l	%i5,	%g5,	%i1
	subc	%o4,	%g3,	%i0
	ldub	[%l7 + 0x1A],	%i4
	fand	%f24,	%f20,	%f18
	ldsb	[%l7 + 0x3D],	%o6
	xnorcc	%g6,	%o5,	%o3
	movn	%icc,	%l1,	%l3
	movle	%xcc,	%g7,	%g1
	movvc	%icc,	%i2,	%g4
	edge8	%o1,	%l4,	%i7
	sra	%g2,	%l0,	%l2
	edge32l	%i6,	%i3,	%l6
	ldub	[%l7 + 0x23],	%o0
	srlx	%l5,	0x17,	%o7
	srax	%i5,	%g5,	%o2
	umulcc	%o4,	0x0759,	%i1
	edge8ln	%i0,	%g3,	%i4
	fcmpeq32	%f18,	%f4,	%g6
	edge32n	%o6,	%o3,	%l1
	nop
	set	0x7A, %g4
	sth	%o5,	[%l7 + %g4]
	movgu	%xcc,	%l3,	%g1
	fcmpd	%fcc0,	%f20,	%f24
	srax	%i2,	%g4,	%g7
	fnot1	%f18,	%f12
	fnors	%f10,	%f13,	%f9
	edge8	%o1,	%l4,	%g2
	addccc	%i7,	%l0,	%l2
	orncc	%i6,	0x13F3,	%l6
	fornot2s	%f27,	%f22,	%f9
	andcc	%o0,	%l5,	%o7
	ldd	[%l7 + 0x58],	%i2
	movrlez	%i5,	%o2,	%g5
	alignaddr	%o4,	%i0,	%i1
	xorcc	%g3,	%g6,	%i4
	fpack32	%f14,	%f22,	%f0
	subccc	%o3,	0x10FD,	%o6
	edge32ln	%o5,	%l3,	%g1
	orn	%i2,	0x128E,	%g4
	ldx	[%l7 + 0x58],	%l1
	stb	%g7,	[%l7 + 0x51]
	addccc	%l4,	0x068C,	%o1
	movrlz	%g2,	0x1DD,	%i7
	fmovda	%icc,	%f11,	%f27
	fmovdl	%icc,	%f26,	%f18
	edge8l	%l2,	%l0,	%i6
	fors	%f30,	%f10,	%f22
	stw	%o0,	[%l7 + 0x10]
	fnot1s	%f19,	%f9
	stx	%l5,	[%l7 + 0x48]
	addc	%l6,	%i3,	%o7
	addccc	%i5,	0x1113,	%o2
	addccc	%g5,	%o4,	%i0
	srl	%i1,	%g3,	%i4
	stw	%g6,	[%l7 + 0x78]
	ld	[%l7 + 0x44],	%f23
	fcmpes	%fcc1,	%f17,	%f19
	fmovsgu	%xcc,	%f7,	%f5
	fmovde	%xcc,	%f11,	%f17
	addc	%o3,	0x1851,	%o6
	movle	%xcc,	%o5,	%g1
	subccc	%i2,	0x1D0D,	%l3
	ldsh	[%l7 + 0x78],	%l1
	sdivcc	%g7,	0x0576,	%l4
	xnorcc	%g4,	0x0BC0,	%g2
	array32	%i7,	%o1,	%l2
	ldd	[%l7 + 0x78],	%l0
	orncc	%o0,	0x031D,	%i6
	edge8n	%l6,	%i3,	%l5
	subcc	%i5,	0x005D,	%o2
	edge8ln	%g5,	%o4,	%o7
	edge16l	%i0,	%g3,	%i4
	andn	%i1,	%g6,	%o3
	sra	%o5,	%o6,	%i2
	popc	0x18E6,	%g1
	movle	%xcc,	%l3,	%l1
	ld	[%l7 + 0x78],	%f1
	subcc	%g7,	0x1445,	%g4
	addccc	%g2,	0x09C1,	%l4
	array32	%o1,	%l2,	%l0
	subccc	%o0,	0x04A0,	%i7
	smul	%l6,	0x1C18,	%i3
	movvs	%icc,	%l5,	%i5
	stx	%i6,	[%l7 + 0x40]
	smul	%g5,	0x06DC,	%o2
	sdivcc	%o7,	0x1ADB,	%o4
	sdiv	%g3,	0x0B34,	%i4
	fpadd32s	%f21,	%f12,	%f3
	addccc	%i1,	0x0058,	%i0
	alignaddr	%o3,	%g6,	%o5
	fmovdl	%icc,	%f10,	%f25
	srl	%o6,	0x12,	%i2
	fcmps	%fcc3,	%f14,	%f1
	movneg	%xcc,	%g1,	%l1
	udivx	%g7,	0x085F,	%l3
	sub	%g2,	%g4,	%l4
	movvs	%icc,	%l2,	%l0
	smul	%o1,	%i7,	%l6
	movcc	%icc,	%i3,	%o0
	edge32l	%i5,	%l5,	%i6
	stw	%o2,	[%l7 + 0x70]
	xorcc	%o7,	0x143F,	%g5
	movrgz	%o4,	%i4,	%i1
	alignaddrl	%i0,	%g3,	%g6
	fnot1s	%f23,	%f25
	movcc	%icc,	%o3,	%o5
	movrlz	%o6,	0x305,	%g1
	popc	0x1166,	%i2
	xnorcc	%l1,	0x0CD0,	%l3
	sth	%g7,	[%l7 + 0x52]
	fabss	%f5,	%f29
	ldx	[%l7 + 0x38],	%g4
	fmovsg	%xcc,	%f27,	%f5
	andcc	%g2,	%l2,	%l0
	sdivx	%o1,	0x05D6,	%i7
	sdivx	%l4,	0x1FE1,	%l6
	movrlez	%o0,	0x3FF,	%i3
	movre	%l5,	%i6,	%o2
	subccc	%i5,	%g5,	%o4
	fcmpes	%fcc0,	%f21,	%f19
	ldd	[%l7 + 0x50],	%o6
	movvs	%icc,	%i1,	%i0
	xnorcc	%i4,	0x0C0E,	%g6
	fpsub16s	%f11,	%f9,	%f26
	edge8l	%g3,	%o5,	%o6
	fcmple16	%f26,	%f28,	%o3
	fmovdvc	%xcc,	%f31,	%f29
	sth	%g1,	[%l7 + 0x4A]
	fmovsvc	%icc,	%f6,	%f23
	orncc	%l1,	%i2,	%g7
	orncc	%g4,	0x17E6,	%l3
	popc	%l2,	%l0
	fcmple16	%f14,	%f28,	%o1
	fnand	%f6,	%f4,	%f22
	fmovsleu	%xcc,	%f15,	%f2
	movvc	%icc,	%i7,	%l4
	edge8n	%g2,	%l6,	%o0
	lduh	[%l7 + 0x2C],	%i3
	sub	%l5,	0x059F,	%o2
	addc	%i5,	%i6,	%g5
	edge8	%o4,	%o7,	%i1
	save %i4, %i0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o5,	%o6,	%g6
	edge16n	%o3,	%l1,	%g1
	edge32l	%i2,	%g4,	%l3
	edge8ln	%g7,	%l0,	%o1
	ld	[%l7 + 0x50],	%f29
	orcc	%i7,	0x0ECA,	%l2
	fpsub16	%f26,	%f22,	%f6
	movge	%xcc,	%g2,	%l6
	lduh	[%l7 + 0x5C],	%o0
	sub	%i3,	%l5,	%o2
	andcc	%i5,	%l4,	%i6
	st	%f0,	[%l7 + 0x60]
	fpsub16	%f6,	%f30,	%f20
	xnorcc	%o4,	0x1491,	%g5
	udivx	%o7,	0x1056,	%i1
	andncc	%i0,	%i4,	%o5
	edge8l	%g3,	%o6,	%o3
	ldub	[%l7 + 0x3F],	%l1
	movge	%icc,	%g1,	%i2
	fsrc2	%f8,	%f6
	srlx	%g6,	0x16,	%g4
	fmovdg	%icc,	%f21,	%f5
	ldd	[%l7 + 0x30],	%f8
	udiv	%g7,	0x1D76,	%l0
	ldd	[%l7 + 0x08],	%l2
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	faligndata	%f12,	%f28,	%f4
	edge32	%l6,	%o1,	%i3
	sub	%o0,	%l5,	%o2
	fors	%f5,	%f13,	%f13
	andn	%l4,	%i6,	%i5
	edge16ln	%o4,	%o7,	%g5
	sra	%i0,	%i1,	%o5
	ldub	[%l7 + 0x32],	%i4
	edge16	%g3,	%o3,	%o6
	fmovrslz	%g1,	%f2,	%f2
	movrgez	%i2,	0x271,	%g6
	sdivcc	%g4,	0x076A,	%l1
	sir	0x1E5B
	sll	%l0,	0x15,	%l3
	addccc	%i7,	%l2,	%g2
	ldsh	[%l7 + 0x36],	%g7
	andcc	%o1,	%i3,	%o0
	subcc	%l6,	%o2,	%l5
	fmovspos	%xcc,	%f28,	%f15
	sth	%i6,	[%l7 + 0x76]
	ldsw	[%l7 + 0x4C],	%l4
	fmovde	%xcc,	%f18,	%f28
	movrgez	%o4,	0x383,	%o7
	movvs	%icc,	%i5,	%i0
	movl	%xcc,	%g5,	%o5
	or	%i4,	%i1,	%o3
	fmovscc	%xcc,	%f31,	%f3
	sir	0x07DC
	save %g3, 0x0800, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o6,	%i2,	%g6
	edge8n	%g4,	%l1,	%l0
	mova	%icc,	%l3,	%i7
	movneg	%icc,	%g2,	%l2
	sll	%o1,	%i3,	%o0
	fpack16	%f24,	%f27
	st	%f0,	[%l7 + 0x40]
	sdivx	%g7,	0x06A6,	%l6
	subccc	%l5,	%i6,	%l4
	udiv	%o4,	0x0077,	%o2
	sll	%o7,	%i5,	%g5
	sethi	0x0FC5,	%o5
	ldsw	[%l7 + 0x40],	%i0
	xor	%i4,	0x1664,	%o3
	fsrc1	%f10,	%f18
	mulx	%i1,	%g1,	%o6
	add	%i2,	%g3,	%g4
	fcmpgt32	%f6,	%f16,	%l1
	srl	%l0,	0x17,	%l3
	array32	%i7,	%g6,	%g2
	movneg	%icc,	%o1,	%l2
	udivx	%o0,	0x10C3,	%g7
	array8	%i3,	%l6,	%i6
	orn	%l4,	0x015D,	%o4
	ldx	[%l7 + 0x60],	%o2
	movne	%xcc,	%l5,	%i5
	movrgez	%o7,	%g5,	%i0
	fexpand	%f11,	%f0
	movgu	%icc,	%o5,	%i4
	andn	%o3,	0x0949,	%g1
	add	%o6,	0x0CE4,	%i1
	movrlz	%g3,	0x150,	%i2
	orn	%g4,	%l1,	%l3
	array8	%l0,	%g6,	%g2
	fxnors	%f12,	%f8,	%f8
	movrgez	%o1,	%i7,	%o0
	movrgz	%g7,	0x1C5,	%l2
	andncc	%l6,	%i3,	%i6
	alignaddrl	%l4,	%o4,	%o2
	xorcc	%i5,	0x0A87,	%l5
	sub	%g5,	%i0,	%o7
	sth	%i4,	[%l7 + 0x18]
	movvc	%icc,	%o3,	%o5
	subccc	%o6,	%i1,	%g3
	array8	%g1,	%g4,	%i2
	ld	[%l7 + 0x28],	%f29
	sir	0x0317
	sir	0x1B1B
	stb	%l1,	[%l7 + 0x22]
	fmovscc	%xcc,	%f2,	%f13
	edge16ln	%l3,	%g6,	%l0
	ldsh	[%l7 + 0x5A],	%o1
	add	%g2,	0x17F4,	%o0
	sdiv	%g7,	0x1D6B,	%i7
	sll	%l2,	%l6,	%i3
	edge16l	%l4,	%i6,	%o4
	fmovsa	%icc,	%f23,	%f24
	fmovspos	%icc,	%f1,	%f17
	andcc	%i5,	0x0063,	%o2
	srlx	%l5,	0x01,	%g5
	fcmpgt32	%f28,	%f16,	%o7
	ldsb	[%l7 + 0x2E],	%i0
	lduh	[%l7 + 0x78],	%i4
	fnot2	%f28,	%f22
	and	%o3,	0x19C9,	%o6
	movre	%i1,	%o5,	%g3
	addccc	%g1,	%i2,	%g4
	fones	%f13
	edge32	%l3,	%g6,	%l1
	fmuld8ulx16	%f28,	%f28,	%f10
	move	%xcc,	%l0,	%g2
	edge16	%o1,	%g7,	%i7
	xor	%l2,	0x14A2,	%o0
	edge8l	%l6,	%l4,	%i3
	ldsb	[%l7 + 0x68],	%i6
	andncc	%i5,	%o2,	%o4
	mulx	%l5,	0x0373,	%o7
	sll	%g5,	0x00,	%i0
	fmul8ulx16	%f2,	%f14,	%f14
	smul	%o3,	%i4,	%i1
	edge8	%o5,	%g3,	%g1
	udivx	%i2,	0x0F9C,	%o6
	movrlez	%l3,	%g4,	%l1
	fornot2s	%f7,	%f6,	%f21
	srax	%l0,	%g6,	%o1
	fsrc1s	%f30,	%f7
	orn	%g2,	0x1F98,	%i7
	movrlz	%g7,	0x308,	%o0
	fxors	%f12,	%f1,	%f26
	xnor	%l6,	0x1ACB,	%l4
	movpos	%xcc,	%l2,	%i6
	fmovsle	%xcc,	%f11,	%f0
	sir	0x1970
	movl	%xcc,	%i3,	%i5
	movle	%xcc,	%o2,	%l5
	orncc	%o4,	%o7,	%g5
	array8	%i0,	%i4,	%o3
	movgu	%icc,	%o5,	%i1
	fmovdcs	%xcc,	%f1,	%f14
	edge8	%g3,	%g1,	%o6
	ld	[%l7 + 0x4C],	%f28
	fmovscc	%xcc,	%f13,	%f1
	sdiv	%i2,	0x0032,	%g4
	addccc	%l3,	%l1,	%l0
	alignaddr	%g6,	%g2,	%o1
	fmovsle	%xcc,	%f0,	%f9
	bshuffle	%f26,	%f24,	%f2
	fones	%f12
	srax	%g7,	0x16,	%i7
	stb	%o0,	[%l7 + 0x75]
	subccc	%l6,	%l2,	%l4
	udivcc	%i6,	0x026C,	%i5
	st	%f3,	[%l7 + 0x14]
	fand	%f10,	%f16,	%f18
	fmovdcc	%xcc,	%f7,	%f10
	sra	%i3,	%l5,	%o2
	fandnot1	%f10,	%f28,	%f10
	fmul8sux16	%f20,	%f8,	%f10
	fpadd16	%f6,	%f4,	%f12
	movpos	%xcc,	%o7,	%o4
	add	%g5,	0x1DA0,	%i4
	movpos	%xcc,	%i0,	%o3
	edge16	%i1,	%o5,	%g3
	movrlez	%o6,	%i2,	%g4
	save %g1, 0x0313, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l0,	%g6
	ldub	[%l7 + 0x52],	%g2
	movrgz	%l1,	0x12C,	%o1
	movrlz	%i7,	%o0,	%g7
	nop
	set	0x50, %i1
	ldsh	[%l7 + %i1],	%l6
	umul	%l2,	%l4,	%i5
	fmovspos	%xcc,	%f15,	%f5
	andn	%i3,	%i6,	%l5
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%o2
	edge32ln	%o4,	%o7,	%g5
	alignaddrl	%i4,	%o3,	%i1
	ld	[%l7 + 0x3C],	%f3
	for	%f26,	%f16,	%f30
	xnorcc	%o5,	%g3,	%i0
	ldx	[%l7 + 0x20],	%o6
	edge16	%g4,	%g1,	%l3
	fcmpeq16	%f30,	%f12,	%l0
	fones	%f29
	fcmpne16	%f18,	%f12,	%g6
	alignaddr	%i2,	%g2,	%l1
	movle	%xcc,	%i7,	%o0
	fcmpes	%fcc1,	%f4,	%f4
	smulcc	%g7,	0x1AB2,	%l6
	srax	%l2,	%l4,	%i5
	smulcc	%i3,	%o1,	%l5
	sir	0x0CD0
	array16	%o2,	%i6,	%o4
	nop
	set	0x50, %o0
	stx	%g5,	[%l7 + %o0]
	fornot1s	%f21,	%f17,	%f1
	umul	%o7,	%o3,	%i1
	fmovda	%icc,	%f14,	%f6
	edge16n	%o5,	%g3,	%i4
	ldd	[%l7 + 0x10],	%o6
	nop
	set	0x50, %i7
	ldd	[%l7 + %i7],	%f12
	andcc	%g4,	0x0052,	%g1
	udivcc	%i0,	0x1322,	%l3
	ldsh	[%l7 + 0x52],	%g6
	edge32ln	%l0,	%g2,	%l1
	subcc	%i7,	0x0D95,	%i2
	fnot1	%f26,	%f30
	fcmpne16	%f22,	%f16,	%g7
	smul	%o0,	0x0BCF,	%l2
	mulx	%l6,	0x017C,	%i5
	fmovde	%xcc,	%f26,	%f14
	sra	%l4,	0x13,	%o1
	udivcc	%l5,	0x18AE,	%i3
	edge16l	%i6,	%o2,	%g5
	lduw	[%l7 + 0x1C],	%o7
	sdiv	%o3,	0x1786,	%i1
	sub	%o4,	%o5,	%g3
	fandnot1	%f26,	%f28,	%f14
	movleu	%icc,	%i4,	%o6
	edge16l	%g4,	%g1,	%l3
	udiv	%i0,	0x0C4A,	%l0
	fpsub16	%f22,	%f8,	%f6
	ldd	[%l7 + 0x50],	%f24
	movl	%icc,	%g6,	%g2
	pdist	%f2,	%f12,	%f8
	fandnot2	%f16,	%f20,	%f8
	movpos	%icc,	%i7,	%i2
	sll	%g7,	%o0,	%l2
	fxnors	%f28,	%f14,	%f24
	fmovdle	%xcc,	%f13,	%f24
	movleu	%xcc,	%l6,	%l1
	udivx	%l4,	0x0A16,	%o1
	edge32l	%l5,	%i5,	%i3
	ldsh	[%l7 + 0x4A],	%o2
	fxnors	%f31,	%f30,	%f3
	edge16l	%g5,	%i6,	%o3
	mova	%xcc,	%i1,	%o7
	sdivcc	%o4,	0x0497,	%o5
	sra	%g3,	%o6,	%g4
	smul	%i4,	0x0AC1,	%g1
	lduw	[%l7 + 0x1C],	%i0
	mova	%icc,	%l0,	%g6
	ldd	[%l7 + 0x20],	%f14
	sir	0x16BC
	ldsh	[%l7 + 0x6A],	%g2
	sll	%i7,	0x05,	%i2
	st	%f20,	[%l7 + 0x68]
	popc	0x1B82,	%g7
	edge8n	%l3,	%l2,	%l6
	umulcc	%l1,	%l4,	%o1
	smulcc	%l5,	%o0,	%i5
	addcc	%o2,	%i3,	%g5
	edge32l	%i6,	%o3,	%o7
	sub	%o4,	%i1,	%g3
	fpack32	%f18,	%f8,	%f24
	fmuld8ulx16	%f14,	%f15,	%f6
	fxnor	%f18,	%f2,	%f14
	ldd	[%l7 + 0x20],	%o6
	nop
	set	0x38, %l0
	lduw	[%l7 + %l0],	%o5
	fnot1	%f16,	%f30
	fornot2s	%f25,	%f1,	%f29
	movneg	%xcc,	%i4,	%g4
	fmovdpos	%icc,	%f4,	%f5
	addcc	%i0,	%l0,	%g6
	srlx	%g1,	0x1A,	%g2
	edge16ln	%i7,	%g7,	%i2
	alignaddrl	%l3,	%l6,	%l2
	umulcc	%l4,	0x01CC,	%o1
	smul	%l1,	%l5,	%i5
	and	%o0,	%o2,	%i3
	lduw	[%l7 + 0x38],	%i6
	sth	%o3,	[%l7 + 0x5C]
	xorcc	%o7,	0x0BC9,	%g5
	xorcc	%o4,	%g3,	%i1
	mulscc	%o5,	0x0FD0,	%i4
	stw	%o6,	[%l7 + 0x78]
	sdivx	%g4,	0x0AED,	%l0
	fcmpne16	%f4,	%f8,	%g6
	fands	%f10,	%f22,	%f7
	std	%f8,	[%l7 + 0x50]
	alignaddrl	%i0,	%g2,	%g1
	movpos	%icc,	%i7,	%i2
	sdivcc	%g7,	0x1C47,	%l6
	movl	%xcc,	%l2,	%l4
	fxor	%f20,	%f0,	%f2
	ldub	[%l7 + 0x38],	%o1
	fones	%f6
	addccc	%l1,	%l5,	%i5
	lduh	[%l7 + 0x2E],	%l3
	fmovdgu	%icc,	%f27,	%f9
	movneg	%xcc,	%o0,	%o2
	fmovdcs	%xcc,	%f19,	%f30
	ldsb	[%l7 + 0x0E],	%i6
	movcs	%xcc,	%o3,	%o7
	ldsb	[%l7 + 0x12],	%g5
	edge32	%i3,	%o4,	%g3
	fandnot2	%f4,	%f26,	%f26
	movcc	%icc,	%i1,	%o5
	xnorcc	%o6,	%g4,	%i4
	fnegs	%f9,	%f20
	udiv	%g6,	0x1933,	%i0
	addc	%g2,	%l0,	%i7
	movpos	%icc,	%g1,	%g7
	edge8ln	%l6,	%i2,	%l4
	add	%o1,	0x1D56,	%l1
	nop
	set	0x70, %i2
	ldd	[%l7 + %i2],	%f18
	movrlz	%l2,	%i5,	%l3
	movre	%l5,	0x09C,	%o0
	edge8n	%i6,	%o3,	%o2
	ldx	[%l7 + 0x78],	%g5
	alignaddr	%i3,	%o4,	%o7
	edge16ln	%g3,	%o5,	%i1
	subcc	%o6,	0x0232,	%i4
	lduh	[%l7 + 0x76],	%g6
	edge32n	%g4,	%i0,	%g2
	ldd	[%l7 + 0x68],	%l0
	movle	%xcc,	%i7,	%g1
	fmovsvc	%icc,	%f1,	%f2
	stb	%l6,	[%l7 + 0x3E]
	fmovdpos	%icc,	%f12,	%f12
	movvc	%xcc,	%i2,	%l4
	fsrc1s	%f13,	%f30
	popc	%g7,	%o1
	edge16l	%l2,	%l1,	%i5
	edge32l	%l3,	%o0,	%i6
	edge16ln	%l5,	%o2,	%g5
	sir	0x0624
	movgu	%icc,	%o3,	%o4
	popc	%o7,	%i3
	srax	%o5,	0x01,	%g3
	movrgez	%o6,	%i4,	%g6
	movneg	%icc,	%g4,	%i1
	nop
	set	0x40, %o1
	ldx	[%l7 + %o1],	%i0
	fmovsgu	%icc,	%f8,	%f8
	or	%l0,	0x1C35,	%i7
	xor	%g2,	0x0DCA,	%g1
	orcc	%l6,	%i2,	%l4
	edge8n	%o1,	%l2,	%l1
	movleu	%xcc,	%i5,	%g7
	sdivcc	%o0,	0x1372,	%l3
	fandnot1s	%f3,	%f28,	%f8
	addc	%i6,	%l5,	%o2
	fnors	%f19,	%f13,	%f15
	fandnot1s	%f22,	%f25,	%f6
	udiv	%g5,	0x15F6,	%o4
	edge32n	%o7,	%o3,	%o5
	ldsh	[%l7 + 0x52],	%g3
	movrgz	%o6,	%i3,	%g6
	edge8n	%i4,	%g4,	%i1
	fnot2s	%f24,	%f5
	mulx	%l0,	0x096C,	%i7
	edge16l	%i0,	%g2,	%l6
	movl	%icc,	%i2,	%g1
	udivx	%l4,	0x1CB0,	%o1
	fpadd16s	%f19,	%f9,	%f7
	edge32l	%l1,	%l2,	%g7
	fmovdl	%xcc,	%f21,	%f23
	movl	%xcc,	%o0,	%i5
	edge16	%i6,	%l5,	%o2
	fmovdleu	%icc,	%f24,	%f28
	udiv	%l3,	0x0DF3,	%o4
	mulscc	%o7,	0x02F6,	%g5
	srlx	%o3,	%g3,	%o6
	fnot1s	%f0,	%f1
	fmovdg	%icc,	%f22,	%f27
	movleu	%xcc,	%i3,	%g6
	fmovrdgz	%o5,	%f4,	%f4
	fandnot1s	%f10,	%f21,	%f15
	ldsb	[%l7 + 0x76],	%i4
	subccc	%g4,	0x177F,	%i1
	edge16n	%l0,	%i0,	%i7
	movrgz	%g2,	%l6,	%g1
	fmuld8ulx16	%f3,	%f26,	%f18
	st	%f0,	[%l7 + 0x4C]
	ld	[%l7 + 0x2C],	%f10
	movrgz	%i2,	0x23E,	%o1
	fmovsleu	%xcc,	%f2,	%f21
	ldub	[%l7 + 0x33],	%l1
	movne	%xcc,	%l2,	%g7
	fcmpd	%fcc2,	%f24,	%f2
	xnor	%l4,	0x08ED,	%i5
	alignaddrl	%o0,	%i6,	%l5
	stw	%l3,	[%l7 + 0x70]
	srl	%o4,	%o2,	%g5
	movrlz	%o3,	%g3,	%o6
	sllx	%o7,	0x0C,	%g6
	array32	%i3,	%o5,	%i4
	addc	%i1,	0x168A,	%l0
	subc	%i0,	0x0485,	%i7
	edge32n	%g4,	%g2,	%g1
	edge32	%l6,	%i2,	%l1
	stx	%o1,	[%l7 + 0x60]
	nop
	set	0x1C, %o6
	ldsw	[%l7 + %o6],	%g7
	udiv	%l4,	0x1E04,	%l2
	subcc	%o0,	0x0151,	%i6
	fxor	%f2,	%f24,	%f14
	ldx	[%l7 + 0x78],	%i5
	movcc	%xcc,	%l5,	%l3
	or	%o2,	0x1ECC,	%g5
	st	%f29,	[%l7 + 0x50]
	sdivx	%o4,	0x0494,	%g3
	movrlz	%o3,	0x3CD,	%o7
	sdivcc	%o6,	0x120B,	%i3
	and	%o5,	%g6,	%i1
	edge32	%i4,	%i0,	%i7
	andcc	%l0,	0x1461,	%g2
	smul	%g4,	%l6,	%i2
	fones	%f13
	movre	%l1,	0x32A,	%g1
	mova	%icc,	%o1,	%l4
	fmovde	%icc,	%f22,	%f26
	xorcc	%l2,	%o0,	%g7
	save %i6, 0x1DE6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i5,	%l3
	movle	%xcc,	%g5,	%o2
	nop
	set	0x24, %l2
	ldsw	[%l7 + %l2],	%o4
	fnot2	%f20,	%f16
	restore %o3, 0x0D6B, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o6,	%i3,	%o5
	movvs	%icc,	%g6,	%o7
	movrne	%i1,	%i0,	%i7
	movne	%icc,	%i4,	%g2
	sllx	%g4,	%l0,	%i2
	edge32l	%l1,	%g1,	%o1
	mova	%xcc,	%l4,	%l2
	sir	0x1007
	udivx	%l6,	0x013F,	%o0
	fors	%f10,	%f28,	%f26
	edge16ln	%g7,	%i6,	%i5
	edge16	%l5,	%g5,	%o2
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	movge	%xcc,	%l3,	%o6
	mulx	%i3,	%g6,	%o5
	movge	%icc,	%o7,	%i1
	fmovsl	%xcc,	%f2,	%f12
	edge16ln	%i0,	%i4,	%i7
	sub	%g2,	0x18AD,	%g4
	smul	%i2,	0x1828,	%l1
	addccc	%l0,	%g1,	%o1
	movrgz	%l2,	%l4,	%o0
	edge16	%g7,	%l6,	%i5
	andn	%l5,	0x145C,	%i6
	fpsub32	%f0,	%f2,	%f24
	movle	%icc,	%o2,	%o4
	array32	%g5,	%o3,	%l3
	save %g3, 0x1683, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g6,	%i3,	%o7
	ldsw	[%l7 + 0x74],	%i1
	andncc	%i0,	%o5,	%i7
	edge8	%g2,	%i4,	%g4
	lduh	[%l7 + 0x3E],	%l1
	fmovscs	%icc,	%f1,	%f19
	movgu	%xcc,	%l0,	%i2
	edge8ln	%g1,	%l2,	%o1
	movrne	%o0,	%l4,	%l6
	array32	%g7,	%l5,	%i6
	fcmpne32	%f22,	%f14,	%i5
	mulscc	%o2,	%o4,	%o3
	xor	%g5,	0x15DF,	%l3
	movl	%icc,	%g3,	%o6
	alignaddr	%i3,	%o7,	%g6
	edge8l	%i0,	%i1,	%i7
	fones	%f29
	fand	%f2,	%f20,	%f30
	movneg	%xcc,	%g2,	%i4
	umul	%o5,	0x1285,	%l1
	fsrc1	%f16,	%f12
	xor	%g4,	%i2,	%g1
	xnorcc	%l0,	0x0181,	%l2
	array16	%o1,	%o0,	%l6
	edge32n	%l4,	%g7,	%l5
	fcmped	%fcc2,	%f22,	%f18
	andncc	%i6,	%o2,	%i5
	fpadd32	%f8,	%f10,	%f6
	fmul8x16al	%f8,	%f22,	%f12
	alignaddr	%o4,	%g5,	%o3
	edge16ln	%l3,	%o6,	%g3
	ld	[%l7 + 0x10],	%f12
	edge16	%o7,	%g6,	%i0
	and	%i1,	%i3,	%i7
	edge16n	%i4,	%o5,	%l1
	movvc	%icc,	%g4,	%i2
	mulscc	%g2,	%l0,	%g1
	movne	%xcc,	%l2,	%o0
	udiv	%l6,	0x1DBF,	%o1
	fmovsa	%xcc,	%f8,	%f1
	sth	%l4,	[%l7 + 0x0A]
	sub	%l5,	%i6,	%o2
	edge32n	%g7,	%o4,	%g5
	edge16ln	%o3,	%l3,	%o6
	smulcc	%g3,	%o7,	%g6
	mulx	%i0,	0x027B,	%i1
	smul	%i3,	%i5,	%i4
	stw	%o5,	[%l7 + 0x0C]
	movgu	%icc,	%l1,	%g4
	fmovs	%f31,	%f3
	sth	%i2,	[%l7 + 0x12]
	mova	%xcc,	%i7,	%l0
	fpackfix	%f8,	%f23
	stw	%g2,	[%l7 + 0x44]
	movrgz	%g1,	0x1EA,	%l2
	movgu	%icc,	%l6,	%o0
	fmovrdgez	%l4,	%f30,	%f10
	andncc	%l5,	%o1,	%o2
	subccc	%i6,	0x16AA,	%o4
	andcc	%g7,	%o3,	%g5
	sethi	0x0450,	%l3
	edge32l	%o6,	%o7,	%g3
	edge8ln	%i0,	%i1,	%i3
	movn	%icc,	%g6,	%i4
	fsrc2	%f18,	%f26
	fmul8x16au	%f0,	%f12,	%f22
	fpadd32	%f10,	%f30,	%f14
	movle	%icc,	%i5,	%o5
	movleu	%xcc,	%g4,	%l1
	udivx	%i2,	0x1A69,	%l0
	xnor	%g2,	0x0CAE,	%i7
	srl	%g1,	%l6,	%o0
	smulcc	%l4,	%l2,	%l5
	fpadd16	%f30,	%f8,	%f20
	andncc	%o1,	%i6,	%o4
	orncc	%o2,	0x1819,	%g7
	fzero	%f20
	fandnot2s	%f11,	%f20,	%f20
	fcmpgt16	%f4,	%f10,	%o3
	ldd	[%l7 + 0x38],	%f16
	fnot2s	%f2,	%f11
	restore %g5, 0x1FFE, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o7,	0x0849,	%g3
	movrlz	%i0,	0x15C,	%i1
	movcs	%icc,	%i3,	%o6
	alignaddrl	%g6,	%i4,	%i5
	ldub	[%l7 + 0x3C],	%o5
	movre	%g4,	%l1,	%l0
	stx	%g2,	[%l7 + 0x68]
	movneg	%icc,	%i7,	%i2
	fors	%f11,	%f19,	%f1
	edge16	%g1,	%l6,	%o0
	fcmpne16	%f22,	%f26,	%l2
	lduw	[%l7 + 0x08],	%l4
	movneg	%xcc,	%l5,	%i6
	sub	%o1,	0x055C,	%o4
	faligndata	%f0,	%f10,	%f10
	orcc	%o2,	0x17CC,	%o3
	sth	%g5,	[%l7 + 0x6E]
	or	%g7,	0x1150,	%l3
	ldsw	[%l7 + 0x40],	%o7
	sub	%i0,	%g3,	%i1
	xor	%o6,	0x0870,	%i3
	orcc	%g6,	%i4,	%o5
	or	%g4,	0x06F6,	%i5
	xnor	%l0,	0x11C7,	%l1
	orncc	%g2,	0x1018,	%i2
	mova	%xcc,	%g1,	%i7
	smulcc	%l6,	0x1E67,	%l2
	edge8ln	%l4,	%o0,	%i6
	andcc	%l5,	%o1,	%o4
	edge32	%o2,	%o3,	%g7
	umulcc	%l3,	%g5,	%o7
	nop
	set	0x70, %l3
	lduw	[%l7 + %l3],	%i0
	and	%i1,	%o6,	%i3
	addcc	%g3,	%g6,	%o5
	movneg	%icc,	%g4,	%i5
	stw	%i4,	[%l7 + 0x0C]
	nop
	set	0x5C, %l5
	lduw	[%l7 + %l5],	%l0
	orncc	%g2,	0x1AEF,	%l1
	fmuld8ulx16	%f12,	%f18,	%f16
	sllx	%i2,	%i7,	%g1
	movrgz	%l6,	%l4,	%l2
	fxor	%f18,	%f0,	%f10
	movpos	%icc,	%i6,	%o0
	fcmple32	%f14,	%f22,	%l5
	addcc	%o1,	0x11C7,	%o2
	ldsh	[%l7 + 0x2A],	%o4
	fmovd	%f18,	%f20
	movrlez	%g7,	%l3,	%o3
	move	%icc,	%o7,	%g5
	movge	%icc,	%i0,	%i1
	fmovrslez	%i3,	%f12,	%f11
	sdiv	%o6,	0x0747,	%g6
	fmovdleu	%icc,	%f25,	%f20
	fnands	%f1,	%f7,	%f4
	st	%f19,	[%l7 + 0x68]
	ldsh	[%l7 + 0x1E],	%g3
	ldsb	[%l7 + 0x29],	%g4
	movrlez	%i5,	%i4,	%l0
	fmul8ulx16	%f18,	%f14,	%f2
	alignaddrl	%g2,	%o5,	%i2
	srlx	%l1,	0x02,	%g1
	movn	%icc,	%l6,	%l4
	movcc	%xcc,	%l2,	%i7
	sir	0x189B
	movle	%icc,	%i6,	%l5
	nop
	set	0x20, %l1
	ldd	[%l7 + %l1],	%o0
	alignaddrl	%o1,	%o2,	%o4
	movvs	%icc,	%g7,	%l3
	sethi	0x1480,	%o3
	sth	%o7,	[%l7 + 0x36]
	fzeros	%f24
	save %g5, 0x0306, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i1,	%i3,	%g6
	smul	%o6,	0x11B5,	%g3
	stx	%i5,	[%l7 + 0x78]
	andncc	%g4,	%l0,	%i4
	edge32	%g2,	%o5,	%i2
	fmovrdgez	%g1,	%f0,	%f26
	sdivx	%l6,	0x1285,	%l4
	umul	%l2,	%i7,	%i6
	fmovdcc	%icc,	%f14,	%f7
	nop
	set	0x3E, %g1
	sth	%l1,	[%l7 + %g1]
	fnot1s	%f21,	%f2
	sll	%o0,	%o1,	%l5
	orncc	%o2,	0x0A31,	%o4
	fmovsleu	%xcc,	%f26,	%f27
	movl	%xcc,	%l3,	%o3
	orncc	%g7,	%o7,	%i0
	and	%i1,	0x0E3F,	%i3
	sll	%g5,	%g6,	%g3
	movrlez	%i5,	%o6,	%g4
	fmul8ulx16	%f22,	%f16,	%f20
	fcmple16	%f24,	%f0,	%l0
	fornot1s	%f30,	%f11,	%f6
	xor	%i4,	%o5,	%i2
	subc	%g1,	%g2,	%l6
	edge8l	%l4,	%i7,	%i6
	st	%f29,	[%l7 + 0x5C]
	udivcc	%l1,	0x0ABD,	%l2
	movvs	%icc,	%o0,	%l5
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fornot2s	%f9,	%f17,	%f8
	movle	%xcc,	%o3,	%g7
	udivcc	%o1,	0x118E,	%o7
	edge32ln	%i1,	%i0,	%g5
	fpadd32s	%f31,	%f8,	%f18
	umulcc	%g6,	%i3,	%i5
	sllx	%g3,	%o6,	%g4
	lduh	[%l7 + 0x2E],	%i4
	array8	%l0,	%i2,	%g1
	fmovrde	%g2,	%f12,	%f24
	edge32ln	%o5,	%l6,	%i7
	movrlz	%i6,	%l4,	%l1
	ldsh	[%l7 + 0x24],	%o0
	ldd	[%l7 + 0x18],	%f4
	ldd	[%l7 + 0x78],	%l4
	movn	%icc,	%o2,	%o4
	ldub	[%l7 + 0x3F],	%l2
	array8	%o3,	%g7,	%l3
	edge32l	%o1,	%o7,	%i1
	or	%i0,	0x1B85,	%g6
	sir	0x0132
	movg	%icc,	%i3,	%i5
	movre	%g5,	%o6,	%g4
	edge32n	%i4,	%l0,	%i2
	umulcc	%g1,	%g2,	%o5
	ldx	[%l7 + 0x48],	%l6
	mova	%icc,	%g3,	%i6
	fmovsleu	%icc,	%f14,	%f27
	sethi	0x06D6,	%l4
	fmuld8ulx16	%f12,	%f14,	%f26
	ldd	[%l7 + 0x58],	%l0
	udiv	%i7,	0x0FAD,	%o0
	edge16n	%l5,	%o4,	%o2
	sllx	%l2,	%o3,	%l3
	alignaddrl	%o1,	%o7,	%i1
	movcc	%xcc,	%i0,	%g7
	sethi	0x1DA9,	%i3
	movn	%icc,	%g6,	%i5
	movrgz	%g5,	0x16F,	%g4
	and	%i4,	%o6,	%l0
	srax	%i2,	0x1C,	%g2
	subccc	%o5,	0x1304,	%l6
	movpos	%xcc,	%g3,	%i6
	fcmpne32	%f30,	%f4,	%l4
	orn	%l1,	%i7,	%g1
	fsrc2	%f26,	%f18
	movcc	%icc,	%o0,	%o4
	save %o2, 0x0588, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o3,	%l5,	%o1
	andcc	%l3,	%i1,	%o7
	xorcc	%i0,	%i3,	%g6
	movgu	%icc,	%i5,	%g7
	mulscc	%g5,	0x0E9F,	%i4
	udivcc	%o6,	0x18F9,	%g4
	edge16ln	%l0,	%g2,	%o5
	edge8ln	%i2,	%l6,	%g3
	edge8n	%i6,	%l1,	%l4
	array16	%i7,	%g1,	%o0
	sdivx	%o2,	0x1F53,	%l2
	edge32ln	%o3,	%o4,	%o1
	subc	%l3,	0x1D49,	%i1
	fsrc2s	%f4,	%f9
	stx	%o7,	[%l7 + 0x78]
	fmovrslz	%i0,	%f22,	%f8
	movvc	%xcc,	%i3,	%l5
	std	%f22,	[%l7 + 0x28]
	edge32l	%i5,	%g6,	%g7
	movge	%icc,	%i4,	%g5
	alignaddrl	%o6,	%l0,	%g4
	popc	%o5,	%i2
	sdiv	%g2,	0x0E50,	%l6
	edge32ln	%i6,	%l1,	%g3
	array8	%l4,	%g1,	%o0
	movleu	%xcc,	%o2,	%l2
	array32	%o3,	%i7,	%o4
	fornot2	%f24,	%f8,	%f0
	ld	[%l7 + 0x5C],	%f12
	umul	%l3,	0x1FA6,	%o1
	save %i1, %i0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x20],	%l5
	sra	%o7,	%g6,	%i5
	or	%g7,	0x0329,	%i4
	fmovde	%xcc,	%f28,	%f20
	mulscc	%o6,	0x029D,	%l0
	bshuffle	%f30,	%f6,	%f16
	movvs	%icc,	%g5,	%g4
	edge8n	%i2,	%g2,	%l6
	movre	%i6,	%l1,	%g3
	stb	%o5,	[%l7 + 0x14]
	sir	0x1F62
	ldd	[%l7 + 0x48],	%g0
	udiv	%l4,	0x15B3,	%o2
	ldsb	[%l7 + 0x44],	%l2
	fxor	%f28,	%f24,	%f2
	pdist	%f14,	%f22,	%f0
	fmovrdgez	%o3,	%f26,	%f10
	movpos	%icc,	%o0,	%i7
	bshuffle	%f14,	%f18,	%f4
	edge16l	%o4,	%o1,	%i1
	edge32ln	%l3,	%i3,	%l5
	stw	%i0,	[%l7 + 0x38]
	fpsub32	%f14,	%f16,	%f12
	add	%o7,	0x03C1,	%i5
	movg	%xcc,	%g7,	%g6
	xnorcc	%i4,	%o6,	%l0
	fmovsleu	%xcc,	%f26,	%f15
	fmovspos	%icc,	%f1,	%f2
	ldx	[%l7 + 0x38],	%g4
	popc	%i2,	%g5
	fmovdle	%xcc,	%f8,	%f25
	ldsw	[%l7 + 0x68],	%g2
	and	%l6,	%l1,	%i6
	movrgez	%o5,	%g3,	%g1
	orncc	%o2,	%l2,	%o3
	movneg	%xcc,	%o0,	%i7
	save %o4, %l4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x20],	%l3
	stw	%i3,	[%l7 + 0x64]
	sir	0x1207
	edge8l	%l5,	%o1,	%o7
	movpos	%xcc,	%i5,	%i0
	movle	%xcc,	%g7,	%i4
	subc	%g6,	%o6,	%l0
	lduw	[%l7 + 0x78],	%i2
	edge16ln	%g5,	%g2,	%l6
	edge32ln	%l1,	%i6,	%o5
	movrlez	%g4,	%g1,	%g3
	fcmpne16	%f14,	%f20,	%l2
	edge32ln	%o2,	%o0,	%o3
	movneg	%icc,	%o4,	%i7
	fmovsn	%icc,	%f12,	%f7
	mova	%xcc,	%i1,	%l4
	stx	%l3,	[%l7 + 0x30]
	st	%f16,	[%l7 + 0x54]
	array32	%l5,	%o1,	%o7
	edge16n	%i5,	%i3,	%g7
	orncc	%i4,	%i0,	%g6
	sub	%l0,	%o6,	%i2
	edge16	%g5,	%g2,	%l6
	fnors	%f29,	%f6,	%f12
	movn	%xcc,	%l1,	%i6
	fmovsvc	%xcc,	%f1,	%f2
	movge	%icc,	%o5,	%g1
	edge16ln	%g4,	%g3,	%l2
	udiv	%o0,	0x0AE6,	%o2
	ldd	[%l7 + 0x38],	%f12
	ldsw	[%l7 + 0x18],	%o3
	fsrc1	%f4,	%f16
	faligndata	%f0,	%f24,	%f24
	ldx	[%l7 + 0x50],	%o4
	fabsd	%f16,	%f18
	andncc	%i1,	%i7,	%l4
	movle	%icc,	%l3,	%o1
	for	%f12,	%f26,	%f20
	sethi	0x1B46,	%l5
	movneg	%xcc,	%o7,	%i3
	edge8	%g7,	%i4,	%i0
	fmovsle	%icc,	%f5,	%f17
	fpadd32s	%f1,	%f20,	%f18
	move	%xcc,	%g6,	%l0
	fmul8x16	%f9,	%f20,	%f0
	fmovrde	%i5,	%f2,	%f12
	fcmpgt16	%f4,	%f22,	%o6
	ldd	[%l7 + 0x58],	%f16
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%i2
	fmovspos	%icc,	%f22,	%f15
	fmovsne	%xcc,	%f27,	%f17
	sth	%g2,	[%l7 + 0x26]
	orcc	%l6,	0x014C,	%g5
	orncc	%l1,	%o5,	%i6
	umulcc	%g4,	0x0F14,	%g1
	umul	%g3,	0x1AC5,	%o0
	fmovdn	%xcc,	%f6,	%f7
	restore %l2, %o3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i1,	0x395,	%i7
	movrne	%o4,	%l3,	%o1
	array8	%l5,	%l4,	%i3
	movvc	%xcc,	%g7,	%i4
	smulcc	%i0,	%g6,	%l0
	orn	%i5,	%o6,	%i2
	fpack16	%f4,	%f16
	sth	%g2,	[%l7 + 0x68]
	udivx	%l6,	0x0CBE,	%o7
	st	%f17,	[%l7 + 0x78]
	sub	%g5,	0x1C05,	%o5
	movrlz	%i6,	0x0CE,	%l1
	mulx	%g4,	%g1,	%o0
	fmovda	%xcc,	%f12,	%f0
	srlx	%g3,	0x16,	%o3
	edge32	%l2,	%o2,	%i1
	lduh	[%l7 + 0x5C],	%o4
	movrgz	%i7,	0x0B2,	%l3
	xor	%o1,	%l5,	%l4
	subccc	%i3,	0x0D56,	%g7
	edge8n	%i0,	%i4,	%g6
	xorcc	%l0,	%o6,	%i5
	movcs	%xcc,	%g2,	%l6
	edge32l	%i2,	%g5,	%o7
	movl	%icc,	%o5,	%i6
	movge	%xcc,	%l1,	%g1
	ldsh	[%l7 + 0x5A],	%o0
	movg	%xcc,	%g3,	%o3
	fmovsgu	%icc,	%f0,	%f30
	umul	%g4,	0x0A0A,	%o2
	fmovdneg	%icc,	%f28,	%f17
	fzeros	%f8
	movne	%xcc,	%l2,	%o4
	edge8ln	%i7,	%l3,	%o1
	fzero	%f8
	fmovda	%xcc,	%f1,	%f24
	fxnors	%f4,	%f28,	%f26
	umul	%l5,	%i1,	%l4
	addcc	%i3,	%i0,	%i4
	edge32	%g7,	%g6,	%l0
	xorcc	%i5,	%g2,	%o6
	sdiv	%i2,	0x1AD1,	%g5
	movre	%o7,	%l6,	%i6
	umulcc	%l1,	0x03AB,	%g1
	movre	%o5,	%o0,	%g3
	addcc	%g4,	%o3,	%o2
	smul	%o4,	0x0C5E,	%i7
	fmovdgu	%xcc,	%f13,	%f20
	bshuffle	%f26,	%f24,	%f14
	edge32l	%l2,	%l3,	%l5
	movneg	%icc,	%i1,	%l4
	movneg	%xcc,	%o1,	%i0
	for	%f22,	%f12,	%f24
	fmovrse	%i3,	%f1,	%f11
	movgu	%icc,	%i4,	%g7
	umulcc	%g6,	0x0B7F,	%l0
	fmuld8sux16	%f4,	%f15,	%f6
	movgu	%icc,	%g2,	%o6
	fabsd	%f16,	%f16
	fcmpgt16	%f2,	%f14,	%i5
	fcmpgt16	%f10,	%f14,	%g5
	and	%i2,	%l6,	%i6
	array16	%l1,	%o7,	%g1
	smulcc	%o5,	%g3,	%g4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	mulx	%o2,	%l2,	%l3
	ldd	[%l7 + 0x48],	%f10
	array16	%l5,	%i7,	%i1
	movleu	%icc,	%l4,	%o1
	xnor	%i0,	0x0EAD,	%i3
	movg	%icc,	%i4,	%g6
	sth	%l0,	[%l7 + 0x3A]
	lduw	[%l7 + 0x40],	%g2
	sir	0x0EA0
	sdivcc	%o6,	0x14B6,	%i5
	ldsb	[%l7 + 0x45],	%g5
	orn	%g7,	0x1133,	%l6
	orncc	%i2,	%i6,	%o7
	fmovdg	%xcc,	%f12,	%f24
	andn	%g1,	%l1,	%o5
	movrlz	%g4,	%g3,	%o3
	xnorcc	%o0,	0x16BA,	%o2
	fpsub32	%f30,	%f8,	%f26
	orn	%o4,	%l3,	%l5
	alignaddr	%i7,	%l2,	%l4
	fnot2s	%f16,	%f20
	siam	0x1
	fone	%f10
	ldsw	[%l7 + 0x44],	%o1
	sdivcc	%i1,	0x173F,	%i0
	ldub	[%l7 + 0x7D],	%i4
	edge8n	%g6,	%i3,	%l0
	movre	%o6,	0x0B2,	%i5
	movrlz	%g5,	%g2,	%g7
	ldub	[%l7 + 0x2D],	%i2
	std	%f24,	[%l7 + 0x28]
	std	%f16,	[%l7 + 0x58]
	udivx	%i6,	0x0EFA,	%o7
	sethi	0x1D35,	%g1
	movvc	%icc,	%l6,	%o5
	andn	%l1,	%g4,	%o3
	edge8	%g3,	%o2,	%o0
	lduh	[%l7 + 0x64],	%l3
	srlx	%l5,	%i7,	%l2
	addccc	%o4,	0x1756,	%o1
	ldsw	[%l7 + 0x74],	%i1
	sub	%i0,	%i4,	%g6
	nop
	set	0x43, %o2
	ldub	[%l7 + %o2],	%i3
	sub	%l4,	0x13ED,	%o6
	smul	%l0,	0x08F0,	%g5
	edge16l	%g2,	%i5,	%i2
	movgu	%xcc,	%i6,	%g7
	movn	%xcc,	%g1,	%o7
	movgu	%icc,	%o5,	%l6
	save %l1, 0x029E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x029C,	%g4
	fmovdpos	%icc,	%f9,	%f3
	fandnot1s	%f28,	%f25,	%f13
	stw	%o2,	[%l7 + 0x40]
	sdiv	%o0,	0x0CE1,	%g3
	movg	%xcc,	%l3,	%i7
	sll	%l5,	0x1F,	%o4
	andcc	%o1,	%i1,	%l2
	fmovdg	%icc,	%f2,	%f28
	movvs	%xcc,	%i4,	%g6
	smulcc	%i3,	%l4,	%i0
	ldx	[%l7 + 0x68],	%o6
	umulcc	%l0,	0x05D6,	%g5
	sdivx	%i5,	0x0484,	%g2
	alignaddr	%i6,	%i2,	%g7
	ldsb	[%l7 + 0x3B],	%g1
	andn	%o5,	%l6,	%o7
	movn	%xcc,	%l1,	%o3
	udivx	%o2,	0x12EF,	%o0
	movgu	%icc,	%g3,	%l3
	movrlez	%i7,	%g4,	%o4
	movrgez	%o1,	%i1,	%l5
	subccc	%i4,	0x0F92,	%g6
	fmovdcc	%xcc,	%f7,	%f24
	srlx	%l2,	0x04,	%i3
	orn	%l4,	%i0,	%o6
	stx	%g5,	[%l7 + 0x78]
	fexpand	%f23,	%f2
	edge32ln	%l0,	%g2,	%i6
	sdivcc	%i2,	0x10A9,	%i5
	udiv	%g7,	0x18DC,	%o5
	edge16n	%l6,	%g1,	%o7
	fmul8ulx16	%f6,	%f12,	%f30
	srlx	%o3,	%o2,	%o0
	movvs	%xcc,	%l1,	%l3
	movcs	%xcc,	%i7,	%g4
	add	%o4,	0x070D,	%g3
	fmovs	%f11,	%f20
	edge16l	%o1,	%l5,	%i4
	movcs	%xcc,	%i1,	%g6
	edge8ln	%l2,	%l4,	%i0
	udiv	%i3,	0x1638,	%o6
	xorcc	%l0,	%g5,	%i6
	udiv	%i2,	0x1E9D,	%i5
	ldsb	[%l7 + 0x09],	%g2
	fmovdg	%icc,	%f6,	%f13
	fmovsgu	%icc,	%f14,	%f26
	fmovrdlez	%o5,	%f8,	%f24
	andcc	%l6,	0x1A17,	%g1
	orn	%o7,	%o3,	%g7
	fmuld8ulx16	%f21,	%f23,	%f30
	add	%o0,	%o2,	%l3
	edge16	%l1,	%i7,	%g4
	nop
	set	0x36, %o4
	sth	%o4,	[%l7 + %o4]
	movvc	%xcc,	%o1,	%l5
	fnand	%f14,	%f12,	%f24
	add	%i4,	0x0AFD,	%g3
	ldsw	[%l7 + 0x38],	%g6
	fmovdneg	%icc,	%f24,	%f19
	movl	%icc,	%i1,	%l4
	popc	0x031D,	%i0
	movre	%i3,	%o6,	%l2
	mulscc	%l0,	%g5,	%i2
	movpos	%icc,	%i5,	%g2
	srl	%i6,	0x00,	%l6
	ldd	[%l7 + 0x68],	%o4
	sll	%o7,	%o3,	%g1
	fnot1s	%f25,	%f29
	andcc	%g7,	0x0C8A,	%o2
	movrne	%o0,	0x010,	%l1
	ldsh	[%l7 + 0x2C],	%i7
	movl	%xcc,	%g4,	%l3
	movgu	%xcc,	%o4,	%o1
	edge8n	%l5,	%g3,	%i4
	array32	%g6,	%i1,	%l4
	movg	%icc,	%i3,	%i0
	srax	%l2,	%o6,	%l0
	umulcc	%i2,	%i5,	%g2
	srl	%i6,	0x18,	%g5
	movgu	%xcc,	%l6,	%o7
	movrgz	%o3,	%g1,	%g7
	edge16	%o2,	%o0,	%l1
	udiv	%o5,	0x0E7D,	%g4
	movneg	%icc,	%l3,	%i7
	alignaddr	%o1,	%l5,	%o4
	fmuld8sux16	%f29,	%f24,	%f10
	fones	%f6
	movvs	%icc,	%i4,	%g3
	subccc	%g6,	0x18F4,	%l4
	xnorcc	%i1,	%i3,	%l2
	faligndata	%f0,	%f4,	%f0
	fpack16	%f10,	%f17
	array32	%i0,	%o6,	%i2
	ld	[%l7 + 0x34],	%f30
	lduw	[%l7 + 0x6C],	%i5
	stx	%g2,	[%l7 + 0x30]
	alignaddrl	%l0,	%i6,	%g5
	st	%f0,	[%l7 + 0x4C]
	alignaddrl	%l6,	%o3,	%o7
	stb	%g7,	[%l7 + 0x09]
	movrlez	%g1,	0x064,	%o2
	mulscc	%o0,	%l1,	%o5
	orcc	%g4,	%l3,	%i7
	movne	%xcc,	%o1,	%l5
	sll	%o4,	%i4,	%g6
	andncc	%g3,	%i1,	%i3
	udivcc	%l4,	0x086F,	%l2
	fnot1	%f30,	%f10
	edge8n	%o6,	%i2,	%i5
	fpmerge	%f12,	%f24,	%f16
	mova	%xcc,	%i0,	%l0
	movle	%xcc,	%g2,	%i6
	addcc	%l6,	%o3,	%o7
	fcmpgt32	%f4,	%f16,	%g5
	fmovs	%f6,	%f13
	lduw	[%l7 + 0x40],	%g1
	popc	%g7,	%o0
	movvs	%icc,	%o2,	%o5
	subc	%l1,	0x1EB0,	%l3
	subccc	%g4,	0x115E,	%o1
	stx	%l5,	[%l7 + 0x18]
	edge32n	%o4,	%i7,	%i4
	stx	%g3,	[%l7 + 0x48]
	fmovdne	%xcc,	%f4,	%f8
	fmovrsgz	%g6,	%f27,	%f30
	ldd	[%l7 + 0x40],	%i0
	fpadd16	%f22,	%f8,	%f24
	ldsh	[%l7 + 0x26],	%l4
	sir	0x07BD
	st	%f30,	[%l7 + 0x44]
	movcc	%icc,	%l2,	%i3
	srlx	%o6,	%i5,	%i2
	and	%i0,	%l0,	%i6
	mulscc	%g2,	%l6,	%o7
	andn	%o3,	%g5,	%g7
	fnot2	%f10,	%f2
	movcs	%icc,	%o0,	%g1
	umul	%o5,	%l1,	%l3
	srl	%o2,	0x1C,	%o1
	fnot1	%f12,	%f14
	nop
	set	0x30, %i3
	ldx	[%l7 + %i3],	%g4
	umul	%o4,	%l5,	%i4
	umulcc	%i7,	0x0612,	%g6
	edge8l	%g3,	%i1,	%l4
	udivx	%i3,	0x150C,	%l2
	edge16l	%i5,	%o6,	%i0
	fpadd32	%f16,	%f18,	%f14
	fmovsg	%icc,	%f8,	%f23
	fornot2s	%f23,	%f17,	%f23
	move	%xcc,	%i2,	%i6
	xorcc	%l0,	%g2,	%l6
	movgu	%icc,	%o7,	%g5
	edge16	%g7,	%o3,	%g1
	movne	%icc,	%o0,	%l1
	andcc	%o5,	0x004A,	%l3
	orn	%o1,	0x00CC,	%o2
	movvs	%icc,	%o4,	%g4
	movleu	%icc,	%l5,	%i7
	sllx	%i4,	%g6,	%i1
	movrne	%l4,	%i3,	%l2
	udivx	%i5,	0x0A2F,	%o6
	pdist	%f8,	%f16,	%f4
	orcc	%g3,	0x118B,	%i0
	fandnot1	%f0,	%f24,	%f0
	xor	%i2,	%i6,	%l0
	edge32n	%l6,	%g2,	%g5
	lduw	[%l7 + 0x14],	%g7
	udivcc	%o7,	0x164E,	%o3
	sdivcc	%g1,	0x0C40,	%o0
	move	%xcc,	%l1,	%l3
	fand	%f10,	%f22,	%f0
	array8	%o5,	%o2,	%o1
	smul	%g4,	%l5,	%o4
	lduh	[%l7 + 0x62],	%i4
	array16	%g6,	%i7,	%l4
	st	%f26,	[%l7 + 0x24]
	movgu	%xcc,	%i1,	%l2
	lduw	[%l7 + 0x40],	%i5
	ldd	[%l7 + 0x20],	%o6
	st	%f19,	[%l7 + 0x20]
	movrne	%i3,	%i0,	%i2
	movpos	%xcc,	%i6,	%l0
	smul	%g3,	0x15FE,	%g2
	fmovrdne	%g5,	%f22,	%f14
	fmovsneg	%icc,	%f26,	%f15
	edge32l	%l6,	%g7,	%o3
	addc	%g1,	0x1EF6,	%o0
	fmovdcs	%xcc,	%f19,	%f24
	fmovsa	%icc,	%f3,	%f6
	fzeros	%f1
	orn	%l1,	%l3,	%o5
	movle	%xcc,	%o7,	%o2
	fpadd16	%f16,	%f18,	%f28
	smul	%g4,	%o1,	%o4
	lduh	[%l7 + 0x6E],	%l5
	save %g6, 0x0558, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x28],	%l4
	fmovs	%f11,	%f6
	edge8	%i7,	%i1,	%l2
	xnorcc	%o6,	%i3,	%i0
	smul	%i2,	%i5,	%i6
	movvs	%icc,	%g3,	%l0
	ld	[%l7 + 0x40],	%f25
	edge8n	%g5,	%g2,	%l6
	movvs	%xcc,	%g7,	%g1
	edge32n	%o3,	%l1,	%o0
	movrlez	%l3,	%o5,	%o7
	movrlez	%o2,	%o1,	%g4
	alignaddr	%l5,	%o4,	%i4
	xnor	%g6,	%i7,	%l4
	andn	%i1,	%o6,	%l2
	sra	%i0,	0x08,	%i3
	fandnot2	%f20,	%f6,	%f4
	umul	%i2,	%i5,	%i6
	fnands	%f29,	%f31,	%f18
	fmuld8sux16	%f12,	%f8,	%f12
	ldub	[%l7 + 0x7E],	%g3
	sir	0x01AE
	srax	%g5,	%g2,	%l6
	edge16l	%g7,	%g1,	%o3
	fmovdpos	%xcc,	%f24,	%f4
	array16	%l0,	%l1,	%o0
	umul	%o5,	%l3,	%o7
	srax	%o1,	%o2,	%l5
	smulcc	%o4,	%g4,	%i4
	fsrc1s	%f7,	%f5
	movpos	%xcc,	%i7,	%g6
	udivx	%i1,	0x0BBF,	%l4
	sir	0x0311
	std	%f6,	[%l7 + 0x10]
	fmovsleu	%icc,	%f7,	%f7
	srl	%l2,	%i0,	%i3
	xorcc	%i2,	0x0975,	%o6
	ldsb	[%l7 + 0x0E],	%i6
	or	%g3,	%g5,	%i5
	stb	%l6,	[%l7 + 0x41]
	srax	%g2,	0x17,	%g1
	fmovdcs	%icc,	%f22,	%f9
	fmovsne	%icc,	%f1,	%f7
	array8	%o3,	%g7,	%l1
	movvs	%icc,	%l0,	%o0
	fmovdl	%xcc,	%f12,	%f24
	subc	%l3,	0x19B7,	%o7
	addcc	%o1,	%o5,	%o2
	movge	%xcc,	%o4,	%l5
	fmovdl	%icc,	%f30,	%f13
	srl	%i4,	%g4,	%i7
	movcs	%icc,	%g6,	%l4
	st	%f6,	[%l7 + 0x5C]
	movle	%icc,	%i1,	%l2
	fmovsle	%icc,	%f23,	%f10
	fmovspos	%icc,	%f26,	%f26
	lduh	[%l7 + 0x36],	%i0
	and	%i2,	%i3,	%o6
	movrlz	%g3,	%i6,	%g5
	ldsh	[%l7 + 0x68],	%l6
	fmul8x16al	%f5,	%f19,	%f16
	fmovrsgz	%g2,	%f0,	%f3
	edge16	%g1,	%i5,	%o3
	ldd	[%l7 + 0x38],	%g6
	edge8n	%l1,	%l0,	%l3
	sir	0x19B3
	movvc	%xcc,	%o0,	%o1
	movcs	%xcc,	%o7,	%o5
	fmovse	%xcc,	%f11,	%f0
	edge16l	%o4,	%l5,	%o2
	siam	0x6
	movge	%icc,	%g4,	%i7
	fcmpne32	%f8,	%f0,	%i4
	movre	%g6,	%i1,	%l2
	udiv	%i0,	0x0B3C,	%i2
	movrlez	%i3,	0x169,	%l4
	edge32	%g3,	%i6,	%g5
	fmovsne	%icc,	%f4,	%f7
	fcmpes	%fcc3,	%f10,	%f0
	fmuld8sux16	%f18,	%f26,	%f26
	ldsw	[%l7 + 0x2C],	%o6
	umul	%g2,	0x0451,	%g1
	sethi	0x0792,	%l6
	std	%f24,	[%l7 + 0x18]
	array8	%o3,	%g7,	%l1
	movrgez	%i5,	0x01B,	%l3
	sethi	0x060A,	%o0
	movneg	%xcc,	%o1,	%o7
	srl	%l0,	%o5,	%o4
	alignaddrl	%l5,	%o2,	%g4
	fmovdg	%icc,	%f22,	%f16
	fmovsvs	%xcc,	%f6,	%f11
	fmovdl	%icc,	%f2,	%f0
	udivcc	%i7,	0x1292,	%i4
	ldx	[%l7 + 0x40],	%g6
	fpsub32s	%f28,	%f26,	%f6
	subcc	%l2,	%i0,	%i2
	mulx	%i3,	0x0920,	%l4
	subcc	%g3,	%i6,	%i1
	move	%xcc,	%g5,	%o6
	edge32l	%g1,	%g2,	%o3
	fmovrsgz	%l6,	%f29,	%f4
	movrgez	%l1,	%i5,	%g7
	movg	%icc,	%l3,	%o1
	nop
	set	0x78, %g3
	std	%f0,	[%l7 + %g3]
	lduh	[%l7 + 0x4A],	%o7
	addccc	%o0,	0x053F,	%o5
	array8	%o4,	%l5,	%l0
	xnor	%o2,	%g4,	%i4
	orcc	%g6,	0x12E5,	%i7
	ldd	[%l7 + 0x58],	%i0
	movre	%i2,	0x122,	%i3
	edge32n	%l2,	%l4,	%i6
	fnot2	%f2,	%f10
	ldsw	[%l7 + 0x0C],	%i1
	umul	%g3,	%g5,	%o6
	ldsb	[%l7 + 0x66],	%g1
	sdivx	%g2,	0x1058,	%o3
	sub	%l1,	0x1A0B,	%l6
	alignaddrl	%i5,	%g7,	%l3
	fsrc1s	%f11,	%f26
	fornot1s	%f12,	%f20,	%f4
	movvs	%icc,	%o7,	%o0
	ldx	[%l7 + 0x78],	%o5
	fpadd16	%f24,	%f14,	%f22
	std	%f26,	[%l7 + 0x10]
	fandnot2	%f20,	%f14,	%f8
	orcc	%o1,	%o4,	%l5
	xorcc	%o2,	0x1BD6,	%g4
	subc	%i4,	0x1355,	%g6
	movneg	%icc,	%l0,	%i7
	movneg	%icc,	%i2,	%i0
	edge16l	%l2,	%i3,	%l4
	fmovdvs	%xcc,	%f20,	%f24
	sethi	0x1079,	%i6
	sra	%g3,	%i1,	%o6
	movg	%icc,	%g1,	%g2
	array32	%o3,	%l1,	%g5
	fmovsvs	%xcc,	%f12,	%f27
	sir	0x1A2F
	smulcc	%l6,	0x16E1,	%g7
	fandnot2	%f26,	%f10,	%f4
	mulscc	%i5,	%o7,	%l3
	sub	%o5,	0x1760,	%o0
	subcc	%o4,	%l5,	%o1
	edge8l	%o2,	%g4,	%g6
	fcmple16	%f8,	%f0,	%l0
	ld	[%l7 + 0x44],	%f11
	edge32	%i4,	%i7,	%i2
	edge16	%l2,	%i0,	%i3
	udivcc	%i6,	0x11AA,	%l4
	std	%f10,	[%l7 + 0x50]
	ldd	[%l7 + 0x70],	%f12
	add	%g3,	0x0FD1,	%o6
	xnorcc	%g1,	%i1,	%o3
	edge8l	%g2,	%g5,	%l6
	save %l1, 0x0446, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f15
	orncc	%o7,	0x0629,	%i5
	edge8n	%l3,	%o5,	%o4
	udivcc	%l5,	0x0D87,	%o1
	movrgez	%o0,	%o2,	%g6
	edge8	%g4,	%i4,	%l0
	edge8	%i7,	%i2,	%i0
	fones	%f22
	orn	%l2,	%i3,	%l4
	xnor	%i6,	0x0C48,	%g3
	sth	%o6,	[%l7 + 0x20]
	movne	%xcc,	%g1,	%i1
	andn	%g2,	%o3,	%l6
	mova	%icc,	%g5,	%g7
	alignaddrl	%o7,	%l1,	%i5
	movre	%o5,	%l3,	%l5
	fmovdn	%icc,	%f19,	%f1
	fand	%f28,	%f24,	%f2
	popc	0x06F3,	%o1
	sllx	%o0,	%o4,	%o2
	sub	%g6,	0x0A86,	%g4
	edge8	%i4,	%l0,	%i2
	fmovrsgez	%i7,	%f12,	%f0
	siam	0x3
	fnot2s	%f25,	%f13
	fmovdcc	%xcc,	%f15,	%f14
	nop
	set	0x0E, %o3
	sth	%l2,	[%l7 + %o3]
	stb	%i0,	[%l7 + 0x16]
	ld	[%l7 + 0x1C],	%f25
	orncc	%l4,	%i3,	%g3
	movneg	%xcc,	%i6,	%o6
	smul	%i1,	0x1F8A,	%g2
	movrne	%g1,	0x2BF,	%o3
	sethi	0x190F,	%g5
	restore %l6, %o7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i5,	[%l7 + 0x3C]
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	movrgz	%l3,	0x345,	%o1
	edge16l	%o4,	%o2,	%g6
	movrgz	%g4,	%i4,	%l0
	srl	%o0,	0x0B,	%i7
	edge32n	%l2,	%i2,	%i0
	srax	%l4,	0x15,	%g3
	lduw	[%l7 + 0x0C],	%i6
	movle	%xcc,	%o6,	%i3
	srlx	%g2,	0x13,	%i1
	st	%f28,	[%l7 + 0x4C]
	edge16n	%o3,	%g1,	%g5
	ldsh	[%l7 + 0x66],	%o7
	fmul8x16	%f14,	%f6,	%f12
	popc	0x1A4B,	%g7
	fmul8ulx16	%f24,	%f14,	%f22
	ld	[%l7 + 0x24],	%f1
	ldd	[%l7 + 0x48],	%i6
	alignaddrl	%l1,	%o5,	%i5
	fornot2s	%f19,	%f6,	%f26
	ldsh	[%l7 + 0x6C],	%l3
	edge16l	%o1,	%o4,	%o2
	fpadd16s	%f14,	%f16,	%f22
	fornot1	%f22,	%f28,	%f18
	save %l5, %g6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i4,	%o0,	%i7
	fpmerge	%f20,	%f9,	%f20
	movrgz	%l0,	0x0E5,	%i2
	movne	%icc,	%i0,	%l2
	smul	%l4,	%i6,	%o6
	movl	%xcc,	%i3,	%g3
	fnor	%f24,	%f28,	%f16
	ldsb	[%l7 + 0x59],	%g2
	ldsh	[%l7 + 0x12],	%i1
	mova	%icc,	%o3,	%g5
	edge32ln	%o7,	%g1,	%g7
	st	%f16,	[%l7 + 0x48]
	xor	%l6,	%o5,	%l1
	movne	%xcc,	%i5,	%o1
	ldsw	[%l7 + 0x24],	%l3
	movne	%icc,	%o4,	%o2
	movg	%xcc,	%g6,	%l5
	stx	%i4,	[%l7 + 0x40]
	movvs	%xcc,	%o0,	%i7
	fcmpne16	%f26,	%f2,	%g4
	fnot1s	%f22,	%f12
	mulscc	%l0,	%i2,	%i0
	fmovdleu	%icc,	%f14,	%f19
	ldd	[%l7 + 0x78],	%l4
	fxor	%f4,	%f2,	%f24
	addc	%i6,	0x1273,	%o6
	fand	%f20,	%f2,	%f10
	stb	%i3,	[%l7 + 0x37]
	subc	%g3,	%l2,	%i1
	movle	%xcc,	%o3,	%g5
	or	%o7,	%g1,	%g2
	save %g7, 0x1773, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l6,	%l1,	%o1
	fcmpd	%fcc3,	%f26,	%f30
	movne	%xcc,	%i5,	%l3
	edge16n	%o4,	%o2,	%l5
	fmovrde	%g6,	%f30,	%f14
	ldsw	[%l7 + 0x24],	%o0
	fmul8x16	%f20,	%f8,	%f20
	fmovrsgz	%i4,	%f7,	%f22
	alignaddr	%g4,	%l0,	%i2
	movpos	%icc,	%i7,	%l4
	edge16n	%i6,	%o6,	%i3
	ldd	[%l7 + 0x78],	%f30
	umulcc	%g3,	0x10C6,	%l2
	edge16l	%i0,	%o3,	%i1
	lduh	[%l7 + 0x08],	%o7
	sll	%g5,	%g1,	%g7
	sub	%o5,	0x116D,	%l6
	addcc	%l1,	%o1,	%i5
	smul	%g2,	0x0189,	%l3
	xorcc	%o4,	%o2,	%l5
	sethi	0x1804,	%g6
	std	%f14,	[%l7 + 0x50]
	movn	%xcc,	%o0,	%g4
	ld	[%l7 + 0x28],	%f24
	fcmpgt16	%f0,	%f26,	%l0
	movrgez	%i4,	%i7,	%l4
	fcmpes	%fcc2,	%f31,	%f17
	fnors	%f23,	%f22,	%f20
	lduw	[%l7 + 0x30],	%i2
	sub	%o6,	%i6,	%i3
	edge16	%g3,	%l2,	%o3
	movrgz	%i0,	0x24E,	%o7
	edge16n	%i1,	%g1,	%g5
	movl	%xcc,	%g7,	%l6
	srlx	%l1,	%o1,	%o5
	movre	%i5,	%g2,	%l3
	sir	0x0641
	movg	%icc,	%o2,	%o4
	edge32	%l5,	%g6,	%g4
	ldx	[%l7 + 0x60],	%l0
	addccc	%o0,	%i7,	%i4
	fornot1s	%f14,	%f7,	%f2
	fmovs	%f28,	%f30
	edge8l	%l4,	%o6,	%i2
	subccc	%i3,	0x0978,	%g3
	fmovrdne	%i6,	%f6,	%f26
	fmovsneg	%icc,	%f29,	%f0
	subccc	%l2,	%o3,	%o7
	mulscc	%i0,	0x1A5B,	%i1
	movleu	%xcc,	%g1,	%g7
	lduw	[%l7 + 0x24],	%g5
	srlx	%l1,	0x1C,	%l6
	fnegs	%f16,	%f26
	array8	%o1,	%o5,	%g2
	fpsub16s	%f30,	%f22,	%f9
	xor	%l3,	0x1EDD,	%o2
	sub	%o4,	0x031D,	%i5
	xnor	%l5,	0x0CFF,	%g6
	restore %l0, 0x0D26, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i7,	%i4
	edge32ln	%l4,	%o0,	%o6
	smulcc	%i2,	0x1C95,	%g3
	movrlz	%i3,	0x127,	%l2
	stb	%i6,	[%l7 + 0x0B]
	sra	%o3,	%i0,	%i1
	edge8l	%o7,	%g1,	%g5
	movle	%icc,	%g7,	%l1
	fzero	%f28
	fpsub16s	%f18,	%f2,	%f30
	andn	%o1,	0x1F22,	%o5
	std	%f12,	[%l7 + 0x30]
	fcmpeq16	%f12,	%f24,	%g2
	fpackfix	%f0,	%f26
	edge8ln	%l6,	%l3,	%o4
	fcmpne16	%f6,	%f16,	%i5
	movvs	%icc,	%o2,	%l5
	fmovdvs	%icc,	%f17,	%f31
	edge16	%l0,	%g4,	%g6
	popc	0x15AA,	%i7
	addcc	%l4,	%i4,	%o6
	array32	%o0,	%i2,	%i3
	fpackfix	%f2,	%f17
	movle	%icc,	%g3,	%l2
	array16	%o3,	%i0,	%i6
	edge8ln	%o7,	%i1,	%g5
	fmovrse	%g7,	%f31,	%f17
	fsrc2	%f30,	%f28
	pdist	%f6,	%f2,	%f18
	ld	[%l7 + 0x1C],	%f28
	edge8l	%l1,	%g1,	%o5
	edge16l	%o1,	%g2,	%l3
	edge8ln	%o4,	%l6,	%i5
	umulcc	%l5,	0x1756,	%o2
	sdivcc	%l0,	0x0079,	%g4
	fzero	%f2
	stb	%i7,	[%l7 + 0x1C]
	umulcc	%l4,	%g6,	%o6
	fands	%f14,	%f18,	%f17
	andncc	%i4,	%i2,	%o0
	move	%xcc,	%i3,	%g3
	addc	%o3,	%i0,	%i6
	mova	%icc,	%o7,	%i1
	andn	%l2,	0x1973,	%g5
	sdivcc	%l1,	0x1CC8,	%g1
	alignaddrl	%o5,	%o1,	%g7
	fpack16	%f30,	%f16
	fpadd16	%f14,	%f6,	%f8
	andcc	%g2,	0x188F,	%o4
	movne	%xcc,	%l6,	%l3
	edge8l	%i5,	%o2,	%l5
	edge8	%l0,	%i7,	%l4
	umulcc	%g6,	%g4,	%i4
	srlx	%i2,	0x10,	%o0
	add	%o6,	0x0426,	%g3
	edge32l	%o3,	%i3,	%i6
	addccc	%i0,	%o7,	%l2
	subcc	%i1,	%g5,	%l1
	movleu	%xcc,	%g1,	%o1
	ldd	[%l7 + 0x68],	%f18
	fnands	%f0,	%f29,	%f7
	fmovs	%f0,	%f18
	ldd	[%l7 + 0x70],	%f26
	smul	%o5,	%g7,	%g2
	edge8n	%l6,	%o4,	%l3
	alignaddr	%i5,	%l5,	%l0
	lduw	[%l7 + 0x64],	%o2
	fpsub32	%f22,	%f26,	%f12
	andn	%i7,	%l4,	%g6
	fpsub16	%f18,	%f28,	%f12
	ldd	[%l7 + 0x60],	%f28
	movge	%xcc,	%g4,	%i4
	ld	[%l7 + 0x5C],	%f7
	and	%o0,	%o6,	%i2
	movvs	%xcc,	%o3,	%g3
	fpack32	%f16,	%f16,	%f2
	sth	%i3,	[%l7 + 0x22]
	srl	%i6,	%i0,	%o7
	edge8ln	%l2,	%g5,	%i1
	movgu	%icc,	%l1,	%g1
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fpack32	%f16,	%f26,	%f14
	orn	%g2,	%l6,	%o4
	movre	%l3,	%l5,	%l0
	movl	%icc,	%o2,	%i7
	fcmpeq16	%f0,	%f24,	%i5
	xorcc	%l4,	%g4,	%g6
	or	%o0,	0x1AC0,	%o6
	movleu	%xcc,	%i4,	%i2
	ldub	[%l7 + 0x10],	%g3
	fzeros	%f20
	fnot2	%f16,	%f14
	movrgz	%o3,	0x0AA,	%i3
	srlx	%i0,	0x17,	%i6
	edge8ln	%l2,	%o7,	%g5
	smulcc	%i1,	%l1,	%o1
	fpadd16s	%f12,	%f6,	%f1
	movgu	%icc,	%o5,	%g1
	fmovdcs	%xcc,	%f27,	%f9
	edge8l	%g2,	%l6,	%g7
	alignaddr	%l3,	%o4,	%l5
	movg	%xcc,	%l0,	%o2
	alignaddr	%i5,	%i7,	%g4
	movgu	%xcc,	%l4,	%g6
	addcc	%o6,	%i4,	%i2
	array16	%g3,	%o0,	%i3
	movrlez	%o3,	0x1AB,	%i6
	xor	%i0,	0x1FB4,	%l2
	movrgez	%o7,	0x3E6,	%g5
	fpadd32s	%f17,	%f30,	%f30
	std	%f30,	[%l7 + 0x10]
	fmovdle	%icc,	%f12,	%f17
	alignaddr	%i1,	%o1,	%l1
	mulx	%g1,	%g2,	%o5
	array32	%l6,	%l3,	%o4
	fpadd16	%f26,	%f24,	%f0
	movge	%icc,	%l5,	%g7
	fcmps	%fcc0,	%f8,	%f16
	fpack32	%f2,	%f8,	%f30
	alignaddr	%l0,	%o2,	%i5
	fornot2	%f6,	%f10,	%f6
	fmul8x16	%f20,	%f2,	%f22
	subccc	%g4,	%l4,	%g6
	fmovsvs	%icc,	%f0,	%f26
	fmovsn	%xcc,	%f11,	%f6
	edge32n	%o6,	%i7,	%i2
	fmovsvs	%icc,	%f21,	%f24
	array8	%g3,	%i4,	%o0
	sdivx	%i3,	0x01DB,	%i6
	array8	%o3,	%l2,	%o7
	smulcc	%i0,	%g5,	%i1
	movle	%icc,	%l1,	%o1
	udiv	%g1,	0x01A0,	%g2
	movrlz	%l6,	0x3EE,	%o5
	udivcc	%o4,	0x043A,	%l5
	fnand	%f22,	%f8,	%f14
	pdist	%f28,	%f22,	%f2
	array16	%l3,	%l0,	%g7
	fmovdl	%icc,	%f3,	%f14
	fpsub32	%f10,	%f14,	%f14
	ldd	[%l7 + 0x08],	%f28
	sllx	%o2,	%i5,	%l4
	ldsb	[%l7 + 0x30],	%g6
	for	%f0,	%f10,	%f12
	sub	%g4,	0x15DA,	%i7
	sdiv	%o6,	0x16BB,	%i2
	fcmpne32	%f6,	%f14,	%g3
	ldd	[%l7 + 0x38],	%i4
	movrlez	%o0,	0x12E,	%i6
	mulscc	%o3,	%i3,	%l2
	movne	%xcc,	%i0,	%g5
	and	%o7,	%i1,	%l1
	fmovrdlz	%g1,	%f22,	%f6
	stx	%g2,	[%l7 + 0x48]
	ld	[%l7 + 0x30],	%f13
	movrlz	%l6,	%o5,	%o4
	ldsw	[%l7 + 0x38],	%l5
	movg	%xcc,	%l3,	%l0
	smul	%g7,	0x0EF9,	%o1
	srax	%o2,	%i5,	%l4
	st	%f17,	[%l7 + 0x44]
	movrlz	%g6,	0x098,	%g4
	ldd	[%l7 + 0x70],	%f30
	movrlez	%o6,	%i7,	%g3
	fmovsg	%icc,	%f20,	%f30
	fmovscc	%icc,	%f7,	%f10
	edge8n	%i4,	%o0,	%i6
	fmovsle	%icc,	%f10,	%f30
	movcs	%xcc,	%o3,	%i3
	fcmpeq16	%f18,	%f2,	%l2
	fmovdn	%xcc,	%f13,	%f25
	orncc	%i0,	0x0E2D,	%i2
	fmovsneg	%xcc,	%f1,	%f19
	sdiv	%o7,	0x1587,	%g5
	fnot2s	%f30,	%f4
	ldd	[%l7 + 0x08],	%f14
	fmovde	%xcc,	%f19,	%f30
	umulcc	%l1,	0x0FD2,	%g1
	movre	%g2,	0x2AC,	%l6
	mova	%icc,	%i1,	%o4
	fpack16	%f24,	%f30
	edge16	%o5,	%l5,	%l0
	sdiv	%l3,	0x0D7F,	%g7
	ldd	[%l7 + 0x58],	%o0
	movcc	%xcc,	%i5,	%l4
	fmovse	%icc,	%f4,	%f27
	or	%g6,	0x11B9,	%g4
	edge8l	%o6,	%i7,	%g3
	lduw	[%l7 + 0x48],	%i4
	movrgz	%o2,	0x26C,	%i6
	movpos	%icc,	%o0,	%o3
	sdivx	%i3,	0x13DD,	%i0
	movl	%icc,	%i2,	%o7
	movvc	%xcc,	%g5,	%l1
	nop
	set	0x1C, %g2
	lduh	[%l7 + %g2],	%g1
	movvc	%xcc,	%g2,	%l6
	ldub	[%l7 + 0x72],	%i1
	movpos	%xcc,	%o4,	%l2
	fmovdneg	%icc,	%f6,	%f5
	sdivcc	%o5,	0x0DDA,	%l0
	nop
	set	0x44, %l4
	lduw	[%l7 + %l4],	%l3
	xnorcc	%l5,	0x07CA,	%o1
	fmovsle	%icc,	%f30,	%f1
	sllx	%g7,	%i5,	%g6
	ldsw	[%l7 + 0x20],	%l4
	xor	%g4,	0x1102,	%i7
	fpmerge	%f4,	%f31,	%f8
	udivcc	%g3,	0x0DE7,	%o6
	smul	%i4,	%i6,	%o0
	xnorcc	%o3,	0x1E96,	%i3
	sll	%i0,	0x00,	%o2
	xor	%o7,	0x1628,	%g5
	movre	%l1,	%g1,	%i2
	umul	%g2,	%i1,	%l6
	alignaddrl	%o4,	%o5,	%l0
	sth	%l3,	[%l7 + 0x50]
	array8	%l2,	%o1,	%l5
	fcmps	%fcc3,	%f1,	%f13
	stb	%g7,	[%l7 + 0x4F]
	ldub	[%l7 + 0x12],	%g6
	fpsub32	%f28,	%f18,	%f10
	addccc	%i5,	%g4,	%l4
	fornot2s	%f11,	%f10,	%f23
	fmovscc	%icc,	%f24,	%f20
	stx	%g3,	[%l7 + 0x48]
	fexpand	%f20,	%f6
	fcmpes	%fcc2,	%f10,	%f2
	fmovrsgez	%i7,	%f2,	%f22
	mulx	%i4,	0x0D83,	%i6
	srl	%o6,	0x1E,	%o0
	mulx	%i3,	0x137E,	%i0
	umul	%o2,	0x1C47,	%o3
	smulcc	%g5,	%l1,	%g1
	udiv	%o7,	0x1561,	%i2
	st	%f9,	[%l7 + 0x58]
	movcs	%icc,	%i1,	%l6
	ldsb	[%l7 + 0x67],	%g2
	srl	%o4,	0x0A,	%o5
	stb	%l0,	[%l7 + 0x1C]
	std	%f0,	[%l7 + 0x78]
	fandnot1	%f6,	%f18,	%f14
	fcmpeq32	%f6,	%f6,	%l2
	smul	%l3,	%l5,	%o1
	alignaddr	%g6,	%i5,	%g7
	edge32	%g4,	%g3,	%l4
	udivcc	%i4,	0x0832,	%i6
	movleu	%xcc,	%i7,	%o0
	fsrc2	%f12,	%f22
	fmovse	%xcc,	%f18,	%f3
	edge32	%i3,	%o6,	%o2
	lduw	[%l7 + 0x54],	%i0
	array16	%g5,	%l1,	%g1
	movcc	%icc,	%o3,	%i2
	movn	%xcc,	%o7,	%l6
	sub	%g2,	0x0DC0,	%i1
	ld	[%l7 + 0x0C],	%f0
	srax	%o5,	0x0A,	%o4
	fxnor	%f8,	%f30,	%f18
	mulx	%l2,	%l3,	%l0
	sll	%l5,	0x14,	%g6
	sdiv	%o1,	0x0418,	%i5
	addc	%g4,	%g7,	%l4
	smul	%g3,	0x1183,	%i4
	movg	%icc,	%i6,	%i7
	sdiv	%i3,	0x0F12,	%o0
	subccc	%o2,	0x0ED2,	%o6
	subc	%i0,	0x1EDD,	%g5
	and	%g1,	%l1,	%o3
	sdivcc	%i2,	0x0FF3,	%l6
	alignaddrl	%g2,	%o7,	%i1
	ld	[%l7 + 0x20],	%f11
	fxor	%f26,	%f8,	%f14
	edge32ln	%o4,	%o5,	%l3
	movcc	%icc,	%l2,	%l0
	fcmpgt32	%f26,	%f26,	%g6
	fsrc1	%f12,	%f20
	xnorcc	%o1,	%i5,	%g4
	addc	%g7,	%l4,	%g3
	movre	%i4,	%l5,	%i6
	edge32l	%i3,	%o0,	%i7
	edge8ln	%o6,	%i0,	%g5
	fmovscs	%xcc,	%f7,	%f20
	fmovsvc	%xcc,	%f8,	%f2
	movgu	%xcc,	%g1,	%l1
	ldd	[%l7 + 0x50],	%o2
	sth	%i2,	[%l7 + 0x3C]
	udiv	%l6,	0x196A,	%g2
	fcmpgt32	%f20,	%f28,	%o2
	movrgz	%i1,	%o7,	%o5
	fmovdneg	%icc,	%f28,	%f31
	movrlez	%o4,	%l2,	%l0
	ldd	[%l7 + 0x78],	%f30
	std	%f30,	[%l7 + 0x18]
	mulscc	%g6,	0x1A37,	%l3
	st	%f6,	[%l7 + 0x50]
	andn	%i5,	%g4,	%o1
	srl	%g7,	%l4,	%g3
	ld	[%l7 + 0x50],	%f2
	lduh	[%l7 + 0x28],	%i4
	addcc	%i6,	%l5,	%o0
	movcs	%icc,	%i7,	%o6
	stb	%i0,	[%l7 + 0x1E]
	orn	%g5,	%i3,	%g1
	fpadd32s	%f4,	%f14,	%f27
	stw	%o3,	[%l7 + 0x7C]
	srax	%l1,	0x1D,	%i2
	subcc	%g2,	%o2,	%i1
	subccc	%o7,	0x138D,	%l6
	edge32n	%o5,	%l2,	%o4
	edge32l	%l0,	%g6,	%l3
	andncc	%i5,	%o1,	%g4
	fmovde	%icc,	%f8,	%f17
	edge32ln	%g7,	%g3,	%i4
	movleu	%icc,	%l4,	%i6
	fpadd32s	%f19,	%f1,	%f9
	restore %o0, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i0,	%i7,	%g5
	movne	%icc,	%g1,	%i3
	fandnot2	%f22,	%f26,	%f12
	move	%xcc,	%l1,	%i2
	addcc	%o3,	%g2,	%i1
	save %o7, 0x1B8C, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l6,	%o5
	orn	%o4,	%l2,	%l0
	sra	%l3,	0x05,	%g6
	array8	%i5,	%o1,	%g7
	movn	%icc,	%g3,	%g4
	edge16l	%l4,	%i6,	%i4
	sdivcc	%l5,	0x1035,	%o6
	fmovsne	%xcc,	%f16,	%f23
	fmovse	%icc,	%f27,	%f13
	fmovsg	%icc,	%f5,	%f26
	fmovdneg	%xcc,	%f4,	%f11
	and	%o0,	%i0,	%g5
	orncc	%g1,	%i7,	%l1
	movcc	%icc,	%i3,	%i2
	fmovrsgez	%o3,	%f29,	%f24
	movrgez	%i1,	0x10A,	%o7
	movge	%icc,	%o2,	%g2
	movcs	%xcc,	%l6,	%o5
	fexpand	%f12,	%f16
	addc	%l2,	0x03A8,	%o4
	andn	%l0,	0x024D,	%g6
	movrlez	%l3,	%o1,	%g7
	xor	%g3,	0x058A,	%g4
	andn	%i5,	0x195B,	%i6
	movcc	%xcc,	%l4,	%i4
	edge16l	%l5,	%o6,	%o0
	fmovscs	%xcc,	%f4,	%f12
	orncc	%g5,	0x0827,	%g1
	sdivcc	%i7,	0x04E1,	%l1
	movcs	%xcc,	%i0,	%i3
	fmovrde	%i2,	%f20,	%f30
	fone	%f24
	smul	%i1,	%o3,	%o7
	edge32	%o2,	%l6,	%g2
	udiv	%o5,	0x1D7E,	%l2
	edge32l	%l0,	%g6,	%l3
	fandnot1	%f26,	%f24,	%f14
	fmovrdlez	%o1,	%f22,	%f8
	movne	%xcc,	%g7,	%g3
	movre	%g4,	0x14E,	%o4
	fsrc2s	%f21,	%f27
	srl	%i5,	%i6,	%i4
	fmovrdlz	%l5,	%f28,	%f10
	fmovde	%icc,	%f6,	%f15
	subc	%l4,	%o0,	%o6
	movcs	%icc,	%g5,	%i7
	move	%xcc,	%g1,	%i0
	array32	%i3,	%i2,	%l1
	mulx	%o3,	%i1,	%o2
	edge8	%l6,	%g2,	%o7
	sth	%o5,	[%l7 + 0x6A]
	movg	%xcc,	%l0,	%g6
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	xor	%g7,	0x1016,	%g3
	fmovrsne	%o4,	%f18,	%f26
	fmuld8sux16	%f20,	%f15,	%f10
	for	%f12,	%f22,	%f28
	stb	%g4,	[%l7 + 0x40]
	fandnot2s	%f0,	%f23,	%f6
	sll	%i6,	0x1C,	%i4
	ldd	[%l7 + 0x78],	%f28
	fmovsle	%xcc,	%f16,	%f24
	xnor	%i5,	%l5,	%o0
	movcc	%icc,	%o6,	%g5
	movleu	%xcc,	%i7,	%l4
	addc	%i0,	%i3,	%i2
	restore %l1, 0x1236, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g1,	%o2,	%l6
	fmovsg	%icc,	%f0,	%f16
	andcc	%g2,	%i1,	%o7
	orcc	%l0,	%g6,	%l3
	alignaddr	%l2,	%o5,	%g7
	movl	%xcc,	%g3,	%o4
	fmovrsgz	%o1,	%f4,	%f0
	subccc	%i6,	%g4,	%i4
	fmovdcc	%xcc,	%f16,	%f17
	ldd	[%l7 + 0x18],	%l4
	ldx	[%l7 + 0x10],	%i5
	sllx	%o0,	%o6,	%i7
	umul	%l4,	0x1616,	%i0
	movre	%i3,	%g5,	%i2
	andcc	%o3,	%l1,	%g1
	mulscc	%l6,	%g2,	%o2
	fmuld8ulx16	%f31,	%f20,	%f8
	ldx	[%l7 + 0x30],	%o7
	mulx	%l0,	%g6,	%i1
	fmovsne	%icc,	%f8,	%f16
	andn	%l3,	%o5,	%g7
	movleu	%xcc,	%l2,	%o4
	fmovdpos	%icc,	%f5,	%f20
	sub	%o1,	0x1179,	%i6
	mulscc	%g4,	0x0D83,	%i4
	movn	%icc,	%l5,	%i5
	fmovrslz	%o0,	%f12,	%f3
	fsrc1s	%f29,	%f0
	add	%o6,	0x07E0,	%i7
	movl	%icc,	%l4,	%g3
	fsrc2s	%f16,	%f25
	ldub	[%l7 + 0x57],	%i0
	sll	%i3,	0x14,	%i2
	xor	%o3,	0x1317,	%l1
	addc	%g1,	0x0E79,	%g5
	movcs	%icc,	%l6,	%o2
	umul	%g2,	%l0,	%g6
	andcc	%i1,	0x1001,	%o7
	xor	%o5,	%g7,	%l2
	fpack32	%f6,	%f8,	%f8
	bshuffle	%f22,	%f20,	%f30
	movrlz	%o4,	%o1,	%i6
	movvc	%xcc,	%g4,	%i4
	fmovrsgez	%l5,	%f19,	%f8
	save %i5, %o0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l3,	%i7
	movleu	%xcc,	%l4,	%i0
	umul	%g3,	0x147B,	%i2
	srax	%o3,	0x1E,	%i3
	fcmpne16	%f12,	%f22,	%l1
	fmovrsgez	%g1,	%f8,	%f14
	fpadd32	%f16,	%f12,	%f6
	alignaddr	%g5,	%o2,	%l6
	orn	%l0,	0x0D63,	%g2
	sdivx	%g6,	0x0F23,	%i1
	sir	0x0701
	fnor	%f12,	%f28,	%f26
	popc	0x1D38,	%o7
	edge8n	%o5,	%l2,	%o4
	movl	%icc,	%g7,	%o1
	movgu	%icc,	%i6,	%g4
	fcmple32	%f22,	%f28,	%i4
	movl	%xcc,	%l5,	%i5
	movne	%icc,	%o6,	%l3
	movn	%icc,	%i7,	%o0
	fxnors	%f23,	%f12,	%f11
	fandnot2s	%f20,	%f29,	%f22
	fand	%f14,	%f30,	%f28
	siam	0x5
	move	%icc,	%l4,	%i0
	fmovrslez	%i2,	%f16,	%f30
	subcc	%o3,	%g3,	%i3
	srax	%g1,	%l1,	%o2
	fmovdle	%xcc,	%f9,	%f15
	movrgz	%g5,	0x03B,	%l0
	stx	%l6,	[%l7 + 0x20]
	movrgez	%g6,	%g2,	%i1
	fmul8x16al	%f30,	%f27,	%f2
	sdivx	%o5,	0x09C9,	%l2
	smul	%o7,	%o4,	%g7
	sth	%i6,	[%l7 + 0x5E]
	edge32l	%o1,	%g4,	%i4
	subc	%i5,	%l5,	%o6
	popc	%l3,	%i7
	edge8ln	%o0,	%i0,	%l4
	fnegs	%f23,	%f23
	movneg	%icc,	%i2,	%o3
	array32	%g3,	%g1,	%l1
	addc	%i3,	%g5,	%l0
	fpadd32s	%f25,	%f26,	%f28
	ldsh	[%l7 + 0x1A],	%o2
	fxors	%f0,	%f10,	%f23
	edge32n	%l6,	%g6,	%g2
	popc	0x0495,	%o5
	stw	%i1,	[%l7 + 0x14]
	sra	%l2,	%o4,	%o7
	fcmpne32	%f2,	%f20,	%i6
	stb	%o1,	[%l7 + 0x47]
	fpmerge	%f21,	%f14,	%f18
	sdiv	%g4,	0x00F8,	%g7
	sdivcc	%i4,	0x005A,	%l5
	lduh	[%l7 + 0x6C],	%i5
	addccc	%o6,	0x054E,	%l3
	fones	%f4
	movcs	%xcc,	%o0,	%i7
	srlx	%i0,	0x17,	%i2
	ldsw	[%l7 + 0x5C],	%l4
	movle	%icc,	%g3,	%g1
	ldx	[%l7 + 0x48],	%o3
	fmul8x16au	%f31,	%f4,	%f4
	sll	%i3,	%g5,	%l0
	fmovsg	%icc,	%f14,	%f27
	andcc	%o2,	0x1C69,	%l6
	stw	%g6,	[%l7 + 0x3C]
	edge32l	%l1,	%g2,	%o5
	fmovdle	%xcc,	%f30,	%f7
	fexpand	%f12,	%f24
	edge8ln	%i1,	%l2,	%o7
	fmovrdne	%i6,	%f10,	%f8
	andn	%o1,	%g4,	%o4
	edge16l	%g7,	%i4,	%i5
	xor	%o6,	0x0D2E,	%l5
	sra	%o0,	0x1C,	%i7
	fandnot2s	%f16,	%f28,	%f5
	fpack16	%f20,	%f10
	smulcc	%i0,	%i2,	%l4
	subccc	%g3,	0x1EAC,	%g1
	edge32n	%o3,	%l3,	%g5
	sub	%i3,	%o2,	%l6
	movl	%xcc,	%l0,	%l1
	move	%icc,	%g2,	%g6
	ldx	[%l7 + 0x70],	%i1
	alignaddrl	%l2,	%o5,	%o7
	edge16ln	%o1,	%g4,	%o4
	movle	%icc,	%i6,	%g7
	subccc	%i5,	0x0017,	%o6
	umulcc	%i4,	0x0E2F,	%l5
	fcmpne32	%f8,	%f14,	%i7
	fpack32	%f18,	%f22,	%f18
	ldsw	[%l7 + 0x10],	%i0
	xor	%i2,	%o0,	%l4
	andcc	%g3,	%g1,	%o3
	movneg	%xcc,	%l3,	%i3
	edge32ln	%o2,	%l6,	%g5
	array32	%l0,	%l1,	%g6
	fmovsn	%icc,	%f20,	%f11
	alignaddr	%g2,	%i1,	%o5
	xnor	%l2,	%o1,	%g4
	addccc	%o7,	0x0D2B,	%i6
	srl	%o4,	%i5,	%g7
	edge32n	%i4,	%l5,	%o6
	udivx	%i7,	0x11E2,	%i2
	alignaddrl	%o0,	%i0,	%l4
	andcc	%g3,	%o3,	%l3
	movvc	%xcc,	%i3,	%o2
	subccc	%g1,	%l6,	%g5
	movne	%xcc,	%l1,	%g6
	movl	%icc,	%l0,	%i1
	fmovrdlz	%o5,	%f22,	%f30
	movrne	%g2,	0x250,	%l2
	ldsw	[%l7 + 0x30],	%g4
	array32	%o1,	%i6,	%o4
	orn	%o7,	%i5,	%i4
	stb	%g7,	[%l7 + 0x63]
	movrlz	%o6,	0x3BD,	%i7
	ldub	[%l7 + 0x09],	%i2
	movne	%xcc,	%l5,	%o0
	movleu	%xcc,	%i0,	%l4
	fcmpeq16	%f18,	%f2,	%o3
	movre	%l3,	0x1F5,	%i3
	stb	%g3,	[%l7 + 0x08]
	sethi	0x06E1,	%g1
	movre	%l6,	%g5,	%o2
	xnorcc	%g6,	0x0FD9,	%l0
	udivx	%l1,	0x12E4,	%o5
	fmovrdgez	%g2,	%f0,	%f24
	fpadd16	%f22,	%f26,	%f28
	fmovdpos	%xcc,	%f27,	%f17
	fmul8x16au	%f24,	%f12,	%f10
	movrlz	%i1,	%l2,	%o1
	movrgz	%i6,	0x368,	%o4
	srax	%o7,	0x1C,	%i5
	fmovdleu	%xcc,	%f19,	%f17
	udivcc	%i4,	0x1E12,	%g4
	fmul8ulx16	%f18,	%f24,	%f28
	std	%f24,	[%l7 + 0x28]
	smul	%o6,	0x0047,	%g7
	movneg	%icc,	%i2,	%i7
	fmovdg	%xcc,	%f22,	%f26
	smul	%l5,	0x0271,	%i0
	orncc	%o0,	0x0808,	%l4
	orcc	%l3,	0x1C94,	%o3
	fmul8x16al	%f18,	%f22,	%f12
	fmovdvs	%icc,	%f2,	%f11
	sll	%g3,	%g1,	%l6
	stw	%i3,	[%l7 + 0x08]
	fandnot1	%f26,	%f18,	%f12
	ld	[%l7 + 0x78],	%f3
	edge32n	%o2,	%g6,	%g5
	st	%f16,	[%l7 + 0x5C]
	array8	%l0,	%o5,	%g2
	fmul8x16al	%f3,	%f2,	%f22
	mulx	%l1,	0x0305,	%i1
	movg	%xcc,	%l2,	%i6
	fmovscc	%xcc,	%f16,	%f10
	array8	%o4,	%o1,	%i5
	fandnot1s	%f24,	%f19,	%f7
	addccc	%i4,	%g4,	%o6
	fmul8x16	%f25,	%f4,	%f14
	movvc	%xcc,	%o7,	%g7
	add	%i7,	0x1CEE,	%l5
	and	%i2,	%i0,	%l4
	fsrc1	%f20,	%f12
	move	%icc,	%o0,	%l3
	ldub	[%l7 + 0x0B],	%o3
	fexpand	%f17,	%f0
	movge	%xcc,	%g1,	%g3
	addc	%l6,	0x141E,	%i3
	addc	%o2,	%g5,	%g6
	movne	%icc,	%l0,	%g2
	movle	%icc,	%o5,	%i1
	andn	%l1,	%i6,	%l2
	fpackfix	%f6,	%f22
	edge16n	%o4,	%i5,	%o1
	smulcc	%g4,	0x0C11,	%o6
	fandnot2	%f18,	%f30,	%f6
	fmovdle	%xcc,	%f26,	%f16
	subccc	%o7,	%g7,	%i4
	edge8l	%l5,	%i2,	%i7
	fcmpeq16	%f12,	%f22,	%l4
	movg	%icc,	%o0,	%i0
	edge16	%l3,	%g1,	%g3
	movge	%icc,	%l6,	%i3
	ldd	[%l7 + 0x58],	%o2
	siam	0x3
	sll	%g5,	%g6,	%l0
	edge32	%o2,	%o5,	%g2
	popc	0x0A5B,	%l1
	orncc	%i1,	%l2,	%o4
	sethi	0x0804,	%i6
	movne	%xcc,	%i5,	%o1
	std	%f22,	[%l7 + 0x50]
	fmovdvs	%icc,	%f12,	%f25
	edge16n	%o6,	%g4,	%o7
	edge16l	%g7,	%l5,	%i2
	and	%i4,	0x1F2B,	%l4
	and	%i7,	%i0,	%o0
	ldsb	[%l7 + 0x30],	%g1
	fxor	%f0,	%f30,	%f14
	srax	%g3,	0x0F,	%l6
	sth	%i3,	[%l7 + 0x0C]
	edge32n	%o3,	%g5,	%g6
	udivx	%l3,	0x0A91,	%o2
	sir	0x1145
	fmovdneg	%icc,	%f17,	%f14
	and	%o5,	0x16F8,	%l0
	ldsb	[%l7 + 0x1A],	%l1
	fmovse	%xcc,	%f31,	%f16
	fsrc2s	%f27,	%f5
	edge32n	%g2,	%l2,	%o4
	movl	%icc,	%i1,	%i6
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	subc	%g4,	%o6,	%g7
	mulx	%o7,	%l5,	%i4
	array32	%l4,	%i7,	%i2
	movle	%icc,	%o0,	%i0
	andncc	%g1,	%g3,	%l6
	sdivx	%i3,	0x0232,	%o3
	stw	%g5,	[%l7 + 0x78]
	ldd	[%l7 + 0x30],	%l2
	or	%g6,	0x0742,	%o5
	std	%f4,	[%l7 + 0x28]
	fmovrdlez	%l0,	%f18,	%f28
	fmovrsgz	%o2,	%f13,	%f29
	alignaddrl	%g2,	%l1,	%l2
	xorcc	%i1,	%i6,	%i5
	srl	%o1,	%g4,	%o6
	sra	%o4,	0x0F,	%o7
	sir	0x1468
	sdiv	%l5,	0x11DF,	%i4
	edge32	%g7,	%i7,	%i2
	fmovdneg	%icc,	%f23,	%f16
	movle	%xcc,	%o0,	%l4
	sll	%i0,	%g1,	%g3
	lduh	[%l7 + 0x50],	%l6
	fsrc1s	%f4,	%f29
	movn	%xcc,	%o3,	%g5
	sra	%l3,	%g6,	%i3
	fmovspos	%icc,	%f16,	%f21
	fmovrslez	%l0,	%f27,	%f8
	nop
	set	0x6D, %o5
	ldub	[%l7 + %o5],	%o2
	xnorcc	%g2,	0x1323,	%l1
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%l2
	fpsub32s	%f20,	%f26,	%f15
	fmovsvs	%icc,	%f2,	%f19
	restore %i1, %i6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i5,	%o1,	%o6
	movrlez	%g4,	%o4,	%o7
	ldsb	[%l7 + 0x67],	%i4
	fmovrdgz	%g7,	%f10,	%f12
	movl	%icc,	%i7,	%l5
	fmovdl	%xcc,	%f14,	%f0
	move	%xcc,	%o0,	%i2
	movl	%xcc,	%i0,	%l4
	move	%xcc,	%g3,	%g1
	movleu	%xcc,	%l6,	%g5
	fmovsneg	%xcc,	%f27,	%f7
	sub	%o3,	%l3,	%i3
	movcc	%icc,	%l0,	%o2
	edge8	%g6,	%g2,	%l1
	orn	%i1,	%i6,	%o5
	or	%i5,	0x05E0,	%l2
	fmovsvs	%xcc,	%f11,	%f17
	sll	%o1,	0x1B,	%o6
	fmovrdlez	%o4,	%f0,	%f30
	fzeros	%f3
	fone	%f18
	fabss	%f21,	%f15
	xnor	%o7,	%g4,	%i4
	fpsub16	%f20,	%f28,	%f16
	movl	%xcc,	%g7,	%i7
	udivcc	%o0,	0x070A,	%l5
	stb	%i2,	[%l7 + 0x3A]
	andncc	%i0,	%l4,	%g1
	fmul8x16au	%f20,	%f14,	%f22
	fnot1	%f26,	%f26
	fsrc2s	%f27,	%f1
	smul	%g3,	%g5,	%l6
	subcc	%o3,	0x0AC5,	%l3
	movneg	%xcc,	%l0,	%i3
	sethi	0x1970,	%g6
	mulscc	%g2,	%o2,	%i1
	std	%f18,	[%l7 + 0x10]
	edge32	%l1,	%o5,	%i6
	edge8ln	%l2,	%o1,	%i5
	fmovsa	%xcc,	%f7,	%f14
	addcc	%o4,	0x1913,	%o7
	umulcc	%o6,	%i4,	%g7
	movneg	%icc,	%g4,	%o0
	orn	%l5,	%i2,	%i7
	st	%f18,	[%l7 + 0x60]
	fpmerge	%f8,	%f3,	%f8
	smulcc	%i0,	%g1,	%l4
	sub	%g5,	%g3,	%o3
	movne	%xcc,	%l6,	%l0
	save %l3, 0x1606, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i3,	[%l7 + 0x70]
	fandnot2s	%f22,	%f4,	%f26
	andncc	%g2,	%i1,	%l1
	ldsh	[%l7 + 0x14],	%o5
	sth	%o2,	[%l7 + 0x0C]
	movle	%xcc,	%l2,	%o1
	movcs	%icc,	%i6,	%o4
	udivcc	%o7,	0x1357,	%o6
	movcs	%xcc,	%i4,	%g7
	smulcc	%i5,	%g4,	%l5
	movvc	%xcc,	%o0,	%i2
	edge32l	%i0,	%g1,	%l4
	subcc	%i7,	%g5,	%g3
	fandnot2	%f12,	%f8,	%f26
	fpsub32	%f2,	%f20,	%f10
	movrlez	%o3,	0x213,	%l0
	ldsb	[%l7 + 0x24],	%l3
	orn	%g6,	%i3,	%l6
	sllx	%g2,	%i1,	%l1
	orn	%o5,	%o2,	%o1
	fones	%f0
	sdivcc	%i6,	0x1793,	%o4
	addcc	%l2,	0x0662,	%o7
	edge16ln	%i4,	%o6,	%i5
	fmovdvc	%icc,	%f0,	%f29
	fandnot1	%f16,	%f4,	%f24
	std	%f2,	[%l7 + 0x78]
	fpsub16	%f30,	%f8,	%f24
	subccc	%g7,	%l5,	%o0
	ldsw	[%l7 + 0x54],	%g4
	popc	%i0,	%i2
	movgu	%xcc,	%g1,	%i7
	lduh	[%l7 + 0x32],	%g5
	fmovsleu	%icc,	%f6,	%f8
	movrne	%g3,	0x2B4,	%o3
	udiv	%l0,	0x107E,	%l4
	fandnot2s	%f9,	%f0,	%f20
	udivcc	%l3,	0x18A0,	%i3
	array8	%l6,	%g2,	%g6
	alignaddr	%i1,	%o5,	%o2
	lduw	[%l7 + 0x68],	%l1
	fabsd	%f0,	%f10
	edge32l	%i6,	%o1,	%l2
	mulscc	%o7,	0x1B1F,	%o4
	movneg	%xcc,	%o6,	%i5
	array16	%g7,	%i4,	%l5
	fnors	%f30,	%f5,	%f17
	smul	%o0,	0x1260,	%i0
	and	%i2,	%g1,	%i7
	sllx	%g5,	0x0F,	%g3
	subccc	%g4,	%o3,	%l0
	movne	%icc,	%l3,	%l4
	andn	%l6,	0x10C4,	%g2
	movne	%icc,	%g6,	%i3
	fnot1s	%f15,	%f20
	edge8	%i1,	%o2,	%o5
	ld	[%l7 + 0x60],	%f25
	ldsb	[%l7 + 0x47],	%l1
	orncc	%i6,	%l2,	%o1
	movgu	%xcc,	%o4,	%o6
	fcmpgt16	%f14,	%f12,	%i5
	fzero	%f0
	lduh	[%l7 + 0x46],	%o7
	alignaddrl	%i4,	%g7,	%l5
	fmovrsgz	%o0,	%f29,	%f5
	popc	0x0EE5,	%i2
	fandnot1s	%f18,	%f31,	%f26
	fmul8x16al	%f19,	%f29,	%f2
	fone	%f20
	fnot2	%f8,	%f6
	movle	%xcc,	%i0,	%g1
	orncc	%i7,	%g3,	%g4
	andncc	%o3,	%g5,	%l0
	sdiv	%l4,	0x162E,	%l6
	ldd	[%l7 + 0x68],	%f22
	xnorcc	%l3,	%g2,	%g6
	for	%f4,	%f24,	%f0
	edge32ln	%i3,	%o2,	%i1
	srlx	%l1,	0x02,	%o5
	sub	%i6,	%o1,	%o4
	movne	%xcc,	%l2,	%i5
	edge16ln	%o6,	%o7,	%i4
	ld	[%l7 + 0x20],	%f20
	movn	%icc,	%g7,	%l5
	mova	%icc,	%i2,	%i0
	st	%f1,	[%l7 + 0x10]
	srl	%o0,	%g1,	%g3
	orncc	%i7,	%o3,	%g4
	edge32ln	%g5,	%l4,	%l0
	movre	%l6,	0x0E6,	%g2
	popc	%g6,	%l3
	and	%o2,	0x1F71,	%i3
	fpack16	%f26,	%f19
	subc	%i1,	%l1,	%o5
	sub	%i6,	0x0D50,	%o1
	fcmpeq16	%f20,	%f28,	%l2
	st	%f22,	[%l7 + 0x08]
	movle	%xcc,	%o4,	%i5
	faligndata	%f6,	%f10,	%f6
	mulx	%o7,	%i4,	%g7
	movpos	%icc,	%o6,	%l5
	sdivx	%i2,	0x1400,	%o0
	movcs	%xcc,	%i0,	%g1
	xorcc	%i7,	%g3,	%g4
	movcs	%icc,	%o3,	%g5
	sdivx	%l0,	0x10FF,	%l6
	sra	%g2,	0x11,	%l4
	ld	[%l7 + 0x64],	%f8
	fand	%f28,	%f12,	%f28
	movrlez	%l3,	0x08F,	%g6
	or	%o2,	%i3,	%i1
	umulcc	%l1,	0x13BE,	%o5
	fxor	%f4,	%f14,	%f6
	fpsub16	%f16,	%f18,	%f30
	movrgez	%o1,	0x387,	%l2
	mulx	%i6,	0x1E96,	%i5
	edge32n	%o4,	%i4,	%g7
	fmovdne	%icc,	%f28,	%f8
	fors	%f2,	%f14,	%f19
	subcc	%o6,	0x1225,	%l5
	andn	%o7,	0x0A8B,	%i2
	fpsub16	%f12,	%f22,	%f8
	lduh	[%l7 + 0x16],	%o0
	fcmple32	%f16,	%f22,	%g1
	movn	%xcc,	%i7,	%i0
	mulscc	%g3,	0x01B1,	%g4
	fmul8x16	%f22,	%f22,	%f2
	fmul8x16	%f1,	%f20,	%f0
	ldsw	[%l7 + 0x78],	%g5
	stx	%l0,	[%l7 + 0x60]
	andn	%o3,	0x04C9,	%l6
	or	%l4,	%g2,	%g6
	for	%f16,	%f30,	%f26
	sll	%l3,	0x09,	%i3
	fmovdvs	%icc,	%f0,	%f4
	siam	0x3
	edge8n	%o2,	%l1,	%o5
	nop
	set	0x79, %l6
	ldsb	[%l7 + %l6],	%i1
	mulx	%l2,	%o1,	%i6
	fornot1s	%f6,	%f7,	%f27
	lduw	[%l7 + 0x10],	%i5
	fzero	%f14
	subc	%o4,	%i4,	%o6
	stx	%l5,	[%l7 + 0x18]
	fpsub16s	%f18,	%f30,	%f28
	ldsb	[%l7 + 0x30],	%o7
	movre	%i2,	%o0,	%g1
	fxnors	%f17,	%f28,	%f13
	fmovsne	%xcc,	%f26,	%f23
	orn	%g7,	0x1B25,	%i0
	fmovdn	%icc,	%f10,	%f24
	sdiv	%i7,	0x141B,	%g4
	movrgz	%g3,	%l0,	%o3
	subc	%g5,	0x1EAC,	%l4
	xnor	%l6,	0x105E,	%g6
	fmovrsgz	%l3,	%f21,	%f9
	movgu	%xcc,	%i3,	%g2
	smul	%o2,	%o5,	%l1
	edge8	%i1,	%o1,	%l2
	fpadd16s	%f6,	%f17,	%f17
	addccc	%i5,	%i6,	%o4
	udivcc	%i4,	0x0C18,	%l5
	movcc	%xcc,	%o7,	%o6
	std	%f24,	[%l7 + 0x08]
	fmovsn	%xcc,	%f23,	%f17
	xorcc	%o0,	%g1,	%i2
	or	%g7,	%i0,	%g4
	movneg	%icc,	%g3,	%l0
	xnor	%o3,	%i7,	%l4
	stb	%l6,	[%l7 + 0x52]
	ldd	[%l7 + 0x18],	%g4
	nop
	set	0x30, %i5
	std	%f30,	[%l7 + %i5]
	fmovsvc	%xcc,	%f21,	%f6
	xorcc	%g6,	0x1B15,	%i3
	fexpand	%f6,	%f4
	sdiv	%g2,	0x1D26,	%o2
	srlx	%o5,	0x03,	%l3
	edge8	%i1,	%l1,	%o1
	movre	%l2,	%i6,	%i5
	udivx	%o4,	0x0AF8,	%l5
	fzeros	%f0
	subcc	%i4,	0x19D2,	%o7
	umulcc	%o0,	0x147C,	%g1
	fandnot2	%f30,	%f20,	%f18
	fzero	%f30
	popc	%i2,	%g7
	fpsub32	%f10,	%f2,	%f6
	mulscc	%o6,	%i0,	%g3
	fcmple16	%f26,	%f26,	%l0
	lduw	[%l7 + 0x6C],	%o3
	nop
	set	0x34, %i0
	ldsh	[%l7 + %i0],	%i7
	or	%l4,	%g4,	%l6
	orcc	%g6,	%i3,	%g2
	srl	%g5,	%o2,	%o5
	fmovdgu	%icc,	%f18,	%f0
	fmovsne	%xcc,	%f30,	%f2
	subccc	%i1,	%l1,	%l3
	mulscc	%l2,	0x1013,	%o1
	save %i5, 0x0646, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%l5,	%i4
	umulcc	%i6,	%o0,	%g1
	andcc	%o7,	0x1C7A,	%i2
	xnor	%g7,	0x0904,	%i0
	fones	%f9
	fcmpeq32	%f20,	%f26,	%o6
	addccc	%l0,	0x0BFD,	%o3
	andcc	%i7,	%l4,	%g4
	add	%l6,	0x077C,	%g6
	addccc	%i3,	%g2,	%g5
	array8	%o2,	%o5,	%g3
	fandnot1s	%f29,	%f4,	%f27
	fornot2s	%f24,	%f31,	%f10
	edge16n	%l1,	%i1,	%l2
	add	%l3,	0x17CB,	%o1
	ldx	[%l7 + 0x68],	%i5
	orncc	%l5,	%i4,	%o4
	movvc	%xcc,	%i6,	%g1
	udivcc	%o0,	0x040D,	%o7
	movgu	%icc,	%g7,	%i2
	fpsub32	%f18,	%f26,	%f12
	edge16	%i0,	%l0,	%o6
	andn	%o3,	%l4,	%g4
	srl	%l6,	0x18,	%i7
	fornot2s	%f16,	%f14,	%f27
	ldx	[%l7 + 0x08],	%g6
	fpsub16s	%f31,	%f3,	%f1
	sth	%i3,	[%l7 + 0x78]
	lduh	[%l7 + 0x38],	%g2
	edge8n	%o2,	%g5,	%g3
	fmovdg	%icc,	%f9,	%f9
	array16	%l1,	%i1,	%l2
	movneg	%xcc,	%o5,	%l3
	movgu	%xcc,	%o1,	%l5
	popc	0x1377,	%i4
	movn	%xcc,	%o4,	%i5
	movleu	%xcc,	%i6,	%o0
	andn	%o7,	%g1,	%g7
	edge16	%i0,	%i2,	%o6
	fpsub32	%f26,	%f12,	%f14
	movvs	%icc,	%o3,	%l0
	sethi	0x0840,	%g4
	fpadd16	%f12,	%f10,	%f2
	sdiv	%l6,	0x0BC3,	%i7
	fcmpne32	%f24,	%f18,	%g6
	edge8n	%i3,	%g2,	%o2
	or	%g5,	%g3,	%l4
	fcmpne16	%f14,	%f6,	%i1
	popc	0x06B9,	%l2
	stx	%l1,	[%l7 + 0x30]
	fmovsa	%icc,	%f26,	%f2
	edge16	%l3,	%o5,	%l5
	addcc	%o1,	%o4,	%i4
	fmovrdgez	%i6,	%f22,	%f18
	addc	%o0,	0x08AE,	%i5
	movvs	%xcc,	%o7,	%g7
	movcc	%icc,	%g1,	%i2
	edge16n	%i0,	%o6,	%l0
	movle	%xcc,	%o3,	%l6
	movrgz	%g4,	0x2A0,	%i7
	edge32	%i3,	%g2,	%g6
	sub	%g5,	%g3,	%o2
	movneg	%icc,	%i1,	%l4
	fxor	%f12,	%f2,	%f0
	movg	%icc,	%l2,	%l1
	edge16n	%l3,	%l5,	%o5
	orcc	%o4,	0x0C48,	%o1
	sdivcc	%i4,	0x0CE5,	%o0
	movneg	%icc,	%i5,	%o7
	andncc	%i6,	%g1,	%g7
	fmovde	%xcc,	%f21,	%f15
	subcc	%i2,	0x13B2,	%i0
	smulcc	%l0,	0x1FB3,	%o6
	sub	%l6,	%g4,	%o3
	fzero	%f8
	sllx	%i7,	0x1B,	%g2
	edge8l	%i3,	%g5,	%g3
	alignaddrl	%o2,	%g6,	%l4
	edge32n	%i1,	%l2,	%l3
	edge8	%l5,	%l1,	%o4
	fmul8x16	%f24,	%f22,	%f24
	edge8ln	%o1,	%i4,	%o0
	smul	%i5,	0x113A,	%o7
	sir	0x1304
	edge32l	%o5,	%g1,	%g7
	subccc	%i6,	0x1B24,	%i2
	movleu	%xcc,	%l0,	%i0
	edge16	%o6,	%g4,	%l6
	fsrc2s	%f0,	%f26
	array16	%o3,	%g2,	%i7
	lduh	[%l7 + 0x2E],	%i3
	andn	%g5,	%o2,	%g6
	subccc	%l4,	0x1FFA,	%g3
	lduw	[%l7 + 0x64],	%i1
	orn	%l2,	0x11BD,	%l5
	movrgez	%l1,	0x393,	%o4
	ldd	[%l7 + 0x78],	%o0
	movrgz	%l3,	%o0,	%i4
	mulx	%o7,	0x071C,	%i5
	umul	%o5,	%g7,	%i6
	andncc	%i2,	%l0,	%g1
	ldub	[%l7 + 0x1E],	%o6
	fmuld8ulx16	%f13,	%f1,	%f12
	fmovrsne	%g4,	%f13,	%f20
	fcmpgt32	%f10,	%f20,	%i0
	edge16ln	%l6,	%g2,	%i7
	sllx	%i3,	%o3,	%o2
	movrgz	%g5,	0x22D,	%g6
	sll	%l4,	%i1,	%l2
	orcc	%l5,	0x1C73,	%l1
	fmovscc	%xcc,	%f13,	%f28
	alignaddrl	%g3,	%o1,	%o4
	add	%l3,	%i4,	%o0
	edge32n	%o7,	%i5,	%o5
	ld	[%l7 + 0x5C],	%f3
	sll	%i6,	0x00,	%g7
	sll	%l0,	%i2,	%g1
	andncc	%g4,	%i0,	%l6
	ldsb	[%l7 + 0x09],	%o6
	subc	%g2,	0x0135,	%i7
	lduh	[%l7 + 0x5C],	%i3
	movg	%xcc,	%o2,	%o3
	fcmped	%fcc0,	%f18,	%f14
	alignaddr	%g6,	%g5,	%i1
	subcc	%l4,	0x0F14,	%l5
	fmovrslez	%l1,	%f9,	%f3
	move	%icc,	%l2,	%g3
	ldd	[%l7 + 0x40],	%o0
	fnot1s	%f1,	%f7
	sdivx	%o4,	0x0EF5,	%i4
	for	%f14,	%f28,	%f2
	fmovdvc	%xcc,	%f19,	%f11
	edge32ln	%l3,	%o7,	%i5
	sdivcc	%o0,	0x0375,	%o5
	sdivcc	%g7,	0x0FC8,	%i6
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	fmovrsne	%g4,	%f27,	%f1
	andn	%i0,	%o6,	%l6
	fmovdvs	%xcc,	%f18,	%f25
	fmovsa	%xcc,	%f21,	%f26
	edge16l	%g2,	%i3,	%i7
	edge32	%o3,	%g6,	%o2
	fpsub16s	%f17,	%f1,	%f19
	or	%i1,	%l4,	%l5
	movne	%icc,	%g5,	%l1
	udivcc	%l2,	0x0CDA,	%g3
	fmovdl	%xcc,	%f28,	%f18
	addccc	%o4,	0x042D,	%i4
	fmovdg	%xcc,	%f14,	%f15
	movrne	%l3,	0x2FE,	%o7
	movrgez	%o1,	%i5,	%o0
	move	%xcc,	%g7,	%i6
	xnor	%i2,	0x0C7C,	%o5
	fands	%f21,	%f29,	%f29
	fmovdvs	%icc,	%f31,	%f17
	fexpand	%f21,	%f0
	srlx	%g1,	%l0,	%i0
	movpos	%xcc,	%g4,	%o6
	subc	%g2,	%l6,	%i3
	movrlz	%o3,	0x07F,	%i7
	xnor	%o2,	0x03DA,	%i1
	fxor	%f26,	%f14,	%f16
	fmovdcc	%xcc,	%f18,	%f20
	subcc	%l4,	%l5,	%g5
	move	%icc,	%l1,	%l2
	fxnors	%f7,	%f15,	%f16
	restore %g3, %g6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l3,	0x1AE3,	%o7
	fzero	%f28
	alignaddrl	%o1,	%i4,	%o0
	fmovdleu	%icc,	%f24,	%f26
	nop
	set	0x74, %g5
	stb	%i5,	[%l7 + %g5]
	movleu	%xcc,	%i6,	%g7
	fmovsne	%icc,	%f16,	%f24
	ldsb	[%l7 + 0x3A],	%i2
	save %o5, 0x0811, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x68],	%f26
	smulcc	%l0,	%g4,	%i0
	orncc	%o6,	0x19B7,	%l6
	movrgez	%i3,	0x20D,	%o3
	save %i7, 0x1517, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc2,	%f18,	%f19
	edge8ln	%g2,	%i1,	%l5
	fand	%f22,	%f22,	%f22
	fmul8x16al	%f25,	%f27,	%f22
	addccc	%l4,	%g5,	%l1
	fmovsneg	%xcc,	%f9,	%f10
	fmovrsne	%g3,	%f18,	%f12
	stw	%g6,	[%l7 + 0x3C]
	std	%f18,	[%l7 + 0x50]
	sir	0x18E8
	array16	%l2,	%l3,	%o7
	orncc	%o4,	0x1167,	%o1
	movrne	%o0,	%i5,	%i4
	stw	%i6,	[%l7 + 0x58]
	fpadd16	%f28,	%f0,	%f24
	mulx	%g7,	0x168D,	%o5
	fmovse	%xcc,	%f27,	%f20
	movn	%xcc,	%g1,	%i2
	fmovsvc	%xcc,	%f23,	%f10
	popc	%l0,	%i0
	mova	%icc,	%o6,	%l6
	array32	%g4,	%o3,	%i7
	sethi	0x1683,	%o2
	st	%f30,	[%l7 + 0x48]
	ldsb	[%l7 + 0x4E],	%g2
	fcmpgt32	%f8,	%f0,	%i3
	ldd	[%l7 + 0x58],	%l4
	sub	%i1,	%g5,	%l4
	xorcc	%l1,	%g3,	%l2
	srlx	%g6,	%l3,	%o4
	and	%o1,	%o0,	%i5
	sth	%i4,	[%l7 + 0x0C]
	alignaddr	%o7,	%g7,	%i6
	fmovsne	%icc,	%f10,	%f8
	fmovsvc	%icc,	%f27,	%f2
	smul	%g1,	%i2,	%l0
	andncc	%o5,	%o6,	%l6
	fmovrsgez	%g4,	%f24,	%f30
	sth	%i0,	[%l7 + 0x72]
	fnand	%f14,	%f4,	%f18
	fcmple16	%f16,	%f12,	%i7
	xnor	%o3,	0x1BD4,	%o2
	movrgez	%i3,	0x373,	%g2
	mova	%xcc,	%i1,	%g5
	alignaddrl	%l5,	%l4,	%g3
	movg	%icc,	%l2,	%g6
	array32	%l3,	%o4,	%o1
	subcc	%l1,	0x0DE3,	%i5
	movrgez	%i4,	%o0,	%g7
	fmovsvc	%icc,	%f5,	%f23
	umul	%o7,	%i6,	%g1
	sub	%l0,	%i2,	%o6
	ld	[%l7 + 0x6C],	%f27
	fsrc2	%f14,	%f2
	and	%l6,	0x0849,	%g4
	sdivcc	%o5,	0x1E3E,	%i7
	fmovdle	%xcc,	%f8,	%f4
	sra	%o3,	%o2,	%i0
	movrlz	%i3,	%g2,	%g5
	move	%icc,	%i1,	%l5
	orn	%l4,	%l2,	%g6
	udiv	%l3,	0x007F,	%o4
	movrlz	%o1,	0x35A,	%g3
	subccc	%l1,	0x18ED,	%i5
	movl	%icc,	%i4,	%g7
	mulx	%o0,	%i6,	%o7
	xnor	%g1,	%i2,	%l0
	array32	%l6,	%g4,	%o5
	fcmpgt16	%f14,	%f16,	%i7
	movrgz	%o6,	%o3,	%i0
	fnegd	%f2,	%f14
	fsrc2s	%f7,	%f27
	std	%f4,	[%l7 + 0x30]
	fors	%f13,	%f30,	%f28
	st	%f3,	[%l7 + 0x44]
	orncc	%o2,	%g2,	%g5
	subccc	%i1,	0x0BEF,	%l5
	subcc	%i3,	0x1B6B,	%l2
	lduw	[%l7 + 0x70],	%g6
	sll	%l3,	%l4,	%o1
	nop
	set	0x54, %i6
	ldsw	[%l7 + %i6],	%o4
	fmul8sux16	%f16,	%f6,	%f30
	sethi	0x1035,	%l1
	popc	0x0B39,	%i5
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	or	%i4,	0x0A6B,	%o7
	fones	%f28
	movrgz	%g1,	0x126,	%i2
	fmovsa	%icc,	%f24,	%f12
	movneg	%xcc,	%l0,	%i6
	fmuld8ulx16	%f15,	%f7,	%f10
	edge16l	%l6,	%g4,	%o5
	srax	%o6,	0x09,	%i7
	movvs	%icc,	%i0,	%o2
	movvs	%icc,	%g2,	%o3
	edge32n	%i1,	%g5,	%i3
	srlx	%l5,	%l2,	%g6
	movvc	%xcc,	%l4,	%o1
	fmovrslz	%l3,	%f12,	%f14
	orn	%o4,	0x1749,	%i5
	fmovdge	%icc,	%f23,	%f22
	fors	%f9,	%f3,	%f19
	movneg	%xcc,	%l1,	%g7
	edge16	%o0,	%i4,	%o7
	movge	%icc,	%g3,	%i2
	fnand	%f0,	%f0,	%f0
	orcc	%g1,	%i6,	%l0
	movcc	%xcc,	%g4,	%o5
	edge16	%o6,	%i7,	%l6
	fzero	%f22
	save %i0, 0x054A, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%i1,	%o3
	edge8	%g5,	%l5,	%l2
	popc	0x0EAC,	%g6
	array8	%l4,	%o1,	%i3
	alignaddr	%l3,	%i5,	%o4
	fmovdl	%xcc,	%f15,	%f8
	sethi	0x0E42,	%l1
	umulcc	%g7,	0x176B,	%i4
	smul	%o7,	%o0,	%g3
	movrlez	%g1,	0x23F,	%i2
	movvs	%icc,	%l0,	%i6
	subc	%o5,	%o6,	%i7
	st	%f25,	[%l7 + 0x6C]
	add	%g4,	0x01B7,	%l6
	ldsb	[%l7 + 0x65],	%i0
	movre	%o2,	0x025,	%i1
	fsrc1s	%f28,	%f30
	edge32ln	%g2,	%g5,	%l5
	andncc	%l2,	%o3,	%l4
	ldsh	[%l7 + 0x5E],	%o1
	edge32n	%g6,	%i3,	%i5
	movrne	%o4,	%l1,	%l3
	movle	%icc,	%i4,	%o7
	array32	%g7,	%g3,	%g1
	sir	0x0621
	udiv	%o0,	0x0AC9,	%l0
	or	%i2,	%o5,	%i6
	subcc	%o6,	0x1114,	%g4
	ldsh	[%l7 + 0x4C],	%l6
	lduw	[%l7 + 0x50],	%i0
	smul	%o2,	%i1,	%g2
	fandnot2s	%f20,	%f18,	%f3
	sdivx	%i7,	0x0348,	%l5
	sir	0x1314
	ldd	[%l7 + 0x28],	%l2
	movrne	%g5,	%o3,	%o1
	lduh	[%l7 + 0x48],	%g6
	movcs	%xcc,	%l4,	%i5
	andcc	%o4,	%l1,	%i3
	add	%i4,	%o7,	%l3
	addcc	%g7,	0x04EE,	%g3
	move	%xcc,	%g1,	%l0
	ldsh	[%l7 + 0x7E],	%o0
	srax	%o5,	%i6,	%i2
	movcc	%xcc,	%g4,	%o6
	fmovscc	%icc,	%f2,	%f24
	movg	%xcc,	%l6,	%o2
	sdiv	%i0,	0x0BA4,	%g2
	sdiv	%i7,	0x1CDF,	%l5
	mulx	%l2,	0x18FB,	%i1
	movgu	%xcc,	%o3,	%o1
	array8	%g6,	%g5,	%i5
	fmovsle	%xcc,	%f21,	%f8
	stw	%l4,	[%l7 + 0x14]
	fmovdne	%xcc,	%f16,	%f23
	bshuffle	%f24,	%f22,	%f8
	srax	%l1,	0x16,	%o4
	mulx	%i3,	%o7,	%l3
	movne	%xcc,	%i4,	%g3
	fabsd	%f10,	%f14
	or	%g7,	0x1DFC,	%g1
	mova	%xcc,	%l0,	%o0
	orn	%i6,	0x016C,	%i2
	fmovrslez	%g4,	%f18,	%f18
	fmovsn	%xcc,	%f11,	%f1
	movvc	%xcc,	%o5,	%o6
	movcc	%xcc,	%l6,	%i0
	movleu	%icc,	%o2,	%i7
	sth	%g2,	[%l7 + 0x56]
	srl	%l2,	0x02,	%l5
	popc	%i1,	%o1
	udivcc	%o3,	0x1826,	%g5
	movre	%i5,	0x147,	%l4
	sdivcc	%l1,	0x11FD,	%o4
	fsrc1	%f6,	%f12
	lduw	[%l7 + 0x7C],	%g6
	sra	%i3,	%o7,	%i4
	movvc	%icc,	%g3,	%g7
	add	%l3,	0x1833,	%l0
	popc	%o0,	%g1
	lduw	[%l7 + 0x60],	%i6
	smulcc	%i2,	0x0209,	%o5
	xorcc	%o6,	%l6,	%g4
	ldd	[%l7 + 0x10],	%o2
	fzero	%f26
	ldsh	[%l7 + 0x18],	%i0
	ldsh	[%l7 + 0x26],	%i7
	movrne	%g2,	0x37A,	%l2
	movrne	%l5,	%o1,	%i1
	movg	%icc,	%o3,	%g5
	movvc	%xcc,	%l4,	%l1
	xorcc	%i5,	%o4,	%g6
	fsrc1	%f6,	%f0
	fmul8x16	%f23,	%f12,	%f0
	movre	%i3,	%o7,	%i4
	fzero	%f10
	sth	%g7,	[%l7 + 0x48]
	move	%xcc,	%g3,	%l0
	udivx	%o0,	0x00B7,	%l3
	fmovdneg	%icc,	%f13,	%f14
	ldsw	[%l7 + 0x7C],	%g1
	sdivcc	%i2,	0x16C2,	%i6
	edge8n	%o6,	%l6,	%o5
	ldub	[%l7 + 0x45],	%g4
	addc	%o2,	0x1F68,	%i0
	fand	%f12,	%f14,	%f6
	addc	%i7,	0x1FF9,	%g2
	fmul8x16al	%f10,	%f15,	%f12
	movle	%icc,	%l5,	%l2
	mulscc	%i1,	%o1,	%g5
	edge8	%l4,	%o3,	%i5
	movge	%icc,	%l1,	%g6
	movgu	%xcc,	%i3,	%o7
	movn	%xcc,	%i4,	%o4
	alignaddr	%g7,	%g3,	%l0
	stw	%o0,	[%l7 + 0x64]
	ldub	[%l7 + 0x09],	%g1
	stw	%l3,	[%l7 + 0x74]
	fmuld8sux16	%f23,	%f15,	%f16
	movneg	%xcc,	%i2,	%i6
	edge16l	%l6,	%o5,	%g4
	movre	%o2,	%o6,	%i7
	movrlez	%g2,	0x2F2,	%l5
	ldx	[%l7 + 0x70],	%i0
	ldsw	[%l7 + 0x78],	%i1
	fpadd32	%f28,	%f30,	%f2
	alignaddrl	%o1,	%g5,	%l2
	udiv	%o3,	0x0A6F,	%l4
	smulcc	%l1,	0x0E6E,	%g6
	mulscc	%i3,	%o7,	%i5
	fmovdvc	%icc,	%f14,	%f14
	xnor	%i4,	%o4,	%g7
	fnot1s	%f29,	%f20
	add	%l0,	%o0,	%g3
	ldd	[%l7 + 0x70],	%g0
	andn	%l3,	%i6,	%l6
	fcmple32	%f8,	%f2,	%i2
	movcs	%icc,	%g4,	%o2
	alignaddrl	%o6,	%o5,	%g2
	popc	0x003D,	%i7
	addcc	%l5,	%i1,	%i0
	fpack32	%f8,	%f12,	%f6
	or	%g5,	0x16D7,	%o1
	stb	%l2,	[%l7 + 0x73]
	lduh	[%l7 + 0x40],	%o3
	movl	%icc,	%l1,	%g6
	xor	%i3,	0x10CE,	%l4
	fmovrslz	%i5,	%f7,	%f11
	fpsub32s	%f17,	%f10,	%f3
	ldd	[%l7 + 0x18],	%i4
	movrlz	%o7,	%o4,	%g7
	faligndata	%f8,	%f14,	%f16
	movvs	%xcc,	%l0,	%o0
	sllx	%g3,	0x1A,	%l3
	movrlez	%i6,	%l6,	%g1
	umulcc	%g4,	0x1702,	%o2
	fnands	%f3,	%f15,	%f9
	sdivcc	%i2,	0x1368,	%o5
	srlx	%g2,	0x1B,	%o6
	xnor	%l5,	%i7,	%i1
	addc	%i0,	0x0E70,	%o1
	addccc	%l2,	%o3,	%g5
	alignaddr	%l1,	%i3,	%g6
	lduw	[%l7 + 0x74],	%i5
	fnors	%f15,	%f23,	%f11
	fmovdge	%xcc,	%f15,	%f5
	orncc	%i4,	0x1080,	%l4
	fornot2	%f20,	%f6,	%f30
	nop
	set	0x41, %g4
	stb	%o7,	[%l7 + %g4]
	for	%f6,	%f2,	%f30
	movn	%xcc,	%g7,	%l0
	alignaddr	%o4,	%g3,	%l3
	addcc	%o0,	%l6,	%i6
	smul	%g1,	0x11A0,	%o2
	alignaddr	%g4,	%o5,	%g2
	fmovsle	%icc,	%f11,	%f19
	popc	%o6,	%l5
	andcc	%i7,	%i2,	%i1
	orcc	%i0,	%o1,	%l2
	stw	%g5,	[%l7 + 0x24]
	srax	%l1,	0x13,	%o3
	movneg	%icc,	%g6,	%i3
	movne	%icc,	%i4,	%i5
	xor	%l4,	0x1F33,	%g7
	movge	%icc,	%l0,	%o4
	movcs	%xcc,	%g3,	%o7
	movne	%xcc,	%l3,	%o0
	andncc	%l6,	%i6,	%o2
	movrgz	%g1,	%o5,	%g4
	sllx	%g2,	0x10,	%o6
	subcc	%l5,	0x177B,	%i2
	edge8ln	%i1,	%i0,	%i7
	ldsw	[%l7 + 0x68],	%l2
	ldsh	[%l7 + 0x1C],	%g5
	ldsb	[%l7 + 0x56],	%l1
	edge8ln	%o3,	%g6,	%o1
	movleu	%icc,	%i3,	%i5
	sdiv	%i4,	0x1B7C,	%l4
	movvc	%xcc,	%l0,	%o4
	orn	%g3,	0x1883,	%g7
	fmovdvc	%icc,	%f21,	%f4
	movle	%xcc,	%o7,	%o0
	movvc	%xcc,	%l6,	%i6
	stb	%o2,	[%l7 + 0x18]
	ld	[%l7 + 0x4C],	%f17
	sdivx	%l3,	0x135F,	%g1
	fpadd16s	%f21,	%f8,	%f19
	edge16	%g4,	%g2,	%o5
	fmovscs	%icc,	%f31,	%f16
	edge16n	%l5,	%o6,	%i2
	edge32	%i1,	%i0,	%l2
	movle	%xcc,	%g5,	%i7
	edge8ln	%l1,	%o3,	%o1
	lduh	[%l7 + 0x6E],	%i3
	edge32	%g6,	%i5,	%l4
	fxnor	%f8,	%f6,	%f20
	st	%f29,	[%l7 + 0x08]
	fmul8x16au	%f26,	%f8,	%f28
	or	%l0,	%o4,	%i4
	std	%f30,	[%l7 + 0x78]
	mova	%icc,	%g7,	%o7
	andn	%o0,	%g3,	%l6
	sdivx	%o2,	0x0B02,	%l3
	udivx	%g1,	0x089D,	%i6
	bshuffle	%f4,	%f6,	%f28
	mulscc	%g4,	%g2,	%l5
	fpmerge	%f19,	%f4,	%f24
	edge32	%o6,	%o5,	%i1
	ldd	[%l7 + 0x50],	%f4
	fmovda	%icc,	%f4,	%f5
	fmul8ulx16	%f12,	%f0,	%f6
	addcc	%i0,	0x146B,	%i2
	fpsub32	%f8,	%f22,	%f0
	edge16ln	%g5,	%l2,	%l1
	fxors	%f20,	%f4,	%f11
	orcc	%o3,	%o1,	%i7
	movcc	%icc,	%g6,	%i5
	fmovdge	%xcc,	%f3,	%f11
	stb	%l4,	[%l7 + 0x1A]
	and	%i3,	%o4,	%l0
	movle	%xcc,	%i4,	%g7
	fcmpgt16	%f16,	%f12,	%o7
	movrgz	%g3,	%l6,	%o0
	fsrc1	%f2,	%f24
	fmovsleu	%icc,	%f18,	%f1
	fandnot2	%f4,	%f24,	%f6
	sub	%o2,	0x10FD,	%l3
	edge8n	%i6,	%g1,	%g4
	move	%xcc,	%g2,	%l5
	array16	%o6,	%o5,	%i1
	fcmpeq16	%f26,	%f16,	%i2
	addcc	%i0,	%g5,	%l1
	array32	%l2,	%o1,	%i7
	fpsub32s	%f9,	%f16,	%f0
	ldx	[%l7 + 0x18],	%o3
	nop
	set	0x78, %g7
	std	%f0,	[%l7 + %g7]
	mulscc	%i5,	0x08E4,	%l4
	edge16n	%g6,	%i3,	%o4
	fnors	%f1,	%f11,	%f29
	edge16l	%l0,	%g7,	%i4
	sir	0x0012
	restore %o7, %g3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fors	%f9,	%f25,	%f17
	andncc	%i6,	%l6,	%g4
	movre	%g1,	%l5,	%g2
	xnor	%o6,	%i1,	%o5
	orn	%i0,	0x0176,	%i2
	fornot1	%f12,	%f4,	%f24
	movl	%xcc,	%g5,	%l2
	save %o1, 0x1DFA, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i7,	%i5,	%l4
	sir	0x0286
	edge32	%g6,	%i3,	%o3
	smul	%o4,	%l0,	%i4
	sdivcc	%g7,	0x0A13,	%o7
	and	%g3,	0x11F5,	%o2
	stb	%l3,	[%l7 + 0x73]
	edge16	%o0,	%l6,	%g4
	move	%icc,	%i6,	%g1
	movn	%xcc,	%l5,	%g2
	addc	%o6,	%i1,	%i0
	movneg	%xcc,	%i2,	%o5
	umulcc	%l2,	%o1,	%l1
	stb	%g5,	[%l7 + 0x5B]
	orn	%i5,	%l4,	%g6
	fmovsneg	%icc,	%f23,	%f27
	nop
	set	0x12, %g6
	sth	%i7,	[%l7 + %g6]
	fmovdvc	%xcc,	%f9,	%f26
	addc	%i3,	0x041D,	%o4
	fmovdneg	%xcc,	%f25,	%f27
	movrgez	%o3,	%i4,	%g7
	fmovrdgez	%l0,	%f12,	%f20
	addccc	%g3,	0x00A3,	%o7
	orcc	%o2,	0x021D,	%l3
	edge8l	%l6,	%g4,	%o0
	edge32	%g1,	%i6,	%l5
	alignaddr	%g2,	%o6,	%i1
	lduh	[%l7 + 0x3C],	%i0
	orcc	%o5,	0x155F,	%i2
	movge	%xcc,	%l2,	%l1
	ldub	[%l7 + 0x29],	%o1
	fcmpgt32	%f6,	%f26,	%g5
	andn	%i5,	%g6,	%l4
	fmovdn	%xcc,	%f12,	%f13
	ldx	[%l7 + 0x40],	%i7
	fmovsge	%xcc,	%f25,	%f2
	andcc	%o4,	%o3,	%i4
	fexpand	%f19,	%f20
	movge	%icc,	%i3,	%g7
	fnor	%f28,	%f22,	%f26
	nop
	set	0x55, %i1
	ldsb	[%l7 + %i1],	%g3
	ldub	[%l7 + 0x7B],	%l0
	ldd	[%l7 + 0x18],	%f12
	sll	%o2,	%l3,	%o7
	smulcc	%g4,	%o0,	%l6
	sub	%g1,	0x0C2D,	%i6
	array32	%l5,	%o6,	%i1
	fnands	%f11,	%f3,	%f22
	array8	%i0,	%o5,	%g2
	subcc	%l2,	%l1,	%o1
	mulscc	%i2,	0x19C4,	%i5
	mulx	%g6,	0x1F22,	%g5
	ldsb	[%l7 + 0x3E],	%i7
	fmovrdlez	%l4,	%f20,	%f26
	fcmple32	%f30,	%f24,	%o3
	edge32n	%i4,	%i3,	%g7
	fpmerge	%f4,	%f8,	%f16
	addccc	%o4,	%l0,	%g3
	fmul8sux16	%f10,	%f4,	%f26
	and	%l3,	%o7,	%o2
	movrgz	%o0,	0x04B,	%l6
	sdivcc	%g1,	0x1CC6,	%g4
	udivcc	%i6,	0x1376,	%o6
	sdivcc	%i1,	0x1B4F,	%i0
	mulx	%o5,	0x0DE2,	%g2
	andn	%l2,	%l5,	%o1
	sllx	%i2,	%l1,	%i5
	ldsh	[%l7 + 0x3C],	%g5
	fmovdn	%xcc,	%f4,	%f10
	sdivx	%i7,	0x1056,	%l4
	sra	%o3,	%g6,	%i3
	subc	%g7,	%o4,	%i4
	or	%l0,	%l3,	%g3
	movrne	%o2,	%o0,	%l6
	movcc	%xcc,	%o7,	%g4
	mulscc	%i6,	0x0A08,	%g1
	edge32l	%o6,	%i1,	%i0
	orn	%o5,	0x039B,	%g2
	addcc	%l5,	%l2,	%o1
	ldd	[%l7 + 0x10],	%i2
	mova	%xcc,	%i5,	%l1
	umul	%i7,	%l4,	%g5
	movrgz	%o3,	0x15A,	%i3
	xor	%g7,	0x02BE,	%g6
	fxor	%f28,	%f22,	%f24
	srl	%o4,	0x11,	%l0
	add	%l3,	0x1E98,	%i4
	edge16n	%g3,	%o2,	%l6
	xorcc	%o0,	%g4,	%o7
	addccc	%i6,	%o6,	%i1
	movleu	%xcc,	%i0,	%g1
	ldsb	[%l7 + 0x0B],	%g2
	sdivx	%o5,	0x049F,	%l5
	fnands	%f6,	%f10,	%f21
	alignaddr	%l2,	%i2,	%o1
	movre	%l1,	%i5,	%i7
	move	%icc,	%l4,	%o3
	sdivx	%i3,	0x0B1B,	%g7
	movleu	%icc,	%g6,	%o4
	movrne	%g5,	%l3,	%l0
	ldsw	[%l7 + 0x14],	%g3
	fnot2s	%f7,	%f29
	restore %o2, 0x03FC, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l6,	%o0,	%o7
	stx	%i6,	[%l7 + 0x18]
	movge	%icc,	%g4,	%o6
	add	%i1,	%g1,	%i0
	edge8	%o5,	%l5,	%l2
	movcs	%icc,	%g2,	%i2
	fornot1	%f12,	%f26,	%f12
	subccc	%l1,	%i5,	%i7
	ldd	[%l7 + 0x20],	%l4
	edge32n	%o1,	%i3,	%o3
	edge8	%g7,	%g6,	%g5
	stx	%o4,	[%l7 + 0x38]
	smulcc	%l0,	0x0452,	%l3
	ldx	[%l7 + 0x08],	%g3
	st	%f25,	[%l7 + 0x30]
	fmovs	%f24,	%f1
	xor	%o2,	%i4,	%o0
	sdivcc	%l6,	0x0A50,	%i6
	movleu	%icc,	%g4,	%o6
	bshuffle	%f22,	%f12,	%f22
	fmovda	%icc,	%f19,	%f7
	xnor	%o7,	0x14FA,	%g1
	fornot2	%f12,	%f22,	%f30
	array16	%i1,	%o5,	%i0
	array32	%l5,	%g2,	%l2
	fcmpgt32	%f2,	%f2,	%l1
	ld	[%l7 + 0x38],	%f7
	edge32ln	%i5,	%i2,	%i7
	srlx	%o1,	%l4,	%o3
	fmovrdlz	%i3,	%f6,	%f30
	mova	%xcc,	%g6,	%g7
	move	%xcc,	%o4,	%l0
	fxor	%f20,	%f6,	%f8
	and	%g5,	%g3,	%l3
	pdist	%f28,	%f24,	%f0
	faligndata	%f0,	%f8,	%f22
	movleu	%xcc,	%o2,	%i4
	fxnors	%f13,	%f15,	%f31
	edge32n	%l6,	%i6,	%o0
	movrgez	%o6,	0x367,	%o7
	movg	%xcc,	%g4,	%i1
	std	%f6,	[%l7 + 0x38]
	lduw	[%l7 + 0x54],	%o5
	fmovdg	%icc,	%f27,	%f31
	fcmpes	%fcc0,	%f18,	%f26
	edge8l	%i0,	%l5,	%g1
	sll	%l2,	0x0A,	%g2
	subc	%l1,	0x0DD0,	%i5
	alignaddr	%i7,	%i2,	%l4
	std	%f6,	[%l7 + 0x40]
	movgu	%icc,	%o3,	%o1
	fornot1s	%f11,	%f31,	%f17
	umulcc	%g6,	%i3,	%g7
	ldsb	[%l7 + 0x0D],	%o4
	sll	%l0,	%g3,	%g5
	subccc	%o2,	0x0E97,	%l3
	udiv	%l6,	0x1BEC,	%i6
	subccc	%i4,	0x0DD7,	%o6
	umulcc	%o0,	0x1349,	%g4
	movg	%xcc,	%o7,	%i1
	add	%o5,	%i0,	%l5
	movg	%icc,	%l2,	%g1
	edge8n	%l1,	%i5,	%g2
	edge32	%i7,	%i2,	%o3
	movne	%icc,	%o1,	%l4
	movvs	%icc,	%g6,	%i3
	fmovrsgz	%o4,	%f17,	%f10
	sll	%g7,	0x0C,	%g3
	and	%g5,	0x183E,	%l0
	array16	%o2,	%l6,	%i6
	fmovrslez	%l3,	%f10,	%f20
	alignaddr	%i4,	%o0,	%g4
	movpos	%icc,	%o6,	%o7
	sdiv	%i1,	0x169D,	%o5
	movvc	%xcc,	%l5,	%i0
	movcc	%icc,	%l2,	%l1
	subc	%i5,	%g1,	%g2
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i6
	stx	%i2,	[%l7 + 0x68]
	array16	%o1,	%l4,	%o3
	movvc	%xcc,	%g6,	%i3
	fmovdgu	%xcc,	%f29,	%f21
	udivcc	%o4,	0x13E6,	%g7
	sdiv	%g5,	0x1474,	%l0
	lduw	[%l7 + 0x2C],	%o2
	stx	%g3,	[%l7 + 0x50]
	movleu	%icc,	%i6,	%l6
	udivcc	%i4,	0x1BD6,	%l3
	sdiv	%g4,	0x0A75,	%o6
	edge32l	%o7,	%o0,	%o5
	ldsh	[%l7 + 0x3E],	%i1
	fmovsleu	%icc,	%f6,	%f23
	movrlez	%l5,	%l2,	%l1
	movneg	%xcc,	%i5,	%i0
	srax	%g2,	0x11,	%i7
	array32	%i2,	%g1,	%o1
	edge32ln	%o3,	%g6,	%i3
	nop
	set	0x50, %i7
	ldsw	[%l7 + %i7],	%l4
	movcs	%icc,	%o4,	%g5
	edge32l	%l0,	%o2,	%g7
	stx	%g3,	[%l7 + 0x50]
	fandnot2s	%f22,	%f16,	%f17
	array16	%l6,	%i4,	%l3
	lduh	[%l7 + 0x7E],	%i6
	fmovrde	%g4,	%f16,	%f8
	pdist	%f30,	%f10,	%f20
	fcmpgt32	%f22,	%f10,	%o7
	movre	%o0,	0x2FC,	%o6
	movneg	%icc,	%i1,	%l5
	edge8l	%o5,	%l2,	%i5
	edge32n	%i0,	%l1,	%g2
	fmovse	%icc,	%f8,	%f22
	xorcc	%i2,	0x1CD9,	%g1
	umul	%i7,	0x0465,	%o1
	edge32l	%g6,	%o3,	%l4
	ld	[%l7 + 0x48],	%f0
	fmovrse	%o4,	%f30,	%f30
	or	%i3,	%g5,	%o2
	fmovd	%f12,	%f30
	fmovrdgz	%g7,	%f14,	%f12
	edge8ln	%g3,	%l0,	%i4
	edge8n	%l3,	%l6,	%i6
	stw	%g4,	[%l7 + 0x58]
	udivx	%o0,	0x1558,	%o6
	fxnor	%f26,	%f12,	%f14
	fmovdl	%xcc,	%f31,	%f4
	edge16l	%o7,	%i1,	%o5
	and	%l2,	0x046D,	%l5
	udivcc	%i5,	0x030C,	%i0
	movne	%icc,	%g2,	%l1
	fmovrsgz	%i2,	%f8,	%f1
	movne	%xcc,	%i7,	%o1
	sir	0x1E6F
	sll	%g6,	0x18,	%o3
	sll	%l4,	0x16,	%g1
	movrgz	%o4,	0x3D7,	%i3
	fpack32	%f14,	%f26,	%f18
	fmovs	%f11,	%f16
	fmovsvc	%xcc,	%f22,	%f29
	movleu	%icc,	%g5,	%o2
	addcc	%g3,	0x0DCE,	%g7
	fnegd	%f4,	%f26
	umul	%l0,	%i4,	%l6
	move	%icc,	%l3,	%i6
	movvc	%icc,	%g4,	%o0
	fmovsne	%xcc,	%f25,	%f1
	edge32l	%o7,	%i1,	%o6
	addc	%o5,	%l5,	%i5
	st	%f29,	[%l7 + 0x28]
	fabss	%f7,	%f22
	st	%f15,	[%l7 + 0x40]
	array16	%i0,	%l2,	%g2
	edge32n	%i2,	%i7,	%o1
	andncc	%l1,	%g6,	%l4
	movleu	%xcc,	%g1,	%o4
	lduw	[%l7 + 0x30],	%i3
	array8	%o3,	%o2,	%g3
	andncc	%g5,	%l0,	%g7
	movneg	%icc,	%i4,	%l3
	fmovsvs	%icc,	%f23,	%f5
	movge	%xcc,	%i6,	%l6
	movleu	%xcc,	%o0,	%g4
	fmovdpos	%xcc,	%f1,	%f23
	or	%o7,	0x1EDF,	%i1
	smul	%o6,	%l5,	%o5
	edge32n	%i5,	%l2,	%g2
	std	%f20,	[%l7 + 0x30]
	sth	%i2,	[%l7 + 0x40]
	edge32l	%i0,	%i7,	%o1
	edge8n	%g6,	%l4,	%g1
	udivx	%o4,	0x0ADF,	%l1
	fmovrslez	%o3,	%f25,	%f7
	movcc	%xcc,	%o2,	%g3
	orcc	%g5,	%i3,	%g7
	ldsw	[%l7 + 0x28],	%l0
	ldx	[%l7 + 0x38],	%i4
	sdiv	%l3,	0x18FF,	%i6
	array32	%o0,	%g4,	%l6
	srax	%o7,	0x06,	%i1
	movneg	%icc,	%o6,	%l5
	add	%i5,	%l2,	%o5
	addcc	%g2,	0x1FF4,	%i0
	edge32n	%i7,	%i2,	%o1
	andn	%l4,	0x095D,	%g6
	mulx	%g1,	0x1564,	%o4
	edge8n	%o3,	%l1,	%g3
	fpackfix	%f6,	%f1
	stw	%g5,	[%l7 + 0x10]
	sethi	0x0928,	%o2
	movgu	%xcc,	%i3,	%g7
	addc	%i4,	0x1205,	%l3
	array8	%i6,	%l0,	%o0
	fmovrsgez	%l6,	%f27,	%f2
	siam	0x6
	sth	%o7,	[%l7 + 0x16]
	fmovsge	%xcc,	%f13,	%f7
	xnorcc	%i1,	0x1CA8,	%o6
	fmovrdgz	%g4,	%f18,	%f2
	movrgz	%i5,	%l5,	%o5
	umulcc	%g2,	0x1B4F,	%l2
	sll	%i7,	%i2,	%o1
	andcc	%l4,	%g6,	%i0
	andn	%g1,	0x1BE0,	%o3
	st	%f31,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x68],	%l1
	fmovs	%f27,	%f21
	fzero	%f2
	fmovda	%icc,	%f21,	%f16
	xorcc	%g3,	0x16F5,	%o4
	andn	%o2,	0x0218,	%g5
	subccc	%i3,	%g7,	%l3
	fmovsg	%icc,	%f26,	%f4
	alignaddr	%i4,	%l0,	%i6
	smulcc	%l6,	%o0,	%i1
	edge8n	%o6,	%o7,	%g4
	ldub	[%l7 + 0x3A],	%l5
	xorcc	%o5,	%g2,	%i5
	ldd	[%l7 + 0x10],	%l2
	fcmped	%fcc3,	%f20,	%f30
	movpos	%xcc,	%i7,	%i2
	movcs	%xcc,	%o1,	%l4
	sra	%i0,	0x0F,	%g1
	ldsb	[%l7 + 0x33],	%g6
	movcs	%icc,	%o3,	%g3
	edge8	%o4,	%l1,	%g5
	fxor	%f22,	%f10,	%f30
	lduh	[%l7 + 0x6E],	%i3
	sir	0x1F0D
	lduw	[%l7 + 0x20],	%o2
	edge32n	%l3,	%g7,	%i4
	addccc	%i6,	0x025F,	%l0
	mulscc	%o0,	%i1,	%l6
	subccc	%o7,	0x0D65,	%g4
	fxnors	%f20,	%f19,	%f31
	edge32	%l5,	%o5,	%g2
	fabsd	%f4,	%f12
	movge	%xcc,	%o6,	%i5
	edge16	%l2,	%i2,	%o1
	nop
	set	0x6C, %i2
	ldsh	[%l7 + %i2],	%l4
	movrgez	%i0,	0x29D,	%i7
	movle	%icc,	%g6,	%g1
	srax	%o3,	%g3,	%l1
	srl	%g5,	0x04,	%i3
	fmovspos	%icc,	%f28,	%f21
	udiv	%o2,	0x064C,	%l3
	fmovs	%f26,	%f4
	stw	%o4,	[%l7 + 0x3C]
	umul	%g7,	%i6,	%l0
	save %o0, %i1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	0x09BB,	%g4
	movcc	%icc,	%l5,	%o5
	movrgz	%g2,	0x365,	%l6
	edge16l	%o6,	%l2,	%i2
	movrlez	%i5,	0x12B,	%l4
	or	%i0,	%o1,	%g6
	xorcc	%i7,	%o3,	%g1
	array32	%g3,	%g5,	%l1
	movneg	%xcc,	%i3,	%l3
	movcc	%icc,	%o2,	%g7
	and	%o4,	%l0,	%i6
	orn	%o0,	%i1,	%i4
	udivcc	%g4,	0x107E,	%l5
	edge8l	%o7,	%o5,	%g2
	fpadd16	%f2,	%f14,	%f14
	sethi	0x07DD,	%o6
	edge8n	%l6,	%i2,	%l2
	alignaddr	%i5,	%l4,	%i0
	sdivx	%o1,	0x0F85,	%i7
	edge32	%g6,	%o3,	%g3
	st	%f4,	[%l7 + 0x1C]
	fcmple16	%f28,	%f4,	%g5
	array16	%g1,	%i3,	%l1
	movrne	%o2,	0x26B,	%l3
	array8	%o4,	%g7,	%i6
	fmovdge	%xcc,	%f15,	%f18
	mulx	%l0,	0x0943,	%o0
	array32	%i1,	%i4,	%g4
	alignaddr	%l5,	%o5,	%o7
	smulcc	%g2,	%l6,	%i2
	fmovrdne	%l2,	%f24,	%f2
	udivx	%i5,	0x05CD,	%o6
	fmovsge	%icc,	%f24,	%f6
	edge32n	%l4,	%o1,	%i7
	srlx	%g6,	0x18,	%o3
	smul	%i0,	%g5,	%g3
	edge8n	%i3,	%l1,	%g1
	subc	%l3,	0x1A13,	%o4
	edge32ln	%o2,	%i6,	%l0
	fmuld8sux16	%f21,	%f15,	%f6
	array16	%g7,	%i1,	%o0
	umul	%i4,	%l5,	%g4
	fsrc1s	%f16,	%f20
	umul	%o7,	0x14C6,	%g2
	movrlz	%o5,	%l6,	%l2
	fmovdgu	%xcc,	%f18,	%f16
	mulscc	%i5,	%o6,	%l4
	ld	[%l7 + 0x4C],	%f12
	stb	%i2,	[%l7 + 0x4C]
	smul	%o1,	%i7,	%g6
	movne	%xcc,	%i0,	%o3
	fmovdpos	%icc,	%f23,	%f19
	for	%f12,	%f22,	%f14
	ldub	[%l7 + 0x5A],	%g5
	stx	%i3,	[%l7 + 0x78]
	fors	%f28,	%f25,	%f18
	lduh	[%l7 + 0x2A],	%l1
	edge8	%g3,	%l3,	%o4
	movgu	%xcc,	%g1,	%i6
	st	%f24,	[%l7 + 0x70]
	fornot1	%f10,	%f30,	%f2
	orncc	%l0,	%o2,	%i1
	movrgez	%g7,	%i4,	%l5
	fmovdpos	%xcc,	%f8,	%f1
	edge32n	%o0,	%g4,	%o7
	fmul8x16	%f30,	%f4,	%f26
	srlx	%g2,	0x06,	%l6
	stb	%l2,	[%l7 + 0x63]
	fcmpgt16	%f22,	%f26,	%i5
	ldsb	[%l7 + 0x1F],	%o5
	std	%f8,	[%l7 + 0x40]
	edge32ln	%o6,	%i2,	%l4
	udiv	%o1,	0x1B3A,	%g6
	ldsw	[%l7 + 0x40],	%i7
	movvc	%xcc,	%i0,	%g5
	fsrc2s	%f17,	%f4
	movrgez	%o3,	%i3,	%l1
	srlx	%g3,	%l3,	%g1
	movvs	%xcc,	%o4,	%i6
	subc	%l0,	0x0D49,	%o2
	or	%g7,	%i4,	%l5
	umul	%i1,	%o0,	%o7
	movne	%xcc,	%g4,	%l6
	srl	%l2,	%i5,	%g2
	ldx	[%l7 + 0x48],	%o6
	fcmple32	%f26,	%f4,	%o5
	ld	[%l7 + 0x3C],	%f16
	lduw	[%l7 + 0x78],	%i2
	fpack32	%f0,	%f24,	%f22
	fmovda	%xcc,	%f22,	%f16
	addccc	%o1,	0x09B4,	%l4
	movrlz	%i7,	%g6,	%g5
	edge16l	%o3,	%i3,	%i0
	edge8	%g3,	%l1,	%l3
	movn	%xcc,	%o4,	%i6
	movge	%xcc,	%l0,	%o2
	fmovdg	%icc,	%f14,	%f9
	fpsub16	%f18,	%f16,	%f18
	fmovrsne	%g7,	%f7,	%f22
	array8	%g1,	%l5,	%i1
	edge16l	%o0,	%i4,	%g4
	srl	%o7,	0x16,	%l2
	stw	%l6,	[%l7 + 0x3C]
	sethi	0x00D0,	%i5
	srl	%o6,	%o5,	%i2
	edge8n	%o1,	%g2,	%i7
	fmovs	%f28,	%f5
	pdist	%f8,	%f30,	%f24
	subcc	%l4,	0x13C6,	%g6
	alignaddr	%o3,	%g5,	%i0
	movpos	%xcc,	%i3,	%g3
	stb	%l1,	[%l7 + 0x53]
	edge8	%o4,	%l3,	%l0
	ldsw	[%l7 + 0x10],	%i6
	xnorcc	%o2,	%g1,	%l5
	fabss	%f13,	%f18
	fpmerge	%f1,	%f7,	%f0
	movrlz	%g7,	0x395,	%i1
	edge8	%i4,	%o0,	%g4
	smul	%o7,	%l2,	%l6
	fmovrdne	%o6,	%f28,	%f0
	sllx	%i5,	0x04,	%o5
	mova	%icc,	%i2,	%o1
	sth	%g2,	[%l7 + 0x32]
	movrne	%i7,	%l4,	%g6
	movvc	%icc,	%g5,	%i0
	nop
	set	0x08, %l0
	std	%f26,	[%l7 + %l0]
	xor	%i3,	%o3,	%g3
	movneg	%xcc,	%o4,	%l1
	fpsub32	%f26,	%f20,	%f16
	xorcc	%l3,	%l0,	%o2
	andcc	%g1,	0x1F33,	%i6
	alignaddr	%l5,	%i1,	%i4
	add	%o0,	0x0A80,	%g4
	xnor	%o7,	0x1346,	%l2
	srax	%l6,	0x02,	%o6
	ldub	[%l7 + 0x70],	%g7
	edge16n	%o5,	%i2,	%i5
	subc	%g2,	0x190B,	%i7
	nop
	set	0x77, %o1
	stb	%l4,	[%l7 + %o1]
	movpos	%icc,	%o1,	%g5
	movne	%xcc,	%g6,	%i3
	fmovd	%f20,	%f24
	udivcc	%o3,	0x07E6,	%g3
	fmovdpos	%xcc,	%f22,	%f2
	movrgz	%o4,	0x193,	%i0
	orncc	%l1,	0x1E15,	%l0
	movre	%l3,	%g1,	%i6
	fxor	%f22,	%f12,	%f20
	movvc	%icc,	%l5,	%i1
	movre	%o2,	%i4,	%g4
	ldsw	[%l7 + 0x24],	%o7
	array32	%o0,	%l6,	%o6
	subccc	%g7,	%l2,	%o5
	andn	%i5,	%i2,	%i7
	mova	%xcc,	%l4,	%g2
	smulcc	%g5,	0x0A1F,	%g6
	fzero	%f30
	mulx	%o1,	%i3,	%o3
	fpack16	%f30,	%f30
	movn	%xcc,	%g3,	%o4
	orncc	%l1,	%l0,	%i0
	addccc	%l3,	0x1C26,	%i6
	st	%f0,	[%l7 + 0x10]
	ldsw	[%l7 + 0x7C],	%l5
	fmovdvc	%xcc,	%f6,	%f29
	fandnot2s	%f29,	%f0,	%f17
	fnor	%f18,	%f2,	%f30
	xorcc	%i1,	0x0F75,	%o2
	edge16l	%i4,	%g4,	%o7
	sll	%o0,	%l6,	%g1
	st	%f25,	[%l7 + 0x70]
	edge32l	%g7,	%o6,	%l2
	ld	[%l7 + 0x78],	%f12
	movrlz	%i5,	0x3CF,	%o5
	faligndata	%f0,	%f2,	%f20
	fmovscs	%icc,	%f26,	%f3
	fmovse	%xcc,	%f24,	%f27
	pdist	%f24,	%f30,	%f28
	movle	%xcc,	%i7,	%i2
	sll	%g2,	%g5,	%l4
	nop
	set	0x58, %l2
	stx	%g6,	[%l7 + %l2]
	fmul8sux16	%f20,	%f22,	%f14
	lduw	[%l7 + 0x0C],	%i3
	fcmpne16	%f14,	%f26,	%o1
	alignaddr	%o3,	%g3,	%l1
	fmovdne	%xcc,	%f29,	%f26
	fmul8x16	%f2,	%f6,	%f2
	srax	%l0,	%o4,	%i0
	sdiv	%i6,	0x052A,	%l5
	sllx	%i1,	%o2,	%l3
	fornot2	%f22,	%f8,	%f26
	ldd	[%l7 + 0x70],	%i4
	stw	%g4,	[%l7 + 0x58]
	fmovscs	%icc,	%f28,	%f16
	nop
	set	0x68, %l3
	ldd	[%l7 + %l3],	%f12
	movvc	%icc,	%o7,	%o0
	popc	0x0EA6,	%l6
	fpsub16s	%f28,	%f26,	%f19
	movpos	%xcc,	%g7,	%g1
	edge8	%o6,	%l2,	%o5
	sub	%i5,	%i2,	%i7
	orcc	%g5,	0x0A45,	%g2
	fmovrdgez	%g6,	%f20,	%f28
	sllx	%l4,	%i3,	%o3
	ldx	[%l7 + 0x68],	%o1
	subcc	%g3,	0x162A,	%l0
	fpsub16	%f12,	%f4,	%f4
	fmovdneg	%icc,	%f14,	%f14
	sth	%l1,	[%l7 + 0x32]
	srl	%i0,	0x09,	%o4
	fpmerge	%f7,	%f28,	%f26
	movl	%xcc,	%i6,	%l5
	alignaddr	%i1,	%l3,	%o2
	fxnor	%f10,	%f28,	%f28
	array16	%g4,	%o7,	%i4
	fxors	%f30,	%f1,	%f15
	fxnor	%f8,	%f8,	%f16
	siam	0x6
	fmovrslz	%l6,	%f27,	%f28
	addc	%o0,	0x0A5B,	%g7
	edge16ln	%g1,	%l2,	%o6
	and	%o5,	0x151B,	%i2
	ldd	[%l7 + 0x30],	%i4
	save %g5, %g2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x11CB,	%i7
	udivcc	%l4,	0x0095,	%o3
	fnand	%f2,	%f22,	%f14
	fxor	%f2,	%f2,	%f12
	edge16ln	%i3,	%g3,	%l0
	fxnor	%f10,	%f14,	%f16
	movl	%xcc,	%o1,	%i0
	orcc	%l1,	%i6,	%l5
	fmovrdne	%o4,	%f20,	%f0
	fmovdle	%icc,	%f12,	%f23
	xor	%i1,	0x1D50,	%o2
	movle	%icc,	%l3,	%g4
	sll	%o7,	%l6,	%i4
	movge	%icc,	%g7,	%o0
	movleu	%icc,	%l2,	%o6
	xnorcc	%o5,	%g1,	%i5
	array16	%i2,	%g2,	%g5
	and	%g6,	0x16F3,	%l4
	fornot1	%f8,	%f28,	%f6
	movneg	%icc,	%o3,	%i3
	movgu	%xcc,	%g3,	%i7
	movne	%icc,	%o1,	%l0
	alignaddr	%i0,	%i6,	%l5
	add	%l1,	%o4,	%i1
	sllx	%l3,	%o2,	%g4
	movpos	%xcc,	%l6,	%o7
	edge16ln	%i4,	%o0,	%g7
	mulx	%o6,	%l2,	%g1
	fpsub16s	%f7,	%f27,	%f25
	edge16ln	%i5,	%o5,	%g2
	edge16l	%i2,	%g6,	%l4
	movre	%o3,	%i3,	%g5
	ld	[%l7 + 0x38],	%f31
	xnor	%i7,	%g3,	%l0
	popc	%o1,	%i0
	movrlz	%i6,	%l1,	%l5
	orncc	%o4,	0x189A,	%i1
	fornot2	%f18,	%f24,	%f2
	save %o2, %l3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g4,	0x0A9C,	%o7
	fcmpeq32	%f8,	%f22,	%o0
	addc	%g7,	%i4,	%o6
	edge16l	%l2,	%i5,	%g1
	addc	%g2,	%o5,	%g6
	sdiv	%i2,	0x07F4,	%o3
	smulcc	%l4,	0x0611,	%i3
	mulscc	%i7,	%g5,	%l0
	edge16n	%o1,	%g3,	%i0
	fmovrdgz	%l1,	%f30,	%f4
	movcc	%icc,	%l5,	%i6
	and	%i1,	0x1E89,	%o4
	mulx	%l3,	0x126F,	%o2
	fcmpd	%fcc1,	%f30,	%f30
	fmovsne	%xcc,	%f29,	%f15
	sll	%g4,	0x1D,	%l6
	fpadd32	%f16,	%f4,	%f24
	umul	%o7,	0x15FA,	%o0
	fmovda	%xcc,	%f22,	%f7
	fsrc2s	%f20,	%f28
	ldd	[%l7 + 0x20],	%f12
	fmovdneg	%xcc,	%f16,	%f1
	edge32	%g7,	%o6,	%i4
	movcc	%xcc,	%i5,	%g1
	xorcc	%l2,	0x07B8,	%o5
	fcmpes	%fcc3,	%f21,	%f22
	for	%f10,	%f8,	%f0
	stx	%g2,	[%l7 + 0x60]
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%g6
	ld	[%l7 + 0x08],	%f21
	movleu	%xcc,	%o3,	%l4
	sll	%i3,	%i2,	%g5
	movleu	%icc,	%l0,	%o1
	umul	%i7,	%i0,	%l1
	array8	%l5,	%i6,	%g3
	array16	%i1,	%l3,	%o4
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%o2
	edge32ln	%g4,	%l6,	%o0
	fmul8ulx16	%f0,	%f2,	%f28
	edge32	%g7,	%o7,	%o6
	xor	%i5,	%g1,	%l2
	st	%f8,	[%l7 + 0x50]
	srl	%o5,	%g2,	%g6
	smulcc	%i4,	%o3,	%l4
	edge8	%i2,	%g5,	%l0
	fpadd32s	%f21,	%f4,	%f3
	edge8l	%o1,	%i3,	%i7
	fpackfix	%f6,	%f16
	lduh	[%l7 + 0x7A],	%l1
	ldsb	[%l7 + 0x56],	%l5
	movcs	%xcc,	%i0,	%i6
	fpsub16	%f2,	%f2,	%f20
	and	%g3,	0x0D9B,	%i1
	xnorcc	%o4,	0x13CC,	%l3
	move	%xcc,	%g4,	%o2
	fsrc2	%f10,	%f30
	fpack32	%f6,	%f18,	%f8
	fsrc1s	%f17,	%f14
	alignaddrl	%o0,	%l6,	%o7
	movg	%icc,	%o6,	%g7
	ldsw	[%l7 + 0x38],	%i5
	sdivcc	%g1,	0x1CD1,	%l2
	lduw	[%l7 + 0x50],	%o5
	sra	%g2,	0x0E,	%i4
	popc	%g6,	%l4
	xorcc	%i2,	%g5,	%l0
	sdiv	%o3,	0x0C79,	%i3
	movg	%xcc,	%o1,	%l1
	edge16n	%l5,	%i0,	%i7
	sethi	0x098E,	%g3
	edge16n	%i1,	%i6,	%o4
	subc	%g4,	%o2,	%o0
	fnors	%f12,	%f15,	%f18
	edge16n	%l6,	%l3,	%o7
	nop
	set	0x6F, %l1
	ldsb	[%l7 + %l1],	%g7
	edge16l	%o6,	%i5,	%l2
	edge8ln	%g1,	%o5,	%g2
	umul	%i4,	0x116D,	%g6
	ldsh	[%l7 + 0x3A],	%i2
	movre	%g5,	%l4,	%o3
	movn	%icc,	%l0,	%i3
	movvs	%xcc,	%l1,	%o1
	xnor	%l5,	0x1818,	%i7
	fmovsn	%xcc,	%f19,	%f17
	fnor	%f18,	%f30,	%f12
	edge32l	%g3,	%i1,	%i0
	fzero	%f20
	andn	%i6,	%g4,	%o2
	fmul8x16	%f26,	%f30,	%f24
	fmovsg	%xcc,	%f4,	%f18
	std	%f28,	[%l7 + 0x60]
	sra	%o0,	0x11,	%l6
	fcmple16	%f16,	%f20,	%o4
	xorcc	%l3,	%g7,	%o6
	movge	%xcc,	%o7,	%i5
	movrgez	%l2,	%o5,	%g1
	srlx	%g2,	0x06,	%g6
	lduh	[%l7 + 0x4C],	%i2
	fmovsg	%icc,	%f3,	%f19
	popc	0x1343,	%i4
	xor	%l4,	%g5,	%l0
	stx	%o3,	[%l7 + 0x30]
	movne	%xcc,	%l1,	%i3
	fzero	%f20
	fones	%f1
	ldub	[%l7 + 0x76],	%o1
	edge32n	%i7,	%g3,	%l5
	srlx	%i0,	%i6,	%g4
	save %o2, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f8,	%f15,	%f30
	sra	%o4,	0x13,	%l6
	edge32n	%l3,	%g7,	%o7
	ldsw	[%l7 + 0x54],	%o6
	andcc	%l2,	%i5,	%g1
	sub	%o5,	%g6,	%g2
	ldsb	[%l7 + 0x51],	%i4
	andn	%l4,	%i2,	%l0
	fxors	%f0,	%f23,	%f21
	ldsh	[%l7 + 0x44],	%g5
	fmovdvc	%icc,	%f30,	%f10
	fxors	%f5,	%f25,	%f8
	edge8n	%l1,	%i3,	%o3
	movpos	%icc,	%i7,	%g3
	movrne	%l5,	0x040,	%i0
	andncc	%o1,	%g4,	%o2
	std	%f6,	[%l7 + 0x10]
	stx	%i6,	[%l7 + 0x30]
	ldx	[%l7 + 0x78],	%i1
	fnegs	%f25,	%f14
	fmovsn	%icc,	%f28,	%f3
	smul	%o0,	0x0339,	%l6
	edge16l	%o4,	%g7,	%l3
	subcc	%o7,	0x1F6A,	%l2
	movg	%icc,	%o6,	%i5
	andcc	%g1,	0x125B,	%o5
	ldx	[%l7 + 0x70],	%g6
	fzeros	%f17
	sdivcc	%g2,	0x0F02,	%i4
	subc	%i2,	%l4,	%g5
	movrlz	%l1,	%l0,	%o3
	std	%f0,	[%l7 + 0x68]
	alignaddr	%i3,	%i7,	%l5
	edge8l	%g3,	%i0,	%o1
	orcc	%g4,	%i6,	%o2
	lduh	[%l7 + 0x5E],	%o0
	popc	0x02D0,	%l6
	or	%i1,	0x04BD,	%o4
	fmovrsgz	%g7,	%f16,	%f28
	sdiv	%o7,	0x1F67,	%l3
	smulcc	%o6,	%i5,	%g1
	movle	%xcc,	%o5,	%g6
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	lduh	[%l7 + 0x0C],	%l4
	fpadd32s	%f11,	%f6,	%f12
	umulcc	%g5,	0x04D8,	%l2
	fcmpgt32	%f8,	%f18,	%l0
	fmul8sux16	%f10,	%f24,	%f18
	andncc	%l1,	%o3,	%i3
	edge8l	%l5,	%g3,	%i7
	std	%f14,	[%l7 + 0x48]
	ld	[%l7 + 0x68],	%f3
	stw	%o1,	[%l7 + 0x34]
	fornot1	%f22,	%f6,	%f4
	alignaddrl	%g4,	%i0,	%i6
	edge8l	%o2,	%o0,	%l6
	edge32n	%i1,	%g7,	%o4
	movre	%o7,	0x040,	%l3
	srlx	%i5,	%o6,	%g1
	or	%g6,	%o5,	%g2
	popc	%i2,	%i4
	edge32l	%l4,	%g5,	%l2
	udiv	%l1,	0x126F,	%l0
	ldd	[%l7 + 0x70],	%f2
	and	%i3,	%o3,	%g3
	movle	%icc,	%l5,	%o1
	orcc	%i7,	0x08B6,	%g4
	lduh	[%l7 + 0x08],	%i0
	movre	%o2,	0x248,	%i6
	and	%o0,	%i1,	%l6
	xorcc	%o4,	%o7,	%g7
	udivcc	%i5,	0x16CE,	%o6
	array16	%g1,	%g6,	%l3
	movvc	%xcc,	%g2,	%i2
	movcc	%xcc,	%i4,	%o5
	ld	[%l7 + 0x5C],	%f4
	fnor	%f0,	%f10,	%f2
	andncc	%l4,	%g5,	%l1
	fmovrdlez	%l0,	%f28,	%f12
	smul	%l2,	0x1868,	%o3
	addccc	%g3,	%i3,	%l5
	movvs	%xcc,	%i7,	%g4
	sdivcc	%i0,	0x0579,	%o1
	subcc	%o2,	0x06C0,	%i6
	stx	%i1,	[%l7 + 0x10]
	udivcc	%l6,	0x1D5E,	%o4
	srax	%o0,	%g7,	%o7
	stx	%i5,	[%l7 + 0x08]
	fmul8x16al	%f25,	%f25,	%f10
	edge32n	%g1,	%g6,	%l3
	sth	%o6,	[%l7 + 0x28]
	array32	%g2,	%i2,	%o5
	stw	%l4,	[%l7 + 0x68]
	subccc	%g5,	0x16F2,	%l1
	edge32n	%i4,	%l2,	%l0
	popc	%g3,	%i3
	ldd	[%l7 + 0x70],	%o2
	movcs	%icc,	%i7,	%l5
	edge8	%i0,	%o1,	%g4
	movpos	%xcc,	%o2,	%i1
	xor	%i6,	%o4,	%o0
	fxnor	%f4,	%f6,	%f4
	stw	%g7,	[%l7 + 0x1C]
	movl	%xcc,	%o7,	%l6
	edge8l	%g1,	%g6,	%i5
	fmuld8sux16	%f16,	%f22,	%f22
	sub	%l3,	%g2,	%o6
	movneg	%xcc,	%i2,	%l4
	movgu	%xcc,	%o5,	%g5
	ldd	[%l7 + 0x60],	%l0
	movneg	%xcc,	%l2,	%i4
	save %g3, 0x1504, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%f10
	fpsub32s	%f31,	%f22,	%f12
	alignaddrl	%l0,	%o3,	%l5
	movrgez	%i0,	0x177,	%o1
	fmovrdne	%i7,	%f12,	%f24
	fpadd32s	%f21,	%f20,	%f31
	edge16n	%g4,	%o2,	%i6
	alignaddr	%i1,	%o4,	%g7
	sra	%o7,	0x14,	%l6
	fmovrsgez	%g1,	%f8,	%f6
	movvs	%icc,	%g6,	%o0
	movrgez	%i5,	%l3,	%g2
	movl	%xcc,	%o6,	%i2
	subcc	%l4,	0x0D6A,	%o5
	st	%f24,	[%l7 + 0x7C]
	movl	%xcc,	%l1,	%l2
	edge16n	%i4,	%g5,	%g3
	std	%f2,	[%l7 + 0x20]
	addccc	%l0,	0x0B0D,	%o3
	movrgez	%l5,	%i0,	%o1
	edge32l	%i7,	%i3,	%o2
	xnor	%g4,	0x0D1C,	%i6
	mova	%icc,	%i1,	%g7
	and	%o4,	%o7,	%g1
	addcc	%g6,	0x143A,	%l6
	array8	%o0,	%l3,	%g2
	movle	%xcc,	%i5,	%o6
	ldub	[%l7 + 0x4F],	%i2
	lduh	[%l7 + 0x3A],	%o5
	xor	%l1,	%l4,	%i4
	std	%f16,	[%l7 + 0x48]
	edge16ln	%l2,	%g5,	%g3
	xnor	%l0,	%l5,	%o3
	movrlz	%i0,	0x24D,	%o1
	ldd	[%l7 + 0x18],	%i2
	fpmerge	%f17,	%f3,	%f4
	xor	%o2,	0x046B,	%g4
	movpos	%icc,	%i6,	%i7
	fsrc1s	%f8,	%f15
	fmovdneg	%xcc,	%f28,	%f28
	addc	%i1,	%g7,	%o4
	umul	%o7,	0x167E,	%g1
	fcmpne32	%f18,	%f4,	%g6
	ldx	[%l7 + 0x68],	%l6
	orn	%o0,	0x12AB,	%g2
	andcc	%i5,	%o6,	%i2
	sra	%o5,	%l1,	%l4
	ldsw	[%l7 + 0x48],	%l3
	fpadd32s	%f15,	%f31,	%f1
	edge8l	%l2,	%i4,	%g5
	edge32n	%g3,	%l5,	%l0
	addcc	%o3,	%o1,	%i3
	stb	%o2,	[%l7 + 0x3C]
	srlx	%g4,	0x1D,	%i6
	edge32	%i0,	%i1,	%i7
	fandnot1	%f24,	%f26,	%f22
	edge32l	%g7,	%o7,	%o4
	orncc	%g6,	%g1,	%l6
	xnor	%g2,	%i5,	%o0
	ldsb	[%l7 + 0x40],	%o6
	fzero	%f14
	fornot1s	%f11,	%f13,	%f10
	ldx	[%l7 + 0x48],	%i2
	ldsb	[%l7 + 0x74],	%l1
	alignaddr	%o5,	%l3,	%l2
	mulscc	%l4,	%i4,	%g3
	movg	%icc,	%l5,	%g5
	sdivx	%o3,	0x1BED,	%l0
	edge8l	%o1,	%i3,	%o2
	edge16n	%i6,	%g4,	%i1
	udiv	%i7,	0x1C4F,	%i0
	fmovscs	%xcc,	%f1,	%f29
	movgu	%icc,	%o7,	%g7
	subc	%g6,	0x11B6,	%o4
	movn	%xcc,	%l6,	%g2
	subccc	%g1,	%o0,	%i5
	stw	%i2,	[%l7 + 0x28]
	fmovrslz	%l1,	%f20,	%f4
	edge32l	%o6,	%l3,	%o5
	edge16	%l2,	%l4,	%g3
	fcmpgt16	%f18,	%f22,	%l5
	movgu	%icc,	%g5,	%i4
	lduh	[%l7 + 0x6C],	%l0
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%o0
	ldsh	[%l7 + 0x0C],	%i3
	srax	%o3,	%o2,	%i6
	fmovsn	%xcc,	%f15,	%f28
	udivcc	%i1,	0x1158,	%i7
	lduh	[%l7 + 0x0E],	%g4
	alignaddr	%o7,	%i0,	%g7
	fmovrdne	%o4,	%f0,	%f12
	fxors	%f29,	%f18,	%f19
	edge16n	%g6,	%l6,	%g1
	save %g2, %o0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l1,	%i2,	%l3
	sllx	%o5,	0x07,	%o6
	ldd	[%l7 + 0x60],	%f22
	srl	%l4,	%l2,	%g3
	mulx	%l5,	0x0AB6,	%g5
	movrne	%l0,	%i4,	%i3
	xnor	%o3,	0x1E13,	%o1
	movcc	%xcc,	%o2,	%i1
	orncc	%i7,	0x024C,	%g4
	stb	%o7,	[%l7 + 0x29]
	add	%i6,	%g7,	%i0
	edge8	%g6,	%o4,	%l6
	mulscc	%g2,	0x02BC,	%o0
	ldub	[%l7 + 0x4F],	%i5
	edge32ln	%l1,	%g1,	%l3
	restore %i2, 0x1D2C, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f28,	%f8
	movgu	%icc,	%l4,	%o6
	andn	%g3,	%l2,	%g5
	xnorcc	%l5,	%i4,	%i3
	sth	%o3,	[%l7 + 0x68]
	orcc	%o1,	0x130A,	%o2
	std	%f2,	[%l7 + 0x78]
	ldd	[%l7 + 0x60],	%f14
	edge16ln	%l0,	%i7,	%g4
	fmovsvs	%xcc,	%f4,	%f6
	ldub	[%l7 + 0x70],	%i1
	ldsh	[%l7 + 0x56],	%i6
	movl	%xcc,	%g7,	%i0
	xorcc	%g6,	0x13AC,	%o7
	mova	%xcc,	%l6,	%o4
	ld	[%l7 + 0x0C],	%f28
	fmul8x16al	%f12,	%f16,	%f0
	movrgez	%g2,	0x0A8,	%i5
	movpos	%icc,	%l1,	%g1
	orn	%l3,	0x1C4C,	%o0
	srlx	%i2,	%o5,	%o6
	stx	%l4,	[%l7 + 0x40]
	add	%l2,	%g5,	%l5
	fabss	%f25,	%f16
	addc	%i4,	%g3,	%o3
	xorcc	%i3,	%o1,	%o2
	ldsb	[%l7 + 0x2C],	%l0
	addc	%i7,	0x09D9,	%g4
	movvs	%icc,	%i6,	%i1
	subc	%i0,	0x0163,	%g6
	subcc	%g7,	0x1DEA,	%l6
	udivcc	%o4,	0x03E2,	%o7
	udivx	%g2,	0x08AE,	%i5
	fmovde	%icc,	%f12,	%f12
	edge8l	%l1,	%l3,	%o0
	orncc	%g1,	0x1604,	%i2
	edge32n	%o5,	%l4,	%l2
	ld	[%l7 + 0x5C],	%f3
	fnegd	%f0,	%f30
	stw	%g5,	[%l7 + 0x64]
	fmovsle	%icc,	%f22,	%f10
	movpos	%icc,	%o6,	%i4
	popc	0x0DCC,	%g3
	movne	%icc,	%l5,	%i3
	fmovsneg	%icc,	%f2,	%f14
	fmovse	%xcc,	%f3,	%f3
	alignaddr	%o1,	%o2,	%l0
	udivx	%i7,	0x1DDD,	%o3
	movneg	%icc,	%i6,	%g4
	udivcc	%i1,	0x0EDD,	%g6
	fmovsleu	%xcc,	%f23,	%f24
	stb	%g7,	[%l7 + 0x21]
	sll	%i0,	%l6,	%o4
	subcc	%o7,	0x05AF,	%i5
	edge32l	%l1,	%g2,	%l3
	fmovdpos	%icc,	%f6,	%f22
	movleu	%xcc,	%o0,	%i2
	movg	%xcc,	%g1,	%l4
	ldsb	[%l7 + 0x5E],	%o5
	popc	%l2,	%g5
	sir	0x181E
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	srax	%i3,	0x1D,	%g3
	andcc	%o1,	0x1F28,	%o2
	sll	%i7,	%l0,	%i6
	movrgz	%g4,	%o3,	%i1
	edge8l	%g6,	%i0,	%g7
	mulscc	%l6,	%o4,	%o7
	array16	%l1,	%g2,	%i5
	umul	%l3,	%o0,	%i2
	ldd	[%l7 + 0x68],	%g0
	ld	[%l7 + 0x4C],	%f31
	fxor	%f30,	%f30,	%f0
	stx	%o5,	[%l7 + 0x78]
	ldd	[%l7 + 0x70],	%f0
	movrne	%l4,	%l2,	%g5
	smul	%o6,	%l5,	%i4
	edge32n	%i3,	%o1,	%o2
	sethi	0x1C7E,	%i7
	movleu	%xcc,	%l0,	%i6
	fcmpgt16	%f2,	%f12,	%g3
	array32	%o3,	%g4,	%g6
	ldub	[%l7 + 0x7D],	%i0
	movgu	%icc,	%i1,	%l6
	orncc	%o4,	%g7,	%l1
	stb	%o7,	[%l7 + 0x5C]
	edge32n	%g2,	%i5,	%o0
	or	%l3,	0x0B74,	%g1
	edge16ln	%i2,	%o5,	%l4
	srlx	%g5,	%o6,	%l5
	array32	%i4,	%i3,	%l2
	udivx	%o2,	0x1C09,	%o1
	addc	%i7,	0x076D,	%i6
	umul	%g3,	%o3,	%g4
	ldub	[%l7 + 0x51],	%l0
	orn	%i0,	%i1,	%l6
	movge	%xcc,	%o4,	%g7
	movvs	%xcc,	%g6,	%o7
	movleu	%icc,	%l1,	%i5
	fors	%f14,	%f2,	%f29
	sdivcc	%o0,	0x103D,	%g2
	ldx	[%l7 + 0x58],	%l3
	movvs	%icc,	%g1,	%o5
	mulx	%i2,	%g5,	%o6
	movl	%xcc,	%l4,	%i4
	srlx	%l5,	0x0D,	%i3
	sll	%o2,	0x1D,	%l2
	movcs	%xcc,	%o1,	%i6
	xor	%g3,	0x064B,	%o3
	sdivx	%i7,	0x02FE,	%g4
	sdivx	%i0,	0x06E4,	%l0
	movcc	%icc,	%l6,	%o4
	fnors	%f29,	%f9,	%f16
	bshuffle	%f24,	%f26,	%f22
	udivcc	%g7,	0x1F25,	%i1
	stb	%g6,	[%l7 + 0x72]
	fcmpne16	%f2,	%f0,	%o7
	fornot2s	%f25,	%f19,	%f29
	mulx	%l1,	0x11E6,	%i5
	movneg	%icc,	%o0,	%l3
	fmovrse	%g2,	%f0,	%f1
	subccc	%g1,	%i2,	%o5
	edge32l	%g5,	%l4,	%i4
	xor	%o6,	0x04F2,	%i3
	movne	%xcc,	%l5,	%o2
	sub	%o1,	%i6,	%l2
	fpsub32	%f24,	%f0,	%f26
	fcmpne32	%f16,	%f8,	%g3
	fmovdgu	%xcc,	%f8,	%f8
	alignaddr	%o3,	%g4,	%i0
	movneg	%xcc,	%l0,	%l6
	addcc	%o4,	0x0133,	%i7
	fsrc1s	%f3,	%f28
	alignaddrl	%i1,	%g6,	%g7
	fornot2	%f24,	%f0,	%f26
	ldsh	[%l7 + 0x0C],	%o7
	subcc	%l1,	%i5,	%l3
	alignaddrl	%g2,	%g1,	%i2
	mulx	%o5,	%g5,	%l4
	srl	%o0,	0x17,	%o6
	lduh	[%l7 + 0x7A],	%i3
	stb	%i4,	[%l7 + 0x0B]
	fmovdgu	%xcc,	%f13,	%f30
	srlx	%l5,	0x1F,	%o2
	movn	%xcc,	%i6,	%l2
	xorcc	%g3,	0x041C,	%o3
	andncc	%o1,	%g4,	%l0
	ldsb	[%l7 + 0x45],	%l6
	fnot2	%f2,	%f0
	ldd	[%l7 + 0x60],	%f26
	edge16	%o4,	%i0,	%i1
	add	%i7,	%g6,	%o7
	fpack32	%f18,	%f22,	%f18
	edge16n	%l1,	%i5,	%l3
	sll	%g7,	%g2,	%g1
	fmovsn	%icc,	%f28,	%f12
	edge32ln	%o5,	%g5,	%i2
	movrgez	%o0,	%o6,	%i3
	addc	%l4,	%i4,	%l5
	edge32n	%o2,	%l2,	%g3
	fmovdvs	%xcc,	%f31,	%f11
	ldd	[%l7 + 0x38],	%f30
	movrgz	%o3,	%i6,	%o1
	ldd	[%l7 + 0x48],	%l0
	edge16	%g4,	%o4,	%i0
	fmovsge	%icc,	%f31,	%f0
	sir	0x170F
	fornot2s	%f0,	%f26,	%f30
	fornot2	%f26,	%f8,	%f2
	sdivcc	%i1,	0x1A55,	%i7
	edge8n	%g6,	%o7,	%l6
	mulscc	%i5,	%l3,	%g7
	srlx	%g2,	0x17,	%l1
	edge32ln	%o5,	%g1,	%g5
	edge32	%o0,	%i2,	%i3
	fmovdle	%xcc,	%f7,	%f12
	edge32n	%o6,	%i4,	%l5
	udiv	%o2,	0x063F,	%l2
	stw	%g3,	[%l7 + 0x78]
	fmovdl	%xcc,	%f13,	%f18
	fmovdvc	%xcc,	%f30,	%f9
	addc	%l4,	%o3,	%i6
	movpos	%icc,	%o1,	%g4
	sth	%l0,	[%l7 + 0x2E]
	subccc	%i0,	%o4,	%i1
	alignaddr	%g6,	%o7,	%i7
	restore %i5, 0x1CAC, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f6,	%f22
	edge16l	%l6,	%g2,	%g7
	movvs	%xcc,	%o5,	%l1
	ld	[%l7 + 0x40],	%f20
	umulcc	%g5,	%g1,	%i2
	fnands	%f8,	%f4,	%f23
	movg	%xcc,	%i3,	%o0
	ld	[%l7 + 0x68],	%f25
	ldub	[%l7 + 0x5D],	%i4
	movneg	%icc,	%l5,	%o2
	movrgez	%l2,	0x367,	%o6
	movrgez	%l4,	%o3,	%g3
	nop
	set	0x44, %i4
	ldsh	[%l7 + %i4],	%o1
	fornot2s	%f21,	%f6,	%f6
	orcc	%i6,	0x0E85,	%g4
	movrne	%i0,	0x1DC,	%o4
	fors	%f8,	%f14,	%f29
	fmovdleu	%icc,	%f30,	%f29
	and	%l0,	0x1B2F,	%g6
	edge32l	%o7,	%i7,	%i5
	fpack16	%f8,	%f20
	edge8l	%l3,	%l6,	%g2
	fnegd	%f14,	%f2
	movre	%i1,	0x3B5,	%o5
	stw	%g7,	[%l7 + 0x18]
	and	%l1,	%g1,	%g5
	ldsw	[%l7 + 0x58],	%i3
	sdivx	%i2,	0x1384,	%i4
	xnorcc	%o0,	0x0969,	%o2
	movle	%xcc,	%l2,	%o6
	fmovdg	%xcc,	%f6,	%f2
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	move	%xcc,	%g3,	%i6
	movrne	%g4,	0x195,	%i0
	alignaddrl	%o4,	%l0,	%o1
	fsrc2s	%f17,	%f31
	movcc	%icc,	%o7,	%g6
	movleu	%icc,	%i7,	%i5
	sdiv	%l6,	0x124E,	%l3
	udivcc	%g2,	0x1AB7,	%o5
	subccc	%g7,	0x11AF,	%l1
	addccc	%i1,	0x1468,	%g5
	subccc	%i3,	%i2,	%g1
	movrlez	%i4,	0x307,	%o2
	mova	%xcc,	%o0,	%o6
	movre	%l4,	0x226,	%o3
	add	%l5,	%g3,	%i6
	movg	%xcc,	%g4,	%l2
	movle	%icc,	%i0,	%o4
	array16	%o1,	%l0,	%o7
	mulx	%g6,	0x1077,	%i7
	alignaddrl	%l6,	%l3,	%g2
	ldsb	[%l7 + 0x7B],	%i5
	ldsh	[%l7 + 0x5A],	%o5
	umulcc	%g7,	%i1,	%g5
	movrgz	%l1,	0x0CD,	%i2
	ldub	[%l7 + 0x6A],	%g1
	move	%icc,	%i4,	%o2
	ldsw	[%l7 + 0x48],	%i3
	fcmple16	%f4,	%f30,	%o6
	sub	%o0,	%o3,	%l4
	ldd	[%l7 + 0x68],	%g2
	umulcc	%i6,	%l5,	%g4
	edge16l	%l2,	%i0,	%o1
	movne	%icc,	%l0,	%o4
	andncc	%g6,	%i7,	%o7
	fmovda	%xcc,	%f13,	%f29
	or	%l6,	%g2,	%l3
	udiv	%o5,	0x19F6,	%i5
	save %i1, %g7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%icc,	%f7,	%f21
	sethi	0x12D2,	%i2
	movneg	%xcc,	%l1,	%g1
	edge8ln	%o2,	%i4,	%i3
	for	%f0,	%f24,	%f26
	fmovrslez	%o6,	%f22,	%f27
	fmovsge	%icc,	%f17,	%f21
	fmovdn	%xcc,	%f1,	%f12
	sra	%o3,	%l4,	%o0
	andcc	%i6,	0x10FF,	%g3
	movrgz	%l5,	%l2,	%g4
	fmovrdgez	%o1,	%f16,	%f4
	fpack32	%f26,	%f4,	%f18
	andn	%l0,	0x074C,	%i0
	udiv	%g6,	0x0CDC,	%i7
	addcc	%o4,	0x1EF7,	%l6
	movpos	%icc,	%g2,	%l3
	fmovsleu	%xcc,	%f27,	%f7
	smulcc	%o7,	%o5,	%i5
	subcc	%i1,	0x19FD,	%g7
	edge32l	%i2,	%g5,	%g1
	std	%f26,	[%l7 + 0x40]
	edge32ln	%o2,	%i4,	%i3
	alignaddr	%l1,	%o3,	%l4
	edge32	%o6,	%o0,	%g3
	edge16n	%l5,	%l2,	%i6
	ldd	[%l7 + 0x20],	%f6
	fmovsle	%icc,	%f30,	%f7
	movgu	%icc,	%o1,	%l0
	srl	%i0,	0x14,	%g6
	edge16n	%i7,	%o4,	%g4
	mulx	%l6,	%l3,	%o7
	fpsub16s	%f12,	%f18,	%f18
	srax	%g2,	%i5,	%i1
	stx	%g7,	[%l7 + 0x08]
	udivx	%o5,	0x1D6C,	%i2
	array8	%g5,	%g1,	%o2
	fcmpne32	%f30,	%f6,	%i4
	udiv	%i3,	0x0D47,	%o3
	edge16ln	%l4,	%o6,	%o0
	ldd	[%l7 + 0x70],	%f0
	addcc	%g3,	0x14DB,	%l5
	array8	%l2,	%l1,	%i6
	movge	%icc,	%o1,	%l0
	subccc	%i0,	%i7,	%o4
	fmuld8ulx16	%f14,	%f16,	%f26
	st	%f2,	[%l7 + 0x68]
	or	%g6,	%l6,	%g4
	umul	%o7,	0x18E1,	%g2
	fmovdgu	%icc,	%f14,	%f19
	sll	%i5,	%l3,	%g7
	fpadd16	%f24,	%f12,	%f4
	edge32ln	%o5,	%i2,	%i1
	fmul8x16	%f13,	%f30,	%f18
	movle	%icc,	%g5,	%o2
	movrlez	%i4,	0x2D6,	%i3
	xnor	%g1,	%l4,	%o3
	sdiv	%o0,	0x050F,	%o6
	save %l5, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i6,	0x0BEB,	%o1
	fmovrdne	%l0,	%f22,	%f8
	fpmerge	%f18,	%f2,	%f10
	popc	0x066A,	%i0
	mulx	%i7,	%g3,	%g6
	ldd	[%l7 + 0x20],	%f6
	fmovrslz	%l6,	%f28,	%f8
	fmovs	%f14,	%f26
	fmovdvc	%icc,	%f9,	%f16
	fmul8ulx16	%f20,	%f0,	%f18
	movn	%icc,	%o4,	%o7
	ldsh	[%l7 + 0x60],	%g4
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%g2
	smulcc	%i5,	0x0A73,	%g7
	smulcc	%o5,	%i2,	%i1
	movle	%xcc,	%l3,	%o2
	movne	%icc,	%i4,	%i3
	movrlz	%g1,	0x0AD,	%l4
	and	%o3,	%o0,	%o6
	umul	%l5,	%g5,	%l2
	fcmpeq32	%f22,	%f10,	%l1
	fmovspos	%icc,	%f5,	%f5
	fmovdvs	%xcc,	%f18,	%f17
	udivx	%i6,	0x0166,	%o1
	fmovd	%f22,	%f0
	ldsb	[%l7 + 0x0A],	%i0
	edge16	%i7,	%l0,	%g6
	udivx	%g3,	0x0CDD,	%l6
	ldsw	[%l7 + 0x30],	%o4
	fpsub16s	%f12,	%f25,	%f15
	fsrc2	%f10,	%f4
	subcc	%o7,	%g2,	%g4
	fcmple32	%f24,	%f2,	%i5
	stw	%o5,	[%l7 + 0x54]
	subc	%g7,	%i1,	%l3
	movne	%xcc,	%i2,	%o2
	edge32ln	%i3,	%g1,	%l4
	stb	%i4,	[%l7 + 0x4B]
	edge32l	%o0,	%o3,	%o6
	movg	%icc,	%l5,	%g5
	fnot1s	%f1,	%f23
	movrlz	%l1,	0x254,	%l2
	fmovdg	%xcc,	%f4,	%f7
	ldub	[%l7 + 0x25],	%o1
	andcc	%i0,	%i6,	%l0
	movvs	%xcc,	%i7,	%g6
	srl	%l6,	%o4,	%o7
	lduw	[%l7 + 0x70],	%g3
	fmovsvc	%icc,	%f17,	%f7
	xorcc	%g4,	%i5,	%g2
	fxnor	%f24,	%f6,	%f6
	umul	%g7,	%i1,	%l3
	fmul8x16al	%f1,	%f9,	%f18
	addc	%i2,	%o2,	%i3
	fcmpes	%fcc1,	%f0,	%f4
	srlx	%o5,	0x1F,	%g1
	fzero	%f2
	fandnot2s	%f15,	%f21,	%f12
	edge32	%l4,	%o0,	%i4
	siam	0x1
	andncc	%o3,	%l5,	%g5
	movrgz	%l1,	0x014,	%o6
	fpack32	%f0,	%f20,	%f22
	fnegs	%f4,	%f30
	srl	%o1,	%l2,	%i6
	movl	%xcc,	%i0,	%i7
	movrlez	%g6,	%l6,	%l0
	smul	%o4,	0x0386,	%o7
	sir	0x0D29
	fpsub32s	%f15,	%f0,	%f3
	pdist	%f12,	%f24,	%f24
	fmovrsgz	%g3,	%f1,	%f27
	fandnot2s	%f5,	%f23,	%f8
	fsrc1s	%f4,	%f20
	addccc	%g4,	%g2,	%g7
	add	%i5,	%i1,	%l3
	lduh	[%l7 + 0x0C],	%o2
	edge8l	%i3,	%o5,	%i2
	subc	%g1,	0x19A9,	%l4
	fmovrdgz	%i4,	%f8,	%f6
	movn	%icc,	%o3,	%l5
	fzeros	%f19
	ldsh	[%l7 + 0x68],	%g5
	fmovdg	%icc,	%f16,	%f14
	alignaddr	%o0,	%l1,	%o6
	fmovsvc	%xcc,	%f30,	%f14
	udivx	%o1,	0x1450,	%l2
	fmovs	%f12,	%f1
	orncc	%i0,	0x0616,	%i6
	mova	%icc,	%i7,	%g6
	movvc	%xcc,	%l0,	%o4
	edge8	%l6,	%o7,	%g4
	orncc	%g2,	%g7,	%i5
	fmovsgu	%icc,	%f2,	%f21
	sdivcc	%g3,	0x0B5F,	%l3
	subcc	%i1,	%i3,	%o2
	fmovsg	%icc,	%f13,	%f28
	st	%f30,	[%l7 + 0x1C]
	subccc	%o5,	0x0E20,	%g1
	array16	%l4,	%i4,	%o3
	movrgez	%i2,	0x1C7,	%l5
	fsrc1	%f14,	%f26
	fpsub32s	%f26,	%f25,	%f20
	umul	%o0,	0x00DE,	%l1
	xor	%g5,	%o6,	%o1
	ld	[%l7 + 0x34],	%f14
	fabsd	%f20,	%f22
	fcmpes	%fcc3,	%f20,	%f28
	add	%l2,	%i0,	%i7
	subc	%g6,	0x0980,	%i6
	fmovrslz	%l0,	%f17,	%f22
	mulx	%o4,	0x0ED2,	%l6
	xorcc	%o7,	%g4,	%g7
	restore %i5, 0x18D0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l3,	0x0E90,	%i1
	udivx	%i3,	0x084E,	%g3
	mova	%icc,	%o2,	%g1
	fpadd32s	%f20,	%f26,	%f19
	ldsh	[%l7 + 0x54],	%o5
	movle	%icc,	%l4,	%i4
	fcmple16	%f24,	%f20,	%i2
	movle	%icc,	%l5,	%o3
	nop
	set	0x24, %o4
	ldsw	[%l7 + %o4],	%o0
	ldsh	[%l7 + 0x2E],	%l1
	edge32l	%g5,	%o1,	%o6
	stb	%i0,	[%l7 + 0x7F]
	fmovs	%f7,	%f26
	sdiv	%l2,	0x19B3,	%g6
	sllx	%i7,	%l0,	%i6
	ldx	[%l7 + 0x08],	%o4
	addcc	%o7,	0x0B59,	%l6
	fmovsl	%icc,	%f26,	%f9
	edge8	%g4,	%i5,	%g2
	fnot2	%f30,	%f26
	movle	%xcc,	%g7,	%i1
	fnors	%f27,	%f15,	%f20
	subccc	%l3,	0x0937,	%i3
	nop
	set	0x68, %i3
	std	%f28,	[%l7 + %i3]
	smulcc	%o2,	0x00C6,	%g1
	movne	%icc,	%g3,	%o5
	bshuffle	%f2,	%f4,	%f4
	fabsd	%f30,	%f14
	udivx	%l4,	0x0D17,	%i2
	fmovsle	%xcc,	%f9,	%f28
	ldd	[%l7 + 0x50],	%i4
	fpsub32	%f26,	%f10,	%f30
	sdivx	%o3,	0x1085,	%l5
	movrne	%o0,	0x1DC,	%l1
	ldsw	[%l7 + 0x50],	%g5
	edge32	%o6,	%o1,	%l2
	fcmped	%fcc3,	%f4,	%f6
	srl	%i0,	%i7,	%l0
	movg	%icc,	%g6,	%o4
	fmovdvs	%xcc,	%f13,	%f21
	movn	%xcc,	%o7,	%l6
	fmovdne	%icc,	%f8,	%f12
	mulx	%i6,	%i5,	%g2
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	movg	%xcc,	%l3,	%i1
	fcmpes	%fcc0,	%f28,	%f15
	ldsh	[%l7 + 0x18],	%i3
	stw	%o2,	[%l7 + 0x7C]
	umul	%g3,	0x097B,	%g1
	mulx	%o5,	%i2,	%i4
	addc	%o3,	%l4,	%l5
	add	%l1,	%o0,	%o6
	movleu	%xcc,	%o1,	%l2
	movrlz	%i0,	0x14E,	%i7
	edge8l	%l0,	%g6,	%g5
	movne	%xcc,	%o7,	%o4
	fmovdleu	%xcc,	%f9,	%f5
	ldsw	[%l7 + 0x3C],	%i6
	sdivcc	%i5,	0x092B,	%g2
	mova	%xcc,	%g4,	%g7
	ldub	[%l7 + 0x6F],	%l6
	edge32	%l3,	%i3,	%i1
	movne	%icc,	%o2,	%g1
	fmovscs	%icc,	%f9,	%f13
	smul	%g3,	0x1684,	%o5
	addccc	%i4,	0x1189,	%i2
	srax	%o3,	%l4,	%l5
	ldd	[%l7 + 0x10],	%f30
	lduh	[%l7 + 0x0C],	%l1
	edge8ln	%o0,	%o6,	%o1
	orcc	%i0,	%l2,	%l0
	srax	%i7,	0x09,	%g6
	ldub	[%l7 + 0x43],	%g5
	fcmpeq16	%f10,	%f2,	%o4
	fxor	%f22,	%f26,	%f8
	mulx	%o7,	0x035A,	%i5
	sllx	%i6,	%g2,	%g7
	fornot1	%f4,	%f30,	%f4
	array8	%g4,	%l6,	%i3
	ld	[%l7 + 0x4C],	%f4
	udivcc	%i1,	0x0630,	%o2
	sra	%l3,	%g3,	%o5
	stw	%i4,	[%l7 + 0x34]
	orcc	%i2,	%g1,	%o3
	edge16ln	%l4,	%l1,	%o0
	save %o6, 0x13F0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l5,	%i0,	%l2
	fmovrslz	%l0,	%f23,	%f24
	sethi	0x16D1,	%g6
	fornot1	%f0,	%f24,	%f18
	fandnot1	%f6,	%f6,	%f28
	movvs	%xcc,	%i7,	%o4
	edge8	%o7,	%g5,	%i6
	st	%f21,	[%l7 + 0x48]
	udiv	%i5,	0x0817,	%g7
	lduw	[%l7 + 0x48],	%g4
	nop
	set	0x1C, %g3
	ldub	[%l7 + %g3],	%g2
	move	%icc,	%l6,	%i1
	subccc	%i3,	%l3,	%g3
	movne	%icc,	%o5,	%o2
	mulx	%i4,	0x1938,	%i2
	nop
	set	0x72, %o3
	lduh	[%l7 + %o3],	%o3
	srax	%g1,	%l4,	%l1
	ldd	[%l7 + 0x20],	%f0
	restore %o0, 0x1B4D, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l5,	%o6,	%i0
	edge8l	%l2,	%g6,	%i7
	sir	0x0A61
	edge32	%o4,	%l0,	%g5
	fcmpgt16	%f12,	%f14,	%o7
	sdivx	%i5,	0x0287,	%i6
	movpos	%xcc,	%g4,	%g2
	mulx	%g7,	%i1,	%i3
	movvs	%icc,	%l3,	%l6
	stx	%g3,	[%l7 + 0x78]
	subc	%o2,	%o5,	%i4
	andncc	%i2,	%o3,	%l4
	fmovdg	%icc,	%f2,	%f11
	alignaddrl	%g1,	%l1,	%o0
	andncc	%l5,	%o1,	%i0
	move	%icc,	%l2,	%o6
	sdivx	%g6,	0x12A7,	%o4
	edge32l	%l0,	%i7,	%o7
	udivx	%g5,	0x0643,	%i5
	sub	%g4,	0x084D,	%i6
	sub	%g7,	0x0EB0,	%i1
	orn	%i3,	0x1B26,	%l3
	movleu	%xcc,	%g2,	%g3
	movrgz	%l6,	0x1D5,	%o5
	fpadd16	%f22,	%f26,	%f26
	smul	%i4,	%i2,	%o2
	edge16n	%o3,	%l4,	%l1
	movvc	%xcc,	%o0,	%g1
	smulcc	%l5,	0x1F18,	%i0
	andcc	%o1,	%o6,	%l2
	ldsw	[%l7 + 0x48],	%o4
	fcmpd	%fcc3,	%f8,	%f2
	st	%f7,	[%l7 + 0x60]
	fmovrdgez	%g6,	%f2,	%f22
	fabss	%f13,	%f10
	sethi	0x113C,	%i7
	subcc	%l0,	0x0A93,	%o7
	edge32n	%g5,	%i5,	%g4
	udivcc	%i6,	0x1004,	%i1
	andcc	%i3,	0x1BAC,	%g7
	andncc	%l3,	%g3,	%g2
	movle	%icc,	%l6,	%i4
	smulcc	%i2,	%o2,	%o5
	ld	[%l7 + 0x18],	%f23
	movrlz	%l4,	0x128,	%l1
	sethi	0x1617,	%o0
	fmovrsgz	%g1,	%f12,	%f7
	movvs	%xcc,	%l5,	%i0
	fors	%f20,	%f7,	%f7
	fnands	%f12,	%f13,	%f15
	stx	%o1,	[%l7 + 0x70]
	udivcc	%o6,	0x1EFF,	%o3
	movrlz	%o4,	%g6,	%i7
	srl	%l2,	0x0D,	%l0
	fnot2s	%f1,	%f25
	movl	%xcc,	%g5,	%i5
	mulscc	%o7,	%i6,	%g4
	movge	%icc,	%i3,	%g7
	fmovs	%f21,	%f30
	srl	%l3,	0x03,	%g3
	sdiv	%i1,	0x0922,	%l6
	movneg	%icc,	%i4,	%g2
	movleu	%xcc,	%i2,	%o2
	movleu	%icc,	%l4,	%o5
	fmul8x16au	%f7,	%f10,	%f20
	addccc	%o0,	0x1105,	%g1
	sir	0x1B6A
	sdivcc	%l1,	0x16BE,	%l5
	andcc	%i0,	0x174E,	%o6
	fornot1	%f6,	%f12,	%f6
	udiv	%o1,	0x1283,	%o3
	mulscc	%g6,	%o4,	%i7
	edge32ln	%l2,	%l0,	%g5
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	fmovde	%xcc,	%f9,	%f31
	movneg	%xcc,	%g4,	%i3
	fmovdg	%xcc,	%f8,	%f2
	save %i6, 0x1093, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l3,	[%l7 + 0x28]
	movvs	%icc,	%i1,	%g3
	edge8ln	%l6,	%i4,	%g2
	fmovdgu	%xcc,	%f27,	%f2
	ldsb	[%l7 + 0x62],	%o2
	siam	0x7
	udivx	%l4,	0x1CEB,	%o5
	andcc	%i2,	%g1,	%l1
	xor	%o0,	%i0,	%o6
	stx	%o1,	[%l7 + 0x50]
	orn	%l5,	%g6,	%o3
	movpos	%xcc,	%i7,	%l2
	umul	%o4,	%l0,	%g5
	movre	%o7,	0x1BD,	%i5
	fmovsle	%xcc,	%f20,	%f23
	movge	%xcc,	%g4,	%i6
	nop
	set	0x40, %l4
	ldsh	[%l7 + %l4],	%i3
	fnor	%f12,	%f10,	%f24
	stw	%l3,	[%l7 + 0x14]
	fxnor	%f22,	%f10,	%f10
	fandnot1	%f26,	%f18,	%f18
	orn	%i1,	%g3,	%l6
	movrgez	%g7,	0x070,	%g2
	smul	%o2,	0x0847,	%i4
	edge8n	%o5,	%l4,	%g1
	sir	0x16B8
	fcmpgt32	%f28,	%f28,	%i2
	mova	%xcc,	%l1,	%o0
	srax	%o6,	0x15,	%o1
	udiv	%i0,	0x12AE,	%l5
	movrgz	%o3,	0x2A4,	%g6
	mova	%icc,	%i7,	%o4
	xnorcc	%l2,	%l0,	%g5
	movre	%i5,	0x37C,	%g4
	fcmpeq16	%f8,	%f14,	%i6
	ldd	[%l7 + 0x58],	%i2
	mova	%icc,	%l3,	%o7
	lduw	[%l7 + 0x10],	%g3
	fmuld8ulx16	%f29,	%f9,	%f8
	fcmple32	%f0,	%f24,	%i1
	array8	%g7,	%g2,	%o2
	fmovdleu	%icc,	%f21,	%f10
	fnors	%f14,	%f15,	%f17
	srl	%i4,	0x10,	%l6
	movneg	%icc,	%l4,	%g1
	pdist	%f10,	%f26,	%f26
	andcc	%i2,	0x1081,	%o5
	mulx	%l1,	%o0,	%o1
	umul	%i0,	%o6,	%o3
	array16	%g6,	%i7,	%o4
	nop
	set	0x34, %g2
	ldsw	[%l7 + %g2],	%l2
	udivx	%l0,	0x172D,	%l5
	alignaddr	%g5,	%g4,	%i5
	mova	%xcc,	%i3,	%i6
	fones	%f16
	fmovscs	%icc,	%f22,	%f30
	movrlz	%l3,	%g3,	%o7
	movrlz	%i1,	%g7,	%o2
	movpos	%xcc,	%g2,	%i4
	sdiv	%l4,	0x12BB,	%l6
	edge32	%g1,	%i2,	%l1
	ldsh	[%l7 + 0x64],	%o0
	subccc	%o1,	0x06CC,	%i0
	edge32	%o5,	%o6,	%g6
	ld	[%l7 + 0x14],	%f14
	sth	%i7,	[%l7 + 0x20]
	std	%f28,	[%l7 + 0x60]
	addc	%o4,	%o3,	%l0
	movrlez	%l5,	0x2B5,	%l2
	ldd	[%l7 + 0x08],	%g4
	fornot1s	%f31,	%f9,	%f19
	ldsw	[%l7 + 0x58],	%g5
	fmul8ulx16	%f12,	%f30,	%f12
	mulx	%i3,	%i5,	%l3
	addccc	%g3,	0x07E6,	%o7
	popc	0x0487,	%i1
	smul	%g7,	0x1837,	%i6
	stx	%o2,	[%l7 + 0x50]
	edge16n	%g2,	%l4,	%l6
	orn	%g1,	%i4,	%i2
	fmovrsgz	%l1,	%f6,	%f7
	movneg	%xcc,	%o1,	%o0
	fmovdn	%xcc,	%f19,	%f9
	ld	[%l7 + 0x58],	%f4
	umulcc	%o5,	%o6,	%g6
	movcs	%icc,	%i0,	%o4
	umulcc	%i7,	0x0CF1,	%l0
	udivx	%l5,	0x1CC1,	%o3
	subc	%l2,	0x08B0,	%g5
	movcc	%xcc,	%i3,	%g4
	orncc	%l3,	%i5,	%g3
	edge8n	%i1,	%o7,	%g7
	subc	%i6,	0x0111,	%g2
	for	%f2,	%f28,	%f12
	fabss	%f21,	%f31
	fmovsa	%icc,	%f11,	%f31
	movge	%xcc,	%o2,	%l4
	addc	%l6,	%g1,	%i2
	fmovs	%f17,	%f2
	sub	%i4,	%l1,	%o1
	movle	%xcc,	%o5,	%o0
	andcc	%o6,	%i0,	%g6
	edge8n	%i7,	%o4,	%l5
	umul	%l0,	%o3,	%g5
	movgu	%xcc,	%i3,	%g4
	movge	%xcc,	%l3,	%l2
	fmovsg	%xcc,	%f11,	%f3
	ldsb	[%l7 + 0x18],	%i5
	fmovdpos	%xcc,	%f0,	%f4
	sll	%g3,	%i1,	%g7
	movge	%xcc,	%i6,	%o7
	umul	%g2,	%o2,	%l6
	array8	%l4,	%g1,	%i2
	movg	%icc,	%l1,	%o1
	stb	%i4,	[%l7 + 0x77]
	fmovscs	%icc,	%f15,	%f6
	fpsub16s	%f3,	%f27,	%f21
	edge16ln	%o0,	%o5,	%o6
	fpsub32	%f14,	%f18,	%f28
	movleu	%icc,	%g6,	%i7
	or	%o4,	0x1DC1,	%l5
	andcc	%l0,	%i0,	%g5
	ldx	[%l7 + 0x70],	%o3
	movleu	%xcc,	%i3,	%g4
	fsrc1	%f6,	%f16
	orcc	%l3,	0x0E6B,	%l2
	sub	%g3,	0x1A39,	%i5
	xnorcc	%g7,	0x0A45,	%i1
	addcc	%i6,	%o7,	%o2
	edge8l	%g2,	%l6,	%l4
	smul	%g1,	0x0122,	%i2
	udivcc	%o1,	0x0255,	%i4
	movneg	%xcc,	%o0,	%o5
	restore %o6, 0x088C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i7,	%l1
	sub	%o4,	0x0FCA,	%l0
	addccc	%l5,	%i0,	%o3
	ldd	[%l7 + 0x18],	%f0
	array8	%g5,	%i3,	%l3
	umul	%g4,	0x186F,	%l2
	movl	%icc,	%i5,	%g7
	xorcc	%g3,	0x0C6B,	%i1
	fmovdcc	%xcc,	%f27,	%f17
	array16	%i6,	%o7,	%o2
	movrgez	%g2,	0x07B,	%l4
	mova	%icc,	%g1,	%l6
	edge8	%o1,	%i4,	%i2
	udivx	%o5,	0x1C6C,	%o0
	edge32n	%g6,	%o6,	%l1
	lduh	[%l7 + 0x50],	%i7
	movrlz	%o4,	%l0,	%i0
	fexpand	%f11,	%f20
	movrlz	%l5,	0x2A3,	%g5
	umul	%i3,	0x12CA,	%l3
	fnand	%f8,	%f18,	%f2
	st	%f11,	[%l7 + 0x50]
	fcmple16	%f16,	%f26,	%g4
	fnors	%f0,	%f15,	%f10
	sra	%l2,	%i5,	%o3
	save %g3, 0x073C, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g7,	0x1C64,	%i6
	sdivx	%o7,	0x0127,	%g2
	fexpand	%f16,	%f18
	edge8l	%l4,	%o2,	%l6
	st	%f10,	[%l7 + 0x74]
	nop
	set	0x32, %o7
	lduh	[%l7 + %o7],	%g1
	sll	%i4,	0x0F,	%i2
	movrgz	%o1,	0x309,	%o0
	mulscc	%o5,	0x06C3,	%g6
	movre	%o6,	0x0F2,	%l1
	srl	%o4,	%i7,	%l0
	nop
	set	0x58, %l6
	ldd	[%l7 + %l6],	%i0
	movvs	%icc,	%l5,	%i3
	movrlez	%g5,	%l3,	%l2
	udiv	%i5,	0x1DCB,	%o3
	subccc	%g3,	0x0802,	%i1
	nop
	set	0x28, %i5
	std	%f4,	[%l7 + %i5]
	sll	%g4,	%g7,	%i6
	sth	%g2,	[%l7 + 0x54]
	lduh	[%l7 + 0x5E],	%o7
	movrgez	%o2,	%l6,	%l4
	movneg	%icc,	%g1,	%i4
	movrgz	%i2,	0x1A5,	%o1
	subcc	%o0,	%g6,	%o6
	andcc	%l1,	0x19A8,	%o5
	sll	%i7,	%o4,	%i0
	and	%l5,	%l0,	%g5
	ldub	[%l7 + 0x72],	%l3
	movne	%xcc,	%i3,	%i5
	addccc	%l2,	%g3,	%o3
	sdiv	%i1,	0x1916,	%g4
	fsrc1	%f14,	%f16
	edge8	%g7,	%i6,	%o7
	addccc	%o2,	0x0852,	%g2
	fnands	%f4,	%f7,	%f25
	ldsh	[%l7 + 0x6C],	%l6
	std	%f22,	[%l7 + 0x50]
	addc	%g1,	%l4,	%i4
	ldsb	[%l7 + 0x22],	%o1
	movle	%icc,	%i2,	%o0
	ld	[%l7 + 0x78],	%f22
	andn	%g6,	%o6,	%o5
	subcc	%i7,	0x1205,	%l1
	udivx	%i0,	0x1A54,	%o4
	movleu	%icc,	%l0,	%l5
	array8	%l3,	%i3,	%i5
	fpsub16s	%f1,	%f31,	%f8
	umul	%l2,	%g5,	%o3
	subc	%g3,	0x1150,	%i1
	edge16	%g4,	%i6,	%g7
	fmovrdlez	%o2,	%f28,	%f28
	sra	%g2,	%o7,	%l6
	movneg	%icc,	%g1,	%l4
	fmovsgu	%xcc,	%f25,	%f28
	or	%i4,	0x0FDA,	%o1
	ldd	[%l7 + 0x48],	%f28
	srax	%i2,	0x02,	%g6
	fpsub32	%f30,	%f18,	%f6
	addcc	%o6,	%o5,	%o0
	popc	%i7,	%l1
	mulx	%o4,	0x1722,	%i0
	xor	%l5,	0x0061,	%l3
	subc	%l0,	0x17A4,	%i3
	xnor	%l2,	0x059A,	%i5
	array32	%o3,	%g5,	%g3
	movl	%xcc,	%i1,	%g4
	movge	%icc,	%i6,	%g7
	fmul8ulx16	%f30,	%f12,	%f8
	stb	%o2,	[%l7 + 0x7B]
	edge8	%o7,	%g2,	%g1
	fmovsne	%xcc,	%f29,	%f19
	andncc	%l6,	%l4,	%i4
	movrgz	%i2,	%o1,	%o6
	fmovsleu	%icc,	%f5,	%f8
	orncc	%o5,	%g6,	%o0
	smul	%i7,	0x00DE,	%o4
	xnorcc	%l1,	%l5,	%i0
	edge16n	%l0,	%i3,	%l2
	edge32ln	%l3,	%o3,	%i5
	fpadd32s	%f25,	%f26,	%f28
	sll	%g3,	%g5,	%i1
	umulcc	%g4,	%i6,	%g7
	srlx	%o7,	%o2,	%g1
	or	%g2,	0x1A63,	%l6
	xnor	%i4,	0x008C,	%i2
	popc	0x0E4F,	%o1
	orncc	%l4,	0x02DB,	%o5
	fpadd32s	%f19,	%f10,	%f17
	xorcc	%g6,	0x1A11,	%o0
	fcmpeq16	%f6,	%f14,	%i7
	subcc	%o6,	0x1E85,	%o4
	ldx	[%l7 + 0x58],	%l5
	alignaddr	%i0,	%l1,	%l0
	edge16ln	%i3,	%l3,	%o3
	stw	%i5,	[%l7 + 0x1C]
	faligndata	%f22,	%f18,	%f24
	movrlz	%g3,	%l2,	%i1
	fand	%f4,	%f0,	%f0
	sir	0x04BB
	fmovdvc	%icc,	%f25,	%f16
	ldx	[%l7 + 0x28],	%g4
	ldsw	[%l7 + 0x6C],	%g5
	movpos	%icc,	%i6,	%g7
	movne	%icc,	%o2,	%o7
	movge	%xcc,	%g1,	%l6
	udivx	%i4,	0x1DA8,	%i2
	xnor	%o1,	%l4,	%o5
	movre	%g2,	%g6,	%i7
	edge16ln	%o6,	%o4,	%o0
	stw	%l5,	[%l7 + 0x30]
	udiv	%l1,	0x1008,	%i0
	movre	%l0,	%l3,	%o3
	popc	%i3,	%i5
	stb	%l2,	[%l7 + 0x70]
	stx	%i1,	[%l7 + 0x58]
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%f2
	save %g4, 0x00E4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i6,	%g7,	%o2
	addccc	%o7,	%g5,	%g1
	movrgz	%l6,	0x3FF,	%i4
	alignaddrl	%i2,	%o1,	%l4
	ldub	[%l7 + 0x20],	%g2
	popc	0x1284,	%o5
	sir	0x1200
	fcmpes	%fcc1,	%f2,	%f26
	fmovdcs	%icc,	%f0,	%f8
	ldsb	[%l7 + 0x3C],	%i7
	stw	%o6,	[%l7 + 0x48]
	xorcc	%o4,	0x0AF8,	%o0
	nop
	set	0x56, %g5
	stb	%l5,	[%l7 + %g5]
	st	%f6,	[%l7 + 0x70]
	movre	%l1,	%g6,	%l0
	udiv	%l3,	0x0977,	%i0
	edge8l	%o3,	%i5,	%i3
	movvs	%xcc,	%i1,	%g4
	lduh	[%l7 + 0x10],	%l2
	alignaddr	%i6,	%g3,	%o2
	fcmped	%fcc3,	%f10,	%f26
	alignaddr	%o7,	%g5,	%g7
	edge16ln	%g1,	%l6,	%i2
	movrne	%o1,	%l4,	%g2
	xnorcc	%o5,	0x1937,	%i4
	movvs	%icc,	%o6,	%o4
	ldub	[%l7 + 0x3C],	%o0
	smulcc	%i7,	%l1,	%g6
	ldx	[%l7 + 0x40],	%l5
	movgu	%xcc,	%l0,	%l3
	umul	%o3,	%i0,	%i5
	movrgez	%i1,	%i3,	%l2
	fmovrse	%g4,	%f12,	%f19
	andcc	%g3,	%i6,	%o2
	fmovdg	%xcc,	%f5,	%f0
	mulscc	%g5,	%o7,	%g7
	udivx	%l6,	0x066E,	%g1
	fcmpes	%fcc0,	%f28,	%f11
	fmovrslez	%i2,	%f3,	%f10
	movre	%o1,	0x2E4,	%l4
	ldsh	[%l7 + 0x12],	%g2
	movleu	%xcc,	%i4,	%o5
	alignaddrl	%o4,	%o6,	%o0
	subcc	%i7,	%g6,	%l1
	fmovrdlz	%l0,	%f18,	%f28
	xnorcc	%l3,	0x06DA,	%l5
	orcc	%i0,	%i5,	%i1
	movneg	%xcc,	%o3,	%i3
	sll	%g4,	0x10,	%g3
	sllx	%i6,	0x09,	%o2
	stb	%g5,	[%l7 + 0x2D]
	bshuffle	%f30,	%f12,	%f28
	lduh	[%l7 + 0x14],	%l2
	mulscc	%o7,	0x1424,	%g7
	fcmpes	%fcc2,	%f11,	%f0
	andcc	%g1,	%i2,	%o1
	fzero	%f10
	fmovsa	%xcc,	%f22,	%f17
	edge8n	%l6,	%g2,	%l4
	movn	%xcc,	%o5,	%i4
	fmovd	%f30,	%f4
	add	%o6,	0x0D90,	%o0
	stx	%o4,	[%l7 + 0x60]
	subccc	%g6,	%i7,	%l1
	edge8	%l0,	%l5,	%l3
	movre	%i5,	0x021,	%i1
	addcc	%i0,	%o3,	%g4
	fpack16	%f20,	%f3
	move	%xcc,	%g3,	%i3
	alignaddrl	%i6,	%g5,	%l2
	umul	%o7,	%g7,	%g1
	lduw	[%l7 + 0x28],	%i2
	sth	%o2,	[%l7 + 0x44]
	ldsw	[%l7 + 0x70],	%o1
	movrgz	%g2,	0x0A9,	%l6
	edge16ln	%o5,	%i4,	%o6
	srlx	%o0,	%o4,	%g6
	movleu	%icc,	%l4,	%i7
	sllx	%l1,	0x02,	%l5
	stx	%l3,	[%l7 + 0x50]
	sdiv	%l0,	0x0892,	%i5
	fnands	%f10,	%f25,	%f25
	ldub	[%l7 + 0x51],	%i0
	and	%i1,	0x054D,	%g4
	stb	%g3,	[%l7 + 0x36]
	ld	[%l7 + 0x68],	%f2
	stb	%i3,	[%l7 + 0x76]
	movne	%icc,	%i6,	%o3
	sth	%g5,	[%l7 + 0x1A]
	fexpand	%f26,	%f0
	udiv	%o7,	0x00F9,	%l2
	orncc	%g7,	0x034F,	%g1
	sdivx	%o2,	0x0884,	%i2
	array32	%o1,	%l6,	%o5
	andncc	%i4,	%g2,	%o0
	movle	%xcc,	%o4,	%o6
	save %g6, %l4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l5,	%l3,	%l1
	andncc	%l0,	%i0,	%i1
	smul	%i5,	0x1165,	%g3
	fmovdcs	%xcc,	%f2,	%f26
	orcc	%g4,	0x19D3,	%i6
	fmovrslz	%i3,	%f31,	%f28
	sll	%g5,	0x1A,	%o3
	fmovrsgz	%o7,	%f25,	%f12
	movvs	%xcc,	%l2,	%g7
	fmovsne	%icc,	%f13,	%f3
	fcmpne16	%f0,	%f18,	%o2
	ldsw	[%l7 + 0x70],	%i2
	sllx	%o1,	0x03,	%l6
	ldd	[%l7 + 0x18],	%g0
	edge32	%o5,	%g2,	%o0
	array8	%i4,	%o4,	%g6
	fandnot2	%f10,	%f16,	%f4
	fabss	%f17,	%f7
	ldub	[%l7 + 0x1A],	%l4
	fnands	%f30,	%f29,	%f9
	edge32	%i7,	%o6,	%l3
	xnorcc	%l5,	0x0130,	%l0
	ldub	[%l7 + 0x74],	%l1
	srax	%i1,	0x16,	%i0
	edge16ln	%g3,	%i5,	%i6
	movge	%xcc,	%g4,	%g5
	movcs	%icc,	%i3,	%o3
	alignaddrl	%l2,	%g7,	%o7
	fmovdge	%icc,	%f26,	%f21
	and	%i2,	0x1936,	%o1
	st	%f18,	[%l7 + 0x18]
	xor	%l6,	%g1,	%o2
	movge	%icc,	%o5,	%g2
	movg	%xcc,	%o0,	%o4
	fmovsge	%icc,	%f23,	%f2
	sub	%g6,	%l4,	%i4
	ldd	[%l7 + 0x70],	%o6
	sdivcc	%i7,	0x0D1B,	%l5
	sdiv	%l3,	0x0B2F,	%l0
	mova	%xcc,	%l1,	%i0
	fsrc1	%f0,	%f0
	smulcc	%i1,	%i5,	%g3
	umul	%g4,	%g5,	%i3
	fcmpeq16	%f22,	%f2,	%i6
	fsrc2s	%f25,	%f18
	array8	%l2,	%g7,	%o7
	popc	%o3,	%i2
	ldub	[%l7 + 0x3D],	%l6
	edge16l	%g1,	%o2,	%o5
	smul	%g2,	0x0043,	%o0
	udivx	%o1,	0x0A1C,	%o4
	ldsw	[%l7 + 0x38],	%g6
	fmovsa	%xcc,	%f4,	%f25
	movl	%xcc,	%l4,	%i4
	fmuld8sux16	%f0,	%f7,	%f10
	xnorcc	%i7,	%o6,	%l5
	fcmpes	%fcc0,	%f4,	%f9
	fmovscs	%icc,	%f22,	%f20
	subccc	%l3,	0x09F2,	%l0
	addcc	%l1,	0x0941,	%i0
	lduw	[%l7 + 0x74],	%i5
	srlx	%g3,	%g4,	%i1
	fmovdvs	%icc,	%f1,	%f0
	fmovdge	%xcc,	%f10,	%f2
	alignaddr	%g5,	%i6,	%i3
	movcc	%icc,	%l2,	%o7
	srl	%o3,	%i2,	%g7
	movrlez	%l6,	%g1,	%o2
	andn	%g2,	%o5,	%o0
	array8	%o1,	%g6,	%l4
	srlx	%o4,	%i7,	%o6
	stb	%i4,	[%l7 + 0x78]
	fpadd16	%f26,	%f2,	%f10
	smulcc	%l3,	%l0,	%l5
	ldsw	[%l7 + 0x24],	%i0
	movle	%xcc,	%l1,	%i5
	xnorcc	%g3,	0x07DD,	%g4
	fmovdne	%xcc,	%f8,	%f0
	fmovsneg	%icc,	%f2,	%f19
	edge32	%i1,	%g5,	%i3
	fmuld8ulx16	%f23,	%f11,	%f4
	stx	%i6,	[%l7 + 0x08]
	xnorcc	%o7,	%o3,	%i2
	sll	%g7,	%l2,	%g1
	edge8n	%l6,	%g2,	%o5
	orncc	%o0,	%o2,	%g6
	fxors	%f18,	%f27,	%f11
	fmovrdne	%o1,	%f0,	%f4
	fmovrsgz	%l4,	%f18,	%f30
	ldd	[%l7 + 0x70],	%f26
	array8	%o4,	%i7,	%o6
	xnorcc	%l3,	%i4,	%l0
	edge8	%i0,	%l1,	%i5
	subc	%l5,	0x0117,	%g4
	edge8n	%g3,	%i1,	%g5
	movge	%xcc,	%i3,	%i6
	sllx	%o3,	%i2,	%g7
	udivcc	%o7,	0x1F34,	%g1
	movre	%l6,	0x185,	%l2
	fmul8x16	%f21,	%f2,	%f20
	edge32l	%g2,	%o5,	%o0
	movneg	%icc,	%g6,	%o1
	fmovrdgz	%o2,	%f8,	%f0
	xnor	%o4,	0x1E2B,	%i7
	std	%f2,	[%l7 + 0x78]
	xor	%o6,	0x018D,	%l4
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	ldd	[%l7 + 0x08],	%i0
	fmovsg	%icc,	%f3,	%f8
	edge16	%i4,	%l1,	%l5
	fmovde	%icc,	%f8,	%f6
	udivcc	%g4,	0x1E09,	%g3
	srl	%i5,	0x1B,	%g5
	srl	%i1,	0x07,	%i6
	restore %o3, 0x13B9, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc1,	%f27,	%f22
	ldd	[%l7 + 0x60],	%g6
	ldsh	[%l7 + 0x24],	%i2
	edge32	%o7,	%l6,	%l2
	fmuld8sux16	%f7,	%f21,	%f26
	movg	%icc,	%g2,	%g1
	udivx	%o0,	0x1EFE,	%g6
	fpadd16s	%f10,	%f15,	%f4
	fxnors	%f31,	%f14,	%f8
	fmuld8ulx16	%f26,	%f21,	%f8
	edge16ln	%o5,	%o1,	%o2
	fcmpd	%fcc0,	%f14,	%f16
	srl	%o4,	0x02,	%i7
	std	%f14,	[%l7 + 0x30]
	movvs	%xcc,	%o6,	%l4
	subcc	%l0,	0x128C,	%l3
	fmovrsne	%i4,	%f0,	%f21
	xor	%i0,	0x18BA,	%l5
	fmovs	%f16,	%f9
	subcc	%g4,	0x1D5D,	%g3
	mova	%xcc,	%l1,	%i5
	andn	%g5,	0x1EBD,	%i1
	sdiv	%o3,	0x13B3,	%i6
	sdivcc	%i3,	0x1387,	%i2
	edge8ln	%g7,	%l6,	%l2
	and	%o7,	%g1,	%o0
	fnor	%f22,	%f10,	%f0
	fpadd16s	%f14,	%f27,	%f10
	movn	%icc,	%g2,	%o5
	sll	%g6,	0x0C,	%o1
	nop
	set	0x48, %i6
	std	%f2,	[%l7 + %i6]
	movne	%icc,	%o2,	%i7
	save %o6, 0x14D5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l0,	%l3,	%l4
	edge32l	%i0,	%l5,	%i4
	movcc	%icc,	%g3,	%l1
	edge16n	%g4,	%g5,	%i1
	andn	%i5,	%o3,	%i6
	fmovrslz	%i2,	%f21,	%f29
	udivcc	%i3,	0x1571,	%l6
	udiv	%l2,	0x0613,	%g7
	movrlz	%g1,	%o0,	%o7
	addccc	%g2,	0x161E,	%o5
	movvs	%xcc,	%o1,	%o2
	sdivx	%i7,	0x0680,	%o6
	movrgez	%g6,	0x0CB,	%l0
	alignaddr	%o4,	%l3,	%i0
	fcmpeq32	%f20,	%f24,	%l4
	movrne	%l5,	0x2AB,	%g3
	sub	%l1,	%i4,	%g5
	movre	%i1,	0x2BF,	%i5
	edge8l	%o3,	%g4,	%i2
	ldd	[%l7 + 0x28],	%i6
	andn	%l6,	0x097A,	%i3
	array32	%l2,	%g7,	%g1
	st	%f27,	[%l7 + 0x40]
	fabsd	%f8,	%f0
	movcs	%icc,	%o7,	%o0
	fcmped	%fcc3,	%f4,	%f2
	movge	%icc,	%g2,	%o1
	edge32n	%o5,	%o2,	%i7
	ldub	[%l7 + 0x67],	%g6
	alignaddr	%l0,	%o6,	%l3
	movgu	%icc,	%o4,	%i0
	move	%icc,	%l4,	%g3
	smulcc	%l5,	0x1A17,	%i4
	fnot1	%f30,	%f2
	xnor	%l1,	%g5,	%i1
	ldsh	[%l7 + 0x08],	%o3
	array8	%i5,	%g4,	%i2
	st	%f6,	[%l7 + 0x5C]
	fmul8x16au	%f31,	%f10,	%f14
	andn	%i6,	0x0B75,	%i3
	subccc	%l2,	%l6,	%g7
	fpackfix	%f30,	%f20
	st	%f21,	[%l7 + 0x10]
	mova	%icc,	%o7,	%g1
	movrlz	%g2,	%o0,	%o1
	alignaddr	%o2,	%i7,	%o5
	movpos	%xcc,	%g6,	%o6
	xor	%l3,	%o4,	%l0
	mulscc	%l4,	%g3,	%i0
	fmovdgu	%xcc,	%f23,	%f2
	addc	%i4,	0x0E22,	%l1
	movle	%xcc,	%l5,	%g5
	fmul8x16	%f17,	%f12,	%f14
	movre	%i1,	0x310,	%o3
	xor	%i5,	%g4,	%i2
	array32	%i6,	%i3,	%l6
	edge8	%g7,	%o7,	%g1
	fmovs	%f11,	%f23
	edge16n	%l2,	%g2,	%o1
	fpmerge	%f12,	%f4,	%f26
	orcc	%o0,	0x0476,	%o2
	fzero	%f16
	movgu	%xcc,	%o5,	%g6
	popc	0x1B04,	%o6
	fcmpeq16	%f28,	%f30,	%l3
	alignaddrl	%o4,	%i7,	%l0
	st	%f15,	[%l7 + 0x74]
	movge	%xcc,	%g3,	%i0
	fpadd32s	%f11,	%f23,	%f4
	umulcc	%i4,	%l4,	%l1
	movle	%xcc,	%l5,	%i1
	edge8n	%o3,	%i5,	%g4
	fmovrdlz	%g5,	%f16,	%f18
	edge32n	%i2,	%i6,	%i3
	edge32	%g7,	%o7,	%l6
	fmovrslez	%l2,	%f0,	%f29
	stw	%g2,	[%l7 + 0x2C]
	fmovsl	%xcc,	%f25,	%f22
	fmovdle	%xcc,	%f31,	%f28
	alignaddrl	%g1,	%o0,	%o2
	edge16l	%o5,	%g6,	%o1
	udivcc	%o6,	0x0199,	%l3
	movrgz	%i7,	%l0,	%g3
	alignaddrl	%i0,	%i4,	%l4
	fnegd	%f24,	%f12
	stx	%l1,	[%l7 + 0x78]
	sub	%o4,	%i1,	%o3
	movl	%xcc,	%i5,	%g4
	fmul8sux16	%f2,	%f12,	%f22
	andcc	%l5,	%i2,	%g5
	fpack16	%f24,	%f11
	ldsw	[%l7 + 0x24],	%i3
	movneg	%icc,	%g7,	%o7
	fmovsa	%icc,	%f4,	%f29
	andn	%l6,	%i6,	%l2
	movn	%icc,	%g1,	%g2
	movpos	%icc,	%o2,	%o5
	fand	%f2,	%f8,	%f20
	fcmped	%fcc1,	%f26,	%f24
	movn	%icc,	%g6,	%o0
	fmovsg	%xcc,	%f6,	%f15
	xorcc	%o6,	%l3,	%i7
	smul	%l0,	0x1C83,	%o1
	st	%f19,	[%l7 + 0x54]
	movrlez	%i0,	%i4,	%l4
	ldsh	[%l7 + 0x6A],	%l1
	movle	%icc,	%o4,	%g3
	fands	%f17,	%f14,	%f8
	smulcc	%o3,	%i5,	%g4
	nop
	set	0x54, %o5
	stw	%i1,	[%l7 + %o5]
	fmovde	%xcc,	%f11,	%f30
	array32	%l5,	%i2,	%g5
	movcs	%xcc,	%g7,	%i3
	andcc	%o7,	0x03BA,	%i6
	smulcc	%l2,	0x12CF,	%l6
	st	%f27,	[%l7 + 0x60]
	sth	%g1,	[%l7 + 0x5A]
	add	%o2,	0x0ACF,	%g2
	umul	%o5,	0x1886,	%g6
	ld	[%l7 + 0x08],	%f0
	stw	%o0,	[%l7 + 0x3C]
	smul	%l3,	%o6,	%i7
	sllx	%l0,	0x12,	%o1
	movvs	%icc,	%i4,	%l4
	umul	%i0,	%l1,	%g3
	movvc	%xcc,	%o4,	%o3
	mova	%xcc,	%g4,	%i1
	edge16	%l5,	%i2,	%g5
	sdivx	%i5,	0x0B59,	%g7
	subccc	%i3,	%i6,	%l2
	edge16ln	%o7,	%l6,	%g1
	srlx	%g2,	%o5,	%o2
	edge8n	%g6,	%o0,	%o6
	edge16	%i7,	%l0,	%o1
	fandnot2	%f16,	%f2,	%f20
	xnorcc	%l3,	0x153A,	%l4
	nop
	set	0x68, %g7
	ldsh	[%l7 + %g7],	%i4
	fcmple16	%f2,	%f26,	%i0
	sdivx	%g3,	0x1B0F,	%o4
	sth	%l1,	[%l7 + 0x0C]
	fmovsvs	%icc,	%f7,	%f4
	nop
	set	0x78, %g4
	ldsw	[%l7 + %g4],	%o3
	andcc	%i1,	%l5,	%i2
	xnor	%g5,	%i5,	%g7
	fand	%f20,	%f26,	%f10
	movre	%i3,	%g4,	%i6
	fexpand	%f26,	%f6
	sllx	%o7,	%l2,	%l6
	fmul8sux16	%f18,	%f12,	%f14
	alignaddrl	%g2,	%o5,	%o2
	movrlz	%g1,	%g6,	%o0
	sth	%o6,	[%l7 + 0x16]
	movn	%xcc,	%l0,	%i7
	fpmerge	%f17,	%f10,	%f28
	udivcc	%l3,	0x1388,	%l4
	stw	%i4,	[%l7 + 0x70]
	fnot1s	%f16,	%f13
	sdiv	%i0,	0x04CB,	%g3
	sub	%o1,	0x0777,	%l1
	stx	%o4,	[%l7 + 0x08]
	movge	%icc,	%i1,	%l5
	edge16l	%i2,	%g5,	%o3
	fors	%f5,	%f8,	%f22
	srax	%g7,	0x1D,	%i5
	movpos	%icc,	%g4,	%i6
	edge32	%i3,	%o7,	%l2
	fmovdgu	%xcc,	%f9,	%f26
	umulcc	%g2,	%o5,	%l6
	ldub	[%l7 + 0x59],	%g1
	sra	%g6,	%o2,	%o0
	fcmpgt16	%f30,	%f2,	%o6
	smulcc	%i7,	%l3,	%l0
	fmovdgu	%icc,	%f20,	%f11
	udivx	%i4,	0x178A,	%i0
	movpos	%xcc,	%l4,	%o1
	movvc	%xcc,	%g3,	%l1
	movvc	%icc,	%i1,	%o4
	sdivx	%i2,	0x1820,	%l5
	subccc	%o3,	0x005A,	%g7
	fmovrsgz	%g5,	%f16,	%f25
	srax	%g4,	0x15,	%i5
	fmovde	%xcc,	%f19,	%f0
	edge8l	%i3,	%o7,	%l2
	edge32	%i6,	%g2,	%l6
	movgu	%icc,	%g1,	%g6
	edge8n	%o2,	%o5,	%o0
	xnor	%o6,	0x05E7,	%l3
	ldsw	[%l7 + 0x64],	%i7
	sdivcc	%l0,	0x191D,	%i0
	ldsb	[%l7 + 0x41],	%i4
	fmovsle	%xcc,	%f7,	%f30
	popc	%o1,	%g3
	edge32l	%l1,	%l4,	%i1
	sll	%o4,	%l5,	%i2
	fmovsge	%xcc,	%f18,	%f31
	sll	%o3,	0x1E,	%g7
	subcc	%g5,	%i5,	%g4
	fmuld8sux16	%f2,	%f26,	%f24
	edge16ln	%i3,	%l2,	%o7
	fpsub16	%f22,	%f10,	%f18
	sdivx	%i6,	0x1C80,	%l6
	ld	[%l7 + 0x0C],	%f17
	sllx	%g2,	%g6,	%g1
	fmovsg	%xcc,	%f17,	%f9
	xnorcc	%o2,	0x07B9,	%o0
	fabsd	%f6,	%f2
	edge32	%o5,	%o6,	%i7
	movrne	%l0,	%i0,	%i4
	sub	%o1,	0x089D,	%g3
	stx	%l3,	[%l7 + 0x60]
	sth	%l1,	[%l7 + 0x2C]
	lduw	[%l7 + 0x7C],	%l4
	fmovda	%xcc,	%f3,	%f3
	movpos	%icc,	%i1,	%l5
	subcc	%o4,	%o3,	%g7
	alignaddrl	%g5,	%i2,	%g4
	xorcc	%i3,	%l2,	%i5
	movg	%icc,	%i6,	%o7
	movleu	%icc,	%l6,	%g2
	sra	%g6,	%o2,	%o0
	edge16	%o5,	%g1,	%i7
	sdivcc	%l0,	0x0149,	%o6
	fmovda	%icc,	%f17,	%f23
	ldub	[%l7 + 0x2E],	%i4
	movne	%xcc,	%o1,	%i0
	fnot1s	%f8,	%f8
	ldsb	[%l7 + 0x57],	%l3
	movrlez	%l1,	%g3,	%i1
	xnorcc	%l4,	%l5,	%o4
	fzeros	%f19
	fmovrdgz	%o3,	%f30,	%f14
	movl	%xcc,	%g5,	%i2
	fpadd16s	%f26,	%f6,	%f8
	nop
	set	0x50, %i1
	stb	%g7,	[%l7 + %i1]
	orncc	%i3,	0x0368,	%g4
	subccc	%l2,	%i6,	%o7
	edge8l	%l6,	%g2,	%i5
	fsrc1	%f24,	%f2
	fands	%f21,	%f10,	%f22
	subcc	%o2,	0x0DA2,	%o0
	movgu	%xcc,	%g6,	%o5
	edge16	%i7,	%g1,	%l0
	ldd	[%l7 + 0x78],	%o6
	movrne	%i4,	%i0,	%l3
	edge32	%o1,	%g3,	%l1
	edge8n	%i1,	%l5,	%o4
	movvc	%icc,	%o3,	%l4
	faligndata	%f2,	%f12,	%f14
	movvs	%xcc,	%i2,	%g7
	xnor	%g5,	%g4,	%l2
	orn	%i6,	0x09AF,	%i3
	sub	%l6,	%o7,	%i5
	movneg	%icc,	%g2,	%o2
	edge16	%o0,	%g6,	%i7
	sll	%o5,	0x0D,	%g1
	fmul8sux16	%f12,	%f20,	%f6
	sdivcc	%l0,	0x1954,	%i4
	movre	%i0,	%o6,	%l3
	edge16n	%o1,	%g3,	%i1
	xnor	%l5,	0x1F21,	%l1
	ldx	[%l7 + 0x50],	%o3
	edge32l	%o4,	%i2,	%g7
	move	%icc,	%l4,	%g4
	movl	%xcc,	%l2,	%g5
	ldub	[%l7 + 0x54],	%i6
	fmovdn	%xcc,	%f26,	%f4
	xorcc	%l6,	%o7,	%i5
	movre	%i3,	%g2,	%o0
	srl	%g6,	0x1F,	%i7
	sdivcc	%o2,	0x0324,	%o5
	alignaddrl	%g1,	%i4,	%i0
	movleu	%xcc,	%l0,	%l3
	fmovsgu	%xcc,	%f22,	%f16
	movne	%icc,	%o6,	%o1
	edge16l	%g3,	%l5,	%l1
	edge8ln	%o3,	%o4,	%i1
	or	%g7,	0x1377,	%l4
	fmovsn	%xcc,	%f6,	%f19
	edge8	%g4,	%i2,	%g5
	orcc	%l2,	%i6,	%o7
	fpadd32s	%f28,	%f1,	%f14
	movvs	%icc,	%i5,	%l6
	addccc	%g2,	%i3,	%o0
	movgu	%xcc,	%i7,	%o2
	orcc	%o5,	0x0168,	%g6
	xnorcc	%i4,	0x102D,	%g1
	xor	%l0,	0x02AE,	%l3
	ldsh	[%l7 + 0x0A],	%i0
	udivcc	%o6,	0x0F82,	%o1
	edge8	%l5,	%g3,	%o3
	andcc	%o4,	0x0AB1,	%l1
	edge8ln	%g7,	%l4,	%i1
	movre	%g4,	%g5,	%i2
	stb	%l2,	[%l7 + 0x47]
	andcc	%o7,	0x19CD,	%i5
	move	%xcc,	%l6,	%i6
	edge32n	%g2,	%i3,	%o0
	fzero	%f16
	movne	%xcc,	%o2,	%o5
	ldx	[%l7 + 0x48],	%i7
	ldsb	[%l7 + 0x63],	%g6
	bshuffle	%f8,	%f20,	%f10
	stx	%g1,	[%l7 + 0x48]
	ldsb	[%l7 + 0x55],	%i4
	movcs	%icc,	%l0,	%l3
	fpsub32s	%f27,	%f10,	%f2
	movcs	%icc,	%i0,	%o1
	umul	%l5,	%o6,	%g3
	edge32n	%o3,	%o4,	%g7
	ldsh	[%l7 + 0x3C],	%l1
	fxors	%f18,	%f17,	%f25
	ld	[%l7 + 0x58],	%f25
	movrlz	%l4,	%g4,	%i1
	edge32	%g5,	%l2,	%i2
	mulx	%i5,	0x1264,	%l6
	umulcc	%i6,	0x0532,	%o7
	fpadd16s	%f28,	%f9,	%f28
	xorcc	%g2,	%o0,	%o2
	movrgez	%o5,	%i7,	%i3
	fmovrse	%g1,	%f18,	%f1
	udiv	%g6,	0x1D5D,	%l0
	save %i4, %i0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l5,	%o6
	ldub	[%l7 + 0x72],	%o1
	stx	%o3,	[%l7 + 0x60]
	stx	%o4,	[%l7 + 0x28]
	movrlez	%g3,	%l1,	%l4
	subcc	%g7,	%g4,	%g5
	std	%f0,	[%l7 + 0x40]
	mulscc	%l2,	0x04C5,	%i1
	movleu	%xcc,	%i2,	%l6
	array8	%i6,	%o7,	%g2
	movl	%xcc,	%i5,	%o0
	movrgez	%o2,	0x168,	%o5
	ldd	[%l7 + 0x78],	%f26
	sdivx	%i7,	0x18DC,	%i3
	movneg	%icc,	%g6,	%l0
	movcc	%xcc,	%i4,	%i0
	movrne	%l3,	%g1,	%o6
	fxnor	%f18,	%f14,	%f0
	umul	%o1,	%l5,	%o4
	movg	%xcc,	%o3,	%g3
	ldsb	[%l7 + 0x52],	%l1
	fmul8x16al	%f13,	%f8,	%f10
	ld	[%l7 + 0x40],	%f0
	save %g7, 0x14AD, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g5,	[%l7 + 0x41]
	ldsh	[%l7 + 0x5A],	%l2
	movl	%icc,	%i1,	%l4
	edge8	%i2,	%l6,	%o7
	movcs	%icc,	%i6,	%g2
	sub	%i5,	%o0,	%o5
	movrgz	%o2,	%i3,	%i7
	fpsub16s	%f11,	%f14,	%f7
	udivx	%g6,	0x1E97,	%i4
	edge16l	%l0,	%i0,	%l3
	edge16n	%o6,	%o1,	%l5
	sir	0x1925
	fmovsa	%icc,	%f25,	%f22
	ldd	[%l7 + 0x50],	%o4
	movneg	%xcc,	%g1,	%g3
	array8	%l1,	%g7,	%o3
	edge16n	%g4,	%l2,	%g5
	movvc	%icc,	%l4,	%i2
	fcmple16	%f6,	%f30,	%i1
	addcc	%l6,	0x042F,	%o7
	sethi	0x1F53,	%i6
	edge8ln	%i5,	%o0,	%g2
	ldsb	[%l7 + 0x56],	%o2
	movleu	%xcc,	%o5,	%i7
	array8	%g6,	%i4,	%i3
	fmovsg	%xcc,	%f31,	%f6
	subccc	%l0,	%i0,	%l3
	fmovdleu	%xcc,	%f20,	%f13
	movne	%xcc,	%o6,	%o1
	addcc	%l5,	0x1EBC,	%o4
	movge	%icc,	%g3,	%l1
	fmovsa	%icc,	%f25,	%f2
	array8	%g1,	%o3,	%g4
	andncc	%g7,	%g5,	%l4
	movcs	%icc,	%l2,	%i1
	fmovdpos	%icc,	%f22,	%f26
	andcc	%i2,	%l6,	%i6
	ldub	[%l7 + 0x61],	%i5
	edge8	%o7,	%o0,	%g2
	fmul8x16al	%f8,	%f26,	%f20
	srlx	%o5,	0x08,	%i7
	fmovrdne	%o2,	%f22,	%f30
	fornot1s	%f11,	%f30,	%f25
	fmovdleu	%icc,	%f8,	%f16
	fpack32	%f18,	%f4,	%f8
	fmovsl	%xcc,	%f6,	%f19
	andcc	%i4,	%g6,	%l0
	fmul8x16au	%f2,	%f4,	%f22
	edge32	%i0,	%i3,	%l3
	fmovsge	%xcc,	%f21,	%f25
	fnegs	%f9,	%f31
	nop
	set	0x78, %g6
	stb	%o6,	[%l7 + %g6]
	ldd	[%l7 + 0x10],	%f14
	edge32	%l5,	%o4,	%g3
	edge16ln	%o1,	%l1,	%g1
	sethi	0x115C,	%o3
	xorcc	%g4,	0x04AE,	%g5
	fpmerge	%f4,	%f12,	%f6
	sethi	0x1A0C,	%l4
	movrlz	%g7,	0x3E2,	%l2
	ldub	[%l7 + 0x28],	%i2
	sdivx	%l6,	0x1A79,	%i6
	st	%f18,	[%l7 + 0x68]
	fmovdcs	%icc,	%f14,	%f27
	mulx	%i1,	0x1034,	%i5
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	ldd	[%l7 + 0x20],	%o4
	andncc	%i7,	%i4,	%o2
	movle	%icc,	%l0,	%i0
	fcmple16	%f16,	%f18,	%g6
	fand	%f8,	%f2,	%f28
	movneg	%xcc,	%i3,	%o6
	edge16ln	%l3,	%l5,	%o4
	movleu	%xcc,	%g3,	%o1
	smul	%l1,	%o3,	%g4
	ldsb	[%l7 + 0x12],	%g1
	sdiv	%g5,	0x1E83,	%g7
	fmovdge	%xcc,	%f15,	%f1
	sll	%l2,	0x13,	%l4
	udivx	%i2,	0x1A99,	%i6
	ldd	[%l7 + 0x58],	%i0
	movvc	%icc,	%i5,	%o7
	mova	%xcc,	%l6,	%g2
	movgu	%xcc,	%o0,	%o5
	array8	%i4,	%o2,	%l0
	lduw	[%l7 + 0x10],	%i0
	edge32ln	%i7,	%i3,	%g6
	pdist	%f6,	%f18,	%f30
	ldsb	[%l7 + 0x6F],	%l3
	ldsb	[%l7 + 0x5F],	%o6
	movge	%xcc,	%l5,	%g3
	srlx	%o4,	0x1F,	%o1
	fnegs	%f25,	%f3
	ldsw	[%l7 + 0x20],	%o3
	sll	%g4,	%g1,	%g5
	movre	%l1,	%l2,	%g7
	fnot1s	%f12,	%f29
	edge8n	%l4,	%i2,	%i1
	xor	%i5,	%o7,	%l6
	movcc	%icc,	%g2,	%i6
	sllx	%o0,	0x09,	%o5
	restore %i4, 0x1383, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i0,	0x1229,	%i7
	sth	%i3,	[%l7 + 0x52]
	edge8ln	%g6,	%l0,	%o6
	alignaddrl	%l3,	%l5,	%o4
	sth	%g3,	[%l7 + 0x24]
	movrlez	%o1,	%g4,	%o3
	sdivx	%g5,	0x0DFD,	%l1
	umulcc	%l2,	0x1818,	%g1
	stw	%g7,	[%l7 + 0x08]
	save %i2, 0x1B7F, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l4,	0x05EF,	%o7
	fmovsneg	%icc,	%f30,	%f23
	fxor	%f4,	%f30,	%f12
	nop
	set	0x2C, %i7
	stw	%l6,	[%l7 + %i7]
	alignaddrl	%i5,	%g2,	%o0
	addccc	%i6,	0x0D60,	%i4
	sth	%o2,	[%l7 + 0x40]
	fmovsle	%icc,	%f25,	%f26
	sdivcc	%o5,	0x12ED,	%i7
	mulx	%i0,	%g6,	%i3
	mulx	%l0,	%o6,	%l3
	movvc	%xcc,	%o4,	%g3
	movge	%xcc,	%o1,	%l5
	sdivcc	%o3,	0x1FB6,	%g5
	fzeros	%f29
	st	%f1,	[%l7 + 0x1C]
	movre	%l1,	0x226,	%g4
	ldsh	[%l7 + 0x44],	%g1
	and	%l2,	0x1A5A,	%g7
	srl	%i1,	%i2,	%l4
	edge8l	%o7,	%l6,	%i5
	xnor	%g2,	0x1510,	%o0
	sdivcc	%i4,	0x123E,	%i6
	fmovdg	%icc,	%f12,	%f21
	fmovrsne	%o5,	%f25,	%f2
	sll	%o2,	0x09,	%i0
	orn	%g6,	%i3,	%i7
	array8	%o6,	%l3,	%l0
	sdiv	%o4,	0x16DB,	%o1
	edge16n	%l5,	%g3,	%o3
	ldx	[%l7 + 0x30],	%l1
	movleu	%icc,	%g4,	%g5
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%l2
	and	%g1,	%g7,	%i1
	stb	%l4,	[%l7 + 0x50]
	edge16l	%o7,	%l6,	%i5
	movrne	%g2,	0x265,	%o0
	fcmple16	%f2,	%f14,	%i4
	addcc	%i6,	%i2,	%o5
	array32	%i0,	%o2,	%g6
	ldx	[%l7 + 0x40],	%i3
	udiv	%i7,	0x0018,	%o6
	subccc	%l3,	0x12FE,	%o4
	ldub	[%l7 + 0x27],	%l0
	movpos	%icc,	%o1,	%g3
	array8	%l5,	%o3,	%g4
	xorcc	%l1,	%l2,	%g1
	sllx	%g5,	%i1,	%g7
	movl	%xcc,	%l4,	%l6
	stb	%i5,	[%l7 + 0x15]
	mulscc	%g2,	%o7,	%i4
	udiv	%o0,	0x17B2,	%i6
	subc	%i2,	%o5,	%i0
	movvc	%xcc,	%g6,	%o2
	subcc	%i7,	%i3,	%l3
	ldd	[%l7 + 0x20],	%f0
	and	%o4,	%l0,	%o1
	movleu	%icc,	%o6,	%l5
	edge32ln	%o3,	%g3,	%l1
	fmovscs	%icc,	%f22,	%f5
	fabss	%f21,	%f18
	srlx	%g4,	0x08,	%g1
	andncc	%l2,	%g5,	%i1
	fmovsneg	%icc,	%f22,	%f20
	lduh	[%l7 + 0x5A],	%l4
	ldd	[%l7 + 0x08],	%g6
	array8	%i5,	%l6,	%o7
	fmul8x16al	%f11,	%f12,	%f16
	orncc	%g2,	%i4,	%i6
	sub	%i2,	0x0558,	%o5
	movre	%o0,	%g6,	%i0
	orcc	%o2,	%i3,	%i7
	subcc	%o4,	0x19CF,	%l0
	edge8ln	%o1,	%o6,	%l5
	umulcc	%o3,	0x19E2,	%l3
	udiv	%g3,	0x1062,	%l1
	subc	%g1,	%g4,	%l2
	array32	%i1,	%g5,	%l4
	sdivx	%i5,	0x1BE4,	%g7
	edge32l	%o7,	%g2,	%l6
	movne	%xcc,	%i6,	%i2
	add	%o5,	0x00C9,	%i4
	smul	%g6,	%i0,	%o2
	movpos	%icc,	%i3,	%o0
	movre	%o4,	%i7,	%l0
	add	%o1,	%o6,	%o3
	movrlz	%l3,	0x129,	%g3
	edge32ln	%l5,	%g1,	%g4
	move	%icc,	%l2,	%i1
	fone	%f28
	addccc	%g5,	%l1,	%i5
	alignaddrl	%l4,	%g7,	%o7
	mova	%xcc,	%l6,	%i6
	movgu	%icc,	%i2,	%o5
	nop
	set	0x5C, %o0
	stw	%i4,	[%l7 + %o0]
	fands	%f28,	%f22,	%f27
	fxor	%f24,	%f8,	%f2
	movrne	%g2,	0x11B,	%g6
	sethi	0x1F7D,	%o2
	srlx	%i3,	%i0,	%o0
	fmovrse	%o4,	%f10,	%f29
	ldsh	[%l7 + 0x0E],	%i7
	nop
	set	0x12, %l0
	lduh	[%l7 + %l0],	%l0
	movvc	%xcc,	%o6,	%o3
	fpack16	%f4,	%f0
	movrne	%l3,	%g3,	%l5
	fzero	%f8
	udivcc	%o1,	0x0BA3,	%g1
	udivx	%l2,	0x10FB,	%g4
	movle	%icc,	%i1,	%l1
	orn	%i5,	0x1E05,	%l4
	andcc	%g7,	%o7,	%l6
	umul	%i6,	%i2,	%o5
	movle	%icc,	%i4,	%g5
	edge32ln	%g6,	%g2,	%i3
	srlx	%o2,	0x17,	%i0
	ldsb	[%l7 + 0x37],	%o0
	movrgez	%i7,	%l0,	%o6
	smul	%o4,	%l3,	%o3
	movrgez	%l5,	0x205,	%g3
	sdivx	%o1,	0x1C20,	%l2
	fpadd32	%f20,	%f14,	%f22
	sra	%g4,	0x0A,	%i1
	alignaddr	%l1,	%i5,	%l4
	fcmpgt32	%f24,	%f8,	%g1
	movgu	%icc,	%o7,	%g7
	and	%l6,	%i6,	%i2
	sra	%o5,	0x1A,	%i4
	fnor	%f12,	%f12,	%f0
	edge8ln	%g5,	%g6,	%i3
	subcc	%o2,	0x186B,	%i0
	fmovdcs	%icc,	%f24,	%f13
	udiv	%o0,	0x17A3,	%i7
	fpack16	%f18,	%f31
	addc	%g2,	%o6,	%o4
	alignaddrl	%l3,	%l0,	%l5
	sllx	%g3,	0x01,	%o3
	edge32n	%o1,	%l2,	%i1
	fmul8x16al	%f13,	%f8,	%f20
	movle	%xcc,	%g4,	%i5
	movrne	%l1,	%l4,	%g1
	mulx	%g7,	%o7,	%l6
	subccc	%i6,	%i2,	%o5
	edge32	%g5,	%g6,	%i4
	alignaddr	%i3,	%o2,	%i0
	alignaddrl	%o0,	%i7,	%o6
	fcmpne16	%f22,	%f2,	%g2
	sethi	0x1A57,	%o4
	edge32l	%l3,	%l5,	%g3
	movg	%icc,	%o3,	%l0
	nop
	set	0x60, %l2
	stx	%l2,	[%l7 + %l2]
	movg	%xcc,	%i1,	%g4
	sra	%o1,	0x00,	%l1
	movleu	%xcc,	%l4,	%i5
	bshuffle	%f30,	%f6,	%f16
	fzeros	%f9
	smulcc	%g1,	0x1092,	%g7
	mova	%icc,	%l6,	%o7
	sdivcc	%i6,	0x0527,	%o5
	mova	%xcc,	%g5,	%g6
	edge32l	%i2,	%i3,	%i4
	nop
	set	0x45, %o1
	ldub	[%l7 + %o1],	%i0
	std	%f20,	[%l7 + 0x20]
	movrne	%o0,	%i7,	%o6
	srax	%o2,	%o4,	%l3
	nop
	set	0x22, %l5
	sth	%g2,	[%l7 + %l5]
	mova	%icc,	%g3,	%l5
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	lduh	[%l7 + 0x76],	%g4
	sub	%o1,	%o3,	%l1
	siam	0x5
	fnegs	%f6,	%f4
	fmovrdgz	%i5,	%f6,	%f28
	movrgez	%g1,	0x1F1,	%l4
	edge32ln	%g7,	%l6,	%o7
	xorcc	%o5,	%g5,	%i6
	mulx	%i2,	0x0D43,	%g6
	movrlz	%i4,	%i0,	%o0
	sra	%i7,	0x1C,	%i3
	fpadd16s	%f4,	%f29,	%f23
	edge32l	%o6,	%o4,	%o2
	movneg	%xcc,	%l3,	%g3
	sethi	0x0199,	%g2
	fmovdcc	%icc,	%f30,	%f3
	movl	%xcc,	%l0,	%l2
	fpadd16s	%f20,	%f6,	%f4
	movrne	%l5,	%i1,	%g4
	st	%f18,	[%l7 + 0x40]
	orncc	%o1,	0x1A7C,	%l1
	mulscc	%i5,	0x1B57,	%o3
	fnor	%f20,	%f12,	%f8
	srax	%g1,	0x08,	%l4
	orncc	%g7,	%l6,	%o5
	edge32	%g5,	%i6,	%o7
	udivcc	%g6,	0x1F7D,	%i4
	edge16l	%i0,	%i2,	%i7
	movrne	%o0,	0x072,	%o6
	ldd	[%l7 + 0x50],	%f20
	edge32ln	%i3,	%o4,	%o2
	smul	%l3,	%g2,	%l0
	ldx	[%l7 + 0x50],	%g3
	fzeros	%f6
	sdivcc	%l5,	0x00E4,	%i1
	andn	%l2,	%o1,	%l1
	array8	%i5,	%o3,	%g4
	and	%l4,	0x033A,	%g7
	edge8l	%l6,	%o5,	%g1
	ldd	[%l7 + 0x08],	%f8
	array32	%i6,	%o7,	%g6
	fmovsleu	%icc,	%f19,	%f31
	movpos	%xcc,	%i4,	%i0
	sdivx	%g5,	0x158A,	%i2
	orncc	%o0,	%i7,	%i3
	sll	%o4,	0x03,	%o6
	sll	%o2,	%g2,	%l3
	andcc	%g3,	0x17B9,	%l0
	edge32l	%i1,	%l2,	%o1
	fmovrdlz	%l5,	%f2,	%f14
	array16	%i5,	%o3,	%g4
	fmul8ulx16	%f6,	%f24,	%f14
	umulcc	%l4,	%l1,	%l6
	movl	%xcc,	%g7,	%g1
	edge16	%o5,	%o7,	%g6
	sub	%i4,	0x01A8,	%i0
	movvs	%xcc,	%i6,	%g5
	stw	%o0,	[%l7 + 0x48]
	movpos	%icc,	%i2,	%i7
	fcmpne32	%f16,	%f16,	%i3
	movpos	%xcc,	%o6,	%o4
	mulscc	%g2,	0x14B8,	%l3
	or	%o2,	%g3,	%i1
	fabss	%f17,	%f29
	umulcc	%l0,	0x1486,	%l2
	sub	%o1,	0x1A42,	%l5
	movrlez	%o3,	0x30C,	%g4
	fnor	%f0,	%f6,	%f6
	fmovrslz	%l4,	%f7,	%f30
	srl	%l1,	%l6,	%g7
	orn	%i5,	%g1,	%o7
	st	%f12,	[%l7 + 0x5C]
	sdivcc	%o5,	0x0115,	%g6
	movvc	%icc,	%i0,	%i4
	smulcc	%g5,	0x0831,	%o0
	movg	%icc,	%i2,	%i6
	addcc	%i3,	%i7,	%o4
	fmuld8ulx16	%f4,	%f31,	%f26
	subc	%o6,	0x008E,	%g2
	fmovsvs	%xcc,	%f8,	%f5
	fmovsvs	%icc,	%f5,	%f12
	fmovscc	%icc,	%f15,	%f27
	fmovrdlz	%o2,	%f8,	%f0
	fmovrslez	%g3,	%f4,	%f18
	ldsw	[%l7 + 0x6C],	%l3
	sth	%l0,	[%l7 + 0x3E]
	stb	%l2,	[%l7 + 0x74]
	ldub	[%l7 + 0x69],	%o1
	sllx	%l5,	%i1,	%o3
	mova	%icc,	%l4,	%l1
	fmovrde	%l6,	%f14,	%f4
	stx	%g4,	[%l7 + 0x60]
	fpack16	%f8,	%f5
	srl	%i5,	0x04,	%g7
	stb	%o7,	[%l7 + 0x29]
	stx	%g1,	[%l7 + 0x30]
	nop
	set	0x30, %l3
	ldsw	[%l7 + %l3],	%g6
	stb	%o5,	[%l7 + 0x6B]
	stx	%i0,	[%l7 + 0x60]
	movl	%icc,	%g5,	%i4
	std	%f0,	[%l7 + 0x60]
	stw	%i2,	[%l7 + 0x6C]
	sdivx	%o0,	0x0CC0,	%i3
	and	%i7,	0x108B,	%o4
	movl	%xcc,	%o6,	%i6
	fmovsle	%xcc,	%f17,	%f0
	fmovscs	%icc,	%f29,	%f21
	stx	%g2,	[%l7 + 0x60]
	and	%g3,	0x044B,	%l3
	fabss	%f4,	%f21
	fmovrse	%o2,	%f13,	%f2
	edge16ln	%l2,	%o1,	%l5
	fabss	%f30,	%f24
	edge8n	%l0,	%o3,	%l4
	fnors	%f12,	%f25,	%f8
	addccc	%i1,	%l1,	%l6
	fmul8x16al	%f3,	%f29,	%f16
	andncc	%g4,	%i5,	%g7
	edge8n	%o7,	%g6,	%o5
	fand	%f12,	%f24,	%f12
	movcs	%icc,	%i0,	%g1
	udivx	%g5,	0x0EDB,	%i4
	fmovsl	%icc,	%f24,	%f3
	edge8ln	%o0,	%i3,	%i2
	fmovrse	%o4,	%f0,	%f28
	mova	%xcc,	%o6,	%i6
	fcmpd	%fcc3,	%f6,	%f22
	mulscc	%g2,	0x0002,	%g3
	fmovs	%f28,	%f31
	fmovdneg	%icc,	%f2,	%f20
	edge8	%l3,	%i7,	%l2
	edge16n	%o1,	%o2,	%l5
	ldx	[%l7 + 0x60],	%o3
	move	%icc,	%l4,	%l0
	subc	%l1,	%l6,	%i1
	movcc	%icc,	%g4,	%g7
	ldd	[%l7 + 0x30],	%i4
	move	%icc,	%g6,	%o7
	fxor	%f0,	%f28,	%f24
	fmovrsne	%i0,	%f5,	%f31
	movn	%icc,	%o5,	%g5
	fmuld8sux16	%f18,	%f17,	%f30
	fmovrdgz	%i4,	%f18,	%f16
	st	%f31,	[%l7 + 0x34]
	fmovdvs	%icc,	%f20,	%f1
	or	%o0,	%g1,	%i3
	movle	%xcc,	%i2,	%o4
	srl	%o6,	0x0A,	%i6
	addc	%g3,	%g2,	%i7
	lduw	[%l7 + 0x20],	%l3
	umulcc	%o1,	0x060B,	%l2
	udiv	%l5,	0x0777,	%o3
	fmovdl	%xcc,	%f15,	%f19
	edge8l	%l4,	%o2,	%l1
	edge16	%l6,	%l0,	%i1
	edge32l	%g7,	%g4,	%g6
	stx	%i5,	[%l7 + 0x38]
	udivx	%o7,	0x126A,	%o5
	mulscc	%g5,	%i0,	%o0
	movvc	%icc,	%i4,	%i3
	fnegd	%f4,	%f12
	ldub	[%l7 + 0x09],	%g1
	fcmpgt32	%f6,	%f16,	%o4
	ldub	[%l7 + 0x29],	%i2
	udivx	%i6,	0x0250,	%g3
	movrgez	%g2,	%o6,	%l3
	mulscc	%i7,	%o1,	%l2
	fcmple16	%f12,	%f10,	%l5
	ldsh	[%l7 + 0x64],	%o3
	array16	%o2,	%l1,	%l6
	fabsd	%f26,	%f14
	stx	%l4,	[%l7 + 0x78]
	movcc	%xcc,	%l0,	%g7
	movrlez	%i1,	%g4,	%g6
	fsrc2	%f12,	%f22
	edge8n	%o7,	%o5,	%i5
	fmul8x16al	%f16,	%f11,	%f14
	fzeros	%f11
	fmovdcc	%icc,	%f4,	%f21
	xnor	%g5,	%i0,	%o0
	ldsw	[%l7 + 0x60],	%i4
	lduh	[%l7 + 0x3C],	%g1
	array16	%i3,	%i2,	%i6
	fnegd	%f22,	%f14
	fand	%f14,	%f24,	%f6
	sdivx	%g3,	0x18FA,	%g2
	andncc	%o4,	%l3,	%i7
	fcmpne16	%f28,	%f10,	%o6
	or	%l2,	%l5,	%o3
	addcc	%o1,	0x120E,	%o2
	fnot1s	%f9,	%f7
	edge16	%l6,	%l1,	%l4
	andcc	%g7,	%l0,	%g4
	ldd	[%l7 + 0x18],	%f18
	movrgz	%g6,	%o7,	%o5
	umulcc	%i1,	%i5,	%g5
	fpsub16s	%f7,	%f28,	%f4
	and	%o0,	%i0,	%g1
	fmovrsgez	%i3,	%f21,	%f11
	ldd	[%l7 + 0x10],	%i2
	sdivx	%i6,	0x072A,	%g3
	nop
	set	0x10, %l1
	stx	%i4,	[%l7 + %l1]
	ld	[%l7 + 0x44],	%f27
	movleu	%xcc,	%o4,	%g2
	faligndata	%f20,	%f30,	%f16
	udivcc	%l3,	0x1666,	%i7
	subcc	%l2,	0x1CAA,	%o6
	fornot2s	%f11,	%f4,	%f29
	std	%f28,	[%l7 + 0x20]
	stb	%l5,	[%l7 + 0x19]
	lduw	[%l7 + 0x54],	%o3
	umulcc	%o1,	%o2,	%l1
	ldsb	[%l7 + 0x6E],	%l4
	srax	%l6,	%g7,	%l0
	sra	%g4,	%o7,	%g6
	orn	%o5,	0x1FBE,	%i5
	add	%i1,	%o0,	%i0
	fmovsvs	%xcc,	%f20,	%f25
	andncc	%g5,	%g1,	%i3
	edge8ln	%i2,	%g3,	%i4
	edge16	%i6,	%g2,	%l3
	smulcc	%i7,	0x0022,	%l2
	movvc	%icc,	%o6,	%o4
	or	%o3,	%o1,	%o2
	ld	[%l7 + 0x0C],	%f24
	movgu	%xcc,	%l5,	%l4
	movrgez	%l1,	0x028,	%l6
	fmovdvs	%xcc,	%f18,	%f30
	andcc	%l0,	%g4,	%g7
	fandnot1s	%f2,	%f13,	%f9
	srl	%o7,	%g6,	%o5
	add	%i5,	0x1B8E,	%i1
	and	%o0,	%g5,	%i0
	movcs	%xcc,	%g1,	%i3
	fmovdleu	%xcc,	%f2,	%f22
	edge32l	%g3,	%i2,	%i6
	movrlz	%g2,	0x38D,	%i4
	sethi	0x0FCB,	%i7
	ldsb	[%l7 + 0x17],	%l3
	movl	%icc,	%l2,	%o4
	movrgez	%o3,	%o1,	%o2
	movl	%icc,	%l5,	%o6
	ldd	[%l7 + 0x60],	%l0
	udivcc	%l4,	0x1AC5,	%l0
	array16	%l6,	%g4,	%g7
	subccc	%g6,	%o5,	%i5
	udivx	%i1,	0x1D8A,	%o7
	addc	%g5,	0x1EB0,	%i0
	sdiv	%o0,	0x1448,	%i3
	addc	%g3,	%g1,	%i2
	sir	0x0361
	smul	%g2,	%i6,	%i4
	fandnot2	%f16,	%f6,	%f10
	umul	%i7,	%l2,	%o4
	edge32	%l3,	%o3,	%o1
	udivcc	%l5,	0x109B,	%o6
	sethi	0x0EFE,	%l1
	fmovsne	%xcc,	%f21,	%f16
	fmovdl	%icc,	%f14,	%f3
	srlx	%o2,	%l4,	%l0
	xorcc	%l6,	0x0D91,	%g7
	srax	%g4,	0x1B,	%o5
	movrne	%i5,	%g6,	%i1
	edge16ln	%o7,	%i0,	%g5
	alignaddr	%o0,	%g3,	%g1
	movre	%i2,	%i3,	%i6
	alignaddrl	%g2,	%i4,	%l2
	fornot1	%f20,	%f18,	%f0
	fnot1	%f30,	%f22
	fnand	%f14,	%f22,	%f26
	udivcc	%i7,	0x079B,	%l3
	fpsub32	%f6,	%f4,	%f30
	edge8n	%o4,	%o1,	%o3
	mulx	%o6,	%l1,	%l5
	fmovdvs	%icc,	%f16,	%f22
	sdivx	%l4,	0x1B58,	%l0
	orn	%o2,	0x0D36,	%g7
	edge8ln	%l6,	%o5,	%g4
	edge8l	%i5,	%i1,	%o7
	sethi	0x05A6,	%i0
	sdivcc	%g6,	0x103F,	%g5
	srlx	%o0,	0x01,	%g3
	srl	%i2,	%i3,	%i6
	ldx	[%l7 + 0x20],	%g1
	subcc	%g2,	0x1ADC,	%i4
	popc	0x0D7E,	%i7
	fmovrsne	%l2,	%f16,	%f7
	xorcc	%l3,	%o4,	%o3
	udivcc	%o1,	0x0281,	%o6
	fnot2	%f4,	%f4
	umulcc	%l5,	%l1,	%l4
	ldsb	[%l7 + 0x66],	%l0
	move	%xcc,	%o2,	%l6
	edge16n	%g7,	%g4,	%o5
	fmovsg	%xcc,	%f17,	%f22
	sdiv	%i5,	0x1F7A,	%o7
	lduh	[%l7 + 0x44],	%i1
	movrgz	%g6,	0x203,	%i0
	movpos	%xcc,	%g5,	%o0
	udivcc	%g3,	0x16F3,	%i2
	edge8	%i6,	%g1,	%i3
	fmovsg	%icc,	%f28,	%f31
	array16	%g2,	%i7,	%l2
	fmuld8ulx16	%f24,	%f1,	%f6
	st	%f14,	[%l7 + 0x50]
	movl	%xcc,	%l3,	%o4
	addc	%o3,	%o1,	%i4
	xnor	%o6,	0x07BA,	%l5
	andncc	%l1,	%l0,	%o2
	movrlz	%l4,	%g7,	%g4
	sir	0x0B45
	mulx	%l6,	0x01CB,	%i5
	ldd	[%l7 + 0x60],	%f26
	xorcc	%o7,	0x02E5,	%i1
	sll	%o5,	%i0,	%g6
	alignaddrl	%o0,	%g3,	%g5
	edge16ln	%i6,	%i2,	%g1
	fpackfix	%f18,	%f9
	fones	%f25
	movcc	%icc,	%i3,	%i7
	alignaddrl	%l2,	%l3,	%o4
	fcmps	%fcc1,	%f10,	%f11
	ldx	[%l7 + 0x08],	%g2
	umulcc	%o3,	%i4,	%o6
	movg	%xcc,	%o1,	%l1
	fzeros	%f22
	andncc	%l0,	%l5,	%l4
	udiv	%o2,	0x1B3B,	%g4
	umulcc	%g7,	0x15C8,	%i5
	addc	%o7,	%l6,	%o5
	ldsh	[%l7 + 0x32],	%i0
	ldd	[%l7 + 0x08],	%g6
	movgu	%icc,	%o0,	%g3
	fxors	%f8,	%f27,	%f8
	movg	%xcc,	%g5,	%i1
	andn	%i2,	0x0B5F,	%i6
	subccc	%g1,	%i3,	%i7
	add	%l3,	%o4,	%l2
	stx	%o3,	[%l7 + 0x68]
	xor	%i4,	0x0741,	%g2
	fpsub32	%f14,	%f4,	%f28
	fmovdcc	%icc,	%f22,	%f3
	smul	%o1,	%o6,	%l1
	edge8l	%l0,	%l4,	%l5
	xorcc	%o2,	%g4,	%g7
	srax	%i5,	%l6,	%o7
	orncc	%i0,	0x1906,	%g6
	movcc	%xcc,	%o5,	%o0
	fpadd32	%f2,	%f18,	%f2
	st	%f28,	[%l7 + 0x5C]
	movrlez	%g3,	%g5,	%i1
	edge8l	%i6,	%i2,	%g1
	edge16n	%i3,	%i7,	%l3
	umulcc	%l2,	0x0833,	%o4
	fmovrsne	%i4,	%f15,	%f17
	movre	%g2,	0x32E,	%o3
	addccc	%o6,	%o1,	%l0
	stb	%l1,	[%l7 + 0x0A]
	save %l4, %o2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%g7,	%l5,	%i5
	fandnot1s	%f8,	%f27,	%f29
	sth	%o7,	[%l7 + 0x70]
	sdiv	%l6,	0x110E,	%i0
	st	%f15,	[%l7 + 0x54]
	movne	%icc,	%g6,	%o5
	movgu	%xcc,	%o0,	%g3
	stb	%i1,	[%l7 + 0x30]
	movne	%xcc,	%g5,	%i6
	movrne	%g1,	0x303,	%i2
	movgu	%xcc,	%i3,	%i7
	fsrc1	%f4,	%f8
	fmovda	%icc,	%f14,	%f1
	udiv	%l3,	0x1A43,	%o4
	sdivx	%i4,	0x1D9A,	%g2
	umulcc	%o3,	%l2,	%o6
	sdivcc	%l0,	0x1679,	%l1
	movrlez	%o1,	0x149,	%l4
	smulcc	%g4,	%g7,	%l5
	movvc	%icc,	%o2,	%i5
	restore %o7, 0x13B7, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g6,	0x0BD,	%o5
	stx	%i0,	[%l7 + 0x78]
	stx	%g3,	[%l7 + 0x38]
	edge32l	%i1,	%o0,	%g5
	ldsh	[%l7 + 0x6A],	%g1
	subccc	%i6,	0x03F6,	%i2
	orn	%i3,	%i7,	%o4
	movvc	%xcc,	%i4,	%g2
	fmul8ulx16	%f24,	%f8,	%f6
	edge8n	%o3,	%l2,	%l3
	xorcc	%l0,	%o6,	%l1
	save %l4, 0x04FD, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f17,	%f0
	movgu	%xcc,	%g7,	%o1
	andncc	%o2,	%l5,	%i5
	movgu	%icc,	%o7,	%g6
	movrlez	%l6,	0x294,	%i0
	fmuld8ulx16	%f2,	%f7,	%f30
	movl	%icc,	%o5,	%i1
	movpos	%icc,	%o0,	%g3
	movge	%icc,	%g5,	%i6
	fcmpgt16	%f4,	%f30,	%i2
	ldsw	[%l7 + 0x50],	%g1
	srl	%i7,	%o4,	%i4
	movcs	%xcc,	%g2,	%o3
	stx	%l2,	[%l7 + 0x20]
	std	%f0,	[%l7 + 0x58]
	movneg	%icc,	%l3,	%i3
	movneg	%icc,	%o6,	%l0
	edge8ln	%l1,	%l4,	%g4
	sra	%o1,	0x0A,	%g7
	edge32	%l5,	%o2,	%i5
	fnot1s	%f11,	%f19
	fcmpes	%fcc3,	%f29,	%f14
	xnorcc	%o7,	0x16E4,	%g6
	smul	%i0,	%l6,	%o5
	sir	0x1337
	edge16n	%o0,	%i1,	%g5
	ldsw	[%l7 + 0x50],	%g3
	edge16ln	%i2,	%g1,	%i6
	addcc	%o4,	%i4,	%i7
	array32	%o3,	%l2,	%l3
	fornot1	%f22,	%f14,	%f6
	orncc	%g2,	%i3,	%l0
	fandnot1	%f8,	%f8,	%f16
	movg	%xcc,	%o6,	%l4
	movgu	%icc,	%l1,	%g4
	fnands	%f3,	%f15,	%f27
	fpackfix	%f28,	%f30
	sllx	%g7,	0x15,	%o1
	edge8l	%o2,	%i5,	%l5
	fmovrdgz	%g6,	%f30,	%f14
	edge32l	%o7,	%l6,	%o5
	fmovrslez	%o0,	%f13,	%f20
	srlx	%i0,	0x19,	%i1
	sra	%g3,	%g5,	%g1
	fpack16	%f22,	%f15
	andn	%i2,	%i6,	%i4
	mova	%xcc,	%i7,	%o3
	fornot1	%f22,	%f26,	%f4
	ldd	[%l7 + 0x40],	%l2
	movrne	%l3,	0x27B,	%g2
	ldsh	[%l7 + 0x3E],	%o4
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	fpsub32s	%f23,	%f23,	%f13
	addcc	%l4,	%l1,	%g4
	fmovdcs	%xcc,	%f28,	%f15
	popc	0x0A4A,	%g7
	edge32	%o6,	%o1,	%o2
	movcs	%icc,	%i5,	%g6
	or	%l5,	%l6,	%o5
	fcmple32	%f18,	%f6,	%o0
	fnegs	%f29,	%f16
	movl	%xcc,	%i0,	%o7
	fmovdvs	%xcc,	%f6,	%f8
	movge	%icc,	%g3,	%g5
	or	%i1,	0x1AFC,	%i2
	nop
	set	0x20, %g1
	ldd	[%l7 + %g1],	%i6
	edge32l	%i4,	%g1,	%i7
	stb	%l2,	[%l7 + 0x1C]
	fnot1	%f16,	%f26
	mova	%xcc,	%l3,	%o3
	edge8l	%o4,	%g2,	%i3
	fmovdn	%icc,	%f2,	%f1
	array32	%l0,	%l1,	%g4
	movrne	%g7,	%o6,	%o1
	addc	%o2,	0x1D00,	%i5
	lduh	[%l7 + 0x50],	%l4
	fmovda	%icc,	%f29,	%f13
	movvs	%xcc,	%l5,	%g6
	fmul8x16au	%f0,	%f2,	%f24
	popc	0x1259,	%o5
	fzeros	%f1
	edge8ln	%o0,	%i0,	%o7
	andcc	%g3,	0x0FB1,	%l6
	srax	%i1,	0x17,	%i2
	sir	0x1EC4
	srax	%g5,	0x1F,	%i4
	movvs	%icc,	%i6,	%g1
	movpos	%icc,	%l2,	%l3
	umulcc	%o3,	0x124F,	%o4
	alignaddrl	%i7,	%g2,	%i3
	stb	%l1,	[%l7 + 0x73]
	smulcc	%g4,	%l0,	%g7
	sra	%o6,	%o1,	%i5
	udivx	%o2,	0x0D02,	%l4
	movgu	%icc,	%g6,	%l5
	fcmps	%fcc2,	%f2,	%f19
	ldsb	[%l7 + 0x10],	%o0
	movvs	%icc,	%o5,	%o7
	andncc	%i0,	%l6,	%i1
	fnors	%f18,	%f0,	%f9
	movrgz	%i2,	%g3,	%i4
	fors	%f2,	%f19,	%f4
	fmovdle	%icc,	%f17,	%f24
	srax	%i6,	0x0C,	%g1
	fnegs	%f22,	%f28
	ldsw	[%l7 + 0x7C],	%l2
	fcmpne16	%f20,	%f28,	%l3
	smul	%o3,	0x1958,	%o4
	mulx	%g5,	%i7,	%g2
	ldx	[%l7 + 0x20],	%i3
	siam	0x7
	edge32ln	%g4,	%l1,	%l0
	ldsw	[%l7 + 0x78],	%o6
	fpadd32	%f2,	%f10,	%f4
	fmovdle	%icc,	%f1,	%f13
	ldsb	[%l7 + 0x53],	%o1
	srlx	%g7,	%i5,	%o2
	fnors	%f21,	%f23,	%f21
	ldx	[%l7 + 0x18],	%g6
	sir	0x1476
	fzero	%f12
	ldd	[%l7 + 0x30],	%l4
	fcmpgt32	%f2,	%f26,	%l5
	andncc	%o5,	%o7,	%i0
	fcmps	%fcc0,	%f4,	%f18
	fmovsvc	%icc,	%f14,	%f18
	ldsh	[%l7 + 0x46],	%o0
	movl	%icc,	%i1,	%l6
	sub	%g3,	%i2,	%i6
	andcc	%i4,	0x1546,	%g1
	movvs	%xcc,	%l3,	%o3
	edge16l	%l2,	%o4,	%g5
	umul	%i7,	%g2,	%g4
	array8	%l1,	%l0,	%i3
	smul	%o1,	%g7,	%i5
	fmul8x16	%f29,	%f22,	%f6
	sra	%o2,	0x11,	%g6
	ldd	[%l7 + 0x78],	%f22
	movl	%xcc,	%l4,	%l5
	fpack16	%f26,	%f10
	fmovrde	%o6,	%f0,	%f28
	fmovrdgz	%o7,	%f24,	%f4
	movl	%xcc,	%i0,	%o5
	edge32ln	%i1,	%l6,	%g3
	srlx	%o0,	%i2,	%i4
	sra	%i6,	%g1,	%l3
	save %o3, %l2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g5,	0x104F,	%g2
	addccc	%g4,	%i7,	%l1
	movre	%l0,	0x0F9,	%i3
	nop
	set	0x70, %i4
	ldsw	[%l7 + %i4],	%g7
	srl	%i5,	0x12,	%o1
	fmovde	%xcc,	%f10,	%f3
	sth	%g6,	[%l7 + 0x14]
	array16	%o2,	%l5,	%l4
	fandnot1	%f26,	%f26,	%f24
	sdivcc	%o7,	0x13A6,	%o6
	ldsb	[%l7 + 0x5E],	%i0
	movl	%icc,	%o5,	%i1
	fpadd32s	%f4,	%f12,	%f4
	movvs	%icc,	%l6,	%o0
	ld	[%l7 + 0x78],	%f0
	edge32l	%i2,	%g3,	%i6
	fornot1	%f6,	%f22,	%f6
	save %g1, %l3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o3,	0x1E1D,	%o4
	movne	%icc,	%g5,	%l2
	movre	%g2,	0x067,	%g4
	array16	%i7,	%l1,	%l0
	ldsh	[%l7 + 0x68],	%g7
	movg	%icc,	%i5,	%i3
	fabsd	%f18,	%f16
	movne	%xcc,	%o1,	%o2
	fmovrse	%g6,	%f25,	%f2
	movrgez	%l5,	0x35B,	%o7
	mulx	%l4,	%i0,	%o5
	array32	%i1,	%l6,	%o0
	movre	%o6,	0x1B5,	%g3
	sllx	%i6,	%g1,	%l3
	stw	%i4,	[%l7 + 0x08]
	fmovd	%f22,	%f30
	fnegs	%f1,	%f0
	edge16	%o3,	%i2,	%o4
	srax	%g5,	0x06,	%g2
	xorcc	%g4,	0x038A,	%l2
	sth	%l1,	[%l7 + 0x38]
	smul	%l0,	%i7,	%g7
	restore %i5, %i3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o2,	0x17D7,	%l5
	srax	%g6,	%o7,	%l4
	xor	%o5,	%i1,	%l6
	movne	%icc,	%o0,	%o6
	fcmps	%fcc3,	%f12,	%f23
	srlx	%i0,	0x1A,	%g3
	ldub	[%l7 + 0x52],	%i6
	srl	%g1,	0x04,	%i4
	sdivcc	%l3,	0x13A5,	%o3
	fandnot2	%f30,	%f2,	%f26
	srax	%o4,	0x17,	%g5
	fsrc1	%f28,	%f8
	movrgz	%g2,	0x1DE,	%g4
	fmuld8ulx16	%f5,	%f5,	%f10
	edge16ln	%i2,	%l1,	%l0
	orncc	%i7,	%l2,	%i5
	fcmpes	%fcc0,	%f5,	%f6
	ldsh	[%l7 + 0x4A],	%i3
	movrlz	%g7,	0x023,	%o1
	smulcc	%o2,	0x1101,	%g6
	orn	%l5,	0x0B7B,	%l4
	sub	%o5,	%i1,	%l6
	array8	%o7,	%o6,	%o0
	movneg	%xcc,	%g3,	%i6
	fcmps	%fcc1,	%f2,	%f15
	fmovdcs	%xcc,	%f29,	%f8
	and	%g1,	%i4,	%l3
	faligndata	%f12,	%f2,	%f2
	edge16	%i0,	%o3,	%g5
	smul	%o4,	%g2,	%g4
	fsrc1	%f26,	%f20
	movvs	%xcc,	%i2,	%l1
	movcc	%xcc,	%l0,	%l2
	edge16ln	%i5,	%i3,	%g7
	ldd	[%l7 + 0x58],	%i6
	movrgez	%o2,	%g6,	%o1
	edge8ln	%l5,	%o5,	%l4
	smul	%l6,	0x0858,	%o7
	smulcc	%i1,	%o0,	%o6
	fmovdcs	%icc,	%f17,	%f11
	addccc	%g3,	%i6,	%g1
	fmovdneg	%icc,	%f11,	%f0
	sllx	%l3,	%i0,	%o3
	movge	%icc,	%i4,	%o4
	movvc	%icc,	%g5,	%g4
	xor	%g2,	%l1,	%l0
	edge32l	%i2,	%i5,	%l2
	mulscc	%g7,	%i3,	%o2
	save %i7, 0x1A2F, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f15,	%f19
	sub	%o1,	0x159B,	%l5
	srax	%o5,	%l6,	%l4
	udivcc	%i1,	0x0ACA,	%o0
	alignaddr	%o6,	%o7,	%g3
	xor	%i6,	%l3,	%g1
	sethi	0x085B,	%i0
	edge8	%i4,	%o3,	%o4
	mova	%xcc,	%g4,	%g5
	movre	%g2,	%l0,	%l1
	array16	%i2,	%i5,	%l2
	andn	%i3,	0x1BD2,	%o2
	ldsw	[%l7 + 0x60],	%i7
	movl	%xcc,	%g6,	%o1
	srlx	%g7,	%l5,	%l6
	array8	%o5,	%i1,	%l4
	andn	%o0,	0x1F60,	%o6
	alignaddrl	%g3,	%i6,	%o7
	movgu	%xcc,	%g1,	%i0
	addc	%i4,	0x12B2,	%l3
	lduh	[%l7 + 0x28],	%o3
	edge8	%o4,	%g5,	%g4
	orncc	%l0,	%g2,	%i2
	sth	%i5,	[%l7 + 0x4A]
	ldx	[%l7 + 0x58],	%l2
	sllx	%l1,	%i3,	%i7
	lduw	[%l7 + 0x08],	%o2
	sdiv	%o1,	0x04CF,	%g7
	stb	%l5,	[%l7 + 0x57]
	save %g6, 0x1A58, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o5,	%l4
	fnegd	%f8,	%f26
	sub	%o0,	0x0E1F,	%o6
	movpos	%icc,	%g3,	%i6
	umul	%o7,	%i1,	%i0
	array32	%g1,	%i4,	%l3
	subcc	%o4,	0x16B6,	%g5
	fcmple16	%f28,	%f16,	%o3
	umulcc	%g4,	%l0,	%i2
	ldx	[%l7 + 0x30],	%i5
	edge8ln	%g2,	%l1,	%l2
	edge16n	%i3,	%o2,	%i7
	addcc	%g7,	0x07DB,	%l5
	movneg	%xcc,	%g6,	%l6
	stx	%o1,	[%l7 + 0x08]
	orcc	%l4,	0x1A39,	%o5
	ldd	[%l7 + 0x50],	%o0
	movcc	%xcc,	%o6,	%i6
	mova	%icc,	%o7,	%g3
	edge16ln	%i0,	%i1,	%g1
	mulx	%l3,	%o4,	%i4
	fmovdn	%xcc,	%f11,	%f20
	sir	0x1CD7
	movre	%g5,	0x3BE,	%g4
	or	%o3,	%l0,	%i2
	array32	%i5,	%g2,	%l2
	fsrc2	%f22,	%f24
	movpos	%xcc,	%i3,	%l1
	andcc	%i7,	%g7,	%o2
	ldub	[%l7 + 0x18],	%g6
	sethi	0x17B3,	%l5
	pdist	%f24,	%f10,	%f26
	ldsh	[%l7 + 0x22],	%l6
	for	%f8,	%f12,	%f2
	mulx	%l4,	%o1,	%o5
	fmovdg	%xcc,	%f1,	%f8
	fmovdge	%xcc,	%f22,	%f13
	edge16l	%o6,	%o0,	%i6
	or	%g3,	%o7,	%i1
	udivx	%i0,	0x182E,	%l3
	andcc	%o4,	%g1,	%i4
	movcc	%icc,	%g5,	%g4
	ld	[%l7 + 0x3C],	%f9
	fandnot2s	%f7,	%f27,	%f26
	popc	%l0,	%o3
	stb	%i2,	[%l7 + 0x64]
	array16	%g2,	%i5,	%i3
	andcc	%l1,	0x0FAE,	%i7
	fmovrdne	%g7,	%f0,	%f4
	lduh	[%l7 + 0x2E],	%l2
	movge	%icc,	%o2,	%g6
	ldsb	[%l7 + 0x70],	%l6
	smulcc	%l4,	0x0DF2,	%l5
	alignaddr	%o5,	%o6,	%o1
	movne	%xcc,	%i6,	%o0
	fpadd32	%f26,	%f12,	%f20
	movvs	%icc,	%o7,	%i1
	andn	%i0,	%l3,	%g3
	udivx	%o4,	0x1276,	%i4
	movrgez	%g1,	%g5,	%g4
	subcc	%l0,	%i2,	%g2
	movrgez	%i5,	0x14A,	%i3
	sdiv	%l1,	0x0878,	%o3
	edge32ln	%i7,	%g7,	%o2
	fcmpeq16	%f4,	%f4,	%g6
	movn	%xcc,	%l2,	%l6
	sub	%l4,	0x1AA6,	%l5
	srl	%o6,	%o5,	%o1
	sir	0x0BA7
	edge16ln	%o0,	%i6,	%i1
	srl	%i0,	%o7,	%l3
	ldx	[%l7 + 0x20],	%o4
	movge	%icc,	%g3,	%g1
	ldub	[%l7 + 0x28],	%i4
	smul	%g4,	0x1897,	%g5
	movle	%icc,	%i2,	%l0
	fpack32	%f12,	%f22,	%f30
	fcmps	%fcc2,	%f22,	%f31
	edge32l	%i5,	%g2,	%i3
	fmovd	%f2,	%f4
	edge16ln	%o3,	%l1,	%i7
	fmovda	%icc,	%f17,	%f26
	xnorcc	%g7,	%g6,	%l2
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	sub	%o6,	%l4,	%o5
	movn	%icc,	%o1,	%i6
	fones	%f26
	movvc	%icc,	%i1,	%o0
	fnors	%f21,	%f13,	%f14
	ldsh	[%l7 + 0x16],	%o7
	orn	%l3,	0x109D,	%o4
	sub	%i0,	0x1A57,	%g1
	move	%xcc,	%i4,	%g3
	movre	%g4,	%i2,	%l0
	fzeros	%f3
	ldub	[%l7 + 0x3B],	%g5
	sdivx	%g2,	0x1360,	%i3
	srl	%o3,	0x07,	%i5
	srlx	%l1,	0x17,	%i7
	ldsh	[%l7 + 0x32],	%g7
	fpadd16s	%f24,	%f3,	%f0
	sll	%l2,	%o2,	%l6
	addc	%g6,	0x0DA3,	%o6
	fcmpes	%fcc0,	%f5,	%f30
	fands	%f17,	%f13,	%f19
	mova	%xcc,	%l4,	%l5
	mulscc	%o1,	0x09BF,	%o5
	movg	%icc,	%i1,	%o0
	andn	%o7,	0x18E0,	%i6
	edge8ln	%o4,	%i0,	%l3
	fpadd32s	%f4,	%f3,	%f11
	fmuld8ulx16	%f24,	%f12,	%f18
	fnot1s	%f16,	%f24
	restore %g1, %g3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x56],	%i2
	save %i4, 0x029F, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g5,	%i3,	%o3
	array8	%i5,	%l1,	%g2
	ld	[%l7 + 0x44],	%f26
	xor	%i7,	0x0ECB,	%l2
	ldx	[%l7 + 0x60],	%g7
	orcc	%l6,	%g6,	%o6
	sdivcc	%l4,	0x0956,	%l5
	sth	%o2,	[%l7 + 0x5A]
	sdivx	%o5,	0x1178,	%i1
	xnor	%o0,	0x1B79,	%o7
	ldsh	[%l7 + 0x6C],	%i6
	orncc	%o4,	0x1FFA,	%i0
	nop
	set	0x50, %o6
	stw	%l3,	[%l7 + %o6]
	edge8l	%g1,	%o1,	%g3
	st	%f16,	[%l7 + 0x78]
	sllx	%g4,	0x1E,	%i2
	fzeros	%f30
	fmovrse	%i4,	%f27,	%f10
	fcmple32	%f12,	%f18,	%l0
	fnot2s	%f5,	%f31
	subcc	%i3,	0x1300,	%o3
	ldsw	[%l7 + 0x14],	%i5
	umulcc	%g5,	%l1,	%g2
	or	%l2,	%g7,	%i7
	movcc	%xcc,	%g6,	%l6
	fnands	%f4,	%f18,	%f13
	siam	0x6
	movrgz	%o6,	%l5,	%l4
	fmovsvs	%xcc,	%f29,	%f2
	movrlz	%o2,	%i1,	%o5
	edge32n	%o0,	%i6,	%o4
	edge32l	%i0,	%l3,	%o7
	movne	%icc,	%g1,	%o1
	andn	%g4,	%i2,	%g3
	movn	%icc,	%i4,	%l0
	bshuffle	%f16,	%f26,	%f8
	srl	%i3,	%o3,	%g5
	movgu	%icc,	%i5,	%g2
	movrlez	%l2,	%l1,	%g7
	faligndata	%f16,	%f12,	%f24
	smulcc	%i7,	0x1134,	%g6
	fmovsg	%xcc,	%f5,	%f10
	mulscc	%l6,	%l5,	%o6
	fabss	%f1,	%f19
	fmovsa	%icc,	%f8,	%f13
	stx	%l4,	[%l7 + 0x68]
	xnor	%i1,	0x0E64,	%o2
	stb	%o0,	[%l7 + 0x3D]
	fnot2	%f16,	%f18
	fsrc1	%f6,	%f20
	fands	%f0,	%f20,	%f1
	movg	%xcc,	%i6,	%o5
	movpos	%xcc,	%o4,	%i0
	lduh	[%l7 + 0x0A],	%o7
	sethi	0x1E70,	%l3
	fzeros	%f6
	edge32ln	%o1,	%g4,	%g1
	edge16ln	%g3,	%i4,	%i2
	xnorcc	%i3,	%l0,	%o3
	stb	%i5,	[%l7 + 0x7B]
	andn	%g5,	0x0DFA,	%l2
	andn	%l1,	0x06A0,	%g2
	movcc	%icc,	%i7,	%g7
	umulcc	%l6,	0x060D,	%l5
	umulcc	%o6,	%g6,	%i1
	fmovsvs	%icc,	%f18,	%f4
	movrlz	%o2,	0x14B,	%l4
	edge8	%o0,	%i6,	%o4
	movl	%xcc,	%o5,	%o7
	edge32	%l3,	%i0,	%g4
	movrlz	%o1,	%g3,	%g1
	array32	%i4,	%i2,	%l0
	fexpand	%f18,	%f20
	movcs	%icc,	%o3,	%i3
	movpos	%xcc,	%i5,	%g5
	edge16ln	%l2,	%l1,	%g2
	edge8l	%i7,	%g7,	%l6
	ldd	[%l7 + 0x60],	%f30
	fmovrsne	%l5,	%f18,	%f9
	fmovsleu	%xcc,	%f24,	%f17
	and	%o6,	%i1,	%g6
	fandnot1s	%f2,	%f23,	%f19
	popc	0x0E13,	%l4
	fnegd	%f0,	%f18
	orn	%o2,	%i6,	%o4
	edge16l	%o5,	%o7,	%o0
	ldx	[%l7 + 0x78],	%i0
	edge32n	%l3,	%g4,	%g3
	sra	%g1,	0x19,	%o1
	fpmerge	%f25,	%f19,	%f12
	sub	%i2,	%i4,	%o3
	umul	%i3,	%l0,	%g5
	edge32ln	%i5,	%l1,	%l2
	movre	%i7,	%g7,	%l6
	array16	%l5,	%g2,	%o6
	or	%g6,	0x0865,	%i1
	fmul8x16au	%f5,	%f20,	%f4
	sdivx	%o2,	0x0CE4,	%i6
	orncc	%l4,	%o5,	%o4
	sth	%o0,	[%l7 + 0x2A]
	array16	%i0,	%l3,	%g4
	sth	%g3,	[%l7 + 0x3A]
	orncc	%g1,	0x1FA3,	%o7
	fornot1s	%f1,	%f17,	%f6
	popc	0x08E4,	%o1
	move	%xcc,	%i4,	%o3
	stb	%i3,	[%l7 + 0x1D]
	movleu	%xcc,	%i2,	%g5
	edge32	%i5,	%l1,	%l0
	movn	%icc,	%l2,	%i7
	subcc	%l6,	%l5,	%g2
	stx	%o6,	[%l7 + 0x60]
	ldub	[%l7 + 0x4F],	%g7
	subcc	%i1,	0x0472,	%o2
	orn	%g6,	0x0B33,	%i6
	movrlz	%o5,	%o4,	%o0
	subc	%l4,	0x1113,	%i0
	stb	%l3,	[%l7 + 0x4B]
	andcc	%g3,	%g4,	%g1
	sth	%o7,	[%l7 + 0x78]
	sir	0x12F6
	edge8	%o1,	%i4,	%o3
	lduw	[%l7 + 0x74],	%i2
	fone	%f10
	edge32n	%g5,	%i5,	%i3
	fmovrdlz	%l0,	%f30,	%f26
	edge16ln	%l2,	%l1,	%l6
	sth	%i7,	[%l7 + 0x3A]
	fmovdge	%xcc,	%f19,	%f9
	edge32ln	%g2,	%l5,	%g7
	edge16l	%i1,	%o6,	%g6
	fornot2	%f8,	%f14,	%f12
	mulx	%o2,	%i6,	%o4
	sdiv	%o5,	0x0919,	%l4
	stb	%o0,	[%l7 + 0x44]
	xorcc	%i0,	%l3,	%g3
	add	%g4,	%g1,	%o7
	movl	%icc,	%i4,	%o3
	smul	%i2,	%g5,	%o1
	movrlz	%i3,	%i5,	%l2
	andcc	%l1,	0x1A30,	%l0
	andncc	%l6,	%i7,	%g2
	fmovdne	%icc,	%f21,	%f11
	fcmpne16	%f26,	%f30,	%l5
	siam	0x3
	ldx	[%l7 + 0x58],	%i1
	movleu	%icc,	%g7,	%o6
	edge8n	%g6,	%o2,	%o4
	ldsb	[%l7 + 0x76],	%o5
	or	%i6,	0x1A4C,	%o0
	ldub	[%l7 + 0x0F],	%i0
	xnor	%l3,	0x0262,	%l4
	edge32l	%g4,	%g3,	%o7
	fmul8sux16	%f2,	%f12,	%f2
	xorcc	%i4,	%g1,	%i2
	ldub	[%l7 + 0x15],	%g5
	orcc	%o3,	%o1,	%i3
	sllx	%i5,	%l1,	%l0
	umul	%l6,	%l2,	%g2
	movne	%icc,	%i7,	%l5
	ld	[%l7 + 0x7C],	%f6
	addccc	%i1,	0x08A2,	%g7
	or	%g6,	%o2,	%o6
	udiv	%o4,	0x0429,	%i6
	movleu	%xcc,	%o0,	%i0
	fnor	%f8,	%f4,	%f16
	sllx	%o5,	%l3,	%g4
	ldsb	[%l7 + 0x53],	%g3
	mova	%xcc,	%o7,	%l4
	edge8n	%i4,	%g1,	%i2
	xorcc	%g5,	%o3,	%i3
	sir	0x1023
	fcmple16	%f22,	%f16,	%o1
	subccc	%i5,	0x0BC9,	%l0
	array8	%l6,	%l1,	%l2
	udivcc	%g2,	0x00EE,	%l5
	movrgez	%i7,	%i1,	%g7
	fcmpes	%fcc0,	%f11,	%f1
	ldsh	[%l7 + 0x4C],	%g6
	ldsh	[%l7 + 0x5C],	%o2
	array32	%o6,	%i6,	%o0
	ldsb	[%l7 + 0x19],	%i0
	orn	%o4,	0x1CF0,	%o5
	smul	%l3,	0x1224,	%g3
	alignaddrl	%o7,	%l4,	%g4
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	addccc	%g5,	0x0C6A,	%i3
	edge16	%o3,	%i5,	%o1
	udiv	%l0,	0x14B3,	%l1
	lduw	[%l7 + 0x1C],	%l6
	movg	%icc,	%l2,	%l5
	mulscc	%i7,	0x0E4E,	%g2
	restore %i1, %g7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	%o6,	%i6
	alignaddrl	%i0,	%o0,	%o4
	sub	%l3,	0x076E,	%o5
	mulscc	%g3,	%o7,	%l4
	array8	%g4,	%i4,	%i2
	ldub	[%l7 + 0x22],	%g1
	addc	%g5,	%o3,	%i5
	andcc	%o1,	%l0,	%l1
	subcc	%i3,	0x018B,	%l2
	addccc	%l5,	%i7,	%g2
	sra	%l6,	0x09,	%g7
	subc	%i1,	%o2,	%g6
	fpack16	%f24,	%f7
	ld	[%l7 + 0x58],	%f28
	fones	%f23
	movl	%xcc,	%o6,	%i0
	srl	%o0,	%i6,	%o4
	fmovs	%f0,	%f27
	movg	%xcc,	%l3,	%o5
	andcc	%g3,	0x1C80,	%l4
	sra	%g4,	%o7,	%i4
	ldx	[%l7 + 0x58],	%i2
	addc	%g5,	%o3,	%g1
	movle	%xcc,	%i5,	%o1
	sllx	%l0,	%i3,	%l2
	edge32l	%l1,	%i7,	%g2
	smul	%l6,	%g7,	%i1
	array8	%o2,	%g6,	%l5
	fmovsgu	%xcc,	%f29,	%f27
	lduw	[%l7 + 0x70],	%o6
	pdist	%f20,	%f12,	%f6
	sra	%i0,	0x1D,	%i6
	fmovdl	%xcc,	%f1,	%f22
	mulx	%o0,	0x089F,	%l3
	sth	%o5,	[%l7 + 0x70]
	ldub	[%l7 + 0x1B],	%o4
	udivcc	%g3,	0x0CAB,	%l4
	edge8n	%g4,	%o7,	%i4
	ldsw	[%l7 + 0x6C],	%i2
	andn	%g5,	%g1,	%i5
	ldub	[%l7 + 0x5F],	%o3
	move	%icc,	%l0,	%i3
	subc	%o1,	%l2,	%l1
	edge8l	%g2,	%i7,	%l6
	and	%g7,	%o2,	%g6
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	movre	%i0,	%l5,	%i6
	ldd	[%l7 + 0x78],	%f8
	fmovrdgz	%o0,	%f30,	%f14
	smul	%l3,	0x0DBE,	%o4
	sdivcc	%g3,	0x1672,	%l4
	ldx	[%l7 + 0x40],	%g4
	movrgez	%o7,	%i4,	%o5
	movle	%icc,	%i2,	%g5
	fmovsa	%xcc,	%f20,	%f21
	movrlez	%g1,	%i5,	%o3
	edge16ln	%i3,	%o1,	%l2
	move	%xcc,	%l1,	%l0
	orcc	%g2,	%l6,	%i7
	ldsh	[%l7 + 0x2E],	%g7
	fmovdg	%icc,	%f30,	%f11
	addc	%o2,	%i1,	%o6
	movvs	%xcc,	%g6,	%i0
	movcs	%xcc,	%i6,	%l5
	fmovrslz	%o0,	%f16,	%f2
	add	%l3,	%o4,	%l4
	movge	%xcc,	%g3,	%g4
	movcc	%xcc,	%o7,	%o5
	addccc	%i4,	%g5,	%g1
	fornot2s	%f15,	%f7,	%f23
	fmovdgu	%xcc,	%f13,	%f26
	edge8n	%i5,	%i2,	%i3
	edge16ln	%o3,	%l2,	%l1
	smul	%o1,	%l0,	%g2
	udivcc	%i7,	0x17F5,	%l6
	movcs	%icc,	%g7,	%o2
	fpack16	%f6,	%f1
	sdivcc	%o6,	0x136B,	%g6
	edge16l	%i0,	%i6,	%i1
	srlx	%o0,	%l3,	%l5
	fand	%f28,	%f10,	%f6
	movcc	%icc,	%o4,	%l4
	mulx	%g4,	0x1503,	%g3
	movrlz	%o7,	%o5,	%i4
	fmul8ulx16	%f2,	%f8,	%f24
	movpos	%icc,	%g1,	%g5
	sth	%i2,	[%l7 + 0x3C]
	alignaddrl	%i5,	%i3,	%o3
	lduh	[%l7 + 0x1C],	%l1
	fcmpeq32	%f14,	%f12,	%l2
	movrlez	%o1,	%l0,	%i7
	movpos	%xcc,	%g2,	%g7
	popc	%l6,	%o6
	ldub	[%l7 + 0x4A],	%o2
	ldsh	[%l7 + 0x3C],	%g6
	sub	%i6,	0x03EC,	%i1
	fmovscs	%xcc,	%f9,	%f2
	lduw	[%l7 + 0x7C],	%i0
	edge32n	%o0,	%l5,	%l3
	stx	%o4,	[%l7 + 0x58]
	restore %l4, %g4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o5,	0x19FC,	%o7
	umul	%g1,	0x13B3,	%i4
	ldd	[%l7 + 0x40],	%g4
	add	%i2,	%i3,	%o3
	andncc	%i5,	%l2,	%o1
	add	%l1,	0x04E9,	%l0
	fxors	%f18,	%f12,	%f1
	srax	%g2,	0x18,	%g7
	movge	%icc,	%i7,	%o6
	stb	%o2,	[%l7 + 0x2F]
	edge16l	%l6,	%g6,	%i6
	addcc	%i1,	0x1E31,	%o0
	or	%i0,	%l3,	%o4
	edge16	%l4,	%l5,	%g3
	mulx	%o5,	0x0219,	%o7
	fnors	%f10,	%f24,	%f26
	sll	%g4,	%i4,	%g1
	xor	%i2,	0x162A,	%g5
	fmovrdlez	%o3,	%f10,	%f10
	smulcc	%i5,	%l2,	%o1
	mova	%icc,	%l1,	%i3
	fmovrslez	%l0,	%f15,	%f17
	fmuld8sux16	%f27,	%f4,	%f14
	fcmpgt32	%f2,	%f18,	%g7
	movge	%icc,	%i7,	%o6
	umul	%o2,	%l6,	%g2
	addcc	%i6,	0x1908,	%g6
	movle	%icc,	%o0,	%i0
	ldd	[%l7 + 0x08],	%l2
	addc	%o4,	%i1,	%l5
	smulcc	%l4,	0x1C04,	%o5
	mova	%xcc,	%o7,	%g3
	orn	%g4,	0x0D39,	%g1
	fsrc2	%f10,	%f16
	stx	%i4,	[%l7 + 0x58]
	edge16	%g5,	%o3,	%i2
	fcmple32	%f16,	%f6,	%l2
	ldub	[%l7 + 0x26],	%i5
	ldsw	[%l7 + 0x08],	%o1
	orcc	%i3,	0x187D,	%l1
	faligndata	%f22,	%f4,	%f26
	movre	%l0,	0x1CA,	%g7
	fnands	%f8,	%f7,	%f28
	xnorcc	%o6,	0x1997,	%o2
	fcmpgt16	%f30,	%f8,	%l6
	edge16	%g2,	%i7,	%g6
	movl	%icc,	%o0,	%i6
	fnegs	%f24,	%f22
	fpadd16	%f0,	%f30,	%f6
	movgu	%icc,	%l3,	%i0
	pdist	%f2,	%f28,	%f14
	andcc	%i1,	0x047C,	%l5
	orncc	%l4,	%o4,	%o5
	array32	%o7,	%g3,	%g4
	fnor	%f28,	%f26,	%f14
	andncc	%g1,	%g5,	%o3
	ldsb	[%l7 + 0x7B],	%i2
	edge32	%l2,	%i5,	%i4
	stw	%o1,	[%l7 + 0x20]
	sdiv	%i3,	0x061D,	%l1
	movne	%icc,	%g7,	%o6
	fmovde	%icc,	%f23,	%f24
	srlx	%o2,	%l6,	%g2
	fcmpne16	%f0,	%f0,	%l0
	edge8ln	%g6,	%o0,	%i7
	edge16	%i6,	%i0,	%i1
	ldx	[%l7 + 0x08],	%l5
	fcmple16	%f22,	%f12,	%l4
	edge32n	%o4,	%o5,	%o7
	nop
	set	0x54, %o4
	ldsh	[%l7 + %o4],	%g3
	and	%g4,	%g1,	%l3
	subc	%g5,	%i2,	%o3
	array16	%i5,	%l2,	%i4
	srlx	%o1,	0x13,	%l1
	movcs	%icc,	%i3,	%o6
	popc	%g7,	%l6
	stx	%g2,	[%l7 + 0x60]
	movrgez	%o2,	%g6,	%o0
	ldsh	[%l7 + 0x60],	%l0
	lduw	[%l7 + 0x44],	%i7
	movn	%xcc,	%i0,	%i1
	fsrc2s	%f13,	%f23
	ldd	[%l7 + 0x38],	%i6
	srl	%l5,	0x09,	%o4
	fpadd32	%f28,	%f20,	%f18
	orcc	%o5,	0x0116,	%l4
	edge8ln	%g3,	%o7,	%g1
	ldx	[%l7 + 0x70],	%g4
	fmul8sux16	%f16,	%f16,	%f18
	edge8n	%g5,	%l3,	%i2
	std	%f26,	[%l7 + 0x30]
	sllx	%o3,	%l2,	%i5
	addccc	%i4,	%o1,	%l1
	for	%f20,	%f22,	%f14
	fcmpes	%fcc1,	%f15,	%f11
	save %i3, 0x177F, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l6,	%o6,	%g2
	subc	%o2,	%o0,	%g6
	st	%f25,	[%l7 + 0x2C]
	sth	%l0,	[%l7 + 0x76]
	fmovdleu	%icc,	%f5,	%f12
	sethi	0x17E3,	%i7
	std	%f30,	[%l7 + 0x60]
	movrgez	%i0,	%i1,	%i6
	and	%l5,	0x02A3,	%o5
	nop
	set	0x28, %i3
	sth	%o4,	[%l7 + %i3]
	movre	%g3,	0x121,	%l4
	subcc	%o7,	%g1,	%g4
	alignaddr	%l3,	%g5,	%i2
	fmovrsgz	%l2,	%f10,	%f28
	edge16ln	%o3,	%i4,	%i5
	movrne	%l1,	0x08F,	%i3
	edge32	%o1,	%l6,	%g7
	nop
	set	0x5C, %o2
	ldsw	[%l7 + %o2],	%o6
	movneg	%xcc,	%g2,	%o2
	srlx	%g6,	0x1D,	%o0
	sdivcc	%i7,	0x180C,	%i0
	fmovd	%f26,	%f20
	stb	%i1,	[%l7 + 0x5D]
	fnand	%f8,	%f0,	%f28
	udivx	%i6,	0x0D13,	%l5
	alignaddrl	%l0,	%o5,	%g3
	movrlez	%o4,	0x175,	%l4
	mova	%icc,	%g1,	%g4
	or	%o7,	%l3,	%i2
	subccc	%g5,	%o3,	%l2
	xor	%i5,	%i4,	%l1
	movcc	%xcc,	%o1,	%i3
	sllx	%g7,	%o6,	%l6
	ld	[%l7 + 0x14],	%f11
	movre	%o2,	0x380,	%g2
	fmovsneg	%xcc,	%f25,	%f24
	fone	%f10
	movn	%xcc,	%g6,	%i7
	addcc	%o0,	%i1,	%i6
	movpos	%xcc,	%l5,	%i0
	mulx	%l0,	%o5,	%g3
	movre	%o4,	%g1,	%l4
	movcs	%icc,	%g4,	%l3
	fmovdvc	%xcc,	%f19,	%f24
	movvs	%xcc,	%i2,	%g5
	ldd	[%l7 + 0x68],	%o2
	fpadd32s	%f10,	%f17,	%f15
	edge8	%l2,	%o7,	%i4
	movgu	%icc,	%i5,	%l1
	movcs	%xcc,	%o1,	%i3
	edge16	%o6,	%g7,	%o2
	edge8n	%l6,	%g2,	%g6
	fmovrdgz	%i7,	%f26,	%f14
	andcc	%o0,	0x19EF,	%i1
	fmovde	%xcc,	%f8,	%f14
	fabss	%f11,	%f27
	array8	%i6,	%l5,	%i0
	orn	%l0,	0x19BF,	%o5
	fpsub32s	%f31,	%f20,	%f20
	fmul8sux16	%f14,	%f16,	%f10
	umul	%o4,	%g3,	%l4
	movg	%icc,	%g1,	%l3
	xorcc	%g4,	%g5,	%o3
	movrlez	%l2,	0x394,	%o7
	fmovsn	%icc,	%f10,	%f24
	addcc	%i2,	%i4,	%l1
	ldsh	[%l7 + 0x20],	%o1
	ldsw	[%l7 + 0x18],	%i3
	fmovde	%icc,	%f22,	%f26
	save %i5, %g7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x44],	%o6
	movrlz	%g2,	%l6,	%i7
	fabsd	%f10,	%f26
	movg	%xcc,	%o0,	%i1
	fmovde	%icc,	%f23,	%f9
	ldd	[%l7 + 0x28],	%i6
	fcmpgt16	%f6,	%f4,	%g6
	ld	[%l7 + 0x6C],	%f7
	pdist	%f8,	%f20,	%f6
	edge16ln	%i0,	%l5,	%l0
	sdivx	%o5,	0x19E2,	%o4
	movrlz	%l4,	0x0B3,	%g3
	movn	%icc,	%l3,	%g1
	lduh	[%l7 + 0x38],	%g5
	movne	%xcc,	%g4,	%o3
	movrgez	%o7,	%l2,	%i2
	edge32l	%l1,	%o1,	%i4
	movrlez	%i5,	0x069,	%i3
	sll	%o2,	0x1F,	%g7
	fpadd32s	%f4,	%f16,	%f22
	fcmpgt16	%f22,	%f14,	%g2
	xnorcc	%o6,	%l6,	%o0
	ldd	[%l7 + 0x58],	%i6
	save %i1, %i6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l5,	%l0,	%o5
	xor	%i0,	%l4,	%g3
	movcs	%xcc,	%l3,	%g1
	udivcc	%o4,	0x0F07,	%g5
	movrgz	%g4,	%o3,	%o7
	save %l2, %l1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %o3
	sth	%i4,	[%l7 + %o3]
	move	%icc,	%i5,	%i3
	edge8n	%o2,	%g7,	%o1
	fand	%f28,	%f22,	%f30
	orcc	%o6,	0x06CE,	%g2
	movl	%icc,	%o0,	%i7
	movre	%l6,	%i6,	%i1
	orn	%l5,	%l0,	%g6
	st	%f9,	[%l7 + 0x64]
	alignaddr	%o5,	%l4,	%g3
	ldd	[%l7 + 0x08],	%f20
	ldx	[%l7 + 0x60],	%l3
	fzeros	%f13
	srax	%i0,	%g1,	%o4
	sdivcc	%g5,	0x1AC8,	%o3
	fandnot1	%f10,	%f16,	%f18
	or	%o7,	%l2,	%g4
	fzeros	%f6
	fmovdneg	%xcc,	%f18,	%f16
	fmovsle	%xcc,	%f25,	%f16
	for	%f18,	%f12,	%f12
	subccc	%l1,	0x0DC7,	%i4
	ldsh	[%l7 + 0x7A],	%i5
	fcmple32	%f0,	%f6,	%i2
	movvc	%icc,	%i3,	%o2
	movge	%xcc,	%o1,	%o6
	edge16n	%g2,	%g7,	%o0
	popc	%i7,	%i6
	fcmpgt32	%f14,	%f28,	%l6
	fmovdg	%xcc,	%f24,	%f1
	edge8	%l5,	%l0,	%i1
	sub	%o5,	0x0155,	%l4
	and	%g6,	%g3,	%i0
	subc	%l3,	0x05CF,	%g1
	udivcc	%o4,	0x109C,	%o3
	popc	0x161D,	%g5
	movpos	%icc,	%l2,	%o7
	movg	%xcc,	%l1,	%i4
	fmovrde	%g4,	%f22,	%f28
	fpsub16	%f12,	%f26,	%f8
	fpadd32s	%f10,	%f5,	%f14
	orncc	%i2,	0x1C52,	%i3
	edge32n	%i5,	%o1,	%o6
	edge32	%g2,	%o2,	%g7
	andn	%o0,	%i6,	%i7
	fcmple32	%f30,	%f30,	%l5
	alignaddr	%l6,	%i1,	%o5
	nop
	set	0x58, %g3
	stw	%l4,	[%l7 + %g3]
	edge16ln	%l0,	%g6,	%i0
	movvs	%xcc,	%g3,	%l3
	move	%xcc,	%o4,	%g1
	fmovscs	%xcc,	%f0,	%f15
	nop
	set	0x0F, %g2
	ldsb	[%l7 + %g2],	%g5
	fandnot2s	%f18,	%f6,	%f11
	ldx	[%l7 + 0x30],	%l2
	fsrc1	%f6,	%f4
	nop
	set	0x1B, %l4
	stb	%o7,	[%l7 + %l4]
	movrne	%l1,	0x339,	%i4
	fcmpd	%fcc3,	%f12,	%f12
	movgu	%icc,	%g4,	%o3
	edge8l	%i3,	%i5,	%i2
	alignaddr	%o1,	%g2,	%o6
	edge32n	%o2,	%g7,	%i6
	sir	0x0698
	sdivx	%o0,	0x0B31,	%i7
	sir	0x0BBC
	addcc	%l6,	%l5,	%o5
	udivcc	%l4,	0x0482,	%i1
	fmovrslez	%l0,	%f17,	%f29
	stb	%g6,	[%l7 + 0x4F]
	sll	%g3,	0x07,	%l3
	movne	%xcc,	%i0,	%o4
	alignaddrl	%g1,	%l2,	%g5
	ldsb	[%l7 + 0x2E],	%o7
	movvc	%icc,	%i4,	%l1
	fmovrdgz	%o3,	%f6,	%f0
	siam	0x0
	umul	%g4,	%i5,	%i3
	umul	%i2,	%g2,	%o1
	edge16	%o2,	%o6,	%i6
	movg	%icc,	%g7,	%o0
	alignaddrl	%i7,	%l5,	%o5
	ldsw	[%l7 + 0x34],	%l4
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	fmovdleu	%xcc,	%f5,	%f26
	fandnot1s	%f13,	%f28,	%f14
	fmovdpos	%icc,	%f5,	%f9
	fsrc2s	%f24,	%f19
	ld	[%l7 + 0x60],	%f31
	st	%f28,	[%l7 + 0x5C]
	array8	%g6,	%g3,	%i0
	fmovsne	%icc,	%f24,	%f28
	and	%l3,	%o4,	%g1
	fmovsg	%icc,	%f18,	%f10
	udiv	%l2,	0x0CBE,	%o7
	mulx	%i4,	%g5,	%l1
	fpadd32	%f16,	%f16,	%f18
	lduw	[%l7 + 0x78],	%o3
	mulx	%i5,	0x00C3,	%i3
	movvs	%icc,	%g4,	%i2
	fcmpne32	%f28,	%f10,	%o1
	popc	%o2,	%g2
	fcmpeq16	%f18,	%f0,	%o6
	edge8ln	%g7,	%i6,	%o0
	restore %i7, %l5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o5,	%i1,	%l0
	fmovdl	%icc,	%f13,	%f30
	alignaddrl	%g6,	%l6,	%g3
	edge16n	%i0,	%o4,	%g1
	alignaddr	%l2,	%o7,	%l3
	edge16l	%g5,	%i4,	%l1
	movrgz	%i5,	0x268,	%o3
	umulcc	%i3,	%i2,	%o1
	movleu	%icc,	%g4,	%g2
	fnot2	%f8,	%f20
	ldsb	[%l7 + 0x7A],	%o6
	fpsub32	%f30,	%f10,	%f14
	movg	%xcc,	%o2,	%i6
	fornot2s	%f25,	%f1,	%f2
	fmovdvs	%xcc,	%f14,	%f23
	movcs	%icc,	%g7,	%i7
	xnor	%o0,	%l4,	%l5
	edge16	%i1,	%l0,	%o5
	array8	%g6,	%g3,	%i0
	array32	%o4,	%l6,	%g1
	movneg	%xcc,	%o7,	%l2
	fpadd16s	%f19,	%f18,	%f25
	fmovrslez	%l3,	%f19,	%f27
	edge16	%g5,	%i4,	%l1
	fmovdn	%xcc,	%f26,	%f2
	addcc	%o3,	%i5,	%i3
	fmovsa	%xcc,	%f30,	%f29
	udiv	%i2,	0x1239,	%o1
	for	%f8,	%f4,	%f0
	alignaddrl	%g2,	%g4,	%o6
	srlx	%i6,	%g7,	%i7
	subcc	%o0,	0x1C40,	%l4
	udiv	%o2,	0x1EA8,	%i1
	xorcc	%l0,	0x1126,	%o5
	fnors	%f4,	%f5,	%f25
	movcc	%icc,	%l5,	%g3
	xorcc	%i0,	%o4,	%g6
	edge8	%l6,	%g1,	%o7
	udivcc	%l2,	0x0F5F,	%g5
	fcmps	%fcc0,	%f16,	%f14
	movn	%xcc,	%i4,	%l3
	sra	%l1,	0x08,	%i5
	addcc	%i3,	%i2,	%o3
	edge16n	%o1,	%g2,	%g4
	add	%i6,	%g7,	%o6
	fcmple32	%f18,	%f28,	%o0
	std	%f0,	[%l7 + 0x28]
	xorcc	%i7,	%o2,	%l4
	fmovsneg	%xcc,	%f9,	%f3
	sdivcc	%l0,	0x1645,	%o5
	edge16l	%l5,	%g3,	%i0
	umulcc	%o4,	%g6,	%i1
	fpadd32s	%f1,	%f4,	%f19
	popc	%l6,	%o7
	fmovde	%xcc,	%f1,	%f5
	udiv	%l2,	0x0065,	%g5
	ldsw	[%l7 + 0x24],	%g1
	fmovdl	%xcc,	%f9,	%f18
	movpos	%icc,	%i4,	%l1
	fmul8x16al	%f20,	%f22,	%f18
	fmovdl	%xcc,	%f31,	%f11
	sethi	0x0AF7,	%i5
	movre	%i3,	%l3,	%o3
	orn	%i2,	0x0893,	%g2
	add	%o1,	%i6,	%g4
	fmovdneg	%icc,	%f26,	%f1
	edge32ln	%o6,	%g7,	%o0
	movrgez	%i7,	0x3BA,	%l4
	fands	%f29,	%f5,	%f16
	xorcc	%o2,	0x0EEA,	%o5
	xnor	%l0,	%g3,	%i0
	ldsw	[%l7 + 0x70],	%l5
	umulcc	%g6,	%o4,	%l6
	subc	%i1,	%l2,	%o7
	fmovdl	%xcc,	%f25,	%f25
	sllx	%g5,	%i4,	%g1
	andncc	%i5,	%l1,	%i3
	popc	0x08A7,	%l3
	fcmple16	%f16,	%f2,	%i2
	fmovrdgz	%g2,	%f24,	%f10
	sll	%o1,	0x14,	%o3
	fcmps	%fcc2,	%f2,	%f9
	fmovs	%f12,	%f2
	ldsb	[%l7 + 0x13],	%g4
	fandnot2s	%f2,	%f26,	%f12
	subccc	%i6,	0x1C53,	%o6
	lduw	[%l7 + 0x10],	%o0
	movrlz	%i7,	0x0D6,	%g7
	array8	%o2,	%l4,	%l0
	sllx	%g3,	%o5,	%l5
	fmovrsgz	%g6,	%f25,	%f22
	st	%f22,	[%l7 + 0x7C]
	mova	%xcc,	%i0,	%o4
	stx	%l6,	[%l7 + 0x60]
	sethi	0x180E,	%l2
	fzero	%f2
	st	%f21,	[%l7 + 0x3C]
	alignaddrl	%i1,	%g5,	%o7
	subc	%i4,	0x1398,	%i5
	xnor	%l1,	0x1FC4,	%g1
	array16	%i3,	%l3,	%g2
	xor	%o1,	0x0EF7,	%i2
	array16	%o3,	%i6,	%g4
	edge16ln	%o0,	%o6,	%i7
	ldd	[%l7 + 0x28],	%f16
	sth	%o2,	[%l7 + 0x48]
	std	%f22,	[%l7 + 0x18]
	lduw	[%l7 + 0x4C],	%l4
	fmovdl	%icc,	%f19,	%f10
	addcc	%g7,	0x13CB,	%l0
	umul	%o5,	%g3,	%l5
	edge8ln	%g6,	%i0,	%o4
	orcc	%l2,	%l6,	%i1
	fpadd32	%f26,	%f22,	%f22
	movrlz	%o7,	%i4,	%g5
	ldd	[%l7 + 0x08],	%f12
	edge32l	%i5,	%l1,	%i3
	popc	%l3,	%g1
	movrgz	%g2,	0x0C1,	%i2
	fnor	%f14,	%f14,	%f28
	edge8l	%o1,	%i6,	%g4
	movrgz	%o3,	%o0,	%o6
	umulcc	%o2,	0x063D,	%l4
	save %i7, %g7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g3,	[%l7 + 0x30]
	fexpand	%f20,	%f2
	fmuld8ulx16	%f18,	%f9,	%f20
	edge8l	%l5,	%g6,	%o5
	movrgez	%o4,	0x009,	%i0
	fcmpne32	%f4,	%f2,	%l6
	andn	%i1,	0x1466,	%l2
	movvc	%xcc,	%i4,	%o7
	array8	%i5,	%g5,	%i3
	movn	%icc,	%l1,	%l3
	xnorcc	%g2,	%g1,	%o1
	movrlz	%i2,	%i6,	%g4
	edge32ln	%o3,	%o0,	%o2
	st	%f7,	[%l7 + 0x68]
	edge32l	%o6,	%i7,	%g7
	sir	0x0157
	subcc	%l4,	%l0,	%g3
	orn	%l5,	0x1017,	%g6
	udiv	%o4,	0x07AA,	%i0
	edge32ln	%l6,	%i1,	%l2
	udivcc	%i4,	0x1114,	%o7
	movrlez	%o5,	0x2D0,	%i5
	xorcc	%g5,	0x134B,	%i3
	fzero	%f4
	movl	%xcc,	%l3,	%g2
	movrne	%g1,	%o1,	%l1
	fmovsvc	%icc,	%f25,	%f26
	movneg	%icc,	%i6,	%g4
	movle	%xcc,	%i2,	%o0
	stw	%o3,	[%l7 + 0x74]
	addccc	%o6,	%i7,	%g7
	andncc	%l4,	%o2,	%l0
	movrgz	%g3,	0x363,	%g6
	alignaddrl	%l5,	%i0,	%o4
	stb	%l6,	[%l7 + 0x0A]
	movg	%xcc,	%i1,	%i4
	movrgez	%l2,	%o5,	%i5
	addcc	%o7,	0x0A59,	%i3
	subc	%g5,	0x0E6E,	%g2
	fpadd16s	%f29,	%f17,	%f12
	movre	%g1,	0x0FC,	%l3
	fmul8x16au	%f2,	%f24,	%f18
	orcc	%l1,	%i6,	%o1
	alignaddrl	%g4,	%i2,	%o0
	std	%f14,	[%l7 + 0x20]
	smul	%o3,	0x1487,	%o6
	or	%i7,	%l4,	%o2
	xnorcc	%l0,	%g3,	%g7
	array16	%l5,	%g6,	%o4
	mulx	%i0,	%l6,	%i1
	for	%f4,	%f4,	%f2
	sethi	0x07D1,	%l2
	sdiv	%o5,	0x0599,	%i4
	andn	%i5,	%i3,	%o7
	udivx	%g2,	0x046C,	%g1
	ldd	[%l7 + 0x30],	%g4
	smul	%l3,	%l1,	%o1
	movvs	%xcc,	%i6,	%g4
	movle	%xcc,	%o0,	%o3
	subcc	%o6,	0x0D10,	%i7
	subccc	%l4,	0x001D,	%i2
	fnand	%f0,	%f26,	%f4
	andcc	%o2,	%g3,	%l0
	std	%f18,	[%l7 + 0x58]
	nop
	set	0x7E, %o7
	ldsb	[%l7 + %o7],	%l5
	fmovd	%f2,	%f14
	udivx	%g6,	0x0262,	%g7
	ldsb	[%l7 + 0x7E],	%i0
	umul	%o4,	%i1,	%l2
	fpadd32s	%f8,	%f23,	%f0
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%l6
	edge8l	%o5,	%i5,	%i4
	fmovdcs	%icc,	%f30,	%f22
	xnor	%i3,	%o7,	%g2
	edge8ln	%g1,	%l3,	%g5
	movl	%xcc,	%l1,	%i6
	sethi	0x0729,	%g4
	movne	%icc,	%o0,	%o3
	orncc	%o6,	%i7,	%l4
	movre	%o1,	0x237,	%o2
	st	%f30,	[%l7 + 0x34]
	move	%icc,	%g3,	%i2
	ldx	[%l7 + 0x18],	%l5
	xnor	%l0,	0x141D,	%g6
	popc	0x0478,	%g7
	stw	%o4,	[%l7 + 0x50]
	alignaddr	%i0,	%l2,	%l6
	movle	%xcc,	%i1,	%i5
	fones	%f22
	fone	%f16
	mova	%xcc,	%o5,	%i4
	srlx	%o7,	%i3,	%g2
	movrgz	%g1,	0x15C,	%g5
	fpsub32	%f20,	%f0,	%f4
	movne	%icc,	%l1,	%l3
	edge32n	%g4,	%o0,	%o3
	ldd	[%l7 + 0x30],	%o6
	movvc	%xcc,	%i6,	%i7
	edge16	%l4,	%o1,	%o2
	addc	%i2,	%l5,	%l0
	edge16n	%g3,	%g7,	%o4
	fcmpeq16	%f4,	%f18,	%g6
	fmovdneg	%icc,	%f15,	%f18
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	fandnot1s	%f3,	%f5,	%f17
	edge16n	%i1,	%i0,	%o5
	ldd	[%l7 + 0x10],	%f8
	fexpand	%f12,	%f0
	stb	%i4,	[%l7 + 0x2B]
	fmovdvs	%icc,	%f8,	%f15
	fmovrsgz	%i5,	%f4,	%f31
	subccc	%i3,	%g2,	%g1
	movne	%xcc,	%g5,	%o7
	fmovscc	%icc,	%f25,	%f27
	fandnot1	%f6,	%f2,	%f26
	movg	%icc,	%l3,	%g4
	fmovrsgez	%l1,	%f14,	%f22
	fpsub32s	%f30,	%f14,	%f4
	ldsh	[%l7 + 0x0E],	%o0
	umul	%o3,	0x10F7,	%o6
	bshuffle	%f24,	%f28,	%f14
	xnor	%i6,	%l4,	%o1
	and	%o2,	0x1A94,	%i2
	smul	%i7,	0x174D,	%l5
	orcc	%l0,	%g7,	%o4
	array16	%g3,	%l2,	%g6
	fmovrdlez	%l6,	%f20,	%f6
	udivcc	%i1,	0x06D4,	%o5
	fcmpne32	%f18,	%f26,	%i0
	addc	%i4,	0x1550,	%i3
	movrlez	%g2,	%g1,	%g5
	and	%o7,	0x1DB7,	%l3
	andn	%g4,	0x022D,	%i5
	fmovdcs	%icc,	%f10,	%f22
	edge16l	%o0,	%l1,	%o3
	fmovrdlez	%i6,	%f8,	%f6
	stb	%o6,	[%l7 + 0x62]
	udivcc	%l4,	0x10C4,	%o2
	sub	%i2,	0x154E,	%i7
	ldsb	[%l7 + 0x39],	%l5
	orcc	%o1,	0x124C,	%g7
	movcs	%xcc,	%o4,	%l0
	restore %l2, %g6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x120E,	%g3
	fpadd16s	%f25,	%f11,	%f25
	srax	%o5,	%i0,	%i4
	udivx	%i3,	0x198F,	%g2
	movl	%xcc,	%g5,	%o7
	fmovrdne	%g1,	%f10,	%f14
	movcc	%xcc,	%g4,	%l3
	addcc	%i5,	%o0,	%l1
	sra	%i6,	0x00,	%o6
	fmovse	%xcc,	%f19,	%f11
	alignaddr	%l4,	%o3,	%i2
	xnor	%o2,	%i7,	%o1
	orn	%l5,	%g7,	%l0
	fcmpd	%fcc3,	%f0,	%f8
	array16	%l2,	%g6,	%l6
	mova	%icc,	%o4,	%i1
	fmovscs	%xcc,	%f28,	%f8
	sdivx	%o5,	0x0C40,	%g3
	movrlez	%i0,	0x14D,	%i4
	orcc	%i3,	%g5,	%o7
	save %g1, 0x08C9, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g2,	0x37A,	%l3
	mova	%icc,	%i5,	%l1
	edge8	%i6,	%o6,	%l4
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	fnors	%f30,	%f17,	%f11
	sth	%i7,	[%l7 + 0x0E]
	movcs	%xcc,	%o1,	%l5
	fnot1s	%f26,	%f18
	stb	%o3,	[%l7 + 0x70]
	fmovrse	%g7,	%f12,	%f7
	mulscc	%l0,	%g6,	%l2
	movg	%xcc,	%l6,	%i1
	addcc	%o5,	%g3,	%i0
	movrgz	%i4,	%o4,	%i3
	subcc	%g5,	0x1A3B,	%g1
	fnor	%f10,	%f26,	%f8
	save %g4, 0x1704, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g2,	%i5,	%l1
	movrgz	%l3,	%i6,	%o6
	edge8	%l4,	%i2,	%o0
	fornot2	%f16,	%f8,	%f16
	ldd	[%l7 + 0x18],	%f24
	fmovrsgez	%o2,	%f1,	%f13
	movcc	%icc,	%o1,	%l5
	movvs	%xcc,	%o3,	%i7
	sth	%g7,	[%l7 + 0x78]
	fpsub32s	%f8,	%f23,	%f8
	movcc	%xcc,	%g6,	%l0
	fmovdvc	%icc,	%f11,	%f19
	sllx	%l2,	0x07,	%i1
	std	%f16,	[%l7 + 0x78]
	movre	%o5,	0x21F,	%g3
	sethi	0x182F,	%i0
	fandnot1s	%f27,	%f9,	%f19
	fones	%f27
	sllx	%i4,	0x1D,	%o4
	fmovsneg	%icc,	%f9,	%f11
	addccc	%i3,	0x0206,	%l6
	fmovdcs	%xcc,	%f10,	%f19
	ldd	[%l7 + 0x28],	%g0
	srl	%g5,	%o7,	%g4
	ldx	[%l7 + 0x18],	%g2
	movneg	%icc,	%i5,	%l3
	move	%icc,	%i6,	%o6
	fpadd16s	%f25,	%f14,	%f14
	edge8n	%l4,	%i2,	%o0
	fmovrdlz	%o2,	%f18,	%f16
	fmovrsne	%l1,	%f16,	%f5
	st	%f23,	[%l7 + 0x54]
	srax	%l5,	0x19,	%o1
	fmovsleu	%icc,	%f19,	%f15
	udiv	%o3,	0x0176,	%g7
	edge32n	%g6,	%l0,	%l2
	ldub	[%l7 + 0x26],	%i7
	orncc	%i1,	0x1E49,	%o5
	edge32l	%g3,	%i0,	%o4
	movcc	%xcc,	%i3,	%l6
	alignaddr	%i4,	%g5,	%g1
	fmovda	%xcc,	%f29,	%f0
	fmovdl	%xcc,	%f30,	%f15
	movrne	%g4,	%o7,	%i5
	movg	%icc,	%g2,	%l3
	umul	%o6,	%i6,	%l4
	fmul8ulx16	%f24,	%f8,	%f18
	sethi	0x11FF,	%i2
	sir	0x05E6
	andncc	%o0,	%o2,	%l5
	udivcc	%l1,	0x0817,	%o3
	sllx	%o1,	%g6,	%g7
	movn	%xcc,	%l2,	%i7
	sdiv	%l0,	0x184A,	%i1
	edge16ln	%g3,	%o5,	%o4
	edge8l	%i3,	%i0,	%i4
	edge32l	%l6,	%g5,	%g4
	fandnot2s	%f16,	%f0,	%f24
	sethi	0x1189,	%o7
	fnot1s	%f9,	%f4
	fmovdne	%icc,	%f0,	%f30
	ldd	[%l7 + 0x70],	%f6
	restore %i5, %g2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l3,	%o6
	ldsh	[%l7 + 0x62],	%l4
	edge8	%i2,	%i6,	%o2
	array32	%l5,	%l1,	%o0
	addc	%o1,	%g6,	%o3
	xnor	%g7,	%i7,	%l0
	fxors	%f5,	%f10,	%f1
	addc	%l2,	%i1,	%o5
	udivx	%o4,	0x1332,	%g3
	fcmps	%fcc3,	%f7,	%f27
	array32	%i3,	%i4,	%l6
	movcc	%xcc,	%g5,	%i0
	stw	%o7,	[%l7 + 0x48]
	fmovda	%xcc,	%f30,	%f1
	umulcc	%g4,	%g2,	%i5
	subc	%l3,	%g1,	%o6
	sir	0x008A
	fnegd	%f24,	%f6
	xorcc	%l4,	%i2,	%i6
	fmovsn	%icc,	%f8,	%f29
	edge16n	%l5,	%o2,	%o0
	mulx	%o1,	%g6,	%o3
	fmovspos	%icc,	%f17,	%f31
	fmovdleu	%icc,	%f0,	%f4
	udivx	%g7,	0x1635,	%l1
	edge32	%i7,	%l2,	%l0
	fnors	%f19,	%f9,	%f1
	addc	%i1,	%o4,	%g3
	edge16ln	%o5,	%i3,	%l6
	fornot1	%f10,	%f4,	%f28
	andcc	%g5,	%i4,	%o7
	movleu	%xcc,	%i0,	%g2
	popc	0x0BC6,	%g4
	fpmerge	%f17,	%f25,	%f24
	subc	%i5,	0x0B08,	%l3
	array16	%o6,	%l4,	%i2
	fpsub16s	%f2,	%f31,	%f3
	udivx	%g1,	0x0134,	%l5
	fmovrsne	%i6,	%f27,	%f25
	movcc	%icc,	%o2,	%o0
	edge16n	%o1,	%o3,	%g6
	edge32	%g7,	%l1,	%l2
	movne	%icc,	%i7,	%i1
	fmovdvc	%xcc,	%f10,	%f18
	fmovrdgez	%o4,	%f12,	%f12
	sdivcc	%l0,	0x109B,	%o5
	movleu	%icc,	%i3,	%l6
	array32	%g5,	%g3,	%i4
	movrgz	%i0,	0x129,	%g2
	movvs	%icc,	%o7,	%g4
	fmovsg	%xcc,	%f22,	%f4
	fmovspos	%icc,	%f21,	%f31
	subc	%i5,	%l3,	%l4
	edge16ln	%o6,	%i2,	%l5
	andn	%i6,	%o2,	%g1
	fzero	%f18
	smul	%o1,	%o3,	%g6
	fmovrslez	%g7,	%f23,	%f7
	xor	%l1,	%o0,	%i7
	srlx	%i1,	0x1B,	%l2
	bshuffle	%f22,	%f18,	%f18
	sethi	0x1953,	%o4
	array16	%o5,	%i3,	%l0
	movcs	%icc,	%g5,	%l6
	ld	[%l7 + 0x4C],	%f31
	fornot2	%f24,	%f22,	%f18
	xorcc	%g3,	%i0,	%i4
	orn	%g2,	%o7,	%g4
	umul	%l3,	0x166A,	%l4
	sth	%i5,	[%l7 + 0x74]
	fmovsl	%xcc,	%f17,	%f29
	edge8l	%i2,	%l5,	%i6
	subcc	%o2,	0x131A,	%g1
	fmul8ulx16	%f18,	%f0,	%f24
	andcc	%o6,	0x0491,	%o3
	sir	0x0102
	fcmpgt16	%f20,	%f4,	%g6
	fmuld8ulx16	%f14,	%f31,	%f30
	sdiv	%o1,	0x11F1,	%l1
	fcmple16	%f8,	%f14,	%g7
	fnegd	%f10,	%f6
	ldsb	[%l7 + 0x38],	%i7
	addcc	%o0,	%i1,	%l2
	movcs	%xcc,	%o4,	%o5
	fmovs	%f18,	%f29
	addcc	%i3,	0x1BBD,	%l0
	edge16ln	%l6,	%g5,	%g3
	movpos	%xcc,	%i4,	%i0
	smulcc	%g2,	%g4,	%l3
	srlx	%l4,	%i5,	%i2
	fnot2	%f24,	%f6
	movg	%xcc,	%o7,	%l5
	sllx	%i6,	0x06,	%g1
	alignaddrl	%o2,	%o6,	%o3
	st	%f8,	[%l7 + 0x3C]
	movgu	%icc,	%g6,	%o1
	fmovdcs	%icc,	%f24,	%f31
	fmovrsgz	%l1,	%f20,	%f29
	ldd	[%l7 + 0x30],	%f30
	ldx	[%l7 + 0x10],	%i7
	fpsub16	%f24,	%f4,	%f4
	array8	%o0,	%i1,	%l2
	sdiv	%g7,	0x169A,	%o4
	fcmpd	%fcc0,	%f12,	%f22
	fabss	%f21,	%f18
	fxnor	%f24,	%f20,	%f26
	ld	[%l7 + 0x18],	%f11
	alignaddr	%o5,	%i3,	%l6
	sth	%l0,	[%l7 + 0x60]
	fmovrdne	%g3,	%f20,	%f4
	sethi	0x128C,	%i4
	fcmpgt32	%f30,	%f18,	%i0
	sra	%g5,	0x06,	%g2
	edge16n	%l3,	%g4,	%l4
	movre	%i5,	0x040,	%i2
	smulcc	%o7,	0x09F8,	%l5
	edge32n	%g1,	%i6,	%o2
	fmovsg	%icc,	%f10,	%f5
	mulscc	%o3,	%g6,	%o6
	fmovdl	%icc,	%f2,	%f15
	fmul8ulx16	%f6,	%f0,	%f30
	stb	%l1,	[%l7 + 0x51]
	alignaddr	%i7,	%o1,	%o0
	fmovrdne	%l2,	%f24,	%f26
	edge8ln	%i1,	%o4,	%o5
	movgu	%icc,	%i3,	%g7
	ldsh	[%l7 + 0x64],	%l0
	edge16n	%l6,	%i4,	%i0
	sll	%g3,	0x0B,	%g2
	srlx	%l3,	%g4,	%l4
	movle	%icc,	%g5,	%i2
	sra	%i5,	0x1D,	%l5
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%g1
	fmovde	%xcc,	%f24,	%f13
	addccc	%i6,	%o7,	%o3
	sir	0x1836
	stx	%o2,	[%l7 + 0x50]
	fmovsa	%icc,	%f24,	%f23
	andncc	%o6,	%g6,	%l1
	movn	%icc,	%i7,	%o0
	fands	%f15,	%f15,	%f21
	movrlz	%l2,	0x256,	%i1
	mulscc	%o1,	0x1A91,	%o5
	movgu	%icc,	%i3,	%g7
	srlx	%o4,	0x18,	%l0
	mulx	%l6,	0x0B2E,	%i0
	edge16ln	%i4,	%g3,	%g2
	movneg	%xcc,	%l3,	%l4
	fornot2s	%f9,	%f24,	%f24
	move	%icc,	%g5,	%i2
	fcmpgt16	%f22,	%f24,	%i5
	movrgez	%l5,	0x3B0,	%g1
	movcs	%xcc,	%i6,	%o7
	edge8	%o3,	%g4,	%o2
	xnor	%g6,	%o6,	%l1
	edge8n	%o0,	%l2,	%i1
	fpmerge	%f29,	%f23,	%f2
	for	%f20,	%f0,	%f28
	stb	%i7,	[%l7 + 0x26]
	movn	%icc,	%o1,	%o5
	edge16n	%i3,	%g7,	%o4
	movleu	%icc,	%l0,	%l6
	ld	[%l7 + 0x24],	%f15
	fpackfix	%f4,	%f19
	orncc	%i4,	%i0,	%g3
	fmovdl	%xcc,	%f22,	%f16
	mulx	%g2,	0x0A62,	%l4
	srl	%l3,	%g5,	%i2
	fmovdleu	%icc,	%f18,	%f14
	mulscc	%i5,	0x1502,	%g1
	fmovsl	%xcc,	%f18,	%f3
	std	%f28,	[%l7 + 0x18]
	alignaddr	%l5,	%i6,	%o3
	fmovdgu	%icc,	%f16,	%f15
	movvs	%icc,	%g4,	%o7
	movleu	%icc,	%g6,	%o6
	sra	%l1,	0x03,	%o0
	fmovdcc	%xcc,	%f3,	%f23
	faligndata	%f8,	%f8,	%f16
	movrgez	%l2,	%i1,	%o2
	pdist	%f0,	%f14,	%f28
	sethi	0x0C82,	%o1
	std	%f30,	[%l7 + 0x68]
	lduh	[%l7 + 0x0E],	%i7
	sdivx	%i3,	0x1FBE,	%g7
	alignaddrl	%o4,	%l0,	%l6
	movrlez	%o5,	%i0,	%i4
	movrlez	%g2,	%g3,	%l3
	fcmpgt32	%f14,	%f6,	%l4
	edge8ln	%g5,	%i2,	%g1
	addcc	%i5,	%i6,	%o3
	fcmpeq32	%f28,	%f4,	%g4
	movrlz	%l5,	0x234,	%g6
	edge32n	%o7,	%l1,	%o6
	sir	0x089B
	stw	%l2,	[%l7 + 0x60]
	sethi	0x0403,	%i1
	xor	%o2,	%o1,	%o0
	movge	%xcc,	%i3,	%i7
	movpos	%xcc,	%o4,	%g7
	edge32	%l0,	%l6,	%o5
	fmovsn	%xcc,	%f12,	%f5
	nop
	set	0x08, %l6
	std	%f8,	[%l7 + %l6]
	movvs	%icc,	%i4,	%g2
	siam	0x0
	edge8l	%g3,	%l3,	%l4
	edge16n	%i0,	%i2,	%g1
	mulx	%i5,	%i6,	%g5
	ldd	[%l7 + 0x58],	%f28
	movvc	%xcc,	%o3,	%g4
	andn	%g6,	%o7,	%l5
	movge	%xcc,	%l1,	%l2
	nop
	set	0x60, %g5
	stx	%o6,	[%l7 + %g5]
	fmovsg	%icc,	%f19,	%f21
	fpadd16	%f20,	%f22,	%f2
	subccc	%o2,	%o1,	%o0
	add	%i1,	0x0FAD,	%i7
	or	%i3,	0x0211,	%o4
	sll	%g7,	%l6,	%l0
	stb	%o5,	[%l7 + 0x25]
	andcc	%i4,	%g2,	%g3
	array16	%l4,	%l3,	%i2
	fzero	%f18
	movl	%xcc,	%g1,	%i0
	save %i6, %i5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g5,	%g4
	addcc	%o7,	%g6,	%l5
	edge32	%l1,	%o6,	%l2
	sllx	%o2,	%o1,	%o0
	addc	%i7,	%i3,	%i1
	subccc	%o4,	%l6,	%l0
	std	%f20,	[%l7 + 0x50]
	sub	%o5,	%i4,	%g7
	movl	%icc,	%g2,	%g3
	fandnot2	%f18,	%f18,	%f28
	movcs	%icc,	%l4,	%i2
	srl	%l3,	0x1B,	%g1
	movpos	%xcc,	%i0,	%i5
	nop
	set	0x30, %o5
	ldx	[%l7 + %o5],	%o3
	movleu	%xcc,	%i6,	%g4
	smul	%g5,	%o7,	%g6
	alignaddrl	%l5,	%l1,	%o6
	fmovsl	%icc,	%f19,	%f26
	alignaddr	%o2,	%l2,	%o0
	edge32	%o1,	%i7,	%i1
	sll	%i3,	%o4,	%l6
	orncc	%l0,	0x1B6C,	%i4
	sll	%o5,	0x1D,	%g2
	sub	%g3,	%g7,	%i2
	fpsub32	%f4,	%f4,	%f24
	std	%f18,	[%l7 + 0x68]
	edge16l	%l4,	%g1,	%i0
	array16	%i5,	%l3,	%i6
	movvc	%icc,	%o3,	%g5
	fmovrde	%o7,	%f12,	%f12
	fpackfix	%f20,	%f10
	movne	%xcc,	%g6,	%g4
	sub	%l5,	0x15B9,	%o6
	edge8ln	%o2,	%l2,	%o0
	std	%f12,	[%l7 + 0x78]
	edge32ln	%l1,	%o1,	%i7
	subc	%i1,	%o4,	%l6
	fnands	%f22,	%f9,	%f6
	fone	%f20
	mulx	%i3,	%l0,	%o5
	edge32	%i4,	%g2,	%g3
	fmovsvc	%xcc,	%f22,	%f1
	stx	%i2,	[%l7 + 0x50]
	fsrc1s	%f12,	%f27
	ldub	[%l7 + 0x0B],	%g7
	ldub	[%l7 + 0x3A],	%g1
	movl	%icc,	%l4,	%i5
	alignaddr	%l3,	%i0,	%o3
	smulcc	%g5,	0x0F6D,	%o7
	fmovrsgez	%i6,	%f17,	%f28
	smul	%g4,	0x0D41,	%l5
	udivx	%o6,	0x18C7,	%g6
	movrne	%l2,	%o2,	%o0
	fors	%f13,	%f0,	%f0
	fmovrdlez	%o1,	%f16,	%f18
	ldsb	[%l7 + 0x2C],	%i7
	udiv	%l1,	0x1E4F,	%o4
	fmul8sux16	%f2,	%f30,	%f2
	fones	%f22
	smulcc	%i1,	0x1C86,	%i3
	srlx	%l0,	%l6,	%i4
	fmovrslez	%g2,	%f4,	%f4
	movvs	%xcc,	%g3,	%o5
	fnot1s	%f11,	%f18
	mulx	%i2,	%g1,	%g7
	edge32l	%l4,	%i5,	%i0
	xnor	%l3,	%o3,	%o7
	lduh	[%l7 + 0x64],	%g5
	xorcc	%i6,	0x013B,	%l5
	edge16	%g4,	%o6,	%g6
	edge8	%o2,	%o0,	%l2
	fmovdleu	%icc,	%f15,	%f24
	movrgz	%o1,	0x22B,	%l1
	srlx	%i7,	0x02,	%o4
	edge16l	%i1,	%i3,	%l6
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%l0
	mulscc	%g2,	0x05ED,	%g3
	andn	%o5,	%i4,	%g1
	edge8l	%g7,	%i2,	%l4
	save %i5, 0x1FCE, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x68],	%l3
	fnors	%f8,	%f3,	%f31
	sllx	%o7,	%g5,	%o3
	stw	%l5,	[%l7 + 0x64]
	move	%xcc,	%i6,	%g4
	edge32	%g6,	%o6,	%o0
	for	%f8,	%f26,	%f12
	fmovsl	%icc,	%f1,	%f12
	srlx	%o2,	%l2,	%o1
	bshuffle	%f0,	%f6,	%f20
	fmovdg	%xcc,	%f9,	%f31
	mova	%icc,	%i7,	%l1
	ld	[%l7 + 0x20],	%f16
	alignaddr	%i1,	%i3,	%l6
	srlx	%o4,	%g2,	%g3
	save %l0, 0x07D3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o5,	%g1,	%g7
	move	%icc,	%i2,	%l4
	ld	[%l7 + 0x2C],	%f21
	sir	0x17CF
	smul	%i5,	%i0,	%o7
	addccc	%l3,	%o3,	%g5
	movg	%icc,	%l5,	%i6
	fmovsgu	%icc,	%f29,	%f6
	addccc	%g4,	%o6,	%o0
	smul	%o2,	0x1D57,	%l2
	fmovde	%icc,	%f31,	%f20
	movl	%icc,	%o1,	%g6
	udivcc	%l1,	0x0816,	%i1
	stx	%i7,	[%l7 + 0x38]
	andn	%l6,	0x0448,	%o4
	sdivx	%i3,	0x0FEE,	%g2
	fandnot1s	%f28,	%f14,	%f12
	save %g3, 0x09F6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o5,	%i4,	%g7
	orcc	%g1,	%l4,	%i5
	ldd	[%l7 + 0x50],	%i0
	movcc	%icc,	%o7,	%i2
	fandnot2	%f22,	%f20,	%f4
	edge8n	%l3,	%o3,	%l5
	fpsub32s	%f23,	%f21,	%f6
	orn	%i6,	%g4,	%o6
	movre	%g5,	%o2,	%o0
	edge16ln	%o1,	%g6,	%l1
	std	%f0,	[%l7 + 0x08]
	movn	%xcc,	%i1,	%l2
	ldub	[%l7 + 0x4F],	%l6
	popc	0x0484,	%i7
	fmovsl	%xcc,	%f31,	%f29
	fmovdn	%xcc,	%f24,	%f7
	lduh	[%l7 + 0x58],	%o4
	fmovs	%f10,	%f16
	udivx	%g2,	0x11CD,	%g3
	ldx	[%l7 + 0x10],	%i3
	ldub	[%l7 + 0x58],	%o5
	movneg	%icc,	%l0,	%i4
	srax	%g1,	%l4,	%g7
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	or	%l3,	0x1A63,	%o3
	movge	%icc,	%l5,	%o7
	ldsb	[%l7 + 0x44],	%g4
	lduw	[%l7 + 0x10],	%i6
	fpsub32	%f22,	%f16,	%f30
	fcmple32	%f4,	%f12,	%o6
	movl	%xcc,	%g5,	%o0
	lduw	[%l7 + 0x50],	%o2
	edge8n	%g6,	%l1,	%o1
	sdivcc	%i1,	0x00D2,	%l6
	fpadd16s	%f11,	%f6,	%f24
	fmovdcs	%xcc,	%f21,	%f11
	addcc	%l2,	%o4,	%i7
	movne	%xcc,	%g2,	%g3
	fxnors	%f3,	%f1,	%f5
	sllx	%i3,	0x0D,	%o5
	fmovsl	%xcc,	%f13,	%f0
	sub	%i4,	0x1216,	%g1
	fmovdg	%xcc,	%f29,	%f9
	fmovsvs	%icc,	%f10,	%f15
	ldd	[%l7 + 0x58],	%f8
	stx	%l0,	[%l7 + 0x10]
	ldsb	[%l7 + 0x34],	%l4
	movvs	%icc,	%i5,	%i0
	ldsh	[%l7 + 0x66],	%i2
	lduh	[%l7 + 0x54],	%l3
	sth	%g7,	[%l7 + 0x3A]
	fornot2	%f4,	%f12,	%f24
	alignaddr	%l5,	%o7,	%g4
	edge16	%i6,	%o6,	%g5
	xnorcc	%o3,	%o2,	%o0
	alignaddr	%g6,	%o1,	%i1
	fnand	%f4,	%f0,	%f0
	ld	[%l7 + 0x68],	%f11
	alignaddrl	%l1,	%l2,	%l6
	movvc	%xcc,	%i7,	%o4
	edge16n	%g2,	%g3,	%o5
	ldub	[%l7 + 0x1D],	%i4
	popc	%g1,	%i3
	subc	%l4,	0x125B,	%i5
	edge32	%i0,	%i2,	%l0
	fmovscs	%icc,	%f14,	%f10
	fxnor	%f16,	%f10,	%f14
	smul	%g7,	0x022A,	%l5
	smulcc	%l3,	0x0BDE,	%g4
	movcc	%xcc,	%i6,	%o6
	ldd	[%l7 + 0x60],	%g4
	edge32ln	%o3,	%o2,	%o7
	edge32l	%o0,	%g6,	%i1
	movgu	%xcc,	%o1,	%l2
	movg	%icc,	%l6,	%l1
	lduh	[%l7 + 0x32],	%i7
	smulcc	%g2,	%o4,	%g3
	udivx	%o5,	0x09F9,	%i4
	smulcc	%g1,	%l4,	%i5
	lduh	[%l7 + 0x52],	%i0
	popc	%i3,	%l0
	sdivx	%g7,	0x152B,	%i2
	stw	%l5,	[%l7 + 0x34]
	subc	%l3,	%i6,	%o6
	move	%icc,	%g4,	%g5
	add	%o2,	%o7,	%o3
	ldsb	[%l7 + 0x49],	%g6
	ldd	[%l7 + 0x20],	%f24
	movre	%i1,	%o0,	%o1
	fcmple16	%f0,	%f28,	%l2
	movg	%icc,	%l1,	%i7
	ld	[%l7 + 0x70],	%f3
	smul	%l6,	%o4,	%g3
	movne	%icc,	%g2,	%o5
	movcs	%xcc,	%g1,	%i4
	andcc	%l4,	%i5,	%i0
	sethi	0x198B,	%i3
	fcmps	%fcc1,	%f14,	%f11
	mova	%xcc,	%l0,	%i2
	movne	%xcc,	%g7,	%l5
	movrgz	%l3,	%i6,	%g4
	srl	%o6,	0x02,	%g5
	alignaddr	%o2,	%o7,	%g6
	addcc	%o3,	0x03DD,	%i1
	fpadd16s	%f28,	%f26,	%f3
	orcc	%o1,	%l2,	%l1
	ldd	[%l7 + 0x60],	%i6
	fcmple32	%f2,	%f0,	%o0
	umul	%o4,	%l6,	%g2
	movre	%o5,	%g3,	%g1
	addccc	%l4,	0x0C34,	%i5
	fpadd16	%f2,	%f16,	%f14
	sethi	0x05C3,	%i4
	smul	%i0,	0x09E2,	%l0
	alignaddr	%i3,	%g7,	%l5
	movrlez	%i2,	0x2C8,	%l3
	fmovdneg	%xcc,	%f20,	%f21
	ldsh	[%l7 + 0x26],	%g4
	andn	%o6,	0x16A5,	%g5
	umul	%i6,	%o2,	%g6
	fmovrsne	%o3,	%f21,	%f28
	addccc	%i1,	0x10EF,	%o1
	movn	%xcc,	%l2,	%l1
	fsrc2s	%f9,	%f13
	movrlez	%i7,	%o7,	%o0
	fmovdgu	%icc,	%f31,	%f28
	restore %o4, %g2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l6,	%g3,	%g1
	nop
	set	0x44, %g7
	ldsh	[%l7 + %g7],	%l4
	sir	0x168C
	fmovrdgz	%i4,	%f30,	%f22
	sub	%i0,	0x0AE9,	%l0
	fnand	%f26,	%f8,	%f12
	sdiv	%i3,	0x0E63,	%g7
	addc	%i5,	%i2,	%l3
	std	%f2,	[%l7 + 0x70]
	edge8l	%g4,	%o6,	%g5
	sdivcc	%l5,	0x0976,	%o2
	add	%i6,	0x1C3E,	%g6
	ldsb	[%l7 + 0x26],	%i1
	stx	%o3,	[%l7 + 0x40]
	add	%l2,	0x083D,	%l1
	movre	%o1,	%i7,	%o7
	srlx	%o4,	%g2,	%o5
	udiv	%l6,	0x1BF7,	%g3
	fmovs	%f25,	%f22
	lduw	[%l7 + 0x4C],	%o0
	movrgz	%l4,	%g1,	%i0
	for	%f2,	%f28,	%f10
	umulcc	%i4,	%i3,	%l0
	fmovsl	%xcc,	%f31,	%f6
	andn	%i5,	%g7,	%l3
	movrgez	%g4,	0x066,	%o6
	andcc	%g5,	%l5,	%o2
	fcmpne32	%f24,	%f10,	%i6
	srl	%i2,	%i1,	%g6
	movrne	%l2,	%l1,	%o1
	movcs	%xcc,	%o3,	%o7
	nop
	set	0x58, %i1
	std	%f10,	[%l7 + %i1]
	nop
	set	0x08, %g4
	ldd	[%l7 + %g4],	%o4
	movle	%icc,	%i7,	%g2
	fmovrdne	%l6,	%f28,	%f0
	alignaddr	%g3,	%o5,	%l4
	fpadd16	%f16,	%f18,	%f14
	fands	%f26,	%f7,	%f19
	movrlez	%g1,	%o0,	%i4
	fnegs	%f7,	%f27
	movrlez	%i3,	%i0,	%i5
	alignaddr	%l0,	%g7,	%g4
	srlx	%o6,	0x19,	%g5
	addcc	%l3,	%l5,	%i6
	lduh	[%l7 + 0x12],	%i2
	fpadd16	%f30,	%f6,	%f22
	ldub	[%l7 + 0x5C],	%i1
	edge8	%o2,	%g6,	%l2
	xnorcc	%o1,	%o3,	%o7
	xnor	%l1,	0x08D4,	%o4
	sdiv	%g2,	0x1546,	%l6
	ld	[%l7 + 0x74],	%f9
	movrlez	%g3,	%i7,	%l4
	fornot2s	%f5,	%f31,	%f28
	subc	%g1,	0x0A84,	%o5
	movgu	%xcc,	%i4,	%i3
	edge8l	%i0,	%i5,	%o0
	edge8n	%l0,	%g7,	%g4
	fpadd32s	%f28,	%f20,	%f1
	movre	%g5,	0x0A3,	%l3
	andn	%o6,	0x1E79,	%l5
	std	%f4,	[%l7 + 0x08]
	movne	%icc,	%i6,	%i1
	movneg	%xcc,	%o2,	%i2
	fmuld8ulx16	%f16,	%f29,	%f8
	andcc	%l2,	%o1,	%o3
	fmovda	%icc,	%f17,	%f11
	movvs	%xcc,	%o7,	%l1
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	stb	%l6,	[%l7 + 0x79]
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%g3
	movleu	%xcc,	%g6,	%i7
	lduh	[%l7 + 0x5E],	%g1
	xor	%o5,	0x02DD,	%l4
	sdivx	%i3,	0x008D,	%i0
	smulcc	%i4,	%i5,	%l0
	stx	%g7,	[%l7 + 0x60]
	fornot1s	%f6,	%f19,	%f11
	ldd	[%l7 + 0x10],	%f4
	fmovrslz	%o0,	%f21,	%f1
	fmovsn	%icc,	%f1,	%f18
	sdiv	%g4,	0x09BB,	%l3
	xnor	%g5,	%o6,	%i6
	andcc	%l5,	%o2,	%i2
	movvc	%xcc,	%l2,	%i1
	edge32ln	%o3,	%o7,	%o1
	nop
	set	0x38, %i2
	stx	%l1,	[%l7 + %i2]
	movpos	%icc,	%g2,	%l6
	edge16n	%g3,	%g6,	%o4
	addccc	%g1,	0x1BC5,	%o5
	fcmpne16	%f30,	%f30,	%l4
	fmovrslz	%i7,	%f22,	%f19
	ldsw	[%l7 + 0x30],	%i3
	fcmpeq16	%f18,	%f28,	%i4
	movge	%xcc,	%i0,	%i5
	move	%icc,	%l0,	%g7
	srl	%o0,	%l3,	%g5
	fornot2	%f20,	%f22,	%f28
	stx	%o6,	[%l7 + 0x50]
	stb	%i6,	[%l7 + 0x64]
	edge8l	%g4,	%l5,	%o2
	subccc	%l2,	0x0149,	%i2
	restore %o3, 0x1815, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f26,	%f24
	srax	%o1,	0x05,	%l1
	fcmpd	%fcc0,	%f22,	%f4
	umul	%o7,	%g2,	%g3
	movleu	%icc,	%l6,	%o4
	ld	[%l7 + 0x5C],	%f0
	movle	%xcc,	%g1,	%g6
	udiv	%o5,	0x100D,	%i7
	andcc	%l4,	%i3,	%i0
	udivx	%i5,	0x114C,	%l0
	fabss	%f20,	%f28
	sra	%g7,	0x1C,	%i4
	lduw	[%l7 + 0x58],	%o0
	fandnot2s	%f0,	%f6,	%f27
	array8	%l3,	%o6,	%g5
	srlx	%g4,	0x06,	%l5
	lduh	[%l7 + 0x4C],	%i6
	fmovdcc	%icc,	%f7,	%f1
	fnot2	%f22,	%f22
	sllx	%o2,	%i2,	%o3
	fmovdgu	%xcc,	%f4,	%f12
	ldsb	[%l7 + 0x7E],	%l2
	alignaddr	%i1,	%o1,	%o7
	edge8ln	%g2,	%g3,	%l1
	umulcc	%l6,	%o4,	%g1
	edge8ln	%o5,	%i7,	%l4
	stx	%g6,	[%l7 + 0x68]
	edge16	%i0,	%i3,	%l0
	ldd	[%l7 + 0x18],	%f28
	ldsb	[%l7 + 0x5E],	%g7
	fcmpeq32	%f16,	%f12,	%i4
	movneg	%xcc,	%o0,	%i5
	edge32l	%o6,	%g5,	%g4
	movvc	%xcc,	%l5,	%l3
	ldd	[%l7 + 0x50],	%f14
	save %i6, 0x11A5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i2,	%l2,	%i1
	movrlez	%o1,	0x33C,	%o7
	edge8l	%o3,	%g3,	%g2
	ldsh	[%l7 + 0x62],	%l1
	fmovda	%xcc,	%f20,	%f4
	addcc	%o4,	0x01AA,	%l6
	orncc	%g1,	0x0ACD,	%o5
	fmovspos	%xcc,	%f23,	%f7
	edge32l	%l4,	%g6,	%i7
	movrgez	%i3,	0x39B,	%i0
	fxnor	%f26,	%f10,	%f14
	fands	%f1,	%f21,	%f1
	stw	%l0,	[%l7 + 0x7C]
	mova	%xcc,	%i4,	%g7
	subcc	%o0,	%i5,	%o6
	edge32ln	%g4,	%g5,	%l3
	xnorcc	%i6,	0x1AFD,	%l5
	array8	%i2,	%l2,	%i1
	std	%f28,	[%l7 + 0x18]
	save %o2, 0x188C, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x2A],	%o3
	mulscc	%g3,	0x177A,	%o1
	fzeros	%f1
	fmovdvc	%icc,	%f26,	%f28
	orncc	%g2,	%l1,	%l6
	edge8n	%g1,	%o4,	%l4
	mulscc	%o5,	0x19C0,	%i7
	edge32ln	%g6,	%i3,	%l0
	edge16n	%i4,	%i0,	%o0
	sll	%i5,	%o6,	%g4
	andn	%g5,	%l3,	%i6
	fpadd32s	%f30,	%f31,	%f10
	ldub	[%l7 + 0x35],	%l5
	edge32n	%i2,	%g7,	%i1
	edge32n	%l2,	%o7,	%o3
	movn	%icc,	%o2,	%g3
	edge32ln	%g2,	%l1,	%o1
	umulcc	%l6,	%o4,	%g1
	edge8	%o5,	%l4,	%g6
	movle	%icc,	%i7,	%l0
	subc	%i3,	%i4,	%i0
	ldx	[%l7 + 0x28],	%i5
	movrne	%o0,	%g4,	%g5
	ldx	[%l7 + 0x50],	%l3
	movvc	%icc,	%i6,	%l5
	fmovspos	%icc,	%f18,	%f28
	fmovsvs	%icc,	%f23,	%f11
	edge16ln	%o6,	%i2,	%i1
	smulcc	%g7,	0x006B,	%l2
	fxor	%f6,	%f10,	%f16
	sdiv	%o3,	0x1263,	%o2
	stw	%g3,	[%l7 + 0x68]
	movvs	%icc,	%o7,	%g2
	movrne	%o1,	0x041,	%l6
	srax	%o4,	0x1D,	%g1
	mulscc	%l1,	0x1016,	%o5
	movrlz	%g6,	%l4,	%l0
	fmovrslez	%i3,	%f8,	%f16
	xnor	%i7,	0x137F,	%i4
	movrlz	%i5,	0x150,	%i0
	andcc	%o0,	%g4,	%l3
	fandnot1	%f8,	%f14,	%f4
	lduw	[%l7 + 0x38],	%i6
	addcc	%l5,	%o6,	%i2
	fornot2	%f16,	%f30,	%f8
	movrlz	%i1,	0x0D3,	%g7
	movpos	%icc,	%l2,	%g5
	ldx	[%l7 + 0x28],	%o3
	fcmpne32	%f26,	%f22,	%o2
	fmovrsgez	%g3,	%f28,	%f0
	stx	%g2,	[%l7 + 0x68]
	fsrc2	%f4,	%f24
	xor	%o7,	0x17DC,	%l6
	edge8	%o1,	%g1,	%l1
	fmovsge	%icc,	%f29,	%f3
	movre	%o4,	0x2AE,	%o5
	sra	%g6,	%l0,	%l4
	edge16n	%i3,	%i4,	%i7
	lduh	[%l7 + 0x0C],	%i5
	orn	%o0,	%i0,	%g4
	orcc	%i6,	0x0001,	%l3
	edge32n	%o6,	%l5,	%i1
	fmovrsgz	%g7,	%f13,	%f31
	fmovdpos	%icc,	%f10,	%f20
	fpsub32s	%f27,	%f15,	%f0
	udivcc	%i2,	0x0DEF,	%l2
	for	%f18,	%f16,	%f6
	bshuffle	%f6,	%f24,	%f30
	edge8ln	%g5,	%o3,	%g3
	orcc	%o2,	0x15C8,	%g2
	sdiv	%o7,	0x1131,	%o1
	fmovdle	%xcc,	%f18,	%f10
	fmovde	%icc,	%f22,	%f8
	subccc	%g1,	%l1,	%l6
	ldx	[%l7 + 0x78],	%o4
	fmovsvs	%icc,	%f23,	%f18
	array32	%g6,	%l0,	%o5
	smul	%l4,	%i4,	%i7
	mova	%xcc,	%i3,	%o0
	ldsh	[%l7 + 0x40],	%i5
	std	%f14,	[%l7 + 0x50]
	and	%i0,	%g4,	%i6
	addcc	%o6,	0x1F6D,	%l5
	udiv	%i1,	0x08A3,	%g7
	ldd	[%l7 + 0x60],	%i2
	fcmpne32	%f18,	%f20,	%l3
	srlx	%g5,	%o3,	%l2
	ldsb	[%l7 + 0x5B],	%o2
	fpmerge	%f25,	%f4,	%f14
	movrgz	%g2,	0x22E,	%o7
	fandnot2s	%f7,	%f12,	%f1
	movn	%icc,	%o1,	%g1
	sra	%l1,	0x12,	%l6
	orncc	%g3,	%o4,	%l0
	movge	%icc,	%o5,	%g6
	fmovde	%xcc,	%f26,	%f11
	sth	%l4,	[%l7 + 0x18]
	edge32ln	%i4,	%i7,	%o0
	movvs	%xcc,	%i5,	%i3
	fmovsn	%xcc,	%f27,	%f14
	edge16n	%i0,	%i6,	%g4
	smulcc	%o6,	%i1,	%g7
	siam	0x1
	fmovsleu	%icc,	%f31,	%f10
	ldx	[%l7 + 0x38],	%l5
	edge16l	%l3,	%i2,	%o3
	orcc	%g5,	%l2,	%o2
	ldsw	[%l7 + 0x44],	%o7
	movn	%icc,	%g2,	%o1
	fmovdpos	%icc,	%f21,	%f25
	st	%f26,	[%l7 + 0x70]
	sllx	%g1,	%l6,	%l1
	ldsw	[%l7 + 0x50],	%g3
	addc	%o4,	0x032F,	%o5
	fnegd	%f20,	%f30
	save %l0, %l4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g6,	0x1CA2,	%o0
	udivcc	%i5,	0x0067,	%i3
	xorcc	%i7,	0x1D0D,	%i0
	edge16n	%i6,	%g4,	%i1
	movre	%g7,	0x282,	%l5
	movrgz	%l3,	0x1FC,	%o6
	sethi	0x1B24,	%i2
	alignaddrl	%g5,	%o3,	%o2
	smul	%o7,	%g2,	%o1
	xor	%g1,	%l6,	%l1
	movrlz	%l2,	0x08F,	%g3
	fsrc1	%f2,	%f16
	sir	0x0D26
	pdist	%f0,	%f12,	%f22
	movleu	%xcc,	%o5,	%o4
	orncc	%l0,	0x13C4,	%l4
	andncc	%g6,	%o0,	%i4
	fmovscc	%xcc,	%f7,	%f16
	orn	%i5,	0x020E,	%i3
	udivcc	%i7,	0x0574,	%i6
	edge32l	%i0,	%g4,	%i1
	movn	%icc,	%l5,	%g7
	xor	%o6,	0x1FB2,	%l3
	movrlz	%i2,	%g5,	%o2
	fnot1	%f10,	%f6
	movg	%icc,	%o3,	%g2
	ldub	[%l7 + 0x35],	%o7
	ldsb	[%l7 + 0x21],	%o1
	lduw	[%l7 + 0x5C],	%l6
	orncc	%l1,	0x13A5,	%l2
	addcc	%g1,	0x0B2B,	%g3
	sub	%o4,	0x12F4,	%l0
	fmovdgu	%xcc,	%f27,	%f25
	and	%o5,	0x0482,	%l4
	smulcc	%g6,	0x1548,	%o0
	ldd	[%l7 + 0x50],	%i4
	fpackfix	%f20,	%f18
	movvc	%xcc,	%i4,	%i7
	save %i3, 0x0E07, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i6,	0x391,	%i1
	edge16ln	%g4,	%g7,	%o6
	orn	%l5,	%l3,	%g5
	udivx	%i2,	0x1BAC,	%o3
	movrlez	%o2,	%g2,	%o1
	xorcc	%l6,	0x16CD,	%l1
	smulcc	%l2,	%o7,	%g3
	move	%xcc,	%o4,	%g1
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	xorcc	%l0,	%g6,	%o0
	fpack32	%f8,	%f20,	%f4
	udivx	%i5,	0x09DE,	%i7
	sethi	0x09C5,	%i4
	xorcc	%i3,	0x1CF5,	%i6
	edge32	%i0,	%i1,	%g7
	sllx	%g4,	0x06,	%o6
	ld	[%l7 + 0x1C],	%f10
	ldsw	[%l7 + 0x68],	%l3
	andn	%l5,	0x0DF6,	%g5
	movrgz	%o3,	%i2,	%g2
	nop
	set	0x16, %i7
	lduh	[%l7 + %i7],	%o1
	umulcc	%l6,	0x0D3F,	%o2
	fmovs	%f28,	%f22
	mulscc	%l2,	%l1,	%g3
	ldub	[%l7 + 0x70],	%o4
	movrlez	%o7,	0x209,	%g1
	stw	%l4,	[%l7 + 0x5C]
	xnor	%l0,	0x1955,	%o5
	fxnors	%f12,	%f0,	%f27
	udiv	%g6,	0x01D5,	%o0
	fmovdg	%icc,	%f15,	%f28
	ldsw	[%l7 + 0x10],	%i7
	ldsh	[%l7 + 0x7A],	%i4
	sra	%i5,	0x1B,	%i3
	ldub	[%l7 + 0x27],	%i6
	movge	%icc,	%i0,	%i1
	sub	%g4,	%g7,	%o6
	add	%l5,	0x0BC7,	%g5
	save %l3, %i2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%o3,	%f18,	%f8
	fmovsg	%xcc,	%f0,	%f21
	array8	%l6,	%o1,	%l2
	sdivx	%l1,	0x0E27,	%g3
	add	%o2,	%o7,	%o4
	ldd	[%l7 + 0x68],	%f18
	orncc	%l4,	%g1,	%o5
	fors	%f2,	%f5,	%f25
	addc	%l0,	%g6,	%o0
	subc	%i4,	%i5,	%i7
	sdivcc	%i3,	0x0A46,	%i6
	sll	%i0,	%g4,	%i1
	addc	%g7,	0x1862,	%o6
	fmul8x16al	%f11,	%f3,	%f0
	array16	%g5,	%l5,	%l3
	move	%xcc,	%i2,	%g2
	ldsh	[%l7 + 0x60],	%l6
	ldx	[%l7 + 0x70],	%o1
	srl	%l2,	0x1C,	%o3
	fexpand	%f14,	%f6
	addccc	%g3,	%l1,	%o2
	movle	%xcc,	%o7,	%l4
	fmovde	%xcc,	%f27,	%f0
	andncc	%g1,	%o5,	%l0
	stb	%o4,	[%l7 + 0x4B]
	orn	%o0,	%g6,	%i4
	fmovdge	%icc,	%f18,	%f26
	fsrc1s	%f5,	%f2
	umulcc	%i7,	0x107F,	%i5
	ld	[%l7 + 0x4C],	%f16
	mulx	%i3,	%i6,	%i0
	xorcc	%g4,	%i1,	%g7
	movrgz	%g5,	%l5,	%l3
	sdiv	%i2,	0x01F4,	%g2
	srl	%o6,	0x1A,	%l6
	st	%f18,	[%l7 + 0x3C]
	fmovrsgez	%o1,	%f26,	%f30
	subccc	%o3,	%g3,	%l2
	array16	%o2,	%l1,	%o7
	xnor	%l4,	0x1A7A,	%g1
	sdivx	%l0,	0x0002,	%o4
	lduw	[%l7 + 0x24],	%o5
	add	%o0,	%i4,	%g6
	fsrc2	%f2,	%f24
	orncc	%i5,	0x1D6D,	%i7
	sir	0x1931
	fmovdgu	%xcc,	%f26,	%f6
	sra	%i3,	0x08,	%i6
	st	%f15,	[%l7 + 0x48]
	ldsh	[%l7 + 0x3C],	%g4
	stw	%i1,	[%l7 + 0x14]
	addccc	%i0,	%g7,	%g5
	fnot2	%f0,	%f14
	movleu	%icc,	%l5,	%l3
	fpackfix	%f12,	%f2
	add	%g2,	%i2,	%l6
	fmovrslez	%o6,	%f20,	%f6
	fmovsa	%icc,	%f7,	%f25
	edge16n	%o1,	%g3,	%l2
	fxnor	%f12,	%f26,	%f16
	movpos	%xcc,	%o2,	%l1
	lduh	[%l7 + 0x28],	%o7
	fcmpgt16	%f8,	%f20,	%o3
	lduw	[%l7 + 0x08],	%l4
	orcc	%l0,	%o4,	%g1
	nop
	set	0x08, %o0
	lduw	[%l7 + %o0],	%o5
	edge32l	%i4,	%o0,	%g6
	ldd	[%l7 + 0x30],	%i4
	subcc	%i3,	0x149C,	%i7
	umulcc	%g4,	0x110C,	%i1
	fors	%f20,	%f6,	%f22
	std	%f24,	[%l7 + 0x50]
	orcc	%i6,	%i0,	%g7
	fmul8x16	%f5,	%f14,	%f14
	sdivcc	%l5,	0x0B56,	%g5
	movpos	%xcc,	%l3,	%g2
	andncc	%i2,	%o6,	%o1
	sllx	%g3,	%l2,	%l6
	movpos	%icc,	%l1,	%o7
	sdiv	%o3,	0x1E08,	%l4
	fmul8sux16	%f22,	%f16,	%f14
	array32	%o2,	%l0,	%g1
	and	%o4,	%o5,	%o0
	movcc	%icc,	%g6,	%i5
	edge16ln	%i3,	%i7,	%g4
	subccc	%i1,	0x0146,	%i4
	subcc	%i0,	0x056D,	%i6
	edge32	%g7,	%l5,	%g5
	fmovdcs	%icc,	%f8,	%f1
	orncc	%g2,	%l3,	%o6
	smul	%i2,	%g3,	%l2
	and	%o1,	0x1944,	%l6
	fmovdneg	%icc,	%f23,	%f2
	movcs	%xcc,	%l1,	%o3
	sdivx	%o7,	0x040A,	%l4
	edge16	%l0,	%o2,	%g1
	edge8n	%o5,	%o4,	%o0
	fnands	%f28,	%f1,	%f2
	edge8	%g6,	%i3,	%i5
	movvc	%xcc,	%i7,	%g4
	mova	%icc,	%i1,	%i0
	fands	%f14,	%f13,	%f25
	udivcc	%i4,	0x05F6,	%g7
	sll	%i6,	0x03,	%g5
	edge16n	%l5,	%g2,	%l3
	sdiv	%o6,	0x0EB0,	%g3
	edge8ln	%i2,	%o1,	%l6
	edge8	%l1,	%l2,	%o3
	fcmpgt16	%f4,	%f22,	%l4
	fpackfix	%f26,	%f28
	edge16l	%l0,	%o2,	%o7
	movvs	%xcc,	%g1,	%o4
	fmovsneg	%xcc,	%f21,	%f19
	xorcc	%o0,	0x08D5,	%o5
	fmovrse	%g6,	%f5,	%f25
	fzeros	%f2
	fxors	%f19,	%f4,	%f27
	movrgez	%i5,	0x003,	%i3
	restore %g4, %i7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f18,	%f4,	%i0
	stx	%g7,	[%l7 + 0x60]
	umul	%i4,	%i6,	%g5
	edge8l	%g2,	%l3,	%o6
	alignaddrl	%g3,	%l5,	%i2
	ldd	[%l7 + 0x08],	%f2
	sdivcc	%l6,	0x0C61,	%o1
	orn	%l2,	0x185A,	%l1
	sub	%l4,	%o3,	%o2
	ldx	[%l7 + 0x20],	%l0
	std	%f12,	[%l7 + 0x08]
	mova	%xcc,	%g1,	%o4
	umulcc	%o7,	%o5,	%o0
	fmovdle	%xcc,	%f5,	%f30
	movne	%icc,	%i5,	%g6
	movrgez	%i3,	%i7,	%i1
	fnand	%f10,	%f8,	%f10
	fmovda	%xcc,	%f27,	%f3
	subc	%g4,	%g7,	%i4
	st	%f8,	[%l7 + 0x2C]
	sir	0x10B9
	sub	%i6,	0x0089,	%g5
	udivcc	%g2,	0x1B9C,	%l3
	fnot2	%f14,	%f12
	fcmpgt32	%f0,	%f20,	%o6
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%f16
	andcc	%i0,	%g3,	%l5
	sllx	%i2,	0x0B,	%o1
	orncc	%l2,	0x1D92,	%l1
	movrgez	%l6,	%l4,	%o2
	sdivcc	%o3,	0x14FA,	%l0
	andcc	%o4,	0x0A0E,	%g1
	andncc	%o5,	%o7,	%o0
	fzero	%f0
	ldsw	[%l7 + 0x08],	%i5
	movle	%icc,	%g6,	%i3
	umul	%i7,	0x0D20,	%g4
	alignaddrl	%i1,	%g7,	%i6
	srl	%g5,	0x0D,	%g2
	ld	[%l7 + 0x14],	%f23
	fmovrslz	%l3,	%f7,	%f31
	movleu	%icc,	%o6,	%i4
	stw	%g3,	[%l7 + 0x54]
	addcc	%l5,	0x1B5E,	%i0
	edge16	%i2,	%l2,	%o1
	ldx	[%l7 + 0x78],	%l6
	orncc	%l1,	0x1792,	%l4
	sir	0x17C1
	fmovscs	%icc,	%f3,	%f19
	edge16n	%o3,	%o2,	%l0
	orn	%g1,	0x11B8,	%o5
	stx	%o7,	[%l7 + 0x30]
	movgu	%xcc,	%o4,	%i5
	srax	%g6,	0x08,	%o0
	movg	%xcc,	%i7,	%i3
	xnor	%g4,	%i1,	%g7
	movrne	%g5,	0x336,	%g2
	nop
	set	0x4C, %o1
	lduh	[%l7 + %o1],	%l3
	subcc	%o6,	0x13DB,	%i4
	sethi	0x1F83,	%g3
	udiv	%i6,	0x186D,	%l5
	addc	%i0,	%i2,	%o1
	srlx	%l6,	0x16,	%l2
	xor	%l1,	%o3,	%o2
	andn	%l0,	0x1AA7,	%l4
	edge8ln	%o5,	%g1,	%o7
	umulcc	%o4,	%i5,	%g6
	edge32l	%i7,	%i3,	%g4
	fmovrdlz	%o0,	%f24,	%f16
	movle	%xcc,	%i1,	%g5
	ld	[%l7 + 0x30],	%f12
	smulcc	%g2,	0x1E30,	%g7
	sth	%l3,	[%l7 + 0x24]
	movvs	%icc,	%i4,	%g3
	fcmpne32	%f14,	%f24,	%o6
	fnor	%f12,	%f16,	%f2
	fand	%f4,	%f24,	%f26
	alignaddr	%l5,	%i0,	%i6
	movrne	%o1,	%l6,	%l2
	or	%l1,	0x1059,	%i2
	edge8ln	%o3,	%l0,	%l4
	movneg	%xcc,	%o5,	%g1
	srl	%o2,	0x0B,	%o7
	fmul8x16	%f24,	%f18,	%f8
	popc	0x107E,	%i5
	movne	%xcc,	%g6,	%i7
	mulscc	%o4,	%i3,	%o0
	subccc	%i1,	0x1C21,	%g5
	fsrc1s	%f1,	%f16
	mulx	%g2,	%g4,	%l3
	sth	%g7,	[%l7 + 0x7A]
	movcs	%xcc,	%g3,	%o6
	mulx	%l5,	0x1BB2,	%i0
	fornot1s	%f17,	%f8,	%f28
	fsrc2	%f8,	%f6
	fpadd32	%f22,	%f10,	%f4
	fmovrdlez	%i6,	%f22,	%f28
	ldd	[%l7 + 0x20],	%i4
	movne	%icc,	%o1,	%l2
	srl	%l1,	%i2,	%l6
	movne	%xcc,	%l0,	%l4
	subc	%o3,	%g1,	%o2
	ldd	[%l7 + 0x08],	%o6
	movge	%xcc,	%i5,	%o5
	movrlez	%g6,	0x2C7,	%i7
	edge32l	%i3,	%o0,	%o4
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	subc	%g4,	%l3,	%g5
	umul	%g3,	%o6,	%l5
	sdivx	%i0,	0x1F68,	%g7
	udivcc	%i6,	0x0CCE,	%i4
	movcc	%icc,	%l2,	%o1
	andncc	%l1,	%i2,	%l0
	edge8ln	%l4,	%o3,	%l6
	ldsb	[%l7 + 0x7D],	%g1
	sdivcc	%o2,	0x003E,	%i5
	edge8l	%o5,	%o7,	%i7
	movpos	%xcc,	%i3,	%g6
	movcs	%icc,	%o0,	%o4
	movrgez	%g2,	0x2F5,	%i1
	fabss	%f3,	%f28
	fpack32	%f0,	%f2,	%f20
	movvs	%icc,	%l3,	%g5
	ldsb	[%l7 + 0x51],	%g3
	ldx	[%l7 + 0x60],	%o6
	movvs	%xcc,	%l5,	%g4
	fnor	%f18,	%f4,	%f20
	fcmple16	%f20,	%f24,	%i0
	movg	%icc,	%i6,	%g7
	nop
	set	0x60, %l5
	sth	%i4,	[%l7 + %l5]
	udiv	%o1,	0x0A67,	%l2
	umulcc	%l1,	%l0,	%i2
	movvs	%xcc,	%l4,	%l6
	popc	%o3,	%o2
	edge32	%i5,	%g1,	%o5
	edge32l	%i7,	%i3,	%g6
	addc	%o0,	%o7,	%o4
	st	%f16,	[%l7 + 0x18]
	addc	%i1,	%l3,	%g2
	ldsw	[%l7 + 0x1C],	%g5
	ldub	[%l7 + 0x70],	%o6
	movle	%xcc,	%g3,	%g4
	array8	%i0,	%l5,	%i6
	std	%f0,	[%l7 + 0x38]
	or	%g7,	0x1A3A,	%o1
	fmovdcs	%icc,	%f1,	%f6
	edge16ln	%i4,	%l1,	%l0
	xorcc	%i2,	0x0A8C,	%l4
	andncc	%l6,	%l2,	%o2
	fcmpgt32	%f8,	%f8,	%o3
	movre	%i5,	%g1,	%o5
	edge32n	%i3,	%g6,	%i7
	fands	%f6,	%f12,	%f29
	orn	%o0,	%o4,	%i1
	sir	0x1F68
	sdivcc	%l3,	0x0884,	%g2
	smulcc	%o7,	0x0F1A,	%g5
	sethi	0x0F1C,	%g3
	ld	[%l7 + 0x30],	%f22
	array16	%g4,	%o6,	%l5
	fmovscc	%xcc,	%f10,	%f0
	fmovsvs	%icc,	%f28,	%f23
	fmul8x16	%f30,	%f6,	%f12
	fnegs	%f14,	%f10
	fabsd	%f10,	%f6
	fxors	%f4,	%f23,	%f16
	xnor	%i0,	0x1CF1,	%g7
	movrgz	%o1,	%i4,	%i6
	sir	0x081D
	mova	%xcc,	%l0,	%i2
	movleu	%icc,	%l1,	%l4
	movre	%l2,	0x042,	%l6
	fxnors	%f24,	%f2,	%f3
	fandnot2s	%f0,	%f0,	%f25
	sethi	0x0C4D,	%o2
	fmovsge	%icc,	%f4,	%f4
	fmovdg	%icc,	%f28,	%f27
	fmovde	%icc,	%f23,	%f2
	sir	0x1C87
	orncc	%o3,	%i5,	%g1
	smul	%i3,	%o5,	%g6
	sllx	%i7,	%o4,	%o0
	ld	[%l7 + 0x64],	%f10
	fmovdgu	%icc,	%f26,	%f7
	movcc	%xcc,	%i1,	%l3
	ld	[%l7 + 0x70],	%f12
	movleu	%icc,	%o7,	%g2
	sllx	%g5,	%g3,	%o6
	movrgez	%l5,	0x0A4,	%g4
	orcc	%i0,	%o1,	%g7
	array8	%i4,	%i6,	%l0
	fsrc2	%f0,	%f30
	sra	%i2,	%l1,	%l4
	array16	%l2,	%o2,	%l6
	fmovrsgez	%i5,	%f26,	%f19
	umulcc	%g1,	0x0B2B,	%o3
	movge	%icc,	%o5,	%i3
	fmovdleu	%xcc,	%f18,	%f23
	faligndata	%f18,	%f14,	%f22
	umul	%i7,	%o4,	%o0
	srlx	%g6,	0x0C,	%l3
	edge16n	%o7,	%i1,	%g5
	fmovdn	%xcc,	%f30,	%f11
	xorcc	%g2,	%g3,	%o6
	addcc	%l5,	0x165F,	%g4
	fmovrse	%o1,	%f18,	%f10
	movle	%xcc,	%g7,	%i4
	udiv	%i6,	0x1606,	%i0
	ldsh	[%l7 + 0x40],	%l0
	ldsw	[%l7 + 0x60],	%l1
	and	%l4,	0x18DA,	%i2
	lduw	[%l7 + 0x74],	%o2
	xnor	%l2,	%i5,	%g1
	srlx	%o3,	%o5,	%i3
	fmovrdlz	%i7,	%f8,	%f8
	array32	%l6,	%o0,	%g6
	fornot1	%f6,	%f0,	%f10
	ldub	[%l7 + 0x79],	%o4
	andn	%o7,	%i1,	%l3
	movcc	%xcc,	%g2,	%g5
	srl	%o6,	0x19,	%g3
	fone	%f4
	alignaddr	%l5,	%g4,	%o1
	stx	%g7,	[%l7 + 0x38]
	fmul8x16au	%f13,	%f15,	%f18
	siam	0x7
	fmovrdne	%i6,	%f6,	%f8
	fmovsge	%icc,	%f29,	%f17
	fcmpne32	%f26,	%f8,	%i0
	movge	%xcc,	%i4,	%l0
	nop
	set	0x52, %l0
	ldsh	[%l7 + %l0],	%l1
	fmovdl	%xcc,	%f27,	%f1
	xnor	%l4,	0x17FA,	%i2
	ldsw	[%l7 + 0x0C],	%l2
	fmovs	%f6,	%f25
	movpos	%xcc,	%i5,	%o2
	stw	%g1,	[%l7 + 0x4C]
	edge8n	%o5,	%i3,	%o3
	std	%f0,	[%l7 + 0x50]
	fors	%f15,	%f4,	%f28
	movrgez	%l6,	%o0,	%g6
	sdivcc	%o4,	0x1908,	%o7
	move	%xcc,	%i7,	%l3
	array16	%g2,	%i1,	%g5
	ldsh	[%l7 + 0x7C],	%g3
	srlx	%l5,	%o6,	%g4
	fcmpeq16	%f14,	%f24,	%g7
	udiv	%i6,	0x03D8,	%i0
	fcmple32	%f4,	%f26,	%i4
	std	%f26,	[%l7 + 0x60]
	fmovd	%f10,	%f22
	stx	%o1,	[%l7 + 0x08]
	array16	%l1,	%l0,	%i2
	umulcc	%l2,	%l4,	%i5
	movcs	%xcc,	%g1,	%o5
	fmovrse	%i3,	%f20,	%f24
	save %o3, 0x15F5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%l6,	%o4
	orn	%o7,	0x1659,	%i7
	fpmerge	%f16,	%f22,	%f28
	edge32	%l3,	%g6,	%i1
	edge8l	%g5,	%g2,	%g3
	fpadd16s	%f8,	%f15,	%f31
	xor	%l5,	%g4,	%o6
	for	%f26,	%f0,	%f26
	edge8	%g7,	%i6,	%i0
	or	%o1,	%i4,	%l1
	movrne	%l0,	%i2,	%l4
	orn	%i5,	0x10A8,	%g1
	fpsub32s	%f10,	%f5,	%f23
	umul	%l2,	%o5,	%o3
	ldd	[%l7 + 0x08],	%f0
	ldx	[%l7 + 0x50],	%i3
	movcc	%icc,	%o2,	%l6
	restore %o0, 0x14C2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i7,	%l3
	movl	%icc,	%o7,	%i1
	andcc	%g5,	%g6,	%g3
	for	%f2,	%f24,	%f6
	nop
	set	0x61, %l3
	stb	%g2,	[%l7 + %l3]
	xorcc	%g4,	0x174F,	%o6
	fandnot1s	%f7,	%f17,	%f27
	addcc	%g7,	0x1194,	%l5
	movrgez	%i0,	%o1,	%i6
	lduh	[%l7 + 0x7A],	%l1
	lduh	[%l7 + 0x58],	%i4
	sdiv	%i2,	0x11A9,	%l0
	edge16l	%l4,	%i5,	%l2
	udivcc	%o5,	0x1CC5,	%g1
	srl	%i3,	%o2,	%l6
	mova	%icc,	%o3,	%o0
	fmovdleu	%icc,	%f24,	%f13
	fandnot1s	%f19,	%f21,	%f16
	array32	%i7,	%l3,	%o4
	ldsw	[%l7 + 0x5C],	%i1
	udivx	%g5,	0x0F14,	%o7
	sdivcc	%g3,	0x1488,	%g6
	fand	%f18,	%f30,	%f4
	lduw	[%l7 + 0x14],	%g4
	movrlz	%g2,	%g7,	%o6
	siam	0x0
	ld	[%l7 + 0x40],	%f16
	move	%xcc,	%i0,	%l5
	movvc	%icc,	%i6,	%o1
	nop
	set	0x1C, %l1
	lduw	[%l7 + %l1],	%l1
	array16	%i4,	%i2,	%l4
	udiv	%i5,	0x1460,	%l2
	faligndata	%f24,	%f18,	%f8
	sethi	0x027C,	%l0
	subccc	%o5,	%g1,	%i3
	movcc	%icc,	%l6,	%o3
	andncc	%o2,	%i7,	%l3
	edge32	%o4,	%i1,	%o0
	fmovda	%xcc,	%f12,	%f4
	mulx	%o7,	%g5,	%g3
	movrne	%g4,	%g6,	%g2
	lduw	[%l7 + 0x58],	%o6
	array8	%g7,	%i0,	%i6
	sll	%l5,	%l1,	%i4
	movl	%icc,	%i2,	%o1
	srax	%l4,	0x0C,	%i5
	sethi	0x1ACA,	%l0
	ldd	[%l7 + 0x78],	%o4
	fcmpgt32	%f10,	%f10,	%l2
	movneg	%icc,	%g1,	%i3
	fmul8x16au	%f4,	%f2,	%f20
	fmovdgu	%xcc,	%f9,	%f15
	nop
	set	0x44, %g1
	lduw	[%l7 + %g1],	%l6
	smulcc	%o3,	%i7,	%l3
	stx	%o4,	[%l7 + 0x58]
	edge16ln	%o2,	%o0,	%o7
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%i1
	sra	%g5,	0x06,	%g3
	movne	%xcc,	%g4,	%g6
	udivcc	%o6,	0x155F,	%g7
	movpos	%xcc,	%i0,	%g2
	edge32l	%i6,	%l5,	%l1
	for	%f2,	%f10,	%f12
	fandnot2	%f4,	%f12,	%f16
	sra	%i2,	0x0B,	%o1
	fsrc1	%f28,	%f18
	udivcc	%i4,	0x0B1D,	%i5
	umul	%l0,	0x1A6D,	%l4
	ldd	[%l7 + 0x20],	%l2
	mova	%icc,	%g1,	%i3
	edge16l	%o5,	%o3,	%l6
	mulx	%i7,	%l3,	%o4
	edge32l	%o2,	%o0,	%o7
	movcc	%xcc,	%i1,	%g5
	stw	%g4,	[%l7 + 0x34]
	alignaddr	%g3,	%g6,	%g7
	movpos	%xcc,	%i0,	%o6
	fpsub32	%f22,	%f26,	%f2
	fabsd	%f20,	%f4
	fors	%f1,	%f19,	%f16
	movpos	%icc,	%i6,	%l5
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	fmovdcc	%icc,	%f18,	%f0
	alignaddrl	%l1,	%i4,	%i5
	movleu	%icc,	%l4,	%l0
	sdivcc	%g1,	0x0D91,	%i3
	nop
	set	0x68, %i4
	ldd	[%l7 + %i4],	%f28
	srlx	%l2,	0x05,	%o5
	fcmpne32	%f24,	%f30,	%l6
	srlx	%i7,	%l3,	%o4
	array8	%o3,	%o2,	%o7
	move	%icc,	%i1,	%g5
	st	%f1,	[%l7 + 0x08]
	movge	%icc,	%o0,	%g3
	movpos	%icc,	%g6,	%g7
	edge8ln	%g4,	%i0,	%o6
	sub	%l5,	%i6,	%g2
	nop
	set	0x38, %i3
	ldsw	[%l7 + %i3],	%i2
	edge16	%o1,	%i4,	%i5
	edge16	%l4,	%l0,	%g1
	edge32ln	%l1,	%i3,	%o5
	std	%f26,	[%l7 + 0x60]
	umul	%l2,	0x1CCB,	%l6
	orcc	%l3,	0x08D0,	%i7
	edge16	%o4,	%o3,	%o7
	ldub	[%l7 + 0x09],	%i1
	edge32n	%o2,	%o0,	%g5
	fors	%f0,	%f15,	%f28
	movcs	%xcc,	%g6,	%g3
	alignaddr	%g4,	%i0,	%g7
	addccc	%l5,	0x00F0,	%o6
	subc	%i6,	%i2,	%g2
	movn	%icc,	%i4,	%o1
	fnot1s	%f26,	%f29
	udivcc	%l4,	0x1340,	%l0
	movn	%xcc,	%g1,	%i5
	sub	%i3,	%o5,	%l1
	orn	%l6,	%l3,	%l2
	array8	%i7,	%o3,	%o7
	sth	%o4,	[%l7 + 0x24]
	srax	%i1,	0x08,	%o2
	fmovrsne	%o0,	%f16,	%f7
	ldsw	[%l7 + 0x70],	%g5
	or	%g6,	0x0B0D,	%g3
	movle	%icc,	%i0,	%g4
	movvc	%icc,	%l5,	%o6
	sth	%g7,	[%l7 + 0x42]
	sth	%i6,	[%l7 + 0x56]
	udivcc	%i2,	0x1BFA,	%g2
	and	%i4,	%l4,	%l0
	subc	%g1,	%o1,	%i3
	fmovrslz	%o5,	%f12,	%f22
	ldsb	[%l7 + 0x4E],	%i5
	umul	%l1,	0x126C,	%l6
	fmovdvs	%xcc,	%f3,	%f12
	smulcc	%l2,	0x1C84,	%l3
	alignaddrl	%o3,	%o7,	%o4
	edge16ln	%i7,	%o2,	%o0
	movvc	%icc,	%i1,	%g6
	lduw	[%l7 + 0x28],	%g5
	edge8l	%i0,	%g4,	%l5
	stb	%g3,	[%l7 + 0x0E]
	movrgez	%o6,	0x3F2,	%i6
	addcc	%g7,	%i2,	%i4
	umulcc	%l4,	%l0,	%g2
	movgu	%icc,	%o1,	%i3
	orcc	%o5,	0x04C2,	%g1
	fmovsne	%xcc,	%f7,	%f10
	fmovd	%f30,	%f20
	mova	%xcc,	%l1,	%i5
	fpack16	%f22,	%f4
	umul	%l6,	0x06A2,	%l2
	edge32l	%o3,	%o7,	%o4
	srax	%i7,	%o2,	%o0
	ldsw	[%l7 + 0x10],	%l3
	fnors	%f19,	%f7,	%f10
	restore %g6, %g5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i1,	%g4
	edge16	%l5,	%g3,	%i6
	ldsw	[%l7 + 0x0C],	%o6
	edge32n	%i2,	%g7,	%l4
	movrgez	%i4,	0x18A,	%g2
	ldsh	[%l7 + 0x3A],	%o1
	movl	%xcc,	%l0,	%i3
	ldsh	[%l7 + 0x22],	%o5
	smul	%g1,	%l1,	%l6
	movrgz	%l2,	0x201,	%i5
	movcc	%icc,	%o7,	%o4
	stb	%o3,	[%l7 + 0x22]
	lduh	[%l7 + 0x70],	%i7
	subcc	%o2,	%l3,	%o0
	lduw	[%l7 + 0x70],	%g5
	fors	%f14,	%f21,	%f14
	array8	%i0,	%i1,	%g4
	fmovdcs	%icc,	%f10,	%f7
	alignaddr	%l5,	%g3,	%g6
	fcmpne32	%f26,	%f24,	%o6
	fnegs	%f22,	%f31
	fmovrsgz	%i2,	%f24,	%f30
	fmovdle	%xcc,	%f6,	%f14
	sethi	0x043F,	%i6
	save %l4, 0x1E0C, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i4,	%o1,	%l0
	fcmpgt16	%f4,	%f26,	%g2
	alignaddr	%i3,	%g1,	%l1
	fpsub32s	%f21,	%f8,	%f23
	and	%o5,	%l6,	%l2
	save %o7, %o4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i5,	0x1265,	%i7
	stw	%o2,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x4E],	%l3
	movrne	%g5,	%o0,	%i1
	edge16n	%g4,	%i0,	%l5
	movneg	%xcc,	%g6,	%g3
	umul	%o6,	%i2,	%i6
	sth	%g7,	[%l7 + 0x72]
	edge8ln	%l4,	%i4,	%l0
	orn	%o1,	%g2,	%i3
	udivcc	%g1,	0x083E,	%l1
	std	%f30,	[%l7 + 0x30]
	edge8ln	%l6,	%o5,	%l2
	smulcc	%o7,	0x0C78,	%o4
	sub	%i5,	0x0CE0,	%i7
	subcc	%o2,	0x0C14,	%l3
	movvs	%xcc,	%o3,	%o0
	fmovdl	%xcc,	%f18,	%f11
	movle	%icc,	%i1,	%g5
	xnor	%g4,	%l5,	%g6
	popc	0x03ED,	%i0
	fmuld8ulx16	%f22,	%f3,	%f0
	ldd	[%l7 + 0x48],	%f26
	movpos	%icc,	%g3,	%i2
	subc	%i6,	0x1968,	%g7
	sllx	%o6,	0x17,	%i4
	movpos	%icc,	%l4,	%o1
	fpsub32	%f30,	%f8,	%f12
	fmovdvc	%xcc,	%f22,	%f16
	udivx	%g2,	0x1927,	%l0
	movcs	%icc,	%g1,	%l1
	movcc	%xcc,	%i3,	%l6
	andncc	%o5,	%l2,	%o7
	add	%o4,	%i7,	%i5
	subccc	%o2,	0x132D,	%o3
	sllx	%o0,	0x09,	%i1
	sir	0x0257
	fmovscs	%xcc,	%f6,	%f20
	array16	%l3,	%g4,	%l5
	mulx	%g6,	0x18E1,	%i0
	edge16	%g3,	%g5,	%i6
	movge	%xcc,	%i2,	%o6
	movrne	%g7,	0x33A,	%l4
	ldsh	[%l7 + 0x36],	%o1
	fxnors	%f26,	%f20,	%f6
	fmovrslez	%i4,	%f18,	%f20
	save %l0, 0x160F, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l1,	%i3,	%g2
	sethi	0x1856,	%l6
	andcc	%o5,	0x05FB,	%o7
	sllx	%l2,	%i7,	%i5
	movg	%icc,	%o2,	%o3
	movl	%icc,	%o0,	%o4
	fmovdvc	%xcc,	%f21,	%f4
	stx	%i1,	[%l7 + 0x70]
	addcc	%l3,	%l5,	%g4
	ldub	[%l7 + 0x72],	%i0
	edge8ln	%g6,	%g5,	%i6
	add	%g3,	0x1EF6,	%o6
	movrlz	%i2,	%l4,	%g7
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	fpadd16	%f24,	%f20,	%f14
	edge32n	%l1,	%i3,	%g2
	movrgez	%l0,	%l6,	%o5
	fmovdcs	%icc,	%f24,	%f31
	mova	%xcc,	%l2,	%i7
	movleu	%icc,	%o7,	%o2
	orncc	%o3,	0x1146,	%o0
	srax	%i5,	0x14,	%o4
	sll	%l3,	0x1E,	%l5
	nop
	set	0x7D, %o2
	ldsb	[%l7 + %o2],	%i1
	sll	%g4,	%i0,	%g5
	movl	%xcc,	%g6,	%i6
	srax	%o6,	%i2,	%l4
	nop
	set	0x1C, %o4
	ldsb	[%l7 + %o4],	%g7
	subc	%o1,	%g3,	%i4
	ldd	[%l7 + 0x40],	%f26
	udiv	%g1,	0x0E13,	%i3
	subccc	%l1,	0x1CD2,	%g2
	smulcc	%l0,	%l6,	%o5
	xor	%l2,	%o7,	%i7
	smulcc	%o2,	%o0,	%i5
	xnor	%o3,	0x0974,	%l3
	udivx	%l5,	0x0CA3,	%o4
	xnor	%g4,	0x1F82,	%i0
	and	%g5,	0x04A5,	%g6
	fzeros	%f30
	sra	%i6,	%o6,	%i1
	fnot2s	%f8,	%f21
	fcmpne32	%f2,	%f6,	%l4
	ldsw	[%l7 + 0x5C],	%g7
	sll	%o1,	%g3,	%i2
	lduw	[%l7 + 0x20],	%g1
	ldd	[%l7 + 0x30],	%i4
	movleu	%icc,	%i3,	%l1
	alignaddr	%l0,	%g2,	%l6
	subc	%o5,	0x0255,	%o7
	array32	%i7,	%o2,	%o0
	movrgez	%i5,	0x293,	%l2
	fmovrslez	%o3,	%f11,	%f9
	fmul8x16al	%f3,	%f24,	%f6
	array8	%l3,	%l5,	%o4
	sth	%g4,	[%l7 + 0x14]
	fmovrdgez	%g5,	%f16,	%f30
	array16	%i0,	%g6,	%o6
	stb	%i6,	[%l7 + 0x46]
	ldub	[%l7 + 0x15],	%l4
	movcs	%icc,	%i1,	%g7
	faligndata	%f14,	%f30,	%f0
	sdiv	%o1,	0x036C,	%i2
	stx	%g3,	[%l7 + 0x08]
	lduh	[%l7 + 0x14],	%g1
	srl	%i4,	%i3,	%l0
	edge8l	%g2,	%l1,	%l6
	edge8ln	%o5,	%i7,	%o7
	movne	%icc,	%o0,	%i5
	umulcc	%l2,	0x1254,	%o3
	ldd	[%l7 + 0x60],	%f2
	alignaddrl	%l3,	%o2,	%l5
	fnot1	%f18,	%f12
	subc	%g4,	0x144C,	%o4
	fpsub32s	%f29,	%f4,	%f28
	fmovse	%icc,	%f13,	%f0
	std	%f30,	[%l7 + 0x38]
	smul	%i0,	0x1E06,	%g5
	fmovrsgez	%g6,	%f24,	%f4
	subcc	%o6,	%l4,	%i1
	movvc	%xcc,	%g7,	%o1
	fmuld8ulx16	%f5,	%f20,	%f8
	ldx	[%l7 + 0x60],	%i2
	popc	%i6,	%g1
	nop
	set	0x5C, %o3
	stw	%g3,	[%l7 + %o3]
	alignaddrl	%i4,	%i3,	%g2
	add	%l1,	%l6,	%o5
	lduw	[%l7 + 0x34],	%i7
	fsrc1s	%f30,	%f26
	edge8l	%o7,	%o0,	%i5
	fnors	%f14,	%f8,	%f22
	movrne	%l0,	%l2,	%o3
	fpsub16	%f20,	%f28,	%f14
	sethi	0x0948,	%o2
	udivx	%l3,	0x1A44,	%g4
	movrgez	%o4,	0x066,	%i0
	andn	%l5,	%g5,	%o6
	sth	%g6,	[%l7 + 0x1A]
	fmovrslez	%l4,	%f8,	%f20
	array8	%g7,	%i1,	%i2
	fmovsle	%xcc,	%f5,	%f1
	array8	%i6,	%o1,	%g3
	add	%i4,	0x1B9C,	%g1
	smul	%g2,	0x0F32,	%i3
	or	%l6,	0x1ADF,	%o5
	subcc	%i7,	%l1,	%o7
	addccc	%i5,	%o0,	%l2
	addc	%l0,	%o2,	%o3
	mova	%xcc,	%l3,	%o4
	ldub	[%l7 + 0x36],	%g4
	save %l5, 0x135B, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o6,	0x002E,	%i0
	sir	0x11FA
	fcmpne32	%f0,	%f12,	%l4
	popc	%g6,	%g7
	fmovdgu	%icc,	%f17,	%f20
	movvs	%xcc,	%i1,	%i6
	movpos	%icc,	%o1,	%i2
	edge32l	%i4,	%g3,	%g2
	edge8l	%i3,	%l6,	%g1
	umulcc	%i7,	%l1,	%o7
	xnorcc	%o5,	%i5,	%o0
	smul	%l0,	%l2,	%o2
	edge16l	%o3,	%o4,	%l3
	andcc	%l5,	0x00FD,	%g5
	sub	%g4,	0x1CBA,	%i0
	sub	%l4,	%g6,	%g7
	sir	0x0D58
	fmovrdgz	%i1,	%f26,	%f4
	edge32l	%i6,	%o6,	%i2
	xnorcc	%o1,	%i4,	%g2
	sir	0x0654
	fmovdle	%xcc,	%f21,	%f5
	movrgez	%i3,	0x1BC,	%l6
	movl	%xcc,	%g3,	%i7
	edge8	%g1,	%l1,	%o7
	xor	%o5,	0x0FE9,	%i5
	sdivx	%o0,	0x0C47,	%l2
	edge16	%o2,	%o3,	%l0
	edge32n	%o4,	%l3,	%l5
	xnor	%g4,	0x1223,	%g5
	addc	%i0,	0x1CD8,	%l4
	xor	%g6,	%i1,	%i6
	fpack16	%f30,	%f2
	ldd	[%l7 + 0x10],	%f12
	ldub	[%l7 + 0x43],	%o6
	fmovscc	%icc,	%f25,	%f7
	sra	%i2,	0x16,	%o1
	subcc	%g7,	%i4,	%i3
	subccc	%l6,	0x00F1,	%g2
	udiv	%g3,	0x1F34,	%g1
	sth	%i7,	[%l7 + 0x22]
	add	%l1,	0x12E9,	%o7
	fmovsleu	%xcc,	%f4,	%f15
	sll	%o5,	%o0,	%i5
	sir	0x1D69
	edge16n	%o2,	%l2,	%l0
	edge32l	%o3,	%o4,	%l3
	mova	%xcc,	%l5,	%g5
	udiv	%g4,	0x0BA1,	%l4
	movvs	%icc,	%g6,	%i1
	ldd	[%l7 + 0x78],	%f2
	edge32l	%i0,	%i6,	%o6
	fcmpes	%fcc3,	%f22,	%f20
	xor	%i2,	0x00C4,	%g7
	sir	0x0EE2
	movleu	%icc,	%i4,	%i3
	umul	%l6,	0x1933,	%o1
	sdivx	%g3,	0x0D31,	%g1
	movge	%xcc,	%g2,	%l1
	movcc	%icc,	%o7,	%i7
	and	%o5,	%o0,	%i5
	st	%f11,	[%l7 + 0x34]
	fmovde	%xcc,	%f4,	%f13
	save %o2, %l2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o4,	%o3,	%l5
	alignaddrl	%g5,	%g4,	%l3
	fcmpd	%fcc2,	%f10,	%f28
	movn	%xcc,	%g6,	%l4
	movvs	%icc,	%i1,	%i6
	sdivcc	%o6,	0x0B25,	%i2
	ldx	[%l7 + 0x58],	%i0
	udivcc	%g7,	0x15C7,	%i4
	and	%l6,	%i3,	%o1
	fmovrdne	%g1,	%f22,	%f8
	ldd	[%l7 + 0x50],	%g2
	movcs	%xcc,	%g3,	%l1
	movcc	%xcc,	%o7,	%i7
	alignaddrl	%o0,	%o5,	%o2
	sdivx	%i5,	0x06F5,	%l0
	umul	%o4,	0x0638,	%o3
	restore %l2, 0x0DF0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g4,	0x1BEF,	%l3
	andncc	%g5,	%g6,	%i1
	fmovsvs	%icc,	%f10,	%f3
	xnorcc	%i6,	%o6,	%i2
	mova	%xcc,	%l4,	%i0
	popc	0x0B1C,	%g7
	edge16n	%i4,	%i3,	%l6
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	movrgez	%o1,	%o7,	%i7
	fmovrdgez	%o0,	%f6,	%f18
	fsrc2	%f6,	%f0
	addcc	%l1,	0x0F57,	%o2
	mulscc	%i5,	%l0,	%o5
	fpack32	%f28,	%f4,	%f4
	movvc	%xcc,	%o3,	%o4
	edge8n	%l2,	%l5,	%g4
	movvc	%xcc,	%g5,	%g6
	add	%l3,	0x09FC,	%i6
	mulx	%i1,	%o6,	%l4
	addccc	%i0,	0x01EB,	%g7
	ldx	[%l7 + 0x50],	%i2
	movvs	%icc,	%i4,	%i3
	sub	%l6,	%g1,	%g3
	sra	%g2,	%o7,	%i7
	array8	%o1,	%l1,	%o2
	edge8	%o0,	%i5,	%l0
	edge32ln	%o5,	%o3,	%o4
	alignaddrl	%l5,	%g4,	%g5
	movne	%icc,	%g6,	%l2
	movvs	%xcc,	%i6,	%i1
	movn	%xcc,	%o6,	%l4
	st	%f3,	[%l7 + 0x54]
	srax	%i0,	%l3,	%g7
	movle	%xcc,	%i2,	%i3
	fcmpne16	%f12,	%f8,	%i4
	ldx	[%l7 + 0x48],	%l6
	sllx	%g1,	0x19,	%g3
	subcc	%o7,	%i7,	%o1
	ldsh	[%l7 + 0x7E],	%g2
	fmovsvc	%xcc,	%f3,	%f24
	subc	%l1,	0x1AB9,	%o2
	fmovrdlez	%i5,	%f16,	%f30
	stb	%o0,	[%l7 + 0x31]
	ldsb	[%l7 + 0x5B],	%o5
	and	%o3,	0x118B,	%o4
	fmovsl	%icc,	%f12,	%f10
	fcmple16	%f28,	%f2,	%l0
	edge16ln	%g4,	%g5,	%g6
	fmovdcc	%icc,	%f16,	%f13
	ldd	[%l7 + 0x60],	%l4
	fmovrde	%i6,	%f12,	%f6
	orn	%i1,	%l2,	%l4
	movgu	%icc,	%i0,	%o6
	fmovsle	%icc,	%f11,	%f23
	movge	%xcc,	%l3,	%i2
	edge8ln	%g7,	%i3,	%l6
	popc	0x0C99,	%g1
	edge32n	%g3,	%o7,	%i4
	ldx	[%l7 + 0x78],	%o1
	std	%f16,	[%l7 + 0x28]
	andncc	%g2,	%l1,	%i7
	ld	[%l7 + 0x60],	%f18
	fcmpes	%fcc2,	%f19,	%f10
	ldub	[%l7 + 0x21],	%i5
	stb	%o0,	[%l7 + 0x13]
	ldd	[%l7 + 0x68],	%o2
	xnor	%o3,	%o4,	%l0
	movcs	%icc,	%g4,	%g5
	fmovrsne	%o5,	%f2,	%f12
	stb	%g6,	[%l7 + 0x67]
	ldub	[%l7 + 0x0E],	%l5
	fabsd	%f14,	%f22
	umulcc	%i6,	%l2,	%l4
	sub	%i1,	0x00B4,	%o6
	edge16ln	%l3,	%i2,	%i0
	fone	%f16
	xnorcc	%i3,	%l6,	%g1
	move	%xcc,	%g3,	%g7
	movg	%xcc,	%i4,	%o1
	edge16l	%o7,	%l1,	%i7
	edge32ln	%g2,	%i5,	%o0
	fmovsvs	%xcc,	%f1,	%f4
	std	%f18,	[%l7 + 0x68]
	ld	[%l7 + 0x38],	%f23
	andn	%o3,	%o2,	%o4
	fmovrslez	%g4,	%f31,	%f0
	fnor	%f6,	%f6,	%f22
	movvc	%xcc,	%g5,	%o5
	ld	[%l7 + 0x1C],	%f23
	ldd	[%l7 + 0x50],	%f30
	mulx	%g6,	0x01AA,	%l0
	restore %l5, %l2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%xcc,	%f13,	%f0
	or	%l4,	0x145D,	%o6
	nop
	set	0x4D, %g2
	stb	%l3,	[%l7 + %g2]
	sir	0x1B11
	srlx	%i2,	0x12,	%i0
	nop
	set	0x28, %g3
	stx	%i3,	[%l7 + %g3]
	fmovrdgz	%i1,	%f6,	%f16
	edge8n	%l6,	%g1,	%g7
	stb	%g3,	[%l7 + 0x7A]
	ldub	[%l7 + 0x53],	%o1
	sub	%o7,	0x131F,	%l1
	orcc	%i4,	0x1A6E,	%i7
	array32	%g2,	%i5,	%o0
	alignaddrl	%o2,	%o4,	%o3
	fmovde	%icc,	%f20,	%f9
	sllx	%g4,	%o5,	%g6
	movg	%xcc,	%g5,	%l0
	fmovsgu	%icc,	%f3,	%f7
	subcc	%l5,	%l2,	%l4
	sra	%i6,	0x1B,	%o6
	fcmple16	%f8,	%f18,	%i2
	movleu	%xcc,	%l3,	%i0
	movle	%icc,	%i1,	%i3
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fcmpeq32	%f4,	%f14,	%o1
	save %g1, %o7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i7,	0x0C3A,	%g2
	addc	%i4,	0x0FD4,	%o0
	fcmpne16	%f14,	%f10,	%o2
	or	%o4,	0x0B23,	%i5
	srlx	%g4,	0x1C,	%o5
	edge16	%o3,	%g5,	%l0
	fnot2s	%f21,	%f4
	mulscc	%g6,	%l5,	%l2
	alignaddrl	%i6,	%o6,	%l4
	movcs	%icc,	%i2,	%l3
	smulcc	%i0,	0x0720,	%i3
	xor	%i1,	%l6,	%g7
	sdivx	%o1,	0x01B5,	%g3
	movleu	%icc,	%o7,	%l1
	udivx	%i7,	0x1E63,	%g1
	xorcc	%i4,	%o0,	%o2
	fcmpeq32	%f10,	%f22,	%o4
	fabsd	%f8,	%f6
	movrne	%i5,	0x317,	%g4
	fcmple32	%f28,	%f22,	%o5
	edge16n	%g2,	%g5,	%o3
	orcc	%l0,	%g6,	%l2
	movgu	%xcc,	%l5,	%i6
	addcc	%l4,	0x0652,	%i2
	fmovrdne	%o6,	%f6,	%f26
	fmovde	%icc,	%f13,	%f15
	udivx	%l3,	0x195B,	%i0
	udivx	%i3,	0x1FD1,	%l6
	xor	%i1,	0x1F74,	%g7
	fmovspos	%icc,	%f21,	%f0
	and	%o1,	0x1F3F,	%g3
	fcmped	%fcc3,	%f24,	%f14
	ldsh	[%l7 + 0x4E],	%o7
	sub	%i7,	%g1,	%l1
	xor	%i4,	%o0,	%o2
	stb	%i5,	[%l7 + 0x3D]
	fmovdvs	%xcc,	%f11,	%f5
	fcmpne32	%f14,	%f28,	%o4
	ldsh	[%l7 + 0x3E],	%g4
	smulcc	%g2,	0x169F,	%o5
	mulscc	%g5,	0x11C6,	%o3
	fmovrslez	%g6,	%f16,	%f14
	fmovsvs	%icc,	%f18,	%f22
	edge16l	%l0,	%l5,	%i6
	array32	%l4,	%i2,	%l2
	sir	0x0D2D
	move	%icc,	%l3,	%o6
	fmovsvc	%icc,	%f10,	%f4
	ldsh	[%l7 + 0x26],	%i3
	edge32l	%i0,	%i1,	%g7
	movle	%xcc,	%l6,	%o1
	umulcc	%g3,	%i7,	%g1
	sth	%l1,	[%l7 + 0x60]
	array32	%o7,	%i4,	%o0
	fornot2s	%f22,	%f15,	%f19
	sir	0x0E16
	fmovrde	%i5,	%f16,	%f12
	movpos	%xcc,	%o4,	%o2
	array32	%g4,	%g2,	%o5
	andcc	%o3,	%g6,	%l0
	sra	%l5,	0x1F,	%g5
	movvs	%xcc,	%l4,	%i6
	edge8	%i2,	%l2,	%o6
	movn	%icc,	%i3,	%l3
	andcc	%i0,	%i1,	%l6
	sllx	%o1,	%g7,	%i7
	sdivx	%g3,	0x02FD,	%l1
	sllx	%g1,	0x19,	%i4
	movcc	%xcc,	%o0,	%o7
	movg	%icc,	%o4,	%i5
	addcc	%o2,	%g2,	%o5
	edge16n	%g4,	%g6,	%l0
	orn	%l5,	%g5,	%l4
	fnot2s	%f18,	%f1
	xnorcc	%o3,	0x129B,	%i6
	save %i2, %l2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l3,	0x0691,	%i0
	fmovscs	%icc,	%f14,	%f20
	alignaddrl	%i3,	%l6,	%o1
	xor	%i1,	%i7,	%g3
	edge8	%l1,	%g1,	%i4
	sethi	0x0BF7,	%o0
	edge32	%g7,	%o7,	%o4
	sdiv	%i5,	0x01F9,	%g2
	fnot2	%f28,	%f12
	popc	%o5,	%o2
	nop
	set	0x50, %l4
	ldd	[%l7 + %l4],	%g6
	movne	%icc,	%g4,	%l5
	mova	%icc,	%g5,	%l4
	and	%l0,	0x0F8D,	%o3
	fpack32	%f26,	%f0,	%f12
	st	%f24,	[%l7 + 0x08]
	edge16l	%i2,	%l2,	%o6
	andn	%i6,	%i0,	%i3
	or	%l3,	0x09C2,	%l6
	fmovsvs	%icc,	%f17,	%f19
	nop
	set	0x68, %i5
	stx	%o1,	[%l7 + %i5]
	addcc	%i7,	%i1,	%g3
	ldx	[%l7 + 0x50],	%l1
	sdiv	%g1,	0x1690,	%o0
	sth	%g7,	[%l7 + 0x24]
	orncc	%i4,	0x0DBD,	%o4
	movge	%icc,	%o7,	%i5
	andcc	%o5,	0x0822,	%o2
	add	%g6,	%g2,	%l5
	sir	0x1E54
	restore %g5, %l4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o3,	%i2,	%l0
	edge32n	%o6,	%i6,	%l2
	xor	%i0,	0x103B,	%l3
	std	%f10,	[%l7 + 0x28]
	siam	0x2
	st	%f21,	[%l7 + 0x48]
	array16	%l6,	%o1,	%i7
	xorcc	%i3,	0x0726,	%g3
	std	%f2,	[%l7 + 0x18]
	xnorcc	%i1,	0x04D4,	%l1
	edge8ln	%o0,	%g1,	%i4
	stb	%o4,	[%l7 + 0x18]
	fmovspos	%icc,	%f1,	%f3
	edge32ln	%o7,	%g7,	%i5
	movvs	%icc,	%o5,	%o2
	orn	%g2,	%l5,	%g5
	movrne	%l4,	%g6,	%g4
	mulx	%i2,	0x1786,	%o3
	movl	%xcc,	%o6,	%i6
	fors	%f19,	%f31,	%f19
	movle	%icc,	%l0,	%l2
	udiv	%i0,	0x0A58,	%l3
	save %o1, %i7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%icc,	%f11,	%f27
	udivx	%g3,	0x065F,	%l6
	fmul8x16	%f3,	%f16,	%f24
	ldsh	[%l7 + 0x44],	%l1
	movrlez	%i1,	%o0,	%g1
	edge8ln	%i4,	%o4,	%g7
	movrlz	%i5,	%o5,	%o7
	edge8ln	%g2,	%l5,	%o2
	xnor	%g5,	%g6,	%l4
	orncc	%i2,	0x1A36,	%g4
	movrne	%o6,	%o3,	%i6
	mulscc	%l0,	%l2,	%l3
	edge8n	%i0,	%i7,	%o1
	std	%f28,	[%l7 + 0x30]
	fmovrde	%g3,	%f20,	%f2
	mulx	%i3,	0x05AD,	%l1
	ldub	[%l7 + 0x71],	%i1
	subc	%l6,	0x15BF,	%g1
	edge32ln	%o0,	%o4,	%i4
	smulcc	%g7,	0x1D04,	%i5
	stx	%o7,	[%l7 + 0x78]
	edge16	%o5,	%g2,	%l5
	array16	%g5,	%g6,	%o2
	movrgz	%i2,	%g4,	%l4
	lduw	[%l7 + 0x5C],	%o3
	subccc	%o6,	0x18D0,	%i6
	mulscc	%l2,	0x0B37,	%l3
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	fmul8x16	%f31,	%f18,	%f16
	movne	%xcc,	%l0,	%i3
	xor	%l1,	%g3,	%l6
	edge16l	%i1,	%o0,	%g1
	udiv	%o4,	0x0EE1,	%g7
	fornot2	%f18,	%f4,	%f4
	edge16l	%i5,	%o7,	%o5
	and	%g2,	0x075B,	%i4
	or	%l5,	%g5,	%g6
	udivx	%i2,	0x0B30,	%o2
	stw	%g4,	[%l7 + 0x60]
	st	%f23,	[%l7 + 0x40]
	fmovse	%icc,	%f26,	%f0
	movrgz	%l4,	%o6,	%i6
	fmovsleu	%icc,	%f25,	%f3
	andn	%o3,	%l2,	%l3
	faligndata	%f22,	%f22,	%f16
	ldx	[%l7 + 0x08],	%i0
	fzero	%f16
	fmovdge	%icc,	%f11,	%f16
	for	%f26,	%f10,	%f2
	udivcc	%o1,	0x0A70,	%l0
	array8	%i3,	%i7,	%g3
	movvc	%xcc,	%l6,	%i1
	fmuld8sux16	%f25,	%f28,	%f20
	fmovdvs	%icc,	%f6,	%f14
	fand	%f28,	%f12,	%f20
	edge16	%l1,	%o0,	%o4
	umul	%g7,	%i5,	%g1
	edge8l	%o7,	%g2,	%o5
	movn	%xcc,	%l5,	%i4
	udiv	%g5,	0x0A9E,	%g6
	movne	%icc,	%i2,	%o2
	fnors	%f13,	%f0,	%f11
	addcc	%g4,	%o6,	%i6
	xor	%l4,	0x1B8A,	%o3
	movrlez	%l3,	0x0FF,	%l2
	sdivcc	%o1,	0x0FBE,	%i0
	fpsub32s	%f18,	%f9,	%f21
	movrne	%l0,	%i3,	%i7
	sub	%l6,	%g3,	%l1
	movvs	%icc,	%o0,	%o4
	move	%icc,	%i1,	%i5
	nop
	set	0x68, %o7
	std	%f28,	[%l7 + %o7]
	movgu	%xcc,	%g7,	%g1
	movre	%g2,	%o5,	%l5
	xor	%i4,	%o7,	%g5
	nop
	set	0x7E, %i0
	sth	%g6,	[%l7 + %i0]
	ldub	[%l7 + 0x57],	%o2
	fcmpes	%fcc3,	%f4,	%f14
	orncc	%i2,	%g4,	%i6
	edge32l	%l4,	%o6,	%o3
	movge	%icc,	%l2,	%l3
	edge16	%i0,	%o1,	%l0
	movgu	%xcc,	%i7,	%i3
	array16	%g3,	%l1,	%l6
	movvc	%icc,	%o4,	%o0
	edge8	%i5,	%g7,	%g1
	mulscc	%i1,	0x0151,	%g2
	add	%o5,	%i4,	%o7
	sra	%l5,	%g6,	%o2
	sdivx	%g5,	0x1D59,	%g4
	edge8ln	%i6,	%i2,	%o6
	edge16	%o3,	%l2,	%l4
	edge16n	%l3,	%i0,	%l0
	umul	%o1,	%i7,	%i3
	ldx	[%l7 + 0x68],	%g3
	orn	%l6,	0x1521,	%l1
	ldd	[%l7 + 0x28],	%o4
	movl	%icc,	%o0,	%i5
	save %g7, 0x0F92, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i1,	%o5,	%g2
	edge8l	%i4,	%o7,	%g6
	sll	%o2,	0x14,	%l5
	save %g4, 0x1F91, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i6,	%o6,	%i2
	andncc	%l2,	%l4,	%l3
	edge8l	%i0,	%o3,	%o1
	and	%i7,	0x085A,	%i3
	nop
	set	0x40, %l6
	ldd	[%l7 + %l6],	%g2
	subcc	%l6,	0x147E,	%l0
	sllx	%l1,	0x17,	%o0
	popc	%o4,	%g7
	stb	%g1,	[%l7 + 0x66]
	edge16	%i5,	%i1,	%g2
	sdiv	%i4,	0x1683,	%o5
	move	%icc,	%o7,	%g6
	movrne	%l5,	0x0CA,	%g4
	movcs	%xcc,	%o2,	%i6
	movrgz	%g5,	0x396,	%i2
	movre	%o6,	0x2D4,	%l2
	addc	%l4,	0x1988,	%i0
	nop
	set	0x48, %g5
	stb	%l3,	[%l7 + %g5]
	fmul8sux16	%f4,	%f14,	%f6
	srax	%o3,	%i7,	%o1
	fmovsg	%xcc,	%f20,	%f0
	edge32n	%g3,	%l6,	%i3
	subc	%l0,	0x0BD5,	%l1
	fsrc1	%f0,	%f20
	movvs	%xcc,	%o0,	%o4
	move	%icc,	%g1,	%g7
	movrne	%i5,	%g2,	%i4
	edge8n	%o5,	%i1,	%g6
	umul	%l5,	0x1EE5,	%o7
	movrne	%g4,	%i6,	%o2
	udiv	%g5,	0x07AE,	%o6
	fpadd16s	%f26,	%f5,	%f28
	andn	%l2,	%l4,	%i0
	edge32ln	%i2,	%o3,	%i7
	edge32ln	%l3,	%o1,	%l6
	srlx	%g3,	%i3,	%l0
	fabss	%f19,	%f21
	xnorcc	%o0,	0x0097,	%o4
	fmovrdlez	%l1,	%f14,	%f10
	addcc	%g7,	%i5,	%g1
	movvs	%xcc,	%g2,	%i4
	fnot2	%f14,	%f16
	movle	%xcc,	%o5,	%g6
	udivcc	%l5,	0x01AC,	%i1
	addccc	%o7,	%i6,	%g4
	ldsh	[%l7 + 0x6A],	%o2
	fandnot1s	%f5,	%f0,	%f10
	mulx	%o6,	0x191B,	%l2
	save %l4, 0x0D24, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i2,	0x13,	%g5
	sir	0x08C8
	sll	%o3,	%l3,	%o1
	fmovsleu	%icc,	%f12,	%f24
	nop
	set	0x6A, %i6
	sth	%i7,	[%l7 + %i6]
	st	%f25,	[%l7 + 0x6C]
	fpadd32s	%f12,	%f10,	%f4
	st	%f13,	[%l7 + 0x70]
	fmovsge	%icc,	%f20,	%f16
	fcmpd	%fcc2,	%f26,	%f20
	restore %l6, 0x033A, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l0,	0x16,	%i3
	edge16	%o0,	%l1,	%o4
	ldsb	[%l7 + 0x0E],	%i5
	subc	%g1,	%g7,	%i4
	fandnot1	%f30,	%f26,	%f20
	subc	%g2,	0x14FE,	%o5
	lduw	[%l7 + 0x6C],	%g6
	subccc	%l5,	0x15E1,	%i1
	mulx	%o7,	%g4,	%o2
	ldx	[%l7 + 0x58],	%o6
	fnegd	%f6,	%f16
	movrne	%l2,	%l4,	%i0
	smul	%i2,	0x1552,	%i6
	fexpand	%f13,	%f22
	lduh	[%l7 + 0x2C],	%g5
	subcc	%l3,	%o3,	%o1
	edge32n	%l6,	%i7,	%l0
	movrlz	%g3,	0x0A0,	%i3
	ldsw	[%l7 + 0x24],	%o0
	fsrc2s	%f10,	%f4
	movvc	%xcc,	%l1,	%o4
	edge16ln	%g1,	%i5,	%i4
	mova	%xcc,	%g7,	%g2
	movl	%xcc,	%o5,	%l5
	andncc	%i1,	%o7,	%g4
	smulcc	%o2,	0x194A,	%g6
	sllx	%o6,	%l4,	%l2
	srl	%i2,	0x1F,	%i6
	sdivx	%g5,	0x1B7B,	%i0
	add	%o3,	%l3,	%o1
	movcc	%icc,	%i7,	%l0
	movcs	%icc,	%l6,	%g3
	fornot1s	%f4,	%f17,	%f20
	orcc	%i3,	0x0B8A,	%o0
	fmovse	%xcc,	%f18,	%f8
	sra	%o4,	%l1,	%g1
	movvc	%xcc,	%i5,	%g7
	movrgz	%g2,	0x138,	%i4
	andncc	%o5,	%i1,	%l5
	ldsh	[%l7 + 0x42],	%o7
	edge8ln	%o2,	%g4,	%g6
	array8	%l4,	%o6,	%l2
	alignaddrl	%i2,	%i6,	%g5
	fmovscc	%xcc,	%f24,	%f5
	sdivx	%i0,	0x0F46,	%l3
	array16	%o1,	%i7,	%l0
	movne	%icc,	%l6,	%o3
	smulcc	%g3,	%i3,	%o0
	movl	%icc,	%l1,	%g1
	ldx	[%l7 + 0x20],	%i5
	sdiv	%o4,	0x1D7D,	%g7
	fcmple16	%f22,	%f12,	%g2
	std	%f26,	[%l7 + 0x08]
	ldd	[%l7 + 0x78],	%o4
	movle	%xcc,	%i1,	%i4
	mulx	%l5,	%o2,	%o7
	st	%f5,	[%l7 + 0x50]
	movrgz	%g6,	0x18B,	%l4
	st	%f24,	[%l7 + 0x2C]
	alignaddrl	%o6,	%l2,	%g4
	andn	%i6,	%i2,	%g5
	save %l3, %o1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i7,	%l6,	%l0
	movg	%xcc,	%g3,	%i3
	fabss	%f12,	%f7
	xor	%o3,	0x0EBA,	%l1
	alignaddr	%o0,	%g1,	%o4
	edge32n	%g7,	%i5,	%o5
	xnor	%g2,	%i1,	%l5
	fmovsl	%icc,	%f0,	%f28
	movleu	%xcc,	%i4,	%o7
	fabss	%f21,	%f3
	stx	%o2,	[%l7 + 0x60]
	edge16ln	%l4,	%g6,	%o6
	movre	%l2,	0x2A1,	%i6
	xor	%i2,	%g4,	%l3
	edge16n	%g5,	%i0,	%i7
	sdivcc	%o1,	0x00A7,	%l6
	edge32	%l0,	%g3,	%i3
	addcc	%l1,	%o0,	%g1
	ld	[%l7 + 0x14],	%f22
	lduh	[%l7 + 0x1E],	%o4
	ld	[%l7 + 0x44],	%f1
	xor	%g7,	%i5,	%o5
	xnor	%g2,	%i1,	%l5
	fexpand	%f13,	%f4
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	lduw	[%l7 + 0x68],	%l4
	movle	%icc,	%o2,	%o6
	sll	%g6,	0x0E,	%l2
	mulscc	%i6,	%g4,	%l3
	smul	%g5,	0x1824,	%i0
	subccc	%i7,	0x1980,	%i2
	alignaddrl	%l6,	%o1,	%l0
	xnorcc	%i3,	0x1555,	%l1
	movne	%icc,	%g3,	%g1
	movpos	%xcc,	%o4,	%o0
	subc	%g7,	0x1317,	%i5
	stw	%g2,	[%l7 + 0x1C]
	udivx	%o5,	0x090A,	%i1
	movre	%l5,	0x3AB,	%i4
	udivcc	%o7,	0x010C,	%l4
	edge32n	%o3,	%o2,	%g6
	xnorcc	%l2,	%i6,	%o6
	movn	%icc,	%g4,	%g5
	fmovsleu	%xcc,	%f5,	%f22
	movneg	%icc,	%i0,	%i7
	add	%i2,	%l6,	%l3
	andn	%l0,	0x1459,	%i3
	edge8l	%l1,	%o1,	%g3
	sth	%o4,	[%l7 + 0x0C]
	fmovrdlz	%o0,	%f2,	%f12
	movrlez	%g7,	%g1,	%g2
	fpack32	%f28,	%f14,	%f12
	srl	%i5,	0x12,	%i1
	movcs	%xcc,	%l5,	%o5
	ld	[%l7 + 0x3C],	%f24
	sll	%i4,	0x11,	%l4
	array16	%o3,	%o2,	%o7
	fsrc2	%f24,	%f8
	fzeros	%f13
	movneg	%xcc,	%g6,	%l2
	edge8n	%o6,	%g4,	%i6
	lduh	[%l7 + 0x0E],	%i0
	movrlez	%g5,	%i7,	%l6
	edge32	%i2,	%l0,	%l3
	edge8l	%l1,	%i3,	%g3
	stb	%o1,	[%l7 + 0x44]
	smulcc	%o0,	%o4,	%g7
	fxnor	%f22,	%f24,	%f2
	srax	%g2,	%i5,	%i1
	movrgz	%g1,	%l5,	%i4
	edge8l	%o5,	%o3,	%l4
	fpsub16	%f18,	%f0,	%f6
	ldub	[%l7 + 0x60],	%o7
	alignaddrl	%g6,	%o2,	%o6
	fpsub32	%f20,	%f0,	%f26
	array8	%g4,	%i6,	%i0
	ldsb	[%l7 + 0x6B],	%l2
	srax	%g5,	%i7,	%i2
	fpsub32	%f12,	%f10,	%f12
	edge32	%l0,	%l6,	%l1
	fmovdle	%icc,	%f20,	%f15
	srl	%i3,	0x13,	%l3
	movcs	%xcc,	%o1,	%g3
	save %o4, 0x1945, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g2,	%g7
	faligndata	%f26,	%f8,	%f28
	fmul8x16au	%f5,	%f14,	%f12
	sdivcc	%i5,	0x1488,	%g1
	fnor	%f26,	%f4,	%f12
	srlx	%l5,	%i4,	%o5
	xor	%o3,	0x1D94,	%l4
	movvs	%xcc,	%o7,	%g6
	move	%xcc,	%i1,	%o6
	ldsb	[%l7 + 0x79],	%o2
	edge32l	%i6,	%g4,	%l2
	fxor	%f6,	%f10,	%f22
	addc	%i0,	0x0CF4,	%i7
	fcmpne32	%f16,	%f30,	%i2
	edge8n	%l0,	%g5,	%l1
	restore %i3, %l6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g3,	0x07F3,	%o4
	edge32l	%o0,	%g2,	%g7
	movrlez	%l3,	%i5,	%l5
	xnorcc	%g1,	%i4,	%o3
	sethi	0x1F1D,	%o5
	edge8ln	%o7,	%g6,	%i1
	edge8n	%o6,	%o2,	%i6
	ldsh	[%l7 + 0x36],	%l4
	movcs	%xcc,	%l2,	%i0
	fpadd16s	%f8,	%f26,	%f1
	movcs	%xcc,	%g4,	%i7
	fmovrse	%i2,	%f10,	%f8
	ldd	[%l7 + 0x30],	%f4
	movcc	%xcc,	%l0,	%l1
	ldsb	[%l7 + 0x55],	%i3
	edge8ln	%l6,	%o1,	%g5
	mulscc	%g3,	%o0,	%o4
	fmovrdlez	%g7,	%f12,	%f14
	xorcc	%l3,	0x00B8,	%i5
	sdivx	%l5,	0x0953,	%g1
	movrne	%g2,	%o3,	%o5
	fmovsvc	%icc,	%f20,	%f6
	sra	%o7,	0x1D,	%i4
	xnorcc	%i1,	%g6,	%o6
	save %i6, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f22,	%f8,	%f10
	fmovdn	%xcc,	%f7,	%f15
	sth	%i0,	[%l7 + 0x60]
	xorcc	%o2,	0x008D,	%g4
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	and	%l1,	0x1620,	%l0
	movg	%icc,	%i3,	%o1
	fsrc2	%f28,	%f0
	fmovsleu	%xcc,	%f24,	%f23
	edge8l	%g5,	%g3,	%o0
	movle	%icc,	%o4,	%l6
	edge8n	%l3,	%g7,	%l5
	udiv	%g1,	0x153A,	%g2
	movgu	%xcc,	%i5,	%o3
	umul	%o7,	0x0F9C,	%o5
	fmovsleu	%icc,	%f15,	%f5
	movne	%icc,	%i1,	%i4
	edge16	%g6,	%o6,	%i6
	sdivcc	%l4,	0x056A,	%i0
	fpsub16	%f6,	%f18,	%f22
	fmovdle	%xcc,	%f2,	%f8
	move	%icc,	%o2,	%g4
	fmul8ulx16	%f20,	%f12,	%f28
	movg	%icc,	%l2,	%i7
	movgu	%icc,	%i2,	%l1
	movgu	%icc,	%i3,	%l0
	lduw	[%l7 + 0x34],	%o1
	ldx	[%l7 + 0x30],	%g5
	edge32	%g3,	%o4,	%l6
	fmovdge	%icc,	%f0,	%f20
	andn	%l3,	%g7,	%o0
	andncc	%l5,	%g1,	%g2
	movl	%icc,	%o3,	%o7
	fones	%f21
	fmovrse	%i5,	%f23,	%f6
	edge8n	%o5,	%i4,	%i1
	ldsb	[%l7 + 0x4F],	%o6
	move	%xcc,	%g6,	%i6
	faligndata	%f26,	%f8,	%f26
	movn	%xcc,	%l4,	%i0
	move	%xcc,	%g4,	%o2
	save %l2, 0x157E, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%l1,	%f18,	%f30
	nop
	set	0x25, %o5
	stb	%i3,	[%l7 + %o5]
	addcc	%i2,	%o1,	%g5
	fmovdvc	%icc,	%f22,	%f16
	xnorcc	%g3,	%l0,	%o4
	alignaddrl	%l3,	%g7,	%o0
	st	%f18,	[%l7 + 0x44]
	edge32	%l5,	%l6,	%g1
	edge8	%g2,	%o7,	%o3
	smulcc	%o5,	0x0164,	%i4
	and	%i1,	0x09F7,	%i5
	fands	%f19,	%f27,	%f29
	mulx	%o6,	%i6,	%l4
	smulcc	%i0,	0x1DC0,	%g4
	movn	%icc,	%g6,	%o2
	subcc	%l2,	%l1,	%i7
	mulscc	%i2,	0x10FD,	%o1
	edge32	%i3,	%g5,	%g3
	ld	[%l7 + 0x38],	%f17
	movl	%icc,	%l0,	%l3
	fmovda	%icc,	%f25,	%f8
	xorcc	%o4,	%g7,	%l5
	addccc	%l6,	0x177F,	%o0
	subccc	%g2,	0x136B,	%o7
	xnor	%o3,	0x1C42,	%g1
	stx	%o5,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%f29
	movl	%xcc,	%i4,	%i1
	fmovsa	%icc,	%f12,	%f26
	xor	%i5,	0x1C91,	%i6
	movle	%xcc,	%o6,	%i0
	fcmpeq16	%f20,	%f2,	%g4
	srlx	%l4,	%g6,	%l2
	edge8n	%o2,	%i7,	%l1
	fpadd16s	%f20,	%f6,	%f31
	sll	%o1,	%i2,	%g5
	srax	%g3,	%l0,	%l3
	edge32	%o4,	%g7,	%l5
	for	%f0,	%f30,	%f30
	fsrc1	%f16,	%f10
	movgu	%icc,	%i3,	%o0
	movg	%icc,	%g2,	%l6
	array16	%o3,	%g1,	%o5
	fpadd32s	%f28,	%f24,	%f18
	fornot2s	%f17,	%f17,	%f7
	fornot2	%f2,	%f8,	%f10
	stx	%i4,	[%l7 + 0x40]
	xorcc	%o7,	0x17B7,	%i1
	sll	%i5,	0x0D,	%i6
	andncc	%o6,	%i0,	%l4
	srlx	%g4,	%g6,	%o2
	ldsh	[%l7 + 0x48],	%i7
	sdivx	%l2,	0x174A,	%l1
	movle	%xcc,	%i2,	%g5
	movle	%xcc,	%o1,	%g3
	and	%l0,	%l3,	%o4
	andn	%g7,	0x06A0,	%l5
	movpos	%xcc,	%i3,	%o0
	orncc	%g2,	%l6,	%o3
	edge8ln	%o5,	%g1,	%i4
	ldx	[%l7 + 0x30],	%o7
	fcmpgt16	%f24,	%f4,	%i5
	fzeros	%f26
	fmovdpos	%xcc,	%f13,	%f16
	mova	%icc,	%i1,	%o6
	mulscc	%i6,	0x1F09,	%i0
	mulscc	%l4,	%g4,	%g6
	udivcc	%o2,	0x1A03,	%i7
	edge32n	%l2,	%l1,	%g5
	umulcc	%o1,	%g3,	%i2
	andn	%l3,	%l0,	%g7
	fmovd	%f20,	%f28
	edge32	%l5,	%o4,	%i3
	fmovrdlez	%g2,	%f30,	%f2
	or	%o0,	%l6,	%o3
	xnorcc	%o5,	%g1,	%o7
	movleu	%xcc,	%i5,	%i1
	movleu	%icc,	%o6,	%i4
	movrne	%i6,	%i0,	%l4
	edge8	%g4,	%o2,	%i7
	fcmpne16	%f30,	%f0,	%l2
	fcmpeq32	%f26,	%f18,	%l1
	fnors	%f1,	%f24,	%f15
	stw	%g6,	[%l7 + 0x68]
	lduw	[%l7 + 0x08],	%g5
	stw	%o1,	[%l7 + 0x18]
	edge16ln	%g3,	%i2,	%l3
	sllx	%l0,	%g7,	%o4
	smulcc	%l5,	%i3,	%g2
	nop
	set	0x18, %i1
	lduw	[%l7 + %i1],	%l6
	fmovdcs	%xcc,	%f7,	%f12
	edge32n	%o0,	%o5,	%o3
	movrgz	%g1,	0x1E9,	%o7
	movrlez	%i5,	0x3B9,	%o6
	edge16	%i1,	%i6,	%i4
	smulcc	%l4,	%g4,	%i0
	nop
	set	0x1C, %g4
	lduw	[%l7 + %g4],	%o2
	fsrc1	%f14,	%f2
	sethi	0x1F4A,	%i7
	nop
	set	0x10, %g7
	stx	%l2,	[%l7 + %g7]
	ldsw	[%l7 + 0x0C],	%l1
	ldsb	[%l7 + 0x5A],	%g5
	movn	%xcc,	%g6,	%g3
	fmovdvs	%icc,	%f14,	%f7
	fones	%f9
	addc	%i2,	%o1,	%l3
	addc	%g7,	0x0716,	%l0
	ldsh	[%l7 + 0x38],	%o4
	movgu	%xcc,	%i3,	%g2
	fmovde	%icc,	%f25,	%f13
	st	%f18,	[%l7 + 0x58]
	move	%xcc,	%l6,	%o0
	sdivx	%l5,	0x1F04,	%o5
	umulcc	%g1,	0x0E1B,	%o7
	and	%i5,	%o6,	%i1
	fxors	%f3,	%f1,	%f3
	xnor	%o3,	0x019C,	%i6
	movvc	%icc,	%l4,	%g4
	alignaddr	%i4,	%o2,	%i0
	fabsd	%f28,	%f14
	srlx	%i7,	0x09,	%l2
	ldsw	[%l7 + 0x54],	%l1
	std	%f20,	[%l7 + 0x48]
	srax	%g5,	0x0A,	%g6
	fandnot1s	%f28,	%f26,	%f31
	fmovsl	%xcc,	%f2,	%f24
	fmovdne	%xcc,	%f17,	%f0
	edge32ln	%i2,	%o1,	%g3
	movcs	%icc,	%g7,	%l3
	fcmpne16	%f18,	%f22,	%l0
	move	%icc,	%o4,	%i3
	ldd	[%l7 + 0x38],	%i6
	sir	0x1908
	for	%f0,	%f28,	%f24
	st	%f25,	[%l7 + 0x24]
	ldub	[%l7 + 0x53],	%g2
	alignaddrl	%o0,	%l5,	%o5
	movleu	%icc,	%g1,	%i5
	fmovsl	%xcc,	%f20,	%f7
	movrgz	%o7,	0x02D,	%o6
	udivx	%i1,	0x01A5,	%i6
	addccc	%l4,	%g4,	%o3
	sub	%i4,	%o2,	%i7
	srax	%i0,	%l2,	%g5
	movle	%xcc,	%g6,	%l1
	fmovdgu	%icc,	%f12,	%f0
	and	%o1,	0x0941,	%i2
	fnot1	%f24,	%f16
	movre	%g7,	0x2CC,	%l3
	xor	%l0,	%g3,	%i3
	movcs	%icc,	%o4,	%g2
	movle	%xcc,	%o0,	%l6
	xnor	%o5,	%g1,	%i5
	smul	%l5,	%o7,	%o6
	movleu	%icc,	%i1,	%i6
	stb	%g4,	[%l7 + 0x5B]
	addcc	%l4,	%o3,	%i4
	xnorcc	%o2,	%i7,	%i0
	edge32n	%l2,	%g6,	%l1
	ldsb	[%l7 + 0x2A],	%g5
	fandnot2	%f4,	%f30,	%f26
	edge8n	%i2,	%g7,	%o1
	sdivx	%l3,	0x11F3,	%l0
	array32	%i3,	%o4,	%g3
	move	%xcc,	%o0,	%l6
	umul	%o5,	0x1D0A,	%g2
	fmul8x16au	%f20,	%f6,	%f2
	movrlez	%i5,	0x33A,	%l5
	fcmpgt16	%f18,	%f16,	%g1
	for	%f12,	%f24,	%f20
	ld	[%l7 + 0x28],	%f20
	edge16	%o6,	%i1,	%i6
	fnot1s	%f17,	%f15
	stx	%o7,	[%l7 + 0x08]
	lduw	[%l7 + 0x20],	%l4
	orcc	%o3,	0x0B73,	%i4
	ldsh	[%l7 + 0x46],	%g4
	edge8ln	%o2,	%i7,	%l2
	udivcc	%i0,	0x06A1,	%g6
	fpsub32	%f30,	%f10,	%f28
	edge16n	%g5,	%i2,	%g7
	mulx	%o1,	%l3,	%l1
	array8	%l0,	%o4,	%i3
	lduw	[%l7 + 0x48],	%o0
	st	%f21,	[%l7 + 0x38]
	edge32n	%g3,	%o5,	%l6
	movcc	%xcc,	%g2,	%l5
	lduh	[%l7 + 0x66],	%i5
	fmovdn	%icc,	%f20,	%f2
	xorcc	%g1,	%i1,	%o6
	sll	%o7,	%l4,	%o3
	subccc	%i4,	0x1DCC,	%g4
	sub	%o2,	%i7,	%i6
	edge16n	%i0,	%l2,	%g6
	srax	%g5,	%g7,	%i2
	edge32ln	%l3,	%l1,	%o1
	addccc	%o4,	%i3,	%l0
	sth	%g3,	[%l7 + 0x4C]
	fcmpgt16	%f12,	%f2,	%o0
	fmul8x16	%f6,	%f30,	%f2
	movpos	%xcc,	%l6,	%o5
	fmovdl	%icc,	%f3,	%f14
	edge32ln	%g2,	%i5,	%l5
	ldsb	[%l7 + 0x4A],	%i1
	fones	%f2
	edge32	%o6,	%g1,	%l4
	movleu	%icc,	%o7,	%o3
	umul	%i4,	0x1DE9,	%o2
	add	%i7,	%g4,	%i0
	sllx	%l2,	0x0D,	%g6
	movrgz	%g5,	0x03A,	%g7
	edge8n	%i2,	%i6,	%l1
	and	%o1,	0x0C23,	%o4
	alignaddr	%l3,	%l0,	%g3
	movn	%xcc,	%o0,	%i3
	mulx	%l6,	%o5,	%g2
	fmovsa	%icc,	%f13,	%f13
	movle	%xcc,	%i5,	%i1
	xnor	%l5,	%o6,	%l4
	sllx	%o7,	%o3,	%i4
	movge	%xcc,	%g1,	%i7
	orcc	%o2,	%g4,	%l2
	array8	%i0,	%g5,	%g6
	fmovrdlez	%i2,	%f30,	%f20
	ldsb	[%l7 + 0x41],	%g7
	udivcc	%l1,	0x002C,	%i6
	fmul8ulx16	%f14,	%f0,	%f20
	movle	%xcc,	%o1,	%l3
	st	%f26,	[%l7 + 0x54]
	sth	%l0,	[%l7 + 0x1A]
	lduw	[%l7 + 0x60],	%o4
	move	%icc,	%g3,	%i3
	sir	0x1ABB
	stb	%l6,	[%l7 + 0x5A]
	fmovdn	%xcc,	%f9,	%f22
	mova	%icc,	%o5,	%g2
	srl	%i5,	0x19,	%i1
	ldsw	[%l7 + 0x74],	%o0
	std	%f22,	[%l7 + 0x40]
	subc	%o6,	0x04F4,	%l4
	xnor	%l5,	0x0FAD,	%o3
	andn	%o7,	%g1,	%i4
	fmovrslez	%o2,	%f12,	%f5
	fmovdvc	%xcc,	%f4,	%f2
	stb	%g4,	[%l7 + 0x77]
	fands	%f9,	%f11,	%f19
	edge32	%l2,	%i0,	%g5
	addcc	%g6,	0x04FE,	%i7
	movn	%xcc,	%g7,	%l1
	movpos	%icc,	%i6,	%i2
	or	%l3,	0x0D7D,	%o1
	fmovda	%icc,	%f4,	%f16
	fmovsge	%icc,	%f15,	%f18
	andncc	%o4,	%l0,	%g3
	fmovsneg	%icc,	%f26,	%f0
	ldx	[%l7 + 0x28],	%i3
	fmovdn	%xcc,	%f25,	%f31
	movn	%icc,	%l6,	%o5
	movle	%xcc,	%g2,	%i1
	fmovrdgz	%o0,	%f18,	%f4
	ldub	[%l7 + 0x2E],	%i5
	umul	%o6,	%l5,	%l4
	mova	%icc,	%o3,	%o7
	edge8l	%g1,	%i4,	%g4
	xorcc	%o2,	0x0D0C,	%l2
	stb	%g5,	[%l7 + 0x4D]
	fmovsge	%icc,	%f24,	%f5
	fpadd32s	%f1,	%f29,	%f22
	fmovspos	%xcc,	%f31,	%f3
	edge16	%i0,	%i7,	%g6
	movrne	%g7,	0x198,	%i6
	fmovrse	%l1,	%f23,	%f19
	and	%i2,	%o1,	%l3
	movle	%xcc,	%o4,	%g3
	movg	%icc,	%i3,	%l0
	sub	%o5,	%l6,	%g2
	nop
	set	0x10, %g6
	std	%f28,	[%l7 + %g6]
	edge32	%o0,	%i1,	%o6
	xorcc	%i5,	0x08DE,	%l4
	array8	%o3,	%l5,	%g1
	srl	%i4,	%g4,	%o2
	mulscc	%o7,	0x1AC9,	%l2
	fmul8x16al	%f13,	%f22,	%f4
	movrgez	%i0,	%i7,	%g5
	or	%g7,	0x1491,	%g6
	edge8	%l1,	%i6,	%o1
	edge32n	%i2,	%o4,	%g3
	movpos	%xcc,	%l3,	%l0
	std	%f22,	[%l7 + 0x78]
	edge32ln	%o5,	%i3,	%l6
	andcc	%o0,	%i1,	%g2
	umul	%o6,	%l4,	%o3
	fmovs	%f17,	%f6
	fexpand	%f10,	%f10
	umul	%i5,	0x1181,	%g1
	fmul8ulx16	%f30,	%f22,	%f20
	movcs	%xcc,	%i4,	%g4
	andncc	%o2,	%l5,	%l2
	fmovrdgz	%i0,	%f6,	%f22
	edge32	%o7,	%i7,	%g7
	movvs	%icc,	%g6,	%g5
	sra	%i6,	0x15,	%l1
	fmovdneg	%xcc,	%f7,	%f31
	fmovscc	%xcc,	%f29,	%f25
	array32	%o1,	%o4,	%i2
	xnor	%g3,	%l0,	%l3
	lduw	[%l7 + 0x34],	%i3
	movre	%o5,	0x1B6,	%o0
	movvs	%xcc,	%l6,	%g2
	orcc	%i1,	0x044B,	%o6
	ldd	[%l7 + 0x70],	%f24
	edge8ln	%o3,	%i5,	%l4
	movgu	%icc,	%g1,	%g4
	fcmped	%fcc2,	%f24,	%f16
	popc	0x19FD,	%o2
	movleu	%xcc,	%i4,	%l5
	sll	%l2,	%i0,	%o7
	stb	%i7,	[%l7 + 0x29]
	st	%f21,	[%l7 + 0x44]
	andn	%g7,	%g5,	%g6
	std	%f12,	[%l7 + 0x28]
	lduw	[%l7 + 0x7C],	%i6
	movcc	%xcc,	%o1,	%o4
	edge8	%l1,	%i2,	%g3
	edge32	%l3,	%i3,	%l0
	nop
	set	0x10, %i7
	ldd	[%l7 + %i7],	%o0
	movrgz	%l6,	0x249,	%o5
	fornot1	%f22,	%f20,	%f16
	movn	%icc,	%i1,	%g2
	umulcc	%o3,	0x1BB1,	%o6
	ldub	[%l7 + 0x1E],	%i5
	fnors	%f0,	%f6,	%f8
	ldd	[%l7 + 0x70],	%g0
	fcmpeq32	%f6,	%f2,	%g4
	movrgz	%l4,	0x01F,	%o2
	sdivcc	%i4,	0x0EEA,	%l2
	andncc	%l5,	%o7,	%i0
	nop
	set	0x30, %i2
	ldd	[%l7 + %i2],	%f28
	for	%f10,	%f6,	%f12
	ldsw	[%l7 + 0x3C],	%i7
	edge8ln	%g7,	%g6,	%g5
	edge16	%o1,	%i6,	%o4
	fpackfix	%f18,	%f25
	fpsub16s	%f6,	%f18,	%f21
	mulscc	%i2,	0x0EEA,	%l1
	fmul8x16au	%f19,	%f18,	%f8
	std	%f24,	[%l7 + 0x38]
	movrgz	%l3,	%i3,	%g3
	fcmple32	%f16,	%f12,	%o0
	sll	%l0,	%l6,	%i1
	fornot2s	%f1,	%f11,	%f9
	edge32l	%g2,	%o3,	%o6
	movg	%icc,	%i5,	%o5
	stx	%g4,	[%l7 + 0x58]
	ldd	[%l7 + 0x38],	%f0
	nop
	set	0x0A, %o0
	ldsh	[%l7 + %o0],	%g1
	movcs	%icc,	%o2,	%l4
	array32	%i4,	%l5,	%l2
	sll	%i0,	%i7,	%g7
	movvc	%xcc,	%g6,	%o7
	fmovsvs	%xcc,	%f6,	%f27
	smul	%g5,	%i6,	%o1
	movre	%o4,	%l1,	%l3
	sth	%i3,	[%l7 + 0x2C]
	sub	%g3,	0x1D40,	%i2
	edge8n	%l0,	%o0,	%l6
	xnor	%i1,	%g2,	%o3
	ldd	[%l7 + 0x20],	%i4
	or	%o6,	%g4,	%o5
	orn	%g1,	0x014A,	%l4
	movrlz	%o2,	0x385,	%i4
	restore %l5, %i0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i7,	%g6
	fmovdcc	%icc,	%f20,	%f4
	ldd	[%l7 + 0x08],	%f6
	fcmple32	%f18,	%f10,	%o7
	array8	%g7,	%i6,	%g5
	movcs	%icc,	%o4,	%o1
	nop
	set	0x70, %o1
	stw	%l3,	[%l7 + %o1]
	fmul8x16au	%f27,	%f6,	%f6
	fpsub16	%f0,	%f22,	%f2
	sub	%i3,	%g3,	%i2
	move	%icc,	%l0,	%l1
	movvs	%xcc,	%o0,	%l6
	sll	%i1,	%g2,	%o3
	fones	%f18
	fcmpgt32	%f26,	%f16,	%i5
	movge	%icc,	%g4,	%o5
	movgu	%icc,	%g1,	%l4
	and	%o6,	0x050E,	%o2
	alignaddrl	%l5,	%i4,	%i0
	edge32l	%i7,	%l2,	%g6
	sub	%g7,	%o7,	%i6
	movvc	%icc,	%g5,	%o4
	std	%f8,	[%l7 + 0x30]
	smulcc	%o1,	0x1C47,	%i3
	lduw	[%l7 + 0x54],	%g3
	ldsb	[%l7 + 0x09],	%i2
	edge8l	%l0,	%l1,	%l3
	addccc	%l6,	0x14AC,	%o0
	sth	%g2,	[%l7 + 0x5C]
	movcs	%xcc,	%o3,	%i1
	movg	%icc,	%i5,	%o5
	ldd	[%l7 + 0x68],	%f22
	xorcc	%g1,	%g4,	%o6
	srlx	%o2,	0x12,	%l5
	fmovspos	%xcc,	%f22,	%f17
	movrlez	%i4,	%i0,	%l4
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	fornot2	%f14,	%f26,	%f22
	sir	0x0D8B
	or	%o7,	0x1622,	%g6
	stx	%i6,	[%l7 + 0x08]
	smul	%g5,	%o1,	%i3
	ld	[%l7 + 0x54],	%f7
	movrlez	%o4,	%g3,	%i2
	orncc	%l0,	0x166E,	%l3
	edge32l	%l6,	%l1,	%o0
	fsrc2	%f22,	%f8
	nop
	set	0x48, %l2
	ldsw	[%l7 + %l2],	%o3
	subcc	%i1,	%g2,	%o5
	fmovdge	%xcc,	%f14,	%f3
	array32	%g1,	%g4,	%o6
	fands	%f15,	%f1,	%f23
	array16	%i5,	%l5,	%o2
	subccc	%i0,	%i4,	%i7
	st	%f11,	[%l7 + 0x64]
	andncc	%l4,	%l2,	%g7
	movge	%icc,	%g6,	%i6
	fpsub32s	%f7,	%f30,	%f20
	sllx	%g5,	%o7,	%o1
	alignaddr	%o4,	%g3,	%i3
	xor	%l0,	%i2,	%l3
	edge8n	%l1,	%l6,	%o0
	fnors	%f1,	%f2,	%f8
	fmovrsne	%o3,	%f20,	%f31
	andcc	%i1,	0x0CE6,	%g2
	sth	%g1,	[%l7 + 0x64]
	movn	%icc,	%g4,	%o5
	ld	[%l7 + 0x7C],	%f20
	stw	%o6,	[%l7 + 0x24]
	add	%i5,	%l5,	%i0
	sir	0x041C
	fmul8x16al	%f15,	%f0,	%f18
	alignaddrl	%o2,	%i7,	%l4
	edge8l	%l2,	%g7,	%g6
	edge8n	%i6,	%g5,	%o7
	sllx	%o1,	%i4,	%g3
	movl	%icc,	%i3,	%o4
	fpsub32	%f18,	%f0,	%f20
	movneg	%icc,	%i2,	%l3
	fandnot1	%f24,	%f22,	%f24
	array16	%l0,	%l1,	%l6
	fmul8sux16	%f2,	%f0,	%f4
	fmovsle	%xcc,	%f13,	%f14
	smulcc	%o0,	%o3,	%g2
	fmovsne	%xcc,	%f2,	%f25
	addcc	%i1,	%g1,	%g4
	movvs	%xcc,	%o5,	%i5
	movvc	%icc,	%l5,	%o6
	addccc	%o2,	%i0,	%i7
	popc	0x1E2C,	%l4
	ld	[%l7 + 0x0C],	%f7
	movg	%xcc,	%g7,	%g6
	subcc	%i6,	%g5,	%l2
	fcmpgt32	%f4,	%f18,	%o1
	fmul8sux16	%f24,	%f30,	%f16
	array32	%o7,	%g3,	%i3
	stw	%o4,	[%l7 + 0x3C]
	fmovsleu	%xcc,	%f3,	%f11
	sdivcc	%i2,	0x1932,	%l3
	fmovsvc	%icc,	%f1,	%f16
	fone	%f4
	movre	%l0,	%i4,	%l1
	andncc	%o0,	%o3,	%g2
	edge8	%l6,	%g1,	%g4
	fnands	%f14,	%f18,	%f26
	edge16ln	%o5,	%i1,	%l5
	andn	%o6,	%o2,	%i0
	fmovrdlez	%i5,	%f22,	%f6
	siam	0x3
	ldsh	[%l7 + 0x6A],	%i7
	bshuffle	%f20,	%f4,	%f0
	edge32n	%l4,	%g6,	%i6
	movrgz	%g7,	0x19E,	%l2
	fpadd32s	%f9,	%f29,	%f24
	edge32ln	%o1,	%g5,	%o7
	subccc	%g3,	0x01B3,	%o4
	stb	%i2,	[%l7 + 0x44]
	fnor	%f12,	%f26,	%f4
	udiv	%l3,	0x03CB,	%i3
	std	%f6,	[%l7 + 0x08]
	fcmpgt32	%f6,	%f6,	%l0
	fmovsvc	%xcc,	%f29,	%f23
	xor	%i4,	%l1,	%o3
	orcc	%o0,	0x1E63,	%g2
	movl	%icc,	%g1,	%g4
	orncc	%o5,	%i1,	%l6
	fornot2s	%f24,	%f24,	%f7
	movvs	%icc,	%o6,	%l5
	sethi	0x0DF0,	%o2
	fmovdpos	%icc,	%f23,	%f7
	movge	%icc,	%i0,	%i5
	st	%f11,	[%l7 + 0x4C]
	fmovrdlz	%i7,	%f2,	%f6
	fornot1s	%f28,	%f31,	%f27
	fmovsge	%icc,	%f30,	%f17
	movrgez	%l4,	%i6,	%g7
	mova	%icc,	%l2,	%g6
	orncc	%g5,	%o7,	%o1
	movrne	%o4,	%i2,	%g3
	movl	%xcc,	%i3,	%l0
	umul	%l3,	%l1,	%i4
	sethi	0x1984,	%o0
	mulscc	%o3,	0x1CDD,	%g1
	mulx	%g2,	%g4,	%i1
	smul	%l6,	%o5,	%l5
	array16	%o2,	%o6,	%i5
	udivx	%i0,	0x1DD9,	%l4
	restore %i6, 0x173D, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f28,	%f19
	array16	%l2,	%i7,	%g5
	edge8	%g6,	%o7,	%o1
	fmovrsgez	%o4,	%f1,	%f26
	stx	%g3,	[%l7 + 0x60]
	fsrc2	%f12,	%f20
	lduw	[%l7 + 0x38],	%i3
	mulscc	%l0,	%l3,	%i2
	sdivcc	%l1,	0x0FF1,	%o0
	andn	%i4,	0x1B3D,	%g1
	udivx	%g2,	0x1D7E,	%o3
	movvc	%xcc,	%g4,	%l6
	edge8	%i1,	%l5,	%o2
	fnor	%f18,	%f10,	%f6
	movne	%xcc,	%o5,	%o6
	andncc	%i5,	%l4,	%i6
	movrlez	%g7,	%l2,	%i0
	movvs	%xcc,	%g5,	%i7
	orncc	%o7,	0x08D2,	%g6
	fmovrsgz	%o1,	%f31,	%f5
	ldd	[%l7 + 0x78],	%f30
	fcmpeq16	%f24,	%f24,	%o4
	edge16n	%g3,	%l0,	%l3
	subccc	%i2,	0x050F,	%l1
	add	%o0,	0x088E,	%i3
	ldsw	[%l7 + 0x10],	%g1
	fmovrdne	%g2,	%f0,	%f28
	movcc	%xcc,	%i4,	%g4
	ldd	[%l7 + 0x30],	%i6
	edge16n	%i1,	%o3,	%o2
	movneg	%xcc,	%l5,	%o5
	movge	%icc,	%o6,	%l4
	fpsub32s	%f5,	%f0,	%f19
	sllx	%i6,	%g7,	%l2
	popc	0x0774,	%i5
	xnor	%g5,	0x157B,	%i7
	lduw	[%l7 + 0x08],	%o7
	ldx	[%l7 + 0x38],	%i0
	array8	%g6,	%o1,	%o4
	stx	%g3,	[%l7 + 0x10]
	mova	%icc,	%l0,	%l3
	ldd	[%l7 + 0x10],	%f4
	movre	%i2,	%l1,	%i3
	fmovsneg	%xcc,	%f6,	%f17
	xnorcc	%o0,	0x1F7E,	%g2
	fornot2s	%f11,	%f31,	%f29
	fmovrsgz	%i4,	%f14,	%f24
	srl	%g4,	0x0F,	%l6
	fpsub16	%f22,	%f26,	%f16
	fnegs	%f14,	%f31
	smulcc	%g1,	0x0E56,	%i1
	movle	%icc,	%o3,	%l5
	orn	%o2,	%o5,	%o6
	andn	%l4,	%i6,	%l2
	smul	%i5,	%g5,	%i7
	fmovsl	%xcc,	%f20,	%f0
	add	%g7,	%o7,	%i0
	fandnot2s	%f21,	%f31,	%f29
	ldd	[%l7 + 0x20],	%g6
	alignaddr	%o1,	%o4,	%l0
	add	%l3,	0x0677,	%g3
	std	%f10,	[%l7 + 0x30]
	fmuld8ulx16	%f26,	%f14,	%f0
	save %i2, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i3,	%i4,	%g4
	movrlez	%l6,	0x0A0,	%g2
	edge32l	%i1,	%o3,	%l5
	fcmpeq32	%f10,	%f22,	%o2
	umulcc	%g1,	0x02B7,	%o5
	udiv	%o6,	0x022F,	%i6
	movrgz	%l4,	%l2,	%i5
	udivcc	%g5,	0x0537,	%g7
	sra	%i7,	%i0,	%g6
	edge8n	%o7,	%o4,	%l0
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	subc	%g3,	%i2,	%l1
	or	%o0,	0x19F7,	%i3
	movle	%xcc,	%i4,	%g4
	movvc	%icc,	%l6,	%g2
	movne	%xcc,	%i1,	%o3
	sllx	%o2,	%l5,	%o5
	movpos	%icc,	%g1,	%i6
	udiv	%o6,	0x006B,	%l2
	udivcc	%i5,	0x1A04,	%l4
	srlx	%g7,	%i7,	%g5
	srlx	%g6,	0x00,	%i0
	mulx	%o4,	0x16F9,	%l0
	movleu	%icc,	%o7,	%l3
	smulcc	%g3,	0x072D,	%i2
	movneg	%xcc,	%l1,	%o1
	fandnot1s	%f1,	%f0,	%f14
	smulcc	%o0,	%i3,	%g4
	mulscc	%i4,	%l6,	%g2
	lduh	[%l7 + 0x3C],	%o3
	or	%i1,	%l5,	%o5
	fandnot1	%f18,	%f12,	%f14
	move	%xcc,	%g1,	%i6
	lduh	[%l7 + 0x1A],	%o2
	udivx	%o6,	0x1C02,	%i5
	sethi	0x1D56,	%l2
	movcs	%xcc,	%g7,	%i7
	sethi	0x1BFD,	%g5
	fmovsneg	%xcc,	%f5,	%f31
	alignaddr	%l4,	%g6,	%o4
	fmul8x16al	%f4,	%f27,	%f2
	subccc	%l0,	0x003F,	%o7
	and	%l3,	%g3,	%i0
	andncc	%l1,	%o1,	%o0
	sethi	0x1DF0,	%i2
	ldsw	[%l7 + 0x2C],	%g4
	movcs	%xcc,	%i4,	%l6
	movrlz	%g2,	%i3,	%o3
	sllx	%i1,	0x12,	%o5
	movrlez	%g1,	0x28E,	%i6
	move	%xcc,	%l5,	%o2
	orncc	%i5,	0x0C84,	%o6
	sub	%g7,	%l2,	%i7
	fnor	%f12,	%f14,	%f4
	restore %g5, 0x0ED3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o4,	[%l7 + 0x08]
	movvc	%xcc,	%l0,	%l4
	edge32ln	%o7,	%l3,	%i0
	andncc	%g3,	%o1,	%o0
	fornot2s	%f31,	%f1,	%f5
	fmovdneg	%icc,	%f29,	%f2
	or	%l1,	%i2,	%i4
	lduw	[%l7 + 0x74],	%g4
	and	%g2,	%i3,	%o3
	fmuld8ulx16	%f29,	%f13,	%f22
	movvc	%icc,	%l6,	%i1
	movleu	%icc,	%o5,	%i6
	udivcc	%l5,	0x1233,	%o2
	sdivx	%i5,	0x0DA5,	%g1
	mova	%icc,	%o6,	%l2
	fmovsne	%icc,	%f5,	%f20
	lduw	[%l7 + 0x44],	%i7
	movge	%xcc,	%g7,	%g5
	fcmpes	%fcc2,	%f15,	%f5
	andncc	%o4,	%g6,	%l0
	edge16	%o7,	%l3,	%l4
	addccc	%i0,	%o1,	%o0
	andcc	%l1,	0x1403,	%g3
	ldsb	[%l7 + 0x6B],	%i4
	movcc	%icc,	%i2,	%g2
	fxors	%f28,	%f1,	%f18
	smul	%i3,	0x0EEA,	%g4
	sir	0x19FF
	fmovs	%f23,	%f8
	array16	%o3,	%l6,	%o5
	srl	%i6,	%l5,	%i1
	stx	%i5,	[%l7 + 0x78]
	edge8n	%o2,	%o6,	%g1
	ldsh	[%l7 + 0x62],	%i7
	move	%icc,	%g7,	%g5
	srl	%l2,	0x04,	%o4
	udivcc	%g6,	0x0F94,	%o7
	edge32n	%l3,	%l4,	%l0
	movrlz	%o1,	0x2AA,	%o0
	fcmpne16	%f18,	%f28,	%l1
	and	%i0,	0x0168,	%g3
	fcmpne32	%f4,	%f12,	%i4
	fcmple16	%f10,	%f14,	%g2
	std	%f26,	[%l7 + 0x38]
	sub	%i3,	%i2,	%o3
	ldd	[%l7 + 0x28],	%i6
	movcc	%xcc,	%g4,	%i6
	addcc	%o5,	%l5,	%i5
	movvc	%xcc,	%o2,	%i1
	fcmpgt16	%f20,	%f24,	%g1
	save %i7, 0x1BF7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f1,	%f21
	lduh	[%l7 + 0x38],	%o6
	sra	%g5,	%o4,	%g6
	move	%icc,	%l2,	%l3
	sra	%l4,	0x0F,	%l0
	orcc	%o1,	%o0,	%o7
	umulcc	%l1,	0x0220,	%i0
	edge32l	%i4,	%g3,	%g2
	edge32	%i3,	%o3,	%l6
	fandnot1	%f10,	%f4,	%f8
	fsrc2	%f14,	%f6
	edge32l	%i2,	%i6,	%g4
	ldd	[%l7 + 0x18],	%l4
	movrgz	%i5,	%o5,	%i1
	umul	%g1,	0x0D81,	%i7
	andn	%o2,	0x158B,	%g7
	movcs	%xcc,	%g5,	%o4
	fpadd16	%f16,	%f24,	%f0
	andn	%g6,	0x0995,	%l2
	nop
	set	0x28, %l5
	ldd	[%l7 + %l5],	%l2
	movpos	%xcc,	%o6,	%l4
	fornot2	%f20,	%f12,	%f28
	std	%f8,	[%l7 + 0x78]
	sir	0x10DC
	fpsub32	%f28,	%f8,	%f20
	movrlez	%o1,	%l0,	%o0
	ldsh	[%l7 + 0x6E],	%l1
	movcc	%icc,	%i0,	%o7
	movne	%xcc,	%i4,	%g2
	fmovsleu	%xcc,	%f27,	%f11
	alignaddr	%g3,	%o3,	%i3
	lduh	[%l7 + 0x62],	%i2
	sdiv	%i6,	0x0F71,	%g4
	nop
	set	0x2C, %l3
	ldsb	[%l7 + %l3],	%l5
	fmovsle	%xcc,	%f20,	%f30
	fmovde	%xcc,	%f8,	%f22
	movn	%icc,	%i5,	%o5
	fmovsle	%icc,	%f21,	%f10
	movgu	%xcc,	%l6,	%g1
	ldsw	[%l7 + 0x20],	%i1
	fsrc2s	%f19,	%f3
	sdivcc	%o2,	0x0F13,	%i7
	ldsh	[%l7 + 0x5E],	%g7
	fmovrdlz	%o4,	%f2,	%f16
	subcc	%g6,	0x1CA4,	%l2
	fmovsgu	%icc,	%f23,	%f13
	save %l3, %g5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f30,	%f6,	%f7
	fmovsa	%icc,	%f13,	%f4
	sdiv	%o6,	0x008D,	%o1
	lduh	[%l7 + 0x10],	%o0
	movrgz	%l1,	0x38C,	%i0
	udivcc	%l0,	0x1057,	%o7
	array32	%g2,	%g3,	%i4
	alignaddrl	%i3,	%o3,	%i6
	popc	0x043E,	%i2
	udiv	%l5,	0x1467,	%i5
	array16	%g4,	%l6,	%g1
	fmovdn	%icc,	%f31,	%f14
	mova	%icc,	%o5,	%o2
	fmovsvc	%icc,	%f14,	%f1
	movge	%xcc,	%i7,	%i1
	edge32ln	%o4,	%g6,	%g7
	xnorcc	%l2,	%g5,	%l3
	movrlez	%o6,	0x0E1,	%l4
	fmovdcs	%icc,	%f13,	%f9
	udiv	%o1,	0x154F,	%l1
	ldsh	[%l7 + 0x5A],	%i0
	edge16n	%l0,	%o7,	%g2
	fmovsvc	%icc,	%f30,	%f29
	movleu	%xcc,	%o0,	%g3
	array32	%i4,	%i3,	%o3
	and	%i6,	0x1C66,	%i2
	fmovrdne	%l5,	%f2,	%f18
	edge8ln	%i5,	%g4,	%l6
	add	%g1,	0x04B8,	%o2
	movrlez	%o5,	0x09B,	%i1
	sdivcc	%i7,	0x14C6,	%o4
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	mulx	%g6,	0x03DC,	%l3
	nop
	set	0x10, %l1
	std	%f24,	[%l7 + %l1]
	andn	%g5,	0x0048,	%l4
	smulcc	%o1,	%o6,	%i0
	srax	%l1,	0x11,	%l0
	addc	%g2,	0x0701,	%o0
	stw	%g3,	[%l7 + 0x14]
	andcc	%i4,	0x1AA6,	%o7
	srl	%o3,	%i3,	%i2
	movne	%icc,	%i6,	%i5
	fmovdge	%icc,	%f3,	%f5
	srax	%l5,	%l6,	%g4
	edge32	%o2,	%o5,	%i1
	sth	%i7,	[%l7 + 0x1C]
	edge32n	%o4,	%g1,	%l2
	fmul8x16al	%f3,	%f22,	%f22
	fxors	%f8,	%f22,	%f19
	andncc	%g7,	%g6,	%g5
	movn	%xcc,	%l4,	%o1
	addcc	%o6,	%i0,	%l3
	array32	%l0,	%g2,	%l1
	add	%g3,	%i4,	%o7
	fmovrdgez	%o3,	%f14,	%f8
	fandnot2s	%f21,	%f24,	%f7
	edge8ln	%o0,	%i2,	%i6
	fmovdne	%icc,	%f19,	%f24
	orn	%i3,	0x1031,	%l5
	ldub	[%l7 + 0x42],	%l6
	add	%i5,	%g4,	%o5
	movn	%icc,	%o2,	%i7
	smul	%i1,	0x07F3,	%g1
	movrgz	%l2,	0x164,	%g7
	orncc	%o4,	0x14D4,	%g6
	ldsb	[%l7 + 0x47],	%l4
	edge8ln	%g5,	%o1,	%o6
	array32	%i0,	%l3,	%g2
	edge16n	%l1,	%g3,	%l0
	movl	%icc,	%o7,	%o3
	edge32n	%i4,	%i2,	%i6
	ldd	[%l7 + 0x70],	%f6
	fcmpd	%fcc3,	%f0,	%f12
	fmovdgu	%icc,	%f2,	%f31
	fmovdn	%xcc,	%f4,	%f12
	fsrc1	%f28,	%f20
	xorcc	%i3,	%l5,	%l6
	stw	%o0,	[%l7 + 0x34]
	smul	%g4,	0x05C4,	%o5
	ldd	[%l7 + 0x78],	%f8
	orncc	%i5,	0x0812,	%o2
	fmovd	%f26,	%f4
	umul	%i1,	0x1ED6,	%i7
	std	%f14,	[%l7 + 0x28]
	fmul8sux16	%f28,	%f30,	%f6
	ldd	[%l7 + 0x28],	%l2
	udivx	%g7,	0x08DB,	%o4
	fsrc1	%f22,	%f22
	fmovsgu	%icc,	%f24,	%f4
	move	%icc,	%g6,	%g1
	fexpand	%f19,	%f4
	movvs	%xcc,	%l4,	%o1
	sdivcc	%g5,	0x0F9B,	%i0
	movne	%icc,	%l3,	%g2
	movge	%icc,	%l1,	%g3
	fabss	%f8,	%f22
	ldsw	[%l7 + 0x64],	%o6
	fandnot2	%f20,	%f28,	%f30
	restore %l0, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i2,	%i6,	%i3
	fabss	%f1,	%f28
	popc	%o3,	%l6
	smul	%o0,	0x12C6,	%l5
	alignaddr	%o5,	%g4,	%i5
	movneg	%xcc,	%i1,	%i7
	for	%f16,	%f2,	%f8
	edge16n	%l2,	%o2,	%o4
	fmovsvs	%xcc,	%f3,	%f7
	edge32n	%g7,	%g1,	%g6
	movle	%icc,	%l4,	%o1
	smul	%i0,	%l3,	%g2
	sllx	%l1,	%g5,	%o6
	array32	%l0,	%g3,	%o7
	fmovspos	%xcc,	%f29,	%f25
	fsrc1	%f20,	%f4
	ldd	[%l7 + 0x18],	%f8
	movge	%icc,	%i4,	%i2
	movvs	%icc,	%i3,	%o3
	array16	%i6,	%o0,	%l6
	fcmpeq16	%f20,	%f26,	%l5
	addcc	%o5,	0x019A,	%i5
	edge32	%i1,	%g4,	%i7
	subc	%o2,	0x049C,	%o4
	movrgz	%g7,	%g1,	%g6
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	std	%f6,	[%l7 + 0x60]
	srlx	%l2,	0x00,	%l3
	movneg	%xcc,	%l1,	%g5
	lduw	[%l7 + 0x6C],	%o6
	movrne	%l0,	0x0EB,	%g3
	mulscc	%o7,	%i4,	%g2
	sll	%i3,	0x1D,	%i2
	movgu	%xcc,	%o3,	%o0
	addccc	%l6,	%i6,	%l5
	movpos	%xcc,	%o5,	%i5
	stw	%g4,	[%l7 + 0x30]
	andcc	%i7,	%i1,	%o4
	std	%f6,	[%l7 + 0x60]
	orcc	%g7,	0x1972,	%g1
	xnor	%g6,	0x0723,	%o2
	ldx	[%l7 + 0x28],	%l4
	edge16ln	%o1,	%l2,	%i0
	movvs	%icc,	%l1,	%g5
	andcc	%o6,	0x0C18,	%l3
	edge32	%g3,	%o7,	%l0
	movg	%xcc,	%i4,	%g2
	mulscc	%i2,	0x11E3,	%i3
	sth	%o0,	[%l7 + 0x30]
	fcmpne16	%f4,	%f0,	%o3
	stb	%i6,	[%l7 + 0x35]
	movrne	%l5,	0x045,	%l6
	fandnot1	%f0,	%f4,	%f28
	fmovrslez	%i5,	%f4,	%f22
	addc	%g4,	%i7,	%o5
	edge16l	%o4,	%g7,	%g1
	fmovrdne	%g6,	%f0,	%f12
	ldx	[%l7 + 0x10],	%o2
	edge8n	%i1,	%l4,	%l2
	fmul8ulx16	%f12,	%f28,	%f26
	mova	%xcc,	%o1,	%i0
	umulcc	%l1,	%o6,	%l3
	fmovscc	%xcc,	%f26,	%f10
	sethi	0x105A,	%g5
	orncc	%g3,	%o7,	%l0
	save %g2, 0x1FCF, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i3,	0x098C,	%i4
	movge	%xcc,	%o3,	%i6
	move	%icc,	%o0,	%l5
	movcc	%icc,	%l6,	%i5
	ldub	[%l7 + 0x29],	%i7
	movrlz	%o5,	%o4,	%g4
	fmovsg	%icc,	%f18,	%f12
	fmuld8ulx16	%f11,	%f29,	%f2
	edge32	%g1,	%g7,	%g6
	movn	%icc,	%o2,	%l4
	fcmpd	%fcc1,	%f16,	%f22
	addc	%l2,	0x09C6,	%o1
	xnor	%i0,	%l1,	%o6
	ldd	[%l7 + 0x40],	%f12
	movne	%xcc,	%l3,	%g5
	fmovrdgez	%g3,	%f0,	%f20
	movrne	%o7,	%l0,	%g2
	udivcc	%i1,	0x109C,	%i3
	ldsb	[%l7 + 0x55],	%i4
	edge16	%o3,	%i2,	%o0
	fmovdcs	%xcc,	%f20,	%f22
	ldub	[%l7 + 0x64],	%i6
	ldd	[%l7 + 0x10],	%f20
	fmovscc	%icc,	%f3,	%f5
	movrlz	%l6,	%i5,	%l5
	ldd	[%l7 + 0x48],	%f24
	fmovsne	%xcc,	%f2,	%f9
	fmuld8ulx16	%f1,	%f4,	%f10
	movg	%xcc,	%o5,	%i7
	alignaddrl	%o4,	%g1,	%g4
	orncc	%g6,	0x1007,	%o2
	edge32ln	%g7,	%l2,	%l4
	addcc	%o1,	0x19E2,	%i0
	ldd	[%l7 + 0x78],	%f30
	sll	%o6,	%l3,	%g5
	add	%g3,	%l1,	%o7
	smulcc	%g2,	%i1,	%i3
	movleu	%icc,	%i4,	%l0
	restore %i2, 0x0F6D, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f15,	%f9
	std	%f22,	[%l7 + 0x20]
	edge16	%o0,	%i6,	%i5
	addcc	%l6,	%o5,	%l5
	xorcc	%i7,	0x1BFD,	%g1
	sth	%g4,	[%l7 + 0x52]
	movpos	%xcc,	%o4,	%o2
	sra	%g7,	0x05,	%l2
	movneg	%icc,	%g6,	%l4
	nop
	set	0x24, %l0
	stb	%i0,	[%l7 + %l0]
	mulscc	%o1,	%o6,	%g5
	movne	%icc,	%l3,	%l1
	fmovda	%icc,	%f3,	%f8
	umul	%o7,	%g3,	%i1
	movle	%icc,	%g2,	%i3
	for	%f8,	%f6,	%f10
	fsrc1	%f26,	%f6
	edge32ln	%l0,	%i2,	%o3
	fmovdne	%xcc,	%f9,	%f27
	movg	%icc,	%i4,	%o0
	array8	%i6,	%l6,	%i5
	subcc	%o5,	%i7,	%l5
	fmovd	%f22,	%f2
	fmovse	%xcc,	%f2,	%f17
	udivx	%g1,	0x1D95,	%g4
	sdivcc	%o4,	0x0F65,	%g7
	fxnors	%f11,	%f9,	%f9
	sdiv	%l2,	0x077A,	%o2
	bshuffle	%f24,	%f14,	%f12
	fmul8ulx16	%f24,	%f4,	%f8
	movn	%icc,	%g6,	%i0
	nop
	set	0x58, %g1
	ldx	[%l7 + %g1],	%o1
	movleu	%xcc,	%l4,	%g5
	mulx	%o6,	0x17CA,	%l3
	lduh	[%l7 + 0x0E],	%o7
	edge16n	%l1,	%g3,	%i1
	movrgz	%i3,	0x1B7,	%g2
	fcmple32	%f22,	%f18,	%l0
	subccc	%o3,	0x0B1C,	%i4
	std	%f6,	[%l7 + 0x70]
	array32	%i2,	%i6,	%l6
	xorcc	%i5,	%o5,	%o0
	movge	%icc,	%l5,	%i7
	movvc	%xcc,	%g4,	%g1
	movg	%icc,	%g7,	%o4
	andn	%o2,	%g6,	%l2
	ldd	[%l7 + 0x30],	%i0
	movg	%icc,	%o1,	%g5
	movvs	%icc,	%o6,	%l4
	fpack16	%f14,	%f21
	fmovsl	%xcc,	%f14,	%f3
	sdiv	%l3,	0x0548,	%o7
	fmul8x16au	%f24,	%f11,	%f30
	stx	%l1,	[%l7 + 0x58]
	mulx	%i1,	%g3,	%i3
	movrne	%l0,	%o3,	%i4
	movleu	%icc,	%g2,	%i6
	sdivcc	%i2,	0x04EE,	%l6
	fmovsa	%icc,	%f30,	%f20
	fpadd16	%f6,	%f14,	%f8
	edge8ln	%o5,	%i5,	%o0
	alignaddrl	%i7,	%g4,	%g1
	move	%xcc,	%l5,	%g7
	movgu	%icc,	%o2,	%o4
	fzeros	%f19
	stx	%l2,	[%l7 + 0x10]
	ldsb	[%l7 + 0x60],	%g6
	fnot1	%f26,	%f22
	stb	%i0,	[%l7 + 0x3B]
	smul	%g5,	0x0B7E,	%o1
	fxor	%f10,	%f22,	%f30
	popc	0x01E7,	%l4
	sub	%o6,	0x17C9,	%l3
	add	%o7,	0x0B48,	%i1
	mulscc	%g3,	0x138E,	%i3
	movrgz	%l0,	%l1,	%o3
	sllx	%g2,	%i6,	%i4
	fmovdneg	%icc,	%f16,	%f24
	fmovde	%icc,	%f6,	%f11
	movg	%xcc,	%l6,	%o5
	ldx	[%l7 + 0x08],	%i2
	fmovsleu	%xcc,	%f25,	%f20
	sdivcc	%o0,	0x08CD,	%i7
	fnot1s	%f19,	%f29
	fmovsle	%icc,	%f23,	%f4
	movvc	%xcc,	%i5,	%g4
	edge16l	%g1,	%g7,	%l5
	fmovscc	%xcc,	%f29,	%f4
	xor	%o4,	%l2,	%g6
	sub	%o2,	0x076E,	%g5
	save %i0, 0x01C3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x5C],	%o1
	movcc	%icc,	%o6,	%l3
	fandnot1	%f20,	%f8,	%f24
	fmovrdlez	%i1,	%f0,	%f16
	and	%o7,	0x0F4A,	%i3
	sir	0x088E
	fmovrdgz	%g3,	%f0,	%f20
	sdivcc	%l1,	0x1A65,	%o3
	srl	%l0,	0x0E,	%i6
	fandnot1s	%f1,	%f27,	%f14
	fpadd32s	%f19,	%f8,	%f29
	ldd	[%l7 + 0x28],	%i4
	edge32l	%g2,	%l6,	%o5
	subcc	%i2,	%o0,	%i7
	lduh	[%l7 + 0x76],	%g4
	ldsw	[%l7 + 0x54],	%i5
	movle	%icc,	%g1,	%l5
	fmovsl	%icc,	%f8,	%f30
	edge16ln	%o4,	%l2,	%g6
	orcc	%o2,	0x1F6F,	%g5
	fmovsneg	%icc,	%f7,	%f10
	movneg	%xcc,	%g7,	%i0
	movcs	%icc,	%l4,	%o1
	std	%f2,	[%l7 + 0x50]
	xorcc	%o6,	%l3,	%i1
	addcc	%i3,	0x1E99,	%g3
	fcmpne16	%f14,	%f24,	%l1
	fpadd16	%f6,	%f14,	%f8
	umul	%o3,	%l0,	%i6
	srl	%o7,	%g2,	%l6
	array8	%i4,	%o5,	%o0
	xor	%i2,	0x0CB3,	%g4
	edge8ln	%i7,	%g1,	%l5
	edge8ln	%o4,	%l2,	%g6
	lduh	[%l7 + 0x50],	%i5
	edge32n	%g5,	%o2,	%i0
	movrne	%l4,	0x22F,	%o1
	ld	[%l7 + 0x34],	%f24
	fmovsle	%icc,	%f25,	%f3
	srl	%o6,	0x10,	%l3
	smulcc	%i1,	0x0AEA,	%i3
	sethi	0x0AAD,	%g3
	fmovrdgz	%g7,	%f0,	%f22
	mulx	%o3,	%l1,	%i6
	edge32n	%l0,	%o7,	%l6
	fmul8x16au	%f24,	%f5,	%f10
	smulcc	%g2,	0x0206,	%o5
	movpos	%xcc,	%i4,	%i2
	movrlez	%o0,	0x3EF,	%i7
	save %g4, %g1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	0x0154,	%g6
	movge	%icc,	%l2,	%i5
	edge16n	%g5,	%o2,	%l4
	sll	%i0,	%o6,	%o1
	ldub	[%l7 + 0x23],	%i1
	bshuffle	%f18,	%f4,	%f26
	fnot2s	%f28,	%f13
	movleu	%xcc,	%l3,	%i3
	udivcc	%g3,	0x19A0,	%o3
	srlx	%g7,	0x1C,	%i6
	mulscc	%l0,	0x165A,	%o7
	movg	%icc,	%l1,	%g2
	sdivcc	%l6,	0x0D0D,	%o5
	addccc	%i4,	0x1394,	%o0
	save %i2, %i7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f22,	%f31
	popc	%g1,	%l5
	udivx	%o4,	0x0306,	%l2
	orcc	%g6,	%i5,	%g5
	sdivx	%l4,	0x1E9C,	%i0
	udivx	%o6,	0x1322,	%o2
	ldd	[%l7 + 0x18],	%o0
	edge32	%i1,	%i3,	%l3
	movvs	%icc,	%g3,	%g7
	fmovrdne	%i6,	%f8,	%f24
	edge32	%o3,	%l0,	%o7
	array16	%g2,	%l1,	%o5
	sra	%i4,	0x0E,	%l6
	movleu	%icc,	%i2,	%o0
	ldsw	[%l7 + 0x20],	%g4
	movpos	%xcc,	%g1,	%i7
	fmovsvc	%icc,	%f8,	%f21
	edge16l	%l5,	%l2,	%o4
	movvc	%xcc,	%i5,	%g5
	ldsb	[%l7 + 0x33],	%g6
	movcs	%icc,	%l4,	%i0
	orn	%o2,	%o6,	%i1
	fxnors	%f5,	%f18,	%f17
	edge16l	%i3,	%o1,	%l3
	xor	%g7,	0x0362,	%g3
	fnegs	%f6,	%f20
	subccc	%i6,	%o3,	%l0
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	sethi	0x0CD5,	%i4
	fmovrde	%l6,	%f6,	%f26
	sub	%l1,	0x11B1,	%i2
	movgu	%icc,	%o0,	%g4
	subccc	%i7,	0x0F97,	%l5
	nop
	set	0x4E, %o6
	ldub	[%l7 + %o6],	%l2
	fornot2	%f28,	%f30,	%f6
	movcc	%xcc,	%o4,	%i5
	and	%g5,	0x1504,	%g6
	movle	%icc,	%l4,	%g1
	stw	%o2,	[%l7 + 0x10]
	fmovsa	%xcc,	%f13,	%f9
	orncc	%i0,	%o6,	%i1
	bshuffle	%f20,	%f22,	%f16
	movleu	%icc,	%o1,	%i3
	fmul8x16al	%f31,	%f3,	%f24
	nop
	set	0x44, %i3
	sth	%g7,	[%l7 + %i3]
	or	%l3,	%i6,	%g3
	srlx	%o3,	%g2,	%o7
	nop
	set	0x47, %i4
	ldsb	[%l7 + %i4],	%o5
	fnot1s	%f17,	%f23
	movrgez	%i4,	%l0,	%l1
	movvc	%icc,	%l6,	%o0
	movne	%xcc,	%i2,	%g4
	ld	[%l7 + 0x38],	%f28
	fmovdcc	%xcc,	%f3,	%f28
	srlx	%l5,	0x1E,	%l2
	movle	%icc,	%o4,	%i7
	xorcc	%i5,	0x0549,	%g6
	addc	%l4,	0x0026,	%g5
	fmovsleu	%icc,	%f8,	%f13
	srax	%g1,	0x11,	%i0
	srax	%o6,	%i1,	%o2
	ldx	[%l7 + 0x10],	%o1
	fors	%f0,	%f3,	%f3
	fands	%f19,	%f16,	%f14
	movg	%xcc,	%g7,	%i3
	lduw	[%l7 + 0x28],	%l3
	edge32	%i6,	%o3,	%g2
	xnor	%o7,	%g3,	%i4
	movcs	%icc,	%l0,	%o5
	fmovsne	%icc,	%f28,	%f28
	bshuffle	%f18,	%f28,	%f18
	st	%f2,	[%l7 + 0x0C]
	fmovsge	%icc,	%f5,	%f13
	movrlez	%l1,	0x001,	%o0
	movcs	%xcc,	%i2,	%g4
	xor	%l5,	0x13D0,	%l6
	stw	%o4,	[%l7 + 0x24]
	array32	%i7,	%i5,	%g6
	fmul8x16	%f29,	%f4,	%f10
	ldsb	[%l7 + 0x60],	%l4
	fmovrde	%g5,	%f2,	%f8
	smul	%g1,	0x1534,	%i0
	array32	%o6,	%i1,	%o2
	xorcc	%o1,	%l2,	%i3
	fmovs	%f2,	%f20
	edge16	%l3,	%i6,	%g7
	sth	%g2,	[%l7 + 0x40]
	array16	%o3,	%g3,	%i4
	movrlez	%l0,	0x0E1,	%o7
	smulcc	%l1,	0x07DF,	%o5
	movrne	%o0,	%g4,	%i2
	ld	[%l7 + 0x70],	%f20
	move	%icc,	%l6,	%o4
	fpadd16	%f6,	%f10,	%f16
	stb	%l5,	[%l7 + 0x54]
	movne	%xcc,	%i5,	%g6
	popc	%i7,	%g5
	edge32n	%g1,	%i0,	%l4
	movgu	%xcc,	%i1,	%o6
	srlx	%o1,	%o2,	%i3
	sethi	0x1234,	%l2
	edge16l	%i6,	%g7,	%l3
	srlx	%g2,	%o3,	%i4
	mova	%xcc,	%l0,	%o7
	orcc	%l1,	%o5,	%g3
	ldsb	[%l7 + 0x57],	%g4
	alignaddrl	%i2,	%l6,	%o4
	movne	%icc,	%l5,	%o0
	orcc	%i5,	%i7,	%g6
	edge8	%g1,	%g5,	%l4
	sub	%i1,	%i0,	%o1
	sth	%o2,	[%l7 + 0x46]
	sdivcc	%i3,	0x04FB,	%l2
	sllx	%o6,	0x1C,	%g7
	or	%l3,	%g2,	%o3
	fpsub16s	%f10,	%f10,	%f27
	and	%i6,	0x1CDC,	%i4
	fandnot2s	%f22,	%f19,	%f30
	stx	%o7,	[%l7 + 0x38]
	edge16l	%l1,	%l0,	%o5
	udiv	%g3,	0x007E,	%g4
	sra	%l6,	%o4,	%i2
	subc	%o0,	%i5,	%l5
	ld	[%l7 + 0x70],	%f7
	movgu	%icc,	%g6,	%g1
	srax	%g5,	%i7,	%i1
	udiv	%l4,	0x0765,	%o1
	subccc	%i0,	0x1058,	%o2
	array8	%i3,	%o6,	%l2
	fsrc1s	%f5,	%f22
	fmuld8sux16	%f17,	%f31,	%f6
	fmovsvc	%icc,	%f15,	%f31
	srax	%l3,	%g2,	%g7
	fone	%f2
	fmovspos	%icc,	%f21,	%f3
	srax	%i6,	0x09,	%i4
	edge8l	%o3,	%o7,	%l1
	movle	%icc,	%l0,	%o5
	movcc	%icc,	%g3,	%l6
	umul	%g4,	0x01CE,	%o4
	mulx	%i2,	%o0,	%l5
	movpos	%xcc,	%i5,	%g6
	fmovrsne	%g1,	%f23,	%f26
	ldd	[%l7 + 0x20],	%f16
	addccc	%g5,	0x0A70,	%i7
	edge32l	%l4,	%i1,	%i0
	edge8	%o2,	%o1,	%i3
	array8	%l2,	%l3,	%g2
	movleu	%xcc,	%o6,	%i6
	fmovrdgz	%i4,	%f26,	%f8
	fcmpeq32	%f10,	%f0,	%o3
	ldub	[%l7 + 0x1E],	%g7
	fnegd	%f18,	%f22
	xnorcc	%o7,	%l1,	%l0
	orcc	%g3,	%l6,	%g4
	subc	%o4,	0x1F15,	%i2
	alignaddr	%o0,	%o5,	%l5
	fmovdpos	%icc,	%f28,	%f16
	fmovsl	%icc,	%f6,	%f24
	addccc	%g6,	0x17F8,	%g1
	udivx	%g5,	0x1747,	%i5
	orncc	%l4,	0x1A2B,	%i1
	fmovsne	%xcc,	%f30,	%f11
	fmovrde	%i0,	%f6,	%f12
	movg	%icc,	%i7,	%o2
	orcc	%o1,	0x0DEF,	%i3
	subcc	%l3,	0x0940,	%g2
	ldx	[%l7 + 0x10],	%l2
	movcs	%xcc,	%i6,	%o6
	ldd	[%l7 + 0x08],	%f2
	movg	%icc,	%i4,	%o3
	fmul8x16au	%f27,	%f23,	%f12
	movg	%xcc,	%g7,	%l1
	edge8n	%l0,	%g3,	%l6
	srl	%o7,	0x08,	%o4
	nop
	set	0x42, %o2
	lduh	[%l7 + %o2],	%g4
	sethi	0x11E1,	%o0
	move	%icc,	%i2,	%l5
	ldd	[%l7 + 0x08],	%f14
	movge	%icc,	%o5,	%g1
	subcc	%g5,	0x16E4,	%i5
	array32	%g6,	%l4,	%i0
	sllx	%i7,	0x1F,	%i1
	andn	%o2,	0x0D0A,	%o1
	fmovdl	%xcc,	%f4,	%f24
	xnorcc	%i3,	%g2,	%l2
	fnand	%f16,	%f30,	%f24
	fmovdleu	%icc,	%f16,	%f23
	sra	%i6,	%o6,	%l3
	sir	0x19DB
	edge32l	%o3,	%g7,	%i4
	srlx	%l1,	0x1A,	%l0
	addc	%l6,	0x13D5,	%g3
	udivcc	%o4,	0x06EC,	%o7
	movge	%icc,	%g4,	%o0
	ldsh	[%l7 + 0x6C],	%l5
	xnor	%o5,	0x1D9E,	%i2
	xorcc	%g5,	%g1,	%g6
	udiv	%l4,	0x1842,	%i5
	movcs	%xcc,	%i7,	%i0
	edge16	%o2,	%i1,	%i3
	udiv	%g2,	0x0888,	%l2
	orcc	%o1,	0x0E23,	%i6
	restore %o6, 0x1420, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o3,	[%l7 + 0x2F]
	srl	%i4,	0x1D,	%g7
	fmovdleu	%xcc,	%f21,	%f19
	udiv	%l1,	0x15AE,	%l6
	edge32	%l0,	%o4,	%g3
	edge8ln	%o7,	%o0,	%l5
	edge32l	%g4,	%i2,	%g5
	edge16ln	%g1,	%g6,	%o5
	movpos	%icc,	%l4,	%i5
	fxnor	%f2,	%f16,	%f4
	fcmpeq32	%f16,	%f30,	%i0
	movgu	%icc,	%i7,	%o2
	movn	%icc,	%i1,	%g2
	smul	%l2,	0x1408,	%o1
	fmovdcc	%icc,	%f27,	%f2
	fnors	%f16,	%f24,	%f3
	fcmpne16	%f28,	%f12,	%i3
	fmovspos	%xcc,	%f22,	%f0
	fmovdgu	%xcc,	%f20,	%f16
	fmovrdlz	%i6,	%f22,	%f22
	fmovdne	%xcc,	%f21,	%f12
	fcmpes	%fcc3,	%f25,	%f7
	movcs	%xcc,	%l3,	%o3
	ld	[%l7 + 0x2C],	%f16
	fpack32	%f28,	%f12,	%f18
	fmovs	%f20,	%f20
	fmul8x16au	%f29,	%f22,	%f22
	fmovrsne	%o6,	%f17,	%f31
	fnot2s	%f25,	%f20
	fmul8sux16	%f28,	%f18,	%f28
	movvs	%xcc,	%g7,	%i4
	fxor	%f14,	%f14,	%f24
	fabsd	%f30,	%f2
	stb	%l6,	[%l7 + 0x18]
	orcc	%l1,	%o4,	%g3
	sir	0x03C3
	andn	%l0,	0x07CC,	%o0
	srl	%l5,	%o7,	%g4
	subcc	%g5,	0x1FE3,	%i2
	ldx	[%l7 + 0x70],	%g1
	xor	%o5,	%g6,	%l4
	subccc	%i5,	%i0,	%i7
	fzero	%f12
	udivx	%i1,	0x083A,	%o2
	edge16	%l2,	%o1,	%i3
	lduw	[%l7 + 0x4C],	%g2
	andn	%i6,	0x15BC,	%l3
	edge32ln	%o3,	%o6,	%g7
	movn	%icc,	%i4,	%l1
	fandnot1s	%f1,	%f8,	%f10
	udiv	%l6,	0x03E6,	%g3
	array8	%l0,	%o0,	%o4
	ldd	[%l7 + 0x30],	%l4
	edge8l	%o7,	%g4,	%i2
	movrgz	%g1,	0x1FB,	%g5
	smulcc	%g6,	0x084A,	%l4
	movle	%icc,	%o5,	%i5
	movvs	%xcc,	%i0,	%i7
	sdiv	%i1,	0x09C1,	%l2
	fmovrsne	%o2,	%f13,	%f28
	xnor	%o1,	0x07EB,	%i3
	umulcc	%i6,	0x1E05,	%l3
	subcc	%o3,	0x03F3,	%g2
	pdist	%f10,	%f4,	%f24
	edge16	%o6,	%g7,	%l1
	andcc	%i4,	%l6,	%l0
	ldsh	[%l7 + 0x10],	%o0
	sir	0x19CB
	umulcc	%g3,	%o4,	%l5
	smul	%o7,	0x1796,	%i2
	fmovsg	%icc,	%f22,	%f10
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f6
	fcmpd	%fcc3,	%f0,	%f22
	mulscc	%g1,	%g4,	%g5
	movcc	%icc,	%g6,	%l4
	fmovrsne	%i5,	%f19,	%f12
	fexpand	%f0,	%f0
	addc	%o5,	0x0040,	%i0
	edge8	%i1,	%l2,	%o2
	umul	%i7,	%o1,	%i3
	alignaddr	%l3,	%i6,	%o3
	movrgez	%g2,	0x2B5,	%g7
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	alignaddr	%l1,	%l6,	%l0
	andncc	%o0,	%g3,	%l5
	addcc	%o4,	%o7,	%i2
	std	%f20,	[%l7 + 0x28]
	andncc	%g4,	%g1,	%g5
	movge	%xcc,	%l4,	%g6
	sth	%i5,	[%l7 + 0x40]
	save %i0, %o5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f14,	%f12,	%f6
	edge32	%o2,	%i7,	%o1
	ldsh	[%l7 + 0x08],	%i1
	ldsb	[%l7 + 0x08],	%l3
	movle	%xcc,	%i6,	%i3
	andn	%o3,	0x07B2,	%g2
	stb	%o6,	[%l7 + 0x1A]
	fpack32	%f24,	%f20,	%f10
	fxnors	%f16,	%f2,	%f18
	or	%i4,	0x17FD,	%l1
	popc	0x1CD5,	%l6
	edge32ln	%g7,	%l0,	%o0
	smul	%g3,	0x15F4,	%o4
	andcc	%l5,	0x0238,	%o7
	movrgez	%g4,	%i2,	%g5
	edge8	%g1,	%g6,	%i5
	edge8l	%i0,	%o5,	%l4
	edge32	%l2,	%i7,	%o1
	movge	%xcc,	%o2,	%l3
	movle	%icc,	%i6,	%i3
	mulscc	%o3,	%i1,	%g2
	fmovrde	%i4,	%f26,	%f16
	movvc	%icc,	%o6,	%l6
	orn	%g7,	%l1,	%o0
	edge16	%l0,	%o4,	%l5
	and	%o7,	%g3,	%i2
	ldub	[%l7 + 0x1A],	%g4
	smulcc	%g1,	0x08B9,	%g6
	fmovsgu	%icc,	%f9,	%f18
	movrgez	%g5,	%i0,	%o5
	mulx	%l4,	%i5,	%i7
	sir	0x076D
	andn	%o1,	%o2,	%l3
	fmovdge	%icc,	%f29,	%f22
	andn	%i6,	0x12CB,	%l2
	udiv	%o3,	0x181E,	%i1
	orn	%i3,	0x17DB,	%i4
	movrlz	%g2,	%o6,	%g7
	fsrc1s	%f11,	%f8
	sllx	%l6,	%o0,	%l1
	array32	%o4,	%l0,	%o7
	edge16n	%g3,	%l5,	%g4
	udivcc	%i2,	0x0A8F,	%g1
	alignaddr	%g6,	%i0,	%g5
	stx	%o5,	[%l7 + 0x18]
	xor	%i5,	0x1A72,	%l4
	stb	%i7,	[%l7 + 0x3B]
	and	%o1,	%l3,	%o2
	srax	%i6,	%l2,	%o3
	movvs	%icc,	%i1,	%i3
	udivcc	%g2,	0x0594,	%o6
	ldsw	[%l7 + 0x24],	%g7
	movvc	%xcc,	%i4,	%o0
	movrlz	%l1,	%l6,	%o4
	fors	%f26,	%f4,	%f15
	sethi	0x1DBD,	%o7
	faligndata	%f22,	%f20,	%f8
	movrne	%l0,	%l5,	%g4
	fzeros	%f4
	movneg	%xcc,	%i2,	%g3
	array32	%g1,	%i0,	%g5
	smul	%o5,	%i5,	%l4
	ldd	[%l7 + 0x50],	%g6
	lduh	[%l7 + 0x08],	%i7
	movrgez	%o1,	%l3,	%o2
	st	%f9,	[%l7 + 0x08]
	movge	%icc,	%l2,	%i6
	movrgez	%i1,	0x2AD,	%i3
	orcc	%o3,	0x0406,	%o6
	movne	%icc,	%g7,	%g2
	ldsb	[%l7 + 0x59],	%o0
	umulcc	%i4,	0x03C7,	%l6
	fmovsg	%xcc,	%f12,	%f23
	fmul8x16	%f10,	%f4,	%f2
	movrne	%o4,	%o7,	%l0
	subccc	%l5,	0x1FBE,	%g4
	udivx	%l1,	0x1886,	%i2
	fmovdvs	%xcc,	%f24,	%f12
	umulcc	%g3,	0x0E8E,	%i0
	ld	[%l7 + 0x68],	%f24
	subcc	%g1,	%g5,	%i5
	movleu	%xcc,	%l4,	%o5
	fmovrde	%g6,	%f8,	%f16
	stx	%i7,	[%l7 + 0x70]
	movn	%xcc,	%o1,	%o2
	fmovsa	%icc,	%f22,	%f30
	sir	0x19B0
	movrlez	%l3,	%i6,	%l2
	edge8n	%i3,	%i1,	%o3
	stx	%o6,	[%l7 + 0x70]
	andcc	%g7,	%o0,	%i4
	andcc	%g2,	0x0B0F,	%o4
	array16	%l6,	%o7,	%l0
	fmovrsne	%g4,	%f29,	%f30
	fands	%f9,	%f4,	%f10
	subccc	%l1,	%i2,	%g3
	edge16l	%l5,	%g1,	%g5
	fmovse	%icc,	%f4,	%f13
	ldsw	[%l7 + 0x38],	%i5
	movg	%xcc,	%l4,	%i0
	array32	%g6,	%i7,	%o5
	ldsw	[%l7 + 0x5C],	%o1
	fmovdne	%icc,	%f22,	%f17
	fmovda	%icc,	%f27,	%f16
	xnor	%l3,	0x12A5,	%i6
	move	%xcc,	%o2,	%l2
	edge32ln	%i3,	%o3,	%o6
	subccc	%g7,	0x147E,	%o0
	array32	%i1,	%i4,	%o4
	movleu	%icc,	%l6,	%o7
	orncc	%g2,	%g4,	%l1
	array8	%i2,	%g3,	%l0
	ld	[%l7 + 0x58],	%f24
	udivx	%l5,	0x10CD,	%g1
	mulx	%i5,	%g5,	%l4
	add	%i0,	0x0AB1,	%g6
	stx	%o5,	[%l7 + 0x10]
	stb	%o1,	[%l7 + 0x29]
	ldsw	[%l7 + 0x70],	%l3
	ldub	[%l7 + 0x10],	%i7
	fmovrsgez	%i6,	%f25,	%f16
	stx	%l2,	[%l7 + 0x08]
	fsrc1s	%f22,	%f14
	sra	%i3,	0x1B,	%o2
	edge16	%o3,	%g7,	%o6
	subc	%i1,	%o0,	%i4
	srax	%l6,	%o4,	%g2
	udivcc	%g4,	0x0F40,	%o7
	xorcc	%i2,	%g3,	%l1
	lduh	[%l7 + 0x0A],	%l0
	xorcc	%g1,	0x0FD3,	%l5
	movneg	%icc,	%g5,	%i5
	fmul8ulx16	%f22,	%f8,	%f14
	subcc	%l4,	0x164D,	%g6
	add	%i0,	0x170E,	%o1
	mulx	%l3,	%o5,	%i7
	and	%l2,	%i6,	%i3
	movleu	%icc,	%o3,	%g7
	nop
	set	0x18, %o4
	stb	%o6,	[%l7 + %o4]
	udiv	%o2,	0x1DB2,	%i1
	addc	%i4,	0x0F6F,	%o0
	addccc	%l6,	0x1F84,	%o4
	udivcc	%g4,	0x178D,	%g2
	alignaddr	%o7,	%g3,	%i2
	sir	0x19FE
	movvs	%xcc,	%l1,	%g1
	udivx	%l5,	0x1820,	%g5
	pdist	%f20,	%f18,	%f16
	nop
	set	0x44, %g2
	stw	%l0,	[%l7 + %g2]
	edge8ln	%i5,	%l4,	%i0
	movne	%xcc,	%o1,	%l3
	sir	0x1954
	fxors	%f20,	%f13,	%f6
	pdist	%f8,	%f30,	%f4
	sethi	0x0C38,	%o5
	lduw	[%l7 + 0x64],	%g6
	fnands	%f7,	%f0,	%f24
	movre	%l2,	%i6,	%i3
	lduh	[%l7 + 0x6A],	%o3
	edge8l	%i7,	%o6,	%g7
	edge32ln	%i1,	%o2,	%i4
	move	%xcc,	%l6,	%o0
	movvc	%icc,	%o4,	%g2
	fornot2	%f24,	%f28,	%f28
	fpsub32	%f24,	%f26,	%f20
	alignaddr	%o7,	%g4,	%g3
	sethi	0x012F,	%i2
	sll	%g1,	%l5,	%l1
	mova	%icc,	%g5,	%i5
	fxors	%f3,	%f9,	%f24
	edge16l	%l0,	%l4,	%o1
	edge8ln	%i0,	%o5,	%l3
	fmovd	%f14,	%f16
	fmul8x16al	%f8,	%f1,	%f28
	ld	[%l7 + 0x7C],	%f9
	movn	%xcc,	%l2,	%g6
	smulcc	%i3,	0x10C1,	%i6
	fxnor	%f20,	%f8,	%f10
	xor	%o3,	0x18C0,	%i7
	sllx	%o6,	%g7,	%i1
	edge8n	%o2,	%l6,	%i4
	sdiv	%o0,	0x07D7,	%g2
	alignaddrl	%o7,	%g4,	%g3
	srax	%o4,	0x10,	%g1
	faligndata	%f4,	%f10,	%f28
	save %l5, 0x0B11, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g5,	%i2,	%l0
	array32	%l4,	%o1,	%i0
	edge8l	%i5,	%o5,	%l2
	fands	%f15,	%f31,	%f26
	ld	[%l7 + 0x14],	%f25
	movcc	%xcc,	%g6,	%i3
	udivx	%l3,	0x0481,	%o3
	ldsb	[%l7 + 0x62],	%i6
	ldsh	[%l7 + 0x76],	%i7
	sll	%o6,	%g7,	%o2
	fmovdl	%xcc,	%f0,	%f16
	fornot1s	%f7,	%f5,	%f11
	srax	%i1,	%l6,	%i4
	udivx	%o0,	0x14E4,	%g2
	movrgez	%o7,	0x273,	%g3
	popc	0x1DEC,	%o4
	movvs	%xcc,	%g1,	%g4
	movrgz	%l5,	%l1,	%g5
	ldsb	[%l7 + 0x4B],	%l0
	movleu	%xcc,	%i2,	%l4
	edge32n	%i0,	%o1,	%i5
	alignaddrl	%o5,	%l2,	%i3
	lduh	[%l7 + 0x6C],	%g6
	popc	0x1F09,	%l3
	alignaddrl	%o3,	%i6,	%i7
	udivcc	%o6,	0x0894,	%o2
	edge32ln	%i1,	%g7,	%i4
	movle	%icc,	%l6,	%o0
	sra	%o7,	%g2,	%g3
	movle	%icc,	%o4,	%g4
	movvc	%icc,	%l5,	%g1
	orcc	%g5,	0x003E,	%l1
	umul	%i2,	%l4,	%l0
	ldsb	[%l7 + 0x35],	%i0
	sdivcc	%i5,	0x1C4B,	%o1
	edge8ln	%o5,	%i3,	%g6
	sth	%l2,	[%l7 + 0x4C]
	sra	%o3,	0x01,	%i6
	sdivx	%l3,	0x0790,	%i7
	umul	%o6,	0x14D9,	%o2
	lduw	[%l7 + 0x5C],	%i1
	andncc	%i4,	%l6,	%g7
	ldsb	[%l7 + 0x47],	%o7
	and	%o0,	%g2,	%o4
	fnot1s	%f9,	%f10
	edge8l	%g4,	%l5,	%g1
	addcc	%g3,	0x1424,	%l1
	or	%i2,	%l4,	%l0
	fpsub32s	%f19,	%f18,	%f20
	ldd	[%l7 + 0x70],	%i0
	movn	%icc,	%g5,	%i5
	save %o1, %i3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o5,	%l2
	udivx	%o3,	0x0452,	%l3
	movcs	%xcc,	%i6,	%i7
	udivx	%o2,	0x0122,	%i1
	and	%o6,	0x152B,	%l6
	ld	[%l7 + 0x0C],	%f24
	sdivx	%g7,	0x0D70,	%o7
	smulcc	%o0,	0x044C,	%g2
	fpmerge	%f12,	%f10,	%f4
	andcc	%o4,	0x1294,	%i4
	movrlz	%g4,	0x13D,	%l5
	edge32n	%g3,	%g1,	%l1
	orn	%l4,	%i2,	%l0
	addc	%i0,	%g5,	%i5
	movcs	%xcc,	%o1,	%i3
	fzero	%f28
	nop
	set	0x08, %l4
	std	%f10,	[%l7 + %l4]
	edge16l	%g6,	%o5,	%l2
	movleu	%icc,	%l3,	%o3
	fpadd16	%f8,	%f16,	%f14
	sdivx	%i6,	0x1587,	%o2
	st	%f16,	[%l7 + 0x18]
	edge8l	%i7,	%i1,	%l6
	movgu	%icc,	%g7,	%o7
	movcs	%xcc,	%o0,	%o6
	edge32l	%o4,	%g2,	%g4
	movrlz	%l5,	%i4,	%g1
	sdivx	%g3,	0x1D0D,	%l1
	movrlz	%i2,	0x1B4,	%l0
	ldsh	[%l7 + 0x58],	%i0
	fmul8ulx16	%f24,	%f12,	%f12
	srlx	%l4,	%g5,	%i5
	movcs	%icc,	%o1,	%i3
	fsrc1s	%f19,	%f9
	array32	%g6,	%l2,	%o5
	edge16n	%l3,	%o3,	%o2
	movvc	%icc,	%i6,	%i7
	add	%l6,	0x029D,	%g7
	lduh	[%l7 + 0x30],	%o7
	ldub	[%l7 + 0x4F],	%o0
	ldsw	[%l7 + 0x6C],	%o6
	movcs	%icc,	%i1,	%g2
	fcmpeq16	%f14,	%f10,	%g4
	ld	[%l7 + 0x2C],	%f10
	move	%xcc,	%l5,	%i4
	sir	0x18C7
	subcc	%o4,	%g1,	%g3
	ldsh	[%l7 + 0x38],	%l1
	alignaddrl	%l0,	%i0,	%l4
	fmovsvs	%xcc,	%f29,	%f14
	movrgez	%g5,	%i5,	%i2
	movg	%xcc,	%i3,	%g6
	edge32l	%l2,	%o1,	%l3
	ldd	[%l7 + 0x28],	%f0
	fcmple32	%f2,	%f12,	%o3
	edge32l	%o2,	%i6,	%i7
	move	%xcc,	%l6,	%g7
	alignaddr	%o7,	%o0,	%o6
	fxors	%f5,	%f12,	%f2
	alignaddr	%i1,	%g2,	%g4
	umul	%o5,	%l5,	%o4
	movvs	%icc,	%i4,	%g1
	mova	%xcc,	%l1,	%l0
	orn	%i0,	%l4,	%g5
	udiv	%i5,	0x0028,	%g3
	orncc	%i2,	0x1738,	%i3
	fandnot1s	%f11,	%f10,	%f25
	movneg	%icc,	%g6,	%o1
	fmovdvs	%icc,	%f29,	%f7
	array8	%l2,	%o3,	%o2
	st	%f22,	[%l7 + 0x54]
	fpadd16s	%f9,	%f16,	%f26
	andncc	%l3,	%i7,	%l6
	array16	%i6,	%o7,	%g7
	stx	%o6,	[%l7 + 0x70]
	sth	%i1,	[%l7 + 0x44]
	save %g2, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x70, %g3
	ldd	[%l7 + %g3],	%o4
	stw	%l5,	[%l7 + 0x18]
	fpadd16s	%f20,	%f21,	%f10
	xnorcc	%i4,	%o4,	%g1
	addccc	%l0,	%i0,	%l1
	st	%f26,	[%l7 + 0x58]
	sub	%l4,	0x1812,	%i5
	fornot1	%f12,	%f20,	%f0
	fnor	%f0,	%f0,	%f16
	movvc	%xcc,	%g5,	%i2
	fmovsneg	%xcc,	%f16,	%f24
	alignaddr	%i3,	%g6,	%g3
	umul	%o1,	0x05AA,	%o3
	alignaddr	%l2,	%o2,	%l3
	andcc	%i7,	%l6,	%i6
	smul	%g7,	0x0AAB,	%o6
	smulcc	%i1,	0x0F7F,	%g2
	fmovdl	%icc,	%f27,	%f30
	edge16	%o7,	%g4,	%o5
	xorcc	%l5,	0x07EE,	%i4
	movle	%icc,	%o0,	%o4
	sra	%g1,	%i0,	%l1
	movl	%xcc,	%l0,	%l4
	xnorcc	%i5,	0x1891,	%g5
	move	%xcc,	%i3,	%i2
	movneg	%xcc,	%g6,	%o1
	stx	%g3,	[%l7 + 0x08]
	edge16	%l2,	%o2,	%l3
	alignaddrl	%i7,	%l6,	%o3
	alignaddrl	%i6,	%o6,	%i1
	umulcc	%g2,	%o7,	%g4
	xor	%g7,	%l5,	%i4
	edge16n	%o5,	%o0,	%o4
	ldsw	[%l7 + 0x58],	%g1
	ldsw	[%l7 + 0x58],	%i0
	edge8l	%l0,	%l1,	%i5
	orn	%g5,	0x045B,	%l4
	sra	%i2,	%i3,	%o1
	movrgez	%g3,	%g6,	%o2
	fcmpgt32	%f0,	%f24,	%l2
	addc	%l3,	%l6,	%o3
	edge32n	%i7,	%o6,	%i6
	umul	%g2,	%i1,	%o7
	lduw	[%l7 + 0x5C],	%g7
	movgu	%xcc,	%l5,	%i4
	mova	%icc,	%g4,	%o5
	xor	%o4,	0x0444,	%o0
	fmovsneg	%icc,	%f17,	%f8
	umul	%i0,	0x01B0,	%l0
	fcmpd	%fcc2,	%f4,	%f22
	fmovsg	%xcc,	%f0,	%f26
	fmovrslez	%l1,	%f27,	%f5
	fnand	%f30,	%f20,	%f12
	restore %g1, 0x0DF0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l4,	0x177F,	%i2
	movneg	%icc,	%i3,	%g5
	fcmps	%fcc0,	%f15,	%f23
	movrgez	%g3,	%o1,	%o2
	sll	%l2,	0x10,	%l3
	orn	%l6,	0x0953,	%g6
	movl	%xcc,	%i7,	%o3
	xnorcc	%o6,	%i6,	%g2
	fcmpgt16	%f12,	%f6,	%o7
	fcmpd	%fcc2,	%f0,	%f0
	fmovsgu	%xcc,	%f23,	%f4
	alignaddr	%i1,	%g7,	%i4
	alignaddrl	%g4,	%o5,	%l5
	edge32l	%o0,	%o4,	%i0
	array32	%l1,	%g1,	%i5
	sdivcc	%l0,	0x0EEC,	%i2
	srlx	%i3,	%g5,	%g3
	andn	%l4,	%o2,	%l2
	sdiv	%o1,	0x0698,	%l3
	movcc	%xcc,	%g6,	%i7
	fmovdgu	%xcc,	%f14,	%f17
	orcc	%l6,	%o6,	%i6
	mova	%icc,	%o3,	%g2
	subc	%o7,	%i1,	%g7
	fmul8x16al	%f5,	%f22,	%f20
	edge32ln	%g4,	%i4,	%o5
	fmovdle	%xcc,	%f7,	%f21
	sdiv	%l5,	0x0247,	%o4
	addccc	%i0,	0x0987,	%o0
	movge	%icc,	%g1,	%l1
	edge8ln	%l0,	%i5,	%i3
	fmul8x16	%f17,	%f6,	%f24
	fcmped	%fcc0,	%f8,	%f6
	edge32ln	%i2,	%g3,	%g5
	xorcc	%o2,	0x1F60,	%l4
	edge8	%o1,	%l3,	%l2
	fnor	%f4,	%f12,	%f14
	movpos	%xcc,	%g6,	%l6
	xor	%i7,	%i6,	%o3
	mulx	%o6,	%o7,	%g2
	movrlez	%g7,	%g4,	%i4
	mova	%xcc,	%i1,	%o5
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	sethi	0x0967,	%o4
	fcmpne32	%f20,	%f28,	%g1
	edge32l	%l1,	%l0,	%o0
	xnor	%i5,	%i2,	%i3
	edge16	%g3,	%g5,	%o2
	fpmerge	%f8,	%f6,	%f24
	ldsb	[%l7 + 0x40],	%l4
	movrlz	%l3,	0x06A,	%o1
	stx	%g6,	[%l7 + 0x68]
	and	%l2,	0x18C2,	%i7
	sir	0x166F
	movle	%xcc,	%i6,	%o3
	fones	%f21
	fabsd	%f22,	%f6
	movpos	%icc,	%o6,	%l6
	and	%o7,	0x159F,	%g7
	movl	%icc,	%g4,	%g2
	edge32l	%i4,	%o5,	%i1
	udivcc	%i0,	0x0A64,	%o4
	movrlz	%g1,	0x22C,	%l1
	fornot2s	%f23,	%f16,	%f9
	sdiv	%l0,	0x1719,	%o0
	movrlez	%l5,	%i5,	%i2
	ldd	[%l7 + 0x28],	%g2
	and	%g5,	0x19DA,	%i3
	fsrc2s	%f5,	%f24
	stw	%o2,	[%l7 + 0x68]
	udivx	%l3,	0x1E6B,	%l4
	mulx	%o1,	%g6,	%i7
	sethi	0x094B,	%l2
	movvs	%xcc,	%o3,	%i6
	subcc	%o6,	%l6,	%g7
	subccc	%g4,	%o7,	%i4
	movpos	%icc,	%o5,	%g2
	movneg	%icc,	%i1,	%o4
	edge8n	%i0,	%l1,	%g1
	fornot2s	%f4,	%f20,	%f12
	sub	%o0,	%l0,	%i5
	fandnot1s	%f13,	%f25,	%f30
	xnorcc	%i2,	%g3,	%l5
	lduw	[%l7 + 0x7C],	%i3
	add	%o2,	%l3,	%l4
	edge32l	%o1,	%g6,	%i7
	edge16	%g5,	%l2,	%o3
	fnegs	%f2,	%f0
	movle	%icc,	%o6,	%i6
	fands	%f9,	%f26,	%f10
	sub	%g7,	%l6,	%g4
	addc	%i4,	0x07BA,	%o5
	sethi	0x1300,	%g2
	ldsb	[%l7 + 0x50],	%i1
	stb	%o4,	[%l7 + 0x60]
	movle	%icc,	%o7,	%i0
	ldsb	[%l7 + 0x1B],	%l1
	ldsb	[%l7 + 0x3D],	%o0
	mulscc	%g1,	%i5,	%l0
	edge16l	%g3,	%i2,	%i3
	std	%f28,	[%l7 + 0x38]
	fcmps	%fcc0,	%f13,	%f20
	movvc	%icc,	%l5,	%o2
	ldsb	[%l7 + 0x69],	%l3
	st	%f4,	[%l7 + 0x58]
	fmovdn	%icc,	%f1,	%f20
	fsrc1	%f14,	%f10
	addcc	%o1,	0x15E2,	%g6
	edge32	%i7,	%l4,	%g5
	edge8l	%o3,	%l2,	%o6
	nop
	set	0x30, %o7
	ldx	[%l7 + %o7],	%g7
	fabss	%f25,	%f30
	alignaddr	%l6,	%g4,	%i6
	movcs	%icc,	%i4,	%o5
	andncc	%g2,	%i1,	%o7
	movcs	%xcc,	%i0,	%o4
	srax	%o0,	%g1,	%l1
	edge16	%l0,	%g3,	%i2
	xnorcc	%i5,	%i3,	%o2
	orncc	%l5,	0x02AD,	%l3
	smul	%o1,	0x1D7E,	%g6
	orncc	%l4,	%g5,	%o3
	stw	%l2,	[%l7 + 0x4C]
	fmovsgu	%icc,	%f3,	%f9
	array8	%o6,	%g7,	%l6
	sllx	%g4,	%i7,	%i6
	fmovsa	%icc,	%f29,	%f13
	fcmped	%fcc2,	%f0,	%f14
	ldub	[%l7 + 0x6F],	%o5
	and	%i4,	%i1,	%g2
	udiv	%o7,	0x1441,	%o4
	orncc	%o0,	0x1793,	%i0
	ldsh	[%l7 + 0x7E],	%l1
	movneg	%icc,	%l0,	%g3
	popc	0x1D2E,	%g1
	edge32n	%i5,	%i3,	%i2
	xor	%o2,	%l3,	%o1
	movgu	%xcc,	%g6,	%l4
	andn	%l5,	%o3,	%g5
	fmovde	%icc,	%f14,	%f0
	fnands	%f5,	%f25,	%f19
	fcmple32	%f26,	%f16,	%o6
	fmul8x16al	%f5,	%f18,	%f30
	movcs	%icc,	%l2,	%l6
	fpadd32	%f4,	%f6,	%f26
	fmovdneg	%xcc,	%f4,	%f9
	fmovdneg	%icc,	%f20,	%f25
	edge16ln	%g4,	%i7,	%i6
	fxors	%f26,	%f17,	%f0
	array16	%o5,	%g7,	%i4
	sll	%i1,	%g2,	%o4
	sth	%o7,	[%l7 + 0x6C]
	ld	[%l7 + 0x5C],	%f10
	fmovdneg	%xcc,	%f25,	%f8
	movrlz	%i0,	%l1,	%o0
	stw	%g3,	[%l7 + 0x48]
	sth	%g1,	[%l7 + 0x58]
	andcc	%i5,	0x0D23,	%l0
	lduh	[%l7 + 0x10],	%i2
	movvc	%icc,	%o2,	%i3
	fxors	%f11,	%f27,	%f5
	fnot1s	%f0,	%f4
	fandnot1s	%f6,	%f11,	%f18
	stx	%o1,	[%l7 + 0x70]
	sub	%g6,	%l4,	%l3
	ldsw	[%l7 + 0x20],	%o3
	fmovrdlez	%l5,	%f12,	%f30
	edge16ln	%g5,	%l2,	%l6
	stb	%g4,	[%l7 + 0x53]
	movvs	%icc,	%i7,	%i6
	edge32n	%o6,	%o5,	%i4
	fors	%f27,	%f18,	%f3
	fmovdgu	%icc,	%f27,	%f27
	add	%i1,	0x15A6,	%g7
	movpos	%xcc,	%o4,	%g2
	edge8	%o7,	%i0,	%o0
	add	%l1,	%g1,	%i5
	fandnot2	%f10,	%f10,	%f12
	edge16n	%g3,	%i2,	%l0
	ldsh	[%l7 + 0x10],	%i3
	movvc	%icc,	%o2,	%o1
	movl	%icc,	%g6,	%l3
	movg	%icc,	%l4,	%o3
	ldub	[%l7 + 0x3E],	%g5
	ldsw	[%l7 + 0x08],	%l2
	fmovdgu	%xcc,	%f1,	%f7
	movrgz	%l6,	%g4,	%l5
	stw	%i7,	[%l7 + 0x48]
	fcmped	%fcc1,	%f0,	%f28
	fornot1s	%f20,	%f22,	%f17
	add	%o6,	0x11CC,	%o5
	addcc	%i4,	0x091D,	%i1
	movge	%icc,	%g7,	%o4
	fmul8x16	%f19,	%f26,	%f6
	mulscc	%g2,	0x0214,	%o7
	sllx	%i6,	0x1C,	%o0
	edge16l	%i0,	%l1,	%g1
	orcc	%g3,	0x1951,	%i2
	fors	%f4,	%f9,	%f12
	for	%f14,	%f10,	%f20
	fmuld8ulx16	%f12,	%f3,	%f24
	movneg	%xcc,	%i5,	%i3
	addccc	%l0,	0x0000,	%o1
	edge32n	%g6,	%o2,	%l4
	sllx	%o3,	%g5,	%l2
	st	%f30,	[%l7 + 0x44]
	stb	%l6,	[%l7 + 0x48]
	popc	%g4,	%l5
	sethi	0x1E64,	%l3
	fmovsl	%icc,	%f4,	%f5
	sth	%i7,	[%l7 + 0x60]
	srl	%o5,	%i4,	%o6
	movrgez	%i1,	0x03A,	%g7
	xnor	%o4,	%g2,	%o7
	array32	%i6,	%i0,	%l1
	movneg	%icc,	%o0,	%g3
	ldsw	[%l7 + 0x14],	%g1
	xor	%i2,	%i3,	%i5
	fcmpgt32	%f30,	%f24,	%o1
	xor	%l0,	0x0717,	%g6
	alignaddr	%o2,	%l4,	%o3
	fmovd	%f16,	%f26
	edge32	%g5,	%l6,	%g4
	pdist	%f8,	%f28,	%f26
	movcs	%icc,	%l2,	%l5
	fcmpd	%fcc1,	%f10,	%f24
	nop
	set	0x14, %i0
	stw	%l3,	[%l7 + %i0]
	xnorcc	%i7,	0x0C74,	%i4
	fnegd	%f28,	%f28
	edge8l	%o5,	%o6,	%g7
	fpack32	%f14,	%f8,	%f16
	smul	%i1,	%g2,	%o7
	movgu	%xcc,	%i6,	%i0
	addccc	%o4,	0x0D97,	%l1
	addcc	%o0,	%g1,	%g3
	array16	%i2,	%i5,	%o1
	fmovdcs	%icc,	%f16,	%f6
	movvs	%icc,	%l0,	%g6
	movcc	%xcc,	%o2,	%i3
	sdiv	%l4,	0x0DC9,	%g5
	movrlez	%l6,	0x1C5,	%g4
	srax	%l2,	%o3,	%l3
	movleu	%icc,	%i7,	%i4
	fsrc2s	%f28,	%f28
	movle	%xcc,	%o5,	%l5
	subcc	%g7,	0x14EA,	%o6
	fmovsgu	%icc,	%f28,	%f27
	lduw	[%l7 + 0x5C],	%i1
	and	%g2,	0x00B8,	%i6
	edge16n	%o7,	%o4,	%l1
	and	%i0,	%o0,	%g3
	lduw	[%l7 + 0x58],	%g1
	fmovsn	%icc,	%f2,	%f18
	subcc	%i2,	%o1,	%i5
	fmul8x16al	%f21,	%f14,	%f26
	faligndata	%f18,	%f30,	%f6
	fmovrdlez	%g6,	%f14,	%f12
	edge8n	%o2,	%l0,	%l4
	fcmple16	%f10,	%f14,	%g5
	movneg	%xcc,	%l6,	%i3
	addccc	%g4,	%l2,	%o3
	orn	%l3,	%i4,	%o5
	or	%i7,	0x0D5B,	%l5
	movrne	%g7,	%i1,	%o6
	xnorcc	%i6,	0x1D75,	%g2
	movl	%xcc,	%o7,	%o4
	fcmpgt32	%f10,	%f26,	%i0
	edge32	%o0,	%l1,	%g3
	movge	%xcc,	%i2,	%o1
	srax	%i5,	%g6,	%g1
	movn	%icc,	%l0,	%l4
	orncc	%g5,	%l6,	%o2
	fmovdcc	%icc,	%f18,	%f7
	fzero	%f14
	edge8ln	%g4,	%l2,	%o3
	edge8n	%l3,	%i3,	%o5
	xor	%i4,	%i7,	%l5
	or	%g7,	%o6,	%i1
	edge32l	%g2,	%o7,	%i6
	smulcc	%o4,	%o0,	%i0
	lduw	[%l7 + 0x64],	%l1
	mulscc	%i2,	0x036B,	%o1
	for	%f8,	%f0,	%f22
	mulx	%i5,	0x0275,	%g3
	fmovd	%f14,	%f2
	movrne	%g1,	0x14F,	%l0
	sllx	%l4,	%g6,	%l6
	movrgz	%g5,	%o2,	%g4
	smul	%o3,	0x1520,	%l3
	orn	%l2,	%i3,	%i4
	xorcc	%o5,	%l5,	%i7
	lduh	[%l7 + 0x60],	%o6
	sdivx	%g7,	0x1DC6,	%i1
	movrlez	%o7,	0x297,	%g2
	orncc	%o4,	0x1D06,	%o0
	sdivx	%i0,	0x1414,	%i6
	fmovsa	%icc,	%f8,	%f26
	fpmerge	%f31,	%f6,	%f18
	edge8n	%l1,	%i2,	%o1
	xnor	%i5,	%g1,	%g3
	sllx	%l4,	%l0,	%g6
	movrgz	%g5,	0x255,	%l6
	mulscc	%g4,	0x02E6,	%o3
	movge	%icc,	%l3,	%l2
	fmul8sux16	%f6,	%f14,	%f6
	mova	%icc,	%i3,	%i4
	smul	%o5,	%l5,	%i7
	addcc	%o2,	0x0D07,	%o6
	fcmpne16	%f16,	%f0,	%i1
	ldsb	[%l7 + 0x5A],	%o7
	andcc	%g2,	%g7,	%o4
	fmovrsne	%i0,	%f30,	%f2
	sethi	0x05C1,	%o0
	array8	%l1,	%i6,	%o1
	fnegs	%f22,	%f31
	lduw	[%l7 + 0x24],	%i5
	andn	%i2,	0x17DC,	%g3
	movne	%xcc,	%l4,	%l0
	sethi	0x143C,	%g6
	movvs	%icc,	%g5,	%g1
	srax	%g4,	%o3,	%l3
	movneg	%xcc,	%l2,	%i3
	array16	%i4,	%l6,	%l5
	sra	%i7,	0x1F,	%o2
	edge8ln	%o6,	%i1,	%o5
	udivcc	%o7,	0x15DF,	%g2
	fmovs	%f2,	%f23
	smul	%o4,	%g7,	%o0
	alignaddr	%i0,	%l1,	%i6
	movrlez	%o1,	0x212,	%i5
	sllx	%i2,	%g3,	%l4
	sra	%l0,	%g5,	%g6
	orn	%g1,	%o3,	%l3
	and	%g4,	%l2,	%i4
	fmovdleu	%icc,	%f25,	%f5
	movvs	%icc,	%l6,	%i3
	orn	%l5,	%o2,	%o6
	orn	%i7,	0x1BF7,	%o5
	and	%i1,	%g2,	%o7
	sdivx	%g7,	0x162B,	%o0
	edge16l	%o4,	%i0,	%i6
	edge32ln	%l1,	%i5,	%i2
	movn	%icc,	%g3,	%l4
	fnor	%f18,	%f24,	%f26
	movge	%xcc,	%l0,	%g5
	fmovdgu	%icc,	%f23,	%f11
	addc	%g6,	0x0AD3,	%g1
	sub	%o1,	0x0E5D,	%o3
	movgu	%xcc,	%l3,	%l2
	stb	%i4,	[%l7 + 0x48]
	smulcc	%l6,	0x1CF3,	%g4
	udivcc	%i3,	0x0CDD,	%o2
	edge16ln	%o6,	%i7,	%o5
	srax	%i1,	%l5,	%o7
	fmuld8sux16	%f15,	%f7,	%f8
	sra	%g7,	0x17,	%o0
	movrgz	%g2,	0x2E0,	%o4
	fnegd	%f30,	%f6
	array32	%i6,	%i0,	%l1
	umulcc	%i2,	0x0E98,	%i5
	movvs	%icc,	%g3,	%l0
	xnorcc	%l4,	0x0291,	%g5
	edge8n	%g6,	%o1,	%g1
	edge32ln	%o3,	%l2,	%l3
	movpos	%icc,	%i4,	%l6
	sub	%g4,	0x19BB,	%i3
	ldsw	[%l7 + 0x3C],	%o2
	udiv	%i7,	0x01DE,	%o6
	movg	%xcc,	%i1,	%o5
	movgu	%icc,	%o7,	%l5
	movvs	%xcc,	%o0,	%g2
	sll	%o4,	0x09,	%i6
	edge8	%i0,	%l1,	%i2
	udivcc	%i5,	0x115F,	%g3
	ldub	[%l7 + 0x62],	%l0
	fmovdneg	%xcc,	%f2,	%f1
	fmul8x16	%f18,	%f24,	%f26
	fmovsvs	%icc,	%f31,	%f20
	movneg	%xcc,	%g7,	%g5
	movre	%g6,	0x102,	%l4
	movre	%g1,	0x271,	%o1
	addcc	%o3,	0x1871,	%l3
	sdivcc	%l2,	0x086C,	%l6
	movne	%icc,	%g4,	%i4
	edge32l	%o2,	%i3,	%o6
	fsrc1	%f20,	%f22
	umul	%i1,	0x0CF8,	%o5
	save %i7, %o7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l5,	%o4
	movrlz	%g2,	0x2C6,	%i6
	fandnot1	%f4,	%f16,	%f22
	fpack32	%f18,	%f2,	%f26
	edge16n	%i0,	%l1,	%i5
	fmovrsgez	%g3,	%f18,	%f23
	udivx	%i2,	0x0A9C,	%g7
	umul	%l0,	%g5,	%l4
	movneg	%icc,	%g6,	%o1
	st	%f9,	[%l7 + 0x6C]
	fmovse	%icc,	%f22,	%f8
	restore %o3, %g1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f14,	%f16
	movcs	%xcc,	%l6,	%g4
	sdivx	%l3,	0x0F33,	%o2
	or	%i4,	0x1AE4,	%o6
	fmovrsgez	%i1,	%f14,	%f14
	fand	%f16,	%f18,	%f26
	array8	%o5,	%i3,	%i7
	edge32ln	%o7,	%o0,	%o4
	smulcc	%g2,	%i6,	%l5
	movg	%icc,	%i0,	%i5
	ldsw	[%l7 + 0x50],	%g3
	edge16ln	%l1,	%g7,	%l0
	popc	%i2,	%l4
	array8	%g6,	%o1,	%o3
	popc	0x112E,	%g5
	alignaddrl	%g1,	%l2,	%g4
	movgu	%icc,	%l3,	%l6
	udivcc	%o2,	0x0859,	%o6
	subccc	%i1,	0x1DA6,	%o5
	popc	0x0E2B,	%i3
	edge16l	%i7,	%i4,	%o0
	movcc	%xcc,	%o4,	%o7
	orcc	%g2,	%i6,	%i0
	popc	0x1CA9,	%l5
	smulcc	%i5,	%l1,	%g3
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	umulcc	%l4,	%g6,	%g7
	xorcc	%o3,	0x1C34,	%g5
	movvs	%xcc,	%o1,	%l2
	smul	%g4,	0x1194,	%g1
	udivcc	%l3,	0x1B32,	%o2
	ldd	[%l7 + 0x40],	%f20
	xnorcc	%l6,	%i1,	%o5
	edge8n	%o6,	%i3,	%i7
	lduh	[%l7 + 0x6C],	%o0
	movg	%xcc,	%o4,	%o7
	subccc	%i4,	%i6,	%i0
	movneg	%icc,	%g2,	%l5
	ldx	[%l7 + 0x50],	%l1
	srlx	%i5,	%g3,	%l0
	fpadd32s	%f20,	%f17,	%f5
	subcc	%i2,	0x0F71,	%g6
	save %g7, 0x1C2A, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l4,	%o1
	ldx	[%l7 + 0x38],	%l2
	fmovdl	%xcc,	%f11,	%f0
	save %g5, %g1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o2,	%l3
	fmovsneg	%icc,	%f17,	%f1
	array16	%l6,	%i1,	%o5
	fmovdgu	%xcc,	%f15,	%f11
	sub	%o6,	0x196E,	%i7
	fmovsg	%icc,	%f3,	%f22
	orncc	%i3,	0x1CBB,	%o0
	fmovscs	%xcc,	%f10,	%f8
	ldx	[%l7 + 0x10],	%o4
	movg	%xcc,	%i4,	%o7
	movrne	%i6,	0x239,	%i0
	fnands	%f4,	%f20,	%f15
	move	%xcc,	%g2,	%l5
	movl	%icc,	%l1,	%i5
	udivcc	%g3,	0x0D81,	%i2
	edge8ln	%g6,	%l0,	%o3
	ldd	[%l7 + 0x70],	%l4
	fmovsge	%icc,	%f17,	%f29
	movl	%xcc,	%o1,	%l2
	umul	%g7,	0x0EBB,	%g1
	movge	%icc,	%g5,	%g4
	sdivcc	%o2,	0x1588,	%l3
	edge32	%i1,	%o5,	%o6
	movrlz	%l6,	0x0C8,	%i3
	mova	%icc,	%i7,	%o4
	array32	%o0,	%o7,	%i6
	edge32l	%i4,	%i0,	%l5
	movrgz	%l1,	0x275,	%g2
	edge32l	%g3,	%i2,	%g6
	array32	%i5,	%l0,	%l4
	movg	%icc,	%o3,	%l2
	orn	%g7,	%o1,	%g5
	fpack32	%f28,	%f8,	%f8
	array16	%g1,	%o2,	%l3
	sdivcc	%i1,	0x1862,	%g4
	movneg	%xcc,	%o6,	%l6
	mulscc	%i3,	%o5,	%i7
	subccc	%o0,	%o4,	%o7
	array8	%i6,	%i4,	%l5
	fcmpne32	%f20,	%f2,	%i0
	movl	%icc,	%l1,	%g3
	edge32l	%i2,	%g2,	%i5
	fmul8x16	%f10,	%f0,	%f6
	subcc	%l0,	%g6,	%l4
	edge16n	%o3,	%l2,	%g7
	movvs	%icc,	%g5,	%o1
	and	%g1,	0x0407,	%o2
	addcc	%l3,	0x0439,	%g4
	save %i1, %o6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o5,	%i3,	%o0
	fmul8ulx16	%f14,	%f0,	%f2
	srlx	%i7,	%o7,	%o4
	movl	%icc,	%i4,	%i6
	umul	%l5,	0x0950,	%l1
	xor	%i0,	%g3,	%g2
	subcc	%i2,	0x1DBB,	%i5
	udiv	%l0,	0x1895,	%l4
	edge16l	%o3,	%g6,	%g7
	array8	%l2,	%o1,	%g1
	subccc	%g5,	%l3,	%o2
	edge8n	%g4,	%i1,	%l6
	or	%o6,	0x14D8,	%i3
	xnor	%o5,	%i7,	%o0
	ldub	[%l7 + 0x2E],	%o7
	edge32n	%i4,	%o4,	%i6
	fmovrdlez	%l1,	%f18,	%f20
	movle	%xcc,	%l5,	%g3
	alignaddrl	%i0,	%i2,	%i5
	srl	%g2,	0x18,	%l4
	fnot1	%f0,	%f12
	addc	%l0,	0x0524,	%g6
	array8	%o3,	%l2,	%o1
	orncc	%g1,	%g7,	%g5
	ldub	[%l7 + 0x4B],	%l3
	fcmpeq16	%f0,	%f8,	%g4
	srl	%o2,	0x16,	%i1
	fsrc1	%f20,	%f28
	addcc	%l6,	%i3,	%o5
	mova	%xcc,	%i7,	%o6
	ldsb	[%l7 + 0x7A],	%o0
	movge	%xcc,	%o7,	%o4
	movrlez	%i4,	0x14D,	%l1
	andcc	%i6,	%g3,	%i0
	movvs	%xcc,	%l5,	%i5
	fcmpne32	%f22,	%f22,	%i2
	save %g2, 0x1FB2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f4,	%f26
	udiv	%g6,	0x0CDC,	%l0
	fcmple32	%f2,	%f14,	%o3
	popc	0x0214,	%l2
	fcmpd	%fcc3,	%f2,	%f26
	sub	%o1,	%g7,	%g1
	edge8n	%g5,	%l3,	%g4
	movn	%icc,	%i1,	%o2
	smulcc	%l6,	0x175D,	%i3
	ldd	[%l7 + 0x30],	%o4
	add	%i7,	0x0899,	%o0
	movrgz	%o6,	0x17A,	%o4
	movl	%xcc,	%o7,	%l1
	stx	%i6,	[%l7 + 0x58]
	stw	%g3,	[%l7 + 0x24]
	fnot1	%f4,	%f24
	fones	%f21
	udiv	%i0,	0x1F01,	%i4
	edge8l	%l5,	%i5,	%i2
	fmuld8ulx16	%f13,	%f11,	%f6
	fnot1	%f2,	%f16
	mulx	%g2,	%g6,	%l0
	alignaddrl	%o3,	%l2,	%l4
	movvs	%xcc,	%o1,	%g7
	pdist	%f24,	%f4,	%f8
	subcc	%g1,	0x1A3E,	%g5
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f22
	subcc	%l3,	0x0B85,	%i1
	add	%g4,	0x1170,	%o2
	or	%i3,	0x1A7A,	%l6
	add	%i7,	%o5,	%o0
	array8	%o6,	%o7,	%o4
	movvs	%xcc,	%i6,	%g3
	mulx	%l1,	%i0,	%l5
	ldsw	[%l7 + 0x08],	%i5
	addcc	%i2,	0x17F8,	%g2
	sub	%g6,	%i4,	%l0
	subccc	%o3,	0x0A64,	%l2
	udivx	%o1,	0x1779,	%l4
	mulx	%g7,	0x11D9,	%g1
	movne	%icc,	%l3,	%i1
	xor	%g5,	%o2,	%i3
	orn	%l6,	0x040A,	%g4
	fmovsg	%icc,	%f13,	%f7
	orn	%i7,	0x1C56,	%o5
	ldx	[%l7 + 0x30],	%o6
	stw	%o0,	[%l7 + 0x1C]
	fnor	%f6,	%f0,	%f16
	fpadd16s	%f31,	%f4,	%f28
	movn	%icc,	%o7,	%o4
	movcc	%icc,	%i6,	%g3
	sllx	%i0,	%l5,	%l1
	subcc	%i2,	0x0BB5,	%g2
	movge	%xcc,	%i5,	%i4
	edge16ln	%l0,	%o3,	%g6
	edge8	%l2,	%l4,	%g7
	sllx	%o1,	%g1,	%i1
	xorcc	%l3,	%g5,	%i3
	movn	%xcc,	%l6,	%g4
	edge16n	%o2,	%i7,	%o5
	udivcc	%o0,	0x1FBB,	%o6
	udivx	%o7,	0x030F,	%o4
	sub	%g3,	0x1859,	%i6
	movre	%i0,	0x042,	%l5
	edge8n	%i2,	%l1,	%i5
	fmovdle	%xcc,	%f18,	%f27
	fmovsge	%icc,	%f18,	%f17
	lduh	[%l7 + 0x4C],	%g2
	movpos	%icc,	%i4,	%o3
	array8	%g6,	%l0,	%l4
	subccc	%g7,	0x0039,	%o1
	stb	%g1,	[%l7 + 0x6B]
	faligndata	%f28,	%f20,	%f2
	move	%xcc,	%l2,	%i1
	std	%f0,	[%l7 + 0x38]
	srlx	%g5,	%i3,	%l3
	fmovrse	%g4,	%f20,	%f10
	lduw	[%l7 + 0x54],	%o2
	fmovsleu	%icc,	%f6,	%f6
	fsrc2s	%f5,	%f27
	edge32ln	%i7,	%l6,	%o0
	fands	%f3,	%f26,	%f27
	sllx	%o6,	%o5,	%o7
	edge16ln	%g3,	%i6,	%o4
	fmovsle	%xcc,	%f26,	%f0
	fmovda	%icc,	%f19,	%f5
	movge	%xcc,	%i0,	%l5
	xorcc	%i2,	%l1,	%g2
	stx	%i4,	[%l7 + 0x58]
	fmovdne	%xcc,	%f18,	%f1
	smulcc	%i5,	%o3,	%l0
	subc	%l4,	0x165B,	%g7
	fxor	%f10,	%f22,	%f22
	popc	0x1267,	%g6
	edge16ln	%g1,	%o1,	%l2
	fmovrsgez	%i1,	%f27,	%f20
	edge32	%i3,	%l3,	%g5
	movge	%icc,	%g4,	%i7
	movneg	%xcc,	%o2,	%o0
	movrlz	%l6,	0x1D3,	%o5
	nop
	set	0x31, %i5
	stb	%o6,	[%l7 + %i5]
	sllx	%g3,	%i6,	%o4
	ldsh	[%l7 + 0x30],	%i0
	orcc	%l5,	0x041F,	%o7
	xor	%l1,	0x0960,	%i2
	sdivcc	%g2,	0x0C91,	%i5
	fmovspos	%xcc,	%f20,	%f29
	popc	0x1D6C,	%i4
	mulscc	%l0,	%o3,	%g7
	addc	%l4,	%g6,	%o1
	restore %l2, 0x022B, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f22,	%f15
	edge16n	%i3,	%g1,	%g5
	movg	%xcc,	%l3,	%i7
	smulcc	%g4,	0x096D,	%o0
	edge8n	%o2,	%o5,	%o6
	sethi	0x010D,	%l6
	fandnot2s	%f21,	%f9,	%f15
	fmovdpos	%xcc,	%f6,	%f14
	movpos	%icc,	%g3,	%i6
	mulx	%o4,	%l5,	%i0
	andcc	%l1,	0x0A10,	%o7
	movrlez	%i2,	%g2,	%i5
	fnot1	%f12,	%f18
	fcmple16	%f4,	%f26,	%i4
	array16	%o3,	%l0,	%l4
	sra	%g7,	0x1E,	%o1
	subcc	%l2,	0x0DE0,	%i1
	srax	%g6,	%i3,	%g1
	sdivx	%g5,	0x112C,	%i7
	movrne	%g4,	0x2CA,	%o0
	sth	%o2,	[%l7 + 0x4C]
	movl	%xcc,	%l3,	%o5
	movle	%icc,	%o6,	%l6
	sdivcc	%i6,	0x1948,	%g3
	fmovse	%xcc,	%f6,	%f11
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	sub	%o4,	0x1766,	%i2
	movrlez	%g2,	0x061,	%o7
	sdivx	%i5,	0x10EC,	%i4
	mova	%icc,	%o3,	%l0
	fpsub32s	%f12,	%f17,	%f26
	fmovsg	%icc,	%f21,	%f2
	mulx	%g7,	%l4,	%o1
	movneg	%xcc,	%i1,	%l2
	alignaddr	%i3,	%g6,	%g5
	xorcc	%g1,	0x05CF,	%i7
	xnorcc	%o0,	%g4,	%l3
	movcs	%icc,	%o5,	%o6
	popc	0x1C79,	%o2
	movl	%xcc,	%l6,	%i6
	fmovdpos	%xcc,	%f21,	%f18
	edge16n	%l5,	%g3,	%i0
	edge16ln	%l1,	%o4,	%g2
	fmovdge	%xcc,	%f26,	%f15
	fmul8x16al	%f8,	%f11,	%f22
	ldsw	[%l7 + 0x18],	%i2
	fmovd	%f0,	%f30
	umulcc	%i5,	%o7,	%i4
	fmovdvs	%xcc,	%f1,	%f13
	fcmple16	%f0,	%f6,	%o3
	edge32ln	%l0,	%l4,	%g7
	edge8	%o1,	%i1,	%l2
	movvc	%xcc,	%g6,	%i3
	edge16	%g1,	%i7,	%o0
	movne	%icc,	%g5,	%g4
	fmovsleu	%xcc,	%f8,	%f22
	addccc	%l3,	0x1E66,	%o5
	stw	%o2,	[%l7 + 0x6C]
	sir	0x1BB1
	or	%o6,	%i6,	%l6
	fmovsleu	%icc,	%f20,	%f24
	ld	[%l7 + 0x54],	%f27
	movne	%icc,	%g3,	%i0
	andn	%l1,	0x0BE0,	%l5
	movvc	%icc,	%o4,	%i2
	fmovrdgez	%g2,	%f28,	%f30
	udivcc	%i5,	0x09BA,	%o7
	edge16	%o3,	%i4,	%l0
	fpack16	%f18,	%f7
	alignaddrl	%l4,	%o1,	%g7
	umulcc	%l2,	%i1,	%g6
	srlx	%i3,	%g1,	%o0
	mova	%xcc,	%g5,	%i7
	xnorcc	%l3,	%o5,	%o2
	array32	%g4,	%o6,	%i6
	sdivcc	%l6,	0x00E3,	%g3
	fmovrslz	%i0,	%f15,	%f28
	faligndata	%f18,	%f0,	%f14
	movvs	%icc,	%l5,	%o4
	movl	%xcc,	%l1,	%g2
	fexpand	%f8,	%f28
	ldsb	[%l7 + 0x59],	%i5
	fornot1	%f10,	%f2,	%f24
	stw	%i2,	[%l7 + 0x20]
	array32	%o7,	%o3,	%l0
	ldsb	[%l7 + 0x65],	%i4
	smul	%l4,	%o1,	%l2
	movrgez	%i1,	0x0F3,	%g6
	st	%f14,	[%l7 + 0x2C]
	fmovrsne	%g7,	%f30,	%f12
	array16	%i3,	%o0,	%g1
	udivcc	%i7,	0x09CF,	%g5
	umulcc	%l3,	0x129D,	%o5
	move	%icc,	%o2,	%g4
	orncc	%i6,	%l6,	%o6
	orcc	%i0,	0x1C12,	%g3
	lduh	[%l7 + 0x7A],	%o4
	addcc	%l5,	0x13CE,	%g2
	fmovrdgz	%i5,	%f18,	%f10
	fsrc1	%f12,	%f6
	edge8ln	%i2,	%o7,	%o3
	sdivcc	%l0,	0x131A,	%l1
	fpsub16s	%f20,	%f16,	%f17
	fmovrdgez	%i4,	%f22,	%f14
	sdiv	%o1,	0x1CAE,	%l4
	fornot2	%f16,	%f16,	%f12
	xnorcc	%l2,	0x110C,	%i1
	fmovrse	%g7,	%f28,	%f14
	udivcc	%g6,	0x0522,	%i3
	xor	%g1,	0x081D,	%o0
	ldd	[%l7 + 0x20],	%f28
	srlx	%g5,	0x0D,	%l3
	mulscc	%i7,	0x12EF,	%o5
	fmovrdgz	%o2,	%f8,	%f16
	restore %i6, %g4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l6,	%g3
	alignaddr	%o4,	%l5,	%i0
	ldsh	[%l7 + 0x46],	%g2
	fmovdleu	%xcc,	%f2,	%f28
	stw	%i2,	[%l7 + 0x18]
	or	%i5,	%o7,	%o3
	movrgz	%l0,	0x08C,	%i4
	edge16ln	%o1,	%l1,	%l2
	faligndata	%f20,	%f8,	%f26
	fpadd16	%f12,	%f28,	%f26
	edge8n	%l4,	%i1,	%g7
	popc	%i3,	%g1
	stb	%g6,	[%l7 + 0x44]
	sdiv	%g5,	0x1BD8,	%o0
	movg	%xcc,	%l3,	%o5
	edge16	%o2,	%i7,	%i6
	ldsw	[%l7 + 0x10],	%o6
	umulcc	%l6,	0x01BE,	%g3
	umul	%g4,	%l5,	%i0
	andncc	%g2,	%o4,	%i5
	umulcc	%o7,	0x0980,	%o3
	mova	%xcc,	%i2,	%i4
	srlx	%l0,	0x0C,	%l1
	movle	%xcc,	%o1,	%l2
	movge	%icc,	%l4,	%i1
	sth	%g7,	[%l7 + 0x4E]
	sdivx	%i3,	0x14B8,	%g1
	fand	%f6,	%f14,	%f28
	movgu	%icc,	%g6,	%g5
	udivcc	%o0,	0x1519,	%l3
	udivcc	%o2,	0x052B,	%i7
	sdivx	%i6,	0x1C82,	%o6
	movneg	%icc,	%l6,	%o5
	subcc	%g4,	0x1A72,	%g3
	andncc	%l5,	%g2,	%i0
	movrgez	%i5,	%o4,	%o7
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	fandnot1	%f10,	%f20,	%f14
	movl	%xcc,	%o3,	%l1
	edge32ln	%l2,	%l4,	%o1
	edge16n	%i1,	%g7,	%g1
	ld	[%l7 + 0x44],	%f19
	sra	%g6,	0x05,	%i3
	movle	%icc,	%g5,	%l3
	movn	%xcc,	%o2,	%o0
	movrgez	%i7,	0x178,	%i6
	movgu	%xcc,	%l6,	%o5
	movpos	%icc,	%o6,	%g4
	movne	%xcc,	%l5,	%g2
	andncc	%g3,	%i5,	%o4
	fmovscs	%xcc,	%f29,	%f9
	udivx	%o7,	0x15F6,	%i0
	fnand	%f16,	%f24,	%f30
	movl	%icc,	%i4,	%i2
	array16	%l0,	%o3,	%l2
	array16	%l4,	%o1,	%i1
	xnorcc	%l1,	0x0292,	%g7
	andncc	%g6,	%g1,	%i3
	alignaddrl	%l3,	%o2,	%g5
	movleu	%icc,	%o0,	%i7
	ldsh	[%l7 + 0x0C],	%l6
	fmovrslez	%i6,	%f3,	%f29
	ldd	[%l7 + 0x40],	%f22
	fcmped	%fcc1,	%f30,	%f26
	fmovdne	%xcc,	%f21,	%f7
	fmul8x16au	%f26,	%f12,	%f2
	addccc	%o5,	0x0F39,	%o6
	smulcc	%g4,	0x044C,	%g2
	sdiv	%g3,	0x037E,	%l5
	fabsd	%f28,	%f24
	ldsh	[%l7 + 0x08],	%o4
	lduw	[%l7 + 0x10],	%i5
	fzero	%f2
	std	%f22,	[%l7 + 0x40]
	edge8n	%i0,	%o7,	%i2
	st	%f4,	[%l7 + 0x54]
	smul	%i4,	0x0C17,	%o3
	fmovrde	%l0,	%f4,	%f16
	umul	%l4,	%o1,	%l2
	fnor	%f24,	%f8,	%f10
	alignaddrl	%i1,	%l1,	%g6
	andncc	%g1,	%i3,	%g7
	fxnor	%f0,	%f12,	%f4
	movrne	%o2,	0x091,	%l3
	ldsb	[%l7 + 0x1D],	%o0
	fmovrse	%i7,	%f6,	%f4
	xnorcc	%g5,	%i6,	%o5
	fmovdcc	%icc,	%f16,	%f26
	sir	0x0C58
	alignaddrl	%o6,	%g4,	%l6
	srlx	%g3,	%g2,	%o4
	edge16ln	%l5,	%i5,	%o7
	alignaddr	%i2,	%i0,	%i4
	fmovsgu	%xcc,	%f11,	%f28
	ldsb	[%l7 + 0x1F],	%l0
	fmul8ulx16	%f26,	%f26,	%f26
	fpack32	%f24,	%f2,	%f20
	fxor	%f10,	%f28,	%f24
	movrne	%o3,	0x19F,	%l4
	fnegs	%f2,	%f11
	udivcc	%l2,	0x1B95,	%o1
	movpos	%xcc,	%i1,	%g6
	array32	%g1,	%l1,	%g7
	fmuld8ulx16	%f2,	%f2,	%f8
	or	%i3,	0x1A4A,	%o2
	nop
	set	0x0C, %g5
	lduh	[%l7 + %g5],	%o0
	edge16l	%l3,	%i7,	%g5
	nop
	set	0x12, %i6
	ldsb	[%l7 + %i6],	%o5
	edge32ln	%i6,	%g4,	%o6
	edge16n	%g3,	%l6,	%o4
	ldub	[%l7 + 0x7A],	%g2
	array32	%l5,	%o7,	%i5
	mova	%xcc,	%i2,	%i4
	movne	%xcc,	%i0,	%o3
	ld	[%l7 + 0x2C],	%f29
	faligndata	%f26,	%f12,	%f6
	movcs	%xcc,	%l0,	%l4
	popc	0x15D4,	%o1
	sll	%l2,	0x1E,	%i1
	andn	%g6,	%l1,	%g1
	srax	%g7,	0x03,	%i3
	array16	%o2,	%l3,	%i7
	ld	[%l7 + 0x4C],	%f18
	mulx	%o0,	%g5,	%i6
	movleu	%xcc,	%o5,	%o6
	stb	%g4,	[%l7 + 0x0F]
	fmovrdlz	%l6,	%f20,	%f20
	movge	%xcc,	%g3,	%g2
	edge16l	%o4,	%l5,	%o7
	movcs	%xcc,	%i2,	%i4
	sethi	0x08FD,	%i0
	stx	%i5,	[%l7 + 0x48]
	edge8	%l0,	%l4,	%o1
	udivcc	%o3,	0x1F28,	%i1
	fcmpes	%fcc1,	%f2,	%f15
	and	%l2,	%g6,	%l1
	subccc	%g1,	%g7,	%o2
	orn	%l3,	0x01FC,	%i7
	fcmpeq16	%f18,	%f8,	%o0
	fcmpgt32	%f22,	%f28,	%g5
	restore %i6, 0x1725, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o6,	%o5,	%g4
	movge	%xcc,	%g3,	%g2
	ldd	[%l7 + 0x28],	%o4
	srax	%l6,	0x0D,	%o7
	fnand	%f18,	%f0,	%f26
	fsrc2s	%f15,	%f11
	std	%f6,	[%l7 + 0x40]
	fmovsleu	%xcc,	%f21,	%f29
	subccc	%l5,	0x0EF4,	%i2
	udiv	%i0,	0x1CF6,	%i5
	edge16	%l0,	%l4,	%o1
	edge8	%i4,	%i1,	%o3
	fmovsgu	%icc,	%f29,	%f23
	addcc	%l2,	%l1,	%g1
	ld	[%l7 + 0x14],	%f15
	sllx	%g6,	0x07,	%g7
	orn	%o2,	0x1CA6,	%i7
	fmul8sux16	%f18,	%f20,	%f0
	edge32	%l3,	%o0,	%g5
	fmovsneg	%xcc,	%f28,	%f20
	fpack32	%f22,	%f2,	%f6
	sdiv	%i6,	0x0992,	%i3
	edge32ln	%o6,	%g4,	%g3
	st	%f0,	[%l7 + 0x40]
	xnorcc	%o5,	0x01FE,	%o4
	sra	%g2,	%o7,	%l6
	array16	%l5,	%i0,	%i5
	mova	%xcc,	%l0,	%i2
	edge8	%l4,	%o1,	%i1
	xnorcc	%i4,	%l2,	%o3
	move	%icc,	%l1,	%g1
	movge	%xcc,	%g7,	%g6
	subc	%o2,	0x0902,	%i7
	addcc	%o0,	0x1250,	%l3
	fnegd	%f16,	%f8
	save %i6, %i3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g5,	%g4,	%o5
	sethi	0x16E3,	%g3
	srlx	%g2,	%o4,	%l6
	ld	[%l7 + 0x1C],	%f30
	or	%l5,	0x19A5,	%i0
	fcmpne16	%f10,	%f30,	%i5
	andn	%o7,	0x1D6B,	%l0
	sub	%l4,	0x042D,	%i2
	edge16l	%o1,	%i4,	%i1
	andn	%l2,	0x161E,	%l1
	array8	%g1,	%g7,	%o3
	sub	%o2,	0x0470,	%i7
	lduw	[%l7 + 0x1C],	%o0
	addc	%l3,	0x0E34,	%i6
	umul	%i3,	0x105B,	%o6
	subccc	%g5,	%g4,	%o5
	fcmpne16	%f8,	%f20,	%g6
	sdiv	%g3,	0x0B23,	%o4
	subccc	%g2,	0x11D8,	%l6
	siam	0x5
	edge8ln	%l5,	%i5,	%i0
	subcc	%o7,	0x10DC,	%l4
	addc	%l0,	0x0923,	%o1
	fmovda	%icc,	%f2,	%f27
	andncc	%i2,	%i1,	%i4
	edge32n	%l1,	%g1,	%l2
	movne	%xcc,	%g7,	%o3
	movge	%xcc,	%o2,	%o0
	movpos	%icc,	%i7,	%i6
	sth	%i3,	[%l7 + 0x5A]
	edge16n	%l3,	%o6,	%g4
	fmovsneg	%icc,	%f23,	%f26
	orncc	%o5,	0x0D08,	%g5
	edge16	%g3,	%o4,	%g2
	edge8ln	%g6,	%l5,	%l6
	fornot1s	%f30,	%f15,	%f26
	fpadd16s	%f0,	%f16,	%f12
	fnegs	%f18,	%f30
	std	%f22,	[%l7 + 0x48]
	fmovrsgez	%i5,	%f7,	%f2
	alignaddrl	%i0,	%l4,	%l0
	array32	%o1,	%i2,	%i1
	for	%f24,	%f30,	%f0
	edge16l	%i4,	%o7,	%l1
	fnands	%f7,	%f26,	%f14
	fmovsneg	%xcc,	%f10,	%f12
	xorcc	%l2,	%g7,	%o3
	edge16	%o2,	%g1,	%o0
	movvs	%xcc,	%i7,	%i3
	save %i6, %l3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o5,	%g5,	%g4
	edge8n	%g3,	%o4,	%g6
	sdivx	%l5,	0x1823,	%g2
	mulx	%l6,	0x0A6E,	%i0
	move	%icc,	%i5,	%l4
	fornot2s	%f6,	%f30,	%f15
	movre	%o1,	0x00D,	%i2
	fmovdpos	%xcc,	%f30,	%f10
	fmovspos	%icc,	%f21,	%f16
	movneg	%xcc,	%i1,	%i4
	fone	%f2
	fornot1	%f12,	%f26,	%f16
	orncc	%l0,	%o7,	%l1
	fpadd32	%f12,	%f4,	%f26
	array8	%l2,	%o3,	%o2
	fnegd	%f14,	%f24
	ldub	[%l7 + 0x79],	%g7
	ldx	[%l7 + 0x08],	%g1
	stb	%o0,	[%l7 + 0x2D]
	stb	%i3,	[%l7 + 0x13]
	ldx	[%l7 + 0x10],	%i7
	edge32n	%i6,	%o6,	%l3
	fcmpd	%fcc3,	%f22,	%f12
	stb	%g5,	[%l7 + 0x45]
	fmul8ulx16	%f0,	%f10,	%f10
	fmovde	%xcc,	%f29,	%f7
	edge32n	%g4,	%o5,	%g3
	andn	%o4,	%l5,	%g2
	fmovsvs	%xcc,	%f24,	%f16
	orcc	%l6,	0x1F48,	%g6
	subccc	%i5,	0x083B,	%l4
	addc	%i0,	0x0E39,	%o1
	movre	%i2,	%i4,	%l0
	stb	%o7,	[%l7 + 0x7E]
	fmovs	%f24,	%f30
	andn	%i1,	0x0108,	%l1
	xnor	%l2,	%o2,	%g7
	udivcc	%g1,	0x0DB3,	%o0
	nop
	set	0x3C, %o5
	ldsw	[%l7 + %o5],	%i3
	sethi	0x04C2,	%i7
	fcmpd	%fcc1,	%f10,	%f10
	movrgz	%o3,	0x15B,	%i6
	ld	[%l7 + 0x74],	%f10
	orcc	%l3,	0x00AE,	%o6
	udivx	%g5,	0x144D,	%o5
	ldsb	[%l7 + 0x66],	%g4
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	lduw	[%l7 + 0x68],	%g2
	and	%g3,	%l6,	%i5
	edge16	%g6,	%l4,	%i0
	alignaddr	%o1,	%i4,	%i2
	edge8l	%l0,	%o7,	%l1
	ldd	[%l7 + 0x30],	%f18
	subcc	%i1,	%o2,	%g7
	fpsub32	%f2,	%f26,	%f0
	smulcc	%l2,	%o0,	%g1
	sdivx	%i7,	0x0782,	%o3
	udivx	%i6,	0x17E0,	%l3
	edge16l	%o6,	%g5,	%i3
	stx	%g4,	[%l7 + 0x78]
	ldsh	[%l7 + 0x7A],	%o5
	sdivcc	%o4,	0x1C37,	%l5
	fmovd	%f14,	%f28
	movl	%icc,	%g2,	%l6
	edge8ln	%g3,	%i5,	%g6
	add	%l4,	%i0,	%i4
	stw	%o1,	[%l7 + 0x58]
	sth	%l0,	[%l7 + 0x4C]
	fands	%f8,	%f16,	%f25
	subc	%i2,	0x1951,	%o7
	xor	%l1,	%o2,	%i1
	orncc	%l2,	%o0,	%g7
	alignaddr	%i7,	%g1,	%i6
	fmovspos	%xcc,	%f17,	%f26
	movcc	%xcc,	%l3,	%o6
	and	%o3,	%g5,	%g4
	mova	%xcc,	%i3,	%o5
	movrgz	%l5,	0x2AD,	%o4
	xnor	%l6,	%g3,	%g2
	fors	%f17,	%f25,	%f4
	xnorcc	%g6,	%l4,	%i0
	umulcc	%i5,	%i4,	%o1
	stw	%l0,	[%l7 + 0x6C]
	fone	%f6
	andncc	%i2,	%l1,	%o7
	fpsub32s	%f21,	%f10,	%f20
	ldsw	[%l7 + 0x0C],	%o2
	stw	%l2,	[%l7 + 0x20]
	for	%f24,	%f0,	%f12
	array8	%i1,	%g7,	%o0
	fmovdl	%xcc,	%f2,	%f6
	edge16ln	%i7,	%g1,	%i6
	lduw	[%l7 + 0x18],	%l3
	ld	[%l7 + 0x68],	%f8
	movne	%icc,	%o3,	%g5
	movcs	%xcc,	%g4,	%o6
	fpack32	%f10,	%f30,	%f20
	movgu	%icc,	%i3,	%o5
	sir	0x06C7
	sir	0x05A3
	xorcc	%o4,	%l5,	%g3
	umul	%l6,	0x1D70,	%g6
	save %l4, 0x1E90, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i0,	%i4,	%o1
	and	%l0,	0x0597,	%i2
	movle	%xcc,	%l1,	%i5
	fpadd16	%f20,	%f30,	%f0
	sethi	0x1C53,	%o2
	nop
	set	0x4E, %i1
	ldub	[%l7 + %i1],	%o7
	addcc	%l2,	0x0048,	%g7
	mulscc	%i1,	%o0,	%i7
	lduh	[%l7 + 0x6E],	%i6
	subcc	%l3,	%g1,	%o3
	movge	%xcc,	%g4,	%g5
	and	%i3,	0x0527,	%o6
	movvc	%icc,	%o4,	%o5
	udivcc	%l5,	0x03A4,	%g3
	fmovd	%f24,	%f10
	movn	%xcc,	%g6,	%l4
	fcmps	%fcc2,	%f20,	%f25
	sll	%l6,	0x15,	%i0
	fmovscc	%xcc,	%f24,	%f10
	srlx	%i4,	0x10,	%g2
	and	%l0,	0x1E3E,	%i2
	fxor	%f4,	%f14,	%f6
	movge	%icc,	%l1,	%i5
	ldsb	[%l7 + 0x51],	%o2
	mova	%xcc,	%o7,	%o1
	ldx	[%l7 + 0x78],	%l2
	add	%i1,	%g7,	%o0
	ldx	[%l7 + 0x08],	%i7
	array16	%i6,	%g1,	%o3
	lduh	[%l7 + 0x1A],	%g4
	edge16ln	%g5,	%i3,	%o6
	popc	0x0A95,	%o4
	orcc	%l3,	%o5,	%l5
	fpadd16s	%f25,	%f28,	%f29
	fsrc1s	%f4,	%f14
	array32	%g6,	%g3,	%l4
	smul	%i0,	0x0AB7,	%l6
	addccc	%g2,	0x09D0,	%l0
	andn	%i2,	%i4,	%l1
	ldsb	[%l7 + 0x0D],	%o2
	std	%f12,	[%l7 + 0x08]
	movle	%xcc,	%o7,	%o1
	addccc	%l2,	%i1,	%g7
	stw	%i5,	[%l7 + 0x0C]
	stw	%o0,	[%l7 + 0x40]
	fmovrdlez	%i7,	%f26,	%f10
	fmovdcs	%xcc,	%f31,	%f25
	subc	%g1,	0x17EC,	%o3
	smulcc	%g4,	%i6,	%g5
	ldx	[%l7 + 0x68],	%i3
	edge32n	%o4,	%l3,	%o6
	srax	%o5,	%g6,	%l5
	nop
	set	0x1A, %g7
	ldsh	[%l7 + %g7],	%g3
	sethi	0x1DB7,	%i0
	movrlez	%l6,	%g2,	%l0
	edge8n	%i2,	%i4,	%l1
	fmovdcs	%icc,	%f24,	%f14
	orcc	%o2,	%o7,	%l4
	xorcc	%l2,	%i1,	%o1
	ldd	[%l7 + 0x20],	%i4
	sdiv	%g7,	0x12A2,	%o0
	fmovsge	%icc,	%f24,	%f3
	fxors	%f15,	%f26,	%f9
	ldsw	[%l7 + 0x20],	%i7
	movne	%xcc,	%g1,	%g4
	movrgz	%i6,	0x17A,	%g5
	fmovrslez	%o3,	%f8,	%f16
	add	%o4,	0x13FA,	%i3
	save %l3, %o5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g6,	%g3,	%l5
	fmovs	%f19,	%f26
	array8	%i0,	%l6,	%l0
	st	%f27,	[%l7 + 0x5C]
	save %i2, %g2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x09F6
	and	%o2,	%o7,	%l4
	xor	%l1,	0x136D,	%l2
	subcc	%i1,	%i5,	%o1
	add	%g7,	%i7,	%o0
	movpos	%xcc,	%g4,	%i6
	fcmps	%fcc1,	%f18,	%f11
	sub	%g1,	0x080C,	%g5
	alignaddrl	%o3,	%o4,	%i3
	movl	%xcc,	%l3,	%o6
	xorcc	%g6,	0x0459,	%g3
	fmovsgu	%xcc,	%f22,	%f4
	movge	%icc,	%o5,	%l5
	stw	%i0,	[%l7 + 0x68]
	movle	%icc,	%l0,	%l6
	fors	%f12,	%f29,	%f30
	move	%icc,	%i2,	%g2
	edge32ln	%i4,	%o7,	%o2
	sdivcc	%l4,	0x06AE,	%l2
	movn	%icc,	%l1,	%i1
	edge32l	%i5,	%g7,	%i7
	array32	%o1,	%g4,	%o0
	movle	%xcc,	%g1,	%i6
	array32	%g5,	%o3,	%i3
	fmovsl	%xcc,	%f21,	%f24
	edge8ln	%o4,	%l3,	%o6
	andcc	%g6,	0x0F0E,	%o5
	sub	%g3,	%l5,	%i0
	stb	%l0,	[%l7 + 0x61]
	xnorcc	%l6,	%g2,	%i4
	ldsw	[%l7 + 0x4C],	%o7
	fpsub16	%f20,	%f12,	%f24
	fmovsgu	%xcc,	%f26,	%f16
	ldx	[%l7 + 0x40],	%i2
	fpadd16s	%f2,	%f6,	%f7
	ldd	[%l7 + 0x50],	%f30
	fmovdleu	%xcc,	%f6,	%f23
	edge8ln	%o2,	%l4,	%l2
	andcc	%i1,	0x18B8,	%i5
	array32	%g7,	%i7,	%o1
	movrlez	%g4,	%l1,	%o0
	xor	%g1,	0x0830,	%i6
	sdivx	%o3,	0x030C,	%g5
	nop
	set	0x48, %g4
	ldd	[%l7 + %g4],	%i2
	ldsh	[%l7 + 0x74],	%o4
	fmovde	%icc,	%f5,	%f15
	ldd	[%l7 + 0x18],	%f30
	sra	%o6,	%l3,	%g6
	movn	%xcc,	%o5,	%g3
	ldsh	[%l7 + 0x1C],	%l5
	movrlz	%l0,	%l6,	%g2
	fpadd16	%f26,	%f24,	%f30
	movre	%i4,	0x2C0,	%i0
	mova	%xcc,	%o7,	%i2
	orcc	%l4,	0x1E6A,	%l2
	movpos	%xcc,	%o2,	%i1
	stw	%g7,	[%l7 + 0x0C]
	ld	[%l7 + 0x7C],	%f9
	addcc	%i7,	0x0C84,	%i5
	stb	%o1,	[%l7 + 0x55]
	movrlez	%l1,	%g4,	%o0
	array32	%i6,	%g1,	%o3
	udivx	%g5,	0x0656,	%o4
	umulcc	%o6,	0x1F8F,	%l3
	umul	%g6,	%i3,	%g3
	xorcc	%o5,	0x0938,	%l0
	movcs	%xcc,	%l6,	%l5
	subcc	%g2,	%i0,	%i4
	ldx	[%l7 + 0x30],	%i2
	movre	%l4,	%l2,	%o7
	ld	[%l7 + 0x14],	%f18
	movneg	%xcc,	%i1,	%g7
	movrgez	%i7,	0x2DB,	%i5
	move	%xcc,	%o2,	%o1
	sra	%l1,	0x0B,	%g4
	movrlez	%o0,	0x117,	%g1
	udivx	%i6,	0x0D4D,	%g5
	fmovdcc	%xcc,	%f12,	%f4
	fandnot2s	%f17,	%f24,	%f28
	std	%f8,	[%l7 + 0x58]
	fornot1s	%f17,	%f10,	%f15
	popc	0x17F4,	%o4
	movrlz	%o3,	0x2B0,	%o6
	movneg	%xcc,	%g6,	%l3
	movcc	%xcc,	%i3,	%g3
	edge32ln	%o5,	%l0,	%l6
	edge32n	%g2,	%i0,	%i4
	movcc	%icc,	%l5,	%i2
	ldx	[%l7 + 0x28],	%l4
	move	%icc,	%l2,	%o7
	edge8l	%i1,	%i7,	%i5
	sllx	%g7,	%o1,	%o2
	movleu	%xcc,	%l1,	%g4
	ldd	[%l7 + 0x40],	%f24
	xnor	%g1,	%o0,	%i6
	save %o4, %g5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g6,	0x05AC,	%o3
	fmovrdlz	%i3,	%f4,	%f24
	sllx	%l3,	0x1C,	%o5
	mulx	%l0,	0x0DB3,	%l6
	fmul8x16au	%f11,	%f20,	%f12
	fmovdge	%icc,	%f10,	%f0
	and	%g2,	0x19FB,	%i0
	movn	%icc,	%i4,	%l5
	ldd	[%l7 + 0x48],	%g2
	array8	%l4,	%i2,	%o7
	sth	%i1,	[%l7 + 0x24]
	smul	%i7,	%i5,	%l2
	siam	0x5
	movre	%g7,	0x1A0,	%o1
	movgu	%icc,	%l1,	%g4
	edge16	%g1,	%o0,	%o2
	edge16l	%o4,	%g5,	%o6
	edge16l	%g6,	%i6,	%i3
	fmovdleu	%icc,	%f7,	%f3
	subcc	%l3,	0x18D0,	%o3
	ldd	[%l7 + 0x70],	%o4
	addcc	%l0,	%l6,	%i0
	fand	%f6,	%f0,	%f6
	subcc	%i4,	0x19BE,	%g2
	st	%f6,	[%l7 + 0x38]
	xnor	%g3,	0x13DF,	%l4
	movcc	%icc,	%i2,	%l5
	edge32ln	%i1,	%o7,	%i7
	subc	%l2,	0x0FA2,	%g7
	popc	0x1D66,	%i5
	xorcc	%l1,	0x08AC,	%g4
	fmovsgu	%icc,	%f3,	%f14
	fcmpeq16	%f28,	%f26,	%g1
	fmovrdlz	%o1,	%f20,	%f20
	edge8ln	%o0,	%o2,	%o4
	ldsh	[%l7 + 0x0A],	%g5
	movge	%icc,	%g6,	%i6
	alignaddrl	%o6,	%l3,	%i3
	sdivx	%o3,	0x089B,	%l0
	edge8ln	%o5,	%i0,	%i4
	movrgez	%g2,	0x078,	%l6
	st	%f13,	[%l7 + 0x4C]
	addcc	%l4,	%i2,	%g3
	array8	%i1,	%l5,	%i7
	edge16ln	%o7,	%l2,	%i5
	sir	0x0D53
	fmovdcc	%icc,	%f28,	%f5
	movn	%xcc,	%l1,	%g4
	srax	%g1,	%o1,	%g7
	udiv	%o2,	0x0448,	%o4
	edge32	%g5,	%g6,	%i6
	fnors	%f25,	%f1,	%f20
	fsrc2	%f4,	%f24
	umul	%o6,	0x01B5,	%l3
	mova	%icc,	%o0,	%i3
	movrlez	%l0,	0x29C,	%o5
	fmovda	%xcc,	%f18,	%f15
	ldsh	[%l7 + 0x6C],	%o3
	udivcc	%i4,	0x0FA3,	%g2
	ld	[%l7 + 0x08],	%f24
	popc	0x063E,	%l6
	fpack16	%f4,	%f20
	ldsb	[%l7 + 0x0F],	%i0
	umulcc	%i2,	%g3,	%i1
	udivcc	%l5,	0x0A5F,	%i7
	smulcc	%l4,	%o7,	%l2
	stw	%i5,	[%l7 + 0x10]
	smulcc	%g4,	%g1,	%o1
	addccc	%l1,	%o2,	%g7
	orn	%o4,	%g5,	%i6
	edge32ln	%g6,	%o6,	%o0
	array16	%i3,	%l0,	%l3
	edge8l	%o3,	%i4,	%g2
	st	%f30,	[%l7 + 0x3C]
	edge32ln	%l6,	%i0,	%o5
	movrne	%g3,	%i2,	%i1
	orncc	%i7,	0x0D16,	%l5
	movre	%l4,	%l2,	%o7
	fornot1s	%f3,	%f8,	%f19
	addc	%i5,	%g1,	%g4
	edge32	%l1,	%o1,	%g7
	movne	%icc,	%o4,	%g5
	edge8l	%i6,	%o2,	%g6
	array16	%o0,	%o6,	%l0
	sllx	%i3,	0x07,	%o3
	alignaddr	%l3,	%i4,	%g2
	mulscc	%i0,	%o5,	%l6
	sth	%i2,	[%l7 + 0x3A]
	fmovsle	%xcc,	%f29,	%f27
	movrne	%i1,	0x0FF,	%i7
	fmovdge	%xcc,	%f31,	%f28
	sth	%l5,	[%l7 + 0x0A]
	fnot2	%f0,	%f0
	std	%f30,	[%l7 + 0x60]
	smul	%l4,	0x1513,	%g3
	sth	%o7,	[%l7 + 0x5C]
	mulx	%i5,	0x148D,	%l2
	edge16	%g1,	%l1,	%o1
	fxor	%f18,	%f20,	%f28
	movvs	%icc,	%g7,	%o4
	movleu	%xcc,	%g5,	%g4
	umul	%i6,	%o2,	%o0
	orcc	%g6,	0x1909,	%o6
	movvc	%xcc,	%i3,	%o3
	sllx	%l3,	%i4,	%l0
	array16	%i0,	%o5,	%l6
	xnor	%i2,	0x0BEF,	%g2
	move	%xcc,	%i1,	%l5
	movpos	%xcc,	%l4,	%g3
	addccc	%o7,	%i7,	%i5
	ldd	[%l7 + 0x30],	%f24
	xorcc	%g1,	0x081F,	%l1
	addc	%o1,	0x149B,	%l2
	fmovscs	%xcc,	%f6,	%f8
	edge32ln	%o4,	%g5,	%g7
	fnand	%f8,	%f26,	%f16
	addccc	%g4,	0x1738,	%i6
	movrlez	%o2,	0x3FA,	%o0
	alignaddr	%o6,	%g6,	%o3
	mulscc	%i3,	%l3,	%i4
	orcc	%i0,	0x19DF,	%o5
	fcmpes	%fcc0,	%f0,	%f16
	fnand	%f8,	%f8,	%f30
	ldsh	[%l7 + 0x6A],	%l6
	fmovscs	%xcc,	%f17,	%f31
	edge8	%i2,	%l0,	%i1
	movvs	%xcc,	%l5,	%l4
	xor	%g3,	%g2,	%i7
	fcmpgt16	%f30,	%f24,	%i5
	popc	0x0AF0,	%g1
	srax	%l1,	0x1E,	%o7
	mova	%icc,	%o1,	%o4
	fsrc2	%f30,	%f28
	ldub	[%l7 + 0x33],	%g5
	smul	%g7,	0x0276,	%g4
	faligndata	%f24,	%f24,	%f30
	edge32n	%i6,	%l2,	%o2
	umul	%o6,	0x0A29,	%g6
	andcc	%o0,	%o3,	%l3
	sir	0x15BD
	fcmpd	%fcc0,	%f6,	%f2
	fxor	%f26,	%f0,	%f10
	movge	%xcc,	%i3,	%i0
	array32	%o5,	%l6,	%i4
	orncc	%l0,	%i2,	%l5
	lduh	[%l7 + 0x16],	%i1
	subc	%l4,	0x1923,	%g2
	sth	%i7,	[%l7 + 0x12]
	lduh	[%l7 + 0x56],	%g3
	std	%f26,	[%l7 + 0x20]
	udiv	%i5,	0x0134,	%g1
	fornot1s	%f24,	%f1,	%f20
	movn	%icc,	%o7,	%l1
	udivx	%o4,	0x1569,	%g5
	movvs	%icc,	%g7,	%g4
	movrlz	%i6,	%o1,	%l2
	lduw	[%l7 + 0x08],	%o6
	movne	%icc,	%g6,	%o2
	edge32n	%o0,	%o3,	%i3
	movvs	%icc,	%i0,	%l3
	movne	%icc,	%l6,	%o5
	udiv	%l0,	0x04A4,	%i2
	restore %l5, 0x1AFB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l4,	%i1
	sub	%i7,	0x189B,	%g3
	umul	%i5,	0x147F,	%g2
	fone	%f22
	mulx	%g1,	%o7,	%o4
	movpos	%icc,	%g5,	%g7
	movrne	%l1,	%i6,	%o1
	edge16	%g4,	%o6,	%g6
	sdivx	%o2,	0x1CA4,	%l2
	fnegd	%f2,	%f4
	edge32l	%o3,	%i3,	%o0
	stb	%i0,	[%l7 + 0x43]
	movn	%icc,	%l6,	%o5
	fmovspos	%xcc,	%f17,	%f24
	edge16	%l3,	%i2,	%l5
	addccc	%i4,	0x08F3,	%l4
	sub	%i1,	0x0B82,	%l0
	movrne	%i7,	0x3D0,	%i5
	xorcc	%g3,	%g2,	%o7
	fmovrslz	%g1,	%f18,	%f6
	bshuffle	%f16,	%f30,	%f26
	fcmpne16	%f30,	%f8,	%o4
	addccc	%g7,	%l1,	%g5
	fmovrsgz	%i6,	%f28,	%f11
	subc	%o1,	0x1CBD,	%g4
	sub	%g6,	%o2,	%o6
	sllx	%o3,	0x0E,	%i3
	umulcc	%l2,	%o0,	%i0
	edge8l	%l6,	%o5,	%i2
	lduh	[%l7 + 0x26],	%l3
	fmovsg	%icc,	%f31,	%f3
	fmovdvs	%xcc,	%f7,	%f28
	ldub	[%l7 + 0x48],	%i4
	mulx	%l4,	0x031C,	%i1
	movn	%xcc,	%l0,	%i7
	movrgz	%i5,	%l5,	%g2
	ldd	[%l7 + 0x20],	%o6
	andncc	%g3,	%o4,	%g1
	fmovdgu	%icc,	%f31,	%f7
	fmovdcs	%xcc,	%f7,	%f1
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	movrne	%i6,	0x28E,	%g7
	fcmpeq16	%f28,	%f14,	%o1
	movneg	%icc,	%g4,	%o2
	subccc	%g6,	0x0676,	%o3
	ld	[%l7 + 0x38],	%f15
	edge8l	%o6,	%i3,	%o0
	addccc	%l2,	%l6,	%o5
	movg	%xcc,	%i0,	%l3
	siam	0x2
	sub	%i2,	%i4,	%i1
	movge	%xcc,	%l0,	%i7
	move	%icc,	%i5,	%l4
	edge32n	%l5,	%g2,	%g3
	addccc	%o4,	%o7,	%g1
	movrlz	%g5,	%i6,	%g7
	fornot2s	%f25,	%f28,	%f25
	udiv	%o1,	0x0D32,	%l1
	fmovscc	%xcc,	%f6,	%f9
	orncc	%o2,	0x0996,	%g4
	movge	%icc,	%g6,	%o3
	fnot2	%f20,	%f2
	and	%i3,	0x1E20,	%o0
	subccc	%o6,	0x092F,	%l6
	fmovrse	%l2,	%f13,	%f23
	movrlz	%o5,	0x30C,	%i0
	addc	%i2,	0x0136,	%l3
	faligndata	%f10,	%f26,	%f22
	sir	0x0B69
	fnands	%f11,	%f13,	%f24
	sub	%i4,	%i1,	%i7
	movrgz	%i5,	%l0,	%l4
	array32	%l5,	%g3,	%g2
	fmovsa	%icc,	%f31,	%f14
	umul	%o4,	%o7,	%g5
	std	%f24,	[%l7 + 0x50]
	addc	%g1,	0x13D5,	%i6
	and	%o1,	0x0B6C,	%g7
	movre	%o2,	%l1,	%g6
	addcc	%o3,	%i3,	%g4
	stx	%o0,	[%l7 + 0x40]
	movl	%icc,	%l6,	%l2
	fmovdn	%icc,	%f5,	%f0
	stb	%o6,	[%l7 + 0x6F]
	movneg	%icc,	%o5,	%i2
	fpack16	%f30,	%f8
	lduh	[%l7 + 0x42],	%i0
	movrlez	%i4,	0x3FA,	%l3
	edge8n	%i1,	%i5,	%l0
	movrlz	%i7,	%l5,	%l4
	edge8ln	%g2,	%o4,	%g3
	srl	%g5,	0x0F,	%o7
	movn	%xcc,	%i6,	%o1
	fpadd32s	%f5,	%f7,	%f12
	st	%f9,	[%l7 + 0x08]
	sethi	0x1AE6,	%g1
	orn	%g7,	0x1E07,	%o2
	orncc	%l1,	0x08CF,	%o3
	edge32n	%g6,	%i3,	%g4
	fornot1s	%f15,	%f26,	%f23
	subcc	%l6,	%o0,	%o6
	movcs	%icc,	%o5,	%i2
	movg	%icc,	%l2,	%i0
	andcc	%l3,	0x0E96,	%i1
	movrlz	%i4,	0x268,	%i5
	fxnors	%f29,	%f16,	%f3
	smul	%i7,	0x063E,	%l5
	movvc	%xcc,	%l4,	%g2
	edge16l	%o4,	%g3,	%g5
	fmovdgu	%icc,	%f6,	%f7
	fmovrslz	%l0,	%f24,	%f6
	lduw	[%l7 + 0x58],	%i6
	umul	%o1,	0x1ACA,	%o7
	ld	[%l7 + 0x10],	%f25
	edge8n	%g7,	%g1,	%l1
	ld	[%l7 + 0x08],	%f11
	sllx	%o3,	%g6,	%i3
	edge16ln	%o2,	%g4,	%o0
	edge32ln	%l6,	%o6,	%o5
	umul	%l2,	%i0,	%l3
	mulx	%i1,	0x159E,	%i2
	ldd	[%l7 + 0x68],	%i4
	xnorcc	%i7,	0x1579,	%i5
	andn	%l5,	0x0BD6,	%g2
	movgu	%icc,	%o4,	%l4
	sethi	0x0F67,	%g3
	ldub	[%l7 + 0x13],	%g5
	sdivcc	%l0,	0x1DB9,	%i6
	umulcc	%o7,	%o1,	%g1
	sth	%l1,	[%l7 + 0x7A]
	fmovdn	%xcc,	%f25,	%f26
	fmovrsne	%g7,	%f3,	%f0
	orn	%o3,	0x01D5,	%i3
	faligndata	%f16,	%f0,	%f10
	srax	%o2,	0x10,	%g4
	fxnors	%f29,	%f13,	%f15
	edge32	%o0,	%g6,	%l6
	udivx	%o5,	0x175F,	%l2
	movrlz	%o6,	%i0,	%l3
	sethi	0x1B5D,	%i2
	sllx	%i4,	0x08,	%i7
	smulcc	%i5,	%i1,	%l5
	sdivx	%o4,	0x0531,	%l4
	fmovd	%f6,	%f12
	andcc	%g2,	0x1AA7,	%g5
	fnands	%f24,	%f12,	%f8
	ldub	[%l7 + 0x23],	%l0
	array32	%i6,	%o7,	%g3
	fpadd16	%f0,	%f22,	%f24
	array8	%o1,	%l1,	%g7
	movleu	%xcc,	%g1,	%o3
	restore %i3, 0x1AF4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o0,	%g6,	%o2
	lduw	[%l7 + 0x48],	%o5
	ldsh	[%l7 + 0x4C],	%l2
	edge16	%o6,	%i0,	%l6
	fand	%f16,	%f12,	%f28
	movg	%icc,	%i2,	%i4
	movrne	%i7,	%l3,	%i1
	movge	%icc,	%l5,	%i5
	stb	%o4,	[%l7 + 0x23]
	ldsw	[%l7 + 0x44],	%l4
	fpadd32s	%f30,	%f27,	%f11
	sethi	0x02FF,	%g5
	movneg	%xcc,	%g2,	%l0
	edge32ln	%i6,	%o7,	%g3
	fpsub16	%f30,	%f28,	%f30
	ldd	[%l7 + 0x60],	%f8
	movcc	%icc,	%l1,	%o1
	edge16l	%g1,	%g7,	%o3
	pdist	%f14,	%f22,	%f20
	fone	%f18
	sub	%i3,	%o0,	%g6
	popc	0x07C3,	%g4
	xor	%o5,	%o2,	%l2
	fmovrdlez	%i0,	%f28,	%f0
	fnor	%f6,	%f0,	%f6
	andncc	%l6,	%i2,	%o6
	xnorcc	%i7,	0x0BFA,	%i4
	edge8	%i1,	%l3,	%i5
	fnands	%f24,	%f8,	%f9
	stx	%o4,	[%l7 + 0x18]
	movrlez	%l5,	0x364,	%l4
	movg	%icc,	%g5,	%l0
	movneg	%xcc,	%g2,	%o7
	sllx	%g3,	%l1,	%o1
	ldd	[%l7 + 0x60],	%i6
	ld	[%l7 + 0x58],	%f19
	andncc	%g1,	%g7,	%o3
	srlx	%i3,	%o0,	%g6
	fnor	%f20,	%f30,	%f14
	movre	%g4,	0x2E9,	%o5
	umul	%o2,	%l2,	%i0
	movcc	%xcc,	%l6,	%i2
	edge32n	%i7,	%i4,	%i1
	andn	%l3,	%o6,	%i5
	sethi	0x1ACB,	%o4
	sdivcc	%l4,	0x19E5,	%g5
	udivcc	%l5,	0x0FC3,	%l0
	fxors	%f21,	%f9,	%f22
	movcs	%icc,	%g2,	%g3
	fmovsn	%xcc,	%f15,	%f26
	lduh	[%l7 + 0x72],	%o7
	fmovrdne	%l1,	%f12,	%f22
	stw	%i6,	[%l7 + 0x08]
	movle	%icc,	%g1,	%o1
	movrne	%o3,	0x042,	%i3
	umul	%g7,	0x0FA6,	%g6
	edge8n	%g4,	%o0,	%o2
	ldsh	[%l7 + 0x4A],	%o5
	edge32n	%i0,	%l6,	%l2
	move	%icc,	%i7,	%i4
	fzeros	%f24
	andcc	%i1,	%i2,	%l3
	fmovde	%icc,	%f21,	%f11
	fpadd16s	%f21,	%f4,	%f0
	alignaddrl	%i5,	%o4,	%l4
	lduh	[%l7 + 0x62],	%o6
	udivcc	%g5,	0x0234,	%l5
	fandnot1	%f12,	%f4,	%f22
	save %g2, 0x1373, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x60],	%g3
	sll	%o7,	0x05,	%l1
	save %i6, %g1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o1,	%i3,	%g7
	edge32ln	%g6,	%o0,	%g4
	and	%o5,	%i0,	%o2
	sth	%l2,	[%l7 + 0x0E]
	movneg	%xcc,	%i7,	%l6
	andncc	%i4,	%i2,	%l3
	subcc	%i1,	0x0793,	%o4
	mulx	%l4,	%i5,	%g5
	fcmpes	%fcc1,	%f31,	%f1
	sll	%l5,	0x1A,	%o6
	st	%f10,	[%l7 + 0x6C]
	movge	%xcc,	%g2,	%l0
	nop
	set	0x70, %i7
	stx	%g3,	[%l7 + %i7]
	xorcc	%o7,	%i6,	%g1
	xorcc	%l1,	%o3,	%o1
	orncc	%g7,	0x0430,	%i3
	fmovde	%xcc,	%f27,	%f15
	fmul8x16	%f28,	%f18,	%f0
	fcmpgt32	%f28,	%f8,	%g6
	array16	%g4,	%o0,	%i0
	nop
	set	0x30, %i2
	std	%f0,	[%l7 + %i2]
	andcc	%o5,	%l2,	%o2
	mulscc	%i7,	%i4,	%l6
	ldub	[%l7 + 0x7D],	%i2
	movneg	%xcc,	%l3,	%i1
	umul	%o4,	%i5,	%l4
	fornot2	%f14,	%f26,	%f26
	fmovsg	%icc,	%f1,	%f0
	st	%f0,	[%l7 + 0x6C]
	sllx	%g5,	%o6,	%g2
	fmovde	%xcc,	%f17,	%f10
	edge32ln	%l0,	%l5,	%o7
	edge16ln	%g3,	%g1,	%l1
	stx	%o3,	[%l7 + 0x28]
	movvs	%icc,	%i6,	%o1
	edge16n	%g7,	%g6,	%i3
	udiv	%o0,	0x0263,	%i0
	fxor	%f30,	%f24,	%f10
	edge8l	%o5,	%g4,	%o2
	mulscc	%l2,	0x0367,	%i4
	fcmpes	%fcc3,	%f16,	%f2
	edge16l	%l6,	%i7,	%l3
	umul	%i2,	0x171A,	%o4
	mulscc	%i1,	%l4,	%i5
	fnot2	%f30,	%f8
	add	%g5,	0x020A,	%o6
	movgu	%icc,	%g2,	%l5
	ldx	[%l7 + 0x08],	%o7
	subc	%l0,	0x040F,	%g1
	edge32l	%l1,	%o3,	%i6
	lduw	[%l7 + 0x1C],	%g3
	fmuld8ulx16	%f15,	%f20,	%f26
	fmovdleu	%icc,	%f20,	%f26
	sdivcc	%g7,	0x1109,	%g6
	movl	%icc,	%o1,	%o0
	fmovdpos	%xcc,	%f21,	%f24
	ldd	[%l7 + 0x18],	%f24
	movge	%icc,	%i0,	%i3
	andcc	%o5,	0x0873,	%o2
	movrgez	%l2,	%g4,	%l6
	orcc	%i7,	0x1EBB,	%i4
	fors	%f26,	%f15,	%f27
	add	%l3,	0x133E,	%o4
	fmovsle	%xcc,	%f22,	%f22
	edge32n	%i1,	%l4,	%i5
	ldub	[%l7 + 0x6C],	%i2
	nop
	set	0x2C, %g6
	stw	%o6,	[%l7 + %g6]
	ldd	[%l7 + 0x38],	%f20
	or	%g5,	%g2,	%l5
	ld	[%l7 + 0x1C],	%f16
	andncc	%o7,	%l0,	%g1
	movneg	%icc,	%l1,	%i6
	fcmpeq32	%f20,	%f12,	%g3
	sir	0x1F26
	movrgez	%o3,	0x37D,	%g6
	fcmpne16	%f24,	%f22,	%o1
	udivcc	%g7,	0x144C,	%i0
	move	%icc,	%i3,	%o5
	ldsb	[%l7 + 0x2C],	%o0
	and	%l2,	%g4,	%l6
	lduw	[%l7 + 0x38],	%o2
	sdivx	%i7,	0x14A6,	%i4
	fmovd	%f18,	%f6
	sub	%o4,	%l3,	%l4
	fcmpes	%fcc3,	%f12,	%f2
	stb	%i5,	[%l7 + 0x63]
	fcmpgt16	%f30,	%f30,	%i1
	movcs	%icc,	%o6,	%g5
	xor	%i2,	%l5,	%g2
	movvc	%xcc,	%l0,	%o7
	edge8ln	%g1,	%i6,	%g3
	srl	%l1,	0x1A,	%o3
	edge32l	%o1,	%g6,	%i0
	fmovsge	%xcc,	%f30,	%f19
	ldub	[%l7 + 0x4E],	%g7
	array8	%o5,	%i3,	%o0
	edge32	%g4,	%l6,	%o2
	alignaddrl	%l2,	%i4,	%o4
	andncc	%i7,	%l4,	%l3
	movrlz	%i5,	0x317,	%o6
	add	%g5,	0x1ACE,	%i2
	udivx	%i1,	0x0885,	%g2
	fxors	%f12,	%f21,	%f10
	sub	%l0,	0x04BB,	%o7
	fmovda	%icc,	%f4,	%f30
	ldsw	[%l7 + 0x50],	%g1
	fnot1s	%f3,	%f23
	sdivcc	%i6,	0x0E39,	%l5
	edge16l	%l1,	%g3,	%o1
	edge16	%o3,	%g6,	%g7
	edge16n	%o5,	%i3,	%o0
	orcc	%i0,	%g4,	%l6
	std	%f16,	[%l7 + 0x70]
	subcc	%l2,	%o2,	%o4
	edge8n	%i7,	%l4,	%l3
	orcc	%i4,	0x179C,	%i5
	movcs	%icc,	%o6,	%g5
	or	%i2,	0x0B46,	%g2
	array16	%i1,	%o7,	%l0
	movle	%xcc,	%i6,	%g1
	movcc	%icc,	%l1,	%g3
	sdiv	%o1,	0x00A8,	%o3
	alignaddrl	%l5,	%g7,	%g6
	sllx	%i3,	%o5,	%o0
	lduw	[%l7 + 0x6C],	%i0
	subccc	%l6,	0x0B2F,	%l2
	array8	%o2,	%g4,	%i7
	fnand	%f28,	%f20,	%f24
	xnorcc	%o4,	0x02C7,	%l4
	ldsw	[%l7 + 0x3C],	%l3
	movne	%xcc,	%i4,	%i5
	mulscc	%g5,	0x1A00,	%o6
	ldd	[%l7 + 0x20],	%f22
	andcc	%i2,	0x0F40,	%i1
	ldx	[%l7 + 0x70],	%o7
	fornot2s	%f30,	%f31,	%f2
	edge8ln	%l0,	%i6,	%g2
	sub	%l1,	0x072B,	%g3
	subccc	%o1,	0x119E,	%o3
	and	%l5,	0x1E50,	%g7
	sub	%g1,	%i3,	%o5
	sub	%g6,	%o0,	%l6
	andcc	%l2,	0x002B,	%i0
	edge16n	%g4,	%i7,	%o4
	ldsb	[%l7 + 0x17],	%l4
	srl	%o2,	0x07,	%i4
	fmovdn	%icc,	%f21,	%f29
	movvs	%icc,	%i5,	%l3
	fmovdgu	%icc,	%f2,	%f22
	udiv	%g5,	0x12E0,	%i2
	stw	%o6,	[%l7 + 0x50]
	fmovrdlez	%o7,	%f14,	%f20
	srl	%i1,	%i6,	%g2
	fmovdcs	%icc,	%f25,	%f27
	or	%l0,	0x0886,	%g3
	fandnot2	%f14,	%f16,	%f10
	array8	%l1,	%o3,	%o1
	fmuld8ulx16	%f16,	%f12,	%f12
	sra	%l5,	0x1E,	%g7
	fmovrsgez	%g1,	%f27,	%f4
	sdivcc	%o5,	0x17C2,	%i3
	fcmpd	%fcc1,	%f22,	%f30
	sdivx	%o0,	0x1BD9,	%l6
	movge	%icc,	%l2,	%g6
	fmovse	%xcc,	%f0,	%f1
	movle	%xcc,	%i0,	%i7
	fornot1s	%f30,	%f27,	%f22
	fpsub32s	%f14,	%f10,	%f24
	movpos	%icc,	%o4,	%g4
	fmovdge	%xcc,	%f1,	%f27
	subcc	%o2,	0x0A31,	%l4
	smulcc	%i5,	%i4,	%l3
	alignaddr	%g5,	%o6,	%i2
	popc	%o7,	%i6
	sth	%i1,	[%l7 + 0x40]
	fsrc2	%f4,	%f20
	fmovdgu	%xcc,	%f6,	%f10
	movne	%xcc,	%l0,	%g2
	umul	%g3,	%o3,	%o1
	movn	%icc,	%l5,	%l1
	movvs	%xcc,	%g7,	%o5
	fmovrdne	%i3,	%f14,	%f22
	addcc	%o0,	%l6,	%g1
	edge32n	%l2,	%g6,	%i7
	sth	%o4,	[%l7 + 0x6C]
	srlx	%i0,	0x15,	%o2
	fmovrdne	%g4,	%f12,	%f20
	stw	%l4,	[%l7 + 0x50]
	alignaddr	%i5,	%l3,	%g5
	sth	%o6,	[%l7 + 0x2E]
	fmovsneg	%xcc,	%f5,	%f29
	array32	%i2,	%i4,	%o7
	edge8n	%i1,	%l0,	%g2
	movrlez	%g3,	0x0EC,	%o3
	andn	%o1,	0x13DA,	%l5
	orncc	%i6,	0x0983,	%l1
	popc	%g7,	%o5
	edge16ln	%o0,	%i3,	%l6
	edge32	%l2,	%g1,	%g6
	andn	%o4,	%i0,	%i7
	edge32n	%o2,	%g4,	%i5
	smul	%l4,	%g5,	%l3
	sdiv	%o6,	0x0271,	%i2
	andncc	%o7,	%i4,	%l0
	sth	%i1,	[%l7 + 0x62]
	ldd	[%l7 + 0x58],	%f22
	andcc	%g2,	0x1943,	%o3
	smulcc	%o1,	%g3,	%l5
	fcmple16	%f26,	%f24,	%i6
	xor	%g7,	%o5,	%l1
	fmovdleu	%icc,	%f26,	%f0
	xnorcc	%i3,	0x1026,	%l6
	movne	%xcc,	%l2,	%g1
	save %g6, 0x1C80, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f31,	%f23
	fcmped	%fcc0,	%f12,	%f20
	alignaddr	%i0,	%i7,	%o2
	or	%g4,	0x1068,	%o0
	sth	%l4,	[%l7 + 0x64]
	edge32l	%g5,	%i5,	%o6
	move	%icc,	%l3,	%i2
	stw	%i4,	[%l7 + 0x7C]
	movn	%icc,	%o7,	%l0
	fmovsvc	%icc,	%f7,	%f1
	fmul8x16al	%f2,	%f17,	%f20
	orn	%i1,	%o3,	%o1
	edge16n	%g2,	%l5,	%g3
	movvc	%xcc,	%g7,	%i6
	stx	%l1,	[%l7 + 0x70]
	fmovsa	%xcc,	%f15,	%f9
	subc	%i3,	0x020C,	%o5
	fcmps	%fcc2,	%f28,	%f11
	smulcc	%l2,	%l6,	%g1
	andn	%o4,	%g6,	%i7
	movrne	%i0,	%o2,	%o0
	edge8n	%l4,	%g4,	%i5
	stx	%g5,	[%l7 + 0x20]
	sra	%o6,	%l3,	%i2
	stw	%i4,	[%l7 + 0x0C]
	sub	%l0,	%i1,	%o7
	movleu	%xcc,	%o1,	%o3
	fcmpgt32	%f14,	%f18,	%l5
	fzero	%f18
	srlx	%g2,	0x00,	%g7
	movrlz	%g3,	%l1,	%i3
	movvs	%icc,	%i6,	%o5
	fmul8x16al	%f24,	%f23,	%f2
	smul	%l6,	0x12A0,	%g1
	sdivcc	%o4,	0x113A,	%g6
	fmovdleu	%icc,	%f4,	%f25
	umulcc	%l2,	0x083B,	%i0
	movgu	%icc,	%i7,	%o0
	array16	%o2,	%g4,	%l4
	srlx	%i5,	%o6,	%l3
	andncc	%g5,	%i4,	%l0
	movpos	%xcc,	%i2,	%i1
	st	%f22,	[%l7 + 0x20]
	addc	%o1,	%o7,	%l5
	ldsh	[%l7 + 0x22],	%o3
	fsrc2s	%f9,	%f9
	subc	%g7,	0x1A9C,	%g2
	fmovdle	%xcc,	%f30,	%f9
	edge32n	%g3,	%l1,	%i3
	fmovsvs	%icc,	%f24,	%f24
	fmovdge	%xcc,	%f12,	%f24
	movgu	%xcc,	%i6,	%l6
	edge8	%o5,	%o4,	%g6
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	movneg	%xcc,	%i0,	%i7
	xorcc	%o0,	0x1A82,	%o2
	movl	%icc,	%l4,	%g4
	umul	%i5,	%l3,	%g5
	movpos	%xcc,	%i4,	%l0
	lduh	[%l7 + 0x6C],	%i2
	sllx	%o6,	0x0F,	%i1
	sra	%o7,	0x0A,	%l5
	orncc	%o3,	%g7,	%g2
	lduh	[%l7 + 0x3E],	%g3
	st	%f31,	[%l7 + 0x4C]
	fcmple32	%f26,	%f10,	%o1
	edge16l	%l1,	%i6,	%l6
	edge16ln	%o5,	%o4,	%g6
	fpsub16s	%f1,	%f10,	%f9
	fmovdg	%icc,	%f20,	%f25
	fsrc2s	%f27,	%f26
	fandnot2	%f30,	%f0,	%f26
	add	%i3,	0x1A60,	%g1
	array8	%l2,	%i0,	%i7
	addcc	%o2,	0x0209,	%o0
	sub	%l4,	0x04D5,	%i5
	sdiv	%g4,	0x1E94,	%l3
	movrne	%g5,	%l0,	%i2
	xnor	%o6,	%i4,	%i1
	sdiv	%o7,	0x19E4,	%o3
	fmovsne	%xcc,	%f3,	%f12
	movle	%icc,	%l5,	%g2
	sllx	%g7,	0x08,	%o1
	fmovrsgz	%l1,	%f31,	%f12
	edge16l	%i6,	%g3,	%o5
	ldsb	[%l7 + 0x2D],	%l6
	stx	%o4,	[%l7 + 0x38]
	udivx	%i3,	0x0250,	%g6
	add	%l2,	0x1B0B,	%g1
	subccc	%i0,	%i7,	%o2
	sth	%l4,	[%l7 + 0x2E]
	fpsub16	%f4,	%f6,	%f10
	fmovdge	%xcc,	%f0,	%f17
	std	%f8,	[%l7 + 0x18]
	movrlez	%i5,	0x2E9,	%o0
	ldub	[%l7 + 0x20],	%g4
	umulcc	%g5,	0x083B,	%l0
	andcc	%i2,	0x1551,	%o6
	xor	%i4,	0x1C90,	%i1
	fmovrsgz	%o7,	%f29,	%f20
	movle	%xcc,	%o3,	%l3
	fpadd32	%f4,	%f24,	%f24
	stx	%l5,	[%l7 + 0x70]
	sir	0x1F53
	lduh	[%l7 + 0x4E],	%g2
	edge32n	%g7,	%o1,	%i6
	alignaddr	%l1,	%o5,	%g3
	movrlz	%o4,	0x245,	%i3
	sra	%g6,	0x0C,	%l2
	ldsb	[%l7 + 0x68],	%g1
	fmovsleu	%xcc,	%f9,	%f4
	popc	%i0,	%l6
	movg	%xcc,	%i7,	%o2
	ldsh	[%l7 + 0x0A],	%l4
	fmovsge	%icc,	%f29,	%f24
	fcmpgt16	%f28,	%f24,	%o0
	xnor	%g4,	%i5,	%g5
	ldd	[%l7 + 0x60],	%f30
	fandnot2s	%f29,	%f16,	%f9
	lduh	[%l7 + 0x1C],	%i2
	movl	%icc,	%l0,	%i4
	fmovrsgz	%o6,	%f24,	%f17
	orncc	%i1,	%o7,	%l3
	smulcc	%l5,	%g2,	%o3
	nop
	set	0x2A, %o0
	ldub	[%l7 + %o0],	%o1
	edge32ln	%g7,	%i6,	%o5
	subc	%g3,	0x1138,	%l1
	edge8l	%o4,	%g6,	%i3
	st	%f23,	[%l7 + 0x68]
	ldub	[%l7 + 0x6C],	%l2
	save %i0, 0x0E36, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i7,	0x199A,	%o2
	udivcc	%g1,	0x05B8,	%l4
	ldd	[%l7 + 0x50],	%f14
	and	%o0,	0x0CAA,	%g4
	edge32	%g5,	%i5,	%i2
	ldd	[%l7 + 0x28],	%f20
	fmovda	%icc,	%f28,	%f15
	movrgez	%l0,	%i4,	%i1
	sth	%o7,	[%l7 + 0x66]
	movl	%icc,	%l3,	%o6
	fnegd	%f20,	%f8
	movg	%xcc,	%l5,	%g2
	stb	%o3,	[%l7 + 0x26]
	edge16	%g7,	%o1,	%i6
	fcmple32	%f12,	%f20,	%o5
	fpadd32s	%f23,	%f28,	%f16
	andn	%l1,	0x139A,	%g3
	sra	%g6,	%o4,	%l2
	movcc	%xcc,	%i3,	%i0
	fmovdcs	%icc,	%f6,	%f28
	ldsh	[%l7 + 0x2E],	%l6
	movle	%icc,	%o2,	%i7
	movn	%xcc,	%l4,	%g1
	movvs	%icc,	%g4,	%g5
	movrgz	%o0,	0x009,	%i2
	movrne	%i5,	%i4,	%l0
	xorcc	%o7,	%i1,	%l3
	edge8n	%l5,	%o6,	%o3
	sethi	0x14B1,	%g2
	udivcc	%o1,	0x18B1,	%g7
	mulx	%o5,	0x001A,	%l1
	movleu	%xcc,	%g3,	%i6
	movle	%xcc,	%o4,	%l2
	fpsub16	%f30,	%f18,	%f26
	andcc	%i3,	%i0,	%l6
	subc	%o2,	0x020F,	%i7
	movcc	%icc,	%l4,	%g1
	andcc	%g6,	%g5,	%g4
	xnor	%i2,	0x0096,	%i5
	edge32l	%i4,	%l0,	%o0
	fmovdl	%xcc,	%f2,	%f12
	std	%f28,	[%l7 + 0x58]
	movle	%xcc,	%i1,	%l3
	stb	%l5,	[%l7 + 0x42]
	array8	%o6,	%o3,	%g2
	array32	%o7,	%o1,	%o5
	alignaddrl	%g7,	%g3,	%l1
	array32	%o4,	%l2,	%i6
	sth	%i0,	[%l7 + 0x58]
	sethi	0x0439,	%i3
	srax	%o2,	%i7,	%l6
	fcmpeq32	%f2,	%f30,	%l4
	sethi	0x1851,	%g1
	xnorcc	%g6,	0x163F,	%g5
	ldsh	[%l7 + 0x22],	%i2
	fmovscs	%xcc,	%f27,	%f7
	popc	%i5,	%g4
	edge16ln	%l0,	%o0,	%i4
	fmovrdlz	%l3,	%f20,	%f2
	sth	%l5,	[%l7 + 0x0A]
	pdist	%f2,	%f30,	%f26
	edge8l	%o6,	%i1,	%g2
	and	%o7,	%o3,	%o1
	mulx	%g7,	0x18E8,	%o5
	subc	%l1,	0x0F77,	%g3
	movrne	%o4,	%i6,	%l2
	sllx	%i0,	0x17,	%i3
	restore %o2, 0x1175, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l6,	%f16,	%f30
	sdivx	%l4,	0x05E0,	%g6
	std	%f28,	[%l7 + 0x70]
	and	%g1,	0x1495,	%i2
	sll	%i5,	0x0F,	%g5
	movrgez	%l0,	%o0,	%g4
	edge8ln	%l3,	%i4,	%l5
	mova	%icc,	%o6,	%i1
	fmovda	%icc,	%f23,	%f14
	movpos	%xcc,	%g2,	%o3
	umul	%o7,	0x17B3,	%g7
	srl	%o5,	%l1,	%o1
	nop
	set	0x28, %o1
	stw	%o4,	[%l7 + %o1]
	mova	%xcc,	%i6,	%l2
	edge8ln	%i0,	%i3,	%g3
	fnands	%f6,	%f22,	%f23
	sra	%o2,	0x1B,	%i7
	fmovdne	%xcc,	%f9,	%f24
	std	%f30,	[%l7 + 0x48]
	sethi	0x0DA6,	%l4
	nop
	set	0x10, %l2
	ldd	[%l7 + %l2],	%i6
	mulx	%g1,	0x0FFF,	%g6
	fsrc2s	%f23,	%f7
	ldsb	[%l7 + 0x50],	%i2
	faligndata	%f22,	%f14,	%f14
	sllx	%g5,	0x12,	%l0
	andcc	%i5,	%o0,	%l3
	fmovrslez	%i4,	%f19,	%f23
	sub	%l5,	%o6,	%g4
	edge32l	%g2,	%i1,	%o3
	ld	[%l7 + 0x7C],	%f20
	save %o7, 0x0F49, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f19,	%f6
	stb	%g7,	[%l7 + 0x35]
	movrlz	%o1,	%o4,	%l1
	fmovdl	%xcc,	%f7,	%f20
	movrgez	%l2,	%i6,	%i3
	mova	%xcc,	%g3,	%i0
	movcs	%icc,	%o2,	%l4
	movvs	%icc,	%i7,	%g1
	edge16l	%g6,	%i2,	%g5
	movge	%icc,	%l0,	%l6
	movrne	%o0,	%i5,	%l3
	fnors	%f13,	%f8,	%f2
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	andcc	%g2,	0x1FEE,	%o6
	edge16	%i1,	%o3,	%o7
	fmovdleu	%xcc,	%f15,	%f28
	and	%g7,	%o5,	%o1
	nop
	set	0x54, %l5
	lduh	[%l7 + %l5],	%o4
	mulx	%l1,	0x11AE,	%i6
	movcs	%icc,	%i3,	%g3
	array8	%l2,	%o2,	%l4
	movn	%icc,	%i7,	%i0
	movrlez	%g1,	0x0BD,	%i2
	fabsd	%f22,	%f28
	fmuld8sux16	%f30,	%f10,	%f30
	subc	%g5,	%l0,	%g6
	andn	%o0,	0x0AC4,	%l6
	ld	[%l7 + 0x40],	%f13
	ldub	[%l7 + 0x62],	%l3
	ld	[%l7 + 0x2C],	%f16
	edge8ln	%i5,	%l5,	%g4
	fmovdpos	%xcc,	%f22,	%f18
	smul	%i4,	0x1D40,	%o6
	fand	%f28,	%f8,	%f14
	edge16n	%i1,	%g2,	%o7
	ld	[%l7 + 0x7C],	%f24
	sir	0x04A3
	fandnot1s	%f24,	%f30,	%f7
	stb	%g7,	[%l7 + 0x3A]
	alignaddrl	%o5,	%o1,	%o4
	movge	%icc,	%l1,	%i6
	array16	%i3,	%o3,	%g3
	ldub	[%l7 + 0x46],	%o2
	fmovdvc	%icc,	%f15,	%f0
	movpos	%icc,	%l2,	%i7
	edge8l	%l4,	%i0,	%i2
	fnot1s	%f4,	%f13
	sir	0x0A5B
	andcc	%g1,	%l0,	%g6
	edge16	%o0,	%l6,	%g5
	andcc	%l3,	%l5,	%i5
	std	%f20,	[%l7 + 0x68]
	movcc	%icc,	%g4,	%o6
	edge16n	%i1,	%i4,	%g2
	sra	%g7,	%o5,	%o7
	lduw	[%l7 + 0x6C],	%o1
	fpadd16s	%f31,	%f25,	%f11
	stb	%l1,	[%l7 + 0x18]
	andncc	%o4,	%i6,	%i3
	movcs	%icc,	%o3,	%g3
	edge16n	%o2,	%i7,	%l2
	srl	%l4,	%i0,	%g1
	alignaddrl	%l0,	%i2,	%o0
	movcs	%icc,	%g6,	%l6
	movrlez	%g5,	0x3E7,	%l5
	and	%i5,	%l3,	%o6
	movg	%xcc,	%g4,	%i1
	sdivx	%i4,	0x0455,	%g7
	lduw	[%l7 + 0x48],	%g2
	ldsh	[%l7 + 0x1C],	%o5
	fzero	%f16
	save %o1, %o7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i6,	%l1,	%o3
	movrgez	%i3,	%o2,	%i7
	umulcc	%g3,	%l4,	%l2
	movre	%g1,	0x2AD,	%i0
	array8	%l0,	%o0,	%i2
	orn	%g6,	%l6,	%g5
	movrgez	%l5,	0x0C0,	%i5
	nop
	set	0x20, %l1
	sth	%o6,	[%l7 + %l1]
	udiv	%l3,	0x0A7F,	%i1
	sth	%i4,	[%l7 + 0x36]
	nop
	set	0x73, %l3
	stb	%g7,	[%l7 + %l3]
	add	%g4,	%g2,	%o5
	movle	%icc,	%o1,	%o4
	andn	%o7,	%l1,	%i6
	orncc	%i3,	%o2,	%i7
	mulx	%g3,	0x0475,	%l4
	movg	%xcc,	%o3,	%l2
	srax	%i0,	0x1C,	%l0
	andn	%g1,	%o0,	%g6
	movg	%icc,	%l6,	%g5
	fnors	%f4,	%f17,	%f21
	edge16n	%i2,	%l5,	%i5
	fpack16	%f16,	%f8
	fcmpeq32	%f26,	%f2,	%l3
	restore %i1, %i4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o6,	%g2,	%o5
	mova	%icc,	%o1,	%g4
	andncc	%o7,	%o4,	%i6
	stx	%l1,	[%l7 + 0x10]
	subc	%i3,	%o2,	%g3
	sdivcc	%l4,	0x1A2F,	%i7
	movvs	%xcc,	%o3,	%i0
	edge32	%l0,	%l2,	%o0
	mulscc	%g1,	%l6,	%g5
	fmovdn	%icc,	%f18,	%f29
	xorcc	%g6,	0x1CA1,	%i2
	array16	%l5,	%i5,	%l3
	andn	%i1,	0x1CDC,	%i4
	fmovd	%f18,	%f0
	movle	%icc,	%g7,	%o6
	addc	%o5,	%o1,	%g2
	xor	%o7,	0x1B92,	%o4
	addccc	%i6,	0x08B0,	%g4
	srlx	%l1,	%i3,	%g3
	bshuffle	%f22,	%f16,	%f2
	edge32l	%l4,	%i7,	%o3
	edge8l	%o2,	%l0,	%i0
	movle	%icc,	%o0,	%l2
	orcc	%g1,	%g5,	%g6
	andn	%i2,	0x043A,	%l5
	and	%i5,	0x1BA4,	%l6
	xorcc	%l3,	%i1,	%i4
	mova	%xcc,	%g7,	%o5
	ld	[%l7 + 0x40],	%f8
	andncc	%o6,	%g2,	%o7
	alignaddrl	%o1,	%o4,	%g4
	movrne	%i6,	%l1,	%g3
	fmovrdne	%l4,	%f2,	%f16
	fpack16	%f20,	%f2
	fones	%f4
	ldd	[%l7 + 0x30],	%f10
	sll	%i3,	0x12,	%o3
	orncc	%i7,	%o2,	%i0
	std	%f24,	[%l7 + 0x10]
	ldd	[%l7 + 0x20],	%l0
	sdivcc	%l2,	0x163C,	%o0
	ldsw	[%l7 + 0x2C],	%g1
	or	%g5,	0x077B,	%g6
	addccc	%i2,	0x0335,	%l5
	std	%f26,	[%l7 + 0x50]
	fmovdvc	%xcc,	%f15,	%f28
	fmovsvc	%xcc,	%f11,	%f3
	fpadd32	%f14,	%f18,	%f22
	subc	%i5,	0x0022,	%l6
	fmovscs	%icc,	%f20,	%f8
	addcc	%l3,	0x1351,	%i4
	fmovsneg	%xcc,	%f21,	%f5
	movl	%xcc,	%i1,	%o5
	stb	%o6,	[%l7 + 0x29]
	xorcc	%g7,	%o7,	%o1
	sdivcc	%g2,	0x134B,	%o4
	alignaddr	%g4,	%l1,	%g3
	xnor	%i6,	0x0FFB,	%i3
	movrlz	%l4,	%o3,	%o2
	sllx	%i0,	0x01,	%i7
	edge16n	%l2,	%o0,	%l0
	xorcc	%g5,	%g6,	%i2
	fmovsleu	%icc,	%f30,	%f20
	edge8l	%g1,	%l5,	%i5
	sir	0x0111
	movne	%icc,	%l3,	%l6
	fcmple16	%f0,	%f4,	%i1
	fabss	%f22,	%f20
	andncc	%o5,	%o6,	%i4
	sub	%g7,	0x1544,	%o7
	fmovdneg	%xcc,	%f24,	%f23
	subccc	%g2,	0x1A55,	%o4
	xnorcc	%o1,	0x123F,	%g4
	nop
	set	0x49, %g1
	ldub	[%l7 + %g1],	%l1
	sethi	0x0DAB,	%i6
	fmovdn	%xcc,	%f9,	%f11
	subcc	%g3,	0x0A07,	%i3
	movleu	%icc,	%o3,	%o2
	for	%f22,	%f10,	%f14
	andcc	%l4,	%i0,	%i7
	fpsub32	%f16,	%f18,	%f0
	fcmpne32	%f20,	%f14,	%o0
	smulcc	%l0,	0x0A90,	%g5
	subcc	%g6,	%l2,	%g1
	orn	%i2,	0x1370,	%i5
	fcmpgt32	%f16,	%f16,	%l5
	fsrc1	%f26,	%f26
	sir	0x01F6
	fcmpes	%fcc1,	%f21,	%f24
	addcc	%l3,	0x04AA,	%i1
	fmovdge	%icc,	%f11,	%f26
	add	%l6,	0x12F2,	%o5
	fmul8x16au	%f12,	%f26,	%f16
	movvc	%xcc,	%i4,	%o6
	addcc	%g7,	%o7,	%o4
	ldd	[%l7 + 0x40],	%f16
	fornot2	%f14,	%f4,	%f30
	array16	%o1,	%g2,	%l1
	ldsh	[%l7 + 0x60],	%i6
	and	%g3,	0x18DA,	%g4
	ld	[%l7 + 0x2C],	%f26
	sdivcc	%o3,	0x04BA,	%o2
	edge32l	%l4,	%i0,	%i7
	srax	%o0,	%i3,	%g5
	fpmerge	%f4,	%f23,	%f30
	ldd	[%l7 + 0x78],	%g6
	ldx	[%l7 + 0x10],	%l0
	array16	%g1,	%l2,	%i2
	subcc	%i5,	%l5,	%l3
	andncc	%l6,	%i1,	%o5
	fandnot2s	%f25,	%f22,	%f22
	add	%i4,	0x1AAA,	%o6
	edge16n	%g7,	%o4,	%o1
	fsrc1	%f2,	%f30
	xnorcc	%g2,	0x160B,	%l1
	movneg	%icc,	%i6,	%g3
	edge16l	%o7,	%o3,	%o2
	addc	%g4,	%l4,	%i7
	subc	%o0,	0x0731,	%i3
	edge16ln	%g5,	%i0,	%l0
	fnands	%f25,	%f7,	%f24
	fpsub16	%f30,	%f12,	%f8
	mulscc	%g1,	0x13FA,	%g6
	array32	%i2,	%l2,	%l5
	mulx	%i5,	0x0C83,	%l3
	movneg	%icc,	%i1,	%o5
	ld	[%l7 + 0x70],	%f13
	sdiv	%l6,	0x1B80,	%o6
	edge32	%i4,	%g7,	%o1
	fcmpd	%fcc1,	%f8,	%f18
	srax	%g2,	0x11,	%o4
	mova	%xcc,	%i6,	%l1
	fzeros	%f9
	fmovrdlz	%g3,	%f28,	%f26
	edge32ln	%o7,	%o2,	%g4
	edge8n	%l4,	%i7,	%o3
	movneg	%xcc,	%i3,	%o0
	udiv	%g5,	0x075E,	%i0
	edge8ln	%g1,	%l0,	%g6
	fornot1s	%f9,	%f26,	%f19
	fnot2s	%f17,	%f11
	movrlez	%l2,	%l5,	%i2
	andn	%i5,	%i1,	%o5
	array16	%l3,	%l6,	%i4
	sub	%g7,	0x0B57,	%o1
	fnot1s	%f12,	%f31
	movgu	%xcc,	%g2,	%o4
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%o6
	popc	0x1E55,	%l1
	fmovsgu	%icc,	%f7,	%f18
	fmovrsgz	%g3,	%f7,	%f15
	movg	%xcc,	%o7,	%o2
	ldx	[%l7 + 0x30],	%g4
	fandnot1s	%f21,	%f4,	%f15
	st	%f19,	[%l7 + 0x34]
	xnorcc	%l4,	%i6,	%o3
	fzero	%f2
	smulcc	%i7,	0x0662,	%i3
	orncc	%g5,	%i0,	%o0
	movvc	%xcc,	%l0,	%g1
	addcc	%l2,	%l5,	%i2
	movge	%xcc,	%g6,	%i1
	stb	%i5,	[%l7 + 0x57]
	fpsub32	%f0,	%f18,	%f8
	add	%l3,	%l6,	%i4
	movne	%xcc,	%o5,	%g7
	udivcc	%g2,	0x19AB,	%o1
	xnor	%o6,	0x19B9,	%o4
	fmovrse	%g3,	%f22,	%f23
	movleu	%xcc,	%l1,	%o7
	orcc	%g4,	0x1457,	%o2
	fcmple16	%f0,	%f26,	%i6
	stw	%o3,	[%l7 + 0x10]
	sth	%l4,	[%l7 + 0x4A]
	lduh	[%l7 + 0x4A],	%i3
	sir	0x0AE1
	fmovdle	%xcc,	%f8,	%f5
	movne	%icc,	%g5,	%i0
	sethi	0x0056,	%o0
	fmovda	%xcc,	%f11,	%f16
	fxnors	%f10,	%f10,	%f6
	mulx	%i7,	0x17BA,	%g1
	sethi	0x18B3,	%l0
	orncc	%l2,	%l5,	%g6
	subccc	%i1,	0x0D07,	%i2
	st	%f0,	[%l7 + 0x54]
	movvc	%icc,	%l3,	%i5
	movgu	%icc,	%l6,	%i4
	stb	%g7,	[%l7 + 0x42]
	sdivx	%o5,	0x074F,	%o1
	subccc	%g2,	%o4,	%o6
	edge16	%g3,	%o7,	%g4
	subccc	%l1,	0x1B90,	%o2
	movge	%icc,	%i6,	%o3
	alignaddrl	%i3,	%g5,	%i0
	fnands	%f31,	%f15,	%f14
	fornot2s	%f20,	%f16,	%f13
	add	%l4,	%i7,	%o0
	fsrc2	%f6,	%f8
	movrne	%g1,	%l0,	%l2
	movpos	%icc,	%g6,	%i1
	movrgez	%l5,	%l3,	%i2
	edge8l	%l6,	%i5,	%g7
	umulcc	%i4,	0x14F5,	%o1
	array8	%g2,	%o5,	%o6
	sdiv	%g3,	0x005C,	%o4
	fmovsg	%icc,	%f12,	%f7
	sth	%o7,	[%l7 + 0x28]
	umulcc	%l1,	%g4,	%o2
	fmovrdlz	%o3,	%f22,	%f20
	fsrc1	%f26,	%f28
	stw	%i3,	[%l7 + 0x20]
	sth	%i6,	[%l7 + 0x16]
	subcc	%g5,	0x000E,	%i0
	fcmpeq16	%f16,	%f14,	%l4
	fmovs	%f25,	%f1
	addcc	%o0,	0x0F57,	%g1
	array8	%l0,	%l2,	%i7
	movcs	%xcc,	%g6,	%i1
	movne	%xcc,	%l3,	%l5
	fpmerge	%f19,	%f30,	%f22
	fmovsne	%icc,	%f11,	%f7
	fzero	%f24
	fxor	%f28,	%f10,	%f10
	orcc	%i2,	0x1BD0,	%i5
	movg	%icc,	%l6,	%i4
	edge16n	%g7,	%g2,	%o1
	alignaddr	%o6,	%o5,	%g3
	orn	%o4,	0x1F9D,	%o7
	mulscc	%l1,	%g4,	%o2
	udivcc	%i3,	0x05CE,	%o3
	nop
	set	0x10, %l0
	ldsh	[%l7 + %l0],	%i6
	sth	%i0,	[%l7 + 0x6C]
	edge16n	%l4,	%g5,	%g1
	udiv	%o0,	0x0CEF,	%l2
	edge32n	%i7,	%l0,	%g6
	orcc	%i1,	%l5,	%i2
	andn	%i5,	0x1C31,	%l6
	subc	%l3,	%g7,	%i4
	alignaddrl	%o1,	%g2,	%o6
	umulcc	%o5,	0x1725,	%o4
	movle	%xcc,	%g3,	%o7
	mulscc	%g4,	0x1F7F,	%l1
	fsrc1	%f28,	%f30
	mulscc	%i3,	%o2,	%i6
	mova	%icc,	%i0,	%l4
	sdiv	%g5,	0x195E,	%g1
	movvc	%icc,	%o0,	%o3
	or	%l2,	%i7,	%l0
	movvs	%icc,	%i1,	%g6
	movl	%xcc,	%i2,	%l5
	fmovsleu	%icc,	%f1,	%f26
	fmovscc	%xcc,	%f12,	%f0
	movcc	%icc,	%l6,	%i5
	mova	%icc,	%l3,	%g7
	smulcc	%i4,	0x0D4F,	%g2
	subc	%o1,	0x1FEE,	%o6
	ldsw	[%l7 + 0x1C],	%o5
	lduh	[%l7 + 0x74],	%g3
	umulcc	%o4,	0x1060,	%g4
	sdivx	%l1,	0x1335,	%o7
	udivx	%o2,	0x019B,	%i6
	st	%f15,	[%l7 + 0x14]
	orn	%i3,	0x056A,	%i0
	sra	%l4,	0x09,	%g1
	move	%xcc,	%o0,	%g5
	movleu	%xcc,	%l2,	%o3
	fornot1s	%f26,	%f1,	%f30
	addccc	%i7,	0x0E1D,	%l0
	mulscc	%i1,	%i2,	%g6
	srax	%l5,	0x1B,	%l6
	orncc	%l3,	0x0616,	%i5
	umul	%i4,	%g2,	%g7
	udivcc	%o1,	0x06F8,	%o6
	edge8	%g3,	%o5,	%g4
	sllx	%l1,	0x1A,	%o7
	fpsub32	%f6,	%f26,	%f2
	edge32	%o2,	%i6,	%o4
	alignaddrl	%i0,	%i3,	%l4
	mulx	%o0,	%g5,	%g1
	fnors	%f3,	%f29,	%f1
	fmuld8ulx16	%f6,	%f20,	%f12
	umul	%l2,	%i7,	%l0
	fcmpeq16	%f24,	%f4,	%o3
	xorcc	%i1,	0x074D,	%g6
	siam	0x0
	subcc	%i2,	0x0BA6,	%l5
	fabsd	%f14,	%f22
	movgu	%xcc,	%l3,	%l6
	edge8	%i5,	%g2,	%i4
	movcc	%xcc,	%o1,	%g7
	edge16ln	%g3,	%o5,	%o6
	sth	%l1,	[%l7 + 0x30]
	movrgez	%o7,	0x006,	%g4
	sir	0x0A46
	fpadd32	%f4,	%f0,	%f28
	xnor	%i6,	%o4,	%i0
	sdivcc	%i3,	0x073F,	%o2
	fmovdcc	%xcc,	%f21,	%f2
	and	%o0,	%l4,	%g1
	edge32l	%l2,	%g5,	%l0
	movrgez	%o3,	%i1,	%i7
	orn	%g6,	0x0A2B,	%l5
	fcmpeq16	%f28,	%f28,	%l3
	edge16ln	%l6,	%i5,	%g2
	sdiv	%i2,	0x06E4,	%i4
	umulcc	%o1,	0x1D94,	%g3
	orn	%o5,	%g7,	%l1
	sethi	0x1722,	%o6
	sra	%o7,	0x06,	%i6
	fcmpgt16	%f4,	%f12,	%g4
	orncc	%i0,	0x0C63,	%o4
	edge32n	%o2,	%i3,	%o0
	mulx	%l4,	0x0B69,	%l2
	mulx	%g5,	0x0B8B,	%l0
	edge16ln	%o3,	%i1,	%i7
	popc	%g1,	%l5
	fmovrslz	%l3,	%f6,	%f15
	addc	%l6,	%i5,	%g6
	array8	%i2,	%i4,	%g2
	edge8ln	%o1,	%o5,	%g3
	alignaddr	%l1,	%g7,	%o7
	movleu	%icc,	%i6,	%o6
	addcc	%i0,	%g4,	%o2
	movle	%icc,	%o4,	%o0
	fmovsneg	%xcc,	%f15,	%f23
	fmovrdne	%i3,	%f14,	%f0
	or	%l4,	%l2,	%g5
	save %o3, %l0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g1,	[%l7 + 0x38]
	subcc	%l5,	0x1928,	%i1
	subccc	%l3,	0x0613,	%i5
	sdiv	%l6,	0x1A54,	%i2
	movgu	%xcc,	%i4,	%g2
	fzero	%f2
	edge16l	%o1,	%g6,	%g3
	sllx	%l1,	%g7,	%o5
	fpack16	%f30,	%f26
	sth	%i6,	[%l7 + 0x5A]
	fmul8x16al	%f7,	%f19,	%f18
	fzeros	%f3
	udivx	%o6,	0x0BCC,	%i0
	addcc	%o7,	%o2,	%o4
	mulx	%g4,	0x0615,	%i3
	fmovsgu	%icc,	%f26,	%f24
	std	%f2,	[%l7 + 0x60]
	nop
	set	0x5C, %i4
	ldsw	[%l7 + %i4],	%l4
	fmovrdgez	%o0,	%f12,	%f4
	fones	%f29
	fnor	%f30,	%f16,	%f18
	fmovd	%f12,	%f30
	fcmpes	%fcc2,	%f0,	%f13
	popc	0x0BF9,	%l2
	orncc	%g5,	%l0,	%o3
	stw	%i7,	[%l7 + 0x20]
	sth	%g1,	[%l7 + 0x30]
	movge	%xcc,	%i1,	%l3
	edge32l	%l5,	%i5,	%l6
	ldsh	[%l7 + 0x1C],	%i2
	sir	0x10B2
	addcc	%g2,	0x0670,	%o1
	subcc	%g6,	%i4,	%l1
	udivcc	%g7,	0x0CD9,	%o5
	sub	%i6,	0x0239,	%g3
	add	%i0,	0x1B1E,	%o7
	movrgez	%o6,	%o2,	%g4
	sra	%o4,	0x0C,	%i3
	umulcc	%o0,	0x03D2,	%l2
	movvc	%icc,	%g5,	%l0
	fmovdg	%icc,	%f16,	%f28
	fpadd32s	%f23,	%f8,	%f23
	sllx	%l4,	0x08,	%o3
	ldub	[%l7 + 0x69],	%g1
	for	%f20,	%f24,	%f10
	fnegs	%f3,	%f28
	sra	%i1,	0x1E,	%i7
	movge	%xcc,	%l5,	%i5
	edge16	%l3,	%l6,	%i2
	popc	0x086B,	%o1
	andn	%g6,	0x0D0E,	%i4
	movge	%xcc,	%g2,	%l1
	sdivcc	%o5,	0x0CD9,	%g7
	fmovdcs	%icc,	%f16,	%f18
	addc	%g3,	%i0,	%o7
	subc	%o6,	0x1D20,	%o2
	std	%f8,	[%l7 + 0x10]
	ldsh	[%l7 + 0x18],	%i6
	fmovdcc	%xcc,	%f20,	%f23
	movleu	%icc,	%o4,	%g4
	fmovsge	%icc,	%f9,	%f6
	array32	%o0,	%i3,	%l2
	lduw	[%l7 + 0x68],	%l0
	siam	0x4
	srl	%l4,	0x0B,	%o3
	sllx	%g1,	%g5,	%i1
	subccc	%l5,	%i5,	%l3
	fmovdle	%xcc,	%f24,	%f5
	fmuld8ulx16	%f24,	%f27,	%f4
	sdivcc	%l6,	0x06CE,	%i7
	ldd	[%l7 + 0x68],	%f28
	fmovrde	%o1,	%f10,	%f0
	fmovrse	%i2,	%f8,	%f12
	stb	%i4,	[%l7 + 0x63]
	edge32l	%g2,	%g6,	%l1
	stb	%o5,	[%l7 + 0x32]
	or	%g3,	%g7,	%o7
	array16	%o6,	%o2,	%i0
	alignaddr	%o4,	%g4,	%i6
	edge16l	%i3,	%l2,	%o0
	umulcc	%l0,	%o3,	%l4
	fpadd16	%f16,	%f16,	%f24
	sth	%g1,	[%l7 + 0x26]
	sir	0x1A77
	ldsh	[%l7 + 0x62],	%g5
	fmovdn	%icc,	%f3,	%f10
	edge8n	%i1,	%l5,	%i5
	fcmps	%fcc2,	%f9,	%f7
	fpack32	%f10,	%f8,	%f22
	edge32l	%l6,	%l3,	%i7
	sdivx	%o1,	0x115E,	%i4
	xnorcc	%i2,	0x1F7D,	%g6
	mova	%xcc,	%l1,	%g2
	sll	%o5,	0x07,	%g7
	xnor	%g3,	0x1439,	%o6
	std	%f30,	[%l7 + 0x38]
	mova	%icc,	%o7,	%o2
	xorcc	%o4,	0x0C79,	%i0
	fmovrdlez	%g4,	%f6,	%f20
	srax	%i3,	0x12,	%i6
	fandnot2	%f4,	%f20,	%f24
	array16	%l2,	%o0,	%l0
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	array8	%o3,	%i1,	%i5
	movneg	%xcc,	%l6,	%l3
	movgu	%xcc,	%i7,	%l5
	fmovdleu	%xcc,	%f7,	%f20
	sth	%o1,	[%l7 + 0x4A]
	or	%i4,	0x0494,	%g6
	fmovdleu	%xcc,	%f17,	%f7
	movvs	%xcc,	%l1,	%i2
	array32	%o5,	%g7,	%g3
	fpadd32s	%f28,	%f28,	%f23
	fpack16	%f6,	%f24
	mulscc	%g2,	%o6,	%o2
	andncc	%o7,	%i0,	%g4
	edge16l	%o4,	%i6,	%l2
	fmovsvs	%xcc,	%f8,	%f6
	xnor	%o0,	%i3,	%l4
	sra	%l0,	0x01,	%g5
	movg	%xcc,	%o3,	%g1
	edge8	%i5,	%i1,	%l6
	mova	%icc,	%i7,	%l5
	fxors	%f26,	%f22,	%f28
	restore %l3, %o1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%xcc,	%f3,	%f25
	edge16ln	%l1,	%i2,	%i4
	movrgez	%o5,	0x017,	%g3
	edge16l	%g2,	%o6,	%g7
	xorcc	%o2,	%o7,	%i0
	edge8ln	%g4,	%o4,	%i6
	xnor	%o0,	0x08DE,	%i3
	fcmpes	%fcc1,	%f10,	%f1
	ldx	[%l7 + 0x70],	%l2
	fcmpes	%fcc0,	%f13,	%f8
	movcs	%icc,	%l0,	%g5
	movvs	%icc,	%o3,	%l4
	udivcc	%i5,	0x0C5B,	%g1
	movrgez	%l6,	0x201,	%i7
	fcmpgt32	%f0,	%f8,	%i1
	fmovdg	%xcc,	%f10,	%f29
	fmovsa	%icc,	%f25,	%f0
	st	%f14,	[%l7 + 0x74]
	sll	%l5,	%l3,	%g6
	alignaddrl	%l1,	%i2,	%i4
	fmovde	%icc,	%f16,	%f6
	array32	%o5,	%g3,	%o1
	edge16l	%g2,	%o6,	%o2
	popc	0x0609,	%o7
	edge8l	%i0,	%g7,	%o4
	srl	%i6,	%o0,	%i3
	movcs	%icc,	%g4,	%l0
	udiv	%g5,	0x0AB6,	%o3
	edge8n	%l4,	%i5,	%g1
	udivx	%l2,	0x155B,	%l6
	fnot1	%f24,	%f0
	movvc	%xcc,	%i1,	%i7
	and	%l5,	0x0F8E,	%l3
	fmovdge	%xcc,	%f24,	%f10
	sub	%l1,	0x0E6C,	%g6
	srax	%i2,	0x05,	%o5
	movg	%icc,	%g3,	%i4
	addc	%o1,	%g2,	%o6
	movvs	%icc,	%o7,	%o2
	fnot2s	%f16,	%f20
	xor	%i0,	%g7,	%o4
	mulx	%i6,	0x1FE8,	%o0
	xor	%g4,	0x0A39,	%i3
	fnors	%f21,	%f11,	%f28
	movrlez	%l0,	0x3A2,	%g5
	fxnor	%f2,	%f6,	%f2
	subccc	%o3,	%i5,	%g1
	stb	%l4,	[%l7 + 0x0A]
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	movrlez	%i7,	0x16B,	%l5
	movleu	%xcc,	%l3,	%g6
	lduh	[%l7 + 0x74],	%l1
	sub	%o5,	%i2,	%i4
	fcmpne16	%f26,	%f24,	%g3
	restore %g2, %o6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f0,	%f31
	fpack16	%f12,	%f1
	fcmple32	%f12,	%f20,	%o7
	sir	0x0769
	fmuld8sux16	%f27,	%f24,	%f4
	srax	%o2,	0x07,	%g7
	alignaddrl	%i0,	%i6,	%o0
	orn	%g4,	%o4,	%i3
	array8	%g5,	%o3,	%l0
	orn	%i5,	%g1,	%l4
	and	%i1,	%l6,	%l2
	siam	0x3
	fnands	%f15,	%f13,	%f14
	edge16l	%l5,	%i7,	%l3
	subc	%g6,	%o5,	%l1
	fmovdcc	%xcc,	%f23,	%f5
	fmovsge	%xcc,	%f4,	%f0
	movneg	%icc,	%i4,	%i2
	alignaddr	%g2,	%g3,	%o1
	fsrc1	%f18,	%f18
	umulcc	%o7,	%o6,	%o2
	fmovrsgz	%g7,	%f1,	%f20
	sir	0x0CCE
	movvs	%xcc,	%i6,	%o0
	sub	%g4,	0x05C6,	%o4
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%i0
	movle	%icc,	%i3,	%o3
	movcs	%xcc,	%l0,	%g5
	alignaddrl	%g1,	%l4,	%i5
	array8	%l6,	%i1,	%l2
	movl	%xcc,	%i7,	%l3
	fcmps	%fcc2,	%f28,	%f13
	mulx	%g6,	0x1AC2,	%l5
	udivx	%o5,	0x0C84,	%l1
	movneg	%xcc,	%i4,	%g2
	udivx	%i2,	0x0B56,	%o1
	movne	%xcc,	%o7,	%g3
	ldsw	[%l7 + 0x3C],	%o2
	addcc	%o6,	0x0811,	%g7
	sll	%o0,	%g4,	%o4
	sir	0x1DFF
	movrlz	%i6,	%i3,	%i0
	movleu	%icc,	%l0,	%o3
	andncc	%g5,	%l4,	%i5
	orncc	%g1,	%i1,	%l2
	edge8ln	%i7,	%l3,	%g6
	edge16ln	%l6,	%o5,	%l1
	xnor	%l5,	%g2,	%i2
	fcmpgt16	%f20,	%f10,	%o1
	movrlz	%o7,	%i4,	%g3
	edge16	%o6,	%g7,	%o0
	edge32ln	%g4,	%o4,	%i6
	ldsw	[%l7 + 0x3C],	%o2
	edge16	%i3,	%i0,	%o3
	nop
	set	0x30, %o3
	ldsw	[%l7 + %o3],	%l0
	fnegs	%f4,	%f12
	fmovdge	%icc,	%f2,	%f1
	ldsb	[%l7 + 0x56],	%l4
	move	%icc,	%g5,	%i5
	sth	%i1,	[%l7 + 0x36]
	st	%f11,	[%l7 + 0x4C]
	xnor	%l2,	0x0EA5,	%i7
	movl	%xcc,	%g1,	%l3
	fcmpes	%fcc0,	%f23,	%f3
	fcmpgt32	%f12,	%f10,	%l6
	srlx	%o5,	0x1C,	%l1
	ldsw	[%l7 + 0x40],	%g6
	xnorcc	%l5,	0x00B7,	%i2
	or	%g2,	%o7,	%i4
	std	%f28,	[%l7 + 0x10]
	subc	%g3,	%o1,	%g7
	movge	%icc,	%o0,	%g4
	subcc	%o4,	%i6,	%o6
	subccc	%i3,	%o2,	%o3
	mova	%icc,	%l0,	%i0
	andn	%l4,	%i5,	%g5
	movge	%xcc,	%i1,	%l2
	umul	%i7,	0x1E8F,	%g1
	edge16n	%l6,	%o5,	%l3
	fmovdle	%icc,	%f13,	%f1
	edge32	%l1,	%l5,	%i2
	movle	%xcc,	%g6,	%g2
	fmovsle	%icc,	%f4,	%f10
	sra	%i4,	0x1B,	%g3
	addc	%o1,	%g7,	%o0
	fnor	%f24,	%f4,	%f0
	movn	%xcc,	%g4,	%o4
	edge32	%i6,	%o6,	%i3
	fzeros	%f7
	fmovda	%icc,	%f5,	%f23
	edge32n	%o2,	%o3,	%l0
	fand	%f30,	%f2,	%f16
	lduh	[%l7 + 0x6A],	%o7
	movn	%xcc,	%i0,	%l4
	addc	%g5,	0x01B4,	%i5
	udiv	%l2,	0x1353,	%i7
	stw	%g1,	[%l7 + 0x68]
	movcs	%icc,	%l6,	%i1
	movn	%icc,	%o5,	%l3
	stx	%l1,	[%l7 + 0x60]
	move	%icc,	%l5,	%i2
	array32	%g2,	%g6,	%i4
	ldub	[%l7 + 0x20],	%o1
	stb	%g3,	[%l7 + 0x32]
	subc	%o0,	%g7,	%o4
	fsrc2	%f22,	%f14
	smulcc	%i6,	%o6,	%g4
	mulscc	%i3,	%o3,	%l0
	fandnot2	%f16,	%f18,	%f22
	fmovrsne	%o2,	%f23,	%f27
	alignaddr	%o7,	%i0,	%g5
	fcmpne32	%f0,	%f20,	%l4
	stb	%i5,	[%l7 + 0x74]
	mulscc	%i7,	0x03AC,	%l2
	fxnors	%f22,	%f21,	%f14
	mulx	%g1,	%i1,	%o5
	fmovrdlez	%l6,	%f20,	%f16
	srax	%l3,	0x1D,	%l5
	ldd	[%l7 + 0x50],	%i2
	subc	%l1,	%g2,	%i4
	addc	%g6,	0x0E0B,	%o1
	fmovscs	%icc,	%f24,	%f26
	xnorcc	%o0,	%g7,	%o4
	fmovdgu	%xcc,	%f26,	%f5
	array32	%g3,	%o6,	%g4
	movvc	%icc,	%i3,	%o3
	edge32l	%l0,	%o2,	%i6
	movgu	%icc,	%i0,	%o7
	ld	[%l7 + 0x50],	%f25
	std	%f2,	[%l7 + 0x60]
	edge8l	%l4,	%i5,	%i7
	movvs	%xcc,	%l2,	%g1
	movne	%xcc,	%g5,	%i1
	movgu	%xcc,	%l6,	%o5
	add	%l5,	0x188F,	%i2
	edge16l	%l3,	%g2,	%l1
	movneg	%icc,	%i4,	%g6
	srl	%o0,	%g7,	%o4
	mova	%icc,	%o1,	%g3
	movrgz	%g4,	%i3,	%o6
	movcs	%xcc,	%l0,	%o2
	fmovdpos	%xcc,	%f21,	%f27
	movvs	%icc,	%i6,	%i0
	and	%o3,	0x0D43,	%l4
	srl	%i5,	0x07,	%o7
	fmovsleu	%xcc,	%f5,	%f3
	sdiv	%l2,	0x1E62,	%i7
	ldsw	[%l7 + 0x40],	%g1
	std	%f30,	[%l7 + 0x08]
	sth	%g5,	[%l7 + 0x7A]
	sll	%l6,	%o5,	%l5
	fmovdcs	%icc,	%f14,	%f30
	edge8l	%i2,	%l3,	%i1
	ldsh	[%l7 + 0x46],	%g2
	fmovsgu	%icc,	%f7,	%f27
	stx	%l1,	[%l7 + 0x48]
	movpos	%xcc,	%g6,	%o0
	fmovda	%icc,	%f18,	%f23
	fornot1	%f26,	%f10,	%f14
	lduw	[%l7 + 0x64],	%g7
	addcc	%i4,	%o4,	%o1
	edge32	%g3,	%g4,	%i3
	fnand	%f2,	%f24,	%f28
	srlx	%l0,	0x1E,	%o2
	edge32n	%i6,	%o6,	%o3
	andncc	%i0,	%l4,	%o7
	addccc	%l2,	0x0F4A,	%i5
	movcc	%xcc,	%g1,	%g5
	movn	%icc,	%i7,	%o5
	xorcc	%l5,	%l6,	%i2
	stw	%l3,	[%l7 + 0x64]
	array32	%g2,	%l1,	%i1
	sll	%o0,	%g6,	%i4
	move	%xcc,	%g7,	%o1
	alignaddr	%o4,	%g4,	%i3
	array8	%g3,	%l0,	%i6
	movvs	%xcc,	%o2,	%o6
	ldub	[%l7 + 0x72],	%o3
	subc	%l4,	0x04A3,	%o7
	edge16l	%l2,	%i0,	%g1
	movge	%xcc,	%g5,	%i7
	edge16l	%i5,	%o5,	%l5
	fmovrdlz	%l6,	%f30,	%f8
	alignaddr	%l3,	%i2,	%g2
	mulscc	%l1,	%i1,	%g6
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	orncc	%o4,	%g4,	%i3
	edge16	%o1,	%g3,	%l0
	edge16l	%o2,	%i6,	%o6
	fandnot2	%f10,	%f10,	%f16
	sra	%l4,	0x0D,	%o7
	st	%f18,	[%l7 + 0x48]
	nop
	set	0x60, %o2
	stx	%l2,	[%l7 + %o2]
	nop
	set	0x30, %g2
	ldx	[%l7 + %g2],	%i0
	subc	%g1,	0x08EC,	%g5
	edge16l	%o3,	%i7,	%o5
	addcc	%l5,	%i5,	%l3
	udivcc	%l6,	0x0461,	%i2
	movneg	%icc,	%g2,	%i1
	fmovsneg	%xcc,	%f19,	%f1
	fmovsg	%icc,	%f21,	%f22
	st	%f13,	[%l7 + 0x08]
	movpos	%icc,	%l1,	%g6
	xor	%i4,	0x0233,	%o0
	srax	%o4,	0x09,	%g4
	orn	%i3,	%g7,	%o1
	fxnors	%f29,	%f1,	%f4
	ldx	[%l7 + 0x70],	%g3
	alignaddr	%o2,	%l0,	%o6
	fmovrdlez	%l4,	%f8,	%f24
	umul	%o7,	%l2,	%i6
	movleu	%xcc,	%i0,	%g1
	fmovdneg	%icc,	%f24,	%f10
	subc	%o3,	0x0BDB,	%g5
	movneg	%icc,	%i7,	%l5
	fornot2s	%f16,	%f7,	%f16
	edge32l	%i5,	%o5,	%l3
	fmovsl	%xcc,	%f7,	%f10
	xorcc	%l6,	%g2,	%i2
	fmovsg	%xcc,	%f11,	%f13
	fpack16	%f26,	%f6
	and	%i1,	0x1913,	%g6
	save %l1, 0x1384, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i4,	%g4,	%o4
	ldx	[%l7 + 0x58],	%i3
	ldsw	[%l7 + 0x40],	%o1
	edge32l	%g3,	%o2,	%l0
	xnor	%g7,	0x0C71,	%l4
	edge8l	%o7,	%o6,	%i6
	fxor	%f10,	%f8,	%f20
	fsrc1	%f18,	%f0
	fabsd	%f2,	%f24
	subccc	%l2,	0x0A69,	%i0
	popc	%g1,	%g5
	srlx	%i7,	0x1C,	%l5
	fnot2	%f28,	%f14
	edge8	%i5,	%o3,	%l3
	edge8	%l6,	%g2,	%o5
	stw	%i2,	[%l7 + 0x44]
	movne	%icc,	%i1,	%l1
	stb	%g6,	[%l7 + 0x73]
	sra	%i4,	%o0,	%g4
	movgu	%icc,	%i3,	%o1
	fone	%f10
	nop
	set	0x5C, %l4
	ldsw	[%l7 + %l4],	%g3
	fpadd32	%f28,	%f2,	%f8
	edge16	%o2,	%o4,	%g7
	movrlez	%l0,	%o7,	%o6
	sth	%l4,	[%l7 + 0x5E]
	ldx	[%l7 + 0x50],	%i6
	array16	%i0,	%g1,	%g5
	subccc	%l2,	0x067B,	%i7
	fpmerge	%f6,	%f14,	%f8
	array8	%l5,	%o3,	%i5
	stb	%l6,	[%l7 + 0x14]
	addc	%g2,	%l3,	%i2
	sth	%o5,	[%l7 + 0x3E]
	movrlz	%i1,	%l1,	%g6
	movg	%icc,	%i4,	%g4
	movleu	%icc,	%o0,	%i3
	umulcc	%o1,	%o2,	%o4
	fmovde	%xcc,	%f11,	%f23
	movleu	%icc,	%g7,	%g3
	mulx	%o7,	0x18D6,	%o6
	movgu	%icc,	%l0,	%i6
	fpadd16s	%f29,	%f11,	%f18
	and	%l4,	%g1,	%g5
	movrlz	%l2,	0x2D1,	%i7
	add	%i0,	0x1C62,	%l5
	orn	%o3,	%i5,	%l6
	sllx	%g2,	%i2,	%o5
	andcc	%l3,	0x0786,	%i1
	array32	%l1,	%i4,	%g4
	orcc	%g6,	%i3,	%o0
	add	%o1,	0x0FC5,	%o2
	fmovsvc	%icc,	%f11,	%f12
	alignaddrl	%g7,	%o4,	%g3
	fmovrslz	%o6,	%f18,	%f1
	xnorcc	%o7,	%i6,	%l4
	fnors	%f10,	%f4,	%f8
	xnor	%l0,	0x0BC7,	%g1
	fxnors	%f17,	%f17,	%f11
	srlx	%l2,	0x16,	%i7
	array16	%g5,	%l5,	%o3
	fpmerge	%f19,	%f16,	%f24
	fmovsneg	%xcc,	%f18,	%f14
	edge8n	%i0,	%i5,	%l6
	xnor	%g2,	0x04D5,	%o5
	movpos	%icc,	%i2,	%l3
	fmovrsne	%l1,	%f23,	%f21
	edge16	%i4,	%i1,	%g4
	ldd	[%l7 + 0x70],	%g6
	ldd	[%l7 + 0x68],	%i2
	stb	%o1,	[%l7 + 0x09]
	ld	[%l7 + 0x24],	%f10
	smulcc	%o2,	%g7,	%o4
	sllx	%o0,	%g3,	%o7
	movrlz	%o6,	0x033,	%i6
	ld	[%l7 + 0x70],	%f22
	ld	[%l7 + 0x14],	%f29
	srl	%l0,	0x08,	%l4
	orn	%l2,	%i7,	%g5
	std	%f22,	[%l7 + 0x50]
	fpsub32	%f26,	%f14,	%f8
	faligndata	%f16,	%f20,	%f18
	subc	%l5,	0x0FF3,	%o3
	array16	%g1,	%i5,	%l6
	fornot2	%f8,	%f10,	%f18
	srax	%g2,	0x0E,	%o5
	xnor	%i0,	%i2,	%l3
	restore %l1, %i4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g6,	%g4,	%o1
	and	%i3,	0x1341,	%o2
	smulcc	%o4,	0x0A18,	%g7
	alignaddrl	%o0,	%o7,	%o6
	fmovrsgez	%i6,	%f31,	%f26
	fnor	%f10,	%f16,	%f2
	stx	%g3,	[%l7 + 0x68]
	xorcc	%l4,	%l2,	%i7
	subcc	%g5,	0x1D6D,	%l5
	xorcc	%l0,	0x1D94,	%o3
	fxnor	%f28,	%f4,	%f10
	andcc	%i5,	0x03F6,	%l6
	array16	%g1,	%o5,	%g2
	movvc	%xcc,	%i2,	%l3
	move	%icc,	%i0,	%i4
	ldx	[%l7 + 0x58],	%l1
	fmovrdlez	%i1,	%f22,	%f10
	movre	%g4,	%g6,	%o1
	fcmpes	%fcc2,	%f10,	%f23
	fxors	%f30,	%f31,	%f6
	stb	%i3,	[%l7 + 0x0E]
	movre	%o2,	0x11F,	%g7
	edge8	%o4,	%o0,	%o7
	stx	%i6,	[%l7 + 0x28]
	sethi	0x0D6D,	%o6
	ldsh	[%l7 + 0x14],	%g3
	sdivx	%l2,	0x1315,	%i7
	umul	%l4,	%l5,	%l0
	movgu	%icc,	%g5,	%o3
	sdivx	%i5,	0x137A,	%l6
	addc	%g1,	0x0BFB,	%o5
	sll	%i2,	0x08,	%l3
	ldsh	[%l7 + 0x4C],	%g2
	movn	%xcc,	%i0,	%l1
	ldub	[%l7 + 0x78],	%i1
	fcmple16	%f20,	%f16,	%g4
	mulscc	%i4,	%o1,	%i3
	lduh	[%l7 + 0x7C],	%o2
	movrne	%g6,	0x2E3,	%g7
	movgu	%xcc,	%o4,	%o0
	ldub	[%l7 + 0x44],	%o7
	fsrc2	%f0,	%f8
	edge16ln	%o6,	%g3,	%i6
	fnands	%f21,	%f23,	%f25
	srlx	%i7,	0x16,	%l4
	xnor	%l2,	0x127B,	%l0
	fpadd32	%f24,	%f0,	%f18
	popc	%l5,	%g5
	save %i5, 0x0595, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o3,	0x1345,	%o5
	fnors	%f16,	%f23,	%f6
	and	%i2,	%g1,	%l3
	sdivx	%i0,	0x05A9,	%l1
	andncc	%i1,	%g2,	%g4
	xnorcc	%o1,	%i3,	%i4
	xor	%o2,	%g6,	%g7
	fpadd16s	%f13,	%f28,	%f7
	fmovrdgz	%o4,	%f20,	%f0
	fxnors	%f29,	%f24,	%f16
	fnors	%f28,	%f14,	%f6
	fcmpd	%fcc0,	%f18,	%f6
	edge32	%o7,	%o6,	%o0
	fmovdgu	%icc,	%f2,	%f5
	ldx	[%l7 + 0x60],	%g3
	srax	%i7,	%l4,	%i6
	fpmerge	%f8,	%f17,	%f20
	fmovdg	%xcc,	%f18,	%f5
	edge32ln	%l0,	%l2,	%l5
	orn	%i5,	0x0955,	%g5
	orn	%o3,	0x1C84,	%l6
	fmovdg	%xcc,	%f20,	%f22
	movle	%xcc,	%o5,	%g1
	alignaddr	%l3,	%i2,	%i0
	fmovsneg	%xcc,	%f7,	%f9
	ldx	[%l7 + 0x70],	%l1
	fzeros	%f25
	array16	%i1,	%g4,	%o1
	sir	0x1D36
	movge	%icc,	%i3,	%i4
	movcs	%xcc,	%o2,	%g6
	fpadd16	%f4,	%f8,	%f12
	movrne	%g7,	%o4,	%o7
	fcmpgt32	%f6,	%f22,	%g2
	fmovrdlez	%o6,	%f12,	%f2
	mulx	%g3,	%o0,	%i7
	edge8	%l4,	%l0,	%l2
	array32	%l5,	%i5,	%i6
	addc	%g5,	%o3,	%l6
	movrlez	%o5,	0x2AB,	%l3
	srlx	%g1,	0x02,	%i0
	orncc	%i2,	0x0210,	%l1
	movre	%g4,	%o1,	%i3
	fpadd32	%f22,	%f6,	%f26
	edge32l	%i1,	%i4,	%o2
	subccc	%g6,	%o4,	%g7
	sllx	%g2,	0x10,	%o6
	srax	%o7,	0x02,	%g3
	stx	%o0,	[%l7 + 0x38]
	addcc	%i7,	%l0,	%l2
	mulscc	%l4,	0x0EDD,	%l5
	movre	%i5,	0x003,	%g5
	sethi	0x05F9,	%o3
	movrgez	%l6,	%i6,	%o5
	nop
	set	0x08, %g3
	stw	%l3,	[%l7 + %g3]
	movle	%xcc,	%i0,	%i2
	edge16l	%l1,	%g1,	%g4
	movl	%icc,	%i3,	%i1
	movneg	%xcc,	%i4,	%o1
	fmovdn	%xcc,	%f4,	%f30
	edge8l	%o2,	%g6,	%g7
	addcc	%o4,	0x1CAE,	%g2
	subccc	%o7,	%g3,	%o0
	movpos	%xcc,	%o6,	%l0
	srax	%i7,	%l2,	%l4
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	umulcc	%i5,	0x0D6E,	%o3
	movrlez	%i6,	%l6,	%o5
	edge32l	%l3,	%i2,	%i0
	fmovrslz	%g1,	%f13,	%f14
	move	%icc,	%g4,	%i3
	stw	%i1,	[%l7 + 0x20]
	edge16ln	%l1,	%o1,	%i4
	array32	%o2,	%g6,	%g7
	andncc	%g2,	%o7,	%o4
	smul	%g3,	%o0,	%o6
	movge	%icc,	%l0,	%l2
	fpadd16s	%f16,	%f10,	%f22
	sethi	0x0D6A,	%l4
	fsrc1	%f20,	%f4
	addccc	%l5,	%g5,	%i5
	lduh	[%l7 + 0x22],	%o3
	andncc	%i6,	%i7,	%l6
	sllx	%o5,	0x13,	%l3
	movrlez	%i2,	%i0,	%g1
	sdivx	%g4,	0x10BA,	%i1
	mova	%xcc,	%i3,	%o1
	sll	%l1,	%o2,	%g6
	subc	%i4,	0x1EC2,	%g2
	edge16ln	%o7,	%g7,	%o4
	array8	%g3,	%o6,	%l0
	orcc	%o0,	0x1AB8,	%l2
	fmuld8sux16	%f6,	%f29,	%f10
	ldx	[%l7 + 0x58],	%l5
	fnot1s	%f5,	%f2
	sdiv	%l4,	0x0F9B,	%i5
	udiv	%g5,	0x0549,	%i6
	nop
	set	0x28, %o4
	ldd	[%l7 + %o4],	%o2
	sth	%i7,	[%l7 + 0x6A]
	sir	0x12D4
	save %o5, 0x0E7D, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i2,	0x0E28,	%l3
	movl	%xcc,	%i0,	%g4
	fmovrsgz	%i1,	%f20,	%f28
	movrgz	%i3,	0x1A6,	%g1
	ldd	[%l7 + 0x58],	%f14
	edge16	%o1,	%o2,	%g6
	mova	%icc,	%i4,	%g2
	pdist	%f8,	%f12,	%f16
	movg	%xcc,	%l1,	%o7
	fnands	%f26,	%f23,	%f22
	fnor	%f2,	%f0,	%f4
	srax	%g7,	0x0B,	%g3
	movcc	%xcc,	%o6,	%l0
	movge	%xcc,	%o0,	%o4
	array8	%l5,	%l4,	%i5
	add	%g5,	%l2,	%o3
	fmovde	%icc,	%f30,	%f12
	udivx	%i6,	0x08AC,	%i7
	stw	%l6,	[%l7 + 0x3C]
	stx	%o5,	[%l7 + 0x10]
	edge32l	%l3,	%i2,	%i0
	move	%xcc,	%i1,	%g4
	subcc	%i3,	0x0A69,	%o1
	alignaddrl	%g1,	%o2,	%g6
	ldub	[%l7 + 0x34],	%g2
	edge32ln	%i4,	%l1,	%g7
	fmovsneg	%xcc,	%f29,	%f3
	edge16	%o7,	%o6,	%g3
	movrlz	%o0,	0x2B7,	%l0
	fmovdpos	%icc,	%f30,	%f20
	srax	%l5,	%l4,	%o4
	edge8n	%g5,	%i5,	%o3
	sub	%i6,	0x1618,	%i7
	addc	%l6,	0x0099,	%o5
	udivcc	%l2,	0x0435,	%l3
	ldsw	[%l7 + 0x54],	%i2
	subccc	%i0,	0x16AB,	%i1
	ld	[%l7 + 0x18],	%f23
	addccc	%g4,	0x1279,	%i3
	sethi	0x13FA,	%o1
	movn	%xcc,	%g1,	%o2
	fmovsl	%xcc,	%f11,	%f15
	udivx	%g2,	0x018C,	%g6
	fpmerge	%f11,	%f18,	%f2
	sra	%l1,	0x06,	%g7
	movrlez	%i4,	%o7,	%g3
	fmul8sux16	%f2,	%f2,	%f26
	edge8n	%o6,	%o0,	%l0
	andcc	%l4,	0x1F9D,	%o4
	fmovdne	%icc,	%f6,	%f9
	addc	%l5,	%g5,	%o3
	andn	%i6,	%i7,	%i5
	sth	%l6,	[%l7 + 0x0A]
	udiv	%l2,	0x0BBD,	%o5
	movl	%xcc,	%i2,	%i0
	edge32ln	%l3,	%i1,	%g4
	save %i3, 0x1544, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o1,	0x269,	%g2
	fnegs	%f30,	%f2
	stb	%g6,	[%l7 + 0x6E]
	fpsub16s	%f9,	%f19,	%f15
	movne	%xcc,	%l1,	%g7
	fcmpeq16	%f4,	%f26,	%o2
	xor	%i4,	%o7,	%g3
	nop
	set	0x2A, %i0
	ldsh	[%l7 + %i0],	%o0
	srlx	%l0,	0x06,	%l4
	std	%f10,	[%l7 + 0x68]
	fcmpeq16	%f12,	%f16,	%o4
	movl	%icc,	%o6,	%l5
	sllx	%g5,	0x0A,	%i6
	alignaddrl	%i7,	%o3,	%l6
	fmul8ulx16	%f8,	%f24,	%f6
	stx	%l2,	[%l7 + 0x68]
	fpadd32s	%f26,	%f26,	%f0
	movl	%xcc,	%i5,	%i2
	udiv	%o5,	0x04BF,	%i0
	edge32ln	%l3,	%i1,	%g4
	mulx	%i3,	0x091A,	%g1
	addccc	%g2,	%o1,	%g6
	sub	%g7,	0x10D0,	%l1
	nop
	set	0x30, %o7
	lduh	[%l7 + %o7],	%i4
	lduw	[%l7 + 0x70],	%o2
	sra	%o7,	0x1C,	%o0
	restore %l0, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o6,	%l5,	%g5
	xorcc	%i6,	0x1C40,	%o4
	smulcc	%o3,	0x1ECB,	%l6
	sll	%i7,	%l2,	%i5
	edge16	%i2,	%i0,	%l3
	movcs	%xcc,	%i1,	%o5
	andn	%i3,	0x1B12,	%g1
	andcc	%g4,	%o1,	%g6
	fmovrde	%g7,	%f6,	%f0
	xor	%g2,	0x1122,	%i4
	fmovdcs	%icc,	%f2,	%f8
	xorcc	%o2,	0x0184,	%l1
	bshuffle	%f24,	%f0,	%f8
	movl	%icc,	%o0,	%o7
	umulcc	%g3,	%l4,	%o6
	edge16	%l5,	%l0,	%g5
	udivcc	%o4,	0x0DB6,	%i6
	sllx	%l6,	%o3,	%l2
	fmovdn	%xcc,	%f3,	%f24
	movrgz	%i5,	0x2B1,	%i7
	movpos	%icc,	%i0,	%l3
	orcc	%i1,	%o5,	%i3
	movneg	%xcc,	%i2,	%g4
	edge8l	%g1,	%g6,	%o1
	alignaddr	%g2,	%i4,	%g7
	movre	%o2,	%l1,	%o0
	std	%f14,	[%l7 + 0x38]
	fmovsle	%xcc,	%f24,	%f4
	movgu	%icc,	%o7,	%g3
	bshuffle	%f30,	%f8,	%f22
	movge	%icc,	%l4,	%l5
	fmovdl	%xcc,	%f11,	%f28
	edge8ln	%l0,	%o6,	%o4
	sdivcc	%i6,	0x1A20,	%g5
	mulscc	%o3,	0x0595,	%l2
	faligndata	%f14,	%f10,	%f6
	edge16	%i5,	%i7,	%l6
	fxor	%f20,	%f24,	%f10
	or	%i0,	%l3,	%i1
	movcs	%icc,	%i3,	%i2
	or	%o5,	%g4,	%g1
	movvs	%xcc,	%g6,	%o1
	andncc	%i4,	%g7,	%o2
	orn	%l1,	0x1CC6,	%g2
	fandnot2s	%f29,	%f31,	%f18
	sllx	%o0,	%g3,	%l4
	orcc	%o7,	%l5,	%l0
	movcs	%icc,	%o4,	%i6
	sll	%o6,	%o3,	%g5
	sra	%i5,	0x1B,	%i7
	stb	%l6,	[%l7 + 0x74]
	xnorcc	%i0,	%l3,	%i1
	andcc	%l2,	0x06E7,	%i2
	subcc	%i3,	0x0DF0,	%g4
	movne	%xcc,	%g1,	%o5
	fpsub16s	%f16,	%f11,	%f30
	udivx	%o1,	0x048C,	%g6
	mulx	%g7,	%i4,	%l1
	smul	%o2,	0x01BE,	%g2
	std	%f14,	[%l7 + 0x48]
	fmovrsne	%g3,	%f21,	%f16
	st	%f4,	[%l7 + 0x30]
	fmovdne	%icc,	%f25,	%f18
	nop
	set	0x64, %i5
	sth	%l4,	[%l7 + %i5]
	udivcc	%o7,	0x1180,	%o0
	sth	%l5,	[%l7 + 0x28]
	siam	0x4
	mulx	%o4,	%i6,	%l0
	ldd	[%l7 + 0x18],	%o6
	fornot1s	%f15,	%f12,	%f11
	fcmpne32	%f16,	%f2,	%o3
	movgu	%icc,	%i5,	%g5
	subc	%i7,	%i0,	%l6
	edge8n	%i1,	%l3,	%i2
	subccc	%l2,	0x1449,	%g4
	sdiv	%i3,	0x16AB,	%g1
	ldd	[%l7 + 0x78],	%f6
	fornot1s	%f7,	%f24,	%f16
	subcc	%o1,	%o5,	%g6
	array32	%g7,	%i4,	%o2
	fmovrse	%l1,	%f27,	%f15
	ld	[%l7 + 0x40],	%f29
	smul	%g2,	%g3,	%o7
	ldd	[%l7 + 0x28],	%f18
	alignaddr	%o0,	%l5,	%o4
	fmovsn	%xcc,	%f19,	%f22
	fpadd16	%f6,	%f30,	%f24
	and	%i6,	%l4,	%l0
	srlx	%o3,	0x1A,	%o6
	fmovdn	%xcc,	%f10,	%f1
	ldsb	[%l7 + 0x58],	%i5
	edge8n	%g5,	%i0,	%i7
	fornot2	%f4,	%f2,	%f0
	ldsh	[%l7 + 0x7C],	%i1
	srl	%l3,	0x01,	%l6
	andn	%l2,	0x1855,	%i2
	array16	%g4,	%g1,	%i3
	lduh	[%l7 + 0x12],	%o5
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	ld	[%l7 + 0x58],	%f6
	movle	%icc,	%i4,	%g6
	alignaddrl	%o2,	%g2,	%l1
	addcc	%o7,	0x0B95,	%g3
	array8	%o0,	%o4,	%l5
	fmovrdgz	%i6,	%f2,	%f18
	sll	%l0,	0x0A,	%o3
	fpsub16s	%f16,	%f13,	%f19
	fnor	%f12,	%f22,	%f10
	save %o6, %i5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i0, %l4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l3,	0x106C,	%i1
	movl	%icc,	%l6,	%i2
	sdiv	%g4,	0x12FD,	%g1
	edge32ln	%i3,	%o5,	%l2
	st	%f28,	[%l7 + 0x3C]
	fpack32	%f26,	%f10,	%f4
	fandnot1	%f30,	%f28,	%f6
	fxnor	%f10,	%f28,	%f28
	movg	%xcc,	%o1,	%g7
	orcc	%g6,	0x170E,	%i4
	save %o2, 0x07F5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o7,	%g2
	sub	%g3,	%o4,	%o0
	and	%l5,	0x0249,	%i6
	movvc	%icc,	%o3,	%o6
	ldd	[%l7 + 0x70],	%f30
	nop
	set	0x20, %l6
	ldx	[%l7 + %l6],	%l0
	stx	%i5,	[%l7 + 0x68]
	edge32l	%g5,	%i0,	%i7
	addc	%l3,	0x08D8,	%i1
	umulcc	%l6,	%l4,	%g4
	edge8n	%i2,	%g1,	%o5
	orncc	%i3,	%l2,	%o1
	sdivx	%g6,	0x0388,	%g7
	alignaddr	%o2,	%l1,	%i4
	edge16ln	%g2,	%g3,	%o4
	fmul8ulx16	%f20,	%f12,	%f2
	addc	%o0,	0x1DA8,	%l5
	sdiv	%o7,	0x1E93,	%i6
	ldd	[%l7 + 0x70],	%o2
	ldx	[%l7 + 0x30],	%o6
	sllx	%l0,	%i5,	%g5
	udiv	%i0,	0x1298,	%i7
	movg	%xcc,	%l3,	%l6
	lduh	[%l7 + 0x72],	%i1
	fornot2s	%f27,	%f6,	%f27
	edge16	%l4,	%i2,	%g4
	ld	[%l7 + 0x4C],	%f3
	edge16ln	%o5,	%g1,	%l2
	fzero	%f10
	edge32ln	%i3,	%o1,	%g7
	and	%o2,	0x0DEC,	%g6
	edge16ln	%l1,	%i4,	%g3
	fnand	%f24,	%f2,	%f24
	alignaddr	%g2,	%o0,	%o4
	ldsw	[%l7 + 0x5C],	%l5
	fnot2	%f4,	%f8
	fabss	%f29,	%f3
	movrne	%i6,	%o7,	%o6
	ldd	[%l7 + 0x10],	%f20
	fmul8ulx16	%f20,	%f30,	%f22
	edge8l	%o3,	%l0,	%g5
	subc	%i5,	0x0020,	%i0
	fmuld8ulx16	%f8,	%f4,	%f28
	fmovsvs	%icc,	%f6,	%f1
	mulscc	%l3,	0x1B0A,	%l6
	sll	%i7,	%l4,	%i1
	movcs	%xcc,	%i2,	%g4
	fcmpeq32	%f30,	%f20,	%o5
	lduw	[%l7 + 0x5C],	%l2
	andcc	%g1,	0x1746,	%o1
	lduw	[%l7 + 0x60],	%i3
	ldx	[%l7 + 0x70],	%g7
	smul	%g6,	0x0664,	%l1
	movg	%xcc,	%o2,	%g3
	edge32n	%g2,	%i4,	%o4
	edge32ln	%o0,	%l5,	%o7
	sll	%o6,	0x07,	%i6
	fpsub16	%f6,	%f0,	%f30
	fxors	%f29,	%f20,	%f15
	fmovrslez	%o3,	%f29,	%f18
	fone	%f8
	smul	%g5,	%l0,	%i0
	andcc	%l3,	0x03AA,	%i5
	udivcc	%l6,	0x18E7,	%l4
	mulx	%i1,	%i2,	%g4
	fmovdne	%icc,	%f1,	%f23
	edge16	%o5,	%i7,	%l2
	fpadd16	%f0,	%f18,	%f4
	movvs	%icc,	%o1,	%g1
	subccc	%g7,	%i3,	%g6
	smul	%l1,	%g3,	%g2
	fmovsvc	%xcc,	%f10,	%f7
	srl	%o2,	%i4,	%o4
	ld	[%l7 + 0x40],	%f14
	sll	%o0,	0x02,	%l5
	andcc	%o7,	0x0726,	%o6
	fabss	%f9,	%f1
	ld	[%l7 + 0x3C],	%f27
	stb	%i6,	[%l7 + 0x7A]
	fxors	%f18,	%f16,	%f16
	movleu	%xcc,	%g5,	%l0
	edge8	%o3,	%i0,	%l3
	edge8l	%i5,	%l6,	%l4
	addcc	%i2,	%i1,	%o5
	movg	%xcc,	%i7,	%l2
	alignaddr	%o1,	%g1,	%g4
	edge32n	%g7,	%g6,	%i3
	fornot2s	%f17,	%f22,	%f5
	stx	%g3,	[%l7 + 0x18]
	andncc	%g2,	%o2,	%i4
	sra	%o4,	0x08,	%l1
	edge32ln	%o0,	%l5,	%o7
	edge32n	%i6,	%o6,	%l0
	std	%f2,	[%l7 + 0x60]
	array16	%g5,	%o3,	%i0
	movcc	%icc,	%i5,	%l6
	orncc	%l4,	%l3,	%i2
	popc	0x115D,	%o5
	andncc	%i1,	%i7,	%o1
	movne	%icc,	%g1,	%l2
	fmovsl	%icc,	%f24,	%f9
	edge16ln	%g4,	%g7,	%i3
	orcc	%g6,	%g2,	%o2
	ldub	[%l7 + 0x6F],	%g3
	srl	%o4,	0x07,	%l1
	fmovdl	%icc,	%f3,	%f18
	sra	%o0,	%l5,	%o7
	fcmpd	%fcc1,	%f20,	%f2
	subccc	%i6,	0x127A,	%i4
	udiv	%l0,	0x1D4E,	%g5
	orn	%o6,	0x039F,	%o3
	movl	%xcc,	%i5,	%l6
	save %l4, 0x0183, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i2,	[%l7 + 0x7C]
	st	%f26,	[%l7 + 0x64]
	fmovrsgz	%o5,	%f14,	%f9
	movrgez	%i0,	0x2F1,	%i7
	orcc	%o1,	%g1,	%i1
	ldsh	[%l7 + 0x2C],	%l2
	umulcc	%g7,	0x1E98,	%i3
	movvs	%icc,	%g4,	%g6
	movvs	%icc,	%g2,	%o2
	subccc	%o4,	%l1,	%g3
	sethi	0x1BA0,	%o0
	edge16n	%o7,	%i6,	%i4
	sethi	0x0748,	%l0
	movrne	%l5,	%g5,	%o6
	orcc	%o3,	0x1D9E,	%i5
	stw	%l4,	[%l7 + 0x74]
	udiv	%l3,	0x0B3E,	%i2
	edge8l	%l6,	%i0,	%o5
	movrgez	%i7,	0x017,	%g1
	fmovsl	%xcc,	%f19,	%f11
	alignaddr	%i1,	%o1,	%l2
	fmovrde	%g7,	%f10,	%f28
	smulcc	%g4,	%g6,	%i3
	movcc	%xcc,	%o2,	%o4
	ld	[%l7 + 0x44],	%f15
	edge32n	%g2,	%g3,	%o0
	ldub	[%l7 + 0x27],	%o7
	sll	%i6,	%l1,	%i4
	movl	%icc,	%l5,	%l0
	smulcc	%o6,	%g5,	%o3
	smul	%l4,	0x0326,	%i5
	movrgz	%l3,	%i2,	%i0
	edge16n	%l6,	%o5,	%g1
	fpadd16s	%f19,	%f2,	%f24
	xnor	%i1,	%o1,	%i7
	fmovdvc	%icc,	%f28,	%f0
	subccc	%l2,	0x19E5,	%g4
	and	%g6,	%g7,	%i3
	save %o2, %o4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o0,	%o7,	%g3
	edge16l	%l1,	%i4,	%l5
	sub	%l0,	0x1DA4,	%o6
	fand	%f14,	%f28,	%f28
	xnorcc	%i6,	0x1281,	%o3
	fand	%f20,	%f18,	%f10
	movle	%xcc,	%g5,	%i5
	movcc	%xcc,	%l4,	%l3
	st	%f29,	[%l7 + 0x14]
	movre	%i2,	%l6,	%i0
	fmovsgu	%icc,	%f10,	%f7
	fpadd32	%f12,	%f16,	%f4
	movne	%icc,	%g1,	%i1
	andncc	%o5,	%o1,	%l2
	fcmpgt16	%f8,	%f28,	%g4
	fandnot1s	%f23,	%f8,	%f2
	movrlez	%g6,	%g7,	%i7
	movrne	%i3,	%o4,	%g2
	edge16ln	%o2,	%o0,	%g3
	xnor	%o7,	%l1,	%i4
	fcmps	%fcc2,	%f16,	%f27
	ld	[%l7 + 0x3C],	%f25
	movrgz	%l5,	%l0,	%i6
	xor	%o3,	0x1148,	%o6
	srl	%i5,	0x0E,	%l4
	xnor	%g5,	%i2,	%l6
	umul	%l3,	%i0,	%g1
	xnorcc	%o5,	%i1,	%o1
	sllx	%g4,	%g6,	%g7
	xorcc	%l2,	0x0642,	%i3
	subc	%i7,	0x1CDD,	%o4
	fnor	%f10,	%f6,	%f12
	fnot1	%f30,	%f24
	ldsb	[%l7 + 0x79],	%o2
	sth	%g2,	[%l7 + 0x3C]
	edge16l	%g3,	%o7,	%l1
	srax	%o0,	%l5,	%i4
	fmovrde	%l0,	%f2,	%f4
	movge	%icc,	%i6,	%o6
	fmovrslez	%o3,	%f24,	%f1
	fnegd	%f30,	%f0
	popc	0x0AAE,	%i5
	ldsh	[%l7 + 0x32],	%l4
	edge32	%g5,	%l6,	%l3
	andcc	%i2,	%i0,	%g1
	mulx	%i1,	%o5,	%g4
	fmovdne	%xcc,	%f31,	%f17
	fmovrsgz	%o1,	%f22,	%f6
	umul	%g6,	%l2,	%i3
	srl	%g7,	%i7,	%o4
	fmovdcs	%icc,	%f22,	%f21
	nop
	set	0x50, %i6
	ldub	[%l7 + %i6],	%g2
	fcmpgt16	%f16,	%f8,	%g3
	fpadd32s	%f3,	%f28,	%f7
	edge16n	%o2,	%l1,	%o7
	movne	%icc,	%l5,	%i4
	movrlez	%o0,	%i6,	%o6
	movle	%xcc,	%l0,	%o3
	fmovrslez	%l4,	%f15,	%f10
	movcc	%icc,	%g5,	%l6
	nop
	set	0x14, %o5
	lduw	[%l7 + %o5],	%l3
	fmovrsne	%i2,	%f3,	%f12
	edge32n	%i0,	%i5,	%g1
	fandnot2	%f10,	%f0,	%f18
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	restore %o1, %g6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l2,	%g7
	addcc	%i3,	0x0E32,	%o4
	movcc	%xcc,	%i7,	%g3
	sra	%o2,	0x0B,	%g2
	orncc	%o7,	%l1,	%l5
	fsrc2	%f0,	%f0
	movneg	%icc,	%i4,	%o0
	sdivcc	%o6,	0x1E1B,	%l0
	nop
	set	0x20, %i1
	stw	%o3,	[%l7 + %i1]
	movne	%xcc,	%l4,	%g5
	udivx	%i6,	0x0FDD,	%l6
	fpack16	%f4,	%f4
	sir	0x02B6
	fpsub16s	%f16,	%f11,	%f14
	movl	%xcc,	%l3,	%i0
	stw	%i5,	[%l7 + 0x24]
	ldsh	[%l7 + 0x4A],	%i2
	fmovrdlz	%g1,	%f18,	%f12
	smulcc	%o5,	0x1D3E,	%i1
	faligndata	%f26,	%f6,	%f18
	ldsb	[%l7 + 0x1F],	%g6
	edge8	%g4,	%o1,	%l2
	movge	%icc,	%i3,	%g7
	movne	%xcc,	%i7,	%o4
	stb	%g3,	[%l7 + 0x3D]
	srax	%g2,	%o2,	%l1
	st	%f21,	[%l7 + 0x74]
	edge32ln	%o7,	%i4,	%l5
	fpmerge	%f4,	%f0,	%f26
	smul	%o0,	0x1F1F,	%l0
	stb	%o3,	[%l7 + 0x35]
	edge16l	%o6,	%l4,	%g5
	movrlz	%l6,	%l3,	%i6
	fmovrsgz	%i0,	%f11,	%f0
	nop
	set	0x14, %g5
	stw	%i5,	[%l7 + %g5]
	smulcc	%i2,	0x019D,	%g1
	movrlz	%o5,	0x3F0,	%i1
	sethi	0x10AB,	%g6
	popc	%g4,	%l2
	ldd	[%l7 + 0x68],	%o0
	fcmpne32	%f6,	%f0,	%g7
	edge16n	%i7,	%o4,	%i3
	fcmpd	%fcc1,	%f10,	%f8
	fmul8x16al	%f18,	%f27,	%f30
	edge16l	%g3,	%g2,	%o2
	or	%l1,	%i4,	%o7
	fnot1	%f22,	%f4
	or	%l5,	0x19EF,	%l0
	xnorcc	%o0,	%o3,	%l4
	add	%g5,	0x17EB,	%o6
	movcc	%icc,	%l6,	%i6
	sub	%l3,	%i5,	%i2
	movg	%xcc,	%i0,	%g1
	fmovsgu	%xcc,	%f12,	%f29
	fpadd16s	%f13,	%f17,	%f21
	movvc	%xcc,	%i1,	%g6
	array16	%g4,	%o5,	%l2
	ldub	[%l7 + 0x18],	%g7
	orn	%i7,	%o4,	%i3
	sll	%g3,	0x0D,	%g2
	edge32ln	%o1,	%l1,	%i4
	umulcc	%o7,	0x1C79,	%l5
	fexpand	%f13,	%f20
	udiv	%o2,	0x1A4C,	%l0
	fones	%f16
	add	%o0,	%o3,	%l4
	fmovdcc	%xcc,	%f17,	%f27
	st	%f3,	[%l7 + 0x40]
	smul	%o6,	0x1FF1,	%g5
	xnor	%i6,	%l3,	%i5
	st	%f14,	[%l7 + 0x34]
	movrgz	%i2,	0x1AB,	%i0
	movre	%l6,	0x14C,	%g1
	smul	%g6,	0x0212,	%i1
	movge	%xcc,	%g4,	%l2
	fexpand	%f10,	%f4
	mulx	%o5,	%g7,	%o4
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%i2
	movpos	%xcc,	%i7,	%g3
	movvc	%icc,	%o1,	%l1
	popc	%g2,	%i4
	fmovse	%xcc,	%f10,	%f8
	fpack32	%f28,	%f4,	%f6
	or	%l5,	0x0EC8,	%o2
	orcc	%o7,	0x19CB,	%l0
	fpadd16s	%f14,	%f27,	%f3
	xnor	%o0,	0x0C86,	%o3
	smulcc	%l4,	0x12E8,	%o6
	sir	0x1FD9
	ldub	[%l7 + 0x4F],	%i6
	ldsh	[%l7 + 0x46],	%l3
	movl	%xcc,	%i5,	%i2
	ld	[%l7 + 0x2C],	%f19
	fmovsleu	%xcc,	%f22,	%f20
	fsrc1s	%f25,	%f17
	edge32	%g5,	%i0,	%g1
	and	%g6,	%l6,	%g4
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	xnorcc	%o4,	%i3,	%i7
	edge16n	%i1,	%g3,	%l1
	udivx	%g2,	0x14FC,	%o1
	save %l5, %i4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l0,	%o0,	%o3
	fmovrsgz	%o2,	%f31,	%f16
	lduw	[%l7 + 0x0C],	%o6
	movvc	%xcc,	%l4,	%l3
	fmovrslz	%i6,	%f18,	%f24
	fmovde	%xcc,	%f17,	%f27
	pdist	%f26,	%f24,	%f30
	addccc	%i2,	0x07F0,	%g5
	movrne	%i5,	0x044,	%i0
	fcmpes	%fcc0,	%f2,	%f22
	srlx	%g1,	%g6,	%g4
	ldd	[%l7 + 0x28],	%f20
	sethi	0x13E2,	%l6
	addcc	%o5,	%g7,	%l2
	fmuld8sux16	%f20,	%f26,	%f8
	array32	%o4,	%i3,	%i7
	move	%icc,	%g3,	%l1
	fmovsl	%xcc,	%f25,	%f7
	bshuffle	%f18,	%f4,	%f16
	sra	%i1,	%o1,	%l5
	fcmple16	%f20,	%f24,	%g2
	addcc	%o7,	%i4,	%o0
	umul	%o3,	0x1786,	%l0
	edge8l	%o6,	%l4,	%l3
	sir	0x1EA1
	fmovrdgez	%o2,	%f6,	%f28
	ldsb	[%l7 + 0x19],	%i2
	sdivcc	%g5,	0x13E3,	%i6
	movrne	%i5,	0x37F,	%i0
	fnot2s	%f27,	%f2
	nop
	set	0x48, %g7
	ldd	[%l7 + %g7],	%f16
	alignaddr	%g1,	%g4,	%g6
	fmovspos	%icc,	%f8,	%f20
	orncc	%o5,	0x04B3,	%l6
	fmovrse	%l2,	%f29,	%f2
	and	%o4,	%g7,	%i3
	movne	%xcc,	%g3,	%l1
	fzeros	%f22
	fpsub32	%f6,	%f0,	%f18
	sdivcc	%i1,	0x0487,	%o1
	sethi	0x1D02,	%l5
	movpos	%icc,	%g2,	%i7
	smulcc	%o7,	%i4,	%o0
	xorcc	%o3,	0x06EF,	%o6
	edge16ln	%l4,	%l3,	%o2
	subccc	%i2,	%l0,	%i6
	fands	%f30,	%f21,	%f21
	move	%icc,	%i5,	%g5
	andn	%i0,	%g4,	%g6
	xorcc	%g1,	0x1FA4,	%l6
	edge8	%l2,	%o5,	%g7
	stb	%i3,	[%l7 + 0x77]
	movg	%icc,	%g3,	%o4
	subccc	%l1,	%i1,	%o1
	smulcc	%l5,	0x1A42,	%g2
	subcc	%i7,	%o7,	%o0
	save %i4, %o3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o6,	0x1745,	%l3
	fmovd	%f26,	%f30
	ldd	[%l7 + 0x78],	%f24
	sir	0x0120
	movrne	%o2,	0x3CA,	%i2
	move	%icc,	%l0,	%i6
	movl	%icc,	%i5,	%i0
	edge16ln	%g5,	%g6,	%g4
	udivx	%g1,	0x0A67,	%l6
	mulscc	%l2,	%o5,	%g7
	array8	%i3,	%g3,	%o4
	edge8ln	%i1,	%l1,	%o1
	movrgez	%g2,	%i7,	%o7
	movne	%xcc,	%l5,	%i4
	movge	%xcc,	%o0,	%l4
	lduw	[%l7 + 0x10],	%o6
	orn	%l3,	0x19B3,	%o3
	fzeros	%f31
	alignaddr	%o2,	%l0,	%i6
	ldd	[%l7 + 0x70],	%i2
	movg	%xcc,	%i5,	%g5
	fmovsn	%xcc,	%f7,	%f6
	sdivx	%i0,	0x0D66,	%g6
	restore %g1, %l6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o5,	%g7,	%i3
	movrlz	%g4,	0x23F,	%o4
	andn	%i1,	%g3,	%l1
	fmul8x16au	%f24,	%f20,	%f2
	fcmple32	%f14,	%f30,	%o1
	fmovsl	%icc,	%f22,	%f3
	movrgz	%i7,	0x044,	%o7
	edge32n	%g2,	%l5,	%i4
	ldsh	[%l7 + 0x36],	%l4
	edge16l	%o0,	%l3,	%o3
	fandnot2	%f28,	%f0,	%f30
	edge8n	%o6,	%o2,	%i6
	movn	%xcc,	%i2,	%i5
	st	%f6,	[%l7 + 0x54]
	edge16l	%g5,	%i0,	%g6
	move	%icc,	%l0,	%g1
	stb	%l6,	[%l7 + 0x70]
	mova	%icc,	%l2,	%g7
	movneg	%icc,	%i3,	%o5
	fmovscc	%xcc,	%f12,	%f5
	fpsub16s	%f0,	%f13,	%f11
	ld	[%l7 + 0x24],	%f18
	ldsw	[%l7 + 0x18],	%o4
	movge	%xcc,	%i1,	%g3
	edge16n	%g4,	%l1,	%o1
	fabsd	%f12,	%f10
	orncc	%i7,	%o7,	%g2
	orncc	%l5,	%i4,	%l4
	fmovrde	%l3,	%f4,	%f6
	st	%f4,	[%l7 + 0x34]
	popc	%o0,	%o3
	lduh	[%l7 + 0x4A],	%o2
	movpos	%xcc,	%i6,	%i2
	fors	%f4,	%f8,	%f10
	fcmple32	%f10,	%f6,	%o6
	mulx	%i5,	%g5,	%i0
	orcc	%l0,	0x08ED,	%g6
	fmovspos	%xcc,	%f14,	%f23
	xorcc	%l6,	%g1,	%g7
	smul	%l2,	0x0994,	%o5
	movvs	%xcc,	%i3,	%o4
	movne	%icc,	%i1,	%g4
	ldd	[%l7 + 0x58],	%l0
	movcc	%xcc,	%o1,	%i7
	fmovsneg	%icc,	%f31,	%f10
	orncc	%o7,	0x199D,	%g2
	umulcc	%l5,	0x1172,	%g3
	fcmpeq16	%f24,	%f18,	%l4
	fcmpgt16	%f24,	%f24,	%i4
	fornot2	%f4,	%f2,	%f18
	sdivx	%l3,	0x073F,	%o3
	mulx	%o0,	%i6,	%o2
	fcmple16	%f26,	%f30,	%o6
	xnor	%i5,	0x13A0,	%g5
	udivx	%i0,	0x028E,	%l0
	fmovdg	%xcc,	%f1,	%f8
	movcc	%icc,	%g6,	%l6
	edge8	%g1,	%i2,	%l2
	alignaddr	%g7,	%o5,	%i3
	xor	%o4,	%i1,	%g4
	sdivcc	%o1,	0x0FFA,	%i7
	mulscc	%o7,	0x0D2E,	%g2
	sra	%l5,	%l1,	%l4
	nop
	set	0x40, %i7
	stx	%g3,	[%l7 + %i7]
	stw	%i4,	[%l7 + 0x7C]
	umulcc	%l3,	0x11F0,	%o0
	movge	%xcc,	%i6,	%o3
	movge	%icc,	%o2,	%i5
	addc	%o6,	%g5,	%l0
	fsrc1s	%f12,	%f5
	lduw	[%l7 + 0x6C],	%i0
	save %g6, 0x0BAB, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i2,	%l2
	fmovsne	%xcc,	%f18,	%f4
	mova	%icc,	%g7,	%g1
	sethi	0x0459,	%o5
	xnorcc	%i3,	%i1,	%g4
	move	%xcc,	%o1,	%o4
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	mulx	%g2,	%l5,	%l1
	std	%f28,	[%l7 + 0x70]
	ldsw	[%l7 + 0x10],	%g3
	ldsb	[%l7 + 0x68],	%l4
	mulscc	%i4,	%o0,	%i6
	movrlz	%l3,	0x02C,	%o3
	udivx	%o2,	0x17E2,	%o6
	alignaddr	%i5,	%g5,	%l0
	movg	%xcc,	%g6,	%l6
	edge8l	%i2,	%i0,	%l2
	movleu	%icc,	%g1,	%g7
	ldsb	[%l7 + 0x25],	%o5
	mova	%icc,	%i1,	%i3
	edge16l	%g4,	%o1,	%o7
	sth	%o4,	[%l7 + 0x0C]
	smul	%g2,	0x1577,	%i7
	movne	%xcc,	%l5,	%l1
	sth	%g3,	[%l7 + 0x14]
	fmovdn	%icc,	%f0,	%f30
	fmovrsgez	%l4,	%f7,	%f20
	sra	%i4,	0x10,	%o0
	sethi	0x1EDF,	%l3
	movneg	%icc,	%o3,	%i6
	movn	%xcc,	%o6,	%i5
	stx	%g5,	[%l7 + 0x50]
	sethi	0x064F,	%l0
	movrne	%o2,	0x0AF,	%g6
	sth	%l6,	[%l7 + 0x3C]
	fmovdvc	%icc,	%f2,	%f17
	edge16n	%i2,	%l2,	%g1
	edge16n	%i0,	%o5,	%g7
	st	%f7,	[%l7 + 0x58]
	fandnot2s	%f11,	%f31,	%f30
	edge32l	%i1,	%g4,	%i3
	stb	%o7,	[%l7 + 0x0A]
	fmovda	%xcc,	%f11,	%f22
	mova	%icc,	%o4,	%g2
	fmovd	%f2,	%f0
	addc	%o1,	0x0ED6,	%i7
	edge32	%l1,	%g3,	%l4
	ldub	[%l7 + 0x41],	%i4
	subccc	%l5,	%l3,	%o0
	edge16ln	%o3,	%i6,	%i5
	xorcc	%g5,	0x1CC9,	%o6
	movrne	%o2,	%g6,	%l6
	fmovdneg	%xcc,	%f15,	%f2
	fnor	%f6,	%f0,	%f6
	udivx	%l0,	0x0253,	%l2
	edge8l	%i2,	%g1,	%i0
	fones	%f14
	orn	%g7,	%i1,	%o5
	fors	%f11,	%f19,	%f22
	movcc	%icc,	%i3,	%g4
	movn	%xcc,	%o7,	%g2
	fcmpeq32	%f22,	%f8,	%o4
	edge16l	%i7,	%o1,	%g3
	movgu	%icc,	%l4,	%l1
	save %i4, 0x0141, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x38],	%f7
	fmovdge	%xcc,	%f1,	%f30
	movre	%o0,	0x21E,	%l5
	movl	%xcc,	%o3,	%i5
	edge8ln	%i6,	%g5,	%o2
	alignaddrl	%o6,	%l6,	%l0
	movge	%icc,	%l2,	%g6
	udiv	%g1,	0x0951,	%i2
	fones	%f16
	sdivcc	%i0,	0x1A84,	%i1
	alignaddr	%g7,	%i3,	%o5
	srax	%o7,	%g2,	%g4
	array32	%o4,	%i7,	%g3
	fexpand	%f5,	%f16
	andncc	%l4,	%l1,	%o1
	fmovsg	%icc,	%f31,	%f30
	mulx	%i4,	0x0B56,	%l3
	srlx	%l5,	0x0B,	%o3
	movvc	%xcc,	%i5,	%i6
	movrlz	%g5,	%o0,	%o6
	sdivcc	%l6,	0x1ECB,	%l0
	movn	%icc,	%l2,	%o2
	srlx	%g6,	0x16,	%i2
	popc	%g1,	%i1
	xor	%g7,	%i3,	%i0
	mulscc	%o5,	%o7,	%g2
	addccc	%o4,	0x159F,	%i7
	ldsw	[%l7 + 0x60],	%g4
	xorcc	%l4,	0x04CE,	%g3
	sra	%l1,	0x13,	%o1
	stw	%i4,	[%l7 + 0x38]
	fmovdg	%icc,	%f24,	%f15
	sdivcc	%l3,	0x184A,	%o3
	edge8	%i5,	%i6,	%g5
	movpos	%icc,	%o0,	%o6
	alignaddr	%l5,	%l0,	%l2
	sth	%l6,	[%l7 + 0x4A]
	movg	%icc,	%g6,	%o2
	fmovdneg	%xcc,	%f22,	%f30
	orn	%g1,	%i2,	%i1
	fnand	%f2,	%f8,	%f6
	movcs	%icc,	%i3,	%i0
	ldd	[%l7 + 0x68],	%o4
	fpadd16s	%f1,	%f5,	%f5
	movge	%xcc,	%g7,	%g2
	fpadd16s	%f12,	%f22,	%f24
	edge8l	%o7,	%o4,	%g4
	subc	%i7,	0x035D,	%g3
	fmovsgu	%icc,	%f0,	%f27
	ldsb	[%l7 + 0x59],	%l1
	fmovdneg	%xcc,	%f3,	%f14
	fornot2	%f6,	%f14,	%f18
	udiv	%o1,	0x0F7F,	%i4
	andncc	%l3,	%l4,	%o3
	edge32ln	%i5,	%g5,	%i6
	movrne	%o0,	0x3A8,	%o6
	movrlez	%l0,	0x226,	%l5
	subccc	%l6,	0x0633,	%l2
	fmovdvs	%xcc,	%f13,	%f21
	fabss	%f31,	%f9
	edge8ln	%g6,	%g1,	%o2
	fpsub32s	%f27,	%f1,	%f28
	srax	%i2,	0x01,	%i3
	add	%i0,	0x1375,	%o5
	movvs	%xcc,	%g7,	%g2
	save %i1, 0x1287, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%o7,	%i7
	fmovdleu	%xcc,	%f18,	%f6
	movpos	%xcc,	%g4,	%g3
	move	%xcc,	%o1,	%i4
	movneg	%xcc,	%l3,	%l1
	orncc	%l4,	%i5,	%o3
	stb	%g5,	[%l7 + 0x10]
	fpackfix	%f2,	%f18
	edge8	%i6,	%o6,	%o0
	ldx	[%l7 + 0x20],	%l0
	xorcc	%l6,	%l2,	%g6
	array16	%g1,	%o2,	%i2
	addcc	%l5,	%i3,	%o5
	fnot2s	%f28,	%f29
	fnegd	%f16,	%f24
	movrne	%g7,	%i0,	%i1
	edge8l	%o4,	%g2,	%o7
	lduw	[%l7 + 0x44],	%i7
	alignaddrl	%g4,	%g3,	%i4
	udivx	%l3,	0x0437,	%o1
	orcc	%l1,	%i5,	%l4
	andcc	%o3,	0x085C,	%g5
	fmovsne	%xcc,	%f31,	%f18
	faligndata	%f8,	%f2,	%f28
	ldd	[%l7 + 0x20],	%f0
	fmovd	%f16,	%f10
	stx	%o6,	[%l7 + 0x38]
	edge16	%o0,	%l0,	%i6
	movneg	%xcc,	%l2,	%g6
	fmovspos	%xcc,	%f30,	%f1
	mova	%xcc,	%l6,	%g1
	ldub	[%l7 + 0x56],	%i2
	smulcc	%o2,	%l5,	%o5
	or	%i3,	%i0,	%i1
	sdivcc	%o4,	0x06BB,	%g7
	mulscc	%g2,	0x07AF,	%i7
	fmovdle	%xcc,	%f0,	%f19
	sra	%g4,	%g3,	%i4
	edge16	%o7,	%l3,	%o1
	fmul8ulx16	%f8,	%f20,	%f6
	edge32l	%i5,	%l4,	%o3
	movge	%icc,	%l1,	%g5
	mulscc	%o6,	0x0D2E,	%o0
	fmovdgu	%xcc,	%f30,	%f20
	fmovsl	%icc,	%f13,	%f27
	subccc	%l0,	%l2,	%g6
	movge	%xcc,	%i6,	%g1
	sdivx	%l6,	0x0D11,	%i2
	array8	%o2,	%o5,	%l5
	xorcc	%i0,	0x1384,	%i3
	sll	%i1,	%g7,	%o4
	smulcc	%i7,	0x01C5,	%g2
	fmovrsne	%g3,	%f0,	%f3
	movleu	%icc,	%i4,	%g4
	fmul8x16al	%f31,	%f16,	%f12
	fmovsneg	%icc,	%f2,	%f10
	fnegd	%f22,	%f4
	fmovrdlez	%o7,	%f30,	%f26
	movrgez	%l3,	%i5,	%o1
	fmovdvs	%xcc,	%f24,	%f11
	orn	%l4,	0x1FCA,	%l1
	movcs	%icc,	%g5,	%o6
	nop
	set	0x68, %g6
	stb	%o3,	[%l7 + %g6]
	edge16l	%o0,	%l0,	%l2
	edge16n	%g6,	%g1,	%l6
	edge16n	%i2,	%o2,	%o5
	array8	%i6,	%i0,	%l5
	fnot2	%f24,	%f12
	subcc	%i3,	%g7,	%o4
	subc	%i7,	%i1,	%g2
	movle	%xcc,	%i4,	%g4
	addccc	%g3,	0x037B,	%o7
	ldub	[%l7 + 0x56],	%i5
	edge8ln	%l3,	%o1,	%l4
	addcc	%g5,	0x1831,	%o6
	addccc	%o3,	%l1,	%l0
	addccc	%l2,	0x1518,	%g6
	and	%o0,	%l6,	%i2
	ldx	[%l7 + 0x20],	%o2
	smul	%o5,	%g1,	%i6
	edge32n	%i0,	%l5,	%i3
	edge8n	%o4,	%g7,	%i7
	sll	%i1,	%i4,	%g2
	xnor	%g3,	0x10F4,	%g4
	movrlez	%o7,	0x0E3,	%l3
	fornot2s	%f1,	%f5,	%f2
	ldub	[%l7 + 0x51],	%i5
	umul	%o1,	%l4,	%o6
	movg	%icc,	%o3,	%l1
	ldsb	[%l7 + 0x39],	%l0
	sdivcc	%l2,	0x07F3,	%g5
	sdivx	%o0,	0x1D1F,	%l6
	st	%f27,	[%l7 + 0x34]
	addccc	%i2,	%o2,	%g6
	orcc	%g1,	%o5,	%i0
	sra	%l5,	0x1F,	%i3
	fpack32	%f6,	%f16,	%f16
	fornot1s	%f19,	%f9,	%f19
	sdivx	%o4,	0x0D98,	%g7
	movne	%icc,	%i7,	%i1
	ldsw	[%l7 + 0x60],	%i6
	movcc	%icc,	%g2,	%i4
	ldub	[%l7 + 0x2B],	%g3
	array16	%o7,	%l3,	%g4
	udiv	%i5,	0x02B4,	%o1
	sub	%l4,	%o3,	%o6
	fxor	%f10,	%f20,	%f10
	fmovsvc	%icc,	%f7,	%f16
	sdivcc	%l0,	0x09A3,	%l1
	alignaddrl	%g5,	%l2,	%o0
	fmovdpos	%xcc,	%f31,	%f26
	umulcc	%i2,	0x1DE6,	%l6
	fzeros	%f25
	alignaddrl	%g6,	%o2,	%g1
	fone	%f26
	andn	%i0,	%l5,	%i3
	movcc	%icc,	%o4,	%g7
	stb	%o5,	[%l7 + 0x3F]
	st	%f9,	[%l7 + 0x40]
	fmovsg	%icc,	%f8,	%f3
	subc	%i7,	%i1,	%i6
	ldub	[%l7 + 0x13],	%g2
	movrlez	%g3,	0x339,	%o7
	lduh	[%l7 + 0x0C],	%l3
	subccc	%i4,	0x193C,	%i5
	fmovsneg	%xcc,	%f5,	%f23
	fpsub32	%f0,	%f4,	%f4
	udiv	%g4,	0x0972,	%o1
	fmovrslz	%o3,	%f22,	%f9
	movcs	%xcc,	%o6,	%l4
	ldd	[%l7 + 0x68],	%l0
	fmovrse	%l0,	%f19,	%f2
	udiv	%g5,	0x0F6E,	%o0
	edge8ln	%i2,	%l2,	%g6
	fabss	%f3,	%f28
	fornot2	%f8,	%f4,	%f12
	fmovdgu	%icc,	%f29,	%f17
	srlx	%o2,	0x1D,	%l6
	and	%i0,	%l5,	%g1
	subcc	%i3,	0x0A5B,	%g7
	fornot1s	%f24,	%f12,	%f0
	array8	%o4,	%o5,	%i1
	or	%i6,	0x1D36,	%i7
	fandnot1s	%f25,	%f15,	%f18
	xnor	%g3,	0x1D53,	%g2
	fcmple16	%f30,	%f28,	%o7
	siam	0x5
	andn	%i4,	%l3,	%i5
	addc	%o1,	%g4,	%o6
	movl	%icc,	%o3,	%l1
	edge8ln	%l4,	%g5,	%l0
	fxor	%f22,	%f4,	%f0
	lduw	[%l7 + 0x40],	%i2
	movleu	%xcc,	%o0,	%g6
	movgu	%xcc,	%l2,	%l6
	save %i0, %o2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i3,	%g7,	%l5
	sdiv	%o5,	0x026B,	%o4
	andcc	%i1,	0x09B2,	%i7
	ldd	[%l7 + 0x38],	%g2
	fones	%f18
	fxnors	%f26,	%f31,	%f13
	lduw	[%l7 + 0x50],	%i6
	nop
	set	0x0E, %o0
	lduh	[%l7 + %o0],	%g2
	edge16ln	%o7,	%l3,	%i4
	edge8l	%o1,	%g4,	%i5
	fmovde	%icc,	%f7,	%f2
	subccc	%o3,	%l1,	%l4
	movn	%icc,	%g5,	%l0
	fmovrdlz	%o6,	%f0,	%f14
	sth	%i2,	[%l7 + 0x54]
	srax	%o0,	%g6,	%l2
	fornot1	%f28,	%f0,	%f2
	movrne	%i0,	%o2,	%l6
	ldd	[%l7 + 0x58],	%f16
	addc	%g1,	%i3,	%l5
	addccc	%g7,	0x1AF3,	%o4
	edge32ln	%i1,	%i7,	%o5
	orcc	%i6,	0x0383,	%g2
	sra	%o7,	%g3,	%i4
	sdiv	%o1,	0x0DE5,	%l3
	ld	[%l7 + 0x68],	%f18
	movre	%i5,	%g4,	%o3
	fmovscc	%xcc,	%f28,	%f0
	srax	%l4,	0x09,	%l1
	fsrc1	%f14,	%f22
	nop
	set	0x40, %i2
	ldsb	[%l7 + %i2],	%l0
	array16	%g5,	%i2,	%o0
	edge32l	%g6,	%l2,	%i0
	movl	%xcc,	%o2,	%o6
	edge8n	%l6,	%g1,	%i3
	fmovrslz	%l5,	%f7,	%f20
	or	%g7,	%o4,	%i7
	movge	%xcc,	%i1,	%i6
	edge16l	%o5,	%g2,	%g3
	fxors	%f22,	%f3,	%f17
	stx	%o7,	[%l7 + 0x08]
	sth	%o1,	[%l7 + 0x26]
	smulcc	%l3,	%i5,	%g4
	movcs	%icc,	%i4,	%l4
	ldx	[%l7 + 0x48],	%l1
	fcmps	%fcc1,	%f5,	%f30
	edge16	%o3,	%l0,	%g5
	orncc	%i2,	%g6,	%o0
	edge32l	%i0,	%o2,	%l2
	ldsh	[%l7 + 0x22],	%l6
	alignaddr	%g1,	%i3,	%l5
	pdist	%f20,	%f20,	%f22
	movrne	%g7,	%o6,	%o4
	movleu	%xcc,	%i7,	%i6
	stw	%o5,	[%l7 + 0x1C]
	movl	%icc,	%g2,	%g3
	movg	%xcc,	%i1,	%o1
	smulcc	%l3,	0x1B2A,	%i5
	stw	%o7,	[%l7 + 0x44]
	subc	%g4,	0x14DC,	%i4
	movgu	%icc,	%l1,	%o3
	movvc	%icc,	%l0,	%g5
	mova	%xcc,	%i2,	%g6
	array32	%l4,	%o0,	%o2
	fmovsa	%xcc,	%f25,	%f1
	sdivx	%l2,	0x0801,	%i0
	udivcc	%g1,	0x0BAA,	%l6
	mova	%xcc,	%i3,	%g7
	ldsh	[%l7 + 0x68],	%l5
	sir	0x162D
	ldsh	[%l7 + 0x4C],	%o6
	edge32	%i7,	%o4,	%i6
	sdivcc	%g2,	0x15E2,	%g3
	fmul8sux16	%f26,	%f30,	%f12
	xnor	%i1,	%o5,	%l3
	andcc	%i5,	0x0D66,	%o1
	edge32n	%g4,	%o7,	%i4
	alignaddrl	%l1,	%l0,	%g5
	edge32ln	%i2,	%g6,	%o3
	udiv	%o0,	0x0D56,	%l4
	edge32	%l2,	%o2,	%g1
	sir	0x0CCD
	edge16n	%i0,	%i3,	%g7
	sdivx	%l5,	0x074F,	%l6
	ldd	[%l7 + 0x30],	%i6
	sllx	%o6,	%o4,	%g2
	edge16ln	%i6,	%i1,	%o5
	addccc	%g3,	0x1F6F,	%l3
	for	%f8,	%f16,	%f12
	ldsw	[%l7 + 0x58],	%i5
	fmovdn	%xcc,	%f19,	%f18
	ldub	[%l7 + 0x65],	%g4
	pdist	%f8,	%f10,	%f0
	edge16	%o1,	%i4,	%l1
	fabsd	%f14,	%f2
	smulcc	%l0,	%g5,	%i2
	ldd	[%l7 + 0x58],	%f28
	sdiv	%o7,	0x0CBD,	%g6
	movge	%xcc,	%o0,	%l4
	save %l2, %o3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g1,	0x0F07,	%i3
	fmovdpos	%xcc,	%f31,	%f14
	movrgez	%g7,	%l5,	%l6
	ldsb	[%l7 + 0x3A],	%i0
	umulcc	%o6,	0x00AB,	%i7
	movcs	%icc,	%o4,	%i6
	fsrc2	%f18,	%f2
	fcmped	%fcc3,	%f16,	%f28
	restore %g2, 0x1224, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f20,	%f2
	edge8	%o5,	%l3,	%g3
	fmovsa	%xcc,	%f0,	%f7
	stw	%g4,	[%l7 + 0x78]
	fmul8ulx16	%f0,	%f0,	%f26
	addccc	%o1,	0x1242,	%i5
	ldsb	[%l7 + 0x1F],	%i4
	fsrc2s	%f27,	%f17
	movg	%icc,	%l0,	%g5
	movge	%xcc,	%l1,	%i2
	smul	%g6,	%o0,	%l4
	fmovsg	%icc,	%f10,	%f23
	orncc	%l2,	0x05C7,	%o3
	alignaddrl	%o7,	%o2,	%g1
	movne	%icc,	%i3,	%l5
	movle	%xcc,	%l6,	%g7
	edge16	%i0,	%i7,	%o6
	fcmple32	%f10,	%f8,	%o4
	srl	%i6,	%g2,	%i1
	fmovda	%xcc,	%f19,	%f2
	lduh	[%l7 + 0x76],	%o5
	stx	%l3,	[%l7 + 0x30]
	movleu	%xcc,	%g4,	%g3
	andn	%i5,	%o1,	%l0
	edge8l	%i4,	%g5,	%i2
	stx	%l1,	[%l7 + 0x08]
	edge8	%o0,	%l4,	%l2
	stx	%g6,	[%l7 + 0x78]
	andn	%o7,	0x1BB7,	%o3
	movn	%icc,	%o2,	%i3
	ld	[%l7 + 0x5C],	%f12
	xnorcc	%g1,	%l5,	%l6
	edge32	%g7,	%i0,	%o6
	umulcc	%i7,	0x0AC6,	%o4
	sub	%g2,	%i6,	%o5
	nop
	set	0x5C, %o1
	sth	%i1,	[%l7 + %o1]
	fmovsne	%icc,	%f6,	%f23
	fpadd16s	%f20,	%f28,	%f17
	fpadd16	%f0,	%f10,	%f0
	edge16n	%g4,	%g3,	%i5
	array16	%l3,	%l0,	%o1
	orn	%g5,	%i2,	%l1
	fmovdcs	%icc,	%f0,	%f14
	ldd	[%l7 + 0x48],	%i4
	fmovsleu	%xcc,	%f16,	%f25
	alignaddr	%l4,	%l2,	%g6
	orn	%o7,	%o0,	%o2
	ldsw	[%l7 + 0x08],	%o3
	movneg	%xcc,	%g1,	%i3
	sdivx	%l5,	0x0AFB,	%g7
	movn	%icc,	%l6,	%i0
	orncc	%o6,	0x108D,	%o4
	orcc	%g2,	%i7,	%i6
	srax	%i1,	0x0D,	%g4
	fnor	%f24,	%f6,	%f30
	movrne	%g3,	%o5,	%i5
	add	%l3,	0x0D26,	%o1
	udiv	%l0,	0x0EEC,	%g5
	sethi	0x1576,	%l1
	fsrc2s	%f28,	%f14
	movle	%xcc,	%i2,	%l4
	movre	%i4,	%g6,	%o7
	popc	%l2,	%o0
	fmovrslz	%o2,	%f26,	%f27
	lduw	[%l7 + 0x30],	%o3
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%f22
	andncc	%g1,	%i3,	%l5
	movrne	%g7,	0x05B,	%l6
	edge32l	%i0,	%o4,	%g2
	fcmped	%fcc2,	%f16,	%f4
	stb	%o6,	[%l7 + 0x12]
	fmovsne	%xcc,	%f4,	%f30
	movpos	%icc,	%i6,	%i1
	movcs	%xcc,	%g4,	%i7
	fpadd32	%f16,	%f16,	%f28
	subccc	%g3,	%i5,	%o5
	alignaddrl	%o1,	%l0,	%l3
	add	%g5,	0x0588,	%i2
	popc	0x0154,	%l4
	srax	%i4,	0x18,	%l1
	subcc	%o7,	%l2,	%o0
	addccc	%g6,	%o3,	%o2
	fcmple32	%f20,	%f28,	%g1
	fmovda	%icc,	%f5,	%f18
	movvc	%icc,	%i3,	%l5
	xnorcc	%l6,	0x14FA,	%g7
	movpos	%xcc,	%o4,	%i0
	stb	%g2,	[%l7 + 0x53]
	movrlez	%o6,	%i1,	%i6
	lduw	[%l7 + 0x78],	%i7
	ldsw	[%l7 + 0x50],	%g3
	movge	%icc,	%g4,	%o5
	movrne	%o1,	0x084,	%l0
	fandnot2s	%f10,	%f10,	%f22
	addccc	%i5,	0x09AF,	%g5
	srlx	%i2,	%l3,	%l4
	udivcc	%l1,	0x1F30,	%i4
	movrlez	%l2,	0x15B,	%o7
	movpos	%icc,	%o0,	%g6
	popc	0x145E,	%o3
	or	%g1,	%o2,	%l5
	umul	%l6,	%i3,	%o4
	fmovdgu	%xcc,	%f23,	%f1
	fcmple32	%f6,	%f24,	%i0
	srl	%g7,	%o6,	%g2
	edge16ln	%i1,	%i6,	%g3
	edge16	%g4,	%o5,	%i7
	srlx	%l0,	%i5,	%o1
	lduw	[%l7 + 0x78],	%g5
	fxnors	%f30,	%f5,	%f4
	alignaddrl	%l3,	%i2,	%l4
	addc	%l1,	0x1C14,	%l2
	xnorcc	%i4,	0x1089,	%o7
	xor	%g6,	%o3,	%g1
	fmul8ulx16	%f26,	%f16,	%f4
	subccc	%o0,	%o2,	%l5
	lduh	[%l7 + 0x30],	%i3
	sethi	0x1D57,	%l6
	nop
	set	0x68, %l1
	stx	%o4,	[%l7 + %l1]
	movne	%icc,	%i0,	%g7
	sir	0x1AA6
	orn	%g2,	%o6,	%i1
	for	%f22,	%f12,	%f4
	andn	%g3,	0x1E39,	%g4
	udivcc	%o5,	0x0946,	%i7
	srax	%i6,	%l0,	%i5
	edge16l	%o1,	%g5,	%i2
	array8	%l3,	%l1,	%l2
	save %i4, %o7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f28,	%f30
	addccc	%o3,	%g6,	%g1
	subcc	%o0,	0x0F1A,	%o2
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	andn	%o4,	%i0,	%g2
	srax	%g7,	%o6,	%i1
	fmovrslz	%g3,	%f22,	%f13
	fmovscs	%xcc,	%f2,	%f12
	ldx	[%l7 + 0x30],	%g4
	fmovsl	%icc,	%f30,	%f5
	umulcc	%i7,	%i6,	%l0
	sethi	0x112A,	%o5
	alignaddr	%o1,	%i5,	%g5
	xor	%i2,	0x1722,	%l3
	sdivcc	%l2,	0x0EF7,	%i4
	movcs	%xcc,	%o7,	%l4
	ld	[%l7 + 0x10],	%f19
	andncc	%o3,	%l1,	%g1
	movg	%icc,	%o0,	%g6
	movrgez	%l5,	%i3,	%l6
	xnor	%o4,	%o2,	%i0
	edge32ln	%g2,	%o6,	%g7
	nop
	set	0x36, %l3
	sth	%i1,	[%l7 + %l3]
	orn	%g4,	%g3,	%i7
	edge8l	%l0,	%o5,	%o1
	fpadd16	%f22,	%f2,	%f16
	xnorcc	%i5,	0x100B,	%i6
	sdivx	%i2,	0x1156,	%l3
	srlx	%l2,	%g5,	%i4
	fcmps	%fcc1,	%f29,	%f11
	std	%f2,	[%l7 + 0x28]
	sll	%o7,	0x09,	%o3
	edge16l	%l4,	%l1,	%o0
	movge	%xcc,	%g1,	%l5
	sdivcc	%g6,	0x1537,	%i3
	movleu	%xcc,	%l6,	%o2
	array16	%o4,	%g2,	%i0
	sub	%g7,	0x0969,	%i1
	stx	%o6,	[%l7 + 0x40]
	movrgz	%g3,	0x3ED,	%g4
	mulscc	%i7,	0x1299,	%l0
	movrlz	%o5,	0x325,	%o1
	popc	%i6,	%i5
	orncc	%i2,	0x1F5B,	%l2
	fmovsl	%xcc,	%f4,	%f19
	movn	%xcc,	%l3,	%g5
	fpsub32s	%f8,	%f31,	%f6
	nop
	set	0x30, %l2
	ldsh	[%l7 + %l2],	%i4
	smul	%o7,	%o3,	%l1
	edge32	%l4,	%o0,	%g1
	fmovrsgez	%g6,	%f11,	%f9
	smulcc	%l5,	%i3,	%l6
	fnor	%f18,	%f30,	%f8
	movgu	%icc,	%o4,	%g2
	xnorcc	%i0,	%g7,	%i1
	movneg	%icc,	%o2,	%g3
	movvs	%icc,	%o6,	%i7
	stx	%l0,	[%l7 + 0x78]
	udiv	%o5,	0x0FC5,	%g4
	array32	%i6,	%o1,	%i5
	popc	0x09F0,	%l2
	movrlz	%i2,	0x357,	%l3
	andcc	%g5,	%o7,	%o3
	movg	%icc,	%i4,	%l4
	ldsw	[%l7 + 0x78],	%o0
	edge16	%l1,	%g1,	%l5
	alignaddrl	%i3,	%l6,	%o4
	fmovsl	%xcc,	%f27,	%f14
	edge16l	%g6,	%i0,	%g7
	save %i1, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o2,	%o6,	%l0
	sllx	%o5,	%i7,	%i6
	edge32	%g4,	%o1,	%l2
	nop
	set	0x20, %o6
	std	%f28,	[%l7 + %o6]
	movn	%icc,	%i2,	%l3
	fmovsleu	%icc,	%f17,	%f20
	udivcc	%g5,	0x0F80,	%o7
	smul	%i5,	%o3,	%l4
	edge8	%o0,	%l1,	%i4
	edge8	%g1,	%l5,	%l6
	fxor	%f16,	%f18,	%f16
	edge16n	%i3,	%g6,	%i0
	ldx	[%l7 + 0x30],	%g7
	movvc	%icc,	%i1,	%g2
	fnegd	%f30,	%f8
	ldsh	[%l7 + 0x0A],	%o4
	mova	%xcc,	%g3,	%o6
	array32	%o2,	%o5,	%i7
	sdivcc	%l0,	0x16BE,	%i6
	mulx	%g4,	0x1137,	%o1
	fandnot2	%f30,	%f26,	%f16
	movn	%icc,	%i2,	%l2
	fmovsa	%xcc,	%f19,	%f26
	fmovsvc	%xcc,	%f22,	%f8
	restore %g5, 0x06C4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l3,	%o3
	fmul8sux16	%f20,	%f10,	%f12
	mulscc	%l4,	0x0F8A,	%i5
	move	%xcc,	%l1,	%i4
	fandnot2s	%f17,	%f2,	%f3
	nop
	set	0x48, %l0
	ldx	[%l7 + %l0],	%o0
	movvc	%icc,	%g1,	%l6
	stw	%l5,	[%l7 + 0x10]
	fmovdvc	%icc,	%f27,	%f2
	srl	%g6,	%i0,	%g7
	edge32ln	%i1,	%i3,	%g2
	movrlez	%o4,	0x050,	%o6
	addccc	%o2,	0x0C54,	%g3
	fmovrsgez	%o5,	%f20,	%f5
	edge32ln	%i7,	%i6,	%l0
	or	%g4,	%i2,	%o1
	sdivx	%l2,	0x19FE,	%o7
	and	%g5,	%l3,	%o3
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	andn	%i5,	0x175E,	%o0
	movneg	%xcc,	%i4,	%g1
	addccc	%l5,	0x0E2A,	%g6
	array16	%l6,	%i0,	%i1
	ldsw	[%l7 + 0x3C],	%i3
	fmovrslz	%g7,	%f4,	%f7
	fmovdne	%icc,	%f11,	%f7
	movg	%icc,	%g2,	%o4
	andncc	%o6,	%o2,	%g3
	nop
	set	0x48, %g1
	stx	%o5,	[%l7 + %g1]
	ldsh	[%l7 + 0x56],	%i7
	mova	%icc,	%l0,	%i6
	sdivcc	%i2,	0x1C64,	%g4
	edge8ln	%l2,	%o1,	%o7
	alignaddr	%g5,	%o3,	%l3
	fmovrsne	%l1,	%f1,	%f2
	lduh	[%l7 + 0x48],	%i5
	fxors	%f2,	%f19,	%f0
	fcmpne16	%f0,	%f30,	%o0
	sth	%i4,	[%l7 + 0x78]
	lduw	[%l7 + 0x18],	%g1
	addcc	%l5,	0x0949,	%g6
	movle	%xcc,	%l4,	%i0
	fmovdvs	%icc,	%f23,	%f13
	fornot2s	%f13,	%f5,	%f1
	edge16l	%l6,	%i1,	%g7
	xor	%g2,	0x1B93,	%i3
	alignaddrl	%o6,	%o4,	%o2
	fmuld8sux16	%f12,	%f11,	%f8
	fmul8sux16	%f26,	%f24,	%f30
	udivx	%o5,	0x0EA6,	%i7
	sdivcc	%g3,	0x1862,	%i6
	ldd	[%l7 + 0x38],	%i2
	lduh	[%l7 + 0x74],	%l0
	fabsd	%f4,	%f28
	lduw	[%l7 + 0x08],	%l2
	ldsw	[%l7 + 0x10],	%o1
	fcmpd	%fcc3,	%f0,	%f0
	array8	%o7,	%g5,	%g4
	sdiv	%o3,	0x1B45,	%l3
	st	%f6,	[%l7 + 0x28]
	fandnot2s	%f2,	%f1,	%f5
	subcc	%l1,	%o0,	%i4
	movgu	%icc,	%g1,	%l5
	fzero	%f14
	sll	%i5,	%g6,	%l4
	umul	%l6,	%i0,	%g7
	fmul8sux16	%f8,	%f0,	%f22
	andcc	%g2,	0x1002,	%i1
	movpos	%icc,	%i3,	%o4
	movge	%xcc,	%o2,	%o5
	std	%f18,	[%l7 + 0x18]
	mulx	%o6,	%g3,	%i7
	fmovrdne	%i2,	%f24,	%f0
	smulcc	%l0,	%i6,	%l2
	smul	%o7,	0x0556,	%g5
	andn	%g4,	%o3,	%l3
	andn	%l1,	%o1,	%i4
	lduh	[%l7 + 0x6C],	%o0
	edge8	%l5,	%g1,	%i5
	fone	%f30
	sllx	%l4,	0x12,	%g6
	sth	%i0,	[%l7 + 0x3C]
	srax	%g7,	%g2,	%i1
	fmovrde	%l6,	%f28,	%f8
	edge8l	%i3,	%o2,	%o4
	ldx	[%l7 + 0x40],	%o5
	fmovdge	%xcc,	%f29,	%f3
	array32	%o6,	%i7,	%i2
	movrlez	%g3,	0x2CD,	%l0
	movre	%i6,	0x2A6,	%l2
	edge32n	%o7,	%g4,	%o3
	edge16n	%l3,	%l1,	%o1
	edge8n	%g5,	%o0,	%l5
	fpackfix	%f8,	%f25
	lduw	[%l7 + 0x68],	%g1
	fcmpeq32	%f2,	%f28,	%i4
	ldsb	[%l7 + 0x71],	%l4
	ldsw	[%l7 + 0x7C],	%i5
	movvs	%xcc,	%g6,	%i0
	fandnot1	%f22,	%f26,	%f20
	movleu	%xcc,	%g7,	%i1
	fornot2s	%f26,	%f1,	%f29
	fsrc2s	%f30,	%f6
	edge32l	%l6,	%g2,	%i3
	fmovdvc	%xcc,	%f17,	%f23
	udivx	%o4,	0x142E,	%o5
	edge16	%o6,	%o2,	%i2
	array16	%g3,	%l0,	%i6
	sll	%i7,	%o7,	%g4
	xor	%l2,	0x1666,	%l3
	movpos	%xcc,	%l1,	%o1
	orcc	%g5,	%o3,	%l5
	addcc	%o0,	%i4,	%g1
	fornot2s	%f25,	%f23,	%f19
	fornot2s	%f4,	%f20,	%f8
	ldsh	[%l7 + 0x14],	%i5
	srlx	%g6,	%i0,	%l4
	or	%i1,	0x1CE9,	%g7
	movrlz	%g2,	%l6,	%i3
	fmovse	%icc,	%f29,	%f28
	movleu	%xcc,	%o5,	%o4
	lduh	[%l7 + 0x56],	%o6
	movvc	%icc,	%o2,	%g3
	udiv	%i2,	0x00E7,	%i6
	fmovsa	%icc,	%f15,	%f5
	sdiv	%l0,	0x1FF4,	%i7
	andn	%g4,	%l2,	%o7
	edge16ln	%l1,	%o1,	%l3
	andcc	%o3,	0x1465,	%l5
	edge16ln	%g5,	%o0,	%i4
	or	%i5,	%g6,	%i0
	fandnot2	%f2,	%f30,	%f6
	nop
	set	0x3C, %i4
	ldsh	[%l7 + %i4],	%l4
	edge16l	%g1,	%g7,	%g2
	fnot2s	%f23,	%f15
	movrlz	%i1,	%l6,	%i3
	umulcc	%o4,	%o5,	%o2
	orcc	%g3,	0x05C2,	%i2
	fmul8ulx16	%f4,	%f10,	%f10
	subcc	%i6,	0x07B3,	%o6
	array8	%l0,	%i7,	%g4
	movrlz	%l2,	0x3B8,	%o7
	movne	%xcc,	%l1,	%o1
	movge	%icc,	%o3,	%l5
	umulcc	%g5,	0x0D86,	%l3
	srl	%i4,	%o0,	%g6
	fmovrdgz	%i5,	%f14,	%f18
	fornot2	%f18,	%f6,	%f24
	ldd	[%l7 + 0x50],	%l4
	andn	%i0,	0x10A4,	%g1
	fornot2	%f20,	%f20,	%f24
	fors	%f2,	%f2,	%f3
	movvc	%xcc,	%g2,	%i1
	sethi	0x1BA4,	%l6
	edge32	%g7,	%i3,	%o4
	sllx	%o2,	%o5,	%i2
	movl	%xcc,	%i6,	%g3
	movle	%icc,	%l0,	%o6
	ldd	[%l7 + 0x30],	%f2
	move	%xcc,	%g4,	%i7
	fandnot1s	%f27,	%f11,	%f26
	fmovdg	%xcc,	%f25,	%f13
	movle	%icc,	%o7,	%l1
	udiv	%l2,	0x19D8,	%o3
	movrlez	%o1,	0x271,	%g5
	save %l5, %l3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o0,	%i5
	siam	0x0
	subc	%g6,	0x0D14,	%l4
	ldub	[%l7 + 0x7D],	%g1
	fpadd32s	%f0,	%f30,	%f9
	movl	%icc,	%g2,	%i1
	udiv	%i0,	0x16EA,	%l6
	edge8ln	%i3,	%o4,	%o2
	ldd	[%l7 + 0x38],	%g6
	edge16	%o5,	%i2,	%i6
	movrne	%l0,	%g3,	%g4
	add	%i7,	%o6,	%l1
	srlx	%l2,	%o7,	%o1
	movcs	%xcc,	%o3,	%g5
	sra	%l3,	0x16,	%l5
	mova	%icc,	%i4,	%i5
	ldub	[%l7 + 0x4E],	%g6
	andncc	%o0,	%g1,	%g2
	edge32ln	%l4,	%i1,	%l6
	fpadd32	%f10,	%f10,	%f16
	movre	%i3,	%i0,	%o2
	array16	%o4,	%o5,	%g7
	fmovsl	%icc,	%f30,	%f1
	movrne	%i6,	0x144,	%i2
	srlx	%g3,	%g4,	%i7
	udiv	%l0,	0x1A63,	%l1
	array32	%l2,	%o6,	%o7
	ldd	[%l7 + 0x68],	%f2
	xor	%o3,	0x0C27,	%o1
	fcmpeq16	%f26,	%f4,	%l3
	movrne	%l5,	%g5,	%i4
	andncc	%g6,	%i5,	%g1
	fcmps	%fcc0,	%f29,	%f18
	array8	%o0,	%l4,	%i1
	xnor	%g2,	%l6,	%i3
	ld	[%l7 + 0x68],	%f29
	movrne	%i0,	%o4,	%o2
	fors	%f14,	%f10,	%f1
	srax	%g7,	%o5,	%i2
	fcmps	%fcc1,	%f21,	%f30
	popc	0x0425,	%i6
	siam	0x3
	sdiv	%g3,	0x1E13,	%g4
	edge8	%l0,	%l1,	%i7
	sth	%l2,	[%l7 + 0x58]
	nop
	set	0x5A, %i3
	ldsb	[%l7 + %i3],	%o6
	sdiv	%o3,	0x0D18,	%o1
	movrne	%o7,	0x06E,	%l3
	ldub	[%l7 + 0x2F],	%g5
	movcc	%icc,	%l5,	%i4
	st	%f30,	[%l7 + 0x0C]
	ldub	[%l7 + 0x22],	%g6
	fmovde	%icc,	%f14,	%f2
	xorcc	%g1,	0x15FF,	%o0
	array16	%l4,	%i5,	%g2
	sll	%l6,	%i3,	%i1
	fsrc1	%f14,	%f26
	lduw	[%l7 + 0x38],	%o4
	addccc	%o2,	0x080A,	%g7
	movne	%xcc,	%i0,	%o5
	ldsw	[%l7 + 0x20],	%i2
	mulscc	%i6,	0x06B8,	%g3
	stw	%g4,	[%l7 + 0x28]
	alignaddrl	%l0,	%i7,	%l1
	edge8	%o6,	%l2,	%o1
	sdivcc	%o3,	0x0E29,	%o7
	edge16n	%l3,	%g5,	%l5
	edge16ln	%g6,	%g1,	%i4
	addcc	%l4,	%o0,	%i5
	ldsh	[%l7 + 0x64],	%l6
	std	%f8,	[%l7 + 0x48]
	st	%f17,	[%l7 + 0x50]
	movleu	%xcc,	%g2,	%i3
	addccc	%i1,	%o2,	%g7
	ld	[%l7 + 0x28],	%f18
	fnot2	%f30,	%f16
	fands	%f17,	%f31,	%f4
	movrne	%o4,	0x0E8,	%i0
	array16	%i2,	%o5,	%g3
	fmovrdgz	%i6,	%f14,	%f28
	edge8	%g4,	%l0,	%l1
	fcmpne32	%f18,	%f18,	%o6
	ldd	[%l7 + 0x78],	%l2
	add	%o1,	0x0451,	%o3
	sdivx	%i7,	0x06FE,	%o7
	ldd	[%l7 + 0x30],	%l2
	movrlez	%g5,	0x247,	%l5
	andn	%g6,	0x05FA,	%g1
	ld	[%l7 + 0x70],	%f29
	movn	%xcc,	%i4,	%l4
	fsrc1	%f10,	%f20
	add	%i5,	%l6,	%o0
	orcc	%i3,	0x07D8,	%i1
	fcmpd	%fcc0,	%f4,	%f24
	fcmpeq16	%f10,	%f20,	%g2
	udiv	%o2,	0x11C1,	%o4
	movrlez	%i0,	%g7,	%i2
	fmovrdlz	%g3,	%f30,	%f28
	sllx	%i6,	0x15,	%o5
	lduw	[%l7 + 0x08],	%l0
	edge8l	%g4,	%o6,	%l1
	movpos	%xcc,	%o1,	%o3
	udivcc	%i7,	0x0082,	%l2
	alignaddrl	%l3,	%o7,	%l5
	fmovdpos	%xcc,	%f29,	%f9
	array8	%g6,	%g1,	%i4
	fpsub16s	%f7,	%f9,	%f19
	sdivcc	%g5,	0x0772,	%i5
	fandnot2	%f28,	%f24,	%f2
	edge32n	%l4,	%l6,	%o0
	udivx	%i3,	0x12E1,	%i1
	movl	%xcc,	%o2,	%o4
	movneg	%icc,	%i0,	%g2
	sdiv	%g7,	0x1B99,	%g3
	movneg	%xcc,	%i2,	%o5
	fandnot2s	%f23,	%f4,	%f3
	movcc	%icc,	%l0,	%g4
	fmul8sux16	%f6,	%f30,	%f0
	st	%f23,	[%l7 + 0x34]
	stb	%i6,	[%l7 + 0x40]
	fmul8x16au	%f31,	%f20,	%f28
	srl	%o6,	0x1C,	%l1
	edge32n	%o3,	%o1,	%i7
	ldsb	[%l7 + 0x5D],	%l2
	sir	0x1854
	fmovrdne	%o7,	%f22,	%f18
	array16	%l3,	%l5,	%g1
	faligndata	%f22,	%f18,	%f24
	orncc	%i4,	0x0811,	%g6
	or	%g5,	%l4,	%l6
	or	%o0,	%i5,	%i1
	edge16l	%o2,	%i3,	%i0
	subc	%o4,	%g2,	%g7
	edge8l	%g3,	%i2,	%o5
	fmovdneg	%xcc,	%f6,	%f5
	subcc	%g4,	%l0,	%o6
	movrne	%l1,	%o3,	%o1
	movrgz	%i6,	%l2,	%o7
	sth	%l3,	[%l7 + 0x52]
	fmovdgu	%xcc,	%f22,	%f30
	fcmpeq32	%f28,	%f8,	%i7
	std	%f4,	[%l7 + 0x70]
	andncc	%l5,	%i4,	%g1
	fzero	%f22
	orn	%g6,	%g5,	%l4
	fmovs	%f20,	%f30
	movrlz	%o0,	0x169,	%l6
	std	%f16,	[%l7 + 0x68]
	smul	%i1,	0x09FE,	%o2
	addc	%i3,	%i5,	%i0
	fmul8sux16	%f0,	%f18,	%f14
	edge16l	%g2,	%o4,	%g7
	edge8ln	%g3,	%o5,	%g4
	fmovscc	%icc,	%f25,	%f5
	orn	%i2,	0x02A6,	%o6
	umul	%l0,	%o3,	%o1
	fxor	%f0,	%f30,	%f14
	ldd	[%l7 + 0x40],	%l0
	movrgez	%i6,	0x05B,	%o7
	orncc	%l3,	0x1CD0,	%l2
	movg	%icc,	%i7,	%i4
	edge16l	%l5,	%g1,	%g5
	movcc	%xcc,	%l4,	%g6
	popc	0x19CA,	%o0
	movrgz	%l6,	%o2,	%i3
	fmovdleu	%icc,	%f20,	%f8
	fmovrsne	%i1,	%f8,	%f16
	srlx	%i5,	%g2,	%o4
	ldub	[%l7 + 0x34],	%g7
	edge32ln	%g3,	%o5,	%g4
	ldd	[%l7 + 0x18],	%i2
	stb	%o6,	[%l7 + 0x71]
	popc	0x1FC9,	%l0
	ldsb	[%l7 + 0x1B],	%o3
	fmovda	%xcc,	%f29,	%f15
	sdiv	%i0,	0x165A,	%l1
	edge8	%i6,	%o1,	%l3
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%l2
	stx	%o7,	[%l7 + 0x20]
	edge16l	%i4,	%i7,	%g1
	ldsb	[%l7 + 0x3C],	%g5
	ldx	[%l7 + 0x78],	%l5
	addcc	%g6,	0x172D,	%o0
	edge8	%l6,	%o2,	%l4
	fmul8x16au	%f26,	%f14,	%f22
	sdiv	%i1,	0x01B9,	%i5
	popc	%g2,	%o4
	smul	%g7,	0x10A9,	%i3
	mova	%xcc,	%g3,	%g4
	edge8n	%i2,	%o6,	%l0
	popc	0x1279,	%o5
	fmul8x16	%f21,	%f24,	%f20
	fsrc1	%f20,	%f12
	umulcc	%i0,	%o3,	%l1
	fcmple16	%f2,	%f6,	%o1
	stx	%l3,	[%l7 + 0x10]
	nop
	set	0x48, %g2
	std	%f6,	[%l7 + %g2]
	edge16ln	%i6,	%l2,	%i4
	edge8n	%o7,	%g1,	%i7
	popc	%l5,	%g6
	or	%g5,	%l6,	%o0
	ldsh	[%l7 + 0x6C],	%l4
	movvs	%xcc,	%i1,	%i5
	orn	%g2,	0x062A,	%o4
	smul	%g7,	%i3,	%g3
	movleu	%xcc,	%o2,	%g4
	alignaddrl	%i2,	%l0,	%o5
	restore %i0, %o3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o1,	%l1
	ldd	[%l7 + 0x18],	%i6
	srax	%l3,	0x1E,	%l2
	movvs	%icc,	%i4,	%g1
	movcc	%icc,	%i7,	%o7
	lduh	[%l7 + 0x12],	%l5
	sra	%g6,	0x09,	%g5
	edge32l	%o0,	%l4,	%l6
	save %i5, %i1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o4,	%i3
	save %g7, 0x0D7C, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x32],	%g4
	movcs	%xcc,	%i2,	%g3
	orn	%o5,	0x0DED,	%l0
	sdiv	%i0,	0x0CA2,	%o3
	fcmpne16	%f0,	%f30,	%o6
	movrgz	%l1,	%o1,	%i6
	mulscc	%l3,	%l2,	%g1
	edge16ln	%i7,	%o7,	%l5
	edge16	%g6,	%i4,	%g5
	fmovrsne	%l4,	%f2,	%f20
	xnorcc	%o0,	0x0F95,	%l6
	stw	%i1,	[%l7 + 0x3C]
	movrgz	%g2,	%o4,	%i5
	movcs	%icc,	%g7,	%i3
	movrgz	%o2,	0x234,	%i2
	ldsb	[%l7 + 0x3F],	%g3
	andcc	%o5,	0x1D1D,	%l0
	alignaddrl	%i0,	%o3,	%g4
	ld	[%l7 + 0x28],	%f12
	subc	%o6,	0x10E6,	%l1
	edge16	%o1,	%i6,	%l3
	move	%xcc,	%g1,	%i7
	movcc	%icc,	%l2,	%o7
	orncc	%g6,	0x19BD,	%i4
	andn	%g5,	0x08CC,	%l4
	sra	%l5,	0x07,	%o0
	srax	%i1,	0x14,	%l6
	srax	%g2,	%i5,	%g7
	stw	%o4,	[%l7 + 0x70]
	movg	%icc,	%i3,	%o2
	edge32l	%i2,	%g3,	%l0
	edge16l	%i0,	%o5,	%o3
	or	%g4,	%l1,	%o1
	movre	%o6,	0x14A,	%l3
	addc	%g1,	0x0E3F,	%i6
	xor	%l2,	%i7,	%g6
	ld	[%l7 + 0x54],	%f21
	array16	%i4,	%o7,	%l4
	std	%f18,	[%l7 + 0x38]
	xorcc	%g5,	%l5,	%i1
	movvc	%icc,	%l6,	%o0
	sethi	0x1988,	%i5
	movg	%xcc,	%g7,	%o4
	nop
	set	0x3F, %l4
	stb	%g2,	[%l7 + %l4]
	smul	%o2,	%i2,	%i3
	movrgez	%g3,	%i0,	%l0
	umul	%o3,	0x152E,	%g4
	fmovdpos	%xcc,	%f28,	%f18
	array32	%l1,	%o5,	%o1
	and	%o6,	%l3,	%i6
	fabsd	%f24,	%f30
	fcmpes	%fcc3,	%f13,	%f14
	fornot1	%f26,	%f8,	%f14
	edge8n	%g1,	%l2,	%g6
	alignaddr	%i7,	%o7,	%i4
	ldd	[%l7 + 0x08],	%f4
	mulscc	%l4,	%g5,	%i1
	sdivcc	%l6,	0x1D04,	%o0
	edge8l	%i5,	%g7,	%o4
	addccc	%g2,	%l5,	%o2
	movle	%xcc,	%i3,	%g3
	udivx	%i2,	0x1A56,	%i0
	fmovrdlez	%l0,	%f22,	%f18
	umul	%g4,	0x060A,	%l1
	ldub	[%l7 + 0x68],	%o3
	std	%f10,	[%l7 + 0x28]
	movne	%xcc,	%o5,	%o6
	addccc	%o1,	%i6,	%g1
	edge32	%l2,	%l3,	%i7
	udivx	%g6,	0x1F5A,	%i4
	orcc	%o7,	%l4,	%i1
	movcs	%xcc,	%g5,	%l6
	sdivcc	%o0,	0x0DBF,	%i5
	ld	[%l7 + 0x60],	%f13
	popc	%o4,	%g2
	orn	%g7,	%o2,	%l5
	movgu	%xcc,	%i3,	%i2
	stx	%i0,	[%l7 + 0x38]
	nop
	set	0x5E, %g3
	stb	%l0,	[%l7 + %g3]
	fornot2	%f6,	%f30,	%f30
	movle	%xcc,	%g4,	%g3
	fcmpgt16	%f18,	%f30,	%l1
	movpos	%icc,	%o5,	%o3
	pdist	%f12,	%f14,	%f18
	subccc	%o1,	%o6,	%i6
	movn	%xcc,	%l2,	%l3
	fsrc1s	%f15,	%f25
	movleu	%xcc,	%i7,	%g6
	orncc	%i4,	0x1556,	%o7
	smulcc	%g1,	%i1,	%l4
	movvs	%icc,	%l6,	%o0
	fpsub32s	%f3,	%f9,	%f6
	fpack32	%f2,	%f8,	%f18
	movg	%xcc,	%i5,	%o4
	movge	%xcc,	%g5,	%g2
	or	%o2,	%g7,	%i3
	fmovrslez	%i2,	%f22,	%f0
	fmovrdgez	%l5,	%f26,	%f22
	array16	%l0,	%g4,	%i0
	fxor	%f2,	%f22,	%f12
	xorcc	%l1,	%o5,	%o3
	fmovdpos	%xcc,	%f30,	%f17
	xor	%o1,	0x0392,	%g3
	umulcc	%o6,	%l2,	%i6
	fnot1s	%f19,	%f30
	sllx	%i7,	0x12,	%l3
	movleu	%xcc,	%i4,	%g6
	fmovdleu	%icc,	%f1,	%f14
	xor	%o7,	0x1112,	%g1
	sth	%l4,	[%l7 + 0x5E]
	addcc	%l6,	0x186F,	%i1
	lduh	[%l7 + 0x32],	%o0
	addc	%o4,	%i5,	%g2
	movcc	%icc,	%o2,	%g7
	fpsub32s	%f12,	%f22,	%f5
	edge32n	%g5,	%i3,	%l5
	movrlz	%l0,	0x0A8,	%i2
	movpos	%icc,	%g4,	%i0
	fpsub16	%f26,	%f30,	%f10
	andn	%o5,	0x0EBC,	%o3
	movne	%icc,	%l1,	%g3
	fpsub32s	%f15,	%f27,	%f18
	fmovspos	%xcc,	%f9,	%f4
	ldsb	[%l7 + 0x70],	%o1
	smulcc	%l2,	0x1DE0,	%o6
	edge16ln	%i7,	%i6,	%i4
	udivx	%l3,	0x1555,	%o7
	edge8n	%g6,	%l4,	%g1
	xor	%i1,	%o0,	%l6
	andn	%i5,	0x0EE2,	%g2
	movcs	%icc,	%o4,	%g7
	sub	%g5,	0x0E8A,	%o2
	add	%l5,	0x0787,	%i3
	smulcc	%l0,	0x0D77,	%g4
	xorcc	%i2,	0x0B5B,	%o5
	fmovda	%xcc,	%f28,	%f11
	movrgz	%o3,	0x362,	%l1
	edge16	%i0,	%o1,	%g3
	addc	%l2,	%o6,	%i6
	fmovdneg	%icc,	%f7,	%f3
	movneg	%xcc,	%i7,	%l3
	lduh	[%l7 + 0x14],	%i4
	movgu	%xcc,	%g6,	%o7
	fmovsleu	%xcc,	%f30,	%f13
	movn	%icc,	%g1,	%l4
	sdivx	%i1,	0x16BB,	%o0
	xnor	%l6,	0x0BA2,	%i5
	array32	%o4,	%g2,	%g7
	umul	%o2,	%l5,	%i3
	subccc	%g5,	%g4,	%l0
	movvs	%icc,	%o5,	%i2
	udivcc	%l1,	0x1826,	%i0
	move	%xcc,	%o1,	%o3
	ldub	[%l7 + 0x73],	%g3
	move	%icc,	%o6,	%i6
	fpack32	%f6,	%f16,	%f22
	udivcc	%l2,	0x1834,	%i7
	stx	%l3,	[%l7 + 0x28]
	movne	%icc,	%g6,	%i4
	andncc	%g1,	%l4,	%i1
	movrgz	%o0,	%o7,	%l6
	orncc	%i5,	%o4,	%g2
	fmovdleu	%xcc,	%f7,	%f11
	movleu	%icc,	%o2,	%l5
	xnorcc	%i3,	0x12EA,	%g7
	fmovdne	%icc,	%f28,	%f15
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	movvs	%icc,	%i2,	%g5
	subccc	%i0,	0x151F,	%o1
	edge8	%o3,	%g3,	%l1
	and	%i6,	%o6,	%l2
	udivcc	%l3,	0x13BB,	%g6
	edge32ln	%i4,	%g1,	%i7
	sra	%l4,	0x08,	%o0
	edge16ln	%i1,	%o7,	%l6
	fornot1	%f16,	%f30,	%f20
	edge16	%i5,	%o4,	%g2
	sllx	%l5,	0x10,	%i3
	ldx	[%l7 + 0x68],	%o2
	alignaddr	%g4,	%l0,	%g7
	fornot2	%f4,	%f28,	%f12
	smulcc	%i2,	%o5,	%i0
	fpackfix	%f14,	%f26
	movcs	%icc,	%o1,	%o3
	mova	%xcc,	%g5,	%l1
	subccc	%g3,	0x05BD,	%o6
	addcc	%l2,	%l3,	%g6
	edge8n	%i4,	%g1,	%i7
	fpadd16	%f16,	%f24,	%f16
	ld	[%l7 + 0x08],	%f17
	fmovrdgz	%i6,	%f2,	%f20
	sir	0x19A5
	fxor	%f0,	%f2,	%f24
	alignaddr	%o0,	%l4,	%i1
	edge16l	%l6,	%o7,	%o4
	subc	%g2,	%i5,	%i3
	addcc	%l5,	%g4,	%l0
	fmovrdlz	%g7,	%f14,	%f0
	xor	%o2,	0x1D70,	%i2
	movl	%icc,	%i0,	%o5
	edge8l	%o1,	%o3,	%g5
	edge8ln	%g3,	%o6,	%l1
	movgu	%xcc,	%l2,	%l3
	fornot2s	%f30,	%f21,	%f6
	sdiv	%g6,	0x020B,	%i4
	fmovdge	%icc,	%f25,	%f1
	fmul8x16au	%f30,	%f19,	%f22
	sra	%i7,	0x05,	%i6
	movleu	%icc,	%o0,	%l4
	udiv	%i1,	0x0ED4,	%g1
	movne	%xcc,	%l6,	%o4
	addcc	%g2,	%i5,	%i3
	srax	%o7,	0x1E,	%l5
	nop
	set	0x60, %o4
	std	%f22,	[%l7 + %o4]
	movrlez	%g4,	%g7,	%l0
	restore %o2, %i2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%i0,	%o1
	orcc	%g5,	%o3,	%o6
	srlx	%l1,	0x02,	%g3
	edge16n	%l3,	%g6,	%i4
	udiv	%i7,	0x1692,	%i6
	subccc	%o0,	0x0189,	%l4
	edge32	%l2,	%i1,	%g1
	stb	%o4,	[%l7 + 0x4D]
	edge16n	%g2,	%i5,	%i3
	subc	%o7,	%l6,	%g4
	stx	%l5,	[%l7 + 0x40]
	addc	%g7,	%l0,	%i2
	andn	%o5,	0x00CF,	%o2
	mulscc	%o1,	%g5,	%o3
	and	%o6,	%i0,	%l1
	movrlez	%l3,	%g3,	%i4
	edge16ln	%i7,	%g6,	%i6
	array16	%l4,	%o0,	%i1
	udivx	%l2,	0x09DD,	%o4
	addccc	%g2,	%g1,	%i3
	fmovsne	%xcc,	%f18,	%f18
	movvc	%icc,	%i5,	%l6
	fmovdgu	%xcc,	%f30,	%f23
	nop
	set	0x1C, %i0
	lduh	[%l7 + %i0],	%o7
	movrlez	%g4,	0x103,	%l5
	sub	%g7,	0x159C,	%i2
	fmovsl	%xcc,	%f12,	%f3
	movrlez	%l0,	%o5,	%o1
	sdivcc	%o2,	0x1E3D,	%g5
	sub	%o3,	0x13FB,	%o6
	umulcc	%i0,	0x091F,	%l3
	sra	%l1,	0x08,	%i4
	array8	%g3,	%g6,	%i6
	fmovdvs	%xcc,	%f14,	%f24
	ldd	[%l7 + 0x78],	%l4
	orn	%i7,	0x0C20,	%o0
	and	%l2,	0x1215,	%i1
	array16	%g2,	%o4,	%i3
	fxors	%f27,	%f8,	%f3
	addcc	%i5,	0x0CE8,	%l6
	edge8ln	%o7,	%g4,	%g1
	sth	%g7,	[%l7 + 0x64]
	movge	%icc,	%i2,	%l5
	subc	%l0,	0x009F,	%o1
	orncc	%o2,	%o5,	%o3
	movre	%o6,	%i0,	%g5
	array32	%l1,	%l3,	%g3
	fmovrslz	%i4,	%f6,	%f18
	st	%f23,	[%l7 + 0x78]
	popc	0x1756,	%g6
	fmovrsgz	%l4,	%f7,	%f12
	edge32l	%i7,	%i6,	%l2
	fexpand	%f23,	%f14
	ldd	[%l7 + 0x48],	%f12
	for	%f22,	%f24,	%f20
	fmovsa	%icc,	%f24,	%f25
	pdist	%f24,	%f12,	%f14
	mulscc	%i1,	%o0,	%o4
	movl	%icc,	%g2,	%i3
	udiv	%l6,	0x049D,	%o7
	edge16ln	%i5,	%g4,	%g1
	ldd	[%l7 + 0x60],	%f8
	alignaddr	%g7,	%l5,	%i2
	xorcc	%o1,	%o2,	%o5
	alignaddrl	%o3,	%o6,	%i0
	fnot1s	%f19,	%f31
	sth	%g5,	[%l7 + 0x78]
	ldsh	[%l7 + 0x6A],	%l1
	lduw	[%l7 + 0x74],	%l3
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	sth	%g6,	[%l7 + 0x18]
	fmovsge	%icc,	%f9,	%f2
	edge8n	%i7,	%l4,	%l2
	sth	%i1,	[%l7 + 0x4C]
	movneg	%icc,	%o0,	%i6
	fnegs	%f16,	%f17
	move	%icc,	%o4,	%g2
	sethi	0x199A,	%i3
	array8	%l6,	%o7,	%i5
	smul	%g1,	%g7,	%l5
	fmovscc	%xcc,	%f8,	%f20
	save %g4, %o1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o5,	%o3
	fzeros	%f4
	sra	%o2,	%i0,	%g5
	edge16ln	%l1,	%l3,	%l0
	fxors	%f0,	%f11,	%f11
	addccc	%o6,	%i4,	%g6
	andcc	%g3,	%i7,	%l2
	movcs	%xcc,	%i1,	%o0
	fandnot1s	%f22,	%f30,	%f31
	edge16	%l4,	%i6,	%g2
	sethi	0x1F31,	%i3
	sdiv	%o4,	0x0FB6,	%l6
	fmovsvs	%icc,	%f29,	%f9
	andn	%o7,	%i5,	%g1
	mova	%icc,	%g7,	%l5
	movgu	%xcc,	%o1,	%g4
	srax	%i2,	0x09,	%o5
	fmovdge	%icc,	%f9,	%f17
	nop
	set	0x43, %o7
	ldub	[%l7 + %o7],	%o2
	sll	%o3,	0x09,	%i0
	move	%icc,	%l1,	%g5
	umul	%l0,	%l3,	%i4
	fsrc1s	%f31,	%f22
	edge16ln	%g6,	%o6,	%i7
	andncc	%l2,	%g3,	%i1
	movg	%xcc,	%o0,	%i6
	edge16n	%l4,	%i3,	%g2
	move	%icc,	%l6,	%o4
	ldd	[%l7 + 0x08],	%i4
	ldsh	[%l7 + 0x42],	%o7
	movneg	%icc,	%g7,	%g1
	sir	0x01F6
	fones	%f18
	edge32	%o1,	%g4,	%l5
	edge32	%o5,	%o2,	%o3
	ldsb	[%l7 + 0x73],	%i2
	std	%f16,	[%l7 + 0x58]
	xnorcc	%l1,	%g5,	%i0
	umulcc	%l0,	%l3,	%i4
	fmovdl	%xcc,	%f20,	%f21
	movgu	%xcc,	%g6,	%o6
	movle	%icc,	%i7,	%g3
	fcmpgt32	%f20,	%f6,	%i1
	xnorcc	%l2,	0x0491,	%o0
	fsrc1s	%f11,	%f14
	sdivcc	%l4,	0x0C8D,	%i6
	srax	%i3,	%g2,	%o4
	fornot1	%f16,	%f18,	%f30
	sdivcc	%l6,	0x0985,	%o7
	lduh	[%l7 + 0x70],	%i5
	edge16ln	%g1,	%o1,	%g7
	edge32ln	%l5,	%o5,	%g4
	fmovdneg	%icc,	%f3,	%f16
	xor	%o2,	%i2,	%l1
	nop
	set	0x40, %i5
	ldub	[%l7 + %i5],	%o3
	movrgez	%g5,	0x2E9,	%i0
	sll	%l0,	%i4,	%l3
	andn	%o6,	0x0472,	%i7
	add	%g6,	0x11FA,	%g3
	movn	%icc,	%i1,	%o0
	movle	%icc,	%l2,	%l4
	addc	%i3,	0x1D60,	%g2
	sdivx	%i6,	0x0A95,	%o4
	fmovrdgez	%o7,	%f26,	%f26
	ldub	[%l7 + 0x2B],	%l6
	fmovsvc	%xcc,	%f22,	%f1
	movrlez	%i5,	0x028,	%o1
	movpos	%icc,	%g1,	%l5
	movge	%xcc,	%o5,	%g4
	movn	%icc,	%o2,	%i2
	umulcc	%g7,	0x127B,	%o3
	ldd	[%l7 + 0x18],	%f8
	fmovda	%xcc,	%f0,	%f23
	st	%f0,	[%l7 + 0x10]
	for	%f18,	%f18,	%f0
	udiv	%g5,	0x1F1D,	%l1
	xorcc	%i0,	0x0957,	%l0
	edge32	%l3,	%o6,	%i4
	andncc	%i7,	%g3,	%g6
	fmovdvc	%icc,	%f7,	%f17
	udivcc	%o0,	0x0C19,	%l2
	save %i1, %i3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i6,	%l4,	%o4
	alignaddr	%o7,	%l6,	%i5
	addccc	%o1,	0x1629,	%l5
	movneg	%xcc,	%g1,	%o5
	sra	%o2,	%g4,	%g7
	fmovrdlez	%i2,	%f2,	%f2
	movgu	%xcc,	%g5,	%l1
	fmovscs	%icc,	%f17,	%f14
	movge	%icc,	%o3,	%i0
	fmovsgu	%xcc,	%f31,	%f12
	ld	[%l7 + 0x4C],	%f28
	movg	%xcc,	%l3,	%o6
	orn	%i4,	0x1949,	%i7
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%l0
	edge32n	%g6,	%g3,	%l2
	array32	%i1,	%o0,	%i3
	popc	%i6,	%l4
	add	%o4,	%g2,	%l6
	addccc	%i5,	0x1898,	%o1
	fnot2	%f18,	%f8
	movre	%l5,	%g1,	%o5
	addcc	%o7,	%g4,	%o2
	fnands	%f31,	%f10,	%f27
	array8	%i2,	%g5,	%l1
	xor	%o3,	0x1D2D,	%g7
	fnot2s	%f11,	%f23
	fmovdge	%xcc,	%f1,	%f11
	array32	%i0,	%l3,	%o6
	fnegd	%f0,	%f12
	xorcc	%i4,	%l0,	%i7
	movcc	%xcc,	%g3,	%g6
	orn	%l2,	%o0,	%i1
	srl	%i6,	0x09,	%l4
	ldub	[%l7 + 0x1E],	%o4
	xnorcc	%i3,	%g2,	%i5
	movneg	%icc,	%o1,	%l6
	restore %l5, %g1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g4,	%o5,	%o2
	std	%f18,	[%l7 + 0x48]
	movpos	%xcc,	%i2,	%l1
	edge16l	%g5,	%o3,	%g7
	movleu	%icc,	%l3,	%o6
	edge8l	%i4,	%i0,	%l0
	edge16n	%g3,	%g6,	%l2
	orncc	%o0,	%i7,	%i6
	nop
	set	0x56, %l6
	lduh	[%l7 + %l6],	%l4
	fmovd	%f16,	%f8
	array32	%i1,	%o4,	%i3
	alignaddrl	%i5,	%g2,	%o1
	std	%f14,	[%l7 + 0x58]
	movrlz	%l5,	0x2CC,	%l6
	fxnor	%f4,	%f24,	%f26
	edge16ln	%o7,	%g4,	%o5
	fcmple32	%f28,	%f26,	%g1
	or	%o2,	0x1010,	%l1
	movleu	%icc,	%i2,	%o3
	fsrc1	%f10,	%f22
	fandnot1	%f22,	%f12,	%f8
	movl	%xcc,	%g7,	%g5
	ldsh	[%l7 + 0x62],	%o6
	movneg	%xcc,	%i4,	%i0
	movleu	%xcc,	%l0,	%l3
	movcc	%icc,	%g6,	%l2
	edge8n	%g3,	%o0,	%i6
	mova	%icc,	%i7,	%l4
	ldsb	[%l7 + 0x24],	%o4
	fcmpd	%fcc3,	%f26,	%f30
	fnot1	%f24,	%f18
	movrgz	%i3,	%i1,	%i5
	ldx	[%l7 + 0x38],	%o1
	sra	%l5,	%l6,	%g2
	movn	%xcc,	%g4,	%o7
	movle	%icc,	%o5,	%o2
	orncc	%g1,	0x1B61,	%l1
	save %o3, %g7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o6,	%i2
	orncc	%i0,	0x092F,	%i4
	save %l0, 0x170D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l2,	%l3,	%g3
	movne	%xcc,	%o0,	%i6
	movleu	%xcc,	%i7,	%o4
	fpackfix	%f16,	%f4
	orn	%l4,	%i3,	%i5
	sra	%i1,	0x08,	%l5
	fpack32	%f0,	%f20,	%f22
	move	%xcc,	%l6,	%g2
	movrlz	%g4,	%o7,	%o1
	udiv	%o2,	0x15C0,	%g1
	udiv	%l1,	0x1212,	%o5
	fmovrsgz	%o3,	%f10,	%f31
	ldx	[%l7 + 0x40],	%g7
	subcc	%g5,	0x087C,	%o6
	fnor	%f22,	%f4,	%f24
	udiv	%i0,	0x000C,	%i4
	ldsw	[%l7 + 0x34],	%i2
	movvs	%xcc,	%l0,	%l2
	edge8	%g6,	%l3,	%o0
	udiv	%g3,	0x0A70,	%i7
	lduw	[%l7 + 0x14],	%i6
	fnand	%f20,	%f22,	%f22
	and	%l4,	0x1EB7,	%o4
	fmovsle	%xcc,	%f9,	%f7
	movn	%icc,	%i5,	%i3
	std	%f12,	[%l7 + 0x28]
	ldub	[%l7 + 0x1A],	%i1
	xorcc	%l5,	%g2,	%l6
	umul	%o7,	0x1FC2,	%g4
	edge8n	%o1,	%g1,	%o2
	andn	%o5,	%o3,	%g7
	sll	%l1,	%o6,	%i0
	fmovdneg	%icc,	%f19,	%f8
	movvs	%xcc,	%i4,	%i2
	fpsub32	%f24,	%f6,	%f12
	fabsd	%f28,	%f28
	edge16	%l0,	%g5,	%g6
	fcmple16	%f14,	%f14,	%l3
	addc	%o0,	%g3,	%l2
	fors	%f4,	%f6,	%f11
	subcc	%i6,	0x1620,	%l4
	srax	%o4,	0x18,	%i7
	fpsub16	%f10,	%f10,	%f12
	ld	[%l7 + 0x78],	%f16
	sethi	0x0866,	%i5
	mulscc	%i1,	0x1CE6,	%l5
	fnot1s	%f20,	%f31
	ldsh	[%l7 + 0x20],	%g2
	fmovsvs	%xcc,	%f1,	%f22
	st	%f14,	[%l7 + 0x50]
	ldd	[%l7 + 0x18],	%f2
	subcc	%i3,	0x0B08,	%o7
	xorcc	%g4,	%o1,	%l6
	fxnor	%f0,	%f8,	%f10
	fpsub16	%f10,	%f28,	%f18
	movle	%icc,	%o2,	%o5
	movrlz	%o3,	0x18E,	%g7
	fmovscs	%xcc,	%f14,	%f29
	fpmerge	%f20,	%f10,	%f16
	ldx	[%l7 + 0x60],	%l1
	fmul8x16al	%f27,	%f3,	%f12
	fmovsvs	%icc,	%f17,	%f4
	fnot1	%f10,	%f30
	fone	%f26
	edge16n	%o6,	%i0,	%i4
	subc	%g1,	%i2,	%l0
	stx	%g6,	[%l7 + 0x38]
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	edge8ln	%g3,	%o0,	%i6
	for	%f16,	%f12,	%f26
	sethi	0x02AE,	%l4
	udiv	%l2,	0x05B8,	%o4
	umul	%i5,	0x1238,	%i7
	fmovrdlz	%i1,	%f16,	%f16
	fmovrsgz	%g2,	%f27,	%f16
	subcc	%l5,	%o7,	%i3
	lduw	[%l7 + 0x24],	%o1
	sdivcc	%l6,	0x1DFA,	%o2
	movne	%xcc,	%o5,	%g4
	edge8n	%o3,	%l1,	%g7
	fnegd	%f28,	%f16
	fmovrslz	%i0,	%f2,	%f9
	fmovrdlz	%i4,	%f8,	%f26
	sll	%g1,	%i2,	%l0
	movgu	%xcc,	%g6,	%g5
	xnor	%l3,	%g3,	%o6
	edge32l	%i6,	%l4,	%o0
	movg	%xcc,	%o4,	%l2
	restore %i5, %i7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l5,	%g2
	umul	%o7,	%o1,	%l6
	andncc	%o2,	%i3,	%o5
	alignaddrl	%o3,	%l1,	%g7
	edge8l	%g4,	%i4,	%g1
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	movvs	%icc,	%l0,	%g5
	udivcc	%g3,	0x0200,	%l3
	fsrc2s	%f29,	%f8
	udivx	%o6,	0x1D8D,	%i6
	fornot2	%f24,	%f8,	%f12
	xnorcc	%o0,	0x07F4,	%o4
	popc	0x0D17,	%l4
	ldsw	[%l7 + 0x54],	%l2
	edge16n	%i5,	%i7,	%l5
	ldub	[%l7 + 0x77],	%g2
	xorcc	%o7,	%o1,	%l6
	fnors	%f18,	%f2,	%f6
	sra	%o2,	0x08,	%i3
	sdivx	%i1,	0x1401,	%o5
	fexpand	%f30,	%f30
	sllx	%l1,	0x06,	%o3
	movpos	%xcc,	%g7,	%i4
	ldsh	[%l7 + 0x36],	%g1
	sdivcc	%g4,	0x0714,	%i2
	lduh	[%l7 + 0x6C],	%i0
	sllx	%l0,	%g5,	%g6
	xnor	%g3,	0x1675,	%o6
	ldub	[%l7 + 0x11],	%l3
	umulcc	%i6,	0x1F92,	%o0
	alignaddr	%o4,	%l4,	%i5
	edge16	%l2,	%l5,	%i7
	edge8ln	%g2,	%o7,	%o1
	fcmpeq16	%f4,	%f18,	%o2
	fnot1	%f0,	%f0
	movn	%icc,	%l6,	%i3
	movgu	%icc,	%i1,	%l1
	movne	%xcc,	%o3,	%o5
	movg	%xcc,	%g7,	%i4
	edge8	%g4,	%g1,	%i0
	umul	%i2,	%l0,	%g6
	sllx	%g5,	%o6,	%l3
	movge	%xcc,	%g3,	%o0
	fmovsleu	%icc,	%f13,	%f12
	andcc	%i6,	0x107F,	%o4
	fmovrslez	%i5,	%f0,	%f28
	sub	%l2,	0x0D79,	%l5
	ldx	[%l7 + 0x78],	%i7
	srax	%l4,	0x0E,	%o7
	fpackfix	%f16,	%f16
	edge16ln	%g2,	%o2,	%l6
	sdivx	%o1,	0x0182,	%i3
	movvc	%xcc,	%i1,	%o3
	movrgz	%o5,	%l1,	%i4
	fornot1s	%f16,	%f14,	%f10
	movrgez	%g4,	%g7,	%i0
	save %g1, 0x1316, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g6,	0x15EC,	%g5
	sethi	0x1EC5,	%o6
	mova	%icc,	%l3,	%l0
	fpmerge	%f28,	%f31,	%f28
	orncc	%o0,	0x0500,	%g3
	lduh	[%l7 + 0x5E],	%i6
	fand	%f18,	%f2,	%f14
	subccc	%o4,	0x0E93,	%i5
	edge8n	%l5,	%l2,	%i7
	fcmpne16	%f8,	%f18,	%o7
	movrlz	%l4,	%o2,	%g2
	movl	%icc,	%o1,	%l6
	xor	%i1,	%i3,	%o3
	sub	%o5,	0x0D11,	%i4
	udiv	%g4,	0x0285,	%l1
	mova	%xcc,	%g7,	%g1
	mulx	%i0,	%i2,	%g5
	sub	%o6,	%g6,	%l3
	ldsw	[%l7 + 0x3C],	%l0
	fmul8x16al	%f14,	%f24,	%f8
	fmovda	%icc,	%f21,	%f7
	stb	%g3,	[%l7 + 0x7F]
	movrlz	%i6,	%o4,	%o0
	save %l5, %l2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%i5,	%o7
	ldsh	[%l7 + 0x28],	%o2
	sll	%g2,	0x0D,	%l4
	edge16ln	%l6,	%o1,	%i1
	fmovdneg	%xcc,	%f16,	%f21
	addc	%o3,	0x031B,	%o5
	edge32	%i4,	%i3,	%l1
	edge8	%g7,	%g4,	%g1
	edge32	%i2,	%i0,	%o6
	sdiv	%g5,	0x077D,	%l3
	move	%icc,	%l0,	%g6
	movrne	%g3,	%o4,	%o0
	edge8l	%l5,	%i6,	%i7
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%i5
	stx	%o7,	[%l7 + 0x08]
	fxnors	%f24,	%f12,	%f22
	fnand	%f14,	%f2,	%f2
	sll	%l2,	%g2,	%l4
	fsrc1s	%f18,	%f7
	lduh	[%l7 + 0x0E],	%o2
	mulx	%o1,	%l6,	%o3
	fmovsleu	%icc,	%f1,	%f27
	movn	%icc,	%i1,	%o5
	fmovsneg	%icc,	%f16,	%f0
	edge8ln	%i4,	%l1,	%g7
	ldsb	[%l7 + 0x1F],	%i3
	lduw	[%l7 + 0x34],	%g4
	mulscc	%i2,	%g1,	%o6
	array16	%g5,	%i0,	%l3
	and	%g6,	0x00A7,	%l0
	edge16	%g3,	%o0,	%o4
	movleu	%icc,	%l5,	%i6
	ldsh	[%l7 + 0x2A],	%i5
	orncc	%o7,	0x1DAB,	%l2
	lduw	[%l7 + 0x6C],	%i7
	andncc	%g2,	%o2,	%o1
	mova	%xcc,	%l4,	%l6
	sdiv	%i1,	0x1BD6,	%o3
	fmovrslz	%o5,	%f16,	%f20
	addcc	%i4,	%g7,	%l1
	stx	%g4,	[%l7 + 0x70]
	ld	[%l7 + 0x20],	%f12
	fnot1s	%f0,	%f15
	movl	%xcc,	%i3,	%g1
	edge16n	%i2,	%o6,	%g5
	movcs	%icc,	%l3,	%g6
	nop
	set	0x38, %i1
	stw	%l0,	[%l7 + %i1]
	edge32l	%i0,	%g3,	%o0
	st	%f17,	[%l7 + 0x60]
	fmovrde	%l5,	%f8,	%f26
	andn	%i6,	0x0527,	%o4
	srlx	%i5,	0x08,	%o7
	edge16n	%i7,	%l2,	%o2
	fmul8sux16	%f24,	%f26,	%f0
	movneg	%icc,	%g2,	%o1
	xnor	%l4,	0x1C87,	%l6
	st	%f20,	[%l7 + 0x4C]
	movle	%xcc,	%i1,	%o5
	addc	%i4,	%g7,	%o3
	edge8l	%g4,	%l1,	%i3
	sth	%i2,	[%l7 + 0x76]
	udivx	%o6,	0x06A6,	%g1
	lduh	[%l7 + 0x5C],	%l3
	edge32	%g6,	%g5,	%i0
	ldd	[%l7 + 0x10],	%g2
	ldd	[%l7 + 0x70],	%f20
	fmovsg	%icc,	%f29,	%f2
	move	%xcc,	%o0,	%l5
	edge8	%i6,	%o4,	%l0
	siam	0x4
	andncc	%o7,	%i7,	%i5
	mulx	%l2,	%o2,	%g2
	save %o1, 0x0E60, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l4,	%i1,	%i4
	movleu	%icc,	%g7,	%o3
	fmovse	%xcc,	%f4,	%f4
	fpack32	%f18,	%f0,	%f4
	fxors	%f21,	%f4,	%f8
	stw	%g4,	[%l7 + 0x44]
	alignaddrl	%o5,	%i3,	%l1
	ldub	[%l7 + 0x4A],	%o6
	movgu	%icc,	%g1,	%i2
	movg	%xcc,	%g6,	%l3
	edge16ln	%i0,	%g3,	%o0
	movvs	%icc,	%g5,	%i6
	fcmpes	%fcc2,	%f2,	%f4
	ldd	[%l7 + 0x10],	%o4
	movrlez	%l5,	0x13F,	%o7
	edge32l	%i7,	%i5,	%l0
	fmul8x16au	%f3,	%f29,	%f28
	fpack32	%f14,	%f20,	%f28
	sdiv	%l2,	0x0AED,	%o2
	movgu	%xcc,	%o1,	%g2
	edge16	%l4,	%i1,	%l6
	movrne	%g7,	%i4,	%g4
	array16	%o5,	%o3,	%i3
	fcmps	%fcc1,	%f10,	%f6
	movcs	%xcc,	%l1,	%g1
	fmovsa	%icc,	%f8,	%f11
	fcmpgt16	%f0,	%f30,	%o6
	fxor	%f24,	%f16,	%f10
	smulcc	%g6,	0x074B,	%l3
	sdivx	%i0,	0x1F63,	%g3
	xor	%o0,	0x088B,	%g5
	ldub	[%l7 + 0x56],	%i2
	fnot2s	%f19,	%f25
	fnot2	%f28,	%f24
	movle	%xcc,	%i6,	%l5
	addccc	%o7,	0x0955,	%o4
	fxnor	%f8,	%f10,	%f16
	movrgez	%i5,	%i7,	%l2
	nop
	set	0x41, %o5
	ldsb	[%l7 + %o5],	%o2
	ldd	[%l7 + 0x70],	%f22
	fcmpd	%fcc0,	%f24,	%f12
	fmovrsgez	%o1,	%f6,	%f25
	ldd	[%l7 + 0x78],	%g2
	edge32ln	%l0,	%l4,	%l6
	movvc	%icc,	%g7,	%i4
	udivcc	%g4,	0x03F2,	%i1
	fpack16	%f24,	%f24
	movneg	%xcc,	%o5,	%i3
	orn	%l1,	0x048D,	%g1
	orn	%o6,	0x0EC0,	%o3
	sir	0x02E0
	movgu	%xcc,	%l3,	%g6
	fxnor	%f30,	%f16,	%f12
	udiv	%g3,	0x1EE2,	%o0
	subcc	%g5,	0x019A,	%i0
	fmovdge	%icc,	%f17,	%f5
	mova	%xcc,	%i2,	%i6
	pdist	%f16,	%f30,	%f22
	lduw	[%l7 + 0x18],	%o7
	edge16ln	%o4,	%i5,	%l5
	addccc	%l2,	0x07B1,	%i7
	edge8n	%o1,	%g2,	%o2
	ldsw	[%l7 + 0x48],	%l0
	edge32l	%l6,	%g7,	%l4
	edge32l	%i4,	%g4,	%o5
	andncc	%i1,	%l1,	%g1
	fmovsge	%icc,	%f24,	%f15
	mulx	%i3,	%o6,	%l3
	andncc	%o3,	%g6,	%o0
	smul	%g3,	%g5,	%i0
	xnor	%i6,	0x1D32,	%i2
	xnorcc	%o7,	0x029A,	%i5
	andncc	%l5,	%l2,	%i7
	movrne	%o1,	%g2,	%o4
	udiv	%o2,	0x093D,	%l6
	srax	%g7,	0x15,	%l4
	fnands	%f10,	%f8,	%f14
	sethi	0x18FA,	%i4
	smulcc	%l0,	%o5,	%i1
	udivcc	%l1,	0x109F,	%g1
	xor	%i3,	0x08B4,	%g4
	udiv	%l3,	0x0BCD,	%o6
	fexpand	%f0,	%f6
	restore %o3, 0x1FA6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g3,	%g5,	%g6
	fmovrdlz	%i6,	%f30,	%f18
	ldsb	[%l7 + 0x6C],	%i2
	sll	%i0,	%o7,	%i5
	udivx	%l2,	0x0FCE,	%i7
	udivx	%o1,	0x066A,	%g2
	edge32ln	%l5,	%o4,	%l6
	sub	%o2,	%g7,	%i4
	sra	%l0,	0x1B,	%o5
	fpack32	%f8,	%f24,	%f30
	smulcc	%i1,	%l1,	%l4
	fxnors	%f0,	%f18,	%f24
	andncc	%i3,	%g4,	%l3
	movg	%icc,	%g1,	%o3
	ldsw	[%l7 + 0x0C],	%o6
	fmovdvc	%xcc,	%f4,	%f3
	edge16	%g3,	%g5,	%o0
	movleu	%xcc,	%g6,	%i6
	movge	%icc,	%i0,	%o7
	fmul8x16	%f22,	%f0,	%f24
	fpsub16	%f2,	%f2,	%f20
	subcc	%i5,	0x0FF0,	%i2
	sth	%i7,	[%l7 + 0x44]
	add	%l2,	%o1,	%l5
	andn	%g2,	%l6,	%o4
	add	%g7,	%i4,	%o2
	lduw	[%l7 + 0x28],	%l0
	movrlz	%o5,	0x3BF,	%l1
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	addccc	%g4,	0x19B6,	%l3
	restore %g1, 0x0ED9, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o3,	0x0F11,	%o6
	smulcc	%g3,	%o0,	%g6
	alignaddr	%g5,	%i0,	%o7
	fxor	%f28,	%f24,	%f22
	fmovrsgez	%i6,	%f3,	%f18
	stb	%i2,	[%l7 + 0x0A]
	movrlz	%i7,	%l2,	%i5
	ldub	[%l7 + 0x7A],	%l5
	movgu	%xcc,	%g2,	%l6
	siam	0x4
	fpack32	%f18,	%f22,	%f10
	movrlez	%o1,	0x183,	%g7
	sir	0x1A16
	fornot2	%f0,	%f14,	%f6
	xorcc	%i4,	%o4,	%l0
	lduw	[%l7 + 0x44],	%o5
	movg	%icc,	%o2,	%l1
	umulcc	%i1,	%l4,	%g4
	fsrc1	%f4,	%f0
	fcmpd	%fcc3,	%f24,	%f6
	xnorcc	%l3,	%g1,	%i3
	ldub	[%l7 + 0x20],	%o3
	fornot1	%f14,	%f12,	%f18
	lduh	[%l7 + 0x40],	%o6
	movvs	%icc,	%g3,	%g6
	std	%f0,	[%l7 + 0x60]
	movne	%icc,	%g5,	%i0
	fpadd32s	%f14,	%f30,	%f30
	edge32l	%o7,	%i6,	%i2
	movre	%o0,	0x100,	%i7
	movrlz	%l2,	%l5,	%i5
	edge32n	%l6,	%g2,	%g7
	sethi	0x0D4C,	%i4
	movl	%xcc,	%o1,	%o4
	alignaddr	%o5,	%o2,	%l0
	st	%f6,	[%l7 + 0x40]
	fand	%f22,	%f16,	%f12
	fand	%f0,	%f16,	%f12
	movleu	%xcc,	%i1,	%l1
	movgu	%icc,	%l4,	%g4
	or	%g1,	%i3,	%l3
	mulscc	%o3,	0x10D1,	%o6
	stw	%g6,	[%l7 + 0x24]
	movg	%icc,	%g5,	%g3
	movcc	%icc,	%o7,	%i6
	movre	%i0,	%o0,	%i7
	edge16l	%i2,	%l2,	%l5
	movpos	%icc,	%l6,	%i5
	fcmple32	%f4,	%f6,	%g2
	movpos	%xcc,	%i4,	%g7
	edge8ln	%o4,	%o5,	%o1
	stx	%l0,	[%l7 + 0x08]
	array16	%i1,	%l1,	%l4
	udiv	%g4,	0x0B09,	%g1
	fmovrsgez	%i3,	%f22,	%f28
	fmovdle	%icc,	%f3,	%f12
	udivcc	%l3,	0x03A8,	%o2
	movrlez	%o6,	%g6,	%g5
	edge32l	%g3,	%o7,	%o3
	orcc	%i0,	0x009D,	%i6
	edge16l	%o0,	%i2,	%i7
	sir	0x061E
	umulcc	%l5,	%l6,	%i5
	orncc	%l2,	%i4,	%g7
	sdiv	%o4,	0x15EF,	%o5
	add	%o1,	%l0,	%i1
	movrgz	%g2,	%l4,	%l1
	fcmpeq16	%f0,	%f20,	%g4
	edge8l	%g1,	%i3,	%o2
	ldsh	[%l7 + 0x52],	%l3
	fmovsvs	%icc,	%f1,	%f29
	xor	%g6,	0x0A8B,	%o6
	srax	%g3,	%o7,	%o3
	movle	%xcc,	%i0,	%i6
	mulscc	%g5,	0x1EA0,	%i2
	fmovsg	%icc,	%f27,	%f29
	fmovsne	%xcc,	%f14,	%f30
	xorcc	%i7,	0x0471,	%l5
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%f0
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%i6
	fmovdneg	%xcc,	%f14,	%f19
	srax	%i5,	%o0,	%l2
	sth	%i4,	[%l7 + 0x5C]
	addc	%o4,	0x0AFD,	%g7
	movrgez	%o5,	%l0,	%i1
	sll	%o1,	0x0E,	%g2
	xor	%l4,	%l1,	%g4
	subccc	%i3,	0x1513,	%o2
	save %l3, %g6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o6,	[%l7 + 0x40]
	edge8l	%g3,	%o7,	%i0
	array8	%o3,	%g5,	%i6
	movcs	%xcc,	%i2,	%l5
	std	%f14,	[%l7 + 0x08]
	or	%l6,	%i7,	%o0
	bshuffle	%f16,	%f6,	%f12
	sethi	0x1872,	%i5
	srlx	%l2,	%i4,	%g7
	edge8	%o5,	%l0,	%i1
	movneg	%xcc,	%o1,	%g2
	movcc	%xcc,	%l4,	%l1
	fsrc2s	%f9,	%f12
	movrlez	%g4,	0x1D6,	%o4
	popc	0x1C60,	%o2
	edge32	%l3,	%g6,	%g1
	fcmple32	%f12,	%f18,	%o6
	fnot2	%f24,	%f8
	movne	%icc,	%g3,	%i3
	movle	%xcc,	%i0,	%o3
	movleu	%icc,	%o7,	%i6
	stx	%i2,	[%l7 + 0x20]
	fmovdcs	%icc,	%f12,	%f8
	mulscc	%l5,	0x0DDE,	%g5
	edge32	%l6,	%i7,	%o0
	subcc	%l2,	0x0FEA,	%i4
	edge8	%i5,	%g7,	%o5
	ldsh	[%l7 + 0x16],	%i1
	movrgez	%o1,	0x06A,	%g2
	edge8l	%l0,	%l4,	%g4
	xnorcc	%l1,	0x1E46,	%o2
	sub	%o4,	0x0DE6,	%g6
	fmovsn	%xcc,	%f11,	%f14
	edge32ln	%l3,	%g1,	%g3
	srlx	%i3,	0x0C,	%i0
	ldd	[%l7 + 0x08],	%o2
	fpadd32s	%f0,	%f31,	%f5
	array32	%o7,	%o6,	%i6
	fnegs	%f20,	%f8
	sdiv	%l5,	0x103F,	%g5
	sdivx	%l6,	0x178D,	%i2
	orn	%o0,	%i7,	%i4
	lduw	[%l7 + 0x48],	%l2
	umulcc	%i5,	%g7,	%i1
	sir	0x0ACD
	edge32l	%o1,	%o5,	%l0
	array8	%g2,	%g4,	%l1
	ld	[%l7 + 0x60],	%f8
	sir	0x0594
	ld	[%l7 + 0x58],	%f22
	fmovscs	%icc,	%f7,	%f28
	movre	%o2,	%o4,	%g6
	stx	%l3,	[%l7 + 0x48]
	sra	%g1,	%l4,	%g3
	movleu	%xcc,	%i3,	%o3
	xorcc	%o7,	%i0,	%o6
	movrlz	%i6,	0x18B,	%l5
	subccc	%l6,	%i2,	%o0
	stw	%g5,	[%l7 + 0x58]
	edge16l	%i4,	%l2,	%i5
	movn	%xcc,	%i7,	%g7
	udivx	%i1,	0x1CFF,	%o1
	andn	%l0,	0x0C37,	%g2
	fmovse	%icc,	%f11,	%f17
	orn	%o5,	%l1,	%g4
	edge32ln	%o2,	%g6,	%l3
	fabsd	%f8,	%f12
	sub	%g1,	%o4,	%g3
	movg	%xcc,	%l4,	%o3
	fpsub16	%f20,	%f30,	%f10
	or	%o7,	%i3,	%o6
	smul	%i0,	0x02C4,	%i6
	sub	%l6,	0x075D,	%i2
	ld	[%l7 + 0x6C],	%f24
	xor	%l5,	%o0,	%i4
	orncc	%g5,	%i5,	%l2
	save %i7, %i1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g7,	0x13E8,	%l0
	movre	%g2,	%l1,	%g4
	fpadd16s	%f6,	%f1,	%f8
	add	%o5,	0x033B,	%o2
	movneg	%icc,	%l3,	%g1
	ldsh	[%l7 + 0x50],	%g6
	fmovrdlez	%g3,	%f0,	%f20
	ldsh	[%l7 + 0x0A],	%o4
	fmuld8sux16	%f17,	%f29,	%f28
	sub	%l4,	0x138B,	%o7
	save %o3, %i3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1F8B
	movcc	%icc,	%i0,	%l6
	mulscc	%i2,	0x0D55,	%i6
	subcc	%o0,	%i4,	%l5
	movleu	%xcc,	%g5,	%l2
	ldsh	[%l7 + 0x7E],	%i5
	sllx	%i7,	0x14,	%o1
	fsrc2s	%f5,	%f16
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	fmovsn	%xcc,	%f5,	%f12
	subc	%g2,	%g7,	%l1
	edge8ln	%g4,	%o5,	%o2
	movgu	%icc,	%g1,	%g6
	movl	%xcc,	%l3,	%o4
	add	%l4,	%o7,	%g3
	sir	0x0C18
	movle	%xcc,	%o3,	%i3
	movg	%icc,	%o6,	%l6
	fnot2	%f22,	%f28
	nop
	set	0x68, %g5
	std	%f8,	[%l7 + %g5]
	ldsb	[%l7 + 0x37],	%i2
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%i6
	andcc	%o0,	0x0AA6,	%i4
	ldx	[%l7 + 0x18],	%l5
	srl	%i0,	0x0A,	%g5
	xor	%i5,	0x0755,	%i7
	fornot1	%f6,	%f26,	%f6
	movneg	%icc,	%l2,	%o1
	fpack32	%f22,	%f6,	%f0
	st	%f4,	[%l7 + 0x20]
	sth	%i1,	[%l7 + 0x7A]
	movrne	%l0,	%g2,	%l1
	popc	0x1D57,	%g4
	fnors	%f13,	%f21,	%f3
	xnorcc	%o5,	0x1608,	%g7
	stb	%g1,	[%l7 + 0x1A]
	movrgz	%g6,	0x184,	%o2
	fandnot2s	%f24,	%f3,	%f15
	xnor	%o4,	0x114C,	%l4
	addcc	%l3,	%g3,	%o7
	fmovrse	%i3,	%f2,	%f17
	fandnot2s	%f26,	%f28,	%f11
	edge32ln	%o6,	%l6,	%o3
	fpsub32	%f28,	%f12,	%f30
	stw	%i6,	[%l7 + 0x40]
	movrgez	%o0,	0x272,	%i2
	addc	%i4,	%i0,	%g5
	orn	%i5,	%i7,	%l5
	fnor	%f6,	%f30,	%f22
	edge16ln	%l2,	%i1,	%o1
	movvc	%icc,	%g2,	%l0
	movle	%icc,	%g4,	%o5
	fmul8x16	%f3,	%f18,	%f14
	fmovdvs	%xcc,	%f11,	%f6
	fmovscc	%xcc,	%f28,	%f21
	movge	%icc,	%g7,	%l1
	ldub	[%l7 + 0x64],	%g6
	array32	%g1,	%o4,	%o2
	sll	%l4,	%g3,	%l3
	fmovdleu	%icc,	%f30,	%f27
	addcc	%i3,	%o7,	%o6
	fpack32	%f8,	%f22,	%f6
	addc	%o3,	%l6,	%o0
	fcmps	%fcc1,	%f14,	%f4
	edge8ln	%i2,	%i4,	%i6
	addcc	%g5,	%i5,	%i7
	fmul8x16au	%f22,	%f24,	%f12
	movvc	%icc,	%i0,	%l5
	andcc	%i1,	%o1,	%g2
	movvs	%xcc,	%l2,	%l0
	for	%f10,	%f16,	%f10
	fmul8ulx16	%f0,	%f14,	%f8
	edge8	%g4,	%g7,	%l1
	sra	%g6,	%o5,	%g1
	ldd	[%l7 + 0x20],	%f4
	movle	%xcc,	%o2,	%o4
	ldsw	[%l7 + 0x34],	%g3
	std	%f22,	[%l7 + 0x48]
	andncc	%l3,	%i3,	%o7
	smul	%l4,	0x0D8B,	%o3
	sllx	%o6,	0x0D,	%o0
	addccc	%i2,	0x0B9F,	%l6
	movn	%xcc,	%i4,	%i6
	fmovsne	%icc,	%f21,	%f22
	andcc	%i5,	%i7,	%i0
	stb	%g5,	[%l7 + 0x30]
	movle	%xcc,	%i1,	%l5
	fmul8ulx16	%f24,	%f12,	%f18
	add	%o1,	0x111E,	%l2
	std	%f24,	[%l7 + 0x38]
	alignaddr	%g2,	%l0,	%g7
	ldd	[%l7 + 0x48],	%f30
	xnorcc	%l1,	0x1CAF,	%g4
	movg	%icc,	%o5,	%g6
	fornot2s	%f1,	%f10,	%f9
	ld	[%l7 + 0x34],	%f0
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f30
	addcc	%o2,	%g1,	%o4
	ldx	[%l7 + 0x38],	%l3
	srlx	%i3,	0x1E,	%o7
	srl	%g3,	0x0B,	%l4
	fxnor	%f18,	%f28,	%f16
	sdivx	%o6,	0x0F09,	%o3
	fandnot1	%f28,	%f2,	%f22
	edge16l	%o0,	%l6,	%i2
	movpos	%icc,	%i6,	%i5
	edge8l	%i7,	%i0,	%g5
	edge16ln	%i4,	%l5,	%o1
	alignaddrl	%l2,	%i1,	%g2
	sdiv	%g7,	0x1DB2,	%l0
	mova	%xcc,	%l1,	%g4
	edge32n	%o5,	%o2,	%g6
	edge16n	%g1,	%o4,	%i3
	sra	%l3,	0x17,	%g3
	andn	%o7,	%o6,	%l4
	movcc	%icc,	%o0,	%l6
	fnot2s	%f8,	%f9
	sth	%i2,	[%l7 + 0x24]
	edge16l	%i6,	%o3,	%i7
	orncc	%i0,	%i5,	%i4
	nop
	set	0x2A, %i2
	ldub	[%l7 + %i2],	%l5
	andncc	%g5,	%o1,	%l2
	umul	%g2,	%i1,	%l0
	movrne	%g7,	%l1,	%g4
	lduw	[%l7 + 0x44],	%o5
	sdivcc	%g6,	0x18E4,	%g1
	movrlz	%o4,	%o2,	%l3
	subccc	%g3,	0x190D,	%i3
	movle	%icc,	%o7,	%o6
	addccc	%l4,	0x00B1,	%o0
	fpackfix	%f22,	%f26
	edge16ln	%i2,	%i6,	%l6
	udiv	%o3,	0x0769,	%i0
	movle	%icc,	%i7,	%i5
	srlx	%i4,	%g5,	%o1
	sethi	0x01B9,	%l5
	fxor	%f20,	%f14,	%f12
	nop
	set	0x54, %i7
	stw	%g2,	[%l7 + %i7]
	ld	[%l7 + 0x50],	%f1
	array8	%i1,	%l2,	%l0
	movneg	%icc,	%g7,	%l1
	add	%o5,	%g6,	%g4
	movvs	%xcc,	%o4,	%g1
	smul	%o2,	%l3,	%i3
	movl	%icc,	%o7,	%o6
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%f14
	movge	%icc,	%l4,	%g3
	movvs	%icc,	%o0,	%i6
	andncc	%i2,	%l6,	%o3
	movleu	%icc,	%i7,	%i5
	movrne	%i4,	%i0,	%o1
	movvc	%xcc,	%g5,	%l5
	fpsub32	%f8,	%f10,	%f26
	fmovd	%f28,	%f18
	alignaddr	%g2,	%l2,	%i1
	or	%g7,	%l1,	%o5
	nop
	set	0x28, %o1
	lduh	[%l7 + %o1],	%l0
	sdiv	%g6,	0x07BF,	%g4
	or	%g1,	0x1FAF,	%o4
	sllx	%o2,	0x18,	%l3
	movrne	%o7,	0x06F,	%o6
	fcmpes	%fcc2,	%f18,	%f24
	edge8n	%i3,	%l4,	%o0
	smul	%i6,	0x01D4,	%g3
	fmovdg	%icc,	%f30,	%f13
	fand	%f0,	%f10,	%f4
	fmovsvc	%icc,	%f14,	%f18
	xorcc	%i2,	%l6,	%i7
	movle	%icc,	%i5,	%i4
	orn	%i0,	%o1,	%o3
	mulx	%g5,	%g2,	%l2
	sir	0x0172
	fxnors	%f18,	%f20,	%f26
	std	%f30,	[%l7 + 0x10]
	sra	%i1,	%l5,	%g7
	movcs	%icc,	%o5,	%l0
	srax	%g6,	%g4,	%l1
	sub	%o4,	0x0663,	%o2
	andncc	%l3,	%o7,	%o6
	alignaddrl	%g1,	%l4,	%o0
	andncc	%i3,	%g3,	%i2
	mulx	%i6,	%l6,	%i5
	edge8n	%i7,	%i0,	%i4
	umulcc	%o3,	0x1B38,	%o1
	stw	%g2,	[%l7 + 0x3C]
	fnot2s	%f13,	%f31
	alignaddr	%l2,	%i1,	%l5
	sub	%g5,	0x128C,	%o5
	movne	%icc,	%g7,	%g6
	or	%g4,	0x1DBB,	%l0
	movcc	%xcc,	%l1,	%o2
	srl	%l3,	0x12,	%o4
	fpadd16	%f24,	%f10,	%f10
	edge16	%o7,	%g1,	%l4
	sub	%o6,	%o0,	%g3
	fandnot2	%f26,	%f8,	%f16
	fmovsvc	%xcc,	%f16,	%f13
	movcs	%icc,	%i3,	%i2
	stx	%i6,	[%l7 + 0x48]
	srax	%l6,	%i5,	%i7
	sir	0x1446
	fcmpeq16	%f4,	%f18,	%i0
	array8	%o3,	%o1,	%g2
	edge32l	%l2,	%i1,	%i4
	fpsub32	%f8,	%f22,	%f18
	movre	%g5,	%l5,	%g7
	edge32ln	%g6,	%o5,	%g4
	subc	%l0,	%o2,	%l1
	fpsub32s	%f19,	%f14,	%f20
	sllx	%l3,	0x12,	%o7
	movle	%xcc,	%o4,	%g1
	andcc	%l4,	%o0,	%o6
	or	%i3,	%i2,	%g3
	stx	%l6,	[%l7 + 0x18]
	udiv	%i6,	0x0AD8,	%i5
	stw	%i7,	[%l7 + 0x2C]
	fmovdvs	%xcc,	%f30,	%f4
	sll	%i0,	%o3,	%o1
	sll	%l2,	0x11,	%i1
	ldd	[%l7 + 0x70],	%i4
	fmul8sux16	%f8,	%f24,	%f12
	mova	%icc,	%g2,	%l5
	fmovrdgez	%g5,	%f8,	%f20
	fxors	%f1,	%f18,	%f16
	save %g6, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l0,	%o5,	%l1
	fcmple16	%f12,	%f2,	%o2
	array32	%l3,	%o4,	%o7
	edge32l	%l4,	%o0,	%o6
	sdiv	%g1,	0x0D30,	%i3
	fpsub16s	%f10,	%f25,	%f0
	restore %i2, 0x1C8A, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f10,	%f12,	%f0
	movre	%g3,	%i5,	%i7
	st	%f21,	[%l7 + 0x28]
	udivcc	%i0,	0x0F91,	%i6
	ldd	[%l7 + 0x30],	%o0
	fmovrdlz	%o3,	%f18,	%f18
	addccc	%l2,	%i4,	%g2
	movvs	%icc,	%l5,	%g5
	fmovsge	%icc,	%f14,	%f5
	ldsw	[%l7 + 0x1C],	%i1
	movn	%xcc,	%g6,	%g7
	addc	%l0,	%g4,	%o5
	move	%icc,	%l1,	%l3
	ld	[%l7 + 0x60],	%f28
	lduw	[%l7 + 0x3C],	%o2
	stx	%o7,	[%l7 + 0x30]
	stw	%o4,	[%l7 + 0x34]
	ldsb	[%l7 + 0x62],	%o0
	array32	%l4,	%o6,	%i3
	sir	0x1153
	ldub	[%l7 + 0x0C],	%g1
	edge32	%i2,	%g3,	%l6
	sir	0x1FB5
	movrgez	%i5,	0x3D1,	%i7
	sllx	%i6,	0x14,	%i0
	std	%f8,	[%l7 + 0x50]
	ld	[%l7 + 0x78],	%f11
	save %o3, %l2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o1,	0x1CFF,	%l5
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	stb	%g5,	[%l7 + 0x41]
	xnor	%g6,	0x128B,	%g7
	fmovdne	%xcc,	%f28,	%f28
	ldx	[%l7 + 0x28],	%l0
	fandnot2	%f0,	%f28,	%f18
	fmul8ulx16	%f4,	%f14,	%f18
	movcc	%xcc,	%o5,	%l1
	sllx	%g4,	%l3,	%o7
	movne	%xcc,	%o2,	%o0
	fzeros	%f12
	srax	%l4,	%o4,	%i3
	edge32l	%g1,	%i2,	%g3
	save %l6, 0x0FFF, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f18,	%f4,	%f4
	edge32l	%i5,	%i6,	%i7
	movcs	%xcc,	%o3,	%l2
	fmovdleu	%icc,	%f31,	%f27
	edge8n	%i4,	%o1,	%l5
	sethi	0x1AE6,	%g2
	movn	%xcc,	%i1,	%g5
	fpack32	%f18,	%f6,	%f8
	for	%f8,	%f8,	%f28
	movre	%g6,	0x1E1,	%i0
	movleu	%icc,	%l0,	%g7
	stw	%l1,	[%l7 + 0x54]
	addc	%o5,	0x1EF1,	%l3
	xorcc	%g4,	%o2,	%o7
	fxor	%f14,	%f12,	%f18
	sethi	0x0483,	%l4
	edge8	%o0,	%o4,	%i3
	movn	%xcc,	%i2,	%g3
	fmovsne	%xcc,	%f30,	%f16
	add	%l6,	0x0353,	%g1
	fcmps	%fcc1,	%f31,	%f20
	andncc	%i5,	%i6,	%i7
	fmovdge	%xcc,	%f24,	%f12
	orcc	%o6,	%o3,	%i4
	fmovsn	%xcc,	%f22,	%f28
	nop
	set	0x4D, %l3
	stb	%o1,	[%l7 + %l3]
	stx	%l2,	[%l7 + 0x70]
	edge16	%l5,	%g2,	%i1
	fpsub32s	%f16,	%f3,	%f28
	array8	%g5,	%g6,	%i0
	movne	%xcc,	%l0,	%l1
	fmovrslz	%g7,	%f3,	%f1
	fpackfix	%f2,	%f5
	fzeros	%f27
	popc	0x04DC,	%o5
	fmovs	%f25,	%f30
	ld	[%l7 + 0x68],	%f13
	movl	%icc,	%l3,	%g4
	edge8n	%o7,	%o2,	%o0
	movgu	%icc,	%o4,	%l4
	movvc	%icc,	%i3,	%g3
	stw	%i2,	[%l7 + 0x5C]
	movg	%xcc,	%l6,	%i5
	fmovdn	%xcc,	%f27,	%f0
	fsrc1s	%f15,	%f11
	movleu	%xcc,	%g1,	%i7
	edge16l	%i6,	%o3,	%i4
	stb	%o1,	[%l7 + 0x5B]
	orncc	%o6,	0x163A,	%l5
	udiv	%l2,	0x050D,	%i1
	edge32ln	%g2,	%g6,	%g5
	std	%f6,	[%l7 + 0x38]
	sdiv	%i0,	0x1B3D,	%l1
	mulx	%l0,	%g7,	%o5
	ldx	[%l7 + 0x28],	%g4
	edge8l	%o7,	%l3,	%o2
	edge8l	%o4,	%l4,	%i3
	sllx	%g3,	0x00,	%i2
	move	%icc,	%l6,	%i5
	fmovrdlz	%g1,	%f4,	%f16
	edge32ln	%i7,	%o0,	%i6
	sllx	%o3,	%i4,	%o6
	edge32ln	%l5,	%o1,	%l2
	andncc	%g2,	%g6,	%g5
	add	%i0,	0x0689,	%l1
	restore %l0, %g7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f14,	%f24,	%f30
	fnor	%f28,	%f10,	%f8
	fcmpes	%fcc1,	%f9,	%f0
	fmovdl	%xcc,	%f3,	%f6
	fors	%f30,	%f1,	%f8
	subcc	%g4,	0x068B,	%o7
	fmovrslz	%l3,	%f5,	%f27
	fxnor	%f24,	%f28,	%f18
	edge8n	%o2,	%o4,	%l4
	subccc	%i1,	%g3,	%i2
	movle	%icc,	%i3,	%l6
	movne	%icc,	%g1,	%i5
	edge8l	%i7,	%i6,	%o3
	andn	%o0,	0x0721,	%i4
	ldsw	[%l7 + 0x3C],	%o6
	xnorcc	%l5,	%l2,	%g2
	movrne	%o1,	%g5,	%i0
	movrlz	%l1,	0x149,	%l0
	movrlez	%g7,	%g6,	%o5
	fnors	%f11,	%f10,	%f12
	andn	%g4,	%o7,	%l3
	addc	%o2,	0x1527,	%l4
	stx	%i1,	[%l7 + 0x18]
	umulcc	%o4,	%i2,	%i3
	move	%xcc,	%g3,	%g1
	ldsb	[%l7 + 0x52],	%i5
	sdivx	%l6,	0x12CD,	%i6
	fmovse	%icc,	%f30,	%f24
	and	%i7,	0x0B85,	%o3
	mulx	%o0,	0x1EC5,	%i4
	srax	%l5,	%o6,	%l2
	fxor	%f0,	%f30,	%f14
	movrgez	%g2,	%g5,	%o1
	sth	%l1,	[%l7 + 0x76]
	popc	%i0,	%g7
	sdivcc	%g6,	0x12FB,	%o5
	fmovsleu	%icc,	%f25,	%f10
	subccc	%l0,	0x0FE6,	%g4
	udivx	%o7,	0x0677,	%l3
	xnorcc	%o2,	0x0F3F,	%l4
	edge8n	%o4,	%i2,	%i1
	xnor	%g3,	0x13BD,	%i3
	movl	%xcc,	%i5,	%g1
	movl	%xcc,	%l6,	%i7
	ldub	[%l7 + 0x2D],	%o3
	fmovsge	%xcc,	%f11,	%f24
	sllx	%i6,	%o0,	%l5
	movl	%icc,	%o6,	%l2
	sub	%g2,	0x095B,	%i4
	edge8	%o1,	%l1,	%i0
	fmovrdgez	%g5,	%f18,	%f10
	nop
	set	0x74, %l2
	stw	%g6,	[%l7 + %l2]
	edge32n	%o5,	%l0,	%g7
	edge32n	%g4,	%o7,	%o2
	xorcc	%l3,	%o4,	%i2
	ldsh	[%l7 + 0x78],	%i1
	fxnors	%f9,	%f6,	%f14
	movrlz	%g3,	0x2BB,	%i3
	sllx	%l4,	%i5,	%l6
	fnot2	%f24,	%f18
	array32	%i7,	%o3,	%i6
	sth	%g1,	[%l7 + 0x1C]
	alignaddr	%o0,	%l5,	%l2
	srlx	%o6,	%g2,	%i4
	fmovdn	%icc,	%f23,	%f1
	edge32ln	%l1,	%i0,	%o1
	movrne	%g5,	%o5,	%g6
	movrgez	%l0,	%g4,	%g7
	ld	[%l7 + 0x50],	%f31
	movneg	%xcc,	%o7,	%l3
	movrlez	%o4,	0x020,	%o2
	sth	%i1,	[%l7 + 0x52]
	sth	%i2,	[%l7 + 0x4C]
	fmovdge	%icc,	%f21,	%f24
	fmovrse	%i3,	%f10,	%f19
	fmovsa	%icc,	%f18,	%f7
	movgu	%icc,	%l4,	%g3
	udivx	%l6,	0x00F4,	%i5
	sdiv	%o3,	0x1DDC,	%i7
	movvc	%icc,	%g1,	%i6
	add	%o0,	%l5,	%l2
	fpack32	%f30,	%f2,	%f20
	edge8	%o6,	%g2,	%l1
	addccc	%i4,	0x035E,	%i0
	fmovsneg	%xcc,	%f13,	%f20
	ldx	[%l7 + 0x68],	%g5
	fnors	%f10,	%f20,	%f26
	array8	%o5,	%o1,	%l0
	umulcc	%g4,	0x06EC,	%g6
	ldsw	[%l7 + 0x28],	%g7
	fnors	%f0,	%f15,	%f17
	xor	%l3,	0x04DF,	%o4
	movn	%icc,	%o7,	%o2
	sllx	%i1,	%i3,	%l4
	edge8n	%i2,	%g3,	%l6
	edge16ln	%i5,	%o3,	%i7
	ldx	[%l7 + 0x18],	%g1
	ldd	[%l7 + 0x70],	%i6
	move	%xcc,	%o0,	%l2
	fmovsgu	%xcc,	%f29,	%f8
	addc	%o6,	0x1B27,	%g2
	orn	%l1,	0x1665,	%i4
	ldx	[%l7 + 0x58],	%l5
	xnor	%g5,	0x0ADA,	%i0
	fornot2	%f18,	%f24,	%f8
	fandnot2	%f26,	%f10,	%f8
	ldd	[%l7 + 0x20],	%f24
	fmovs	%f21,	%f17
	move	%xcc,	%o5,	%o1
	sth	%l0,	[%l7 + 0x48]
	andn	%g6,	%g4,	%g7
	sth	%o4,	[%l7 + 0x1C]
	fmovsge	%xcc,	%f28,	%f12
	sir	0x145D
	movl	%icc,	%l3,	%o7
	edge16n	%i1,	%o2,	%l4
	orn	%i2,	%i3,	%l6
	fcmpes	%fcc0,	%f16,	%f24
	sllx	%i5,	0x01,	%o3
	edge16l	%i7,	%g3,	%g1
	fmovrslez	%i6,	%f19,	%f23
	srl	%l2,	%o6,	%g2
	alignaddr	%o0,	%l1,	%l5
	srax	%i4,	0x10,	%i0
	andn	%o5,	%g5,	%l0
	movrgz	%o1,	%g4,	%g6
	std	%f24,	[%l7 + 0x08]
	fnot1	%f4,	%f6
	edge32ln	%o4,	%l3,	%o7
	srax	%i1,	0x07,	%g7
	fpadd32s	%f12,	%f3,	%f17
	mova	%icc,	%o2,	%l4
	stx	%i3,	[%l7 + 0x58]
	xor	%l6,	%i5,	%o3
	fnors	%f7,	%f2,	%f14
	xor	%i7,	0x11E6,	%g3
	edge32l	%i2,	%i6,	%l2
	orcc	%g1,	0x0281,	%g2
	movle	%xcc,	%o6,	%o0
	movneg	%icc,	%l5,	%l1
	array32	%i0,	%i4,	%o5
	fornot1s	%f16,	%f6,	%f22
	addcc	%l0,	%g5,	%g4
	sll	%g6,	0x0C,	%o1
	srax	%o4,	0x09,	%o7
	fmovdvs	%icc,	%f23,	%f29
	movcs	%icc,	%l3,	%i1
	ldx	[%l7 + 0x38],	%o2
	ldsb	[%l7 + 0x0D],	%l4
	edge32l	%g7,	%i3,	%i5
	movrgez	%l6,	%i7,	%o3
	save %g3, 0x0F66, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l2,	%i6,	%g1
	mulx	%o6,	%o0,	%l5
	ldsh	[%l7 + 0x18],	%l1
	movrlz	%i0,	%g2,	%o5
	fmovrdlz	%l0,	%f22,	%f2
	fnot1s	%f23,	%f7
	xnor	%g5,	%i4,	%g6
	fmovrdgez	%o1,	%f22,	%f22
	edge8n	%o4,	%g4,	%o7
	movrne	%i1,	0x0E8,	%l3
	st	%f19,	[%l7 + 0x38]
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	edge16l	%i3,	%l4,	%l6
	srlx	%i7,	0x18,	%o3
	movne	%xcc,	%i5,	%i2
	movn	%xcc,	%g3,	%l2
	movrgez	%g1,	0x360,	%o6
	umulcc	%i6,	0x0D8C,	%o0
	movpos	%icc,	%l5,	%l1
	movrne	%i0,	%o5,	%g2
	edge16n	%l0,	%i4,	%g6
	array32	%o1,	%o4,	%g5
	save %g4, %i1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o2,	%g7
	fnot2	%f24,	%f22
	smulcc	%l3,	%l4,	%i3
	restore %i7, 0x1ADD, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i5,	%l6,	%g3
	edge16l	%i2,	%g1,	%l2
	orn	%i6,	%o0,	%o6
	fmovdneg	%xcc,	%f15,	%f14
	edge16n	%l1,	%l5,	%o5
	lduh	[%l7 + 0x08],	%g2
	alignaddrl	%i0,	%l0,	%g6
	edge16l	%i4,	%o4,	%o1
	fcmple32	%f0,	%f6,	%g4
	fnot1s	%f3,	%f0
	umulcc	%i1,	%o7,	%o2
	array32	%g5,	%l3,	%g7
	orncc	%i3,	0x0BA3,	%i7
	udiv	%o3,	0x0220,	%l4
	sethi	0x1787,	%i5
	edge16ln	%g3,	%l6,	%g1
	std	%f0,	[%l7 + 0x08]
	movg	%icc,	%l2,	%i6
	orn	%i2,	0x0008,	%o0
	movcc	%xcc,	%o6,	%l1
	movpos	%icc,	%l5,	%o5
	sra	%i0,	%l0,	%g2
	addc	%i4,	0x03FB,	%g6
	fxor	%f16,	%f30,	%f28
	ldd	[%l7 + 0x68],	%o0
	subccc	%g4,	%o4,	%i1
	ldd	[%l7 + 0x20],	%f6
	sllx	%o2,	%g5,	%o7
	fabsd	%f18,	%f18
	movrlz	%l3,	%g7,	%i7
	movg	%xcc,	%o3,	%i3
	fones	%f10
	orcc	%l4,	0x0F85,	%i5
	movle	%xcc,	%l6,	%g3
	udivx	%g1,	0x04B3,	%i6
	ldx	[%l7 + 0x28],	%l2
	addcc	%i2,	0x0172,	%o0
	and	%l1,	0x017C,	%o6
	srlx	%o5,	0x17,	%l5
	edge8l	%i0,	%g2,	%l0
	sra	%i4,	0x10,	%g6
	bshuffle	%f24,	%f6,	%f6
	movle	%icc,	%o1,	%o4
	sdivx	%i1,	0x19F5,	%o2
	lduh	[%l7 + 0x1A],	%g4
	srax	%o7,	%l3,	%g5
	fandnot2	%f22,	%f10,	%f0
	sth	%i7,	[%l7 + 0x22]
	srax	%o3,	0x1A,	%g7
	subc	%l4,	%i5,	%l6
	fornot2	%f18,	%f10,	%f8
	movvs	%xcc,	%i3,	%g1
	and	%g3,	0x1CCF,	%l2
	fmovsle	%icc,	%f30,	%f26
	sll	%i6,	%o0,	%i2
	edge8n	%o6,	%l1,	%o5
	sth	%i0,	[%l7 + 0x70]
	umulcc	%g2,	0x099C,	%l0
	movge	%xcc,	%i4,	%g6
	fpsub32	%f24,	%f10,	%f14
	ldd	[%l7 + 0x78],	%o0
	edge8ln	%l5,	%i1,	%o4
	movn	%icc,	%g4,	%o7
	lduh	[%l7 + 0x18],	%o2
	fmovdgu	%xcc,	%f9,	%f25
	xor	%g5,	0x025C,	%i7
	stw	%o3,	[%l7 + 0x58]
	mulscc	%g7,	%l4,	%i5
	fmovdvc	%icc,	%f18,	%f14
	udivx	%l3,	0x0F27,	%l6
	edge8ln	%i3,	%g1,	%g3
	fmovsleu	%xcc,	%f2,	%f11
	array16	%l2,	%i6,	%i2
	nop
	set	0x18, %o6
	ldsw	[%l7 + %o6],	%o6
	array32	%o0,	%l1,	%o5
	sdivx	%g2,	0x0FE1,	%i0
	fnegs	%f6,	%f10
	ldd	[%l7 + 0x68],	%f24
	edge16	%l0,	%g6,	%o1
	addc	%i4,	%l5,	%o4
	edge32	%g4,	%o7,	%o2
	andncc	%i1,	%g5,	%i7
	movre	%o3,	0x299,	%l4
	udivx	%g7,	0x0125,	%l3
	movl	%xcc,	%l6,	%i5
	movrlez	%g1,	%i3,	%g3
	sllx	%i6,	0x09,	%i2
	nop
	set	0x20, %l0
	ldsw	[%l7 + %l0],	%o6
	movrgez	%o0,	0x3A0,	%l1
	andcc	%l2,	%o5,	%g2
	movneg	%icc,	%i0,	%g6
	array16	%o1,	%l0,	%l5
	ldsh	[%l7 + 0x12],	%i4
	std	%f26,	[%l7 + 0x68]
	stx	%g4,	[%l7 + 0x58]
	smulcc	%o4,	0x12B5,	%o2
	fmovdleu	%icc,	%f6,	%f30
	udivcc	%o7,	0x0FAE,	%g5
	edge32ln	%i1,	%i7,	%o3
	fnors	%f14,	%f18,	%f10
	popc	%g7,	%l4
	fmovrslez	%l6,	%f20,	%f30
	fands	%f11,	%f5,	%f7
	fmovspos	%xcc,	%f6,	%f20
	ldub	[%l7 + 0x27],	%i5
	movre	%g1,	%l3,	%g3
	bshuffle	%f10,	%f4,	%f22
	xnorcc	%i3,	0x0B5B,	%i6
	ldd	[%l7 + 0x78],	%i2
	fmovsa	%icc,	%f14,	%f10
	andcc	%o6,	%l1,	%l2
	edge8n	%o0,	%o5,	%i0
	fmovrdlz	%g6,	%f10,	%f30
	srax	%g2,	0x1C,	%o1
	fornot1	%f14,	%f10,	%f22
	addcc	%l5,	%l0,	%i4
	ldub	[%l7 + 0x6D],	%g4
	srl	%o2,	0x1B,	%o4
	fmovrdgez	%g5,	%f4,	%f8
	fcmpd	%fcc1,	%f4,	%f18
	movne	%xcc,	%o7,	%i1
	edge8n	%i7,	%o3,	%l4
	orcc	%l6,	%g7,	%g1
	movl	%icc,	%i5,	%g3
	smul	%l3,	0x1A29,	%i3
	subcc	%i2,	%i6,	%o6
	sub	%l1,	%o0,	%l2
	fzeros	%f5
	andn	%o5,	0x08AD,	%i0
	fpack16	%f14,	%f28
	movgu	%xcc,	%g2,	%o1
	array16	%l5,	%l0,	%i4
	mova	%xcc,	%g6,	%g4
	movl	%icc,	%o2,	%g5
	xnor	%o7,	0x11E8,	%o4
	fmul8x16al	%f0,	%f30,	%f30
	srl	%i7,	%o3,	%l4
	udiv	%l6,	0x0082,	%g7
	sdiv	%g1,	0x0CF3,	%i1
	ldub	[%l7 + 0x4C],	%g3
	fabsd	%f28,	%f18
	fpmerge	%f5,	%f28,	%f4
	xnor	%i5,	0x1F80,	%i3
	stx	%i2,	[%l7 + 0x70]
	fmovdcc	%xcc,	%f13,	%f0
	movrlez	%i6,	0x12B,	%o6
	movcs	%icc,	%l1,	%l3
	mulscc	%l2,	0x1836,	%o0
	ld	[%l7 + 0x60],	%f3
	xorcc	%i0,	%g2,	%o5
	xnorcc	%o1,	0x1BB2,	%l5
	movneg	%xcc,	%l0,	%g6
	movg	%xcc,	%g4,	%i4
	array32	%o2,	%o7,	%g5
	stw	%o4,	[%l7 + 0x64]
	stb	%i7,	[%l7 + 0x70]
	fmovdl	%xcc,	%f16,	%f2
	edge32ln	%o3,	%l6,	%g7
	addccc	%g1,	0x1D69,	%l4
	ldd	[%l7 + 0x28],	%i0
	array8	%g3,	%i5,	%i2
	ldub	[%l7 + 0x3F],	%i6
	mulx	%o6,	%l1,	%l3
	fpadd16	%f8,	%f0,	%f10
	mova	%icc,	%i3,	%l2
	ldsb	[%l7 + 0x73],	%i0
	fnor	%f12,	%f2,	%f10
	srlx	%o0,	%o5,	%g2
	movrlz	%o1,	%l5,	%g6
	edge32ln	%l0,	%g4,	%o2
	srax	%i4,	%o7,	%g5
	array32	%i7,	%o4,	%o3
	movne	%xcc,	%l6,	%g1
	st	%f15,	[%l7 + 0x18]
	fand	%f22,	%f24,	%f10
	ld	[%l7 + 0x50],	%f24
	ldsb	[%l7 + 0x23],	%g7
	fmul8x16au	%f27,	%f24,	%f24
	fsrc2s	%f13,	%f17
	xnor	%l4,	0x153D,	%i1
	addc	%i5,	%i2,	%i6
	edge16l	%g3,	%o6,	%l3
	sdivcc	%i3,	0x1312,	%l1
	movleu	%icc,	%i0,	%o0
	xorcc	%l2,	%o5,	%o1
	edge32ln	%g2,	%g6,	%l0
	movrgz	%l5,	0x29D,	%g4
	srlx	%o2,	%i4,	%o7
	fmovdne	%xcc,	%f12,	%f11
	udiv	%i7,	0x110D,	%g5
	xorcc	%o4,	%l6,	%g1
	fmovdvs	%xcc,	%f27,	%f6
	udivcc	%o3,	0x1ECA,	%l4
	fornot2	%f0,	%f12,	%f26
	subc	%g7,	0x089C,	%i5
	fsrc1s	%f24,	%f22
	stw	%i2,	[%l7 + 0x68]
	udiv	%i6,	0x0260,	%g3
	movrlz	%o6,	0x309,	%l3
	edge16ln	%i1,	%i3,	%i0
	orn	%o0,	0x06A3,	%l1
	std	%f28,	[%l7 + 0x30]
	save %l2, 0x07FF, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f7,	%f9
	movneg	%icc,	%g2,	%g6
	fpadd32	%f8,	%f30,	%f20
	ldsb	[%l7 + 0x39],	%o1
	fxnors	%f18,	%f16,	%f2
	fmul8ulx16	%f6,	%f14,	%f24
	edge8n	%l0,	%l5,	%g4
	xorcc	%i4,	%o2,	%o7
	movrne	%g5,	%i7,	%l6
	fmovdl	%icc,	%f24,	%f8
	fcmpd	%fcc3,	%f16,	%f22
	subc	%g1,	%o3,	%o4
	movrne	%l4,	%i5,	%g7
	movgu	%xcc,	%i2,	%i6
	edge8ln	%o6,	%l3,	%i1
	edge16l	%g3,	%i0,	%i3
	nop
	set	0x58, %l1
	ldsw	[%l7 + %l1],	%o0
	stw	%l2,	[%l7 + 0x18]
	andcc	%o5,	%l1,	%g2
	smulcc	%o1,	%g6,	%l0
	movrgez	%g4,	0x107,	%l5
	fmovrse	%o2,	%f8,	%f1
	edge8l	%i4,	%o7,	%i7
	movrgz	%l6,	0x0E3,	%g5
	std	%f24,	[%l7 + 0x28]
	movpos	%xcc,	%o3,	%g1
	udiv	%o4,	0x0AC2,	%l4
	edge8l	%g7,	%i2,	%i6
	xnorcc	%i5,	0x117A,	%l3
	xorcc	%o6,	0x054F,	%i1
	xnorcc	%i0,	0x1649,	%g3
	edge8l	%o0,	%i3,	%l2
	alignaddrl	%l1,	%o5,	%g2
	sir	0x048F
	movrgz	%o1,	%g6,	%g4
	ldub	[%l7 + 0x73],	%l0
	ldd	[%l7 + 0x70],	%o2
	umulcc	%i4,	0x0987,	%l5
	lduw	[%l7 + 0x2C],	%i7
	sir	0x0B7C
	ldsb	[%l7 + 0x0A],	%l6
	mulx	%g5,	%o7,	%o3
	orncc	%o4,	0x08F9,	%l4
	sdivx	%g1,	0x1204,	%g7
	udivx	%i6,	0x1BF2,	%i5
	edge16l	%i2,	%l3,	%o6
	andncc	%i0,	%i1,	%g3
	andn	%i3,	0x0D66,	%l2
	udiv	%o0,	0x05A0,	%l1
	udivx	%g2,	0x0D80,	%o5
	movn	%xcc,	%o1,	%g6
	xnor	%l0,	0x1C6B,	%o2
	sra	%g4,	%i4,	%l5
	andncc	%l6,	%i7,	%g5
	std	%f18,	[%l7 + 0x20]
	sdivcc	%o3,	0x131E,	%o4
	srax	%o7,	%l4,	%g1
	ldx	[%l7 + 0x70],	%i6
	addcc	%i5,	%g7,	%l3
	movvc	%icc,	%o6,	%i2
	sth	%i1,	[%l7 + 0x12]
	xor	%i0,	0x01B5,	%g3
	edge16	%i3,	%o0,	%l1
	srax	%g2,	0x04,	%l2
	sdivcc	%o1,	0x19D9,	%o5
	orncc	%l0,	%g6,	%o2
	movcs	%icc,	%g4,	%i4
	sethi	0x0B06,	%l6
	movle	%icc,	%l5,	%i7
	stw	%o3,	[%l7 + 0x18]
	array8	%o4,	%o7,	%g5
	or	%g1,	%l4,	%i5
	udivx	%g7,	0x1005,	%l3
	fmovsg	%xcc,	%f0,	%f26
	movcc	%xcc,	%o6,	%i2
	ldx	[%l7 + 0x70],	%i6
	sir	0x0A38
	movre	%i0,	%i1,	%g3
	orncc	%i3,	0x0C88,	%o0
	fabss	%f1,	%f18
	srax	%l1,	0x09,	%l2
	fpsub16s	%f8,	%f30,	%f20
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	movcc	%xcc,	%g2,	%o2
	sdivcc	%g6,	0x024E,	%i4
	fmovse	%icc,	%f26,	%f9
	xnor	%l6,	0x0C01,	%l5
	addccc	%i7,	0x104B,	%g4
	fmovrse	%o4,	%f14,	%f7
	umulcc	%o7,	%o3,	%g5
	fornot2	%f30,	%f24,	%f26
	save %g1, 0x1C0F, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i5,	%g7
	edge16l	%l3,	%i2,	%i6
	mova	%xcc,	%o6,	%i1
	orncc	%i0,	0x195B,	%g3
	xnor	%i3,	%l1,	%o0
	umulcc	%o1,	0x0C2D,	%o5
	fmovrdlez	%l0,	%f16,	%f12
	stw	%g2,	[%l7 + 0x7C]
	edge8n	%o2,	%l2,	%i4
	sub	%g6,	0x049D,	%l6
	edge32l	%i7,	%g4,	%o4
	ld	[%l7 + 0x14],	%f18
	movl	%icc,	%o7,	%o3
	udivcc	%l5,	0x0F7F,	%g1
	andncc	%g5,	%i5,	%l4
	fpadd16	%f26,	%f0,	%f2
	fornot1	%f12,	%f26,	%f24
	edge8	%l3,	%i2,	%i6
	udiv	%o6,	0x1924,	%g7
	subc	%i1,	%g3,	%i3
	ldsw	[%l7 + 0x58],	%i0
	stb	%l1,	[%l7 + 0x28]
	fand	%f24,	%f10,	%f12
	orn	%o0,	%o1,	%l0
	sdivx	%o5,	0x032D,	%o2
	sdivx	%g2,	0x198E,	%l2
	fpadd32	%f30,	%f22,	%f28
	fmovdneg	%icc,	%f30,	%f30
	srax	%i4,	%l6,	%i7
	sra	%g4,	%o4,	%g6
	movrgez	%o3,	0x227,	%l5
	sll	%g1,	0x1F,	%o7
	stx	%g5,	[%l7 + 0x20]
	movneg	%xcc,	%l4,	%l3
	ldsh	[%l7 + 0x3E],	%i2
	ldx	[%l7 + 0x18],	%i6
	sllx	%i5,	0x1B,	%g7
	movl	%icc,	%o6,	%i1
	fmovde	%xcc,	%f22,	%f28
	nop
	set	0x38, %i4
	stw	%i3,	[%l7 + %i4]
	subccc	%i0,	0x1477,	%g3
	ldd	[%l7 + 0x70],	%o0
	smulcc	%l1,	%l0,	%o1
	and	%o2,	%o5,	%g2
	udiv	%i4,	0x10F4,	%l6
	xnorcc	%i7,	0x0B37,	%l2
	fmovdcc	%icc,	%f23,	%f0
	array16	%o4,	%g4,	%o3
	lduw	[%l7 + 0x20],	%l5
	movcc	%icc,	%g1,	%g6
	fmovrdgz	%g5,	%f14,	%f6
	movrne	%l4,	%l3,	%o7
	add	%i2,	%i6,	%i5
	srlx	%g7,	0x05,	%o6
	andcc	%i1,	%i0,	%g3
	edge8	%o0,	%i3,	%l1
	sth	%l0,	[%l7 + 0x60]
	lduw	[%l7 + 0x54],	%o2
	fmovsl	%icc,	%f21,	%f16
	mova	%icc,	%o5,	%g2
	movpos	%icc,	%i4,	%l6
	umulcc	%i7,	0x121C,	%l2
	stw	%o1,	[%l7 + 0x4C]
	srlx	%o4,	%o3,	%g4
	ldsb	[%l7 + 0x4D],	%l5
	srlx	%g6,	0x1C,	%g1
	stw	%l4,	[%l7 + 0x7C]
	fabss	%f3,	%f1
	stx	%l3,	[%l7 + 0x30]
	movcc	%xcc,	%o7,	%i2
	pdist	%f22,	%f0,	%f16
	movl	%xcc,	%i6,	%i5
	movg	%xcc,	%g7,	%g5
	array32	%i1,	%i0,	%g3
	movvc	%icc,	%o6,	%o0
	ld	[%l7 + 0x64],	%f11
	udivcc	%l1,	0x17A9,	%i3
	std	%f24,	[%l7 + 0x48]
	movn	%icc,	%o2,	%o5
	sth	%l0,	[%l7 + 0x6E]
	restore %g2, 0x0A89, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i7,	%l2,	%i4
	addcc	%o4,	0x11FB,	%o1
	save %o3, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g1,	0x09,	%l4
	fcmpgt32	%f4,	%f4,	%g4
	andcc	%o7,	0x0AB4,	%l3
	fmovdcc	%icc,	%f5,	%f11
	sdiv	%i2,	0x0090,	%i6
	popc	0x0582,	%g7
	stx	%g5,	[%l7 + 0x28]
	andn	%i5,	%i0,	%i1
	sll	%o6,	%o0,	%g3
	edge8ln	%l1,	%o2,	%o5
	stw	%i3,	[%l7 + 0x38]
	nop
	set	0x38, %i3
	stw	%g2,	[%l7 + %i3]
	sth	%l6,	[%l7 + 0x1A]
	movge	%icc,	%l0,	%l2
	edge16n	%i4,	%o4,	%i7
	subcc	%o1,	%o3,	%g6
	movleu	%icc,	%l5,	%l4
	sll	%g1,	0x14,	%g4
	ldd	[%l7 + 0x08],	%l2
	movrne	%i2,	%i6,	%g7
	fpadd16	%f6,	%f8,	%f10
	movcs	%xcc,	%g5,	%i5
	edge32l	%o7,	%i1,	%o6
	addcc	%o0,	%i0,	%l1
	addcc	%g3,	%o5,	%i3
	edge8ln	%g2,	%l6,	%o2
	nop
	set	0x6C, %g1
	ldub	[%l7 + %g1],	%l2
	fmovspos	%xcc,	%f19,	%f0
	andn	%l0,	0x0571,	%i4
	sdivcc	%i7,	0x1909,	%o4
	fcmpes	%fcc0,	%f26,	%f9
	fmuld8ulx16	%f3,	%f31,	%f16
	move	%icc,	%o3,	%g6
	fmovda	%icc,	%f30,	%f0
	movleu	%xcc,	%l5,	%l4
	sth	%o1,	[%l7 + 0x1A]
	fxnors	%f31,	%f13,	%f23
	mova	%xcc,	%g4,	%l3
	movg	%xcc,	%g1,	%i6
	edge16ln	%i2,	%g5,	%g7
	fmovrdlez	%i5,	%f16,	%f2
	udivcc	%i1,	0x1391,	%o7
	udiv	%o0,	0x0656,	%o6
	fmovdvs	%icc,	%f19,	%f4
	ldd	[%l7 + 0x08],	%f10
	sdivcc	%i0,	0x0964,	%l1
	fpsub32s	%f26,	%f11,	%f14
	sllx	%o5,	0x19,	%i3
	sllx	%g2,	0x06,	%g3
	smul	%o2,	%l6,	%l0
	fone	%f30
	movrne	%i4,	0x244,	%i7
	srl	%l2,	0x04,	%o4
	fnors	%f27,	%f9,	%f5
	ld	[%l7 + 0x20],	%f9
	sdiv	%g6,	0x0F62,	%o3
	movg	%icc,	%l4,	%l5
	st	%f8,	[%l7 + 0x0C]
	fpsub32s	%f29,	%f28,	%f4
	udiv	%o1,	0x1123,	%l3
	fmovdgu	%icc,	%f19,	%f29
	ld	[%l7 + 0x50],	%f15
	fmovsgu	%xcc,	%f20,	%f18
	mulscc	%g4,	%i6,	%g1
	ldsw	[%l7 + 0x4C],	%g5
	fmovsa	%icc,	%f6,	%f23
	xor	%i2,	%i5,	%i1
	lduw	[%l7 + 0x50],	%g7
	ldd	[%l7 + 0x10],	%o0
	sra	%o7,	0x10,	%o6
	edge16n	%l1,	%o5,	%i0
	fpadd16	%f16,	%f2,	%f18
	fabss	%f20,	%f31
	movle	%icc,	%i3,	%g3
	sdivx	%g2,	0x1676,	%l6
	subcc	%l0,	0x0873,	%o2
	ldd	[%l7 + 0x40],	%i4
	movvc	%xcc,	%l2,	%o4
	sll	%i7,	%o3,	%l4
	addcc	%l5,	0x012B,	%o1
	movrne	%l3,	0x252,	%g6
	movrgez	%g4,	0x030,	%i6
	smulcc	%g1,	%g5,	%i5
	udiv	%i2,	0x1809,	%g7
	xnor	%i1,	%o7,	%o0
	movrgz	%o6,	%o5,	%i0
	or	%l1,	0x1300,	%i3
	mova	%icc,	%g3,	%g2
	sdivx	%l0,	0x1861,	%o2
	move	%xcc,	%i4,	%l6
	addccc	%o4,	%i7,	%l2
	movrlez	%o3,	0x0FB,	%l4
	alignaddrl	%l5,	%l3,	%o1
	or	%g4,	%g6,	%i6
	sll	%g5,	%g1,	%i5
	fmovdn	%xcc,	%f21,	%f0
	movvc	%icc,	%i2,	%g7
	movvs	%icc,	%i1,	%o7
	fpadd32s	%f27,	%f4,	%f11
	movvs	%icc,	%o6,	%o0
	andn	%o5,	%i0,	%i3
	udivcc	%l1,	0x1F72,	%g2
	xnorcc	%g3,	%o2,	%i4
	ldd	[%l7 + 0x10],	%i6
	addcc	%l0,	%i7,	%o4
	nop
	set	0x18, %o3
	ldsw	[%l7 + %o3],	%o3
	fmovrdgez	%l4,	%f2,	%f0
	stx	%l2,	[%l7 + 0x50]
	sethi	0x15CB,	%l3
	orcc	%l5,	0x00CF,	%g4
	nop
	set	0x38, %l4
	ldx	[%l7 + %l4],	%g6
	ld	[%l7 + 0x44],	%f30
	fnor	%f6,	%f26,	%f28
	std	%f20,	[%l7 + 0x28]
	edge32ln	%o1,	%i6,	%g5
	movne	%xcc,	%g1,	%i5
	andcc	%i2,	0x0D01,	%i1
	edge32ln	%o7,	%g7,	%o0
	fnot1s	%f8,	%f17
	fandnot2s	%f3,	%f24,	%f30
	movge	%xcc,	%o5,	%o6
	udivcc	%i0,	0x023F,	%l1
	movgu	%xcc,	%i3,	%g3
	andcc	%o2,	0x0854,	%g2
	udivx	%l6,	0x0ADE,	%l0
	fandnot2	%f30,	%f26,	%f8
	subccc	%i7,	0x0018,	%i4
	fors	%f14,	%f0,	%f14
	sll	%o3,	%l4,	%o4
	andn	%l3,	%l5,	%g4
	addcc	%g6,	%o1,	%l2
	sir	0x0611
	subccc	%i6,	%g1,	%i5
	edge8l	%i2,	%g5,	%o7
	movl	%xcc,	%i1,	%g7
	sdivx	%o0,	0x0B4A,	%o5
	movneg	%icc,	%i0,	%l1
	mulscc	%i3,	0x024E,	%o6
	fmovdle	%xcc,	%f11,	%f21
	andn	%o2,	%g3,	%g2
	fmovsge	%xcc,	%f14,	%f15
	movn	%icc,	%l0,	%l6
	sth	%i7,	[%l7 + 0x40]
	movcs	%icc,	%i4,	%o3
	fmovdgu	%xcc,	%f1,	%f11
	stb	%o4,	[%l7 + 0x0F]
	smulcc	%l3,	%l5,	%l4
	movpos	%xcc,	%g6,	%o1
	fnot2s	%f10,	%f8
	movrgz	%l2,	%g4,	%g1
	ldd	[%l7 + 0x68],	%i4
	lduh	[%l7 + 0x26],	%i2
	movrgez	%g5,	0x1AF,	%i6
	mulx	%i1,	%g7,	%o7
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	sth	%i0,	[%l7 + 0x76]
	lduw	[%l7 + 0x24],	%o6
	ldub	[%l7 + 0x27],	%o2
	ldub	[%l7 + 0x13],	%g3
	movn	%icc,	%i3,	%g2
	ldub	[%l7 + 0x38],	%l6
	array32	%i7,	%l0,	%o3
	for	%f14,	%f0,	%f14
	array16	%o4,	%l3,	%l5
	smul	%l4,	0x0A17,	%g6
	movre	%i4,	%o1,	%l2
	array32	%g1,	%i5,	%i2
	fmovsvc	%xcc,	%f3,	%f17
	ldd	[%l7 + 0x10],	%f24
	udiv	%g4,	0x0808,	%i6
	movre	%i1,	%g7,	%g5
	sub	%o7,	%o0,	%o5
	orncc	%i0,	%l1,	%o6
	edge16	%o2,	%i3,	%g3
	fcmpes	%fcc3,	%f16,	%f31
	ld	[%l7 + 0x14],	%f30
	fone	%f0
	fandnot2s	%f27,	%f5,	%f4
	xor	%g2,	%i7,	%l6
	smulcc	%o3,	%o4,	%l0
	ldd	[%l7 + 0x28],	%f24
	stb	%l5,	[%l7 + 0x19]
	andn	%l4,	0x079A,	%l3
	edge16	%i4,	%g6,	%l2
	or	%g1,	0x0054,	%i5
	nop
	set	0x60, %g3
	ldd	[%l7 + %g3],	%f18
	fmovsle	%xcc,	%f17,	%f5
	edge16l	%o1,	%g4,	%i6
	fmovrdgz	%i2,	%f0,	%f0
	edge8l	%i1,	%g7,	%g5
	edge16	%o7,	%o5,	%i0
	siam	0x2
	nop
	set	0x68, %o4
	lduh	[%l7 + %o4],	%l1
	sir	0x042F
	edge32n	%o6,	%o0,	%i3
	lduw	[%l7 + 0x58],	%o2
	alignaddr	%g3,	%i7,	%l6
	and	%g2,	0x01B4,	%o4
	ldd	[%l7 + 0x48],	%f24
	array8	%o3,	%l0,	%l4
	fnot1s	%f30,	%f21
	fmovspos	%xcc,	%f6,	%f27
	sra	%l5,	%l3,	%i4
	orncc	%g6,	0x0AFF,	%l2
	movvc	%icc,	%g1,	%i5
	fpadd16s	%f24,	%f14,	%f25
	fnors	%f19,	%f16,	%f6
	movg	%icc,	%g4,	%i6
	fmovrdlez	%i2,	%f0,	%f28
	movrgz	%o1,	0x3B8,	%i1
	edge8l	%g7,	%o7,	%o5
	subcc	%g5,	%l1,	%o6
	edge8n	%o0,	%i3,	%o2
	smul	%i0,	0x0BC5,	%g3
	movrlez	%i7,	%l6,	%o4
	movle	%icc,	%o3,	%l0
	movgu	%icc,	%g2,	%l4
	stw	%l3,	[%l7 + 0x4C]
	srl	%i4,	%g6,	%l5
	andncc	%l2,	%g1,	%i5
	xnorcc	%i6,	0x082D,	%g4
	fnot1s	%f28,	%f6
	movrgez	%o1,	0x317,	%i2
	andn	%i1,	0x0698,	%o7
	movneg	%icc,	%o5,	%g5
	ldub	[%l7 + 0x2C],	%l1
	movpos	%xcc,	%g7,	%o6
	xor	%i3,	0x0831,	%o0
	fmul8sux16	%f4,	%f6,	%f26
	xorcc	%i0,	0x0136,	%o2
	edge32ln	%g3,	%l6,	%o4
	alignaddr	%i7,	%l0,	%o3
	edge16l	%g2,	%l3,	%l4
	movrlez	%i4,	%l5,	%l2
	fmovdneg	%xcc,	%f28,	%f8
	fcmpne16	%f30,	%f0,	%g6
	array8	%i5,	%i6,	%g1
	fpadd16	%f2,	%f24,	%f4
	sdivx	%o1,	0x0964,	%g4
	fmovsn	%icc,	%f29,	%f17
	fcmped	%fcc3,	%f28,	%f16
	movg	%icc,	%i1,	%o7
	smulcc	%i2,	0x0EDF,	%g5
	sllx	%l1,	%o5,	%o6
	edge16	%i3,	%g7,	%i0
	fandnot1s	%f4,	%f8,	%f4
	movneg	%xcc,	%o0,	%g3
	stb	%o2,	[%l7 + 0x50]
	fmovdcs	%icc,	%f24,	%f31
	subc	%l6,	0x0A49,	%i7
	fxor	%f10,	%f6,	%f0
	fnand	%f30,	%f2,	%f30
	fnot2s	%f0,	%f25
	fmuld8ulx16	%f31,	%f8,	%f0
	and	%l0,	0x0799,	%o4
	movneg	%xcc,	%g2,	%o3
	edge16n	%l3,	%l4,	%l5
	popc	0x15EC,	%l2
	fmuld8ulx16	%f9,	%f10,	%f4
	lduh	[%l7 + 0x0C],	%g6
	movg	%icc,	%i5,	%i6
	srlx	%i4,	0x05,	%o1
	srl	%g4,	%g1,	%o7
	srl	%i2,	0x0B,	%i1
	xorcc	%l1,	0x0E9E,	%o5
	umul	%o6,	0x16B6,	%i3
	movleu	%icc,	%g7,	%g5
	smulcc	%o0,	%i0,	%o2
	fnegs	%f9,	%f28
	add	%g3,	%l6,	%i7
	edge32	%o4,	%l0,	%g2
	movneg	%icc,	%l3,	%l4
	movgu	%xcc,	%o3,	%l2
	movg	%icc,	%g6,	%l5
	fmovde	%xcc,	%f0,	%f6
	sdiv	%i6,	0x0476,	%i4
	fandnot1s	%f12,	%f1,	%f24
	xor	%i5,	0x0AD9,	%o1
	xnorcc	%g1,	0x1EF5,	%o7
	mova	%xcc,	%g4,	%i2
	fmovrdgz	%i1,	%f8,	%f4
	popc	0x0360,	%o5
	fcmpgt32	%f14,	%f18,	%l1
	andcc	%i3,	%g7,	%o6
	movge	%icc,	%g5,	%o0
	pdist	%f18,	%f6,	%f12
	xnorcc	%o2,	%g3,	%l6
	fexpand	%f26,	%f12
	sub	%i0,	0x097D,	%i7
	movrgz	%l0,	%o4,	%g2
	umul	%l3,	%l4,	%o3
	xor	%l2,	0x12C4,	%g6
	sdiv	%l5,	0x1BA8,	%i6
	edge16	%i4,	%i5,	%g1
	ldsw	[%l7 + 0x64],	%o1
	stw	%o7,	[%l7 + 0x60]
	movrgez	%g4,	0x01E,	%i1
	popc	0x1B0D,	%i2
	movl	%icc,	%o5,	%i3
	pdist	%f14,	%f28,	%f12
	udivx	%g7,	0x0D07,	%o6
	edge16	%l1,	%g5,	%o0
	srlx	%o2,	0x05,	%l6
	popc	0x0003,	%g3
	orn	%i0,	%l0,	%o4
	sdivcc	%g2,	0x135F,	%l3
	sdiv	%l4,	0x1BC9,	%o3
	movcs	%icc,	%i7,	%g6
	mulscc	%l2,	0x11F9,	%i6
	edge32n	%l5,	%i5,	%i4
	sdivcc	%o1,	0x1613,	%o7
	fmovsneg	%icc,	%f9,	%f30
	restore %g1, 0x033F, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i1,	0x1BAD,	%i2
	sdivx	%i3,	0x1CBB,	%g7
	edge8ln	%o6,	%o5,	%g5
	alignaddrl	%o0,	%o2,	%l1
	fmovrse	%l6,	%f20,	%f28
	srl	%g3,	%i0,	%o4
	array16	%g2,	%l3,	%l0
	fnegs	%f22,	%f30
	alignaddrl	%o3,	%i7,	%g6
	srlx	%l2,	0x1E,	%i6
	lduw	[%l7 + 0x1C],	%l4
	fcmpeq16	%f12,	%f16,	%i5
	stb	%l5,	[%l7 + 0x1E]
	array32	%i4,	%o1,	%o7
	movre	%g1,	0x19C,	%i1
	udivx	%g4,	0x088F,	%i2
	fnot1	%f18,	%f12
	fcmple32	%f12,	%f12,	%g7
	nop
	set	0x2E, %i0
	stb	%o6,	[%l7 + %i0]
	fmovsa	%xcc,	%f9,	%f12
	fmovdl	%xcc,	%f27,	%f31
	fandnot2s	%f5,	%f6,	%f17
	fmovsa	%icc,	%f1,	%f17
	save %i3, 0x0237, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g5,	%o2,	%o0
	smulcc	%l1,	%g3,	%i0
	orncc	%l6,	0x18E0,	%o4
	movle	%icc,	%l3,	%l0
	fmovdcs	%xcc,	%f21,	%f26
	fmovscc	%xcc,	%f23,	%f3
	sll	%g2,	%i7,	%o3
	udiv	%l2,	0x06B4,	%g6
	movleu	%xcc,	%l4,	%i6
	lduh	[%l7 + 0x26],	%i5
	alignaddrl	%i4,	%o1,	%l5
	fors	%f12,	%f1,	%f3
	and	%g1,	%i1,	%g4
	edge8l	%i2,	%o7,	%o6
	save %i3, 0x16D8, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g5,	%g7,	%o2
	array32	%o0,	%l1,	%i0
	ldx	[%l7 + 0x60],	%l6
	andncc	%o4,	%l3,	%g3
	ld	[%l7 + 0x30],	%f7
	sra	%l0,	0x03,	%i7
	ldd	[%l7 + 0x40],	%f16
	xnor	%g2,	%l2,	%g6
	xnor	%l4,	0x1C6C,	%o3
	fmovde	%icc,	%f11,	%f17
	orn	%i5,	0x086A,	%i6
	add	%o1,	%l5,	%g1
	xor	%i4,	%g4,	%i2
	lduh	[%l7 + 0x54],	%i1
	mulx	%o7,	%i3,	%o5
	fmovsvs	%icc,	%f5,	%f25
	addccc	%g5,	0x13D0,	%o6
	fnot1	%f16,	%f0
	stw	%g7,	[%l7 + 0x34]
	movl	%icc,	%o0,	%o2
	xnor	%i0,	0x1520,	%l1
	fnot1	%f14,	%f12
	fsrc2	%f18,	%f0
	fmovsne	%icc,	%f1,	%f29
	or	%l6,	0x1F59,	%o4
	movle	%xcc,	%g3,	%l0
	st	%f3,	[%l7 + 0x10]
	xnorcc	%i7,	%g2,	%l2
	subccc	%g6,	0x0B84,	%l3
	st	%f29,	[%l7 + 0x78]
	move	%xcc,	%l4,	%i5
	movneg	%xcc,	%o3,	%o1
	faligndata	%f22,	%f10,	%f14
	stw	%l5,	[%l7 + 0x58]
	edge8	%g1,	%i6,	%g4
	movrlz	%i4,	0x100,	%i2
	andncc	%o7,	%i1,	%o5
	xorcc	%g5,	%i3,	%o6
	fmovsl	%icc,	%f26,	%f11
	fxors	%f17,	%f22,	%f6
	edge16	%o0,	%g7,	%o2
	umulcc	%i0,	%l1,	%o4
	subccc	%g3,	%l6,	%i7
	edge32ln	%l0,	%l2,	%g2
	edge16l	%g6,	%l4,	%l3
	mova	%icc,	%o3,	%i5
	or	%o1,	%g1,	%i6
	mulscc	%l5,	%i4,	%g4
	fmovsle	%icc,	%f12,	%f28
	fabss	%f26,	%f30
	sdivx	%i2,	0x1131,	%o7
	ldsh	[%l7 + 0x68],	%i1
	std	%f28,	[%l7 + 0x70]
	sethi	0x1574,	%g5
	xorcc	%i3,	%o6,	%o5
	fpack32	%f24,	%f30,	%f18
	movrgz	%g7,	0x054,	%o0
	edge8ln	%i0,	%o2,	%l1
	fcmple32	%f16,	%f16,	%g3
	siam	0x0
	movvs	%icc,	%l6,	%i7
	srl	%o4,	%l2,	%g2
	andn	%g6,	0x1C99,	%l4
	fmovsl	%icc,	%f2,	%f31
	sll	%l3,	%o3,	%i5
	udiv	%o1,	0x036F,	%l0
	stx	%g1,	[%l7 + 0x48]
	fands	%f27,	%f19,	%f4
	movpos	%icc,	%i6,	%i4
	srl	%g4,	%i2,	%l5
	fabsd	%f24,	%f2
	sll	%i1,	%g5,	%i3
	mulscc	%o7,	0x1653,	%o5
	ldub	[%l7 + 0x10],	%g7
	fmovde	%xcc,	%f29,	%f4
	ldsh	[%l7 + 0x28],	%o0
	fpsub16	%f26,	%f4,	%f8
	sdiv	%o6,	0x0E11,	%o2
	ldd	[%l7 + 0x38],	%l0
	sra	%g3,	%i0,	%i7
	movcc	%xcc,	%o4,	%l2
	nop
	set	0x10, %g2
	sth	%l6,	[%l7 + %g2]
	movrgz	%g6,	%l4,	%l3
	ldub	[%l7 + 0x63],	%o3
	movge	%xcc,	%g2,	%o1
	udivcc	%l0,	0x146D,	%i5
	mova	%icc,	%i6,	%i4
	fmovsvc	%icc,	%f28,	%f28
	ld	[%l7 + 0x0C],	%f18
	movle	%icc,	%g1,	%g4
	andn	%i2,	0x12FA,	%l5
	fmovscc	%xcc,	%f0,	%f10
	addcc	%g5,	%i3,	%i1
	ldsb	[%l7 + 0x57],	%o7
	edge32n	%o5,	%g7,	%o0
	subc	%o2,	0x1EB7,	%o6
	movrgz	%l1,	%g3,	%i7
	srl	%o4,	%l2,	%i0
	sdivcc	%g6,	0x01C3,	%l6
	st	%f18,	[%l7 + 0x38]
	for	%f16,	%f4,	%f6
	srl	%l4,	%o3,	%l3
	ldx	[%l7 + 0x20],	%g2
	ldd	[%l7 + 0x30],	%l0
	udivx	%i5,	0x03D4,	%i6
	stw	%i4,	[%l7 + 0x28]
	ldd	[%l7 + 0x08],	%g0
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	ldsw	[%l7 + 0x44],	%l5
	mova	%icc,	%g5,	%i3
	mulx	%o1,	%o7,	%o5
	xnorcc	%i1,	%o0,	%o2
	mova	%xcc,	%g7,	%l1
	edge16n	%g3,	%i7,	%o6
	fmovdpos	%xcc,	%f4,	%f1
	edge32	%o4,	%i0,	%l2
	xnor	%g6,	0x1863,	%l4
	srlx	%o3,	0x18,	%l3
	fxnors	%f18,	%f29,	%f14
	edge16	%g2,	%l0,	%l6
	edge8l	%i5,	%i6,	%i4
	movn	%icc,	%g4,	%i2
	sdivx	%l5,	0x192F,	%g1
	ldd	[%l7 + 0x50],	%f6
	alignaddr	%i3,	%o1,	%o7
	sethi	0x195E,	%g5
	st	%f9,	[%l7 + 0x34]
	sir	0x1019
	fors	%f20,	%f3,	%f22
	orcc	%o5,	0x190F,	%o0
	fmovsg	%icc,	%f24,	%f11
	sra	%o2,	0x11,	%i1
	fnot1	%f16,	%f8
	movleu	%xcc,	%g7,	%l1
	fands	%f13,	%f19,	%f9
	edge16ln	%i7,	%g3,	%o6
	fpsub32	%f12,	%f18,	%f24
	restore %i0, 0x1F3D, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x058C
	movvc	%xcc,	%l2,	%g6
	fpadd32s	%f14,	%f29,	%f1
	ldd	[%l7 + 0x08],	%f24
	edge32ln	%o3,	%l4,	%g2
	mulx	%l3,	0x0005,	%l6
	movvc	%xcc,	%i5,	%i6
	udivcc	%i4,	0x092E,	%g4
	andcc	%l0,	%i2,	%l5
	move	%icc,	%g1,	%o1
	srl	%o7,	%g5,	%o5
	nop
	set	0x24, %o7
	ldsw	[%l7 + %o7],	%o0
	ld	[%l7 + 0x14],	%f3
	stx	%i3,	[%l7 + 0x48]
	movrgz	%o2,	0x241,	%g7
	edge8n	%l1,	%i7,	%g3
	edge16n	%i1,	%i0,	%o6
	edge32n	%l2,	%o4,	%o3
	srl	%l4,	%g6,	%g2
	movrlez	%l6,	%i5,	%i6
	sth	%i4,	[%l7 + 0x7E]
	fmovdge	%icc,	%f23,	%f7
	edge32	%g4,	%l3,	%l0
	edge8	%i2,	%g1,	%o1
	fpsub32	%f10,	%f18,	%f2
	andcc	%o7,	0x01C4,	%g5
	movcc	%icc,	%l5,	%o5
	xnor	%i3,	0x086E,	%o2
	subc	%g7,	0x1614,	%l1
	movrgz	%o0,	%g3,	%i1
	movge	%icc,	%i7,	%o6
	edge8	%i0,	%o4,	%l2
	sth	%l4,	[%l7 + 0x22]
	edge32n	%o3,	%g6,	%g2
	edge16ln	%l6,	%i6,	%i4
	ldd	[%l7 + 0x38],	%f16
	orcc	%g4,	%l3,	%l0
	srlx	%i2,	%i5,	%o1
	array8	%g1,	%o7,	%g5
	fmovrslz	%l5,	%f18,	%f1
	fnegd	%f24,	%f26
	ldsb	[%l7 + 0x1A],	%o5
	array32	%i3,	%o2,	%l1
	movvs	%xcc,	%g7,	%o0
	lduw	[%l7 + 0x3C],	%g3
	smul	%i1,	%o6,	%i0
	edge16l	%i7,	%l2,	%l4
	lduw	[%l7 + 0x58],	%o4
	lduw	[%l7 + 0x34],	%o3
	movvs	%xcc,	%g2,	%l6
	add	%i6,	0x13EE,	%i4
	sir	0x0CEA
	umulcc	%g6,	%g4,	%l0
	xnorcc	%l3,	%i5,	%o1
	sub	%g1,	%o7,	%g5
	fmovsa	%icc,	%f7,	%f23
	sdiv	%l5,	0x18F6,	%o5
	movrgz	%i3,	%o2,	%i2
	sdivx	%g7,	0x0EAF,	%o0
	fmovdl	%xcc,	%f11,	%f21
	movcs	%icc,	%g3,	%i1
	movre	%l1,	%o6,	%i7
	edge16ln	%l2,	%l4,	%i0
	ldsw	[%l7 + 0x40],	%o3
	movvs	%icc,	%g2,	%o4
	fmovrslez	%l6,	%f26,	%f5
	xnorcc	%i4,	%i6,	%g4
	fmuld8sux16	%f4,	%f22,	%f4
	mulscc	%l0,	%l3,	%g6
	edge32	%o1,	%i5,	%g1
	move	%icc,	%g5,	%o7
	fsrc1s	%f19,	%f20
	movcc	%xcc,	%o5,	%i3
	or	%l5,	%i2,	%g7
	fmul8ulx16	%f2,	%f2,	%f12
	sth	%o2,	[%l7 + 0x12]
	subccc	%g3,	0x13D5,	%o0
	fpack16	%f4,	%f26
	sdiv	%l1,	0x14D2,	%i1
	edge32ln	%o6,	%i7,	%l2
	fmovdle	%icc,	%f16,	%f28
	sdivcc	%l4,	0x04BE,	%o3
	ldub	[%l7 + 0x39],	%i0
	ldd	[%l7 + 0x10],	%f12
	srl	%g2,	0x02,	%l6
	and	%i4,	%o4,	%g4
	edge8n	%i6,	%l0,	%l3
	movleu	%xcc,	%o1,	%g6
	fcmps	%fcc3,	%f9,	%f30
	fmovsleu	%xcc,	%f12,	%f22
	ld	[%l7 + 0x68],	%f8
	fpsub32	%f14,	%f20,	%f20
	subcc	%i5,	0x0F31,	%g1
	fsrc1	%f30,	%f4
	srax	%g5,	%o5,	%o7
	movrgz	%l5,	%i2,	%i3
	movneg	%icc,	%g7,	%g3
	ldub	[%l7 + 0x65],	%o0
	popc	%o2,	%l1
	subcc	%o6,	%i1,	%l2
	bshuffle	%f0,	%f0,	%f18
	save %l4, 0x1825, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f24,	%f31,	%f0
	fmovsneg	%xcc,	%f14,	%f11
	fmovdgu	%icc,	%f7,	%f27
	edge8ln	%i0,	%i7,	%g2
	fmovse	%icc,	%f29,	%f10
	mova	%xcc,	%l6,	%o4
	andncc	%i4,	%g4,	%i6
	sll	%l3,	0x06,	%o1
	movn	%xcc,	%g6,	%l0
	andn	%g1,	%i5,	%g5
	sll	%o7,	%l5,	%i2
	alignaddr	%o5,	%i3,	%g3
	edge16l	%o0,	%g7,	%o2
	udiv	%l1,	0x09C8,	%o6
	addcc	%i1,	0x13C9,	%l2
	movl	%xcc,	%l4,	%i0
	udiv	%i7,	0x03FC,	%o3
	edge16n	%l6,	%o4,	%g2
	fmovdvc	%xcc,	%f19,	%f29
	edge16l	%i4,	%i6,	%g4
	sllx	%o1,	0x0A,	%g6
	and	%l3,	0x0D7C,	%l0
	fsrc1s	%f13,	%f30
	sdiv	%g1,	0x1CF6,	%g5
	smulcc	%o7,	0x1E6A,	%l5
	popc	%i5,	%i2
	fones	%f6
	subccc	%i3,	%g3,	%o5
	save %g7, %o0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f21,	%f30,	%f10
	movl	%icc,	%o2,	%o6
	fmovdle	%xcc,	%f0,	%f6
	mulx	%l2,	%i1,	%l4
	xnor	%i7,	0x0FDE,	%i0
	fcmpgt32	%f20,	%f24,	%l6
	edge32	%o3,	%g2,	%i4
	fand	%f0,	%f16,	%f4
	st	%f24,	[%l7 + 0x30]
	movrgez	%i6,	0x1CA,	%g4
	fmul8x16	%f5,	%f26,	%f6
	andn	%o1,	%o4,	%g6
	stw	%l3,	[%l7 + 0x3C]
	xorcc	%l0,	%g5,	%g1
	fmul8sux16	%f6,	%f22,	%f20
	pdist	%f18,	%f12,	%f14
	addc	%o7,	%l5,	%i5
	stw	%i2,	[%l7 + 0x44]
	orncc	%g3,	0x0CE0,	%o5
	edge16	%i3,	%o0,	%l1
	fmovsa	%icc,	%f8,	%f30
	std	%f8,	[%l7 + 0x58]
	std	%f30,	[%l7 + 0x10]
	fmovse	%xcc,	%f29,	%f28
	movrlez	%g7,	0x15E,	%o2
	fmovsleu	%icc,	%f30,	%f26
	addc	%l2,	0x1AE0,	%o6
	addcc	%i1,	%i7,	%i0
	fmovdcs	%icc,	%f24,	%f3
	fnegs	%f7,	%f3
	lduh	[%l7 + 0x4C],	%l6
	sethi	0x0858,	%o3
	edge8ln	%l4,	%g2,	%i6
	lduh	[%l7 + 0x4C],	%i4
	srl	%o1,	%g4,	%g6
	alignaddrl	%o4,	%l3,	%l0
	sdivcc	%g5,	0x0159,	%g1
	udivx	%o7,	0x0893,	%i5
	sra	%l5,	%g3,	%o5
	xorcc	%i3,	0x1FCB,	%o0
	edge16	%i2,	%l1,	%g7
	fmovrsgz	%o2,	%f3,	%f21
	edge8ln	%l2,	%o6,	%i1
	fmovsl	%xcc,	%f21,	%f25
	sth	%i0,	[%l7 + 0x7C]
	mulscc	%l6,	%o3,	%l4
	mova	%icc,	%g2,	%i7
	fone	%f26
	addc	%i4,	%o1,	%i6
	fnegd	%f16,	%f8
	movne	%icc,	%g6,	%o4
	movrlz	%g4,	%l0,	%g5
	movneg	%icc,	%l3,	%o7
	fmovdne	%xcc,	%f4,	%f5
	movrgez	%g1,	%l5,	%g3
	edge32	%o5,	%i3,	%i5
	edge8n	%i2,	%l1,	%o0
	fpsub32s	%f31,	%f7,	%f0
	fcmple32	%f30,	%f30,	%o2
	sra	%l2,	%o6,	%i1
	smul	%g7,	0x074D,	%l6
	sdiv	%i0,	0x1E72,	%o3
	sethi	0x1BAD,	%l4
	movleu	%icc,	%i7,	%g2
	sll	%o1,	0x0F,	%i6
	edge32	%g6,	%o4,	%g4
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	fmul8x16	%f25,	%f10,	%f28
	fpackfix	%f6,	%f18
	fmovscs	%xcc,	%f10,	%f16
	movrlez	%l0,	%l3,	%g1
	fmovdcc	%xcc,	%f16,	%f6
	edge32ln	%l5,	%g3,	%o5
	movle	%xcc,	%o7,	%i3
	edge32ln	%i5,	%l1,	%i2
	ldub	[%l7 + 0x4E],	%o0
	popc	0x0C66,	%l2
	udivcc	%o2,	0x0BEF,	%i1
	restore %o6, %g7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o3,	0x093B,	%l4
	fmovdvc	%icc,	%f13,	%f8
	sdiv	%i7,	0x1482,	%g2
	fsrc2	%f0,	%f8
	fmul8x16	%f12,	%f14,	%f20
	stw	%l6,	[%l7 + 0x7C]
	andn	%i6,	%g6,	%o4
	xnorcc	%o1,	%g4,	%i4
	movl	%xcc,	%g5,	%l3
	movne	%icc,	%l0,	%l5
	movge	%xcc,	%g1,	%o5
	fnor	%f16,	%f4,	%f4
	sdiv	%o7,	0x0442,	%g3
	sth	%i3,	[%l7 + 0x56]
	fzero	%f6
	sll	%l1,	%i2,	%o0
	mulscc	%l2,	0x0AF4,	%i5
	edge16n	%o2,	%o6,	%g7
	xnor	%i0,	%i1,	%o3
	popc	0x1547,	%l4
	ldsw	[%l7 + 0x4C],	%i7
	andncc	%g2,	%i6,	%l6
	fmovs	%f11,	%f8
	edge8n	%g6,	%o4,	%g4
	fmul8ulx16	%f24,	%f4,	%f14
	movne	%xcc,	%i4,	%g5
	edge32n	%l3,	%l0,	%l5
	ldd	[%l7 + 0x30],	%f30
	array32	%g1,	%o5,	%o7
	sdivcc	%g3,	0x1482,	%i3
	ldd	[%l7 + 0x10],	%f28
	movgu	%icc,	%l1,	%i2
	fmovrsgz	%o1,	%f28,	%f4
	edge8	%o0,	%i5,	%o2
	addcc	%l2,	0x073D,	%g7
	smulcc	%o6,	0x113C,	%i0
	stb	%i1,	[%l7 + 0x77]
	xnor	%l4,	%i7,	%g2
	movneg	%xcc,	%o3,	%i6
	fmovrse	%g6,	%f25,	%f21
	std	%f10,	[%l7 + 0x60]
	movpos	%icc,	%o4,	%l6
	sdiv	%g4,	0x118A,	%g5
	movleu	%xcc,	%l3,	%l0
	std	%f20,	[%l7 + 0x30]
	edge16l	%i4,	%l5,	%g1
	orcc	%o7,	0x17C8,	%g3
	movge	%icc,	%o5,	%i3
	sethi	0x0DC8,	%i2
	move	%icc,	%o1,	%l1
	fabss	%f24,	%f12
	edge32n	%o0,	%i5,	%l2
	and	%g7,	%o6,	%i0
	movvs	%xcc,	%i1,	%l4
	smul	%i7,	0x1239,	%g2
	movvc	%xcc,	%o3,	%o2
	subc	%i6,	%g6,	%l6
	edge16	%o4,	%g5,	%g4
	edge16ln	%l0,	%i4,	%l5
	edge16l	%l3,	%o7,	%g1
	xor	%o5,	%i3,	%g3
	fsrc2s	%f9,	%f12
	movrlz	%i2,	%l1,	%o1
	sllx	%o0,	%l2,	%g7
	movrlz	%i5,	0x021,	%o6
	fmovsle	%xcc,	%f18,	%f25
	movl	%icc,	%i1,	%i0
	move	%xcc,	%i7,	%l4
	srlx	%o3,	%o2,	%g2
	fabsd	%f30,	%f20
	sra	%g6,	0x12,	%i6
	ldd	[%l7 + 0x58],	%i6
	lduh	[%l7 + 0x38],	%g5
	edge16	%o4,	%l0,	%g4
	fmovrsne	%l5,	%f1,	%f11
	fmovdl	%xcc,	%f30,	%f21
	subcc	%i4,	%o7,	%l3
	fnot2	%f10,	%f30
	edge16ln	%o5,	%i3,	%g1
	sdivx	%g3,	0x1562,	%l1
	movne	%xcc,	%o1,	%o0
	array8	%i2,	%g7,	%i5
	edge16n	%o6,	%i1,	%l2
	movvs	%xcc,	%i0,	%l4
	stx	%i7,	[%l7 + 0x30]
	save %o3, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x2C],	%i6
	subc	%l6,	%g6,	%o4
	edge16n	%g5,	%l0,	%l5
	movrlz	%i4,	0x3F9,	%o7
	fzero	%f4
	edge8	%g4,	%l3,	%o5
	ldx	[%l7 + 0x38],	%g1
	movgu	%xcc,	%g3,	%l1
	movrlez	%i3,	%o1,	%o0
	ldsh	[%l7 + 0x14],	%g7
	array16	%i5,	%o6,	%i1
	fpsub16	%f14,	%f14,	%f20
	edge16l	%l2,	%i2,	%l4
	movrne	%i0,	%i7,	%g2
	orcc	%o2,	0x09FD,	%i6
	lduw	[%l7 + 0x58],	%l6
	fpmerge	%f3,	%f28,	%f30
	edge16ln	%g6,	%o3,	%g5
	ld	[%l7 + 0x5C],	%f30
	sra	%l0,	%l5,	%o4
	array32	%o7,	%i4,	%g4
	ldx	[%l7 + 0x18],	%o5
	array16	%g1,	%l3,	%l1
	ldsh	[%l7 + 0x2A],	%i3
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	movle	%xcc,	%g7,	%i5
	movne	%xcc,	%o6,	%i1
	alignaddr	%l2,	%i2,	%g3
	movl	%icc,	%l4,	%i7
	umulcc	%i0,	%o2,	%i6
	stw	%l6,	[%l7 + 0x58]
	std	%f18,	[%l7 + 0x58]
	edge8l	%g6,	%o3,	%g5
	fmovrslez	%l0,	%f25,	%f11
	movcs	%xcc,	%l5,	%g2
	addccc	%o4,	0x0E40,	%i4
	addcc	%g4,	%o5,	%o7
	edge32l	%g1,	%l1,	%l3
	movne	%icc,	%i3,	%o0
	fmovs	%f20,	%f1
	movrlz	%o1,	%g7,	%i5
	srax	%i1,	%o6,	%l2
	and	%i2,	%g3,	%l4
	lduh	[%l7 + 0x2A],	%i7
	lduw	[%l7 + 0x70],	%o2
	edge32n	%i0,	%i6,	%l6
	movre	%o3,	%g5,	%l0
	mova	%icc,	%l5,	%g2
	fornot1s	%f22,	%f3,	%f23
	sdiv	%g6,	0x021D,	%i4
	fsrc1	%f28,	%f8
	srl	%o4,	0x02,	%g4
	stw	%o5,	[%l7 + 0x40]
	sethi	0x0EAE,	%g1
	std	%f18,	[%l7 + 0x68]
	orncc	%o7,	0x03D5,	%l1
	move	%icc,	%l3,	%i3
	movl	%xcc,	%o0,	%g7
	fmovrde	%i5,	%f0,	%f8
	orncc	%i1,	%o1,	%o6
	sll	%l2,	0x17,	%i2
	movcs	%xcc,	%g3,	%i7
	umulcc	%l4,	0x12E1,	%o2
	movle	%xcc,	%i6,	%i0
	array16	%o3,	%g5,	%l6
	fmovdg	%icc,	%f7,	%f21
	bshuffle	%f22,	%f18,	%f16
	movle	%icc,	%l5,	%g2
	addcc	%g6,	%l0,	%o4
	fmovda	%icc,	%f16,	%f29
	fsrc1	%f10,	%f0
	udivx	%i4,	0x0844,	%o5
	or	%g4,	%o7,	%l1
	fmul8ulx16	%f6,	%f18,	%f16
	movne	%xcc,	%l3,	%g1
	sethi	0x017E,	%o0
	fnand	%f30,	%f6,	%f28
	fmuld8sux16	%f4,	%f31,	%f8
	fmovdn	%icc,	%f8,	%f1
	mulscc	%i3,	%g7,	%i1
	movrgez	%o1,	%i5,	%l2
	sra	%i2,	0x16,	%g3
	fmovsne	%xcc,	%f1,	%f10
	edge16n	%o6,	%l4,	%o2
	srax	%i6,	%i7,	%o3
	edge32	%g5,	%i0,	%l6
	lduw	[%l7 + 0x68],	%g2
	srl	%l5,	0x06,	%g6
	movvs	%xcc,	%l0,	%i4
	or	%o5,	%o4,	%g4
	addcc	%o7,	0x01D6,	%l3
	sra	%g1,	0x1E,	%o0
	ldd	[%l7 + 0x78],	%l0
	sub	%g7,	0x087A,	%i3
	fpack32	%f20,	%f16,	%f2
	array8	%o1,	%i1,	%l2
	edge32ln	%i5,	%i2,	%o6
	movre	%g3,	0x203,	%l4
	fcmpgt16	%f8,	%f28,	%i6
	array32	%i7,	%o2,	%g5
	movcc	%icc,	%o3,	%i0
	movne	%xcc,	%g2,	%l5
	edge32l	%g6,	%l6,	%i4
	mova	%icc,	%o5,	%o4
	fmovdl	%icc,	%f17,	%f24
	fcmpgt32	%f14,	%f10,	%l0
	fpmerge	%f24,	%f20,	%f20
	edge32ln	%g4,	%l3,	%o7
	fmovrsgz	%g1,	%f5,	%f9
	fcmpne32	%f0,	%f4,	%o0
	movg	%icc,	%g7,	%i3
	edge32n	%o1,	%i1,	%l2
	edge16	%i5,	%l1,	%o6
	xor	%g3,	0x1AED,	%l4
	lduw	[%l7 + 0x58],	%i2
	orn	%i7,	%o2,	%i6
	orcc	%o3,	%g5,	%g2
	sra	%l5,	%g6,	%l6
	sdivx	%i0,	0x0A2E,	%o5
	edge8	%i4,	%l0,	%o4
	stw	%g4,	[%l7 + 0x08]
	movne	%icc,	%l3,	%o7
	xnorcc	%o0,	0x018E,	%g1
	movgu	%icc,	%g7,	%o1
	ldsh	[%l7 + 0x78],	%i1
	movvc	%xcc,	%l2,	%i3
	alignaddr	%i5,	%o6,	%l1
	edge32n	%g3,	%l4,	%i2
	movrgz	%i7,	%o2,	%o3
	movl	%xcc,	%i6,	%g2
	sethi	0x125C,	%l5
	fmovscc	%xcc,	%f0,	%f18
	fmovrsne	%g5,	%f16,	%f18
	std	%f6,	[%l7 + 0x38]
	array32	%g6,	%i0,	%o5
	array32	%i4,	%l0,	%l6
	andcc	%g4,	0x129F,	%o4
	movgu	%icc,	%l3,	%o7
	andcc	%o0,	%g1,	%o1
	lduw	[%l7 + 0x40],	%i1
	add	%l2,	0x09DD,	%i3
	fmovsge	%xcc,	%f8,	%f14
	sllx	%g7,	0x1A,	%i5
	xnorcc	%o6,	0x1920,	%l1
	xnorcc	%g3,	0x1DB9,	%i2
	movrgz	%l4,	%o2,	%i7
	movg	%xcc,	%i6,	%g2
	sth	%o3,	[%l7 + 0x66]
	sll	%l5,	0x15,	%g6
	add	%g5,	%i0,	%o5
	edge16l	%l0,	%i4,	%l6
	fnors	%f8,	%f6,	%f15
	edge32	%o4,	%g4,	%l3
	sll	%o0,	%g1,	%o1
	movle	%icc,	%o7,	%l2
	lduh	[%l7 + 0x30],	%i3
	sllx	%i1,	%i5,	%g7
	movre	%o6,	%g3,	%i2
	lduh	[%l7 + 0x4E],	%l4
	fzero	%f2
	or	%o2,	0x09CF,	%i7
	smul	%l1,	0x1305,	%g2
	srl	%i6,	0x0D,	%l5
	nop
	set	0x50, %o2
	stx	%o3,	[%l7 + %o2]
	nop
	set	0x28, %i5
	sth	%g6,	[%l7 + %i5]
	fmovde	%xcc,	%f13,	%f7
	fmul8ulx16	%f24,	%f18,	%f10
	movcc	%xcc,	%i0,	%o5
	movre	%l0,	0x383,	%i4
	fmovscs	%xcc,	%f13,	%f8
	nop
	set	0x48, %l6
	ldd	[%l7 + %l6],	%f0
	andn	%g5,	0x13F5,	%o4
	ldub	[%l7 + 0x76],	%l6
	fmovdcs	%icc,	%f26,	%f18
	edge32l	%g4,	%o0,	%l3
	lduh	[%l7 + 0x16],	%o1
	movcc	%xcc,	%g1,	%o7
	fnor	%f18,	%f20,	%f4
	save %l2, %i1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g7,	%i3,	%g3
	st	%f17,	[%l7 + 0x58]
	umul	%i2,	%l4,	%o6
	alignaddr	%i7,	%o2,	%l1
	std	%f18,	[%l7 + 0x30]
	movrlz	%g2,	0x10F,	%l5
	orn	%i6,	%o3,	%g6
	and	%i0,	0x0350,	%l0
	edge8	%i4,	%g5,	%o5
	fmul8x16au	%f3,	%f11,	%f2
	fsrc1s	%f8,	%f21
	edge8ln	%o4,	%l6,	%g4
	and	%l3,	%o0,	%o1
	addcc	%o7,	0x090C,	%g1
	fmovse	%xcc,	%f4,	%f21
	edge8l	%l2,	%i5,	%i1
	edge32l	%g7,	%g3,	%i2
	andn	%l4,	%i3,	%o6
	srlx	%i7,	%l1,	%g2
	edge8l	%o2,	%i6,	%o3
	stx	%g6,	[%l7 + 0x28]
	fmovde	%xcc,	%f13,	%f5
	ld	[%l7 + 0x20],	%f10
	stb	%l5,	[%l7 + 0x5B]
	subcc	%i0,	%i4,	%g5
	lduh	[%l7 + 0x50],	%l0
	fornot1	%f24,	%f8,	%f6
	mova	%icc,	%o5,	%l6
	subc	%g4,	0x12BA,	%l3
	movrlez	%o0,	0x363,	%o4
	umulcc	%o7,	%o1,	%l2
	umulcc	%i5,	0x12C3,	%i1
	movcs	%icc,	%g1,	%g3
	std	%f0,	[%l7 + 0x50]
	subc	%i2,	0x186E,	%l4
	movrgez	%g7,	0x0D2,	%o6
	movcs	%xcc,	%i3,	%l1
	movrne	%i7,	0x2E4,	%g2
	stx	%o2,	[%l7 + 0x58]
	mulscc	%i6,	%g6,	%l5
	movrlz	%o3,	%i0,	%i4
	mulscc	%g5,	%l0,	%l6
	movre	%g4,	%o5,	%o0
	or	%o4,	0x0B0A,	%o7
	sethi	0x1948,	%l3
	edge16ln	%l2,	%i5,	%o1
	fornot1s	%f23,	%f21,	%f0
	nop
	set	0x38, %i6
	ldsw	[%l7 + %i6],	%i1
	fpadd16	%f0,	%f20,	%f2
	ldx	[%l7 + 0x48],	%g1
	fmovrse	%g3,	%f4,	%f2
	siam	0x7
	orn	%l4,	%i2,	%g7
	popc	%i3,	%o6
	fsrc1s	%f9,	%f26
	alignaddr	%i7,	%g2,	%l1
	fmul8x16au	%f18,	%f25,	%f14
	movrgz	%o2,	%i6,	%g6
	ldx	[%l7 + 0x68],	%o3
	sethi	0x0DB4,	%i0
	smulcc	%l5,	%i4,	%g5
	lduw	[%l7 + 0x40],	%l0
	movl	%xcc,	%l6,	%o5
	edge32n	%o0,	%g4,	%o7
	fnot1s	%f15,	%f25
	edge16	%o4,	%l2,	%l3
	fabss	%f30,	%f14
	pdist	%f24,	%f24,	%f6
	sdivx	%i5,	0x071A,	%i1
	movvs	%icc,	%o1,	%g1
	alignaddr	%l4,	%g3,	%i2
	umulcc	%g7,	0x1A58,	%o6
	xnor	%i3,	0x0B5A,	%g2
	fabsd	%f8,	%f20
	fmovse	%icc,	%f5,	%f15
	sth	%l1,	[%l7 + 0x24]
	and	%o2,	%i6,	%i7
	ldsw	[%l7 + 0x24],	%o3
	lduw	[%l7 + 0x60],	%g6
	stw	%i0,	[%l7 + 0x54]
	srax	%i4,	0x1D,	%g5
	addc	%l5,	0x122F,	%l0
	xorcc	%l6,	0x1B37,	%o5
	edge32l	%g4,	%o0,	%o7
	fmovs	%f15,	%f2
	addcc	%o4,	0x12DD,	%l2
	fnand	%f4,	%f2,	%f14
	udivcc	%i5,	0x0F10,	%i1
	array8	%l3,	%g1,	%l4
	srl	%o1,	0x08,	%i2
	stx	%g3,	[%l7 + 0x78]
	save %o6, %g7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i3,	0x1E,	%o2
	ldd	[%l7 + 0x50],	%f28
	andncc	%i6,	%i7,	%l1
	stb	%g6,	[%l7 + 0x45]
	movrne	%i0,	%o3,	%g5
	fcmped	%fcc1,	%f8,	%f10
	ldsh	[%l7 + 0x10],	%l5
	edge32l	%i4,	%l6,	%o5
	movle	%xcc,	%l0,	%g4
	movn	%icc,	%o0,	%o7
	sethi	0x01D8,	%l2
	subccc	%i5,	%o4,	%l3
	edge8n	%g1,	%l4,	%i1
	udivx	%i2,	0x09A5,	%o1
	movl	%xcc,	%g3,	%o6
	sdivcc	%g2,	0x0B64,	%i3
	movvc	%icc,	%o2,	%g7
	xorcc	%i7,	0x0E40,	%i6
	ldsb	[%l7 + 0x2A],	%l1
	udivcc	%g6,	0x07AE,	%i0
	fnegs	%f24,	%f11
	array16	%g5,	%l5,	%i4
	srlx	%l6,	0x09,	%o5
	fcmpne32	%f22,	%f10,	%l0
	andncc	%g4,	%o0,	%o3
	ldsw	[%l7 + 0x20],	%l2
	fmovrse	%i5,	%f29,	%f0
	fmovd	%f24,	%f22
	edge16	%o4,	%o7,	%g1
	nop
	set	0x78, %o5
	std	%f14,	[%l7 + %o5]
	edge32n	%l3,	%l4,	%i1
	fornot1	%f18,	%f8,	%f16
	andn	%i2,	0x1BA4,	%o1
	fmovdg	%icc,	%f5,	%f13
	movrlz	%g3,	0x1B9,	%o6
	ldx	[%l7 + 0x70],	%i3
	xorcc	%g2,	%o2,	%g7
	sdivx	%i6,	0x03C0,	%i7
	edge8ln	%g6,	%l1,	%i0
	move	%icc,	%g5,	%i4
	movne	%xcc,	%l6,	%l5
	edge16n	%o5,	%g4,	%l0
	movrlez	%o0,	%o3,	%l2
	edge16l	%o4,	%o7,	%i5
	sir	0x1C5B
	fpadd16	%f28,	%f20,	%f4
	umul	%g1,	%l4,	%i1
	addcc	%l3,	0x1B28,	%o1
	sir	0x0303
	lduh	[%l7 + 0x74],	%i2
	movne	%icc,	%o6,	%g3
	array16	%i3,	%o2,	%g7
	stb	%i6,	[%l7 + 0x6C]
	udivcc	%i7,	0x19D7,	%g6
	edge16n	%g2,	%i0,	%g5
	sdivcc	%l1,	0x1254,	%i4
	sdivx	%l6,	0x0046,	%o5
	array32	%l5,	%g4,	%l0
	edge16ln	%o3,	%o0,	%o4
	fmovdge	%icc,	%f14,	%f19
	ldsw	[%l7 + 0x68],	%o7
	orn	%l2,	%g1,	%i5
	smulcc	%i1,	0x1C50,	%l3
	fand	%f20,	%f12,	%f4
	ld	[%l7 + 0x38],	%f6
	movne	%icc,	%o1,	%l4
	or	%i2,	%o6,	%i3
	sra	%o2,	0x0A,	%g3
	movcc	%xcc,	%g7,	%i6
	fmovdvs	%icc,	%f28,	%f7
	fmul8x16au	%f2,	%f6,	%f28
	fxors	%f14,	%f26,	%f6
	srl	%i7,	0x0A,	%g2
	addccc	%g6,	0x1D7E,	%i0
	restore %l1, 0x15FD, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%xcc,	%f10,	%f5
	array32	%l6,	%o5,	%i4
	edge32n	%l5,	%g4,	%l0
	stx	%o0,	[%l7 + 0x58]
	srax	%o3,	%o4,	%o7
	fandnot1	%f12,	%f4,	%f12
	movrgez	%g1,	%l2,	%i5
	udivcc	%i1,	0x1CEC,	%l3
	andn	%o1,	0x0B9C,	%l4
	fornot1s	%f25,	%f0,	%f15
	fmovda	%icc,	%f22,	%f28
	edge8l	%o6,	%i2,	%o2
	movge	%icc,	%i3,	%g3
	udiv	%i6,	0x11CC,	%g7
	addc	%g2,	%g6,	%i0
	fcmpne32	%f12,	%f8,	%l1
	lduw	[%l7 + 0x2C],	%g5
	fmul8x16au	%f2,	%f26,	%f20
	subccc	%l6,	0x0BB1,	%i7
	ld	[%l7 + 0x4C],	%f20
	srlx	%o5,	%i4,	%l5
	smulcc	%l0,	0x0AC1,	%g4
	fpack32	%f28,	%f28,	%f28
	fnors	%f15,	%f8,	%f13
	movre	%o3,	%o4,	%o7
	or	%g1,	0x1D4B,	%l2
	stx	%o0,	[%l7 + 0x50]
	edge32	%i5,	%i1,	%o1
	movleu	%icc,	%l3,	%l4
	sethi	0x016B,	%i2
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	stw	%i3,	[%l7 + 0x44]
	movrlez	%g3,	%i6,	%g7
	ld	[%l7 + 0x60],	%f13
	fmovsg	%xcc,	%f13,	%f12
	movcs	%xcc,	%g6,	%i0
	edge8	%l1,	%g2,	%l6
	popc	0x0818,	%g5
	movg	%xcc,	%i7,	%i4
	lduh	[%l7 + 0x60],	%o5
	srl	%l0,	0x00,	%l5
	lduw	[%l7 + 0x0C],	%o3
	ldx	[%l7 + 0x70],	%o4
	movn	%icc,	%g4,	%g1
	movcc	%xcc,	%l2,	%o0
	ldsb	[%l7 + 0x49],	%i5
	movpos	%xcc,	%o7,	%i1
	sub	%o1,	0x14AC,	%l3
	fmovsa	%xcc,	%f26,	%f6
	ldx	[%l7 + 0x58],	%l4
	mulx	%i2,	0x05FD,	%o2
	sir	0x12D6
	subcc	%o6,	0x038D,	%i3
	fmovdne	%icc,	%f10,	%f15
	movg	%icc,	%i6,	%g3
	ldx	[%l7 + 0x58],	%g7
	edge32	%g6,	%l1,	%g2
	orn	%i0,	%g5,	%i7
	movne	%icc,	%l6,	%o5
	lduw	[%l7 + 0x74],	%l0
	subc	%l5,	0x1878,	%i4
	ldsb	[%l7 + 0x32],	%o4
	movge	%icc,	%o3,	%g1
	ldsb	[%l7 + 0x78],	%g4
	ld	[%l7 + 0x2C],	%f14
	movn	%icc,	%o0,	%l2
	xorcc	%i5,	0x1B3A,	%i1
	sub	%o1,	%o7,	%l4
	fmovdcc	%xcc,	%f5,	%f4
	ld	[%l7 + 0x74],	%f14
	movrlez	%l3,	0x0C9,	%i2
	sll	%o6,	0x14,	%i3
	sll	%i6,	0x0A,	%g3
	add	%o2,	0x0C3C,	%g6
	srlx	%g7,	0x0F,	%l1
	edge32n	%g2,	%g5,	%i0
	fmovsneg	%icc,	%f2,	%f17
	fornot1	%f22,	%f10,	%f0
	fmovrdne	%i7,	%f6,	%f4
	for	%f28,	%f10,	%f2
	popc	%l6,	%o5
	fmovsg	%xcc,	%f14,	%f21
	edge32	%l5,	%l0,	%o4
	std	%f4,	[%l7 + 0x08]
	or	%i4,	%g1,	%g4
	fandnot2s	%f0,	%f13,	%f23
	edge32ln	%o0,	%o3,	%i5
	edge8l	%l2,	%i1,	%o7
	and	%l4,	0x0F99,	%o1
	orncc	%i2,	0x0CED,	%l3
	lduh	[%l7 + 0x58],	%i3
	edge8n	%o6,	%g3,	%o2
	smulcc	%g6,	%g7,	%l1
	array8	%i6,	%g2,	%i0
	subc	%i7,	%l6,	%o5
	fmovdcc	%xcc,	%f23,	%f27
	udiv	%g5,	0x1E0C,	%l5
	fsrc2	%f30,	%f22
	fmovrdlz	%o4,	%f10,	%f16
	fnands	%f7,	%f11,	%f7
	edge8l	%l0,	%i4,	%g1
	mova	%icc,	%g4,	%o3
	andcc	%i5,	%l2,	%i1
	move	%icc,	%o7,	%o0
	save %o1, 0x1349, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x60],	%f18
	smulcc	%l3,	%l4,	%i3
	sethi	0x1FEC,	%o6
	st	%f30,	[%l7 + 0x5C]
	edge16n	%o2,	%g3,	%g7
	fmul8sux16	%f14,	%f14,	%f24
	stx	%l1,	[%l7 + 0x38]
	orn	%i6,	0x1438,	%g6
	lduh	[%l7 + 0x10],	%i0
	srlx	%g2,	0x0B,	%l6
	ld	[%l7 + 0x2C],	%f30
	fmovdge	%icc,	%f0,	%f11
	movvs	%icc,	%o5,	%i7
	fmovrdlz	%l5,	%f28,	%f2
	or	%o4,	0x1728,	%l0
	mulx	%i4,	0x19BB,	%g5
	movneg	%xcc,	%g1,	%o3
	movge	%icc,	%g4,	%l2
	or	%i1,	%o7,	%i5
	xor	%o0,	0x1302,	%o1
	stb	%l3,	[%l7 + 0x6E]
	fmovsne	%xcc,	%f23,	%f4
	movrne	%l4,	0x364,	%i2
	mulscc	%o6,	%o2,	%g3
	fmovsl	%icc,	%f7,	%f14
	fmovrsne	%g7,	%f8,	%f1
	pdist	%f14,	%f26,	%f8
	movl	%icc,	%l1,	%i6
	ldub	[%l7 + 0x78],	%i3
	movg	%xcc,	%g6,	%i0
	smulcc	%g2,	0x0B8E,	%l6
	orncc	%o5,	0x0DFF,	%i7
	bshuffle	%f28,	%f22,	%f0
	fmovrdlez	%o4,	%f10,	%f24
	save %l5, %l0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g5,	0x0EB2,	%o3
	stw	%g4,	[%l7 + 0x1C]
	subc	%l2,	%i1,	%o7
	movrgz	%i5,	0x332,	%g1
	restore %o0, 0x1D69, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f16,	%f20,	%f0
	fcmpes	%fcc2,	%f10,	%f17
	fnot2	%f10,	%f12
	lduw	[%l7 + 0x54],	%o1
	movl	%xcc,	%l4,	%o6
	addcc	%o2,	%i2,	%g7
	sethi	0x0E85,	%g3
	udivx	%i6,	0x0D84,	%l1
	fone	%f18
	edge16l	%g6,	%i3,	%i0
	xorcc	%l6,	0x1B05,	%o5
	fcmpgt32	%f30,	%f22,	%g2
	movrgz	%i7,	%o4,	%l0
	lduh	[%l7 + 0x60],	%i4
	movneg	%xcc,	%l5,	%g5
	mulx	%g4,	0x0FEA,	%l2
	fmovdpos	%icc,	%f29,	%f14
	edge16n	%o3,	%i1,	%o7
	edge16n	%i5,	%o0,	%g1
	edge16n	%o1,	%l4,	%o6
	popc	%l3,	%o2
	save %i2, %g3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f20,	%f26,	%f6
	movvc	%icc,	%g7,	%l1
	udivcc	%i3,	0x02F3,	%i0
	edge32n	%g6,	%l6,	%o5
	movvs	%icc,	%i7,	%o4
	fmovrsne	%l0,	%f18,	%f12
	movcs	%icc,	%i4,	%g2
	orncc	%g5,	%l5,	%l2
	fmovd	%f2,	%f2
	edge16n	%g4,	%o3,	%o7
	lduw	[%l7 + 0x14],	%i5
	fmovd	%f24,	%f22
	srl	%o0,	0x05,	%i1
	movle	%xcc,	%o1,	%l4
	array32	%g1,	%l3,	%o2
	fmul8ulx16	%f12,	%f10,	%f2
	ldx	[%l7 + 0x08],	%i2
	fmovspos	%xcc,	%f9,	%f27
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	pdist	%f8,	%f4,	%f18
	sll	%l1,	%g7,	%i3
	fmovdle	%xcc,	%f7,	%f22
	andncc	%i0,	%l6,	%o5
	add	%i7,	0x0081,	%g6
	edge32l	%o4,	%i4,	%l0
	fmovrdgez	%g2,	%f26,	%f2
	lduh	[%l7 + 0x22],	%l5
	srax	%g5,	0x0E,	%g4
	edge8l	%o3,	%o7,	%i5
	edge16	%o0,	%l2,	%o1
	fcmpgt32	%f10,	%f28,	%l4
	orcc	%g1,	%i1,	%o2
	udivx	%i2,	0x0F3D,	%g3
	movrlz	%o6,	0x008,	%l3
	smulcc	%l1,	0x001C,	%i6
	fornot1	%f16,	%f26,	%f6
	fmovdn	%icc,	%f0,	%f24
	fxor	%f16,	%f12,	%f20
	fmovsvc	%xcc,	%f0,	%f30
	edge16n	%g7,	%i3,	%i0
	edge32l	%l6,	%i7,	%g6
	save %o4, %i4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l0,	%g2,	%g5
	movge	%icc,	%l5,	%g4
	subccc	%o3,	0x0A10,	%o7
	sub	%i5,	0x0543,	%l2
	fcmpeq32	%f4,	%f18,	%o1
	for	%f14,	%f8,	%f12
	umul	%o0,	0x17F8,	%g1
	edge32n	%i1,	%o2,	%l4
	array32	%g3,	%i2,	%l3
	bshuffle	%f10,	%f24,	%f12
	alignaddr	%l1,	%i6,	%g7
	fxnor	%f24,	%f0,	%f4
	srax	%i3,	%i0,	%o6
	smulcc	%i7,	0x0C77,	%g6
	movg	%xcc,	%o4,	%i4
	edge16l	%l6,	%l0,	%g2
	fmovsge	%icc,	%f26,	%f4
	movn	%icc,	%o5,	%g5
	mulx	%l5,	0x0DCC,	%o3
	ldsb	[%l7 + 0x16],	%o7
	edge16n	%i5,	%l2,	%g4
	subcc	%o1,	0x15AC,	%o0
	ld	[%l7 + 0x54],	%f4
	edge8ln	%g1,	%o2,	%l4
	edge16ln	%g3,	%i2,	%l3
	edge32ln	%i1,	%l1,	%i6
	orncc	%i3,	%i0,	%g7
	addc	%o6,	0x11D9,	%i7
	umulcc	%o4,	%g6,	%l6
	edge8	%l0,	%i4,	%g2
	andncc	%g5,	%l5,	%o3
	array32	%o5,	%o7,	%i5
	sdivcc	%l2,	0x0013,	%o1
	array16	%o0,	%g4,	%g1
	movre	%l4,	%o2,	%i2
	pdist	%f14,	%f14,	%f30
	popc	%g3,	%l3
	fmovdn	%icc,	%f25,	%f22
	mulx	%i1,	0x0156,	%i6
	lduh	[%l7 + 0x36],	%l1
	mova	%icc,	%i3,	%g7
	and	%o6,	0x06A2,	%i0
	sethi	0x0A65,	%o4
	edge16n	%g6,	%l6,	%i7
	fmovdle	%xcc,	%f6,	%f9
	fsrc2s	%f30,	%f19
	movleu	%xcc,	%l0,	%i4
	edge32ln	%g5,	%g2,	%o3
	sll	%o5,	%o7,	%l5
	fnegd	%f14,	%f22
	fxnors	%f5,	%f31,	%f8
	ldx	[%l7 + 0x40],	%i5
	subccc	%o1,	0x0AD6,	%o0
	sth	%g4,	[%l7 + 0x44]
	orn	%g1,	0x0DC8,	%l2
	movcs	%xcc,	%o2,	%i2
	fmovrslez	%l4,	%f17,	%f30
	movrlz	%l3,	%g3,	%i6
	orn	%l1,	%i3,	%i1
	nop
	set	0x38, %g4
	ldx	[%l7 + %g4],	%g7
	movge	%xcc,	%o6,	%i0
	nop
	set	0x62, %g7
	sth	%o4,	[%l7 + %g7]
	fmovsg	%icc,	%f9,	%f26
	udivcc	%l6,	0x0072,	%i7
	sethi	0x16A2,	%g6
	ldsw	[%l7 + 0x2C],	%i4
	subc	%g5,	0x06B9,	%g2
	sir	0x1BF3
	mulx	%l0,	0x1BE7,	%o5
	mova	%xcc,	%o7,	%o3
	fnegs	%f6,	%f15
	fmovs	%f17,	%f24
	umulcc	%i5,	0x05E0,	%o1
	orncc	%o0,	%l5,	%g1
	mulx	%l2,	%g4,	%o2
	fornot2s	%f11,	%f30,	%f12
	ld	[%l7 + 0x0C],	%f27
	edge16	%i2,	%l4,	%g3
	umul	%i6,	0x1E17,	%l1
	sllx	%i3,	0x03,	%l3
	srax	%i1,	%o6,	%g7
	edge8l	%i0,	%o4,	%l6
	xorcc	%i7,	0x1F7C,	%i4
	sethi	0x093F,	%g6
	sll	%g5,	%l0,	%o5
	edge32n	%o7,	%g2,	%o3
	st	%f14,	[%l7 + 0x40]
	sir	0x1686
	fmovsg	%xcc,	%f12,	%f2
	orncc	%o1,	%o0,	%i5
	stb	%l5,	[%l7 + 0x45]
	fmovrdlez	%g1,	%f10,	%f24
	popc	0x0BCB,	%l2
	fmovrdgz	%o2,	%f14,	%f18
	smul	%i2,	0x001B,	%g4
	movne	%icc,	%g3,	%l4
	ldd	[%l7 + 0x70],	%f8
	xnor	%i6,	%l1,	%i3
	move	%icc,	%l3,	%o6
	array8	%g7,	%i1,	%i0
	fnot2	%f30,	%f12
	ldx	[%l7 + 0x70],	%o4
	ldx	[%l7 + 0x10],	%i7
	edge8ln	%l6,	%i4,	%g5
	edge16ln	%l0,	%g6,	%o5
	movrlez	%o7,	0x103,	%g2
	orn	%o3,	0x0805,	%o0
	fcmpeq16	%f10,	%f12,	%o1
	mulscc	%l5,	0x19A7,	%i5
	udivx	%l2,	0x1F51,	%o2
	fmovscc	%xcc,	%f6,	%f28
	ldx	[%l7 + 0x10],	%g1
	srlx	%i2,	%g4,	%l4
	restore %g3, %l1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l3,	%o6
	movge	%icc,	%g7,	%i6
	sll	%i1,	%i0,	%i7
	andn	%l6,	0x1CF0,	%i4
	fnot2s	%f21,	%f9
	fpsub16	%f10,	%f24,	%f16
	addcc	%o4,	%g5,	%g6
	mova	%icc,	%l0,	%o7
	or	%g2,	%o3,	%o0
	fandnot2	%f18,	%f30,	%f16
	sub	%o1,	%l5,	%i5
	mulx	%o5,	0x0CB0,	%o2
	fpadd16s	%f30,	%f22,	%f21
	mova	%xcc,	%g1,	%l2
	mulx	%i2,	0x0C59,	%g4
	xnorcc	%g3,	%l4,	%i3
	movl	%icc,	%l1,	%l3
	umul	%g7,	0x1023,	%o6
	movcc	%icc,	%i1,	%i6
	andn	%i0,	0x0301,	%l6
	movrlez	%i4,	%o4,	%i7
	mova	%xcc,	%g5,	%g6
	stb	%l0,	[%l7 + 0x1A]
	smul	%g2,	%o3,	%o7
	fxnor	%f8,	%f14,	%f6
	movn	%xcc,	%o0,	%l5
	srl	%o1,	0x0E,	%o5
	addc	%i5,	%o2,	%g1
	movpos	%xcc,	%l2,	%g4
	ldsb	[%l7 + 0x61],	%g3
	subcc	%i2,	%i3,	%l1
	subccc	%l4,	0x17EE,	%g7
	movcs	%xcc,	%o6,	%l3
	fmovrsne	%i6,	%f13,	%f18
	srlx	%i1,	%l6,	%i0
	fnand	%f12,	%f8,	%f22
	move	%icc,	%o4,	%i7
	andcc	%g5,	0x09BE,	%g6
	smulcc	%i4,	0x1273,	%l0
	movcc	%xcc,	%o3,	%o7
	sdivcc	%o0,	0x098C,	%g2
	std	%f4,	[%l7 + 0x60]
	faligndata	%f18,	%f4,	%f8
	movneg	%xcc,	%l5,	%o5
	movle	%xcc,	%o1,	%i5
	srax	%o2,	%g1,	%l2
	sllx	%g3,	%i2,	%g4
	movle	%xcc,	%l1,	%i3
	fandnot1	%f28,	%f18,	%f18
	movle	%icc,	%l4,	%g7
	fmovrsne	%o6,	%f2,	%f26
	for	%f14,	%f20,	%f4
	udivcc	%i6,	0x0C7A,	%i1
	save %l6, %i0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%l2
	orncc	%i7,	0x0334,	%g5
	orcc	%i4,	0x0134,	%g6
	fmovrsne	%l0,	%f22,	%f24
	fsrc1s	%f31,	%f11
	movg	%icc,	%o7,	%o3
	std	%f2,	[%l7 + 0x08]
	edge16l	%g2,	%l5,	%o0
	lduw	[%l7 + 0x34],	%o5
	movre	%i5,	0x1DE,	%o1
	mulscc	%o2,	0x026E,	%l2
	movrlez	%g3,	0x3BA,	%i2
	ldd	[%l7 + 0x78],	%g0
	fmovrsne	%l1,	%f20,	%f6
	movre	%g4,	%i3,	%g7
	fmovsvs	%icc,	%f8,	%f29
	sdivx	%l4,	0x1DB3,	%i6
	fands	%f16,	%f10,	%f3
	fmovsg	%icc,	%f18,	%f28
	smul	%o6,	0x1C0D,	%i1
	alignaddrl	%l6,	%i0,	%o4
	umulcc	%i7,	%l3,	%i4
	stw	%g6,	[%l7 + 0x08]
	srax	%l0,	%g5,	%o3
	fxor	%f14,	%f18,	%f4
	fpadd32	%f30,	%f22,	%f22
	fnors	%f24,	%f10,	%f9
	sth	%g2,	[%l7 + 0x64]
	fzero	%f6
	edge16	%o7,	%l5,	%o5
	mova	%icc,	%o0,	%o1
	sdivcc	%o2,	0x033E,	%l2
	fmovsne	%xcc,	%f17,	%f23
	smul	%g3,	%i2,	%i5
	movrlez	%l1,	%g4,	%g1
	ldub	[%l7 + 0x24],	%g7
	fmovdvc	%xcc,	%f19,	%f29
	fcmpeq32	%f4,	%f12,	%i3
	sra	%i6,	%l4,	%i1
	ldsw	[%l7 + 0x74],	%o6
	fmovsvc	%icc,	%f20,	%f16
	edge8l	%i0,	%o4,	%l6
	pdist	%f30,	%f22,	%f0
	fmovsa	%xcc,	%f23,	%f6
	movrgz	%i7,	%l3,	%i4
	faligndata	%f10,	%f16,	%f16
	ldd	[%l7 + 0x28],	%f8
	subcc	%l0,	0x026F,	%g6
	fmovrsgz	%o3,	%f10,	%f10
	xnor	%g5,	%o7,	%l5
	array32	%g2,	%o0,	%o5
	edge32l	%o1,	%o2,	%g3
	for	%f2,	%f24,	%f30
	udivcc	%i2,	0x11EB,	%l2
	movn	%xcc,	%i5,	%g4
	mulscc	%l1,	%g1,	%i3
	addcc	%g7,	0x087C,	%l4
	fornot2s	%f9,	%f20,	%f15
	fmul8x16au	%f10,	%f26,	%f20
	fmovda	%icc,	%f4,	%f17
	edge32l	%i6,	%o6,	%i0
	fnegs	%f8,	%f19
	movrgz	%o4,	%l6,	%i7
	umul	%l3,	%i4,	%l0
	movge	%xcc,	%g6,	%i1
	edge32	%o3,	%g5,	%o7
	umul	%l5,	0x1BA7,	%g2
	fnand	%f8,	%f28,	%f26
	fandnot2	%f20,	%f30,	%f12
	std	%f14,	[%l7 + 0x60]
	fcmpeq32	%f4,	%f24,	%o0
	sub	%o5,	0x1A9A,	%o1
	movrne	%g3,	0x372,	%i2
	srax	%o2,	0x14,	%i5
	ldsh	[%l7 + 0x26],	%l2
	alignaddr	%l1,	%g1,	%i3
	movrlez	%g7,	%l4,	%i6
	srlx	%g4,	0x16,	%o6
	fcmpgt32	%f6,	%f22,	%i0
	movleu	%icc,	%o4,	%l6
	movvs	%xcc,	%l3,	%i4
	sll	%l0,	0x0C,	%g6
	fabss	%f15,	%f5
	movrne	%i7,	%o3,	%g5
	edge8l	%i1,	%o7,	%g2
	fmul8x16al	%f19,	%f18,	%f28
	lduw	[%l7 + 0x30],	%l5
	fmul8x16al	%f25,	%f9,	%f20
	fandnot2s	%f25,	%f3,	%f22
	fcmpgt32	%f22,	%f24,	%o0
	movrlez	%o5,	0x3FD,	%o1
	edge16ln	%i2,	%g3,	%i5
	andcc	%o2,	0x12B6,	%l1
	movvc	%icc,	%l2,	%i3
	fxnors	%f10,	%f20,	%f28
	fcmpgt16	%f22,	%f14,	%g7
	movvc	%icc,	%l4,	%g1
	xnorcc	%g4,	0x05CE,	%i6
	sll	%i0,	0x05,	%o4
	stw	%l6,	[%l7 + 0x18]
	smulcc	%o6,	0x171E,	%i4
	movne	%icc,	%l3,	%l0
	st	%f22,	[%l7 + 0x0C]
	sdivx	%i7,	0x0F10,	%o3
	array16	%g5,	%i1,	%g6
	sllx	%o7,	%l5,	%o0
	movn	%xcc,	%o5,	%o1
	xor	%g2,	0x1FCE,	%g3
	movgu	%icc,	%i2,	%i5
	fmuld8ulx16	%f29,	%f20,	%f20
	fnot1s	%f18,	%f4
	umulcc	%l1,	0x12CC,	%o2
	and	%i3,	0x0DAD,	%l2
	edge32	%g7,	%g1,	%g4
	sll	%l4,	0x11,	%i6
	mulscc	%i0,	%l6,	%o6
	movrgz	%o4,	0x16B,	%l3
	edge16l	%l0,	%i7,	%i4
	orcc	%o3,	0x1EE6,	%g5
	fandnot1	%f16,	%f26,	%f10
	edge8ln	%i1,	%g6,	%o7
	smul	%l5,	%o0,	%o1
	orn	%o5,	0x1736,	%g2
	xnorcc	%g3,	%i2,	%i5
	and	%o2,	%i3,	%l1
	subc	%g7,	%l2,	%g4
	xnor	%g1,	%l4,	%i6
	ldx	[%l7 + 0x70],	%l6
	edge32	%o6,	%o4,	%i0
	movcc	%xcc,	%l0,	%l3
	edge16ln	%i7,	%o3,	%g5
	fmul8x16	%f30,	%f14,	%f20
	movrne	%i1,	%i4,	%g6
	movrgez	%l5,	%o7,	%o0
	array32	%o5,	%g2,	%o1
	edge8ln	%g3,	%i2,	%i5
	mulscc	%o2,	%i3,	%g7
	ld	[%l7 + 0x74],	%f12
	movre	%l1,	0x3D6,	%l2
	fnor	%f18,	%f30,	%f30
	sethi	0x10CA,	%g4
	movrgz	%g1,	0x18C,	%l4
	popc	0x06CF,	%l6
	edge16ln	%o6,	%o4,	%i0
	fmovdne	%xcc,	%f20,	%f4
	sdivx	%l0,	0x11D1,	%l3
	ldx	[%l7 + 0x28],	%i6
	udivx	%o3,	0x1C4B,	%i7
	andn	%g5,	%i1,	%i4
	fcmpne32	%f22,	%f24,	%g6
	stw	%l5,	[%l7 + 0x10]
	xor	%o7,	%o5,	%o0
	lduw	[%l7 + 0x4C],	%o1
	fmovdne	%icc,	%f29,	%f12
	fcmpeq16	%f2,	%f28,	%g3
	sllx	%g2,	%i2,	%o2
	fexpand	%f26,	%f26
	orncc	%i3,	%g7,	%i5
	mulx	%l1,	%g4,	%l2
	movpos	%xcc,	%l4,	%l6
	umulcc	%o6,	%g1,	%i0
	edge32l	%o4,	%l0,	%l3
	edge16	%o3,	%i6,	%g5
	nop
	set	0x0C, %i1
	ldsb	[%l7 + %i1],	%i7
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	stx	%i4,	[%l7 + 0x60]
	fmovdpos	%xcc,	%f28,	%f7
	lduh	[%l7 + 0x34],	%o7
	sdivcc	%o0,	0x0B83,	%o5
	xnorcc	%o1,	0x007A,	%g2
	fmovrsgz	%g3,	%f22,	%f6
	add	%i2,	%i3,	%o2
	mulscc	%i5,	%g7,	%l1
	sdiv	%g4,	0x1AD3,	%l4
	lduh	[%l7 + 0x5C],	%l2
	ldsh	[%l7 + 0x66],	%o6
	fmovsn	%icc,	%f9,	%f5
	array32	%g1,	%i0,	%l6
	srlx	%o4,	0x1C,	%l3
	andcc	%l0,	%o3,	%i6
	fmovs	%f14,	%f14
	movcc	%xcc,	%i7,	%i1
	movleu	%xcc,	%g5,	%g6
	mova	%xcc,	%i4,	%l5
	andncc	%o7,	%o0,	%o1
	array32	%g2,	%g3,	%o5
	stb	%i3,	[%l7 + 0x62]
	sir	0x0696
	mulscc	%i2,	0x1021,	%i5
	fpadd16	%f24,	%f0,	%f30
	fnot2	%f16,	%f2
	mulx	%o2,	0x186E,	%l1
	st	%f20,	[%l7 + 0x6C]
	or	%g7,	%l4,	%g4
	fpsub32	%f10,	%f14,	%f16
	srl	%l2,	0x08,	%g1
	addcc	%o6,	0x0BA2,	%i0
	fmovdge	%icc,	%f3,	%f27
	bshuffle	%f8,	%f26,	%f16
	mova	%icc,	%l6,	%l3
	lduh	[%l7 + 0x5C],	%o4
	smul	%o3,	0x1DB1,	%i6
	movleu	%icc,	%i7,	%l0
	fmovdvc	%icc,	%f26,	%f11
	fxors	%f17,	%f29,	%f29
	ldd	[%l7 + 0x18],	%f12
	orncc	%i1,	0x08DA,	%g5
	ld	[%l7 + 0x10],	%f19
	ldx	[%l7 + 0x28],	%i4
	fmovrsgz	%l5,	%f3,	%f26
	edge8ln	%g6,	%o0,	%o1
	fmovrsgez	%o7,	%f13,	%f9
	add	%g3,	0x0FCD,	%g2
	fmovdleu	%icc,	%f15,	%f12
	fmovdcc	%xcc,	%f10,	%f17
	addccc	%o5,	0x1341,	%i3
	fmovsgu	%icc,	%f22,	%f23
	andn	%i5,	0x08E5,	%o2
	edge32l	%l1,	%i2,	%g7
	movrne	%g4,	%l2,	%l4
	move	%icc,	%o6,	%g1
	movleu	%xcc,	%i0,	%l3
	fcmpgt16	%f18,	%f20,	%l6
	sllx	%o3,	0x1F,	%i6
	restore %i7, 0x0176, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i1,	%f8,	%f19
	umulcc	%g5,	%i4,	%l0
	fmovsleu	%icc,	%f7,	%f5
	srax	%l5,	0x1B,	%g6
	smul	%o1,	0x0AC6,	%o7
	movg	%icc,	%o0,	%g2
	smul	%o5,	%g3,	%i5
	movrgez	%o2,	0x2F2,	%i3
	edge8ln	%i2,	%g7,	%g4
	addccc	%l2,	0x0971,	%l1
	fmovdle	%xcc,	%f0,	%f20
	edge8l	%l4,	%g1,	%o6
	sth	%l3,	[%l7 + 0x70]
	andcc	%i0,	0x1FA9,	%l6
	and	%i6,	0x143E,	%i7
	addc	%o3,	%i1,	%o4
	lduw	[%l7 + 0x64],	%g5
	fmovrdlez	%i4,	%f22,	%f6
	array32	%l0,	%g6,	%l5
	fxnor	%f4,	%f6,	%f26
	edge32	%o7,	%o1,	%g2
	addccc	%o0,	0x0B48,	%o5
	popc	%g3,	%o2
	sll	%i5,	0x13,	%i3
	ldx	[%l7 + 0x50],	%g7
	stx	%g4,	[%l7 + 0x40]
	xorcc	%l2,	%i2,	%l1
	smul	%g1,	0x0DD4,	%o6
	mova	%xcc,	%l3,	%i0
	udivx	%l4,	0x0DF5,	%i6
	sllx	%l6,	0x18,	%i7
	srl	%i1,	%o3,	%o4
	fcmpd	%fcc3,	%f18,	%f20
	edge16l	%i4,	%g5,	%l0
	st	%f2,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x52],	%l5
	orn	%g6,	%o1,	%g2
	alignaddrl	%o7,	%o5,	%o0
	edge32l	%o2,	%i5,	%i3
	addccc	%g7,	%g3,	%g4
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	fmovsge	%xcc,	%f3,	%f24
	fnot1	%f20,	%f4
	sub	%g1,	0x1FF6,	%l1
	fornot2s	%f18,	%f10,	%f23
	array8	%l3,	%o6,	%i0
	array32	%l4,	%l6,	%i7
	alignaddrl	%i1,	%o3,	%o4
	andncc	%i6,	%g5,	%l0
	stx	%i4,	[%l7 + 0x20]
	edge32ln	%g6,	%o1,	%l5
	mova	%xcc,	%g2,	%o5
	srax	%o7,	%o0,	%i5
	movrlez	%o2,	0x28C,	%i3
	umulcc	%g7,	%g4,	%l2
	fsrc1s	%f17,	%f7
	add	%i2,	0x1F9F,	%g1
	stx	%g3,	[%l7 + 0x50]
	fxnor	%f28,	%f30,	%f2
	movvs	%icc,	%l1,	%o6
	array8	%l3,	%i0,	%l4
	fxors	%f13,	%f5,	%f20
	sdivcc	%l6,	0x09C0,	%i7
	srl	%i1,	0x0E,	%o3
	xor	%o4,	%g5,	%i6
	ldsb	[%l7 + 0x22],	%i4
	and	%l0,	%o1,	%l5
	edge16n	%g6,	%o5,	%g2
	srax	%o0,	%o7,	%o2
	array8	%i5,	%i3,	%g4
	fmovd	%f4,	%f18
	fnand	%f12,	%f22,	%f22
	fpmerge	%f3,	%f13,	%f24
	movre	%l2,	0x12D,	%g7
	sdivx	%i2,	0x1A79,	%g3
	xor	%g1,	%l1,	%l3
	array16	%i0,	%l4,	%l6
	udivx	%o6,	0x1581,	%i1
	array16	%i7,	%o3,	%o4
	srlx	%i6,	%g5,	%i4
	restore %o1, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l0,	0x081E,	%o5
	orn	%g2,	0x0AEC,	%o7
	ldd	[%l7 + 0x78],	%o2
	orn	%i5,	0x1FD5,	%i3
	ldsb	[%l7 + 0x6B],	%g4
	sth	%l2,	[%l7 + 0x32]
	pdist	%f22,	%f10,	%f0
	movvs	%icc,	%o0,	%i2
	ldd	[%l7 + 0x18],	%f16
	mulx	%g3,	%g1,	%g7
	array16	%l3,	%i0,	%l4
	ldsb	[%l7 + 0x2C],	%l6
	fmovsg	%icc,	%f8,	%f8
	fornot2s	%f31,	%f20,	%f15
	andncc	%o6,	%l1,	%i7
	mulscc	%o3,	0x0F33,	%i1
	umul	%i6,	0x03FE,	%g5
	subccc	%o4,	%i4,	%l5
	ldd	[%l7 + 0x68],	%o0
	movrgez	%l0,	%o5,	%g6
	movneg	%xcc,	%o7,	%o2
	movpos	%xcc,	%i5,	%g2
	sllx	%g4,	0x09,	%l2
	save %i3, %o0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f6,	%f7,	%f8
	fnor	%f30,	%f6,	%f22
	sdivcc	%g1,	0x0749,	%g7
	fpadd32s	%f14,	%f10,	%f14
	edge16	%g3,	%l3,	%l4
	sethi	0x04B6,	%l6
	fxors	%f4,	%f13,	%f27
	movcs	%icc,	%o6,	%l1
	ldsw	[%l7 + 0x08],	%i7
	mulscc	%i0,	0x0EB0,	%o3
	edge8n	%i1,	%g5,	%i6
	save %o4, %i4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l0,	%o5
	edge32n	%g6,	%o7,	%l5
	udivcc	%o2,	0x0EDF,	%g2
	edge32ln	%g4,	%l2,	%i3
	fmovrdlz	%o0,	%f2,	%f12
	andn	%i5,	0x0B32,	%i2
	subcc	%g7,	0x04C3,	%g1
	array32	%l3,	%l4,	%l6
	fcmps	%fcc3,	%f10,	%f12
	fmovdn	%xcc,	%f5,	%f19
	movrlez	%g3,	0x326,	%l1
	movrlz	%i7,	0x265,	%o6
	movle	%xcc,	%o3,	%i1
	movn	%xcc,	%g5,	%i0
	stb	%o4,	[%l7 + 0x72]
	edge8l	%i6,	%o1,	%i4
	movgu	%icc,	%l0,	%o5
	mulscc	%g6,	0x065C,	%l5
	fandnot1	%f2,	%f28,	%f14
	srlx	%o7,	%o2,	%g2
	fnand	%f0,	%f10,	%f10
	stb	%g4,	[%l7 + 0x62]
	fpadd32s	%f21,	%f25,	%f25
	stx	%i3,	[%l7 + 0x38]
	alignaddr	%o0,	%l2,	%i5
	stx	%g7,	[%l7 + 0x70]
	subc	%i2,	%l3,	%l4
	andcc	%l6,	%g3,	%l1
	movvc	%xcc,	%i7,	%g1
	smul	%o6,	%o3,	%i1
	subc	%i0,	0x1708,	%o4
	fmovrdgez	%g5,	%f20,	%f30
	fcmpne32	%f14,	%f2,	%o1
	edge8ln	%i4,	%i6,	%o5
	ld	[%l7 + 0x28],	%f28
	movrgz	%l0,	0x1A3,	%g6
	save %l5, %o7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g2,	0x35A,	%i3
	subc	%o0,	0x13BF,	%l2
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	udiv	%g7,	0x17DF,	%l3
	fandnot2s	%f12,	%f12,	%f20
	edge8l	%l6,	%l4,	%l1
	lduh	[%l7 + 0x2C],	%g3
	array8	%i7,	%o6,	%g1
	movrlz	%o3,	0x2A6,	%i0
	subcc	%i1,	%g5,	%o4
	orcc	%o1,	0x0BBF,	%i4
	ldub	[%l7 + 0x6B],	%o5
	movg	%icc,	%l0,	%g6
	movrne	%l5,	%o7,	%i6
	udivx	%o2,	0x1BB2,	%g2
	stb	%i3,	[%l7 + 0x36]
	fmovdvc	%xcc,	%f26,	%f25
	fcmpes	%fcc3,	%f12,	%f8
	fmovsgu	%icc,	%f31,	%f5
	fmul8sux16	%f20,	%f0,	%f12
	lduh	[%l7 + 0x5C],	%o0
	sth	%i5,	[%l7 + 0x1E]
	fpadd32	%f20,	%f16,	%f16
	fabss	%f11,	%f13
	fpack32	%f4,	%f28,	%f0
	edge8n	%g4,	%l2,	%i2
	udivx	%g7,	0x0A89,	%l3
	fcmpeq16	%f16,	%f12,	%l6
	ldub	[%l7 + 0x3C],	%l1
	movgu	%xcc,	%l4,	%i7
	smul	%o6,	%g1,	%g3
	udivcc	%o3,	0x0416,	%i1
	fcmped	%fcc0,	%f22,	%f12
	popc	0x1A2D,	%i0
	fcmpeq32	%f26,	%f12,	%g5
	fornot2	%f20,	%f12,	%f4
	sllx	%o4,	%i4,	%o5
	fmovrdne	%o1,	%f20,	%f12
	addcc	%l0,	0x08B3,	%g6
	fmul8x16al	%f11,	%f31,	%f0
	fmovsne	%icc,	%f28,	%f18
	andn	%o7,	0x0625,	%l5
	addc	%i6,	0x15AA,	%g2
	edge32	%i3,	%o0,	%o2
	mulx	%i5,	%l2,	%g4
	fmovdn	%icc,	%f16,	%f4
	save %i2, 0x1D8F, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f3,	%f13
	xorcc	%l6,	%l1,	%g7
	sll	%i7,	0x1C,	%o6
	movleu	%icc,	%g1,	%g3
	sdivcc	%l4,	0x1DE8,	%i1
	edge16ln	%i0,	%o3,	%g5
	movrgz	%i4,	%o4,	%o5
	lduh	[%l7 + 0x2C],	%o1
	umul	%g6,	0x1E3C,	%l0
	udivx	%o7,	0x0948,	%i6
	fmul8x16	%f21,	%f2,	%f0
	bshuffle	%f20,	%f4,	%f4
	edge16l	%l5,	%g2,	%o0
	stx	%i3,	[%l7 + 0x78]
	array32	%i5,	%o2,	%g4
	xnorcc	%i2,	%l3,	%l2
	udiv	%l6,	0x1A9D,	%g7
	subc	%i7,	0x1D85,	%o6
	fmovrdlz	%l1,	%f30,	%f10
	restore %g1, 0x0935, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g3,	%i1,	%o3
	srax	%i0,	%i4,	%g5
	edge16n	%o5,	%o1,	%g6
	edge16ln	%l0,	%o4,	%o7
	alignaddr	%l5,	%g2,	%i6
	fmovrde	%o0,	%f14,	%f20
	fmovsne	%xcc,	%f24,	%f24
	array8	%i5,	%i3,	%g4
	mulscc	%o2,	%i2,	%l3
	udiv	%l6,	0x17B8,	%g7
	sdivx	%i7,	0x0399,	%l2
	fmovsleu	%icc,	%f24,	%f11
	orncc	%o6,	0x098E,	%g1
	movrlez	%l4,	0x1F7,	%l1
	fnors	%f19,	%f17,	%f23
	edge32	%g3,	%i1,	%i0
	andncc	%o3,	%g5,	%i4
	ld	[%l7 + 0x28],	%f5
	fnegd	%f2,	%f12
	subcc	%o5,	%g6,	%o1
	addcc	%l0,	%o7,	%o4
	array32	%l5,	%i6,	%g2
	movrlz	%i5,	0x36D,	%i3
	mulx	%g4,	%o2,	%i2
	fmovrse	%o0,	%f27,	%f6
	fmovs	%f19,	%f0
	andcc	%l3,	%g7,	%i7
	movg	%icc,	%l2,	%l6
	movg	%xcc,	%o6,	%g1
	fmul8x16au	%f29,	%f20,	%f26
	ld	[%l7 + 0x74],	%f31
	fandnot2	%f16,	%f18,	%f30
	save %l1, %l4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i0,	%i1,	%o3
	fmul8ulx16	%f6,	%f10,	%f2
	fcmpgt16	%f8,	%f4,	%i4
	ldub	[%l7 + 0x0F],	%o5
	fpsub32	%f0,	%f4,	%f20
	nop
	set	0x08, %g6
	ldx	[%l7 + %g6],	%g5
	ldd	[%l7 + 0x70],	%o0
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	edge16l	%o7,	%l5,	%i6
	movre	%g2,	0x05B,	%o4
	fmul8x16au	%f22,	%f8,	%f16
	andcc	%i3,	0x1B21,	%i5
	ldsh	[%l7 + 0x36],	%o2
	ldd	[%l7 + 0x40],	%g4
	st	%f2,	[%l7 + 0x7C]
	sdivx	%i2,	0x045C,	%l3
	array8	%g7,	%i7,	%o0
	subc	%l2,	0x1436,	%l6
	addcc	%o6,	0x0F51,	%l1
	mova	%xcc,	%g1,	%l4
	umul	%i0,	%i1,	%o3
	sllx	%g3,	%o5,	%i4
	xnor	%o1,	0x03DB,	%g5
	smul	%l0,	%o7,	%l5
	movleu	%icc,	%i6,	%g2
	movvc	%icc,	%o4,	%g6
	fones	%f19
	edge8l	%i3,	%o2,	%g4
	xnorcc	%i2,	0x030B,	%l3
	edge16ln	%g7,	%i5,	%o0
	smul	%l2,	0x0A96,	%i7
	sir	0x15FA
	fcmpne16	%f22,	%f26,	%o6
	edge8ln	%l1,	%l6,	%l4
	array32	%g1,	%i1,	%o3
	movrlz	%g3,	0x0B4,	%o5
	fabss	%f27,	%f4
	umulcc	%i4,	0x0575,	%i0
	addcc	%o1,	0x01D2,	%g5
	fmovsneg	%xcc,	%f15,	%f15
	ldsb	[%l7 + 0x11],	%o7
	restore %l0, 0x1509, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g2,	0x1F69,	%o4
	subccc	%l5,	0x1224,	%i3
	movn	%xcc,	%g6,	%g4
	sethi	0x0901,	%o2
	fmovsgu	%xcc,	%f21,	%f27
	fmovdne	%xcc,	%f0,	%f3
	sdiv	%l3,	0x110C,	%i2
	fmovsvc	%icc,	%f17,	%f5
	sll	%g7,	%o0,	%l2
	movn	%icc,	%i7,	%o6
	udivcc	%i5,	0x04DE,	%l6
	fpadd32s	%f0,	%f9,	%f9
	fnand	%f22,	%f12,	%f6
	fcmpne16	%f30,	%f8,	%l4
	fmovsg	%xcc,	%f12,	%f18
	fmovdgu	%icc,	%f0,	%f7
	array8	%l1,	%g1,	%i1
	movrne	%g3,	0x3E8,	%o5
	movg	%icc,	%i4,	%i0
	fors	%f6,	%f25,	%f15
	edge8	%o3,	%g5,	%o1
	addccc	%l0,	0x1C6B,	%o7
	ldsb	[%l7 + 0x61],	%i6
	move	%icc,	%o4,	%g2
	fmovsn	%icc,	%f19,	%f3
	array32	%l5,	%g6,	%i3
	fmovsleu	%icc,	%f1,	%f7
	sth	%o2,	[%l7 + 0x50]
	orcc	%g4,	%l3,	%g7
	edge32l	%i2,	%o0,	%i7
	movne	%xcc,	%o6,	%i5
	movpos	%xcc,	%l2,	%l6
	umul	%l4,	0x0F4C,	%l1
	fzeros	%f19
	movrlez	%g1,	0x1C7,	%i1
	xnor	%g3,	%i4,	%o5
	edge8ln	%i0,	%o3,	%g5
	stb	%o1,	[%l7 + 0x25]
	sth	%l0,	[%l7 + 0x5C]
	addccc	%i6,	0x0A30,	%o4
	fcmpeq32	%f2,	%f0,	%g2
	ldd	[%l7 + 0x28],	%o6
	fnand	%f22,	%f18,	%f12
	sdiv	%g6,	0x1E06,	%i3
	edge8n	%o2,	%g4,	%l5
	movrlez	%g7,	0x330,	%l3
	ldd	[%l7 + 0x48],	%o0
	fnegs	%f31,	%f11
	siam	0x3
	orcc	%i2,	0x036F,	%i7
	srax	%o6,	0x0C,	%i5
	movleu	%icc,	%l2,	%l4
	subc	%l1,	%l6,	%g1
	array16	%g3,	%i4,	%i1
	edge32l	%i0,	%o5,	%o3
	stx	%g5,	[%l7 + 0x38]
	ldx	[%l7 + 0x18],	%o1
	movle	%xcc,	%i6,	%o4
	fmovdg	%icc,	%f9,	%f11
	movpos	%icc,	%g2,	%l0
	fcmpne16	%f26,	%f28,	%g6
	fmovsvc	%icc,	%f28,	%f7
	array32	%i3,	%o2,	%g4
	movl	%xcc,	%l5,	%o7
	fnegs	%f20,	%f24
	fmovscs	%xcc,	%f21,	%f19
	andn	%l3,	0x0545,	%g7
	edge16l	%o0,	%i2,	%o6
	sra	%i5,	0x06,	%l2
	movvs	%icc,	%i7,	%l1
	ldsb	[%l7 + 0x63],	%l4
	udiv	%l6,	0x0F03,	%g3
	ldd	[%l7 + 0x58],	%f6
	xorcc	%g1,	%i4,	%i0
	mulx	%o5,	%o3,	%g5
	movvc	%icc,	%i1,	%o1
	movneg	%xcc,	%i6,	%o4
	ldd	[%l7 + 0x40],	%l0
	fxnors	%f22,	%f26,	%f31
	umul	%g2,	0x12CC,	%i3
	movvs	%xcc,	%o2,	%g4
	mulx	%g6,	0x1433,	%o7
	fmul8x16	%f31,	%f20,	%f8
	sth	%l5,	[%l7 + 0x46]
	sir	0x07B5
	fcmpne16	%f12,	%f12,	%g7
	movleu	%xcc,	%o0,	%i2
	movg	%icc,	%o6,	%i5
	fmovsg	%xcc,	%f18,	%f31
	fpack16	%f30,	%f28
	movcc	%icc,	%l2,	%l3
	fsrc2s	%f1,	%f14
	movg	%xcc,	%l1,	%i7
	or	%l4,	0x0531,	%g3
	movvc	%icc,	%l6,	%i4
	fmovsle	%icc,	%f15,	%f4
	movrgez	%g1,	0x03F,	%o5
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	movn	%xcc,	%g5,	%o1
	fmovsneg	%xcc,	%f26,	%f10
	xorcc	%i6,	0x0345,	%i1
	udivx	%o4,	0x1E6D,	%l0
	orn	%i3,	0x0142,	%g2
	array8	%g4,	%o2,	%g6
	orncc	%o7,	%g7,	%l5
	orncc	%i2,	%o0,	%o6
	fcmpeq16	%f26,	%f12,	%i5
	edge8l	%l2,	%l1,	%l3
	sra	%i7,	0x19,	%l4
	movl	%icc,	%l6,	%i4
	smulcc	%g3,	0x16D8,	%o5
	add	%o3,	%i0,	%g1
	ld	[%l7 + 0x78],	%f29
	orncc	%o1,	%i6,	%g5
	fcmpes	%fcc2,	%f29,	%f14
	fpadd16	%f8,	%f18,	%f30
	fmovsg	%xcc,	%f18,	%f12
	orn	%o4,	0x1D31,	%l0
	lduh	[%l7 + 0x7A],	%i1
	sdiv	%i3,	0x1E9A,	%g2
	ldx	[%l7 + 0x50],	%g4
	xorcc	%o2,	0x0F3E,	%o7
	udivx	%g6,	0x0679,	%l5
	edge16ln	%g7,	%o0,	%i2
	sir	0x0EE6
	fands	%f4,	%f15,	%f14
	save %o6, %i5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l2,	%i7
	sth	%l3,	[%l7 + 0x1C]
	siam	0x2
	andcc	%l6,	0x18CA,	%i4
	restore %l4, 0x19D0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o5,	%o3,	%g1
	fmovde	%xcc,	%f7,	%f31
	stw	%i0,	[%l7 + 0x2C]
	fnot1s	%f30,	%f1
	add	%o1,	%i6,	%g5
	umul	%l0,	0x198E,	%i1
	edge8n	%i3,	%g2,	%g4
	movrne	%o4,	%o2,	%o7
	ldub	[%l7 + 0x39],	%g6
	fnegd	%f16,	%f4
	edge32	%l5,	%o0,	%g7
	fmovdpos	%icc,	%f25,	%f5
	lduh	[%l7 + 0x22],	%i2
	fmovdvc	%xcc,	%f1,	%f22
	udivcc	%o6,	0x1F6A,	%i5
	umul	%l1,	%l2,	%i7
	fmovdne	%xcc,	%f27,	%f23
	edge8	%l6,	%i4,	%l4
	edge16n	%l3,	%o5,	%g3
	alignaddrl	%o3,	%i0,	%g1
	mulx	%o1,	%i6,	%g5
	stb	%l0,	[%l7 + 0x60]
	xorcc	%i3,	%g2,	%i1
	fmovsleu	%icc,	%f15,	%f14
	fpsub16	%f18,	%f22,	%f0
	ldd	[%l7 + 0x60],	%o4
	movvs	%icc,	%o2,	%o7
	fexpand	%f29,	%f26
	edge8	%g6,	%g4,	%o0
	edge16ln	%g7,	%l5,	%o6
	movrlz	%i5,	0x058,	%l1
	edge16ln	%i2,	%i7,	%l2
	array16	%i4,	%l4,	%l6
	edge32ln	%l3,	%o5,	%o3
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	smulcc	%o1,	0x1F5E,	%i0
	movgu	%xcc,	%g5,	%l0
	popc	0x1AB3,	%i3
	ldub	[%l7 + 0x0E],	%g2
	fpsub32	%f16,	%f16,	%f20
	movg	%icc,	%i1,	%i6
	lduh	[%l7 + 0x68],	%o4
	movrgez	%o2,	0x1DD,	%o7
	fmovsl	%xcc,	%f29,	%f5
	movvs	%xcc,	%g6,	%o0
	movrgez	%g7,	0x095,	%l5
	array32	%g4,	%i5,	%o6
	mova	%xcc,	%l1,	%i7
	stb	%i2,	[%l7 + 0x78]
	orn	%l2,	%i4,	%l4
	udiv	%l3,	0x0881,	%o5
	fzero	%f10
	stx	%o3,	[%l7 + 0x50]
	fpsub16s	%f15,	%f21,	%f17
	umul	%g3,	%l6,	%g1
	addc	%o1,	0x0EC8,	%i0
	xor	%g5,	0x0B7C,	%l0
	array32	%g2,	%i1,	%i6
	nop
	set	0x52, %g5
	ldsh	[%l7 + %g5],	%o4
	popc	%o2,	%o7
	fmovsl	%icc,	%f3,	%f31
	move	%icc,	%i3,	%g6
	movvs	%xcc,	%o0,	%l5
	edge32l	%g7,	%i5,	%g4
	edge32ln	%l1,	%i7,	%i2
	popc	0x077B,	%o6
	fabsd	%f28,	%f18
	edge16n	%l2,	%l4,	%l3
	ldd	[%l7 + 0x50],	%i4
	edge16	%o5,	%o3,	%g3
	srlx	%g1,	%o1,	%l6
	movcs	%icc,	%i0,	%l0
	edge8l	%g2,	%i1,	%i6
	edge32n	%o4,	%o2,	%o7
	addc	%i3,	0x11B2,	%g5
	save %o0, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x0C],	%i5
	and	%g4,	%l1,	%i7
	stw	%g7,	[%l7 + 0x60]
	sllx	%o6,	%l2,	%l4
	xnor	%l3,	0x1CA1,	%i4
	ld	[%l7 + 0x78],	%f28
	fmovrslz	%o5,	%f13,	%f18
	srl	%o3,	%g3,	%g1
	edge8ln	%o1,	%i2,	%l6
	edge16n	%l0,	%g2,	%i0
	sub	%i6,	0x1F5D,	%i1
	fmovdcs	%icc,	%f6,	%f19
	ldsb	[%l7 + 0x4A],	%o4
	save %o7, %o2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2s	%f23,	%f25
	movrne	%i3,	%l5,	%o0
	movneg	%xcc,	%i5,	%g6
	ldub	[%l7 + 0x0D],	%l1
	edge32l	%g4,	%i7,	%g7
	ldd	[%l7 + 0x38],	%o6
	edge16	%l4,	%l2,	%i4
	movrne	%l3,	0x23A,	%o5
	fpsub16s	%f21,	%f10,	%f16
	andcc	%g3,	0x0760,	%g1
	save %o1, 0x1EB6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l6,	%l0,	%g2
	sra	%i0,	0x14,	%o3
	edge16n	%i6,	%i1,	%o4
	movrne	%o7,	0x1FF,	%g5
	ldd	[%l7 + 0x50],	%o2
	orncc	%i3,	%o0,	%l5
	sdiv	%i5,	0x0FC1,	%l1
	xnor	%g6,	0x0C22,	%i7
	movleu	%xcc,	%g7,	%o6
	movpos	%xcc,	%g4,	%l2
	fmovsgu	%xcc,	%f28,	%f10
	fandnot1	%f28,	%f0,	%f30
	or	%l4,	0x07F0,	%l3
	fone	%f2
	stx	%i4,	[%l7 + 0x70]
	sethi	0x181A,	%o5
	array16	%g3,	%o1,	%g1
	movvc	%icc,	%l6,	%l0
	xnor	%g2,	0x1C91,	%i2
	xnorcc	%i0,	0x0C6A,	%o3
	array8	%i1,	%o4,	%o7
	edge8	%g5,	%i6,	%i3
	ldsw	[%l7 + 0x3C],	%o2
	andn	%o0,	0x1EDF,	%l5
	and	%l1,	%i5,	%i7
	movrlz	%g7,	%g6,	%g4
	popc	%l2,	%o6
	fcmped	%fcc2,	%f2,	%f10
	fmovdne	%xcc,	%f31,	%f8
	mova	%xcc,	%l4,	%i4
	edge8	%l3,	%o5,	%o1
	fxnors	%f5,	%f24,	%f13
	subccc	%g1,	0x08B2,	%l6
	std	%f2,	[%l7 + 0x20]
	edge32l	%l0,	%g2,	%i2
	sethi	0x16CA,	%g3
	mulscc	%i0,	0x0C3C,	%o3
	edge8	%i1,	%o7,	%g5
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%o4
	andn	%i3,	0x0308,	%o2
	sdivx	%o0,	0x0268,	%l5
	mova	%xcc,	%i6,	%l1
	lduw	[%l7 + 0x28],	%i7
	array16	%g7,	%i5,	%g4
	ldd	[%l7 + 0x78],	%f8
	movge	%xcc,	%g6,	%l2
	edge16ln	%o6,	%l4,	%i4
	ldub	[%l7 + 0x1B],	%l3
	fand	%f6,	%f16,	%f10
	edge32l	%o5,	%o1,	%g1
	sir	0x136A
	smulcc	%l0,	0x1F01,	%l6
	sra	%i2,	0x06,	%g3
	edge32	%i0,	%o3,	%g2
	edge8l	%i1,	%o7,	%g5
	movrlez	%i3,	0x0F8,	%o4
	fmovdcs	%icc,	%f12,	%f23
	fornot2s	%f26,	%f26,	%f11
	save %o0, %l5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o2,	0x109,	%i7
	alignaddr	%g7,	%i5,	%l1
	nop
	set	0x40, %o0
	ldd	[%l7 + %o0],	%g6
	and	%l2,	%g4,	%o6
	xorcc	%i4,	0x12F9,	%l4
	movne	%icc,	%o5,	%o1
	movne	%icc,	%g1,	%l0
	andcc	%l6,	0x15CD,	%i2
	andcc	%g3,	0x1986,	%i0
	std	%f0,	[%l7 + 0x38]
	nop
	set	0x58, %i7
	std	%f28,	[%l7 + %i7]
	array8	%o3,	%g2,	%l3
	ldx	[%l7 + 0x78],	%i1
	edge16l	%o7,	%g5,	%i3
	mulscc	%o0,	0x193A,	%o4
	addccc	%i6,	%l5,	%i7
	fmuld8ulx16	%f21,	%f12,	%f28
	fmovsge	%xcc,	%f4,	%f27
	sir	0x0D06
	subccc	%o2,	0x0B89,	%i5
	subcc	%l1,	0x1E7B,	%g7
	umulcc	%g6,	0x14D0,	%l2
	movle	%icc,	%g4,	%i4
	fornot2s	%f11,	%f17,	%f0
	orcc	%o6,	%o5,	%l4
	edge32l	%o1,	%g1,	%l6
	edge8	%l0,	%i2,	%i0
	ldsb	[%l7 + 0x3A],	%o3
	edge32n	%g2,	%l3,	%i1
	movrgz	%o7,	%g3,	%g5
	sra	%o0,	0x15,	%o4
	edge8	%i6,	%l5,	%i7
	sdivx	%i3,	0x0D6E,	%i5
	movcc	%xcc,	%o2,	%l1
	xorcc	%g6,	%l2,	%g7
	fcmped	%fcc2,	%f2,	%f14
	subccc	%i4,	%g4,	%o5
	movrlez	%l4,	0x2C1,	%o1
	sllx	%g1,	%o6,	%l0
	fmul8x16	%f21,	%f28,	%f8
	srax	%l6,	%i2,	%o3
	movrlez	%g2,	%l3,	%i0
	ldx	[%l7 + 0x08],	%o7
	sdivcc	%i1,	0x08F4,	%g5
	fmul8ulx16	%f18,	%f2,	%f24
	lduh	[%l7 + 0x4C],	%o0
	andncc	%g3,	%i6,	%o4
	edge8ln	%i7,	%i3,	%l5
	ldub	[%l7 + 0x21],	%o2
	sra	%i5,	0x0E,	%g6
	edge32n	%l2,	%g7,	%i4
	sth	%g4,	[%l7 + 0x30]
	fpackfix	%f20,	%f5
	fmul8x16	%f7,	%f28,	%f0
	fmovdvc	%icc,	%f4,	%f15
	sll	%o5,	%l4,	%l1
	fmovda	%icc,	%f4,	%f21
	xnorcc	%g1,	0x116C,	%o6
	fmovs	%f21,	%f27
	fors	%f10,	%f13,	%f21
	movre	%l0,	%l6,	%o1
	st	%f28,	[%l7 + 0x24]
	sll	%i2,	0x00,	%o3
	edge16ln	%l3,	%g2,	%o7
	edge16ln	%i1,	%i0,	%g5
	sllx	%g3,	0x06,	%o0
	sethi	0x0309,	%i6
	fones	%f13
	edge8ln	%o4,	%i7,	%i3
	sir	0x04DD
	lduh	[%l7 + 0x74],	%l5
	array8	%o2,	%i5,	%l2
	xorcc	%g7,	0x0E26,	%i4
	edge8ln	%g4,	%g6,	%o5
	subc	%l1,	0x14B9,	%l4
	popc	%o6,	%l0
	edge8	%g1,	%o1,	%l6
	stw	%o3,	[%l7 + 0x1C]
	fnand	%f4,	%f2,	%f0
	edge16n	%i2,	%g2,	%o7
	sub	%l3,	%i1,	%g5
	fmovdleu	%icc,	%f12,	%f0
	udivcc	%g3,	0x1B57,	%i0
	orn	%o0,	%o4,	%i7
	sllx	%i3,	0x05,	%i6
	sir	0x140A
	addccc	%l5,	0x0843,	%i5
	fzeros	%f8
	xorcc	%o2,	0x1171,	%g7
	srl	%l2,	0x09,	%g4
	stw	%g6,	[%l7 + 0x1C]
	movne	%icc,	%i4,	%o5
	sdiv	%l4,	0x01CF,	%o6
	ldub	[%l7 + 0x0C],	%l0
	fmuld8ulx16	%f13,	%f31,	%f24
	mulx	%l1,	0x063B,	%g1
	andncc	%o1,	%o3,	%i2
	movn	%icc,	%l6,	%o7
	movgu	%xcc,	%l3,	%i1
	fmul8x16	%f6,	%f16,	%f20
	edge8l	%g5,	%g3,	%g2
	faligndata	%f18,	%f24,	%f4
	ldd	[%l7 + 0x68],	%f6
	sll	%o0,	0x00,	%o4
	movcs	%icc,	%i0,	%i7
	udiv	%i3,	0x1C3E,	%l5
	movge	%xcc,	%i5,	%o2
	movrne	%g7,	%l2,	%g4
	movrlz	%i6,	%i4,	%g6
	srax	%o5,	0x01,	%l4
	xnor	%o6,	%l0,	%g1
	xnor	%o1,	%l1,	%i2
	fmovrslz	%l6,	%f11,	%f13
	edge16ln	%o7,	%l3,	%i1
	movrgez	%o3,	%g3,	%g5
	edge8ln	%o0,	%o4,	%i0
	sdivx	%g2,	0x031D,	%i7
	and	%i3,	%i5,	%l5
	movleu	%xcc,	%g7,	%l2
	edge16ln	%o2,	%g4,	%i4
	movpos	%xcc,	%g6,	%o5
	sth	%l4,	[%l7 + 0x62]
	movre	%i6,	0x250,	%l0
	andcc	%o6,	%o1,	%g1
	fmovrsne	%i2,	%f17,	%f28
	edge32l	%l6,	%o7,	%l3
	fcmple32	%f20,	%f4,	%i1
	subccc	%o3,	%g3,	%g5
	popc	%o0,	%l1
	st	%f23,	[%l7 + 0x18]
	ldsw	[%l7 + 0x58],	%i0
	edge16	%g2,	%i7,	%i3
	edge16	%i5,	%o4,	%l5
	orn	%g7,	0x1EB2,	%o2
	edge16l	%l2,	%i4,	%g4
	add	%g6,	0x0783,	%l4
	stw	%i6,	[%l7 + 0x6C]
	fzero	%f4
	mulscc	%l0,	0x04C6,	%o5
	movn	%xcc,	%o1,	%g1
	fcmpeq16	%f8,	%f18,	%o6
	movn	%xcc,	%i2,	%o7
	sub	%l6,	0x1A02,	%i1
	fmovdneg	%icc,	%f5,	%f18
	fmovrdgz	%l3,	%f16,	%f28
	movg	%xcc,	%g3,	%g5
	fmul8sux16	%f22,	%f2,	%f10
	edge8	%o0,	%o3,	%l1
	fmovdvs	%icc,	%f15,	%f6
	movl	%xcc,	%i0,	%i7
	fmovrdlez	%g2,	%f8,	%f22
	xnorcc	%i5,	0x1E25,	%i3
	fnegs	%f11,	%f14
	movg	%icc,	%o4,	%g7
	udivx	%o2,	0x0DD0,	%l5
	xorcc	%l2,	0x0868,	%i4
	udivcc	%g6,	0x04FA,	%l4
	andncc	%i6,	%g4,	%o5
	ldd	[%l7 + 0x40],	%o0
	movn	%xcc,	%g1,	%l0
	edge32	%i2,	%o6,	%o7
	srl	%l6,	0x03,	%i1
	restore %l3, 0x11CC, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o0,	0x091D,	%o3
	edge8n	%l1,	%i0,	%g3
	edge32	%g2,	%i5,	%i7
	add	%i3,	0x1094,	%g7
	edge32n	%o4,	%l5,	%o2
	edge8n	%l2,	%g6,	%i4
	fmovdle	%icc,	%f28,	%f25
	movleu	%xcc,	%i6,	%l4
	fmovd	%f20,	%f22
	andncc	%o5,	%o1,	%g1
	sir	0x0715
	smul	%g4,	0x0FFE,	%i2
	fmovrdlez	%o6,	%f18,	%f26
	fnot1	%f14,	%f22
	ldd	[%l7 + 0x70],	%l0
	movleu	%xcc,	%o7,	%l6
	movrgez	%l3,	%g5,	%o0
	fmovsle	%xcc,	%f11,	%f14
	fmovrsne	%o3,	%f19,	%f4
	fands	%f15,	%f21,	%f24
	mova	%icc,	%l1,	%i1
	mulscc	%i0,	%g3,	%g2
	faligndata	%f14,	%f2,	%f24
	edge8l	%i7,	%i5,	%i3
	srax	%o4,	%g7,	%l5
	fmovd	%f28,	%f20
	stx	%l2,	[%l7 + 0x50]
	edge8	%g6,	%o2,	%i6
	movl	%icc,	%l4,	%o5
	nop
	set	0x46, %o1
	lduh	[%l7 + %o1],	%o1
	sth	%i4,	[%l7 + 0x48]
	subccc	%g1,	0x0839,	%i2
	movleu	%xcc,	%o6,	%g4
	addcc	%o7,	0x04D8,	%l6
	mova	%xcc,	%l3,	%l0
	andcc	%o0,	%g5,	%o3
	movl	%icc,	%i1,	%i0
	movle	%xcc,	%g3,	%g2
	stw	%i7,	[%l7 + 0x20]
	fmovsleu	%xcc,	%f16,	%f9
	fpsub32	%f16,	%f24,	%f6
	fmovrdgez	%i5,	%f8,	%f26
	movg	%xcc,	%i3,	%o4
	lduw	[%l7 + 0x48],	%l1
	udivx	%l5,	0x0CD6,	%l2
	edge8	%g7,	%o2,	%i6
	ldsw	[%l7 + 0x40],	%l4
	add	%g6,	%o1,	%o5
	movcc	%xcc,	%g1,	%i2
	fmovse	%xcc,	%f12,	%f23
	ldsb	[%l7 + 0x74],	%i4
	edge32n	%g4,	%o7,	%l6
	edge8l	%l3,	%l0,	%o6
	sllx	%o0,	%g5,	%o3
	addcc	%i1,	0x156D,	%i0
	orcc	%g2,	0x1A7A,	%g3
	fornot2s	%f0,	%f31,	%f24
	sllx	%i5,	0x12,	%i7
	movrlz	%o4,	0x3FD,	%l1
	fandnot2	%f18,	%f22,	%f12
	edge16l	%i3,	%l5,	%l2
	ldsb	[%l7 + 0x6E],	%g7
	srl	%i6,	0x0A,	%o2
	movvs	%xcc,	%l4,	%o1
	fmovdge	%icc,	%f21,	%f28
	fmovdge	%icc,	%f27,	%f4
	fones	%f2
	fmovspos	%xcc,	%f24,	%f1
	edge32	%g6,	%g1,	%i2
	fcmpgt32	%f18,	%f30,	%i4
	xnorcc	%g4,	0x1E65,	%o5
	edge16l	%l6,	%l3,	%l0
	sub	%o6,	%o0,	%o7
	subcc	%g5,	%o3,	%i0
	array16	%g2,	%i1,	%g3
	add	%i5,	%i7,	%l1
	smul	%o4,	0x1C26,	%i3
	subc	%l5,	%l2,	%g7
	movg	%icc,	%o2,	%i6
	mulscc	%o1,	0x13F7,	%g6
	srax	%g1,	0x07,	%i2
	st	%f4,	[%l7 + 0x34]
	stw	%i4,	[%l7 + 0x6C]
	ld	[%l7 + 0x2C],	%f13
	ldsh	[%l7 + 0x60],	%l4
	movrlez	%o5,	%l6,	%l3
	orn	%l0,	%o6,	%o0
	alignaddr	%o7,	%g4,	%g5
	ldd	[%l7 + 0x50],	%f2
	addc	%i0,	0x1F69,	%g2
	alignaddrl	%o3,	%g3,	%i1
	smul	%i7,	%l1,	%o4
	edge16	%i5,	%l5,	%i3
	mulx	%l2,	%g7,	%i6
	lduw	[%l7 + 0x3C],	%o2
	orcc	%g6,	0x1013,	%g1
	movrlez	%o1,	%i4,	%i2
	alignaddr	%l4,	%l6,	%o5
	alignaddr	%l3,	%l0,	%o0
	srax	%o7,	0x0A,	%o6
	edge8l	%g5,	%i0,	%g4
	edge16l	%g2,	%g3,	%i1
	subc	%i7,	0x006B,	%l1
	ldsb	[%l7 + 0x60],	%o4
	sethi	0x1ED3,	%i5
	fpsub32	%f12,	%f2,	%f24
	popc	%o3,	%l5
	movrgz	%i3,	0x12A,	%g7
	udiv	%i6,	0x01C3,	%o2
	fmovdleu	%icc,	%f12,	%f9
	sllx	%l2,	0x00,	%g6
	sdiv	%o1,	0x16E7,	%g1
	xnor	%i2,	0x141C,	%i4
	udivx	%l4,	0x0C32,	%l6
	movg	%icc,	%l3,	%l0
	sth	%o5,	[%l7 + 0x32]
	addc	%o0,	0x03B6,	%o7
	array16	%o6,	%i0,	%g5
	sethi	0x1A25,	%g2
	fornot1	%f28,	%f20,	%f14
	fmovdgu	%xcc,	%f0,	%f3
	fxor	%f2,	%f8,	%f0
	xor	%g4,	%g3,	%i1
	ldub	[%l7 + 0x1D],	%l1
	movle	%icc,	%i7,	%o4
	save %i5, 0x1A0F, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o3,	%i3,	%i6
	ldd	[%l7 + 0x40],	%f24
	std	%f2,	[%l7 + 0x48]
	ld	[%l7 + 0x48],	%f17
	edge8n	%o2,	%l2,	%g6
	edge32l	%g7,	%g1,	%i2
	fnot1s	%f18,	%f2
	srlx	%o1,	%i4,	%l6
	fmovsneg	%xcc,	%f5,	%f21
	smul	%l3,	%l4,	%o5
	movrgez	%o0,	%o7,	%o6
	ldd	[%l7 + 0x38],	%l0
	movne	%xcc,	%i0,	%g5
	movrlz	%g2,	0x360,	%g4
	movl	%icc,	%g3,	%i1
	fabsd	%f4,	%f2
	movcc	%xcc,	%l1,	%o4
	fand	%f26,	%f28,	%f12
	siam	0x6
	stx	%i5,	[%l7 + 0x70]
	fpadd32	%f20,	%f18,	%f26
	fmul8sux16	%f20,	%f22,	%f30
	sth	%i7,	[%l7 + 0x08]
	move	%xcc,	%o3,	%l5
	edge32n	%i6,	%o2,	%i3
	mulscc	%l2,	%g6,	%g1
	movpos	%xcc,	%g7,	%i2
	fmovdvs	%icc,	%f2,	%f6
	srax	%o1,	%i4,	%l3
	orn	%l4,	%o5,	%o0
	srax	%l6,	%o7,	%l0
	or	%o6,	0x041A,	%g5
	fmovrslez	%g2,	%f6,	%f3
	srax	%g4,	%i0,	%i1
	movleu	%icc,	%g3,	%o4
	fors	%f29,	%f7,	%f2
	fornot1	%f10,	%f24,	%f10
	fcmpeq32	%f0,	%f18,	%i5
	popc	0x0E33,	%l1
	addc	%o3,	0x093B,	%i7
	fands	%f0,	%f5,	%f11
	stx	%i6,	[%l7 + 0x38]
	edge16l	%l5,	%o2,	%l2
	sdiv	%i3,	0x1B94,	%g1
	fmovdn	%xcc,	%f6,	%f21
	fpadd32s	%f18,	%f26,	%f26
	nop
	set	0x60, %l3
	ldsw	[%l7 + %l3],	%g7
	edge16	%i2,	%o1,	%i4
	movvc	%xcc,	%l3,	%l4
	udivx	%g6,	0x05D0,	%o5
	fxors	%f3,	%f4,	%f10
	edge8l	%o0,	%o7,	%l0
	fmovdne	%icc,	%f21,	%f21
	andn	%l6,	0x1DF0,	%o6
	fxnors	%f12,	%f14,	%f11
	movneg	%xcc,	%g5,	%g4
	nop
	set	0x70, %l5
	std	%f20,	[%l7 + %l5]
	edge16n	%g2,	%i0,	%i1
	movcs	%xcc,	%o4,	%g3
	udivx	%i5,	0x1C4A,	%o3
	edge32ln	%i7,	%l1,	%i6
	addcc	%o2,	%l5,	%i3
	andn	%l2,	0x0CB0,	%g7
	fornot2	%f2,	%f8,	%f8
	sll	%i2,	%g1,	%o1
	sdiv	%l3,	0x13D1,	%i4
	save %g6, %o5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f16,	%f12,	%f28
	ldsw	[%l7 + 0x40],	%l4
	sll	%l0,	0x14,	%o7
	fmovdvc	%xcc,	%f7,	%f20
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	stb	%g5,	[%l7 + 0x7E]
	orncc	%i0,	%i1,	%o4
	sub	%g3,	0x0B07,	%g2
	fzero	%f24
	add	%i5,	%o3,	%i7
	stw	%l1,	[%l7 + 0x54]
	nop
	set	0x20, %o6
	ldx	[%l7 + %o6],	%o2
	nop
	set	0x30, %l0
	ldsw	[%l7 + %l0],	%l5
	edge16n	%i3,	%l2,	%i6
	stx	%g7,	[%l7 + 0x78]
	movcs	%icc,	%g1,	%o1
	ldsb	[%l7 + 0x1C],	%i2
	popc	%i4,	%g6
	movre	%l3,	0x1FE,	%o0
	sdivcc	%o5,	0x0DE5,	%l4
	udivx	%o7,	0x08CA,	%l0
	popc	%l6,	%o6
	fnot2s	%f8,	%f28
	mova	%icc,	%g5,	%g4
	nop
	set	0x2B, %l1
	ldsb	[%l7 + %l1],	%i0
	ldsw	[%l7 + 0x20],	%o4
	udivx	%i1,	0x157A,	%g2
	subccc	%g3,	%o3,	%i7
	movrlz	%l1,	0x0DE,	%o2
	sub	%l5,	%i5,	%l2
	edge8n	%i3,	%g7,	%i6
	subccc	%o1,	0x0783,	%g1
	fabss	%f9,	%f27
	for	%f26,	%f26,	%f4
	move	%xcc,	%i2,	%g6
	fors	%f18,	%f4,	%f20
	edge8n	%l3,	%o0,	%i4
	addccc	%l4,	0x093D,	%o7
	mova	%xcc,	%l0,	%o5
	edge8ln	%l6,	%o6,	%g4
	array8	%i0,	%o4,	%i1
	restore %g2, 0x0BE0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g5,	0x07D8,	%o3
	array32	%l1,	%i7,	%l5
	smul	%i5,	%o2,	%l2
	fmovd	%f0,	%f14
	popc	0x1AAE,	%i3
	stx	%g7,	[%l7 + 0x20]
	fones	%f17
	array8	%i6,	%g1,	%i2
	subc	%g6,	%o1,	%o0
	alignaddrl	%l3,	%l4,	%i4
	edge32	%o7,	%l0,	%l6
	movvc	%icc,	%o6,	%o5
	fmovsvs	%icc,	%f24,	%f23
	movne	%xcc,	%i0,	%o4
	array32	%i1,	%g4,	%g2
	ld	[%l7 + 0x50],	%f8
	xnorcc	%g5,	0x19D0,	%o3
	popc	%l1,	%i7
	edge32ln	%g3,	%l5,	%i5
	fmovdcs	%xcc,	%f29,	%f2
	ldsb	[%l7 + 0x6D],	%o2
	movneg	%icc,	%l2,	%g7
	movrgz	%i6,	%i3,	%g1
	fmovdge	%xcc,	%f29,	%f29
	edge8n	%g6,	%o1,	%o0
	edge8ln	%i2,	%l4,	%l3
	lduw	[%l7 + 0x28],	%i4
	fmovsl	%xcc,	%f23,	%f21
	xor	%l0,	%o7,	%o6
	andncc	%l6,	%i0,	%o4
	subc	%o5,	%g4,	%i1
	addcc	%g5,	%g2,	%l1
	ldd	[%l7 + 0x70],	%i6
	ldd	[%l7 + 0x68],	%g2
	fpack16	%f26,	%f7
	movrgz	%l5,	%i5,	%o2
	save %l2, 0x1804, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f12,	%f22
	subc	%i6,	0x111F,	%o3
	alignaddr	%i3,	%g1,	%g6
	edge32	%o0,	%o1,	%i2
	edge8ln	%l4,	%l3,	%i4
	ldub	[%l7 + 0x3A],	%o7
	fcmple32	%f30,	%f24,	%o6
	andncc	%l6,	%i0,	%o4
	andncc	%l0,	%o5,	%g4
	movg	%icc,	%g5,	%i1
	stx	%l1,	[%l7 + 0x18]
	xorcc	%i7,	0x01BE,	%g3
	addccc	%l5,	%g2,	%o2
	fsrc1s	%f26,	%f31
	nop
	set	0x4A, %l2
	ldsh	[%l7 + %l2],	%l2
	movle	%icc,	%g7,	%i6
	movleu	%icc,	%o3,	%i5
	edge32	%i3,	%g1,	%o0
	save %g6, %i2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f31,	%f27
	addcc	%l3,	0x038D,	%i4
	sdivx	%l4,	0x0C24,	%o6
	or	%l6,	%o7,	%i0
	fxnors	%f22,	%f17,	%f11
	fmovdvs	%xcc,	%f11,	%f29
	fmovrsgez	%l0,	%f27,	%f3
	udivx	%o5,	0x1934,	%o4
	fnands	%f17,	%f22,	%f4
	std	%f24,	[%l7 + 0x38]
	array16	%g4,	%g5,	%i1
	movneg	%xcc,	%l1,	%i7
	umul	%l5,	0x0ADB,	%g2
	andn	%o2,	%g3,	%g7
	xnorcc	%l2,	%o3,	%i5
	xnor	%i6,	0x174F,	%i3
	edge8n	%o0,	%g1,	%i2
	orncc	%o1,	%g6,	%i4
	ldx	[%l7 + 0x40],	%l4
	fmovsvc	%xcc,	%f1,	%f1
	addccc	%o6,	%l6,	%o7
	sra	%i0,	%l0,	%l3
	ld	[%l7 + 0x50],	%f1
	fones	%f10
	add	%o4,	%o5,	%g5
	srl	%g4,	0x1E,	%l1
	xnorcc	%i7,	%l5,	%i1
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	sll	%g7,	%l2,	%o3
	pdist	%f18,	%f4,	%f24
	subc	%g3,	0x1CD4,	%i5
	fexpand	%f10,	%f0
	fmovrdgz	%i3,	%f20,	%f10
	subccc	%i6,	%g1,	%i2
	nop
	set	0x10, %i3
	stx	%o0,	[%l7 + %i3]
	udivx	%g6,	0x024A,	%i4
	or	%o1,	0x1830,	%l4
	srax	%l6,	0x1F,	%o6
	siam	0x5
	fmovdcs	%icc,	%f6,	%f12
	edge32n	%o7,	%l0,	%l3
	ldsb	[%l7 + 0x50],	%o4
	movvs	%xcc,	%i0,	%g5
	ldx	[%l7 + 0x68],	%g4
	subccc	%l1,	0x01BC,	%o5
	fmovsa	%icc,	%f11,	%f20
	smul	%i7,	0x140E,	%l5
	array16	%o2,	%i1,	%g7
	fornot2	%f0,	%f6,	%f22
	fand	%f4,	%f0,	%f24
	fnot2s	%f19,	%f3
	restore %l2, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g3,	0x0E,	%i5
	movrgz	%i3,	0x3F4,	%i6
	stw	%i2,	[%l7 + 0x38]
	udiv	%g1,	0x0B0E,	%g6
	fabss	%f11,	%f10
	smulcc	%i4,	%o1,	%l4
	orcc	%o0,	%o6,	%l6
	edge8n	%l0,	%l3,	%o7
	xnorcc	%o4,	0x1CC2,	%g5
	edge8ln	%g4,	%i0,	%l1
	movrgez	%i7,	%o5,	%o2
	fornot1	%f24,	%f30,	%f6
	array8	%l5,	%g7,	%i1
	sethi	0x08B2,	%g2
	fmul8ulx16	%f4,	%f22,	%f6
	sra	%o3,	0x14,	%l2
	sethi	0x1D04,	%g3
	mulx	%i3,	%i6,	%i2
	umul	%i5,	0x091E,	%g1
	addccc	%i4,	%g6,	%l4
	edge8l	%o1,	%o0,	%l6
	fsrc2	%f18,	%f2
	popc	%l0,	%o6
	mulx	%o7,	0x10F5,	%o4
	edge8	%l3,	%g5,	%g4
	subc	%l1,	%i0,	%o5
	movcs	%xcc,	%o2,	%l5
	movge	%icc,	%g7,	%i7
	movg	%xcc,	%i1,	%g2
	nop
	set	0x73, %g1
	ldub	[%l7 + %g1],	%l2
	orcc	%o3,	0x1208,	%g3
	ldx	[%l7 + 0x58],	%i3
	lduh	[%l7 + 0x7A],	%i2
	save %i5, %g1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g6,	0x0DCE,	%l4
	alignaddrl	%i6,	%o1,	%o0
	alignaddrl	%l6,	%l0,	%o7
	andn	%o4,	%o6,	%g5
	umul	%l3,	0x0324,	%l1
	ldub	[%l7 + 0x50],	%g4
	array8	%i0,	%o2,	%l5
	movneg	%icc,	%g7,	%i7
	ld	[%l7 + 0x3C],	%f5
	fnors	%f31,	%f18,	%f10
	ld	[%l7 + 0x48],	%f7
	srl	%o5,	%g2,	%i1
	edge16n	%o3,	%g3,	%i3
	edge32n	%i2,	%l2,	%i5
	fxors	%f22,	%f19,	%f6
	edge32	%g1,	%g6,	%l4
	alignaddr	%i6,	%o1,	%i4
	fmovdvc	%icc,	%f16,	%f13
	fmovdg	%xcc,	%f7,	%f21
	movpos	%icc,	%o0,	%l6
	movrlez	%o7,	%l0,	%o4
	xnor	%g5,	0x1255,	%l3
	edge16l	%l1,	%o6,	%i0
	fpack32	%f16,	%f22,	%f16
	fnot2	%f18,	%f26
	fmovsn	%xcc,	%f8,	%f10
	sir	0x052F
	srl	%o2,	%l5,	%g4
	fmovdle	%xcc,	%f15,	%f3
	sra	%i7,	%g7,	%o5
	edge8ln	%i1,	%o3,	%g2
	mova	%xcc,	%i3,	%i2
	xnor	%g3,	0x0E32,	%l2
	fpsub32	%f6,	%f2,	%f6
	sllx	%g1,	%i5,	%g6
	xnorcc	%i6,	%l4,	%o1
	movrlez	%o0,	0x2E3,	%l6
	nop
	set	0x58, %o3
	stx	%i4,	[%l7 + %o3]
	move	%xcc,	%l0,	%o4
	movpos	%xcc,	%g5,	%l3
	fnegs	%f28,	%f20
	fpsub16	%f12,	%f30,	%f0
	fxor	%f26,	%f14,	%f0
	fsrc2	%f2,	%f18
	fmovrdgez	%o7,	%f8,	%f16
	umulcc	%o6,	%l1,	%i0
	movne	%xcc,	%l5,	%o2
	sdivx	%i7,	0x0771,	%g4
	fmovs	%f23,	%f25
	movgu	%icc,	%g7,	%o5
	fpadd32s	%f27,	%f27,	%f24
	xor	%o3,	0x0962,	%i1
	edge32	%i3,	%g2,	%i2
	movpos	%xcc,	%g3,	%l2
	orncc	%i5,	%g1,	%i6
	sir	0x08FA
	addcc	%g6,	0x1E00,	%l4
	fsrc2	%f12,	%f28
	fpsub32	%f10,	%f2,	%f8
	srlx	%o0,	0x19,	%o1
	fmovrsgez	%i4,	%f12,	%f13
	addccc	%l6,	%o4,	%g5
	fnand	%f26,	%f30,	%f20
	movpos	%xcc,	%l0,	%o7
	addcc	%o6,	%l1,	%l3
	fmovrslez	%i0,	%f16,	%f24
	stb	%o2,	[%l7 + 0x30]
	fsrc2	%f4,	%f22
	edge32	%l5,	%i7,	%g7
	save %g4, 0x0206, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o5,	%i1,	%g2
	addcc	%i2,	%i3,	%l2
	edge32ln	%i5,	%g3,	%g1
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	sethi	0x1B42,	%o0
	movleu	%xcc,	%o1,	%i4
	fmovdvc	%icc,	%f1,	%f7
	edge32l	%l6,	%o4,	%g5
	fxors	%f23,	%f2,	%f7
	save %g6, %l0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l1,	0x03AA,	%l3
	edge8l	%i0,	%o2,	%o6
	movrgez	%i7,	%g7,	%l5
	edge16	%g4,	%o5,	%i1
	popc	%g2,	%o3
	movvc	%xcc,	%i2,	%i3
	andncc	%l2,	%i5,	%g3
	edge16	%i6,	%l4,	%g1
	edge16n	%o1,	%o0,	%l6
	fmul8x16au	%f31,	%f1,	%f20
	movle	%icc,	%o4,	%i4
	movrgez	%g5,	0x277,	%l0
	smul	%g6,	%l1,	%o7
	fpadd32s	%f3,	%f27,	%f7
	umul	%i0,	%l3,	%o2
	movl	%xcc,	%i7,	%o6
	fzero	%f10
	sdivcc	%l5,	0x0818,	%g7
	smul	%g4,	%i1,	%g2
	andn	%o5,	%o3,	%i2
	edge16ln	%i3,	%i5,	%l2
	addc	%g3,	%i6,	%l4
	sethi	0x1DF7,	%o1
	movgu	%xcc,	%g1,	%o0
	fcmpne32	%f24,	%f0,	%l6
	andn	%i4,	0x16FC,	%o4
	orcc	%l0,	0x0E86,	%g5
	sra	%g6,	%o7,	%i0
	movrne	%l1,	%l3,	%o2
	movpos	%icc,	%i7,	%o6
	edge32ln	%l5,	%g7,	%g4
	edge16l	%g2,	%i1,	%o3
	sub	%i2,	%o5,	%i3
	movl	%xcc,	%i5,	%g3
	mulscc	%l2,	0x09F2,	%i6
	xnorcc	%o1,	%l4,	%o0
	edge8	%l6,	%g1,	%o4
	array16	%l0,	%g5,	%g6
	fpsub16s	%f18,	%f26,	%f0
	fmovsa	%xcc,	%f18,	%f22
	movgu	%icc,	%o7,	%i0
	fmovscc	%xcc,	%f11,	%f18
	movvs	%icc,	%l1,	%i4
	fmovsvs	%xcc,	%f22,	%f14
	or	%l3,	%i7,	%o2
	fzero	%f16
	addc	%l5,	%g7,	%o6
	edge32	%g4,	%g2,	%i1
	movrgez	%o3,	%i2,	%i3
	umulcc	%i5,	%g3,	%l2
	ldsb	[%l7 + 0x1E],	%i6
	movneg	%icc,	%o1,	%l4
	mulx	%o5,	%l6,	%g1
	fandnot2s	%f5,	%f25,	%f2
	siam	0x0
	mulx	%o0,	%l0,	%o4
	movg	%icc,	%g5,	%o7
	fxnor	%f10,	%f16,	%f28
	fmovrsgez	%g6,	%f0,	%f21
	stb	%i0,	[%l7 + 0x28]
	ld	[%l7 + 0x60],	%f16
	umulcc	%i4,	0x0561,	%l3
	sdivx	%i7,	0x031E,	%o2
	nop
	set	0x30, %l4
	ldub	[%l7 + %l4],	%l5
	mulscc	%l1,	0x09BE,	%g7
	umul	%o6,	%g4,	%g2
	ldx	[%l7 + 0x70],	%i1
	fcmped	%fcc3,	%f0,	%f2
	array16	%o3,	%i2,	%i5
	and	%g3,	0x1A65,	%i3
	fandnot1s	%f9,	%f12,	%f17
	movvc	%xcc,	%l2,	%i6
	xnorcc	%o1,	%o5,	%l4
	movne	%xcc,	%l6,	%g1
	restore %l0, 0x0E60, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f18,	%f4,	%f6
	subccc	%o4,	0x1217,	%g5
	mulx	%g6,	%o7,	%i4
	xnorcc	%i0,	0x12DA,	%l3
	ldsb	[%l7 + 0x5B],	%o2
	fmovdneg	%icc,	%f27,	%f29
	edge32	%l5,	%l1,	%i7
	lduw	[%l7 + 0x48],	%o6
	fpadd16s	%f8,	%f13,	%f20
	bshuffle	%f10,	%f0,	%f0
	movleu	%icc,	%g7,	%g4
	add	%g2,	0x068B,	%o3
	fmovd	%f26,	%f14
	sdivcc	%i1,	0x1D91,	%i2
	sra	%i5,	0x0A,	%g3
	fnegd	%f12,	%f16
	mova	%icc,	%i3,	%i6
	edge16n	%o1,	%l2,	%o5
	edge8n	%l4,	%l6,	%l0
	st	%f4,	[%l7 + 0x4C]
	xor	%o0,	0x0775,	%g1
	array16	%o4,	%g5,	%o7
	edge8n	%g6,	%i4,	%i0
	pdist	%f10,	%f22,	%f14
	addccc	%l3,	%l5,	%o2
	alignaddrl	%i7,	%l1,	%g7
	fpackfix	%f22,	%f15
	edge8	%g4,	%g2,	%o6
	fmovrdne	%i1,	%f20,	%f0
	fpsub16s	%f19,	%f17,	%f26
	sethi	0x1D95,	%o3
	array16	%i2,	%i5,	%i3
	movgu	%xcc,	%g3,	%o1
	ld	[%l7 + 0x7C],	%f24
	stb	%l2,	[%l7 + 0x24]
	sdivcc	%o5,	0x1308,	%l4
	addc	%i6,	0x0568,	%l6
	alignaddr	%l0,	%o0,	%g1
	movvc	%icc,	%g5,	%o4
	movrlz	%g6,	0x09D,	%o7
	sdivcc	%i0,	0x19F0,	%i4
	orcc	%l5,	0x06AF,	%l3
	movvs	%xcc,	%o2,	%i7
	subccc	%l1,	%g7,	%g2
	srlx	%g4,	%o6,	%i1
	fornot1	%f12,	%f10,	%f18
	udiv	%i2,	0x12AA,	%o3
	edge32ln	%i3,	%g3,	%o1
	fmovsne	%xcc,	%f13,	%f20
	movrgez	%i5,	%l2,	%l4
	fpadd16	%f28,	%f4,	%f18
	lduw	[%l7 + 0x6C],	%i6
	ldsw	[%l7 + 0x3C],	%o5
	edge16n	%l6,	%o0,	%l0
	fcmple32	%f30,	%f24,	%g1
	umul	%o4,	0x0413,	%g5
	mulscc	%g6,	%i0,	%i4
	fnot2	%f10,	%f8
	srl	%o7,	%l3,	%l5
	movcs	%icc,	%i7,	%o2
	orn	%g7,	0x0CBC,	%l1
	srax	%g2,	%o6,	%g4
	movrne	%i1,	%o3,	%i3
	movrne	%i2,	%o1,	%g3
	subccc	%i5,	%l4,	%i6
	nop
	set	0x10, %i4
	sth	%o5,	[%l7 + %i4]
	umul	%l6,	%l2,	%o0
	fmovrsgez	%g1,	%f28,	%f23
	sub	%o4,	%l0,	%g5
	subccc	%g6,	0x07CD,	%i4
	ldx	[%l7 + 0x60],	%o7
	edge8ln	%i0,	%l5,	%l3
	movpos	%icc,	%i7,	%o2
	ldsh	[%l7 + 0x46],	%g7
	fmovrdgz	%g2,	%f10,	%f12
	fabsd	%f10,	%f2
	and	%o6,	%l1,	%g4
	ldd	[%l7 + 0x60],	%f20
	std	%f16,	[%l7 + 0x38]
	stx	%i1,	[%l7 + 0x70]
	fandnot1	%f0,	%f0,	%f2
	xor	%i3,	%i2,	%o3
	nop
	set	0x1E, %o4
	ldsh	[%l7 + %o4],	%g3
	sth	%o1,	[%l7 + 0x16]
	mulx	%l4,	0x0FA0,	%i6
	ldsh	[%l7 + 0x16],	%o5
	andncc	%i5,	%l6,	%o0
	subc	%g1,	%l2,	%o4
	srax	%l0,	0x13,	%g6
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	fcmpgt32	%f26,	%f28,	%l5
	ldd	[%l7 + 0x08],	%l2
	alignaddrl	%i4,	%i7,	%g7
	xnorcc	%o2,	0x06BE,	%o6
	mova	%xcc,	%l1,	%g4
	subcc	%i1,	%i3,	%g2
	alignaddrl	%o3,	%i2,	%g3
	nop
	set	0x28, %i0
	std	%f10,	[%l7 + %i0]
	fmovrdne	%l4,	%f2,	%f12
	edge32	%i6,	%o1,	%o5
	stx	%i5,	[%l7 + 0x30]
	fmovrdlez	%o0,	%f2,	%f24
	ld	[%l7 + 0x7C],	%f30
	fcmps	%fcc3,	%f17,	%f10
	ldd	[%l7 + 0x58],	%f22
	fmovdl	%xcc,	%f21,	%f3
	fcmpes	%fcc2,	%f2,	%f2
	ldd	[%l7 + 0x68],	%f24
	srax	%g1,	0x06,	%l2
	fornot2s	%f12,	%f30,	%f22
	subcc	%l6,	%l0,	%g6
	movre	%o4,	0x013,	%g5
	movrgz	%i0,	0x141,	%o7
	edge32n	%l5,	%l3,	%i4
	fpack32	%f30,	%f20,	%f2
	edge32	%g7,	%i7,	%o6
	xor	%o2,	0x14C4,	%l1
	alignaddr	%i1,	%i3,	%g2
	fmovsvs	%icc,	%f29,	%f28
	edge8ln	%o3,	%i2,	%g3
	fmovscs	%xcc,	%f15,	%f25
	xorcc	%l4,	%i6,	%o1
	edge32n	%o5,	%i5,	%g4
	array16	%g1,	%o0,	%l6
	edge16n	%l0,	%l2,	%o4
	and	%g5,	%g6,	%o7
	fornot2s	%f30,	%f23,	%f24
	sdiv	%i0,	0x05CC,	%l5
	fnors	%f27,	%f27,	%f18
	addcc	%l3,	%g7,	%i7
	ldsw	[%l7 + 0x30],	%o6
	srl	%o2,	0x02,	%l1
	xnor	%i4,	%i3,	%i1
	edge16ln	%o3,	%g2,	%g3
	fcmpgt16	%f6,	%f12,	%i2
	movrgez	%i6,	%o1,	%o5
	for	%f4,	%f18,	%f0
	ldub	[%l7 + 0x42],	%i5
	orcc	%l4,	%g1,	%g4
	fmovsl	%xcc,	%f31,	%f5
	ldsw	[%l7 + 0x20],	%l6
	edge16ln	%o0,	%l2,	%o4
	mova	%xcc,	%l0,	%g6
	movg	%xcc,	%o7,	%g5
	ldsb	[%l7 + 0x0D],	%l5
	edge32ln	%l3,	%i0,	%g7
	save %o6, 0x0A8D, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc1,	%f2,	%f0
	mulx	%l1,	0x1BEC,	%i7
	move	%icc,	%i3,	%i1
	sub	%o3,	%i4,	%g2
	movvs	%icc,	%g3,	%i6
	restore %i2, %o1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o5,	0x0D6B,	%g1
	movrgez	%g4,	0x1F7,	%l6
	ldsh	[%l7 + 0x1A],	%l4
	movle	%xcc,	%o0,	%l2
	fpadd32	%f26,	%f30,	%f30
	stw	%o4,	[%l7 + 0x38]
	edge8	%g6,	%l0,	%g5
	movrgez	%l5,	%l3,	%o7
	stw	%g7,	[%l7 + 0x58]
	ldd	[%l7 + 0x28],	%o6
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	ldd	[%l7 + 0x38],	%o2
	alignaddrl	%i3,	%i7,	%i1
	std	%f22,	[%l7 + 0x68]
	addc	%i4,	0x16EB,	%g2
	fmovdpos	%icc,	%f27,	%f28
	edge16ln	%g3,	%i6,	%o3
	edge16ln	%i2,	%o1,	%i5
	ld	[%l7 + 0x58],	%f5
	fcmpeq32	%f4,	%f20,	%o5
	movrgez	%g4,	0x119,	%g1
	fcmpne32	%f24,	%f8,	%l4
	umul	%o0,	%l2,	%o4
	sra	%l6,	%g6,	%l0
	edge8	%g5,	%l3,	%o7
	std	%f20,	[%l7 + 0x38]
	ldsh	[%l7 + 0x26],	%g7
	sethi	0x0B6B,	%l5
	edge8	%o6,	%l1,	%o2
	ldx	[%l7 + 0x08],	%i0
	fcmpeq32	%f18,	%f8,	%i3
	popc	%i7,	%i4
	addc	%i1,	0x0120,	%g2
	xor	%i6,	0x03A6,	%o3
	movvs	%xcc,	%g3,	%o1
	sdivx	%i2,	0x1FC0,	%i5
	movrne	%o5,	0x00C,	%g1
	movre	%g4,	0x39B,	%o0
	st	%f3,	[%l7 + 0x18]
	srlx	%l4,	%l2,	%l6
	movpos	%icc,	%g6,	%l0
	udivx	%o4,	0x0CD0,	%l3
	fnot2	%f4,	%f18
	sir	0x1BB9
	edge32l	%o7,	%g5,	%l5
	edge32	%g7,	%o6,	%o2
	mulx	%i0,	%i3,	%i7
	fcmps	%fcc0,	%f4,	%f4
	ldx	[%l7 + 0x38],	%i4
	array16	%l1,	%g2,	%i1
	sir	0x10A8
	orn	%i6,	0x1000,	%g3
	andncc	%o1,	%i2,	%i5
	array16	%o5,	%o3,	%g4
	fcmpne32	%f22,	%f24,	%o0
	add	%l4,	%l2,	%g1
	stw	%g6,	[%l7 + 0x30]
	alignaddrl	%l6,	%l0,	%l3
	movle	%xcc,	%o7,	%g5
	alignaddrl	%o4,	%g7,	%o6
	and	%l5,	%o2,	%i0
	movrgz	%i7,	%i3,	%l1
	lduw	[%l7 + 0x7C],	%g2
	lduh	[%l7 + 0x78],	%i4
	fornot2s	%f25,	%f20,	%f9
	movleu	%icc,	%i1,	%i6
	fpadd32	%f6,	%f8,	%f12
	movne	%xcc,	%g3,	%o1
	fmovrsgez	%i5,	%f18,	%f27
	sdiv	%i2,	0x008C,	%o5
	orncc	%o3,	0x0250,	%g4
	movge	%xcc,	%o0,	%l2
	movrne	%l4,	%g1,	%g6
	movg	%xcc,	%l0,	%l6
	fnot2s	%f10,	%f22
	movge	%icc,	%l3,	%o7
	edge32l	%o4,	%g5,	%o6
	stx	%g7,	[%l7 + 0x28]
	sllx	%o2,	0x17,	%i0
	movl	%xcc,	%i7,	%i3
	umulcc	%l1,	0x13C9,	%l5
	sdivcc	%g2,	0x1257,	%i4
	fmul8sux16	%f22,	%f30,	%f10
	movgu	%icc,	%i6,	%i1
	fmovda	%icc,	%f22,	%f31
	mova	%xcc,	%o1,	%g3
	fmovsg	%xcc,	%f11,	%f21
	movcc	%xcc,	%i2,	%o5
	fmovd	%f6,	%f8
	subc	%i5,	%o3,	%o0
	fmovsne	%icc,	%f13,	%f3
	edge16ln	%g4,	%l2,	%l4
	sub	%g1,	%g6,	%l6
	sdivx	%l3,	0x1CB1,	%o7
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%l0
	udivx	%g5,	0x0AD1,	%o6
	ldub	[%l7 + 0x62],	%o4
	fzero	%f12
	movrlz	%g7,	0x0F2,	%i0
	xnor	%o2,	0x1DDA,	%i3
	stw	%i7,	[%l7 + 0x38]
	fandnot1s	%f23,	%f13,	%f4
	lduw	[%l7 + 0x08],	%l5
	fmovde	%icc,	%f1,	%f8
	smul	%g2,	%i4,	%l1
	srl	%i1,	%o1,	%i6
	movle	%xcc,	%i2,	%o5
	xnorcc	%i5,	0x1272,	%g3
	addccc	%o0,	0x0D12,	%o3
	udiv	%g4,	0x0D4A,	%l4
	edge8	%l2,	%g6,	%g1
	sir	0x0313
	umulcc	%l6,	0x0B18,	%l3
	sdiv	%o7,	0x14BB,	%l0
	fabsd	%f0,	%f12
	subcc	%o6,	0x0095,	%o4
	ldsw	[%l7 + 0x54],	%g7
	udiv	%g5,	0x17E1,	%o2
	umulcc	%i0,	%i7,	%i3
	orncc	%g2,	%i4,	%l5
	stx	%i1,	[%l7 + 0x10]
	movrgez	%o1,	%i6,	%i2
	movleu	%xcc,	%l1,	%o5
	fxors	%f3,	%f9,	%f23
	std	%f28,	[%l7 + 0x20]
	smul	%i5,	0x166A,	%o0
	movpos	%icc,	%o3,	%g4
	sll	%l4,	0x15,	%g3
	fmul8x16	%f29,	%f28,	%f4
	fmul8sux16	%f28,	%f10,	%f6
	restore %g6, 0x0DAC, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g1,	0x1C62,	%l6
	fpadd32	%f22,	%f18,	%f2
	fcmpes	%fcc3,	%f2,	%f3
	movre	%o7,	%l3,	%o6
	edge16ln	%l0,	%g7,	%o4
	sll	%o2,	%i0,	%g5
	udivcc	%i3,	0x0250,	%g2
	fmovrse	%i4,	%f7,	%f26
	movcs	%icc,	%i7,	%i1
	fpadd16	%f16,	%f6,	%f16
	sth	%l5,	[%l7 + 0x5C]
	movvs	%icc,	%i6,	%i2
	orncc	%l1,	0x13DD,	%o1
	andcc	%o5,	0x0CE9,	%i5
	edge16	%o3,	%g4,	%o0
	andn	%l4,	%g6,	%l2
	fnot1	%f28,	%f0
	ldsb	[%l7 + 0x7B],	%g3
	alignaddr	%g1,	%l6,	%o7
	movcc	%xcc,	%o6,	%l3
	alignaddrl	%l0,	%o4,	%o2
	andn	%i0,	%g5,	%i3
	ldd	[%l7 + 0x60],	%g6
	mulx	%i4,	%i7,	%i1
	nop
	set	0x58, %g3
	stx	%g2,	[%l7 + %g3]
	andn	%l5,	%i6,	%l1
	fmovrsne	%i2,	%f17,	%f23
	fmovscs	%xcc,	%f22,	%f18
	fpsub16s	%f14,	%f0,	%f3
	array8	%o1,	%o5,	%i5
	fxor	%f4,	%f12,	%f30
	fand	%f24,	%f14,	%f14
	srax	%o3,	%g4,	%l4
	fmovdgu	%xcc,	%f13,	%f8
	movneg	%icc,	%g6,	%o0
	srlx	%l2,	0x09,	%g3
	mova	%icc,	%g1,	%l6
	st	%f7,	[%l7 + 0x68]
	fmovrdgez	%o7,	%f0,	%f14
	edge16l	%l3,	%l0,	%o4
	fxors	%f23,	%f11,	%f9
	edge16ln	%o6,	%o2,	%i0
	smulcc	%i3,	0x00ED,	%g5
	fpadd32s	%f26,	%f22,	%f21
	edge8l	%g7,	%i4,	%i7
	edge32n	%g2,	%i1,	%l5
	ldd	[%l7 + 0x40],	%f28
	movvs	%icc,	%l1,	%i2
	mova	%xcc,	%i6,	%o5
	fnands	%f3,	%f9,	%f10
	subc	%i5,	%o3,	%o1
	array32	%g4,	%g6,	%l4
	st	%f20,	[%l7 + 0x54]
	movn	%icc,	%l2,	%g3
	udivcc	%g1,	0x11B6,	%o0
	fmovrdlez	%o7,	%f22,	%f2
	array8	%l3,	%l6,	%l0
	orncc	%o4,	%o6,	%o2
	sir	0x08F8
	stw	%i0,	[%l7 + 0x6C]
	movl	%xcc,	%g5,	%g7
	alignaddr	%i3,	%i7,	%i4
	fcmple16	%f14,	%f6,	%g2
	or	%l5,	%l1,	%i2
	fcmpes	%fcc1,	%f13,	%f16
	array32	%i1,	%o5,	%i6
	srax	%i5,	0x07,	%o3
	array8	%o1,	%g4,	%g6
	movrne	%l4,	0x218,	%l2
	sll	%g1,	%g3,	%o0
	popc	%l3,	%o7
	ldx	[%l7 + 0x48],	%l6
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	fmovdcc	%xcc,	%f31,	%f15
	edge8ln	%i0,	%g5,	%g7
	movcc	%icc,	%o6,	%i7
	smulcc	%i3,	0x11D5,	%i4
	stw	%l5,	[%l7 + 0x68]
	xnorcc	%l1,	%i2,	%i1
	orncc	%o5,	0x091C,	%i6
	edge16	%g2,	%i5,	%o3
	pdist	%f12,	%f30,	%f2
	st	%f23,	[%l7 + 0x2C]
	fmovsl	%icc,	%f11,	%f10
	smul	%g4,	0x1881,	%g6
	edge16l	%o1,	%l2,	%l4
	fmovsvs	%xcc,	%f31,	%f16
	fmovdpos	%xcc,	%f25,	%f9
	ldsw	[%l7 + 0x2C],	%g1
	sth	%o0,	[%l7 + 0x76]
	ldsh	[%l7 + 0x2E],	%l3
	st	%f23,	[%l7 + 0x50]
	stx	%o7,	[%l7 + 0x30]
	alignaddr	%g3,	%o4,	%l0
	addc	%o2,	0x10DA,	%i0
	smul	%l6,	%g5,	%g7
	sir	0x1EA4
	movge	%icc,	%i7,	%i3
	mulx	%o6,	0x1B43,	%i4
	udivcc	%l1,	0x0A08,	%l5
	ldd	[%l7 + 0x10],	%f30
	sdiv	%i1,	0x127D,	%o5
	umul	%i6,	0x03F6,	%g2
	ld	[%l7 + 0x3C],	%f7
	sll	%i2,	0x18,	%i5
	movre	%g4,	0x0D2,	%o3
	addccc	%g6,	%o1,	%l2
	ldd	[%l7 + 0x60],	%g0
	smulcc	%o0,	0x1B57,	%l3
	st	%f0,	[%l7 + 0x54]
	fpack32	%f30,	%f2,	%f30
	edge8l	%o7,	%l4,	%g3
	fmul8x16al	%f28,	%f23,	%f24
	andn	%o4,	0x0BF8,	%o2
	edge16n	%i0,	%l6,	%g5
	srl	%l0,	0x1F,	%g7
	fpack16	%f30,	%f30
	movrgez	%i3,	%o6,	%i4
	add	%i7,	%l1,	%i1
	srl	%l5,	0x11,	%i6
	orncc	%o5,	0x05B1,	%g2
	addcc	%i5,	0x0F17,	%i2
	mulscc	%o3,	%g4,	%o1
	movpos	%xcc,	%l2,	%g1
	lduw	[%l7 + 0x24],	%g6
	addc	%o0,	0x0961,	%o7
	sth	%l3,	[%l7 + 0x58]
	movre	%l4,	%g3,	%o4
	movne	%icc,	%o2,	%i0
	fmovsvs	%icc,	%f12,	%f5
	udivcc	%l6,	0x007C,	%l0
	movle	%icc,	%g7,	%g5
	edge16l	%i3,	%i4,	%i7
	movleu	%xcc,	%o6,	%i1
	ldd	[%l7 + 0x10],	%f28
	movle	%xcc,	%l5,	%i6
	edge32n	%l1,	%o5,	%i5
	ld	[%l7 + 0x2C],	%f27
	sdivx	%g2,	0x1E68,	%i2
	edge16ln	%o3,	%g4,	%l2
	ldsw	[%l7 + 0x28],	%o1
	sra	%g6,	0x0A,	%o0
	mulx	%o7,	0x0576,	%g1
	edge32n	%l4,	%g3,	%l3
	xnorcc	%o2,	0x113A,	%i0
	movpos	%icc,	%o4,	%l0
	movrgz	%g7,	%g5,	%l6
	stw	%i3,	[%l7 + 0x74]
	sir	0x1934
	sth	%i4,	[%l7 + 0x5E]
	fnegd	%f28,	%f22
	move	%icc,	%o6,	%i7
	movre	%l5,	0x0E0,	%i1
	movg	%xcc,	%l1,	%o5
	array8	%i6,	%g2,	%i5
	andncc	%o3,	%g4,	%i2
	movl	%icc,	%l2,	%g6
	movcc	%icc,	%o0,	%o1
	stb	%g1,	[%l7 + 0x52]
	ldub	[%l7 + 0x4C],	%o7
	fmovdne	%icc,	%f30,	%f11
	nop
	set	0x2E, %o2
	ldsb	[%l7 + %o2],	%g3
	ldd	[%l7 + 0x28],	%l4
	movneg	%xcc,	%l3,	%o2
	array32	%i0,	%o4,	%l0
	fmovdg	%xcc,	%f19,	%f16
	fmovsle	%xcc,	%f2,	%f1
	sir	0x0E73
	srl	%g5,	%g7,	%i3
	movgu	%icc,	%i4,	%o6
	save %i7, 0x10E5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l6,	%i1,	%o5
	array8	%l1,	%g2,	%i5
	udiv	%o3,	0x08B9,	%i6
	nop
	set	0x76, %i5
	sth	%g4,	[%l7 + %i5]
	edge8l	%l2,	%g6,	%o0
	sethi	0x1321,	%i2
	movleu	%xcc,	%o1,	%o7
	fnegs	%f29,	%f8
	fmovdne	%xcc,	%f19,	%f21
	fcmped	%fcc1,	%f26,	%f8
	mulscc	%g1,	0x149B,	%g3
	sllx	%l3,	0x1E,	%l4
	popc	%i0,	%o4
	add	%l0,	%o2,	%g7
	fmovdg	%xcc,	%f1,	%f7
	fmovrsne	%g5,	%f3,	%f31
	fandnot1	%f20,	%f6,	%f16
	edge32l	%i3,	%i4,	%o6
	movrlz	%i7,	0x139,	%l6
	std	%f0,	[%l7 + 0x60]
	ldd	[%l7 + 0x30],	%f0
	stb	%l5,	[%l7 + 0x18]
	movneg	%icc,	%o5,	%l1
	subcc	%i1,	0x0BB9,	%i5
	fmovd	%f2,	%f2
	movne	%icc,	%o3,	%i6
	st	%f31,	[%l7 + 0x48]
	fcmpeq16	%f20,	%f2,	%g4
	xnor	%g2,	0x0774,	%g6
	fcmpgt32	%f18,	%f22,	%o0
	fpsub32s	%f29,	%f7,	%f18
	edge8n	%l2,	%i2,	%o7
	movleu	%xcc,	%g1,	%o1
	lduw	[%l7 + 0x6C],	%g3
	edge32l	%l3,	%i0,	%o4
	add	%l0,	0x0D49,	%l4
	andn	%o2,	%g5,	%g7
	stb	%i3,	[%l7 + 0x15]
	orn	%i4,	%i7,	%l6
	fpackfix	%f2,	%f29
	fcmple32	%f6,	%f6,	%l5
	fmovrde	%o5,	%f14,	%f4
	fmovdvc	%xcc,	%f24,	%f27
	edge16ln	%o6,	%l1,	%i5
	subccc	%o3,	%i1,	%g4
	movrlez	%i6,	%g2,	%o0
	orn	%g6,	%i2,	%o7
	addc	%l2,	%g1,	%o1
	movl	%icc,	%l3,	%g3
	fpsub32s	%f2,	%f30,	%f30
	umul	%i0,	%l0,	%l4
	fpadd16s	%f17,	%f26,	%f26
	addcc	%o2,	%o4,	%g5
	subc	%g7,	0x0562,	%i3
	fmuld8sux16	%f23,	%f25,	%f28
	orn	%i7,	%i4,	%l5
	save %o5, 0x0383, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%f26
	std	%f24,	[%l7 + 0x48]
	fmovsn	%icc,	%f0,	%f6
	fornot1	%f2,	%f24,	%f16
	orcc	%l6,	%i5,	%l1
	fmovrdgz	%i1,	%f6,	%f20
	xorcc	%g4,	%i6,	%o3
	fpadd32s	%f22,	%f4,	%f27
	movrne	%g2,	0x37A,	%o0
	udivx	%g6,	0x1945,	%i2
	andn	%o7,	%g1,	%o1
	sub	%l2,	0x039B,	%g3
	fnand	%f4,	%f16,	%f2
	edge16ln	%i0,	%l0,	%l3
	for	%f16,	%f10,	%f18
	movrgz	%o2,	%o4,	%g5
	fcmped	%fcc0,	%f8,	%f12
	addc	%l4,	%g7,	%i3
	movg	%icc,	%i4,	%l5
	fcmpgt16	%f0,	%f4,	%o5
	umulcc	%i7,	%l6,	%i5
	st	%f4,	[%l7 + 0x38]
	srlx	%o6,	0x11,	%l1
	alignaddr	%g4,	%i6,	%i1
	fnand	%f18,	%f6,	%f30
	ld	[%l7 + 0x78],	%f16
	andncc	%g2,	%o0,	%o3
	mulx	%i2,	%o7,	%g1
	edge32n	%o1,	%g6,	%l2
	movle	%xcc,	%g3,	%i0
	sllx	%l3,	%l0,	%o2
	movcs	%xcc,	%o4,	%g5
	movcs	%xcc,	%g7,	%l4
	ldub	[%l7 + 0x72],	%i4
	xorcc	%i3,	0x17F5,	%o5
	mulx	%l5,	0x1853,	%l6
	alignaddrl	%i7,	%i5,	%o6
	movpos	%icc,	%l1,	%g4
	fmovrdlez	%i6,	%f2,	%f26
	smulcc	%i1,	%g2,	%o3
	fcmple32	%f12,	%f6,	%i2
	fnot1s	%f0,	%f26
	fnand	%f28,	%f8,	%f12
	restore %o0, 0x0F13, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g1,	%o1
	udivcc	%g6,	0x0324,	%g3
	andcc	%i0,	0x1AD4,	%l3
	movneg	%xcc,	%l0,	%o2
	edge32l	%l2,	%g5,	%o4
	or	%g7,	0x0FCB,	%l4
	edge32	%i3,	%i4,	%l5
	fsrc2s	%f26,	%f24
	movpos	%icc,	%l6,	%i7
	movne	%icc,	%i5,	%o5
	xnorcc	%o6,	%g4,	%l1
	movvs	%icc,	%i6,	%g2
	fmovrsgez	%i1,	%f14,	%f23
	andncc	%o3,	%i2,	%o7
	smulcc	%g1,	0x1739,	%o1
	umul	%o0,	0x12E1,	%g3
	movre	%i0,	0x10E,	%g6
	edge32l	%l0,	%l3,	%o2
	fmovdg	%icc,	%f30,	%f11
	addccc	%l2,	0x1175,	%g5
	nop
	set	0x54, %i6
	stw	%o4,	[%l7 + %i6]
	edge8ln	%g7,	%l4,	%i4
	popc	%i3,	%l5
	smul	%l6,	%i5,	%o5
	fmovdleu	%icc,	%f12,	%f9
	edge16ln	%o6,	%i7,	%l1
	xnorcc	%g4,	%i6,	%i1
	umulcc	%g2,	%i2,	%o3
	edge32n	%g1,	%o1,	%o0
	fandnot2s	%f22,	%f23,	%f13
	srax	%g3,	%i0,	%g6
	fzero	%f26
	sdivx	%l0,	0x0DE6,	%o7
	alignaddrl	%l3,	%o2,	%l2
	umulcc	%g5,	0x04E5,	%o4
	movrgz	%l4,	0x0AF,	%i4
	sdivcc	%g7,	0x18D6,	%i3
	smul	%l6,	0x1B00,	%i5
	fxnor	%f12,	%f8,	%f14
	and	%o5,	0x19F1,	%o6
	fpadd16	%f20,	%f20,	%f22
	udiv	%l5,	0x023D,	%i7
	movvs	%xcc,	%l1,	%g4
	fxor	%f0,	%f8,	%f20
	fmovsvs	%icc,	%f22,	%f16
	siam	0x6
	orncc	%i6,	%i1,	%i2
	srl	%g2,	0x0B,	%o3
	ldsh	[%l7 + 0x68],	%o1
	xnorcc	%g1,	%g3,	%o0
	smul	%g6,	%i0,	%o7
	sth	%l0,	[%l7 + 0x12]
	andncc	%l3,	%l2,	%o2
	edge16n	%g5,	%o4,	%i4
	movn	%xcc,	%l4,	%i3
	movre	%l6,	0x089,	%g7
	fmovdvc	%xcc,	%f15,	%f22
	fmovse	%xcc,	%f5,	%f7
	fmovdleu	%xcc,	%f1,	%f4
	movg	%icc,	%o5,	%i5
	movrgez	%l5,	0x32C,	%i7
	and	%l1,	0x1B5E,	%g4
	ldd	[%l7 + 0x38],	%f24
	stw	%o6,	[%l7 + 0x54]
	ldsb	[%l7 + 0x7F],	%i1
	edge8	%i6,	%i2,	%g2
	movleu	%xcc,	%o3,	%g1
	save %g3, %o0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i0,	%g6
	fxor	%f0,	%f14,	%f26
	save %o7, 0x180B, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f11,	%f10
	movleu	%xcc,	%l2,	%o2
	movneg	%xcc,	%l3,	%g5
	edge8n	%i4,	%l4,	%o4
	lduw	[%l7 + 0x78],	%i3
	addc	%g7,	0x017E,	%l6
	ldsw	[%l7 + 0x34],	%i5
	umul	%l5,	0x0657,	%o5
	sll	%i7,	0x13,	%l1
	array8	%g4,	%o6,	%i6
	sir	0x0AC0
	movrgez	%i2,	0x349,	%i1
	alignaddrl	%g2,	%o3,	%g3
	add	%o0,	0x103C,	%o1
	movcs	%icc,	%g1,	%i0
	stx	%o7,	[%l7 + 0x68]
	subc	%g6,	%l0,	%l2
	nop
	set	0x38, %o7
	std	%f28,	[%l7 + %o7]
	fabsd	%f28,	%f20
	move	%icc,	%o2,	%g5
	ldx	[%l7 + 0x70],	%i4
	movcc	%icc,	%l4,	%o4
	movrgz	%l3,	0x0AF,	%i3
	smul	%g7,	%l6,	%i5
	movle	%icc,	%o5,	%l5
	srl	%i7,	0x0D,	%g4
	srl	%o6,	0x1A,	%i6
	sub	%l1,	%i2,	%g2
	orn	%i1,	%o3,	%o0
	orn	%g3,	%g1,	%i0
	xor	%o1,	0x0551,	%o7
	movcs	%icc,	%g6,	%l2
	orcc	%l0,	0x06BD,	%o2
	lduh	[%l7 + 0x2A],	%g5
	addc	%i4,	0x062E,	%o4
	fcmpgt16	%f30,	%f28,	%l3
	fnor	%f24,	%f28,	%f20
	array8	%l4,	%g7,	%i3
	and	%l6,	%i5,	%l5
	sdiv	%i7,	0x0786,	%o5
	stb	%o6,	[%l7 + 0x44]
	edge32ln	%g4,	%l1,	%i6
	edge32l	%i2,	%i1,	%g2
	smul	%o0,	0x05B9,	%g3
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	ldd	[%l7 + 0x50],	%o6
	udivx	%g6,	0x08B5,	%l2
	movvs	%icc,	%l0,	%o1
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%o2
	udivcc	%g5,	0x0104,	%o4
	sethi	0x0113,	%i4
	fand	%f2,	%f20,	%f12
	fpadd32s	%f4,	%f12,	%f3
	save %l4, %l3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l6,	0x1CC9,	%i5
	fpadd16s	%f13,	%f1,	%f27
	fmovdcc	%xcc,	%f19,	%f23
	nop
	set	0x20, %o5
	stx	%l5,	[%l7 + %o5]
	popc	%i7,	%g7
	array16	%o6,	%g4,	%l1
	orn	%o5,	0x1755,	%i2
	movge	%icc,	%i6,	%i1
	edge32	%g2,	%g3,	%o0
	edge16l	%g1,	%o3,	%i0
	stb	%o7,	[%l7 + 0x67]
	srax	%l2,	0x06,	%g6
	andcc	%l0,	%o2,	%g5
	edge16ln	%o1,	%o4,	%l4
	save %l3, 0x0729, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1E],	%l6
	xnor	%i5,	0x08C1,	%i3
	fmovsa	%xcc,	%f5,	%f25
	srl	%l5,	%i7,	%g7
	fmovsneg	%icc,	%f20,	%f10
	udivx	%o6,	0x1D25,	%l1
	addcc	%o5,	%i2,	%i6
	sra	%i1,	%g4,	%g2
	movcs	%icc,	%o0,	%g3
	movn	%icc,	%o3,	%i0
	andcc	%o7,	0x1A97,	%l2
	fsrc1	%f22,	%f20
	fmuld8ulx16	%f1,	%f12,	%f10
	sra	%g6,	%g1,	%l0
	andncc	%g5,	%o1,	%o2
	srl	%l4,	%o4,	%l3
	orn	%i4,	0x1E45,	%l6
	and	%i3,	0x1D3D,	%l5
	orn	%i5,	0x16BA,	%g7
	popc	%o6,	%i7
	fmul8x16al	%f31,	%f16,	%f4
	fmovse	%xcc,	%f6,	%f19
	movg	%icc,	%o5,	%i2
	edge16	%l1,	%i6,	%g4
	ldd	[%l7 + 0x10],	%g2
	srax	%i1,	%g3,	%o0
	movle	%icc,	%i0,	%o7
	addccc	%l2,	%o3,	%g1
	movrlz	%l0,	0x311,	%g6
	addccc	%g5,	0x0AA1,	%o2
	alignaddr	%o1,	%o4,	%l3
	andn	%i4,	%l4,	%i3
	movrgz	%l5,	%i5,	%l6
	subc	%g7,	0x0BA6,	%i7
	movrgez	%o5,	%i2,	%o6
	fnor	%f24,	%f4,	%f26
	nop
	set	0x48, %g7
	ldx	[%l7 + %g7],	%l1
	fnot1s	%f0,	%f17
	std	%f0,	[%l7 + 0x50]
	orcc	%i6,	%g4,	%i1
	nop
	set	0x37, %i1
	stb	%g2,	[%l7 + %i1]
	movrlez	%g3,	0x25C,	%o0
	fmul8x16	%f20,	%f2,	%f30
	movcs	%xcc,	%o7,	%i0
	pdist	%f20,	%f24,	%f20
	sdiv	%l2,	0x0752,	%o3
	stb	%l0,	[%l7 + 0x14]
	movge	%icc,	%g1,	%g5
	sethi	0x0B76,	%g6
	movvs	%xcc,	%o1,	%o4
	sdivx	%l3,	0x0842,	%i4
	move	%xcc,	%o2,	%l4
	srl	%i3,	0x08,	%l5
	pdist	%f8,	%f26,	%f12
	movneg	%icc,	%i5,	%g7
	fmovde	%xcc,	%f30,	%f14
	sra	%l6,	%o5,	%i7
	xnor	%o6,	0x0D5B,	%l1
	lduh	[%l7 + 0x6E],	%i2
	sll	%g4,	%i6,	%g2
	siam	0x4
	sdiv	%i1,	0x1124,	%o0
	or	%o7,	0x0730,	%g3
	udivcc	%i0,	0x047B,	%l2
	std	%f4,	[%l7 + 0x60]
	ldsh	[%l7 + 0x3C],	%l0
	smul	%g1,	0x0E46,	%g5
	fxors	%f25,	%f21,	%f28
	movrgez	%o3,	0x258,	%o1
	fmovrslez	%o4,	%f8,	%f31
	fcmpne32	%f20,	%f6,	%l3
	ldx	[%l7 + 0x78],	%g6
	ldub	[%l7 + 0x3F],	%i4
	fmovdn	%xcc,	%f30,	%f2
	fmovse	%icc,	%f4,	%f4
	edge32ln	%o2,	%l4,	%i3
	movneg	%xcc,	%i5,	%g7
	movrgez	%l5,	%l6,	%o5
	edge8n	%i7,	%o6,	%l1
	fcmped	%fcc1,	%f18,	%f2
	lduw	[%l7 + 0x40],	%i2
	edge16l	%i6,	%g2,	%g4
	udiv	%o0,	0x019E,	%i1
	fmovsa	%icc,	%f9,	%f21
	andn	%o7,	%g3,	%i0
	array32	%l0,	%l2,	%g1
	movrlez	%g5,	%o3,	%o4
	stw	%o1,	[%l7 + 0x20]
	movrlz	%g6,	%l3,	%o2
	andn	%i4,	0x1915,	%i3
	orncc	%i5,	%g7,	%l5
	alignaddrl	%l6,	%o5,	%i7
	subcc	%l4,	0x0276,	%l1
	edge32l	%o6,	%i6,	%i2
	addc	%g4,	0x0028,	%o0
	fpadd32	%f6,	%f24,	%f30
	alignaddr	%i1,	%o7,	%g2
	fpsub16s	%f20,	%f20,	%f9
	movcs	%xcc,	%i0,	%l0
	stb	%l2,	[%l7 + 0x2B]
	sll	%g3,	%g5,	%o3
	sra	%o4,	%g1,	%o1
	sub	%l3,	%g6,	%o2
	move	%icc,	%i4,	%i3
	sdiv	%g7,	0x13C7,	%i5
	fmovdne	%xcc,	%f7,	%f25
	movvs	%xcc,	%l5,	%o5
	nop
	set	0x54, %g6
	ldsw	[%l7 + %g6],	%i7
	edge16n	%l6,	%l4,	%l1
	xnorcc	%o6,	%i2,	%g4
	fcmpeq16	%f0,	%f18,	%i6
	movrlez	%i1,	%o7,	%g2
	ldd	[%l7 + 0x20],	%o0
	edge16n	%l0,	%i0,	%g3
	fcmpgt32	%f30,	%f18,	%l2
	movgu	%xcc,	%g5,	%o4
	movrlez	%g1,	0x3B8,	%o1
	movne	%icc,	%l3,	%g6
	udiv	%o2,	0x0D2E,	%i4
	save %i3, 0x118F, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i5,	0x0F39,	%l5
	addcc	%o5,	%o3,	%i7
	movn	%icc,	%l6,	%l1
	ldd	[%l7 + 0x68],	%f4
	fsrc2	%f8,	%f12
	fmovdgu	%xcc,	%f4,	%f6
	fcmple32	%f28,	%f4,	%o6
	alignaddr	%l4,	%g4,	%i6
	array32	%i2,	%i1,	%o7
	stb	%o0,	[%l7 + 0x4F]
	udivx	%g2,	0x157F,	%l0
	sir	0x1E81
	std	%f28,	[%l7 + 0x48]
	andncc	%i0,	%l2,	%g3
	st	%f13,	[%l7 + 0x78]
	movrgz	%g5,	%o4,	%o1
	movvc	%xcc,	%g1,	%g6
	sth	%o2,	[%l7 + 0x5C]
	fmovdneg	%icc,	%f19,	%f5
	movn	%xcc,	%i4,	%l3
	add	%i3,	%i5,	%l5
	and	%g7,	0x0CD4,	%o5
	fcmpgt16	%f12,	%f10,	%i7
	fmovscc	%xcc,	%f11,	%f24
	move	%icc,	%o3,	%l6
	edge8n	%l1,	%l4,	%o6
	srl	%g4,	%i2,	%i1
	fsrc1	%f6,	%f14
	edge8n	%o7,	%i6,	%g2
	sll	%l0,	%o0,	%i0
	st	%f22,	[%l7 + 0x68]
	for	%f28,	%f8,	%f4
	udiv	%l2,	0x0F2D,	%g3
	fones	%f14
	sra	%g5,	0x08,	%o1
	nop
	set	0x18, %g5
	ldsb	[%l7 + %g5],	%g1
	fnot2s	%f28,	%f16
	movvc	%icc,	%o4,	%g6
	movrgez	%o2,	0x12F,	%l3
	movl	%xcc,	%i4,	%i3
	fmovrsgz	%l5,	%f21,	%f19
	addcc	%g7,	%i5,	%i7
	fpadd32	%f30,	%f4,	%f6
	smul	%o5,	0x19AB,	%o3
	fmovsvs	%icc,	%f3,	%f27
	st	%f9,	[%l7 + 0x28]
	add	%l1,	%l6,	%o6
	nop
	set	0x58, %i2
	std	%f24,	[%l7 + %i2]
	andn	%l4,	%i2,	%i1
	xnor	%g4,	%i6,	%g2
	umul	%o7,	%l0,	%i0
	andn	%l2,	0x0B68,	%o0
	move	%icc,	%g5,	%o1
	edge16n	%g3,	%g1,	%o4
	sth	%g6,	[%l7 + 0x46]
	st	%f21,	[%l7 + 0x24]
	xor	%o2,	0x03FB,	%l3
	movrlz	%i3,	%l5,	%i4
	mova	%icc,	%g7,	%i7
	move	%icc,	%o5,	%o3
	fmovdge	%xcc,	%f3,	%f1
	st	%f16,	[%l7 + 0x60]
	ldd	[%l7 + 0x68],	%l0
	stw	%i5,	[%l7 + 0x30]
	stx	%o6,	[%l7 + 0x58]
	array8	%l4,	%l6,	%i2
	fmovdcc	%xcc,	%f10,	%f16
	fmul8x16	%f1,	%f6,	%f24
	edge16n	%g4,	%i6,	%i1
	fmovdg	%icc,	%f3,	%f28
	restore %g2, 0x0EE3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l0, %i0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x34],	%o0
	sll	%g5,	0x0C,	%o1
	stx	%g3,	[%l7 + 0x40]
	fmovsgu	%xcc,	%f20,	%f25
	movre	%g1,	%o4,	%o2
	smul	%g6,	0x17A2,	%l3
	movge	%icc,	%i3,	%l5
	fnot2s	%f0,	%f26
	edge32	%g7,	%i4,	%i7
	ldd	[%l7 + 0x50],	%f18
	orcc	%o5,	0x08CD,	%o3
	ld	[%l7 + 0x60],	%f15
	fabsd	%f18,	%f24
	sra	%l1,	%o6,	%i5
	and	%l6,	%i2,	%g4
	fsrc2	%f12,	%f0
	fmovsvc	%xcc,	%f19,	%f31
	udivx	%l4,	0x0A1A,	%i6
	fcmple32	%f22,	%f10,	%g2
	array8	%o7,	%l0,	%i0
	fmul8x16al	%f31,	%f16,	%f2
	sir	0x0A53
	lduh	[%l7 + 0x1A],	%l2
	ldsw	[%l7 + 0x54],	%o0
	xor	%i1,	%g5,	%g3
	movpos	%icc,	%g1,	%o1
	fmovdcs	%xcc,	%f7,	%f31
	addccc	%o2,	%g6,	%o4
	stw	%i3,	[%l7 + 0x38]
	fmovsl	%icc,	%f28,	%f21
	nop
	set	0x30, %o0
	stx	%l5,	[%l7 + %o0]
	udivcc	%l3,	0x0197,	%g7
	orncc	%i7,	%o5,	%i4
	alignaddr	%l1,	%o3,	%o6
	stb	%l6,	[%l7 + 0x50]
	movrlz	%i2,	0x321,	%i5
	sub	%l4,	%i6,	%g2
	mova	%xcc,	%g4,	%l0
	and	%i0,	0x0D81,	%o7
	andcc	%l2,	%i1,	%o0
	edge8ln	%g5,	%g3,	%o1
	fcmpne32	%f4,	%f24,	%g1
	fcmped	%fcc1,	%f6,	%f20
	fmovsl	%xcc,	%f7,	%f7
	addc	%o2,	%o4,	%g6
	movvc	%icc,	%l5,	%i3
	subccc	%l3,	%i7,	%o5
	srlx	%g7,	0x0A,	%l1
	movrgz	%o3,	0x0D4,	%i4
	addcc	%o6,	0x104C,	%l6
	umulcc	%i2,	%i5,	%l4
	edge8n	%i6,	%g4,	%l0
	array16	%i0,	%o7,	%g2
	fmovdcc	%xcc,	%f22,	%f13
	movvc	%icc,	%l2,	%i1
	addcc	%g5,	0x126D,	%o0
	movcc	%xcc,	%g3,	%g1
	srax	%o1,	%o2,	%o4
	fors	%f6,	%f18,	%f27
	fandnot1	%f24,	%f16,	%f6
	fzeros	%f20
	movgu	%icc,	%g6,	%l5
	xnor	%i3,	%l3,	%i7
	array32	%g7,	%o5,	%l1
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	umul	%o3,	0x0DDD,	%i2
	sllx	%l6,	%i5,	%l4
	stx	%i6,	[%l7 + 0x28]
	umulcc	%g4,	%i0,	%o7
	movg	%xcc,	%l0,	%l2
	movvs	%xcc,	%g2,	%g5
	ldsw	[%l7 + 0x24],	%i1
	movvs	%icc,	%g3,	%o0
	umulcc	%o1,	%g1,	%o4
	movpos	%icc,	%g6,	%o2
	fnot2	%f22,	%f10
	ldsh	[%l7 + 0x4E],	%l5
	ldsb	[%l7 + 0x49],	%i3
	fcmpd	%fcc1,	%f6,	%f14
	movre	%i7,	%l3,	%o5
	array16	%l1,	%g7,	%o6
	save %i4, %o3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x70],	%l6
	movgu	%xcc,	%l4,	%i6
	sllx	%g4,	0x1F,	%i5
	ldub	[%l7 + 0x1D],	%i0
	fmovspos	%xcc,	%f26,	%f26
	movne	%icc,	%o7,	%l0
	movrlez	%g2,	%g5,	%i1
	add	%g3,	%l2,	%o0
	movle	%icc,	%g1,	%o1
	fmovrsgz	%g6,	%f7,	%f19
	sth	%o2,	[%l7 + 0x36]
	sethi	0x01F3,	%l5
	edge8l	%o4,	%i7,	%i3
	umulcc	%o5,	0x0519,	%l1
	fnot2s	%f23,	%f30
	fpadd16	%f30,	%f22,	%f20
	ldd	[%l7 + 0x10],	%f28
	array16	%g7,	%l3,	%o6
	movre	%o3,	%i2,	%l6
	smulcc	%i4,	0x1166,	%i6
	movl	%icc,	%g4,	%l4
	addccc	%i5,	0x0EFF,	%i0
	sdivcc	%l0,	0x0063,	%g2
	movrgez	%g5,	0x13D,	%i1
	subccc	%g3,	0x0B5B,	%o7
	ldsw	[%l7 + 0x48],	%l2
	array16	%o0,	%o1,	%g6
	edge32l	%o2,	%g1,	%o4
	sethi	0x1015,	%i7
	edge8n	%i3,	%l5,	%l1
	stx	%g7,	[%l7 + 0x08]
	edge32ln	%l3,	%o5,	%o6
	edge16l	%i2,	%o3,	%i4
	smulcc	%i6,	%l6,	%g4
	xnor	%i5,	%l4,	%l0
	movrne	%g2,	%g5,	%i0
	fzero	%f22
	sra	%i1,	0x05,	%o7
	edge32	%l2,	%o0,	%g3
	xorcc	%o1,	0x116C,	%o2
	restore %g1, %g6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f12,	%f4,	%f0
	movn	%icc,	%o4,	%i3
	fnegd	%f28,	%f12
	edge16	%l5,	%g7,	%l1
	movrlez	%o5,	0x1FF,	%l3
	fabsd	%f18,	%f22
	udiv	%i2,	0x0C95,	%o6
	srlx	%i4,	0x12,	%o3
	subccc	%i6,	0x1BD0,	%g4
	movcc	%icc,	%l6,	%l4
	movrlz	%l0,	%g2,	%i5
	umulcc	%g5,	%i0,	%i1
	andcc	%l2,	%o0,	%o7
	fmovscc	%xcc,	%f18,	%f16
	fmovsge	%icc,	%f22,	%f16
	xnor	%g3,	%o2,	%o1
	udiv	%g1,	0x1127,	%i7
	sllx	%g6,	0x06,	%i3
	movcs	%xcc,	%o4,	%g7
	fmovrdgez	%l5,	%f24,	%f10
	srax	%o5,	0x14,	%l1
	move	%icc,	%i2,	%o6
	xorcc	%l3,	%i4,	%o3
	lduw	[%l7 + 0x34],	%i6
	nop
	set	0x30, %i7
	stw	%l6,	[%l7 + %i7]
	fors	%f9,	%f28,	%f15
	or	%g4,	0x0CB9,	%l4
	std	%f18,	[%l7 + 0x20]
	movpos	%xcc,	%l0,	%g2
	fmovsleu	%icc,	%f29,	%f17
	xorcc	%i5,	0x1A7E,	%g5
	pdist	%f20,	%f20,	%f22
	fnot2s	%f20,	%f30
	movrne	%i1,	%l2,	%o0
	andcc	%i0,	0x1C20,	%g3
	addccc	%o2,	0x0B3E,	%o1
	edge8	%o7,	%i7,	%g6
	movrlz	%g1,	0x1E4,	%i3
	edge8ln	%o4,	%l5,	%o5
	addcc	%l1,	%i2,	%o6
	save %l3, 0x0A72, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f27,	%f0,	%f21
	sra	%o3,	%i6,	%g7
	fpadd16s	%f24,	%f4,	%f8
	lduh	[%l7 + 0x1E],	%l6
	move	%xcc,	%l4,	%l0
	movvs	%xcc,	%g2,	%i5
	xor	%g5,	%i1,	%l2
	alignaddr	%g4,	%o0,	%g3
	movvs	%icc,	%o2,	%i0
	fornot1	%f2,	%f30,	%f26
	movrgz	%o7,	0x221,	%o1
	edge8	%g6,	%g1,	%i3
	nop
	set	0x76, %l3
	ldsh	[%l7 + %l3],	%o4
	fmovrsgz	%i7,	%f10,	%f25
	std	%f12,	[%l7 + 0x18]
	andncc	%l5,	%o5,	%l1
	sllx	%i2,	0x01,	%l3
	ldsh	[%l7 + 0x32],	%i4
	movrgz	%o6,	%i6,	%g7
	umul	%o3,	%l4,	%l6
	andn	%g2,	0x1607,	%l0
	popc	0x0E5E,	%g5
	xorcc	%i5,	%i1,	%g4
	mulx	%o0,	%l2,	%o2
	fnot1	%f2,	%f28
	movvs	%xcc,	%g3,	%o7
	sll	%o1,	%i0,	%g1
	movge	%xcc,	%g6,	%i3
	addccc	%o4,	%l5,	%o5
	movrlz	%l1,	%i7,	%l3
	movrne	%i4,	%o6,	%i6
	xnorcc	%g7,	%o3,	%i2
	movgu	%icc,	%l6,	%g2
	ld	[%l7 + 0x30],	%f7
	fpadd32s	%f9,	%f31,	%f14
	movn	%xcc,	%l4,	%g5
	array16	%l0,	%i1,	%g4
	add	%i5,	%l2,	%o2
	xorcc	%g3,	%o7,	%o1
	orn	%o0,	%i0,	%g1
	sdivx	%g6,	0x196B,	%i3
	sdivcc	%o4,	0x163A,	%o5
	movl	%icc,	%l1,	%l5
	movrgez	%i7,	%l3,	%o6
	movn	%xcc,	%i4,	%g7
	fnand	%f4,	%f20,	%f6
	stb	%i6,	[%l7 + 0x70]
	array32	%i2,	%l6,	%g2
	movrlz	%l4,	0x276,	%g5
	movrlz	%o3,	%i1,	%g4
	fmovsleu	%xcc,	%f3,	%f18
	movrne	%l0,	%i5,	%o2
	srlx	%g3,	0x0A,	%l2
	mulscc	%o1,	0x1F98,	%o0
	edge16l	%i0,	%g1,	%g6
	fmovdpos	%xcc,	%f28,	%f28
	movneg	%xcc,	%o7,	%o4
	edge8l	%i3,	%o5,	%l5
	fmovrdlez	%l1,	%f16,	%f30
	ldub	[%l7 + 0x7B],	%l3
	edge16l	%i7,	%o6,	%g7
	addcc	%i4,	0x1830,	%i6
	fandnot2s	%f6,	%f14,	%f14
	fxnors	%f14,	%f23,	%f22
	fsrc2	%f8,	%f16
	movrgez	%l6,	%g2,	%i2
	fnot2s	%f16,	%f19
	andncc	%g5,	%o3,	%i1
	movle	%xcc,	%g4,	%l0
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	movcs	%icc,	%g3,	%l2
	addccc	%o1,	%o2,	%o0
	movne	%icc,	%g1,	%g6
	edge16ln	%o7,	%i0,	%i3
	addcc	%o4,	%o5,	%l5
	sll	%l1,	%i7,	%o6
	movvs	%xcc,	%g7,	%i4
	sdivcc	%i6,	0x09D7,	%l3
	andncc	%l6,	%i2,	%g2
	edge16ln	%o3,	%g5,	%i1
	fabss	%f14,	%f9
	popc	0x19F6,	%g4
	move	%xcc,	%l0,	%i5
	or	%g3,	0x0992,	%l2
	fmovdleu	%icc,	%f28,	%f22
	fnand	%f28,	%f20,	%f28
	fpack16	%f2,	%f27
	sdivx	%o1,	0x1A02,	%o2
	fornot2s	%f11,	%f19,	%f14
	ldx	[%l7 + 0x10],	%o0
	ldd	[%l7 + 0x30],	%f10
	addcc	%g1,	%l4,	%o7
	udiv	%g6,	0x1625,	%i0
	addcc	%i3,	0x0DC9,	%o4
	fsrc1	%f22,	%f20
	save %o5, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f2,	%f28
	fmovsvc	%xcc,	%f11,	%f18
	movcs	%icc,	%i7,	%g7
	srax	%i4,	%i6,	%o6
	andn	%l3,	%l6,	%i2
	orncc	%g2,	0x1BEF,	%g5
	addc	%o3,	0x1CC7,	%i1
	smul	%l0,	%g4,	%g3
	addccc	%i5,	0x10E6,	%o1
	fexpand	%f5,	%f2
	move	%xcc,	%o2,	%o0
	movcs	%icc,	%g1,	%l4
	nop
	set	0x08, %l5
	std	%f12,	[%l7 + %l5]
	fmovsvs	%xcc,	%f27,	%f2
	array16	%l2,	%g6,	%o7
	siam	0x2
	edge32l	%i0,	%o4,	%i3
	fsrc1	%f28,	%f12
	array32	%o5,	%l5,	%l1
	udivx	%g7,	0x0CD4,	%i7
	srl	%i6,	0x1B,	%i4
	edge16n	%l3,	%l6,	%o6
	ldx	[%l7 + 0x10],	%g2
	lduw	[%l7 + 0x4C],	%g5
	sdivx	%i2,	0x1F6B,	%o3
	fsrc2s	%f10,	%f10
	fmovsle	%icc,	%f3,	%f20
	subccc	%l0,	%i1,	%g4
	movrlez	%g3,	%o1,	%o2
	movne	%icc,	%o0,	%i5
	alignaddr	%l4,	%g1,	%l2
	ldd	[%l7 + 0x58],	%o6
	fmovrdne	%i0,	%f6,	%f14
	fmovdge	%icc,	%f1,	%f8
	xorcc	%g6,	0x0D27,	%i3
	or	%o5,	0x0816,	%o4
	stw	%l5,	[%l7 + 0x48]
	ldx	[%l7 + 0x38],	%l1
	st	%f8,	[%l7 + 0x2C]
	movl	%xcc,	%g7,	%i6
	movle	%xcc,	%i4,	%l3
	fmovsl	%xcc,	%f28,	%f7
	fpadd16s	%f22,	%f13,	%f6
	ldsw	[%l7 + 0x60],	%l6
	fnot2	%f10,	%f16
	orn	%o6,	%i7,	%g5
	addcc	%i2,	%o3,	%l0
	fcmple32	%f8,	%f2,	%i1
	fmovrslez	%g2,	%f17,	%f3
	sth	%g4,	[%l7 + 0x72]
	movne	%xcc,	%o1,	%o2
	movvc	%xcc,	%g3,	%i5
	movneg	%icc,	%o0,	%g1
	std	%f18,	[%l7 + 0x60]
	sdivcc	%l2,	0x1D45,	%l4
	mulscc	%o7,	%i0,	%i3
	ldsw	[%l7 + 0x0C],	%g6
	fnegs	%f2,	%f17
	addc	%o5,	0x118F,	%l5
	udiv	%o4,	0x1BCA,	%l1
	orncc	%i6,	%g7,	%i4
	movge	%icc,	%l6,	%o6
	andncc	%i7,	%l3,	%i2
	movvc	%xcc,	%o3,	%g5
	edge32	%l0,	%i1,	%g2
	srax	%o1,	0x0F,	%o2
	sdivx	%g4,	0x05EA,	%g3
	fexpand	%f13,	%f6
	edge16n	%i5,	%g1,	%o0
	fpsub16	%f30,	%f14,	%f2
	movvs	%xcc,	%l2,	%l4
	stb	%o7,	[%l7 + 0x73]
	xorcc	%i3,	0x1369,	%i0
	fmovsne	%icc,	%f29,	%f26
	fnot1	%f30,	%f16
	udivcc	%g6,	0x1B25,	%l5
	fmovrse	%o5,	%f30,	%f22
	movne	%icc,	%l1,	%o4
	movrlz	%i6,	0x0C3,	%i4
	ldd	[%l7 + 0x48],	%i6
	array32	%o6,	%g7,	%i7
	movg	%xcc,	%l3,	%o3
	fpsub32	%f28,	%f22,	%f26
	lduw	[%l7 + 0x68],	%g5
	sethi	0x1EA7,	%i2
	array32	%l0,	%g2,	%o1
	udivx	%o2,	0x0D9A,	%i1
	edge16l	%g3,	%i5,	%g4
	ld	[%l7 + 0x48],	%f12
	sub	%o0,	%l2,	%l4
	movgu	%icc,	%g1,	%i3
	array8	%o7,	%g6,	%i0
	movrgez	%l5,	0x339,	%l1
	fmovdvs	%icc,	%f15,	%f22
	stx	%o5,	[%l7 + 0x68]
	and	%i6,	0x189F,	%o4
	udivx	%i4,	0x0342,	%o6
	nop
	set	0x47, %o6
	stb	%l6,	[%l7 + %o6]
	edge16n	%i7,	%g7,	%o3
	popc	%l3,	%g5
	ldd	[%l7 + 0x68],	%f12
	xor	%l0,	%g2,	%o1
	sth	%o2,	[%l7 + 0x32]
	st	%f8,	[%l7 + 0x3C]
	edge32ln	%i2,	%g3,	%i1
	array32	%i5,	%g4,	%l2
	edge8	%l4,	%g1,	%o0
	addccc	%i3,	0x1099,	%g6
	edge32	%i0,	%o7,	%l1
	movgu	%xcc,	%l5,	%o5
	fcmpeq16	%f30,	%f14,	%i6
	movleu	%icc,	%o4,	%i4
	sllx	%l6,	0x12,	%o6
	subccc	%g7,	%i7,	%o3
	edge8	%g5,	%l0,	%g2
	orncc	%o1,	0x07F2,	%l3
	lduh	[%l7 + 0x14],	%i2
	xor	%g3,	0x0B76,	%o2
	fmovscc	%xcc,	%f18,	%f29
	orn	%i5,	0x19AE,	%g4
	edge16	%i1,	%l2,	%g1
	umulcc	%l4,	0x174B,	%o0
	ldsb	[%l7 + 0x1D],	%g6
	edge16n	%i3,	%o7,	%l1
	ldsw	[%l7 + 0x18],	%l5
	add	%o5,	0x011D,	%i6
	ldsb	[%l7 + 0x55],	%o4
	subc	%i4,	%i0,	%o6
	restore %g7, %i7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g5,	0x2BB,	%l6
	stw	%l0,	[%l7 + 0x28]
	ldd	[%l7 + 0x08],	%o0
	movre	%l3,	0x28B,	%g2
	xorcc	%g3,	0x0660,	%o2
	ldsb	[%l7 + 0x75],	%i5
	movl	%xcc,	%i2,	%g4
	ldx	[%l7 + 0x78],	%i1
	ldd	[%l7 + 0x48],	%l2
	movvc	%icc,	%l4,	%g1
	lduw	[%l7 + 0x2C],	%g6
	edge32l	%o0,	%i3,	%o7
	movrlz	%l1,	%o5,	%i6
	xor	%l5,	0x1323,	%i4
	orncc	%i0,	0x1A82,	%o4
	andncc	%g7,	%o6,	%i7
	andcc	%o3,	0x0631,	%g5
	mulx	%l0,	0x1F9E,	%l6
	alignaddrl	%l3,	%o1,	%g2
	edge16	%o2,	%g3,	%i2
	udivx	%i5,	0x1DC8,	%g4
	sth	%i1,	[%l7 + 0x34]
	fmovsleu	%xcc,	%f16,	%f1
	fmovd	%f20,	%f22
	edge8l	%l2,	%g1,	%l4
	addccc	%g6,	%o0,	%i3
	or	%o7,	0x1CFC,	%l1
	array16	%o5,	%l5,	%i6
	movrlez	%i4,	%o4,	%g7
	fmovsle	%xcc,	%f28,	%f29
	ldsb	[%l7 + 0x33],	%o6
	stw	%i7,	[%l7 + 0x24]
	edge8	%o3,	%g5,	%l0
	edge32l	%l6,	%l3,	%i0
	fmovsne	%xcc,	%f18,	%f10
	sth	%g2,	[%l7 + 0x6A]
	movrgez	%o1,	0x016,	%o2
	popc	%i2,	%g3
	edge8	%i5,	%i1,	%g4
	edge8ln	%g1,	%l2,	%l4
	subccc	%o0,	%g6,	%i3
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	sub	%l1,	0x0133,	%l5
	movre	%i4,	0x3DF,	%o4
	movn	%xcc,	%g7,	%o6
	xorcc	%i6,	%o3,	%i7
	sdivx	%l0,	0x1633,	%g5
	fmovscs	%icc,	%f8,	%f2
	ldd	[%l7 + 0x10],	%i6
	movpos	%xcc,	%l3,	%i0
	addccc	%g2,	0x0D40,	%o1
	fmovdgu	%xcc,	%f4,	%f24
	orncc	%o2,	0x0ABF,	%i2
	movleu	%icc,	%g3,	%i5
	alignaddr	%g4,	%g1,	%i1
	mulx	%l2,	0x0E88,	%l4
	array32	%g6,	%o0,	%o7
	restore %i3, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l5,	%i4
	ld	[%l7 + 0x14],	%f6
	ldsb	[%l7 + 0x2A],	%g7
	sdivx	%o6,	0x1ED3,	%i6
	array16	%o3,	%o4,	%i7
	orn	%l0,	%g5,	%l3
	movre	%i0,	0x079,	%l6
	fmovdpos	%xcc,	%f1,	%f16
	andcc	%o1,	%g2,	%i2
	ldsw	[%l7 + 0x3C],	%g3
	xnorcc	%i5,	0x13BC,	%g4
	edge16l	%o2,	%i1,	%l2
	movn	%icc,	%g1,	%g6
	fpsub16s	%f25,	%f23,	%f7
	movge	%xcc,	%o0,	%o7
	addccc	%i3,	%o5,	%l4
	ld	[%l7 + 0x74],	%f23
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	lduw	[%l7 + 0x5C],	%l1
	ldsh	[%l7 + 0x0E],	%o6
	array16	%g7,	%i6,	%o4
	movvc	%xcc,	%i7,	%o3
	ldsh	[%l7 + 0x14],	%l0
	stb	%l3,	[%l7 + 0x63]
	stw	%i0,	[%l7 + 0x5C]
	fmovrse	%l6,	%f12,	%f13
	srlx	%o1,	%g5,	%i2
	edge16ln	%g3,	%i5,	%g4
	alignaddr	%o2,	%i1,	%l2
	and	%g2,	%g1,	%g6
	sll	%o0,	%i3,	%o7
	addccc	%o5,	0x195F,	%l5
	edge32	%l4,	%l1,	%o6
	andn	%g7,	%i4,	%i6
	stw	%i7,	[%l7 + 0x14]
	smul	%o3,	0x057D,	%l0
	movre	%l3,	%i0,	%l6
	edge8ln	%o1,	%o4,	%g5
	srlx	%i2,	0x01,	%i5
	movneg	%xcc,	%g3,	%o2
	movrne	%g4,	%l2,	%i1
	movrgz	%g2,	0x25F,	%g6
	nop
	set	0x68, %l0
	lduw	[%l7 + %l0],	%g1
	movcc	%icc,	%o0,	%i3
	addc	%o5,	0x0DFD,	%o7
	fexpand	%f20,	%f30
	fexpand	%f2,	%f8
	xnor	%l4,	0x102D,	%l1
	stx	%o6,	[%l7 + 0x58]
	andncc	%l5,	%i4,	%g7
	movle	%icc,	%i7,	%i6
	sdivx	%l0,	0x06A3,	%o3
	sdivx	%i0,	0x12BC,	%l6
	orn	%o1,	0x074F,	%o4
	array32	%l3,	%i2,	%g5
	fcmpes	%fcc1,	%f5,	%f27
	movrlez	%g3,	%o2,	%i5
	subc	%l2,	0x1ECB,	%i1
	umul	%g4,	%g2,	%g6
	array32	%o0,	%g1,	%o5
	fmul8ulx16	%f6,	%f30,	%f30
	fnot1	%f4,	%f10
	andcc	%i3,	0x07B9,	%o7
	move	%icc,	%l4,	%l1
	fmovrsgz	%l5,	%f12,	%f8
	udivcc	%o6,	0x0A4A,	%i4
	movne	%icc,	%g7,	%i7
	umul	%i6,	0x076C,	%o3
	stb	%i0,	[%l7 + 0x0C]
	smul	%l0,	0x1E54,	%o1
	movcs	%icc,	%o4,	%l3
	sdiv	%l6,	0x1EF8,	%i2
	movg	%icc,	%g3,	%g5
	umulcc	%i5,	0x193C,	%l2
	fmul8x16al	%f2,	%f24,	%f20
	fands	%f11,	%f2,	%f0
	fpmerge	%f1,	%f11,	%f10
	fxor	%f30,	%f2,	%f18
	fnand	%f28,	%f20,	%f12
	nop
	set	0x54, %o1
	lduw	[%l7 + %o1],	%o2
	fpmerge	%f26,	%f6,	%f22
	andn	%g4,	%g2,	%g6
	fpmerge	%f25,	%f31,	%f18
	movrgz	%o0,	0x22C,	%g1
	sub	%o5,	%i3,	%i1
	ldx	[%l7 + 0x20],	%o7
	udivx	%l4,	0x081D,	%l1
	lduh	[%l7 + 0x16],	%l5
	array16	%o6,	%g7,	%i7
	ldsw	[%l7 + 0x50],	%i6
	srax	%o3,	0x1C,	%i0
	sethi	0x1E42,	%i4
	alignaddr	%o1,	%o4,	%l0
	edge16l	%l3,	%i2,	%l6
	edge8l	%g5,	%i5,	%l2
	umulcc	%g3,	0x0753,	%o2
	smulcc	%g4,	%g6,	%g2
	subc	%g1,	0x1471,	%o0
	addccc	%o5,	%i1,	%o7
	orn	%l4,	0x0B29,	%i3
	sir	0x04F3
	lduh	[%l7 + 0x0C],	%l1
	movrgez	%l5,	%o6,	%i7
	ldd	[%l7 + 0x50],	%i6
	fmovrdne	%g7,	%f22,	%f16
	fmovdneg	%icc,	%f0,	%f11
	udivcc	%o3,	0x0FD0,	%i0
	umul	%i4,	0x1402,	%o4
	ldsb	[%l7 + 0x77],	%o1
	subccc	%l0,	%i2,	%l6
	fmovdleu	%icc,	%f0,	%f19
	xorcc	%l3,	%i5,	%g5
	fcmpes	%fcc0,	%f20,	%f0
	subcc	%l2,	%g3,	%o2
	srl	%g6,	0x19,	%g4
	movvc	%xcc,	%g1,	%g2
	movl	%icc,	%o0,	%o5
	fmovrsgz	%o7,	%f1,	%f1
	fmul8x16	%f27,	%f6,	%f16
	fmovsge	%xcc,	%f14,	%f14
	movrgez	%l4,	0x1F5,	%i3
	fexpand	%f31,	%f0
	stb	%l1,	[%l7 + 0x4A]
	orcc	%i1,	0x0A25,	%l5
	mulscc	%o6,	0x12C1,	%i6
	fmovrde	%g7,	%f26,	%f0
	xnorcc	%i7,	0x18CF,	%o3
	fmovrde	%i0,	%f12,	%f26
	movleu	%icc,	%o4,	%i4
	or	%l0,	%o1,	%i2
	sllx	%l3,	%l6,	%g5
	fcmpeq16	%f2,	%f4,	%l2
	movl	%xcc,	%i5,	%g3
	smulcc	%g6,	0x06B3,	%g4
	nop
	set	0x40, %l1
	stw	%g1,	[%l7 + %l1]
	orcc	%g2,	%o0,	%o2
	fmovse	%xcc,	%f25,	%f30
	sdiv	%o5,	0x0F1A,	%l4
	movge	%xcc,	%o7,	%i3
	movre	%l1,	%l5,	%i1
	alignaddr	%i6,	%g7,	%o6
	xnorcc	%i7,	%o3,	%o4
	udivx	%i4,	0x14F2,	%l0
	siam	0x6
	sdiv	%o1,	0x0AB2,	%i2
	movneg	%icc,	%l3,	%l6
	fmul8x16	%f11,	%f4,	%f0
	fabss	%f26,	%f12
	xnorcc	%i0,	%l2,	%i5
	ldd	[%l7 + 0x78],	%f20
	fabsd	%f30,	%f4
	stb	%g3,	[%l7 + 0x50]
	fmovdle	%icc,	%f19,	%f30
	nop
	set	0x29, %i3
	stb	%g5,	[%l7 + %i3]
	edge8l	%g6,	%g4,	%g2
	st	%f30,	[%l7 + 0x08]
	mulx	%o0,	%g1,	%o2
	addc	%o5,	0x1469,	%o7
	movrne	%i3,	%l4,	%l5
	lduw	[%l7 + 0x50],	%i1
	edge8l	%i6,	%g7,	%o6
	movne	%xcc,	%l1,	%i7
	subc	%o3,	0x120E,	%i4
	edge16n	%l0,	%o1,	%o4
	fmovdleu	%xcc,	%f26,	%f10
	subccc	%i2,	%l6,	%i0
	fnand	%f14,	%f14,	%f8
	fmovrsgz	%l3,	%f6,	%f5
	move	%icc,	%i5,	%g3
	fcmps	%fcc0,	%f28,	%f18
	movpos	%xcc,	%l2,	%g5
	edge32	%g4,	%g2,	%g6
	restore %g1, %o2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o7,	%o0,	%l4
	fornot2s	%f6,	%f4,	%f11
	subcc	%i3,	%i1,	%i6
	stw	%l5,	[%l7 + 0x20]
	lduh	[%l7 + 0x16],	%o6
	edge16	%l1,	%i7,	%o3
	std	%f0,	[%l7 + 0x30]
	fmovrdlz	%g7,	%f14,	%f14
	movn	%icc,	%l0,	%o1
	add	%i4,	%i2,	%o4
	sethi	0x0049,	%l6
	umul	%l3,	%i5,	%i0
	subcc	%l2,	%g3,	%g5
	movvs	%xcc,	%g4,	%g6
	fmovrde	%g1,	%f14,	%f12
	for	%f16,	%f0,	%f28
	fmovda	%icc,	%f26,	%f29
	srax	%o2,	0x0F,	%g2
	lduw	[%l7 + 0x54],	%o5
	fors	%f19,	%f21,	%f26
	edge16l	%o7,	%o0,	%l4
	fmovrdgez	%i1,	%f30,	%f10
	movre	%i6,	%l5,	%o6
	stb	%l1,	[%l7 + 0x3F]
	sllx	%i7,	0x0D,	%o3
	stb	%i3,	[%l7 + 0x11]
	save %g7, %l0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f17,	%f6
	ldsb	[%l7 + 0x6F],	%i4
	popc	%o4,	%i2
	or	%l6,	0x1929,	%l3
	array16	%i5,	%l2,	%g3
	movneg	%icc,	%i0,	%g5
	movne	%xcc,	%g6,	%g4
	move	%icc,	%g1,	%o2
	fmul8sux16	%f30,	%f16,	%f6
	edge8n	%o5,	%o7,	%o0
	edge32n	%g2,	%l4,	%i6
	fmovsvs	%xcc,	%f13,	%f19
	fpsub32	%f10,	%f20,	%f14
	fmovs	%f11,	%f30
	add	%i1,	%o6,	%l5
	orn	%i7,	0x100B,	%l1
	and	%o3,	%i3,	%g7
	xnor	%o1,	%l0,	%o4
	sdiv	%i4,	0x133E,	%l6
	edge8l	%i2,	%i5,	%l2
	orncc	%g3,	0x0CC0,	%i0
	ldd	[%l7 + 0x20],	%l2
	movrgez	%g5,	%g4,	%g1
	movg	%icc,	%o2,	%g6
	fmovrslez	%o5,	%f20,	%f5
	srlx	%o7,	%o0,	%l4
	movl	%xcc,	%i6,	%g2
	alignaddrl	%o6,	%l5,	%i7
	fpack32	%f10,	%f2,	%f4
	mulx	%i1,	0x1EFF,	%o3
	stw	%i3,	[%l7 + 0x24]
	or	%l1,	%g7,	%o1
	or	%l0,	0x0C75,	%i4
	orn	%l6,	%i2,	%o4
	ldsw	[%l7 + 0x28],	%l2
	xorcc	%i5,	%g3,	%i0
	fmovdle	%icc,	%f27,	%f15
	sllx	%g5,	%l3,	%g1
	movl	%icc,	%o2,	%g6
	fcmple32	%f20,	%f12,	%g4
	popc	0x0018,	%o7
	popc	0x1A35,	%o0
	fexpand	%f27,	%f6
	movgu	%icc,	%o5,	%l4
	srl	%g2,	0x0B,	%o6
	addcc	%l5,	0x1CCE,	%i7
	umul	%i6,	0x0F0E,	%o3
	and	%i3,	0x1D61,	%l1
	orncc	%g7,	%o1,	%l0
	movrlez	%i1,	%l6,	%i2
	stw	%o4,	[%l7 + 0x74]
	subccc	%i4,	%i5,	%g3
	fmovdge	%icc,	%f20,	%f21
	sra	%i0,	%g5,	%l2
	array16	%g1,	%l3,	%o2
	sth	%g4,	[%l7 + 0x3E]
	array32	%g6,	%o7,	%o0
	pdist	%f12,	%f0,	%f30
	ldub	[%l7 + 0x69],	%o5
	fand	%f24,	%f24,	%f22
	stb	%l4,	[%l7 + 0x2B]
	st	%f9,	[%l7 + 0x70]
	alignaddr	%g2,	%l5,	%o6
	movle	%xcc,	%i6,	%i7
	fornot2	%f2,	%f14,	%f22
	fpadd32s	%f11,	%f0,	%f31
	edge16	%o3,	%l1,	%i3
	edge8l	%o1,	%l0,	%g7
	std	%f8,	[%l7 + 0x20]
	andncc	%l6,	%i1,	%o4
	fpack32	%f24,	%f10,	%f22
	alignaddrl	%i4,	%i5,	%g3
	movvs	%xcc,	%i0,	%g5
	lduw	[%l7 + 0x40],	%i2
	ldsb	[%l7 + 0x6F],	%l2
	fmovdle	%icc,	%f12,	%f9
	srax	%g1,	0x0B,	%o2
	ldsh	[%l7 + 0x1E],	%l3
	addc	%g4,	0x05D9,	%o7
	fsrc1	%f2,	%f14
	orncc	%o0,	%g6,	%o5
	fnot2s	%f28,	%f19
	xor	%g2,	0x0E9C,	%l5
	movl	%xcc,	%o6,	%i6
	fzeros	%f10
	nop
	set	0x60, %l2
	ldsw	[%l7 + %l2],	%l4
	movrgz	%i7,	0x24B,	%o3
	stx	%l1,	[%l7 + 0x40]
	edge32ln	%i3,	%o1,	%l0
	stb	%g7,	[%l7 + 0x39]
	udivx	%l6,	0x1B33,	%i1
	fcmpeq16	%f2,	%f6,	%o4
	sra	%i5,	%g3,	%i0
	lduw	[%l7 + 0x10],	%g5
	save %i2, 0x0957, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i4,	%o2,	%g1
	edge8l	%g4,	%o7,	%l3
	ldx	[%l7 + 0x68],	%o0
	fcmpne16	%f16,	%f10,	%g6
	fpadd32	%f4,	%f16,	%f20
	fcmpd	%fcc1,	%f2,	%f12
	edge32n	%g2,	%l5,	%o5
	sll	%i6,	%o6,	%l4
	movg	%icc,	%o3,	%i7
	edge16l	%l1,	%o1,	%i3
	movrne	%l0,	0x31D,	%g7
	edge8n	%i1,	%l6,	%o4
	movrne	%i5,	0x0B1,	%g3
	fnot1	%f16,	%f16
	fmul8x16	%f2,	%f2,	%f14
	fpadd16s	%f3,	%f23,	%f2
	andncc	%g5,	%i2,	%l2
	xorcc	%i0,	0x02BF,	%i4
	edge16	%g1,	%o2,	%o7
	lduw	[%l7 + 0x58],	%l3
	fcmple32	%f28,	%f14,	%g4
	fxors	%f25,	%f7,	%f7
	addc	%g6,	%o0,	%l5
	mulx	%g2,	0x0239,	%i6
	fnors	%f4,	%f24,	%f22
	movle	%xcc,	%o5,	%o6
	fmovdn	%icc,	%f13,	%f6
	and	%o3,	0x12A4,	%i7
	fmovrsne	%l1,	%f22,	%f4
	fnot1	%f12,	%f6
	fmovdcc	%xcc,	%f17,	%f2
	movvs	%icc,	%l4,	%o1
	movrlez	%i3,	0x3E3,	%l0
	sdivx	%g7,	0x1B76,	%i1
	ldsb	[%l7 + 0x69],	%l6
	movn	%xcc,	%i5,	%g3
	fmovdle	%icc,	%f23,	%f13
	edge16l	%g5,	%o4,	%i2
	xnor	%i0,	%l2,	%i4
	ldsb	[%l7 + 0x62],	%o2
	stw	%o7,	[%l7 + 0x14]
	movrlz	%g1,	0x1F6,	%l3
	fmovrslez	%g6,	%f14,	%f23
	orcc	%g4,	%o0,	%g2
	orcc	%l5,	%o5,	%i6
	fornot2s	%f23,	%f30,	%f30
	array16	%o6,	%i7,	%l1
	fmovdle	%icc,	%f31,	%f26
	fmul8ulx16	%f2,	%f4,	%f18
	fsrc2	%f26,	%f28
	movge	%icc,	%o3,	%o1
	ldx	[%l7 + 0x48],	%i3
	move	%icc,	%l4,	%g7
	fmovsneg	%icc,	%f24,	%f30
	movvc	%icc,	%i1,	%l0
	lduh	[%l7 + 0x70],	%i5
	movre	%l6,	%g3,	%o4
	sdivcc	%g5,	0x0642,	%i0
	alignaddrl	%l2,	%i2,	%o2
	edge32l	%o7,	%i4,	%g1
	sub	%g6,	0x08A8,	%l3
	edge8	%g4,	%o0,	%l5
	movle	%xcc,	%g2,	%i6
	edge32n	%o5,	%i7,	%o6
	movn	%xcc,	%l1,	%o3
	sll	%o1,	%i3,	%g7
	movvc	%xcc,	%l4,	%i1
	subc	%i5,	0x1E90,	%l6
	movneg	%icc,	%l0,	%o4
	lduh	[%l7 + 0x7E],	%g5
	umulcc	%g3,	%i0,	%l2
	smul	%i2,	%o2,	%i4
	fmovsvs	%icc,	%f24,	%f0
	addccc	%o7,	%g1,	%g6
	fmovsge	%icc,	%f7,	%f22
	sir	0x0651
	fmovdpos	%xcc,	%f25,	%f25
	movgu	%icc,	%g4,	%o0
	ldub	[%l7 + 0x3A],	%l3
	andn	%l5,	0x0E4B,	%g2
	umul	%i6,	%i7,	%o6
	fpadd16	%f18,	%f18,	%f26
	fone	%f20
	array32	%l1,	%o5,	%o1
	std	%f30,	[%l7 + 0x68]
	fmovsg	%xcc,	%f30,	%f2
	array32	%o3,	%g7,	%l4
	ld	[%l7 + 0x3C],	%f0
	udiv	%i3,	0x091D,	%i1
	fpsub32	%f2,	%f20,	%f24
	umulcc	%i5,	%l0,	%o4
	alignaddrl	%l6,	%g5,	%g3
	fmovrdgz	%l2,	%f26,	%f8
	mulscc	%i2,	0x1CFB,	%i0
	fmovsne	%icc,	%f26,	%f20
	orncc	%o2,	%i4,	%o7
	edge32	%g6,	%g4,	%o0
	orn	%g1,	0x0FA9,	%l3
	movge	%xcc,	%l5,	%g2
	alignaddr	%i7,	%o6,	%i6
	ldd	[%l7 + 0x70],	%l0
	edge8n	%o5,	%o1,	%g7
	lduh	[%l7 + 0x28],	%l4
	array8	%i3,	%i1,	%o3
	fmul8x16au	%f0,	%f13,	%f4
	movrgz	%l0,	%i5,	%l6
	fmovsvc	%icc,	%f15,	%f11
	addccc	%g5,	0x0B8F,	%o4
	movleu	%xcc,	%l2,	%i2
	movrne	%i0,	0x229,	%o2
	sth	%i4,	[%l7 + 0x3A]
	movrgez	%g3,	%o7,	%g4
	andncc	%o0,	%g6,	%g1
	fxors	%f26,	%f23,	%f30
	movge	%icc,	%l3,	%g2
	fnors	%f12,	%f15,	%f8
	fsrc1s	%f19,	%f29
	xnorcc	%l5,	%i7,	%o6
	srlx	%l1,	0x0D,	%o5
	lduh	[%l7 + 0x42],	%i6
	edge8	%o1,	%l4,	%i3
	smulcc	%g7,	0x1219,	%i1
	umulcc	%l0,	%o3,	%l6
	movleu	%icc,	%i5,	%g5
	fpackfix	%f18,	%f31
	array16	%l2,	%i2,	%i0
	movre	%o2,	%o4,	%g3
	array8	%i4,	%g4,	%o0
	nop
	set	0x7C, %o3
	ldsb	[%l7 + %o3],	%o7
	xor	%g1,	%g6,	%l3
	orn	%l5,	0x0B8B,	%i7
	lduh	[%l7 + 0x40],	%g2
	xorcc	%l1,	0x0FA9,	%o5
	movpos	%icc,	%o6,	%i6
	movl	%xcc,	%o1,	%l4
	edge32n	%g7,	%i1,	%i3
	movcs	%icc,	%o3,	%l0
	xor	%i5,	%g5,	%l2
	movre	%l6,	0x219,	%i2
	movrgez	%i0,	0x044,	%o2
	subc	%o4,	0x0E23,	%i4
	edge8l	%g4,	%g3,	%o7
	subcc	%o0,	%g6,	%g1
	movcc	%xcc,	%l3,	%i7
	sllx	%l5,	%g2,	%o5
	fcmpgt32	%f8,	%f14,	%l1
	smul	%i6,	0x1ED6,	%o6
	smul	%l4,	%o1,	%i1
	srlx	%g7,	%o3,	%l0
	fmovscs	%icc,	%f6,	%f15
	subcc	%i5,	%i3,	%l2
	xor	%l6,	0x190E,	%g5
	movl	%xcc,	%i0,	%o2
	lduw	[%l7 + 0x4C],	%o4
	movne	%xcc,	%i4,	%i2
	umulcc	%g4,	%o7,	%g3
	fmovrdgez	%o0,	%f24,	%f22
	sllx	%g1,	0x1F,	%g6
	sllx	%l3,	%i7,	%l5
	udivx	%o5,	0x0439,	%l1
	movrgez	%g2,	%i6,	%l4
	movrne	%o6,	0x13C,	%o1
	movrgz	%i1,	%o3,	%l0
	array16	%i5,	%i3,	%g7
	fcmps	%fcc0,	%f6,	%f20
	sdivx	%l6,	0x0F0D,	%l2
	edge32l	%i0,	%g5,	%o2
	array8	%i4,	%o4,	%i2
	subccc	%o7,	%g4,	%g3
	stx	%o0,	[%l7 + 0x50]
	edge8	%g1,	%l3,	%i7
	sth	%g6,	[%l7 + 0x46]
	edge16l	%l5,	%o5,	%g2
	std	%f10,	[%l7 + 0x68]
	fmovrdgz	%l1,	%f24,	%f2
	fmovsleu	%xcc,	%f27,	%f14
	array16	%i6,	%o6,	%o1
	fandnot1	%f26,	%f2,	%f10
	fexpand	%f6,	%f26
	fones	%f23
	stw	%i1,	[%l7 + 0x20]
	sra	%o3,	0x11,	%l4
	array32	%i5,	%l0,	%i3
	ldsw	[%l7 + 0x68],	%l6
	fabss	%f8,	%f3
	movneg	%icc,	%g7,	%l2
	fmovrdlz	%g5,	%f10,	%f2
	sir	0x166C
	movcs	%icc,	%o2,	%i0
	umulcc	%i4,	%o4,	%o7
	srlx	%g4,	%i2,	%o0
	udivx	%g1,	0x0308,	%g3
	movl	%xcc,	%l3,	%i7
	sra	%g6,	0x04,	%o5
	movrgez	%l5,	%l1,	%i6
	fsrc1	%f26,	%f8
	srl	%o6,	%o1,	%i1
	fmovda	%icc,	%f10,	%f10
	fmovdpos	%icc,	%f28,	%f15
	movne	%xcc,	%o3,	%g2
	movcc	%xcc,	%i5,	%l4
	edge32ln	%l0,	%i3,	%g7
	edge8n	%l6,	%l2,	%g5
	fmovdneg	%xcc,	%f27,	%f25
	alignaddrl	%i0,	%i4,	%o2
	movgu	%xcc,	%o4,	%g4
	movvs	%xcc,	%i2,	%o7
	fmovscs	%icc,	%f17,	%f18
	movrlez	%g1,	0x3A2,	%g3
	sub	%l3,	0x0FFD,	%o0
	stw	%g6,	[%l7 + 0x5C]
	sdivcc	%i7,	0x0D20,	%o5
	save %l5, 0x1128, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f16,	%f16
	andcc	%o6,	0x1059,	%l1
	and	%o1,	0x173D,	%i1
	fpsub32s	%f4,	%f9,	%f15
	addccc	%g2,	%o3,	%i5
	movre	%l4,	0x2FA,	%i3
	xnor	%g7,	%l6,	%l2
	edge16n	%l0,	%i0,	%i4
	addc	%o2,	0x1948,	%o4
	ldsh	[%l7 + 0x4E],	%g5
	save %i2, 0x14DF, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o7,	0x024A,	%g3
	edge32l	%g1,	%l3,	%g6
	and	%o0,	%i7,	%l5
	edge16	%i6,	%o6,	%l1
	siam	0x3
	fandnot1	%f22,	%f12,	%f12
	ldsw	[%l7 + 0x5C],	%o1
	movl	%icc,	%i1,	%g2
	move	%icc,	%o5,	%i5
	edge8l	%l4,	%o3,	%g7
	array16	%l6,	%l2,	%i3
	orn	%i0,	%i4,	%o2
	umulcc	%o4,	%l0,	%g5
	stw	%i2,	[%l7 + 0x20]
	move	%xcc,	%g4,	%g3
	movg	%icc,	%g1,	%o7
	movcs	%xcc,	%g6,	%o0
	movn	%icc,	%i7,	%l5
	fcmped	%fcc3,	%f18,	%f20
	movrgez	%l3,	%o6,	%l1
	fandnot2	%f6,	%f28,	%f14
	movleu	%icc,	%o1,	%i1
	umulcc	%g2,	%o5,	%i6
	movpos	%icc,	%l4,	%i5
	subccc	%g7,	0x17A8,	%o3
	movrgez	%l2,	%i3,	%i0
	ld	[%l7 + 0x3C],	%f2
	movrne	%i4,	0x0CB,	%o2
	lduw	[%l7 + 0x6C],	%o4
	fzero	%f26
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	umulcc	%i2,	0x0FD1,	%g4
	movn	%xcc,	%l0,	%g3
	movrgez	%g1,	0x387,	%o7
	movre	%o0,	0x1DF,	%i7
	fmovrslz	%g6,	%f3,	%f30
	sdivx	%l3,	0x1E1B,	%l5
	fornot2	%f10,	%f20,	%f2
	fmovrdlez	%l1,	%f30,	%f20
	orncc	%o1,	0x1845,	%o6
	fmovrde	%i1,	%f4,	%f0
	stx	%g2,	[%l7 + 0x70]
	edge16l	%i6,	%l4,	%i5
	ld	[%l7 + 0x78],	%f14
	fpadd32s	%f25,	%f14,	%f30
	udivcc	%g7,	0x007E,	%o3
	edge32n	%l2,	%i3,	%o5
	orcc	%i4,	0x1479,	%i0
	fones	%f5
	movcc	%xcc,	%o2,	%o4
	xnor	%g5,	0x0C66,	%l6
	andncc	%g4,	%l0,	%g3
	sth	%g1,	[%l7 + 0x16]
	movcs	%icc,	%i2,	%o7
	fmovdl	%xcc,	%f6,	%f19
	addc	%i7,	%o0,	%g6
	movl	%icc,	%l3,	%l5
	array32	%l1,	%o6,	%i1
	sth	%o1,	[%l7 + 0x20]
	sllx	%i6,	0x14,	%l4
	and	%i5,	0x0112,	%g2
	sub	%o3,	0x10FD,	%l2
	stx	%g7,	[%l7 + 0x68]
	addcc	%o5,	0x10F4,	%i3
	subc	%i0,	%o2,	%i4
	edge16l	%o4,	%l6,	%g4
	ldx	[%l7 + 0x78],	%l0
	ld	[%l7 + 0x70],	%f5
	fmovsge	%xcc,	%f25,	%f24
	subcc	%g5,	0x0D68,	%g1
	movneg	%icc,	%g3,	%o7
	udivx	%i7,	0x0345,	%i2
	movcs	%xcc,	%o0,	%g6
	nop
	set	0x0C, %l4
	stb	%l3,	[%l7 + %l4]
	udivx	%l5,	0x1B55,	%l1
	array32	%i1,	%o6,	%o1
	udivcc	%l4,	0x05E0,	%i5
	movg	%xcc,	%g2,	%i6
	movvs	%icc,	%l2,	%g7
	fones	%f22
	ldsb	[%l7 + 0x08],	%o5
	fornot1s	%f24,	%f16,	%f13
	fmul8x16au	%f21,	%f30,	%f24
	udiv	%o3,	0x061E,	%i3
	addccc	%i0,	0x0AB7,	%i4
	movrlz	%o4,	0x2C3,	%o2
	movleu	%xcc,	%g4,	%l6
	xnorcc	%g5,	0x17F8,	%g1
	fones	%f31
	movg	%xcc,	%g3,	%l0
	ldx	[%l7 + 0x58],	%i7
	edge8n	%o7,	%o0,	%g6
	sll	%l3,	0x0F,	%l5
	save %i2, %i1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l1,	%o1,	%l4
	fmovsa	%icc,	%f5,	%f7
	xnor	%g2,	%i5,	%l2
	fand	%f30,	%f26,	%f16
	for	%f26,	%f16,	%f28
	lduw	[%l7 + 0x38],	%g7
	edge8n	%o5,	%o3,	%i6
	fmovda	%xcc,	%f20,	%f13
	edge16n	%i0,	%i3,	%o4
	fcmpeq16	%f12,	%f4,	%i4
	fands	%f25,	%f2,	%f7
	array16	%g4,	%l6,	%o2
	sth	%g5,	[%l7 + 0x68]
	movge	%icc,	%g1,	%l0
	orn	%i7,	%o7,	%g3
	fone	%f12
	sth	%o0,	[%l7 + 0x4A]
	sir	0x0143
	fmovdne	%xcc,	%f0,	%f26
	edge32l	%g6,	%l5,	%i2
	restore %i1, 0x081A, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f2,	%f4,	%f28
	fsrc2	%f10,	%f28
	ldsb	[%l7 + 0x16],	%l1
	sethi	0x0751,	%l3
	movvs	%xcc,	%o1,	%l4
	xnorcc	%g2,	0x074B,	%l2
	move	%xcc,	%g7,	%o5
	alignaddrl	%i5,	%o3,	%i0
	ldub	[%l7 + 0x54],	%i6
	movrgez	%o4,	0x345,	%i3
	edge16	%i4,	%g4,	%o2
	addcc	%g5,	0x0A1E,	%l6
	move	%xcc,	%g1,	%l0
	fmovsvs	%xcc,	%f7,	%f26
	fandnot2	%f30,	%f10,	%f22
	subcc	%o7,	%i7,	%o0
	fpadd16	%f0,	%f2,	%f30
	movrgez	%g3,	0x2D9,	%g6
	sdivx	%l5,	0x02B7,	%i2
	fornot2s	%f5,	%f30,	%f22
	fmovdg	%xcc,	%f23,	%f12
	edge32	%i1,	%l1,	%l3
	fmovsn	%xcc,	%f25,	%f28
	stw	%o6,	[%l7 + 0x38]
	ldd	[%l7 + 0x50],	%f14
	faligndata	%f22,	%f28,	%f18
	bshuffle	%f2,	%f26,	%f20
	fandnot1s	%f19,	%f6,	%f17
	fmovsvc	%icc,	%f0,	%f12
	add	%l4,	0x174D,	%g2
	fmovrslz	%l2,	%f14,	%f21
	edge16l	%o1,	%g7,	%o5
	edge16ln	%i5,	%o3,	%i6
	sdivcc	%o4,	0x096C,	%i0
	ldd	[%l7 + 0x78],	%f10
	movle	%icc,	%i4,	%g4
	sub	%o2,	%i3,	%l6
	fnegs	%f3,	%f16
	or	%g5,	%l0,	%g1
	xnor	%o7,	0x1B15,	%i7
	and	%o0,	%g6,	%g3
	fmuld8ulx16	%f14,	%f13,	%f12
	andcc	%i2,	%i1,	%l5
	stb	%l1,	[%l7 + 0x38]
	srl	%o6,	%l3,	%g2
	fmovrdgz	%l2,	%f10,	%f28
	fpmerge	%f22,	%f10,	%f24
	fmovsl	%xcc,	%f26,	%f3
	smul	%o1,	0x1967,	%l4
	fcmps	%fcc2,	%f2,	%f17
	fmovdcc	%xcc,	%f11,	%f25
	subccc	%g7,	0x14C6,	%o5
	sra	%i5,	%i6,	%o3
	popc	0x01D3,	%o4
	umulcc	%i0,	0x155D,	%g4
	andncc	%o2,	%i3,	%i4
	edge32	%l6,	%g5,	%l0
	alignaddr	%o7,	%i7,	%g1
	for	%f28,	%f16,	%f20
	addcc	%g6,	%o0,	%i2
	edge32ln	%g3,	%i1,	%l1
	ldsh	[%l7 + 0x1C],	%o6
	fmovdcc	%icc,	%f9,	%f24
	andncc	%l5,	%g2,	%l3
	sethi	0x081C,	%l2
	fcmple32	%f14,	%f12,	%l4
	umul	%o1,	%g7,	%o5
	edge16l	%i5,	%i6,	%o4
	movpos	%icc,	%i0,	%o3
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	fmovdneg	%icc,	%f10,	%f5
	fmul8x16al	%f31,	%f21,	%f26
	srlx	%i4,	0x1E,	%l6
	fmovsvc	%xcc,	%f25,	%f8
	orn	%g5,	%l0,	%o7
	addc	%g4,	%i7,	%g6
	sir	0x1CA1
	edge32ln	%g1,	%i2,	%o0
	smul	%g3,	%l1,	%o6
	array8	%i1,	%l5,	%l3
	udivcc	%l2,	0x0C75,	%g2
	ldsb	[%l7 + 0x6F],	%l4
	fmovsl	%icc,	%f19,	%f4
	movne	%icc,	%g7,	%o1
	and	%i5,	0x0B00,	%o5
	movl	%icc,	%i6,	%i0
	fmovdcs	%icc,	%f20,	%f24
	subc	%o3,	%o2,	%o4
	sub	%i3,	0x1208,	%l6
	fcmpes	%fcc1,	%f29,	%f28
	edge32	%g5,	%i4,	%o7
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%l0
	movrne	%i7,	0x1FF,	%g6
	movl	%xcc,	%g4,	%g1
	fmovsgu	%icc,	%f18,	%f11
	umulcc	%i2,	%o0,	%l1
	fmul8x16au	%f23,	%f8,	%f8
	udivcc	%g3,	0x0F94,	%i1
	mulx	%l5,	0x1190,	%l3
	movl	%icc,	%o6,	%l2
	edge8ln	%g2,	%l4,	%g7
	fnor	%f10,	%f2,	%f14
	movneg	%icc,	%i5,	%o5
	edge32ln	%o1,	%i0,	%i6
	movrlz	%o2,	%o3,	%i3
	alignaddrl	%o4,	%l6,	%g5
	ldd	[%l7 + 0x20],	%i4
	ldub	[%l7 + 0x7E],	%l0
	array16	%o7,	%i7,	%g6
	orncc	%g4,	0x1712,	%g1
	sir	0x0B62
	fandnot1	%f8,	%f4,	%f4
	movg	%xcc,	%i2,	%l1
	movle	%icc,	%o0,	%g3
	add	%l5,	0x1F1D,	%l3
	movrgez	%o6,	0x334,	%l2
	array8	%g2,	%l4,	%g7
	addccc	%i1,	0x13B5,	%o5
	movcc	%icc,	%o1,	%i5
	srl	%i0,	%o2,	%i6
	fpack32	%f12,	%f28,	%f26
	mulx	%i3,	0x0F78,	%o4
	udivx	%l6,	0x1866,	%o3
	srl	%g5,	%l0,	%i4
	fxor	%f30,	%f10,	%f22
	xor	%i7,	0x0FE6,	%o7
	sethi	0x1134,	%g4
	sdivcc	%g1,	0x1514,	%g6
	mulx	%l1,	%o0,	%g3
	std	%f2,	[%l7 + 0x68]
	xnor	%i2,	0x08DA,	%l5
	udivx	%o6,	0x0C7F,	%l3
	fmovdne	%xcc,	%f31,	%f10
	fxor	%f20,	%f10,	%f14
	save %g2, 0x10FF, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l2,	%g7,	%o5
	movrlz	%o1,	%i1,	%i5
	stb	%o2,	[%l7 + 0x54]
	movg	%icc,	%i6,	%i0
	restore %o4, 0x0313, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f9,	%f20,	%f6
	fmovscs	%icc,	%f3,	%f29
	edge8l	%i3,	%o3,	%g5
	subcc	%i4,	0x1D8F,	%i7
	edge32	%o7,	%l0,	%g4
	siam	0x2
	fmovs	%f8,	%f17
	nop
	set	0x42, %o4
	sth	%g6,	[%l7 + %o4]
	lduh	[%l7 + 0x24],	%l1
	fcmple16	%f14,	%f0,	%o0
	array8	%g1,	%g3,	%i2
	movleu	%xcc,	%l5,	%o6
	edge8	%g2,	%l4,	%l2
	add	%l3,	0x101C,	%g7
	orn	%o5,	0x1BF7,	%o1
	sdivcc	%i1,	0x140E,	%o2
	mulscc	%i6,	%i5,	%o4
	sll	%l6,	0x15,	%i0
	mulx	%i3,	%g5,	%o3
	fxnor	%f22,	%f30,	%f16
	sdiv	%i7,	0x1AAE,	%i4
	fmovrsne	%o7,	%f10,	%f4
	movre	%g4,	0x251,	%l0
	sdiv	%l1,	0x16C5,	%o0
	umul	%g1,	%g6,	%g3
	umulcc	%i2,	0x0AF1,	%o6
	lduh	[%l7 + 0x46],	%g2
	fmovrdgez	%l4,	%f14,	%f2
	srax	%l2,	%l3,	%g7
	lduw	[%l7 + 0x38],	%o5
	xor	%o1,	0x1231,	%i1
	sra	%o2,	%l5,	%i6
	ldsb	[%l7 + 0x45],	%i5
	or	%l6,	%o4,	%i3
	addccc	%i0,	0x0275,	%g5
	fcmpd	%fcc3,	%f16,	%f22
	ldd	[%l7 + 0x78],	%f4
	ldd	[%l7 + 0x40],	%f20
	sethi	0x18A3,	%o3
	andncc	%i4,	%i7,	%g4
	ldx	[%l7 + 0x28],	%o7
	xorcc	%l1,	0x1F73,	%l0
	fsrc2	%f8,	%f28
	save %g1, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g3,	0x0E2C,	%i2
	movrgez	%g2,	0x032,	%l4
	edge8	%o6,	%l3,	%l2
	xnorcc	%o5,	0x07C5,	%g7
	andncc	%i1,	%o1,	%l5
	edge16ln	%o2,	%i6,	%i5
	lduw	[%l7 + 0x64],	%o4
	edge16n	%i3,	%l6,	%i0
	fpmerge	%f8,	%f25,	%f18
	ldsh	[%l7 + 0x14],	%o3
	std	%f18,	[%l7 + 0x68]
	edge16ln	%g5,	%i7,	%g4
	array16	%o7,	%i4,	%l0
	subccc	%g1,	0x0054,	%g6
	movn	%icc,	%o0,	%l1
	lduw	[%l7 + 0x2C],	%i2
	edge32l	%g2,	%g3,	%l4
	movne	%icc,	%o6,	%l2
	mova	%xcc,	%o5,	%l3
	edge32l	%g7,	%o1,	%l5
	lduh	[%l7 + 0x08],	%o2
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	xorcc	%i3,	%o4,	%l6
	movge	%icc,	%i0,	%g5
	ldx	[%l7 + 0x20],	%o3
	fsrc1s	%f6,	%f28
	sub	%g4,	0x096A,	%o7
	movcs	%icc,	%i4,	%l0
	udiv	%g1,	0x101B,	%g6
	stx	%o0,	[%l7 + 0x70]
	fmovde	%xcc,	%f6,	%f30
	edge16ln	%i7,	%i2,	%l1
	fmovrslez	%g2,	%f27,	%f17
	orn	%g3,	%l4,	%o6
	movrgz	%l2,	0x309,	%o5
	alignaddr	%l3,	%g7,	%o1
	movre	%l5,	0x26D,	%o2
	lduh	[%l7 + 0x32],	%i6
	umul	%i5,	%i1,	%o4
	or	%i3,	%i0,	%g5
	edge8ln	%o3,	%g4,	%l6
	faligndata	%f26,	%f18,	%f4
	ld	[%l7 + 0x1C],	%f15
	ldsw	[%l7 + 0x10],	%o7
	fnor	%f30,	%f30,	%f0
	movrgz	%l0,	%g1,	%g6
	fmul8x16	%f4,	%f12,	%f2
	mulscc	%i4,	0x0204,	%o0
	andn	%i7,	%l1,	%g2
	udivx	%i2,	0x02F3,	%l4
	srlx	%g3,	0x12,	%l2
	orcc	%o5,	%l3,	%o6
	fmovrsgz	%g7,	%f22,	%f25
	lduw	[%l7 + 0x78],	%l5
	fpsub16	%f24,	%f4,	%f6
	edge16n	%o2,	%o1,	%i5
	sub	%i6,	0x0D7A,	%i1
	ldsb	[%l7 + 0x28],	%i3
	mulx	%i0,	0x1AD3,	%g5
	movneg	%xcc,	%o3,	%o4
	fmovs	%f16,	%f30
	movrgez	%g4,	%o7,	%l6
	edge16ln	%l0,	%g1,	%i4
	array16	%o0,	%i7,	%g6
	std	%f2,	[%l7 + 0x48]
	srax	%g2,	%i2,	%l1
	andncc	%l4,	%l2,	%g3
	mulscc	%o5,	%l3,	%g7
	stb	%l5,	[%l7 + 0x78]
	fxnors	%f6,	%f31,	%f30
	fmovsleu	%icc,	%f18,	%f20
	lduh	[%l7 + 0x58],	%o2
	sethi	0x073E,	%o6
	ldx	[%l7 + 0x08],	%i5
	movvc	%icc,	%i6,	%o1
	andcc	%i3,	0x127E,	%i1
	subcc	%i0,	%o3,	%g5
	addccc	%o4,	%o7,	%l6
	fnot1	%f24,	%f0
	udivx	%l0,	0x1A39,	%g4
	movrgez	%i4,	0x1E6,	%g1
	sir	0x0578
	movvc	%xcc,	%o0,	%g6
	fmul8x16	%f23,	%f0,	%f18
	restore %i7, %g2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f24,	%f28,	%f24
	andncc	%i2,	%l2,	%g3
	edge16n	%l4,	%o5,	%l3
	movcs	%xcc,	%g7,	%l5
	movgu	%xcc,	%o2,	%o6
	edge32	%i5,	%o1,	%i6
	srl	%i1,	%i3,	%o3
	fabss	%f5,	%f5
	fmul8ulx16	%f20,	%f18,	%f12
	fnors	%f8,	%f3,	%f6
	srl	%i0,	0x07,	%o4
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	mova	%xcc,	%o7,	%l0
	xnorcc	%g4,	%g1,	%i4
	lduh	[%l7 + 0x42],	%g6
	fxnors	%f12,	%f21,	%f28
	fandnot1s	%f0,	%f5,	%f30
	addcc	%i7,	%o0,	%l1
	udivcc	%i2,	0x0D24,	%l2
	sir	0x1A6B
	subccc	%g2,	%l4,	%o5
	xnorcc	%l3,	0x0D9F,	%g7
	xnor	%l5,	0x056F,	%o2
	xnor	%g3,	%o6,	%o1
	andn	%i5,	%i1,	%i6
	ldd	[%l7 + 0x28],	%f18
	edge8l	%i3,	%o3,	%o4
	sdiv	%g5,	0x0FEF,	%i0
	subc	%o7,	%l0,	%g4
	fmul8x16au	%f0,	%f10,	%f20
	sll	%g1,	0x0E,	%l6
	subccc	%g6,	%i4,	%i7
	subccc	%l1,	0x1E9C,	%o0
	fcmpne16	%f14,	%f28,	%i2
	mulscc	%l2,	%l4,	%g2
	fmovdleu	%xcc,	%f2,	%f25
	add	%l3,	%o5,	%l5
	movrlz	%g7,	0x3E3,	%o2
	fmovscc	%icc,	%f5,	%f21
	fmovspos	%xcc,	%f28,	%f29
	ld	[%l7 + 0x70],	%f7
	movleu	%icc,	%o6,	%o1
	movg	%icc,	%i5,	%g3
	fornot2	%f26,	%f18,	%f0
	andn	%i6,	0x0B37,	%i1
	movge	%xcc,	%o3,	%i3
	lduh	[%l7 + 0x0E],	%o4
	sir	0x07B5
	nop
	set	0x18, %g1
	ldx	[%l7 + %g1],	%g5
	movcs	%icc,	%i0,	%l0
	stb	%o7,	[%l7 + 0x6B]
	fmovrslez	%g4,	%f30,	%f21
	fornot2	%f16,	%f14,	%f2
	edge16ln	%g1,	%g6,	%i4
	ldub	[%l7 + 0x52],	%i7
	fmovscs	%xcc,	%f6,	%f20
	fnot2s	%f20,	%f26
	st	%f25,	[%l7 + 0x54]
	ldsw	[%l7 + 0x14],	%l1
	fmovrdlz	%o0,	%f24,	%f16
	save %i2, 0x1601, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l4,	%l2
	fcmped	%fcc0,	%f6,	%f26
	fmovsge	%icc,	%f23,	%f6
	sllx	%l3,	%g2,	%o5
	array8	%g7,	%o2,	%o6
	xnorcc	%l5,	0x1C0D,	%o1
	edge16ln	%g3,	%i6,	%i1
	fsrc1	%f8,	%f24
	array8	%i5,	%o3,	%o4
	fmovspos	%icc,	%f15,	%f18
	fmovrdlez	%i3,	%f30,	%f0
	ld	[%l7 + 0x44],	%f25
	sethi	0x0317,	%i0
	fexpand	%f14,	%f16
	restore %g5, 0x12CC, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f3,	%f25,	%f6
	udiv	%g4,	0x048D,	%l0
	movg	%icc,	%g1,	%i4
	fpsub32s	%f5,	%f14,	%f17
	movvs	%xcc,	%g6,	%i7
	movn	%icc,	%l1,	%o0
	srax	%i2,	0x18,	%l4
	fmovdg	%xcc,	%f20,	%f17
	or	%l2,	0x06DD,	%l3
	fmovdcc	%xcc,	%f25,	%f24
	movcc	%xcc,	%g2,	%o5
	sth	%l6,	[%l7 + 0x7E]
	sth	%g7,	[%l7 + 0x5E]
	xnorcc	%o2,	0x165F,	%l5
	std	%f26,	[%l7 + 0x10]
	fmovsne	%icc,	%f10,	%f20
	sll	%o6,	%g3,	%o1
	andn	%i6,	%i5,	%o3
	movrgez	%i1,	0x026,	%i3
	ldx	[%l7 + 0x20],	%i0
	movrgz	%g5,	0x147,	%o4
	orn	%g4,	0x0DE9,	%l0
	fmovdvc	%icc,	%f0,	%f6
	mulscc	%g1,	%o7,	%i4
	fmovdneg	%icc,	%f17,	%f24
	ldsb	[%l7 + 0x5E],	%g6
	mova	%xcc,	%l1,	%i7
	smulcc	%o0,	%i2,	%l2
	movcs	%xcc,	%l4,	%g2
	movleu	%xcc,	%l3,	%o5
	ldd	[%l7 + 0x58],	%f2
	xor	%g7,	0x0730,	%l6
	fmovdg	%xcc,	%f26,	%f6
	movrne	%l5,	0x2C1,	%o6
	orn	%g3,	0x1F37,	%o1
	ldd	[%l7 + 0x20],	%f26
	fexpand	%f18,	%f12
	and	%o2,	%i5,	%o3
	andcc	%i1,	%i6,	%i3
	fpsub32s	%f23,	%f21,	%f31
	edge32ln	%i0,	%o4,	%g5
	st	%f13,	[%l7 + 0x64]
	fnors	%f4,	%f15,	%f19
	addcc	%l0,	0x0C65,	%g4
	fmovdvc	%icc,	%f25,	%f6
	andn	%o7,	%g1,	%g6
	edge8l	%l1,	%i7,	%o0
	umulcc	%i2,	0x1B1E,	%i4
	alignaddrl	%l2,	%g2,	%l3
	sir	0x0882
	addc	%l4,	0x0A88,	%g7
	edge16l	%o5,	%l6,	%l5
	popc	%g3,	%o1
	array32	%o2,	%i5,	%o3
	movleu	%icc,	%i1,	%i6
	fmovsle	%xcc,	%f10,	%f9
	fmovdcc	%xcc,	%f2,	%f7
	smul	%o6,	0x1C73,	%i3
	addc	%o4,	0x0A9C,	%g5
	stx	%l0,	[%l7 + 0x38]
	fmovrslz	%i0,	%f19,	%f2
	orncc	%o7,	0x0171,	%g4
	movcs	%xcc,	%g1,	%g6
	siam	0x3
	edge8l	%i7,	%o0,	%i2
	move	%icc,	%l1,	%l2
	ldd	[%l7 + 0x68],	%g2
	addc	%i4,	0x0AC1,	%l3
	nop
	set	0x46, %i0
	stb	%l4,	[%l7 + %i0]
	sth	%g7,	[%l7 + 0x36]
	sdiv	%l6,	0x0634,	%o5
	mova	%xcc,	%l5,	%g3
	movpos	%xcc,	%o2,	%o1
	movrlez	%o3,	%i1,	%i6
	xorcc	%i5,	0x004B,	%o6
	srax	%o4,	0x09,	%g5
	fmul8x16au	%f25,	%f18,	%f10
	movgu	%icc,	%i3,	%i0
	or	%o7,	%l0,	%g1
	fmovdne	%icc,	%f10,	%f25
	addccc	%g6,	%g4,	%i7
	popc	0x0A95,	%i2
	fornot2s	%f16,	%f6,	%f30
	orn	%l1,	0x0349,	%l2
	movrlz	%o0,	0x0E0,	%i4
	movpos	%icc,	%g2,	%l3
	edge16n	%g7,	%l6,	%l4
	subcc	%o5,	0x1E2B,	%l5
	fnors	%f30,	%f6,	%f10
	save %o2, 0x0789, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o1,	%o3
	srax	%i1,	%i5,	%i6
	movrgz	%o4,	0x351,	%g5
	ldx	[%l7 + 0x20],	%o6
	fmovdcs	%xcc,	%f16,	%f8
	fpadd16s	%f13,	%f23,	%f21
	movge	%icc,	%i0,	%o7
	movrlez	%l0,	0x216,	%g1
	ldsw	[%l7 + 0x38],	%g6
	edge32n	%i3,	%g4,	%i7
	or	%l1,	%i2,	%l2
	sethi	0x04CF,	%i4
	fmovrslz	%g2,	%f1,	%f8
	ldd	[%l7 + 0x28],	%o0
	movleu	%icc,	%l3,	%l6
	faligndata	%f24,	%f28,	%f4
	mulx	%g7,	%o5,	%l5
	orcc	%l4,	0x0148,	%o2
	stw	%o1,	[%l7 + 0x74]
	edge32l	%o3,	%i1,	%g3
	mulx	%i5,	0x19AC,	%o4
	fcmpeq16	%f4,	%f10,	%i6
	stx	%o6,	[%l7 + 0x60]
	movvc	%icc,	%g5,	%i0
	movne	%icc,	%o7,	%l0
	subc	%g1,	0x15DC,	%g6
	sll	%i3,	0x08,	%i7
	mulscc	%g4,	%i2,	%l1
	umul	%l2,	%i4,	%g2
	movpos	%icc,	%o0,	%l3
	fmul8x16au	%f14,	%f13,	%f14
	move	%xcc,	%g7,	%l6
	fmovde	%icc,	%f14,	%f13
	fones	%f1
	nop
	set	0x6E, %g3
	sth	%l5,	[%l7 + %g3]
	ld	[%l7 + 0x0C],	%f24
	and	%l4,	%o2,	%o5
	xnorcc	%o3,	0x1722,	%o1
	addc	%i1,	%g3,	%i5
	fpack16	%f16,	%f24
	fandnot2s	%f19,	%f24,	%f20
	edge32	%o4,	%o6,	%i6
	andcc	%g5,	%i0,	%o7
	edge8n	%l0,	%g1,	%i3
	srl	%i7,	0x13,	%g4
	udivcc	%i2,	0x1791,	%l1
	stw	%g6,	[%l7 + 0x10]
	movrlez	%l2,	0x0FB,	%i4
	fornot2	%f2,	%f28,	%f2
	umulcc	%o0,	0x187E,	%l3
	move	%icc,	%g7,	%g2
	orcc	%l6,	0x0EC4,	%l5
	siam	0x7
	edge32	%o2,	%o5,	%o3
	movre	%l4,	%o1,	%g3
	fsrc1s	%f15,	%f3
	save %i1, %o4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i6,	%f18,	%f11
	edge16l	%g5,	%i0,	%o7
	srlx	%l0,	0x0A,	%g1
	edge32n	%i3,	%o6,	%g4
	srlx	%i2,	%l1,	%g6
	movcs	%xcc,	%l2,	%i4
	udivx	%o0,	0x088F,	%i7
	edge8	%g7,	%l3,	%g2
	stx	%l6,	[%l7 + 0x08]
	ldsw	[%l7 + 0x34],	%o2
	edge16	%l5,	%o5,	%o3
	edge16ln	%l4,	%o1,	%g3
	fmovdleu	%icc,	%f27,	%f26
	sdivcc	%i1,	0x14EC,	%i5
	ld	[%l7 + 0x64],	%f2
	fexpand	%f19,	%f24
	edge8n	%i6,	%g5,	%o4
	smul	%o7,	0x1BB3,	%i0
	ldub	[%l7 + 0x2F],	%g1
	fmovsle	%xcc,	%f1,	%f13
	edge32l	%l0,	%i3,	%g4
	sdivx	%i2,	0x13CF,	%l1
	ldd	[%l7 + 0x68],	%o6
	smul	%l2,	%i4,	%o0
	fornot1s	%f29,	%f29,	%f30
	udivx	%i7,	0x09E1,	%g6
	movrne	%l3,	%g2,	%l6
	sll	%g7,	0x1A,	%l5
	movl	%icc,	%o5,	%o3
	fsrc1s	%f9,	%f28
	fmovrdgz	%o2,	%f14,	%f10
	sdivcc	%o1,	0x0731,	%l4
	sll	%i1,	0x1B,	%g3
	subccc	%i6,	%i5,	%o4
	fnot1	%f12,	%f12
	movvs	%xcc,	%o7,	%i0
	mulx	%g1,	%g5,	%l0
	stb	%i3,	[%l7 + 0x71]
	movge	%xcc,	%g4,	%i2
	array32	%l1,	%o6,	%l2
	ld	[%l7 + 0x48],	%f25
	fpadd16s	%f24,	%f14,	%f11
	edge8l	%o0,	%i4,	%i7
	movne	%icc,	%g6,	%g2
	ldsh	[%l7 + 0x2E],	%l3
	edge16l	%g7,	%l6,	%l5
	fnor	%f22,	%f12,	%f20
	fmovdl	%icc,	%f9,	%f24
	lduw	[%l7 + 0x20],	%o5
	edge8n	%o2,	%o1,	%l4
	ldd	[%l7 + 0x58],	%i0
	fmovsleu	%xcc,	%f22,	%f28
	orncc	%o3,	%i6,	%i5
	umul	%g3,	%o4,	%i0
	fmovdvc	%icc,	%f8,	%f8
	andcc	%o7,	%g1,	%g5
	mulscc	%l0,	%g4,	%i2
	movleu	%xcc,	%i3,	%o6
	andcc	%l2,	%o0,	%i4
	movne	%icc,	%i7,	%g6
	nop
	set	0x2A, %o2
	sth	%l1,	[%l7 + %o2]
	array8	%g2,	%g7,	%l6
	movge	%xcc,	%l3,	%l5
	fcmpne32	%f10,	%f26,	%o5
	movle	%xcc,	%o1,	%o2
	and	%l4,	0x0A37,	%o3
	subccc	%i6,	0x1C53,	%i5
	fnot2	%f30,	%f10
	popc	%g3,	%o4
	faligndata	%f22,	%f28,	%f6
	fmovdpos	%icc,	%f26,	%f18
	fpsub32s	%f14,	%f8,	%f21
	orn	%i0,	%i1,	%g1
	sethi	0x106B,	%g5
	edge8l	%o7,	%g4,	%i2
	sdiv	%l0,	0x1AD4,	%i3
	st	%f23,	[%l7 + 0x28]
	movcs	%icc,	%l2,	%o6
	addcc	%o0,	0x1975,	%i7
	sdiv	%g6,	0x1833,	%l1
	andncc	%g2,	%i4,	%l6
	andn	%g7,	0x1A77,	%l5
	orcc	%l3,	%o5,	%o2
	stb	%o1,	[%l7 + 0x2E]
	popc	%l4,	%o3
	movrgez	%i5,	%g3,	%i6
	std	%f20,	[%l7 + 0x20]
	movrne	%i0,	%i1,	%o4
	edge8	%g1,	%o7,	%g5
	xor	%g4,	%l0,	%i3
	sethi	0x077B,	%i2
	sir	0x171E
	fcmpeq32	%f28,	%f10,	%l2
	ldub	[%l7 + 0x12],	%o0
	sethi	0x1160,	%i7
	ldd	[%l7 + 0x78],	%f20
	movle	%icc,	%o6,	%l1
	fmovscs	%xcc,	%f28,	%f12
	ldd	[%l7 + 0x78],	%f16
	fmovsg	%xcc,	%f6,	%f26
	bshuffle	%f6,	%f10,	%f12
	fmovdleu	%icc,	%f23,	%f27
	fxor	%f20,	%f28,	%f8
	xnor	%g6,	0x1EF2,	%i4
	std	%f26,	[%l7 + 0x18]
	edge8l	%g2,	%l6,	%l5
	fpadd32	%f28,	%f30,	%f26
	move	%xcc,	%l3,	%g7
	bshuffle	%f8,	%f10,	%f2
	edge32l	%o5,	%o2,	%o1
	add	%o3,	%l4,	%i5
	smulcc	%i6,	%g3,	%i0
	orncc	%i1,	0x15B0,	%o4
	andcc	%g1,	%g5,	%g4
	edge8	%o7,	%l0,	%i3
	fpackfix	%f6,	%f5
	move	%xcc,	%i2,	%o0
	sir	0x1750
	movvc	%icc,	%i7,	%o6
	edge8n	%l2,	%g6,	%i4
	movrgez	%l1,	0x25B,	%g2
	edge32ln	%l6,	%l5,	%l3
	add	%g7,	%o2,	%o5
	sir	0x112A
	xor	%o3,	0x1B52,	%o1
	ldd	[%l7 + 0x68],	%f6
	sll	%l4,	0x14,	%i6
	stb	%i5,	[%l7 + 0x44]
	lduw	[%l7 + 0x4C],	%g3
	nop
	set	0x28, %i5
	sth	%i0,	[%l7 + %i5]
	sll	%o4,	0x16,	%g1
	for	%f2,	%f4,	%f6
	lduw	[%l7 + 0x08],	%g5
	sdivcc	%i1,	0x051B,	%o7
	andn	%g4,	0x106A,	%l0
	orcc	%i2,	0x12E2,	%o0
	fmovrsgez	%i7,	%f16,	%f15
	mova	%icc,	%i3,	%o6
	stb	%g6,	[%l7 + 0x4C]
	fcmped	%fcc2,	%f4,	%f30
	fpack16	%f14,	%f31
	array16	%l2,	%l1,	%i4
	sdiv	%l6,	0x1472,	%l5
	orcc	%g2,	%l3,	%g7
	sdivcc	%o2,	0x0A6C,	%o3
	andn	%o5,	%l4,	%i6
	movrgz	%i5,	0x361,	%g3
	movvs	%icc,	%o1,	%o4
	mova	%icc,	%g1,	%g5
	movle	%icc,	%i1,	%i0
	ldsw	[%l7 + 0x5C],	%o7
	fmovdn	%icc,	%f19,	%f11
	addcc	%l0,	0x162B,	%g4
	ldd	[%l7 + 0x20],	%f4
	ldx	[%l7 + 0x20],	%o0
	save %i7, 0x0719, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0DFA
	movrgz	%o6,	%g6,	%i3
	orn	%l2,	0x0B09,	%i4
	umul	%l1,	0x16F1,	%l5
	sdivcc	%g2,	0x0327,	%l3
	fmovsvs	%icc,	%f25,	%f5
	movvs	%xcc,	%l6,	%o2
	movg	%icc,	%g7,	%o5
	fnegd	%f2,	%f12
	movrne	%l4,	0x255,	%o3
	srl	%i6,	%g3,	%o1
	sdivcc	%o4,	0x1B97,	%g1
	movgu	%xcc,	%g5,	%i5
	fcmple16	%f18,	%f6,	%i0
	fmul8x16au	%f13,	%f1,	%f20
	udiv	%i1,	0x1B07,	%o7
	popc	0x1967,	%l0
	stb	%o0,	[%l7 + 0x3E]
	mulscc	%g4,	0x04A6,	%i2
	xnorcc	%i7,	%g6,	%o6
	edge32	%l2,	%i3,	%l1
	sir	0x1305
	udivx	%l5,	0x102D,	%g2
	fmovdvc	%icc,	%f0,	%f11
	sra	%l3,	0x07,	%l6
	movg	%icc,	%o2,	%i4
	fmovrsne	%g7,	%f1,	%f21
	movn	%icc,	%o5,	%l4
	fcmpgt16	%f28,	%f20,	%i6
	fone	%f26
	sllx	%o3,	%g3,	%o4
	fmovdle	%icc,	%f31,	%f19
	fpsub16	%f2,	%f14,	%f18
	movle	%icc,	%o1,	%g1
	ldx	[%l7 + 0x20],	%g5
	movvc	%xcc,	%i5,	%i0
	andncc	%i1,	%o7,	%l0
	orncc	%g4,	0x0AC2,	%o0
	movl	%xcc,	%i2,	%i7
	movvs	%icc,	%o6,	%g6
	movrlez	%i3,	%l1,	%l5
	fpsub32s	%f8,	%f14,	%f11
	fmul8x16	%f15,	%f2,	%f28
	ldx	[%l7 + 0x08],	%l2
	fmovsle	%icc,	%f0,	%f15
	fxor	%f28,	%f12,	%f10
	subc	%g2,	0x092A,	%l6
	mulx	%l3,	0x11CC,	%i4
	fcmpgt32	%f18,	%f20,	%g7
	fmovsgu	%icc,	%f31,	%f31
	udivx	%o2,	0x161C,	%l4
	fxnor	%f2,	%f14,	%f2
	fmovsneg	%icc,	%f21,	%f24
	movgu	%icc,	%i6,	%o3
	edge32ln	%g3,	%o5,	%o1
	subccc	%o4,	0x1F1D,	%g1
	movn	%icc,	%g5,	%i5
	fmovdgu	%xcc,	%f17,	%f9
	or	%i1,	%o7,	%i0
	fmovrdlz	%l0,	%f16,	%f6
	orcc	%o0,	0x13BD,	%i2
	ldsb	[%l7 + 0x76],	%i7
	ldd	[%l7 + 0x18],	%f24
	fmovdvs	%icc,	%f29,	%f8
	udivcc	%g4,	0x14D9,	%o6
	mulscc	%g6,	0x003C,	%i3
	addccc	%l1,	0x0F8F,	%l5
	orn	%g2,	0x0D08,	%l2
	movpos	%xcc,	%l6,	%i4
	edge8ln	%g7,	%o2,	%l3
	for	%f0,	%f30,	%f2
	edge32n	%l4,	%o3,	%g3
	fcmple16	%f12,	%f14,	%i6
	ld	[%l7 + 0x6C],	%f15
	sra	%o5,	%o1,	%o4
	ldsh	[%l7 + 0x4E],	%g5
	fpack32	%f14,	%f10,	%f22
	xorcc	%i5,	0x14B5,	%i1
	ldsb	[%l7 + 0x2D],	%g1
	fmovrsgz	%i0,	%f28,	%f18
	edge16ln	%l0,	%o0,	%i2
	movl	%xcc,	%i7,	%g4
	edge16ln	%o6,	%g6,	%i3
	fornot1s	%f22,	%f18,	%f29
	fmovdpos	%xcc,	%f10,	%f8
	srax	%l1,	0x1E,	%l5
	fmovdcc	%xcc,	%f1,	%f18
	fpadd32	%f18,	%f20,	%f0
	alignaddr	%g2,	%o7,	%l6
	udiv	%l2,	0x1773,	%i4
	array32	%o2,	%l3,	%g7
	movg	%icc,	%o3,	%g3
	edge16ln	%i6,	%o5,	%o1
	smulcc	%o4,	0x0E2F,	%g5
	std	%f22,	[%l7 + 0x20]
	udivcc	%l4,	0x0A4A,	%i5
	mova	%xcc,	%i1,	%i0
	edge16	%g1,	%l0,	%o0
	fcmps	%fcc1,	%f7,	%f23
	xor	%i7,	%g4,	%i2
	fmovrslz	%o6,	%f14,	%f22
	ldub	[%l7 + 0x27],	%g6
	movre	%l1,	0x052,	%l5
	fmul8x16au	%f20,	%f11,	%f28
	movge	%xcc,	%g2,	%i3
	fmovrdlz	%l6,	%f22,	%f30
	lduw	[%l7 + 0x7C],	%l2
	sll	%o7,	%i4,	%o2
	popc	0x1413,	%g7
	movre	%l3,	%g3,	%o3
	fnands	%f15,	%f17,	%f22
	fmul8sux16	%f0,	%f8,	%f26
	fnands	%f31,	%f21,	%f9
	fsrc1s	%f23,	%f30
	srl	%i6,	%o1,	%o5
	mulx	%g5,	0x1ADE,	%o4
	orncc	%i5,	0x0621,	%i1
	sllx	%l4,	0x18,	%g1
	xorcc	%l0,	0x1CBE,	%i0
	ldd	[%l7 + 0x50],	%f14
	umulcc	%o0,	%i7,	%g4
	movcs	%icc,	%o6,	%g6
	andcc	%i2,	0x19B9,	%l5
	addcc	%l1,	%g2,	%l6
	subc	%l2,	%o7,	%i4
	sllx	%i3,	%o2,	%l3
	edge8	%g3,	%o3,	%g7
	fmovrdne	%i6,	%f0,	%f10
	fone	%f0
	fmovsl	%xcc,	%f9,	%f22
	stb	%o1,	[%l7 + 0x7D]
	save %o5, %g5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i5,	%l4,	%g1
	fmul8x16au	%f12,	%f12,	%f4
	movvc	%xcc,	%i1,	%i0
	edge32ln	%l0,	%o0,	%g4
	fmovsge	%xcc,	%f7,	%f16
	udiv	%i7,	0x07A5,	%g6
	orncc	%i2,	0x030E,	%o6
	fmovdcc	%xcc,	%f18,	%f1
	movrlz	%l1,	0x142,	%l5
	edge16	%l6,	%l2,	%g2
	movcs	%icc,	%i4,	%i3
	sdivcc	%o2,	0x0382,	%o7
	xnorcc	%l3,	0x0647,	%o3
	movne	%icc,	%g3,	%i6
	lduh	[%l7 + 0x54],	%o1
	alignaddrl	%g7,	%o5,	%g5
	sllx	%i5,	0x0B,	%l4
	movcc	%xcc,	%o4,	%g1
	ldsw	[%l7 + 0x48],	%i0
	mulx	%i1,	0x1BAB,	%l0
	mulscc	%o0,	0x11A3,	%g4
	fandnot1	%f8,	%f26,	%f30
	ldsw	[%l7 + 0x70],	%g6
	subc	%i7,	%i2,	%l1
	move	%icc,	%l5,	%l6
	movrne	%l2,	%g2,	%o6
	udivx	%i3,	0x0612,	%o2
	sth	%o7,	[%l7 + 0x76]
	fandnot1s	%f23,	%f14,	%f25
	ldd	[%l7 + 0x48],	%f0
	popc	0x1D4F,	%i4
	sir	0x0071
	addccc	%o3,	0x1E7B,	%g3
	fpadd32	%f24,	%f8,	%f6
	smul	%l3,	%o1,	%i6
	array32	%g7,	%g5,	%i5
	alignaddr	%l4,	%o4,	%o5
	add	%i0,	0x04EA,	%g1
	fmovrslez	%i1,	%f8,	%f11
	array16	%l0,	%o0,	%g4
	orcc	%i7,	%g6,	%l1
	std	%f20,	[%l7 + 0x28]
	edge8	%l5,	%i2,	%l6
	sdiv	%g2,	0x1AEF,	%o6
	lduh	[%l7 + 0x60],	%l2
	save %i3, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f18,	%f8,	%o3
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	mulscc	%o2,	0x190C,	%i6
	stx	%g7,	[%l7 + 0x58]
	movne	%xcc,	%o1,	%i5
	movpos	%xcc,	%l4,	%o4
	fands	%f14,	%f0,	%f8
	fmovdvc	%xcc,	%f8,	%f3
	movle	%xcc,	%o5,	%g5
	fmovspos	%xcc,	%f28,	%f21
	movvc	%xcc,	%i0,	%g1
	fone	%f24
	fmovsgu	%icc,	%f27,	%f4
	ldsh	[%l7 + 0x44],	%l0
	edge16ln	%o0,	%g4,	%i1
	movge	%xcc,	%g6,	%i7
	popc	0x0DB3,	%l5
	subccc	%i2,	0x0333,	%l1
	edge32l	%l6,	%o6,	%g2
	xor	%i3,	0x1554,	%l2
	movrne	%o7,	0x2DE,	%i4
	edge8l	%o3,	%l3,	%o2
	alignaddrl	%i6,	%g7,	%o1
	std	%f18,	[%l7 + 0x78]
	xnorcc	%g3,	%l4,	%o4
	and	%o5,	%i5,	%g5
	edge8ln	%i0,	%g1,	%o0
	movvs	%xcc,	%l0,	%g4
	edge32ln	%g6,	%i7,	%l5
	fmul8sux16	%f8,	%f4,	%f30
	ldd	[%l7 + 0x78],	%i2
	smulcc	%i1,	0x1456,	%l6
	xnor	%o6,	%g2,	%i3
	edge16ln	%l2,	%o7,	%i4
	fmovda	%xcc,	%f22,	%f9
	sth	%l1,	[%l7 + 0x40]
	edge32l	%l3,	%o2,	%o3
	stx	%g7,	[%l7 + 0x60]
	umulcc	%i6,	0x1B49,	%g3
	udivcc	%o1,	0x1B38,	%o4
	movneg	%icc,	%l4,	%o5
	lduw	[%l7 + 0x74],	%g5
	fmovsa	%xcc,	%f27,	%f10
	ldx	[%l7 + 0x48],	%i0
	stb	%i5,	[%l7 + 0x71]
	xorcc	%o0,	%g1,	%l0
	fcmple32	%f6,	%f22,	%g6
	fpadd32s	%f17,	%f23,	%f1
	xorcc	%g4,	%i7,	%i2
	umul	%l5,	0x07B9,	%l6
	fmuld8sux16	%f19,	%f21,	%f2
	movle	%icc,	%i1,	%g2
	array32	%o6,	%l2,	%i3
	movrgz	%o7,	%i4,	%l1
	edge32ln	%o2,	%l3,	%o3
	ldub	[%l7 + 0x13],	%g7
	ldsb	[%l7 + 0x5E],	%g3
	addccc	%o1,	0x1083,	%i6
	smulcc	%o4,	0x01B9,	%o5
	nop
	set	0x3E, %l6
	ldsh	[%l7 + %l6],	%l4
	stw	%i0,	[%l7 + 0x64]
	movre	%i5,	%o0,	%g1
	movle	%icc,	%l0,	%g6
	edge32l	%g4,	%i7,	%g5
	ldsh	[%l7 + 0x36],	%i2
	array8	%l6,	%i1,	%g2
	fmovrsgez	%o6,	%f9,	%f18
	edge16n	%l5,	%i3,	%l2
	udivx	%i4,	0x0543,	%o7
	fmovsn	%xcc,	%f22,	%f17
	movleu	%xcc,	%l1,	%l3
	movvs	%icc,	%o3,	%o2
	sllx	%g7,	0x00,	%g3
	alignaddrl	%i6,	%o4,	%o1
	stx	%o5,	[%l7 + 0x58]
	and	%i0,	0x1278,	%i5
	edge32l	%o0,	%l4,	%l0
	alignaddr	%g6,	%g4,	%g1
	fsrc2s	%f13,	%f17
	movrgez	%g5,	%i7,	%l6
	udivx	%i1,	0x00E5,	%i2
	ldd	[%l7 + 0x60],	%f20
	fone	%f14
	sth	%o6,	[%l7 + 0x46]
	fmovdleu	%icc,	%f25,	%f23
	fmovrde	%l5,	%f10,	%f10
	lduh	[%l7 + 0x4E],	%i3
	std	%f8,	[%l7 + 0x10]
	edge32ln	%l2,	%i4,	%o7
	fpadd32s	%f8,	%f30,	%f1
	ld	[%l7 + 0x20],	%f24
	movre	%g2,	%l3,	%l1
	fabss	%f4,	%f17
	fcmped	%fcc0,	%f6,	%f30
	mova	%icc,	%o3,	%g7
	mova	%xcc,	%o2,	%g3
	movcc	%icc,	%i6,	%o1
	xorcc	%o4,	0x194A,	%o5
	fmovdcc	%icc,	%f8,	%f8
	fmovsvc	%icc,	%f19,	%f21
	movleu	%icc,	%i0,	%i5
	fpmerge	%f21,	%f28,	%f16
	xnorcc	%l4,	%l0,	%g6
	popc	%o0,	%g4
	movrgez	%g5,	0x249,	%i7
	lduw	[%l7 + 0x60],	%l6
	sll	%g1,	0x02,	%i2
	umul	%i1,	%o6,	%l5
	fmovrdne	%l2,	%f14,	%f6
	movcc	%xcc,	%i4,	%i3
	move	%icc,	%o7,	%g2
	array8	%l3,	%o3,	%l1
	fmuld8ulx16	%f3,	%f14,	%f10
	movne	%icc,	%g7,	%g3
	mulscc	%o2,	%i6,	%o4
	xnor	%o5,	0x16C4,	%i0
	ldsw	[%l7 + 0x60],	%o1
	add	%l4,	0x1A2D,	%i5
	movcc	%icc,	%g6,	%o0
	edge8ln	%l0,	%g4,	%i7
	fcmpne16	%f16,	%f18,	%l6
	move	%icc,	%g5,	%g1
	restore %i1, %i2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%o6,	%i4
	movge	%xcc,	%i3,	%o7
	fmovdn	%xcc,	%f24,	%f23
	stx	%l2,	[%l7 + 0x20]
	sdivx	%l3,	0x192B,	%g2
	fnot1	%f14,	%f24
	move	%xcc,	%l1,	%o3
	movvc	%xcc,	%g3,	%o2
	mova	%xcc,	%i6,	%g7
	or	%o5,	0x1CAA,	%i0
	add	%o4,	0x1AF4,	%l4
	movpos	%icc,	%i5,	%o1
	save %o0, 0x1D81, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g4,	%l0
	udivcc	%l6,	0x03D8,	%g5
	movvs	%xcc,	%i7,	%i1
	fmuld8sux16	%f7,	%f0,	%f10
	ldx	[%l7 + 0x08],	%g1
	movpos	%icc,	%l5,	%o6
	andn	%i2,	0x09FF,	%i4
	or	%o7,	0x12D1,	%l2
	array8	%i3,	%g2,	%l3
	fpadd32s	%f29,	%f18,	%f8
	srl	%o3,	0x1D,	%l1
	fabsd	%f22,	%f26
	array8	%o2,	%i6,	%g7
	sth	%o5,	[%l7 + 0x70]
	fmovsle	%xcc,	%f27,	%f23
	fmovsa	%icc,	%f3,	%f24
	ldd	[%l7 + 0x08],	%f6
	nop
	set	0x6C, %i6
	ldsb	[%l7 + %i6],	%i0
	edge8	%o4,	%l4,	%g3
	orcc	%o1,	%i5,	%o0
	fnot1	%f10,	%f20
	sdivx	%g4,	0x0D53,	%l0
	movrne	%l6,	%g6,	%i7
	ldsh	[%l7 + 0x48],	%g5
	movle	%xcc,	%i1,	%l5
	movvs	%xcc,	%o6,	%i2
	stw	%g1,	[%l7 + 0x64]
	fmul8ulx16	%f24,	%f0,	%f14
	std	%f26,	[%l7 + 0x08]
	sth	%o7,	[%l7 + 0x10]
	popc	%l2,	%i3
	alignaddrl	%i4,	%g2,	%l3
	and	%o3,	%l1,	%o2
	edge16	%i6,	%o5,	%g7
	fmovrdne	%o4,	%f10,	%f20
	fpadd16	%f0,	%f20,	%f4
	xnor	%l4,	%g3,	%o1
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	srl	%o0,	0x06,	%l6
	sub	%g6,	%i7,	%l0
	mova	%xcc,	%i1,	%g5
	fmovrdne	%l5,	%f20,	%f16
	mulscc	%i2,	%o6,	%o7
	nop
	set	0x50, %g2
	ldx	[%l7 + %g2],	%g1
	movrlez	%l2,	0x3E2,	%i3
	std	%f10,	[%l7 + 0x50]
	fpsub16	%f14,	%f20,	%f20
	fornot2s	%f25,	%f26,	%f2
	fmovdcc	%xcc,	%f30,	%f23
	fmovdleu	%xcc,	%f7,	%f12
	restore %i4, 0x12B0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x4C, %g4
	ldsw	[%l7 + %g4],	%o3
	bshuffle	%f16,	%f18,	%f2
	edge16n	%l1,	%o2,	%g2
	fxnor	%f8,	%f14,	%f20
	fcmps	%fcc2,	%f0,	%f6
	fsrc1s	%f30,	%f24
	fmovdgu	%xcc,	%f7,	%f15
	std	%f12,	[%l7 + 0x10]
	mulscc	%i6,	%o5,	%o4
	or	%l4,	%g7,	%g3
	edge32	%i5,	%i0,	%o1
	movne	%icc,	%g4,	%l6
	fcmps	%fcc1,	%f1,	%f30
	movvs	%icc,	%g6,	%i7
	andn	%o0,	0x169A,	%i1
	xor	%g5,	%l5,	%i2
	fpackfix	%f22,	%f15
	stx	%l0,	[%l7 + 0x28]
	fmovsn	%xcc,	%f28,	%f22
	fmovd	%f8,	%f20
	sth	%o7,	[%l7 + 0x78]
	andcc	%o6,	%g1,	%l2
	faligndata	%f16,	%f6,	%f24
	ldx	[%l7 + 0x18],	%i3
	add	%l3,	0x07A3,	%i4
	sra	%o3,	0x10,	%l1
	xorcc	%o2,	0x11D1,	%g2
	stw	%o5,	[%l7 + 0x60]
	srl	%o4,	%l4,	%g7
	subc	%g3,	%i5,	%i0
	sll	%i6,	0x0B,	%o1
	fmovdleu	%icc,	%f26,	%f28
	movl	%icc,	%g4,	%l6
	xorcc	%g6,	0x05FE,	%i7
	movrlez	%i1,	0x269,	%g5
	fxnor	%f10,	%f18,	%f18
	alignaddr	%o0,	%i2,	%l0
	fmovdgu	%icc,	%f0,	%f25
	alignaddrl	%l5,	%o6,	%g1
	movle	%xcc,	%l2,	%i3
	movrlez	%o7,	%l3,	%o3
	fmovsle	%xcc,	%f3,	%f13
	movrne	%i4,	0x101,	%l1
	movcs	%icc,	%g2,	%o2
	edge8	%o4,	%l4,	%g7
	andcc	%g3,	%o5,	%i5
	fmovrde	%i6,	%f18,	%f8
	addc	%o1,	0x1999,	%i0
	movrne	%l6,	%g4,	%g6
	fmovse	%icc,	%f28,	%f21
	movgu	%icc,	%i7,	%g5
	andcc	%i1,	0x08EF,	%o0
	andncc	%l0,	%l5,	%i2
	sub	%o6,	%g1,	%i3
	sll	%l2,	0x0D,	%l3
	sth	%o7,	[%l7 + 0x5A]
	movrgz	%i4,	%o3,	%l1
	siam	0x2
	and	%o2,	0x1777,	%o4
	mulscc	%g2,	%l4,	%g3
	movpos	%icc,	%g7,	%o5
	sdiv	%i5,	0x1F6B,	%i6
	edge16	%o1,	%i0,	%l6
	alignaddrl	%g4,	%g6,	%i7
	lduh	[%l7 + 0x2C],	%g5
	fpackfix	%f6,	%f31
	edge16n	%i1,	%o0,	%l0
	fmovse	%xcc,	%f18,	%f9
	edge8ln	%i2,	%l5,	%g1
	subcc	%o6,	%l2,	%i3
	fzero	%f12
	ldx	[%l7 + 0x08],	%l3
	sir	0x017F
	mulx	%i4,	0x16C6,	%o7
	fcmpgt16	%f30,	%f18,	%l1
	popc	%o2,	%o4
	subc	%o3,	0x036E,	%g2
	edge8l	%g3,	%g7,	%o5
	sra	%l4,	0x01,	%i6
	sir	0x0D98
	std	%f30,	[%l7 + 0x40]
	umul	%i5,	0x17A3,	%i0
	movrgez	%o1,	0x220,	%l6
	fxnor	%f12,	%f0,	%f12
	mulx	%g4,	%i7,	%g5
	addccc	%i1,	%g6,	%o0
	ldd	[%l7 + 0x30],	%f28
	ld	[%l7 + 0x2C],	%f25
	fmovse	%xcc,	%f16,	%f20
	fpack16	%f20,	%f7
	movcc	%icc,	%i2,	%l0
	fmovsn	%xcc,	%f26,	%f6
	ldx	[%l7 + 0x78],	%l5
	movrne	%o6,	%g1,	%l2
	array32	%l3,	%i3,	%i4
	ldsw	[%l7 + 0x68],	%o7
	fnot2	%f2,	%f10
	movne	%icc,	%l1,	%o2
	lduh	[%l7 + 0x5A],	%o3
	orn	%o4,	%g2,	%g3
	edge8	%o5,	%l4,	%g7
	sth	%i5,	[%l7 + 0x22]
	lduw	[%l7 + 0x48],	%i0
	fpmerge	%f31,	%f27,	%f0
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	ldsb	[%l7 + 0x30],	%g4
	popc	%o1,	%g5
	fcmpgt16	%f22,	%f24,	%i1
	array32	%i7,	%o0,	%g6
	st	%f29,	[%l7 + 0x5C]
	ldx	[%l7 + 0x48],	%l0
	movneg	%xcc,	%i2,	%o6
	array16	%g1,	%l2,	%l3
	sth	%i3,	[%l7 + 0x36]
	srl	%l5,	0x1F,	%i4
	stb	%l1,	[%l7 + 0x19]
	edge16	%o2,	%o7,	%o4
	edge16ln	%g2,	%o3,	%g3
	sdivcc	%l4,	0x1455,	%g7
	movvc	%xcc,	%o5,	%i0
	subcc	%i5,	0x0616,	%l6
	pdist	%f6,	%f4,	%f30
	std	%f22,	[%l7 + 0x68]
	sdivcc	%g4,	0x0E24,	%i6
	popc	%g5,	%i1
	st	%f28,	[%l7 + 0x3C]
	alignaddrl	%o1,	%o0,	%g6
	addcc	%i7,	%l0,	%i2
	xnorcc	%o6,	%l2,	%l3
	sll	%g1,	%l5,	%i4
	ldd	[%l7 + 0x10],	%f28
	movrne	%l1,	%i3,	%o2
	edge16	%o4,	%o7,	%o3
	ld	[%l7 + 0x7C],	%f21
	fzeros	%f21
	edge8n	%g3,	%l4,	%g2
	fmovdcc	%icc,	%f27,	%f20
	xorcc	%o5,	0x0896,	%g7
	fcmpgt32	%f6,	%f18,	%i5
	array32	%l6,	%i0,	%g4
	movne	%xcc,	%g5,	%i6
	edge32ln	%i1,	%o0,	%g6
	fandnot2s	%f11,	%f7,	%f13
	add	%o1,	0x102E,	%i7
	add	%l0,	0x13A8,	%i2
	subc	%o6,	%l2,	%l3
	sethi	0x145B,	%g1
	subccc	%l5,	0x08C3,	%l1
	edge16n	%i4,	%i3,	%o2
	umul	%o4,	0x0387,	%o3
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3602
!	Type f   	: 5368
!	Type i   	: 16030
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x5220C5DA
.word 0x2B79C38E
.word 0xCEC69AA1
.word 0xFDBBE3CF
.word 0x5E156CEF
.word 0x264B81C2
.word 0xCE569976
.word 0xDB993C20
.word 0xE7D70E76
.word 0x42E8ECC9
.word 0x000A2DFF
.word 0xBE443F8D
.word 0x4046172C
.word 0xDC44DB07
.word 0xCCB9763A
.word 0x27DED822
.word 0x9AFDB4BE
.word 0xBB3AEF1A
.word 0x683BF53D
.word 0x6394F539
.word 0xDCB6701F
.word 0x9FA702DE
.word 0x96C42FCF
.word 0x3F885992
.word 0xCC8CCD71
.word 0xD0AAB923
.word 0xDD94C3A6
.word 0xD3EDDA0F
.word 0x873BC8DD
.word 0xE11FA518
.word 0x120B8C7B
.word 0xB7BAF799
.word 0x3758EC52
.word 0xCCC9E615
.word 0xA9586C90
.word 0x2DF8C9AC
.word 0x2140C94D
.word 0xCBC63E69
.word 0x22CAEA83
.word 0x9D68E5E2
.word 0x476A457E
.word 0x893FDB3C
.word 0x95D21FD7
.word 0x25CE3EEB
.word 0xFABAC3A2
.word 0x0615DC3A
.word 0x1095BC77
.word 0xF9B85711
.word 0xEB9E9ED3
.word 0x2538AAB2
.word 0x93842E87
.word 0xA0623458
.word 0x0B597F3F
.word 0x5A722B6E
.word 0x276D8CB5
.word 0xB94A73DE
.word 0x32B10EE9
.word 0xFBCE7ADC
.word 0xAC92A884
.word 0xD7EFF170
.word 0xF26EC554
.word 0x6D9233C0
.word 0x8079DC55
.word 0x9B5397EE
.end
