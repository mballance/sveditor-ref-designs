/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f4.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f4.s,v 1.1 2007/05/11 17:22:38 drp Exp $"
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
	setx	0x91A934926057A9F0,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x9,	%g1
	set	0x2,	%g2
	set	0x7,	%g3
	set	0xF,	%g4
	set	0x0,	%g5
	set	0x9,	%g6
	set	0xC,	%g7
	!# Input registers
	set	-0x3,	%i0
	set	-0x8,	%i1
	set	-0x2,	%i2
	set	-0x0,	%i3
	set	-0xA,	%i4
	set	-0x3,	%i5
	set	-0x6,	%i6
	set	-0xB,	%i7
	!# Local registers
	set	0x4A7875A4,	%l0
	set	0x10695F5B,	%l1
	set	0x50451486,	%l2
	set	0x314CAB77,	%l3
	set	0x7A092FA4,	%l4
	set	0x2EA5BF47,	%l5
	set	0x77351988,	%l6
	!# Output registers
	set	0x0B3C,	%o0
	set	0x0A9C,	%o1
	set	-0x1C34,	%o2
	set	0x1587,	%o3
	set	-0x0D5E,	%o4
	set	0x094A,	%o5
	set	-0x0FC5,	%o6
	set	-0x15E6,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x0868F04836490B1E)
	INIT_TH_FP_REG(%l7,%f2,0xDBE35E6C0A53E6FC)
	INIT_TH_FP_REG(%l7,%f4,0x98E802F63DB7A000)
	INIT_TH_FP_REG(%l7,%f6,0xA16D41FD34DE6A97)
	INIT_TH_FP_REG(%l7,%f8,0x0E931087A001AD1B)
	INIT_TH_FP_REG(%l7,%f10,0x6A3B066BF1FCAA7B)
	INIT_TH_FP_REG(%l7,%f12,0xAD5459ACA0F7491B)
	INIT_TH_FP_REG(%l7,%f14,0x074A70F8EEED961D)
	INIT_TH_FP_REG(%l7,%f16,0xB0D01C4243448B27)
	INIT_TH_FP_REG(%l7,%f18,0xB06B85A1FA8753AA)
	INIT_TH_FP_REG(%l7,%f20,0x3F8E1CFA52A31DA4)
	INIT_TH_FP_REG(%l7,%f22,0xCEC0C78B9084A287)
	INIT_TH_FP_REG(%l7,%f24,0x496ADACFEA37E93E)
	INIT_TH_FP_REG(%l7,%f26,0xC13F4F5EA3555400)
	INIT_TH_FP_REG(%l7,%f28,0xD3EA688593CD013C)
	INIT_TH_FP_REG(%l7,%f30,0x92F02598F1CBD244)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movcc	%xcc,	%l0,	%i1
	sdivx	%i0,	0x129A,	%g7
	ldsh	[%l7 + 0x52],	%o5
	orcc	%i4,	0x1886,	%l2
	sra	%i3,	%o4,	%o3
	move	%icc,	%o6,	%o0
	movvc	%xcc,	%o7,	%i6
	std	%f28,	[%l7 + 0x40]
	alignaddr	%g4,	%i7,	%g2
	stx	%g5,	[%l7 + 0x58]
	edge8	%i2,	%l3,	%g3
	edge8	%l6,	%i5,	%g6
	movpos	%xcc,	%o1,	%o2
	st	%f7,	[%l7 + 0x1C]
	fabss	%f23,	%f27
	movle	%xcc,	%l4,	%g1
	srax	%l1,	0x09,	%l0
	fmovsne	%xcc,	%f2,	%f27
	edge16	%i1,	%i0,	%g7
	orcc	%o5,	%l5,	%i4
	smulcc	%l2,	%o4,	%o3
	ldsw	[%l7 + 0x34],	%i3
	movleu	%xcc,	%o6,	%o0
	edge16ln	%i6,	%o7,	%g4
	orcc	%g2,	%i7,	%g5
	sll	%l3,	%i2,	%l6
	andn	%i5,	%g3,	%g6
	edge8n	%o1,	%l4,	%g1
	movvs	%xcc,	%o2,	%l1
	move	%xcc,	%l0,	%i0
	movn	%icc,	%g7,	%o5
	bshuffle	%f26,	%f8,	%f18
	nop
	set	0x20, %g4
	stx	%l5,	[%l7 + %g4]
	alignaddrl	%i1,	%l2,	%i4
	save %o3, 0x0282, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o4,	0x1BFE,	%o6
	edge8ln	%i6,	%o7,	%o0
	fornot2	%f22,	%f28,	%f14
	fornot1	%f8,	%f24,	%f8
	edge8n	%g4,	%i7,	%g2
	fornot2s	%f9,	%f30,	%f13
	fmovdne	%icc,	%f25,	%f31
	sub	%l3,	%g5,	%l6
	orcc	%i5,	0x0BCC,	%g3
	edge16ln	%i2,	%o1,	%g6
	movrne	%l4,	0x3E7,	%o2
	ldd	[%l7 + 0x10],	%g0
	edge32l	%l1,	%i0,	%l0
	srlx	%g7,	%l5,	%i1
	sth	%l2,	[%l7 + 0x6A]
	edge32l	%i4,	%o3,	%o5
	fmovsg	%icc,	%f15,	%f2
	nop
	set	0x3C, %l1
	ldub	[%l7 + %l1],	%o4
	fpsub16s	%f28,	%f6,	%f2
	fcmped	%fcc1,	%f28,	%f14
	fmovdl	%xcc,	%f29,	%f21
	fsrc2s	%f29,	%f8
	fcmpeq32	%f8,	%f4,	%o6
	movle	%xcc,	%i3,	%i6
	lduw	[%l7 + 0x10],	%o0
	edge32n	%g4,	%o7,	%g2
	movl	%xcc,	%i7,	%l3
	edge16l	%l6,	%g5,	%i5
	alignaddrl	%i2,	%o1,	%g3
	stb	%g6,	[%l7 + 0x0F]
	subccc	%o2,	%g1,	%l1
	fmovdg	%xcc,	%f23,	%f8
	edge32n	%l4,	%i0,	%g7
	fmovrdgz	%l5,	%f6,	%f6
	orncc	%i1,	%l2,	%l0
	movvc	%icc,	%i4,	%o5
	movgu	%icc,	%o3,	%o6
	lduw	[%l7 + 0x58],	%i3
	fmovdge	%icc,	%f8,	%f28
	array16	%o4,	%o0,	%i6
	or	%g4,	%o7,	%g2
	fpsub16s	%f31,	%f29,	%f0
	stb	%l3,	[%l7 + 0x21]
	edge8	%i7,	%g5,	%l6
	faligndata	%f22,	%f14,	%f8
	restore %i2, %o1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g6,	0x16F8,	%g3
	smulcc	%g1,	%o2,	%l4
	and	%l1,	0x0A6A,	%i0
	sir	0x0238
	subccc	%g7,	%l5,	%l2
	movg	%xcc,	%i1,	%i4
	movcc	%icc,	%l0,	%o5
	srl	%o6,	0x16,	%o3
	ldsw	[%l7 + 0x5C],	%i3
	andncc	%o4,	%o0,	%i6
	movne	%icc,	%g4,	%o7
	sir	0x1419
	srlx	%g2,	%l3,	%i7
	sllx	%l6,	%g5,	%o1
	movne	%icc,	%i5,	%g6
	edge8n	%i2,	%g3,	%g1
	smul	%o2,	%l1,	%l4
	fcmple16	%f6,	%f12,	%g7
	movrlz	%l5,	0x0DB,	%i0
	movne	%xcc,	%i1,	%i4
	movvc	%xcc,	%l0,	%o5
	ldx	[%l7 + 0x38],	%l2
	fmul8x16	%f8,	%f16,	%f4
	srl	%o3,	%o6,	%o4
	movcc	%xcc,	%i3,	%o0
	movrlz	%g4,	0x06F,	%o7
	subccc	%i6,	0x150A,	%g2
	subc	%l3,	0x177A,	%i7
	fmovdgu	%icc,	%f22,	%f24
	or	%l6,	%g5,	%i5
	edge32l	%o1,	%i2,	%g3
	movn	%icc,	%g6,	%g1
	fpadd16	%f14,	%f14,	%f10
	fmovd	%f8,	%f14
	sra	%o2,	%l4,	%l1
	sra	%l5,	0x07,	%i0
	save %g7, 0x03A8, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l0,	0x0480,	%o5
	umulcc	%l2,	%o3,	%o6
	sdivx	%i1,	0x0A4C,	%i3
	fmovsneg	%xcc,	%f13,	%f27
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	fornot2s	%f28,	%f10,	%f23
	movge	%xcc,	%i6,	%o0
	array32	%l3,	%i7,	%l6
	orn	%g2,	%g5,	%i5
	movrgz	%o1,	%i2,	%g3
	srlx	%g1,	%o2,	%l4
	edge8	%l1,	%l5,	%g6
	save %i0, 0x09C2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%l0,	%i4
	subc	%o5,	%l2,	%o6
	fandnot1	%f6,	%f30,	%f6
	movre	%o3,	%i1,	%o4
	smul	%g4,	0x0897,	%i3
	edge16n	%i6,	%o0,	%o7
	edge32l	%i7,	%l6,	%g2
	fmovdcc	%icc,	%f31,	%f28
	srax	%g5,	%i5,	%o1
	fexpand	%f28,	%f18
	array16	%l3,	%i2,	%g3
	sdivx	%g1,	0x056D,	%l4
	edge16ln	%l1,	%o2,	%l5
	fmovdvs	%xcc,	%f3,	%f24
	umul	%g6,	0x1EDB,	%g7
	fmuld8ulx16	%f12,	%f27,	%f2
	movgu	%xcc,	%l0,	%i0
	ldd	[%l7 + 0x18],	%f8
	sdivx	%o5,	0x16C7,	%i4
	array16	%o6,	%l2,	%o3
	mulscc	%i1,	%o4,	%i3
	fpadd16s	%f12,	%f13,	%f28
	array16	%i6,	%o0,	%o7
	fmovsle	%icc,	%f26,	%f25
	fmovsneg	%icc,	%f2,	%f12
	xnor	%g4,	%i7,	%g2
	fmovscs	%icc,	%f16,	%f5
	fmovdne	%xcc,	%f25,	%f24
	fmovrslez	%l6,	%f2,	%f7
	fmovrsne	%g5,	%f26,	%f25
	movvc	%icc,	%i5,	%l3
	stx	%i2,	[%l7 + 0x28]
	mulx	%o1,	%g3,	%l4
	edge16n	%g1,	%o2,	%l5
	stw	%l1,	[%l7 + 0x38]
	fmovsne	%xcc,	%f14,	%f28
	sub	%g6,	%l0,	%i0
	movpos	%xcc,	%g7,	%i4
	movle	%xcc,	%o5,	%l2
	sdivcc	%o6,	0x04F0,	%o3
	stw	%i1,	[%l7 + 0x10]
	array32	%o4,	%i3,	%o0
	fmovrdgz	%i6,	%f4,	%f14
	udivcc	%g4,	0x0716,	%i7
	and	%o7,	0x1357,	%l6
	nop
	set	0x3B, %g1
	ldsb	[%l7 + %g1],	%g5
	movn	%xcc,	%g2,	%l3
	sll	%i5,	0x07,	%o1
	array32	%g3,	%i2,	%l4
	subc	%o2,	0x0C46,	%g1
	restore %l5, 0x0E5B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g6,	0x068E,	%i0
	fmul8sux16	%f10,	%f2,	%f26
	movneg	%xcc,	%g7,	%i4
	fpadd16s	%f8,	%f6,	%f27
	movn	%xcc,	%l0,	%o5
	fcmpne16	%f8,	%f8,	%l2
	ldub	[%l7 + 0x73],	%o3
	fcmped	%fcc3,	%f10,	%f14
	edge8	%o6,	%i1,	%o4
	edge32l	%i3,	%i6,	%o0
	fcmple32	%f22,	%f8,	%g4
	st	%f24,	[%l7 + 0x34]
	ldub	[%l7 + 0x37],	%o7
	movge	%icc,	%i7,	%l6
	fcmps	%fcc1,	%f11,	%f9
	fmovrdgez	%g2,	%f22,	%f24
	or	%g5,	0x0FE0,	%l3
	mulx	%i5,	%g3,	%i2
	movge	%xcc,	%o1,	%o2
	smulcc	%g1,	0x062D,	%l5
	nop
	set	0x1C, %l5
	lduw	[%l7 + %l5],	%l1
	stb	%l4,	[%l7 + 0x53]
	fone	%f12
	fmovsneg	%icc,	%f27,	%f17
	ldsh	[%l7 + 0x7C],	%g6
	ldsb	[%l7 + 0x53],	%g7
	fmovscs	%icc,	%f29,	%f22
	fmovd	%f18,	%f12
	edge16n	%i4,	%i0,	%l0
	fmovdpos	%icc,	%f13,	%f12
	fpmerge	%f11,	%f30,	%f24
	fpadd16	%f6,	%f8,	%f26
	ldsw	[%l7 + 0x44],	%o5
	xorcc	%l2,	0x06F1,	%o3
	st	%f14,	[%l7 + 0x28]
	fmovsle	%xcc,	%f31,	%f5
	fpack16	%f16,	%f12
	udiv	%o6,	0x1E23,	%o4
	ldsb	[%l7 + 0x7D],	%i1
	sra	%i6,	%i3,	%g4
	fxnor	%f2,	%f16,	%f12
	xorcc	%o0,	%o7,	%i7
	popc	%g2,	%l6
	movg	%icc,	%l3,	%i5
	fmovdcs	%icc,	%f19,	%f4
	umul	%g3,	0x04FE,	%g5
	movge	%icc,	%o1,	%i2
	ldd	[%l7 + 0x08],	%f30
	fmovdneg	%icc,	%f29,	%f21
	sllx	%g1,	%o2,	%l5
	array8	%l4,	%g6,	%g7
	nop
	set	0x08, %o1
	std	%f24,	[%l7 + %o1]
	move	%xcc,	%l1,	%i0
	stb	%i4,	[%l7 + 0x23]
	subc	%l0,	0x1A72,	%o5
	stw	%l2,	[%l7 + 0x74]
	srax	%o3,	0x19,	%o6
	sdivx	%o4,	0x0AFA,	%i1
	mova	%icc,	%i3,	%g4
	ldd	[%l7 + 0x10],	%o0
	movn	%xcc,	%o7,	%i7
	xor	%i6,	0x021A,	%g2
	mulscc	%l3,	0x0076,	%l6
	sra	%g3,	%i5,	%g5
	xorcc	%i2,	%g1,	%o2
	lduw	[%l7 + 0x30],	%l5
	fcmpne16	%f30,	%f8,	%l4
	addc	%o1,	%g6,	%l1
	movn	%icc,	%i0,	%i4
	edge32ln	%g7,	%l0,	%o5
	movneg	%icc,	%l2,	%o6
	stx	%o3,	[%l7 + 0x68]
	sethi	0x0786,	%i1
	fmul8x16au	%f13,	%f18,	%f14
	save %i3, 0x1A68, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o0,	%g4,	%o7
	mulscc	%i6,	0x0ECE,	%g2
	st	%f23,	[%l7 + 0x44]
	ldsh	[%l7 + 0x14],	%l3
	sub	%l6,	0x1879,	%g3
	sll	%i5,	%g5,	%i7
	smulcc	%i2,	0x1A38,	%g1
	edge8n	%l5,	%o2,	%o1
	fmovrde	%l4,	%f28,	%f16
	fpack16	%f8,	%f29
	fmovdvs	%icc,	%f20,	%f24
	stb	%g6,	[%l7 + 0x25]
	movn	%icc,	%l1,	%i4
	fexpand	%f30,	%f4
	edge32l	%g7,	%i0,	%o5
	fmovsneg	%xcc,	%f4,	%f3
	ldd	[%l7 + 0x70],	%l2
	ldsh	[%l7 + 0x6E],	%l0
	orcc	%o6,	%o3,	%i3
	movn	%xcc,	%i1,	%o4
	srl	%g4,	0x05,	%o7
	sdiv	%i6,	0x0FED,	%o0
	mulx	%l3,	0x11CF,	%g2
	save %l6, 0x0D07, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i5,	%i7
	alignaddrl	%g5,	%i2,	%g1
	movn	%xcc,	%l5,	%o2
	movrlz	%o1,	%g6,	%l1
	mova	%icc,	%i4,	%l4
	sth	%g7,	[%l7 + 0x68]
	pdist	%f22,	%f0,	%f28
	fmovdvc	%xcc,	%f11,	%f2
	edge8	%i0,	%o5,	%l2
	srlx	%l0,	0x08,	%o6
	movcs	%icc,	%i3,	%o3
	ldsw	[%l7 + 0x2C],	%i1
	fands	%f5,	%f2,	%f23
	movne	%icc,	%g4,	%o7
	movvc	%xcc,	%i6,	%o0
	subccc	%o4,	0x0464,	%g2
	edge16n	%l3,	%l6,	%i5
	alignaddrl	%g3,	%g5,	%i2
	smul	%i7,	0x1A43,	%g1
	movvc	%xcc,	%l5,	%o2
	edge8n	%g6,	%l1,	%i4
	movge	%xcc,	%o1,	%g7
	fmovsvs	%xcc,	%f18,	%f31
	fzeros	%f1
	std	%f12,	[%l7 + 0x20]
	orn	%i0,	%o5,	%l4
	subc	%l2,	%l0,	%o6
	nop
	set	0x24, %l0
	ldsw	[%l7 + %l0],	%i3
	sdivx	%o3,	0x13D0,	%g4
	array32	%i1,	%o7,	%o0
	fcmpes	%fcc2,	%f21,	%f25
	sllx	%i6,	0x15,	%o4
	sethi	0x1D8B,	%l3
	fnot2s	%f11,	%f2
	sethi	0x124E,	%l6
	mova	%icc,	%g2,	%g3
	nop
	set	0x40, %i3
	stx	%g5,	[%l7 + %i3]
	movrlez	%i5,	%i7,	%g1
	array32	%i2,	%l5,	%g6
	fcmpeq32	%f8,	%f26,	%l1
	movg	%icc,	%i4,	%o1
	ldub	[%l7 + 0x33],	%o2
	movrne	%i0,	0x2D7,	%o5
	edge32ln	%g7,	%l4,	%l0
	std	%f20,	[%l7 + 0x60]
	fmovdn	%icc,	%f18,	%f20
	edge16n	%o6,	%i3,	%l2
	sth	%o3,	[%l7 + 0x0E]
	std	%f16,	[%l7 + 0x18]
	fmovsleu	%xcc,	%f13,	%f27
	movne	%xcc,	%g4,	%o7
	orncc	%i1,	0x1197,	%i6
	movleu	%xcc,	%o4,	%o0
	umul	%l6,	%g2,	%g3
	nop
	set	0x18, %o7
	sth	%l3,	[%l7 + %o7]
	movre	%g5,	%i5,	%i7
	movneg	%icc,	%g1,	%i2
	sdivcc	%g6,	0x00AD,	%l5
	fcmps	%fcc3,	%f31,	%f9
	movn	%icc,	%i4,	%o1
	edge8	%o2,	%l1,	%i0
	orcc	%o5,	0x07F4,	%g7
	subccc	%l4,	%o6,	%l0
	xorcc	%i3,	0x1A31,	%l2
	mulscc	%o3,	%o7,	%i1
	fmovscc	%xcc,	%f13,	%f19
	sub	%i6,	%g4,	%o4
	st	%f9,	[%l7 + 0x08]
	srlx	%o0,	0x02,	%l6
	subcc	%g2,	0x1628,	%l3
	movneg	%xcc,	%g5,	%g3
	fmovdle	%icc,	%f9,	%f29
	movrlz	%i7,	0x3DB,	%i5
	fmovscs	%xcc,	%f24,	%f11
	sub	%i2,	%g6,	%l5
	movpos	%icc,	%g1,	%i4
	movpos	%icc,	%o2,	%o1
	movrlez	%i0,	0x20E,	%l1
	ldsw	[%l7 + 0x40],	%o5
	edge8	%g7,	%l4,	%o6
	mulx	%l0,	0x1AFF,	%i3
	sra	%o3,	%l2,	%i1
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%o7
	movge	%xcc,	%i6,	%o4
	stx	%g4,	[%l7 + 0x38]
	sub	%o0,	0x00C8,	%g2
	edge16ln	%l6,	%g5,	%g3
	xor	%l3,	0x0E14,	%i5
	movgu	%xcc,	%i2,	%i7
	xorcc	%l5,	%g1,	%g6
	udivx	%i4,	0x10D5,	%o1
	umulcc	%o2,	%i0,	%l1
	mulscc	%o5,	0x0FC7,	%l4
	movgu	%xcc,	%o6,	%l0
	fsrc2s	%f10,	%f30
	srl	%i3,	%g7,	%o3
	fornot1s	%f6,	%f12,	%f23
	edge8	%i1,	%l2,	%o7
	movne	%icc,	%i6,	%g4
	alignaddr	%o4,	%g2,	%l6
	std	%f8,	[%l7 + 0x60]
	sdiv	%g5,	0x0D35,	%o0
	edge16ln	%l3,	%g3,	%i5
	movre	%i2,	0x24F,	%l5
	movle	%icc,	%g1,	%g6
	edge8n	%i7,	%o1,	%i4
	addccc	%o2,	%i0,	%o5
	ldsw	[%l7 + 0x50],	%l1
	edge8n	%l4,	%o6,	%l0
	srlx	%i3,	0x10,	%o3
	movgu	%icc,	%i1,	%l2
	fnands	%f6,	%f28,	%f21
	movpos	%xcc,	%g7,	%i6
	fmovsg	%xcc,	%f23,	%f25
	fand	%f8,	%f26,	%f8
	or	%g4,	0x0563,	%o4
	edge16l	%g2,	%o7,	%g5
	fmovda	%xcc,	%f9,	%f18
	std	%f16,	[%l7 + 0x50]
	edge16l	%o0,	%l6,	%g3
	subccc	%l3,	%i2,	%l5
	stw	%i5,	[%l7 + 0x08]
	udiv	%g6,	0x1B3B,	%i7
	stb	%g1,	[%l7 + 0x2E]
	fnor	%f0,	%f0,	%f6
	sth	%i4,	[%l7 + 0x4E]
	fnor	%f14,	%f8,	%f14
	sethi	0x0490,	%o2
	array32	%o1,	%i0,	%o5
	movrne	%l4,	%l1,	%o6
	movcc	%xcc,	%i3,	%l0
	sra	%o3,	0x1C,	%i1
	sdivcc	%g7,	0x179D,	%i6
	edge8l	%l2,	%o4,	%g2
	fcmple16	%f20,	%f18,	%o7
	fmovs	%f21,	%f4
	ldsw	[%l7 + 0x08],	%g5
	movcs	%icc,	%o0,	%g4
	fabss	%f8,	%f19
	save %l6, %g3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	0x0421,	%i5
	orn	%i2,	0x19B9,	%g6
	alignaddrl	%i7,	%g1,	%i4
	movle	%icc,	%o2,	%i0
	movgu	%xcc,	%o1,	%o5
	save %l4, %o6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l0,	%o3,	%l1
	andcc	%g7,	%i6,	%i1
	movleu	%xcc,	%l2,	%o4
	orn	%o7,	%g5,	%g2
	andcc	%o0,	%g4,	%g3
	ldsw	[%l7 + 0x50],	%l6
	ld	[%l7 + 0x74],	%f17
	fpsub16s	%f30,	%f5,	%f13
	subccc	%l3,	0x1B6F,	%l5
	srlx	%i2,	%i5,	%g6
	sll	%i7,	0x1E,	%g1
	fexpand	%f14,	%f16
	udivx	%i4,	0x0BF6,	%i0
	xnor	%o2,	%o5,	%o1
	or	%l4,	0x0441,	%i3
	srl	%l0,	0x02,	%o6
	mulscc	%o3,	0x0B08,	%l1
	alignaddr	%i6,	%i1,	%l2
	lduw	[%l7 + 0x60],	%g7
	fpackfix	%f24,	%f23
	smulcc	%o7,	%g5,	%o4
	movne	%icc,	%g2,	%o0
	srlx	%g3,	0x05,	%g4
	array32	%l6,	%l5,	%l3
	sth	%i5,	[%l7 + 0x3A]
	stx	%g6,	[%l7 + 0x10]
	xnorcc	%i7,	%i2,	%i4
	fmovdneg	%xcc,	%f28,	%f3
	movg	%xcc,	%i0,	%o2
	sdivx	%g1,	0x0B24,	%o5
	fands	%f0,	%f31,	%f12
	fpadd16s	%f4,	%f25,	%f6
	fornot2s	%f21,	%f29,	%f19
	popc	0x1B65,	%o1
	fmovda	%xcc,	%f19,	%f9
	sra	%l4,	%i3,	%l0
	edge16n	%o3,	%o6,	%l1
	fandnot2	%f6,	%f18,	%f12
	popc	0x16AE,	%i1
	orn	%l2,	%i6,	%g7
	edge16l	%g5,	%o7,	%o4
	add	%o0,	0x172E,	%g3
	edge32l	%g2,	%g4,	%l5
	alignaddr	%l6,	%i5,	%l3
	edge32l	%i7,	%g6,	%i2
	fmovsleu	%xcc,	%f19,	%f23
	fmovdvs	%icc,	%f6,	%f25
	popc	%i0,	%i4
	movrlez	%g1,	0x16F,	%o2
	xnorcc	%o5,	%o1,	%i3
	move	%icc,	%l4,	%o3
	xnor	%o6,	0x07CD,	%l1
	fzero	%f26
	fxnors	%f24,	%f2,	%f30
	fmovdcc	%xcc,	%f11,	%f1
	movvc	%icc,	%l0,	%l2
	movrne	%i6,	%i1,	%g7
	edge32n	%g5,	%o4,	%o7
	fmovde	%xcc,	%f28,	%f31
	array16	%g3,	%o0,	%g2
	addccc	%l5,	%l6,	%g4
	xnor	%l3,	%i5,	%i7
	edge32ln	%g6,	%i2,	%i4
	ldd	[%l7 + 0x08],	%i0
	fmovsl	%icc,	%f29,	%f20
	orcc	%o2,	0x157C,	%g1
	sub	%o1,	%i3,	%l4
	orn	%o5,	%o6,	%l1
	stx	%l0,	[%l7 + 0x28]
	umul	%o3,	0x16FC,	%i6
	orn	%l2,	0x007E,	%i1
	movge	%xcc,	%g5,	%o4
	fmovsgu	%icc,	%f29,	%f3
	fabss	%f22,	%f24
	fcmpgt16	%f24,	%f10,	%o7
	addcc	%g7,	0x026D,	%g3
	movg	%icc,	%o0,	%g2
	mulscc	%l5,	%g4,	%l3
	mulscc	%l6,	0x017D,	%i5
	movcc	%icc,	%i7,	%g6
	mulscc	%i4,	%i2,	%o2
	edge16ln	%i0,	%o1,	%i3
	fpackfix	%f18,	%f29
	stx	%l4,	[%l7 + 0x18]
	array16	%o5,	%g1,	%o6
	smul	%l0,	%l1,	%o3
	sdivx	%i6,	0x0377,	%l2
	movneg	%icc,	%i1,	%o4
	movg	%xcc,	%o7,	%g5
	fcmpne32	%f2,	%f2,	%g3
	popc	%o0,	%g7
	fxnors	%f24,	%f27,	%f25
	smul	%g2,	%l5,	%l3
	movrgez	%l6,	0x0B9,	%g4
	andncc	%i7,	%g6,	%i4
	fmovdgu	%icc,	%f20,	%f18
	fnot2	%f0,	%f12
	addccc	%i2,	0x1348,	%o2
	fmul8sux16	%f16,	%f26,	%f24
	edge16n	%i5,	%o1,	%i3
	movrgz	%i0,	%l4,	%o5
	fmovrdlez	%g1,	%f14,	%f14
	or	%l0,	0x1E4B,	%l1
	orcc	%o6,	0x0421,	%i6
	alignaddr	%l2,	%i1,	%o4
	edge16n	%o3,	%g5,	%g3
	edge32n	%o0,	%o7,	%g7
	smul	%g2,	0x0347,	%l5
	add	%l3,	%g4,	%i7
	sth	%g6,	[%l7 + 0x2E]
	umulcc	%l6,	0x17BF,	%i2
	and	%i4,	0x1374,	%i5
	fmuld8ulx16	%f24,	%f11,	%f6
	fmovsge	%xcc,	%f30,	%f14
	fpack32	%f10,	%f22,	%f20
	fcmps	%fcc1,	%f0,	%f29
	movcc	%icc,	%o1,	%i3
	fmovdg	%icc,	%f31,	%f23
	mulscc	%o2,	%l4,	%o5
	subcc	%i0,	%l0,	%l1
	umulcc	%o6,	%g1,	%i6
	fmovdvs	%icc,	%f26,	%f16
	edge16n	%i1,	%l2,	%o4
	movrlez	%o3,	0x14E,	%g3
	edge8ln	%o0,	%o7,	%g5
	sra	%g7,	%g2,	%l5
	fones	%f18
	xorcc	%l3,	%g4,	%g6
	edge8ln	%i7,	%l6,	%i2
	sdivcc	%i4,	0x1925,	%i5
	stb	%o1,	[%l7 + 0x4D]
	ldsw	[%l7 + 0x48],	%i3
	sra	%o2,	0x06,	%l4
	nop
	set	0x7C, %i0
	lduh	[%l7 + %i0],	%i0
	edge32	%l0,	%l1,	%o5
	fpmerge	%f27,	%f26,	%f12
	srlx	%g1,	%o6,	%i6
	sdiv	%i1,	0x044B,	%o4
	fmovdcs	%xcc,	%f2,	%f29
	fcmpd	%fcc3,	%f4,	%f18
	xorcc	%l2,	%g3,	%o3
	fmovspos	%xcc,	%f16,	%f10
	sdivcc	%o0,	0x05BC,	%o7
	ldx	[%l7 + 0x68],	%g5
	lduw	[%l7 + 0x64],	%g2
	ldd	[%l7 + 0x30],	%l4
	array16	%g7,	%l3,	%g6
	fmovde	%icc,	%f14,	%f26
	movcs	%xcc,	%i7,	%l6
	xnorcc	%g4,	%i2,	%i4
	stx	%i5,	[%l7 + 0x70]
	move	%xcc,	%i3,	%o1
	movgu	%icc,	%o2,	%i0
	fmovscc	%icc,	%f5,	%f1
	xor	%l4,	0x0B0B,	%l0
	xnorcc	%l1,	%o5,	%o6
	stx	%g1,	[%l7 + 0x70]
	pdist	%f12,	%f28,	%f26
	or	%i6,	%i1,	%o4
	stx	%g3,	[%l7 + 0x30]
	movge	%icc,	%o3,	%o0
	andncc	%o7,	%l2,	%g2
	stb	%l5,	[%l7 + 0x47]
	sllx	%g5,	0x0F,	%g7
	udivx	%l3,	0x051B,	%g6
	movrgez	%l6,	%g4,	%i2
	orcc	%i7,	%i5,	%i3
	sdiv	%o1,	0x12C4,	%o2
	edge32ln	%i4,	%i0,	%l0
	fmovrdgez	%l1,	%f18,	%f22
	st	%f22,	[%l7 + 0x48]
	edge16n	%l4,	%o5,	%g1
	mova	%icc,	%i6,	%o6
	sllx	%o4,	%g3,	%i1
	srl	%o0,	0x03,	%o7
	fmovrslez	%o3,	%f22,	%f3
	edge32	%l2,	%l5,	%g2
	fmovrse	%g7,	%f22,	%f5
	sir	0x1809
	mulscc	%l3,	0x1490,	%g6
	movrgez	%g5,	0x0D4,	%g4
	std	%f30,	[%l7 + 0x10]
	fnot2	%f2,	%f6
	srl	%l6,	0x12,	%i2
	lduw	[%l7 + 0x50],	%i5
	sdiv	%i3,	0x13A7,	%o1
	save %i7, 0x1E7A, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i0,	%i4,	%l1
	stb	%l0,	[%l7 + 0x7E]
	mova	%icc,	%o5,	%g1
	xor	%i6,	%l4,	%o4
	array16	%o6,	%i1,	%g3
	edge8	%o7,	%o0,	%l2
	sethi	0x19E8,	%l5
	add	%o3,	%g7,	%g2
	orncc	%g6,	0x1838,	%l3
	andn	%g5,	%l6,	%g4
	fmovsle	%xcc,	%f1,	%f5
	xnorcc	%i2,	%i3,	%i5
	fcmpgt32	%f26,	%f2,	%i7
	sdivx	%o1,	0x1D31,	%o2
	edge16ln	%i0,	%i4,	%l1
	sdiv	%o5,	0x0509,	%l0
	fmovsleu	%icc,	%f27,	%f8
	andncc	%g1,	%l4,	%i6
	fmovdvc	%xcc,	%f29,	%f6
	fandnot1	%f12,	%f8,	%f2
	fmovsl	%icc,	%f15,	%f19
	edge8	%o4,	%i1,	%o6
	stb	%o7,	[%l7 + 0x71]
	fandnot1s	%f24,	%f31,	%f2
	movvs	%xcc,	%g3,	%l2
	fmovrdgz	%l5,	%f22,	%f22
	fmovrdgz	%o0,	%f10,	%f28
	movge	%xcc,	%g7,	%g2
	std	%f12,	[%l7 + 0x38]
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	sub	%o3,	%g4,	%i2
	ldx	[%l7 + 0x40],	%l6
	fnands	%f19,	%f22,	%f14
	fpsub32	%f22,	%f24,	%f4
	movle	%xcc,	%i3,	%i5
	movcc	%icc,	%o1,	%o2
	movvs	%icc,	%i7,	%i0
	lduh	[%l7 + 0x5E],	%i4
	movg	%xcc,	%l1,	%l0
	fmuld8ulx16	%f11,	%f22,	%f30
	subcc	%g1,	%l4,	%i6
	sdiv	%o5,	0x1F26,	%i1
	ld	[%l7 + 0x0C],	%f30
	fmovsl	%xcc,	%f30,	%f15
	nop
	set	0x4E, %l6
	ldub	[%l7 + %l6],	%o6
	orncc	%o4,	%o7,	%l2
	array16	%l5,	%o0,	%g3
	edge32ln	%g7,	%g2,	%l3
	movpos	%icc,	%g6,	%o3
	movg	%xcc,	%g5,	%i2
	addcc	%g4,	%i3,	%l6
	sdiv	%o1,	0x138E,	%o2
	edge32n	%i7,	%i0,	%i4
	smulcc	%i5,	0x038D,	%l1
	movrlz	%g1,	0x202,	%l4
	movge	%icc,	%i6,	%l0
	fmovscc	%icc,	%f29,	%f29
	fcmpes	%fcc1,	%f15,	%f17
	alignaddr	%i1,	%o6,	%o5
	edge8l	%o7,	%o4,	%l2
	movrlez	%l5,	%g3,	%g7
	andn	%g2,	%o0,	%l3
	xnor	%g6,	0x1881,	%g5
	movle	%icc,	%o3,	%g4
	fmovdle	%icc,	%f11,	%f31
	movrne	%i3,	0x021,	%i2
	sllx	%l6,	0x18,	%o1
	fnegs	%f17,	%f28
	edge32n	%i7,	%o2,	%i4
	andncc	%i0,	%i5,	%g1
	subc	%l4,	0x0F0B,	%i6
	lduh	[%l7 + 0x2C],	%l1
	save %l0, 0x025E, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o5,	%o7,	%i1
	popc	%o4,	%l5
	fmovdg	%icc,	%f7,	%f5
	fandnot2	%f8,	%f8,	%f20
	umul	%l2,	0x0C76,	%g7
	movrgez	%g2,	0x0BA,	%g3
	fmul8sux16	%f2,	%f6,	%f10
	fnegd	%f16,	%f6
	fmovdne	%icc,	%f19,	%f15
	fand	%f22,	%f30,	%f26
	fmovrdne	%l3,	%f0,	%f18
	fmovsgu	%xcc,	%f30,	%f3
	fzeros	%f29
	edge8n	%g6,	%o0,	%g5
	edge16ln	%g4,	%i3,	%o3
	alignaddr	%l6,	%o1,	%i2
	stx	%i7,	[%l7 + 0x28]
	addcc	%i4,	0x1922,	%o2
	udivx	%i0,	0x0185,	%g1
	add	%i5,	0x19B5,	%i6
	sth	%l4,	[%l7 + 0x2C]
	and	%l1,	%l0,	%o5
	fands	%f29,	%f18,	%f26
	fnot2	%f10,	%f24
	and	%o6,	%i1,	%o4
	alignaddr	%l5,	%l2,	%o7
	or	%g2,	%g3,	%g7
	subc	%l3,	0x074E,	%o0
	fmovsgu	%icc,	%f1,	%f26
	fors	%f2,	%f0,	%f27
	edge32ln	%g6,	%g5,	%g4
	movn	%xcc,	%i3,	%o3
	movrgez	%o1,	%l6,	%i2
	movpos	%xcc,	%i7,	%o2
	fnot1	%f12,	%f0
	sdivcc	%i4,	0x17C1,	%g1
	movne	%icc,	%i0,	%i6
	edge16l	%i5,	%l1,	%l4
	umulcc	%l0,	%o5,	%o6
	fmovdne	%icc,	%f27,	%f12
	lduh	[%l7 + 0x0C],	%i1
	movrlz	%l5,	0x38A,	%o4
	movpos	%icc,	%l2,	%g2
	fnot1	%f4,	%f8
	sll	%g3,	%o7,	%g7
	fones	%f20
	movre	%l3,	0x3EF,	%g6
	andcc	%g5,	0x0646,	%g4
	andncc	%o0,	%i3,	%o1
	fmovdge	%xcc,	%f16,	%f8
	fnot2	%f24,	%f4
	movrlz	%o3,	0x095,	%i2
	lduh	[%l7 + 0x54],	%i7
	smul	%l6,	0x0477,	%o2
	fmovdg	%icc,	%f11,	%f27
	smulcc	%i4,	0x1CFD,	%i0
	nop
	set	0x53, %i4
	stb	%g1,	[%l7 + %i4]
	edge32	%i6,	%i5,	%l1
	fcmpne32	%f8,	%f16,	%l0
	fsrc1	%f30,	%f0
	movne	%icc,	%o5,	%l4
	movrgez	%o6,	0x269,	%l5
	ldsh	[%l7 + 0x32],	%o4
	subccc	%i1,	%l2,	%g2
	edge16ln	%o7,	%g7,	%l3
	ldx	[%l7 + 0x18],	%g3
	sub	%g6,	%g4,	%o0
	alignaddr	%i3,	%o1,	%g5
	movvs	%xcc,	%i2,	%o3
	move	%icc,	%l6,	%o2
	edge8l	%i4,	%i0,	%g1
	nop
	set	0x32, %g7
	ldub	[%l7 + %g7],	%i7
	sll	%i5,	0x18,	%i6
	smul	%l0,	%l1,	%o5
	fmovrsgz	%l4,	%f25,	%f20
	array32	%l5,	%o4,	%i1
	fzero	%f6
	popc	%l2,	%g2
	sra	%o6,	%o7,	%g7
	fmovrslez	%l3,	%f15,	%f13
	stx	%g6,	[%l7 + 0x30]
	fnands	%f25,	%f25,	%f28
	nop
	set	0x30, %l4
	sth	%g4,	[%l7 + %l4]
	edge16l	%g3,	%i3,	%o1
	move	%icc,	%g5,	%o0
	sub	%i2,	%l6,	%o2
	edge32	%o3,	%i0,	%g1
	movge	%xcc,	%i4,	%i5
	fcmps	%fcc2,	%f25,	%f25
	fmovdge	%icc,	%f19,	%f25
	alignaddr	%i7,	%l0,	%l1
	std	%f22,	[%l7 + 0x70]
	addc	%o5,	%l4,	%i6
	fpsub16	%f26,	%f4,	%f0
	movg	%xcc,	%l5,	%i1
	restore %l2, 0x06F2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o6,	0x0FC6,	%o4
	subccc	%o7,	0x17AD,	%l3
	sir	0x04A0
	fmovdge	%xcc,	%f29,	%f29
	fmovsgu	%xcc,	%f12,	%f2
	addcc	%g7,	0x1D6B,	%g4
	ldub	[%l7 + 0x38],	%g6
	add	%i3,	%o1,	%g5
	edge16ln	%o0,	%g3,	%i2
	movge	%xcc,	%l6,	%o3
	umul	%i0,	%o2,	%i4
	stx	%i5,	[%l7 + 0x78]
	ldd	[%l7 + 0x18],	%g0
	udivcc	%l0,	0x067B,	%i7
	fpadd16s	%f13,	%f4,	%f23
	ldsh	[%l7 + 0x16],	%l1
	movneg	%icc,	%o5,	%i6
	edge32ln	%l5,	%i1,	%l4
	ldsw	[%l7 + 0x60],	%g2
	sll	%l2,	%o6,	%o4
	movrgez	%o7,	%g7,	%l3
	fornot1s	%f13,	%f28,	%f21
	sllx	%g4,	0x11,	%i3
	umulcc	%g6,	0x0298,	%o1
	fmovdne	%xcc,	%f21,	%f22
	movgu	%xcc,	%g5,	%o0
	sir	0x0A84
	ldd	[%l7 + 0x18],	%f30
	fmovdgu	%xcc,	%f31,	%f17
	fmovrslz	%g3,	%f6,	%f3
	udivcc	%i2,	0x192B,	%l6
	andcc	%i0,	%o3,	%o2
	fmovdge	%xcc,	%f20,	%f13
	fmovsleu	%xcc,	%f19,	%f5
	edge16n	%i4,	%g1,	%l0
	movrlz	%i5,	0x14F,	%l1
	udiv	%o5,	0x0EBB,	%i6
	movvc	%xcc,	%i7,	%l5
	xnorcc	%l4,	0x153F,	%i1
	subccc	%g2,	%o6,	%o4
	ldsb	[%l7 + 0x5F],	%l2
	sllx	%g7,	%o7,	%l3
	umulcc	%g4,	%g6,	%o1
	movvc	%icc,	%g5,	%i3
	andn	%g3,	%i2,	%o0
	movcc	%xcc,	%i0,	%o3
	fmul8x16	%f25,	%f4,	%f24
	fones	%f2
	movn	%xcc,	%o2,	%l6
	fcmpeq16	%f26,	%f16,	%g1
	movneg	%xcc,	%i4,	%l0
	fmovdg	%xcc,	%f21,	%f6
	edge8	%i5,	%o5,	%i6
	mulx	%i7,	%l1,	%l5
	sir	0x0071
	movre	%l4,	0x19C,	%g2
	fcmped	%fcc0,	%f30,	%f4
	ldd	[%l7 + 0x28],	%o6
	subcc	%i1,	%l2,	%o4
	edge16	%o7,	%l3,	%g7
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	edge32ln	%g5,	%g4,	%g3
	ldd	[%l7 + 0x70],	%i2
	fabss	%f18,	%f7
	edge16l	%i2,	%o0,	%i0
	orcc	%o3,	0x0605,	%l6
	srax	%o2,	0x13,	%g1
	stw	%i4,	[%l7 + 0x14]
	stx	%l0,	[%l7 + 0x28]
	mova	%icc,	%i5,	%i6
	alignaddr	%o5,	%l1,	%l5
	fmovdcs	%xcc,	%f11,	%f7
	fmovde	%icc,	%f11,	%f15
	movl	%icc,	%i7,	%l4
	addccc	%g2,	0x0B48,	%i1
	fmovdle	%xcc,	%f28,	%f23
	ldsh	[%l7 + 0x3E],	%l2
	movrgez	%o6,	%o4,	%o7
	movcc	%xcc,	%l3,	%g6
	fmovscc	%icc,	%f10,	%f7
	movg	%icc,	%o1,	%g5
	fmovdge	%xcc,	%f8,	%f9
	alignaddr	%g7,	%g4,	%g3
	fxor	%f18,	%f4,	%f10
	fxnor	%f20,	%f4,	%f28
	save %i3, %i2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x48],	%f12
	orcc	%o3,	%l6,	%o2
	movneg	%icc,	%o0,	%i4
	mova	%xcc,	%g1,	%i5
	xnor	%i6,	0x0935,	%l0
	restore %l1, %l5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l4,	%o5
	andcc	%i1,	%g2,	%l2
	fors	%f10,	%f28,	%f0
	fmovdvs	%xcc,	%f24,	%f13
	sub	%o6,	0x0EAA,	%o4
	move	%xcc,	%l3,	%o7
	udiv	%o1,	0x157E,	%g5
	fmovsl	%icc,	%f30,	%f18
	movrlez	%g7,	%g4,	%g6
	movge	%icc,	%i3,	%i2
	nop
	set	0x22, %o5
	sth	%g3,	[%l7 + %o5]
	movvs	%xcc,	%i0,	%l6
	sdiv	%o3,	0x0610,	%o2
	movg	%icc,	%o0,	%i4
	movvs	%xcc,	%g1,	%i5
	edge8l	%l0,	%l1,	%l5
	st	%f5,	[%l7 + 0x2C]
	orncc	%i7,	0x1E7A,	%i6
	xor	%o5,	%l4,	%i1
	fmovdcs	%xcc,	%f14,	%f23
	sdivcc	%g2,	0x1C6C,	%o6
	udivx	%o4,	0x1D64,	%l3
	addc	%l2,	%o1,	%g5
	fmovdneg	%icc,	%f31,	%f5
	edge8	%g7,	%g4,	%g6
	fmul8sux16	%f10,	%f12,	%f28
	fcmpd	%fcc3,	%f18,	%f22
	ld	[%l7 + 0x6C],	%f11
	fcmps	%fcc2,	%f10,	%f4
	srlx	%i3,	%o7,	%g3
	edge32	%i0,	%l6,	%i2
	sir	0x01C9
	lduh	[%l7 + 0x5C],	%o3
	srax	%o2,	0x1C,	%i4
	xorcc	%o0,	%i5,	%l0
	ldd	[%l7 + 0x10],	%g0
	fcmpne16	%f22,	%f24,	%l1
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	fmovdleu	%icc,	%f14,	%f9
	movleu	%icc,	%o5,	%l4
	lduw	[%l7 + 0x44],	%i1
	fmuld8ulx16	%f17,	%f3,	%f24
	mulx	%i6,	%o6,	%g2
	fnot2s	%f24,	%f11
	edge8n	%o4,	%l3,	%l2
	movcc	%icc,	%o1,	%g7
	fmovse	%icc,	%f29,	%f8
	orn	%g5,	0x1588,	%g6
	fmovscs	%xcc,	%f20,	%f29
	save %g4, %o7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i3,	%i0
	movneg	%xcc,	%l6,	%i2
	addcc	%o2,	%o3,	%o0
	edge8l	%i4,	%l0,	%i5
	fmovsneg	%icc,	%f29,	%f24
	movl	%xcc,	%l1,	%g1
	orcc	%i7,	%l5,	%l4
	xnor	%o5,	%i1,	%i6
	subccc	%g2,	%o4,	%o6
	stw	%l2,	[%l7 + 0x2C]
	edge8n	%o1,	%g7,	%g5
	sethi	0x0758,	%g6
	fmovdpos	%icc,	%f26,	%f3
	srlx	%g4,	0x16,	%l3
	xor	%o7,	%g3,	%i3
	movg	%icc,	%i0,	%i2
	movneg	%xcc,	%l6,	%o2
	movpos	%xcc,	%o3,	%i4
	nop
	set	0x1E, %i2
	lduh	[%l7 + %i2],	%l0
	ld	[%l7 + 0x1C],	%f25
	edge8n	%i5,	%o0,	%g1
	udivcc	%i7,	0x12C5,	%l1
	xnorcc	%l5,	0x0B29,	%o5
	movpos	%icc,	%i1,	%l4
	fexpand	%f17,	%f6
	sdiv	%g2,	0x17C5,	%i6
	andcc	%o6,	%o4,	%l2
	array8	%o1,	%g5,	%g6
	restore %g7, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o7,	%g3,	%i3
	movl	%icc,	%i2,	%i0
	ld	[%l7 + 0x30],	%f24
	movpos	%xcc,	%o2,	%o3
	edge32n	%i4,	%l0,	%i5
	ldx	[%l7 + 0x20],	%l6
	sdiv	%g1,	0x10F7,	%o0
	srax	%l1,	%i7,	%o5
	movg	%xcc,	%i1,	%l4
	movneg	%xcc,	%l5,	%g2
	fmovdneg	%xcc,	%f15,	%f22
	mova	%icc,	%o6,	%o4
	edge16l	%l2,	%i6,	%g5
	mulscc	%g6,	%o1,	%g7
	movrlez	%g4,	0x178,	%l3
	umulcc	%o7,	0x078B,	%g3
	array16	%i2,	%i3,	%i0
	edge16l	%o3,	%i4,	%l0
	edge16l	%o2,	%i5,	%g1
	sdiv	%o0,	0x0E5D,	%l1
	fabsd	%f20,	%f28
	movle	%icc,	%i7,	%l6
	nop
	set	0x48, %i1
	ldsw	[%l7 + %i1],	%i1
	lduw	[%l7 + 0x14],	%l4
	lduh	[%l7 + 0x7E],	%l5
	movvc	%xcc,	%o5,	%o6
	fandnot2	%f0,	%f18,	%f2
	std	%f30,	[%l7 + 0x60]
	alignaddrl	%g2,	%l2,	%o4
	fnot2s	%f2,	%f4
	movn	%xcc,	%g5,	%g6
	addccc	%i6,	0x1D32,	%g7
	udivcc	%o1,	0x1F16,	%g4
	movg	%xcc,	%l3,	%o7
	edge8ln	%g3,	%i2,	%i3
	andcc	%o3,	0x0AF8,	%i0
	lduw	[%l7 + 0x0C],	%i4
	fornot2	%f20,	%f20,	%f6
	sdivcc	%l0,	0x165B,	%i5
	fmovsn	%xcc,	%f5,	%f7
	fnot2	%f4,	%f6
	array16	%g1,	%o0,	%o2
	movge	%icc,	%i7,	%l6
	ldsw	[%l7 + 0x14],	%l1
	mulscc	%i1,	0x0941,	%l5
	sll	%l4,	%o6,	%o5
	movge	%xcc,	%l2,	%o4
	nop
	set	0x74, %o0
	ldsb	[%l7 + %o0],	%g5
	fmovdn	%xcc,	%f26,	%f5
	std	%f4,	[%l7 + 0x70]
	srlx	%g6,	%i6,	%g2
	movvc	%icc,	%o1,	%g4
	fmovsgu	%xcc,	%f12,	%f4
	xor	%l3,	%o7,	%g7
	fnot2	%f0,	%f22
	save %g3, %i3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i2,	0x1C3A,	%i4
	sir	0x059F
	stw	%l0,	[%l7 + 0x64]
	fsrc2s	%f8,	%f12
	save %i0, %i5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f2,	%f22,	%f10
	xnorcc	%o0,	%i7,	%l6
	fcmpeq16	%f16,	%f2,	%o2
	sdivx	%l1,	0x0CDB,	%i1
	std	%f12,	[%l7 + 0x48]
	std	%f0,	[%l7 + 0x60]
	sir	0x031F
	fzero	%f28
	fpsub32	%f18,	%f10,	%f16
	fpack32	%f16,	%f24,	%f26
	nop
	set	0x08, %g6
	std	%f30,	[%l7 + %g6]
	movgu	%xcc,	%l4,	%l5
	srax	%o5,	0x05,	%l2
	movrlz	%o4,	%o6,	%g6
	fmovdpos	%xcc,	%f12,	%f19
	movrlez	%i6,	0x2C0,	%g5
	subccc	%g2,	%g4,	%o1
	andncc	%o7,	%l3,	%g7
	srax	%g3,	0x0D,	%i3
	movvc	%icc,	%o3,	%i4
	fcmpeq16	%f26,	%f24,	%l0
	edge32l	%i2,	%i0,	%g1
	and	%i5,	%o0,	%i7
	movne	%icc,	%o2,	%l6
	orn	%i1,	%l1,	%l4
	fornot2	%f20,	%f2,	%f26
	edge16n	%o5,	%l5,	%l2
	sub	%o4,	0x0302,	%o6
	fxnor	%f8,	%f20,	%f10
	movrlz	%g6,	0x23C,	%i6
	mulscc	%g2,	0x0B74,	%g4
	faligndata	%f4,	%f30,	%f20
	orn	%o1,	0x0211,	%o7
	fandnot2	%f4,	%f18,	%f2
	sub	%g5,	%g7,	%l3
	movre	%i3,	%g3,	%i4
	addccc	%o3,	%l0,	%i0
	udiv	%i2,	0x1A89,	%g1
	ldd	[%l7 + 0x38],	%f30
	sdivx	%o0,	0x12DB,	%i7
	xor	%o2,	%l6,	%i5
	movgu	%xcc,	%l1,	%l4
	fmovsl	%xcc,	%f14,	%f23
	array8	%i1,	%o5,	%l2
	popc	0x089A,	%o4
	movcc	%xcc,	%o6,	%g6
	save %i6, %g2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l5,	%o1
	sra	%g5,	%g7,	%o7
	sdivcc	%i3,	0x1647,	%g3
	sllx	%i4,	0x1E,	%o3
	edge8l	%l0,	%i0,	%i2
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	stx	%g1,	[%l7 + 0x58]
	srax	%o2,	0x0B,	%i7
	ldd	[%l7 + 0x48],	%f2
	andn	%i5,	%l6,	%l1
	xnor	%l4,	0x171A,	%o5
	movcc	%icc,	%i1,	%l2
	addcc	%o6,	0x1FA8,	%o4
	movneg	%xcc,	%i6,	%g2
	umulcc	%g4,	%l5,	%o1
	movge	%icc,	%g6,	%g7
	fmovrdgz	%g5,	%f18,	%f10
	ldsw	[%l7 + 0x08],	%i3
	sll	%o7,	%g3,	%o3
	edge8ln	%i4,	%l0,	%i2
	edge8n	%i0,	%o0,	%l3
	sll	%o2,	%g1,	%i7
	fmovdn	%icc,	%f27,	%f31
	nop
	set	0x13, %o4
	ldub	[%l7 + %o4],	%l6
	std	%f8,	[%l7 + 0x70]
	ldsw	[%l7 + 0x64],	%l1
	fmovsle	%icc,	%f8,	%f26
	orn	%i5,	%l4,	%o5
	fmovrsgz	%i1,	%f15,	%f30
	fmovsl	%icc,	%f24,	%f8
	movrne	%o6,	%l2,	%i6
	xnorcc	%g2,	0x1BE3,	%o4
	array16	%g4,	%o1,	%l5
	or	%g6,	%g5,	%i3
	ldub	[%l7 + 0x70],	%o7
	mulscc	%g3,	%o3,	%i4
	addccc	%l0,	%i2,	%g7
	lduw	[%l7 + 0x40],	%o0
	movvc	%icc,	%i0,	%o2
	fmovsvs	%icc,	%f29,	%f0
	or	%l3,	0x09AF,	%i7
	fnands	%f22,	%f11,	%f13
	movge	%xcc,	%g1,	%l1
	edge8	%i5,	%l6,	%o5
	edge32ln	%i1,	%o6,	%l2
	fcmpne16	%f10,	%f24,	%l4
	add	%i6,	%g2,	%o4
	nop
	set	0x1C, %g2
	ldsw	[%l7 + %g2],	%o1
	sdivx	%g4,	0x0D27,	%l5
	fcmpeq32	%f16,	%f24,	%g6
	movcc	%icc,	%i3,	%o7
	popc	%g3,	%g5
	movre	%i4,	%l0,	%o3
	fpsub16	%f26,	%f10,	%f2
	add	%g7,	%o0,	%i0
	movpos	%icc,	%i2,	%o2
	fpack16	%f28,	%f6
	edge8	%l3,	%i7,	%l1
	movrgez	%g1,	0x3F7,	%l6
	xnor	%i5,	0x0175,	%i1
	movgu	%xcc,	%o6,	%l2
	st	%f22,	[%l7 + 0x44]
	edge16	%l4,	%i6,	%o5
	srl	%o4,	%o1,	%g4
	sub	%g2,	%l5,	%g6
	movn	%xcc,	%o7,	%i3
	xnor	%g3,	0x0BF9,	%g5
	edge8ln	%i4,	%o3,	%g7
	ldsb	[%l7 + 0x12],	%l0
	fcmped	%fcc0,	%f14,	%f14
	addcc	%i0,	%o0,	%o2
	addcc	%i2,	%l3,	%l1
	fmovrse	%g1,	%f13,	%f25
	edge8ln	%i7,	%i5,	%l6
	mulscc	%i1,	%l2,	%l4
	fandnot2s	%f29,	%f30,	%f9
	movrgez	%o6,	0x294,	%o5
	movcc	%xcc,	%i6,	%o4
	edge8	%g4,	%g2,	%l5
	for	%f0,	%f20,	%f22
	fabss	%f27,	%f20
	movrgez	%g6,	%o7,	%i3
	movrgz	%o1,	%g3,	%i4
	addc	%g5,	0x101E,	%g7
	edge32l	%l0,	%i0,	%o3
	addc	%o0,	%o2,	%l3
	movg	%icc,	%l1,	%i2
	sub	%g1,	0x0429,	%i7
	sra	%i5,	%l6,	%i1
	movcs	%xcc,	%l4,	%l2
	sra	%o5,	0x0F,	%i6
	array16	%o4,	%o6,	%g4
	or	%l5,	%g6,	%o7
	xnorcc	%i3,	%o1,	%g2
	fcmped	%fcc2,	%f28,	%f28
	fcmpd	%fcc0,	%f22,	%f14
	for	%f30,	%f16,	%f20
	fpsub32	%f4,	%f0,	%f28
	sra	%i4,	0x1F,	%g5
	fcmpne32	%f14,	%f20,	%g7
	fxors	%f6,	%f16,	%f16
	edge16ln	%l0,	%i0,	%g3
	udivcc	%o3,	0x027A,	%o2
	subc	%l3,	0x0E74,	%l1
	fmovdneg	%xcc,	%f11,	%f17
	andncc	%i2,	%o0,	%g1
	array32	%i5,	%l6,	%i1
	fmovdvc	%xcc,	%f24,	%f8
	fmovsl	%xcc,	%f26,	%f20
	fmul8x16al	%f14,	%f31,	%f6
	andn	%i7,	%l2,	%o5
	orn	%l4,	%o4,	%i6
	orcc	%o6,	%l5,	%g4
	edge8ln	%g6,	%o7,	%o1
	add	%i3,	%g2,	%g5
	fnegs	%f5,	%f22
	fmul8x16au	%f24,	%f28,	%f2
	sra	%i4,	0x15,	%g7
	movge	%icc,	%l0,	%g3
	movvs	%icc,	%i0,	%o2
	srax	%o3,	0x16,	%l3
	fcmpne16	%f26,	%f22,	%l1
	movn	%icc,	%i2,	%o0
	subcc	%g1,	%l6,	%i5
	fnand	%f14,	%f14,	%f20
	movgu	%icc,	%i7,	%i1
	fpackfix	%f18,	%f21
	lduh	[%l7 + 0x4A],	%l2
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%l4
	or	%o5,	%i6,	%o6
	movrgz	%l5,	%o4,	%g4
	subccc	%o7,	0x0A73,	%g6
	orn	%i3,	%g2,	%g5
	ldd	[%l7 + 0x60],	%f20
	movrlz	%i4,	0x24D,	%o1
	sir	0x090F
	movn	%icc,	%g7,	%l0
	ldx	[%l7 + 0x40],	%g3
	sub	%i0,	%o2,	%o3
	fxors	%f24,	%f9,	%f29
	fpadd32	%f20,	%f28,	%f28
	movpos	%icc,	%l1,	%i2
	umulcc	%o0,	%l3,	%g1
	ldsw	[%l7 + 0x24],	%l6
	fcmpgt32	%f18,	%f20,	%i7
	ldub	[%l7 + 0x79],	%i5
	movg	%xcc,	%i1,	%l4
	sub	%l2,	0x0BA7,	%i6
	stw	%o5,	[%l7 + 0x78]
	srax	%o6,	0x02,	%o4
	umulcc	%g4,	0x162C,	%o7
	fnegs	%f30,	%f28
	edge16n	%l5,	%i3,	%g2
	udivcc	%g6,	0x1283,	%i4
	st	%f10,	[%l7 + 0x50]
	smul	%o1,	%g5,	%g7
	edge32l	%l0,	%g3,	%i0
	fnot1	%f26,	%f8
	fmovdle	%xcc,	%f1,	%f14
	edge8n	%o3,	%l1,	%o2
	edge16l	%i2,	%o0,	%l3
	edge8l	%l6,	%i7,	%i5
	for	%f4,	%f20,	%f6
	ldx	[%l7 + 0x60],	%g1
	umul	%l4,	0x1120,	%l2
	stb	%i6,	[%l7 + 0x6E]
	fornot1	%f4,	%f26,	%f26
	orcc	%o5,	0x1B8B,	%i1
	sub	%o6,	0x033F,	%g4
	fornot2	%f20,	%f4,	%f16
	edge16	%o7,	%o4,	%l5
	sth	%g2,	[%l7 + 0x2C]
	fmovdpos	%icc,	%f9,	%f26
	fmovscs	%icc,	%f28,	%f3
	stb	%i3,	[%l7 + 0x72]
	edge8	%g6,	%i4,	%g5
	subccc	%o1,	%l0,	%g3
	umulcc	%i0,	0x18FC,	%o3
	fcmped	%fcc0,	%f16,	%f6
	udiv	%g7,	0x1C04,	%o2
	edge32	%i2,	%o0,	%l3
	movcc	%xcc,	%l1,	%i7
	fandnot2s	%f31,	%f30,	%f30
	xorcc	%l6,	%g1,	%i5
	edge16n	%l4,	%i6,	%l2
	restore %o5, 0x094E, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x30],	%i1
	fmovsgu	%icc,	%f5,	%f20
	array32	%g4,	%o4,	%l5
	orncc	%o7,	0x040C,	%g2
	fzeros	%f5
	movne	%icc,	%g6,	%i3
	add	%i4,	%g5,	%o1
	fmovrdne	%g3,	%f14,	%f0
	movrlz	%i0,	0x2A5,	%l0
	movre	%g7,	%o2,	%o3
	subc	%i2,	0x191C,	%l3
	fcmpeq32	%f22,	%f20,	%l1
	fnands	%f29,	%f15,	%f18
	ldsh	[%l7 + 0x34],	%i7
	lduw	[%l7 + 0x34],	%o0
	ldd	[%l7 + 0x20],	%f30
	edge32ln	%g1,	%l6,	%l4
	array16	%i5,	%l2,	%o5
	array8	%i6,	%o6,	%i1
	ldub	[%l7 + 0x74],	%g4
	umul	%o4,	0x0475,	%l5
	array8	%g2,	%g6,	%o7
	fnor	%f18,	%f2,	%f18
	mulx	%i3,	%g5,	%o1
	alignaddr	%i4,	%i0,	%l0
	add	%g3,	%o2,	%g7
	save %o3, %i2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l3,	%o0,	%i7
	save %l6, 0x192F, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i5,	0x1B3D,	%g1
	fmovsl	%icc,	%f23,	%f25
	movle	%icc,	%l2,	%o5
	stb	%o6,	[%l7 + 0x43]
	movle	%icc,	%i1,	%g4
	movne	%icc,	%i6,	%l5
	movleu	%xcc,	%g2,	%g6
	ldd	[%l7 + 0x60],	%f2
	srl	%o4,	%i3,	%o7
	ldd	[%l7 + 0x48],	%f20
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%g4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	array32	%i4,	%l0,	%g3
	addcc	%o2,	0x0F18,	%o3
	srlx	%g7,	0x01,	%i2
	movrgez	%l3,	0x2B7,	%o0
	movneg	%xcc,	%i7,	%l1
	fmovsneg	%icc,	%f28,	%f2
	sub	%l4,	0x05DB,	%i5
	udivcc	%g1,	0x0EE7,	%l6
	mulscc	%o5,	0x176B,	%l2
	lduw	[%l7 + 0x64],	%o6
	fpmerge	%f10,	%f30,	%f8
	fnot2	%f8,	%f14
	popc	0x119C,	%i1
	fone	%f26
	ld	[%l7 + 0x2C],	%f16
	xnor	%i6,	%g4,	%l5
	movvs	%icc,	%g2,	%o4
	fnot2	%f8,	%f6
	movre	%i3,	%o7,	%g5
	orncc	%g6,	0x1DFB,	%i0
	fpadd16	%f0,	%f12,	%f12
	restore %i4, 0x106D, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o1,	0x117C,	%g3
	fcmpgt32	%f2,	%f10,	%o3
	ldd	[%l7 + 0x60],	%g6
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	movg	%icc,	%l3,	%i7
	movrne	%l1,	%o0,	%l4
	mova	%icc,	%i5,	%l6
	sethi	0x1C93,	%o5
	fmovrdlez	%l2,	%f30,	%f18
	movg	%xcc,	%o6,	%g1
	fmovdneg	%icc,	%f28,	%f10
	ldsh	[%l7 + 0x16],	%i1
	fpsub16	%f30,	%f26,	%f14
	xnorcc	%i6,	0x163F,	%l5
	srl	%g2,	0x1C,	%o4
	move	%icc,	%g4,	%o7
	ld	[%l7 + 0x18],	%f20
	addccc	%i3,	0x1E78,	%g6
	movpos	%xcc,	%g5,	%i4
	movg	%icc,	%i0,	%o1
	mulx	%g3,	%l0,	%g7
	smulcc	%o2,	0x0A79,	%i2
	fpadd32	%f8,	%f20,	%f14
	edge8	%l3,	%o3,	%i7
	smul	%l1,	%o0,	%l4
	array16	%i5,	%l6,	%o5
	ldsb	[%l7 + 0x40],	%o6
	mulscc	%l2,	0x0109,	%g1
	edge16n	%i1,	%l5,	%i6
	sra	%g2,	%o4,	%g4
	alignaddr	%o7,	%g6,	%i3
	std	%f30,	[%l7 + 0x08]
	stx	%i4,	[%l7 + 0x58]
	fornot1s	%f27,	%f7,	%f24
	mulx	%i0,	0x12A2,	%g5
	stw	%g3,	[%l7 + 0x08]
	fnot2	%f20,	%f6
	movvc	%icc,	%l0,	%o1
	srax	%g7,	%i2,	%l3
	save %o2, 0x1038, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f24,	%f26,	%o3
	popc	0x1520,	%l1
	fornot1	%f16,	%f16,	%f14
	st	%f9,	[%l7 + 0x3C]
	fnot2	%f0,	%f2
	fmovrse	%o0,	%f5,	%f25
	movle	%xcc,	%i5,	%l6
	edge32l	%o5,	%o6,	%l2
	fcmpeq32	%f6,	%f6,	%g1
	popc	%l4,	%l5
	addccc	%i6,	0x08EE,	%g2
	lduw	[%l7 + 0x44],	%i1
	smulcc	%g4,	0x1F1C,	%o7
	sdivcc	%o4,	0x0285,	%i3
	siam	0x5
	fcmpgt16	%f26,	%f28,	%i4
	faligndata	%f22,	%f4,	%f14
	sth	%i0,	[%l7 + 0x7C]
	move	%icc,	%g5,	%g3
	andn	%g6,	%l0,	%o1
	array16	%i2,	%l3,	%o2
	ldd	[%l7 + 0x40],	%g6
	fmovsa	%xcc,	%f18,	%f16
	array32	%o3,	%l1,	%o0
	addcc	%i5,	0x1B74,	%i7
	movrlz	%l6,	0x371,	%o6
	edge16	%l2,	%g1,	%o5
	srl	%l4,	%i6,	%l5
	ld	[%l7 + 0x74],	%f2
	movrlz	%g2,	%i1,	%g4
	movrlez	%o7,	0x2AB,	%o4
	addccc	%i3,	%i4,	%g5
	movre	%i0,	%g6,	%l0
	fmovrdgez	%o1,	%f4,	%f0
	fpsub16	%f10,	%f24,	%f12
	ldx	[%l7 + 0x28],	%g3
	andncc	%l3,	%o2,	%i2
	movvs	%xcc,	%g7,	%o3
	fmovdl	%icc,	%f15,	%f21
	andncc	%o0,	%i5,	%l1
	alignaddrl	%l6,	%o6,	%l2
	movrlez	%i7,	0x311,	%g1
	edge8l	%o5,	%i6,	%l4
	udiv	%l5,	0x0BB8,	%i1
	xorcc	%g2,	%g4,	%o4
	array16	%o7,	%i4,	%i3
	save %i0, %g6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g5,	%o1,	%g3
	fmovdgu	%icc,	%f4,	%f18
	fmovsl	%icc,	%f6,	%f9
	fmovd	%f10,	%f12
	mulx	%l3,	0x0E2D,	%i2
	fcmpne16	%f8,	%f18,	%o2
	movvs	%icc,	%g7,	%o0
	subcc	%i5,	0x0E80,	%o3
	ldsh	[%l7 + 0x16],	%l1
	ld	[%l7 + 0x1C],	%f13
	fmuld8sux16	%f6,	%f19,	%f4
	sll	%o6,	0x15,	%l2
	fmovdl	%icc,	%f30,	%f24
	movge	%xcc,	%l6,	%g1
	movcc	%icc,	%i7,	%i6
	fmovdg	%icc,	%f21,	%f0
	fmovsg	%xcc,	%f30,	%f8
	movrne	%o5,	0x278,	%l4
	fmovdcs	%icc,	%f15,	%f11
	movgu	%xcc,	%i1,	%g2
	smul	%l5,	0x0A83,	%g4
	fcmps	%fcc3,	%f20,	%f4
	sdivcc	%o7,	0x0181,	%o4
	fcmpeq32	%f4,	%f18,	%i3
	edge8n	%i0,	%g6,	%i4
	ldd	[%l7 + 0x28],	%l0
	subccc	%o1,	%g3,	%g5
	addccc	%i2,	%o2,	%l3
	umul	%g7,	0x1877,	%i5
	udivx	%o3,	0x0C6F,	%o0
	edge32n	%l1,	%o6,	%l6
	movvs	%xcc,	%g1,	%l2
	srlx	%i6,	0x02,	%i7
	array8	%l4,	%o5,	%i1
	mulx	%l5,	%g2,	%o7
	sdivx	%g4,	0x077F,	%i3
	udivx	%i0,	0x0064,	%o4
	save %g6, %i4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f10,	%f16,	%f28
	udivcc	%g3,	0x0E41,	%g5
	alignaddr	%l0,	%i2,	%o2
	subc	%g7,	0x1BF3,	%i5
	movg	%xcc,	%l3,	%o3
	movgu	%icc,	%l1,	%o6
	udiv	%o0,	0x1476,	%l6
	fmovd	%f8,	%f0
	std	%f30,	[%l7 + 0x70]
	ldsh	[%l7 + 0x5E],	%g1
	edge8l	%l2,	%i6,	%l4
	xorcc	%i7,	0x10F0,	%o5
	fmuld8sux16	%f14,	%f31,	%f24
	movcc	%icc,	%i1,	%l5
	movrgz	%o7,	0x0A9,	%g2
	movg	%icc,	%i3,	%i0
	edge16	%o4,	%g4,	%g6
	fcmpeq16	%f2,	%f28,	%i4
	andncc	%g3,	%g5,	%l0
	movgu	%icc,	%o1,	%o2
	orn	%i2,	0x0209,	%i5
	ldd	[%l7 + 0x10],	%f10
	edge8n	%g7,	%o3,	%l3
	fmovsl	%xcc,	%f26,	%f12
	fnot1	%f0,	%f10
	sdivcc	%o6,	0x0A60,	%o0
	alignaddrl	%l6,	%l1,	%g1
	subcc	%i6,	0x01FB,	%l2
	srlx	%l4,	0x00,	%i7
	edge32ln	%o5,	%l5,	%o7
	fmovdgu	%icc,	%f0,	%f27
	mulx	%i1,	%g2,	%i0
	ldx	[%l7 + 0x60],	%o4
	andn	%i3,	0x1F38,	%g4
	andncc	%g6,	%g3,	%i4
	srl	%l0,	%o1,	%g5
	fsrc1s	%f11,	%f18
	sdiv	%i2,	0x0A45,	%i5
	xorcc	%g7,	0x116C,	%o2
	fnegs	%f18,	%f8
	orncc	%l3,	%o3,	%o0
	movgu	%xcc,	%l6,	%o6
	stb	%l1,	[%l7 + 0x17]
	addc	%g1,	0x1C8F,	%i6
	fxnors	%f6,	%f23,	%f6
	pdist	%f14,	%f18,	%f26
	or	%l4,	0x1479,	%i7
	sub	%o5,	0x1859,	%l5
	st	%f23,	[%l7 + 0x34]
	fmovdpos	%icc,	%f1,	%f8
	fmovsgu	%icc,	%f4,	%f16
	lduh	[%l7 + 0x3E],	%o7
	alignaddrl	%i1,	%l2,	%g2
	and	%i0,	0x0A46,	%i3
	udivx	%g4,	0x1372,	%o4
	orn	%g3,	%g6,	%i4
	restore %l0, %g5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i5,	%i2,	%o2
	fmovdpos	%icc,	%f1,	%f7
	std	%f26,	[%l7 + 0x38]
	movpos	%icc,	%g7,	%l3
	and	%o3,	%o0,	%l6
	edge32	%o6,	%l1,	%g1
	movn	%xcc,	%i6,	%l4
	ld	[%l7 + 0x30],	%f30
	edge8ln	%o5,	%l5,	%i7
	srax	%i1,	%o7,	%g2
	stb	%l2,	[%l7 + 0x30]
	umul	%i3,	0x0E80,	%g4
	st	%f31,	[%l7 + 0x20]
	sir	0x0F13
	fpack16	%f4,	%f9
	fcmped	%fcc3,	%f8,	%f20
	fmovdge	%xcc,	%f4,	%f26
	sll	%i0,	%o4,	%g6
	mova	%xcc,	%g3,	%l0
	ldd	[%l7 + 0x20],	%f6
	nop
	set	0x28, %i7
	stx	%g5,	[%l7 + %i7]
	fsrc2s	%f11,	%f7
	fmul8x16	%f11,	%f24,	%f30
	stb	%o1,	[%l7 + 0x26]
	stb	%i4,	[%l7 + 0x2D]
	fmovdvc	%xcc,	%f31,	%f11
	ldd	[%l7 + 0x70],	%f22
	movre	%i2,	%o2,	%i5
	srl	%l3,	0x03,	%o3
	st	%f13,	[%l7 + 0x6C]
	fandnot2	%f16,	%f6,	%f0
	sdiv	%o0,	0x1A11,	%l6
	fmovsge	%icc,	%f28,	%f8
	andn	%g7,	0x193F,	%o6
	edge32n	%l1,	%i6,	%l4
	edge8ln	%o5,	%g1,	%i7
	sra	%i1,	0x10,	%l5
	edge8l	%g2,	%o7,	%l2
	mova	%xcc,	%g4,	%i3
	add	%i0,	%o4,	%g6
	mulscc	%l0,	%g5,	%o1
	array16	%g3,	%i4,	%o2
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	stb	%o3,	[%l7 + 0x76]
	ldx	[%l7 + 0x78],	%o0
	movn	%xcc,	%l6,	%l3
	edge16ln	%g7,	%o6,	%i6
	addccc	%l4,	0x13A6,	%l1
	array32	%g1,	%o5,	%i7
	orncc	%l5,	0x1CD9,	%g2
	edge32	%i1,	%l2,	%g4
	ldsh	[%l7 + 0x6E],	%o7
	fmovsg	%icc,	%f29,	%f21
	fmovdcs	%xcc,	%f30,	%f22
	nop
	set	0x62, %g5
	ldub	[%l7 + %g5],	%i3
	array32	%i0,	%g6,	%l0
	ld	[%l7 + 0x7C],	%f1
	edge8l	%o4,	%g5,	%g3
	ldx	[%l7 + 0x08],	%i4
	sir	0x0BE5
	fors	%f16,	%f20,	%f12
	sdivcc	%o1,	0x0359,	%i5
	edge16n	%i2,	%o3,	%o0
	udivx	%o2,	0x0A2E,	%l3
	fornot2	%f2,	%f8,	%f30
	fnot2s	%f28,	%f13
	edge16l	%l6,	%g7,	%i6
	movrgez	%o6,	%l1,	%l4
	orcc	%g1,	0x0E11,	%o5
	andncc	%l5,	%g2,	%i7
	fmovsvc	%icc,	%f31,	%f22
	ldd	[%l7 + 0x08],	%f18
	sir	0x1302
	udiv	%i1,	0x0400,	%l2
	srlx	%g4,	0x0A,	%i3
	movrgz	%o7,	%i0,	%l0
	orn	%o4,	%g5,	%g6
	or	%i4,	%o1,	%i5
	edge32ln	%i2,	%g3,	%o3
	edge8	%o0,	%o2,	%l3
	ld	[%l7 + 0x6C],	%f30
	movrlz	%l6,	%g7,	%i6
	movvc	%xcc,	%o6,	%l4
	alignaddr	%l1,	%o5,	%g1
	fcmped	%fcc1,	%f30,	%f8
	edge16n	%g2,	%l5,	%i7
	movrgz	%i1,	%l2,	%i3
	fmovdvs	%xcc,	%f6,	%f10
	edge8n	%o7,	%g4,	%l0
	xorcc	%i0,	%o4,	%g6
	movn	%icc,	%g5,	%i4
	ldsw	[%l7 + 0x10],	%i5
	movleu	%xcc,	%i2,	%o1
	fmuld8ulx16	%f29,	%f2,	%f26
	fmovrdlez	%g3,	%f6,	%f24
	xor	%o3,	%o0,	%o2
	xnorcc	%l3,	0x1816,	%g7
	edge16n	%l6,	%i6,	%l4
	ldx	[%l7 + 0x68],	%o6
	edge8n	%l1,	%o5,	%g2
	movne	%xcc,	%l5,	%i7
	movn	%xcc,	%g1,	%i1
	sllx	%l2,	0x0A,	%i3
	fmovrdne	%g4,	%f2,	%f10
	fmovdge	%icc,	%f31,	%f11
	fcmpeq32	%f6,	%f8,	%o7
	edge8n	%l0,	%i0,	%o4
	lduh	[%l7 + 0x6A],	%g6
	sll	%g5,	%i5,	%i4
	fcmpgt16	%f0,	%f18,	%o1
	edge16ln	%i2,	%o3,	%g3
	movne	%icc,	%o2,	%l3
	lduw	[%l7 + 0x40],	%g7
	fnand	%f12,	%f22,	%f20
	udivx	%l6,	0x1920,	%o0
	udiv	%i6,	0x1E5C,	%l4
	fzero	%f4
	lduh	[%l7 + 0x40],	%o6
	sir	0x01D3
	andn	%l1,	%o5,	%g2
	fmovdleu	%icc,	%f18,	%f6
	edge8l	%l5,	%i7,	%g1
	edge8l	%l2,	%i3,	%g4
	orcc	%o7,	%l0,	%i1
	sth	%i0,	[%l7 + 0x5C]
	umul	%g6,	0x0E47,	%o4
	fmovrde	%i5,	%f2,	%f24
	fandnot2	%f12,	%f14,	%f22
	edge32ln	%g5,	%o1,	%i2
	movpos	%xcc,	%i4,	%g3
	addcc	%o3,	%l3,	%g7
	fpadd16s	%f25,	%f26,	%f7
	fmovrde	%l6,	%f16,	%f30
	fmovdvc	%icc,	%f26,	%f20
	ldd	[%l7 + 0x40],	%f18
	movrgz	%o2,	0x193,	%o0
	array16	%l4,	%i6,	%l1
	orcc	%o6,	0x1F5F,	%o5
	ldsb	[%l7 + 0x27],	%g2
	movle	%icc,	%i7,	%g1
	edge8ln	%l5,	%i3,	%l2
	ldub	[%l7 + 0x46],	%g4
	sdivx	%o7,	0x0A49,	%l0
	edge32ln	%i0,	%g6,	%i1
	subc	%o4,	0x006E,	%g5
	fsrc2s	%f29,	%f13
	fmovrdne	%o1,	%f16,	%f6
	fexpand	%f28,	%f10
	ldsw	[%l7 + 0x38],	%i2
	edge8ln	%i4,	%g3,	%i5
	ldd	[%l7 + 0x60],	%l2
	movvs	%icc,	%g7,	%o3
	smulcc	%o2,	0x1F73,	%o0
	movrgz	%l4,	%l6,	%i6
	movpos	%xcc,	%l1,	%o6
	fzero	%f20
	popc	0x101B,	%o5
	addc	%i7,	0x0280,	%g1
	fmovd	%f16,	%f0
	smul	%l5,	%i3,	%g2
	edge16n	%g4,	%l2,	%o7
	restore %l0, %i0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o4,	%g5,	%o1
	fnegs	%f24,	%f13
	fnor	%f12,	%f24,	%f0
	sdiv	%i2,	0x1545,	%i4
	mulscc	%g3,	%g6,	%l3
	edge16l	%g7,	%i5,	%o2
	udivcc	%o3,	0x0234,	%o0
	udivcc	%l4,	0x00B1,	%i6
	fmovsl	%xcc,	%f31,	%f8
	movpos	%xcc,	%l1,	%o6
	fexpand	%f11,	%f14
	fpsub32s	%f2,	%f25,	%f15
	fmovrdlz	%o5,	%f2,	%f12
	movneg	%icc,	%i7,	%g1
	stb	%l6,	[%l7 + 0x0E]
	movl	%icc,	%i3,	%g2
	subcc	%l5,	%g4,	%o7
	movg	%xcc,	%l0,	%l2
	addccc	%i0,	0x1475,	%o4
	fnot2s	%f20,	%f6
	subccc	%i1,	0x1481,	%o1
	movl	%icc,	%i2,	%g5
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	alignaddrl	%l3,	%g6,	%i5
	lduh	[%l7 + 0x7E],	%g7
	stx	%o2,	[%l7 + 0x30]
	smulcc	%o0,	%l4,	%o3
	restore %l1, 0x1FCC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o5,	%i6,	%g1
	ldd	[%l7 + 0x68],	%f14
	fornot1s	%f3,	%f5,	%f17
	fpackfix	%f26,	%f28
	xor	%i7,	%i3,	%l6
	edge32ln	%g2,	%l5,	%g4
	fmovdvc	%xcc,	%f30,	%f7
	mulscc	%o7,	%l0,	%l2
	sub	%o4,	%i1,	%o1
	ld	[%l7 + 0x3C],	%f4
	udivx	%i2,	0x0351,	%i0
	edge32ln	%i4,	%g3,	%l3
	add	%g6,	0x0B8D,	%i5
	stb	%g5,	[%l7 + 0x5F]
	sll	%o2,	0x15,	%o0
	alignaddrl	%l4,	%o3,	%g7
	udivcc	%l1,	0x0F20,	%o6
	edge16	%o5,	%i6,	%g1
	sth	%i3,	[%l7 + 0x36]
	orcc	%i7,	%g2,	%l5
	array32	%g4,	%o7,	%l0
	orn	%l6,	%l2,	%i1
	fmovsle	%xcc,	%f20,	%f9
	fmovdge	%xcc,	%f20,	%f15
	mulx	%o4,	%o1,	%i0
	movrgz	%i2,	%g3,	%l3
	movl	%xcc,	%i4,	%g6
	movvs	%icc,	%i5,	%g5
	fmovsvc	%xcc,	%f4,	%f0
	movleu	%icc,	%o2,	%l4
	fand	%f6,	%f18,	%f10
	sir	0x03CB
	edge8n	%o0,	%g7,	%o3
	sth	%o6,	[%l7 + 0x36]
	save %o5, %l1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f2,	%f28
	movrgz	%g1,	%i3,	%i7
	and	%g2,	0x11E7,	%l5
	movn	%xcc,	%g4,	%l0
	fmovdge	%xcc,	%f4,	%f27
	addccc	%l6,	%o7,	%l2
	movrlz	%o4,	0x201,	%o1
	fnand	%f12,	%f26,	%f16
	fmovsg	%icc,	%f13,	%f18
	fmovdpos	%icc,	%f23,	%f25
	mulx	%i0,	%i2,	%g3
	umulcc	%i1,	%i4,	%g6
	movre	%i5,	%g5,	%l3
	fnands	%f21,	%f16,	%f30
	movvs	%icc,	%l4,	%o2
	sth	%g7,	[%l7 + 0x66]
	movl	%xcc,	%o3,	%o6
	fmovrdne	%o5,	%f14,	%f12
	andn	%o0,	0x09B5,	%l1
	lduw	[%l7 + 0x58],	%i6
	smulcc	%i3,	%g1,	%g2
	fmovsn	%icc,	%f2,	%f17
	xnorcc	%l5,	0x0AEA,	%i7
	fmovdcc	%xcc,	%f26,	%f4
	movvc	%xcc,	%l0,	%l6
	mova	%icc,	%o7,	%g4
	fxors	%f17,	%f5,	%f3
	srax	%o4,	0x01,	%o1
	move	%icc,	%i0,	%i2
	movg	%icc,	%g3,	%l2
	xnorcc	%i1,	0x0152,	%g6
	udivcc	%i5,	0x1EFB,	%i4
	subcc	%l3,	%g5,	%o2
	sdiv	%l4,	0x0862,	%g7
	ld	[%l7 + 0x10],	%f25
	ldsb	[%l7 + 0x7A],	%o6
	lduw	[%l7 + 0x38],	%o3
	fcmpgt32	%f14,	%f2,	%o5
	sdiv	%o0,	0x1BE2,	%l1
	xorcc	%i6,	0x1655,	%g1
	andcc	%i3,	0x0FF9,	%l5
	xorcc	%g2,	0x122D,	%l0
	movleu	%icc,	%i7,	%l6
	movrlez	%g4,	%o7,	%o1
	fmovsa	%xcc,	%f17,	%f29
	lduh	[%l7 + 0x12],	%o4
	alignaddr	%i2,	%g3,	%l2
	udivcc	%i1,	0x17F2,	%i0
	fcmpne16	%f18,	%f12,	%i5
	movle	%icc,	%g6,	%l3
	mulscc	%i4,	%o2,	%l4
	fmovdvs	%xcc,	%f9,	%f7
	orncc	%g5,	%g7,	%o6
	subccc	%o3,	0x0CFD,	%o0
	udiv	%l1,	0x08B1,	%o5
	stw	%g1,	[%l7 + 0x1C]
	movrgez	%i6,	%i3,	%l5
	mova	%icc,	%g2,	%l0
	fmovsa	%xcc,	%f11,	%f16
	orcc	%l6,	0x183C,	%i7
	fpadd32	%f6,	%f18,	%f30
	xnor	%o7,	0x00E3,	%g4
	st	%f1,	[%l7 + 0x4C]
	fpadd16	%f8,	%f20,	%f8
	fmuld8ulx16	%f4,	%f5,	%f30
	sllx	%o4,	%o1,	%i2
	fxnor	%f22,	%f10,	%f18
	fand	%f18,	%f22,	%f30
	edge32n	%l2,	%i1,	%i0
	fornot1s	%f14,	%f23,	%f8
	edge16ln	%i5,	%g6,	%g3
	fxor	%f6,	%f12,	%f0
	movge	%xcc,	%l3,	%i4
	umul	%o2,	0x11F6,	%g5
	fexpand	%f9,	%f4
	ldsh	[%l7 + 0x32],	%l4
	and	%o6,	%g7,	%o0
	udivcc	%l1,	0x07A6,	%o5
	umulcc	%g1,	%i6,	%i3
	fpackfix	%f18,	%f9
	movn	%xcc,	%o3,	%l5
	fnand	%f12,	%f20,	%f10
	stx	%g2,	[%l7 + 0x10]
	ldsb	[%l7 + 0x0E],	%l6
	movrne	%l0,	0x24C,	%i7
	sir	0x1163
	subccc	%o7,	0x193B,	%g4
	sra	%o4,	0x07,	%o1
	fmovdle	%xcc,	%f5,	%f20
	udivcc	%l2,	0x13B8,	%i2
	popc	0x1DB6,	%i1
	subc	%i5,	%g6,	%i0
	sir	0x0A42
	xorcc	%g3,	%l3,	%o2
	stw	%i4,	[%l7 + 0x40]
	movrgez	%l4,	%o6,	%g5
	array16	%o0,	%g7,	%l1
	mulscc	%g1,	0x1D42,	%i6
	xnorcc	%o5,	%o3,	%i3
	umulcc	%l5,	%g2,	%l6
	alignaddr	%i7,	%l0,	%g4
	mulscc	%o4,	%o7,	%o1
	movle	%icc,	%l2,	%i2
	udivcc	%i1,	0x1A2C,	%i5
	lduw	[%l7 + 0x2C],	%i0
	add	%g6,	%g3,	%o2
	edge16	%l3,	%i4,	%l4
	fcmps	%fcc0,	%f18,	%f2
	edge16ln	%o6,	%o0,	%g7
	fmovdge	%icc,	%f29,	%f15
	fpsub16s	%f10,	%f5,	%f29
	movg	%xcc,	%l1,	%g5
	fcmpne16	%f16,	%f22,	%i6
	edge16	%g1,	%o5,	%i3
	udivcc	%l5,	0x030F,	%g2
	orcc	%l6,	%i7,	%l0
	sir	0x018E
	edge8	%o3,	%o4,	%o7
	movleu	%icc,	%g4,	%o1
	mova	%xcc,	%i2,	%i1
	edge32	%l2,	%i0,	%g6
	ldd	[%l7 + 0x50],	%g2
	fcmpeq16	%f20,	%f14,	%o2
	stb	%i5,	[%l7 + 0x32]
	andn	%i4,	0x0562,	%l3
	movvc	%icc,	%o6,	%o0
	nop
	set	0x5C, %i6
	lduw	[%l7 + %i6],	%g7
	nop
	set	0x58, %l2
	stw	%l1,	[%l7 + %l2]
	xnor	%l4,	%i6,	%g5
	edge8	%g1,	%o5,	%i3
	sll	%g2,	0x0D,	%l5
	xor	%i7,	0x0CC0,	%l0
	fand	%f20,	%f8,	%f26
	stx	%l6,	[%l7 + 0x50]
	add	%o3,	0x0B5C,	%o4
	std	%f10,	[%l7 + 0x78]
	addc	%o7,	%o1,	%g4
	alignaddr	%i2,	%i1,	%l2
	sub	%i0,	0x1135,	%g6
	movcc	%icc,	%g3,	%i5
	umul	%i4,	%o2,	%o6
	movleu	%xcc,	%o0,	%g7
	and	%l3,	%l4,	%i6
	fcmpes	%fcc3,	%f9,	%f24
	andn	%l1,	0x094A,	%g5
	xnorcc	%o5,	%i3,	%g2
	edge16	%g1,	%l5,	%i7
	ldd	[%l7 + 0x18],	%f8
	sir	0x1527
	movcs	%xcc,	%l6,	%l0
	sdivx	%o3,	0x0A5F,	%o4
	udivcc	%o1,	0x14AE,	%o7
	movrlez	%i2,	0x013,	%g4
	move	%xcc,	%l2,	%i0
	fnegd	%f22,	%f10
	lduh	[%l7 + 0x5A],	%i1
	sllx	%g3,	0x0C,	%i5
	fnors	%f19,	%f29,	%f31
	srlx	%g6,	%o2,	%o6
	xor	%i4,	0x1788,	%g7
	fcmpd	%fcc3,	%f20,	%f18
	udiv	%l3,	0x16A0,	%o0
	movle	%icc,	%l4,	%l1
	edge32l	%g5,	%o5,	%i3
	mulscc	%g2,	0x12C1,	%g1
	ldub	[%l7 + 0x25],	%i6
	smulcc	%l5,	%l6,	%l0
	fmovrsne	%o3,	%f27,	%f3
	movcc	%icc,	%o4,	%i7
	andcc	%o1,	0x128F,	%o7
	subc	%g4,	%i2,	%i0
	udiv	%l2,	0x0E72,	%g3
	movne	%xcc,	%i5,	%g6
	movre	%i1,	0x287,	%o6
	ldx	[%l7 + 0x38],	%i4
	siam	0x3
	subccc	%o2,	0x0818,	%g7
	movgu	%xcc,	%o0,	%l3
	sir	0x02BD
	fcmpes	%fcc3,	%f21,	%f21
	fmovdneg	%xcc,	%f2,	%f17
	fzeros	%f15
	sra	%l4,	%l1,	%o5
	edge16	%g5,	%g2,	%g1
	umul	%i3,	0x0B41,	%i6
	alignaddr	%l5,	%l0,	%l6
	andncc	%o4,	%i7,	%o3
	subccc	%o7,	%o1,	%g4
	andn	%i0,	0x184F,	%l2
	alignaddrl	%i2,	%g3,	%g6
	bshuffle	%f18,	%f28,	%f6
	udivcc	%i5,	0x0FF8,	%i1
	fmovdge	%xcc,	%f27,	%f19
	addccc	%i4,	%o6,	%o2
	subc	%o0,	%g7,	%l3
	save %l4, 0x1948, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g5,	%l1,	%g1
	movrgz	%g2,	0x15C,	%i6
	subc	%i3,	0x0E8D,	%l0
	srax	%l5,	%o4,	%l6
	fmovse	%xcc,	%f21,	%f0
	mulscc	%o3,	%i7,	%o7
	edge8n	%g4,	%o1,	%l2
	fmovrdne	%i0,	%f24,	%f16
	alignaddr	%g3,	%i2,	%g6
	fcmpeq32	%f30,	%f18,	%i5
	fpadd32s	%f0,	%f20,	%f3
	sdivx	%i4,	0x09E8,	%o6
	sir	0x185B
	array32	%o2,	%i1,	%g7
	ldd	[%l7 + 0x18],	%f24
	array32	%l3,	%o0,	%o5
	fmuld8ulx16	%f8,	%f16,	%f22
	srax	%g5,	0x14,	%l1
	edge16ln	%l4,	%g1,	%i6
	stw	%g2,	[%l7 + 0x0C]
	mulx	%l0,	%i3,	%l5
	nop
	set	0x4D, %o6
	ldsb	[%l7 + %o6],	%l6
	subccc	%o4,	0x136A,	%i7
	ld	[%l7 + 0x78],	%f14
	subcc	%o7,	0x03BC,	%g4
	fmovda	%icc,	%f2,	%f6
	sdivcc	%o1,	0x1B5B,	%l2
	array32	%o3,	%g3,	%i0
	movge	%xcc,	%i2,	%g6
	edge16ln	%i4,	%i5,	%o6
	movrgez	%i1,	0x043,	%o2
	movle	%xcc,	%g7,	%o0
	orn	%o5,	%g5,	%l3
	edge16l	%l1,	%g1,	%l4
	mulscc	%g2,	%l0,	%i3
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	add	%i7,	0x0926,	%o4
	udiv	%o7,	0x11DD,	%o1
	ldx	[%l7 + 0x20],	%l2
	fnot2s	%f22,	%f10
	movrlez	%o3,	0x0F2,	%g3
	stx	%i0,	[%l7 + 0x58]
	fnor	%f16,	%f10,	%f14
	movne	%xcc,	%g4,	%g6
	addc	%i4,	%i5,	%i2
	and	%i1,	%o2,	%o6
	mulx	%g7,	0x1F29,	%o5
	smul	%o0,	%l3,	%l1
	movrlez	%g5,	%l4,	%g1
	array16	%l0,	%i3,	%g2
	edge16l	%i6,	%l6,	%i7
	movrne	%l5,	%o7,	%o4
	sdivcc	%l2,	0x0C86,	%o3
	nop
	set	0x7E, %g3
	ldsh	[%l7 + %g3],	%g3
	fmovda	%icc,	%f22,	%f22
	umulcc	%o1,	0x1FAA,	%i0
	edge8ln	%g6,	%g4,	%i5
	udiv	%i4,	0x0FC4,	%i1
	fcmpgt32	%f2,	%f26,	%o2
	fands	%f27,	%f28,	%f13
	sdivx	%i2,	0x0F28,	%o6
	edge8l	%o5,	%g7,	%o0
	save %l1, 0x191F, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l3,	%l4,	%l0
	edge8l	%i3,	%g1,	%g2
	movn	%icc,	%l6,	%i6
	movvc	%icc,	%l5,	%i7
	udiv	%o4,	0x0E60,	%l2
	fmovrde	%o7,	%f26,	%f18
	popc	0x1BD8,	%g3
	movrgez	%o1,	0x1DF,	%o3
	edge32	%i0,	%g4,	%g6
	fnors	%f7,	%f27,	%f11
	movleu	%xcc,	%i5,	%i1
	srax	%o2,	%i4,	%i2
	fexpand	%f2,	%f18
	fands	%f20,	%f23,	%f15
	ldsw	[%l7 + 0x14],	%o6
	edge8n	%g7,	%o5,	%l1
	fmovsl	%icc,	%f19,	%f19
	fxors	%f7,	%f31,	%f21
	fcmple16	%f16,	%f24,	%g5
	lduh	[%l7 + 0x38],	%l3
	srax	%o0,	0x01,	%l4
	ldd	[%l7 + 0x28],	%i2
	fcmpgt16	%f14,	%f26,	%l0
	fmovs	%f13,	%f4
	sll	%g1,	0x0B,	%g2
	orncc	%l6,	0x12CD,	%i6
	lduh	[%l7 + 0x56],	%i7
	xnorcc	%o4,	%l5,	%o7
	movvc	%icc,	%l2,	%g3
	sethi	0x030B,	%o1
	movge	%icc,	%i0,	%o3
	stw	%g4,	[%l7 + 0x28]
	mulx	%i5,	%i1,	%o2
	ld	[%l7 + 0x70],	%f16
	fmul8x16au	%f30,	%f3,	%f0
	mulx	%g6,	0x00B4,	%i4
	smulcc	%o6,	0x1F29,	%g7
	stw	%o5,	[%l7 + 0x4C]
	andcc	%l1,	%g5,	%i2
	ldsw	[%l7 + 0x24],	%l3
	array16	%l4,	%i3,	%l0
	stx	%o0,	[%l7 + 0x58]
	popc	0x168C,	%g1
	fmovrslez	%g2,	%f23,	%f17
	smulcc	%l6,	%i6,	%o4
	edge8n	%i7,	%o7,	%l5
	orn	%l2,	%o1,	%g3
	fnot1	%f10,	%f22
	movg	%icc,	%o3,	%g4
	sir	0x094A
	edge32l	%i0,	%i5,	%i1
	fcmpne32	%f24,	%f16,	%o2
	sth	%g6,	[%l7 + 0x30]
	fandnot2	%f12,	%f30,	%f14
	lduw	[%l7 + 0x4C],	%o6
	andn	%i4,	%g7,	%o5
	add	%l1,	0x0048,	%i2
	fmuld8sux16	%f8,	%f24,	%f28
	stw	%l3,	[%l7 + 0x30]
	movg	%xcc,	%g5,	%i3
	movre	%l0,	%o0,	%g1
	srl	%g2,	0x0B,	%l6
	movgu	%icc,	%l4,	%o4
	edge32n	%i7,	%o7,	%l5
	fpsub16s	%f19,	%f23,	%f6
	umulcc	%i6,	0x09C0,	%l2
	movvc	%xcc,	%o1,	%g3
	fmovdcs	%icc,	%f21,	%f19
	fmovde	%xcc,	%f14,	%f25
	std	%f28,	[%l7 + 0x70]
	srlx	%g4,	%o3,	%i5
	ldub	[%l7 + 0x18],	%i1
	edge16l	%o2,	%g6,	%o6
	fmovsvs	%xcc,	%f18,	%f3
	edge16	%i4,	%g7,	%o5
	std	%f8,	[%l7 + 0x58]
	movneg	%icc,	%l1,	%i0
	udivx	%l3,	0x0E58,	%i2
	movre	%i3,	%l0,	%g5
	fmovrse	%g1,	%f20,	%f8
	subc	%o0,	0x0E31,	%g2
	fpadd16	%f2,	%f30,	%f22
	addc	%l4,	0x02BD,	%l6
	faligndata	%f2,	%f2,	%f24
	udiv	%i7,	0x0420,	%o4
	pdist	%f0,	%f16,	%f0
	ldd	[%l7 + 0x28],	%f20
	edge32	%l5,	%o7,	%l2
	fcmpes	%fcc1,	%f12,	%f23
	movleu	%icc,	%o1,	%g3
	ldsw	[%l7 + 0x1C],	%g4
	fors	%f18,	%f8,	%f19
	fmovsl	%icc,	%f29,	%f29
	mulx	%i6,	0x116E,	%i5
	stw	%o3,	[%l7 + 0x14]
	fors	%f21,	%f29,	%f27
	fnot1s	%f16,	%f7
	movrne	%o2,	%g6,	%i1
	movpos	%icc,	%o6,	%g7
	alignaddr	%o5,	%i4,	%i0
	fmovdge	%xcc,	%f11,	%f12
	subc	%l3,	0x0C73,	%l1
	nop
	set	0x68, %g4
	stx	%i2,	[%l7 + %g4]
	fmovsleu	%icc,	%f31,	%f15
	udivcc	%i3,	0x13FA,	%g5
	and	%l0,	0x1FA0,	%g1
	movrgz	%g2,	0x18A,	%l4
	nop
	set	0x18, %l1
	ldd	[%l7 + %l1],	%f26
	ldx	[%l7 + 0x10],	%o0
	movrgez	%i7,	%l6,	%o4
	smulcc	%l5,	%l2,	%o1
	umulcc	%g3,	%o7,	%i6
	addccc	%i5,	0x0108,	%g4
	movl	%xcc,	%o3,	%g6
	array8	%o2,	%i1,	%o6
	sdiv	%g7,	0x0B43,	%i4
	restore %i0, 0x055B, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l1,	0x0BD1,	%i2
	ldd	[%l7 + 0x20],	%l2
	andcc	%g5,	0x1C2A,	%i3
	ldsw	[%l7 + 0x6C],	%g1
	fandnot2	%f16,	%f18,	%f12
	subc	%g2,	0x054E,	%l0
	fmovdle	%icc,	%f11,	%f9
	smulcc	%l4,	0x0309,	%o0
	edge8ln	%l6,	%o4,	%i7
	edge8n	%l2,	%o1,	%l5
	fnot1	%f0,	%f10
	lduh	[%l7 + 0x26],	%o7
	stb	%i6,	[%l7 + 0x66]
	edge8l	%i5,	%g4,	%g3
	save %g6, %o3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i1,	%o6
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%i4
	ldsw	[%l7 + 0x40],	%g7
	andn	%i0,	%o5,	%i2
	fmovsvs	%icc,	%f23,	%f31
	mulscc	%l3,	%g5,	%l1
	subc	%i3,	%g1,	%l0
	fpadd32s	%f1,	%f17,	%f25
	ldd	[%l7 + 0x10],	%f10
	xnorcc	%g2,	0x1EBE,	%o0
	andcc	%l6,	%o4,	%l4
	fmovde	%xcc,	%f11,	%f7
	movn	%xcc,	%i7,	%o1
	movvc	%xcc,	%l2,	%o7
	array32	%i6,	%l5,	%i5
	edge32l	%g3,	%g6,	%o3
	movrgz	%o2,	0x243,	%g4
	fpsub32s	%f15,	%f18,	%f0
	array8	%i1,	%o6,	%g7
	movcs	%icc,	%i0,	%o5
	ldx	[%l7 + 0x08],	%i4
	ldx	[%l7 + 0x70],	%i2
	and	%g5,	%l1,	%l3
	edge16n	%i3,	%l0,	%g1
	save %g2, %l6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l4,	%o4,	%o1
	movpos	%xcc,	%l2,	%i7
	ldd	[%l7 + 0x20],	%f6
	fors	%f11,	%f22,	%f4
	fmovdle	%xcc,	%f22,	%f15
	mova	%icc,	%o7,	%l5
	sethi	0x04EB,	%i5
	bshuffle	%f10,	%f28,	%f22
	movn	%icc,	%i6,	%g6
	andncc	%g3,	%o2,	%g4
	edge8n	%o3,	%o6,	%i1
	movpos	%icc,	%g7,	%i0
	orcc	%o5,	0x0747,	%i2
	fmul8ulx16	%f12,	%f6,	%f14
	edge8	%i4,	%l1,	%g5
	fmovdgu	%icc,	%f25,	%f0
	stx	%i3,	[%l7 + 0x48]
	movl	%xcc,	%l0,	%g1
	fmovsge	%xcc,	%f16,	%f16
	andcc	%g2,	%l3,	%o0
	umulcc	%l6,	0x010A,	%o4
	fpadd32	%f20,	%f16,	%f12
	edge8l	%o1,	%l4,	%l2
	orncc	%o7,	0x1DA8,	%i7
	movneg	%xcc,	%i5,	%l5
	movpos	%xcc,	%i6,	%g3
	smul	%o2,	%g6,	%g4
	movl	%xcc,	%o3,	%o6
	popc	%g7,	%i1
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	subcc	%i4,	0x1042,	%l1
	fnot1	%f0,	%f24
	fpackfix	%f2,	%f9
	andcc	%g5,	0x09AF,	%i3
	sdiv	%l0,	0x0871,	%i2
	sir	0x0886
	sub	%g1,	%g2,	%o0
	ldd	[%l7 + 0x58],	%f24
	fandnot2	%f28,	%f8,	%f2
	fmovsl	%icc,	%f27,	%f27
	sub	%l6,	0x0B33,	%o4
	sethi	0x0A22,	%o1
	umul	%l4,	%l2,	%l3
	fabss	%f8,	%f25
	movcc	%xcc,	%o7,	%i5
	array32	%l5,	%i6,	%g3
	fsrc2	%f14,	%f24
	andcc	%i7,	%g6,	%g4
	fxnor	%f2,	%f10,	%f16
	edge8l	%o3,	%o2,	%o6
	ld	[%l7 + 0x70],	%f19
	addcc	%g7,	0x09DA,	%i1
	xorcc	%i0,	0x0753,	%o5
	fnegd	%f8,	%f18
	fmovdg	%icc,	%f26,	%f25
	movne	%xcc,	%i4,	%l1
	sir	0x07D8
	add	%g5,	0x135C,	%l0
	movneg	%icc,	%i2,	%i3
	movvc	%xcc,	%g2,	%o0
	ldub	[%l7 + 0x68],	%g1
	movvc	%icc,	%o4,	%o1
	edge32n	%l6,	%l4,	%l2
	move	%icc,	%o7,	%i5
	and	%l5,	%i6,	%l3
	subccc	%g3,	%i7,	%g6
	alignaddrl	%o3,	%g4,	%o2
	fands	%f26,	%f31,	%f14
	movrlz	%o6,	0x220,	%i1
	ldd	[%l7 + 0x60],	%g6
	edge32ln	%o5,	%i0,	%l1
	fcmpgt32	%f10,	%f24,	%i4
	movn	%xcc,	%l0,	%i2
	sir	0x1600
	movgu	%icc,	%g5,	%i3
	fnot2	%f28,	%f6
	movg	%xcc,	%o0,	%g2
	movge	%xcc,	%g1,	%o1
	sdivx	%o4,	0x0A23,	%l4
	srlx	%l2,	0x1F,	%o7
	ldsw	[%l7 + 0x24],	%l6
	sdiv	%i5,	0x0C06,	%l5
	movvc	%icc,	%l3,	%i6
	array32	%i7,	%g3,	%o3
	addccc	%g4,	%o2,	%o6
	ldsb	[%l7 + 0x4F],	%i1
	movre	%g7,	%o5,	%i0
	orn	%g6,	%i4,	%l0
	sra	%i2,	0x16,	%g5
	st	%f31,	[%l7 + 0x20]
	fmovsvs	%icc,	%f0,	%f12
	ldsw	[%l7 + 0x7C],	%i3
	st	%f8,	[%l7 + 0x5C]
	or	%l1,	%g2,	%g1
	move	%icc,	%o0,	%o1
	fabsd	%f30,	%f6
	andcc	%l4,	%l2,	%o4
	fsrc1	%f10,	%f12
	movrgez	%o7,	0x23B,	%l6
	array8	%l5,	%i5,	%i6
	movrlz	%i7,	0x284,	%g3
	alignaddrl	%l3,	%g4,	%o2
	sll	%o6,	%i1,	%o3
	movleu	%icc,	%o5,	%i0
	movrgez	%g6,	%i4,	%g7
	alignaddr	%i2,	%l0,	%g5
	sllx	%l1,	0x0E,	%i3
	sth	%g2,	[%l7 + 0x56]
	xnorcc	%o0,	%g1,	%o1
	movre	%l2,	0x017,	%l4
	fmul8sux16	%f8,	%f4,	%f12
	lduw	[%l7 + 0x78],	%o4
	fmuld8sux16	%f29,	%f8,	%f20
	and	%o7,	%l6,	%l5
	edge32l	%i5,	%i6,	%i7
	fnegs	%f16,	%f26
	or	%g3,	%g4,	%l3
	srax	%o6,	%i1,	%o2
	sllx	%o3,	%o5,	%g6
	movge	%icc,	%i4,	%g7
	edge8l	%i2,	%l0,	%g5
	ldsh	[%l7 + 0x10],	%l1
	edge16	%i3,	%i0,	%o0
	movrlz	%g2,	%o1,	%l2
	movl	%icc,	%g1,	%o4
	edge8	%o7,	%l4,	%l5
	edge32n	%l6,	%i6,	%i5
	srl	%i7,	%g3,	%g4
	fpsub32	%f18,	%f14,	%f8
	edge16ln	%o6,	%i1,	%o2
	ldsh	[%l7 + 0x2C],	%l3
	movpos	%icc,	%o3,	%o5
	subccc	%g6,	%g7,	%i4
	fxor	%f26,	%f30,	%f6
	fmovde	%icc,	%f30,	%f22
	smulcc	%i2,	%l0,	%g5
	edge16	%l1,	%i3,	%i0
	fmovdvs	%xcc,	%f0,	%f25
	move	%icc,	%g2,	%o1
	movgu	%icc,	%l2,	%g1
	ld	[%l7 + 0x08],	%f23
	movgu	%xcc,	%o4,	%o7
	xnorcc	%l4,	0x0272,	%o0
	nop
	set	0x37, %g1
	ldub	[%l7 + %g1],	%l6
	mova	%xcc,	%l5,	%i5
	edge8	%i7,	%i6,	%g3
	sra	%g4,	%i1,	%o2
	stb	%o6,	[%l7 + 0x70]
	fmovrslez	%l3,	%f22,	%f6
	or	%o3,	%g6,	%g7
	xnorcc	%i4,	0x0B6F,	%i2
	movrne	%l0,	%g5,	%l1
	smul	%o5,	0x0373,	%i0
	fpsub32	%f4,	%f28,	%f12
	ldsw	[%l7 + 0x44],	%i3
	pdist	%f6,	%f20,	%f10
	mulx	%o1,	0x19EF,	%g2
	andncc	%l2,	%o4,	%o7
	udiv	%g1,	0x0C17,	%l4
	sth	%l6,	[%l7 + 0x08]
	movpos	%icc,	%l5,	%i5
	addcc	%o0,	%i7,	%i6
	ldd	[%l7 + 0x40],	%g4
	ldsw	[%l7 + 0x48],	%i1
	movrgz	%o2,	0x302,	%o6
	movneg	%xcc,	%l3,	%g3
	popc	%o3,	%g6
	stb	%i4,	[%l7 + 0x2C]
	subccc	%i2,	0x00D9,	%g7
	fmovsn	%icc,	%f22,	%f5
	fpadd16	%f24,	%f20,	%f18
	movpos	%icc,	%l0,	%l1
	fpadd32	%f8,	%f22,	%f0
	fandnot1	%f16,	%f0,	%f20
	udivcc	%g5,	0x1C16,	%i0
	fandnot2	%f14,	%f22,	%f18
	ldub	[%l7 + 0x6C],	%i3
	andcc	%o1,	0x06BD,	%g2
	fnands	%f12,	%f24,	%f28
	edge32	%l2,	%o4,	%o5
	save %o7, %g1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	0x16BF,	%i5
	smulcc	%l4,	0x038B,	%i7
	movle	%icc,	%o0,	%g4
	stx	%i1,	[%l7 + 0x28]
	fmovsneg	%xcc,	%f13,	%f1
	edge8n	%o2,	%o6,	%l3
	siam	0x4
	movcc	%icc,	%i6,	%g3
	andn	%g6,	%i4,	%o3
	andncc	%i2,	%g7,	%l0
	mulscc	%l1,	0x09F1,	%i0
	andcc	%g5,	%o1,	%g2
	mulx	%l2,	0x1151,	%o4
	movrlez	%i3,	%o7,	%o5
	sra	%l6,	%l5,	%i5
	std	%f0,	[%l7 + 0x58]
	xorcc	%l4,	%g1,	%o0
	udivx	%g4,	0x0082,	%i7
	sir	0x1508
	movrgz	%i1,	0x01C,	%o6
	fmovsl	%xcc,	%f19,	%f14
	udivcc	%o2,	0x02D3,	%l3
	fcmpne16	%f26,	%f28,	%i6
	umul	%g6,	0x0CD5,	%g3
	alignaddr	%o3,	%i2,	%i4
	fxnors	%f11,	%f8,	%f19
	movcs	%xcc,	%g7,	%l1
	stb	%l0,	[%l7 + 0x57]
	movge	%icc,	%g5,	%o1
	edge16ln	%i0,	%g2,	%o4
	movrlez	%i3,	0x1D1,	%l2
	array16	%o5,	%o7,	%l6
	save %i5, 0x19CE, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f16,	[%l7 + 0x30]
	std	%f6,	[%l7 + 0x28]
	edge32ln	%g1,	%l4,	%g4
	edge8ln	%o0,	%i1,	%o6
	umulcc	%i7,	0x148B,	%o2
	fornot1s	%f13,	%f21,	%f5
	fmovsle	%icc,	%f13,	%f21
	pdist	%f18,	%f22,	%f0
	addccc	%i6,	0x1B87,	%g6
	edge32l	%g3,	%o3,	%i2
	st	%f27,	[%l7 + 0x0C]
	movrgez	%l3,	0x30D,	%i4
	fnors	%f6,	%f31,	%f27
	ldd	[%l7 + 0x40],	%f12
	fornot2s	%f6,	%f26,	%f25
	orn	%l1,	0x1B73,	%g7
	edge32	%l0,	%g5,	%i0
	fmovdneg	%icc,	%f0,	%f28
	or	%g2,	%o1,	%o4
	ldub	[%l7 + 0x6A],	%i3
	edge16n	%l2,	%o5,	%l6
	array8	%i5,	%o7,	%l5
	xorcc	%l4,	0x0EC7,	%g4
	fmovrsgez	%o0,	%f0,	%f31
	edge8n	%g1,	%i1,	%o6
	movrgz	%o2,	0x269,	%i6
	save %i7, 0x03CE, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f28,	%f18,	%g3
	array32	%o3,	%i2,	%l3
	nop
	set	0x0A, %o1
	ldsh	[%l7 + %o1],	%l1
	fnegs	%f12,	%f2
	movn	%icc,	%g7,	%l0
	xnor	%g5,	0x1CE4,	%i4
	ldsh	[%l7 + 0x0E],	%i0
	popc	0x1335,	%o1
	fmovsleu	%icc,	%f6,	%f30
	std	%f26,	[%l7 + 0x60]
	mova	%xcc,	%g2,	%i3
	orncc	%o4,	%l2,	%o5
	fmuld8sux16	%f27,	%f14,	%f24
	sub	%l6,	0x08A9,	%i5
	movrgz	%l5,	0x182,	%l4
	mulx	%g4,	%o7,	%o0
	fnegs	%f18,	%f24
	movge	%icc,	%i1,	%g1
	lduh	[%l7 + 0x70],	%o6
	siam	0x5
	fnot1s	%f6,	%f24
	xnorcc	%o2,	%i6,	%g6
	siam	0x1
	edge8	%g3,	%i7,	%i2
	fmovdvc	%icc,	%f17,	%f27
	xor	%l3,	0x19BB,	%l1
	xorcc	%g7,	0x0DB2,	%o3
	xnorcc	%l0,	%i4,	%i0
	fnand	%f0,	%f14,	%f20
	fand	%f26,	%f4,	%f12
	addcc	%g5,	0x18DA,	%g2
	fxors	%f9,	%f7,	%f3
	xnor	%i3,	0x0039,	%o4
	nop
	set	0x21, %l0
	stb	%o1,	[%l7 + %l0]
	subcc	%o5,	%l6,	%i5
	srl	%l2,	%l5,	%l4
	stx	%o7,	[%l7 + 0x60]
	movrlz	%g4,	0x38C,	%i1
	sra	%g1,	%o0,	%o2
	stb	%i6,	[%l7 + 0x6F]
	edge16n	%g6,	%g3,	%o6
	edge16ln	%i7,	%i2,	%l1
	ldd	[%l7 + 0x18],	%f20
	ldx	[%l7 + 0x38],	%l3
	fpadd16s	%f3,	%f3,	%f26
	movvc	%xcc,	%o3,	%g7
	addcc	%i4,	%l0,	%g5
	fmovdvs	%icc,	%f9,	%f30
	ld	[%l7 + 0x2C],	%f3
	umulcc	%i0,	0x0AB6,	%g2
	array16	%i3,	%o4,	%o1
	restore %l6, 0x0E81, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i5,	[%l7 + 0x40]
	orcc	%l5,	%l4,	%o7
	ldd	[%l7 + 0x18],	%g4
	ldx	[%l7 + 0x58],	%l2
	fcmpgt32	%f6,	%f20,	%i1
	udiv	%o0,	0x0DAB,	%g1
	sethi	0x139B,	%o2
	srl	%g6,	%g3,	%o6
	fabsd	%f0,	%f26
	nop
	set	0x60, %l5
	stx	%i6,	[%l7 + %l5]
	fcmpeq32	%f30,	%f12,	%i2
	sub	%i7,	%l1,	%l3
	addcc	%g7,	%o3,	%i4
	movvc	%xcc,	%g5,	%l0
	fmovsvc	%icc,	%f21,	%f2
	movre	%g2,	%i3,	%o4
	sll	%i0,	0x09,	%o1
	sth	%o5,	[%l7 + 0x76]
	fnot1	%f20,	%f4
	array16	%i5,	%l5,	%l4
	andcc	%l6,	0x15E0,	%g4
	movn	%icc,	%l2,	%o7
	movrlz	%o0,	0x1F4,	%i1
	srl	%g1,	0x0F,	%g6
	smulcc	%g3,	0x0DBB,	%o2
	fsrc1	%f26,	%f28
	fnors	%f16,	%f7,	%f20
	xnorcc	%o6,	%i6,	%i7
	addcc	%l1,	%i2,	%g7
	edge32	%l3,	%i4,	%g5
	fmovsne	%xcc,	%f18,	%f30
	addcc	%l0,	0x0AED,	%o3
	fnors	%f6,	%f3,	%f8
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	for	%f30,	%f22,	%f8
	fmovsleu	%xcc,	%f29,	%f2
	or	%i0,	0x0E65,	%o1
	stx	%o5,	[%l7 + 0x40]
	fmovsg	%icc,	%f10,	%f7
	nop
	set	0x30, %i3
	ldd	[%l7 + %i3],	%i4
	movre	%l5,	0x28A,	%g2
	movne	%icc,	%l4,	%l6
	smul	%g4,	0x0740,	%l2
	sub	%o7,	0x0453,	%o0
	fors	%f29,	%f22,	%f11
	sll	%g1,	0x10,	%g6
	stb	%i1,	[%l7 + 0x7D]
	fmovdg	%xcc,	%f25,	%f9
	alignaddr	%o2,	%g3,	%o6
	movneg	%xcc,	%i6,	%i7
	movvc	%icc,	%i2,	%g7
	fmovdg	%icc,	%f1,	%f8
	popc	0x09A4,	%l3
	edge16n	%l1,	%i4,	%l0
	srl	%o3,	0x16,	%g5
	edge8	%i3,	%i0,	%o1
	movvs	%xcc,	%o5,	%o4
	umul	%l5,	0x0B8D,	%i5
	udivcc	%l4,	0x1568,	%l6
	mova	%xcc,	%g4,	%g2
	sdivx	%l2,	0x0448,	%o7
	mulx	%g1,	%g6,	%i1
	ld	[%l7 + 0x18],	%f4
	ldub	[%l7 + 0x12],	%o0
	sub	%g3,	0x111F,	%o6
	edge16	%i6,	%o2,	%i7
	sll	%g7,	0x0F,	%l3
	fnor	%f22,	%f6,	%f18
	srl	%i2,	0x17,	%l1
	fandnot2s	%f14,	%f24,	%f23
	save %i4, %o3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f22,	%f12,	%f4
	sir	0x1BEE
	lduw	[%l7 + 0x44],	%i3
	sethi	0x0565,	%i0
	edge8n	%o1,	%o5,	%o4
	movrlz	%g5,	0x2AF,	%i5
	movn	%icc,	%l4,	%l5
	ldx	[%l7 + 0x78],	%l6
	movneg	%icc,	%g2,	%l2
	mova	%icc,	%g4,	%g1
	fmovdvc	%icc,	%f18,	%f22
	fmul8x16au	%f27,	%f4,	%f2
	addc	%g6,	%i1,	%o7
	stx	%o0,	[%l7 + 0x58]
	movgu	%xcc,	%o6,	%i6
	movl	%icc,	%o2,	%i7
	sra	%g3,	%l3,	%g7
	lduh	[%l7 + 0x36],	%i2
	fmovrsgz	%i4,	%f31,	%f31
	movleu	%icc,	%l1,	%o3
	fmovrsgz	%i3,	%f0,	%f31
	srl	%i0,	%l0,	%o5
	edge16ln	%o1,	%g5,	%o4
	sir	0x02BD
	ld	[%l7 + 0x3C],	%f1
	fcmpgt16	%f14,	%f14,	%l4
	ld	[%l7 + 0x54],	%f17
	stx	%i5,	[%l7 + 0x78]
	fabsd	%f0,	%f22
	edge32n	%l5,	%g2,	%l6
	fcmpeq32	%f30,	%f8,	%l2
	and	%g1,	0x041B,	%g4
	fmovdcc	%icc,	%f28,	%f7
	stw	%g6,	[%l7 + 0x7C]
	stw	%i1,	[%l7 + 0x68]
	fpadd16s	%f25,	%f24,	%f21
	mova	%xcc,	%o7,	%o0
	edge8l	%o6,	%o2,	%i6
	udivx	%g3,	0x1591,	%l3
	nop
	set	0x1D, %o7
	stb	%i7,	[%l7 + %o7]
	alignaddrl	%g7,	%i2,	%i4
	restore %l1, %i3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x14],	%o3
	fpsub32s	%f14,	%f20,	%f13
	move	%icc,	%o5,	%l0
	movne	%icc,	%o1,	%o4
	array8	%g5,	%i5,	%l5
	addcc	%l4,	%l6,	%g2
	movle	%icc,	%g1,	%l2
	addcc	%g6,	%i1,	%g4
	orncc	%o0,	%o7,	%o2
	orn	%i6,	0x1939,	%o6
	movcc	%icc,	%l3,	%g3
	sdivx	%g7,	0x0605,	%i2
	fmovdpos	%icc,	%f13,	%f30
	addcc	%i4,	%l1,	%i3
	srax	%i0,	0x16,	%o3
	sdivcc	%i7,	0x15E6,	%l0
	nop
	set	0x0B, %l3
	stb	%o5,	[%l7 + %l3]
	ld	[%l7 + 0x50],	%f19
	fnot2s	%f12,	%f2
	ld	[%l7 + 0x34],	%f24
	or	%o4,	0x1E63,	%g5
	edge16ln	%o1,	%i5,	%l4
	xnor	%l6,	%g2,	%l5
	movl	%icc,	%l2,	%g6
	alignaddrl	%i1,	%g4,	%g1
	ldub	[%l7 + 0x67],	%o7
	or	%o0,	0x051F,	%i6
	fmovd	%f16,	%f22
	movle	%xcc,	%o6,	%o2
	sth	%g3,	[%l7 + 0x10]
	move	%icc,	%l3,	%i2
	popc	0x0CDA,	%i4
	mulscc	%l1,	%g7,	%i3
	fpmerge	%f29,	%f5,	%f6
	fmovrsne	%o3,	%f6,	%f3
	sth	%i0,	[%l7 + 0x60]
	fmovrsne	%i7,	%f20,	%f18
	sdiv	%l0,	0x1E36,	%o4
	mulx	%o5,	0x0075,	%g5
	movvs	%icc,	%i5,	%o1
	fmovda	%xcc,	%f25,	%f3
	save %l4, %l6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l2,	0x0B8C,	%g2
	fpadd16s	%f1,	%f4,	%f8
	stx	%g6,	[%l7 + 0x40]
	lduw	[%l7 + 0x5C],	%g4
	fmovsleu	%icc,	%f15,	%f10
	ld	[%l7 + 0x10],	%f21
	ldub	[%l7 + 0x12],	%g1
	fmovrsgz	%o7,	%f20,	%f18
	fpadd16	%f6,	%f18,	%f6
	movl	%xcc,	%i1,	%i6
	edge32ln	%o6,	%o2,	%g3
	addccc	%o0,	0x139C,	%i2
	addccc	%i4,	0x0FE4,	%l1
	fmovrslez	%l3,	%f7,	%f7
	fnands	%f14,	%f13,	%f29
	ldsw	[%l7 + 0x60],	%g7
	ldsh	[%l7 + 0x14],	%i3
	mulx	%i0,	0x0B2C,	%o3
	ldsw	[%l7 + 0x4C],	%l0
	nop
	set	0x10, %l6
	lduw	[%l7 + %l6],	%o4
	andncc	%o5,	%i7,	%g5
	sethi	0x10B4,	%o1
	subc	%i5,	0x0871,	%l6
	ldsw	[%l7 + 0x78],	%l4
	orn	%l2,	0x1264,	%g2
	fzeros	%f10
	edge16l	%l5,	%g6,	%g1
	fsrc2s	%f5,	%f28
	movpos	%xcc,	%o7,	%i1
	andcc	%i6,	%g4,	%o6
	smulcc	%o2,	%g3,	%i2
	lduw	[%l7 + 0x78],	%o0
	sll	%l1,	0x07,	%l3
	or	%i4,	%g7,	%i0
	srlx	%i3,	%o3,	%o4
	subc	%o5,	%l0,	%i7
	movle	%xcc,	%g5,	%o1
	sdivx	%l6,	0x0AB2,	%l4
	movl	%xcc,	%i5,	%l2
	sth	%l5,	[%l7 + 0x56]
	movvs	%icc,	%g6,	%g2
	movcc	%xcc,	%g1,	%i1
	sub	%o7,	0x0C43,	%i6
	movcc	%xcc,	%g4,	%o2
	fmovrdgez	%o6,	%f6,	%f8
	ldd	[%l7 + 0x58],	%f12
	fxnors	%f30,	%f23,	%f14
	sub	%i2,	0x0962,	%g3
	movrlz	%l1,	0x1F5,	%l3
	fcmple16	%f30,	%f28,	%i4
	ldd	[%l7 + 0x38],	%f30
	movrgez	%g7,	0x355,	%i0
	siam	0x6
	sub	%o0,	0x123D,	%i3
	ldsb	[%l7 + 0x27],	%o4
	udivcc	%o3,	0x05C0,	%o5
	movneg	%icc,	%l0,	%g5
	fmovsg	%xcc,	%f6,	%f1
	movgu	%xcc,	%i7,	%l6
	fmovsvc	%icc,	%f15,	%f22
	fone	%f0
	ldsw	[%l7 + 0x7C],	%l4
	movg	%xcc,	%i5,	%o1
	fmovsvs	%xcc,	%f30,	%f11
	fmovrse	%l5,	%f30,	%f22
	fmovscc	%xcc,	%f30,	%f12
	ldd	[%l7 + 0x68],	%g6
	movl	%xcc,	%l2,	%g2
	lduw	[%l7 + 0x18],	%i1
	popc	0x0ADC,	%o7
	fandnot2	%f6,	%f26,	%f4
	sra	%g1,	0x14,	%i6
	ldub	[%l7 + 0x10],	%g4
	fmul8ulx16	%f4,	%f24,	%f14
	ldd	[%l7 + 0x10],	%f20
	orcc	%o6,	%i2,	%o2
	edge16	%l1,	%l3,	%i4
	edge8n	%g7,	%i0,	%o0
	movle	%icc,	%i3,	%g3
	orncc	%o4,	%o5,	%o3
	edge16n	%l0,	%i7,	%g5
	movrlz	%l4,	%i5,	%l6
	sll	%o1,	%g6,	%l5
	fmovdg	%icc,	%f8,	%f2
	fmovrsgz	%l2,	%f15,	%f5
	fcmpeq16	%f10,	%f10,	%i1
	fpackfix	%f28,	%f25
	movrgez	%g2,	%g1,	%o7
	nop
	set	0x18, %i4
	lduw	[%l7 + %i4],	%g4
	subccc	%i6,	%i2,	%o2
	fxor	%f10,	%f4,	%f12
	movg	%xcc,	%o6,	%l1
	movcs	%xcc,	%i4,	%l3
	nop
	set	0x67, %i0
	stb	%i0,	[%l7 + %i0]
	addc	%g7,	0x0CD2,	%i3
	addcc	%g3,	0x1AAE,	%o0
	movg	%xcc,	%o5,	%o4
	fmovrdgez	%o3,	%f28,	%f20
	ldsw	[%l7 + 0x68],	%i7
	fxnors	%f16,	%f7,	%f0
	ldx	[%l7 + 0x38],	%l0
	sir	0x1378
	fpsub16	%f2,	%f0,	%f26
	xorcc	%g5,	%i5,	%l6
	subc	%o1,	%g6,	%l5
	stx	%l2,	[%l7 + 0x30]
	add	%l4,	%g2,	%g1
	sir	0x1909
	fmul8x16	%f3,	%f14,	%f24
	sir	0x0BAA
	fnegd	%f8,	%f4
	fsrc1	%f6,	%f14
	movge	%icc,	%i1,	%o7
	movrne	%i6,	%g4,	%o2
	udiv	%o6,	0x115F,	%i2
	orn	%i4,	%l1,	%l3
	movrgez	%i0,	0x1F1,	%g7
	movrgez	%g3,	%i3,	%o5
	movg	%xcc,	%o0,	%o3
	movne	%xcc,	%i7,	%o4
	ldd	[%l7 + 0x08],	%l0
	fsrc2	%f0,	%f0
	fmovsle	%xcc,	%f30,	%f0
	ld	[%l7 + 0x54],	%f13
	and	%i5,	%g5,	%o1
	mulscc	%l6,	%l5,	%l2
	fsrc1	%f4,	%f16
	fmovdcc	%xcc,	%f1,	%f23
	subccc	%g6,	0x0C76,	%g2
	lduw	[%l7 + 0x3C],	%l4
	ld	[%l7 + 0x7C],	%f22
	sdivx	%i1,	0x1408,	%g1
	ld	[%l7 + 0x24],	%f23
	fnegd	%f26,	%f12
	udiv	%i6,	0x1F0A,	%o7
	fcmple32	%f8,	%f26,	%g4
	ldsh	[%l7 + 0x76],	%o2
	xnorcc	%o6,	0x0925,	%i2
	sdivx	%l1,	0x1508,	%i4
	mova	%xcc,	%l3,	%g7
	nop
	set	0x70, %l4
	std	%f14,	[%l7 + %l4]
	mulx	%g3,	%i3,	%o5
	sllx	%o0,	%o3,	%i0
	movrlz	%o4,	0x18A,	%i7
	xorcc	%l0,	0x15C6,	%i5
	movleu	%icc,	%g5,	%o1
	fmul8x16al	%f17,	%f1,	%f22
	fnand	%f26,	%f4,	%f14
	movvs	%xcc,	%l6,	%l5
	addccc	%l2,	%g6,	%l4
	movl	%icc,	%g2,	%i1
	movle	%icc,	%i6,	%g1
	ldd	[%l7 + 0x10],	%f2
	orn	%g4,	%o7,	%o2
	sllx	%i2,	%l1,	%o6
	ldsh	[%l7 + 0x6C],	%i4
	xor	%g7,	%l3,	%g3
	edge8l	%i3,	%o0,	%o3
	edge8	%o5,	%i0,	%i7
	alignaddr	%l0,	%i5,	%g5
	stx	%o1,	[%l7 + 0x70]
	sdivcc	%o4,	0x1E0F,	%l5
	xorcc	%l6,	0x1826,	%g6
	movneg	%xcc,	%l2,	%g2
	movle	%xcc,	%i1,	%l4
	fandnot1	%f18,	%f16,	%f10
	edge32n	%g1,	%i6,	%o7
	fmovdvs	%icc,	%f0,	%f11
	movcc	%xcc,	%g4,	%i2
	fornot1s	%f21,	%f14,	%f10
	orn	%l1,	%o6,	%i4
	andcc	%g7,	%l3,	%o2
	fmovdg	%xcc,	%f22,	%f4
	srl	%g3,	0x05,	%i3
	array32	%o0,	%o5,	%i0
	fmovdpos	%xcc,	%f6,	%f22
	stw	%i7,	[%l7 + 0x40]
	sll	%o3,	0x12,	%i5
	fmuld8ulx16	%f17,	%f10,	%f18
	fcmps	%fcc3,	%f25,	%f11
	ld	[%l7 + 0x3C],	%f9
	movgu	%xcc,	%g5,	%o1
	edge8n	%o4,	%l0,	%l5
	ld	[%l7 + 0x48],	%f10
	xnor	%l6,	0x165A,	%g6
	edge8l	%g2,	%l2,	%l4
	ldsh	[%l7 + 0x10],	%g1
	fpadd16	%f26,	%f24,	%f14
	stw	%i1,	[%l7 + 0x14]
	fmovrsgez	%o7,	%f1,	%f16
	fmovrsgez	%g4,	%f8,	%f20
	siam	0x0
	srax	%i6,	%l1,	%i2
	edge8	%o6,	%i4,	%g7
	umul	%l3,	%o2,	%i3
	movcc	%xcc,	%g3,	%o5
	stx	%i0,	[%l7 + 0x48]
	fpmerge	%f14,	%f13,	%f4
	fabss	%f3,	%f10
	mulx	%i7,	%o3,	%i5
	smulcc	%g5,	%o0,	%o4
	fmovsne	%icc,	%f8,	%f4
	fnand	%f10,	%f4,	%f6
	addc	%l0,	0x1BA0,	%o1
	sdiv	%l6,	0x0DB9,	%g6
	movrgz	%g2,	%l5,	%l4
	fornot2s	%f26,	%f26,	%f22
	udiv	%g1,	0x06D6,	%l2
	fxor	%f4,	%f28,	%f12
	mova	%xcc,	%o7,	%g4
	fandnot1	%f26,	%f2,	%f28
	fcmped	%fcc1,	%f22,	%f26
	orcc	%i6,	%l1,	%i2
	fmovsg	%xcc,	%f6,	%f12
	sir	0x0261
	ldx	[%l7 + 0x38],	%o6
	edge16ln	%i4,	%g7,	%l3
	movne	%icc,	%i1,	%i3
	stx	%o2,	[%l7 + 0x08]
	fzeros	%f26
	lduh	[%l7 + 0x7E],	%o5
	edge8ln	%i0,	%i7,	%o3
	movge	%icc,	%g3,	%i5
	movrlz	%g5,	0x26B,	%o4
	fmovsl	%icc,	%f14,	%f26
	stb	%l0,	[%l7 + 0x4F]
	sdivx	%o0,	0x0687,	%l6
	sllx	%o1,	%g6,	%g2
	sdivcc	%l4,	0x0D04,	%g1
	andn	%l5,	0x0E4A,	%o7
	edge32	%l2,	%i6,	%g4
	addc	%l1,	%o6,	%i4
	edge8ln	%g7,	%i2,	%i1
	umul	%l3,	0x1516,	%o2
	edge16ln	%i3,	%o5,	%i0
	ld	[%l7 + 0x2C],	%f0
	fmul8x16	%f8,	%f16,	%f26
	fmovrde	%i7,	%f2,	%f10
	movpos	%xcc,	%o3,	%g3
	edge8	%i5,	%g5,	%l0
	fnegs	%f26,	%f5
	movge	%icc,	%o4,	%l6
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	edge16l	%g2,	%g6,	%l4
	orncc	%g1,	0x1D5A,	%l5
	sth	%l2,	[%l7 + 0x3A]
	stb	%i6,	[%l7 + 0x13]
	edge8l	%g4,	%l1,	%o7
	edge8l	%i4,	%g7,	%i2
	fone	%f30
	siam	0x4
	srl	%i1,	%l3,	%o2
	popc	%o6,	%i3
	fabsd	%f8,	%f6
	movn	%xcc,	%o5,	%i7
	edge16ln	%i0,	%o3,	%i5
	edge16l	%g3,	%l0,	%o4
	movpos	%xcc,	%g5,	%o0
	umulcc	%o1,	0x0566,	%l6
	fmovrse	%g2,	%f8,	%f17
	sdivcc	%l4,	0x16FA,	%g6
	fandnot1s	%f26,	%f19,	%f16
	xor	%l5,	%l2,	%g1
	add	%i6,	%g4,	%l1
	sethi	0x1C7A,	%i4
	edge8	%g7,	%o7,	%i2
	movcs	%xcc,	%i1,	%l3
	andn	%o6,	0x0DE9,	%i3
	alignaddrl	%o2,	%o5,	%i0
	mulscc	%i7,	0x0EDA,	%i5
	edge8n	%g3,	%l0,	%o3
	or	%g5,	0x1472,	%o4
	xor	%o0,	0x00AB,	%l6
	subc	%o1,	0x178F,	%g2
	fmovrde	%l4,	%f4,	%f2
	edge16	%l5,	%g6,	%g1
	edge32	%i6,	%l2,	%l1
	movrgez	%g4,	0x07C,	%g7
	fpadd32s	%f27,	%f13,	%f13
	orn	%o7,	0x0A16,	%i4
	move	%xcc,	%i2,	%l3
	fxnor	%f4,	%f28,	%f14
	smulcc	%o6,	%i1,	%i3
	edge16ln	%o5,	%o2,	%i7
	movn	%icc,	%i5,	%i0
	save %l0, 0x1765, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x18],	%g5
	movrlz	%g3,	%o0,	%o4
	move	%xcc,	%l6,	%o1
	restore %l4, 0x05D9, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g6,	0x1B2E,	%g1
	fandnot2	%f2,	%f6,	%f16
	or	%l5,	%i6,	%l2
	stb	%g4,	[%l7 + 0x36]
	fmovrslz	%l1,	%f1,	%f22
	fmovs	%f8,	%f5
	movrlez	%g7,	%i4,	%o7
	fpmerge	%f6,	%f5,	%f18
	sll	%i2,	%l3,	%i1
	fmovdcs	%xcc,	%f24,	%f14
	edge16n	%o6,	%o5,	%o2
	ldd	[%l7 + 0x60],	%i6
	andncc	%i5,	%i3,	%i0
	fmovrdlz	%l0,	%f18,	%f10
	xor	%o3,	%g3,	%o0
	subcc	%o4,	%g5,	%o1
	alignaddrl	%l4,	%l6,	%g6
	fmul8x16au	%f29,	%f13,	%f30
	std	%f2,	[%l7 + 0x10]
	sir	0x0041
	st	%f1,	[%l7 + 0x58]
	and	%g2,	%l5,	%g1
	alignaddrl	%l2,	%i6,	%l1
	fmul8ulx16	%f24,	%f18,	%f10
	movvc	%xcc,	%g7,	%i4
	fmovscc	%xcc,	%f12,	%f8
	movg	%icc,	%o7,	%i2
	alignaddr	%l3,	%g4,	%i1
	movvc	%xcc,	%o6,	%o2
	movgu	%xcc,	%o5,	%i7
	fmovscs	%xcc,	%f24,	%f23
	sethi	0x1849,	%i3
	xnorcc	%i5,	0x18EF,	%i0
	sdivx	%l0,	0x0316,	%o3
	udivx	%g3,	0x1A10,	%o0
	orcc	%g5,	%o1,	%l4
	fands	%f8,	%f25,	%f5
	edge16n	%o4,	%l6,	%g6
	and	%g2,	0x0941,	%l5
	movne	%icc,	%g1,	%i6
	srl	%l1,	%l2,	%g7
	add	%i4,	%o7,	%l3
	andcc	%g4,	0x1095,	%i1
	smul	%o6,	%o2,	%o5
	movg	%icc,	%i2,	%i7
	nop
	set	0x4E, %g7
	lduh	[%l7 + %g7],	%i3
	movrgez	%i0,	0x0D3,	%i5
	movrlz	%o3,	%g3,	%l0
	udiv	%g5,	0x1B44,	%o1
	nop
	set	0x18, %i2
	lduh	[%l7 + %i2],	%o0
	smul	%o4,	0x0FC6,	%l6
	fornot1	%f6,	%f12,	%f6
	movge	%icc,	%g6,	%l4
	sir	0x179B
	xnorcc	%g2,	%g1,	%i6
	srl	%l5,	%l1,	%g7
	mova	%xcc,	%i4,	%o7
	ld	[%l7 + 0x1C],	%f6
	fpack32	%f12,	%f8,	%f14
	movne	%icc,	%l3,	%l2
	fmovdge	%icc,	%f24,	%f14
	fmovsne	%xcc,	%f21,	%f16
	mulx	%i1,	%o6,	%g4
	movle	%icc,	%o5,	%i2
	sdivx	%i7,	0x07AB,	%i3
	umulcc	%i0,	0x195B,	%i5
	stw	%o3,	[%l7 + 0x64]
	save %g3, %o2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o1,	%g5,	%o0
	fornot1	%f20,	%f16,	%f22
	andcc	%l6,	0x0288,	%o4
	movrgz	%g6,	%l4,	%g2
	movpos	%xcc,	%g1,	%i6
	fmovsleu	%icc,	%f8,	%f10
	st	%f2,	[%l7 + 0x5C]
	movrlz	%l1,	%g7,	%i4
	addc	%l5,	0x07F7,	%l3
	ldx	[%l7 + 0x50],	%l2
	or	%o7,	0x03E9,	%o6
	edge16l	%g4,	%i1,	%i2
	xorcc	%o5,	%i3,	%i0
	edge32ln	%i7,	%o3,	%i5
	nop
	set	0x68, %o5
	ldsh	[%l7 + %o5],	%o2
	ldd	[%l7 + 0x38],	%f28
	and	%g3,	%o1,	%g5
	movpos	%xcc,	%o0,	%l6
	fmovdne	%xcc,	%f20,	%f13
	mulscc	%l0,	%g6,	%o4
	sth	%g2,	[%l7 + 0x5E]
	movrlez	%l4,	%i6,	%l1
	orn	%g1,	0x107C,	%g7
	xnorcc	%l5,	0x04BD,	%i4
	fsrc1s	%f26,	%f11
	srlx	%l2,	%l3,	%o7
	srax	%o6,	%i1,	%g4
	sdivx	%o5,	0x12DA,	%i2
	fmovrdgez	%i0,	%f14,	%f10
	array16	%i7,	%o3,	%i5
	array32	%i3,	%g3,	%o1
	xor	%o2,	%g5,	%o0
	fandnot2	%f26,	%f24,	%f30
	fmul8ulx16	%f20,	%f16,	%f8
	edge16n	%l6,	%l0,	%o4
	lduh	[%l7 + 0x4E],	%g2
	sdivcc	%l4,	0x03EA,	%g6
	array32	%l1,	%g1,	%g7
	array16	%l5,	%i4,	%l2
	mova	%xcc,	%i6,	%l3
	movneg	%icc,	%o7,	%i1
	edge8	%o6,	%g4,	%o5
	edge16l	%i2,	%i7,	%i0
	fmovrslez	%i5,	%f7,	%f6
	fmovrdlez	%o3,	%f26,	%f4
	nop
	set	0x48, %o0
	ldsw	[%l7 + %o0],	%i3
	stb	%o1,	[%l7 + 0x1A]
	mulx	%g3,	0x1605,	%o2
	fnands	%f9,	%f15,	%f30
	udivx	%o0,	0x1B6C,	%g5
	fmovsg	%icc,	%f20,	%f23
	ld	[%l7 + 0x60],	%f28
	ldsh	[%l7 + 0x1A],	%l6
	andncc	%l0,	%g2,	%o4
	movrgez	%g6,	%l4,	%l1
	fors	%f24,	%f21,	%f9
	movrne	%g1,	%g7,	%l5
	movgu	%icc,	%i4,	%i6
	addc	%l2,	0x0AB5,	%o7
	fpadd32s	%f14,	%f8,	%f9
	fcmpgt32	%f4,	%f0,	%l3
	mulscc	%o6,	0x1C4F,	%i1
	sub	%o5,	%g4,	%i7
	edge16ln	%i0,	%i5,	%i2
	xnor	%i3,	0x0FD5,	%o3
	ldd	[%l7 + 0x38],	%f26
	subccc	%o1,	0x110E,	%o2
	fmovsleu	%icc,	%f13,	%f7
	srax	%g3,	0x00,	%g5
	smul	%o0,	%l0,	%l6
	xorcc	%o4,	0x1903,	%g2
	smulcc	%g6,	%l1,	%g1
	fsrc2	%f20,	%f4
	udiv	%g7,	0x1AEE,	%l5
	stx	%i4,	[%l7 + 0x40]
	fmovsgu	%xcc,	%f28,	%f17
	movne	%icc,	%i6,	%l2
	fmovrdgz	%o7,	%f26,	%f8
	ldd	[%l7 + 0x10],	%l4
	stb	%o6,	[%l7 + 0x67]
	std	%f8,	[%l7 + 0x18]
	nop
	set	0x38, %g6
	lduh	[%l7 + %g6],	%i1
	fmovsl	%xcc,	%f7,	%f0
	mova	%icc,	%l3,	%g4
	fmovsl	%icc,	%f30,	%f21
	movg	%icc,	%i7,	%i0
	fmovsleu	%icc,	%f24,	%f18
	sdivcc	%o5,	0x1C24,	%i5
	array8	%i3,	%o3,	%o1
	ldd	[%l7 + 0x58],	%f18
	and	%o2,	%i2,	%g5
	edge32n	%o0,	%g3,	%l6
	sdiv	%l0,	0x1FB1,	%o4
	xnorcc	%g2,	%l1,	%g6
	fnand	%f2,	%f26,	%f12
	array32	%g1,	%l5,	%g7
	sdivcc	%i4,	0x12C2,	%i6
	sdivcc	%l2,	0x0481,	%l4
	movrlz	%o7,	0x2CE,	%o6
	edge8ln	%l3,	%g4,	%i1
	andcc	%i0,	0x0480,	%i7
	movneg	%xcc,	%i5,	%i3
	stw	%o5,	[%l7 + 0x44]
	addc	%o3,	%o2,	%o1
	smulcc	%i2,	0x1FDC,	%o0
	udiv	%g5,	0x0203,	%g3
	fandnot1	%f20,	%f6,	%f0
	fcmped	%fcc2,	%f12,	%f10
	edge32	%l6,	%o4,	%l0
	smul	%g2,	%g6,	%g1
	add	%l5,	%l1,	%g7
	xor	%i4,	0x1C15,	%i6
	fmovsgu	%icc,	%f9,	%f31
	fcmped	%fcc2,	%f8,	%f16
	udivcc	%l2,	0x1F55,	%o7
	fmul8x16al	%f25,	%f25,	%f10
	array32	%o6,	%l4,	%l3
	movcs	%icc,	%i1,	%i0
	sdivx	%i7,	0x09F6,	%g4
	udivx	%i5,	0x1C5B,	%o5
	subc	%i3,	0x16B3,	%o2
	movvc	%icc,	%o3,	%i2
	ldsh	[%l7 + 0x42],	%o0
	ld	[%l7 + 0x54],	%f27
	xnorcc	%g5,	0x1DA5,	%o1
	fpadd16s	%f2,	%f8,	%f9
	andn	%g3,	%l6,	%l0
	movrgez	%g2,	%o4,	%g1
	sub	%g6,	%l1,	%l5
	fornot1	%f20,	%f14,	%f18
	and	%i4,	%i6,	%l2
	fmovrsgz	%o7,	%f15,	%f29
	mulscc	%g7,	0x0126,	%o6
	edge16	%l4,	%i1,	%i0
	andcc	%i7,	0x165B,	%g4
	ldd	[%l7 + 0x50],	%l2
	fcmpne16	%f14,	%f14,	%o5
	array32	%i3,	%i5,	%o3
	andncc	%o2,	%i2,	%g5
	nop
	set	0x40, %i1
	ldx	[%l7 + %i1],	%o0
	sllx	%g3,	0x19,	%o1
	lduw	[%l7 + 0x6C],	%l0
	sdiv	%g2,	0x10AD,	%o4
	movrgez	%g1,	0x1CA,	%g6
	sra	%l6,	%l5,	%l1
	edge8	%i6,	%i4,	%l2
	smulcc	%o7,	0x12C5,	%o6
	add	%g7,	0x0B16,	%l4
	addcc	%i0,	%i7,	%g4
	for	%f24,	%f14,	%f22
	stw	%l3,	[%l7 + 0x48]
	udivcc	%o5,	0x02D5,	%i3
	fmovrde	%i5,	%f30,	%f26
	fmovdneg	%xcc,	%f11,	%f17
	add	%i1,	%o3,	%o2
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%f0
	ldsw	[%l7 + 0x18],	%g5
	edge8	%i2,	%g3,	%o0
	ldsh	[%l7 + 0x3E],	%o1
	ldub	[%l7 + 0x1F],	%g2
	fcmple16	%f6,	%f16,	%l0
	mulx	%o4,	%g6,	%g1
	movrgez	%l6,	0x021,	%l1
	siam	0x7
	ldd	[%l7 + 0x58],	%f10
	movrne	%l5,	0x253,	%i6
	fsrc2s	%f24,	%f20
	edge32n	%l2,	%o7,	%o6
	sdivcc	%i4,	0x1E96,	%g7
	ldd	[%l7 + 0x68],	%f24
	mulx	%i0,	0x1705,	%i7
	fmovdle	%xcc,	%f23,	%f6
	movvc	%xcc,	%g4,	%l4
	fmovdgu	%icc,	%f17,	%f8
	movcc	%icc,	%l3,	%i3
	sub	%i5,	%o5,	%i1
	fmovsn	%xcc,	%f9,	%f31
	sll	%o2,	%g5,	%o3
	movrlez	%g3,	0x2CF,	%o0
	nop
	set	0x20, %o3
	stx	%i2,	[%l7 + %o3]
	movrlez	%o1,	%g2,	%o4
	movpos	%xcc,	%g6,	%g1
	array16	%l6,	%l1,	%l0
	andncc	%l5,	%i6,	%l2
	move	%icc,	%o6,	%o7
	sdiv	%g7,	0x1A2E,	%i0
	movg	%xcc,	%i4,	%i7
	orncc	%g4,	0x01EB,	%l3
	movvc	%icc,	%i3,	%l4
	fmovrdne	%i5,	%f24,	%f2
	fmovrdne	%i1,	%f6,	%f4
	sir	0x01E7
	fornot1s	%f12,	%f1,	%f30
	fnegd	%f6,	%f22
	edge16l	%o2,	%o5,	%o3
	ldsh	[%l7 + 0x46],	%g5
	nop
	set	0x14, %o2
	lduw	[%l7 + %o2],	%o0
	fcmpgt32	%f6,	%f22,	%g3
	movrne	%i2,	0x1A8,	%g2
	array8	%o1,	%g6,	%g1
	xnorcc	%l6,	%l1,	%l0
	edge8	%l5,	%o4,	%l2
	andncc	%o6,	%i6,	%o7
	smul	%g7,	%i4,	%i0
	movre	%g4,	%i7,	%i3
	movne	%xcc,	%l3,	%l4
	stb	%i5,	[%l7 + 0x18]
	orncc	%o2,	0x0C46,	%o5
	ldsb	[%l7 + 0x43],	%i1
	edge16ln	%o3,	%g5,	%g3
	subcc	%i2,	0x1C4C,	%g2
	xnorcc	%o1,	%g6,	%o0
	move	%xcc,	%g1,	%l6
	smul	%l0,	0x1093,	%l5
	addcc	%o4,	0x01BF,	%l1
	fmuld8ulx16	%f5,	%f26,	%f28
	andn	%l2,	0x19AD,	%o6
	fones	%f26
	fpadd32s	%f11,	%f24,	%f28
	edge8ln	%o7,	%i6,	%g7
	andn	%i0,	%i4,	%g4
	fmovdg	%xcc,	%f7,	%f7
	srlx	%i7,	0x03,	%i3
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	mova	%icc,	%i5,	%o5
	ldub	[%l7 + 0x43],	%i1
	ldsb	[%l7 + 0x61],	%o3
	fcmps	%fcc2,	%f5,	%f23
	movneg	%xcc,	%o2,	%g5
	alignaddr	%i2,	%g3,	%g2
	movn	%icc,	%o1,	%o0
	alignaddrl	%g6,	%g1,	%l6
	edge8	%l0,	%o4,	%l5
	umulcc	%l2,	%o6,	%o7
	movge	%xcc,	%i6,	%g7
	fmovdvs	%icc,	%f2,	%f19
	ldd	[%l7 + 0x18],	%f12
	sllx	%i0,	0x16,	%l1
	subcc	%g4,	%i7,	%i4
	edge32	%i3,	%l3,	%i5
	fpmerge	%f10,	%f1,	%f22
	fand	%f6,	%f12,	%f24
	srax	%o5,	%l4,	%o3
	std	%f14,	[%l7 + 0x48]
	lduh	[%l7 + 0x1E],	%i1
	fandnot1	%f24,	%f10,	%f2
	sdivcc	%o2,	0x1FDE,	%i2
	sdiv	%g3,	0x11A7,	%g5
	array8	%g2,	%o1,	%o0
	stw	%g1,	[%l7 + 0x10]
	fmovrsne	%l6,	%f31,	%f29
	popc	%g6,	%l0
	movl	%xcc,	%l5,	%o4
	or	%l2,	0x1115,	%o6
	mulx	%o7,	%i6,	%g7
	movrlz	%l1,	0x1DD,	%g4
	fmovdvc	%xcc,	%f21,	%f13
	st	%f25,	[%l7 + 0x08]
	movcs	%icc,	%i0,	%i7
	movpos	%icc,	%i4,	%l3
	movpos	%icc,	%i5,	%i3
	fmovdpos	%icc,	%f14,	%f28
	subccc	%l4,	0x01C7,	%o3
	move	%xcc,	%i1,	%o5
	fones	%f11
	sdivcc	%i2,	0x031C,	%o2
	stx	%g3,	[%l7 + 0x38]
	fmovsa	%xcc,	%f24,	%f27
	movvs	%xcc,	%g5,	%o1
	fornot1s	%f15,	%f17,	%f2
	movrgz	%o0,	0x1B9,	%g2
	restore %l6, 0x0D31, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1EE6,	%l0
	sth	%g6,	[%l7 + 0x3C]
	fzeros	%f27
	edge32l	%o4,	%l5,	%l2
	subcc	%o7,	%i6,	%o6
	fmovsleu	%xcc,	%f8,	%f18
	add	%g7,	%l1,	%i0
	fmul8ulx16	%f6,	%f28,	%f6
	orn	%g4,	%i4,	%i7
	fmovspos	%icc,	%f20,	%f31
	movre	%i5,	0x3E0,	%i3
	and	%l4,	%o3,	%i1
	orncc	%o5,	0x062D,	%i2
	movpos	%icc,	%l3,	%o2
	fmovrde	%g3,	%f24,	%f30
	movcs	%icc,	%g5,	%o1
	fpsub32s	%f26,	%f24,	%f7
	fone	%f24
	fmovdgu	%icc,	%f14,	%f14
	movvs	%xcc,	%g2,	%o0
	andncc	%l6,	%g1,	%g6
	edge16ln	%o4,	%l5,	%l0
	andncc	%l2,	%o7,	%i6
	srax	%g7,	0x18,	%o6
	ldd	[%l7 + 0x48],	%i0
	and	%l1,	%g4,	%i7
	srl	%i5,	%i4,	%l4
	subccc	%i3,	0x1BD7,	%i1
	udiv	%o3,	0x1740,	%i2
	fands	%f6,	%f26,	%f11
	nop
	set	0x6A, %o4
	ldsh	[%l7 + %o4],	%l3
	fmovsa	%icc,	%f19,	%f0
	movrgz	%o2,	0x01A,	%o5
	edge8ln	%g5,	%o1,	%g2
	lduw	[%l7 + 0x4C],	%o0
	fmovd	%f4,	%f20
	fmovdle	%icc,	%f24,	%f7
	and	%l6,	%g1,	%g6
	edge32ln	%g3,	%l5,	%l0
	movpos	%xcc,	%o4,	%o7
	fzeros	%f21
	fornot1	%f16,	%f12,	%f2
	udivcc	%l2,	0x03C0,	%g7
	andn	%i6,	0x116E,	%o6
	udiv	%i0,	0x0628,	%g4
	edge32n	%i7,	%l1,	%i5
	lduw	[%l7 + 0x7C],	%i4
	ld	[%l7 + 0x38],	%f1
	addc	%l4,	%i3,	%o3
	andn	%i2,	0x1C31,	%l3
	fpsub16	%f16,	%f20,	%f18
	fmul8x16	%f28,	%f12,	%f16
	andncc	%i1,	%o2,	%o5
	udivcc	%o1,	0x18FF,	%g2
	movvc	%icc,	%o0,	%g5
	edge8ln	%g1,	%g6,	%l6
	xorcc	%g3,	0x08EC,	%l0
	array8	%l5,	%o4,	%o7
	fmovrslez	%l2,	%f6,	%f12
	fcmple16	%f6,	%f20,	%i6
	movpos	%xcc,	%g7,	%o6
	edge16	%g4,	%i7,	%l1
	andncc	%i5,	%i0,	%i4
	ldsb	[%l7 + 0x7D],	%l4
	udiv	%i3,	0x0A02,	%i2
	stb	%l3,	[%l7 + 0x21]
	sdivcc	%o3,	0x17A8,	%o2
	add	%o5,	0x059B,	%o1
	fmovsvc	%icc,	%f12,	%f17
	addccc	%g2,	%i1,	%g5
	ldd	[%l7 + 0x20],	%o0
	stw	%g1,	[%l7 + 0x24]
	udiv	%g6,	0x1A32,	%g3
	sllx	%l0,	%l5,	%o4
	subcc	%l6,	%o7,	%i6
	fcmpd	%fcc3,	%f30,	%f10
	smul	%g7,	%l2,	%o6
	udivcc	%g4,	0x1234,	%l1
	stx	%i7,	[%l7 + 0x08]
	movleu	%xcc,	%i5,	%i4
	addc	%i0,	%i3,	%i2
	fnot2s	%f16,	%f24
	xorcc	%l4,	%o3,	%o2
	sdivx	%l3,	0x16A7,	%o1
	orcc	%o5,	%i1,	%g5
	movle	%xcc,	%o0,	%g1
	xor	%g2,	%g6,	%g3
	movvc	%icc,	%l0,	%o4
	std	%f18,	[%l7 + 0x18]
	andn	%l6,	0x1EA9,	%o7
	subc	%l5,	0x0256,	%i6
	fmovspos	%xcc,	%f15,	%f11
	siam	0x1
	udivx	%l2,	0x0666,	%g7
	xorcc	%g4,	0x14CF,	%o6
	sra	%i7,	0x18,	%i5
	movle	%xcc,	%i4,	%l1
	udivcc	%i0,	0x05A5,	%i2
	fcmple16	%f4,	%f0,	%l4
	edge8l	%o3,	%i3,	%o2
	sll	%o1,	%o5,	%i1
	stw	%l3,	[%l7 + 0x38]
	fcmpeq32	%f24,	%f16,	%o0
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	and	%g2,	%g6,	%l0
	sll	%o4,	%l6,	%o7
	fcmps	%fcc1,	%f10,	%f14
	addcc	%g3,	0x1D34,	%i6
	movcc	%xcc,	%l2,	%g7
	fmovscc	%xcc,	%f7,	%f25
	orncc	%l5,	%o6,	%g4
	stb	%i5,	[%l7 + 0x2F]
	andcc	%i7,	%l1,	%i0
	movrlez	%i4,	%l4,	%i2
	sllx	%o3,	0x11,	%o2
	movrlez	%i3,	%o1,	%o5
	fmovd	%f10,	%f22
	sra	%l3,	%o0,	%i1
	srax	%g1,	0x0C,	%g5
	ldx	[%l7 + 0x58],	%g2
	array32	%l0,	%o4,	%l6
	fcmps	%fcc2,	%f25,	%f20
	ldd	[%l7 + 0x10],	%o6
	movcc	%icc,	%g3,	%i6
	fcmpne32	%f10,	%f24,	%g6
	stx	%l2,	[%l7 + 0x30]
	xor	%g7,	%l5,	%g4
	st	%f31,	[%l7 + 0x3C]
	movcc	%xcc,	%i5,	%i7
	sethi	0x093A,	%o6
	subccc	%i0,	0x198F,	%l1
	movcc	%xcc,	%l4,	%i2
	edge8l	%i4,	%o3,	%o2
	srlx	%i3,	%o5,	%o1
	ld	[%l7 + 0x30],	%f14
	mulscc	%l3,	0x1185,	%i1
	andn	%o0,	0x185D,	%g5
	fmovrdgz	%g2,	%f0,	%f8
	movge	%icc,	%g1,	%l0
	udivcc	%o4,	0x0C41,	%o7
	subccc	%l6,	%i6,	%g3
	ldd	[%l7 + 0x68],	%f6
	fmovsne	%xcc,	%f14,	%f8
	array8	%g6,	%l2,	%l5
	movne	%xcc,	%g7,	%g4
	mova	%icc,	%i7,	%i5
	sdiv	%o6,	0x0554,	%i0
	edge16	%l1,	%l4,	%i4
	sllx	%o3,	%i2,	%o2
	ldx	[%l7 + 0x50],	%i3
	edge16l	%o5,	%o1,	%i1
	fmovde	%icc,	%f16,	%f22
	and	%l3,	%o0,	%g5
	ldsw	[%l7 + 0x24],	%g2
	restore %g1, %o4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f20,	%f16,	%l0
	xor	%i6,	%g3,	%l6
	lduh	[%l7 + 0x48],	%g6
	fxnor	%f26,	%f12,	%f24
	edge32	%l2,	%g7,	%l5
	fnors	%f4,	%f1,	%f20
	edge8ln	%i7,	%i5,	%o6
	udivcc	%g4,	0x140F,	%i0
	srax	%l1,	0x0C,	%l4
	fpsub32	%f26,	%f18,	%f2
	subcc	%o3,	0x06A5,	%i2
	udivx	%o2,	0x07BD,	%i3
	save %i4, 0x0FC5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1C47
	fxnor	%f18,	%f18,	%f10
	edge8	%i1,	%o1,	%o0
	array8	%g5,	%g2,	%l3
	sllx	%g1,	0x0A,	%o4
	fpadd16	%f30,	%f0,	%f12
	fmovscs	%xcc,	%f22,	%f1
	andncc	%o7,	%i6,	%l0
	fpadd16	%f10,	%f0,	%f20
	fands	%f6,	%f7,	%f0
	move	%xcc,	%g3,	%g6
	movg	%xcc,	%l6,	%l2
	edge8l	%g7,	%i7,	%l5
	srax	%i5,	0x1A,	%o6
	fmovdne	%icc,	%f26,	%f17
	ldx	[%l7 + 0x70],	%g4
	fcmpgt32	%f0,	%f4,	%i0
	fpackfix	%f4,	%f10
	subccc	%l4,	%o3,	%i2
	stw	%l1,	[%l7 + 0x58]
	movrlez	%i3,	0x056,	%i4
	array8	%o2,	%o5,	%i1
	nop
	set	0x26, %i7
	sth	%o0,	[%l7 + %i7]
	xnor	%o1,	%g5,	%g2
	movvc	%icc,	%l3,	%o4
	stb	%o7,	[%l7 + 0x25]
	array32	%i6,	%l0,	%g3
	fcmpes	%fcc1,	%f22,	%f15
	stx	%g1,	[%l7 + 0x68]
	ldx	[%l7 + 0x70],	%g6
	movre	%l2,	0x0B3,	%l6
	fornot1	%f24,	%f24,	%f6
	addc	%g7,	0x0885,	%l5
	popc	0x1D75,	%i7
	umulcc	%o6,	0x1BF7,	%g4
	edge8ln	%i0,	%i5,	%l4
	addccc	%o3,	0x001E,	%i2
	mulscc	%l1,	0x1C1B,	%i3
	edge32ln	%i4,	%o2,	%i1
	ldx	[%l7 + 0x58],	%o5
	ldsb	[%l7 + 0x2E],	%o0
	srax	%o1,	%g5,	%l3
	or	%g2,	0x1987,	%o4
	fmovsneg	%icc,	%f21,	%f0
	udivcc	%o7,	0x1A89,	%l0
	fpadd32s	%f30,	%f20,	%f18
	fmovdleu	%xcc,	%f10,	%f31
	edge8l	%i6,	%g1,	%g3
	fmovdgu	%xcc,	%f2,	%f5
	edge16ln	%g6,	%l6,	%l2
	movgu	%icc,	%g7,	%l5
	sllx	%i7,	%o6,	%i0
	edge8l	%i5,	%l4,	%g4
	xor	%i2,	%l1,	%o3
	array32	%i3,	%i4,	%i1
	movcc	%icc,	%o2,	%o0
	movgu	%icc,	%o5,	%g5
	andncc	%l3,	%o1,	%o4
	edge16l	%g2,	%l0,	%o7
	edge32l	%g1,	%i6,	%g6
	movleu	%icc,	%g3,	%l6
	sll	%g7,	%l5,	%l2
	fmovdvs	%icc,	%f1,	%f31
	addcc	%o6,	%i7,	%i0
	edge32	%i5,	%l4,	%i2
	edge32	%l1,	%o3,	%i3
	movrgz	%g4,	0x240,	%i4
	nop
	set	0x27, %g5
	ldub	[%l7 + %g5],	%i1
	ldsb	[%l7 + 0x7F],	%o0
	movcs	%icc,	%o5,	%o2
	sra	%l3,	0x0D,	%g5
	movg	%xcc,	%o4,	%o1
	addcc	%g2,	%l0,	%o7
	umulcc	%g1,	%g6,	%i6
	sub	%l6,	%g7,	%g3
	fpsub32s	%f6,	%f11,	%f28
	movg	%icc,	%l2,	%l5
	nop
	set	0x3C, %i6
	sth	%i7,	[%l7 + %i6]
	movre	%o6,	%i5,	%i0
	fcmpne16	%f30,	%f24,	%i2
	ldd	[%l7 + 0x20],	%f4
	lduh	[%l7 + 0x6A],	%l4
	lduh	[%l7 + 0x10],	%l1
	ldsb	[%l7 + 0x79],	%i3
	smulcc	%g4,	0x1A85,	%o3
	fornot2	%f0,	%f6,	%f14
	xnor	%i1,	%o0,	%o5
	mova	%icc,	%i4,	%o2
	orncc	%l3,	%o4,	%g5
	or	%o1,	0x1B5B,	%g2
	udivx	%o7,	0x1E51,	%g1
	movle	%xcc,	%g6,	%i6
	fpackfix	%f4,	%f1
	fmovdn	%xcc,	%f20,	%f11
	sethi	0x0036,	%l6
	ldub	[%l7 + 0x0C],	%g7
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	fmovsl	%xcc,	%f5,	%f24
	fnegs	%f22,	%f29
	edge8l	%l5,	%i7,	%o6
	movrgz	%l2,	%i0,	%i2
	faligndata	%f10,	%f28,	%f14
	sllx	%l4,	0x18,	%l1
	movleu	%icc,	%i3,	%i5
	fmul8sux16	%f24,	%f20,	%f28
	edge16	%g4,	%o3,	%i1
	lduh	[%l7 + 0x7A],	%o0
	sir	0x1ACF
	nop
	set	0x24, %o6
	stw	%o5,	[%l7 + %o6]
	edge32ln	%i4,	%o2,	%o4
	movleu	%xcc,	%l3,	%o1
	mova	%icc,	%g2,	%o7
	movvc	%icc,	%g1,	%g6
	ldd	[%l7 + 0x60],	%g4
	st	%f12,	[%l7 + 0x74]
	edge32ln	%l6,	%i6,	%g7
	andn	%g3,	0x0A2A,	%l5
	nop
	set	0x3C, %g3
	lduh	[%l7 + %g3],	%l0
	mova	%icc,	%i7,	%o6
	xnorcc	%i0,	0x1598,	%l2
	edge16n	%l4,	%i2,	%i3
	fmovrdne	%l1,	%f12,	%f6
	stw	%i5,	[%l7 + 0x2C]
	nop
	set	0x0C, %l2
	ldsh	[%l7 + %l2],	%o3
	stb	%g4,	[%l7 + 0x36]
	stb	%i1,	[%l7 + 0x0D]
	movneg	%icc,	%o5,	%i4
	udivcc	%o0,	0x0E98,	%o4
	movgu	%icc,	%l3,	%o1
	addc	%o2,	%o7,	%g2
	subc	%g1,	%g5,	%g6
	xor	%l6,	0x122A,	%g7
	stb	%i6,	[%l7 + 0x67]
	fpadd32	%f14,	%f20,	%f4
	movcs	%xcc,	%l5,	%g3
	fnot2	%f24,	%f0
	ldsb	[%l7 + 0x2C],	%l0
	fnot1	%f4,	%f22
	andcc	%i7,	0x198F,	%i0
	fmul8sux16	%f4,	%f16,	%f2
	fmovscs	%icc,	%f4,	%f20
	array8	%o6,	%l4,	%i2
	fxnor	%f8,	%f14,	%f20
	lduh	[%l7 + 0x7E],	%i3
	fornot2	%f8,	%f6,	%f0
	subccc	%l1,	0x1AF9,	%i5
	movneg	%icc,	%o3,	%g4
	srax	%i1,	%o5,	%i4
	stw	%l2,	[%l7 + 0x7C]
	xor	%o0,	%l3,	%o1
	edge16n	%o2,	%o4,	%o7
	movrne	%g2,	0x0EC,	%g1
	subc	%g6,	0x12BE,	%l6
	fmovrslz	%g5,	%f25,	%f15
	movrgez	%g7,	0x23C,	%i6
	ld	[%l7 + 0x20],	%f13
	movcs	%xcc,	%g3,	%l0
	save %i7, %i0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f2,	%f31,	%f14
	movrlz	%l4,	0x2E1,	%o6
	or	%i2,	%i3,	%l1
	fmovrdgez	%o3,	%f26,	%f6
	xorcc	%g4,	0x0419,	%i5
	movl	%icc,	%o5,	%i1
	popc	%l2,	%i4
	ldsh	[%l7 + 0x2C],	%o0
	srlx	%l3,	0x06,	%o2
	edge8n	%o4,	%o7,	%o1
	movg	%icc,	%g2,	%g6
	edge8n	%l6,	%g5,	%g1
	xnor	%g7,	%g3,	%l0
	sub	%i6,	0x0E04,	%i7
	udivx	%l5,	0x0C6A,	%l4
	xnorcc	%o6,	0x14D6,	%i0
	andn	%i2,	0x1DD9,	%l1
	udiv	%i3,	0x0875,	%g4
	std	%f18,	[%l7 + 0x78]
	addc	%o3,	0x1B5F,	%o5
	sethi	0x0A9A,	%i1
	xnorcc	%l2,	0x0B6A,	%i4
	stx	%i5,	[%l7 + 0x08]
	edge32n	%o0,	%l3,	%o2
	subc	%o4,	0x1F94,	%o1
	fmul8x16au	%f19,	%f18,	%f2
	sllx	%g2,	0x1A,	%g6
	std	%f26,	[%l7 + 0x10]
	fnand	%f2,	%f24,	%f14
	edge32ln	%l6,	%g5,	%g1
	mulscc	%o7,	%g7,	%l0
	edge16l	%g3,	%i6,	%l5
	fmovdpos	%xcc,	%f21,	%f31
	xorcc	%l4,	%i7,	%i0
	lduh	[%l7 + 0x24],	%i2
	fmovdleu	%icc,	%f21,	%f5
	movrgez	%o6,	%l1,	%g4
	movg	%icc,	%o3,	%o5
	andncc	%i1,	%i3,	%l2
	edge32ln	%i4,	%o0,	%i5
	fcmped	%fcc3,	%f26,	%f6
	edge16n	%o2,	%o4,	%o1
	ld	[%l7 + 0x70],	%f24
	sra	%l3,	0x15,	%g6
	movvc	%xcc,	%l6,	%g2
	ldsb	[%l7 + 0x70],	%g1
	fmuld8sux16	%f29,	%f8,	%f20
	andn	%g5,	0x0D8E,	%g7
	fcmpne16	%f26,	%f28,	%l0
	subccc	%o7,	0x00C4,	%i6
	ldd	[%l7 + 0x08],	%f14
	movg	%xcc,	%g3,	%l4
	std	%f24,	[%l7 + 0x50]
	movrlez	%l5,	0x1E6,	%i0
	smulcc	%i7,	%o6,	%l1
	fmovrde	%i2,	%f22,	%f6
	udiv	%g4,	0x0345,	%o3
	edge16ln	%o5,	%i1,	%i3
	ldsb	[%l7 + 0x17],	%l2
	sth	%o0,	[%l7 + 0x08]
	fsrc1	%f2,	%f14
	stw	%i5,	[%l7 + 0x28]
	sir	0x1427
	edge32l	%i4,	%o4,	%o1
	fnot1s	%f31,	%f14
	edge8	%l3,	%g6,	%o2
	addcc	%l6,	%g1,	%g5
	restore %g7, 0x09DB, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o7,	%i6
	movrne	%l0,	0x03D,	%l4
	fnands	%f5,	%f17,	%f4
	fnands	%f20,	%f11,	%f29
	sub	%l5,	%g3,	%i7
	ldub	[%l7 + 0x0D],	%o6
	andncc	%l1,	%i0,	%g4
	smul	%o3,	%o5,	%i2
	mova	%xcc,	%i3,	%i1
	addccc	%l2,	%o0,	%i5
	srl	%i4,	0x07,	%o1
	movg	%xcc,	%o4,	%g6
	mulx	%o2,	0x0CC5,	%l3
	addcc	%l6,	0x02AB,	%g5
	edge8n	%g1,	%g2,	%g7
	fxnors	%f5,	%f0,	%f30
	mulscc	%o7,	%l0,	%l4
	fands	%f16,	%f13,	%f3
	fcmpne32	%f0,	%f6,	%l5
	movrgez	%g3,	%i6,	%i7
	popc	%o6,	%i0
	movvs	%xcc,	%g4,	%o3
	fmovdge	%icc,	%f7,	%f15
	fmovspos	%xcc,	%f14,	%f20
	fxor	%f24,	%f30,	%f18
	fmul8x16al	%f4,	%f29,	%f12
	movrgez	%o5,	0x214,	%l1
	fmul8x16al	%f16,	%f16,	%f22
	ldsw	[%l7 + 0x44],	%i2
	fmovse	%xcc,	%f9,	%f28
	nop
	set	0x70, %l1
	ldx	[%l7 + %l1],	%i3
	andn	%l2,	0x0B3E,	%o0
	sra	%i1,	%i5,	%i4
	fmovrdne	%o4,	%f2,	%f18
	movrlz	%o1,	%g6,	%o2
	movcc	%xcc,	%l6,	%g5
	addcc	%g1,	0x16EE,	%g2
	edge32n	%g7,	%o7,	%l3
	sdivcc	%l4,	0x0D6D,	%l0
	movg	%icc,	%g3,	%l5
	fnands	%f18,	%f3,	%f6
	fmovde	%icc,	%f6,	%f15
	sdivcc	%i6,	0x17EE,	%o6
	fpadd32	%f4,	%f6,	%f0
	ldd	[%l7 + 0x50],	%i6
	array32	%i0,	%g4,	%o3
	edge8n	%o5,	%l1,	%i2
	fmovse	%xcc,	%f23,	%f0
	sethi	0x06F7,	%l2
	ldx	[%l7 + 0x18],	%i3
	fmovscs	%xcc,	%f21,	%f4
	edge8l	%o0,	%i5,	%i1
	fmul8ulx16	%f12,	%f30,	%f0
	stx	%i4,	[%l7 + 0x28]
	movge	%icc,	%o4,	%o1
	xnor	%g6,	%l6,	%o2
	movvc	%icc,	%g1,	%g5
	fnegd	%f26,	%f6
	ldsw	[%l7 + 0x14],	%g7
	fornot2	%f2,	%f20,	%f8
	fcmpgt16	%f4,	%f22,	%o7
	sdivcc	%g2,	0x10C4,	%l3
	edge8ln	%l4,	%l0,	%l5
	ldd	[%l7 + 0x58],	%g2
	fcmpes	%fcc0,	%f3,	%f21
	alignaddrl	%i6,	%o6,	%i0
	movvs	%xcc,	%i7,	%o3
	std	%f22,	[%l7 + 0x48]
	edge8n	%o5,	%g4,	%l1
	ldub	[%l7 + 0x29],	%l2
	fornot2	%f4,	%f0,	%f0
	edge16l	%i2,	%o0,	%i5
	xnor	%i1,	0x18A6,	%i3
	movg	%xcc,	%o4,	%i4
	ldub	[%l7 + 0x7E],	%o1
	ld	[%l7 + 0x5C],	%f31
	edge32n	%l6,	%o2,	%g6
	movge	%icc,	%g5,	%g7
	fornot1s	%f5,	%f22,	%f3
	fmovrsne	%g1,	%f10,	%f5
	movvs	%icc,	%o7,	%l3
	movrlz	%g2,	0x082,	%l0
	or	%l4,	%g3,	%i6
	edge8ln	%l5,	%o6,	%i7
	fmovsneg	%icc,	%f24,	%f24
	stb	%o3,	[%l7 + 0x73]
	ld	[%l7 + 0x44],	%f14
	subc	%o5,	%g4,	%l1
	movn	%xcc,	%i0,	%l2
	movne	%xcc,	%o0,	%i5
	movl	%xcc,	%i1,	%i2
	fmovrdlez	%o4,	%f0,	%f4
	xor	%i4,	0x1BB0,	%o1
	fmovsvs	%icc,	%f7,	%f23
	movre	%i3,	%o2,	%g6
	fxnors	%f0,	%f19,	%f21
	movl	%icc,	%g5,	%l6
	andn	%g7,	0x1739,	%g1
	add	%l3,	%o7,	%l0
	fandnot1s	%f14,	%f27,	%f2
	fmovsvs	%xcc,	%f2,	%f6
	ldx	[%l7 + 0x30],	%g2
	stx	%g3,	[%l7 + 0x48]
	movle	%icc,	%i6,	%l4
	addccc	%l5,	%o6,	%i7
	subc	%o3,	0x1E16,	%g4
	stb	%l1,	[%l7 + 0x69]
	fnegs	%f17,	%f21
	movl	%xcc,	%i0,	%l2
	fabsd	%f0,	%f14
	fmovdne	%xcc,	%f9,	%f18
	fcmpes	%fcc1,	%f1,	%f16
	movge	%xcc,	%o0,	%o5
	add	%i1,	0x06CC,	%i5
	fand	%f8,	%f0,	%f18
	movrne	%i2,	%i4,	%o1
	sub	%i3,	0x1770,	%o4
	movne	%icc,	%o2,	%g6
	alignaddrl	%g5,	%g7,	%l6
	addcc	%g1,	%o7,	%l0
	ldd	[%l7 + 0x68],	%g2
	movgu	%icc,	%l3,	%g3
	fnot1	%f0,	%f18
	st	%f6,	[%l7 + 0x20]
	edge8l	%l4,	%l5,	%o6
	srax	%i7,	%i6,	%o3
	andn	%g4,	%l1,	%l2
	fmovscs	%icc,	%f5,	%f12
	fxnors	%f21,	%f24,	%f11
	movn	%xcc,	%o0,	%o5
	fzero	%f12
	srlx	%i0,	0x15,	%i5
	movne	%xcc,	%i1,	%i4
	mova	%icc,	%o1,	%i3
	subc	%i2,	%o4,	%g6
	umulcc	%o2,	%g7,	%g5
	srlx	%l6,	%o7,	%l0
	fones	%f17
	array8	%g2,	%g1,	%l3
	fpack16	%f6,	%f27
	fnor	%f30,	%f4,	%f2
	save %l4, %l5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f22,	%f16,	%i7
	fmul8x16al	%f26,	%f5,	%f24
	xnor	%o6,	%i6,	%g4
	fpsub32s	%f3,	%f13,	%f1
	movle	%xcc,	%o3,	%l1
	fmovspos	%xcc,	%f9,	%f16
	fabsd	%f30,	%f28
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	fnegs	%f10,	%f0
	sra	%o5,	%i5,	%i0
	mulscc	%i1,	0x02A6,	%o1
	array16	%i3,	%i2,	%i4
	fnegd	%f14,	%f2
	sdivx	%o4,	0x0E68,	%g6
	subccc	%o2,	0x0FAB,	%g7
	edge32ln	%g5,	%l6,	%o7
	save %l0, 0x10D9, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l3,	%g1
	popc	0x0A50,	%l5
	movg	%xcc,	%g3,	%l4
	restore %o6, %i7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i6,	0x141A,	%o3
	stw	%o0,	[%l7 + 0x60]
	stw	%l2,	[%l7 + 0x50]
	fandnot2	%f16,	%f2,	%f14
	movn	%xcc,	%l1,	%i5
	xnor	%o5,	0x0EB6,	%i1
	popc	0x0528,	%i0
	movrlz	%i3,	0x334,	%i2
	edge16	%i4,	%o4,	%o1
	stx	%o2,	[%l7 + 0x10]
	fmovdl	%xcc,	%f4,	%f21
	subc	%g6,	%g7,	%l6
	edge32n	%g5,	%o7,	%g2
	movcc	%xcc,	%l0,	%l3
	fcmpgt32	%f2,	%f0,	%g1
	fmovrsgez	%l5,	%f13,	%f28
	fnors	%f18,	%f14,	%f10
	fcmps	%fcc1,	%f2,	%f0
	fmovscc	%xcc,	%f8,	%f8
	fmovrdgez	%g3,	%f24,	%f30
	edge32n	%o6,	%i7,	%g4
	movne	%xcc,	%l4,	%i6
	movle	%xcc,	%o3,	%o0
	ldd	[%l7 + 0x20],	%f8
	save %l2, 0x0562, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o5,	%l1
	pdist	%f14,	%f18,	%f6
	movpos	%icc,	%i1,	%i3
	movneg	%icc,	%i2,	%i0
	ldsh	[%l7 + 0x48],	%i4
	movcc	%icc,	%o4,	%o1
	movvs	%xcc,	%g6,	%g7
	fpmerge	%f22,	%f13,	%f22
	st	%f23,	[%l7 + 0x54]
	ldsb	[%l7 + 0x59],	%o2
	fands	%f4,	%f30,	%f5
	smul	%l6,	%g5,	%g2
	std	%f24,	[%l7 + 0x28]
	movleu	%icc,	%o7,	%l0
	mulscc	%g1,	%l3,	%g3
	fxors	%f8,	%f31,	%f15
	movrlez	%l5,	0x2BE,	%o6
	sdiv	%g4,	0x1C6D,	%l4
	sllx	%i7,	%o3,	%i6
	movre	%o0,	0x18C,	%i5
	movvs	%icc,	%l2,	%o5
	subccc	%l1,	0x1C04,	%i3
	edge16	%i1,	%i0,	%i4
	edge8	%o4,	%o1,	%i2
	array16	%g6,	%g7,	%l6
	orncc	%g5,	0x11FC,	%o2
	ldd	[%l7 + 0x68],	%o6
	lduh	[%l7 + 0x76],	%g2
	sdiv	%g1,	0x11CC,	%l3
	lduh	[%l7 + 0x50],	%g3
	movrne	%l5,	0x21A,	%l0
	edge16	%g4,	%l4,	%i7
	mulscc	%o6,	%i6,	%o3
	udiv	%i5,	0x021F,	%o0
	array16	%l2,	%o5,	%i3
	sll	%i1,	0x04,	%i0
	fmovrse	%i4,	%f12,	%f25
	fmovsn	%xcc,	%f13,	%f12
	edge16l	%l1,	%o4,	%i2
	udivcc	%g6,	0x0863,	%o1
	edge32n	%g7,	%l6,	%g5
	addcc	%o2,	%g2,	%g1
	ldub	[%l7 + 0x38],	%o7
	fmovdn	%xcc,	%f29,	%f12
	sra	%l3,	%l5,	%g3
	fnot1s	%f8,	%f11
	ldx	[%l7 + 0x40],	%g4
	xnorcc	%l4,	0x0712,	%l0
	fnand	%f16,	%f24,	%f30
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	add	%o3,	%i5,	%o0
	movge	%icc,	%o5,	%l2
	stw	%i1,	[%l7 + 0x38]
	srlx	%i0,	%i4,	%i3
	fmovdpos	%icc,	%f16,	%f18
	movle	%icc,	%o4,	%i2
	movg	%icc,	%l1,	%o1
	movne	%icc,	%g6,	%l6
	movvc	%icc,	%g5,	%o2
	movleu	%xcc,	%g2,	%g7
	smulcc	%o7,	0x176D,	%l3
	st	%f10,	[%l7 + 0x6C]
	fone	%f8
	save %l5, 0x127D, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g4,	0x0F09,	%g1
	movn	%icc,	%l4,	%l0
	pdist	%f10,	%f4,	%f8
	orncc	%o6,	%i7,	%i6
	or	%o3,	%i5,	%o5
	fpadd16s	%f31,	%f27,	%f8
	movneg	%xcc,	%l2,	%i1
	udivx	%i0,	0x11CC,	%i4
	edge8	%i3,	%o4,	%o0
	subc	%i2,	%o1,	%l1
	fnot1s	%f16,	%f29
	fpadd16	%f16,	%f26,	%f6
	fmuld8ulx16	%f8,	%f30,	%f12
	nop
	set	0x50, %i5
	ldd	[%l7 + %i5],	%g6
	andncc	%l6,	%g5,	%o2
	lduw	[%l7 + 0x14],	%g2
	umulcc	%o7,	0x123E,	%l3
	movre	%g7,	0x003,	%g3
	addccc	%g4,	0x1D70,	%g1
	sllx	%l4,	0x17,	%l0
	fmuld8sux16	%f2,	%f10,	%f20
	fpsub16s	%f3,	%f14,	%f22
	fabss	%f30,	%f19
	movrlz	%l5,	%i7,	%o6
	fcmpgt32	%f10,	%f22,	%i6
	fandnot2	%f22,	%f2,	%f4
	fmovs	%f23,	%f21
	nop
	set	0x7E, %g4
	lduh	[%l7 + %g4],	%o3
	fcmpgt32	%f4,	%f28,	%i5
	st	%f18,	[%l7 + 0x34]
	xnorcc	%o5,	%i1,	%l2
	srlx	%i4,	%i3,	%o4
	xorcc	%i0,	%i2,	%o0
	movge	%icc,	%l1,	%o1
	addcc	%l6,	%g5,	%o2
	ldsh	[%l7 + 0x4A],	%g6
	subc	%g2,	%l3,	%o7
	fone	%f2
	umulcc	%g3,	0x0201,	%g7
	andn	%g4,	%g1,	%l4
	udiv	%l5,	0x1580,	%l0
	movvs	%xcc,	%i7,	%o6
	subc	%i6,	%i5,	%o3
	edge16n	%o5,	%i1,	%l2
	movg	%xcc,	%i3,	%o4
	sra	%i0,	0x09,	%i4
	sub	%o0,	0x0914,	%i2
	movleu	%icc,	%l1,	%l6
	ldub	[%l7 + 0x46],	%o1
	movvs	%xcc,	%g5,	%o2
	movne	%xcc,	%g2,	%l3
	movrlez	%g6,	0x251,	%o7
	fmovdl	%icc,	%f13,	%f24
	edge32	%g7,	%g3,	%g1
	mulx	%g4,	0x1767,	%l5
	edge32l	%l4,	%i7,	%l0
	andncc	%o6,	%i5,	%i6
	faligndata	%f2,	%f14,	%f8
	movvc	%xcc,	%o5,	%o3
	fpsub32	%f26,	%f8,	%f2
	edge32l	%i1,	%i3,	%l2
	subcc	%o4,	%i4,	%o0
	ld	[%l7 + 0x18],	%f1
	sethi	0x1523,	%i2
	orcc	%i0,	0x0BB7,	%l1
	popc	0x0705,	%o1
	subc	%l6,	%o2,	%g2
	orcc	%g5,	0x1B03,	%l3
	movvc	%icc,	%g6,	%o7
	sll	%g7,	0x14,	%g1
	movle	%icc,	%g4,	%l5
	fmuld8ulx16	%f8,	%f31,	%f18
	edge8l	%g3,	%i7,	%l0
	subc	%l4,	%o6,	%i6
	edge16n	%i5,	%o5,	%o3
	stx	%i1,	[%l7 + 0x50]
	fabss	%f26,	%f0
	smulcc	%l2,	0x1696,	%o4
	ldub	[%l7 + 0x71],	%i4
	movg	%icc,	%i3,	%i2
	fpadd16s	%f12,	%f19,	%f5
	alignaddr	%o0,	%l1,	%o1
	movg	%xcc,	%i0,	%o2
	save %l6, 0x1B98, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g2,	%f1,	%f15
	orncc	%g6,	%o7,	%g7
	fmovsge	%icc,	%f6,	%f18
	edge16l	%l3,	%g1,	%g4
	movrne	%g3,	0x0AB,	%i7
	edge8	%l5,	%l4,	%o6
	edge8l	%i6,	%i5,	%o5
	fmovrdgez	%l0,	%f30,	%f2
	mova	%icc,	%o3,	%i1
	movrne	%o4,	0x3A8,	%i4
	udiv	%i3,	0x0644,	%i2
	movrlez	%l2,	0x008,	%l1
	movcs	%icc,	%o0,	%o1
	movre	%o2,	%l6,	%i0
	srlx	%g2,	0x03,	%g6
	ldd	[%l7 + 0x20],	%f26
	movvc	%xcc,	%g5,	%o7
	umulcc	%g7,	%g1,	%g4
	fnegs	%f19,	%f3
	edge8ln	%l3,	%g3,	%l5
	orcc	%l4,	%i7,	%o6
	subc	%i5,	0x0C9B,	%i6
	sra	%l0,	%o3,	%i1
	edge16l	%o5,	%o4,	%i3
	umulcc	%i4,	%l2,	%i2
	sra	%o0,	0x1B,	%l1
	andn	%o2,	0x1A85,	%l6
	fmovdgu	%icc,	%f17,	%f8
	sdivx	%i0,	0x0321,	%g2
	fmovrdlz	%g6,	%f6,	%f4
	fmul8x16au	%f9,	%f14,	%f22
	fmovrdgz	%g5,	%f6,	%f12
	mova	%icc,	%o7,	%o1
	edge32ln	%g1,	%g7,	%g4
	srlx	%l3,	0x16,	%g3
	sth	%l5,	[%l7 + 0x52]
	addc	%i7,	%l4,	%i5
	mova	%icc,	%o6,	%l0
	edge32n	%o3,	%i6,	%o5
	movrne	%i1,	%i3,	%o4
	fmovdcc	%xcc,	%f5,	%f22
	lduw	[%l7 + 0x68],	%l2
	and	%i2,	0x16DD,	%o0
	xnorcc	%l1,	%i4,	%o2
	fmovsleu	%icc,	%f14,	%f17
	smul	%i0,	%g2,	%l6
	ld	[%l7 + 0x30],	%f21
	movrlez	%g5,	%g6,	%o7
	lduh	[%l7 + 0x28],	%g1
	sllx	%g7,	%g4,	%l3
	movre	%o1,	0x308,	%g3
	smulcc	%l5,	%l4,	%i7
	save %o6, %l0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i6,	0x335,	%o3
	ldsb	[%l7 + 0x1A],	%o5
	fmovsgu	%xcc,	%f4,	%f21
	std	%f22,	[%l7 + 0x30]
	array8	%i3,	%i1,	%l2
	fxnors	%f25,	%f13,	%f31
	sth	%o4,	[%l7 + 0x30]
	fmovde	%icc,	%f15,	%f0
	array8	%i2,	%l1,	%i4
	fornot1s	%f21,	%f4,	%f15
	udivcc	%o2,	0x0509,	%o0
	movcc	%xcc,	%g2,	%l6
	movrlz	%g5,	0x2C3,	%i0
	fmovrslz	%o7,	%f17,	%f19
	alignaddr	%g6,	%g1,	%g7
	movg	%xcc,	%g4,	%l3
	movrlz	%g3,	0x3AC,	%l5
	edge16ln	%o1,	%l4,	%o6
	subcc	%i7,	%i5,	%l0
	movpos	%icc,	%i6,	%o5
	edge32n	%i3,	%i1,	%l2
	edge8	%o3,	%o4,	%l1
	udivcc	%i4,	0x067B,	%o2
	movgu	%icc,	%i2,	%g2
	fmovsvs	%icc,	%f23,	%f13
	fnot1s	%f15,	%f25
	fmovsgu	%xcc,	%f16,	%f27
	edge32	%o0,	%l6,	%i0
	movre	%o7,	0x26C,	%g5
	ldd	[%l7 + 0x30],	%g0
	umul	%g7,	%g6,	%l3
	stx	%g4,	[%l7 + 0x40]
	edge8ln	%g3,	%l5,	%l4
	subc	%o6,	0x12D4,	%o1
	movne	%icc,	%i5,	%l0
	edge16l	%i6,	%o5,	%i7
	ldx	[%l7 + 0x38],	%i3
	andcc	%l2,	%o3,	%o4
	edge8n	%l1,	%i1,	%i4
	sdivx	%i2,	0x187E,	%o2
	movpos	%icc,	%g2,	%l6
	edge8n	%o0,	%i0,	%g5
	xorcc	%o7,	0x1DB3,	%g1
	fands	%f15,	%f12,	%f4
	fmovdle	%icc,	%f20,	%f9
	fmovdleu	%icc,	%f9,	%f21
	edge32n	%g7,	%g6,	%g4
	movpos	%icc,	%g3,	%l5
	fpack16	%f30,	%f2
	udivx	%l3,	0x12F7,	%o6
	edge32	%o1,	%l4,	%l0
	ldsw	[%l7 + 0x30],	%i5
	array32	%i6,	%i7,	%o5
	or	%i3,	%l2,	%o3
	edge32	%o4,	%l1,	%i1
	restore %i2, 0x193D, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	%l6,	%g2
	movvc	%xcc,	%i0,	%g5
	movl	%xcc,	%o7,	%o0
	fmul8x16au	%f10,	%f23,	%f18
	movre	%g1,	%g6,	%g7
	movvs	%icc,	%g3,	%l5
	addc	%g4,	0x152B,	%o6
	movle	%icc,	%o1,	%l3
	fxnor	%f30,	%f6,	%f30
	movle	%icc,	%l4,	%i5
	fpack16	%f28,	%f26
	mova	%icc,	%l0,	%i7
	andncc	%o5,	%i3,	%i6
	edge32l	%l2,	%o3,	%o4
	mulx	%i1,	%i2,	%i4
	fmovdg	%xcc,	%f25,	%f29
	movleu	%xcc,	%l1,	%l6
	ld	[%l7 + 0x58],	%f29
	fmul8x16al	%f27,	%f1,	%f16
	fmovrsgez	%g2,	%f27,	%f16
	smul	%o2,	%i0,	%g5
	ld	[%l7 + 0x6C],	%f3
	ldd	[%l7 + 0x78],	%f2
	edge16l	%o0,	%g1,	%o7
	movl	%icc,	%g7,	%g6
	array16	%g3,	%g4,	%o6
	movg	%xcc,	%o1,	%l5
	movle	%xcc,	%l3,	%l4
	mova	%icc,	%i5,	%l0
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	fabsd	%f18,	%f22
	fones	%f1
	fcmpeq16	%f30,	%f8,	%l2
	fone	%f20
	fmuld8ulx16	%f2,	%f10,	%f8
	subcc	%i6,	%o3,	%i1
	fsrc2s	%f3,	%f16
	movrlz	%i2,	0x2EA,	%i4
	udiv	%o4,	0x1652,	%l6
	movge	%icc,	%g2,	%o2
	xnorcc	%i0,	0x1574,	%l1
	umulcc	%o0,	%g1,	%o7
	alignaddrl	%g7,	%g5,	%g6
	or	%g4,	0x0482,	%o6
	movvs	%xcc,	%g3,	%l5
	movrlz	%l3,	%o1,	%l4
	ldd	[%l7 + 0x68],	%f16
	ldd	[%l7 + 0x50],	%l0
	movrgz	%o5,	%i7,	%i5
	ldsb	[%l7 + 0x5C],	%l2
	edge16ln	%i6,	%o3,	%i1
	sdivcc	%i2,	0x0012,	%i4
	ldd	[%l7 + 0x58],	%o4
	subc	%i3,	0x1001,	%l6
	popc	0x0E0F,	%g2
	ldsw	[%l7 + 0x1C],	%i0
	ldd	[%l7 + 0x20],	%o2
	lduw	[%l7 + 0x14],	%o0
	fcmpeq16	%f24,	%f20,	%l1
	st	%f27,	[%l7 + 0x5C]
	move	%xcc,	%g1,	%o7
	edge32	%g5,	%g6,	%g4
	ldsw	[%l7 + 0x40],	%g7
	fmovrsne	%o6,	%f19,	%f6
	fabss	%f0,	%f7
	smul	%l5,	0x0178,	%l3
	fone	%f0
	addccc	%o1,	0x000F,	%g3
	edge16l	%l0,	%o5,	%i7
	fabss	%f19,	%f7
	alignaddrl	%l4,	%i5,	%i6
	fmovrslez	%o3,	%f18,	%f2
	st	%f28,	[%l7 + 0x78]
	movleu	%xcc,	%i1,	%l2
	xorcc	%i4,	%i2,	%i3
	udivx	%o4,	0x01DB,	%g2
	udiv	%l6,	0x11ED,	%o2
	fxnors	%f27,	%f27,	%f22
	fmovde	%icc,	%f31,	%f0
	fmovrdgz	%o0,	%f0,	%f4
	movl	%icc,	%i0,	%g1
	addcc	%l1,	%o7,	%g5
	popc	%g4,	%g7
	orn	%g6,	0x1DE9,	%o6
	edge32	%l3,	%l5,	%g3
	fmovrdlz	%o1,	%f2,	%f6
	fmovrdgz	%l0,	%f28,	%f26
	popc	%i7,	%o5
	sub	%l4,	0x1FA4,	%i6
	subcc	%o3,	0x14EA,	%i1
	edge16l	%i5,	%l2,	%i4
	sub	%i3,	%i2,	%g2
	lduw	[%l7 + 0x44],	%o4
	array32	%o2,	%o0,	%l6
	sra	%g1,	0x02,	%i0
	movrgz	%o7,	0x0C4,	%l1
	edge32l	%g4,	%g5,	%g6
	ldsw	[%l7 + 0x3C],	%o6
	sll	%l3,	0x06,	%l5
	ldsh	[%l7 + 0x28],	%g3
	xor	%g7,	0x062B,	%l0
	subccc	%o1,	0x05CB,	%i7
	movg	%xcc,	%l4,	%i6
	ldd	[%l7 + 0x18],	%o2
	alignaddr	%i1,	%i5,	%l2
	movvs	%icc,	%i4,	%i3
	fmovscc	%xcc,	%f9,	%f27
	sdiv	%i2,	0x0A0D,	%o5
	alignaddrl	%g2,	%o4,	%o2
	std	%f6,	[%l7 + 0x20]
	movneg	%icc,	%l6,	%g1
	andn	%o0,	%o7,	%i0
	movge	%xcc,	%l1,	%g4
	movcc	%xcc,	%g6,	%g5
	ldx	[%l7 + 0x08],	%l3
	popc	0x0461,	%l5
	movgu	%xcc,	%o6,	%g7
	sethi	0x1874,	%l0
	edge32	%o1,	%g3,	%l4
	sdiv	%i6,	0x04C7,	%i7
	fcmpeq32	%f14,	%f6,	%i1
	orn	%i5,	0x1645,	%l2
	edge16l	%i4,	%o3,	%i3
	fmovsn	%xcc,	%f12,	%f24
	addc	%o5,	%i2,	%g2
	ldsh	[%l7 + 0x44],	%o4
	fcmpeq32	%f16,	%f18,	%l6
	sdivcc	%g1,	0x1D39,	%o2
	xnor	%o7,	%o0,	%i0
	movvc	%xcc,	%l1,	%g4
	movrgz	%g5,	0x0F1,	%g6
	movleu	%icc,	%l5,	%l3
	fone	%f14
	umulcc	%o6,	%g7,	%l0
	lduh	[%l7 + 0x3E],	%o1
	ldd	[%l7 + 0x18],	%l4
	array16	%i6,	%i7,	%i1
	stw	%i5,	[%l7 + 0x68]
	srax	%l2,	%g3,	%o3
	fxor	%f12,	%f16,	%f16
	movcs	%icc,	%i3,	%o5
	movle	%xcc,	%i4,	%g2
	stb	%o4,	[%l7 + 0x73]
	umul	%l6,	0x19EE,	%i2
	orcc	%o2,	%g1,	%o7
	edge16	%o0,	%l1,	%g4
	addccc	%i0,	%g5,	%l5
	movvc	%icc,	%l3,	%g6
	sll	%g7,	%o6,	%o1
	fcmpd	%fcc3,	%f24,	%f8
	sll	%l4,	%i6,	%l0
	alignaddrl	%i1,	%i5,	%l2
	edge16ln	%g3,	%o3,	%i3
	movrlz	%o5,	%i7,	%g2
	std	%f26,	[%l7 + 0x20]
	edge8ln	%i4,	%l6,	%o4
	ldsh	[%l7 + 0x46],	%o2
	sth	%g1,	[%l7 + 0x4C]
	movvc	%xcc,	%o7,	%o0
	fcmpes	%fcc1,	%f21,	%f17
	bshuffle	%f18,	%f26,	%f14
	edge8ln	%i2,	%g4,	%l1
	array8	%i0,	%l5,	%g5
	sub	%l3,	0x1F6C,	%g7
	movl	%xcc,	%o6,	%o1
	ldd	[%l7 + 0x28],	%g6
	sethi	0x045C,	%i6
	addccc	%l0,	0x1A10,	%l4
	st	%f3,	[%l7 + 0x78]
	orn	%i1,	0x0B20,	%i5
	ldub	[%l7 + 0x51],	%g3
	move	%xcc,	%l2,	%o3
	xnor	%i3,	0x0729,	%i7
	xnorcc	%o5,	0x0F5F,	%i4
	subccc	%l6,	%g2,	%o2
	st	%f31,	[%l7 + 0x24]
	xnor	%g1,	0x07F0,	%o4
	xnor	%o7,	0x11D9,	%o0
	movcc	%xcc,	%i2,	%g4
	movrne	%i0,	%l5,	%l1
	movrgz	%l3,	%g7,	%o6
	subccc	%o1,	%g5,	%g6
	stb	%i6,	[%l7 + 0x7E]
	sub	%l0,	0x1021,	%i1
	edge8	%i5,	%g3,	%l2
	movrlez	%l4,	%i3,	%o3
	edge16	%i7,	%o5,	%i4
	udivcc	%g2,	0x0396,	%o2
	edge32l	%g1,	%o4,	%o7
	movrne	%o0,	0x3E3,	%l6
	ldsh	[%l7 + 0x0E],	%g4
	udivcc	%i0,	0x1BC0,	%l5
	fmovdgu	%icc,	%f16,	%f8
	or	%l1,	%i2,	%g7
	movrne	%o6,	%l3,	%g5
	siam	0x3
	sir	0x0D55
	andncc	%g6,	%o1,	%i6
	smulcc	%l0,	%i1,	%i5
	sdivx	%g3,	0x097F,	%l2
	lduh	[%l7 + 0x4A],	%l4
	movrlez	%i3,	0x38E,	%i7
	fnot2	%f20,	%f28
	andn	%o5,	%i4,	%g2
	stb	%o2,	[%l7 + 0x13]
	fmovdge	%icc,	%f18,	%f21
	umul	%o3,	%g1,	%o4
	movvs	%icc,	%o7,	%o0
	fmovdge	%icc,	%f1,	%f1
	fandnot1s	%f8,	%f11,	%f28
	ld	[%l7 + 0x48],	%f5
	udivcc	%l6,	0x1CEF,	%i0
	orcc	%l5,	0x0CF6,	%g4
	movrgz	%i2,	0x195,	%l1
	fmovdge	%xcc,	%f16,	%f17
	andcc	%g7,	%o6,	%l3
	or	%g6,	%g5,	%i6
	srax	%o1,	%i1,	%i5
	edge8n	%l0,	%l2,	%g3
	fnands	%f30,	%f13,	%f25
	popc	0x1DEB,	%i3
	fpsub32	%f6,	%f14,	%f28
	lduw	[%l7 + 0x14],	%i7
	fcmps	%fcc1,	%f26,	%f29
	udiv	%o5,	0x0AFA,	%l4
	subc	%g2,	0x10FB,	%o2
	umul	%o3,	0x1689,	%i4
	orn	%g1,	%o4,	%o0
	ldub	[%l7 + 0x09],	%o7
	edge32l	%i0,	%l6,	%l5
	fmovrsne	%i2,	%f13,	%f26
	fpackfix	%f4,	%f22
	add	%g4,	0x113E,	%l1
	udiv	%o6,	0x195A,	%g7
	alignaddr	%l3,	%g5,	%i6
	alignaddrl	%o1,	%g6,	%i1
	fmovs	%f30,	%f25
	edge8	%l0,	%l2,	%i5
	fxor	%f12,	%f4,	%f20
	fmovdn	%icc,	%f30,	%f14
	fmovrsgez	%g3,	%f2,	%f26
	subc	%i3,	0x14ED,	%i7
	fxnor	%f0,	%f30,	%f20
	ldsh	[%l7 + 0x1C],	%l4
	sll	%g2,	%o2,	%o3
	fmovdneg	%icc,	%f23,	%f0
	fcmpes	%fcc1,	%f9,	%f6
	srax	%o5,	0x00,	%i4
	mulscc	%g1,	%o0,	%o4
	movpos	%icc,	%i0,	%l6
	ldsw	[%l7 + 0x24],	%o7
	nop
	set	0x50, %o1
	ldd	[%l7 + %o1],	%i2
	lduh	[%l7 + 0x1C],	%g4
	move	%xcc,	%l1,	%o6
	udivx	%l5,	0x0E10,	%l3
	add	%g5,	%g7,	%o1
	ldd	[%l7 + 0x58],	%i6
	udivx	%i1,	0x1C42,	%l0
	nop
	set	0x58, %l0
	std	%f6,	[%l7 + %l0]
	xnorcc	%l2,	0x1265,	%g6
	nop
	set	0x28, %l5
	stx	%g3,	[%l7 + %l5]
	edge32	%i3,	%i5,	%i7
	orn	%l4,	0x1EAE,	%o2
	st	%f31,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x2E],	%g2
	andcc	%o3,	0x0896,	%i4
	movne	%xcc,	%g1,	%o0
	alignaddrl	%o5,	%i0,	%l6
	edge32l	%o7,	%o4,	%g4
	edge32l	%i2,	%l1,	%l5
	and	%o6,	0x0600,	%g5
	faligndata	%f8,	%f2,	%f30
	fnors	%f11,	%f2,	%f26
	orncc	%l3,	%o1,	%g7
	movleu	%icc,	%i1,	%i6
	stx	%l0,	[%l7 + 0x68]
	edge32l	%l2,	%g6,	%i3
	sdiv	%g3,	0x1312,	%i5
	lduw	[%l7 + 0x2C],	%l4
	sdivcc	%o2,	0x1D02,	%i7
	movcs	%icc,	%o3,	%g2
	subc	%i4,	%o0,	%o5
	and	%i0,	0x1B6D,	%l6
	ldsb	[%l7 + 0x2C],	%g1
	mulscc	%o7,	0x0CD9,	%g4
	sdiv	%o4,	0x01B5,	%i2
	movge	%xcc,	%l1,	%o6
	sir	0x02DA
	orn	%g5,	%l3,	%l5
	udivcc	%o1,	0x1CC0,	%g7
	movre	%i6,	0x017,	%i1
	subccc	%l2,	0x057F,	%g6
	smulcc	%l0,	%g3,	%i5
	movle	%icc,	%i3,	%o2
	movn	%xcc,	%i7,	%l4
	movneg	%xcc,	%g2,	%o3
	sdiv	%i4,	0x0664,	%o5
	ldsw	[%l7 + 0x20],	%o0
	andcc	%i0,	%l6,	%g1
	ldd	[%l7 + 0x48],	%f18
	sdivcc	%o7,	0x14A6,	%g4
	sllx	%o4,	0x08,	%i2
	edge16n	%o6,	%l1,	%g5
	ldsw	[%l7 + 0x5C],	%l3
	subc	%o1,	0x0081,	%g7
	subc	%l5,	0x050F,	%i6
	udiv	%l2,	0x1769,	%i1
	smul	%l0,	0x1C49,	%g6
	fpmerge	%f19,	%f16,	%f20
	xorcc	%g3,	0x13E5,	%i3
	xnorcc	%o2,	%i5,	%i7
	fmovsgu	%icc,	%f31,	%f15
	fcmpes	%fcc3,	%f9,	%f10
	orn	%g2,	%o3,	%i4
	sdivx	%l4,	0x0DEF,	%o5
	ldx	[%l7 + 0x38],	%o0
	fnot1	%f24,	%f16
	lduh	[%l7 + 0x3E],	%i0
	or	%l6,	0x075E,	%o7
	movcc	%icc,	%g1,	%g4
	fnot2s	%f14,	%f18
	sth	%o4,	[%l7 + 0x40]
	subcc	%o6,	0x065A,	%l1
	alignaddrl	%i2,	%l3,	%o1
	stb	%g7,	[%l7 + 0x77]
	fmovs	%f2,	%f0
	stw	%g5,	[%l7 + 0x64]
	andcc	%l5,	0x1ADF,	%i6
	edge8n	%i1,	%l0,	%g6
	stw	%g3,	[%l7 + 0x74]
	udivx	%i3,	0x1C0C,	%o2
	srax	%i5,	0x14,	%l2
	edge16n	%g2,	%i7,	%o3
	orncc	%l4,	%o5,	%i4
	sethi	0x1C0C,	%i0
	subcc	%o0,	%o7,	%g1
	move	%icc,	%l6,	%o4
	mova	%icc,	%g4,	%l1
	siam	0x0
	subcc	%i2,	%l3,	%o6
	fmovspos	%xcc,	%f12,	%f11
	stx	%o1,	[%l7 + 0x38]
	ldsw	[%l7 + 0x20],	%g5
	fmovrdlz	%g7,	%f20,	%f26
	fmovrslz	%i6,	%f2,	%f21
	movge	%xcc,	%l5,	%i1
	fpadd32	%f12,	%f6,	%f22
	subc	%l0,	%g3,	%g6
	fmovsvc	%xcc,	%f19,	%f27
	edge32n	%i3,	%o2,	%l2
	sdiv	%i5,	0x060E,	%g2
	movcc	%xcc,	%i7,	%l4
	and	%o5,	%i4,	%i0
	save %o0, 0x1FA9, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f20,	%f0
	andn	%g1,	%o3,	%l6
	stx	%o4,	[%l7 + 0x10]
	movgu	%icc,	%g4,	%i2
	fmovdle	%xcc,	%f9,	%f24
	fmovdl	%xcc,	%f31,	%f1
	sdivcc	%l3,	0x0358,	%o6
	fmovse	%icc,	%f2,	%f9
	edge16n	%o1,	%l1,	%g7
	fmovrslez	%i6,	%f21,	%f5
	addc	%g5,	0x1552,	%i1
	save %l0, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i3,	0x15FE,	%o2
	sir	0x1625
	fornot1s	%f26,	%f30,	%f13
	ldub	[%l7 + 0x59],	%l2
	movne	%xcc,	%i5,	%g2
	subccc	%i7,	%l4,	%g3
	fornot2s	%f9,	%f23,	%f7
	ldsw	[%l7 + 0x08],	%i4
	mulscc	%i0,	%o0,	%o7
	sub	%g1,	%o3,	%l6
	movl	%icc,	%o5,	%o4
	addccc	%i2,	%l3,	%g4
	movrgz	%o6,	%o1,	%l1
	fcmple32	%f12,	%f12,	%i6
	fornot1s	%f5,	%f27,	%f13
	and	%g7,	0x1F8B,	%i1
	subcc	%g5,	0x1858,	%l5
	xor	%g6,	%l0,	%i3
	sdiv	%o2,	0x0A82,	%l2
	fmovsa	%icc,	%f15,	%f26
	xorcc	%g2,	0x142E,	%i7
	edge8n	%i5,	%g3,	%l4
	subcc	%i0,	0x182E,	%o0
	srlx	%i4,	0x05,	%o7
	edge32	%g1,	%l6,	%o3
	smul	%o5,	0x1305,	%o4
	fnot2s	%f13,	%f22
	edge8ln	%i2,	%l3,	%o6
	fabsd	%f4,	%f8
	fpsub32s	%f23,	%f16,	%f12
	fcmps	%fcc3,	%f29,	%f28
	addc	%o1,	%g4,	%i6
	orcc	%g7,	%i1,	%g5
	addc	%l1,	%l5,	%l0
	fpsub32s	%f22,	%f25,	%f26
	andn	%g6,	%i3,	%o2
	ldsw	[%l7 + 0x3C],	%g2
	fmovdneg	%xcc,	%f3,	%f8
	movgu	%xcc,	%i7,	%l2
	orn	%i5,	0x01CF,	%g3
	fmovsne	%icc,	%f26,	%f18
	andcc	%i0,	0x1E80,	%l4
	fmovrsgz	%o0,	%f25,	%f24
	udiv	%i4,	0x0B98,	%g1
	movg	%xcc,	%o7,	%o3
	edge32	%o5,	%l6,	%o4
	movne	%xcc,	%l3,	%i2
	alignaddrl	%o1,	%g4,	%i6
	mulx	%o6,	%g7,	%i1
	ldub	[%l7 + 0x17],	%g5
	fnand	%f10,	%f14,	%f4
	sub	%l5,	%l0,	%l1
	lduh	[%l7 + 0x16],	%i3
	sub	%g6,	%g2,	%i7
	array32	%o2,	%l2,	%g3
	fmul8x16al	%f11,	%f16,	%f6
	fmovscc	%icc,	%f22,	%f8
	sdivcc	%i5,	0x0EEF,	%i0
	udiv	%o0,	0x0FB6,	%i4
	movrgz	%g1,	%l4,	%o3
	movge	%icc,	%o5,	%l6
	fabss	%f16,	%f6
	fmovsge	%xcc,	%f31,	%f22
	movrgz	%o7,	0x07C,	%o4
	lduh	[%l7 + 0x76],	%l3
	edge8n	%o1,	%g4,	%i6
	sdivx	%o6,	0x079C,	%g7
	edge32l	%i2,	%g5,	%i1
	ldsw	[%l7 + 0x4C],	%l0
	ldsw	[%l7 + 0x5C],	%l1
	orn	%i3,	%l5,	%g6
	edge16l	%g2,	%o2,	%l2
	fmovsn	%icc,	%f3,	%f20
	fmovdgu	%icc,	%f4,	%f12
	stb	%i7,	[%l7 + 0x13]
	movcs	%xcc,	%i5,	%g3
	edge32l	%i0,	%o0,	%g1
	fmovrsgz	%i4,	%f6,	%f5
	sethi	0x1426,	%l4
	add	%o5,	%o3,	%o7
	udivx	%l6,	0x1B13,	%l3
	or	%o4,	%o1,	%i6
	fcmple32	%f8,	%f12,	%o6
	addccc	%g4,	%g7,	%i2
	movpos	%xcc,	%i1,	%g5
	fmovs	%f20,	%f26
	fcmpgt32	%f22,	%f10,	%l1
	movl	%icc,	%i3,	%l5
	edge16n	%g6,	%g2,	%l0
	udivcc	%l2,	0x1CED,	%i7
	srax	%o2,	0x1D,	%g3
	edge8l	%i5,	%o0,	%i0
	fmovsne	%icc,	%f27,	%f26
	sir	0x123B
	alignaddr	%i4,	%l4,	%g1
	fmovrdlz	%o3,	%f20,	%f14
	sub	%o5,	0x0899,	%o7
	edge16l	%l6,	%o4,	%l3
	fmovspos	%icc,	%f30,	%f16
	subccc	%i6,	%o6,	%g4
	movrgez	%o1,	%g7,	%i2
	and	%g5,	%i1,	%i3
	fmovscc	%xcc,	%f12,	%f31
	ldx	[%l7 + 0x70],	%l1
	fmovrdne	%l5,	%f22,	%f30
	fpsub16	%f18,	%f8,	%f20
	subccc	%g6,	0x12D3,	%l0
	st	%f29,	[%l7 + 0x34]
	sth	%g2,	[%l7 + 0x5E]
	xnor	%l2,	%i7,	%g3
	movge	%xcc,	%o2,	%i5
	edge16ln	%o0,	%i0,	%i4
	addcc	%g1,	0x08C9,	%l4
	srl	%o5,	0x06,	%o7
	srl	%l6,	%o3,	%l3
	fmovdcc	%xcc,	%f13,	%f22
	umul	%i6,	%o4,	%o6
	fcmpeq32	%f6,	%f14,	%o1
	fmovsg	%xcc,	%f21,	%f30
	fmovscs	%xcc,	%f24,	%f12
	sdiv	%g4,	0x06D8,	%g7
	ldd	[%l7 + 0x48],	%f14
	movpos	%icc,	%g5,	%i1
	ldsh	[%l7 + 0x24],	%i2
	fmovrdne	%i3,	%f12,	%f4
	restore %l5, %g6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f6,	[%l7 + 0x58]
	fandnot2	%f20,	%f24,	%f16
	addccc	%g2,	0x1F1C,	%l2
	umul	%l1,	%g3,	%i7
	udiv	%o2,	0x0CAB,	%i5
	movl	%xcc,	%i0,	%o0
	movrne	%i4,	0x290,	%l4
	nop
	set	0x1C, %i3
	lduw	[%l7 + %i3],	%g1
	movgu	%icc,	%o5,	%o7
	stx	%o3,	[%l7 + 0x08]
	or	%l6,	%i6,	%o4
	sdivcc	%o6,	0x0A0A,	%o1
	or	%g4,	0x09F2,	%l3
	addc	%g5,	0x0D50,	%g7
	sub	%i1,	0x13E8,	%i2
	fmovsn	%icc,	%f7,	%f24
	fmovsle	%xcc,	%f31,	%f6
	movle	%xcc,	%i3,	%g6
	movle	%xcc,	%l5,	%l0
	srax	%g2,	0x14,	%l1
	movleu	%icc,	%g3,	%i7
	sdivcc	%o2,	0x03EE,	%i5
	srl	%i0,	0x03,	%l2
	movneg	%xcc,	%i4,	%o0
	andcc	%l4,	0x1071,	%g1
	array16	%o5,	%o7,	%l6
	udivx	%o3,	0x101B,	%o4
	array32	%o6,	%i6,	%o1
	sdiv	%g4,	0x0DFC,	%l3
	array8	%g7,	%g5,	%i2
	add	%i1,	%i3,	%l5
	edge16ln	%l0,	%g2,	%g6
	fmovdpos	%icc,	%f7,	%f20
	fpackfix	%f18,	%f13
	sra	%g3,	%l1,	%o2
	ldd	[%l7 + 0x78],	%i6
	sdivx	%i5,	0x1EE8,	%i0
	movvs	%icc,	%l2,	%o0
	stx	%i4,	[%l7 + 0x60]
	mulx	%g1,	%o5,	%o7
	ldsw	[%l7 + 0x60],	%l4
	sra	%o3,	0x01,	%o4
	sdivcc	%o6,	0x1354,	%l6
	fmovse	%icc,	%f11,	%f14
	mova	%icc,	%i6,	%o1
	ld	[%l7 + 0x2C],	%f30
	fpadd16	%f8,	%f14,	%f16
	udiv	%l3,	0x0A45,	%g4
	movg	%xcc,	%g5,	%g7
	or	%i1,	0x0CDF,	%i3
	fmovrdgez	%l5,	%f26,	%f24
	save %i2, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g3,	0x0E9F,	%l1
	movrne	%o2,	0x098,	%i7
	movrlz	%i5,	0x2EA,	%g2
	orcc	%i0,	0x0214,	%o0
	movleu	%icc,	%l2,	%g1
	alignaddr	%i4,	%o7,	%o5
	edge32l	%l4,	%o3,	%o4
	sllx	%l6,	0x16,	%i6
	movre	%o6,	%l3,	%o1
	or	%g5,	0x1D9A,	%g7
	ldsb	[%l7 + 0x22],	%g4
	xnor	%i3,	%l5,	%i2
	ldsw	[%l7 + 0x5C],	%l0
	xnor	%i1,	%g6,	%l1
	mova	%xcc,	%g3,	%o2
	fandnot1s	%f20,	%f12,	%f22
	srl	%i7,	%i5,	%g2
	umulcc	%i0,	0x1C99,	%l2
	fandnot2	%f26,	%f24,	%f6
	edge16n	%g1,	%o0,	%i4
	movcc	%xcc,	%o7,	%o5
	subccc	%l4,	%o4,	%l6
	stw	%o3,	[%l7 + 0x18]
	st	%f9,	[%l7 + 0x44]
	fsrc1	%f16,	%f26
	fmovrdne	%i6,	%f8,	%f0
	movrlz	%o6,	0x2F9,	%o1
	sethi	0x131A,	%l3
	subc	%g7,	%g5,	%g4
	addc	%l5,	%i2,	%i3
	movle	%icc,	%i1,	%l0
	fmovscc	%xcc,	%f16,	%f31
	fmovdgu	%icc,	%f11,	%f23
	fmovdpos	%icc,	%f29,	%f5
	edge16n	%g6,	%g3,	%l1
	movre	%o2,	0x101,	%i5
	ld	[%l7 + 0x40],	%f1
	sdivcc	%i7,	0x1E07,	%i0
	st	%f0,	[%l7 + 0x28]
	fmovdvs	%xcc,	%f29,	%f8
	save %l2, %g2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x4A],	%o0
	lduw	[%l7 + 0x20],	%i4
	sllx	%o5,	0x1B,	%o7
	faligndata	%f24,	%f22,	%f8
	edge16n	%o4,	%l6,	%l4
	ld	[%l7 + 0x50],	%f25
	movcs	%icc,	%i6,	%o6
	fmul8ulx16	%f14,	%f26,	%f2
	sll	%o3,	0x1D,	%o1
	movvc	%icc,	%g7,	%g5
	umul	%g4,	%l3,	%i2
	xnor	%l5,	%i1,	%l0
	edge8ln	%g6,	%g3,	%l1
	lduw	[%l7 + 0x74],	%o2
	nop
	set	0x15, %g1
	stb	%i3,	[%l7 + %g1]
	sdivx	%i5,	0x0085,	%i0
	movne	%xcc,	%l2,	%g2
	edge16l	%i7,	%g1,	%i4
	udivcc	%o5,	0x0207,	%o0
	array8	%o4,	%l6,	%l4
	stb	%o7,	[%l7 + 0x40]
	array32	%o6,	%o3,	%o1
	sir	0x14D5
	andncc	%i6,	%g5,	%g4
	fmovrslez	%l3,	%f5,	%f22
	ldsw	[%l7 + 0x20],	%i2
	fpmerge	%f30,	%f18,	%f22
	xor	%g7,	0x0173,	%i1
	or	%l0,	%l5,	%g6
	subccc	%g3,	0x190D,	%l1
	movneg	%icc,	%o2,	%i5
	stw	%i3,	[%l7 + 0x78]
	mulx	%l2,	0x13B9,	%i0
	umulcc	%i7,	0x0E9F,	%g2
	sir	0x0899
	lduh	[%l7 + 0x0E],	%g1
	movgu	%xcc,	%i4,	%o5
	sethi	0x0307,	%o0
	fpsub32s	%f5,	%f21,	%f7
	array16	%o4,	%l6,	%l4
	sir	0x096E
	sdivcc	%o6,	0x0875,	%o3
	movg	%icc,	%o1,	%i6
	movpos	%xcc,	%g5,	%o7
	movvs	%icc,	%l3,	%g4
	umul	%g7,	0x0E77,	%i1
	sdivx	%i2,	0x10ED,	%l0
	fxnor	%f10,	%f2,	%f2
	st	%f10,	[%l7 + 0x08]
	edge32n	%l5,	%g3,	%l1
	fcmps	%fcc2,	%f18,	%f21
	fmovsge	%icc,	%f16,	%f8
	subc	%o2,	0x0CDE,	%g6
	udivcc	%i5,	0x1947,	%l2
	fxors	%f2,	%f28,	%f30
	fmovd	%f20,	%f30
	edge32n	%i0,	%i3,	%i7
	sdivcc	%g2,	0x0D64,	%g1
	fmuld8ulx16	%f11,	%f4,	%f26
	xorcc	%i4,	%o0,	%o4
	fmovrdgz	%l6,	%f18,	%f22
	array8	%o5,	%o6,	%l4
	movrlz	%o1,	0x329,	%i6
	andcc	%g5,	0x06AA,	%o7
	umul	%l3,	%o3,	%g4
	movn	%xcc,	%i1,	%i2
	edge32l	%g7,	%l5,	%l0
	movre	%g3,	%o2,	%l1
	sth	%g6,	[%l7 + 0x58]
	ldsb	[%l7 + 0x47],	%i5
	orcc	%l2,	0x1548,	%i0
	edge8ln	%i7,	%i3,	%g2
	fcmple32	%f8,	%f4,	%i4
	fxors	%f17,	%f21,	%f20
	orncc	%g1,	%o4,	%l6
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	mova	%xcc,	%l4,	%o1
	xor	%g5,	%i6,	%o7
	udivx	%o3,	0x05C3,	%l3
	fandnot2	%f8,	%f0,	%f28
	xor	%i1,	0x0F77,	%i2
	udivcc	%g4,	0x0DB3,	%g7
	fmovrdgez	%l5,	%f0,	%f0
	fmovdne	%icc,	%f7,	%f7
	fmul8x16al	%f27,	%f26,	%f12
	movge	%icc,	%g3,	%l0
	mulscc	%o2,	%g6,	%i5
	edge32l	%l2,	%l1,	%i0
	fmovsn	%xcc,	%f19,	%f18
	udivx	%i3,	0x0CA9,	%i7
	movgu	%icc,	%g2,	%i4
	ldsh	[%l7 + 0x36],	%o4
	addcc	%l6,	%g1,	%o0
	faligndata	%f2,	%f22,	%f2
	edge8n	%o6,	%o5,	%l4
	movpos	%xcc,	%g5,	%o1
	st	%f12,	[%l7 + 0x34]
	movvs	%xcc,	%o7,	%o3
	xor	%l3,	0x05EE,	%i6
	fmovsg	%xcc,	%f7,	%f4
	lduh	[%l7 + 0x7A],	%i1
	movl	%icc,	%i2,	%g7
	mulx	%g4,	%g3,	%l0
	ldsw	[%l7 + 0x60],	%l5
	sth	%g6,	[%l7 + 0x56]
	movvc	%icc,	%i5,	%o2
	fcmpne16	%f4,	%f0,	%l2
	movvc	%icc,	%i0,	%i3
	pdist	%f12,	%f22,	%f10
	edge32	%l1,	%g2,	%i4
	movcs	%icc,	%o4,	%l6
	addc	%i7,	%o0,	%g1
	move	%icc,	%o6,	%o5
	edge32l	%g5,	%o1,	%o7
	sra	%o3,	0x1E,	%l4
	sethi	0x0811,	%i6
	edge32ln	%l3,	%i1,	%i2
	edge32	%g4,	%g3,	%l0
	popc	0x0E92,	%g7
	orncc	%g6,	0x0687,	%l5
	udivcc	%i5,	0x0F20,	%l2
	movcc	%icc,	%i0,	%i3
	subcc	%l1,	0x1FD3,	%o2
	subcc	%g2,	0x04FB,	%o4
	udiv	%i4,	0x0A49,	%l6
	sdivcc	%i7,	0x08E1,	%o0
	fmovscc	%xcc,	%f12,	%f0
	umul	%o6,	%o5,	%g5
	smulcc	%g1,	0x1611,	%o7
	xor	%o3,	0x1802,	%o1
	fcmpgt32	%f8,	%f28,	%i6
	movrlz	%l3,	0x1AB,	%i1
	fsrc1	%f6,	%f4
	array16	%l4,	%i2,	%g3
	alignaddrl	%l0,	%g7,	%g4
	sdiv	%l5,	0x1785,	%i5
	fnot2s	%f21,	%f10
	edge8ln	%g6,	%i0,	%i3
	umulcc	%l1,	%l2,	%o2
	fxnors	%f14,	%f25,	%f27
	ldsh	[%l7 + 0x0A],	%o4
	fnot2	%f2,	%f24
	orncc	%i4,	%g2,	%l6
	restore %o0, 0x18C7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o6,	[%l7 + 0x6D]
	movl	%icc,	%o5,	%g5
	movrlez	%o7,	%g1,	%o1
	fnot1	%f12,	%f6
	add	%o3,	0x0686,	%l3
	fmul8x16au	%f23,	%f4,	%f2
	fmovd	%f24,	%f22
	andn	%i1,	0x0784,	%i6
	edge32ln	%i2,	%l4,	%g3
	umul	%g7,	0x112D,	%g4
	st	%f29,	[%l7 + 0x2C]
	fcmpgt32	%f12,	%f16,	%l0
	andncc	%l5,	%i5,	%i0
	sdiv	%g6,	0x096B,	%i3
	movneg	%icc,	%l2,	%l1
	fpsub16	%f0,	%f16,	%f0
	fmovrdgz	%o4,	%f24,	%f4
	edge8n	%i4,	%o2,	%l6
	lduw	[%l7 + 0x64],	%g2
	fmovsgu	%xcc,	%f16,	%f24
	smul	%o0,	%o6,	%o5
	sdiv	%g5,	0x14CA,	%i7
	udivx	%g1,	0x16B1,	%o1
	edge16	%o3,	%o7,	%l3
	movn	%icc,	%i1,	%i6
	edge32l	%l4,	%i2,	%g7
	edge16ln	%g4,	%l0,	%g3
	umul	%l5,	%i0,	%i5
	std	%f24,	[%l7 + 0x68]
	nop
	set	0x2C, %l3
	stw	%g6,	[%l7 + %l3]
	movre	%i3,	%l2,	%l1
	stx	%o4,	[%l7 + 0x48]
	edge16n	%o2,	%l6,	%g2
	lduh	[%l7 + 0x36],	%i4
	movrne	%o0,	0x166,	%o6
	movne	%icc,	%o5,	%i7
	movgu	%xcc,	%g5,	%o1
	ldsb	[%l7 + 0x69],	%o3
	ld	[%l7 + 0x6C],	%f28
	fands	%f13,	%f30,	%f18
	addcc	%o7,	0x0841,	%g1
	movcs	%icc,	%i1,	%l3
	ldd	[%l7 + 0x18],	%i6
	edge8ln	%l4,	%g7,	%g4
	ldsh	[%l7 + 0x78],	%l0
	sll	%g3,	0x19,	%i2
	edge8ln	%i0,	%l5,	%g6
	siam	0x1
	ldsb	[%l7 + 0x4E],	%i5
	srl	%i3,	0x0A,	%l1
	movvs	%xcc,	%l2,	%o4
	andcc	%o2,	%l6,	%i4
	edge16ln	%g2,	%o0,	%o6
	edge16	%o5,	%g5,	%o1
	ldd	[%l7 + 0x58],	%o2
	movrlz	%o7,	0x260,	%i7
	edge8	%g1,	%i1,	%i6
	fcmpd	%fcc3,	%f24,	%f4
	movre	%l3,	0x0F0,	%l4
	mulscc	%g7,	%g4,	%g3
	addcc	%l0,	%i2,	%l5
	mulx	%g6,	%i5,	%i3
	fpsub16s	%f12,	%f3,	%f11
	fpadd32	%f10,	%f10,	%f0
	edge32	%l1,	%l2,	%i0
	fpsub32	%f30,	%f8,	%f16
	array16	%o2,	%l6,	%i4
	edge16l	%o4,	%o0,	%o6
	movrgz	%g2,	%g5,	%o1
	orcc	%o3,	%o7,	%o5
	edge32	%g1,	%i7,	%i1
	movn	%xcc,	%l3,	%l4
	fands	%f28,	%f10,	%f13
	fmovsa	%icc,	%f4,	%f8
	ldsw	[%l7 + 0x68],	%g7
	nop
	set	0x70, %l6
	lduw	[%l7 + %l6],	%g4
	sdiv	%i6,	0x0EAA,	%g3
	srl	%i2,	%l0,	%g6
	and	%l5,	0x0C7E,	%i3
	fmovsn	%xcc,	%f1,	%f17
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	movgu	%xcc,	%o2,	%l6
	save %l2, %i4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o0,	0x1B09,	%g2
	alignaddrl	%g5,	%o6,	%o1
	edge16	%o3,	%o5,	%g1
	edge8	%i7,	%i1,	%l3
	fmovrsne	%o7,	%f10,	%f16
	sdivx	%l4,	0x17A2,	%g4
	edge8	%g7,	%i6,	%g3
	movrlez	%i2,	0x294,	%g6
	fone	%f6
	fmovdgu	%icc,	%f25,	%f10
	sdiv	%l0,	0x124E,	%i3
	fnand	%f26,	%f24,	%f8
	edge8l	%i5,	%l5,	%i0
	xnorcc	%o2,	0x190D,	%l6
	ldd	[%l7 + 0x70],	%f0
	ldd	[%l7 + 0x58],	%f0
	stx	%l1,	[%l7 + 0x20]
	movrne	%l2,	0x00D,	%i4
	movl	%xcc,	%o4,	%o0
	fabsd	%f18,	%f8
	orcc	%g5,	%g2,	%o6
	movcs	%xcc,	%o1,	%o5
	fmovrsgz	%o3,	%f30,	%f18
	alignaddrl	%g1,	%i7,	%l3
	fxor	%f20,	%f30,	%f12
	smul	%o7,	%l4,	%i1
	subccc	%g4,	0x1BF5,	%i6
	andcc	%g7,	%g3,	%g6
	fpackfix	%f14,	%f2
	fnors	%f11,	%f29,	%f29
	edge32ln	%i2,	%i3,	%l0
	orcc	%i5,	%i0,	%o2
	st	%f15,	[%l7 + 0x48]
	movrgz	%l6,	%l1,	%l2
	mulx	%l5,	%o4,	%o0
	nop
	set	0x78, %i4
	lduw	[%l7 + %i4],	%i4
	movcc	%xcc,	%g2,	%o6
	fmovrsne	%o1,	%f24,	%f4
	ldsh	[%l7 + 0x60],	%o5
	subccc	%g5,	0x1D65,	%o3
	movre	%g1,	%i7,	%l3
	xorcc	%o7,	0x0B8D,	%l4
	and	%g4,	0x143A,	%i1
	fmovrdlez	%g7,	%f12,	%f16
	movvs	%icc,	%i6,	%g6
	movrlz	%g3,	%i2,	%i3
	edge8l	%i5,	%l0,	%i0
	sethi	0x0E14,	%l6
	edge32n	%l1,	%l2,	%l5
	umulcc	%o4,	0x1AC4,	%o2
	stw	%i4,	[%l7 + 0x70]
	array8	%g2,	%o0,	%o6
	lduh	[%l7 + 0x68],	%o1
	st	%f29,	[%l7 + 0x5C]
	subccc	%g5,	0x1535,	%o3
	fcmpes	%fcc1,	%f11,	%f13
	ldsb	[%l7 + 0x3A],	%o5
	edge16n	%i7,	%l3,	%g1
	st	%f10,	[%l7 + 0x78]
	fmovsgu	%icc,	%f4,	%f30
	sdiv	%o7,	0x1992,	%l4
	move	%xcc,	%i1,	%g7
	edge8l	%g4,	%i6,	%g6
	edge16ln	%i2,	%g3,	%i3
	ldsh	[%l7 + 0x7E],	%i5
	orcc	%l0,	0x1725,	%i0
	movpos	%xcc,	%l6,	%l2
	edge8l	%l1,	%o4,	%o2
	save %i4, %l5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g2,	0x07EA,	%o6
	srl	%o1,	0x1B,	%o3
	movl	%icc,	%o5,	%i7
	sllx	%l3,	0x1F,	%g5
	udivx	%g1,	0x0A9D,	%l4
	movn	%icc,	%o7,	%g7
	andn	%i1,	%g4,	%i6
	bshuffle	%f20,	%f20,	%f12
	subccc	%i2,	%g3,	%g6
	edge32n	%i3,	%l0,	%i5
	movgu	%icc,	%i0,	%l2
	stb	%l6,	[%l7 + 0x12]
	movrlz	%o4,	%o2,	%i4
	fnot2	%f8,	%f12
	stb	%l5,	[%l7 + 0x65]
	smulcc	%l1,	%o0,	%g2
	movge	%xcc,	%o1,	%o3
	fcmpd	%fcc1,	%f18,	%f0
	array32	%o5,	%o6,	%l3
	stw	%i7,	[%l7 + 0x1C]
	lduw	[%l7 + 0x2C],	%g5
	smulcc	%g1,	0x122A,	%l4
	edge8	%g7,	%i1,	%g4
	ldd	[%l7 + 0x20],	%f0
	umulcc	%i6,	%i2,	%g3
	movcs	%xcc,	%g6,	%i3
	sub	%o7,	%l0,	%i5
	stw	%l2,	[%l7 + 0x3C]
	addccc	%l6,	0x08D4,	%o4
	ldx	[%l7 + 0x28],	%o2
	smul	%i0,	0x080C,	%l5
	fmovrsgz	%i4,	%f24,	%f21
	or	%l1,	%o0,	%o1
	fmovscc	%xcc,	%f10,	%f11
	udivcc	%g2,	0x0F41,	%o5
	movneg	%icc,	%o6,	%o3
	fxnors	%f12,	%f14,	%f8
	movn	%icc,	%l3,	%g5
	addcc	%g1,	%l4,	%g7
	edge32	%i7,	%i1,	%g4
	mova	%icc,	%i6,	%g3
	stx	%g6,	[%l7 + 0x50]
	fcmple16	%f4,	%f20,	%i3
	smul	%o7,	0x1C46,	%l0
	fmovsneg	%icc,	%f25,	%f3
	sdiv	%i2,	0x0959,	%l2
	edge8ln	%i5,	%o4,	%o2
	subccc	%i0,	%l6,	%i4
	movvs	%xcc,	%l5,	%l1
	subc	%o1,	0x10D3,	%o0
	edge32	%o5,	%o6,	%g2
	fcmped	%fcc3,	%f24,	%f22
	fornot1s	%f18,	%f11,	%f31
	nop
	set	0x33, %i0
	stb	%l3,	[%l7 + %i0]
	edge16ln	%o3,	%g1,	%g5
	sra	%g7,	0x05,	%l4
	movpos	%icc,	%i7,	%i1
	movrgez	%i6,	%g3,	%g6
	movcc	%icc,	%i3,	%g4
	xnorcc	%o7,	%i2,	%l0
	fsrc1	%f16,	%f0
	movre	%l2,	0x22A,	%i5
	sdivx	%o4,	0x19E6,	%o2
	edge32n	%l6,	%i4,	%l5
	movneg	%icc,	%l1,	%i0
	andn	%o0,	%o1,	%o6
	fmovsgu	%xcc,	%f22,	%f20
	edge32n	%o5,	%g2,	%l3
	umulcc	%g1,	%o3,	%g5
	fmovsvs	%xcc,	%f31,	%f21
	fmuld8sux16	%f26,	%f8,	%f2
	and	%g7,	0x16F6,	%i7
	xor	%l4,	0x1C9F,	%i1
	edge16ln	%g3,	%g6,	%i3
	edge8ln	%g4,	%i6,	%o7
	subc	%l0,	0x1306,	%i2
	mova	%icc,	%i5,	%l2
	xorcc	%o4,	%l6,	%i4
	lduh	[%l7 + 0x20],	%l5
	pdist	%f16,	%f14,	%f26
	restore %l1, 0x0069, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o0,	0x109D,	%o1
	mulx	%i0,	%o5,	%o6
	smulcc	%l3,	0x0D97,	%g2
	array8	%o3,	%g5,	%g7
	movge	%icc,	%i7,	%l4
	smulcc	%i1,	0x059C,	%g1
	st	%f8,	[%l7 + 0x28]
	orcc	%g3,	0x0579,	%i3
	addc	%g6,	%g4,	%o7
	movvs	%icc,	%i6,	%l0
	andncc	%i2,	%i5,	%l2
	srax	%o4,	0x17,	%l6
	fandnot1s	%f0,	%f23,	%f16
	sllx	%l5,	0x13,	%i4
	fmovrslz	%o2,	%f19,	%f2
	movrne	%o0,	%o1,	%l1
	pdist	%f4,	%f8,	%f24
	save %i0, %o5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l3,	0x07A9,	%g2
	stb	%g5,	[%l7 + 0x3E]
	fornot2s	%f14,	%f27,	%f12
	fmovdg	%icc,	%f18,	%f16
	or	%o3,	0x0C95,	%i7
	movcs	%icc,	%l4,	%i1
	fsrc1	%f4,	%f10
	movgu	%icc,	%g1,	%g3
	mulx	%i3,	%g7,	%g4
	ldsw	[%l7 + 0x24],	%o7
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	xnorcc	%i5,	%l0,	%o4
	fpmerge	%f15,	%f21,	%f2
	orcc	%l6,	%l5,	%i4
	sdiv	%o2,	0x09E6,	%l2
	udivcc	%o0,	0x0518,	%o1
	smul	%i0,	%o5,	%o6
	xnor	%l1,	0x11DB,	%g2
	fmovdgu	%xcc,	%f2,	%f17
	orcc	%l3,	0x01F6,	%o3
	restore %g5, 0x0F23, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i7,	%g1,	%g3
	sra	%i3,	0x18,	%i1
	orncc	%g7,	%o7,	%g4
	sethi	0x0F59,	%i6
	subccc	%i2,	%g6,	%l0
	srax	%i5,	0x05,	%o4
	fnot2s	%f2,	%f16
	movpos	%icc,	%l6,	%l5
	fnot2	%f30,	%f10
	lduh	[%l7 + 0x70],	%o2
	umulcc	%l2,	%i4,	%o1
	movcs	%icc,	%i0,	%o0
	subc	%o5,	%o6,	%g2
	movgu	%icc,	%l1,	%o3
	movrne	%l3,	0x1A1,	%g5
	and	%i7,	0x1358,	%g1
	ld	[%l7 + 0x28],	%f24
	sdiv	%l4,	0x07A8,	%g3
	movl	%xcc,	%i1,	%i3
	movle	%xcc,	%g7,	%g4
	movge	%icc,	%i6,	%i2
	sdiv	%o7,	0x1882,	%l0
	movne	%xcc,	%i5,	%g6
	edge8	%l6,	%l5,	%o2
	fmul8sux16	%f18,	%f16,	%f8
	movle	%icc,	%o4,	%i4
	sdivx	%o1,	0x0753,	%l2
	sdiv	%o0,	0x17F9,	%o5
	fsrc2	%f20,	%f18
	fmuld8sux16	%f30,	%f4,	%f12
	sdiv	%o6,	0x0137,	%g2
	addcc	%l1,	%i0,	%o3
	ld	[%l7 + 0x1C],	%f3
	fpadd32	%f18,	%f6,	%f6
	fmuld8ulx16	%f14,	%f27,	%f6
	movpos	%xcc,	%l3,	%i7
	andn	%g5,	0x1512,	%g1
	mulx	%l4,	%g3,	%i3
	sth	%g7,	[%l7 + 0x48]
	movrne	%i1,	%g4,	%i6
	movcc	%xcc,	%i2,	%o7
	smulcc	%i5,	%l0,	%g6
	xorcc	%l6,	0x13CE,	%l5
	fnand	%f30,	%f16,	%f4
	fmul8x16al	%f0,	%f28,	%f16
	ldsh	[%l7 + 0x3A],	%o2
	movl	%icc,	%i4,	%o4
	addcc	%o1,	%l2,	%o0
	stw	%o5,	[%l7 + 0x40]
	movne	%xcc,	%g2,	%o6
	fmul8x16	%f17,	%f6,	%f28
	lduh	[%l7 + 0x44],	%i0
	movgu	%icc,	%o3,	%l3
	xnor	%l1,	0x0CE5,	%i7
	sethi	0x124F,	%g1
	sethi	0x191B,	%l4
	fornot2s	%f27,	%f25,	%f11
	fmovsneg	%icc,	%f4,	%f24
	subcc	%g3,	%g5,	%i3
	std	%f16,	[%l7 + 0x78]
	edge16l	%i1,	%g4,	%g7
	movne	%xcc,	%i6,	%i2
	lduw	[%l7 + 0x14],	%i5
	subcc	%o7,	0x016B,	%l0
	umul	%l6,	%l5,	%g6
	movrlz	%i4,	0x0BC,	%o4
	fmovsvs	%icc,	%f30,	%f1
	array8	%o1,	%o2,	%l2
	movvc	%icc,	%o5,	%g2
	addccc	%o6,	0x031B,	%i0
	fpadd16	%f26,	%f16,	%f6
	stb	%o0,	[%l7 + 0x10]
	edge32	%l3,	%l1,	%o3
	orn	%i7,	0x15F0,	%l4
	umulcc	%g1,	%g3,	%g5
	array32	%i1,	%g4,	%i3
	or	%i6,	%i2,	%g7
	udivx	%i5,	0x0FE2,	%l0
	fmovdvc	%icc,	%f15,	%f18
	udivcc	%l6,	0x0762,	%l5
	fnands	%f24,	%f8,	%f12
	edge16n	%o7,	%g6,	%i4
	umul	%o4,	0x0DAD,	%o2
	fmovsge	%xcc,	%f21,	%f4
	fandnot1s	%f17,	%f25,	%f25
	fmovrdgez	%l2,	%f4,	%f18
	movvs	%icc,	%o1,	%o5
	edge8l	%g2,	%i0,	%o6
	ldx	[%l7 + 0x78],	%o0
	fandnot1s	%f4,	%f4,	%f16
	xnor	%l1,	%o3,	%l3
	xnor	%i7,	%l4,	%g1
	sth	%g3,	[%l7 + 0x28]
	edge32l	%g5,	%i1,	%g4
	edge16ln	%i3,	%i2,	%g7
	subc	%i6,	%l0,	%l6
	movvs	%xcc,	%l5,	%i5
	movn	%icc,	%g6,	%i4
	alignaddr	%o7,	%o4,	%o2
	fmovdcs	%icc,	%f21,	%f8
	fabss	%f15,	%f3
	edge8l	%o1,	%l2,	%g2
	addcc	%i0,	%o5,	%o6
	ldsb	[%l7 + 0x58],	%o0
	orncc	%l1,	0x003A,	%l3
	array32	%i7,	%o3,	%g1
	sdiv	%g3,	0x04F4,	%g5
	udiv	%l4,	0x1ABF,	%g4
	fmovdcs	%xcc,	%f25,	%f4
	fands	%f8,	%f30,	%f12
	xnorcc	%i1,	0x1096,	%i3
	add	%g7,	%i6,	%i2
	movcc	%icc,	%l6,	%l0
	ldsh	[%l7 + 0x78],	%l5
	edge16	%g6,	%i5,	%o7
	srl	%o4,	0x1D,	%i4
	fmovrdne	%o2,	%f0,	%f28
	subc	%o1,	0x1E67,	%l2
	movpos	%icc,	%g2,	%o5
	fpadd32s	%f23,	%f1,	%f7
	fsrc2	%f10,	%f0
	fmovdl	%xcc,	%f12,	%f3
	subccc	%i0,	0x0C03,	%o0
	stb	%l1,	[%l7 + 0x38]
	save %o6, %l3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o3,	%g3,	%g5
	orcc	%g1,	0x13FC,	%g4
	movcc	%icc,	%i1,	%i3
	fmovsl	%xcc,	%f11,	%f21
	fmul8x16	%f2,	%f4,	%f2
	fmovrsgz	%g7,	%f10,	%f0
	fmovdpos	%icc,	%f7,	%f20
	movrlz	%l4,	%i6,	%i2
	orncc	%l6,	0x0497,	%l5
	or	%l0,	0x0B1D,	%i5
	fone	%f24
	orncc	%o7,	%g6,	%i4
	ldd	[%l7 + 0x68],	%o2
	movrlez	%o4,	%l2,	%o1
	udivx	%g2,	0x1B03,	%o5
	fmovdvc	%xcc,	%f24,	%f28
	fmovrslez	%o0,	%f0,	%f14
	ldub	[%l7 + 0x39],	%i0
	movl	%xcc,	%o6,	%l1
	sdiv	%l3,	0x050A,	%i7
	udiv	%o3,	0x19E6,	%g5
	movvc	%icc,	%g3,	%g4
	ldd	[%l7 + 0x68],	%f28
	udivcc	%g1,	0x1459,	%i1
	fmovde	%icc,	%f6,	%f1
	ldub	[%l7 + 0x5D],	%g7
	ldsb	[%l7 + 0x13],	%i3
	movrgz	%l4,	0x234,	%i2
	sra	%l6,	%i6,	%l0
	xnor	%l5,	%o7,	%g6
	fmuld8ulx16	%f26,	%f6,	%f12
	xnorcc	%i4,	%o2,	%o4
	ldd	[%l7 + 0x78],	%f2
	xnorcc	%i5,	%o1,	%l2
	edge8n	%g2,	%o5,	%i0
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	fpadd16	%f28,	%f14,	%f18
	fsrc2	%f2,	%f2
	edge16ln	%i7,	%o3,	%l3
	movne	%xcc,	%g3,	%g4
	and	%g1,	0x0D79,	%g5
	popc	0x1BE3,	%i1
	lduw	[%l7 + 0x2C],	%i3
	srax	%l4,	%i2,	%l6
	smul	%g7,	%i6,	%l0
	movg	%xcc,	%l5,	%g6
	add	%o7,	%i4,	%o2
	st	%f6,	[%l7 + 0x3C]
	alignaddr	%i5,	%o4,	%l2
	srax	%g2,	0x1F,	%o5
	fmovdn	%xcc,	%f2,	%f1
	addc	%o1,	0x0200,	%i0
	nop
	set	0x7A, %l4
	ldub	[%l7 + %l4],	%o6
	lduw	[%l7 + 0x1C],	%o0
	alignaddrl	%i7,	%o3,	%l1
	add	%g3,	%g4,	%g1
	and	%g5,	0x0A61,	%i1
	movgu	%icc,	%i3,	%l3
	umul	%l4,	%l6,	%g7
	ldx	[%l7 + 0x70],	%i2
	smulcc	%i6,	0x0D2A,	%l5
	fmovscc	%icc,	%f7,	%f30
	andcc	%l0,	%g6,	%o7
	edge16l	%i4,	%o2,	%o4
	movrlz	%i5,	0x06C,	%g2
	sdivcc	%o5,	0x0C6D,	%l2
	xnorcc	%i0,	%o6,	%o0
	fpack16	%f28,	%f27
	edge8n	%i7,	%o1,	%l1
	and	%g3,	0x02E1,	%o3
	movrlz	%g1,	%g5,	%g4
	fmovsvc	%xcc,	%f18,	%f27
	ldx	[%l7 + 0x20],	%i1
	addc	%l3,	%l4,	%l6
	stw	%g7,	[%l7 + 0x38]
	edge8n	%i2,	%i3,	%i6
	fnor	%f30,	%f18,	%f22
	movvs	%xcc,	%l0,	%g6
	smul	%l5,	0x0B2A,	%o7
	mova	%xcc,	%i4,	%o2
	andcc	%i5,	%o4,	%g2
	movrgez	%l2,	%o5,	%i0
	movleu	%icc,	%o0,	%i7
	nop
	set	0x40, %g7
	stw	%o6,	[%l7 + %g7]
	fcmple32	%f26,	%f2,	%o1
	orn	%l1,	%o3,	%g1
	mulscc	%g3,	0x156D,	%g5
	stb	%g4,	[%l7 + 0x4D]
	movn	%xcc,	%l3,	%i1
	fnot2s	%f25,	%f12
	edge32l	%l6,	%l4,	%i2
	fmovrdgez	%i3,	%f28,	%f18
	movre	%i6,	0x0F5,	%l0
	umul	%g6,	%g7,	%o7
	srax	%l5,	0x01,	%o2
	sub	%i5,	0x17DC,	%o4
	srlx	%g2,	%i4,	%l2
	addccc	%o5,	%i0,	%i7
	edge16n	%o0,	%o1,	%l1
	fcmpeq32	%f18,	%f30,	%o6
	movge	%xcc,	%g1,	%o3
	restore %g5, 0x1970, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g4,	%i1,	%l3
	fpsub16s	%f8,	%f26,	%f1
	addccc	%l6,	0x1BF2,	%i2
	movneg	%icc,	%l4,	%i6
	sll	%i3,	%l0,	%g6
	pdist	%f30,	%f0,	%f0
	lduh	[%l7 + 0x0C],	%g7
	stx	%o7,	[%l7 + 0x50]
	edge16l	%l5,	%o2,	%i5
	xnor	%o4,	0x0D28,	%g2
	fsrc1s	%f7,	%f4
	fmovde	%xcc,	%f2,	%f10
	ld	[%l7 + 0x48],	%f26
	nop
	set	0x1A, %i2
	stb	%i4,	[%l7 + %i2]
	stb	%o5,	[%l7 + 0x70]
	fnot2s	%f16,	%f30
	movrlez	%i0,	0x25C,	%l2
	edge8l	%i7,	%o0,	%l1
	fcmpd	%fcc3,	%f30,	%f8
	movcc	%icc,	%o6,	%g1
	fpackfix	%f2,	%f27
	fnot1s	%f31,	%f4
	fmuld8ulx16	%f9,	%f27,	%f30
	edge16l	%o1,	%o3,	%g5
	fpsub32s	%f1,	%f4,	%f24
	fcmpne16	%f8,	%f12,	%g3
	fmovde	%xcc,	%f0,	%f22
	fmovda	%icc,	%f6,	%f24
	for	%f6,	%f16,	%f14
	edge32l	%i1,	%g4,	%l3
	fnand	%f0,	%f12,	%f12
	udivx	%i2,	0x1CD0,	%l6
	array16	%l4,	%i6,	%l0
	movrne	%g6,	0x1CD,	%i3
	fmovdcc	%xcc,	%f10,	%f2
	movge	%icc,	%o7,	%l5
	srax	%o2,	0x15,	%i5
	movge	%xcc,	%o4,	%g7
	fcmpd	%fcc0,	%f10,	%f8
	smul	%i4,	0x120E,	%o5
	fmul8x16	%f20,	%f4,	%f30
	udiv	%i0,	0x000D,	%l2
	ldub	[%l7 + 0x34],	%g2
	edge32l	%i7,	%o0,	%l1
	fnand	%f8,	%f24,	%f6
	movne	%xcc,	%g1,	%o1
	subcc	%o3,	%o6,	%g5
	orn	%i1,	%g4,	%l3
	srl	%g3,	0x00,	%i2
	orncc	%l4,	0x05B9,	%i6
	save %l6, 0x1096, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l0,	%i3,	%o7
	sllx	%l5,	%o2,	%o4
	sethi	0x15B5,	%g7
	fxors	%f11,	%f8,	%f28
	movg	%icc,	%i4,	%i5
	sllx	%i0,	%o5,	%g2
	mulscc	%i7,	0x0F81,	%o0
	fmovdleu	%xcc,	%f28,	%f25
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f16
	ld	[%l7 + 0x34],	%f22
	addcc	%l2,	0x14FE,	%l1
	movl	%icc,	%o1,	%g1
	fpackfix	%f18,	%f20
	or	%o6,	0x1D50,	%o3
	umul	%i1,	%g5,	%l3
	fmovdge	%xcc,	%f16,	%f28
	stw	%g3,	[%l7 + 0x5C]
	movl	%xcc,	%g4,	%i2
	sll	%l4,	%i6,	%l6
	movge	%xcc,	%l0,	%i3
	stb	%o7,	[%l7 + 0x5B]
	lduh	[%l7 + 0x7C],	%g6
	movvs	%icc,	%o2,	%o4
	andn	%l5,	%i4,	%i5
	fpack32	%f20,	%f16,	%f0
	fpadd16s	%f10,	%f6,	%f17
	addcc	%i0,	0x1F8A,	%o5
	edge32n	%g2,	%i7,	%o0
	movneg	%icc,	%l2,	%l1
	fcmpes	%fcc0,	%f25,	%f2
	orncc	%g7,	%o1,	%o6
	srlx	%o3,	%g1,	%i1
	fpsub16s	%f6,	%f16,	%f11
	nop
	set	0x44, %o0
	lduw	[%l7 + %o0],	%l3
	sra	%g5,	0x0A,	%g4
	ld	[%l7 + 0x34],	%f17
	lduw	[%l7 + 0x2C],	%i2
	fmovrslez	%g3,	%f11,	%f11
	fnands	%f4,	%f5,	%f20
	movneg	%xcc,	%i6,	%l6
	movl	%xcc,	%l0,	%i3
	udivx	%l4,	0x0ABE,	%o7
	fpackfix	%f18,	%f18
	edge32l	%g6,	%o2,	%l5
	movpos	%icc,	%i4,	%o4
	umul	%i0,	%o5,	%i5
	st	%f17,	[%l7 + 0x68]
	movcc	%icc,	%i7,	%g2
	lduh	[%l7 + 0x3A],	%o0
	save %l1, 0x073C, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x30],	%f16
	stb	%o1,	[%l7 + 0x16]
	alignaddrl	%o6,	%l2,	%g1
	sdivcc	%i1,	0x073B,	%l3
	movpos	%xcc,	%o3,	%g4
	ldsb	[%l7 + 0x6A],	%g5
	srl	%g3,	0x15,	%i2
	ldsb	[%l7 + 0x47],	%i6
	movneg	%icc,	%l6,	%i3
	st	%f7,	[%l7 + 0x54]
	edge8n	%l4,	%l0,	%o7
	udivcc	%g6,	0x117D,	%l5
	fmovrsgz	%o2,	%f22,	%f6
	movle	%icc,	%i4,	%i0
	movrne	%o4,	%o5,	%i7
	or	%g2,	0x04AA,	%i5
	edge8ln	%o0,	%g7,	%o1
	srax	%l1,	%l2,	%o6
	andncc	%g1,	%l3,	%o3
	ldsw	[%l7 + 0x10],	%i1
	movcs	%icc,	%g4,	%g3
	stx	%i2,	[%l7 + 0x20]
	fsrc1	%f24,	%f16
	orn	%g5,	0x18AF,	%l6
	mulscc	%i3,	%l4,	%i6
	movrlz	%o7,	0x040,	%l0
	srlx	%l5,	0x0D,	%g6
	edge16	%o2,	%i0,	%i4
	movrgz	%o5,	0x01A,	%o4
	movne	%icc,	%i7,	%i5
	sdivx	%o0,	0x039E,	%g7
	sra	%o1,	%g2,	%l1
	movgu	%icc,	%o6,	%g1
	fmovsneg	%icc,	%f8,	%f16
	udivx	%l3,	0x06BB,	%o3
	xnorcc	%i1,	0x0308,	%g4
	lduw	[%l7 + 0x68],	%l2
	fcmped	%fcc0,	%f22,	%f4
	movrlez	%g3,	0x206,	%i2
	xor	%l6,	0x10F3,	%g5
	smul	%l4,	%i6,	%o7
	stw	%l0,	[%l7 + 0x74]
	movge	%xcc,	%l5,	%i3
	alignaddr	%o2,	%i0,	%g6
	movl	%icc,	%o5,	%o4
	sll	%i4,	0x0E,	%i5
	edge8ln	%i7,	%o0,	%g7
	ldub	[%l7 + 0x61],	%o1
	ldd	[%l7 + 0x20],	%g2
	ldub	[%l7 + 0x54],	%o6
	umul	%g1,	%l1,	%o3
	alignaddr	%l3,	%i1,	%g4
	stb	%g3,	[%l7 + 0x69]
	sdivx	%l2,	0x1EDA,	%i2
	sth	%g5,	[%l7 + 0x62]
	alignaddrl	%l6,	%l4,	%o7
	movrne	%l0,	%i6,	%l5
	fnands	%f25,	%f10,	%f10
	addc	%i3,	0x0E91,	%o2
	smulcc	%g6,	0x1900,	%o5
	udivx	%o4,	0x06DB,	%i4
	edge32ln	%i5,	%i0,	%i7
	andn	%g7,	0x1E44,	%o1
	lduh	[%l7 + 0x56],	%g2
	umulcc	%o0,	0x04C4,	%o6
	ld	[%l7 + 0x60],	%f14
	addc	%l1,	%o3,	%l3
	fcmpgt16	%f20,	%f26,	%g1
	fands	%f15,	%f19,	%f27
	ldx	[%l7 + 0x78],	%g4
	movle	%xcc,	%g3,	%l2
	sub	%i1,	%i2,	%g5
	ldd	[%l7 + 0x38],	%f0
	smulcc	%l6,	0x1422,	%l4
	subccc	%l0,	0x1706,	%o7
	st	%f11,	[%l7 + 0x28]
	pdist	%f12,	%f10,	%f26
	ld	[%l7 + 0x1C],	%f23
	ldx	[%l7 + 0x08],	%i6
	subccc	%i3,	%o2,	%l5
	sdivcc	%g6,	0x1766,	%o5
	udivx	%o4,	0x0B5B,	%i5
	fmovdcc	%xcc,	%f31,	%f5
	srl	%i4,	%i0,	%i7
	fandnot2	%f8,	%f20,	%f12
	movgu	%icc,	%g7,	%g2
	xnorcc	%o1,	%o6,	%l1
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	alignaddrl	%g1,	%o3,	%g3
	edge32n	%g4,	%l2,	%i2
	ldx	[%l7 + 0x50],	%g5
	or	%l6,	%l4,	%l0
	popc	0x039B,	%i1
	movgu	%icc,	%i6,	%o7
	sth	%i3,	[%l7 + 0x38]
	siam	0x1
	addccc	%l5,	0x1C32,	%o2
	fmuld8sux16	%f10,	%f17,	%f30
	fmovrdgez	%o5,	%f18,	%f30
	addccc	%o4,	0x0E3D,	%g6
	fmovse	%xcc,	%f12,	%f20
	fcmpeq16	%f16,	%f14,	%i4
	sth	%i5,	[%l7 + 0x2C]
	addccc	%i7,	0x0526,	%g7
	ldx	[%l7 + 0x60],	%g2
	fpsub16	%f14,	%f10,	%f6
	srax	%i0,	%o6,	%o1
	addcc	%o0,	%l1,	%g1
	movrne	%o3,	0x0D4,	%g3
	edge32ln	%l3,	%g4,	%l2
	array8	%g5,	%l6,	%l4
	ldub	[%l7 + 0x1D],	%l0
	add	%i2,	0x0EF5,	%i6
	subcc	%i1,	0x0175,	%o7
	restore %l5, %o2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x78],	%o5
	move	%xcc,	%o4,	%g6
	fpsub16	%f24,	%f22,	%f22
	fmovrdlz	%i4,	%f6,	%f10
	movcc	%icc,	%i7,	%g7
	fnot1s	%f6,	%f9
	fmovsl	%xcc,	%f8,	%f19
	xor	%i5,	0x1740,	%i0
	ldx	[%l7 + 0x60],	%g2
	andncc	%o1,	%o0,	%o6
	nop
	set	0x76, %g6
	sth	%l1,	[%l7 + %g6]
	sll	%o3,	%g1,	%g3
	udivx	%l3,	0x01F4,	%l2
	sllx	%g5,	0x1B,	%g4
	movvc	%xcc,	%l6,	%l4
	addcc	%i2,	%l0,	%i6
	umulcc	%i1,	%l5,	%o2
	subc	%o7,	%i3,	%o4
	save %o5, %g6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%g7,	%i4
	movrgz	%i5,	%i0,	%g2
	array16	%o1,	%o6,	%l1
	orn	%o3,	%o0,	%g3
	move	%xcc,	%l3,	%l2
	nop
	set	0x53, %o5
	ldub	[%l7 + %o5],	%g1
	lduh	[%l7 + 0x58],	%g5
	edge32ln	%g4,	%l4,	%i2
	srax	%l0,	0x1C,	%l6
	andn	%i6,	%l5,	%o2
	fmovdcc	%xcc,	%f12,	%f8
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	ldsb	[%l7 + 0x3F],	%o4
	move	%icc,	%o5,	%i3
	fcmple16	%f22,	%f2,	%g6
	fcmpd	%fcc3,	%f22,	%f14
	fcmpne32	%f20,	%f18,	%i7
	array8	%i4,	%i5,	%g7
	srax	%i0,	%o1,	%o6
	andn	%g2,	0x176E,	%o3
	mulscc	%l1,	0x153D,	%o0
	fmul8x16	%f31,	%f14,	%f2
	ldsh	[%l7 + 0x7A],	%l3
	orn	%l2,	%g3,	%g1
	edge8n	%g5,	%g4,	%l4
	smulcc	%i2,	0x18F0,	%l6
	subcc	%i6,	0x1139,	%l0
	edge8l	%o2,	%l5,	%i1
	fcmpeq16	%f2,	%f12,	%o4
	fsrc2s	%f8,	%f0
	udiv	%o5,	0x0971,	%i3
	ldx	[%l7 + 0x08],	%g6
	movrlz	%i7,	0x1C5,	%i4
	andncc	%i5,	%g7,	%o7
	nop
	set	0x6A, %i1
	ldsh	[%l7 + %i1],	%i0
	movpos	%xcc,	%o1,	%g2
	ld	[%l7 + 0x20],	%f23
	addccc	%o3,	%o6,	%l1
	orncc	%o0,	0x1A4F,	%l3
	movrgez	%g3,	%l2,	%g5
	alignaddr	%g4,	%g1,	%l4
	ldub	[%l7 + 0x4D],	%i2
	sth	%i6,	[%l7 + 0x5C]
	sub	%l6,	%o2,	%l0
	stw	%i1,	[%l7 + 0x20]
	edge16n	%o4,	%o5,	%i3
	srax	%g6,	%i7,	%i4
	edge8l	%l5,	%i5,	%g7
	subcc	%o7,	0x0F8B,	%i0
	sllx	%g2,	0x0B,	%o1
	edge32	%o6,	%o3,	%l1
	ldd	[%l7 + 0x50],	%f10
	fmovs	%f20,	%f8
	movcs	%xcc,	%l3,	%g3
	umulcc	%l2,	%o0,	%g5
	addcc	%g4,	0x187F,	%g1
	fmovse	%xcc,	%f25,	%f21
	edge32ln	%i2,	%i6,	%l6
	sdivcc	%o2,	0x091F,	%l4
	sll	%l0,	0x12,	%o4
	fandnot2	%f2,	%f12,	%f10
	edge8n	%o5,	%i3,	%g6
	edge16l	%i1,	%i4,	%i7
	lduw	[%l7 + 0x08],	%l5
	fzeros	%f0
	sra	%g7,	0x1E,	%i5
	move	%icc,	%o7,	%i0
	movl	%icc,	%o1,	%g2
	array32	%o6,	%l1,	%o3
	edge32l	%l3,	%l2,	%g3
	ldd	[%l7 + 0x38],	%g4
	xnorcc	%o0,	%g4,	%g1
	sir	0x13F0
	fmovrslz	%i6,	%f5,	%f14
	mova	%icc,	%i2,	%l6
	andn	%l4,	%l0,	%o2
	fornot2	%f4,	%f6,	%f4
	siam	0x3
	addcc	%o5,	0x1E3C,	%i3
	edge32	%o4,	%g6,	%i4
	array32	%i7,	%l5,	%i1
	addccc	%i5,	%o7,	%g7
	edge16l	%o1,	%i0,	%g2
	fpadd32s	%f16,	%f26,	%f18
	xnorcc	%l1,	%o3,	%o6
	fpadd32	%f20,	%f24,	%f24
	sdivx	%l2,	0x00E4,	%g3
	sllx	%l3,	0x10,	%g5
	subccc	%o0,	%g1,	%i6
	movvc	%xcc,	%g4,	%l6
	fmuld8ulx16	%f15,	%f11,	%f22
	movcs	%xcc,	%l4,	%l0
	movne	%xcc,	%i2,	%o5
	subcc	%o2,	0x1C7F,	%o4
	edge16	%i3,	%g6,	%i4
	edge32	%i7,	%i1,	%i5
	orcc	%o7,	%g7,	%l5
	srax	%o1,	0x18,	%g2
	nop
	set	0x38, %o3
	ldd	[%l7 + %o3],	%l0
	andn	%i0,	0x1E97,	%o3
	stx	%o6,	[%l7 + 0x60]
	lduh	[%l7 + 0x52],	%l2
	andncc	%g3,	%g5,	%l3
	fone	%f4
	orncc	%g1,	%o0,	%g4
	ldd	[%l7 + 0x78],	%f16
	movvc	%icc,	%i6,	%l6
	fones	%f19
	movrne	%l0,	%i2,	%l4
	stb	%o5,	[%l7 + 0x50]
	ldx	[%l7 + 0x40],	%o4
	fcmpeq16	%f16,	%f0,	%o2
	fone	%f26
	fornot1s	%f12,	%f8,	%f13
	movn	%icc,	%i3,	%i4
	alignaddrl	%i7,	%i1,	%i5
	addc	%o7,	0x0921,	%g6
	sethi	0x0C04,	%g7
	std	%f20,	[%l7 + 0x48]
	andncc	%o1,	%g2,	%l1
	fmovs	%f31,	%f0
	edge32n	%l5,	%o3,	%i0
	stb	%l2,	[%l7 + 0x63]
	edge32	%g3,	%g5,	%l3
	andcc	%o6,	0x1786,	%o0
	lduw	[%l7 + 0x5C],	%g1
	sth	%g4,	[%l7 + 0x64]
	movcs	%xcc,	%i6,	%l0
	subccc	%l6,	%l4,	%o5
	move	%xcc,	%i2,	%o2
	fcmps	%fcc0,	%f25,	%f23
	movpos	%icc,	%i3,	%i4
	addc	%i7,	0x16CF,	%o4
	sdivcc	%i1,	0x0072,	%o7
	umulcc	%g6,	%i5,	%o1
	srlx	%g2,	0x1B,	%l1
	fnors	%f29,	%f29,	%f12
	fcmps	%fcc3,	%f2,	%f20
	sra	%g7,	%l5,	%i0
	edge8	%o3,	%g3,	%g5
	fmovdpos	%icc,	%f12,	%f18
	fmovrslez	%l2,	%f13,	%f23
	fpmerge	%f21,	%f6,	%f24
	std	%f24,	[%l7 + 0x50]
	fpsub16	%f2,	%f30,	%f30
	movge	%xcc,	%l3,	%o6
	ldsb	[%l7 + 0x46],	%g1
	orcc	%g4,	%i6,	%o0
	orcc	%l0,	0x1F37,	%l6
	fpsub16s	%f5,	%f28,	%f24
	movrgz	%l4,	%o5,	%i2
	umul	%i3,	0x1CDB,	%o2
	ldd	[%l7 + 0x30],	%f20
	movvc	%xcc,	%i7,	%i4
	sir	0x041E
	movvs	%xcc,	%i1,	%o7
	movle	%icc,	%o4,	%g6
	fmovsgu	%icc,	%f15,	%f17
	ldub	[%l7 + 0x44],	%i5
	edge8ln	%o1,	%g2,	%l1
	fone	%f6
	move	%xcc,	%l5,	%g7
	fmovdn	%icc,	%f11,	%f31
	fmovsle	%icc,	%f24,	%f16
	ld	[%l7 + 0x10],	%f30
	edge16l	%i0,	%g3,	%g5
	fmovdl	%icc,	%f6,	%f10
	udivx	%o3,	0x09ED,	%l2
	fornot2s	%f15,	%f1,	%f17
	fmovrdlz	%l3,	%f6,	%f18
	srax	%g1,	0x02,	%g4
	movle	%icc,	%o6,	%i6
	movneg	%icc,	%l0,	%o0
	fmovs	%f17,	%f17
	array32	%l6,	%l4,	%i2
	mulscc	%o5,	%i3,	%i7
	fmovs	%f3,	%f31
	movvc	%icc,	%o2,	%i4
	array8	%i1,	%o7,	%o4
	st	%f1,	[%l7 + 0x54]
	umul	%i5,	0x0FAA,	%g6
	siam	0x7
	movrlz	%g2,	0x078,	%l1
	orn	%l5,	0x0E0C,	%o1
	umul	%g7,	0x11C3,	%g3
	movl	%xcc,	%i0,	%g5
	addccc	%l2,	0x0C34,	%l3
	sub	%o3,	0x00E8,	%g1
	fmovdcs	%xcc,	%f12,	%f23
	movl	%xcc,	%o6,	%g4
	movne	%xcc,	%l0,	%i6
	udiv	%o0,	0x05AD,	%l4
	ldd	[%l7 + 0x48],	%f18
	sdiv	%l6,	0x1F96,	%i2
	fmovsvc	%icc,	%f28,	%f11
	edge32ln	%i3,	%o5,	%o2
	edge32n	%i4,	%i7,	%i1
	ldsb	[%l7 + 0x09],	%o4
	alignaddrl	%o7,	%g6,	%i5
	xorcc	%l1,	0x01E5,	%g2
	movrne	%o1,	0x1B5,	%l5
	udivx	%g3,	0x116D,	%i0
	fmovrse	%g7,	%f25,	%f7
	andncc	%l2,	%l3,	%g5
	sdivx	%o3,	0x159E,	%g1
	edge8n	%g4,	%o6,	%l0
	fmovda	%xcc,	%f21,	%f25
	fxors	%f27,	%f31,	%f4
	sdivcc	%i6,	0x0E7F,	%l4
	movn	%icc,	%l6,	%o0
	fcmpne16	%f26,	%f24,	%i3
	movrgz	%i2,	0x34F,	%o5
	movvc	%icc,	%i4,	%o2
	edge32n	%i1,	%i7,	%o4
	and	%g6,	%o7,	%i5
	andcc	%g2,	%o1,	%l1
	edge8	%g3,	%l5,	%i0
	movne	%icc,	%g7,	%l2
	ldsb	[%l7 + 0x1C],	%l3
	movrlz	%o3,	%g1,	%g4
	stw	%o6,	[%l7 + 0x40]
	movrlez	%l0,	0x274,	%g5
	add	%l4,	%l6,	%i6
	move	%icc,	%i3,	%i2
	siam	0x1
	ldub	[%l7 + 0x27],	%o0
	nop
	set	0x58, %g2
	ldsw	[%l7 + %g2],	%o5
	edge8ln	%i4,	%i1,	%i7
	ldsw	[%l7 + 0x70],	%o4
	mulx	%o2,	%g6,	%i5
	fmovdleu	%icc,	%f27,	%f1
	edge8l	%g2,	%o7,	%l1
	movrgz	%o1,	0x183,	%g3
	ldub	[%l7 + 0x56],	%i0
	stx	%l5,	[%l7 + 0x40]
	fmovdcs	%icc,	%f19,	%f22
	stb	%l2,	[%l7 + 0x0C]
	xorcc	%g7,	%l3,	%g1
	orncc	%g4,	0x0CDB,	%o3
	movrlez	%o6,	0x045,	%g5
	movrlz	%l4,	0x3E8,	%l0
	std	%f24,	[%l7 + 0x50]
	mulx	%i6,	0x02F1,	%i3
	edge16n	%i2,	%o0,	%o5
	smulcc	%l6,	%i1,	%i4
	ldsw	[%l7 + 0x5C],	%i7
	movneg	%icc,	%o4,	%o2
	movcc	%icc,	%i5,	%g6
	edge32n	%g2,	%o7,	%o1
	edge32n	%l1,	%g3,	%i0
	orcc	%l2,	%l5,	%l3
	fnot1	%f12,	%f12
	movleu	%xcc,	%g7,	%g1
	array8	%o3,	%o6,	%g4
	movle	%icc,	%g5,	%l4
	edge32n	%l0,	%i3,	%i6
	save %o0, %i2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x1197,	%l6
	udivx	%i7,	0x0E97,	%o4
	xnorcc	%i4,	%o2,	%i5
	xorcc	%g6,	%g2,	%o7
	fcmped	%fcc0,	%f8,	%f10
	movrne	%o1,	%l1,	%g3
	movle	%icc,	%i0,	%l5
	save %l2, %l3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o3,	0x1A84,	%o6
	ldub	[%l7 + 0x5A],	%g4
	ldd	[%l7 + 0x60],	%f20
	fnor	%f4,	%f2,	%f14
	fmovsn	%icc,	%f15,	%f28
	fpadd16s	%f6,	%f11,	%f22
	edge32l	%g5,	%l4,	%l0
	udiv	%g1,	0x0CB4,	%i6
	andncc	%i3,	%o0,	%o5
	or	%i2,	0x1715,	%l6
	movgu	%icc,	%i1,	%o4
	movgu	%xcc,	%i7,	%i4
	fornot2s	%f8,	%f13,	%f19
	edge16ln	%o2,	%g6,	%g2
	movre	%o7,	%o1,	%i5
	siam	0x1
	sdivx	%g3,	0x1970,	%i0
	fcmpne32	%f20,	%f0,	%l5
	udivcc	%l1,	0x01DF,	%l3
	movrgz	%l2,	%o3,	%o6
	subccc	%g4,	0x0239,	%g7
	fmovscs	%icc,	%f4,	%f12
	fmovrsne	%l4,	%f29,	%f4
	alignaddr	%g5,	%g1,	%l0
	edge16l	%i6,	%i3,	%o0
	ldsb	[%l7 + 0x63],	%i2
	udivx	%o5,	0x1188,	%l6
	fmovrdlz	%o4,	%f10,	%f6
	fxnors	%f13,	%f3,	%f16
	orn	%i7,	%i1,	%i4
	fmovdvc	%xcc,	%f5,	%f24
	orcc	%o2,	%g6,	%g2
	fmovs	%f11,	%f11
	lduh	[%l7 + 0x24],	%o1
	subccc	%o7,	%i5,	%i0
	sdivx	%g3,	0x1F84,	%l1
	stb	%l5,	[%l7 + 0x5C]
	fzeros	%f23
	array8	%l3,	%l2,	%o6
	fmovdl	%xcc,	%f24,	%f8
	fmuld8ulx16	%f25,	%f24,	%f20
	sdiv	%g4,	0x1A8B,	%g7
	andncc	%l4,	%g5,	%g1
	movn	%icc,	%o3,	%l0
	sdivcc	%i6,	0x05B3,	%i3
	movne	%xcc,	%i2,	%o0
	fmovdvs	%icc,	%f31,	%f18
	andncc	%l6,	%o5,	%o4
	sdivcc	%i1,	0x05BC,	%i7
	subcc	%o2,	0x0604,	%i4
	movne	%xcc,	%g2,	%g6
	edge16l	%o1,	%o7,	%i5
	movgu	%xcc,	%g3,	%l1
	udivcc	%i0,	0x1529,	%l3
	ld	[%l7 + 0x48],	%f5
	fnot2s	%f22,	%f7
	array16	%l2,	%o6,	%l5
	andn	%g4,	%l4,	%g5
	movvs	%xcc,	%g7,	%o3
	movcc	%xcc,	%g1,	%i6
	movrlez	%l0,	0x2B0,	%i3
	array16	%o0,	%i2,	%l6
	xnorcc	%o5,	%i1,	%o4
	restore %i7, 0x1BAB, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f19,	%f25
	sra	%i4,	0x08,	%g2
	sir	0x027F
	sra	%o1,	0x00,	%g6
	umulcc	%o7,	%g3,	%l1
	edge16l	%i5,	%l3,	%l2
	fmovdl	%icc,	%f10,	%f0
	udiv	%o6,	0x1C93,	%i0
	andncc	%l5,	%g4,	%g5
	fcmps	%fcc2,	%f29,	%f22
	movleu	%xcc,	%g7,	%l4
	std	%f12,	[%l7 + 0x28]
	fexpand	%f8,	%f8
	addc	%o3,	%g1,	%l0
	st	%f5,	[%l7 + 0x28]
	edge32	%i3,	%o0,	%i6
	addc	%l6,	%i2,	%o5
	save %o4, 0x136F, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%o2,	%f15,	%f10
	alignaddrl	%i4,	%g2,	%i1
	movne	%icc,	%o1,	%g6
	alignaddr	%g3,	%o7,	%l1
	array16	%l3,	%i5,	%o6
	fmovscc	%xcc,	%f18,	%f23
	edge16n	%l2,	%i0,	%g4
	stw	%g5,	[%l7 + 0x68]
	ldsb	[%l7 + 0x32],	%l5
	edge32l	%l4,	%o3,	%g7
	mulscc	%g1,	0x08D0,	%i3
	sdivx	%l0,	0x1F50,	%o0
	movrgez	%l6,	%i2,	%i6
	sdiv	%o5,	0x01C9,	%i7
	array16	%o4,	%o2,	%i4
	movleu	%xcc,	%g2,	%o1
	ld	[%l7 + 0x38],	%f12
	fzero	%f2
	sll	%i1,	0x18,	%g6
	sethi	0x1BFB,	%g3
	fmuld8ulx16	%f5,	%f7,	%f18
	andn	%o7,	0x05B1,	%l3
	edge32ln	%i5,	%o6,	%l2
	subcc	%l1,	0x0F96,	%i0
	movle	%icc,	%g4,	%l5
	addc	%g5,	0x12B6,	%o3
	ldx	[%l7 + 0x50],	%g7
	movrne	%l4,	%i3,	%l0
	fcmpgt16	%f16,	%f22,	%o0
	udiv	%l6,	0x1D9E,	%i2
	fcmped	%fcc0,	%f6,	%f4
	fmovrdlez	%g1,	%f22,	%f4
	or	%o5,	0x0C9D,	%i7
	andncc	%o4,	%i6,	%o2
	array32	%g2,	%i4,	%o1
	sll	%g6,	%i1,	%g3
	movcs	%icc,	%o7,	%l3
	movrne	%o6,	0x3D0,	%i5
	movl	%icc,	%l1,	%i0
	nop
	set	0x17, %o2
	stb	%l2,	[%l7 + %o2]
	movleu	%xcc,	%g4,	%l5
	fpsub32	%f2,	%f22,	%f16
	movcs	%icc,	%o3,	%g7
	ld	[%l7 + 0x60],	%f5
	sllx	%l4,	0x0B,	%g5
	movne	%xcc,	%l0,	%o0
	movvc	%xcc,	%i3,	%i2
	alignaddrl	%l6,	%g1,	%i7
	stw	%o5,	[%l7 + 0x38]
	fpadd16	%f12,	%f10,	%f20
	stx	%o4,	[%l7 + 0x58]
	fmovdl	%xcc,	%f13,	%f3
	xnor	%o2,	0x196F,	%i6
	movvs	%xcc,	%i4,	%o1
	movvc	%icc,	%g6,	%g2
	movneg	%icc,	%i1,	%g3
	fmovdneg	%icc,	%f12,	%f12
	umul	%o7,	0x1399,	%o6
	fmuld8sux16	%f6,	%f6,	%f26
	sth	%i5,	[%l7 + 0x12]
	add	%l1,	0x05BA,	%i0
	fmovdle	%icc,	%f12,	%f25
	movl	%xcc,	%l3,	%l2
	smul	%l5,	%o3,	%g4
	xorcc	%l4,	0x020D,	%g5
	udiv	%l0,	0x16D1,	%o0
	sllx	%i3,	%g7,	%l6
	ldsh	[%l7 + 0x7E],	%i2
	udivcc	%i7,	0x0F89,	%o5
	edge32l	%o4,	%o2,	%i6
	subc	%i4,	%o1,	%g6
	edge16l	%g1,	%i1,	%g3
	movle	%icc,	%g2,	%o6
	udivcc	%i5,	0x0B6D,	%l1
	fnot2s	%f21,	%f17
	fmovdcc	%icc,	%f21,	%f8
	fnors	%f21,	%f13,	%f23
	fmovdge	%xcc,	%f7,	%f6
	srl	%i0,	%o7,	%l2
	xorcc	%l3,	0x14EC,	%l5
	mulx	%o3,	0x1859,	%g4
	movge	%icc,	%l4,	%g5
	popc	0x02F9,	%l0
	edge8l	%i3,	%g7,	%l6
	or	%o0,	%i2,	%i7
	xnorcc	%o4,	0x1A76,	%o2
	lduw	[%l7 + 0x24],	%i6
	movrgez	%o5,	0x0EC,	%o1
	fmovsleu	%icc,	%f1,	%f17
	fpadd32	%f8,	%f26,	%f4
	ldsw	[%l7 + 0x60],	%i4
	ldsh	[%l7 + 0x74],	%g6
	movge	%icc,	%g1,	%i1
	lduh	[%l7 + 0x46],	%g2
	edge32n	%o6,	%i5,	%g3
	edge16n	%l1,	%i0,	%o7
	nop
	set	0x60, %o4
	ldd	[%l7 + %o4],	%l2
	mulx	%l3,	%o3,	%l5
	edge16ln	%g4,	%l4,	%l0
	bshuffle	%f10,	%f20,	%f2
	fmovdpos	%icc,	%f15,	%f1
	fmovsge	%xcc,	%f24,	%f28
	fmul8x16al	%f0,	%f18,	%f6
	movcc	%icc,	%g5,	%g7
	ld	[%l7 + 0x78],	%f30
	edge8ln	%i3,	%o0,	%l6
	fmuld8sux16	%f15,	%f3,	%f16
	sdivx	%i2,	0x03D2,	%i7
	fmovdvs	%icc,	%f30,	%f23
	and	%o4,	0x082D,	%i6
	fpsub16s	%f10,	%f8,	%f27
	movgu	%icc,	%o2,	%o5
	fpack32	%f10,	%f12,	%f22
	mulscc	%i4,	0x1EBA,	%g6
	sll	%g1,	%o1,	%g2
	subccc	%i1,	%o6,	%g3
	udiv	%l1,	0x0014,	%i0
	ldsh	[%l7 + 0x56],	%i5
	movrgez	%l2,	0x026,	%o7
	fcmple32	%f12,	%f26,	%o3
	fmovdcc	%xcc,	%f22,	%f10
	edge8ln	%l5,	%g4,	%l3
	movrgz	%l4,	0x13D,	%l0
	orncc	%g7,	%g5,	%i3
	array8	%o0,	%l6,	%i2
	fmovsneg	%icc,	%f28,	%f22
	fmovrdne	%i7,	%f22,	%f4
	mulscc	%o4,	%o2,	%o5
	orcc	%i4,	%g6,	%i6
	andcc	%g1,	%o1,	%i1
	movl	%xcc,	%o6,	%g3
	umulcc	%l1,	%g2,	%i0
	srl	%i5,	0x1B,	%l2
	array32	%o3,	%o7,	%l5
	lduw	[%l7 + 0x5C],	%l3
	ld	[%l7 + 0x2C],	%f9
	fnegd	%f16,	%f4
	edge8	%g4,	%l4,	%l0
	edge32l	%g5,	%g7,	%i3
	ldsh	[%l7 + 0x66],	%o0
	movcc	%xcc,	%l6,	%i7
	srax	%i2,	0x07,	%o2
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	movrlz	%g6,	0x20D,	%g1
	stb	%i6,	[%l7 + 0x29]
	movgu	%xcc,	%i1,	%o1
	fmovrdlz	%o6,	%f26,	%f4
	fxor	%f20,	%f0,	%f4
	mulscc	%l1,	%g3,	%i0
	movrlz	%g2,	0x0B3,	%l2
	ldd	[%l7 + 0x38],	%i4
	std	%f14,	[%l7 + 0x40]
	edge8	%o3,	%l5,	%l3
	fnands	%f27,	%f16,	%f23
	fpadd16	%f16,	%f20,	%f18
	mulscc	%g4,	0x008D,	%l4
	array8	%o7,	%g5,	%g7
	movre	%i3,	%o0,	%l6
	udiv	%l0,	0x05C9,	%i7
	fmovdneg	%icc,	%f28,	%f26
	edge8	%i2,	%o4,	%o5
	edge32n	%i4,	%g6,	%g1
	xnorcc	%i6,	%i1,	%o1
	xnor	%o2,	%l1,	%g3
	fmovrdgez	%i0,	%f16,	%f30
	orncc	%g2,	%l2,	%o6
	movvs	%xcc,	%i5,	%o3
	save %l3, 0x1EE7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f24,	%f18,	%l5
	fpmerge	%f11,	%f17,	%f18
	movvc	%xcc,	%o7,	%l4
	edge8	%g7,	%i3,	%g5
	addcc	%o0,	%l0,	%i7
	edge32n	%l6,	%o4,	%i2
	lduh	[%l7 + 0x16],	%i4
	fmovs	%f2,	%f2
	sir	0x0C7E
	fnot2s	%f25,	%f5
	movcc	%xcc,	%g6,	%g1
	movge	%xcc,	%i6,	%o5
	movl	%xcc,	%o1,	%i1
	srax	%o2,	0x07,	%l1
	alignaddrl	%i0,	%g2,	%g3
	sdivx	%l2,	0x0676,	%o6
	fmovse	%xcc,	%f20,	%f18
	popc	%i5,	%l3
	andn	%o3,	%l5,	%o7
	popc	0x0563,	%l4
	fmovd	%f16,	%f30
	movgu	%xcc,	%g4,	%g7
	movvs	%xcc,	%i3,	%g5
	ldub	[%l7 + 0x72],	%o0
	srax	%i7,	%l0,	%l6
	andn	%i2,	0x17DC,	%i4
	movrgz	%o4,	0x195,	%g1
	movge	%xcc,	%i6,	%g6
	umul	%o1,	0x0FFC,	%i1
	fmovsvc	%icc,	%f27,	%f12
	mova	%xcc,	%o5,	%o2
	st	%f20,	[%l7 + 0x60]
	fones	%f26
	fmovrdlz	%i0,	%f24,	%f12
	add	%l1,	%g3,	%l2
	movne	%icc,	%g2,	%i5
	orcc	%l3,	%o3,	%o6
	movleu	%xcc,	%l5,	%l4
	sub	%o7,	%g7,	%i3
	fnegs	%f20,	%f4
	subcc	%g4,	%o0,	%g5
	movpos	%icc,	%i7,	%l6
	edge16ln	%i2,	%i4,	%o4
	ldsh	[%l7 + 0x18],	%g1
	movrlez	%i6,	0x225,	%g6
	fcmps	%fcc1,	%f24,	%f31
	or	%o1,	0x1D3D,	%i1
	fexpand	%f31,	%f0
	fmovsle	%icc,	%f20,	%f1
	edge32l	%l0,	%o2,	%o5
	subccc	%i0,	%g3,	%l1
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f10
	or	%g2,	%i5,	%l3
	smulcc	%l2,	0x1F03,	%o6
	udivx	%l5,	0x0A93,	%o3
	sllx	%o7,	%g7,	%i3
	array32	%l4,	%o0,	%g5
	mova	%icc,	%g4,	%i7
	movge	%xcc,	%i2,	%i4
	movvc	%icc,	%o4,	%g1
	fmovdne	%xcc,	%f7,	%f14
	fmovsvc	%xcc,	%f9,	%f1
	movrgez	%i6,	%l6,	%g6
	mulx	%i1,	0x01CE,	%l0
	std	%f26,	[%l7 + 0x58]
	fmovse	%icc,	%f19,	%f27
	movrlz	%o1,	%o5,	%i0
	ldsh	[%l7 + 0x78],	%g3
	edge8ln	%l1,	%g2,	%o2
	ldsw	[%l7 + 0x0C],	%i5
	ldub	[%l7 + 0x75],	%l3
	nop
	set	0x74, %g5
	stw	%l2,	[%l7 + %g5]
	add	%l5,	0x0938,	%o3
	movcc	%xcc,	%o7,	%g7
	fexpand	%f1,	%f16
	smul	%i3,	0x104E,	%l4
	popc	0x1669,	%o6
	orn	%o0,	0x1CEB,	%g5
	andcc	%i7,	0x18CF,	%i2
	smul	%g4,	%i4,	%g1
	fmovsvc	%icc,	%f2,	%f15
	movle	%icc,	%o4,	%i6
	orncc	%g6,	0x10EA,	%i1
	mulx	%l6,	0x0447,	%l0
	fandnot2s	%f26,	%f20,	%f22
	xor	%o5,	0x13A3,	%o1
	ldsw	[%l7 + 0x54],	%g3
	xnor	%i0,	%l1,	%g2
	udiv	%o2,	0x004D,	%l3
	fsrc1s	%f18,	%f28
	edge16	%l2,	%l5,	%o3
	movvc	%xcc,	%i5,	%o7
	ldsw	[%l7 + 0x5C],	%g7
	movrne	%l4,	%i3,	%o0
	fmuld8ulx16	%f9,	%f9,	%f16
	sll	%g5,	%i7,	%i2
	sllx	%g4,	0x1E,	%o6
	umul	%i4,	0x0847,	%g1
	fandnot2s	%f25,	%f20,	%f31
	movrgez	%o4,	%g6,	%i6
	fpadd32	%f20,	%f18,	%f22
	movgu	%xcc,	%l6,	%l0
	fcmpgt32	%f28,	%f8,	%o5
	edge8ln	%o1,	%g3,	%i1
	fxor	%f10,	%f0,	%f6
	movrgez	%l1,	%i0,	%o2
	fmovsleu	%xcc,	%f7,	%f10
	sra	%g2,	%l3,	%l5
	ldx	[%l7 + 0x10],	%l2
	sethi	0x1202,	%i5
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%o3
	movvs	%icc,	%g7,	%o7
	fmul8x16au	%f12,	%f0,	%f28
	fnot1s	%f28,	%f2
	fmul8sux16	%f20,	%f14,	%f6
	lduw	[%l7 + 0x58],	%i3
	udivcc	%l4,	0x02C8,	%o0
	movre	%g5,	0x337,	%i7
	move	%icc,	%i2,	%o6
	movgu	%xcc,	%i4,	%g4
	fmovrsgz	%o4,	%f21,	%f28
	fmovs	%f31,	%f7
	edge16n	%g1,	%i6,	%g6
	edge32n	%l6,	%o5,	%l0
	ldd	[%l7 + 0x70],	%o0
	srlx	%i1,	0x01,	%g3
	movre	%i0,	0x091,	%l1
	array8	%o2,	%l3,	%g2
	fmovsge	%xcc,	%f1,	%f30
	fandnot1	%f2,	%f2,	%f18
	mova	%icc,	%l2,	%i5
	fandnot1s	%f27,	%f5,	%f31
	ldx	[%l7 + 0x50],	%o3
	umulcc	%g7,	0x1104,	%o7
	stb	%i3,	[%l7 + 0x0E]
	save %l5, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	0x1C3,	%g5
	fmuld8sux16	%f14,	%f28,	%f12
	movrlez	%o6,	%i2,	%i4
	srax	%g4,	%g1,	%i6
	fmovrslez	%g6,	%f30,	%f4
	stx	%l6,	[%l7 + 0x68]
	movne	%icc,	%o5,	%o4
	xor	%o1,	%l0,	%i1
	andn	%g3,	%i0,	%o2
	fmovsvs	%icc,	%f5,	%f15
	ldx	[%l7 + 0x48],	%l1
	stb	%g2,	[%l7 + 0x41]
	udiv	%l2,	0x0CE9,	%i5
	edge8l	%o3,	%g7,	%o7
	fmovdneg	%icc,	%f18,	%f13
	std	%f0,	[%l7 + 0x18]
	movneg	%xcc,	%l3,	%i3
	fornot1s	%f8,	%f20,	%f10
	alignaddr	%l5,	%l4,	%i7
	edge16	%o0,	%o6,	%g5
	array8	%i4,	%i2,	%g1
	andn	%i6,	%g6,	%g4
	movrne	%o5,	%l6,	%o4
	fpadd16	%f28,	%f30,	%f20
	popc	%o1,	%i1
	xnorcc	%l0,	%g3,	%o2
	fcmpes	%fcc3,	%f22,	%f15
	fmovrdlz	%l1,	%f30,	%f18
	orcc	%i0,	%l2,	%i5
	udiv	%g2,	0x1FC2,	%g7
	ldx	[%l7 + 0x40],	%o3
	fmul8sux16	%f28,	%f24,	%f24
	srlx	%l3,	%i3,	%l5
	fnot1	%f6,	%f28
	fmovrdne	%o7,	%f20,	%f30
	umulcc	%i7,	%o0,	%o6
	fmovsleu	%icc,	%f17,	%f18
	edge16	%l4,	%i4,	%i2
	sth	%g5,	[%l7 + 0x52]
	edge16l	%g1,	%g6,	%i6
	edge16	%g4,	%o5,	%l6
	movcc	%xcc,	%o1,	%o4
	srax	%i1,	0x06,	%g3
	subc	%l0,	0x0807,	%o2
	fmovsl	%xcc,	%f4,	%f6
	andn	%l1,	%i0,	%i5
	array8	%l2,	%g2,	%o3
	lduh	[%l7 + 0x66],	%l3
	fpadd32s	%f21,	%f10,	%f3
	fcmpeq16	%f10,	%f8,	%i3
	st	%f25,	[%l7 + 0x48]
	st	%f30,	[%l7 + 0x08]
	fornot1	%f14,	%f4,	%f20
	orncc	%l5,	0x1E5E,	%g7
	udivx	%o7,	0x0D76,	%o0
	movrlz	%i7,	0x33F,	%o6
	srl	%l4,	0x1E,	%i4
	fones	%f27
	sub	%i2,	0x1026,	%g5
	fandnot1	%f28,	%f4,	%f20
	fpackfix	%f10,	%f21
	fmovsg	%icc,	%f27,	%f4
	fexpand	%f5,	%f8
	ldsh	[%l7 + 0x52],	%g1
	edge16	%i6,	%g4,	%g6
	addcc	%o5,	%o1,	%o4
	nop
	set	0x10, %i6
	ldsw	[%l7 + %i6],	%l6
	movre	%g3,	0x2B3,	%i1
	ldd	[%l7 + 0x08],	%o2
	srl	%l1,	0x0B,	%i0
	movvs	%icc,	%l0,	%i5
	movne	%xcc,	%l2,	%g2
	restore %l3, 0x152C, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l5,	0x0FE8,	%i3
	edge32l	%o7,	%g7,	%i7
	movrgez	%o0,	0x365,	%l4
	sllx	%i4,	%o6,	%g5
	fpadd32	%f6,	%f8,	%f6
	sethi	0x16DC,	%i2
	movgu	%xcc,	%i6,	%g1
	fmovrse	%g6,	%f29,	%f12
	fabsd	%f6,	%f4
	move	%xcc,	%g4,	%o1
	andncc	%o4,	%l6,	%o5
	ldx	[%l7 + 0x50],	%g3
	mulx	%o2,	%i1,	%l1
	movrlz	%l0,	%i0,	%l2
	movge	%xcc,	%g2,	%i5
	movge	%icc,	%o3,	%l3
	sll	%l5,	%i3,	%g7
	movneg	%icc,	%i7,	%o7
	edge16n	%o0,	%i4,	%l4
	sllx	%o6,	0x11,	%g5
	smul	%i2,	0x08A5,	%g1
	add	%i6,	0x10AA,	%g4
	edge8n	%g6,	%o4,	%l6
	ldd	[%l7 + 0x48],	%o0
	fmovspos	%icc,	%f22,	%f1
	xorcc	%g3,	%o2,	%i1
	movge	%icc,	%l1,	%l0
	ldsw	[%l7 + 0x34],	%i0
	fandnot1	%f22,	%f18,	%f2
	edge16	%o5,	%g2,	%l2
	sll	%i5,	0x06,	%l3
	edge16ln	%l5,	%o3,	%i3
	fone	%f2
	stw	%i7,	[%l7 + 0x50]
	lduw	[%l7 + 0x20],	%o7
	srax	%g7,	0x1C,	%o0
	sll	%i4,	0x1C,	%l4
	mulscc	%g5,	%i2,	%o6
	move	%icc,	%i6,	%g1
	movge	%xcc,	%g6,	%o4
	andn	%g4,	%o1,	%g3
	fcmpne32	%f0,	%f4,	%l6
	fones	%f22
	movl	%icc,	%i1,	%o2
	movcs	%xcc,	%l1,	%i0
	edge32l	%o5,	%l0,	%g2
	edge8n	%i5,	%l3,	%l2
	fxnor	%f2,	%f16,	%f30
	fsrc2	%f2,	%f8
	move	%icc,	%l5,	%o3
	fcmpgt32	%f8,	%f18,	%i3
	fnot1	%f14,	%f26
	fmovdleu	%xcc,	%f3,	%f14
	save %o7, 0x08EF, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f4,	%f16
	andcc	%o0,	0x0FA6,	%i4
	edge32l	%i7,	%g5,	%i2
	for	%f0,	%f20,	%f16
	fmovdleu	%xcc,	%f21,	%f20
	andcc	%o6,	%i6,	%g1
	array8	%g6,	%l4,	%g4
	movge	%xcc,	%o4,	%g3
	udivx	%l6,	0x1508,	%i1
	edge16n	%o2,	%o1,	%l1
	edge8ln	%o5,	%l0,	%g2
	fornot2	%f14,	%f12,	%f2
	sir	0x0F8C
	fnot2	%f24,	%f30
	edge8n	%i5,	%i0,	%l2
	smulcc	%l3,	0x195A,	%l5
	sir	0x0C18
	srlx	%o3,	%i3,	%o7
	xnorcc	%o0,	%g7,	%i4
	movneg	%xcc,	%g5,	%i2
	fpackfix	%f30,	%f29
	movl	%icc,	%o6,	%i7
	lduw	[%l7 + 0x68],	%i6
	umulcc	%g6,	0x0C66,	%g1
	bshuffle	%f18,	%f26,	%f28
	save %l4, 0x1D0E, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%g3,	%l6
	edge16	%i1,	%o2,	%o4
	ldsh	[%l7 + 0x70],	%o1
	array16	%l1,	%l0,	%g2
	alignaddrl	%o5,	%i0,	%i5
	sir	0x13D7
	xorcc	%l2,	%l5,	%l3
	fcmped	%fcc2,	%f12,	%f10
	orncc	%o3,	0x1A54,	%i3
	fmovdcc	%xcc,	%f8,	%f0
	xorcc	%o7,	0x051C,	%o0
	fpackfix	%f12,	%f4
	srax	%g7,	%i4,	%i2
	subcc	%g5,	0x0BD0,	%o6
	sdiv	%i6,	0x0399,	%i7
	addcc	%g6,	%g1,	%l4
	fzero	%f24
	popc	%g3,	%l6
	xorcc	%g4,	%i1,	%o4
	smul	%o1,	%l1,	%o2
	fands	%f15,	%f18,	%f0
	fmovs	%f30,	%f9
	array32	%l0,	%g2,	%i0
	fsrc2	%f6,	%f26
	srax	%i5,	%o5,	%l2
	fmovdvs	%xcc,	%f30,	%f30
	fmovdle	%icc,	%f8,	%f19
	edge8	%l5,	%l3,	%i3
	sdivcc	%o3,	0x1255,	%o7
	movpos	%xcc,	%g7,	%i4
	smulcc	%i2,	%o0,	%g5
	edge32n	%i6,	%i7,	%g6
	udivcc	%o6,	0x18D6,	%g1
	fmovdcc	%xcc,	%f23,	%f8
	sdivx	%g3,	0x08DC,	%l4
	subccc	%l6,	0x0BF6,	%i1
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	save %l1, 0x00B4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x01A8,	%l0
	addccc	%o2,	%i0,	%g2
	fsrc1	%f26,	%f12
	move	%xcc,	%o5,	%l2
	movle	%icc,	%l5,	%i5
	array32	%i3,	%o3,	%o7
	ldsw	[%l7 + 0x38],	%l3
	edge8l	%i4,	%g7,	%i2
	movcs	%icc,	%g5,	%o0
	ldsb	[%l7 + 0x1D],	%i7
	subcc	%i6,	%o6,	%g1
	restore %g3, 0x1648, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g6,	[%l7 + 0x20]
	movrne	%l6,	%i1,	%g4
	fmovsneg	%icc,	%f5,	%f17
	edge32n	%o1,	%o4,	%l0
	subc	%o2,	0x1E36,	%l1
	add	%i0,	0x0AB5,	%o5
	fcmpne16	%f10,	%f10,	%g2
	xnorcc	%l2,	%l5,	%i5
	srax	%o3,	0x1F,	%o7
	movleu	%icc,	%i3,	%i4
	fornot2s	%f4,	%f3,	%f27
	andncc	%g7,	%i2,	%g5
	movg	%icc,	%l3,	%i7
	lduw	[%l7 + 0x50],	%o0
	fmul8x16al	%f28,	%f20,	%f26
	fandnot1s	%f31,	%f7,	%f4
	stx	%i6,	[%l7 + 0x08]
	andn	%o6,	0x16A0,	%g1
	movge	%xcc,	%g3,	%g6
	or	%l6,	%i1,	%l4
	fcmpes	%fcc2,	%f20,	%f14
	edge16ln	%o1,	%o4,	%g4
	fxnors	%f0,	%f2,	%f2
	alignaddr	%o2,	%l0,	%i0
	edge32ln	%l1,	%g2,	%o5
	edge8l	%l2,	%l5,	%i5
	addc	%o3,	0x1064,	%i3
	orn	%o7,	0x0568,	%i4
	edge16n	%g7,	%g5,	%l3
	movrne	%i7,	%o0,	%i2
	subc	%o6,	%g1,	%i6
	xor	%g3,	%l6,	%i1
	udivcc	%g6,	0x0EA6,	%o1
	edge8ln	%l4,	%g4,	%o2
	edge32ln	%l0,	%i0,	%o4
	fmovda	%xcc,	%f16,	%f0
	fmul8x16	%f3,	%f28,	%f12
	ldd	[%l7 + 0x18],	%f0
	nop
	set	0x1A, %l2
	sth	%l1,	[%l7 + %l2]
	mulx	%g2,	%o5,	%l2
	mulx	%l5,	%o3,	%i5
	orcc	%o7,	0x1828,	%i4
	edge32l	%i3,	%g5,	%g7
	movge	%icc,	%l3,	%o0
	ldd	[%l7 + 0x68],	%i2
	xor	%o6,	%g1,	%i7
	ldsb	[%l7 + 0x19],	%g3
	fand	%f8,	%f22,	%f12
	array32	%i6,	%l6,	%i1
	addc	%o1,	0x0820,	%g6
	xnorcc	%g4,	%l4,	%o2
	edge8l	%i0,	%l0,	%l1
	movrlez	%o4,	%g2,	%l2
	fmovd	%f30,	%f26
	fpadd16s	%f0,	%f28,	%f7
	movcs	%xcc,	%o5,	%l5
	movvs	%xcc,	%i5,	%o3
	xnorcc	%i4,	%i3,	%g5
	edge16ln	%g7,	%o7,	%o0
	movvs	%xcc,	%i2,	%l3
	udivx	%o6,	0x0ECC,	%g1
	sth	%i7,	[%l7 + 0x1E]
	ld	[%l7 + 0x4C],	%f8
	movrlez	%g3,	%i6,	%l6
	alignaddrl	%i1,	%g6,	%g4
	edge8	%l4,	%o2,	%i0
	fandnot2s	%f20,	%f18,	%f4
	fornot1s	%f7,	%f11,	%f17
	andncc	%l0,	%l1,	%o4
	save %g2, %l2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l5,	%i5
	orncc	%o5,	0x0B37,	%o3
	edge8	%i4,	%i3,	%g7
	movrlez	%o7,	0x3DF,	%o0
	movleu	%icc,	%g5,	%i2
	ldsh	[%l7 + 0x6E],	%l3
	ldsb	[%l7 + 0x7E],	%o6
	movl	%xcc,	%g1,	%g3
	srax	%i7,	0x02,	%l6
	srax	%i6,	%g6,	%g4
	fmovrdlz	%i1,	%f26,	%f12
	movne	%xcc,	%l4,	%i0
	smulcc	%o2,	0x0B8C,	%l1
	fmovrdlz	%o4,	%f20,	%f12
	xnor	%l0,	0x1AD2,	%l2
	array8	%o1,	%l5,	%i5
	movcs	%icc,	%o5,	%g2
	stx	%i4,	[%l7 + 0x08]
	edge32n	%o3,	%g7,	%i3
	fmovdpos	%icc,	%f21,	%f7
	orcc	%o0,	0x198A,	%o7
	alignaddr	%g5,	%l3,	%i2
	fmovdle	%xcc,	%f20,	%f19
	sdivx	%o6,	0x109D,	%g1
	movvs	%icc,	%i7,	%l6
	sdivx	%g3,	0x1796,	%g6
	xnor	%i6,	%g4,	%i1
	fxor	%f12,	%f26,	%f30
	movvs	%xcc,	%l4,	%i0
	movge	%xcc,	%o2,	%o4
	movpos	%icc,	%l0,	%l2
	mova	%icc,	%o1,	%l1
	movcc	%icc,	%l5,	%o5
	and	%g2,	%i5,	%i4
	smulcc	%o3,	%i3,	%g7
	stb	%o0,	[%l7 + 0x4A]
	fnot1s	%f8,	%f27
	movre	%o7,	%g5,	%i2
	udivcc	%l3,	0x0FF0,	%o6
	fornot2	%f30,	%f4,	%f2
	add	%i7,	0x1A6E,	%g1
	save %l6, 0x0C93, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f12,	%f29
	array8	%g6,	%g4,	%i6
	fmovsvs	%icc,	%f21,	%f11
	fmuld8sux16	%f3,	%f20,	%f2
	or	%l4,	0x0142,	%i0
	edge16ln	%o2,	%o4,	%l0
	st	%f8,	[%l7 + 0x70]
	popc	%i1,	%o1
	move	%icc,	%l1,	%l2
	udiv	%l5,	0x0FAB,	%o5
	std	%f12,	[%l7 + 0x68]
	movre	%g2,	0x24D,	%i4
	fmovdvs	%icc,	%f22,	%f20
	sethi	0x0A98,	%i5
	edge8l	%o3,	%i3,	%g7
	movleu	%xcc,	%o0,	%o7
	edge32l	%i2,	%g5,	%o6
	fmovrdgez	%l3,	%f24,	%f2
	fpmerge	%f8,	%f29,	%f10
	movvs	%xcc,	%g1,	%i7
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	movl	%icc,	%g6,	%g4
	movrgz	%i6,	%i0,	%l4
	edge8	%o4,	%l0,	%i1
	edge32	%o2,	%l1,	%l2
	mulx	%l5,	%o5,	%o1
	edge32n	%i4,	%g2,	%i5
	sdivcc	%o3,	0x113C,	%i3
	andcc	%g7,	0x1A03,	%o7
	xnor	%i2,	%o0,	%g5
	movre	%l3,	0x2B4,	%g1
	sll	%i7,	0x04,	%o6
	umul	%g3,	0x0321,	%g6
	movgu	%icc,	%l6,	%i6
	orncc	%i0,	0x0615,	%g4
	edge8n	%o4,	%l0,	%i1
	movle	%xcc,	%l4,	%l1
	movre	%o2,	%l5,	%o5
	udivx	%l2,	0x1676,	%i4
	fmovdg	%xcc,	%f12,	%f7
	xnorcc	%o1,	%i5,	%o3
	movcc	%xcc,	%g2,	%i3
	sll	%o7,	0x09,	%g7
	edge32	%i2,	%o0,	%g5
	sll	%g1,	%l3,	%i7
	umulcc	%o6,	0x1009,	%g3
	for	%f20,	%f14,	%f10
	add	%g6,	0x1569,	%i6
	movvs	%xcc,	%l6,	%g4
	fmul8ulx16	%f10,	%f12,	%f0
	sdivx	%o4,	0x1F36,	%l0
	stx	%i1,	[%l7 + 0x50]
	addc	%l4,	%l1,	%o2
	sra	%l5,	0x00,	%i0
	edge32	%l2,	%i4,	%o5
	fmovdgu	%icc,	%f26,	%f8
	udivx	%i5,	0x0B68,	%o1
	andncc	%g2,	%o3,	%o7
	fmovsge	%icc,	%f1,	%f3
	sllx	%g7,	%i2,	%i3
	fmovrsgez	%o0,	%f5,	%f31
	srl	%g1,	0x04,	%g5
	movne	%icc,	%i7,	%o6
	alignaddr	%g3,	%g6,	%l3
	fcmpeq16	%f30,	%f28,	%i6
	sllx	%l6,	%o4,	%g4
	edge8ln	%i1,	%l4,	%l0
	array32	%o2,	%l5,	%l1
	addccc	%i0,	0x1C3F,	%l2
	movpos	%icc,	%i4,	%i5
	alignaddrl	%o1,	%g2,	%o3
	umul	%o7,	%o5,	%g7
	fmovsne	%xcc,	%f6,	%f0
	fxnor	%f8,	%f26,	%f24
	srl	%i3,	%i2,	%o0
	edge32n	%g5,	%i7,	%g1
	fand	%f10,	%f18,	%f28
	addc	%g3,	%o6,	%g6
	ld	[%l7 + 0x3C],	%f6
	restore %l3, %i6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f11,	%f12,	%f28
	movne	%icc,	%l6,	%i1
	movvs	%icc,	%l4,	%l0
	fandnot1s	%f1,	%f16,	%f23
	fmovda	%xcc,	%f17,	%f21
	fmovdge	%xcc,	%f14,	%f21
	ldx	[%l7 + 0x50],	%g4
	xnor	%o2,	%l1,	%l5
	fnors	%f0,	%f0,	%f19
	and	%i0,	0x1043,	%i4
	lduw	[%l7 + 0x30],	%i5
	sdivx	%l2,	0x118F,	%o1
	ldd	[%l7 + 0x08],	%f16
	edge8ln	%g2,	%o3,	%o5
	sllx	%g7,	%o7,	%i2
	umulcc	%i3,	0x1EC7,	%o0
	edge8ln	%g5,	%i7,	%g1
	nop
	set	0x70, %g3
	stx	%o6,	[%l7 + %g3]
	edge16	%g3,	%l3,	%g6
	add	%i6,	0x0438,	%o4
	movleu	%xcc,	%l6,	%l4
	stx	%l0,	[%l7 + 0x78]
	fmuld8sux16	%f8,	%f21,	%f24
	lduh	[%l7 + 0x14],	%g4
	fcmple32	%f18,	%f10,	%o2
	fsrc2	%f12,	%f30
	sethi	0x169F,	%i1
	edge32ln	%l1,	%l5,	%i4
	fpsub32	%f26,	%f0,	%f14
	edge16n	%i5,	%i0,	%l2
	movg	%xcc,	%o1,	%o3
	movrne	%g2,	0x0CD,	%g7
	move	%icc,	%o5,	%i2
	ld	[%l7 + 0x78],	%f12
	edge16n	%o7,	%i3,	%o0
	movn	%icc,	%i7,	%g1
	srl	%o6,	0x1A,	%g5
	fones	%f7
	edge16	%g3,	%g6,	%i6
	ldx	[%l7 + 0x30],	%o4
	fmovdn	%xcc,	%f26,	%f5
	ldsw	[%l7 + 0x1C],	%l3
	srax	%l4,	0x15,	%l6
	ldsw	[%l7 + 0x0C],	%l0
	movge	%icc,	%o2,	%g4
	fmuld8sux16	%f29,	%f25,	%f0
	fmovrdgez	%l1,	%f30,	%f0
	ldd	[%l7 + 0x78],	%i0
	orn	%i4,	%l5,	%i5
	orncc	%i0,	%o1,	%o3
	std	%f4,	[%l7 + 0x68]
	edge32l	%l2,	%g7,	%o5
	edge8ln	%i2,	%g2,	%o7
	xnor	%i3,	0x1038,	%i7
	movpos	%icc,	%o0,	%g1
	fmovrse	%o6,	%f10,	%f22
	umul	%g5,	0x132E,	%g6
	edge32l	%i6,	%g3,	%o4
	add	%l4,	0x06BB,	%l6
	fmovdge	%icc,	%f12,	%f26
	fzero	%f18
	udiv	%l0,	0x1248,	%l3
	ldd	[%l7 + 0x28],	%f24
	subccc	%g4,	0x1FF5,	%o2
	fmovdvs	%xcc,	%f22,	%f7
	std	%f0,	[%l7 + 0x48]
	xnorcc	%i1,	0x09AD,	%i4
	andncc	%l5,	%i5,	%l1
	udivcc	%i0,	0x0ED4,	%o1
	fpadd16	%f20,	%f2,	%f16
	movrgez	%o3,	0x02B,	%l2
	alignaddrl	%o5,	%i2,	%g2
	fones	%f19
	edge8n	%o7,	%g7,	%i7
	movgu	%xcc,	%i3,	%g1
	movre	%o0,	0x152,	%o6
	movneg	%xcc,	%g6,	%g5
	move	%icc,	%i6,	%g3
	alignaddrl	%o4,	%l6,	%l0
	movvs	%xcc,	%l3,	%l4
	movge	%xcc,	%o2,	%i1
	sth	%g4,	[%l7 + 0x54]
	fmovrdne	%l5,	%f22,	%f14
	fmovdcs	%xcc,	%f25,	%f25
	movge	%xcc,	%i5,	%i4
	stx	%i0,	[%l7 + 0x50]
	udivcc	%l1,	0x0A54,	%o1
	edge8n	%l2,	%o3,	%o5
	edge32n	%g2,	%i2,	%g7
	ld	[%l7 + 0x58],	%f30
	andcc	%i7,	%i3,	%g1
	andn	%o7,	0x1D7F,	%o0
	movneg	%xcc,	%o6,	%g5
	umulcc	%g6,	0x07B3,	%g3
	nop
	set	0x3C, %l1
	sth	%i6,	[%l7 + %l1]
	fcmple32	%f6,	%f16,	%o4
	edge16l	%l0,	%l6,	%l4
	xnor	%o2,	0x0564,	%l3
	ldsw	[%l7 + 0x38],	%g4
	movvc	%icc,	%i1,	%l5
	movre	%i5,	%i0,	%l1
	srax	%o1,	0x1F,	%i4
	ldsw	[%l7 + 0x20],	%l2
	fmovdcs	%icc,	%f16,	%f14
	move	%xcc,	%o3,	%g2
	fmovsl	%xcc,	%f30,	%f9
	movleu	%icc,	%i2,	%o5
	fmovdcs	%icc,	%f18,	%f26
	nop
	set	0x0D, %g4
	ldub	[%l7 + %g4],	%g7
	sth	%i7,	[%l7 + 0x5A]
	fmovsa	%icc,	%f18,	%f25
	nop
	set	0x1C, %i5
	ldsh	[%l7 + %i5],	%i3
	xnor	%o7,	%o0,	%o6
	edge16l	%g1,	%g6,	%g5
	movcc	%xcc,	%g3,	%i6
	stx	%l0,	[%l7 + 0x38]
	movl	%icc,	%o4,	%l4
	sdivcc	%o2,	0x0965,	%l3
	fnot1	%f20,	%f24
	movrgez	%l6,	0x254,	%i1
	edge16	%g4,	%l5,	%i0
	popc	0x06D8,	%i5
	orcc	%l1,	0x1426,	%o1
	fmovde	%xcc,	%f12,	%f20
	lduw	[%l7 + 0x7C],	%l2
	mulscc	%i4,	0x0807,	%g2
	fnot2	%f22,	%f30
	fmovrsgez	%o3,	%f7,	%f17
	st	%f6,	[%l7 + 0x3C]
	ldub	[%l7 + 0x56],	%i2
	andn	%o5,	%i7,	%i3
	sdivx	%g7,	0x1F8B,	%o7
	siam	0x7
	movpos	%xcc,	%o6,	%o0
	andn	%g1,	0x013F,	%g6
	movre	%g3,	0x350,	%g5
	std	%f14,	[%l7 + 0x50]
	mulscc	%i6,	%o4,	%l4
	addc	%l0,	0x0830,	%o2
	edge16n	%l6,	%i1,	%l3
	fmovrslz	%g4,	%f26,	%f1
	edge16l	%i0,	%i5,	%l1
	movneg	%icc,	%o1,	%l2
	move	%xcc,	%l5,	%i4
	fcmped	%fcc1,	%f30,	%f12
	fmul8sux16	%f26,	%f14,	%f18
	fandnot1s	%f15,	%f31,	%f19
	fmovsg	%icc,	%f3,	%f22
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	edge32ln	%o5,	%i7,	%i3
	edge32n	%g7,	%o7,	%o6
	addccc	%o3,	0x04AF,	%o0
	edge16n	%g6,	%g3,	%g5
	add	%i6,	%o4,	%l4
	array32	%l0,	%g1,	%o2
	sdiv	%i1,	0x0EB7,	%l6
	sdiv	%l3,	0x07B6,	%i0
	movrlz	%i5,	0x30D,	%g4
	sllx	%l1,	%o1,	%l2
	fnot1	%f20,	%f0
	alignaddrl	%i4,	%l5,	%g2
	movrgz	%o5,	0x20E,	%i2
	edge32ln	%i7,	%i3,	%o7
	lduw	[%l7 + 0x70],	%g7
	smul	%o6,	0x0F76,	%o0
	sir	0x0ADC
	fxnor	%f8,	%f6,	%f6
	fones	%f1
	movrgez	%o3,	0x152,	%g6
	movpos	%xcc,	%g3,	%g5
	fmovsg	%xcc,	%f5,	%f7
	movcc	%icc,	%o4,	%i6
	alignaddr	%l4,	%l0,	%g1
	mova	%icc,	%o2,	%l6
	movle	%xcc,	%l3,	%i0
	sub	%i1,	%g4,	%l1
	sllx	%o1,	%i5,	%i4
	sethi	0x1D00,	%l5
	array16	%l2,	%o5,	%g2
	edge8	%i7,	%i3,	%i2
	fmovse	%icc,	%f14,	%f29
	mulx	%o7,	0x140D,	%o6
	stx	%g7,	[%l7 + 0x08]
	edge32ln	%o3,	%o0,	%g3
	xnor	%g5,	%g6,	%i6
	fpackfix	%f30,	%f7
	movl	%xcc,	%o4,	%l0
	addccc	%l4,	0x0252,	%g1
	restore %o2, %l3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f6,	%f6,	%l6
	orn	%i1,	0x0319,	%l1
	smul	%g4,	%i5,	%o1
	movneg	%icc,	%i4,	%l5
	addccc	%o5,	%g2,	%i7
	edge16l	%l2,	%i2,	%o7
	fpadd32s	%f10,	%f0,	%f25
	movrgz	%o6,	0x055,	%i3
	ldd	[%l7 + 0x10],	%f0
	addccc	%g7,	0x0C59,	%o3
	ldd	[%l7 + 0x78],	%f28
	edge16	%o0,	%g3,	%g6
	fmovrslz	%i6,	%f20,	%f15
	andn	%o4,	%l0,	%l4
	udivcc	%g5,	0x0213,	%o2
	xorcc	%g1,	%l3,	%i0
	fmovspos	%icc,	%f13,	%f30
	udivx	%l6,	0x030A,	%i1
	fmovsle	%xcc,	%f16,	%f21
	add	%l1,	0x171E,	%g4
	movvs	%icc,	%o1,	%i5
	edge8ln	%l5,	%i4,	%o5
	edge16ln	%g2,	%l2,	%i2
	orcc	%i7,	%o6,	%o7
	smulcc	%i3,	0x0FC6,	%o3
	st	%f31,	[%l7 + 0x08]
	umul	%g7,	0x150E,	%o0
	movrne	%g3,	0x310,	%g6
	orncc	%o4,	0x0C67,	%i6
	movre	%l0,	%l4,	%o2
	add	%g1,	%l3,	%g5
	movre	%i0,	0x333,	%i1
	ldx	[%l7 + 0x38],	%l6
	sdiv	%l1,	0x13F4,	%o1
	sra	%g4,	0x1A,	%i5
	fsrc2	%f2,	%f28
	movne	%icc,	%l5,	%i4
	sdivx	%g2,	0x034B,	%o5
	addcc	%i2,	%l2,	%o6
	movl	%xcc,	%o7,	%i3
	stw	%i7,	[%l7 + 0x30]
	stx	%g7,	[%l7 + 0x28]
	movrne	%o0,	%g3,	%g6
	fmovsa	%xcc,	%f20,	%f28
	ldsh	[%l7 + 0x78],	%o4
	stx	%o3,	[%l7 + 0x78]
	smulcc	%l0,	0x0167,	%l4
	ldd	[%l7 + 0x50],	%f0
	nop
	set	0x78, %l0
	ldd	[%l7 + %l0],	%o2
	movleu	%xcc,	%g1,	%i6
	ldsb	[%l7 + 0x64],	%g5
	andn	%i0,	%l3,	%i1
	st	%f19,	[%l7 + 0x14]
	alignaddrl	%l1,	%o1,	%l6
	andncc	%g4,	%i5,	%i4
	fmovsleu	%xcc,	%f15,	%f8
	ldub	[%l7 + 0x3A],	%l5
	edge8ln	%g2,	%i2,	%l2
	fpsub32	%f8,	%f28,	%f4
	movge	%icc,	%o5,	%o7
	ldsw	[%l7 + 0x18],	%o6
	array8	%i3,	%i7,	%g7
	fands	%f29,	%f12,	%f2
	std	%f24,	[%l7 + 0x38]
	orcc	%g3,	%o0,	%g6
	edge32n	%o4,	%o3,	%l0
	array32	%o2,	%l4,	%i6
	edge16l	%g1,	%i0,	%g5
	fmuld8sux16	%f24,	%f27,	%f0
	addcc	%i1,	%l1,	%l3
	fpsub16s	%f1,	%f23,	%f6
	movge	%xcc,	%l6,	%g4
	srax	%i5,	%i4,	%l5
	ldd	[%l7 + 0x40],	%f28
	orn	%o1,	0x0503,	%i2
	fmovsn	%xcc,	%f29,	%f9
	addcc	%l2,	%g2,	%o5
	xorcc	%o6,	0x0FE6,	%i3
	andcc	%i7,	%g7,	%o7
	movl	%xcc,	%g3,	%g6
	fmovdle	%xcc,	%f9,	%f25
	lduh	[%l7 + 0x66],	%o4
	movpos	%icc,	%o0,	%o3
	fpack32	%f10,	%f2,	%f18
	edge16n	%l0,	%l4,	%i6
	sdiv	%g1,	0x1A22,	%i0
	movgu	%xcc,	%o2,	%i1
	fmovspos	%xcc,	%f19,	%f0
	srax	%l1,	0x19,	%g5
	fandnot1	%f18,	%f18,	%f8
	orcc	%l3,	%g4,	%i5
	st	%f14,	[%l7 + 0x38]
	umulcc	%l6,	0x0CF5,	%i4
	andcc	%o1,	%i2,	%l2
	edge8	%l5,	%g2,	%o6
	fmul8x16al	%f8,	%f4,	%f10
	fnor	%f22,	%f0,	%f0
	or	%i3,	0x0F00,	%o5
	movrgez	%g7,	%i7,	%g3
	xor	%g6,	%o7,	%o0
	array32	%o4,	%o3,	%l0
	edge32n	%l4,	%g1,	%i0
	sdivx	%i6,	0x0F3B,	%o2
	fpsub32s	%f15,	%f14,	%f0
	addc	%i1,	0x126C,	%l1
	sra	%l3,	0x05,	%g5
	stb	%i5,	[%l7 + 0x2F]
	stw	%g4,	[%l7 + 0x50]
	andncc	%i4,	%l6,	%i2
	xnor	%o1,	0x1CF2,	%l2
	movrgz	%l5,	0x2E2,	%g2
	fcmpeq32	%f10,	%f2,	%o6
	move	%icc,	%o5,	%i3
	lduw	[%l7 + 0x0C],	%g7
	sdivcc	%g3,	0x0C48,	%i7
	addccc	%o7,	0x0AB8,	%g6
	subccc	%o4,	%o0,	%o3
	addc	%l4,	0x032A,	%g1
	std	%f4,	[%l7 + 0x30]
	fcmpgt32	%f30,	%f26,	%i0
	ldd	[%l7 + 0x08],	%f18
	stx	%l0,	[%l7 + 0x50]
	movle	%icc,	%i6,	%o2
	andncc	%i1,	%l3,	%l1
	fpsub16	%f16,	%f0,	%f14
	fmul8ulx16	%f4,	%f16,	%f4
	umulcc	%g5,	%g4,	%i4
	fands	%f7,	%f4,	%f15
	subccc	%i5,	%i2,	%l6
	ldsw	[%l7 + 0x3C],	%l2
	fcmpeq32	%f4,	%f10,	%l5
	fexpand	%f31,	%f18
	addcc	%o1,	0x068B,	%o6
	fnot1	%f2,	%f0
	mulscc	%o5,	0x1D7F,	%g2
	edge32n	%i3,	%g3,	%i7
	for	%f14,	%f0,	%f18
	sdiv	%g7,	0x05C3,	%o7
	sth	%g6,	[%l7 + 0x7C]
	or	%o4,	0x02E5,	%o3
	ldub	[%l7 + 0x64],	%l4
	fornot2	%f26,	%f4,	%f14
	fpadd32s	%f31,	%f0,	%f5
	movcs	%xcc,	%o0,	%i0
	fcmpeq32	%f16,	%f12,	%g1
	movvs	%xcc,	%l0,	%i6
	fands	%f13,	%f11,	%f5
	fone	%f0
	movneg	%xcc,	%o2,	%i1
	addc	%l1,	%l3,	%g4
	udiv	%g5,	0x0120,	%i5
	fpsub16s	%f12,	%f9,	%f20
	sethi	0x0180,	%i2
	movne	%icc,	%i4,	%l2
	fnegs	%f11,	%f29
	fcmple32	%f20,	%f2,	%l6
	array32	%o1,	%o6,	%l5
	xnor	%o5,	0x17A9,	%g2
	ldsb	[%l7 + 0x23],	%g3
	st	%f0,	[%l7 + 0x24]
	edge16l	%i7,	%i3,	%g7
	stb	%o7,	[%l7 + 0x0F]
	pdist	%f12,	%f28,	%f18
	save %o4, %o3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o0,	%i0,	%g1
	sdivcc	%l0,	0x1CFE,	%i6
	udivx	%l4,	0x171D,	%i1
	fmovdge	%icc,	%f24,	%f10
	fmovscs	%xcc,	%f27,	%f18
	or	%o2,	0x07F7,	%l3
	addcc	%l1,	%g4,	%i5
	edge32n	%i2,	%g5,	%l2
	movge	%xcc,	%i4,	%l6
	edge32ln	%o1,	%l5,	%o6
	srl	%o5,	%g2,	%i7
	fcmpeq16	%f14,	%f28,	%g3
	edge16n	%i3,	%o7,	%o4
	stx	%g7,	[%l7 + 0x18]
	movrlez	%g6,	0x21C,	%o3
	edge8ln	%i0,	%o0,	%g1
	addc	%i6,	%l0,	%l4
	movle	%xcc,	%i1,	%l3
	ldsw	[%l7 + 0x44],	%o2
	movl	%xcc,	%g4,	%i5
	orcc	%l1,	0x1BF8,	%i2
	smul	%g5,	0x1727,	%i4
	orncc	%l6,	%l2,	%l5
	umul	%o1,	%o5,	%g2
	and	%o6,	%i7,	%i3
	subc	%o7,	%o4,	%g3
	popc	%g6,	%g7
	fmovsa	%icc,	%f11,	%f12
	lduh	[%l7 + 0x22],	%i0
	sir	0x1673
	edge16	%o0,	%o3,	%g1
	array32	%i6,	%l0,	%l4
	edge8n	%i1,	%l3,	%o2
	udiv	%g4,	0x16CF,	%l1
	movcc	%icc,	%i5,	%g5
	movrgz	%i4,	%i2,	%l2
	fpadd16s	%f12,	%f6,	%f16
	ld	[%l7 + 0x48],	%f8
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	movne	%icc,	%o5,	%o1
	stw	%g2,	[%l7 + 0x4C]
	stw	%o6,	[%l7 + 0x50]
	andn	%i7,	%i3,	%o7
	movrlez	%o4,	0x166,	%g3
	srax	%g6,	0x16,	%i0
	ldx	[%l7 + 0x78],	%o0
	movvs	%xcc,	%g7,	%g1
	ldx	[%l7 + 0x20],	%o3
	xnor	%i6,	%l0,	%l4
	edge8	%l3,	%o2,	%g4
	ldsh	[%l7 + 0x36],	%i1
	fnor	%f22,	%f14,	%f26
	movleu	%xcc,	%i5,	%g5
	edge8ln	%i4,	%l1,	%i2
	edge8ln	%l2,	%l5,	%o5
	sdivx	%o1,	0x14D1,	%g2
	lduw	[%l7 + 0x2C],	%o6
	subc	%l6,	%i3,	%o7
	movvs	%xcc,	%o4,	%i7
	edge16n	%g6,	%i0,	%o0
	edge16l	%g7,	%g3,	%g1
	movl	%xcc,	%i6,	%o3
	mulscc	%l4,	%l0,	%l3
	orncc	%o2,	0x12DE,	%i1
	fpadd32	%f18,	%f10,	%f0
	add	%i5,	%g5,	%i4
	sub	%g4,	0x1A0D,	%i2
	edge8n	%l2,	%l5,	%o5
	lduw	[%l7 + 0x34],	%o1
	srlx	%l1,	%o6,	%g2
	fabss	%f3,	%f3
	edge16n	%i3,	%l6,	%o4
	srax	%i7,	0x09,	%o7
	alignaddr	%i0,	%o0,	%g6
	sdivcc	%g3,	0x0704,	%g7
	fmovdge	%icc,	%f26,	%f22
	addcc	%i6,	0x0B2A,	%o3
	addccc	%g1,	0x0956,	%l0
	edge32l	%l4,	%o2,	%l3
	fcmpne32	%f8,	%f0,	%i5
	smulcc	%g5,	0x1C3E,	%i4
	ld	[%l7 + 0x34],	%f19
	subccc	%i1,	%i2,	%g4
	xor	%l2,	%l5,	%o1
	fmovde	%icc,	%f10,	%f5
	fandnot2s	%f17,	%f16,	%f10
	ldub	[%l7 + 0x20],	%o5
	sub	%o6,	0x1CF1,	%g2
	and	%i3,	0x180B,	%l1
	sdivx	%l6,	0x047C,	%i7
	stw	%o7,	[%l7 + 0x60]
	fmul8x16	%f17,	%f24,	%f16
	ldub	[%l7 + 0x58],	%i0
	fpsub32s	%f27,	%f8,	%f17
	movrgez	%o4,	0x287,	%g6
	ldd	[%l7 + 0x50],	%g2
	fmovdg	%icc,	%f12,	%f28
	fcmpne16	%f18,	%f30,	%g7
	movg	%icc,	%i6,	%o3
	srl	%g1,	%o0,	%l0
	ldsw	[%l7 + 0x68],	%l4
	movvs	%xcc,	%l3,	%o2
	fpsub32	%f18,	%f12,	%f6
	mulscc	%i5,	%i4,	%i1
	edge8ln	%g5,	%i2,	%l2
	ld	[%l7 + 0x4C],	%f15
	alignaddr	%g4,	%o1,	%l5
	xor	%o5,	%o6,	%i3
	sub	%l1,	0x036E,	%l6
	udivcc	%i7,	0x15A2,	%g2
	movcc	%icc,	%o7,	%i0
	fornot1	%f2,	%f6,	%f18
	subccc	%o4,	0x0ABF,	%g6
	stb	%g7,	[%l7 + 0x3C]
	fcmps	%fcc2,	%f13,	%f22
	fcmps	%fcc3,	%f12,	%f8
	or	%i6,	%g3,	%g1
	mova	%icc,	%o3,	%o0
	srlx	%l0,	0x06,	%l4
	fnand	%f16,	%f28,	%f24
	fcmpeq32	%f24,	%f10,	%o2
	subc	%l3,	0x1C9A,	%i4
	addcc	%i5,	%g5,	%i2
	srl	%i1,	0x12,	%g4
	umul	%o1,	0x0B2A,	%l5
	sth	%o5,	[%l7 + 0x54]
	lduh	[%l7 + 0x0E],	%l2
	movrgz	%o6,	%i3,	%l6
	fcmps	%fcc0,	%f14,	%f17
	movneg	%xcc,	%l1,	%g2
	ld	[%l7 + 0x28],	%f31
	movcs	%xcc,	%o7,	%i7
	array8	%o4,	%i0,	%g7
	edge32n	%i6,	%g3,	%g6
	sdiv	%o3,	0x0645,	%o0
	nop
	set	0x64, %o1
	stw	%g1,	[%l7 + %o1]
	xnorcc	%l4,	%l0,	%l3
	sdivcc	%i4,	0x1115,	%i5
	umulcc	%o2,	%g5,	%i2
	movge	%icc,	%g4,	%o1
	and	%i1,	%l5,	%o5
	and	%l2,	0x0B48,	%i3
	sub	%l6,	%o6,	%l1
	udivcc	%o7,	0x19B8,	%i7
	ldsh	[%l7 + 0x40],	%g2
	stx	%i0,	[%l7 + 0x58]
	addc	%o4,	0x0284,	%g7
	fcmps	%fcc2,	%f10,	%f22
	movcc	%xcc,	%g3,	%i6
	move	%xcc,	%g6,	%o0
	array32	%o3,	%g1,	%l0
	srl	%l3,	%i4,	%l4
	array8	%o2,	%i5,	%i2
	sllx	%g4,	0x0F,	%g5
	fornot2s	%f15,	%f27,	%f8
	movvc	%icc,	%o1,	%i1
	xnor	%l5,	%o5,	%l2
	movre	%i3,	%o6,	%l1
	xnorcc	%l6,	0x08AB,	%i7
	udiv	%o7,	0x0A73,	%i0
	fsrc2	%f14,	%f4
	fands	%f0,	%f31,	%f13
	fnot2s	%f21,	%f27
	save %g2, %o4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i6,	0x0DB4,	%g6
	movvc	%icc,	%o0,	%g3
	movl	%icc,	%o3,	%g1
	array16	%l0,	%i4,	%l4
	fmovspos	%xcc,	%f6,	%f0
	movgu	%xcc,	%o2,	%l3
	edge8n	%i5,	%i2,	%g5
	orn	%g4,	0x0D97,	%o1
	fmuld8ulx16	%f29,	%f7,	%f0
	ldsb	[%l7 + 0x5E],	%i1
	movrlez	%l5,	0x3AA,	%o5
	sllx	%l2,	%i3,	%l1
	sdivx	%o6,	0x1F1C,	%i7
	nop
	set	0x08, %l5
	ldsw	[%l7 + %l5],	%l6
	array32	%o7,	%i0,	%o4
	movrne	%g2,	%i6,	%g6
	fnands	%f0,	%f25,	%f2
	array32	%o0,	%g7,	%g3
	movle	%xcc,	%g1,	%o3
	umul	%l0,	0x0434,	%l4
	array32	%i4,	%l3,	%i5
	edge32	%o2,	%i2,	%g4
	xnor	%o1,	%g5,	%i1
	stb	%o5,	[%l7 + 0x6A]
	movn	%icc,	%l5,	%l2
	fmovdle	%xcc,	%f19,	%f22
	ldd	[%l7 + 0x10],	%i2
	sdiv	%l1,	0x09C7,	%o6
	sra	%i7,	%l6,	%o7
	mova	%xcc,	%i0,	%g2
	edge16l	%o4,	%i6,	%g6
	movvc	%xcc,	%o0,	%g3
	fcmpgt16	%f22,	%f28,	%g7
	stx	%g1,	[%l7 + 0x60]
	sra	%l0,	0x0D,	%l4
	smulcc	%i4,	%o3,	%i5
	movn	%xcc,	%o2,	%l3
	movrlez	%i2,	0x260,	%o1
	edge32l	%g5,	%i1,	%o5
	addc	%l5,	0x0740,	%g4
	udivx	%l2,	0x0BE9,	%l1
	movcs	%xcc,	%i3,	%i7
	array32	%o6,	%o7,	%l6
	stb	%i0,	[%l7 + 0x6C]
	stw	%g2,	[%l7 + 0x64]
	movge	%icc,	%o4,	%i6
	and	%g6,	%o0,	%g3
	smulcc	%g7,	0x10D2,	%l0
	fmovdle	%icc,	%f18,	%f29
	popc	0x1BE6,	%g1
	edge16n	%l4,	%o3,	%i5
	ldsb	[%l7 + 0x24],	%o2
	udivcc	%i4,	0x12C3,	%i2
	sll	%l3,	0x15,	%g5
	ldub	[%l7 + 0x58],	%i1
	subc	%o1,	%l5,	%o5
	udivx	%l2,	0x1479,	%l1
	sth	%i3,	[%l7 + 0x0C]
	popc	0x10B9,	%i7
	movrne	%o6,	0x1A7,	%o7
	ldub	[%l7 + 0x76],	%g4
	restore %l6, 0x070D, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f27,	%f28,	%f13
	subccc	%g2,	0x17B8,	%i6
	fsrc1	%f8,	%f4
	fabss	%f18,	%f25
	lduw	[%l7 + 0x2C],	%o4
	stx	%o0,	[%l7 + 0x30]
	fmovrse	%g6,	%f6,	%f19
	and	%g3,	0x14A0,	%g7
	movne	%icc,	%g1,	%l0
	ldsh	[%l7 + 0x5A],	%l4
	fmovsne	%icc,	%f26,	%f20
	edge32ln	%o3,	%i5,	%o2
	movrgz	%i4,	%i2,	%g5
	movne	%icc,	%l3,	%i1
	fmovdgu	%xcc,	%f10,	%f18
	movrne	%l5,	0x397,	%o1
	udivcc	%o5,	0x194F,	%l1
	smulcc	%l2,	0x1A16,	%i7
	fnot1	%f18,	%f0
	alignaddr	%o6,	%o7,	%i3
	movrlez	%g4,	%i0,	%g2
	xnor	%i6,	0x06A4,	%l6
	ldub	[%l7 + 0x1C],	%o0
	edge16n	%o4,	%g3,	%g6
	ldd	[%l7 + 0x10],	%f14
	movvc	%icc,	%g7,	%l0
	mova	%icc,	%g1,	%l4
	ldsh	[%l7 + 0x1E],	%i5
	edge8ln	%o3,	%i4,	%i2
	fzero	%f0
	fcmpgt16	%f4,	%f2,	%g5
	edge32ln	%o2,	%i1,	%l5
	fmovsl	%xcc,	%f13,	%f25
	sll	%o1,	%o5,	%l3
	edge8n	%l2,	%i7,	%o6
	fmovdgu	%xcc,	%f21,	%f18
	std	%f14,	[%l7 + 0x68]
	stb	%o7,	[%l7 + 0x4C]
	xorcc	%i3,	%g4,	%l1
	alignaddrl	%i0,	%i6,	%g2
	movrgez	%l6,	0x319,	%o4
	stx	%g3,	[%l7 + 0x08]
	for	%f4,	%f8,	%f10
	and	%o0,	%g7,	%l0
	lduw	[%l7 + 0x0C],	%g1
	subccc	%g6,	%l4,	%o3
	stw	%i4,	[%l7 + 0x78]
	fmovdpos	%icc,	%f7,	%f9
	sdivcc	%i5,	0x01A5,	%i2
	movpos	%xcc,	%g5,	%i1
	nop
	set	0x28, %i3
	stx	%o2,	[%l7 + %i3]
	fpsub32	%f0,	%f12,	%f6
	fmovda	%xcc,	%f10,	%f20
	subccc	%o1,	0x1671,	%o5
	udivx	%l3,	0x1377,	%l5
	edge8n	%i7,	%o6,	%o7
	fmovscs	%xcc,	%f25,	%f9
	array16	%l2,	%i3,	%l1
	movg	%xcc,	%g4,	%i6
	srl	%g2,	0x0B,	%l6
	fnot2	%f22,	%f0
	movpos	%icc,	%o4,	%i0
	fmovsleu	%icc,	%f24,	%f8
	ldsb	[%l7 + 0x26],	%g3
	ldsw	[%l7 + 0x70],	%g7
	fmovsleu	%xcc,	%f3,	%f29
	edge16n	%l0,	%g1,	%o0
	ldd	[%l7 + 0x48],	%l4
	edge32n	%g6,	%o3,	%i5
	edge32	%i2,	%i4,	%g5
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	fmovrdlz	%o1,	%f0,	%f24
	subc	%l3,	%o5,	%i7
	add	%o6,	0x0BD9,	%l5
	xor	%l2,	0x1BAE,	%o7
	array16	%i3,	%g4,	%l1
	ldd	[%l7 + 0x28],	%i6
	sllx	%g2,	0x10,	%l6
	popc	%i0,	%o4
	movrgz	%g3,	0x2D8,	%g7
	addc	%l0,	%g1,	%l4
	st	%f5,	[%l7 + 0x10]
	ldub	[%l7 + 0x60],	%g6
	movcc	%xcc,	%o0,	%o3
	edge16n	%i2,	%i4,	%g5
	udivx	%i5,	0x00E8,	%o2
	srlx	%o1,	0x01,	%i1
	edge32l	%l3,	%i7,	%o5
	mulx	%l5,	%o6,	%l2
	ldub	[%l7 + 0x08],	%i3
	fmovdcs	%xcc,	%f25,	%f11
	andn	%o7,	%g4,	%i6
	edge32ln	%g2,	%l1,	%i0
	edge16l	%l6,	%o4,	%g7
	fabsd	%f0,	%f18
	fcmps	%fcc0,	%f31,	%f30
	stb	%l0,	[%l7 + 0x29]
	movre	%g3,	%g1,	%l4
	movrgz	%o0,	0x155,	%g6
	xor	%o3,	0x114D,	%i2
	sra	%i4,	%g5,	%o2
	fmovrdlz	%o1,	%f24,	%f20
	fmovsn	%xcc,	%f1,	%f14
	movvs	%xcc,	%i5,	%i1
	movleu	%icc,	%i7,	%l3
	sth	%o5,	[%l7 + 0x22]
	sra	%o6,	0x10,	%l5
	alignaddrl	%i3,	%o7,	%l2
	subcc	%i6,	0x025A,	%g4
	movvc	%icc,	%g2,	%l1
	movgu	%xcc,	%i0,	%l6
	ldd	[%l7 + 0x70],	%f20
	fmovdl	%xcc,	%f15,	%f26
	andcc	%g7,	%l0,	%o4
	std	%f2,	[%l7 + 0x60]
	edge16l	%g3,	%l4,	%g1
	bshuffle	%f14,	%f0,	%f26
	fandnot2	%f2,	%f2,	%f12
	movcc	%xcc,	%o0,	%g6
	popc	%o3,	%i4
	fmovdge	%icc,	%f10,	%f3
	fnor	%f4,	%f28,	%f10
	fmovsgu	%xcc,	%f4,	%f4
	udivcc	%g5,	0x0F08,	%i2
	fmovdne	%icc,	%f6,	%f22
	srl	%o1,	%o2,	%i1
	fpadd16	%f4,	%f8,	%f4
	save %i5, 0x1126, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o5,	%i7
	movre	%o6,	%l5,	%i3
	fands	%f13,	%f16,	%f24
	smulcc	%l2,	%i6,	%o7
	xorcc	%g2,	%l1,	%i0
	edge16	%l6,	%g7,	%l0
	movrne	%o4,	0x307,	%g4
	srax	%g3,	0x1E,	%g1
	or	%l4,	%g6,	%o3
	movrgez	%i4,	0x140,	%o0
	st	%f13,	[%l7 + 0x70]
	fmovsneg	%icc,	%f13,	%f10
	fones	%f7
	movle	%icc,	%i2,	%g5
	fcmpeq16	%f2,	%f4,	%o1
	fmovsg	%icc,	%f23,	%f16
	sdivcc	%o2,	0x1AFD,	%i5
	ld	[%l7 + 0x4C],	%f12
	ldd	[%l7 + 0x28],	%l2
	umul	%o5,	%i1,	%o6
	sth	%l5,	[%l7 + 0x46]
	movvs	%icc,	%i3,	%l2
	array32	%i6,	%o7,	%i7
	movg	%xcc,	%l1,	%i0
	smul	%g2,	%l6,	%g7
	srax	%l0,	0x0A,	%g4
	restore %o4, %g1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g6,	0x1C,	%o3
	mulx	%g3,	%i4,	%i2
	xnorcc	%o0,	0x16DE,	%g5
	fmovrslz	%o1,	%f19,	%f14
	movleu	%xcc,	%o2,	%i5
	orcc	%l3,	0x083C,	%o5
	fxors	%f31,	%f12,	%f31
	fmovdneg	%xcc,	%f25,	%f5
	movrgez	%o6,	%i1,	%l5
	orcc	%l2,	%i3,	%i6
	fpsub16s	%f28,	%f13,	%f3
	edge16ln	%o7,	%i7,	%i0
	fcmpes	%fcc0,	%f13,	%f24
	fmovrsgz	%l1,	%f15,	%f31
	movpos	%icc,	%l6,	%g7
	mulx	%l0,	%g4,	%o4
	movrgz	%g2,	%l4,	%g1
	sdiv	%g6,	0x17A5,	%g3
	fmovdneg	%xcc,	%f29,	%f8
	srax	%o3,	0x1D,	%i2
	ldsw	[%l7 + 0x0C],	%o0
	movvc	%xcc,	%i4,	%g5
	edge16	%o2,	%i5,	%o1
	fnegs	%f14,	%f30
	andncc	%o5,	%o6,	%i1
	add	%l5,	0x1202,	%l3
	ldsw	[%l7 + 0x08],	%i3
	subcc	%l2,	0x10EC,	%o7
	movn	%xcc,	%i7,	%i0
	fnot1	%f30,	%f14
	ldd	[%l7 + 0x60],	%f24
	ldsw	[%l7 + 0x28],	%l1
	subc	%l6,	%i6,	%l0
	movrgez	%g4,	0x2B3,	%g7
	fcmpne16	%f16,	%f6,	%g2
	edge32n	%l4,	%g1,	%o4
	st	%f3,	[%l7 + 0x18]
	edge8	%g6,	%o3,	%i2
	subc	%o0,	%i4,	%g3
	mulscc	%g5,	0x09A2,	%i5
	edge8n	%o2,	%o1,	%o5
	srax	%i1,	%o6,	%l3
	or	%l5,	0x045D,	%l2
	fmovdvc	%icc,	%f18,	%f28
	fands	%f30,	%f27,	%f19
	array32	%o7,	%i7,	%i0
	fmovrde	%l1,	%f14,	%f2
	sdivcc	%i3,	0x0306,	%i6
	sdivcc	%l0,	0x01D4,	%l6
	addcc	%g4,	0x0CE7,	%g7
	sllx	%l4,	%g2,	%o4
	alignaddrl	%g1,	%o3,	%i2
	movrgz	%o0,	0x397,	%i4
	movg	%icc,	%g3,	%g5
	fmovdn	%xcc,	%f31,	%f6
	umulcc	%i5,	%g6,	%o1
	edge32	%o5,	%o2,	%o6
	xnorcc	%i1,	0x0EEF,	%l5
	subccc	%l3,	%o7,	%i7
	fmul8x16	%f0,	%f10,	%f26
	sdivx	%i0,	0x1877,	%l1
	and	%i3,	0x0200,	%i6
	subcc	%l0,	%l6,	%l2
	fcmpeq16	%f6,	%f24,	%g7
	movrgz	%l4,	%g2,	%g4
	edge8ln	%o4,	%g1,	%o3
	orn	%i2,	%i4,	%g3
	fmovsa	%xcc,	%f9,	%f25
	edge8	%g5,	%i5,	%g6
	ldx	[%l7 + 0x50],	%o1
	stw	%o0,	[%l7 + 0x3C]
	sll	%o5,	0x0E,	%o6
	fors	%f21,	%f4,	%f5
	mulx	%o2,	%l5,	%i1
	andncc	%o7,	%i7,	%i0
	stx	%l1,	[%l7 + 0x50]
	movg	%xcc,	%i3,	%l3
	movneg	%xcc,	%i6,	%l0
	sdiv	%l6,	0x0C77,	%g7
	fmovdg	%xcc,	%f11,	%f29
	std	%f28,	[%l7 + 0x38]
	edge32	%l4,	%l2,	%g2
	movrgez	%o4,	0x051,	%g1
	ldd	[%l7 + 0x70],	%g4
	edge16l	%o3,	%i2,	%i4
	srl	%g3,	%i5,	%g5
	lduw	[%l7 + 0x3C],	%o1
	or	%o0,	%o5,	%g6
	and	%o2,	0x0CAE,	%o6
	udivx	%i1,	0x1D0B,	%o7
	array16	%i7,	%i0,	%l5
	st	%f1,	[%l7 + 0x14]
	ldx	[%l7 + 0x48],	%i3
	edge8ln	%l3,	%i6,	%l0
	movvs	%xcc,	%l1,	%l6
	sethi	0x11CA,	%l4
	movre	%l2,	0x18A,	%g7
	edge8n	%o4,	%g1,	%g4
	fmovrdgz	%g2,	%f30,	%f16
	fpadd16s	%f6,	%f26,	%f27
	nop
	set	0x46, %l3
	sth	%o3,	[%l7 + %l3]
	fpack16	%f28,	%f12
	edge16l	%i4,	%g3,	%i2
	addcc	%g5,	0x0F71,	%i5
	orcc	%o0,	0x124A,	%o5
	sdiv	%g6,	0x1D08,	%o2
	lduw	[%l7 + 0x14],	%o6
	fmovdg	%xcc,	%f21,	%f30
	movgu	%xcc,	%o1,	%i1
	smul	%i7,	%o7,	%i0
	fmovrdlez	%i3,	%f0,	%f28
	save %l5, 0x1FCA, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%l1,	%l6
	array8	%l0,	%l4,	%g7
	edge16l	%l2,	%o4,	%g1
	movrlz	%g2,	0x079,	%o3
	ldx	[%l7 + 0x40],	%g4
	xor	%g3,	%i4,	%i2
	orn	%i5,	0x1F6F,	%o0
	movn	%xcc,	%o5,	%g5
	for	%f24,	%f18,	%f4
	movne	%xcc,	%o2,	%g6
	subcc	%o1,	%o6,	%i1
	xnorcc	%i7,	0x05D4,	%o7
	ldx	[%l7 + 0x40],	%i3
	fmovdge	%icc,	%f16,	%f20
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	ldsw	[%l7 + 0x08],	%i6
	alignaddrl	%l3,	%l6,	%l0
	edge16	%l4,	%g7,	%l1
	udivx	%o4,	0x18A3,	%g1
	ldub	[%l7 + 0x0A],	%l2
	fcmps	%fcc3,	%f6,	%f5
	fcmped	%fcc2,	%f20,	%f16
	array32	%o3,	%g2,	%g3
	edge32	%i4,	%g4,	%i5
	stb	%i2,	[%l7 + 0x67]
	fmovsl	%xcc,	%f22,	%f5
	edge32n	%o5,	%o0,	%o2
	edge32n	%g5,	%o1,	%o6
	movre	%g6,	%i1,	%i7
	movcs	%xcc,	%i3,	%i0
	edge32l	%o7,	%i6,	%l5
	fnot1s	%f16,	%f2
	sdiv	%l3,	0x0756,	%l6
	srlx	%l4,	%l0,	%l1
	udivx	%g7,	0x0D05,	%o4
	sll	%l2,	%o3,	%g1
	stw	%g2,	[%l7 + 0x08]
	fcmple32	%f6,	%f30,	%g3
	movleu	%icc,	%i4,	%i5
	sethi	0x05B1,	%i2
	fcmpes	%fcc0,	%f20,	%f31
	sll	%o5,	0x1D,	%o0
	alignaddr	%o2,	%g5,	%o1
	edge32n	%g4,	%o6,	%g6
	fones	%f8
	fmovsvc	%icc,	%f5,	%f26
	fmovdge	%xcc,	%f18,	%f29
	movne	%icc,	%i7,	%i1
	srax	%i3,	0x16,	%i0
	srl	%o7,	0x0E,	%i6
	fnors	%f25,	%f25,	%f17
	movne	%icc,	%l3,	%l6
	movrlez	%l4,	0x3A7,	%l0
	edge8n	%l1,	%l5,	%o4
	movle	%xcc,	%l2,	%o3
	fpadd16	%f26,	%f4,	%f22
	andcc	%g7,	0x0ACD,	%g1
	udivx	%g3,	0x04A7,	%i4
	srl	%i5,	0x10,	%g2
	movle	%xcc,	%i2,	%o5
	subc	%o0,	0x025F,	%g5
	movg	%icc,	%o1,	%o2
	sth	%g4,	[%l7 + 0x2E]
	movrne	%g6,	%o6,	%i1
	alignaddrl	%i3,	%i0,	%i7
	sub	%i6,	0x13F3,	%o7
	sll	%l6,	%l3,	%l0
	edge16l	%l1,	%l5,	%o4
	sdiv	%l4,	0x1AFE,	%l2
	xnorcc	%g7,	0x1A59,	%g1
	fabsd	%f22,	%f6
	fandnot1	%f14,	%f4,	%f4
	subc	%o3,	0x0B04,	%i4
	movre	%i5,	%g3,	%g2
	edge8l	%o5,	%i2,	%g5
	orn	%o0,	%o1,	%g4
	edge16n	%o2,	%o6,	%i1
	fnot1s	%f17,	%f17
	sdiv	%i3,	0x151E,	%g6
	lduh	[%l7 + 0x48],	%i0
	addccc	%i7,	0x1908,	%o7
	move	%icc,	%l6,	%l3
	fxors	%f16,	%f20,	%f6
	ldd	[%l7 + 0x78],	%l0
	sra	%l1,	%i6,	%l5
	fxnors	%f5,	%f27,	%f1
	edge8	%l4,	%l2,	%g7
	fcmpne32	%f14,	%f4,	%o4
	movrgz	%g1,	0x1EE,	%o3
	udivx	%i4,	0x021D,	%i5
	nop
	set	0x50, %g1
	ldd	[%l7 + %g1],	%g2
	edge16ln	%o5,	%g3,	%i2
	fmovdn	%xcc,	%f28,	%f16
	andncc	%o0,	%g5,	%o1
	sub	%o2,	0x000D,	%g4
	fmovrsgz	%o6,	%f25,	%f5
	ldsb	[%l7 + 0x2F],	%i1
	std	%f12,	[%l7 + 0x28]
	udivx	%g6,	0x0D6D,	%i0
	orn	%i3,	0x1B29,	%i7
	sdiv	%o7,	0x12AB,	%l3
	movgu	%xcc,	%l0,	%l6
	orn	%i6,	0x13FD,	%l1
	fmul8x16al	%f4,	%f14,	%f4
	fmovrdlez	%l4,	%f24,	%f2
	edge8n	%l5,	%g7,	%l2
	movvc	%xcc,	%o4,	%g1
	movn	%icc,	%o3,	%i4
	andcc	%g2,	%o5,	%i5
	fcmpgt16	%f14,	%f4,	%i2
	movrlez	%o0,	0x273,	%g5
	movrgz	%o1,	0x0F3,	%g3
	xor	%g4,	0x0552,	%o6
	lduh	[%l7 + 0x7A],	%i1
	movrgz	%o2,	0x1E5,	%i0
	movrlz	%g6,	%i7,	%i3
	smulcc	%l3,	0x14A7,	%o7
	nop
	set	0x68, %l6
	stx	%l0,	[%l7 + %l6]
	movrgez	%l6,	%l1,	%l4
	fmovdl	%xcc,	%f15,	%f2
	fmovde	%icc,	%f3,	%f3
	movn	%icc,	%l5,	%g7
	sethi	0x1C23,	%l2
	orcc	%i6,	%o4,	%o3
	sethi	0x111F,	%i4
	fcmpgt32	%f4,	%f4,	%g2
	sdivcc	%g1,	0x1B7F,	%i5
	edge16	%o5,	%i2,	%o0
	stx	%o1,	[%l7 + 0x40]
	xnorcc	%g3,	%g4,	%o6
	save %i1, 0x0B25, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i0,	%o2
	st	%f4,	[%l7 + 0x7C]
	mulx	%i7,	%g6,	%l3
	fmovdgu	%xcc,	%f2,	%f12
	popc	0x0992,	%o7
	or	%i3,	%l0,	%l1
	fpadd16s	%f14,	%f3,	%f24
	movle	%xcc,	%l4,	%l6
	umulcc	%g7,	0x1E53,	%l5
	alignaddr	%l2,	%o4,	%o3
	and	%i4,	0x01E2,	%i6
	ldsh	[%l7 + 0x76],	%g1
	edge8l	%g2,	%o5,	%i2
	andn	%i5,	%o1,	%g3
	ldd	[%l7 + 0x40],	%o0
	fcmpeq32	%f16,	%f22,	%g4
	edge8	%o6,	%i1,	%g5
	xnor	%i0,	%i7,	%g6
	array32	%o2,	%o7,	%i3
	orcc	%l3,	%l0,	%l4
	movre	%l6,	%g7,	%l1
	edge32	%l5,	%l2,	%o4
	udiv	%o3,	0x028F,	%i6
	edge32	%i4,	%g2,	%o5
	or	%i2,	%g1,	%i5
	fpadd32s	%f1,	%f29,	%f30
	mulscc	%g3,	0x0C0E,	%o1
	movge	%icc,	%g4,	%o0
	ldsh	[%l7 + 0x60],	%i1
	movneg	%icc,	%o6,	%i0
	andncc	%g5,	%i7,	%o2
	andcc	%o7,	%g6,	%i3
	sdivcc	%l0,	0x12F5,	%l3
	std	%f2,	[%l7 + 0x58]
	mova	%icc,	%l4,	%g7
	sra	%l1,	%l5,	%l6
	movne	%icc,	%o4,	%o3
	andcc	%l2,	%i4,	%i6
	smulcc	%g2,	0x1D5B,	%i2
	sethi	0x0263,	%g1
	array16	%o5,	%g3,	%o1
	udivx	%g4,	0x154C,	%o0
	movcc	%icc,	%i5,	%i1
	movrne	%o6,	%i0,	%g5
	fxnors	%f24,	%f29,	%f30
	edge16ln	%i7,	%o2,	%g6
	fmovd	%f8,	%f20
	movrne	%o7,	0x195,	%l0
	ldsw	[%l7 + 0x7C],	%l3
	sdivcc	%l4,	0x1B2E,	%i3
	array16	%l1,	%g7,	%l6
	or	%l5,	%o4,	%l2
	mulx	%i4,	0x1A64,	%i6
	edge16ln	%g2,	%i2,	%g1
	movrgz	%o3,	0x2D6,	%o5
	addcc	%o1,	%g4,	%o0
	movre	%g3,	%i1,	%o6
	movvc	%icc,	%i0,	%i5
	movl	%icc,	%i7,	%o2
	restore %g5, %o7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%l3,	%l4,	%l0
	orcc	%l1,	0x1FE1,	%i3
	lduh	[%l7 + 0x36],	%g7
	xorcc	%l6,	0x1E14,	%l5
	fmovdvs	%icc,	%f24,	%f21
	stb	%l2,	[%l7 + 0x6A]
	alignaddrl	%o4,	%i4,	%g2
	fandnot2s	%f16,	%f1,	%f16
	edge8	%i2,	%g1,	%i6
	st	%f24,	[%l7 + 0x60]
	edge8n	%o5,	%o1,	%g4
	nop
	set	0x38, %i4
	lduw	[%l7 + %i4],	%o3
	fmovdvs	%xcc,	%f12,	%f0
	alignaddr	%g3,	%o0,	%i1
	fmovdne	%xcc,	%f4,	%f7
	smulcc	%i0,	%o6,	%i7
	fmovsl	%xcc,	%f24,	%f12
	srax	%o2,	%g5,	%i5
	fmovdneg	%icc,	%f27,	%f19
	sdivx	%o7,	0x0A46,	%l3
	edge8ln	%g6,	%l0,	%l1
	movvs	%icc,	%l4,	%g7
	edge16ln	%l6,	%l5,	%l2
	fmovrslz	%o4,	%f6,	%f26
	orcc	%i4,	%i3,	%i2
	addccc	%g2,	0x04D9,	%i6
	sir	0x1326
	movrgez	%o5,	%o1,	%g1
	lduw	[%l7 + 0x5C],	%o3
	fmovsl	%icc,	%f7,	%f19
	sll	%g3,	%o0,	%g4
	fandnot1s	%f21,	%f18,	%f17
	subccc	%i1,	0x105C,	%i0
	smulcc	%i7,	0x0F35,	%o6
	fmovrsne	%g5,	%f2,	%f7
	sll	%i5,	0x14,	%o7
	sdiv	%l3,	0x0818,	%g6
	xnor	%l0,	%l1,	%l4
	fornot1	%f0,	%f14,	%f14
	ldub	[%l7 + 0x6D],	%g7
	addc	%o2,	0x0A84,	%l5
	nop
	set	0x1E, %l4
	lduh	[%l7 + %l4],	%l6
	add	%o4,	%l2,	%i3
	nop
	set	0x5C, %g7
	lduw	[%l7 + %g7],	%i4
	lduw	[%l7 + 0x14],	%g2
	array32	%i2,	%i6,	%o1
	edge16n	%o5,	%o3,	%g3
	orcc	%o0,	%g1,	%g4
	ldsb	[%l7 + 0x35],	%i0
	move	%icc,	%i1,	%o6
	fmovsgu	%icc,	%f17,	%f26
	movgu	%xcc,	%i7,	%i5
	srlx	%o7,	0x1B,	%l3
	sdivx	%g5,	0x1096,	%l0
	sir	0x14C1
	sllx	%l1,	%g6,	%l4
	andncc	%o2,	%l5,	%l6
	orcc	%o4,	0x0010,	%g7
	fabss	%f22,	%f27
	move	%icc,	%l2,	%i3
	fmovsleu	%icc,	%f31,	%f11
	alignaddr	%g2,	%i4,	%i6
	movcs	%icc,	%o1,	%o5
	movvs	%xcc,	%o3,	%g3
	nop
	set	0x5C, %i2
	lduh	[%l7 + %i2],	%o0
	edge16n	%i2,	%g4,	%g1
	alignaddrl	%i1,	%i0,	%i7
	sethi	0x101C,	%i5
	udiv	%o6,	0x19D8,	%o7
	movrlez	%g5,	0x39E,	%l0
	fcmpgt16	%f26,	%f6,	%l3
	subcc	%g6,	0x0A74,	%l1
	ldd	[%l7 + 0x20],	%f24
	subc	%l4,	%o2,	%l6
	movpos	%xcc,	%o4,	%g7
	xnor	%l5,	%l2,	%i3
	movrgz	%i4,	%g2,	%o1
	stb	%o5,	[%l7 + 0x67]
	ldd	[%l7 + 0x40],	%o2
	lduw	[%l7 + 0x1C],	%i6
	edge32l	%o0,	%i2,	%g3
	movne	%xcc,	%g4,	%g1
	xnorcc	%i1,	%i7,	%i0
	subcc	%i5,	%o6,	%g5
	and	%l0,	%l3,	%g6
	add	%l1,	0x184C,	%l4
	array32	%o2,	%l6,	%o4
	andncc	%g7,	%o7,	%l2
	movpos	%icc,	%i3,	%i4
	movrlz	%l5,	%o1,	%g2
	alignaddrl	%o5,	%o3,	%i6
	sdivcc	%o0,	0x1E8B,	%g3
	addcc	%i2,	0x1DA5,	%g1
	std	%f2,	[%l7 + 0x70]
	move	%xcc,	%g4,	%i7
	movcc	%icc,	%i0,	%i1
	subcc	%i5,	%g5,	%l0
	fmovdn	%xcc,	%f29,	%f2
	add	%o6,	%g6,	%l1
	edge16ln	%l3,	%o2,	%l6
	move	%xcc,	%l4,	%g7
	movn	%icc,	%o4,	%l2
	fmuld8ulx16	%f14,	%f24,	%f28
	andncc	%o7,	%i3,	%i4
	movge	%xcc,	%l5,	%o1
	edge16ln	%g2,	%o3,	%o5
	movcc	%icc,	%o0,	%i6
	fcmple32	%f18,	%f10,	%i2
	array8	%g1,	%g4,	%g3
	movle	%icc,	%i7,	%i0
	movvc	%icc,	%i5,	%i1
	fmovscc	%icc,	%f23,	%f7
	or	%g5,	%o6,	%l0
	ldd	[%l7 + 0x68],	%l0
	subcc	%g6,	%o2,	%l6
	movg	%icc,	%l3,	%g7
	movrgz	%o4,	%l2,	%o7
	subcc	%l4,	%i4,	%l5
	movvc	%xcc,	%o1,	%i3
	lduh	[%l7 + 0x0C],	%g2
	ld	[%l7 + 0x28],	%f15
	stw	%o5,	[%l7 + 0x40]
	edge8ln	%o3,	%i6,	%o0
	fcmpgt16	%f30,	%f28,	%i2
	move	%xcc,	%g1,	%g4
	movgu	%icc,	%i7,	%g3
	fmovdleu	%xcc,	%f19,	%f28
	addc	%i0,	0x1237,	%i1
	edge8ln	%i5,	%g5,	%o6
	sdivx	%l1,	0x1AC8,	%g6
	edge32n	%l0,	%l6,	%l3
	fmovdle	%icc,	%f21,	%f16
	edge16l	%g7,	%o4,	%l2
	stw	%o7,	[%l7 + 0x28]
	andcc	%o2,	%i4,	%l4
	sdivcc	%l5,	0x12B0,	%o1
	umul	%g2,	0x171C,	%o5
	movrgz	%o3,	0x3CF,	%i3
	lduw	[%l7 + 0x28],	%o0
	fmovsvc	%xcc,	%f12,	%f14
	smulcc	%i6,	0x01D6,	%i2
	movcs	%icc,	%g4,	%i7
	srl	%g3,	%i0,	%g1
	ldd	[%l7 + 0x60],	%f20
	fmovdg	%xcc,	%f27,	%f7
	movl	%icc,	%i1,	%g5
	or	%o6,	%l1,	%i5
	save %l0, 0x07E1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%g6,	%l3
	fpack32	%f14,	%f8,	%f4
	movrlz	%g7,	0x136,	%o4
	fxnor	%f26,	%f26,	%f16
	edge8ln	%l2,	%o7,	%o2
	movleu	%xcc,	%i4,	%l5
	edge16l	%l4,	%o1,	%o5
	edge32	%o3,	%g2,	%i3
	ldub	[%l7 + 0x5C],	%o0
	stb	%i2,	[%l7 + 0x25]
	or	%i6,	0x0866,	%g4
	alignaddr	%i7,	%i0,	%g1
	alignaddr	%g3,	%i1,	%o6
	subcc	%l1,	0x1857,	%i5
	fandnot1	%f20,	%f24,	%f30
	srl	%l0,	0x1F,	%g5
	fabsd	%f18,	%f26
	or	%l6,	%l3,	%g6
	movn	%icc,	%o4,	%l2
	sdivcc	%g7,	0x0970,	%o2
	srax	%o7,	0x15,	%l5
	stx	%i4,	[%l7 + 0x28]
	stb	%o1,	[%l7 + 0x65]
	fmovsl	%xcc,	%f4,	%f1
	nop
	set	0x60, %i0
	stx	%o5,	[%l7 + %i0]
	ldsb	[%l7 + 0x61],	%o3
	subcc	%g2,	%i3,	%l4
	fmovsvc	%icc,	%f21,	%f9
	edge8	%o0,	%i2,	%g4
	addcc	%i7,	0x1D16,	%i0
	movge	%xcc,	%g1,	%i6
	sdivcc	%g3,	0x0DD4,	%i1
	movn	%xcc,	%o6,	%i5
	movrlz	%l1,	0x298,	%l0
	edge32ln	%g5,	%l6,	%g6
	ldd	[%l7 + 0x78],	%f24
	udiv	%o4,	0x0E18,	%l2
	edge16n	%g7,	%l3,	%o2
	udivx	%o7,	0x1347,	%i4
	fnor	%f4,	%f2,	%f8
	movrne	%o1,	%o5,	%o3
	orcc	%g2,	0x1958,	%i3
	movrgez	%l4,	0x269,	%l5
	ldsh	[%l7 + 0x14],	%i2
	ld	[%l7 + 0x50],	%f24
	ldd	[%l7 + 0x28],	%f30
	fmovsg	%xcc,	%f2,	%f5
	addccc	%g4,	0x1D15,	%o0
	andncc	%i7,	%i0,	%g1
	nop
	set	0x18, %o0
	stx	%g3,	[%l7 + %o0]
	umul	%i1,	%i6,	%i5
	sdivx	%o6,	0x0C05,	%l1
	add	%g5,	%l0,	%l6
	addccc	%o4,	0x11B7,	%l2
	fmovrsgz	%g6,	%f22,	%f6
	nop
	set	0x77, %o7
	ldub	[%l7 + %o7],	%l3
	movn	%icc,	%o2,	%o7
	fmovrdlz	%g7,	%f24,	%f12
	andn	%i4,	0x05BE,	%o5
	mulscc	%o3,	0x0661,	%g2
	subc	%i3,	%o1,	%l5
	fone	%f18
	subcc	%l4,	%g4,	%i2
	movcs	%xcc,	%o0,	%i0
	lduw	[%l7 + 0x74],	%i7
	movcc	%icc,	%g3,	%g1
	movvc	%icc,	%i1,	%i6
	edge16l	%i5,	%l1,	%o6
	movpos	%icc,	%g5,	%l0
	movvs	%icc,	%o4,	%l6
	umul	%l2,	0x1255,	%g6
	mulx	%l3,	%o2,	%g7
	fxors	%f12,	%f21,	%f12
	lduw	[%l7 + 0x10],	%i4
	array32	%o7,	%o3,	%o5
	edge32n	%i3,	%o1,	%g2
	alignaddrl	%l4,	%l5,	%i2
	movge	%xcc,	%o0,	%g4
	orcc	%i7,	0x0AE5,	%g3
	lduh	[%l7 + 0x6C],	%i0
	fcmple16	%f26,	%f26,	%g1
	sethi	0x0653,	%i6
	movgu	%icc,	%i5,	%i1
	edge8ln	%o6,	%g5,	%l0
	movrne	%l1,	0x029,	%l6
	movpos	%xcc,	%o4,	%g6
	xorcc	%l3,	0x1C2C,	%o2
	for	%f20,	%f10,	%f22
	fmovdvs	%icc,	%f11,	%f28
	fmovdgu	%xcc,	%f1,	%f29
	movleu	%xcc,	%l2,	%g7
	fnands	%f3,	%f24,	%f2
	movge	%xcc,	%o7,	%o3
	movleu	%xcc,	%o5,	%i4
	move	%icc,	%o1,	%i3
	alignaddr	%l4,	%l5,	%i2
	fcmped	%fcc3,	%f18,	%f14
	fmul8x16au	%f21,	%f10,	%f24
	xnorcc	%o0,	%g4,	%i7
	subc	%g2,	0x12FA,	%i0
	ldsb	[%l7 + 0x55],	%g1
	fmovdvc	%icc,	%f28,	%f30
	edge32ln	%i6,	%i5,	%g3
	array32	%o6,	%g5,	%i1
	sth	%l0,	[%l7 + 0x6E]
	fcmple32	%f0,	%f6,	%l6
	fcmpne32	%f24,	%f0,	%o4
	fcmpeq32	%f16,	%f8,	%g6
	srl	%l3,	0x0E,	%l1
	movrne	%o2,	0x180,	%l2
	edge16n	%g7,	%o3,	%o7
	siam	0x1
	addc	%i4,	0x0C0D,	%o1
	movre	%o5,	%i3,	%l5
	sra	%i2,	%o0,	%g4
	fpsub32s	%f29,	%f2,	%f14
	sir	0x14D8
	fzero	%f18
	move	%xcc,	%i7,	%l4
	ld	[%l7 + 0x08],	%f2
	smulcc	%i0,	%g1,	%g2
	movrne	%i5,	%i6,	%o6
	andcc	%g3,	0x118E,	%i1
	xor	%l0,	0x10FD,	%g5
	andn	%l6,	0x0276,	%o4
	subccc	%g6,	%l1,	%l3
	orcc	%l2,	0x1018,	%g7
	fmovsleu	%xcc,	%f24,	%f13
	movpos	%xcc,	%o2,	%o7
	edge8l	%i4,	%o3,	%o5
	edge16n	%o1,	%l5,	%i2
	fcmpgt16	%f26,	%f22,	%i3
	orncc	%g4,	0x16EF,	%i7
	fmovdleu	%icc,	%f21,	%f16
	fpsub16	%f8,	%f28,	%f6
	movcs	%xcc,	%l4,	%o0
	std	%f22,	[%l7 + 0x70]
	edge8	%g1,	%i0,	%i5
	edge32l	%g2,	%i6,	%g3
	umul	%o6,	%i1,	%l0
	fmovscc	%xcc,	%f13,	%f18
	srl	%l6,	%o4,	%g5
	fnands	%f17,	%f5,	%f27
	orn	%g6,	0x14A5,	%l1
	xor	%l3,	%l2,	%g7
	sra	%o2,	0x18,	%o7
	fcmps	%fcc1,	%f9,	%f5
	fmuld8ulx16	%f9,	%f20,	%f30
	lduw	[%l7 + 0x24],	%o3
	edge16l	%i4,	%o5,	%o1
	edge32ln	%i2,	%i3,	%l5
	fnot2	%f8,	%f26
	move	%xcc,	%g4,	%i7
	orncc	%l4,	%o0,	%i0
	ldub	[%l7 + 0x7A],	%g1
	movne	%xcc,	%i5,	%i6
	addc	%g3,	0x149A,	%g2
	or	%i1,	%o6,	%l0
	fmovrsne	%o4,	%f15,	%f1
	subccc	%g5,	0x0C3C,	%l6
	orcc	%l1,	%l3,	%g6
	sub	%l2,	%g7,	%o2
	sth	%o3,	[%l7 + 0x6E]
	movpos	%icc,	%i4,	%o5
	smulcc	%o7,	%i2,	%o1
	xnor	%i3,	%g4,	%i7
	udivcc	%l5,	0x00E0,	%l4
	stw	%o0,	[%l7 + 0x5C]
	array16	%g1,	%i0,	%i6
	fcmpgt16	%f26,	%f10,	%g3
	fmovdgu	%xcc,	%f7,	%f25
	ldx	[%l7 + 0x60],	%i5
	save %g2, %o6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%icc,	%f5,	%f4
	save %i1, 0x1704, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x18, %o5
	ldsh	[%l7 + %o5],	%o4
	mulscc	%l6,	0x0F79,	%l1
	srlx	%g6,	%l3,	%g7
	addc	%l2,	0x00B6,	%o2
	orn	%o3,	%o5,	%o7
	orn	%i4,	%o1,	%i2
	srax	%i3,	0x17,	%i7
	umul	%l5,	0x15D5,	%g4
	fnand	%f0,	%f30,	%f12
	save %l4, 0x0464, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f22
	sdiv	%i0,	0x08F7,	%g1
	sir	0x0F71
	or	%g3,	%i6,	%g2
	smulcc	%i5,	0x1229,	%o6
	fnot1s	%f1,	%f16
	srlx	%i1,	%l0,	%g5
	fpadd16s	%f9,	%f9,	%f2
	ldd	[%l7 + 0x28],	%o4
	sdiv	%l6,	0x0559,	%g6
	lduh	[%l7 + 0x4E],	%l3
	movrgez	%g7,	%l1,	%o2
	edge16n	%l2,	%o3,	%o7
	edge16l	%i4,	%o5,	%o1
	movle	%xcc,	%i2,	%i3
	fsrc2	%f6,	%f22
	fnot1s	%f18,	%f4
	array8	%l5,	%g4,	%i7
	fsrc1	%f14,	%f10
	fmul8ulx16	%f16,	%f8,	%f2
	edge8l	%o0,	%i0,	%g1
	lduh	[%l7 + 0x4A],	%l4
	movvs	%xcc,	%g3,	%g2
	ldd	[%l7 + 0x38],	%f0
	srax	%i6,	0x05,	%o6
	movpos	%icc,	%i5,	%i1
	pdist	%f22,	%f28,	%f22
	ldx	[%l7 + 0x58],	%l0
	addc	%g5,	0x16B9,	%l6
	siam	0x6
	edge32ln	%g6,	%o4,	%g7
	edge8ln	%l1,	%o2,	%l3
	xnorcc	%o3,	%l2,	%o7
	edge16ln	%i4,	%o1,	%i2
	std	%f22,	[%l7 + 0x10]
	add	%i3,	0x05CA,	%o5
	umulcc	%l5,	0x12F3,	%i7
	ldsw	[%l7 + 0x64],	%o0
	movleu	%icc,	%i0,	%g1
	movcc	%xcc,	%g4,	%g3
	fmovsge	%xcc,	%f22,	%f31
	fabss	%f11,	%f19
	sra	%g2,	%l4,	%i6
	addccc	%o6,	0x138E,	%i5
	sub	%i1,	%l0,	%l6
	ldd	[%l7 + 0x38],	%f14
	movge	%xcc,	%g5,	%g6
	sethi	0x0FC2,	%o4
	srl	%g7,	0x1C,	%l1
	edge16n	%l3,	%o3,	%o2
	edge32l	%l2,	%i4,	%o7
	smulcc	%i2,	0x0851,	%o1
	edge16ln	%i3,	%o5,	%l5
	fones	%f20
	popc	%o0,	%i0
	orn	%i7,	%g4,	%g1
	sdiv	%g3,	0x1B87,	%g2
	mulscc	%i6,	%l4,	%o6
	sdivx	%i1,	0x00DF,	%l0
	umul	%l6,	0x15FA,	%g5
	fmul8x16au	%f10,	%f21,	%f28
	fmovda	%icc,	%f2,	%f22
	addccc	%g6,	%i5,	%g7
	umulcc	%l1,	%l3,	%o3
	movl	%icc,	%o2,	%l2
	movgu	%icc,	%o4,	%o7
	xnorcc	%i2,	%i4,	%o1
	xor	%o5,	0x1AA8,	%l5
	array32	%o0,	%i3,	%i0
	edge32n	%i7,	%g4,	%g1
	orncc	%g3,	%g2,	%l4
	orcc	%i6,	%o6,	%l0
	fabsd	%f6,	%f22
	andcc	%i1,	%l6,	%g5
	movrlz	%i5,	%g6,	%l1
	fmovrsgz	%l3,	%f21,	%f8
	or	%g7,	%o3,	%o2
	udivx	%l2,	0x19AB,	%o7
	movleu	%icc,	%i2,	%i4
	fxor	%f4,	%f10,	%f8
	ldd	[%l7 + 0x68],	%f8
	subc	%o4,	0x0128,	%o5
	edge16n	%l5,	%o0,	%i3
	umul	%i0,	0x0D8F,	%o1
	ldsw	[%l7 + 0x70],	%i7
	fxnor	%f24,	%f16,	%f4
	orncc	%g4,	%g1,	%g2
	array32	%l4,	%g3,	%o6
	ldd	[%l7 + 0x10],	%l0
	ldd	[%l7 + 0x20],	%f22
	nop
	set	0x0C, %i1
	ldsw	[%l7 + %i1],	%i6
	xnor	%i1,	0x16D0,	%l6
	movg	%xcc,	%g5,	%i5
	ldub	[%l7 + 0x4A],	%l1
	srl	%g6,	0x03,	%l3
	udivx	%o3,	0x1BD9,	%g7
	movne	%xcc,	%o2,	%l2
	fcmped	%fcc0,	%f4,	%f2
	movcs	%xcc,	%o7,	%i4
	movgu	%xcc,	%o4,	%i2
	addccc	%o5,	%l5,	%i3
	sdivx	%o0,	0x037B,	%o1
	movvs	%icc,	%i0,	%i7
	movrlez	%g4,	%g1,	%l4
	addcc	%g2,	%g3,	%l0
	edge16l	%o6,	%i6,	%l6
	ldx	[%l7 + 0x20],	%g5
	udiv	%i1,	0x1166,	%l1
	sth	%g6,	[%l7 + 0x08]
	edge8	%i5,	%l3,	%g7
	subc	%o3,	0x1C1E,	%o2
	fmul8x16au	%f13,	%f1,	%f16
	sethi	0x18B1,	%o7
	movl	%xcc,	%l2,	%o4
	sdivcc	%i2,	0x0C6D,	%o5
	subc	%i4,	%l5,	%i3
	ldx	[%l7 + 0x70],	%o0
	sth	%i0,	[%l7 + 0x42]
	edge8n	%i7,	%o1,	%g4
	fmovdcc	%icc,	%f12,	%f27
	and	%g1,	%g2,	%g3
	xnor	%l0,	0x1A66,	%l4
	fmovsne	%xcc,	%f19,	%f30
	movl	%xcc,	%i6,	%l6
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%g5
	alignaddrl	%o6,	%l1,	%i1
	sll	%g6,	0x1E,	%i5
	fmovdleu	%icc,	%f24,	%f5
	movl	%icc,	%l3,	%g7
	srl	%o3,	0x16,	%o2
	fcmpgt32	%f0,	%f8,	%l2
	movl	%icc,	%o4,	%o7
	sir	0x1C53
	ldd	[%l7 + 0x08],	%o4
	ldsw	[%l7 + 0x38],	%i2
	sub	%i4,	0x054E,	%i3
	movge	%xcc,	%l5,	%i0
	orncc	%i7,	%o0,	%g4
	fmovs	%f26,	%f0
	fcmps	%fcc3,	%f17,	%f24
	fmovdgu	%icc,	%f25,	%f16
	for	%f24,	%f0,	%f26
	movneg	%xcc,	%o1,	%g2
	fpsub16	%f20,	%f20,	%f26
	sdivcc	%g1,	0x0538,	%l0
	sll	%g3,	%l4,	%i6
	popc	%g5,	%l6
	fmovd	%f20,	%f4
	sdivcc	%l1,	0x0EF6,	%o6
	sub	%i1,	%i5,	%g6
	stw	%g7,	[%l7 + 0x74]
	srlx	%l3,	0x10,	%o3
	edge16	%l2,	%o2,	%o4
	movcc	%icc,	%o7,	%o5
	and	%i2,	0x184A,	%i3
	fxnor	%f24,	%f12,	%f20
	fexpand	%f3,	%f14
	fnot2s	%f18,	%f1
	alignaddrl	%i4,	%l5,	%i0
	sdivcc	%i7,	0x1DBB,	%o0
	array32	%g4,	%g2,	%g1
	udivcc	%o1,	0x177C,	%l0
	udivcc	%g3,	0x0218,	%l4
	fmovsneg	%icc,	%f7,	%f24
	fcmped	%fcc2,	%f24,	%f20
	andcc	%g5,	0x1B64,	%i6
	edge32l	%l6,	%o6,	%l1
	fexpand	%f12,	%f18
	mova	%xcc,	%i5,	%i1
	fmovsne	%xcc,	%f28,	%f16
	add	%g7,	%l3,	%o3
	movne	%xcc,	%g6,	%l2
	movleu	%icc,	%o2,	%o4
	movrlez	%o7,	0x0B9,	%o5
	movpos	%xcc,	%i2,	%i3
	ldsb	[%l7 + 0x75],	%i4
	fands	%f10,	%f5,	%f16
	movgu	%xcc,	%l5,	%i0
	pdist	%f14,	%f16,	%f12
	orcc	%i7,	%g4,	%o0
	fcmpd	%fcc1,	%f24,	%f28
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	xnorcc	%g2,	0x195F,	%l0
	movpos	%icc,	%g3,	%l4
	fmovrsgez	%g5,	%f5,	%f15
	ldsb	[%l7 + 0x60],	%l6
	fmul8x16al	%f6,	%f18,	%f22
	fmovrse	%i6,	%f4,	%f29
	srax	%l1,	0x0F,	%i5
	array8	%i1,	%o6,	%l3
	fornot1s	%f30,	%f17,	%f18
	subccc	%o3,	%g7,	%g6
	fmovdvs	%xcc,	%f1,	%f12
	edge32ln	%l2,	%o2,	%o7
	srax	%o5,	%o4,	%i3
	fmovrsgez	%i2,	%f3,	%f7
	fands	%f19,	%f30,	%f20
	add	%i4,	0x1E85,	%l5
	fmovrsgz	%i0,	%f15,	%f24
	fnors	%f20,	%f16,	%f22
	sra	%i7,	0x12,	%o0
	xor	%g1,	%o1,	%g2
	movrlz	%g4,	%l0,	%l4
	edge16l	%g3,	%l6,	%i6
	popc	%g5,	%i5
	fxor	%f6,	%f26,	%f4
	movneg	%xcc,	%i1,	%o6
	fnand	%f6,	%f20,	%f6
	xnorcc	%l1,	0x085C,	%l3
	array32	%o3,	%g7,	%l2
	sth	%g6,	[%l7 + 0x26]
	smul	%o2,	%o7,	%o4
	move	%icc,	%o5,	%i3
	alignaddr	%i4,	%l5,	%i0
	lduh	[%l7 + 0x0C],	%i2
	sllx	%o0,	%i7,	%g1
	ldx	[%l7 + 0x58],	%g2
	movcs	%xcc,	%o1,	%g4
	lduw	[%l7 + 0x7C],	%l0
	fcmpgt16	%f0,	%f26,	%g3
	sub	%l4,	0x035F,	%l6
	xorcc	%i6,	%g5,	%i1
	fmovspos	%icc,	%f15,	%f18
	andncc	%i5,	%o6,	%l3
	ldd	[%l7 + 0x08],	%l0
	movrlez	%o3,	0x282,	%g7
	fxnors	%f4,	%f3,	%f1
	movle	%xcc,	%l2,	%o2
	and	%o7,	0x1715,	%o4
	movleu	%icc,	%o5,	%g6
	movvc	%xcc,	%i3,	%i4
	srlx	%i0,	0x08,	%i2
	alignaddrl	%o0,	%l5,	%g1
	sub	%i7,	%o1,	%g2
	subccc	%l0,	%g4,	%g3
	fmovrsne	%l6,	%f6,	%f29
	alignaddr	%l4,	%g5,	%i6
	fmovrsne	%i5,	%f14,	%f17
	mulx	%i1,	0x008E,	%o6
	stw	%l3,	[%l7 + 0x10]
	movrgz	%o3,	%g7,	%l2
	mulx	%l1,	0x0DC9,	%o2
	fmovrsgz	%o7,	%f10,	%f13
	smulcc	%o5,	%o4,	%i3
	restore %i4, %g6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%i2,	0x1E,	%l5
	edge32l	%g1,	%i7,	%o0
	alignaddr	%g2,	%o1,	%g4
	sra	%g3,	%l6,	%l4
	fmovdl	%icc,	%f3,	%f14
	fmovsvs	%icc,	%f4,	%f20
	movpos	%icc,	%l0,	%g5
	fmuld8sux16	%f31,	%f31,	%f8
	addccc	%i6,	0x12E1,	%i5
	mulscc	%i1,	0x0874,	%o6
	fxors	%f3,	%f13,	%f20
	movre	%l3,	%g7,	%l2
	movleu	%xcc,	%o3,	%l1
	fmovs	%f0,	%f19
	add	%o7,	0x0327,	%o5
	movcc	%xcc,	%o2,	%o4
	fmovsleu	%icc,	%f7,	%f1
	edge16l	%i4,	%i3,	%i0
	fmovrsgez	%i2,	%f16,	%f8
	fmovrsgz	%l5,	%f11,	%f31
	movcc	%icc,	%g6,	%i7
	movl	%icc,	%o0,	%g1
	sllx	%o1,	%g2,	%g3
	add	%l6,	0x0DBF,	%l4
	fpadd32s	%f15,	%f29,	%f12
	ldsh	[%l7 + 0x30],	%g4
	ldd	[%l7 + 0x18],	%f0
	andcc	%g5,	0x1835,	%l0
	xnorcc	%i6,	%i5,	%o6
	umul	%i1,	0x0A91,	%g7
	edge16l	%l3,	%o3,	%l2
	fmul8x16au	%f8,	%f30,	%f18
	array16	%l1,	%o5,	%o7
	movn	%xcc,	%o4,	%i4
	addccc	%o2,	%i0,	%i3
	movle	%xcc,	%i2,	%l5
	sethi	0x150D,	%g6
	sll	%o0,	0x0C,	%g1
	udiv	%i7,	0x1CD4,	%g2
	andcc	%g3,	%o1,	%l4
	save %l6, %g5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f16,	%f26,	%f24
	fmul8x16au	%f21,	%f16,	%f30
	movcc	%icc,	%g4,	%i6
	movn	%icc,	%o6,	%i1
	edge32l	%i5,	%l3,	%o3
	sir	0x061E
	edge32n	%l2,	%g7,	%l1
	movne	%xcc,	%o7,	%o4
	sethi	0x1D1E,	%o5
	sll	%i4,	0x18,	%i0
	edge8l	%i3,	%i2,	%o2
	sdiv	%l5,	0x03DC,	%o0
	fxnors	%f18,	%f6,	%f27
	fnot1s	%f27,	%f4
	srlx	%g6,	%i7,	%g1
	ldub	[%l7 + 0x32],	%g3
	subccc	%g2,	%o1,	%l4
	fmovdleu	%icc,	%f22,	%f28
	fmovrslez	%g5,	%f9,	%f7
	edge16	%l6,	%g4,	%l0
	fmul8ulx16	%f20,	%f18,	%f28
	mulx	%i6,	0x1469,	%i1
	ld	[%l7 + 0x24],	%f15
	edge16ln	%o6,	%l3,	%o3
	alignaddr	%i5,	%g7,	%l2
	fcmpeq16	%f16,	%f4,	%l1
	alignaddr	%o4,	%o7,	%o5
	udiv	%i0,	0x17B6,	%i4
	fmovdvs	%xcc,	%f3,	%f5
	sub	%i2,	0x185E,	%o2
	fnegs	%f19,	%f31
	ldd	[%l7 + 0x38],	%i2
	xorcc	%o0,	0x06B1,	%g6
	fmovdg	%icc,	%f0,	%f21
	andcc	%l5,	%i7,	%g3
	smulcc	%g1,	0x0A23,	%g2
	ld	[%l7 + 0x18],	%f26
	addc	%l4,	%g5,	%o1
	stb	%g4,	[%l7 + 0x5F]
	stw	%l0,	[%l7 + 0x10]
	array8	%l6,	%i6,	%i1
	edge32	%l3,	%o6,	%i5
	edge8n	%o3,	%g7,	%l2
	ld	[%l7 + 0x48],	%f14
	st	%f21,	[%l7 + 0x14]
	fpsub32s	%f27,	%f0,	%f23
	orcc	%o4,	%l1,	%o5
	ldd	[%l7 + 0x60],	%f20
	fmovdle	%icc,	%f13,	%f9
	fpack16	%f22,	%f5
	fcmpes	%fcc2,	%f9,	%f20
	orncc	%o7,	0x0DCD,	%i4
	udiv	%i0,	0x0E36,	%o2
	fmovde	%xcc,	%f29,	%f29
	srlx	%i3,	%i2,	%g6
	edge8l	%o0,	%l5,	%g3
	fmovrde	%i7,	%f22,	%f14
	udivcc	%g2,	0x190C,	%g1
	move	%xcc,	%l4,	%o1
	fpack16	%f26,	%f1
	movrgz	%g4,	0x3BA,	%g5
	movle	%icc,	%l6,	%i6
	andn	%i1,	%l3,	%o6
	orncc	%l0,	0x11B5,	%o3
	fnegd	%f30,	%f10
	fcmpd	%fcc0,	%f16,	%f30
	fmovsa	%icc,	%f6,	%f7
	sll	%i5,	0x1F,	%l2
	edge16ln	%g7,	%o4,	%l1
	fornot1	%f20,	%f20,	%f18
	subcc	%o5,	0x0986,	%o7
	addcc	%i0,	%i4,	%o2
	sra	%i2,	%i3,	%o0
	edge16ln	%l5,	%g3,	%i7
	movge	%icc,	%g2,	%g6
	alignaddr	%g1,	%l4,	%o1
	edge32ln	%g5,	%g4,	%l6
	fpsub32	%f22,	%f16,	%f8
	movrlz	%i6,	%i1,	%l3
	fmovrde	%l0,	%f8,	%f12
	udivcc	%o3,	0x0D57,	%o6
	sethi	0x0E05,	%i5
	edge8l	%l2,	%o4,	%g7
	movne	%xcc,	%l1,	%o5
	fnegs	%f29,	%f6
	sll	%o7,	%i0,	%o2
	movvs	%xcc,	%i2,	%i4
	sub	%i3,	0x016A,	%o0
	ldsw	[%l7 + 0x4C],	%l5
	array32	%g3,	%g2,	%i7
	ld	[%l7 + 0x3C],	%f7
	edge16ln	%g6,	%g1,	%o1
	movcc	%xcc,	%g5,	%l4
	andn	%l6,	%g4,	%i1
	edge32	%i6,	%l3,	%o3
	sethi	0x16CC,	%o6
	add	%i5,	%l2,	%o4
	fand	%f30,	%f28,	%f4
	ldd	[%l7 + 0x50],	%f20
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%f26
	movre	%g7,	%l0,	%o5
	movrlz	%o7,	%i0,	%l1
	stx	%i2,	[%l7 + 0x18]
	andn	%i4,	0x0BC4,	%o2
	edge32n	%o0,	%i3,	%l5
	movneg	%xcc,	%g2,	%g3
	srl	%g6,	0x02,	%i7
	movn	%icc,	%o1,	%g5
	udivx	%l4,	0x1206,	%g1
	xnor	%g4,	%l6,	%i1
	subcc	%i6,	0x08EA,	%l3
	ldsw	[%l7 + 0x58],	%o6
	fmovse	%icc,	%f13,	%f21
	fmovse	%xcc,	%f6,	%f16
	fmovrse	%i5,	%f10,	%f23
	fmovrslez	%o3,	%f12,	%f3
	movrne	%o4,	0x0A5,	%l2
	fcmpne16	%f8,	%f8,	%g7
	movrgz	%o5,	0x29D,	%o7
	std	%f2,	[%l7 + 0x60]
	sethi	0x0F90,	%l0
	movvs	%xcc,	%i0,	%i2
	movge	%xcc,	%l1,	%o2
	movpos	%icc,	%i4,	%i3
	movge	%xcc,	%l5,	%o0
	lduh	[%l7 + 0x32],	%g2
	fmovdcs	%icc,	%f7,	%f13
	xor	%g3,	%i7,	%g6
	movvs	%icc,	%o1,	%g5
	fpack32	%f28,	%f12,	%f16
	fxnors	%f23,	%f2,	%f21
	addc	%g1,	%g4,	%l4
	movneg	%xcc,	%l6,	%i6
	movcs	%xcc,	%i1,	%o6
	ldx	[%l7 + 0x08],	%i5
	addc	%l3,	%o4,	%o3
	smulcc	%g7,	0x03B2,	%o5
	fmovrslz	%o7,	%f2,	%f30
	fcmpne32	%f22,	%f8,	%l0
	st	%f28,	[%l7 + 0x64]
	fcmple32	%f14,	%f0,	%l2
	movleu	%icc,	%i0,	%l1
	edge16n	%o2,	%i4,	%i2
	orcc	%i3,	%o0,	%l5
	srax	%g3,	%i7,	%g6
	umul	%o1,	%g2,	%g1
	mova	%icc,	%g4,	%g5
	edge16ln	%l4,	%i6,	%l6
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	movcs	%icc,	%l3,	%o4
	sra	%o3,	%g7,	%i5
	movpos	%icc,	%o5,	%o7
	fsrc1s	%f5,	%f7
	fmul8sux16	%f10,	%f30,	%f30
	srax	%l2,	%i0,	%l1
	xorcc	%l0,	%i4,	%i2
	fandnot1	%f30,	%f22,	%f20
	edge16l	%o2,	%o0,	%l5
	ldub	[%l7 + 0x10],	%g3
	andcc	%i3,	%g6,	%o1
	fmovdvc	%icc,	%f25,	%f2
	ldsw	[%l7 + 0x14],	%g2
	movrlz	%g1,	0x063,	%g4
	movneg	%xcc,	%i7,	%g5
	fsrc1	%f12,	%f0
	fmovrdgz	%i6,	%f12,	%f12
	orn	%l4,	0x10CB,	%o6
	st	%f15,	[%l7 + 0x1C]
	st	%f7,	[%l7 + 0x58]
	fmovdl	%icc,	%f28,	%f22
	movrne	%i1,	%l3,	%l6
	sethi	0x0A17,	%o4
	edge8ln	%o3,	%i5,	%o5
	movn	%icc,	%g7,	%o7
	ldx	[%l7 + 0x78],	%l2
	fcmpgt16	%f26,	%f30,	%l1
	array8	%i0,	%l0,	%i2
	sllx	%i4,	%o2,	%l5
	fmovsa	%xcc,	%f15,	%f2
	movrgez	%g3,	%i3,	%g6
	xorcc	%o0,	0x0148,	%g2
	bshuffle	%f8,	%f28,	%f0
	fsrc1	%f8,	%f14
	nop
	set	0x6C, %g2
	ldsh	[%l7 + %g2],	%o1
	fornot2s	%f13,	%f2,	%f8
	fexpand	%f3,	%f24
	add	%g1,	0x0DAD,	%g4
	fmovdcs	%xcc,	%f12,	%f2
	srax	%g5,	%i7,	%l4
	sir	0x1BF7
	subc	%i6,	0x1CA4,	%o6
	stw	%l3,	[%l7 + 0x7C]
	edge8ln	%l6,	%i1,	%o4
	andcc	%o3,	0x1B5E,	%i5
	st	%f7,	[%l7 + 0x40]
	stb	%g7,	[%l7 + 0x7D]
	xnorcc	%o5,	0x0C2F,	%l2
	or	%o7,	0x0EF3,	%i0
	movn	%xcc,	%l1,	%l0
	nop
	set	0x38, %o4
	ldsh	[%l7 + %o4],	%i2
	fcmpgt32	%f8,	%f10,	%i4
	fcmpne16	%f24,	%f22,	%o2
	restore %g3, 0x0ED0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	subcc	%o0,	0x0196,	%g1
	edge16l	%g4,	%o1,	%i7
	fmovrdne	%g5,	%f22,	%f30
	stb	%i6,	[%l7 + 0x7A]
	fabss	%f0,	%f7
	srl	%o6,	%l3,	%l4
	alignaddr	%i1,	%l6,	%o3
	ldd	[%l7 + 0x08],	%f0
	fnor	%f10,	%f28,	%f30
	alignaddrl	%o4,	%g7,	%o5
	fornot2s	%f2,	%f29,	%f8
	udivcc	%l2,	0x17F3,	%i5
	mulscc	%i0,	0x0BBB,	%o7
	movcc	%xcc,	%l1,	%l0
	ld	[%l7 + 0x24],	%f7
	ldsh	[%l7 + 0x60],	%i2
	edge32l	%i4,	%o2,	%i3
	stb	%g6,	[%l7 + 0x70]
	fcmpgt32	%f26,	%f30,	%l5
	ldx	[%l7 + 0x68],	%g2
	smul	%g3,	0x1680,	%g1
	fpackfix	%f22,	%f15
	pdist	%f28,	%f26,	%f22
	edge32ln	%o0,	%g4,	%o1
	edge32	%i7,	%i6,	%g5
	movge	%xcc,	%l3,	%l4
	edge8	%i1,	%l6,	%o6
	ldsh	[%l7 + 0x5E],	%o4
	fmovrse	%g7,	%f1,	%f18
	stw	%o5,	[%l7 + 0x78]
	xorcc	%l2,	%i5,	%o3
	movneg	%xcc,	%i0,	%o7
	nop
	set	0x40, %i7
	std	%f24,	[%l7 + %i7]
	xor	%l1,	0x1093,	%l0
	movrlez	%i2,	%i4,	%i3
	ld	[%l7 + 0x20],	%f24
	fnegs	%f15,	%f30
	nop
	set	0x30, %o2
	stx	%g6,	[%l7 + %o2]
	ldd	[%l7 + 0x40],	%f24
	edge16n	%o2,	%g2,	%l5
	popc	0x1BB3,	%g1
	and	%g3,	%o0,	%o1
	ldsb	[%l7 + 0x78],	%g4
	nop
	set	0x5C, %o6
	stw	%i6,	[%l7 + %o6]
	edge16l	%i7,	%l3,	%l4
	fpadd32	%f0,	%f2,	%f24
	fmovrdlez	%i1,	%f26,	%f2
	mova	%xcc,	%l6,	%o6
	add	%o4,	%g7,	%g5
	edge32l	%l2,	%i5,	%o5
	sdiv	%i0,	0x138B,	%o7
	alignaddr	%l1,	%l0,	%i2
	alignaddr	%i4,	%o3,	%g6
	xnorcc	%i3,	%g2,	%l5
	fcmpd	%fcc2,	%f10,	%f0
	movgu	%xcc,	%g1,	%o2
	ld	[%l7 + 0x5C],	%f1
	sdivx	%g3,	0x007C,	%o0
	fmovdneg	%xcc,	%f20,	%f20
	ldsh	[%l7 + 0x4E],	%g4
	edge16n	%o1,	%i6,	%i7
	edge16	%l4,	%i1,	%l6
	fnegs	%f8,	%f9
	fmovspos	%xcc,	%f1,	%f14
	fmovdg	%icc,	%f5,	%f11
	edge32l	%l3,	%o6,	%g7
	orn	%g5,	%l2,	%i5
	movgu	%xcc,	%o5,	%i0
	sra	%o4,	0x0B,	%o7
	movcc	%xcc,	%l0,	%i2
	edge8l	%i4,	%o3,	%l1
	move	%xcc,	%i3,	%g2
	addccc	%l5,	0x14D8,	%g1
	movrne	%g6,	%o2,	%o0
	fpsub16s	%f14,	%f24,	%f20
	sdivcc	%g3,	0x0DCD,	%g4
	st	%f17,	[%l7 + 0x20]
	popc	0x0069,	%i6
	smulcc	%o1,	%i7,	%i1
	fpadd32s	%f13,	%f4,	%f25
	ldsw	[%l7 + 0x2C],	%l6
	alignaddr	%l4,	%o6,	%g7
	movcs	%xcc,	%g5,	%l3
	fmovdpos	%icc,	%f3,	%f25
	for	%f2,	%f18,	%f6
	fmovsa	%icc,	%f13,	%f9
	orcc	%i5,	0x16DE,	%l2
	movge	%xcc,	%i0,	%o5
	xnor	%o4,	%l0,	%o7
	orncc	%i2,	0x0532,	%o3
	sth	%i4,	[%l7 + 0x16]
	movrgz	%i3,	0x19C,	%g2
	movrgez	%l1,	0x11E,	%l5
	edge16l	%g1,	%o2,	%g6
	stx	%o0,	[%l7 + 0x40]
	movrne	%g4,	0x056,	%i6
	lduh	[%l7 + 0x5A],	%g3
	umul	%i7,	%i1,	%o1
	stb	%l6,	[%l7 + 0x6F]
	ldsh	[%l7 + 0x2A],	%l4
	edge16	%g7,	%g5,	%o6
	add	%l3,	0x18A8,	%i5
	movrgez	%i0,	0x3E5,	%o5
	movl	%xcc,	%l2,	%l0
	udiv	%o7,	0x1BD8,	%i2
	orcc	%o3,	%i4,	%o4
	srlx	%g2,	%i3,	%l1
	orncc	%g1,	0x0048,	%l5
	smulcc	%g6,	%o0,	%o2
	movcc	%xcc,	%g4,	%i6
	fors	%f3,	%f3,	%f25
	fmul8sux16	%f28,	%f10,	%f10
	fandnot2s	%f15,	%f0,	%f2
	movrlez	%g3,	0x044,	%i1
	fones	%f16
	movcs	%icc,	%o1,	%i7
	sllx	%l4,	%g7,	%g5
	edge16n	%l6,	%l3,	%o6
	stb	%i5,	[%l7 + 0x76]
	fsrc2	%f0,	%f30
	alignaddrl	%o5,	%i0,	%l2
	stb	%l0,	[%l7 + 0x09]
	movl	%xcc,	%o7,	%i2
	fmul8x16	%f3,	%f18,	%f22
	fabsd	%f0,	%f8
	stw	%i4,	[%l7 + 0x10]
	mulx	%o3,	0x0857,	%g2
	sll	%o4,	0x0E,	%i3
	srlx	%g1,	%l5,	%l1
	fmovsleu	%xcc,	%f6,	%f1
	fmovrsgez	%g6,	%f22,	%f20
	fmovdvs	%xcc,	%f29,	%f4
	edge8	%o0,	%o2,	%g4
	sub	%i6,	%i1,	%o1
	movre	%g3,	%i7,	%l4
	stb	%g5,	[%l7 + 0x4D]
	fmovdneg	%xcc,	%f15,	%f8
	fnot2s	%f24,	%f2
	xorcc	%l6,	%l3,	%g7
	fmovrslz	%i5,	%f23,	%f26
	movle	%icc,	%o5,	%o6
	ld	[%l7 + 0x1C],	%f15
	fcmpd	%fcc0,	%f20,	%f0
	fmovdl	%xcc,	%f17,	%f9
	fmul8ulx16	%f30,	%f30,	%f22
	movneg	%icc,	%i0,	%l0
	edge8	%o7,	%i2,	%i4
	stx	%l2,	[%l7 + 0x50]
	fpsub16s	%f20,	%f13,	%f1
	alignaddrl	%g2,	%o4,	%o3
	stw	%g1,	[%l7 + 0x0C]
	std	%f14,	[%l7 + 0x68]
	st	%f20,	[%l7 + 0x2C]
	movvs	%icc,	%l5,	%i3
	ldsw	[%l7 + 0x2C],	%l1
	srl	%g6,	0x1E,	%o0
	fcmpgt16	%f24,	%f12,	%g4
	srlx	%o2,	0x14,	%i6
	udivx	%i1,	0x1B2F,	%g3
	fmovsg	%xcc,	%f26,	%f5
	popc	%i7,	%l4
	add	%g5,	0x1028,	%o1
	movrgez	%l3,	%l6,	%g7
	sdivcc	%o5,	0x0D3C,	%o6
	fcmpd	%fcc1,	%f30,	%f28
	edge8n	%i5,	%l0,	%i0
	addc	%i2,	%i4,	%l2
	mulscc	%o7,	%g2,	%o4
	ldd	[%l7 + 0x60],	%o2
	ldx	[%l7 + 0x78],	%g1
	alignaddr	%l5,	%i3,	%l1
	edge32l	%g6,	%g4,	%o2
	edge32ln	%o0,	%i6,	%i1
	umul	%i7,	0x1CF2,	%g3
	fcmpgt32	%f2,	%f22,	%l4
	fabsd	%f30,	%f4
	edge32n	%g5,	%l3,	%o1
	movrgz	%g7,	0x0C5,	%o5
	udivx	%o6,	0x14D8,	%i5
	subccc	%l0,	%l6,	%i2
	sdiv	%i0,	0x12B6,	%l2
	fmovdcc	%xcc,	%f23,	%f15
	stx	%i4,	[%l7 + 0x58]
	edge16	%o7,	%g2,	%o4
	movn	%icc,	%g1,	%o3
	edge16	%i3,	%l1,	%l5
	movrgez	%g4,	%g6,	%o0
	edge8ln	%i6,	%i1,	%i7
	edge32ln	%o2,	%l4,	%g5
	nop
	set	0x5C, %g5
	ldsw	[%l7 + %g5],	%g3
	udivx	%l3,	0x1A08,	%o1
	fcmpes	%fcc0,	%f18,	%f6
	sdivcc	%g7,	0x10D6,	%o6
	edge8n	%i5,	%o5,	%l6
	edge32	%i2,	%l0,	%l2
	xorcc	%i0,	0x0831,	%i4
	fzeros	%f0
	ldx	[%l7 + 0x60],	%g2
	array8	%o7,	%o4,	%g1
	ld	[%l7 + 0x30],	%f9
	array8	%o3,	%l1,	%i3
	movrgz	%l5,	%g6,	%o0
	sra	%g4,	0x19,	%i6
	sll	%i1,	%i7,	%o2
	subcc	%g5,	0x00E1,	%l4
	addc	%g3,	0x1DCF,	%l3
	edge32	%o1,	%o6,	%g7
	edge16n	%i5,	%l6,	%o5
	fmovdcs	%xcc,	%f23,	%f8
	movrne	%l0,	0x1A1,	%l2
	fmovdge	%xcc,	%f18,	%f2
	fandnot2	%f12,	%f14,	%f20
	stw	%i0,	[%l7 + 0x10]
	fabsd	%f4,	%f14
	fornot1s	%f3,	%f29,	%f17
	andn	%i4,	0x1CA3,	%i2
	sll	%g2,	%o4,	%g1
	or	%o3,	0x06F1,	%l1
	movcs	%icc,	%o7,	%i3
	smulcc	%l5,	0x0C1A,	%o0
	ldsw	[%l7 + 0x34],	%g6
	array16	%g4,	%i6,	%i1
	alignaddrl	%i7,	%o2,	%g5
	addcc	%g3,	0x0824,	%l4
	fmul8x16al	%f19,	%f14,	%f0
	orn	%o1,	%o6,	%l3
	or	%i5,	0x0854,	%g7
	nop
	set	0x74, %i6
	stb	%o5,	[%l7 + %i6]
	lduw	[%l7 + 0x64],	%l6
	edge16n	%l2,	%l0,	%i4
	fmovrslz	%i0,	%f9,	%f27
	ldub	[%l7 + 0x45],	%g2
	andn	%i2,	%g1,	%o3
	fcmpes	%fcc0,	%f1,	%f8
	add	%o4,	0x0C80,	%l1
	umul	%o7,	0x1DE7,	%i3
	orn	%o0,	%l5,	%g6
	sdiv	%i6,	0x0264,	%g4
	xnorcc	%i7,	%i1,	%o2
	mulx	%g5,	0x07E5,	%g3
	fmovspos	%icc,	%f22,	%f10
	st	%f7,	[%l7 + 0x34]
	pdist	%f2,	%f6,	%f10
	save %o1, 0x04CE, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l3,	%i5,	%l4
	fmul8x16au	%f28,	%f11,	%f18
	mulx	%o5,	0x12D4,	%g7
	srl	%l6,	0x19,	%l0
	orncc	%i4,	%l2,	%g2
	orn	%i2,	0x1B5E,	%i0
	array16	%o3,	%g1,	%l1
	mulscc	%o7,	%i3,	%o4
	movl	%xcc,	%o0,	%l5
	sra	%i6,	0x14,	%g4
	subccc	%i7,	0x0126,	%g6
	edge32l	%i1,	%g5,	%g3
	movcs	%icc,	%o2,	%o1
	fand	%f4,	%f18,	%f10
	xorcc	%o6,	%l3,	%l4
	alignaddr	%i5,	%g7,	%l6
	xnor	%o5,	0x1124,	%i4
	umul	%l0,	%l2,	%i2
	edge32ln	%g2,	%o3,	%i0
	move	%icc,	%g1,	%o7
	stw	%i3,	[%l7 + 0x08]
	and	%l1,	%o0,	%l5
	srl	%o4,	0x1D,	%g4
	ld	[%l7 + 0x48],	%f11
	fpadd32	%f24,	%f14,	%f20
	ldd	[%l7 + 0x20],	%i6
	fors	%f27,	%f14,	%f21
	xor	%g6,	0x054B,	%i1
	save %g5, %i6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x08],	%o1
	fmovrsgez	%o6,	%f4,	%f12
	sethi	0x1573,	%o2
	fabsd	%f24,	%f24
	subcc	%l3,	%l4,	%g7
	andncc	%l6,	%o5,	%i5
	mova	%xcc,	%l0,	%l2
	udivcc	%i4,	0x045A,	%i2
	smulcc	%g2,	%o3,	%i0
	edge16l	%g1,	%i3,	%l1
	fsrc2s	%f3,	%f18
	subcc	%o0,	0x02F3,	%o7
	edge32l	%o4,	%g4,	%i7
	smulcc	%l5,	0x07C0,	%g6
	movleu	%xcc,	%g5,	%i6
	for	%f26,	%f12,	%f0
	st	%f22,	[%l7 + 0x08]
	fnegd	%f30,	%f4
	edge16ln	%i1,	%o1,	%o6
	array32	%g3,	%l3,	%o2
	fxnor	%f10,	%f10,	%f8
	ldd	[%l7 + 0x40],	%l4
	fmovsleu	%icc,	%f26,	%f12
	srl	%g7,	0x03,	%o5
	movrlez	%l6,	0x00E,	%i5
	fpadd32s	%f13,	%f5,	%f27
	udivcc	%l0,	0x00A7,	%i4
	fornot2s	%f4,	%f26,	%f30
	movn	%xcc,	%i2,	%l2
	sir	0x04C7
	lduh	[%l7 + 0x72],	%g2
	fpackfix	%f4,	%f2
	fands	%f27,	%f26,	%f19
	array8	%o3,	%i0,	%i3
	fxnor	%f30,	%f2,	%f16
	fmuld8ulx16	%f21,	%f16,	%f30
	movleu	%xcc,	%g1,	%o0
	or	%o7,	0x0FCE,	%o4
	movre	%g4,	%i7,	%l5
	andncc	%l1,	%g5,	%g6
	xnor	%i1,	0x0C14,	%o1
	ldsh	[%l7 + 0x22],	%o6
	alignaddr	%i6,	%g3,	%o2
	movcs	%icc,	%l3,	%l4
	movneg	%icc,	%o5,	%g7
	siam	0x1
	fmovdne	%xcc,	%f3,	%f13
	movrlez	%i5,	0x039,	%l6
	movl	%icc,	%i4,	%i2
	udivx	%l0,	0x0D54,	%g2
	orcc	%o3,	%l2,	%i0
	ld	[%l7 + 0x78],	%f31
	srlx	%g1,	%o0,	%i3
	std	%f28,	[%l7 + 0x70]
	fmovscs	%xcc,	%f23,	%f15
	move	%xcc,	%o4,	%o7
	ldx	[%l7 + 0x10],	%i7
	movgu	%xcc,	%g4,	%l5
	alignaddrl	%g5,	%g6,	%i1
	srl	%o1,	0x03,	%l1
	move	%xcc,	%o6,	%g3
	movrlz	%o2,	0x2A6,	%i6
	addc	%l3,	%o5,	%g7
	udivx	%l4,	0x17D6,	%i5
	movpos	%xcc,	%i4,	%i2
	ld	[%l7 + 0x54],	%f25
	sir	0x0C5C
	edge16l	%l0,	%l6,	%g2
	sdivx	%o3,	0x0C2A,	%l2
	umulcc	%i0,	0x0735,	%o0
	stb	%i3,	[%l7 + 0x37]
	mulx	%g1,	%o7,	%o4
	fpsub32s	%f30,	%f28,	%f23
	sethi	0x0DF1,	%g4
	udivx	%i7,	0x05FB,	%g5
	movrgez	%g6,	0x3E1,	%l5
	smulcc	%i1,	%o1,	%l1
	fmovscs	%icc,	%f23,	%f2
	fpadd16	%f12,	%f30,	%f20
	ldsb	[%l7 + 0x4B],	%g3
	fmovda	%xcc,	%f15,	%f1
	popc	0x02B5,	%o2
	fcmpgt32	%f12,	%f18,	%i6
	xor	%o6,	0x12BF,	%l3
	edge16n	%g7,	%o5,	%l4
	mulscc	%i4,	%i2,	%l0
	ldd	[%l7 + 0x08],	%f8
	fpack32	%f0,	%f24,	%f22
	edge8l	%i5,	%g2,	%o3
	alignaddrl	%l2,	%i0,	%l6
	bshuffle	%f6,	%f0,	%f24
	xnorcc	%i3,	%o0,	%g1
	edge32n	%o4,	%o7,	%g4
	subccc	%i7,	0x1B4B,	%g6
	fmovdne	%icc,	%f27,	%f5
	mulx	%g5,	0x010F,	%i1
	movgu	%icc,	%o1,	%l5
	sll	%l1,	%g3,	%i6
	udiv	%o6,	0x0D6B,	%o2
	addc	%g7,	%o5,	%l3
	lduh	[%l7 + 0x22],	%l4
	lduw	[%l7 + 0x08],	%i4
	ld	[%l7 + 0x4C],	%f31
	movgu	%xcc,	%i2,	%l0
	edge32	%g2,	%i5,	%o3
	movcs	%icc,	%l2,	%i0
	movneg	%xcc,	%l6,	%i3
	array8	%g1,	%o0,	%o7
	popc	0x057D,	%o4
	movneg	%icc,	%g4,	%i7
	fmovdcc	%xcc,	%f19,	%f23
	fandnot2	%f12,	%f16,	%f10
	lduw	[%l7 + 0x44],	%g6
	movgu	%icc,	%i1,	%g5
	subc	%o1,	%l5,	%l1
	andn	%g3,	0x1306,	%i6
	movrne	%o2,	0x205,	%o6
	fmovsge	%xcc,	%f6,	%f21
	fnors	%f8,	%f9,	%f28
	andcc	%g7,	0x1FDA,	%o5
	popc	%l4,	%i4
	sir	0x01A4
	ldx	[%l7 + 0x30],	%l3
	and	%i2,	0x1417,	%l0
	umulcc	%g2,	%i5,	%o3
	movn	%xcc,	%l2,	%i0
	edge32ln	%i3,	%l6,	%g1
	addcc	%o7,	%o0,	%o4
	orcc	%g4,	%i7,	%i1
	ldd	[%l7 + 0x70],	%f2
	sllx	%g6,	%o1,	%l5
	xorcc	%g5,	%l1,	%i6
	subcc	%g3,	%o2,	%o6
	fmovrsgez	%g7,	%f26,	%f25
	movpos	%xcc,	%l4,	%i4
	array8	%l3,	%i2,	%l0
	fmovsgu	%icc,	%f17,	%f12
	orn	%o5,	0x102F,	%g2
	udivcc	%i5,	0x155E,	%l2
	sethi	0x0670,	%o3
	edge16l	%i0,	%i3,	%g1
	movneg	%xcc,	%o7,	%l6
	orcc	%o0,	0x049D,	%o4
	smul	%g4,	%i1,	%i7
	and	%o1,	0x154B,	%l5
	edge32n	%g5,	%g6,	%i6
	edge8n	%g3,	%o2,	%l1
	fpackfix	%f30,	%f28
	movre	%o6,	%g7,	%i4
	movvc	%icc,	%l4,	%i2
	mulscc	%l3,	0x0F3A,	%o5
	fmovdneg	%xcc,	%f19,	%f1
	fmovdgu	%xcc,	%f26,	%f1
	stx	%g2,	[%l7 + 0x60]
	andncc	%l0,	%i5,	%o3
	restore %l2, 0x0AEE, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x14],	%g1
	fmuld8sux16	%f8,	%f5,	%f24
	ldsw	[%l7 + 0x74],	%o7
	movrne	%l6,	%o0,	%o4
	stx	%i0,	[%l7 + 0x38]
	fmovs	%f12,	%f9
	sdivcc	%i1,	0x1313,	%g4
	popc	0x1C5E,	%i7
	array32	%o1,	%g5,	%g6
	movle	%icc,	%i6,	%l5
	movcc	%xcc,	%o2,	%g3
	movrlz	%o6,	%g7,	%i4
	add	%l1,	0x089C,	%l4
	ldsw	[%l7 + 0x70],	%i2
	and	%o5,	%g2,	%l3
	fornot1s	%f4,	%f15,	%f28
	movvs	%xcc,	%l0,	%i5
	fxnors	%f26,	%f16,	%f5
	sllx	%l2,	0x0E,	%i3
	ldsh	[%l7 + 0x78],	%o3
	umulcc	%o7,	%g1,	%o0
	lduw	[%l7 + 0x7C],	%o4
	edge16ln	%l6,	%i0,	%g4
	edge8l	%i7,	%o1,	%i1
	movneg	%icc,	%g6,	%g5
	edge16ln	%l5,	%o2,	%i6
	xor	%o6,	0x18B7,	%g7
	udivx	%g3,	0x0858,	%l1
	fnor	%f30,	%f18,	%f22
	movle	%icc,	%l4,	%i2
	movle	%icc,	%i4,	%g2
	fabsd	%f2,	%f28
	stw	%o5,	[%l7 + 0x6C]
	array8	%l0,	%l3,	%i5
	fone	%f30
	srl	%l2,	%o3,	%o7
	orn	%i3,	0x0494,	%o0
	lduh	[%l7 + 0x70],	%g1
	fmovdleu	%xcc,	%f13,	%f29
	fmovscs	%icc,	%f4,	%f10
	smul	%o4,	%i0,	%l6
	srlx	%i7,	%o1,	%g4
	sllx	%g6,	0x08,	%g5
	fpmerge	%f0,	%f11,	%f2
	sth	%l5,	[%l7 + 0x40]
	andncc	%i1,	%i6,	%o6
	edge16l	%o2,	%g3,	%l1
	fabss	%f4,	%f20
	mulscc	%l4,	0x1A9D,	%g7
	mulscc	%i4,	%g2,	%i2
	fmovsvc	%icc,	%f4,	%f12
	sll	%o5,	0x1F,	%l3
	fmovsl	%xcc,	%f26,	%f15
	fmovsl	%icc,	%f26,	%f20
	udivx	%i5,	0x14E5,	%l0
	edge16	%l2,	%o3,	%i3
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	bshuffle	%f22,	%f30,	%f22
	movcs	%xcc,	%i0,	%l6
	stx	%o4,	[%l7 + 0x70]
	subc	%o1,	%i7,	%g4
	fcmpne16	%f8,	%f14,	%g5
	sdiv	%g6,	0x10EA,	%i1
	movcc	%icc,	%i6,	%l5
	fand	%f30,	%f12,	%f4
	andn	%o6,	0x19DC,	%o2
	fexpand	%f20,	%f14
	movrgez	%l1,	0x23C,	%g3
	save %g7, 0x12E8, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l4,	0x2DA,	%g2
	sethi	0x07B5,	%o5
	array8	%i2,	%i5,	%l0
	mova	%xcc,	%l3,	%l2
	popc	%i3,	%o3
	orcc	%o0,	0x03D8,	%g1
	xorcc	%i0,	0x0D15,	%o7
	xnorcc	%o4,	0x0C60,	%l6
	fpmerge	%f28,	%f19,	%f16
	alignaddr	%i7,	%g4,	%g5
	movrlz	%g6,	%o1,	%i6
	sllx	%l5,	%i1,	%o6
	edge16l	%o2,	%l1,	%g3
	fmovsgu	%icc,	%f3,	%f7
	umul	%g7,	0x0B90,	%i4
	movrgz	%g2,	0x27D,	%o5
	edge8n	%l4,	%i5,	%l0
	fmovscc	%xcc,	%f4,	%f0
	andncc	%i2,	%l2,	%i3
	fmuld8ulx16	%f26,	%f18,	%f0
	movcs	%xcc,	%o3,	%l3
	subc	%o0,	%g1,	%i0
	movpos	%icc,	%o4,	%o7
	mova	%xcc,	%i7,	%l6
	restore %g5, 0x087D, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f10,	%f22
	add	%g6,	0x06D1,	%i6
	addcc	%o1,	%l5,	%i1
	std	%f26,	[%l7 + 0x38]
	movne	%icc,	%o2,	%o6
	fmovdleu	%icc,	%f22,	%f17
	fcmpgt32	%f0,	%f22,	%g3
	sub	%g7,	%i4,	%g2
	andncc	%o5,	%l4,	%l1
	sra	%i5,	%l0,	%i2
	ldub	[%l7 + 0x7E],	%l2
	movre	%o3,	0x228,	%l3
	orn	%o0,	0x03BD,	%i3
	st	%f9,	[%l7 + 0x28]
	movcs	%icc,	%i0,	%o4
	andcc	%o7,	0x0CEB,	%g1
	andn	%l6,	0x1800,	%i7
	orn	%g4,	%g5,	%g6
	orcc	%o1,	0x19E3,	%i6
	alignaddr	%i1,	%o2,	%o6
	save %g3, %g7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l5,	%g2,	%o5
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	movge	%icc,	%l4,	%l0
	ldsb	[%l7 + 0x1E],	%i2
	save %o3, 0x0C99, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o0,	%i3
	srl	%l3,	%o4,	%o7
	xnorcc	%i0,	0x1EBE,	%l6
	ldub	[%l7 + 0x79],	%i7
	popc	%g1,	%g4
	movneg	%xcc,	%g5,	%o1
	movcc	%xcc,	%i6,	%g6
	mulx	%o2,	%i1,	%g3
	fsrc2	%f2,	%f8
	ldub	[%l7 + 0x27],	%o6
	movgu	%icc,	%i4,	%g7
	movrgz	%g2,	%l5,	%o5
	udivx	%i5,	0x013C,	%l1
	fmovdne	%xcc,	%f2,	%f26
	sethi	0x1C8B,	%l0
	nop
	set	0x50, %g3
	ldsb	[%l7 + %g3],	%l4
	umul	%o3,	0x1CEF,	%l2
	umul	%o0,	%i2,	%i3
	fornot1	%f20,	%f6,	%f2
	stx	%l3,	[%l7 + 0x50]
	edge8	%o7,	%o4,	%i0
	fmovsge	%xcc,	%f9,	%f27
	mulscc	%l6,	0x06CE,	%g1
	xorcc	%i7,	%g5,	%g4
	fcmpgt16	%f6,	%f20,	%o1
	movcc	%xcc,	%g6,	%o2
	edge8n	%i6,	%g3,	%i1
	fxors	%f4,	%f18,	%f3
	srlx	%o6,	0x0A,	%i4
	fcmple32	%f20,	%f8,	%g7
	fornot1	%f14,	%f8,	%f18
	srl	%g2,	0x1D,	%l5
	addc	%o5,	0x1443,	%i5
	fmovsg	%xcc,	%f18,	%f20
	movcc	%icc,	%l0,	%l4
	movl	%icc,	%l1,	%o3
	stw	%o0,	[%l7 + 0x20]
	srax	%i2,	0x1D,	%l2
	sll	%i3,	0x14,	%o7
	fmovsneg	%xcc,	%f23,	%f20
	fabsd	%f6,	%f30
	or	%l3,	0x06BF,	%i0
	std	%f2,	[%l7 + 0x08]
	fmovdcc	%icc,	%f26,	%f25
	edge8	%o4,	%l6,	%i7
	andncc	%g1,	%g4,	%o1
	xnor	%g6,	0x0541,	%o2
	xor	%i6,	%g3,	%i1
	movcs	%xcc,	%g5,	%i4
	array8	%o6,	%g2,	%g7
	srax	%l5,	0x18,	%i5
	fand	%f10,	%f14,	%f26
	fmul8x16	%f21,	%f14,	%f24
	siam	0x4
	ldd	[%l7 + 0x68],	%f30
	movge	%xcc,	%o5,	%l0
	fone	%f18
	fpsub16s	%f23,	%f29,	%f15
	edge16l	%l4,	%l1,	%o3
	andncc	%o0,	%l2,	%i2
	fnot1	%f0,	%f26
	ld	[%l7 + 0x20],	%f28
	array32	%o7,	%l3,	%i0
	movrlez	%i3,	%o4,	%i7
	fmovdle	%xcc,	%f3,	%f9
	fornot1s	%f6,	%f18,	%f8
	fxor	%f28,	%f2,	%f16
	alignaddrl	%g1,	%l6,	%o1
	sll	%g4,	%g6,	%o2
	ldd	[%l7 + 0x10],	%g2
	umulcc	%i1,	%i6,	%g5
	edge16n	%i4,	%g2,	%g7
	ldd	[%l7 + 0x68],	%l4
	ldsb	[%l7 + 0x37],	%o6
	addccc	%o5,	0x16D7,	%i5
	fxnors	%f3,	%f26,	%f26
	fmul8ulx16	%f20,	%f14,	%f14
	xor	%l0,	0x04A7,	%l4
	movleu	%xcc,	%l1,	%o0
	mulscc	%l2,	%i2,	%o3
	andcc	%o7,	0x10B9,	%i0
	fpsub16s	%f5,	%f29,	%f29
	edge8ln	%l3,	%i3,	%o4
	ldub	[%l7 + 0x0C],	%i7
	orn	%g1,	0x12E6,	%o1
	movgu	%icc,	%g4,	%l6
	fmovrdgez	%o2,	%f28,	%f26
	addcc	%g3,	%g6,	%i1
	andcc	%g5,	0x10F6,	%i6
	orn	%i4,	%g2,	%l5
	edge16n	%o6,	%o5,	%g7
	udiv	%l0,	0x0510,	%i5
	edge32l	%l4,	%o0,	%l1
	subccc	%i2,	0x1B84,	%o3
	movvc	%icc,	%l2,	%i0
	sll	%o7,	%l3,	%o4
	sethi	0x14AF,	%i3
	smulcc	%g1,	%i7,	%g4
	fsrc1s	%f7,	%f28
	sth	%o1,	[%l7 + 0x38]
	fnors	%f31,	%f0,	%f16
	xnorcc	%o2,	0x197F,	%g3
	array32	%l6,	%g6,	%g5
	movgu	%icc,	%i1,	%i4
	movcs	%xcc,	%g2,	%i6
	subcc	%l5,	%o5,	%g7
	movre	%l0,	0x03D,	%o6
	edge32ln	%l4,	%i5,	%l1
	xor	%i2,	%o0,	%l2
	fornot2s	%f7,	%f18,	%f15
	ldd	[%l7 + 0x30],	%f18
	xnor	%i0,	%o3,	%l3
	orncc	%o4,	%i3,	%g1
	udiv	%o7,	0x0794,	%i7
	sir	0x039D
	ldx	[%l7 + 0x40],	%g4
	udivx	%o2,	0x161D,	%o1
	sra	%l6,	0x0F,	%g3
	edge8l	%g6,	%g5,	%i1
	smulcc	%g2,	0x0520,	%i4
	smulcc	%l5,	%o5,	%i6
	sllx	%l0,	%g7,	%l4
	and	%o6,	0x09EB,	%i5
	fsrc1	%f12,	%f2
	movne	%icc,	%i2,	%l1
	edge32	%l2,	%i0,	%o0
	udivcc	%l3,	0x1906,	%o3
	ldub	[%l7 + 0x0A],	%o4
	alignaddrl	%g1,	%o7,	%i3
	fones	%f13
	addccc	%i7,	%o2,	%o1
	smulcc	%g4,	%g3,	%l6
	fandnot1	%f24,	%f30,	%f18
	sth	%g6,	[%l7 + 0x30]
	fmovrdgez	%g5,	%f20,	%f30
	movneg	%icc,	%g2,	%i1
	mulscc	%l5,	%i4,	%i6
	st	%f30,	[%l7 + 0x10]
	addccc	%l0,	0x151A,	%g7
	ld	[%l7 + 0x68],	%f29
	fpsub32	%f2,	%f12,	%f16
	movrlez	%l4,	%o5,	%i5
	umulcc	%o6,	0x1427,	%l1
	udivcc	%i2,	0x1C7A,	%i0
	fnot1	%f6,	%f24
	edge32l	%l2,	%o0,	%o3
	array16	%l3,	%g1,	%o7
	movneg	%xcc,	%i3,	%o4
	fxnor	%f2,	%f28,	%f6
	sub	%i7,	%o1,	%o2
	ldd	[%l7 + 0x60],	%f2
	edge16ln	%g4,	%l6,	%g3
	mulx	%g6,	%g2,	%i1
	addcc	%g5,	0x1662,	%i4
	movrgz	%i6,	0x17C,	%l0
	edge32ln	%l5,	%l4,	%g7
	edge32n	%i5,	%o6,	%o5
	addc	%i2,	0x1937,	%i0
	ldsw	[%l7 + 0x64],	%l2
	andn	%l1,	0x1C93,	%o0
	std	%f22,	[%l7 + 0x58]
	sethi	0x1189,	%l3
	lduh	[%l7 + 0x3A],	%o3
	sra	%g1,	0x0C,	%o7
	or	%o4,	%i7,	%i3
	movne	%icc,	%o1,	%g4
	stx	%o2,	[%l7 + 0x10]
	movge	%xcc,	%g3,	%l6
	fnot1s	%f5,	%f12
	std	%f20,	[%l7 + 0x38]
	fnegd	%f16,	%f12
	add	%g6,	0x1432,	%g2
	fmovsl	%xcc,	%f17,	%f31
	movre	%i1,	%g5,	%i6
	edge16l	%i4,	%l0,	%l5
	fone	%f28
	sub	%g7,	0x0907,	%l4
	ldd	[%l7 + 0x08],	%o6
	subc	%i5,	%i2,	%o5
	fmovsne	%icc,	%f14,	%f21
	ldsb	[%l7 + 0x0D],	%i0
	andn	%l1,	0x1C40,	%l2
	move	%icc,	%l3,	%o3
	edge16l	%o0,	%o7,	%o4
	fmovrse	%g1,	%f0,	%f9
	movrne	%i3,	%o1,	%g4
	xorcc	%o2,	%g3,	%l6
	mova	%xcc,	%i7,	%g6
	sll	%g2,	0x17,	%i1
	ldx	[%l7 + 0x10],	%g5
	edge8l	%i6,	%i4,	%l5
	st	%f11,	[%l7 + 0x24]
	mova	%icc,	%l0,	%g7
	sdiv	%o6,	0x19C0,	%i5
	sub	%l4,	0x1310,	%o5
	fabsd	%f0,	%f12
	edge32n	%i2,	%l1,	%l2
	fpsub16s	%f11,	%f17,	%f9
	sllx	%l3,	%o3,	%i0
	subccc	%o7,	%o4,	%g1
	movn	%icc,	%i3,	%o1
	ldub	[%l7 + 0x46],	%g4
	fnand	%f20,	%f6,	%f12
	array16	%o2,	%o0,	%l6
	movleu	%xcc,	%i7,	%g6
	movgu	%icc,	%g2,	%i1
	fpadd32s	%f20,	%f29,	%f1
	sth	%g3,	[%l7 + 0x2C]
	ldub	[%l7 + 0x19],	%g5
	edge32n	%i4,	%l5,	%i6
	ldd	[%l7 + 0x28],	%f22
	smul	%g7,	%o6,	%i5
	edge8	%l0,	%l4,	%o5
	ldx	[%l7 + 0x20],	%i2
	movrlez	%l1,	%l2,	%l3
	array32	%i0,	%o3,	%o4
	subccc	%g1,	%i3,	%o7
	mova	%xcc,	%g4,	%o1
	and	%o0,	%l6,	%o2
	movrgez	%g6,	0x120,	%i7
	fmuld8sux16	%f2,	%f10,	%f8
	sra	%g2,	0x19,	%g3
	xor	%g5,	0x1F91,	%i1
	edge32ln	%i4,	%l5,	%g7
	alignaddrl	%o6,	%i5,	%l0
	edge16l	%l4,	%o5,	%i2
	andncc	%i6,	%l1,	%l2
	xnor	%i0,	%l3,	%o4
	movrlz	%o3,	%i3,	%o7
	ldsw	[%l7 + 0x74],	%g1
	add	%o1,	%o0,	%g4
	fpmerge	%f6,	%f12,	%f0
	fmovs	%f5,	%f22
	edge16n	%o2,	%l6,	%g6
	and	%i7,	%g3,	%g2
	mova	%icc,	%g5,	%i4
	edge32ln	%l5,	%i1,	%o6
	popc	%i5,	%g7
	movcc	%icc,	%l0,	%l4
	smulcc	%i2,	0x1E3A,	%i6
	ldsw	[%l7 + 0x68],	%l1
	bshuffle	%f10,	%f4,	%f0
	sdiv	%l2,	0x1767,	%o5
	st	%f17,	[%l7 + 0x24]
	fexpand	%f30,	%f18
	fnor	%f28,	%f30,	%f10
	edge8	%i0,	%o4,	%l3
	fpack16	%f4,	%f4
	movle	%icc,	%i3,	%o3
	srl	%o7,	0x08,	%o1
	umul	%o0,	0x1BE1,	%g1
	edge8l	%g4,	%l6,	%g6
	save %o2, 0x0B9E, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g3,	%g2
	edge16ln	%i4,	%g5,	%i1
	sub	%o6,	0x02AA,	%l5
	orn	%g7,	%l0,	%i5
	srax	%l4,	0x18,	%i6
	orcc	%i2,	%l2,	%l1
	movvc	%xcc,	%i0,	%o4
	edge16ln	%l3,	%i3,	%o3
	restore %o5, 0x0E49, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x14],	%o1
	xnorcc	%o0,	%g4,	%g1
	movpos	%icc,	%g6,	%l6
	fmovdn	%icc,	%f2,	%f31
	fpack32	%f2,	%f18,	%f8
	nop
	set	0x4C, %l1
	ldsw	[%l7 + %l1],	%o2
	movl	%xcc,	%i7,	%g3
	alignaddrl	%i4,	%g5,	%g2
	movrgz	%i1,	%l5,	%g7
	movcc	%xcc,	%o6,	%l0
	nop
	set	0x38, %g4
	sth	%l4,	[%l7 + %g4]
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	sir	0x1928
	sra	%l2,	%l1,	%i0
	udiv	%l3,	0x1D56,	%o4
	fmovsne	%xcc,	%f2,	%f21
	orcc	%o3,	0x13DD,	%i3
	udiv	%o5,	0x18CB,	%o7
	sth	%o1,	[%l7 + 0x56]
	edge32ln	%o0,	%g4,	%g6
	alignaddr	%l6,	%o2,	%i7
	fexpand	%f7,	%f12
	fnot2s	%f21,	%f26
	fmovse	%xcc,	%f23,	%f26
	fpack16	%f20,	%f26
	fabsd	%f0,	%f22
	addccc	%g3,	%g1,	%g5
	movne	%icc,	%g2,	%i1
	movrgez	%l5,	0x2BD,	%g7
	andcc	%i4,	%o6,	%l4
	lduw	[%l7 + 0x18],	%l0
	or	%i6,	0x1F63,	%i5
	sra	%i2,	%l1,	%l2
	alignaddr	%i0,	%o4,	%l3
	fabsd	%f12,	%f0
	fcmps	%fcc1,	%f21,	%f0
	movpos	%icc,	%i3,	%o3
	add	%o7,	%o5,	%o1
	alignaddr	%g4,	%g6,	%o0
	movle	%xcc,	%o2,	%l6
	sethi	0x0078,	%i7
	movcs	%xcc,	%g3,	%g1
	andcc	%g2,	%i1,	%g5
	popc	%l5,	%i4
	mulscc	%g7,	%l4,	%l0
	movrlez	%i6,	0x3DE,	%o6
	ldsh	[%l7 + 0x3E],	%i2
	ldub	[%l7 + 0x2C],	%i5
	edge16ln	%l2,	%i0,	%o4
	edge16l	%l1,	%l3,	%i3
	movne	%icc,	%o3,	%o7
	array8	%o1,	%o5,	%g4
	movgu	%icc,	%g6,	%o0
	addccc	%o2,	%l6,	%i7
	edge8	%g3,	%g1,	%g2
	fmovrse	%g5,	%f18,	%f31
	array32	%l5,	%i4,	%i1
	xnorcc	%l4,	0x1769,	%l0
	movre	%g7,	%o6,	%i2
	udiv	%i6,	0x0A4C,	%i5
	movrgez	%i0,	0x322,	%l2
	edge8l	%o4,	%l3,	%i3
	ldsh	[%l7 + 0x1A],	%o3
	fnot2s	%f28,	%f31
	movle	%icc,	%o7,	%o1
	fmul8x16au	%f23,	%f17,	%f10
	xnorcc	%l1,	%o5,	%g6
	xorcc	%o0,	0x02BB,	%g4
	srlx	%o2,	%i7,	%l6
	fpsub32s	%f28,	%f30,	%f24
	srlx	%g3,	%g1,	%g2
	ld	[%l7 + 0x08],	%f29
	ld	[%l7 + 0x48],	%f8
	movcc	%xcc,	%l5,	%g5
	movpos	%icc,	%i4,	%i1
	andncc	%l0,	%l4,	%g7
	srlx	%o6,	%i6,	%i2
	orn	%i0,	%i5,	%o4
	sdivx	%l2,	0x161F,	%l3
	edge16n	%i3,	%o3,	%o7
	array16	%o1,	%o5,	%g6
	faligndata	%f2,	%f20,	%f28
	srl	%o0,	0x1B,	%g4
	movne	%xcc,	%o2,	%i7
	fmovdvc	%icc,	%f29,	%f19
	fmovdvs	%xcc,	%f16,	%f9
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%i6
	add	%l1,	%g3,	%g2
	fnor	%f18,	%f28,	%f2
	sethi	0x162F,	%g1
	fpackfix	%f0,	%f12
	edge8ln	%g5,	%i4,	%i1
	movl	%xcc,	%l0,	%l5
	fmovsn	%icc,	%f24,	%f3
	xorcc	%g7,	%l4,	%i6
	sdiv	%o6,	0x1771,	%i0
	edge16ln	%i5,	%o4,	%l2
	fxnors	%f18,	%f5,	%f27
	fsrc1	%f30,	%f0
	stb	%l3,	[%l7 + 0x28]
	add	%i2,	0x116B,	%i3
	movcc	%xcc,	%o7,	%o3
	nop
	set	0x20, %l0
	std	%f2,	[%l7 + %l0]
	nop
	set	0x3B, %o1
	ldub	[%l7 + %o1],	%o1
	array32	%o5,	%o0,	%g6
	andcc	%g4,	0x1DA7,	%o2
	srax	%l6,	0x04,	%i7
	umulcc	%l1,	%g3,	%g1
	movleu	%xcc,	%g2,	%g5
	edge16ln	%i1,	%l0,	%l5
	popc	0x0234,	%g7
	movg	%xcc,	%i4,	%i6
	movrlz	%l4,	%i0,	%o6
	edge8	%i5,	%o4,	%l2
	fmovdle	%icc,	%f16,	%f10
	mulx	%i2,	0x170C,	%i3
	udivcc	%l3,	0x00B5,	%o7
	array16	%o3,	%o1,	%o0
	movleu	%icc,	%o5,	%g6
	popc	%o2,	%l6
	edge16ln	%i7,	%g4,	%l1
	ldd	[%l7 + 0x10],	%g2
	edge32ln	%g1,	%g2,	%i1
	move	%icc,	%l0,	%l5
	edge16l	%g7,	%i4,	%g5
	save %i6, 0x01F1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f14,	%f24,	%f30
	orn	%i0,	%o6,	%o4
	mova	%xcc,	%i5,	%l2
	fmovd	%f16,	%f18
	fmovscs	%icc,	%f24,	%f23
	orn	%i3,	0x1551,	%l3
	movrgz	%i2,	%o7,	%o1
	lduw	[%l7 + 0x2C],	%o0
	fmovscs	%xcc,	%f31,	%f24
	ld	[%l7 + 0x60],	%f15
	ldd	[%l7 + 0x60],	%f16
	xor	%o3,	%o5,	%o2
	movrgez	%g6,	%l6,	%g4
	orn	%i7,	%g3,	%l1
	fpsub32	%f4,	%f10,	%f30
	restore %g2, %i1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l5,	%g1,	%g7
	movvs	%xcc,	%i4,	%i6
	st	%f5,	[%l7 + 0x64]
	movg	%xcc,	%g5,	%l4
	stb	%o6,	[%l7 + 0x7E]
	fmovdne	%icc,	%f29,	%f31
	movgu	%icc,	%o4,	%i5
	fmovrslz	%i0,	%f30,	%f20
	array8	%i3,	%l2,	%i2
	movrlez	%l3,	%o7,	%o0
	mulx	%o3,	%o1,	%o5
	fandnot1s	%f6,	%f21,	%f19
	fmul8x16au	%f0,	%f19,	%f26
	movvc	%icc,	%o2,	%l6
	fpack32	%f8,	%f16,	%f6
	andn	%g6,	%i7,	%g4
	array32	%l1,	%g2,	%i1
	edge8n	%l0,	%l5,	%g1
	movvs	%xcc,	%g3,	%i4
	srax	%i6,	0x09,	%g5
	ldsh	[%l7 + 0x68],	%l4
	edge32l	%g7,	%o6,	%o4
	fmovdg	%icc,	%f4,	%f14
	ldsh	[%l7 + 0x52],	%i5
	udivx	%i3,	0x0D3B,	%i0
	addccc	%i2,	%l3,	%l2
	sllx	%o7,	0x1B,	%o3
	andncc	%o1,	%o5,	%o2
	addccc	%o0,	0x1B6B,	%g6
	fmovrsne	%l6,	%f29,	%f2
	ld	[%l7 + 0x18],	%f25
	or	%g4,	%i7,	%l1
	addcc	%i1,	%g2,	%l0
	xnor	%g1,	0x0CD5,	%g3
	sth	%i4,	[%l7 + 0x56]
	smulcc	%i6,	%l5,	%g5
	movvc	%icc,	%l4,	%o6
	fmovsleu	%xcc,	%f12,	%f17
	edge16ln	%o4,	%i5,	%i3
	save %i0, %i2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l2,	%g7,	%o7
	movrlez	%o3,	0x05E,	%o1
	popc	%o2,	%o5
	orncc	%g6,	0x0525,	%l6
	mova	%icc,	%g4,	%i7
	movrne	%l1,	0x32B,	%i1
	orcc	%g2,	%l0,	%g1
	addcc	%g3,	0x1A76,	%i4
	xnorcc	%i6,	%o0,	%g5
	movgu	%xcc,	%l4,	%o6
	edge16ln	%o4,	%l5,	%i3
	udivcc	%i5,	0x1FFF,	%i0
	movrne	%l3,	%i2,	%l2
	move	%xcc,	%g7,	%o7
	std	%f4,	[%l7 + 0x58]
	fnegs	%f7,	%f13
	add	%o3,	0x18B5,	%o2
	addcc	%o5,	0x1219,	%g6
	sth	%o1,	[%l7 + 0x48]
	edge32ln	%g4,	%l6,	%l1
	fornot2s	%f25,	%f1,	%f31
	andncc	%i1,	%i7,	%l0
	umul	%g1,	%g2,	%i4
	fsrc2	%f2,	%f14
	andn	%g3,	0x00F9,	%i6
	stx	%o0,	[%l7 + 0x48]
	edge32n	%g5,	%o6,	%l4
	movvc	%icc,	%o4,	%i3
	fmovrdgz	%i5,	%f10,	%f18
	edge8l	%l5,	%i0,	%i2
	sdivcc	%l2,	0x166B,	%l3
	sub	%o7,	%g7,	%o2
	udiv	%o5,	0x0479,	%g6
	nop
	set	0x30, %l5
	std	%f20,	[%l7 + %l5]
	ldub	[%l7 + 0x55],	%o1
	sethi	0x1E9F,	%o3
	sub	%l6,	0x0C92,	%l1
	addccc	%g4,	%i7,	%l0
	umul	%g1,	%i1,	%i4
	fmovrdne	%g3,	%f16,	%f12
	sdivcc	%g2,	0x06F7,	%i6
	movre	%g5,	0x046,	%o0
	nop
	set	0x60, %i3
	ldx	[%l7 + %i3],	%l4
	movgu	%xcc,	%o4,	%i3
	smulcc	%o6,	0x141E,	%l5
	fmovsvs	%xcc,	%f11,	%f13
	orn	%i5,	%i2,	%i0
	movl	%icc,	%l2,	%l3
	edge16ln	%g7,	%o7,	%o2
	fmovsge	%xcc,	%f0,	%f21
	udivcc	%g6,	0x0239,	%o5
	fcmpeq16	%f6,	%f14,	%o3
	subccc	%o1,	%l1,	%g4
	fornot2s	%f29,	%f10,	%f28
	fmovsn	%xcc,	%f11,	%f7
	mulx	%l6,	0x1308,	%i7
	fcmpgt32	%f12,	%f4,	%l0
	fxnor	%f2,	%f26,	%f14
	fpsub16s	%f0,	%f6,	%f0
	ldsb	[%l7 + 0x27],	%i1
	ldsw	[%l7 + 0x4C],	%i4
	movg	%xcc,	%g1,	%g3
	subccc	%i6,	0x15A2,	%g5
	srl	%g2,	%o0,	%l4
	fmul8x16al	%f8,	%f31,	%f20
	srax	%o4,	0x13,	%i3
	ldd	[%l7 + 0x30],	%o6
	movrgez	%l5,	%i2,	%i0
	edge8	%i5,	%l3,	%g7
	lduh	[%l7 + 0x6C],	%o7
	movcs	%icc,	%l2,	%g6
	popc	0x0263,	%o5
	edge16n	%o2,	%o1,	%o3
	and	%g4,	%l6,	%i7
	add	%l1,	0x0A8A,	%i1
	mulscc	%i4,	%l0,	%g3
	sth	%i6,	[%l7 + 0x10]
	movgu	%icc,	%g1,	%g5
	andcc	%o0,	0x1CDC,	%g2
	subccc	%l4,	0x1154,	%o4
	fmovde	%xcc,	%f19,	%f15
	orncc	%o6,	%i3,	%i2
	std	%f10,	[%l7 + 0x28]
	edge32	%i0,	%i5,	%l5
	sll	%l3,	0x10,	%g7
	subcc	%o7,	%g6,	%o5
	mulscc	%l2,	0x0692,	%o2
	fmovd	%f6,	%f18
	sub	%o1,	0x02E8,	%g4
	movvs	%icc,	%o3,	%l6
	move	%icc,	%i7,	%l1
	fzero	%f0
	nop
	set	0x3A, %l2
	lduh	[%l7 + %l2],	%i1
	fmovdcs	%icc,	%f25,	%f26
	movrlez	%l0,	0x09C,	%g3
	fmovsn	%xcc,	%f14,	%f18
	movpos	%icc,	%i4,	%g1
	movn	%xcc,	%g5,	%i6
	fabss	%f7,	%f17
	stb	%o0,	[%l7 + 0x40]
	move	%xcc,	%g2,	%l4
	fsrc2s	%f15,	%f28
	fmovs	%f22,	%f10
	stx	%o6,	[%l7 + 0x60]
	nop
	set	0x6C, %g1
	ldub	[%l7 + %g1],	%i3
	umulcc	%o4,	%i0,	%i5
	lduw	[%l7 + 0x74],	%l5
	fmovrsgez	%l3,	%f5,	%f3
	bshuffle	%f26,	%f14,	%f0
	fmul8x16	%f7,	%f24,	%f14
	fnor	%f26,	%f26,	%f30
	fmovsgu	%icc,	%f9,	%f0
	xnor	%i2,	%o7,	%g7
	andn	%g6,	%o5,	%o2
	movcc	%xcc,	%o1,	%l2
	srl	%g4,	0x19,	%l6
	edge8	%i7,	%o3,	%l1
	fandnot2s	%f14,	%f8,	%f1
	movcs	%icc,	%i1,	%g3
	andncc	%l0,	%g1,	%i4
	fmovrde	%g5,	%f4,	%f22
	orcc	%o0,	%g2,	%l4
	fmovsl	%xcc,	%f23,	%f0
	movg	%icc,	%i6,	%o6
	movl	%icc,	%o4,	%i0
	movneg	%xcc,	%i5,	%i3
	stw	%l5,	[%l7 + 0x6C]
	std	%f24,	[%l7 + 0x78]
	move	%icc,	%l3,	%o7
	std	%f14,	[%l7 + 0x68]
	fmovspos	%xcc,	%f23,	%f10
	addcc	%i2,	%g6,	%g7
	ldsw	[%l7 + 0x40],	%o2
	subcc	%o5,	0x1675,	%l2
	sethi	0x1AEF,	%g4
	movcc	%xcc,	%l6,	%o1
	movre	%i7,	0x221,	%l1
	srlx	%o3,	%g3,	%i1
	fcmpeq16	%f24,	%f10,	%g1
	stw	%i4,	[%l7 + 0x1C]
	alignaddrl	%l0,	%g5,	%o0
	orn	%g2,	0x0632,	%i6
	sethi	0x003D,	%l4
	addcc	%o6,	%o4,	%i5
	array32	%i0,	%l5,	%l3
	fnot2	%f8,	%f14
	ldub	[%l7 + 0x58],	%o7
	addccc	%i3,	%i2,	%g7
	xnorcc	%g6,	%o5,	%o2
	lduh	[%l7 + 0x5C],	%l2
	sethi	0x160E,	%l6
	sth	%g4,	[%l7 + 0x1A]
	fands	%f8,	%f28,	%f10
	fmovd	%f30,	%f14
	movrgz	%i7,	0x2E9,	%o1
	array8	%o3,	%l1,	%g3
	umul	%g1,	%i4,	%i1
	movrgz	%l0,	%o0,	%g5
	movneg	%icc,	%i6,	%g2
	st	%f30,	[%l7 + 0x40]
	sir	0x112C
	movrgz	%o6,	0x05F,	%l4
	fandnot2s	%f22,	%f27,	%f25
	fzeros	%f8
	fnot1	%f8,	%f6
	fmul8x16au	%f13,	%f1,	%f24
	andncc	%i5,	%o4,	%l5
	fpsub16s	%f11,	%f11,	%f22
	edge32ln	%i0,	%l3,	%o7
	fmul8x16	%f16,	%f18,	%f28
	orncc	%i2,	0x1F6E,	%i3
	edge16n	%g6,	%o5,	%g7
	movne	%icc,	%o2,	%l6
	fabss	%f13,	%f24
	fmovdpos	%icc,	%f23,	%f5
	movvc	%xcc,	%g4,	%l2
	ldsw	[%l7 + 0x28],	%i7
	st	%f20,	[%l7 + 0x10]
	fcmpd	%fcc2,	%f8,	%f0
	mova	%icc,	%o1,	%l1
	stw	%o3,	[%l7 + 0x7C]
	movne	%xcc,	%g1,	%g3
	orn	%i1,	0x0F4F,	%i4
	xnorcc	%o0,	%g5,	%l0
	edge16n	%i6,	%g2,	%l4
	andn	%i5,	%o6,	%o4
	fmovsl	%icc,	%f0,	%f14
	fabss	%f29,	%f13
	lduh	[%l7 + 0x56],	%l5
	orncc	%l3,	0x049C,	%i0
	fnegs	%f14,	%f3
	edge8	%o7,	%i3,	%g6
	faligndata	%f20,	%f20,	%f30
	edge16	%o5,	%i2,	%o2
	fxor	%f30,	%f30,	%f18
	fors	%f12,	%f29,	%f7
	movg	%icc,	%g7,	%g4
	array16	%l6,	%i7,	%o1
	ldd	[%l7 + 0x60],	%f26
	move	%icc,	%l1,	%l2
	array8	%o3,	%g3,	%i1
	movrgz	%g1,	0x1B1,	%o0
	sdivcc	%g5,	0x0387,	%i4
	movne	%icc,	%l0,	%g2
	fnot1s	%f31,	%f11
	orcc	%l4,	0x046A,	%i6
	addccc	%i5,	0x0D5E,	%o4
	fmovdgu	%icc,	%f1,	%f28
	movrlez	%o6,	%l5,	%i0
	fmovdl	%xcc,	%f29,	%f18
	fnegs	%f0,	%f11
	fcmpne16	%f18,	%f4,	%l3
	edge32n	%i3,	%g6,	%o7
	nop
	set	0x40, %l3
	ldsh	[%l7 + %l3],	%o5
	addcc	%i2,	%o2,	%g4
	fmul8ulx16	%f18,	%f10,	%f20
	andncc	%l6,	%i7,	%o1
	lduw	[%l7 + 0x7C],	%g7
	movne	%icc,	%l2,	%o3
	movrlz	%g3,	%l1,	%g1
	sdiv	%o0,	0x1DD4,	%i1
	sra	%g5,	%l0,	%i4
	fmul8x16au	%f1,	%f23,	%f4
	edge16ln	%g2,	%i6,	%i5
	std	%f14,	[%l7 + 0x38]
	andcc	%o4,	%l4,	%o6
	ldub	[%l7 + 0x62],	%l5
	edge8	%l3,	%i0,	%i3
	addc	%g6,	0x0380,	%o5
	movre	%o7,	%o2,	%g4
	movne	%xcc,	%i2,	%i7
	movl	%icc,	%o1,	%g7
	edge32ln	%l2,	%o3,	%l6
	edge8n	%g3,	%g1,	%l1
	sll	%i1,	%o0,	%l0
	srl	%i4,	%g2,	%g5
	ldub	[%l7 + 0x3B],	%i5
	movcs	%xcc,	%o4,	%i6
	movpos	%xcc,	%l4,	%l5
	fxors	%f3,	%f11,	%f9
	ldd	[%l7 + 0x48],	%f8
	fmovdge	%xcc,	%f26,	%f21
	lduw	[%l7 + 0x18],	%o6
	move	%xcc,	%l3,	%i0
	ld	[%l7 + 0x08],	%f18
	ldsw	[%l7 + 0x20],	%i3
	xnor	%g6,	0x1C7E,	%o5
	edge8ln	%o2,	%g4,	%i2
	umulcc	%i7,	%o7,	%g7
	sub	%o1,	0x1FB4,	%o3
	srlx	%l6,	%l2,	%g1
	edge16n	%g3,	%l1,	%o0
	movcc	%icc,	%i1,	%l0
	subc	%i4,	%g5,	%i5
	sth	%g2,	[%l7 + 0x50]
	movgu	%icc,	%o4,	%l4
	sdiv	%i6,	0x1385,	%l5
	orn	%l3,	%o6,	%i0
	movrlz	%g6,	%o5,	%i3
	xor	%o2,	0x0812,	%g4
	fone	%f0
	edge32l	%i2,	%o7,	%g7
	addcc	%i7,	%o1,	%o3
	fmul8sux16	%f30,	%f16,	%f16
	array32	%l6,	%g1,	%g3
	addccc	%l2,	%l1,	%i1
	sir	0x0605
	movvc	%icc,	%o0,	%l0
	fmul8x16al	%f21,	%f4,	%f12
	nop
	set	0x38, %i4
	ldx	[%l7 + %i4],	%g5
	fpadd32s	%f16,	%f18,	%f0
	sub	%i4,	0x02EB,	%i5
	ldsb	[%l7 + 0x60],	%g2
	movrgez	%l4,	%i6,	%l5
	fmovscc	%xcc,	%f6,	%f10
	fcmpne16	%f10,	%f26,	%o4
	fmovsgu	%xcc,	%f22,	%f9
	mova	%icc,	%l3,	%i0
	ldx	[%l7 + 0x30],	%g6
	andncc	%o6,	%o5,	%o2
	stw	%i3,	[%l7 + 0x20]
	sdivx	%i2,	0x1EE4,	%o7
	sethi	0x1D6F,	%g7
	srax	%i7,	0x14,	%o1
	udiv	%g4,	0x0B49,	%l6
	or	%o3,	%g1,	%g3
	movrne	%l2,	%l1,	%o0
	xnorcc	%l0,	0x124C,	%i1
	sethi	0x0EB8,	%g5
	fornot1	%f24,	%f18,	%f2
	movcs	%xcc,	%i5,	%g2
	edge32n	%l4,	%i4,	%i6
	subcc	%l5,	0x0CBB,	%l3
	siam	0x0
	edge16ln	%i0,	%g6,	%o6
	fcmple32	%f8,	%f4,	%o4
	movg	%icc,	%o5,	%o2
	ldub	[%l7 + 0x71],	%i3
	movge	%icc,	%o7,	%g7
	movn	%icc,	%i2,	%i7
	movne	%xcc,	%g4,	%o1
	edge8ln	%l6,	%o3,	%g3
	movre	%g1,	0x166,	%l1
	fpadd32s	%f6,	%f29,	%f3
	ldx	[%l7 + 0x78],	%l2
	fmovdcs	%xcc,	%f3,	%f2
	addccc	%o0,	%i1,	%g5
	fxnor	%f16,	%f20,	%f12
	movcc	%xcc,	%i5,	%l0
	nop
	set	0x7A, %l6
	ldsh	[%l7 + %l6],	%l4
	orcc	%i4,	0x0E11,	%i6
	fpsub16	%f18,	%f0,	%f28
	orn	%g2,	%l5,	%i0
	stx	%g6,	[%l7 + 0x50]
	mulscc	%l3,	%o4,	%o5
	sethi	0x1683,	%o6
	st	%f9,	[%l7 + 0x58]
	movrgz	%i3,	%o7,	%o2
	movcc	%xcc,	%i2,	%g7
	fmovrdgz	%g4,	%f22,	%f0
	alignaddrl	%i7,	%l6,	%o3
	andcc	%o1,	0x1C34,	%g1
	sth	%l1,	[%l7 + 0x2E]
	fmovsvc	%icc,	%f29,	%f28
	fnors	%f9,	%f18,	%f27
	movcc	%icc,	%g3,	%l2
	mova	%xcc,	%o0,	%g5
	nop
	set	0x62, %g7
	sth	%i1,	[%l7 + %g7]
	movgu	%icc,	%l0,	%l4
	fmovdge	%xcc,	%f30,	%f24
	addc	%i4,	0x0EBE,	%i6
	edge8	%g2,	%l5,	%i0
	sth	%g6,	[%l7 + 0x20]
	std	%f4,	[%l7 + 0x20]
	sth	%l3,	[%l7 + 0x6E]
	movg	%xcc,	%o4,	%o5
	mova	%xcc,	%o6,	%i3
	fmovsneg	%xcc,	%f24,	%f0
	umul	%o7,	%i5,	%i2
	array8	%g7,	%g4,	%i7
	fnot2s	%f9,	%f26
	fpsub16	%f12,	%f10,	%f30
	addccc	%o2,	0x05FC,	%l6
	fabsd	%f14,	%f22
	edge16	%o3,	%o1,	%l1
	andcc	%g1,	%l2,	%o0
	fpackfix	%f22,	%f14
	fmovse	%xcc,	%f22,	%f20
	mova	%xcc,	%g3,	%g5
	fmovrsgez	%l0,	%f27,	%f23
	mulscc	%l4,	0x013A,	%i4
	fones	%f0
	stx	%i1,	[%l7 + 0x78]
	sra	%i6,	0x15,	%l5
	movrlez	%g2,	%i0,	%g6
	edge16	%o4,	%o5,	%l3
	edge16	%o6,	%o7,	%i5
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	array8	%i7,	%o2,	%l6
	edge8n	%g4,	%o3,	%o1
	xnor	%g1,	%l2,	%o0
	fmovse	%xcc,	%f16,	%f20
	andcc	%g3,	0x1EAA,	%g5
	edge32	%l1,	%l4,	%i4
	movneg	%icc,	%l0,	%i6
	and	%l5,	0x0491,	%i1
	stx	%g2,	[%l7 + 0x68]
	movcs	%icc,	%g6,	%o4
	save %i0, 0x1A5E, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	%o6,	%i5
	smulcc	%o7,	0x06FC,	%i3
	edge8n	%g7,	%i7,	%o2
	edge16l	%l6,	%g4,	%i2
	sethi	0x0CF4,	%o3
	srlx	%o1,	%g1,	%l2
	fandnot1	%f20,	%f26,	%f20
	stb	%o0,	[%l7 + 0x2A]
	movgu	%xcc,	%g3,	%l1
	subccc	%g5,	0x09F1,	%l4
	array32	%l0,	%i6,	%i4
	andcc	%l5,	%i1,	%g2
	edge16ln	%o4,	%g6,	%l3
	siam	0x0
	addcc	%o5,	%o6,	%i5
	array16	%i0,	%o7,	%i3
	movle	%xcc,	%g7,	%o2
	fands	%f7,	%f17,	%f19
	udiv	%l6,	0x0D61,	%i7
	movrlz	%i2,	%g4,	%o3
	fcmple16	%f6,	%f22,	%o1
	sll	%g1,	0x06,	%o0
	movge	%xcc,	%g3,	%l2
	edge8n	%l1,	%g5,	%l0
	movneg	%xcc,	%i6,	%l4
	udivx	%i4,	0x0AB8,	%i1
	umulcc	%l5,	0x000A,	%o4
	array8	%g6,	%l3,	%o5
	edge32n	%g2,	%o6,	%i5
	fcmpeq32	%f26,	%f10,	%i0
	andcc	%i3,	0x1064,	%o7
	fmovrslez	%o2,	%f2,	%f19
	addc	%g7,	%l6,	%i7
	fpadd16	%f18,	%f20,	%f2
	edge16	%g4,	%o3,	%o1
	nop
	set	0x78, %l4
	ldd	[%l7 + %l4],	%f26
	alignaddrl	%g1,	%o0,	%i2
	and	%l2,	%g3,	%l1
	movrne	%l0,	%g5,	%i6
	fcmple32	%f18,	%f4,	%l4
	mova	%xcc,	%i1,	%l5
	movrne	%i4,	%o4,	%g6
	fmovdvs	%xcc,	%f8,	%f20
	movneg	%icc,	%o5,	%l3
	sdivx	%g2,	0x039E,	%o6
	movne	%xcc,	%i0,	%i5
	array16	%o7,	%i3,	%g7
	sdivcc	%o2,	0x16E3,	%i7
	andn	%g4,	0x0B8C,	%o3
	fpmerge	%f27,	%f22,	%f6
	add	%o1,	%l6,	%g1
	movgu	%xcc,	%o0,	%l2
	edge16n	%i2,	%g3,	%l0
	movre	%l1,	%i6,	%g5
	orn	%l4,	%i1,	%l5
	xnorcc	%i4,	%g6,	%o4
	movneg	%icc,	%o5,	%g2
	orcc	%l3,	%i0,	%o6
	sir	0x15AA
	fmovsgu	%xcc,	%f5,	%f5
	sth	%i5,	[%l7 + 0x72]
	fpadd32	%f2,	%f14,	%f2
	stb	%o7,	[%l7 + 0x55]
	edge32l	%g7,	%i3,	%o2
	edge32n	%g4,	%i7,	%o1
	movne	%icc,	%l6,	%o3
	movl	%icc,	%o0,	%l2
	save %i2, 0x0BBE, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l0,	0x12B7,	%g1
	sdivx	%l1,	0x0119,	%g5
	edge8ln	%i6,	%l4,	%i1
	andcc	%i4,	%g6,	%l5
	xorcc	%o4,	0x046F,	%g2
	addccc	%o5,	0x0C5A,	%l3
	sll	%o6,	0x09,	%i5
	orncc	%i0,	0x1745,	%g7
	sir	0x1DED
	edge16n	%o7,	%o2,	%i3
	srlx	%g4,	%i7,	%l6
	movcc	%icc,	%o3,	%o1
	movcs	%xcc,	%o0,	%i2
	edge16	%l2,	%l0,	%g3
	fmovsg	%xcc,	%f9,	%f21
	restore %l1, %g5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g1,	%l4,	%i4
	fandnot1	%f20,	%f28,	%f26
	alignaddrl	%i1,	%l5,	%g6
	sdiv	%o4,	0x088D,	%g2
	movgu	%icc,	%l3,	%o5
	std	%f12,	[%l7 + 0x28]
	fmovdpos	%icc,	%f10,	%f17
	or	%o6,	%i0,	%g7
	udiv	%o7,	0x1B5A,	%i5
	fmovdg	%icc,	%f1,	%f11
	fone	%f24
	movle	%icc,	%i3,	%o2
	fmovspos	%xcc,	%f7,	%f1
	add	%i7,	%l6,	%o3
	fnand	%f0,	%f30,	%f30
	andn	%g4,	0x07D0,	%o1
	or	%i2,	0x1381,	%o0
	st	%f10,	[%l7 + 0x58]
	stx	%l0,	[%l7 + 0x08]
	edge16	%l2,	%l1,	%g3
	smulcc	%g5,	0x015F,	%g1
	addc	%l4,	0x0722,	%i6
	or	%i4,	0x0F34,	%l5
	movrgez	%i1,	0x03A,	%g6
	fandnot1	%f28,	%f20,	%f8
	fmovscc	%xcc,	%f18,	%f30
	fnot2s	%f24,	%f8
	edge32l	%o4,	%l3,	%g2
	addc	%o6,	0x06AB,	%i0
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	sdiv	%g7,	0x0944,	%i3
	movg	%xcc,	%i5,	%i7
	ldd	[%l7 + 0x58],	%o2
	fmovrdlz	%o3,	%f24,	%f0
	movl	%icc,	%g4,	%o1
	edge8ln	%i2,	%o0,	%l0
	fcmpne32	%f12,	%f12,	%l6
	xorcc	%l2,	%l1,	%g3
	edge8	%g5,	%l4,	%i6
	movrlez	%g1,	%i4,	%i1
	udivcc	%l5,	0x0E8A,	%g6
	udivcc	%l3,	0x0B6C,	%o4
	movvc	%icc,	%o6,	%i0
	fpack16	%f22,	%f4
	lduw	[%l7 + 0x64],	%o5
	for	%f22,	%f0,	%f16
	fcmpne32	%f10,	%f14,	%o7
	fxors	%f1,	%f22,	%f6
	siam	0x0
	movcc	%icc,	%g2,	%i3
	movge	%xcc,	%g7,	%i5
	movrlz	%o2,	0x11D,	%i7
	andcc	%g4,	0x1D7F,	%o3
	fmovdvs	%icc,	%f29,	%f2
	udivcc	%i2,	0x17DA,	%o1
	sra	%l0,	%o0,	%l6
	save %l1, %g3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l4,	%i6
	edge16n	%g1,	%i4,	%g5
	ldd	[%l7 + 0x50],	%l4
	fors	%f10,	%f17,	%f29
	movvc	%xcc,	%g6,	%i1
	movneg	%icc,	%o4,	%l3
	umul	%o6,	%o5,	%o7
	alignaddr	%i0,	%i3,	%g2
	umul	%i5,	0x1BFB,	%o2
	fand	%f2,	%f28,	%f16
	movgu	%xcc,	%i7,	%g4
	sub	%o3,	%i2,	%g7
	srax	%l0,	0x1E,	%o0
	xorcc	%l6,	%o1,	%l1
	fcmple32	%f26,	%f30,	%g3
	fabsd	%f4,	%f18
	movvs	%xcc,	%l4,	%i6
	movrgz	%g1,	%l2,	%i4
	array8	%l5,	%g6,	%g5
	stx	%o4,	[%l7 + 0x28]
	movcc	%icc,	%l3,	%i1
	alignaddr	%o5,	%o6,	%o7
	xnorcc	%i3,	%g2,	%i0
	udivcc	%o2,	0x1816,	%i7
	sdivx	%i5,	0x0A7D,	%o3
	sir	0x16D1
	edge32l	%i2,	%g7,	%l0
	udivx	%g4,	0x1A90,	%o0
	movge	%xcc,	%l6,	%o1
	save %l1, %l4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g1,	0x22D,	%l2
	and	%g3,	%l5,	%g6
	ldx	[%l7 + 0x48],	%g5
	subcc	%o4,	%i4,	%i1
	stw	%l3,	[%l7 + 0x40]
	edge16n	%o6,	%o5,	%i3
	umulcc	%o7,	0x0C43,	%i0
	std	%f18,	[%l7 + 0x50]
	lduh	[%l7 + 0x16],	%g2
	alignaddr	%o2,	%i7,	%i5
	or	%o3,	%g7,	%i2
	movvc	%icc,	%l0,	%g4
	addcc	%o0,	%o1,	%l1
	andn	%l4,	%i6,	%g1
	nop
	set	0x40, %i0
	ldx	[%l7 + %i0],	%l6
	ldub	[%l7 + 0x13],	%g3
	fnor	%f4,	%f12,	%f10
	movvs	%icc,	%l5,	%g6
	ldsw	[%l7 + 0x2C],	%g5
	fmovdvc	%xcc,	%f2,	%f5
	fnors	%f24,	%f19,	%f13
	udivcc	%l2,	0x1C56,	%i4
	alignaddr	%o4,	%l3,	%i1
	xnorcc	%o6,	0x0828,	%o5
	std	%f24,	[%l7 + 0x18]
	sth	%i3,	[%l7 + 0x5E]
	addccc	%i0,	%g2,	%o7
	movn	%xcc,	%i7,	%i5
	stx	%o3,	[%l7 + 0x48]
	subccc	%o2,	%g7,	%i2
	mulx	%l0,	0x0840,	%g4
	srlx	%o0,	0x0A,	%o1
	edge8l	%l4,	%l1,	%g1
	movg	%xcc,	%l6,	%i6
	fornot2s	%f23,	%f15,	%f18
	orn	%l5,	%g3,	%g6
	ldsb	[%l7 + 0x66],	%g5
	movl	%xcc,	%l2,	%i4
	sllx	%l3,	%i1,	%o6
	movgu	%xcc,	%o4,	%o5
	movleu	%xcc,	%i3,	%g2
	fmovdleu	%xcc,	%f10,	%f18
	srax	%i0,	0x0C,	%o7
	array8	%i7,	%o3,	%i5
	umul	%g7,	0x1D9E,	%o2
	orn	%i2,	0x1931,	%g4
	movre	%l0,	0x380,	%o1
	sub	%o0,	0x18F9,	%l1
	fsrc1s	%f15,	%f12
	smulcc	%l4,	%g1,	%i6
	ldub	[%l7 + 0x1F],	%l6
	ld	[%l7 + 0x70],	%f18
	edge8l	%g3,	%l5,	%g5
	sir	0x07C9
	movn	%icc,	%g6,	%i4
	edge8ln	%l3,	%l2,	%o6
	st	%f2,	[%l7 + 0x64]
	fandnot2s	%f28,	%f15,	%f11
	sdivcc	%o4,	0x0EF0,	%o5
	fmovda	%icc,	%f15,	%f26
	fsrc2	%f4,	%f8
	restore %i1, %g2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x20, %i2
	stx	%o7,	[%l7 + %i2]
	andncc	%i3,	%i7,	%i5
	edge16ln	%g7,	%o3,	%o2
	orcc	%g4,	%l0,	%i2
	edge32ln	%o0,	%o1,	%l1
	fnor	%f30,	%f18,	%f20
	fcmped	%fcc3,	%f8,	%f16
	addcc	%g1,	0x0D00,	%i6
	ldub	[%l7 + 0x53],	%l4
	orncc	%l6,	0x0C3F,	%g3
	fmovde	%icc,	%f19,	%f10
	sdivx	%g5,	0x0CF2,	%g6
	fnegs	%f14,	%f17
	xorcc	%l5,	0x0B39,	%l3
	movvs	%xcc,	%l2,	%o6
	fmovsge	%icc,	%f14,	%f23
	fpmerge	%f28,	%f28,	%f14
	movgu	%xcc,	%o4,	%i4
	fpsub32s	%f25,	%f5,	%f19
	movrgez	%o5,	0x203,	%i1
	fexpand	%f10,	%f6
	fpadd16s	%f29,	%f31,	%f5
	and	%g2,	%o7,	%i3
	movre	%i0,	%i7,	%g7
	array8	%o3,	%i5,	%o2
	nop
	set	0x20, %o7
	sth	%l0,	[%l7 + %o7]
	lduh	[%l7 + 0x0A],	%i2
	edge8l	%g4,	%o0,	%o1
	movpos	%xcc,	%g1,	%l1
	for	%f24,	%f30,	%f26
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	orcc	%g3,	0x082F,	%l6
	alignaddrl	%g5,	%g6,	%l3
	fpadd16	%f2,	%f10,	%f30
	or	%l2,	%o6,	%l5
	sir	0x05D6
	movcs	%xcc,	%i4,	%o4
	stw	%i1,	[%l7 + 0x08]
	srax	%o5,	%o7,	%i3
	movne	%icc,	%g2,	%i0
	addc	%g7,	%i7,	%o3
	fmovs	%f31,	%f1
	fnot1	%f28,	%f18
	ldx	[%l7 + 0x68],	%i5
	save %o2, %i2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g4,	%o0,	%o1
	ldsh	[%l7 + 0x2E],	%l1
	stw	%g1,	[%l7 + 0x48]
	mova	%icc,	%l4,	%g3
	movge	%xcc,	%l6,	%i6
	std	%f8,	[%l7 + 0x60]
	fmovsleu	%xcc,	%f0,	%f29
	sethi	0x0C27,	%g5
	movcc	%icc,	%l3,	%l2
	movg	%xcc,	%g6,	%o6
	addc	%i4,	%l5,	%o4
	movn	%xcc,	%o5,	%i1
	xnorcc	%i3,	%o7,	%i0
	edge32	%g2,	%i7,	%g7
	sethi	0x073F,	%i5
	movrlez	%o2,	0x346,	%o3
	umul	%l0,	%g4,	%o0
	mulscc	%o1,	0x03EF,	%l1
	movneg	%xcc,	%i2,	%g1
	fxnor	%f8,	%f6,	%f8
	udivx	%l4,	0x040F,	%l6
	alignaddrl	%i6,	%g3,	%l3
	fcmpes	%fcc3,	%f5,	%f14
	fcmple32	%f20,	%f0,	%l2
	fmuld8ulx16	%f24,	%f11,	%f12
	addc	%g5,	0x0954,	%o6
	array16	%i4,	%l5,	%g6
	fabsd	%f18,	%f10
	srlx	%o4,	0x12,	%o5
	edge16n	%i1,	%o7,	%i0
	srl	%g2,	%i3,	%i7
	edge32l	%i5,	%g7,	%o2
	movgu	%xcc,	%o3,	%g4
	sra	%l0,	0x1B,	%o1
	movrgez	%l1,	0x3BB,	%o0
	fcmpne16	%f20,	%f16,	%i2
	movrne	%l4,	%l6,	%g1
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%i6
	stx	%g3,	[%l7 + 0x08]
	movpos	%xcc,	%l3,	%g5
	ldsh	[%l7 + 0x18],	%o6
	movpos	%icc,	%i4,	%l5
	subccc	%g6,	%l2,	%o5
	movneg	%icc,	%i1,	%o4
	sll	%o7,	0x10,	%i0
	fmovd	%f2,	%f18
	xnor	%g2,	%i7,	%i3
	movrgez	%g7,	0x0B4,	%o2
	movrlez	%o3,	%g4,	%l0
	smulcc	%i5,	0x0BB8,	%o1
	fmovdne	%xcc,	%f24,	%f15
	movrlz	%o0,	%i2,	%l1
	edge32ln	%l6,	%g1,	%l4
	move	%xcc,	%i6,	%l3
	fsrc2	%f30,	%f30
	for	%f16,	%f10,	%f8
	movneg	%xcc,	%g5,	%o6
	std	%f12,	[%l7 + 0x08]
	udivx	%i4,	0x1CEE,	%l5
	subccc	%g3,	0x1B97,	%l2
	nop
	set	0x54, %o5
	stw	%o5,	[%l7 + %o5]
	fnot1	%f18,	%f0
	movre	%g6,	%o4,	%o7
	subcc	%i0,	%g2,	%i1
	add	%i3,	0x12DA,	%i7
	movcs	%xcc,	%g7,	%o2
	addc	%g4,	%o3,	%i5
	sub	%o1,	%l0,	%o0
	array8	%l1,	%i2,	%g1
	fmovspos	%xcc,	%f6,	%f25
	smul	%l6,	%l4,	%i6
	sdivx	%g5,	0x0F52,	%l3
	array8	%o6,	%l5,	%g3
	nop
	set	0x0C, %i1
	ldsh	[%l7 + %i1],	%l2
	fnands	%f23,	%f5,	%f25
	xor	%o5,	%i4,	%o4
	movvc	%icc,	%g6,	%o7
	alignaddrl	%g2,	%i1,	%i3
	fmovdpos	%xcc,	%f20,	%f6
	fcmple32	%f14,	%f22,	%i0
	movn	%icc,	%i7,	%o2
	movcs	%icc,	%g4,	%o3
	andncc	%g7,	%o1,	%i5
	edge16n	%l0,	%o0,	%i2
	movrgz	%l1,	0x3FB,	%g1
	movvs	%xcc,	%l6,	%i6
	sllx	%g5,	0x1A,	%l3
	edge8	%l4,	%o6,	%g3
	ldub	[%l7 + 0x3F],	%l5
	edge32ln	%o5,	%l2,	%o4
	move	%icc,	%i4,	%o7
	xorcc	%g2,	%g6,	%i3
	st	%f30,	[%l7 + 0x7C]
	srl	%i0,	%i7,	%o2
	umul	%g4,	0x0D35,	%i1
	movcs	%icc,	%o3,	%g7
	edge32	%o1,	%i5,	%l0
	srl	%i2,	0x08,	%o0
	move	%icc,	%g1,	%l6
	udivcc	%l1,	0x1CAD,	%g5
	alignaddr	%l3,	%i6,	%o6
	sra	%l4,	%l5,	%g3
	fmul8x16	%f24,	%f6,	%f2
	fcmpeq16	%f14,	%f8,	%o5
	edge8n	%l2,	%o4,	%o7
	movpos	%xcc,	%g2,	%g6
	add	%i3,	0x104F,	%i4
	orn	%i7,	%i0,	%o2
	edge16ln	%i1,	%g4,	%o3
	edge16n	%g7,	%i5,	%o1
	movl	%xcc,	%l0,	%o0
	array8	%g1,	%l6,	%l1
	srl	%i2,	%g5,	%i6
	or	%o6,	0x14AB,	%l4
	movrlez	%l3,	0x161,	%l5
	edge8l	%g3,	%l2,	%o4
	movg	%xcc,	%o7,	%g2
	subc	%o5,	%i3,	%i4
	popc	%g6,	%i7
	xnorcc	%o2,	%i1,	%g4
	srl	%i0,	%o3,	%i5
	movvs	%icc,	%o1,	%l0
	fmovdg	%icc,	%f30,	%f9
	ldd	[%l7 + 0x40],	%f4
	fmovsne	%icc,	%f8,	%f25
	smul	%o0,	%g7,	%l6
	subcc	%g1,	%l1,	%i2
	alignaddrl	%g5,	%o6,	%l4
	nop
	set	0x78, %g6
	stw	%l3,	[%l7 + %g6]
	nop
	set	0x78, %o3
	std	%f2,	[%l7 + %o3]
	addcc	%l5,	%g3,	%l2
	fpadd16s	%f10,	%f13,	%f16
	std	%f0,	[%l7 + 0x48]
	fmovsvs	%xcc,	%f29,	%f29
	movg	%icc,	%o4,	%i6
	movl	%icc,	%o7,	%g2
	alignaddr	%o5,	%i4,	%g6
	sth	%i3,	[%l7 + 0x24]
	move	%icc,	%o2,	%i1
	edge16	%g4,	%i0,	%i7
	add	%o3,	0x00DC,	%i5
	movre	%o1,	0x05B,	%o0
	stb	%g7,	[%l7 + 0x16]
	fornot1s	%f9,	%f25,	%f26
	edge8l	%l6,	%g1,	%l1
	std	%f24,	[%l7 + 0x18]
	sir	0x1351
	movrlz	%l0,	0x058,	%g5
	std	%f24,	[%l7 + 0x70]
	edge8n	%i2,	%o6,	%l4
	fpack32	%f4,	%f28,	%f0
	movcc	%icc,	%l5,	%g3
	nop
	set	0x38, %g2
	lduh	[%l7 + %g2],	%l2
	movrlz	%o4,	0x032,	%l3
	edge8	%o7,	%i6,	%g2
	srlx	%i4,	0x18,	%o5
	xnorcc	%i3,	%o2,	%i1
	nop
	set	0x5C, %o4
	stw	%g4,	[%l7 + %o4]
	fmovscs	%icc,	%f22,	%f0
	xorcc	%g6,	%i0,	%i7
	fpack16	%f14,	%f8
	siam	0x2
	save %i5, %o3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g7,	%o0
	smulcc	%l6,	%l1,	%g1
	mova	%xcc,	%g5,	%i2
	fzero	%f22
	sdiv	%o6,	0x00FB,	%l4
	movrgz	%l0,	0x06A,	%g3
	edge8	%l2,	%o4,	%l3
	movg	%icc,	%o7,	%l5
	or	%g2,	%i4,	%o5
	movge	%xcc,	%i3,	%o2
	edge32n	%i1,	%i6,	%g6
	ldd	[%l7 + 0x20],	%f28
	fand	%f8,	%f8,	%f10
	smulcc	%g4,	%i7,	%i5
	xorcc	%o3,	0x0915,	%i0
	subcc	%o1,	0x0B56,	%o0
	ldx	[%l7 + 0x68],	%g7
	edge16ln	%l1,	%g1,	%g5
	movgu	%xcc,	%i2,	%l6
	umulcc	%l4,	0x1837,	%l0
	ldsh	[%l7 + 0x3E],	%g3
	andcc	%l2,	0x0BAF,	%o4
	fabss	%f5,	%f26
	movrlz	%o6,	0x26C,	%l3
	udiv	%l5,	0x0321,	%g2
	movrgez	%o7,	0x1C3,	%o5
	ld	[%l7 + 0x48],	%f31
	smul	%i4,	0x1614,	%i3
	mova	%icc,	%i1,	%o2
	umul	%g6,	%g4,	%i6
	movg	%icc,	%i5,	%i7
	udivcc	%i0,	0x1CF8,	%o1
	mova	%icc,	%o0,	%o3
	fpsub32	%f10,	%f28,	%f6
	addc	%l1,	%g1,	%g7
	sdivcc	%i2,	0x1A1E,	%g5
	fmovsvs	%icc,	%f28,	%f13
	xnorcc	%l4,	%l6,	%g3
	fmovrslez	%l0,	%f31,	%f9
	fnot2s	%f9,	%f13
	movrlez	%o4,	%o6,	%l2
	sdivcc	%l5,	0x03FF,	%l3
	addccc	%o7,	%o5,	%g2
	addc	%i4,	%i1,	%o2
	ldd	[%l7 + 0x30],	%f6
	edge16	%g6,	%i3,	%i6
	umulcc	%i5,	0x18DA,	%g4
	edge16ln	%i7,	%o1,	%i0
	fmuld8sux16	%f0,	%f5,	%f20
	movcs	%icc,	%o0,	%l1
	sllx	%o3,	%g1,	%g7
	xorcc	%g5,	0x1ED2,	%i2
	fnegd	%f4,	%f14
	nop
	set	0x08, %o2
	stx	%l6,	[%l7 + %o2]
	fnegs	%f13,	%f9
	movcs	%xcc,	%g3,	%l4
	sdivcc	%o4,	0x172D,	%l0
	xnorcc	%l2,	%l5,	%l3
	fmul8x16al	%f11,	%f22,	%f20
	faligndata	%f4,	%f20,	%f12
	fmovdle	%xcc,	%f21,	%f29
	ldsw	[%l7 + 0x34],	%o7
	umulcc	%o5,	0x152C,	%o6
	andncc	%g2,	%i1,	%i4
	alignaddr	%g6,	%o2,	%i3
	stb	%i5,	[%l7 + 0x19]
	fmul8x16au	%f13,	%f30,	%f16
	ldx	[%l7 + 0x30],	%g4
	sdiv	%i6,	0x0D59,	%i7
	edge8l	%i0,	%o0,	%l1
	ld	[%l7 + 0x2C],	%f7
	andn	%o1,	0x187A,	%o3
	add	%g1,	0x0038,	%g7
	fmovrslz	%g5,	%f26,	%f17
	smulcc	%l6,	%g3,	%l4
	nop
	set	0x44, %o6
	sth	%i2,	[%l7 + %o6]
	restore %o4, 0x0839, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l2,	%l5
	sub	%l3,	0x042D,	%o5
	ldd	[%l7 + 0x40],	%f18
	srl	%o6,	0x10,	%g2
	andncc	%o7,	%i1,	%i4
	movne	%xcc,	%o2,	%g6
	or	%i3,	%g4,	%i6
	fzero	%f14
	edge16ln	%i7,	%i0,	%i5
	srlx	%l1,	%o0,	%o1
	ldsb	[%l7 + 0x1B],	%g1
	nop
	set	0x10, %i7
	lduw	[%l7 + %i7],	%g7
	edge8l	%g5,	%o3,	%l6
	popc	%g3,	%l4
	edge8ln	%o4,	%l0,	%i2
	fornot1	%f10,	%f12,	%f18
	fpsub16	%f22,	%f6,	%f18
	movrlez	%l2,	%l5,	%o5
	ldsh	[%l7 + 0x24],	%l3
	fmul8ulx16	%f18,	%f22,	%f10
	movneg	%icc,	%g2,	%o7
	edge8	%o6,	%i1,	%i4
	fmovrse	%g6,	%f11,	%f3
	lduw	[%l7 + 0x60],	%i3
	movle	%icc,	%o2,	%i6
	smul	%g4,	%i7,	%i0
	fmovrde	%i5,	%f0,	%f16
	movrgz	%o0,	0x17D,	%l1
	edge16n	%g1,	%g7,	%g5
	movl	%icc,	%o1,	%o3
	movcs	%xcc,	%g3,	%l4
	fmovspos	%icc,	%f17,	%f25
	sdivcc	%l6,	0x1CA3,	%o4
	orn	%l0,	0x17E0,	%l2
	fmovse	%icc,	%f17,	%f0
	array8	%i2,	%l5,	%o5
	edge16n	%l3,	%g2,	%o7
	andcc	%i1,	0x10D9,	%i4
	edge8	%g6,	%o6,	%i3
	alignaddrl	%o2,	%i6,	%g4
	xnor	%i0,	%i5,	%i7
	movvs	%xcc,	%l1,	%o0
	ldx	[%l7 + 0x48],	%g1
	ldd	[%l7 + 0x28],	%g6
	edge32	%g5,	%o3,	%o1
	edge8ln	%g3,	%l4,	%l6
	movrlz	%o4,	%l0,	%i2
	movge	%xcc,	%l2,	%o5
	alignaddrl	%l5,	%g2,	%o7
	udiv	%i1,	0x132F,	%l3
	movge	%xcc,	%g6,	%i4
	array16	%i3,	%o6,	%i6
	movrne	%o2,	0x0B2,	%i0
	fmul8ulx16	%f28,	%f24,	%f2
	movg	%xcc,	%i5,	%g4
	movpos	%icc,	%i7,	%l1
	fmovsl	%xcc,	%f30,	%f10
	edge8n	%g1,	%o0,	%g5
	or	%o3,	%g7,	%o1
	orncc	%g3,	%l6,	%o4
	edge32n	%l4,	%i2,	%l0
	edge16	%l2,	%o5,	%g2
	fnot2	%f12,	%f28
	andcc	%o7,	%i1,	%l3
	movgu	%icc,	%g6,	%l5
	alignaddrl	%i3,	%i4,	%i6
	smulcc	%o2,	%o6,	%i5
	fzero	%f6
	edge8n	%i0,	%i7,	%g4
	movg	%icc,	%l1,	%o0
	udivcc	%g5,	0x096A,	%g1
	edge32ln	%o3,	%o1,	%g7
	sir	0x1A5B
	fpadd16	%f4,	%f14,	%f6
	ldd	[%l7 + 0x30],	%i6
	movgu	%xcc,	%o4,	%l4
	movre	%i2,	0x2E0,	%g3
	movrgz	%l0,	0x396,	%l2
	array16	%o5,	%o7,	%g2
	subcc	%i1,	%l3,	%g6
	movrlz	%i3,	%i4,	%l5
	fcmple16	%f22,	%f20,	%i6
	st	%f11,	[%l7 + 0x44]
	fpadd16s	%f20,	%f28,	%f23
	edge16	%o6,	%o2,	%i5
	edge16ln	%i0,	%g4,	%i7
	movg	%icc,	%o0,	%g5
	addccc	%g1,	%l1,	%o1
	fmovdleu	%xcc,	%f3,	%f23
	edge32n	%o3,	%g7,	%l6
	edge8n	%l4,	%i2,	%g3
	movne	%icc,	%o4,	%l0
	fnegd	%f4,	%f0
	movcs	%icc,	%o5,	%o7
	umulcc	%l2,	%i1,	%g2
	fnands	%f13,	%f12,	%f18
	fzero	%f12
	fmovrslz	%l3,	%f19,	%f24
	mova	%xcc,	%i3,	%g6
	andncc	%l5,	%i6,	%o6
	siam	0x7
	stx	%i4,	[%l7 + 0x78]
	ldsw	[%l7 + 0x38],	%o2
	movrlez	%i0,	%g4,	%i7
	fmovdvc	%icc,	%f31,	%f21
	lduw	[%l7 + 0x64],	%i5
	ldd	[%l7 + 0x10],	%g4
	nop
	set	0x76, %i6
	ldub	[%l7 + %i6],	%o0
	for	%f12,	%f24,	%f8
	fmovsleu	%icc,	%f20,	%f15
	edge32n	%l1,	%g1,	%o3
	xor	%g7,	0x1C0A,	%o1
	st	%f16,	[%l7 + 0x54]
	sir	0x0211
	sth	%l6,	[%l7 + 0x5A]
	umul	%l4,	%i2,	%o4
	array32	%l0,	%g3,	%o7
	movre	%o5,	%i1,	%l2
	fcmps	%fcc0,	%f31,	%f15
	nop
	set	0x58, %g3
	ldub	[%l7 + %g3],	%l3
	subcc	%i3,	0x170D,	%g2
	movge	%icc,	%g6,	%i6
	movg	%xcc,	%l5,	%i4
	edge32n	%o2,	%o6,	%g4
	fcmpgt16	%f10,	%f18,	%i0
	xnorcc	%i5,	%i7,	%g5
	edge16n	%o0,	%l1,	%o3
	and	%g1,	0x1ED5,	%g7
	andcc	%l6,	%o1,	%i2
	fpsub32	%f12,	%f24,	%f22
	smulcc	%l4,	%o4,	%l0
	edge8	%o7,	%g3,	%o5
	sra	%l2,	0x02,	%l3
	ldsw	[%l7 + 0x70],	%i1
	fnegs	%f27,	%f24
	movrlez	%g2,	%i3,	%g6
	addc	%i6,	%i4,	%o2
	xnorcc	%l5,	0x16E9,	%g4
	stx	%o6,	[%l7 + 0x08]
	sllx	%i0,	%i5,	%g5
	sdiv	%i7,	0x00BC,	%l1
	movle	%icc,	%o3,	%o0
	fornot1s	%f3,	%f5,	%f7
	edge32l	%g7,	%l6,	%g1
	edge8n	%o1,	%i2,	%o4
	fmovrdgez	%l4,	%f28,	%f20
	andncc	%l0,	%o7,	%g3
	fmovdle	%icc,	%f9,	%f5
	addccc	%l2,	%o5,	%l3
	fornot2s	%f14,	%f12,	%f7
	movcs	%xcc,	%g2,	%i3
	fandnot2	%f0,	%f6,	%f18
	movge	%xcc,	%g6,	%i1
	sra	%i4,	0x00,	%i6
	sra	%o2,	0x00,	%g4
	edge8ln	%l5,	%i0,	%o6
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	movcc	%xcc,	%o3,	%o0
	fmovdge	%xcc,	%f2,	%f7
	fmovscc	%icc,	%f30,	%f12
	xorcc	%i7,	0x10AA,	%l6
	movl	%icc,	%g7,	%g1
	popc	%o1,	%i2
	edge16	%o4,	%l0,	%l4
	movvc	%xcc,	%g3,	%l2
	smulcc	%o7,	%l3,	%g2
	fmul8x16	%f20,	%f22,	%f30
	alignaddr	%o5,	%i3,	%g6
	std	%f0,	[%l7 + 0x38]
	movrlez	%i4,	%i1,	%o2
	save %i6, 0x08B7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g4,	[%l7 + 0x50]
	addccc	%i0,	0x1976,	%o6
	sra	%g5,	0x0A,	%l1
	movpos	%icc,	%i5,	%o3
	alignaddr	%i7,	%l6,	%o0
	or	%g7,	%o1,	%i2
	srl	%g1,	0x08,	%o4
	edge8	%l4,	%g3,	%l2
	ldd	[%l7 + 0x78],	%l0
	sub	%l3,	%g2,	%o7
	ldd	[%l7 + 0x48],	%o4
	sra	%i3,	0x07,	%g6
	umul	%i4,	%i1,	%o2
	fmovspos	%icc,	%f2,	%f9
	add	%i6,	0x020B,	%g4
	fmovrsne	%i0,	%f8,	%f31
	ldd	[%l7 + 0x38],	%f10
	ldd	[%l7 + 0x10],	%f28
	std	%f20,	[%l7 + 0x18]
	movg	%icc,	%o6,	%g5
	fmovrdgez	%l5,	%f20,	%f10
	andn	%l1,	0x15B3,	%o3
	st	%f3,	[%l7 + 0x64]
	xorcc	%i7,	0x1FF1,	%i5
	ldd	[%l7 + 0x38],	%f0
	mulscc	%o0,	%l6,	%g7
	fmovsvc	%xcc,	%f9,	%f3
	ld	[%l7 + 0x4C],	%f14
	fmovsvs	%icc,	%f24,	%f27
	mulx	%i2,	0x0AAC,	%o1
	movre	%o4,	0x0F1,	%g1
	fornot1s	%f6,	%f9,	%f21
	edge32	%l4,	%l2,	%g3
	movrgz	%l3,	%l0,	%g2
	edge8ln	%o5,	%i3,	%o7
	movrne	%i4,	0x3EA,	%g6
	umul	%o2,	0x1858,	%i6
	move	%icc,	%i1,	%i0
	sll	%g4,	%g5,	%l5
	fnot1s	%f20,	%f16
	addcc	%o6,	%o3,	%i7
	sth	%l1,	[%l7 + 0x42]
	sdivcc	%i5,	0x1A7D,	%l6
	umulcc	%o0,	0x0335,	%g7
	orcc	%i2,	0x0C2A,	%o1
	fmovdle	%xcc,	%f15,	%f28
	fmovdne	%icc,	%f5,	%f18
	movrgz	%g1,	%o4,	%l4
	array16	%l2,	%l3,	%l0
	edge32n	%g2,	%o5,	%i3
	mova	%xcc,	%o7,	%g3
	sdivcc	%g6,	0x0915,	%i4
	fmovrdlez	%o2,	%f2,	%f6
	orn	%i6,	0x09CE,	%i1
	umulcc	%i0,	%g5,	%g4
	ldsh	[%l7 + 0x1C],	%o6
	edge32ln	%o3,	%i7,	%l1
	movrlez	%l5,	%i5,	%o0
	stw	%g7,	[%l7 + 0x48]
	fcmpes	%fcc3,	%f8,	%f3
	movrgz	%l6,	%o1,	%g1
	movpos	%icc,	%o4,	%i2
	lduw	[%l7 + 0x08],	%l2
	xnor	%l4,	0x1F1C,	%l0
	movgu	%xcc,	%l3,	%g2
	andcc	%i3,	%o7,	%o5
	sllx	%g3,	%i4,	%o2
	save %i6, 0x1E57, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g6,	0x111A,	%g5
	save %i0, 0x1B26, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	%i7,	%o6
	edge32l	%l5,	%l1,	%i5
	stb	%o0,	[%l7 + 0x0F]
	fone	%f14
	std	%f24,	[%l7 + 0x60]
	edge16ln	%l6,	%o1,	%g1
	fcmpd	%fcc1,	%f18,	%f14
	alignaddr	%g7,	%i2,	%o4
	sra	%l4,	0x0C,	%l0
	movle	%xcc,	%l3,	%g2
	fmovda	%xcc,	%f28,	%f26
	fmovrsgz	%i3,	%f21,	%f22
	edge8l	%l2,	%o5,	%g3
	siam	0x2
	ldub	[%l7 + 0x50],	%i4
	subccc	%o7,	0x01E7,	%o2
	or	%i1,	%g6,	%i6
	alignaddr	%g5,	%i0,	%o3
	edge32n	%i7,	%g4,	%o6
	fcmpd	%fcc0,	%f22,	%f16
	fxors	%f8,	%f7,	%f1
	stw	%l1,	[%l7 + 0x1C]
	and	%i5,	0x128D,	%o0
	srlx	%l6,	0x02,	%o1
	movneg	%icc,	%l5,	%g1
	umulcc	%i2,	0x0236,	%g7
	add	%o4,	%l0,	%l4
	movl	%icc,	%g2,	%l3
	movle	%xcc,	%i3,	%o5
	mulscc	%l2,	%i4,	%g3
	add	%o7,	%i1,	%o2
	smulcc	%g6,	%g5,	%i6
	movge	%xcc,	%i0,	%i7
	fmovdle	%icc,	%f20,	%f27
	alignaddrl	%o3,	%g4,	%l1
	edge16	%o6,	%i5,	%l6
	fsrc2	%f26,	%f24
	movpos	%icc,	%o0,	%o1
	ldd	[%l7 + 0x68],	%f30
	andcc	%g1,	0x068F,	%l5
	fmovrdgz	%g7,	%f28,	%f20
	sdivcc	%o4,	0x148A,	%i2
	addccc	%l4,	0x04FA,	%g2
	orn	%l0,	0x1639,	%i3
	alignaddrl	%o5,	%l2,	%l3
	movcs	%icc,	%i4,	%g3
	ldd	[%l7 + 0x08],	%o6
	movrgez	%o2,	%i1,	%g6
	movgu	%xcc,	%g5,	%i0
	st	%f28,	[%l7 + 0x38]
	array16	%i6,	%i7,	%g4
	addc	%o3,	0x0AC3,	%o6
	array16	%l1,	%i5,	%o0
	ldsw	[%l7 + 0x7C],	%l6
	edge32l	%g1,	%o1,	%g7
	mulscc	%l5,	%o4,	%l4
	popc	%i2,	%l0
	add	%i3,	%o5,	%g2
	andncc	%l2,	%l3,	%g3
	fmovdvs	%xcc,	%f2,	%f5
	movre	%o7,	%i4,	%o2
	alignaddrl	%i1,	%g6,	%g5
	bshuffle	%f12,	%f12,	%f16
	orn	%i6,	0x08EC,	%i7
	fsrc2s	%f4,	%f3
	ldx	[%l7 + 0x38],	%g4
	fmovrsgez	%i0,	%f12,	%f21
	edge8	%o6,	%l1,	%i5
	movneg	%xcc,	%o0,	%l6
	fmovdn	%xcc,	%f7,	%f3
	fmovsleu	%xcc,	%f19,	%f20
	andncc	%o3,	%g1,	%g7
	ldsb	[%l7 + 0x35],	%o1
	subcc	%l5,	0x0979,	%o4
	movpos	%xcc,	%l4,	%i2
	edge32l	%l0,	%o5,	%i3
	sth	%g2,	[%l7 + 0x7A]
	ldx	[%l7 + 0x30],	%l3
	alignaddrl	%l2,	%g3,	%o7
	edge8l	%i4,	%o2,	%g6
	fmovs	%f4,	%f6
	ldsb	[%l7 + 0x1E],	%i1
	popc	%i6,	%i7
	smul	%g5,	%g4,	%i0
	srlx	%l1,	%o6,	%i5
	fmovd	%f26,	%f2
	movvs	%xcc,	%o0,	%o3
	fabss	%f6,	%f27
	stb	%l6,	[%l7 + 0x46]
	fmovrsne	%g1,	%f24,	%f26
	xor	%o1,	0x0527,	%l5
	alignaddrl	%o4,	%l4,	%i2
	fmovsneg	%xcc,	%f4,	%f3
	fmovs	%f2,	%f18
	movrlez	%l0,	0x31D,	%o5
	movvs	%icc,	%g7,	%g2
	fmovrse	%i3,	%f31,	%f6
	stb	%l2,	[%l7 + 0x4B]
	andn	%l3,	%o7,	%g3
	array32	%i4,	%o2,	%g6
	movvc	%icc,	%i1,	%i6
	srax	%i7,	%g5,	%g4
	lduw	[%l7 + 0x24],	%l1
	fmovscs	%xcc,	%f12,	%f13
	fmovdg	%icc,	%f16,	%f21
	edge8l	%i0,	%o6,	%o0
	edge32n	%o3,	%i5,	%g1
	movvs	%icc,	%l6,	%l5
	fmovrsne	%o4,	%f19,	%f17
	edge16	%l4,	%o1,	%l0
	movvc	%icc,	%i2,	%g7
	nop
	set	0x60, %g5
	ldsb	[%l7 + %g5],	%o5
	fmovscs	%icc,	%f26,	%f16
	or	%i3,	0x1FDA,	%l2
	add	%g2,	%o7,	%l3
	sethi	0x198E,	%g3
	fzero	%f8
	sth	%i4,	[%l7 + 0x66]
	fmovdne	%icc,	%f21,	%f24
	movl	%icc,	%o2,	%i1
	sll	%i6,	%i7,	%g6
	srax	%g4,	0x17,	%l1
	save %i0, %g5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f8,	%f25,	%f10
	popc	0x1529,	%o3
	addccc	%o0,	0x1979,	%i5
	ldsh	[%l7 + 0x34],	%g1
	fmovsgu	%xcc,	%f8,	%f31
	orn	%l5,	%o4,	%l4
	movge	%xcc,	%l6,	%l0
	andn	%i2,	%o1,	%g7
	fornot1s	%f4,	%f19,	%f18
	movrne	%i3,	0x0A4,	%o5
	udivcc	%l2,	0x0E9B,	%o7
	array16	%g2,	%l3,	%g3
	array32	%i4,	%o2,	%i1
	edge16n	%i6,	%i7,	%g6
	edge32n	%l1,	%i0,	%g4
	mulx	%g5,	0x0BC4,	%o3
	edge16l	%o6,	%i5,	%g1
	fmul8x16au	%f30,	%f6,	%f22
	orncc	%l5,	%o4,	%l4
	xor	%o0,	%l0,	%l6
	edge32n	%o1,	%g7,	%i3
	sethi	0x0C45,	%i2
	fmuld8ulx16	%f24,	%f16,	%f2
	xnorcc	%o5,	%l2,	%g2
	alignaddr	%l3,	%g3,	%i4
	stx	%o2,	[%l7 + 0x10]
	stx	%o7,	[%l7 + 0x38]
	movrgz	%i6,	0x0C5,	%i1
	movrgz	%g6,	%i7,	%l1
	sethi	0x0C35,	%g4
	movle	%icc,	%i0,	%g5
	fandnot2s	%f22,	%f27,	%f25
	ldsh	[%l7 + 0x28],	%o3
	movneg	%xcc,	%i5,	%g1
	sth	%o6,	[%l7 + 0x5E]
	smulcc	%o4,	0x0A40,	%l4
	ldub	[%l7 + 0x78],	%l5
	addccc	%l0,	%o0,	%o1
	movcc	%xcc,	%l6,	%i3
	xorcc	%i2,	0x18CD,	%o5
	fnands	%f9,	%f14,	%f8
	sll	%g7,	%g2,	%l2
	edge16ln	%l3,	%i4,	%o2
	addc	%o7,	0x0846,	%i6
	umul	%i1,	%g3,	%i7
	xnor	%l1,	0x073C,	%g6
	ldx	[%l7 + 0x10],	%i0
	movle	%icc,	%g4,	%g5
	srlx	%i5,	%o3,	%o6
	fnot2	%f8,	%f18
	fmovspos	%icc,	%f11,	%f31
	subccc	%o4,	%l4,	%g1
	fpadd32s	%f15,	%f22,	%f24
	ldd	[%l7 + 0x78],	%l4
	fmovsvc	%icc,	%f27,	%f3
	andncc	%l0,	%o0,	%o1
	movneg	%xcc,	%l6,	%i2
	fmovdne	%icc,	%f18,	%f27
	fcmpne16	%f0,	%f18,	%o5
	movcs	%icc,	%g7,	%g2
	xor	%l2,	0x0DF3,	%l3
	st	%f1,	[%l7 + 0x44]
	umul	%i3,	%o2,	%i4
	movrlez	%i6,	%i1,	%g3
	sth	%o7,	[%l7 + 0x08]
	movneg	%xcc,	%l1,	%i7
	fmovrslz	%g6,	%f10,	%f3
	movrgz	%g4,	%g5,	%i5
	movleu	%icc,	%o3,	%i0
	sir	0x0C85
	addccc	%o6,	%l4,	%g1
	sll	%l5,	%l0,	%o0
	sethi	0x148E,	%o1
	fmovrde	%o4,	%f30,	%f30
	sllx	%i2,	0x15,	%l6
	srlx	%o5,	0x03,	%g7
	fmovrsgz	%l2,	%f20,	%f20
	movge	%icc,	%g2,	%l3
	xor	%o2,	%i3,	%i6
	movge	%xcc,	%i1,	%i4
	fmovsa	%icc,	%f24,	%f11
	edge32n	%o7,	%g3,	%i7
	ldsh	[%l7 + 0x72],	%l1
	array32	%g4,	%g6,	%i5
	umul	%o3,	0x0FEC,	%g5
	fmovrsne	%o6,	%f12,	%f9
	movvs	%icc,	%i0,	%l4
	xorcc	%g1,	0x0A22,	%l5
	fpackfix	%f22,	%f23
	subccc	%o0,	%l0,	%o4
	add	%o1,	0x0DD1,	%l6
	popc	0x1E59,	%o5
	smulcc	%g7,	0x140A,	%l2
	fpadd32s	%f25,	%f30,	%f27
	andncc	%g2,	%i2,	%l3
	st	%f30,	[%l7 + 0x54]
	movrgez	%o2,	0x096,	%i6
	xnor	%i3,	0x0096,	%i1
	fmovspos	%xcc,	%f4,	%f12
	restore %i4, %g3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o7,	%g4,	%g6
	edge8l	%i5,	%l1,	%g5
	edge32l	%o3,	%i0,	%o6
	movn	%xcc,	%g1,	%l4
	ldsw	[%l7 + 0x1C],	%l5
	srlx	%l0,	0x19,	%o0
	fpmerge	%f13,	%f13,	%f26
	movne	%icc,	%o1,	%l6
	st	%f29,	[%l7 + 0x60]
	umulcc	%o5,	0x0D56,	%o4
	subc	%g7,	0x10E8,	%g2
	fpadd32	%f10,	%f10,	%f28
	stb	%l2,	[%l7 + 0x40]
	popc	0x0D0E,	%i2
	sdivx	%o2,	0x14BF,	%l3
	stw	%i3,	[%l7 + 0x34]
	umulcc	%i1,	%i4,	%g3
	ldx	[%l7 + 0x10],	%i6
	st	%f7,	[%l7 + 0x10]
	pdist	%f16,	%f16,	%f18
	lduh	[%l7 + 0x16],	%o7
	std	%f6,	[%l7 + 0x58]
	fpack32	%f30,	%f0,	%f26
	edge8l	%i7,	%g4,	%i5
	sllx	%l1,	%g6,	%o3
	movgu	%icc,	%i0,	%g5
	fexpand	%f22,	%f8
	andn	%o6,	0x1B52,	%l4
	fcmpd	%fcc0,	%f24,	%f8
	fnot1	%f28,	%f26
	save %l5, 0x0749, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o0,	%g1,	%l6
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	stx	%g7,	[%l7 + 0x40]
	fmovrdgez	%o4,	%f12,	%f18
	or	%l2,	0x0761,	%g2
	fsrc1s	%f3,	%f14
	edge8l	%o2,	%l3,	%i3
	fmovsvs	%xcc,	%f4,	%f2
	popc	0x0A36,	%i1
	movrlz	%i4,	%i2,	%g3
	movne	%icc,	%o7,	%i6
	save %i7, 0x1BF6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i5,	%l1
	stx	%o3,	[%l7 + 0x10]
	edge8ln	%i0,	%g5,	%g6
	stb	%l4,	[%l7 + 0x2E]
	orcc	%o6,	%l0,	%o0
	ldd	[%l7 + 0x08],	%f30
	nop
	set	0x58, %l1
	stx	%l5,	[%l7 + %l1]
	alignaddr	%g1,	%o5,	%l6
	movrlez	%g7,	%o1,	%l2
	movre	%o4,	0x343,	%g2
	sdiv	%o2,	0x17C4,	%l3
	edge32ln	%i1,	%i3,	%i4
	ldd	[%l7 + 0x10],	%g2
	udivx	%o7,	0x105A,	%i6
	fmuld8ulx16	%f7,	%f21,	%f26
	srl	%i2,	%g4,	%i7
	fmuld8ulx16	%f12,	%f24,	%f20
	udivcc	%l1,	0x14F3,	%i5
	st	%f9,	[%l7 + 0x74]
	fcmps	%fcc3,	%f13,	%f26
	fabsd	%f20,	%f22
	fnot1	%f14,	%f10
	srlx	%o3,	%i0,	%g5
	edge8n	%g6,	%o6,	%l4
	add	%l0,	%o0,	%l5
	fzero	%f12
	fcmpd	%fcc3,	%f10,	%f10
	fmovrse	%o5,	%f23,	%f5
	alignaddr	%g1,	%l6,	%g7
	fnegd	%f26,	%f24
	xnorcc	%o1,	%o4,	%g2
	pdist	%f14,	%f26,	%f30
	srl	%l2,	0x08,	%o2
	movleu	%icc,	%l3,	%i3
	udiv	%i4,	0x1B44,	%i1
	edge16n	%g3,	%i6,	%i2
	subccc	%g4,	0x1E76,	%i7
	addc	%o7,	0x0532,	%l1
	sethi	0x1D32,	%o3
	ldsw	[%l7 + 0x44],	%i5
	fmovdcc	%xcc,	%f24,	%f0
	array8	%i0,	%g5,	%o6
	ld	[%l7 + 0x28],	%f15
	edge8n	%l4,	%l0,	%o0
	fcmpne32	%f20,	%f22,	%g6
	sll	%o5,	%l5,	%l6
	movne	%xcc,	%g1,	%g7
	movleu	%icc,	%o4,	%o1
	array8	%g2,	%l2,	%l3
	andcc	%o2,	%i4,	%i3
	alignaddr	%g3,	%i6,	%i2
	sdiv	%g4,	0x1C08,	%i1
	edge8ln	%o7,	%l1,	%i7
	fornot2s	%f8,	%f16,	%f27
	edge16ln	%o3,	%i0,	%g5
	move	%icc,	%o6,	%l4
	fmovdge	%xcc,	%f4,	%f5
	fmovrsne	%i5,	%f15,	%f24
	smul	%l0,	%g6,	%o5
	fmovdleu	%icc,	%f5,	%f31
	ldsw	[%l7 + 0x40],	%o0
	movl	%xcc,	%l5,	%g1
	st	%f24,	[%l7 + 0x28]
	movneg	%xcc,	%l6,	%o4
	orn	%g7,	%g2,	%o1
	ldsb	[%l7 + 0x17],	%l2
	fpsub32	%f20,	%f2,	%f8
	udivcc	%l3,	0x0324,	%i4
	mulx	%i3,	0x0A0E,	%g3
	edge8ln	%i6,	%i2,	%g4
	movneg	%xcc,	%o2,	%i1
	bshuffle	%f4,	%f26,	%f4
	edge32	%l1,	%o7,	%i7
	stb	%i0,	[%l7 + 0x08]
	orncc	%o3,	0x1500,	%g5
	edge16	%o6,	%i5,	%l4
	sra	%g6,	0x0F,	%o5
	fmovsne	%icc,	%f13,	%f20
	stx	%o0,	[%l7 + 0x78]
	movrgez	%l5,	%g1,	%l0
	lduh	[%l7 + 0x1C],	%o4
	movrne	%g7,	%g2,	%l6
	mova	%xcc,	%o1,	%l3
	sdivx	%i4,	0x0AFC,	%i3
	fmovsgu	%icc,	%f28,	%f20
	ldsw	[%l7 + 0x78],	%l2
	addccc	%g3,	%i6,	%i2
	subcc	%g4,	%o2,	%i1
	fmovdl	%icc,	%f19,	%f13
	stw	%l1,	[%l7 + 0x3C]
	movrgz	%o7,	%i7,	%i0
	fpadd16	%f30,	%f6,	%f24
	andcc	%o3,	0x0976,	%o6
	movleu	%xcc,	%g5,	%l4
	orn	%i5,	0x16F9,	%g6
	or	%o5,	%l5,	%o0
	udivx	%g1,	0x1810,	%o4
	fpack32	%f14,	%f16,	%f2
	srax	%l0,	0x06,	%g7
	fmovrdlez	%g2,	%f4,	%f30
	array32	%l6,	%l3,	%o1
	movneg	%xcc,	%i4,	%l2
	sll	%i3,	0x05,	%g3
	or	%i2,	%i6,	%o2
	edge16l	%g4,	%l1,	%i1
	fandnot1s	%f21,	%f31,	%f12
	sth	%i7,	[%l7 + 0x3A]
	fone	%f6
	movne	%icc,	%o7,	%o3
	srl	%i0,	0x0B,	%g5
	umulcc	%l4,	%i5,	%g6
	andncc	%o6,	%l5,	%o0
	edge16l	%g1,	%o4,	%l0
	fcmpgt16	%f6,	%f8,	%g7
	movrlez	%o5,	%g2,	%l3
	sra	%o1,	0x0A,	%i4
	nop
	set	0x52, %i5
	ldub	[%l7 + %i5],	%l6
	fmul8x16al	%f0,	%f13,	%f2
	movn	%icc,	%l2,	%g3
	smul	%i2,	%i3,	%i6
	edge8ln	%g4,	%o2,	%i1
	edge32	%i7,	%o7,	%l1
	movn	%icc,	%i0,	%g5
	subcc	%o3,	%i5,	%g6
	movrgez	%o6,	%l4,	%o0
	sir	0x19FE
	movpos	%xcc,	%g1,	%o4
	movrne	%l5,	%g7,	%o5
	subccc	%l0,	0x1F2D,	%g2
	lduw	[%l7 + 0x74],	%l3
	edge32l	%i4,	%l6,	%l2
	orcc	%o1,	0x165D,	%i2
	fors	%f22,	%f5,	%f23
	alignaddrl	%i3,	%i6,	%g4
	fmovrdgz	%o2,	%f0,	%f28
	movrgez	%g3,	%i7,	%i1
	ldsb	[%l7 + 0x0A],	%o7
	xor	%l1,	0x13C2,	%g5
	fandnot2	%f28,	%f14,	%f4
	sdiv	%i0,	0x13E4,	%o3
	sll	%i5,	0x14,	%o6
	fmul8x16	%f13,	%f16,	%f10
	subcc	%g6,	0x0B24,	%l4
	addccc	%o0,	0x09FB,	%g1
	fmovde	%xcc,	%f26,	%f18
	fmovrdlz	%l5,	%f10,	%f6
	smulcc	%g7,	0x1A16,	%o4
	movcc	%icc,	%l0,	%o5
	movleu	%xcc,	%l3,	%i4
	smul	%g2,	0x106D,	%l6
	orncc	%o1,	0x032F,	%i2
	fmovdn	%xcc,	%f12,	%f2
	sllx	%l2,	0x05,	%i6
	smul	%i3,	0x19A3,	%g4
	array8	%o2,	%i7,	%g3
	movvc	%icc,	%o7,	%l1
	edge32ln	%i1,	%i0,	%o3
	alignaddr	%i5,	%o6,	%g5
	edge16	%l4,	%o0,	%g6
	udivx	%l5,	0x0E81,	%g7
	array32	%g1,	%o4,	%l0
	xorcc	%l3,	%o5,	%g2
	edge8l	%i4,	%o1,	%i2
	fmovrsne	%l6,	%f20,	%f26
	subccc	%l2,	0x1F8B,	%i6
	lduh	[%l7 + 0x1C],	%i3
	subcc	%g4,	0x0018,	%i7
	udiv	%o2,	0x1F84,	%o7
	srl	%l1,	0x05,	%g3
	movn	%xcc,	%i0,	%o3
	andn	%i5,	%i1,	%g5
	udiv	%o6,	0x0454,	%l4
	edge8n	%o0,	%l5,	%g6
	sra	%g1,	%g7,	%l0
	sethi	0x1754,	%o4
	std	%f0,	[%l7 + 0x60]
	fmovsneg	%xcc,	%f14,	%f7
	ldsb	[%l7 + 0x18],	%o5
	addcc	%l3,	%i4,	%o1
	movrlz	%i2,	%l6,	%l2
	movre	%i6,	0x020,	%g2
	nop
	set	0x64, %g4
	ldsh	[%l7 + %g4],	%i3
	fcmpd	%fcc2,	%f18,	%f12
	orn	%g4,	0x05C0,	%i7
	fmuld8ulx16	%f11,	%f12,	%f0
	fornot2	%f0,	%f8,	%f20
	orcc	%o7,	%o2,	%l1
	andn	%i0,	0x1DCC,	%g3
	movcs	%icc,	%i5,	%i1
	stb	%g5,	[%l7 + 0x1B]
	ld	[%l7 + 0x10],	%f2
	or	%o3,	%o6,	%l4
	andncc	%o0,	%l5,	%g1
	srlx	%g6,	0x0D,	%g7
	udivcc	%o4,	0x1929,	%o5
	srax	%l3,	0x0D,	%l0
	fcmpgt32	%f4,	%f10,	%o1
	array8	%i4,	%i2,	%l2
	ldd	[%l7 + 0x58],	%i6
	alignaddrl	%i6,	%g2,	%g4
	srlx	%i7,	%i3,	%o7
	fmovspos	%xcc,	%f12,	%f25
	movrgez	%l1,	0x025,	%i0
	movl	%icc,	%o2,	%i5
	ldsb	[%l7 + 0x72],	%i1
	fpadd32	%f30,	%f24,	%f18
	stx	%g3,	[%l7 + 0x48]
	edge16ln	%o3,	%g5,	%l4
	movvc	%icc,	%o0,	%l5
	fmovscs	%xcc,	%f6,	%f1
	fcmple32	%f6,	%f24,	%o6
	movl	%xcc,	%g1,	%g6
	edge32l	%g7,	%o4,	%l3
	fmovrde	%l0,	%f14,	%f28
	fmovsl	%icc,	%f13,	%f18
	sir	0x0FBE
	orcc	%o1,	%o5,	%i2
	alignaddr	%i4,	%l2,	%l6
	umul	%g2,	0x1F7E,	%i6
	ldd	[%l7 + 0x60],	%i6
	movcc	%xcc,	%g4,	%i3
	andcc	%l1,	0x0CBF,	%o7
	edge8ln	%i0,	%o2,	%i1
	fmul8ulx16	%f26,	%f8,	%f20
	alignaddrl	%i5,	%o3,	%g3
	andcc	%l4,	0x0969,	%g5
	fcmpgt32	%f4,	%f30,	%o0
	movvs	%xcc,	%o6,	%l5
	siam	0x6
	fsrc1	%f2,	%f4
	udivcc	%g1,	0x0C13,	%g6
	fpadd16	%f2,	%f14,	%f22
	movgu	%xcc,	%o4,	%g7
	std	%f14,	[%l7 + 0x40]
	fmovdg	%icc,	%f24,	%f8
	movl	%xcc,	%l0,	%o1
	alignaddrl	%l3,	%i2,	%o5
	ld	[%l7 + 0x2C],	%f31
	stb	%i4,	[%l7 + 0x26]
	ldd	[%l7 + 0x48],	%f14
	fcmpd	%fcc2,	%f12,	%f6
	xorcc	%l2,	0x1659,	%l6
	fnot2	%f30,	%f4
	fmovsvc	%xcc,	%f30,	%f5
	fpack32	%f24,	%f16,	%f4
	alignaddrl	%g2,	%i6,	%g4
	movvc	%icc,	%i7,	%l1
	movgu	%xcc,	%i3,	%i0
	ldub	[%l7 + 0x43],	%o7
	srax	%o2,	%i5,	%o3
	fmovse	%icc,	%f3,	%f13
	fcmped	%fcc1,	%f4,	%f24
	array32	%i1,	%l4,	%g3
	ldx	[%l7 + 0x18],	%o0
	umulcc	%o6,	%g5,	%l5
	andncc	%g1,	%g6,	%g7
	movre	%o4,	0x0F6,	%o1
	sth	%l0,	[%l7 + 0x7C]
	fxnors	%f19,	%f12,	%f9
	movg	%icc,	%i2,	%l3
	fxors	%f24,	%f2,	%f13
	fmovsn	%icc,	%f19,	%f15
	sethi	0x087F,	%o5
	fmovdleu	%xcc,	%f0,	%f20
	movl	%xcc,	%l2,	%i4
	sth	%g2,	[%l7 + 0x24]
	orn	%i6,	0x1B7E,	%l6
	fcmpgt16	%f8,	%f28,	%i7
	andn	%l1,	0x0536,	%i3
	stw	%g4,	[%l7 + 0x74]
	movne	%icc,	%i0,	%o2
	sdiv	%o7,	0x005E,	%i5
	orcc	%i1,	0x0667,	%o3
	mova	%icc,	%g3,	%o0
	sethi	0x0078,	%l4
	sth	%g5,	[%l7 + 0x0E]
	stx	%l5,	[%l7 + 0x10]
	nop
	set	0x20, %l0
	std	%f18,	[%l7 + %l0]
	srl	%g1,	%g6,	%g7
	fcmpeq32	%f4,	%f8,	%o6
	siam	0x2
	srlx	%o4,	0x0D,	%o1
	movvc	%icc,	%i2,	%l3
	fsrc2s	%f8,	%f6
	alignaddr	%o5,	%l0,	%l2
	popc	%g2,	%i6
	fmovs	%f28,	%f10
	sra	%l6,	0x18,	%i7
	edge16l	%l1,	%i4,	%i3
	subcc	%i0,	0x1E25,	%o2
	fornot2	%f12,	%f26,	%f4
	movrne	%g4,	%i5,	%i1
	sethi	0x048D,	%o7
	fpsub32s	%f21,	%f17,	%f20
	lduh	[%l7 + 0x74],	%g3
	edge16l	%o3,	%l4,	%g5
	edge32n	%o0,	%l5,	%g6
	lduh	[%l7 + 0x2A],	%g1
	movrgez	%g7,	%o6,	%o4
	udiv	%o1,	0x0482,	%l3
	fmovsge	%icc,	%f24,	%f3
	fnands	%f26,	%f16,	%f3
	sllx	%o5,	%l0,	%l2
	ldsw	[%l7 + 0x78],	%g2
	fmovde	%xcc,	%f20,	%f26
	subc	%i6,	%l6,	%i7
	umulcc	%l1,	%i2,	%i4
	movpos	%icc,	%i0,	%o2
	sll	%i3,	%g4,	%i5
	movpos	%xcc,	%o7,	%i1
	fmovdge	%icc,	%f12,	%f19
	lduh	[%l7 + 0x68],	%o3
	udivcc	%g3,	0x1861,	%g5
	sll	%l4,	0x10,	%l5
	array16	%g6,	%o0,	%g1
	ldsb	[%l7 + 0x3C],	%o6
	mulx	%o4,	%g7,	%l3
	ldsb	[%l7 + 0x32],	%o5
	edge16ln	%l0,	%l2,	%g2
	fmovd	%f2,	%f16
	fors	%f1,	%f14,	%f8
	movgu	%icc,	%o1,	%i6
	sra	%l6,	0x1F,	%l1
	edge8	%i2,	%i4,	%i7
	umulcc	%o2,	%i3,	%g4
	ldsw	[%l7 + 0x2C],	%i5
	fpmerge	%f13,	%f31,	%f18
	alignaddr	%o7,	%i0,	%i1
	edge16l	%g3,	%o3,	%l4
	ldd	[%l7 + 0x38],	%g4
	subc	%l5,	%g6,	%o0
	movrgz	%o6,	%g1,	%o4
	movpos	%icc,	%g7,	%l3
	edge16	%o5,	%l2,	%l0
	fmovse	%icc,	%f26,	%f23
	andncc	%g2,	%i6,	%o1
	movvc	%xcc,	%l1,	%l6
	ldsh	[%l7 + 0x3A],	%i4
	fmovsl	%xcc,	%f13,	%f19
	xnorcc	%i7,	%o2,	%i3
	orncc	%g4,	%i5,	%o7
	nop
	set	0x68, %o1
	ldx	[%l7 + %o1],	%i0
	fcmple32	%f30,	%f4,	%i2
	movrgz	%g3,	%o3,	%i1
	movge	%icc,	%g5,	%l5
	edge8ln	%l4,	%o0,	%g6
	mulx	%o6,	0x1C1F,	%g1
	fmovrsgez	%g7,	%f7,	%f30
	stx	%l3,	[%l7 + 0x20]
	andncc	%o5,	%o4,	%l2
	lduh	[%l7 + 0x0C],	%g2
	subcc	%i6,	0x0F8F,	%l0
	ldd	[%l7 + 0x18],	%f2
	movcs	%icc,	%o1,	%l1
	sllx	%i4,	0x16,	%l6
	mulscc	%o2,	%i3,	%g4
	xnorcc	%i7,	%i5,	%i0
	umulcc	%i2,	%g3,	%o3
	orcc	%i1,	0x0096,	%g5
	sub	%l5,	%l4,	%o7
	popc	0x1ACA,	%o0
	fcmpgt32	%f16,	%f4,	%o6
	movneg	%xcc,	%g1,	%g7
	sdiv	%l3,	0x0AC2,	%o5
	sethi	0x0431,	%o4
	edge32l	%l2,	%g2,	%i6
	movge	%icc,	%l0,	%o1
	fmovrsgez	%l1,	%f21,	%f8
	move	%icc,	%i4,	%l6
	alignaddrl	%g6,	%o2,	%i3
	lduw	[%l7 + 0x08],	%g4
	ldd	[%l7 + 0x58],	%f26
	movrlez	%i5,	0x3F5,	%i0
	xnor	%i7,	%g3,	%o3
	fpsub32s	%f15,	%f21,	%f17
	add	%i1,	0x05AD,	%i2
	array32	%l5,	%g5,	%l4
	srl	%o0,	0x06,	%o7
	fnors	%f3,	%f0,	%f5
	lduw	[%l7 + 0x44],	%g1
	fsrc2	%f24,	%f20
	edge16ln	%g7,	%l3,	%o5
	fcmple16	%f0,	%f0,	%o4
	popc	%l2,	%g2
	andn	%i6,	%l0,	%o6
	sra	%o1,	%i4,	%l1
	movcc	%icc,	%l6,	%g6
	orncc	%i3,	0x129F,	%g4
	addccc	%o2,	0x0AF3,	%i5
	andn	%i7,	%g3,	%o3
	fnand	%f24,	%f4,	%f18
	sub	%i1,	%i2,	%l5
	movre	%i0,	%g5,	%l4
	ldsb	[%l7 + 0x41],	%o0
	fmovdle	%icc,	%f4,	%f6
	movne	%xcc,	%o7,	%g7
	movcc	%xcc,	%g1,	%o5
	nop
	set	0x40, %l5
	std	%f16,	[%l7 + %l5]
	edge8l	%l3,	%o4,	%l2
	fmul8ulx16	%f8,	%f24,	%f2
	movrne	%g2,	%i6,	%l0
	ldd	[%l7 + 0x60],	%f20
	edge8n	%o6,	%o1,	%i4
	ldd	[%l7 + 0x58],	%i6
	orn	%g6,	0x0D60,	%l1
	edge16	%g4,	%o2,	%i3
	sub	%i7,	0x0D09,	%i5
	sra	%g3,	0x15,	%o3
	movrlez	%i1,	%l5,	%i0
	addccc	%i2,	%g5,	%l4
	andn	%o0,	0x0CA3,	%g7
	fmovrdne	%o7,	%f22,	%f20
	fcmpne32	%f12,	%f16,	%g1
	edge16	%o5,	%l3,	%o4
	stb	%g2,	[%l7 + 0x67]
	xnor	%i6,	0x101C,	%l0
	addc	%l2,	0x1599,	%o1
	mova	%icc,	%i4,	%l6
	ld	[%l7 + 0x5C],	%f9
	sub	%g6,	0x1432,	%o6
	movl	%xcc,	%g4,	%l1
	movgu	%xcc,	%o2,	%i7
	movne	%xcc,	%i5,	%g3
	fnot2s	%f4,	%f11
	or	%i3,	0x16E2,	%o3
	sll	%l5,	0x07,	%i0
	orcc	%i1,	0x0AE2,	%i2
	st	%f17,	[%l7 + 0x10]
	ldsh	[%l7 + 0x5A],	%l4
	fmovda	%xcc,	%f0,	%f4
	fornot2	%f0,	%f28,	%f30
	fcmpes	%fcc2,	%f30,	%f0
	ldx	[%l7 + 0x28],	%o0
	movvc	%xcc,	%g7,	%g5
	movne	%xcc,	%g1,	%o5
	movpos	%xcc,	%l3,	%o7
	fmul8x16au	%f27,	%f12,	%f6
	fmovrslz	%g2,	%f29,	%f8
	fnand	%f2,	%f8,	%f14
	fpsub32s	%f8,	%f25,	%f26
	addcc	%i6,	%o4,	%l0
	fnors	%f24,	%f24,	%f30
	xnor	%o1,	%i4,	%l2
	edge32n	%l6,	%g6,	%o6
	udivx	%g4,	0x1975,	%l1
	mulx	%o2,	0x189C,	%i5
	udiv	%i7,	0x12EC,	%i3
	fpackfix	%f14,	%f11
	fornot2	%f4,	%f26,	%f20
	subcc	%g3,	0x09FD,	%l5
	movrlez	%i0,	0x032,	%o3
	popc	0x1569,	%i1
	edge16	%i2,	%l4,	%g7
	umulcc	%g5,	%g1,	%o5
	array32	%l3,	%o7,	%o0
	ldsb	[%l7 + 0x31],	%i6
	array16	%g2,	%o4,	%l0
	mulscc	%o1,	%i4,	%l6
	movvs	%xcc,	%g6,	%l2
	movpos	%xcc,	%o6,	%g4
	movpos	%icc,	%l1,	%i5
	movn	%icc,	%i7,	%o2
	movcs	%icc,	%g3,	%l5
	fmovsge	%xcc,	%f18,	%f7
	movcc	%xcc,	%i0,	%o3
	xor	%i1,	0x0A00,	%i3
	movre	%l4,	%i2,	%g5
	srlx	%g7,	0x00,	%g1
	fmovse	%xcc,	%f2,	%f27
	mova	%xcc,	%l3,	%o5
	array16	%o7,	%i6,	%g2
	sth	%o0,	[%l7 + 0x64]
	std	%f6,	[%l7 + 0x60]
	movrne	%l0,	0x3F2,	%o1
	movre	%o4,	%l6,	%g6
	addccc	%l2,	%i4,	%g4
	fpmerge	%f8,	%f18,	%f18
	fpadd16	%f12,	%f20,	%f8
	edge8l	%o6,	%l1,	%i5
	fcmpne16	%f30,	%f14,	%i7
	fornot1s	%f24,	%f15,	%f4
	movcs	%xcc,	%g3,	%l5
	smulcc	%o2,	%i0,	%o3
	fpsub32	%f20,	%f10,	%f20
	movl	%xcc,	%i3,	%l4
	ldsw	[%l7 + 0x58],	%i1
	fnands	%f20,	%f25,	%f24
	edge16ln	%g5,	%g7,	%i2
	edge32l	%g1,	%o5,	%o7
	subccc	%i6,	%l3,	%o0
	alignaddr	%g2,	%o1,	%o4
	orcc	%l0,	%g6,	%l6
	xnorcc	%l2,	%i4,	%o6
	ldub	[%l7 + 0x2A],	%g4
	ldd	[%l7 + 0x68],	%i4
	xorcc	%l1,	0x10CF,	%i7
	edge8ln	%g3,	%l5,	%i0
	addc	%o2,	%o3,	%i3
	stw	%l4,	[%l7 + 0x40]
	array8	%g5,	%g7,	%i2
	sdiv	%g1,	0x1BCA,	%o5
	fmovdgu	%icc,	%f27,	%f2
	movpos	%xcc,	%o7,	%i6
	fcmpeq32	%f12,	%f4,	%l3
	stx	%i1,	[%l7 + 0x30]
	or	%g2,	0x16F9,	%o0
	subcc	%o4,	0x1B08,	%l0
	movneg	%xcc,	%o1,	%g6
	addc	%l6,	0x1227,	%l2
	edge8	%i4,	%o6,	%i5
	array32	%l1,	%g4,	%g3
	sdiv	%i7,	0x0845,	%i0
	movrgez	%l5,	%o3,	%i3
	mulscc	%o2,	0x006F,	%l4
	sll	%g7,	%g5,	%i2
	subc	%o5,	%g1,	%o7
	movne	%icc,	%l3,	%i6
	nop
	set	0x58, %i3
	ldsw	[%l7 + %i3],	%i1
	stw	%g2,	[%l7 + 0x14]
	edge32ln	%o4,	%l0,	%o1
	movrgez	%o0,	%g6,	%l2
	orcc	%i4,	%l6,	%o6
	movcc	%icc,	%i5,	%l1
	add	%g4,	%i7,	%i0
	sir	0x0170
	edge32n	%g3,	%o3,	%l5
	addccc	%o2,	0x08A7,	%i3
	srl	%l4,	0x15,	%g5
	sethi	0x1C31,	%g7
	ldd	[%l7 + 0x38],	%o4
	movre	%g1,	0x098,	%o7
	xnorcc	%i2,	%l3,	%i1
	movre	%i6,	0x259,	%g2
	popc	%o4,	%l0
	siam	0x4
	fnegd	%f30,	%f2
	ld	[%l7 + 0x44],	%f12
	fmovrdgz	%o1,	%f26,	%f6
	edge8	%g6,	%l2,	%o0
	edge16ln	%i4,	%l6,	%i5
	movvs	%icc,	%o6,	%g4
	ldsw	[%l7 + 0x08],	%l1
	mova	%xcc,	%i0,	%g3
	andcc	%o3,	0x1AE7,	%i7
	fmovdleu	%icc,	%f29,	%f9
	orn	%l5,	%i3,	%l4
	orcc	%g5,	%o2,	%o5
	orncc	%g7,	0x0C9B,	%g1
	popc	0x1A28,	%o7
	alignaddr	%l3,	%i2,	%i6
	srlx	%g2,	%o4,	%l0
	stw	%i1,	[%l7 + 0x0C]
	array8	%o1,	%g6,	%l2
	edge8n	%i4,	%l6,	%o0
	sdiv	%i5,	0x1C4C,	%g4
	st	%f25,	[%l7 + 0x38]
	orcc	%o6,	0x00CC,	%l1
	fpsub32s	%f5,	%f15,	%f10
	movcc	%xcc,	%i0,	%g3
	sdivcc	%o3,	0x19AE,	%i7
	ldx	[%l7 + 0x28],	%l5
	fmovsn	%xcc,	%f30,	%f25
	fsrc2	%f18,	%f30
	ldd	[%l7 + 0x50],	%f14
	movn	%icc,	%i3,	%l4
	ldsh	[%l7 + 0x14],	%o2
	mova	%icc,	%g5,	%o5
	ldsh	[%l7 + 0x18],	%g7
	edge8l	%g1,	%l3,	%o7
	ldsh	[%l7 + 0x48],	%i6
	ldd	[%l7 + 0x38],	%f30
	array16	%i2,	%o4,	%g2
	edge16	%i1,	%o1,	%l0
	movrlz	%g6,	%l2,	%l6
	sdivcc	%o0,	0x15F4,	%i4
	array8	%i5,	%g4,	%o6
	lduw	[%l7 + 0x28],	%l1
	fnegs	%f15,	%f0
	nop
	set	0x6C, %g1
	lduw	[%l7 + %g1],	%g3
	sdiv	%o3,	0x0A93,	%i7
	fpadd16s	%f1,	%f8,	%f19
	smulcc	%l5,	0x074D,	%i0
	ldsw	[%l7 + 0x64],	%l4
	movre	%i3,	%g5,	%o2
	movl	%xcc,	%g7,	%o5
	bshuffle	%f26,	%f4,	%f2
	stw	%g1,	[%l7 + 0x38]
	movl	%icc,	%o7,	%l3
	ldx	[%l7 + 0x20],	%i2
	movcs	%xcc,	%i6,	%o4
	fpack16	%f20,	%f17
	subccc	%g2,	0x0C67,	%i1
	andn	%o1,	%l0,	%l2
	addc	%l6,	0x0ED5,	%g6
	fmovse	%icc,	%f5,	%f9
	srlx	%o0,	0x02,	%i5
	movrne	%g4,	0x33A,	%o6
	fones	%f0
	std	%f20,	[%l7 + 0x60]
	movvs	%xcc,	%l1,	%i4
	ld	[%l7 + 0x7C],	%f27
	move	%icc,	%g3,	%o3
	nop
	set	0x20, %l2
	std	%f28,	[%l7 + %l2]
	fxnor	%f18,	%f20,	%f20
	ldsb	[%l7 + 0x7C],	%l5
	movneg	%xcc,	%i0,	%l4
	udivx	%i7,	0x1FB6,	%g5
	movvc	%xcc,	%i3,	%g7
	sra	%o5,	%g1,	%o7
	fnot2	%f26,	%f14
	sll	%o2,	%i2,	%l3
	movge	%icc,	%i6,	%g2
	movpos	%xcc,	%i1,	%o1
	edge32	%o4,	%l2,	%l0
	xor	%l6,	0x159E,	%o0
	fpackfix	%f12,	%f5
	array32	%g6,	%i5,	%o6
	sth	%g4,	[%l7 + 0x20]
	movrlez	%i4,	%g3,	%o3
	ldsb	[%l7 + 0x22],	%l1
	xorcc	%l5,	%l4,	%i0
	fmovscs	%icc,	%f0,	%f20
	movcs	%xcc,	%g5,	%i7
	fcmple32	%f28,	%f8,	%g7
	movcc	%icc,	%i3,	%o5
	xnorcc	%g1,	%o2,	%o7
	movvs	%icc,	%l3,	%i2
	stw	%g2,	[%l7 + 0x74]
	fmovdcc	%xcc,	%f14,	%f4
	edge8ln	%i6,	%o1,	%o4
	ldsb	[%l7 + 0x5F],	%i1
	sub	%l2,	0x190C,	%l0
	sethi	0x18A2,	%o0
	movrlz	%g6,	%l6,	%i5
	orn	%o6,	%i4,	%g4
	fmovrdgez	%o3,	%f20,	%f28
	array16	%l1,	%l5,	%g3
	subc	%l4,	0x1F1F,	%g5
	edge8ln	%i0,	%i7,	%g7
	sdivcc	%i3,	0x18E2,	%o5
	fmovde	%xcc,	%f21,	%f2
	sth	%g1,	[%l7 + 0x2E]
	movcc	%xcc,	%o2,	%l3
	fmovrsgez	%o7,	%f27,	%f2
	fmovdcc	%icc,	%f31,	%f29
	edge32ln	%g2,	%i2,	%o1
	lduh	[%l7 + 0x76],	%o4
	alignaddrl	%i1,	%i6,	%l0
	movrlz	%o0,	%g6,	%l2
	xor	%i5,	%o6,	%l6
	sllx	%g4,	0x15,	%o3
	fandnot2	%f20,	%f4,	%f22
	mulx	%i4,	0x1A33,	%l1
	fpsub32s	%f2,	%f26,	%f18
	sra	%g3,	%l4,	%g5
	udiv	%i0,	0x1E35,	%i7
	sdivx	%l5,	0x01CF,	%g7
	stx	%i3,	[%l7 + 0x40]
	fmuld8ulx16	%f17,	%f6,	%f16
	array32	%o5,	%g1,	%o2
	fzero	%f10
	fmovsle	%xcc,	%f13,	%f9
	movrne	%o7,	0x30B,	%g2
	fmuld8ulx16	%f27,	%f2,	%f30
	srlx	%l3,	%o1,	%o4
	subc	%i2,	%i1,	%l0
	movpos	%icc,	%o0,	%g6
	movrlz	%i6,	0x202,	%i5
	movrlez	%o6,	0x371,	%l2
	fmovdl	%xcc,	%f3,	%f23
	alignaddr	%l6,	%g4,	%i4
	movneg	%xcc,	%o3,	%l1
	edge16n	%g3,	%l4,	%i0
	smul	%g5,	%i7,	%l5
	movrne	%g7,	0x233,	%o5
	ldd	[%l7 + 0x70],	%i2
	movneg	%icc,	%g1,	%o2
	ldsh	[%l7 + 0x58],	%o7
	fmovdge	%xcc,	%f6,	%f13
	addccc	%g2,	%o1,	%o4
	movrlz	%i2,	%i1,	%l0
	or	%o0,	0x111E,	%l3
	movne	%xcc,	%g6,	%i5
	sub	%i6,	0x1585,	%o6
	edge32l	%l6,	%l2,	%g4
	ldub	[%l7 + 0x21],	%o3
	xor	%l1,	0x0928,	%i4
	alignaddr	%g3,	%l4,	%i0
	andcc	%i7,	%l5,	%g7
	sethi	0x02A8,	%o5
	ldd	[%l7 + 0x68],	%f22
	fcmpeq16	%f30,	%f28,	%i3
	udiv	%g1,	0x0050,	%g5
	orncc	%o2,	%g2,	%o1
	fpack32	%f8,	%f26,	%f22
	addccc	%o4,	0x1208,	%i2
	movvc	%xcc,	%i1,	%l0
	movre	%o0,	0x201,	%l3
	udivcc	%o7,	0x088F,	%i5
	fmovs	%f15,	%f1
	sth	%i6,	[%l7 + 0x14]
	smulcc	%o6,	%g6,	%l2
	mulscc	%l6,	0x02F8,	%g4
	fnand	%f12,	%f0,	%f6
	ldd	[%l7 + 0x40],	%l0
	alignaddr	%o3,	%i4,	%g3
	addcc	%i0,	0x1B1A,	%i7
	fmovdvc	%icc,	%f1,	%f9
	movrgez	%l4,	%l5,	%o5
	alignaddr	%g7,	%i3,	%g1
	andcc	%g5,	%o2,	%o1
	alignaddrl	%o4,	%i2,	%g2
	edge32ln	%l0,	%o0,	%l3
	subccc	%o7,	%i1,	%i5
	orncc	%o6,	0x1F0A,	%g6
	fsrc1s	%f31,	%f28
	addcc	%l2,	0x0F8E,	%l6
	fzeros	%f13
	fmovrdne	%i6,	%f6,	%f14
	stx	%l1,	[%l7 + 0x60]
	edge8ln	%g4,	%i4,	%o3
	subccc	%i0,	0x1177,	%i7
	fcmple16	%f26,	%f6,	%l4
	movne	%xcc,	%l5,	%g3
	edge16ln	%o5,	%i3,	%g1
	edge16n	%g5,	%g7,	%o2
	fnor	%f26,	%f24,	%f28
	sra	%o4,	0x14,	%i2
	fand	%f6,	%f12,	%f30
	movrne	%g2,	0x133,	%o1
	movge	%xcc,	%o0,	%l0
	movge	%xcc,	%l3,	%o7
	ldub	[%l7 + 0x2E],	%i1
	mulscc	%o6,	0x0CE5,	%i5
	xor	%g6,	%l2,	%i6
	ldd	[%l7 + 0x70],	%l0
	fcmpes	%fcc2,	%f15,	%f7
	fcmpes	%fcc3,	%f23,	%f8
	move	%icc,	%g4,	%i4
	fmovsa	%xcc,	%f1,	%f5
	umul	%o3,	0x0BB3,	%i0
	faligndata	%f28,	%f12,	%f14
	edge32n	%l6,	%i7,	%l5
	popc	0x0ACB,	%l4
	ldd	[%l7 + 0x10],	%f6
	fmovrdgz	%g3,	%f16,	%f14
	array8	%o5,	%g1,	%i3
	ldsh	[%l7 + 0x1A],	%g7
	fnand	%f2,	%f6,	%f16
	fxnors	%f13,	%f11,	%f17
	subcc	%g5,	0x113C,	%o2
	ldub	[%l7 + 0x19],	%i2
	movne	%xcc,	%o4,	%g2
	array8	%o1,	%o0,	%l3
	movl	%icc,	%l0,	%i1
	stx	%o7,	[%l7 + 0x10]
	srlx	%i5,	0x13,	%o6
	sir	0x1AE7
	fxnor	%f20,	%f2,	%f18
	fmovdleu	%xcc,	%f28,	%f31
	alignaddrl	%g6,	%i6,	%l2
	and	%l1,	%g4,	%i4
	ldd	[%l7 + 0x38],	%f28
	edge16	%o3,	%l6,	%i0
	movrgez	%l5,	0x3E2,	%i7
	fnegs	%f30,	%f29
	ldsw	[%l7 + 0x38],	%g3
	andcc	%l4,	%o5,	%i3
	fxnor	%f4,	%f18,	%f24
	xnorcc	%g1,	0x0C08,	%g7
	fors	%f10,	%f30,	%f15
	movrlz	%o2,	%i2,	%o4
	srl	%g2,	0x1D,	%g5
	fmovrslez	%o1,	%f6,	%f29
	alignaddr	%l3,	%o0,	%i1
	srlx	%o7,	%i5,	%l0
	movpos	%icc,	%g6,	%o6
	array8	%l2,	%l1,	%g4
	edge16	%i6,	%i4,	%o3
	edge16l	%l6,	%i0,	%i7
	movrgez	%g3,	0x21A,	%l5
	edge32	%o5,	%l4,	%g1
	ldsh	[%l7 + 0x66],	%i3
	xnor	%o2,	0x13D6,	%g7
	fmovrslez	%o4,	%f14,	%f11
	ld	[%l7 + 0x34],	%f17
	edge8	%g2,	%i2,	%g5
	fsrc2s	%f23,	%f4
	umul	%o1,	%l3,	%o0
	edge16ln	%o7,	%i1,	%i5
	udivcc	%l0,	0x02CB,	%o6
	smul	%g6,	0x0A1D,	%l1
	subccc	%g4,	0x1338,	%i6
	orncc	%i4,	0x0555,	%o3
	mova	%icc,	%l6,	%l2
	movle	%xcc,	%i0,	%g3
	fcmped	%fcc3,	%f20,	%f12
	movgu	%xcc,	%l5,	%i7
	sdivx	%o5,	0x0BE8,	%l4
	fpack32	%f4,	%f18,	%f14
	sth	%g1,	[%l7 + 0x28]
	orcc	%o2,	0x012D,	%g7
	xorcc	%i3,	0x12ED,	%o4
	move	%xcc,	%g2,	%g5
	fcmpeq32	%f24,	%f28,	%i2
	fornot1	%f12,	%f10,	%f26
	xor	%o1,	0x0A4F,	%l3
	array8	%o7,	%o0,	%i1
	fpackfix	%f4,	%f6
	fcmple32	%f10,	%f20,	%l0
	subcc	%i5,	%o6,	%g6
	movvc	%xcc,	%l1,	%i6
	udiv	%g4,	0x160F,	%o3
	sir	0x1AB9
	sethi	0x1951,	%i4
	array32	%l6,	%i0,	%l2
	movcs	%xcc,	%l5,	%i7
	xorcc	%o5,	0x1637,	%g3
	smulcc	%g1,	0x1ABF,	%l4
	mulx	%g7,	%i3,	%o2
	fsrc2	%f26,	%f26
	sth	%o4,	[%l7 + 0x56]
	edge32n	%g2,	%i2,	%o1
	sdivcc	%l3,	0x0B53,	%g5
	smul	%o7,	0x189C,	%o0
	edge32	%l0,	%i5,	%i1
	movvs	%xcc,	%o6,	%g6
	xorcc	%i6,	%l1,	%o3
	fxors	%f18,	%f31,	%f4
	fmovsvs	%xcc,	%f22,	%f24
	xnorcc	%i4,	%g4,	%l6
	sdivcc	%l2,	0x0EE7,	%i0
	fmovd	%f22,	%f20
	sub	%l5,	0x1DA1,	%i7
	orcc	%o5,	%g1,	%g3
	sub	%g7,	%l4,	%i3
	movgu	%icc,	%o2,	%g2
	udivx	%i2,	0x0AF6,	%o1
	sra	%o4,	%l3,	%o7
	movgu	%icc,	%o0,	%g5
	add	%i5,	0x09B1,	%l0
	lduh	[%l7 + 0x4C],	%i1
	add	%o6,	%i6,	%g6
	array16	%l1,	%i4,	%o3
	fsrc1s	%f19,	%f13
	sdivx	%g4,	0x0F7C,	%l2
	fandnot1s	%f11,	%f22,	%f1
	movrgz	%i0,	0x20A,	%l6
	fzeros	%f30
	movvc	%icc,	%l5,	%i7
	edge16l	%o5,	%g3,	%g7
	ldx	[%l7 + 0x10],	%g1
	fmovrslez	%l4,	%f27,	%f12
	andcc	%o2,	%g2,	%i2
	alignaddr	%i3,	%o4,	%l3
	movrlez	%o1,	0x0C5,	%o7
	addc	%o0,	0x1404,	%g5
	srax	%l0,	%i5,	%o6
	srl	%i6,	0x02,	%i1
	subccc	%g6,	0x0821,	%l1
	fmovsne	%xcc,	%f22,	%f17
	fmovsne	%icc,	%f16,	%f4
	mova	%icc,	%i4,	%g4
	movne	%xcc,	%o3,	%i0
	std	%f0,	[%l7 + 0x48]
	fzero	%f24
	movgu	%icc,	%l2,	%l6
	movg	%icc,	%l5,	%o5
	andcc	%g3,	%g7,	%i7
	fmul8x16au	%f3,	%f7,	%f10
	sth	%l4,	[%l7 + 0x2E]
	edge32l	%g1,	%g2,	%o2
	std	%f10,	[%l7 + 0x38]
	umulcc	%i2,	%i3,	%l3
	fmovscs	%xcc,	%f12,	%f0
	xnorcc	%o1,	%o4,	%o0
	xnor	%o7,	%l0,	%g5
	lduw	[%l7 + 0x40],	%i5
	xnor	%i6,	0x1885,	%i1
	ldd	[%l7 + 0x10],	%f30
	fmul8x16al	%f12,	%f25,	%f0
	array8	%o6,	%g6,	%l1
	alignaddrl	%g4,	%i4,	%i0
	srlx	%o3,	%l2,	%l6
	movn	%xcc,	%o5,	%g3
	stb	%g7,	[%l7 + 0x73]
	bshuffle	%f16,	%f28,	%f22
	ldx	[%l7 + 0x60],	%i7
	fmovdne	%icc,	%f3,	%f8
	sra	%l4,	0x0F,	%l5
	save %g2, 0x0125, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f17
	fmul8x16al	%f6,	%f5,	%f12
	restore %g1, 0x030D, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f22,	%f18
	orncc	%l3,	0x106B,	%o1
	movgu	%xcc,	%i3,	%o4
	addc	%o7,	%l0,	%g5
	move	%icc,	%o0,	%i5
	sllx	%i1,	%i6,	%o6
	udivcc	%g6,	0x126B,	%g4
	edge8	%i4,	%i0,	%o3
	movvs	%icc,	%l1,	%l6
	fmovsa	%icc,	%f12,	%f17
	stw	%l2,	[%l7 + 0x30]
	mova	%icc,	%g3,	%o5
	array16	%i7,	%l4,	%l5
	fzeros	%f27
	ldsw	[%l7 + 0x64],	%g2
	edge8l	%o2,	%g1,	%g7
	andncc	%l3,	%i2,	%i3
	fmul8x16	%f19,	%f28,	%f18
	movrlz	%o4,	0x360,	%o7
	fmovrde	%l0,	%f2,	%f14
	edge16	%o1,	%o0,	%i5
	movcc	%xcc,	%g5,	%i1
	udiv	%i6,	0x070F,	%g6
	movpos	%xcc,	%g4,	%o6
	ldub	[%l7 + 0x4B],	%i4
	subcc	%o3,	0x1317,	%l1
	udivx	%l6,	0x15EA,	%i0
	edge16n	%l2,	%g3,	%o5
	edge16	%i7,	%l4,	%l5
	addc	%o2,	%g2,	%g1
	sdivx	%g7,	0x134C,	%l3
	ldsh	[%l7 + 0x48],	%i2
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	fmovrsgz	%i3,	%f19,	%f7
	edge32	%l0,	%o0,	%o1
	fmuld8sux16	%f28,	%f7,	%f4
	sir	0x035E
	ldub	[%l7 + 0x6F],	%i5
	sth	%g5,	[%l7 + 0x7C]
	srlx	%i6,	%i1,	%g6
	andn	%g4,	%o6,	%i4
	edge32ln	%l1,	%o3,	%l6
	fmovrsne	%l2,	%f1,	%f13
	fmovscs	%icc,	%f25,	%f15
	fmovsneg	%icc,	%f1,	%f21
	fpadd16	%f4,	%f20,	%f24
	fpadd32	%f28,	%f26,	%f22
	umul	%g3,	0x13FA,	%i0
	movle	%xcc,	%i7,	%l4
	fzeros	%f27
	fmovrdgez	%l5,	%f28,	%f26
	edge16	%o2,	%g2,	%o5
	addcc	%g1,	%l3,	%g7
	stw	%i2,	[%l7 + 0x54]
	edge8	%o7,	%i3,	%l0
	movle	%xcc,	%o4,	%o1
	movvc	%xcc,	%o0,	%g5
	addccc	%i5,	%i1,	%i6
	sdiv	%g4,	0x1D1A,	%o6
	movcs	%xcc,	%g6,	%i4
	fmovrsne	%l1,	%f23,	%f2
	for	%f8,	%f26,	%f16
	umulcc	%o3,	%l6,	%g3
	fmovrslz	%l2,	%f1,	%f31
	fmovdge	%icc,	%f29,	%f29
	fmovdpos	%icc,	%f8,	%f31
	array32	%i0,	%i7,	%l4
	ldsh	[%l7 + 0x42],	%l5
	movg	%icc,	%o2,	%g2
	sdiv	%o5,	0x10C4,	%l3
	ld	[%l7 + 0x38],	%f15
	addccc	%g1,	0x1665,	%g7
	udivx	%o7,	0x08F1,	%i3
	fsrc1s	%f22,	%f8
	restore %i2, 0x0FA6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o1,	%o0,	%g5
	movrlez	%i5,	%o4,	%i1
	movgu	%xcc,	%i6,	%o6
	ldsh	[%l7 + 0x10],	%g6
	andn	%i4,	0x02A6,	%l1
	orcc	%g4,	0x0C9D,	%l6
	smul	%g3,	0x1C05,	%l2
	alignaddr	%o3,	%i0,	%i7
	movle	%xcc,	%l4,	%o2
	fpsub32	%f4,	%f4,	%f16
	fmovsne	%icc,	%f5,	%f25
	sll	%g2,	%l5,	%o5
	edge16ln	%l3,	%g1,	%o7
	umul	%i3,	%i2,	%l0
	mova	%xcc,	%g7,	%o1
	fmovdne	%icc,	%f23,	%f3
	addccc	%o0,	0x0EBB,	%i5
	ldsw	[%l7 + 0x70],	%o4
	movn	%icc,	%i1,	%i6
	fabss	%f13,	%f29
	edge8l	%g5,	%g6,	%o6
	fpsub32s	%f21,	%f21,	%f5
	pdist	%f18,	%f6,	%f10
	sdivx	%i4,	0x12C9,	%g4
	popc	0x1669,	%l1
	edge32l	%l6,	%g3,	%o3
	subcc	%l2,	%i7,	%i0
	nop
	set	0x7A, %l3
	ldsh	[%l7 + %l3],	%o2
	alignaddr	%g2,	%l5,	%l4
	fabsd	%f6,	%f0
	nop
	set	0x54, %i4
	ldsw	[%l7 + %i4],	%l3
	and	%g1,	0x1DF4,	%o5
	udivcc	%o7,	0x04A8,	%i3
	fnor	%f0,	%f30,	%f8
	st	%f11,	[%l7 + 0x70]
	addccc	%i2,	%g7,	%l0
	movg	%xcc,	%o1,	%i5
	fmovrde	%o0,	%f20,	%f14
	sll	%i1,	0x0E,	%o4
	lduw	[%l7 + 0x50],	%i6
	andn	%g6,	%o6,	%i4
	movpos	%xcc,	%g4,	%l1
	stx	%g5,	[%l7 + 0x68]
	sra	%l6,	%g3,	%o3
	fnot2	%f0,	%f26
	sdivx	%i7,	0x1015,	%l2
	xnor	%i0,	0x1663,	%g2
	sra	%o2,	0x04,	%l5
	movre	%l4,	0x13C,	%g1
	sll	%l3,	%o7,	%i3
	smul	%i2,	%o5,	%l0
	sll	%g7,	%i5,	%o0
	edge8n	%o1,	%o4,	%i6
	edge16	%g6,	%i1,	%i4
	array8	%o6,	%l1,	%g5
	ldsh	[%l7 + 0x1E],	%l6
	fmovdne	%xcc,	%f12,	%f9
	movleu	%icc,	%g3,	%o3
	ldd	[%l7 + 0x38],	%f22
	andcc	%i7,	%g4,	%i0
	xnorcc	%g2,	%o2,	%l2
	movn	%xcc,	%l4,	%l5
	movn	%icc,	%g1,	%l3
	movl	%icc,	%i3,	%o7
	ldd	[%l7 + 0x30],	%f8
	edge32	%o5,	%l0,	%g7
	mulx	%i5,	%o0,	%i2
	addcc	%o4,	%i6,	%g6
	for	%f4,	%f0,	%f4
	xnor	%o1,	0x0970,	%i4
	fsrc2s	%f0,	%f0
	fmovdcs	%icc,	%f29,	%f27
	save %o6, %l1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f2,	[%l7 + 0x10]
	xor	%g5,	0x14FA,	%g3
	sth	%o3,	[%l7 + 0x54]
	ldx	[%l7 + 0x40],	%l6
	udivcc	%g4,	0x0A65,	%i0
	edge8	%g2,	%i7,	%o2
	st	%f29,	[%l7 + 0x58]
	ldub	[%l7 + 0x7D],	%l4
	ldsw	[%l7 + 0x20],	%l2
	edge16ln	%g1,	%l3,	%l5
	movneg	%icc,	%o7,	%o5
	ldx	[%l7 + 0x70],	%l0
	fmovdg	%xcc,	%f13,	%f15
	edge8l	%g7,	%i5,	%i3
	fmovsa	%icc,	%f11,	%f30
	fmovrslez	%o0,	%f2,	%f21
	subc	%i2,	%i6,	%g6
	ldd	[%l7 + 0x40],	%f14
	movg	%xcc,	%o1,	%o4
	fxors	%f28,	%f31,	%f10
	stb	%o6,	[%l7 + 0x74]
	subc	%l1,	%i4,	%i1
	sdivcc	%g3,	0x0FB4,	%o3
	movrgez	%l6,	%g5,	%g4
	fmovrdlz	%g2,	%f12,	%f22
	add	%i0,	%o2,	%l4
	or	%i7,	0x17B1,	%g1
	array16	%l2,	%l5,	%l3
	stw	%o7,	[%l7 + 0x48]
	movne	%icc,	%o5,	%l0
	mova	%icc,	%g7,	%i5
	stx	%o0,	[%l7 + 0x58]
	movg	%xcc,	%i3,	%i2
	ldx	[%l7 + 0x40],	%i6
	nop
	set	0x3B, %g7
	ldub	[%l7 + %g7],	%g6
	save %o1, 0x0213, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l1,	0x0D56,	%o4
	fmovsne	%xcc,	%f7,	%f25
	orn	%i1,	0x0B31,	%g3
	umul	%o3,	0x1AA3,	%l6
	fsrc2s	%f28,	%f31
	movg	%icc,	%i4,	%g5
	edge32	%g2,	%g4,	%o2
	ld	[%l7 + 0x44],	%f14
	fmovdneg	%icc,	%f6,	%f17
	udivx	%i0,	0x1EBD,	%i7
	movcs	%xcc,	%l4,	%g1
	movre	%l5,	0x2A2,	%l3
	fornot1	%f26,	%f2,	%f10
	fmovsl	%xcc,	%f18,	%f11
	movrgz	%l2,	0x384,	%o5
	edge8	%l0,	%o7,	%g7
	edge16l	%i5,	%i3,	%o0
	ldd	[%l7 + 0x30],	%i2
	movneg	%xcc,	%g6,	%i6
	alignaddr	%o1,	%l1,	%o4
	fandnot2s	%f20,	%f1,	%f11
	save %o6, 0x003A, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i1,	%o3,	%l6
	fzero	%f20
	fcmpgt32	%f16,	%f4,	%i4
	andcc	%g2,	%g5,	%g4
	fmovdne	%icc,	%f17,	%f31
	xnorcc	%i0,	0x11A1,	%i7
	movne	%xcc,	%l4,	%g1
	fpackfix	%f2,	%f15
	fpsub32s	%f17,	%f16,	%f13
	ldx	[%l7 + 0x30],	%o2
	fmul8x16	%f5,	%f10,	%f10
	orcc	%l3,	0x05E1,	%l5
	sub	%l2,	%l0,	%o5
	mova	%icc,	%g7,	%o7
	srl	%i3,	0x1B,	%i5
	srax	%i2,	%g6,	%i6
	movne	%xcc,	%o0,	%o1
	array16	%o4,	%l1,	%g3
	edge8n	%o6,	%i1,	%l6
	fmovde	%icc,	%f14,	%f0
	sub	%o3,	0x0729,	%i4
	edge32l	%g2,	%g5,	%g4
	movre	%i0,	0x3E4,	%i7
	nop
	set	0x34, %l6
	sth	%l4,	[%l7 + %l6]
	popc	0x0762,	%g1
	subcc	%l3,	0x0A3D,	%l5
	fnegd	%f12,	%f26
	edge32ln	%o2,	%l2,	%o5
	movle	%icc,	%g7,	%o7
	orncc	%i3,	%i5,	%l0
	fmovdg	%xcc,	%f28,	%f18
	fpadd16	%f4,	%f10,	%f26
	mulscc	%g6,	%i6,	%o0
	fzeros	%f23
	lduw	[%l7 + 0x64],	%o1
	movrne	%o4,	%l1,	%i2
	fcmpeq16	%f28,	%f30,	%g3
	movgu	%icc,	%o6,	%i1
	fmovscc	%xcc,	%f14,	%f10
	stw	%o3,	[%l7 + 0x60]
	sll	%i4,	%g2,	%l6
	xor	%g5,	%g4,	%i7
	addccc	%i0,	%g1,	%l3
	fmovsge	%xcc,	%f1,	%f13
	udivx	%l4,	0x0BCC,	%l5
	sdivcc	%o2,	0x0315,	%o5
	stb	%g7,	[%l7 + 0x3D]
	orcc	%l2,	0x0A9F,	%o7
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	smul	%l0,	%i6,	%g6
	sdivx	%o0,	0x1E19,	%o1
	fnot1s	%f19,	%f0
	subcc	%l1,	%o4,	%i2
	xor	%g3,	%i1,	%o3
	fnot2s	%f11,	%f8
	fmovdgu	%icc,	%f26,	%f31
	movgu	%xcc,	%i4,	%g2
	andcc	%l6,	0x0194,	%o6
	andncc	%g5,	%g4,	%i7
	xor	%g1,	0x1570,	%i0
	fcmpeq32	%f26,	%f28,	%l4
	and	%l5,	0x032D,	%o2
	sdivx	%o5,	0x0810,	%g7
	fcmple32	%f2,	%f4,	%l2
	umul	%l3,	0x1831,	%o7
	srax	%i5,	%l0,	%i6
	ldsw	[%l7 + 0x40],	%i3
	fmovrsne	%o0,	%f10,	%f11
	andcc	%g6,	%l1,	%o4
	fmovscc	%xcc,	%f31,	%f19
	sdivx	%o1,	0x04D3,	%i2
	mova	%icc,	%g3,	%o3
	alignaddr	%i1,	%i4,	%l6
	movrne	%o6,	%g2,	%g5
	sir	0x02EE
	ld	[%l7 + 0x5C],	%f0
	movle	%icc,	%g4,	%g1
	edge8l	%i7,	%l4,	%l5
	fpadd32s	%f5,	%f28,	%f14
	movn	%icc,	%o2,	%i0
	fmul8x16au	%f21,	%f28,	%f16
	udivx	%o5,	0x146F,	%g7
	mulscc	%l2,	%o7,	%l3
	edge8n	%i5,	%i6,	%i3
	alignaddr	%o0,	%g6,	%l0
	fmuld8sux16	%f28,	%f19,	%f4
	xnorcc	%l1,	0x175D,	%o4
	fpsub32	%f22,	%f12,	%f0
	movgu	%icc,	%o1,	%g3
	alignaddr	%o3,	%i1,	%i4
	fornot2s	%f17,	%f2,	%f25
	ldd	[%l7 + 0x08],	%i2
	edge32l	%o6,	%g2,	%g5
	sll	%l6,	0x0C,	%g1
	edge16ln	%i7,	%l4,	%g4
	addccc	%l5,	%i0,	%o5
	ldx	[%l7 + 0x78],	%o2
	sethi	0x064E,	%g7
	fnot1	%f2,	%f18
	array16	%o7,	%l2,	%l3
	alignaddr	%i5,	%i6,	%o0
	edge8n	%i3,	%l0,	%l1
	fmovse	%icc,	%f24,	%f21
	ldsw	[%l7 + 0x18],	%g6
	sir	0x1A90
	udivx	%o4,	0x07A6,	%g3
	or	%o3,	%o1,	%i1
	fnot2	%f18,	%f0
	movre	%i4,	%i2,	%o6
	restore %g5, 0x0AA9, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g1,	[%l7 + 0x28]
	ldd	[%l7 + 0x28],	%i6
	lduh	[%l7 + 0x2E],	%l6
	stb	%g4,	[%l7 + 0x7D]
	nop
	set	0x54, %i0
	ldub	[%l7 + %i0],	%l4
	movrlez	%i0,	0x3DC,	%l5
	popc	%o2,	%g7
	fcmpeq32	%f24,	%f10,	%o7
	fcmpne16	%f8,	%f20,	%l2
	addccc	%o5,	0x1942,	%i5
	movgu	%xcc,	%l3,	%i6
	fmovsvs	%xcc,	%f26,	%f6
	movgu	%xcc,	%i3,	%l0
	subc	%l1,	%g6,	%o0
	addc	%o4,	0x038D,	%g3
	ld	[%l7 + 0x5C],	%f21
	fpsub32	%f14,	%f20,	%f2
	stw	%o3,	[%l7 + 0x20]
	fnot1s	%f20,	%f31
	movrne	%o1,	%i4,	%i1
	movcc	%xcc,	%o6,	%g5
	sra	%g2,	%g1,	%i2
	edge32ln	%i7,	%l6,	%l4
	std	%f2,	[%l7 + 0x28]
	alignaddr	%g4,	%l5,	%i0
	or	%g7,	%o7,	%l2
	umul	%o5,	%i5,	%o2
	mulscc	%i6,	0x02A5,	%l3
	ldsb	[%l7 + 0x18],	%l0
	fmovsl	%xcc,	%f5,	%f23
	edge16n	%i3,	%l1,	%g6
	xor	%o4,	0x0D78,	%o0
	srax	%g3,	%o1,	%i4
	fmuld8sux16	%f21,	%f30,	%f0
	edge16	%i1,	%o3,	%o6
	fornot2	%f16,	%f8,	%f16
	sir	0x018F
	edge32n	%g2,	%g1,	%i2
	array16	%g5,	%l6,	%l4
	umulcc	%i7,	%g4,	%i0
	fmovscs	%icc,	%f29,	%f22
	andncc	%g7,	%o7,	%l2
	subc	%l5,	%o5,	%i5
	xor	%o2,	0x153D,	%l3
	fpsub32	%f14,	%f30,	%f2
	xorcc	%l0,	%i3,	%i6
	sir	0x0187
	srax	%g6,	%o4,	%o0
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	fmovrse	%i1,	%f24,	%f31
	fxnor	%f6,	%f2,	%f14
	movrlez	%o3,	0x163,	%o6
	movneg	%icc,	%l1,	%g2
	alignaddrl	%i2,	%g5,	%l6
	fmovscc	%xcc,	%f5,	%f26
	udivcc	%g1,	0x0F83,	%i7
	subc	%l4,	%i0,	%g4
	fors	%f19,	%f7,	%f30
	movl	%xcc,	%o7,	%g7
	or	%l5,	0x0C5F,	%o5
	fornot1s	%f12,	%f12,	%f24
	alignaddr	%l2,	%i5,	%l3
	bshuffle	%f26,	%f20,	%f4
	addc	%l0,	%i3,	%o2
	stx	%g6,	[%l7 + 0x38]
	array16	%i6,	%o4,	%o0
	ldd	[%l7 + 0x70],	%o0
	popc	0x1BD3,	%g3
	add	%i1,	%i4,	%o3
	fsrc2s	%f13,	%f10
	sllx	%l1,	%g2,	%o6
	sllx	%g5,	%i2,	%l6
	addcc	%g1,	%l4,	%i0
	fmovsa	%xcc,	%f28,	%f31
	fpack16	%f22,	%f3
	sllx	%i7,	%g4,	%g7
	udivx	%l5,	0x0290,	%o7
	umulcc	%o5,	0x070A,	%i5
	sll	%l3,	0x01,	%l2
	save %l0, %i3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f18,	%f8
	edge8n	%g6,	%i6,	%o4
	fpadd16	%f24,	%f20,	%f30
	move	%icc,	%o1,	%o0
	smul	%i1,	%g3,	%i4
	edge32l	%o3,	%l1,	%g2
	mova	%xcc,	%g5,	%i2
	addcc	%l6,	0x195A,	%o6
	mova	%icc,	%g1,	%l4
	fmovrdlz	%i0,	%f10,	%f12
	edge32n	%i7,	%g7,	%l5
	and	%g4,	0x0DCF,	%o5
	std	%f24,	[%l7 + 0x48]
	fmovdle	%xcc,	%f11,	%f4
	mulx	%i5,	%o7,	%l2
	fsrc1s	%f27,	%f3
	movpos	%xcc,	%l3,	%i3
	fcmped	%fcc3,	%f18,	%f20
	sub	%o2,	0x1A5D,	%g6
	movg	%icc,	%l0,	%o4
	udiv	%i6,	0x0C43,	%o1
	fcmps	%fcc0,	%f17,	%f10
	edge32	%o0,	%g3,	%i4
	ldsh	[%l7 + 0x4C],	%o3
	movg	%icc,	%l1,	%i1
	movrne	%g2,	%g5,	%l6
	fmovse	%icc,	%f7,	%f5
	sra	%i2,	0x11,	%g1
	fnot1	%f0,	%f14
	fcmple32	%f8,	%f14,	%l4
	addccc	%i0,	%i7,	%o6
	subc	%g7,	%l5,	%o5
	sth	%i5,	[%l7 + 0x22]
	st	%f26,	[%l7 + 0x20]
	edge32	%g4,	%o7,	%l2
	fcmpd	%fcc1,	%f14,	%f10
	srl	%i3,	0x04,	%l3
	srlx	%g6,	%l0,	%o2
	mulscc	%o4,	%o1,	%i6
	fmovsvc	%xcc,	%f30,	%f1
	ldsw	[%l7 + 0x58],	%o0
	and	%g3,	%i4,	%l1
	subccc	%o3,	%g2,	%i1
	nop
	set	0x38, %i2
	std	%f12,	[%l7 + %i2]
	udiv	%g5,	0x14DC,	%i2
	fmovsle	%icc,	%f9,	%f12
	addccc	%g1,	%l4,	%i0
	fcmpgt16	%f10,	%f12,	%i7
	udiv	%l6,	0x056C,	%o6
	sdiv	%g7,	0x0F84,	%l5
	addccc	%o5,	0x0F6F,	%g4
	smulcc	%i5,	0x18B7,	%o7
	srlx	%l2,	0x17,	%l3
	fpackfix	%f4,	%f2
	mulx	%g6,	0x1D2D,	%i3
	ldx	[%l7 + 0x78],	%l0
	subcc	%o4,	0x05E7,	%o1
	ld	[%l7 + 0x34],	%f10
	move	%icc,	%i6,	%o0
	movvs	%xcc,	%o2,	%i4
	edge16ln	%g3,	%l1,	%o3
	std	%f14,	[%l7 + 0x78]
	movrne	%g2,	0x04E,	%g5
	save %i2, %g1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f2,	%f8,	%f2
	movneg	%icc,	%i0,	%l4
	edge16n	%l6,	%i7,	%o6
	fmovdleu	%xcc,	%f3,	%f15
	ldx	[%l7 + 0x10],	%l5
	movrlz	%g7,	0x2C4,	%o5
	array16	%i5,	%g4,	%l2
	nop
	set	0x3C, %o7
	sth	%o7,	[%l7 + %o7]
	sir	0x17EE
	addcc	%g6,	0x1301,	%i3
	movrne	%l0,	0x2F7,	%l3
	orncc	%o4,	%i6,	%o1
	lduw	[%l7 + 0x14],	%o2
	edge8n	%o0,	%g3,	%i4
	sllx	%o3,	0x1C,	%g2
	edge16ln	%g5,	%l1,	%i2
	array32	%g1,	%i0,	%l4
	fands	%f12,	%f21,	%f9
	orncc	%l6,	%i7,	%i1
	fpadd16s	%f3,	%f27,	%f14
	udiv	%o6,	0x199C,	%l5
	stx	%g7,	[%l7 + 0x58]
	edge32	%i5,	%o5,	%g4
	andncc	%l2,	%o7,	%i3
	fmul8ulx16	%f6,	%f4,	%f28
	fmovrslz	%l0,	%f7,	%f12
	movn	%xcc,	%g6,	%l3
	fmovdneg	%icc,	%f16,	%f22
	restore %o4, 0x18A6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x4A, %l4
	sth	%o2,	[%l7 + %l4]
	fand	%f20,	%f8,	%f0
	stx	%o0,	[%l7 + 0x60]
	or	%i6,	%g3,	%i4
	stb	%o3,	[%l7 + 0x72]
	movgu	%icc,	%g5,	%l1
	movvs	%icc,	%g2,	%i2
	std	%f22,	[%l7 + 0x30]
	umulcc	%i0,	%g1,	%l6
	movl	%xcc,	%l4,	%i7
	edge16l	%o6,	%l5,	%g7
	andn	%i1,	0x1079,	%o5
	ldsb	[%l7 + 0x17],	%i5
	fcmpeq32	%f8,	%f28,	%g4
	ldsb	[%l7 + 0x0A],	%o7
	fmovrslez	%l2,	%f31,	%f16
	st	%f22,	[%l7 + 0x64]
	subcc	%l0,	0x03A4,	%g6
	edge32	%i3,	%o4,	%l3
	sth	%o2,	[%l7 + 0x3A]
	movleu	%xcc,	%o0,	%i6
	srax	%o1,	0x14,	%g3
	xor	%i4,	0x0DFB,	%g5
	popc	%l1,	%g2
	edge16n	%o3,	%i0,	%g1
	andn	%i2,	%l6,	%i7
	fnot1	%f8,	%f6
	udivcc	%o6,	0x1617,	%l4
	std	%f28,	[%l7 + 0x60]
	ldub	[%l7 + 0x33],	%l5
	add	%i1,	%o5,	%g7
	ldd	[%l7 + 0x58],	%f20
	sub	%i5,	0x11A8,	%g4
	alignaddrl	%l2,	%o7,	%g6
	ldd	[%l7 + 0x28],	%l0
	fandnot2	%f14,	%f8,	%f12
	xorcc	%i3,	%l3,	%o2
	fors	%f19,	%f24,	%f27
	sdivcc	%o4,	0x0002,	%o0
	mulx	%i6,	0x0D77,	%g3
	movcs	%xcc,	%i4,	%o1
	fcmple32	%f0,	%f2,	%g5
	edge16	%g2,	%l1,	%i0
	lduh	[%l7 + 0x12],	%g1
	edge16l	%o3,	%l6,	%i7
	movl	%icc,	%i2,	%o6
	movvc	%xcc,	%l5,	%i1
	and	%o5,	%g7,	%i5
	fnot1s	%f27,	%f25
	edge8l	%g4,	%l4,	%l2
	and	%o7,	0x0634,	%g6
	movrne	%l0,	%l3,	%i3
	sdivx	%o2,	0x1793,	%o4
	movrgez	%o0,	0x29A,	%i6
	mulx	%i4,	0x0B3C,	%o1
	fzero	%f10
	andncc	%g3,	%g5,	%g2
	stx	%i0,	[%l7 + 0x60]
	movrne	%g1,	%l1,	%o3
	edge8	%l6,	%i2,	%i7
	addc	%l5,	%o6,	%i1
	movle	%icc,	%g7,	%i5
	fmovrdgez	%o5,	%f30,	%f6
	save %l4, 0x1198, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l2,	0x0FBC,	%g6
	addc	%o7,	%l3,	%l0
	fmuld8sux16	%f17,	%f18,	%f30
	movne	%icc,	%i3,	%o4
	subcc	%o0,	0x1C63,	%i6
	fcmpd	%fcc1,	%f24,	%f26
	addccc	%i4,	0x18BA,	%o2
	sllx	%g3,	%g5,	%o1
	nop
	set	0x10, %o0
	lduw	[%l7 + %o0],	%g2
	andncc	%i0,	%l1,	%g1
	fmovdneg	%xcc,	%f7,	%f30
	ldsb	[%l7 + 0x10],	%l6
	move	%xcc,	%i2,	%i7
	andcc	%o3,	%l5,	%i1
	smulcc	%o6,	%i5,	%g7
	srl	%o5,	%g4,	%l4
	udivcc	%l2,	0x0859,	%g6
	movcc	%icc,	%l3,	%l0
	nop
	set	0x50, %o5
	ldsw	[%l7 + %o5],	%i3
	sll	%o7,	0x06,	%o0
	sir	0x0E5A
	fmovdvc	%xcc,	%f11,	%f28
	fzeros	%f30
	addccc	%o4,	0x0D50,	%i6
	array8	%o2,	%i4,	%g3
	sllx	%g5,	%g2,	%i0
	edge32n	%l1,	%g1,	%l6
	sdiv	%i2,	0x1CA6,	%o1
	andncc	%o3,	%i7,	%i1
	smul	%l5,	%o6,	%g7
	lduh	[%l7 + 0x36],	%o5
	edge16l	%g4,	%l4,	%l2
	udiv	%g6,	0x14B4,	%l3
	fsrc1	%f8,	%f14
	fnegs	%f20,	%f21
	edge8n	%i5,	%l0,	%o7
	smul	%i3,	0x12C7,	%o0
	fmovrdne	%o4,	%f0,	%f4
	fmovda	%icc,	%f3,	%f22
	array8	%i6,	%o2,	%i4
	edge16l	%g5,	%g3,	%i0
	and	%g2,	0x14C8,	%g1
	edge16n	%l1,	%i2,	%l6
	sdiv	%o1,	0x12B9,	%o3
	smulcc	%i1,	%l5,	%i7
	xnorcc	%o6,	0x07BD,	%o5
	addccc	%g4,	0x1C4E,	%g7
	fmovse	%icc,	%f9,	%f29
	xorcc	%l2,	0x1BC9,	%l4
	fandnot1	%f2,	%f30,	%f24
	mulx	%l3,	0x0C95,	%g6
	addcc	%i5,	0x147A,	%o7
	orcc	%i3,	%o0,	%l0
	fcmple32	%f6,	%f2,	%i6
	fors	%f13,	%f18,	%f16
	subccc	%o2,	%o4,	%i4
	movcc	%xcc,	%g3,	%i0
	movrgez	%g2,	0x001,	%g1
	xnor	%g5,	%i2,	%l6
	xnorcc	%o1,	0x100E,	%l1
	movvs	%icc,	%o3,	%i1
	edge32ln	%i7,	%o6,	%l5
	fmovde	%xcc,	%f23,	%f27
	edge16n	%g4,	%o5,	%g7
	subccc	%l4,	%l2,	%g6
	andn	%l3,	%o7,	%i5
	fmovsle	%xcc,	%f8,	%f10
	udiv	%i3,	0x0881,	%l0
	movvs	%xcc,	%o0,	%o2
	edge32n	%i6,	%i4,	%o4
	ldd	[%l7 + 0x38],	%i0
	stb	%g3,	[%l7 + 0x0A]
	sub	%g2,	%g1,	%i2
	edge32ln	%g5,	%o1,	%l6
	sethi	0x169E,	%l1
	addcc	%o3,	%i7,	%o6
	xnor	%i1,	0x04B6,	%g4
	xnor	%l5,	%o5,	%g7
	alignaddr	%l2,	%g6,	%l4
	fand	%f14,	%f8,	%f24
	fmovsne	%xcc,	%f1,	%f22
	move	%icc,	%o7,	%l3
	ldsw	[%l7 + 0x3C],	%i5
	ldx	[%l7 + 0x08],	%i3
	fandnot2	%f10,	%f0,	%f6
	fexpand	%f19,	%f8
	sir	0x0FD8
	fpadd16s	%f25,	%f0,	%f3
	fmovrsgez	%l0,	%f16,	%f10
	subc	%o2,	0x05FE,	%o0
	edge8ln	%i4,	%o4,	%i0
	mulx	%g3,	%g2,	%g1
	st	%f5,	[%l7 + 0x14]
	movre	%i2,	0x2D4,	%g5
	fnors	%f8,	%f1,	%f23
	edge16n	%i6,	%o1,	%l1
	mova	%icc,	%l6,	%i7
	move	%xcc,	%o3,	%o6
	udivcc	%i1,	0x1497,	%g4
	movl	%xcc,	%o5,	%g7
	ldsb	[%l7 + 0x38],	%l2
	pdist	%f14,	%f30,	%f22
	alignaddrl	%g6,	%l5,	%o7
	movrgez	%l4,	%l3,	%i5
	st	%f11,	[%l7 + 0x70]
	nop
	set	0x78, %i1
	ldd	[%l7 + %i1],	%f4
	smulcc	%i3,	%o2,	%l0
	array32	%o0,	%i4,	%o4
	andn	%g3,	0x09CF,	%g2
	ldub	[%l7 + 0x25],	%i0
	sethi	0x0A36,	%g1
	mulscc	%i2,	0x1976,	%g5
	fsrc2	%f16,	%f16
	fmovrsgz	%o1,	%f26,	%f9
	sth	%i6,	[%l7 + 0x40]
	fpadd32	%f8,	%f4,	%f8
	std	%f4,	[%l7 + 0x18]
	ldsw	[%l7 + 0x20],	%l1
	subc	%l6,	0x0FFE,	%i7
	edge32l	%o3,	%i1,	%g4
	mova	%icc,	%o6,	%g7
	ldub	[%l7 + 0x7E],	%o5
	addccc	%l2,	%g6,	%o7
	movgu	%xcc,	%l5,	%l4
	sethi	0x094E,	%l3
	subccc	%i5,	0x131B,	%o2
	mulx	%l0,	0x1B38,	%o0
	fmul8x16al	%f24,	%f2,	%f30
	movrgz	%i4,	%o4,	%i3
	movg	%icc,	%g3,	%g2
	fmovd	%f20,	%f0
	ld	[%l7 + 0x20],	%f19
	movrgz	%i0,	%i2,	%g1
	movn	%icc,	%g5,	%o1
	ld	[%l7 + 0x10],	%f14
	fpack32	%f24,	%f20,	%f10
	fcmps	%fcc3,	%f27,	%f7
	movg	%xcc,	%i6,	%l6
	movleu	%xcc,	%l1,	%i7
	andn	%i1,	0x03EC,	%g4
	movrgz	%o6,	0x3F9,	%o3
	move	%icc,	%o5,	%g7
	lduh	[%l7 + 0x4E],	%g6
	edge32ln	%l2,	%l5,	%l4
	fmovrse	%o7,	%f4,	%f6
	fpadd16	%f4,	%f10,	%f22
	move	%icc,	%l3,	%o2
	fmovrdlz	%i5,	%f20,	%f18
	movg	%xcc,	%o0,	%i4
	movgu	%xcc,	%o4,	%l0
	fpadd32	%f28,	%f16,	%f30
	add	%i3,	%g3,	%g2
	edge32ln	%i0,	%g1,	%g5
	edge16l	%i2,	%i6,	%o1
	movn	%icc,	%l1,	%l6
	movcs	%xcc,	%i1,	%g4
	ldd	[%l7 + 0x68],	%i6
	edge32	%o6,	%o5,	%o3
	array16	%g7,	%g6,	%l2
	fzeros	%f28
	movcc	%xcc,	%l4,	%l5
	fmovsl	%xcc,	%f21,	%f29
	sth	%o7,	[%l7 + 0x48]
	mova	%icc,	%l3,	%o2
	mulscc	%i5,	0x0BF8,	%i4
	subcc	%o0,	%o4,	%l0
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	array8	%i3,	%g1,	%g5
	array8	%i0,	%i6,	%i2
	or	%l1,	%o1,	%l6
	andncc	%i1,	%i7,	%o6
	nop
	set	0x37, %g6
	ldsb	[%l7 + %g6],	%o5
	alignaddr	%o3,	%g4,	%g6
	movle	%xcc,	%g7,	%l4
	sub	%l2,	%o7,	%l5
	stb	%o2,	[%l7 + 0x5F]
	edge32	%i5,	%l3,	%i4
	sra	%o4,	0x12,	%l0
	edge32ln	%g3,	%o0,	%i3
	sdiv	%g1,	0x056D,	%g2
	subccc	%i0,	0x153E,	%g5
	fcmpeq32	%f2,	%f30,	%i6
	sir	0x0ED0
	edge16l	%i2,	%o1,	%l6
	udiv	%l1,	0x1749,	%i7
	movcs	%icc,	%i1,	%o6
	movrlez	%o3,	%o5,	%g4
	srax	%g7,	0x0F,	%g6
	srl	%l4,	0x11,	%l2
	movrgez	%l5,	%o7,	%i5
	subcc	%l3,	0x1002,	%o2
	movleu	%xcc,	%o4,	%i4
	fmovrdlz	%g3,	%f20,	%f12
	andcc	%o0,	0x1370,	%i3
	array16	%l0,	%g1,	%i0
	andncc	%g2,	%g5,	%i2
	fmovdleu	%icc,	%f29,	%f24
	fmovrdgz	%o1,	%f4,	%f22
	movg	%xcc,	%i6,	%l6
	fnand	%f14,	%f16,	%f4
	xnorcc	%i7,	0x004C,	%l1
	edge16l	%i1,	%o3,	%o5
	sub	%o6,	0x033C,	%g7
	srl	%g4,	0x1E,	%g6
	stb	%l2,	[%l7 + 0x36]
	orn	%l4,	0x0E7A,	%l5
	fabsd	%f26,	%f2
	subccc	%o7,	%i5,	%l3
	fmovsg	%xcc,	%f20,	%f23
	ldsw	[%l7 + 0x60],	%o2
	udiv	%o4,	0x1C31,	%i4
	array16	%g3,	%o0,	%l0
	fmovrdlez	%g1,	%f0,	%f8
	addcc	%i3,	0x1B83,	%g2
	stw	%g5,	[%l7 + 0x08]
	smulcc	%i2,	0x13D2,	%i0
	movg	%xcc,	%i6,	%o1
	movvc	%icc,	%l6,	%l1
	nop
	set	0x70, %o3
	ldx	[%l7 + %o3],	%i7
	edge16l	%o3,	%i1,	%o5
	nop
	set	0x30, %g2
	ldd	[%l7 + %g2],	%f4
	add	%o6,	0x04CD,	%g4
	edge16ln	%g6,	%l2,	%l4
	ldub	[%l7 + 0x6B],	%g7
	udiv	%o7,	0x153F,	%l5
	sir	0x1145
	xnor	%l3,	%o2,	%i5
	ldx	[%l7 + 0x48],	%o4
	save %i4, %o0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f28,	%f26,	%f10
	orcc	%g1,	0x1414,	%g3
	stb	%g2,	[%l7 + 0x56]
	movge	%xcc,	%g5,	%i3
	mova	%xcc,	%i2,	%i0
	edge8ln	%i6,	%l6,	%o1
	save %l1, 0x084D, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i1,	0x1B7F,	%i7
	smulcc	%o5,	%o6,	%g4
	fandnot2s	%f5,	%f30,	%f16
	srax	%l2,	0x00,	%l4
	udivcc	%g6,	0x1FA7,	%o7
	subccc	%g7,	%l3,	%l5
	move	%icc,	%o2,	%o4
	fmul8ulx16	%f0,	%f20,	%f18
	fnors	%f14,	%f30,	%f16
	array16	%i4,	%i5,	%l0
	movn	%xcc,	%g1,	%o0
	edge16l	%g3,	%g2,	%i3
	alignaddr	%g5,	%i0,	%i6
	movrgz	%i2,	%o1,	%l1
	fmovdleu	%xcc,	%f20,	%f16
	edge16l	%o3,	%i1,	%l6
	fmovdne	%xcc,	%f21,	%f10
	srax	%i7,	0x1B,	%o6
	ldx	[%l7 + 0x48],	%g4
	xorcc	%o5,	%l4,	%g6
	andcc	%l2,	%g7,	%l3
	ldx	[%l7 + 0x48],	%o7
	ldx	[%l7 + 0x50],	%o2
	ldub	[%l7 + 0x55],	%o4
	movre	%i4,	%l5,	%i5
	umul	%g1,	0x11B3,	%l0
	fcmpeq32	%f2,	%f18,	%g3
	movgu	%xcc,	%g2,	%o0
	fabss	%f28,	%f12
	umulcc	%i3,	%g5,	%i6
	andcc	%i0,	%o1,	%l1
	edge8	%o3,	%i2,	%i1
	fmovda	%icc,	%f15,	%f4
	fpack32	%f8,	%f8,	%f14
	movgu	%xcc,	%l6,	%o6
	sethi	0x1FCF,	%i7
	movle	%icc,	%o5,	%l4
	orncc	%g6,	0x0E2C,	%l2
	alignaddr	%g7,	%l3,	%o7
	faligndata	%f22,	%f4,	%f24
	fmovrse	%g4,	%f2,	%f29
	fpack16	%f4,	%f1
	movleu	%xcc,	%o4,	%o2
	st	%f26,	[%l7 + 0x2C]
	movl	%icc,	%i4,	%l5
	subc	%i5,	%g1,	%l0
	edge8ln	%g3,	%g2,	%i3
	movgu	%xcc,	%o0,	%g5
	movgu	%xcc,	%i6,	%i0
	fandnot1s	%f26,	%f1,	%f6
	movre	%l1,	0x056,	%o1
	mulx	%o3,	0x1FAB,	%i1
	fsrc1s	%f19,	%f4
	umul	%i2,	0x0FB5,	%l6
	edge16ln	%i7,	%o6,	%l4
	movne	%xcc,	%o5,	%g6
	movrlz	%g7,	0x242,	%l3
	andcc	%l2,	%o7,	%g4
	ldsh	[%l7 + 0x26],	%o4
	movle	%icc,	%i4,	%o2
	array16	%l5,	%g1,	%i5
	sdiv	%g3,	0x1D08,	%l0
	sethi	0x0998,	%i3
	or	%o0,	%g5,	%g2
	movre	%i0,	%l1,	%i6
	alignaddrl	%o1,	%i1,	%i2
	array32	%l6,	%i7,	%o6
	mulscc	%o3,	0x1036,	%o5
	xnorcc	%l4,	0x0E3E,	%g6
	edge16	%l3,	%g7,	%l2
	sdivcc	%o7,	0x13EE,	%o4
	movge	%icc,	%i4,	%g4
	edge8ln	%o2,	%l5,	%g1
	fmovsvc	%icc,	%f26,	%f11
	ldx	[%l7 + 0x58],	%g3
	movrlez	%l0,	0x17E,	%i5
	xor	%i3,	0x080D,	%g5
	sdivcc	%g2,	0x02AB,	%i0
	fpsub16s	%f22,	%f5,	%f2
	sth	%o0,	[%l7 + 0x0C]
	nop
	set	0x30, %o2
	ldsh	[%l7 + %o2],	%l1
	xor	%o1,	%i6,	%i1
	umul	%l6,	%i7,	%i2
	fmul8sux16	%f0,	%f0,	%f30
	fmul8sux16	%f8,	%f4,	%f12
	fmovrdne	%o6,	%f2,	%f4
	xor	%o3,	%o5,	%g6
	fmul8sux16	%f12,	%f6,	%f20
	srl	%l3,	%g7,	%l2
	ld	[%l7 + 0x40],	%f8
	move	%xcc,	%o7,	%l4
	edge8	%o4,	%g4,	%i4
	stw	%l5,	[%l7 + 0x08]
	ld	[%l7 + 0x58],	%f19
	fmuld8sux16	%f7,	%f16,	%f8
	subcc	%g1,	0x0BE3,	%o2
	stw	%l0,	[%l7 + 0x3C]
	nop
	set	0x30, %o6
	lduw	[%l7 + %o6],	%i5
	fmovdvc	%xcc,	%f28,	%f9
	movvc	%icc,	%g3,	%g5
	fnot1	%f18,	%f4
	andn	%g2,	0x1B8C,	%i0
	sir	0x088C
	fmovsle	%xcc,	%f18,	%f30
	srl	%i3,	%l1,	%o1
	or	%i6,	0x052C,	%o0
	orn	%l6,	%i7,	%i1
	udivcc	%o6,	0x0A99,	%o3
	fmovdn	%icc,	%f25,	%f12
	edge8	%i2,	%g6,	%o5
	fmovrdgz	%g7,	%f10,	%f18
	ldd	[%l7 + 0x18],	%l2
	edge32n	%l2,	%l4,	%o7
	orcc	%g4,	0x1901,	%i4
	addcc	%l5,	0x03CB,	%o4
	srl	%g1,	%l0,	%i5
	sllx	%g3,	%o2,	%g5
	fmul8x16au	%f30,	%f31,	%f24
	xor	%i0,	0x1CCC,	%g2
	fornot2s	%f19,	%f16,	%f16
	movre	%l1,	%i3,	%o1
	sth	%i6,	[%l7 + 0x16]
	sdivx	%o0,	0x1340,	%l6
	subc	%i7,	%i1,	%o3
	fmovrdne	%o6,	%f24,	%f14
	smul	%g6,	%o5,	%i2
	fpsub32s	%f29,	%f14,	%f17
	mulscc	%l3,	0x0E22,	%l2
	xor	%l4,	0x07DB,	%g7
	edge16	%o7,	%i4,	%l5
	fmovdne	%xcc,	%f13,	%f1
	array32	%o4,	%g4,	%g1
	stb	%i5,	[%l7 + 0x7E]
	ldsb	[%l7 + 0x2D],	%l0
	movne	%xcc,	%g3,	%g5
	restore %o2, %g2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l1,	%o1,	%i3
	srl	%o0,	%l6,	%i7
	movg	%icc,	%i6,	%i1
	xorcc	%o6,	%g6,	%o3
	fornot2	%f16,	%f2,	%f28
	sdivx	%i2,	0x05A3,	%o5
	sth	%l3,	[%l7 + 0x18]
	movrgz	%l2,	0x319,	%g7
	std	%f10,	[%l7 + 0x48]
	movrgz	%l4,	0x07D,	%o7
	movne	%xcc,	%i4,	%l5
	array32	%g4,	%o4,	%i5
	smulcc	%g1,	0x09AE,	%l0
	fornot1	%f2,	%f14,	%f0
	fsrc2s	%f5,	%f6
	srl	%g5,	0x0B,	%g3
	fmovs	%f0,	%f10
	subccc	%o2,	0x152F,	%i0
	fxnor	%f2,	%f28,	%f20
	fpmerge	%f15,	%f29,	%f14
	std	%f6,	[%l7 + 0x70]
	fors	%f20,	%f18,	%f7
	movneg	%xcc,	%g2,	%l1
	subc	%o1,	0x0A11,	%o0
	orncc	%i3,	%i7,	%l6
	fcmpne32	%f0,	%f0,	%i6
	andcc	%i1,	0x03FA,	%o6
	andcc	%g6,	%o3,	%i2
	xorcc	%o5,	0x1B17,	%l2
	sub	%l3,	0x096A,	%g7
	fmovdcs	%icc,	%f26,	%f9
	udivcc	%o7,	0x0194,	%l4
	fnot1s	%f21,	%f14
	edge16ln	%i4,	%l5,	%o4
	sll	%i5,	0x0B,	%g4
	fmovdleu	%xcc,	%f26,	%f26
	mulx	%g1,	%l0,	%g3
	xorcc	%g5,	0x1BAB,	%i0
	fmul8x16	%f1,	%f0,	%f4
	edge8ln	%g2,	%l1,	%o2
	movneg	%icc,	%o1,	%o0
	ld	[%l7 + 0x3C],	%f21
	fmovdne	%icc,	%f0,	%f13
	pdist	%f28,	%f6,	%f28
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%i2
	fxor	%f20,	%f28,	%f14
	movneg	%icc,	%i7,	%i6
	movg	%xcc,	%l6,	%o6
	edge16ln	%g6,	%o3,	%i1
	sth	%o5,	[%l7 + 0x24]
	movre	%i2,	%l2,	%l3
	srax	%o7,	0x12,	%l4
	ld	[%l7 + 0x08],	%f14
	movn	%icc,	%i4,	%g7
	fornot2	%f6,	%f16,	%f6
	ldx	[%l7 + 0x68],	%o4
	move	%xcc,	%i5,	%g4
	save %l5, %g1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g5,	%g3,	%g2
	addc	%l1,	%i0,	%o1
	fmovrdgz	%o2,	%f26,	%f8
	movvs	%xcc,	%o0,	%i3
	edge16	%i6,	%l6,	%o6
	move	%xcc,	%g6,	%i7
	and	%i1,	0x0786,	%o5
	edge8ln	%o3,	%i2,	%l3
	andncc	%l2,	%o7,	%l4
	xnor	%g7,	0x0081,	%o4
	srax	%i5,	0x16,	%g4
	movne	%icc,	%i4,	%g1
	ldd	[%l7 + 0x58],	%f22
	fnors	%f1,	%f18,	%f16
	xorcc	%l0,	0x15D2,	%l5
	fnegd	%f14,	%f10
	mova	%xcc,	%g5,	%g2
	movneg	%xcc,	%l1,	%g3
	edge16ln	%i0,	%o1,	%o2
	movrne	%i3,	0x0C7,	%i6
	andcc	%o0,	0x14B1,	%l6
	std	%f26,	[%l7 + 0x60]
	fones	%f14
	fmovsne	%xcc,	%f4,	%f27
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	ldd	[%l7 + 0x60],	%i6
	udivcc	%i1,	0x17FE,	%o5
	smul	%o3,	%i2,	%l2
	smul	%o7,	%l3,	%g7
	sdiv	%l4,	0x14D9,	%i5
	fxors	%f31,	%f14,	%f13
	subc	%g4,	%o4,	%i4
	fornot2s	%f21,	%f4,	%f12
	save %l0, %g1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32s	%f6,	%f2,	%f6
	fpadd16s	%f16,	%f27,	%f13
	sethi	0x135F,	%g5
	fmovse	%icc,	%f26,	%f27
	array32	%g2,	%g3,	%i0
	orncc	%l1,	%o2,	%o1
	edge16n	%i6,	%i3,	%l6
	fmovrdgz	%o0,	%f30,	%f16
	movne	%xcc,	%o6,	%g6
	edge16ln	%i7,	%o5,	%o3
	and	%i2,	0x11C3,	%i1
	xnorcc	%o7,	0x05A5,	%l3
	umul	%l2,	0x13A0,	%l4
	std	%f26,	[%l7 + 0x48]
	mova	%icc,	%i5,	%g7
	fmovsa	%xcc,	%f13,	%f15
	fpsub16	%f24,	%f2,	%f2
	orn	%o4,	0x174E,	%g4
	sdivcc	%i4,	0x16D2,	%g1
	andcc	%l5,	%l0,	%g5
	stb	%g2,	[%l7 + 0x72]
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%i0
	mulx	%l1,	%o2,	%g3
	ldd	[%l7 + 0x50],	%f2
	sdivx	%i6,	0x16D6,	%o1
	ldx	[%l7 + 0x48],	%i3
	add	%l6,	%o6,	%g6
	fmovdneg	%icc,	%f24,	%f10
	nop
	set	0x68, %g3
	ldx	[%l7 + %g3],	%o0
	umulcc	%o5,	%o3,	%i7
	movgu	%icc,	%i1,	%i2
	fmovd	%f8,	%f8
	or	%l3,	%l2,	%o7
	fsrc1	%f14,	%f18
	ldsb	[%l7 + 0x58],	%i5
	edge16n	%l4,	%o4,	%g4
	stx	%g7,	[%l7 + 0x70]
	movleu	%icc,	%g1,	%i4
	mulscc	%l0,	0x08F2,	%l5
	fornot1s	%f25,	%f30,	%f11
	mova	%icc,	%g2,	%i0
	edge32ln	%g5,	%l1,	%g3
	fmovsgu	%xcc,	%f30,	%f0
	mova	%icc,	%o2,	%i6
	mova	%xcc,	%o1,	%i3
	fmovrdlz	%l6,	%f18,	%f30
	edge16l	%o6,	%g6,	%o0
	movrne	%o5,	%o3,	%i1
	movcc	%xcc,	%i2,	%i7
	edge8l	%l2,	%l3,	%i5
	subc	%l4,	0x0B20,	%o7
	fcmped	%fcc2,	%f6,	%f10
	edge8ln	%g4,	%o4,	%g1
	fmovrdgez	%i4,	%f16,	%f28
	fornot1s	%f19,	%f8,	%f0
	xnor	%l0,	%l5,	%g2
	edge8l	%i0,	%g5,	%g7
	movrlez	%g3,	0x11A,	%o2
	umul	%l1,	%i6,	%i3
	ldsb	[%l7 + 0x58],	%o1
	sub	%o6,	0x1BEE,	%l6
	ldd	[%l7 + 0x28],	%f28
	add	%g6,	%o5,	%o3
	ldub	[%l7 + 0x13],	%o0
	smul	%i2,	0x17FA,	%i7
	udiv	%l2,	0x1487,	%i1
	fnot1s	%f25,	%f3
	sll	%i5,	0x13,	%l4
	fornot2s	%f29,	%f17,	%f26
	movl	%icc,	%o7,	%l3
	sdivx	%o4,	0x0787,	%g4
	movgu	%xcc,	%i4,	%l0
	fnands	%f12,	%f5,	%f25
	mulx	%g1,	0x133C,	%l5
	stx	%g2,	[%l7 + 0x08]
	for	%f12,	%f26,	%f6
	mova	%xcc,	%g5,	%g7
	fmovrdlez	%g3,	%f24,	%f22
	fands	%f18,	%f4,	%f30
	subc	%i0,	%l1,	%i6
	orncc	%i3,	%o2,	%o1
	movcs	%xcc,	%l6,	%g6
	fmovrslz	%o5,	%f6,	%f2
	fmovsgu	%icc,	%f12,	%f18
	edge8	%o3,	%o0,	%o6
	fandnot2	%f26,	%f8,	%f16
	ldsb	[%l7 + 0x49],	%i2
	sdivcc	%l2,	0x0406,	%i7
	xor	%i5,	0x099D,	%i1
	udiv	%l4,	0x031C,	%l3
	fpmerge	%f22,	%f12,	%f10
	fmovscc	%xcc,	%f8,	%f11
	sdivx	%o4,	0x05F3,	%g4
	xorcc	%o7,	0x0FEF,	%l0
	andncc	%g1,	%i4,	%l5
	movvc	%icc,	%g2,	%g5
	fmul8ulx16	%f12,	%f14,	%f14
	edge8l	%g7,	%g3,	%i0
	edge8l	%i6,	%i3,	%l1
	andncc	%o2,	%o1,	%l6
	nop
	set	0x30, %o4
	lduw	[%l7 + %o4],	%o5
	andcc	%o3,	%g6,	%o6
	fmovsa	%icc,	%f11,	%f31
	movle	%xcc,	%i2,	%o0
	sdiv	%i7,	0x1C4A,	%l2
	fmovrde	%i1,	%f2,	%f28
	movcs	%icc,	%l4,	%i5
	move	%xcc,	%o4,	%l3
	fabsd	%f24,	%f18
	fpmerge	%f20,	%f24,	%f24
	fnegd	%f22,	%f4
	edge8l	%g4,	%l0,	%o7
	add	%g1,	0x00EA,	%l5
	std	%f22,	[%l7 + 0x60]
	movrgz	%g2,	0x073,	%g5
	edge16	%g7,	%g3,	%i4
	movrgez	%i0,	%i3,	%i6
	xnorcc	%o2,	%l1,	%o1
	and	%o5,	%o3,	%l6
	ld	[%l7 + 0x50],	%f7
	xnorcc	%g6,	%o6,	%o0
	movrgez	%i2,	%i7,	%i1
	addccc	%l4,	%l2,	%o4
	smul	%i5,	0x0618,	%g4
	fcmple16	%f28,	%f24,	%l3
	subc	%l0,	%g1,	%l5
	and	%o7,	0x0E0F,	%g5
	or	%g2,	0x0D8B,	%g7
	umulcc	%g3,	0x0F16,	%i4
	movge	%xcc,	%i3,	%i0
	umul	%o2,	%i6,	%o1
	fmovrse	%o5,	%f15,	%f18
	srlx	%l1,	%l6,	%o3
	ldd	[%l7 + 0x58],	%o6
	andcc	%g6,	%i2,	%i7
	movgu	%icc,	%o0,	%i1
	alignaddrl	%l4,	%l2,	%i5
	movvc	%icc,	%o4,	%g4
	sir	0x01AD
	alignaddr	%l3,	%g1,	%l5
	movrgz	%o7,	0x2D9,	%l0
	restore %g5, %g2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f10,	%f22,	%i4
	edge16n	%g3,	%i3,	%i0
	srlx	%o2,	%o1,	%o5
	fmovdne	%xcc,	%f25,	%f18
	edge8l	%i6,	%l6,	%o3
	smul	%o6,	%l1,	%g6
	movne	%xcc,	%i7,	%i2
	alignaddrl	%i1,	%o0,	%l4
	fornot1	%f22,	%f4,	%f20
	mova	%icc,	%i5,	%o4
	smulcc	%g4,	%l2,	%l3
	subc	%l5,	%g1,	%o7
	mulx	%l0,	0x1C17,	%g2
	subcc	%g7,	0x1B5F,	%g5
	movcc	%xcc,	%i4,	%g3
	fmul8x16au	%f7,	%f13,	%f8
	edge16l	%i0,	%i3,	%o2
	fmovscc	%icc,	%f5,	%f10
	smulcc	%o5,	%o1,	%l6
	udivcc	%i6,	0x14CC,	%o3
	orcc	%o6,	0x06A9,	%l1
	ldsb	[%l7 + 0x3F],	%g6
	edge16ln	%i2,	%i1,	%i7
	sub	%o0,	0x061E,	%l4
	fcmpd	%fcc3,	%f18,	%f12
	subccc	%i5,	0x0EA9,	%o4
	andncc	%g4,	%l2,	%l3
	edge16ln	%g1,	%o7,	%l5
	mulscc	%g2,	%g7,	%g5
	fornot2s	%f5,	%f8,	%f3
	popc	0x0D70,	%l0
	fxors	%f11,	%f2,	%f2
	edge16	%g3,	%i0,	%i4
	and	%i3,	%o5,	%o1
	sub	%o2,	0x116E,	%l6
	fcmpd	%fcc2,	%f12,	%f6
	sir	0x1E18
	edge8	%o3,	%o6,	%i6
	orcc	%g6,	0x13CC,	%i2
	stb	%l1,	[%l7 + 0x2D]
	orcc	%i7,	0x03A2,	%o0
	xor	%l4,	%i5,	%i1
	udiv	%o4,	0x0270,	%g4
	edge32	%l2,	%l3,	%o7
	andn	%l5,	%g2,	%g1
	fsrc2	%f4,	%f16
	fcmpeq16	%f4,	%f30,	%g5
	srax	%l0,	0x04,	%g3
	lduw	[%l7 + 0x68],	%i0
	fxors	%f31,	%f6,	%f23
	xnor	%i4,	0x07D6,	%i3
	fmul8sux16	%f12,	%f28,	%f20
	movvs	%xcc,	%o5,	%o1
	sethi	0x083D,	%o2
	siam	0x0
	fnot1	%f8,	%f12
	fnot1	%f6,	%f24
	fmovdleu	%xcc,	%f8,	%f19
	or	%g7,	%o3,	%l6
	smulcc	%i6,	%o6,	%g6
	smulcc	%i2,	0x0C6E,	%l1
	or	%i7,	%l4,	%o0
	fmul8x16	%f16,	%f24,	%f14
	movleu	%icc,	%i5,	%i1
	movrlez	%g4,	%o4,	%l3
	fmovrslez	%o7,	%f18,	%f10
	addc	%l5,	%g2,	%l2
	add	%g1,	0x18EF,	%l0
	fnot2	%f12,	%f6
	movvc	%xcc,	%g5,	%g3
	move	%xcc,	%i0,	%i3
	movg	%icc,	%o5,	%i4
	alignaddr	%o2,	%o1,	%g7
	fnand	%f8,	%f2,	%f10
	movcc	%xcc,	%o3,	%i6
	andn	%l6,	%g6,	%i2
	ldd	[%l7 + 0x38],	%o6
	udivcc	%i7,	0x00F3,	%l1
	movrgez	%o0,	0x2B7,	%l4
	movneg	%xcc,	%i1,	%i5
	nop
	set	0x10, %l1
	stx	%g4,	[%l7 + %l1]
	movgu	%icc,	%l3,	%o7
	fpadd32s	%f4,	%f11,	%f22
	fnegs	%f13,	%f8
	addc	%l5,	%o4,	%l2
	move	%icc,	%g2,	%l0
	movneg	%icc,	%g1,	%g3
	edge8	%i0,	%g5,	%i3
	movne	%xcc,	%i4,	%o5
	fpadd16s	%f13,	%f4,	%f25
	or	%o1,	%g7,	%o2
	andncc	%o3,	%l6,	%g6
	movrlz	%i6,	%i2,	%o6
	ld	[%l7 + 0x28],	%f19
	sll	%i7,	0x1A,	%o0
	stw	%l4,	[%l7 + 0x40]
	ldsw	[%l7 + 0x4C],	%l1
	umulcc	%i5,	0x027B,	%i1
	sra	%g4,	%o7,	%l3
	edge32	%o4,	%l2,	%g2
	sdivcc	%l0,	0x0542,	%g1
	orn	%l5,	%g3,	%i0
	fmovsgu	%xcc,	%f8,	%f14
	edge32n	%g5,	%i3,	%o5
	popc	%o1,	%i4
	udivcc	%o2,	0x1FC9,	%g7
	for	%f10,	%f6,	%f8
	sdivcc	%l6,	0x105A,	%g6
	fpadd32	%f24,	%f14,	%f20
	srax	%i6,	%o3,	%o6
	sdivcc	%i7,	0x1135,	%i2
	nop
	set	0x5F, %i5
	ldub	[%l7 + %i5],	%l4
	for	%f6,	%f14,	%f22
	edge16n	%o0,	%i5,	%i1
	edge16	%l1,	%g4,	%o7
	movrlz	%l3,	%o4,	%l2
	stx	%g2,	[%l7 + 0x70]
	addccc	%g1,	%l5,	%l0
	movge	%xcc,	%g3,	%g5
	sra	%i0,	%i3,	%o5
	add	%o1,	%o2,	%i4
	xnorcc	%l6,	0x05C2,	%g7
	fnand	%f12,	%f12,	%f30
	smulcc	%i6,	0x1A48,	%o3
	sethi	0x08FF,	%o6
	add	%g6,	0x0B9F,	%i7
	fcmpgt16	%f8,	%f2,	%l4
	andncc	%i2,	%o0,	%i1
	fmul8x16au	%f10,	%f15,	%f24
	array16	%l1,	%g4,	%o7
	fcmple16	%f24,	%f4,	%i5
	xorcc	%l3,	%l2,	%o4
	xorcc	%g1,	0x1349,	%l5
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	udivcc	%g5,	0x1B61,	%g2
	srax	%i0,	%o5,	%i3
	edge16ln	%o2,	%o1,	%i4
	stb	%g7,	[%l7 + 0x60]
	edge8n	%i6,	%l6,	%o6
	movpos	%icc,	%g6,	%i7
	fcmple16	%f4,	%f14,	%l4
	lduh	[%l7 + 0x78],	%i2
	stb	%o3,	[%l7 + 0x56]
	edge16n	%i1,	%l1,	%o0
	movgu	%xcc,	%o7,	%i5
	udivcc	%g4,	0x0E48,	%l2
	movrgez	%l3,	%o4,	%g1
	andn	%l5,	0x09B4,	%g3
	sdivcc	%l0,	0x0664,	%g2
	udivcc	%g5,	0x0F1A,	%o5
	fpadd16	%f18,	%f22,	%f8
	movpos	%icc,	%i3,	%i0
	fsrc2	%f24,	%f8
	srl	%o2,	%o1,	%i4
	fornot1	%f10,	%f16,	%f20
	ldd	[%l7 + 0x40],	%g6
	fmovdn	%xcc,	%f0,	%f31
	mulx	%l6,	%i6,	%g6
	ldsb	[%l7 + 0x10],	%i7
	sllx	%l4,	0x01,	%i2
	alignaddr	%o3,	%i1,	%o6
	mova	%icc,	%l1,	%o0
	fmovrse	%o7,	%f0,	%f13
	mova	%icc,	%g4,	%l2
	fmovsneg	%icc,	%f19,	%f11
	edge8	%l3,	%o4,	%g1
	nop
	set	0x4A, %g5
	stb	%l5,	[%l7 + %g5]
	fnot2	%f28,	%f20
	ldub	[%l7 + 0x73],	%i5
	movneg	%xcc,	%g3,	%l0
	fnot2	%f14,	%f30
	fnot2	%f22,	%f0
	movg	%icc,	%g2,	%g5
	sra	%i3,	0x10,	%i0
	fnor	%f24,	%f26,	%f14
	movleu	%xcc,	%o2,	%o1
	popc	%i4,	%g7
	edge8	%l6,	%o5,	%g6
	ldd	[%l7 + 0x40],	%f26
	movneg	%xcc,	%i6,	%l4
	st	%f15,	[%l7 + 0x14]
	movvs	%xcc,	%i7,	%o3
	siam	0x2
	xnorcc	%i2,	0x0348,	%o6
	stw	%l1,	[%l7 + 0x18]
	srlx	%o0,	0x07,	%i1
	fpsub16	%f28,	%f14,	%f14
	udiv	%g4,	0x0105,	%l2
	andncc	%l3,	%o4,	%o7
	movvc	%xcc,	%l5,	%g1
	ldsh	[%l7 + 0x28],	%i5
	xor	%l0,	0x0AAC,	%g2
	sir	0x0599
	fnors	%f20,	%f13,	%f11
	sir	0x0467
	edge8	%g3,	%g5,	%i0
	fmovrdlez	%i3,	%f8,	%f0
	movn	%icc,	%o1,	%i4
	udivx	%o2,	0x165A,	%l6
	alignaddrl	%g7,	%o5,	%i6
	movgu	%icc,	%g6,	%l4
	lduh	[%l7 + 0x12],	%i7
	move	%xcc,	%o3,	%i2
	ldsb	[%l7 + 0x13],	%l1
	fcmpgt16	%f4,	%f12,	%o6
	xor	%o0,	%i1,	%l2
	nop
	set	0x12, %g4
	ldsb	[%l7 + %g4],	%l3
	addcc	%g4,	%o4,	%l5
	subccc	%o7,	0x1745,	%g1
	srl	%l0,	0x04,	%i5
	movrgz	%g3,	%g2,	%i0
	fmovdg	%xcc,	%f2,	%f30
	udiv	%i3,	0x02BD,	%g5
	stx	%o1,	[%l7 + 0x78]
	array16	%o2,	%l6,	%i4
	edge16ln	%g7,	%o5,	%g6
	ldd	[%l7 + 0x68],	%l4
	popc	0x0346,	%i6
	ldsh	[%l7 + 0x5E],	%o3
	movvc	%xcc,	%i7,	%i2
	fmovrsgz	%o6,	%f2,	%f17
	edge32n	%o0,	%i1,	%l1
	std	%f10,	[%l7 + 0x68]
	mulx	%l2,	%l3,	%o4
	fnot2s	%f15,	%f9
	ldd	[%l7 + 0x58],	%f16
	smulcc	%l5,	%o7,	%g4
	fsrc2s	%f8,	%f26
	ldsw	[%l7 + 0x30],	%g1
	movre	%l0,	0x1BB,	%g3
	fnot2	%f0,	%f14
	mova	%xcc,	%g2,	%i0
	sir	0x0C02
	sll	%i3,	0x1B,	%i5
	srlx	%o1,	0x1E,	%o2
	udiv	%l6,	0x0F0D,	%g5
	fmovdge	%xcc,	%f17,	%f30
	sdivcc	%i4,	0x1910,	%o5
	alignaddrl	%g7,	%l4,	%i6
	ldd	[%l7 + 0x68],	%f6
	sethi	0x0D7C,	%g6
	movn	%icc,	%o3,	%i7
	sdiv	%i2,	0x059C,	%o0
	subc	%i1,	0x1294,	%o6
	st	%f26,	[%l7 + 0x30]
	fnand	%f2,	%f10,	%f26
	edge8ln	%l2,	%l1,	%o4
	edge16l	%l5,	%l3,	%g4
	movrne	%o7,	0x014,	%l0
	srlx	%g3,	0x0A,	%g2
	nop
	set	0x38, %o1
	sth	%g1,	[%l7 + %o1]
	sll	%i3,	%i5,	%o1
	movrgz	%o2,	%l6,	%g5
	add	%i4,	0x0D3F,	%i0
	movrgez	%g7,	%l4,	%i6
	fcmple32	%f4,	%f18,	%g6
	sdivcc	%o5,	0x102B,	%i7
	ldsb	[%l7 + 0x79],	%i2
	sir	0x1B49
	movrne	%o3,	0x269,	%i1
	sethi	0x1BC5,	%o6
	fcmps	%fcc2,	%f6,	%f19
	movvc	%xcc,	%o0,	%l1
	edge16n	%o4,	%l5,	%l2
	edge8	%g4,	%l3,	%o7
	fnot1	%f8,	%f30
	andcc	%g3,	%l0,	%g2
	fnands	%f30,	%f16,	%f24
	move	%xcc,	%g1,	%i3
	alignaddr	%o1,	%o2,	%i5
	fcmpne32	%f20,	%f0,	%g5
	fornot1	%f14,	%f22,	%f6
	and	%i4,	%i0,	%g7
	addc	%l6,	0x1859,	%l4
	fcmpeq32	%f12,	%f2,	%i6
	fnot2s	%f20,	%f22
	mulx	%g6,	0x167D,	%i7
	mulx	%o5,	%o3,	%i1
	movge	%xcc,	%i2,	%o0
	restore %l1, 0x1820, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o4,	%l2,	%g4
	fmovsvc	%xcc,	%f23,	%f30
	fmovdle	%xcc,	%f25,	%f20
	mulscc	%l3,	0x0A4D,	%l5
	movcc	%xcc,	%o7,	%l0
	fmovdl	%icc,	%f2,	%f31
	stb	%g2,	[%l7 + 0x76]
	xor	%g1,	%g3,	%i3
	fmovd	%f30,	%f14
	movrgz	%o2,	0x296,	%i5
	fpmerge	%f31,	%f9,	%f8
	st	%f27,	[%l7 + 0x14]
	edge32l	%o1,	%i4,	%g5
	fmovdle	%icc,	%f20,	%f18
	movre	%i0,	%g7,	%l6
	fmovrdgez	%i6,	%f30,	%f22
	srl	%l4,	%g6,	%o5
	stb	%i7,	[%l7 + 0x22]
	fone	%f24
	edge8n	%o3,	%i2,	%o0
	edge8	%l1,	%i1,	%o6
	subc	%l2,	%g4,	%l3
	edge16n	%l5,	%o7,	%o4
	movl	%xcc,	%g2,	%l0
	fnands	%f0,	%f31,	%f5
	addc	%g3,	0x1B7C,	%g1
	movle	%xcc,	%i3,	%o2
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	movleu	%xcc,	%i0,	%g7
	movpos	%xcc,	%l6,	%i5
	edge32ln	%i6,	%g6,	%l4
	ldub	[%l7 + 0x65],	%i7
	fnegd	%f0,	%f8
	edge16l	%o3,	%o5,	%i2
	sllx	%o0,	%i1,	%o6
	xor	%l1,	0x1D26,	%g4
	or	%l2,	%l5,	%l3
	sir	0x047D
	movle	%icc,	%o4,	%o7
	fnor	%f0,	%f0,	%f22
	ldub	[%l7 + 0x31],	%l0
	movn	%icc,	%g2,	%g1
	fcmple32	%f18,	%f6,	%g3
	movrlez	%i3,	0x1B9,	%o2
	subccc	%i4,	%o1,	%i0
	srax	%g5,	0x0B,	%g7
	movcc	%icc,	%l6,	%i6
	movcc	%icc,	%i5,	%g6
	fmovsneg	%icc,	%f1,	%f31
	edge32ln	%i7,	%l4,	%o5
	orn	%i2,	%o0,	%i1
	fmovsle	%xcc,	%f28,	%f26
	addcc	%o3,	0x069C,	%o6
	sra	%g4,	0x09,	%l2
	movvs	%xcc,	%l1,	%l3
	edge16	%l5,	%o7,	%o4
	movrgz	%l0,	0x30C,	%g1
	stw	%g2,	[%l7 + 0x38]
	fmovsl	%icc,	%f20,	%f18
	fsrc2s	%f28,	%f13
	fmovdle	%xcc,	%f13,	%f2
	nop
	set	0x38, %l0
	ldsh	[%l7 + %l0],	%g3
	fnands	%f19,	%f17,	%f25
	fmovdne	%icc,	%f16,	%f24
	udivcc	%o2,	0x14AE,	%i3
	mulscc	%i4,	0x1861,	%o1
	and	%i0,	0x01F0,	%g5
	movcc	%icc,	%g7,	%l6
	xnor	%i5,	%g6,	%i7
	edge16n	%i6,	%l4,	%i2
	fmovrsgez	%o0,	%f14,	%f10
	fmovrsgez	%o5,	%f13,	%f17
	edge16n	%o3,	%i1,	%g4
	movrgez	%o6,	%l2,	%l3
	fmovscs	%icc,	%f20,	%f6
	alignaddr	%l1,	%o7,	%l5
	fcmpne32	%f8,	%f14,	%l0
	fzeros	%f11
	movg	%icc,	%g1,	%g2
	edge16l	%g3,	%o2,	%i3
	sth	%i4,	[%l7 + 0x36]
	lduh	[%l7 + 0x24],	%o4
	edge32n	%o1,	%g5,	%i0
	orncc	%l6,	0x1EC8,	%g7
	ldsb	[%l7 + 0x10],	%i5
	sdiv	%i7,	0x0779,	%g6
	fmovrsne	%i6,	%f2,	%f30
	ldd	[%l7 + 0x58],	%i2
	fones	%f12
	orn	%o0,	0x04CC,	%o5
	andcc	%l4,	%i1,	%o3
	sth	%o6,	[%l7 + 0x26]
	std	%f6,	[%l7 + 0x50]
	mulscc	%l2,	%g4,	%l3
	mova	%icc,	%l1,	%l5
	edge16	%l0,	%g1,	%o7
	lduw	[%l7 + 0x74],	%g3
	sdivx	%g2,	0x039B,	%i3
	andcc	%o2,	0x172F,	%o4
	edge16	%o1,	%g5,	%i4
	edge32n	%l6,	%g7,	%i5
	fpsub32s	%f11,	%f15,	%f29
	orcc	%i0,	%g6,	%i6
	andn	%i2,	%o0,	%o5
	sethi	0x0BA2,	%l4
	movne	%xcc,	%i7,	%i1
	fnot1s	%f3,	%f2
	xnorcc	%o3,	%l2,	%o6
	fcmpgt16	%f28,	%f4,	%g4
	stb	%l1,	[%l7 + 0x4B]
	fmovrslz	%l5,	%f25,	%f16
	or	%l0,	0x0ADE,	%l3
	fpadd16	%f4,	%f24,	%f0
	xor	%g1,	%g3,	%o7
	stw	%g2,	[%l7 + 0x50]
	edge8ln	%i3,	%o4,	%o1
	movcs	%icc,	%g5,	%o2
	movleu	%icc,	%i4,	%g7
	edge32l	%l6,	%i0,	%i5
	fmovd	%f2,	%f14
	movrlez	%i6,	0x35B,	%i2
	srlx	%o0,	0x04,	%o5
	movcs	%xcc,	%g6,	%i7
	srax	%l4,	%o3,	%i1
	move	%xcc,	%l2,	%g4
	alignaddr	%o6,	%l5,	%l0
	and	%l3,	0x0C42,	%g1
	edge16ln	%l1,	%o7,	%g2
	andcc	%g3,	0x056D,	%o4
	popc	%o1,	%g5
	edge32l	%o2,	%i4,	%g7
	orncc	%i3,	%l6,	%i0
	umul	%i5,	0x17EB,	%i6
	faligndata	%f24,	%f20,	%f8
	fxors	%f28,	%f30,	%f26
	fmovsgu	%icc,	%f10,	%f26
	ldsw	[%l7 + 0x2C],	%i2
	ldd	[%l7 + 0x28],	%f12
	array32	%o5,	%o0,	%i7
	movpos	%icc,	%l4,	%o3
	ldsb	[%l7 + 0x4B],	%i1
	lduw	[%l7 + 0x08],	%l2
	fmovdne	%icc,	%f29,	%f22
	fmuld8sux16	%f26,	%f26,	%f10
	movvc	%icc,	%g6,	%o6
	edge32n	%l5,	%g4,	%l0
	array16	%g1,	%l1,	%o7
	srl	%l3,	%g2,	%g3
	popc	%o1,	%g5
	fcmpne32	%f6,	%f6,	%o2
	fmovdleu	%icc,	%f12,	%f17
	ld	[%l7 + 0x50],	%f28
	sdivx	%i4,	0x1D00,	%g7
	fmovscs	%xcc,	%f3,	%f8
	edge32n	%o4,	%i3,	%i0
	udiv	%l6,	0x0E2D,	%i6
	edge32l	%i2,	%o5,	%o0
	smul	%i5,	%l4,	%i7
	fnegd	%f0,	%f30
	fmovscc	%xcc,	%f8,	%f27
	nop
	set	0x6E, %i3
	lduh	[%l7 + %i3],	%i1
	srl	%o3,	0x14,	%g6
	subccc	%o6,	%l5,	%l2
	movrne	%l0,	%g1,	%l1
	ldd	[%l7 + 0x20],	%f22
	movle	%icc,	%o7,	%g4
	alignaddrl	%g2,	%g3,	%l3
	sth	%o1,	[%l7 + 0x08]
	alignaddr	%o2,	%i4,	%g7
	movrlez	%g5,	%o4,	%i0
	fnor	%f14,	%f26,	%f24
	stx	%l6,	[%l7 + 0x70]
	stw	%i3,	[%l7 + 0x1C]
	stb	%i2,	[%l7 + 0x0B]
	xor	%o5,	0x17CA,	%o0
	xnor	%i6,	%i5,	%i7
	faligndata	%f20,	%f18,	%f26
	mova	%xcc,	%l4,	%i1
	fornot2	%f6,	%f22,	%f4
	andcc	%o3,	0x0770,	%g6
	smul	%l5,	0x0375,	%l2
	sub	%l0,	%o6,	%g1
	move	%xcc,	%l1,	%g4
	ldsb	[%l7 + 0x0E],	%g2
	save %g3, 0x138C, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o1,	%o7
	edge32	%i4,	%o2,	%g7
	movneg	%xcc,	%g5,	%i0
	ldx	[%l7 + 0x58],	%l6
	lduh	[%l7 + 0x4C],	%o4
	edge8n	%i2,	%o5,	%i3
	fmovdpos	%icc,	%f24,	%f14
	sll	%o0,	%i6,	%i5
	sdivx	%i7,	0x17E3,	%i1
	stx	%o3,	[%l7 + 0x60]
	array16	%g6,	%l5,	%l2
	fmovsg	%xcc,	%f25,	%f5
	ldsh	[%l7 + 0x72],	%l0
	sll	%l4,	%o6,	%l1
	xor	%g1,	%g4,	%g2
	st	%f16,	[%l7 + 0x44]
	edge8ln	%l3,	%g3,	%o7
	andcc	%i4,	%o1,	%o2
	smulcc	%g5,	0x12FD,	%g7
	fxnor	%f20,	%f20,	%f4
	addccc	%l6,	0x006D,	%o4
	array8	%i2,	%i0,	%i3
	edge32ln	%o0,	%i6,	%i5
	edge8ln	%i7,	%o5,	%o3
	fpsub16	%f24,	%f8,	%f20
	fcmple16	%f22,	%f6,	%i1
	alignaddr	%g6,	%l5,	%l2
	srl	%l0,	0x15,	%o6
	or	%l4,	0x10BB,	%l1
	movvs	%icc,	%g4,	%g1
	fcmpes	%fcc0,	%f19,	%f6
	addc	%l3,	0x1F6E,	%g2
	fxors	%f4,	%f20,	%f20
	sll	%o7,	0x15,	%g3
	edge32l	%i4,	%o2,	%g5
	sdiv	%o1,	0x09A5,	%g7
	stx	%l6,	[%l7 + 0x08]
	orcc	%i2,	%o4,	%i0
	movre	%o0,	0x1EC,	%i6
	movrlez	%i5,	%i7,	%i3
	move	%xcc,	%o3,	%i1
	fmovdcs	%icc,	%f1,	%f3
	sth	%o5,	[%l7 + 0x08]
	ldsb	[%l7 + 0x0B],	%l5
	array8	%g6,	%l2,	%l0
	orcc	%l4,	%l1,	%o6
	fcmpd	%fcc2,	%f28,	%f28
	movgu	%xcc,	%g1,	%l3
	srl	%g2,	0x16,	%o7
	fcmpne16	%f10,	%f24,	%g3
	std	%f26,	[%l7 + 0x28]
	stb	%g4,	[%l7 + 0x7E]
	andncc	%i4,	%g5,	%o2
	movpos	%icc,	%g7,	%o1
	stw	%i2,	[%l7 + 0x38]
	movle	%icc,	%l6,	%i0
	edge8l	%o0,	%o4,	%i6
	movgu	%icc,	%i7,	%i3
	movvs	%xcc,	%i5,	%i1
	subc	%o3,	0x125A,	%o5
	sub	%g6,	0x1754,	%l5
	fnands	%f15,	%f19,	%f29
	add	%l2,	%l0,	%l1
	fcmpne32	%f30,	%f0,	%o6
	orn	%l4,	%g1,	%g2
	sethi	0x08E8,	%l3
	fandnot2s	%f1,	%f10,	%f1
	std	%f8,	[%l7 + 0x50]
	addccc	%o7,	0x0092,	%g4
	bshuffle	%f0,	%f26,	%f24
	orcc	%g3,	0x1734,	%g5
	andcc	%o2,	%g7,	%i4
	movrgez	%o1,	0x155,	%i2
	srlx	%i0,	0x0F,	%o0
	edge32	%o4,	%i6,	%i7
	andncc	%i3,	%i5,	%l6
	ldsw	[%l7 + 0x3C],	%i1
	ld	[%l7 + 0x3C],	%f8
	ldsh	[%l7 + 0x6E],	%o3
	orn	%o5,	%g6,	%l2
	fmovde	%xcc,	%f26,	%f30
	std	%f4,	[%l7 + 0x18]
	popc	%l0,	%l1
	fzeros	%f31
	movrlez	%o6,	%l5,	%g1
	edge32l	%l4,	%l3,	%g2
	srax	%g4,	0x0A,	%g3
	st	%f3,	[%l7 + 0x50]
	fmovsl	%xcc,	%f27,	%f15
	smulcc	%o7,	0x11AC,	%g5
	mulscc	%g7,	0x0979,	%i4
	sra	%o2,	%o1,	%i0
	movrlez	%o0,	%i2,	%i6
	movg	%xcc,	%i7,	%i3
	std	%f4,	[%l7 + 0x18]
	sdivcc	%i5,	0x1949,	%l6
	mulscc	%i1,	%o4,	%o3
	movrlz	%g6,	%o5,	%l0
	fpadd16	%f10,	%f28,	%f20
	xnor	%l2,	%o6,	%l1
	movn	%xcc,	%l5,	%g1
	movcc	%icc,	%l3,	%l4
	edge32ln	%g2,	%g4,	%g3
	fmovse	%icc,	%f7,	%f31
	orncc	%o7,	%g7,	%i4
	addcc	%g5,	%o1,	%o2
	movrne	%o0,	%i0,	%i6
	fmovdge	%icc,	%f4,	%f27
	movcs	%icc,	%i7,	%i3
	edge8l	%i2,	%i5,	%l6
	edge32n	%i1,	%o3,	%g6
	array16	%o4,	%o5,	%l2
	fcmpne16	%f4,	%f10,	%o6
	movre	%l0,	%l5,	%l1
	ldsw	[%l7 + 0x44],	%l3
	smulcc	%g1,	%l4,	%g4
	xnor	%g3,	%g2,	%o7
	udiv	%g7,	0x0E24,	%g5
	save %i4, %o2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f0,	%f29,	%f8
	srlx	%o1,	0x0F,	%i6
	fmovrsgz	%i0,	%f7,	%f7
	fmovdl	%icc,	%f29,	%f30
	ldd	[%l7 + 0x58],	%i6
	movrgez	%i3,	0x1BF,	%i5
	fmovrde	%l6,	%f2,	%f20
	smul	%i1,	%i2,	%g6
	addc	%o3,	0x1475,	%o5
	st	%f12,	[%l7 + 0x4C]
	fmovsg	%icc,	%f31,	%f17
	std	%f18,	[%l7 + 0x68]
	save %o4, 0x10B7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f29,	%f13
	andncc	%l2,	%l5,	%l0
	subccc	%l1,	0x0B73,	%l3
	movre	%g1,	0x2CF,	%l4
	fmovrdgz	%g4,	%f0,	%f2
	movgu	%xcc,	%g3,	%o7
	smul	%g2,	%g5,	%i4
	edge8l	%o2,	%g7,	%o1
	fsrc2	%f4,	%f2
	sdiv	%o0,	0x0AC6,	%i6
	fmovsle	%icc,	%f19,	%f16
	edge16ln	%i7,	%i0,	%i5
	movpos	%icc,	%l6,	%i3
	array32	%i2,	%g6,	%o3
	orncc	%i1,	0x1105,	%o4
	lduh	[%l7 + 0x56],	%o5
	edge32	%o6,	%l5,	%l0
	fcmped	%fcc1,	%f18,	%f8
	edge16l	%l2,	%l3,	%g1
	movne	%xcc,	%l4,	%l1
	fzeros	%f9
	fmovrdgez	%g3,	%f16,	%f8
	movpos	%xcc,	%o7,	%g2
	fmovse	%xcc,	%f2,	%f28
	fcmpgt16	%f26,	%f28,	%g5
	restore %g4, %o2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i4,	0x00B5,	%o1
	fnot2s	%f16,	%f20
	fmovsg	%xcc,	%f28,	%f15
	movrgz	%i6,	0x0D6,	%o0
	srax	%i0,	%i7,	%i5
	fnot2s	%f0,	%f31
	ldsh	[%l7 + 0x58],	%i3
	fmovsleu	%icc,	%f27,	%f27
	fmovrslez	%i2,	%f4,	%f21
	addcc	%l6,	%o3,	%i1
	movrne	%g6,	%o4,	%o5
	ldub	[%l7 + 0x66],	%l5
	std	%f10,	[%l7 + 0x70]
	ldub	[%l7 + 0x29],	%o6
	movl	%xcc,	%l0,	%l2
	edge16	%l3,	%l4,	%g1
	fmovsneg	%icc,	%f19,	%f25
	fcmple32	%f22,	%f8,	%g3
	ldx	[%l7 + 0x70],	%l1
	fmul8sux16	%f20,	%f8,	%f30
	edge16ln	%o7,	%g5,	%g2
	movn	%icc,	%o2,	%g7
	st	%f1,	[%l7 + 0x7C]
	or	%g4,	0x1E20,	%i4
	mulscc	%i6,	%o1,	%i0
	mulx	%i7,	%i5,	%i3
	fmovrsne	%i2,	%f22,	%f3
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	restore %g6, 0x08CE, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x28],	%f20
	add	%i1,	%l5,	%o6
	fmovdl	%icc,	%f20,	%f19
	fpmerge	%f8,	%f21,	%f6
	andn	%l0,	0x007A,	%o5
	alignaddr	%l2,	%l4,	%l3
	std	%f26,	[%l7 + 0x58]
	edge8	%g3,	%l1,	%o7
	fnot2s	%f2,	%f23
	save %g1, %g2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o2,	[%l7 + 0x6A]
	alignaddrl	%g7,	%g4,	%i4
	save %i6, %i0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o1,	%i5,	%i2
	ld	[%l7 + 0x28],	%f20
	fmovdleu	%xcc,	%f8,	%f4
	edge8n	%o0,	%o3,	%i3
	movge	%icc,	%g6,	%o4
	st	%f24,	[%l7 + 0x54]
	fmovd	%f30,	%f26
	udivcc	%i1,	0x1D9B,	%l6
	ldsw	[%l7 + 0x60],	%o6
	movn	%xcc,	%l5,	%l0
	subc	%o5,	0x1A2D,	%l2
	sethi	0x00D6,	%l3
	udivx	%l4,	0x0F15,	%g3
	array16	%o7,	%l1,	%g2
	edge16n	%g1,	%o2,	%g7
	ldd	[%l7 + 0x38],	%f30
	pdist	%f28,	%f4,	%f16
	edge32ln	%g5,	%i4,	%i6
	movcc	%xcc,	%g4,	%i7
	lduh	[%l7 + 0x1C],	%i0
	sdiv	%i5,	0x0988,	%o1
	orncc	%o0,	0x080B,	%i2
	addccc	%i3,	%o3,	%g6
	edge32	%i1,	%o4,	%o6
	fnot1s	%f13,	%f16
	array32	%l5,	%l6,	%o5
	fcmple32	%f4,	%f0,	%l2
	sra	%l0,	0x10,	%l4
	fmovsa	%xcc,	%f5,	%f2
	udivx	%g3,	0x0D71,	%o7
	ldsw	[%l7 + 0x74],	%l3
	movvc	%xcc,	%g2,	%g1
	movrne	%l1,	%g7,	%o2
	ldub	[%l7 + 0x48],	%i4
	fmovs	%f11,	%f27
	movvc	%icc,	%i6,	%g4
	sll	%i7,	%i0,	%i5
	std	%f14,	[%l7 + 0x30]
	andn	%g5,	%o0,	%i2
	array8	%i3,	%o3,	%g6
	edge16n	%i1,	%o4,	%o6
	lduw	[%l7 + 0x34],	%l5
	array32	%o1,	%o5,	%l2
	edge16	%l0,	%l4,	%l6
	edge16n	%g3,	%l3,	%g2
	fxor	%f22,	%f22,	%f14
	edge8n	%g1,	%o7,	%g7
	ldub	[%l7 + 0x72],	%o2
	umulcc	%l1,	%i4,	%g4
	umul	%i6,	%i0,	%i7
	andncc	%i5,	%o0,	%g5
	lduh	[%l7 + 0x3E],	%i2
	fabss	%f8,	%f4
	edge8l	%i3,	%o3,	%g6
	fnors	%f16,	%f0,	%f30
	movpos	%icc,	%i1,	%o6
	fcmps	%fcc1,	%f5,	%f25
	array8	%l5,	%o1,	%o4
	fmovrdlez	%o5,	%f8,	%f14
	udivcc	%l2,	0x0FA2,	%l0
	movrlez	%l6,	%l4,	%l3
	fmovdn	%icc,	%f11,	%f2
	fcmpgt16	%f14,	%f18,	%g2
	lduw	[%l7 + 0x40],	%g1
	array8	%o7,	%g3,	%o2
	alignaddrl	%g7,	%i4,	%g4
	fmul8x16al	%f20,	%f4,	%f26
	fnand	%f26,	%f12,	%f14
	andcc	%i6,	%i0,	%l1
	sra	%i5,	0x00,	%o0
	save %g5, %i7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o3,	%i3
	xnorcc	%g6,	0x0944,	%i1
	subc	%l5,	0x0AD6,	%o6
	movleu	%xcc,	%o4,	%o5
	udiv	%l2,	0x00A7,	%o1
	fpadd32s	%f7,	%f31,	%f17
	fpsub16	%f4,	%f16,	%f26
	movre	%l6,	0x092,	%l0
	std	%f0,	[%l7 + 0x50]
	edge16	%l4,	%g2,	%l3
	lduw	[%l7 + 0x1C],	%g1
	ldsh	[%l7 + 0x7C],	%o7
	lduw	[%l7 + 0x48],	%g3
	ldd	[%l7 + 0x78],	%f12
	movn	%xcc,	%g7,	%o2
	mulx	%i4,	%g4,	%i0
	alignaddr	%i6,	%i5,	%l1
	umulcc	%g5,	%o0,	%i2
	or	%o3,	0x1BF5,	%i7
	mulx	%g6,	%i1,	%i3
	ld	[%l7 + 0x64],	%f25
	stw	%l5,	[%l7 + 0x68]
	fnors	%f29,	%f27,	%f31
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	movl	%xcc,	%o4,	%l6
	ldsb	[%l7 + 0x6A],	%o1
	add	%l0,	%l4,	%l3
	movge	%icc,	%g2,	%g1
	movleu	%xcc,	%o7,	%g7
	fornot2	%f24,	%f24,	%f14
	array16	%o2,	%i4,	%g4
	movrne	%i0,	0x0A2,	%g3
	addcc	%i5,	%l1,	%g5
	fzeros	%f16
	restore %o0, 0x1DC1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnor	%f8,	%f10,	%f12
	movgu	%xcc,	%i2,	%o3
	or	%g6,	%i1,	%i3
	movge	%icc,	%l5,	%i7
	xnor	%o6,	%o5,	%o4
	movcs	%icc,	%l2,	%l6
	addcc	%o1,	%l0,	%l3
	fpadd16s	%f12,	%f21,	%f8
	edge8	%g2,	%l4,	%g1
	fmovrdlez	%g7,	%f6,	%f26
	fmovse	%icc,	%f24,	%f18
	alignaddrl	%o2,	%o7,	%g4
	nop
	set	0x4A, %g1
	ldsh	[%l7 + %g1],	%i4
	sdivx	%i0,	0x190F,	%i5
	orncc	%l1,	0x1D7B,	%g5
	fmovsg	%xcc,	%f14,	%f10
	sdivx	%o0,	0x1B54,	%g3
	ldsw	[%l7 + 0x14],	%i6
	fnor	%f28,	%f10,	%f26
	mulx	%i2,	0x19FE,	%o3
	fmovdg	%xcc,	%f21,	%f1
	srlx	%i1,	0x03,	%i3
	movge	%xcc,	%l5,	%i7
	fmovrslez	%g6,	%f16,	%f9
	alignaddr	%o6,	%o5,	%o4
	ldd	[%l7 + 0x58],	%f26
	fmovdle	%xcc,	%f24,	%f30
	movneg	%xcc,	%l6,	%o1
	subcc	%l2,	0x1550,	%l0
	nop
	set	0x78, %l2
	ldsh	[%l7 + %l2],	%g2
	movleu	%xcc,	%l4,	%g1
	udivx	%l3,	0x03C0,	%g7
	movg	%xcc,	%o7,	%g4
	movrne	%i4,	%o2,	%i0
	addc	%i5,	%g5,	%o0
	subccc	%l1,	%g3,	%i6
	xnor	%i2,	%i1,	%i3
	subccc	%l5,	0x1AF9,	%i7
	fpadd16	%f8,	%f22,	%f0
	fmul8sux16	%f20,	%f0,	%f6
	umulcc	%o3,	0x0E4F,	%g6
	xnorcc	%o5,	0x1EE3,	%o6
	fmovrsgz	%l6,	%f16,	%f31
	fnegd	%f10,	%f24
	fxnor	%f0,	%f16,	%f4
	move	%xcc,	%o1,	%l2
	smulcc	%o4,	0x1027,	%l0
	fsrc2	%f2,	%f0
	fmovdcc	%xcc,	%f10,	%f9
	fcmple32	%f20,	%f20,	%g2
	ldsh	[%l7 + 0x62],	%l4
	addc	%l3,	0x0B18,	%g1
	add	%o7,	0x0848,	%g4
	fmovsne	%icc,	%f25,	%f11
	movpos	%icc,	%i4,	%g7
	udivx	%i0,	0x1F17,	%i5
	xnorcc	%o2,	%o0,	%g5
	andn	%g3,	0x02F1,	%i6
	edge8n	%l1,	%i2,	%i3
	movn	%xcc,	%l5,	%i7
	movleu	%icc,	%o3,	%g6
	movne	%icc,	%o5,	%o6
	edge16ln	%l6,	%o1,	%l2
	andncc	%o4,	%i1,	%g2
	stw	%l4,	[%l7 + 0x44]
	movcs	%icc,	%l3,	%l0
	ldx	[%l7 + 0x70],	%o7
	edge8n	%g1,	%g4,	%i4
	xorcc	%i0,	%i5,	%g7
	movn	%xcc,	%o0,	%o2
	movrlez	%g3,	%g5,	%l1
	sub	%i2,	0x11C8,	%i3
	orcc	%i6,	0x03D7,	%i7
	stx	%l5,	[%l7 + 0x08]
	fnot2s	%f21,	%f30
	andncc	%g6,	%o3,	%o5
	edge32n	%o6,	%o1,	%l2
	umulcc	%o4,	0x0F81,	%i1
	ldd	[%l7 + 0x40],	%i6
	edge16n	%g2,	%l3,	%l0
	ldd	[%l7 + 0x50],	%l4
	fnegd	%f20,	%f30
	edge16ln	%g1,	%o7,	%i4
	fmovde	%xcc,	%f27,	%f26
	edge32	%g4,	%i0,	%i5
	edge32l	%o0,	%o2,	%g7
	and	%g3,	0x1571,	%g5
	edge16n	%i2,	%l1,	%i3
	movgu	%icc,	%i6,	%i7
	sub	%l5,	0x06CF,	%o3
	edge16l	%o5,	%g6,	%o6
	stw	%l2,	[%l7 + 0x74]
	fmovrde	%o1,	%f12,	%f2
	alignaddrl	%o4,	%l6,	%g2
	fpadd32	%f18,	%f24,	%f20
	sub	%i1,	%l0,	%l4
	ldx	[%l7 + 0x18],	%g1
	fmovdg	%icc,	%f31,	%f24
	fmovrsgz	%l3,	%f5,	%f9
	umulcc	%o7,	%i4,	%g4
	ldd	[%l7 + 0x68],	%i4
	save %o0, %o2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g3,	0x1E4,	%i0
	edge8n	%g5,	%i2,	%l1
	sir	0x17EA
	fcmpd	%fcc2,	%f20,	%f28
	movcc	%xcc,	%i6,	%i7
	mulscc	%l5,	%i3,	%o5
	sra	%o3,	0x0B,	%g6
	movrlz	%l2,	0x3CE,	%o1
	fmovdl	%xcc,	%f1,	%f22
	move	%icc,	%o6,	%l6
	movgu	%xcc,	%o4,	%g2
	fexpand	%f7,	%f26
	mulscc	%l0,	0x01F3,	%i1
	addc	%g1,	0x180E,	%l3
	stx	%l4,	[%l7 + 0x48]
	srax	%o7,	0x19,	%i4
	udiv	%g4,	0x0750,	%o0
	ldsw	[%l7 + 0x50],	%o2
	subcc	%i5,	0x19D6,	%g7
	subcc	%g3,	%g5,	%i2
	edge16	%i0,	%l1,	%i6
	subccc	%i7,	%i3,	%l5
	movle	%icc,	%o3,	%o5
	movrne	%g6,	%l2,	%o1
	addcc	%o6,	%l6,	%g2
	fmovsvc	%xcc,	%f28,	%f26
	fmovdl	%icc,	%f16,	%f12
	std	%f0,	[%l7 + 0x28]
	array16	%o4,	%i1,	%l0
	fandnot1s	%f13,	%f20,	%f2
	fcmps	%fcc2,	%f1,	%f24
	mulx	%g1,	0x1514,	%l3
	andncc	%l4,	%i4,	%o7
	sub	%o0,	%g4,	%i5
	srl	%g7,	%o2,	%g5
	movre	%i2,	%g3,	%i0
	subc	%i6,	%l1,	%i3
	fcmpne16	%f0,	%f14,	%i7
	fmovsleu	%icc,	%f25,	%f17
	edge32l	%l5,	%o3,	%o5
	xor	%g6,	0x192A,	%l2
	nop
	set	0x76, %l5
	lduh	[%l7 + %l5],	%o1
	ldx	[%l7 + 0x38],	%o6
	movle	%xcc,	%l6,	%g2
	fpsub32	%f10,	%f10,	%f20
	movcc	%icc,	%i1,	%l0
	fmovscc	%xcc,	%f8,	%f4
	addccc	%o4,	%g1,	%l4
	edge16	%i4,	%o7,	%o0
	movpos	%icc,	%g4,	%l3
	addcc	%g7,	%i5,	%g5
	udiv	%o2,	0x0819,	%i2
	movgu	%icc,	%g3,	%i0
	orncc	%l1,	0x054B,	%i6
	nop
	set	0x30, %l3
	stx	%i3,	[%l7 + %l3]
	fmovsgu	%icc,	%f22,	%f7
	sra	%l5,	%i7,	%o5
	movne	%xcc,	%o3,	%g6
	udivx	%o1,	0x17DA,	%l2
	fornot1	%f18,	%f12,	%f20
	edge32ln	%l6,	%g2,	%i1
	movrgz	%l0,	%o6,	%o4
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	udivx	%o0,	0x09EA,	%o7
	fmovrdne	%g4,	%f16,	%f10
	or	%l3,	%g7,	%g5
	fpsub16s	%f24,	%f30,	%f2
	fornot2s	%f11,	%f31,	%f9
	fandnot2	%f14,	%f10,	%f24
	popc	%i5,	%o2
	edge32l	%i2,	%g3,	%l1
	fand	%f10,	%f26,	%f0
	movneg	%xcc,	%i6,	%i0
	sth	%i3,	[%l7 + 0x60]
	ldx	[%l7 + 0x48],	%i7
	fpsub16s	%f2,	%f27,	%f15
	movneg	%icc,	%o5,	%l5
	and	%g6,	0x1CBA,	%o1
	fmovrsne	%o3,	%f7,	%f24
	addc	%l6,	0x116E,	%l2
	fmovdne	%xcc,	%f0,	%f5
	st	%f23,	[%l7 + 0x1C]
	andcc	%g2,	%l0,	%o6
	st	%f11,	[%l7 + 0x64]
	addc	%i1,	0x15CE,	%l4
	subcc	%i4,	%o4,	%g1
	alignaddr	%o0,	%g4,	%o7
	movrgz	%l3,	%g7,	%g5
	sth	%o2,	[%l7 + 0x3A]
	fpadd32	%f28,	%f28,	%f4
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%i2
	edge32ln	%i5,	%l1,	%g3
	umulcc	%i0,	0x008D,	%i3
	fsrc2	%f24,	%f22
	or	%i6,	0x12A2,	%i7
	movcs	%icc,	%l5,	%g6
	sub	%o1,	0x1216,	%o3
	fors	%f11,	%f0,	%f27
	fmul8x16	%f12,	%f30,	%f8
	movvc	%icc,	%l6,	%o5
	addcc	%g2,	0x12E2,	%l2
	fmovdn	%icc,	%f19,	%f8
	srax	%l0,	0x16,	%o6
	udivx	%l4,	0x1E1E,	%i1
	edge32ln	%i4,	%g1,	%o4
	xnor	%o0,	0x02EB,	%g4
	edge8ln	%l3,	%o7,	%g7
	fmovrdgz	%o2,	%f24,	%f30
	fsrc1	%f14,	%f0
	nop
	set	0x50, %i4
	ldsb	[%l7 + %i4],	%g5
	fmovrde	%i2,	%f24,	%f26
	ldx	[%l7 + 0x60],	%i5
	fpsub16s	%f27,	%f9,	%f10
	umulcc	%g3,	%l1,	%i3
	fmovde	%icc,	%f2,	%f6
	sth	%i0,	[%l7 + 0x5A]
	xor	%i6,	0x1FF1,	%i7
	movre	%g6,	0x034,	%o1
	alignaddrl	%o3,	%l6,	%l5
	sdiv	%o5,	0x0BD7,	%l2
	movne	%xcc,	%l0,	%g2
	movcc	%icc,	%l4,	%i1
	sdiv	%o6,	0x0E92,	%i4
	sdivx	%g1,	0x033F,	%o4
	fmovsn	%icc,	%f6,	%f7
	subccc	%g4,	0x1483,	%o0
	and	%o7,	%g7,	%o2
	ldub	[%l7 + 0x13],	%l3
	orcc	%g5,	%i5,	%g3
	fmovs	%f10,	%f14
	mulscc	%i2,	0x1C79,	%i3
	subc	%i0,	0x142D,	%i6
	edge32	%l1,	%i7,	%g6
	sdiv	%o3,	0x1B51,	%o1
	mulx	%l6,	%o5,	%l2
	movgu	%icc,	%l0,	%l5
	sth	%l4,	[%l7 + 0x22]
	sth	%g2,	[%l7 + 0x4C]
	lduw	[%l7 + 0x28],	%i1
	and	%i4,	0x1A8E,	%o6
	xor	%o4,	0x10FE,	%g4
	sra	%g1,	%o7,	%g7
	xnor	%o0,	%l3,	%o2
	movvs	%icc,	%g5,	%i5
	fsrc1	%f10,	%f16
	save %g3, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i6,	0x0B5C,	%l1
	edge8l	%i7,	%i0,	%g6
	fmovsleu	%icc,	%f27,	%f7
	edge16l	%o3,	%l6,	%o1
	edge8l	%l2,	%l0,	%o5
	fmovrslez	%l4,	%f14,	%f24
	sllx	%l5,	%g2,	%i4
	fmovrse	%i1,	%f15,	%f11
	fnegs	%f11,	%f30
	fmovsa	%xcc,	%f23,	%f31
	fmovdl	%xcc,	%f3,	%f15
	fpack32	%f20,	%f8,	%f10
	udivx	%o4,	0x15A7,	%o6
	ldd	[%l7 + 0x48],	%f16
	xnor	%g4,	%o7,	%g1
	movrne	%g7,	%o0,	%l3
	ldsb	[%l7 + 0x1E],	%o2
	movcs	%xcc,	%i5,	%g3
	sra	%i2,	0x0C,	%i3
	ldsh	[%l7 + 0x36],	%g5
	edge16	%l1,	%i6,	%i0
	movrgz	%i7,	0x1FA,	%o3
	xnorcc	%g6,	0x0199,	%o1
	edge8	%l2,	%l0,	%o5
	addccc	%l6,	%l5,	%l4
	movrgez	%i4,	%i1,	%g2
	fmovscc	%icc,	%f23,	%f21
	nop
	set	0x47, %i0
	stb	%o6,	[%l7 + %i0]
	edge8ln	%g4,	%o7,	%o4
	ldsb	[%l7 + 0x0A],	%g7
	orncc	%o0,	%l3,	%g1
	subccc	%o2,	%i5,	%i2
	movge	%xcc,	%i3,	%g3
	fmovrdlez	%l1,	%f12,	%f22
	edge16l	%g5,	%i0,	%i7
	andncc	%o3,	%i6,	%g6
	alignaddrl	%o1,	%l0,	%o5
	movrgez	%l2,	0x21F,	%l6
	edge32n	%l5,	%i4,	%l4
	srax	%g2,	0x0A,	%o6
	orn	%g4,	%i1,	%o7
	fmovdcc	%icc,	%f28,	%f16
	movcc	%xcc,	%o4,	%o0
	movpos	%icc,	%l3,	%g7
	edge32	%o2,	%i5,	%i2
	fandnot2	%f20,	%f20,	%f6
	edge8	%i3,	%g3,	%l1
	fpackfix	%f4,	%f23
	andcc	%g5,	%i0,	%i7
	fmovse	%xcc,	%f30,	%f16
	alignaddr	%g1,	%i6,	%g6
	alignaddr	%o3,	%l0,	%o5
	fmovscs	%icc,	%f10,	%f10
	nop
	set	0x0C, %l6
	ldsh	[%l7 + %l6],	%o1
	add	%l2,	%l6,	%i4
	std	%f10,	[%l7 + 0x50]
	movvs	%icc,	%l4,	%g2
	fmovrdgz	%o6,	%f22,	%f0
	ldsb	[%l7 + 0x2C],	%l5
	fcmpeq16	%f4,	%f14,	%i1
	andncc	%o7,	%o4,	%g4
	andncc	%l3,	%o0,	%o2
	ld	[%l7 + 0x28],	%f3
	movg	%icc,	%g7,	%i2
	fmovde	%xcc,	%f20,	%f18
	edge16l	%i3,	%i5,	%g3
	andn	%g5,	%l1,	%i0
	sethi	0x0CF3,	%i7
	sllx	%i6,	0x19,	%g1
	movneg	%xcc,	%o3,	%g6
	array16	%l0,	%o1,	%o5
	edge16l	%l2,	%i4,	%l4
	fmovrdlz	%g2,	%f30,	%f28
	srl	%l6,	%o6,	%i1
	movrlez	%o7,	0x108,	%o4
	ld	[%l7 + 0x54],	%f16
	movvc	%xcc,	%l5,	%l3
	ld	[%l7 + 0x34],	%f24
	sllx	%g4,	%o2,	%g7
	smul	%o0,	0x0104,	%i2
	subccc	%i5,	0x1A0B,	%g3
	fpsub16	%f20,	%f18,	%f28
	ld	[%l7 + 0x64],	%f17
	sdivx	%i3,	0x029D,	%l1
	udiv	%g5,	0x1262,	%i0
	andn	%i6,	0x094D,	%g1
	xor	%i7,	%o3,	%g6
	ldsw	[%l7 + 0x08],	%o1
	edge32ln	%l0,	%o5,	%l2
	addc	%l4,	0x1BF6,	%i4
	sir	0x1619
	mova	%icc,	%g2,	%l6
	andncc	%i1,	%o7,	%o6
	srlx	%o4,	%l3,	%l5
	movneg	%icc,	%o2,	%g4
	popc	%g7,	%i2
	ld	[%l7 + 0x64],	%f12
	edge16l	%o0,	%i5,	%i3
	movle	%xcc,	%l1,	%g3
	sethi	0x0020,	%i0
	sllx	%g5,	0x03,	%i6
	orn	%i7,	0x0AAB,	%g1
	lduh	[%l7 + 0x0E],	%o3
	edge16ln	%g6,	%o1,	%o5
	andncc	%l2,	%l0,	%i4
	fmovdne	%xcc,	%f10,	%f29
	fmovdvs	%xcc,	%f5,	%f14
	fpadd16s	%f7,	%f30,	%f6
	sll	%l4,	0x14,	%g2
	st	%f0,	[%l7 + 0x38]
	sethi	0x0C05,	%l6
	ldsw	[%l7 + 0x44],	%o7
	srlx	%i1,	0x17,	%o4
	fnot2	%f18,	%f24
	srax	%l3,	0x04,	%o6
	nop
	set	0x1C, %o7
	stw	%l5,	[%l7 + %o7]
	fabsd	%f24,	%f24
	andn	%g4,	%g7,	%i2
	subcc	%o2,	%i5,	%o0
	save %l1, %i3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x0DAB,	%i6
	ldsb	[%l7 + 0x6D],	%i7
	fmovdvc	%icc,	%f9,	%f14
	srl	%g1,	%g5,	%g6
	fzeros	%f12
	or	%o1,	0x0A7D,	%o5
	alignaddrl	%l2,	%o3,	%i4
	fmovrslz	%l4,	%f5,	%f24
	array16	%g2,	%l0,	%l6
	edge16n	%o7,	%i1,	%l3
	addc	%o4,	0x0A6F,	%o6
	fmovdpos	%icc,	%f19,	%f21
	stb	%l5,	[%l7 + 0x41]
	fmovdgu	%xcc,	%f16,	%f30
	mova	%icc,	%g4,	%g7
	movneg	%xcc,	%o2,	%i2
	udiv	%i5,	0x09D3,	%l1
	movn	%icc,	%o0,	%i3
	movrne	%i0,	%g3,	%i7
	edge32n	%i6,	%g1,	%g6
	or	%o1,	0x076B,	%g5
	sub	%o5,	%o3,	%l2
	umul	%l4,	%g2,	%i4
	st	%f19,	[%l7 + 0x7C]
	fmovdle	%icc,	%f21,	%f25
	sdiv	%l0,	0x0C87,	%l6
	subccc	%o7,	%l3,	%i1
	popc	%o4,	%o6
	smul	%l5,	0x091D,	%g4
	movcc	%icc,	%o2,	%i2
	fmul8sux16	%f28,	%f14,	%f26
	smul	%g7,	0x0AB9,	%i5
	fone	%f30
	array8	%o0,	%l1,	%i3
	fmovsge	%icc,	%f25,	%f14
	srax	%i0,	0x1A,	%g3
	edge32n	%i6,	%i7,	%g1
	mulx	%o1,	0x0C26,	%g5
	nop
	set	0x40, %l4
	sth	%g6,	[%l7 + %l4]
	movne	%icc,	%o3,	%l2
	xnorcc	%l4,	0x14DC,	%g2
	movrlez	%o5,	%i4,	%l6
	fcmps	%fcc3,	%f3,	%f20
	ldsw	[%l7 + 0x60],	%o7
	srlx	%l3,	%i1,	%l0
	sethi	0x1E35,	%o4
	fandnot2s	%f1,	%f1,	%f23
	srlx	%l5,	0x03,	%g4
	st	%f30,	[%l7 + 0x70]
	movl	%xcc,	%o6,	%o2
	udiv	%g7,	0x0C7A,	%i2
	fmovdge	%icc,	%f6,	%f29
	bshuffle	%f20,	%f10,	%f30
	movneg	%xcc,	%i5,	%l1
	edge16n	%i3,	%o0,	%i0
	smul	%i6,	%g3,	%i7
	umul	%o1,	0x037E,	%g5
	fmovdl	%icc,	%f27,	%f22
	fandnot1	%f12,	%f12,	%f4
	stw	%g1,	[%l7 + 0x1C]
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f16
	fors	%f23,	%f5,	%f15
	orcc	%g6,	%o3,	%l4
	smul	%g2,	%l2,	%o5
	edge16l	%l6,	%i4,	%l3
	mulscc	%i1,	0x1470,	%l0
	fmovrdgz	%o4,	%f24,	%f16
	popc	0x078B,	%o7
	movrlez	%l5,	%g4,	%o2
	addc	%g7,	0x06AA,	%i2
	ldd	[%l7 + 0x50],	%i4
	ld	[%l7 + 0x40],	%f24
	edge32l	%o6,	%i3,	%o0
	addc	%i0,	%i6,	%g3
	sll	%i7,	%o1,	%g5
	movge	%icc,	%l1,	%g1
	movrlez	%g6,	0x268,	%l4
	fnand	%f2,	%f18,	%f10
	edge8l	%o3,	%l2,	%o5
	fmovsleu	%icc,	%f27,	%f1
	edge16l	%l6,	%g2,	%l3
	ldx	[%l7 + 0x50],	%i4
	movne	%icc,	%l0,	%i1
	edge8ln	%o7,	%l5,	%g4
	fsrc1s	%f20,	%f16
	fmovrsgz	%o4,	%f19,	%f22
	fmovdleu	%icc,	%f26,	%f13
	movrgz	%g7,	0x03A,	%o2
	xorcc	%i5,	0x1736,	%o6
	mova	%xcc,	%i2,	%o0
	alignaddrl	%i3,	%i6,	%g3
	add	%i7,	0x1FF1,	%o1
	fmovrdgez	%g5,	%f14,	%f14
	sdivcc	%i0,	0x135D,	%l1
	stx	%g6,	[%l7 + 0x40]
	edge32	%l4,	%o3,	%l2
	ldsw	[%l7 + 0x64],	%o5
	subc	%l6,	%g2,	%g1
	mova	%xcc,	%i4,	%l0
	fcmpd	%fcc1,	%f0,	%f30
	movvc	%xcc,	%i1,	%o7
	movpos	%icc,	%l3,	%l5
	stb	%o4,	[%l7 + 0x71]
	st	%f15,	[%l7 + 0x1C]
	orncc	%g7,	%g4,	%i5
	xnor	%o6,	0x04BA,	%o2
	fmovrdne	%i2,	%f2,	%f14
	popc	0x0630,	%o0
	smul	%i3,	0x1CDC,	%g3
	srlx	%i7,	0x14,	%o1
	udivx	%i6,	0x1EFB,	%g5
	ldx	[%l7 + 0x78],	%i0
	udivcc	%g6,	0x1B9B,	%l4
	or	%o3,	0x0F0A,	%l1
	sth	%o5,	[%l7 + 0x6E]
	subcc	%l2,	%l6,	%g1
	add	%i4,	%g2,	%l0
	movrgz	%o7,	%l3,	%i1
	ldd	[%l7 + 0x58],	%o4
	movleu	%xcc,	%l5,	%g7
	orn	%g4,	0x1CA9,	%i5
	sllx	%o6,	%o2,	%o0
	fxors	%f8,	%f12,	%f16
	ld	[%l7 + 0x14],	%f11
	movrlez	%i2,	%i3,	%g3
	sub	%o1,	0x0057,	%i6
	ldx	[%l7 + 0x38],	%g5
	fmovsvc	%icc,	%f29,	%f4
	ldx	[%l7 + 0x48],	%i0
	umulcc	%i7,	%l4,	%o3
	movcs	%xcc,	%l1,	%o5
	fmovrde	%l2,	%f26,	%f26
	andcc	%l6,	0x0AA6,	%g1
	movle	%icc,	%i4,	%g2
	add	%l0,	0x0020,	%o7
	fmovdg	%icc,	%f12,	%f28
	subccc	%g6,	%l3,	%i1
	sdivcc	%l5,	0x19D9,	%g7
	fmovsvc	%icc,	%f6,	%f18
	fmovscc	%icc,	%f6,	%f14
	addccc	%o4,	0x0132,	%i5
	nop
	set	0x48, %o5
	std	%f4,	[%l7 + %o5]
	edge16l	%g4,	%o2,	%o6
	fsrc1	%f6,	%f20
	fmul8ulx16	%f6,	%f28,	%f26
	sra	%i2,	%o0,	%g3
	movcc	%xcc,	%i3,	%i6
	movge	%xcc,	%o1,	%g5
	fmovs	%f24,	%f10
	sllx	%i0,	0x07,	%i7
	popc	0x1BED,	%l4
	andncc	%l1,	%o3,	%o5
	fmovrslz	%l6,	%f4,	%f8
	andn	%l2,	%i4,	%g1
	edge8l	%g2,	%l0,	%o7
	popc	%g6,	%l3
	udivcc	%i1,	0x0AEA,	%l5
	movrlz	%g7,	%o4,	%i5
	add	%g4,	%o6,	%i2
	sub	%o2,	%g3,	%o0
	fmovdvc	%icc,	%f12,	%f16
	movneg	%xcc,	%i3,	%o1
	subc	%i6,	0x0736,	%g5
	fmovdne	%icc,	%f3,	%f28
	movle	%xcc,	%i0,	%l4
	array8	%l1,	%i7,	%o3
	edge32n	%l6,	%l2,	%i4
	udiv	%o5,	0x0603,	%g1
	fmovscs	%icc,	%f3,	%f6
	fnegd	%f24,	%f16
	mulx	%l0,	%o7,	%g6
	save %g2, 0x0026, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%l5,	%f13,	%f5
	ldsw	[%l7 + 0x58],	%l3
	srlx	%o4,	%i5,	%g4
	andncc	%o6,	%i2,	%g7
	fandnot2s	%f29,	%f24,	%f3
	movrgez	%g3,	0x10A,	%o2
	std	%f24,	[%l7 + 0x08]
	sdiv	%i3,	0x0C65,	%o1
	st	%f24,	[%l7 + 0x7C]
	add	%o0,	%i6,	%i0
	movpos	%icc,	%g5,	%l4
	sub	%i7,	%l1,	%o3
	movpos	%icc,	%l6,	%i4
	fmuld8sux16	%f4,	%f27,	%f4
	alignaddr	%l2,	%g1,	%o5
	fnors	%f8,	%f24,	%f16
	movrgez	%l0,	0x05B,	%o7
	sethi	0x161B,	%g6
	xor	%i1,	0x037E,	%g2
	movge	%icc,	%l3,	%l5
	restore %i5, 0x025D, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f19,	%f5,	%f20
	fmovdpos	%xcc,	%f18,	%f26
	fxnor	%f0,	%f2,	%f6
	movrlz	%o6,	0x3AE,	%i2
	srl	%o4,	0x08,	%g3
	sth	%o2,	[%l7 + 0x7A]
	fones	%f12
	fnot2	%f30,	%f26
	array8	%i3,	%o1,	%g7
	save %o0, 0x09F1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i6,	[%l7 + 0x58]
	sllx	%g5,	%l4,	%i7
	xnor	%o3,	%l6,	%i4
	fpack32	%f0,	%f18,	%f10
	orcc	%l2,	0x1E0D,	%l1
	array16	%g1,	%o5,	%l0
	fmovrsgez	%g6,	%f3,	%f29
	fornot1s	%f29,	%f16,	%f16
	subcc	%i1,	0x16BC,	%g2
	st	%f16,	[%l7 + 0x68]
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	siam	0x7
	subccc	%l5,	0x07C9,	%i5
	fmovdne	%xcc,	%f5,	%f8
	lduh	[%l7 + 0x14],	%g4
	xnor	%o6,	0x1E10,	%i2
	edge16l	%g3,	%o2,	%i3
	srax	%o1,	%o4,	%o0
	pdist	%f22,	%f20,	%f8
	movcs	%icc,	%g7,	%i6
	array32	%g5,	%i0,	%i7
	ldsw	[%l7 + 0x34],	%o3
	movgu	%icc,	%l4,	%l6
	sll	%l2,	%i4,	%l1
	sethi	0x0AAF,	%o5
	stw	%g1,	[%l7 + 0x18]
	fsrc1s	%f9,	%f15
	fsrc2s	%f4,	%f25
	fmuld8sux16	%f27,	%f13,	%f16
	sth	%g6,	[%l7 + 0x0C]
	move	%icc,	%l0,	%g2
	ldsb	[%l7 + 0x72],	%l3
	movvc	%icc,	%o7,	%i1
	faligndata	%f8,	%f28,	%f2
	stb	%l5,	[%l7 + 0x6A]
	lduw	[%l7 + 0x14],	%i5
	faligndata	%f22,	%f0,	%f14
	movn	%icc,	%o6,	%g4
	nop
	set	0x70, %i1
	ldd	[%l7 + %i1],	%f12
	sra	%g3,	0x17,	%i2
	movrgz	%o2,	%i3,	%o1
	edge32	%o0,	%o4,	%i6
	fnegd	%f10,	%f24
	move	%icc,	%g5,	%i0
	movrgez	%i7,	0x343,	%g7
	movgu	%icc,	%l4,	%o3
	std	%f0,	[%l7 + 0x48]
	srax	%l6,	%l2,	%l1
	alignaddrl	%o5,	%g1,	%g6
	movrlz	%i4,	%l0,	%g2
	fones	%f9
	sdivcc	%o7,	0x1969,	%i1
	andn	%l5,	%l3,	%i5
	restore %o6, 0x14DD, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g3,	%o2
	edge16l	%i2,	%o1,	%i3
	edge8	%o4,	%i6,	%o0
	edge8	%i0,	%g5,	%g7
	addccc	%i7,	%o3,	%l6
	orcc	%l4,	0x0A8F,	%l2
	srlx	%o5,	0x0C,	%g1
	edge32l	%g6,	%i4,	%l1
	fmovsvc	%icc,	%f29,	%f11
	orncc	%g2,	0x195F,	%l0
	array32	%o7,	%l5,	%l3
	fmovdvc	%xcc,	%f17,	%f8
	fmul8ulx16	%f8,	%f22,	%f0
	fcmpes	%fcc1,	%f2,	%f21
	orncc	%i1,	0x0D1F,	%i5
	srl	%o6,	0x1D,	%g4
	smulcc	%o2,	0x1CB2,	%i2
	movge	%icc,	%o1,	%i3
	subccc	%o4,	%i6,	%g3
	movrlez	%i0,	0x217,	%g5
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fmovde	%icc,	%f9,	%f8
	fxor	%f18,	%f6,	%f8
	sdivx	%o3,	0x1F61,	%l6
	movvs	%icc,	%l4,	%o5
	addcc	%l2,	0x124D,	%g1
	edge16	%i4,	%l1,	%g6
	andncc	%l0,	%o7,	%g2
	sdivcc	%l3,	0x10F6,	%i1
	fone	%f8
	xnor	%l5,	0x1D33,	%i5
	fcmps	%fcc0,	%f5,	%f21
	mulx	%g4,	0x1824,	%o6
	edge16l	%i2,	%o1,	%i3
	sdivcc	%o2,	0x1726,	%i6
	fmovsle	%icc,	%f7,	%f15
	ldsb	[%l7 + 0x74],	%o4
	fmovdcs	%xcc,	%f26,	%f8
	popc	%i0,	%g3
	xnorcc	%g5,	%i7,	%g7
	fcmpgt16	%f14,	%f22,	%o3
	fmovrdgez	%l6,	%f20,	%f12
	movne	%icc,	%l4,	%o0
	edge16	%l2,	%o5,	%i4
	move	%xcc,	%g1,	%g6
	stx	%l0,	[%l7 + 0x40]
	nop
	set	0x20, %o0
	lduw	[%l7 + %o0],	%o7
	fnot2s	%f9,	%f2
	fcmple16	%f6,	%f18,	%l1
	movgu	%xcc,	%l3,	%g2
	fmovsneg	%icc,	%f14,	%f24
	mulx	%l5,	%i5,	%i1
	fmovsl	%icc,	%f7,	%f3
	fcmple16	%f6,	%f8,	%o6
	movrlez	%g4,	0x2CF,	%i2
	movvs	%icc,	%o1,	%i3
	sethi	0x1E1C,	%o2
	movrgez	%i6,	%o4,	%i0
	andcc	%g3,	%i7,	%g7
	smul	%g5,	0x0FA6,	%l6
	movvc	%xcc,	%o3,	%o0
	fmovde	%icc,	%f16,	%f25
	ldsw	[%l7 + 0x6C],	%l2
	xnorcc	%o5,	%i4,	%l4
	movcs	%icc,	%g1,	%g6
	array8	%o7,	%l1,	%l3
	fmovspos	%xcc,	%f2,	%f12
	edge8	%g2,	%l0,	%i5
	movrgz	%l5,	0x272,	%i1
	fcmpeq32	%f8,	%f0,	%g4
	smul	%i2,	0x19D9,	%o6
	ldsb	[%l7 + 0x38],	%o1
	sethi	0x17FC,	%o2
	array8	%i6,	%i3,	%i0
	ldsb	[%l7 + 0x4C],	%o4
	array8	%i7,	%g3,	%g7
	movleu	%icc,	%g5,	%o3
	subcc	%o0,	0x1EEB,	%l2
	sll	%l6,	%i4,	%o5
	sethi	0x19F2,	%l4
	orncc	%g6,	0x15F2,	%g1
	fmovda	%xcc,	%f22,	%f11
	mulscc	%o7,	0x1ED7,	%l3
	fcmple32	%f30,	%f20,	%g2
	and	%l0,	0x036D,	%l1
	fcmpd	%fcc2,	%f0,	%f14
	fzero	%f10
	fnot1s	%f12,	%f5
	stb	%l5,	[%l7 + 0x1F]
	nop
	set	0x10, %g6
	ldd	[%l7 + %g6],	%f0
	ldd	[%l7 + 0x60],	%i0
	fcmpeq32	%f6,	%f0,	%g4
	fmovda	%icc,	%f27,	%f16
	edge8	%i5,	%i2,	%o1
	xor	%o6,	0x17A3,	%o2
	subc	%i3,	%i6,	%o4
	mulscc	%i0,	0x07D7,	%i7
	ldsb	[%l7 + 0x34],	%g7
	array8	%g5,	%o3,	%o0
	fpadd16s	%f19,	%f0,	%f4
	edge32l	%g3,	%l2,	%i4
	save %l6, 0x1DE1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o5,	%f19,	%f6
	fmovsl	%icc,	%f12,	%f21
	fmovrsgez	%g1,	%f17,	%f23
	sdivcc	%g6,	0x0186,	%o7
	std	%f20,	[%l7 + 0x48]
	alignaddrl	%l3,	%l0,	%g2
	movvc	%xcc,	%l1,	%i1
	fmovdne	%xcc,	%f0,	%f2
	udivx	%g4,	0x11C2,	%l5
	sllx	%i2,	0x0F,	%o1
	edge16n	%o6,	%o2,	%i3
	fnegs	%f9,	%f21
	fandnot1s	%f19,	%f31,	%f12
	movre	%i5,	0x143,	%i6
	edge8ln	%o4,	%i7,	%g7
	umul	%i0,	%o3,	%o0
	fnor	%f6,	%f4,	%f14
	fmovrsgz	%g5,	%f31,	%f24
	fandnot1	%f18,	%f12,	%f30
	pdist	%f20,	%f30,	%f2
	array8	%l2,	%g3,	%l6
	fand	%f0,	%f10,	%f14
	fnot2s	%f15,	%f24
	fxor	%f24,	%f4,	%f16
	nop
	set	0x20, %g2
	stx	%i4,	[%l7 + %g2]
	add	%l4,	%o5,	%g1
	fmovrsgez	%o7,	%f31,	%f14
	movpos	%xcc,	%l3,	%g6
	or	%l0,	%l1,	%i1
	subccc	%g4,	%g2,	%i2
	addc	%l5,	0x05F1,	%o6
	edge32	%o2,	%i3,	%i5
	srl	%i6,	%o1,	%i7
	udivcc	%o4,	0x14A7,	%i0
	movrlez	%o3,	%g7,	%g5
	udivcc	%l2,	0x0435,	%o0
	umul	%l6,	0x1D24,	%i4
	sllx	%g3,	%o5,	%l4
	ldd	[%l7 + 0x30],	%f6
	sllx	%g1,	0x13,	%o7
	fcmpne16	%f8,	%f4,	%l3
	movrgz	%l0,	0x089,	%l1
	orncc	%i1,	0x09F4,	%g4
	orn	%g6,	0x0F3B,	%g2
	fmul8x16	%f0,	%f16,	%f10
	fmovdcc	%xcc,	%f16,	%f6
	fmovdge	%xcc,	%f3,	%f17
	edge8	%l5,	%o6,	%i2
	sth	%o2,	[%l7 + 0x16]
	siam	0x4
	edge8l	%i5,	%i3,	%i6
	fpmerge	%f19,	%f10,	%f24
	addcc	%i7,	0x0D63,	%o4
	sir	0x0248
	edge16n	%o1,	%i0,	%o3
	fornot2	%f24,	%f4,	%f18
	edge16ln	%g5,	%g7,	%l2
	fmovdvc	%xcc,	%f20,	%f13
	fmovscs	%icc,	%f23,	%f16
	edge8	%o0,	%i4,	%l6
	array32	%o5,	%l4,	%g3
	fmovrsgz	%o7,	%f21,	%f11
	fmovsvs	%xcc,	%f1,	%f20
	fmovdl	%icc,	%f30,	%f28
	fmovsg	%xcc,	%f0,	%f8
	movvs	%icc,	%g1,	%l3
	array8	%l1,	%i1,	%g4
	movn	%icc,	%l0,	%g2
	restore %g6, %l5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o6,	%o2,	%i5
	ldx	[%l7 + 0x40],	%i6
	or	%i7,	0x10EC,	%i3
	movne	%icc,	%o4,	%o1
	andncc	%i0,	%o3,	%g7
	sethi	0x1F93,	%l2
	movrlz	%o0,	0x135,	%g5
	fcmpgt16	%f22,	%f30,	%l6
	stb	%i4,	[%l7 + 0x0C]
	fmovsgu	%icc,	%f18,	%f1
	andn	%l4,	%o5,	%o7
	umulcc	%g3,	%g1,	%l1
	fmovrdgez	%i1,	%f6,	%f10
	fmul8ulx16	%f12,	%f26,	%f10
	andncc	%l3,	%l0,	%g2
	xnorcc	%g4,	%l5,	%g6
	sdivcc	%i2,	0x0862,	%o6
	edge32n	%i5,	%o2,	%i6
	srlx	%i7,	0x18,	%i3
	fandnot2	%f24,	%f6,	%f22
	movleu	%icc,	%o4,	%i0
	udivcc	%o1,	0x108F,	%o3
	fcmple16	%f2,	%f18,	%l2
	or	%o0,	0x1D68,	%g7
	alignaddr	%g5,	%i4,	%l6
	ld	[%l7 + 0x74],	%f10
	movcc	%icc,	%o5,	%l4
	sethi	0x0C94,	%g3
	umul	%g1,	0x102D,	%o7
	siam	0x3
	mulscc	%i1,	%l3,	%l0
	stb	%l1,	[%l7 + 0x5A]
	move	%xcc,	%g4,	%l5
	andn	%g2,	0x1F43,	%i2
	stb	%g6,	[%l7 + 0x17]
	ldub	[%l7 + 0x1C],	%i5
	edge8l	%o2,	%i6,	%i7
	addcc	%o6,	%i3,	%i0
	fmovsn	%icc,	%f14,	%f16
	movleu	%xcc,	%o4,	%o1
	andcc	%l2,	%o3,	%g7
	andcc	%o0,	0x0EE3,	%i4
	st	%f19,	[%l7 + 0x34]
	fmovrsgz	%g5,	%f19,	%f5
	mulscc	%o5,	%l6,	%l4
	fandnot2s	%f3,	%f26,	%f2
	sdivx	%g3,	0x0436,	%o7
	movpos	%icc,	%i1,	%l3
	mulscc	%l0,	%l1,	%g4
	fxnors	%f2,	%f27,	%f25
	nop
	set	0x70, %o2
	ldsw	[%l7 + %o2],	%l5
	stx	%g2,	[%l7 + 0x50]
	movn	%icc,	%g1,	%g6
	movl	%xcc,	%i2,	%i5
	st	%f23,	[%l7 + 0x2C]
	sdivx	%o2,	0x19CB,	%i7
	fnand	%f26,	%f24,	%f24
	nop
	set	0x49, %o3
	stb	%i6,	[%l7 + %o3]
	fandnot1s	%f30,	%f22,	%f2
	umulcc	%i3,	0x01B5,	%i0
	edge8	%o6,	%o4,	%l2
	sdivcc	%o1,	0x05D6,	%o3
	ld	[%l7 + 0x24],	%f22
	andcc	%g7,	0x1D11,	%o0
	mulx	%i4,	0x008E,	%o5
	or	%l6,	0x04D1,	%l4
	edge16n	%g5,	%g3,	%i1
	fexpand	%f15,	%f0
	fsrc2	%f8,	%f20
	edge8	%o7,	%l3,	%l1
	edge16n	%l0,	%l5,	%g4
	fmovsl	%icc,	%f1,	%f12
	sra	%g1,	%g6,	%g2
	edge32n	%i5,	%o2,	%i7
	ldsb	[%l7 + 0x60],	%i2
	fpack32	%f20,	%f6,	%f22
	fpadd32	%f12,	%f10,	%f24
	subcc	%i6,	0x0E94,	%i3
	ldd	[%l7 + 0x50],	%o6
	fmovsneg	%xcc,	%f30,	%f22
	alignaddr	%i0,	%l2,	%o1
	fmovrsgez	%o3,	%f26,	%f19
	fmovsge	%icc,	%f9,	%f10
	fmovsne	%xcc,	%f4,	%f0
	sth	%o4,	[%l7 + 0x68]
	sub	%g7,	0x11E4,	%i4
	sth	%o5,	[%l7 + 0x5A]
	ldsw	[%l7 + 0x50],	%l6
	udivx	%o0,	0x1E5B,	%l4
	st	%f24,	[%l7 + 0x1C]
	fpack16	%f16,	%f15
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	fmovrsgez	%o7,	%f13,	%f1
	fnot1	%f8,	%f2
	edge8n	%l3,	%g3,	%l1
	fmovspos	%icc,	%f13,	%f14
	edge16ln	%l5,	%l0,	%g1
	xorcc	%g4,	%g2,	%g6
	fmovscs	%xcc,	%f10,	%f4
	lduw	[%l7 + 0x60],	%o2
	sra	%i7,	%i5,	%i2
	fcmpes	%fcc0,	%f19,	%f18
	fmovdge	%xcc,	%f27,	%f26
	mova	%icc,	%i6,	%i3
	fmovde	%icc,	%f28,	%f0
	fzero	%f10
	fpadd32s	%f11,	%f29,	%f0
	sdivcc	%i0,	0x0A4A,	%l2
	sub	%o6,	0x1BE0,	%o1
	movl	%xcc,	%o3,	%g7
	movrlz	%i4,	0x170,	%o5
	srl	%o4,	%l6,	%l4
	movleu	%icc,	%g5,	%i1
	mulscc	%o0,	%l3,	%g3
	fnegd	%f22,	%f2
	addcc	%o7,	0x1759,	%l5
	ldd	[%l7 + 0x28],	%f16
	alignaddrl	%l0,	%l1,	%g4
	edge32n	%g2,	%g6,	%g1
	smul	%o2,	%i5,	%i7
	movrne	%i2,	%i6,	%i3
	movne	%xcc,	%l2,	%i0
	udiv	%o6,	0x1DA4,	%o3
	movrgz	%o1,	%g7,	%o5
	ldub	[%l7 + 0x65],	%i4
	movre	%o4,	%l6,	%g5
	mulx	%i1,	%o0,	%l4
	restore %g3, 0x154C, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%l3,	0x0423,	%l5
	umul	%l1,	0x1DD8,	%l0
	movneg	%xcc,	%g4,	%g2
	ld	[%l7 + 0x24],	%f25
	xnor	%g6,	0x1255,	%o2
	xorcc	%g1,	%i7,	%i5
	fpsub32	%f14,	%f18,	%f16
	edge32	%i6,	%i3,	%l2
	std	%f30,	[%l7 + 0x68]
	nop
	set	0x38, %o6
	stx	%i2,	[%l7 + %o6]
	save %i0, %o6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f16,	[%l7 + 0x64]
	ld	[%l7 + 0x6C],	%f16
	st	%f1,	[%l7 + 0x4C]
	fmovrsgez	%g7,	%f22,	%f9
	orncc	%o5,	0x1609,	%o3
	movpos	%icc,	%o4,	%i4
	andn	%g5,	%i1,	%l6
	alignaddrl	%l4,	%g3,	%o0
	edge16	%l3,	%o7,	%l1
	sll	%l5,	%g4,	%g2
	movneg	%xcc,	%g6,	%l0
	fmovrdlz	%g1,	%f16,	%f16
	save %o2, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i3,	%l2,	%i5
	sethi	0x1659,	%i2
	popc	0x0B8B,	%o6
	sllx	%i0,	%g7,	%o1
	edge8n	%o3,	%o4,	%i4
	ldsh	[%l7 + 0x7E],	%o5
	fmovdvs	%icc,	%f16,	%f17
	popc	%i1,	%l6
	fxnors	%f4,	%f4,	%f14
	movn	%xcc,	%l4,	%g3
	ldd	[%l7 + 0x28],	%g4
	fxor	%f20,	%f18,	%f8
	subccc	%o0,	%l3,	%l1
	alignaddrl	%o7,	%l5,	%g2
	fzeros	%f19
	addc	%g4,	%l0,	%g1
	ld	[%l7 + 0x6C],	%f25
	addccc	%g6,	0x162E,	%o2
	fnand	%f22,	%f14,	%f2
	array16	%i7,	%i3,	%i6
	sth	%i5,	[%l7 + 0x38]
	fmovrslez	%i2,	%f20,	%f2
	movn	%xcc,	%o6,	%l2
	sir	0x1D1C
	sub	%g7,	0x0D1E,	%i0
	lduh	[%l7 + 0x10],	%o1
	srax	%o3,	%o4,	%o5
	ldsb	[%l7 + 0x37],	%i1
	nop
	set	0x5E, %i7
	ldub	[%l7 + %i7],	%l6
	array8	%l4,	%i4,	%g3
	edge16ln	%o0,	%l3,	%g5
	ldd	[%l7 + 0x10],	%l0
	edge32l	%l5,	%g2,	%g4
	st	%f16,	[%l7 + 0x60]
	xnorcc	%l0,	0x0033,	%g1
	sth	%o7,	[%l7 + 0x28]
	fmovsl	%xcc,	%f13,	%f14
	udiv	%o2,	0x11B1,	%g6
	andcc	%i7,	%i6,	%i3
	st	%f21,	[%l7 + 0x0C]
	fpadd32s	%f19,	%f2,	%f24
	mova	%xcc,	%i2,	%i5
	smul	%o6,	%g7,	%i0
	udiv	%l2,	0x0259,	%o3
	fcmpgt16	%f4,	%f4,	%o4
	udivx	%o1,	0x15D1,	%i1
	movrne	%o5,	%l4,	%i4
	udiv	%l6,	0x1090,	%g3
	movne	%xcc,	%o0,	%g5
	andncc	%l3,	%l5,	%l1
	sub	%g4,	0x1387,	%g2
	fmovdvc	%icc,	%f14,	%f23
	orn	%g1,	%l0,	%o7
	array16	%g6,	%o2,	%i7
	smulcc	%i6,	0x0E88,	%i3
	sllx	%i2,	%i5,	%g7
	movn	%xcc,	%o6,	%l2
	movneg	%xcc,	%o3,	%o4
	mulscc	%o1,	%i1,	%o5
	udiv	%l4,	0x1E57,	%i4
	ldub	[%l7 + 0x66],	%l6
	ld	[%l7 + 0x1C],	%f0
	movrne	%g3,	%o0,	%g5
	fcmps	%fcc3,	%f18,	%f5
	movgu	%icc,	%i0,	%l3
	andcc	%l1,	%l5,	%g4
	udivcc	%g1,	0x1DDA,	%g2
	fcmpne32	%f24,	%f22,	%o7
	array8	%l0,	%g6,	%o2
	fnot1s	%f30,	%f25
	alignaddr	%i6,	%i7,	%i3
	array32	%i5,	%g7,	%o6
	ld	[%l7 + 0x28],	%f5
	mulx	%l2,	0x06EB,	%o3
	ldd	[%l7 + 0x60],	%i2
	sra	%o4,	0x06,	%i1
	fmovsvc	%icc,	%f0,	%f16
	xorcc	%o1,	%l4,	%o5
	movrlz	%i4,	0x17F,	%l6
	fmovrslz	%o0,	%f16,	%f18
	movrgz	%g3,	0x2B5,	%g5
	fnand	%f6,	%f20,	%f4
	ldx	[%l7 + 0x28],	%l3
	fnot1	%f24,	%f4
	andn	%l1,	%i0,	%g4
	ldsb	[%l7 + 0x71],	%g1
	array32	%l5,	%g2,	%l0
	sethi	0x1C6F,	%g6
	std	%f6,	[%l7 + 0x70]
	orncc	%o7,	0x1EF3,	%i6
	movpos	%xcc,	%i7,	%i3
	fmovsl	%icc,	%f31,	%f19
	alignaddr	%i5,	%g7,	%o2
	ldsw	[%l7 + 0x50],	%o6
	ld	[%l7 + 0x6C],	%f8
	movneg	%xcc,	%o3,	%i2
	sll	%l2,	%i1,	%o1
	popc	0x051F,	%o4
	ldd	[%l7 + 0x48],	%f24
	fpsub32s	%f20,	%f22,	%f20
	orcc	%o5,	%l4,	%i4
	fones	%f8
	movle	%xcc,	%l6,	%o0
	movle	%icc,	%g5,	%l3
	edge16l	%g3,	%l1,	%g4
	sdivx	%g1,	0x1CB0,	%l5
	sub	%g2,	%l0,	%i0
	fmovrslez	%g6,	%f15,	%f15
	udivcc	%o7,	0x19D9,	%i7
	udiv	%i6,	0x1B67,	%i5
	edge16ln	%g7,	%i3,	%o6
	save %o2, 0x1A9C, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i2,	%i1
	and	%o1,	0x1716,	%l2
	array32	%o5,	%o4,	%l4
	bshuffle	%f8,	%f24,	%f16
	orncc	%i4,	%l6,	%o0
	addccc	%g5,	%g3,	%l3
	fmovsa	%icc,	%f8,	%f24
	movrne	%l1,	%g1,	%l5
	stx	%g4,	[%l7 + 0x70]
	ldx	[%l7 + 0x18],	%g2
	movrlez	%i0,	0x16E,	%g6
	movgu	%xcc,	%o7,	%i7
	fmovd	%f6,	%f22
	fpack16	%f30,	%f14
	fmovdneg	%icc,	%f8,	%f24
	fpsub16s	%f20,	%f16,	%f9
	or	%l0,	%i6,	%i5
	movrgz	%g7,	0x2D9,	%o6
	fmovsge	%icc,	%f27,	%f11
	ldd	[%l7 + 0x58],	%f30
	fpadd32s	%f12,	%f29,	%f21
	lduw	[%l7 + 0x44],	%i3
	smul	%o2,	%o3,	%i1
	array16	%o1,	%i2,	%l2
	sub	%o4,	%l4,	%o5
	subccc	%i4,	0x0D38,	%o0
	edge8n	%l6,	%g3,	%g5
	nop
	set	0x1E, %g3
	stb	%l3,	[%l7 + %g3]
	fmovdn	%xcc,	%f10,	%f5
	orncc	%l1,	0x0F69,	%g1
	smul	%g4,	%g2,	%l5
	fnot2	%f12,	%f20
	sdiv	%g6,	0x1099,	%i0
	xor	%i7,	%o7,	%l0
	movg	%xcc,	%i6,	%g7
	mova	%icc,	%i5,	%i3
	fornot2	%f6,	%f6,	%f2
	srax	%o6,	%o3,	%o2
	edge16n	%o1,	%i1,	%i2
	movcs	%icc,	%l2,	%l4
	sub	%o4,	0x0DB7,	%o5
	ldd	[%l7 + 0x30],	%f28
	udivx	%o0,	0x127B,	%l6
	ld	[%l7 + 0x4C],	%f17
	for	%f30,	%f10,	%f6
	st	%f10,	[%l7 + 0x58]
	edge16l	%i4,	%g3,	%g5
	addcc	%l3,	%g1,	%g4
	orcc	%l1,	%l5,	%g2
	orcc	%g6,	%i7,	%o7
	fcmpeq32	%f2,	%f12,	%l0
	edge16l	%i0,	%i6,	%i5
	sll	%i3,	%g7,	%o6
	fpack16	%f26,	%f31
	andncc	%o2,	%o1,	%o3
	orcc	%i1,	0x0D50,	%i2
	movre	%l4,	%o4,	%o5
	edge32ln	%o0,	%l2,	%l6
	movcc	%icc,	%g3,	%g5
	addccc	%i4,	0x1A16,	%g1
	sdivcc	%l3,	0x159D,	%g4
	fmovspos	%xcc,	%f23,	%f22
	subc	%l1,	%l5,	%g2
	smul	%i7,	%g6,	%l0
	fcmpgt32	%f6,	%f8,	%o7
	fmul8ulx16	%f28,	%f22,	%f22
	fmovdleu	%xcc,	%f19,	%f18
	or	%i6,	0x09AA,	%i5
	addcc	%i0,	0x19E3,	%g7
	movgu	%icc,	%i3,	%o2
	fandnot1s	%f19,	%f20,	%f12
	movgu	%icc,	%o6,	%o1
	ldsb	[%l7 + 0x7A],	%o3
	fxnor	%f24,	%f4,	%f8
	smulcc	%i1,	0x03C6,	%l4
	movrgz	%o4,	%i2,	%o5
	fnot2s	%f23,	%f27
	fand	%f28,	%f24,	%f14
	fmovrdlez	%l2,	%f2,	%f16
	sdivx	%o0,	0x090E,	%g3
	movneg	%icc,	%g5,	%i4
	fmovda	%icc,	%f14,	%f13
	edge16l	%l6,	%l3,	%g4
	and	%l1,	0x082A,	%l5
	movne	%icc,	%g2,	%i7
	fsrc2	%f8,	%f2
	movrgez	%g6,	%l0,	%o7
	save %g1, 0x0DB8, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i0,	%i5,	%g7
	udivcc	%i3,	0x1ADF,	%o2
	smulcc	%o1,	%o6,	%i1
	array32	%o3,	%o4,	%i2
	fmovscc	%icc,	%f11,	%f13
	edge16n	%o5,	%l2,	%l4
	movleu	%icc,	%g3,	%g5
	movrgez	%i4,	%o0,	%l6
	mulx	%l3,	%g4,	%l5
	andcc	%g2,	0x17EC,	%l1
	sra	%i7,	0x07,	%g6
	srlx	%l0,	0x0C,	%o7
	stw	%i6,	[%l7 + 0x6C]
	stx	%i0,	[%l7 + 0x70]
	edge16n	%g1,	%g7,	%i3
	srlx	%i5,	0x13,	%o1
	subc	%o6,	%o2,	%i1
	edge16l	%o3,	%i2,	%o4
	subccc	%o5,	%l2,	%g3
	edge16ln	%l4,	%i4,	%g5
	orcc	%o0,	0x1317,	%l6
	move	%xcc,	%g4,	%l5
	mova	%xcc,	%l3,	%l1
	ldsb	[%l7 + 0x5A],	%g2
	xor	%g6,	0x133C,	%l0
	mulscc	%o7,	%i7,	%i6
	array16	%g1,	%g7,	%i3
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	fxnor	%f6,	%f10,	%f12
	siam	0x5
	popc	0x0C5D,	%o6
	ldsh	[%l7 + 0x0A],	%o1
	movcs	%icc,	%i1,	%o2
	fmovrdlz	%i2,	%f16,	%f14
	edge8ln	%o4,	%o3,	%l2
	edge8ln	%o5,	%g3,	%i4
	ldd	[%l7 + 0x50],	%f14
	edge8ln	%l4,	%o0,	%l6
	array32	%g4,	%g5,	%l3
	fmul8ulx16	%f20,	%f2,	%f20
	movvs	%xcc,	%l5,	%l1
	movle	%icc,	%g6,	%l0
	fmuld8sux16	%f9,	%f0,	%f30
	fmovsgu	%icc,	%f16,	%f24
	xnor	%o7,	0x1724,	%i7
	nop
	set	0x30, %o4
	lduw	[%l7 + %o4],	%g2
	edge8	%i6,	%g7,	%g1
	fnot2	%f6,	%f12
	std	%f16,	[%l7 + 0x40]
	subccc	%i0,	%i5,	%i3
	fand	%f18,	%f16,	%f24
	array32	%o1,	%i1,	%o6
	mulx	%i2,	0x16C6,	%o2
	orncc	%o3,	0x0D59,	%l2
	movrgez	%o5,	%o4,	%g3
	move	%xcc,	%l4,	%o0
	smul	%i4,	%l6,	%g5
	sub	%l3,	0x15D4,	%l5
	andcc	%g4,	%l1,	%l0
	mulscc	%o7,	%g6,	%i7
	fmovsg	%xcc,	%f30,	%f22
	udivx	%g2,	0x0F91,	%i6
	fsrc1s	%f25,	%f17
	movvs	%xcc,	%g1,	%i0
	edge8ln	%g7,	%i3,	%i5
	xnor	%i1,	%o1,	%i2
	lduh	[%l7 + 0x54],	%o6
	srlx	%o3,	0x0D,	%o2
	pdist	%f18,	%f18,	%f16
	movcc	%xcc,	%l2,	%o4
	ldsb	[%l7 + 0x26],	%o5
	edge8	%g3,	%l4,	%o0
	restore %i4, 0x0C2D, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l3,	0x19D0,	%g5
	sll	%l5,	%g4,	%l0
	movn	%icc,	%l1,	%g6
	ldd	[%l7 + 0x10],	%f10
	stw	%o7,	[%l7 + 0x50]
	fnor	%f4,	%f18,	%f28
	fmul8x16al	%f15,	%f17,	%f24
	fmovsn	%icc,	%f7,	%f10
	alignaddrl	%i7,	%i6,	%g1
	fmovrslz	%g2,	%f13,	%f1
	alignaddr	%g7,	%i0,	%i5
	ldd	[%l7 + 0x58],	%f14
	mulx	%i3,	%o1,	%i2
	edge32l	%o6,	%o3,	%o2
	sir	0x0EF8
	andncc	%l2,	%i1,	%o5
	save %g3, %l4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o0,	%l6,	%l3
	array32	%i4,	%l5,	%g4
	addc	%l0,	%l1,	%g6
	fmovs	%f14,	%f29
	xnor	%g5,	0x08C2,	%o7
	srax	%i6,	0x1B,	%i7
	edge8ln	%g2,	%g7,	%i0
	andcc	%g1,	%i3,	%i5
	fornot1s	%f14,	%f9,	%f25
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%i2
	fpadd32s	%f27,	%f4,	%f0
	stx	%o1,	[%l7 + 0x18]
	movre	%o3,	%o6,	%o2
	mova	%xcc,	%l2,	%i1
	ldsb	[%l7 + 0x67],	%g3
	sllx	%o5,	0x0F,	%l4
	movneg	%xcc,	%o0,	%l6
	mulscc	%o4,	%i4,	%l5
	sth	%g4,	[%l7 + 0x30]
	sdivcc	%l0,	0x13C2,	%l3
	srax	%l1,	%g6,	%o7
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%i6
	movrne	%g5,	%g2,	%g7
	xorcc	%i0,	0x0928,	%g1
	fmul8x16al	%f11,	%f9,	%f20
	srax	%i3,	%i7,	%i5
	mulx	%o1,	%o3,	%o6
	orcc	%i2,	0x1D2D,	%o2
	sub	%i1,	%l2,	%o5
	edge8l	%g3,	%l4,	%l6
	edge8l	%o4,	%o0,	%l5
	fmul8x16au	%f5,	%f15,	%f18
	fmovscc	%icc,	%f16,	%f11
	fmovse	%xcc,	%f23,	%f30
	srlx	%i4,	0x09,	%g4
	fmovrdgz	%l3,	%f12,	%f26
	edge8l	%l1,	%g6,	%o7
	fmovda	%xcc,	%f20,	%f17
	movcc	%icc,	%i6,	%g5
	save %g2, 0x1BB7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f26,	%f7
	movrlz	%g7,	0x2DE,	%i0
	movre	%i3,	0x3FA,	%g1
	st	%f19,	[%l7 + 0x28]
	siam	0x6
	stx	%i7,	[%l7 + 0x58]
	andn	%o1,	0x1B89,	%o3
	fmovrdlez	%i5,	%f2,	%f14
	edge32	%i2,	%o2,	%o6
	array16	%l2,	%i1,	%o5
	fmovsa	%icc,	%f26,	%f2
	fmovsl	%xcc,	%f28,	%f31
	fmovscc	%icc,	%f31,	%f29
	fmovsn	%xcc,	%f27,	%f5
	xnor	%g3,	0x00F7,	%l6
	fxors	%f21,	%f18,	%f6
	lduh	[%l7 + 0x7C],	%o4
	smul	%l4,	%o0,	%i4
	xor	%g4,	0x12ED,	%l5
	fabss	%f10,	%f7
	fpsub16	%f16,	%f12,	%f8
	edge16	%l3,	%g6,	%o7
	sllx	%i6,	%g5,	%g2
	xorcc	%l0,	%l1,	%g7
	array32	%i0,	%i3,	%i7
	edge32l	%g1,	%o1,	%o3
	sdiv	%i2,	0x02E0,	%i5
	orncc	%o6,	0x0C14,	%o2
	fmovrslez	%l2,	%f2,	%f11
	edge8	%o5,	%i1,	%g3
	stx	%o4,	[%l7 + 0x70]
	umulcc	%l6,	0x0BAE,	%o0
	subccc	%l4,	0x157B,	%g4
	fnors	%f23,	%f0,	%f6
	movl	%icc,	%i4,	%l3
	addcc	%l5,	0x037F,	%o7
	movpos	%xcc,	%g6,	%g5
	subcc	%i6,	%g2,	%l0
	fornot2s	%f9,	%f9,	%f9
	ldsb	[%l7 + 0x3A],	%l1
	fpsub16s	%f0,	%f11,	%f1
	srlx	%i0,	0x10,	%i3
	orn	%i7,	0x0606,	%g1
	movle	%icc,	%g7,	%o3
	xor	%o1,	0x01E0,	%i5
	movn	%xcc,	%o6,	%i2
	umul	%o2,	%l2,	%i1
	fxnor	%f18,	%f4,	%f20
	edge16ln	%o5,	%g3,	%l6
	addc	%o0,	%o4,	%g4
	movrlez	%i4,	0x31C,	%l4
	edge8	%l3,	%o7,	%g6
	fpadd16	%f14,	%f4,	%f24
	udivcc	%g5,	0x1FA4,	%l5
	and	%i6,	%l0,	%l1
	movg	%icc,	%g2,	%i0
	srax	%i3,	%g1,	%g7
	xnorcc	%i7,	%o1,	%i5
	movle	%icc,	%o6,	%o3
	movgu	%icc,	%i2,	%o2
	edge8ln	%i1,	%o5,	%g3
	sll	%l6,	%o0,	%o4
	stw	%l2,	[%l7 + 0x28]
	fmovdle	%xcc,	%f11,	%f1
	movcs	%icc,	%g4,	%l4
	edge16l	%l3,	%o7,	%i4
	fpmerge	%f16,	%f3,	%f8
	addccc	%g6,	%g5,	%i6
	fcmpgt16	%f8,	%f28,	%l5
	srl	%l0,	%l1,	%g2
	mulx	%i3,	%i0,	%g1
	movpos	%icc,	%g7,	%o1
	lduh	[%l7 + 0x3A],	%i5
	ldsh	[%l7 + 0x64],	%o6
	fmovscs	%xcc,	%f16,	%f7
	ldub	[%l7 + 0x0A],	%i7
	ldsb	[%l7 + 0x6F],	%i2
	movn	%xcc,	%o2,	%o3
	ldsh	[%l7 + 0x4E],	%i1
	movcs	%icc,	%o5,	%l6
	array16	%o0,	%g3,	%o4
	fnand	%f18,	%f28,	%f22
	alignaddrl	%g4,	%l2,	%l3
	fnegs	%f29,	%f11
	fpsub32	%f24,	%f26,	%f2
	addccc	%l4,	0x16B2,	%o7
	fpadd32	%f26,	%f14,	%f4
	stb	%i4,	[%l7 + 0x1E]
	movl	%xcc,	%g5,	%i6
	srax	%g6,	0x11,	%l0
	andcc	%l5,	0x166A,	%l1
	sdivx	%g2,	0x0FC7,	%i0
	movn	%xcc,	%i3,	%g7
	sll	%g1,	0x0D,	%o1
	movge	%xcc,	%i5,	%i7
	movgu	%xcc,	%i2,	%o6
	move	%icc,	%o3,	%i1
	alignaddrl	%o5,	%l6,	%o0
	movvc	%xcc,	%o2,	%g3
	movge	%icc,	%o4,	%l2
	fpadd16	%f24,	%f22,	%f2
	and	%l3,	%g4,	%l4
	movcc	%icc,	%o7,	%i4
	movg	%xcc,	%g5,	%g6
	fmul8sux16	%f10,	%f16,	%f4
	ldx	[%l7 + 0x30],	%l0
	sir	0x0E4F
	alignaddr	%i6,	%l1,	%g2
	subcc	%i0,	0x0C35,	%i3
	sdivcc	%g7,	0x150F,	%l5
	ldub	[%l7 + 0x5F],	%g1
	orn	%i5,	0x1ED8,	%o1
	movvc	%icc,	%i7,	%i2
	sra	%o3,	0x1D,	%o6
	xnor	%i1,	%l6,	%o0
	sll	%o2,	0x11,	%o5
	stw	%g3,	[%l7 + 0x64]
	movn	%xcc,	%o4,	%l2
	andncc	%l3,	%g4,	%o7
	fpsub32	%f12,	%f2,	%f24
	subccc	%l4,	%g5,	%g6
	fnor	%f30,	%f6,	%f6
	addc	%i4,	0x190E,	%i6
	lduh	[%l7 + 0x2A],	%l1
	edge16n	%g2,	%i0,	%l0
	stb	%g7,	[%l7 + 0x67]
	mulscc	%l5,	0x1CBB,	%i3
	fmul8ulx16	%f16,	%f18,	%f8
	array16	%g1,	%o1,	%i7
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	fand	%f6,	%f2,	%f10
	fxor	%f0,	%f22,	%f8
	srax	%i1,	%l6,	%i5
	edge8	%o2,	%o5,	%g3
	stx	%o4,	[%l7 + 0x78]
	addcc	%l2,	%o0,	%g4
	alignaddr	%l3,	%o7,	%g5
	srlx	%l4,	0x03,	%g6
	mulx	%i6,	0x04B1,	%i4
	fxors	%f6,	%f15,	%f15
	mulx	%l1,	%g2,	%i0
	fcmpes	%fcc0,	%f14,	%f8
	xor	%g7,	0x19B4,	%l5
	movne	%xcc,	%i3,	%l0
	nop
	set	0x66, %i6
	lduh	[%l7 + %i6],	%g1
	edge32ln	%i7,	%i2,	%o3
	udivcc	%o1,	0x17F7,	%i1
	fandnot2	%f8,	%f8,	%f22
	srl	%o6,	0x1D,	%l6
	sll	%o2,	0x12,	%i5
	fornot2	%f8,	%f30,	%f26
	fmovsvc	%xcc,	%f18,	%f1
	fnand	%f18,	%f8,	%f14
	sll	%o5,	0x04,	%o4
	sub	%g3,	0x0851,	%o0
	and	%g4,	%l3,	%l2
	ldd	[%l7 + 0x20],	%g4
	addccc	%o7,	%g6,	%i6
	movn	%icc,	%l4,	%i4
	edge16ln	%l1,	%g2,	%i0
	sdivcc	%l5,	0x0267,	%i3
	subc	%g7,	%l0,	%g1
	ldsb	[%l7 + 0x0D],	%i7
	stb	%i2,	[%l7 + 0x74]
	fmovsvs	%xcc,	%f6,	%f21
	save %o1, %i1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l6,	[%l7 + 0x24]
	lduw	[%l7 + 0x40],	%o2
	fors	%f6,	%f21,	%f26
	edge8ln	%o6,	%i5,	%o5
	fcmped	%fcc1,	%f6,	%f18
	move	%icc,	%o4,	%o0
	fmul8sux16	%f30,	%f4,	%f26
	movne	%icc,	%g4,	%l3
	movrgz	%g3,	0x3AE,	%l2
	orcc	%o7,	0x079A,	%g6
	movrgez	%g5,	%i6,	%i4
	save %l1, 0x048E, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i0,	%l5
	ldx	[%l7 + 0x40],	%i3
	edge32l	%g7,	%g2,	%g1
	subc	%i7,	0x0095,	%l0
	addccc	%i2,	%o1,	%i1
	ldsw	[%l7 + 0x60],	%l6
	movrlez	%o2,	%o6,	%i5
	fmovdvc	%xcc,	%f20,	%f18
	movrgz	%o3,	0x061,	%o5
	sdivcc	%o4,	0x0545,	%g4
	fmovsne	%xcc,	%f11,	%f1
	movrlez	%o0,	0x19E,	%l3
	edge32n	%g3,	%o7,	%g6
	fandnot1	%f4,	%f16,	%f6
	udiv	%l2,	0x0CCF,	%g5
	fsrc1s	%f6,	%f30
	lduw	[%l7 + 0x14],	%i4
	fnor	%f4,	%f6,	%f2
	edge32	%i6,	%l4,	%i0
	lduh	[%l7 + 0x0E],	%l1
	sra	%l5,	%i3,	%g7
	edge16n	%g2,	%g1,	%l0
	fmul8x16al	%f11,	%f7,	%f24
	mulx	%i7,	%o1,	%i1
	orn	%l6,	%o2,	%i2
	stw	%o6,	[%l7 + 0x30]
	fcmpne32	%f18,	%f24,	%i5
	fmovdleu	%icc,	%f8,	%f31
	addccc	%o3,	0x0807,	%o5
	edge16	%o4,	%g4,	%l3
	add	%g3,	%o7,	%g6
	umul	%o0,	%l2,	%g5
	fsrc2	%f12,	%f30
	edge32	%i6,	%l4,	%i0
	add	%l1,	%i4,	%l5
	fandnot2s	%f31,	%f0,	%f14
	addc	%g7,	0x0187,	%g2
	sra	%g1,	%l0,	%i3
	fnot1s	%f4,	%f9
	sir	0x1164
	smul	%i7,	%i1,	%l6
	add	%o1,	%i2,	%o2
	sethi	0x0025,	%i5
	udiv	%o3,	0x1F95,	%o5
	movl	%xcc,	%o4,	%g4
	subcc	%l3,	%o6,	%o7
	fmovrsne	%g6,	%f0,	%f7
	movgu	%xcc,	%g3,	%o0
	movrlz	%l2,	%g5,	%l4
	fpsub16s	%f0,	%f7,	%f19
	alignaddrl	%i0,	%i6,	%l1
	move	%icc,	%i4,	%g7
	mova	%icc,	%l5,	%g1
	ld	[%l7 + 0x5C],	%f21
	smul	%g2,	%l0,	%i3
	edge16n	%i7,	%i1,	%l6
	edge8l	%i2,	%o1,	%i5
	addccc	%o2,	0x1411,	%o5
	fcmped	%fcc3,	%f2,	%f0
	smulcc	%o4,	0x0291,	%g4
	movvc	%xcc,	%o3,	%l3
	fmovdg	%xcc,	%f11,	%f24
	fpsub16s	%f14,	%f17,	%f19
	subccc	%o7,	%o6,	%g6
	movcs	%icc,	%o0,	%l2
	orcc	%g5,	0x1CD1,	%l4
	edge32	%g3,	%i0,	%i6
	movl	%xcc,	%i4,	%g7
	add	%l5,	%g1,	%l1
	sdiv	%g2,	0x0123,	%i3
	ldsb	[%l7 + 0x42],	%l0
	add	%i7,	%l6,	%i2
	movrgez	%o1,	0x319,	%i5
	movcs	%xcc,	%o2,	%i1
	addcc	%o5,	%g4,	%o3
	stw	%o4,	[%l7 + 0x50]
	fmovrslz	%l3,	%f23,	%f30
	for	%f16,	%f2,	%f10
	fmovdcc	%icc,	%f31,	%f25
	sethi	0x0979,	%o6
	array16	%g6,	%o7,	%l2
	stw	%g5,	[%l7 + 0x1C]
	udivx	%l4,	0x1239,	%g3
	add	%o0,	%i6,	%i4
	edge16ln	%i0,	%g7,	%l5
	pdist	%f24,	%f24,	%f30
	sir	0x082F
	smul	%l1,	0x1B2F,	%g2
	movle	%icc,	%g1,	%i3
	fexpand	%f3,	%f16
	move	%icc,	%i7,	%l6
	fmovsge	%icc,	%f14,	%f4
	fnot2	%f20,	%f26
	st	%f22,	[%l7 + 0x08]
	fandnot2	%f18,	%f8,	%f28
	orn	%i2,	%l0,	%o1
	udivcc	%i5,	0x1676,	%o2
	sdiv	%o5,	0x0380,	%i1
	edge32ln	%g4,	%o3,	%l3
	move	%icc,	%o4,	%o6
	udivcc	%o7,	0x1A14,	%l2
	sll	%g5,	0x08,	%l4
	movg	%xcc,	%g6,	%g3
	or	%o0,	0x1312,	%i6
	sethi	0x04FF,	%i0
	edge16l	%i4,	%l5,	%g7
	edge8l	%l1,	%g2,	%g1
	xor	%i3,	0x1E09,	%i7
	movvs	%xcc,	%l6,	%l0
	or	%o1,	%i5,	%i2
	popc	0x1941,	%o5
	fand	%f30,	%f20,	%f24
	fmovse	%xcc,	%f23,	%f22
	fmovdn	%icc,	%f18,	%f7
	movrne	%o2,	%g4,	%o3
	udivcc	%i1,	0x05C5,	%o4
	xnorcc	%o6,	%o7,	%l2
	array16	%g5,	%l3,	%g6
	ldd	[%l7 + 0x28],	%f22
	fmovdge	%xcc,	%f12,	%f13
	ldd	[%l7 + 0x50],	%f26
	st	%f28,	[%l7 + 0x2C]
	edge32n	%l4,	%g3,	%i6
	addc	%i0,	0x1830,	%i4
	mulx	%l5,	%o0,	%g7
	movrlez	%l1,	%g1,	%g2
	movrgez	%i3,	%l6,	%l0
	mova	%xcc,	%i7,	%o1
	fmovscc	%xcc,	%f11,	%f16
	fmovdg	%xcc,	%f15,	%f12
	edge8ln	%i5,	%i2,	%o5
	sll	%g4,	0x03,	%o3
	fcmple16	%f22,	%f6,	%i1
	sethi	0x0C91,	%o2
	mova	%xcc,	%o4,	%o6
	orcc	%o7,	0x16C9,	%l2
	sethi	0x1DA9,	%g5
	xor	%l3,	0x01DA,	%g6
	st	%f17,	[%l7 + 0x0C]
	addc	%g3,	%l4,	%i0
	smul	%i6,	%l5,	%i4
	fabsd	%f20,	%f24
	lduh	[%l7 + 0x64],	%g7
	edge32ln	%o0,	%l1,	%g1
	udiv	%i3,	0x0776,	%g2
	smul	%l0,	%l6,	%o1
	restore %i5, %i2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g4,	0x100F,	%o3
	movle	%xcc,	%i7,	%o2
	fmovsge	%icc,	%f21,	%f29
	st	%f21,	[%l7 + 0x38]
	movle	%xcc,	%i1,	%o6
	fpsub32	%f28,	%f24,	%f12
	edge16ln	%o7,	%o4,	%g5
	srl	%l2,	0x18,	%g6
	movrlz	%g3,	%l4,	%i0
	stx	%i6,	[%l7 + 0x68]
	or	%l5,	%i4,	%l3
	sir	0x17AC
	save %g7, 0x0271, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g1,	0x1836,	%i3
	movrgez	%o0,	%l0,	%l6
	edge8	%g2,	%i5,	%o1
	add	%i2,	%o5,	%o3
	sra	%i7,	0x1D,	%o2
	ldd	[%l7 + 0x40],	%f10
	movrgz	%g4,	0x1E5,	%o6
	srax	%o7,	0x14,	%o4
	movl	%icc,	%g5,	%i1
	movrlez	%l2,	0x3F5,	%g3
	movcc	%icc,	%l4,	%g6
	mova	%xcc,	%i0,	%l5
	fand	%f14,	%f30,	%f8
	andcc	%i4,	%i6,	%g7
	sethi	0x16BC,	%l3
	addc	%g1,	%i3,	%o0
	sir	0x15C1
	fandnot2	%f16,	%f12,	%f20
	edge32n	%l0,	%l1,	%g2
	move	%xcc,	%l6,	%i5
	fxnors	%f5,	%f2,	%f25
	movrlz	%i2,	0x0CE,	%o5
	fmovsne	%icc,	%f14,	%f19
	mulscc	%o1,	0x1877,	%i7
	srlx	%o3,	%o2,	%g4
	movneg	%icc,	%o7,	%o4
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	udiv	%l2,	0x1C96,	%g3
	srl	%l4,	%g6,	%i0
	edge32l	%o6,	%l5,	%i6
	edge16l	%i4,	%l3,	%g7
	edge32l	%i3,	%g1,	%o0
	edge32ln	%l0,	%l1,	%g2
	fmul8x16al	%f31,	%f23,	%f6
	sra	%i5,	0x0D,	%l6
	andn	%o5,	0x04AB,	%i2
	move	%icc,	%o1,	%i7
	movrlez	%o2,	%g4,	%o3
	ldsh	[%l7 + 0x62],	%o4
	xorcc	%o7,	0x0E8D,	%i1
	pdist	%f30,	%f30,	%f24
	movrgz	%g5,	%l2,	%g3
	fmovrse	%l4,	%f17,	%f10
	sub	%i0,	0x0904,	%o6
	mulx	%l5,	%i6,	%i4
	pdist	%f22,	%f12,	%f0
	mulscc	%g6,	%l3,	%i3
	subcc	%g7,	0x13A0,	%g1
	fmovdl	%icc,	%f25,	%f0
	subccc	%o0,	0x19E5,	%l0
	array32	%l1,	%g2,	%i5
	fmovspos	%icc,	%f27,	%f29
	subc	%l6,	%o5,	%i2
	movvs	%icc,	%o1,	%i7
	fmovda	%icc,	%f10,	%f25
	andcc	%o2,	%o3,	%o4
	nop
	set	0x70, %g5
	ldx	[%l7 + %g5],	%o7
	movleu	%xcc,	%i1,	%g5
	or	%l2,	0x0ADB,	%g4
	movle	%icc,	%l4,	%i0
	lduh	[%l7 + 0x38],	%o6
	fmovsvs	%xcc,	%f28,	%f15
	edge8l	%g3,	%l5,	%i6
	fmovda	%xcc,	%f1,	%f19
	orncc	%i4,	0x0C79,	%l3
	xnor	%i3,	%g7,	%g6
	orcc	%o0,	0x1BB7,	%l0
	fzeros	%f17
	smul	%g1,	0x1AC2,	%l1
	fmovrde	%g2,	%f16,	%f18
	for	%f14,	%f16,	%f28
	orncc	%i5,	0x049C,	%l6
	fmovd	%f14,	%f28
	edge32	%o5,	%o1,	%i7
	stw	%i2,	[%l7 + 0x6C]
	st	%f14,	[%l7 + 0x2C]
	or	%o3,	%o4,	%o2
	alignaddr	%i1,	%g5,	%o7
	sethi	0x1F67,	%g4
	fzero	%f24
	edge32l	%l2,	%i0,	%l4
	ldd	[%l7 + 0x10],	%o6
	fmovdpos	%xcc,	%f6,	%f25
	move	%icc,	%g3,	%l5
	sdiv	%i4,	0x04D9,	%l3
	fzeros	%f20
	subccc	%i6,	0x0D60,	%g7
	xnorcc	%g6,	%i3,	%l0
	fcmpeq32	%f10,	%f8,	%o0
	fzero	%f26
	fmovsgu	%xcc,	%f6,	%f2
	mulscc	%g1,	%l1,	%i5
	movge	%icc,	%l6,	%g2
	subccc	%o5,	0x0F5F,	%i7
	fmuld8ulx16	%f4,	%f2,	%f2
	ld	[%l7 + 0x54],	%f12
	fmovdleu	%icc,	%f0,	%f3
	ldsw	[%l7 + 0x7C],	%o1
	sethi	0x04C1,	%i2
	st	%f23,	[%l7 + 0x70]
	xorcc	%o4,	0x16D2,	%o2
	smulcc	%i1,	%o3,	%g5
	movrlz	%g4,	%l2,	%i0
	srl	%o7,	%l4,	%g3
	fandnot1	%f18,	%f10,	%f18
	subccc	%l5,	%o6,	%l3
	fnegs	%f21,	%f18
	movge	%xcc,	%i6,	%i4
	fmovrdlz	%g6,	%f26,	%f10
	fmovrslez	%g7,	%f28,	%f17
	movleu	%icc,	%i3,	%o0
	srlx	%l0,	0x0B,	%l1
	sir	0x03B2
	movge	%xcc,	%g1,	%i5
	xnorcc	%l6,	%g2,	%o5
	addc	%i7,	%i2,	%o1
	edge16l	%o2,	%i1,	%o3
	edge32	%g5,	%o4,	%l2
	fmovscc	%icc,	%f31,	%f2
	xorcc	%g4,	0x0F5A,	%o7
	movrgez	%l4,	%g3,	%l5
	ldub	[%l7 + 0x47],	%o6
	st	%f31,	[%l7 + 0x40]
	edge8n	%l3,	%i0,	%i6
	fcmple16	%f12,	%f18,	%i4
	xnor	%g6,	0x1D91,	%g7
	orncc	%i3,	0x16B4,	%o0
	edge8ln	%l0,	%g1,	%l1
	sll	%i5,	0x05,	%l6
	movn	%xcc,	%o5,	%g2
	edge16n	%i7,	%i2,	%o2
	stx	%o1,	[%l7 + 0x50]
	fmovrse	%i1,	%f16,	%f4
	movge	%xcc,	%g5,	%o4
	edge8n	%o3,	%g4,	%o7
	fpadd32s	%f28,	%f29,	%f22
	sub	%l2,	%g3,	%l5
	udiv	%l4,	0x1D2A,	%l3
	and	%i0,	%i6,	%i4
	lduh	[%l7 + 0x0E],	%o6
	sir	0x1AEF
	sub	%g7,	%g6,	%o0
	fsrc1	%f14,	%f10
	movge	%xcc,	%i3,	%l0
	edge16	%g1,	%l1,	%l6
	nop
	set	0x12, %o1
	ldsh	[%l7 + %o1],	%o5
	srax	%g2,	%i5,	%i2
	ldx	[%l7 + 0x60],	%o2
	sra	%i7,	0x1A,	%i1
	ldd	[%l7 + 0x48],	%o0
	sdivcc	%g5,	0x0BFA,	%o4
	fcmps	%fcc2,	%f28,	%f3
	fmovrslez	%o3,	%f14,	%f7
	andncc	%o7,	%g4,	%l2
	fmovdgu	%icc,	%f12,	%f30
	fpmerge	%f14,	%f6,	%f30
	edge32	%g3,	%l5,	%l3
	movrlz	%l4,	%i6,	%i0
	restore %o6, 0x1C98, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g7,	%o0,	%g6
	sir	0x1039
	fcmpne16	%f20,	%f4,	%i3
	movrlz	%l0,	%l1,	%g1
	edge8	%l6,	%g2,	%i5
	move	%icc,	%i2,	%o5
	movcc	%xcc,	%i7,	%o2
	srax	%i1,	0x02,	%o1
	fexpand	%f21,	%f28
	ldd	[%l7 + 0x48],	%f2
	fone	%f16
	xnorcc	%g5,	%o4,	%o3
	smulcc	%o7,	0x05F4,	%l2
	movg	%xcc,	%g3,	%g4
	stw	%l3,	[%l7 + 0x08]
	ldsb	[%l7 + 0x4E],	%l5
	orn	%i6,	%i0,	%l4
	movre	%o6,	%g7,	%o0
	movn	%icc,	%i4,	%i3
	movrlez	%g6,	0x284,	%l1
	st	%f11,	[%l7 + 0x44]
	orncc	%l0,	%l6,	%g2
	srl	%g1,	0x1D,	%i2
	fnot1s	%f12,	%f22
	fcmpeq16	%f16,	%f10,	%i5
	movneg	%xcc,	%o5,	%i7
	lduw	[%l7 + 0x20],	%o2
	add	%o1,	0x1320,	%i1
	fpadd16	%f14,	%f4,	%f24
	alignaddrl	%g5,	%o4,	%o3
	fmul8ulx16	%f4,	%f2,	%f20
	fmul8ulx16	%f26,	%f24,	%f14
	smulcc	%l2,	0x1977,	%g3
	fornot1s	%f30,	%f6,	%f19
	sdivx	%o7,	0x02A1,	%l3
	movcs	%icc,	%g4,	%l5
	nop
	set	0x30, %g4
	std	%f8,	[%l7 + %g4]
	edge32ln	%i0,	%i6,	%l4
	sethi	0x1571,	%g7
	movrlz	%o6,	%o0,	%i4
	or	%g6,	%l1,	%l0
	edge32l	%i3,	%l6,	%g1
	subc	%g2,	0x15A3,	%i5
	ldsb	[%l7 + 0x69],	%i2
	movrlez	%i7,	%o5,	%o2
	fmovsgu	%xcc,	%f14,	%f13
	fmovsneg	%icc,	%f6,	%f14
	sdivcc	%i1,	0x1A84,	%o1
	sra	%o4,	%g5,	%l2
	ld	[%l7 + 0x30],	%f31
	smul	%o3,	0x1882,	%o7
	edge8n	%g3,	%g4,	%l3
	fmovdle	%xcc,	%f13,	%f30
	fmovspos	%xcc,	%f22,	%f11
	fmovdle	%icc,	%f10,	%f5
	ld	[%l7 + 0x08],	%f17
	addcc	%l5,	%i6,	%l4
	move	%icc,	%i0,	%o6
	sra	%g7,	0x06,	%o0
	udiv	%i4,	0x0F46,	%g6
	siam	0x6
	fmovrdgez	%l1,	%f24,	%f8
	movvs	%icc,	%i3,	%l6
	mova	%icc,	%l0,	%g2
	lduw	[%l7 + 0x1C],	%g1
	or	%i5,	0x0E03,	%i7
	fmovda	%xcc,	%f18,	%f4
	move	%icc,	%o5,	%o2
	smulcc	%i2,	0x1086,	%i1
	sdivx	%o1,	0x0591,	%o4
	lduw	[%l7 + 0x40],	%g5
	sdivx	%l2,	0x1874,	%o7
	edge8n	%o3,	%g3,	%g4
	edge32ln	%l5,	%l3,	%i6
	siam	0x0
	movn	%icc,	%i0,	%l4
	orcc	%o6,	0x1EEE,	%o0
	edge16ln	%g7,	%i4,	%g6
	movg	%xcc,	%i3,	%l6
	fmovdleu	%xcc,	%f5,	%f31
	movleu	%xcc,	%l0,	%l1
	movn	%icc,	%g1,	%g2
	movrne	%i5,	%o5,	%i7
	sll	%i2,	%i1,	%o1
	edge16ln	%o4,	%g5,	%l2
	fpadd16s	%f11,	%f9,	%f6
	fnands	%f9,	%f0,	%f25
	movcs	%icc,	%o7,	%o3
	ldsw	[%l7 + 0x7C],	%g3
	ldd	[%l7 + 0x18],	%f8
	fzeros	%f9
	fnegs	%f3,	%f31
	sllx	%g4,	%o2,	%l5
	edge16	%l3,	%i0,	%i6
	sth	%l4,	[%l7 + 0x40]
	ld	[%l7 + 0x28],	%f1
	movrgez	%o6,	0x3AE,	%o0
	udivx	%g7,	0x11F4,	%i4
	orcc	%i3,	%l6,	%g6
	fpsub16s	%f23,	%f17,	%f13
	lduw	[%l7 + 0x30],	%l1
	fmovsg	%xcc,	%f17,	%f5
	movn	%icc,	%g1,	%g2
	mulscc	%i5,	%l0,	%i7
	fxnors	%f13,	%f3,	%f20
	srl	%i2,	%i1,	%o5
	ldsh	[%l7 + 0x36],	%o1
	orncc	%o4,	%g5,	%l2
	smul	%o3,	%o7,	%g3
	edge32	%o2,	%g4,	%l5
	sra	%i0,	%l3,	%l4
	lduw	[%l7 + 0x30],	%o6
	udiv	%i6,	0x0B67,	%g7
	fmuld8sux16	%f6,	%f5,	%f28
	fabsd	%f20,	%f28
	move	%icc,	%o0,	%i3
	alignaddr	%i4,	%l6,	%g6
	movgu	%icc,	%l1,	%g1
	edge8l	%i5,	%l0,	%i7
	sdivcc	%i2,	0x083A,	%i1
	alignaddr	%g2,	%o5,	%o1
	and	%g5,	%l2,	%o3
	edge32l	%o4,	%g3,	%o7
	andncc	%o2,	%g4,	%l5
	addccc	%l3,	0x1BFE,	%l4
	sll	%o6,	0x15,	%i0
	movrgez	%i6,	0x2A3,	%g7
	andn	%i3,	%o0,	%l6
	edge8	%g6,	%i4,	%l1
	fands	%f0,	%f25,	%f9
	andcc	%g1,	%l0,	%i7
	sllx	%i2,	%i1,	%g2
	orncc	%o5,	0x1C3E,	%o1
	fmovdneg	%icc,	%f12,	%f23
	sdiv	%g5,	0x0B49,	%i5
	save %l2, 0x0EB0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f26,	%f27,	%f25
	srax	%o3,	%o7,	%o2
	addcc	%g3,	%g4,	%l5
	movne	%xcc,	%l4,	%l3
	movvc	%icc,	%i0,	%i6
	nop
	set	0x50, %l0
	ldd	[%l7 + %l0],	%f10
	movre	%o6,	0x110,	%i3
	fmovdvc	%icc,	%f14,	%f13
	fmovsn	%xcc,	%f24,	%f0
	edge16ln	%g7,	%l6,	%o0
	nop
	set	0x54, %g1
	lduh	[%l7 + %g1],	%i4
	edge16n	%g6,	%g1,	%l0
	nop
	set	0x70, %l2
	lduw	[%l7 + %l2],	%i7
	xnorcc	%l1,	0x1A38,	%i2
	subccc	%g2,	%i1,	%o1
	movvs	%xcc,	%o5,	%g5
	umulcc	%l2,	%o4,	%i5
	popc	0x0C57,	%o3
	movrlz	%o2,	0x263,	%o7
	fexpand	%f18,	%f4
	fpack16	%f18,	%f19
	movvs	%icc,	%g4,	%l5
	sra	%g3,	%l3,	%l4
	srlx	%i6,	%o6,	%i0
	popc	%g7,	%i3
	fcmpd	%fcc0,	%f6,	%f12
	fmovdge	%icc,	%f19,	%f1
	and	%l6,	%i4,	%o0
	stx	%g6,	[%l7 + 0x38]
	array8	%l0,	%i7,	%g1
	nop
	set	0x58, %l5
	ldd	[%l7 + %l5],	%i2
	movge	%xcc,	%g2,	%i1
	sub	%o1,	0x1A8C,	%l1
	subccc	%g5,	0x106B,	%l2
	std	%f24,	[%l7 + 0x60]
	movl	%xcc,	%o5,	%i5
	fcmpeq32	%f0,	%f12,	%o4
	fmovdleu	%xcc,	%f19,	%f28
	fpmerge	%f19,	%f10,	%f14
	fpadd32	%f2,	%f8,	%f28
	save %o3, %o2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l5,	%o7,	%g3
	ldub	[%l7 + 0x31],	%l3
	edge16n	%l4,	%o6,	%i6
	andn	%g7,	0x1549,	%i3
	sra	%l6,	0x12,	%i0
	fsrc1s	%f3,	%f29
	edge32	%i4,	%o0,	%l0
	fpadd16s	%f29,	%f20,	%f0
	edge32n	%i7,	%g1,	%g6
	fmovrde	%g2,	%f30,	%f8
	edge32ln	%i1,	%i2,	%o1
	fornot2s	%f5,	%f20,	%f6
	movrlz	%l1,	%l2,	%o5
	movneg	%icc,	%g5,	%o4
	fpsub32s	%f30,	%f1,	%f11
	fmovrsne	%i5,	%f6,	%f20
	sdivcc	%o3,	0x0586,	%o2
	stw	%g4,	[%l7 + 0x1C]
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	edge16ln	%l4,	%o6,	%i6
	fmovdcs	%xcc,	%f17,	%f0
	orcc	%g7,	0x0B3B,	%l5
	ldx	[%l7 + 0x58],	%i3
	fcmpd	%fcc0,	%f18,	%f30
	or	%l6,	0x1F82,	%i4
	fmul8x16al	%f2,	%f31,	%f30
	move	%icc,	%o0,	%l0
	sllx	%i7,	%g1,	%i0
	ldsb	[%l7 + 0x37],	%g2
	fnot2	%f2,	%f0
	sdivx	%g6,	0x0BDF,	%i2
	fcmple16	%f18,	%f22,	%o1
	add	%i1,	0x01B4,	%l2
	st	%f22,	[%l7 + 0x40]
	edge8	%l1,	%g5,	%o5
	subccc	%o4,	%i5,	%o2
	alignaddrl	%o3,	%o7,	%g4
	fmovrslz	%l3,	%f1,	%f9
	fpackfix	%f14,	%f10
	std	%f20,	[%l7 + 0x58]
	edge32l	%g3,	%l4,	%o6
	st	%f18,	[%l7 + 0x20]
	sdivx	%i6,	0x133F,	%g7
	fsrc2	%f26,	%f6
	movl	%xcc,	%i3,	%l5
	fmovrse	%i4,	%f13,	%f8
	ld	[%l7 + 0x08],	%f12
	ldsw	[%l7 + 0x20],	%l6
	movneg	%xcc,	%l0,	%i7
	orncc	%o0,	0x0E6A,	%g1
	fmovrsgez	%g2,	%f18,	%f13
	fcmpne32	%f8,	%f6,	%g6
	fornot1s	%f17,	%f19,	%f19
	ldsb	[%l7 + 0x5D],	%i0
	movn	%icc,	%o1,	%i1
	movrlz	%i2,	%l1,	%g5
	move	%xcc,	%o5,	%l2
	fone	%f2
	andn	%o4,	%o2,	%o3
	lduw	[%l7 + 0x1C],	%i5
	ldub	[%l7 + 0x17],	%g4
	restore %o7, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%l3,	%i6
	edge8l	%o6,	%i3,	%g7
	sdivx	%i4,	0x1075,	%l5
	smul	%l0,	0x17F4,	%i7
	movre	%l6,	%g1,	%o0
	ldd	[%l7 + 0x30],	%f30
	mova	%icc,	%g2,	%g6
	ldsw	[%l7 + 0x0C],	%i0
	movrlez	%o1,	%i1,	%i2
	movgu	%xcc,	%g5,	%l1
	movle	%icc,	%o5,	%l2
	fandnot1	%f6,	%f4,	%f14
	nop
	set	0x4E, %l3
	stb	%o4,	[%l7 + %l3]
	for	%f24,	%f18,	%f16
	movvc	%icc,	%o3,	%o2
	movpos	%icc,	%g4,	%i5
	save %o7, 0x00BE, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g3,	0x0324,	%i6
	edge16l	%o6,	%i3,	%l3
	movl	%xcc,	%g7,	%l5
	addcc	%l0,	0x19FD,	%i7
	sdivx	%i4,	0x0219,	%l6
	edge32	%g1,	%o0,	%g6
	movneg	%xcc,	%i0,	%o1
	fmovdneg	%icc,	%f19,	%f31
	movrlz	%g2,	%i2,	%i1
	sra	%g5,	0x00,	%o5
	andcc	%l2,	0x116A,	%o4
	fmovrde	%l1,	%f28,	%f18
	movre	%o3,	%o2,	%g4
	lduh	[%l7 + 0x46],	%i5
	subcc	%o7,	%g3,	%l4
	xorcc	%i6,	0x0F04,	%i3
	movg	%icc,	%l3,	%o6
	andcc	%g7,	0x1A86,	%l5
	ldub	[%l7 + 0x5B],	%i7
	srlx	%i4,	%l6,	%l0
	sdiv	%o0,	0x1A81,	%g6
	fmovsneg	%xcc,	%f29,	%f14
	smulcc	%g1,	%i0,	%g2
	sethi	0x0F4B,	%o1
	fnot1s	%f18,	%f2
	fcmpne32	%f26,	%f4,	%i2
	fand	%f24,	%f8,	%f0
	fmovdcc	%icc,	%f9,	%f18
	smul	%i1,	%o5,	%l2
	srl	%o4,	%l1,	%o3
	lduh	[%l7 + 0x16],	%o2
	movle	%xcc,	%g5,	%g4
	alignaddrl	%i5,	%g3,	%o7
	srlx	%i6,	0x07,	%l4
	sdiv	%l3,	0x1E8C,	%i3
	edge32n	%g7,	%o6,	%l5
	srax	%i4,	%i7,	%l6
	udivx	%l0,	0x0C41,	%g6
	movcc	%xcc,	%g1,	%i0
	movpos	%icc,	%g2,	%o1
	edge32ln	%i2,	%i1,	%o0
	st	%f8,	[%l7 + 0x18]
	array32	%l2,	%o4,	%o5
	udivx	%l1,	0x18D8,	%o2
	ldub	[%l7 + 0x65],	%g5
	sdivx	%g4,	0x1D26,	%o3
	movge	%xcc,	%i5,	%g3
	fnands	%f24,	%f18,	%f21
	sdiv	%o7,	0x06DB,	%i6
	orncc	%l3,	%i3,	%l4
	alignaddr	%o6,	%l5,	%i4
	stx	%g7,	[%l7 + 0x28]
	fmul8ulx16	%f30,	%f8,	%f14
	fcmpgt16	%f24,	%f26,	%i7
	orcc	%l6,	%l0,	%g1
	edge16ln	%g6,	%g2,	%o1
	fmul8sux16	%f12,	%f26,	%f8
	ldd	[%l7 + 0x78],	%i2
	fxor	%f2,	%f16,	%f2
	stw	%i1,	[%l7 + 0x54]
	stx	%i0,	[%l7 + 0x18]
	sra	%o0,	0x0F,	%o4
	srl	%l2,	%l1,	%o5
	orn	%g5,	0x1960,	%g4
	fsrc1s	%f6,	%f18
	orn	%o3,	0x10AE,	%o2
	ldub	[%l7 + 0x3F],	%g3
	fpack32	%f22,	%f10,	%f14
	sdivcc	%i5,	0x005F,	%i6
	fmovdneg	%icc,	%f27,	%f16
	edge32n	%o7,	%l3,	%i3
	edge16	%l4,	%l5,	%i4
	sra	%g7,	%o6,	%l6
	edge8n	%l0,	%i7,	%g6
	sir	0x166A
	movrgez	%g1,	%o1,	%g2
	movn	%icc,	%i2,	%i1
	sir	0x1772
	movcs	%xcc,	%i0,	%o0
	movvc	%icc,	%l2,	%l1
	and	%o5,	%g5,	%g4
	srax	%o4,	%o2,	%o3
	orcc	%g3,	%i6,	%i5
	xnor	%l3,	0x098B,	%i3
	movne	%xcc,	%o7,	%l4
	movle	%xcc,	%l5,	%i4
	udivx	%o6,	0x1A0C,	%g7
	sll	%l6,	0x0C,	%i7
	umulcc	%g6,	0x0A50,	%l0
	movcs	%xcc,	%g1,	%o1
	srlx	%g2,	0x0D,	%i1
	fsrc1	%f0,	%f24
	edge8l	%i2,	%i0,	%l2
	array8	%l1,	%o0,	%g5
	movneg	%xcc,	%o5,	%o4
	movcc	%icc,	%o2,	%g4
	std	%f22,	[%l7 + 0x30]
	sethi	0x04B0,	%o3
	sll	%i6,	0x12,	%g3
	subc	%i5,	%l3,	%o7
	ldsw	[%l7 + 0x5C],	%i3
	fmovdg	%xcc,	%f9,	%f13
	fmovdpos	%icc,	%f23,	%f28
	fmovsneg	%icc,	%f29,	%f0
	fnegs	%f9,	%f20
	fcmpne32	%f6,	%f20,	%l4
	st	%f17,	[%l7 + 0x2C]
	subc	%i4,	%o6,	%g7
	fmovdneg	%icc,	%f1,	%f14
	sth	%l5,	[%l7 + 0x2C]
	fmul8sux16	%f22,	%f18,	%f2
	lduw	[%l7 + 0x1C],	%l6
	fmovsleu	%icc,	%f20,	%f22
	ldub	[%l7 + 0x2D],	%g6
	xnor	%i7,	0x1887,	%l0
	sir	0x0796
	orncc	%g1,	0x1066,	%g2
	ldsb	[%l7 + 0x54],	%i1
	sth	%o1,	[%l7 + 0x0E]
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	movcc	%icc,	%i0,	%o0
	add	%o5,	0x1AC2,	%g5
	movg	%xcc,	%o2,	%o4
	sdiv	%o3,	0x17B2,	%g4
	xnorcc	%i6,	%g3,	%i5
	xorcc	%l3,	%o7,	%l4
	fmovrsgez	%i3,	%f1,	%f12
	addcc	%o6,	0x0C06,	%i4
	sll	%l5,	%l6,	%g7
	andn	%i7,	0x122C,	%l0
	fmovdgu	%icc,	%f31,	%f21
	sll	%g1,	%g2,	%g6
	fmovdvs	%xcc,	%f9,	%f13
	fnot1s	%f23,	%f12
	subcc	%o1,	%i2,	%i1
	ld	[%l7 + 0x1C],	%f22
	addc	%l2,	%l1,	%o0
	movge	%xcc,	%o5,	%g5
	edge8l	%o2,	%i0,	%o4
	st	%f21,	[%l7 + 0x70]
	ldsh	[%l7 + 0x14],	%o3
	popc	%i6,	%g4
	fcmple32	%f18,	%f4,	%i5
	orcc	%g3,	%o7,	%l3
	smulcc	%l4,	0x1DAD,	%i3
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%i4
	orncc	%l5,	%l6,	%g7
	fsrc1	%f2,	%f28
	subc	%o6,	%i7,	%l0
	edge32ln	%g2,	%g6,	%g1
	sir	0x1A14
	movrlz	%o1,	0x115,	%i2
	or	%l2,	%l1,	%o0
	fnot1	%f4,	%f10
	alignaddrl	%o5,	%i1,	%g5
	subc	%o2,	0x1F37,	%o4
	sllx	%i0,	%i6,	%g4
	edge8l	%o3,	%i5,	%o7
	ldx	[%l7 + 0x78],	%l3
	edge32l	%l4,	%i3,	%i4
	fcmple32	%f20,	%f26,	%g3
	fmovsa	%xcc,	%f19,	%f28
	udivcc	%l6,	0x09AB,	%l5
	ldd	[%l7 + 0x58],	%f6
	edge8ln	%o6,	%g7,	%l0
	faligndata	%f24,	%f4,	%f10
	ldx	[%l7 + 0x60],	%g2
	subc	%i7,	%g6,	%g1
	andncc	%o1,	%l2,	%i2
	lduh	[%l7 + 0x46],	%o0
	sll	%l1,	%i1,	%o5
	edge32ln	%g5,	%o4,	%o2
	xorcc	%i0,	%g4,	%i6
	movrlz	%o3,	0x365,	%o7
	edge8l	%l3,	%i5,	%i3
	andcc	%l4,	0x14CD,	%g3
	restore %l6, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g7,	%o6,	%l0
	ldub	[%l7 + 0x53],	%g2
	movvs	%xcc,	%i7,	%g6
	movpos	%xcc,	%o1,	%l2
	ldsw	[%l7 + 0x68],	%g1
	andn	%o0,	0x00A1,	%i2
	movge	%icc,	%i1,	%l1
	movneg	%icc,	%g5,	%o5
	mulscc	%o2,	%o4,	%g4
	sethi	0x08A7,	%i0
	addcc	%i6,	0x0E34,	%o7
	movvs	%icc,	%l3,	%o3
	movrgez	%i5,	0x06A,	%l4
	fmovsvs	%icc,	%f12,	%f3
	fmovdge	%xcc,	%f21,	%f20
	edge8ln	%g3,	%i3,	%l6
	xnor	%l5,	%i4,	%g7
	sir	0x1895
	movge	%icc,	%l0,	%o6
	edge8ln	%g2,	%g6,	%o1
	lduw	[%l7 + 0x48],	%i7
	edge32l	%l2,	%o0,	%i2
	addccc	%g1,	%l1,	%i1
	ldx	[%l7 + 0x18],	%g5
	sdiv	%o2,	0x0CD4,	%o4
	stw	%g4,	[%l7 + 0x7C]
	or	%o5,	0x13C7,	%i0
	srax	%o7,	0x1A,	%l3
	andcc	%o3,	0x18BE,	%i6
	movrgz	%i5,	%g3,	%i3
	fmovdcs	%icc,	%f26,	%f18
	fpadd16	%f0,	%f30,	%f16
	andn	%l6,	%l4,	%l5
	andncc	%i4,	%l0,	%o6
	xnorcc	%g7,	0x1C65,	%g6
	movneg	%icc,	%g2,	%o1
	array32	%l2,	%o0,	%i7
	sethi	0x1FF7,	%i2
	movcc	%icc,	%l1,	%g1
	lduh	[%l7 + 0x54],	%g5
	smulcc	%o2,	%i1,	%o4
	or	%g4,	0x13E2,	%i0
	fandnot1s	%f14,	%f28,	%f16
	andncc	%o5,	%o7,	%l3
	fmovdl	%xcc,	%f5,	%f18
	fmul8x16au	%f2,	%f27,	%f12
	addccc	%i6,	0x0721,	%o3
	fzero	%f4
	sll	%g3,	%i3,	%i5
	edge8ln	%l4,	%l5,	%i4
	fmovrdgez	%l6,	%f22,	%f6
	movrgez	%o6,	%g7,	%l0
	movcs	%xcc,	%g2,	%g6
	movg	%icc,	%o1,	%l2
	fmovde	%icc,	%f18,	%f3
	movrlz	%i7,	%o0,	%i2
	fmuld8sux16	%f30,	%f22,	%f22
	edge32ln	%l1,	%g1,	%o2
	add	%g5,	%o4,	%i1
	fmovdne	%xcc,	%f31,	%f7
	ldsw	[%l7 + 0x14],	%i0
	addccc	%o5,	0x0F9C,	%o7
	fmovda	%icc,	%f21,	%f10
	andncc	%l3,	%g4,	%i6
	sdivx	%o3,	0x0DB0,	%g3
	ldsb	[%l7 + 0x53],	%i3
	movleu	%icc,	%l4,	%i5
	edge8n	%l5,	%l6,	%o6
	fones	%f12
	alignaddr	%g7,	%i4,	%l0
	edge32ln	%g2,	%g6,	%l2
	movpos	%xcc,	%o1,	%o0
	movrne	%i2,	%i7,	%g1
	srlx	%o2,	%l1,	%o4
	umul	%g5,	0x0467,	%i1
	stw	%o5,	[%l7 + 0x20]
	fnand	%f16,	%f30,	%f2
	xnorcc	%o7,	0x02C0,	%l3
	fnor	%f20,	%f22,	%f8
	ld	[%l7 + 0x0C],	%f3
	fxor	%f4,	%f6,	%f6
	xor	%g4,	0x1949,	%i6
	popc	%i0,	%g3
	fmovdg	%xcc,	%f10,	%f15
	edge32l	%i3,	%l4,	%o3
	movge	%xcc,	%l5,	%i5
	fmovsn	%icc,	%f16,	%f20
	udivx	%l6,	0x0BD7,	%o6
	fcmpgt32	%f0,	%f2,	%g7
	sir	0x1104
	edge16ln	%i4,	%g2,	%g6
	movrlz	%l0,	%l2,	%o0
	sub	%o1,	%i7,	%g1
	movle	%xcc,	%o2,	%l1
	and	%o4,	%i2,	%g5
	fornot2s	%f18,	%f27,	%f7
	movre	%o5,	0x096,	%o7
	fnot2	%f12,	%f26
	std	%f0,	[%l7 + 0x20]
	udivx	%i1,	0x1D82,	%l3
	mova	%icc,	%i6,	%g4
	alignaddr	%g3,	%i0,	%i3
	mova	%icc,	%o3,	%l4
	sub	%i5,	%l6,	%o6
	sth	%g7,	[%l7 + 0x4E]
	stx	%i4,	[%l7 + 0x58]
	movneg	%icc,	%g2,	%l5
	edge16l	%l0,	%l2,	%o0
	sub	%o1,	0x1ED9,	%i7
	alignaddr	%g6,	%g1,	%o2
	sth	%o4,	[%l7 + 0x12]
	fxor	%f28,	%f28,	%f14
	mulx	%l1,	%g5,	%i2
	movn	%xcc,	%o7,	%o5
	popc	%l3,	%i1
	fsrc2s	%f14,	%f27
	movne	%xcc,	%g4,	%i6
	sir	0x129F
	fmovscs	%icc,	%f11,	%f6
	fmovrde	%g3,	%f12,	%f12
	udivx	%i0,	0x0C1A,	%o3
	movne	%icc,	%i3,	%l4
	sub	%l6,	0x0EFB,	%o6
	sdivx	%i5,	0x0E4F,	%g7
	fmovrslz	%i4,	%f9,	%f25
	mulx	%l5,	0x1253,	%l0
	sll	%g2,	%o0,	%l2
	movrlz	%i7,	0x33E,	%g6
	sllx	%g1,	%o2,	%o4
	movleu	%icc,	%o1,	%l1
	smul	%g5,	0x1CF2,	%o7
	movrlez	%o5,	0x338,	%i2
	fpsub32s	%f21,	%f6,	%f14
	fsrc2	%f16,	%f24
	fmovda	%xcc,	%f3,	%f23
	movrgez	%l3,	0x1BA,	%i1
	nop
	set	0x14, %i4
	ldsh	[%l7 + %i4],	%i6
	movn	%icc,	%g4,	%g3
	smul	%o3,	0x11C5,	%i0
	stb	%i3,	[%l7 + 0x59]
	edge16l	%l4,	%l6,	%o6
	subc	%i5,	0x0AF3,	%i4
	srlx	%g7,	%l0,	%l5
	ld	[%l7 + 0x30],	%f0
	fnot1s	%f10,	%f1
	sll	%o0,	%l2,	%i7
	fpadd16	%f0,	%f2,	%f22
	edge32n	%g2,	%g1,	%g6
	ld	[%l7 + 0x68],	%f4
	and	%o4,	%o2,	%o1
	popc	%l1,	%g5
	sethi	0x11F0,	%o7
	movn	%xcc,	%i2,	%o5
	edge32	%l3,	%i1,	%g4
	ldsb	[%l7 + 0x1E],	%g3
	lduh	[%l7 + 0x62],	%o3
	movrgez	%i6,	0x295,	%i0
	movcc	%xcc,	%i3,	%l6
	sdivcc	%l4,	0x04BD,	%i5
	fmul8x16al	%f29,	%f7,	%f14
	popc	0x1826,	%i4
	xor	%g7,	0x03D0,	%l0
	pdist	%f8,	%f12,	%f30
	ld	[%l7 + 0x40],	%f16
	fmovsgu	%icc,	%f21,	%f9
	nop
	set	0x1C, %g7
	lduw	[%l7 + %g7],	%o6
	edge16n	%o0,	%l2,	%i7
	sdivx	%g2,	0x0A0C,	%l5
	edge32l	%g1,	%g6,	%o2
	movl	%icc,	%o1,	%l1
	st	%f30,	[%l7 + 0x10]
	fmul8x16au	%f12,	%f26,	%f2
	array32	%g5,	%o7,	%o4
	andncc	%i2,	%l3,	%i1
	fmovspos	%xcc,	%f0,	%f11
	ldsh	[%l7 + 0x5C],	%o5
	sdivx	%g3,	0x1D5E,	%g4
	subcc	%o3,	0x05ED,	%i0
	fmovrslz	%i3,	%f1,	%f6
	fmovrsgz	%i6,	%f29,	%f31
	fmovscs	%xcc,	%f11,	%f22
	movre	%l6,	%i5,	%i4
	fmovrslz	%l4,	%f13,	%f5
	fmovsleu	%xcc,	%f21,	%f12
	fmovsge	%icc,	%f19,	%f23
	fzeros	%f30
	srl	%l0,	%g7,	%o6
	addc	%o0,	0x038B,	%l2
	movcs	%icc,	%i7,	%g2
	stx	%g1,	[%l7 + 0x20]
	ldsw	[%l7 + 0x5C],	%g6
	movle	%xcc,	%l5,	%o1
	sllx	%l1,	0x03,	%o2
	movvc	%icc,	%o7,	%g5
	fcmple32	%f24,	%f12,	%i2
	udivcc	%l3,	0x079D,	%i1
	sllx	%o5,	0x12,	%g3
	fxnor	%f0,	%f6,	%f12
	alignaddr	%o4,	%g4,	%o3
	stb	%i0,	[%l7 + 0x33]
	ldsh	[%l7 + 0x60],	%i6
	sdivcc	%i3,	0x0A3A,	%i5
	mulx	%i4,	0x093B,	%l6
	fmovsne	%xcc,	%f28,	%f5
	save %l4, 0x187A, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x10],	%o6
	movvs	%xcc,	%g7,	%l2
	fmovdcs	%icc,	%f24,	%f4
	edge32n	%o0,	%g2,	%i7
	sll	%g6,	%g1,	%o1
	array8	%l5,	%l1,	%o7
	fpsub32s	%f13,	%f6,	%f18
	ldsh	[%l7 + 0x6A],	%g5
	sub	%i2,	0x122D,	%l3
	fones	%f5
	udiv	%o2,	0x048D,	%o5
	fexpand	%f16,	%f2
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	array16	%o4,	%o3,	%g4
	ldx	[%l7 + 0x48],	%i6
	movrgez	%i3,	0x366,	%i0
	fmovsl	%icc,	%f16,	%f13
	fcmpne32	%f0,	%f14,	%i5
	st	%f12,	[%l7 + 0x1C]
	array32	%l6,	%l4,	%l0
	move	%icc,	%o6,	%g7
	addcc	%l2,	%o0,	%g2
	fmovrsne	%i7,	%f4,	%f25
	fsrc2s	%f16,	%f22
	mulx	%g6,	%g1,	%o1
	lduw	[%l7 + 0x08],	%l5
	srax	%i4,	%l1,	%o7
	xnor	%g5,	%i2,	%o2
	edge32n	%l3,	%i1,	%o5
	sllx	%o4,	0x1F,	%o3
	add	%g4,	%g3,	%i6
	nop
	set	0x38, %i0
	stb	%i3,	[%l7 + %i0]
	andncc	%i5,	%i0,	%l4
	subccc	%l0,	0x0EDD,	%o6
	fmovdleu	%xcc,	%f6,	%f1
	mulx	%g7,	%l6,	%o0
	movleu	%xcc,	%g2,	%i7
	udivcc	%l2,	0x03EC,	%g1
	umul	%o1,	%l5,	%i4
	fmovdleu	%xcc,	%f26,	%f1
	ldx	[%l7 + 0x78],	%g6
	fmovdl	%xcc,	%f1,	%f25
	edge16	%o7,	%g5,	%i2
	andcc	%l1,	0x1173,	%l3
	sub	%o2,	%i1,	%o5
	fones	%f14
	smulcc	%o3,	%o4,	%g4
	fpadd16	%f14,	%f24,	%f14
	movl	%xcc,	%g3,	%i3
	fpsub32s	%f28,	%f21,	%f22
	srl	%i6,	0x1B,	%i0
	andn	%i5,	%l4,	%l0
	sll	%o6,	0x02,	%g7
	fmovrse	%l6,	%f7,	%f5
	udiv	%o0,	0x0440,	%i7
	addcc	%l2,	%g2,	%o1
	popc	0x12ED,	%g1
	move	%icc,	%l5,	%g6
	smulcc	%o7,	0x0D0F,	%g5
	xorcc	%i2,	0x1D63,	%i4
	array32	%l3,	%l1,	%o2
	xorcc	%i1,	%o5,	%o4
	smulcc	%g4,	0x08AA,	%g3
	save %o3, %i6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f22,	%f10
	movcc	%icc,	%i5,	%i0
	save %l4, 0x18F5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o6,	0x137A,	%g7
	fxor	%f16,	%f28,	%f26
	stw	%l6,	[%l7 + 0x48]
	xor	%i7,	0x08A1,	%l2
	movleu	%xcc,	%o0,	%g2
	add	%o1,	%g1,	%g6
	xorcc	%o7,	0x0FD7,	%l5
	sub	%i2,	0x07B9,	%g5
	andncc	%i4,	%l1,	%l3
	alignaddrl	%o2,	%o5,	%i1
	movneg	%xcc,	%g4,	%o4
	alignaddrl	%o3,	%g3,	%i6
	stx	%i3,	[%l7 + 0x68]
	fnot2	%f30,	%f20
	fornot1s	%f14,	%f19,	%f25
	orn	%i0,	0x0EE3,	%l4
	fpsub16	%f26,	%f22,	%f24
	fpack16	%f26,	%f21
	edge16l	%i5,	%l0,	%o6
	ldsw	[%l7 + 0x1C],	%g7
	lduh	[%l7 + 0x74],	%l6
	ldd	[%l7 + 0x78],	%f30
	ldsh	[%l7 + 0x40],	%l2
	fmovdcc	%icc,	%f15,	%f21
	alignaddr	%o0,	%g2,	%o1
	ldub	[%l7 + 0x10],	%g1
	fmovdcs	%xcc,	%f31,	%f19
	udivcc	%i7,	0x0927,	%o7
	fmovsvc	%xcc,	%f25,	%f3
	subcc	%l5,	%i2,	%g5
	smul	%g6,	%i4,	%l1
	alignaddr	%o2,	%o5,	%i1
	movvs	%xcc,	%g4,	%o4
	fmovsneg	%xcc,	%f9,	%f1
	restore %l3, 0x05B4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x47],	%i6
	ldx	[%l7 + 0x40],	%i3
	umul	%i0,	%l4,	%g3
	edge32ln	%l0,	%o6,	%g7
	edge8	%i5,	%l2,	%o0
	subc	%g2,	%o1,	%g1
	ldub	[%l7 + 0x5B],	%l6
	lduw	[%l7 + 0x10],	%o7
	fmul8sux16	%f24,	%f2,	%f24
	movcc	%xcc,	%i7,	%l5
	bshuffle	%f4,	%f14,	%f26
	movre	%g5,	%i2,	%g6
	movrlz	%l1,	0x056,	%o2
	fmovdvc	%xcc,	%f11,	%f18
	movvs	%xcc,	%i4,	%o5
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	movne	%icc,	%i1,	%i6
	subccc	%i3,	%o3,	%l4
	nop
	set	0x6E, %o7
	ldub	[%l7 + %o7],	%i0
	edge8n	%g3,	%l0,	%o6
	movg	%icc,	%g7,	%i5
	movcc	%xcc,	%l2,	%g2
	orn	%o1,	0x1442,	%g1
	ldub	[%l7 + 0x5B],	%o0
	movge	%xcc,	%l6,	%i7
	movpos	%xcc,	%o7,	%l5
	fpadd32s	%f13,	%f2,	%f26
	fcmpgt32	%f16,	%f12,	%i2
	ldsw	[%l7 + 0x28],	%g5
	subccc	%g6,	%l1,	%o2
	fcmpne32	%f20,	%f12,	%i4
	ldd	[%l7 + 0x50],	%f2
	orcc	%g4,	%o5,	%o4
	fmovscc	%xcc,	%f6,	%f10
	edge8ln	%l3,	%i1,	%i3
	edge16	%i6,	%o3,	%i0
	fmovsneg	%xcc,	%f3,	%f11
	xor	%g3,	0x0CB3,	%l4
	sllx	%l0,	0x16,	%o6
	xor	%i5,	%l2,	%g7
	sth	%g2,	[%l7 + 0x6C]
	sllx	%g1,	0x17,	%o0
	lduh	[%l7 + 0x42],	%l6
	movre	%o1,	%o7,	%l5
	movrlez	%i2,	%g5,	%i7
	movrlez	%l1,	%o2,	%g6
	udivcc	%g4,	0x16A6,	%o5
	movrne	%i4,	%o4,	%l3
	fandnot1	%f10,	%f24,	%f18
	movrgz	%i3,	0x2CE,	%i6
	stx	%o3,	[%l7 + 0x68]
	movrgz	%i0,	%g3,	%i1
	andncc	%l0,	%o6,	%i5
	movneg	%icc,	%l4,	%l2
	movvs	%icc,	%g2,	%g1
	movcc	%icc,	%o0,	%g7
	andn	%l6,	0x1C52,	%o7
	movle	%icc,	%l5,	%i2
	srl	%g5,	0x00,	%i7
	fone	%f28
	fmovs	%f17,	%f21
	std	%f12,	[%l7 + 0x10]
	sdivcc	%l1,	0x0AD2,	%o1
	or	%o2,	%g6,	%o5
	sdivcc	%i4,	0x00FB,	%o4
	alignaddr	%g4,	%l3,	%i6
	addccc	%i3,	0x1933,	%o3
	or	%g3,	%i0,	%l0
	alignaddr	%o6,	%i5,	%l4
	fxor	%f8,	%f16,	%f2
	or	%l2,	0x1F89,	%i1
	srlx	%g1,	0x1E,	%g2
	movrgz	%o0,	0x14B,	%l6
	save %o7, %g7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f13,	%f22
	fnot1	%f10,	%f4
	sll	%g5,	0x1E,	%l5
	array8	%i7,	%o1,	%l1
	udivcc	%g6,	0x1984,	%o2
	st	%f31,	[%l7 + 0x68]
	sdivx	%i4,	0x1934,	%o4
	movleu	%icc,	%o5,	%l3
	srl	%i6,	%g4,	%o3
	edge8ln	%g3,	%i0,	%i3
	fmovsge	%icc,	%f0,	%f11
	mulscc	%l0,	0x07E7,	%i5
	mulscc	%o6,	%l4,	%i1
	nop
	set	0x14, %l4
	lduw	[%l7 + %l4],	%g1
	stw	%g2,	[%l7 + 0x38]
	fnands	%f2,	%f13,	%f26
	add	%l2,	0x0EB4,	%l6
	fmovrdgez	%o7,	%f26,	%f14
	fxor	%f24,	%f12,	%f16
	edge32ln	%o0,	%i2,	%g5
	sth	%g7,	[%l7 + 0x4A]
	fmovrslez	%l5,	%f8,	%f6
	fand	%f4,	%f6,	%f24
	movg	%icc,	%o1,	%i7
	save %l1, %g6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i4,	[%l7 + 0x36]
	srl	%o4,	%l3,	%o5
	movleu	%xcc,	%i6,	%g4
	alignaddrl	%o3,	%g3,	%i3
	movleu	%icc,	%i0,	%i5
	movle	%xcc,	%o6,	%l0
	srax	%i1,	%g1,	%g2
	movre	%l2,	0x19D,	%l4
	stw	%o7,	[%l7 + 0x60]
	movpos	%icc,	%l6,	%o0
	movrgez	%i2,	0x2CC,	%g5
	fpadd16	%f4,	%f6,	%f30
	array8	%g7,	%o1,	%l5
	move	%icc,	%i7,	%g6
	movvs	%xcc,	%o2,	%i4
	lduh	[%l7 + 0x6C],	%l1
	edge8	%l3,	%o4,	%o5
	movleu	%xcc,	%i6,	%g4
	xnorcc	%o3,	0x0A7A,	%i3
	fsrc2	%f20,	%f14
	add	%g3,	%i0,	%o6
	st	%f16,	[%l7 + 0x48]
	xor	%l0,	%i1,	%i5
	ld	[%l7 + 0x24],	%f29
	fnot2s	%f27,	%f13
	subcc	%g2,	%g1,	%l2
	fmovde	%xcc,	%f30,	%f17
	orcc	%o7,	%l6,	%l4
	subccc	%i2,	%g5,	%o0
	fnegd	%f6,	%f16
	edge16n	%o1,	%g7,	%i7
	fmovde	%xcc,	%f16,	%f23
	umulcc	%g6,	0x0BE0,	%l5
	movpos	%icc,	%i4,	%l1
	movg	%xcc,	%l3,	%o2
	addcc	%o5,	%i6,	%o4
	xorcc	%o3,	0x0C85,	%i3
	movl	%icc,	%g4,	%g3
	movvc	%icc,	%o6,	%i0
	lduh	[%l7 + 0x7E],	%i1
	ldx	[%l7 + 0x10],	%i5
	fnands	%f13,	%f26,	%f21
	nop
	set	0x28, %l6
	stb	%l0,	[%l7 + %l6]
	sir	0x1872
	edge32n	%g1,	%g2,	%o7
	sllx	%l6,	0x15,	%l2
	fmovsneg	%icc,	%f31,	%f3
	fmovrsgz	%l4,	%f24,	%f5
	orn	%i2,	%g5,	%o1
	edge16	%o0,	%i7,	%g6
	smul	%g7,	%l5,	%l1
	addccc	%l3,	%i4,	%o2
	sir	0x0ED6
	array8	%i6,	%o5,	%o3
	ldsh	[%l7 + 0x54],	%o4
	fmovrdgz	%g4,	%f22,	%f24
	fmovdg	%icc,	%f20,	%f7
	edge32n	%g3,	%o6,	%i0
	siam	0x2
	fmovs	%f27,	%f15
	movleu	%xcc,	%i1,	%i3
	or	%l0,	%i5,	%g2
	xnorcc	%g1,	%l6,	%o7
	andn	%l4,	0x1775,	%i2
	fmovrde	%g5,	%f28,	%f18
	subccc	%o1,	0x0CD5,	%l2
	orncc	%i7,	%o0,	%g6
	subccc	%g7,	0x1F4A,	%l1
	xnorcc	%l3,	%l5,	%i4
	lduw	[%l7 + 0x74],	%o2
	edge8	%i6,	%o5,	%o4
	popc	0x0C52,	%g4
	xorcc	%o3,	%o6,	%g3
	movne	%icc,	%i0,	%i1
	addcc	%i3,	0x0D07,	%l0
	fnot1	%f10,	%f26
	movpos	%xcc,	%i5,	%g1
	movvs	%icc,	%l6,	%g2
	stw	%l4,	[%l7 + 0x28]
	addccc	%i2,	0x189F,	%o7
	fnegd	%f8,	%f30
	fcmpeq32	%f8,	%f20,	%o1
	fornot2	%f6,	%f14,	%f26
	edge32ln	%g5,	%l2,	%i7
	ldsh	[%l7 + 0x54],	%o0
	nop
	set	0x6C, %o5
	lduw	[%l7 + %o5],	%g7
	fpadd16	%f12,	%f16,	%f28
	orcc	%g6,	0x18BE,	%l3
	fandnot2s	%f26,	%f28,	%f2
	array16	%l1,	%i4,	%o2
	movvs	%icc,	%l5,	%i6
	ldd	[%l7 + 0x60],	%o4
	sll	%o4,	0x0C,	%g4
	udiv	%o6,	0x0BF7,	%o3
	fmul8ulx16	%f6,	%f30,	%f22
	edge8ln	%i0,	%i1,	%g3
	nop
	set	0x28, %i1
	std	%f28,	[%l7 + %i1]
	andn	%i3,	%l0,	%i5
	ldx	[%l7 + 0x40],	%l6
	edge32	%g2,	%g1,	%i2
	edge16n	%l4,	%o1,	%o7
	ld	[%l7 + 0x40],	%f20
	movge	%icc,	%g5,	%i7
	smulcc	%o0,	0x0ED9,	%g7
	fmovspos	%icc,	%f2,	%f26
	mulscc	%l2,	%g6,	%l3
	array32	%i4,	%o2,	%l5
	srlx	%i6,	0x06,	%o5
	sll	%l1,	%o4,	%g4
	sth	%o6,	[%l7 + 0x08]
	ldx	[%l7 + 0x10],	%i0
	edge32n	%i1,	%o3,	%i3
	fmovsvs	%xcc,	%f10,	%f3
	ldd	[%l7 + 0x30],	%f12
	fexpand	%f3,	%f8
	fnot1s	%f5,	%f24
	movvc	%icc,	%l0,	%g3
	std	%f8,	[%l7 + 0x50]
	sll	%i5,	%g2,	%g1
	movn	%xcc,	%i2,	%l6
	edge8l	%o1,	%l4,	%o7
	faligndata	%f18,	%f2,	%f22
	edge16n	%g5,	%i7,	%o0
	edge16l	%g7,	%g6,	%l2
	subcc	%l3,	0x1778,	%i4
	fnot1	%f18,	%f14
	movgu	%xcc,	%o2,	%i6
	fmovscc	%icc,	%f7,	%f14
	sir	0x1E19
	fandnot2s	%f26,	%f18,	%f1
	fxnors	%f23,	%f8,	%f15
	sll	%o5,	0x17,	%l5
	ldsb	[%l7 + 0x7E],	%o4
	movrgz	%l1,	0x119,	%o6
	ldd	[%l7 + 0x60],	%i0
	sth	%i1,	[%l7 + 0x50]
	fmovsneg	%icc,	%f4,	%f25
	fsrc1	%f24,	%f2
	umul	%o3,	0x0DD5,	%i3
	fxors	%f15,	%f4,	%f10
	srl	%l0,	%g3,	%g4
	andcc	%g2,	0x0805,	%i5
	sdivcc	%i2,	0x09C3,	%l6
	orcc	%g1,	%l4,	%o7
	fpsub16s	%f28,	%f31,	%f11
	smulcc	%g5,	0x10A5,	%i7
	stx	%o0,	[%l7 + 0x70]
	smul	%g7,	%o1,	%g6
	xor	%l3,	0x021E,	%i4
	array32	%l2,	%o2,	%o5
	subcc	%i6,	0x0254,	%o4
	movle	%icc,	%l1,	%o6
	bshuffle	%f10,	%f14,	%f22
	fmovsleu	%icc,	%f6,	%f4
	movre	%l5,	0x122,	%i0
	sdivcc	%o3,	0x04E5,	%i3
	edge16l	%l0,	%g3,	%i1
	edge16ln	%g2,	%g4,	%i2
	fornot1s	%f25,	%f0,	%f9
	xorcc	%i5,	0x0F12,	%l6
	sdivx	%l4,	0x0FEE,	%g1
	fmovsgu	%xcc,	%f1,	%f22
	sra	%o7,	%g5,	%o0
	fmovdcc	%icc,	%f25,	%f5
	movrlz	%i7,	0x249,	%g7
	sdiv	%o1,	0x040D,	%g6
	fsrc1	%f22,	%f24
	movrgez	%l3,	0x2BF,	%i4
	std	%f8,	[%l7 + 0x28]
	sethi	0x161A,	%o2
	movrlz	%l2,	%i6,	%o5
	fcmpgt32	%f30,	%f16,	%l1
	fmovrsne	%o4,	%f0,	%f9
	movn	%icc,	%l5,	%o6
	ldub	[%l7 + 0x1C],	%i0
	subcc	%i3,	0x0E9E,	%o3
	ldd	[%l7 + 0x18],	%g2
	orncc	%l0,	0x02C2,	%i1
	movre	%g2,	%g4,	%i2
	nop
	set	0x44, %i2
	ldsh	[%l7 + %i2],	%l6
	srlx	%i5,	%l4,	%o7
	movrne	%g1,	0x0EA,	%g5
	xor	%i7,	0x096B,	%o0
	subccc	%g7,	%g6,	%l3
	array8	%i4,	%o1,	%o2
	st	%f27,	[%l7 + 0x78]
	fabsd	%f30,	%f26
	fmovdl	%icc,	%f13,	%f28
	movn	%icc,	%i6,	%o5
	siam	0x6
	fmovrdgz	%l1,	%f20,	%f30
	add	%l2,	0x01E4,	%l5
	edge8l	%o6,	%o4,	%i0
	sdiv	%o3,	0x1E73,	%i3
	movle	%icc,	%l0,	%i1
	popc	0x062B,	%g3
	lduw	[%l7 + 0x70],	%g4
	fabss	%f6,	%f17
	movvs	%xcc,	%i2,	%g2
	sdivx	%l6,	0x00D2,	%i5
	fnegs	%f1,	%f31
	addccc	%l4,	0x0299,	%g1
	umul	%o7,	0x037E,	%i7
	fmovdn	%icc,	%f31,	%f24
	fmovdpos	%xcc,	%f31,	%f5
	movn	%xcc,	%g5,	%g7
	edge16ln	%g6,	%o0,	%i4
	sdivx	%o1,	0x0289,	%o2
	for	%f24,	%f26,	%f18
	fcmpne16	%f16,	%f30,	%l3
	movrgz	%i6,	0x168,	%l1
	mulscc	%l2,	0x17C6,	%o5
	movneg	%icc,	%o6,	%l5
	edge32ln	%o4,	%o3,	%i3
	fpsub32	%f12,	%f0,	%f0
	ldsh	[%l7 + 0x08],	%i0
	fmovdl	%xcc,	%f24,	%f0
	subc	%l0,	%i1,	%g3
	sethi	0x0BD0,	%i2
	std	%f22,	[%l7 + 0x60]
	movvc	%icc,	%g2,	%g4
	ldsw	[%l7 + 0x60],	%i5
	fcmpgt16	%f30,	%f8,	%l6
	sllx	%l4,	0x03,	%g1
	fmovrdgz	%i7,	%f2,	%f22
	umul	%g5,	%o7,	%g6
	std	%f18,	[%l7 + 0x30]
	alignaddrl	%g7,	%i4,	%o0
	edge16l	%o1,	%l3,	%i6
	addc	%o2,	%l1,	%l2
	sra	%o5,	0x12,	%o6
	sll	%o4,	0x04,	%o3
	sethi	0x1958,	%i3
	move	%icc,	%l5,	%l0
	xnorcc	%i1,	%g3,	%i2
	addc	%g2,	%i0,	%i5
	udiv	%l6,	0x00A5,	%g4
	umul	%g1,	0x0BD9,	%i7
	ldub	[%l7 + 0x22],	%l4
	fmovsl	%xcc,	%f13,	%f2
	ldsh	[%l7 + 0x40],	%o7
	popc	%g6,	%g5
	movre	%g7,	0x213,	%i4
	movg	%xcc,	%o0,	%o1
	mova	%xcc,	%l3,	%o2
	movn	%xcc,	%i6,	%l1
	fmul8x16au	%f1,	%f6,	%f28
	orncc	%o5,	%l2,	%o4
	movneg	%icc,	%o6,	%i3
	sllx	%l5,	0x14,	%o3
	movrlez	%l0,	%i1,	%g3
	andncc	%g2,	%i0,	%i2
	add	%i5,	0x186A,	%g4
	fsrc2	%f26,	%f12
	fnors	%f10,	%f11,	%f13
	sllx	%g1,	%l6,	%i7
	movle	%xcc,	%l4,	%o7
	mulx	%g6,	0x0A10,	%g7
	alignaddr	%g5,	%i4,	%o0
	sll	%l3,	%o1,	%o2
	movrgz	%l1,	%i6,	%l2
	fpadd32s	%f23,	%f9,	%f12
	fandnot1s	%f2,	%f19,	%f27
	array16	%o5,	%o4,	%o6
	alignaddrl	%l5,	%o3,	%i3
	movvc	%icc,	%l0,	%g3
	edge8	%g2,	%i1,	%i0
	ldd	[%l7 + 0x78],	%i2
	addcc	%i5,	0x0DB5,	%g1
	restore %g4, %i7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f29,	%f5,	%f12
	movrne	%l6,	0x34A,	%o7
	edge8	%g6,	%g5,	%i4
	movcc	%xcc,	%g7,	%l3
	edge16ln	%o1,	%o0,	%o2
	ldd	[%l7 + 0x68],	%l0
	udivcc	%l2,	0x14A4,	%i6
	fpack32	%f12,	%f12,	%f4
	smulcc	%o4,	%o5,	%o6
	alignaddrl	%o3,	%i3,	%l5
	xorcc	%l0,	%g3,	%g2
	smulcc	%i0,	%i1,	%i5
	fmul8x16au	%f14,	%f0,	%f30
	move	%xcc,	%i2,	%g1
	ld	[%l7 + 0x18],	%f22
	fmovrse	%i7,	%f9,	%f27
	ldsw	[%l7 + 0x60],	%g4
	fmovsne	%icc,	%f20,	%f19
	movrgz	%l4,	0x132,	%l6
	edge16ln	%g6,	%g5,	%i4
	lduw	[%l7 + 0x70],	%o7
	movrgez	%l3,	%g7,	%o1
	xnorcc	%o0,	%l1,	%o2
	ldd	[%l7 + 0x68],	%f28
	xnorcc	%l2,	0x1E72,	%o4
	fcmpgt16	%f18,	%f6,	%o5
	sdiv	%o6,	0x0831,	%o3
	movl	%xcc,	%i3,	%l5
	mulscc	%i6,	0x1C31,	%g3
	fmul8x16au	%f15,	%f31,	%f6
	nop
	set	0x57, %g6
	ldub	[%l7 + %g6],	%g2
	fmovse	%icc,	%f27,	%f23
	fsrc1s	%f20,	%f27
	edge16	%i0,	%i1,	%l0
	fnot2	%f18,	%f20
	movleu	%xcc,	%i5,	%g1
	movrlz	%i7,	0x062,	%i2
	move	%icc,	%g4,	%l6
	movpos	%xcc,	%g6,	%g5
	edge16ln	%i4,	%l4,	%o7
	fmul8x16al	%f4,	%f10,	%f30
	orcc	%l3,	0x07BB,	%g7
	sdiv	%o1,	0x1F32,	%o0
	sethi	0x0EDC,	%o2
	fmovrslz	%l1,	%f29,	%f6
	lduh	[%l7 + 0x2E],	%l2
	or	%o5,	0x1CD9,	%o6
	ldd	[%l7 + 0x38],	%o2
	movcc	%xcc,	%i3,	%o4
	addccc	%l5,	%i6,	%g2
	movn	%icc,	%g3,	%i1
	umulcc	%l0,	0x147A,	%i5
	subcc	%i0,	0x1F41,	%i7
	fcmpne16	%f26,	%f4,	%g1
	edge32n	%i2,	%l6,	%g4
	andncc	%g5,	%i4,	%g6
	movg	%xcc,	%l4,	%o7
	smulcc	%g7,	0x01F5,	%o1
	fmovsg	%xcc,	%f13,	%f12
	ldsh	[%l7 + 0x62],	%l3
	andncc	%o2,	%o0,	%l2
	lduh	[%l7 + 0x48],	%l1
	fpadd32s	%f31,	%f15,	%f14
	array32	%o6,	%o3,	%o5
	mulscc	%o4,	%l5,	%i3
	mulscc	%g2,	0x1EAB,	%i6
	sdiv	%g3,	0x1D7F,	%i1
	sdiv	%l0,	0x041F,	%i0
	movneg	%xcc,	%i5,	%g1
	addc	%i2,	%i7,	%g4
	fmovrsne	%l6,	%f31,	%f12
	edge32n	%i4,	%g5,	%l4
	fmul8x16	%f12,	%f14,	%f6
	alignaddrl	%g6,	%g7,	%o7
	sllx	%l3,	0x0E,	%o2
	srl	%o1,	0x14,	%o0
	movgu	%xcc,	%l2,	%l1
	movneg	%xcc,	%o6,	%o3
	stb	%o4,	[%l7 + 0x1A]
	orn	%o5,	0x074B,	%i3
	edge32n	%g2,	%i6,	%l5
	sra	%g3,	0x04,	%i1
	umul	%l0,	%i5,	%i0
	stx	%i2,	[%l7 + 0x68]
	fmovdge	%xcc,	%f6,	%f28
	udivcc	%g1,	0x16CE,	%g4
	addcc	%i7,	%l6,	%g5
	movpos	%xcc,	%l4,	%i4
	movg	%icc,	%g7,	%o7
	mova	%xcc,	%l3,	%g6
	mulscc	%o1,	0x0B5B,	%o0
	ldsw	[%l7 + 0x50],	%l2
	mulscc	%l1,	0x0BCB,	%o2
	movpos	%xcc,	%o3,	%o6
	fmovdvc	%icc,	%f2,	%f9
	fxors	%f20,	%f26,	%f23
	fmul8sux16	%f28,	%f28,	%f22
	sethi	0x0BFF,	%o4
	popc	0x0965,	%i3
	addcc	%o5,	%g2,	%i6
	orn	%g3,	%l5,	%l0
	fsrc1	%f4,	%f16
	fmovsl	%icc,	%f0,	%f19
	fmovse	%icc,	%f24,	%f1
	fmovdle	%icc,	%f5,	%f23
	fmovspos	%xcc,	%f30,	%f21
	edge8n	%i5,	%i0,	%i1
	fmovrde	%i2,	%f2,	%f14
	addc	%g1,	0x0195,	%i7
	movge	%icc,	%l6,	%g5
	stx	%g4,	[%l7 + 0x40]
	orn	%l4,	%i4,	%o7
	ldd	[%l7 + 0x30],	%l2
	movge	%icc,	%g7,	%g6
	addccc	%o0,	%l2,	%o1
	edge8l	%o2,	%l1,	%o6
	fzeros	%f22
	save %o3, %i3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g2,	0x1107,	%i6
	movrgez	%o5,	%l5,	%l0
	fnot1s	%f24,	%f27
	popc	%i5,	%g3
	smulcc	%i0,	0x138F,	%i2
	fandnot2s	%f13,	%f9,	%f3
	ldsb	[%l7 + 0x15],	%i1
	fpadd32	%f18,	%f6,	%f26
	addccc	%g1,	0x0626,	%i7
	umulcc	%g5,	0x0EB4,	%l6
	andn	%l4,	%i4,	%o7
	st	%f21,	[%l7 + 0x68]
	edge16l	%l3,	%g4,	%g6
	addc	%o0,	%l2,	%g7
	fandnot2	%f20,	%f18,	%f26
	movrlz	%o1,	0x0AE,	%l1
	fornot2	%f8,	%f4,	%f0
	movne	%icc,	%o2,	%o3
	fmovrdlz	%o6,	%f14,	%f26
	fmovsneg	%xcc,	%f26,	%f11
	fmuld8ulx16	%f13,	%f28,	%f16
	movvc	%xcc,	%o4,	%g2
	movvs	%xcc,	%i3,	%o5
	smulcc	%i6,	0x0CD6,	%l5
	sethi	0x1D9E,	%l0
	movn	%icc,	%i5,	%g3
	fmovse	%xcc,	%f2,	%f11
	fmovrdgez	%i2,	%f0,	%f8
	ldsw	[%l7 + 0x0C],	%i0
	ldd	[%l7 + 0x68],	%g0
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	or	%i7,	0x0412,	%l6
	std	%f24,	[%l7 + 0x28]
	or	%l4,	0x1BCB,	%o7
	fmovdgu	%icc,	%f27,	%f20
	fmovdleu	%xcc,	%f31,	%f22
	movvs	%xcc,	%i4,	%l3
	edge8ln	%g4,	%g6,	%l2
	fpack32	%f28,	%f6,	%f4
	orncc	%o0,	0x0EE2,	%g7
	smulcc	%o1,	%l1,	%o3
	andcc	%o6,	%o4,	%g2
	movne	%xcc,	%i3,	%o5
	fmovrslz	%i6,	%f21,	%f17
	fmovd	%f10,	%f24
	lduw	[%l7 + 0x78],	%l5
	edge16n	%o2,	%i5,	%l0
	movrne	%i2,	0x37A,	%i0
	movn	%xcc,	%g1,	%g3
	edge16l	%i1,	%i7,	%g5
	alignaddr	%l6,	%o7,	%l4
	restore %l3, 0x0334, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i4,	%g6,	%l2
	sdivcc	%o0,	0x1E70,	%o1
	sllx	%l1,	%g7,	%o3
	stb	%o4,	[%l7 + 0x7E]
	fmovda	%icc,	%f17,	%f3
	edge32ln	%o6,	%i3,	%g2
	fsrc2	%f16,	%f6
	movvc	%xcc,	%i6,	%l5
	orn	%o2,	%i5,	%l0
	movvc	%xcc,	%o5,	%i0
	movne	%icc,	%g1,	%g3
	movle	%xcc,	%i2,	%i7
	fmovsle	%icc,	%f0,	%f15
	srlx	%i1,	%l6,	%g5
	subcc	%o7,	%l3,	%l4
	sub	%g4,	%i4,	%g6
	movcc	%icc,	%l2,	%o0
	movn	%xcc,	%o1,	%l1
	ldx	[%l7 + 0x18],	%o3
	udivcc	%o4,	0x11C9,	%o6
	fmovscc	%xcc,	%f1,	%f26
	std	%f28,	[%l7 + 0x58]
	fornot2s	%f19,	%f27,	%f7
	alignaddr	%g7,	%i3,	%g2
	std	%f20,	[%l7 + 0x60]
	array16	%i6,	%o2,	%l5
	fpadd32s	%f18,	%f18,	%f13
	st	%f9,	[%l7 + 0x28]
	alignaddrl	%l0,	%o5,	%i0
	ldd	[%l7 + 0x58],	%f0
	movge	%xcc,	%i5,	%g3
	save %g1, %i2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f0,	%f20,	%f6
	fpack16	%f16,	%f20
	std	%f0,	[%l7 + 0x68]
	fmovrsne	%l6,	%f5,	%f14
	ld	[%l7 + 0x7C],	%f19
	srl	%i1,	%o7,	%l3
	edge16l	%g5,	%l4,	%g4
	andn	%g6,	0x0DBE,	%i4
	edge8	%l2,	%o1,	%o0
	fpack16	%f4,	%f1
	fornot1	%f2,	%f8,	%f12
	ldsh	[%l7 + 0x0A],	%l1
	subccc	%o4,	0x01F7,	%o3
	srlx	%o6,	0x11,	%g7
	sth	%i3,	[%l7 + 0x7E]
	umulcc	%g2,	0x04DE,	%o2
	ldsh	[%l7 + 0x3E],	%l5
	udiv	%i6,	0x15A7,	%o5
	sra	%i0,	%l0,	%i5
	udiv	%g1,	0x1FCB,	%i2
	smul	%i7,	0x02E1,	%g3
	srlx	%i1,	0x1C,	%l6
	udivx	%o7,	0x0643,	%g5
	srax	%l3,	0x00,	%g4
	edge32	%l4,	%i4,	%l2
	edge32	%o1,	%g6,	%o0
	movre	%l1,	0x1D5,	%o4
	fmovrde	%o6,	%f10,	%f8
	array16	%o3,	%g7,	%i3
	udivx	%o2,	0x132F,	%l5
	ldub	[%l7 + 0x29],	%i6
	subc	%o5,	%i0,	%g2
	movrgez	%i5,	0x332,	%l0
	andcc	%g1,	%i7,	%i2
	fmovrde	%g3,	%f24,	%f2
	andcc	%l6,	0x1D77,	%o7
	fmovdvs	%icc,	%f14,	%f19
	movn	%xcc,	%i1,	%l3
	fornot2	%f30,	%f0,	%f16
	ldsb	[%l7 + 0x1B],	%g5
	movneg	%icc,	%l4,	%g4
	ldsw	[%l7 + 0x7C],	%i4
	sra	%o1,	%g6,	%o0
	xorcc	%l2,	%l1,	%o6
	movvs	%icc,	%o4,	%o3
	or	%i3,	0x01D4,	%o2
	udivx	%g7,	0x1134,	%i6
	movre	%l5,	0x1D5,	%o5
	udivx	%i0,	0x0941,	%i5
	andncc	%g2,	%l0,	%g1
	or	%i2,	0x0EF8,	%i7
	alignaddrl	%g3,	%l6,	%o7
	movle	%icc,	%l3,	%g5
	addc	%l4,	0x1297,	%g4
	ldsw	[%l7 + 0x0C],	%i1
	movl	%icc,	%o1,	%i4
	fmovdn	%icc,	%f24,	%f26
	fmovdcc	%xcc,	%f10,	%f25
	edge32n	%g6,	%o0,	%l1
	array32	%l2,	%o6,	%o3
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	ldx	[%l7 + 0x60],	%i6
	edge8l	%l5,	%o2,	%i0
	fpack16	%f6,	%f0
	andcc	%i5,	%g2,	%l0
	edge16	%g1,	%o5,	%i2
	movl	%icc,	%g3,	%l6
	fcmpne32	%f16,	%f2,	%i7
	fmovsneg	%icc,	%f1,	%f30
	fmovsneg	%xcc,	%f31,	%f18
	sdiv	%o7,	0x0C11,	%l3
	fnands	%f26,	%f24,	%f16
	stw	%l4,	[%l7 + 0x4C]
	stw	%g5,	[%l7 + 0x64]
	fmovdcc	%icc,	%f2,	%f29
	fmovrse	%g4,	%f16,	%f1
	sir	0x0113
	array16	%i1,	%o1,	%i4
	save %g6, 0x0A31, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o0,	0x1202,	%o6
	movne	%icc,	%l2,	%o4
	movvc	%xcc,	%i3,	%o3
	edge32l	%i6,	%g7,	%l5
	movrne	%i0,	0x0A2,	%i5
	ld	[%l7 + 0x10],	%f31
	fmovd	%f0,	%f18
	sdiv	%g2,	0x1C13,	%l0
	fmul8sux16	%f10,	%f6,	%f30
	srlx	%o2,	0x02,	%o5
	fpsub16s	%f7,	%f3,	%f4
	addcc	%g1,	0x0AFB,	%i2
	fcmple16	%f10,	%f16,	%g3
	fcmple32	%f30,	%f2,	%i7
	sdivx	%l6,	0x0768,	%o7
	stw	%l4,	[%l7 + 0x10]
	fmovsle	%icc,	%f11,	%f24
	edge32ln	%l3,	%g4,	%g5
	andcc	%o1,	%i1,	%g6
	ldub	[%l7 + 0x72],	%i4
	sir	0x0DFE
	lduh	[%l7 + 0x50],	%o0
	edge16ln	%o6,	%l1,	%l2
	sdivx	%i3,	0x1E47,	%o3
	fnor	%f12,	%f28,	%f6
	lduh	[%l7 + 0x28],	%o4
	xnorcc	%i6,	%l5,	%i0
	sdivcc	%i5,	0x1DD9,	%g7
	ldd	[%l7 + 0x30],	%l0
	fmovdge	%xcc,	%f2,	%f16
	movrlez	%o2,	%o5,	%g2
	movre	%g1,	%i2,	%g3
	movpos	%xcc,	%l6,	%o7
	andn	%l4,	%l3,	%i7
	srl	%g5,	%g4,	%i1
	edge8	%o1,	%i4,	%o0
	udiv	%o6,	0x0E8E,	%l1
	edge8ln	%l2,	%i3,	%o3
	srax	%g6,	%o4,	%i6
	stx	%i0,	[%l7 + 0x70]
	fnegs	%f23,	%f23
	ldd	[%l7 + 0x28],	%i4
	stw	%g7,	[%l7 + 0x18]
	sir	0x17F0
	andcc	%l0,	0x14F7,	%l5
	sdiv	%o5,	0x1AE8,	%o2
	movneg	%xcc,	%g1,	%i2
	edge8n	%g2,	%g3,	%o7
	movne	%xcc,	%l6,	%l3
	restore %i7, %g5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g4,	%i1,	%i4
	fmovsne	%xcc,	%f19,	%f7
	edge8	%o0,	%o1,	%l1
	movneg	%xcc,	%l2,	%o6
	andncc	%o3,	%i3,	%o4
	edge8l	%i6,	%i0,	%g6
	ldsh	[%l7 + 0x6A],	%i5
	movrlz	%l0,	0x1D3,	%l5
	addc	%g7,	0x0424,	%o5
	fmovrde	%g1,	%f8,	%f2
	edge16n	%o2,	%i2,	%g3
	movl	%xcc,	%o7,	%l6
	fcmps	%fcc2,	%f22,	%f29
	fcmpes	%fcc3,	%f20,	%f18
	st	%f17,	[%l7 + 0x2C]
	stx	%g2,	[%l7 + 0x38]
	fmovdge	%xcc,	%f27,	%f0
	save %i7, %l3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x11C8,	%g4
	orcc	%i1,	0x1262,	%g5
	mulscc	%o0,	0x0618,	%o1
	movrne	%l1,	%l2,	%i4
	movge	%xcc,	%o3,	%o6
	umul	%o4,	0x19E1,	%i3
	nop
	set	0x3C, %o0
	ldsb	[%l7 + %o0],	%i6
	smulcc	%g6,	%i5,	%i0
	sdiv	%l0,	0x1E14,	%g7
	movne	%xcc,	%l5,	%g1
	ld	[%l7 + 0x1C],	%f22
	nop
	set	0x70, %o2
	stw	%o2,	[%l7 + %o2]
	srl	%i2,	0x0E,	%o5
	srax	%g3,	%o7,	%l6
	lduh	[%l7 + 0x14],	%g2
	move	%xcc,	%i7,	%l3
	ldd	[%l7 + 0x38],	%l4
	udiv	%i1,	0x1FC1,	%g4
	movne	%xcc,	%g5,	%o0
	fpmerge	%f1,	%f13,	%f20
	mulscc	%o1,	0x0506,	%l2
	movrlez	%i4,	%l1,	%o3
	fcmps	%fcc2,	%f2,	%f13
	subc	%o6,	%o4,	%i3
	ldd	[%l7 + 0x38],	%i6
	edge32	%i5,	%i0,	%l0
	subcc	%g6,	%l5,	%g1
	andn	%g7,	%i2,	%o5
	fors	%f31,	%f11,	%f6
	movl	%xcc,	%g3,	%o7
	lduw	[%l7 + 0x10],	%o2
	edge8n	%l6,	%g2,	%i7
	edge8ln	%l3,	%i1,	%l4
	andncc	%g5,	%o0,	%g4
	movg	%xcc,	%o1,	%i4
	movpos	%xcc,	%l1,	%o3
	fcmpd	%fcc0,	%f16,	%f2
	orn	%l2,	0x0081,	%o6
	movle	%icc,	%o4,	%i6
	stx	%i5,	[%l7 + 0x08]
	fpsub32s	%f25,	%f16,	%f4
	movcs	%xcc,	%i3,	%i0
	alignaddr	%l0,	%g6,	%l5
	ldsh	[%l7 + 0x78],	%g7
	movg	%icc,	%i2,	%g1
	edge8ln	%g3,	%o7,	%o2
	ldd	[%l7 + 0x28],	%i6
	array32	%g2,	%i7,	%l3
	array8	%o5,	%l4,	%i1
	move	%xcc,	%g5,	%o0
	movrne	%o1,	%i4,	%g4
	fcmpne16	%f16,	%f26,	%l1
	xorcc	%l2,	%o3,	%o4
	fcmpeq32	%f12,	%f16,	%i6
	array16	%o6,	%i5,	%i0
	movge	%xcc,	%l0,	%g6
	smulcc	%i3,	0x07DC,	%g7
	ld	[%l7 + 0x78],	%f5
	orn	%i2,	%l5,	%g1
	fornot1s	%f1,	%f8,	%f4
	alignaddr	%o7,	%g3,	%o2
	fcmpgt16	%f20,	%f26,	%l6
	orncc	%g2,	0x1763,	%i7
	popc	0x193B,	%o5
	bshuffle	%f14,	%f24,	%f0
	ldsb	[%l7 + 0x6D],	%l4
	fpackfix	%f28,	%f18
	andncc	%l3,	%g5,	%o0
	smul	%i1,	0x0BBE,	%i4
	alignaddrl	%g4,	%l1,	%l2
	nop
	set	0x14, %o3
	stw	%o3,	[%l7 + %o3]
	save %o1, 0x0FA4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o4,	%i5,	%o6
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	fandnot2	%f30,	%f10,	%f0
	movrgez	%i3,	%g7,	%g6
	xorcc	%i2,	%g1,	%o7
	edge8	%l5,	%o2,	%l6
	nop
	set	0x0C, %o6
	lduh	[%l7 + %o6],	%g2
	sdiv	%g3,	0x0831,	%i7
	smulcc	%l4,	0x0184,	%l3
	subc	%g5,	0x1F71,	%o0
	edge8	%i1,	%o5,	%g4
	ldsw	[%l7 + 0x20],	%i4
	ld	[%l7 + 0x0C],	%f2
	edge16	%l2,	%o3,	%l1
	subcc	%i6,	%o1,	%i5
	nop
	set	0x76, %g2
	lduh	[%l7 + %g2],	%o4
	subcc	%l0,	0x0C4D,	%o6
	srl	%i0,	%i3,	%g6
	edge8n	%i2,	%g7,	%o7
	fornot2	%f24,	%f30,	%f30
	stw	%l5,	[%l7 + 0x0C]
	movrne	%g1,	%l6,	%o2
	xnorcc	%g2,	%i7,	%g3
	srlx	%l4,	%g5,	%l3
	pdist	%f12,	%f20,	%f28
	andn	%i1,	%o5,	%g4
	mulx	%o0,	0x1B12,	%l2
	movvs	%xcc,	%o3,	%i4
	fcmple32	%f20,	%f26,	%l1
	sll	%i6,	0x1B,	%i5
	fandnot2s	%f3,	%f19,	%f0
	fsrc1	%f28,	%f8
	orcc	%o4,	0x07BC,	%o1
	srlx	%l0,	0x04,	%i0
	sth	%i3,	[%l7 + 0x7E]
	sra	%o6,	0x04,	%i2
	movgu	%xcc,	%g6,	%g7
	movrgez	%l5,	0x1BA,	%g1
	movcs	%icc,	%o7,	%o2
	movrlez	%g2,	%l6,	%i7
	srlx	%l4,	%g5,	%g3
	fmovrde	%i1,	%f6,	%f16
	edge32n	%l3,	%g4,	%o0
	xnor	%l2,	0x1788,	%o3
	fmuld8sux16	%f16,	%f17,	%f20
	fmovsgu	%xcc,	%f7,	%f1
	sdivcc	%i4,	0x1786,	%o5
	popc	%l1,	%i6
	fcmpne16	%f14,	%f0,	%o4
	umulcc	%o1,	%l0,	%i0
	fmul8x16	%f23,	%f30,	%f10
	or	%i3,	0x0BF2,	%i5
	sub	%i2,	0x0B2F,	%g6
	movcc	%icc,	%g7,	%o6
	udivcc	%g1,	0x1482,	%l5
	udiv	%o2,	0x13EF,	%g2
	or	%o7,	0x005D,	%l6
	movpos	%xcc,	%i7,	%g5
	xorcc	%l4,	0x087B,	%g3
	or	%i1,	%g4,	%l3
	movge	%icc,	%l2,	%o3
	movrgz	%o0,	0x3F4,	%i4
	andn	%o5,	%i6,	%o4
	orn	%o1,	%l1,	%i0
	sdivcc	%l0,	0x1076,	%i5
	bshuffle	%f18,	%f0,	%f30
	addccc	%i3,	%i2,	%g7
	ldd	[%l7 + 0x68],	%f6
	orn	%o6,	0x0042,	%g6
	udivcc	%g1,	0x12F9,	%l5
	alignaddrl	%g2,	%o7,	%o2
	movrlz	%l6,	%i7,	%l4
	st	%f6,	[%l7 + 0x60]
	fcmpne32	%f26,	%f18,	%g3
	movre	%g5,	0x3F5,	%i1
	edge8l	%l3,	%g4,	%o3
	sllx	%o0,	%i4,	%l2
	or	%o5,	%o4,	%i6
	umulcc	%l1,	%i0,	%l0
	mulx	%o1,	%i5,	%i2
	fsrc1s	%f13,	%f0
	fmovrsne	%g7,	%f16,	%f16
	edge32n	%i3,	%o6,	%g1
	sdivcc	%l5,	0x0DCC,	%g2
	xorcc	%g6,	%o7,	%o2
	movpos	%icc,	%l6,	%l4
	xnorcc	%i7,	0x0CBC,	%g3
	fmovdvc	%xcc,	%f18,	%f3
	movrlez	%g5,	%i1,	%l3
	ldsw	[%l7 + 0x70],	%g4
	sll	%o0,	0x1E,	%o3
	addccc	%l2,	0x1C41,	%o5
	fmovsneg	%icc,	%f8,	%f14
	edge16n	%o4,	%i6,	%l1
	array32	%i4,	%l0,	%o1
	umul	%i5,	0x0104,	%i0
	array8	%g7,	%i2,	%o6
	add	%g1,	%i3,	%g2
	movrlez	%l5,	%o7,	%o2
	subccc	%g6,	0x1B1C,	%l6
	fmovrdgez	%l4,	%f2,	%f30
	movne	%icc,	%g3,	%i7
	umul	%g5,	0x19DC,	%i1
	sdivx	%l3,	0x15BA,	%g4
	sllx	%o3,	0x0A,	%l2
	edge8l	%o5,	%o4,	%i6
	ldsh	[%l7 + 0x60],	%l1
	fmovse	%xcc,	%f22,	%f2
	subcc	%o0,	0x1624,	%i4
	edge32ln	%l0,	%o1,	%i0
	fcmped	%fcc1,	%f6,	%f28
	movl	%icc,	%i5,	%g7
	array32	%i2,	%g1,	%i3
	edge32n	%g2,	%o6,	%o7
	fmovdl	%xcc,	%f17,	%f29
	ldd	[%l7 + 0x50],	%o2
	std	%f18,	[%l7 + 0x78]
	array32	%g6,	%l5,	%l4
	orcc	%l6,	0x19D1,	%i7
	fmovsgu	%icc,	%f8,	%f17
	fnegd	%f18,	%f8
	movne	%xcc,	%g3,	%i1
	ldsh	[%l7 + 0x08],	%l3
	fxnor	%f30,	%f28,	%f4
	edge32	%g4,	%o3,	%l2
	movne	%icc,	%g5,	%o4
	nop
	set	0x78, %g3
	ldd	[%l7 + %g3],	%o4
	edge8	%l1,	%o0,	%i6
	ld	[%l7 + 0x10],	%f19
	fpadd16s	%f26,	%f26,	%f23
	restore %i4, %l0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i0,	0x10,	%g7
	fmovdpos	%xcc,	%f18,	%f25
	movcs	%xcc,	%i2,	%i5
	array16	%i3,	%g2,	%o6
	movle	%xcc,	%g1,	%o2
	fmovrslez	%o7,	%f30,	%f20
	stx	%l5,	[%l7 + 0x10]
	movvc	%xcc,	%g6,	%l6
	stx	%i7,	[%l7 + 0x78]
	udivx	%g3,	0x120F,	%l4
	xorcc	%i1,	0x0FF2,	%g4
	movg	%icc,	%o3,	%l2
	edge8ln	%g5,	%o4,	%l3
	fpsub32s	%f3,	%f0,	%f19
	fmovdvc	%icc,	%f27,	%f17
	popc	0x0175,	%l1
	addc	%o0,	%o5,	%i6
	edge8ln	%i4,	%l0,	%i0
	fzero	%f10
	subcc	%o1,	0x122A,	%i2
	movne	%icc,	%g7,	%i5
	fmovrsgez	%g2,	%f1,	%f17
	ld	[%l7 + 0x5C],	%f0
	edge32	%o6,	%i3,	%o2
	edge8	%g1,	%o7,	%l5
	stw	%l6,	[%l7 + 0x6C]
	movne	%icc,	%i7,	%g6
	edge16n	%g3,	%i1,	%g4
	st	%f30,	[%l7 + 0x44]
	smulcc	%o3,	0x0D58,	%l2
	sub	%l4,	%o4,	%l3
	fmovsneg	%icc,	%f20,	%f16
	nop
	set	0x30, %i7
	stx	%g5,	[%l7 + %i7]
	sra	%l1,	%o0,	%i6
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	move	%xcc,	%o1,	%i2
	smulcc	%i0,	%g7,	%i5
	movcs	%xcc,	%o6,	%g2
	movrne	%i3,	0x01B,	%o2
	edge8ln	%g1,	%l5,	%o7
	edge16ln	%l6,	%g6,	%g3
	lduw	[%l7 + 0x7C],	%i7
	smulcc	%g4,	0x1CF2,	%o3
	fnegs	%f3,	%f6
	fmovspos	%xcc,	%f28,	%f23
	fandnot1	%f14,	%f26,	%f28
	fmovrdne	%i1,	%f0,	%f24
	andncc	%l2,	%o4,	%l4
	umulcc	%g5,	0x1DB2,	%l3
	movne	%icc,	%l1,	%i6
	mulx	%o0,	0x09D1,	%l0
	array32	%i4,	%o5,	%o1
	sdivcc	%i2,	0x1F8B,	%i0
	sdiv	%g7,	0x0626,	%i5
	movvc	%icc,	%g2,	%o6
	ldsb	[%l7 + 0x64],	%o2
	fsrc1	%f30,	%f4
	array32	%i3,	%l5,	%g1
	fmovde	%xcc,	%f24,	%f29
	ldd	[%l7 + 0x50],	%f6
	array16	%o7,	%g6,	%l6
	fmovscs	%xcc,	%f16,	%f26
	movrgz	%i7,	0x3F8,	%g4
	ldd	[%l7 + 0x68],	%f30
	sdivcc	%g3,	0x1E85,	%i1
	ldsw	[%l7 + 0x44],	%l2
	xnorcc	%o3,	%l4,	%o4
	fcmpgt32	%f18,	%f22,	%l3
	movg	%icc,	%g5,	%l1
	fmovda	%icc,	%f22,	%f4
	ldd	[%l7 + 0x70],	%o0
	edge16	%l0,	%i4,	%o5
	save %i6, 0x0CC1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i0,	0x162E,	%i2
	sll	%i5,	0x14,	%g2
	xnorcc	%g7,	0x13D1,	%o2
	std	%f24,	[%l7 + 0x08]
	andncc	%i3,	%l5,	%o6
	udiv	%g1,	0x16E0,	%o7
	stw	%g6,	[%l7 + 0x4C]
	popc	%i7,	%l6
	or	%g4,	0x0B4C,	%g3
	movl	%icc,	%i1,	%o3
	orcc	%l4,	%o4,	%l2
	addccc	%g5,	0x09A9,	%l1
	fmul8sux16	%f8,	%f2,	%f14
	fmul8sux16	%f0,	%f0,	%f18
	edge16	%o0,	%l3,	%l0
	ld	[%l7 + 0x28],	%f1
	movcs	%icc,	%i4,	%o5
	movrne	%o1,	%i0,	%i6
	mulscc	%i5,	%g2,	%i2
	fcmpgt32	%f26,	%f20,	%g7
	subccc	%i3,	%o2,	%l5
	edge32n	%g1,	%o7,	%g6
	st	%f7,	[%l7 + 0x44]
	ldd	[%l7 + 0x08],	%o6
	std	%f6,	[%l7 + 0x40]
	movne	%xcc,	%l6,	%i7
	edge32n	%g3,	%g4,	%i1
	fmovdl	%icc,	%f24,	%f24
	umul	%l4,	%o4,	%o3
	alignaddrl	%g5,	%l2,	%l1
	fpackfix	%f4,	%f3
	edge8	%o0,	%l3,	%l0
	fcmpne16	%f22,	%f12,	%i4
	sdivx	%o5,	0x00E1,	%i0
	movrgez	%i6,	%o1,	%i5
	st	%f8,	[%l7 + 0x10]
	mulx	%i2,	0x165A,	%g7
	fmovdle	%xcc,	%f24,	%f6
	fcmple32	%f12,	%f22,	%g2
	xnor	%i3,	%o2,	%g1
	movrlz	%l5,	0x27C,	%o7
	mulx	%g6,	%l6,	%i7
	movrne	%o6,	%g3,	%i1
	edge16l	%l4,	%g4,	%o4
	fmovdn	%icc,	%f23,	%f6
	sdiv	%g5,	0x156B,	%l2
	lduh	[%l7 + 0x18],	%l1
	movge	%xcc,	%o0,	%l3
	subccc	%o3,	0x1AF3,	%l0
	movneg	%icc,	%i4,	%o5
	orncc	%i0,	%i6,	%i5
	udiv	%o1,	0x07A1,	%g7
	fcmple16	%f10,	%f12,	%i2
	movgu	%xcc,	%g2,	%o2
	orcc	%i3,	0x0AC4,	%l5
	fmovdpos	%icc,	%f12,	%f22
	ldx	[%l7 + 0x28],	%g1
	fmovrse	%o7,	%f4,	%f11
	edge16ln	%l6,	%g6,	%i7
	subcc	%g3,	%i1,	%o6
	andncc	%g4,	%o4,	%l4
	edge32l	%l2,	%l1,	%g5
	mulx	%o0,	%o3,	%l3
	ldd	[%l7 + 0x58],	%f24
	udivx	%l0,	0x168D,	%i4
	ldd	[%l7 + 0x70],	%o4
	addccc	%i0,	%i6,	%i5
	sethi	0x0505,	%o1
	sll	%i2,	0x06,	%g7
	subc	%g2,	0x0A38,	%i3
	array32	%o2,	%g1,	%l5
	restore %l6, %g6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x6
	fnot2	%f22,	%f24
	lduw	[%l7 + 0x28],	%i7
	ldsh	[%l7 + 0x6A],	%g3
	edge32	%i1,	%g4,	%o4
	fxor	%f28,	%f8,	%f20
	movre	%o6,	%l4,	%l2
	movvc	%xcc,	%l1,	%g5
	stb	%o0,	[%l7 + 0x17]
	xor	%l3,	%l0,	%o3
	fmovrdlz	%o5,	%f22,	%f20
	umul	%i0,	0x1A19,	%i6
	stw	%i4,	[%l7 + 0x10]
	fmovdcs	%xcc,	%f19,	%f18
	stw	%o1,	[%l7 + 0x78]
	edge32l	%i5,	%g7,	%g2
	fnor	%f2,	%f10,	%f28
	alignaddrl	%i2,	%i3,	%o2
	movcs	%xcc,	%l5,	%l6
	sdivx	%g6,	0x0FEB,	%o7
	ldx	[%l7 + 0x38],	%g1
	or	%g3,	%i7,	%i1
	edge16n	%g4,	%o4,	%o6
	sllx	%l4,	0x19,	%l1
	xnorcc	%l2,	%g5,	%l3
	fmul8sux16	%f6,	%f24,	%f14
	smul	%o0,	%o3,	%o5
	movcc	%icc,	%l0,	%i0
	sllx	%i4,	%i6,	%o1
	fxor	%f4,	%f6,	%f26
	mulx	%g7,	%i5,	%i2
	for	%f26,	%f28,	%f28
	addcc	%g2,	0x1121,	%i3
	fmovsgu	%xcc,	%f16,	%f26
	fandnot2	%f2,	%f12,	%f14
	fmovdleu	%icc,	%f20,	%f25
	fpsub32s	%f15,	%f19,	%f30
	movcs	%xcc,	%o2,	%l6
	ldsw	[%l7 + 0x78],	%l5
	movn	%xcc,	%g6,	%g1
	movg	%icc,	%g3,	%o7
	edge32	%i1,	%i7,	%g4
	udivx	%o6,	0x1EE2,	%l4
	mova	%icc,	%l1,	%l2
	movrgz	%o4,	%l3,	%o0
	fpsub32	%f2,	%f12,	%f6
	fmovsne	%icc,	%f5,	%f5
	array16	%g5,	%o3,	%o5
	fnand	%f2,	%f26,	%f0
	nop
	set	0x72, %l1
	sth	%i0,	[%l7 + %l1]
	fmovdg	%xcc,	%f11,	%f15
	fmovrdgz	%l0,	%f24,	%f0
	movneg	%icc,	%i6,	%o1
	ldd	[%l7 + 0x60],	%g6
	movpos	%icc,	%i5,	%i2
	edge16	%g2,	%i4,	%i3
	fmovdle	%xcc,	%f12,	%f17
	fnand	%f24,	%f22,	%f16
	edge32l	%o2,	%l5,	%l6
	stw	%g6,	[%l7 + 0x68]
	fmovsge	%icc,	%f6,	%f16
	sub	%g3,	%o7,	%g1
	movg	%xcc,	%i1,	%g4
	fmovrdlz	%i7,	%f8,	%f26
	sllx	%o6,	0x14,	%l4
	orn	%l2,	0x0D25,	%o4
	addccc	%l1,	%l3,	%g5
	andn	%o3,	0x187D,	%o5
	addc	%o0,	%l0,	%i0
	fmovsneg	%icc,	%f19,	%f17
	srax	%o1,	0x14,	%i6
	movge	%icc,	%i5,	%g7
	alignaddrl	%g2,	%i2,	%i4
	fzero	%f18
	udivcc	%i3,	0x117F,	%l5
	or	%o2,	%g6,	%g3
	udivx	%l6,	0x02D8,	%o7
	fmovda	%icc,	%f28,	%f29
	sub	%g1,	0x0314,	%g4
	udivx	%i1,	0x0D8D,	%i7
	stb	%l4,	[%l7 + 0x2A]
	fmovde	%xcc,	%f15,	%f18
	udivcc	%o6,	0x1CB6,	%o4
	fmul8ulx16	%f26,	%f0,	%f18
	movleu	%xcc,	%l1,	%l2
	movn	%xcc,	%g5,	%l3
	smul	%o3,	0x1B78,	%o0
	fmovda	%xcc,	%f26,	%f26
	andn	%l0,	0x12F2,	%i0
	edge8ln	%o1,	%o5,	%i6
	alignaddr	%i5,	%g2,	%g7
	movgu	%icc,	%i2,	%i3
	fmuld8ulx16	%f24,	%f0,	%f12
	movcs	%icc,	%l5,	%i4
	edge32l	%o2,	%g3,	%g6
	fmovrsgez	%l6,	%f31,	%f13
	edge16ln	%g1,	%g4,	%o7
	fandnot1s	%f21,	%f3,	%f21
	fpadd16s	%f11,	%f21,	%f21
	fpadd32s	%f4,	%f29,	%f24
	movn	%xcc,	%i1,	%i7
	orncc	%o6,	0x12D8,	%l4
	ldsb	[%l7 + 0x75],	%o4
	orcc	%l1,	%g5,	%l2
	ldx	[%l7 + 0x28],	%o3
	srlx	%l3,	%l0,	%o0
	subccc	%i0,	%o5,	%o1
	fandnot2s	%f31,	%f9,	%f21
	fornot1	%f26,	%f14,	%f4
	ldd	[%l7 + 0x70],	%f8
	movre	%i6,	%i5,	%g7
	movne	%icc,	%g2,	%i2
	save %l5, %i4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o2,	%g3
	edge16ln	%l6,	%g1,	%g4
	fmovdg	%xcc,	%f18,	%f20
	fmovdpos	%xcc,	%f12,	%f1
	xnorcc	%o7,	%i1,	%g6
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	std	%f16,	[%l7 + 0x78]
	fmovsn	%xcc,	%f3,	%f25
	fmovrse	%l1,	%f20,	%f1
	movgu	%xcc,	%o6,	%g5
	save %o3, %l3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x2C, %i5
	lduh	[%l7 + %i5],	%l0
	edge8	%o0,	%o5,	%o1
	fmuld8sux16	%f31,	%f2,	%f22
	fmovsge	%xcc,	%f31,	%f13
	edge32ln	%i0,	%i5,	%i6
	movge	%xcc,	%g7,	%g2
	movl	%xcc,	%l5,	%i2
	sllx	%i4,	0x12,	%i3
	array8	%g3,	%l6,	%g1
	edge32	%o2,	%g4,	%o7
	movrne	%g6,	0x3C8,	%i7
	fpadd32s	%f18,	%f16,	%f20
	array16	%l4,	%o4,	%i1
	fpackfix	%f28,	%f15
	smulcc	%l1,	0x028E,	%o6
	sdivx	%g5,	0x0040,	%o3
	movleu	%icc,	%l2,	%l0
	fmovse	%xcc,	%f28,	%f16
	fmovscs	%xcc,	%f5,	%f28
	fmul8x16al	%f5,	%f8,	%f14
	sdiv	%o0,	0x197B,	%l3
	movre	%o5,	%o1,	%i0
	ldd	[%l7 + 0x08],	%i6
	udivx	%g7,	0x0DA1,	%i5
	fxor	%f2,	%f8,	%f8
	movvs	%icc,	%g2,	%i2
	fmovsle	%xcc,	%f0,	%f10
	fsrc2s	%f8,	%f10
	st	%f3,	[%l7 + 0x74]
	orn	%l5,	%i3,	%g3
	sub	%l6,	0x0108,	%g1
	smulcc	%o2,	%i4,	%g4
	edge32n	%g6,	%o7,	%l4
	umulcc	%o4,	%i1,	%i7
	stw	%l1,	[%l7 + 0x18]
	orcc	%o6,	%o3,	%l2
	fnegs	%f2,	%f24
	array8	%g5,	%l0,	%o0
	move	%icc,	%o5,	%o1
	edge32n	%i0,	%i6,	%g7
	or	%l3,	%i5,	%i2
	fpsub16s	%f30,	%f5,	%f20
	fandnot2s	%f29,	%f19,	%f5
	addccc	%l5,	%g2,	%g3
	fpack16	%f16,	%f7
	fmovscs	%icc,	%f16,	%f22
	addcc	%l6,	%i3,	%g1
	fmovrsgz	%o2,	%f29,	%f5
	movrlz	%g4,	0x090,	%g6
	move	%xcc,	%o7,	%l4
	movrgz	%o4,	0x004,	%i4
	fmovrsne	%i1,	%f12,	%f15
	movrlez	%i7,	0x081,	%l1
	sdiv	%o3,	0x0601,	%l2
	sub	%o6,	%l0,	%g5
	edge8	%o0,	%o1,	%i0
	xnorcc	%i6,	%o5,	%l3
	lduw	[%l7 + 0x60],	%i5
	movg	%icc,	%g7,	%i2
	movre	%g2,	%g3,	%l5
	movg	%xcc,	%i3,	%l6
	fcmped	%fcc3,	%f20,	%f12
	mulscc	%o2,	0x1B19,	%g1
	movne	%icc,	%g6,	%g4
	fcmpd	%fcc1,	%f10,	%f20
	fornot1s	%f21,	%f16,	%f15
	fcmpgt16	%f26,	%f14,	%o7
	fands	%f11,	%f3,	%f11
	udivcc	%o4,	0x0DDB,	%i4
	ldsh	[%l7 + 0x08],	%l4
	xorcc	%i1,	%i7,	%o3
	mulscc	%l1,	0x0721,	%o6
	fmovdgu	%xcc,	%f8,	%f23
	ldsb	[%l7 + 0x72],	%l2
	umulcc	%g5,	0x1B5F,	%l0
	andcc	%o1,	0x0A7B,	%o0
	edge32l	%i0,	%i6,	%l3
	fnand	%f6,	%f10,	%f8
	xnorcc	%o5,	0x1357,	%i5
	fpsub16s	%f9,	%f0,	%f20
	edge8ln	%i2,	%g2,	%g7
	subc	%l5,	%g3,	%i3
	edge16ln	%o2,	%g1,	%l6
	fcmpes	%fcc3,	%f23,	%f22
	sdivcc	%g4,	0x0086,	%g6
	fmovrdlz	%o4,	%f6,	%f28
	movgu	%icc,	%i4,	%l4
	save %i1, %o7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	0x0A,	%o6
	movvc	%xcc,	%l1,	%l2
	alignaddrl	%l0,	%g5,	%o0
	subcc	%o1,	%i0,	%i6
	movl	%icc,	%o5,	%l3
	udivx	%i5,	0x1C8B,	%i2
	fmovrse	%g2,	%f21,	%f5
	edge8l	%g7,	%g3,	%i3
	fpmerge	%f7,	%f3,	%f20
	fxnor	%f18,	%f28,	%f12
	sra	%o2,	0x00,	%l5
	edge32ln	%g1,	%l6,	%g4
	movre	%g6,	%o4,	%i4
	edge16ln	%i1,	%l4,	%o7
	movl	%icc,	%i7,	%o3
	nop
	set	0x0A, %i6
	ldub	[%l7 + %i6],	%l1
	sra	%o6,	%l0,	%l2
	srl	%g5,	%o1,	%i0
	move	%icc,	%i6,	%o0
	movne	%xcc,	%l3,	%o5
	edge32l	%i5,	%i2,	%g2
	movvc	%xcc,	%g3,	%i3
	andcc	%o2,	%l5,	%g1
	fmovsn	%icc,	%f21,	%f28
	movl	%icc,	%l6,	%g7
	ldsh	[%l7 + 0x76],	%g4
	movleu	%icc,	%g6,	%o4
	movcc	%xcc,	%i1,	%i4
	add	%l4,	%i7,	%o7
	st	%f30,	[%l7 + 0x20]
	fmovsg	%xcc,	%f2,	%f31
	std	%f6,	[%l7 + 0x40]
	fpsub16	%f30,	%f24,	%f0
	srl	%l1,	%o3,	%l0
	movle	%xcc,	%o6,	%g5
	ldx	[%l7 + 0x60],	%o1
	edge8n	%i0,	%l2,	%i6
	fcmpne32	%f4,	%f16,	%l3
	fandnot2s	%f10,	%f7,	%f17
	ldx	[%l7 + 0x58],	%o0
	subc	%i5,	0x1ED7,	%o5
	fmuld8sux16	%f0,	%f18,	%f4
	bshuffle	%f6,	%f0,	%f28
	array16	%g2,	%g3,	%i2
	lduh	[%l7 + 0x2C],	%i3
	fmovdle	%xcc,	%f16,	%f10
	ldub	[%l7 + 0x7B],	%o2
	sra	%l5,	0x10,	%g1
	alignaddrl	%l6,	%g7,	%g4
	smul	%o4,	0x1623,	%g6
	fzeros	%f21
	fmovsg	%icc,	%f16,	%f7
	srl	%i4,	0x12,	%i1
	andncc	%l4,	%o7,	%i7
	and	%o3,	%l0,	%l1
	smul	%o6,	0x0F13,	%o1
	movge	%icc,	%g5,	%l2
	sllx	%i6,	0x00,	%i0
	sdiv	%o0,	0x0E4F,	%l3
	edge8l	%o5,	%g2,	%i5
	edge8l	%g3,	%i2,	%i3
	sdivcc	%o2,	0x1654,	%l5
	sdivx	%l6,	0x0413,	%g7
	sth	%g4,	[%l7 + 0x7C]
	udivcc	%g1,	0x1A56,	%g6
	stb	%o4,	[%l7 + 0x38]
	fnegs	%f3,	%f20
	edge32ln	%i1,	%i4,	%l4
	movrlz	%o7,	%i7,	%o3
	array8	%l1,	%l0,	%o6
	fmovsge	%xcc,	%f0,	%f24
	ld	[%l7 + 0x4C],	%f3
	addccc	%o1,	0x0422,	%l2
	srax	%i6,	0x11,	%g5
	fmul8x16au	%f3,	%f9,	%f0
	stb	%i0,	[%l7 + 0x19]
	add	%o0,	%o5,	%g2
	fpack32	%f2,	%f0,	%f6
	ldd	[%l7 + 0x18],	%l2
	alignaddr	%i5,	%i2,	%i3
	lduh	[%l7 + 0x6E],	%g3
	movvc	%icc,	%o2,	%l5
	array32	%l6,	%g4,	%g7
	mulscc	%g1,	0x15BE,	%g6
	edge32l	%o4,	%i4,	%l4
	udiv	%o7,	0x105B,	%i7
	nop
	set	0x24, %g5
	ldsh	[%l7 + %g5],	%o3
	smulcc	%l1,	0x0EB2,	%l0
	alignaddr	%o6,	%i1,	%l2
	movrlz	%i6,	%o1,	%g5
	ldx	[%l7 + 0x60],	%o0
	udivx	%i0,	0x17BE,	%g2
	nop
	set	0x10, %o1
	stx	%l3,	[%l7 + %o1]
	edge32l	%i5,	%o5,	%i3
	orcc	%g3,	0x1890,	%i2
	array16	%l5,	%o2,	%l6
	edge32ln	%g4,	%g7,	%g6
	or	%g1,	0x0874,	%o4
	fmovrdgez	%l4,	%f16,	%f20
	udivcc	%i4,	0x11EC,	%i7
	nop
	set	0x3C, %o4
	ldub	[%l7 + %o4],	%o3
	fmovsle	%xcc,	%f24,	%f0
	fone	%f28
	st	%f20,	[%l7 + 0x70]
	subc	%o7,	0x1D55,	%l0
	fmovdl	%xcc,	%f26,	%f9
	andncc	%l1,	%i1,	%o6
	umul	%l2,	0x02AF,	%i6
	orcc	%g5,	0x08EC,	%o1
	or	%i0,	%o0,	%g2
	save %i5, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x10],	%f8
	fmovdg	%icc,	%f21,	%f28
	edge32l	%g3,	%l3,	%i2
	lduh	[%l7 + 0x26],	%o2
	orn	%l6,	%g4,	%l5
	ld	[%l7 + 0x0C],	%f6
	movrlez	%g7,	%g1,	%o4
	move	%icc,	%l4,	%g6
	ld	[%l7 + 0x20],	%f0
	movcc	%icc,	%i4,	%o3
	fmovsvs	%icc,	%f21,	%f19
	movgu	%icc,	%o7,	%i7
	save %l0, 0x0BFD, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o6,	0x0226,	%l2
	edge8ln	%i6,	%i1,	%g5
	fmovscs	%icc,	%f11,	%f4
	andcc	%i0,	0x1A71,	%o1
	sub	%g2,	0x0F87,	%o0
	fmovs	%f21,	%f3
	st	%f20,	[%l7 + 0x6C]
	movle	%xcc,	%o5,	%i3
	fpadd32	%f22,	%f2,	%f18
	movrne	%g3,	%i5,	%i2
	edge16n	%o2,	%l3,	%g4
	sir	0x139D
	ld	[%l7 + 0x30],	%f11
	edge8n	%l6,	%l5,	%g1
	andncc	%g7,	%l4,	%g6
	edge16n	%i4,	%o3,	%o4
	fpsub32	%f18,	%f14,	%f0
	movrlz	%i7,	%l0,	%l1
	stb	%o6,	[%l7 + 0x3E]
	fmovscc	%icc,	%f22,	%f27
	array16	%l2,	%o7,	%i1
	edge8ln	%g5,	%i0,	%i6
	ld	[%l7 + 0x5C],	%f8
	nop
	set	0x10, %g4
	std	%f26,	[%l7 + %g4]
	add	%g2,	0x13EC,	%o1
	fmovse	%icc,	%f7,	%f1
	movne	%xcc,	%o5,	%o0
	umul	%g3,	%i3,	%i2
	fand	%f8,	%f22,	%f0
	fpsub16s	%f15,	%f24,	%f2
	sdivx	%o2,	0x06A9,	%l3
	fpadd16	%f18,	%f10,	%f30
	edge8n	%g4,	%i5,	%l5
	xorcc	%g1,	%g7,	%l4
	and	%g6,	0x0F9A,	%i4
	alignaddrl	%o3,	%l6,	%o4
	movvs	%xcc,	%i7,	%l0
	lduh	[%l7 + 0x76],	%o6
	fmovspos	%xcc,	%f11,	%f0
	subccc	%l2,	0x1F93,	%l1
	fpack32	%f24,	%f10,	%f14
	movgu	%xcc,	%i1,	%o7
	smulcc	%i0,	0x0485,	%g5
	movre	%i6,	0x2E3,	%g2
	alignaddrl	%o5,	%o0,	%o1
	movl	%icc,	%g3,	%i2
	sdivcc	%o2,	0x12BE,	%i3
	andncc	%l3,	%i5,	%g4
	orncc	%l5,	%g7,	%g1
	umul	%l4,	%g6,	%o3
	fmovdle	%icc,	%f6,	%f5
	movn	%xcc,	%l6,	%i4
	movre	%o4,	%l0,	%o6
	udiv	%i7,	0x1C62,	%l2
	edge8n	%i1,	%o7,	%l1
	edge32ln	%g5,	%i0,	%g2
	movcc	%xcc,	%o5,	%i6
	movle	%xcc,	%o1,	%g3
	fmovsn	%xcc,	%f23,	%f17
	fmuld8sux16	%f16,	%f28,	%f18
	xnorcc	%o0,	%i2,	%i3
	udivcc	%o2,	0x15AB,	%l3
	sethi	0x093A,	%g4
	movge	%icc,	%i5,	%l5
	fcmpne32	%f10,	%f18,	%g1
	fnot2s	%f1,	%f7
	andncc	%g7,	%g6,	%l4
	movrlez	%l6,	0x03C,	%o3
	smulcc	%o4,	0x08D3,	%l0
	movcc	%xcc,	%o6,	%i4
	movgu	%icc,	%l2,	%i1
	smulcc	%o7,	0x0783,	%l1
	sllx	%i7,	0x1E,	%g5
	srlx	%g2,	0x1E,	%i0
	ldsw	[%l7 + 0x68],	%i6
	sir	0x164E
	movcs	%icc,	%o5,	%o1
	sra	%g3,	0x1D,	%i2
	orncc	%o0,	%i3,	%l3
	movvc	%xcc,	%g4,	%i5
	ldd	[%l7 + 0x78],	%o2
	addc	%l5,	%g7,	%g1
	movg	%xcc,	%g6,	%l4
	fxnors	%f26,	%f20,	%f29
	fabsd	%f20,	%f20
	movcs	%xcc,	%l6,	%o4
	ld	[%l7 + 0x48],	%f0
	movrgz	%l0,	0x102,	%o6
	udivcc	%i4,	0x0532,	%o3
	movrlez	%i1,	%l2,	%o7
	movrlz	%l1,	%g5,	%g2
	addc	%i7,	0x11D8,	%i0
	mulx	%o5,	%i6,	%o1
	fcmple32	%f0,	%f0,	%g3
	movcs	%xcc,	%i2,	%i3
	orcc	%o0,	%g4,	%l3
	nop
	set	0x6A, %g1
	lduh	[%l7 + %g1],	%o2
	stw	%l5,	[%l7 + 0x48]
	st	%f2,	[%l7 + 0x38]
	array16	%i5,	%g1,	%g7
	edge8ln	%g6,	%l6,	%l4
	andncc	%o4,	%o6,	%i4
	movre	%o3,	0x10F,	%l0
	ldd	[%l7 + 0x10],	%f0
	sll	%l2,	0x05,	%o7
	ldd	[%l7 + 0x20],	%i0
	movneg	%xcc,	%l1,	%g5
	movrlz	%g2,	0x2D2,	%i0
	alignaddrl	%i7,	%i6,	%o5
	movl	%xcc,	%o1,	%i2
	orncc	%g3,	0x086B,	%o0
	subc	%i3,	%l3,	%g4
	add	%l5,	%i5,	%o2
	st	%f25,	[%l7 + 0x18]
	array16	%g7,	%g1,	%l6
	sdivcc	%g6,	0x1A1F,	%l4
	fmovdge	%xcc,	%f1,	%f17
	edge32	%o6,	%o4,	%o3
	sra	%i4,	0x1F,	%l2
	fmovsn	%icc,	%f18,	%f7
	movrlez	%o7,	%l0,	%l1
	movge	%icc,	%i1,	%g2
	sdivcc	%g5,	0x0D69,	%i7
	restore %i0, %i6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i2,	%o1,	%g3
	subcc	%i3,	%l3,	%o0
	movg	%icc,	%l5,	%i5
	ldsh	[%l7 + 0x14],	%o2
	umul	%g4,	%g1,	%l6
	and	%g6,	%l4,	%g7
	nop
	set	0x68, %l0
	ldx	[%l7 + %l0],	%o6
	fcmped	%fcc2,	%f2,	%f14
	fabsd	%f18,	%f24
	or	%o3,	0x1A44,	%o4
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	sll	%i4,	0x1E,	%l1
	movge	%xcc,	%i1,	%l0
	fmovse	%xcc,	%f7,	%f21
	xnor	%g5,	%g2,	%i7
	fmovsa	%xcc,	%f6,	%f26
	edge32ln	%i6,	%i0,	%i2
	lduw	[%l7 + 0x64],	%o1
	sllx	%g3,	%o5,	%i3
	fmovdvc	%xcc,	%f29,	%f12
	edge16l	%l3,	%l5,	%i5
	sub	%o0,	0x054D,	%o2
	fexpand	%f21,	%f2
	movre	%g1,	0x304,	%g4
	fnegd	%f10,	%f0
	fmovrsgez	%g6,	%f21,	%f21
	fmul8x16au	%f19,	%f10,	%f6
	fcmpgt16	%f20,	%f6,	%l6
	movge	%icc,	%g7,	%l4
	array16	%o6,	%o3,	%o4
	movg	%icc,	%o7,	%l2
	movge	%xcc,	%l1,	%i4
	edge32	%i1,	%g5,	%g2
	subccc	%i7,	%i6,	%l0
	add	%i0,	0x059F,	%i2
	add	%g3,	0x1AF4,	%o5
	udivcc	%i3,	0x17F1,	%o1
	stx	%l3,	[%l7 + 0x08]
	movl	%xcc,	%i5,	%l5
	edge32ln	%o0,	%o2,	%g4
	or	%g1,	0x1F4E,	%g6
	fmovdge	%icc,	%f27,	%f4
	sdivcc	%l6,	0x1736,	%l4
	lduw	[%l7 + 0x58],	%g7
	edge32n	%o3,	%o4,	%o6
	alignaddrl	%l2,	%l1,	%o7
	xnorcc	%i1,	0x18AF,	%g5
	srax	%i4,	%g2,	%i7
	edge8l	%l0,	%i0,	%i6
	xnor	%i2,	0x0FAD,	%o5
	andn	%i3,	0x0A10,	%o1
	edge8ln	%g3,	%l3,	%l5
	subccc	%o0,	0x170F,	%i5
	fpack16	%f18,	%f30
	ld	[%l7 + 0x64],	%f5
	edge32l	%o2,	%g1,	%g4
	lduh	[%l7 + 0x12],	%g6
	umulcc	%l6,	%g7,	%o3
	lduh	[%l7 + 0x30],	%l4
	fcmpeq32	%f28,	%f16,	%o4
	udivcc	%l2,	0x1BE0,	%o6
	stb	%o7,	[%l7 + 0x0A]
	fands	%f29,	%f21,	%f21
	fmovsl	%icc,	%f25,	%f0
	sdivcc	%l1,	0x01F2,	%i1
	fzeros	%f16
	movre	%i4,	0x22A,	%g2
	fmovsg	%icc,	%f22,	%f11
	addc	%i7,	%g5,	%i0
	sir	0x063A
	sll	%l0,	%i6,	%o5
	edge32l	%i3,	%o1,	%g3
	orcc	%l3,	0x16D1,	%l5
	ldsh	[%l7 + 0x34],	%i2
	fmovdge	%xcc,	%f28,	%f7
	movcc	%icc,	%i5,	%o2
	ldx	[%l7 + 0x78],	%o0
	xorcc	%g4,	0x0319,	%g6
	movrlez	%l6,	%g1,	%o3
	ldd	[%l7 + 0x48],	%f2
	movn	%xcc,	%l4,	%o4
	smulcc	%l2,	%g7,	%o6
	sth	%o7,	[%l7 + 0x26]
	subccc	%i1,	%i4,	%l1
	edge16	%i7,	%g5,	%i0
	edge8	%g2,	%i6,	%l0
	movcs	%xcc,	%o5,	%o1
	edge8ln	%i3,	%l3,	%l5
	sdivx	%g3,	0x15AE,	%i2
	fandnot1s	%f29,	%f23,	%f25
	fmovsl	%icc,	%f25,	%f6
	restore %o2, %o0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g6,	0x0AB8,	%l6
	srlx	%g1,	0x13,	%o3
	edge32ln	%i5,	%l4,	%o4
	ldub	[%l7 + 0x65],	%g7
	movre	%o6,	0x0D6,	%l2
	ldsh	[%l7 + 0x32],	%i1
	fcmpne32	%f4,	%f24,	%i4
	std	%f0,	[%l7 + 0x28]
	fmovrsne	%l1,	%f17,	%f15
	fmovdg	%icc,	%f19,	%f13
	lduw	[%l7 + 0x38],	%i7
	subccc	%g5,	0x18A0,	%o7
	fmuld8ulx16	%f2,	%f22,	%f20
	fmovrse	%g2,	%f23,	%f28
	fmovd	%f30,	%f0
	ldsh	[%l7 + 0x52],	%i0
	fmovsneg	%xcc,	%f8,	%f29
	orcc	%l0,	0x1BD7,	%i6
	edge32l	%o1,	%o5,	%i3
	subc	%l5,	%l3,	%i2
	edge16n	%g3,	%o2,	%o0
	addcc	%g6,	%l6,	%g4
	sdivcc	%o3,	0x03F1,	%g1
	movn	%xcc,	%i5,	%l4
	move	%xcc,	%o4,	%o6
	addcc	%l2,	0x1520,	%g7
	alignaddr	%i4,	%i1,	%i7
	movneg	%icc,	%l1,	%o7
	edge16	%g2,	%i0,	%l0
	fmovdgu	%icc,	%f0,	%f17
	fmovdvs	%icc,	%f19,	%f23
	fmovdne	%icc,	%f9,	%f24
	popc	%g5,	%o1
	movvc	%xcc,	%o5,	%i3
	movn	%icc,	%i6,	%l3
	movneg	%xcc,	%i2,	%l5
	fmuld8ulx16	%f9,	%f4,	%f8
	sdivcc	%o2,	0x0083,	%g3
	fone	%f30
	movleu	%xcc,	%o0,	%l6
	xor	%g6,	0x0701,	%g4
	movrlez	%o3,	0x03B,	%g1
	fmovrde	%i5,	%f26,	%f10
	movrgz	%l4,	0x274,	%o4
	movrgz	%o6,	0x02C,	%l2
	fmovdl	%icc,	%f29,	%f25
	andncc	%g7,	%i4,	%i7
	umulcc	%i1,	0x1B91,	%o7
	xor	%g2,	0x035D,	%l1
	sll	%l0,	0x0F,	%g5
	addccc	%i0,	0x1550,	%o5
	addccc	%i3,	%i6,	%o1
	edge32ln	%l3,	%l5,	%o2
	movleu	%icc,	%g3,	%o0
	ldx	[%l7 + 0x48],	%i2
	orn	%g6,	%g4,	%l6
	xorcc	%g1,	0x12E9,	%i5
	ldsb	[%l7 + 0x4C],	%o3
	movne	%xcc,	%l4,	%o6
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	sra	%l2,	%i1,	%o7
	fmovrslz	%g2,	%f13,	%f24
	srax	%l1,	%i7,	%l0
	addccc	%g5,	0x15BA,	%i0
	lduh	[%l7 + 0x48],	%i3
	edge16l	%o5,	%o1,	%l3
	movgu	%icc,	%l5,	%i6
	udiv	%g3,	0x05AD,	%o2
	xnorcc	%o0,	%i2,	%g4
	alignaddrl	%g6,	%l6,	%i5
	move	%xcc,	%o3,	%g1
	xorcc	%l4,	0x169A,	%o6
	std	%f14,	[%l7 + 0x50]
	movvc	%icc,	%o4,	%g7
	srax	%i4,	%i1,	%o7
	movre	%l2,	%l1,	%g2
	movne	%xcc,	%i7,	%g5
	srlx	%l0,	%i3,	%o5
	xor	%o1,	0x1581,	%i0
	fsrc1s	%f5,	%f5
	smulcc	%l5,	0x059A,	%l3
	fmovrsgz	%g3,	%f13,	%f11
	fmovspos	%icc,	%f16,	%f13
	sub	%o2,	%i6,	%o0
	movrne	%g4,	%g6,	%l6
	movcs	%xcc,	%i5,	%o3
	ld	[%l7 + 0x68],	%f5
	movre	%i2,	0x3AB,	%g1
	fexpand	%f3,	%f16
	alignaddrl	%o6,	%l4,	%o4
	lduw	[%l7 + 0x5C],	%i4
	movle	%xcc,	%g7,	%i1
	popc	0x1FD1,	%l2
	sll	%l1,	0x1B,	%o7
	orncc	%g2,	%i7,	%g5
	fone	%f12
	fmovdvs	%icc,	%f22,	%f24
	fxnors	%f8,	%f14,	%f30
	ld	[%l7 + 0x20],	%f25
	smulcc	%i3,	0x1289,	%o5
	or	%l0,	%i0,	%l5
	xnor	%l3,	%g3,	%o1
	sllx	%i6,	0x0C,	%o0
	lduw	[%l7 + 0x74],	%g4
	sir	0x15D4
	udiv	%g6,	0x1C59,	%o2
	fnot1s	%f20,	%f17
	sllx	%l6,	%i5,	%i2
	st	%f27,	[%l7 + 0x7C]
	srlx	%g1,	%o6,	%l4
	edge32	%o4,	%i4,	%g7
	smulcc	%i1,	%l2,	%l1
	edge32ln	%o3,	%g2,	%o7
	movpos	%icc,	%g5,	%i7
	stx	%i3,	[%l7 + 0x38]
	ldsh	[%l7 + 0x2E],	%o5
	ldub	[%l7 + 0x79],	%i0
	edge8n	%l0,	%l3,	%l5
	fmovsle	%icc,	%f18,	%f3
	popc	0x0007,	%g3
	ldsh	[%l7 + 0x10],	%i6
	subc	%o0,	0x186C,	%o1
	fnot1s	%f22,	%f13
	movrlz	%g6,	%o2,	%l6
	edge8l	%i5,	%g4,	%i2
	fmovsge	%icc,	%f14,	%f19
	xnorcc	%g1,	%l4,	%o4
	addc	%i4,	0x13EB,	%g7
	ldsh	[%l7 + 0x6A],	%o6
	movrgz	%l2,	0x1BA,	%i1
	fornot1	%f28,	%f24,	%f18
	edge16ln	%l1,	%g2,	%o3
	sir	0x0BDD
	ldub	[%l7 + 0x16],	%o7
	fmovrdlz	%g5,	%f0,	%f12
	fone	%f2
	edge16n	%i3,	%i7,	%i0
	move	%icc,	%l0,	%l3
	movrgz	%l5,	%g3,	%o5
	popc	0x1EC7,	%i6
	edge8n	%o0,	%g6,	%o2
	nop
	set	0x54, %l5
	ldsw	[%l7 + %l5],	%o1
	edge16	%l6,	%i5,	%i2
	popc	0x1956,	%g1
	fmovrdlez	%g4,	%f6,	%f18
	sll	%l4,	0x15,	%i4
	orcc	%o4,	%o6,	%g7
	movrlez	%l2,	%i1,	%g2
	movg	%icc,	%o3,	%l1
	or	%g5,	0x17AC,	%o7
	sth	%i3,	[%l7 + 0x5A]
	movrlez	%i7,	%l0,	%l3
	orcc	%l5,	0x0A17,	%i0
	fmovrdne	%o5,	%f30,	%f10
	fmovd	%f2,	%f20
	ldsb	[%l7 + 0x47],	%i6
	fmuld8ulx16	%f2,	%f15,	%f18
	mova	%icc,	%o0,	%g3
	edge8l	%o2,	%g6,	%o1
	ldsh	[%l7 + 0x1A],	%i5
	ldd	[%l7 + 0x08],	%f12
	sll	%i2,	0x1A,	%g1
	restore %g4, 0x0FE5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f8,	[%l7 + 0x78]
	xnorcc	%l6,	0x1850,	%o4
	nop
	set	0x4A, %l3
	ldsb	[%l7 + %l3],	%i4
	movl	%xcc,	%o6,	%l2
	movn	%xcc,	%g7,	%g2
	movle	%xcc,	%o3,	%i1
	movn	%icc,	%g5,	%o7
	movrgz	%i3,	0x08B,	%i7
	siam	0x3
	sdiv	%l0,	0x1AD6,	%l3
	movpos	%xcc,	%l1,	%l5
	addccc	%o5,	0x10E2,	%i6
	edge16ln	%o0,	%i0,	%g3
	edge8l	%o2,	%o1,	%i5
	nop
	set	0x30, %i3
	std	%f2,	[%l7 + %i3]
	lduw	[%l7 + 0x74],	%i2
	fmovdvs	%icc,	%f28,	%f0
	movrlez	%g6,	%g1,	%g4
	fmovrsgz	%l6,	%f4,	%f29
	fpack32	%f18,	%f28,	%f16
	sll	%o4,	0x0D,	%l4
	movgu	%xcc,	%o6,	%i4
	fnegd	%f26,	%f24
	srax	%l2,	0x03,	%g7
	srlx	%g2,	%o3,	%i1
	movle	%xcc,	%o7,	%g5
	movl	%icc,	%i3,	%i7
	subc	%l0,	%l1,	%l3
	ldub	[%l7 + 0x72],	%o5
	move	%xcc,	%i6,	%o0
	ldub	[%l7 + 0x46],	%l5
	fmovdge	%xcc,	%f30,	%f13
	movrlz	%g3,	0x278,	%i0
	edge16l	%o1,	%o2,	%i2
	nop
	set	0x40, %l2
	lduw	[%l7 + %l2],	%i5
	movg	%icc,	%g6,	%g1
	andcc	%l6,	%o4,	%l4
	sub	%o6,	%g4,	%l2
	xnor	%i4,	%g7,	%o3
	st	%f11,	[%l7 + 0x48]
	ldsb	[%l7 + 0x78],	%g2
	fnors	%f7,	%f18,	%f23
	ldd	[%l7 + 0x10],	%o6
	srlx	%i1,	0x02,	%i3
	movgu	%xcc,	%g5,	%l0
	movn	%icc,	%l1,	%l3
	and	%i7,	%i6,	%o0
	add	%l5,	0x0565,	%g3
	fmovrdlez	%o5,	%f10,	%f30
	fones	%f2
	stb	%i0,	[%l7 + 0x49]
	fmovrdgz	%o1,	%f6,	%f30
	sdivcc	%i2,	0x0521,	%o2
	lduw	[%l7 + 0x78],	%i5
	edge32n	%g1,	%l6,	%g6
	movg	%xcc,	%l4,	%o4
	movleu	%xcc,	%o6,	%l2
	edge32ln	%g4,	%i4,	%o3
	popc	%g2,	%g7
	movgu	%icc,	%o7,	%i3
	ldd	[%l7 + 0x08],	%i0
	alignaddr	%l0,	%l1,	%l3
	nop
	set	0x70, %i4
	ldx	[%l7 + %i4],	%i7
	movrgez	%i6,	%g5,	%o0
	fabss	%f0,	%f29
	fmovdpos	%icc,	%f18,	%f22
	movne	%icc,	%l5,	%o5
	array32	%i0,	%g3,	%o1
	fpmerge	%f24,	%f17,	%f12
	fmovrdne	%i2,	%f14,	%f22
	ldd	[%l7 + 0x10],	%f4
	alignaddr	%o2,	%g1,	%i5
	ldsb	[%l7 + 0x35],	%l6
	fmovdgu	%icc,	%f9,	%f12
	movleu	%icc,	%l4,	%o4
	movge	%icc,	%g6,	%o6
	movrgz	%g4,	0x110,	%i4
	movrlez	%o3,	0x394,	%l2
	movrgz	%g7,	%g2,	%o7
	move	%icc,	%i3,	%i1
	mulscc	%l0,	0x12CA,	%l1
	nop
	set	0x12, %i0
	lduh	[%l7 + %i0],	%l3
	fcmpd	%fcc0,	%f18,	%f20
	stx	%i7,	[%l7 + 0x78]
	movrlz	%g5,	0x055,	%o0
	edge8n	%i6,	%o5,	%l5
	nop
	set	0x20, %o7
	std	%f16,	[%l7 + %o7]
	movrgez	%g3,	%o1,	%i0
	ldd	[%l7 + 0x68],	%i2
	addc	%g1,	%i5,	%o2
	movvs	%icc,	%l6,	%o4
	fnot2s	%f25,	%f15
	fandnot1s	%f9,	%f11,	%f7
	movre	%l4,	%g6,	%o6
	movneg	%icc,	%i4,	%o3
	sir	0x151E
	fmul8x16al	%f13,	%f20,	%f24
	fmovrdne	%l2,	%f6,	%f20
	andncc	%g4,	%g7,	%g2
	fornot2s	%f20,	%f28,	%f17
	srax	%i3,	0x16,	%o7
	udivx	%i1,	0x16BF,	%l0
	movrne	%l1,	0x36E,	%i7
	array8	%g5,	%l3,	%o0
	sllx	%o5,	%l5,	%g3
	edge8l	%i6,	%o1,	%i2
	ldd	[%l7 + 0x58],	%g0
	siam	0x3
	edge8ln	%i5,	%o2,	%i0
	sra	%o4,	%l6,	%l4
	sll	%o6,	0x1D,	%i4
	sllx	%g6,	%o3,	%g4
	umulcc	%g7,	%g2,	%i3
	fcmple32	%f14,	%f10,	%o7
	edge8n	%i1,	%l0,	%l1
	stx	%i7,	[%l7 + 0x68]
	subccc	%l2,	0x008B,	%g5
	fornot2s	%f28,	%f17,	%f27
	orcc	%o0,	0x114D,	%l3
	edge16ln	%l5,	%o5,	%i6
	edge32ln	%o1,	%g3,	%g1
	udiv	%i2,	0x0081,	%i5
	nop
	set	0x70, %g7
	std	%f12,	[%l7 + %g7]
	orncc	%i0,	0x02D4,	%o4
	smul	%o2,	%l4,	%o6
	edge8ln	%i4,	%l6,	%g6
	edge32n	%o3,	%g7,	%g2
	fmovse	%xcc,	%f20,	%f11
	move	%xcc,	%i3,	%o7
	movvc	%icc,	%g4,	%l0
	addc	%i1,	%i7,	%l2
	stw	%g5,	[%l7 + 0x2C]
	stw	%l1,	[%l7 + 0x68]
	save %o0, 0x166B, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o5,	[%l7 + 0x60]
	move	%icc,	%i6,	%l5
	smulcc	%g3,	%g1,	%i2
	andcc	%i5,	%i0,	%o1
	and	%o4,	0x15CE,	%l4
	edge16l	%o6,	%i4,	%l6
	edge32l	%o2,	%o3,	%g7
	fpsub16	%f26,	%f0,	%f30
	ldsh	[%l7 + 0x4A],	%g6
	lduh	[%l7 + 0x12],	%i3
	subcc	%o7,	0x1E55,	%g4
	ldsw	[%l7 + 0x4C],	%g2
	mova	%xcc,	%i1,	%l0
	alignaddrl	%i7,	%l2,	%g5
	sdivx	%o0,	0x12C8,	%l1
	sllx	%o5,	0x04,	%l3
	fornot1s	%f21,	%f27,	%f28
	stb	%l5,	[%l7 + 0x7C]
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	fpack16	%f18,	%f6
	andncc	%i5,	%i2,	%i0
	ld	[%l7 + 0x18],	%f6
	smul	%o4,	%o1,	%o6
	srlx	%l4,	%l6,	%o2
	srl	%i4,	%o3,	%g7
	srl	%i3,	%o7,	%g6
	fcmpgt32	%f16,	%f18,	%g2
	fmovrdgez	%g4,	%f20,	%f2
	fmovdvc	%xcc,	%f8,	%f6
	lduh	[%l7 + 0x7E],	%i1
	stb	%l0,	[%l7 + 0x12]
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%i7
	edge8n	%g5,	%l2,	%l1
	xnorcc	%o5,	%l3,	%o0
	orn	%l5,	0x0549,	%g1
	fpadd16s	%f4,	%f26,	%f5
	movrlez	%i6,	0x2D5,	%g3
	ldd	[%l7 + 0x28],	%i2
	sethi	0x0CAC,	%i0
	udivx	%i5,	0x066E,	%o1
	srax	%o4,	0x04,	%o6
	fand	%f2,	%f26,	%f24
	mulx	%l4,	0x1108,	%o2
	edge8ln	%i4,	%l6,	%g7
	mova	%xcc,	%o3,	%o7
	move	%xcc,	%g6,	%i3
	movvc	%xcc,	%g4,	%g2
	ldd	[%l7 + 0x08],	%l0
	addcc	%i7,	0x0277,	%g5
	fsrc2s	%f13,	%f21
	fmovrsgz	%i1,	%f0,	%f1
	fnot1s	%f24,	%f7
	fors	%f7,	%f16,	%f29
	fmul8x16al	%f24,	%f21,	%f6
	mova	%xcc,	%l1,	%l2
	movrlz	%l3,	%o0,	%o5
	ld	[%l7 + 0x5C],	%f20
	ld	[%l7 + 0x44],	%f28
	edge8l	%l5,	%g1,	%i6
	subccc	%g3,	0x1AC1,	%i0
	movle	%xcc,	%i2,	%i5
	addccc	%o4,	%o1,	%l4
	sth	%o2,	[%l7 + 0x14]
	movn	%xcc,	%o6,	%i4
	fcmple32	%f22,	%f28,	%l6
	and	%o3,	%o7,	%g6
	movcs	%xcc,	%g7,	%g4
	andn	%i3,	%l0,	%i7
	xnorcc	%g2,	%g5,	%i1
	ldsw	[%l7 + 0x54],	%l1
	fcmps	%fcc3,	%f14,	%f17
	movn	%xcc,	%l3,	%o0
	stw	%o5,	[%l7 + 0x18]
	orncc	%l2,	%g1,	%i6
	fmovrdlz	%l5,	%f10,	%f16
	fmul8x16al	%f4,	%f1,	%f22
	sra	%g3,	%i0,	%i5
	udiv	%i2,	0x018F,	%o4
	fxnors	%f27,	%f15,	%f14
	movge	%icc,	%o1,	%l4
	subc	%o6,	0x087D,	%o2
	fpadd16	%f4,	%f14,	%f30
	ldsb	[%l7 + 0x43],	%i4
	movg	%icc,	%l6,	%o7
	edge8ln	%o3,	%g7,	%g4
	stw	%g6,	[%l7 + 0x14]
	andcc	%l0,	0x0E1E,	%i3
	addccc	%g2,	%g5,	%i7
	array32	%l1,	%i1,	%l3
	fmovdleu	%xcc,	%f17,	%f9
	or	%o0,	0x0F56,	%o5
	movgu	%xcc,	%g1,	%i6
	movleu	%xcc,	%l2,	%l5
	fmovspos	%xcc,	%f10,	%f28
	sdiv	%i0,	0x1D2B,	%i5
	srax	%g3,	%i2,	%o1
	fmuld8ulx16	%f14,	%f0,	%f8
	stw	%o4,	[%l7 + 0x4C]
	mulscc	%l4,	0x13EE,	%o2
	save %o6, 0x16E1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x2E],	%l6
	smulcc	%o3,	%g7,	%o7
	fcmpd	%fcc0,	%f26,	%f4
	subcc	%g4,	0x1FC6,	%l0
	sir	0x1CEE
	movle	%xcc,	%i3,	%g6
	fmovde	%icc,	%f20,	%f16
	smulcc	%g5,	%g2,	%i7
	stb	%l1,	[%l7 + 0x51]
	movrlez	%l3,	0x0D5,	%o0
	edge32ln	%i1,	%o5,	%i6
	sdivcc	%g1,	0x0FD8,	%l2
	movn	%xcc,	%i0,	%i5
	movrlez	%g3,	%i2,	%l5
	movvs	%xcc,	%o1,	%l4
	ld	[%l7 + 0x30],	%f2
	fmovsne	%icc,	%f30,	%f7
	fmovdl	%xcc,	%f28,	%f7
	edge32l	%o4,	%o2,	%o6
	sll	%i4,	%o3,	%g7
	edge8n	%o7,	%l6,	%l0
	udivx	%g4,	0x15A5,	%g6
	movrgz	%i3,	%g5,	%i7
	edge8l	%g2,	%l3,	%o0
	edge16l	%l1,	%o5,	%i6
	sethi	0x0DA2,	%g1
	edge16l	%i1,	%i0,	%i5
	srl	%l2,	0x16,	%i2
	edge16l	%g3,	%l5,	%o1
	orncc	%o4,	%l4,	%o2
	fmul8ulx16	%f0,	%f14,	%f10
	fmovrde	%i4,	%f20,	%f12
	alignaddr	%o6,	%g7,	%o7
	ldsh	[%l7 + 0x38],	%o3
	st	%f0,	[%l7 + 0x14]
	fcmpne32	%f8,	%f6,	%l6
	movrgez	%l0,	0x093,	%g6
	movn	%icc,	%g4,	%g5
	xnor	%i3,	0x04A1,	%i7
	movre	%l3,	%g2,	%l1
	sir	0x0882
	movneg	%icc,	%o0,	%i6
	ldsw	[%l7 + 0x70],	%g1
	sdivcc	%i1,	0x189B,	%i0
	sll	%o5,	0x0F,	%i5
	edge8l	%l2,	%g3,	%i2
	restore %l5, 0x0295, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o4,	0x1681,	%o2
	sra	%i4,	0x09,	%o6
	fmovsge	%xcc,	%f18,	%f24
	xor	%g7,	%l4,	%o7
	movrlez	%o3,	%l0,	%g6
	movcs	%xcc,	%g4,	%l6
	add	%g5,	0x0053,	%i7
	stw	%i3,	[%l7 + 0x08]
	edge32n	%g2,	%l3,	%o0
	movl	%xcc,	%i6,	%l1
	movcs	%xcc,	%i1,	%i0
	movrlz	%o5,	0x0B9,	%g1
	alignaddr	%l2,	%i5,	%g3
	std	%f16,	[%l7 + 0x58]
	movrlz	%i2,	%o1,	%l5
	udivcc	%o2,	0x1E26,	%i4
	edge16ln	%o4,	%g7,	%l4
	xnorcc	%o7,	%o3,	%l0
	stx	%g6,	[%l7 + 0x20]
	srl	%o6,	%g4,	%l6
	edge32ln	%g5,	%i7,	%g2
	fmovsvs	%xcc,	%f27,	%f9
	fsrc1s	%f4,	%f15
	movrgz	%i3,	%l3,	%o0
	smulcc	%l1,	0x1914,	%i1
	mulx	%i0,	0x1802,	%o5
	and	%i6,	0x06FA,	%g1
	movrlz	%l2,	%i5,	%g3
	edge16ln	%i2,	%o1,	%l5
	andcc	%o2,	0x067B,	%i4
	lduw	[%l7 + 0x58],	%o4
	nop
	set	0x0A, %o5
	ldsh	[%l7 + %o5],	%l4
	addc	%o7,	0x0A3E,	%g7
	ldsh	[%l7 + 0x46],	%o3
	fcmpne16	%f30,	%f4,	%l0
	stx	%o6,	[%l7 + 0x40]
	movl	%xcc,	%g4,	%g6
	edge8ln	%l6,	%i7,	%g2
	edge32	%i3,	%g5,	%l3
	popc	0x1C76,	%o0
	fmovrdgez	%i1,	%f20,	%f6
	movvs	%xcc,	%i0,	%o5
	movpos	%icc,	%l1,	%i6
	edge16n	%l2,	%i5,	%g1
	fsrc2s	%f8,	%f5
	movn	%xcc,	%i2,	%o1
	fmovrslz	%g3,	%f13,	%f23
	lduh	[%l7 + 0x46],	%l5
	edge8l	%i4,	%o2,	%o4
	fmovscs	%icc,	%f16,	%f28
	fxor	%f28,	%f16,	%f10
	movleu	%xcc,	%o7,	%g7
	lduh	[%l7 + 0x56],	%l4
	movpos	%xcc,	%l0,	%o3
	fmovrsne	%g4,	%f16,	%f17
	add	%o6,	0x1660,	%l6
	movre	%i7,	%g2,	%g6
	sethi	0x0113,	%g5
	fnot1s	%f27,	%f16
	subc	%i3,	0x03B7,	%l3
	array8	%i1,	%o0,	%i0
	move	%xcc,	%o5,	%i6
	addcc	%l1,	%l2,	%i5
	edge32ln	%i2,	%g1,	%o1
	stb	%g3,	[%l7 + 0x64]
	sra	%i4,	%l5,	%o4
	xorcc	%o2,	0x1282,	%o7
	fmovsneg	%icc,	%f19,	%f1
	fmovde	%icc,	%f12,	%f10
	stb	%g7,	[%l7 + 0x67]
	addcc	%l0,	%l4,	%g4
	fmovscs	%xcc,	%f17,	%f8
	sdiv	%o3,	0x163E,	%l6
	andncc	%o6,	%g2,	%g6
	fcmped	%fcc0,	%f30,	%f22
	movge	%icc,	%i7,	%g5
	xnorcc	%i3,	0x0FE8,	%i1
	bshuffle	%f20,	%f22,	%f18
	movvs	%icc,	%l3,	%o0
	popc	%i0,	%i6
	edge8l	%o5,	%l2,	%l1
	movrne	%i5,	0x2D2,	%i2
	mulx	%g1,	%g3,	%o1
	ldsw	[%l7 + 0x10],	%i4
	sethi	0x1601,	%o4
	alignaddrl	%o2,	%l5,	%o7
	fsrc2	%f14,	%f10
	sll	%l0,	0x1A,	%g7
	ldub	[%l7 + 0x2E],	%g4
	xnor	%l4,	0x0DB9,	%l6
	movcc	%icc,	%o6,	%o3
	movrne	%g2,	0x3FB,	%g6
	udivcc	%i7,	0x1696,	%g5
	ld	[%l7 + 0x0C],	%f7
	subc	%i3,	0x1F9C,	%i1
	udivx	%o0,	0x05BC,	%i0
	fandnot2	%f18,	%f6,	%f10
	movpos	%icc,	%i6,	%o5
	fmul8ulx16	%f28,	%f26,	%f14
	andcc	%l3,	%l1,	%i5
	popc	%i2,	%l2
	xnorcc	%g3,	%o1,	%g1
	fpadd16	%f6,	%f8,	%f0
	fors	%f25,	%f11,	%f25
	fpsub32s	%f11,	%f22,	%f10
	ldsh	[%l7 + 0x40],	%o4
	fxnors	%f18,	%f0,	%f30
	movne	%xcc,	%i4,	%l5
	edge16n	%o2,	%l0,	%g7
	movcs	%icc,	%o7,	%g4
	array32	%l4,	%o6,	%o3
	sdivx	%g2,	0x0E7A,	%g6
	lduw	[%l7 + 0x18],	%l6
	or	%i7,	0x133B,	%i3
	subc	%g5,	%o0,	%i0
	umul	%i1,	%o5,	%l3
	ldx	[%l7 + 0x58],	%i6
	udivx	%l1,	0x0CA7,	%i2
	array8	%i5,	%g3,	%l2
	subcc	%o1,	%o4,	%g1
	ldsh	[%l7 + 0x1C],	%i4
	fpadd32	%f26,	%f18,	%f4
	smul	%l5,	0x1BFD,	%o2
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%g7
	subccc	%l0,	0x0FF5,	%g4
	array32	%l4,	%o7,	%o3
	save %g2, 0x0F74, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o6,	0x1D82,	%l6
	alignaddr	%i7,	%g5,	%i3
	save %i0, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o5,	0x0C5B,	%i6
	orn	%l1,	%l3,	%i5
	array32	%g3,	%i2,	%l2
	xorcc	%o1,	%o4,	%g1
	addccc	%i4,	0x0060,	%o2
	xor	%l5,	0x1A82,	%l0
	edge8n	%g7,	%l4,	%g4
	fpackfix	%f28,	%f20
	array8	%o7,	%o3,	%g2
	edge16ln	%o6,	%l6,	%i7
	udivx	%g5,	0x0455,	%g6
	st	%f19,	[%l7 + 0x14]
	popc	0x19C3,	%i3
	movn	%icc,	%i0,	%o0
	sra	%i1,	%i6,	%o5
	movl	%icc,	%l3,	%i5
	edge32ln	%l1,	%g3,	%i2
	xnor	%o1,	%l2,	%o4
	umul	%g1,	0x0B2A,	%i4
	pdist	%f4,	%f0,	%f28
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	movcs	%xcc,	%g7,	%l4
	umulcc	%g4,	0x19D5,	%o7
	ldx	[%l7 + 0x28],	%o3
	fmovrsgez	%l0,	%f17,	%f23
	fpack16	%f26,	%f18
	sll	%o6,	0x0A,	%l6
	movvc	%xcc,	%i7,	%g5
	movrgez	%g2,	%g6,	%i3
	srl	%i0,	%i1,	%o0
	fmovdg	%xcc,	%f27,	%f3
	fnors	%f20,	%f29,	%f12
	mulscc	%i6,	0x07CE,	%l3
	ldsb	[%l7 + 0x7A],	%i5
	fand	%f10,	%f28,	%f30
	save %o5, 0x095E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i2,	%l1
	std	%f16,	[%l7 + 0x18]
	fmuld8ulx16	%f8,	%f24,	%f20
	umul	%l2,	0x0D34,	%o4
	andcc	%g1,	0x1790,	%o1
	mova	%icc,	%o2,	%l5
	udivcc	%i4,	0x1FE8,	%g7
	subccc	%g4,	%l4,	%o7
	edge8n	%o3,	%o6,	%l0
	popc	%l6,	%g5
	fones	%f16
	movrgez	%g2,	%i7,	%g6
	andn	%i0,	0x0D91,	%i3
	mulscc	%i1,	%i6,	%o0
	movge	%icc,	%l3,	%i5
	edge16l	%o5,	%g3,	%l1
	ld	[%l7 + 0x14],	%f18
	movpos	%icc,	%l2,	%o4
	fzeros	%f30
	fmovrdlz	%i2,	%f10,	%f6
	mulx	%o1,	%g1,	%l5
	andn	%i4,	0x168D,	%g7
	umulcc	%o2,	0x1414,	%g4
	fcmped	%fcc0,	%f6,	%f24
	fmovse	%xcc,	%f17,	%f18
	xnorcc	%o7,	0x0913,	%l4
	restore %o6, %o3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0A9B,	%g5
	fpadd32	%f12,	%f10,	%f24
	edge16l	%g2,	%l0,	%g6
	movrgz	%i7,	0x13B,	%i3
	bshuffle	%f24,	%f22,	%f10
	sdivcc	%i0,	0x0C54,	%i1
	popc	0x12E3,	%o0
	stb	%l3,	[%l7 + 0x6F]
	movcc	%xcc,	%i6,	%i5
	sra	%g3,	%o5,	%l1
	fpack32	%f12,	%f26,	%f26
	fnegs	%f27,	%f16
	ld	[%l7 + 0x1C],	%f17
	add	%o4,	0x028A,	%l2
	edge8ln	%o1,	%g1,	%i2
	movrgz	%l5,	%i4,	%g7
	or	%o2,	0x0B25,	%g4
	movcc	%xcc,	%l4,	%o7
	edge16l	%o6,	%o3,	%g5
	addc	%l6,	0x0199,	%l0
	subccc	%g6,	0x1926,	%i7
	movne	%icc,	%i3,	%i0
	edge32ln	%i1,	%g2,	%l3
	lduw	[%l7 + 0x24],	%o0
	movcc	%icc,	%i5,	%g3
	edge8l	%o5,	%i6,	%l1
	andncc	%o4,	%o1,	%g1
	movge	%icc,	%i2,	%l2
	add	%i4,	0x1251,	%l5
	movvc	%xcc,	%g7,	%o2
	movne	%xcc,	%g4,	%l4
	fandnot1s	%f23,	%f3,	%f1
	sth	%o7,	[%l7 + 0x6C]
	movcc	%xcc,	%o6,	%g5
	movrlz	%o3,	0x081,	%l6
	srax	%g6,	%i7,	%l0
	fmovrslz	%i0,	%f11,	%f4
	pdist	%f12,	%f26,	%f14
	ldd	[%l7 + 0x38],	%f22
	fmovsvc	%icc,	%f17,	%f9
	srax	%i1,	%i3,	%g2
	and	%o0,	0x0699,	%i5
	fornot1	%f16,	%f22,	%f28
	subcc	%g3,	%o5,	%i6
	udivx	%l1,	0x1403,	%l3
	fmovrdlez	%o1,	%f24,	%f12
	stx	%o4,	[%l7 + 0x60]
	fand	%f26,	%f22,	%f22
	movrne	%g1,	0x2B3,	%i2
	sll	%i4,	0x05,	%l5
	edge16n	%g7,	%l2,	%o2
	ldsw	[%l7 + 0x18],	%g4
	sll	%o7,	%o6,	%g5
	movrgz	%o3,	0x0C3,	%l6
	srl	%g6,	0x1C,	%i7
	edge32	%l0,	%l4,	%i0
	movle	%xcc,	%i3,	%i1
	movcs	%xcc,	%g2,	%o0
	movvs	%xcc,	%i5,	%o5
	array16	%g3,	%i6,	%l1
	edge16ln	%l3,	%o1,	%o4
	std	%f22,	[%l7 + 0x20]
	fmovse	%xcc,	%f15,	%f8
	alignaddr	%i2,	%i4,	%l5
	andncc	%g1,	%l2,	%o2
	smul	%g7,	0x108B,	%o7
	andn	%o6,	0x0ED0,	%g5
	fnot2s	%f26,	%f3
	subccc	%o3,	0x0701,	%g4
	add	%g6,	0x03B5,	%i7
	andncc	%l6,	%l4,	%i0
	orcc	%i3,	%i1,	%g2
	srax	%o0,	%l0,	%o5
	fornot1s	%f14,	%f28,	%f29
	addc	%g3,	0x19C0,	%i6
	mulscc	%l1,	%l3,	%o1
	srax	%o4,	%i2,	%i5
	fnot1	%f16,	%f16
	udiv	%i4,	0x01DB,	%l5
	sethi	0x0D42,	%l2
	addc	%g1,	%o2,	%g7
	movrlez	%o6,	0x218,	%o7
	fzeros	%f23
	andn	%g5,	%o3,	%g4
	andncc	%g6,	%l6,	%l4
	fmovrdgz	%i0,	%f20,	%f30
	xnorcc	%i7,	0x06DB,	%i1
	smulcc	%g2,	%i3,	%o0
	array8	%l0,	%o5,	%i6
	ldsh	[%l7 + 0x4E],	%l1
	fnands	%f23,	%f5,	%f28
	movle	%icc,	%l3,	%o1
	umul	%g3,	%i2,	%i5
	fsrc1	%f12,	%f0
	alignaddrl	%o4,	%i4,	%l5
	sdivcc	%l2,	0x03FF,	%g1
	array8	%o2,	%o6,	%o7
	addc	%g7,	0x07B4,	%g5
	sdivx	%o3,	0x0DA9,	%g4
	edge32n	%l6,	%l4,	%i0
	andn	%i7,	0x0F4C,	%g6
	std	%f30,	[%l7 + 0x48]
	sub	%g2,	%i1,	%o0
	stw	%l0,	[%l7 + 0x18]
	movgu	%icc,	%i3,	%o5
	movrne	%l1,	0x11B,	%l3
	xnorcc	%o1,	%i6,	%g3
	movne	%icc,	%i5,	%o4
	fmovrsgz	%i2,	%f12,	%f9
	mova	%xcc,	%l5,	%l2
	popc	0x1358,	%i4
	stx	%g1,	[%l7 + 0x38]
	ldub	[%l7 + 0x1C],	%o6
	smul	%o2,	%o7,	%g5
	orncc	%o3,	%g7,	%g4
	sllx	%l4,	0x11,	%i0
	movleu	%icc,	%i7,	%g6
	sll	%l6,	%g2,	%o0
	fpadd16s	%f7,	%f30,	%f25
	fand	%f28,	%f22,	%f2
	ldx	[%l7 + 0x48],	%i1
	sub	%i3,	0x07C1,	%o5
	xor	%l0,	%l1,	%o1
	andncc	%i6,	%l3,	%i5
	edge32n	%o4,	%g3,	%l5
	std	%f10,	[%l7 + 0x08]
	fcmpgt32	%f0,	%f22,	%i2
	alignaddrl	%l2,	%g1,	%i4
	fmuld8ulx16	%f6,	%f25,	%f20
	sdivx	%o2,	0x1607,	%o7
	sdiv	%o6,	0x0A06,	%g5
	movge	%xcc,	%o3,	%g4
	sth	%l4,	[%l7 + 0x1C]
	edge8	%i0,	%i7,	%g7
	fnand	%f18,	%f4,	%f22
	xor	%l6,	%g2,	%o0
	edge8	%i1,	%i3,	%g6
	udivx	%l0,	0x0ED9,	%l1
	addccc	%o5,	0x0709,	%i6
	xor	%l3,	0x0958,	%o1
	edge16l	%o4,	%i5,	%g3
	srax	%l5,	%i2,	%g1
	movre	%i4,	0x090,	%l2
	ldub	[%l7 + 0x55],	%o2
	fmovsvs	%icc,	%f3,	%f15
	sethi	0x16DE,	%o6
	fnands	%f10,	%f31,	%f23
	fmovrdgez	%o7,	%f24,	%f30
	edge32l	%o3,	%g4,	%l4
	mulx	%g5,	%i0,	%g7
	xnor	%i7,	%l6,	%g2
	movrne	%i1,	0x099,	%o0
	fones	%f11
	umulcc	%g6,	0x0C86,	%l0
	xnor	%i3,	%o5,	%i6
	fpsub32	%f10,	%f30,	%f20
	andcc	%l3,	%l1,	%o4
	srax	%o1,	%i5,	%g3
	movn	%xcc,	%l5,	%i2
	ldx	[%l7 + 0x68],	%g1
	std	%f22,	[%l7 + 0x70]
	sra	%l2,	%o2,	%o6
	movpos	%xcc,	%o7,	%i4
	sllx	%o3,	%l4,	%g5
	ld	[%l7 + 0x14],	%f27
	move	%xcc,	%i0,	%g4
	add	%g7,	%l6,	%i7
	ld	[%l7 + 0x78],	%f31
	movle	%icc,	%i1,	%g2
	edge32n	%o0,	%l0,	%g6
	orncc	%o5,	0x0E31,	%i3
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%l3
	xorcc	%l1,	%i6,	%o1
	addcc	%i5,	%g3,	%o4
	fsrc1s	%f22,	%f0
	fmovs	%f30,	%f24
	sdivx	%i2,	0x12C7,	%l5
	fmovspos	%icc,	%f12,	%f6
	ldx	[%l7 + 0x28],	%l2
	fmovrdlez	%o2,	%f8,	%f16
	edge8ln	%o6,	%g1,	%o7
	nop
	set	0x39, %g6
	stb	%i4,	[%l7 + %g6]
	fmovsne	%icc,	%f5,	%f13
	movrgez	%o3,	%l4,	%g5
	umul	%i0,	0x0D66,	%g4
	smulcc	%g7,	0x093A,	%l6
	fmovsneg	%icc,	%f27,	%f9
	fpadd32	%f22,	%f22,	%f24
	fmovdne	%icc,	%f8,	%f3
	fmovdn	%icc,	%f27,	%f2
	movleu	%icc,	%i1,	%i7
	udiv	%g2,	0x09C3,	%l0
	fpack16	%f6,	%f7
	movge	%xcc,	%o0,	%g6
	stw	%i3,	[%l7 + 0x20]
	movrlz	%l3,	0x374,	%l1
	smul	%o5,	0x0AFF,	%i6
	fsrc1s	%f27,	%f26
	xor	%i5,	%o1,	%o4
	andcc	%g3,	%l5,	%l2
	fmovdge	%xcc,	%f11,	%f1
	udivcc	%i2,	0x16ED,	%o2
	xor	%o6,	%g1,	%i4
	lduw	[%l7 + 0x60],	%o7
	udivx	%o3,	0x1B72,	%l4
	addcc	%i0,	%g4,	%g5
	lduw	[%l7 + 0x48],	%g7
	ldd	[%l7 + 0x20],	%i6
	fxnor	%f30,	%f8,	%f18
	orncc	%i1,	%g2,	%l0
	sth	%o0,	[%l7 + 0x74]
	movrgz	%g6,	%i7,	%i3
	fmul8sux16	%f20,	%f2,	%f22
	edge32ln	%l3,	%o5,	%l1
	edge32	%i6,	%o1,	%o4
	ldsh	[%l7 + 0x56],	%i5
	xnor	%l5,	%l2,	%i2
	sdivx	%g3,	0x02DB,	%o6
	umul	%g1,	%o2,	%i4
	fnand	%f22,	%f12,	%f22
	fpack32	%f18,	%f18,	%f26
	fcmpne32	%f28,	%f12,	%o7
	orcc	%l4,	%i0,	%o3
	movrgez	%g5,	0x1EF,	%g4
	fmul8x16	%f8,	%f28,	%f6
	edge8	%g7,	%l6,	%g2
	edge16n	%l0,	%o0,	%i1
	fpackfix	%f0,	%f31
	alignaddrl	%i7,	%i3,	%l3
	subccc	%g6,	0x12E7,	%o5
	edge32l	%i6,	%l1,	%o1
	st	%f4,	[%l7 + 0x50]
	movge	%icc,	%o4,	%i5
	edge8ln	%l2,	%l5,	%i2
	movleu	%xcc,	%o6,	%g3
	st	%f18,	[%l7 + 0x4C]
	ldd	[%l7 + 0x70],	%g0
	movrlez	%i4,	%o2,	%o7
	lduw	[%l7 + 0x30],	%i0
	fandnot2s	%f2,	%f17,	%f21
	smul	%l4,	0x0162,	%o3
	faligndata	%f2,	%f20,	%f28
	srlx	%g4,	%g7,	%l6
	orcc	%g2,	0x1EB8,	%g5
	move	%icc,	%l0,	%o0
	xnorcc	%i7,	0x0C93,	%i3
	fmovdne	%icc,	%f20,	%f4
	udivcc	%l3,	0x0DA1,	%g6
	st	%f9,	[%l7 + 0x44]
	smulcc	%i1,	0x07DA,	%o5
	edge8l	%i6,	%l1,	%o1
	fsrc1	%f12,	%f16
	edge16l	%i5,	%o4,	%l2
	ldd	[%l7 + 0x08],	%l4
	movrgz	%o6,	%i2,	%g3
	orcc	%i4,	0x10E8,	%o2
	andncc	%g1,	%o7,	%l4
	addcc	%i0,	0x0FD5,	%g4
	srlx	%g7,	%l6,	%g2
	fmovse	%icc,	%f0,	%f20
	edge16ln	%g5,	%l0,	%o3
	addcc	%i7,	%o0,	%l3
	subcc	%i3,	%g6,	%i1
	fpadd16s	%f27,	%f26,	%f13
	srl	%o5,	0x1B,	%i6
	ldsh	[%l7 + 0x26],	%l1
	alignaddr	%i5,	%o1,	%l2
	movneg	%xcc,	%l5,	%o6
	addccc	%o4,	0x05BD,	%g3
	fcmpgt32	%f2,	%f24,	%i4
	lduw	[%l7 + 0x38],	%i2
	addcc	%o2,	0x0351,	%o7
	fornot2	%f2,	%f12,	%f4
	smul	%l4,	0x083F,	%g1
	sra	%g4,	0x09,	%g7
	movrlez	%l6,	0x333,	%i0
	edge8ln	%g5,	%l0,	%g2
	fmul8x16	%f22,	%f24,	%f0
	fmovrse	%o3,	%f9,	%f31
	add	%o0,	%i7,	%l3
	fcmps	%fcc1,	%f25,	%f22
	edge16	%i3,	%i1,	%o5
	sdivcc	%i6,	0x1DEE,	%l1
	edge16	%i5,	%g6,	%o1
	edge32	%l5,	%o6,	%l2
	udivcc	%o4,	0x0F0F,	%g3
	fabsd	%f18,	%f12
	edge16l	%i2,	%i4,	%o2
	umul	%l4,	%g1,	%g4
	std	%f8,	[%l7 + 0x28]
	fmul8x16au	%f8,	%f15,	%f20
	array16	%g7,	%o7,	%l6
	movle	%xcc,	%g5,	%l0
	sir	0x0180
	nop
	set	0x42, %o0
	ldub	[%l7 + %o0],	%i0
	popc	%o3,	%o0
	ldx	[%l7 + 0x40],	%g2
	st	%f0,	[%l7 + 0x18]
	movrlz	%l3,	0x02B,	%i7
	add	%i1,	0x1299,	%i3
	st	%f11,	[%l7 + 0x4C]
	mulscc	%i6,	0x0E97,	%l1
	fornot1s	%f20,	%f6,	%f8
	orncc	%i5,	0x084E,	%g6
	udivcc	%o1,	0x13B3,	%l5
	andn	%o6,	%l2,	%o4
	edge16n	%o5,	%i2,	%i4
	edge16ln	%g3,	%o2,	%g1
	fmovde	%icc,	%f1,	%f20
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	sll	%o7,	%g4,	%l6
	umulcc	%g5,	0x0288,	%l0
	ldd	[%l7 + 0x10],	%f24
	array32	%o3,	%i0,	%g2
	umul	%l3,	0x149B,	%o0
	fxnor	%f10,	%f28,	%f6
	movleu	%icc,	%i1,	%i3
	andncc	%i6,	%l1,	%i7
	fmovrdne	%i5,	%f10,	%f2
	movcc	%xcc,	%g6,	%o1
	sra	%l5,	0x07,	%l2
	andcc	%o6,	%o5,	%i2
	fcmpne32	%f18,	%f18,	%o4
	fmovdg	%xcc,	%f21,	%f20
	fcmped	%fcc0,	%f0,	%f12
	ldx	[%l7 + 0x28],	%g3
	fmul8sux16	%f20,	%f10,	%f18
	movre	%i4,	0x180,	%g1
	srax	%o2,	0x0F,	%l4
	movg	%xcc,	%g7,	%g4
	alignaddr	%o7,	%l6,	%g5
	sdivcc	%o3,	0x0E0C,	%i0
	array8	%g2,	%l3,	%l0
	fpsub16s	%f12,	%f18,	%f24
	nop
	set	0x18, %i1
	ldd	[%l7 + %i1],	%i0
	fmovdge	%xcc,	%f25,	%f13
	ld	[%l7 + 0x10],	%f12
	fmovdpos	%xcc,	%f8,	%f0
	fmovdge	%icc,	%f23,	%f10
	edge8	%i3,	%i6,	%l1
	fmul8x16	%f5,	%f16,	%f24
	smul	%o0,	0x152C,	%i7
	edge32ln	%g6,	%o1,	%i5
	mulx	%l5,	0x02E8,	%l2
	fmovsg	%xcc,	%f26,	%f0
	fmovrsgz	%o6,	%f24,	%f14
	fmovse	%xcc,	%f3,	%f11
	andcc	%o5,	0x18A4,	%i2
	andncc	%o4,	%g3,	%i4
	fmovdneg	%xcc,	%f19,	%f22
	movrlz	%o2,	0x2C2,	%l4
	edge16l	%g1,	%g7,	%g4
	move	%icc,	%o7,	%g5
	addccc	%o3,	%i0,	%g2
	alignaddrl	%l3,	%l6,	%l0
	movvc	%icc,	%i1,	%i3
	fxnor	%f26,	%f18,	%f12
	movpos	%xcc,	%l1,	%o0
	edge32	%i7,	%g6,	%o1
	sdivcc	%i6,	0x05D4,	%i5
	sdiv	%l2,	0x18CB,	%l5
	movl	%xcc,	%o6,	%i2
	fsrc2	%f16,	%f6
	xnorcc	%o5,	0x0D58,	%g3
	movcc	%icc,	%i4,	%o4
	edge16l	%o2,	%l4,	%g7
	smulcc	%g4,	%g1,	%o7
	array32	%g5,	%o3,	%g2
	xorcc	%i0,	0x0F6E,	%l6
	movneg	%icc,	%l0,	%l3
	sdivcc	%i1,	0x1EF5,	%i3
	alignaddrl	%l1,	%i7,	%o0
	orncc	%o1,	%i6,	%g6
	edge8n	%i5,	%l5,	%o6
	movrlz	%l2,	0x09B,	%o5
	subc	%g3,	%i2,	%o4
	fnot1s	%f2,	%f6
	st	%f12,	[%l7 + 0x60]
	xorcc	%o2,	0x068F,	%l4
	fmovrse	%g7,	%f9,	%f27
	sdiv	%g4,	0x11C3,	%g1
	fcmpne32	%f10,	%f10,	%i4
	ldx	[%l7 + 0x28],	%g5
	addccc	%o7,	0x02B9,	%o3
	fornot1s	%f20,	%f28,	%f30
	save %g2, %i0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l3,	%i1,	%i3
	addc	%l1,	0x187F,	%l0
	orcc	%i7,	%o1,	%i6
	ldsw	[%l7 + 0x50],	%o0
	orn	%i5,	%l5,	%g6
	sethi	0x136D,	%o6
	andn	%l2,	0x1A74,	%g3
	ldd	[%l7 + 0x20],	%f12
	edge32	%o5,	%i2,	%o4
	ldsw	[%l7 + 0x54],	%o2
	fmovdle	%icc,	%f2,	%f24
	sll	%l4,	%g7,	%g4
	restore %g1, %i4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x68],	%o7
	movcc	%icc,	%g2,	%o3
	and	%i0,	0x13E3,	%l6
	movrgz	%i1,	0x087,	%i3
	edge16ln	%l3,	%l1,	%l0
	array32	%i7,	%i6,	%o0
	array8	%i5,	%l5,	%o1
	udivcc	%o6,	0x133A,	%l2
	fmovsgu	%icc,	%f9,	%f4
	fmovdleu	%xcc,	%f30,	%f3
	smul	%g6,	%o5,	%i2
	sllx	%o4,	0x1E,	%g3
	fors	%f31,	%f8,	%f18
	movne	%xcc,	%l4,	%g7
	sll	%g4,	%o2,	%g1
	array32	%g5,	%i4,	%o7
	fmovsg	%xcc,	%f1,	%f18
	ldub	[%l7 + 0x58],	%o3
	sub	%g2,	0x13CA,	%i0
	umulcc	%i1,	%i3,	%l3
	edge8	%l1,	%l0,	%l6
	xorcc	%i7,	%o0,	%i5
	andcc	%i6,	0x14A1,	%l5
	subc	%o1,	%o6,	%g6
	movne	%xcc,	%l2,	%i2
	edge16l	%o5,	%g3,	%l4
	sdivx	%g7,	0x0E82,	%g4
	fzeros	%f23
	movre	%o4,	0x181,	%o2
	add	%g1,	%g5,	%o7
	save %i4, %o3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	%i3,	%l3
	sllx	%l1,	%l0,	%i1
	movvs	%icc,	%l6,	%i7
	fabss	%f31,	%f26
	fsrc2	%f12,	%f4
	movrgz	%i5,	%o0,	%i6
	sir	0x1884
	ld	[%l7 + 0x60],	%f19
	movrlz	%o1,	%o6,	%g6
	addc	%l5,	0x18DE,	%l2
	ldd	[%l7 + 0x60],	%i2
	orncc	%o5,	0x1EB3,	%g3
	movle	%icc,	%l4,	%g4
	sub	%o4,	0x0B2D,	%g7
	movgu	%xcc,	%g1,	%o2
	addc	%o7,	%g5,	%o3
	alignaddrl	%i0,	%i4,	%i3
	sdivx	%l3,	0x1B44,	%l1
	andcc	%l0,	0x1D46,	%g2
	fpmerge	%f23,	%f14,	%f20
	fors	%f26,	%f11,	%f11
	edge16	%l6,	%i7,	%i1
	fmovdcc	%xcc,	%f25,	%f27
	movgu	%icc,	%o0,	%i6
	fmovse	%xcc,	%f26,	%f25
	stw	%o1,	[%l7 + 0x18]
	or	%i5,	%g6,	%l5
	edge8n	%o6,	%i2,	%l2
	movcs	%icc,	%g3,	%o5
	movleu	%xcc,	%l4,	%o4
	sub	%g4,	%g1,	%g7
	sll	%o2,	%o7,	%o3
	stb	%i0,	[%l7 + 0x62]
	fsrc2s	%f24,	%f19
	fmovdle	%icc,	%f0,	%f30
	andn	%g5,	%i3,	%l3
	movneg	%xcc,	%i4,	%l1
	fmovdpos	%icc,	%f4,	%f2
	sub	%g2,	%l0,	%i7
	fmovrde	%i1,	%f0,	%f14
	fmovdleu	%icc,	%f0,	%f22
	st	%f16,	[%l7 + 0x3C]
	sub	%l6,	%i6,	%o1
	faligndata	%f0,	%f12,	%f28
	edge16ln	%o0,	%g6,	%l5
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	movleu	%icc,	%g3,	%o5
	movrgez	%l4,	0x28E,	%i2
	for	%f12,	%f8,	%f8
	move	%icc,	%o4,	%g1
	ldx	[%l7 + 0x58],	%g4
	movrgz	%o2,	0x28B,	%g7
	edge32n	%o7,	%i0,	%o3
	udivx	%g5,	0x0A22,	%i3
	sra	%i4,	0x1C,	%l1
	ldsw	[%l7 + 0x40],	%g2
	movl	%xcc,	%l3,	%l0
	orcc	%i7,	%i1,	%l6
	fmovrdne	%i6,	%f0,	%f2
	ldx	[%l7 + 0x10],	%o1
	edge32ln	%g6,	%o0,	%l5
	popc	0x01C8,	%o6
	fexpand	%f11,	%f24
	fmovrdne	%i5,	%f24,	%f18
	st	%f16,	[%l7 + 0x54]
	save %g3, 0x0A27, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f16,	%f12,	%f4
	srl	%l4,	0x1F,	%i2
	fmovrdgz	%o4,	%f20,	%f18
	movn	%xcc,	%l2,	%g1
	udiv	%o2,	0x15AE,	%g4
	edge32ln	%g7,	%i0,	%o7
	alignaddr	%g5,	%o3,	%i4
	fxors	%f20,	%f5,	%f1
	movcc	%xcc,	%i3,	%l1
	st	%f2,	[%l7 + 0x74]
	xor	%l3,	%g2,	%l0
	movvs	%xcc,	%i7,	%l6
	save %i6, %i1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x34],	%g6
	addccc	%l5,	%o6,	%o0
	ldsb	[%l7 + 0x34],	%i5
	udivcc	%o5,	0x1FD1,	%l4
	movn	%xcc,	%g3,	%o4
	subcc	%i2,	0x0FE2,	%l2
	xorcc	%o2,	0x0185,	%g4
	fmovsgu	%xcc,	%f4,	%f30
	orn	%g7,	%i0,	%o7
	st	%f25,	[%l7 + 0x48]
	movrgez	%g5,	%g1,	%i4
	andn	%o3,	%i3,	%l3
	xor	%l1,	%g2,	%l0
	edge8l	%i7,	%i6,	%i1
	srl	%l6,	%g6,	%l5
	movvs	%xcc,	%o6,	%o0
	subccc	%i5,	%o5,	%o1
	srl	%l4,	0x0E,	%o4
	fpmerge	%f31,	%f6,	%f28
	edge16ln	%g3,	%l2,	%o2
	xnorcc	%g4,	%i2,	%i0
	edge32	%o7,	%g5,	%g7
	orcc	%i4,	%o3,	%i3
	fmovrdgz	%g1,	%f16,	%f16
	mulx	%l3,	0x1CC6,	%l1
	or	%g2,	0x1C8E,	%i7
	fmovdneg	%icc,	%f4,	%f1
	ldsw	[%l7 + 0x44],	%l0
	fcmple16	%f22,	%f12,	%i6
	umul	%l6,	%i1,	%l5
	fpadd32s	%f22,	%f11,	%f29
	fxnor	%f16,	%f0,	%f10
	fmovsl	%icc,	%f20,	%f25
	ldub	[%l7 + 0x10],	%o6
	edge16	%g6,	%o0,	%o5
	lduh	[%l7 + 0x68],	%i5
	fmul8sux16	%f18,	%f24,	%f2
	siam	0x7
	fnot1	%f14,	%f18
	faligndata	%f18,	%f8,	%f6
	srl	%o1,	0x03,	%l4
	movcs	%icc,	%o4,	%l2
	umulcc	%g3,	%g4,	%i2
	or	%i0,	0x0F88,	%o7
	bshuffle	%f28,	%f30,	%f0
	edge32	%g5,	%g7,	%o2
	lduw	[%l7 + 0x18],	%i4
	sra	%i3,	0x06,	%g1
	fmovdl	%xcc,	%f25,	%f25
	fxors	%f5,	%f12,	%f12
	mulx	%l3,	%l1,	%g2
	mulscc	%i7,	%l0,	%o3
	edge8	%l6,	%i1,	%i6
	move	%icc,	%l5,	%o6
	xnor	%o0,	0x117D,	%g6
	subcc	%o5,	%i5,	%l4
	movg	%icc,	%o4,	%l2
	edge32n	%o1,	%g4,	%g3
	srl	%i2,	%i0,	%o7
	lduh	[%l7 + 0x44],	%g7
	movrgez	%g5,	0x2F4,	%i4
	movre	%o2,	0x229,	%g1
	mulscc	%i3,	%l1,	%g2
	move	%xcc,	%l3,	%l0
	fnands	%f5,	%f12,	%f13
	sth	%i7,	[%l7 + 0x12]
	movneg	%icc,	%l6,	%i1
	addccc	%i6,	%l5,	%o6
	ldub	[%l7 + 0x58],	%o3
	fnot2s	%f18,	%f17
	umul	%o0,	%o5,	%i5
	stw	%l4,	[%l7 + 0x2C]
	udiv	%g6,	0x106C,	%o4
	movrlez	%l2,	%o1,	%g4
	fandnot1s	%f25,	%f4,	%f21
	fmovdvc	%xcc,	%f26,	%f3
	save %g3, %i0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x197C,	%i2
	movpos	%xcc,	%g7,	%i4
	xor	%o2,	%g1,	%g5
	movleu	%icc,	%l1,	%i3
	edge16l	%g2,	%l0,	%l3
	movgu	%icc,	%i7,	%i1
	fmovsne	%icc,	%f24,	%f26
	stw	%l6,	[%l7 + 0x6C]
	xnor	%i6,	0x069A,	%o6
	save %l5, %o3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o5,	%f16,	%f0
	save %i5, 0x12A8, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o4,	0x0BBF,	%l2
	edge16	%o1,	%g4,	%g3
	restore %l4, %o7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f18,	[%l7 + 0x10]
	fandnot1s	%f14,	%f23,	%f2
	fmovdg	%xcc,	%f26,	%f18
	fpadd32	%f8,	%f26,	%f2
	array8	%i0,	%g7,	%i4
	movl	%xcc,	%g1,	%g5
	fmovrdlez	%l1,	%f24,	%f6
	ld	[%l7 + 0x48],	%f11
	lduw	[%l7 + 0x08],	%o2
	xor	%i3,	0x0416,	%g2
	edge16ln	%l0,	%l3,	%i1
	move	%icc,	%i7,	%l6
	save %i6, %o6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o3,	%o0,	%i5
	fmovrse	%g6,	%f29,	%f9
	fzeros	%f11
	umul	%o5,	0x1F50,	%l2
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	alignaddr	%o4,	%l4,	%g3
	fmul8x16al	%f26,	%f24,	%f8
	sra	%i2,	0x00,	%i0
	array32	%g7,	%i4,	%g1
	std	%f10,	[%l7 + 0x50]
	sll	%g5,	%l1,	%o7
	udiv	%o2,	0x08C3,	%g2
	umulcc	%l0,	%i3,	%i1
	st	%f15,	[%l7 + 0x60]
	sdiv	%i7,	0x03A0,	%l6
	fmovdvc	%icc,	%f13,	%f26
	fexpand	%f29,	%f2
	fcmped	%fcc3,	%f12,	%f30
	popc	0x1D0C,	%l3
	fcmpes	%fcc3,	%f16,	%f4
	ldx	[%l7 + 0x28],	%i6
	ldx	[%l7 + 0x30],	%l5
	fnor	%f24,	%f30,	%f26
	movne	%icc,	%o6,	%o0
	fnor	%f0,	%f10,	%f6
	fpsub32	%f10,	%f30,	%f4
	stx	%o3,	[%l7 + 0x38]
	subccc	%i5,	%g6,	%o5
	sir	0x1103
	movre	%l2,	%g4,	%o4
	fcmpne32	%f24,	%f18,	%l4
	movpos	%icc,	%g3,	%i2
	fmovrdlz	%i0,	%f18,	%f30
	and	%o1,	%i4,	%g1
	movleu	%icc,	%g5,	%l1
	fmovdpos	%xcc,	%f20,	%f4
	fpadd32	%f20,	%f8,	%f6
	movle	%xcc,	%g7,	%o2
	ldsw	[%l7 + 0x1C],	%g2
	mulx	%l0,	%o7,	%i3
	ldsb	[%l7 + 0x32],	%i7
	smulcc	%l6,	%i1,	%i6
	and	%l3,	%l5,	%o0
	mova	%icc,	%o6,	%o3
	edge8ln	%i5,	%o5,	%g6
	subcc	%g4,	%o4,	%l4
	or	%l2,	%g3,	%i0
	orn	%o1,	%i4,	%i2
	sub	%g5,	%l1,	%g7
	edge16	%o2,	%g1,	%g2
	umulcc	%o7,	%i3,	%l0
	fmovscs	%xcc,	%f27,	%f4
	sdivx	%i7,	0x1649,	%l6
	stw	%i6,	[%l7 + 0x24]
	movl	%icc,	%l3,	%l5
	sethi	0x0239,	%i1
	siam	0x5
	edge32ln	%o6,	%o0,	%o3
	orncc	%i5,	%g6,	%g4
	edge32l	%o5,	%l4,	%l2
	ldd	[%l7 + 0x78],	%f0
	fcmps	%fcc2,	%f17,	%f29
	movleu	%icc,	%o4,	%i0
	fmovrdlez	%o1,	%f10,	%f24
	fnot1s	%f25,	%f4
	subc	%i4,	%i2,	%g5
	umul	%g3,	0x0926,	%g7
	edge16	%l1,	%o2,	%g1
	smulcc	%o7,	0x0A16,	%g2
	movrlez	%i3,	0x15C,	%l0
	edge16	%i7,	%l6,	%l3
	xorcc	%i6,	0x0004,	%l5
	fmul8sux16	%f0,	%f20,	%f6
	move	%xcc,	%i1,	%o0
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f26
	movpos	%icc,	%o6,	%i5
	subcc	%g6,	0x1368,	%o3
	movg	%xcc,	%g4,	%o5
	stb	%l4,	[%l7 + 0x20]
	edge32ln	%l2,	%o4,	%o1
	ldd	[%l7 + 0x18],	%i4
	movrlez	%i0,	0x021,	%i2
	fexpand	%f3,	%f6
	sra	%g5,	0x0C,	%g3
	fmovdl	%icc,	%f5,	%f12
	fands	%f15,	%f29,	%f28
	ldd	[%l7 + 0x40],	%l0
	subccc	%g7,	%o2,	%o7
	movn	%icc,	%g1,	%g2
	srlx	%i3,	0x05,	%l0
	fmovrdlz	%i7,	%f2,	%f4
	fornot2s	%f2,	%f19,	%f27
	movge	%icc,	%l3,	%l6
	movrlz	%l5,	0x20F,	%i1
	fones	%f1
	add	%i6,	0x1543,	%o6
	stw	%o0,	[%l7 + 0x6C]
	std	%f28,	[%l7 + 0x58]
	xor	%g6,	0x17A3,	%i5
	umulcc	%o3,	%g4,	%o5
	fmovdn	%xcc,	%f10,	%f17
	movrlez	%l4,	0x367,	%o4
	fmovdpos	%xcc,	%f23,	%f23
	lduh	[%l7 + 0x7E],	%l2
	umul	%i4,	0x00CF,	%i0
	subc	%i2,	0x1FAF,	%o1
	fmuld8ulx16	%f17,	%f16,	%f8
	movrgz	%g3,	%l1,	%g5
	movleu	%icc,	%o2,	%o7
	udivx	%g1,	0x1616,	%g2
	xnor	%g7,	%i3,	%l0
	movleu	%icc,	%i7,	%l6
	movcc	%xcc,	%l3,	%i1
	xnorcc	%l5,	%i6,	%o0
	movvs	%xcc,	%g6,	%i5
	movle	%icc,	%o3,	%o6
	ldsh	[%l7 + 0x7E],	%g4
	fzero	%f28
	orcc	%o5,	0x1F7E,	%o4
	mulx	%l2,	0x115D,	%i4
	udivx	%i0,	0x15EE,	%i2
	edge16ln	%o1,	%g3,	%l1
	fcmpne32	%f26,	%f26,	%l4
	addccc	%o2,	0x15B6,	%o7
	edge32ln	%g1,	%g5,	%g7
	array8	%g2,	%i3,	%l0
	subcc	%l6,	0x1602,	%l3
	stb	%i7,	[%l7 + 0x54]
	edge16n	%i1,	%l5,	%o0
	ldsw	[%l7 + 0x3C],	%g6
	stb	%i5,	[%l7 + 0x6D]
	umul	%i6,	%o6,	%o3
	sethi	0x1465,	%o5
	lduw	[%l7 + 0x34],	%g4
	edge16n	%l2,	%o4,	%i4
	fornot2	%f0,	%f12,	%f16
	movvc	%icc,	%i0,	%i2
	edge16n	%g3,	%o1,	%l4
	fands	%f14,	%f29,	%f4
	fmovsneg	%icc,	%f28,	%f13
	fmovrde	%l1,	%f24,	%f16
	subcc	%o2,	%o7,	%g1
	sethi	0x06AD,	%g5
	std	%f24,	[%l7 + 0x38]
	movrlz	%g7,	0x186,	%g2
	fmovsn	%xcc,	%f18,	%f13
	movne	%xcc,	%i3,	%l0
	xnorcc	%l6,	0x120C,	%i7
	fcmpgt32	%f28,	%f6,	%l3
	orn	%l5,	0x1CE4,	%i1
	edge16ln	%o0,	%i5,	%i6
	movne	%icc,	%g6,	%o6
	movleu	%xcc,	%o5,	%g4
	popc	%l2,	%o3
	subccc	%o4,	0x16EA,	%i4
	sub	%i2,	%g3,	%i0
	srlx	%o1,	%l1,	%o2
	save %o7, 0x043C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g5,	%g7,	%l4
	mulscc	%g2,	0x0772,	%i3
	andcc	%l0,	%l6,	%i7
	ldsb	[%l7 + 0x77],	%l5
	std	%f26,	[%l7 + 0x38]
	edge16	%l3,	%o0,	%i5
	st	%f16,	[%l7 + 0x7C]
	ldsw	[%l7 + 0x30],	%i1
	fzeros	%f18
	array8	%g6,	%i6,	%o6
	fsrc1s	%f15,	%f19
	smul	%g4,	%o5,	%l2
	srlx	%o4,	0x02,	%o3
	stb	%i4,	[%l7 + 0x78]
	udiv	%g3,	0x158E,	%i0
	restore %i2, 0x0EFB, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o1,	%o7
	addcc	%o2,	%g1,	%g7
	umulcc	%l4,	0x0A2A,	%g2
	fmovd	%f26,	%f0
	fxnors	%f20,	%f2,	%f26
	fsrc2s	%f7,	%f11
	fornot2s	%f25,	%f15,	%f24
	fpsub16s	%f19,	%f26,	%f0
	andncc	%g5,	%i3,	%l0
	fandnot1	%f0,	%f20,	%f6
	mulscc	%l6,	%i7,	%l3
	andcc	%l5,	0x1FB0,	%o0
	std	%f28,	[%l7 + 0x10]
	movn	%xcc,	%i5,	%i1
	fmovsg	%icc,	%f2,	%f15
	fmovrdlz	%i6,	%f22,	%f20
	popc	0x1759,	%g6
	xor	%o6,	0x0B3B,	%g4
	fcmpne32	%f6,	%f12,	%o5
	sdivx	%l2,	0x12A1,	%o4
	fxnors	%f20,	%f0,	%f11
	movrgz	%o3,	%i4,	%i0
	subcc	%i2,	0x00E5,	%l1
	movn	%icc,	%g3,	%o1
	movle	%xcc,	%o2,	%o7
	fmovrdgez	%g7,	%f26,	%f28
	movrgez	%l4,	%g2,	%g1
	mova	%xcc,	%i3,	%g5
	lduh	[%l7 + 0x14],	%l0
	sdivx	%l6,	0x1381,	%i7
	popc	0x0CDA,	%l3
	movrgz	%l5,	0x29C,	%i5
	andncc	%i1,	%o0,	%g6
	orcc	%o6,	%i6,	%g4
	movleu	%icc,	%o5,	%o4
	sir	0x1893
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	sdivx	%i2,	0x1302,	%i0
	movre	%g3,	0x298,	%o1
	movcc	%xcc,	%o2,	%o7
	edge16l	%l1,	%l4,	%g7
	sub	%g1,	%i3,	%g2
	subcc	%l0,	0x102C,	%l6
	sllx	%g5,	0x10,	%l3
	fandnot1s	%f27,	%f14,	%f19
	fcmps	%fcc1,	%f25,	%f0
	edge32	%i7,	%l5,	%i5
	movl	%xcc,	%i1,	%g6
	subc	%o0,	0x0073,	%i6
	fnands	%f20,	%f3,	%f29
	edge8ln	%o6,	%o5,	%o4
	addc	%o3,	0x0AF7,	%g4
	movpos	%icc,	%i4,	%i2
	move	%xcc,	%i0,	%g3
	ldx	[%l7 + 0x10],	%l2
	umulcc	%o1,	%o2,	%l1
	orn	%o7,	0x07D9,	%l4
	array16	%g7,	%i3,	%g2
	fsrc1s	%f10,	%f6
	movl	%icc,	%l0,	%l6
	movrne	%g5,	0x287,	%l3
	fmovsl	%icc,	%f3,	%f28
	movrne	%i7,	%g1,	%l5
	fmul8ulx16	%f24,	%f22,	%f14
	movn	%icc,	%i1,	%g6
	stw	%o0,	[%l7 + 0x10]
	orcc	%i6,	0x0101,	%i5
	subcc	%o6,	%o5,	%o3
	sdivcc	%g4,	0x1646,	%o4
	fnegd	%f18,	%f30
	smulcc	%i4,	%i2,	%i0
	fmovdg	%xcc,	%f15,	%f27
	movneg	%icc,	%g3,	%l2
	fnot2s	%f25,	%f16
	fmovs	%f24,	%f17
	movpos	%xcc,	%o1,	%l1
	orncc	%o2,	0x063E,	%o7
	subc	%l4,	%g7,	%i3
	movn	%xcc,	%g2,	%l6
	edge8n	%g5,	%l3,	%i7
	orcc	%g1,	%l0,	%i1
	fnot2s	%f13,	%f10
	udiv	%g6,	0x1E51,	%l5
	movcs	%icc,	%i6,	%i5
	fpsub16s	%f4,	%f4,	%f22
	save %o0, %o5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o3,	0x0C1,	%g4
	edge16	%o4,	%i2,	%i0
	andncc	%i4,	%g3,	%l2
	fandnot2s	%f19,	%f11,	%f12
	edge32n	%o1,	%l1,	%o7
	sth	%o2,	[%l7 + 0x3E]
	siam	0x7
	movcc	%icc,	%g7,	%l4
	edge8n	%i3,	%g2,	%l6
	array8	%l3,	%g5,	%g1
	movrgz	%l0,	0x1AE,	%i7
	sdivx	%i1,	0x173E,	%g6
	sub	%i6,	%i5,	%l5
	edge16ln	%o0,	%o5,	%o3
	fors	%f27,	%f25,	%f29
	fmovdneg	%xcc,	%f31,	%f9
	add	%o6,	%g4,	%o4
	sdiv	%i0,	0x0F2B,	%i2
	umul	%g3,	%l2,	%o1
	stw	%l1,	[%l7 + 0x60]
	andncc	%o7,	%o2,	%i4
	andcc	%l4,	%g7,	%g2
	lduh	[%l7 + 0x20],	%l6
	alignaddrl	%i3,	%g5,	%l3
	fandnot1	%f24,	%f10,	%f16
	umulcc	%l0,	0x17A5,	%i7
	movge	%xcc,	%i1,	%g6
	edge16l	%i6,	%g1,	%l5
	array8	%o0,	%o5,	%o3
	sth	%i5,	[%l7 + 0x64]
	subc	%o6,	%o4,	%i0
	movvs	%xcc,	%i2,	%g3
	fcmpeq16	%f28,	%f18,	%l2
	fmul8x16au	%f9,	%f17,	%f30
	movpos	%icc,	%o1,	%l1
	ldsb	[%l7 + 0x44],	%o7
	fcmps	%fcc2,	%f4,	%f19
	subcc	%g4,	0x1E01,	%i4
	nop
	set	0x76, %o6
	lduh	[%l7 + %o6],	%l4
	stb	%g7,	[%l7 + 0x31]
	movrgez	%g2,	%l6,	%i3
	lduw	[%l7 + 0x4C],	%o2
	sir	0x0622
	mulx	%l3,	%g5,	%i7
	std	%f18,	[%l7 + 0x50]
	fpsub16	%f14,	%f30,	%f16
	fzero	%f8
	movleu	%icc,	%i1,	%l0
	fands	%f26,	%f4,	%f10
	fmovs	%f23,	%f23
	xnor	%g6,	%i6,	%l5
	fabss	%f2,	%f26
	ldsw	[%l7 + 0x24],	%o0
	movl	%icc,	%g1,	%o5
	srl	%o3,	%i5,	%o6
	srax	%i0,	%i2,	%g3
	movl	%icc,	%o4,	%l2
	edge8	%l1,	%o1,	%g4
	st	%f29,	[%l7 + 0x08]
	ldd	[%l7 + 0x50],	%o6
	stb	%l4,	[%l7 + 0x55]
	fnands	%f24,	%f13,	%f13
	fmovrdlez	%i4,	%f12,	%f6
	edge8ln	%g2,	%g7,	%l6
	movrlez	%o2,	%l3,	%g5
	fcmpd	%fcc0,	%f0,	%f0
	stx	%i3,	[%l7 + 0x40]
	fmovdg	%xcc,	%f23,	%f29
	fsrc2	%f28,	%f0
	smulcc	%i1,	%i7,	%l0
	orncc	%g6,	%i6,	%o0
	sll	%l5,	0x04,	%g1
	movleu	%icc,	%o3,	%o5
	srl	%o6,	%i0,	%i2
	array8	%g3,	%o4,	%l2
	fmovsn	%icc,	%f26,	%f6
	srlx	%l1,	0x05,	%o1
	movleu	%xcc,	%i5,	%o7
	movgu	%icc,	%l4,	%i4
	xor	%g2,	%g7,	%l6
	movgu	%xcc,	%g4,	%l3
	popc	%o2,	%g5
	fmovdvs	%xcc,	%f26,	%f1
	movpos	%icc,	%i3,	%i1
	edge32ln	%l0,	%i7,	%i6
	srl	%g6,	0x04,	%o0
	udiv	%g1,	0x05A1,	%l5
	edge16n	%o3,	%o5,	%o6
	movcc	%icc,	%i2,	%i0
	fandnot2s	%f7,	%f21,	%f17
	udivx	%g3,	0x0145,	%l2
	subc	%o4,	%l1,	%o1
	fone	%f2
	fmovrsne	%o7,	%f12,	%f3
	movvs	%icc,	%i5,	%l4
	sdiv	%g2,	0x1045,	%i4
	fmovrsgz	%g7,	%f7,	%f24
	orn	%g4,	%l6,	%o2
	edge16	%g5,	%l3,	%i3
	stx	%i1,	[%l7 + 0x28]
	movrlez	%l0,	0x3FC,	%i7
	ldx	[%l7 + 0x60],	%i6
	edge16n	%o0,	%g1,	%g6
	alignaddrl	%o3,	%l5,	%o5
	ldsw	[%l7 + 0x60],	%o6
	fsrc1	%f8,	%f8
	edge32	%i2,	%g3,	%l2
	st	%f13,	[%l7 + 0x3C]
	fnor	%f18,	%f8,	%f0
	ldsw	[%l7 + 0x74],	%i0
	sdivcc	%l1,	0x0185,	%o4
	nop
	set	0x28, %g2
	ldx	[%l7 + %g2],	%o1
	ldub	[%l7 + 0x1C],	%i5
	sdivx	%l4,	0x1FAE,	%o7
	fabss	%f5,	%f29
	fmovda	%icc,	%f19,	%f0
	alignaddr	%g2,	%g7,	%g4
	andcc	%l6,	%i4,	%g5
	addc	%l3,	%i3,	%o2
	sdiv	%i1,	0x0C8D,	%l0
	fmovsne	%xcc,	%f21,	%f0
	fmovrsne	%i6,	%f22,	%f11
	sdivx	%i7,	0x07D1,	%g1
	movg	%icc,	%g6,	%o0
	fmovdvs	%icc,	%f17,	%f13
	srl	%o3,	%l5,	%o5
	stw	%i2,	[%l7 + 0x44]
	edge16ln	%o6,	%l2,	%g3
	xor	%l1,	0x08A8,	%o4
	ldub	[%l7 + 0x51],	%o1
	movcs	%xcc,	%i5,	%l4
	sllx	%i0,	%o7,	%g2
	sethi	0x1887,	%g4
	sethi	0x1EC1,	%g7
	nop
	set	0x28, %o3
	stw	%i4,	[%l7 + %o3]
	sll	%g5,	%l6,	%l3
	ldd	[%l7 + 0x68],	%f16
	orn	%o2,	0x0672,	%i1
	edge16l	%l0,	%i3,	%i7
	fsrc2	%f12,	%f30
	subcc	%i6,	0x1462,	%g6
	fmovdleu	%icc,	%f7,	%f17
	movrlez	%g1,	0x1AA,	%o0
	fpsub32s	%f1,	%f3,	%f5
	fmul8x16al	%f25,	%f26,	%f20
	edge32ln	%l5,	%o5,	%o3
	subc	%o6,	%i2,	%l2
	stw	%l1,	[%l7 + 0x7C]
	udivcc	%o4,	0x0928,	%g3
	movvs	%icc,	%o1,	%l4
	fpadd16	%f0,	%f8,	%f30
	fmovsleu	%xcc,	%f12,	%f1
	fzeros	%f27
	srlx	%i5,	%o7,	%g2
	movrne	%i0,	0x06A,	%g4
	subccc	%i4,	%g5,	%l6
	sdivcc	%g7,	0x14A5,	%o2
	andncc	%l3,	%i1,	%l0
	movn	%icc,	%i7,	%i3
	edge16	%i6,	%g6,	%g1
	array32	%l5,	%o5,	%o3
	movvc	%xcc,	%o6,	%o0
	sdivcc	%l2,	0x08BB,	%i2
	movneg	%xcc,	%o4,	%l1
	ld	[%l7 + 0x78],	%f17
	popc	%g3,	%o1
	addcc	%l4,	%i5,	%o7
	movl	%icc,	%i0,	%g4
	smul	%i4,	%g5,	%l6
	sdiv	%g2,	0x11A2,	%g7
	movrgez	%l3,	%o2,	%i1
	lduh	[%l7 + 0x64],	%i7
	smul	%l0,	0x11FD,	%i3
	smul	%i6,	0x0E6E,	%g1
	udiv	%l5,	0x099C,	%g6
	stw	%o3,	[%l7 + 0x74]
	fmovrdlez	%o6,	%f10,	%f0
	lduh	[%l7 + 0x76],	%o0
	st	%f1,	[%l7 + 0x6C]
	array32	%o5,	%l2,	%i2
	st	%f11,	[%l7 + 0x50]
	movle	%icc,	%l1,	%o4
	nop
	set	0x58, %g3
	ldd	[%l7 + %g3],	%o0
	fone	%f28
	sub	%g3,	%i5,	%l4
	stx	%i0,	[%l7 + 0x68]
	popc	%g4,	%i4
	array32	%g5,	%l6,	%o7
	movn	%icc,	%g7,	%g2
	xor	%l3,	%i1,	%o2
	movvc	%xcc,	%l0,	%i7
	fcmpne32	%f12,	%f12,	%i3
	movre	%g1,	%i6,	%g6
	ldsh	[%l7 + 0x76],	%o3
	move	%icc,	%l5,	%o6
	stb	%o5,	[%l7 + 0x5E]
	fmovsvc	%xcc,	%f5,	%f8
	fmovrdlez	%o0,	%f4,	%f8
	movg	%xcc,	%i2,	%l1
	movg	%icc,	%l2,	%o1
	ldsw	[%l7 + 0x44],	%g3
	subcc	%i5,	%l4,	%o4
	orncc	%g4,	%i4,	%i0
	orncc	%l6,	%o7,	%g7
	sub	%g2,	%l3,	%i1
	movleu	%xcc,	%g5,	%o2
	add	%l0,	0x0520,	%i7
	edge8n	%i3,	%g1,	%g6
	sethi	0x136D,	%o3
	edge8	%i6,	%l5,	%o6
	fmovrsgez	%o5,	%f18,	%f6
	udivcc	%i2,	0x0256,	%o0
	and	%l1,	%o1,	%l2
	stb	%g3,	[%l7 + 0x37]
	sllx	%i5,	0x0B,	%l4
	fmul8x16al	%f11,	%f31,	%f28
	ldsh	[%l7 + 0x2C],	%o4
	ldub	[%l7 + 0x4E],	%i4
	xor	%i0,	%l6,	%o7
	fandnot1s	%f6,	%f0,	%f14
	ldx	[%l7 + 0x78],	%g7
	movgu	%icc,	%g2,	%g4
	edge8	%i1,	%g5,	%l3
	addccc	%o2,	%i7,	%l0
	fxor	%f14,	%f4,	%f28
	array32	%g1,	%i3,	%g6
	udivcc	%i6,	0x05AF,	%l5
	edge8n	%o3,	%o5,	%o6
	bshuffle	%f2,	%f16,	%f2
	fcmpd	%fcc2,	%f0,	%f0
	restore %i2, 0x1878, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x3C],	%l1
	ldsw	[%l7 + 0x28],	%o1
	mova	%xcc,	%l2,	%g3
	movneg	%xcc,	%i5,	%o4
	array16	%i4,	%i0,	%l4
	udivx	%l6,	0x09BE,	%g7
	fabsd	%f4,	%f2
	fmovscc	%xcc,	%f17,	%f10
	fabss	%f13,	%f6
	andncc	%o7,	%g4,	%g2
	fandnot1s	%f0,	%f26,	%f0
	subccc	%g5,	0x1886,	%i1
	edge8n	%o2,	%i7,	%l3
	movrgez	%g1,	%i3,	%l0
	movrlez	%i6,	0x36C,	%l5
	fzero	%f4
	lduw	[%l7 + 0x10],	%g6
	movcc	%icc,	%o3,	%o6
	mova	%icc,	%i2,	%o5
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	sir	0x033D
	fmovdgu	%xcc,	%f19,	%f24
	fmovrdgez	%l2,	%f6,	%f14
	srl	%o1,	0x01,	%i5
	array8	%o4,	%i4,	%g3
	ldsh	[%l7 + 0x4E],	%l4
	fxor	%f0,	%f26,	%f6
	sll	%l6,	%g7,	%i0
	fmovsgu	%icc,	%f27,	%f7
	edge32	%o7,	%g2,	%g4
	fsrc1s	%f13,	%f24
	ldx	[%l7 + 0x38],	%g5
	and	%i1,	%i7,	%o2
	edge32l	%l3,	%g1,	%l0
	lduh	[%l7 + 0x0C],	%i3
	movrgz	%i6,	0x0BB,	%g6
	ldsh	[%l7 + 0x12],	%o3
	fmovse	%icc,	%f14,	%f3
	edge32ln	%o6,	%i2,	%o5
	smulcc	%l5,	%o0,	%l1
	pdist	%f6,	%f8,	%f18
	popc	0x1597,	%o1
	and	%i5,	0x0DE2,	%o4
	subcc	%l2,	%i4,	%l4
	umul	%l6,	0x17A1,	%g7
	edge32ln	%i0,	%o7,	%g2
	xnor	%g3,	%g4,	%i1
	alignaddrl	%g5,	%o2,	%l3
	movne	%icc,	%g1,	%l0
	fmovrdgz	%i7,	%f22,	%f26
	mulx	%i3,	0x062C,	%i6
	orcc	%g6,	0x0ECB,	%o6
	fabss	%f29,	%f15
	movgu	%icc,	%o3,	%o5
	movre	%i2,	%l5,	%o0
	fmuld8sux16	%f7,	%f6,	%f12
	movle	%xcc,	%o1,	%i5
	fmovdvc	%xcc,	%f2,	%f27
	srl	%o4,	0x1F,	%l2
	ldsh	[%l7 + 0x44],	%i4
	smul	%l1,	%l6,	%g7
	addccc	%l4,	0x1212,	%o7
	edge32n	%g2,	%i0,	%g3
	fmovdgu	%xcc,	%f0,	%f14
	movre	%g4,	0x2E0,	%i1
	lduw	[%l7 + 0x14],	%o2
	orcc	%g5,	%l3,	%l0
	stb	%i7,	[%l7 + 0x7F]
	fpsub16s	%f20,	%f18,	%f19
	movn	%xcc,	%g1,	%i3
	sir	0x1A56
	movg	%xcc,	%g6,	%i6
	umulcc	%o6,	%o5,	%o3
	fones	%f21
	sir	0x0540
	fpsub16	%f26,	%f26,	%f4
	fmovrde	%l5,	%f30,	%f12
	edge16l	%i2,	%o1,	%i5
	addc	%o0,	0x1E4D,	%o4
	fzero	%f26
	mova	%xcc,	%l2,	%i4
	stw	%l6,	[%l7 + 0x48]
	sir	0x04F6
	umul	%g7,	%l4,	%l1
	addcc	%o7,	%i0,	%g3
	srax	%g4,	0x1E,	%g2
	movgu	%xcc,	%o2,	%g5
	sdivcc	%i1,	0x08B5,	%l0
	movgu	%icc,	%i7,	%l3
	movcc	%xcc,	%g1,	%g6
	fmovsge	%icc,	%f12,	%f29
	ldsh	[%l7 + 0x1C],	%i6
	edge32n	%i3,	%o5,	%o3
	ldub	[%l7 + 0x25],	%l5
	orcc	%i2,	%o1,	%o6
	std	%f12,	[%l7 + 0x30]
	fone	%f2
	fmovsvc	%icc,	%f2,	%f23
	sethi	0x0FF3,	%o0
	xor	%i5,	0x070F,	%l2
	addc	%i4,	0x0864,	%l6
	array16	%o4,	%l4,	%l1
	alignaddrl	%o7,	%i0,	%g3
	stw	%g4,	[%l7 + 0x4C]
	edge32ln	%g7,	%g2,	%o2
	movpos	%icc,	%g5,	%l0
	fmovdne	%icc,	%f13,	%f7
	fmul8x16al	%f21,	%f15,	%f4
	fnot2	%f4,	%f6
	subccc	%i7,	%l3,	%i1
	sllx	%g1,	%g6,	%i6
	udiv	%i3,	0x1ED0,	%o3
	sir	0x1B3B
	subc	%l5,	%i2,	%o5
	ld	[%l7 + 0x38],	%f21
	edge32	%o1,	%o6,	%i5
	movn	%icc,	%o0,	%l2
	sth	%l6,	[%l7 + 0x12]
	edge16	%o4,	%i4,	%l4
	movle	%xcc,	%o7,	%i0
	ldd	[%l7 + 0x68],	%f6
	movrne	%g3,	0x19C,	%g4
	sdivx	%g7,	0x0DEC,	%l1
	st	%f17,	[%l7 + 0x50]
	fpadd32	%f22,	%f4,	%f4
	faligndata	%f30,	%f10,	%f10
	edge16	%o2,	%g5,	%l0
	movpos	%xcc,	%i7,	%g2
	std	%f18,	[%l7 + 0x60]
	fands	%f29,	%f15,	%f11
	xorcc	%l3,	%g1,	%g6
	stx	%i1,	[%l7 + 0x70]
	srlx	%i6,	0x17,	%i3
	fmovd	%f2,	%f6
	subccc	%l5,	%o3,	%i2
	umulcc	%o5,	0x01AD,	%o6
	alignaddrl	%o1,	%o0,	%i5
	faligndata	%f28,	%f24,	%f22
	fpsub16s	%f15,	%f25,	%f14
	addcc	%l6,	%o4,	%i4
	fmovsgu	%icc,	%f27,	%f3
	edge32n	%l2,	%l4,	%o7
	mova	%icc,	%g3,	%g4
	orncc	%g7,	%l1,	%i0
	fmuld8ulx16	%f19,	%f22,	%f28
	edge16ln	%g5,	%o2,	%i7
	srlx	%g2,	0x04,	%l0
	fmovrse	%g1,	%f21,	%f25
	lduw	[%l7 + 0x3C],	%g6
	or	%i1,	%l3,	%i3
	and	%i6,	0x1596,	%l5
	movg	%xcc,	%i2,	%o3
	smul	%o6,	0x06FF,	%o1
	fnot1s	%f10,	%f28
	ldsb	[%l7 + 0x2A],	%o5
	ldd	[%l7 + 0x28],	%f8
	smulcc	%i5,	%o0,	%l6
	movn	%xcc,	%o4,	%l2
	srl	%l4,	%o7,	%g3
	movcc	%xcc,	%g4,	%g7
	movne	%xcc,	%l1,	%i4
	sdivx	%i0,	0x1831,	%g5
	sth	%o2,	[%l7 + 0x0C]
	addcc	%g2,	%i7,	%g1
	movge	%icc,	%l0,	%i1
	andn	%g6,	0x1C9E,	%l3
	fmovsne	%xcc,	%f11,	%f18
	fmovdg	%xcc,	%f6,	%f20
	addc	%i3,	0x08B4,	%l5
	andncc	%i2,	%o3,	%o6
	fcmple16	%f6,	%f26,	%o1
	popc	%i6,	%o5
	movne	%xcc,	%i5,	%l6
	stb	%o0,	[%l7 + 0x75]
	fcmple32	%f4,	%f10,	%o4
	addc	%l4,	%o7,	%g3
	xnorcc	%g4,	%g7,	%l2
	stb	%l1,	[%l7 + 0x7C]
	edge32ln	%i0,	%g5,	%o2
	andcc	%g2,	0x1DB2,	%i4
	smulcc	%i7,	0x1935,	%g1
	alignaddr	%i1,	%l0,	%l3
	movrgz	%g6,	%l5,	%i3
	sub	%i2,	%o6,	%o3
	ldx	[%l7 + 0x48],	%i6
	fcmpes	%fcc2,	%f17,	%f27
	edge16l	%o1,	%i5,	%l6
	sethi	0x08AC,	%o0
	fexpand	%f14,	%f22
	st	%f14,	[%l7 + 0x08]
	movvs	%icc,	%o5,	%l4
	mulx	%o7,	0x10BA,	%g3
	movle	%xcc,	%g4,	%o4
	movvs	%xcc,	%l2,	%g7
	fmovsleu	%icc,	%f24,	%f4
	subcc	%i0,	0x0CC6,	%g5
	movne	%icc,	%o2,	%l1
	alignaddr	%g2,	%i7,	%i4
	addccc	%g1,	0x0D20,	%i1
	sth	%l0,	[%l7 + 0x68]
	ld	[%l7 + 0x30],	%f19
	edge16	%g6,	%l3,	%i3
	movl	%xcc,	%i2,	%l5
	fmovsle	%icc,	%f6,	%f29
	edge32	%o3,	%i6,	%o6
	movvs	%xcc,	%i5,	%l6
	movg	%xcc,	%o1,	%o0
	andcc	%o5,	%l4,	%g3
	fexpand	%f26,	%f4
	sdivx	%o7,	0x1EDF,	%g4
	stb	%o4,	[%l7 + 0x16]
	array32	%g7,	%l2,	%i0
	sub	%o2,	0x15E5,	%g5
	lduh	[%l7 + 0x62],	%l1
	siam	0x1
	fmovspos	%xcc,	%f3,	%f15
	fmovdneg	%icc,	%f27,	%f18
	fnors	%f15,	%f1,	%f29
	addcc	%i7,	0x0535,	%g2
	edge16	%g1,	%i4,	%l0
	stw	%i1,	[%l7 + 0x44]
	stx	%l3,	[%l7 + 0x20]
	andn	%g6,	%i3,	%l5
	movcs	%xcc,	%i2,	%i6
	fpadd16	%f16,	%f8,	%f26
	edge32n	%o3,	%o6,	%i5
	or	%o1,	%l6,	%o5
	movrgez	%l4,	0x346,	%o0
	addc	%g3,	0x0F89,	%o7
	stx	%o4,	[%l7 + 0x70]
	lduw	[%l7 + 0x40],	%g7
	add	%l2,	%i0,	%g4
	edge8l	%o2,	%l1,	%i7
	fmovse	%icc,	%f29,	%f18
	smul	%g2,	%g5,	%i4
	edge8	%g1,	%i1,	%l0
	sll	%l3,	0x1F,	%i3
	lduw	[%l7 + 0x30],	%g6
	smulcc	%l5,	0x16CE,	%i2
	sdivx	%i6,	0x196B,	%o6
	addccc	%o3,	0x17E7,	%i5
	fnot2	%f20,	%f28
	restore %l6, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	fmovsn	%xcc,	%f12,	%f6
	movl	%xcc,	%g3,	%o4
	edge32n	%l2,	%g7,	%g4
	sdivcc	%o2,	0x1014,	%i0
	orn	%l1,	%g2,	%i7
	orn	%g5,	0x01EA,	%i4
	fmovsgu	%icc,	%f12,	%f15
	movcc	%xcc,	%g1,	%l0
	siam	0x3
	fmovspos	%xcc,	%f0,	%f1
	stw	%i1,	[%l7 + 0x28]
	movvc	%icc,	%l3,	%g6
	edge16n	%i3,	%i2,	%i6
	ld	[%l7 + 0x78],	%f27
	mova	%icc,	%l5,	%o3
	array8	%o6,	%i5,	%l6
	edge8n	%o1,	%l4,	%o5
	edge8ln	%o0,	%o7,	%o4
	add	%g3,	0x1695,	%l2
	array8	%g7,	%g4,	%o2
	fnegs	%f29,	%f29
	movpos	%xcc,	%i0,	%g2
	popc	0x0854,	%l1
	fands	%f23,	%f9,	%f15
	umul	%g5,	0x0B22,	%i4
	movg	%icc,	%g1,	%i7
	edge16	%l0,	%i1,	%g6
	subccc	%i3,	%i2,	%l3
	smul	%i6,	%o3,	%o6
	andn	%l5,	%i5,	%l6
	fpadd32	%f10,	%f18,	%f26
	addc	%l4,	0x0A38,	%o1
	movpos	%icc,	%o0,	%o7
	fcmps	%fcc0,	%f5,	%f2
	xnorcc	%o5,	0x08A0,	%g3
	movre	%o4,	0x3D4,	%l2
	srax	%g4,	%o2,	%i0
	xnorcc	%g2,	0x179A,	%g7
	edge32ln	%g5,	%l1,	%i4
	edge32l	%i7,	%l0,	%i1
	edge8ln	%g6,	%g1,	%i2
	udivcc	%l3,	0x0619,	%i6
	or	%i3,	%o6,	%l5
	sllx	%i5,	%l6,	%o3
	fpadd32	%f24,	%f2,	%f14
	fmovdvc	%icc,	%f12,	%f9
	movle	%xcc,	%o1,	%l4
	sllx	%o0,	0x0E,	%o7
	subccc	%o5,	%o4,	%l2
	xor	%g4,	0x1703,	%g3
	sethi	0x0A5F,	%o2
	udiv	%i0,	0x0A31,	%g7
	lduw	[%l7 + 0x2C],	%g5
	fornot1	%f2,	%f2,	%f16
	sdivcc	%l1,	0x18CD,	%g2
	stx	%i4,	[%l7 + 0x10]
	edge32n	%i7,	%i1,	%g6
	fcmpne16	%f0,	%f12,	%g1
	movcs	%icc,	%l0,	%i2
	fmovdge	%icc,	%f27,	%f2
	mulx	%l3,	%i3,	%i6
	bshuffle	%f24,	%f2,	%f14
	umul	%o6,	%i5,	%l6
	fmovrsgez	%o3,	%f25,	%f5
	smul	%l5,	%o1,	%o0
	array32	%o7,	%o5,	%l4
	sir	0x1D52
	ldsb	[%l7 + 0x68],	%o4
	sdivx	%g4,	0x1313,	%g3
	fcmpne32	%f28,	%f22,	%o2
	fmovrdlz	%i0,	%f16,	%f4
	ldsb	[%l7 + 0x10],	%g7
	srlx	%g5,	0x0A,	%l1
	edge32	%g2,	%l2,	%i7
	stx	%i4,	[%l7 + 0x38]
	srax	%i1,	%g6,	%g1
	nop
	set	0x24, %i7
	lduw	[%l7 + %i7],	%l0
	udivx	%i2,	0x17E7,	%i3
	edge8	%i6,	%l3,	%i5
	save %o6, %l6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	%l5,	%o0
	movre	%o5,	%l4,	%o4
	movn	%icc,	%o7,	%g4
	stw	%g3,	[%l7 + 0x64]
	movl	%xcc,	%i0,	%g7
	andncc	%g5,	%l1,	%o2
	subc	%g2,	%i7,	%l2
	sra	%i4,	%i1,	%g1
	nop
	set	0x74, %l1
	lduh	[%l7 + %l1],	%l0
	ldub	[%l7 + 0x43],	%g6
	movvc	%xcc,	%i3,	%i6
	fpsub16	%f2,	%f30,	%f22
	fmovrslez	%l3,	%f20,	%f31
	smul	%i2,	%o6,	%i5
	bshuffle	%f20,	%f8,	%f0
	array8	%l6,	%o3,	%o1
	ldd	[%l7 + 0x68],	%f2
	xnorcc	%l5,	0x133E,	%o0
	fpsub32s	%f28,	%f12,	%f29
	lduw	[%l7 + 0x40],	%l4
	movre	%o4,	0x3C4,	%o5
	movcc	%icc,	%g4,	%g3
	srl	%i0,	0x07,	%o7
	movl	%icc,	%g7,	%g5
	ldsb	[%l7 + 0x79],	%o2
	sub	%g2,	%i7,	%l2
	fmovsgu	%xcc,	%f10,	%f20
	udivx	%i4,	0x059B,	%l1
	edge16l	%g1,	%i1,	%g6
	edge16l	%l0,	%i6,	%l3
	orncc	%i3,	0x14E8,	%i2
	edge32n	%o6,	%l6,	%i5
	movne	%xcc,	%o1,	%o3
	udivx	%l5,	0x07C9,	%l4
	addcc	%o4,	%o0,	%o5
	fmovdn	%xcc,	%f25,	%f15
	mulscc	%g4,	0x030D,	%i0
	fmovdn	%icc,	%f15,	%f15
	fabss	%f17,	%f28
	fcmpgt32	%f4,	%f8,	%o7
	edge8	%g3,	%g5,	%g7
	mova	%xcc,	%g2,	%o2
	popc	%l2,	%i4
	ldsb	[%l7 + 0x2F],	%l1
	ldsw	[%l7 + 0x20],	%i7
	sdivx	%i1,	0x18BE,	%g1
	fmovrdgz	%l0,	%f24,	%f14
	fmovdgu	%icc,	%f15,	%f26
	std	%f6,	[%l7 + 0x68]
	ldub	[%l7 + 0x32],	%i6
	subc	%l3,	0x1B62,	%g6
	xorcc	%i3,	0x1798,	%o6
	or	%l6,	0x1D76,	%i2
	edge8n	%o1,	%o3,	%l5
	fpadd16	%f8,	%f12,	%f22
	fmovdcc	%icc,	%f16,	%f22
	sdiv	%i5,	0x17F8,	%l4
	stx	%o0,	[%l7 + 0x68]
	edge8	%o4,	%g4,	%i0
	ldsb	[%l7 + 0x49],	%o7
	addccc	%o5,	0x132A,	%g3
	add	%g7,	%g5,	%o2
	xnorcc	%l2,	%g2,	%i4
	siam	0x4
	xor	%l1,	0x16BB,	%i1
	fsrc2s	%f7,	%f16
	fnot2s	%f8,	%f18
	movn	%xcc,	%g1,	%i7
	movcc	%xcc,	%l0,	%i6
	pdist	%f14,	%f30,	%f10
	fpackfix	%f26,	%f21
	popc	%g6,	%l3
	umulcc	%i3,	0x13B0,	%o6
	ldd	[%l7 + 0x20],	%f30
	udivcc	%l6,	0x048C,	%o1
	movleu	%icc,	%o3,	%i2
	movrgez	%i5,	0x27C,	%l5
	nop
	set	0x1B, %i6
	ldsb	[%l7 + %i6],	%o0
	subcc	%o4,	%g4,	%l4
	move	%icc,	%o7,	%o5
	fmovd	%f2,	%f16
	smulcc	%i0,	%g3,	%g7
	edge32n	%o2,	%g5,	%g2
	udivcc	%l2,	0x16A2,	%l1
	fmovdvc	%xcc,	%f30,	%f23
	fones	%f0
	fmovspos	%xcc,	%f3,	%f20
	fmovsg	%xcc,	%f4,	%f11
	smul	%i1,	0x071E,	%i4
	fmovdneg	%icc,	%f19,	%f0
	subccc	%g1,	%l0,	%i7
	orn	%g6,	0x1A4D,	%l3
	edge8	%i6,	%i3,	%l6
	subccc	%o1,	0x099A,	%o3
	addc	%i2,	%o6,	%i5
	fmovrse	%l5,	%f27,	%f25
	smul	%o0,	0x0B91,	%g4
	lduh	[%l7 + 0x32],	%l4
	edge16	%o4,	%o7,	%o5
	fmovsneg	%icc,	%f11,	%f28
	udiv	%i0,	0x196D,	%g7
	movge	%icc,	%o2,	%g5
	fpackfix	%f14,	%f19
	movcc	%xcc,	%g3,	%g2
	edge8	%l2,	%l1,	%i4
	xnorcc	%i1,	%l0,	%i7
	movge	%xcc,	%g6,	%g1
	alignaddrl	%i6,	%l3,	%l6
	std	%f28,	[%l7 + 0x48]
	subccc	%o1,	%i3,	%o3
	array32	%o6,	%i5,	%l5
	movle	%icc,	%o0,	%i2
	udivcc	%g4,	0x0084,	%l4
	fpack32	%f20,	%f16,	%f4
	fxor	%f2,	%f6,	%f18
	sdiv	%o7,	0x1961,	%o4
	fpack16	%f2,	%f5
	edge32ln	%o5,	%i0,	%g7
	udivcc	%g5,	0x1E19,	%o2
	sdivcc	%g2,	0x107F,	%g3
	movg	%xcc,	%l1,	%l2
	srlx	%i1,	%l0,	%i4
	movpos	%xcc,	%i7,	%g6
	ldsh	[%l7 + 0x32],	%g1
	edge16ln	%l3,	%i6,	%o1
	andcc	%l6,	0x0FD8,	%o3
	lduw	[%l7 + 0x78],	%o6
	fpsub32s	%f11,	%f19,	%f14
	movrgz	%i3,	%i5,	%l5
	mulx	%o0,	%g4,	%i2
	smul	%o7,	%l4,	%o4
	udivx	%o5,	0x006F,	%i0
	fmovsge	%icc,	%f0,	%f22
	subc	%g5,	%o2,	%g7
	edge8	%g2,	%g3,	%l2
	ldsh	[%l7 + 0x6A],	%l1
	fmovdne	%xcc,	%f26,	%f24
	xorcc	%i1,	%l0,	%i4
	edge32ln	%i7,	%g6,	%g1
	sub	%l3,	0x135C,	%o1
	edge32	%i6,	%l6,	%o6
	edge32ln	%i3,	%i5,	%o3
	fpsub16s	%f14,	%f14,	%f30
	fabsd	%f28,	%f24
	sra	%l5,	%o0,	%i2
	sub	%g4,	%l4,	%o4
	edge16l	%o7,	%i0,	%o5
	fmovrdlz	%g5,	%f28,	%f28
	sdivx	%g7,	0x1C91,	%g2
	fpsub16s	%f5,	%f27,	%f18
	xnorcc	%g3,	%l2,	%o2
	edge32l	%l1,	%i1,	%l0
	movleu	%xcc,	%i4,	%i7
	srl	%g1,	0x03,	%l3
	movg	%xcc,	%g6,	%o1
	stb	%l6,	[%l7 + 0x17]
	xor	%i6,	%i3,	%i5
	move	%icc,	%o3,	%o6
	udivcc	%o0,	0x0DB5,	%i2
	andn	%g4,	0x1125,	%l5
	edge32l	%l4,	%o4,	%i0
	add	%o7,	%g5,	%g7
	movcs	%icc,	%g2,	%o5
	xor	%l2,	0x0714,	%g3
	fxnor	%f28,	%f12,	%f4
	udivcc	%l1,	0x0456,	%i1
	stb	%o2,	[%l7 + 0x49]
	xor	%i4,	%l0,	%i7
	st	%f10,	[%l7 + 0x2C]
	fsrc1s	%f16,	%f4
	fmovdvc	%xcc,	%f5,	%f20
	sllx	%l3,	%g6,	%g1
	stb	%o1,	[%l7 + 0x0A]
	udivcc	%l6,	0x1DC9,	%i6
	ldd	[%l7 + 0x28],	%f10
	addcc	%i3,	0x1E13,	%o3
	umul	%o6,	0x1D55,	%i5
	array16	%o0,	%g4,	%i2
	save %l4, %o4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o7,	%i0,	%g5
	addcc	%g7,	0x0D6A,	%g2
	fmovdpos	%xcc,	%f20,	%f5
	save %o5, %l2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i1,	%l1,	%o2
	edge8n	%l0,	%i7,	%l3
	edge16	%i4,	%g1,	%g6
	edge32n	%o1,	%l6,	%i3
	edge8l	%i6,	%o6,	%o3
	sub	%o0,	0x13A0,	%g4
	fpsub16	%f24,	%f28,	%f10
	srax	%i2,	0x04,	%i5
	movleu	%xcc,	%o4,	%l4
	subc	%o7,	%i0,	%g5
	ldd	[%l7 + 0x28],	%f20
	edge16n	%l5,	%g2,	%o5
	orncc	%l2,	%g7,	%g3
	subccc	%i1,	%o2,	%l0
	fxnors	%f10,	%f15,	%f28
	fornot1s	%f24,	%f12,	%f4
	edge8n	%l1,	%l3,	%i4
	fmovsleu	%icc,	%f18,	%f14
	movn	%icc,	%g1,	%i7
	movgu	%xcc,	%g6,	%o1
	andn	%l6,	0x1244,	%i3
	movg	%xcc,	%i6,	%o6
	movn	%xcc,	%o0,	%g4
	srlx	%i2,	%o3,	%i5
	array8	%l4,	%o7,	%i0
	subcc	%g5,	0x06AE,	%l5
	fcmped	%fcc3,	%f16,	%f0
	subccc	%o4,	%o5,	%l2
	addccc	%g2,	0x00C2,	%g7
	subc	%g3,	0x06C7,	%i1
	edge32l	%l0,	%l1,	%o2
	fnands	%f6,	%f26,	%f17
	fmovse	%icc,	%f16,	%f23
	movre	%i4,	0x168,	%g1
	subcc	%i7,	%l3,	%g6
	fmovrse	%l6,	%f31,	%f11
	fmuld8ulx16	%f30,	%f21,	%f22
	fmovsneg	%icc,	%f15,	%f16
	fpmerge	%f1,	%f1,	%f30
	edge16n	%i3,	%o1,	%o6
	nop
	set	0x78, %i5
	ldsh	[%l7 + %i5],	%o0
	nop
	set	0x1A, %g5
	lduh	[%l7 + %g5],	%g4
	movg	%icc,	%i6,	%i2
	edge8	%i5,	%o3,	%l4
	fmovdg	%xcc,	%f9,	%f1
	nop
	set	0x28, %o1
	stx	%i0,	[%l7 + %o1]
	fmovdgu	%icc,	%f14,	%f2
	movrne	%g5,	%l5,	%o4
	fnegd	%f4,	%f6
	fmovde	%icc,	%f13,	%f19
	smulcc	%o7,	0x00E6,	%l2
	sdivcc	%g2,	0x165D,	%g7
	fmovdn	%xcc,	%f0,	%f11
	sethi	0x1FD1,	%g3
	movcc	%xcc,	%i1,	%o5
	lduh	[%l7 + 0x08],	%l1
	edge16	%l0,	%i4,	%g1
	fmul8sux16	%f4,	%f0,	%f6
	edge8n	%o2,	%i7,	%l3
	sll	%l6,	0x11,	%g6
	movne	%xcc,	%i3,	%o6
	fmovse	%xcc,	%f9,	%f12
	sub	%o1,	0x03F8,	%o0
	nop
	set	0x68, %o4
	stx	%i6,	[%l7 + %o4]
	fmovdpos	%xcc,	%f1,	%f3
	ldub	[%l7 + 0x7D],	%g4
	fnot2	%f30,	%f0
	ldsw	[%l7 + 0x18],	%i2
	fnot2s	%f21,	%f18
	lduw	[%l7 + 0x10],	%o3
	movre	%i5,	0x2C5,	%i0
	add	%l4,	0x1D06,	%l5
	umul	%o4,	0x13D5,	%o7
	fzeros	%f27
	fpsub32s	%f24,	%f16,	%f8
	movrne	%g5,	%g2,	%l2
	or	%g7,	0x1CE9,	%g3
	mulscc	%o5,	%i1,	%l0
	udiv	%l1,	0x1572,	%g1
	edge32	%o2,	%i7,	%i4
	sll	%l3,	0x1D,	%l6
	smulcc	%g6,	%i3,	%o6
	fmovrslez	%o1,	%f10,	%f3
	movrlez	%o0,	%i6,	%g4
	edge32n	%o3,	%i2,	%i5
	stb	%i0,	[%l7 + 0x30]
	fmovdgu	%xcc,	%f8,	%f11
	movrlez	%l4,	%o4,	%o7
	ldsh	[%l7 + 0x58],	%l5
	fmovsleu	%xcc,	%f27,	%f8
	addcc	%g2,	0x1A53,	%g5
	fpack32	%f22,	%f18,	%f28
	movcs	%xcc,	%g7,	%l2
	movgu	%xcc,	%g3,	%o5
	edge8n	%i1,	%l1,	%g1
	fands	%f14,	%f14,	%f21
	ldd	[%l7 + 0x38],	%f14
	movre	%o2,	0x0CB,	%l0
	sdivx	%i4,	0x1157,	%i7
	smul	%l3,	%g6,	%l6
	movneg	%icc,	%o6,	%o1
	sra	%i3,	0x16,	%o0
	andn	%i6,	0x1EAE,	%o3
	movpos	%xcc,	%g4,	%i5
	edge32l	%i0,	%i2,	%l4
	movvc	%icc,	%o7,	%o4
	umulcc	%l5,	%g2,	%g7
	alignaddrl	%g5,	%l2,	%g3
	fabss	%f19,	%f23
	subc	%o5,	%i1,	%l1
	ldx	[%l7 + 0x10],	%o2
	sllx	%l0,	0x01,	%g1
	movcs	%icc,	%i7,	%l3
	umulcc	%i4,	%g6,	%o6
	xnorcc	%o1,	0x054D,	%i3
	fmovdn	%xcc,	%f20,	%f19
	edge8	%o0,	%i6,	%l6
	fmovdgu	%xcc,	%f25,	%f3
	mulscc	%g4,	%i5,	%o3
	movvs	%xcc,	%i2,	%l4
	fabss	%f0,	%f29
	array32	%i0,	%o4,	%l5
	ldsb	[%l7 + 0x1C],	%g2
	movrgez	%g7,	0x18E,	%o7
	addcc	%l2,	%g3,	%g5
	lduw	[%l7 + 0x18],	%o5
	movleu	%icc,	%i1,	%o2
	orcc	%l1,	0x0425,	%g1
	edge16ln	%i7,	%l0,	%l3
	srl	%g6,	0x11,	%o6
	alignaddr	%i4,	%i3,	%o0
	ldsb	[%l7 + 0x53],	%i6
	fcmpeq32	%f8,	%f8,	%l6
	popc	%g4,	%o1
	edge32	%i5,	%i2,	%o3
	srlx	%i0,	0x1A,	%o4
	sdivx	%l4,	0x1428,	%g2
	movvs	%icc,	%g7,	%l5
	movgu	%xcc,	%l2,	%g3
	smulcc	%g5,	0x0694,	%o7
	movl	%xcc,	%i1,	%o5
	movrne	%l1,	%g1,	%i7
	udiv	%l0,	0x092E,	%o2
	orcc	%g6,	%l3,	%o6
	mova	%icc,	%i3,	%o0
	ld	[%l7 + 0x14],	%f9
	movrne	%i4,	%i6,	%g4
	edge16l	%l6,	%i5,	%o1
	sethi	0x15A8,	%o3
	array16	%i0,	%i2,	%l4
	stw	%o4,	[%l7 + 0x38]
	mova	%xcc,	%g7,	%g2
	fmovda	%icc,	%f29,	%f29
	nop
	set	0x44, %g4
	ldsw	[%l7 + %g4],	%l2
	stb	%g3,	[%l7 + 0x0F]
	movg	%xcc,	%l5,	%g5
	orn	%i1,	0x0564,	%o7
	sll	%l1,	%g1,	%o5
	fmul8x16al	%f19,	%f7,	%f2
	ldsb	[%l7 + 0x18],	%i7
	edge16l	%l0,	%o2,	%g6
	sll	%o6,	%l3,	%i3
	and	%o0,	%i4,	%i6
	save %l6, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o3,	0x0D,	%o1
	fmovrse	%i2,	%f23,	%f12
	subcc	%i0,	%l4,	%g7
	fmovs	%f19,	%f11
	addcc	%g2,	0x002E,	%l2
	fpsub32	%f12,	%f16,	%f28
	stx	%g3,	[%l7 + 0x40]
	alignaddrl	%l5,	%o4,	%g5
	subccc	%i1,	%l1,	%o7
	fmovdvc	%icc,	%f24,	%f5
	std	%f14,	[%l7 + 0x10]
	sdivcc	%o5,	0x1D4F,	%g1
	mulx	%i7,	%l0,	%g6
	edge32l	%o6,	%l3,	%i3
	edge16n	%o0,	%i4,	%o2
	movpos	%xcc,	%l6,	%g4
	andcc	%i6,	%i5,	%o1
	movrlez	%o3,	0x190,	%i2
	ldub	[%l7 + 0x2B],	%l4
	stx	%g7,	[%l7 + 0x78]
	fmovrde	%g2,	%f6,	%f2
	andncc	%l2,	%g3,	%l5
	udivcc	%i0,	0x153A,	%o4
	sllx	%g5,	%i1,	%o7
	fandnot1s	%f23,	%f9,	%f1
	fmovdge	%xcc,	%f9,	%f14
	movvc	%xcc,	%o5,	%g1
	addccc	%i7,	0x0C87,	%l1
	fmovdne	%xcc,	%f24,	%f27
	sethi	0x0B2E,	%l0
	ldsh	[%l7 + 0x44],	%o6
	alignaddrl	%l3,	%i3,	%o0
	movrgz	%i4,	%o2,	%g6
	movl	%icc,	%g4,	%l6
	ldd	[%l7 + 0x68],	%f4
	andn	%i6,	%i5,	%o1
	edge8	%i2,	%o3,	%l4
	subcc	%g7,	%g2,	%l2
	or	%g3,	%i0,	%o4
	udivx	%g5,	0x09F2,	%i1
	sth	%l5,	[%l7 + 0x62]
	subc	%o5,	%g1,	%i7
	fnot2	%f20,	%f0
	fnot2s	%f25,	%f18
	movre	%l1,	%o7,	%l0
	edge16n	%l3,	%o6,	%i3
	edge32n	%o0,	%o2,	%i4
	sll	%g6,	%g4,	%l6
	save %i5, %i6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o1,	%l4
	nop
	set	0x48, %g1
	ldd	[%l7 + %g1],	%f16
	udivcc	%o3,	0x0978,	%g7
	movne	%xcc,	%l2,	%g2
	fmovrsgz	%i0,	%f3,	%f16
	movpos	%xcc,	%o4,	%g3
	xor	%g5,	0x0D3C,	%i1
	edge32n	%o5,	%g1,	%l5
	fmovd	%f24,	%f6
	ld	[%l7 + 0x2C],	%f24
	ldsh	[%l7 + 0x6E],	%l1
	alignaddrl	%i7,	%o7,	%l3
	fmovdle	%xcc,	%f3,	%f7
	srax	%o6,	0x0F,	%i3
	stb	%o0,	[%l7 + 0x3F]
	edge8l	%l0,	%o2,	%i4
	movpos	%xcc,	%g6,	%l6
	ldsw	[%l7 + 0x4C],	%g4
	fcmpne16	%f10,	%f20,	%i5
	andcc	%i2,	0x062F,	%o1
	movpos	%icc,	%l4,	%i6
	ldsb	[%l7 + 0x38],	%o3
	fandnot1	%f22,	%f0,	%f0
	sethi	0x0830,	%g7
	stb	%g2,	[%l7 + 0x77]
	movvc	%xcc,	%l2,	%o4
	st	%f5,	[%l7 + 0x28]
	movrgz	%g3,	%g5,	%i1
	fpmerge	%f26,	%f4,	%f16
	fmul8x16au	%f9,	%f26,	%f22
	orcc	%i0,	0x0BA9,	%o5
	fxnors	%f3,	%f5,	%f28
	sdivx	%l5,	0x0D1E,	%g1
	sllx	%l1,	%i7,	%o7
	fmovsgu	%icc,	%f0,	%f19
	ldub	[%l7 + 0x76],	%o6
	movrne	%l3,	0x31D,	%i3
	for	%f18,	%f18,	%f30
	movg	%xcc,	%o0,	%o2
	ldub	[%l7 + 0x4C],	%l0
	fornot2s	%f7,	%f18,	%f26
	movn	%icc,	%i4,	%l6
	fands	%f8,	%f12,	%f6
	fcmple16	%f16,	%f28,	%g4
	move	%xcc,	%g6,	%i2
	nop
	set	0x40, %l5
	stb	%i5,	[%l7 + %l5]
	stw	%l4,	[%l7 + 0x28]
	edge16ln	%i6,	%o3,	%g7
	edge32ln	%o1,	%l2,	%o4
	mulscc	%g3,	0x136A,	%g2
	stw	%i1,	[%l7 + 0x68]
	edge32n	%g5,	%i0,	%l5
	fmovs	%f30,	%f16
	movleu	%xcc,	%g1,	%o5
	movrlez	%l1,	0x20D,	%i7
	array8	%o6,	%l3,	%i3
	array16	%o7,	%o2,	%o0
	std	%f28,	[%l7 + 0x78]
	sth	%i4,	[%l7 + 0x2A]
	edge8n	%l6,	%g4,	%l0
	fmovsle	%xcc,	%f30,	%f11
	fmul8x16au	%f21,	%f27,	%f20
	movrne	%g6,	0x2A0,	%i2
	movre	%i5,	%l4,	%i6
	add	%o3,	%o1,	%g7
	subcc	%o4,	0x1911,	%g3
	subcc	%g2,	%i1,	%g5
	srax	%i0,	%l5,	%l2
	movrlz	%g1,	%l1,	%o5
	stx	%i7,	[%l7 + 0x28]
	ldd	[%l7 + 0x60],	%f10
	fmovrdlez	%o6,	%f26,	%f26
	movpos	%icc,	%i3,	%o7
	edge8l	%l3,	%o0,	%o2
	movg	%icc,	%i4,	%l6
	edge16l	%l0,	%g6,	%i2
	subccc	%i5,	0x0321,	%l4
	smul	%g4,	0x07E8,	%o3
	edge8	%i6,	%o1,	%o4
	alignaddrl	%g3,	%g7,	%g2
	edge32l	%i1,	%g5,	%l5
	sth	%l2,	[%l7 + 0x7C]
	fmovdn	%icc,	%f6,	%f16
	fmovscc	%xcc,	%f18,	%f25
	mova	%icc,	%i0,	%l1
	smul	%o5,	0x0621,	%g1
	xnor	%i7,	%i3,	%o7
	xor	%o6,	%o0,	%l3
	sdivcc	%i4,	0x002E,	%l6
	nop
	set	0x6F, %l0
	ldsb	[%l7 + %l0],	%o2
	xnor	%g6,	%l0,	%i2
	ld	[%l7 + 0x68],	%f5
	bshuffle	%f28,	%f12,	%f22
	ldx	[%l7 + 0x30],	%l4
	udivx	%i5,	0x1DD8,	%g4
	fcmpeq16	%f22,	%f24,	%o3
	movn	%icc,	%i6,	%o1
	sdivx	%g3,	0x04D0,	%o4
	srlx	%g2,	%i1,	%g7
	xnorcc	%g5,	%l2,	%l5
	fmovrslz	%i0,	%f9,	%f6
	udiv	%o5,	0x1790,	%g1
	nop
	set	0x20, %l3
	stx	%l1,	[%l7 + %l3]
	andn	%i7,	0x0CA9,	%o7
	movge	%icc,	%o6,	%o0
	fpack32	%f20,	%f30,	%f24
	movrlz	%i3,	0x2F9,	%l3
	array8	%l6,	%o2,	%g6
	smul	%i4,	%i2,	%l4
	fpadd16s	%f5,	%f21,	%f14
	fornot2	%f4,	%f2,	%f18
	fmovrsgz	%l0,	%f26,	%f2
	addccc	%g4,	0x0E8C,	%i5
	fmovsge	%icc,	%f23,	%f2
	edge16	%o3,	%i6,	%g3
	fpsub32	%f4,	%f0,	%f14
	restore %o4, 0x1279, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i1,	%g2
	fmovdcs	%icc,	%f8,	%f6
	ldsh	[%l7 + 0x78],	%g7
	sth	%g5,	[%l7 + 0x3E]
	xor	%l2,	%i0,	%l5
	udivcc	%g1,	0x1E32,	%o5
	movcs	%icc,	%l1,	%i7
	andncc	%o6,	%o0,	%i3
	andn	%l3,	0x1906,	%l6
	andcc	%o7,	%g6,	%o2
	edge16	%i2,	%l4,	%i4
	sub	%g4,	%i5,	%l0
	fcmps	%fcc1,	%f30,	%f22
	and	%o3,	0x0130,	%i6
	and	%o4,	0x0AE7,	%o1
	movvs	%xcc,	%i1,	%g2
	and	%g3,	0x0CBB,	%g5
	sethi	0x12CB,	%g7
	edge32ln	%i0,	%l5,	%g1
	movge	%xcc,	%l2,	%l1
	movpos	%icc,	%o5,	%i7
	sub	%o6,	0x04B5,	%i3
	xor	%o0,	0x0DF4,	%l3
	and	%o7,	%g6,	%l6
	xnor	%i2,	0x0978,	%o2
	fcmple32	%f2,	%f30,	%i4
	ldx	[%l7 + 0x50],	%l4
	fcmpd	%fcc1,	%f22,	%f28
	fcmpgt32	%f16,	%f22,	%g4
	fnot1	%f8,	%f30
	fornot1s	%f9,	%f2,	%f16
	sub	%l0,	%o3,	%i6
	fmovrdgez	%o4,	%f12,	%f26
	edge32l	%i5,	%i1,	%g2
	fnands	%f22,	%f3,	%f26
	fsrc1	%f6,	%f26
	mova	%xcc,	%o1,	%g5
	xorcc	%g7,	%g3,	%l5
	smul	%i0,	0x0B5C,	%l2
	edge16l	%g1,	%l1,	%i7
	fornot2s	%f1,	%f29,	%f31
	udivcc	%o5,	0x065C,	%o6
	sth	%i3,	[%l7 + 0x36]
	fmovdpos	%icc,	%f15,	%f17
	movre	%o0,	%l3,	%g6
	subcc	%o7,	0x0DFF,	%l6
	add	%o2,	0x14D4,	%i2
	ldd	[%l7 + 0x30],	%f0
	sdivcc	%l4,	0x1F51,	%i4
	lduh	[%l7 + 0x0A],	%l0
	xnor	%g4,	%i6,	%o3
	fones	%f14
	sethi	0x124F,	%o4
	ldsh	[%l7 + 0x56],	%i5
	addc	%i1,	%o1,	%g5
	movvs	%xcc,	%g7,	%g3
	fandnot1	%f14,	%f12,	%f10
	edge16n	%l5,	%g2,	%i0
	xorcc	%l2,	0x12C6,	%g1
	movvs	%icc,	%l1,	%i7
	sra	%o5,	0x0E,	%o6
	udiv	%o0,	0x0D1F,	%i3
	fmovsg	%xcc,	%f27,	%f24
	fabss	%f29,	%f23
	edge16n	%l3,	%g6,	%l6
	edge8n	%o2,	%i2,	%l4
	fmovs	%f27,	%f6
	ldsh	[%l7 + 0x2A],	%o7
	sub	%l0,	0x1F1A,	%g4
	or	%i6,	%i4,	%o4
	movrne	%o3,	0x135,	%i5
	edge16ln	%o1,	%i1,	%g7
	addc	%g5,	0x1A7D,	%l5
	ldub	[%l7 + 0x62],	%g2
	fpadd32	%f8,	%f24,	%f10
	udivcc	%g3,	0x1BB4,	%l2
	movleu	%xcc,	%g1,	%i0
	movl	%xcc,	%i7,	%l1
	fnot1	%f24,	%f14
	movn	%xcc,	%o6,	%o0
	sub	%o5,	0x0F3A,	%l3
	stb	%g6,	[%l7 + 0x43]
	movg	%icc,	%l6,	%o2
	movrlez	%i3,	0x12E,	%l4
	save %o7, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i6,	%i4,	%i2
	addc	%o4,	0x1551,	%i5
	edge8n	%o1,	%o3,	%g7
	edge32l	%i1,	%l5,	%g5
	edge16l	%g2,	%g3,	%l2
	movrlz	%i0,	%i7,	%l1
	fandnot2	%f18,	%f10,	%f0
	edge16n	%o6,	%g1,	%o5
	movle	%xcc,	%o0,	%g6
	addcc	%l3,	%o2,	%l6
	movrlz	%i3,	0x011,	%l4
	add	%l0,	%o7,	%i6
	movre	%g4,	0x26F,	%i4
	edge32	%o4,	%i2,	%o1
	fmul8x16	%f31,	%f2,	%f28
	movvs	%icc,	%i5,	%g7
	fmovrslez	%o3,	%f7,	%f29
	fmul8x16au	%f29,	%f10,	%f6
	lduh	[%l7 + 0x3C],	%l5
	udiv	%g5,	0x1CB6,	%i1
	orncc	%g2,	0x1812,	%g3
	sethi	0x0F7E,	%i0
	movvs	%xcc,	%i7,	%l2
	sdivcc	%l1,	0x1EA9,	%g1
	movne	%icc,	%o6,	%o5
	orcc	%o0,	0x04AA,	%l3
	edge32	%o2,	%g6,	%l6
	lduh	[%l7 + 0x56],	%i3
	fxor	%f6,	%f8,	%f22
	sllx	%l4,	0x0F,	%o7
	srlx	%i6,	0x11,	%l0
	movrgez	%i4,	%o4,	%i2
	st	%f25,	[%l7 + 0x48]
	ld	[%l7 + 0x2C],	%f4
	movpos	%icc,	%g4,	%i5
	movvc	%xcc,	%o1,	%o3
	popc	%g7,	%l5
	addcc	%i1,	0x177A,	%g5
	orcc	%g2,	0x1FCF,	%i0
	array16	%g3,	%i7,	%l1
	edge32	%g1,	%o6,	%o5
	xorcc	%l2,	%l3,	%o2
	sra	%o0,	0x0D,	%l6
	srax	%i3,	%l4,	%o7
	stx	%g6,	[%l7 + 0x20]
	nop
	set	0x10, %l2
	stw	%l0,	[%l7 + %l2]
	addccc	%i6,	0x1253,	%o4
	movneg	%xcc,	%i4,	%g4
	fcmple16	%f4,	%f26,	%i5
	sllx	%i2,	%o1,	%o3
	edge32	%g7,	%l5,	%i1
	ldsw	[%l7 + 0x7C],	%g5
	alignaddr	%i0,	%g2,	%g3
	andn	%l1,	0x13B6,	%g1
	fmul8x16	%f14,	%f16,	%f2
	orncc	%i7,	0x16B7,	%o6
	nop
	set	0x20, %i4
	lduw	[%l7 + %i4],	%l2
	movle	%icc,	%l3,	%o2
	lduh	[%l7 + 0x4C],	%o0
	edge16ln	%l6,	%o5,	%i3
	mulscc	%l4,	0x0C57,	%g6
	sdivx	%o7,	0x0A3C,	%i6
	fcmpne32	%f4,	%f2,	%o4
	movle	%icc,	%l0,	%i4
	umul	%g4,	0x1C29,	%i5
	sra	%o1,	%i2,	%o3
	andncc	%l5,	%g7,	%i1
	andn	%i0,	%g2,	%g3
	andn	%g5,	0x141C,	%g1
	fmovdvs	%icc,	%f24,	%f28
	edge8ln	%i7,	%l1,	%l2
	movneg	%xcc,	%o6,	%l3
	fmovdgu	%xcc,	%f17,	%f25
	fmovrsgz	%o2,	%f14,	%f30
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	addc	%i3,	0x04E5,	%l4
	ldsh	[%l7 + 0x12],	%o5
	edge8l	%o7,	%g6,	%o4
	or	%l0,	%i4,	%i6
	movrne	%i5,	%o1,	%i2
	sir	0x121F
	fmovrsne	%g4,	%f29,	%f22
	umul	%l5,	0x070C,	%o3
	andncc	%i1,	%g7,	%g2
	fcmpne16	%f6,	%f8,	%g3
	sdivcc	%g5,	0x15A2,	%g1
	movrlz	%i0,	0x1D6,	%i7
	fcmped	%fcc0,	%f16,	%f0
	orncc	%l2,	%l1,	%l3
	fnegs	%f12,	%f18
	movrlez	%o2,	0x0B3,	%l6
	subc	%o0,	0x1748,	%i3
	fcmple32	%f12,	%f10,	%l4
	sll	%o6,	%o5,	%o7
	array16	%g6,	%o4,	%l0
	orn	%i6,	0x1C7F,	%i5
	move	%xcc,	%o1,	%i4
	edge8l	%i2,	%l5,	%o3
	orcc	%g4,	0x0B70,	%i1
	movrlez	%g7,	%g2,	%g3
	ldsb	[%l7 + 0x1D],	%g5
	edge32ln	%i0,	%g1,	%l2
	sdiv	%l1,	0x02D3,	%i7
	movgu	%xcc,	%o2,	%l6
	sir	0x1EE9
	alignaddrl	%o0,	%i3,	%l3
	fornot2	%f30,	%f22,	%f16
	movrgez	%o6,	0x29C,	%o5
	fabsd	%f26,	%f10
	array32	%l4,	%g6,	%o4
	ldd	[%l7 + 0x58],	%l0
	edge32l	%o7,	%i5,	%o1
	stx	%i6,	[%l7 + 0x20]
	mulx	%i4,	%l5,	%o3
	edge32n	%i2,	%i1,	%g7
	subcc	%g4,	%g2,	%g3
	fpadd32s	%f17,	%f9,	%f26
	array16	%i0,	%g1,	%l2
	orncc	%g5,	0x0D29,	%l1
	movge	%icc,	%i7,	%l6
	edge32l	%o2,	%i3,	%o0
	fcmps	%fcc0,	%f24,	%f19
	restore %o6, %l3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l4,	%o4
	fmovse	%xcc,	%f24,	%f23
	movl	%icc,	%g6,	%o7
	movrlz	%i5,	0x2CA,	%l0
	add	%o1,	%i6,	%i4
	stx	%o3,	[%l7 + 0x78]
	ldd	[%l7 + 0x18],	%i2
	fmovsvs	%icc,	%f19,	%f7
	fmovdle	%icc,	%f14,	%f2
	save %l5, %g7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f8,	%f24,	%g4
	ldd	[%l7 + 0x68],	%f18
	srax	%g2,	%i0,	%g3
	orncc	%g1,	%g5,	%l1
	movrgez	%l2,	0x38E,	%l6
	movrlz	%i7,	0x3DD,	%o2
	sth	%i3,	[%l7 + 0x68]
	ldsw	[%l7 + 0x18],	%o6
	sllx	%l3,	0x11,	%o0
	addccc	%o5,	%l4,	%o4
	fnor	%f18,	%f22,	%f0
	mova	%xcc,	%o7,	%g6
	subccc	%l0,	%i5,	%o1
	fpadd32	%f20,	%f2,	%f0
	movge	%icc,	%i6,	%o3
	xnorcc	%i4,	%i2,	%g7
	movg	%xcc,	%l5,	%g4
	fsrc2s	%f8,	%f17
	sir	0x0200
	movrgez	%i1,	%g2,	%g3
	fornot2	%f26,	%f26,	%f8
	fmovrsne	%i0,	%f6,	%f5
	orn	%g1,	%g5,	%l1
	fmovrdlez	%l2,	%f24,	%f20
	fpadd32s	%f8,	%f29,	%f17
	fandnot2s	%f6,	%f4,	%f29
	movge	%icc,	%l6,	%i7
	nop
	set	0x30, %i0
	ldd	[%l7 + %i0],	%i2
	edge16	%o6,	%o2,	%l3
	sdivcc	%o0,	0x0422,	%o5
	sir	0x0928
	xnor	%o4,	%o7,	%l4
	array8	%g6,	%l0,	%i5
	edge32l	%o1,	%o3,	%i4
	edge32l	%i2,	%g7,	%i6
	or	%l5,	0x0C6F,	%i1
	movg	%xcc,	%g2,	%g4
	ldd	[%l7 + 0x70],	%f22
	movrlez	%g3,	%g1,	%g5
	udiv	%l1,	0x1140,	%l2
	sdivcc	%l6,	0x1E07,	%i7
	fand	%f22,	%f12,	%f12
	umul	%i3,	0x0EED,	%o6
	umulcc	%o2,	0x1CA5,	%i0
	sir	0x10E5
	fors	%f28,	%f22,	%f19
	subcc	%l3,	0x0D99,	%o5
	xor	%o0,	%o7,	%o4
	array16	%l4,	%l0,	%g6
	edge8ln	%i5,	%o1,	%i4
	sra	%o3,	%i2,	%i6
	movgu	%icc,	%l5,	%g7
	array32	%g2,	%g4,	%i1
	xor	%g1,	0x18B4,	%g5
	fcmped	%fcc1,	%f24,	%f20
	addcc	%g3,	%l1,	%l6
	smulcc	%l2,	%i7,	%o6
	fmul8ulx16	%f20,	%f2,	%f20
	orn	%i3,	%o2,	%i0
	subccc	%o5,	0x043C,	%l3
	fmovdleu	%xcc,	%f16,	%f26
	bshuffle	%f26,	%f16,	%f4
	edge8	%o7,	%o4,	%o0
	movn	%xcc,	%l0,	%l4
	lduw	[%l7 + 0x38],	%i5
	movg	%icc,	%g6,	%i4
	ldsh	[%l7 + 0x76],	%o3
	udiv	%o1,	0x1363,	%i6
	edge8	%l5,	%i2,	%g2
	addcc	%g7,	0x19FD,	%i1
	ldd	[%l7 + 0x78],	%f20
	udiv	%g4,	0x0D28,	%g1
	subccc	%g3,	%g5,	%l6
	sir	0x1DE1
	fmovsleu	%xcc,	%f14,	%f14
	std	%f18,	[%l7 + 0x08]
	subccc	%l1,	%l2,	%o6
	stb	%i3,	[%l7 + 0x79]
	alignaddrl	%o2,	%i7,	%i0
	movg	%xcc,	%o5,	%l3
	fnot1	%f20,	%f28
	edge32l	%o7,	%o0,	%o4
	movcc	%xcc,	%l0,	%i5
	orn	%l4,	0x0AB1,	%g6
	fmovdge	%xcc,	%f31,	%f31
	movne	%icc,	%o3,	%i4
	movvs	%icc,	%o1,	%l5
	fzeros	%f14
	srl	%i6,	%g2,	%g7
	fornot2s	%f1,	%f26,	%f9
	and	%i1,	%g4,	%i2
	movcc	%xcc,	%g3,	%g1
	movrgez	%g5,	%l6,	%l1
	edge8	%l2,	%i3,	%o2
	edge32	%i7,	%i0,	%o5
	andcc	%l3,	%o7,	%o0
	udivcc	%o6,	0x07C7,	%l0
	fmovsleu	%icc,	%f29,	%f26
	edge32ln	%o4,	%l4,	%g6
	addccc	%o3,	%i5,	%i4
	fmovdg	%icc,	%f15,	%f9
	fabss	%f10,	%f8
	sllx	%o1,	%l5,	%g2
	fmovdcc	%icc,	%f8,	%f26
	movrgez	%g7,	%i1,	%i6
	mulscc	%g4,	%g3,	%i2
	edge32l	%g5,	%l6,	%l1
	ldub	[%l7 + 0x7B],	%g1
	sub	%l2,	0x1CCF,	%o2
	udivcc	%i3,	0x0816,	%i7
	movge	%icc,	%o5,	%i0
	sdiv	%o7,	0x12CE,	%l3
	sir	0x0D1B
	ldd	[%l7 + 0x60],	%o6
	umul	%l0,	0x13B2,	%o4
	ldsh	[%l7 + 0x1C],	%o0
	movge	%xcc,	%g6,	%o3
	alignaddrl	%l4,	%i4,	%o1
	umul	%l5,	%i5,	%g7
	srl	%g2,	%i1,	%g4
	umulcc	%g3,	0x1EDD,	%i6
	fcmps	%fcc0,	%f14,	%f11
	ldsh	[%l7 + 0x50],	%i2
	nop
	set	0x5F, %i3
	ldsb	[%l7 + %i3],	%g5
	alignaddrl	%l1,	%g1,	%l2
	movleu	%xcc,	%l6,	%o2
	fornot2s	%f30,	%f8,	%f12
	sdivx	%i3,	0x131B,	%i7
	movl	%xcc,	%o5,	%o7
	edge16n	%l3,	%i0,	%o6
	movpos	%icc,	%l0,	%o4
	fmovse	%xcc,	%f8,	%f14
	movre	%g6,	%o0,	%l4
	fmul8ulx16	%f6,	%f10,	%f0
	fmuld8sux16	%f14,	%f27,	%f30
	xnor	%o3,	%i4,	%o1
	fandnot2	%f22,	%f4,	%f12
	xnor	%i5,	0x1636,	%l5
	add	%g7,	%i1,	%g2
	addccc	%g3,	0x1A83,	%g4
	udiv	%i2,	0x0F2C,	%g5
	edge16n	%l1,	%g1,	%l2
	fmovdneg	%xcc,	%f3,	%f22
	addcc	%i6,	0x04E1,	%o2
	edge8l	%i3,	%i7,	%o5
	sdiv	%l6,	0x172F,	%l3
	nop
	set	0x18, %g7
	ldsb	[%l7 + %g7],	%i0
	subccc	%o6,	0x1D5F,	%l0
	fexpand	%f13,	%f16
	movg	%icc,	%o4,	%o7
	movge	%xcc,	%o0,	%g6
	fmovdvs	%xcc,	%f12,	%f9
	mulx	%o3,	%i4,	%o1
	addc	%l4,	0x0F8A,	%i5
	orcc	%l5,	0x0D8C,	%i1
	array32	%g2,	%g3,	%g7
	sll	%i2,	%g4,	%l1
	lduw	[%l7 + 0x7C],	%g1
	movgu	%icc,	%l2,	%g5
	movg	%xcc,	%i6,	%o2
	ldd	[%l7 + 0x48],	%i6
	movvc	%xcc,	%i3,	%l6
	fxor	%f20,	%f8,	%f30
	popc	0x17F3,	%o5
	nop
	set	0x68, %l6
	stx	%i0,	[%l7 + %l6]
	sll	%o6,	0x11,	%l3
	std	%f0,	[%l7 + 0x08]
	std	%f18,	[%l7 + 0x08]
	move	%icc,	%l0,	%o4
	fcmpeq16	%f8,	%f6,	%o7
	movl	%icc,	%o0,	%o3
	array8	%i4,	%o1,	%g6
	popc	0x06BC,	%l4
	fabsd	%f18,	%f16
	srl	%l5,	%i1,	%g2
	xorcc	%i5,	0x0CAB,	%g7
	fcmpgt16	%f18,	%f14,	%i2
	fmovrslez	%g3,	%f22,	%f14
	ldsb	[%l7 + 0x53],	%g4
	lduw	[%l7 + 0x08],	%l1
	fxors	%f29,	%f5,	%f22
	fone	%f12
	edge8n	%l2,	%g5,	%i6
	sethi	0x12B0,	%g1
	fnegs	%f21,	%f18
	srl	%o2,	%i7,	%i3
	fmovsvs	%xcc,	%f15,	%f22
	orcc	%o5,	0x0955,	%i0
	fmovrse	%l6,	%f12,	%f17
	move	%icc,	%l3,	%l0
	edge32l	%o6,	%o7,	%o4
	mulx	%o3,	%o0,	%o1
	edge8l	%i4,	%g6,	%l4
	movvc	%icc,	%l5,	%g2
	sdivx	%i1,	0x1360,	%g7
	move	%icc,	%i5,	%i2
	edge16ln	%g4,	%l1,	%l2
	fmovsa	%xcc,	%f18,	%f15
	movrgez	%g5,	%i6,	%g3
	alignaddrl	%g1,	%o2,	%i7
	xnor	%i3,	0x0D18,	%o5
	fone	%f0
	fmovde	%xcc,	%f10,	%f26
	ld	[%l7 + 0x58],	%f20
	fmovdg	%xcc,	%f20,	%f4
	fone	%f0
	fmovscs	%xcc,	%f4,	%f10
	smulcc	%i0,	%l3,	%l6
	fpackfix	%f18,	%f24
	fnor	%f0,	%f20,	%f14
	subc	%l0,	%o7,	%o4
	alignaddr	%o3,	%o0,	%o1
	sethi	0x02B8,	%o6
	fzeros	%f20
	mulscc	%g6,	0x034C,	%i4
	movre	%l4,	0x182,	%l5
	addc	%i1,	%g7,	%i5
	xorcc	%i2,	%g4,	%l1
	ldsw	[%l7 + 0x74],	%l2
	fmovrsgz	%g5,	%f22,	%f14
	movne	%xcc,	%g2,	%g3
	fmovse	%icc,	%f22,	%f20
	popc	%g1,	%i6
	ldx	[%l7 + 0x40],	%o2
	movrgez	%i3,	0x3D3,	%i7
	andn	%i0,	%o5,	%l3
	fsrc2	%f16,	%f4
	fcmpgt32	%f6,	%f26,	%l0
	nop
	set	0x0F, %o7
	stb	%o7,	[%l7 + %o7]
	movcc	%xcc,	%o4,	%o3
	edge8	%o0,	%l6,	%o6
	ld	[%l7 + 0x24],	%f30
	subccc	%o1,	%g6,	%l4
	sllx	%l5,	%i4,	%i1
	ldd	[%l7 + 0x40],	%f18
	fand	%f22,	%f26,	%f30
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	xnorcc	%g4,	0x1CB7,	%l1
	fmovscc	%xcc,	%f13,	%f2
	xnorcc	%i2,	%l2,	%g5
	edge16l	%g2,	%g1,	%i6
	srlx	%o2,	0x04,	%i3
	fsrc2	%f12,	%f28
	fornot2s	%f24,	%f30,	%f17
	fands	%f22,	%f17,	%f25
	fcmps	%fcc3,	%f20,	%f23
	udivx	%g3,	0x038E,	%i0
	movvc	%icc,	%i7,	%o5
	subcc	%l3,	0x1118,	%l0
	mulx	%o7,	%o4,	%o0
	srl	%o3,	0x03,	%o6
	fmovde	%xcc,	%f7,	%f9
	sra	%l6,	0x19,	%g6
	movvs	%xcc,	%o1,	%l4
	movrne	%l5,	0x0D2,	%i1
	xnor	%i4,	0x028F,	%g7
	fnot2	%f6,	%f12
	fcmpgt32	%f24,	%f6,	%g4
	sdivcc	%l1,	0x016C,	%i2
	srax	%i5,	%g5,	%g2
	movrgez	%l2,	0x3AA,	%g1
	movl	%icc,	%o2,	%i3
	addc	%g3,	0x179E,	%i6
	ldsb	[%l7 + 0x71],	%i0
	nop
	set	0x22, %o5
	stb	%o5,	[%l7 + %o5]
	stw	%l3,	[%l7 + 0x74]
	mulx	%l0,	%o7,	%i7
	edge32l	%o4,	%o0,	%o6
	movgu	%xcc,	%l6,	%o3
	orncc	%o1,	%l4,	%l5
	xor	%g6,	%i1,	%i4
	fmovsn	%icc,	%f24,	%f16
	udivx	%g4,	0x1C00,	%l1
	edge16l	%i2,	%g7,	%i5
	movneg	%icc,	%g5,	%g2
	fone	%f16
	addcc	%g1,	0x0570,	%o2
	sllx	%l2,	%g3,	%i6
	edge32l	%i0,	%o5,	%i3
	movne	%icc,	%l3,	%o7
	alignaddr	%i7,	%o4,	%o0
	addcc	%o6,	0x0844,	%l6
	movg	%icc,	%l0,	%o3
	and	%o1,	0x1EFF,	%l5
	subc	%l4,	0x158B,	%g6
	fmovdl	%xcc,	%f27,	%f8
	stw	%i1,	[%l7 + 0x18]
	addcc	%g4,	0x03D2,	%l1
	fornot2s	%f11,	%f30,	%f7
	save %i4, %i2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g5,	%f22,	%f10
	edge8ln	%g2,	%g1,	%o2
	subccc	%l2,	%g7,	%i6
	ld	[%l7 + 0x38],	%f18
	alignaddr	%g3,	%o5,	%i0
	ldub	[%l7 + 0x1D],	%l3
	stw	%o7,	[%l7 + 0x58]
	movrgz	%i3,	0x099,	%o4
	xnor	%o0,	0x0D82,	%i7
	and	%l6,	%o6,	%o3
	edge16ln	%l0,	%l5,	%o1
	array32	%l4,	%i1,	%g6
	edge32l	%g4,	%l1,	%i4
	array8	%i5,	%g5,	%g2
	sir	0x158D
	movn	%xcc,	%i2,	%g1
	fcmped	%fcc2,	%f22,	%f2
	sra	%o2,	0x15,	%l2
	movle	%icc,	%i6,	%g3
	save %o5, 0x0E6C, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f18,	%f22,	%f18
	lduw	[%l7 + 0x68],	%g7
	movrgez	%l3,	%o7,	%o4
	movn	%icc,	%i3,	%i7
	and	%o0,	%o6,	%o3
	edge32l	%l6,	%l5,	%o1
	sth	%l0,	[%l7 + 0x5E]
	array8	%i1,	%l4,	%g6
	movcs	%xcc,	%l1,	%g4
	fandnot1	%f14,	%f24,	%f4
	movrlz	%i5,	%i4,	%g2
	sdivx	%i2,	0x0FD2,	%g5
	fmovrsgez	%o2,	%f1,	%f14
	andn	%l2,	%g1,	%g3
	and	%i6,	0x0205,	%o5
	udiv	%g7,	0x02CA,	%l3
	movn	%xcc,	%o7,	%o4
	edge32ln	%i0,	%i3,	%o0
	mulx	%i7,	%o6,	%o3
	fnegs	%f19,	%f15
	ldsw	[%l7 + 0x64],	%l6
	bshuffle	%f2,	%f16,	%f30
	fnot2	%f28,	%f4
	nop
	set	0x18, %i2
	std	%f4,	[%l7 + %i2]
	smulcc	%l5,	0x00A5,	%l0
	fcmpeq32	%f10,	%f0,	%i1
	fcmped	%fcc1,	%f26,	%f16
	ldsh	[%l7 + 0x58],	%l4
	fmovdcc	%xcc,	%f21,	%f7
	ldsh	[%l7 + 0x56],	%g6
	andncc	%o1,	%l1,	%g4
	edge16n	%i4,	%i5,	%i2
	movleu	%icc,	%g2,	%o2
	fexpand	%f31,	%f26
	popc	%l2,	%g1
	fcmpd	%fcc1,	%f26,	%f10
	orncc	%g5,	%g3,	%o5
	nop
	set	0x40, %g6
	ldx	[%l7 + %g6],	%g7
	umulcc	%i6,	%o7,	%o4
	fnot1s	%f0,	%f24
	or	%l3,	0x188A,	%i0
	restore %i3, 0x02BE, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f4
	edge16l	%o6,	%i7,	%l6
	umul	%l5,	%l0,	%i1
	fornot1	%f22,	%f4,	%f6
	movle	%icc,	%o3,	%l4
	subcc	%o1,	0x1DFF,	%l1
	sdivx	%g4,	0x0962,	%g6
	orn	%i4,	%i2,	%i5
	orn	%g2,	0x0F95,	%l2
	edge16l	%g1,	%g5,	%g3
	fmovsg	%icc,	%f17,	%f15
	orncc	%o2,	0x1972,	%o5
	movcc	%xcc,	%g7,	%o7
	edge8n	%o4,	%i6,	%i0
	smul	%l3,	%i3,	%o6
	sth	%i7,	[%l7 + 0x5C]
	fmovrsne	%l6,	%f27,	%f14
	smul	%o0,	0x1EDE,	%l0
	fmul8x16	%f30,	%f28,	%f30
	edge8	%l5,	%o3,	%i1
	andncc	%l4,	%l1,	%o1
	umulcc	%g4,	%g6,	%i4
	save %i5, 0x0733, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l2,	%i2,	%g1
	nop
	set	0x3C, %l4
	lduw	[%l7 + %l4],	%g5
	movge	%icc,	%g3,	%o2
	ldd	[%l7 + 0x48],	%g6
	ld	[%l7 + 0x10],	%f21
	andncc	%o7,	%o5,	%i6
	fzero	%f18
	ldsh	[%l7 + 0x1A],	%i0
	stx	%l3,	[%l7 + 0x40]
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	sdivcc	%o4,	0x0921,	%l6
	sdivcc	%o0,	0x1413,	%i7
	orn	%l5,	0x0BFB,	%o3
	array8	%l0,	%i1,	%l1
	alignaddrl	%o1,	%l4,	%g6
	srlx	%i4,	%i5,	%g4
	sir	0x196B
	popc	0x0A8B,	%g2
	popc	0x1767,	%i2
	srax	%l2,	%g1,	%g3
	fmovsvs	%xcc,	%f17,	%f12
	xorcc	%o2,	0x1365,	%g7
	udivx	%o7,	0x1EE8,	%o5
	movrgez	%i6,	%i0,	%g5
	add	%i3,	0x0382,	%o6
	edge16l	%o4,	%l6,	%o0
	sir	0x1EB0
	fmovsleu	%icc,	%f9,	%f28
	fnor	%f26,	%f12,	%f26
	fmul8x16au	%f24,	%f12,	%f2
	std	%f28,	[%l7 + 0x30]
	smulcc	%i7,	%l5,	%l3
	fpsub16	%f2,	%f2,	%f18
	add	%o3,	0x11BC,	%l0
	alignaddrl	%i1,	%l1,	%o1
	mulscc	%g6,	0x19D3,	%l4
	movrgez	%i4,	0x0C3,	%i5
	smul	%g2,	0x1425,	%g4
	fornot2s	%f7,	%f28,	%f18
	ldsb	[%l7 + 0x71],	%l2
	or	%g1,	%i2,	%g3
	restore %o2, %o7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f28,	%f7
	mulx	%i6,	%i0,	%o5
	movleu	%xcc,	%i3,	%o6
	subccc	%o4,	0x0321,	%l6
	and	%g5,	%o0,	%l5
	movge	%icc,	%l3,	%o3
	popc	0x1CED,	%l0
	edge32ln	%i1,	%i7,	%l1
	edge8ln	%o1,	%g6,	%l4
	array16	%i5,	%i4,	%g4
	fnot1	%f16,	%f0
	nop
	set	0x15, %o0
	stb	%l2,	[%l7 + %o0]
	udiv	%g1,	0x0564,	%i2
	movpos	%xcc,	%g2,	%g3
	fmovda	%icc,	%f20,	%f18
	addcc	%o7,	%o2,	%i6
	ldd	[%l7 + 0x78],	%g6
	stw	%i0,	[%l7 + 0x70]
	movcc	%icc,	%i3,	%o6
	sdivcc	%o5,	0x1767,	%l6
	fcmpgt16	%f14,	%f14,	%g5
	lduh	[%l7 + 0x6E],	%o4
	edge32ln	%o0,	%l5,	%o3
	fcmple32	%f24,	%f14,	%l3
	srax	%i1,	%i7,	%l0
	edge16l	%o1,	%l1,	%l4
	xnorcc	%i5,	%g6,	%g4
	fabsd	%f2,	%f16
	movvc	%icc,	%i4,	%l2
	fmovde	%xcc,	%f12,	%f31
	fcmple32	%f18,	%f2,	%g1
	ldx	[%l7 + 0x48],	%i2
	andncc	%g2,	%o7,	%g3
	fmovdg	%icc,	%f7,	%f15
	faligndata	%f14,	%f6,	%f12
	array8	%i6,	%g7,	%i0
	fcmple32	%f22,	%f0,	%o2
	and	%o6,	0x02CA,	%o5
	andncc	%i3,	%g5,	%l6
	ldd	[%l7 + 0x48],	%f14
	subccc	%o0,	0x0903,	%l5
	mulscc	%o3,	%o4,	%l3
	fnegs	%f21,	%f6
	sth	%i1,	[%l7 + 0x28]
	movle	%xcc,	%l0,	%i7
	alignaddr	%l1,	%l4,	%o1
	sethi	0x04E4,	%g6
	subc	%g4,	%i5,	%l2
	xnorcc	%g1,	%i4,	%g2
	andn	%i2,	0x0BA0,	%o7
	array32	%i6,	%g7,	%i0
	movrgz	%o2,	%o6,	%g3
	fpackfix	%f6,	%f7
	stx	%o5,	[%l7 + 0x20]
	move	%icc,	%i3,	%l6
	array16	%o0,	%g5,	%o3
	lduw	[%l7 + 0x44],	%l5
	fmuld8sux16	%f12,	%f28,	%f14
	udiv	%o4,	0x0FC5,	%l3
	fsrc2s	%f16,	%f11
	edge16n	%l0,	%i7,	%i1
	stx	%l1,	[%l7 + 0x38]
	fmovde	%icc,	%f1,	%f28
	fmovdvs	%xcc,	%f24,	%f0
	sdiv	%l4,	0x05EC,	%o1
	edge8n	%g6,	%i5,	%g4
	addc	%g1,	%l2,	%g2
	smul	%i4,	0x0BAB,	%i2
	sra	%i6,	%g7,	%i0
	movrlz	%o7,	%o6,	%o2
	fmovscs	%xcc,	%f17,	%f23
	stw	%g3,	[%l7 + 0x38]
	umul	%o5,	0x1A01,	%l6
	ldd	[%l7 + 0x78],	%o0
	move	%icc,	%i3,	%g5
	xnor	%l5,	%o4,	%o3
	fmul8x16al	%f17,	%f6,	%f2
	addcc	%l0,	%i7,	%i1
	fmovscc	%icc,	%f10,	%f6
	fcmpgt32	%f26,	%f30,	%l1
	movvc	%xcc,	%l4,	%l3
	smulcc	%o1,	%i5,	%g4
	sdiv	%g6,	0x05F3,	%l2
	stb	%g1,	[%l7 + 0x32]
	or	%g2,	%i2,	%i4
	orn	%i6,	%g7,	%i0
	srl	%o6,	%o2,	%g3
	and	%o7,	0x1474,	%l6
	ldsw	[%l7 + 0x7C],	%o0
	fnot2	%f14,	%f6
	sir	0x1790
	ld	[%l7 + 0x50],	%f20
	mulscc	%o5,	%g5,	%i3
	orncc	%l5,	0x1B5E,	%o3
	ldsw	[%l7 + 0x34],	%l0
	popc	0x16D6,	%i7
	sdiv	%i1,	0x16F1,	%o4
	smulcc	%l1,	%l4,	%o1
	fand	%f0,	%f14,	%f28
	fzero	%f2
	smulcc	%l3,	%g4,	%g6
	umul	%l2,	0x0448,	%i5
	edge16n	%g2,	%i2,	%g1
	sth	%i4,	[%l7 + 0x72]
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%g7
	addc	%i0,	%o6,	%o2
	edge8l	%g3,	%o7,	%i6
	movleu	%xcc,	%l6,	%o5
	fnegs	%f26,	%f18
	movl	%xcc,	%o0,	%g5
	fmovdgu	%icc,	%f21,	%f24
	edge16n	%i3,	%o3,	%l5
	or	%i7,	0x0607,	%i1
	move	%xcc,	%l0,	%o4
	fmovdn	%xcc,	%f26,	%f22
	sth	%l4,	[%l7 + 0x1E]
	sdivcc	%l1,	0x1AE8,	%l3
	stx	%g4,	[%l7 + 0x50]
	array32	%o1,	%g6,	%l2
	ldsw	[%l7 + 0x3C],	%i5
	fcmpgt32	%f30,	%f26,	%g2
	sdiv	%i2,	0x1385,	%g1
	edge16ln	%g7,	%i0,	%i4
	subc	%o6,	0x1330,	%g3
	addcc	%o2,	0x1BD4,	%i6
	movrne	%l6,	0x2F2,	%o7
	ldsh	[%l7 + 0x78],	%o5
	fand	%f12,	%f14,	%f18
	movrgez	%g5,	0x2D3,	%i3
	mulscc	%o3,	%l5,	%o0
	srax	%i1,	0x12,	%l0
	fzeros	%f4
	andcc	%i7,	0x1B1F,	%l4
	andncc	%o4,	%l3,	%g4
	or	%o1,	0x0D7A,	%l1
	fpsub32s	%f12,	%f27,	%f10
	sth	%l2,	[%l7 + 0x36]
	movneg	%icc,	%g6,	%i5
	orncc	%i2,	0x1654,	%g1
	sdiv	%g7,	0x1528,	%g2
	andcc	%i0,	%i4,	%o6
	ldsb	[%l7 + 0x30],	%g3
	andcc	%i6,	%l6,	%o7
	fcmple32	%f12,	%f6,	%o5
	mulx	%g5,	0x110E,	%i3
	umulcc	%o3,	%l5,	%o0
	movl	%icc,	%i1,	%l0
	movn	%icc,	%i7,	%o2
	movrlz	%l4,	%o4,	%g4
	ldsb	[%l7 + 0x2C],	%l3
	fxor	%f24,	%f0,	%f24
	sdiv	%o1,	0x14D9,	%l2
	movne	%xcc,	%g6,	%l1
	orn	%i5,	%i2,	%g1
	fmovsgu	%icc,	%f18,	%f20
	fmul8x16	%f31,	%f18,	%f24
	movre	%g7,	%i0,	%i4
	edge32n	%g2,	%o6,	%i6
	or	%g3,	%l6,	%o7
	add	%o5,	0x0F5A,	%g5
	fcmpne16	%f2,	%f6,	%o3
	fmovdg	%icc,	%f14,	%f21
	popc	0x05A9,	%i3
	udivx	%l5,	0x1EF4,	%o0
	ldsb	[%l7 + 0x7B],	%l0
	movge	%icc,	%i7,	%o2
	movre	%i1,	%o4,	%l4
	xor	%l3,	%g4,	%l2
	movcc	%icc,	%g6,	%o1
	sdivx	%i5,	0x1A65,	%l1
	move	%icc,	%g1,	%g7
	alignaddrl	%i2,	%i0,	%g2
	andcc	%o6,	%i6,	%g3
	fcmpne32	%f4,	%f28,	%l6
	ldd	[%l7 + 0x40],	%o6
	lduw	[%l7 + 0x38],	%o5
	movle	%xcc,	%g5,	%o3
	ldd	[%l7 + 0x18],	%i2
	movle	%xcc,	%l5,	%o0
	orn	%i4,	%l0,	%o2
	ldsw	[%l7 + 0x60],	%i7
	xor	%i1,	%l4,	%o4
	mova	%icc,	%g4,	%l3
	smul	%g6,	0x133B,	%l2
	edge32ln	%o1,	%l1,	%i5
	fmovs	%f19,	%f7
	movcc	%xcc,	%g1,	%i2
	fmovrsgez	%g7,	%f12,	%f12
	movge	%icc,	%g2,	%i0
	movcs	%xcc,	%i6,	%g3
	edge8n	%l6,	%o7,	%o5
	sdiv	%g5,	0x166E,	%o3
	ldsw	[%l7 + 0x78],	%o6
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%l5
	udivcc	%o0,	0x1B2E,	%i3
	srlx	%l0,	%i4,	%i7
	fmovsa	%icc,	%f21,	%f19
	fcmpgt16	%f10,	%f10,	%i1
	edge32n	%l4,	%o2,	%o4
	xor	%g4,	0x051A,	%l3
	movcs	%xcc,	%l2,	%o1
	movleu	%xcc,	%g6,	%l1
	movneg	%xcc,	%g1,	%i5
	ldx	[%l7 + 0x38],	%i2
	mulscc	%g7,	0x18AD,	%i0
	mulscc	%i6,	0x0EA0,	%g3
	array8	%l6,	%o7,	%o5
	siam	0x0
	movcs	%xcc,	%g2,	%g5
	movcs	%xcc,	%o6,	%o3
	ldd	[%l7 + 0x50],	%o0
	edge32ln	%l5,	%l0,	%i4
	fpackfix	%f18,	%f13
	subc	%i3,	%i7,	%l4
	srax	%o2,	0x05,	%o4
	movle	%icc,	%i1,	%l3
	xnor	%l2,	0x1A65,	%o1
	udiv	%g6,	0x1065,	%l1
	edge8l	%g4,	%g1,	%i5
	xnor	%i2,	0x03D6,	%i0
	nop
	set	0x76, %o6
	ldsb	[%l7 + %o6],	%i6
	alignaddr	%g3,	%g7,	%l6
	movneg	%xcc,	%o5,	%g2
	lduw	[%l7 + 0x60],	%o7
	and	%o6,	%g5,	%o3
	mulscc	%l5,	%l0,	%o0
	fpsub16	%f4,	%f6,	%f14
	smulcc	%i3,	%i4,	%l4
	fmovspos	%xcc,	%f15,	%f26
	edge32	%o2,	%i7,	%i1
	fmovdvs	%icc,	%f7,	%f19
	udivx	%l3,	0x0C14,	%o4
	sdivcc	%l2,	0x1150,	%o1
	orcc	%g6,	0x1ADA,	%g4
	sllx	%l1,	0x0E,	%g1
	movn	%xcc,	%i2,	%i0
	xor	%i6,	%g3,	%i5
	edge16n	%g7,	%o5,	%g2
	movl	%xcc,	%l6,	%o7
	fpadd32	%f30,	%f12,	%f30
	edge16ln	%g5,	%o6,	%o3
	stb	%l0,	[%l7 + 0x39]
	fones	%f0
	ldub	[%l7 + 0x64],	%l5
	movrlez	%i3,	%o0,	%i4
	fxnors	%f2,	%f15,	%f12
	fcmpgt16	%f20,	%f26,	%l4
	stx	%o2,	[%l7 + 0x10]
	fmovsleu	%xcc,	%f23,	%f5
	ldub	[%l7 + 0x21],	%i1
	addccc	%i7,	0x12C2,	%o4
	edge32	%l3,	%o1,	%g6
	fabsd	%f18,	%f14
	fmovsne	%xcc,	%f8,	%f7
	move	%xcc,	%l2,	%g4
	sethi	0x15EE,	%g1
	edge32l	%l1,	%i0,	%i6
	ld	[%l7 + 0x34],	%f10
	sub	%g3,	0x1F88,	%i5
	array32	%i2,	%o5,	%g7
	subcc	%g2,	0x0565,	%o7
	sethi	0x003C,	%g5
	fmovrdgez	%l6,	%f26,	%f8
	movneg	%icc,	%o3,	%o6
	ldx	[%l7 + 0x20],	%l5
	edge8	%l0,	%i3,	%i4
	movrgz	%o0,	%o2,	%l4
	subcc	%i7,	0x1D4F,	%o4
	fsrc2	%f0,	%f24
	or	%i1,	0x01AA,	%l3
	addcc	%g6,	%l2,	%o1
	udiv	%g4,	0x1EE0,	%l1
	movrgez	%i0,	0x323,	%i6
	sllx	%g3,	%i5,	%i2
	and	%o5,	%g7,	%g1
	fpack16	%f4,	%f11
	edge16ln	%o7,	%g5,	%l6
	edge8ln	%o3,	%o6,	%l5
	fmovsvs	%xcc,	%f3,	%f10
	edge16l	%l0,	%g2,	%i3
	movrlez	%i4,	%o0,	%o2
	fornot1	%f2,	%f14,	%f20
	movgu	%xcc,	%i7,	%o4
	array8	%l4,	%i1,	%l3
	addcc	%g6,	0x12CB,	%l2
	movcs	%xcc,	%g4,	%l1
	orncc	%o1,	0x17B0,	%i0
	movl	%icc,	%g3,	%i6
	stb	%i2,	[%l7 + 0x27]
	movle	%xcc,	%o5,	%i5
	movre	%g1,	0x0A5,	%g7
	ldsw	[%l7 + 0x40],	%o7
	sir	0x074C
	fmovdvc	%icc,	%f15,	%f7
	movn	%xcc,	%g5,	%o3
	fpsub16	%f6,	%f0,	%f10
	array16	%o6,	%l5,	%l6
	fmovsa	%icc,	%f26,	%f18
	ldd	[%l7 + 0x20],	%f6
	andn	%l0,	0x1022,	%g2
	fpsub16	%f22,	%f24,	%f8
	movvc	%icc,	%i4,	%o0
	movrne	%i3,	%o2,	%i7
	fcmpne16	%f20,	%f28,	%l4
	fmovscc	%xcc,	%f7,	%f3
	fmovrslez	%o4,	%f18,	%f1
	movcs	%icc,	%l3,	%i1
	ldd	[%l7 + 0x40],	%f14
	fpadd16	%f0,	%f14,	%f30
	movrlez	%g6,	%l2,	%l1
	edge16n	%o1,	%i0,	%g4
	xnorcc	%g3,	0x0A70,	%i6
	orncc	%o5,	%i5,	%g1
	fpack32	%f16,	%f26,	%f22
	xnorcc	%g7,	0x1E90,	%o7
	alignaddr	%g5,	%i2,	%o3
	fmul8ulx16	%f8,	%f30,	%f24
	movge	%icc,	%o6,	%l5
	movgu	%xcc,	%l0,	%g2
	sra	%i4,	%o0,	%l6
	bshuffle	%f26,	%f30,	%f2
	addc	%o2,	%i3,	%i7
	fmuld8ulx16	%f1,	%f12,	%f22
	array16	%o4,	%l4,	%i1
	smul	%l3,	0x082E,	%g6
	srlx	%l1,	%l2,	%i0
	edge8ln	%g4,	%g3,	%o1
	movne	%icc,	%i6,	%i5
	movn	%xcc,	%o5,	%g1
	st	%f25,	[%l7 + 0x44]
	fcmpeq32	%f6,	%f18,	%g7
	fpsub16s	%f7,	%f28,	%f3
	xnorcc	%o7,	%i2,	%g5
	fmovdvs	%icc,	%f24,	%f2
	sra	%o6,	%o3,	%l5
	fcmpgt32	%f4,	%f28,	%l0
	fxnor	%f0,	%f4,	%f26
	lduw	[%l7 + 0x40],	%g2
	lduw	[%l7 + 0x24],	%i4
	subcc	%o0,	%o2,	%l6
	edge8n	%i7,	%i3,	%l4
	orn	%o4,	%i1,	%g6
	sir	0x1AA3
	sdivcc	%l3,	0x047E,	%l2
	edge8ln	%i0,	%g4,	%l1
	std	%f18,	[%l7 + 0x20]
	srlx	%g3,	0x15,	%o1
	movrgez	%i5,	0x32C,	%i6
	stx	%o5,	[%l7 + 0x30]
	smulcc	%g1,	0x0F96,	%g7
	umul	%i2,	0x07A1,	%g5
	fmovrsgez	%o7,	%f26,	%f28
	fnands	%f22,	%f6,	%f22
	siam	0x3
	alignaddrl	%o3,	%o6,	%l0
	edge8ln	%g2,	%l5,	%o0
	xnorcc	%o2,	0x06B5,	%l6
	mulx	%i7,	0x1A59,	%i3
	st	%f19,	[%l7 + 0x6C]
	fmul8x16	%f13,	%f12,	%f18
	xorcc	%l4,	%i4,	%o4
	movg	%xcc,	%i1,	%g6
	ldub	[%l7 + 0x15],	%l3
	movrgez	%l2,	%g4,	%i0
	smul	%g3,	%o1,	%i5
	mova	%icc,	%l1,	%i6
	ldub	[%l7 + 0x3E],	%g1
	fmovrdgez	%g7,	%f30,	%f22
	lduh	[%l7 + 0x32],	%o5
	fornot2s	%f16,	%f15,	%f17
	smul	%i2,	0x010A,	%g5
	mulscc	%o3,	%o7,	%l0
	fpadd32s	%f18,	%f29,	%f3
	fpsub32s	%f6,	%f28,	%f31
	ldub	[%l7 + 0x4D],	%g2
	fxor	%f2,	%f0,	%f4
	fandnot2	%f24,	%f20,	%f2
	fmovrslz	%o6,	%f3,	%f1
	andcc	%l5,	%o0,	%o2
	edge32l	%i7,	%i3,	%l4
	edge32ln	%i4,	%o4,	%l6
	sir	0x1F22
	edge32n	%i1,	%g6,	%l3
	fmovdneg	%icc,	%f15,	%f30
	movcc	%icc,	%g4,	%i0
	xorcc	%l2,	%o1,	%g3
	fpsub32s	%f7,	%f30,	%f26
	sdivx	%i5,	0x0D55,	%l1
	subccc	%g1,	%i6,	%g7
	fnors	%f27,	%f19,	%f29
	andn	%o5,	%i2,	%g5
	smul	%o7,	0x174E,	%l0
	or	%g2,	%o6,	%l5
	fmovrdgz	%o0,	%f26,	%f26
	sll	%o2,	0x0C,	%o3
	fcmpeq32	%f18,	%f26,	%i3
	array16	%i7,	%i4,	%o4
	andncc	%l4,	%l6,	%g6
	ldsb	[%l7 + 0x10],	%l3
	stb	%g4,	[%l7 + 0x63]
	movleu	%icc,	%i0,	%l2
	sub	%o1,	%g3,	%i1
	fxnor	%f22,	%f24,	%f24
	fnegd	%f6,	%f24
	mova	%xcc,	%l1,	%g1
	mulx	%i6,	0x0F01,	%g7
	umul	%o5,	0x0CA2,	%i5
	edge8n	%i2,	%o7,	%l0
	edge16n	%g2,	%g5,	%l5
	movre	%o0,	0x223,	%o6
	lduh	[%l7 + 0x6E],	%o3
	xor	%o2,	%i3,	%i7
	edge32l	%i4,	%o4,	%l4
	sir	0x1E97
	movpos	%icc,	%g6,	%l6
	fnot1s	%f12,	%f4
	movn	%xcc,	%g4,	%l3
	array32	%l2,	%o1,	%i0
	xor	%i1,	%l1,	%g1
	mulx	%g3,	%g7,	%i6
	nop
	set	0x78, %o3
	ldd	[%l7 + %o3],	%f16
	smulcc	%o5,	0x174E,	%i2
	fnot1s	%f30,	%f30
	xnorcc	%o7,	%i5,	%l0
	ldub	[%l7 + 0x0B],	%g2
	movvc	%xcc,	%g5,	%l5
	sdivcc	%o0,	0x0043,	%o3
	stb	%o2,	[%l7 + 0x4F]
	mova	%icc,	%o6,	%i7
	movge	%xcc,	%i4,	%i3
	ldsb	[%l7 + 0x0F],	%o4
	sdiv	%g6,	0x14F7,	%l4
	movg	%icc,	%g4,	%l3
	edge32ln	%l6,	%l2,	%o1
	udivcc	%i0,	0x0892,	%i1
	fmovrsgez	%g1,	%f29,	%f4
	move	%icc,	%g3,	%g7
	sll	%l1,	%i6,	%i2
	subccc	%o5,	0x0820,	%o7
	fors	%f17,	%f25,	%f22
	movleu	%icc,	%i5,	%l0
	umulcc	%g5,	0x04B9,	%l5
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	movrne	%o3,	0x03F,	%o2
	udivcc	%i7,	0x1DC6,	%o6
	fmul8x16	%f30,	%f10,	%f16
	ldub	[%l7 + 0x53],	%i4
	fsrc1s	%f20,	%f10
	xorcc	%i3,	%g6,	%o4
	movvs	%xcc,	%l4,	%l3
	nop
	set	0x60, %g3
	ldsw	[%l7 + %g3],	%g4
	edge8ln	%l2,	%o1,	%i0
	xorcc	%i1,	0x0AA5,	%l6
	xorcc	%g1,	%g3,	%l1
	movne	%icc,	%i6,	%g7
	edge8n	%i2,	%o5,	%i5
	movneg	%xcc,	%l0,	%o7
	umulcc	%g5,	0x01EA,	%g2
	movvc	%icc,	%o0,	%o3
	xor	%o2,	%i7,	%o6
	fmovd	%f20,	%f26
	or	%i4,	%i3,	%g6
	nop
	set	0x7E, %i7
	sth	%l5,	[%l7 + %i7]
	mulx	%o4,	%l4,	%g4
	ld	[%l7 + 0x68],	%f4
	ldd	[%l7 + 0x30],	%l2
	addccc	%l2,	0x1E0A,	%o1
	subc	%i1,	0x129B,	%l6
	sth	%g1,	[%l7 + 0x0C]
	orn	%i0,	%l1,	%g3
	edge16n	%g7,	%i2,	%o5
	edge8n	%i5,	%l0,	%i6
	movleu	%xcc,	%g5,	%g2
	movrlz	%o0,	0x332,	%o3
	sdiv	%o2,	0x14EF,	%i7
	sll	%o7,	%o6,	%i3
	fpadd32s	%f21,	%f10,	%f8
	udivx	%g6,	0x16D5,	%l5
	fpack16	%f8,	%f28
	edge16n	%i4,	%l4,	%g4
	movrlez	%l3,	%o4,	%l2
	andncc	%o1,	%i1,	%l6
	movrgz	%i0,	%g1,	%g3
	popc	%l1,	%i2
	edge32	%g7,	%i5,	%l0
	sth	%o5,	[%l7 + 0x20]
	stw	%g5,	[%l7 + 0x0C]
	movcs	%xcc,	%i6,	%g2
	fxors	%f15,	%f13,	%f15
	fmovdge	%xcc,	%f13,	%f31
	edge8	%o0,	%o2,	%o3
	and	%o7,	%i7,	%i3
	restore %g6, %o6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l4,	%g4,	%i4
	ldx	[%l7 + 0x78],	%o4
	fmuld8ulx16	%f19,	%f28,	%f12
	orn	%l2,	0x0FAD,	%l3
	ld	[%l7 + 0x20],	%f10
	fmovsl	%xcc,	%f11,	%f6
	movrgz	%o1,	%i1,	%i0
	sth	%g1,	[%l7 + 0x2E]
	mova	%xcc,	%l6,	%g3
	ld	[%l7 + 0x68],	%f15
	smul	%i2,	%g7,	%l1
	add	%i5,	0x13FC,	%l0
	movl	%xcc,	%o5,	%g5
	orcc	%i6,	%o0,	%g2
	orcc	%o3,	0x0F3D,	%o2
	edge8	%o7,	%i3,	%i7
	movgu	%icc,	%g6,	%o6
	fmovrdlez	%l4,	%f28,	%f26
	sdivcc	%g4,	0x1A1F,	%i4
	fmovdn	%icc,	%f18,	%f9
	ldx	[%l7 + 0x20],	%o4
	orcc	%l5,	%l2,	%o1
	andcc	%l3,	0x14DC,	%i0
	fabss	%f4,	%f21
	edge8n	%i1,	%l6,	%g1
	movcc	%xcc,	%i2,	%g3
	array16	%g7,	%i5,	%l1
	movrlez	%o5,	0x387,	%l0
	srax	%i6,	%o0,	%g2
	stb	%g5,	[%l7 + 0x30]
	movvs	%xcc,	%o2,	%o3
	array32	%i3,	%o7,	%g6
	fcmple16	%f30,	%f4,	%o6
	udiv	%l4,	0x05D0,	%g4
	faligndata	%f20,	%f24,	%f24
	sra	%i4,	0x1F,	%o4
	smulcc	%l5,	%i7,	%l2
	xor	%o1,	%i0,	%i1
	edge32ln	%l3,	%l6,	%i2
	smul	%g1,	%g3,	%i5
	ldd	[%l7 + 0x18],	%f14
	xor	%l1,	%g7,	%o5
	sllx	%i6,	0x0F,	%o0
	sethi	0x0B93,	%l0
	movcs	%xcc,	%g5,	%o2
	fnor	%f12,	%f4,	%f10
	sdivcc	%o3,	0x0DDC,	%i3
	array8	%g2,	%g6,	%o6
	stx	%l4,	[%l7 + 0x48]
	movleu	%icc,	%g4,	%i4
	movcs	%xcc,	%o4,	%o7
	movvs	%xcc,	%i7,	%l5
	smulcc	%o1,	%l2,	%i0
	mova	%xcc,	%l3,	%i1
	ldub	[%l7 + 0x0C],	%l6
	fcmple32	%f14,	%f30,	%i2
	ldx	[%l7 + 0x40],	%g3
	umul	%g1,	%l1,	%i5
	sll	%g7,	0x15,	%i6
	fmovrse	%o5,	%f9,	%f11
	smulcc	%l0,	%o0,	%g5
	srlx	%o3,	%o2,	%i3
	add	%g6,	0x1CF9,	%g2
	sdivcc	%o6,	0x19CA,	%l4
	fxnor	%f0,	%f30,	%f12
	fmovdcc	%xcc,	%f21,	%f25
	mulscc	%g4,	0x1A9F,	%o4
	sth	%o7,	[%l7 + 0x66]
	fpack16	%f14,	%f29
	edge16l	%i7,	%l5,	%o1
	edge8l	%i4,	%l2,	%i0
	udivcc	%i1,	0x00EF,	%l3
	sir	0x05C2
	ldsh	[%l7 + 0x58],	%l6
	ld	[%l7 + 0x0C],	%f21
	umulcc	%g3,	0x1A31,	%i2
	fcmpne32	%f10,	%f10,	%l1
	or	%i5,	%g1,	%i6
	fornot2s	%f20,	%f25,	%f4
	movg	%xcc,	%g7,	%l0
	subc	%o0,	%o5,	%o3
	movgu	%icc,	%o2,	%i3
	edge8ln	%g5,	%g6,	%g2
	fmul8ulx16	%f12,	%f30,	%f0
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	fands	%f26,	%f3,	%f6
	subc	%o4,	0x09F4,	%o7
	edge32ln	%g4,	%i7,	%l5
	udiv	%i4,	0x1860,	%o1
	stb	%i0,	[%l7 + 0x5E]
	xorcc	%l2,	0x0FD5,	%i1
	alignaddrl	%l3,	%g3,	%l6
	edge8	%l1,	%i2,	%g1
	movg	%icc,	%i6,	%g7
	ldsb	[%l7 + 0x18],	%i5
	umul	%o0,	%l0,	%o5
	alignaddrl	%o3,	%i3,	%g5
	mulx	%o2,	%g6,	%g2
	edge16l	%o6,	%l4,	%o4
	fmovrslez	%g4,	%f26,	%f18
	fpsub16	%f12,	%f24,	%f16
	ldsh	[%l7 + 0x3A],	%i7
	ld	[%l7 + 0x60],	%f4
	subcc	%l5,	%o7,	%i4
	move	%icc,	%i0,	%l2
	st	%f22,	[%l7 + 0x60]
	stb	%o1,	[%l7 + 0x66]
	udivx	%i1,	0x09BB,	%l3
	fnand	%f18,	%f18,	%f30
	lduw	[%l7 + 0x20],	%g3
	faligndata	%f0,	%f14,	%f6
	movrgez	%l6,	%i2,	%g1
	movl	%xcc,	%i6,	%l1
	fandnot2s	%f26,	%f6,	%f23
	movl	%xcc,	%i5,	%o0
	lduw	[%l7 + 0x5C],	%g7
	edge32ln	%o5,	%o3,	%l0
	alignaddrl	%i3,	%g5,	%o2
	movn	%xcc,	%g6,	%o6
	movne	%xcc,	%g2,	%l4
	movcs	%xcc,	%o4,	%i7
	alignaddrl	%g4,	%o7,	%i4
	ldd	[%l7 + 0x30],	%i0
	sll	%l2,	%l5,	%o1
	add	%l3,	0x1160,	%g3
	or	%l6,	%i1,	%i2
	fmovrdgez	%g1,	%f12,	%f6
	sllx	%i6,	%i5,	%l1
	orcc	%o0,	0x1CF0,	%o5
	umulcc	%g7,	%l0,	%o3
	movvs	%xcc,	%g5,	%o2
	fmovsleu	%icc,	%f1,	%f9
	sethi	0x00BC,	%g6
	mulx	%i3,	%o6,	%l4
	movleu	%xcc,	%o4,	%g2
	orn	%i7,	0x1A13,	%o7
	fmovdgu	%xcc,	%f14,	%f7
	std	%f16,	[%l7 + 0x10]
	subccc	%g4,	%i0,	%l2
	movrne	%l5,	%o1,	%i4
	xnor	%g3,	%l6,	%i1
	sll	%l3,	0x09,	%i2
	array8	%i6,	%i5,	%l1
	srlx	%o0,	%o5,	%g7
	ldd	[%l7 + 0x18],	%g0
	edge16	%l0,	%o3,	%g5
	movleu	%xcc,	%o2,	%g6
	smulcc	%i3,	0x039D,	%o6
	edge16n	%l4,	%g2,	%i7
	fnand	%f24,	%f26,	%f8
	ldub	[%l7 + 0x34],	%o4
	fcmpd	%fcc2,	%f28,	%f18
	edge32	%o7,	%i0,	%g4
	array8	%l2,	%l5,	%i4
	fcmpne16	%f16,	%f18,	%o1
	fmovsg	%icc,	%f5,	%f12
	addccc	%g3,	%l6,	%l3
	ldd	[%l7 + 0x68],	%i0
	fcmpgt16	%f24,	%f18,	%i6
	movre	%i2,	0x2E7,	%l1
	movcs	%xcc,	%i5,	%o5
	edge32l	%g7,	%g1,	%o0
	orncc	%o3,	0x145A,	%l0
	fmovsge	%icc,	%f22,	%f19
	movrlez	%o2,	0x2E3,	%g6
	movre	%g5,	%i3,	%l4
	movrgz	%g2,	%o6,	%o4
	fmul8x16au	%f28,	%f1,	%f26
	subccc	%i7,	0x101A,	%o7
	mulscc	%g4,	0x0620,	%l2
	edge8l	%i0,	%i4,	%l5
	nop
	set	0x70, %l1
	ldd	[%l7 + %l1],	%o0
	fcmpgt16	%f12,	%f24,	%g3
	edge32l	%l3,	%l6,	%i1
	andncc	%i6,	%i2,	%i5
	nop
	set	0x24, %i6
	lduw	[%l7 + %i6],	%l1
	ldd	[%l7 + 0x28],	%o4
	edge8	%g7,	%o0,	%g1
	fcmpd	%fcc2,	%f16,	%f22
	srlx	%o3,	0x1F,	%l0
	mulx	%o2,	%g5,	%i3
	st	%f30,	[%l7 + 0x0C]
	mulscc	%l4,	%g6,	%o6
	or	%g2,	0x0A48,	%o4
	edge32	%o7,	%i7,	%l2
	xnor	%g4,	0x08CA,	%i4
	fcmps	%fcc2,	%f24,	%f28
	sllx	%l5,	0x02,	%o1
	fnot2s	%f2,	%f12
	fmovrse	%g3,	%f30,	%f14
	addccc	%l3,	%l6,	%i1
	mulscc	%i6,	0x01FB,	%i0
	fpsub16s	%f20,	%f20,	%f30
	ldub	[%l7 + 0x53],	%i2
	edge16	%i5,	%o5,	%l1
	fcmpd	%fcc0,	%f2,	%f4
	fexpand	%f25,	%f30
	movrgez	%o0,	%g7,	%g1
	movcc	%icc,	%o3,	%o2
	fnot1	%f22,	%f10
	save %l0, %i3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g6,	%o6,	%g2
	edge32n	%o4,	%l4,	%i7
	edge8	%o7,	%g4,	%l2
	fmovdleu	%icc,	%f9,	%f11
	faligndata	%f10,	%f6,	%f22
	stw	%i4,	[%l7 + 0x30]
	edge32l	%l5,	%g3,	%o1
	movne	%xcc,	%l3,	%i1
	sethi	0x032B,	%i6
	fmovsle	%icc,	%f18,	%f16
	sll	%l6,	0x17,	%i0
	udiv	%i2,	0x017F,	%o5
	edge32ln	%i5,	%o0,	%l1
	edge32n	%g7,	%g1,	%o3
	alignaddrl	%l0,	%o2,	%g5
	ldub	[%l7 + 0x17],	%i3
	fnot2s	%f20,	%f16
	movvc	%xcc,	%o6,	%g6
	add	%g2,	%o4,	%i7
	edge16ln	%l4,	%o7,	%l2
	movl	%icc,	%g4,	%l5
	fmuld8ulx16	%f2,	%f5,	%f2
	ldd	[%l7 + 0x08],	%g2
	orncc	%i4,	%l3,	%i1
	for	%f0,	%f0,	%f28
	addccc	%i6,	0x03CB,	%o1
	sir	0x0E99
	fmul8sux16	%f12,	%f8,	%f12
	siam	0x4
	movvs	%xcc,	%i0,	%i2
	fmovsleu	%icc,	%f8,	%f20
	fmovdne	%icc,	%f16,	%f27
	movleu	%xcc,	%o5,	%i5
	lduw	[%l7 + 0x40],	%l6
	fsrc2	%f10,	%f12
	subcc	%o0,	0x0CA1,	%g7
	or	%g1,	0x02ED,	%o3
	edge16	%l0,	%l1,	%g5
	movle	%xcc,	%i3,	%o2
	alignaddr	%g6,	%o6,	%g2
	edge16l	%i7,	%o4,	%o7
	movl	%icc,	%l2,	%l4
	umul	%g4,	0x1472,	%g3
	orcc	%i4,	%l3,	%i1
	ld	[%l7 + 0x48],	%f26
	nop
	set	0x1E, %i5
	stb	%l5,	[%l7 + %i5]
	sdivx	%o1,	0x0B6F,	%i0
	orncc	%i2,	0x18BE,	%i6
	stb	%o5,	[%l7 + 0x15]
	array16	%i5,	%l6,	%g7
	edge16ln	%o0,	%g1,	%o3
	fmovd	%f12,	%f26
	fmovrsgez	%l1,	%f8,	%f10
	movrlz	%l0,	0x3E7,	%i3
	fpadd32	%f8,	%f30,	%f8
	ldd	[%l7 + 0x18],	%f10
	movre	%g5,	%g6,	%o6
	orncc	%o2,	0x0163,	%g2
	mulx	%o4,	%o7,	%i7
	movrlz	%l4,	0x3A7,	%l2
	sth	%g3,	[%l7 + 0x20]
	array16	%g4,	%l3,	%i4
	ldub	[%l7 + 0x45],	%l5
	movle	%xcc,	%i1,	%o1
	sdivx	%i2,	0x0B16,	%i0
	mulx	%i6,	0x0C12,	%i5
	move	%icc,	%o5,	%l6
	fmul8x16al	%f27,	%f2,	%f16
	fmovdn	%xcc,	%f10,	%f17
	smul	%o0,	0x17A5,	%g1
	fnands	%f14,	%f3,	%f20
	movcc	%icc,	%o3,	%l1
	fmovdvs	%icc,	%f25,	%f0
	edge16n	%g7,	%i3,	%g5
	ld	[%l7 + 0x1C],	%f25
	movrlez	%l0,	0x260,	%g6
	ldsw	[%l7 + 0x64],	%o2
	mulscc	%g2,	0x196A,	%o4
	fmovdcs	%xcc,	%f28,	%f5
	fmovdvc	%icc,	%f9,	%f28
	fandnot2	%f18,	%f16,	%f28
	movcs	%icc,	%o7,	%i7
	sll	%o6,	0x0B,	%l4
	fmovscs	%icc,	%f16,	%f28
	ldd	[%l7 + 0x08],	%l2
	movcc	%xcc,	%g4,	%l3
	subc	%i4,	0x07FE,	%g3
	nop
	set	0x11, %g2
	ldub	[%l7 + %g2],	%i1
	edge8l	%o1,	%l5,	%i0
	sdiv	%i6,	0x1B28,	%i2
	edge8l	%i5,	%o5,	%o0
	udiv	%l6,	0x067F,	%o3
	mova	%xcc,	%l1,	%g1
	ldsh	[%l7 + 0x6C],	%i3
	movneg	%xcc,	%g5,	%l0
	edge16l	%g7,	%g6,	%o2
	fmovsl	%icc,	%f11,	%f16
	movvs	%xcc,	%o4,	%g2
	mulx	%i7,	0x0D70,	%o6
	sir	0x1CD4
	fmovdvc	%icc,	%f11,	%f16
	lduw	[%l7 + 0x10],	%o7
	fmovrslez	%l2,	%f20,	%f28
	fnegd	%f12,	%f12
	srl	%g4,	%l4,	%l3
	movneg	%icc,	%g3,	%i1
	st	%f6,	[%l7 + 0x7C]
	xorcc	%i4,	%l5,	%i0
	smulcc	%i6,	%o1,	%i5
	movvs	%icc,	%o5,	%o0
	fcmpeq16	%f12,	%f4,	%l6
	movl	%icc,	%o3,	%l1
	movne	%xcc,	%i2,	%i3
	subcc	%g5,	%g1,	%l0
	edge16n	%g6,	%g7,	%o2
	array16	%o4,	%i7,	%o6
	lduh	[%l7 + 0x20],	%o7
	mova	%icc,	%g2,	%l2
	save %l4, 0x1CD1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f24,	%f0,	%g3
	fmovsvc	%xcc,	%f4,	%f17
	edge32ln	%i1,	%i4,	%l5
	xnorcc	%i0,	%i6,	%g4
	alignaddr	%o1,	%i5,	%o5
	movpos	%xcc,	%l6,	%o3
	fmovdg	%xcc,	%f30,	%f16
	fnand	%f12,	%f12,	%f28
	ldd	[%l7 + 0x30],	%f18
	movl	%xcc,	%l1,	%i2
	edge8l	%o0,	%i3,	%g1
	stx	%l0,	[%l7 + 0x30]
	lduw	[%l7 + 0x08],	%g6
	movrlez	%g7,	0x340,	%o2
	xorcc	%g5,	0x01A6,	%i7
	lduh	[%l7 + 0x24],	%o6
	fxors	%f20,	%f15,	%f27
	fnot1	%f2,	%f0
	andcc	%o4,	0x1244,	%o7
	ldx	[%l7 + 0x10],	%g2
	sll	%l4,	%l2,	%g3
	fandnot1s	%f15,	%f16,	%f5
	smul	%l3,	0x1A04,	%i1
	fornot2	%f2,	%f28,	%f12
	edge8n	%l5,	%i4,	%i0
	restore %i6, %g4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i5,	0x0A66,	%l6
	udivx	%o5,	0x1146,	%o3
	movrne	%l1,	%o0,	%i2
	edge16l	%g1,	%i3,	%g6
	edge16n	%g7,	%l0,	%g5
	std	%f22,	[%l7 + 0x78]
	edge32ln	%i7,	%o6,	%o4
	edge8ln	%o2,	%o7,	%l4
	fmovscs	%xcc,	%f9,	%f7
	edge8n	%g2,	%g3,	%l2
	sra	%l3,	%l5,	%i4
	subcc	%i1,	%i0,	%i6
	subccc	%o1,	%g4,	%i5
	movrgez	%o5,	0x20B,	%l6
	fcmps	%fcc3,	%f30,	%f27
	fpmerge	%f8,	%f26,	%f6
	edge8	%l1,	%o0,	%o3
	move	%icc,	%i2,	%g1
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	xnorcc	%g5,	0x10C8,	%l0
	orncc	%o6,	%i7,	%o4
	popc	%o2,	%l4
	xor	%g2,	%g3,	%o7
	save %l2, 0x1BA3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l3,	0x1515,	%i1
	ldub	[%l7 + 0x21],	%i4
	movre	%i0,	%i6,	%o1
	movgu	%xcc,	%g4,	%o5
	movge	%xcc,	%i5,	%l1
	sir	0x0AFB
	fabsd	%f28,	%f20
	fpadd32	%f12,	%f26,	%f18
	fornot2	%f0,	%f30,	%f12
	andcc	%l6,	%o0,	%i2
	fmovrslz	%o3,	%f1,	%f9
	addcc	%g6,	%i3,	%g1
	sra	%g7,	0x09,	%g5
	udiv	%o6,	0x1D35,	%l0
	fmovdle	%icc,	%f3,	%f6
	sir	0x1B18
	ldub	[%l7 + 0x6C],	%o4
	movrgz	%i7,	0x0EF,	%l4
	fsrc2	%f20,	%f22
	edge16l	%o2,	%g2,	%g3
	mulscc	%l2,	0x1989,	%l5
	fzero	%f0
	movge	%icc,	%l3,	%o7
	fsrc1s	%f28,	%f22
	fmovse	%icc,	%f17,	%f22
	mova	%xcc,	%i4,	%i1
	fmovdne	%icc,	%f15,	%f5
	ldx	[%l7 + 0x38],	%i0
	srax	%o1,	0x10,	%g4
	alignaddr	%i6,	%i5,	%o5
	fand	%f26,	%f4,	%f24
	subcc	%l6,	0x180B,	%l1
	mulx	%o0,	%o3,	%i2
	fmul8x16au	%f12,	%f22,	%f26
	siam	0x6
	subcc	%i3,	%g6,	%g1
	edge32	%g5,	%o6,	%l0
	movgu	%xcc,	%o4,	%i7
	mova	%icc,	%g7,	%l4
	save %o2, 0x18AD, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%l2,	%f17,	%f0
	alignaddrl	%l5,	%l3,	%o7
	ldd	[%l7 + 0x58],	%f2
	movrlz	%g2,	%i4,	%i1
	addcc	%o1,	0x0907,	%g4
	ldsw	[%l7 + 0x54],	%i6
	mulscc	%i5,	0x103B,	%i0
	edge32	%l6,	%l1,	%o5
	sllx	%o3,	%o0,	%i3
	ldsb	[%l7 + 0x1F],	%i2
	movrgz	%g1,	0x023,	%g5
	movge	%icc,	%o6,	%l0
	fmovscc	%icc,	%f8,	%f30
	subcc	%o4,	%i7,	%g6
	edge32	%g7,	%o2,	%l4
	nop
	set	0x74, %o1
	lduw	[%l7 + %o1],	%l2
	fmovs	%f7,	%f29
	fmovsle	%xcc,	%f19,	%f24
	fmul8x16au	%f24,	%f18,	%f12
	fcmple16	%f26,	%f2,	%g3
	add	%l3,	%o7,	%l5
	sdivx	%g2,	0x10A8,	%i1
	xor	%o1,	%g4,	%i4
	ldub	[%l7 + 0x37],	%i6
	udivcc	%i0,	0x1862,	%i5
	andncc	%l6,	%l1,	%o5
	add	%o3,	0x074B,	%o0
	movpos	%icc,	%i3,	%g1
	edge32	%g5,	%o6,	%l0
	sth	%o4,	[%l7 + 0x6E]
	array16	%i2,	%g6,	%i7
	edge8l	%g7,	%l4,	%l2
	andcc	%g3,	0x1034,	%l3
	edge8ln	%o2,	%l5,	%g2
	save %i1, %o7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f7,	%f0
	movcs	%icc,	%g4,	%i6
	xnorcc	%i0,	0x0068,	%i5
	sub	%i4,	0x1374,	%l1
	umulcc	%l6,	0x0D74,	%o3
	fcmps	%fcc1,	%f9,	%f9
	srl	%o5,	%o0,	%g1
	movcs	%xcc,	%i3,	%o6
	movn	%xcc,	%l0,	%g5
	alignaddrl	%i2,	%o4,	%i7
	edge8ln	%g7,	%l4,	%l2
	and	%g6,	0x0280,	%l3
	save %o2, 0x1811, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g3,	0x06,	%g2
	sra	%i1,	0x12,	%o7
	movne	%xcc,	%o1,	%g4
	subccc	%i0,	%i5,	%i4
	movre	%l1,	0x208,	%l6
	st	%f19,	[%l7 + 0x78]
	movneg	%icc,	%o3,	%i6
	edge8l	%o0,	%g1,	%o5
	or	%i3,	%o6,	%g5
	movrne	%l0,	0x25F,	%i2
	fpsub16	%f4,	%f16,	%f24
	addcc	%o4,	%i7,	%l4
	fcmps	%fcc1,	%f20,	%f8
	movneg	%icc,	%l2,	%g7
	movge	%icc,	%g6,	%o2
	add	%l5,	0x04EB,	%l3
	stw	%g3,	[%l7 + 0x54]
	fcmple16	%f12,	%f0,	%i1
	udivcc	%o7,	0x0807,	%g2
	and	%g4,	0x1DA5,	%o1
	lduw	[%l7 + 0x1C],	%i5
	movge	%icc,	%i4,	%l1
	and	%l6,	%o3,	%i6
	fcmpgt32	%f4,	%f14,	%o0
	ldd	[%l7 + 0x70],	%f26
	smul	%g1,	%o5,	%i3
	movvs	%icc,	%o6,	%g5
	fands	%f12,	%f25,	%f11
	umul	%l0,	%i2,	%i0
	or	%o4,	%i7,	%l2
	fmovrdne	%g7,	%f18,	%f12
	edge32	%l4,	%o2,	%g6
	fpsub16	%f4,	%f12,	%f0
	fmovdvs	%icc,	%f19,	%f7
	fandnot1s	%f6,	%f1,	%f5
	umul	%l3,	0x0CA4,	%l5
	sdivx	%g3,	0x027F,	%i1
	movpos	%xcc,	%o7,	%g4
	or	%g2,	0x0E91,	%o1
	sll	%i5,	%i4,	%l6
	addccc	%o3,	0x0FD5,	%l1
	movn	%xcc,	%o0,	%g1
	ldsb	[%l7 + 0x35],	%o5
	ldx	[%l7 + 0x28],	%i6
	mulscc	%o6,	0x195E,	%i3
	ldd	[%l7 + 0x10],	%g4
	srax	%l0,	%i0,	%o4
	movn	%icc,	%i2,	%l2
	fcmpgt16	%f0,	%f26,	%g7
	movvs	%icc,	%l4,	%i7
	subcc	%o2,	0x1850,	%l3
	alignaddr	%l5,	%g6,	%g3
	fnegs	%f20,	%f25
	fmovdne	%xcc,	%f22,	%f17
	orcc	%i1,	0x0999,	%g4
	umul	%o7,	%g2,	%i5
	movrgez	%i4,	0x043,	%o1
	edge16	%o3,	%l1,	%l6
	addcc	%o0,	0x047A,	%o5
	fnot2	%f12,	%f8
	umulcc	%i6,	%o6,	%i3
	siam	0x3
	edge8l	%g1,	%g5,	%l0
	xorcc	%o4,	%i0,	%i2
	movne	%xcc,	%l2,	%g7
	umul	%i7,	%o2,	%l3
	movle	%xcc,	%l5,	%g6
	fornot2s	%f28,	%f20,	%f22
	sth	%l4,	[%l7 + 0x2C]
	addc	%i1,	%g3,	%g4
	movneg	%icc,	%o7,	%i5
	movn	%xcc,	%i4,	%o1
	ldsb	[%l7 + 0x58],	%o3
	popc	%l1,	%l6
	fnors	%f18,	%f13,	%f26
	fands	%f0,	%f18,	%f0
	sir	0x12C6
	edge16l	%o0,	%g2,	%i6
	fands	%f13,	%f27,	%f11
	addccc	%o5,	%o6,	%i3
	edge16n	%g1,	%l0,	%g5
	sir	0x02E6
	and	%i0,	%o4,	%i2
	ldsh	[%l7 + 0x52],	%l2
	movleu	%icc,	%i7,	%g7
	movneg	%icc,	%o2,	%l3
	sth	%l5,	[%l7 + 0x72]
	movleu	%xcc,	%l4,	%g6
	mova	%xcc,	%g3,	%i1
	fabss	%f22,	%f17
	lduh	[%l7 + 0x40],	%o7
	movvs	%icc,	%g4,	%i4
	fsrc2s	%f15,	%f14
	udiv	%i5,	0x1902,	%o1
	udivcc	%o3,	0x04BD,	%l1
	movn	%icc,	%o0,	%g2
	fnor	%f20,	%f14,	%f0
	edge16n	%l6,	%o5,	%o6
	lduw	[%l7 + 0x24],	%i3
	fmovdpos	%xcc,	%f20,	%f6
	edge32	%i6,	%l0,	%g1
	mova	%xcc,	%g5,	%i0
	movleu	%icc,	%o4,	%i2
	movre	%i7,	%g7,	%o2
	subcc	%l2,	%l3,	%l5
	fmovrsne	%g6,	%f18,	%f19
	movrne	%l4,	%i1,	%o7
	sdivcc	%g4,	0x0A73,	%i4
	fmovspos	%icc,	%f10,	%f3
	array32	%g3,	%i5,	%o3
	xorcc	%o1,	%l1,	%o0
	edge32l	%g2,	%l6,	%o5
	bshuffle	%f12,	%f24,	%f6
	save %i3, %i6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l0,	%g5,	%i0
	edge8l	%o4,	%i2,	%g1
	edge8n	%g7,	%i7,	%o2
	ldx	[%l7 + 0x58],	%l3
	movne	%icc,	%l2,	%l5
	edge32n	%g6,	%l4,	%o7
	orcc	%i1,	%g4,	%i4
	andncc	%i5,	%o3,	%g3
	stb	%o1,	[%l7 + 0x52]
	fornot1s	%f3,	%f19,	%f13
	fxnors	%f8,	%f10,	%f4
	udivcc	%o0,	0x127F,	%g2
	move	%icc,	%l6,	%l1
	array8	%o5,	%i3,	%i6
	movrne	%l0,	%g5,	%i0
	nop
	set	0x34, %o4
	lduh	[%l7 + %o4],	%o6
	movvs	%icc,	%o4,	%i2
	addc	%g1,	0x11A3,	%g7
	fmovspos	%icc,	%f28,	%f10
	sth	%i7,	[%l7 + 0x54]
	ldx	[%l7 + 0x10],	%o2
	movvc	%xcc,	%l2,	%l3
	fandnot1	%f0,	%f14,	%f4
	fmovsl	%icc,	%f29,	%f30
	edge32	%g6,	%l4,	%l5
	edge32ln	%i1,	%o7,	%i4
	edge32l	%g4,	%i5,	%g3
	fmovrsgez	%o3,	%f28,	%f19
	ldd	[%l7 + 0x28],	%f22
	movn	%icc,	%o0,	%g2
	movneg	%xcc,	%o1,	%l1
	edge16n	%l6,	%i3,	%i6
	fcmple32	%f2,	%f12,	%o5
	std	%f30,	[%l7 + 0x28]
	fxors	%f16,	%f5,	%f30
	fmovsleu	%icc,	%f16,	%f18
	ldsh	[%l7 + 0x46],	%l0
	edge32ln	%g5,	%i0,	%o6
	array8	%i2,	%g1,	%o4
	movl	%icc,	%g7,	%i7
	movre	%o2,	0x096,	%l2
	sllx	%g6,	%l4,	%l3
	fcmped	%fcc0,	%f14,	%f28
	alignaddrl	%i1,	%o7,	%l5
	xorcc	%i4,	%i5,	%g3
	andcc	%o3,	0x063D,	%o0
	sub	%g4,	0x17D0,	%o1
	ld	[%l7 + 0x70],	%f13
	sdivx	%l1,	0x17DE,	%g2
	movne	%xcc,	%i3,	%i6
	sth	%o5,	[%l7 + 0x16]
	udivcc	%l6,	0x11D4,	%l0
	move	%icc,	%g5,	%o6
	ldsb	[%l7 + 0x6C],	%i0
	udivx	%g1,	0x132E,	%i2
	andncc	%g7,	%o4,	%i7
	andncc	%l2,	%o2,	%g6
	sub	%l4,	0x04F4,	%l3
	srax	%o7,	%i1,	%i4
	sethi	0x0086,	%l5
	move	%xcc,	%i5,	%o3
	sllx	%o0,	%g3,	%g4
	array32	%o1,	%l1,	%i3
	nop
	set	0x57, %g5
	ldsb	[%l7 + %g5],	%i6
	st	%f0,	[%l7 + 0x1C]
	movgu	%xcc,	%g2,	%l6
	movgu	%icc,	%l0,	%o5
	fpadd16s	%f11,	%f18,	%f6
	movneg	%xcc,	%o6,	%g5
	fmuld8sux16	%f27,	%f19,	%f14
	movneg	%xcc,	%g1,	%i0
	sth	%g7,	[%l7 + 0x14]
	fpsub32	%f24,	%f10,	%f10
	nop
	set	0x6C, %g4
	ldsh	[%l7 + %g4],	%i2
	stx	%i7,	[%l7 + 0x18]
	fors	%f7,	%f29,	%f28
	orcc	%o4,	%l2,	%g6
	sra	%l4,	%o2,	%l3
	udivcc	%i1,	0x1E4A,	%i4
	ldub	[%l7 + 0x6A],	%o7
	fmovrdne	%l5,	%f14,	%f14
	add	%o3,	%o0,	%i5
	smulcc	%g3,	%o1,	%g4
	fmovs	%f25,	%f16
	move	%xcc,	%l1,	%i6
	fcmple32	%f24,	%f4,	%g2
	alignaddrl	%i3,	%l6,	%l0
	edge32	%o6,	%o5,	%g1
	fandnot2	%f16,	%f20,	%f22
	lduh	[%l7 + 0x2C],	%i0
	ldd	[%l7 + 0x20],	%f4
	fzeros	%f18
	fpsub32	%f6,	%f2,	%f16
	fnand	%f28,	%f0,	%f10
	udivcc	%g5,	0x1FCC,	%i2
	fnand	%f0,	%f22,	%f26
	udivx	%g7,	0x1364,	%i7
	fcmpne32	%f4,	%f8,	%l2
	movrgz	%g6,	0x1C0,	%o4
	stb	%l4,	[%l7 + 0x34]
	movgu	%xcc,	%o2,	%l3
	subccc	%i4,	0x019A,	%o7
	fabss	%f25,	%f17
	nop
	set	0x10, %l5
	ldd	[%l7 + %l5],	%i0
	or	%l5,	%o3,	%i5
	sub	%g3,	%o1,	%o0
	nop
	set	0x76, %l0
	ldub	[%l7 + %l0],	%g4
	movne	%icc,	%l1,	%g2
	stw	%i3,	[%l7 + 0x58]
	movcc	%xcc,	%i6,	%l0
	sub	%o6,	0x05CF,	%l6
	stw	%g1,	[%l7 + 0x28]
	lduw	[%l7 + 0x70],	%i0
	edge16n	%g5,	%o5,	%i2
	edge32	%g7,	%i7,	%g6
	fmovdvs	%icc,	%f15,	%f8
	movle	%xcc,	%o4,	%l2
	restore %o2, %l4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpackfix	%f2,	%f1
	ld	[%l7 + 0x18],	%f7
	andncc	%i4,	%i1,	%l5
	movre	%o3,	0x26B,	%o7
	fcmple32	%f18,	%f30,	%g3
	fmul8x16	%f4,	%f4,	%f16
	ldsb	[%l7 + 0x1C],	%i5
	movg	%xcc,	%o1,	%g4
	edge16ln	%l1,	%o0,	%i3
	lduw	[%l7 + 0x2C],	%g2
	array16	%i6,	%l0,	%o6
	subccc	%l6,	%i0,	%g1
	ldx	[%l7 + 0x30],	%o5
	for	%f18,	%f4,	%f16
	alignaddrl	%g5,	%g7,	%i2
	sir	0x01DA
	xnor	%g6,	%i7,	%l2
	udiv	%o2,	0x1FD2,	%o4
	nop
	set	0x64, %g1
	ldsw	[%l7 + %g1],	%l4
	lduh	[%l7 + 0x4E],	%i4
	edge16n	%l3,	%i1,	%o3
	sub	%l5,	%g3,	%i5
	fxors	%f3,	%f17,	%f26
	ldsh	[%l7 + 0x72],	%o7
	mulx	%o1,	0x0D79,	%g4
	fpadd32s	%f9,	%f16,	%f27
	edge8ln	%l1,	%i3,	%g2
	lduw	[%l7 + 0x48],	%o0
	movrne	%i6,	%o6,	%l6
	fcmpgt32	%f26,	%f2,	%i0
	sth	%l0,	[%l7 + 0x48]
	array32	%g1,	%o5,	%g7
	movcs	%icc,	%g5,	%i2
	fmovsvc	%xcc,	%f31,	%f2
	movne	%icc,	%i7,	%l2
	movgu	%icc,	%o2,	%o4
	fmovrde	%l4,	%f12,	%f8
	ldub	[%l7 + 0x10],	%g6
	srl	%i4,	%l3,	%i1
	fcmpeq32	%f14,	%f30,	%o3
	fmovdleu	%xcc,	%f27,	%f24
	movrlz	%g3,	0x221,	%i5
	fmuld8sux16	%f25,	%f7,	%f18
	srax	%o7,	0x11,	%o1
	fxor	%f8,	%f2,	%f18
	andncc	%g4,	%l1,	%i3
	edge32ln	%l5,	%g2,	%i6
	fandnot2	%f24,	%f8,	%f30
	andncc	%o0,	%l6,	%o6
	movn	%xcc,	%l0,	%g1
	fnegs	%f12,	%f5
	edge32	%o5,	%i0,	%g7
	edge16l	%i2,	%i7,	%g5
	sdiv	%l2,	0x157A,	%o4
	movrlz	%o2,	%l4,	%g6
	st	%f29,	[%l7 + 0x58]
	movle	%icc,	%i4,	%i1
	edge16l	%l3,	%g3,	%i5
	edge32n	%o7,	%o1,	%o3
	sdivx	%l1,	0x0CEC,	%i3
	lduw	[%l7 + 0x0C],	%l5
	fcmpgt16	%f2,	%f22,	%g2
	movvs	%xcc,	%i6,	%g4
	umulcc	%l6,	%o0,	%l0
	fmovscc	%icc,	%f5,	%f7
	movneg	%icc,	%o6,	%o5
	srlx	%i0,	%g7,	%g1
	edge16n	%i7,	%i2,	%g5
	lduh	[%l7 + 0x4E],	%l2
	ldsb	[%l7 + 0x0E],	%o2
	movg	%icc,	%o4,	%l4
	sllx	%i4,	%g6,	%l3
	mulx	%i1,	%i5,	%o7
	movleu	%xcc,	%g3,	%o1
	udiv	%o3,	0x1E61,	%i3
	movvc	%xcc,	%l1,	%g2
	fnor	%f6,	%f30,	%f2
	xor	%l5,	0x0F25,	%i6
	smulcc	%l6,	0x1E50,	%o0
	edge32	%g4,	%l0,	%o5
	alignaddr	%o6,	%g7,	%i0
	movneg	%icc,	%g1,	%i2
	edge8	%g5,	%i7,	%o2
	fcmpeq32	%f4,	%f0,	%o4
	movrlz	%l2,	0x38E,	%l4
	ldd	[%l7 + 0x40],	%f6
	edge32ln	%i4,	%l3,	%g6
	movrgz	%i5,	%o7,	%i1
	save %g3, %o1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f28,	%f14,	%f2
	for	%f20,	%f24,	%f8
	edge8n	%l1,	%g2,	%l5
	movne	%icc,	%o3,	%l6
	edge16n	%i6,	%g4,	%o0
	edge32n	%o5,	%l0,	%g7
	sra	%o6,	0x10,	%g1
	umul	%i2,	%g5,	%i0
	andncc	%o2,	%i7,	%l2
	movge	%icc,	%o4,	%l4
	sdivx	%i4,	0x01DC,	%g6
	movrgz	%l3,	%i5,	%o7
	edge8n	%i1,	%g3,	%i3
	fmovsleu	%xcc,	%f13,	%f18
	fandnot2s	%f3,	%f1,	%f5
	ldsh	[%l7 + 0x44],	%l1
	array16	%g2,	%l5,	%o1
	xorcc	%l6,	0x1353,	%o3
	st	%f3,	[%l7 + 0x30]
	srax	%g4,	%o0,	%i6
	udivx	%l0,	0x004D,	%o5
	andncc	%o6,	%g1,	%i2
	xnorcc	%g5,	0x10DF,	%g7
	fxnor	%f2,	%f6,	%f28
	array16	%i0,	%i7,	%l2
	addc	%o4,	%o2,	%l4
	add	%g6,	%l3,	%i4
	fcmpne16	%f8,	%f8,	%o7
	sdivx	%i5,	0x12E4,	%i1
	ldub	[%l7 + 0x2E],	%g3
	lduh	[%l7 + 0x50],	%l1
	fmovdge	%xcc,	%f21,	%f13
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	ldx	[%l7 + 0x48],	%i3
	save %l6, %o3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o1, 0x1A7E, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%l0,	%o5
	mova	%xcc,	%g1,	%i2
	and	%g5,	0x0E49,	%o6
	movvc	%icc,	%i0,	%g7
	udivcc	%l2,	0x02E9,	%i7
	andncc	%o4,	%l4,	%g6
	st	%f16,	[%l7 + 0x08]
	edge8l	%o2,	%l3,	%i4
	fmovsge	%icc,	%f18,	%f25
	movrgz	%o7,	%i1,	%i5
	movne	%icc,	%g3,	%l1
	std	%f10,	[%l7 + 0x38]
	movneg	%icc,	%l5,	%g2
	subc	%l6,	0x0082,	%i3
	edge32ln	%o3,	%o1,	%i6
	fpsub32s	%f29,	%f7,	%f22
	array8	%g4,	%l0,	%o5
	subc	%o0,	%g1,	%g5
	fxnor	%f4,	%f28,	%f30
	ldsh	[%l7 + 0x32],	%o6
	fnors	%f3,	%f10,	%f27
	st	%f27,	[%l7 + 0x40]
	stb	%i2,	[%l7 + 0x7B]
	smul	%g7,	0x1A74,	%i0
	movl	%icc,	%l2,	%i7
	xor	%l4,	0x1B91,	%g6
	fmovsvc	%xcc,	%f15,	%f8
	fmovdn	%icc,	%f26,	%f7
	array32	%o4,	%o2,	%l3
	mova	%icc,	%i4,	%i1
	fpmerge	%f26,	%f5,	%f6
	udivx	%i5,	0x13FD,	%g3
	lduh	[%l7 + 0x52],	%l1
	addc	%l5,	%o7,	%l6
	sdiv	%i3,	0x1DF4,	%g2
	smulcc	%o3,	0x0A6A,	%i6
	lduw	[%l7 + 0x20],	%o1
	fpadd32s	%f11,	%f31,	%f29
	sethi	0x1CF6,	%l0
	smulcc	%o5,	%o0,	%g1
	nop
	set	0x3D, %l3
	ldsb	[%l7 + %l3],	%g5
	fornot1	%f18,	%f30,	%f30
	stw	%g4,	[%l7 + 0x5C]
	stw	%o6,	[%l7 + 0x38]
	fmovsne	%icc,	%f4,	%f8
	add	%i2,	0x0972,	%i0
	udivx	%g7,	0x1F15,	%l2
	orn	%l4,	%g6,	%i7
	movvs	%icc,	%o2,	%o4
	srlx	%l3,	0x01,	%i4
	smulcc	%i1,	0x1755,	%g3
	edge8	%i5,	%l5,	%o7
	movrgz	%l6,	0x3FF,	%l1
	array16	%i3,	%g2,	%o3
	fexpand	%f28,	%f12
	srax	%o1,	%l0,	%o5
	fcmpeq16	%f0,	%f30,	%o0
	srlx	%i6,	0x09,	%g5
	array32	%g1,	%g4,	%i2
	movre	%i0,	%g7,	%o6
	fornot1	%f8,	%f26,	%f16
	add	%l4,	0x13A9,	%l2
	subc	%g6,	%i7,	%o4
	movrgez	%o2,	0x321,	%i4
	edge8ln	%l3,	%g3,	%i5
	fmovda	%icc,	%f28,	%f0
	ldd	[%l7 + 0x68],	%f12
	fxor	%f24,	%f24,	%f6
	stw	%i1,	[%l7 + 0x48]
	stw	%o7,	[%l7 + 0x30]
	movrgez	%l6,	0x181,	%l5
	edge8ln	%l1,	%g2,	%i3
	fmovrdlez	%o1,	%f22,	%f26
	addccc	%l0,	0x0213,	%o3
	xnor	%o5,	0x1A84,	%i6
	fpack16	%f14,	%f20
	subcc	%o0,	0x1FC4,	%g5
	and	%g4,	%g1,	%i2
	orn	%g7,	%o6,	%l4
	fcmpgt32	%f18,	%f4,	%l2
	popc	%g6,	%i0
	andncc	%i7,	%o2,	%i4
	orncc	%o4,	%g3,	%l3
	movre	%i5,	%i1,	%l6
	xor	%l5,	%l1,	%o7
	smul	%g2,	0x0296,	%i3
	movl	%xcc,	%l0,	%o1
	orn	%o5,	%i6,	%o3
	fpsub32	%f28,	%f26,	%f12
	std	%f24,	[%l7 + 0x18]
	sdivcc	%o0,	0x10EE,	%g5
	fmovdpos	%xcc,	%f10,	%f4
	movrgz	%g4,	%g1,	%g7
	stw	%o6,	[%l7 + 0x10]
	subc	%i2,	0x1F8E,	%l4
	fors	%f3,	%f28,	%f11
	fmul8x16	%f11,	%f4,	%f24
	edge32n	%l2,	%i0,	%i7
	array16	%g6,	%o2,	%o4
	srax	%g3,	%l3,	%i4
	orn	%i1,	0x0EE9,	%i5
	fnot2s	%f9,	%f29
	ldd	[%l7 + 0x58],	%l4
	and	%l1,	0x1E28,	%o7
	fexpand	%f27,	%f22
	movg	%xcc,	%g2,	%l6
	fsrc2	%f12,	%f30
	lduh	[%l7 + 0x0E],	%i3
	movcs	%icc,	%l0,	%o5
	fpack16	%f2,	%f17
	array16	%i6,	%o1,	%o0
	udiv	%o3,	0x1ED9,	%g5
	movrlz	%g1,	%g4,	%o6
	udivx	%g7,	0x19D8,	%i2
	addcc	%l2,	0x179E,	%i0
	andn	%l4,	%g6,	%i7
	fornot2	%f22,	%f2,	%f26
	fmovdg	%xcc,	%f28,	%f15
	movre	%o2,	%o4,	%g3
	movn	%icc,	%i4,	%l3
	array32	%i1,	%l5,	%i5
	fmul8x16	%f14,	%f30,	%f2
	sub	%l1,	0x086A,	%g2
	edge8	%l6,	%i3,	%o7
	edge16n	%l0,	%o5,	%o1
	edge8l	%i6,	%o0,	%o3
	st	%f20,	[%l7 + 0x74]
	alignaddrl	%g5,	%g1,	%o6
	sll	%g7,	0x10,	%g4
	edge16ln	%l2,	%i0,	%l4
	andcc	%g6,	%i7,	%i2
	fornot2s	%f8,	%f22,	%f15
	fmuld8sux16	%f12,	%f25,	%f26
	for	%f28,	%f30,	%f28
	xor	%o4,	0x1297,	%o2
	movge	%xcc,	%g3,	%l3
	ldd	[%l7 + 0x28],	%i0
	fpsub32	%f6,	%f4,	%f12
	fandnot1s	%f13,	%f15,	%f0
	fmovsn	%icc,	%f3,	%f4
	fnegs	%f16,	%f30
	movrgez	%i4,	%l5,	%l1
	movge	%xcc,	%i5,	%l6
	array8	%i3,	%g2,	%o7
	addc	%o5,	0x0ECA,	%l0
	umul	%o1,	0x18AE,	%i6
	fnor	%f20,	%f14,	%f0
	edge32ln	%o0,	%o3,	%g1
	lduh	[%l7 + 0x44],	%o6
	srl	%g7,	%g5,	%l2
	fpsub16s	%f25,	%f18,	%f5
	ld	[%l7 + 0x64],	%f6
	edge8n	%g4,	%l4,	%i0
	srlx	%g6,	%i7,	%i2
	fpsub32	%f24,	%f28,	%f6
	fpadd16	%f18,	%f30,	%f26
	for	%f22,	%f14,	%f26
	srlx	%o4,	%o2,	%l3
	ld	[%l7 + 0x10],	%f2
	ldd	[%l7 + 0x58],	%f2
	movneg	%icc,	%g3,	%i4
	fmovrse	%i1,	%f8,	%f24
	srl	%l5,	%i5,	%l6
	alignaddrl	%i3,	%g2,	%l1
	subc	%o7,	%l0,	%o1
	fones	%f0
	movvs	%xcc,	%o5,	%i6
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	movgu	%icc,	%g7,	%o6
	std	%f8,	[%l7 + 0x38]
	fmovrdlez	%l2,	%f20,	%f6
	stw	%g4,	[%l7 + 0x6C]
	sdiv	%l4,	0x0979,	%g5
	fmovdvc	%icc,	%f2,	%f24
	stb	%g6,	[%l7 + 0x3C]
	mulx	%i7,	0x005A,	%i2
	popc	%i0,	%o4
	fands	%f12,	%f9,	%f13
	edge32	%o2,	%g3,	%i4
	movpos	%icc,	%i1,	%l3
	ldx	[%l7 + 0x10],	%i5
	sll	%l5,	%i3,	%g2
	sdivx	%l1,	0x1389,	%o7
	fmovs	%f4,	%f14
	sir	0x0ADE
	move	%icc,	%l0,	%l6
	sdiv	%o1,	0x12A4,	%i6
	ldub	[%l7 + 0x5E],	%o0
	edge8ln	%o3,	%g1,	%g7
	fpadd32s	%f28,	%f2,	%f2
	sra	%o5,	%l2,	%o6
	ldd	[%l7 + 0x40],	%g4
	mulx	%l4,	%g5,	%i7
	fmovdcc	%xcc,	%f25,	%f20
	edge8	%i2,	%i0,	%g6
	edge32	%o4,	%g3,	%o2
	sth	%i4,	[%l7 + 0x3C]
	movrne	%i1,	%l3,	%l5
	addcc	%i3,	%g2,	%l1
	addc	%i5,	%l0,	%o7
	faligndata	%f4,	%f0,	%f6
	move	%icc,	%l6,	%o1
	movrgz	%o0,	0x2E2,	%i6
	movcc	%xcc,	%o3,	%g1
	movge	%icc,	%o5,	%l2
	lduw	[%l7 + 0x14],	%o6
	add	%g4,	0x0C37,	%l4
	ldub	[%l7 + 0x14],	%g7
	sub	%i7,	%i2,	%g5
	array32	%i0,	%g6,	%o4
	udivcc	%g3,	0x01D7,	%o2
	edge32l	%i4,	%l3,	%l5
	save %i1, 0x117A, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x3B],	%l1
	fcmpne32	%f14,	%f22,	%i5
	srax	%i3,	%o7,	%l0
	popc	0x09D9,	%l6
	fmovsle	%icc,	%f26,	%f12
	popc	0x14E0,	%o0
	edge8l	%o1,	%i6,	%g1
	ldub	[%l7 + 0x22],	%o3
	fcmped	%fcc0,	%f2,	%f22
	stw	%o5,	[%l7 + 0x1C]
	edge16ln	%o6,	%l2,	%g4
	udivcc	%g7,	0x1B8D,	%l4
	array32	%i7,	%g5,	%i2
	nop
	set	0x1C, %i4
	stw	%i0,	[%l7 + %i4]
	fones	%f6
	addcc	%o4,	%g6,	%g3
	edge32n	%i4,	%o2,	%l3
	edge16n	%i1,	%l5,	%l1
	umulcc	%g2,	0x1056,	%i5
	movge	%icc,	%o7,	%l0
	umul	%i3,	%o0,	%o1
	ldsw	[%l7 + 0x74],	%l6
	fsrc2	%f8,	%f22
	fpmerge	%f24,	%f15,	%f12
	st	%f12,	[%l7 + 0x48]
	fands	%f2,	%f27,	%f30
	move	%xcc,	%i6,	%o3
	movcs	%icc,	%o5,	%g1
	orncc	%l2,	0x038E,	%g4
	fornot2	%f8,	%f16,	%f10
	orn	%g7,	%l4,	%o6
	stb	%g5,	[%l7 + 0x4B]
	sdiv	%i2,	0x0CA2,	%i0
	edge8n	%i7,	%o4,	%g6
	andncc	%g3,	%i4,	%l3
	movg	%xcc,	%i1,	%l5
	array8	%l1,	%o2,	%g2
	edge32	%i5,	%l0,	%i3
	movrne	%o0,	%o7,	%o1
	fmovdl	%xcc,	%f27,	%f8
	srl	%i6,	%l6,	%o5
	ldsb	[%l7 + 0x5E],	%o3
	move	%icc,	%l2,	%g4
	srlx	%g1,	%l4,	%o6
	smul	%g5,	0x13B4,	%g7
	addc	%i2,	0x1A52,	%i7
	edge32n	%o4,	%g6,	%g3
	ld	[%l7 + 0x74],	%f16
	or	%i0,	0x0330,	%l3
	movrlz	%i4,	%l5,	%l1
	edge32n	%i1,	%o2,	%i5
	smulcc	%l0,	%i3,	%g2
	movneg	%icc,	%o7,	%o0
	fmovd	%f6,	%f6
	movrlz	%o1,	0x352,	%l6
	fornot1s	%f31,	%f18,	%f28
	ldsb	[%l7 + 0x10],	%i6
	sra	%o3,	%l2,	%o5
	addcc	%g4,	0x0E73,	%g1
	sub	%l4,	%o6,	%g7
	fnor	%f6,	%f26,	%f4
	fxor	%f10,	%f22,	%f20
	smul	%i2,	0x08E8,	%i7
	array32	%o4,	%g6,	%g5
	movvs	%icc,	%i0,	%l3
	srlx	%i4,	%g3,	%l1
	fsrc1s	%f20,	%f15
	movle	%xcc,	%i1,	%l5
	add	%i5,	%l0,	%o2
	movpos	%xcc,	%g2,	%i3
	orncc	%o7,	%o0,	%o1
	fcmple32	%f20,	%f2,	%i6
	addccc	%l6,	0x0A5A,	%o3
	edge16l	%o5,	%l2,	%g4
	edge16ln	%l4,	%g1,	%g7
	and	%o6,	%i2,	%o4
	movle	%icc,	%i7,	%g6
	movre	%i0,	0x01E,	%g5
	ldsh	[%l7 + 0x6E],	%l3
	mova	%icc,	%g3,	%l1
	fones	%f7
	ld	[%l7 + 0x10],	%f11
	fpadd16	%f0,	%f26,	%f14
	stx	%i1,	[%l7 + 0x70]
	udivx	%i4,	0x1EEC,	%l5
	fmovdne	%icc,	%f14,	%f20
	fmovdcc	%icc,	%f26,	%f2
	movneg	%xcc,	%i5,	%o2
	and	%l0,	0x0B8E,	%g2
	movg	%icc,	%o7,	%o0
	and	%o1,	0x0230,	%i6
	movn	%xcc,	%l6,	%o3
	udivcc	%i3,	0x1E17,	%o5
	addcc	%l2,	0x0B5B,	%l4
	or	%g4,	%g1,	%g7
	sdivcc	%o6,	0x1BD6,	%o4
	edge32l	%i2,	%i7,	%g6
	movrne	%g5,	0x3D0,	%l3
	ldx	[%l7 + 0x58],	%g3
	subccc	%i0,	%i1,	%i4
	sub	%l5,	%i5,	%l1
	fmul8x16	%f9,	%f22,	%f4
	save %l0, %o2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f14,	%f10,	%f22
	popc	0x0704,	%o0
	andn	%o7,	0x0E12,	%i6
	restore %l6, 0x1A34, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i3,	%o5,	%o1
	sdivx	%l4,	0x152E,	%l2
	lduh	[%l7 + 0x52],	%g1
	fmovrdlz	%g7,	%f14,	%f22
	xnor	%g4,	%o6,	%o4
	edge16	%i2,	%g6,	%g5
	std	%f30,	[%l7 + 0x10]
	edge16n	%i7,	%l3,	%i0
	movleu	%icc,	%g3,	%i1
	addccc	%l5,	%i4,	%i5
	movgu	%icc,	%l1,	%o2
	fmovd	%f30,	%f2
	alignaddrl	%g2,	%l0,	%o7
	ldd	[%l7 + 0x68],	%f2
	udivx	%o0,	0x013D,	%i6
	edge8	%l6,	%o3,	%i3
	edge8n	%o1,	%l4,	%l2
	popc	0x17E1,	%o5
	mova	%xcc,	%g7,	%g1
	sub	%g4,	%o4,	%i2
	edge32	%o6,	%g5,	%i7
	movle	%xcc,	%l3,	%g6
	addccc	%i0,	%i1,	%l5
	edge16l	%g3,	%i4,	%l1
	movcc	%xcc,	%i5,	%g2
	movvc	%icc,	%l0,	%o2
	xorcc	%o0,	%i6,	%o7
	subc	%o3,	0x0052,	%i3
	stw	%l6,	[%l7 + 0x54]
	move	%xcc,	%o1,	%l4
	sub	%o5,	%l2,	%g1
	edge8l	%g4,	%g7,	%o4
	smul	%i2,	%g5,	%i7
	add	%l3,	%o6,	%i0
	movrgez	%i1,	%l5,	%g3
	sth	%i4,	[%l7 + 0x56]
	sethi	0x096F,	%g6
	subcc	%i5,	%g2,	%l0
	movneg	%xcc,	%l1,	%o0
	movneg	%icc,	%i6,	%o2
	edge32l	%o7,	%i3,	%o3
	movrgz	%l6,	%o1,	%o5
	movrgez	%l2,	%l4,	%g1
	save %g7, 0x14B9, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g4,	0x05F6,	%g5
	fnot1	%f10,	%f12
	andncc	%i2,	%l3,	%i7
	orcc	%i0,	%o6,	%i1
	ld	[%l7 + 0x74],	%f26
	movle	%xcc,	%g3,	%l5
	sth	%i4,	[%l7 + 0x5A]
	array8	%g6,	%i5,	%l0
	umul	%l1,	%g2,	%i6
	movle	%xcc,	%o2,	%o7
	edge16n	%o0,	%i3,	%l6
	movrgz	%o1,	0x30D,	%o3
	edge16n	%o5,	%l4,	%g1
	fmovrdlez	%l2,	%f2,	%f14
	ldx	[%l7 + 0x58],	%o4
	fnot2s	%f22,	%f20
	movpos	%xcc,	%g4,	%g5
	addccc	%g7,	0x15A7,	%i2
	subc	%i7,	%l3,	%o6
	nop
	set	0x40, %l2
	ldx	[%l7 + %l2],	%i1
	srl	%i0,	0x0D,	%l5
	fmovdge	%xcc,	%f28,	%f23
	sth	%i4,	[%l7 + 0x1E]
	fand	%f24,	%f30,	%f22
	fnors	%f25,	%f21,	%f15
	movcc	%icc,	%g6,	%g3
	move	%xcc,	%l0,	%l1
	edge32n	%i5,	%g2,	%o2
	fmovsvc	%icc,	%f8,	%f29
	ldd	[%l7 + 0x28],	%f16
	edge16l	%o7,	%i6,	%o0
	movcs	%xcc,	%l6,	%i3
	fornot2s	%f17,	%f30,	%f11
	edge32n	%o1,	%o5,	%o3
	fnot1s	%f30,	%f12
	udiv	%g1,	0x0743,	%l4
	mova	%icc,	%o4,	%g4
	move	%icc,	%l2,	%g7
	orn	%i2,	%g5,	%i7
	alignaddrl	%o6,	%l3,	%i1
	fones	%f4
	fmovsg	%icc,	%f0,	%f6
	fornot1s	%f8,	%f2,	%f8
	fmovsg	%icc,	%f15,	%f6
	fzero	%f24
	edge32l	%i0,	%l5,	%i4
	move	%xcc,	%g6,	%g3
	fornot2	%f4,	%f0,	%f0
	edge32l	%l0,	%l1,	%g2
	fnot1	%f22,	%f2
	udivcc	%o2,	0x1B24,	%o7
	std	%f26,	[%l7 + 0x48]
	edge8ln	%i5,	%o0,	%l6
	array16	%i3,	%o1,	%o5
	fmovsle	%icc,	%f31,	%f31
	faligndata	%f24,	%f4,	%f24
	edge32ln	%o3,	%i6,	%l4
	fmovrdlez	%g1,	%f6,	%f6
	stb	%o4,	[%l7 + 0x54]
	fpadd32s	%f16,	%f1,	%f10
	edge8	%l2,	%g7,	%i2
	movpos	%xcc,	%g4,	%i7
	alignaddrl	%g5,	%o6,	%i1
	fpackfix	%f28,	%f12
	mova	%icc,	%l3,	%l5
	addccc	%i0,	%g6,	%i4
	movrne	%l0,	%l1,	%g3
	edge32ln	%g2,	%o2,	%o7
	lduh	[%l7 + 0x28],	%o0
	movrlez	%l6,	%i3,	%o1
	fmovd	%f4,	%f4
	fornot2s	%f25,	%f23,	%f22
	srl	%o5,	0x1C,	%o3
	movcs	%icc,	%i6,	%l4
	sub	%i5,	0x0B5F,	%g1
	ldub	[%l7 + 0x21],	%l2
	sub	%o4,	%g7,	%g4
	movre	%i7,	%i2,	%g5
	nop
	set	0x14, %i3
	ldsw	[%l7 + %i3],	%o6
	sdivcc	%i1,	0x1864,	%l3
	movg	%xcc,	%i0,	%g6
	fxor	%f12,	%f20,	%f12
	fmovde	%xcc,	%f21,	%f30
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	alignaddrl	%i4,	%g3,	%g2
	fzeros	%f24
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%f26
	fnegd	%f4,	%f26
	fpadd16s	%f19,	%f15,	%f1
	fpsub16s	%f16,	%f9,	%f8
	fpmerge	%f15,	%f3,	%f6
	restore %l1, %o7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o0,	%i3,	%l6
	sth	%o1,	[%l7 + 0x32]
	andcc	%o3,	0x136D,	%i6
	addc	%o5,	0x1737,	%l4
	edge16ln	%g1,	%i5,	%l2
	movgu	%icc,	%o4,	%g7
	orcc	%i7,	0x1997,	%i2
	lduw	[%l7 + 0x70],	%g5
	edge32l	%o6,	%g4,	%l3
	addcc	%i1,	0x13C2,	%g6
	movl	%xcc,	%i0,	%l0
	mulx	%l5,	0x0865,	%i4
	and	%g3,	0x02E4,	%g2
	movcc	%icc,	%o7,	%l1
	udiv	%o0,	0x10EE,	%o2
	ldub	[%l7 + 0x7B],	%l6
	xnor	%i3,	0x1F2A,	%o1
	array16	%i6,	%o3,	%o5
	fcmpne32	%f22,	%f28,	%g1
	ldd	[%l7 + 0x08],	%i4
	subcc	%l4,	%l2,	%o4
	sll	%g7,	%i7,	%i2
	orncc	%g5,	0x1258,	%o6
	edge16	%l3,	%g4,	%g6
	or	%i1,	0x0FF2,	%l0
	ldsw	[%l7 + 0x50],	%l5
	fsrc1s	%f2,	%f29
	movvc	%icc,	%i4,	%g3
	mova	%xcc,	%g2,	%i0
	ld	[%l7 + 0x1C],	%f30
	movrgez	%o7,	0x278,	%o0
	array32	%l1,	%o2,	%l6
	edge32l	%i3,	%o1,	%o3
	udivx	%o5,	0x0E59,	%i6
	movle	%icc,	%g1,	%l4
	or	%i5,	0x17C9,	%l2
	orn	%g7,	%i7,	%o4
	popc	%i2,	%g5
	fpadd16	%f12,	%f30,	%f12
	addccc	%l3,	%g4,	%g6
	fmovsge	%icc,	%f15,	%f21
	ldsw	[%l7 + 0x68],	%o6
	fnegd	%f22,	%f8
	ldsb	[%l7 + 0x41],	%i1
	mova	%icc,	%l0,	%i4
	fsrc1	%f6,	%f16
	subc	%l5,	0x18D5,	%g3
	movl	%icc,	%g2,	%o7
	fmovrdne	%o0,	%f24,	%f4
	fnand	%f18,	%f28,	%f6
	ld	[%l7 + 0x74],	%f1
	edge8n	%i0,	%o2,	%l1
	orn	%i3,	%o1,	%o3
	alignaddr	%o5,	%i6,	%l6
	std	%f4,	[%l7 + 0x78]
	sir	0x1F1E
	add	%l4,	%i5,	%g1
	movcs	%icc,	%g7,	%i7
	edge8l	%l2,	%i2,	%g5
	fpack16	%f24,	%f28
	alignaddr	%o4,	%g4,	%l3
	alignaddrl	%g6,	%o6,	%l0
	fmovdg	%icc,	%f13,	%f28
	addc	%i1,	0x1C15,	%l5
	xorcc	%i4,	%g2,	%g3
	edge16n	%o0,	%o7,	%o2
	mulx	%i0,	%l1,	%i3
	and	%o3,	%o5,	%i6
	fabss	%f6,	%f29
	fmovrsgz	%l6,	%f20,	%f29
	edge16	%l4,	%o1,	%g1
	save %i5, 0x1000, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g7,	0x1F3A,	%l2
	subccc	%i2,	0x1F57,	%g5
	mulx	%o4,	0x1AC6,	%l3
	sdiv	%g4,	0x18E3,	%o6
	fcmple16	%f10,	%f24,	%l0
	array32	%g6,	%l5,	%i4
	addcc	%g2,	%g3,	%i1
	movle	%xcc,	%o0,	%o2
	fnors	%f2,	%f29,	%f13
	umulcc	%i0,	%o7,	%i3
	orcc	%l1,	%o5,	%o3
	fcmpd	%fcc0,	%f30,	%f22
	andcc	%l6,	0x0004,	%l4
	edge32n	%o1,	%i6,	%i5
	ldd	[%l7 + 0x58],	%f0
	srax	%g1,	%g7,	%i7
	fmul8x16au	%f28,	%f10,	%f4
	fsrc1s	%f20,	%f4
	edge8n	%i2,	%g5,	%o4
	fmovsge	%icc,	%f20,	%f15
	sra	%l3,	%g4,	%l2
	sra	%o6,	%l0,	%l5
	alignaddr	%i4,	%g2,	%g3
	sra	%g6,	0x0C,	%i1
	xor	%o0,	0x1DC6,	%i0
	stb	%o2,	[%l7 + 0x13]
	nop
	set	0x5C, %i0
	sth	%i3,	[%l7 + %i0]
	ldx	[%l7 + 0x28],	%l1
	fmovdvs	%xcc,	%f22,	%f15
	subcc	%o7,	%o3,	%l6
	edge32l	%o5,	%o1,	%i6
	addc	%i5,	0x0419,	%l4
	alignaddrl	%g1,	%i7,	%g7
	fones	%f21
	andn	%i2,	0x11E7,	%o4
	andncc	%l3,	%g4,	%g5
	edge32l	%l2,	%l0,	%l5
	andncc	%o6,	%i4,	%g3
	movre	%g2,	%g6,	%i1
	array8	%i0,	%o2,	%i3
	fnot2	%f0,	%f0
	fmovrslez	%l1,	%f6,	%f3
	stw	%o0,	[%l7 + 0x74]
	subc	%o7,	0x021D,	%o3
	xnorcc	%l6,	%o5,	%i6
	movrlz	%o1,	%i5,	%g1
	sra	%l4,	0x12,	%g7
	fmovsneg	%xcc,	%f12,	%f24
	smul	%i7,	%i2,	%o4
	edge16	%g4,	%g5,	%l3
	movvc	%xcc,	%l2,	%l0
	alignaddrl	%l5,	%i4,	%o6
	xorcc	%g3,	%g6,	%g2
	sdivcc	%i1,	0x183E,	%o2
	fmuld8ulx16	%f25,	%f18,	%f12
	ldsw	[%l7 + 0x70],	%i3
	sth	%i0,	[%l7 + 0x4C]
	fnand	%f18,	%f28,	%f28
	ldsb	[%l7 + 0x19],	%o0
	edge32	%l1,	%o7,	%l6
	ld	[%l7 + 0x0C],	%f18
	fmovsvc	%icc,	%f13,	%f15
	addccc	%o5,	%i6,	%o1
	fmovd	%f26,	%f6
	movrne	%i5,	%g1,	%l4
	array8	%o3,	%i7,	%i2
	edge16l	%o4,	%g7,	%g5
	fmovrsgz	%l3,	%f26,	%f12
	sdivx	%l2,	0x1AB9,	%g4
	fmovscc	%icc,	%f9,	%f10
	ldub	[%l7 + 0x76],	%l5
	mova	%xcc,	%l0,	%o6
	subccc	%g3,	%i4,	%g6
	movl	%icc,	%g2,	%o2
	nop
	set	0x38, %o7
	sth	%i3,	[%l7 + %o7]
	movle	%icc,	%i1,	%o0
	ldsb	[%l7 + 0x50],	%l1
	movl	%xcc,	%i0,	%o7
	smulcc	%o5,	0x0EE0,	%l6
	udivcc	%o1,	0x1440,	%i6
	sdivcc	%g1,	0x10E9,	%i5
	smulcc	%l4,	%i7,	%o3
	fnot2	%f28,	%f2
	movne	%icc,	%o4,	%i2
	ld	[%l7 + 0x28],	%f26
	ldsh	[%l7 + 0x3A],	%g7
	andn	%l3,	%g5,	%g4
	mova	%icc,	%l2,	%l0
	edge16n	%l5,	%o6,	%i4
	ldsb	[%l7 + 0x24],	%g3
	edge16l	%g2,	%g6,	%o2
	std	%f20,	[%l7 + 0x38]
	umulcc	%i3,	0x14FA,	%i1
	fmovrsgez	%l1,	%f1,	%f20
	fands	%f20,	%f3,	%f29
	popc	%o0,	%i0
	fmovrdgez	%o7,	%f18,	%f26
	edge8ln	%l6,	%o1,	%o5
	movcs	%icc,	%g1,	%i5
	udivx	%l4,	0x117E,	%i7
	fpack32	%f14,	%f12,	%f22
	fmovrdne	%o3,	%f0,	%f22
	sdivx	%o4,	0x04E3,	%i2
	nop
	set	0x1E, %o5
	ldub	[%l7 + %o5],	%i6
	fmovsa	%icc,	%f10,	%f31
	edge32n	%g7,	%l3,	%g5
	sdiv	%g4,	0x0E73,	%l2
	movneg	%icc,	%l5,	%o6
	fmovd	%f10,	%f30
	mulx	%l0,	0x06FA,	%i4
	movrgez	%g2,	%g6,	%g3
	fpadd32	%f20,	%f2,	%f22
	fxnor	%f2,	%f6,	%f20
	alignaddrl	%i3,	%o2,	%i1
	subcc	%l1,	%o0,	%i0
	fmovs	%f10,	%f18
	udivx	%o7,	0x0CF9,	%o1
	edge8n	%o5,	%g1,	%l6
	array32	%i5,	%l4,	%o3
	lduw	[%l7 + 0x74],	%o4
	alignaddr	%i2,	%i7,	%g7
	edge16	%i6,	%l3,	%g4
	fmovrdgz	%l2,	%f20,	%f8
	subccc	%g5,	0x0D63,	%o6
	ldsw	[%l7 + 0x6C],	%l0
	andncc	%l5,	%i4,	%g2
	std	%f20,	[%l7 + 0x58]
	fxor	%f4,	%f6,	%f18
	alignaddr	%g3,	%g6,	%o2
	mulx	%i3,	%i1,	%o0
	array16	%l1,	%o7,	%o1
	movrne	%i0,	%o5,	%l6
	ldd	[%l7 + 0x48],	%i4
	orn	%l4,	0x0523,	%o3
	movn	%xcc,	%g1,	%i2
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%i7
	edge16ln	%g7,	%o4,	%i6
	fabsd	%f24,	%f0
	fmuld8ulx16	%f29,	%f19,	%f10
	ldsb	[%l7 + 0x2E],	%l3
	edge32n	%l2,	%g4,	%o6
	movrgez	%l0,	0x1EE,	%l5
	lduw	[%l7 + 0x5C],	%g5
	smul	%g2,	0x1053,	%g3
	alignaddr	%i4,	%g6,	%o2
	fmovs	%f30,	%f18
	movcs	%icc,	%i3,	%i1
	movrgez	%o0,	%o7,	%o1
	movrgz	%l1,	0x12C,	%o5
	ldsw	[%l7 + 0x50],	%l6
	andncc	%i5,	%l4,	%o3
	or	%g1,	0x1BA3,	%i2
	edge32n	%i0,	%i7,	%o4
	fmovdl	%xcc,	%f28,	%f20
	udivcc	%i6,	0x1494,	%g7
	alignaddrl	%l3,	%l2,	%g4
	xor	%o6,	0x0A1E,	%l0
	fmovspos	%icc,	%f12,	%f31
	fnegs	%f8,	%f9
	xor	%g5,	0x03CE,	%g2
	edge8	%g3,	%i4,	%l5
	array32	%o2,	%i3,	%g6
	edge16	%i1,	%o7,	%o1
	edge8n	%o0,	%l1,	%o5
	fmovrdgz	%l6,	%f0,	%f4
	xor	%l4,	0x0E67,	%o3
	sdivx	%g1,	0x0231,	%i2
	addccc	%i0,	%i7,	%o4
	srax	%i5,	0x11,	%i6
	fnands	%f2,	%f27,	%f24
	nop
	set	0x78, %l6
	ldd	[%l7 + %l6],	%f12
	subcc	%g7,	0x0EE1,	%l2
	nop
	set	0x38, %l4
	stx	%g4,	[%l7 + %l4]
	stb	%o6,	[%l7 + 0x5E]
	edge32l	%l3,	%g5,	%g2
	sra	%g3,	%i4,	%l0
	movpos	%xcc,	%l5,	%o2
	fone	%f14
	fandnot2s	%f21,	%f26,	%f26
	subccc	%i3,	0x1EF6,	%i1
	movrlez	%g6,	0x3F5,	%o7
	fmovrsne	%o0,	%f14,	%f26
	movvs	%xcc,	%l1,	%o1
	sethi	0x16FF,	%o5
	udiv	%l4,	0x13B9,	%o3
	subc	%g1,	%l6,	%i2
	ldub	[%l7 + 0x23],	%i7
	fexpand	%f14,	%f2
	movrlez	%o4,	0x0EC,	%i5
	stw	%i0,	[%l7 + 0x2C]
	subccc	%i6,	%g7,	%l2
	stw	%o6,	[%l7 + 0x24]
	subccc	%l3,	0x0455,	%g4
	orn	%g2,	%g5,	%i4
	fmovsvc	%icc,	%f28,	%f6
	fone	%f0
	fnors	%f30,	%f23,	%f17
	edge32l	%l0,	%l5,	%o2
	xor	%g3,	0x13E4,	%i3
	movcc	%icc,	%g6,	%o7
	fmovdpos	%icc,	%f20,	%f4
	addccc	%o0,	%i1,	%l1
	edge16l	%o5,	%o1,	%l4
	popc	%g1,	%o3
	smulcc	%i2,	%l6,	%i7
	movrne	%i5,	%o4,	%i6
	alignaddr	%g7,	%l2,	%i0
	array16	%o6,	%g4,	%l3
	sub	%g2,	0x00CD,	%i4
	lduw	[%l7 + 0x14],	%g5
	edge32n	%l5,	%o2,	%g3
	movg	%xcc,	%l0,	%g6
	edge32	%i3,	%o7,	%o0
	udivcc	%l1,	0x0E83,	%o5
	movgu	%xcc,	%o1,	%i1
	orncc	%l4,	0x0066,	%o3
	ld	[%l7 + 0x44],	%f2
	ld	[%l7 + 0x18],	%f26
	sdiv	%i2,	0x11A7,	%g1
	ldx	[%l7 + 0x70],	%l6
	srlx	%i7,	%o4,	%i5
	nop
	set	0x6A, %o0
	ldsb	[%l7 + %o0],	%g7
	fpmerge	%f23,	%f21,	%f4
	st	%f18,	[%l7 + 0x18]
	movvs	%icc,	%i6,	%l2
	sir	0x0724
	stx	%o6,	[%l7 + 0x58]
	movg	%icc,	%i0,	%l3
	edge8n	%g2,	%g4,	%g5
	edge32n	%i4,	%o2,	%l5
	orncc	%g3,	0x02CD,	%g6
	ldub	[%l7 + 0x45],	%i3
	ldx	[%l7 + 0x30],	%l0
	edge32ln	%o7,	%o0,	%l1
	stx	%o5,	[%l7 + 0x18]
	movne	%icc,	%i1,	%o1
	orn	%o3,	0x1235,	%l4
	fnot2s	%f11,	%f23
	xor	%i2,	0x1BC7,	%l6
	fands	%f12,	%f19,	%f29
	subccc	%i7,	%o4,	%i5
	addc	%g1,	%i6,	%l2
	movleu	%xcc,	%g7,	%o6
	fpack16	%f8,	%f24
	andcc	%i0,	0x0869,	%l3
	fmovsge	%icc,	%f17,	%f19
	sth	%g4,	[%l7 + 0x68]
	fxors	%f5,	%f4,	%f16
	umul	%g5,	%g2,	%o2
	mulx	%i4,	0x08DF,	%l5
	fandnot2	%f10,	%f4,	%f20
	fnot1	%f6,	%f14
	orcc	%g3,	%i3,	%g6
	sdivcc	%o7,	0x1142,	%l0
	edge16n	%o0,	%o5,	%i1
	movre	%l1,	0x003,	%o3
	movrgez	%o1,	0x256,	%i2
	udivcc	%l6,	0x1E6C,	%i7
	edge32n	%o4,	%l4,	%g1
	stb	%i6,	[%l7 + 0x53]
	umulcc	%l2,	%i5,	%o6
	siam	0x6
	pdist	%f18,	%f20,	%f24
	fpadd32	%f8,	%f4,	%f14
	xnorcc	%g7,	0x1EE7,	%i0
	movne	%xcc,	%l3,	%g4
	stw	%g5,	[%l7 + 0x28]
	udivcc	%o2,	0x044C,	%g2
	sra	%l5,	%g3,	%i4
	movn	%icc,	%i3,	%g6
	umulcc	%o7,	%l0,	%o5
	sll	%i1,	0x17,	%l1
	udivx	%o3,	0x0A78,	%o1
	xnorcc	%o0,	0x0E4C,	%l6
	fmovsa	%icc,	%f10,	%f29
	smul	%i2,	0x0195,	%o4
	fmovde	%icc,	%f1,	%f7
	fmuld8sux16	%f26,	%f2,	%f18
	edge16	%l4,	%i7,	%i6
	st	%f29,	[%l7 + 0x30]
	movne	%icc,	%l2,	%g1
	fmul8x16	%f20,	%f16,	%f20
	sdiv	%i5,	0x1C12,	%g7
	ldd	[%l7 + 0x20],	%f6
	fmul8x16al	%f19,	%f16,	%f26
	movvs	%xcc,	%o6,	%l3
	alignaddrl	%g4,	%g5,	%i0
	srlx	%g2,	%o2,	%g3
	edge32ln	%l5,	%i4,	%i3
	edge32ln	%o7,	%g6,	%l0
	ld	[%l7 + 0x18],	%f11
	movneg	%xcc,	%o5,	%l1
	sdivx	%i1,	0x1631,	%o1
	movneg	%icc,	%o3,	%l6
	ldd	[%l7 + 0x68],	%o0
	edge16	%o4,	%i2,	%i7
	sir	0x026B
	fmovdgu	%xcc,	%f25,	%f30
	fexpand	%f21,	%f8
	movrgz	%l4,	0x0F7,	%i6
	fcmpeq32	%f26,	%f26,	%l2
	fmovdleu	%icc,	%f5,	%f26
	add	%i5,	0x1733,	%g7
	fmovrdlez	%g1,	%f10,	%f20
	save %o6, %l3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f25,	%f21
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	andcc	%o2,	0x06BB,	%g3
	movvs	%xcc,	%l5,	%g4
	srlx	%i4,	0x05,	%o7
	smulcc	%g6,	0x0D73,	%i3
	movneg	%icc,	%o5,	%l1
	edge32	%l0,	%o1,	%i1
	movcc	%xcc,	%o3,	%o0
	movrgez	%o4,	0x1C3,	%i2
	ld	[%l7 + 0x7C],	%f13
	ldx	[%l7 + 0x48],	%l6
	ldsb	[%l7 + 0x2F],	%l4
	fmovdpos	%icc,	%f22,	%f24
	orncc	%i6,	0x1949,	%i7
	movl	%xcc,	%i5,	%l2
	mova	%icc,	%g1,	%o6
	alignaddr	%l3,	%g5,	%g7
	faligndata	%f16,	%f28,	%f18
	array32	%g2,	%o2,	%g3
	popc	0x00C3,	%i0
	edge16ln	%g4,	%i4,	%o7
	movrlez	%g6,	0x25C,	%l5
	ldsh	[%l7 + 0x52],	%o5
	ldsb	[%l7 + 0x3F],	%l1
	addc	%i3,	%l0,	%i1
	fcmple16	%f16,	%f2,	%o3
	move	%icc,	%o0,	%o1
	srlx	%i2,	%l6,	%l4
	lduw	[%l7 + 0x08],	%o4
	array16	%i7,	%i5,	%l2
	xnor	%i6,	0x00A5,	%o6
	alignaddr	%g1,	%g5,	%g7
	movrgez	%l3,	0x244,	%g2
	edge8ln	%o2,	%i0,	%g4
	fpadd16s	%f8,	%f8,	%f8
	ldd	[%l7 + 0x78],	%i4
	andcc	%o7,	%g6,	%l5
	sth	%o5,	[%l7 + 0x7A]
	udiv	%g3,	0x15F7,	%l1
	movl	%icc,	%l0,	%i3
	edge16l	%o3,	%o0,	%i1
	sdivcc	%o1,	0x0EB5,	%l6
	smul	%i2,	%l4,	%i7
	srlx	%i5,	0x02,	%o4
	movrlz	%i6,	%l2,	%g1
	array8	%o6,	%g5,	%l3
	movcc	%icc,	%g7,	%g2
	add	%i0,	%g4,	%o2
	or	%i4,	%o7,	%g6
	fmovdcc	%xcc,	%f20,	%f9
	st	%f15,	[%l7 + 0x1C]
	edge16n	%o5,	%g3,	%l1
	array8	%l5,	%l0,	%i3
	orncc	%o0,	%i1,	%o3
	edge8ln	%o1,	%l6,	%i2
	lduh	[%l7 + 0x64],	%i7
	stx	%i5,	[%l7 + 0x60]
	movrgz	%o4,	0x02D,	%l4
	srlx	%i6,	0x19,	%g1
	addc	%l2,	%g5,	%l3
	movcc	%icc,	%g7,	%o6
	stb	%g2,	[%l7 + 0x67]
	fmovsg	%xcc,	%f26,	%f29
	ldd	[%l7 + 0x68],	%f8
	andn	%g4,	%i0,	%o2
	addc	%i4,	%o7,	%g6
	edge32l	%o5,	%l1,	%g3
	fxor	%f22,	%f30,	%f0
	udivx	%l5,	0x167E,	%i3
	move	%icc,	%o0,	%i1
	edge32ln	%l0,	%o3,	%o1
	movvs	%xcc,	%l6,	%i2
	srax	%i7,	%i5,	%o4
	and	%i6,	0x1A2B,	%l4
	fmovrse	%l2,	%f15,	%f30
	movg	%icc,	%g5,	%g1
	or	%g7,	%l3,	%o6
	orcc	%g4,	0x0FB6,	%g2
	movrlz	%o2,	%i0,	%i4
	sllx	%o7,	0x13,	%g6
	lduh	[%l7 + 0x7A],	%l1
	andncc	%g3,	%l5,	%o5
	ldx	[%l7 + 0x48],	%i3
	movrne	%i1,	0x1FC,	%l0
	fmovrdne	%o0,	%f20,	%f26
	sdiv	%o3,	0x13C6,	%o1
	movvc	%xcc,	%i2,	%l6
	fcmpne32	%f26,	%f26,	%i5
	movgu	%xcc,	%i7,	%o4
	ldub	[%l7 + 0x3C],	%i6
	edge16ln	%l2,	%g5,	%g1
	fnot1	%f28,	%f16
	andncc	%g7,	%l4,	%o6
	fands	%f26,	%f6,	%f26
	fmovrdgez	%l3,	%f30,	%f18
	sll	%g4,	0x01,	%g2
	edge16n	%o2,	%i0,	%i4
	std	%f0,	[%l7 + 0x10]
	andncc	%g6,	%l1,	%g3
	alignaddr	%o7,	%l5,	%o5
	xorcc	%i3,	%l0,	%o0
	move	%icc,	%o3,	%i1
	srlx	%i2,	%o1,	%i5
	subcc	%i7,	0x0C00,	%o4
	std	%f16,	[%l7 + 0x40]
	array32	%i6,	%l2,	%g5
	edge16l	%g1,	%l6,	%l4
	movgu	%icc,	%o6,	%l3
	fmovse	%xcc,	%f20,	%f11
	xorcc	%g7,	0x05E6,	%g4
	fors	%f28,	%f4,	%f4
	mulscc	%o2,	0x14B3,	%g2
	edge32n	%i4,	%g6,	%l1
	fornot1	%f2,	%f16,	%f12
	ldsb	[%l7 + 0x4F],	%i0
	xnor	%g3,	%l5,	%o5
	sdiv	%o7,	0x10F2,	%i3
	fnand	%f6,	%f2,	%f20
	xor	%o0,	0x1A96,	%o3
	alignaddrl	%l0,	%i1,	%i2
	fands	%f20,	%f7,	%f26
	fmovsge	%xcc,	%f10,	%f14
	xorcc	%i5,	0x1343,	%o1
	ldub	[%l7 + 0x3A],	%i7
	addccc	%o4,	%l2,	%g5
	sir	0x07EB
	stx	%g1,	[%l7 + 0x28]
	xnor	%i6,	0x1944,	%l4
	movvc	%xcc,	%o6,	%l3
	movl	%icc,	%g7,	%l6
	popc	0x0622,	%o2
	edge16	%g2,	%i4,	%g4
	edge16	%l1,	%i0,	%g6
	umulcc	%g3,	0x09DB,	%o5
	alignaddrl	%o7,	%i3,	%l5
	movge	%icc,	%o0,	%l0
	edge16ln	%o3,	%i1,	%i5
	mulx	%i2,	%i7,	%o1
	subccc	%l2,	0x13A9,	%o4
	movvc	%icc,	%g1,	%g5
	movn	%xcc,	%l4,	%i6
	udivx	%o6,	0x1ADB,	%g7
	movrgz	%l6,	%l3,	%g2
	and	%o2,	0x1513,	%g4
	fmovsg	%icc,	%f18,	%f8
	edge16	%l1,	%i4,	%i0
	array16	%g3,	%o5,	%g6
	fzero	%f10
	ldd	[%l7 + 0x28],	%i2
	ldsw	[%l7 + 0x50],	%o7
	lduh	[%l7 + 0x2E],	%o0
	udivcc	%l0,	0x1F3A,	%o3
	fandnot2	%f2,	%f2,	%f18
	alignaddr	%l5,	%i5,	%i1
	edge32	%i7,	%i2,	%l2
	edge16l	%o1,	%g1,	%g5
	xnorcc	%l4,	%o4,	%o6
	ldd	[%l7 + 0x28],	%f24
	fsrc2	%f30,	%f16
	fmovdcs	%icc,	%f29,	%f22
	fmovdgu	%xcc,	%f16,	%f6
	fmovdvs	%xcc,	%f23,	%f20
	ldub	[%l7 + 0x53],	%g7
	bshuffle	%f26,	%f16,	%f26
	movrne	%i6,	%l6,	%l3
	ldd	[%l7 + 0x78],	%g2
	sth	%g4,	[%l7 + 0x72]
	add	%l1,	%o2,	%i0
	fmovsneg	%xcc,	%f23,	%f2
	movgu	%icc,	%g3,	%i4
	edge32ln	%o5,	%i3,	%g6
	subc	%o0,	%l0,	%o7
	movle	%icc,	%l5,	%o3
	movre	%i5,	%i1,	%i2
	xnor	%l2,	%o1,	%i7
	sra	%g5,	0x03,	%l4
	sll	%g1,	0x0C,	%o6
	edge8	%o4,	%i6,	%g7
	edge32n	%l6,	%l3,	%g4
	ldsh	[%l7 + 0x5E],	%g2
	lduw	[%l7 + 0x08],	%l1
	sll	%i0,	%g3,	%o2
	movne	%xcc,	%o5,	%i3
	mulx	%i4,	0x0EFA,	%o0
	st	%f4,	[%l7 + 0x34]
	umul	%g6,	%o7,	%l5
	umulcc	%o3,	%l0,	%i5
	restore %i2, 0x1274, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o1,	0x05BD,	%i7
	movge	%xcc,	%l2,	%g5
	edge32n	%g1,	%l4,	%o4
	fnot2s	%f16,	%f4
	fcmpes	%fcc2,	%f28,	%f21
	xorcc	%i6,	%g7,	%l6
	andn	%o6,	%g4,	%l3
	fmovrdne	%g2,	%f10,	%f8
	andn	%l1,	0x0659,	%i0
	fnands	%f25,	%f0,	%f26
	fcmpne32	%f30,	%f4,	%g3
	mova	%xcc,	%o2,	%o5
	addccc	%i4,	%i3,	%g6
	fcmpes	%fcc3,	%f8,	%f17
	move	%icc,	%o7,	%o0
	fpsub16	%f14,	%f4,	%f28
	ldd	[%l7 + 0x60],	%o2
	fcmpeq32	%f22,	%f4,	%l0
	edge32l	%l5,	%i2,	%i1
	movrgz	%o1,	0x239,	%i7
	nop
	set	0x42, %g6
	ldub	[%l7 + %g6],	%i5
	nop
	set	0x48, %o2
	lduw	[%l7 + %o2],	%g5
	fmovdgu	%icc,	%f18,	%f27
	udivx	%l2,	0x1687,	%g1
	ld	[%l7 + 0x24],	%f11
	fmovdge	%xcc,	%f8,	%f20
	sdivcc	%l4,	0x15BF,	%o4
	edge8n	%i6,	%g7,	%l6
	movne	%xcc,	%o6,	%l3
	fmovdpos	%icc,	%f18,	%f11
	movvc	%icc,	%g4,	%l1
	movne	%icc,	%i0,	%g3
	srax	%g2,	%o5,	%o2
	xor	%i3,	0x15F7,	%i4
	movneg	%icc,	%o7,	%o0
	movl	%xcc,	%g6,	%l0
	lduh	[%l7 + 0x3A],	%l5
	sth	%i2,	[%l7 + 0x64]
	umul	%o3,	%i1,	%i7
	movle	%xcc,	%i5,	%g5
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	movge	%icc,	%l2,	%l4
	fcmpne32	%f30,	%f14,	%o4
	umulcc	%i6,	%l6,	%g7
	fzero	%f30
	umul	%o6,	0x07BE,	%l3
	movneg	%xcc,	%l1,	%g4
	movrgez	%g3,	0x055,	%g2
	movre	%o5,	0x311,	%o2
	movgu	%xcc,	%i0,	%i3
	ldsb	[%l7 + 0x17],	%i4
	sethi	0x11B2,	%o7
	smulcc	%g6,	0x08EC,	%o0
	array8	%l0,	%l5,	%o3
	fmovd	%f22,	%f24
	movrgz	%i2,	0x143,	%i7
	fmovsne	%icc,	%f29,	%f28
	stw	%i1,	[%l7 + 0x20]
	fmul8x16al	%f23,	%f5,	%f10
	sdivcc	%g5,	0x0055,	%i5
	array32	%o1,	%l2,	%l4
	movvc	%icc,	%o4,	%i6
	movcc	%xcc,	%g1,	%g7
	fpack32	%f18,	%f24,	%f28
	xor	%l6,	%o6,	%l1
	fsrc1	%f2,	%f4
	movg	%icc,	%g4,	%g3
	ldsb	[%l7 + 0x12],	%g2
	fmovsvs	%icc,	%f4,	%f27
	andn	%l3,	%o5,	%i0
	ld	[%l7 + 0x68],	%f23
	movrgz	%o2,	0x2AF,	%i3
	edge8	%o7,	%i4,	%o0
	stx	%g6,	[%l7 + 0x60]
	sra	%l0,	0x14,	%o3
	sdiv	%l5,	0x00B9,	%i7
	fmovsle	%icc,	%f25,	%f8
	lduw	[%l7 + 0x50],	%i2
	movrlez	%g5,	%i5,	%i1
	fcmpne32	%f20,	%f2,	%l2
	and	%l4,	0x0B1B,	%o4
	ldsh	[%l7 + 0x16],	%i6
	movneg	%xcc,	%o1,	%g1
	movgu	%xcc,	%g7,	%o6
	edge8	%l1,	%l6,	%g4
	ldx	[%l7 + 0x58],	%g3
	addcc	%g2,	0x0EEE,	%l3
	orncc	%o5,	0x0BF2,	%o2
	udivx	%i3,	0x1B36,	%i0
	move	%xcc,	%i4,	%o0
	ldub	[%l7 + 0x60],	%o7
	edge16ln	%g6,	%o3,	%l0
	srl	%l5,	%i2,	%g5
	edge8n	%i5,	%i1,	%l2
	movrlez	%i7,	0x04D,	%l4
	st	%f24,	[%l7 + 0x44]
	stb	%o4,	[%l7 + 0x2B]
	edge32l	%o1,	%i6,	%g7
	xor	%g1,	0x0A36,	%l1
	fmovrde	%l6,	%f30,	%f0
	edge32ln	%g4,	%g3,	%g2
	movpos	%icc,	%l3,	%o6
	srlx	%o5,	0x04,	%i3
	movrlz	%i0,	%i4,	%o0
	movcc	%icc,	%o2,	%g6
	andncc	%o7,	%l0,	%o3
	sllx	%i2,	%l5,	%i5
	fornot2s	%f14,	%f2,	%f28
	fmovsn	%xcc,	%f21,	%f4
	edge16l	%g5,	%l2,	%i1
	movrlz	%i7,	%l4,	%o1
	edge32ln	%o4,	%i6,	%g7
	subccc	%l1,	%g1,	%l6
	movvs	%xcc,	%g3,	%g2
	movrlez	%l3,	%o6,	%o5
	movcc	%icc,	%i3,	%g4
	fones	%f3
	edge16l	%i4,	%o0,	%i0
	umul	%o2,	%o7,	%l0
	movvc	%xcc,	%o3,	%i2
	smul	%g6,	%l5,	%g5
	subccc	%i5,	0x1F0F,	%l2
	sllx	%i1,	%i7,	%o1
	edge32	%l4,	%o4,	%g7
	movvc	%icc,	%i6,	%l1
	alignaddrl	%l6,	%g3,	%g2
	add	%l3,	0x13F8,	%g1
	edge32n	%o5,	%i3,	%g4
	movcs	%xcc,	%o6,	%i4
	ldsb	[%l7 + 0x73],	%o0
	edge32	%i0,	%o2,	%l0
	xnor	%o7,	0x0398,	%o3
	smul	%g6,	%i2,	%l5
	addc	%g5,	%l2,	%i1
	fnot2s	%f3,	%f27
	sll	%i5,	%i7,	%o1
	movne	%xcc,	%l4,	%g7
	edge32l	%o4,	%l1,	%i6
	sdivx	%l6,	0x020A,	%g3
	subccc	%l3,	%g2,	%o5
	movg	%icc,	%g1,	%i3
	add	%g4,	%i4,	%o0
	sll	%i0,	0x0D,	%o6
	movpos	%icc,	%o2,	%l0
	ld	[%l7 + 0x24],	%f31
	movg	%icc,	%o7,	%o3
	nop
	set	0x60, %i1
	lduw	[%l7 + %i1],	%i2
	movvc	%icc,	%l5,	%g5
	fmovsa	%xcc,	%f12,	%f30
	ldd	[%l7 + 0x48],	%f30
	xorcc	%l2,	0x024B,	%i1
	umulcc	%g6,	0x1841,	%i5
	movn	%xcc,	%o1,	%i7
	move	%icc,	%l4,	%o4
	edge32ln	%g7,	%i6,	%l1
	edge8ln	%g3,	%l3,	%g2
	movrlez	%l6,	%o5,	%g1
	add	%g4,	%i3,	%o0
	stx	%i4,	[%l7 + 0x68]
	smulcc	%i0,	%o2,	%l0
	movvs	%xcc,	%o6,	%o3
	srax	%o7,	%l5,	%i2
	sub	%g5,	0x04E0,	%i1
	stw	%l2,	[%l7 + 0x18]
	andncc	%i5,	%o1,	%i7
	mulscc	%g6,	%o4,	%g7
	fsrc2s	%f24,	%f21
	addc	%i6,	0x04E5,	%l1
	ldsw	[%l7 + 0x18],	%g3
	lduw	[%l7 + 0x2C],	%l3
	subcc	%g2,	%l4,	%o5
	movl	%xcc,	%g1,	%l6
	movge	%xcc,	%i3,	%g4
	movpos	%icc,	%i4,	%o0
	stx	%i0,	[%l7 + 0x30]
	fxnors	%f25,	%f28,	%f3
	movrlz	%o2,	0x32F,	%o6
	stw	%l0,	[%l7 + 0x38]
	smulcc	%o3,	0x1357,	%l5
	array8	%i2,	%g5,	%i1
	ldsb	[%l7 + 0x3B],	%o7
	subc	%l2,	%i5,	%i7
	lduh	[%l7 + 0x18],	%g6
	orcc	%o1,	0x1A9C,	%g7
	edge32l	%i6,	%o4,	%g3
	add	%l3,	%l1,	%g2
	fmovdg	%xcc,	%f13,	%f13
	fnot1s	%f7,	%f0
	fmovde	%icc,	%f21,	%f11
	xor	%o5,	0x1C1E,	%g1
	alignaddr	%l6,	%i3,	%g4
	sdivx	%i4,	0x0251,	%o0
	ld	[%l7 + 0x2C],	%f18
	sdiv	%i0,	0x0D00,	%l4
	subc	%o6,	0x021A,	%l0
	andn	%o2,	0x0E59,	%o3
	popc	%i2,	%l5
	ldsh	[%l7 + 0x3E],	%i1
	fmovdneg	%icc,	%f14,	%f28
	alignaddr	%o7,	%g5,	%l2
	fpadd16	%f22,	%f18,	%f12
	movgu	%icc,	%i7,	%g6
	sdivcc	%o1,	0x025B,	%g7
	ldsh	[%l7 + 0x6E],	%i6
	xnor	%i5,	0x1B17,	%o4
	andcc	%l3,	%l1,	%g3
	alignaddr	%g2,	%g1,	%l6
	subccc	%i3,	0x0949,	%g4
	movpos	%icc,	%o5,	%i4
	nop
	set	0x28, %o6
	ldx	[%l7 + %o6],	%i0
	edge8l	%l4,	%o0,	%l0
	udivcc	%o6,	0x1C89,	%o2
	movneg	%xcc,	%i2,	%l5
	fmul8x16	%f13,	%f12,	%f20
	array32	%i1,	%o3,	%o7
	edge16l	%l2,	%g5,	%i7
	lduh	[%l7 + 0x2C],	%g6
	srlx	%o1,	%i6,	%g7
	edge32	%o4,	%l3,	%l1
	andncc	%i5,	%g2,	%g3
	movgu	%icc,	%g1,	%i3
	alignaddrl	%g4,	%l6,	%i4
	fmovdneg	%icc,	%f25,	%f18
	edge16	%i0,	%l4,	%o5
	fcmpd	%fcc0,	%f2,	%f26
	smul	%l0,	%o6,	%o0
	stb	%i2,	[%l7 + 0x3F]
	edge8	%l5,	%i1,	%o2
	udivcc	%o7,	0x0615,	%l2
	edge32n	%g5,	%o3,	%i7
	alignaddr	%g6,	%o1,	%g7
	add	%i6,	0x123D,	%o4
	array16	%l1,	%l3,	%g2
	movpos	%xcc,	%i5,	%g3
	fnors	%f29,	%f29,	%f13
	addcc	%g1,	%i3,	%l6
	bshuffle	%f6,	%f24,	%f14
	sir	0x1350
	movneg	%xcc,	%g4,	%i0
	fcmple32	%f4,	%f16,	%i4
	edge32n	%o5,	%l4,	%o6
	fmul8x16au	%f1,	%f25,	%f6
	movpos	%icc,	%o0,	%i2
	sdivx	%l0,	0x07EA,	%l5
	movneg	%icc,	%i1,	%o7
	stx	%o2,	[%l7 + 0x38]
	edge16ln	%l2,	%g5,	%i7
	xor	%o3,	%g6,	%o1
	movcc	%icc,	%g7,	%o4
	movvc	%xcc,	%l1,	%i6
	movleu	%xcc,	%l3,	%i5
	move	%xcc,	%g2,	%g1
	st	%f9,	[%l7 + 0x48]
	subcc	%g3,	0x0D26,	%l6
	movl	%icc,	%i3,	%i0
	sllx	%i4,	%g4,	%l4
	or	%o5,	0x00C1,	%o6
	umul	%o0,	0x1727,	%i2
	movne	%xcc,	%l5,	%i1
	movge	%icc,	%o7,	%l0
	movn	%icc,	%l2,	%o2
	movg	%icc,	%g5,	%o3
	lduh	[%l7 + 0x6E],	%g6
	smul	%o1,	%g7,	%i7
	fsrc1s	%f17,	%f21
	edge8ln	%l1,	%i6,	%l3
	ld	[%l7 + 0x1C],	%f7
	sdivx	%o4,	0x13F0,	%i5
	sra	%g1,	0x18,	%g2
	sll	%l6,	0x0A,	%i3
	fcmpeq16	%f18,	%f22,	%i0
	sub	%i4,	0x0CBF,	%g3
	ldsw	[%l7 + 0x64],	%l4
	fornot2s	%f16,	%f12,	%f15
	srlx	%g4,	%o5,	%o0
	or	%i2,	0x0E82,	%o6
	fnor	%f2,	%f16,	%f26
	umulcc	%i1,	%o7,	%l5
	move	%xcc,	%l0,	%l2
	ldsw	[%l7 + 0x10],	%o2
	ld	[%l7 + 0x38],	%f30
	udivx	%o3,	0x0D76,	%g6
	st	%f29,	[%l7 + 0x58]
	ldx	[%l7 + 0x70],	%o1
	fands	%f2,	%f0,	%f0
	ldsh	[%l7 + 0x46],	%g5
	mulscc	%i7,	%g7,	%l1
	fmovdneg	%xcc,	%f12,	%f12
	fzeros	%f12
	fones	%f30
	movgu	%xcc,	%l3,	%o4
	movvc	%icc,	%i6,	%g1
	edge32	%i5,	%l6,	%i3
	or	%i0,	0x089A,	%i4
	pdist	%f28,	%f30,	%f28
	movvc	%icc,	%g3,	%g2
	ldub	[%l7 + 0x35],	%l4
	addc	%o5,	0x14C7,	%o0
	fmovsneg	%xcc,	%f21,	%f23
	mulscc	%i2,	%o6,	%g4
	fcmple16	%f22,	%f16,	%o7
	fands	%f0,	%f29,	%f28
	movle	%icc,	%i1,	%l0
	ldd	[%l7 + 0x78],	%f2
	movpos	%icc,	%l2,	%o2
	addcc	%l5,	%g6,	%o3
	ldsb	[%l7 + 0x16],	%g5
	fands	%f25,	%f25,	%f5
	save %o1, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l1,	%l3,	%o4
	fmovde	%xcc,	%f8,	%f11
	fmovrdgz	%g1,	%f18,	%f26
	edge8	%i5,	%i6,	%l6
	sethi	0x133E,	%i3
	fmul8x16au	%f5,	%f27,	%f18
	fpsub32	%f14,	%f22,	%f18
	ldsb	[%l7 + 0x32],	%i0
	smul	%g3,	%i4,	%l4
	movrgez	%o5,	0x175,	%g2
	edge16n	%i2,	%o0,	%g4
	array32	%o6,	%o7,	%i1
	add	%l2,	0x07D6,	%l0
	edge32n	%l5,	%o2,	%o3
	fandnot1	%f4,	%f6,	%f8
	movrlz	%g5,	0x0C9,	%o1
	fmovdcs	%icc,	%f1,	%f2
	fcmpne16	%f22,	%f0,	%i7
	edge32ln	%g6,	%g7,	%l3
	fmul8x16al	%f17,	%f1,	%f6
	fand	%f10,	%f22,	%f16
	fmovdge	%icc,	%f2,	%f30
	sdiv	%l1,	0x0560,	%g1
	mulscc	%o4,	%i5,	%i6
	restore %i3, 0x040A, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x64],	%g3
	and	%i4,	0x11A4,	%i0
	edge16l	%l4,	%o5,	%g2
	fpadd16s	%f14,	%f21,	%f9
	mulscc	%i2,	0x13C3,	%g4
	array16	%o6,	%o0,	%i1
	movne	%xcc,	%l2,	%l0
	movge	%xcc,	%l5,	%o2
	movn	%xcc,	%o3,	%o7
	movrlz	%o1,	0x1AE,	%g5
	fmul8x16al	%f17,	%f4,	%f16
	movg	%xcc,	%g6,	%i7
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	movgu	%icc,	%l1,	%g1
	fmul8ulx16	%f2,	%f20,	%f6
	fxor	%f30,	%f0,	%f0
	fornot1s	%f12,	%f27,	%f27
	movrne	%i5,	%o4,	%i6
	orcc	%l6,	0x00F7,	%g3
	st	%f27,	[%l7 + 0x14]
	fmul8ulx16	%f26,	%f6,	%f16
	sra	%i4,	%i3,	%i0
	fnegd	%f16,	%f6
	orn	%l4,	%o5,	%i2
	fnor	%f26,	%f20,	%f16
	fnot1s	%f8,	%f16
	srl	%g4,	%o6,	%g2
	movg	%icc,	%i1,	%o0
	umul	%l0,	0x1174,	%l5
	fmovde	%icc,	%f31,	%f22
	movrgez	%o2,	0x25C,	%o3
	and	%o7,	0x08BD,	%l2
	fsrc2s	%f27,	%f9
	edge32	%g5,	%o1,	%i7
	edge16l	%g6,	%g7,	%l3
	andncc	%l1,	%g1,	%o4
	movg	%xcc,	%i5,	%l6
	fmovrse	%i6,	%f0,	%f13
	alignaddr	%g3,	%i3,	%i4
	smul	%i0,	%o5,	%l4
	udivcc	%g4,	0x0315,	%i2
	udivx	%g2,	0x19F8,	%i1
	sra	%o6,	%o0,	%l5
	lduh	[%l7 + 0x2C],	%o2
	fnor	%f16,	%f0,	%f30
	alignaddr	%o3,	%o7,	%l2
	fmovde	%icc,	%f18,	%f11
	movcc	%icc,	%g5,	%o1
	move	%icc,	%i7,	%l0
	sllx	%g6,	0x0E,	%g7
	edge8ln	%l1,	%g1,	%o4
	move	%icc,	%i5,	%l6
	fmovda	%icc,	%f30,	%f3
	fpadd16	%f8,	%f6,	%f26
	stw	%l3,	[%l7 + 0x1C]
	subcc	%i6,	%i3,	%g3
	fmovsl	%icc,	%f16,	%f9
	udiv	%i4,	0x02B9,	%i0
	move	%icc,	%o5,	%g4
	movrlz	%i2,	0x19E,	%g2
	stx	%i1,	[%l7 + 0x10]
	edge16ln	%o6,	%o0,	%l4
	sdiv	%o2,	0x04C0,	%o3
	movrlez	%o7,	0x03F,	%l5
	movre	%g5,	%l2,	%i7
	edge32ln	%o1,	%g6,	%l0
	subc	%g7,	%l1,	%o4
	fmovrslez	%i5,	%f25,	%f29
	xnor	%l6,	%l3,	%i6
	edge16l	%i3,	%g3,	%g1
	fxors	%f0,	%f0,	%f7
	udivcc	%i0,	0x0785,	%i4
	fnot1	%f0,	%f10
	sdivx	%o5,	0x098A,	%g4
	st	%f15,	[%l7 + 0x78]
	ldx	[%l7 + 0x30],	%i2
	srl	%i1,	0x0F,	%g2
	xnorcc	%o6,	%o0,	%o2
	srl	%l4,	%o7,	%l5
	ldd	[%l7 + 0x20],	%g4
	sll	%l2,	%i7,	%o1
	ldub	[%l7 + 0x29],	%o3
	sllx	%g6,	0x0D,	%g7
	movgu	%xcc,	%l1,	%l0
	edge8l	%i5,	%o4,	%l6
	fcmpd	%fcc3,	%f4,	%f20
	xor	%i6,	0x05DD,	%l3
	save %i3, %g1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i4,	%o5,	%i0
	fcmpes	%fcc2,	%f25,	%f25
	ldub	[%l7 + 0x62],	%i2
	nop
	set	0x70, %g3
	stx	%i1,	[%l7 + %g3]
	ldsb	[%l7 + 0x72],	%g4
	sth	%o6,	[%l7 + 0x72]
	mulx	%o0,	%g2,	%o2
	edge32l	%l4,	%o7,	%g5
	alignaddrl	%l2,	%l5,	%o1
	fmovrdgez	%o3,	%f10,	%f4
	sdivx	%g6,	0x0FBB,	%i7
	movpos	%icc,	%l1,	%l0
	lduw	[%l7 + 0x0C],	%g7
	lduh	[%l7 + 0x7C],	%i5
	restore %o4, 0x10B5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l6,	%l3,	%i3
	fmovdle	%icc,	%f14,	%f17
	mulscc	%g1,	0x070F,	%g3
	movrlez	%i4,	0x0F7,	%o5
	subcc	%i2,	%i0,	%i1
	fmovsn	%xcc,	%f24,	%f20
	fpsub16	%f22,	%f20,	%f10
	movcs	%xcc,	%g4,	%o6
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	xor	%l4,	0x14E3,	%o7
	movrne	%o2,	0x10E,	%g5
	fandnot2	%f0,	%f12,	%f18
	smul	%l5,	%l2,	%o3
	movn	%xcc,	%o1,	%g6
	edge16l	%i7,	%l0,	%g7
	orn	%l1,	%i5,	%o4
	sra	%i6,	%l6,	%i3
	addc	%g1,	%l3,	%i4
	fnands	%f10,	%f18,	%f20
	popc	%g3,	%o5
	fnot1	%f26,	%f14
	movcs	%xcc,	%i2,	%i1
	edge32l	%g4,	%o6,	%i0
	subc	%g2,	0x0C93,	%o0
	lduh	[%l7 + 0x26],	%o7
	edge32l	%o2,	%l4,	%g5
	fxnors	%f20,	%f18,	%f19
	movpos	%xcc,	%l5,	%l2
	edge16	%o1,	%g6,	%o3
	edge16l	%l0,	%i7,	%g7
	movn	%xcc,	%l1,	%o4
	ldd	[%l7 + 0x10],	%i6
	umulcc	%i5,	%i3,	%g1
	movrne	%l3,	0x04A,	%i4
	xnorcc	%l6,	%g3,	%i2
	orn	%i1,	%o5,	%o6
	edge32l	%g4,	%g2,	%i0
	ldd	[%l7 + 0x70],	%f16
	sllx	%o0,	%o7,	%o2
	andcc	%l4,	0x095A,	%g5
	fmovscs	%xcc,	%f12,	%f15
	edge8ln	%l2,	%o1,	%g6
	edge16ln	%o3,	%l0,	%i7
	fmuld8sux16	%f6,	%f31,	%f10
	edge8l	%g7,	%l5,	%l1
	movl	%xcc,	%o4,	%i5
	fmovscs	%xcc,	%f26,	%f21
	umulcc	%i6,	%g1,	%i3
	edge32ln	%l3,	%i4,	%l6
	fmuld8sux16	%f25,	%f4,	%f0
	sdivcc	%g3,	0x0D86,	%i2
	sra	%i1,	%o5,	%g4
	sethi	0x1077,	%g2
	fmovdneg	%xcc,	%f6,	%f6
	fcmpgt16	%f4,	%f24,	%i0
	sir	0x07E3
	movrlez	%o6,	0x38E,	%o7
	udivcc	%o0,	0x0BAE,	%l4
	movrlz	%g5,	0x012,	%o2
	subcc	%o1,	%l2,	%o3
	movneg	%xcc,	%g6,	%i7
	lduh	[%l7 + 0x36],	%g7
	ldub	[%l7 + 0x30],	%l5
	srlx	%l1,	%o4,	%l0
	sir	0x1C92
	save %i6, 0x0B42, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i3,	%l3,	%i5
	alignaddr	%i4,	%l6,	%i2
	fpsub32	%f16,	%f24,	%f8
	fsrc1	%f0,	%f14
	subc	%g3,	%o5,	%g4
	sir	0x1B18
	ldd	[%l7 + 0x78],	%f22
	udivcc	%i1,	0x148E,	%i0
	stw	%g2,	[%l7 + 0x50]
	movgu	%icc,	%o6,	%o7
	udiv	%l4,	0x190E,	%o0
	alignaddr	%o2,	%g5,	%l2
	ldx	[%l7 + 0x30],	%o1
	edge16n	%o3,	%g6,	%g7
	srax	%l5,	%l1,	%o4
	srax	%l0,	%i6,	%i7
	movg	%icc,	%i3,	%g1
	andn	%l3,	0x0C4A,	%i4
	sth	%l6,	[%l7 + 0x34]
	std	%f2,	[%l7 + 0x68]
	array8	%i2,	%g3,	%i5
	stw	%g4,	[%l7 + 0x38]
	edge16ln	%i1,	%i0,	%g2
	ld	[%l7 + 0x44],	%f8
	fmovdneg	%icc,	%f13,	%f15
	udivx	%o6,	0x045B,	%o7
	movne	%xcc,	%o5,	%o0
	fpack32	%f14,	%f24,	%f4
	edge32n	%l4,	%g5,	%o2
	subcc	%l2,	0x0512,	%o3
	movre	%g6,	0x050,	%o1
	ldub	[%l7 + 0x1A],	%g7
	andncc	%l1,	%l5,	%o4
	sllx	%i6,	%l0,	%i7
	edge32	%g1,	%i3,	%i4
	xorcc	%l3,	0x1007,	%l6
	movcs	%xcc,	%g3,	%i5
	fpmerge	%f23,	%f11,	%f0
	add	%g4,	%i1,	%i0
	subccc	%g2,	0x0A65,	%o6
	fpadd32s	%f16,	%f20,	%f21
	alignaddr	%i2,	%o7,	%o0
	movcc	%xcc,	%l4,	%g5
	andn	%o2,	%o5,	%l2
	movneg	%xcc,	%g6,	%o1
	edge32l	%o3,	%l1,	%g7
	fmovsge	%xcc,	%f0,	%f28
	popc	%o4,	%i6
	mova	%xcc,	%l5,	%i7
	srax	%g1,	0x10,	%l0
	movvc	%xcc,	%i4,	%i3
	movpos	%icc,	%l3,	%l6
	udivcc	%i5,	0x1192,	%g3
	sllx	%g4,	0x09,	%i0
	andncc	%i1,	%g2,	%i2
	xor	%o6,	0x02F5,	%o7
	movcs	%icc,	%l4,	%o0
	xor	%g5,	%o5,	%l2
	xor	%g6,	%o2,	%o3
	edge32l	%o1,	%l1,	%o4
	edge32n	%g7,	%l5,	%i7
	fmovsge	%xcc,	%f4,	%f27
	srax	%g1,	%l0,	%i4
	popc	0x08F3,	%i6
	movvc	%icc,	%i3,	%l3
	movrlez	%i5,	%g3,	%l6
	fmovsgu	%icc,	%f17,	%f7
	sdiv	%g4,	0x1167,	%i1
	move	%icc,	%i0,	%i2
	sra	%o6,	%o7,	%g2
	subccc	%l4,	%o0,	%g5
	edge32ln	%o5,	%l2,	%g6
	ldx	[%l7 + 0x18],	%o2
	fpsub32	%f24,	%f20,	%f28
	mulx	%o1,	%o3,	%l1
	edge32n	%o4,	%g7,	%i7
	smulcc	%g1,	0x19F3,	%l0
	add	%i4,	0x1550,	%i6
	smulcc	%i3,	%l5,	%l3
	movvc	%icc,	%i5,	%g3
	movrne	%l6,	0x393,	%g4
	or	%i0,	%i1,	%o6
	fmovsa	%icc,	%f18,	%f16
	movpos	%xcc,	%o7,	%g2
	andn	%i2,	%l4,	%g5
	fornot2s	%f14,	%f0,	%f22
	edge8n	%o0,	%l2,	%g6
	move	%xcc,	%o5,	%o2
	sir	0x1D2A
	ldx	[%l7 + 0x20],	%o3
	array8	%l1,	%o1,	%o4
	sethi	0x1745,	%i7
	sll	%g1,	%g7,	%l0
	movleu	%icc,	%i4,	%i6
	edge16n	%l5,	%l3,	%i3
	ldd	[%l7 + 0x58],	%f12
	edge16l	%i5,	%l6,	%g4
	fors	%f25,	%f26,	%f24
	movvs	%xcc,	%g3,	%i0
	fmovdpos	%xcc,	%f28,	%f7
	movge	%xcc,	%o6,	%o7
	umulcc	%i1,	%i2,	%l4
	sllx	%g5,	0x1B,	%o0
	fmovsl	%xcc,	%f17,	%f0
	edge32ln	%l2,	%g6,	%o5
	lduh	[%l7 + 0x78],	%o2
	fones	%f18
	movn	%icc,	%o3,	%l1
	sllx	%g2,	%o4,	%i7
	fcmpne16	%f20,	%f16,	%g1
	sth	%o1,	[%l7 + 0x72]
	smulcc	%g7,	%l0,	%i6
	edge8n	%i4,	%l3,	%l5
	ldd	[%l7 + 0x70],	%i4
	movneg	%icc,	%i3,	%g4
	edge8l	%l6,	%i0,	%g3
	mulscc	%o6,	%o7,	%i2
	add	%l4,	0x1E94,	%g5
	lduh	[%l7 + 0x12],	%o0
	edge32ln	%l2,	%g6,	%o5
	xnor	%i1,	%o3,	%o2
	sllx	%l1,	0x0D,	%g2
	fexpand	%f12,	%f12
	movg	%xcc,	%o4,	%i7
	edge32n	%o1,	%g7,	%l0
	sdivx	%g1,	0x1E0C,	%i6
	orncc	%l3,	0x1E44,	%i4
	sub	%i5,	0x01D2,	%l5
	movn	%xcc,	%i3,	%l6
	restore %i0, %g4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f16,	%f22,	%f8
	fpsub32s	%f7,	%f30,	%f18
	sdiv	%o6,	0x050D,	%o7
	ldsb	[%l7 + 0x39],	%i2
	movvc	%xcc,	%l4,	%o0
	alignaddr	%g5,	%g6,	%l2
	fexpand	%f14,	%f4
	sth	%o5,	[%l7 + 0x56]
	sdivx	%i1,	0x05B8,	%o3
	edge16n	%l1,	%g2,	%o2
	ldx	[%l7 + 0x50],	%o4
	fcmpes	%fcc1,	%f19,	%f22
	udivx	%i7,	0x1B26,	%o1
	fmovde	%icc,	%f12,	%f24
	fabss	%f23,	%f11
	umulcc	%g7,	0x1B1A,	%l0
	fcmpne16	%f26,	%f8,	%g1
	smul	%l3,	0x1B4E,	%i4
	subccc	%i6,	0x1AB7,	%i5
	sir	0x1A3E
	mulx	%l5,	0x038E,	%l6
	orncc	%i0,	%g4,	%i3
	fmovrdne	%g3,	%f28,	%f6
	movre	%o6,	0x207,	%i2
	array16	%l4,	%o7,	%o0
	udivx	%g5,	0x12E2,	%g6
	fmovsa	%xcc,	%f18,	%f30
	movrne	%l2,	%i1,	%o3
	array16	%o5,	%l1,	%o2
	edge32l	%g2,	%i7,	%o1
	fcmpes	%fcc2,	%f6,	%f14
	fmovdneg	%icc,	%f7,	%f0
	sdivcc	%o4,	0x137B,	%l0
	fmovsa	%icc,	%f9,	%f22
	edge8	%g7,	%l3,	%i4
	fcmpgt32	%f22,	%f2,	%g1
	subc	%i5,	0x0BE2,	%i6
	movrlz	%l6,	0x015,	%i0
	save %g4, %l5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%f22
	sth	%o6,	[%l7 + 0x2A]
	fnot1	%f26,	%f14
	movcc	%xcc,	%i2,	%l4
	ldd	[%l7 + 0x20],	%f12
	subcc	%o7,	0x0BEB,	%o0
	movgu	%icc,	%g5,	%g6
	subc	%g3,	%l2,	%i1
	fmovdg	%xcc,	%f16,	%f21
	movrgz	%o5,	%o3,	%o2
	movne	%icc,	%l1,	%i7
	movgu	%icc,	%g2,	%o4
	edge16n	%o1,	%l0,	%l3
	alignaddrl	%i4,	%g1,	%i5
	xnorcc	%i6,	0x00BA,	%l6
	fmovrdgz	%i0,	%f14,	%f12
	movgu	%icc,	%g4,	%g7
	ldx	[%l7 + 0x70],	%i3
	edge32	%l5,	%o6,	%l4
	and	%o7,	0x156D,	%o0
	fnors	%f25,	%f27,	%f21
	lduh	[%l7 + 0x0E],	%i2
	sra	%g5,	0x11,	%g6
	fcmpeq32	%f26,	%f18,	%g3
	array16	%i1,	%o5,	%l2
	array32	%o2,	%o3,	%l1
	std	%f14,	[%l7 + 0x68]
	nop
	set	0x48, %o3
	lduw	[%l7 + %o3],	%i7
	fzeros	%f10
	fmuld8ulx16	%f18,	%f21,	%f28
	movneg	%icc,	%o4,	%g2
	fcmpgt16	%f20,	%f8,	%l0
	st	%f7,	[%l7 + 0x18]
	movleu	%icc,	%o1,	%i4
	sir	0x1031
	movne	%xcc,	%g1,	%i5
	lduw	[%l7 + 0x3C],	%i6
	sra	%l6,	0x0A,	%l3
	edge16l	%i0,	%g7,	%g4
	alignaddrl	%i3,	%l5,	%o6
	lduw	[%l7 + 0x1C],	%l4
	bshuffle	%f0,	%f20,	%f0
	fmul8x16al	%f24,	%f27,	%f16
	edge32n	%o7,	%o0,	%g5
	orncc	%g6,	%g3,	%i1
	srax	%o5,	%i2,	%o2
	edge8n	%o3,	%l1,	%l2
	movre	%i7,	0x2AD,	%g2
	stb	%o4,	[%l7 + 0x67]
	edge8l	%o1,	%l0,	%i4
	sth	%g1,	[%l7 + 0x26]
	xor	%i6,	0x02BC,	%i5
	edge8l	%l6,	%l3,	%g7
	ldsb	[%l7 + 0x34],	%i0
	orn	%g4,	0x09B8,	%i3
	movpos	%icc,	%o6,	%l4
	fnands	%f18,	%f6,	%f20
	ldub	[%l7 + 0x55],	%l5
	sth	%o7,	[%l7 + 0x5E]
	edge32l	%o0,	%g6,	%g5
	mova	%xcc,	%g3,	%i1
	udivx	%o5,	0x1FCD,	%o2
	fone	%f12
	orn	%o3,	%i2,	%l1
	nop
	set	0x66, %l1
	ldub	[%l7 + %l1],	%i7
	addc	%g2,	0x01D1,	%l2
	ldx	[%l7 + 0x50],	%o4
	sra	%o1,	0x1B,	%l0
	for	%f6,	%f14,	%f0
	fandnot2	%f12,	%f14,	%f10
	edge32ln	%i4,	%i6,	%i5
	movvc	%xcc,	%l6,	%g1
	std	%f20,	[%l7 + 0x48]
	stw	%g7,	[%l7 + 0x08]
	movl	%xcc,	%l3,	%g4
	udiv	%i0,	0x001D,	%i3
	stb	%o6,	[%l7 + 0x47]
	sra	%l5,	%o7,	%l4
	edge16n	%o0,	%g6,	%g3
	st	%f23,	[%l7 + 0x4C]
	movcc	%xcc,	%i1,	%g5
	alignaddrl	%o2,	%o3,	%i2
	umulcc	%o5,	%l1,	%i7
	movrgz	%l2,	0x301,	%g2
	nop
	set	0x48, %i6
	ldsw	[%l7 + %i6],	%o1
	edge32n	%o4,	%i4,	%i6
	fxnors	%f27,	%f20,	%f4
	lduw	[%l7 + 0x38],	%l0
	edge8	%l6,	%g1,	%i5
	bshuffle	%f6,	%f22,	%f26
	nop
	set	0x58, %i7
	std	%f8,	[%l7 + %i7]
	andcc	%g7,	0x16B1,	%l3
	movvs	%icc,	%g4,	%i0
	movre	%i3,	0x26C,	%l5
	subc	%o7,	0x06CB,	%l4
	edge16ln	%o6,	%o0,	%g3
	movcs	%xcc,	%g6,	%g5
	sir	0x1545
	fmovdcc	%icc,	%f23,	%f30
	movn	%icc,	%i1,	%o3
	andncc	%i2,	%o5,	%l1
	udivcc	%i7,	0x12FD,	%l2
	fcmpeq16	%f10,	%f8,	%o2
	udiv	%o1,	0x1510,	%g2
	siam	0x3
	ldx	[%l7 + 0x10],	%i4
	alignaddrl	%o4,	%l0,	%i6
	ldx	[%l7 + 0x38],	%l6
	fmovdvs	%xcc,	%f29,	%f30
	fcmpne16	%f4,	%f26,	%g1
	udivx	%i5,	0x000D,	%l3
	fmuld8ulx16	%f28,	%f8,	%f0
	fnot1	%f0,	%f22
	popc	%g4,	%g7
	movne	%xcc,	%i0,	%l5
	edge16n	%o7,	%i3,	%l4
	xor	%o0,	0x1A0C,	%g3
	mulscc	%g6,	0x0A3C,	%g5
	sir	0x021B
	bshuffle	%f22,	%f4,	%f26
	andcc	%o6,	0x05F7,	%i1
	or	%o3,	0x0083,	%i2
	movl	%xcc,	%o5,	%l1
	fmovscc	%xcc,	%f5,	%f15
	udivcc	%i7,	0x122F,	%o2
	movleu	%xcc,	%l2,	%o1
	sdiv	%g2,	0x1EEA,	%i4
	mulscc	%o4,	0x0BBC,	%l0
	and	%l6,	0x055E,	%i6
	fmovsle	%icc,	%f14,	%f18
	nop
	set	0x50, %i5
	std	%f28,	[%l7 + %i5]
	ldsh	[%l7 + 0x12],	%g1
	fmovdge	%xcc,	%f8,	%f10
	lduw	[%l7 + 0x24],	%l3
	ldsh	[%l7 + 0x30],	%g4
	movge	%icc,	%i5,	%g7
	fmovdvs	%xcc,	%f0,	%f29
	fcmpgt16	%f16,	%f22,	%l5
	movrgez	%o7,	%i3,	%i0
	popc	0x0AA0,	%o0
	edge16l	%g3,	%g6,	%g5
	fmovda	%icc,	%f26,	%f9
	orcc	%o6,	0x03D2,	%i1
	movrne	%o3,	0x326,	%i2
	fmovsvc	%xcc,	%f15,	%f14
	fmul8x16	%f1,	%f6,	%f10
	nop
	set	0x40, %g2
	ldd	[%l7 + %g2],	%f16
	ldx	[%l7 + 0x40],	%l4
	movre	%l1,	%i7,	%o5
	fmovsvs	%xcc,	%f28,	%f15
	smulcc	%l2,	0x025B,	%o1
	pdist	%f8,	%f20,	%f22
	fsrc1s	%f12,	%f14
	smul	%g2,	%o2,	%i4
	sth	%o4,	[%l7 + 0x54]
	orcc	%l0,	%i6,	%l6
	move	%xcc,	%l3,	%g4
	edge16	%g1,	%i5,	%l5
	fpackfix	%f28,	%f19
	mulx	%g7,	0x1452,	%o7
	xnor	%i3,	%i0,	%o0
	fmovrslz	%g6,	%f27,	%f24
	sra	%g3,	%g5,	%o6
	ldsw	[%l7 + 0x44],	%i1
	edge16	%i2,	%o3,	%l4
	ldd	[%l7 + 0x48],	%f30
	nop
	set	0x68, %o4
	stx	%i7,	[%l7 + %o4]
	xnorcc	%l1,	%l2,	%o5
	smul	%g2,	%o2,	%o1
	edge16ln	%i4,	%o4,	%i6
	orcc	%l6,	0x15E2,	%l0
	sdivx	%l3,	0x1AF0,	%g4
	fpsub16s	%f21,	%f24,	%f29
	movcs	%xcc,	%g1,	%i5
	fmovdvc	%icc,	%f26,	%f23
	movle	%xcc,	%g7,	%o7
	alignaddrl	%l5,	%i3,	%o0
	addccc	%g6,	%i0,	%g3
	sllx	%g5,	%i1,	%i2
	fnands	%f28,	%f30,	%f2
	edge8	%o3,	%l4,	%i7
	ldsb	[%l7 + 0x7B],	%l1
	movgu	%xcc,	%o6,	%o5
	edge8	%g2,	%o2,	%o1
	fmovsgu	%icc,	%f13,	%f9
	movrgz	%l2,	0x10F,	%i4
	edge32l	%o4,	%l6,	%i6
	sethi	0x1E17,	%l3
	fnegs	%f9,	%f28
	array16	%l0,	%g4,	%g1
	stw	%i5,	[%l7 + 0x48]
	sll	%g7,	%o7,	%l5
	srl	%i3,	0x00,	%g6
	srax	%o0,	%i0,	%g3
	orcc	%i1,	%g5,	%i2
	sdivx	%o3,	0x0D20,	%i7
	ldub	[%l7 + 0x16],	%l4
	edge8ln	%l1,	%o6,	%g2
	sir	0x1321
	save %o5, %o2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l2,	%o4,	%i4
	edge32ln	%l6,	%i6,	%l3
	movneg	%icc,	%l0,	%g1
	fand	%f0,	%f26,	%f6
	fmuld8sux16	%f25,	%f28,	%f0
	movvs	%icc,	%i5,	%g4
	movcs	%icc,	%g7,	%o7
	movg	%xcc,	%l5,	%g6
	nop
	set	0x58, %g5
	lduw	[%l7 + %g5],	%o0
	array8	%i0,	%i3,	%i1
	edge32n	%g3,	%i2,	%g5
	movg	%icc,	%i7,	%o3
	lduw	[%l7 + 0x60],	%l4
	udivx	%o6,	0x11CB,	%g2
	edge32l	%l1,	%o2,	%o1
	movrlz	%o5,	0x13E,	%l2
	movrlz	%i4,	%l6,	%i6
	addc	%l3,	%l0,	%o4
	sdiv	%g1,	0x1DB3,	%g4
	stx	%i5,	[%l7 + 0x40]
	mulx	%g7,	0x15E3,	%l5
	fmovsg	%icc,	%f31,	%f7
	movvc	%icc,	%o7,	%g6
	movle	%icc,	%o0,	%i3
	sra	%i0,	%i1,	%g3
	movrne	%g5,	%i2,	%i7
	movrgz	%o3,	%o6,	%l4
	mulx	%g2,	%l1,	%o1
	sra	%o2,	0x0D,	%o5
	xorcc	%i4,	0x1F57,	%l6
	addc	%i6,	%l3,	%l0
	fcmpgt32	%f0,	%f6,	%l2
	alignaddr	%o4,	%g4,	%i5
	fmul8x16au	%f22,	%f2,	%f28
	edge16ln	%g1,	%l5,	%g7
	addccc	%o7,	%g6,	%o0
	fcmple32	%f2,	%f8,	%i0
	smul	%i3,	0x1BE2,	%i1
	orncc	%g3,	0x0984,	%g5
	fmovdneg	%xcc,	%f29,	%f15
	fpadd32s	%f27,	%f1,	%f21
	sra	%i2,	%o3,	%o6
	movne	%icc,	%l4,	%g2
	movvs	%icc,	%i7,	%l1
	popc	%o1,	%o2
	fandnot1s	%f19,	%f12,	%f2
	edge16ln	%i4,	%o5,	%l6
	edge16	%i6,	%l3,	%l2
	stx	%o4,	[%l7 + 0x18]
	edge16ln	%g4,	%l0,	%g1
	sdiv	%l5,	0x1DB8,	%g7
	stw	%i5,	[%l7 + 0x54]
	nop
	set	0x68, %g4
	ldd	[%l7 + %g4],	%g6
	fmovrdgez	%o7,	%f12,	%f12
	fand	%f10,	%f26,	%f26
	movrlez	%i0,	0x1C2,	%o0
	save %i3, 0x0819, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i1,	0x1E52,	%g5
	orcc	%o3,	%o6,	%l4
	srl	%i2,	0x11,	%g2
	fmovrdgz	%l1,	%f24,	%f26
	movrlez	%i7,	0x049,	%o1
	movrgz	%i4,	%o5,	%o2
	udivcc	%l6,	0x0E3B,	%l3
	fmovscc	%xcc,	%f3,	%f25
	lduw	[%l7 + 0x40],	%i6
	edge16l	%l2,	%g4,	%o4
	stx	%g1,	[%l7 + 0x68]
	sdivx	%l5,	0x032A,	%g7
	movpos	%icc,	%i5,	%g6
	movrlez	%l0,	0x1AB,	%i0
	movvc	%xcc,	%o7,	%i3
	fxor	%f26,	%f16,	%f20
	std	%f12,	[%l7 + 0x10]
	fnands	%f11,	%f13,	%f19
	edge32	%o0,	%i1,	%g3
	mulscc	%o3,	%g5,	%o6
	st	%f25,	[%l7 + 0x14]
	and	%i2,	0x1156,	%l4
	fnegd	%f4,	%f14
	edge8ln	%g2,	%i7,	%o1
	st	%f24,	[%l7 + 0x6C]
	add	%l1,	%o5,	%o2
	srl	%l6,	0x15,	%l3
	fpmerge	%f30,	%f2,	%f30
	save %i4, 0x0969, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%g4,	%o4,	%g1
	umulcc	%l5,	%i6,	%i5
	movrne	%g7,	0x040,	%g6
	alignaddr	%l0,	%o7,	%i0
	fmovdvs	%icc,	%f0,	%f6
	lduw	[%l7 + 0x08],	%i3
	mulx	%i1,	0x08A9,	%o0
	xor	%g3,	0x00A4,	%g5
	xnor	%o6,	%o3,	%l4
	edge32	%g2,	%i7,	%i2
	fmovdne	%icc,	%f1,	%f15
	ldd	[%l7 + 0x50],	%f4
	orncc	%l1,	%o5,	%o2
	fmovrse	%o1,	%f24,	%f13
	xnor	%l6,	%i4,	%l3
	fcmpd	%fcc3,	%f22,	%f4
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%l2
	fmovsle	%xcc,	%f20,	%f5
	fmovsleu	%xcc,	%f9,	%f18
	andncc	%g4,	%g1,	%l5
	edge16ln	%o4,	%i5,	%g7
	movgu	%icc,	%i6,	%l0
	mulx	%g6,	0x1CBF,	%i0
	movneg	%xcc,	%i3,	%o7
	fandnot1	%f12,	%f22,	%f18
	sdiv	%i1,	0x04F6,	%o0
	alignaddr	%g5,	%o6,	%g3
	alignaddr	%l4,	%o3,	%g2
	addc	%i7,	0x0464,	%l1
	andn	%i2,	0x199E,	%o5
	fmul8sux16	%f20,	%f14,	%f30
	fmovsa	%xcc,	%f0,	%f2
	movrlez	%o2,	%o1,	%l6
	edge16	%i4,	%l3,	%g4
	subccc	%l2,	%l5,	%g1
	fcmpeq16	%f8,	%f14,	%o4
	sth	%i5,	[%l7 + 0x42]
	xor	%g7,	0x1BC1,	%l0
	stx	%g6,	[%l7 + 0x50]
	movleu	%xcc,	%i0,	%i6
	sllx	%o7,	0x05,	%i1
	fpadd16	%f30,	%f30,	%f22
	fsrc1	%f8,	%f12
	edge8l	%o0,	%g5,	%o6
	edge8l	%g3,	%i3,	%o3
	stw	%l4,	[%l7 + 0x68]
	fcmpgt32	%f22,	%f4,	%g2
	sllx	%i7,	%l1,	%o5
	edge8	%i2,	%o2,	%l6
	move	%xcc,	%i4,	%o1
	move	%icc,	%l3,	%l2
	fmovrslez	%g4,	%f19,	%f19
	ldsh	[%l7 + 0x36],	%l5
	fcmpgt32	%f30,	%f12,	%g1
	addc	%i5,	0x0E74,	%g7
	sth	%o4,	[%l7 + 0x76]
	sub	%g6,	%i0,	%i6
	mulscc	%l0,	%i1,	%o0
	udivcc	%o7,	0x044B,	%g5
	subc	%g3,	%i3,	%o6
	andn	%l4,	%o3,	%i7
	addc	%l1,	%g2,	%i2
	sub	%o5,	%l6,	%o2
	srl	%o1,	%l3,	%l2
	fnand	%f0,	%f24,	%f30
	fmovdge	%icc,	%f31,	%f21
	edge32ln	%i4,	%l5,	%g4
	st	%f20,	[%l7 + 0x20]
	fmovrdlez	%i5,	%f22,	%f20
	edge8	%g1,	%o4,	%g7
	fpsub32s	%f25,	%f17,	%f13
	fmovdneg	%xcc,	%f15,	%f27
	array8	%i0,	%g6,	%i6
	ld	[%l7 + 0x20],	%f13
	edge32l	%l0,	%i1,	%o0
	fmul8x16al	%f4,	%f19,	%f28
	smul	%o7,	%g3,	%i3
	add	%g5,	0x068E,	%l4
	fmuld8ulx16	%f24,	%f2,	%f8
	movge	%xcc,	%o6,	%i7
	smul	%l1,	%o3,	%i2
	ldd	[%l7 + 0x38],	%g2
	fmul8sux16	%f18,	%f16,	%f30
	fmovrse	%l6,	%f31,	%f30
	umulcc	%o5,	%o1,	%o2
	xorcc	%l3,	%l2,	%i4
	alignaddr	%l5,	%g4,	%g1
	stb	%o4,	[%l7 + 0x5C]
	and	%i5,	0x002A,	%i0
	edge16l	%g6,	%i6,	%l0
	fpsub16s	%f22,	%f23,	%f29
	fmovdne	%icc,	%f15,	%f28
	ldd	[%l7 + 0x60],	%g6
	fmovsvc	%xcc,	%f9,	%f10
	fmovrsne	%o0,	%f27,	%f8
	sir	0x1137
	alignaddrl	%o7,	%g3,	%i1
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%i2
	stw	%l4,	[%l7 + 0x34]
	ldub	[%l7 + 0x76],	%o6
	subccc	%i7,	0x0162,	%l1
	sir	0x1B63
	movrlez	%o3,	%i2,	%g5
	stb	%g2,	[%l7 + 0x64]
	smulcc	%o5,	%l6,	%o1
	movrgz	%l3,	%o2,	%l2
	subc	%i4,	0x0906,	%g4
	lduh	[%l7 + 0x08],	%g1
	fmovdgu	%icc,	%f12,	%f31
	mova	%xcc,	%o4,	%i5
	movle	%xcc,	%l5,	%g6
	fmovdl	%icc,	%f31,	%f17
	fmovdneg	%xcc,	%f13,	%f3
	addc	%i0,	0x18AD,	%l0
	stb	%i6,	[%l7 + 0x6C]
	sub	%o0,	0x0F46,	%g7
	edge32	%o7,	%i1,	%g3
	movleu	%icc,	%i3,	%o6
	fornot1	%f8,	%f18,	%f2
	sdivx	%i7,	0x150A,	%l1
	sth	%o3,	[%l7 + 0x76]
	popc	0x1442,	%l4
	edge8n	%g5,	%g2,	%i2
	move	%xcc,	%o5,	%l6
	fmovrsgez	%o1,	%f27,	%f14
	andncc	%o2,	%l3,	%i4
	movn	%icc,	%g4,	%g1
	sllx	%l2,	0x1B,	%i5
	edge16	%o4,	%l5,	%i0
	edge8ln	%g6,	%l0,	%i6
	add	%g7,	0x0873,	%o7
	nop
	set	0x18, %g1
	std	%f28,	[%l7 + %g1]
	umulcc	%o0,	%i1,	%i3
	andn	%o6,	0x1189,	%g3
	st	%f17,	[%l7 + 0x74]
	ldx	[%l7 + 0x68],	%i7
	stx	%o3,	[%l7 + 0x40]
	ldx	[%l7 + 0x78],	%l4
	ldsh	[%l7 + 0x16],	%l1
	ldsh	[%l7 + 0x32],	%g2
	fpsub32	%f28,	%f0,	%f14
	orncc	%g5,	0x0EDB,	%o5
	sub	%i2,	0x0D30,	%o1
	ldsb	[%l7 + 0x61],	%o2
	movpos	%xcc,	%l6,	%i4
	movpos	%xcc,	%l3,	%g4
	ldx	[%l7 + 0x08],	%l2
	ldsh	[%l7 + 0x46],	%i5
	movpos	%xcc,	%g1,	%o4
	andn	%l5,	0x0E6F,	%g6
	edge32	%l0,	%i6,	%g7
	fabsd	%f8,	%f4
	umulcc	%i0,	%o0,	%o7
	sdivx	%i3,	0x1625,	%o6
	fsrc2	%f12,	%f30
	fmovse	%icc,	%f22,	%f23
	smul	%g3,	0x0100,	%i1
	fpsub32s	%f4,	%f31,	%f26
	movrlz	%o3,	0x02A,	%l4
	sir	0x1347
	fcmpgt32	%f22,	%f26,	%l1
	ldub	[%l7 + 0x15],	%i7
	movrne	%g2,	0x17D,	%g5
	fmovsg	%icc,	%f26,	%f0
	fpadd16s	%f7,	%f9,	%f29
	andn	%i2,	%o1,	%o5
	edge16n	%l6,	%o2,	%l3
	edge8n	%i4,	%l2,	%i5
	udivcc	%g1,	0x1A87,	%o4
	ldsh	[%l7 + 0x42],	%l5
	smul	%g4,	%g6,	%i6
	xorcc	%l0,	0x1AD5,	%i0
	edge16l	%g7,	%o7,	%o0
	fmuld8sux16	%f19,	%f3,	%f10
	fmovdne	%icc,	%f17,	%f13
	sll	%i3,	%o6,	%i1
	array32	%g3,	%l4,	%l1
	orn	%i7,	0x0725,	%g2
	sll	%o3,	%g5,	%i2
	fzero	%f28
	smul	%o5,	%l6,	%o2
	stb	%l3,	[%l7 + 0x23]
	sir	0x1C1A
	fmovdvc	%icc,	%f25,	%f30
	fsrc1s	%f19,	%f21
	or	%o1,	%i4,	%l2
	fornot2	%f26,	%f30,	%f8
	save %i5, %g1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g4,	0x0DB7,	%g6
	udivcc	%l5,	0x199F,	%l0
	mulx	%i0,	0x06CD,	%i6
	fmovspos	%icc,	%f5,	%f20
	xorcc	%o7,	%o0,	%g7
	umulcc	%o6,	%i3,	%g3
	movgu	%icc,	%l4,	%i1
	fmovdleu	%xcc,	%f28,	%f22
	addcc	%i7,	0x0BC4,	%g2
	add	%o3,	%l1,	%i2
	nop
	set	0x2D, %l3
	stb	%o5,	[%l7 + %l3]
	sub	%g5,	0x1C0D,	%o2
	fmovspos	%icc,	%f26,	%f19
	movg	%xcc,	%l6,	%l3
	lduw	[%l7 + 0x38],	%o1
	movge	%icc,	%l2,	%i4
	udivx	%g1,	0x1A47,	%i5
	addc	%g4,	0x1D97,	%g6
	movn	%icc,	%o4,	%l5
	addccc	%l0,	%i0,	%o7
	edge32n	%i6,	%o0,	%g7
	andcc	%i3,	0x0A08,	%o6
	xorcc	%l4,	%i1,	%i7
	fcmpgt16	%f18,	%f22,	%g2
	fxnor	%f20,	%f22,	%f2
	fone	%f28
	edge16	%o3,	%l1,	%g3
	alignaddrl	%i2,	%o5,	%g5
	orncc	%o2,	0x0373,	%l6
	sethi	0x0DE4,	%o1
	mulx	%l3,	0x14CC,	%i4
	edge16ln	%l2,	%i5,	%g4
	andn	%g6,	%g1,	%o4
	andn	%l5,	0x1D2B,	%l0
	lduw	[%l7 + 0x48],	%i0
	andcc	%i6,	%o7,	%g7
	fmovsle	%icc,	%f15,	%f31
	edge32ln	%i3,	%o0,	%l4
	fmovrdgez	%i1,	%f14,	%f22
	mulscc	%o6,	0x083B,	%g2
	edge8n	%i7,	%l1,	%o3
	edge8ln	%i2,	%g3,	%o5
	and	%g5,	0x10BD,	%o2
	umul	%o1,	0x11CF,	%l3
	ldsb	[%l7 + 0x37],	%i4
	sdivx	%l6,	0x1118,	%i5
	edge16ln	%g4,	%g6,	%l2
	movne	%xcc,	%g1,	%l5
	andcc	%l0,	%i0,	%i6
	fmovsle	%xcc,	%f30,	%f18
	movgu	%icc,	%o7,	%o4
	fmul8ulx16	%f0,	%f14,	%f12
	fmovrdgz	%g7,	%f8,	%f12
	fcmple16	%f6,	%f8,	%i3
	orn	%o0,	0x0BED,	%l4
	fmovrslez	%o6,	%f2,	%f5
	umul	%g2,	0x0EBA,	%i7
	addc	%i1,	0x08F8,	%o3
	sdivcc	%i2,	0x0127,	%g3
	movcc	%icc,	%l1,	%o5
	stw	%g5,	[%l7 + 0x60]
	ldx	[%l7 + 0x70],	%o2
	movg	%xcc,	%l3,	%o1
	orcc	%i4,	%i5,	%l6
	fornot1	%f26,	%f14,	%f0
	lduw	[%l7 + 0x3C],	%g4
	ldd	[%l7 + 0x18],	%l2
	add	%g1,	%g6,	%l0
	edge16	%l5,	%i0,	%o7
	fmul8x16al	%f0,	%f29,	%f30
	array8	%o4,	%g7,	%i6
	fzero	%f8
	movrgz	%i3,	%o0,	%l4
	stx	%o6,	[%l7 + 0x38]
	movl	%xcc,	%g2,	%i1
	movn	%xcc,	%i7,	%i2
	fandnot2	%f28,	%f0,	%f4
	edge8	%g3,	%o3,	%o5
	fmovrdlez	%l1,	%f4,	%f2
	movn	%xcc,	%o2,	%g5
	movne	%icc,	%l3,	%o1
	array32	%i4,	%i5,	%l6
	movvs	%icc,	%g4,	%l2
	fmovsn	%xcc,	%f9,	%f6
	array32	%g1,	%g6,	%l0
	movrlez	%i0,	0x3E4,	%l5
	edge8l	%o7,	%g7,	%i6
	movg	%icc,	%i3,	%o0
	stw	%o4,	[%l7 + 0x38]
	fmovdne	%xcc,	%f22,	%f20
	orcc	%o6,	%l4,	%g2
	fmovsle	%icc,	%f8,	%f16
	mulscc	%i7,	0x065E,	%i1
	andncc	%i2,	%g3,	%o5
	lduh	[%l7 + 0x42],	%o3
	movrne	%o2,	%l1,	%l3
	fnot2	%f14,	%f4
	movn	%xcc,	%g5,	%o1
	sra	%i4,	%l6,	%i5
	movn	%xcc,	%l2,	%g4
	fcmple16	%f0,	%f22,	%g1
	movrgz	%l0,	%i0,	%l5
	mulscc	%o7,	0x03EC,	%g7
	sdivcc	%g6,	0x0D85,	%i3
	fmovsleu	%icc,	%f27,	%f25
	mulx	%i6,	%o0,	%o4
	fabsd	%f26,	%f4
	and	%o6,	%l4,	%i7
	ldsw	[%l7 + 0x1C],	%i1
	lduh	[%l7 + 0x5A],	%g2
	fmovda	%xcc,	%f20,	%f19
	mova	%icc,	%i2,	%g3
	stw	%o5,	[%l7 + 0x1C]
	fmuld8ulx16	%f3,	%f4,	%f2
	edge8l	%o3,	%l1,	%o2
	st	%f13,	[%l7 + 0x64]
	fcmpeq16	%f8,	%f28,	%g5
	orncc	%l3,	%i4,	%o1
	sub	%l6,	0x1832,	%l2
	edge16n	%i5,	%g1,	%l0
	std	%f14,	[%l7 + 0x48]
	sdivx	%i0,	0x0BA9,	%l5
	bshuffle	%f6,	%f6,	%f26
	xorcc	%g4,	%g7,	%o7
	lduh	[%l7 + 0x3A],	%g6
	fcmped	%fcc2,	%f4,	%f12
	popc	%i3,	%o0
	and	%o4,	%o6,	%i6
	fornot2	%f24,	%f10,	%f28
	ldsh	[%l7 + 0x7E],	%i7
	movl	%xcc,	%l4,	%g2
	movcs	%icc,	%i2,	%i1
	edge16n	%o5,	%g3,	%l1
	fsrc1	%f16,	%f28
	orncc	%o3,	%o2,	%l3
	fnors	%f1,	%f27,	%f31
	and	%g5,	0x1E3A,	%i4
	udivcc	%o1,	0x0356,	%l6
	popc	0x0AB8,	%l2
	move	%xcc,	%i5,	%g1
	mulx	%i0,	0x07B4,	%l5
	fnot1s	%f31,	%f17
	movn	%icc,	%g4,	%l0
	edge16l	%g7,	%o7,	%g6
	st	%f1,	[%l7 + 0x44]
	movrne	%o0,	0x180,	%i3
	fmovdge	%xcc,	%f28,	%f29
	fmovrdgez	%o6,	%f10,	%f10
	fmovd	%f24,	%f6
	stb	%i6,	[%l7 + 0x21]
	movne	%icc,	%i7,	%o4
	and	%g2,	0x0470,	%i2
	movge	%xcc,	%l4,	%o5
	movn	%icc,	%g3,	%i1
	movrlez	%l1,	%o3,	%o2
	edge32ln	%l3,	%g5,	%o1
	srax	%i4,	0x0E,	%l2
	st	%f1,	[%l7 + 0x3C]
	movl	%icc,	%i5,	%g1
	umulcc	%l6,	0x0D78,	%l5
	ldsb	[%l7 + 0x40],	%g4
	edge8ln	%l0,	%i0,	%g7
	ldub	[%l7 + 0x4A],	%o7
	sth	%o0,	[%l7 + 0x1E]
	fmovscs	%xcc,	%f30,	%f29
	andn	%i3,	0x00F0,	%g6
	movvc	%xcc,	%i6,	%o6
	movvs	%icc,	%o4,	%i7
	edge8ln	%i2,	%g2,	%o5
	alignaddrl	%l4,	%i1,	%l1
	fabss	%f25,	%f8
	fxors	%f29,	%f7,	%f17
	fmovdne	%xcc,	%f0,	%f27
	edge32n	%g3,	%o3,	%o2
	sdiv	%g5,	0x126B,	%l3
	mulscc	%i4,	0x0B77,	%o1
	movvc	%icc,	%l2,	%i5
	movrgez	%g1,	%l5,	%g4
	fmovdvs	%xcc,	%f3,	%f22
	edge32ln	%l6,	%l0,	%g7
	edge32n	%i0,	%o0,	%i3
	ld	[%l7 + 0x34],	%f5
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	add	%o4,	0x0A53,	%o6
	movvc	%xcc,	%i2,	%i7
	edge8n	%o5,	%l4,	%i1
	umul	%l1,	0x15B1,	%g3
	stb	%g2,	[%l7 + 0x33]
	stb	%o3,	[%l7 + 0x43]
	fzeros	%f23
	alignaddrl	%o2,	%l3,	%i4
	xnorcc	%g5,	%l2,	%i5
	udiv	%o1,	0x1141,	%l5
	sra	%g1,	%g4,	%l6
	edge16ln	%l0,	%i0,	%g7
	edge16n	%o0,	%i3,	%i6
	movleu	%xcc,	%g6,	%o4
	udiv	%o7,	0x1E2E,	%o6
	fabsd	%f0,	%f8
	movrlz	%i7,	0x0AB,	%i2
	sdivcc	%l4,	0x08B2,	%i1
	lduw	[%l7 + 0x14],	%l1
	fnand	%f4,	%f24,	%f28
	movl	%xcc,	%o5,	%g2
	fmovdge	%xcc,	%f23,	%f31
	edge32l	%o3,	%o2,	%l3
	subcc	%i4,	%g3,	%g5
	addcc	%l2,	%o1,	%l5
	stb	%i5,	[%l7 + 0x74]
	andncc	%g4,	%g1,	%l0
	ldx	[%l7 + 0x18],	%i0
	fcmpes	%fcc0,	%f31,	%f7
	nop
	set	0x5D, %l0
	stb	%g7,	[%l7 + %l0]
	srlx	%l6,	%o0,	%i3
	orn	%g6,	0x1F5F,	%i6
	movne	%xcc,	%o7,	%o4
	srl	%i7,	0x06,	%o6
	xorcc	%i2,	%l4,	%i1
	fpadd16	%f10,	%f24,	%f26
	edge32l	%o5,	%l1,	%g2
	edge8	%o2,	%o3,	%l3
	fpsub16s	%f14,	%f10,	%f7
	movg	%xcc,	%i4,	%g5
	xnor	%g3,	0x0A8A,	%o1
	edge16ln	%l5,	%l2,	%g4
	alignaddr	%g1,	%l0,	%i0
	stx	%i5,	[%l7 + 0x38]
	movleu	%icc,	%g7,	%l6
	fmovscs	%icc,	%f16,	%f12
	edge16ln	%o0,	%i3,	%g6
	move	%icc,	%o7,	%o4
	movcc	%icc,	%i6,	%i7
	mulscc	%o6,	0x06C2,	%l4
	movpos	%icc,	%i2,	%i1
	alignaddrl	%o5,	%g2,	%o2
	std	%f16,	[%l7 + 0x50]
	edge8	%o3,	%l1,	%l3
	umulcc	%g5,	%g3,	%i4
	fmovsvs	%xcc,	%f9,	%f23
	movg	%icc,	%l5,	%o1
	orcc	%l2,	0x17DD,	%g1
	movl	%icc,	%g4,	%l0
	movneg	%icc,	%i5,	%i0
	st	%f26,	[%l7 + 0x1C]
	movcs	%xcc,	%l6,	%o0
	std	%f4,	[%l7 + 0x30]
	udiv	%g7,	0x05AC,	%i3
	sdivx	%o7,	0x16DF,	%g6
	fxnor	%f14,	%f0,	%f6
	udiv	%i6,	0x1144,	%i7
	xnorcc	%o4,	0x1B7E,	%l4
	movpos	%icc,	%o6,	%i2
	movrlez	%o5,	0x2FD,	%i1
	std	%f2,	[%l7 + 0x28]
	edge8l	%g2,	%o2,	%o3
	move	%xcc,	%l1,	%l3
	edge32n	%g5,	%g3,	%i4
	subccc	%l5,	%l2,	%o1
	stx	%g1,	[%l7 + 0x50]
	edge32	%l0,	%g4,	%i5
	mulx	%l6,	0x067A,	%i0
	fmovrsne	%g7,	%f5,	%f25
	srl	%i3,	%o0,	%o7
	orn	%i6,	0x0B91,	%g6
	edge16n	%i7,	%o4,	%o6
	fpsub16	%f8,	%f18,	%f8
	alignaddrl	%l4,	%o5,	%i2
	edge16	%i1,	%g2,	%o3
	popc	0x18DD,	%l1
	ldx	[%l7 + 0x38],	%o2
	edge8n	%g5,	%g3,	%i4
	orncc	%l3,	0x18B6,	%l2
	fpsub16	%f16,	%f12,	%f14
	fpadd16s	%f19,	%f19,	%f10
	orncc	%l5,	0x0C45,	%o1
	ldd	[%l7 + 0x48],	%f4
	fandnot1s	%f31,	%f4,	%f13
	movn	%xcc,	%l0,	%g4
	edge8l	%i5,	%l6,	%g1
	fxor	%f10,	%f24,	%f28
	popc	0x1DB9,	%g7
	stb	%i3,	[%l7 + 0x14]
	udivcc	%i0,	0x1769,	%o0
	xnorcc	%o7,	0x1111,	%g6
	umul	%i6,	0x08B9,	%o4
	movcs	%icc,	%i7,	%l4
	ldx	[%l7 + 0x38],	%o5
	umulcc	%i2,	%i1,	%g2
	edge16l	%o3,	%l1,	%o6
	ldub	[%l7 + 0x76],	%g5
	subc	%o2,	%g3,	%l3
	movneg	%xcc,	%l2,	%l5
	fpack16	%f4,	%f8
	fone	%f2
	movvs	%xcc,	%o1,	%i4
	edge8	%g4,	%l0,	%i5
	sub	%g1,	%g7,	%i3
	fnand	%f6,	%f20,	%f24
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%i0
	fpadd32s	%f13,	%f2,	%f30
	fpack32	%f10,	%f8,	%f20
	fnor	%f14,	%f14,	%f26
	array16	%l6,	%o7,	%g6
	subcc	%o0,	%i6,	%o4
	orncc	%i7,	0x0FD9,	%o5
	lduw	[%l7 + 0x18],	%l4
	and	%i2,	0x1DEB,	%g2
	movrgez	%i1,	%o3,	%o6
	addccc	%l1,	0x0813,	%o2
	fcmps	%fcc1,	%f15,	%f18
	std	%f10,	[%l7 + 0x50]
	sdivx	%g5,	0x1DDA,	%g3
	movl	%icc,	%l2,	%l3
	st	%f7,	[%l7 + 0x0C]
	fones	%f19
	movgu	%xcc,	%o1,	%i4
	xor	%g4,	%l0,	%i5
	movre	%l5,	%g7,	%i3
	fandnot2s	%f5,	%f18,	%f13
	addc	%g1,	%l6,	%o7
	srax	%i0,	0x18,	%o0
	edge16ln	%g6,	%i6,	%i7
	ldsw	[%l7 + 0x7C],	%o4
	move	%xcc,	%l4,	%i2
	movrlez	%g2,	%i1,	%o5
	umul	%o6,	%l1,	%o3
	smulcc	%g5,	%o2,	%l2
	sir	0x0B15
	fones	%f28
	ldd	[%l7 + 0x68],	%f12
	add	%g3,	%o1,	%l3
	edge32n	%g4,	%l0,	%i5
	smulcc	%i4,	0x17DB,	%l5
	edge8ln	%i3,	%g1,	%l6
	fmovdvs	%icc,	%f6,	%f30
	andncc	%o7,	%g7,	%i0
	subccc	%g6,	%o0,	%i6
	fcmpgt16	%f26,	%f12,	%o4
	umulcc	%l4,	%i2,	%g2
	nop
	set	0x18, %l2
	sth	%i7,	[%l7 + %l2]
	ldsb	[%l7 + 0x5D],	%o5
	mulx	%i1,	%o6,	%o3
	edge8	%g5,	%o2,	%l2
	movre	%l1,	%g3,	%o1
	sub	%l3,	0x096A,	%l0
	srax	%i5,	%g4,	%l5
	sra	%i4,	%i3,	%g1
	edge8	%l6,	%g7,	%i0
	sdivcc	%g6,	0x0087,	%o7
	ld	[%l7 + 0x34],	%f31
	movrne	%i6,	%o0,	%l4
	movrne	%i2,	0x0AE,	%g2
	fmuld8sux16	%f2,	%f8,	%f18
	xorcc	%i7,	0x1A5A,	%o5
	ldd	[%l7 + 0x20],	%f16
	edge16ln	%o4,	%o6,	%o3
	fpadd32s	%f11,	%f2,	%f7
	fnands	%f13,	%f22,	%f26
	srax	%i1,	%g5,	%o2
	addcc	%l2,	0x0CBD,	%g3
	fmovrdgez	%o1,	%f14,	%f14
	movpos	%icc,	%l3,	%l1
	sllx	%i5,	0x00,	%l0
	udivx	%g4,	0x0484,	%i4
	movleu	%icc,	%l5,	%i3
	movge	%xcc,	%g1,	%g7
	fnot2	%f18,	%f6
	alignaddr	%l6,	%i0,	%g6
	srl	%o7,	0x0B,	%o0
	fpsub16	%f24,	%f20,	%f6
	sethi	0x0D8D,	%i6
	or	%l4,	0x0A60,	%g2
	movne	%icc,	%i2,	%o5
	edge16	%o4,	%i7,	%o3
	ldx	[%l7 + 0x30],	%i1
	sdivcc	%o6,	0x1DD1,	%o2
	faligndata	%f10,	%f12,	%f14
	array32	%l2,	%g5,	%o1
	ld	[%l7 + 0x24],	%f7
	ldub	[%l7 + 0x1C],	%g3
	xnor	%l3,	%i5,	%l1
	movrne	%g4,	%i4,	%l0
	fcmpeq32	%f18,	%f28,	%i3
	ldd	[%l7 + 0x38],	%l4
	fmovdg	%icc,	%f29,	%f6
	andcc	%g7,	0x06B0,	%g1
	restore %l6, 0x1892, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i0,	%o7,	%o0
	movg	%xcc,	%l4,	%i6
	edge32n	%i2,	%g2,	%o4
	edge32l	%o5,	%o3,	%i1
	fnor	%f20,	%f22,	%f16
	fnegs	%f16,	%f16
	movcs	%xcc,	%o6,	%i7
	or	%l2,	%g5,	%o2
	fmovsge	%xcc,	%f13,	%f29
	fmovspos	%icc,	%f23,	%f31
	srl	%g3,	%o1,	%i5
	movvs	%xcc,	%l1,	%g4
	movgu	%xcc,	%l3,	%l0
	ldub	[%l7 + 0x68],	%i3
	fmul8sux16	%f18,	%f22,	%f18
	ldx	[%l7 + 0x20],	%i4
	mulscc	%l5,	%g1,	%l6
	edge32n	%g6,	%g7,	%o7
	lduw	[%l7 + 0x54],	%i0
	movgu	%icc,	%o0,	%l4
	fmovsgu	%icc,	%f28,	%f31
	movne	%icc,	%i2,	%g2
	edge32ln	%o4,	%i6,	%o5
	fmovda	%icc,	%f13,	%f0
	add	%i1,	0x1D4F,	%o3
	fmovsle	%icc,	%f21,	%f21
	fsrc1	%f2,	%f16
	movrlez	%o6,	0x358,	%i7
	mulscc	%l2,	0x0967,	%o2
	alignaddr	%g3,	%o1,	%g5
	and	%l1,	0x112A,	%g4
	subc	%l3,	0x0228,	%i5
	mulx	%l0,	0x06FA,	%i4
	st	%f14,	[%l7 + 0x24]
	edge32ln	%l5,	%g1,	%l6
	movrlz	%g6,	%i3,	%g7
	movre	%o7,	%i0,	%o0
	edge16	%i2,	%l4,	%g2
	movrlez	%o4,	0x15B,	%o5
	save %i1, 0x03B9, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f16,	%f12,	%i6
	ldsb	[%l7 + 0x40],	%i7
	fmovsle	%xcc,	%f12,	%f26
	mova	%icc,	%l2,	%o6
	addcc	%o2,	0x1097,	%g3
	xorcc	%g5,	0x0835,	%l1
	subccc	%g4,	0x1883,	%o1
	edge32n	%i5,	%l0,	%l3
	sllx	%i4,	%l5,	%g1
	alignaddr	%g6,	%i3,	%g7
	fpack32	%f18,	%f26,	%f12
	srlx	%o7,	0x0A,	%i0
	ld	[%l7 + 0x38],	%f18
	xorcc	%o0,	0x11B4,	%l6
	movcs	%xcc,	%i2,	%l4
	smul	%g2,	0x18A0,	%o5
	movpos	%xcc,	%i1,	%o4
	edge16ln	%i6,	%i7,	%o3
	fpadd32s	%f19,	%f6,	%f8
	sth	%o6,	[%l7 + 0x42]
	movrgez	%o2,	0x33A,	%g3
	edge8	%l2,	%g5,	%l1
	subc	%g4,	0x04D9,	%o1
	fpsub16s	%f11,	%f18,	%f27
	fmovdl	%icc,	%f2,	%f14
	andcc	%i5,	%l0,	%l3
	for	%f4,	%f30,	%f6
	and	%l5,	0x110B,	%g1
	sethi	0x19EB,	%i4
	fsrc2s	%f25,	%f5
	edge8n	%i3,	%g6,	%g7
	edge8n	%o7,	%i0,	%o0
	sllx	%l6,	%l4,	%i2
	movneg	%icc,	%o5,	%i1
	movge	%icc,	%o4,	%g2
	fcmpeq16	%f18,	%f24,	%i6
	edge32n	%i7,	%o6,	%o3
	udivcc	%g3,	0x00B3,	%o2
	addcc	%g5,	0x186F,	%l2
	stb	%l1,	[%l7 + 0x29]
	sir	0x1B56
	movn	%icc,	%o1,	%i5
	move	%icc,	%l0,	%g4
	fnegs	%f20,	%f8
	std	%f24,	[%l7 + 0x48]
	edge16n	%l5,	%g1,	%l3
	smul	%i3,	%i4,	%g6
	fpadd32s	%f14,	%f16,	%f4
	fones	%f20
	sir	0x1D25
	fmovsgu	%xcc,	%f6,	%f18
	lduh	[%l7 + 0x6C],	%o7
	edge8	%i0,	%o0,	%l6
	fmovrdlez	%l4,	%f28,	%f14
	array8	%g7,	%i2,	%o5
	edge32	%o4,	%g2,	%i1
	addccc	%i7,	%i6,	%o3
	movcs	%xcc,	%g3,	%o6
	subccc	%o2,	0x04F4,	%g5
	movn	%icc,	%l1,	%l2
	movne	%icc,	%i5,	%o1
	sth	%g4,	[%l7 + 0x46]
	array8	%l5,	%g1,	%l3
	sdivcc	%i3,	0x0325,	%l0
	srax	%i4,	0x12,	%o7
	lduw	[%l7 + 0x08],	%i0
	fmovda	%xcc,	%f30,	%f19
	lduw	[%l7 + 0x20],	%o0
	addcc	%l6,	0x0BE6,	%l4
	sth	%g7,	[%l7 + 0x16]
	faligndata	%f2,	%f4,	%f24
	movrlez	%i2,	0x1C5,	%o5
	ldd	[%l7 + 0x68],	%f26
	ldx	[%l7 + 0x08],	%o4
	ldd	[%l7 + 0x10],	%g6
	xnorcc	%i1,	%g2,	%i7
	std	%f24,	[%l7 + 0x58]
	siam	0x4
	or	%i6,	0x0E89,	%g3
	movle	%xcc,	%o3,	%o2
	movle	%icc,	%o6,	%g5
	subccc	%l2,	0x0078,	%l1
	udivx	%i5,	0x14B3,	%g4
	fmovsgu	%icc,	%f12,	%f2
	edge8ln	%o1,	%g1,	%l5
	edge16	%i3,	%l0,	%l3
	movneg	%icc,	%i4,	%o7
	lduh	[%l7 + 0x1C],	%o0
	st	%f9,	[%l7 + 0x50]
	sub	%i0,	0x06A2,	%l6
	st	%f27,	[%l7 + 0x28]
	sdivx	%l4,	0x00DA,	%g7
	fxnor	%f20,	%f20,	%f10
	ldsh	[%l7 + 0x7C],	%o5
	edge8ln	%o4,	%i2,	%i1
	xorcc	%g6,	0x168A,	%i7
	smul	%g2,	0x172F,	%i6
	edge32ln	%o3,	%o2,	%g3
	orncc	%g5,	%o6,	%l2
	edge32	%i5,	%l1,	%g4
	add	%o1,	%g1,	%l5
	nop
	set	0x7D, %i3
	ldub	[%l7 + %i3],	%l0
	subcc	%i3,	0x1EA0,	%i4
	array8	%o7,	%l3,	%i0
	fands	%f11,	%f21,	%f26
	add	%l6,	%l4,	%g7
	nop
	set	0x28, %i0
	lduh	[%l7 + %i0],	%o5
	std	%f16,	[%l7 + 0x18]
	fmovsvc	%xcc,	%f26,	%f13
	mulscc	%o0,	%i2,	%i1
	orn	%g6,	0x07CC,	%o4
	umul	%g2,	%i7,	%o3
	sethi	0x1349,	%o2
	movrlz	%g3,	0x089,	%g5
	ldd	[%l7 + 0x40],	%f30
	fcmple16	%f14,	%f26,	%i6
	fmovdneg	%icc,	%f19,	%f13
	fpadd16s	%f27,	%f8,	%f31
	andncc	%l2,	%o6,	%i5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3553
!	Type f   	: 5450
!	Type i   	: 15997
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x4288961C
.word 0xF8815424
.word 0x381F21C4
.word 0x84200293
.word 0x8836ACCD
.word 0x2EBA71BD
.word 0x5FEE98EB
.word 0xC88C258D
.word 0x2B47A28F
.word 0x162997E7
.word 0xFD002D4A
.word 0xF0D7B125
.word 0x9A775F74
.word 0x54E61436
.word 0xE8B7319C
.word 0x87D4A831
.word 0xC1516823
.word 0x15E2A68F
.word 0xB3CFB7CC
.word 0xB331F458
.word 0x91CA3E1E
.word 0xC95BD6E2
.word 0x6BDBA82B
.word 0x90FB5607
.word 0xEEAB656F
.word 0xC9206DBD
.word 0x919F9525
.word 0x144DEE75
.word 0x3530ADC8
.word 0x82466EAE
.word 0x53C4EE97
.word 0xD618CB3C
.word 0x5A83658C
.word 0xC9BECC4A
.word 0xEAC43A61
.word 0x5E89ADB7
.word 0xC4DEA143
.word 0x71DFE647
.word 0xAA4B4CC5
.word 0x624FE2FD
.word 0x1399C3E0
.word 0x2DC21414
.word 0x92C61EDB
.word 0x9747E62C
.word 0x000D0DE0
.word 0x54085CCC
.word 0x4D6B28D4
.word 0xEFE07632
.word 0x7686D773
.word 0x559DD1EA
.word 0x0CFC3DB8
.word 0xDE4239EE
.word 0x45B809FB
.word 0x5EA79132
.word 0xB27951F7
.word 0x6257AD14
.word 0x1739CB03
.word 0xE04A7381
.word 0x4BC6B3D6
.word 0x120446E1
.word 0x50879228
.word 0xE91F16E1
.word 0xE922BFA1
.word 0x84393613
.end
