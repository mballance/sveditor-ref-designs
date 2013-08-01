/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f8.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f8.s,v 1.1 2007/05/11 17:22:39 drp Exp $"
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
	setx	0x9CD187D2B065B70F,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xB,	%g1
	set	0xB,	%g2
	set	0x0,	%g3
	set	0x9,	%g4
	set	0xF,	%g5
	set	0x7,	%g6
	set	0xF,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x5,	%i1
	set	-0xA,	%i2
	set	-0xE,	%i3
	set	-0xD,	%i4
	set	-0xC,	%i5
	set	-0x7,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x48411F34,	%l0
	set	0x6A1A6056,	%l1
	set	0x0056EE08,	%l2
	set	0x6C3D9626,	%l3
	set	0x32C1DE95,	%l4
	set	0x08C8BBC5,	%l5
	set	0x2D03AB2B,	%l6
	!# Output registers
	set	-0x10C5,	%o0
	set	-0x1F0A,	%o1
	set	-0x01E6,	%o2
	set	-0x126C,	%o3
	set	0x0464,	%o4
	set	0x110F,	%o5
	set	-0x1219,	%o6
	set	0x0723,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x4A163644BA2EB0D5)
	INIT_TH_FP_REG(%l7,%f2,0x9DDD91DF0072BFD3)
	INIT_TH_FP_REG(%l7,%f4,0x884399EF767A1447)
	INIT_TH_FP_REG(%l7,%f6,0xDF75B2FD486CF5AD)
	INIT_TH_FP_REG(%l7,%f8,0xBE34A70F351084C3)
	INIT_TH_FP_REG(%l7,%f10,0x29586CDAE7FD1B34)
	INIT_TH_FP_REG(%l7,%f12,0x07498DE8B65C56F2)
	INIT_TH_FP_REG(%l7,%f14,0x808F84041DF83366)
	INIT_TH_FP_REG(%l7,%f16,0x26802E8C21A23AC6)
	INIT_TH_FP_REG(%l7,%f18,0xB5D2B6652B8CF1A3)
	INIT_TH_FP_REG(%l7,%f20,0x6E9CDCC3454734EA)
	INIT_TH_FP_REG(%l7,%f22,0x4BAA6725CD536452)
	INIT_TH_FP_REG(%l7,%f24,0xEF48A252DFA78212)
	INIT_TH_FP_REG(%l7,%f26,0xBB13B71C571E0C86)
	INIT_TH_FP_REG(%l7,%f28,0x0C1826003DE44ADB)
	INIT_TH_FP_REG(%l7,%f30,0xB7CA993A6C2BAB66)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x0BF, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	fmovrslez	%i1,	%f0,	%f21
	fone	%f0
	bshuffle	%f6,	%f26,	%f18
	fabss	%f16,	%f22
	andncc	%l6,	%i6,	%g5
	mova	%icc,	%o3,	%i5
	sra	%g3,	0x0A,	%i0
	fmovdn	%xcc,	%f30,	%f14
	ldsh	[%l7 + 0x6C],	%o4
	movl	%xcc,	%i3,	%g1
	fornot2	%f28,	%f2,	%f20
	andn	%o6,	0x15A0,	%o2
	ldd	[%l7 + 0x28],	%l0
	umul	%o5,	%l1,	%o7
	save %g4, %i4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g2,	%l3,	%l5
	siam	0x5
	ld	[%l7 + 0x0C],	%f2
	fmuld8sux16	%f18,	%f28,	%f12
	xnor	%o0,	%l2,	%i2
	fpadd32s	%f26,	%f2,	%f26
	xnor	%o1,	%g7,	%i7
	fmovdgu	%xcc,	%f16,	%f21
	fpsub16	%f16,	%f28,	%f14
	lduw	[%l7 + 0x0C],	%i1
	movvs	%icc,	%g6,	%i6
	edge32ln	%g5,	%l6,	%i5
	edge16	%o3,	%g3,	%i0
	fmovsg	%xcc,	%f3,	%f8
	move	%xcc,	%i3,	%g1
	umul	%o6,	%o2,	%o4
	srax	%o5,	0x16,	%l0
	xnorcc	%o7,	0x126A,	%g4
	movrlz	%i4,	%l4,	%l1
	movrne	%g2,	%l3,	%l5
	movle	%xcc,	%o0,	%l2
	movn	%xcc,	%o1,	%i2
	or	%i7,	0x11CD,	%i1
	movleu	%xcc,	%g6,	%i6
	sdivx	%g7,	0x0BC1,	%g5
	fcmple16	%f20,	%f16,	%i5
	lduh	[%l7 + 0x18],	%o3
	sth	%l6,	[%l7 + 0x4A]
	array16	%g3,	%i0,	%i3
	save %g1, %o6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o2,	%o5,	%l0
	addccc	%o7,	0x1F3B,	%g4
	movrlz	%i4,	%l4,	%g2
	ldsw	[%l7 + 0x34],	%l1
	fandnot2	%f10,	%f14,	%f20
	edge8n	%l5,	%o0,	%l3
	srlx	%o1,	%l2,	%i7
	edge8n	%i2,	%g6,	%i6
	nop
	set	0x48, %o2
	ldd	[%l7 + %o2],	%f14
	ldsw	[%l7 + 0x6C],	%i1
	sllx	%g7,	0x0C,	%i5
	andn	%g5,	0x0F15,	%l6
	for	%f2,	%f22,	%f4
	sdivx	%o3,	0x0909,	%g3
	fandnot1s	%f10,	%f28,	%f0
	stb	%i3,	[%l7 + 0x70]
	fnot1	%f30,	%f20
	movrlez	%g1,	0x095,	%o6
	orn	%i0,	0x170D,	%o2
	movre	%o4,	0x266,	%l0
	edge16ln	%o5,	%g4,	%i4
	udivcc	%l4,	0x19C9,	%g2
	fmuld8sux16	%f3,	%f18,	%f26
	addccc	%l1,	0x15DA,	%l5
	edge8	%o0,	%o7,	%l3
	save %o1, 0x1657, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i2,	%i7,	%i6
	fcmps	%fcc2,	%f3,	%f2
	fzeros	%f15
	mova	%icc,	%g6,	%i1
	fabss	%f31,	%f9
	umul	%i5,	0x0B51,	%g5
	movgu	%xcc,	%l6,	%g7
	ldd	[%l7 + 0x30],	%o2
	st	%f4,	[%l7 + 0x38]
	std	%f16,	[%l7 + 0x30]
	sdivcc	%i3,	0x0A36,	%g1
	movle	%icc,	%o6,	%i0
	fpsub32	%f6,	%f16,	%f18
	fmovdgu	%icc,	%f6,	%f6
	fmovde	%icc,	%f0,	%f12
	smulcc	%g3,	%o4,	%l0
	fmovsleu	%xcc,	%f12,	%f1
	xnorcc	%o2,	0x0BE1,	%o5
	addccc	%g4,	0x0196,	%l4
	srax	%i4,	%l1,	%l5
	srl	%g2,	%o0,	%o7
	array16	%l3,	%l2,	%o1
	edge32l	%i7,	%i6,	%i2
	mova	%icc,	%i1,	%i5
	fornot2	%f4,	%f26,	%f6
	movrlz	%g5,	%g6,	%l6
	edge16ln	%o3,	%i3,	%g1
	movvs	%icc,	%o6,	%i0
	ld	[%l7 + 0x18],	%f9
	sll	%g7,	%o4,	%l0
	lduh	[%l7 + 0x36],	%o2
	edge32	%o5,	%g3,	%l4
	fands	%f1,	%f23,	%f26
	movg	%xcc,	%g4,	%i4
	lduw	[%l7 + 0x70],	%l1
	movrgez	%l5,	%o0,	%o7
	fmovdvs	%icc,	%f30,	%f23
	srax	%g2,	%l3,	%l2
	edge16n	%i7,	%i6,	%o1
	stw	%i1,	[%l7 + 0x2C]
	sll	%i5,	%i2,	%g6
	sub	%l6,	0x1719,	%g5
	sra	%i3,	0x16,	%g1
	stx	%o6,	[%l7 + 0x58]
	fmovrsne	%i0,	%f23,	%f16
	or	%o3,	%g7,	%l0
	movrgz	%o4,	%o2,	%o5
	movg	%xcc,	%g3,	%l4
	sethi	0x0309,	%i4
	ld	[%l7 + 0x64],	%f18
	movle	%icc,	%g4,	%l5
	fmul8sux16	%f4,	%f16,	%f16
	array8	%o0,	%o7,	%l1
	movleu	%icc,	%l3,	%l2
	ldd	[%l7 + 0x78],	%f4
	edge32ln	%g2,	%i7,	%o1
	andn	%i1,	0x0F04,	%i6
	xor	%i5,	0x0A50,	%g6
	fmovrslez	%i2,	%f31,	%f29
	movcc	%icc,	%l6,	%i3
	ldsb	[%l7 + 0x1C],	%g5
	edge32	%o6,	%g1,	%i0
	nop
	set	0x70, %g5
	stw	%o3,	[%l7 + %g5]
	ldx	[%l7 + 0x70],	%g7
	alignaddrl	%o4,	%l0,	%o2
	subc	%g3,	0x11A8,	%o5
	sir	0x1B3C
	fxor	%f4,	%f2,	%f10
	edge16ln	%l4,	%i4,	%g4
	sdiv	%o0,	0x01A4,	%o7
	xorcc	%l5,	%l3,	%l1
	movg	%icc,	%g2,	%i7
	move	%xcc,	%o1,	%i1
	edge32n	%l2,	%i6,	%i5
	subcc	%g6,	%l6,	%i2
	ldub	[%l7 + 0x1E],	%g5
	fmovdne	%icc,	%f24,	%f30
	addc	%o6,	0x0D0E,	%i3
	sir	0x0BBF
	umul	%g1,	%i0,	%o3
	orcc	%g7,	0x18AF,	%o4
	save %l0, 0x1CFF, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o5,	%l4,	%g3
	popc	%i4,	%g4
	ldd	[%l7 + 0x48],	%f28
	subccc	%o0,	%l5,	%l3
	fmovspos	%icc,	%f26,	%f21
	sir	0x178B
	lduw	[%l7 + 0x20],	%o7
	nop
	set	0x70, %g3
	std	%f24,	[%l7 + %g3]
	ld	[%l7 + 0x58],	%f18
	lduw	[%l7 + 0x28],	%g2
	nop
	set	0x7E, %i3
	lduh	[%l7 + %i3],	%i7
	save %l1, %o1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i6, 0x1FD0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g6,	%l6,	%i5
	movn	%icc,	%g5,	%i2
	movg	%icc,	%o6,	%i3
	fnands	%f2,	%f23,	%f4
	orncc	%i0,	0x1ED3,	%g1
	fcmpes	%fcc1,	%f5,	%f7
	andncc	%o3,	%o4,	%g7
	movre	%o2,	%l0,	%l4
	subcc	%g3,	0x0FE0,	%i4
	edge32n	%g4,	%o5,	%o0
	sra	%l5,	%o7,	%g2
	movpos	%xcc,	%l3,	%l1
	movrlez	%o1,	0x315,	%l2
	edge16l	%i7,	%i1,	%i6
	ldx	[%l7 + 0x18],	%l6
	sdivcc	%i5,	0x06B6,	%g6
	udiv	%g5,	0x0972,	%i2
	fmul8sux16	%f8,	%f22,	%f10
	add	%i3,	0x0A1D,	%i0
	edge8ln	%g1,	%o6,	%o4
	array32	%o3,	%g7,	%l0
	std	%f28,	[%l7 + 0x60]
	save %l4, %o2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f11,	%f14,	%f5
	fmul8ulx16	%f10,	%f16,	%f0
	movle	%icc,	%g3,	%g4
	srax	%o5,	0x06,	%o0
	movcs	%icc,	%o7,	%l5
	fmovdvs	%icc,	%f29,	%f5
	sir	0x0E08
	ldx	[%l7 + 0x70],	%g2
	sub	%l3,	0x1B2B,	%o1
	edge16n	%l2,	%l1,	%i7
	mulx	%i1,	%i6,	%i5
	edge8n	%g6,	%g5,	%i2
	for	%f18,	%f12,	%f6
	add	%l6,	0x0C31,	%i3
	srax	%i0,	0x0E,	%o6
	movrgz	%o4,	%g1,	%o3
	sdiv	%l0,	0x02C3,	%l4
	fxor	%f4,	%f22,	%f10
	fmovspos	%icc,	%f14,	%f17
	xnorcc	%g7,	0x1727,	%o2
	movrlz	%i4,	%g3,	%g4
	mulx	%o5,	0x0876,	%o0
	fmovscc	%xcc,	%f3,	%f13
	ldd	[%l7 + 0x38],	%o6
	fand	%f22,	%f22,	%f16
	movrgz	%l5,	%g2,	%l3
	movgu	%xcc,	%o1,	%l2
	fmovdcs	%xcc,	%f8,	%f9
	edge8l	%l1,	%i7,	%i6
	xor	%i5,	%i1,	%g5
	orncc	%g6,	0x17C1,	%i2
	move	%icc,	%i3,	%l6
	ldsb	[%l7 + 0x65],	%i0
	move	%icc,	%o4,	%g1
	ldd	[%l7 + 0x18],	%f10
	sdiv	%o3,	0x141C,	%o6
	stb	%l0,	[%l7 + 0x26]
	edge16	%l4,	%g7,	%i4
	edge32	%g3,	%o2,	%g4
	fmovrsgz	%o5,	%f4,	%f11
	umulcc	%o7,	0x11CA,	%l5
	fcmpgt32	%f24,	%f18,	%g2
	udivx	%o0,	0x0164,	%l3
	fandnot1	%f10,	%f0,	%f16
	mova	%xcc,	%l2,	%o1
	sdivx	%i7,	0x0C91,	%l1
	movcs	%xcc,	%i6,	%i5
	ldsb	[%l7 + 0x4B],	%g5
	xnor	%g6,	0x0161,	%i2
	popc	%i3,	%i1
	movre	%i0,	0x371,	%l6
	andncc	%g1,	%o3,	%o4
	andncc	%l0,	%o6,	%l4
	ldd	[%l7 + 0x28],	%i4
	sll	%g3,	0x0F,	%g7
	fxnors	%f22,	%f17,	%f21
	sub	%o2,	%g4,	%o7
	nop
	set	0x6C, %g7
	lduh	[%l7 + %g7],	%l5
	fcmpeq32	%f20,	%f30,	%g2
	mova	%xcc,	%o0,	%o5
	addc	%l2,	0x00FF,	%o1
	mulx	%l3,	0x1EA5,	%l1
	edge16l	%i6,	%i5,	%i7
	andcc	%g5,	0x0CC1,	%g6
	array8	%i2,	%i3,	%i0
	udivcc	%l6,	0x1AE3,	%g1
	sllx	%i1,	%o4,	%o3
	array16	%o6,	%l4,	%l0
	movg	%xcc,	%g3,	%i4
	lduw	[%l7 + 0x08],	%g7
	srl	%g4,	0x1A,	%o2
	ldd	[%l7 + 0x68],	%f6
	addccc	%l5,	%g2,	%o0
	ldx	[%l7 + 0x20],	%o5
	fmovsn	%xcc,	%f5,	%f5
	ld	[%l7 + 0x24],	%f25
	sll	%o7,	0x01,	%l2
	sth	%l3,	[%l7 + 0x08]
	movrgez	%o1,	%i6,	%i5
	edge32	%l1,	%g5,	%g6
	or	%i7,	%i2,	%i0
	ldx	[%l7 + 0x70],	%l6
	edge8ln	%i3,	%g1,	%i1
	sll	%o4,	0x19,	%o3
	fmovsne	%xcc,	%f10,	%f28
	nop
	set	0x3C, %i6
	stw	%l4,	[%l7 + %i6]
	ldub	[%l7 + 0x6A],	%o6
	move	%icc,	%g3,	%i4
	sdivcc	%l0,	0x052C,	%g4
	fmovsg	%xcc,	%f14,	%f5
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	subcc	%o0,	0x1B59,	%o5
	edge16n	%o7,	%g2,	%l2
	sdiv	%o1,	0x134D,	%i6
	mulx	%l3,	0x0A90,	%l1
	fcmped	%fcc0,	%f30,	%f0
	movleu	%xcc,	%g5,	%i5
	fcmple32	%f8,	%f4,	%g6
	movrgez	%i7,	0x273,	%i2
	xorcc	%l6,	0x14D0,	%i3
	edge32n	%i0,	%i1,	%o4
	ldsh	[%l7 + 0x7C],	%g1
	movleu	%icc,	%l4,	%o3
	addcc	%o6,	%i4,	%l0
	andn	%g4,	0x1CE9,	%o2
	sra	%g7,	%l5,	%o0
	srl	%o5,	%o7,	%g3
	ldsw	[%l7 + 0x58],	%g2
	movrlz	%l2,	0x1B1,	%o1
	stw	%i6,	[%l7 + 0x40]
	alignaddrl	%l1,	%l3,	%g5
	orn	%g6,	0x1466,	%i7
	sll	%i2,	%l6,	%i5
	array16	%i3,	%i1,	%o4
	fcmpgt32	%f30,	%f12,	%g1
	edge32n	%i0,	%o3,	%o6
	movrgez	%i4,	%l0,	%g4
	ldsb	[%l7 + 0x77],	%l4
	movg	%icc,	%g7,	%l5
	fmovsneg	%xcc,	%f27,	%f30
	ldx	[%l7 + 0x30],	%o2
	mulscc	%o5,	0x0D6E,	%o0
	fmuld8ulx16	%f13,	%f17,	%f12
	lduw	[%l7 + 0x0C],	%g3
	movle	%icc,	%o7,	%l2
	fnot1	%f0,	%f12
	fmovrse	%g2,	%f29,	%f9
	fnegs	%f30,	%f9
	popc	%o1,	%i6
	sdivcc	%l3,	0x0C2A,	%l1
	fcmpne32	%f8,	%f12,	%g5
	pdist	%f8,	%f24,	%f28
	nop
	set	0x22, %g2
	ldub	[%l7 + %g2],	%g6
	xnor	%i7,	%l6,	%i5
	edge8n	%i2,	%i3,	%i1
	movvc	%xcc,	%g1,	%o4
	movrne	%o3,	%i0,	%i4
	stx	%o6,	[%l7 + 0x30]
	movpos	%icc,	%g4,	%l0
	movn	%icc,	%l4,	%g7
	ldub	[%l7 + 0x0D],	%l5
	movrgez	%o2,	%o0,	%g3
	movne	%xcc,	%o5,	%l2
	fcmpne16	%f28,	%f30,	%g2
	movle	%xcc,	%o1,	%i6
	stw	%o7,	[%l7 + 0x64]
	movvc	%xcc,	%l1,	%l3
	movrgez	%g6,	0x24C,	%i7
	movrne	%g5,	%l6,	%i2
	movg	%xcc,	%i3,	%i5
	sir	0x0C1C
	sra	%g1,	0x0E,	%o4
	subc	%o3,	%i0,	%i1
	nop
	set	0x60, %o3
	std	%f0,	[%l7 + %o3]
	fzero	%f26
	orn	%i4,	%g4,	%l0
	fmovrslz	%l4,	%f9,	%f6
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%g7
	fabss	%f9,	%f29
	movneg	%icc,	%o6,	%o2
	array8	%o0,	%g3,	%l5
	fmovsne	%xcc,	%f9,	%f29
	sllx	%l2,	0x13,	%g2
	fmovrsgz	%o5,	%f11,	%f23
	mulscc	%o1,	0x0C31,	%o7
	std	%f18,	[%l7 + 0x48]
	lduh	[%l7 + 0x1A],	%i6
	edge32n	%l3,	%l1,	%i7
	andn	%g5,	%g6,	%i2
	edge16ln	%i3,	%i5,	%l6
	fcmpeq32	%f0,	%f0,	%g1
	fpadd32s	%f16,	%f3,	%f26
	std	%f2,	[%l7 + 0x30]
	movn	%xcc,	%o3,	%i0
	subcc	%i1,	0x197B,	%o4
	fmovrslz	%g4,	%f11,	%f26
	fmovdgu	%xcc,	%f6,	%f5
	andcc	%i4,	%l4,	%l0
	movvc	%xcc,	%o6,	%o2
	edge8n	%g7,	%o0,	%g3
	faligndata	%f16,	%f16,	%f18
	movrlz	%l5,	0x340,	%l2
	fmovsge	%xcc,	%f4,	%f23
	mulscc	%g2,	%o5,	%o1
	fmul8x16	%f30,	%f8,	%f18
	or	%i6,	0x0C99,	%o7
	fmovscs	%xcc,	%f26,	%f6
	stb	%l1,	[%l7 + 0x12]
	mova	%xcc,	%i7,	%g5
	orncc	%l3,	0x1502,	%g6
	array16	%i3,	%i2,	%i5
	andcc	%l6,	0x1574,	%o3
	umulcc	%g1,	0x1427,	%i1
	subcc	%i0,	%g4,	%o4
	fmul8ulx16	%f16,	%f22,	%f28
	subc	%i4,	%l4,	%l0
	sir	0x19AE
	ldsb	[%l7 + 0x18],	%o2
	or	%g7,	%o0,	%o6
	edge32l	%l5,	%g3,	%l2
	fsrc2	%f20,	%f20
	stb	%o5,	[%l7 + 0x12]
	edge16n	%g2,	%i6,	%o7
	srl	%o1,	%l1,	%i7
	movcs	%xcc,	%l3,	%g6
	alignaddr	%i3,	%g5,	%i2
	xor	%l6,	0x09A1,	%o3
	srlx	%g1,	%i1,	%i5
	ld	[%l7 + 0x70],	%f8
	orncc	%i0,	0x0948,	%o4
	movcc	%xcc,	%i4,	%l4
	movn	%xcc,	%l0,	%g4
	movre	%o2,	0x030,	%g7
	mulscc	%o6,	0x10A4,	%o0
	move	%xcc,	%g3,	%l5
	ldx	[%l7 + 0x50],	%l2
	smulcc	%g2,	%i6,	%o5
	movcc	%icc,	%o1,	%o7
	fcmpeq16	%f30,	%f26,	%i7
	fpsub16	%f28,	%f18,	%f6
	sllx	%l1,	0x17,	%g6
	ld	[%l7 + 0x3C],	%f10
	ldub	[%l7 + 0x0E],	%i3
	nop
	set	0x6F, %o1
	stb	%g5,	[%l7 + %o1]
	sdivcc	%l3,	0x1DA2,	%l6
	udivcc	%i2,	0x1006,	%g1
	stw	%i1,	[%l7 + 0x18]
	sub	%i5,	%o3,	%i0
	nop
	set	0x60, %o6
	stx	%i4,	[%l7 + %o6]
	sdivcc	%o4,	0x06E3,	%l0
	ldsw	[%l7 + 0x10],	%l4
	movle	%icc,	%o2,	%g4
	movge	%icc,	%o6,	%g7
	sdivx	%g3,	0x0DAE,	%l5
	array8	%l2,	%o0,	%g2
	add	%o5,	%o1,	%o7
	addc	%i6,	%i7,	%l1
	movgu	%xcc,	%i3,	%g6
	fabsd	%f0,	%f20
	movrgez	%g5,	%l6,	%l3
	st	%f16,	[%l7 + 0x50]
	ldsb	[%l7 + 0x61],	%g1
	edge16n	%i1,	%i2,	%i5
	edge32ln	%o3,	%i0,	%i4
	andncc	%l0,	%o4,	%o2
	nop
	set	0x72, %i1
	sth	%g4,	[%l7 + %i1]
	fmovrdgz	%o6,	%f2,	%f26
	ld	[%l7 + 0x64],	%f1
	movrlez	%l4,	%g7,	%g3
	save %l2, 0x18E7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g2,	%o0,	%o5
	ldub	[%l7 + 0x42],	%o7
	restore %i6, %o1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f26,	%f6,	%f20
	sdiv	%i3,	0x15BC,	%g6
	srlx	%g5,	%i7,	%l6
	sub	%l3,	0x0E67,	%i1
	addcc	%i2,	0x0A43,	%g1
	alignaddrl	%i5,	%o3,	%i4
	movgu	%icc,	%l0,	%o4
	edge8ln	%i0,	%o2,	%o6
	sdivcc	%l4,	0x1F03,	%g7
	fcmple32	%f20,	%f10,	%g4
	ldsw	[%l7 + 0x1C],	%g3
	popc	%l2,	%l5
	move	%icc,	%g2,	%o5
	ldd	[%l7 + 0x30],	%f12
	edge32	%o0,	%i6,	%o1
	smulcc	%o7,	0x1F9F,	%i3
	fmovscs	%icc,	%f13,	%f17
	movleu	%xcc,	%g6,	%l1
	std	%f14,	[%l7 + 0x08]
	stx	%i7,	[%l7 + 0x08]
	fmovrde	%l6,	%f10,	%f26
	fmul8x16	%f5,	%f8,	%f12
	smul	%g5,	%i1,	%i2
	ldd	[%l7 + 0x30],	%f16
	udiv	%l3,	0x08F8,	%g1
	fmovsleu	%icc,	%f11,	%f9
	movvc	%xcc,	%o3,	%i5
	edge16ln	%i4,	%o4,	%l0
	fmovsge	%icc,	%f11,	%f24
	movrlz	%i0,	%o2,	%l4
	fcmpgt16	%f2,	%f22,	%g7
	fandnot1	%f18,	%f16,	%f2
	edge32	%g4,	%g3,	%o6
	fmovde	%xcc,	%f26,	%f3
	ldsh	[%l7 + 0x5C],	%l5
	fmovdle	%icc,	%f11,	%f1
	fmovrse	%g2,	%f17,	%f28
	umul	%l2,	0x16A8,	%o5
	movcc	%icc,	%i6,	%o0
	srlx	%o7,	0x0F,	%o1
	fmovsg	%icc,	%f28,	%f4
	sra	%i3,	0x0C,	%g6
	movleu	%icc,	%l1,	%l6
	fmovdvs	%icc,	%f31,	%f31
	popc	%g5,	%i1
	fmovsn	%xcc,	%f31,	%f20
	edge32l	%i7,	%i2,	%g1
	edge8n	%o3,	%i5,	%l3
	sdiv	%i4,	0x182C,	%l0
	fnegs	%f4,	%f6
	ldd	[%l7 + 0x20],	%o4
	fsrc1s	%f0,	%f0
	and	%o2,	%l4,	%i0
	fcmple16	%f18,	%f30,	%g4
	or	%g3,	0x1A7A,	%g7
	fmovrsne	%l5,	%f20,	%f20
	ldd	[%l7 + 0x28],	%f24
	andcc	%o6,	0x0CEF,	%g2
	fnegs	%f13,	%f11
	srl	%o5,	0x0B,	%i6
	fnot2s	%f0,	%f24
	srlx	%o0,	0x14,	%l2
	movpos	%xcc,	%o1,	%i3
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	sdivx	%l6,	0x1E41,	%g5
	fmovrde	%i7,	%f30,	%f10
	movvc	%icc,	%i2,	%i1
	edge16	%g1,	%o3,	%i5
	movcc	%xcc,	%i4,	%l0
	edge8ln	%l3,	%o2,	%o4
	sdivx	%i0,	0x0E8D,	%l4
	ldsh	[%l7 + 0x4E],	%g3
	movcc	%icc,	%g4,	%g7
	smulcc	%l5,	%o6,	%g2
	fcmpd	%fcc0,	%f16,	%f30
	array32	%o5,	%i6,	%l2
	fpackfix	%f8,	%f21
	ldsh	[%l7 + 0x74],	%o1
	edge16	%i3,	%o7,	%o0
	nop
	set	0x68, %i2
	ldd	[%l7 + %i2],	%f20
	orcc	%l1,	0x07FA,	%l6
	alignaddr	%g6,	%g5,	%i2
	lduw	[%l7 + 0x50],	%i7
	fmovse	%icc,	%f5,	%f25
	fcmple32	%f12,	%f20,	%g1
	edge8ln	%i1,	%o3,	%i4
	edge8	%l0,	%i5,	%l3
	fmovdneg	%xcc,	%f1,	%f21
	udiv	%o2,	0x1EC1,	%i0
	fmovdleu	%xcc,	%f1,	%f19
	lduw	[%l7 + 0x38],	%l4
	edge32n	%g3,	%o4,	%g7
	mova	%icc,	%l5,	%o6
	edge16ln	%g2,	%g4,	%o5
	xnor	%i6,	%l2,	%i3
	fcmple32	%f6,	%f10,	%o1
	mulscc	%o7,	0x1CD6,	%l1
	edge16n	%o0,	%l6,	%g5
	fcmple32	%f14,	%f26,	%i2
	movg	%icc,	%i7,	%g6
	fabss	%f28,	%f5
	smulcc	%i1,	0x187C,	%o3
	movne	%icc,	%i4,	%l0
	nop
	set	0x38, %i4
	stx	%i5,	[%l7 + %i4]
	sra	%l3,	0x0C,	%g1
	save %o2, %l4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g3,	%g7,	%l5
	fmovsle	%icc,	%f18,	%f26
	fnand	%f10,	%f18,	%f14
	movpos	%xcc,	%o4,	%g2
	edge16ln	%o6,	%g4,	%i6
	umul	%l2,	0x0880,	%o5
	mova	%xcc,	%o1,	%i3
	smul	%o7,	%o0,	%l1
	ldsw	[%l7 + 0x44],	%g5
	edge8ln	%i2,	%i7,	%l6
	sub	%i1,	%o3,	%g6
	sra	%l0,	%i4,	%l3
	edge32	%g1,	%i5,	%l4
	fmovrsgz	%i0,	%f15,	%f0
	sdivx	%o2,	0x1072,	%g3
	addc	%l5,	0x19DC,	%g7
	movrlez	%o4,	%o6,	%g2
	sethi	0x0D92,	%g4
	addcc	%l2,	0x07B2,	%i6
	fmovrdlez	%o5,	%f4,	%f6
	movrne	%o1,	%i3,	%o7
	umulcc	%o0,	0x1349,	%l1
	movge	%xcc,	%g5,	%i7
	sethi	0x0695,	%i2
	move	%xcc,	%i1,	%o3
	xor	%g6,	0x17C6,	%l0
	ldsw	[%l7 + 0x64],	%i4
	restore %l3, 0x14AB, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g1,	0x1957,	%l4
	udivcc	%i5,	0x00B6,	%o2
	sth	%g3,	[%l7 + 0x68]
	ldsw	[%l7 + 0x54],	%l5
	edge32n	%g7,	%i0,	%o6
	fcmpne32	%f28,	%f28,	%g2
	movrgz	%g4,	0x109,	%l2
	movcc	%xcc,	%o4,	%i6
	fnot1s	%f17,	%f3
	add	%o1,	0x18DA,	%i3
	sdivcc	%o7,	0x0A32,	%o5
	movcc	%icc,	%o0,	%l1
	fones	%f31
	lduw	[%l7 + 0x74],	%i7
	udivx	%i2,	0x19F7,	%i1
	add	%o3,	%g5,	%l0
	edge32ln	%g6,	%i4,	%l3
	fpadd16s	%f7,	%f6,	%f26
	xorcc	%l6,	%g1,	%i5
	array32	%l4,	%o2,	%l5
	pdist	%f18,	%f10,	%f0
	movgu	%xcc,	%g7,	%i0
	fpadd32s	%f25,	%f31,	%f8
	movcs	%icc,	%g3,	%o6
	fpack32	%f6,	%f26,	%f16
	movl	%xcc,	%g4,	%g2
	xor	%o4,	%i6,	%o1
	fabsd	%f2,	%f12
	smulcc	%i3,	0x11C5,	%o7
	faligndata	%f20,	%f12,	%f30
	alignaddr	%o5,	%o0,	%l2
	sllx	%l1,	0x08,	%i7
	move	%xcc,	%i2,	%i1
	sllx	%g5,	0x1F,	%o3
	movcc	%xcc,	%l0,	%g6
	edge32ln	%l3,	%l6,	%g1
	nop
	set	0x0A, %l6
	stb	%i4,	[%l7 + %l6]
	subccc	%l4,	%o2,	%l5
	fnand	%f16,	%f24,	%f6
	array8	%g7,	%i5,	%i0
	move	%xcc,	%g3,	%g4
	movpos	%xcc,	%g2,	%o4
	movleu	%xcc,	%i6,	%o1
	edge32n	%i3,	%o7,	%o6
	edge16	%o0,	%o5,	%l1
	movg	%xcc,	%l2,	%i7
	fmovsvc	%icc,	%f24,	%f19
	sth	%i2,	[%l7 + 0x62]
	fmovdge	%xcc,	%f13,	%f16
	udivx	%i1,	0x1503,	%o3
	fxors	%f26,	%f30,	%f29
	fpsub16	%f8,	%f26,	%f28
	ldsw	[%l7 + 0x20],	%l0
	subccc	%g6,	%l3,	%g5
	or	%g1,	0x1813,	%l6
	movcs	%xcc,	%i4,	%o2
	array32	%l4,	%g7,	%l5
	srl	%i5,	0x12,	%g3
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	fmovdneg	%xcc,	%f4,	%f13
	std	%f14,	[%l7 + 0x78]
	udiv	%g2,	0x0BCD,	%o1
	nop
	set	0x61, %g4
	ldub	[%l7 + %g4],	%i3
	sth	%o7,	[%l7 + 0x16]
	sdiv	%o6,	0x01CC,	%i6
	fmul8x16au	%f30,	%f0,	%f8
	faligndata	%f10,	%f4,	%f30
	std	%f12,	[%l7 + 0x60]
	edge16n	%o0,	%l1,	%l2
	movre	%i7,	0x346,	%i2
	and	%i1,	%o5,	%l0
	andn	%g6,	%l3,	%o3
	movvc	%xcc,	%g1,	%l6
	fornot1s	%f14,	%f28,	%f1
	andncc	%i4,	%g5,	%l4
	ldx	[%l7 + 0x50],	%g7
	srlx	%o2,	%l5,	%g3
	ldx	[%l7 + 0x10],	%i5
	sethi	0x0E6E,	%g4
	movl	%xcc,	%o4,	%g2
	fandnot1s	%f25,	%f0,	%f19
	movgu	%icc,	%i0,	%i3
	ld	[%l7 + 0x60],	%f0
	fornot1s	%f24,	%f24,	%f25
	edge16	%o7,	%o6,	%i6
	edge16	%o1,	%l1,	%l2
	movn	%icc,	%i7,	%o0
	fandnot1s	%f18,	%f14,	%f27
	st	%f11,	[%l7 + 0x34]
	popc	%i2,	%i1
	sra	%l0,	0x11,	%g6
	edge8n	%o5,	%l3,	%o3
	edge32n	%l6,	%i4,	%g5
	ldub	[%l7 + 0x16],	%l4
	and	%g7,	%o2,	%l5
	movgu	%xcc,	%g1,	%g3
	fpsub16	%f16,	%f30,	%f12
	srax	%g4,	%o4,	%i5
	xnor	%g2,	0x1492,	%i3
	std	%f30,	[%l7 + 0x68]
	movne	%xcc,	%i0,	%o7
	movcs	%xcc,	%i6,	%o6
	fandnot2s	%f15,	%f6,	%f16
	fandnot2s	%f25,	%f2,	%f23
	xnorcc	%l1,	%o1,	%i7
	smulcc	%o0,	%i2,	%i1
	orncc	%l0,	%g6,	%o5
	movrlez	%l2,	0x378,	%l3
	sth	%l6,	[%l7 + 0x6C]
	fnor	%f28,	%f0,	%f8
	orncc	%i4,	%g5,	%l4
	mulscc	%g7,	%o2,	%o3
	orncc	%l5,	%g3,	%g4
	fmovrdne	%o4,	%f20,	%f0
	movvs	%xcc,	%g1,	%i5
	andncc	%i3,	%i0,	%o7
	fzero	%f12
	orcc	%i6,	%o6,	%g2
	orncc	%o1,	%i7,	%l1
	stx	%o0,	[%l7 + 0x48]
	addcc	%i1,	0x0DC9,	%i2
	movrlz	%l0,	0x287,	%o5
	popc	%g6,	%l3
	movle	%icc,	%l6,	%i4
	edge32ln	%g5,	%l4,	%g7
	mulscc	%o2,	%l2,	%l5
	udivcc	%g3,	0x1BF6,	%o3
	fmovdg	%icc,	%f13,	%f29
	umulcc	%o4,	0x0E1B,	%g1
	fmovsne	%icc,	%f18,	%f3
	edge32n	%i5,	%g4,	%i3
	xor	%i0,	%i6,	%o6
	movg	%icc,	%o7,	%g2
	fpadd16	%f22,	%f14,	%f24
	movne	%xcc,	%i7,	%l1
	fcmpeq32	%f6,	%f20,	%o0
	stx	%o1,	[%l7 + 0x48]
	xorcc	%i1,	0x1C99,	%l0
	save %i2, %o5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l6,	0x00,	%i4
	srl	%g5,	%g6,	%g7
	xorcc	%o2,	0x1B3E,	%l2
	xnor	%l5,	%g3,	%l4
	mulx	%o4,	%o3,	%g1
	movcc	%xcc,	%g4,	%i3
	movrne	%i0,	%i5,	%i6
	addcc	%o6,	0x0720,	%g2
	fandnot2	%f12,	%f20,	%f24
	alignaddrl	%i7,	%l1,	%o7
	andcc	%o1,	%i1,	%l0
	nop
	set	0x30, %o5
	std	%f16,	[%l7 + %o5]
	ldd	[%l7 + 0x68],	%i2
	movvc	%icc,	%o5,	%l3
	addcc	%o0,	0x14A9,	%i4
	fmovspos	%icc,	%f4,	%f0
	fmovdn	%icc,	%f23,	%f9
	fnands	%f30,	%f9,	%f12
	fmul8sux16	%f20,	%f20,	%f18
	movg	%icc,	%l6,	%g5
	array8	%g6,	%o2,	%l2
	movrgez	%g7,	%g3,	%l4
	movrlz	%o4,	%l5,	%g1
	fmovs	%f16,	%f29
	edge8l	%o3,	%g4,	%i3
	movne	%xcc,	%i0,	%i6
	sth	%i5,	[%l7 + 0x14]
	edge16l	%o6,	%i7,	%g2
	smul	%l1,	0x182E,	%o7
	addc	%i1,	%l0,	%i2
	fmovrdgz	%o5,	%f10,	%f0
	stb	%o1,	[%l7 + 0x6B]
	alignaddr	%l3,	%o0,	%i4
	pdist	%f16,	%f6,	%f10
	smul	%l6,	%g6,	%o2
	edge32l	%g5,	%l2,	%g3
	ld	[%l7 + 0x38],	%f27
	edge16	%g7,	%l4,	%o4
	movleu	%xcc,	%l5,	%g1
	stb	%o3,	[%l7 + 0x7C]
	sdivx	%g4,	0x0697,	%i3
	restore %i0, %i5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i6,	0x01F7,	%i7
	ldd	[%l7 + 0x60],	%l0
	movn	%xcc,	%g2,	%o7
	orcc	%l0,	%i1,	%o5
	addc	%i2,	%o1,	%o0
	andncc	%i4,	%l6,	%l3
	ld	[%l7 + 0x50],	%f5
	save %o2, 0x1CCA, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g6,	[%l7 + 0x48]
	mulscc	%g3,	%g7,	%l4
	mova	%xcc,	%l2,	%l5
	addccc	%o4,	0x1E1D,	%o3
	edge16n	%g4,	%g1,	%i0
	fmovrdne	%i5,	%f24,	%f12
	alignaddr	%i3,	%i6,	%o6
	ld	[%l7 + 0x5C],	%f19
	array16	%l1,	%i7,	%g2
	fnand	%f24,	%f14,	%f16
	sethi	0x19B6,	%l0
	fmul8x16au	%f5,	%f5,	%f12
	ldd	[%l7 + 0x48],	%f2
	ldx	[%l7 + 0x10],	%o7
	mova	%xcc,	%i1,	%i2
	andncc	%o5,	%o1,	%o0
	andncc	%l6,	%l3,	%i4
	orncc	%g5,	0x116E,	%g6
	subccc	%g3,	0x05CB,	%g7
	edge8l	%l4,	%o2,	%l5
	sdiv	%o4,	0x0BB6,	%o3
	fcmple32	%f28,	%f20,	%l2
	siam	0x0
	srlx	%g4,	%i0,	%i5
	smul	%g1,	%i3,	%i6
	std	%f20,	[%l7 + 0x48]
	movgu	%icc,	%l1,	%i7
	lduh	[%l7 + 0x3A],	%o6
	mulx	%l0,	%g2,	%o7
	stb	%i1,	[%l7 + 0x14]
	fzero	%f10
	movrlz	%o5,	0x3AB,	%o1
	sdivx	%o0,	0x0DD7,	%l6
	srlx	%l3,	0x14,	%i2
	movne	%icc,	%g5,	%g6
	edge8n	%g3,	%i4,	%g7
	movcc	%xcc,	%o2,	%l4
	ld	[%l7 + 0x20],	%f24
	move	%xcc,	%l5,	%o4
	orcc	%o3,	%l2,	%g4
	alignaddrl	%i5,	%g1,	%i0
	movrgez	%i6,	0x3DB,	%i3
	edge16n	%l1,	%o6,	%l0
	movrne	%g2,	0x0A7,	%o7
	addccc	%i1,	%o5,	%i7
	fmovdvs	%xcc,	%f10,	%f9
	edge8	%o1,	%l6,	%o0
	fnor	%f10,	%f8,	%f12
	std	%f8,	[%l7 + 0x48]
	fcmpes	%fcc3,	%f27,	%f4
	ldd	[%l7 + 0x20],	%i2
	edge8ln	%l3,	%g6,	%g3
	fmovda	%xcc,	%f24,	%f23
	ldsh	[%l7 + 0x78],	%i4
	mulx	%g5,	0x04A2,	%o2
	movn	%icc,	%g7,	%l4
	mova	%icc,	%o4,	%l5
	movl	%icc,	%l2,	%o3
	fmul8x16	%f18,	%f8,	%f6
	fmovsn	%xcc,	%f20,	%f22
	bshuffle	%f14,	%f0,	%f16
	array32	%g4,	%g1,	%i0
	addcc	%i5,	0x170D,	%i6
	edge16	%i3,	%l1,	%o6
	movge	%xcc,	%g2,	%l0
	stx	%i1,	[%l7 + 0x18]
	sethi	0x1DEB,	%o5
	fnand	%f16,	%f20,	%f2
	xnorcc	%i7,	%o1,	%l6
	stw	%o7,	[%l7 + 0x3C]
	sra	%i2,	0x19,	%l3
	movvs	%icc,	%g6,	%o0
	udivcc	%g3,	0x0E3B,	%g5
	movle	%xcc,	%i4,	%o2
	fmovsle	%icc,	%f3,	%f31
	array32	%l4,	%g7,	%o4
	orn	%l2,	0x1665,	%l5
	movg	%xcc,	%o3,	%g1
	mulx	%g4,	0x01B0,	%i5
	stb	%i6,	[%l7 + 0x40]
	save %i3, 0x1EFC, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f8,	%f16,	%f30
	sdiv	%o6,	0x06DE,	%l1
	edge16n	%g2,	%l0,	%o5
	movcs	%xcc,	%i1,	%i7
	edge8l	%l6,	%o7,	%i2
	sra	%l3,	%g6,	%o0
	orn	%o1,	%g5,	%g3
	fandnot1s	%f22,	%f5,	%f22
	andcc	%i4,	0x12FE,	%l4
	ldd	[%l7 + 0x50],	%f26
	edge16ln	%g7,	%o4,	%l2
	xnor	%l5,	%o2,	%g1
	array32	%o3,	%g4,	%i5
	alignaddr	%i3,	%i6,	%i0
	alignaddrl	%o6,	%g2,	%l0
	sdivx	%o5,	0x0A5A,	%l1
	edge16ln	%i1,	%l6,	%o7
	and	%i2,	%l3,	%i7
	move	%xcc,	%o0,	%o1
	movrgz	%g6,	%g5,	%i4
	fnand	%f30,	%f30,	%f20
	subccc	%g3,	%g7,	%o4
	st	%f20,	[%l7 + 0x08]
	movl	%icc,	%l4,	%l2
	sll	%o2,	%g1,	%o3
	edge32	%l5,	%i5,	%i3
	movre	%i6,	%i0,	%o6
	fpack32	%f14,	%f24,	%f4
	std	%f26,	[%l7 + 0x58]
	edge8ln	%g2,	%g4,	%o5
	array8	%l0,	%l1,	%l6
	sir	0x0729
	edge8n	%i1,	%o7,	%i2
	addc	%i7,	0x074B,	%o0
	orcc	%o1,	%g6,	%l3
	movvs	%xcc,	%i4,	%g3
	st	%f16,	[%l7 + 0x14]
	movle	%icc,	%g7,	%o4
	nop
	set	0x3A, %o7
	stb	%l4,	[%l7 + %o7]
	fmovd	%f6,	%f6
	ld	[%l7 + 0x44],	%f17
	fmovsne	%xcc,	%f9,	%f1
	edge16ln	%g5,	%o2,	%g1
	edge8l	%l2,	%l5,	%i5
	edge8ln	%i3,	%o3,	%i6
	move	%icc,	%o6,	%g2
	stx	%i0,	[%l7 + 0x30]
	fcmpes	%fcc3,	%f5,	%f10
	udivx	%o5,	0x1BC2,	%l0
	sllx	%g4,	0x1F,	%l1
	fmovrslz	%i1,	%f7,	%f12
	mova	%xcc,	%l6,	%i2
	edge32l	%i7,	%o0,	%o7
	movgu	%xcc,	%g6,	%o1
	xor	%l3,	0x17EC,	%i4
	stw	%g7,	[%l7 + 0x30]
	ldsh	[%l7 + 0x2E],	%g3
	movn	%icc,	%o4,	%g5
	fpadd16	%f24,	%f16,	%f28
	fmovdg	%xcc,	%f0,	%f28
	orcc	%l4,	0x0033,	%o2
	stw	%g1,	[%l7 + 0x58]
	fnot2	%f12,	%f20
	array16	%l5,	%l2,	%i5
	movn	%xcc,	%i3,	%o3
	nop
	set	0x30, %l1
	std	%f6,	[%l7 + %l1]
	ldd	[%l7 + 0x50],	%o6
	fmovrsne	%g2,	%f15,	%f9
	fcmple32	%f0,	%f12,	%i0
	fpadd16	%f18,	%f28,	%f18
	sllx	%o5,	0x1B,	%l0
	movn	%icc,	%g4,	%i6
	orncc	%l1,	%i1,	%l6
	edge16ln	%i2,	%o0,	%i7
	edge8l	%o7,	%o1,	%g6
	fmovdleu	%xcc,	%f12,	%f17
	movpos	%icc,	%i4,	%g7
	sdiv	%g3,	0x0104,	%o4
	fmovscc	%icc,	%f13,	%f26
	ldub	[%l7 + 0x59],	%l3
	orncc	%l4,	%o2,	%g1
	movrlz	%g5,	%l5,	%i5
	edge16n	%i3,	%o3,	%l2
	movrne	%g2,	0x27B,	%i0
	array32	%o5,	%o6,	%g4
	udivx	%l0,	0x10E9,	%l1
	st	%f8,	[%l7 + 0x34]
	nop
	set	0x16, %l2
	sth	%i1,	[%l7 + %l2]
	movvs	%xcc,	%l6,	%i2
	fmul8sux16	%f12,	%f6,	%f22
	ldsb	[%l7 + 0x43],	%o0
	umulcc	%i6,	%o7,	%i7
	and	%g6,	%i4,	%o1
	subcc	%g3,	0x1A1E,	%g7
	movl	%icc,	%l3,	%l4
	fmovrse	%o4,	%f0,	%f0
	fmovrslez	%o2,	%f19,	%f21
	edge8ln	%g5,	%l5,	%i5
	fcmps	%fcc0,	%f20,	%f4
	lduh	[%l7 + 0x32],	%g1
	sub	%i3,	0x1067,	%o3
	fmovdneg	%xcc,	%f23,	%f26
	stw	%g2,	[%l7 + 0x54]
	edge8l	%l2,	%o5,	%i0
	movcs	%icc,	%o6,	%g4
	sll	%l1,	0x11,	%l0
	edge8	%l6,	%i1,	%o0
	sub	%i6,	%i2,	%o7
	fsrc1s	%f26,	%f16
	ldx	[%l7 + 0x30],	%g6
	sethi	0x03FC,	%i7
	fmovsa	%xcc,	%f7,	%f0
	ldsw	[%l7 + 0x10],	%o1
	movre	%g3,	%i4,	%l3
	movne	%icc,	%l4,	%o4
	fsrc1	%f16,	%f8
	movne	%icc,	%o2,	%g7
	fxnors	%f9,	%f14,	%f26
	fmovdge	%icc,	%f27,	%f13
	sll	%l5,	0x14,	%i5
	sth	%g1,	[%l7 + 0x2C]
	srl	%g5,	%i3,	%g2
	edge16l	%o3,	%l2,	%o5
	array8	%o6,	%i0,	%g4
	fmovscs	%xcc,	%f17,	%f6
	edge32	%l0,	%l6,	%i1
	edge16ln	%o0,	%l1,	%i2
	mova	%xcc,	%o7,	%i6
	fmovdvs	%xcc,	%f15,	%f19
	fsrc1	%f0,	%f2
	lduw	[%l7 + 0x1C],	%g6
	movrgez	%o1,	0x263,	%i7
	fcmpgt16	%f28,	%f10,	%g3
	ldx	[%l7 + 0x70],	%l3
	andncc	%i4,	%o4,	%o2
	andcc	%g7,	0x054E,	%l5
	sll	%l4,	%g1,	%g5
	ldsh	[%l7 + 0x26],	%i5
	smulcc	%i3,	0x1699,	%o3
	udiv	%g2,	0x13CB,	%l2
	movcs	%icc,	%o6,	%o5
	mulx	%i0,	%l0,	%g4
	movcs	%xcc,	%l6,	%i1
	bshuffle	%f28,	%f8,	%f6
	fmovrsne	%l1,	%f18,	%f25
	movrgz	%i2,	%o0,	%i6
	xnorcc	%o7,	0x1761,	%o1
	movre	%g6,	%g3,	%i7
	srax	%l3,	0x01,	%i4
	edge16n	%o4,	%o2,	%g7
	fcmpes	%fcc3,	%f21,	%f24
	movg	%xcc,	%l5,	%g1
	stb	%l4,	[%l7 + 0x6A]
	ldub	[%l7 + 0x4E],	%i5
	edge8l	%g5,	%o3,	%i3
	srl	%l2,	0x12,	%g2
	fmul8ulx16	%f28,	%f14,	%f10
	subc	%o6,	%o5,	%l0
	umulcc	%i0,	%g4,	%l6
	ldsb	[%l7 + 0x7A],	%l1
	mova	%icc,	%i2,	%o0
	array16	%i6,	%o7,	%i1
	sra	%o1,	%g3,	%i7
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	fmul8sux16	%f12,	%f4,	%f22
	nop
	set	0x0A, %l4
	ldsh	[%l7 + %l4],	%o4
	fmul8x16al	%f18,	%f27,	%f4
	mulscc	%l3,	0x14D4,	%g7
	mova	%xcc,	%l5,	%g1
	fmovdneg	%icc,	%f25,	%f1
	subc	%l4,	0x0044,	%i5
	array8	%o2,	%g5,	%o3
	orncc	%l2,	%g2,	%o6
	srl	%i3,	%o5,	%i0
	addc	%l0,	0x1FF4,	%l6
	fmovscc	%xcc,	%f18,	%f29
	sdivcc	%l1,	0x1D9F,	%g4
	fpsub32s	%f31,	%f21,	%f20
	or	%o0,	0x15FC,	%i2
	movgu	%icc,	%i6,	%i1
	fmul8x16	%f19,	%f26,	%f26
	edge16	%o7,	%o1,	%g3
	fzeros	%f2
	movge	%xcc,	%i7,	%i4
	ldsb	[%l7 + 0x10],	%g6
	fands	%f8,	%f15,	%f18
	sir	0x0129
	restore %o4, %l3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g1,	[%l7 + 0x20]
	fpack32	%f10,	%f18,	%f20
	orncc	%g7,	0x1119,	%l4
	ldub	[%l7 + 0x37],	%i5
	movpos	%xcc,	%g5,	%o2
	fornot2s	%f13,	%f6,	%f4
	smul	%l2,	%o3,	%o6
	lduh	[%l7 + 0x5E],	%g2
	movvs	%xcc,	%o5,	%i3
	xor	%i0,	0x139D,	%l6
	mova	%xcc,	%l0,	%g4
	addc	%l1,	0x0D3D,	%o0
	edge32	%i6,	%i1,	%o7
	udivx	%o1,	0x0D82,	%g3
	fmovrsne	%i2,	%f30,	%f6
	movvs	%icc,	%i4,	%i7
	movrgez	%o4,	0x0F5,	%l3
	alignaddrl	%g6,	%l5,	%g1
	fcmple16	%f30,	%f18,	%g7
	addccc	%l4,	0x04D0,	%i5
	ldd	[%l7 + 0x10],	%f12
	sdivx	%o2,	0x10C4,	%l2
	movpos	%xcc,	%o3,	%o6
	xnor	%g2,	%o5,	%i3
	and	%g5,	0x0315,	%i0
	edge16ln	%l6,	%l0,	%g4
	array32	%l1,	%o0,	%i1
	fnot1	%f8,	%f4
	andncc	%i6,	%o1,	%g3
	stx	%o7,	[%l7 + 0x30]
	fmovsgu	%xcc,	%f21,	%f25
	fmovrdlez	%i4,	%f12,	%f0
	fmovsa	%xcc,	%f12,	%f1
	xorcc	%i2,	0x1EE7,	%o4
	fmovrslez	%i7,	%f21,	%f15
	movgu	%icc,	%l3,	%l5
	movcs	%xcc,	%g6,	%g1
	orn	%g7,	%i5,	%o2
	fmovrse	%l4,	%f3,	%f8
	fxnors	%f20,	%f31,	%f19
	ld	[%l7 + 0x7C],	%f11
	sir	0x05C1
	edge32ln	%l2,	%o6,	%o3
	addcc	%g2,	0x0FDB,	%i3
	array16	%g5,	%o5,	%l6
	movvs	%icc,	%l0,	%i0
	ldd	[%l7 + 0x68],	%f14
	lduw	[%l7 + 0x10],	%g4
	bshuffle	%f6,	%f28,	%f12
	sth	%o0,	[%l7 + 0x4A]
	andncc	%l1,	%i1,	%o1
	movvs	%xcc,	%g3,	%o7
	srlx	%i4,	%i6,	%i2
	movcs	%icc,	%i7,	%o4
	fmovd	%f0,	%f30
	fmovdleu	%icc,	%f24,	%f3
	orn	%l5,	%g6,	%l3
	alignaddrl	%g1,	%g7,	%i5
	udivx	%l4,	0x1474,	%o2
	fmovrdlz	%l2,	%f24,	%f2
	edge8	%o6,	%g2,	%i3
	sra	%o3,	0x00,	%o5
	edge16	%l6,	%l0,	%g5
	orncc	%i0,	%g4,	%l1
	udivx	%i1,	0x0934,	%o1
	addccc	%o0,	0x1C75,	%o7
	ldsb	[%l7 + 0x58],	%g3
	edge16ln	%i4,	%i2,	%i7
	lduh	[%l7 + 0x44],	%o4
	srax	%l5,	0x10,	%g6
	popc	0x15BF,	%i6
	fzeros	%f20
	umulcc	%l3,	0x0450,	%g7
	fmovsgu	%xcc,	%f2,	%f12
	movge	%icc,	%i5,	%l4
	ld	[%l7 + 0x08],	%f14
	sll	%g1,	%l2,	%o2
	fcmpeq32	%f26,	%f8,	%g2
	edge16l	%i3,	%o3,	%o6
	mulx	%l6,	%l0,	%o5
	udiv	%i0,	0x0B7B,	%g4
	movl	%icc,	%l1,	%i1
	fcmpd	%fcc1,	%f12,	%f4
	ldd	[%l7 + 0x78],	%f30
	edge8	%o1,	%g5,	%o7
	xor	%o0,	%i4,	%i2
	sub	%i7,	%g3,	%o4
	stw	%l5,	[%l7 + 0x5C]
	fmul8ulx16	%f12,	%f4,	%f24
	sub	%g6,	0x0E14,	%i6
	movg	%icc,	%g7,	%i5
	sethi	0x124D,	%l3
	orn	%g1,	0x134B,	%l2
	orncc	%o2,	0x035A,	%l4
	edge8ln	%i3,	%g2,	%o6
	udiv	%l6,	0x0C71,	%o3
	smulcc	%o5,	%i0,	%l0
	movl	%xcc,	%l1,	%i1
	fpadd32s	%f31,	%f9,	%f6
	movle	%xcc,	%g4,	%o1
	fmul8x16	%f27,	%f20,	%f22
	movrlz	%g5,	%o7,	%o0
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fzeros	%f26
	movcs	%icc,	%o4,	%i7
	ldx	[%l7 + 0x20],	%l5
	srlx	%i6,	%g6,	%g7
	ldsh	[%l7 + 0x3C],	%i5
	subc	%l3,	%g1,	%o2
	movle	%xcc,	%l2,	%i3
	orn	%l4,	%o6,	%g2
	subccc	%l6,	0x1FAC,	%o5
	fabsd	%f6,	%f30
	fnor	%f0,	%f18,	%f0
	movre	%i0,	%l0,	%l1
	movvs	%icc,	%i1,	%o3
	fmovsg	%xcc,	%f8,	%f13
	movle	%xcc,	%o1,	%g4
	edge32n	%g5,	%o0,	%o7
	srl	%i4,	%i2,	%g3
	movcc	%xcc,	%i7,	%l5
	orn	%o4,	%g6,	%g7
	fornot1	%f30,	%f18,	%f8
	movrgez	%i6,	0x063,	%i5
	fmovrsne	%g1,	%f19,	%f5
	ld	[%l7 + 0x44],	%f27
	movg	%icc,	%o2,	%l3
	ldub	[%l7 + 0x36],	%i3
	udivcc	%l4,	0x00D5,	%o6
	fmovdcc	%xcc,	%f4,	%f27
	subccc	%l2,	%g2,	%o5
	edge8ln	%i0,	%l6,	%l1
	fandnot1s	%f18,	%f8,	%f12
	add	%i1,	0x15C1,	%l0
	movvs	%xcc,	%o1,	%g4
	orcc	%g5,	%o3,	%o7
	srlx	%o0,	0x01,	%i4
	restore %g3, 0x1B40, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l5,	%o4
	udivx	%i2,	0x0531,	%g7
	edge8ln	%g6,	%i6,	%g1
	ldd	[%l7 + 0x58],	%f16
	alignaddrl	%i5,	%o2,	%i3
	edge32	%l4,	%l3,	%l2
	movg	%icc,	%g2,	%o5
	xnorcc	%i0,	%o6,	%l6
	movcc	%xcc,	%l1,	%i1
	edge32l	%o1,	%l0,	%g5
	lduw	[%l7 + 0x74],	%o3
	fcmpeq32	%f28,	%f20,	%o7
	subccc	%o0,	0x1B6D,	%g4
	edge16n	%i4,	%g3,	%l5
	fmovsneg	%icc,	%f20,	%f31
	orcc	%o4,	0x15BE,	%i7
	sethi	0x1746,	%g7
	nop
	set	0x40, %i5
	sth	%i2,	[%l7 + %i5]
	fand	%f10,	%f10,	%f18
	sth	%i6,	[%l7 + 0x70]
	umul	%g6,	%i5,	%o2
	andn	%g1,	%l4,	%l3
	sra	%l2,	0x00,	%g2
	movre	%i3,	0x132,	%i0
	lduw	[%l7 + 0x0C],	%o5
	nop
	set	0x30, %i7
	stx	%o6,	[%l7 + %i7]
	sub	%l1,	%i1,	%l6
	movleu	%icc,	%o1,	%g5
	edge8l	%l0,	%o3,	%o7
	movn	%icc,	%o0,	%g4
	ldd	[%l7 + 0x18],	%f28
	ldub	[%l7 + 0x1C],	%g3
	xorcc	%l5,	%o4,	%i7
	sdivx	%i4,	0x1041,	%g7
	xor	%i2,	0x1AA9,	%i6
	edge16n	%g6,	%i5,	%o2
	edge8n	%l4,	%l3,	%g1
	alignaddr	%l2,	%i3,	%g2
	sdivx	%i0,	0x03A1,	%o5
	movvc	%icc,	%l1,	%i1
	sth	%l6,	[%l7 + 0x74]
	std	%f4,	[%l7 + 0x68]
	movgu	%xcc,	%o1,	%g5
	sll	%l0,	%o3,	%o6
	save %o0, %o7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	fmovdle	%icc,	%f22,	%f13
	edge16	%i4,	%l5,	%g7
	edge32	%i2,	%i6,	%i5
	fmovdleu	%icc,	%f18,	%f3
	edge8	%o2,	%l4,	%l3
	movrlez	%g6,	0x138,	%l2
	fmovse	%icc,	%f19,	%f17
	edge32n	%i3,	%g2,	%g1
	andcc	%i0,	0x1163,	%o5
	ld	[%l7 + 0x64],	%f16
	ldsb	[%l7 + 0x68],	%i1
	stx	%l6,	[%l7 + 0x50]
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%l1
	fmovsvc	%xcc,	%f25,	%f18
	fmovda	%icc,	%f15,	%f12
	fcmpgt16	%f24,	%f20,	%g5
	xnor	%o1,	%l0,	%o6
	fand	%f4,	%f8,	%f28
	add	%o3,	%o7,	%g4
	mova	%xcc,	%g3,	%o4
	sth	%i7,	[%l7 + 0x50]
	edge32ln	%o0,	%l5,	%i4
	movge	%xcc,	%g7,	%i6
	stb	%i2,	[%l7 + 0x3F]
	fpadd32	%f2,	%f4,	%f6
	lduh	[%l7 + 0x10],	%i5
	movvs	%icc,	%o2,	%l4
	ldsb	[%l7 + 0x6F],	%l3
	fones	%f5
	fmovsgu	%icc,	%f19,	%f30
	ldsw	[%l7 + 0x2C],	%l2
	std	%f30,	[%l7 + 0x40]
	movge	%xcc,	%g6,	%i3
	movge	%xcc,	%g1,	%g2
	movge	%xcc,	%o5,	%i0
	mulscc	%l6,	0x0E79,	%l1
	alignaddrl	%g5,	%o1,	%l0
	xnorcc	%i1,	0x188A,	%o3
	sdiv	%o7,	0x1277,	%o6
	fmovdne	%xcc,	%f3,	%f31
	orn	%g3,	%g4,	%o4
	fmovrse	%o0,	%f17,	%f7
	movleu	%icc,	%i7,	%l5
	fzero	%f18
	movneg	%xcc,	%g7,	%i6
	addcc	%i4,	0x0C9F,	%i2
	fandnot1s	%f30,	%f28,	%f25
	fpadd16s	%f29,	%f10,	%f13
	xnor	%i5,	0x1D71,	%o2
	fcmpne16	%f4,	%f24,	%l4
	andcc	%l3,	%g6,	%l2
	fpmerge	%f16,	%f26,	%f14
	movpos	%xcc,	%g1,	%g2
	edge8l	%o5,	%i3,	%l6
	movrlez	%l1,	0x01B,	%i0
	xor	%g5,	0x1A57,	%o1
	edge32	%l0,	%i1,	%o7
	edge8	%o3,	%g3,	%o6
	mulscc	%g4,	0x1627,	%o4
	lduh	[%l7 + 0x5E],	%i7
	fnot1s	%f16,	%f23
	orcc	%l5,	%g7,	%o0
	st	%f19,	[%l7 + 0x60]
	andcc	%i6,	0x1ADF,	%i4
	fmovdneg	%icc,	%f30,	%f11
	nop
	set	0x6A, %g1
	ldsh	[%l7 + %g1],	%i2
	movrne	%o2,	%i5,	%l4
	udivx	%l3,	0x1C5E,	%l2
	movrgz	%g1,	%g6,	%g2
	edge8	%i3,	%l6,	%o5
	move	%icc,	%l1,	%g5
	fnot2	%f20,	%f24
	movle	%xcc,	%o1,	%i0
	movl	%icc,	%i1,	%l0
	fmul8ulx16	%f14,	%f8,	%f28
	fcmple32	%f4,	%f12,	%o7
	xor	%g3,	%o3,	%g4
	andn	%o6,	%i7,	%o4
	subc	%l5,	0x17C1,	%g7
	sllx	%o0,	%i6,	%i2
	edge16l	%o2,	%i5,	%i4
	edge32n	%l4,	%l3,	%g1
	ldd	[%l7 + 0x10],	%g6
	sub	%g2,	%l2,	%i3
	stb	%o5,	[%l7 + 0x68]
	ldsh	[%l7 + 0x42],	%l6
	xnorcc	%l1,	0x1DD5,	%o1
	smul	%g5,	0x1E6C,	%i1
	sethi	0x1E19,	%i0
	fmovrdlez	%l0,	%f6,	%f2
	fmovsleu	%xcc,	%f21,	%f25
	edge8l	%o7,	%o3,	%g3
	ldsb	[%l7 + 0x34],	%g4
	nop
	set	0x08, %o0
	ldd	[%l7 + %o0],	%f30
	movrne	%o6,	%o4,	%l5
	movne	%xcc,	%i7,	%o0
	movrlz	%g7,	0x340,	%i2
	nop
	set	0x40, %l5
	stx	%i6,	[%l7 + %l5]
	udivx	%i5,	0x137E,	%o2
	edge32ln	%l4,	%i4,	%g1
	alignaddrl	%g6,	%l3,	%g2
	fmovsl	%icc,	%f15,	%f15
	mulscc	%i3,	0x0ED4,	%o5
	addcc	%l2,	0x1396,	%l6
	fmul8x16al	%f18,	%f10,	%f10
	lduh	[%l7 + 0x4E],	%l1
	sdiv	%g5,	0x1766,	%i1
	umul	%o1,	%i0,	%o7
	array8	%l0,	%g3,	%g4
	fcmped	%fcc3,	%f28,	%f28
	sdivx	%o3,	0x08FC,	%o6
	array32	%l5,	%o4,	%o0
	sir	0x152E
	mova	%icc,	%g7,	%i2
	fmovrsgez	%i6,	%f1,	%f12
	ldsh	[%l7 + 0x4C],	%i7
	srax	%o2,	0x14,	%l4
	movg	%xcc,	%i5,	%i4
	sdiv	%g1,	0x1701,	%l3
	edge8ln	%g2,	%g6,	%o5
	stx	%i3,	[%l7 + 0x08]
	edge16ln	%l6,	%l2,	%l1
	ldsb	[%l7 + 0x24],	%g5
	mova	%icc,	%o1,	%i1
	fabss	%f30,	%f0
	ld	[%l7 + 0x10],	%f25
	mulx	%i0,	0x1BCE,	%l0
	udivx	%o7,	0x0A81,	%g4
	umul	%g3,	%o6,	%o3
	sir	0x00BF
	sth	%o4,	[%l7 + 0x60]
	fands	%f7,	%f10,	%f2
	sub	%l5,	0x028E,	%g7
	fnand	%f0,	%f0,	%f18
	addcc	%o0,	%i6,	%i2
	movneg	%icc,	%o2,	%l4
	ldsw	[%l7 + 0x30],	%i7
	save %i4, 0x0CC4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x19D0
	addcc	%l3,	%g1,	%g6
	addccc	%g2,	%i3,	%o5
	fcmpd	%fcc0,	%f16,	%f10
	movrgez	%l6,	%l2,	%g5
	orcc	%o1,	%l1,	%i0
	orncc	%l0,	%i1,	%g4
	fxnor	%f6,	%f30,	%f24
	edge16n	%g3,	%o6,	%o3
	xorcc	%o4,	%l5,	%g7
	addc	%o7,	0x01C7,	%o0
	nop
	set	0x08, %l0
	stw	%i2,	[%l7 + %l0]
	stb	%i6,	[%l7 + 0x5C]
	fcmpgt32	%f4,	%f2,	%l4
	edge32ln	%o2,	%i7,	%i5
	movrlez	%l3,	0x24C,	%i4
	xnorcc	%g6,	%g1,	%i3
	sdivcc	%o5,	0x0EC7,	%g2
	fpack32	%f28,	%f0,	%f0
	restore %l6, 0x0028, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x28],	%f23
	edge32n	%o1,	%g5,	%l1
	array8	%i0,	%l0,	%i1
	smul	%g4,	%g3,	%o3
	fmovdneg	%icc,	%f10,	%f7
	fmovrdne	%o4,	%f22,	%f16
	fzero	%f22
	movg	%icc,	%l5,	%g7
	movgu	%xcc,	%o7,	%o6
	fcmple16	%f14,	%f8,	%o0
	fsrc1s	%f19,	%f10
	sth	%i6,	[%l7 + 0x6E]
	fmovdvc	%icc,	%f11,	%f8
	movcs	%xcc,	%l4,	%o2
	xnorcc	%i7,	0x0928,	%i2
	movgu	%icc,	%i5,	%i4
	fpsub16	%f4,	%f6,	%f24
	fpack32	%f26,	%f14,	%f4
	siam	0x3
	sdiv	%g6,	0x0CB6,	%l3
	fpadd16s	%f19,	%f7,	%f5
	addcc	%i3,	0x02B0,	%o5
	ldx	[%l7 + 0x18],	%g2
	sra	%g1,	%l6,	%o1
	edge32	%g5,	%l1,	%l2
	ldsb	[%l7 + 0x0F],	%l0
	edge8n	%i1,	%g4,	%g3
	movle	%icc,	%o3,	%o4
	sllx	%l5,	%i0,	%o7
	xnorcc	%o6,	%o0,	%i6
	edge8ln	%l4,	%o2,	%i7
	sth	%g7,	[%l7 + 0x60]
	andcc	%i2,	%i5,	%i4
	ldx	[%l7 + 0x68],	%g6
	st	%f8,	[%l7 + 0x40]
	addccc	%l3,	0x1F98,	%o5
	sdivcc	%i3,	0x1EF8,	%g2
	movneg	%xcc,	%g1,	%l6
	subccc	%g5,	%l1,	%l2
	movrlz	%l0,	0x315,	%o1
	fpadd16	%f28,	%f4,	%f2
	array32	%i1,	%g3,	%g4
	sra	%o4,	%l5,	%o3
	movre	%o7,	%o6,	%o0
	save %i0, %l4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f4,	%f13,	%f2
	sdiv	%o2,	0x1EC3,	%i7
	ldd	[%l7 + 0x58],	%i2
	fcmpd	%fcc2,	%f28,	%f28
	movrlez	%i5,	0x193,	%i4
	movrgez	%g7,	0x25E,	%g6
	movne	%icc,	%l3,	%o5
	subccc	%g2,	%i3,	%g1
	sth	%l6,	[%l7 + 0x1C]
	fsrc1s	%f22,	%f0
	array32	%g5,	%l2,	%l0
	mulscc	%o1,	%l1,	%g3
	movge	%icc,	%i1,	%o4
	udiv	%l5,	0x1DE9,	%g4
	ldub	[%l7 + 0x1C],	%o7
	sir	0x0256
	movrlz	%o3,	%o0,	%i0
	stw	%o6,	[%l7 + 0x38]
	andn	%i6,	0x0CBD,	%o2
	stw	%i7,	[%l7 + 0x64]
	fmovdvs	%icc,	%f4,	%f12
	add	%i2,	0x1814,	%i5
	fpackfix	%f28,	%f16
	fnand	%f6,	%f14,	%f24
	movg	%xcc,	%l4,	%g7
	fmovrslz	%g6,	%f26,	%f10
	mulx	%l3,	0x0CDA,	%o5
	fand	%f12,	%f24,	%f26
	xnor	%i4,	%g2,	%g1
	and	%l6,	0x0D13,	%i3
	xnorcc	%g5,	%l2,	%o1
	orncc	%l0,	0x137F,	%l1
	ldsw	[%l7 + 0x20],	%g3
	movcc	%icc,	%i1,	%o4
	andn	%l5,	%o7,	%g4
	movre	%o3,	0x102,	%o0
	fcmpne32	%f14,	%f6,	%i0
	addcc	%o6,	%o2,	%i7
	alignaddrl	%i2,	%i6,	%i5
	fcmpd	%fcc2,	%f12,	%f6
	movn	%icc,	%g7,	%g6
	lduh	[%l7 + 0x2A],	%l4
	movrlez	%o5,	0x3D8,	%l3
	fmovsle	%icc,	%f18,	%f12
	orcc	%g2,	%g1,	%i4
	array16	%i3,	%l6,	%g5
	udivx	%l2,	0x13B1,	%l0
	movvs	%xcc,	%o1,	%g3
	ldsh	[%l7 + 0x3E],	%l1
	fmovrsgez	%i1,	%f6,	%f15
	udivcc	%o4,	0x018D,	%o7
	sllx	%g4,	%l5,	%o3
	ldsw	[%l7 + 0x58],	%o0
	orn	%o6,	%o2,	%i0
	movge	%xcc,	%i2,	%i6
	fcmpes	%fcc2,	%f3,	%f25
	fand	%f16,	%f26,	%f28
	orncc	%i7,	0x0D5D,	%g7
	orn	%i5,	%g6,	%l4
	edge8l	%o5,	%g2,	%l3
	ldsb	[%l7 + 0x2F],	%i4
	mulx	%g1,	%i3,	%l6
	move	%xcc,	%l2,	%g5
	movne	%xcc,	%o1,	%g3
	sethi	0x1F21,	%l0
	udivx	%i1,	0x1E4A,	%l1
	stw	%o4,	[%l7 + 0x2C]
	fmovsneg	%xcc,	%f9,	%f27
	ldub	[%l7 + 0x3A],	%o7
	smulcc	%l5,	%g4,	%o3
	add	%o6,	0x01F8,	%o0
	edge32ln	%i0,	%i2,	%o2
	movleu	%xcc,	%i7,	%i6
	stw	%g7,	[%l7 + 0x4C]
	sra	%g6,	0x0A,	%i5
	movrlez	%l4,	%o5,	%g2
	ldd	[%l7 + 0x30],	%f24
	subccc	%i4,	0x0998,	%g1
	std	%f8,	[%l7 + 0x40]
	orncc	%i3,	%l6,	%l3
	sllx	%l2,	%o1,	%g3
	edge16l	%g5,	%l0,	%l1
	nop
	set	0x58, %l3
	ldd	[%l7 + %l3],	%f30
	edge32l	%i1,	%o4,	%o7
	fnors	%f9,	%f7,	%f21
	edge32n	%g4,	%o3,	%o6
	edge8	%o0,	%i0,	%l5
	stb	%i2,	[%l7 + 0x58]
	fmovrslz	%o2,	%f1,	%f1
	move	%icc,	%i6,	%g7
	fmul8x16au	%f27,	%f2,	%f0
	lduh	[%l7 + 0x28],	%g6
	ldsh	[%l7 + 0x36],	%i7
	fandnot1	%f10,	%f12,	%f30
	andncc	%i5,	%o5,	%l4
	add	%g2,	0x069D,	%i4
	umul	%g1,	%i3,	%l6
	movleu	%xcc,	%l3,	%o1
	orn	%g3,	0x1089,	%l2
	movvc	%icc,	%l0,	%g5
	sllx	%i1,	%o4,	%l1
	movg	%icc,	%o7,	%g4
	array8	%o6,	%o3,	%o0
	movpos	%icc,	%i0,	%i2
	ldub	[%l7 + 0x31],	%o2
	subccc	%i6,	%l5,	%g6
	alignaddrl	%i7,	%i5,	%g7
	stx	%l4,	[%l7 + 0x78]
	edge32l	%o5,	%g2,	%i4
	edge16n	%i3,	%l6,	%g1
	fmovdvc	%icc,	%f21,	%f26
	xorcc	%l3,	%o1,	%l2
	mova	%icc,	%g3,	%g5
	movcc	%xcc,	%i1,	%l0
	subcc	%o4,	0x0966,	%o7
	fpadd32	%f28,	%f14,	%f12
	addccc	%l1,	%g4,	%o3
	fmovscc	%icc,	%f4,	%f19
	subccc	%o0,	0x0E8F,	%i0
	ldsw	[%l7 + 0x1C],	%o6
	fmovrdlz	%i2,	%f2,	%f30
	addc	%i6,	0x067A,	%l5
	subc	%g6,	0x0915,	%i7
	sdivcc	%i5,	0x1199,	%o2
	fpsub16	%f2,	%f22,	%f20
	xorcc	%g7,	0x04D2,	%l4
	sub	%g2,	%i4,	%o5
	st	%f6,	[%l7 + 0x24]
	andn	%l6,	%i3,	%l3
	sth	%g1,	[%l7 + 0x40]
	stw	%o1,	[%l7 + 0x38]
	st	%f9,	[%l7 + 0x64]
	fsrc1s	%f31,	%f2
	edge16n	%l2,	%g3,	%g5
	ldsw	[%l7 + 0x1C],	%i1
	edge16	%l0,	%o7,	%l1
	fmovrslz	%g4,	%f1,	%f20
	fmovdl	%icc,	%f3,	%f7
	movgu	%icc,	%o4,	%o3
	movrgez	%o0,	%o6,	%i2
	edge8ln	%i0,	%i6,	%g6
	xnor	%l5,	0x0615,	%i5
	udivx	%o2,	0x10EB,	%i7
	std	%f20,	[%l7 + 0x38]
	addcc	%g7,	0x026C,	%g2
	movge	%xcc,	%i4,	%l4
	edge32	%o5,	%i3,	%l3
	save %l6, 0x05CD, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g1,	0x1BA,	%l2
	andn	%g5,	%i1,	%g3
	movre	%l0,	0x037,	%l1
	fmovrsgez	%o7,	%f13,	%f15
	for	%f16,	%f26,	%f2
	sethi	0x08D3,	%o4
	fzeros	%f21
	srl	%g4,	0x0F,	%o3
	movge	%xcc,	%o6,	%i2
	mulx	%o0,	%i6,	%i0
	stb	%g6,	[%l7 + 0x27]
	movvs	%icc,	%l5,	%i5
	movcs	%xcc,	%o2,	%g7
	xorcc	%g2,	0x0AC6,	%i7
	fand	%f10,	%f2,	%f22
	fxors	%f4,	%f22,	%f9
	movgu	%icc,	%l4,	%o5
	stx	%i4,	[%l7 + 0x60]
	movcc	%xcc,	%l3,	%i3
	xorcc	%l6,	0x1C0D,	%g1
	movgu	%xcc,	%l2,	%o1
	addcc	%i1,	%g3,	%l0
	st	%f18,	[%l7 + 0x28]
	array32	%l1,	%o7,	%g5
	ldsb	[%l7 + 0x11],	%g4
	edge16ln	%o4,	%o6,	%o3
	fxor	%f30,	%f6,	%f10
	add	%i2,	0x0997,	%o0
	fmovda	%icc,	%f0,	%f14
	save %i6, %i0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g6,	%i5,	%g7
	ldd	[%l7 + 0x78],	%o2
	srl	%g2,	%i7,	%o5
	alignaddr	%i4,	%l3,	%i3
	edge16l	%l6,	%g1,	%l4
	sethi	0x1E5C,	%o1
	move	%icc,	%l2,	%i1
	and	%l0,	%g3,	%o7
	edge32	%g5,	%g4,	%o4
	ldsh	[%l7 + 0x48],	%l1
	edge8n	%o6,	%o3,	%o0
	ldx	[%l7 + 0x58],	%i6
	fsrc2s	%f6,	%f6
	movrlez	%i0,	0x0B6,	%l5
	fnegs	%f8,	%f24
	edge8	%g6,	%i2,	%i5
	xnor	%o2,	0x0DD6,	%g7
	andncc	%g2,	%i7,	%o5
	fnot2s	%f23,	%f23
	fabsd	%f6,	%f26
	fnot2s	%f8,	%f22
	ld	[%l7 + 0x44],	%f26
	sub	%i4,	%i3,	%l3
	fmovsvs	%icc,	%f15,	%f26
	ldsh	[%l7 + 0x5A],	%g1
	movle	%xcc,	%l6,	%l4
	orn	%l2,	%o1,	%i1
	alignaddrl	%l0,	%o7,	%g3
	srl	%g5,	0x0F,	%o4
	fpackfix	%f24,	%f19
	movg	%icc,	%g4,	%o6
	nop
	set	0x30, %g6
	ldsh	[%l7 + %g6],	%l1
	fmovrsgez	%o0,	%f20,	%f20
	edge8	%i6,	%i0,	%o3
	sdiv	%g6,	0x0ED0,	%i2
	fmovdvs	%icc,	%f25,	%f12
	edge16l	%i5,	%o2,	%l5
	fabss	%f16,	%f8
	fpsub16	%f26,	%f30,	%f24
	andn	%g2,	%g7,	%i7
	sth	%o5,	[%l7 + 0x74]
	subc	%i3,	0x17D5,	%i4
	fnegs	%f8,	%f27
	movre	%l3,	%g1,	%l6
	edge32ln	%l2,	%o1,	%i1
	sub	%l4,	%o7,	%g3
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	sub	%l0,	%o6,	%g4
	movn	%xcc,	%o0,	%i6
	edge32n	%l1,	%i0,	%g6
	and	%i2,	%o3,	%o2
	addccc	%i5,	%g2,	%l5
	addc	%i7,	0x05ED,	%g7
	nop
	set	0x59, %g5
	ldub	[%l7 + %g5],	%o5
	edge8n	%i4,	%i3,	%l3
	edge32	%g1,	%l6,	%l2
	stw	%i1,	[%l7 + 0x64]
	movrgez	%o1,	%o7,	%g3
	fxnor	%f20,	%f18,	%f28
	ldx	[%l7 + 0x08],	%g5
	sir	0x028B
	ldx	[%l7 + 0x08],	%o4
	movrlz	%l0,	0x169,	%l4
	fmovscs	%icc,	%f12,	%f8
	fxor	%f0,	%f28,	%f12
	movrgz	%o6,	%o0,	%g4
	edge16	%l1,	%i0,	%g6
	andncc	%i6,	%i2,	%o2
	edge16l	%i5,	%g2,	%l5
	sth	%i7,	[%l7 + 0x32]
	movrgez	%g7,	%o5,	%i4
	orn	%o3,	0x08E7,	%i3
	movn	%xcc,	%l3,	%g1
	fmovsle	%xcc,	%f5,	%f11
	stb	%l6,	[%l7 + 0x41]
	movn	%xcc,	%i1,	%o1
	fand	%f28,	%f28,	%f30
	movrlez	%l2,	0x1FA,	%o7
	sdivx	%g5,	0x0127,	%o4
	ldub	[%l7 + 0x3C],	%g3
	stb	%l0,	[%l7 + 0x72]
	movle	%xcc,	%l4,	%o0
	mova	%icc,	%o6,	%g4
	subc	%l1,	%i0,	%g6
	fmovd	%f2,	%f16
	edge16ln	%i2,	%i6,	%i5
	movpos	%icc,	%o2,	%g2
	or	%i7,	0x059E,	%l5
	fcmpd	%fcc3,	%f28,	%f10
	fmovrse	%g7,	%f3,	%f23
	subccc	%o5,	0x1908,	%o3
	std	%f26,	[%l7 + 0x50]
	array32	%i4,	%i3,	%l3
	alignaddrl	%l6,	%i1,	%g1
	sdiv	%l2,	0x03CE,	%o7
	save %o1, 0x015D, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x0C],	%o4
	smulcc	%g3,	%l4,	%o0
	ldsb	[%l7 + 0x77],	%o6
	andn	%g4,	%l0,	%l1
	fands	%f28,	%f22,	%f21
	lduh	[%l7 + 0x66],	%g6
	fnot2	%f22,	%f10
	xnor	%i2,	%i6,	%i0
	fmul8x16au	%f31,	%f28,	%f28
	sir	0x0038
	add	%o2,	0x1E8D,	%i5
	array32	%g2,	%l5,	%i7
	movge	%icc,	%o5,	%g7
	ldd	[%l7 + 0x78],	%i4
	srl	%i3,	%o3,	%l3
	edge32	%l6,	%g1,	%l2
	sdivx	%o7,	0x02C2,	%o1
	fmovsa	%xcc,	%f21,	%f28
	fmovsneg	%xcc,	%f17,	%f8
	ldsb	[%l7 + 0x16],	%i1
	lduh	[%l7 + 0x62],	%o4
	st	%f20,	[%l7 + 0x0C]
	movpos	%xcc,	%g5,	%g3
	edge32n	%l4,	%o6,	%o0
	sdiv	%l0,	0x1124,	%l1
	edge8ln	%g6,	%i2,	%i6
	array16	%g4,	%i0,	%i5
	fmovdcs	%xcc,	%f2,	%f27
	edge8ln	%o2,	%g2,	%l5
	fabss	%f20,	%f8
	andcc	%o5,	0x08C7,	%g7
	nop
	set	0x15, %o2
	ldsb	[%l7 + %o2],	%i4
	alignaddrl	%i7,	%o3,	%l3
	movl	%icc,	%i3,	%l6
	std	%f4,	[%l7 + 0x70]
	subc	%l2,	0x0E28,	%g1
	fmovrdgz	%o1,	%f10,	%f16
	fmovdleu	%xcc,	%f12,	%f21
	movge	%xcc,	%i1,	%o4
	umul	%o7,	0x0FC9,	%g3
	ldub	[%l7 + 0x50],	%g5
	fmovdcs	%xcc,	%f15,	%f14
	fmovsne	%xcc,	%f6,	%f6
	array8	%l4,	%o0,	%l0
	movne	%xcc,	%o6,	%g6
	movrlez	%l1,	0x38D,	%i2
	fmovse	%icc,	%f11,	%f8
	array8	%i6,	%g4,	%i0
	ldx	[%l7 + 0x28],	%o2
	edge16n	%i5,	%l5,	%o5
	srlx	%g2,	%g7,	%i7
	subccc	%o3,	%l3,	%i4
	edge32ln	%i3,	%l2,	%l6
	nop
	set	0x10, %g3
	ldx	[%l7 + %g3],	%o1
	lduh	[%l7 + 0x3C],	%i1
	srax	%g1,	%o7,	%g3
	movrgz	%g5,	%o4,	%l4
	mulx	%l0,	%o6,	%o0
	xnorcc	%g6,	0x0ACA,	%i2
	edge32ln	%l1,	%i6,	%g4
	addccc	%o2,	0x109F,	%i5
	ldsw	[%l7 + 0x60],	%l5
	ldsb	[%l7 + 0x37],	%i0
	edge16n	%g2,	%g7,	%i7
	stw	%o5,	[%l7 + 0x60]
	fmovdvs	%xcc,	%f19,	%f31
	fmovdpos	%icc,	%f15,	%f14
	movgu	%icc,	%o3,	%l3
	edge32n	%i3,	%i4,	%l6
	ldsw	[%l7 + 0x74],	%l2
	movleu	%icc,	%i1,	%g1
	orcc	%o7,	0x189F,	%g3
	andcc	%g5,	%o1,	%o4
	orncc	%l4,	%o6,	%l0
	umulcc	%o0,	%g6,	%l1
	fmovd	%f10,	%f8
	srl	%i2,	%g4,	%i6
	fmovrdgz	%i5,	%f28,	%f14
	movrlz	%l5,	%o2,	%g2
	movneg	%xcc,	%i0,	%i7
	ldub	[%l7 + 0x67],	%g7
	ldd	[%l7 + 0x48],	%o2
	edge8ln	%o5,	%i3,	%l3
	array8	%i4,	%l6,	%i1
	ldd	[%l7 + 0x38],	%l2
	movre	%g1,	0x1D7,	%o7
	movrne	%g3,	%g5,	%o1
	fpack32	%f22,	%f22,	%f10
	array32	%l4,	%o4,	%l0
	subccc	%o0,	0x0E86,	%g6
	alignaddr	%l1,	%o6,	%g4
	andcc	%i6,	0x1FD4,	%i5
	std	%f30,	[%l7 + 0x10]
	umul	%l5,	%i2,	%g2
	fpack16	%f28,	%f12
	fcmpd	%fcc0,	%f4,	%f20
	save %o2, %i0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i7,	[%l7 + 0x54]
	siam	0x4
	movcc	%xcc,	%o3,	%i3
	srlx	%o5,	0x09,	%i4
	array32	%l6,	%l3,	%i1
	andncc	%g1,	%o7,	%g3
	movgu	%icc,	%g5,	%l2
	movrlez	%l4,	%o4,	%l0
	smulcc	%o1,	%g6,	%l1
	movre	%o0,	%g4,	%i6
	array16	%o6,	%i5,	%i2
	fnot2s	%f15,	%f18
	xor	%l5,	%g2,	%o2
	subcc	%i0,	%g7,	%o3
	ldd	[%l7 + 0x10],	%f28
	sdiv	%i7,	0x1C1F,	%i3
	fmovrsgz	%i4,	%f9,	%f6
	subcc	%l6,	%l3,	%o5
	fmovdvc	%icc,	%f17,	%f21
	ldd	[%l7 + 0x58],	%f6
	fnot1	%f28,	%f8
	movleu	%icc,	%i1,	%g1
	andn	%o7,	%g3,	%l2
	fmovsvs	%icc,	%f29,	%f7
	add	%l4,	0x124E,	%o4
	edge16ln	%l0,	%o1,	%g6
	umulcc	%l1,	%o0,	%g4
	sdivcc	%i6,	0x0867,	%g5
	alignaddr	%o6,	%i5,	%i2
	movg	%icc,	%g2,	%l5
	ldsb	[%l7 + 0x10],	%i0
	sll	%o2,	%o3,	%g7
	orcc	%i7,	0x1DE0,	%i3
	array8	%i4,	%l6,	%o5
	edge8n	%i1,	%g1,	%o7
	ldd	[%l7 + 0x10],	%f4
	add	%l3,	%l2,	%g3
	lduw	[%l7 + 0x34],	%l4
	fandnot2	%f26,	%f14,	%f30
	movvs	%icc,	%o4,	%o1
	addc	%l0,	%g6,	%o0
	movl	%xcc,	%g4,	%l1
	fmovsleu	%icc,	%f13,	%f16
	movrne	%g5,	0x3E7,	%o6
	edge32l	%i5,	%i6,	%g2
	ld	[%l7 + 0x54],	%f5
	movrne	%l5,	0x175,	%i2
	movle	%icc,	%i0,	%o2
	fpackfix	%f4,	%f24
	xnor	%o3,	0x1119,	%i7
	fmovse	%xcc,	%f30,	%f27
	fpsub16s	%f15,	%f25,	%f8
	addccc	%i3,	0x16A8,	%g7
	edge32n	%l6,	%i4,	%o5
	edge16ln	%g1,	%o7,	%l3
	sra	%l2,	0x02,	%i1
	faligndata	%f10,	%f22,	%f18
	umul	%l4,	%g3,	%o1
	sll	%o4,	%l0,	%g6
	smul	%g4,	%l1,	%o0
	sth	%g5,	[%l7 + 0x40]
	array8	%o6,	%i6,	%i5
	array16	%l5,	%i2,	%g2
	fmovdneg	%icc,	%f6,	%f31
	fexpand	%f17,	%f0
	mulx	%o2,	0x00F3,	%i0
	pdist	%f30,	%f12,	%f22
	fnot1	%f18,	%f0
	addccc	%i7,	%o3,	%g7
	fmovsg	%icc,	%f2,	%f27
	stw	%l6,	[%l7 + 0x68]
	srl	%i3,	0x18,	%o5
	srl	%g1,	0x05,	%i4
	movvc	%icc,	%l3,	%l2
	ldd	[%l7 + 0x30],	%i0
	save %o7, 0x0264, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0827,	%l4
	fabsd	%f18,	%f24
	andn	%o4,	0x1A5E,	%o1
	edge16ln	%l0,	%g4,	%l1
	udivx	%o0,	0x17FA,	%g6
	fcmpes	%fcc0,	%f27,	%f2
	fmovrdlez	%o6,	%f16,	%f30
	edge32l	%i6,	%i5,	%l5
	edge16l	%g5,	%i2,	%g2
	restore %i0, 0x0447, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o3,	[%l7 + 0x1C]
	udivx	%g7,	0x15C9,	%i7
	movg	%icc,	%l6,	%i3
	movvs	%xcc,	%o5,	%i4
	edge16n	%l3,	%l2,	%i1
	udivx	%g1,	0x0631,	%o7
	fcmpd	%fcc2,	%f14,	%f22
	edge8l	%l4,	%o4,	%o1
	movcc	%icc,	%l0,	%g3
	movrlz	%g4,	%l1,	%o0
	lduh	[%l7 + 0x20],	%o6
	array8	%g6,	%i5,	%l5
	udiv	%g5,	0x05F9,	%i6
	ldd	[%l7 + 0x40],	%g2
	fmovrdne	%i2,	%f22,	%f4
	edge32l	%i0,	%o2,	%g7
	xnor	%o3,	%i7,	%l6
	ldx	[%l7 + 0x10],	%o5
	fandnot1	%f18,	%f6,	%f10
	udivcc	%i3,	0x0C61,	%i4
	for	%f18,	%f30,	%f8
	alignaddrl	%l2,	%l3,	%g1
	umul	%o7,	0x0337,	%l4
	stx	%o4,	[%l7 + 0x70]
	fcmpgt32	%f0,	%f0,	%o1
	edge16l	%l0,	%g3,	%g4
	movpos	%xcc,	%i1,	%l1
	fpackfix	%f0,	%f24
	movrlz	%o0,	0x28D,	%o6
	movpos	%icc,	%i5,	%l5
	movleu	%xcc,	%g5,	%g6
	movrlz	%i6,	%i2,	%g2
	stb	%i0,	[%l7 + 0x65]
	move	%xcc,	%g7,	%o2
	fmovsn	%icc,	%f26,	%f0
	nop
	set	0x78, %g7
	ldx	[%l7 + %g7],	%i7
	fsrc1	%f2,	%f20
	andncc	%o3,	%l6,	%o5
	edge16n	%i4,	%l2,	%l3
	movle	%icc,	%g1,	%i3
	fmovs	%f29,	%f1
	sll	%o7,	0x14,	%l4
	ldsb	[%l7 + 0x3D],	%o4
	movgu	%xcc,	%l0,	%g3
	edge16l	%o1,	%i1,	%g4
	addccc	%o0,	0x1B7E,	%o6
	movcs	%icc,	%i5,	%l1
	stx	%l5,	[%l7 + 0x38]
	fornot1s	%f22,	%f10,	%f1
	andn	%g6,	0x1098,	%g5
	xorcc	%i6,	%i2,	%i0
	popc	0x0766,	%g2
	movvc	%xcc,	%g7,	%o2
	edge8	%o3,	%i7,	%o5
	movle	%xcc,	%i4,	%l6
	movrlz	%l2,	%l3,	%i3
	ldd	[%l7 + 0x38],	%g0
	edge16n	%l4,	%o4,	%o7
	save %l0, %o1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g4,	%o0
	umulcc	%o6,	%i1,	%l1
	and	%l5,	0x0A07,	%i5
	fpack32	%f18,	%f2,	%f22
	edge16ln	%g6,	%i6,	%g5
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fnot2	%f30,	%f22
	movvc	%icc,	%g7,	%o2
	fmovspos	%xcc,	%f4,	%f30
	ldsh	[%l7 + 0x3E],	%o3
	edge32ln	%g2,	%i7,	%i4
	umul	%o5,	0x1A59,	%l2
	movge	%icc,	%l6,	%l3
	subcc	%g1,	0x01BE,	%l4
	subccc	%i3,	%o4,	%l0
	for	%f0,	%f20,	%f14
	lduh	[%l7 + 0x4A],	%o1
	edge8ln	%g3,	%o7,	%g4
	udivcc	%o0,	0x1D37,	%o6
	xnorcc	%i1,	%l1,	%l5
	fmovdneg	%icc,	%f10,	%f10
	movg	%icc,	%i5,	%g6
	orn	%g5,	%i6,	%i2
	smulcc	%i0,	0x005C,	%o2
	edge16	%o3,	%g2,	%g7
	sir	0x1FF2
	addcc	%i4,	0x06C9,	%o5
	orcc	%l2,	0x054C,	%i7
	stw	%l3,	[%l7 + 0x74]
	ldsw	[%l7 + 0x4C],	%l6
	edge16ln	%l4,	%i3,	%g1
	smul	%l0,	%o4,	%g3
	edge8	%o7,	%o1,	%o0
	sethi	0x15B0,	%o6
	fcmpd	%fcc3,	%f8,	%f12
	udivx	%g4,	0x0EE8,	%i1
	movcs	%icc,	%l5,	%l1
	fpmerge	%f10,	%f23,	%f16
	st	%f26,	[%l7 + 0x30]
	edge16l	%g6,	%g5,	%i6
	edge32	%i5,	%i0,	%i2
	sth	%o3,	[%l7 + 0x64]
	srlx	%o2,	%g7,	%g2
	pdist	%f4,	%f8,	%f4
	sethi	0x15AC,	%o5
	movre	%i4,	%i7,	%l3
	movgu	%icc,	%l2,	%l4
	restore %l6, %g1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o4,	0x0D1B,	%g3
	edge32	%o7,	%o1,	%o0
	xorcc	%l0,	0x1AE1,	%o6
	xnor	%g4,	%i1,	%l1
	udivx	%l5,	0x01A9,	%g5
	srl	%i6,	0x19,	%i5
	movrlez	%i0,	%g6,	%o3
	movrlz	%i2,	0x182,	%o2
	stw	%g7,	[%l7 + 0x60]
	movl	%xcc,	%o5,	%g2
	lduw	[%l7 + 0x48],	%i4
	fabsd	%f20,	%f4
	sra	%i7,	0x1D,	%l3
	fmovrse	%l4,	%f23,	%f1
	edge16l	%l2,	%g1,	%i3
	movge	%icc,	%o4,	%g3
	sub	%o7,	%l6,	%o1
	fzero	%f30
	fmovsle	%icc,	%f8,	%f11
	fmovsn	%icc,	%f2,	%f3
	addc	%o0,	%o6,	%l0
	or	%i1,	0x18B4,	%l1
	srlx	%g4,	0x12,	%g5
	movle	%xcc,	%l5,	%i6
	udiv	%i0,	0x1FDD,	%g6
	orcc	%i5,	%o3,	%o2
	array16	%g7,	%o5,	%g2
	edge32l	%i4,	%i2,	%i7
	andn	%l3,	%l2,	%l4
	stw	%i3,	[%l7 + 0x74]
	udivcc	%o4,	0x1746,	%g1
	fpadd16s	%f8,	%f1,	%f26
	fmovrdlz	%o7,	%f16,	%f28
	udivx	%g3,	0x1A62,	%o1
	ldx	[%l7 + 0x28],	%o0
	fmovrdne	%o6,	%f6,	%f26
	fmovsne	%icc,	%f24,	%f1
	mulscc	%l0,	%l6,	%i1
	fcmple16	%f10,	%f16,	%g4
	edge32	%g5,	%l1,	%l5
	movneg	%icc,	%i0,	%g6
	fnot1	%f30,	%f16
	umulcc	%i5,	0x0885,	%i6
	umul	%o3,	%o2,	%o5
	array32	%g7,	%g2,	%i4
	sllx	%i2,	0x18,	%i7
	bshuffle	%f6,	%f2,	%f4
	ldd	[%l7 + 0x58],	%f2
	movvc	%icc,	%l3,	%l4
	movrne	%l2,	0x179,	%o4
	nop
	set	0x54, %i6
	lduh	[%l7 + %i6],	%i3
	edge16l	%o7,	%g3,	%g1
	fmovdle	%icc,	%f13,	%f28
	stb	%o1,	[%l7 + 0x33]
	and	%o6,	%l0,	%o0
	edge16	%i1,	%g4,	%l6
	fmovsl	%xcc,	%f9,	%f14
	fmovdpos	%xcc,	%f20,	%f30
	fmovdneg	%xcc,	%f22,	%f3
	movre	%l1,	%l5,	%i0
	fpsub16	%f4,	%f22,	%f18
	fzeros	%f12
	fnors	%f23,	%f11,	%f6
	nop
	set	0x20, %g2
	ldsw	[%l7 + %g2],	%g6
	addccc	%g5,	%i5,	%o3
	sethi	0x00E1,	%o2
	lduw	[%l7 + 0x20],	%i6
	srlx	%o5,	%g2,	%g7
	orcc	%i4,	0x05F3,	%i7
	srax	%l3,	0x00,	%i2
	udiv	%l2,	0x093B,	%l4
	movre	%i3,	0x12C,	%o4
	orncc	%o7,	%g1,	%o1
	edge32l	%g3,	%l0,	%o6
	fmovsl	%icc,	%f7,	%f20
	fnot2s	%f1,	%f3
	edge32ln	%o0,	%i1,	%l6
	fandnot1	%f18,	%f30,	%f24
	sdiv	%g4,	0x1CF3,	%l5
	movgu	%icc,	%l1,	%i0
	ldsh	[%l7 + 0x28],	%g5
	fmovrdne	%g6,	%f12,	%f4
	movg	%icc,	%i5,	%o3
	srl	%o2,	%i6,	%o5
	movn	%xcc,	%g2,	%i4
	fsrc1	%f26,	%f10
	edge16n	%i7,	%l3,	%i2
	fpsub32	%f22,	%f4,	%f6
	umulcc	%g7,	0x09D2,	%l2
	movl	%icc,	%l4,	%o4
	or	%i3,	%g1,	%o7
	movrgz	%o1,	0x108,	%g3
	for	%f20,	%f16,	%f12
	xorcc	%l0,	%o6,	%o0
	ldsw	[%l7 + 0x3C],	%l6
	edge16n	%g4,	%l5,	%l1
	movg	%icc,	%i1,	%g5
	orn	%i0,	0x0F72,	%g6
	stx	%o3,	[%l7 + 0x38]
	ldsb	[%l7 + 0x21],	%o2
	xorcc	%i6,	%i5,	%g2
	edge8ln	%o5,	%i4,	%l3
	ldsh	[%l7 + 0x5A],	%i2
	movrgez	%i7,	0x299,	%g7
	fandnot2s	%f16,	%f14,	%f14
	ldsb	[%l7 + 0x3A],	%l2
	ldsb	[%l7 + 0x43],	%l4
	fpackfix	%f16,	%f20
	edge32l	%i3,	%o4,	%o7
	ld	[%l7 + 0x58],	%f15
	movgu	%icc,	%o1,	%g3
	movre	%l0,	0x095,	%o6
	andncc	%g1,	%l6,	%o0
	movpos	%icc,	%l5,	%l1
	sth	%i1,	[%l7 + 0x38]
	edge32ln	%g5,	%g4,	%i0
	addc	%o3,	%g6,	%o2
	edge16l	%i5,	%i6,	%g2
	ld	[%l7 + 0x48],	%f17
	ldsh	[%l7 + 0x18],	%o5
	std	%f30,	[%l7 + 0x20]
	xnorcc	%i4,	0x02A4,	%i2
	ld	[%l7 + 0x0C],	%f15
	fsrc1s	%f0,	%f6
	andn	%i7,	0x1262,	%l3
	array16	%l2,	%g7,	%l4
	fsrc1	%f24,	%f2
	movn	%icc,	%i3,	%o7
	std	%f8,	[%l7 + 0x40]
	sub	%o4,	0x0DE2,	%o1
	move	%icc,	%l0,	%o6
	ld	[%l7 + 0x1C],	%f7
	addcc	%g3,	%l6,	%g1
	movleu	%xcc,	%o0,	%l1
	movpos	%icc,	%i1,	%l5
	fnands	%f25,	%f23,	%f18
	movrgez	%g5,	%i0,	%o3
	edge8l	%g4,	%o2,	%g6
	subcc	%i5,	0x181D,	%g2
	fandnot2s	%f19,	%f12,	%f30
	sth	%i6,	[%l7 + 0x70]
	fnand	%f16,	%f0,	%f4
	movrne	%i4,	%o5,	%i2
	edge8n	%i7,	%l3,	%g7
	sdivx	%l2,	0x001B,	%i3
	edge32n	%l4,	%o7,	%o4
	move	%icc,	%o1,	%o6
	movne	%xcc,	%g3,	%l0
	srl	%l6,	%o0,	%g1
	edge16	%l1,	%l5,	%g5
	sethi	0x0696,	%i1
	fmovrse	%i0,	%f18,	%f28
	alignaddr	%o3,	%o2,	%g4
	srlx	%g6,	%i5,	%g2
	movrgez	%i6,	%o5,	%i4
	lduw	[%l7 + 0x34],	%i7
	fnegs	%f9,	%f29
	movl	%xcc,	%i2,	%g7
	stb	%l2,	[%l7 + 0x55]
	ld	[%l7 + 0x18],	%f8
	ldd	[%l7 + 0x28],	%l2
	stb	%i3,	[%l7 + 0x71]
	lduh	[%l7 + 0x24],	%o7
	fmovsg	%icc,	%f22,	%f6
	mulscc	%l4,	0x1F38,	%o1
	ldsw	[%l7 + 0x3C],	%o6
	movn	%xcc,	%g3,	%o4
	udivcc	%l0,	0x09A8,	%l6
	add	%o0,	%l1,	%g1
	fzero	%f14
	movrgz	%g5,	0x0A5,	%l5
	umul	%i0,	0x10A8,	%o3
	ldsb	[%l7 + 0x59],	%o2
	ld	[%l7 + 0x60],	%f4
	fmovrdne	%i1,	%f24,	%f6
	movcs	%icc,	%g6,	%g4
	alignaddr	%g2,	%i6,	%o5
	fpack32	%f8,	%f12,	%f12
	udivx	%i4,	0x0B31,	%i7
	fornot1s	%f10,	%f28,	%f19
	edge32n	%i2,	%g7,	%l2
	sth	%i5,	[%l7 + 0x28]
	movvc	%xcc,	%i3,	%l3
	udiv	%l4,	0x0A18,	%o7
	edge8n	%o1,	%g3,	%o6
	xnor	%o4,	%l6,	%l0
	stb	%o0,	[%l7 + 0x74]
	movcs	%xcc,	%l1,	%g5
	fmovdne	%xcc,	%f13,	%f12
	edge16n	%g1,	%l5,	%i0
	movle	%xcc,	%o2,	%i1
	or	%o3,	%g6,	%g4
	ldd	[%l7 + 0x40],	%g2
	fone	%f2
	ldsw	[%l7 + 0x68],	%i6
	udivx	%i4,	0x006C,	%o5
	movle	%xcc,	%i2,	%g7
	mulscc	%i7,	%i5,	%i3
	alignaddrl	%l3,	%l4,	%o7
	ldd	[%l7 + 0x20],	%o0
	fnegs	%f9,	%f25
	xorcc	%l2,	0x0DDA,	%o6
	std	%f12,	[%l7 + 0x78]
	edge16ln	%g3,	%l6,	%o4
	movrlez	%o0,	%l0,	%g5
	movgu	%icc,	%g1,	%l5
	fmovdpos	%icc,	%f18,	%f11
	xnor	%l1,	%i0,	%o2
	fmovrse	%o3,	%f3,	%f9
	sethi	0x11EF,	%i1
	movg	%xcc,	%g4,	%g6
	nop
	set	0x28, %i3
	stx	%i6,	[%l7 + %i3]
	edge16l	%i4,	%g2,	%i2
	add	%o5,	0x0BFA,	%g7
	movle	%xcc,	%i5,	%i3
	fmovsvc	%xcc,	%f27,	%f5
	add	%i7,	%l3,	%l4
	movneg	%xcc,	%o1,	%o7
	fxors	%f29,	%f1,	%f7
	movne	%icc,	%o6,	%g3
	add	%l2,	%o4,	%o0
	fmovsle	%icc,	%f0,	%f11
	movleu	%icc,	%l0,	%l6
	movne	%xcc,	%g5,	%l5
	udivx	%g1,	0x0DE9,	%l1
	sdivx	%i0,	0x0A75,	%o3
	stx	%o2,	[%l7 + 0x60]
	nop
	set	0x38, %i0
	ldsh	[%l7 + %i0],	%i1
	ldsh	[%l7 + 0x24],	%g4
	lduw	[%l7 + 0x14],	%g6
	ldd	[%l7 + 0x68],	%i4
	addccc	%g2,	0x0B15,	%i6
	stx	%i2,	[%l7 + 0x78]
	fmovrdlez	%o5,	%f8,	%f12
	movrlz	%g7,	0x0B3,	%i5
	udivx	%i3,	0x0D6E,	%l3
	fmul8x16	%f17,	%f6,	%f26
	fpack32	%f30,	%f16,	%f24
	addc	%l4,	0x1C86,	%o1
	ldsb	[%l7 + 0x1B],	%o7
	ldsw	[%l7 + 0x54],	%o6
	movrlz	%g3,	0x28D,	%l2
	array32	%i7,	%o4,	%o0
	sdiv	%l6,	0x0C0C,	%l0
	add	%l5,	%g1,	%l1
	fnot2	%f16,	%f14
	st	%f7,	[%l7 + 0x34]
	fcmps	%fcc3,	%f5,	%f9
	srax	%g5,	%i0,	%o2
	fandnot1	%f2,	%f2,	%f10
	movcc	%xcc,	%o3,	%i1
	orcc	%g4,	%i4,	%g6
	lduh	[%l7 + 0x16],	%g2
	movvc	%icc,	%i6,	%i2
	movrgz	%g7,	0x19B,	%o5
	fmovdle	%xcc,	%f9,	%f13
	fmovsa	%xcc,	%f23,	%f8
	movrlz	%i3,	%l3,	%l4
	fmovsg	%icc,	%f21,	%f2
	fsrc1	%f18,	%f22
	ldsb	[%l7 + 0x6A],	%i5
	fmovsge	%xcc,	%f17,	%f15
	sethi	0x1C13,	%o1
	sdivcc	%o6,	0x0166,	%o7
	edge8ln	%g3,	%i7,	%l2
	fxors	%f12,	%f3,	%f24
	array8	%o4,	%l6,	%l0
	fnegd	%f28,	%f26
	move	%xcc,	%o0,	%l5
	movrgz	%g1,	0x3CB,	%g5
	stw	%l1,	[%l7 + 0x50]
	andcc	%i0,	%o3,	%o2
	xnor	%g4,	0x0E26,	%i4
	addccc	%g6,	0x1E6D,	%i1
	edge16ln	%i6,	%g2,	%i2
	ld	[%l7 + 0x60],	%f3
	fpadd16s	%f26,	%f21,	%f29
	orn	%g7,	%o5,	%l3
	alignaddrl	%i3,	%i5,	%l4
	move	%icc,	%o6,	%o7
	fnot1s	%f11,	%f28
	ldsb	[%l7 + 0x66],	%o1
	udiv	%g3,	0x0C46,	%i7
	ld	[%l7 + 0x34],	%f30
	mulscc	%l2,	0x12F9,	%o4
	mova	%xcc,	%l6,	%o0
	movre	%l5,	%g1,	%l0
	fmovsn	%icc,	%f22,	%f15
	mulx	%l1,	0x14EA,	%g5
	fornot2	%f4,	%f28,	%f6
	mulscc	%i0,	%o2,	%o3
	movrgz	%g4,	%i4,	%i1
	movneg	%icc,	%g6,	%g2
	movn	%xcc,	%i6,	%i2
	sth	%o5,	[%l7 + 0x4E]
	fnors	%f12,	%f23,	%f20
	ldsh	[%l7 + 0x52],	%l3
	ldub	[%l7 + 0x26],	%i3
	fone	%f22
	edge8ln	%i5,	%l4,	%g7
	faligndata	%f12,	%f10,	%f4
	sdivcc	%o7,	0x0D8D,	%o6
	xor	%o1,	0x1ECB,	%i7
	movrne	%l2,	0x33C,	%o4
	add	%g3,	0x17F6,	%l6
	stw	%l5,	[%l7 + 0x6C]
	movrgez	%o0,	0x3B1,	%l0
	alignaddrl	%g1,	%l1,	%g5
	subc	%o2,	0x014A,	%i0
	edge16n	%g4,	%i4,	%i1
	orcc	%o3,	0x1353,	%g2
	movrgz	%g6,	%i2,	%i6
	xnor	%l3,	%i3,	%o5
	sdivcc	%l4,	0x0C9A,	%g7
	movcc	%icc,	%o7,	%i5
	alignaddr	%o1,	%o6,	%i7
	sra	%o4,	0x03,	%l2
	fsrc2s	%f9,	%f25
	fsrc1	%f30,	%f16
	andcc	%g3,	%l6,	%l5
	faligndata	%f24,	%f6,	%f4
	std	%f12,	[%l7 + 0x28]
	ldsw	[%l7 + 0x3C],	%o0
	fpsub32	%f26,	%f26,	%f22
	st	%f14,	[%l7 + 0x5C]
	lduw	[%l7 + 0x0C],	%g1
	movne	%icc,	%l1,	%l0
	edge8	%g5,	%o2,	%i0
	movn	%icc,	%i4,	%i1
	srlx	%g4,	%o3,	%g6
	udivcc	%g2,	0x1A33,	%i6
	stb	%i2,	[%l7 + 0x0D]
	movvs	%xcc,	%i3,	%l3
	movre	%o5,	0x197,	%g7
	nop
	set	0x38, %o3
	stx	%l4,	[%l7 + %o3]
	andcc	%o7,	0x014E,	%o1
	fmovdle	%xcc,	%f1,	%f30
	edge16l	%o6,	%i7,	%i5
	std	%f30,	[%l7 + 0x30]
	fpack32	%f26,	%f14,	%f16
	popc	0x17E6,	%l2
	edge32l	%g3,	%l6,	%l5
	movvs	%xcc,	%o0,	%o4
	ldx	[%l7 + 0x08],	%g1
	ldsh	[%l7 + 0x6C],	%l0
	mulscc	%g5,	0x151C,	%o2
	fnegd	%f20,	%f16
	sdivx	%l1,	0x137F,	%i4
	fcmps	%fcc3,	%f22,	%f13
	array8	%i0,	%i1,	%g4
	smul	%g6,	%o3,	%i6
	ldd	[%l7 + 0x48],	%f10
	alignaddr	%i2,	%g2,	%i3
	andncc	%o5,	%l3,	%l4
	ldub	[%l7 + 0x34],	%g7
	edge32ln	%o7,	%o6,	%i7
	movgu	%xcc,	%i5,	%o1
	sra	%g3,	%l6,	%l2
	fzeros	%f12
	movge	%xcc,	%o0,	%o4
	srl	%g1,	%l5,	%g5
	sllx	%o2,	0x1E,	%l0
	movne	%icc,	%i4,	%l1
	srlx	%i1,	0x17,	%i0
	fmovdle	%xcc,	%f7,	%f20
	mova	%xcc,	%g4,	%g6
	movpos	%icc,	%i6,	%i2
	smulcc	%g2,	%o3,	%i3
	lduh	[%l7 + 0x6E],	%l3
	st	%f29,	[%l7 + 0x54]
	xnorcc	%l4,	0x0F58,	%g7
	alignaddrl	%o5,	%o7,	%i7
	sdivcc	%o6,	0x1264,	%i5
	addccc	%g3,	0x058A,	%o1
	sethi	0x1D93,	%l6
	edge16	%o0,	%o4,	%g1
	stx	%l5,	[%l7 + 0x20]
	fcmpgt32	%f22,	%f10,	%l2
	fmovrsne	%o2,	%f14,	%f6
	fmul8x16al	%f22,	%f28,	%f2
	movrne	%g5,	0x379,	%i4
	fcmpne16	%f26,	%f26,	%l1
	and	%i1,	%i0,	%g4
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	edge32n	%i2,	%g6,	%g2
	fmovdneg	%icc,	%f29,	%f10
	movrgz	%i3,	0x3D4,	%o3
	sllx	%l3,	0x0E,	%g7
	edge16n	%l4,	%o5,	%o7
	ldx	[%l7 + 0x50],	%o6
	edge8n	%i7,	%g3,	%i5
	edge8n	%l6,	%o1,	%o0
	fpadd16	%f6,	%f2,	%f0
	stx	%o4,	[%l7 + 0x40]
	ldd	[%l7 + 0x70],	%l4
	fmovdgu	%xcc,	%f10,	%f18
	smulcc	%l2,	%o2,	%g5
	mova	%xcc,	%i4,	%g1
	ldub	[%l7 + 0x56],	%i1
	edge16n	%l1,	%i0,	%g4
	restore %l0, 0x0F60, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i6,	%g6,	%g2
	fornot2	%f4,	%f0,	%f10
	lduw	[%l7 + 0x74],	%o3
	ld	[%l7 + 0x34],	%f20
	movn	%xcc,	%l3,	%i3
	lduw	[%l7 + 0x18],	%l4
	sth	%o5,	[%l7 + 0x12]
	fcmpes	%fcc1,	%f24,	%f31
	fsrc2	%f10,	%f28
	sth	%o7,	[%l7 + 0x18]
	ldub	[%l7 + 0x1D],	%g7
	ldsb	[%l7 + 0x26],	%i7
	addc	%g3,	0x15E6,	%o6
	ldub	[%l7 + 0x5A],	%l6
	orn	%i5,	0x0EB6,	%o0
	fnors	%f19,	%f2,	%f10
	movrgez	%o4,	0x367,	%l5
	movg	%icc,	%o1,	%l2
	sdiv	%o2,	0x12E9,	%g5
	movvs	%icc,	%i4,	%i1
	movpos	%xcc,	%g1,	%l1
	sll	%g4,	%l0,	%i2
	movrgz	%i6,	%g6,	%g2
	edge32l	%i0,	%l3,	%o3
	edge16l	%l4,	%o5,	%i3
	edge32	%g7,	%o7,	%i7
	edge8ln	%g3,	%o6,	%i5
	sth	%l6,	[%l7 + 0x16]
	sdivcc	%o0,	0x109F,	%l5
	array32	%o4,	%o1,	%o2
	andn	%l2,	%g5,	%i1
	ld	[%l7 + 0x44],	%f27
	edge16n	%g1,	%l1,	%g4
	fmovrse	%i4,	%f14,	%f14
	sllx	%l0,	%i2,	%g6
	stb	%g2,	[%l7 + 0x63]
	andcc	%i0,	%l3,	%i6
	subc	%o3,	%l4,	%o5
	fnand	%f30,	%f20,	%f12
	sethi	0x11C8,	%i3
	sub	%g7,	0x0F62,	%i7
	edge16	%o7,	%g3,	%o6
	popc	%i5,	%l6
	movge	%xcc,	%l5,	%o0
	edge32	%o4,	%o1,	%o2
	xorcc	%g5,	0x03AA,	%i1
	fmovdpos	%icc,	%f24,	%f11
	movrne	%g1,	0x26D,	%l2
	stb	%g4,	[%l7 + 0x26]
	movneg	%icc,	%l1,	%i4
	edge16ln	%i2,	%g6,	%g2
	ldsw	[%l7 + 0x08],	%i0
	smulcc	%l0,	%l3,	%i6
	ldd	[%l7 + 0x58],	%f8
	st	%f30,	[%l7 + 0x7C]
	sll	%l4,	0x16,	%o5
	movneg	%icc,	%i3,	%o3
	movpos	%xcc,	%g7,	%i7
	edge32n	%g3,	%o7,	%o6
	movrne	%l6,	%l5,	%i5
	fmovdcs	%xcc,	%f14,	%f2
	xorcc	%o0,	0x1A66,	%o4
	addcc	%o1,	%g5,	%i1
	orn	%g1,	%o2,	%l2
	umul	%g4,	%i4,	%l1
	std	%f20,	[%l7 + 0x20]
	edge8l	%i2,	%g6,	%i0
	orn	%g2,	%l3,	%i6
	xnor	%l0,	0x094C,	%o5
	edge8l	%i3,	%o3,	%l4
	ldsb	[%l7 + 0x7F],	%g7
	sub	%g3,	0x0C53,	%i7
	edge32	%o7,	%o6,	%l5
	ldub	[%l7 + 0x68],	%i5
	movcs	%xcc,	%l6,	%o0
	fmovrdne	%o1,	%f0,	%f18
	sdivcc	%o4,	0x1404,	%i1
	fsrc2	%f22,	%f20
	sth	%g1,	[%l7 + 0x44]
	edge16l	%o2,	%l2,	%g5
	movcs	%icc,	%g4,	%i4
	lduw	[%l7 + 0x14],	%i2
	movrgz	%g6,	%i0,	%l1
	umulcc	%g2,	0x0D82,	%i6
	ldd	[%l7 + 0x28],	%f6
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	subcc	%o3,	%l4,	%i3
	fandnot1	%f18,	%f16,	%f30
	save %g7, %g3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o7,	%o6,	%l5
	movn	%xcc,	%l6,	%o0
	sth	%i5,	[%l7 + 0x48]
	edge16	%o4,	%i1,	%o1
	popc	0x1CF5,	%o2
	fmovdge	%xcc,	%f30,	%f0
	fmovrde	%l2,	%f10,	%f20
	sir	0x0EA4
	movrgez	%g1,	%g5,	%i4
	edge16n	%i2,	%g6,	%i0
	alignaddr	%g4,	%g2,	%i6
	fsrc2	%f26,	%f22
	array32	%l0,	%l1,	%l3
	fnands	%f23,	%f13,	%f30
	edge8ln	%o3,	%o5,	%l4
	fpack32	%f28,	%f28,	%f10
	stw	%i3,	[%l7 + 0x48]
	sra	%g3,	%i7,	%o7
	xorcc	%o6,	%g7,	%l5
	stw	%o0,	[%l7 + 0x1C]
	addccc	%i5,	0x1885,	%o4
	std	%f24,	[%l7 + 0x10]
	edge8n	%l6,	%o1,	%i1
	edge32ln	%l2,	%g1,	%o2
	alignaddrl	%i4,	%g5,	%i2
	udivx	%i0,	0x0AB2,	%g6
	addccc	%g4,	%i6,	%l0
	fpadd32	%f12,	%f12,	%f20
	fnot1s	%f2,	%f28
	subcc	%g2,	%l1,	%l3
	ldsw	[%l7 + 0x24],	%o5
	array16	%o3,	%i3,	%l4
	edge16ln	%i7,	%o7,	%o6
	mulx	%g7,	%g3,	%o0
	udivcc	%l5,	0x0FEA,	%o4
	edge32l	%i5,	%l6,	%i1
	movrgz	%l2,	%o1,	%g1
	smul	%i4,	0x1A11,	%o2
	ldsb	[%l7 + 0x36],	%i2
	movle	%icc,	%g5,	%i0
	movrlz	%g6,	0x2C7,	%g4
	edge32n	%i6,	%l0,	%l1
	edge16n	%l3,	%o5,	%g2
	movrgez	%i3,	0x09C,	%l4
	movrgz	%o3,	%i7,	%o7
	smulcc	%g7,	%o6,	%g3
	fand	%f12,	%f8,	%f0
	fmovsl	%xcc,	%f13,	%f10
	fmovdpos	%xcc,	%f11,	%f5
	fmovsgu	%xcc,	%f16,	%f28
	fpackfix	%f10,	%f22
	xnorcc	%o0,	%o4,	%i5
	subccc	%l6,	0x18F4,	%i1
	fors	%f17,	%f23,	%f29
	srlx	%l2,	%l5,	%o1
	sethi	0x05D7,	%i4
	orncc	%g1,	0x0119,	%i2
	nop
	set	0x54, %o6
	stb	%g5,	[%l7 + %o6]
	sllx	%i0,	0x14,	%o2
	sdiv	%g4,	0x155E,	%i6
	fsrc1	%f18,	%f8
	fmovrse	%l0,	%f22,	%f12
	edge8l	%g6,	%l3,	%o5
	fmovdvc	%icc,	%f14,	%f0
	movg	%icc,	%l1,	%i3
	subcc	%g2,	0x07B5,	%o3
	fnands	%f22,	%f17,	%f30
	stw	%l4,	[%l7 + 0x38]
	movrgez	%o7,	0x04D,	%g7
	srlx	%i7,	%o6,	%g3
	subccc	%o0,	0x1175,	%o4
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%i4
	sethi	0x0B8B,	%i1
	array8	%l2,	%l5,	%o1
	edge8n	%l6,	%g1,	%i2
	movrlz	%i4,	%g5,	%i0
	edge16ln	%g4,	%i6,	%o2
	edge32n	%g6,	%l0,	%l3
	std	%f30,	[%l7 + 0x20]
	stw	%o5,	[%l7 + 0x08]
	stw	%i3,	[%l7 + 0x34]
	movne	%icc,	%g2,	%l1
	movne	%xcc,	%l4,	%o7
	fnors	%f26,	%f29,	%f5
	sub	%g7,	%o3,	%o6
	xnorcc	%g3,	0x04F8,	%i7
	movrlez	%o0,	0x3CD,	%i5
	or	%i1,	0x06DB,	%l2
	andncc	%l5,	%o4,	%o1
	edge16n	%g1,	%i2,	%l6
	array32	%i4,	%i0,	%g4
	subcc	%i6,	0x0CA2,	%g5
	movrne	%o2,	%l0,	%g6
	movrgz	%o5,	0x145,	%l3
	sdivx	%g2,	0x1980,	%i3
	fnot2s	%f15,	%f11
	edge8	%l4,	%l1,	%o7
	fnot2s	%f5,	%f15
	fsrc1s	%f2,	%f25
	movcs	%icc,	%o3,	%o6
	fpadd32s	%f31,	%f25,	%f29
	umul	%g3,	0x0A6F,	%g7
	subccc	%o0,	0x053C,	%i7
	udivx	%i1,	0x03FF,	%i5
	edge16l	%l5,	%o4,	%o1
	fnot1s	%f31,	%f27
	sub	%g1,	0x09B4,	%l2
	movre	%i2,	0x289,	%l6
	lduh	[%l7 + 0x0A],	%i0
	sll	%i4,	%g4,	%g5
	fpmerge	%f25,	%f21,	%f4
	ldd	[%l7 + 0x28],	%f24
	umul	%i6,	0x0A88,	%o2
	ldub	[%l7 + 0x1D],	%g6
	mulx	%l0,	%l3,	%o5
	alignaddrl	%g2,	%i3,	%l4
	movrlz	%o7,	%l1,	%o6
	restore %o3, 0x0362, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%o0,	%g3
	smulcc	%i7,	%i5,	%l5
	fnot1s	%f7,	%f10
	fmovdn	%xcc,	%f26,	%f28
	alignaddr	%o4,	%o1,	%g1
	lduh	[%l7 + 0x7C],	%l2
	fpadd16s	%f10,	%f11,	%f19
	movleu	%xcc,	%i1,	%i2
	movrlz	%l6,	0x1AD,	%i4
	fexpand	%f20,	%f16
	udivcc	%g4,	0x0B4D,	%g5
	fmovdvs	%xcc,	%f8,	%f18
	fpsub32	%f22,	%f28,	%f20
	addccc	%i6,	0x11AB,	%o2
	mulx	%i0,	0x02E4,	%g6
	movpos	%icc,	%l3,	%o5
	fmovsge	%icc,	%f0,	%f18
	fmovdcc	%icc,	%f2,	%f29
	movrgz	%g2,	%l0,	%i3
	sethi	0x01A8,	%l4
	subccc	%o7,	0x05DC,	%l1
	edge16l	%o6,	%g7,	%o3
	sdiv	%o0,	0x075B,	%g3
	fcmpeq16	%f18,	%f6,	%i7
	nop
	set	0x0C, %i1
	sth	%i5,	[%l7 + %i1]
	fmovrsne	%l5,	%f20,	%f23
	mulx	%o1,	0x1545,	%o4
	andn	%g1,	0x1174,	%l2
	or	%i2,	0x1E0D,	%l6
	subcc	%i1,	%i4,	%g5
	ldd	[%l7 + 0x38],	%f10
	sra	%i6,	%o2,	%i0
	addccc	%g4,	0x1766,	%g6
	ldd	[%l7 + 0x30],	%f16
	add	%l3,	0x0C03,	%g2
	mulx	%o5,	0x1C17,	%i3
	movvs	%icc,	%l4,	%o7
	edge32l	%l0,	%l1,	%o6
	movrlz	%o3,	0x1B9,	%o0
	edge16n	%g7,	%i7,	%g3
	fmovdvs	%icc,	%f23,	%f7
	ldub	[%l7 + 0x3D],	%i5
	movcc	%xcc,	%l5,	%o4
	move	%xcc,	%g1,	%l2
	sll	%i2,	%o1,	%l6
	movpos	%icc,	%i4,	%i1
	orcc	%i6,	0x07DD,	%g5
	fornot2	%f30,	%f4,	%f2
	fmul8x16au	%f19,	%f12,	%f28
	fmovde	%icc,	%f12,	%f17
	move	%xcc,	%o2,	%g4
	fmovrsgz	%i0,	%f30,	%f2
	fandnot2	%f22,	%f12,	%f16
	ldd	[%l7 + 0x68],	%g6
	orncc	%g2,	0x174F,	%o5
	lduw	[%l7 + 0x4C],	%i3
	movneg	%xcc,	%l4,	%l3
	fmovspos	%xcc,	%f1,	%f21
	edge8n	%o7,	%l0,	%l1
	ldx	[%l7 + 0x70],	%o6
	edge16n	%o0,	%o3,	%g7
	movn	%xcc,	%i7,	%g3
	movneg	%xcc,	%l5,	%o4
	edge16l	%i5,	%l2,	%g1
	std	%f2,	[%l7 + 0x20]
	fmovspos	%xcc,	%f11,	%f3
	xorcc	%o1,	0x08E8,	%i2
	sub	%l6,	0x0098,	%i4
	srl	%i1,	0x15,	%g5
	addc	%o2,	0x02F6,	%g4
	movre	%i0,	%i6,	%g2
	st	%f21,	[%l7 + 0x78]
	edge16n	%g6,	%o5,	%l4
	fmovrslez	%i3,	%f23,	%f28
	mulx	%o7,	0x1947,	%l0
	xnorcc	%l1,	0x146F,	%o6
	movgu	%xcc,	%o0,	%l3
	addcc	%g7,	0x128E,	%o3
	andcc	%i7,	0x0471,	%l5
	umul	%g3,	%i5,	%l2
	movge	%icc,	%o4,	%o1
	nop
	set	0x6F, %i2
	ldsb	[%l7 + %i2],	%i2
	fmul8x16	%f9,	%f16,	%f8
	xnorcc	%g1,	0x16F2,	%i4
	edge32	%l6,	%i1,	%o2
	fmovdge	%xcc,	%f22,	%f19
	andncc	%g5,	%i0,	%i6
	stw	%g2,	[%l7 + 0x14]
	fmovrdgez	%g4,	%f8,	%f24
	and	%g6,	0x17D1,	%l4
	movneg	%xcc,	%o5,	%i3
	fmovda	%icc,	%f14,	%f22
	movneg	%xcc,	%o7,	%l0
	movne	%xcc,	%o6,	%l1
	srl	%l3,	0x0E,	%o0
	umulcc	%g7,	0x085F,	%o3
	orcc	%l5,	%i7,	%g3
	array8	%l2,	%i5,	%o1
	srax	%o4,	0x03,	%i2
	edge32n	%i4,	%g1,	%i1
	ldd	[%l7 + 0x60],	%f30
	sra	%l6,	%g5,	%o2
	sdivx	%i6,	0x1B86,	%i0
	edge32n	%g4,	%g2,	%g6
	movcc	%xcc,	%o5,	%l4
	movn	%icc,	%o7,	%l0
	movcc	%icc,	%o6,	%i3
	ldd	[%l7 + 0x20],	%l0
	umulcc	%l3,	0x1C3A,	%g7
	movge	%icc,	%o0,	%o3
	array32	%i7,	%l5,	%l2
	ldd	[%l7 + 0x28],	%f6
	sdivcc	%g3,	0x00CA,	%i5
	edge8	%o1,	%o4,	%i4
	stx	%i2,	[%l7 + 0x20]
	mulx	%i1,	%l6,	%g1
	srax	%g5,	%i6,	%i0
	st	%f25,	[%l7 + 0x34]
	movcc	%xcc,	%o2,	%g2
	movl	%xcc,	%g4,	%o5
	fxor	%f12,	%f26,	%f16
	movpos	%xcc,	%l4,	%g6
	andcc	%o7,	0x1959,	%l0
	fxor	%f0,	%f24,	%f14
	xor	%i3,	%o6,	%l1
	fmovsg	%xcc,	%f1,	%f24
	fnot1	%f12,	%f26
	fmovsg	%icc,	%f24,	%f28
	sub	%g7,	0x1FD8,	%o0
	fcmpeq32	%f18,	%f12,	%o3
	smul	%i7,	0x1667,	%l5
	ldsb	[%l7 + 0x32],	%l3
	movvc	%xcc,	%l2,	%i5
	movrlz	%g3,	0x2CA,	%o4
	movvs	%icc,	%o1,	%i2
	subcc	%i1,	0x05CF,	%l6
	fors	%f17,	%f9,	%f7
	fmovscs	%icc,	%f16,	%f6
	movpos	%xcc,	%g1,	%g5
	fmovsge	%icc,	%f8,	%f11
	movvs	%xcc,	%i6,	%i4
	sub	%o2,	%i0,	%g2
	sra	%g4,	0x1B,	%o5
	fmovd	%f18,	%f30
	fxnors	%f10,	%f2,	%f3
	movn	%xcc,	%l4,	%g6
	xnorcc	%o7,	%l0,	%o6
	fpack32	%f10,	%f2,	%f0
	fmovrslez	%i3,	%f26,	%f18
	xor	%g7,	0x06B6,	%o0
	fcmpeq32	%f22,	%f16,	%o3
	fmovsg	%xcc,	%f30,	%f24
	movn	%icc,	%l1,	%l5
	movl	%xcc,	%l3,	%i7
	mova	%xcc,	%i5,	%l2
	sub	%g3,	0x0432,	%o1
	fpsub32s	%f29,	%f1,	%f27
	fnand	%f12,	%f28,	%f8
	fcmple32	%f8,	%f28,	%o4
	smulcc	%i2,	%i1,	%l6
	addcc	%g1,	%g5,	%i6
	lduw	[%l7 + 0x30],	%o2
	fsrc1s	%f19,	%f21
	alignaddrl	%i0,	%i4,	%g2
	sth	%g4,	[%l7 + 0x2C]
	fnand	%f12,	%f4,	%f16
	movrgz	%l4,	%o5,	%o7
	subc	%g6,	0x061C,	%l0
	popc	0x0B0B,	%o6
	save %g7, %i3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o3,	%l5
	fmovrdlz	%l3,	%f24,	%f26
	and	%i7,	%l1,	%l2
	array32	%i5,	%o1,	%o4
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	ldub	[%l7 + 0x5C],	%l6
	stx	%g1,	[%l7 + 0x40]
	andncc	%g5,	%i6,	%i2
	fandnot1	%f10,	%f0,	%f18
	fmovsle	%icc,	%f9,	%f28
	movvs	%xcc,	%o2,	%i4
	subc	%g2,	%i0,	%l4
	movpos	%xcc,	%o5,	%g4
	xorcc	%o7,	%l0,	%o6
	sethi	0x0C1E,	%g7
	stb	%g6,	[%l7 + 0x2D]
	movcs	%xcc,	%i3,	%o0
	edge32l	%l5,	%l3,	%o3
	ldx	[%l7 + 0x60],	%l1
	fmovrdne	%i7,	%f8,	%f10
	edge16l	%l2,	%i5,	%o1
	lduw	[%l7 + 0x48],	%g3
	sdivx	%i1,	0x0D6F,	%o4
	edge32	%l6,	%g1,	%g5
	fcmpne32	%f8,	%f26,	%i2
	smulcc	%o2,	0x1039,	%i4
	array8	%g2,	%i6,	%i0
	fnot2	%f20,	%f20
	subc	%o5,	%l4,	%g4
	std	%f28,	[%l7 + 0x50]
	alignaddr	%l0,	%o7,	%o6
	sub	%g7,	%i3,	%g6
	movvc	%icc,	%o0,	%l3
	sdiv	%l5,	0x097F,	%o3
	fandnot2s	%f15,	%f16,	%f6
	movg	%xcc,	%i7,	%l1
	array16	%i5,	%o1,	%l2
	nop
	set	0x60, %i4
	stx	%i1,	[%l7 + %i4]
	movle	%icc,	%o4,	%g3
	ldsh	[%l7 + 0x7C],	%l6
	udivx	%g5,	0x17B0,	%i2
	sth	%o2,	[%l7 + 0x40]
	andncc	%g1,	%i4,	%g2
	ldx	[%l7 + 0x38],	%i6
	mulscc	%o5,	0x1053,	%l4
	movvs	%xcc,	%g4,	%i0
	umul	%o7,	%o6,	%g7
	movcc	%xcc,	%i3,	%l0
	movcc	%xcc,	%o0,	%l3
	array32	%l5,	%o3,	%i7
	st	%f2,	[%l7 + 0x44]
	mulscc	%l1,	0x182C,	%g6
	ldd	[%l7 + 0x08],	%f0
	edge32	%i5,	%o1,	%i1
	ldsh	[%l7 + 0x10],	%l2
	stw	%g3,	[%l7 + 0x50]
	sub	%l6,	%g5,	%o4
	udiv	%i2,	0x12D6,	%o2
	movneg	%xcc,	%i4,	%g2
	subc	%g1,	%i6,	%o5
	movn	%xcc,	%g4,	%l4
	array32	%i0,	%o7,	%o6
	sra	%i3,	%l0,	%o0
	ld	[%l7 + 0x14],	%f9
	fandnot1	%f16,	%f20,	%f22
	movne	%xcc,	%g7,	%l3
	sethi	0x0D25,	%o3
	move	%icc,	%i7,	%l1
	xnor	%g6,	%i5,	%l5
	ldsw	[%l7 + 0x4C],	%o1
	movl	%icc,	%i1,	%g3
	movn	%xcc,	%l2,	%l6
	udiv	%g5,	0x06F9,	%i2
	movleu	%icc,	%o4,	%o2
	sth	%i4,	[%l7 + 0x2C]
	addcc	%g1,	0x0F13,	%i6
	srax	%o5,	%g4,	%l4
	movvc	%xcc,	%g2,	%o7
	fone	%f28
	sra	%o6,	0x0A,	%i0
	fmovdcc	%xcc,	%f23,	%f3
	smulcc	%i3,	0x13F7,	%l0
	ld	[%l7 + 0x24],	%f0
	smulcc	%o0,	%g7,	%o3
	sub	%l3,	%l1,	%g6
	fxnor	%f2,	%f0,	%f4
	movvc	%icc,	%i7,	%i5
	udivx	%o1,	0x0106,	%l5
	bshuffle	%f0,	%f2,	%f24
	array8	%i1,	%l2,	%g3
	movpos	%xcc,	%l6,	%i2
	subccc	%g5,	%o4,	%o2
	xor	%i4,	%i6,	%g1
	array16	%g4,	%l4,	%o5
	fors	%f0,	%f30,	%f19
	fabsd	%f4,	%f12
	fandnot1	%f24,	%f16,	%f12
	movl	%xcc,	%o7,	%g2
	udivx	%o6,	0x0241,	%i3
	st	%f26,	[%l7 + 0x3C]
	xor	%l0,	0x1120,	%i0
	sir	0x154E
	movge	%icc,	%g7,	%o3
	smulcc	%l3,	%l1,	%o0
	edge8n	%g6,	%i5,	%o1
	fsrc2	%f24,	%f18
	movl	%icc,	%i7,	%l5
	movcs	%icc,	%i1,	%l2
	fxnor	%f20,	%f14,	%f10
	fmovrsne	%g3,	%f0,	%f21
	umulcc	%i2,	%l6,	%o4
	movn	%xcc,	%g5,	%i4
	edge16	%o2,	%i6,	%g1
	orn	%l4,	0x1CAB,	%g4
	ldd	[%l7 + 0x40],	%o6
	faligndata	%f22,	%f16,	%f4
	edge8n	%g2,	%o5,	%o6
	srl	%l0,	0x10,	%i3
	array8	%g7,	%o3,	%l3
	array32	%i0,	%l1,	%g6
	ldd	[%l7 + 0x10],	%f14
	edge16n	%i5,	%o0,	%o1
	subccc	%i7,	%i1,	%l5
	ldd	[%l7 + 0x28],	%l2
	movrlez	%g3,	0x3A8,	%i2
	ld	[%l7 + 0x18],	%f7
	array32	%o4,	%g5,	%i4
	orcc	%o2,	%i6,	%g1
	sll	%l6,	0x06,	%l4
	movrne	%o7,	0x1C9,	%g2
	save %o5, %g4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l0,	0x108F,	%g7
	st	%f5,	[%l7 + 0x0C]
	fmovsvs	%xcc,	%f18,	%f5
	sub	%i3,	0x1F25,	%o3
	fmovrdlez	%l3,	%f0,	%f8
	andcc	%l1,	%g6,	%i5
	movgu	%icc,	%i0,	%o1
	alignaddr	%i7,	%o0,	%l5
	movrgez	%i1,	%l2,	%i2
	edge16ln	%g3,	%g5,	%o4
	addcc	%i4,	0x041A,	%i6
	sub	%g1,	%o2,	%l4
	fmovdcs	%icc,	%f5,	%f25
	nop
	set	0x78, %l6
	ldx	[%l7 + %l6],	%l6
	udivcc	%g2,	0x1823,	%o7
	sll	%g4,	%o6,	%o5
	movvc	%xcc,	%g7,	%l0
	subc	%o3,	%l3,	%l1
	fmovscc	%icc,	%f10,	%f5
	fabsd	%f8,	%f10
	sdiv	%g6,	0x0261,	%i5
	srlx	%i0,	%o1,	%i3
	movn	%xcc,	%o0,	%i7
	sdiv	%l5,	0x181B,	%l2
	mulx	%i2,	0x1B32,	%i1
	fcmpgt16	%f26,	%f12,	%g5
	movvs	%xcc,	%o4,	%g3
	movne	%icc,	%i4,	%g1
	fpackfix	%f22,	%f19
	ldsh	[%l7 + 0x1A],	%i6
	edge32	%o2,	%l4,	%g2
	stb	%l6,	[%l7 + 0x0C]
	ldsb	[%l7 + 0x2C],	%g4
	popc	%o7,	%o6
	sra	%g7,	0x05,	%l0
	edge8ln	%o5,	%l3,	%l1
	ldd	[%l7 + 0x18],	%g6
	subc	%o3,	%i0,	%o1
	movneg	%icc,	%i3,	%i5
	movn	%xcc,	%i7,	%o0
	fandnot2s	%f7,	%f18,	%f12
	sra	%l5,	0x0F,	%i2
	ldub	[%l7 + 0x3C],	%i1
	and	%l2,	%o4,	%g3
	movcc	%xcc,	%i4,	%g1
	mulx	%i6,	%o2,	%g5
	lduh	[%l7 + 0x58],	%g2
	move	%icc,	%l4,	%g4
	udivcc	%l6,	0x0949,	%o6
	sllx	%g7,	0x14,	%l0
	movvc	%icc,	%o5,	%o7
	movle	%xcc,	%l1,	%g6
	mulscc	%l3,	%o3,	%o1
	stx	%i3,	[%l7 + 0x18]
	sethi	0x1520,	%i0
	movne	%icc,	%i7,	%o0
	movrlz	%l5,	0x2DD,	%i2
	lduh	[%l7 + 0x0E],	%i5
	andncc	%l2,	%i1,	%o4
	movvs	%icc,	%g3,	%i4
	pdist	%f16,	%f24,	%f28
	fmovrsgz	%i6,	%f27,	%f10
	edge16	%g1,	%g5,	%o2
	array8	%l4,	%g2,	%g4
	fxors	%f22,	%f2,	%f12
	fpack32	%f18,	%f6,	%f26
	movrgz	%l6,	0x0C9,	%o6
	smul	%g7,	%l0,	%o7
	ldx	[%l7 + 0x50],	%o5
	fmul8x16	%f22,	%f6,	%f24
	edge32ln	%g6,	%l1,	%o3
	fmovdcs	%icc,	%f30,	%f3
	movl	%icc,	%l3,	%i3
	fmovs	%f30,	%f10
	fpack16	%f14,	%f15
	movpos	%xcc,	%o1,	%i0
	fmovdvc	%icc,	%f27,	%f16
	fmovdle	%icc,	%f15,	%f10
	fmovspos	%xcc,	%f3,	%f31
	movg	%icc,	%o0,	%l5
	movge	%xcc,	%i2,	%i5
	smulcc	%i7,	0x158E,	%i1
	addcc	%o4,	0x090F,	%l2
	smulcc	%g3,	%i6,	%g1
	umulcc	%i4,	0x1505,	%g5
	move	%icc,	%o2,	%g2
	edge8n	%l4,	%l6,	%o6
	sra	%g7,	%l0,	%o7
	movcs	%icc,	%o5,	%g6
	srl	%g4,	0x05,	%o3
	edge8	%l1,	%i3,	%o1
	movrgez	%i0,	0x064,	%l3
	fmovs	%f13,	%f25
	fzeros	%f13
	movrlz	%l5,	0x0D8,	%i2
	sdiv	%o0,	0x048A,	%i5
	for	%f0,	%f26,	%f2
	fpsub32	%f12,	%f8,	%f8
	nop
	set	0x1C, %o5
	sth	%i1,	[%l7 + %o5]
	mulscc	%o4,	%i7,	%g3
	movpos	%icc,	%l2,	%g1
	fmovsa	%icc,	%f5,	%f5
	edge32l	%i4,	%i6,	%o2
	smulcc	%g2,	%g5,	%l6
	movl	%xcc,	%o6,	%l4
	edge8	%g7,	%o7,	%l0
	save %o5, 0x0E76, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o3,	%l1,	%g6
	subc	%i3,	%i0,	%o1
	add	%l3,	%l5,	%o0
	orn	%i5,	%i1,	%o4
	movpos	%icc,	%i7,	%g3
	movrlz	%i2,	0x05F,	%g1
	movg	%icc,	%i4,	%l2
	andcc	%i6,	%g2,	%g5
	edge16n	%l6,	%o2,	%l4
	movleu	%icc,	%o6,	%g7
	array16	%l0,	%o7,	%o5
	fpadd16	%f18,	%f12,	%f2
	fpadd32s	%f22,	%f23,	%f1
	fcmple32	%f30,	%f4,	%g4
	edge8n	%o3,	%g6,	%i3
	srax	%l1,	%o1,	%i0
	fnot2s	%f11,	%f10
	addcc	%l3,	0x1541,	%l5
	ldsh	[%l7 + 0x1C],	%o0
	subc	%i5,	%i1,	%o4
	fcmpd	%fcc0,	%f4,	%f14
	stx	%i7,	[%l7 + 0x50]
	fmovsneg	%xcc,	%f13,	%f20
	andcc	%i2,	0x06DA,	%g3
	ldsw	[%l7 + 0x68],	%i4
	fones	%f25
	sth	%l2,	[%l7 + 0x52]
	subcc	%i6,	%g1,	%g5
	movcs	%icc,	%g2,	%l6
	fnot2s	%f7,	%f12
	ldd	[%l7 + 0x28],	%o2
	movge	%xcc,	%o6,	%g7
	addc	%l0,	%o7,	%o5
	fmul8x16	%f3,	%f2,	%f16
	movn	%icc,	%g4,	%l4
	movge	%xcc,	%g6,	%o3
	fmovsg	%icc,	%f8,	%f17
	orncc	%i3,	0x0E82,	%l1
	fmovdgu	%icc,	%f7,	%f28
	movrgez	%o1,	0x06B,	%i0
	orcc	%l3,	%o0,	%l5
	std	%f12,	[%l7 + 0x40]
	edge32	%i1,	%o4,	%i5
	ldub	[%l7 + 0x13],	%i2
	edge8	%g3,	%i7,	%i4
	and	%i6,	%g1,	%l2
	smulcc	%g5,	0x1205,	%g2
	edge16l	%l6,	%o6,	%o2
	sth	%l0,	[%l7 + 0x2A]
	fmovscc	%xcc,	%f6,	%f8
	stx	%g7,	[%l7 + 0x58]
	edge32ln	%o7,	%o5,	%g4
	fnors	%f15,	%f1,	%f1
	udivcc	%l4,	0x0AF9,	%g6
	sth	%i3,	[%l7 + 0x1C]
	fcmpgt32	%f10,	%f18,	%l1
	mulscc	%o3,	0x0CFB,	%o1
	edge8n	%i0,	%o0,	%l5
	stw	%l3,	[%l7 + 0x64]
	st	%f27,	[%l7 + 0x1C]
	addccc	%i1,	0x10BB,	%i5
	mulscc	%i2,	0x10DF,	%g3
	movn	%xcc,	%o4,	%i7
	ldsb	[%l7 + 0x10],	%i6
	movn	%xcc,	%i4,	%g1
	movrne	%l2,	0x1BD,	%g5
	fmovsn	%xcc,	%f20,	%f22
	sdivx	%g2,	0x0433,	%o6
	srax	%l6,	%l0,	%o2
	movpos	%icc,	%o7,	%o5
	movle	%xcc,	%g7,	%g4
	orn	%l4,	0x019B,	%g6
	fpmerge	%f3,	%f22,	%f18
	edge32l	%i3,	%o3,	%o1
	sub	%i0,	0x19E2,	%l1
	ldub	[%l7 + 0x21],	%o0
	movrgez	%l5,	0x0EC,	%l3
	and	%i5,	%i1,	%g3
	sll	%i2,	%i7,	%i6
	fmovrdgz	%o4,	%f24,	%f8
	fmovrdlz	%i4,	%f2,	%f16
	array16	%l2,	%g1,	%g5
	sth	%o6,	[%l7 + 0x6E]
	sth	%l6,	[%l7 + 0x54]
	orcc	%g2,	0x1DCA,	%l0
	fpmerge	%f29,	%f0,	%f30
	smulcc	%o7,	%o5,	%o2
	and	%g7,	0x0916,	%g4
	orncc	%g6,	0x0B4E,	%i3
	lduw	[%l7 + 0x68],	%o3
	movcc	%xcc,	%l4,	%i0
	movg	%xcc,	%o1,	%o0
	ldd	[%l7 + 0x70],	%l4
	lduw	[%l7 + 0x50],	%l1
	alignaddrl	%l3,	%i5,	%i1
	fpadd32s	%f16,	%f1,	%f27
	and	%g3,	%i2,	%i6
	sllx	%i7,	%o4,	%i4
	ldd	[%l7 + 0x30],	%f14
	movvc	%xcc,	%g1,	%l2
	ld	[%l7 + 0x1C],	%f19
	ldub	[%l7 + 0x28],	%g5
	edge16l	%o6,	%l6,	%g2
	fmovda	%icc,	%f13,	%f23
	udivx	%o7,	0x0F1D,	%l0
	fmovscs	%xcc,	%f28,	%f13
	fmovde	%icc,	%f6,	%f10
	movcc	%icc,	%o2,	%g7
	edge8l	%o5,	%g4,	%g6
	edge8	%i3,	%l4,	%o3
	sub	%i0,	0x1F77,	%o0
	nop
	set	0x30, %g4
	ldd	[%l7 + %g4],	%l4
	array16	%l1,	%l3,	%i5
	fpsub32s	%f29,	%f6,	%f9
	movvs	%xcc,	%o1,	%g3
	fpsub16s	%f19,	%f2,	%f23
	ldsw	[%l7 + 0x54],	%i1
	sllx	%i2,	0x1E,	%i6
	smul	%i7,	0x184E,	%i4
	orn	%o4,	0x11B3,	%l2
	fmovdneg	%xcc,	%f29,	%f21
	fornot1s	%f8,	%f21,	%f15
	for	%f14,	%f0,	%f20
	orncc	%g5,	0x0722,	%o6
	ldsb	[%l7 + 0x63],	%l6
	lduw	[%l7 + 0x34],	%g2
	edge8	%g1,	%l0,	%o7
	ldx	[%l7 + 0x70],	%o2
	udivx	%g7,	0x02FB,	%o5
	mulx	%g4,	0x045C,	%g6
	fsrc2s	%f12,	%f15
	pdist	%f8,	%f22,	%f22
	std	%f28,	[%l7 + 0x78]
	movg	%icc,	%l4,	%o3
	ldx	[%l7 + 0x38],	%i3
	fmovspos	%icc,	%f22,	%f26
	fmovdneg	%xcc,	%f0,	%f10
	fcmpeq32	%f10,	%f12,	%i0
	fmovdg	%xcc,	%f0,	%f8
	srlx	%o0,	0x18,	%l1
	edge8n	%l5,	%i5,	%l3
	xor	%o1,	0x0BCE,	%i1
	fnot1s	%f16,	%f26
	smulcc	%g3,	0x1D95,	%i2
	sub	%i6,	0x06F2,	%i7
	fxors	%f9,	%f15,	%f23
	orcc	%o4,	%l2,	%i4
	ld	[%l7 + 0x1C],	%f18
	edge16n	%o6,	%l6,	%g5
	fmovrdlz	%g1,	%f4,	%f14
	fabss	%f1,	%f0
	std	%f10,	[%l7 + 0x48]
	move	%xcc,	%g2,	%o7
	xorcc	%o2,	0x1721,	%l0
	array16	%o5,	%g4,	%g6
	sub	%l4,	0x120D,	%o3
	fpmerge	%f10,	%f4,	%f18
	xor	%g7,	%i0,	%o0
	lduw	[%l7 + 0x68],	%i3
	fpadd16s	%f26,	%f13,	%f25
	ldub	[%l7 + 0x18],	%l1
	fmovrsgz	%i5,	%f27,	%f30
	ldsw	[%l7 + 0x0C],	%l3
	movcs	%xcc,	%l5,	%o1
	edge16l	%i1,	%i2,	%i6
	orn	%i7,	%g3,	%l2
	smul	%o4,	%o6,	%l6
	edge32l	%i4,	%g1,	%g5
	ldsw	[%l7 + 0x44],	%g2
	movne	%icc,	%o7,	%o2
	subcc	%l0,	0x1C65,	%g4
	sdivx	%o5,	0x121E,	%g6
	movl	%xcc,	%l4,	%o3
	fxnor	%f22,	%f18,	%f22
	movrlz	%g7,	%o0,	%i3
	stx	%l1,	[%l7 + 0x78]
	movgu	%xcc,	%i5,	%i0
	movgu	%xcc,	%l5,	%l3
	movge	%icc,	%o1,	%i1
	addccc	%i6,	0x0E0F,	%i7
	andcc	%g3,	%i2,	%o4
	save %o6, %l2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f24,	%f29
	fmovrse	%l6,	%f19,	%f7
	movrlez	%g1,	0x271,	%g2
	stw	%g5,	[%l7 + 0x68]
	movvc	%icc,	%o2,	%o7
	edge8ln	%g4,	%l0,	%g6
	fnor	%f30,	%f10,	%f14
	andn	%o5,	0x135C,	%o3
	udivcc	%l4,	0x0CC0,	%o0
	sir	0x0C3E
	ldx	[%l7 + 0x68],	%g7
	xnor	%l1,	0x0087,	%i3
	movle	%xcc,	%i0,	%i5
	movn	%icc,	%l5,	%l3
	udiv	%i1,	0x06B9,	%o1
	movne	%xcc,	%i6,	%i7
	fnor	%f6,	%f4,	%f30
	movg	%xcc,	%g3,	%i2
	ldsw	[%l7 + 0x20],	%o6
	alignaddrl	%o4,	%l2,	%i4
	edge16	%g1,	%g2,	%g5
	save %l6, %o7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g4,	%l0,	%g6
	mulx	%o5,	%o3,	%o0
	addcc	%l4,	%g7,	%l1
	movpos	%xcc,	%i3,	%i5
	move	%xcc,	%l5,	%l3
	sra	%i0,	%i1,	%i6
	fmovdcs	%xcc,	%f26,	%f10
	fmovdle	%xcc,	%f31,	%f20
	umul	%o1,	%g3,	%i2
	movn	%xcc,	%o6,	%o4
	orcc	%l2,	0x19AD,	%i7
	stx	%i4,	[%l7 + 0x78]
	fpadd32	%f14,	%f4,	%f18
	subccc	%g2,	%g5,	%g1
	save %o7, %l6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f30,	%f16,	%f19
	move	%xcc,	%g4,	%l0
	st	%f13,	[%l7 + 0x08]
	umul	%g6,	0x1393,	%o5
	array8	%o3,	%o0,	%g7
	movre	%l1,	0x078,	%i3
	udiv	%i5,	0x0E2C,	%l4
	movgu	%icc,	%l3,	%i0
	movle	%icc,	%i1,	%i6
	fmovdn	%xcc,	%f18,	%f9
	xor	%l5,	0x1D99,	%g3
	ldub	[%l7 + 0x3F],	%i2
	sll	%o6,	0x1E,	%o1
	xnorcc	%o4,	%l2,	%i4
	fcmpeq32	%f16,	%f14,	%g2
	fmovdvc	%icc,	%f15,	%f10
	xnor	%g5,	0x1EAE,	%i7
	udivcc	%o7,	0x108B,	%l6
	movcc	%icc,	%g1,	%g4
	xorcc	%l0,	%g6,	%o5
	xor	%o2,	0x0325,	%o0
	sethi	0x1269,	%g7
	std	%f30,	[%l7 + 0x78]
	umulcc	%o3,	0x16B1,	%i3
	restore %i5, %l1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i0,	0x0A45,	%i1
	ldsb	[%l7 + 0x29],	%l4
	movrgz	%i6,	0x0BF,	%l5
	orncc	%g3,	0x0347,	%i2
	popc	%o6,	%o4
	edge32n	%l2,	%o1,	%i4
	movl	%icc,	%g2,	%i7
	mova	%xcc,	%g5,	%o7
	andcc	%g1,	0x0C00,	%l6
	udiv	%g4,	0x0DEB,	%g6
	fone	%f12
	alignaddr	%l0,	%o2,	%o0
	ldsw	[%l7 + 0x38],	%o5
	xorcc	%g7,	0x1584,	%i3
	save %i5, %l1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f12,	%f28,	%l3
	sll	%i1,	0x0E,	%l4
	edge8	%i0,	%i6,	%g3
	fcmped	%fcc2,	%f24,	%f30
	fornot2	%f28,	%f2,	%f16
	sllx	%i2,	%l5,	%o4
	ldsh	[%l7 + 0x72],	%o6
	movrlez	%l2,	0x2B8,	%o1
	movgu	%icc,	%i4,	%i7
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	udiv	%l6,	0x03A1,	%g1
	st	%f14,	[%l7 + 0x4C]
	movrne	%g4,	%g6,	%l0
	movcc	%xcc,	%o2,	%o5
	restore %o0, %g7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i5,	%o3,	%l1
	fandnot1	%f20,	%f4,	%f22
	umulcc	%l3,	%l4,	%i1
	orcc	%i0,	0x0AAA,	%i6
	movg	%xcc,	%g3,	%i2
	bshuffle	%f26,	%f26,	%f16
	sdivcc	%o4,	0x0437,	%o6
	nop
	set	0x22, %o7
	ldsh	[%l7 + %o7],	%l5
	siam	0x3
	lduh	[%l7 + 0x60],	%l2
	umul	%i4,	%o1,	%i7
	and	%o7,	%g5,	%l6
	nop
	set	0x28, %l1
	ldub	[%l7 + %l1],	%g1
	edge32	%g2,	%g4,	%g6
	xor	%o2,	0x0340,	%o5
	edge32	%l0,	%g7,	%i3
	fnand	%f18,	%f2,	%f6
	ld	[%l7 + 0x44],	%f25
	save %o0, %o3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%l3,	%f12,	%f28
	movcc	%icc,	%l4,	%i1
	xnor	%i0,	%i6,	%g3
	st	%f15,	[%l7 + 0x58]
	movvs	%xcc,	%l1,	%i2
	fmovdcc	%xcc,	%f11,	%f18
	movrne	%o4,	0x21B,	%l5
	subc	%o6,	%l2,	%o1
	sir	0x1065
	addcc	%i4,	%i7,	%o7
	fone	%f26
	bshuffle	%f28,	%f8,	%f14
	lduw	[%l7 + 0x1C],	%l6
	smul	%g1,	0x1E81,	%g5
	ldsb	[%l7 + 0x2E],	%g2
	stb	%g6,	[%l7 + 0x61]
	orncc	%o2,	0x0CCB,	%g4
	fmovrde	%o5,	%f2,	%f10
	alignaddrl	%g7,	%i3,	%l0
	movcc	%icc,	%o3,	%i5
	movcs	%icc,	%l3,	%o0
	sth	%i1,	[%l7 + 0x5C]
	addccc	%l4,	%i0,	%i6
	sra	%g3,	%l1,	%i2
	fmovdle	%xcc,	%f19,	%f16
	movre	%o4,	%o6,	%l5
	addc	%o1,	%l2,	%i7
	move	%xcc,	%o7,	%l6
	mulx	%i4,	%g5,	%g1
	stw	%g6,	[%l7 + 0x28]
	umulcc	%g2,	%o2,	%g4
	sir	0x0C6A
	sir	0x1C12
	smul	%o5,	%i3,	%g7
	fpsub16s	%f4,	%f16,	%f1
	or	%o3,	%i5,	%l0
	fcmpne32	%f6,	%f26,	%o0
	save %l3, 0x1779, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x58, %l2
	std	%f14,	[%l7 + %l2]
	ldub	[%l7 + 0x69],	%i0
	stb	%i6,	[%l7 + 0x56]
	orn	%g3,	0x0E60,	%l4
	udiv	%i2,	0x0C04,	%o4
	mova	%icc,	%l1,	%l5
	ldsb	[%l7 + 0x52],	%o6
	sdivx	%l2,	0x1014,	%o1
	edge32l	%o7,	%l6,	%i7
	fcmpgt32	%f14,	%f0,	%g5
	ldd	[%l7 + 0x78],	%f26
	edge8	%i4,	%g1,	%g2
	srax	%g6,	0x10,	%o2
	srax	%o5,	0x15,	%g4
	movge	%icc,	%g7,	%i3
	fmovscc	%icc,	%f9,	%f26
	std	%f28,	[%l7 + 0x38]
	sdivx	%i5,	0x16BD,	%o3
	ldd	[%l7 + 0x40],	%f16
	srl	%o0,	0x18,	%l3
	umul	%i1,	%i0,	%l0
	udivcc	%g3,	0x1857,	%i6
	fmovdcc	%xcc,	%f8,	%f28
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	nop
	set	0x09, %l4
	stb	%l1,	[%l7 + %l4]
	xorcc	%o4,	0x175A,	%l5
	subc	%l2,	0x0FF6,	%o6
	edge16l	%o7,	%l6,	%i7
	fsrc1s	%f3,	%f27
	udivcc	%o1,	0x12E1,	%g5
	fnegd	%f12,	%f28
	fmovdvc	%icc,	%f29,	%f24
	smul	%g1,	0x05D8,	%i4
	sub	%g6,	0x0239,	%o2
	umul	%o5,	%g2,	%g4
	umul	%g7,	0x156C,	%i5
	edge32n	%i3,	%o3,	%o0
	movne	%xcc,	%i1,	%l3
	andcc	%l0,	0x1CD1,	%i0
	fpack16	%f14,	%f3
	xnorcc	%g3,	%i6,	%i2
	smul	%l4,	%l1,	%o4
	andn	%l2,	0x05BB,	%o6
	udiv	%o7,	0x1084,	%l5
	sir	0x01AE
	umul	%l6,	0x097A,	%i7
	fandnot2	%f18,	%f16,	%f6
	ldub	[%l7 + 0x67],	%g5
	subc	%g1,	%i4,	%g6
	fmul8sux16	%f12,	%f2,	%f2
	edge16ln	%o2,	%o1,	%g2
	fornot1s	%f19,	%f16,	%f5
	xor	%o5,	%g7,	%g4
	popc	%i3,	%i5
	srax	%o0,	0x01,	%o3
	fnot1	%f8,	%f28
	sethi	0x0453,	%l3
	movrlez	%i1,	%l0,	%i0
	edge16n	%g3,	%i6,	%i2
	edge8	%l1,	%l4,	%o4
	edge32l	%l2,	%o6,	%l5
	andn	%l6,	%i7,	%o7
	xorcc	%g5,	%g1,	%g6
	movrgez	%o2,	0x0E3,	%o1
	fors	%f3,	%f15,	%f30
	srl	%g2,	0x13,	%i4
	orncc	%o5,	%g7,	%g4
	siam	0x7
	fmuld8ulx16	%f1,	%f4,	%f2
	movre	%i3,	0x25D,	%i5
	movle	%xcc,	%o0,	%l3
	xor	%o3,	0x1E5D,	%i1
	udivcc	%l0,	0x14B9,	%i0
	fmovda	%icc,	%f0,	%f28
	edge8ln	%i6,	%g3,	%l1
	sdivcc	%l4,	0x17AE,	%o4
	sdiv	%i2,	0x1DC5,	%o6
	ldx	[%l7 + 0x28],	%l5
	popc	%l2,	%l6
	smulcc	%o7,	%g5,	%i7
	fmovdl	%icc,	%f15,	%f14
	andncc	%g6,	%o2,	%g1
	move	%xcc,	%g2,	%i4
	movrlez	%o5,	0x037,	%o1
	fmovsg	%xcc,	%f9,	%f5
	movpos	%icc,	%g4,	%i3
	alignaddrl	%i5,	%g7,	%l3
	movrlez	%o3,	%i1,	%o0
	fors	%f30,	%f23,	%f22
	movpos	%icc,	%i0,	%l0
	udiv	%g3,	0x1A9C,	%l1
	ldd	[%l7 + 0x78],	%i6
	subc	%l4,	%i2,	%o4
	orn	%l5,	0x15EB,	%o6
	movcc	%icc,	%l2,	%o7
	edge8n	%g5,	%i7,	%l6
	udivx	%o2,	0x0F04,	%g6
	ldd	[%l7 + 0x78],	%f6
	fmovde	%icc,	%f23,	%f31
	ldsw	[%l7 + 0x68],	%g1
	orcc	%i4,	0x1DB2,	%o5
	fmul8x16al	%f27,	%f1,	%f18
	edge8n	%g2,	%o1,	%i3
	fands	%f28,	%f1,	%f27
	and	%g4,	0x1ACB,	%g7
	movrgz	%l3,	0x1A4,	%o3
	subc	%i5,	0x0897,	%o0
	fmovrsne	%i1,	%f18,	%f16
	save %l0, 0x00E5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g3,	%i6,	%l1
	fmovscc	%xcc,	%f13,	%f27
	movrlz	%l4,	0x299,	%o4
	edge32l	%i2,	%l5,	%l2
	subccc	%o7,	%o6,	%g5
	srlx	%i7,	%l6,	%o2
	edge8ln	%g6,	%g1,	%o5
	movrlz	%g2,	%i4,	%i3
	addccc	%o1,	0x0C4E,	%g7
	movne	%xcc,	%l3,	%o3
	fmul8ulx16	%f30,	%f6,	%f10
	orncc	%g4,	0x1195,	%i5
	sdiv	%i1,	0x118F,	%o0
	udivx	%l0,	0x0BA4,	%i0
	stx	%i6,	[%l7 + 0x70]
	udivx	%g3,	0x095B,	%l1
	siam	0x6
	movre	%o4,	0x0DB,	%l4
	ldsw	[%l7 + 0x3C],	%i2
	sdivx	%l5,	0x0388,	%o7
	movge	%icc,	%l2,	%o6
	fmovdvs	%icc,	%f6,	%f14
	fmul8ulx16	%f24,	%f16,	%f4
	umulcc	%g5,	0x05DD,	%l6
	umul	%i7,	0x01F9,	%o2
	sra	%g1,	%o5,	%g6
	fxors	%f26,	%f27,	%f2
	fnot2s	%f19,	%f21
	addccc	%g2,	%i4,	%i3
	fmovrdne	%g7,	%f6,	%f22
	fmovrsne	%l3,	%f30,	%f19
	movrne	%o3,	%o1,	%i5
	lduw	[%l7 + 0x44],	%g4
	edge16l	%i1,	%o0,	%l0
	fmovse	%icc,	%f15,	%f16
	addccc	%i6,	0x0110,	%i0
	srax	%g3,	0x0A,	%l1
	and	%o4,	0x1245,	%l4
	fmovdvs	%xcc,	%f16,	%f13
	addccc	%l5,	0x0B3E,	%i2
	sdiv	%l2,	0x1F23,	%o6
	addccc	%o7,	%g5,	%l6
	fnors	%f26,	%f10,	%f27
	sethi	0x1DEE,	%i7
	edge32ln	%g1,	%o5,	%g6
	st	%f19,	[%l7 + 0x48]
	restore %g2, %i4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x1F61,	%l3
	or	%g7,	0x1204,	%o3
	movrne	%o1,	0x36F,	%g4
	stb	%i1,	[%l7 + 0x57]
	fmovse	%icc,	%f0,	%f14
	edge32	%i5,	%o0,	%l0
	movvs	%icc,	%i0,	%g3
	movgu	%icc,	%i6,	%l1
	fxnor	%f24,	%f4,	%f16
	edge8	%l4,	%l5,	%i2
	ldsh	[%l7 + 0x22],	%o4
	edge32l	%l2,	%o7,	%o6
	addc	%l6,	0x06A2,	%g5
	edge8	%i7,	%o5,	%g6
	subccc	%g1,	0x1598,	%i4
	umul	%g2,	0x0785,	%o2
	array16	%l3,	%i3,	%o3
	fmuld8sux16	%f18,	%f22,	%f0
	orcc	%g7,	0x0F0B,	%o1
	array8	%g4,	%i1,	%o0
	and	%i5,	%l0,	%i0
	srl	%i6,	0x17,	%g3
	movcc	%xcc,	%l1,	%l5
	sth	%l4,	[%l7 + 0x68]
	movne	%xcc,	%o4,	%i2
	edge8l	%l2,	%o7,	%l6
	subc	%g5,	%i7,	%o6
	fmovsleu	%icc,	%f16,	%f23
	fmul8ulx16	%f0,	%f30,	%f28
	sllx	%g6,	%g1,	%i4
	movcc	%icc,	%g2,	%o2
	pdist	%f12,	%f14,	%f0
	fone	%f16
	movvc	%icc,	%l3,	%i3
	fmovdvc	%icc,	%f31,	%f24
	fcmpgt32	%f12,	%f26,	%o5
	movge	%icc,	%o3,	%o1
	srl	%g4,	0x1F,	%i1
	fnot1	%f12,	%f10
	umul	%g7,	0x080F,	%i5
	andncc	%o0,	%i0,	%i6
	xnor	%g3,	0x1F3C,	%l0
	fands	%f27,	%f28,	%f4
	ldd	[%l7 + 0x68],	%f10
	movcs	%xcc,	%l5,	%l1
	fmovscc	%xcc,	%f20,	%f24
	save %l4, %o4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0303
	fandnot1	%f16,	%f14,	%f16
	movne	%xcc,	%l2,	%l6
	mulscc	%o7,	%g5,	%o6
	xorcc	%i7,	%g1,	%g6
	and	%g2,	%o2,	%l3
	fmovdn	%xcc,	%f20,	%f19
	movrne	%i4,	0x10B,	%i3
	edge16l	%o3,	%o5,	%g4
	smulcc	%o1,	0x0138,	%g7
	edge16ln	%i5,	%o0,	%i1
	andncc	%i0,	%i6,	%l0
	movrgez	%l5,	%g3,	%l4
	edge32	%l1,	%o4,	%i2
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	sethi	0x1C64,	%l2
	orn	%o6,	0x0DB0,	%i7
	fandnot1s	%f7,	%f3,	%f16
	movvc	%icc,	%g1,	%g6
	movneg	%xcc,	%g5,	%o2
	xnorcc	%g2,	%i4,	%l3
	movrgz	%o3,	%o5,	%i3
	smul	%g4,	0x038F,	%g7
	fmovdn	%icc,	%f20,	%f1
	movg	%xcc,	%i5,	%o0
	ldsb	[%l7 + 0x4B],	%i1
	add	%o1,	%i0,	%l0
	sllx	%l5,	%i6,	%g3
	movne	%icc,	%l4,	%l1
	restore %i2, 0x1BBB, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o7,	%l2,	%o6
	movrlz	%o4,	%i7,	%g6
	sdiv	%g1,	0x1AAE,	%o2
	edge32	%g5,	%g2,	%l3
	subccc	%o3,	0x005C,	%i4
	sll	%i3,	0x1F,	%o5
	ldsb	[%l7 + 0x2C],	%g7
	ldsw	[%l7 + 0x30],	%g4
	orcc	%o0,	%i1,	%o1
	edge16ln	%i0,	%i5,	%l0
	edge8l	%l5,	%g3,	%i6
	fpsub16s	%f10,	%f25,	%f17
	mulscc	%l4,	%i2,	%l1
	fpadd32	%f16,	%f26,	%f28
	lduw	[%l7 + 0x5C],	%o7
	alignaddr	%l2,	%o6,	%l6
	andncc	%o4,	%i7,	%g1
	orncc	%g6,	0x124C,	%g5
	edge16l	%g2,	%o2,	%l3
	fmul8ulx16	%f20,	%f10,	%f10
	fornot2s	%f7,	%f28,	%f19
	edge16ln	%i4,	%i3,	%o5
	movcs	%xcc,	%g7,	%g4
	addc	%o3,	0x1880,	%o0
	edge16n	%i1,	%o1,	%i5
	sdiv	%i0,	0x0CB9,	%l0
	fnands	%f23,	%f18,	%f17
	xor	%g3,	%i6,	%l4
	xor	%i2,	0x0077,	%l5
	and	%l1,	0x18C3,	%o7
	movg	%xcc,	%o6,	%l2
	for	%f24,	%f14,	%f12
	fmovrdlez	%l6,	%f0,	%f22
	fpsub32s	%f8,	%f9,	%f22
	fmovrsne	%o4,	%f18,	%f21
	and	%i7,	%g6,	%g1
	srax	%g2,	0x0E,	%g5
	fmovsvs	%icc,	%f10,	%f7
	edge32	%o2,	%l3,	%i3
	andncc	%i4,	%g7,	%g4
	edge8	%o3,	%o5,	%o0
	fpack16	%f16,	%f9
	sdivcc	%o1,	0x14DF,	%i1
	ld	[%l7 + 0x38],	%f25
	ldub	[%l7 + 0x53],	%i5
	subccc	%i0,	0x09EC,	%g3
	add	%i6,	%l4,	%i2
	edge8l	%l5,	%l0,	%l1
	smul	%o7,	%o6,	%l2
	movrgz	%l6,	0x083,	%o4
	srax	%i7,	%g1,	%g2
	st	%f9,	[%l7 + 0x48]
	movrlez	%g6,	%o2,	%g5
	subccc	%i3,	%i4,	%l3
	fornot2	%f4,	%f2,	%f26
	udivx	%g7,	0x18EA,	%g4
	movne	%xcc,	%o5,	%o3
	edge16	%o0,	%o1,	%i5
	ldsh	[%l7 + 0x68],	%i1
	edge32n	%i0,	%i6,	%g3
	ldsh	[%l7 + 0x08],	%i2
	sth	%l4,	[%l7 + 0x76]
	smul	%l0,	%l1,	%o7
	xnor	%l5,	%o6,	%l6
	mulx	%l2,	0x13AA,	%i7
	ldd	[%l7 + 0x08],	%g0
	sir	0x02AF
	fand	%f28,	%f10,	%f22
	ldx	[%l7 + 0x70],	%g2
	fpadd32	%f4,	%f18,	%f6
	movgu	%xcc,	%o4,	%g6
	fmovrdlez	%g5,	%f0,	%f8
	movgu	%icc,	%i3,	%i4
	fcmpgt32	%f14,	%f12,	%l3
	movvs	%icc,	%o2,	%g7
	srlx	%o5,	0x1F,	%g4
	movrgz	%o0,	0x2D3,	%o1
	fmovdgu	%xcc,	%f26,	%f31
	move	%icc,	%i5,	%o3
	orn	%i1,	0x0B32,	%i0
	movgu	%xcc,	%g3,	%i2
	sll	%l4,	%l0,	%l1
	addc	%o7,	0x05A9,	%l5
	xorcc	%i6,	%o6,	%l6
	fnot1	%f26,	%f14
	fnors	%f28,	%f12,	%f1
	srlx	%i7,	0x07,	%l2
	movrne	%g2,	%o4,	%g6
	fcmpgt16	%f0,	%f4,	%g5
	ld	[%l7 + 0x10],	%f7
	and	%g1,	0x0F29,	%i3
	orcc	%l3,	0x0CA5,	%o2
	smul	%i4,	0x1186,	%o5
	srax	%g4,	%o0,	%o1
	edge8l	%i5,	%g7,	%i1
	sth	%o3,	[%l7 + 0x56]
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	fand	%f28,	%f4,	%f30
	umul	%i2,	0x0F8A,	%l0
	sdivcc	%l1,	0x0A9D,	%o7
	movrgez	%l4,	0x3FF,	%l5
	fsrc2s	%f13,	%f20
	movn	%icc,	%o6,	%l6
	fpmerge	%f0,	%f8,	%f14
	movgu	%icc,	%i6,	%l2
	siam	0x4
	lduh	[%l7 + 0x54],	%i7
	movle	%xcc,	%g2,	%g6
	array32	%o4,	%g1,	%g5
	fmovrslez	%i3,	%f30,	%f4
	fmovs	%f30,	%f15
	movrgez	%l3,	%i4,	%o5
	edge8ln	%g4,	%o0,	%o2
	fmovsl	%icc,	%f5,	%f17
	sdiv	%o1,	0x1640,	%g7
	fnand	%f12,	%f22,	%f24
	edge32l	%i5,	%o3,	%g3
	addccc	%i1,	0x0CC2,	%i0
	andn	%i2,	0x159F,	%l0
	nop
	set	0x3C, %i7
	ldsw	[%l7 + %i7],	%l1
	fcmpes	%fcc2,	%f13,	%f23
	ldd	[%l7 + 0x58],	%f4
	mulx	%l4,	%o7,	%o6
	fmovdn	%icc,	%f0,	%f15
	fpsub32	%f4,	%f30,	%f24
	movvc	%icc,	%l5,	%i6
	lduh	[%l7 + 0x6E],	%l2
	edge8n	%i7,	%l6,	%g6
	fmovdleu	%xcc,	%f19,	%f22
	orncc	%g2,	%o4,	%g1
	fand	%f30,	%f16,	%f30
	array32	%g5,	%i3,	%i4
	fnegs	%f18,	%f15
	fornot2s	%f16,	%f8,	%f13
	mulx	%l3,	%o5,	%o0
	srax	%o2,	%o1,	%g7
	edge16n	%i5,	%g4,	%o3
	sdiv	%g3,	0x03E8,	%i1
	sdiv	%i2,	0x1FAD,	%l0
	orn	%i0,	%l4,	%l1
	move	%icc,	%o7,	%o6
	ldsb	[%l7 + 0x77],	%i6
	fornot2s	%f14,	%f15,	%f25
	fmovscs	%xcc,	%f21,	%f5
	edge16ln	%l2,	%i7,	%l6
	fcmpgt32	%f26,	%f12,	%l5
	xorcc	%g6,	%o4,	%g2
	lduw	[%l7 + 0x40],	%g1
	fands	%f7,	%f17,	%f7
	fornot1	%f18,	%f10,	%f30
	edge16l	%i3,	%i4,	%l3
	popc	0x0349,	%o5
	sllx	%g5,	0x03,	%o0
	popc	0x102E,	%o2
	xnorcc	%g7,	%o1,	%g4
	udivcc	%i5,	0x13DA,	%o3
	srax	%g3,	0x02,	%i1
	edge32n	%l0,	%i2,	%i0
	ldsh	[%l7 + 0x6E],	%l4
	smul	%o7,	0x0FEA,	%o6
	or	%l1,	0x0A51,	%i6
	fmovdl	%xcc,	%f19,	%f8
	mulx	%i7,	0x00C1,	%l2
	movre	%l5,	0x014,	%l6
	fmovde	%icc,	%f20,	%f19
	and	%g6,	0x0DC2,	%g2
	array8	%o4,	%i3,	%i4
	move	%icc,	%g1,	%l3
	movrne	%g5,	%o0,	%o2
	fcmpne32	%f2,	%f16,	%o5
	save %g7, 0x10C8, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	%i5,	%g3
	subc	%o3,	0x136B,	%i1
	movleu	%xcc,	%i2,	%i0
	movg	%xcc,	%l4,	%o7
	edge32n	%l0,	%l1,	%i6
	edge32	%o6,	%l2,	%i7
	xor	%l6,	0x16CE,	%l5
	fnor	%f4,	%f26,	%f6
	movn	%xcc,	%g2,	%g6
	fpmerge	%f0,	%f10,	%f28
	fornot2s	%f14,	%f30,	%f22
	ldsw	[%l7 + 0x14],	%i3
	fmovdvs	%icc,	%f18,	%f20
	fornot1s	%f14,	%f19,	%f5
	ldx	[%l7 + 0x50],	%i4
	array8	%g1,	%o4,	%l3
	fabsd	%f4,	%f10
	fmovrdgez	%g5,	%f4,	%f8
	smul	%o2,	0x139D,	%o0
	stb	%o5,	[%l7 + 0x79]
	alignaddr	%g4,	%o1,	%i5
	ldx	[%l7 + 0x30],	%g3
	fmovdge	%xcc,	%f7,	%f9
	movcc	%icc,	%g7,	%o3
	sir	0x1BBB
	sllx	%i2,	0x14,	%i0
	sub	%l4,	0x0835,	%i1
	addc	%o7,	0x1F7E,	%l0
	sllx	%l1,	0x13,	%i6
	lduw	[%l7 + 0x50],	%l2
	fmovd	%f14,	%f28
	sir	0x172D
	fands	%f11,	%f30,	%f30
	fmovsle	%xcc,	%f31,	%f27
	lduw	[%l7 + 0x08],	%i7
	xor	%l6,	%l5,	%o6
	fmovda	%icc,	%f8,	%f17
	restore %g2, %i3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x48],	%g0
	fmovrdlez	%i4,	%f2,	%f20
	ldub	[%l7 + 0x0B],	%o4
	movne	%icc,	%g5,	%l3
	movleu	%icc,	%o0,	%o2
	edge32ln	%o5,	%o1,	%i5
	popc	0x0468,	%g4
	udivx	%g7,	0x1BC1,	%g3
	xor	%o3,	%i2,	%l4
	fmovscs	%xcc,	%f24,	%f10
	fones	%f21
	fornot2s	%f11,	%f5,	%f16
	movge	%xcc,	%i1,	%o7
	movleu	%xcc,	%l0,	%l1
	lduw	[%l7 + 0x6C],	%i0
	movg	%icc,	%l2,	%i6
	movrgz	%i7,	%l5,	%l6
	xnor	%g2,	0x1250,	%o6
	save %i3, 0x12EB, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g1,	%i4
	sir	0x0492
	fmovsn	%xcc,	%f25,	%f13
	movne	%icc,	%g5,	%o4
	fmovrslz	%l3,	%f25,	%f10
	andncc	%o2,	%o0,	%o5
	fpmerge	%f14,	%f26,	%f14
	umulcc	%o1,	%g4,	%g7
	nop
	set	0x74, %o4
	ldsw	[%l7 + %o4],	%g3
	udivx	%o3,	0x046C,	%i5
	fzeros	%f6
	addc	%i2,	%i1,	%o7
	movpos	%xcc,	%l4,	%l0
	edge32n	%i0,	%l1,	%i6
	srax	%i7,	%l2,	%l6
	movle	%icc,	%l5,	%g2
	movge	%xcc,	%i3,	%o6
	edge32l	%g6,	%g1,	%g5
	umul	%o4,	%l3,	%o2
	addccc	%i4,	%o0,	%o1
	fnors	%f3,	%f23,	%f19
	subcc	%o5,	0x0CB7,	%g7
	fmovdcs	%icc,	%f13,	%f26
	movpos	%icc,	%g3,	%g4
	fxnors	%f11,	%f25,	%f11
	fmovda	%xcc,	%f0,	%f28
	array32	%o3,	%i2,	%i1
	movre	%i5,	0x15A,	%l4
	smulcc	%l0,	%o7,	%i0
	movvs	%icc,	%i6,	%l1
	movrlz	%i7,	0x3AA,	%l6
	nop
	set	0x68, %i5
	std	%f6,	[%l7 + %i5]
	mulx	%l2,	0x0ABD,	%l5
	ldd	[%l7 + 0x10],	%f22
	movleu	%xcc,	%g2,	%o6
	sir	0x1540
	orncc	%g6,	%g1,	%g5
	movvs	%icc,	%o4,	%i3
	andn	%l3,	0x1CFC,	%o2
	array8	%o0,	%i4,	%o1
	movrne	%o5,	0x3FC,	%g7
	fpack32	%f26,	%f8,	%f4
	sdivx	%g3,	0x1991,	%g4
	orn	%o3,	0x1A30,	%i1
	ldd	[%l7 + 0x48],	%f20
	nop
	set	0x38, %o0
	ldx	[%l7 + %o0],	%i5
	fmovrslz	%i2,	%f23,	%f2
	fones	%f21
	fcmpd	%fcc2,	%f28,	%f10
	subcc	%l0,	0x1B20,	%o7
	edge8l	%i0,	%l4,	%l1
	smulcc	%i6,	0x1C7B,	%i7
	fsrc1	%f24,	%f8
	stx	%l6,	[%l7 + 0x60]
	save %l5, %g2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g6,	%o6,	%g5
	sir	0x1CD7
	andncc	%o4,	%i3,	%g1
	movrne	%o2,	0x3BB,	%l3
	fmovsvs	%icc,	%f21,	%f26
	sdivx	%i4,	0x088E,	%o1
	umul	%o5,	0x11EB,	%g7
	srax	%o0,	%g3,	%o3
	ldd	[%l7 + 0x78],	%f26
	udiv	%g4,	0x065F,	%i1
	edge8ln	%i2,	%i5,	%l0
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	andn	%l1,	%i0,	%i6
	st	%f25,	[%l7 + 0x0C]
	movcc	%icc,	%i7,	%l6
	ldsh	[%l7 + 0x18],	%g2
	umul	%l2,	%l5,	%o6
	array16	%g5,	%o4,	%i3
	restore %g1, 0x17A2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l3,	%i4,	%o1
	fornot2s	%f15,	%f23,	%f21
	fmovsa	%icc,	%f26,	%f14
	nop
	set	0x6C, %l5
	stw	%o2,	[%l7 + %l5]
	fnor	%f0,	%f0,	%f8
	or	%o5,	%g7,	%g3
	xorcc	%o0,	%o3,	%i1
	subccc	%i2,	%g4,	%i5
	addcc	%o7,	%l4,	%l0
	movn	%icc,	%l1,	%i0
	fpsub32s	%f21,	%f10,	%f30
	sdiv	%i6,	0x1737,	%i7
	and	%l6,	0x1E0A,	%l2
	xnor	%g2,	0x10FA,	%l5
	movcs	%xcc,	%o6,	%g5
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	movrlz	%g6,	0x240,	%i4
	smul	%o1,	%l3,	%o2
	lduh	[%l7 + 0x50],	%g7
	lduh	[%l7 + 0x5E],	%g3
	andcc	%o0,	0x1409,	%o5
	bshuffle	%f0,	%f24,	%f22
	srlx	%o3,	0x0B,	%i2
	xorcc	%g4,	%i5,	%o7
	fsrc2s	%f15,	%f14
	smul	%l4,	0x11BE,	%i1
	fsrc2s	%f23,	%f23
	fpadd32s	%f15,	%f12,	%f19
	fxor	%f26,	%f6,	%f0
	subccc	%l0,	%i0,	%l1
	xnor	%i7,	0x090E,	%l6
	edge32	%i6,	%l2,	%g2
	movre	%l5,	0x397,	%o6
	stx	%g5,	[%l7 + 0x60]
	lduh	[%l7 + 0x5A],	%o4
	udivcc	%g1,	0x1EC3,	%i3
	srax	%i4,	0x14,	%o1
	movleu	%xcc,	%g6,	%o2
	fpsub32s	%f23,	%f27,	%f22
	stx	%l3,	[%l7 + 0x08]
	array16	%g3,	%o0,	%o5
	movpos	%xcc,	%g7,	%o3
	edge32n	%i2,	%i5,	%o7
	fnot2s	%f20,	%f8
	and	%g4,	0x1773,	%l4
	sth	%l0,	[%l7 + 0x34]
	edge32ln	%i0,	%l1,	%i7
	ldsb	[%l7 + 0x47],	%l6
	movl	%xcc,	%i1,	%l2
	xnorcc	%i6,	%g2,	%o6
	movg	%xcc,	%l5,	%o4
	andn	%g5,	0x16C8,	%i3
	sethi	0x0D50,	%i4
	stx	%g1,	[%l7 + 0x10]
	ldsb	[%l7 + 0x16],	%o1
	siam	0x5
	movrlez	%o2,	%l3,	%g3
	edge16	%o0,	%o5,	%g6
	movn	%xcc,	%o3,	%g7
	fxnors	%f3,	%f22,	%f1
	udivcc	%i2,	0x1491,	%o7
	array16	%g4,	%i5,	%l0
	ldsb	[%l7 + 0x52],	%i0
	movge	%xcc,	%l1,	%l4
	ld	[%l7 + 0x5C],	%f12
	movrlez	%i7,	%i1,	%l6
	movn	%icc,	%l2,	%g2
	edge32ln	%o6,	%i6,	%o4
	edge32l	%l5,	%i3,	%g5
	subccc	%i4,	%o1,	%o2
	xor	%g1,	0x1B8F,	%g3
	sdivx	%l3,	0x0958,	%o5
	fmovdpos	%icc,	%f9,	%f30
	ld	[%l7 + 0x7C],	%f15
	movle	%icc,	%o0,	%g6
	andncc	%o3,	%g7,	%o7
	move	%icc,	%i2,	%g4
	movcc	%icc,	%i5,	%i0
	restore %l0, 0x0A86, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l1,	%i7,	%i1
	ldd	[%l7 + 0x30],	%l2
	movre	%l6,	0x31F,	%o6
	movleu	%xcc,	%g2,	%i6
	mova	%xcc,	%l5,	%i3
	save %g5, 0x08C1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x2C],	%o1
	udivx	%i4,	0x1D19,	%o2
	stw	%g1,	[%l7 + 0x18]
	movre	%l3,	%g3,	%o5
	edge16ln	%g6,	%o0,	%g7
	sir	0x1243
	nop
	set	0x64, %l0
	stw	%o7,	[%l7 + %l0]
	movrgez	%i2,	0x0FB,	%g4
	fmovdpos	%icc,	%f9,	%f6
	move	%icc,	%o3,	%i0
	fmovsle	%xcc,	%f12,	%f8
	andncc	%i5,	%l0,	%l4
	ld	[%l7 + 0x64],	%f1
	xnor	%i7,	%i1,	%l1
	xorcc	%l6,	0x069D,	%l2
	movne	%icc,	%o6,	%g2
	xnorcc	%l5,	0x00FB,	%i6
	edge16ln	%g5,	%i3,	%o4
	fnand	%f8,	%f26,	%f4
	or	%i4,	%o1,	%g1
	orncc	%l3,	%g3,	%o2
	fmovdcc	%icc,	%f25,	%f12
	subcc	%g6,	%o5,	%o0
	alignaddr	%o7,	%i2,	%g4
	sir	0x15E8
	sdivx	%o3,	0x08F0,	%g7
	subcc	%i0,	0x1AD1,	%i5
	movne	%icc,	%l0,	%l4
	array32	%i7,	%i1,	%l1
	fornot1	%f4,	%f14,	%f26
	lduw	[%l7 + 0x0C],	%l2
	fcmpeq16	%f26,	%f8,	%o6
	st	%f20,	[%l7 + 0x38]
	movcc	%xcc,	%l6,	%g2
	stw	%i6,	[%l7 + 0x10]
	sll	%l5,	%i3,	%g5
	move	%xcc,	%o4,	%i4
	movvc	%xcc,	%g1,	%l3
	fcmps	%fcc1,	%f26,	%f4
	edge8n	%g3,	%o2,	%g6
	edge16n	%o5,	%o1,	%o0
	add	%i2,	%o7,	%o3
	fpsub16	%f22,	%f14,	%f0
	edge16	%g4,	%i0,	%g7
	movpos	%xcc,	%i5,	%l4
	movcc	%icc,	%l0,	%i1
	xnorcc	%l1,	0x0763,	%i7
	addcc	%l2,	%l6,	%g2
	sub	%o6,	0x1381,	%i6
	fmovscc	%icc,	%f26,	%f31
	movle	%xcc,	%l5,	%i3
	fors	%f26,	%f11,	%f26
	edge8l	%g5,	%o4,	%i4
	array32	%g1,	%l3,	%g3
	faligndata	%f26,	%f0,	%f18
	movrlz	%o2,	0x2B7,	%o5
	ldsb	[%l7 + 0x11],	%g6
	array8	%o1,	%i2,	%o0
	ldsw	[%l7 + 0x60],	%o7
	mulx	%o3,	0x13FA,	%g4
	xnor	%i0,	0x1C9D,	%i5
	edge32	%l4,	%g7,	%i1
	alignaddr	%l1,	%l0,	%i7
	fmovdvc	%icc,	%f11,	%f30
	array8	%l2,	%l6,	%g2
	sdiv	%i6,	0x014F,	%o6
	movn	%xcc,	%i3,	%l5
	orncc	%g5,	0x00F9,	%i4
	for	%f26,	%f6,	%f30
	addc	%g1,	0x0E1A,	%o4
	udivcc	%l3,	0x0A95,	%g3
	stx	%o2,	[%l7 + 0x08]
	andcc	%g6,	%o5,	%o1
	edge8n	%i2,	%o7,	%o3
	fmovsge	%xcc,	%f10,	%f8
	ldx	[%l7 + 0x10],	%o0
	movrne	%i0,	%i5,	%g4
	andn	%g7,	%l4,	%i1
	fmovdne	%icc,	%f29,	%f0
	movrlez	%l1,	%l0,	%i7
	fone	%f8
	smulcc	%l6,	%l2,	%i6
	xnorcc	%g2,	%i3,	%l5
	smulcc	%o6,	0x19FC,	%g5
	orcc	%i4,	0x117D,	%g1
	sllx	%l3,	%o4,	%g3
	alignaddr	%g6,	%o5,	%o2
	fnor	%f30,	%f20,	%f14
	alignaddrl	%i2,	%o7,	%o3
	udivcc	%o1,	0x0340,	%o0
	edge32	%i0,	%i5,	%g7
	siam	0x2
	movgu	%icc,	%l4,	%i1
	sll	%l1,	0x11,	%g4
	fmovs	%f12,	%f30
	mulscc	%l0,	%i7,	%l6
	fpadd16s	%f17,	%f29,	%f23
	stw	%l2,	[%l7 + 0x74]
	fnand	%f0,	%f30,	%f10
	fabss	%f11,	%f31
	movn	%xcc,	%g2,	%i6
	fmovrdlez	%i3,	%f20,	%f26
	faligndata	%f28,	%f10,	%f4
	movcs	%xcc,	%o6,	%l5
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	umulcc	%o4,	0x12C5,	%l3
	ldd	[%l7 + 0x18],	%f18
	edge8l	%g3,	%o5,	%o2
	sllx	%g6,	0x14,	%o7
	fpadd32	%f4,	%f18,	%f26
	edge8n	%i2,	%o1,	%o0
	movgu	%xcc,	%i0,	%o3
	fxor	%f26,	%f22,	%f28
	fabsd	%f4,	%f0
	xnor	%i5,	%g7,	%l4
	alignaddr	%i1,	%g4,	%l1
	fcmpeq16	%f16,	%f10,	%i7
	addc	%l0,	0x1ECC,	%l6
	fnor	%f6,	%f8,	%f6
	addc	%g2,	0x0B78,	%l2
	ldd	[%l7 + 0x08],	%i2
	alignaddr	%i6,	%l5,	%o6
	movre	%g1,	%i4,	%g5
	fmovda	%icc,	%f27,	%f31
	movge	%xcc,	%l3,	%g3
	addcc	%o4,	0x04FD,	%o5
	movleu	%xcc,	%o2,	%g6
	udiv	%o7,	0x0219,	%o1
	smul	%o0,	0x0721,	%i2
	edge32ln	%i0,	%o3,	%g7
	fnegs	%f10,	%f28
	fmovsa	%icc,	%f28,	%f9
	ldx	[%l7 + 0x08],	%i5
	fpadd16	%f28,	%f10,	%f8
	movle	%xcc,	%i1,	%l4
	movcc	%icc,	%l1,	%i7
	udiv	%l0,	0x0ACC,	%g4
	movvs	%icc,	%l6,	%l2
	addcc	%i3,	0x1A3B,	%g2
	subccc	%i6,	%o6,	%l5
	subccc	%g1,	%g5,	%i4
	srax	%l3,	0x16,	%o4
	ldd	[%l7 + 0x10],	%f22
	mova	%icc,	%o5,	%o2
	edge16l	%g6,	%g3,	%o1
	movcs	%xcc,	%o0,	%o7
	nop
	set	0x50, %l3
	ldsw	[%l7 + %l3],	%i0
	movrlez	%o3,	0x157,	%i2
	edge8ln	%i5,	%i1,	%g7
	fpadd32s	%f27,	%f16,	%f30
	edge32	%l1,	%l4,	%l0
	movn	%icc,	%g4,	%i7
	array16	%l2,	%i3,	%g2
	fmovsleu	%icc,	%f17,	%f22
	movrlez	%l6,	0x2AE,	%o6
	fnegs	%f18,	%f6
	movgu	%icc,	%l5,	%i6
	fmovrsgz	%g1,	%f1,	%f4
	xor	%g5,	0x0F6F,	%i4
	stx	%l3,	[%l7 + 0x18]
	movpos	%icc,	%o5,	%o2
	save %o4, %g6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o1,	[%l7 + 0x50]
	edge8n	%o0,	%i0,	%o3
	movg	%xcc,	%i2,	%o7
	fmovsne	%xcc,	%f0,	%f1
	subccc	%i1,	0x1ABE,	%g7
	edge8ln	%l1,	%i5,	%l4
	smulcc	%g4,	0x13EF,	%i7
	fmovscs	%xcc,	%f10,	%f27
	fandnot1s	%f10,	%f16,	%f10
	andncc	%l2,	%i3,	%l0
	movcc	%icc,	%l6,	%o6
	fnegs	%f24,	%f3
	alignaddr	%l5,	%g2,	%g1
	ld	[%l7 + 0x20],	%f13
	edge16l	%g5,	%i6,	%i4
	subccc	%o5,	%o2,	%l3
	edge8ln	%o4,	%g6,	%g3
	fmovsl	%xcc,	%f13,	%f23
	subc	%o1,	0x0ED7,	%o0
	sth	%i0,	[%l7 + 0x4E]
	movrne	%i2,	%o7,	%i1
	subccc	%g7,	0x0BAE,	%l1
	fpadd16s	%f10,	%f12,	%f19
	movrgz	%o3,	0x145,	%i5
	array32	%l4,	%i7,	%l2
	edge32ln	%i3,	%g4,	%l6
	andcc	%l0,	0x14C0,	%l5
	addccc	%g2,	%g1,	%o6
	fsrc2	%f12,	%f6
	edge16ln	%g5,	%i4,	%i6
	fzeros	%f5
	fmovsgu	%icc,	%f4,	%f10
	sth	%o2,	[%l7 + 0x2E]
	movn	%icc,	%l3,	%o5
	fmovsvs	%icc,	%f30,	%f1
	alignaddrl	%g6,	%o4,	%o1
	movne	%xcc,	%o0,	%g3
	movn	%icc,	%i0,	%o7
	sll	%i1,	%i2,	%l1
	movcs	%xcc,	%o3,	%g7
	xor	%i5,	%i7,	%l2
	movpos	%icc,	%i3,	%g4
	fcmpgt32	%f4,	%f4,	%l6
	fzero	%f16
	save %l0, %l5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g1,	0x19A8,	%o6
	fmovsg	%xcc,	%f20,	%f23
	fmovdneg	%xcc,	%f24,	%f11
	fmovrslez	%g5,	%f4,	%f24
	fones	%f20
	edge32	%l4,	%i6,	%i4
	movrgez	%o2,	%l3,	%o5
	srl	%o4,	0x01,	%g6
	alignaddrl	%o0,	%o1,	%g3
	movl	%icc,	%o7,	%i1
	ld	[%l7 + 0x74],	%f15
	or	%i0,	0x109F,	%l1
	add	%i2,	0x1F93,	%g7
	ldd	[%l7 + 0x78],	%f20
	ldsh	[%l7 + 0x26],	%o3
	popc	%i5,	%l2
	fnegs	%f18,	%f12
	fnot1	%f18,	%f4
	umul	%i3,	0x1829,	%i7
	edge32ln	%l6,	%g4,	%l5
	fmuld8ulx16	%f18,	%f9,	%f30
	sdivcc	%l0,	0x061C,	%g2
	movpos	%xcc,	%g1,	%g5
	ldd	[%l7 + 0x20],	%l4
	fpackfix	%f22,	%f7
	fcmpeq16	%f8,	%f22,	%o6
	fmovdleu	%xcc,	%f20,	%f30
	mulx	%i4,	%i6,	%o2
	xorcc	%l3,	0x06D4,	%o4
	movre	%o5,	0x352,	%o0
	restore %g6, %g3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i1, 0x0A5B, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l1,	%o7
	popc	%i2,	%o3
	sth	%i5,	[%l7 + 0x26]
	fxnors	%f14,	%f31,	%f17
	xor	%g7,	0x1F23,	%i3
	array8	%i7,	%l6,	%l2
	ldsw	[%l7 + 0x54],	%g4
	fmul8ulx16	%f4,	%f30,	%f18
	add	%l5,	0x1C0A,	%g2
	movleu	%icc,	%g1,	%g5
	addcc	%l0,	%o6,	%i4
	movge	%icc,	%l4,	%o2
	ldsw	[%l7 + 0x60],	%i6
	movrlez	%l3,	%o4,	%o5
	bshuffle	%f12,	%f26,	%f16
	sdiv	%g6,	0x031F,	%g3
	sir	0x0C96
	nop
	set	0x20, %g6
	lduw	[%l7 + %g6],	%o0
	mulscc	%i1,	0x1CC8,	%i0
	movrne	%l1,	%o1,	%i2
	edge16l	%o3,	%i5,	%o7
	siam	0x3
	sub	%g7,	%i3,	%l6
	movcs	%icc,	%i7,	%g4
	udivx	%l5,	0x083A,	%g2
	movrlz	%l2,	0x130,	%g1
	movrgz	%l0,	0x22B,	%o6
	sra	%g5,	0x1E,	%i4
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	ldsb	[%l7 + 0x70],	%i6
	alignaddr	%o5,	%g6,	%o4
	stx	%g3,	[%l7 + 0x78]
	movcs	%icc,	%o0,	%i1
	movne	%icc,	%l1,	%i0
	edge8	%i2,	%o3,	%o1
	stw	%i5,	[%l7 + 0x3C]
	subc	%o7,	%g7,	%i3
	fnands	%f6,	%f27,	%f25
	movrne	%l6,	%g4,	%l5
	fnor	%f30,	%f18,	%f18
	umul	%g2,	%i7,	%g1
	sll	%l2,	0x1C,	%o6
	fornot1s	%f19,	%f29,	%f8
	add	%g5,	%i4,	%l0
	fmovse	%icc,	%f22,	%f28
	andn	%o2,	0x0C5D,	%l4
	sdivx	%i6,	0x08EC,	%l3
	edge32ln	%g6,	%o5,	%o4
	srlx	%g3,	%i1,	%l1
	movle	%icc,	%i0,	%o0
	fnand	%f16,	%f12,	%f12
	add	%o3,	0x1145,	%o1
	fmovdcc	%xcc,	%f31,	%f15
	array16	%i5,	%o7,	%g7
	fornot1	%f22,	%f4,	%f6
	fsrc2	%f22,	%f22
	fsrc2	%f30,	%f28
	sethi	0x156F,	%i2
	sir	0x0AAE
	array8	%l6,	%i3,	%g4
	mova	%icc,	%g2,	%l5
	array16	%i7,	%g1,	%o6
	nop
	set	0x60, %g5
	std	%f20,	[%l7 + %g5]
	udivcc	%g5,	0x06E7,	%i4
	ldsh	[%l7 + 0x26],	%l2
	orcc	%l0,	0x12D4,	%o2
	edge32	%l4,	%l3,	%i6
	movrlz	%g6,	0x12B,	%o5
	ldx	[%l7 + 0x38],	%o4
	fnand	%f28,	%f22,	%f14
	ldsw	[%l7 + 0x40],	%g3
	movgu	%icc,	%i1,	%i0
	sdivx	%o0,	0x0881,	%o3
	lduh	[%l7 + 0x6C],	%o1
	edge8ln	%i5,	%l1,	%o7
	fmul8ulx16	%f8,	%f24,	%f24
	fandnot1s	%f19,	%f20,	%f10
	fmul8sux16	%f28,	%f20,	%f20
	movrlz	%g7,	0x18C,	%l6
	edge8	%i3,	%i2,	%g2
	udivx	%g4,	0x013B,	%i7
	lduh	[%l7 + 0x76],	%l5
	smul	%g1,	0x08ED,	%o6
	ldsb	[%l7 + 0x1C],	%g5
	ldsb	[%l7 + 0x10],	%i4
	fzeros	%f25
	save %l0, %l2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f28
	fnands	%f5,	%f20,	%f11
	stx	%l3,	[%l7 + 0x60]
	udivcc	%i6,	0x1529,	%o2
	sth	%g6,	[%l7 + 0x08]
	fmovrdgz	%o4,	%f6,	%f20
	ldd	[%l7 + 0x70],	%f14
	edge8	%g3,	%i1,	%i0
	movl	%icc,	%o5,	%o0
	fnot1	%f28,	%f8
	sdiv	%o3,	0x1994,	%i5
	movvs	%xcc,	%l1,	%o1
	nop
	set	0x60, %g1
	stx	%o7,	[%l7 + %g1]
	movpos	%icc,	%l6,	%i3
	fpadd16s	%f31,	%f10,	%f27
	fmovdl	%icc,	%f8,	%f6
	edge32	%g7,	%i2,	%g4
	fmovsn	%xcc,	%f21,	%f8
	fmovrdlz	%g2,	%f30,	%f22
	movvs	%xcc,	%l5,	%i7
	fmovrse	%g1,	%f6,	%f28
	fpsub32	%f20,	%f22,	%f22
	movneg	%xcc,	%g5,	%i4
	edge8l	%l0,	%o6,	%l4
	and	%l2,	%i6,	%o2
	add	%l3,	%g6,	%o4
	movrgz	%i1,	%i0,	%g3
	fandnot2	%f26,	%f16,	%f0
	edge8n	%o5,	%o0,	%i5
	edge32ln	%o3,	%l1,	%o1
	movre	%o7,	%i3,	%l6
	sdivcc	%i2,	0x1406,	%g7
	ldub	[%l7 + 0x27],	%g2
	sdiv	%g4,	0x1999,	%l5
	array8	%g1,	%i7,	%i4
	xnor	%l0,	%o6,	%g5
	mulx	%l2,	%l4,	%i6
	ldd	[%l7 + 0x30],	%o2
	fmovdvs	%xcc,	%f7,	%f8
	stx	%l3,	[%l7 + 0x78]
	movrgz	%o4,	0x2DA,	%g6
	movrne	%i1,	0x020,	%g3
	ldsw	[%l7 + 0x20],	%i0
	movl	%xcc,	%o5,	%o0
	orncc	%i5,	%o3,	%o1
	edge16ln	%l1,	%i3,	%o7
	smulcc	%l6,	0x0449,	%i2
	edge32	%g7,	%g2,	%g4
	fmovrdlz	%l5,	%f4,	%f18
	fmovdl	%xcc,	%f9,	%f18
	xnorcc	%g1,	0x08A3,	%i4
	edge32	%l0,	%i7,	%o6
	array16	%g5,	%l4,	%l2
	andncc	%o2,	%i6,	%l3
	nop
	set	0x38, %g3
	stx	%g6,	[%l7 + %g3]
	add	%o4,	0x19EF,	%i1
	orn	%i0,	%g3,	%o0
	lduh	[%l7 + 0x16],	%o5
	fpmerge	%f30,	%f27,	%f8
	edge32	%i5,	%o1,	%o3
	umulcc	%i3,	0x1215,	%l1
	edge16	%l6,	%i2,	%g7
	ldd	[%l7 + 0x50],	%o6
	movrlz	%g2,	0x3CC,	%l5
	movpos	%icc,	%g4,	%i4
	movn	%xcc,	%l0,	%g1
	lduh	[%l7 + 0x78],	%i7
	orncc	%o6,	0x10E5,	%g5
	ldx	[%l7 + 0x68],	%l2
	fnot2s	%f18,	%f27
	restore %o2, %l4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g6,	%o4,	%i1
	edge32l	%i0,	%g3,	%o0
	orn	%i6,	%o5,	%o1
	andcc	%i5,	0x1EAC,	%i3
	array8	%o3,	%l6,	%i2
	movrgez	%l1,	%o7,	%g2
	move	%xcc,	%g7,	%g4
	sub	%l5,	%l0,	%i4
	sdivcc	%g1,	0x1830,	%o6
	xnorcc	%g5,	0x0B64,	%l2
	edge8ln	%i7,	%l4,	%o2
	orcc	%g6,	%l3,	%o4
	stx	%i0,	[%l7 + 0x50]
	srl	%i1,	0x06,	%o0
	orncc	%g3,	0x0081,	%o5
	move	%icc,	%i6,	%o1
	andn	%i5,	0x13C2,	%i3
	srax	%o3,	0x0A,	%l6
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fxor	%f2,	%f28,	%f4
	fmovrsgez	%g2,	%f5,	%f29
	array8	%g4,	%g7,	%l5
	fands	%f2,	%f2,	%f9
	smul	%l0,	%g1,	%o6
	edge8ln	%i4,	%l2,	%g5
	lduw	[%l7 + 0x50],	%l4
	fcmpd	%fcc3,	%f8,	%f0
	edge8	%i7,	%o2,	%l3
	fcmpgt32	%f28,	%f26,	%g6
	movrgez	%o4,	%i1,	%o0
	andcc	%i0,	%g3,	%o5
	array16	%o1,	%i5,	%i6
	fmovsl	%icc,	%f9,	%f12
	smulcc	%o3,	0x0CFF,	%l6
	addc	%i2,	0x0245,	%o7
	movne	%xcc,	%i3,	%g2
	movle	%icc,	%l1,	%g7
	fmul8x16al	%f21,	%f4,	%f16
	andcc	%g4,	%l5,	%l0
	movre	%g1,	%o6,	%l2
	edge16	%i4,	%g5,	%l4
	andcc	%o2,	0x025E,	%l3
	fpmerge	%f10,	%f8,	%f4
	movrgz	%i7,	0x16A,	%g6
	fpadd16	%f6,	%f0,	%f8
	addccc	%o4,	0x06CE,	%i1
	orn	%o0,	0x0109,	%i0
	movleu	%xcc,	%g3,	%o1
	nop
	set	0x78, %o2
	ldx	[%l7 + %o2],	%i5
	sll	%o5,	%o3,	%i6
	array32	%i2,	%l6,	%o7
	sra	%i3,	%l1,	%g7
	stb	%g2,	[%l7 + 0x21]
	xnor	%l5,	%l0,	%g1
	srax	%o6,	%l2,	%i4
	umul	%g5,	0x1BA2,	%g4
	movvs	%icc,	%l4,	%o2
	xorcc	%l3,	0x1A0A,	%i7
	xorcc	%o4,	%g6,	%i1
	movcs	%xcc,	%o0,	%g3
	movge	%icc,	%o1,	%i0
	add	%i5,	%o3,	%o5
	mova	%icc,	%i6,	%l6
	ld	[%l7 + 0x0C],	%f0
	fmovrdgez	%i2,	%f24,	%f22
	array16	%o7,	%i3,	%l1
	movcc	%xcc,	%g2,	%l5
	lduh	[%l7 + 0x78],	%g7
	movcc	%icc,	%l0,	%o6
	add	%g1,	0x14D8,	%i4
	ldsh	[%l7 + 0x14],	%l2
	udiv	%g5,	0x0853,	%g4
	fmovrsne	%l4,	%f11,	%f8
	movrlez	%o2,	0x1AE,	%i7
	ldub	[%l7 + 0x72],	%o4
	fmovdvs	%icc,	%f17,	%f21
	sll	%g6,	0x04,	%i1
	fmovdgu	%icc,	%f5,	%f18
	movgu	%xcc,	%o0,	%l3
	ldx	[%l7 + 0x50],	%o1
	andncc	%i0,	%g3,	%i5
	fmovrslez	%o3,	%f13,	%f0
	fmovdn	%xcc,	%f31,	%f2
	edge16l	%i6,	%l6,	%o5
	move	%xcc,	%o7,	%i3
	smul	%i2,	%g2,	%l5
	orn	%l1,	%g7,	%o6
	movrlz	%l0,	0x11C,	%g1
	orn	%i4,	%g5,	%l2
	st	%f16,	[%l7 + 0x58]
	lduh	[%l7 + 0x56],	%l4
	or	%g4,	0x0DA4,	%o2
	fpmerge	%f1,	%f17,	%f14
	udivx	%o4,	0x02B6,	%g6
	edge8	%i1,	%i7,	%o0
	fmul8ulx16	%f2,	%f16,	%f2
	fmovscs	%icc,	%f28,	%f4
	movrgez	%o1,	%l3,	%g3
	alignaddr	%i0,	%o3,	%i5
	move	%icc,	%i6,	%o5
	fornot2s	%f19,	%f8,	%f12
	smulcc	%o7,	%i3,	%l6
	edge16	%i2,	%l5,	%g2
	srlx	%g7,	0x0E,	%o6
	addc	%l0,	0x129B,	%g1
	andncc	%l1,	%i4,	%g5
	fmovrdgz	%l2,	%f14,	%f18
	fpackfix	%f14,	%f8
	fmovdcc	%xcc,	%f14,	%f24
	movrlez	%l4,	%g4,	%o4
	fcmpd	%fcc3,	%f4,	%f2
	movle	%icc,	%g6,	%i1
	addc	%o2,	0x09DF,	%o0
	addccc	%o1,	%i7,	%l3
	edge8l	%i0,	%g3,	%i5
	movrlz	%o3,	%o5,	%i6
	subccc	%o7,	%i3,	%l6
	fmovdgu	%icc,	%f24,	%f4
	sllx	%l5,	0x0B,	%i2
	mulscc	%g2,	%g7,	%o6
	orcc	%g1,	0x19D2,	%l0
	movle	%icc,	%i4,	%g5
	edge8ln	%l1,	%l2,	%l4
	move	%xcc,	%g4,	%g6
	movrne	%o4,	%o2,	%i1
	sdivx	%o0,	0x0C1A,	%i7
	fmovdcs	%xcc,	%f0,	%f8
	faligndata	%f28,	%f4,	%f24
	sethi	0x123F,	%o1
	mulscc	%l3,	0x1C7A,	%i0
	sdiv	%g3,	0x00B5,	%i5
	subcc	%o5,	0x17BF,	%o3
	stx	%i6,	[%l7 + 0x20]
	smulcc	%o7,	%l6,	%l5
	nop
	set	0x64, %g7
	lduh	[%l7 + %g7],	%i2
	xnorcc	%i3,	0x0B74,	%g7
	fmuld8ulx16	%f24,	%f7,	%f26
	addc	%g2,	0x1462,	%o6
	fmovdcc	%xcc,	%f14,	%f31
	fmovsvs	%xcc,	%f5,	%f2
	array32	%l0,	%i4,	%g1
	fcmpgt32	%f14,	%f16,	%g5
	alignaddrl	%l1,	%l2,	%g4
	array8	%g6,	%l4,	%o4
	fandnot2s	%f9,	%f9,	%f2
	bshuffle	%f28,	%f0,	%f12
	fand	%f8,	%f6,	%f0
	andcc	%i1,	%o0,	%o2
	edge8n	%o1,	%i7,	%l3
	fmuld8ulx16	%f18,	%f16,	%f12
	ldub	[%l7 + 0x4E],	%i0
	srax	%i5,	%g3,	%o3
	movre	%i6,	%o7,	%o5
	movcs	%xcc,	%l6,	%l5
	movre	%i3,	%i2,	%g2
	st	%f16,	[%l7 + 0x54]
	edge32n	%o6,	%l0,	%i4
	fmovrsne	%g7,	%f16,	%f9
	movleu	%xcc,	%g1,	%l1
	fmovdneg	%icc,	%f18,	%f2
	ldd	[%l7 + 0x50],	%l2
	subcc	%g5,	0x0902,	%g6
	edge32	%l4,	%g4,	%o4
	mulx	%i1,	0x05B0,	%o0
	fornot2	%f16,	%f14,	%f2
	edge32n	%o2,	%i7,	%o1
	umul	%l3,	0x182A,	%i0
	fmovrdlez	%g3,	%f2,	%f26
	srlx	%o3,	0x14,	%i5
	udivcc	%o7,	0x0E7D,	%o5
	fcmpgt16	%f2,	%f12,	%i6
	stw	%l5,	[%l7 + 0x14]
	alignaddr	%l6,	%i3,	%i2
	array16	%o6,	%l0,	%g2
	sth	%i4,	[%l7 + 0x1A]
	sdivcc	%g1,	0x05AC,	%l1
	nop
	set	0x54, %i6
	lduw	[%l7 + %i6],	%g7
	fpadd16	%f14,	%f28,	%f14
	move	%icc,	%g5,	%l2
	std	%f10,	[%l7 + 0x30]
	alignaddrl	%g6,	%l4,	%g4
	fmovsn	%icc,	%f8,	%f24
	edge8n	%o4,	%i1,	%o2
	ldsw	[%l7 + 0x28],	%o0
	movle	%xcc,	%i7,	%l3
	movne	%xcc,	%o1,	%i0
	movl	%xcc,	%o3,	%g3
	edge8	%i5,	%o5,	%i6
	addcc	%l5,	0x1D51,	%l6
	edge32n	%i3,	%i2,	%o6
	stx	%l0,	[%l7 + 0x60]
	sll	%o7,	%g2,	%i4
	addccc	%g1,	0x034C,	%g7
	udivcc	%g5,	0x1D78,	%l2
	movrlz	%g6,	0x0C4,	%l1
	ldx	[%l7 + 0x50],	%l4
	and	%o4,	0x15EB,	%g4
	orncc	%i1,	0x12F7,	%o2
	andcc	%i7,	%l3,	%o0
	mova	%xcc,	%i0,	%o1
	movvs	%xcc,	%o3,	%i5
	array32	%g3,	%i6,	%l5
	srax	%o5,	0x1C,	%i3
	edge8l	%l6,	%o6,	%l0
	fcmpeq16	%f30,	%f28,	%o7
	xor	%i2,	0x0B7D,	%g2
	sir	0x0ADC
	fpackfix	%f10,	%f7
	edge8	%g1,	%g7,	%i4
	fmovsa	%icc,	%f25,	%f3
	fnot1s	%f9,	%f12
	std	%f16,	[%l7 + 0x20]
	movrgz	%g5,	%g6,	%l2
	movrne	%l1,	%l4,	%o4
	move	%icc,	%g4,	%o2
	movpos	%icc,	%i7,	%i1
	fxor	%f18,	%f12,	%f26
	movge	%icc,	%l3,	%i0
	std	%f24,	[%l7 + 0x50]
	udivx	%o1,	0x0276,	%o3
	fandnot1s	%f10,	%f4,	%f7
	ldub	[%l7 + 0x6E],	%i5
	subccc	%g3,	%i6,	%o0
	movrne	%l5,	0x04B,	%o5
	ldub	[%l7 + 0x25],	%i3
	std	%f24,	[%l7 + 0x40]
	fmovdg	%xcc,	%f17,	%f11
	stb	%o6,	[%l7 + 0x6A]
	popc	0x1487,	%l6
	edge16ln	%o7,	%i2,	%l0
	sll	%g1,	%g7,	%i4
	fmovdvs	%icc,	%f24,	%f25
	sethi	0x16B1,	%g5
	srlx	%g2,	0x05,	%l2
	movn	%icc,	%l1,	%g6
	alignaddr	%o4,	%g4,	%l4
	fones	%f15
	sll	%o2,	0x18,	%i1
	save %l3, %i7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f16,	%f17,	%f15
	movgu	%icc,	%o3,	%i5
	stb	%o1,	[%l7 + 0x0E]
	nop
	set	0x42, %i3
	lduh	[%l7 + %i3],	%i6
	edge8l	%o0,	%g3,	%o5
	stw	%l5,	[%l7 + 0x6C]
	fmovdvc	%xcc,	%f30,	%f6
	edge16n	%i3,	%l6,	%o7
	fmovsvc	%icc,	%f31,	%f17
	sra	%i2,	0x0F,	%o6
	restore %l0, 0x1D4E, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i4,	0x1FAF,	%g5
	nop
	set	0x5F, %i0
	stb	%g1,	[%l7 + %i0]
	fmovdge	%xcc,	%f21,	%f1
	andn	%g2,	%l1,	%l2
	orn	%o4,	%g4,	%l4
	fmovdg	%xcc,	%f31,	%f31
	fcmpne16	%f10,	%f6,	%o2
	ldsb	[%l7 + 0x3C],	%g6
	sub	%l3,	%i7,	%i0
	ldd	[%l7 + 0x48],	%o2
	or	%i5,	0x0E65,	%o1
	ldsw	[%l7 + 0x0C],	%i6
	movg	%icc,	%o0,	%i1
	array8	%o5,	%g3,	%i3
	sir	0x11A5
	edge16ln	%l5,	%o7,	%l6
	smul	%i2,	0x046B,	%l0
	sir	0x0DDA
	sethi	0x0CB8,	%o6
	sub	%g7,	%g5,	%i4
	sth	%g1,	[%l7 + 0x6E]
	smulcc	%g2,	%l1,	%l2
	fxor	%f24,	%f24,	%f24
	sdiv	%o4,	0x01B5,	%g4
	movle	%icc,	%o2,	%l4
	movcc	%xcc,	%l3,	%g6
	add	%i0,	0x120D,	%i7
	fnot1	%f8,	%f6
	addc	%i5,	%o1,	%o3
	sir	0x0ABB
	andcc	%o0,	%i6,	%o5
	array16	%g3,	%i3,	%l5
	fpadd32	%f26,	%f4,	%f14
	movleu	%icc,	%i1,	%l6
	ldsh	[%l7 + 0x32],	%i2
	sdivcc	%l0,	0x1234,	%o7
	edge32l	%o6,	%g7,	%i4
	srax	%g1,	0x0B,	%g5
	fmovrdne	%l1,	%f26,	%f4
	fmovrslz	%l2,	%f23,	%f23
	orcc	%g2,	0x039B,	%g4
	edge32n	%o2,	%o4,	%l4
	ldsh	[%l7 + 0x30],	%l3
	fmovscs	%icc,	%f0,	%f14
	andcc	%i0,	%i7,	%i5
	movrgez	%o1,	0x0F4,	%o3
	fmovsa	%xcc,	%f10,	%f6
	movvs	%xcc,	%g6,	%o0
	edge32n	%i6,	%g3,	%o5
	subcc	%l5,	0x10B0,	%i1
	addccc	%i3,	%i2,	%l0
	fcmpeq32	%f12,	%f4,	%l6
	mulx	%o7,	0x0D42,	%g7
	ldub	[%l7 + 0x2A],	%i4
	subccc	%g1,	%g5,	%l1
	movpos	%icc,	%l2,	%o6
	movrlz	%g4,	0x064,	%g2
	sethi	0x1660,	%o4
	movge	%xcc,	%l4,	%l3
	or	%i0,	0x1F12,	%o2
	sra	%i5,	0x1A,	%i7
	fmovsvc	%icc,	%f10,	%f20
	and	%o3,	%o1,	%g6
	fornot1s	%f3,	%f14,	%f27
	andcc	%i6,	%o0,	%g3
	save %l5, 0x1D77, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i3,	0x0737,	%o5
	srl	%l0,	%l6,	%o7
	stx	%i2,	[%l7 + 0x30]
	fmovdcc	%xcc,	%f28,	%f11
	movl	%xcc,	%i4,	%g7
	addccc	%g1,	0x1E64,	%g5
	sra	%l2,	0x13,	%l1
	sdivcc	%g4,	0x16EA,	%g2
	sub	%o6,	%o4,	%l4
	save %i0, %l3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i5,	0x1949,	%o3
	movneg	%xcc,	%o1,	%i7
	sllx	%i6,	%o0,	%g6
	edge8	%g3,	%l5,	%i1
	fpack32	%f22,	%f24,	%f4
	movpos	%icc,	%o5,	%i3
	ldub	[%l7 + 0x45],	%l0
	fcmpne16	%f8,	%f6,	%o7
	stw	%i2,	[%l7 + 0x14]
	subc	%i4,	0x1EE9,	%l6
	st	%f1,	[%l7 + 0x08]
	fmovsneg	%icc,	%f14,	%f5
	movvc	%xcc,	%g7,	%g1
	mulscc	%g5,	%l2,	%g4
	movne	%icc,	%l1,	%g2
	orncc	%o4,	%o6,	%l4
	movcc	%icc,	%l3,	%i0
	subcc	%o2,	0x05C8,	%i5
	fcmpgt32	%f12,	%f14,	%o1
	ldsh	[%l7 + 0x10],	%i7
	fpack32	%f24,	%f26,	%f2
	mulx	%i6,	%o0,	%o3
	edge32n	%g6,	%l5,	%i1
	array16	%o5,	%i3,	%l0
	movrlz	%o7,	%g3,	%i2
	fmovsn	%xcc,	%f20,	%f9
	sethi	0x0961,	%i4
	mova	%icc,	%l6,	%g7
	movpos	%icc,	%g1,	%g5
	nop
	set	0x50, %g2
	lduh	[%l7 + %g2],	%l2
	fsrc1s	%f19,	%f18
	and	%l1,	%g4,	%g2
	udivcc	%o6,	0x1AE0,	%l4
	ldsh	[%l7 + 0x1E],	%o4
	fmovrsgez	%l3,	%f3,	%f4
	xnorcc	%o2,	0x18B4,	%i5
	movl	%icc,	%o1,	%i0
	stb	%i6,	[%l7 + 0x7D]
	movn	%icc,	%o0,	%o3
	movre	%i7,	%g6,	%l5
	fpmerge	%f28,	%f10,	%f0
	udivcc	%i1,	0x16E7,	%o5
	mova	%icc,	%i3,	%l0
	movrne	%g3,	%i2,	%o7
	movl	%icc,	%i4,	%l6
	sir	0x1A31
	fandnot2	%f24,	%f16,	%f16
	movre	%g1,	0x35F,	%g5
	fmovrdlez	%g7,	%f10,	%f2
	fmovdcs	%icc,	%f18,	%f21
	lduh	[%l7 + 0x7C],	%l2
	fmovsa	%icc,	%f9,	%f26
	fpsub32	%f2,	%f10,	%f4
	fabsd	%f6,	%f30
	ldd	[%l7 + 0x70],	%g4
	srax	%l1,	0x19,	%o6
	fxnors	%f18,	%f15,	%f8
	move	%icc,	%g2,	%o4
	umulcc	%l3,	%o2,	%l4
	edge32n	%o1,	%i0,	%i5
	movle	%icc,	%o0,	%i6
	sll	%o3,	%i7,	%l5
	andcc	%g6,	0x0A74,	%o5
	st	%f25,	[%l7 + 0x60]
	array8	%i1,	%l0,	%g3
	smul	%i3,	0x0587,	%i2
	andncc	%o7,	%l6,	%g1
	ldd	[%l7 + 0x30],	%g4
	stb	%i4,	[%l7 + 0x5C]
	sth	%l2,	[%l7 + 0x42]
	mova	%xcc,	%g4,	%g7
	ld	[%l7 + 0x14],	%f15
	movcs	%xcc,	%l1,	%o6
	andn	%o4,	0x115C,	%l3
	orcc	%o2,	%l4,	%g2
	sll	%i0,	%i5,	%o0
	ld	[%l7 + 0x78],	%f10
	mova	%icc,	%i6,	%o3
	edge16n	%o1,	%i7,	%l5
	edge8l	%o5,	%i1,	%g6
	edge16l	%l0,	%g3,	%i2
	movl	%xcc,	%o7,	%i3
	movge	%xcc,	%g1,	%g5
	sir	0x0F94
	umulcc	%i4,	%l2,	%l6
	xnor	%g7,	0x0A68,	%l1
	edge8	%o6,	%o4,	%g4
	mulscc	%l3,	0x0045,	%l4
	movrlez	%g2,	%i0,	%o2
	edge16n	%i5,	%i6,	%o0
	edge16ln	%o3,	%i7,	%l5
	orn	%o1,	0x1C21,	%i1
	movn	%icc,	%o5,	%g6
	array32	%g3,	%l0,	%o7
	edge8	%i3,	%i2,	%g5
	subcc	%i4,	%g1,	%l2
	orn	%g7,	%l1,	%o6
	edge16	%o4,	%g4,	%l6
	ldsw	[%l7 + 0x60],	%l3
	sll	%l4,	%g2,	%o2
	stb	%i0,	[%l7 + 0x58]
	stw	%i5,	[%l7 + 0x30]
	ldsh	[%l7 + 0x6A],	%o0
	movpos	%icc,	%i6,	%i7
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fpadd32s	%f21,	%f20,	%f5
	std	%f26,	[%l7 + 0x18]
	movcs	%icc,	%i1,	%g6
	ldsh	[%l7 + 0x72],	%g3
	movne	%xcc,	%o5,	%o7
	fmovsn	%icc,	%f30,	%f12
	st	%f29,	[%l7 + 0x74]
	stw	%i3,	[%l7 + 0x44]
	movneg	%icc,	%l0,	%i2
	fmovscc	%icc,	%f7,	%f9
	movvc	%xcc,	%g5,	%i4
	array32	%g1,	%g7,	%l1
	movvc	%xcc,	%o6,	%o4
	srax	%l2,	%l6,	%g4
	ldsb	[%l7 + 0x0D],	%l3
	movrlz	%l4,	%g2,	%o2
	movcs	%xcc,	%i5,	%o0
	nop
	set	0x08, %o3
	lduh	[%l7 + %o3],	%i0
	ld	[%l7 + 0x50],	%f9
	array16	%i7,	%o3,	%o1
	edge16l	%l5,	%i1,	%i6
	movgu	%xcc,	%g6,	%o5
	srlx	%g3,	0x11,	%i3
	movcc	%xcc,	%l0,	%o7
	ld	[%l7 + 0x4C],	%f26
	fmul8x16au	%f0,	%f17,	%f28
	array32	%g5,	%i4,	%i2
	subcc	%g7,	0x0FDD,	%g1
	edge8l	%o6,	%l1,	%o4
	movrlz	%l6,	%l2,	%l3
	fornot2	%f24,	%f20,	%f4
	srax	%g4,	0x14,	%l4
	addcc	%g2,	%o2,	%i5
	st	%f26,	[%l7 + 0x58]
	subcc	%i0,	0x1A28,	%o0
	array32	%i7,	%o1,	%l5
	addccc	%o3,	%i1,	%g6
	umulcc	%i6,	0x14D0,	%g3
	edge32l	%i3,	%o5,	%l0
	ldub	[%l7 + 0x67],	%o7
	mulx	%i4,	%i2,	%g7
	fmovsleu	%icc,	%f24,	%f12
	fmovsvs	%xcc,	%f6,	%f19
	sra	%g1,	0x06,	%g5
	xorcc	%o6,	0x1964,	%o4
	fexpand	%f17,	%f20
	ldsw	[%l7 + 0x18],	%l1
	ldd	[%l7 + 0x60],	%f2
	fpsub16s	%f18,	%f7,	%f14
	sra	%l6,	%l3,	%l2
	mova	%icc,	%l4,	%g2
	addcc	%o2,	0x04DE,	%g4
	sra	%i5,	%o0,	%i0
	sdivx	%o1,	0x01AB,	%l5
	fmovdcs	%xcc,	%f9,	%f27
	fnot1	%f18,	%f22
	movn	%xcc,	%i7,	%i1
	addcc	%g6,	%o3,	%g3
	movpos	%icc,	%i3,	%o5
	sub	%l0,	0x0331,	%o7
	movgu	%icc,	%i6,	%i4
	fmovsgu	%icc,	%f5,	%f16
	fmovrsgz	%g7,	%f14,	%f4
	sdivx	%i2,	0x16A1,	%g5
	fmovrdlz	%g1,	%f26,	%f6
	mova	%xcc,	%o6,	%l1
	stb	%l6,	[%l7 + 0x34]
	movpos	%icc,	%o4,	%l3
	array16	%l4,	%l2,	%o2
	addccc	%g2,	0x054C,	%i5
	subcc	%o0,	%i0,	%o1
	fmovsvs	%xcc,	%f25,	%f16
	xnorcc	%l5,	0x05C0,	%i7
	movne	%xcc,	%g4,	%g6
	fnors	%f5,	%f23,	%f7
	edge16l	%i1,	%o3,	%g3
	addccc	%o5,	0x1566,	%i3
	orcc	%l0,	0x0473,	%o7
	fandnot2s	%f11,	%f16,	%f21
	stw	%i4,	[%l7 + 0x3C]
	edge8ln	%i6,	%i2,	%g5
	std	%f24,	[%l7 + 0x18]
	fcmpgt16	%f18,	%f18,	%g1
	srax	%o6,	%g7,	%l6
	addccc	%o4,	0x16C8,	%l1
	fmovsge	%xcc,	%f12,	%f31
	movrne	%l3,	%l2,	%l4
	edge32l	%o2,	%g2,	%i5
	array8	%i0,	%o0,	%l5
	edge32l	%i7,	%o1,	%g4
	umulcc	%i1,	%o3,	%g3
	udiv	%g6,	0x12DF,	%i3
	movre	%o5,	%l0,	%i4
	movrlz	%o7,	0x13D,	%i2
	and	%g5,	0x19BC,	%g1
	fmovdg	%icc,	%f0,	%f12
	addccc	%o6,	%i6,	%g7
	movrne	%l6,	0x1AF,	%o4
	umulcc	%l1,	0x143F,	%l3
	sir	0x0AA7
	array32	%l2,	%l4,	%g2
	save %i5, %i0, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o2,	%i7,	%l5
	movcc	%xcc,	%o1,	%i1
	umul	%o3,	%g3,	%g6
	fpadd32s	%f25,	%f10,	%f30
	movle	%xcc,	%g4,	%i3
	fmovsn	%xcc,	%f24,	%f24
	orcc	%l0,	%o5,	%i4
	subcc	%i2,	%g5,	%o7
	lduw	[%l7 + 0x0C],	%g1
	sethi	0x0275,	%i6
	edge32ln	%o6,	%g7,	%l6
	xor	%o4,	%l3,	%l2
	fmovsn	%xcc,	%f17,	%f12
	fabss	%f9,	%f12
	movrgz	%l1,	0x281,	%g2
	sub	%l4,	%i5,	%i0
	edge16n	%o0,	%i7,	%o2
	sub	%o1,	%l5,	%o3
	fpadd32	%f24,	%f22,	%f14
	fmul8ulx16	%f8,	%f24,	%f20
	addcc	%i1,	%g3,	%g4
	sdivcc	%i3,	0x0229,	%g6
	fpadd32	%f24,	%f18,	%f8
	fmovrsgez	%o5,	%f0,	%f7
	nop
	set	0x32, %o6
	stb	%i4,	[%l7 + %o6]
	movg	%xcc,	%l0,	%g5
	umul	%i2,	0x1227,	%o7
	sdivcc	%i6,	0x0173,	%o6
	movge	%xcc,	%g1,	%g7
	st	%f22,	[%l7 + 0x48]
	fpadd16s	%f6,	%f19,	%f2
	add	%l6,	%o4,	%l3
	fsrc1	%f18,	%f28
	alignaddr	%l2,	%l1,	%l4
	edge32n	%g2,	%i5,	%o0
	orcc	%i7,	0x04C5,	%i0
	orn	%o2,	%o1,	%o3
	fzeros	%f13
	fands	%f20,	%f27,	%f25
	movrne	%l5,	0x251,	%g3
	umul	%g4,	0x07E4,	%i1
	movvc	%icc,	%i3,	%g6
	sdivx	%i4,	0x0A4D,	%l0
	orn	%g5,	%o5,	%o7
	addccc	%i6,	%o6,	%i2
	std	%f10,	[%l7 + 0x48]
	xorcc	%g7,	0x0C93,	%l6
	std	%f6,	[%l7 + 0x28]
	umulcc	%o4,	%g1,	%l2
	fcmpes	%fcc1,	%f11,	%f23
	fmul8sux16	%f8,	%f12,	%f2
	edge16ln	%l1,	%l4,	%g2
	lduw	[%l7 + 0x44],	%i5
	smulcc	%o0,	0x0934,	%i7
	fpsub16s	%f7,	%f3,	%f22
	srax	%i0,	0x1F,	%l3
	edge8n	%o2,	%o3,	%o1
	smul	%l5,	0x0C19,	%g3
	edge32ln	%i1,	%i3,	%g4
	ldd	[%l7 + 0x08],	%g6
	fmovs	%f15,	%f11
	std	%f22,	[%l7 + 0x60]
	umulcc	%i4,	0x0C53,	%g5
	fcmple32	%f4,	%f10,	%l0
	fmovscs	%icc,	%f17,	%f4
	fsrc1s	%f28,	%f16
	ldsh	[%l7 + 0x7C],	%o7
	xnor	%i6,	0x1FFD,	%o5
	restore %o6, %i2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x34],	%l6
	andncc	%o4,	%l2,	%l1
	fexpand	%f9,	%f8
	std	%f0,	[%l7 + 0x78]
	movl	%xcc,	%l4,	%g1
	nop
	set	0x58, %i1
	lduh	[%l7 + %i1],	%g2
	edge32l	%i5,	%i7,	%o0
	movcc	%xcc,	%i0,	%l3
	xorcc	%o2,	%o1,	%o3
	umul	%g3,	%i1,	%i3
	movrlez	%g4,	%g6,	%l5
	fmovsneg	%xcc,	%f30,	%f21
	edge8	%i4,	%g5,	%l0
	addcc	%i6,	%o7,	%o5
	addcc	%i2,	%o6,	%g7
	fornot1	%f18,	%f24,	%f22
	movl	%xcc,	%l6,	%l2
	fcmpgt16	%f26,	%f14,	%o4
	ldub	[%l7 + 0x55],	%l1
	fsrc2	%f20,	%f14
	fsrc1	%f30,	%f12
	movl	%icc,	%g1,	%l4
	andcc	%g2,	%i5,	%i7
	movge	%icc,	%o0,	%l3
	smul	%i0,	0x1CA5,	%o1
	ldub	[%l7 + 0x17],	%o2
	sir	0x1468
	fmovrslz	%g3,	%f28,	%f18
	fnot1s	%f21,	%f12
	addc	%i1,	%o3,	%i3
	addcc	%g6,	0x1D1F,	%g4
	ldsh	[%l7 + 0x76],	%i4
	movleu	%icc,	%g5,	%l5
	movn	%xcc,	%i6,	%l0
	std	%f30,	[%l7 + 0x08]
	movcc	%xcc,	%o7,	%i2
	edge32l	%o5,	%g7,	%o6
	movre	%l6,	0x313,	%l2
	edge8	%o4,	%g1,	%l4
	fandnot2	%f8,	%f8,	%f0
	ldd	[%l7 + 0x30],	%l0
	movpos	%icc,	%g2,	%i7
	ldsw	[%l7 + 0x2C],	%o0
	fpsub16	%f18,	%f16,	%f26
	edge16n	%i5,	%i0,	%o1
	movvs	%xcc,	%l3,	%o2
	andncc	%i1,	%g3,	%o3
	st	%f29,	[%l7 + 0x24]
	andcc	%i3,	%g6,	%g4
	umulcc	%i4,	0x0EDC,	%l5
	movne	%icc,	%i6,	%g5
	fmovrsne	%l0,	%f24,	%f6
	umul	%i2,	%o7,	%o5
	movl	%xcc,	%g7,	%o6
	fmuld8ulx16	%f19,	%f15,	%f20
	movrlez	%l2,	0x3FD,	%o4
	fpsub16s	%f1,	%f24,	%f10
	fpadd16s	%f17,	%f5,	%f20
	ldd	[%l7 + 0x20],	%g0
	edge8n	%l6,	%l1,	%g2
	fmovdge	%icc,	%f27,	%f22
	fcmped	%fcc2,	%f22,	%f4
	edge16n	%i7,	%l4,	%o0
	movne	%xcc,	%i0,	%o1
	alignaddrl	%i5,	%l3,	%i1
	ldd	[%l7 + 0x60],	%o2
	xorcc	%g3,	0x15E5,	%i3
	addccc	%g6,	0x0EEA,	%g4
	edge16	%i4,	%l5,	%o3
	movg	%icc,	%i6,	%g5
	sth	%l0,	[%l7 + 0x48]
	movrlz	%o7,	0x336,	%o5
	array8	%g7,	%i2,	%o6
	edge8n	%o4,	%g1,	%l2
	sll	%l6,	0x0C,	%l1
	movn	%icc,	%g2,	%i7
	edge32n	%o0,	%l4,	%i0
	sll	%i5,	0x04,	%l3
	movg	%icc,	%o1,	%i1
	udiv	%g3,	0x0751,	%o2
	movg	%icc,	%i3,	%g6
	smul	%i4,	%g4,	%l5
	fmovdl	%icc,	%f3,	%f19
	fpadd32s	%f5,	%f12,	%f24
	fnot1s	%f2,	%f20
	movcs	%icc,	%o3,	%g5
	movrgez	%i6,	0x3AC,	%o7
	fsrc2s	%f25,	%f21
	movne	%xcc,	%o5,	%l0
	sdivcc	%i2,	0x1673,	%o6
	ldub	[%l7 + 0x63],	%g7
	movne	%xcc,	%o4,	%l2
	xnor	%g1,	%l1,	%l6
	fands	%f11,	%f2,	%f31
	fmuld8ulx16	%f8,	%f8,	%f8
	ld	[%l7 + 0x30],	%f8
	mulscc	%i7,	%o0,	%g2
	array16	%i0,	%l4,	%i5
	ld	[%l7 + 0x24],	%f17
	movrgz	%o1,	%i1,	%l3
	edge32n	%g3,	%i3,	%o2
	edge8ln	%i4,	%g4,	%l5
	srax	%o3,	%g6,	%g5
	movvc	%xcc,	%o7,	%o5
	edge8l	%i6,	%l0,	%i2
	mulx	%o6,	%g7,	%l2
	subccc	%g1,	0x1520,	%o4
	xor	%l6,	0x0AB1,	%i7
	movrgez	%l1,	%o0,	%g2
	alignaddrl	%i0,	%l4,	%o1
	ldsw	[%l7 + 0x40],	%i1
	popc	%i5,	%l3
	movrlz	%g3,	%o2,	%i4
	ldx	[%l7 + 0x40],	%i3
	ldsb	[%l7 + 0x61],	%l5
	movrlz	%o3,	0x353,	%g6
	ldsh	[%l7 + 0x3E],	%g5
	sth	%o7,	[%l7 + 0x36]
	movgu	%icc,	%g4,	%o5
	movl	%icc,	%i6,	%i2
	mova	%icc,	%o6,	%l0
	move	%xcc,	%g7,	%l2
	movleu	%xcc,	%o4,	%l6
	lduh	[%l7 + 0x72],	%i7
	ldd	[%l7 + 0x18],	%f8
	andcc	%g1,	%o0,	%g2
	umul	%i0,	0x1F08,	%l1
	ldsh	[%l7 + 0x34],	%l4
	or	%o1,	0x1212,	%i1
	movne	%icc,	%i5,	%l3
	movgu	%xcc,	%g3,	%i4
	udiv	%i3,	0x1483,	%o2
	movn	%xcc,	%l5,	%g6
	movrlz	%g5,	0x32F,	%o7
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	sir	0x1BE4
	ldub	[%l7 + 0x32],	%i2
	movleu	%xcc,	%o5,	%o6
	alignaddrl	%g7,	%l2,	%o4
	edge16n	%l0,	%l6,	%g1
	sir	0x0C84
	fcmpeq32	%f2,	%f22,	%i7
	fmul8x16	%f29,	%f28,	%f30
	nop
	set	0x7A, %i2
	sth	%o0,	[%l7 + %i2]
	sdiv	%i0,	0x19ED,	%g2
	st	%f11,	[%l7 + 0x38]
	andcc	%l1,	0x17EA,	%o1
	udivx	%l4,	0x0D50,	%i1
	edge8l	%i5,	%g3,	%l3
	fsrc2s	%f31,	%f27
	smul	%i3,	%i4,	%l5
	xnorcc	%o2,	%g6,	%o7
	andn	%o3,	%g5,	%g4
	ldx	[%l7 + 0x58],	%i6
	edge16n	%o5,	%i2,	%o6
	fcmps	%fcc0,	%f12,	%f11
	fmul8x16al	%f0,	%f15,	%f26
	mulscc	%g7,	%l2,	%l0
	or	%l6,	%g1,	%i7
	movleu	%icc,	%o0,	%o4
	fornot2	%f2,	%f30,	%f16
	mova	%icc,	%i0,	%l1
	andn	%g2,	%o1,	%l4
	fandnot1	%f4,	%f14,	%f26
	edge32ln	%i5,	%g3,	%i1
	smulcc	%l3,	0x1647,	%i3
	edge8n	%l5,	%o2,	%i4
	fandnot1	%f16,	%f30,	%f0
	srax	%o7,	%o3,	%g6
	std	%f0,	[%l7 + 0x30]
	edge32ln	%g5,	%i6,	%o5
	movrne	%i2,	%o6,	%g4
	sethi	0x1D13,	%g7
	sdivx	%l2,	0x0610,	%l6
	or	%l0,	0x0574,	%i7
	array16	%g1,	%o4,	%i0
	fxnor	%f22,	%f16,	%f4
	addccc	%o0,	%g2,	%o1
	sub	%l1,	0x0B66,	%l4
	fmovrdgez	%g3,	%f28,	%f20
	array16	%i5,	%i1,	%i3
	smulcc	%l3,	%l5,	%o2
	fnors	%f12,	%f25,	%f15
	movleu	%icc,	%i4,	%o7
	udivx	%o3,	0x0241,	%g6
	sll	%g5,	0x0A,	%o5
	movpos	%icc,	%i6,	%i2
	std	%f2,	[%l7 + 0x48]
	ldsw	[%l7 + 0x20],	%g4
	fand	%f28,	%f10,	%f2
	lduw	[%l7 + 0x64],	%g7
	movrlez	%l2,	0x313,	%o6
	fones	%f2
	pdist	%f24,	%f8,	%f6
	sdivx	%l6,	0x09A1,	%i7
	fmovda	%xcc,	%f16,	%f2
	sllx	%g1,	0x15,	%o4
	popc	0x0F58,	%i0
	edge16ln	%l0,	%g2,	%o1
	xorcc	%l1,	%l4,	%o0
	movge	%icc,	%g3,	%i5
	save %i3, %l3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i1,	%o2,	%o7
	stb	%i4,	[%l7 + 0x17]
	movrgez	%g6,	0x19B,	%o3
	movcc	%xcc,	%o5,	%i6
	movgu	%xcc,	%i2,	%g4
	addc	%g5,	%l2,	%g7
	fsrc2s	%f21,	%f12
	orcc	%l6,	%o6,	%i7
	andncc	%g1,	%o4,	%l0
	srlx	%i0,	%o1,	%l1
	movleu	%xcc,	%l4,	%g2
	ldub	[%l7 + 0x0F],	%g3
	movrne	%o0,	0x0A4,	%i3
	srax	%l3,	%i5,	%l5
	lduw	[%l7 + 0x14],	%i1
	fandnot1s	%f16,	%f6,	%f9
	edge8n	%o7,	%o2,	%g6
	stx	%o3,	[%l7 + 0x70]
	movneg	%icc,	%o5,	%i6
	fmovrslez	%i4,	%f6,	%f9
	sdiv	%i2,	0x0B9F,	%g5
	sub	%l2,	%g7,	%l6
	fmovsne	%icc,	%f30,	%f30
	sra	%g4,	%i7,	%g1
	nop
	set	0x38, %i4
	lduw	[%l7 + %i4],	%o6
	alignaddrl	%l0,	%o4,	%i0
	stx	%l1,	[%l7 + 0x38]
	fcmpd	%fcc0,	%f20,	%f12
	lduh	[%l7 + 0x3A],	%o1
	fmovsl	%xcc,	%f7,	%f10
	and	%l4,	%g3,	%o0
	sra	%i3,	%g2,	%l3
	sir	0x07B5
	andcc	%l5,	%i1,	%o7
	movle	%xcc,	%o2,	%g6
	array32	%o3,	%i5,	%o5
	fors	%f2,	%f8,	%f31
	movcc	%icc,	%i6,	%i4
	srax	%i2,	0x1B,	%l2
	fmovdneg	%xcc,	%f7,	%f8
	addccc	%g7,	0x11DC,	%g5
	fnands	%f1,	%f2,	%f4
	fpsub32s	%f9,	%f14,	%f28
	movg	%xcc,	%g4,	%i7
	movge	%xcc,	%l6,	%o6
	movrgez	%l0,	%o4,	%i0
	restore %g1, %l1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l4,	%o0
	ld	[%l7 + 0x10],	%f13
	edge32	%g3,	%g2,	%i3
	fpsub16s	%f12,	%f22,	%f16
	std	%f26,	[%l7 + 0x48]
	movl	%xcc,	%l5,	%l3
	sethi	0x1F46,	%o7
	fmovdge	%xcc,	%f18,	%f2
	udivx	%o2,	0x101C,	%g6
	fcmple32	%f16,	%f12,	%o3
	fmul8ulx16	%f22,	%f8,	%f26
	movvc	%xcc,	%i1,	%i5
	fnegd	%f6,	%f12
	sllx	%i6,	%i4,	%i2
	mulx	%o5,	%l2,	%g5
	ldsh	[%l7 + 0x26],	%g7
	movneg	%icc,	%g4,	%i7
	movrgez	%o6,	0x379,	%l6
	lduw	[%l7 + 0x30],	%o4
	fsrc1	%f18,	%f24
	ldsh	[%l7 + 0x40],	%l0
	movleu	%icc,	%i0,	%g1
	edge32l	%o1,	%l1,	%o0
	movge	%icc,	%g3,	%l4
	lduw	[%l7 + 0x44],	%g2
	addcc	%l5,	0x1D76,	%i3
	sra	%o7,	%o2,	%l3
	sra	%g6,	0x16,	%i1
	popc	%o3,	%i6
	edge16ln	%i5,	%i2,	%o5
	move	%xcc,	%i4,	%g5
	sethi	0x0EEB,	%l2
	mulx	%g4,	0x07F7,	%i7
	andcc	%o6,	%l6,	%g7
	and	%l0,	0x0153,	%o4
	movge	%xcc,	%g1,	%o1
	smul	%l1,	0x060A,	%i0
	or	%g3,	0x0497,	%l4
	movneg	%icc,	%o0,	%g2
	movvs	%xcc,	%i3,	%o7
	edge32n	%o2,	%l3,	%l5
	fornot1	%f12,	%f12,	%f6
	ld	[%l7 + 0x0C],	%f27
	ldx	[%l7 + 0x60],	%g6
	sub	%o3,	0x0E29,	%i1
	orn	%i6,	%i5,	%i2
	xor	%o5,	%g5,	%i4
	fsrc1	%f12,	%f2
	fzero	%f24
	fmovdg	%icc,	%f18,	%f19
	movgu	%xcc,	%g4,	%i7
	fzero	%f0
	sdivx	%l2,	0x136B,	%l6
	orncc	%g7,	%l0,	%o4
	fpack32	%f0,	%f14,	%f6
	and	%g1,	0x16DF,	%o6
	orn	%o1,	0x19BB,	%l1
	fmovs	%f14,	%f9
	edge32ln	%g3,	%i0,	%l4
	fmovsl	%xcc,	%f6,	%f11
	movrlz	%o0,	%g2,	%i3
	orcc	%o2,	0x1CCB,	%l3
	fzeros	%f9
	fpadd16s	%f1,	%f20,	%f16
	movrlz	%l5,	0x26E,	%g6
	movl	%xcc,	%o7,	%o3
	fmovscs	%icc,	%f3,	%f15
	sllx	%i6,	%i1,	%i2
	fmovrdgez	%o5,	%f24,	%f8
	orn	%g5,	%i4,	%g4
	srl	%i7,	%l2,	%l6
	edge32ln	%g7,	%i5,	%o4
	array8	%g1,	%l0,	%o6
	fmovrdgez	%l1,	%f14,	%f16
	movrgz	%g3,	0x3B1,	%i0
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%o1
	fmovsge	%xcc,	%f1,	%f9
	fxor	%f28,	%f30,	%f24
	sdiv	%o0,	0x09D3,	%g2
	ldsw	[%l7 + 0x30],	%i3
	ldsw	[%l7 + 0x60],	%o2
	addccc	%l4,	0x12BE,	%l5
	udivx	%g6,	0x0C47,	%o7
	movl	%xcc,	%l3,	%i6
	movcs	%xcc,	%o3,	%i2
	fmul8ulx16	%f20,	%f12,	%f24
	fxors	%f17,	%f14,	%f11
	addcc	%i1,	%g5,	%i4
	fcmpeq16	%f12,	%f22,	%o5
	array16	%i7,	%g4,	%l6
	orn	%g7,	%l2,	%i5
	fpsub32	%f0,	%f30,	%f4
	edge8ln	%o4,	%l0,	%g1
	fors	%f15,	%f31,	%f10
	ldub	[%l7 + 0x13],	%o6
	sll	%l1,	0x11,	%g3
	fpsub16	%f16,	%f8,	%f26
	subccc	%o1,	0x0382,	%o0
	srax	%i0,	%g2,	%o2
	movre	%l4,	%l5,	%i3
	orn	%g6,	%l3,	%i6
	udivx	%o7,	0x122F,	%i2
	sethi	0x02B4,	%o3
	andn	%i1,	%g5,	%o5
	fsrc1	%f4,	%f24
	subcc	%i7,	%i4,	%l6
	subc	%g7,	0x139D,	%l2
	subc	%g4,	0x08A0,	%o4
	sth	%i5,	[%l7 + 0x0E]
	xnor	%g1,	0x066E,	%o6
	fnand	%f2,	%f6,	%f24
	andncc	%l0,	%g3,	%l1
	srax	%o1,	0x1D,	%o0
	fandnot1s	%f17,	%f15,	%f18
	movrgz	%i0,	%o2,	%g2
	andcc	%l4,	0x0BD0,	%i3
	popc	0x0ADD,	%g6
	andncc	%l5,	%l3,	%i6
	sethi	0x1F81,	%i2
	smul	%o3,	%o7,	%g5
	movg	%xcc,	%i1,	%i7
	mulx	%o5,	0x1815,	%l6
	movrgz	%g7,	%i4,	%l2
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%g4
	move	%xcc,	%o4,	%g1
	edge16	%o6,	%l0,	%i5
	fmovd	%f6,	%f20
	fnand	%f20,	%f24,	%f6
	xor	%l1,	0x0D9C,	%o1
	fmovdne	%icc,	%f11,	%f2
	movrne	%g3,	0x328,	%i0
	faligndata	%f24,	%f20,	%f0
	sethi	0x15F1,	%o2
	edge32n	%o0,	%g2,	%i3
	addcc	%g6,	0x0A24,	%l4
	ldsh	[%l7 + 0x40],	%l5
	addc	%i6,	0x1DAF,	%l3
	fmovsn	%icc,	%f12,	%f16
	movpos	%xcc,	%o3,	%i2
	movrgz	%o7,	%g5,	%i7
	fsrc2s	%f22,	%f31
	fmovde	%xcc,	%f31,	%f20
	andncc	%o5,	%i1,	%l6
	movne	%xcc,	%i4,	%l2
	stx	%g4,	[%l7 + 0x20]
	array16	%o4,	%g7,	%o6
	stx	%g1,	[%l7 + 0x18]
	movvs	%icc,	%i5,	%l0
	fmul8x16al	%f7,	%f23,	%f26
	fpack32	%f12,	%f26,	%f4
	ldd	[%l7 + 0x38],	%f0
	xnorcc	%l1,	0x1E2B,	%o1
	srl	%g3,	0x17,	%i0
	alignaddr	%o0,	%g2,	%o2
	lduh	[%l7 + 0x7C],	%i3
	edge8ln	%g6,	%l5,	%i6
	std	%f30,	[%l7 + 0x08]
	andcc	%l3,	%o3,	%l4
	array32	%o7,	%i2,	%g5
	smulcc	%o5,	%i1,	%l6
	fmovscs	%icc,	%f10,	%f20
	and	%i4,	%l2,	%i7
	fnot1s	%f22,	%f0
	movge	%xcc,	%o4,	%g7
	or	%o6,	0x1288,	%g4
	alignaddr	%i5,	%l0,	%g1
	bshuffle	%f6,	%f22,	%f14
	ldx	[%l7 + 0x20],	%o1
	fmovs	%f7,	%f27
	fmovdvc	%icc,	%f4,	%f19
	edge16ln	%l1,	%g3,	%o0
	edge16n	%i0,	%o2,	%g2
	movrgez	%i3,	0x125,	%g6
	array8	%i6,	%l3,	%l5
	movleu	%xcc,	%l4,	%o3
	xnorcc	%i2,	%g5,	%o5
	array8	%i1,	%o7,	%l6
	udivcc	%l2,	0x0D78,	%i4
	edge32ln	%i7,	%o4,	%o6
	nop
	set	0x78, %g4
	ldd	[%l7 + %g4],	%f8
	subccc	%g7,	0x09D4,	%i5
	xnorcc	%l0,	0x09B5,	%g4
	orncc	%g1,	0x04FE,	%o1
	move	%icc,	%g3,	%o0
	movcc	%icc,	%i0,	%l1
	movn	%icc,	%g2,	%i3
	sdivx	%g6,	0x0C26,	%i6
	umulcc	%o2,	0x0B52,	%l3
	stb	%l4,	[%l7 + 0x14]
	subc	%o3,	0x01B8,	%i2
	movl	%xcc,	%g5,	%o5
	xnorcc	%i1,	0x1AC9,	%l5
	xorcc	%l6,	0x1B21,	%l2
	edge8	%i4,	%i7,	%o4
	movgu	%icc,	%o6,	%g7
	movge	%icc,	%i5,	%o7
	movrgez	%l0,	0x2B1,	%g1
	sir	0x178A
	fmovrsgez	%g4,	%f3,	%f25
	fmovrsgez	%o1,	%f15,	%f17
	fpsub32s	%f24,	%f25,	%f26
	alignaddrl	%g3,	%o0,	%l1
	fexpand	%f1,	%f2
	orn	%g2,	%i0,	%i3
	orncc	%g6,	%i6,	%l3
	orncc	%o2,	0x174D,	%o3
	fmovrsgez	%i2,	%f8,	%f28
	ldsw	[%l7 + 0x34],	%g5
	fmuld8sux16	%f11,	%f11,	%f12
	st	%f8,	[%l7 + 0x64]
	movgu	%xcc,	%l4,	%i1
	popc	0x02B9,	%o5
	andn	%l5,	%l2,	%i4
	fmovdg	%icc,	%f9,	%f1
	fmovscs	%xcc,	%f11,	%f5
	movleu	%xcc,	%i7,	%l6
	sra	%o6,	%g7,	%i5
	ldsw	[%l7 + 0x4C],	%o4
	edge8n	%l0,	%o7,	%g1
	sir	0x1FF9
	faligndata	%f28,	%f12,	%f18
	sllx	%g4,	0x05,	%o1
	movneg	%icc,	%o0,	%g3
	fmovdg	%xcc,	%f6,	%f0
	fnot2s	%f22,	%f6
	fcmple32	%f22,	%f16,	%g2
	movpos	%xcc,	%l1,	%i3
	orn	%g6,	%i0,	%l3
	fmovde	%xcc,	%f7,	%f3
	udiv	%o2,	0x15CE,	%i6
	orn	%o3,	%i2,	%g5
	edge8l	%l4,	%i1,	%l5
	array32	%o5,	%i4,	%l2
	fsrc1s	%f9,	%f15
	sir	0x1A41
	add	%i7,	%o6,	%g7
	sth	%i5,	[%l7 + 0x14]
	std	%f4,	[%l7 + 0x30]
	ldsh	[%l7 + 0x60],	%o4
	edge16l	%l0,	%o7,	%l6
	movleu	%xcc,	%g4,	%g1
	xnorcc	%o0,	0x1FBC,	%o1
	smul	%g3,	0x1F98,	%l1
	sdivx	%i3,	0x1C4A,	%g2
	udivcc	%g6,	0x1518,	%i0
	addcc	%o2,	%i6,	%l3
	ldx	[%l7 + 0x28],	%o3
	edge32l	%i2,	%l4,	%i1
	and	%l5,	0x0D40,	%o5
	subcc	%g5,	0x0A04,	%l2
	alignaddrl	%i7,	%o6,	%g7
	sra	%i5,	0x00,	%i4
	edge16n	%l0,	%o4,	%l6
	andn	%o7,	%g4,	%o0
	fors	%f23,	%f29,	%f12
	popc	0x0925,	%g1
	edge32l	%g3,	%l1,	%i3
	stb	%g2,	[%l7 + 0x0A]
	ldsh	[%l7 + 0x30],	%o1
	movvc	%xcc,	%i0,	%g6
	movpos	%icc,	%i6,	%l3
	nop
	set	0x27, %o7
	stb	%o3,	[%l7 + %o7]
	movcs	%xcc,	%i2,	%l4
	mulx	%o2,	0x103E,	%i1
	nop
	set	0x24, %o5
	lduw	[%l7 + %o5],	%o5
	movn	%xcc,	%l5,	%g5
	edge8l	%i7,	%l2,	%o6
	sll	%g7,	%i4,	%l0
	movge	%icc,	%i5,	%o4
	addc	%l6,	0x133B,	%o7
	edge8n	%o0,	%g4,	%g1
	fpmerge	%f22,	%f22,	%f28
	fmovdvs	%icc,	%f17,	%f11
	andn	%g3,	0x0EE0,	%i3
	edge16l	%g2,	%o1,	%i0
	movrlez	%l1,	0x052,	%i6
	edge8n	%g6,	%l3,	%i2
	sdiv	%o3,	0x00B9,	%o2
	andcc	%l4,	%o5,	%i1
	stw	%g5,	[%l7 + 0x28]
	stb	%i7,	[%l7 + 0x40]
	save %l2, %l5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o6,	%l0,	%i4
	sllx	%i5,	%l6,	%o7
	subc	%o4,	%g4,	%o0
	subc	%g3,	0x17B2,	%i3
	edge8	%g2,	%o1,	%i0
	fmovdge	%xcc,	%f31,	%f3
	fandnot2s	%f1,	%f27,	%f22
	edge8n	%g1,	%l1,	%i6
	alignaddr	%g6,	%i2,	%o3
	fcmpd	%fcc2,	%f18,	%f16
	edge16l	%o2,	%l4,	%o5
	edge8	%l3,	%i1,	%g5
	fmovdvs	%icc,	%f7,	%f1
	fmovdvc	%xcc,	%f16,	%f18
	andncc	%i7,	%l2,	%l5
	ldd	[%l7 + 0x58],	%g6
	fmovdgu	%xcc,	%f11,	%f17
	movg	%xcc,	%o6,	%i4
	movrlez	%l0,	%i5,	%l6
	fcmpd	%fcc1,	%f0,	%f18
	alignaddrl	%o4,	%g4,	%o0
	movvc	%icc,	%o7,	%g3
	fmul8sux16	%f22,	%f16,	%f24
	ldx	[%l7 + 0x68],	%i3
	edge16l	%o1,	%i0,	%g2
	sdiv	%l1,	0x00AF,	%g1
	movn	%xcc,	%g6,	%i6
	srax	%i2,	0x11,	%o2
	fmovdpos	%xcc,	%f8,	%f31
	array32	%o3,	%o5,	%l4
	fmul8sux16	%f28,	%f28,	%f28
	move	%xcc,	%i1,	%l3
	array16	%i7,	%l2,	%g5
	andn	%g7,	%l5,	%i4
	fnor	%f2,	%f4,	%f22
	popc	%l0,	%i5
	edge8n	%o6,	%l6,	%o4
	fmovda	%xcc,	%f16,	%f31
	xor	%g4,	0x01E1,	%o0
	edge8l	%g3,	%o7,	%o1
	and	%i0,	%g2,	%i3
	mulscc	%l1,	0x1ED0,	%g6
	orn	%i6,	0x11E8,	%i2
	andcc	%g1,	%o2,	%o3
	mulscc	%o5,	0x1E81,	%i1
	fpmerge	%f9,	%f16,	%f12
	array32	%l3,	%l4,	%i7
	xor	%g5,	0x197E,	%g7
	fpadd32s	%f0,	%f17,	%f31
	edge16l	%l2,	%i4,	%l0
	movgu	%icc,	%l5,	%o6
	movne	%xcc,	%l6,	%i5
	fone	%f0
	sth	%o4,	[%l7 + 0x26]
	save %g4, %o0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o1,	0x1397,	%g3
	sir	0x1E80
	addc	%i0,	0x1E8A,	%g2
	alignaddrl	%l1,	%g6,	%i3
	fnot2	%f0,	%f10
	fmovse	%xcc,	%f26,	%f31
	srax	%i6,	%i2,	%g1
	mova	%icc,	%o3,	%o5
	fornot2s	%f30,	%f26,	%f27
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	edge16n	%l3,	%i7,	%l4
	sethi	0x13BF,	%g5
	movl	%icc,	%l2,	%g7
	save %l0, %i4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l6,	%l5
	array32	%i5,	%g4,	%o4
	mulscc	%o0,	0x0E7E,	%o7
	fxor	%f4,	%f22,	%f12
	orn	%g3,	0x1288,	%i0
	udiv	%o1,	0x0339,	%l1
	movcc	%icc,	%g6,	%g2
	ldsw	[%l7 + 0x70],	%i3
	sllx	%i2,	%i6,	%o3
	fcmpgt32	%f22,	%f20,	%g1
	ldd	[%l7 + 0x58],	%o4
	fmovdg	%icc,	%f9,	%f14
	fandnot2s	%f7,	%f4,	%f30
	fmovdneg	%xcc,	%f12,	%f6
	fcmpgt32	%f24,	%f0,	%i1
	addcc	%l3,	0x1821,	%o2
	movne	%icc,	%i7,	%g5
	stb	%l4,	[%l7 + 0x6B]
	fmul8x16	%f11,	%f24,	%f22
	movrlz	%g7,	0x203,	%l0
	sra	%l2,	%i4,	%o6
	edge16ln	%l5,	%i5,	%g4
	fmovrsgez	%l6,	%f17,	%f16
	bshuffle	%f14,	%f14,	%f0
	andcc	%o4,	%o7,	%o0
	orcc	%g3,	%i0,	%o1
	edge16n	%g6,	%g2,	%l1
	andncc	%i2,	%i3,	%i6
	movneg	%icc,	%o3,	%g1
	fmovdneg	%icc,	%f10,	%f26
	sethi	0x1DFB,	%i1
	orcc	%l3,	0x0417,	%o2
	fcmpgt32	%f30,	%f2,	%o5
	addccc	%g5,	%i7,	%g7
	move	%icc,	%l4,	%l2
	smul	%i4,	%o6,	%l5
	fcmple16	%f20,	%f28,	%l0
	fors	%f25,	%f25,	%f21
	movrgez	%i5,	0x1FC,	%l6
	addccc	%o4,	0x0E78,	%g4
	st	%f28,	[%l7 + 0x6C]
	smul	%o7,	0x09AC,	%g3
	movleu	%xcc,	%i0,	%o0
	xor	%o1,	0x16E1,	%g6
	movpos	%xcc,	%g2,	%i2
	movrne	%i3,	0x0B3,	%i6
	umulcc	%l1,	0x07C7,	%g1
	alignaddrl	%i1,	%o3,	%o2
	movneg	%icc,	%o5,	%l3
	alignaddrl	%g5,	%g7,	%l4
	movvc	%xcc,	%l2,	%i7
	ldx	[%l7 + 0x70],	%o6
	bshuffle	%f30,	%f6,	%f18
	sdivx	%i4,	0x1AB7,	%l5
	sdiv	%l0,	0x04E7,	%i5
	srlx	%l6,	%g4,	%o4
	fmovs	%f5,	%f31
	ldub	[%l7 + 0x75],	%o7
	addcc	%g3,	%o0,	%o1
	fnot1s	%f10,	%f7
	ld	[%l7 + 0x48],	%f25
	fmovrdlz	%i0,	%f8,	%f16
	edge8ln	%g2,	%i2,	%g6
	movle	%xcc,	%i6,	%l1
	srl	%g1,	%i1,	%i3
	fmul8x16au	%f23,	%f8,	%f2
	sll	%o3,	%o2,	%l3
	addccc	%g5,	0x0D2A,	%g7
	edge16ln	%o5,	%l2,	%l4
	movcs	%icc,	%i7,	%o6
	fnot1	%f0,	%f4
	edge16l	%l5,	%i4,	%l0
	fsrc2	%f24,	%f24
	array32	%i5,	%g4,	%l6
	nop
	set	0x0E, %l1
	ldsh	[%l7 + %l1],	%o4
	edge16	%o7,	%o0,	%g3
	fcmpne32	%f8,	%f0,	%o1
	edge8l	%g2,	%i2,	%g6
	edge32	%i0,	%l1,	%g1
	xnor	%i6,	0x1741,	%i1
	andncc	%o3,	%i3,	%o2
	ldub	[%l7 + 0x5D],	%g5
	edge16ln	%l3,	%g7,	%o5
	udivx	%l2,	0x095A,	%l4
	movcs	%icc,	%i7,	%l5
	edge32n	%i4,	%o6,	%i5
	edge8ln	%g4,	%l0,	%l6
	subcc	%o7,	%o4,	%g3
	ldsh	[%l7 + 0x3C],	%o0
	ldx	[%l7 + 0x40],	%g2
	orn	%i2,	%o1,	%i0
	movg	%xcc,	%l1,	%g6
	smulcc	%g1,	%i6,	%o3
	addccc	%i3,	0x0F88,	%i1
	fmovspos	%xcc,	%f11,	%f7
	xor	%g5,	%l3,	%g7
	movn	%xcc,	%o5,	%o2
	movn	%xcc,	%l2,	%l4
	for	%f22,	%f16,	%f14
	fones	%f24
	xnorcc	%i7,	0x06FD,	%i4
	movle	%icc,	%o6,	%l5
	movre	%i5,	0x2E0,	%g4
	movneg	%icc,	%l6,	%l0
	addccc	%o7,	0x1D9E,	%g3
	edge8ln	%o4,	%o0,	%g2
	fmovdne	%icc,	%f10,	%f3
	subccc	%i2,	0x0BDD,	%i0
	and	%l1,	0x07F1,	%g6
	ldd	[%l7 + 0x08],	%o0
	movneg	%xcc,	%g1,	%i6
	fzero	%f14
	movcc	%icc,	%i3,	%o3
	mulscc	%i1,	0x0948,	%g5
	movne	%xcc,	%l3,	%g7
	fcmpne32	%f10,	%f24,	%o5
	movcc	%icc,	%o2,	%l4
	array32	%i7,	%i4,	%o6
	save %l2, 0x0EE0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f29,	[%l7 + 0x38]
	stw	%l5,	[%l7 + 0x60]
	ldsb	[%l7 + 0x7B],	%l6
	alignaddr	%g4,	%l0,	%o7
	fmovrsgz	%o4,	%f24,	%f9
	stx	%o0,	[%l7 + 0x78]
	srax	%g3,	%i2,	%i0
	smulcc	%g2,	%l1,	%o1
	orncc	%g1,	%g6,	%i3
	fsrc1s	%f9,	%f18
	sethi	0x0393,	%o3
	movneg	%xcc,	%i1,	%i6
	movre	%l3,	0x3FD,	%g5
	orcc	%g7,	0x0D2C,	%o5
	umulcc	%o2,	%i7,	%l4
	alignaddr	%o6,	%l2,	%i5
	ldsb	[%l7 + 0x74],	%l5
	fmovde	%xcc,	%f18,	%f2
	udiv	%i4,	0x08B9,	%l6
	fxors	%f31,	%f15,	%f29
	addcc	%g4,	0x19C2,	%l0
	st	%f22,	[%l7 + 0x14]
	array16	%o7,	%o4,	%g3
	array8	%i2,	%i0,	%o0
	stx	%l1,	[%l7 + 0x18]
	restore %o1, 0x18BC, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x34],	%g6
	xnorcc	%i3,	%g1,	%o3
	fxnors	%f18,	%f10,	%f6
	mulscc	%i1,	%l3,	%g5
	movrlz	%i6,	0x0A8,	%g7
	edge32ln	%o2,	%o5,	%l4
	xnorcc	%o6,	0x13B4,	%i7
	addcc	%l2,	%l5,	%i5
	movcc	%xcc,	%l6,	%i4
	and	%l0,	%g4,	%o4
	movvs	%xcc,	%o7,	%g3
	sdiv	%i0,	0x07D6,	%i2
	ld	[%l7 + 0x44],	%f26
	ld	[%l7 + 0x64],	%f28
	fmovrsne	%l1,	%f26,	%f18
	save %o0, 0x1745, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	0x0BD1,	%g6
	udiv	%g1,	0x0356,	%o3
	movle	%xcc,	%i3,	%i1
	fxnors	%f19,	%f0,	%f19
	array32	%g5,	%i6,	%g7
	edge16l	%l3,	%o2,	%o5
	movcs	%icc,	%o6,	%i7
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	udivcc	%l6,	0x09C5,	%i4
	ldx	[%l7 + 0x30],	%l2
	sdiv	%l0,	0x190A,	%g4
	movvc	%icc,	%o7,	%o4
	std	%f4,	[%l7 + 0x70]
	sll	%g3,	0x00,	%i0
	fmovsle	%icc,	%f4,	%f12
	edge8n	%l1,	%i2,	%g2
	xnor	%o1,	%g6,	%o0
	movrgez	%o3,	%i3,	%g1
	popc	%g5,	%i1
	andn	%i6,	%g7,	%l3
	movleu	%icc,	%o2,	%o5
	movg	%icc,	%o6,	%i7
	nop
	set	0x7B, %l4
	stb	%l5,	[%l7 + %l4]
	orncc	%l4,	%l6,	%i4
	lduh	[%l7 + 0x40],	%l2
	fnor	%f10,	%f0,	%f12
	sdiv	%i5,	0x06D2,	%l0
	movcc	%icc,	%g4,	%o7
	restore %o4, %i0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0178,	%g3
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	stw	%g6,	[%l7 + 0x74]
	xnorcc	%o0,	0x1E25,	%o3
	lduw	[%l7 + 0x10],	%g1
	movcs	%icc,	%i3,	%i1
	udivx	%i6,	0x19D4,	%g5
	edge8l	%l3,	%g7,	%o2
	popc	%o5,	%i7
	movpos	%xcc,	%o6,	%l4
	movre	%l5,	%i4,	%l2
	udiv	%i5,	0x0D28,	%l6
	stx	%g4,	[%l7 + 0x10]
	move	%icc,	%o7,	%l0
	mova	%xcc,	%o4,	%l1
	lduh	[%l7 + 0x14],	%g3
	save %g2, 0x10DB, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i2,	0x0615,	%i0
	movgu	%icc,	%o0,	%g6
	movle	%xcc,	%o3,	%g1
	andn	%i3,	%i1,	%i6
	and	%g5,	0x0548,	%l3
	fmovdle	%xcc,	%f20,	%f16
	movle	%icc,	%o2,	%o5
	fnand	%f30,	%f2,	%f4
	sth	%i7,	[%l7 + 0x4E]
	edge8l	%o6,	%l4,	%l5
	array16	%i4,	%l2,	%g7
	movl	%icc,	%i5,	%g4
	addc	%l6,	%l0,	%o4
	movrne	%l1,	%o7,	%g2
	fmovsvs	%xcc,	%f9,	%f22
	fmovrdgez	%o1,	%f4,	%f6
	ldsb	[%l7 + 0x47],	%i2
	umul	%i0,	%o0,	%g3
	fpadd32	%f16,	%f2,	%f22
	umulcc	%o3,	%g6,	%i3
	orn	%g1,	0x1F1B,	%i1
	nop
	set	0x70, %l2
	stx	%i6,	[%l7 + %l2]
	movvc	%icc,	%l3,	%o2
	ldub	[%l7 + 0x6B],	%g5
	mulscc	%i7,	%o5,	%o6
	fcmpne16	%f2,	%f14,	%l4
	edge8n	%l5,	%l2,	%g7
	movcc	%xcc,	%i5,	%g4
	udivx	%l6,	0x0C94,	%l0
	udivx	%o4,	0x1065,	%l1
	fmovsneg	%icc,	%f22,	%f29
	alignaddr	%i4,	%o7,	%o1
	srax	%i2,	0x12,	%i0
	udiv	%o0,	0x0E28,	%g3
	movvc	%xcc,	%g2,	%o3
	fmovdl	%icc,	%f11,	%f12
	fnot1s	%f29,	%f27
	edge32	%i3,	%g1,	%g6
	fmovrdlez	%i6,	%f30,	%f26
	fmovscs	%xcc,	%f22,	%f13
	sra	%l3,	%i1,	%g5
	movne	%xcc,	%i7,	%o5
	restore %o6, %l4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x18],	%f10
	addccc	%l2,	%l5,	%i5
	sdivcc	%g4,	0x1FFD,	%g7
	lduw	[%l7 + 0x64],	%l0
	movle	%icc,	%o4,	%l6
	movrlz	%i4,	0x1A5,	%o7
	fsrc1s	%f8,	%f13
	mulx	%l1,	%o1,	%i2
	fmovrdlez	%o0,	%f24,	%f20
	for	%f0,	%f2,	%f30
	fnand	%f18,	%f14,	%f14
	smul	%g3,	%g2,	%i0
	edge8l	%i3,	%o3,	%g1
	fmovsvc	%xcc,	%f30,	%f23
	movcc	%icc,	%g6,	%i6
	edge16n	%l3,	%i1,	%i7
	xor	%o5,	0x1558,	%g5
	stw	%o6,	[%l7 + 0x2C]
	subcc	%o2,	0x1C97,	%l2
	movl	%icc,	%l4,	%i5
	movre	%l5,	0x237,	%g7
	stw	%g4,	[%l7 + 0x08]
	stx	%o4,	[%l7 + 0x68]
	orn	%l0,	%i4,	%o7
	edge8	%l1,	%l6,	%i2
	ldx	[%l7 + 0x18],	%o0
	xnor	%o1,	0x08EA,	%g2
	xnorcc	%i0,	%i3,	%o3
	fmovsleu	%xcc,	%f4,	%f9
	andn	%g1,	0x06AC,	%g6
	smul	%i6,	%g3,	%l3
	sir	0x1B64
	movn	%icc,	%i1,	%i7
	sdivcc	%o5,	0x1352,	%g5
	xorcc	%o6,	%l2,	%o2
	ldsw	[%l7 + 0x18],	%i5
	movrlez	%l5,	%l4,	%g4
	movcc	%icc,	%o4,	%g7
	orcc	%i4,	%l0,	%o7
	fornot2s	%f19,	%f14,	%f22
	fsrc1s	%f20,	%f17
	edge8n	%l1,	%i2,	%l6
	move	%xcc,	%o0,	%g2
	fmovsle	%xcc,	%f25,	%f27
	move	%xcc,	%o1,	%i0
	save %o3, 0x1816, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g1,	%g6,	%i6
	fpackfix	%f28,	%f8
	fmovs	%f12,	%f1
	xorcc	%g3,	0x0268,	%l3
	orncc	%i7,	%i1,	%g5
	movrlez	%o5,	%o6,	%o2
	addc	%l2,	%l5,	%l4
	fmovsvs	%icc,	%f26,	%f27
	fmovrdgez	%g4,	%f6,	%f2
	edge32n	%o4,	%i5,	%g7
	addcc	%l0,	0x13D5,	%i4
	sir	0x122C
	lduw	[%l7 + 0x08],	%l1
	st	%f22,	[%l7 + 0x30]
	subcc	%i2,	%l6,	%o7
	srlx	%g2,	%o1,	%o0
	movne	%icc,	%i0,	%o3
	movneg	%xcc,	%i3,	%g6
	fcmpgt16	%f20,	%f2,	%g1
	ldsb	[%l7 + 0x46],	%i6
	srax	%g3,	%l3,	%i1
	fmovrde	%i7,	%f0,	%f24
	subc	%g5,	0x10FF,	%o5
	addc	%o2,	0x0E2E,	%o6
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	edge8ln	%l5,	%g4,	%i5
	fmovsleu	%icc,	%f20,	%f6
	fpackfix	%f12,	%f1
	ldub	[%l7 + 0x1B],	%o4
	andcc	%l0,	0x01F8,	%i4
	subccc	%l1,	0x0AEA,	%g7
	umulcc	%l6,	%o7,	%g2
	xorcc	%i2,	%o1,	%i0
	edge8	%o3,	%o0,	%g6
	movre	%i3,	0x2C5,	%i6
	movne	%icc,	%g1,	%g3
	sllx	%l3,	0x19,	%i7
	stb	%i1,	[%l7 + 0x7D]
	edge32l	%g5,	%o2,	%o6
	fpadd16	%f12,	%f14,	%f2
	array32	%l2,	%o5,	%l5
	andncc	%l4,	%i5,	%g4
	move	%icc,	%o4,	%l0
	sdivcc	%l1,	0x11FE,	%i4
	ldd	[%l7 + 0x08],	%f4
	fmul8x16al	%f12,	%f21,	%f26
	ldsb	[%l7 + 0x38],	%g7
	movge	%icc,	%o7,	%g2
	fornot2s	%f30,	%f6,	%f19
	stb	%i2,	[%l7 + 0x54]
	lduw	[%l7 + 0x18],	%o1
	movre	%l6,	%o3,	%o0
	array8	%i0,	%g6,	%i3
	fmovdcc	%xcc,	%f29,	%f20
	umul	%i6,	0x069E,	%g1
	andncc	%l3,	%g3,	%i7
	sethi	0x1FA3,	%i1
	edge32ln	%g5,	%o2,	%l2
	edge8ln	%o6,	%o5,	%l5
	save %l4, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l0,	%l1,	%i4
	sllx	%g7,	%o4,	%o7
	popc	%i2,	%o1
	ldsh	[%l7 + 0x0A],	%g2
	movne	%xcc,	%o3,	%o0
	movpos	%xcc,	%l6,	%i0
	lduh	[%l7 + 0x4A],	%i3
	sub	%i6,	%g1,	%l3
	fmovdleu	%icc,	%f13,	%f31
	fnegs	%f17,	%f9
	sdivx	%g3,	0x12C0,	%g6
	fmovsle	%icc,	%f14,	%f3
	sethi	0x0CF0,	%i7
	movgu	%xcc,	%g5,	%o2
	alignaddrl	%l2,	%i1,	%o5
	movre	%o6,	0x33A,	%l4
	ldub	[%l7 + 0x0D],	%l5
	xnorcc	%i5,	0x107F,	%l0
	addc	%l1,	0x0938,	%i4
	fands	%f21,	%f4,	%f29
	sth	%g4,	[%l7 + 0x72]
	sethi	0x1410,	%o4
	fmuld8sux16	%f31,	%f25,	%f8
	addc	%o7,	0x1D54,	%g7
	movcs	%xcc,	%o1,	%g2
	movre	%o3,	%o0,	%i2
	ldsw	[%l7 + 0x20],	%i0
	or	%l6,	%i3,	%g1
	fcmpd	%fcc1,	%f20,	%f6
	fmovscs	%xcc,	%f30,	%f6
	sub	%i6,	0x075F,	%l3
	fmovrde	%g6,	%f8,	%f24
	fmovsn	%icc,	%f0,	%f26
	nop
	set	0x63, %i7
	stb	%i7,	[%l7 + %i7]
	stw	%g5,	[%l7 + 0x14]
	edge8n	%o2,	%g3,	%i1
	subccc	%o5,	0x18D9,	%o6
	fpsub16s	%f3,	%f3,	%f7
	fmovrsgz	%l4,	%f29,	%f16
	sth	%l2,	[%l7 + 0x5E]
	mulx	%l5,	%i5,	%l1
	pdist	%f8,	%f30,	%f28
	edge32	%i4,	%g4,	%o4
	array16	%o7,	%l0,	%o1
	andncc	%g7,	%g2,	%o0
	udivcc	%i2,	0x07E0,	%o3
	movrlz	%i0,	%l6,	%i3
	sdivcc	%i6,	0x0A59,	%g1
	addccc	%g6,	%i7,	%l3
	xorcc	%g5,	0x02C9,	%o2
	movcs	%icc,	%g3,	%i1
	edge8l	%o6,	%o5,	%l4
	popc	%l2,	%l5
	fpackfix	%f22,	%f5
	for	%f30,	%f26,	%f30
	fnands	%f30,	%f9,	%f19
	movvs	%xcc,	%i5,	%i4
	popc	%g4,	%l1
	sir	0x1A81
	movvc	%xcc,	%o4,	%o7
	orn	%l0,	0x0AF6,	%o1
	sth	%g7,	[%l7 + 0x22]
	add	%o0,	%i2,	%o3
	andncc	%i0,	%l6,	%i3
	fmovdn	%icc,	%f25,	%f27
	array8	%g2,	%g1,	%i6
	subc	%i7,	0x0684,	%g6
	fmovrslz	%g5,	%f21,	%f29
	umulcc	%l3,	0x1FE2,	%o2
	addc	%i1,	0x01E4,	%g3
	ld	[%l7 + 0x50],	%f20
	fabss	%f30,	%f2
	ldd	[%l7 + 0x70],	%f20
	ldsb	[%l7 + 0x63],	%o5
	nop
	set	0x3C, %i5
	lduh	[%l7 + %i5],	%l4
	andn	%l2,	0x0423,	%l5
	sth	%o6,	[%l7 + 0x5E]
	movleu	%icc,	%i5,	%i4
	edge8ln	%g4,	%o4,	%o7
	smulcc	%l1,	0x1175,	%o1
	array8	%g7,	%l0,	%o0
	smulcc	%i2,	%o3,	%l6
	andcc	%i3,	0x1F36,	%i0
	edge8ln	%g2,	%g1,	%i7
	fmovdne	%xcc,	%f27,	%f2
	xnorcc	%g6,	0x15DF,	%i6
	sll	%l3,	0x1E,	%o2
	edge32ln	%i1,	%g3,	%g5
	sth	%l4,	[%l7 + 0x70]
	smulcc	%o5,	%l2,	%o6
	movvs	%xcc,	%l5,	%i4
	move	%xcc,	%g4,	%i5
	movre	%o4,	0x0CC,	%l1
	udiv	%o7,	0x1934,	%g7
	sll	%o1,	0x0A,	%l0
	ldd	[%l7 + 0x50],	%f20
	sdivcc	%o0,	0x0011,	%o3
	fcmpgt16	%f20,	%f0,	%l6
	move	%xcc,	%i2,	%i0
	movn	%icc,	%i3,	%g2
	edge8n	%g1,	%i7,	%i6
	movl	%icc,	%g6,	%o2
	fpsub16s	%f4,	%f23,	%f4
	orcc	%l3,	%i1,	%g5
	sir	0x1AC7
	ldx	[%l7 + 0x20],	%l4
	or	%o5,	0x1FA3,	%g3
	fxnor	%f30,	%f18,	%f30
	srax	%l2,	0x1F,	%l5
	ldsb	[%l7 + 0x75],	%i4
	fmovdcc	%icc,	%f11,	%f1
	subc	%g4,	0x0CA7,	%o6
	movcc	%xcc,	%i5,	%o4
	movg	%icc,	%l1,	%o7
	fmovsn	%xcc,	%f30,	%f27
	andcc	%o1,	0x17FC,	%l0
	fnors	%f11,	%f9,	%f4
	sdiv	%o0,	0x10A8,	%g7
	fnegd	%f18,	%f20
	alignaddr	%l6,	%o3,	%i0
	srl	%i3,	0x11,	%g2
	movvc	%xcc,	%g1,	%i2
	subc	%i7,	0x1505,	%i6
	lduw	[%l7 + 0x54],	%o2
	addccc	%g6,	0x1781,	%l3
	move	%icc,	%g5,	%l4
	movn	%icc,	%o5,	%g3
	fmovdcc	%icc,	%f11,	%f6
	ldub	[%l7 + 0x33],	%l2
	sll	%i1,	0x0C,	%l5
	addc	%g4,	0x0F0A,	%i4
	fmovdge	%xcc,	%f17,	%f10
	and	%o6,	0x168F,	%o4
	subc	%i5,	0x15AD,	%o7
	ld	[%l7 + 0x08],	%f13
	fmovsa	%icc,	%f17,	%f25
	save %o1, %l1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g7,	0x114C,	%o0
	movl	%xcc,	%o3,	%i0
	move	%icc,	%i3,	%g2
	fpsub32	%f14,	%f4,	%f28
	fmovsge	%icc,	%f31,	%f15
	movgu	%xcc,	%g1,	%l6
	fabss	%f28,	%f5
	fmovrdgz	%i2,	%f12,	%f14
	udivcc	%i6,	0x0630,	%o2
	edge16l	%i7,	%g6,	%l3
	ldd	[%l7 + 0x78],	%l4
	ldub	[%l7 + 0x79],	%g5
	edge32ln	%g3,	%l2,	%o5
	fnot2s	%f12,	%f28
	smulcc	%l5,	0x0152,	%i1
	movvc	%icc,	%g4,	%i4
	array8	%o4,	%i5,	%o6
	ldx	[%l7 + 0x28],	%o1
	sethi	0x133C,	%o7
	movcc	%xcc,	%l1,	%l0
	fabss	%f24,	%f0
	save %g7, 0x00C3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o0,	%i0,	%i3
	array16	%g2,	%l6,	%g1
	subc	%i2,	0x122D,	%i6
	sllx	%i7,	%g6,	%o2
	and	%l4,	0x1253,	%l3
	addccc	%g3,	%g5,	%o5
	alignaddr	%l2,	%i1,	%g4
	std	%f22,	[%l7 + 0x08]
	edge8ln	%l5,	%i4,	%i5
	lduw	[%l7 + 0x40],	%o6
	fmovsa	%xcc,	%f25,	%f20
	fornot2	%f16,	%f30,	%f4
	edge32l	%o1,	%o7,	%l1
	array32	%o4,	%l0,	%g7
	nop
	set	0x42, %o0
	ldsh	[%l7 + %o0],	%o3
	movpos	%icc,	%i0,	%o0
	array32	%i3,	%l6,	%g2
	edge16ln	%i2,	%i6,	%g1
	fmovrdlz	%g6,	%f24,	%f6
	movl	%icc,	%o2,	%i7
	movleu	%icc,	%l3,	%l4
	movne	%icc,	%g5,	%g3
	add	%l2,	0x154B,	%o5
	alignaddr	%i1,	%g4,	%l5
	fsrc2s	%f1,	%f5
	udivx	%i4,	0x16DA,	%o6
	edge16n	%i5,	%o1,	%o7
	ldd	[%l7 + 0x18],	%o4
	movrgez	%l0,	%g7,	%l1
	movgu	%icc,	%i0,	%o3
	bshuffle	%f18,	%f30,	%f4
	movle	%xcc,	%i3,	%l6
	ld	[%l7 + 0x54],	%f22
	fmul8ulx16	%f20,	%f12,	%f14
	edge32	%g2,	%i2,	%i6
	movrne	%o0,	%g1,	%g6
	andcc	%i7,	0x09DB,	%l3
	fmuld8ulx16	%f29,	%f20,	%f18
	sra	%l4,	%g5,	%g3
	sth	%o2,	[%l7 + 0x36]
	ldub	[%l7 + 0x71],	%l2
	xor	%o5,	%g4,	%i1
	fmovsne	%xcc,	%f9,	%f30
	fpack32	%f30,	%f4,	%f2
	fmovrdlez	%i4,	%f20,	%f18
	edge8n	%o6,	%i5,	%l5
	sethi	0x1616,	%o1
	smulcc	%o4,	%l0,	%g7
	mulx	%l1,	%o7,	%o3
	movg	%xcc,	%i0,	%i3
	fmul8x16	%f10,	%f12,	%f26
	smulcc	%l6,	0x0C64,	%g2
	udivx	%i6,	0x0019,	%i2
	movrne	%o0,	0x0AF,	%g1
	sdivcc	%i7,	0x1B6F,	%l3
	fmovrsgez	%l4,	%f18,	%f8
	subccc	%g5,	%g3,	%g6
	ldub	[%l7 + 0x3F],	%l2
	fnot2	%f8,	%f30
	edge32ln	%o2,	%o5,	%i1
	smul	%g4,	0x030F,	%i4
	or	%o6,	0x1718,	%l5
	movrgz	%i5,	0x0FD,	%o1
	edge16ln	%l0,	%o4,	%g7
	udivx	%o7,	0x065C,	%l1
	nop
	set	0x58, %o4
	std	%f10,	[%l7 + %o4]
	fmovrslez	%o3,	%f27,	%f26
	edge16ln	%i3,	%i0,	%g2
	ldsw	[%l7 + 0x28],	%i6
	movrgez	%l6,	%i2,	%o0
	sdiv	%g1,	0x1CA5,	%i7
	stw	%l3,	[%l7 + 0x10]
	fnot1	%f14,	%f10
	movleu	%icc,	%l4,	%g3
	std	%f10,	[%l7 + 0x30]
	srax	%g6,	%l2,	%g5
	fcmpeq32	%f6,	%f14,	%o2
	andncc	%i1,	%o5,	%i4
	srax	%g4,	0x0C,	%l5
	udiv	%i5,	0x09A4,	%o1
	edge8ln	%l0,	%o6,	%g7
	movvs	%xcc,	%o7,	%l1
	sethi	0x1DEB,	%o4
	ld	[%l7 + 0x1C],	%f0
	fnot1	%f10,	%f0
	fandnot2	%f4,	%f18,	%f16
	fmovdne	%icc,	%f9,	%f0
	lduw	[%l7 + 0x10],	%o3
	movvs	%xcc,	%i0,	%i3
	edge16n	%g2,	%i6,	%i2
	fpadd16	%f28,	%f16,	%f28
	fcmpeq32	%f4,	%f0,	%o0
	udiv	%g1,	0x10D1,	%i7
	and	%l3,	0x13F5,	%l6
	ldd	[%l7 + 0x78],	%f8
	srl	%g3,	0x19,	%g6
	popc	%l2,	%g5
	movre	%o2,	%l4,	%i1
	edge32l	%i4,	%o5,	%l5
	stx	%i5,	[%l7 + 0x50]
	array32	%o1,	%l0,	%o6
	movle	%xcc,	%g4,	%g7
	fandnot1s	%f20,	%f22,	%f27
	mova	%icc,	%o7,	%l1
	xorcc	%o3,	%o4,	%i3
	fmovsn	%xcc,	%f17,	%f1
	movcc	%xcc,	%g2,	%i0
	udivcc	%i6,	0x19BC,	%o0
	fsrc2	%f12,	%f10
	lduw	[%l7 + 0x34],	%g1
	ldsw	[%l7 + 0x58],	%i2
	ldsw	[%l7 + 0x4C],	%i7
	restore %l6, 0x11E8, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g6,	%l2,	%g5
	andncc	%o2,	%l4,	%i1
	movpos	%xcc,	%g3,	%o5
	addcc	%l5,	%i5,	%i4
	udivx	%l0,	0x0E14,	%o6
	fone	%f6
	and	%o1,	%g4,	%g7
	udivcc	%l1,	0x1F36,	%o3
	movvs	%icc,	%o4,	%i3
	movvc	%xcc,	%g2,	%o7
	fcmps	%fcc3,	%f23,	%f23
	movleu	%icc,	%i6,	%o0
	fxnors	%f31,	%f12,	%f11
	sllx	%g1,	0x03,	%i2
	fmovsleu	%icc,	%f23,	%f0
	movcs	%xcc,	%i7,	%i0
	subc	%l3,	0x127C,	%g6
	lduw	[%l7 + 0x38],	%l6
	move	%icc,	%g5,	%o2
	alignaddrl	%l2,	%l4,	%i1
	ldub	[%l7 + 0x59],	%g3
	addccc	%o5,	0x1AED,	%l5
	umulcc	%i5,	%l0,	%i4
	fcmple16	%f16,	%f16,	%o1
	movneg	%xcc,	%o6,	%g4
	fsrc2	%f26,	%f12
	smulcc	%g7,	%l1,	%o3
	nop
	set	0x20, %l0
	stx	%i3,	[%l7 + %l0]
	st	%f3,	[%l7 + 0x68]
	addcc	%o4,	%g2,	%o7
	edge8l	%o0,	%i6,	%g1
	edge16ln	%i2,	%i7,	%i0
	movge	%xcc,	%l3,	%g6
	orncc	%l6,	0x08B5,	%g5
	orncc	%l2,	%l4,	%o2
	fpadd16	%f22,	%f2,	%f2
	subc	%i1,	0x0D5A,	%o5
	popc	0x1C48,	%l5
	edge8l	%i5,	%l0,	%g3
	umulcc	%o1,	0x0FDF,	%i4
	fmovde	%xcc,	%f6,	%f7
	edge32l	%o6,	%g7,	%g4
	fmovdne	%icc,	%f12,	%f9
	fmovsneg	%icc,	%f5,	%f31
	fpsub16	%f30,	%f30,	%f16
	fcmpne32	%f22,	%f16,	%l1
	movleu	%xcc,	%i3,	%o4
	smulcc	%g2,	%o3,	%o7
	addccc	%i6,	%g1,	%o0
	movpos	%icc,	%i7,	%i2
	lduh	[%l7 + 0x70],	%l3
	sra	%i0,	0x1A,	%l6
	smul	%g5,	%l2,	%g6
	xnor	%l4,	0x0F7D,	%o2
	edge8ln	%o5,	%i1,	%i5
	fmovrdne	%l5,	%f26,	%f12
	fexpand	%f1,	%f30
	orncc	%g3,	%o1,	%l0
	sub	%i4,	0x1B73,	%o6
	movrlez	%g7,	%l1,	%i3
	udivcc	%g4,	0x1609,	%o4
	sub	%g2,	%o7,	%o3
	popc	%g1,	%o0
	edge8l	%i7,	%i2,	%l3
	ldsh	[%l7 + 0x62],	%i0
	fmul8x16al	%f11,	%f14,	%f10
	fmovdg	%icc,	%f5,	%f28
	umulcc	%i6,	%g5,	%l2
	mulx	%l6,	%g6,	%l4
	alignaddr	%o5,	%o2,	%i5
	orcc	%i1,	0x1487,	%g3
	fcmped	%fcc1,	%f8,	%f6
	edge16ln	%l5,	%o1,	%l0
	lduh	[%l7 + 0x14],	%o6
	subc	%i4,	%g7,	%i3
	movg	%icc,	%l1,	%g4
	fxnors	%f24,	%f8,	%f28
	edge8l	%o4,	%o7,	%o3
	ld	[%l7 + 0x2C],	%f31
	movvs	%icc,	%g2,	%o0
	movgu	%xcc,	%g1,	%i7
	ldsw	[%l7 + 0x10],	%i2
	addccc	%i0,	%l3,	%g5
	fcmpgt16	%f26,	%f24,	%l2
	srl	%l6,	0x05,	%i6
	umulcc	%l4,	%o5,	%o2
	addcc	%g6,	%i5,	%i1
	fnot2	%f30,	%f6
	edge32n	%l5,	%g3,	%o1
	umul	%l0,	%o6,	%g7
	ldsw	[%l7 + 0x60],	%i3
	stb	%i4,	[%l7 + 0x12]
	fmovdg	%icc,	%f3,	%f19
	mova	%icc,	%g4,	%o4
	mulx	%o7,	0x104E,	%o3
	fmovsge	%icc,	%f9,	%f28
	andncc	%g2,	%l1,	%g1
	sir	0x0697
	xnor	%i7,	%i2,	%o0
	fpadd32	%f24,	%f28,	%f30
	xnorcc	%i0,	%g5,	%l2
	alignaddr	%l3,	%i6,	%l6
	edge32	%o5,	%l4,	%g6
	movvs	%xcc,	%i5,	%i1
	popc	0x07F1,	%l5
	fmovsn	%xcc,	%f12,	%f2
	sth	%o2,	[%l7 + 0x28]
	addcc	%g3,	0x1115,	%o1
	and	%o6,	%g7,	%i3
	fxors	%f24,	%f2,	%f27
	edge8l	%i4,	%g4,	%l0
	fmovdcs	%xcc,	%f12,	%f19
	addc	%o4,	%o7,	%g2
	addc	%o3,	0x02B1,	%g1
	xnor	%l1,	%i7,	%o0
	mova	%xcc,	%i2,	%g5
	movl	%xcc,	%l2,	%l3
	movvs	%icc,	%i6,	%i0
	umul	%o5,	%l6,	%g6
	movne	%xcc,	%i5,	%l4
	srax	%l5,	%o2,	%g3
	edge8n	%i1,	%o6,	%g7
	move	%icc,	%o1,	%i4
	sdivx	%i3,	0x12A4,	%l0
	umul	%o4,	%o7,	%g4
	array32	%g2,	%o3,	%l1
	ld	[%l7 + 0x34],	%f23
	ldub	[%l7 + 0x56],	%g1
	ldsw	[%l7 + 0x78],	%i7
	fcmple32	%f22,	%f2,	%o0
	add	%g5,	%i2,	%l2
	orcc	%i6,	0x00FA,	%i0
	sra	%o5,	%l3,	%l6
	srax	%i5,	%g6,	%l5
	movgu	%xcc,	%o2,	%g3
	fmovrdlz	%i1,	%f22,	%f12
	fcmple32	%f2,	%f10,	%l4
	smulcc	%o6,	%g7,	%o1
	stw	%i3,	[%l7 + 0x54]
	movrlez	%l0,	0x337,	%i4
	fcmpeq32	%f26,	%f14,	%o7
	ldsh	[%l7 + 0x24],	%o4
	edge32ln	%g2,	%g4,	%o3
	save %l1, 0x10F5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%o0,	%i7
	fmovdle	%xcc,	%f8,	%f5
	addc	%i2,	0x1A96,	%l2
	edge16n	%i6,	%i0,	%g5
	edge32n	%o5,	%l6,	%l3
	sll	%g6,	%l5,	%o2
	fmovrde	%g3,	%f8,	%f28
	fpack32	%f30,	%f22,	%f2
	andcc	%i1,	%i5,	%l4
	move	%icc,	%g7,	%o6
	fxnor	%f22,	%f6,	%f6
	movrgz	%i3,	%o1,	%i4
	edge8l	%o7,	%o4,	%l0
	fcmpne32	%f6,	%f28,	%g4
	fmovrdne	%g2,	%f4,	%f8
	mova	%icc,	%o3,	%l1
	edge32ln	%g1,	%i7,	%i2
	subccc	%l2,	%i6,	%i0
	edge8	%o0,	%g5,	%l6
	xnorcc	%l3,	%o5,	%l5
	addc	%o2,	%g3,	%i1
	alignaddr	%i5,	%l4,	%g7
	ld	[%l7 + 0x6C],	%f25
	movcs	%xcc,	%o6,	%g6
	ldd	[%l7 + 0x10],	%f22
	orncc	%i3,	%o1,	%i4
	stb	%o7,	[%l7 + 0x61]
	addcc	%l0,	%o4,	%g2
	smul	%o3,	%l1,	%g1
	save %i7, %g4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l2,	%i0,	%o0
	addccc	%i6,	%l6,	%l3
	smulcc	%o5,	0x0C34,	%l5
	fmuld8ulx16	%f15,	%f2,	%f30
	movrlz	%o2,	%g3,	%i1
	fmovsvs	%xcc,	%f0,	%f31
	movvs	%icc,	%g5,	%i5
	fzeros	%f25
	movvs	%xcc,	%l4,	%g7
	movrgz	%o6,	%i3,	%o1
	sth	%g6,	[%l7 + 0x52]
	sdivcc	%o7,	0x13E4,	%i4
	sir	0x03E4
	edge8	%l0,	%g2,	%o4
	fmovsn	%xcc,	%f22,	%f25
	popc	%o3,	%l1
	ldsh	[%l7 + 0x4E],	%i7
	edge16	%g1,	%i2,	%g4
	fnot1	%f22,	%f2
	xor	%i0,	0x04C7,	%o0
	array32	%l2,	%l6,	%l3
	edge32l	%o5,	%l5,	%o2
	array32	%i6,	%i1,	%g3
	umul	%i5,	%g5,	%l4
	nop
	set	0x36, %l3
	ldub	[%l7 + %l3],	%o6
	movleu	%xcc,	%i3,	%o1
	edge8	%g7,	%g6,	%o7
	mulscc	%i4,	%g2,	%l0
	sir	0x1BDB
	movrlez	%o3,	0x32D,	%l1
	array8	%i7,	%o4,	%i2
	nop
	set	0x58, %g6
	sth	%g4,	[%l7 + %g6]
	edge16n	%g1,	%o0,	%l2
	array16	%i0,	%l3,	%o5
	fzero	%f6
	movrgz	%l6,	0x133,	%l5
	nop
	set	0x48, %l5
	lduw	[%l7 + %l5],	%i6
	addccc	%i1,	0x1887,	%g3
	move	%xcc,	%o2,	%g5
	mulx	%i5,	%l4,	%i3
	orn	%o6,	0x1010,	%g7
	fnor	%f12,	%f6,	%f0
	movne	%icc,	%o1,	%g6
	edge8ln	%o7,	%g2,	%i4
	movl	%icc,	%l0,	%l1
	movrgz	%o3,	0x175,	%i7
	or	%o4,	%g4,	%g1
	subc	%i2,	0x08B3,	%l2
	xnor	%o0,	%l3,	%i0
	orncc	%o5,	%l5,	%i6
	edge16	%i1,	%g3,	%l6
	edge32l	%o2,	%g5,	%l4
	popc	0x1496,	%i5
	alignaddr	%o6,	%g7,	%o1
	udiv	%g6,	0x0557,	%o7
	fands	%f17,	%f1,	%f27
	fnand	%f16,	%f24,	%f2
	srlx	%g2,	%i3,	%i4
	fones	%f26
	ldsh	[%l7 + 0x70],	%l0
	fmul8x16al	%f29,	%f23,	%f18
	std	%f18,	[%l7 + 0x48]
	mulx	%l1,	%i7,	%o3
	sllx	%o4,	%g4,	%g1
	fsrc2s	%f25,	%f23
	edge8	%i2,	%l2,	%l3
	st	%f2,	[%l7 + 0x60]
	ldd	[%l7 + 0x68],	%f12
	movneg	%xcc,	%i0,	%o5
	sll	%o0,	0x18,	%i6
	edge16	%i1,	%l5,	%g3
	mulx	%l6,	%g5,	%o2
	edge16n	%l4,	%i5,	%o6
	orncc	%g7,	%o1,	%o7
	movle	%icc,	%g6,	%i3
	fandnot1	%f24,	%f2,	%f24
	udivx	%i4,	0x0743,	%g2
	pdist	%f0,	%f6,	%f30
	sth	%l1,	[%l7 + 0x6C]
	fmovdneg	%xcc,	%f12,	%f7
	udivx	%l0,	0x1A55,	%i7
	sth	%o4,	[%l7 + 0x34]
	stx	%g4,	[%l7 + 0x30]
	stb	%o3,	[%l7 + 0x3C]
	movg	%icc,	%i2,	%g1
	andncc	%l3,	%l2,	%i0
	umul	%o5,	0x1797,	%o0
	umul	%i6,	%i1,	%l5
	sethi	0x1757,	%g3
	ldd	[%l7 + 0x30],	%f2
	movrne	%l6,	%o2,	%g5
	fnot2	%f4,	%f6
	stx	%i5,	[%l7 + 0x08]
	movrgz	%l4,	0x14F,	%o6
	ldd	[%l7 + 0x18],	%o0
	fmovrsne	%g7,	%f28,	%f12
	sub	%o7,	%i3,	%g6
	array16	%i4,	%g2,	%l1
	fmovspos	%xcc,	%f28,	%f28
	ldd	[%l7 + 0x70],	%f16
	fornot1s	%f31,	%f29,	%f9
	movcc	%xcc,	%i7,	%l0
	subcc	%o4,	0x05BE,	%o3
	ldsb	[%l7 + 0x0D],	%g4
	movpos	%icc,	%i2,	%g1
	fcmpne16	%f26,	%f12,	%l2
	ldsw	[%l7 + 0x40],	%l3
	sir	0x0C38
	orcc	%o5,	%i0,	%o0
	movge	%xcc,	%i6,	%i1
	fpadd32s	%f10,	%f27,	%f23
	udiv	%l5,	0x0589,	%g3
	fmovsvs	%icc,	%f10,	%f5
	smulcc	%o2,	%l6,	%i5
	sllx	%g5,	0x16,	%o6
	ld	[%l7 + 0x64],	%f21
	movpos	%xcc,	%l4,	%g7
	movvs	%xcc,	%o1,	%i3
	orncc	%g6,	0x00A2,	%i4
	sub	%o7,	%g2,	%i7
	udivx	%l1,	0x0E40,	%o4
	sdivcc	%l0,	0x07F3,	%o3
	fmovda	%icc,	%f5,	%f0
	pdist	%f26,	%f2,	%f16
	add	%i2,	%g1,	%l2
	mulscc	%g4,	%o5,	%l3
	fmovrsgez	%i0,	%f29,	%f7
	fpadd16	%f2,	%f18,	%f16
	edge16	%i6,	%i1,	%o0
	subc	%l5,	0x131C,	%o2
	addcc	%l6,	%i5,	%g5
	edge16l	%g3,	%o6,	%g7
	edge8ln	%l4,	%o1,	%i3
	orcc	%g6,	%o7,	%i4
	movrgz	%i7,	%l1,	%g2
	movvs	%icc,	%o4,	%l0
	srlx	%i2,	0x04,	%g1
	addccc	%o3,	0x0CF3,	%g4
	mulx	%o5,	%l3,	%i0
	ldsh	[%l7 + 0x1C],	%i6
	movcs	%icc,	%l2,	%o0
	movleu	%icc,	%i1,	%l5
	movrlz	%l6,	0x3A7,	%o2
	edge16n	%i5,	%g5,	%o6
	movvs	%xcc,	%g3,	%g7
	sdivcc	%l4,	0x0E37,	%i3
	ldub	[%l7 + 0x5C],	%o1
	fmovsa	%xcc,	%f2,	%f15
	movleu	%xcc,	%o7,	%i4
	lduw	[%l7 + 0x38],	%i7
	movgu	%xcc,	%g6,	%g2
	for	%f0,	%f28,	%f16
	umul	%l1,	%o4,	%i2
	andcc	%g1,	%l0,	%g4
	addcc	%o5,	0x1B64,	%l3
	orncc	%i0,	0x0F1D,	%o3
	fmul8x16al	%f26,	%f22,	%f18
	fmovsn	%icc,	%f5,	%f7
	sethi	0x1F75,	%i6
	edge32ln	%o0,	%i1,	%l5
	ldsh	[%l7 + 0x70],	%l2
	edge8l	%l6,	%o2,	%g5
	sir	0x11EE
	alignaddrl	%o6,	%i5,	%g3
	smul	%g7,	%i3,	%o1
	srlx	%l4,	0x14,	%i4
	fmuld8ulx16	%f8,	%f11,	%f28
	umulcc	%o7,	0x0C02,	%i7
	smulcc	%g2,	%g6,	%o4
	mulscc	%l1,	0x1AF0,	%i2
	fnor	%f4,	%f2,	%f12
	ldsh	[%l7 + 0x40],	%l0
	addcc	%g1,	%g4,	%o5
	movrne	%l3,	0x1BC,	%i0
	save %o3, 0x1AEA, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i6,	%l5,	%l2
	fcmpeq16	%f14,	%f12,	%i1
	sir	0x011F
	movle	%icc,	%l6,	%g5
	fmul8sux16	%f20,	%f6,	%f26
	lduw	[%l7 + 0x3C],	%o2
	stb	%i5,	[%l7 + 0x22]
	mulscc	%g3,	%o6,	%i3
	edge16	%g7,	%o1,	%l4
	fornot2s	%f23,	%f10,	%f28
	fmovsl	%icc,	%f3,	%f14
	fnot1	%f10,	%f2
	sll	%i4,	0x00,	%o7
	fsrc2	%f16,	%f22
	srax	%i7,	%g2,	%o4
	movne	%icc,	%l1,	%g6
	fmovsleu	%xcc,	%f16,	%f27
	edge16l	%i2,	%l0,	%g4
	movl	%icc,	%g1,	%o5
	movpos	%xcc,	%l3,	%o3
	xor	%i0,	0x0623,	%o0
	smulcc	%l5,	0x17F1,	%l2
	movgu	%icc,	%i1,	%i6
	fmovd	%f24,	%f22
	sub	%l6,	%o2,	%g5
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	sdiv	%g7,	0x1A49,	%i5
	movvc	%xcc,	%o1,	%l4
	fnot2	%f16,	%f30
	sethi	0x053B,	%i4
	subccc	%o7,	0x1EAB,	%i7
	edge8n	%o4,	%g2,	%l1
	fandnot2	%f6,	%f6,	%f2
	andcc	%g6,	%l0,	%i2
	movleu	%xcc,	%g1,	%o5
	ldsb	[%l7 + 0x72],	%g4
	umulcc	%l3,	%o3,	%o0
	srax	%l5,	%i0,	%i1
	edge16	%i6,	%l2,	%o2
	pdist	%f10,	%f8,	%f20
	alignaddr	%l6,	%g5,	%o6
	sethi	0x01B0,	%i3
	mulx	%g3,	%i5,	%g7
	sth	%l4,	[%l7 + 0x50]
	std	%f30,	[%l7 + 0x70]
	alignaddr	%i4,	%o7,	%o1
	sub	%i7,	%o4,	%l1
	stw	%g6,	[%l7 + 0x44]
	fmovd	%f16,	%f22
	save %g2, 0x009D, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g1,	%i2
	st	%f28,	[%l7 + 0x4C]
	and	%g4,	0x1C00,	%l3
	orcc	%o5,	%o0,	%l5
	or	%i0,	%o3,	%i1
	alignaddr	%l2,	%o2,	%i6
	movpos	%icc,	%l6,	%g5
	subccc	%i3,	0x1005,	%g3
	subccc	%i5,	0x198C,	%g7
	edge8	%o6,	%l4,	%o7
	fandnot2	%f16,	%f16,	%f2
	movleu	%icc,	%i4,	%o1
	edge8n	%o4,	%l1,	%g6
	sub	%i7,	0x0746,	%g2
	xor	%g1,	%i2,	%l0
	fpsub16s	%f3,	%f0,	%f9
	andncc	%l3,	%o5,	%g4
	alignaddr	%l5,	%o0,	%i0
	fsrc2	%f18,	%f14
	fcmpgt16	%f18,	%f10,	%i1
	array8	%o3,	%o2,	%i6
	fmovrslz	%l6,	%f27,	%f2
	movge	%icc,	%g5,	%l2
	ldsh	[%l7 + 0x46],	%g3
	fmovrdne	%i3,	%f14,	%f18
	andncc	%g7,	%i5,	%o6
	mulx	%l4,	0x1611,	%o7
	movrgz	%i4,	0x299,	%o1
	edge16l	%o4,	%g6,	%l1
	movge	%xcc,	%i7,	%g2
	movre	%i2,	0x0C5,	%l0
	edge16l	%l3,	%o5,	%g4
	addcc	%g1,	%l5,	%i0
	popc	0x0944,	%i1
	stb	%o3,	[%l7 + 0x0C]
	fpsub32	%f4,	%f24,	%f18
	xor	%o0,	0x0E5C,	%o2
	siam	0x1
	and	%l6,	0x10D3,	%i6
	ldsb	[%l7 + 0x24],	%l2
	mova	%icc,	%g3,	%i3
	alignaddr	%g5,	%g7,	%o6
	edge32ln	%l4,	%i5,	%i4
	edge32n	%o1,	%o7,	%o4
	alignaddr	%g6,	%l1,	%i7
	restore %i2, 0x0B63, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l3,	%g2,	%o5
	edge16ln	%g4,	%g1,	%i0
	udiv	%i1,	0x0F61,	%o3
	fexpand	%f11,	%f30
	srax	%l5,	0x15,	%o2
	movrlez	%o0,	%l6,	%i6
	edge8ln	%l2,	%i3,	%g5
	udivx	%g7,	0x01C0,	%g3
	edge8	%l4,	%i5,	%i4
	addc	%o1,	0x0A0A,	%o7
	fmovsa	%icc,	%f19,	%f7
	edge32n	%o6,	%g6,	%o4
	srlx	%i7,	%l1,	%i2
	movvs	%icc,	%l3,	%l0
	sdiv	%g2,	0x03B8,	%g4
	subc	%o5,	%g1,	%i1
	sub	%i0,	0x0C48,	%l5
	movpos	%icc,	%o3,	%o2
	fornot2s	%f28,	%f10,	%f27
	movle	%xcc,	%o0,	%i6
	mulscc	%l2,	%l6,	%g5
	and	%g7,	0x0706,	%i3
	ldsw	[%l7 + 0x64],	%g3
	edge16	%l4,	%i5,	%o1
	fornot1s	%f0,	%f28,	%f13
	andcc	%i4,	%o6,	%o7
	sdiv	%g6,	0x06F7,	%o4
	addcc	%i7,	%l1,	%i2
	orcc	%l3,	%l0,	%g4
	mulx	%g2,	0x068F,	%o5
	andncc	%i1,	%g1,	%l5
	addcc	%o3,	%o2,	%o0
	for	%f24,	%f0,	%f16
	nop
	set	0x60, %g5
	ldd	[%l7 + %g5],	%f12
	xor	%i0,	%i6,	%l6
	fmovdgu	%icc,	%f25,	%f21
	ld	[%l7 + 0x10],	%f29
	andcc	%g5,	0x1BF2,	%g7
	lduw	[%l7 + 0x3C],	%i3
	fnot1s	%f21,	%f16
	or	%l2,	%g3,	%l4
	fpadd16s	%f21,	%f21,	%f18
	addc	%o1,	0x0B62,	%i4
	movg	%icc,	%i5,	%o6
	udivcc	%o7,	0x0C5D,	%g6
	std	%f28,	[%l7 + 0x28]
	sir	0x079A
	srlx	%i7,	0x16,	%o4
	sdiv	%i2,	0x142D,	%l3
	sir	0x000F
	edge32n	%l0,	%l1,	%g4
	movre	%o5,	0x07E,	%i1
	fpack32	%f12,	%f16,	%f30
	fmuld8sux16	%f27,	%f10,	%f6
	edge8l	%g1,	%g2,	%o3
	edge16ln	%l5,	%o0,	%o2
	fmovrsgez	%i0,	%f27,	%f16
	fmovdgu	%xcc,	%f12,	%f8
	ldub	[%l7 + 0x18],	%i6
	xor	%l6,	0x0EC4,	%g5
	fnegd	%f20,	%f12
	sir	0x1633
	st	%f3,	[%l7 + 0x70]
	edge8	%i3,	%l2,	%g7
	array8	%l4,	%g3,	%i4
	movg	%icc,	%o1,	%i5
	movl	%xcc,	%o6,	%g6
	movrgz	%o7,	0x1C1,	%o4
	sdivcc	%i2,	0x1E1C,	%l3
	movrlez	%i7,	0x274,	%l1
	array32	%l0,	%o5,	%i1
	sllx	%g4,	0x00,	%g1
	udivcc	%o3,	0x0816,	%g2
	movcc	%icc,	%l5,	%o0
	move	%icc,	%i0,	%i6
	xorcc	%o2,	%g5,	%i3
	orncc	%l6,	0x1774,	%l2
	ldx	[%l7 + 0x58],	%g7
	movn	%xcc,	%g3,	%l4
	movvc	%icc,	%o1,	%i5
	subcc	%o6,	%g6,	%i4
	stw	%o7,	[%l7 + 0x64]
	mulx	%o4,	%l3,	%i7
	movrne	%i2,	0x357,	%l0
	movne	%xcc,	%l1,	%o5
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	udiv	%g2,	0x0868,	%o3
	lduw	[%l7 + 0x44],	%l5
	fmovsvs	%xcc,	%f16,	%f18
	array16	%i0,	%i6,	%o0
	fors	%f0,	%f27,	%f2
	fsrc1s	%f7,	%f28
	fsrc1s	%f18,	%f3
	fmul8x16	%f23,	%f2,	%f18
	sub	%g5,	%o2,	%l6
	add	%i3,	0x1C1A,	%g7
	fcmpd	%fcc3,	%f12,	%f4
	ldx	[%l7 + 0x50],	%g3
	stx	%l2,	[%l7 + 0x60]
	fpsub16s	%f16,	%f23,	%f12
	ldd	[%l7 + 0x68],	%f14
	mulx	%o1,	0x0849,	%i5
	movgu	%icc,	%l4,	%o6
	fpadd32s	%f27,	%f2,	%f19
	srl	%i4,	%o7,	%o4
	movvs	%icc,	%g6,	%l3
	fmovdn	%icc,	%f4,	%f21
	fmul8x16	%f19,	%f24,	%f14
	srlx	%i2,	%l0,	%i7
	addccc	%l1,	0x093B,	%i1
	fmovrsne	%o5,	%f23,	%f3
	edge32l	%g4,	%g1,	%o3
	movneg	%xcc,	%g2,	%i0
	movrgez	%l5,	%o0,	%i6
	sth	%o2,	[%l7 + 0x48]
	fmovsne	%icc,	%f8,	%f2
	fmovdn	%xcc,	%f16,	%f17
	edge32n	%l6,	%i3,	%g5
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%g7
	mova	%icc,	%g3,	%o1
	fmovs	%f1,	%f2
	edge16n	%i5,	%l4,	%l2
	ldd	[%l7 + 0x48],	%o6
	subccc	%i4,	0x1E82,	%o4
	xnor	%o7,	0x0E91,	%g6
	fpsub32	%f24,	%f30,	%f30
	fcmps	%fcc1,	%f28,	%f29
	fcmple32	%f30,	%f16,	%l3
	movre	%l0,	%i7,	%i2
	ldsb	[%l7 + 0x70],	%i1
	movcc	%xcc,	%l1,	%g4
	xnor	%o5,	%o3,	%g2
	fabsd	%f8,	%f18
	fors	%f1,	%f13,	%f26
	sllx	%i0,	0x0F,	%l5
	fandnot2s	%f19,	%f5,	%f22
	add	%g1,	%i6,	%o2
	std	%f18,	[%l7 + 0x48]
	sllx	%l6,	%o0,	%i3
	sth	%g5,	[%l7 + 0x10]
	stx	%g3,	[%l7 + 0x08]
	movrlez	%g7,	%i5,	%o1
	fsrc1s	%f22,	%f29
	xorcc	%l4,	%l2,	%i4
	move	%xcc,	%o4,	%o7
	edge32l	%o6,	%g6,	%l0
	movvc	%icc,	%i7,	%l3
	or	%i1,	0x1DF9,	%l1
	fandnot2	%f24,	%f10,	%f4
	sra	%g4,	%o5,	%o3
	xnor	%g2,	%i2,	%l5
	sdivx	%i0,	0x1B58,	%i6
	andcc	%g1,	%l6,	%o2
	movgu	%icc,	%o0,	%g5
	edge32ln	%g3,	%i3,	%g7
	and	%o1,	%i5,	%l2
	sth	%i4,	[%l7 + 0x50]
	fmovrdlez	%l4,	%f8,	%f22
	udivcc	%o4,	0x1D79,	%o6
	edge8ln	%g6,	%l0,	%i7
	ldx	[%l7 + 0x18],	%o7
	subcc	%l3,	0x0BAC,	%l1
	movcs	%icc,	%g4,	%i1
	fmovd	%f8,	%f14
	xnorcc	%o5,	0x0273,	%o3
	sir	0x0FA7
	andn	%i2,	%g2,	%i0
	xorcc	%l5,	%i6,	%g1
	edge8ln	%o2,	%o0,	%g5
	xnor	%l6,	%i3,	%g7
	movle	%xcc,	%o1,	%g3
	addcc	%l2,	0x16D5,	%i4
	subc	%i5,	%o4,	%o6
	subc	%g6,	%l4,	%l0
	edge32l	%i7,	%l3,	%o7
	udivcc	%l1,	0x01A5,	%i1
	movrlz	%g4,	%o5,	%i2
	popc	%o3,	%g2
	edge16ln	%l5,	%i6,	%i0
	fcmpgt16	%f24,	%f0,	%o2
	movrgez	%o0,	0x2ED,	%g1
	nop
	set	0x68, %o2
	std	%f8,	[%l7 + %o2]
	faligndata	%f22,	%f6,	%f4
	movneg	%xcc,	%l6,	%i3
	xnorcc	%g5,	0x0C5C,	%o1
	srax	%g7,	0x09,	%l2
	fone	%f22
	sra	%g3,	0x0B,	%i4
	ldub	[%l7 + 0x64],	%o4
	edge16	%o6,	%g6,	%i5
	edge32n	%l0,	%i7,	%l3
	movl	%icc,	%o7,	%l1
	movpos	%xcc,	%l4,	%g4
	edge16ln	%o5,	%i1,	%o3
	fzero	%f6
	edge16l	%i2,	%g2,	%l5
	siam	0x3
	lduw	[%l7 + 0x18],	%i6
	xnor	%o2,	%i0,	%g1
	mulx	%o0,	0x09B0,	%i3
	fmovdg	%xcc,	%f31,	%f19
	addccc	%g5,	0x0197,	%o1
	movge	%icc,	%l6,	%g7
	movg	%xcc,	%l2,	%i4
	srl	%g3,	0x00,	%o6
	nop
	set	0x08, %g7
	std	%f22,	[%l7 + %g7]
	mulscc	%g6,	%o4,	%l0
	ldsb	[%l7 + 0x79],	%i5
	sdiv	%i7,	0x18E4,	%o7
	move	%xcc,	%l3,	%l4
	ldd	[%l7 + 0x68],	%g4
	std	%f30,	[%l7 + 0x58]
	edge16	%o5,	%i1,	%o3
	udivcc	%i2,	0x0E07,	%l1
	restore %l5, 0x1952, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i6,	0x0D,	%i0
	edge16	%o2,	%o0,	%g1
	array32	%i3,	%g5,	%o1
	movrlz	%l6,	%l2,	%g7
	ldsw	[%l7 + 0x20],	%i4
	udivx	%o6,	0x1415,	%g6
	movvc	%xcc,	%o4,	%l0
	umulcc	%g3,	%i7,	%i5
	movrgz	%l3,	%l4,	%g4
	umul	%o7,	%i1,	%o5
	sra	%i2,	0x17,	%l1
	udiv	%o3,	0x13B0,	%l5
	pdist	%f18,	%f4,	%f18
	mulscc	%i6,	0x0B2B,	%i0
	fmovsle	%xcc,	%f17,	%f22
	fxor	%f2,	%f16,	%f22
	fandnot1s	%f10,	%f18,	%f30
	move	%icc,	%o2,	%g2
	alignaddrl	%o0,	%i3,	%g5
	sdivcc	%o1,	0x05B9,	%g1
	or	%l6,	%g7,	%i4
	umulcc	%l2,	0x12A3,	%o6
	fcmple16	%f12,	%f30,	%g6
	or	%l0,	%o4,	%i7
	movrgz	%g3,	0x27C,	%i5
	subccc	%l3,	%g4,	%l4
	fcmpeq32	%f10,	%f30,	%i1
	subc	%o7,	0x1BA9,	%o5
	edge16ln	%i2,	%l1,	%o3
	sra	%l5,	%i0,	%i6
	movge	%xcc,	%g2,	%o2
	edge32l	%i3,	%o0,	%g5
	udivcc	%o1,	0x0880,	%g1
	mulx	%l6,	%g7,	%l2
	alignaddr	%o6,	%g6,	%l0
	xnorcc	%o4,	0x01B6,	%i7
	fnegd	%f16,	%f18
	stw	%g3,	[%l7 + 0x28]
	fors	%f20,	%f19,	%f12
	ld	[%l7 + 0x70],	%f30
	move	%xcc,	%i5,	%i4
	movvs	%xcc,	%l3,	%g4
	array8	%i1,	%o7,	%l4
	fmovdvs	%icc,	%f25,	%f10
	fmovrslez	%i2,	%f20,	%f20
	array16	%o5,	%o3,	%l1
	fmovsleu	%icc,	%f2,	%f0
	stx	%i0,	[%l7 + 0x30]
	and	%l5,	0x09C8,	%i6
	stx	%o2,	[%l7 + 0x70]
	fmovdpos	%icc,	%f6,	%f28
	alignaddr	%g2,	%i3,	%g5
	movre	%o0,	%g1,	%o1
	edge32l	%l6,	%l2,	%o6
	smul	%g7,	%l0,	%o4
	subccc	%g6,	%i7,	%i5
	edge8	%g3,	%l3,	%g4
	subc	%i4,	0x1B38,	%o7
	edge8n	%l4,	%i1,	%o5
	smulcc	%o3,	0x1779,	%i2
	lduh	[%l7 + 0x16],	%i0
	edge32	%l5,	%i6,	%o2
	ldsw	[%l7 + 0x60],	%l1
	movneg	%xcc,	%i3,	%g2
	movgu	%icc,	%o0,	%g1
	array32	%o1,	%l6,	%l2
	array32	%g5,	%o6,	%g7
	orcc	%o4,	0x176C,	%g6
	alignaddrl	%i7,	%i5,	%l0
	edge16l	%g3,	%g4,	%i4
	fmul8x16au	%f17,	%f18,	%f12
	ldsw	[%l7 + 0x6C],	%l3
	fmovdneg	%icc,	%f5,	%f6
	fcmple16	%f2,	%f24,	%l4
	fnegd	%f22,	%f6
	edge32ln	%o7,	%i1,	%o5
	edge16	%i2,	%o3,	%i0
	movrgez	%l5,	0x393,	%i6
	fcmpeq32	%f16,	%f8,	%l1
	mulx	%i3,	%g2,	%o2
	fmovsvs	%icc,	%f11,	%f2
	fnors	%f15,	%f31,	%f16
	lduh	[%l7 + 0x10],	%g1
	fmovdleu	%xcc,	%f3,	%f18
	fmovdle	%icc,	%f25,	%f19
	movn	%icc,	%o0,	%l6
	movneg	%xcc,	%l2,	%g5
	mulscc	%o1,	%o6,	%g7
	subccc	%o4,	0x0349,	%i7
	fnegs	%f27,	%f29
	and	%i5,	0x00B7,	%l0
	fcmpne32	%f0,	%f22,	%g6
	movcs	%icc,	%g3,	%g4
	fandnot1	%f18,	%f26,	%f16
	xor	%i4,	%l3,	%l4
	sir	0x0ABA
	edge16	%o7,	%i1,	%i2
	subcc	%o3,	%i0,	%o5
	srl	%l5,	%l1,	%i6
	ldsw	[%l7 + 0x44],	%g2
	siam	0x3
	faligndata	%f24,	%f28,	%f18
	ldx	[%l7 + 0x70],	%i3
	sll	%g1,	0x03,	%o0
	umulcc	%l6,	%l2,	%g5
	mova	%xcc,	%o2,	%o1
	fmovde	%xcc,	%f2,	%f30
	andn	%o6,	0x0A20,	%g7
	nop
	set	0x30, %g3
	lduw	[%l7 + %g3],	%i7
	edge8l	%i5,	%l0,	%o4
	fsrc2	%f30,	%f2
	movvc	%xcc,	%g6,	%g3
	xor	%i4,	0x196D,	%g4
	edge32l	%l3,	%l4,	%i1
	andcc	%i2,	0x141E,	%o3
	movg	%xcc,	%o7,	%i0
	fabsd	%f16,	%f26
	sll	%o5,	%l5,	%i6
	fmovde	%xcc,	%f11,	%f23
	array32	%l1,	%g2,	%g1
	movcs	%xcc,	%o0,	%l6
	fmovsl	%icc,	%f12,	%f26
	st	%f15,	[%l7 + 0x58]
	movrlz	%l2,	0x059,	%g5
	sub	%i3,	%o2,	%o1
	sub	%o6,	%g7,	%i5
	fandnot1	%f8,	%f28,	%f26
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	orncc	%o4,	%g3,	%g6
	movrgez	%i4,	%g4,	%l3
	ld	[%l7 + 0x38],	%f8
	fmovsle	%icc,	%f29,	%f4
	orncc	%i1,	%l4,	%o3
	movleu	%xcc,	%o7,	%i2
	movneg	%xcc,	%o5,	%i0
	nop
	set	0x38, %i6
	sth	%l5,	[%l7 + %i6]
	fpackfix	%f10,	%f15
	array8	%i6,	%l1,	%g1
	faligndata	%f8,	%f20,	%f18
	mulx	%o0,	0x1719,	%g2
	movneg	%xcc,	%l2,	%l6
	umulcc	%g5,	0x01E3,	%i3
	edge8l	%o2,	%o1,	%o6
	orncc	%i5,	%l0,	%i7
	addccc	%g7,	0x1328,	%o4
	umulcc	%g3,	%i4,	%g6
	edge16n	%l3,	%i1,	%g4
	fmovdg	%icc,	%f19,	%f19
	fmovsvc	%icc,	%f12,	%f12
	sub	%o3,	%l4,	%i2
	fand	%f10,	%f30,	%f24
	fxnor	%f10,	%f8,	%f26
	addc	%o5,	0x072D,	%o7
	or	%i0,	%i6,	%l5
	sdivcc	%l1,	0x03BA,	%o0
	and	%g2,	0x04B7,	%l2
	edge32	%g1,	%g5,	%i3
	ldd	[%l7 + 0x10],	%o2
	fmul8x16	%f20,	%f26,	%f20
	alignaddrl	%o1,	%o6,	%l6
	fnot2	%f0,	%f20
	edge8l	%i5,	%l0,	%i7
	alignaddr	%g7,	%o4,	%g3
	movrgez	%g6,	0x347,	%i4
	and	%i1,	0x1DD0,	%l3
	ld	[%l7 + 0x78],	%f21
	sllx	%g4,	0x1C,	%o3
	fmuld8ulx16	%f20,	%f9,	%f20
	subccc	%i2,	0x149B,	%o5
	fmovdn	%icc,	%f25,	%f2
	fmovsn	%xcc,	%f4,	%f6
	stw	%l4,	[%l7 + 0x44]
	umul	%i0,	0x0E85,	%o7
	movrlez	%i6,	0x174,	%l1
	restore %l5, 0x01D2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g2,	0x32E,	%g1
	movrgz	%l2,	%i3,	%g5
	ldsb	[%l7 + 0x3B],	%o2
	edge8l	%o6,	%l6,	%i5
	fandnot2	%f2,	%f6,	%f22
	movvs	%icc,	%l0,	%o1
	sethi	0x0547,	%i7
	movle	%icc,	%g7,	%g3
	array16	%g6,	%i4,	%i1
	fnegd	%f12,	%f8
	alignaddrl	%l3,	%o4,	%o3
	fmovdg	%icc,	%f12,	%f22
	edge8ln	%i2,	%o5,	%g4
	ldsh	[%l7 + 0x28],	%i0
	fmovsg	%icc,	%f19,	%f9
	fmovde	%xcc,	%f21,	%f12
	st	%f19,	[%l7 + 0x74]
	array32	%l4,	%o7,	%l1
	ldub	[%l7 + 0x1D],	%i6
	addcc	%l5,	0x13A6,	%g2
	stx	%o0,	[%l7 + 0x68]
	mulx	%l2,	0x0D56,	%i3
	alignaddrl	%g5,	%o2,	%o6
	fxnors	%f1,	%f27,	%f26
	movcc	%icc,	%g1,	%i5
	fmovrde	%l0,	%f28,	%f30
	alignaddrl	%l6,	%i7,	%o1
	movre	%g7,	0x381,	%g3
	movre	%g6,	0x1A3,	%i4
	or	%i1,	0x030F,	%o4
	edge32n	%o3,	%i2,	%o5
	edge32ln	%g4,	%i0,	%l3
	save %l4, %l1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l5,	[%l7 + 0x08]
	sethi	0x1E1F,	%g2
	edge32	%o7,	%o0,	%l2
	subcc	%i3,	0x0139,	%g5
	sra	%o6,	%g1,	%i5
	array16	%l0,	%o2,	%i7
	udiv	%l6,	0x10B7,	%g7
	edge32n	%o1,	%g3,	%g6
	fnot1	%f22,	%f26
	srlx	%i4,	%i1,	%o3
	umul	%i2,	%o5,	%g4
	movrlez	%i0,	0x119,	%o4
	sub	%l3,	%l4,	%i6
	fsrc1	%f28,	%f0
	umul	%l1,	0x0EF1,	%g2
	addcc	%o7,	0x1C32,	%o0
	fsrc1	%f26,	%f26
	lduh	[%l7 + 0x6E],	%l2
	movvs	%xcc,	%i3,	%l5
	sth	%g5,	[%l7 + 0x56]
	mulx	%g1,	0x16E9,	%i5
	edge32	%l0,	%o2,	%i7
	addc	%l6,	0x1872,	%o6
	fmovdcs	%icc,	%f10,	%f25
	movrne	%o1,	%g7,	%g3
	alignaddr	%g6,	%i4,	%o3
	movrgz	%i2,	%i1,	%o5
	array16	%g4,	%i0,	%l3
	array16	%l4,	%o4,	%i6
	sra	%g2,	0x0A,	%l1
	save %o0, 0x0510, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i3,	[%l7 + 0x4C]
	movl	%xcc,	%l2,	%l5
	fpmerge	%f23,	%f21,	%f18
	orncc	%g1,	0x0DD2,	%i5
	movg	%xcc,	%g5,	%o2
	fpadd32	%f24,	%f4,	%f8
	and	%l0,	0x0E57,	%l6
	fmovsgu	%icc,	%f24,	%f2
	sllx	%i7,	%o6,	%o1
	srlx	%g7,	0x1C,	%g6
	movre	%g3,	%o3,	%i2
	or	%i1,	0x1325,	%i4
	ldub	[%l7 + 0x25],	%o5
	sll	%i0,	0x1B,	%g4
	movg	%xcc,	%l3,	%o4
	sra	%i6,	%l4,	%g2
	ld	[%l7 + 0x24],	%f25
	st	%f29,	[%l7 + 0x0C]
	edge32n	%o0,	%o7,	%i3
	srlx	%l1,	%l2,	%l5
	fmovspos	%icc,	%f22,	%f20
	edge16ln	%i5,	%g5,	%o2
	subc	%g1,	%l6,	%l0
	andn	%o6,	%o1,	%g7
	addc	%i7,	0x018F,	%g6
	sir	0x0C46
	ldub	[%l7 + 0x5C],	%g3
	edge16n	%o3,	%i1,	%i4
	lduw	[%l7 + 0x7C],	%i2
	edge32ln	%o5,	%g4,	%i0
	xor	%o4,	0x1FEF,	%l3
	edge16n	%i6,	%g2,	%l4
	ldsh	[%l7 + 0x32],	%o7
	ldsh	[%l7 + 0x72],	%o0
	fmovrslez	%l1,	%f19,	%f30
	alignaddr	%l2,	%i3,	%l5
	edge16	%g5,	%i5,	%o2
	movrgez	%g1,	%l0,	%o6
	fpmerge	%f1,	%f28,	%f20
	movl	%icc,	%o1,	%g7
	save %i7, 0x1DA8, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g3,	0x03DB,	%o3
	ldd	[%l7 + 0x10],	%f10
	nop
	set	0x28, %i3
	stx	%l6,	[%l7 + %i3]
	sdiv	%i4,	0x061E,	%i1
	sdiv	%i2,	0x1A85,	%o5
	array16	%i0,	%o4,	%g4
	ld	[%l7 + 0x3C],	%f13
	sdivx	%l3,	0x1F94,	%g2
	fmovdcs	%xcc,	%f28,	%f9
	addc	%i6,	0x1601,	%o7
	srlx	%o0,	%l1,	%l2
	srl	%l4,	%i3,	%g5
	st	%f6,	[%l7 + 0x28]
	pdist	%f12,	%f0,	%f18
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%f4
	stb	%l5,	[%l7 + 0x21]
	edge32l	%i5,	%o2,	%g1
	fsrc2	%f0,	%f8
	movn	%icc,	%o6,	%l0
	fmovsvc	%xcc,	%f9,	%f29
	alignaddr	%o1,	%i7,	%g6
	movleu	%icc,	%g7,	%o3
	sra	%g3,	%i4,	%l6
	smulcc	%i1,	0x0A19,	%i2
	srl	%i0,	0x14,	%o4
	udivx	%o5,	0x1DCB,	%l3
	edge16l	%g4,	%g2,	%i6
	ldd	[%l7 + 0x70],	%f12
	fmovdneg	%xcc,	%f31,	%f9
	umul	%o0,	0x10FD,	%o7
	fnand	%f0,	%f2,	%f18
	fmovdg	%icc,	%f12,	%f20
	srl	%l2,	0x13,	%l1
	popc	%i3,	%l4
	ldd	[%l7 + 0x60],	%g4
	sdivx	%i5,	0x1F5A,	%l5
	fandnot2	%f28,	%f0,	%f0
	fands	%f11,	%f21,	%f19
	mulscc	%o2,	%g1,	%o6
	movvc	%icc,	%o1,	%l0
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	and	%g7,	%g3,	%l6
	ldsh	[%l7 + 0x5A],	%i1
	fnot1	%f8,	%f12
	addccc	%i4,	0x13D9,	%i2
	umul	%i0,	0x1507,	%o4
	nop
	set	0x70, %g2
	stx	%o5,	[%l7 + %g2]
	edge16ln	%l3,	%g4,	%g2
	xnor	%i6,	0x0DE2,	%o7
	popc	0x09E9,	%o0
	restore %l1, 0x188A, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l2,	%g5,	%i5
	nop
	set	0x14, %o3
	lduw	[%l7 + %o3],	%l5
	movn	%xcc,	%l4,	%o2
	edge16	%o6,	%g1,	%o1
	fpsub32	%f22,	%f20,	%f8
	fpack16	%f26,	%f2
	orn	%l0,	0x1644,	%i7
	udiv	%o3,	0x01EF,	%g6
	nop
	set	0x10, %i1
	ldsb	[%l7 + %i1],	%g3
	xnor	%g7,	%l6,	%i4
	xor	%i1,	%i0,	%i2
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	sir	0x178A
	fnot1	%f2,	%f8
	andcc	%o5,	%g4,	%i6
	srlx	%o7,	%o0,	%g2
	fmovsn	%icc,	%f17,	%f8
	movrlz	%i3,	0x33D,	%l2
	movge	%icc,	%l1,	%i5
	stx	%g5,	[%l7 + 0x20]
	movcs	%xcc,	%l4,	%o2
	edge32n	%o6,	%g1,	%l5
	umul	%o1,	0x07B0,	%i7
	ldx	[%l7 + 0x30],	%l0
	smul	%o3,	%g6,	%g3
	orn	%l6,	%g7,	%i1
	movrlz	%i0,	%i4,	%i2
	orncc	%l3,	%o4,	%o5
	alignaddr	%i6,	%o7,	%g4
	movge	%xcc,	%o0,	%g2
	fmovsg	%xcc,	%f14,	%f10
	fpsub16s	%f1,	%f31,	%f2
	smulcc	%l2,	%l1,	%i5
	fsrc2	%f16,	%f30
	fornot2	%f20,	%f0,	%f28
	sub	%g5,	%i3,	%o2
	fmovd	%f8,	%f16
	xnorcc	%o6,	0x0E9A,	%l4
	ldub	[%l7 + 0x78],	%l5
	fcmps	%fcc0,	%f19,	%f23
	alignaddrl	%o1,	%i7,	%g1
	fands	%f16,	%f17,	%f2
	alignaddr	%l0,	%g6,	%o3
	stb	%g3,	[%l7 + 0x44]
	xorcc	%g7,	%i1,	%l6
	edge8n	%i0,	%i2,	%i4
	fmovs	%f0,	%f25
	fors	%f5,	%f24,	%f19
	nop
	set	0x51, %i2
	ldub	[%l7 + %i2],	%l3
	or	%o4,	%i6,	%o7
	stb	%o5,	[%l7 + 0x63]
	ldsw	[%l7 + 0x14],	%g4
	save %g2, %o0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f20,	[%l7 + 0x68]
	edge32l	%l2,	%g5,	%i3
	movneg	%xcc,	%o2,	%o6
	sra	%l4,	%i5,	%o1
	fpsub16s	%f3,	%f16,	%f3
	edge16l	%i7,	%g1,	%l5
	mulx	%g6,	0x0A21,	%l0
	movle	%icc,	%o3,	%g7
	udivx	%g3,	0x07B9,	%i1
	sdivcc	%i0,	0x1235,	%i2
	for	%f22,	%f4,	%f22
	movcs	%xcc,	%i4,	%l6
	sdivcc	%o4,	0x1B77,	%i6
	fmovdn	%icc,	%f27,	%f24
	move	%icc,	%o7,	%l3
	udivcc	%g4,	0x0F9F,	%g2
	fands	%f19,	%f23,	%f13
	edge8n	%o0,	%o5,	%l2
	xorcc	%g5,	%i3,	%o2
	movg	%icc,	%l1,	%o6
	lduh	[%l7 + 0x76],	%l4
	popc	0x18EB,	%i5
	fmovrdlez	%o1,	%f10,	%f14
	andcc	%g1,	0x00F5,	%l5
	mulx	%g6,	%i7,	%o3
	movcc	%icc,	%l0,	%g7
	movg	%icc,	%i1,	%i0
	fnot2s	%f4,	%f1
	ldd	[%l7 + 0x08],	%f2
	udivx	%i2,	0x0C78,	%i4
	ldx	[%l7 + 0x10],	%l6
	fornot1s	%f3,	%f7,	%f8
	xor	%o4,	0x0BF9,	%g3
	sll	%i6,	0x10,	%o7
	edge16ln	%g4,	%l3,	%o0
	sll	%g2,	%l2,	%g5
	add	%o5,	%o2,	%i3
	edge8	%o6,	%l1,	%i5
	ld	[%l7 + 0x10],	%f17
	fmovdgu	%xcc,	%f27,	%f4
	xorcc	%l4,	%g1,	%o1
	movleu	%icc,	%l5,	%i7
	array16	%o3,	%g6,	%l0
	fmovd	%f4,	%f10
	umulcc	%i1,	0x053E,	%g7
	fmovdne	%xcc,	%f0,	%f31
	edge8ln	%i0,	%i4,	%l6
	movgu	%icc,	%i2,	%g3
	movneg	%icc,	%o4,	%o7
	movrlez	%i6,	0x1EA,	%g4
	fmovsvs	%xcc,	%f14,	%f0
	movl	%icc,	%o0,	%g2
	mova	%xcc,	%l3,	%g5
	movcs	%icc,	%o5,	%l2
	smul	%o2,	0x1C86,	%i3
	fpadd32s	%f3,	%f21,	%f12
	edge32	%o6,	%l1,	%l4
	mulx	%i5,	%g1,	%l5
	fors	%f27,	%f19,	%f0
	lduh	[%l7 + 0x7C],	%o1
	movl	%xcc,	%o3,	%g6
	fmul8sux16	%f28,	%f24,	%f10
	edge8n	%i7,	%l0,	%i1
	fmovsle	%icc,	%f6,	%f10
	movcs	%icc,	%i0,	%i4
	array32	%l6,	%i2,	%g3
	andcc	%g7,	%o4,	%o7
	xorcc	%g4,	%i6,	%o0
	xor	%g2,	%l3,	%o5
	movrgz	%g5,	%l2,	%o2
	fxnors	%f3,	%f4,	%f10
	srl	%i3,	0x1F,	%l1
	udivcc	%o6,	0x004E,	%l4
	addcc	%g1,	%i5,	%l5
	movne	%xcc,	%o1,	%o3
	fmovde	%icc,	%f11,	%f17
	ldx	[%l7 + 0x28],	%g6
	movvc	%xcc,	%l0,	%i7
	edge32	%i0,	%i4,	%l6
	edge8	%i2,	%g3,	%i1
	fornot2	%f10,	%f8,	%f10
	fmovspos	%xcc,	%f7,	%f26
	or	%o4,	0x1DFA,	%o7
	fmovrdgz	%g7,	%f2,	%f10
	edge16n	%g4,	%o0,	%g2
	fmovsne	%xcc,	%f8,	%f3
	move	%xcc,	%i6,	%o5
	udivcc	%l3,	0x1239,	%l2
	movleu	%icc,	%g5,	%o2
	move	%icc,	%i3,	%l1
	restore %l4, %o6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g1,	0x0B29,	%l5
	stw	%o3,	[%l7 + 0x0C]
	movl	%icc,	%g6,	%o1
	fmovsgu	%xcc,	%f4,	%f4
	fmovdl	%icc,	%f14,	%f28
	stx	%i7,	[%l7 + 0x58]
	subc	%i0,	0x1F49,	%l0
	movrlez	%i4,	0x083,	%i2
	movle	%icc,	%l6,	%g3
	edge8n	%i1,	%o7,	%g7
	edge16	%o4,	%o0,	%g4
	lduh	[%l7 + 0x2E],	%g2
	std	%f24,	[%l7 + 0x38]
	orn	%i6,	0x14B0,	%l3
	mulscc	%l2,	0x1D3C,	%g5
	save %o5, %o2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i3,	%o6
	orncc	%l4,	0x00E6,	%i5
	ldsw	[%l7 + 0x44],	%l5
	std	%f4,	[%l7 + 0x30]
	xorcc	%g1,	0x006B,	%o3
	sth	%o1,	[%l7 + 0x68]
	xorcc	%i7,	0x00E5,	%i0
	edge32ln	%g6,	%i4,	%i2
	sll	%l6,	0x03,	%l0
	andncc	%g3,	%o7,	%i1
	sth	%g7,	[%l7 + 0x62]
	orcc	%o0,	%g4,	%o4
	edge8	%i6,	%g2,	%l2
	edge16	%l3,	%g5,	%o5
	ldsh	[%l7 + 0x08],	%l1
	sdivx	%i3,	0x1655,	%o2
	sdivcc	%l4,	0x1DA0,	%o6
	nop
	set	0x78, %i4
	ldx	[%l7 + %i4],	%i5
	sllx	%g1,	%l5,	%o1
	ldub	[%l7 + 0x3D],	%o3
	sdivx	%i0,	0x1C97,	%i7
	fmul8x16au	%f17,	%f31,	%f18
	sir	0x051B
	smul	%g6,	0x0DB7,	%i4
	save %l6, %l0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g3,	0x1935,	%i1
	fmovsl	%xcc,	%f18,	%f23
	stw	%o7,	[%l7 + 0x10]
	udiv	%g7,	0x0EA0,	%g4
	popc	%o4,	%o0
	fmovs	%f3,	%f2
	movvs	%xcc,	%i6,	%l2
	srl	%g2,	0x0E,	%g5
	fmovspos	%xcc,	%f21,	%f16
	srlx	%l3,	0x1E,	%l1
	orncc	%o5,	%o2,	%i3
	edge8	%l4,	%i5,	%g1
	edge32n	%l5,	%o6,	%o1
	alignaddr	%o3,	%i0,	%i7
	movrgez	%i4,	0x09F,	%g6
	subc	%l6,	0x0760,	%i2
	std	%f8,	[%l7 + 0x60]
	edge16ln	%g3,	%i1,	%l0
	fmovsvc	%xcc,	%f11,	%f4
	addc	%g7,	%o7,	%g4
	fcmpne32	%f0,	%f10,	%o4
	fmovrdgez	%o0,	%f24,	%f22
	sdivx	%i6,	0x1718,	%g2
	or	%g5,	%l3,	%l2
	fxnors	%f1,	%f5,	%f24
	xnorcc	%l1,	%o5,	%o2
	fmovdneg	%icc,	%f22,	%f28
	fmovsle	%xcc,	%f25,	%f3
	xnorcc	%i3,	0x1C3E,	%i5
	movrne	%l4,	%l5,	%g1
	popc	0x1DF6,	%o6
	edge8l	%o1,	%i0,	%i7
	fxor	%f4,	%f0,	%f16
	edge16l	%i4,	%o3,	%l6
	addccc	%g6,	0x17A2,	%i2
	fmovda	%xcc,	%f16,	%f15
	alignaddrl	%g3,	%i1,	%l0
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%o7
	addc	%g7,	0x0897,	%g4
	nop
	set	0x44, %l6
	ldsb	[%l7 + %l6],	%o0
	siam	0x2
	movvs	%icc,	%i6,	%g2
	movrgz	%o4,	%g5,	%l3
	edge8n	%l2,	%l1,	%o2
	xnor	%o5,	%i5,	%l4
	andn	%i3,	%l5,	%o6
	siam	0x5
	lduw	[%l7 + 0x74],	%g1
	addc	%o1,	0x14E9,	%i7
	fnegd	%f8,	%f2
	mulx	%i0,	%o3,	%i4
	orcc	%g6,	%l6,	%g3
	fmovrsne	%i1,	%f14,	%f19
	smulcc	%l0,	0x07EC,	%i2
	lduw	[%l7 + 0x4C],	%o7
	std	%f18,	[%l7 + 0x60]
	fmovrdlz	%g4,	%f14,	%f20
	edge32ln	%o0,	%i6,	%g2
	edge32n	%o4,	%g7,	%g5
	movrlz	%l3,	0x15F,	%l1
	movne	%icc,	%l2,	%o2
	alignaddrl	%i5,	%o5,	%i3
	or	%l5,	0x07DB,	%l4
	fcmpgt32	%f14,	%f24,	%g1
	movrlz	%o6,	0x22B,	%o1
	fabsd	%f18,	%f14
	ldd	[%l7 + 0x78],	%i0
	orn	%o3,	%i4,	%g6
	ldsh	[%l7 + 0x46],	%l6
	ldd	[%l7 + 0x08],	%g2
	udivx	%i1,	0x01F9,	%i7
	popc	0x1A3E,	%l0
	movcc	%icc,	%o7,	%i2
	mulx	%o0,	0x105A,	%i6
	movvs	%icc,	%g4,	%o4
	xnor	%g7,	%g2,	%g5
	addccc	%l3,	0x1237,	%l2
	fpadd32s	%f0,	%f10,	%f15
	sllx	%o2,	0x05,	%l1
	fmovdcc	%icc,	%f12,	%f25
	movrgez	%o5,	0x0B2,	%i3
	edge32n	%l5,	%l4,	%i5
	edge16n	%o6,	%o1,	%g1
	nop
	set	0x74, %o6
	stb	%o3,	[%l7 + %o6]
	fmovrsgez	%i4,	%f22,	%f9
	fpsub16s	%f6,	%f2,	%f24
	edge16l	%g6,	%i0,	%l6
	movpos	%xcc,	%i1,	%i7
	fpsub32s	%f15,	%f15,	%f11
	edge8l	%g3,	%o7,	%l0
	faligndata	%f20,	%f14,	%f28
	fornot2	%f8,	%f12,	%f12
	addc	%i2,	%o0,	%i6
	umul	%g4,	0x022E,	%o4
	movleu	%xcc,	%g7,	%g2
	sth	%l3,	[%l7 + 0x1C]
	movg	%icc,	%l2,	%o2
	orcc	%l1,	%o5,	%g5
	umulcc	%i3,	%l4,	%i5
	subc	%l5,	0x0AE1,	%o1
	movvs	%xcc,	%g1,	%o6
	fsrc1s	%f31,	%f16
	fand	%f30,	%f20,	%f18
	movleu	%icc,	%i4,	%o3
	xnor	%i0,	%l6,	%g6
	ld	[%l7 + 0x18],	%f23
	edge16n	%i7,	%g3,	%i1
	fmovscs	%icc,	%f9,	%f11
	xor	%l0,	0x180C,	%o7
	fmovrsgz	%i2,	%f8,	%f3
	add	%i6,	0x1356,	%o0
	addccc	%o4,	0x159F,	%g4
	bshuffle	%f26,	%f10,	%f12
	st	%f26,	[%l7 + 0x5C]
	fpadd16	%f2,	%f8,	%f24
	movrne	%g2,	0x313,	%g7
	subccc	%l3,	0x04AD,	%l2
	orncc	%o2,	0x0802,	%o5
	lduw	[%l7 + 0x5C],	%g5
	edge32l	%i3,	%l1,	%i5
	smul	%l4,	0x0A58,	%o1
	fsrc1	%f22,	%f22
	for	%f26,	%f8,	%f12
	movgu	%icc,	%l5,	%g1
	ld	[%l7 + 0x08],	%f6
	ldx	[%l7 + 0x18],	%o6
	stw	%o3,	[%l7 + 0x58]
	sir	0x1138
	orncc	%i0,	0x01D4,	%l6
	array8	%i4,	%i7,	%g3
	movgu	%icc,	%g6,	%i1
	xnor	%l0,	0x0766,	%i2
	stx	%o7,	[%l7 + 0x48]
	fpadd32s	%f6,	%f12,	%f21
	addc	%i6,	%o4,	%o0
	ldsh	[%l7 + 0x68],	%g2
	fcmple16	%f4,	%f14,	%g4
	movgu	%xcc,	%g7,	%l3
	fmovrdne	%o2,	%f22,	%f0
	edge32ln	%l2,	%g5,	%i3
	fcmpes	%fcc0,	%f20,	%f2
	fmovse	%xcc,	%f21,	%f13
	fsrc2	%f16,	%f2
	andn	%o5,	0x10D2,	%l1
	edge32n	%l4,	%o1,	%i5
	sethi	0x0A4B,	%l5
	move	%icc,	%g1,	%o6
	movrlez	%o3,	0x0C6,	%l6
	sllx	%i0,	0x1E,	%i4
	orn	%g3,	0x0FD2,	%g6
	andn	%i1,	%i7,	%l0
	ldsh	[%l7 + 0x34],	%o7
	movrlez	%i2,	%i6,	%o0
	edge32l	%g2,	%o4,	%g7
	srax	%l3,	0x19,	%g4
	addccc	%l2,	0x0715,	%o2
	ldx	[%l7 + 0x38],	%g5
	xorcc	%i3,	%o5,	%l4
	edge8n	%l1,	%o1,	%l5
	movpos	%icc,	%g1,	%o6
	sethi	0x1746,	%o3
	fcmple16	%f4,	%f0,	%l6
	movneg	%xcc,	%i5,	%i0
	movl	%icc,	%g3,	%g6
	subccc	%i4,	%i1,	%i7
	fmovdleu	%xcc,	%f21,	%f25
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	movge	%icc,	%i6,	%o0
	fxnor	%f10,	%f12,	%f12
	st	%f29,	[%l7 + 0x1C]
	sdivx	%i2,	0x1E01,	%g2
	edge32l	%g7,	%o4,	%g4
	sll	%l2,	0x03,	%o2
	stb	%l3,	[%l7 + 0x7A]
	ldub	[%l7 + 0x42],	%i3
	fandnot1	%f8,	%f12,	%f20
	smul	%g5,	0x0AF7,	%l4
	movrlz	%l1,	0x247,	%o5
	movcs	%xcc,	%o1,	%g1
	movcs	%xcc,	%o6,	%l5
	andncc	%o3,	%i5,	%i0
	xorcc	%l6,	0x089B,	%g3
	umul	%i4,	%i1,	%g6
	umul	%l0,	0x15ED,	%o7
	fpadd32s	%f0,	%f26,	%f11
	fmovs	%f21,	%f22
	movpos	%icc,	%i6,	%o0
	movg	%xcc,	%i2,	%i7
	orcc	%g2,	0x134F,	%g7
	movcs	%xcc,	%g4,	%l2
	srax	%o4,	0x0B,	%l3
	alignaddr	%o2,	%g5,	%l4
	fmovdcc	%xcc,	%f30,	%f15
	andncc	%l1,	%i3,	%o1
	umul	%g1,	%o5,	%o6
	stw	%l5,	[%l7 + 0x2C]
	fmovrdlez	%o3,	%f8,	%f28
	smulcc	%i0,	%l6,	%i5
	movvc	%icc,	%i4,	%i1
	stx	%g3,	[%l7 + 0x60]
	udivx	%l0,	0x0105,	%o7
	lduw	[%l7 + 0x34],	%g6
	subc	%i6,	0x0D34,	%i2
	sethi	0x1DA9,	%i7
	edge8ln	%o0,	%g2,	%g7
	edge8n	%g4,	%o4,	%l3
	save %l2, 0x0616, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f10,	%f18,	%f26
	addccc	%l4,	%l1,	%i3
	srl	%o1,	0x08,	%o2
	movrgz	%o5,	%g1,	%o6
	std	%f2,	[%l7 + 0x70]
	orncc	%o3,	%i0,	%l5
	movrlz	%i5,	%l6,	%i1
	srl	%g3,	0x17,	%l0
	fsrc2s	%f29,	%f10
	stb	%o7,	[%l7 + 0x73]
	sir	0x1BC7
	move	%xcc,	%g6,	%i4
	srlx	%i6,	0x1A,	%i2
	fcmple16	%f10,	%f24,	%i7
	std	%f8,	[%l7 + 0x78]
	ld	[%l7 + 0x18],	%f9
	fmovrsgz	%g2,	%f2,	%f21
	mova	%xcc,	%o0,	%g4
	movl	%xcc,	%g7,	%o4
	fornot2s	%f14,	%f29,	%f7
	restore %l2, 0x0AD7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g5,	%l1,	%i3
	edge16	%l4,	%o1,	%o2
	fmovspos	%icc,	%f18,	%f4
	fmovse	%icc,	%f31,	%f19
	fcmple32	%f0,	%f8,	%o5
	movn	%icc,	%o6,	%g1
	subc	%o3,	%i0,	%l5
	edge8ln	%l6,	%i1,	%i5
	sethi	0x15ED,	%g3
	fmovsle	%xcc,	%f20,	%f6
	movleu	%icc,	%o7,	%g6
	mulx	%i4,	%i6,	%l0
	movvs	%xcc,	%i7,	%i2
	movrgez	%o0,	%g4,	%g7
	sth	%g2,	[%l7 + 0x64]
	fmovdne	%icc,	%f28,	%f23
	popc	%l2,	%o4
	fxnor	%f22,	%f16,	%f20
	xor	%g5,	0x15BB,	%l1
	edge16n	%i3,	%l3,	%o1
	edge32ln	%l4,	%o2,	%o5
	srl	%o6,	0x18,	%o3
	sdiv	%g1,	0x0801,	%l5
	umul	%l6,	0x0A2B,	%i0
	stb	%i5,	[%l7 + 0x68]
	orn	%i1,	%o7,	%g6
	st	%f6,	[%l7 + 0x44]
	edge16ln	%i4,	%g3,	%i6
	sth	%i7,	[%l7 + 0x72]
	fmovsn	%icc,	%f16,	%f12
	srlx	%i2,	0x0D,	%l0
	movg	%xcc,	%o0,	%g4
	movrlz	%g7,	%g2,	%l2
	andncc	%g5,	%o4,	%l1
	and	%l3,	%o1,	%l4
	fcmple32	%f20,	%f20,	%o2
	xnor	%o5,	0x1870,	%i3
	smul	%o6,	%o3,	%g1
	fxnor	%f4,	%f12,	%f8
	mulscc	%l5,	0x0011,	%i0
	fcmpeq16	%f12,	%f14,	%i5
	movcc	%icc,	%l6,	%o7
	or	%g6,	0x07FA,	%i1
	popc	%i4,	%g3
	fmovsne	%xcc,	%f24,	%f3
	popc	%i7,	%i6
	fmovrdlz	%l0,	%f18,	%f12
	fnands	%f30,	%f22,	%f13
	udivcc	%i2,	0x0737,	%o0
	movgu	%icc,	%g7,	%g4
	xorcc	%g2,	%l2,	%g5
	mulscc	%o4,	0x011D,	%l3
	fmovdn	%xcc,	%f9,	%f16
	edge16n	%o1,	%l1,	%l4
	srax	%o5,	0x11,	%i3
	fzeros	%f23
	orcc	%o2,	0x1866,	%o6
	edge32ln	%g1,	%l5,	%i0
	fpsub16s	%f0,	%f31,	%f1
	st	%f13,	[%l7 + 0x68]
	stw	%i5,	[%l7 + 0x3C]
	fmovrslez	%o3,	%f11,	%f30
	edge16n	%o7,	%g6,	%i1
	fcmple16	%f10,	%f16,	%l6
	movrlez	%g3,	%i7,	%i4
	orncc	%l0,	0x09C2,	%i2
	movcs	%xcc,	%i6,	%g7
	fmovrsgz	%o0,	%f23,	%f2
	orncc	%g2,	%l2,	%g4
	fnors	%f0,	%f26,	%f23
	lduh	[%l7 + 0x78],	%o4
	umul	%g5,	%l3,	%l1
	fabsd	%f18,	%f2
	ldd	[%l7 + 0x58],	%f0
	udivcc	%o1,	0x10AE,	%o5
	alignaddr	%i3,	%l4,	%o2
	movge	%xcc,	%g1,	%l5
	addccc	%o6,	%i5,	%o3
	ldub	[%l7 + 0x3D],	%i0
	edge32	%g6,	%o7,	%i1
	fmuld8sux16	%f21,	%f17,	%f0
	movne	%icc,	%g3,	%i7
	stw	%l6,	[%l7 + 0x70]
	fexpand	%f13,	%f16
	edge32	%l0,	%i4,	%i2
	movrlez	%i6,	%g7,	%o0
	movrne	%l2,	%g4,	%g2
	st	%f25,	[%l7 + 0x38]
	ldub	[%l7 + 0x7F],	%o4
	mulx	%l3,	%g5,	%l1
	alignaddrl	%o5,	%i3,	%o1
	addc	%l4,	0x1DB7,	%g1
	fcmpne32	%f20,	%f16,	%o2
	ldx	[%l7 + 0x10],	%l5
	edge16n	%o6,	%i5,	%o3
	fsrc1	%f12,	%f18
	orcc	%i0,	%g6,	%i1
	fmovrslez	%g3,	%f16,	%f24
	fpadd32s	%f30,	%f20,	%f20
	fmovrslez	%o7,	%f18,	%f26
	orncc	%l6,	0x0F3D,	%l0
	fornot1	%f22,	%f6,	%f8
	stb	%i7,	[%l7 + 0x59]
	fmul8ulx16	%f14,	%f22,	%f4
	ldsb	[%l7 + 0x29],	%i2
	ldub	[%l7 + 0x08],	%i6
	edge16n	%g7,	%o0,	%l2
	edge8	%i4,	%g2,	%o4
	edge16	%l3,	%g4,	%g5
	udivcc	%o5,	0x03AC,	%i3
	lduh	[%l7 + 0x66],	%l1
	xor	%o1,	0x1506,	%g1
	fmul8ulx16	%f20,	%f2,	%f20
	mulx	%l4,	%o2,	%l5
	array16	%i5,	%o6,	%i0
	fmovd	%f24,	%f10
	movgu	%xcc,	%g6,	%o3
	ldsh	[%l7 + 0x76],	%i1
	fmovsge	%icc,	%f21,	%f18
	sub	%g3,	0x1C4E,	%o7
	fmovsge	%xcc,	%f26,	%f23
	edge16	%l6,	%l0,	%i2
	sir	0x05FB
	fornot1	%f0,	%f28,	%f10
	orcc	%i7,	0x09DD,	%g7
	sdivcc	%i6,	0x0367,	%o0
	mulx	%i4,	%g2,	%l2
	fsrc2s	%f28,	%f10
	add	%o4,	0x05EA,	%g4
	lduh	[%l7 + 0x1C],	%g5
	stb	%l3,	[%l7 + 0x65]
	array8	%o5,	%l1,	%i3
	for	%f0,	%f20,	%f2
	smul	%o1,	%l4,	%g1
	fandnot2	%f12,	%f22,	%f18
	alignaddr	%l5,	%i5,	%o6
	and	%o2,	0x0E8F,	%i0
	fpackfix	%f4,	%f5
	ld	[%l7 + 0x0C],	%f7
	fmovdvc	%xcc,	%f4,	%f26
	fnegs	%f2,	%f8
	udivx	%g6,	0x15FE,	%i1
	udivcc	%o3,	0x18C8,	%g3
	movrne	%o7,	0x222,	%l6
	stw	%l0,	[%l7 + 0x60]
	nop
	set	0x08, %o7
	std	%f10,	[%l7 + %o7]
	lduh	[%l7 + 0x2C],	%i2
	fsrc1	%f4,	%f6
	movrlez	%g7,	0x0B3,	%i7
	fmovrdgez	%i6,	%f14,	%f6
	fones	%f3
	fornot2	%f12,	%f8,	%f20
	andn	%i4,	0x08E3,	%o0
	movn	%xcc,	%g2,	%o4
	umulcc	%g4,	%g5,	%l2
	and	%l3,	%l1,	%i3
	sir	0x1DA3
	movleu	%xcc,	%o5,	%o1
	fandnot2s	%f22,	%f29,	%f5
	edge8	%g1,	%l5,	%l4
	fmovrslez	%i5,	%f8,	%f7
	sllx	%o2,	%i0,	%g6
	sdivx	%o6,	0x1C91,	%o3
	xor	%g3,	%i1,	%o7
	array8	%l6,	%l0,	%g7
	array16	%i7,	%i6,	%i4
	sethi	0x0F56,	%o0
	xnor	%g2,	0x0BD3,	%o4
	popc	%i2,	%g4
	move	%icc,	%g5,	%l3
	xnor	%l1,	%i3,	%o5
	fnegd	%f4,	%f16
	smulcc	%o1,	0x095F,	%l2
	sra	%l5,	%l4,	%g1
	edge32ln	%o2,	%i0,	%g6
	fpadd32s	%f21,	%f13,	%f18
	edge16l	%i5,	%o3,	%g3
	array32	%o6,	%o7,	%i1
	fcmpne32	%f6,	%f0,	%l0
	fabss	%f15,	%f26
	mulscc	%l6,	%g7,	%i6
	edge16	%i7,	%i4,	%g2
	srax	%o4,	0x0C,	%i2
	addc	%g4,	%g5,	%o0
	orncc	%l1,	0x1438,	%l3
	addc	%i3,	0x1B22,	%o1
	andn	%l2,	0x138D,	%o5
	sdiv	%l4,	0x0716,	%l5
	nop
	set	0x20, %o5
	ldx	[%l7 + %o5],	%o2
	and	%i0,	0x0C8B,	%g1
	udivx	%g6,	0x0943,	%o3
	movrne	%g3,	%o6,	%o7
	movvc	%xcc,	%i1,	%l0
	fcmps	%fcc2,	%f1,	%f17
	ldsb	[%l7 + 0x36],	%l6
	fmuld8sux16	%f12,	%f25,	%f0
	ld	[%l7 + 0x0C],	%f30
	movleu	%xcc,	%i5,	%i6
	fexpand	%f10,	%f26
	movleu	%icc,	%g7,	%i7
	fnot2s	%f19,	%f2
	movle	%xcc,	%g2,	%i4
	movneg	%xcc,	%i2,	%o4
	fmovdl	%xcc,	%f6,	%f12
	movpos	%xcc,	%g5,	%g4
	st	%f28,	[%l7 + 0x7C]
	alignaddr	%l1,	%o0,	%l3
	nop
	set	0x5B, %g4
	ldub	[%l7 + %g4],	%i3
	edge16ln	%l2,	%o1,	%l4
	xor	%l5,	0x1066,	%o5
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	ldd	[%l7 + 0x78],	%g0
	sir	0x18DE
	andncc	%g6,	%o3,	%o6
	fone	%f6
	alignaddr	%g3,	%i1,	%o7
	movpos	%icc,	%l0,	%i5
	edge32ln	%l6,	%g7,	%i6
	ldsh	[%l7 + 0x22],	%g2
	movrlez	%i4,	0x396,	%i7
	udivcc	%o4,	0x16B8,	%g5
	srl	%i2,	%g4,	%o0
	add	%l3,	%l1,	%l2
	xor	%o1,	0x0A4E,	%l4
	edge32l	%l5,	%o5,	%o2
	movrgz	%i0,	0x2B7,	%g1
	andcc	%g6,	0x16C7,	%i3
	movgu	%icc,	%o6,	%g3
	udivcc	%i1,	0x0CDC,	%o7
	edge16l	%l0,	%i5,	%l6
	addcc	%o3,	0x0DCD,	%g7
	fmovscs	%icc,	%f26,	%f0
	movre	%g2,	%i4,	%i6
	mulx	%i7,	%o4,	%i2
	andncc	%g4,	%g5,	%o0
	ldd	[%l7 + 0x78],	%l2
	umul	%l1,	0x08CC,	%o1
	movrlez	%l4,	0x0C0,	%l5
	movvc	%icc,	%l2,	%o5
	sdiv	%o2,	0x0352,	%g1
	fone	%f18
	movvs	%xcc,	%i0,	%g6
	lduw	[%l7 + 0x5C],	%o6
	or	%g3,	0x0EA7,	%i1
	fmovdl	%xcc,	%f19,	%f5
	sra	%i3,	0x1C,	%o7
	edge32n	%l0,	%i5,	%o3
	movleu	%xcc,	%l6,	%g7
	movpos	%xcc,	%g2,	%i4
	ld	[%l7 + 0x74],	%f31
	fmuld8ulx16	%f25,	%f2,	%f18
	fcmpne32	%f10,	%f14,	%i7
	stx	%i6,	[%l7 + 0x50]
	mulx	%i2,	%g4,	%g5
	fmovsvc	%icc,	%f30,	%f6
	movrlez	%o4,	%l3,	%o0
	subcc	%o1,	0x1454,	%l1
	movge	%icc,	%l4,	%l2
	fcmpd	%fcc3,	%f6,	%f24
	for	%f30,	%f26,	%f18
	sth	%l5,	[%l7 + 0x08]
	movrgz	%o2,	%o5,	%g1
	xnorcc	%i0,	%o6,	%g6
	addcc	%g3,	%i3,	%o7
	movgu	%icc,	%l0,	%i5
	mulscc	%i1,	%l6,	%o3
	sdivx	%g2,	0x1485,	%g7
	edge16n	%i4,	%i6,	%i7
	smul	%i2,	0x1216,	%g5
	fcmpgt32	%f10,	%f6,	%g4
	sdivcc	%l3,	0x1ACD,	%o0
	srlx	%o4,	%o1,	%l1
	edge32n	%l2,	%l4,	%l5
	xorcc	%o5,	0x04D3,	%o2
	fcmpeq16	%f14,	%f10,	%g1
	smulcc	%o6,	0x074B,	%i0
	stx	%g3,	[%l7 + 0x18]
	lduh	[%l7 + 0x54],	%g6
	edge16	%i3,	%o7,	%i5
	fmovsne	%xcc,	%f12,	%f2
	fmovrdlz	%l0,	%f0,	%f4
	ldsw	[%l7 + 0x7C],	%l6
	ld	[%l7 + 0x20],	%f9
	fsrc2	%f28,	%f26
	srlx	%o3,	%g2,	%g7
	sir	0x0A0B
	sdivx	%i4,	0x1F3E,	%i1
	smulcc	%i6,	0x1386,	%i2
	stb	%i7,	[%l7 + 0x5F]
	mulscc	%g4,	0x1656,	%g5
	movne	%xcc,	%l3,	%o4
	faligndata	%f28,	%f4,	%f24
	stb	%o1,	[%l7 + 0x54]
	fxors	%f15,	%f5,	%f11
	subccc	%l1,	0x1F4E,	%o0
	edge8n	%l4,	%l2,	%l5
	edge8l	%o2,	%g1,	%o5
	edge32	%o6,	%g3,	%i0
	orcc	%i3,	0x148C,	%o7
	smulcc	%i5,	0x035D,	%l0
	sdiv	%l6,	0x190B,	%g6
	udiv	%g2,	0x09C5,	%g7
	edge16l	%o3,	%i4,	%i1
	fornot1s	%f9,	%f7,	%f9
	ld	[%l7 + 0x28],	%f22
	movcc	%xcc,	%i6,	%i7
	fmul8x16	%f1,	%f8,	%f30
	edge16ln	%i2,	%g4,	%l3
	lduh	[%l7 + 0x66],	%o4
	andn	%o1,	0x154D,	%l1
	orncc	%o0,	0x0F1D,	%g5
	srl	%l2,	0x14,	%l4
	fmul8sux16	%f24,	%f18,	%f18
	fmovdl	%xcc,	%f27,	%f29
	udiv	%l5,	0x16EF,	%g1
	subc	%o2,	0x0F7B,	%o6
	sth	%g3,	[%l7 + 0x42]
	alignaddrl	%o5,	%i3,	%i0
	movvs	%xcc,	%o7,	%l0
	edge32	%l6,	%g6,	%g2
	mova	%xcc,	%g7,	%i5
	fmovrsne	%i4,	%f2,	%f30
	srlx	%o3,	%i6,	%i7
	faligndata	%f18,	%f12,	%f30
	fcmpne32	%f16,	%f2,	%i2
	mova	%xcc,	%g4,	%l3
	edge16ln	%o4,	%i1,	%l1
	array32	%o0,	%o1,	%g5
	movneg	%icc,	%l4,	%l5
	fornot2	%f24,	%f8,	%f22
	edge16	%l2,	%o2,	%g1
	movrlez	%o6,	%o5,	%i3
	movne	%xcc,	%i0,	%g3
	addcc	%l0,	0x167B,	%o7
	sllx	%g6,	0x17,	%l6
	movpos	%icc,	%g7,	%i5
	smulcc	%g2,	%o3,	%i4
	udivcc	%i6,	0x0C82,	%i2
	ld	[%l7 + 0x30],	%f27
	fzero	%f0
	movpos	%xcc,	%g4,	%i7
	srax	%o4,	0x18,	%l3
	edge8ln	%l1,	%i1,	%o0
	addcc	%g5,	%o1,	%l5
	smulcc	%l4,	%o2,	%g1
	ldsb	[%l7 + 0x2D],	%o6
	movvs	%icc,	%l2,	%i3
	movneg	%icc,	%o5,	%g3
	sdivcc	%i0,	0x1709,	%o7
	array8	%l0,	%l6,	%g6
	array16	%g7,	%i5,	%o3
	ldub	[%l7 + 0x10],	%g2
	ldsb	[%l7 + 0x09],	%i4
	fmovdvc	%icc,	%f11,	%f25
	fand	%f24,	%f4,	%f16
	fmovrsgez	%i6,	%f28,	%f6
	movcs	%xcc,	%i2,	%i7
	ldub	[%l7 + 0x72],	%o4
	subcc	%g4,	0x0FC8,	%l3
	udiv	%i1,	0x0639,	%l1
	sethi	0x1FE4,	%o0
	sethi	0x1B7A,	%o1
	popc	0x0D01,	%g5
	movleu	%xcc,	%l4,	%o2
	ldsw	[%l7 + 0x38],	%l5
	sth	%o6,	[%l7 + 0x3E]
	udiv	%g1,	0x09F4,	%l2
	stx	%i3,	[%l7 + 0x78]
	ldsw	[%l7 + 0x1C],	%g3
	std	%f28,	[%l7 + 0x10]
	for	%f22,	%f26,	%f22
	sllx	%o5,	0x18,	%i0
	save %l0, 0x1678, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l6,	0x1EAD,	%g7
	smulcc	%i5,	%g6,	%g2
	addccc	%o3,	0x078B,	%i4
	fmovsa	%xcc,	%f26,	%f15
	array32	%i6,	%i7,	%i2
	movrgz	%g4,	0x2EC,	%l3
	xnorcc	%i1,	%o4,	%l1
	movne	%icc,	%o1,	%g5
	add	%l4,	0x1EDD,	%o2
	mulscc	%l5,	0x19B6,	%o6
	move	%xcc,	%g1,	%l2
	fpack16	%f6,	%f16
	movl	%xcc,	%i3,	%g3
	edge16ln	%o0,	%o5,	%i0
	movcs	%xcc,	%o7,	%l6
	edge16l	%l0,	%g7,	%g6
	popc	0x14CD,	%i5
	andn	%o3,	0x1E6E,	%g2
	movpos	%icc,	%i4,	%i6
	sll	%i2,	0x1C,	%g4
	fmovsn	%xcc,	%f4,	%f8
	ldd	[%l7 + 0x10],	%i6
	xnorcc	%i1,	%l3,	%o4
	restore %o1, %l1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l4,	0x178F,	%o2
	smul	%o6,	0x07B6,	%l5
	umulcc	%l2,	0x0E9A,	%g1
	mulscc	%i3,	%o0,	%g3
	fmovdleu	%xcc,	%f14,	%f10
	movneg	%xcc,	%o5,	%o7
	subccc	%l6,	0x1123,	%i0
	edge32l	%l0,	%g7,	%i5
	fmovsg	%icc,	%f0,	%f9
	edge8n	%o3,	%g2,	%i4
	fcmpne32	%f16,	%f2,	%g6
	fmovrsne	%i2,	%f12,	%f18
	movvs	%xcc,	%i6,	%i7
	movn	%xcc,	%g4,	%i1
	movcs	%xcc,	%l3,	%o1
	smulcc	%l1,	%g5,	%o4
	fmovdvs	%icc,	%f16,	%f31
	fnegs	%f10,	%f10
	fxor	%f10,	%f12,	%f22
	nop
	set	0x56, %l4
	ldsh	[%l7 + %l4],	%l4
	srlx	%o2,	%l5,	%o6
	andncc	%l2,	%i3,	%g1
	orcc	%o0,	0x163E,	%o5
	movge	%xcc,	%o7,	%l6
	sub	%i0,	%l0,	%g7
	fzero	%f26
	andcc	%i5,	0x0EA6,	%o3
	ldsb	[%l7 + 0x37],	%g3
	mova	%icc,	%g2,	%i4
	sir	0x0820
	movne	%xcc,	%i2,	%i6
	save %g6, 0x0B7D, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i7,	0x02,	%i1
	sllx	%l3,	0x19,	%l1
	movrgz	%g5,	0x28B,	%o4
	st	%f18,	[%l7 + 0x64]
	movgu	%icc,	%o1,	%l4
	sub	%o2,	0x0410,	%o6
	udivx	%l2,	0x0E76,	%l5
	movcc	%icc,	%g1,	%o0
	fmovdl	%xcc,	%f16,	%f27
	fmuld8sux16	%f30,	%f19,	%f30
	fsrc2s	%f10,	%f7
	movpos	%xcc,	%o5,	%o7
	srax	%i3,	0x01,	%i0
	fpadd32	%f22,	%f10,	%f30
	orn	%l0,	%g7,	%i5
	movpos	%icc,	%l6,	%g3
	ldub	[%l7 + 0x7D],	%g2
	popc	%i4,	%i2
	fnot1	%f30,	%f28
	movrlez	%o3,	0x26E,	%g6
	ldx	[%l7 + 0x50],	%g4
	addc	%i7,	%i1,	%l3
	alignaddr	%l1,	%g5,	%o4
	edge16ln	%i6,	%o1,	%o2
	mulx	%l4,	0x1302,	%o6
	ld	[%l7 + 0x6C],	%f14
	movl	%xcc,	%l2,	%g1
	edge32	%l5,	%o5,	%o0
	umul	%o7,	0x14BB,	%i0
	edge32	%i3,	%g7,	%l0
	subc	%l6,	%i5,	%g2
	movcc	%xcc,	%i4,	%i2
	movleu	%xcc,	%o3,	%g6
	ldx	[%l7 + 0x48],	%g3
	edge32ln	%i7,	%g4,	%i1
	edge16ln	%l3,	%l1,	%g5
	orcc	%o4,	0x03F1,	%i6
	faligndata	%f30,	%f26,	%f18
	xor	%o1,	0x1420,	%o2
	edge32n	%o6,	%l4,	%g1
	movcc	%icc,	%l2,	%l5
	sdivx	%o5,	0x04AB,	%o7
	popc	0x163C,	%o0
	stx	%i0,	[%l7 + 0x70]
	movrgez	%g7,	0x19E,	%l0
	for	%f28,	%f0,	%f2
	edge16	%l6,	%i3,	%g2
	add	%i4,	0x0BD0,	%i5
	fpack32	%f20,	%f30,	%f6
	fexpand	%f6,	%f16
	edge8	%o3,	%g6,	%g3
	fmovsgu	%xcc,	%f8,	%f11
	udiv	%i7,	0x07EA,	%i2
	sdivx	%i1,	0x07B9,	%l3
	fmovdgu	%icc,	%f16,	%f2
	fornot1	%f24,	%f6,	%f12
	fcmpeq32	%f30,	%f14,	%l1
	fandnot1	%f4,	%f20,	%f0
	movge	%icc,	%g5,	%g4
	sub	%i6,	%o1,	%o4
	edge32n	%o6,	%l4,	%g1
	movrlez	%l2,	0x2AD,	%o2
	fcmpgt16	%f18,	%f18,	%l5
	fcmple32	%f6,	%f26,	%o7
	edge32	%o0,	%o5,	%i0
	fnot1s	%f14,	%f20
	ld	[%l7 + 0x50],	%f9
	fmovdleu	%icc,	%f14,	%f0
	lduw	[%l7 + 0x78],	%l0
	addcc	%g7,	%i3,	%g2
	movn	%xcc,	%i4,	%i5
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	popc	0x096D,	%g6
	fnor	%f14,	%f22,	%f10
	udivx	%i7,	0x1AE8,	%i2
	andn	%i1,	%g3,	%l1
	fexpand	%f20,	%f20
	udivcc	%g5,	0x137A,	%g4
	andn	%l3,	0x0426,	%i6
	nop
	set	0x30, %l2
	ldd	[%l7 + %l2],	%f28
	add	%o1,	0x1BD5,	%o4
	fandnot2	%f20,	%f20,	%f6
	udivx	%l4,	0x0539,	%o6
	edge16l	%l2,	%g1,	%o2
	fnot1	%f10,	%f26
	srax	%l5,	0x19,	%o7
	save %o5, 0x1DB4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f10,	%f0
	ldub	[%l7 + 0x59],	%o0
	movneg	%xcc,	%l0,	%i3
	movg	%icc,	%g2,	%g7
	stx	%i5,	[%l7 + 0x10]
	or	%l6,	0x0C4A,	%o3
	movn	%icc,	%g6,	%i7
	movre	%i2,	%i1,	%i4
	smul	%g3,	0x1923,	%l1
	udivx	%g5,	0x05BF,	%l3
	fmul8sux16	%f12,	%f22,	%f28
	movvs	%xcc,	%i6,	%o1
	fmovrdne	%g4,	%f30,	%f10
	edge16	%l4,	%o6,	%o4
	movge	%xcc,	%g1,	%l2
	fnot2	%f14,	%f20
	stw	%l5,	[%l7 + 0x60]
	fmovdvc	%xcc,	%f29,	%f25
	movleu	%xcc,	%o2,	%o7
	edge32n	%o5,	%i0,	%l0
	std	%f0,	[%l7 + 0x10]
	fnot2	%f30,	%f20
	fsrc1	%f28,	%f14
	stw	%i3,	[%l7 + 0x58]
	ldub	[%l7 + 0x2D],	%g2
	fmovsvc	%icc,	%f30,	%f21
	alignaddr	%o0,	%g7,	%i5
	fmul8sux16	%f28,	%f18,	%f18
	movle	%xcc,	%o3,	%l6
	sir	0x0C5F
	movvc	%xcc,	%i7,	%i2
	edge16l	%g6,	%i1,	%i4
	fcmpgt32	%f10,	%f6,	%g3
	fcmpes	%fcc2,	%f23,	%f18
	edge32	%l1,	%l3,	%g5
	movrgez	%i6,	0x047,	%o1
	addccc	%g4,	0x1016,	%l4
	smul	%o6,	%g1,	%l2
	movrgez	%l5,	%o2,	%o7
	sllx	%o4,	0x17,	%o5
	edge8n	%i0,	%l0,	%i3
	addccc	%o0,	0x05B3,	%g2
	sir	0x161B
	popc	%i5,	%g7
	movrgz	%o3,	%l6,	%i7
	add	%i2,	0x00DD,	%g6
	sll	%i1,	%g3,	%i4
	edge16	%l1,	%g5,	%l3
	sll	%i6,	0x0D,	%o1
	fmovse	%icc,	%f13,	%f3
	movl	%xcc,	%l4,	%o6
	edge32ln	%g1,	%g4,	%l2
	sth	%o2,	[%l7 + 0x26]
	andncc	%o7,	%o4,	%o5
	movge	%icc,	%i0,	%l5
	sllx	%i3,	0x10,	%o0
	lduw	[%l7 + 0x44],	%g2
	sdiv	%l0,	0x089B,	%g7
	or	%i5,	%o3,	%l6
	xnor	%i2,	%g6,	%i1
	ldsb	[%l7 + 0x14],	%i7
	fmovdl	%icc,	%f15,	%f0
	std	%f10,	[%l7 + 0x18]
	movvc	%icc,	%i4,	%l1
	udivx	%g5,	0x1BC6,	%l3
	lduh	[%l7 + 0x58],	%g3
	fsrc1s	%f13,	%f7
	fmovse	%xcc,	%f18,	%f27
	movrgez	%i6,	0x139,	%o1
	fpadd16s	%f14,	%f13,	%f2
	ldd	[%l7 + 0x28],	%l4
	udivcc	%o6,	0x0042,	%g1
	fmovdg	%xcc,	%f21,	%f17
	fsrc2	%f28,	%f6
	fones	%f29
	smul	%g4,	%l2,	%o7
	movrlz	%o4,	%o2,	%o5
	stx	%l5,	[%l7 + 0x10]
	udivcc	%i0,	0x0465,	%i3
	orn	%o0,	0x08EA,	%g2
	sra	%g7,	0x19,	%l0
	ldsb	[%l7 + 0x43],	%i5
	for	%f10,	%f18,	%f12
	fmovrsne	%o3,	%f1,	%f19
	array8	%i2,	%g6,	%l6
	movcc	%xcc,	%i7,	%i1
	sdivx	%l1,	0x0888,	%i4
	sra	%g5,	%l3,	%i6
	fmovdcc	%icc,	%f18,	%f24
	std	%f4,	[%l7 + 0x78]
	fpadd16s	%f7,	%f25,	%f20
	fnegd	%f14,	%f20
	smul	%g3,	0x068C,	%l4
	xorcc	%o1,	0x102B,	%g1
	fpsub32	%f14,	%f2,	%f6
	and	%o6,	%g4,	%l2
	movne	%icc,	%o4,	%o2
	or	%o5,	0x03BD,	%l5
	movrlez	%o7,	0x01B,	%i0
	sth	%o0,	[%l7 + 0x48]
	movl	%icc,	%i3,	%g2
	ld	[%l7 + 0x38],	%f17
	array8	%l0,	%g7,	%o3
	fnands	%f3,	%f15,	%f8
	ldd	[%l7 + 0x60],	%f0
	andcc	%i2,	%i5,	%l6
	udivcc	%i7,	0x0D08,	%i1
	popc	%g6,	%i4
	edge16n	%l1,	%g5,	%i6
	edge8ln	%l3,	%l4,	%g3
	array32	%o1,	%g1,	%g4
	andncc	%o6,	%l2,	%o4
	srax	%o2,	0x14,	%o5
	sll	%o7,	0x0F,	%l5
	ldsw	[%l7 + 0x4C],	%i0
	fcmpd	%fcc1,	%f14,	%f2
	fands	%f7,	%f7,	%f5
	bshuffle	%f18,	%f16,	%f0
	movvc	%icc,	%i3,	%g2
	movl	%icc,	%o0,	%l0
	popc	0x1BE6,	%g7
	std	%f20,	[%l7 + 0x60]
	ldsw	[%l7 + 0x64],	%o3
	movcc	%xcc,	%i5,	%l6
	fone	%f6
	fpackfix	%f22,	%f8
	movrgez	%i7,	0x15C,	%i2
	edge32n	%g6,	%i1,	%l1
	edge16l	%i4,	%i6,	%l3
	st	%f21,	[%l7 + 0x78]
	addc	%g5,	0x1B5B,	%l4
	udivx	%g3,	0x0450,	%o1
	xnorcc	%g4,	%g1,	%o6
	addc	%l2,	%o2,	%o4
	mova	%xcc,	%o5,	%l5
	fandnot2s	%f3,	%f15,	%f18
	fandnot2	%f0,	%f18,	%f30
	fmovdcc	%icc,	%f24,	%f7
	alignaddr	%i0,	%i3,	%g2
	xnorcc	%o0,	%l0,	%o7
	movgu	%xcc,	%o3,	%g7
	movn	%icc,	%l6,	%i5
	fmovrde	%i2,	%f28,	%f2
	srl	%i7,	%g6,	%l1
	ldsw	[%l7 + 0x54],	%i4
	mulx	%i1,	0x1E6C,	%l3
	smulcc	%i6,	0x05ED,	%l4
	movn	%xcc,	%g5,	%g3
	edge16l	%g4,	%o1,	%o6
	fandnot1s	%f21,	%f12,	%f30
	srlx	%g1,	%o2,	%l2
	movcs	%icc,	%o4,	%o5
	fmovrdlez	%i0,	%f12,	%f26
	edge8	%i3,	%l5,	%g2
	srl	%l0,	0x01,	%o0
	srlx	%o7,	%g7,	%l6
	sra	%i5,	0x1A,	%i2
	bshuffle	%f12,	%f22,	%f16
	edge8ln	%i7,	%o3,	%g6
	movrlez	%i4,	%i1,	%l3
	edge8	%l1,	%l4,	%g5
	sllx	%g3,	%g4,	%i6
	movvc	%icc,	%o6,	%g1
	movpos	%xcc,	%o1,	%l2
	fmovsg	%icc,	%f29,	%f23
	movneg	%xcc,	%o2,	%o4
	fcmps	%fcc2,	%f31,	%f14
	orcc	%i0,	0x13E2,	%o5
	edge16l	%l5,	%i3,	%g2
	addccc	%o0,	0x198D,	%l0
	xnorcc	%g7,	%o7,	%i5
	edge8l	%i2,	%l6,	%o3
	movle	%xcc,	%i7,	%g6
	mulscc	%i4,	0x0FC2,	%l3
	ldd	[%l7 + 0x20],	%f10
	st	%f18,	[%l7 + 0x34]
	srlx	%l1,	%l4,	%i1
	movneg	%xcc,	%g5,	%g4
	ldsw	[%l7 + 0x30],	%g3
	umul	%i6,	0x17C8,	%g1
	subcc	%o1,	0x0A79,	%l2
	addcc	%o2,	%o6,	%i0
	ldub	[%l7 + 0x7D],	%o5
	ld	[%l7 + 0x38],	%f29
	udivx	%o4,	0x06FD,	%i3
	subcc	%g2,	%l5,	%l0
	movgu	%icc,	%o0,	%g7
	movneg	%icc,	%o7,	%i5
	mulscc	%l6,	0x0044,	%o3
	lduw	[%l7 + 0x14],	%i7
	edge32ln	%i2,	%i4,	%l3
	addc	%l1,	0x1E45,	%g6
	edge8ln	%i1,	%l4,	%g5
	alignaddrl	%g3,	%g4,	%i6
	edge32ln	%g1,	%l2,	%o2
	mova	%xcc,	%o1,	%i0
	fmovsvs	%icc,	%f18,	%f29
	sth	%o5,	[%l7 + 0x5A]
	edge32n	%o6,	%i3,	%g2
	movre	%o4,	0x1F3,	%l0
	ldx	[%l7 + 0x68],	%l5
	edge8n	%o0,	%o7,	%i5
	save %g7, 0x1145, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%i6
	andncc	%i2,	%i4,	%l3
	array8	%i7,	%l1,	%i1
	srax	%g6,	%g5,	%g3
	mulx	%g4,	%l4,	%i6
	fmovsneg	%icc,	%f21,	%f21
	fmovrsgez	%l2,	%f24,	%f25
	movg	%xcc,	%o2,	%g1
	srl	%i0,	%o1,	%o5
	or	%o6,	0x080D,	%i3
	umul	%g2,	%l0,	%l5
	movrgez	%o4,	%o7,	%i5
	movne	%xcc,	%g7,	%o3
	edge32	%o0,	%i2,	%l6
	edge32n	%i4,	%l3,	%i7
	fmovdge	%xcc,	%f14,	%f4
	xor	%i1,	0x0F63,	%g6
	sll	%g5,	%g3,	%l1
	subccc	%l4,	%g4,	%l2
	alignaddrl	%i6,	%o2,	%g1
	orncc	%o1,	%o5,	%i0
	mulscc	%o6,	0x1EDA,	%i3
	movrgez	%g2,	%l5,	%o4
	edge16l	%l0,	%i5,	%g7
	edge32	%o7,	%o3,	%i2
	sub	%o0,	%i4,	%l6
	nop
	set	0x64, %i7
	lduh	[%l7 + %i7],	%i7
	fnand	%f18,	%f12,	%f14
	movcs	%xcc,	%i1,	%l3
	edge16n	%g6,	%g3,	%l1
	edge16l	%g5,	%g4,	%l2
	stx	%i6,	[%l7 + 0x38]
	umulcc	%o2,	0x1E1B,	%g1
	smul	%o1,	%l4,	%o5
	movgu	%xcc,	%i0,	%i3
	alignaddr	%g2,	%o6,	%l5
	restore %o4, 0x0BD5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1FF0,	%g7
	orn	%o7,	%l0,	%o3
	subc	%i2,	%i4,	%l6
	orncc	%o0,	%i7,	%i1
	fmul8x16	%f25,	%f18,	%f26
	xnorcc	%g6,	%g3,	%l1
	movneg	%xcc,	%g5,	%g4
	sub	%l2,	%l3,	%o2
	edge8n	%g1,	%i6,	%o1
	fmovsle	%icc,	%f4,	%f29
	edge32	%o5,	%i0,	%i3
	ldsh	[%l7 + 0x46],	%g2
	fpackfix	%f12,	%f29
	umulcc	%l4,	%l5,	%o6
	ldd	[%l7 + 0x38],	%f30
	fxors	%f19,	%f2,	%f8
	umulcc	%i5,	%g7,	%o4
	ldsb	[%l7 + 0x72],	%l0
	fandnot2s	%f14,	%f15,	%f30
	or	%o7,	%i2,	%o3
	andncc	%i4,	%o0,	%l6
	orcc	%i1,	0x11A6,	%i7
	stb	%g6,	[%l7 + 0x43]
	ld	[%l7 + 0x64],	%f22
	edge8ln	%g3,	%g5,	%l1
	fmul8x16au	%f18,	%f13,	%f12
	sra	%g4,	0x17,	%l2
	xnorcc	%o2,	0x0438,	%l3
	lduw	[%l7 + 0x2C],	%i6
	array32	%o1,	%o5,	%g1
	ldd	[%l7 + 0x10],	%f2
	orncc	%i0,	0x1A74,	%g2
	popc	%l4,	%i3
	edge32	%l5,	%i5,	%g7
	movvc	%icc,	%o4,	%l0
	movpos	%xcc,	%o6,	%i2
	sir	0x0594
	save %o7, 0x0A66, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f27,	%f30
	movge	%xcc,	%o3,	%l6
	movcs	%xcc,	%i1,	%i7
	movrgz	%o0,	%g6,	%g5
	fnegd	%f0,	%f10
	umul	%g3,	0x1CE3,	%l1
	fmovdvc	%icc,	%f5,	%f27
	fmovsge	%xcc,	%f28,	%f19
	fnands	%f7,	%f3,	%f10
	fandnot2	%f16,	%f30,	%f20
	popc	%l2,	%g4
	st	%f31,	[%l7 + 0x40]
	subc	%o2,	0x0FA9,	%l3
	and	%o1,	0x0933,	%i6
	fands	%f22,	%f9,	%f5
	mova	%xcc,	%g1,	%i0
	udivcc	%o5,	0x1ADE,	%g2
	ldsb	[%l7 + 0x61],	%l4
	fmovdpos	%xcc,	%f1,	%f14
	sub	%i3,	0x1471,	%l5
	xorcc	%i5,	0x0EC4,	%g7
	movre	%l0,	0x3B5,	%o4
	movleu	%xcc,	%o6,	%o7
	sir	0x0110
	addc	%i4,	0x01AE,	%o3
	sll	%l6,	%i1,	%i2
	andcc	%o0,	%g6,	%i7
	fnands	%f21,	%f22,	%f7
	array16	%g3,	%l1,	%l2
	edge16ln	%g4,	%o2,	%g5
	subccc	%o1,	%l3,	%i6
	fmovspos	%xcc,	%f12,	%f26
	edge16n	%i0,	%g1,	%o5
	edge16n	%g2,	%i3,	%l4
	fmovscc	%xcc,	%f26,	%f9
	fmovdvs	%icc,	%f4,	%f3
	srl	%l5,	%i5,	%g7
	fmovsneg	%xcc,	%f10,	%f9
	stx	%l0,	[%l7 + 0x20]
	addc	%o4,	%o7,	%o6
	movneg	%xcc,	%i4,	%l6
	movne	%xcc,	%o3,	%i2
	udivcc	%o0,	0x0D46,	%i1
	ldub	[%l7 + 0x48],	%i7
	fone	%f10
	ldsb	[%l7 + 0x23],	%g3
	movge	%icc,	%l1,	%g6
	sdivx	%l2,	0x068C,	%o2
	addc	%g5,	%o1,	%l3
	fabss	%f22,	%f1
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%i6
	fzeros	%f13
	orn	%g4,	0x012B,	%i0
	lduh	[%l7 + 0x10],	%g1
	fmovs	%f28,	%f25
	movvs	%icc,	%o5,	%i3
	array16	%l4,	%g2,	%l5
	stb	%i5,	[%l7 + 0x51]
	fpadd16	%f30,	%f4,	%f16
	fors	%f17,	%f4,	%f25
	movvc	%xcc,	%g7,	%l0
	pdist	%f30,	%f26,	%f16
	movpos	%xcc,	%o4,	%o7
	sdiv	%o6,	0x17EE,	%i4
	fmovrdne	%o3,	%f18,	%f24
	add	%i2,	%l6,	%o0
	ldd	[%l7 + 0x40],	%i0
	movrlez	%g3,	0x3C8,	%i7
	fnot2s	%f1,	%f8
	fcmpeq32	%f2,	%f20,	%g6
	addcc	%l2,	0x0768,	%o2
	and	%l1,	0x0D6B,	%o1
	nop
	set	0x72, %o0
	ldsh	[%l7 + %o0],	%g5
	orncc	%l3,	%g4,	%i6
	ldd	[%l7 + 0x20],	%f8
	umulcc	%i0,	0x0ABF,	%o5
	andncc	%g1,	%l4,	%i3
	sir	0x17A2
	fmul8x16	%f10,	%f30,	%f20
	orn	%l5,	%i5,	%g7
	movle	%icc,	%l0,	%g2
	sir	0x09BC
	save %o7, %o4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o3,	%i2,	%o6
	srlx	%l6,	%o0,	%i1
	fmovsne	%xcc,	%f13,	%f17
	sra	%i7,	0x17,	%g6
	fnot2	%f24,	%f28
	xorcc	%g3,	%l2,	%o2
	movcs	%icc,	%o1,	%l1
	array16	%l3,	%g5,	%i6
	fcmpgt32	%f30,	%f12,	%i0
	movpos	%icc,	%o5,	%g1
	add	%l4,	%i3,	%l5
	movrlez	%i5,	%g7,	%g4
	fnegs	%f10,	%f30
	movcc	%icc,	%l0,	%g2
	edge8	%o7,	%o4,	%o3
	fcmple32	%f22,	%f6,	%i2
	ld	[%l7 + 0x2C],	%f14
	edge8l	%i4,	%o6,	%l6
	alignaddr	%o0,	%i1,	%g6
	sethi	0x1CB6,	%g3
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	movne	%icc,	%l2,	%l3
	fsrc2	%f26,	%f22
	st	%f29,	[%l7 + 0x10]
	movge	%icc,	%g5,	%l1
	movrlez	%i0,	0x297,	%i6
	and	%o5,	%g1,	%i3
	fxnors	%f25,	%f6,	%f4
	sethi	0x1236,	%l5
	sdivx	%i5,	0x00A2,	%g7
	fone	%f8
	fpadd16s	%f3,	%f25,	%f23
	fones	%f20
	fpackfix	%f8,	%f27
	fmovscs	%icc,	%f8,	%f2
	sth	%g4,	[%l7 + 0x20]
	xnor	%l0,	0x0A1E,	%l4
	movn	%icc,	%o7,	%g2
	movrne	%o3,	%o4,	%i4
	sethi	0x0798,	%i2
	fcmpne16	%f18,	%f16,	%o6
	mova	%xcc,	%l6,	%i1
	xorcc	%o0,	0x0EA3,	%g6
	movpos	%xcc,	%g3,	%i7
	array32	%o1,	%l2,	%o2
	edge16l	%l3,	%l1,	%g5
	alignaddr	%i0,	%i6,	%o5
	fmovdleu	%xcc,	%f9,	%f6
	edge8n	%i3,	%l5,	%g1
	or	%i5,	0x0729,	%g4
	fmovdl	%icc,	%f16,	%f29
	ldd	[%l7 + 0x38],	%g6
	movcc	%icc,	%l0,	%l4
	sdiv	%o7,	0x043E,	%o3
	ldub	[%l7 + 0x51],	%o4
	fors	%f17,	%f18,	%f13
	xorcc	%g2,	0x1C77,	%i4
	movpos	%icc,	%i2,	%l6
	orn	%o6,	%o0,	%g6
	ldsh	[%l7 + 0x62],	%g3
	sdiv	%i7,	0x0436,	%i1
	andcc	%o1,	0x19E9,	%o2
	edge8n	%l2,	%l3,	%l1
	fxnors	%f15,	%f19,	%f7
	edge8ln	%i0,	%i6,	%o5
	lduh	[%l7 + 0x18],	%g5
	ldsw	[%l7 + 0x0C],	%l5
	movrgez	%i3,	0x24E,	%g1
	fnot1	%f26,	%f28
	fmovdcs	%icc,	%f22,	%f20
	movrgez	%i5,	0x1EE,	%g7
	fcmps	%fcc3,	%f27,	%f9
	fcmpes	%fcc3,	%f8,	%f24
	smul	%g4,	%l4,	%l0
	nop
	set	0x10, %i5
	std	%f24,	[%l7 + %i5]
	orncc	%o3,	%o7,	%o4
	sth	%g2,	[%l7 + 0x6E]
	movre	%i2,	0x2EF,	%l6
	and	%i4,	%o6,	%o0
	fpack32	%f14,	%f2,	%f22
	srl	%g6,	%i7,	%i1
	sdiv	%g3,	0x1F6D,	%o1
	sra	%l2,	%o2,	%l3
	addcc	%l1,	0x1404,	%i0
	addccc	%o5,	%i6,	%l5
	sra	%g5,	0x07,	%g1
	ldsw	[%l7 + 0x68],	%i3
	ldx	[%l7 + 0x48],	%g7
	movgu	%xcc,	%g4,	%l4
	edge8	%l0,	%i5,	%o3
	umul	%o4,	%o7,	%i2
	addccc	%g2,	%l6,	%i4
	xorcc	%o0,	0x16B2,	%o6
	alignaddrl	%i7,	%g6,	%g3
	smulcc	%o1,	0x034D,	%i1
	sra	%o2,	0x12,	%l2
	edge8ln	%l1,	%i0,	%o5
	fcmple16	%f20,	%f6,	%l3
	ldub	[%l7 + 0x5C],	%i6
	sllx	%l5,	0x13,	%g5
	movle	%xcc,	%g1,	%i3
	edge16n	%g4,	%l4,	%g7
	fabsd	%f4,	%f28
	movrlez	%l0,	0x0DE,	%o3
	popc	0x1183,	%o4
	andcc	%i5,	%o7,	%g2
	save %l6, 0x1603, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x64],	%i4
	movne	%icc,	%o0,	%o6
	movneg	%xcc,	%g6,	%i7
	movgu	%icc,	%o1,	%i1
	array8	%g3,	%o2,	%l1
	fmovrslez	%i0,	%f27,	%f11
	ldub	[%l7 + 0x6B],	%o5
	nop
	set	0x50, %l0
	lduw	[%l7 + %l0],	%l2
	xorcc	%i6,	0x0079,	%l3
	fnot1	%f26,	%f8
	faligndata	%f28,	%f24,	%f16
	nop
	set	0x40, %l3
	sth	%g5,	[%l7 + %l3]
	umul	%g1,	%i3,	%l5
	edge8n	%g4,	%l4,	%l0
	movre	%g7,	%o3,	%i5
	smulcc	%o4,	%o7,	%g2
	sra	%i2,	0x0D,	%i4
	fmovrsgz	%o0,	%f8,	%f20
	smul	%o6,	0x109A,	%l6
	stx	%i7,	[%l7 + 0x68]
	nop
	set	0x2C, %o4
	lduh	[%l7 + %o4],	%o1
	andncc	%i1,	%g3,	%g6
	nop
	set	0x74, %l5
	lduh	[%l7 + %l5],	%l1
	movne	%xcc,	%i0,	%o5
	movcs	%icc,	%l2,	%o2
	xnor	%l3,	0x1D17,	%g5
	fmul8ulx16	%f4,	%f14,	%f10
	ldd	[%l7 + 0x10],	%f12
	sethi	0x0DFB,	%i6
	srax	%g1,	%l5,	%g4
	fpsub32	%f4,	%f22,	%f12
	fmovdneg	%xcc,	%f13,	%f24
	udivx	%l4,	0x14FF,	%l0
	move	%icc,	%g7,	%i3
	movl	%xcc,	%i5,	%o3
	fpack32	%f10,	%f20,	%f24
	movrlez	%o4,	%g2,	%i2
	fcmped	%fcc3,	%f18,	%f22
	movgu	%icc,	%o7,	%i4
	subcc	%o0,	0x13B9,	%l6
	fpack32	%f24,	%f14,	%f4
	fsrc2s	%f6,	%f30
	mulx	%o6,	0x0614,	%o1
	alignaddrl	%i1,	%i7,	%g3
	array32	%l1,	%i0,	%g6
	edge16	%l2,	%o2,	%o5
	sllx	%l3,	%g5,	%g1
	add	%l5,	0x003E,	%g4
	fands	%f1,	%f27,	%f7
	sethi	0x1EAF,	%l4
	orcc	%l0,	0x1037,	%g7
	fmovsvc	%xcc,	%f29,	%f7
	fmovsge	%xcc,	%f16,	%f1
	orncc	%i6,	%i5,	%i3
	alignaddr	%o4,	%o3,	%g2
	srax	%i2,	0x0F,	%i4
	edge32ln	%o0,	%l6,	%o7
	sra	%o6,	%o1,	%i7
	orcc	%i1,	%g3,	%l1
	fcmpd	%fcc0,	%f4,	%f12
	movneg	%icc,	%g6,	%l2
	andn	%o2,	%o5,	%i0
	alignaddrl	%l3,	%g1,	%l5
	movne	%icc,	%g4,	%l4
	edge16n	%l0,	%g7,	%i6
	movge	%xcc,	%g5,	%i5
	andn	%i3,	0x0DE6,	%o4
	stb	%g2,	[%l7 + 0x4D]
	movpos	%xcc,	%o3,	%i2
	edge32n	%i4,	%o0,	%o7
	bshuffle	%f14,	%f24,	%f2
	fandnot1	%f2,	%f22,	%f24
	stw	%o6,	[%l7 + 0x28]
	sra	%o1,	%i7,	%l6
	fmovrslez	%g3,	%f14,	%f29
	fnands	%f12,	%f10,	%f8
	umulcc	%l1,	0x1957,	%g6
	movne	%icc,	%i1,	%l2
	edge16l	%o5,	%i0,	%o2
	fmovsg	%icc,	%f19,	%f30
	udivx	%l3,	0x16CA,	%l5
	mulscc	%g4,	%g1,	%l0
	subccc	%l4,	0x009A,	%g7
	restore %i6, 0x0170, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i5,	%o4,	%g2
	edge32	%o3,	%i3,	%i2
	movneg	%xcc,	%o0,	%o7
	edge8l	%i4,	%o6,	%o1
	faligndata	%f4,	%f22,	%f0
	xnor	%l6,	%g3,	%l1
	udiv	%i7,	0x12A5,	%g6
	fmovrsgz	%i1,	%f30,	%f11
	fcmps	%fcc3,	%f31,	%f26
	fpadd16	%f12,	%f20,	%f14
	sdivx	%o5,	0x1F27,	%i0
	alignaddr	%l2,	%l3,	%o2
	srlx	%g4,	%l5,	%l0
	fandnot1s	%f12,	%f3,	%f14
	movre	%g1,	0x2F4,	%l4
	movl	%icc,	%i6,	%g5
	udiv	%i5,	0x0BA6,	%o4
	movle	%xcc,	%g7,	%o3
	fmovrslz	%g2,	%f12,	%f30
	subc	%i3,	0x105C,	%i2
	fmovdle	%icc,	%f5,	%f18
	fcmpne16	%f16,	%f28,	%o7
	lduh	[%l7 + 0x54],	%o0
	umulcc	%i4,	0x063A,	%o6
	xorcc	%o1,	%l6,	%l1
	array32	%i7,	%g6,	%i1
	stw	%o5,	[%l7 + 0x40]
	sub	%i0,	0x12A3,	%g3
	orcc	%l3,	%l2,	%g4
	andn	%l5,	%l0,	%g1
	fmovse	%icc,	%f12,	%f24
	array32	%o2,	%i6,	%g5
	movvs	%icc,	%i5,	%l4
	bshuffle	%f2,	%f26,	%f2
	orn	%g7,	%o4,	%o3
	edge32ln	%g2,	%i2,	%i3
	std	%f8,	[%l7 + 0x28]
	smulcc	%o7,	0x0C40,	%o0
	stw	%o6,	[%l7 + 0x40]
	ldsh	[%l7 + 0x2E],	%o1
	smul	%l6,	0x117A,	%l1
	fpsub16s	%f8,	%f7,	%f8
	srl	%i4,	0x13,	%g6
	andncc	%i1,	%o5,	%i7
	edge16ln	%g3,	%l3,	%l2
	edge8n	%i0,	%l5,	%g4
	movle	%xcc,	%g1,	%o2
	fsrc2	%f22,	%f8
	alignaddr	%i6,	%g5,	%l0
	subc	%i5,	0x1F6A,	%g7
	array16	%o4,	%l4,	%g2
	movre	%i2,	0x3BE,	%i3
	fmovrde	%o3,	%f30,	%f30
	movpos	%icc,	%o7,	%o0
	orncc	%o1,	%l6,	%l1
	movle	%xcc,	%i4,	%o6
	alignaddr	%i1,	%g6,	%o5
	srl	%i7,	%g3,	%l2
	fone	%f8
	fandnot1	%f4,	%f28,	%f20
	udivx	%i0,	0x159B,	%l5
	add	%g4,	0x136E,	%g1
	array16	%o2,	%i6,	%l3
	edge8l	%g5,	%i5,	%l0
	movrne	%g7,	0x158,	%o4
	fmovsa	%icc,	%f7,	%f26
	movge	%icc,	%l4,	%i2
	subcc	%i3,	%o3,	%o7
	fors	%f6,	%f10,	%f8
	fmovdle	%xcc,	%f2,	%f21
	udivx	%o0,	0x0C0E,	%g2
	fpack16	%f18,	%f0
	fand	%f12,	%f6,	%f30
	lduw	[%l7 + 0x18],	%l6
	fornot1	%f6,	%f30,	%f28
	subccc	%l1,	0x1752,	%i4
	fmovsa	%icc,	%f20,	%f17
	alignaddrl	%o1,	%i1,	%o6
	orn	%g6,	%i7,	%o5
	smulcc	%l2,	%i0,	%l5
	movcc	%icc,	%g3,	%g4
	save %o2, %g1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g5,	0x05DD,	%i5
	subc	%i6,	%g7,	%l0
	ldsw	[%l7 + 0x24],	%l4
	stb	%i2,	[%l7 + 0x11]
	ldx	[%l7 + 0x08],	%i3
	movrne	%o3,	0x0FA,	%o7
	andncc	%o4,	%g2,	%l6
	movle	%icc,	%l1,	%o0
	orn	%o1,	0x11CD,	%i4
	movrlz	%i1,	%o6,	%g6
	edge32l	%o5,	%i7,	%i0
	array32	%l5,	%g3,	%g4
	sth	%l2,	[%l7 + 0x0C]
	fmovdcs	%xcc,	%f26,	%f0
	edge16ln	%o2,	%l3,	%g1
	xor	%g5,	%i6,	%i5
	fmovsvs	%xcc,	%f16,	%f16
	addccc	%l0,	%l4,	%i2
	movge	%xcc,	%i3,	%g7
	or	%o3,	%o7,	%o4
	stx	%l6,	[%l7 + 0x60]
	sir	0x043F
	subccc	%l1,	0x05E2,	%o0
	stw	%o1,	[%l7 + 0x20]
	movge	%icc,	%g2,	%i4
	sll	%i1,	%g6,	%o6
	edge32n	%o5,	%i7,	%i0
	udivx	%l5,	0x0B30,	%g3
	fxnor	%f6,	%f8,	%f14
	srax	%l2,	0x14,	%o2
	xnor	%l3,	0x1B3D,	%g4
	fpadd16s	%f25,	%f7,	%f27
	xor	%g5,	0x04B2,	%g1
	ldub	[%l7 + 0x64],	%i5
	mova	%xcc,	%l0,	%i6
	edge16ln	%i2,	%i3,	%l4
	ldsw	[%l7 + 0x48],	%o3
	std	%f16,	[%l7 + 0x48]
	movcs	%xcc,	%g7,	%o7
	mulscc	%l6,	0x0026,	%o4
	edge32ln	%o0,	%l1,	%o1
	edge16l	%g2,	%i4,	%g6
	nop
	set	0x4B, %g6
	ldsb	[%l7 + %g6],	%i1
	edge32n	%o6,	%o5,	%i0
	or	%l5,	%i7,	%l2
	and	%o2,	%g3,	%l3
	subcc	%g4,	0x0B8B,	%g5
	edge8	%i5,	%l0,	%i6
	subccc	%g1,	%i3,	%l4
	udivx	%i2,	0x0352,	%o3
	fpsub16s	%f5,	%f15,	%f24
	fandnot2s	%f27,	%f1,	%f19
	movn	%icc,	%o7,	%g7
	ld	[%l7 + 0x74],	%f6
	nop
	set	0x1A, %g1
	stb	%o4,	[%l7 + %g1]
	stb	%l6,	[%l7 + 0x6C]
	movle	%icc,	%o0,	%o1
	srax	%l1,	0x0C,	%g2
	fandnot1	%f10,	%f22,	%f2
	fcmped	%fcc3,	%f24,	%f30
	edge16n	%i4,	%g6,	%i1
	alignaddrl	%o5,	%i0,	%o6
	edge16n	%i7,	%l2,	%o2
	ldsw	[%l7 + 0x44],	%l5
	fmovsvs	%icc,	%f19,	%f15
	udiv	%g3,	0x149D,	%g4
	sdivx	%g5,	0x0191,	%i5
	ldsw	[%l7 + 0x18],	%l3
	stb	%i6,	[%l7 + 0x35]
	nop
	set	0x28, %o2
	ldsw	[%l7 + %o2],	%l0
	fmovdne	%icc,	%f2,	%f9
	movre	%i3,	0x3A1,	%l4
	xnor	%g1,	0x172C,	%o3
	udiv	%i2,	0x1849,	%g7
	movre	%o4,	0x3FB,	%l6
	fcmpeq32	%f30,	%f28,	%o0
	mulx	%o1,	%o7,	%g2
	addcc	%i4,	0x02B7,	%g6
	udiv	%l1,	0x0B86,	%o5
	st	%f13,	[%l7 + 0x24]
	fmovdg	%icc,	%f2,	%f5
	sdivcc	%i0,	0x06B7,	%i1
	movneg	%icc,	%o6,	%l2
	fmovdle	%xcc,	%f21,	%f30
	umulcc	%o2,	%l5,	%g3
	subcc	%g4,	%i7,	%i5
	movl	%icc,	%g5,	%l3
	edge8ln	%i6,	%i3,	%l0
	edge8ln	%g1,	%o3,	%l4
	fabsd	%f8,	%f24
	fmovsne	%icc,	%f31,	%f23
	movg	%xcc,	%g7,	%o4
	fpadd16	%f24,	%f26,	%f16
	udivcc	%i2,	0x07F9,	%o0
	movneg	%icc,	%l6,	%o1
	fmovrsgez	%o7,	%f11,	%f6
	nop
	set	0x28, %g7
	ldsw	[%l7 + %g7],	%g2
	fpsub16	%f12,	%f22,	%f0
	fcmps	%fcc3,	%f13,	%f16
	movrgez	%i4,	0x1B4,	%g6
	st	%f28,	[%l7 + 0x7C]
	movgu	%xcc,	%o5,	%i0
	edge16n	%l1,	%o6,	%l2
	edge16ln	%o2,	%i1,	%l5
	andcc	%g3,	%i7,	%i5
	orncc	%g4,	%l3,	%i6
	movle	%icc,	%i3,	%l0
	udiv	%g1,	0x1D79,	%g5
	umulcc	%o3,	%g7,	%l4
	edge16ln	%i2,	%o0,	%l6
	sub	%o1,	%o7,	%o4
	ldsw	[%l7 + 0x50],	%g2
	fpackfix	%f2,	%f25
	fxor	%f10,	%f24,	%f10
	add	%g6,	0x1810,	%i4
	ld	[%l7 + 0x3C],	%f30
	fmovrde	%i0,	%f6,	%f2
	nop
	set	0x18, %g5
	std	%f2,	[%l7 + %g5]
	andn	%o5,	%l1,	%o6
	movcs	%icc,	%o2,	%i1
	edge16	%l5,	%l2,	%i7
	fabsd	%f6,	%f14
	fpack32	%f2,	%f30,	%f12
	fmovrdlez	%i5,	%f10,	%f22
	std	%f14,	[%l7 + 0x18]
	and	%g4,	0x0945,	%g3
	orncc	%l3,	0x1366,	%i6
	edge16l	%l0,	%g1,	%g5
	fpackfix	%f8,	%f31
	xnorcc	%o3,	%i3,	%l4
	udivx	%g7,	0x1656,	%o0
	udivcc	%l6,	0x16BD,	%o1
	addccc	%i2,	0x033C,	%o4
	addc	%o7,	0x1F38,	%g2
	orcc	%i4,	0x1EAC,	%g6
	sdivx	%o5,	0x17C7,	%i0
	sdivx	%o6,	0x17F3,	%l1
	stx	%o2,	[%l7 + 0x30]
	array32	%i1,	%l2,	%i7
	srlx	%l5,	0x18,	%i5
	srax	%g4,	%l3,	%i6
	sra	%g3,	%l0,	%g1
	edge16ln	%g5,	%i3,	%l4
	fmovdg	%xcc,	%f6,	%f0
	fmul8x16	%f11,	%f2,	%f12
	edge16n	%o3,	%g7,	%o0
	alignaddr	%o1,	%l6,	%o4
	xnorcc	%o7,	%i2,	%i4
	edge8	%g6,	%o5,	%i0
	fcmple32	%f24,	%f0,	%g2
	stw	%o6,	[%l7 + 0x54]
	sub	%l1,	0x1000,	%o2
	edge8l	%i1,	%l2,	%l5
	movcs	%xcc,	%i7,	%i5
	fmul8sux16	%f6,	%f20,	%f0
	sllx	%g4,	0x0D,	%l3
	movrlez	%i6,	0x190,	%l0
	fmovsn	%icc,	%f6,	%f13
	movrlz	%g1,	0x1CB,	%g3
	mulx	%i3,	%l4,	%g5
	sdiv	%o3,	0x1D63,	%o0
	ldd	[%l7 + 0x68],	%o0
	fmovrdlez	%l6,	%f2,	%f18
	fmovsvc	%icc,	%f27,	%f16
	ldsw	[%l7 + 0x14],	%g7
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fxnor	%f22,	%f10,	%f0
	stw	%o7,	[%l7 + 0x1C]
	array16	%g6,	%i4,	%i0
	stb	%o5,	[%l7 + 0x3B]
	sth	%g2,	[%l7 + 0x72]
	sth	%l1,	[%l7 + 0x44]
	movpos	%xcc,	%o6,	%o2
	movl	%xcc,	%i1,	%l2
	edge8ln	%i7,	%i5,	%l5
	edge32n	%g4,	%l3,	%l0
	edge32	%i6,	%g1,	%i3
	sir	0x1C21
	stb	%l4,	[%l7 + 0x6A]
	orncc	%g3,	0x1DEF,	%g5
	faligndata	%f26,	%f10,	%f28
	sdivcc	%o3,	0x0AA6,	%o1
	fmovda	%icc,	%f29,	%f25
	ld	[%l7 + 0x1C],	%f26
	movgu	%xcc,	%l6,	%o0
	bshuffle	%f14,	%f4,	%f18
	fmul8x16au	%f4,	%f10,	%f30
	fmovsvs	%xcc,	%f2,	%f16
	restore %o4, 0x1952, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o7,	0x30D,	%i2
	fmovdgu	%xcc,	%f29,	%f4
	fcmpes	%fcc1,	%f20,	%f3
	sth	%g6,	[%l7 + 0x4C]
	movne	%xcc,	%i0,	%o5
	srlx	%i4,	%l1,	%o6
	udivx	%o2,	0x1C42,	%g2
	ldd	[%l7 + 0x78],	%f4
	movleu	%xcc,	%l2,	%i7
	movle	%xcc,	%i1,	%i5
	std	%f10,	[%l7 + 0x78]
	movrne	%l5,	0x221,	%l3
	fnot2s	%f22,	%f31
	save %g4, 0x0294, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g1,	%i6
	mulx	%i3,	0x1BAF,	%l4
	smulcc	%g3,	0x10E7,	%g5
	udivcc	%o3,	0x043B,	%o1
	fmovrsne	%l6,	%f11,	%f20
	movrlez	%o0,	%o4,	%g7
	fpadd16	%f30,	%f16,	%f10
	stb	%i2,	[%l7 + 0x44]
	save %g6, %o7, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i4,	%l1
	edge8l	%o6,	%o2,	%g2
	udivx	%o5,	0x1F02,	%l2
	ldub	[%l7 + 0x40],	%i1
	mulx	%i7,	0x07FE,	%l5
	xnor	%l3,	%g4,	%l0
	lduw	[%l7 + 0x2C],	%i5
	movre	%g1,	0x2A5,	%i6
	and	%i3,	0x1F6F,	%g3
	stw	%l4,	[%l7 + 0x50]
	or	%o3,	0x0AEE,	%g5
	fmovdcc	%icc,	%f1,	%f8
	movl	%icc,	%l6,	%o1
	edge32n	%o4,	%g7,	%o0
	fnegs	%f29,	%f30
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	std	%f18,	[%l7 + 0x30]
	array32	%o7,	%i4,	%i0
	fmovscs	%icc,	%f1,	%f21
	fmul8x16al	%f30,	%f29,	%f28
	alignaddr	%o6,	%o2,	%g2
	movrgz	%o5,	%l2,	%i1
	stb	%l1,	[%l7 + 0x62]
	mulscc	%i7,	%l5,	%g4
	ldsw	[%l7 + 0x64],	%l0
	lduh	[%l7 + 0x52],	%l3
	fands	%f18,	%f11,	%f5
	orn	%g1,	%i5,	%i6
	fexpand	%f20,	%f26
	sir	0x02DD
	mulscc	%g3,	%i3,	%o3
	fcmps	%fcc0,	%f28,	%f12
	fmul8sux16	%f18,	%f14,	%f28
	orn	%g5,	%l6,	%o1
	udivx	%o4,	0x078B,	%l4
	udivcc	%g7,	0x1C27,	%i2
	xorcc	%g6,	0x0700,	%o0
	stw	%i4,	[%l7 + 0x48]
	andcc	%i0,	0x1189,	%o6
	xor	%o2,	%o7,	%o5
	andn	%g2,	%l2,	%i1
	sllx	%l1,	%i7,	%l5
	fnegd	%f24,	%f8
	fcmpeq16	%f16,	%f16,	%g4
	movrlz	%l3,	0x082,	%g1
	sth	%i5,	[%l7 + 0x4A]
	fcmpeq32	%f8,	%f22,	%i6
	smulcc	%g3,	0x1BB8,	%i3
	fmovdneg	%xcc,	%f14,	%f20
	ld	[%l7 + 0x70],	%f19
	movre	%l0,	0x389,	%o3
	movrlez	%l6,	%g5,	%o4
	save %o1, 0x199B, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i2,	%g7,	%g6
	sdivx	%o0,	0x16E5,	%i4
	edge32	%o6,	%i0,	%o2
	ldub	[%l7 + 0x1C],	%o7
	andcc	%o5,	%g2,	%i1
	fmovrde	%l2,	%f16,	%f4
	movrlez	%i7,	0x003,	%l1
	fandnot1	%f20,	%f2,	%f20
	fpsub32s	%f16,	%f26,	%f26
	movpos	%icc,	%g4,	%l3
	movle	%icc,	%g1,	%i5
	fcmpgt16	%f14,	%f26,	%l5
	udivcc	%i6,	0x0F74,	%g3
	udiv	%i3,	0x048E,	%o3
	sth	%l0,	[%l7 + 0x0E]
	srax	%g5,	0x10,	%o4
	array8	%l6,	%o1,	%l4
	edge32n	%g7,	%g6,	%i2
	addcc	%i4,	%o0,	%i0
	xnorcc	%o2,	0x0B0F,	%o7
	sdivcc	%o6,	0x19F3,	%g2
	movne	%icc,	%o5,	%l2
	edge16l	%i1,	%l1,	%i7
	lduh	[%l7 + 0x0A],	%g4
	addc	%l3,	%i5,	%l5
	smulcc	%i6,	%g3,	%g1
	orn	%i3,	%l0,	%o3
	fmovrde	%o4,	%f0,	%f22
	fmovsn	%icc,	%f20,	%f4
	ld	[%l7 + 0x08],	%f24
	movcc	%icc,	%l6,	%g5
	fnot2	%f0,	%f24
	xorcc	%o1,	%l4,	%g7
	srlx	%g6,	%i4,	%o0
	fmovdvs	%icc,	%f2,	%f8
	or	%i2,	%i0,	%o2
	fpsub32s	%f5,	%f17,	%f27
	movge	%xcc,	%o7,	%o6
	smul	%g2,	0x15A8,	%l2
	alignaddrl	%o5,	%l1,	%i1
	ldsw	[%l7 + 0x68],	%i7
	fmovscc	%xcc,	%f27,	%f14
	movrne	%l3,	0x0E3,	%i5
	movneg	%xcc,	%l5,	%g4
	smulcc	%g3,	0x01E3,	%i6
	save %g1, 0x0666, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o3,	%o4,	%l0
	movle	%xcc,	%l6,	%o1
	sll	%g5,	0x13,	%g7
	fmul8ulx16	%f24,	%f8,	%f20
	fcmped	%fcc1,	%f20,	%f20
	and	%l4,	%g6,	%o0
	edge8l	%i2,	%i0,	%i4
	fnot2s	%f22,	%f3
	movrne	%o2,	0x02D,	%o6
	fxors	%f7,	%f20,	%f27
	movcc	%xcc,	%o7,	%g2
	stw	%o5,	[%l7 + 0x44]
	edge8ln	%l1,	%l2,	%i1
	for	%f30,	%f20,	%f14
	subcc	%l3,	%i7,	%i5
	sdivcc	%l5,	0x0323,	%g4
	fmovsvs	%xcc,	%f3,	%f20
	alignaddr	%g3,	%i6,	%i3
	movg	%xcc,	%g1,	%o4
	xorcc	%l0,	0x0B14,	%l6
	smulcc	%o3,	0x0666,	%o1
	nop
	set	0x0C, %i6
	ldsw	[%l7 + %i6],	%g5
	edge16n	%g7,	%l4,	%o0
	xor	%i2,	%i0,	%g6
	ldd	[%l7 + 0x70],	%f30
	orcc	%i4,	%o2,	%o7
	or	%g2,	%o6,	%o5
	sllx	%l2,	0x11,	%i1
	movge	%xcc,	%l3,	%l1
	fmovdg	%xcc,	%f6,	%f18
	andcc	%i5,	0x15B6,	%i7
	st	%f8,	[%l7 + 0x38]
	srax	%g4,	0x18,	%g3
	movrlz	%l5,	0x196,	%i6
	save %i3, 0x168B, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o4,	%l6,	%l0
	ldx	[%l7 + 0x60],	%o1
	fornot1	%f8,	%f18,	%f30
	nop
	set	0x12, %g3
	ldsh	[%l7 + %g3],	%o3
	fxors	%f18,	%f26,	%f8
	std	%f24,	[%l7 + 0x70]
	andcc	%g5,	%g7,	%l4
	edge8n	%i2,	%o0,	%i0
	alignaddr	%i4,	%g6,	%o7
	ldx	[%l7 + 0x38],	%o2
	edge8	%g2,	%o6,	%l2
	popc	0x08FA,	%i1
	sub	%o5,	0x0D3D,	%l3
	stx	%i5,	[%l7 + 0x78]
	st	%f24,	[%l7 + 0x18]
	or	%i7,	%l1,	%g3
	addccc	%g4,	%l5,	%i3
	fnot2s	%f25,	%f0
	sllx	%i6,	0x14,	%g1
	udiv	%l6,	0x0E04,	%l0
	movrlez	%o1,	%o3,	%g5
	fmovrdne	%g7,	%f18,	%f6
	ldsw	[%l7 + 0x34],	%o4
	udiv	%i2,	0x1C3A,	%l4
	sethi	0x0232,	%o0
	movcc	%xcc,	%i0,	%g6
	fsrc1s	%f6,	%f6
	sra	%i4,	%o7,	%g2
	move	%icc,	%o6,	%o2
	edge16ln	%l2,	%i1,	%l3
	movre	%i5,	0x0D9,	%o5
	edge16l	%i7,	%g3,	%l1
	xorcc	%g4,	%i3,	%i6
	subc	%g1,	0x1354,	%l5
	xnor	%l6,	%l0,	%o3
	fmovdneg	%icc,	%f10,	%f5
	edge16	%g5,	%o1,	%o4
	sethi	0x17C3,	%g7
	umulcc	%i2,	%o0,	%l4
	std	%f26,	[%l7 + 0x40]
	subc	%i0,	%g6,	%o7
	movl	%icc,	%i4,	%o6
	xnorcc	%o2,	0x12D6,	%g2
	movrne	%i1,	%l2,	%i5
	sra	%o5,	0x03,	%i7
	ldsh	[%l7 + 0x2A],	%g3
	fmovrdlez	%l3,	%f22,	%f30
	edge16ln	%l1,	%i3,	%g4
	movl	%xcc,	%g1,	%i6
	addccc	%l5,	0x182A,	%l6
	edge32n	%o3,	%g5,	%l0
	srlx	%o4,	%o1,	%g7
	movrgz	%i2,	%l4,	%i0
	move	%xcc,	%g6,	%o7
	xnor	%o0,	0x0D28,	%o6
	subc	%o2,	0x0CE5,	%i4
	movl	%xcc,	%g2,	%i1
	fmovs	%f21,	%f22
	srl	%l2,	%i5,	%i7
	movrne	%g3,	%l3,	%o5
	movne	%icc,	%i3,	%g4
	stb	%l1,	[%l7 + 0x19]
	fcmpne16	%f20,	%f16,	%g1
	orncc	%l5,	0x0D38,	%l6
	movrgez	%i6,	0x214,	%g5
	fmovdcs	%xcc,	%f0,	%f13
	xnor	%o3,	0x14CB,	%l0
	fmovdpos	%xcc,	%f17,	%f2
	movg	%xcc,	%o1,	%g7
	movg	%xcc,	%o4,	%l4
	orncc	%i0,	%i2,	%o7
	add	%g6,	%o0,	%o2
	fnot1	%f20,	%f30
	movleu	%xcc,	%i4,	%g2
	ldub	[%l7 + 0x27],	%o6
	std	%f2,	[%l7 + 0x50]
	sdivcc	%l2,	0x0F22,	%i5
	sdivcc	%i7,	0x121D,	%i1
	stw	%g3,	[%l7 + 0x1C]
	restore %l3, 0x046F, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o5,	0x342,	%g4
	popc	0x1F03,	%l1
	edge16	%g1,	%l6,	%i6
	fones	%f11
	xnorcc	%l5,	0x0FB5,	%o3
	fmuld8ulx16	%f16,	%f4,	%f30
	andncc	%g5,	%o1,	%g7
	std	%f26,	[%l7 + 0x50]
	ldsw	[%l7 + 0x68],	%o4
	lduw	[%l7 + 0x0C],	%l0
	sethi	0x0A60,	%i0
	addccc	%i2,	0x022B,	%l4
	xnor	%g6,	0x1F71,	%o7
	lduh	[%l7 + 0x32],	%o2
	andncc	%i4,	%g2,	%o6
	movle	%xcc,	%o0,	%l2
	fmovscs	%icc,	%f0,	%f31
	orcc	%i7,	%i5,	%i1
	udivx	%g3,	0x102C,	%l3
	fpadd32s	%f31,	%f11,	%f28
	stx	%o5,	[%l7 + 0x48]
	subc	%i3,	%g4,	%l1
	fabss	%f10,	%f30
	fabsd	%f12,	%f0
	andcc	%l6,	%i6,	%l5
	fpadd16s	%f25,	%f3,	%f26
	alignaddr	%o3,	%g1,	%g5
	fxors	%f24,	%f23,	%f1
	fnot2s	%f15,	%f31
	fcmple16	%f18,	%f26,	%g7
	movrne	%o4,	%o1,	%i0
	edge16l	%l0,	%i2,	%g6
	sra	%o7,	0x1A,	%o2
	sdivcc	%i4,	0x077D,	%g2
	movrlz	%l4,	%o6,	%l2
	nop
	set	0x50, %i0
	lduh	[%l7 + %i0],	%o0
	edge16l	%i7,	%i1,	%g3
	sra	%l3,	%i5,	%o5
	sdivcc	%g4,	0x15EE,	%l1
	fmovdge	%xcc,	%f10,	%f17
	fmovsneg	%xcc,	%f25,	%f2
	subcc	%i3,	%l6,	%i6
	addcc	%o3,	%g1,	%l5
	andcc	%g5,	%o4,	%g7
	xor	%i0,	%l0,	%o1
	xnorcc	%g6,	0x024B,	%i2
	nop
	set	0x70, %g2
	ldd	[%l7 + %g2],	%o6
	subc	%o2,	%i4,	%g2
	fornot2s	%f23,	%f4,	%f31
	sub	%l4,	%l2,	%o6
	edge8ln	%o0,	%i7,	%g3
	xnorcc	%l3,	0x1138,	%i5
	stx	%i1,	[%l7 + 0x48]
	array16	%g4,	%l1,	%i3
	fmul8x16au	%f22,	%f13,	%f14
	fmovrdlz	%l6,	%f10,	%f20
	fmovrdlez	%o5,	%f30,	%f10
	movn	%icc,	%i6,	%o3
	smulcc	%l5,	%g1,	%o4
	stw	%g7,	[%l7 + 0x0C]
	fcmpes	%fcc0,	%f2,	%f23
	or	%g5,	%l0,	%o1
	movcc	%icc,	%g6,	%i2
	alignaddr	%i0,	%o7,	%o2
	edge8ln	%g2,	%l4,	%l2
	movleu	%xcc,	%i4,	%o0
	ldx	[%l7 + 0x30],	%i7
	fcmps	%fcc1,	%f4,	%f17
	array16	%o6,	%g3,	%l3
	movgu	%xcc,	%i1,	%i5
	sdivx	%l1,	0x0067,	%g4
	ldub	[%l7 + 0x16],	%l6
	movre	%i3,	%i6,	%o3
	movrgz	%o5,	0x1A7,	%l5
	fcmpd	%fcc0,	%f0,	%f26
	add	%g1,	%o4,	%g5
	sth	%g7,	[%l7 + 0x22]
	sdivx	%l0,	0x172F,	%o1
	popc	0x00AE,	%g6
	fsrc2	%f18,	%f30
	sth	%i0,	[%l7 + 0x3E]
	edge32ln	%i2,	%o2,	%o7
	edge32l	%g2,	%l2,	%l4
	xor	%o0,	0x1E34,	%i7
	sethi	0x145F,	%o6
	movn	%icc,	%i4,	%g3
	edge16l	%l3,	%i1,	%l1
	edge16n	%i5,	%g4,	%l6
	orn	%i6,	%i3,	%o3
	movvc	%icc,	%o5,	%l5
	nop
	set	0x58, %o3
	ldd	[%l7 + %o3],	%o4
	umulcc	%g1,	%g7,	%g5
	stw	%l0,	[%l7 + 0x50]
	fand	%f0,	%f2,	%f28
	sdiv	%o1,	0x0B0B,	%g6
	smul	%i0,	%o2,	%i2
	andn	%g2,	%o7,	%l2
	movre	%l4,	%i7,	%o0
	fxors	%f11,	%f15,	%f24
	orcc	%i4,	%g3,	%l3
	movcc	%xcc,	%o6,	%l1
	andcc	%i5,	0x1521,	%g4
	fzeros	%f30
	stb	%i1,	[%l7 + 0x65]
	movrgz	%i6,	0x38F,	%i3
	fnot1s	%f29,	%f24
	edge32	%o3,	%o5,	%l6
	xor	%l5,	%o4,	%g1
	alignaddr	%g5,	%l0,	%o1
	edge8l	%g7,	%i0,	%o2
	siam	0x6
	smul	%g6,	%g2,	%o7
	addcc	%l2,	0x1F1F,	%i2
	xnorcc	%i7,	%o0,	%i4
	stb	%l4,	[%l7 + 0x33]
	ldsb	[%l7 + 0x7D],	%l3
	movne	%xcc,	%o6,	%g3
	ldsw	[%l7 + 0x7C],	%l1
	andncc	%g4,	%i5,	%i6
	lduh	[%l7 + 0x52],	%i1
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	ldsb	[%l7 + 0x4B],	%l6
	srax	%i3,	0x1E,	%o4
	sll	%l5,	%g5,	%g1
	stw	%l0,	[%l7 + 0x14]
	addc	%o1,	0x14AD,	%g7
	movne	%icc,	%i0,	%g6
	movl	%icc,	%o2,	%o7
	edge16ln	%l2,	%i2,	%g2
	movvc	%xcc,	%o0,	%i4
	edge8n	%i7,	%l4,	%o6
	fmovdneg	%xcc,	%f16,	%f17
	edge8ln	%l3,	%l1,	%g4
	sethi	0x17E7,	%i5
	udiv	%i6,	0x1615,	%g3
	smulcc	%o3,	%o5,	%l6
	fmovd	%f10,	%f22
	st	%f14,	[%l7 + 0x10]
	ldsw	[%l7 + 0x30],	%i3
	edge32	%i1,	%l5,	%g5
	sra	%o4,	0x1E,	%g1
	addc	%o1,	%g7,	%l0
	fxnors	%f23,	%f20,	%f3
	ldx	[%l7 + 0x20],	%g6
	add	%o2,	0x0E6F,	%o7
	fabss	%f29,	%f31
	edge32l	%i0,	%i2,	%g2
	sdivcc	%o0,	0x1197,	%l2
	and	%i4,	0x13E0,	%i7
	andn	%o6,	0x12A6,	%l3
	stb	%l1,	[%l7 + 0x3A]
	ld	[%l7 + 0x14],	%f8
	restore %l4, %g4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x10],	%i5
	popc	0x0069,	%g3
	addcc	%o3,	0x0FAC,	%l6
	fmovsn	%xcc,	%f8,	%f9
	fornot1	%f22,	%f14,	%f16
	fmul8x16al	%f29,	%f20,	%f4
	edge8	%i3,	%o5,	%i1
	edge8l	%g5,	%l5,	%o4
	siam	0x6
	lduh	[%l7 + 0x36],	%o1
	add	%g7,	%g1,	%l0
	andncc	%o2,	%g6,	%i0
	edge8l	%o7,	%i2,	%g2
	sub	%l2,	%i4,	%i7
	edge32n	%o6,	%l3,	%l1
	movvs	%xcc,	%o0,	%g4
	ldsh	[%l7 + 0x46],	%i6
	movrne	%l4,	0x151,	%i5
	fmovdge	%icc,	%f6,	%f0
	add	%g3,	0x19B0,	%l6
	edge8l	%i3,	%o5,	%o3
	pdist	%f16,	%f18,	%f12
	st	%f5,	[%l7 + 0x30]
	fmovrdgez	%g5,	%f16,	%f28
	addcc	%i1,	%l5,	%o1
	movneg	%xcc,	%g7,	%o4
	fcmpeq32	%f20,	%f14,	%l0
	fzero	%f12
	fornot2	%f8,	%f14,	%f30
	ldsh	[%l7 + 0x46],	%g1
	and	%g6,	0x1A83,	%i0
	fmovdleu	%icc,	%f24,	%f26
	movpos	%xcc,	%o2,	%o7
	edge16	%g2,	%i2,	%i4
	udiv	%l2,	0x00B2,	%i7
	movg	%icc,	%o6,	%l3
	fmovrsgz	%o0,	%f9,	%f26
	movvs	%icc,	%g4,	%i6
	fsrc2	%f4,	%f0
	sdiv	%l1,	0x00EA,	%l4
	st	%f11,	[%l7 + 0x18]
	edge8ln	%g3,	%i5,	%i3
	movcc	%xcc,	%o5,	%l6
	std	%f16,	[%l7 + 0x20]
	movleu	%xcc,	%o3,	%g5
	fcmple16	%f16,	%f14,	%i1
	udiv	%l5,	0x0B31,	%o1
	fmovrdgez	%o4,	%f30,	%f30
	fnot2s	%f20,	%f29
	fmul8sux16	%f16,	%f20,	%f0
	addc	%l0,	0x136F,	%g7
	edge32n	%g6,	%i0,	%o2
	and	%o7,	%g1,	%i2
	sra	%g2,	0x0C,	%l2
	fmovrdlez	%i7,	%f6,	%f4
	fandnot1s	%f31,	%f26,	%f27
	subc	%i4,	0x09DC,	%o6
	fpsub32	%f18,	%f4,	%f10
	ldub	[%l7 + 0x7C],	%o0
	movn	%xcc,	%l3,	%g4
	orn	%i6,	0x0E41,	%l1
	udivcc	%l4,	0x0389,	%g3
	stx	%i3,	[%l7 + 0x18]
	fmovdn	%xcc,	%f21,	%f2
	fmovrdlz	%o5,	%f18,	%f4
	sethi	0x05CA,	%i5
	fmovdpos	%icc,	%f25,	%f22
	fmul8sux16	%f2,	%f24,	%f30
	edge8	%o3,	%l6,	%g5
	srlx	%i1,	%l5,	%o4
	sub	%o1,	0x0639,	%l0
	fnot2s	%f31,	%f18
	movrne	%g6,	0x27B,	%g7
	edge32n	%i0,	%o2,	%g1
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	edge8ln	%l2,	%i7,	%g2
	movcc	%xcc,	%i4,	%o0
	subcc	%o6,	0x118E,	%l3
	movcs	%icc,	%i6,	%l1
	fcmpeq16	%f0,	%f0,	%g4
	movrlz	%g3,	0x39A,	%i3
	addcc	%o5,	%i5,	%o3
	edge32	%l6,	%g5,	%i1
	orncc	%l4,	0x1D3C,	%o4
	fones	%f19
	srl	%l5,	%l0,	%g6
	srlx	%g7,	0x11,	%o1
	alignaddr	%o2,	%g1,	%o7
	stx	%i0,	[%l7 + 0x60]
	xor	%i2,	0x080F,	%l2
	fmovse	%icc,	%f21,	%f12
	fornot2	%f12,	%f0,	%f26
	orncc	%g2,	0x1F70,	%i7
	fnegs	%f3,	%f9
	restore %i4, 0x1A70, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o6,	0x11E0,	%l3
	addccc	%i6,	%g4,	%l1
	movgu	%xcc,	%g3,	%o5
	sdiv	%i5,	0x149D,	%o3
	fpack32	%f14,	%f18,	%f2
	smul	%l6,	0x1C0B,	%i3
	umulcc	%g5,	0x130D,	%l4
	addc	%i1,	%l5,	%l0
	movn	%icc,	%o4,	%g7
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%g6
	fandnot2	%f4,	%f24,	%f6
	st	%f4,	[%l7 + 0x18]
	movpos	%xcc,	%o1,	%g1
	ldd	[%l7 + 0x60],	%f18
	ldub	[%l7 + 0x29],	%o2
	xnor	%i0,	0x12BA,	%i2
	edge16l	%o7,	%l2,	%g2
	ldsh	[%l7 + 0x3C],	%i7
	sdivcc	%i4,	0x1F8F,	%o6
	movcc	%xcc,	%l3,	%i6
	movleu	%icc,	%o0,	%l1
	orncc	%g4,	%o5,	%g3
	movg	%icc,	%i5,	%l6
	fmovrsne	%i3,	%f11,	%f22
	edge32l	%o3,	%l4,	%i1
	udivcc	%g5,	0x0D93,	%l5
	alignaddr	%l0,	%o4,	%g6
	alignaddrl	%g7,	%g1,	%o1
	fcmpne16	%f30,	%f14,	%i0
	ldd	[%l7 + 0x60],	%i2
	nop
	set	0x2E, %i1
	ldsh	[%l7 + %i1],	%o7
	movgu	%xcc,	%o2,	%l2
	orncc	%g2,	0x003F,	%i4
	ldub	[%l7 + 0x6B],	%i7
	ldsh	[%l7 + 0x56],	%o6
	subcc	%l3,	0x079E,	%i6
	lduh	[%l7 + 0x50],	%o0
	save %g4, %l1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i5,	%l6,	%i3
	movre	%o3,	%g3,	%i1
	movn	%icc,	%g5,	%l4
	stb	%l0,	[%l7 + 0x45]
	movleu	%icc,	%o4,	%g6
	fmovdne	%icc,	%f22,	%f2
	movneg	%icc,	%l5,	%g7
	movrlz	%g1,	0x1A6,	%i0
	st	%f12,	[%l7 + 0x48]
	ldd	[%l7 + 0x20],	%i2
	xnorcc	%o7,	%o2,	%o1
	edge8	%g2,	%l2,	%i7
	movrlz	%o6,	%l3,	%i4
	sethi	0x0861,	%i6
	alignaddrl	%g4,	%l1,	%o0
	fmovdle	%icc,	%f8,	%f19
	orn	%o5,	%l6,	%i5
	and	%o3,	0x13D0,	%g3
	ldd	[%l7 + 0x18],	%f18
	fmovdcs	%xcc,	%f17,	%f23
	or	%i1,	0x0D04,	%i3
	movre	%g5,	%l0,	%o4
	std	%f2,	[%l7 + 0x30]
	xnorcc	%l4,	%g6,	%g7
	lduw	[%l7 + 0x08],	%l5
	nop
	set	0x08, %i4
	std	%f18,	[%l7 + %i4]
	xorcc	%g1,	0x1CD6,	%i0
	movvs	%xcc,	%o7,	%i2
	movrlz	%o2,	%o1,	%g2
	edge32	%l2,	%o6,	%l3
	subcc	%i7,	0x1A21,	%i6
	fmovsneg	%icc,	%f25,	%f20
	xor	%i4,	%l1,	%g4
	andcc	%o5,	0x08D2,	%o0
	edge32	%i5,	%o3,	%g3
	fandnot2	%f8,	%f8,	%f18
	std	%f6,	[%l7 + 0x18]
	fmovdpos	%icc,	%f3,	%f0
	ldsh	[%l7 + 0x10],	%i1
	sdivcc	%l6,	0x0987,	%i3
	bshuffle	%f4,	%f12,	%f20
	ldd	[%l7 + 0x60],	%f16
	xorcc	%g5,	0x0E47,	%l0
	edge32	%o4,	%l4,	%g7
	movvc	%icc,	%l5,	%g6
	fcmpes	%fcc0,	%f3,	%f28
	sra	%i0,	%g1,	%i2
	edge32	%o7,	%o2,	%o1
	ld	[%l7 + 0x1C],	%f22
	orcc	%g2,	%o6,	%l3
	fcmpd	%fcc2,	%f8,	%f18
	edge8	%i7,	%i6,	%l2
	add	%l1,	%g4,	%i4
	orn	%o0,	0x05B4,	%i5
	movne	%xcc,	%o3,	%g3
	ldd	[%l7 + 0x48],	%o4
	sll	%l6,	%i1,	%i3
	andncc	%l0,	%g5,	%o4
	smulcc	%l4,	0x12BB,	%g7
	edge32ln	%g6,	%i0,	%g1
	movl	%icc,	%i2,	%o7
	std	%f24,	[%l7 + 0x48]
	ldsw	[%l7 + 0x48],	%o2
	ldsb	[%l7 + 0x21],	%o1
	ldub	[%l7 + 0x0F],	%l5
	edge8ln	%g2,	%o6,	%l3
	array32	%i6,	%l2,	%i7
	lduh	[%l7 + 0x3A],	%g4
	smulcc	%i4,	%o0,	%i5
	sdivx	%l1,	0x0E65,	%g3
	udivx	%o3,	0x176C,	%l6
	movg	%icc,	%o5,	%i3
	sdivx	%i1,	0x0EEE,	%g5
	fmovdg	%xcc,	%f29,	%f15
	orn	%l0,	%o4,	%l4
	sir	0x187F
	fsrc1	%f8,	%f6
	movrlez	%g7,	0x22B,	%g6
	fxnor	%f16,	%f4,	%f30
	nop
	set	0x70, %o1
	ldd	[%l7 + %o1],	%f8
	movrgez	%g1,	%i2,	%o7
	edge16	%i0,	%o2,	%o1
	edge8	%l5,	%o6,	%l3
	move	%icc,	%i6,	%l2
	addc	%i7,	%g2,	%g4
	movcc	%xcc,	%i4,	%o0
	fpsub16s	%f24,	%f6,	%f20
	and	%l1,	%i5,	%o3
	fsrc2s	%f19,	%f16
	andncc	%g3,	%l6,	%o5
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	ldd	[%l7 + 0x48],	%f20
	movge	%icc,	%o4,	%l4
	ldsb	[%l7 + 0x38],	%g7
	mulscc	%g5,	0x1DA7,	%g1
	edge32l	%g6,	%o7,	%i0
	edge16n	%i2,	%o1,	%o2
	andcc	%o6,	%l5,	%l3
	fnand	%f2,	%f2,	%f4
	addcc	%i6,	0x0A70,	%l2
	orn	%i7,	%g4,	%i4
	ldx	[%l7 + 0x10],	%o0
	sra	%l1,	0x0D,	%g2
	xorcc	%o3,	%g3,	%l6
	fmovscc	%xcc,	%f9,	%f11
	edge32	%i5,	%o5,	%i1
	srl	%i3,	%o4,	%l4
	lduw	[%l7 + 0x2C],	%l0
	lduh	[%l7 + 0x56],	%g7
	edge8n	%g1,	%g6,	%o7
	fmovdcs	%xcc,	%f2,	%f12
	nop
	set	0x38, %i2
	std	%f18,	[%l7 + %i2]
	orcc	%g5,	%i0,	%i2
	nop
	set	0x60, %l6
	ldsw	[%l7 + %l6],	%o2
	xor	%o6,	%o1,	%l5
	movge	%icc,	%l3,	%l2
	umul	%i7,	0x0F0E,	%g4
	fmovdg	%xcc,	%f24,	%f9
	edge8	%i4,	%i6,	%o0
	ldub	[%l7 + 0x43],	%l1
	movrgez	%g2,	0x25E,	%o3
	edge8ln	%g3,	%l6,	%i5
	sir	0x1296
	lduh	[%l7 + 0x7E],	%i1
	movvs	%icc,	%o5,	%o4
	udivx	%l4,	0x10DF,	%i3
	nop
	set	0x75, %o7
	ldub	[%l7 + %o7],	%g7
	sdiv	%g1,	0x0EA4,	%g6
	fxors	%f11,	%f22,	%f4
	stb	%l0,	[%l7 + 0x3F]
	fpsub16	%f30,	%f26,	%f22
	movleu	%xcc,	%g5,	%i0
	edge16	%o7,	%i2,	%o2
	orcc	%o1,	%l5,	%l3
	fmovsvc	%xcc,	%f7,	%f19
	sdivx	%o6,	0x1976,	%l2
	fabss	%f16,	%f6
	fmovdcs	%icc,	%f12,	%f11
	fmovs	%f3,	%f14
	srl	%g4,	%i4,	%i7
	fnegs	%f23,	%f16
	movvc	%icc,	%o0,	%i6
	sethi	0x012F,	%g2
	sth	%l1,	[%l7 + 0x54]
	movn	%xcc,	%o3,	%g3
	fmovsvc	%icc,	%f22,	%f26
	edge8	%l6,	%i5,	%o5
	udivx	%o4,	0x0865,	%l4
	udiv	%i3,	0x005C,	%g7
	fsrc1s	%f21,	%f28
	fmovrslz	%i1,	%f19,	%f19
	srlx	%g6,	%g1,	%l0
	udivcc	%g5,	0x028F,	%o7
	subc	%i2,	%o2,	%i0
	edge8l	%l5,	%o1,	%l3
	xor	%l2,	%o6,	%g4
	movrne	%i7,	0x04D,	%o0
	stb	%i6,	[%l7 + 0x10]
	movl	%icc,	%i4,	%l1
	orn	%o3,	0x07D0,	%g2
	ldsw	[%l7 + 0x7C],	%g3
	edge8ln	%i5,	%o5,	%l6
	srl	%o4,	%l4,	%i3
	srl	%i1,	%g6,	%g1
	orcc	%l0,	%g7,	%g5
	mova	%xcc,	%i2,	%o2
	srl	%i0,	%o7,	%o1
	movcc	%icc,	%l5,	%l3
	save %l2, 0x1381, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %o6, %i7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i4,	[%l7 + 0x60]
	edge16n	%o0,	%l1,	%o3
	movcc	%xcc,	%g3,	%i5
	fmul8sux16	%f30,	%f10,	%f26
	edge32l	%g2,	%o5,	%l6
	srlx	%l4,	0x14,	%i3
	movvs	%icc,	%i1,	%o4
	fmuld8ulx16	%f29,	%f12,	%f22
	save %g6, 0x079D, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x12C7,	%g7
	movle	%icc,	%g5,	%i2
	fsrc2s	%f20,	%f28
	sir	0x13BB
	edge16n	%g1,	%o2,	%i0
	ld	[%l7 + 0x40],	%f26
	movrlez	%o7,	%l5,	%l3
	add	%l2,	0x1E95,	%o1
	mulscc	%g4,	%o6,	%i7
	edge32l	%i4,	%o0,	%i6
	fcmpd	%fcc2,	%f12,	%f2
	fnot2s	%f22,	%f2
	fpadd16s	%f23,	%f15,	%f14
	subccc	%l1,	%g3,	%o3
	movrlz	%i5,	%g2,	%l6
	orcc	%o5,	%l4,	%i1
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	udiv	%g7,	0x1A8E,	%g5
	fmovrdlz	%g6,	%f26,	%f30
	movgu	%xcc,	%g1,	%i2
	orn	%o2,	0x1532,	%o7
	srl	%i0,	0x05,	%l3
	orncc	%l2,	%l5,	%g4
	sth	%o6,	[%l7 + 0x08]
	nop
	set	0x64, %o6
	lduh	[%l7 + %o6],	%o1
	sll	%i4,	%i7,	%o0
	fmul8sux16	%f22,	%f22,	%f14
	movre	%l1,	%i6,	%o3
	fors	%f9,	%f29,	%f23
	sdivcc	%g3,	0x062D,	%i5
	popc	0x066D,	%g2
	edge32	%l6,	%l4,	%i1
	fpsub16s	%f12,	%f5,	%f16
	edge8l	%i3,	%o4,	%l0
	fmovrslz	%g7,	%f4,	%f21
	movre	%o5,	0x04C,	%g6
	sra	%g1,	0x00,	%g5
	fnot1s	%f9,	%f22
	save %i2, %o2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f20,	%f24
	fmovs	%f11,	%f3
	add	%l3,	0x1DAD,	%o7
	fmovrsgz	%l5,	%f28,	%f11
	movrne	%l2,	0x3A6,	%g4
	fmovrde	%o1,	%f16,	%f24
	orn	%i4,	0x01F0,	%o6
	addcc	%o0,	%i7,	%l1
	ld	[%l7 + 0x68],	%f23
	std	%f12,	[%l7 + 0x78]
	andcc	%o3,	0x0507,	%i6
	mulx	%g3,	%g2,	%l6
	ldsh	[%l7 + 0x64],	%l4
	fnors	%f5,	%f29,	%f17
	andcc	%i5,	%i1,	%i3
	stx	%l0,	[%l7 + 0x38]
	edge16l	%g7,	%o4,	%o5
	andn	%g6,	%g5,	%g1
	fmovdgu	%xcc,	%f25,	%f26
	movrgez	%o2,	0x095,	%i2
	array32	%l3,	%i0,	%l5
	array32	%l2,	%g4,	%o1
	edge16n	%o7,	%o6,	%i4
	edge8l	%i7,	%l1,	%o0
	andn	%i6,	%g3,	%o3
	edge16l	%l6,	%l4,	%g2
	fcmpgt16	%f22,	%f26,	%i5
	movcs	%icc,	%i3,	%i1
	fcmpne16	%f12,	%f2,	%g7
	ldsb	[%l7 + 0x22],	%l0
	movge	%icc,	%o4,	%g6
	fmovrdgz	%g5,	%f14,	%f18
	fand	%f18,	%f2,	%f16
	alignaddr	%o5,	%g1,	%o2
	ldd	[%l7 + 0x50],	%f22
	fmovdleu	%icc,	%f26,	%f10
	sdivx	%l3,	0x1F08,	%i2
	fmul8sux16	%f28,	%f0,	%f24
	edge8ln	%i0,	%l5,	%g4
	umul	%l2,	%o7,	%o1
	andcc	%o6,	0x0C14,	%i4
	fmovdpos	%icc,	%f10,	%f28
	sdivcc	%i7,	0x1225,	%l1
	edge16l	%i6,	%o0,	%g3
	popc	%o3,	%l4
	srlx	%l6,	0x0B,	%g2
	stx	%i5,	[%l7 + 0x10]
	std	%f10,	[%l7 + 0x40]
	mulscc	%i3,	0x0630,	%g7
	udivcc	%l0,	0x0CA7,	%i1
	save %g6, %o4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o5,	%o2,	%g1
	fandnot1	%f22,	%f6,	%f4
	ldsb	[%l7 + 0x17],	%i2
	fabss	%f0,	%f2
	sub	%i0,	%l3,	%l5
	sra	%g4,	%l2,	%o1
	sdivcc	%o6,	0x09AB,	%i4
	mulx	%i7,	%o7,	%i6
	edge32	%o0,	%l1,	%g3
	array16	%l4,	%l6,	%g2
	ldd	[%l7 + 0x60],	%i4
	restore %o3, %i3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g7,	%g6,	%i1
	add	%o4,	%o5,	%o2
	fpsub32	%f24,	%f0,	%f2
	edge16ln	%g1,	%g5,	%i2
	fmovdvc	%xcc,	%f22,	%f10
	save %l3, 0x16E1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i0,	0x1E95,	%l2
	movvs	%icc,	%o1,	%g4
	lduw	[%l7 + 0x2C],	%o6
	stb	%i4,	[%l7 + 0x38]
	smulcc	%i7,	%i6,	%o7
	movrlez	%l1,	0x28A,	%g3
	fmovrdlez	%l4,	%f18,	%f2
	movge	%xcc,	%o0,	%g2
	movge	%icc,	%i5,	%o3
	ldsh	[%l7 + 0x2A],	%l6
	ldsw	[%l7 + 0x48],	%l0
	std	%f14,	[%l7 + 0x48]
	umul	%i3,	%g7,	%i1
	movrgez	%g6,	%o4,	%o5
	fpadd16s	%f30,	%f26,	%f19
	fmovrsgez	%g1,	%f14,	%f19
	fnor	%f10,	%f24,	%f30
	fandnot2	%f22,	%f30,	%f0
	subc	%g5,	0x166F,	%i2
	ldsw	[%l7 + 0x70],	%l3
	stb	%l5,	[%l7 + 0x4B]
	ldsh	[%l7 + 0x18],	%i0
	fmovdvc	%xcc,	%f30,	%f17
	subccc	%o2,	0x172E,	%l2
	ldx	[%l7 + 0x68],	%o1
	sdiv	%g4,	0x0889,	%o6
	andncc	%i7,	%i4,	%i6
	movl	%xcc,	%o7,	%l1
	udivcc	%g3,	0x059F,	%l4
	movvc	%xcc,	%g2,	%o0
	sub	%o3,	0x1D81,	%i5
	alignaddrl	%l0,	%i3,	%l6
	movpos	%icc,	%i1,	%g7
	fmul8x16al	%f8,	%f9,	%f26
	movrlez	%o4,	%o5,	%g6
	subc	%g1,	0x0A0D,	%i2
	edge8l	%l3,	%l5,	%i0
	sll	%g5,	%o2,	%o1
	fnot1	%f4,	%f30
	faligndata	%f0,	%f26,	%f20
	srlx	%l2,	%g4,	%i7
	fnegd	%f8,	%f24
	movle	%xcc,	%o6,	%i4
	ldx	[%l7 + 0x30],	%i6
	xnorcc	%o7,	0x130F,	%g3
	fmovsn	%xcc,	%f10,	%f4
	ld	[%l7 + 0x3C],	%f20
	srl	%l4,	0x15,	%l1
	edge16	%g2,	%o3,	%i5
	and	%l0,	0x1DF8,	%o0
	addcc	%i3,	0x05FB,	%l6
	sdivx	%g7,	0x0BA7,	%i1
	subc	%o4,	%g6,	%o5
	movvc	%xcc,	%g1,	%l3
	fmovde	%xcc,	%f20,	%f16
	movrgz	%l5,	%i2,	%g5
	fcmpd	%fcc1,	%f6,	%f16
	siam	0x1
	edge8	%o2,	%o1,	%l2
	movvs	%xcc,	%i0,	%g4
	fnegs	%f20,	%f17
	fnot1	%f28,	%f16
	edge8l	%i7,	%o6,	%i4
	fmovrsgz	%o7,	%f14,	%f4
	movrlz	%i6,	0x194,	%l4
	mulscc	%g3,	%g2,	%l1
	movge	%icc,	%i5,	%o3
	popc	0x1D6C,	%o0
	alignaddrl	%i3,	%l6,	%l0
	sll	%i1,	%o4,	%g7
	fandnot2s	%f20,	%f24,	%f15
	movgu	%xcc,	%g6,	%g1
	movrgz	%l3,	0x15C,	%o5
	xor	%i2,	0x0A9D,	%l5
	fpmerge	%f27,	%f27,	%f16
	sethi	0x1503,	%o2
	movge	%icc,	%g5,	%o1
	xnorcc	%i0,	%g4,	%l2
	andncc	%i7,	%i4,	%o7
	movge	%icc,	%o6,	%l4
	srl	%i6,	%g2,	%l1
	movne	%xcc,	%i5,	%g3
	sth	%o3,	[%l7 + 0x48]
	edge32n	%i3,	%l6,	%l0
	movrgez	%o0,	0x1AC,	%i1
	or	%g7,	0x18A4,	%g6
	movrgz	%o4,	0x241,	%g1
	fmovsleu	%xcc,	%f16,	%f17
	sub	%l3,	%i2,	%o5
	add	%o2,	0x150F,	%g5
	movn	%xcc,	%o1,	%l5
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	xnor	%g4,	0x0516,	%o7
	udivx	%i4,	0x1FC2,	%o6
	fmovsn	%xcc,	%f2,	%f17
	addc	%i6,	%g2,	%l1
	edge16ln	%i5,	%g3,	%l4
	and	%o3,	0x17A1,	%l6
	fmovsleu	%icc,	%f21,	%f1
	sdivcc	%i3,	0x049D,	%l0
	ldsb	[%l7 + 0x6F],	%i1
	fmovd	%f12,	%f12
	edge8	%g7,	%g6,	%o0
	lduw	[%l7 + 0x64],	%g1
	udivcc	%o4,	0x07D8,	%i2
	edge16	%l3,	%o2,	%g5
	and	%o1,	0x036E,	%l5
	movgu	%icc,	%o5,	%l2
	fmovscc	%icc,	%f24,	%f20
	sdivx	%i0,	0x1345,	%i7
	fcmpeq32	%f4,	%f22,	%o7
	and	%i4,	0x11C3,	%o6
	move	%xcc,	%g4,	%g2
	fmovda	%xcc,	%f18,	%f5
	fmovrsne	%i6,	%f15,	%f23
	ldx	[%l7 + 0x50],	%l1
	mova	%icc,	%g3,	%i5
	movcs	%xcc,	%o3,	%l6
	fpadd16	%f30,	%f6,	%f24
	sdivcc	%l4,	0x0C0F,	%l0
	movcc	%xcc,	%i1,	%i3
	movrne	%g6,	%o0,	%g1
	edge8n	%o4,	%i2,	%l3
	edge8l	%g7,	%o2,	%g5
	orcc	%l5,	%o5,	%o1
	movne	%xcc,	%l2,	%i7
	movrne	%o7,	0x090,	%i4
	array8	%i0,	%o6,	%g2
	fmovdvc	%icc,	%f12,	%f6
	pdist	%f30,	%f30,	%f18
	fnegs	%f18,	%f15
	ldub	[%l7 + 0x6F],	%i6
	save %l1, 0x1917, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g3,	%o3,	%i5
	orn	%l6,	0x1974,	%l0
	st	%f9,	[%l7 + 0x1C]
	sethi	0x045F,	%l4
	fnands	%f26,	%f28,	%f4
	movle	%xcc,	%i3,	%i1
	alignaddrl	%g6,	%o0,	%o4
	edge8ln	%g1,	%l3,	%i2
	edge32l	%g7,	%g5,	%o2
	lduh	[%l7 + 0x72],	%o5
	fnot2	%f22,	%f16
	edge16	%o1,	%l2,	%i7
	alignaddr	%o7,	%i4,	%i0
	fcmpd	%fcc0,	%f4,	%f4
	subccc	%o6,	%l5,	%i6
	array32	%g2,	%l1,	%g3
	alignaddrl	%g4,	%o3,	%i5
	movleu	%icc,	%l0,	%l6
	movn	%xcc,	%l4,	%i3
	movcs	%xcc,	%g6,	%o0
	movg	%xcc,	%o4,	%i1
	andcc	%g1,	%i2,	%l3
	ld	[%l7 + 0x30],	%f24
	movrne	%g5,	0x316,	%g7
	ldsh	[%l7 + 0x42],	%o2
	subc	%o1,	0x10C8,	%o5
	fmovscs	%icc,	%f26,	%f21
	xnorcc	%i7,	0x0CF3,	%l2
	movg	%xcc,	%i4,	%o7
	ldd	[%l7 + 0x78],	%o6
	fmovse	%icc,	%f21,	%f28
	andn	%l5,	%i6,	%i0
	addccc	%g2,	0x0C88,	%l1
	ld	[%l7 + 0x28],	%f17
	fnot2s	%f31,	%f29
	edge32l	%g4,	%g3,	%i5
	sdivcc	%l0,	0x02EC,	%o3
	alignaddr	%l6,	%i3,	%l4
	fornot2s	%f20,	%f29,	%f25
	fsrc2s	%f23,	%f4
	array8	%o0,	%o4,	%i1
	fmovde	%xcc,	%f3,	%f14
	ldsw	[%l7 + 0x54],	%g1
	sdivcc	%g6,	0x14AB,	%l3
	fcmped	%fcc3,	%f28,	%f6
	ld	[%l7 + 0x7C],	%f17
	movleu	%xcc,	%g5,	%g7
	edge8	%o2,	%i2,	%o5
	fmovsl	%icc,	%f20,	%f21
	fnegs	%f6,	%f22
	sdivcc	%i7,	0x1FE8,	%o1
	fmovrdlz	%i4,	%f4,	%f6
	mulscc	%o7,	%l2,	%o6
	edge32l	%i6,	%i0,	%l5
	edge16	%l1,	%g4,	%g3
	orncc	%i5,	%g2,	%o3
	sethi	0x14DD,	%l0
	edge32	%l6,	%l4,	%o0
	fpadd32s	%f22,	%f12,	%f14
	fsrc1s	%f29,	%f3
	movrne	%o4,	0x36D,	%i1
	stw	%g1,	[%l7 + 0x5C]
	ldd	[%l7 + 0x38],	%i2
	mova	%icc,	%l3,	%g6
	fcmpgt16	%f20,	%f10,	%g7
	lduh	[%l7 + 0x6C],	%g5
	fnot2	%f10,	%f24
	edge32l	%i2,	%o2,	%o5
	movg	%icc,	%i7,	%i4
	fxnors	%f22,	%f11,	%f9
	ldsw	[%l7 + 0x24],	%o7
	bshuffle	%f16,	%f26,	%f14
	sir	0x1242
	sth	%l2,	[%l7 + 0x20]
	stb	%o6,	[%l7 + 0x3C]
	std	%f12,	[%l7 + 0x70]
	array16	%i6,	%o1,	%i0
	fmovrsgz	%l1,	%f18,	%f25
	smulcc	%g4,	%l5,	%g3
	movn	%icc,	%g2,	%o3
	nop
	set	0x54, %o5
	ldub	[%l7 + %o5],	%l0
	array16	%l6,	%l4,	%i5
	udivx	%o4,	0x0E07,	%i1
	smul	%o0,	0x1E58,	%i3
	xor	%g1,	0x1CE0,	%l3
	sth	%g6,	[%l7 + 0x7C]
	edge16	%g7,	%g5,	%i2
	sub	%o2,	0x0738,	%o5
	srl	%i4,	0x0C,	%i7
	movrlz	%o7,	%o6,	%l2
	fmovdle	%icc,	%f18,	%f20
	fnand	%f4,	%f30,	%f16
	movleu	%icc,	%o1,	%i6
	edge32ln	%l1,	%i0,	%g4
	alignaddr	%g3,	%l5,	%o3
	umul	%l0,	0x0131,	%g2
	fmovsne	%icc,	%f21,	%f29
	fpadd32s	%f25,	%f23,	%f18
	movrgez	%l6,	%l4,	%o4
	stb	%i5,	[%l7 + 0x08]
	fmovrdlz	%i1,	%f30,	%f24
	for	%f26,	%f6,	%f4
	nop
	set	0x24, %l4
	ldsb	[%l7 + %l4],	%i3
	movrne	%g1,	0x10A,	%o0
	sethi	0x0A89,	%l3
	xnorcc	%g7,	%g6,	%g5
	sethi	0x18E7,	%i2
	xorcc	%o5,	%i4,	%o2
	smul	%o7,	0x023D,	%i7
	fornot2	%f12,	%f22,	%f10
	srl	%l2,	0x0B,	%o1
	ldd	[%l7 + 0x68],	%f18
	umul	%o6,	%l1,	%i0
	xnorcc	%i6,	0x026F,	%g3
	add	%g4,	0x1682,	%o3
	movrlz	%l0,	0x119,	%l5
	fmovdvs	%xcc,	%f8,	%f12
	sdivx	%g2,	0x179B,	%l6
	fnot2s	%f27,	%f25
	fmovsle	%icc,	%f31,	%f16
	movcs	%icc,	%o4,	%i5
	fabss	%f10,	%f27
	lduw	[%l7 + 0x7C],	%l4
	ldsw	[%l7 + 0x78],	%i1
	fsrc2s	%f22,	%f18
	subc	%i3,	0x0F4B,	%o0
	udivx	%l3,	0x1CE5,	%g7
	edge8	%g1,	%g6,	%g5
	sdiv	%i2,	0x0062,	%i4
	sra	%o2,	0x1A,	%o7
	stb	%i7,	[%l7 + 0x21]
	srl	%o5,	%l2,	%o1
	srax	%o6,	0x1A,	%l1
	movre	%i0,	%g3,	%g4
	subc	%o3,	%i6,	%l5
	st	%f11,	[%l7 + 0x48]
	sdiv	%g2,	0x0ACC,	%l0
	edge8ln	%o4,	%l6,	%l4
	sub	%i5,	0x0FAA,	%i3
	fmovrse	%i1,	%f28,	%f3
	ldd	[%l7 + 0x38],	%f0
	alignaddrl	%l3,	%g7,	%g1
	lduh	[%l7 + 0x18],	%g6
	stw	%g5,	[%l7 + 0x24]
	and	%i2,	%i4,	%o0
	sllx	%o7,	%i7,	%o2
	fmovsge	%xcc,	%f28,	%f19
	fmovdcs	%xcc,	%f1,	%f4
	edge16	%o5,	%l2,	%o1
	ldub	[%l7 + 0x6D],	%l1
	fmovrse	%o6,	%f24,	%f13
	edge8l	%g3,	%g4,	%i0
	ldx	[%l7 + 0x48],	%i6
	movne	%icc,	%l5,	%g2
	movrgez	%l0,	0x3E2,	%o3
	movvs	%icc,	%l6,	%l4
	movrgz	%o4,	%i5,	%i3
	fmovdne	%icc,	%f27,	%f29
	xor	%l3,	%g7,	%g1
	fcmpgt16	%f10,	%f24,	%i1
	addcc	%g5,	%i2,	%g6
	movrlz	%i4,	0x27D,	%o0
	sth	%o7,	[%l7 + 0x68]
	stw	%o2,	[%l7 + 0x54]
	fmovrslez	%o5,	%f25,	%f6
	subc	%i7,	0x1285,	%o1
	edge16n	%l2,	%l1,	%o6
	ldsh	[%l7 + 0x2A],	%g4
	srlx	%i0,	0x14,	%i6
	fmovrsgez	%g3,	%f10,	%f22
	fmovdcc	%xcc,	%f7,	%f9
	movre	%l5,	0x176,	%g2
	or	%o3,	%l0,	%l6
	ldsb	[%l7 + 0x3D],	%l4
	sll	%o4,	0x03,	%i5
	fmovsne	%xcc,	%f20,	%f5
	fmovdpos	%icc,	%f19,	%f0
	ldsw	[%l7 + 0x7C],	%l3
	andn	%g7,	%g1,	%i1
	edge16ln	%g5,	%i3,	%i2
	fmovrse	%g6,	%f20,	%f23
	movneg	%xcc,	%o0,	%o7
	fmul8x16al	%f15,	%f26,	%f2
	sdivcc	%o2,	0x12A1,	%i4
	movrlez	%o5,	%i7,	%l2
	movne	%icc,	%o1,	%l1
	alignaddrl	%g4,	%o6,	%i0
	save %i6, 0x1B37, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f16,	%f23
	alignaddrl	%g2,	%o3,	%l0
	movre	%g3,	%l4,	%l6
	xorcc	%i5,	0x095D,	%l3
	xnor	%o4,	%g7,	%i1
	movne	%icc,	%g5,	%i3
	fmovdvs	%icc,	%f18,	%f3
	subcc	%i2,	%g6,	%o0
	fmovscc	%icc,	%f28,	%f4
	edge16	%o7,	%o2,	%g1
	st	%f0,	[%l7 + 0x1C]
	fmovde	%xcc,	%f1,	%f22
	save %i4, %i7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x005B,	%l2
	and	%o1,	%g4,	%o6
	srlx	%l1,	%i6,	%l5
	movrlz	%g2,	0x3FF,	%o3
	mulscc	%i0,	%g3,	%l4
	addcc	%l0,	%i5,	%l3
	restore %o4, %g7, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g5,	0x1B95,	%i3
	andn	%i1,	0x1C2D,	%g6
	fmovsle	%xcc,	%f20,	%f8
	array8	%o0,	%o7,	%o2
	fcmpne16	%f26,	%f18,	%g1
	sllx	%i4,	%i2,	%i7
	movrgz	%l2,	0x3E1,	%o5
	subc	%g4,	%o1,	%o6
	mova	%icc,	%l1,	%i6
	std	%f28,	[%l7 + 0x70]
	fexpand	%f25,	%f6
	mulscc	%g2,	0x1629,	%l5
	xor	%i0,	%o3,	%l4
	lduh	[%l7 + 0x6E],	%l0
	sir	0x145C
	movrgez	%g3,	0x05A,	%l3
	movle	%xcc,	%o4,	%g7
	subccc	%i5,	%g5,	%l6
	mulx	%i1,	0x0580,	%i3
	andn	%g6,	0x1136,	%o0
	udivcc	%o2,	0x1171,	%g1
	fcmped	%fcc0,	%f10,	%f16
	sir	0x1B90
	fmovdcc	%xcc,	%f21,	%f16
	fpadd16s	%f6,	%f0,	%f7
	popc	%i4,	%o7
	ld	[%l7 + 0x08],	%f1
	fmovrsne	%i2,	%f26,	%f3
	udivcc	%i7,	0x0C4C,	%l2
	movleu	%icc,	%o5,	%g4
	fmul8x16	%f9,	%f20,	%f8
	sllx	%o6,	0x09,	%l1
	movrne	%i6,	0x3E4,	%o1
	fmovdne	%xcc,	%f4,	%f15
	movgu	%xcc,	%g2,	%i0
	movge	%icc,	%o3,	%l5
	and	%l0,	0x0C3E,	%g3
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	movrgez	%g7,	0x023,	%i5
	movn	%xcc,	%g5,	%i1
	fandnot2	%f28,	%f8,	%f20
	edge16ln	%i3,	%l6,	%g6
	fmovrdlez	%o0,	%f0,	%f24
	bshuffle	%f26,	%f16,	%f30
	fcmpgt16	%f12,	%f14,	%o2
	st	%f6,	[%l7 + 0x58]
	edge32ln	%i4,	%o7,	%g1
	sll	%i2,	0x07,	%l2
	smul	%i7,	%o5,	%o6
	fnot1s	%f22,	%f4
	edge8l	%g4,	%i6,	%l1
	mulx	%g2,	%o1,	%i0
	subccc	%o3,	0x051E,	%l5
	fmovrdlez	%g3,	%f10,	%f8
	smul	%l4,	%l3,	%o4
	edge8ln	%l0,	%g7,	%i5
	movre	%g5,	%i3,	%i1
	mulscc	%l6,	%o0,	%g6
	nop
	set	0x58, %l2
	stw	%o2,	[%l7 + %l2]
	srl	%i4,	%g1,	%i2
	smul	%l2,	0x043D,	%i7
	movge	%xcc,	%o7,	%o5
	fmovrde	%o6,	%f2,	%f10
	smul	%g4,	%i6,	%g2
	edge32n	%l1,	%i0,	%o3
	fpack32	%f24,	%f24,	%f10
	movneg	%xcc,	%o1,	%g3
	movneg	%icc,	%l4,	%l3
	fabss	%f5,	%f1
	ldub	[%l7 + 0x7D],	%l5
	movne	%xcc,	%o4,	%g7
	fone	%f12
	fmovrdgez	%l0,	%f10,	%f24
	sdivx	%i5,	0x1C7A,	%i3
	st	%f4,	[%l7 + 0x78]
	movrgez	%g5,	0x00E,	%i1
	andcc	%l6,	0x1DF5,	%g6
	sth	%o0,	[%l7 + 0x0A]
	edge16l	%o2,	%g1,	%i4
	restore %l2, 0x0CFF, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f12,	[%l7 + 0x58]
	fpackfix	%f28,	%f26
	ldsw	[%l7 + 0x5C],	%i7
	subc	%o7,	0x05E2,	%o6
	edge8	%o5,	%g4,	%i6
	sdiv	%g2,	0x00A3,	%l1
	fmovsle	%xcc,	%f17,	%f17
	fmovsn	%xcc,	%f28,	%f31
	movcc	%icc,	%i0,	%o1
	edge32	%o3,	%l4,	%g3
	siam	0x7
	save %l5, %o4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%g7,	%i5,	%i3
	fxnor	%f12,	%f12,	%f28
	fcmpgt16	%f28,	%f28,	%g5
	alignaddr	%i1,	%l0,	%g6
	fcmpeq16	%f16,	%f0,	%o0
	stw	%o2,	[%l7 + 0x24]
	mulx	%g1,	0x183A,	%l6
	movleu	%xcc,	%i4,	%l2
	addcc	%i2,	%i7,	%o7
	movrlz	%o5,	%g4,	%i6
	edge8n	%o6,	%l1,	%i0
	edge16n	%o1,	%g2,	%o3
	fors	%f15,	%f0,	%f19
	nop
	set	0x7C, %g4
	ldsw	[%l7 + %g4],	%g3
	sllx	%l5,	%l4,	%o4
	ldsh	[%l7 + 0x24],	%g7
	sra	%i5,	%i3,	%l3
	udiv	%g5,	0x1197,	%i1
	subc	%l0,	0x10A4,	%o0
	smul	%o2,	%g1,	%g6
	edge32n	%i4,	%l2,	%l6
	movge	%xcc,	%i7,	%o7
	movrgez	%o5,	%i2,	%i6
	stw	%o6,	[%l7 + 0x38]
	sra	%g4,	0x1C,	%i0
	addc	%l1,	0x0819,	%o1
	fxnors	%f13,	%f8,	%f0
	movrgz	%o3,	%g3,	%g2
	movneg	%icc,	%l4,	%o4
	movle	%icc,	%g7,	%l5
	movg	%xcc,	%i3,	%i5
	srax	%g5,	0x05,	%i1
	fcmped	%fcc3,	%f26,	%f18
	sir	0x15FF
	ldd	[%l7 + 0x38],	%f24
	edge32l	%l3,	%o0,	%o2
	udiv	%l0,	0x0F85,	%g1
	subcc	%i4,	%l2,	%g6
	movcc	%icc,	%i7,	%l6
	ldd	[%l7 + 0x28],	%o6
	array32	%o5,	%i2,	%o6
	mova	%icc,	%i6,	%g4
	ldd	[%l7 + 0x28],	%f14
	fmovrse	%l1,	%f0,	%f3
	sethi	0x1EC8,	%i0
	smul	%o3,	0x1B51,	%g3
	srlx	%o1,	%l4,	%o4
	subc	%g7,	%g2,	%l5
	fmovsleu	%icc,	%f29,	%f30
	srl	%i3,	%i5,	%g5
	add	%l3,	0x0FD1,	%o0
	sub	%i1,	%o2,	%l0
	fcmps	%fcc3,	%f30,	%f16
	fzero	%f10
	fpadd16	%f8,	%f14,	%f14
	fabsd	%f4,	%f12
	fmovdn	%icc,	%f21,	%f23
	srl	%g1,	%i4,	%g6
	addccc	%i7,	0x1E2B,	%l6
	fmovdleu	%xcc,	%f28,	%f29
	array16	%l2,	%o5,	%i2
	edge32l	%o6,	%i6,	%g4
	ldsb	[%l7 + 0x7D],	%l1
	movg	%xcc,	%o7,	%o3
	stw	%g3,	[%l7 + 0x6C]
	movrlez	%o1,	%i0,	%l4
	lduw	[%l7 + 0x5C],	%g7
	movvs	%xcc,	%g2,	%l5
	movrne	%o4,	0x1E1,	%i5
	fmovdvs	%xcc,	%f15,	%f20
	fsrc2	%f0,	%f10
	fmovscc	%icc,	%f0,	%f25
	fmovrdlz	%i3,	%f28,	%f22
	fpack16	%f14,	%f0
	srax	%g5,	%o0,	%i1
	udiv	%l3,	0x1CBB,	%l0
	mulscc	%g1,	0x1BAF,	%o2
	fmovsle	%xcc,	%f25,	%f16
	movg	%xcc,	%g6,	%i7
	edge8	%l6,	%l2,	%o5
	edge8	%i2,	%i4,	%o6
	orcc	%g4,	0x141D,	%i6
	ldsw	[%l7 + 0x2C],	%l1
	edge8n	%o3,	%o7,	%o1
	ldd	[%l7 + 0x30],	%f10
	fornot2s	%f23,	%f25,	%f16
	movneg	%xcc,	%g3,	%l4
	alignaddrl	%g7,	%i0,	%g2
	sth	%o4,	[%l7 + 0x10]
	umulcc	%i5,	%i3,	%l5
	fmuld8ulx16	%f12,	%f31,	%f4
	add	%g5,	%o0,	%i1
	ldsw	[%l7 + 0x58],	%l3
	udivcc	%g1,	0x0BA0,	%o2
	movvs	%xcc,	%g6,	%l0
	edge32n	%i7,	%l6,	%o5
	orcc	%i2,	%l2,	%i4
	sdiv	%g4,	0x1D1F,	%i6
	sdivcc	%o6,	0x0F52,	%o3
	array32	%l1,	%o7,	%o1
	srlx	%l4,	%g7,	%g3
	st	%f2,	[%l7 + 0x44]
	fnot2s	%f0,	%f10
	array32	%i0,	%o4,	%i5
	fmovda	%icc,	%f31,	%f4
	fmovdge	%xcc,	%f1,	%f0
	for	%f20,	%f14,	%f20
	subccc	%g2,	%i3,	%g5
	add	%l5,	0x14C8,	%i1
	mulscc	%l3,	%g1,	%o0
	ldsw	[%l7 + 0x60],	%o2
	movrgz	%g6,	%i7,	%l0
	std	%f22,	[%l7 + 0x70]
	fmul8x16	%f2,	%f22,	%f18
	std	%f10,	[%l7 + 0x10]
	edge8l	%l6,	%o5,	%i2
	addc	%i4,	%l2,	%g4
	udiv	%o6,	0x1E7F,	%o3
	fmovscc	%icc,	%f28,	%f13
	fmovrsgez	%i6,	%f3,	%f23
	movrlez	%l1,	%o1,	%o7
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	edge16l	%o4,	%l4,	%g2
	ldsb	[%l7 + 0x41],	%i3
	ldd	[%l7 + 0x38],	%f10
	fcmpne32	%f24,	%f12,	%g5
	fsrc2s	%f25,	%f19
	edge8n	%l5,	%i5,	%l3
	restore %i1, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g6,	[%l7 + 0x1D]
	ldd	[%l7 + 0x78],	%i6
	movn	%xcc,	%o2,	%l0
	movvs	%xcc,	%l6,	%i2
	or	%o5,	0x1FC2,	%i4
	movleu	%xcc,	%l2,	%o6
	fmovdvs	%xcc,	%f11,	%f20
	udiv	%g4,	0x0607,	%i6
	addc	%o3,	0x0012,	%l1
	movg	%xcc,	%o7,	%g7
	movrgez	%o1,	0x0D4,	%g3
	addc	%o4,	%i0,	%g2
	fnot1s	%f21,	%f26
	st	%f20,	[%l7 + 0x3C]
	sethi	0x0381,	%l4
	ldd	[%l7 + 0x30],	%f2
	smulcc	%g5,	%i3,	%l5
	andcc	%i5,	%l3,	%i1
	movleu	%icc,	%g1,	%o0
	edge8l	%g6,	%o2,	%i7
	save %l6, 0x0485, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%o5,	%i2,	%i4
	movvs	%icc,	%o6,	%l2
	movpos	%icc,	%g4,	%o3
	alignaddrl	%i6,	%l1,	%o7
	movrlz	%o1,	0x2BA,	%g7
	xorcc	%g3,	0x0F21,	%i0
	fmovs	%f29,	%f10
	std	%f0,	[%l7 + 0x58]
	fandnot2	%f12,	%f0,	%f0
	fmovd	%f24,	%f0
	movvc	%xcc,	%o4,	%g2
	smul	%l4,	0x003F,	%g5
	sdivx	%i3,	0x00C5,	%i5
	mulscc	%l5,	0x0A98,	%l3
	sllx	%i1,	%o0,	%g1
	lduw	[%l7 + 0x74],	%o2
	subcc	%i7,	0x17E7,	%g6
	xnor	%l0,	0x1C3B,	%o5
	movrlz	%l6,	%i2,	%o6
	array32	%i4,	%l2,	%g4
	movleu	%icc,	%o3,	%l1
	lduw	[%l7 + 0x30],	%o7
	movpos	%xcc,	%o1,	%g7
	fcmple32	%f28,	%f14,	%i6
	save %g3, 0x1E52, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x20],	%f17
	fmovdleu	%xcc,	%f22,	%f27
	for	%f22,	%f28,	%f26
	smul	%g2,	0x0A2F,	%l4
	fornot2s	%f4,	%f2,	%f1
	movneg	%xcc,	%o4,	%g5
	sdiv	%i3,	0x1693,	%l5
	movcc	%xcc,	%l3,	%i5
	srl	%i1,	%g1,	%o0
	fmovsn	%icc,	%f31,	%f9
	fmuld8sux16	%f23,	%f7,	%f12
	movcc	%xcc,	%i7,	%o2
	movn	%icc,	%g6,	%l0
	ldsh	[%l7 + 0x1E],	%o5
	lduw	[%l7 + 0x14],	%i2
	alignaddr	%l6,	%i4,	%l2
	alignaddr	%g4,	%o6,	%l1
	edge8n	%o7,	%o1,	%o3
	add	%g7,	%g3,	%i6
	alignaddr	%i0,	%g2,	%l4
	movleu	%icc,	%o4,	%i3
	ldub	[%l7 + 0x33],	%l5
	sub	%l3,	%g5,	%i1
	movle	%icc,	%g1,	%i5
	alignaddr	%o0,	%o2,	%i7
	fmovde	%icc,	%f0,	%f10
	fsrc2s	%f10,	%f17
	array16	%l0,	%g6,	%i2
	stb	%o5,	[%l7 + 0x74]
	udivcc	%i4,	0x15C1,	%l2
	fones	%f24
	edge32ln	%g4,	%l6,	%l1
	subc	%o7,	0x1E57,	%o6
	fsrc1s	%f12,	%f19
	umulcc	%o1,	%o3,	%g3
	edge16n	%g7,	%i6,	%g2
	movleu	%xcc,	%l4,	%i0
	fmovscs	%xcc,	%f29,	%f14
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	alignaddr	%g5,	%i1,	%g1
	fpadd32s	%f15,	%f13,	%f0
	fsrc1s	%f29,	%f4
	edge16n	%l3,	%i5,	%o2
	udivx	%i7,	0x143A,	%l0
	fcmple32	%f12,	%f6,	%g6
	movre	%o0,	0x28B,	%i2
	std	%f14,	[%l7 + 0x10]
	edge32	%i4,	%l2,	%o5
	orn	%g4,	0x004D,	%l1
	fnot2s	%f2,	%f2
	fnor	%f2,	%f22,	%f4
	subc	%l6,	%o7,	%o6
	fmovdn	%icc,	%f18,	%f16
	or	%o1,	%g3,	%o3
	xnorcc	%i6,	%g7,	%g2
	fsrc1s	%f24,	%f18
	move	%icc,	%i0,	%i3
	subcc	%l4,	0x179D,	%o4
	lduh	[%l7 + 0x6A],	%l5
	movn	%icc,	%g5,	%g1
	fmovrsgz	%l3,	%f3,	%f11
	fmovdgu	%icc,	%f27,	%f5
	edge8	%i1,	%o2,	%i7
	srax	%l0,	%g6,	%o0
	movvs	%icc,	%i2,	%i5
	smul	%i4,	0x1E5C,	%o5
	fmovrslz	%g4,	%f29,	%f6
	ldsh	[%l7 + 0x22],	%l1
	nop
	set	0x58, %i7
	stx	%l2,	[%l7 + %i7]
	fmul8x16au	%f19,	%f15,	%f30
	movn	%icc,	%l6,	%o7
	andn	%o1,	%o6,	%g3
	orn	%o3,	0x0BCB,	%i6
	sllx	%g7,	0x1D,	%i0
	orcc	%i3,	%l4,	%g2
	fpsub16s	%f26,	%f18,	%f14
	ldx	[%l7 + 0x40],	%l5
	stx	%o4,	[%l7 + 0x48]
	edge8l	%g5,	%g1,	%l3
	movpos	%xcc,	%i1,	%o2
	fmovsne	%icc,	%f3,	%f24
	movre	%l0,	0x331,	%g6
	edge16n	%i7,	%i2,	%o0
	or	%i4,	0x1C1D,	%o5
	nop
	set	0x0C, %o0
	stw	%i5,	[%l7 + %o0]
	movrgz	%l1,	%l2,	%g4
	srlx	%l6,	%o1,	%o6
	addccc	%g3,	0x1621,	%o3
	sdiv	%o7,	0x0CCB,	%g7
	ldd	[%l7 + 0x30],	%i0
	nop
	set	0x5E, %l1
	lduh	[%l7 + %l1],	%i6
	movn	%xcc,	%l4,	%g2
	edge8	%l5,	%i3,	%o4
	sethi	0x1791,	%g5
	ld	[%l7 + 0x30],	%f26
	movn	%xcc,	%l3,	%i1
	movrgz	%g1,	%o2,	%g6
	fmovsneg	%xcc,	%f13,	%f27
	smulcc	%i7,	%l0,	%o0
	movrgez	%i2,	0x34A,	%i4
	move	%icc,	%i5,	%l1
	ldx	[%l7 + 0x08],	%o5
	fxors	%f8,	%f23,	%f11
	fzeros	%f16
	movpos	%icc,	%g4,	%l2
	fmul8x16	%f19,	%f2,	%f20
	subccc	%l6,	0x023E,	%o1
	movg	%xcc,	%o6,	%g3
	fmovsne	%xcc,	%f24,	%f8
	movrgz	%o3,	0x3C0,	%g7
	fandnot2s	%f14,	%f16,	%f16
	addc	%o7,	0x106A,	%i0
	array16	%l4,	%i6,	%l5
	fnot2	%f24,	%f6
	movrlez	%g2,	0x0E0,	%i3
	srax	%g5,	%o4,	%l3
	fcmps	%fcc3,	%f15,	%f28
	fone	%f2
	fmovdg	%xcc,	%f8,	%f4
	mulscc	%g1,	0x1E0C,	%i1
	restore %g6, 0x060B, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o2,	%l0
	fmovrse	%i2,	%f29,	%f30
	movneg	%xcc,	%o0,	%i5
	or	%l1,	%o5,	%i4
	movneg	%xcc,	%l2,	%l6
	movl	%xcc,	%o1,	%g4
	fmovdle	%icc,	%f16,	%f31
	movle	%xcc,	%g3,	%o3
	fcmped	%fcc1,	%f22,	%f14
	ld	[%l7 + 0x20],	%f13
	and	%o6,	0x04E2,	%g7
	fmovdleu	%icc,	%f24,	%f11
	and	%o7,	0x11EE,	%l4
	orncc	%i0,	%i6,	%l5
	andncc	%g2,	%g5,	%o4
	xnorcc	%i3,	%g1,	%i1
	xnor	%l3,	0x040E,	%g6
	edge8n	%o2,	%i7,	%i2
	srax	%o0,	%i5,	%l0
	edge8	%o5,	%l1,	%l2
	sethi	0x07B4,	%i4
	udiv	%o1,	0x0D1E,	%l6
	srlx	%g3,	%o3,	%g4
	fpackfix	%f14,	%f14
	fcmpgt32	%f0,	%f26,	%g7
	movn	%xcc,	%o7,	%o6
	or	%l4,	0x19E7,	%i0
	save %l5, %i6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g2,	%i3,	%g1
	orn	%o4,	%i1,	%l3
	sdivcc	%g6,	0x1B73,	%i7
	fmovsle	%xcc,	%f23,	%f9
	srl	%o2,	0x1E,	%i2
	xnorcc	%i5,	%l0,	%o0
	movrgez	%o5,	%l1,	%l2
	ldx	[%l7 + 0x10],	%o1
	orcc	%i4,	0x1249,	%g3
	edge32ln	%o3,	%l6,	%g7
	srlx	%o7,	%g4,	%o6
	edge32l	%l4,	%i0,	%i6
	movrgz	%g5,	%l5,	%i3
	fcmple32	%f12,	%f30,	%g1
	subccc	%o4,	0x130C,	%g2
	lduw	[%l7 + 0x0C],	%l3
	fcmpes	%fcc1,	%f8,	%f31
	srax	%g6,	%i1,	%i7
	nop
	set	0x4F, %i5
	ldsb	[%l7 + %i5],	%i2
	edge8ln	%i5,	%l0,	%o0
	sir	0x0251
	subc	%o2,	%o5,	%l2
	fandnot2	%f28,	%f8,	%f26
	edge8ln	%o1,	%i4,	%l1
	array8	%o3,	%l6,	%g7
	movl	%icc,	%g3,	%g4
	movl	%xcc,	%o6,	%l4
	alignaddrl	%i0,	%o7,	%g5
	srax	%i6,	0x09,	%l5
	orcc	%i3,	%g1,	%o4
	fmovda	%icc,	%f31,	%f16
	st	%f21,	[%l7 + 0x7C]
	stb	%l3,	[%l7 + 0x1E]
	edge8	%g6,	%i1,	%i7
	sll	%i2,	0x05,	%i5
	fpadd16	%f22,	%f18,	%f24
	sethi	0x13EB,	%l0
	movle	%icc,	%g2,	%o0
	mova	%xcc,	%o2,	%o5
	andncc	%l2,	%i4,	%l1
	orn	%o1,	0x1664,	%o3
	alignaddr	%g7,	%l6,	%g4
	ldd	[%l7 + 0x40],	%f2
	movn	%xcc,	%o6,	%g3
	stx	%i0,	[%l7 + 0x30]
	nop
	set	0x38, %l3
	ldx	[%l7 + %l3],	%o7
	fmovscs	%xcc,	%f26,	%f30
	sir	0x0600
	ldsh	[%l7 + 0x30],	%l4
	movn	%xcc,	%g5,	%l5
	movleu	%icc,	%i3,	%i6
	ld	[%l7 + 0x44],	%f28
	movg	%xcc,	%o4,	%g1
	edge16ln	%g6,	%i1,	%l3
	addc	%i7,	0x1F77,	%i2
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	fmovrdlz	%i5,	%f12,	%f30
	edge8	%o2,	%o5,	%o0
	sub	%l2,	0x1718,	%i4
	fandnot1	%f0,	%f28,	%f14
	array16	%l1,	%o1,	%g7
	ldd	[%l7 + 0x68],	%o2
	ldx	[%l7 + 0x40],	%l6
	fones	%f9
	sethi	0x01EF,	%g4
	subccc	%g3,	%o6,	%i0
	andcc	%o7,	0x1A49,	%g5
	for	%f6,	%f12,	%f10
	alignaddr	%l4,	%i3,	%l5
	edge8ln	%o4,	%i6,	%g6
	ldsh	[%l7 + 0x76],	%g1
	fnegs	%f14,	%f16
	array32	%i1,	%l3,	%i2
	alignaddrl	%l0,	%i7,	%i5
	xorcc	%o2,	%g2,	%o0
	fmovsg	%icc,	%f23,	%f21
	movrlez	%l2,	0x1E6,	%o5
	array16	%i4,	%o1,	%g7
	sethi	0x19BF,	%o3
	edge16n	%l1,	%l6,	%g3
	edge32	%g4,	%i0,	%o7
	udiv	%g5,	0x0939,	%l4
	sll	%i3,	%o6,	%o4
	fcmpeq32	%f4,	%f12,	%l5
	sllx	%i6,	%g1,	%i1
	udiv	%g6,	0x1BCB,	%i2
	movvc	%xcc,	%l3,	%l0
	sllx	%i7,	0x0E,	%o2
	sth	%g2,	[%l7 + 0x32]
	lduw	[%l7 + 0x10],	%o0
	udivcc	%l2,	0x0FA5,	%o5
	movge	%icc,	%i4,	%i5
	movl	%xcc,	%o1,	%o3
	mulscc	%l1,	0x1DBE,	%g7
	edge8	%l6,	%g4,	%g3
	sethi	0x0EC0,	%i0
	mulscc	%o7,	0x0FE6,	%g5
	sdivx	%i3,	0x076E,	%l4
	ldsw	[%l7 + 0x08],	%o6
	fmovdg	%xcc,	%f28,	%f15
	andncc	%l5,	%i6,	%o4
	stb	%g1,	[%l7 + 0x22]
	movleu	%icc,	%i1,	%i2
	fmovrse	%g6,	%f28,	%f13
	save %l0, %i7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f12,	%f0
	movvs	%xcc,	%l3,	%o0
	stw	%g2,	[%l7 + 0x58]
	movrlz	%l2,	%o5,	%i4
	sra	%o1,	0x14,	%i5
	fcmple16	%f20,	%f0,	%o3
	edge32n	%l1,	%l6,	%g7
	fexpand	%f27,	%f18
	nop
	set	0x4E, %l0
	ldub	[%l7 + %l0],	%g4
	addc	%i0,	0x0385,	%o7
	fnot1s	%f28,	%f12
	subccc	%g5,	%g3,	%l4
	sethi	0x1D84,	%i3
	restore %l5, 0x0130, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i6,	0x061D,	%o4
	stb	%g1,	[%l7 + 0x3E]
	addccc	%i1,	%i2,	%l0
	addccc	%i7,	0x00DE,	%o2
	edge32n	%g6,	%l3,	%g2
	array16	%o0,	%o5,	%i4
	fcmpne16	%f28,	%f24,	%l2
	xnor	%o1,	0x06B8,	%i5
	and	%o3,	%l6,	%l1
	movrlz	%g4,	%g7,	%o7
	mulscc	%i0,	%g5,	%l4
	srlx	%i3,	%g3,	%l5
	movre	%o6,	0x0EA,	%i6
	edge32n	%g1,	%o4,	%i2
	edge32	%i1,	%l0,	%o2
	stw	%i7,	[%l7 + 0x7C]
	addccc	%g6,	0x069F,	%l3
	ldd	[%l7 + 0x48],	%f30
	andcc	%g2,	0x1015,	%o0
	sdivx	%i4,	0x0B53,	%o5
	ldx	[%l7 + 0x10],	%o1
	save %l2, %i5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x1
	ldsb	[%l7 + 0x18],	%l1
	fpsub16s	%f24,	%f25,	%f3
	mova	%xcc,	%g4,	%o3
	movleu	%xcc,	%g7,	%i0
	alignaddr	%g5,	%o7,	%l4
	orcc	%i3,	%l5,	%o6
	stb	%g3,	[%l7 + 0x11]
	stb	%i6,	[%l7 + 0x7C]
	ldsh	[%l7 + 0x38],	%o4
	movpos	%icc,	%g1,	%i2
	fpsub16	%f28,	%f14,	%f16
	udivcc	%i1,	0x126D,	%o2
	edge16n	%i7,	%l0,	%l3
	sll	%g2,	%o0,	%g6
	xor	%i4,	0x1229,	%o5
	ldx	[%l7 + 0x60],	%l2
	array16	%o1,	%i5,	%l1
	addc	%l6,	0x1886,	%g4
	ldsw	[%l7 + 0x2C],	%o3
	pdist	%f10,	%f8,	%f30
	mulscc	%g7,	0x0745,	%i0
	sdivcc	%g5,	0x1CE5,	%o7
	movpos	%icc,	%i3,	%l4
	fxnors	%f8,	%f3,	%f23
	fmovsvs	%icc,	%f15,	%f4
	or	%o6,	0x08CC,	%g3
	sir	0x1EDD
	movleu	%icc,	%l5,	%o4
	edge16ln	%g1,	%i2,	%i6
	movcc	%xcc,	%i1,	%o2
	edge16	%i7,	%l3,	%g2
	sdiv	%l0,	0x187B,	%g6
	alignaddr	%i4,	%o5,	%o0
	ldd	[%l7 + 0x60],	%f26
	edge8ln	%o1,	%l2,	%l1
	sth	%i5,	[%l7 + 0x0E]
	sdivx	%g4,	0x11FF,	%l6
	movvc	%xcc,	%o3,	%i0
	ldd	[%l7 + 0x78],	%f6
	alignaddr	%g7,	%g5,	%i3
	ldd	[%l7 + 0x20],	%f28
	movre	%o7,	%o6,	%g3
	lduw	[%l7 + 0x5C],	%l4
	movneg	%icc,	%l5,	%o4
	subc	%i2,	0x1968,	%i6
	fmovrse	%i1,	%f2,	%f27
	edge16	%o2,	%i7,	%l3
	edge16ln	%g1,	%l0,	%g6
	stx	%i4,	[%l7 + 0x30]
	fors	%f6,	%f19,	%f12
	movrlez	%g2,	0x0FE,	%o0
	fcmpne16	%f20,	%f26,	%o5
	addc	%l2,	%l1,	%i5
	addccc	%g4,	0x12E5,	%l6
	movcs	%xcc,	%o1,	%o3
	andcc	%i0,	0x0716,	%g5
	bshuffle	%f4,	%f22,	%f2
	subc	%i3,	%g7,	%o6
	edge8l	%o7,	%l4,	%l5
	sethi	0x1AB1,	%o4
	fandnot2s	%f8,	%f5,	%f10
	addcc	%i2,	0x0CB5,	%i6
	fcmple16	%f30,	%f28,	%g3
	udivx	%i1,	0x0B6F,	%o2
	movge	%xcc,	%i7,	%g1
	edge8	%l0,	%g6,	%i4
	srlx	%l3,	%g2,	%o5
	sir	0x18D2
	mova	%icc,	%o0,	%l2
	fmovdpos	%xcc,	%f25,	%f27
	addcc	%l1,	0x1D61,	%i5
	st	%f18,	[%l7 + 0x0C]
	fmovdneg	%xcc,	%f17,	%f26
	srax	%l6,	0x10,	%o1
	edge32	%o3,	%i0,	%g4
	alignaddrl	%g5,	%i3,	%g7
	fmovrslz	%o7,	%f6,	%f10
	fsrc1s	%f14,	%f26
	edge32n	%o6,	%l4,	%o4
	stb	%l5,	[%l7 + 0x1D]
	smul	%i6,	%g3,	%i2
	fexpand	%f25,	%f22
	udivcc	%o2,	0x1794,	%i7
	edge16l	%g1,	%l0,	%g6
	edge16	%i4,	%l3,	%g2
	lduw	[%l7 + 0x0C],	%o5
	movn	%icc,	%o0,	%i1
	st	%f21,	[%l7 + 0x28]
	edge8l	%l1,	%l2,	%i5
	fmovdcc	%xcc,	%f9,	%f27
	mulscc	%o1,	%l6,	%o3
	sth	%g4,	[%l7 + 0x64]
	xnor	%g5,	0x06B1,	%i0
	mulx	%g7,	0x04EF,	%i3
	st	%f5,	[%l7 + 0x10]
	array32	%o6,	%l4,	%o4
	edge8	%o7,	%l5,	%g3
	fmovrslez	%i2,	%f3,	%f4
	edge16n	%o2,	%i6,	%g1
	edge8l	%l0,	%i7,	%g6
	array32	%l3,	%g2,	%i4
	orcc	%o5,	0x0E78,	%i1
	movrne	%o0,	%l1,	%l2
	move	%xcc,	%o1,	%l6
	alignaddrl	%o3,	%i5,	%g4
	array8	%g5,	%g7,	%i3
	stw	%i0,	[%l7 + 0x48]
	fcmpeq32	%f30,	%f2,	%l4
	edge16n	%o4,	%o6,	%l5
	std	%f6,	[%l7 + 0x38]
	movge	%icc,	%g3,	%i2
	std	%f6,	[%l7 + 0x78]
	sdivcc	%o2,	0x0DEF,	%i6
	mulscc	%o7,	0x1484,	%g1
	movre	%i7,	%l0,	%g6
	fmovsleu	%icc,	%f20,	%f15
	fcmped	%fcc2,	%f12,	%f8
	movre	%g2,	%l3,	%o5
	edge32ln	%i1,	%o0,	%i4
	smul	%l2,	%o1,	%l6
	array8	%l1,	%i5,	%o3
	fxnors	%f3,	%f6,	%f21
	edge32	%g4,	%g5,	%g7
	sdivcc	%i0,	0x0076,	%l4
	movg	%icc,	%i3,	%o4
	movcs	%xcc,	%l5,	%o6
	std	%f28,	[%l7 + 0x20]
	fzeros	%f2
	movcs	%icc,	%i2,	%g3
	fmovsge	%xcc,	%f29,	%f3
	fornot2	%f30,	%f16,	%f26
	alignaddr	%i6,	%o7,	%o2
	sdiv	%i7,	0x1899,	%l0
	sub	%g1,	%g2,	%g6
	movvc	%icc,	%l3,	%o5
	ld	[%l7 + 0x14],	%f19
	fmovrsne	%i1,	%f4,	%f20
	subc	%i4,	0x172B,	%l2
	array32	%o0,	%l6,	%l1
	orn	%o1,	0x0758,	%i5
	fmovsne	%xcc,	%f8,	%f7
	popc	0x15D6,	%g4
	movre	%o3,	0x0B0,	%g5
	fmuld8sux16	%f4,	%f19,	%f16
	fands	%f26,	%f23,	%f28
	srlx	%g7,	%i0,	%i3
	edge16	%o4,	%l4,	%o6
	fmovrdlez	%l5,	%f8,	%f4
	srlx	%g3,	0x03,	%i6
	fmovsl	%icc,	%f0,	%f25
	lduh	[%l7 + 0x42],	%i2
	fnands	%f11,	%f30,	%f17
	andn	%o2,	0x0768,	%i7
	movvs	%xcc,	%l0,	%g1
	fmovsne	%icc,	%f29,	%f30
	fnand	%f30,	%f8,	%f0
	movre	%o7,	0x18A,	%g6
	sra	%g2,	%l3,	%i1
	fmovrdgez	%o5,	%f24,	%f24
	array8	%i4,	%l2,	%o0
	ldsh	[%l7 + 0x4C],	%l6
	movg	%icc,	%l1,	%i5
	fmovdn	%icc,	%f5,	%f22
	edge32	%o1,	%o3,	%g4
	sdiv	%g7,	0x073C,	%i0
	smulcc	%g5,	%o4,	%l4
	movvc	%icc,	%o6,	%i3
	movle	%xcc,	%g3,	%l5
	lduw	[%l7 + 0x38],	%i2
	sub	%o2,	%i6,	%l0
	edge8ln	%i7,	%g1,	%g6
	movrlez	%o7,	0x20B,	%g2
	orncc	%l3,	0x1DF8,	%i1
	mova	%xcc,	%o5,	%i4
	sdivcc	%o0,	0x103F,	%l6
	sll	%l2,	0x06,	%l1
	movgu	%icc,	%o1,	%i5
	fmovsgu	%icc,	%f29,	%f10
	edge8ln	%g4,	%o3,	%g7
	ldsh	[%l7 + 0x74],	%i0
	mulx	%o4,	%g5,	%l4
	movrne	%i3,	0x3DC,	%o6
	fpsub16s	%f29,	%f31,	%f8
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	movrlz	%o2,	0x0D4,	%l0
	array32	%i6,	%i7,	%g6
	edge16l	%o7,	%g2,	%l3
	fandnot1s	%f9,	%f4,	%f22
	orn	%g1,	0x0F4F,	%o5
	fpackfix	%f26,	%f21
	fmovdn	%icc,	%f5,	%f0
	fsrc1s	%f29,	%f21
	movleu	%icc,	%i4,	%i1
	ldsw	[%l7 + 0x2C],	%o0
	fmovrslez	%l6,	%f20,	%f16
	movg	%xcc,	%l1,	%l2
	sdiv	%i5,	0x0002,	%o1
	fmovdcc	%icc,	%f9,	%f19
	orncc	%g4,	%o3,	%g7
	sra	%o4,	%g5,	%l4
	ldsb	[%l7 + 0x26],	%i3
	mova	%icc,	%o6,	%i0
	and	%g3,	%i2,	%o2
	movg	%xcc,	%l0,	%i6
	movvc	%xcc,	%l5,	%i7
	sllx	%o7,	0x13,	%g2
	fcmpne32	%f16,	%f8,	%l3
	fmovscs	%icc,	%f16,	%f10
	udivcc	%g6,	0x18D1,	%g1
	edge8n	%i4,	%o5,	%i1
	popc	0x11D0,	%o0
	movneg	%icc,	%l6,	%l2
	stw	%i5,	[%l7 + 0x30]
	std	%f20,	[%l7 + 0x60]
	movrne	%o1,	%g4,	%o3
	alignaddrl	%l1,	%o4,	%g7
	fcmpeq16	%f10,	%f4,	%l4
	fmovrsgez	%i3,	%f25,	%f9
	ldd	[%l7 + 0x58],	%f16
	addc	%g5,	0x0EDB,	%i0
	or	%o6,	%i2,	%o2
	movgu	%icc,	%g3,	%i6
	fmovsn	%xcc,	%f23,	%f18
	movrgz	%l0,	0x2BE,	%i7
	ld	[%l7 + 0x34],	%f27
	movrgez	%l5,	%o7,	%g2
	movgu	%icc,	%g6,	%g1
	ldsw	[%l7 + 0x30],	%i4
	siam	0x7
	orcc	%l3,	%i1,	%o5
	add	%l6,	%l2,	%o0
	lduh	[%l7 + 0x1C],	%i5
	movge	%xcc,	%o1,	%o3
	stw	%g4,	[%l7 + 0x1C]
	fcmpeq16	%f6,	%f8,	%l1
	ldsh	[%l7 + 0x7C],	%g7
	subccc	%o4,	%l4,	%i3
	fcmpes	%fcc3,	%f6,	%f16
	movrgez	%g5,	0x09B,	%o6
	xorcc	%i0,	%o2,	%i2
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%g2
	andcc	%l0,	0x006D,	%i7
	sllx	%i6,	%o7,	%l5
	orcc	%g6,	%g2,	%g1
	fmovdge	%icc,	%f9,	%f12
	ldsh	[%l7 + 0x42],	%i4
	fandnot1s	%f31,	%f21,	%f11
	movvs	%icc,	%l3,	%i1
	ld	[%l7 + 0x7C],	%f31
	movg	%icc,	%l6,	%o5
	andn	%o0,	%i5,	%l2
	ldx	[%l7 + 0x38],	%o3
	addcc	%g4,	%l1,	%g7
	fmovdcc	%xcc,	%f10,	%f29
	fmovsle	%icc,	%f21,	%f12
	srax	%o1,	0x19,	%o4
	fpmerge	%f30,	%f15,	%f8
	srl	%i3,	0x02,	%g5
	addccc	%l4,	%i0,	%o6
	ldd	[%l7 + 0x68],	%f30
	sra	%i2,	0x0F,	%o2
	xor	%l0,	%i7,	%g3
	sub	%i6,	0x1541,	%o7
	smul	%g6,	0x14D6,	%l5
	sdiv	%g2,	0x1183,	%g1
	ldub	[%l7 + 0x09],	%l3
	sra	%i4,	0x1B,	%i1
	fnegs	%f27,	%f21
	array16	%o5,	%o0,	%i5
	std	%f0,	[%l7 + 0x60]
	fmovse	%icc,	%f8,	%f10
	smul	%l6,	0x10C2,	%o3
	udiv	%l2,	0x1BFC,	%g4
	movcc	%xcc,	%l1,	%g7
	addcc	%o1,	%o4,	%g5
	smulcc	%i3,	%i0,	%o6
	sra	%l4,	0x07,	%i2
	alignaddrl	%o2,	%i7,	%l0
	edge16n	%g3,	%o7,	%g6
	popc	%l5,	%g2
	movle	%icc,	%g1,	%i6
	nop
	set	0x0C, %g6
	ldsh	[%l7 + %g6],	%l3
	edge32	%i4,	%i1,	%o0
	andcc	%i5,	%l6,	%o3
	smulcc	%l2,	%g4,	%l1
	fpsub16s	%f10,	%f22,	%f17
	fmovsl	%xcc,	%f20,	%f5
	std	%f22,	[%l7 + 0x70]
	fexpand	%f8,	%f14
	edge16	%g7,	%o5,	%o1
	for	%f18,	%f2,	%f2
	fandnot2s	%f17,	%f15,	%f4
	andcc	%o4,	0x1706,	%i3
	subc	%i0,	0x158E,	%g5
	fcmpes	%fcc0,	%f21,	%f30
	movvs	%icc,	%l4,	%i2
	fmul8sux16	%f12,	%f16,	%f10
	fmul8ulx16	%f28,	%f28,	%f2
	sll	%o2,	%o6,	%i7
	orncc	%g3,	%l0,	%g6
	srax	%o7,	0x01,	%g2
	fcmpgt32	%f18,	%f30,	%l5
	mulx	%g1,	%i6,	%l3
	udiv	%i1,	0x03C0,	%i4
	array8	%o0,	%l6,	%o3
	udiv	%i5,	0x17B4,	%l2
	mova	%xcc,	%g4,	%l1
	fmovscs	%icc,	%f31,	%f27
	umul	%g7,	%o5,	%o4
	movrne	%i3,	%i0,	%g5
	add	%l4,	0x06E2,	%o1
	mulscc	%i2,	%o6,	%i7
	lduh	[%l7 + 0x0E],	%o2
	movge	%xcc,	%g3,	%g6
	mulscc	%o7,	0x0B44,	%g2
	fpsub16s	%f15,	%f16,	%f28
	andncc	%l0,	%l5,	%i6
	movpos	%icc,	%g1,	%i1
	sll	%i4,	%o0,	%l6
	sra	%o3,	0x0F,	%i5
	andcc	%l2,	0x1ACD,	%l3
	sllx	%l1,	%g4,	%g7
	movne	%icc,	%o5,	%o4
	srlx	%i0,	%i3,	%g5
	edge8l	%l4,	%o1,	%i2
	fcmpeq16	%f22,	%f26,	%o6
	fmovrdlz	%i7,	%f30,	%f16
	smul	%o2,	%g3,	%o7
	xorcc	%g6,	%g2,	%l5
	movg	%xcc,	%i6,	%l0
	fmovscc	%xcc,	%f7,	%f31
	movcc	%icc,	%i1,	%g1
	fpmerge	%f22,	%f17,	%f18
	ldd	[%l7 + 0x58],	%f12
	ldd	[%l7 + 0x50],	%f30
	movrne	%i4,	0x2A2,	%o0
	fnot2	%f0,	%f18
	umul	%l6,	%i5,	%l2
	xnorcc	%l3,	0x0710,	%o3
	mulscc	%g4,	%l1,	%g7
	edge8n	%o5,	%o4,	%i3
	mulx	%i0,	0x1EF1,	%l4
	movcc	%xcc,	%o1,	%g5
	sth	%i2,	[%l7 + 0x30]
	add	%i7,	%o2,	%g3
	fzero	%f0
	umulcc	%o7,	%o6,	%g6
	movre	%g2,	%l5,	%l0
	fmovdle	%icc,	%f24,	%f30
	movge	%xcc,	%i1,	%g1
	fmovs	%f1,	%f11
	addccc	%i4,	%o0,	%i6
	lduw	[%l7 + 0x2C],	%l6
	fmovdvs	%icc,	%f11,	%f14
	fmuld8sux16	%f11,	%f21,	%f26
	movrlz	%i5,	0x142,	%l3
	movrne	%l2,	0x299,	%g4
	xnorcc	%o3,	%l1,	%g7
	sth	%o5,	[%l7 + 0x4C]
	srax	%i3,	0x15,	%i0
	sll	%o4,	0x1D,	%l4
	fxnors	%f24,	%f8,	%f13
	fpackfix	%f6,	%f31
	fzero	%f18
	fnors	%f9,	%f2,	%f3
	ldd	[%l7 + 0x60],	%g4
	movrlez	%i2,	%i7,	%o1
	movle	%xcc,	%g3,	%o2
	fone	%f28
	sdivx	%o6,	0x0913,	%o7
	ldd	[%l7 + 0x08],	%g2
	fmovsg	%xcc,	%f14,	%f21
	movn	%xcc,	%l5,	%l0
	array32	%i1,	%g1,	%i4
	addcc	%o0,	%i6,	%g6
	sll	%l6,	%i5,	%l2
	smulcc	%g4,	%o3,	%l3
	srl	%l1,	%g7,	%i3
	array8	%i0,	%o5,	%l4
	movl	%xcc,	%o4,	%i2
	edge16l	%g5,	%o1,	%i7
	movg	%xcc,	%g3,	%o6
	udivx	%o7,	0x0916,	%g2
	lduh	[%l7 + 0x46],	%l5
	mova	%icc,	%o2,	%i1
	mulx	%l0,	0x1916,	%g1
	stb	%o0,	[%l7 + 0x75]
	edge32ln	%i6,	%i4,	%l6
	array32	%g6,	%l2,	%i5
	orn	%g4,	%o3,	%l1
	movrgz	%l3,	%g7,	%i3
	fcmpgt16	%f14,	%f6,	%o5
	ldsh	[%l7 + 0x78],	%l4
	array8	%o4,	%i2,	%g5
	mulx	%o1,	%i7,	%i0
	move	%icc,	%o6,	%o7
	addccc	%g3,	%g2,	%o2
	movvs	%xcc,	%l5,	%l0
	move	%icc,	%i1,	%g1
	movrgez	%o0,	0x125,	%i6
	st	%f27,	[%l7 + 0x40]
	edge8ln	%l6,	%i4,	%l2
	ldsb	[%l7 + 0x3D],	%g6
	or	%g4,	%i5,	%o3
	movvs	%icc,	%l3,	%l1
	udivcc	%g7,	0x16DE,	%o5
	movpos	%icc,	%i3,	%o4
	std	%f30,	[%l7 + 0x48]
	ldsw	[%l7 + 0x0C],	%i2
	fnegd	%f2,	%f6
	edge16n	%l4,	%o1,	%i7
	save %g5, %o6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f16,	%f8,	%f20
	umul	%g3,	0x0B65,	%o7
	ld	[%l7 + 0x08],	%f29
	movg	%icc,	%o2,	%l5
	restore %g2, %i1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l0,	%o0
	ldub	[%l7 + 0x2E],	%i6
	ldsb	[%l7 + 0x50],	%l6
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f6
	subcc	%i4,	%g6,	%l2
	stw	%i5,	[%l7 + 0x20]
	ldsh	[%l7 + 0x1C],	%g4
	fcmpes	%fcc1,	%f15,	%f30
	array32	%l3,	%o3,	%g7
	andn	%o5,	%i3,	%l1
	fcmpeq16	%f26,	%f28,	%i2
	sir	0x00AE
	fmovsvs	%xcc,	%f28,	%f26
	movrgz	%o4,	0x263,	%o1
	mulx	%l4,	0x1FA7,	%i7
	movl	%icc,	%o6,	%i0
	movleu	%xcc,	%g3,	%g5
	fsrc2	%f26,	%f10
	save %o2, 0x1620, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f18,	%f20,	%f0
	ldd	[%l7 + 0x08],	%f4
	edge8l	%g2,	%i1,	%o7
	fmovdl	%icc,	%f31,	%f27
	ldsh	[%l7 + 0x64],	%l0
	movvs	%icc,	%g1,	%i6
	array32	%o0,	%l6,	%g6
	fmovsvc	%icc,	%f24,	%f15
	sth	%l2,	[%l7 + 0x2A]
	fornot2	%f16,	%f14,	%f24
	array16	%i4,	%i5,	%g4
	ldd	[%l7 + 0x60],	%l2
	nop
	set	0x24, %o2
	sth	%g7,	[%l7 + %o2]
	fmovdl	%xcc,	%f22,	%f11
	edge16l	%o5,	%i3,	%o3
	fcmple16	%f24,	%f10,	%l1
	ldsb	[%l7 + 0x41],	%i2
	sir	0x059D
	move	%icc,	%o1,	%l4
	movpos	%icc,	%i7,	%o4
	orncc	%o6,	0x19BC,	%g3
	sethi	0x1F67,	%g5
	edge32ln	%i0,	%o2,	%g2
	andn	%l5,	%o7,	%l0
	addcc	%i1,	0x0DA6,	%i6
	edge8ln	%g1,	%o0,	%l6
	udiv	%l2,	0x1665,	%i4
	std	%f2,	[%l7 + 0x30]
	array32	%g6,	%i5,	%l3
	srl	%g7,	%g4,	%i3
	fmovsg	%xcc,	%f22,	%f23
	subcc	%o3,	0x1EEA,	%o5
	sth	%l1,	[%l7 + 0x44]
	fzeros	%f31
	orcc	%o1,	%l4,	%i7
	sll	%i2,	0x1E,	%o4
	sethi	0x050A,	%o6
	movneg	%icc,	%g3,	%g5
	movl	%xcc,	%o2,	%i0
	udiv	%l5,	0x0136,	%g2
	mova	%icc,	%o7,	%l0
	orncc	%i1,	0x0BCD,	%i6
	movrlez	%g1,	0x374,	%l6
	save %l2, 0x0754, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o0,	0x0E30,	%i5
	sir	0x0F9B
	array8	%l3,	%g6,	%g7
	fmovdn	%icc,	%f30,	%f31
	edge8l	%i3,	%o3,	%o5
	fmovsle	%icc,	%f0,	%f9
	nop
	set	0x70, %o4
	ldd	[%l7 + %o4],	%f16
	fcmpeq16	%f12,	%f12,	%g4
	movre	%o1,	%l4,	%i7
	udivcc	%l1,	0x0D47,	%i2
	movl	%xcc,	%o4,	%o6
	lduw	[%l7 + 0x50],	%g3
	edge16	%o2,	%i0,	%l5
	std	%f4,	[%l7 + 0x70]
	orn	%g5,	%o7,	%g2
	movpos	%xcc,	%l0,	%i6
	movcc	%icc,	%g1,	%i1
	ldsw	[%l7 + 0x58],	%l2
	movle	%icc,	%i4,	%l6
	subcc	%o0,	%i5,	%g6
	ldsh	[%l7 + 0x26],	%l3
	fmovscs	%xcc,	%f28,	%f24
	ldsh	[%l7 + 0x1C],	%g7
	smul	%o3,	%o5,	%i3
	fmovrdne	%g4,	%f10,	%f12
	fxor	%f16,	%f12,	%f12
	lduh	[%l7 + 0x0C],	%o1
	stw	%i7,	[%l7 + 0x70]
	movpos	%xcc,	%l1,	%i2
	movrlez	%o4,	0x075,	%o6
	fone	%f26
	fcmpd	%fcc1,	%f24,	%f30
	fmovdvs	%icc,	%f23,	%f24
	fnand	%f4,	%f10,	%f0
	ldd	[%l7 + 0x58],	%l4
	mova	%icc,	%g3,	%i0
	array16	%l5,	%g5,	%o7
	fmovdvc	%icc,	%f18,	%f9
	movpos	%xcc,	%g2,	%l0
	orn	%o2,	0x1FD2,	%g1
	fsrc1	%f0,	%f16
	fmovrsgz	%i1,	%f15,	%f5
	fmovsgu	%icc,	%f25,	%f21
	xor	%i6,	%i4,	%l2
	fmovrde	%l6,	%f14,	%f2
	srlx	%o0,	%g6,	%i5
	or	%g7,	0x075C,	%l3
	umulcc	%o5,	%o3,	%i3
	sethi	0x1803,	%g4
	nop
	set	0x7B, %g5
	ldub	[%l7 + %g5],	%o1
	edge8	%l1,	%i7,	%i2
	fmovrse	%o4,	%f25,	%f16
	fmovd	%f20,	%f20
	sdiv	%o6,	0x18BB,	%g3
	fsrc2s	%f9,	%f20
	orncc	%l4,	%i0,	%l5
	edge16	%o7,	%g2,	%g5
	movge	%icc,	%o2,	%l0
	fmovsne	%xcc,	%f25,	%f12
	fmovrde	%i1,	%f20,	%f20
	edge8l	%g1,	%i4,	%l2
	movrlez	%l6,	0x1E1,	%o0
	popc	%i6,	%i5
	save %g7, 0x1E08, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x159F,	%g6
	fmovsvc	%icc,	%f20,	%f31
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	stw	%g4,	[%l7 + 0x14]
	subc	%l1,	%o1,	%i7
	xnor	%i2,	0x0F33,	%o4
	fmovscs	%xcc,	%f8,	%f9
	movl	%icc,	%g3,	%o6
	ldd	[%l7 + 0x68],	%f22
	movne	%icc,	%i0,	%l5
	fnot2	%f16,	%f6
	andncc	%o7,	%g2,	%g5
	edge8ln	%l4,	%o2,	%i1
	movvs	%xcc,	%l0,	%i4
	st	%f31,	[%l7 + 0x48]
	subc	%g1,	0x0420,	%l2
	ldub	[%l7 + 0x46],	%o0
	std	%f0,	[%l7 + 0x70]
	fcmpd	%fcc3,	%f4,	%f12
	movpos	%icc,	%l6,	%i6
	edge8ln	%i5,	%g7,	%g6
	add	%l3,	0x01FE,	%o5
	subccc	%o3,	0x0697,	%i3
	mulscc	%g4,	%o1,	%l1
	restore %i2, %i7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f3,	%f25,	%f14
	subcc	%g3,	0x12CA,	%o6
	fabss	%f2,	%f16
	edge8n	%i0,	%o7,	%l5
	fnot1s	%f14,	%f23
	fornot2s	%f18,	%f27,	%f13
	sdivx	%g2,	0x0A53,	%l4
	st	%f25,	[%l7 + 0x18]
	movrlz	%o2,	%i1,	%l0
	lduw	[%l7 + 0x5C],	%g5
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	movgu	%xcc,	%o0,	%l2
	edge8	%l6,	%i6,	%g7
	smul	%i5,	0x001C,	%l3
	sllx	%g6,	%o3,	%i3
	fmovda	%icc,	%f2,	%f3
	andn	%o5,	0x1F68,	%o1
	edge8	%l1,	%g4,	%i2
	udiv	%i7,	0x03AB,	%o4
	movvc	%icc,	%g3,	%o6
	edge32	%i0,	%o7,	%l5
	mova	%icc,	%l4,	%g2
	edge32n	%i1,	%o2,	%l0
	fmovrde	%g5,	%f10,	%f8
	fmovdg	%xcc,	%f22,	%f31
	movneg	%icc,	%i4,	%o0
	array8	%g1,	%l6,	%l2
	smulcc	%g7,	0x0FFD,	%i5
	nop
	set	0x7E, %i6
	lduh	[%l7 + %i6],	%l3
	subccc	%i6,	%o3,	%g6
	edge8l	%o5,	%o1,	%i3
	movcs	%icc,	%g4,	%l1
	ldub	[%l7 + 0x41],	%i2
	edge16ln	%i7,	%o4,	%o6
	sth	%i0,	[%l7 + 0x7E]
	udivx	%g3,	0x18B2,	%o7
	movle	%xcc,	%l5,	%g2
	srlx	%i1,	%o2,	%l0
	xnorcc	%l4,	%g5,	%i4
	srlx	%g1,	%l6,	%l2
	orcc	%o0,	%g7,	%l3
	edge32ln	%i6,	%i5,	%o3
	edge32l	%g6,	%o1,	%o5
	movvc	%icc,	%i3,	%g4
	smulcc	%i2,	%i7,	%l1
	sra	%o4,	0x08,	%o6
	sdiv	%g3,	0x1C07,	%o7
	xnor	%i0,	0x10CA,	%l5
	std	%f24,	[%l7 + 0x30]
	umul	%g2,	0x1C7A,	%i1
	sllx	%l0,	%l4,	%o2
	movrgez	%i4,	%g5,	%l6
	fmovs	%f9,	%f5
	fmovrdlez	%g1,	%f10,	%f6
	sra	%l2,	%g7,	%o0
	movgu	%xcc,	%i6,	%l3
	alignaddrl	%o3,	%g6,	%i5
	andn	%o5,	%i3,	%o1
	andcc	%g4,	0x1F3C,	%i2
	movn	%xcc,	%i7,	%l1
	fmovrdgz	%o6,	%f28,	%f2
	edge8n	%g3,	%o7,	%o4
	fcmpeq16	%f8,	%f4,	%i0
	faligndata	%f4,	%f28,	%f22
	subc	%l5,	%i1,	%g2
	andn	%l4,	0x1B1C,	%o2
	srlx	%l0,	%g5,	%l6
	orcc	%g1,	%l2,	%g7
	nop
	set	0x39, %g3
	stb	%o0,	[%l7 + %g3]
	stx	%i6,	[%l7 + 0x40]
	fsrc1s	%f2,	%f7
	movpos	%icc,	%l3,	%o3
	fmovspos	%xcc,	%f9,	%f30
	fmuld8sux16	%f15,	%f28,	%f16
	addc	%i4,	%i5,	%o5
	and	%i3,	%o1,	%g4
	stx	%i2,	[%l7 + 0x38]
	movrgz	%g6,	0x1F2,	%l1
	movg	%icc,	%i7,	%o6
	sllx	%g3,	%o7,	%i0
	std	%f6,	[%l7 + 0x28]
	andcc	%l5,	0x12E9,	%o4
	movg	%icc,	%i1,	%l4
	mulx	%g2,	0x057F,	%l0
	smul	%g5,	%o2,	%l6
	orcc	%g1,	0x1AD9,	%g7
	mulscc	%o0,	0x0C3B,	%i6
	fnors	%f16,	%f0,	%f19
	movrlz	%l3,	%o3,	%l2
	edge8	%i4,	%o5,	%i5
	umulcc	%i3,	0x004E,	%o1
	edge32n	%g4,	%i2,	%l1
	fnand	%f4,	%f28,	%f2
	nop
	set	0x24, %g7
	stw	%i7,	[%l7 + %g7]
	movrlez	%o6,	0x0E9,	%g3
	sra	%g6,	0x1F,	%o7
	fmovrse	%i0,	%f25,	%f30
	movn	%xcc,	%l5,	%o4
	andn	%l4,	%g2,	%l0
	mova	%xcc,	%i1,	%g5
	srl	%l6,	0x16,	%o2
	sdivx	%g7,	0x0CB3,	%o0
	srax	%g1,	%i6,	%l3
	edge32	%l2,	%i4,	%o3
	fmovsgu	%icc,	%f22,	%f2
	sdiv	%i5,	0x1C74,	%i3
	sdiv	%o5,	0x0D80,	%o1
	srax	%g4,	0x05,	%l1
	udivx	%i2,	0x1A45,	%i7
	sdivx	%o6,	0x1EF1,	%g6
	sir	0x011F
	edge16	%o7,	%g3,	%i0
	subccc	%l5,	0x07C4,	%o4
	movle	%xcc,	%l4,	%l0
	edge32n	%g2,	%g5,	%i1
	edge32n	%o2,	%l6,	%o0
	ldx	[%l7 + 0x68],	%g7
	srl	%i6,	%l3,	%g1
	sdivcc	%l2,	0x1A8A,	%o3
	fmul8x16au	%f29,	%f21,	%f10
	movrlz	%i4,	%i5,	%o5
	addcc	%i3,	0x1A39,	%g4
	movvs	%icc,	%o1,	%l1
	andncc	%i7,	%i2,	%o6
	movpos	%xcc,	%o7,	%g6
	subccc	%i0,	%l5,	%g3
	srax	%o4,	0x0E,	%l0
	fmovdcs	%xcc,	%f16,	%f14
	umulcc	%g2,	0x1C64,	%g5
	sll	%i1,	%o2,	%l4
	fmovdle	%xcc,	%f14,	%f24
	movrne	%l6,	0x0FA,	%g7
	stx	%i6,	[%l7 + 0x40]
	edge8ln	%l3,	%o0,	%l2
	fmovsgu	%icc,	%f20,	%f1
	fornot2	%f28,	%f0,	%f4
	fandnot1s	%f21,	%f7,	%f22
	addcc	%o3,	0x1AD1,	%g1
	udivx	%i4,	0x1613,	%o5
	fsrc2s	%f8,	%f25
	edge8l	%i3,	%i5,	%g4
	movle	%icc,	%o1,	%l1
	edge8l	%i2,	%o6,	%o7
	edge16ln	%i7,	%g6,	%l5
	movneg	%xcc,	%g3,	%o4
	fmovsa	%icc,	%f17,	%f6
	array32	%i0,	%l0,	%g2
	edge16	%g5,	%i1,	%l4
	edge16	%o2,	%g7,	%i6
	movcc	%xcc,	%l6,	%l3
	andcc	%l2,	%o3,	%g1
	movcs	%xcc,	%o0,	%o5
	movvs	%icc,	%i4,	%i5
	subc	%g4,	0x14EE,	%i3
	sethi	0x0676,	%l1
	orn	%o1,	0x0D8F,	%i2
	addc	%o6,	0x00AE,	%o7
	ldd	[%l7 + 0x58],	%g6
	orn	%i7,	%g3,	%l5
	fandnot2	%f2,	%f14,	%f26
	fmul8x16au	%f13,	%f28,	%f18
	addccc	%o4,	%i0,	%l0
	sllx	%g5,	0x1B,	%g2
	smulcc	%i1,	0x0265,	%o2
	fcmpeq32	%f6,	%f14,	%l4
	edge8	%g7,	%l6,	%i6
	movre	%l2,	0x337,	%o3
	stb	%g1,	[%l7 + 0x53]
	xnorcc	%l3,	0x0DAC,	%o5
	edge16	%o0,	%i4,	%g4
	subc	%i3,	0x0D66,	%i5
	srax	%l1,	0x0F,	%i2
	movrgz	%o1,	0x30B,	%o7
	udivcc	%o6,	0x05D9,	%g6
	ldx	[%l7 + 0x38],	%i7
	fmovrslez	%l5,	%f14,	%f20
	orcc	%o4,	%g3,	%i0
	fpadd32	%f12,	%f22,	%f8
	fnot1s	%f2,	%f6
	fmovda	%icc,	%f30,	%f20
	movvc	%xcc,	%g5,	%l0
	movneg	%icc,	%g2,	%o2
	sra	%l4,	0x02,	%i1
	umul	%l6,	0x1FE9,	%i6
	movrgez	%l2,	0x331,	%o3
	fcmpgt32	%f18,	%f28,	%g7
	umulcc	%l3,	%g1,	%o0
	std	%f10,	[%l7 + 0x78]
	fmovscc	%xcc,	%f3,	%f3
	fornot1	%f14,	%f24,	%f18
	sethi	0x0EDC,	%i4
	movl	%icc,	%o5,	%i3
	andncc	%g4,	%l1,	%i5
	movl	%xcc,	%i2,	%o7
	fmovdne	%xcc,	%f23,	%f21
	fcmpeq32	%f10,	%f20,	%o1
	ldub	[%l7 + 0x4D],	%g6
	movg	%xcc,	%o6,	%i7
	fnors	%f16,	%f29,	%f14
	movgu	%xcc,	%o4,	%l5
	pdist	%f14,	%f8,	%f16
	movrlez	%g3,	%i0,	%l0
	sll	%g5,	0x15,	%g2
	and	%l4,	0x168B,	%i1
	udivcc	%o2,	0x06DA,	%i6
	movne	%xcc,	%l2,	%o3
	stw	%g7,	[%l7 + 0x10]
	fmovdn	%xcc,	%f1,	%f6
	sth	%l3,	[%l7 + 0x28]
	fmul8x16	%f26,	%f0,	%f12
	edge8ln	%l6,	%g1,	%i4
	fmovsneg	%xcc,	%f7,	%f19
	edge32ln	%o5,	%o0,	%i3
	fcmpeq32	%f10,	%f10,	%l1
	movpos	%xcc,	%i5,	%i2
	ldd	[%l7 + 0x10],	%f16
	save %g4, %o1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x78],	%o7
	fnot1	%f14,	%f6
	edge16n	%o6,	%i7,	%l5
	fxnors	%f3,	%f29,	%f11
	lduh	[%l7 + 0x10],	%g3
	fmul8x16au	%f10,	%f4,	%f8
	srlx	%i0,	%l0,	%g5
	st	%f19,	[%l7 + 0x28]
	fmovdne	%icc,	%f29,	%f21
	fpadd16	%f20,	%f8,	%f20
	edge8ln	%o4,	%l4,	%i1
	edge32n	%g2,	%i6,	%l2
	edge16n	%o3,	%o2,	%l3
	ldsh	[%l7 + 0x42],	%g7
	fpsub32	%f2,	%f18,	%f28
	movre	%g1,	%l6,	%i4
	movrne	%o5,	0x313,	%o0
	udivx	%l1,	0x0191,	%i5
	edge32l	%i3,	%g4,	%o1
	sethi	0x16EE,	%g6
	fnot1s	%f12,	%f11
	fcmpne32	%f22,	%f12,	%o7
	fmovsge	%icc,	%f5,	%f15
	fmovdpos	%icc,	%f29,	%f5
	save %i2, 0x1A1F, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x10],	%f14
	movleu	%xcc,	%l5,	%i7
	fpadd16s	%f4,	%f26,	%f2
	umul	%g3,	%l0,	%i0
	lduh	[%l7 + 0x56],	%g5
	movrne	%l4,	0x260,	%o4
	edge8l	%i1,	%i6,	%g2
	udiv	%o3,	0x0D75,	%l2
	edge16n	%l3,	%o2,	%g1
	add	%g7,	0x05D5,	%i4
	umulcc	%l6,	%o5,	%l1
	array16	%i5,	%o0,	%i3
	or	%o1,	0x1CB9,	%g6
	orncc	%o7,	0x1B1C,	%i2
	or	%o6,	0x163F,	%l5
	fabsd	%f0,	%f4
	edge16	%i7,	%g4,	%l0
	andn	%i0,	0x0F07,	%g3
	xnor	%l4,	0x121A,	%g5
	edge32l	%i1,	%o4,	%i6
	fcmpgt32	%f18,	%f28,	%g2
	smul	%l2,	%o3,	%o2
	stb	%g1,	[%l7 + 0x7A]
	subcc	%g7,	%i4,	%l6
	ldd	[%l7 + 0x58],	%f8
	sll	%l3,	0x0F,	%l1
	stw	%i5,	[%l7 + 0x18]
	movneg	%xcc,	%o0,	%i3
	array32	%o1,	%o5,	%o7
	fmuld8sux16	%f20,	%f30,	%f30
	movge	%xcc,	%g6,	%o6
	movrgez	%l5,	%i2,	%i7
	fmovdl	%icc,	%f20,	%f17
	fmovdle	%icc,	%f14,	%f4
	sir	0x080B
	sub	%l0,	0x0050,	%i0
	st	%f31,	[%l7 + 0x0C]
	fmovspos	%xcc,	%f31,	%f27
	mulscc	%g3,	%g4,	%l4
	xor	%g5,	%o4,	%i1
	movle	%xcc,	%g2,	%i6
	fmovdgu	%xcc,	%f29,	%f28
	sdivcc	%l2,	0x0DC4,	%o3
	ldx	[%l7 + 0x58],	%g1
	subccc	%g7,	%o2,	%l6
	add	%i4,	%l1,	%i5
	movrgez	%o0,	%i3,	%o1
	srax	%o5,	%l3,	%o7
	orcc	%g6,	0x00B5,	%o6
	sdivx	%l5,	0x1D68,	%i2
	restore %i7, %l0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f10,	%f24
	movcc	%xcc,	%g3,	%l4
	udivcc	%g4,	0x10A7,	%g5
	subc	%o4,	%g2,	%i1
	fxor	%f20,	%f28,	%f20
	edge32n	%i6,	%l2,	%o3
	fexpand	%f31,	%f2
	edge16	%g7,	%o2,	%g1
	udivcc	%l6,	0x087A,	%i4
	mulx	%i5,	0x0304,	%l1
	umul	%o0,	%i3,	%o5
	for	%f22,	%f2,	%f4
	fornot2	%f24,	%f0,	%f16
	fmul8x16au	%f16,	%f10,	%f28
	smul	%o1,	0x0604,	%o7
	fmovdn	%xcc,	%f10,	%f26
	umulcc	%l3,	0x04BF,	%g6
	edge16ln	%l5,	%o6,	%i7
	sdiv	%i2,	0x0C40,	%l0
	addcc	%i0,	0x00E5,	%g3
	sllx	%l4,	0x07,	%g4
	nop
	set	0x44, %i0
	ldub	[%l7 + %i0],	%g5
	fnor	%f16,	%f28,	%f30
	movleu	%icc,	%g2,	%i1
	fpmerge	%f17,	%f26,	%f12
	ldsb	[%l7 + 0x52],	%i6
	alignaddr	%l2,	%o3,	%o4
	ld	[%l7 + 0x64],	%f23
	umul	%o2,	%g7,	%g1
	smul	%l6,	%i5,	%i4
	andn	%l1,	0x0BF5,	%o0
	nop
	set	0x18, %g2
	lduw	[%l7 + %g2],	%o5
	ld	[%l7 + 0x7C],	%f12
	movleu	%xcc,	%i3,	%o7
	edge16l	%l3,	%g6,	%o1
	fcmpne16	%f24,	%f12,	%l5
	smul	%o6,	0x1DA2,	%i7
	smulcc	%l0,	%i0,	%g3
	edge8	%i2,	%g4,	%l4
	srax	%g2,	0x0E,	%g5
	mulx	%i6,	%l2,	%i1
	movcc	%icc,	%o3,	%o4
	sub	%o2,	%g1,	%g7
	srlx	%l6,	0x0D,	%i5
	ldsw	[%l7 + 0x10],	%l1
	andn	%o0,	0x0403,	%o5
	stx	%i3,	[%l7 + 0x78]
	movneg	%xcc,	%i4,	%l3
	fcmpne32	%f6,	%f4,	%g6
	array32	%o7,	%l5,	%o1
	smulcc	%i7,	%o6,	%i0
	movpos	%xcc,	%g3,	%l0
	movrne	%i2,	%l4,	%g2
	std	%f16,	[%l7 + 0x50]
	move	%xcc,	%g4,	%i6
	stx	%l2,	[%l7 + 0x18]
	movcs	%icc,	%g5,	%o3
	andcc	%i1,	%o4,	%g1
	fmovd	%f10,	%f4
	sra	%g7,	%l6,	%o2
	addcc	%i5,	0x1AE0,	%o0
	movcc	%icc,	%l1,	%o5
	edge16n	%i4,	%i3,	%l3
	movpos	%icc,	%g6,	%l5
	orcc	%o7,	0x1EB5,	%i7
	move	%icc,	%o6,	%i0
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	fmovsge	%icc,	%f22,	%f8
	array32	%i2,	%l4,	%g2
	alignaddr	%g4,	%l2,	%i6
	ld	[%l7 + 0x68],	%f26
	st	%f27,	[%l7 + 0x1C]
	array32	%o3,	%i1,	%g5
	fmuld8sux16	%f2,	%f22,	%f30
	edge32ln	%o4,	%g1,	%l6
	movgu	%xcc,	%g7,	%o2
	sth	%o0,	[%l7 + 0x4E]
	array16	%i5,	%l1,	%i4
	and	%o5,	0x1239,	%l3
	sth	%g6,	[%l7 + 0x4A]
	fmovsg	%icc,	%f30,	%f18
	popc	%i3,	%l5
	edge32l	%o7,	%o6,	%i0
	umulcc	%o1,	%i7,	%l0
	movg	%xcc,	%i2,	%g3
	movvc	%icc,	%l4,	%g4
	edge16	%l2,	%i6,	%o3
	fmovdn	%xcc,	%f1,	%f16
	xnor	%i1,	0x062D,	%g5
	stb	%o4,	[%l7 + 0x32]
	andcc	%g1,	%l6,	%g7
	fmovrdgz	%g2,	%f24,	%f18
	movrne	%o2,	%i5,	%o0
	andn	%i4,	0x1BA6,	%l1
	edge32ln	%o5,	%l3,	%g6
	fmovdvc	%icc,	%f13,	%f24
	sub	%i3,	0x1FE5,	%l5
	movn	%icc,	%o7,	%i0
	std	%f30,	[%l7 + 0x20]
	sra	%o6,	%i7,	%l0
	fcmps	%fcc1,	%f17,	%f11
	movge	%xcc,	%i2,	%o1
	fexpand	%f28,	%f26
	fmovdleu	%icc,	%f6,	%f3
	subccc	%l4,	0x12E1,	%g4
	movne	%xcc,	%g3,	%i6
	srl	%o3,	0x0E,	%i1
	fmovsle	%icc,	%f20,	%f3
	orncc	%l2,	%o4,	%g5
	movleu	%icc,	%g1,	%l6
	edge8n	%g7,	%g2,	%i5
	movrgz	%o0,	0x23C,	%i4
	fcmple16	%f18,	%f12,	%o2
	xnor	%l1,	%o5,	%l3
	movneg	%icc,	%i3,	%l5
	andn	%g6,	%i0,	%o7
	sdivx	%o6,	0x0236,	%l0
	mulscc	%i2,	0x0910,	%i7
	mulx	%o1,	%l4,	%g3
	edge32	%i6,	%o3,	%i1
	movrgez	%l2,	0x13E,	%g4
	ldub	[%l7 + 0x5C],	%o4
	sub	%g5,	%l6,	%g7
	udivx	%g2,	0x0741,	%g1
	sllx	%i5,	0x12,	%i4
	movre	%o2,	%o0,	%l1
	orncc	%l3,	0x14E6,	%i3
	or	%o5,	0x1D3E,	%g6
	movvs	%xcc,	%i0,	%o7
	xorcc	%o6,	%l5,	%l0
	mulx	%i7,	%o1,	%l4
	std	%f8,	[%l7 + 0x50]
	fmovdne	%icc,	%f21,	%f23
	or	%g3,	0x0F74,	%i2
	std	%f2,	[%l7 + 0x68]
	alignaddr	%i6,	%i1,	%o3
	movgu	%xcc,	%l2,	%g4
	fand	%f18,	%f28,	%f4
	stb	%g5,	[%l7 + 0x49]
	edge8l	%o4,	%g7,	%g2
	ldd	[%l7 + 0x58],	%i6
	ldsh	[%l7 + 0x48],	%g1
	andcc	%i5,	0x1348,	%i4
	or	%o0,	%l1,	%o2
	orncc	%l3,	0x1BCF,	%o5
	mulscc	%g6,	0x0E3E,	%i3
	srlx	%o7,	%o6,	%l5
	srlx	%i0,	%i7,	%l0
	movrne	%l4,	0x089,	%g3
	array8	%o1,	%i2,	%i1
	ldsw	[%l7 + 0x38],	%i6
	fabss	%f8,	%f6
	sra	%l2,	%o3,	%g4
	edge16	%o4,	%g5,	%g7
	nop
	set	0x65, %o3
	stb	%g2,	[%l7 + %o3]
	orn	%g1,	%l6,	%i4
	nop
	set	0x78, %i3
	ldsw	[%l7 + %i3],	%i5
	save %o0, 0x196B, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l1,	%o5,	%l3
	sethi	0x15D5,	%i3
	sdivcc	%o7,	0x0B8C,	%o6
	fpsub16	%f4,	%f18,	%f2
	sub	%l5,	0x1C6F,	%i0
	movg	%xcc,	%g6,	%i7
	lduw	[%l7 + 0x34],	%l4
	xorcc	%g3,	%l0,	%i2
	ldsw	[%l7 + 0x28],	%i1
	lduw	[%l7 + 0x1C],	%i6
	edge16	%o1,	%o3,	%l2
	and	%o4,	0x13C0,	%g5
	fpsub16s	%f0,	%f15,	%f12
	std	%f14,	[%l7 + 0x40]
	fpsub32s	%f12,	%f23,	%f18
	fxnor	%f20,	%f14,	%f24
	movrlz	%g4,	%g2,	%g1
	fmovdne	%xcc,	%f27,	%f5
	stb	%l6,	[%l7 + 0x3F]
	sdiv	%i4,	0x0B8A,	%g7
	addc	%i5,	0x0A4A,	%o0
	movge	%xcc,	%o2,	%o5
	fmovrde	%l1,	%f18,	%f24
	fcmped	%fcc3,	%f4,	%f2
	addccc	%i3,	0x0113,	%o7
	orncc	%o6,	%l3,	%i0
	std	%f22,	[%l7 + 0x38]
	sdiv	%g6,	0x1315,	%i7
	sub	%l4,	0x122E,	%l5
	movge	%xcc,	%g3,	%i2
	fexpand	%f10,	%f0
	st	%f6,	[%l7 + 0x54]
	lduw	[%l7 + 0x24],	%i1
	addcc	%i6,	0x02C6,	%l0
	fcmpd	%fcc1,	%f22,	%f12
	xorcc	%o3,	0x1D7D,	%l2
	andcc	%o1,	0x1FA3,	%g5
	ldx	[%l7 + 0x10],	%o4
	fmovsge	%xcc,	%f29,	%f16
	popc	0x0592,	%g4
	edge16ln	%g2,	%l6,	%g1
	edge16n	%i4,	%i5,	%g7
	add	%o0,	%o2,	%l1
	movcs	%icc,	%o5,	%i3
	mulscc	%o7,	%l3,	%o6
	save %i0, 0x0538, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x24],	%f8
	xnorcc	%l4,	%g6,	%l5
	fcmpgt32	%f22,	%f4,	%g3
	movcs	%xcc,	%i1,	%i2
	edge16l	%l0,	%i6,	%l2
	movre	%o1,	0x014,	%g5
	edge8l	%o3,	%g4,	%o4
	movneg	%icc,	%l6,	%g1
	subccc	%g2,	%i4,	%g7
	movl	%xcc,	%o0,	%o2
	andcc	%i5,	0x1606,	%l1
	movrgez	%i3,	%o7,	%o5
	addcc	%l3,	0x0785,	%o6
	ldsw	[%l7 + 0x3C],	%i7
	array16	%i0,	%l4,	%g6
	sdivcc	%l5,	0x06A9,	%i1
	sllx	%g3,	0x10,	%l0
	movg	%xcc,	%i2,	%i6
	alignaddrl	%o1,	%l2,	%o3
	edge16l	%g4,	%o4,	%g5
	fpack32	%f10,	%f6,	%f6
	fmovdn	%xcc,	%f4,	%f17
	sdivcc	%g1,	0x0953,	%g2
	movrne	%i4,	%g7,	%l6
	xnorcc	%o2,	0x0A61,	%o0
	sethi	0x066C,	%i5
	nop
	set	0x0E, %i1
	ldub	[%l7 + %i1],	%l1
	andn	%i3,	0x1177,	%o5
	sra	%o7,	0x13,	%o6
	orcc	%i7,	%i0,	%l3
	srl	%l4,	%g6,	%i1
	sethi	0x08AF,	%l5
	stb	%l0,	[%l7 + 0x55]
	edge8	%g3,	%i2,	%i6
	ldd	[%l7 + 0x68],	%f2
	smulcc	%o1,	0x1A5A,	%l2
	alignaddr	%o3,	%g4,	%o4
	orn	%g5,	0x0FA4,	%g2
	movgu	%icc,	%g1,	%g7
	andcc	%i4,	0x0A01,	%l6
	movvc	%xcc,	%o0,	%o2
	array16	%l1,	%i5,	%o5
	subccc	%o7,	0x19D6,	%o6
	movre	%i3,	%i7,	%i0
	movrgez	%l4,	0x280,	%g6
	srl	%l3,	%l5,	%i1
	sth	%g3,	[%l7 + 0x2A]
	movleu	%xcc,	%i2,	%l0
	array32	%i6,	%l2,	%o3
	ldd	[%l7 + 0x20],	%f28
	edge8	%g4,	%o1,	%g5
	fmovrdgz	%g2,	%f0,	%f10
	movrlez	%o4,	%g7,	%g1
	fmovsl	%icc,	%f23,	%f29
	restore %l6, %o0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%o2,	0x1870,	%l1
	edge8n	%o5,	%i5,	%o6
	fmovdn	%xcc,	%f15,	%f2
	edge16n	%o7,	%i7,	%i0
	subcc	%i3,	%l4,	%g6
	fcmple16	%f10,	%f26,	%l3
	movrlz	%i1,	0x226,	%l5
	movgu	%icc,	%g3,	%i2
	fornot1s	%f3,	%f16,	%f24
	orcc	%l0,	0x09BD,	%l2
	fnegd	%f20,	%f22
	edge8n	%o3,	%i6,	%g4
	edge8l	%g5,	%o1,	%g2
	st	%f12,	[%l7 + 0x40]
	orcc	%o4,	%g7,	%l6
	save %o0, 0x1980, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g1,	%l1
	mulscc	%o2,	%o5,	%i5
	movge	%xcc,	%o7,	%i7
	ldub	[%l7 + 0x60],	%i0
	mulscc	%o6,	0x026A,	%i3
	or	%l4,	%g6,	%i1
	fnands	%f31,	%f8,	%f24
	fmovsa	%icc,	%f16,	%f0
	smul	%l3,	%l5,	%i2
	alignaddr	%l0,	%g3,	%o3
	fmovdneg	%xcc,	%f25,	%f5
	mulscc	%i6,	0x1340,	%g4
	edge32	%l2,	%o1,	%g2
	mova	%icc,	%o4,	%g5
	nop
	set	0x57, %i4
	stb	%l6,	[%l7 + %i4]
	movrgez	%g7,	0x25B,	%o0
	edge8n	%g1,	%l1,	%i4
	movrgz	%o2,	0x3E1,	%i5
	ldx	[%l7 + 0x10],	%o7
	movrlez	%i7,	%o5,	%o6
	alignaddrl	%i3,	%l4,	%i0
	lduh	[%l7 + 0x0A],	%g6
	orncc	%i1,	0x1D39,	%l5
	edge32	%i2,	%l0,	%g3
	fmovrdne	%o3,	%f30,	%f2
	edge8	%l3,	%g4,	%l2
	ldsh	[%l7 + 0x0C],	%i6
	movrlz	%o1,	0x02F,	%g2
	fmovdpos	%xcc,	%f31,	%f5
	edge8n	%o4,	%l6,	%g7
	ldd	[%l7 + 0x28],	%f18
	fmuld8sux16	%f15,	%f2,	%f0
	edge32l	%o0,	%g5,	%g1
	nop
	set	0x78, %i2
	stx	%i4,	[%l7 + %i2]
	movrgez	%o2,	%i5,	%o7
	edge16	%l1,	%i7,	%o6
	ldub	[%l7 + 0x50],	%o5
	popc	%l4,	%i3
	movcc	%xcc,	%g6,	%i1
	sethi	0x1A87,	%i0
	orncc	%l5,	%i2,	%g3
	alignaddr	%l0,	%o3,	%l3
	sra	%l2,	%i6,	%o1
	fzero	%f16
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	addccc	%g4,	%g7,	%l6
	subc	%o0,	0x0737,	%g5
	edge32ln	%i4,	%g1,	%o2
	fmul8x16	%f2,	%f0,	%f16
	nop
	set	0x30, %l6
	ldx	[%l7 + %l6],	%i5
	array8	%l1,	%o7,	%i7
	sth	%o5,	[%l7 + 0x50]
	fornot2s	%f18,	%f31,	%f6
	fors	%f9,	%f28,	%f6
	fnor	%f8,	%f10,	%f0
	mova	%xcc,	%o6,	%i3
	srl	%l4,	%i1,	%i0
	xor	%g6,	%l5,	%i2
	fcmpes	%fcc1,	%f26,	%f29
	movne	%xcc,	%g3,	%l0
	st	%f10,	[%l7 + 0x38]
	sethi	0x16AE,	%o3
	sth	%l3,	[%l7 + 0x6A]
	fmul8x16	%f0,	%f20,	%f10
	edge8	%l2,	%i6,	%g2
	movre	%o4,	0x3DF,	%g4
	alignaddrl	%g7,	%o1,	%l6
	fmovsg	%xcc,	%f19,	%f1
	edge8l	%g5,	%i4,	%o0
	or	%o2,	0x03C6,	%i5
	ldd	[%l7 + 0x78],	%f12
	subc	%l1,	%g1,	%i7
	alignaddrl	%o7,	%o5,	%i3
	movneg	%xcc,	%o6,	%i1
	sll	%l4,	%g6,	%l5
	std	%f30,	[%l7 + 0x08]
	lduh	[%l7 + 0x6E],	%i2
	fmovsleu	%icc,	%f14,	%f1
	edge16	%i0,	%l0,	%o3
	fmovrsgez	%l3,	%f2,	%f4
	st	%f21,	[%l7 + 0x14]
	edge16ln	%l2,	%i6,	%g3
	srax	%o4,	%g2,	%g4
	mulscc	%g7,	0x1605,	%o1
	alignaddr	%l6,	%g5,	%i4
	orn	%o2,	%o0,	%l1
	and	%i5,	0x0BFB,	%g1
	ldub	[%l7 + 0x53],	%o7
	array32	%o5,	%i7,	%o6
	xor	%i3,	%i1,	%l4
	array16	%l5,	%i2,	%i0
	fpack16	%f12,	%f15
	sll	%g6,	0x1C,	%o3
	fnands	%f2,	%f8,	%f30
	fmovrdne	%l0,	%f26,	%f12
	orn	%l3,	%i6,	%g3
	edge8n	%l2,	%o4,	%g4
	fmovsle	%xcc,	%f13,	%f24
	and	%g7,	0x02A1,	%g2
	sdiv	%l6,	0x0350,	%o1
	addcc	%g5,	0x0240,	%o2
	fpsub32	%f26,	%f20,	%f28
	orn	%o0,	0x09C3,	%i4
	ldub	[%l7 + 0x11],	%i5
	andn	%l1,	0x1985,	%g1
	edge8l	%o7,	%o5,	%i7
	movvs	%xcc,	%o6,	%i3
	sub	%l4,	%i1,	%l5
	ldd	[%l7 + 0x60],	%i2
	movvs	%icc,	%g6,	%i0
	fmovs	%f2,	%f7
	mova	%xcc,	%l0,	%l3
	and	%o3,	0x1540,	%i6
	udivx	%l2,	0x1E09,	%o4
	stw	%g3,	[%l7 + 0x10]
	fmovdvc	%xcc,	%f22,	%f13
	udiv	%g7,	0x0BC7,	%g2
	smul	%l6,	0x0E26,	%g4
	movrlz	%g5,	%o1,	%o0
	restore %o2, %i4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l1,	0x0D1D,	%g1
	edge8ln	%o7,	%i7,	%o6
	andcc	%o5,	0x0813,	%i3
	fmovrsne	%i1,	%f19,	%f8
	movrgez	%l5,	%i2,	%l4
	st	%f18,	[%l7 + 0x5C]
	mulx	%g6,	%i0,	%l3
	movle	%icc,	%o3,	%l0
	mulx	%i6,	%o4,	%g3
	fandnot1s	%f13,	%f13,	%f8
	sdiv	%g7,	0x07EF,	%l2
	ldx	[%l7 + 0x28],	%g2
	fmovsgu	%icc,	%f24,	%f2
	alignaddr	%g4,	%g5,	%o1
	ldd	[%l7 + 0x60],	%f18
	udiv	%l6,	0x160E,	%o0
	fcmpgt16	%f6,	%f8,	%o2
	fxors	%f20,	%f10,	%f8
	fmovsl	%icc,	%f14,	%f8
	srl	%i4,	%i5,	%l1
	edge32n	%g1,	%o7,	%o6
	edge32	%o5,	%i7,	%i1
	movcs	%xcc,	%l5,	%i3
	movgu	%xcc,	%i2,	%l4
	sllx	%g6,	%l3,	%o3
	stw	%l0,	[%l7 + 0x18]
	for	%f8,	%f4,	%f14
	edge16ln	%i0,	%i6,	%g3
	movne	%xcc,	%g7,	%l2
	sir	0x0C5B
	udiv	%o4,	0x0F6A,	%g2
	movg	%icc,	%g4,	%g5
	movne	%xcc,	%o1,	%o0
	alignaddr	%o2,	%i4,	%i5
	smul	%l6,	%l1,	%g1
	edge32ln	%o7,	%o6,	%i7
	srl	%i1,	%l5,	%o5
	edge32l	%i2,	%l4,	%i3
	sdivx	%l3,	0x0153,	%g6
	fmul8x16	%f5,	%f28,	%f14
	fmovsvc	%xcc,	%f30,	%f12
	fmovdneg	%xcc,	%f17,	%f7
	addcc	%l0,	0x001A,	%i0
	fnand	%f26,	%f4,	%f0
	fpmerge	%f14,	%f26,	%f24
	xor	%o3,	%g3,	%g7
	fpsub32s	%f4,	%f5,	%f21
	edge8l	%l2,	%o4,	%g2
	andn	%i6,	0x152E,	%g5
	fpsub16s	%f8,	%f22,	%f26
	srax	%g4,	0x1E,	%o0
	smul	%o1,	%i4,	%o2
	srlx	%l6,	0x05,	%i5
	std	%f12,	[%l7 + 0x38]
	sdivx	%l1,	0x17D2,	%g1
	movle	%xcc,	%o7,	%o6
	andcc	%i7,	0x1648,	%l5
	fmovsvc	%icc,	%f0,	%f18
	fandnot1s	%f14,	%f26,	%f23
	fxnors	%f5,	%f18,	%f16
	ldub	[%l7 + 0x1E],	%o5
	array32	%i1,	%i2,	%l4
	nop
	set	0x11, %o1
	stb	%i3,	[%l7 + %o1]
	addccc	%l3,	%l0,	%i0
	st	%f28,	[%l7 + 0x30]
	movvc	%xcc,	%g6,	%g3
	udivx	%g7,	0x1653,	%l2
	srax	%o3,	%g2,	%i6
	orcc	%g5,	0x1FB6,	%o4
	sub	%o0,	%g4,	%i4
	movre	%o2,	%l6,	%i5
	sdiv	%l1,	0x0C73,	%g1
	edge32l	%o1,	%o7,	%o6
	movpos	%icc,	%i7,	%l5
	popc	%o5,	%i1
	fnands	%f18,	%f31,	%f6
	xnorcc	%i2,	%l4,	%i3
	fmovsvs	%xcc,	%f17,	%f25
	movl	%icc,	%l3,	%l0
	edge16	%g6,	%i0,	%g7
	fnands	%f14,	%f7,	%f30
	movne	%icc,	%g3,	%l2
	ldsw	[%l7 + 0x10],	%g2
	fmovsge	%xcc,	%f17,	%f17
	fnands	%f15,	%f30,	%f4
	ldsh	[%l7 + 0x2C],	%i6
	andncc	%o3,	%o4,	%g5
	srlx	%g4,	%o0,	%i4
	stw	%o2,	[%l7 + 0x74]
	movne	%icc,	%l6,	%l1
	fexpand	%f30,	%f22
	edge16l	%g1,	%o1,	%i5
	stb	%o7,	[%l7 + 0x44]
	fmovda	%xcc,	%f30,	%f19
	edge16	%i7,	%l5,	%o6
	fmovsgu	%icc,	%f17,	%f6
	fornot1s	%f20,	%f7,	%f26
	umulcc	%o5,	0x1009,	%i2
	sllx	%i1,	0x14,	%i3
	fxnor	%f14,	%f30,	%f18
	fones	%f25
	edge16n	%l4,	%l0,	%g6
	lduw	[%l7 + 0x34],	%i0
	sdivx	%l3,	0x05A5,	%g3
	orcc	%l2,	0x007F,	%g7
	movcc	%icc,	%i6,	%o3
	fpsub32s	%f29,	%f12,	%f26
	addccc	%g2,	%o4,	%g5
	fabsd	%f26,	%f10
	fpmerge	%f5,	%f1,	%f2
	fmovrdne	%g4,	%f22,	%f12
	for	%f22,	%f12,	%f30
	ldd	[%l7 + 0x30],	%f16
	mulx	%i4,	0x111A,	%o0
	fmovrdlz	%o2,	%f14,	%f8
	fcmpes	%fcc1,	%f22,	%f8
	or	%l6,	0x08FD,	%l1
	edge16	%g1,	%i5,	%o7
	nop
	set	0x52, %o7
	lduh	[%l7 + %o7],	%o1
	edge8l	%l5,	%i7,	%o6
	subccc	%i2,	%o5,	%i1
	stb	%l4,	[%l7 + 0x15]
	mulscc	%l0,	0x16BF,	%g6
	movge	%xcc,	%i0,	%i3
	ldsh	[%l7 + 0x78],	%g3
	edge32n	%l3,	%l2,	%g7
	save %o3, 0x1945, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o4,	[%l7 + 0x33]
	fmovdn	%xcc,	%f1,	%f31
	fmovdpos	%icc,	%f19,	%f15
	xnorcc	%i6,	0x165C,	%g4
	edge16l	%g5,	%i4,	%o0
	xnorcc	%o2,	0x05C5,	%l6
	xnor	%l1,	%g1,	%i5
	movl	%xcc,	%o1,	%l5
	fmovrdgez	%i7,	%f10,	%f4
	add	%o6,	%i2,	%o5
	sth	%o7,	[%l7 + 0x56]
	edge16n	%i1,	%l4,	%l0
	sth	%i0,	[%l7 + 0x6A]
	faligndata	%f14,	%f22,	%f0
	umul	%i3,	%g6,	%l3
	fmovrdlz	%l2,	%f10,	%f16
	srlx	%g7,	%o3,	%g2
	smul	%g3,	0x03E8,	%i6
	movg	%xcc,	%o4,	%g4
	save %i4, %o0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f2,	%f2
	pdist	%f20,	%f20,	%f0
	umulcc	%l6,	%g5,	%l1
	ldsw	[%l7 + 0x14],	%g1
	srlx	%o1,	%i5,	%i7
	fmovsl	%icc,	%f6,	%f22
	edge16l	%o6,	%i2,	%o5
	fmovsl	%icc,	%f6,	%f19
	movg	%xcc,	%l5,	%i1
	fcmpeq16	%f16,	%f0,	%o7
	movge	%icc,	%l4,	%i0
	addccc	%i3,	%l0,	%l3
	umul	%g6,	%g7,	%l2
	movleu	%xcc,	%g2,	%g3
	fnands	%f10,	%f9,	%f13
	xnor	%o3,	%i6,	%o4
	sllx	%i4,	%o0,	%o2
	orncc	%g4,	%g5,	%l1
	move	%icc,	%l6,	%o1
	movpos	%icc,	%g1,	%i5
	fcmped	%fcc2,	%f30,	%f16
	subc	%o6,	0x1030,	%i7
	lduw	[%l7 + 0x50],	%o5
	fsrc1	%f12,	%f22
	fandnot1	%f0,	%f14,	%f10
	edge32l	%i2,	%l5,	%i1
	sdivx	%l4,	0x08CE,	%i0
	fmovrdgez	%i3,	%f22,	%f26
	fmovsa	%icc,	%f17,	%f23
	edge32l	%o7,	%l3,	%l0
	movrgz	%g7,	0x361,	%g6
	movne	%xcc,	%l2,	%g2
	movpos	%icc,	%o3,	%g3
	movvc	%xcc,	%i6,	%i4
	array16	%o0,	%o4,	%g4
	sdiv	%g5,	0x1BB6,	%o2
	edge8	%l6,	%o1,	%g1
	movleu	%xcc,	%l1,	%o6
	movgu	%xcc,	%i5,	%i7
	srax	%o5,	%i2,	%l5
	edge32	%l4,	%i1,	%i3
	movcc	%xcc,	%i0,	%o7
	sth	%l0,	[%l7 + 0x66]
	fmovdvs	%xcc,	%f3,	%f5
	movg	%icc,	%g7,	%l3
	movrgz	%l2,	0x22F,	%g6
	fmul8sux16	%f2,	%f10,	%f16
	stx	%o3,	[%l7 + 0x08]
	edge8n	%g2,	%i6,	%i4
	mova	%xcc,	%o0,	%g3
	udiv	%g4,	0x10F3,	%g5
	array8	%o4,	%o2,	%l6
	mova	%xcc,	%g1,	%o1
	lduh	[%l7 + 0x2C],	%o6
	edge16l	%l1,	%i7,	%o5
	mulscc	%i2,	0x0348,	%l5
	fnot1s	%f27,	%f17
	fpsub32	%f12,	%f20,	%f22
	alignaddr	%l4,	%i1,	%i3
	movvs	%xcc,	%i0,	%i5
	smulcc	%l0,	%g7,	%l3
	sethi	0x1A43,	%o7
	xnorcc	%l2,	%o3,	%g2
	stw	%g6,	[%l7 + 0x4C]
	umulcc	%i4,	%o0,	%g3
	movge	%xcc,	%g4,	%g5
	edge16l	%i6,	%o2,	%l6
	lduh	[%l7 + 0x24],	%g1
	edge16l	%o1,	%o4,	%l1
	umul	%i7,	0x0F4B,	%o5
	andn	%i2,	0x1AA5,	%l5
	edge32n	%o6,	%l4,	%i1
	sth	%i0,	[%l7 + 0x10]
	fexpand	%f3,	%f30
	movvs	%icc,	%i3,	%i5
	fnor	%f26,	%f6,	%f20
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	stb	%g7,	[%l7 + 0x17]
	std	%f10,	[%l7 + 0x28]
	umulcc	%l2,	%o7,	%g2
	fmovdvc	%icc,	%f12,	%f15
	ldsb	[%l7 + 0x27],	%o3
	movneg	%icc,	%g6,	%o0
	mova	%xcc,	%i4,	%g4
	sdivcc	%g5,	0x0F66,	%g3
	ldsb	[%l7 + 0x11],	%o2
	or	%i6,	%l6,	%g1
	ldx	[%l7 + 0x70],	%o1
	st	%f26,	[%l7 + 0x28]
	subccc	%l1,	%i7,	%o4
	orcc	%o5,	%i2,	%o6
	sll	%l4,	0x09,	%l5
	fmul8x16al	%f20,	%f2,	%f12
	sllx	%i0,	0x00,	%i1
	ldsh	[%l7 + 0x1A],	%i5
	movge	%icc,	%l0,	%l3
	stb	%i3,	[%l7 + 0x29]
	save %g7, %l2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o3,	%g2
	array8	%o0,	%i4,	%g6
	sdivcc	%g4,	0x150F,	%g3
	movpos	%xcc,	%o2,	%g5
	fnand	%f6,	%f14,	%f30
	edge8n	%l6,	%i6,	%o1
	edge8	%g1,	%l1,	%o4
	sdiv	%o5,	0x151E,	%i7
	smulcc	%i2,	%l4,	%l5
	movne	%xcc,	%o6,	%i1
	move	%xcc,	%i5,	%l0
	sth	%l3,	[%l7 + 0x2E]
	movle	%xcc,	%i3,	%g7
	addccc	%i0,	%o7,	%o3
	fpsub16s	%f24,	%f28,	%f4
	smulcc	%g2,	%o0,	%l2
	movrgz	%g6,	%i4,	%g3
	fpsub32	%f28,	%f14,	%f24
	subccc	%o2,	%g4,	%l6
	array16	%g5,	%o1,	%g1
	udiv	%i6,	0x1369,	%l1
	fnot1	%f28,	%f22
	fnors	%f27,	%f5,	%f13
	fmovsl	%xcc,	%f25,	%f11
	fmovsl	%icc,	%f29,	%f11
	andncc	%o4,	%i7,	%i2
	sllx	%o5,	0x1D,	%l5
	std	%f8,	[%l7 + 0x78]
	subcc	%o6,	0x0786,	%l4
	fnand	%f10,	%f10,	%f24
	movcc	%xcc,	%i1,	%i5
	fsrc1s	%f2,	%f25
	orncc	%l3,	%l0,	%g7
	udivcc	%i3,	0x1CFA,	%o7
	ldsh	[%l7 + 0x36],	%o3
	ldsh	[%l7 + 0x2E],	%i0
	movge	%icc,	%g2,	%l2
	fmovdcs	%xcc,	%f31,	%f17
	fandnot2s	%f22,	%f18,	%f8
	movge	%icc,	%o0,	%i4
	orncc	%g6,	0x13C6,	%o2
	orn	%g4,	0x0CCD,	%g3
	faligndata	%f6,	%f14,	%f14
	movn	%icc,	%l6,	%g5
	addc	%g1,	%i6,	%l1
	alignaddrl	%o4,	%i7,	%o1
	sth	%o5,	[%l7 + 0x1E]
	movgu	%icc,	%i2,	%l5
	xorcc	%o6,	%l4,	%i1
	srl	%i5,	0x16,	%l3
	move	%icc,	%g7,	%i3
	fcmpgt32	%f24,	%f10,	%l0
	ldsb	[%l7 + 0x4F],	%o7
	fsrc1	%f4,	%f28
	fmovsl	%icc,	%f6,	%f9
	movvs	%xcc,	%i0,	%g2
	stx	%l2,	[%l7 + 0x60]
	movl	%icc,	%o0,	%i4
	srl	%o3,	%o2,	%g4
	fmovrsgz	%g6,	%f8,	%f8
	movrlez	%l6,	0x2B5,	%g5
	fmovdneg	%icc,	%f6,	%f23
	sir	0x0E98
	movrlez	%g1,	%g3,	%l1
	stb	%o4,	[%l7 + 0x53]
	movvs	%xcc,	%i6,	%i7
	orn	%o5,	%i2,	%o1
	subcc	%o6,	0x1187,	%l4
	addcc	%l5,	%i5,	%l3
	fmovsg	%xcc,	%f3,	%f18
	stx	%g7,	[%l7 + 0x10]
	ld	[%l7 + 0x64],	%f17
	movle	%icc,	%i1,	%l0
	fmovdvs	%icc,	%f17,	%f22
	edge16	%o7,	%i3,	%i0
	fmovsg	%xcc,	%f29,	%f17
	movrlez	%l2,	%g2,	%i4
	movre	%o0,	0x0CC,	%o2
	addccc	%g4,	0x164A,	%g6
	subc	%l6,	0x0DD4,	%o3
	fpack32	%f26,	%f8,	%f26
	edge16l	%g1,	%g3,	%g5
	sll	%l1,	0x12,	%o4
	movre	%i7,	0x0C5,	%o5
	and	%i2,	0x1258,	%i6
	fpadd32	%f26,	%f14,	%f4
	edge16ln	%o6,	%o1,	%l4
	movvc	%xcc,	%l5,	%i5
	sdivx	%g7,	0x0E7C,	%l3
	fone	%f12
	fmovdneg	%xcc,	%f13,	%f29
	popc	%l0,	%i1
	subc	%o7,	%i3,	%i0
	and	%g2,	%i4,	%l2
	fcmpgt32	%f26,	%f30,	%o0
	fmuld8ulx16	%f1,	%f17,	%f16
	sir	0x14E2
	fmovrslez	%o2,	%f1,	%f30
	edge16n	%g4,	%l6,	%g6
	orcc	%g1,	%g3,	%g5
	and	%l1,	%o4,	%o3
	orncc	%i7,	0x1E4E,	%i2
	move	%xcc,	%o5,	%o6
	sub	%o1,	%i6,	%l5
	fmul8x16al	%f21,	%f13,	%f4
	srax	%i5,	%l4,	%g7
	fmovdleu	%xcc,	%f14,	%f16
	xorcc	%l3,	%i1,	%o7
	movpos	%icc,	%i3,	%i0
	xorcc	%l0,	0x15CB,	%i4
	orncc	%g2,	0x1902,	%o0
	movrlz	%o2,	0x21B,	%g4
	sll	%l2,	0x08,	%l6
	orcc	%g6,	%g1,	%g3
	alignaddr	%g5,	%l1,	%o3
	orcc	%i7,	0x12B5,	%i2
	ldd	[%l7 + 0x38],	%f2
	movcc	%icc,	%o4,	%o6
	fnor	%f18,	%f24,	%f18
	ldx	[%l7 + 0x68],	%o1
	movvs	%icc,	%o5,	%l5
	fcmpd	%fcc0,	%f2,	%f8
	sethi	0x1DFE,	%i5
	fmovdn	%xcc,	%f1,	%f10
	std	%f22,	[%l7 + 0x10]
	sdivcc	%l4,	0x1976,	%g7
	fmovdvc	%icc,	%f25,	%f22
	sethi	0x0B6E,	%i6
	movvc	%xcc,	%l3,	%i1
	fornot2s	%f16,	%f30,	%f28
	fmovspos	%xcc,	%f3,	%f27
	edge16ln	%o7,	%i0,	%l0
	st	%f3,	[%l7 + 0x38]
	nop
	set	0x78, %o5
	sth	%i3,	[%l7 + %o5]
	fcmps	%fcc2,	%f20,	%f1
	stb	%g2,	[%l7 + 0x3B]
	array8	%i4,	%o2,	%g4
	fmovrdlz	%o0,	%f14,	%f10
	edge16l	%l2,	%g6,	%l6
	restore %g1, 0x1D60, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f0
	fmovrdgez	%g3,	%f22,	%f2
	srl	%o3,	%l1,	%i7
	movn	%icc,	%o4,	%i2
	ld	[%l7 + 0x18],	%f24
	srl	%o6,	0x10,	%o5
	sdivcc	%l5,	0x0BB7,	%o1
	edge16n	%l4,	%g7,	%i6
	array16	%i5,	%i1,	%o7
	mulx	%l3,	%i0,	%l0
	sir	0x116E
	fsrc2s	%f28,	%f30
	xnorcc	%g2,	%i4,	%o2
	xor	%i3,	0x184B,	%g4
	fmovdleu	%xcc,	%f27,	%f27
	movge	%xcc,	%l2,	%o0
	fmovsn	%icc,	%f4,	%f13
	edge32	%g6,	%g1,	%g5
	movn	%xcc,	%g3,	%l6
	srlx	%l1,	%o3,	%i7
	fmul8x16al	%f1,	%f7,	%f8
	movre	%o4,	%o6,	%o5
	stx	%l5,	[%l7 + 0x60]
	fmovdl	%xcc,	%f2,	%f0
	movcs	%icc,	%i2,	%l4
	orcc	%o1,	%i6,	%g7
	popc	0x1731,	%i5
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	fandnot2	%f24,	%f18,	%f8
	fandnot2	%f24,	%f30,	%f22
	save %l0, 0x146C, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%xcc,	%f24,	%f16
	movge	%icc,	%i4,	%o2
	orn	%i3,	0x17FA,	%g4
	srlx	%o7,	%l2,	%o0
	movrlez	%g6,	0x001,	%g5
	ldsh	[%l7 + 0x16],	%g1
	lduw	[%l7 + 0x0C],	%l6
	movcs	%xcc,	%g3,	%o3
	sdivx	%i7,	0x1252,	%l1
	andncc	%o6,	%o5,	%l5
	edge16n	%i2,	%l4,	%o1
	std	%f28,	[%l7 + 0x28]
	fpsub16s	%f8,	%f8,	%f2
	edge16	%i6,	%o4,	%g7
	edge16n	%i5,	%i1,	%l3
	movpos	%xcc,	%l0,	%g2
	udiv	%i4,	0x0851,	%i0
	edge32	%i3,	%g4,	%o7
	movrlez	%o2,	0x151,	%l2
	fornot1s	%f19,	%f4,	%f20
	stx	%g6,	[%l7 + 0x28]
	st	%f27,	[%l7 + 0x34]
	sdivx	%g5,	0x1584,	%g1
	movle	%icc,	%o0,	%g3
	xorcc	%o3,	%i7,	%l6
	fmovrslez	%o6,	%f30,	%f25
	fsrc2	%f18,	%f30
	movgu	%icc,	%o5,	%l5
	lduw	[%l7 + 0x6C],	%l1
	restore %l4, 0x093B, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x58],	%i2
	movvs	%xcc,	%o4,	%g7
	fcmpne16	%f22,	%f26,	%i6
	fandnot2s	%f27,	%f11,	%f4
	movleu	%icc,	%i5,	%i1
	mulscc	%l0,	0x01B2,	%g2
	andn	%l3,	0x1FCF,	%i4
	sra	%i0,	0x1A,	%i3
	subcc	%g4,	%o7,	%o2
	edge32	%g6,	%g5,	%l2
	move	%icc,	%g1,	%o0
	stw	%g3,	[%l7 + 0x24]
	movpos	%xcc,	%i7,	%o3
	ldub	[%l7 + 0x1D],	%o6
	andcc	%o5,	0x04A7,	%l5
	andcc	%l6,	0x0D87,	%l1
	andn	%l4,	%i2,	%o4
	ldd	[%l7 + 0x40],	%f0
	fpsub16	%f8,	%f24,	%f0
	edge32	%o1,	%g7,	%i6
	fpmerge	%f13,	%f10,	%f24
	movvc	%xcc,	%i1,	%i5
	subcc	%l0,	0x09BE,	%g2
	edge32l	%l3,	%i0,	%i3
	movge	%xcc,	%i4,	%g4
	fmul8sux16	%f14,	%f0,	%f16
	ld	[%l7 + 0x6C],	%f8
	fcmpeq16	%f10,	%f14,	%o2
	edge8n	%g6,	%g5,	%o7
	fxnor	%f18,	%f8,	%f24
	smul	%l2,	0x199C,	%o0
	fpmerge	%f25,	%f16,	%f16
	orcc	%g1,	0x1CCF,	%g3
	and	%i7,	%o3,	%o6
	movpos	%icc,	%o5,	%l5
	movne	%xcc,	%l6,	%l4
	movneg	%icc,	%l1,	%o4
	fcmple32	%f2,	%f8,	%i2
	movpos	%icc,	%g7,	%i6
	mulscc	%o1,	0x032D,	%i5
	movne	%xcc,	%i1,	%g2
	stw	%l0,	[%l7 + 0x48]
	movpos	%icc,	%i0,	%i3
	ldx	[%l7 + 0x30],	%i4
	fmovscs	%xcc,	%f1,	%f18
	smul	%g4,	%l3,	%o2
	edge16ln	%g5,	%o7,	%g6
	fone	%f20
	fzeros	%f20
	subc	%l2,	0x0A17,	%g1
	sdivcc	%o0,	0x1091,	%g3
	movge	%icc,	%i7,	%o6
	mulx	%o5,	0x09A5,	%o3
	edge8l	%l6,	%l4,	%l1
	edge32	%l5,	%i2,	%g7
	fornot2	%f4,	%f20,	%f26
	ld	[%l7 + 0x48],	%f2
	ldd	[%l7 + 0x08],	%f4
	array16	%o4,	%i6,	%i5
	udiv	%o1,	0x1170,	%i1
	nop
	set	0x10, %l4
	std	%f28,	[%l7 + %l4]
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%g2
	fmovspos	%xcc,	%f11,	%f25
	alignaddrl	%l0,	%i3,	%i4
	andncc	%i0,	%g4,	%l3
	edge8ln	%o2,	%o7,	%g6
	addcc	%g5,	0x0A6C,	%g1
	sethi	0x1B61,	%l2
	srlx	%g3,	0x05,	%i7
	save %o0, 0x1D12, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	pdist	%f14,	%f14,	%f2
	sth	%o3,	[%l7 + 0x56]
	fpack16	%f22,	%f18
	addccc	%o6,	%l6,	%l1
	fmovrsgez	%l5,	%f29,	%f8
	ldd	[%l7 + 0x48],	%f14
	xorcc	%i2,	0x15EA,	%l4
	udiv	%g7,	0x0566,	%i6
	orcc	%o4,	%o1,	%i5
	addcc	%g2,	0x1346,	%i1
	movneg	%icc,	%l0,	%i3
	popc	0x1E8E,	%i0
	add	%g4,	0x1E2C,	%l3
	orncc	%i4,	%o2,	%o7
	sra	%g5,	0x06,	%g1
	movvc	%xcc,	%l2,	%g6
	edge8	%i7,	%g3,	%o0
	movge	%xcc,	%o3,	%o6
	array16	%l6,	%o5,	%l5
	xnorcc	%l1,	%l4,	%g7
	or	%i2,	0x02A4,	%i6
	movne	%xcc,	%o4,	%i5
	udivx	%g2,	0x1FFC,	%i1
	andcc	%o1,	%l0,	%i0
	movl	%xcc,	%i3,	%g4
	movrgz	%l3,	0x3A2,	%o2
	sth	%i4,	[%l7 + 0x1E]
	movvs	%icc,	%o7,	%g5
	fxnors	%f15,	%f6,	%f9
	addccc	%g1,	0x1606,	%g6
	movcc	%icc,	%l2,	%g3
	lduw	[%l7 + 0x54],	%i7
	edge16l	%o0,	%o6,	%l6
	andncc	%o3,	%l5,	%o5
	edge32ln	%l4,	%l1,	%i2
	stx	%g7,	[%l7 + 0x10]
	movgu	%icc,	%o4,	%i6
	edge8n	%i5,	%g2,	%i1
	movpos	%icc,	%o1,	%l0
	srlx	%i3,	0x18,	%g4
	ldub	[%l7 + 0x39],	%l3
	movrlez	%o2,	0x225,	%i0
	array32	%o7,	%i4,	%g5
	movrlz	%g1,	0x095,	%l2
	fpadd16	%f24,	%f14,	%f20
	xnor	%g3,	%i7,	%g6
	xor	%o6,	0x1745,	%l6
	fnot1	%f10,	%f14
	movrgez	%o0,	0x2E8,	%l5
	fpadd16	%f28,	%f10,	%f12
	ldub	[%l7 + 0x50],	%o3
	move	%xcc,	%o5,	%l1
	xnorcc	%l4,	%g7,	%i2
	subccc	%i6,	%o4,	%g2
	movn	%xcc,	%i1,	%o1
	ldx	[%l7 + 0x78],	%l0
	andncc	%i5,	%g4,	%l3
	edge16ln	%i3,	%i0,	%o7
	movcs	%icc,	%o2,	%g5
	save %g1, %i4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f30,	%f0
	add	%i7,	0x1BF6,	%l2
	sdivcc	%g6,	0x14B0,	%o6
	movl	%icc,	%l6,	%l5
	fpadd32s	%f11,	%f1,	%f23
	movrgez	%o3,	%o0,	%l1
	movrne	%o5,	0x136,	%g7
	edge16	%i2,	%i6,	%l4
	edge16	%g2,	%o4,	%i1
	fmovdg	%icc,	%f29,	%f4
	edge8ln	%l0,	%i5,	%o1
	sub	%g4,	0x1ACA,	%i3
	movl	%xcc,	%l3,	%o7
	fexpand	%f25,	%f10
	edge32	%o2,	%i0,	%g5
	fmul8x16au	%f7,	%f24,	%f0
	movg	%icc,	%g1,	%g3
	sdiv	%i7,	0x12DE,	%i4
	movrgz	%g6,	0x2AF,	%o6
	nop
	set	0x6E, %l2
	sth	%l2,	[%l7 + %l2]
	srax	%l5,	%o3,	%o0
	movg	%xcc,	%l1,	%l6
	st	%f25,	[%l7 + 0x5C]
	smul	%o5,	0x15ED,	%g7
	orcc	%i2,	%l4,	%g2
	mulx	%o4,	0x0553,	%i1
	edge16n	%i6,	%i5,	%o1
	fsrc1s	%f31,	%f12
	smul	%l0,	%g4,	%i3
	add	%l3,	%o2,	%o7
	movg	%xcc,	%g5,	%g1
	subcc	%g3,	0x190E,	%i0
	faligndata	%f6,	%f26,	%f20
	fmovscc	%xcc,	%f18,	%f0
	fxnor	%f22,	%f26,	%f26
	sub	%i4,	%g6,	%o6
	fcmpeq16	%f18,	%f10,	%l2
	andncc	%l5,	%o3,	%o0
	movrlez	%i7,	0x2F4,	%l1
	fmovscc	%xcc,	%f19,	%f28
	sdivcc	%l6,	0x0821,	%g7
	and	%o5,	%l4,	%g2
	addcc	%o4,	%i1,	%i6
	movleu	%icc,	%i5,	%o1
	stb	%i2,	[%l7 + 0x57]
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%f18
	nop
	set	0x54, %i7
	lduw	[%l7 + %i7],	%l0
	edge32n	%g4,	%i3,	%l3
	fmovrslez	%o2,	%f24,	%f4
	fmovsne	%xcc,	%f29,	%f4
	edge32	%o7,	%g5,	%g3
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	fmovrslez	%g1,	%f4,	%f12
	fmovrse	%o6,	%f27,	%f24
	fmovrse	%g6,	%f9,	%f0
	movrne	%l5,	0x2F4,	%l2
	popc	0x1AA4,	%o3
	popc	%i7,	%o0
	andncc	%l6,	%g7,	%l1
	subccc	%o5,	%g2,	%o4
	andn	%l4,	%i6,	%i1
	sth	%i5,	[%l7 + 0x68]
	xnor	%i2,	%o1,	%g4
	srax	%l0,	0x00,	%i3
	fmovscs	%icc,	%f27,	%f0
	move	%xcc,	%l3,	%o7
	nop
	set	0x33, %l1
	ldsb	[%l7 + %l1],	%g5
	movne	%xcc,	%g3,	%i0
	fabsd	%f2,	%f4
	fmovd	%f16,	%f22
	fmul8sux16	%f0,	%f6,	%f4
	sir	0x17F7
	addcc	%o2,	0x01CE,	%i4
	nop
	set	0x30, %o0
	stx	%o6,	[%l7 + %o0]
	fandnot1s	%f26,	%f9,	%f13
	movrgez	%g1,	0x1C8,	%l5
	movre	%l2,	%g6,	%o3
	st	%f22,	[%l7 + 0x74]
	array16	%i7,	%o0,	%g7
	udivx	%l1,	0x145D,	%o5
	edge32l	%g2,	%o4,	%l4
	orn	%l6,	0x1EB6,	%i1
	fmovdle	%xcc,	%f2,	%f22
	fmovrdgez	%i6,	%f4,	%f4
	fandnot2	%f8,	%f6,	%f2
	movrlz	%i5,	%i2,	%g4
	restore %l0, 0x04EA, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i3,	%l3,	%g5
	movrgz	%g3,	%o7,	%i0
	umul	%o2,	%i4,	%o6
	fpsub32s	%f6,	%f7,	%f10
	subc	%g1,	0x0B40,	%l2
	fmovdneg	%xcc,	%f23,	%f15
	sir	0x1E4C
	alignaddrl	%l5,	%g6,	%o3
	fmovde	%xcc,	%f7,	%f27
	fxors	%f6,	%f18,	%f11
	edge32l	%o0,	%i7,	%g7
	fmovdg	%xcc,	%f2,	%f23
	movg	%xcc,	%o5,	%l1
	st	%f14,	[%l7 + 0x10]
	fmovdcc	%icc,	%f1,	%f29
	andncc	%o4,	%l4,	%l6
	ld	[%l7 + 0x0C],	%f25
	movcc	%icc,	%g2,	%i6
	ldsw	[%l7 + 0x2C],	%i5
	fmuld8sux16	%f8,	%f21,	%f22
	edge16l	%i2,	%g4,	%l0
	andcc	%o1,	%i3,	%l3
	movrgez	%i1,	0x00B,	%g5
	sth	%g3,	[%l7 + 0x5A]
	smulcc	%i0,	%o2,	%i4
	edge32	%o7,	%o6,	%l2
	umulcc	%g1,	0x1E83,	%g6
	fcmpne16	%f0,	%f18,	%o3
	movgu	%xcc,	%l5,	%i7
	stb	%o0,	[%l7 + 0x3F]
	xnor	%o5,	%l1,	%o4
	ldub	[%l7 + 0x1D],	%g7
	ldx	[%l7 + 0x08],	%l4
	nop
	set	0x68, %i5
	ldx	[%l7 + %i5],	%g2
	orn	%i6,	%l6,	%i5
	array32	%i2,	%g4,	%o1
	sir	0x1B4C
	ldsb	[%l7 + 0x32],	%l0
	movpos	%icc,	%l3,	%i1
	lduh	[%l7 + 0x20],	%g5
	stw	%g3,	[%l7 + 0x6C]
	ld	[%l7 + 0x60],	%f16
	ldsh	[%l7 + 0x28],	%i3
	movrne	%i0,	%i4,	%o7
	stb	%o2,	[%l7 + 0x10]
	xnorcc	%l2,	0x1F78,	%g1
	ldub	[%l7 + 0x3C],	%o6
	ldsh	[%l7 + 0x42],	%o3
	addcc	%l5,	0x0656,	%i7
	fabss	%f13,	%f4
	addccc	%g6,	%o0,	%l1
	fsrc2s	%f10,	%f18
	edge8l	%o5,	%o4,	%l4
	sdiv	%g7,	0x1BBE,	%i6
	andn	%l6,	%g2,	%i2
	move	%icc,	%g4,	%o1
	ldsh	[%l7 + 0x76],	%l0
	umulcc	%l3,	0x0BCD,	%i5
	ldub	[%l7 + 0x76],	%i1
	fmovdcs	%icc,	%f11,	%f24
	movrgez	%g3,	%g5,	%i3
	movcc	%xcc,	%i4,	%i0
	siam	0x1
	sdivcc	%o7,	0x002B,	%l2
	smulcc	%g1,	%o6,	%o2
	or	%l5,	%o3,	%i7
	edge32l	%g6,	%l1,	%o0
	ldsh	[%l7 + 0x0E],	%o5
	st	%f2,	[%l7 + 0x70]
	movpos	%icc,	%o4,	%g7
	smul	%i6,	0x14E4,	%l4
	movrgz	%g2,	0x240,	%i2
	nop
	set	0x4E, %l3
	lduh	[%l7 + %l3],	%l6
	umulcc	%g4,	0x0FD8,	%l0
	xor	%l3,	%o1,	%i5
	fmovdg	%icc,	%f19,	%f27
	ldsh	[%l7 + 0x08],	%i1
	lduw	[%l7 + 0x2C],	%g5
	fnegs	%f14,	%f21
	edge16l	%i3,	%g3,	%i4
	movg	%icc,	%o7,	%i0
	ldx	[%l7 + 0x50],	%l2
	add	%g1,	0x1EEA,	%o2
	sllx	%o6,	%l5,	%o3
	movrlez	%g6,	0x045,	%l1
	addccc	%i7,	%o0,	%o5
	orcc	%o4,	0x00FE,	%g7
	movvc	%xcc,	%i6,	%l4
	umul	%g2,	%i2,	%l6
	ldub	[%l7 + 0x26],	%g4
	alignaddrl	%l0,	%o1,	%l3
	andcc	%i1,	0x12A2,	%g5
	sdivx	%i5,	0x1096,	%i3
	stb	%i4,	[%l7 + 0x17]
	fmovrdne	%g3,	%f24,	%f2
	sth	%o7,	[%l7 + 0x3E]
	st	%f6,	[%l7 + 0x4C]
	movge	%xcc,	%i0,	%l2
	st	%f14,	[%l7 + 0x68]
	movpos	%icc,	%g1,	%o2
	addccc	%l5,	0x0E81,	%o3
	fpsub32	%f16,	%f0,	%f30
	fxors	%f23,	%f31,	%f30
	sra	%o6,	0x11,	%l1
	ldsb	[%l7 + 0x31],	%i7
	sth	%o0,	[%l7 + 0x42]
	nop
	set	0x76, %l5
	lduh	[%l7 + %l5],	%g6
	fmovsne	%xcc,	%f8,	%f27
	mova	%xcc,	%o5,	%o4
	fpackfix	%f0,	%f4
	mulx	%g7,	%i6,	%g2
	mova	%icc,	%l4,	%l6
	movrgez	%i2,	%l0,	%g4
	move	%xcc,	%o1,	%l3
	sdivx	%g5,	0x0963,	%i1
	fmovsl	%icc,	%f19,	%f26
	edge8	%i5,	%i4,	%g3
	ldd	[%l7 + 0x18],	%f2
	edge8ln	%o7,	%i0,	%i3
	ldsb	[%l7 + 0x65],	%l2
	movneg	%xcc,	%o2,	%l5
	edge8ln	%o3,	%o6,	%l1
	edge32ln	%i7,	%g1,	%o0
	sdivcc	%g6,	0x0B41,	%o4
	srax	%g7,	0x06,	%o5
	edge8	%g2,	%i6,	%l4
	fand	%f10,	%f30,	%f2
	pdist	%f4,	%f16,	%f8
	movrne	%l6,	%i2,	%l0
	fnor	%f30,	%f6,	%f6
	srax	%g4,	%l3,	%g5
	edge32l	%o1,	%i5,	%i4
	edge8ln	%g3,	%o7,	%i0
	fmovrslz	%i1,	%f2,	%f21
	movcs	%icc,	%i3,	%l2
	orn	%o2,	%l5,	%o3
	popc	0x1081,	%o6
	save %l1, 0x0F74, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f18,	%f4,	%f4
	edge8l	%o0,	%g6,	%o4
	stb	%g1,	[%l7 + 0x2A]
	move	%icc,	%g7,	%o5
	movpos	%xcc,	%g2,	%l4
	movvc	%icc,	%l6,	%i2
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fpadd32s	%f31,	%f10,	%f16
	fmovdge	%xcc,	%f30,	%f23
	orncc	%l3,	%o1,	%i5
	fnors	%f11,	%f20,	%f6
	fmul8ulx16	%f26,	%f18,	%f20
	movrlez	%g5,	%i4,	%o7
	movcs	%xcc,	%i0,	%i1
	orncc	%i3,	0x0052,	%g3
	array16	%l2,	%l5,	%o2
	ldd	[%l7 + 0x38],	%f22
	subcc	%o3,	0x05E5,	%o6
	mova	%xcc,	%l1,	%i7
	sir	0x1E43
	alignaddr	%g6,	%o0,	%o4
	movleu	%xcc,	%g1,	%o5
	srlx	%g7,	%g2,	%l6
	andn	%i2,	%l4,	%g4
	add	%i6,	0x0495,	%l3
	movrgz	%l0,	%i5,	%g5
	array32	%i4,	%o7,	%o1
	udivx	%i1,	0x157C,	%i3
	xorcc	%i0,	0x19D5,	%g3
	subcc	%l2,	%l5,	%o2
	stb	%o6,	[%l7 + 0x2F]
	movn	%icc,	%o3,	%l1
	movrgez	%i7,	0x1F3,	%g6
	edge32n	%o4,	%o0,	%g1
	fnands	%f24,	%f17,	%f21
	nop
	set	0x68, %g6
	sth	%o5,	[%l7 + %g6]
	edge32ln	%g7,	%l6,	%g2
	fcmpne16	%f30,	%f16,	%l4
	smulcc	%g4,	%i2,	%l3
	bshuffle	%f22,	%f2,	%f0
	subc	%l0,	0x00BE,	%i6
	ldsb	[%l7 + 0x30],	%g5
	movne	%xcc,	%i4,	%o7
	andncc	%i5,	%o1,	%i1
	nop
	set	0x70, %l0
	lduw	[%l7 + %l0],	%i3
	array16	%i0,	%l2,	%g3
	udivx	%l5,	0x1E38,	%o6
	movrgez	%o3,	%o2,	%l1
	fmovdcc	%xcc,	%f16,	%f7
	faligndata	%f18,	%f10,	%f8
	edge32n	%g6,	%o4,	%i7
	umulcc	%g1,	0x182F,	%o0
	popc	0x0121,	%o5
	movrlz	%g7,	%l6,	%g2
	fmovdge	%icc,	%f20,	%f15
	movle	%icc,	%l4,	%i2
	popc	0x13B8,	%g4
	movvs	%xcc,	%l3,	%l0
	orn	%i6,	%i4,	%o7
	andn	%i5,	%g5,	%i1
	fmuld8ulx16	%f30,	%f7,	%f18
	xorcc	%i3,	%i0,	%l2
	fpadd32s	%f17,	%f3,	%f11
	ldd	[%l7 + 0x30],	%o0
	sdiv	%g3,	0x1FD2,	%o6
	stb	%l5,	[%l7 + 0x19]
	movcc	%icc,	%o2,	%o3
	edge32l	%l1,	%o4,	%i7
	fandnot1	%f4,	%f18,	%f18
	fmovdg	%xcc,	%f16,	%f30
	fmovdge	%xcc,	%f9,	%f23
	srax	%g1,	0x16,	%g6
	ldsh	[%l7 + 0x1E],	%o5
	fmovdcc	%xcc,	%f10,	%f9
	fmovdle	%xcc,	%f28,	%f11
	subc	%o0,	0x08E1,	%g7
	movcc	%xcc,	%l6,	%l4
	movle	%icc,	%g2,	%g4
	orcc	%l3,	%l0,	%i2
	edge32ln	%i6,	%o7,	%i5
	movcs	%xcc,	%g5,	%i4
	movrgez	%i1,	%i3,	%l2
	fcmple16	%f28,	%f30,	%i0
	movpos	%xcc,	%o1,	%g3
	alignaddr	%o6,	%o2,	%o3
	fmovdneg	%xcc,	%f24,	%f18
	move	%icc,	%l5,	%l1
	sth	%o4,	[%l7 + 0x50]
	fnot1s	%f29,	%f10
	sethi	0x0681,	%g1
	umul	%g6,	%o5,	%i7
	ldsh	[%l7 + 0x78],	%o0
	fcmpne32	%f0,	%f16,	%g7
	umulcc	%l6,	0x14FD,	%l4
	fmovd	%f8,	%f4
	popc	0x0EAB,	%g2
	ldd	[%l7 + 0x70],	%f22
	edge8l	%l3,	%l0,	%g4
	xnor	%i2,	%o7,	%i5
	movl	%icc,	%i6,	%g5
	udivcc	%i4,	0x142D,	%i1
	stb	%l2,	[%l7 + 0x1A]
	xorcc	%i3,	0x0966,	%o1
	fsrc2s	%f22,	%f26
	movgu	%icc,	%i0,	%g3
	addcc	%o6,	%o2,	%l5
	edge8ln	%o3,	%l1,	%g1
	fzero	%f30
	sth	%o4,	[%l7 + 0x34]
	ldsw	[%l7 + 0x74],	%o5
	fmovsle	%xcc,	%f17,	%f29
	movpos	%xcc,	%i7,	%o0
	mova	%icc,	%g6,	%g7
	fmovdpos	%xcc,	%f20,	%f7
	array32	%l6,	%l4,	%l3
	stw	%g2,	[%l7 + 0x4C]
	fxnors	%f4,	%f23,	%f4
	fcmpgt16	%f10,	%f30,	%g4
	array8	%l0,	%i2,	%i5
	umul	%o7,	%g5,	%i6
	sub	%i1,	0x1A99,	%i4
	fpadd16s	%f31,	%f26,	%f11
	umulcc	%l2,	0x0556,	%o1
	fand	%f18,	%f22,	%f20
	smul	%i3,	%g3,	%i0
	srl	%o2,	%l5,	%o3
	array16	%o6,	%g1,	%o4
	ldx	[%l7 + 0x40],	%o5
	xnor	%i7,	0x0900,	%o0
	movrlz	%l1,	%g7,	%l6
	fsrc1	%f10,	%f18
	fmovrdne	%g6,	%f26,	%f2
	movrlez	%l4,	0x01E,	%g2
	edge16ln	%l3,	%l0,	%g4
	andncc	%i2,	%i5,	%o7
	edge8n	%i6,	%g5,	%i4
	fmul8x16al	%f14,	%f13,	%f24
	fmovrslez	%l2,	%f3,	%f27
	st	%f22,	[%l7 + 0x6C]
	sdiv	%o1,	0x10C2,	%i3
	mulx	%g3,	%i0,	%i1
	orn	%l5,	%o3,	%o2
	fmovsvs	%icc,	%f21,	%f31
	edge8	%o6,	%o4,	%o5
	lduh	[%l7 + 0x5C],	%g1
	andcc	%o0,	0x0B2E,	%i7
	fmovd	%f16,	%f24
	movrgez	%g7,	%l6,	%g6
	movne	%icc,	%l1,	%l4
	alignaddrl	%l3,	%l0,	%g2
	fpackfix	%f30,	%f22
	alignaddr	%i2,	%i5,	%g4
	ldx	[%l7 + 0x18],	%i6
	or	%o7,	0x082E,	%g5
	array32	%l2,	%i4,	%o1
	movpos	%xcc,	%g3,	%i3
	movg	%icc,	%i1,	%l5
	ldub	[%l7 + 0x1F],	%i0
	ldsb	[%l7 + 0x3F],	%o2
	movge	%xcc,	%o6,	%o3
	movrne	%o5,	%o4,	%o0
	orcc	%g1,	%i7,	%g7
	umulcc	%g6,	0x1AAE,	%l6
	sdiv	%l1,	0x118F,	%l3
	edge16l	%l4,	%l0,	%i2
	fmovdvs	%icc,	%f25,	%f25
	xnorcc	%g2,	0x14F6,	%i5
	fcmple16	%f28,	%f28,	%g4
	fmovdle	%icc,	%f30,	%f19
	fornot2s	%f2,	%f11,	%f13
	move	%xcc,	%o7,	%i6
	edge16l	%g5,	%l2,	%o1
	movpos	%icc,	%i4,	%i3
	fmovdleu	%icc,	%f12,	%f0
	fmovdn	%icc,	%f19,	%f5
	udivcc	%g3,	0x16AF,	%i1
	or	%l5,	%o2,	%i0
	movrgez	%o3,	0x3CD,	%o5
	andcc	%o6,	%o4,	%g1
	for	%f24,	%f2,	%f0
	udivcc	%i7,	0x1B98,	%g7
	add	%g6,	%l6,	%o0
	fcmple16	%f14,	%f14,	%l1
	edge8l	%l3,	%l4,	%i2
	movvs	%xcc,	%g2,	%i5
	orn	%l0,	%o7,	%i6
	orcc	%g4,	0x02D8,	%l2
	fmovsgu	%xcc,	%f8,	%f19
	fmovsa	%icc,	%f23,	%f16
	movrlez	%g5,	0x216,	%o1
	srax	%i4,	0x1C,	%g3
	edge32l	%i3,	%i1,	%l5
	sdivcc	%o2,	0x0443,	%i0
	sllx	%o5,	0x08,	%o6
	orn	%o3,	0x0591,	%o4
	movneg	%icc,	%i7,	%g7
	ldsb	[%l7 + 0x44],	%g1
	and	%g6,	%l6,	%l1
	movge	%icc,	%o0,	%l3
	sth	%l4,	[%l7 + 0x54]
	sdivx	%g2,	0x05E8,	%i2
	movne	%xcc,	%l0,	%i5
	ldsh	[%l7 + 0x10],	%o7
	fmovdgu	%icc,	%f20,	%f26
	fpadd16	%f20,	%f22,	%f24
	fzeros	%f31
	sdivcc	%g4,	0x1E22,	%i6
	ldub	[%l7 + 0x27],	%g5
	edge8ln	%o1,	%l2,	%g3
	addcc	%i4,	0x1A70,	%i1
	fmovdcc	%icc,	%f4,	%f0
	sub	%l5,	%i3,	%o2
	srlx	%i0,	0x07,	%o5
	edge32l	%o6,	%o4,	%o3
	movn	%icc,	%i7,	%g7
	mulx	%g6,	%g1,	%l6
	fmovse	%xcc,	%f26,	%f28
	addccc	%o0,	%l1,	%l4
	st	%f8,	[%l7 + 0x1C]
	edge8l	%l3,	%g2,	%i2
	fmul8sux16	%f24,	%f10,	%f16
	movn	%xcc,	%i5,	%l0
	ldsb	[%l7 + 0x33],	%g4
	alignaddr	%o7,	%i6,	%o1
	movleu	%icc,	%g5,	%l2
	fnot1s	%f29,	%f18
	xor	%g3,	0x0F6E,	%i1
	movpos	%xcc,	%i4,	%i3
	lduh	[%l7 + 0x28],	%l5
	stb	%i0,	[%l7 + 0x30]
	movrgz	%o5,	%o6,	%o2
	edge8	%o4,	%i7,	%o3
	xnorcc	%g6,	%g1,	%l6
	movvs	%icc,	%g7,	%l1
	edge32ln	%l4,	%o0,	%l3
	edge16l	%i2,	%i5,	%g2
	udivcc	%g4,	0x0C28,	%l0
	popc	0x0831,	%o7
	udivx	%o1,	0x1420,	%g5
	edge32ln	%i6,	%g3,	%l2
	fmovscc	%icc,	%f1,	%f17
	mulscc	%i1,	%i3,	%i4
	fmovsge	%xcc,	%f20,	%f6
	save %i0, 0x0AA1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f0,	%f20,	%o6
	smul	%o5,	0x1754,	%o4
	fcmps	%fcc2,	%f27,	%f24
	udivcc	%i7,	0x1CB2,	%o2
	for	%f6,	%f20,	%f10
	edge32l	%o3,	%g6,	%g1
	fmovspos	%xcc,	%f18,	%f8
	stw	%l6,	[%l7 + 0x30]
	ldsh	[%l7 + 0x7C],	%g7
	fnegs	%f7,	%f10
	stw	%l1,	[%l7 + 0x30]
	sth	%o0,	[%l7 + 0x3A]
	xnorcc	%l4,	0x0A79,	%i2
	srax	%l3,	0x02,	%i5
	fmovscc	%xcc,	%f21,	%f24
	movg	%xcc,	%g2,	%g4
	fxor	%f26,	%f30,	%f14
	mulscc	%l0,	%o7,	%o1
	fmovde	%icc,	%f17,	%f6
	fnegd	%f28,	%f30
	orcc	%i6,	%g5,	%g3
	smulcc	%l2,	0x1EEF,	%i3
	subcc	%i1,	0x1C5B,	%i4
	orncc	%l5,	%i0,	%o6
	edge8n	%o5,	%o4,	%o2
	sth	%i7,	[%l7 + 0x0C]
	addccc	%o3,	%g1,	%g6
	ld	[%l7 + 0x5C],	%f30
	ldsw	[%l7 + 0x58],	%g7
	edge16ln	%l6,	%o0,	%l1
	edge16ln	%i2,	%l3,	%i5
	xnor	%l4,	%g2,	%g4
	fabss	%f4,	%f9
	nop
	set	0x44, %g1
	ldub	[%l7 + %g1],	%l0
	sllx	%o7,	%i6,	%g5
	ldsw	[%l7 + 0x48],	%g3
	alignaddr	%o1,	%l2,	%i1
	fmovsa	%xcc,	%f17,	%f24
	or	%i3,	%i4,	%i0
	movvs	%icc,	%o6,	%l5
	fmovsn	%xcc,	%f28,	%f12
	fxor	%f20,	%f4,	%f24
	movvc	%xcc,	%o5,	%o2
	fmovdgu	%xcc,	%f4,	%f3
	smulcc	%o4,	0x1952,	%o3
	movrgez	%g1,	%i7,	%g6
	faligndata	%f30,	%f6,	%f18
	edge16l	%l6,	%g7,	%o0
	movrne	%l1,	%i2,	%l3
	xor	%l4,	0x1A1D,	%i5
	umulcc	%g2,	%l0,	%o7
	movrgez	%i6,	%g5,	%g3
	andncc	%g4,	%o1,	%i1
	andncc	%l2,	%i3,	%i0
	fpsub32s	%f3,	%f25,	%f31
	edge16n	%i4,	%l5,	%o5
	fandnot1s	%f14,	%f17,	%f20
	sdiv	%o2,	0x146E,	%o6
	srl	%o3,	%g1,	%i7
	movvc	%icc,	%o4,	%l6
	movrgez	%g6,	%o0,	%l1
	umulcc	%g7,	0x0A5D,	%i2
	edge8l	%l3,	%i5,	%g2
	movcc	%icc,	%l0,	%o7
	edge8ln	%l4,	%i6,	%g5
	fpsub16	%f18,	%f20,	%f12
	fzeros	%f5
	addcc	%g4,	%o1,	%i1
	movvs	%icc,	%l2,	%i3
	ldd	[%l7 + 0x18],	%i0
	sdivcc	%g3,	0x02DD,	%l5
	umul	%o5,	%i4,	%o6
	subc	%o2,	0x11A3,	%g1
	fxor	%f16,	%f6,	%f2
	restore %o3, %i7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l6,	%g6,	%l1
	fcmped	%fcc1,	%f24,	%f0
	edge8	%g7,	%o0,	%l3
	sdivcc	%i5,	0x0F8A,	%g2
	fmovrsgz	%l0,	%f30,	%f15
	ldx	[%l7 + 0x08],	%i2
	umul	%o7,	0x0C6B,	%i6
	movne	%xcc,	%g5,	%l4
	srax	%g4,	%o1,	%i1
	sdiv	%l2,	0x0EBB,	%i0
	sra	%i3,	%l5,	%g3
	movcc	%xcc,	%i4,	%o5
	ldub	[%l7 + 0x75],	%o2
	array32	%o6,	%o3,	%g1
	sethi	0x02E8,	%i7
	fmovda	%xcc,	%f5,	%f19
	xorcc	%o4,	0x1186,	%l6
	ldsw	[%l7 + 0x34],	%g6
	ldd	[%l7 + 0x78],	%l0
	srax	%o0,	%l3,	%i5
	andn	%g2,	0x041B,	%g7
	movvs	%icc,	%l0,	%o7
	ld	[%l7 + 0x78],	%f30
	edge32	%i2,	%i6,	%l4
	xorcc	%g4,	0x10A0,	%g5
	orncc	%i1,	0x15F7,	%l2
	ldub	[%l7 + 0x34],	%i0
	save %i3, %l5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i4,	%o1,	%o5
	fmovscc	%icc,	%f5,	%f9
	umulcc	%o6,	0x1BF6,	%o3
	stw	%g1,	[%l7 + 0x38]
	movg	%icc,	%i7,	%o4
	sdivcc	%o2,	0x00FB,	%g6
	edge8	%l6,	%l1,	%l3
	mulx	%i5,	%o0,	%g7
	sdivcc	%g2,	0x16B0,	%o7
	sethi	0x017D,	%i2
	edge8ln	%i6,	%l4,	%g4
	smulcc	%g5,	0x064A,	%i1
	fones	%f29
	array16	%l2,	%i0,	%l0
	movn	%xcc,	%i3,	%g3
	sdivcc	%l5,	0x1B39,	%i4
	movrgez	%o1,	0x1AC,	%o5
	fornot1s	%f18,	%f19,	%f11
	st	%f31,	[%l7 + 0x38]
	move	%xcc,	%o3,	%o6
	fand	%f26,	%f28,	%f26
	orcc	%i7,	0x134E,	%o4
	edge8	%g1,	%o2,	%g6
	st	%f5,	[%l7 + 0x5C]
	orcc	%l6,	%l3,	%i5
	nop
	set	0x39, %o2
	ldub	[%l7 + %o2],	%o0
	srlx	%l1,	%g2,	%o7
	xor	%i2,	0x012D,	%i6
	movrgez	%l4,	0x0BB,	%g7
	movvs	%icc,	%g4,	%i1
	move	%icc,	%g5,	%l2
	edge8	%i0,	%i3,	%g3
	fpsub16	%f24,	%f30,	%f28
	fmovrslz	%l5,	%f11,	%f31
	sethi	0x0C6B,	%l0
	movre	%i4,	0x268,	%o1
	movrgez	%o5,	%o3,	%o6
	smulcc	%o4,	%i7,	%g1
	movgu	%icc,	%g6,	%l6
	fcmped	%fcc2,	%f10,	%f10
	addccc	%o2,	0x1580,	%i5
	umul	%o0,	%l3,	%l1
	fcmpgt32	%f18,	%f0,	%g2
	edge16ln	%o7,	%i6,	%l4
	fmovdle	%xcc,	%f10,	%f14
	nop
	set	0x78, %o4
	lduw	[%l7 + %o4],	%g7
	fmovsgu	%xcc,	%f5,	%f6
	srax	%g4,	0x10,	%i1
	smul	%g5,	0x19A9,	%l2
	edge8n	%i2,	%i3,	%g3
	fmul8sux16	%f24,	%f16,	%f10
	movre	%l5,	%i0,	%i4
	andncc	%l0,	%o5,	%o3
	ld	[%l7 + 0x14],	%f8
	addcc	%o1,	0x1BDF,	%o6
	srax	%o4,	0x07,	%i7
	alignaddrl	%g1,	%g6,	%l6
	stw	%o2,	[%l7 + 0x60]
	movneg	%xcc,	%o0,	%l3
	alignaddrl	%i5,	%l1,	%g2
	alignaddr	%i6,	%o7,	%l4
	srax	%g4,	0x09,	%g7
	ldsw	[%l7 + 0x10],	%i1
	fxnors	%f28,	%f17,	%f31
	fmovrdne	%g5,	%f18,	%f8
	faligndata	%f0,	%f22,	%f4
	movneg	%icc,	%l2,	%i2
	lduh	[%l7 + 0x74],	%g3
	fornot2	%f20,	%f22,	%f4
	fmovsvc	%xcc,	%f19,	%f19
	stb	%l5,	[%l7 + 0x35]
	movl	%icc,	%i0,	%i4
	nop
	set	0x7C, %i6
	ldsw	[%l7 + %i6],	%i3
	add	%l0,	0x0DFE,	%o3
	movpos	%xcc,	%o1,	%o6
	movrlz	%o5,	0x243,	%i7
	xor	%g1,	%o4,	%g6
	nop
	set	0x0E, %g3
	lduh	[%l7 + %g3],	%l6
	stx	%o2,	[%l7 + 0x60]
	fmovsn	%xcc,	%f6,	%f25
	alignaddr	%o0,	%i5,	%l3
	subc	%g2,	%i6,	%o7
	sub	%l4,	0x0F17,	%l1
	srlx	%g7,	0x04,	%i1
	xnorcc	%g5,	0x07D7,	%l2
	mulx	%g4,	%i2,	%l5
	movl	%icc,	%i0,	%g3
	smul	%i3,	0x0499,	%l0
	smul	%o3,	0x02BC,	%o1
	srl	%i4,	0x1A,	%o6
	fmovsneg	%xcc,	%f13,	%f2
	edge32ln	%o5,	%g1,	%o4
	nop
	set	0x22, %g7
	ldsh	[%l7 + %g7],	%g6
	fcmpd	%fcc0,	%f26,	%f0
	umul	%l6,	%i7,	%o0
	xorcc	%i5,	0x1540,	%l3
	edge32	%g2,	%i6,	%o7
	sub	%o2,	0x05FD,	%l4
	or	%l1,	0x08AE,	%i1
	edge8n	%g7,	%g5,	%g4
	fpack32	%f22,	%f8,	%f4
	pdist	%f16,	%f30,	%f12
	movleu	%xcc,	%i2,	%l5
	ldub	[%l7 + 0x41],	%i0
	fmovdcs	%xcc,	%f24,	%f2
	fpsub16s	%f30,	%f25,	%f4
	ld	[%l7 + 0x18],	%f7
	movcs	%xcc,	%g3,	%l2
	fmovsgu	%xcc,	%f15,	%f29
	orncc	%l0,	0x0B85,	%i3
	fand	%f18,	%f28,	%f12
	fnot1	%f24,	%f18
	mulscc	%o1,	0x1727,	%o3
	fmul8x16	%f3,	%f28,	%f26
	addccc	%o6,	%o5,	%g1
	alignaddr	%o4,	%i4,	%l6
	movge	%icc,	%i7,	%o0
	fmovdcc	%icc,	%f18,	%f6
	fmovdleu	%xcc,	%f13,	%f18
	movleu	%xcc,	%i5,	%l3
	fmovse	%xcc,	%f10,	%f11
	xorcc	%g2,	0x1EC0,	%i6
	sll	%o7,	%g6,	%l4
	andncc	%o2,	%l1,	%i1
	popc	0x17F2,	%g7
	fmovsgu	%icc,	%f12,	%f17
	srl	%g4,	%g5,	%l5
	array32	%i2,	%i0,	%g3
	ldsw	[%l7 + 0x48],	%l0
	ldsh	[%l7 + 0x68],	%i3
	st	%f22,	[%l7 + 0x40]
	xorcc	%o1,	0x1914,	%o3
	save %l2, 0x0860, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o5,	%o4
	edge16n	%g1,	%i4,	%i7
	ldsb	[%l7 + 0x65],	%o0
	ld	[%l7 + 0x5C],	%f23
	movrgz	%i5,	%l3,	%g2
	sethi	0x01D0,	%i6
	fmovspos	%icc,	%f20,	%f18
	srax	%o7,	%g6,	%l4
	edge32l	%o2,	%l1,	%i1
	fmovsneg	%icc,	%f24,	%f19
	array32	%l6,	%g7,	%g4
	edge8l	%l5,	%g5,	%i2
	ldd	[%l7 + 0x38],	%i0
	sllx	%g3,	0x18,	%i3
	sll	%l0,	%o3,	%l2
	mova	%xcc,	%o6,	%o5
	stw	%o4,	[%l7 + 0x10]
	or	%o1,	0x08B4,	%g1
	save %i4, %o0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l3,	%i5,	%i6
	movre	%g2,	%g6,	%o7
	sub	%o2,	0x1904,	%l1
	smul	%l4,	0x1A60,	%l6
	fpack16	%f6,	%f27
	fmovdl	%xcc,	%f20,	%f19
	fpack32	%f22,	%f22,	%f30
	xnorcc	%g7,	0x02C2,	%g4
	srl	%l5,	0x1C,	%g5
	stx	%i2,	[%l7 + 0x18]
	mulscc	%i0,	0x0EF3,	%i1
	fandnot1	%f22,	%f22,	%f24
	fpadd32s	%f16,	%f4,	%f15
	sllx	%g3,	0x03,	%i3
	ldx	[%l7 + 0x60],	%l0
	sra	%l2,	%o3,	%o6
	fmovdleu	%xcc,	%f29,	%f23
	fone	%f12
	fmuld8sux16	%f30,	%f7,	%f24
	subc	%o4,	%o1,	%o5
	movleu	%icc,	%i4,	%g1
	umul	%i7,	%o0,	%i5
	fpadd32s	%f8,	%f25,	%f4
	udiv	%i6,	0x1E72,	%g2
	fmuld8ulx16	%f19,	%f18,	%f16
	fmovrde	%g6,	%f16,	%f20
	fmovdcc	%xcc,	%f27,	%f24
	xnor	%l3,	0x17FA,	%o7
	save %l1, 0x1C10, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l6,	%o2,	%g7
	movne	%xcc,	%g4,	%g5
	save %i2, 0x03B2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f18,	[%l7 + 0x60]
	std	%f2,	[%l7 + 0x50]
	move	%icc,	%i0,	%i1
	fcmpd	%fcc2,	%f6,	%f0
	movrlz	%g3,	0x25E,	%l0
	movrgez	%l2,	%o3,	%o6
	fxor	%f10,	%f24,	%f18
	fmovdg	%xcc,	%f5,	%f16
	andcc	%i3,	%o4,	%o1
	andcc	%i4,	%o5,	%i7
	and	%g1,	%o0,	%i6
	addccc	%g2,	0x0C87,	%i5
	sir	0x0998
	array32	%g6,	%l3,	%l1
	edge32l	%l4,	%o7,	%l6
	fcmpgt32	%f28,	%f24,	%g7
	fmovrdgz	%o2,	%f16,	%f14
	sdivcc	%g4,	0x0140,	%g5
	sdiv	%l5,	0x1027,	%i0
	std	%f18,	[%l7 + 0x70]
	fornot1	%f12,	%f12,	%f8
	sub	%i2,	0x1EAC,	%i1
	sdiv	%g3,	0x04E9,	%l0
	fmovrdgz	%o3,	%f2,	%f2
	sll	%l2,	%i3,	%o4
	fmovdne	%icc,	%f6,	%f10
	or	%o1,	%o6,	%o5
	edge16	%i4,	%i7,	%o0
	andncc	%i6,	%g2,	%i5
	edge32ln	%g1,	%l3,	%l1
	fand	%f26,	%f30,	%f18
	addc	%l4,	0x0E2A,	%g6
	addccc	%l6,	0x0FF8,	%o7
	mova	%icc,	%o2,	%g4
	ldub	[%l7 + 0x0C],	%g5
	smul	%l5,	%i0,	%g7
	fmovdpos	%xcc,	%f5,	%f21
	move	%icc,	%i2,	%i1
	array32	%l0,	%o3,	%l2
	stx	%i3,	[%l7 + 0x20]
	movle	%icc,	%g3,	%o1
	fone	%f20
	popc	0x04C0,	%o6
	edge8ln	%o4,	%i4,	%o5
	edge32n	%i7,	%i6,	%o0
	edge8ln	%g2,	%i5,	%l3
	fmovdge	%icc,	%f18,	%f13
	movvc	%icc,	%l1,	%l4
	umulcc	%g6,	0x1B4E,	%g1
	lduh	[%l7 + 0x3C],	%l6
	srl	%o7,	0x1E,	%o2
	edge8n	%g5,	%g4,	%l5
	array16	%g7,	%i0,	%i2
	edge16l	%i1,	%l0,	%l2
	move	%xcc,	%i3,	%g3
	movrlez	%o1,	%o6,	%o3
	sdiv	%i4,	0x1328,	%o5
	fmovsge	%xcc,	%f4,	%f18
	edge16ln	%o4,	%i6,	%i7
	movgu	%xcc,	%g2,	%o0
	sll	%i5,	%l3,	%l4
	orncc	%g6,	%l1,	%g1
	udivx	%o7,	0x1F72,	%o2
	xnorcc	%g5,	%g4,	%l5
	movre	%g7,	0x30C,	%l6
	fsrc1	%f0,	%f18
	fzero	%f8
	smulcc	%i0,	%i1,	%l0
	fmul8x16au	%f15,	%f9,	%f20
	sub	%i2,	0x0B3C,	%l2
	udivcc	%i3,	0x0C0C,	%g3
	and	%o1,	%o3,	%o6
	udiv	%o5,	0x1195,	%i4
	orn	%i6,	%o4,	%g2
	st	%f10,	[%l7 + 0x08]
	ld	[%l7 + 0x08],	%f10
	sdivx	%i7,	0x1C11,	%i5
	fmovrslz	%o0,	%f10,	%f26
	edge8l	%l3,	%l4,	%g6
	andncc	%g1,	%l1,	%o2
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	sdiv	%g4,	0x0ABF,	%l5
	fmovdleu	%xcc,	%f3,	%f19
	fexpand	%f28,	%f24
	movg	%xcc,	%g7,	%i0
	fone	%f8
	udivcc	%i1,	0x1AF2,	%l6
	movcc	%xcc,	%l0,	%l2
	addc	%i3,	%i2,	%g3
	sra	%o1,	%o6,	%o5
	stb	%i4,	[%l7 + 0x20]
	ldd	[%l7 + 0x18],	%f12
	and	%i6,	%o4,	%g2
	fmovdle	%xcc,	%f12,	%f22
	ldx	[%l7 + 0x38],	%i7
	sdivx	%o3,	0x07FF,	%o0
	and	%i5,	0x07BA,	%l4
	udivx	%l3,	0x1A5A,	%g6
	fsrc1	%f16,	%f18
	movgu	%xcc,	%l1,	%o2
	ld	[%l7 + 0x50],	%f12
	fpadd32s	%f31,	%f2,	%f20
	stw	%g5,	[%l7 + 0x78]
	sllx	%g1,	%o7,	%l5
	movrne	%g4,	0x399,	%i0
	andn	%g7,	0x1D47,	%i1
	movrlz	%l6,	%l2,	%l0
	movvc	%xcc,	%i2,	%g3
	lduh	[%l7 + 0x1A],	%o1
	srlx	%o6,	0x1B,	%o5
	udiv	%i3,	0x1CB9,	%i6
	fornot2	%f4,	%f22,	%f20
	stb	%o4,	[%l7 + 0x4C]
	addc	%g2,	0x0213,	%i7
	array32	%o3,	%i4,	%i5
	movl	%icc,	%o0,	%l4
	movvc	%icc,	%l3,	%g6
	movn	%icc,	%o2,	%g5
	fmovrse	%l1,	%f21,	%f27
	movle	%icc,	%g1,	%l5
	ldsh	[%l7 + 0x72],	%g4
	movleu	%xcc,	%o7,	%i0
	movneg	%icc,	%g7,	%i1
	mulscc	%l6,	%l0,	%l2
	movpos	%icc,	%g3,	%i2
	stb	%o1,	[%l7 + 0x73]
	movcs	%xcc,	%o6,	%i3
	fxnors	%f21,	%f14,	%f31
	fmovrsgez	%i6,	%f5,	%f11
	andncc	%o5,	%o4,	%i7
	fpsub16	%f2,	%f0,	%f26
	ldsh	[%l7 + 0x4E],	%g2
	edge32n	%o3,	%i4,	%o0
	edge32n	%i5,	%l4,	%g6
	movrgez	%o2,	0x16D,	%g5
	fmovsa	%xcc,	%f12,	%f1
	stx	%l3,	[%l7 + 0x78]
	xor	%l1,	0x00C7,	%l5
	edge32n	%g4,	%g1,	%i0
	mulx	%g7,	%o7,	%i1
	fand	%f10,	%f4,	%f30
	sth	%l0,	[%l7 + 0x52]
	stw	%l6,	[%l7 + 0x70]
	restore %l2, 0x0847, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x10, %g5
	std	%f8,	[%l7 + %g5]
	fnor	%f12,	%f0,	%f24
	ldd	[%l7 + 0x48],	%f20
	fpsub32s	%f13,	%f18,	%f18
	movrlez	%i2,	0x09E,	%o6
	fnegs	%f0,	%f14
	addccc	%o1,	%i6,	%i3
	fpackfix	%f28,	%f24
	nop
	set	0x28, %i0
	lduw	[%l7 + %i0],	%o4
	mulx	%o5,	0x0BF3,	%g2
	ldsw	[%l7 + 0x6C],	%o3
	ldsh	[%l7 + 0x2A],	%i7
	fpadd16	%f14,	%f30,	%f28
	movl	%icc,	%i4,	%i5
	fnegs	%f24,	%f13
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	sllx	%o2,	%g5,	%l1
	movre	%l3,	%l5,	%g4
	edge8	%g1,	%g7,	%i0
	fmovrdgz	%i1,	%f0,	%f18
	edge8l	%l0,	%o7,	%l6
	movn	%xcc,	%g3,	%i2
	movrlz	%o6,	%l2,	%i6
	subcc	%o1,	0x0983,	%o4
	fnot1s	%f23,	%f21
	mulx	%o5,	0x05E5,	%i3
	movne	%xcc,	%g2,	%i7
	subc	%i4,	0x09CA,	%o3
	movge	%icc,	%i5,	%o0
	fmovsvc	%xcc,	%f4,	%f22
	fsrc2	%f2,	%f16
	for	%f14,	%f10,	%f18
	srax	%l4,	0x09,	%g6
	fmovrdgez	%g5,	%f24,	%f14
	fmovdpos	%xcc,	%f18,	%f15
	srax	%o2,	%l3,	%l5
	fcmpne32	%f18,	%f24,	%l1
	lduh	[%l7 + 0x14],	%g4
	fnot1s	%f0,	%f24
	fmovsvc	%icc,	%f2,	%f18
	edge32n	%g1,	%g7,	%i1
	sra	%i0,	0x18,	%o7
	movcc	%icc,	%l0,	%l6
	movrgez	%g3,	0x175,	%i2
	alignaddr	%l2,	%i6,	%o6
	popc	%o1,	%o4
	fmovrsne	%o5,	%f15,	%f16
	fmovdg	%xcc,	%f12,	%f25
	or	%i3,	0x100A,	%i7
	xorcc	%i4,	%o3,	%i5
	and	%o0,	%l4,	%g6
	movleu	%icc,	%g2,	%g5
	lduh	[%l7 + 0x3E],	%l3
	edge32n	%o2,	%l5,	%g4
	lduw	[%l7 + 0x44],	%l1
	edge16	%g1,	%i1,	%i0
	srax	%g7,	%o7,	%l6
	ldub	[%l7 + 0x24],	%g3
	movrgez	%l0,	%i2,	%i6
	ldub	[%l7 + 0x47],	%l2
	for	%f2,	%f22,	%f16
	pdist	%f24,	%f16,	%f0
	sethi	0x19B4,	%o6
	fmovdl	%icc,	%f8,	%f28
	edge32n	%o4,	%o5,	%o1
	fmovdneg	%icc,	%f21,	%f23
	orncc	%i7,	0x13D3,	%i4
	edge8	%i3,	%o3,	%o0
	andncc	%i5,	%g6,	%g2
	fmovsleu	%icc,	%f20,	%f21
	movneg	%icc,	%g5,	%l4
	sdivx	%o2,	0x18E4,	%l5
	fpmerge	%f31,	%f0,	%f16
	nop
	set	0x4C, %g2
	stw	%l3,	[%l7 + %g2]
	movne	%icc,	%l1,	%g4
	sllx	%g1,	0x09,	%i0
	xnorcc	%i1,	0x1265,	%g7
	ldsb	[%l7 + 0x49],	%o7
	sdivx	%l6,	0x0607,	%g3
	fmul8ulx16	%f16,	%f16,	%f12
	stw	%i2,	[%l7 + 0x30]
	edge8l	%i6,	%l2,	%o6
	fmovdvs	%icc,	%f24,	%f1
	udiv	%l0,	0x106A,	%o5
	edge16ln	%o4,	%o1,	%i7
	fmovdle	%xcc,	%f29,	%f18
	edge8ln	%i4,	%o3,	%i3
	fmovsvs	%icc,	%f27,	%f13
	or	%o0,	%g6,	%g2
	udivcc	%g5,	0x04DA,	%i5
	udiv	%o2,	0x100A,	%l5
	stx	%l3,	[%l7 + 0x68]
	subcc	%l1,	%g4,	%g1
	nop
	set	0x18, %o3
	ldd	[%l7 + %o3],	%f0
	popc	0x1255,	%i0
	edge16n	%i1,	%g7,	%o7
	andncc	%l4,	%l6,	%g3
	umul	%i6,	%i2,	%o6
	movrlez	%l2,	%o5,	%o4
	movrne	%l0,	%o1,	%i7
	subccc	%i4,	%o3,	%i3
	udiv	%o0,	0x19E8,	%g2
	pdist	%f0,	%f0,	%f2
	siam	0x3
	xor	%g5,	0x05DE,	%i5
	edge16n	%o2,	%g6,	%l5
	mulx	%l3,	0x0ED2,	%g4
	fnegs	%f22,	%f10
	fabss	%f11,	%f1
	addc	%l1,	%g1,	%i1
	movvs	%xcc,	%g7,	%o7
	orcc	%i0,	0x197C,	%l4
	orncc	%l6,	0x0863,	%i6
	alignaddrl	%i2,	%o6,	%l2
	nop
	set	0x72, %i1
	ldub	[%l7 + %i1],	%o5
	addccc	%g3,	0x14CA,	%o4
	movrlez	%l0,	0x0AD,	%i7
	edge16n	%i4,	%o3,	%i3
	fnot2s	%f12,	%f22
	nop
	set	0x48, %i3
	ldd	[%l7 + %i3],	%o0
	fcmple16	%f22,	%f24,	%g2
	edge16n	%o1,	%g5,	%i5
	andcc	%g6,	%l5,	%l3
	ldsh	[%l7 + 0x76],	%g4
	movrne	%l1,	0x16B,	%o2
	movg	%xcc,	%g1,	%g7
	fnot2s	%f15,	%f15
	fnands	%f17,	%f9,	%f12
	mulscc	%o7,	%i0,	%l4
	movg	%icc,	%l6,	%i6
	edge32l	%i2,	%o6,	%l2
	array32	%i1,	%o5,	%g3
	or	%l0,	%o4,	%i7
	siam	0x7
	edge16ln	%i4,	%o3,	%i3
	addc	%g2,	%o1,	%g5
	sth	%o0,	[%l7 + 0x30]
	andncc	%g6,	%l5,	%l3
	addccc	%i5,	0x1EBF,	%l1
	mova	%icc,	%g4,	%g1
	edge32n	%o2,	%o7,	%i0
	orncc	%l4,	0x1622,	%l6
	fsrc2	%f24,	%f0
	orcc	%i6,	%i2,	%g7
	mulscc	%l2,	%i1,	%o6
	fcmple16	%f26,	%f10,	%o5
	ldd	[%l7 + 0x20],	%l0
	movge	%xcc,	%g3,	%i7
	fzero	%f12
	movneg	%xcc,	%o4,	%i4
	ldsh	[%l7 + 0x60],	%o3
	std	%f24,	[%l7 + 0x48]
	lduw	[%l7 + 0x40],	%g2
	udivcc	%i3,	0x1E15,	%o1
	fcmpne16	%f30,	%f24,	%o0
	movleu	%xcc,	%g6,	%g5
	fmovscc	%xcc,	%f0,	%f9
	fmovsvc	%xcc,	%f6,	%f19
	ldx	[%l7 + 0x28],	%l3
	edge32ln	%i5,	%l1,	%g4
	sll	%l5,	0x19,	%g1
	smulcc	%o2,	0x1AA5,	%i0
	movne	%xcc,	%o7,	%l4
	array16	%l6,	%i6,	%i2
	movleu	%icc,	%g7,	%l2
	stb	%o6,	[%l7 + 0x4F]
	movvc	%icc,	%o5,	%i1
	fabss	%f18,	%f27
	fpsub16s	%f16,	%f0,	%f3
	srax	%l0,	0x15,	%i7
	sra	%o4,	%i4,	%g3
	sth	%o3,	[%l7 + 0x66]
	fmuld8sux16	%f15,	%f15,	%f18
	fpadd16	%f30,	%f12,	%f14
	alignaddr	%i3,	%g2,	%o0
	fmovdpos	%xcc,	%f31,	%f30
	fones	%f3
	bshuffle	%f14,	%f20,	%f20
	smulcc	%o1,	%g5,	%l3
	smulcc	%i5,	%l1,	%g4
	fpackfix	%f18,	%f20
	movcc	%icc,	%l5,	%g1
	mova	%xcc,	%g6,	%i0
	movcs	%icc,	%o2,	%l4
	srax	%l6,	0x14,	%i6
	edge16l	%i2,	%o7,	%g7
	movvc	%icc,	%o6,	%l2
	fcmpes	%fcc3,	%f19,	%f27
	srax	%i1,	%l0,	%o5
	sra	%i7,	%o4,	%g3
	fxor	%f26,	%f6,	%f26
	array32	%o3,	%i4,	%i3
	movre	%o0,	%o1,	%g2
	movcs	%icc,	%g5,	%l3
	ldd	[%l7 + 0x08],	%f18
	smulcc	%i5,	0x0578,	%g4
	ldsb	[%l7 + 0x42],	%l5
	edge32l	%g1,	%g6,	%i0
	movrlez	%o2,	0x393,	%l4
	ldx	[%l7 + 0x18],	%l6
	xor	%l1,	0x068B,	%i6
	lduh	[%l7 + 0x3E],	%i2
	movg	%xcc,	%o7,	%o6
	movcs	%xcc,	%g7,	%l2
	fones	%f11
	xorcc	%l0,	0x01F2,	%o5
	alignaddr	%i1,	%i7,	%o4
	sra	%g3,	0x13,	%o3
	edge16l	%i4,	%o0,	%i3
	fsrc1	%f14,	%f26
	movl	%xcc,	%o1,	%g5
	and	%g2,	%i5,	%g4
	movle	%xcc,	%l5,	%g1
	array32	%l3,	%g6,	%i0
	movg	%icc,	%l4,	%o2
	sdivx	%l1,	0x12BC,	%i6
	fmovsge	%icc,	%f15,	%f23
	edge16l	%i2,	%o7,	%l6
	ldsw	[%l7 + 0x0C],	%o6
	xor	%g7,	0x1857,	%l0
	sra	%o5,	%l2,	%i7
	fmovs	%f22,	%f8
	fmuld8sux16	%f24,	%f22,	%f18
	restore %o4, 0x0FCB, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	sub	%o0,	0x0E35,	%i4
	mulscc	%i3,	%g5,	%o1
	or	%i5,	0x0CCA,	%g2
	xorcc	%g4,	0x0ABB,	%l5
	edge8l	%l3,	%g6,	%i0
	for	%f30,	%f20,	%f10
	movneg	%xcc,	%g1,	%l4
	fmovsleu	%xcc,	%f22,	%f12
	array32	%l1,	%o2,	%i2
	array16	%o7,	%i6,	%l6
	fmovrslez	%o6,	%f12,	%f16
	ldd	[%l7 + 0x08],	%l0
	stx	%g7,	[%l7 + 0x48]
	save %o5, %i7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g3, 0x02D3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o3,	%o0,	%o4
	sll	%i4,	0x02,	%i3
	fmovdge	%icc,	%f27,	%f17
	fnegs	%f23,	%f14
	ldd	[%l7 + 0x10],	%g4
	move	%xcc,	%o1,	%i5
	restore %g2, 0x07EC, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g4,	%l3,	%g6
	umul	%i0,	0x0AB5,	%l4
	lduh	[%l7 + 0x40],	%g1
	fexpand	%f6,	%f22
	sra	%o2,	0x01,	%i2
	fmovdvc	%icc,	%f0,	%f16
	fmovdl	%icc,	%f27,	%f18
	movrgz	%o7,	0x295,	%l1
	movrgez	%i6,	0x1E5,	%l6
	ldsw	[%l7 + 0x50],	%o6
	stb	%g7,	[%l7 + 0x21]
	array8	%l0,	%i7,	%l2
	sdivcc	%o5,	0x0AC9,	%g3
	movvc	%xcc,	%i1,	%o3
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	alignaddrl	%g5,	%i3,	%o1
	movrne	%g2,	%l5,	%g4
	st	%f26,	[%l7 + 0x34]
	mova	%icc,	%l3,	%i5
	xor	%g6,	0x10E2,	%l4
	andncc	%g1,	%o2,	%i2
	fsrc1s	%f11,	%f21
	ld	[%l7 + 0x10],	%f23
	ldsh	[%l7 + 0x76],	%i0
	movvs	%xcc,	%l1,	%i6
	umulcc	%o7,	0x0D94,	%o6
	save %l6, %g7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%icc,	%f23,	%f23
	fands	%f7,	%f12,	%f5
	fnot2	%f30,	%f22
	movge	%icc,	%l2,	%l0
	udivx	%g3,	0x150E,	%o5
	sethi	0x0C1C,	%o3
	sethi	0x1438,	%o4
	sethi	0x1CF4,	%i1
	subc	%i4,	0x1007,	%g5
	fmovrdlez	%i3,	%f4,	%f22
	movne	%icc,	%o0,	%o1
	srlx	%g2,	0x14,	%g4
	movn	%icc,	%l5,	%l3
	fnors	%f26,	%f11,	%f24
	ld	[%l7 + 0x3C],	%f1
	fmovsl	%xcc,	%f19,	%f14
	fmovsvc	%xcc,	%f12,	%f15
	xnorcc	%i5,	0x0ED9,	%g6
	fnegd	%f14,	%f14
	ld	[%l7 + 0x6C],	%f29
	movvs	%icc,	%l4,	%o2
	fones	%f9
	sll	%i2,	%i0,	%l1
	srlx	%g1,	%o7,	%i6
	movpos	%xcc,	%l6,	%o6
	srlx	%i7,	%g7,	%l0
	movleu	%xcc,	%g3,	%o5
	edge8n	%o3,	%l2,	%o4
	movle	%xcc,	%i1,	%g5
	or	%i3,	0x0ECF,	%o0
	alignaddrl	%i4,	%o1,	%g2
	mova	%icc,	%l5,	%l3
	fmul8x16	%f23,	%f16,	%f4
	smulcc	%g4,	0x0F45,	%i5
	edge16ln	%l4,	%o2,	%g6
	fpack32	%f26,	%f30,	%f20
	array16	%i2,	%l1,	%i0
	or	%o7,	%i6,	%l6
	xnor	%o6,	%g1,	%i7
	movleu	%icc,	%l0,	%g3
	fmovdg	%icc,	%f30,	%f2
	edge32l	%o5,	%o3,	%g7
	sll	%l2,	0x02,	%o4
	fcmpeq16	%f14,	%f18,	%g5
	movrne	%i1,	%i3,	%i4
	fpadd32	%f30,	%f18,	%f28
	smulcc	%o1,	0x121F,	%o0
	addc	%l5,	0x0B5F,	%g2
	movge	%icc,	%g4,	%l3
	movne	%icc,	%l4,	%i5
	ld	[%l7 + 0x18],	%f17
	save %g6, %i2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o2,	0x16CE,	%o7
	movrlz	%i0,	0x004,	%l6
	stb	%i6,	[%l7 + 0x34]
	and	%g1,	%i7,	%o6
	fmovscc	%xcc,	%f16,	%f24
	sdiv	%l0,	0x0DCF,	%g3
	srl	%o3,	0x04,	%o5
	fandnot2	%f24,	%f24,	%f24
	lduh	[%l7 + 0x7A],	%l2
	andcc	%o4,	0x0F2F,	%g7
	array16	%g5,	%i3,	%i4
	movvc	%icc,	%o1,	%i1
	sllx	%l5,	0x0D,	%o0
	fands	%f24,	%f8,	%f24
	andcc	%g2,	0x0666,	%g4
	movn	%xcc,	%l3,	%i5
	edge8n	%l4,	%i2,	%g6
	movvc	%icc,	%l1,	%o7
	ldd	[%l7 + 0x10],	%f18
	edge16l	%i0,	%o2,	%l6
	fone	%f20
	popc	%g1,	%i7
	for	%f24,	%f12,	%f16
	edge32n	%o6,	%l0,	%g3
	edge8n	%i6,	%o5,	%o3
	save %l2, 0x01DD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g5,	%g7
	popc	%i3,	%i4
	fmovrsne	%i1,	%f22,	%f19
	ldsh	[%l7 + 0x20],	%o1
	edge8ln	%l5,	%o0,	%g4
	fxor	%f24,	%f24,	%f18
	fmovsgu	%icc,	%f25,	%f30
	alignaddrl	%l3,	%i5,	%l4
	ldd	[%l7 + 0x58],	%g2
	xorcc	%i2,	%g6,	%o7
	mova	%xcc,	%l1,	%o2
	movcs	%xcc,	%i0,	%l6
	movcs	%xcc,	%i7,	%o6
	fmul8x16au	%f19,	%f19,	%f20
	fmul8sux16	%f4,	%f18,	%f10
	movpos	%xcc,	%l0,	%g1
	nop
	set	0x70, %i2
	lduh	[%l7 + %i2],	%i6
	ldsb	[%l7 + 0x44],	%g3
	faligndata	%f16,	%f10,	%f18
	edge16	%o3,	%l2,	%o5
	movpos	%icc,	%o4,	%g7
	ldub	[%l7 + 0x60],	%g5
	umulcc	%i3,	%i1,	%i4
	smulcc	%l5,	%o0,	%o1
	orcc	%g4,	0x147E,	%l3
	fmovdleu	%xcc,	%f2,	%f23
	array32	%l4,	%g2,	%i5
	fmovrsne	%g6,	%f17,	%f19
	smul	%i2,	0x1CB9,	%l1
	sllx	%o7,	%o2,	%i0
	movneg	%icc,	%l6,	%o6
	fone	%f10
	nop
	set	0x75, %i4
	ldsb	[%l7 + %i4],	%l0
	mova	%icc,	%i7,	%i6
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%g2
	fpack32	%f26,	%f24,	%f10
	ld	[%l7 + 0x64],	%f3
	edge32	%o3,	%l2,	%o5
	fnors	%f1,	%f6,	%f24
	ldub	[%l7 + 0x15],	%g1
	udivcc	%g7,	0x196E,	%g5
	fmovdleu	%icc,	%f8,	%f7
	xnor	%i3,	%o4,	%i1
	umul	%i4,	%l5,	%o1
	fnot2s	%f28,	%f7
	movgu	%xcc,	%o0,	%g4
	mova	%icc,	%l4,	%l3
	lduw	[%l7 + 0x78],	%i5
	fpack16	%f28,	%f31
	ldx	[%l7 + 0x08],	%g6
	ldsh	[%l7 + 0x32],	%g2
	orncc	%l1,	%i2,	%o2
	and	%o7,	0x03C3,	%l6
	fmovdne	%icc,	%f18,	%f29
	addcc	%o6,	%l0,	%i7
	sdivx	%i6,	0x1698,	%g3
	movre	%o3,	%i0,	%o5
	edge16l	%l2,	%g7,	%g5
	st	%f6,	[%l7 + 0x48]
	std	%f28,	[%l7 + 0x18]
	movrlez	%i3,	0x25E,	%o4
	edge8	%i1,	%g1,	%l5
	movpos	%xcc,	%i4,	%o1
	fmovdvc	%xcc,	%f27,	%f0
	edge32n	%o0,	%g4,	%l4
	edge32	%i5,	%l3,	%g6
	nop
	set	0x54, %o7
	lduw	[%l7 + %o7],	%g2
	fzero	%f10
	ld	[%l7 + 0x38],	%f12
	movrne	%i2,	0x15E,	%o2
	srax	%l1,	%l6,	%o7
	umul	%o6,	%i7,	%l0
	movrlez	%g3,	%o3,	%i0
	and	%i6,	%l2,	%g7
	nop
	set	0x78, %o5
	sth	%o5,	[%l7 + %o5]
	fpsub16s	%f10,	%f4,	%f10
	fmovdl	%xcc,	%f20,	%f13
	sra	%i3,	0x0C,	%o4
	movleu	%icc,	%i1,	%g1
	ld	[%l7 + 0x54],	%f2
	smulcc	%l5,	%i4,	%o1
	array16	%o0,	%g5,	%g4
	andncc	%l4,	%i5,	%l3
	edge16	%g6,	%g2,	%o2
	movcc	%xcc,	%i2,	%l6
	fmovrsne	%l1,	%f15,	%f27
	mulscc	%o6,	%o7,	%i7
	xor	%g3,	%o3,	%i0
	smulcc	%i6,	0x0260,	%l0
	ldsh	[%l7 + 0x70],	%g7
	sir	0x0C8D
	movge	%icc,	%l2,	%o5
	ldsh	[%l7 + 0x34],	%o4
	ld	[%l7 + 0x30],	%f6
	umulcc	%i3,	%g1,	%l5
	edge16ln	%i4,	%o1,	%o0
	fnand	%f24,	%f20,	%f14
	subc	%g5,	%g4,	%i1
	sll	%l4,	%i5,	%l3
	ldsw	[%l7 + 0x70],	%g6
	movge	%xcc,	%g2,	%i2
	sll	%l6,	0x0C,	%o2
	stw	%o6,	[%l7 + 0x5C]
	fmovscs	%icc,	%f14,	%f4
	fzeros	%f24
	edge16	%o7,	%i7,	%l1
	sethi	0x03C4,	%g3
	srl	%i0,	%i6,	%l0
	edge32ln	%g7,	%o3,	%o5
	fcmpeq32	%f10,	%f14,	%o4
	srax	%l2,	0x1F,	%i3
	nop
	set	0x08, %l6
	ldsh	[%l7 + %l6],	%l5
	movg	%icc,	%g1,	%o1
	move	%xcc,	%o0,	%g5
	nop
	set	0x60, %o6
	std	%f28,	[%l7 + %o6]
	fnegd	%f0,	%f4
	ldd	[%l7 + 0x40],	%i4
	movrgez	%i1,	0x28C,	%l4
	edge16l	%g4,	%l3,	%g6
	smulcc	%i5,	%i2,	%g2
	movre	%l6,	0x391,	%o6
	orn	%o2,	%o7,	%i7
	ldsw	[%l7 + 0x54],	%g3
	stb	%l1,	[%l7 + 0x5C]
	sdivx	%i0,	0x0F40,	%i6
	fmul8ulx16	%f24,	%f10,	%f20
	xor	%l0,	%g7,	%o3
	xor	%o5,	0x04AE,	%l2
	edge16n	%i3,	%o4,	%g1
	ldub	[%l7 + 0x32],	%o1
	fmovdgu	%xcc,	%f30,	%f0
	edge32l	%o0,	%l5,	%i4
	movl	%xcc,	%i1,	%l4
	fmovdcs	%icc,	%f11,	%f23
	edge32l	%g4,	%g5,	%g6
	fcmple32	%f20,	%f8,	%i5
	fmul8sux16	%f4,	%f6,	%f16
	stx	%i2,	[%l7 + 0x10]
	movre	%l3,	0x3C9,	%l6
	smul	%o6,	%g2,	%o2
	movcc	%icc,	%o7,	%i7
	alignaddrl	%l1,	%g3,	%i0
	sethi	0x0C7A,	%l0
	subccc	%i6,	%g7,	%o5
	fmovdpos	%icc,	%f21,	%f4
	ldx	[%l7 + 0x38],	%o3
	smulcc	%i3,	%o4,	%g1
	movgu	%xcc,	%l2,	%o1
	fmovdcs	%xcc,	%f30,	%f8
	fors	%f14,	%f23,	%f18
	ld	[%l7 + 0x54],	%f11
	udiv	%l5,	0x1ECA,	%i4
	ldd	[%l7 + 0x30],	%i0
	movrgez	%o0,	%g4,	%l4
	movvc	%xcc,	%g5,	%i5
	movpos	%xcc,	%i2,	%g6
	fmovscc	%xcc,	%f29,	%f5
	orncc	%l6,	0x1108,	%l3
	movgu	%xcc,	%g2,	%o2
	movneg	%icc,	%o7,	%o6
	andncc	%l1,	%g3,	%i0
	lduw	[%l7 + 0x34],	%i7
	movrne	%l0,	%i6,	%o5
	movvc	%icc,	%g7,	%o3
	movcs	%icc,	%i3,	%g1
	addccc	%o4,	0x1C78,	%l2
	movg	%icc,	%l5,	%i4
	sra	%o1,	0x09,	%i1
	fones	%f8
	ldd	[%l7 + 0x50],	%f20
	fandnot2	%f0,	%f6,	%f16
	movge	%icc,	%o0,	%l4
	ldx	[%l7 + 0x50],	%g4
	sethi	0x0733,	%g5
	srl	%i5,	0x1F,	%i2
	fcmpne32	%f22,	%f2,	%g6
	xnorcc	%l6,	%l3,	%g2
	subccc	%o7,	%o2,	%o6
	array8	%l1,	%g3,	%i0
	umulcc	%l0,	%i6,	%i7
	srax	%o5,	%g7,	%i3
	fpadd32	%f18,	%f20,	%f26
	srl	%g1,	%o3,	%l2
	subccc	%l5,	0x1233,	%o4
	movg	%icc,	%i4,	%o1
	movgu	%icc,	%o0,	%i1
	movrlez	%g4,	%l4,	%g5
	fcmpeq16	%f8,	%f14,	%i5
	lduw	[%l7 + 0x40],	%g6
	movcs	%xcc,	%i2,	%l3
	ldsh	[%l7 + 0x22],	%l6
	orn	%o7,	0x1612,	%g2
	fmuld8sux16	%f15,	%f16,	%f12
	andncc	%o2,	%l1,	%o6
	ld	[%l7 + 0x44],	%f25
	ldsb	[%l7 + 0x1C],	%g3
	movpos	%xcc,	%i0,	%i6
	andcc	%i7,	%l0,	%g7
	ldsb	[%l7 + 0x3C],	%o5
	movrgez	%i3,	%g1,	%l2
	edge8ln	%l5,	%o3,	%i4
	udivcc	%o4,	0x0058,	%o1
	move	%icc,	%o0,	%i1
	addcc	%g4,	0x15EF,	%l4
	xnor	%g5,	0x0B96,	%g6
	save %i5, 0x1274, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f15,	%f16
	movrlez	%l6,	0x17C,	%i2
	ldub	[%l7 + 0x60],	%g2
	edge32	%o7,	%o2,	%l1
	xorcc	%o6,	0x1CF6,	%g3
	umulcc	%i0,	%i6,	%i7
	and	%g7,	%o5,	%i3
	umulcc	%g1,	0x08D5,	%l2
	movl	%xcc,	%l5,	%o3
	popc	%l0,	%o4
	std	%f2,	[%l7 + 0x60]
	fmovrslez	%o1,	%f25,	%f20
	edge32n	%i4,	%o0,	%i1
	edge8l	%g4,	%l4,	%g5
	fcmple16	%f30,	%f2,	%g6
	subcc	%i5,	0x1EB0,	%l3
	popc	0x0B9D,	%l6
	sth	%i2,	[%l7 + 0x46]
	mulscc	%g2,	0x08E4,	%o2
	edge32ln	%l1,	%o7,	%g3
	andn	%o6,	0x0AF2,	%i0
	edge8	%i6,	%i7,	%o5
	lduw	[%l7 + 0x58],	%i3
	srax	%g1,	0x08,	%g7
	mulx	%l5,	0x0E7F,	%l2
	fmovdneg	%xcc,	%f16,	%f23
	fornot2	%f30,	%f30,	%f12
	ldsw	[%l7 + 0x30],	%o3
	sdivcc	%l0,	0x17D9,	%o1
	fcmpes	%fcc3,	%f15,	%f17
	fsrc2	%f24,	%f2
	udiv	%i4,	0x1C64,	%o0
	fmovsvs	%xcc,	%f30,	%f24
	sllx	%i1,	%g4,	%o4
	fmovdcc	%xcc,	%f29,	%f29
	orcc	%g5,	0x01EA,	%g6
	fzero	%f12
	xor	%l4,	%l3,	%l6
	smulcc	%i5,	0x0DB0,	%g2
	fnegd	%f22,	%f2
	udiv	%i2,	0x1990,	%o2
	movrlz	%o7,	0x061,	%g3
	movpos	%icc,	%o6,	%i0
	umulcc	%l1,	0x0C4A,	%i6
	movgu	%xcc,	%o5,	%i3
	orncc	%g1,	%i7,	%l5
	subcc	%g7,	0x1757,	%l2
	fandnot2s	%f5,	%f22,	%f0
	std	%f6,	[%l7 + 0x60]
	addc	%o3,	0x0F6F,	%l0
	sdiv	%i4,	0x1921,	%o1
	array32	%i1,	%g4,	%o0
	fcmpeq16	%f28,	%f0,	%o4
	orcc	%g6,	%l4,	%g5
	andncc	%l6,	%i5,	%g2
	edge8n	%i2,	%l3,	%o2
	udivx	%o7,	0x0359,	%g3
	subccc	%i0,	%l1,	%i6
	orncc	%o6,	0x1FD9,	%o5
	orncc	%g1,	0x126B,	%i7
	edge32n	%l5,	%g7,	%i3
	ldx	[%l7 + 0x50],	%l2
	sth	%l0,	[%l7 + 0x74]
	edge32ln	%i4,	%o3,	%o1
	edge16n	%i1,	%g4,	%o0
	fmovrdlz	%o4,	%f12,	%f4
	sethi	0x02D6,	%g6
	sdiv	%g5,	0x0966,	%l4
	movcc	%xcc,	%l6,	%g2
	edge32l	%i5,	%l3,	%i2
	fornot2	%f4,	%f18,	%f22
	mulx	%o7,	0x19E3,	%o2
	orcc	%i0,	%g3,	%i6
	fmovrslez	%o6,	%f25,	%f1
	fmovrdlz	%o5,	%f14,	%f0
	movre	%l1,	%i7,	%g1
	udiv	%l5,	0x1172,	%i3
	mulscc	%g7,	%l0,	%l2
	st	%f20,	[%l7 + 0x20]
	fmovrslez	%o3,	%f20,	%f18
	umulcc	%i4,	%i1,	%o1
	movrlez	%o0,	0x325,	%o4
	movl	%icc,	%g4,	%g6
	edge32n	%l4,	%g5,	%g2
	umul	%l6,	0x01CF,	%l3
	ldsw	[%l7 + 0x18],	%i5
	fmovdneg	%xcc,	%f14,	%f13
	udiv	%o7,	0x10D4,	%o2
	movre	%i2,	%i0,	%i6
	edge32	%o6,	%g3,	%l1
	ldub	[%l7 + 0x68],	%i7
	edge32n	%g1,	%l5,	%i3
	nop
	set	0x18, %l4
	std	%f10,	[%l7 + %l4]
	sdivcc	%o5,	0x1F96,	%l0
	restore %l2, %g7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f28,	%f9
	movg	%icc,	%i4,	%i1
	st	%f17,	[%l7 + 0x5C]
	mova	%xcc,	%o1,	%o0
	fmovsl	%xcc,	%f21,	%f28
	alignaddrl	%g4,	%g6,	%o4
	movn	%icc,	%g5,	%g2
	fmovsne	%icc,	%f14,	%f0
	subcc	%l6,	0x1DFA,	%l3
	stb	%i5,	[%l7 + 0x22]
	ldsh	[%l7 + 0x62],	%o7
	ldsh	[%l7 + 0x54],	%o2
	alignaddrl	%l4,	%i0,	%i6
	ldsh	[%l7 + 0x1C],	%o6
	movvc	%icc,	%i2,	%l1
	fmovrdne	%i7,	%f24,	%f0
	fmovdl	%xcc,	%f2,	%f11
	movcs	%icc,	%g1,	%l5
	stx	%i3,	[%l7 + 0x40]
	fmul8sux16	%f20,	%f26,	%f4
	srlx	%g3,	0x0D,	%o5
	and	%l0,	0x081C,	%g7
	movge	%xcc,	%o3,	%i4
	fsrc2	%f18,	%f24
	addccc	%i1,	%l2,	%o0
	movrgez	%g4,	0x2EB,	%g6
	fcmpes	%fcc0,	%f16,	%f5
	mulscc	%o4,	0x1331,	%o1
	fnor	%f12,	%f26,	%f10
	srlx	%g5,	0x02,	%l6
	smul	%g2,	0x0251,	%i5
	umulcc	%l3,	%o2,	%o7
	orn	%i0,	%l4,	%i6
	fandnot1	%f12,	%f18,	%f16
	movrgez	%i2,	%l1,	%o6
	xorcc	%g1,	%i7,	%i3
	fmovdn	%icc,	%f25,	%f8
	std	%f16,	[%l7 + 0x08]
	subcc	%g3,	0x1F3B,	%l5
	udivcc	%o5,	0x0176,	%l0
	fnot2s	%f20,	%f19
	add	%g7,	0x198C,	%o3
	edge8n	%i4,	%i1,	%o0
	fmovrsgez	%l2,	%f30,	%f22
	sllx	%g4,	%o4,	%g6
	edge8n	%o1,	%g5,	%l6
	sdiv	%g2,	0x0D4F,	%i5
	array8	%o2,	%o7,	%l3
	ld	[%l7 + 0x78],	%f4
	movl	%xcc,	%i0,	%l4
	movne	%icc,	%i2,	%l1
	movleu	%icc,	%o6,	%i6
	movrgz	%g1,	%i3,	%i7
	ldsh	[%l7 + 0x14],	%l5
	ld	[%l7 + 0x3C],	%f26
	movrlez	%o5,	0x37B,	%l0
	sub	%g7,	0x19D4,	%o3
	edge32	%i4,	%g3,	%o0
	fmovdpos	%icc,	%f22,	%f17
	movre	%l2,	%i1,	%o4
	movrlz	%g6,	%o1,	%g5
	orncc	%g4,	0x10EB,	%l6
	stb	%i5,	[%l7 + 0x52]
	sethi	0x0A70,	%g2
	fmovsl	%xcc,	%f30,	%f3
	edge8l	%o7,	%o2,	%i0
	fandnot1s	%f26,	%f26,	%f11
	fmovscs	%xcc,	%f28,	%f7
	xorcc	%l3,	%l4,	%l1
	andn	%o6,	%i6,	%g1
	udivcc	%i2,	0x0CB0,	%i3
	umulcc	%i7,	0x0D74,	%o5
	nop
	set	0x50, %g4
	std	%f10,	[%l7 + %g4]
	udiv	%l5,	0x1E6D,	%g7
	sth	%o3,	[%l7 + 0x26]
	movpos	%icc,	%l0,	%g3
	movle	%xcc,	%o0,	%i4
	fsrc2s	%f7,	%f7
	edge16	%l2,	%o4,	%g6
	array16	%i1,	%o1,	%g4
	fpsub32	%f10,	%f14,	%f18
	stx	%g5,	[%l7 + 0x58]
	fmovdcs	%xcc,	%f13,	%f23
	ldd	[%l7 + 0x08],	%i6
	fmovrsgz	%i5,	%f13,	%f15
	fmovdvs	%xcc,	%f15,	%f2
	sra	%o7,	%o2,	%g2
	movgu	%icc,	%i0,	%l3
	nop
	set	0x5D, %i7
	stb	%l1,	[%l7 + %i7]
	orcc	%o6,	0x1D21,	%i6
	ldd	[%l7 + 0x10],	%g0
	movl	%xcc,	%l4,	%i3
	edge32n	%i2,	%i7,	%o5
	movneg	%icc,	%l5,	%g7
	smul	%o3,	%g3,	%l0
	move	%xcc,	%o0,	%i4
	srlx	%l2,	%g6,	%i1
	save %o4, %o1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g4,	%l6,	%o7
	sethi	0x1807,	%i5
	addc	%o2,	%g2,	%i0
	orn	%l3,	0x1FB6,	%o6
	fcmple32	%f24,	%f12,	%l1
	ldsb	[%l7 + 0x1B],	%i6
	lduh	[%l7 + 0x42],	%l4
	sdivcc	%i3,	0x17FE,	%g1
	xnorcc	%i2,	0x1E90,	%o5
	save %l5, 0x0F61, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i7,	%g3,	%o3
	sdivcc	%o0,	0x083D,	%l0
	movrlz	%i4,	0x0FD,	%g6
	or	%i1,	0x1D6C,	%o4
	fsrc2	%f4,	%f28
	andn	%o1,	%l2,	%g4
	lduh	[%l7 + 0x22],	%g5
	ld	[%l7 + 0x68],	%f30
	array16	%o7,	%i5,	%l6
	subc	%g2,	0x1B56,	%i0
	add	%o2,	%o6,	%l3
	bshuffle	%f24,	%f22,	%f10
	stb	%l1,	[%l7 + 0x6B]
	orcc	%i6,	0x049C,	%l4
	umulcc	%g1,	%i3,	%i2
	subccc	%o5,	0x113C,	%l5
	alignaddr	%i7,	%g3,	%g7
	fmovrse	%o0,	%f15,	%f2
	xnorcc	%o3,	0x103E,	%l0
	add	%g6,	0x0A56,	%i1
	fmovsn	%xcc,	%f17,	%f12
	sub	%o4,	0x07A0,	%i4
	movleu	%xcc,	%o1,	%l2
	edge8	%g4,	%g5,	%i5
	xnor	%o7,	0x0FB4,	%g2
	udivcc	%i0,	0x0AD7,	%o2
	stw	%l6,	[%l7 + 0x3C]
	ldd	[%l7 + 0x18],	%f16
	sub	%l3,	0x07B7,	%l1
	fmovda	%icc,	%f0,	%f11
	subcc	%o6,	0x04A8,	%l4
	umulcc	%i6,	%g1,	%i2
	fones	%f10
	edge32ln	%i3,	%l5,	%i7
	andncc	%o5,	%g3,	%g7
	xorcc	%o3,	%o0,	%g6
	andncc	%i1,	%l0,	%i4
	addccc	%o1,	%l2,	%g4
	stb	%g5,	[%l7 + 0x57]
	array8	%i5,	%o7,	%o4
	edge16	%g2,	%i0,	%l6
	fmovse	%icc,	%f5,	%f23
	edge16ln	%l3,	%o2,	%o6
	srlx	%l4,	%l1,	%i6
	movcs	%xcc,	%i2,	%g1
	fsrc2s	%f14,	%f7
	edge16n	%l5,	%i7,	%i3
	edge8n	%o5,	%g3,	%o3
	lduw	[%l7 + 0x28],	%o0
	edge8l	%g6,	%i1,	%g7
	xnorcc	%i4,	0x0EA7,	%l0
	sethi	0x0FE6,	%l2
	sllx	%g4,	%g5,	%o1
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	ldd	[%l7 + 0x48],	%i0
	sll	%l6,	0x06,	%l3
	sir	0x1B34
	nop
	set	0x28, %l1
	ldd	[%l7 + %l1],	%f28
	addcc	%o2,	%o4,	%o6
	orncc	%l4,	%l1,	%i6
	sra	%g1,	%i2,	%i7
	ldsw	[%l7 + 0x08],	%l5
	sll	%o5,	0x16,	%g3
	movg	%xcc,	%o3,	%o0
	fcmpeq16	%f4,	%f28,	%g6
	fandnot1s	%f4,	%f26,	%f25
	stw	%i3,	[%l7 + 0x30]
	movcs	%xcc,	%i1,	%i4
	edge16l	%l0,	%g7,	%g4
	fmovdneg	%xcc,	%f8,	%f26
	movl	%icc,	%l2,	%g5
	movneg	%icc,	%o7,	%o1
	sllx	%g2,	0x0B,	%i5
	orncc	%i0,	%l3,	%l6
	stw	%o4,	[%l7 + 0x5C]
	ldub	[%l7 + 0x56],	%o2
	movcc	%xcc,	%l4,	%o6
	restore %i6, 0x1EAC, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l1,	%i7,	%l5
	sdiv	%o5,	0x003A,	%i2
	lduw	[%l7 + 0x3C],	%o3
	movleu	%xcc,	%g3,	%o0
	fmovrdgez	%g6,	%f8,	%f8
	fcmpeq16	%f4,	%f12,	%i1
	sethi	0x02FA,	%i4
	addcc	%i3,	0x0A31,	%l0
	addcc	%g4,	0x051D,	%l2
	fabsd	%f28,	%f4
	fors	%f0,	%f5,	%f15
	fmovdl	%xcc,	%f2,	%f25
	fmovdle	%xcc,	%f4,	%f30
	fmovdgu	%xcc,	%f27,	%f24
	udivcc	%g7,	0x1D69,	%g5
	edge8n	%o7,	%o1,	%g2
	subcc	%i0,	0x0EE1,	%l3
	movcc	%xcc,	%l6,	%o4
	edge16l	%o2,	%i5,	%o6
	andncc	%i6,	%g1,	%l4
	fcmpeq32	%f6,	%f10,	%i7
	lduw	[%l7 + 0x60],	%l1
	fmovrdgz	%o5,	%f16,	%f20
	fnegd	%f20,	%f4
	fcmpne32	%f26,	%f16,	%i2
	smul	%l5,	%g3,	%o0
	fmovscc	%icc,	%f2,	%f4
	std	%f26,	[%l7 + 0x50]
	umulcc	%g6,	0x1115,	%o3
	subc	%i4,	%i1,	%i3
	fmovrslz	%l0,	%f20,	%f27
	lduw	[%l7 + 0x08],	%l2
	fmovscc	%icc,	%f8,	%f8
	movneg	%xcc,	%g4,	%g7
	ldd	[%l7 + 0x38],	%f30
	movrlz	%o7,	%g5,	%o1
	edge8ln	%g2,	%l3,	%l6
	alignaddr	%o4,	%o2,	%i5
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	nop
	set	0x24, %o0
	lduw	[%l7 + %o0],	%i6
	edge16ln	%l4,	%i7,	%l1
	stx	%o5,	[%l7 + 0x78]
	addccc	%i2,	%l5,	%g3
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%g6
	fpack32	%f2,	%f16,	%f2
	sth	%o0,	[%l7 + 0x3E]
	xnor	%o3,	%i1,	%i4
	ldsh	[%l7 + 0x6A],	%l0
	fmovda	%xcc,	%f3,	%f24
	movcc	%icc,	%i3,	%l2
	edge32	%g4,	%o7,	%g5
	edge32l	%o1,	%g7,	%g2
	fands	%f6,	%f24,	%f22
	fmovrdne	%l3,	%f30,	%f28
	sllx	%l6,	0x08,	%o4
	movleu	%icc,	%o2,	%i0
	fornot1	%f30,	%f24,	%f30
	ld	[%l7 + 0x64],	%f25
	addcc	%i5,	0x16F1,	%o6
	andcc	%g1,	%l4,	%i6
	movn	%icc,	%i7,	%o5
	edge32n	%i2,	%l5,	%g3
	subc	%g6,	%o0,	%o3
	movg	%xcc,	%i1,	%i4
	edge16ln	%l1,	%l0,	%i3
	stx	%l2,	[%l7 + 0x30]
	fmovrslez	%g4,	%f21,	%f7
	umulcc	%g5,	%o1,	%g7
	ld	[%l7 + 0x30],	%f22
	movl	%xcc,	%g2,	%l3
	fmovde	%xcc,	%f4,	%f12
	alignaddrl	%o7,	%o4,	%o2
	movre	%l6,	0x025,	%i5
	edge32	%i0,	%g1,	%o6
	movrlez	%i6,	%l4,	%o5
	ldx	[%l7 + 0x68],	%i2
	ldd	[%l7 + 0x50],	%i6
	sllx	%g3,	0x1C,	%l5
	edge32n	%g6,	%o0,	%o3
	nop
	set	0x20, %l2
	ldd	[%l7 + %l2],	%i0
	andcc	%l1,	0x1BF3,	%i4
	mulscc	%i3,	%l0,	%l2
	movvs	%icc,	%g5,	%g4
	fmovdge	%xcc,	%f12,	%f16
	lduh	[%l7 + 0x48],	%g7
	edge32l	%o1,	%l3,	%o7
	save %g2, 0x10AA, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o4,	%l6,	%i5
	array8	%i0,	%o6,	%g1
	ldsw	[%l7 + 0x7C],	%i6
	fmovrdgez	%l4,	%f30,	%f14
	for	%f12,	%f2,	%f10
	sdivcc	%i2,	0x104D,	%o5
	fmovrslz	%i7,	%f29,	%f21
	ldub	[%l7 + 0x45],	%g3
	array16	%l5,	%g6,	%o3
	movge	%xcc,	%i1,	%l1
	srax	%i4,	%o0,	%i3
	orcc	%l0,	0x100B,	%l2
	addccc	%g4,	0x15E5,	%g5
	move	%xcc,	%o1,	%l3
	or	%g7,	%o7,	%g2
	edge8n	%o4,	%l6,	%i5
	ldx	[%l7 + 0x20],	%i0
	fcmple16	%f14,	%f24,	%o2
	save %g1, %i6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f11,	%f30
	fpmerge	%f21,	%f28,	%f0
	movne	%icc,	%l4,	%o5
	ldsb	[%l7 + 0x17],	%i2
	subc	%i7,	0x0B73,	%g3
	sdivcc	%g6,	0x1944,	%o3
	orncc	%i1,	0x188A,	%l1
	fpadd16s	%f21,	%f17,	%f15
	xor	%l5,	%i4,	%i3
	sethi	0x124B,	%o0
	or	%l2,	0x1C83,	%l0
	udivcc	%g4,	0x0C8C,	%g5
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%f14
	array16	%l3,	%g7,	%o1
	movge	%icc,	%o7,	%g2
	fpsub32	%f14,	%f4,	%f0
	sir	0x132A
	fmuld8ulx16	%f26,	%f4,	%f2
	edge32ln	%o4,	%l6,	%i5
	movpos	%icc,	%o2,	%g1
	ldd	[%l7 + 0x08],	%f12
	udivcc	%i6,	0x0D96,	%o6
	array8	%l4,	%i0,	%o5
	ldd	[%l7 + 0x40],	%f0
	umul	%i7,	0x0BE1,	%g3
	movrlz	%i2,	%o3,	%i1
	andncc	%g6,	%l1,	%l5
	alignaddr	%i3,	%o0,	%l2
	edge8	%l0,	%g4,	%i4
	ldx	[%l7 + 0x28],	%g5
	movcc	%xcc,	%l3,	%g7
	movgu	%icc,	%o1,	%g2
	ldsw	[%l7 + 0x78],	%o4
	fnands	%f22,	%f20,	%f30
	sllx	%l6,	%i5,	%o7
	lduw	[%l7 + 0x54],	%g1
	andcc	%i6,	0x12CC,	%o2
	nop
	set	0x48, %l5
	std	%f0,	[%l7 + %l5]
	ldsw	[%l7 + 0x34],	%l4
	edge8	%i0,	%o5,	%o6
	sllx	%i7,	0x1A,	%i2
	udiv	%o3,	0x09F9,	%i1
	edge8l	%g6,	%g3,	%l5
	mulscc	%i3,	%l1,	%l2
	sdivx	%o0,	0x1907,	%l0
	ldsh	[%l7 + 0x16],	%i4
	fand	%f2,	%f26,	%f0
	fmovrslz	%g4,	%f8,	%f29
	fnot2s	%f30,	%f30
	movl	%icc,	%l3,	%g5
	fmovsvc	%icc,	%f27,	%f25
	fmovrse	%g7,	%f29,	%f31
	and	%o1,	0x19C2,	%o4
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%g2
	fabsd	%f2,	%f22
	fmovsle	%xcc,	%f27,	%f23
	sth	%i5,	[%l7 + 0x66]
	fnors	%f18,	%f12,	%f17
	alignaddrl	%l6,	%o7,	%i6
	orn	%g1,	0x071E,	%l4
	lduh	[%l7 + 0x6A],	%o2
	orn	%i0,	0x0293,	%o5
	orcc	%i7,	%o6,	%i2
	sdiv	%i1,	0x14E5,	%g6
	smul	%o3,	%l5,	%i3
	xorcc	%l1,	%g3,	%l2
	for	%f20,	%f4,	%f10
	fcmpgt16	%f8,	%f0,	%l0
	orcc	%o0,	0x16D2,	%g4
	smulcc	%i4,	%l3,	%g7
	ldsb	[%l7 + 0x0E],	%o1
	sdiv	%o4,	0x0984,	%g5
	sth	%i5,	[%l7 + 0x30]
	movg	%icc,	%g2,	%o7
	xor	%i6,	%g1,	%l4
	fmovdleu	%icc,	%f4,	%f15
	srl	%o2,	0x06,	%i0
	srl	%o5,	0x1A,	%l6
	edge8	%i7,	%o6,	%i2
	srl	%g6,	0x0E,	%i1
	umulcc	%o3,	0x159E,	%i3
	movcc	%xcc,	%l1,	%l5
	fmovdcs	%icc,	%f20,	%f31
	movre	%g3,	0x2B5,	%l0
	fcmpeq32	%f20,	%f0,	%o0
	andn	%l2,	0x0561,	%g4
	fmovrdgez	%l3,	%f26,	%f20
	movcc	%icc,	%g7,	%i4
	xnor	%o4,	0x1B51,	%g5
	nop
	set	0x28, %g1
	ldd	[%l7 + %g1],	%f24
	array32	%i5,	%o1,	%o7
	array16	%g2,	%i6,	%l4
	edge32n	%g1,	%o2,	%o5
	movl	%xcc,	%l6,	%i0
	movpos	%icc,	%i7,	%o6
	nop
	set	0x7A, %o2
	lduh	[%l7 + %o2],	%i2
	fabss	%f16,	%f22
	edge16ln	%i1,	%g6,	%i3
	movrgez	%o3,	0x393,	%l1
	andcc	%g3,	0x0EC1,	%l5
	movpos	%icc,	%o0,	%l0
	fpack16	%f8,	%f2
	fpack32	%f14,	%f14,	%f8
	addc	%l2,	0x10DF,	%l3
	edge32l	%g4,	%i4,	%g7
	array16	%g5,	%o4,	%o1
	bshuffle	%f18,	%f26,	%f4
	movl	%xcc,	%i5,	%g2
	ldx	[%l7 + 0x10],	%o7
	andncc	%i6,	%l4,	%o2
	umul	%g1,	0x089D,	%l6
	fmovdleu	%xcc,	%f22,	%f21
	st	%f4,	[%l7 + 0x20]
	udivcc	%o5,	0x1429,	%i7
	movge	%xcc,	%i0,	%o6
	lduw	[%l7 + 0x3C],	%i2
	fornot1s	%f4,	%f4,	%f17
	edge16n	%i1,	%g6,	%i3
	movleu	%xcc,	%l1,	%g3
	edge16l	%l5,	%o0,	%o3
	fands	%f0,	%f10,	%f5
	edge16	%l2,	%l3,	%g4
	umul	%l0,	%i4,	%g7
	sdiv	%g5,	0x1BD8,	%o4
	fexpand	%f7,	%f2
	sdiv	%i5,	0x05F2,	%g2
	fmovrslz	%o7,	%f20,	%f15
	smul	%i6,	0x1761,	%o1
	fors	%f10,	%f14,	%f2
	bshuffle	%f24,	%f22,	%f8
	fpsub16s	%f1,	%f11,	%f3
	edge32ln	%o2,	%g1,	%l6
	stw	%o5,	[%l7 + 0x54]
	movne	%xcc,	%i7,	%i0
	fsrc2	%f20,	%f18
	fmovsneg	%xcc,	%f13,	%f17
	subc	%o6,	%i2,	%i1
	sdiv	%l4,	0x101C,	%g6
	edge32	%i3,	%l1,	%l5
	xorcc	%o0,	%o3,	%g3
	edge32n	%l2,	%l3,	%l0
	fors	%f20,	%f6,	%f27
	andncc	%g4,	%i4,	%g5
	srl	%g7,	%i5,	%g2
	ldub	[%l7 + 0x7D],	%o4
	fmovsne	%icc,	%f14,	%f20
	sra	%o7,	0x1B,	%i6
	addcc	%o2,	%g1,	%o1
	movre	%l6,	%o5,	%i0
	ldx	[%l7 + 0x58],	%o6
	sethi	0x02C9,	%i7
	fmovsleu	%xcc,	%f7,	%f14
	ldsb	[%l7 + 0x2B],	%i2
	alignaddrl	%i1,	%g6,	%i3
	edge16ln	%l4,	%l5,	%l1
	ldsh	[%l7 + 0x56],	%o3
	st	%f22,	[%l7 + 0x38]
	udiv	%o0,	0x020F,	%l2
	addcc	%g3,	0x0147,	%l0
	fmovsle	%icc,	%f18,	%f22
	movrne	%g4,	0x10F,	%i4
	fpsub32	%f30,	%f24,	%f22
	ld	[%l7 + 0x74],	%f30
	sra	%g5,	%g7,	%l3
	andn	%i5,	0x1F79,	%g2
	movcs	%icc,	%o7,	%i6
	srl	%o4,	%g1,	%o2
	fmovdvs	%xcc,	%f15,	%f10
	udiv	%o1,	0x00DF,	%l6
	movrgz	%i0,	0x2AA,	%o5
	umulcc	%o6,	0x1595,	%i2
	xorcc	%i7,	%i1,	%i3
	fxors	%f25,	%f31,	%f14
	movrlz	%g6,	0x221,	%l5
	movrgz	%l4,	0x11F,	%l1
	movle	%icc,	%o0,	%o3
	fpsub32s	%f13,	%f9,	%f21
	sth	%l2,	[%l7 + 0x6C]
	sra	%g3,	0x11,	%g4
	fcmpne32	%f4,	%f6,	%i4
	umul	%l0,	0x173F,	%g7
	addccc	%g5,	0x0B51,	%l3
	sir	0x1A14
	xorcc	%g2,	0x1749,	%i5
	array8	%o7,	%o4,	%i6
	smul	%g1,	%o2,	%o1
	array32	%l6,	%o5,	%i0
	fnands	%f22,	%f11,	%f3
	edge32l	%o6,	%i7,	%i1
	ldsb	[%l7 + 0x21],	%i2
	fxnors	%f9,	%f16,	%f7
	fmovrslez	%i3,	%f16,	%f8
	addcc	%g6,	0x17C6,	%l4
	movrlz	%l1,	%o0,	%o3
	srax	%l2,	%g3,	%g4
	fnot1	%f24,	%f14
	st	%f18,	[%l7 + 0x2C]
	nop
	set	0x66, %o4
	ldsb	[%l7 + %o4],	%i4
	fcmpgt16	%f28,	%f14,	%l5
	andn	%l0,	0x0FB7,	%g5
	fmovrsgez	%g7,	%f17,	%f8
	popc	0x01E6,	%l3
	andn	%g2,	0x0510,	%o7
	fmul8x16au	%f3,	%f26,	%f8
	sllx	%o4,	%i5,	%i6
	umulcc	%o2,	%o1,	%g1
	fmovdge	%xcc,	%f13,	%f17
	subc	%l6,	%i0,	%o6
	edge16l	%o5,	%i1,	%i7
	fmovse	%icc,	%f7,	%f5
	movcc	%icc,	%i3,	%g6
	sir	0x1B5F
	add	%l4,	0x08A1,	%l1
	mulscc	%i2,	0x1F0A,	%o0
	subc	%l2,	%g3,	%g4
	movneg	%xcc,	%o3,	%l5
	movn	%xcc,	%i4,	%l0
	edge32l	%g5,	%g7,	%l3
	fmovs	%f10,	%f3
	movrgez	%o7,	0x1DE,	%o4
	sra	%g2,	%i5,	%o2
	edge32	%i6,	%o1,	%g1
	movg	%icc,	%l6,	%i0
	orcc	%o5,	0x13BE,	%o6
	fmovdvc	%icc,	%f26,	%f27
	smulcc	%i1,	%i3,	%g6
	move	%icc,	%l4,	%l1
	ldub	[%l7 + 0x13],	%i2
	array16	%i7,	%l2,	%g3
	movneg	%icc,	%o0,	%o3
	fmovde	%icc,	%f2,	%f26
	fnegd	%f30,	%f2
	sra	%g4,	%l5,	%l0
	addccc	%g5,	0x16B7,	%i4
	movge	%icc,	%l3,	%o7
	fmovdg	%xcc,	%f6,	%f2
	movleu	%xcc,	%o4,	%g2
	sll	%i5,	0x0F,	%g7
	sdiv	%o2,	0x10EC,	%i6
	subcc	%g1,	0x1E42,	%l6
	fmovrse	%o1,	%f25,	%f9
	sir	0x0E21
	andn	%o5,	%i0,	%o6
	subcc	%i3,	0x1284,	%i1
	srlx	%g6,	0x0D,	%l4
	orncc	%l1,	%i2,	%l2
	movne	%icc,	%g3,	%o0
	edge16	%i7,	%g4,	%l5
	movcc	%xcc,	%l0,	%g5
	fmul8x16	%f21,	%f16,	%f22
	movl	%xcc,	%i4,	%l3
	mulscc	%o3,	%o4,	%o7
	lduh	[%l7 + 0x6A],	%i5
	st	%f16,	[%l7 + 0x6C]
	edge32l	%g2,	%o2,	%i6
	stw	%g1,	[%l7 + 0x1C]
	faligndata	%f14,	%f14,	%f16
	edge8l	%l6,	%g7,	%o1
	ldd	[%l7 + 0x40],	%f0
	movcs	%icc,	%o5,	%o6
	movleu	%icc,	%i0,	%i3
	fcmpeq16	%f20,	%f6,	%g6
	fmovdgu	%xcc,	%f13,	%f17
	fpadd32s	%f20,	%f28,	%f29
	edge16ln	%l4,	%l1,	%i2
	mulscc	%l2,	0x01EB,	%g3
	addcc	%o0,	%i7,	%g4
	edge32n	%l5,	%l0,	%g5
	xnor	%i1,	%i4,	%l3
	popc	0x1EA0,	%o4
	fpadd16s	%f6,	%f18,	%f9
	fmovsvc	%icc,	%f13,	%f22
	edge16	%o3,	%i5,	%g2
	udiv	%o7,	0x132E,	%o2
	srl	%g1,	%i6,	%g7
	sethi	0x0A05,	%o1
	fxnors	%f6,	%f23,	%f0
	udivcc	%l6,	0x16A8,	%o5
	ldub	[%l7 + 0x26],	%o6
	ldd	[%l7 + 0x38],	%i2
	addc	%g6,	0x0A66,	%i0
	alignaddr	%l4,	%l1,	%i2
	movle	%icc,	%l2,	%o0
	std	%f26,	[%l7 + 0x08]
	fnot2	%f6,	%f14
	fors	%f25,	%f24,	%f4
	sethi	0x0288,	%g3
	addccc	%i7,	0x11BC,	%l5
	movne	%icc,	%g4,	%l0
	fmovrsgez	%g5,	%f22,	%f25
	mulscc	%i1,	0x0437,	%i4
	edge16l	%l3,	%o3,	%o4
	movleu	%icc,	%i5,	%o7
	sllx	%o2,	%g2,	%i6
	sub	%g7,	%o1,	%l6
	sethi	0x0E08,	%g1
	smulcc	%o5,	%i3,	%g6
	udivx	%o6,	0x1E1D,	%l4
	array32	%i0,	%i2,	%l1
	ldd	[%l7 + 0x48],	%f20
	fpmerge	%f16,	%f0,	%f30
	srl	%l2,	0x16,	%g3
	edge32n	%i7,	%o0,	%g4
	lduh	[%l7 + 0x08],	%l0
	edge8l	%g5,	%l5,	%i1
	movle	%xcc,	%i4,	%l3
	xorcc	%o4,	0x1E51,	%o3
	ldub	[%l7 + 0x6F],	%o7
	udiv	%i5,	0x16BA,	%o2
	ldsw	[%l7 + 0x48],	%g2
	movrgez	%i6,	0x1FF,	%o1
	alignaddrl	%g7,	%l6,	%o5
	xnor	%g1,	0x1FB7,	%i3
	umul	%g6,	%l4,	%i0
	and	%o6,	0x0963,	%l1
	movrlez	%i2,	%l2,	%i7
	move	%xcc,	%g3,	%o0
	udivx	%g4,	0x0755,	%g5
	fnor	%f18,	%f28,	%f4
	std	%f20,	[%l7 + 0x70]
	movn	%xcc,	%l5,	%l0
	andncc	%i1,	%i4,	%o4
	fmovsle	%icc,	%f7,	%f1
	udiv	%l3,	0x181B,	%o3
	mulx	%i5,	0x0513,	%o7
	andn	%o2,	0x1099,	%g2
	addccc	%i6,	%g7,	%o1
	addcc	%o5,	%l6,	%i3
	fmovsgu	%xcc,	%f3,	%f1
	subc	%g1,	0x0BA3,	%g6
	andn	%i0,	0x1E9D,	%l4
	orn	%o6,	%l1,	%i2
	restore %l2, %i7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g4,	%f0,	%f0
	udiv	%g3,	0x05E5,	%l5
	and	%g5,	%l0,	%i1
	move	%icc,	%o4,	%l3
	edge16	%i4,	%o3,	%i5
	sth	%o7,	[%l7 + 0x28]
	edge16ln	%g2,	%i6,	%g7
	ldub	[%l7 + 0x37],	%o1
	movpos	%xcc,	%o5,	%o2
	move	%icc,	%l6,	%g1
	smul	%i3,	0x0262,	%i0
	movrgez	%g6,	0x3FC,	%o6
	mulx	%l1,	%l4,	%i2
	sdivx	%l2,	0x1C8A,	%i7
	movle	%xcc,	%g4,	%g3
	orn	%o0,	%l5,	%g5
	movrlez	%l0,	0x344,	%o4
	edge16	%l3,	%i4,	%o3
	movcc	%icc,	%i5,	%o7
	movcc	%xcc,	%i1,	%g2
	mova	%icc,	%i6,	%o1
	edge32	%g7,	%o5,	%o2
	movle	%icc,	%l6,	%g1
	sethi	0x0B4A,	%i0
	smul	%g6,	%o6,	%l1
	edge32l	%i3,	%i2,	%l4
	fmovdne	%xcc,	%f31,	%f1
	array8	%l2,	%g4,	%i7
	and	%o0,	0x1C9E,	%g3
	fsrc2s	%f8,	%f23
	movne	%xcc,	%g5,	%l0
	subc	%l5,	0x1EDE,	%l3
	stw	%o4,	[%l7 + 0x70]
	edge8l	%i4,	%i5,	%o7
	xorcc	%i1,	%o3,	%i6
	move	%icc,	%g2,	%g7
	smulcc	%o1,	0x0AA1,	%o5
	udivx	%o2,	0x1623,	%l6
	fmovsn	%xcc,	%f8,	%f11
	edge32ln	%g1,	%g6,	%i0
	andn	%o6,	%i3,	%i2
	movl	%icc,	%l4,	%l2
	stx	%l1,	[%l7 + 0x60]
	fmovsne	%icc,	%f13,	%f3
	sth	%i7,	[%l7 + 0x28]
	mulscc	%o0,	0x12C6,	%g4
	fcmpeq16	%f2,	%f20,	%g3
	movneg	%icc,	%l0,	%l5
	ldd	[%l7 + 0x50],	%f2
	edge16n	%g5,	%l3,	%i4
	smul	%o4,	0x0A7B,	%o7
	edge32ln	%i1,	%o3,	%i6
	move	%xcc,	%g2,	%i5
	edge8ln	%o1,	%o5,	%g7
	movn	%xcc,	%o2,	%g1
	edge8ln	%l6,	%i0,	%o6
	ldub	[%l7 + 0x67],	%g6
	or	%i2,	0x1449,	%l4
	udivx	%i3,	0x1A69,	%l1
	umul	%i7,	%o0,	%l2
	andncc	%g4,	%l0,	%g3
	udivx	%l5,	0x10F4,	%g5
	andncc	%l3,	%o4,	%o7
	addcc	%i1,	0x1FB9,	%i4
	subcc	%i6,	%g2,	%o3
	edge8ln	%i5,	%o1,	%o5
	fmovsle	%icc,	%f16,	%f18
	fsrc1s	%f0,	%f12
	std	%f8,	[%l7 + 0x78]
	orncc	%o2,	0x0ECD,	%g1
	sth	%g7,	[%l7 + 0x52]
	xor	%l6,	0x0880,	%o6
	orn	%g6,	%i2,	%i0
	addc	%l4,	%l1,	%i7
	fmovsa	%icc,	%f11,	%f11
	stb	%o0,	[%l7 + 0x61]
	andncc	%l2,	%i3,	%l0
	fmovrsgez	%g4,	%f19,	%f26
	fmovse	%icc,	%f7,	%f2
	fcmpgt32	%f12,	%f18,	%g3
	andcc	%g5,	%l3,	%o4
	edge32l	%o7,	%l5,	%i1
	edge8l	%i4,	%i6,	%g2
	fmovrsgez	%o3,	%f0,	%f31
	stx	%o1,	[%l7 + 0x18]
	addcc	%i5,	%o5,	%o2
	fmovdpos	%xcc,	%f27,	%f17
	or	%g1,	%g7,	%l6
	fmovdgu	%xcc,	%f0,	%f0
	xnor	%o6,	%i2,	%i0
	sth	%g6,	[%l7 + 0x78]
	movgu	%xcc,	%l4,	%i7
	subc	%o0,	%l1,	%l2
	movre	%i3,	0x1F6,	%l0
	fcmpgt16	%f20,	%f4,	%g3
	ldub	[%l7 + 0x10],	%g4
	smulcc	%g5,	%o4,	%o7
	fmovdpos	%icc,	%f28,	%f0
	fsrc2s	%f12,	%f19
	movge	%icc,	%l5,	%l3
	xorcc	%i4,	0x0F71,	%i1
	xor	%g2,	%o3,	%o1
	edge16ln	%i5,	%o5,	%i6
	ldd	[%l7 + 0x20],	%f6
	edge16ln	%o2,	%g7,	%l6
	movleu	%xcc,	%g1,	%o6
	movg	%icc,	%i2,	%g6
	movpos	%xcc,	%i0,	%i7
	nop
	set	0x6C, %l0
	lduw	[%l7 + %l0],	%l4
	fmovdpos	%icc,	%f16,	%f0
	ldx	[%l7 + 0x30],	%l1
	edge16l	%l2,	%i3,	%l0
	ldx	[%l7 + 0x68],	%o0
	std	%f28,	[%l7 + 0x18]
	orncc	%g4,	0x0F5A,	%g5
	fmovsne	%icc,	%f5,	%f17
	ldsh	[%l7 + 0x7C],	%g3
	edge8n	%o7,	%l5,	%l3
	edge8n	%i4,	%o4,	%g2
	smulcc	%i1,	0x1E3E,	%o3
	and	%i5,	%o1,	%o5
	st	%f8,	[%l7 + 0x68]
	edge32ln	%o2,	%i6,	%g7
	edge16	%g1,	%l6,	%o6
	stb	%i2,	[%l7 + 0x67]
	movrne	%i0,	%g6,	%l4
	or	%i7,	0x1519,	%l2
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	sdiv	%o0,	0x03E4,	%g4
	ldsh	[%l7 + 0x0C],	%l0
	xor	%g3,	%g5,	%o7
	fmovd	%f4,	%f30
	fpack32	%f22,	%f10,	%f16
	st	%f15,	[%l7 + 0x70]
	movcc	%icc,	%l5,	%l3
	edge32n	%i4,	%o4,	%g2
	stx	%o3,	[%l7 + 0x18]
	andcc	%i1,	%o1,	%i5
	fones	%f3
	alignaddrl	%o2,	%o5,	%i6
	and	%g7,	0x0524,	%l6
	movrgez	%o6,	%i2,	%g1
	andcc	%g6,	0x0050,	%i0
	sdivcc	%l4,	0x0E2D,	%i7
	std	%f12,	[%l7 + 0x20]
	array32	%l2,	%i3,	%l1
	movneg	%xcc,	%g4,	%o0
	orncc	%g3,	0x12B3,	%g5
	movle	%xcc,	%l0,	%o7
	movle	%icc,	%l3,	%l5
	for	%f2,	%f28,	%f26
	udiv	%i4,	0x1AA6,	%g2
	movle	%xcc,	%o3,	%i1
	sethi	0x1523,	%o4
	andn	%i5,	%o1,	%o2
	andncc	%i6,	%g7,	%o5
	lduw	[%l7 + 0x7C],	%l6
	smulcc	%o6,	%g1,	%i2
	movcc	%xcc,	%i0,	%g6
	fsrc1	%f24,	%f24
	fmovde	%icc,	%f15,	%f8
	std	%f18,	[%l7 + 0x08]
	edge16ln	%i7,	%l2,	%l4
	movge	%xcc,	%i3,	%l1
	sub	%g4,	%g3,	%o0
	fandnot2	%f8,	%f2,	%f20
	edge32ln	%g5,	%o7,	%l0
	ldsb	[%l7 + 0x11],	%l3
	edge32l	%i4,	%g2,	%l5
	fmovdvc	%icc,	%f10,	%f30
	sdivx	%i1,	0x177A,	%o4
	fmovsvc	%xcc,	%f6,	%f28
	movgu	%icc,	%o3,	%o1
	orcc	%o2,	%i5,	%i6
	movrlez	%o5,	0x1DD,	%l6
	movcc	%icc,	%o6,	%g1
	restore %g7, 0x1834, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g6,	%f24,	%f4
	edge16n	%i2,	%l2,	%i7
	ldsw	[%l7 + 0x1C],	%l4
	nop
	set	0x48, %g3
	lduw	[%l7 + %g3],	%i3
	mulx	%g4,	0x0E7C,	%g3
	andcc	%l1,	0x11B6,	%o0
	edge16	%o7,	%l0,	%g5
	fmovrdne	%i4,	%f28,	%f10
	fornot1s	%f13,	%f15,	%f28
	stx	%g2,	[%l7 + 0x68]
	andn	%l3,	%i1,	%l5
	xnorcc	%o3,	%o1,	%o4
	nop
	set	0x30, %i6
	ldsw	[%l7 + %i6],	%i5
	andncc	%o2,	%o5,	%i6
	fmovda	%xcc,	%f7,	%f11
	ldd	[%l7 + 0x70],	%i6
	edge16	%g1,	%g7,	%i0
	ldub	[%l7 + 0x6D],	%g6
	movn	%icc,	%o6,	%i2
	sth	%l2,	[%l7 + 0x6A]
	fornot2	%f16,	%f10,	%f24
	or	%i7,	0x1E6E,	%i3
	fmovsvc	%xcc,	%f26,	%f17
	ldd	[%l7 + 0x78],	%f4
	sdivcc	%l4,	0x1221,	%g4
	and	%l1,	0x1FF4,	%o0
	sdiv	%o7,	0x18A3,	%l0
	addcc	%g3,	0x1B96,	%g5
	fmovrdgz	%i4,	%f24,	%f6
	movrne	%l3,	%g2,	%l5
	subccc	%i1,	0x11D9,	%o1
	subcc	%o4,	%i5,	%o3
	ldsb	[%l7 + 0x7A],	%o2
	movg	%xcc,	%i6,	%l6
	ldsb	[%l7 + 0x56],	%g1
	fmul8sux16	%f24,	%f22,	%f28
	mulscc	%g7,	%o5,	%i0
	movneg	%icc,	%g6,	%o6
	fnors	%f9,	%f3,	%f0
	udiv	%i2,	0x1698,	%i7
	sdiv	%i3,	0x15AA,	%l4
	mulx	%g4,	%l1,	%o0
	movl	%icc,	%l2,	%o7
	udivcc	%g3,	0x0A00,	%l0
	movcc	%xcc,	%i4,	%l3
	edge8	%g2,	%l5,	%i1
	fmovrsgez	%g5,	%f30,	%f21
	ldd	[%l7 + 0x60],	%o0
	fpsub32s	%f9,	%f10,	%f1
	movpos	%icc,	%i5,	%o3
	srl	%o2,	0x16,	%i6
	movn	%icc,	%o4,	%l6
	movcs	%icc,	%g1,	%g7
	movrgz	%o5,	0x108,	%i0
	addccc	%g6,	0x1080,	%o6
	orn	%i7,	%i2,	%l4
	fmovdn	%icc,	%f10,	%f12
	st	%f5,	[%l7 + 0x38]
	edge8n	%i3,	%g4,	%l1
	addcc	%l2,	0x0AF5,	%o0
	fmovdneg	%xcc,	%f14,	%f14
	lduw	[%l7 + 0x50],	%o7
	orcc	%l0,	%g3,	%l3
	fmovsne	%xcc,	%f7,	%f30
	movgu	%icc,	%i4,	%l5
	andcc	%i1,	%g5,	%g2
	edge16n	%i5,	%o1,	%o2
	save %i6, 0x180D, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x0A, %g7
	ldsh	[%l7 + %g7],	%o4
	movrlz	%l6,	%g7,	%g1
	fornot2s	%f4,	%f14,	%f9
	stx	%o5,	[%l7 + 0x30]
	edge8l	%g6,	%o6,	%i7
	mulscc	%i0,	0x0A17,	%l4
	ldd	[%l7 + 0x28],	%f10
	sdivx	%i2,	0x0249,	%i3
	fmovdg	%icc,	%f19,	%f13
	stw	%g4,	[%l7 + 0x50]
	stb	%l2,	[%l7 + 0x67]
	movre	%o0,	%o7,	%l0
	subccc	%g3,	%l1,	%l3
	smul	%l5,	%i4,	%g5
	nop
	set	0x70, %g5
	std	%f28,	[%l7 + %g5]
	fmovsvc	%xcc,	%f13,	%f6
	edge32l	%i1,	%g2,	%o1
	std	%f28,	[%l7 + 0x50]
	mova	%xcc,	%o2,	%i6
	fmovrslez	%i5,	%f6,	%f1
	fmovrsne	%o4,	%f10,	%f15
	sethi	0x0FBB,	%l6
	fmovs	%f26,	%f3
	movg	%icc,	%o3,	%g1
	fmovrslez	%o5,	%f12,	%f13
	movrgz	%g6,	%o6,	%i7
	fmovrdlez	%g7,	%f0,	%f28
	movleu	%xcc,	%i0,	%l4
	fmovrdgz	%i2,	%f24,	%f26
	andn	%g4,	%l2,	%o0
	sdivx	%i3,	0x13CA,	%l0
	movle	%xcc,	%o7,	%g3
	edge8l	%l1,	%l3,	%l5
	movrgez	%g5,	0x0FB,	%i4
	addcc	%i1,	%o1,	%g2
	edge8l	%i6,	%i5,	%o4
	faligndata	%f2,	%f0,	%f10
	movge	%xcc,	%o2,	%l6
	or	%g1,	0x0BE3,	%o3
	ldd	[%l7 + 0x58],	%o4
	ldsh	[%l7 + 0x7C],	%o6
	fornot1	%f22,	%f20,	%f12
	movrne	%i7,	0x30F,	%g7
	mulx	%i0,	%l4,	%g6
	fmovdcs	%icc,	%f0,	%f5
	movcc	%xcc,	%g4,	%i2
	edge8ln	%o0,	%i3,	%l2
	xnorcc	%l0,	0x062E,	%g3
	fnot2	%f4,	%f14
	edge16l	%l1,	%l3,	%o7
	fmovrsgz	%g5,	%f15,	%f6
	movg	%icc,	%l5,	%i1
	movleu	%xcc,	%o1,	%g2
	or	%i4,	0x0FCD,	%i5
	edge32l	%o4,	%i6,	%l6
	fmovdvc	%xcc,	%f0,	%f26
	edge8l	%g1,	%o2,	%o3
	save %o5, 0x0EF4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0E4B,	%g7
	fornot1s	%f6,	%f23,	%f13
	fmovrslz	%i0,	%f0,	%f0
	stx	%l4,	[%l7 + 0x10]
	edge16ln	%g6,	%o6,	%i2
	array16	%g4,	%i3,	%o0
	ldx	[%l7 + 0x70],	%l0
	array8	%l2,	%g3,	%l3
	andncc	%o7,	%l1,	%g5
	sth	%i1,	[%l7 + 0x4C]
	fmovsgu	%icc,	%f24,	%f7
	orn	%o1,	%l5,	%i4
	fmovdvc	%icc,	%f16,	%f4
	ldsw	[%l7 + 0x38],	%i5
	edge32ln	%o4,	%g2,	%l6
	edge16n	%g1,	%i6,	%o2
	sir	0x0A34
	srax	%o3,	%i7,	%o5
	movne	%icc,	%i0,	%l4
	ldsw	[%l7 + 0x6C],	%g7
	ldsh	[%l7 + 0x4E],	%g6
	sdivx	%i2,	0x07D7,	%g4
	orncc	%i3,	0x030F,	%o6
	stx	%l0,	[%l7 + 0x28]
	sdiv	%l2,	0x1768,	%g3
	movpos	%icc,	%o0,	%l3
	mova	%xcc,	%o7,	%g5
	ldsw	[%l7 + 0x74],	%l1
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	udivx	%i4,	0x11E8,	%i5
	andn	%g2,	0x10F2,	%o4
	fmuld8ulx16	%f3,	%f17,	%f28
	movcs	%xcc,	%l6,	%i6
	subccc	%o2,	%o3,	%g1
	movg	%xcc,	%i7,	%o5
	mova	%xcc,	%l4,	%g7
	mulscc	%i0,	%i2,	%g6
	movn	%icc,	%i3,	%o6
	orncc	%g4,	0x12D2,	%l2
	fmovrslez	%l0,	%f31,	%f21
	alignaddrl	%o0,	%l3,	%g3
	andn	%o7,	0x197B,	%l1
	fsrc1	%f28,	%f30
	array32	%g5,	%i1,	%o1
	addccc	%l5,	0x1AD6,	%i4
	movleu	%xcc,	%i5,	%o4
	smulcc	%g2,	%i6,	%o2
	movrgez	%o3,	%g1,	%l6
	sll	%i7,	0x18,	%l4
	subc	%o5,	%g7,	%i0
	ldub	[%l7 + 0x30],	%g6
	movcc	%icc,	%i2,	%i3
	movle	%icc,	%g4,	%l2
	movvc	%icc,	%l0,	%o6
	udiv	%o0,	0x181C,	%g3
	sll	%l3,	%o7,	%l1
	fmul8x16	%f27,	%f28,	%f4
	stw	%g5,	[%l7 + 0x6C]
	smul	%i1,	0x03C2,	%o1
	movge	%xcc,	%l5,	%i5
	sra	%o4,	0x0C,	%g2
	subc	%i4,	%o2,	%o3
	movvs	%xcc,	%g1,	%i6
	movneg	%icc,	%i7,	%l6
	movvs	%xcc,	%o5,	%l4
	movl	%icc,	%g7,	%g6
	or	%i0,	%i3,	%g4
	umul	%i2,	0x1E7C,	%l0
	movrlez	%l2,	0x203,	%o6
	movrne	%o0,	%g3,	%o7
	xor	%l1,	0x0678,	%g5
	subc	%l3,	%i1,	%o1
	movvc	%xcc,	%i5,	%l5
	edge8	%g2,	%o4,	%o2
	subcc	%i4,	%g1,	%o3
	array8	%i6,	%l6,	%i7
	ldsh	[%l7 + 0x6E],	%l4
	edge32ln	%g7,	%o5,	%i0
	array32	%g6,	%i3,	%g4
	smul	%i2,	%l0,	%o6
	ldd	[%l7 + 0x10],	%f0
	fcmpne16	%f14,	%f18,	%o0
	andncc	%l2,	%o7,	%g3
	alignaddr	%g5,	%l3,	%l1
	fmovd	%f4,	%f20
	addc	%i1,	%i5,	%o1
	edge16ln	%g2,	%o4,	%o2
	edge8l	%i4,	%g1,	%o3
	fpsub16	%f16,	%f12,	%f20
	movvc	%icc,	%i6,	%l5
	fmovdgu	%icc,	%f31,	%f22
	ldx	[%l7 + 0x70],	%i7
	fcmped	%fcc3,	%f16,	%f8
	pdist	%f6,	%f14,	%f14
	array32	%l4,	%l6,	%o5
	movrne	%g7,	%i0,	%i3
	fmovdcc	%icc,	%f1,	%f14
	sra	%g6,	0x1A,	%i2
	smulcc	%g4,	%l0,	%o6
	umul	%o0,	%l2,	%g3
	xnorcc	%o7,	%g5,	%l1
	movleu	%xcc,	%i1,	%i5
	sra	%o1,	0x17,	%l3
	edge32ln	%o4,	%o2,	%g2
	fmovdcc	%xcc,	%f14,	%f12
	fpackfix	%f12,	%f24
	movvc	%icc,	%g1,	%o3
	nop
	set	0x24, %g2
	ldsb	[%l7 + %g2],	%i4
	fabsd	%f30,	%f18
	fmovsleu	%xcc,	%f28,	%f18
	srl	%l5,	%i7,	%l4
	subccc	%l6,	%o5,	%i6
	movvc	%xcc,	%i0,	%g7
	popc	%i3,	%i2
	subc	%g4,	0x0CF8,	%g6
	movl	%xcc,	%o6,	%l0
	movvc	%xcc,	%o0,	%l2
	xor	%g3,	0x13F6,	%o7
	movne	%icc,	%l1,	%i1
	fzeros	%f12
	sdivx	%g5,	0x11DE,	%i5
	std	%f8,	[%l7 + 0x28]
	udiv	%l3,	0x047B,	%o4
	fxnor	%f14,	%f30,	%f22
	edge32n	%o2,	%g2,	%g1
	movvc	%icc,	%o3,	%i4
	lduw	[%l7 + 0x34],	%o1
	stw	%l5,	[%l7 + 0x50]
	lduh	[%l7 + 0x56],	%i7
	edge8n	%l6,	%l4,	%o5
	fnegs	%f27,	%f23
	movge	%xcc,	%i6,	%i0
	fnands	%f8,	%f6,	%f8
	movg	%xcc,	%i3,	%i2
	movvc	%xcc,	%g7,	%g4
	movn	%xcc,	%g6,	%l0
	bshuffle	%f14,	%f26,	%f26
	fmovrslz	%o0,	%f11,	%f13
	movvs	%xcc,	%o6,	%l2
	array32	%o7,	%g3,	%i1
	movrne	%g5,	0x0CB,	%i5
	movvs	%icc,	%l3,	%l1
	xnorcc	%o4,	0x0B7F,	%o2
	movn	%xcc,	%g1,	%g2
	lduh	[%l7 + 0x3C],	%o3
	nop
	set	0x67, %i0
	ldub	[%l7 + %i0],	%o1
	ldsh	[%l7 + 0x4A],	%l5
	movne	%xcc,	%i7,	%l6
	addcc	%i4,	%l4,	%o5
	nop
	set	0x0A, %o3
	sth	%i6,	[%l7 + %o3]
	fmovdn	%icc,	%f28,	%f15
	fcmpd	%fcc2,	%f10,	%f8
	fmovdleu	%icc,	%f27,	%f24
	move	%xcc,	%i3,	%i2
	edge16ln	%g7,	%g4,	%i0
	stx	%g6,	[%l7 + 0x58]
	and	%o0,	%l0,	%l2
	add	%o6,	%g3,	%i1
	edge8ln	%o7,	%g5,	%l3
	addcc	%l1,	%i5,	%o2
	sth	%o4,	[%l7 + 0x12]
	fnegs	%f17,	%f9
	movvs	%xcc,	%g2,	%o3
	fmovdne	%icc,	%f17,	%f27
	movrlz	%o1,	%g1,	%i7
	save %l5, 0x14FC, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l6,	%o5,	%l4
	fmovspos	%icc,	%f26,	%f28
	movrgez	%i3,	%i2,	%g7
	addccc	%i6,	0x1A7C,	%g4
	fcmped	%fcc2,	%f4,	%f30
	mulscc	%g6,	%i0,	%o0
	array16	%l0,	%o6,	%g3
	sll	%i1,	%l2,	%g5
	edge8ln	%o7,	%l3,	%l1
	addc	%i5,	0x117B,	%o4
	fandnot1s	%f7,	%f21,	%f16
	udivcc	%g2,	0x0AF5,	%o3
	fone	%f4
	sethi	0x07A0,	%o1
	nop
	set	0x78, %i3
	std	%f24,	[%l7 + %i3]
	movleu	%icc,	%g1,	%o2
	mulx	%l5,	0x028E,	%i4
	array16	%i7,	%l6,	%l4
	udiv	%i3,	0x1101,	%o5
	nop
	set	0x79, %i1
	ldub	[%l7 + %i1],	%i2
	udivx	%g7,	0x1C9F,	%g4
	addcc	%g6,	%i6,	%o0
	subcc	%i0,	%l0,	%g3
	mova	%xcc,	%o6,	%l2
	addc	%g5,	0x1C4B,	%i1
	orncc	%l3,	%l1,	%i5
	movvs	%xcc,	%o7,	%o4
	movvs	%icc,	%g2,	%o1
	movrlez	%o3,	0x336,	%o2
	sth	%g1,	[%l7 + 0x46]
	movrne	%i4,	0x089,	%i7
	xor	%l6,	%l5,	%l4
	edge8n	%i3,	%i2,	%g7
	save %o5, 0x09A5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g4,	%o0
	restore %i6, 0x17E3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1D1B,	%g3
	sdivx	%l0,	0x169D,	%o6
	mova	%icc,	%g5,	%l2
	fcmpeq16	%f18,	%f28,	%i1
	xnorcc	%l3,	0x011C,	%l1
	fornot2s	%f16,	%f23,	%f7
	movcs	%xcc,	%o7,	%o4
	stb	%i5,	[%l7 + 0x75]
	fmovsa	%xcc,	%f24,	%f0
	sra	%g2,	%o1,	%o2
	andn	%o3,	0x0423,	%g1
	fxnors	%f31,	%f22,	%f28
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	movgu	%xcc,	%l5,	%i3
	fcmpne32	%f8,	%f18,	%l4
	udiv	%g7,	0x14FD,	%i2
	movne	%xcc,	%g6,	%g4
	edge8l	%o0,	%o5,	%i0
	add	%g3,	0x0C0E,	%i6
	edge32l	%o6,	%g5,	%l2
	save %i1, %l0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	0x1133,	%o7
	ldub	[%l7 + 0x52],	%i5
	movpos	%icc,	%o4,	%o1
	movl	%icc,	%g2,	%o2
	fnand	%f26,	%f24,	%f30
	sdiv	%g1,	0x0461,	%o3
	fabsd	%f8,	%f18
	sethi	0x04DE,	%i4
	fcmpes	%fcc2,	%f21,	%f6
	ldd	[%l7 + 0x08],	%f12
	sethi	0x0DC0,	%i7
	ldd	[%l7 + 0x10],	%f8
	sll	%l6,	0x12,	%i3
	array16	%l5,	%g7,	%i2
	fmovrslz	%g6,	%f30,	%f7
	ldd	[%l7 + 0x18],	%l4
	fmovda	%xcc,	%f9,	%f27
	edge32n	%o0,	%g4,	%i0
	sdiv	%o5,	0x084F,	%g3
	stw	%o6,	[%l7 + 0x44]
	fcmple32	%f18,	%f28,	%g5
	edge16n	%l2,	%i1,	%i6
	movrgz	%l1,	0x301,	%l0
	movrlz	%l3,	0x305,	%o7
	addccc	%o4,	%i5,	%o1
	subc	%o2,	0x0297,	%g1
	fnand	%f0,	%f30,	%f16
	orncc	%g2,	0x1256,	%o3
	andcc	%i7,	0x1712,	%i4
	ldub	[%l7 + 0x6F],	%l6
	movrgez	%i3,	%g7,	%i2
	save %g6, %l5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%o0,	0x001A,	%g4
	fone	%f28
	movrgz	%o5,	%g3,	%i0
	array16	%g5,	%l2,	%i1
	edge32n	%i6,	%o6,	%l0
	udivx	%l3,	0x1E75,	%o7
	mova	%xcc,	%l1,	%i5
	movpos	%icc,	%o1,	%o2
	addcc	%o4,	%g2,	%o3
	edge32n	%g1,	%i4,	%i7
	and	%l6,	0x1385,	%g7
	siam	0x4
	subcc	%i3,	0x10A5,	%i2
	fandnot1s	%f4,	%f25,	%f7
	ldub	[%l7 + 0x36],	%g6
	movcc	%icc,	%l4,	%l5
	addcc	%o0,	0x0116,	%o5
	edge16l	%g3,	%g4,	%g5
	xnorcc	%l2,	%i0,	%i1
	mulx	%i6,	%l0,	%l3
	restore %o6, %o7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i5,	%o1
	fpsub32	%f28,	%f8,	%f24
	edge8l	%o4,	%g2,	%o2
	srax	%g1,	%i4,	%i7
	ldd	[%l7 + 0x48],	%i6
	fmovrsne	%g7,	%f10,	%f14
	alignaddr	%i3,	%o3,	%i2
	fmovrse	%l4,	%f0,	%f7
	subccc	%g6,	%l5,	%o0
	mulscc	%g3,	%o5,	%g4
	edge8l	%l2,	%g5,	%i1
	siam	0x5
	movn	%xcc,	%i6,	%l0
	edge16	%l3,	%o6,	%i0
	fandnot1s	%f25,	%f19,	%f10
	fmovrdgez	%o7,	%f24,	%f10
	smulcc	%i5,	0x0359,	%o1
	save %o4, 0x02B9, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l1,	%o2,	%g1
	movl	%icc,	%i4,	%i7
	ldsb	[%l7 + 0x32],	%l6
	stx	%i3,	[%l7 + 0x50]
	andcc	%o3,	0x07E5,	%i2
	ldd	[%l7 + 0x08],	%f16
	sethi	0x02C9,	%g7
	fmovscs	%icc,	%f17,	%f27
	fnot2s	%f4,	%f11
	fmovdne	%xcc,	%f5,	%f8
	and	%l4,	0x035B,	%g6
	umul	%l5,	%o0,	%o5
	stw	%g4,	[%l7 + 0x2C]
	xnor	%l2,	%g3,	%i1
	array32	%g5,	%i6,	%l0
	umulcc	%l3,	%o6,	%o7
	fpsub16	%f0,	%f18,	%f18
	movcs	%xcc,	%i5,	%o1
	movre	%o4,	%i0,	%g2
	edge32l	%l1,	%g1,	%i4
	edge8	%o2,	%i7,	%l6
	fmovsg	%xcc,	%f24,	%f21
	sir	0x0A78
	edge8ln	%o3,	%i2,	%g7
	sethi	0x0CC8,	%l4
	addccc	%g6,	%l5,	%o0
	and	%i3,	%o5,	%l2
	alignaddr	%g4,	%g3,	%g5
	array32	%i1,	%l0,	%i6
	alignaddr	%l3,	%o6,	%i5
	edge32ln	%o1,	%o4,	%o7
	stx	%g2,	[%l7 + 0x70]
	subccc	%i0,	%l1,	%i4
	orncc	%o2,	%g1,	%i7
	sllx	%l6,	%i2,	%o3
	nop
	set	0x70, %i4
	stw	%g7,	[%l7 + %i4]
	bshuffle	%f10,	%f12,	%f8
	movne	%xcc,	%g6,	%l4
	subccc	%o0,	%i3,	%o5
	udivx	%l5,	0x1DEA,	%g4
	movg	%xcc,	%g3,	%g5
	fone	%f18
	movcc	%icc,	%i1,	%l0
	edge8	%l2,	%l3,	%i6
	fmovdgu	%xcc,	%f15,	%f10
	fabsd	%f24,	%f14
	st	%f18,	[%l7 + 0x6C]
	movrne	%i5,	0x206,	%o6
	edge32l	%o4,	%o7,	%g2
	fandnot2	%f16,	%f26,	%f16
	fornot2s	%f22,	%f6,	%f27
	movrgez	%o1,	%i0,	%l1
	movleu	%icc,	%i4,	%o2
	movne	%xcc,	%i7,	%l6
	fnands	%f29,	%f4,	%f10
	nop
	set	0x40, %o1
	stb	%g1,	[%l7 + %o1]
	fcmpes	%fcc0,	%f29,	%f7
	fpadd32s	%f26,	%f1,	%f15
	ldsb	[%l7 + 0x1D],	%o3
	array16	%g7,	%i2,	%g6
	fmovscc	%xcc,	%f29,	%f21
	udiv	%l4,	0x16AE,	%i3
	fsrc1s	%f0,	%f22
	srl	%o0,	%o5,	%g4
	andn	%l5,	%g5,	%g3
	sth	%l0,	[%l7 + 0x08]
	ldsb	[%l7 + 0x51],	%i1
	stb	%l2,	[%l7 + 0x27]
	movrlz	%l3,	0x32B,	%i6
	movvs	%icc,	%o6,	%i5
	fmovsle	%icc,	%f23,	%f9
	fmovsneg	%icc,	%f22,	%f3
	fzero	%f4
	movne	%xcc,	%o7,	%o4
	or	%g2,	0x0753,	%o1
	movpos	%xcc,	%l1,	%i0
	sub	%o2,	%i4,	%i7
	movleu	%xcc,	%g1,	%l6
	umulcc	%g7,	%o3,	%g6
	edge32n	%i2,	%i3,	%o0
	sllx	%l4,	0x0E,	%o5
	movg	%icc,	%l5,	%g5
	movg	%icc,	%g4,	%g3
	fpsub32	%f18,	%f14,	%f20
	subc	%i1,	%l2,	%l3
	movre	%l0,	%o6,	%i5
	movgu	%icc,	%i6,	%o4
	std	%f4,	[%l7 + 0x78]
	movvs	%xcc,	%g2,	%o7
	movle	%xcc,	%l1,	%o1
	subc	%i0,	0x0B42,	%o2
	fpadd32	%f30,	%f6,	%f20
	ldsw	[%l7 + 0x70],	%i7
	fmul8x16au	%f15,	%f11,	%f24
	edge16ln	%i4,	%l6,	%g1
	fone	%f6
	sdivx	%g7,	0x04F8,	%g6
	movge	%icc,	%i2,	%o3
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	srax	%l5,	%g5,	%i3
	movre	%g4,	%i1,	%g3
	fmuld8sux16	%f8,	%f12,	%f24
	siam	0x4
	alignaddrl	%l2,	%l0,	%l3
	fpack16	%f10,	%f20
	fcmpes	%fcc3,	%f19,	%f16
	sethi	0x0DC5,	%o6
	sdiv	%i6,	0x0B43,	%i5
	sdivcc	%g2,	0x05CC,	%o7
	andn	%o4,	0x0E7E,	%l1
	subc	%i0,	%o1,	%i7
	movl	%icc,	%o2,	%i4
	and	%l6,	0x000B,	%g7
	save %g1, 0x1C60, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g6,	0x0C9,	%o0
	edge8l	%l4,	%o3,	%l5
	udivx	%o5,	0x0DD0,	%g5
	sll	%g4,	0x1C,	%i3
	fsrc1	%f2,	%f20
	ldub	[%l7 + 0x7A],	%i1
	edge8n	%l2,	%g3,	%l0
	movleu	%xcc,	%l3,	%i6
	fmovdneg	%icc,	%f16,	%f22
	orncc	%i5,	0x15CB,	%o6
	sra	%o7,	0x06,	%g2
	movleu	%icc,	%o4,	%i0
	orncc	%o1,	0x1DC3,	%l1
	fmovdpos	%icc,	%f28,	%f20
	add	%i7,	%o2,	%i4
	stx	%l6,	[%l7 + 0x68]
	nop
	set	0x60, %o7
	std	%f22,	[%l7 + %o7]
	edge16	%g1,	%i2,	%g7
	edge16n	%g6,	%l4,	%o0
	fandnot2s	%f9,	%f16,	%f12
	ld	[%l7 + 0x1C],	%f17
	edge32l	%l5,	%o5,	%g5
	fmul8x16au	%f15,	%f13,	%f18
	movrgz	%g4,	0x1BB,	%i3
	xor	%o3,	0x18B5,	%l2
	movneg	%xcc,	%i1,	%g3
	array16	%l3,	%l0,	%i5
	udivx	%i6,	0x004A,	%o6
	alignaddr	%o7,	%o4,	%i0
	fmovrsne	%o1,	%f4,	%f11
	xor	%g2,	%l1,	%i7
	movg	%icc,	%i4,	%o2
	movneg	%xcc,	%l6,	%g1
	srlx	%g7,	0x0C,	%g6
	movg	%icc,	%l4,	%i2
	stb	%l5,	[%l7 + 0x79]
	ldx	[%l7 + 0x18],	%o0
	fcmpeq16	%f28,	%f4,	%o5
	movle	%xcc,	%g5,	%i3
	ldsw	[%l7 + 0x68],	%g4
	fand	%f24,	%f20,	%f20
	edge8	%l2,	%o3,	%i1
	nop
	set	0x54, %o5
	lduw	[%l7 + %o5],	%l3
	subc	%l0,	0x1ECE,	%g3
	movg	%xcc,	%i6,	%o6
	stx	%i5,	[%l7 + 0x10]
	ld	[%l7 + 0x14],	%f24
	edge32l	%o7,	%o4,	%i0
	fcmps	%fcc1,	%f25,	%f12
	edge8ln	%o1,	%g2,	%l1
	sdiv	%i7,	0x06AE,	%i4
	udivx	%o2,	0x006F,	%l6
	movneg	%icc,	%g7,	%g1
	subcc	%g6,	0x0748,	%l4
	ldd	[%l7 + 0x70],	%i2
	fmovrsne	%l5,	%f19,	%f13
	sth	%o5,	[%l7 + 0x70]
	edge8ln	%o0,	%g5,	%i3
	and	%g4,	%l2,	%o3
	move	%icc,	%l3,	%l0
	fmovrslz	%i1,	%f20,	%f16
	movrgz	%i6,	%o6,	%g3
	movrlz	%o7,	%i5,	%o4
	sllx	%i0,	%o1,	%g2
	xnor	%i7,	%l1,	%i4
	fmovsgu	%icc,	%f7,	%f13
	edge32ln	%l6,	%o2,	%g7
	addcc	%g6,	%g1,	%l4
	andncc	%l5,	%i2,	%o5
	edge16l	%g5,	%i3,	%o0
	addccc	%g4,	0x04F9,	%l2
	movvc	%icc,	%l3,	%o3
	fcmple16	%f12,	%f22,	%i1
	fnors	%f7,	%f17,	%f15
	ldub	[%l7 + 0x7C],	%l0
	sdiv	%i6,	0x1A1D,	%o6
	stw	%o7,	[%l7 + 0x14]
	fmovrdgz	%i5,	%f20,	%f6
	movcs	%xcc,	%g3,	%i0
	movpos	%icc,	%o1,	%o4
	array16	%g2,	%l1,	%i4
	sllx	%l6,	0x0A,	%o2
	sll	%i7,	%g7,	%g1
	sdiv	%g6,	0x0C68,	%l4
	movre	%i2,	%l5,	%o5
	sub	%g5,	%i3,	%g4
	fcmpd	%fcc2,	%f6,	%f2
	fcmpes	%fcc0,	%f0,	%f23
	and	%l2,	0x1364,	%l3
	addccc	%o3,	%i1,	%l0
	fmovscc	%icc,	%f29,	%f3
	smul	%o0,	0x1EA5,	%i6
	fmovsg	%icc,	%f30,	%f18
	fmovrdlez	%o7,	%f2,	%f2
	fmovdpos	%icc,	%f1,	%f23
	stb	%i5,	[%l7 + 0x24]
	ldsw	[%l7 + 0x28],	%g3
	ldd	[%l7 + 0x28],	%f16
	edge32n	%i0,	%o1,	%o4
	mova	%xcc,	%o6,	%l1
	fmuld8sux16	%f19,	%f11,	%f24
	movrne	%i4,	%g2,	%l6
	addccc	%o2,	0x1FBE,	%i7
	ldsh	[%l7 + 0x1C],	%g7
	movle	%xcc,	%g6,	%g1
	fmovrdne	%i2,	%f20,	%f24
	orcc	%l4,	0x0E6B,	%o5
	udivcc	%l5,	0x1A85,	%i3
	movne	%xcc,	%g4,	%g5
	sub	%l2,	0x0254,	%o3
	nop
	set	0x60, %i2
	ldx	[%l7 + %i2],	%l3
	ldsh	[%l7 + 0x52],	%i1
	fsrc2	%f18,	%f30
	movge	%icc,	%l0,	%i6
	sth	%o7,	[%l7 + 0x46]
	fcmpne32	%f22,	%f14,	%i5
	fmovdg	%xcc,	%f29,	%f31
	fandnot2	%f24,	%f8,	%f10
	array16	%o0,	%g3,	%i0
	orncc	%o4,	%o6,	%o1
	edge32n	%l1,	%g2,	%i4
	movrlez	%o2,	0x07F,	%l6
	ldd	[%l7 + 0x48],	%i6
	mulx	%g7,	0x18E0,	%g6
	orn	%g1,	%l4,	%o5
	add	%i2,	0x17A6,	%l5
	and	%i3,	%g4,	%l2
	ldx	[%l7 + 0x30],	%o3
	stx	%g5,	[%l7 + 0x50]
	fmovsvc	%icc,	%f23,	%f2
	st	%f15,	[%l7 + 0x48]
	srlx	%l3,	%l0,	%i1
	fandnot2	%f6,	%f2,	%f16
	fandnot2	%f16,	%f10,	%f6
	movcc	%xcc,	%i6,	%i5
	fnegd	%f28,	%f8
	movneg	%xcc,	%o7,	%o0
	xorcc	%g3,	0x1739,	%i0
	fornot1	%f4,	%f28,	%f24
	sra	%o6,	%o1,	%l1
	xorcc	%g2,	%i4,	%o2
	sra	%o4,	0x19,	%l6
	sdivcc	%g7,	0x1926,	%i7
	edge8	%g6,	%l4,	%o5
	stx	%g1,	[%l7 + 0x30]
	sll	%i2,	%i3,	%g4
	movg	%icc,	%l2,	%l5
	srl	%g5,	0x1B,	%o3
	edge16	%l0,	%i1,	%i6
	addcc	%l3,	0x078D,	%o7
	srlx	%i5,	0x0F,	%o0
	ld	[%l7 + 0x10],	%f31
	subcc	%i0,	%o6,	%g3
	movne	%xcc,	%o1,	%l1
	fcmple32	%f2,	%f18,	%i4
	fnot2s	%f8,	%f8
	fornot1s	%f18,	%f31,	%f0
	fpsub16	%f18,	%f14,	%f6
	sir	0x1311
	xnor	%g2,	%o2,	%l6
	save %o4, %g7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l4,	%g6,	%o5
	stx	%i2,	[%l7 + 0x50]
	movgu	%xcc,	%g1,	%i3
	ldd	[%l7 + 0x48],	%f6
	movge	%xcc,	%l2,	%g4
	fpackfix	%f20,	%f4
	for	%f30,	%f28,	%f24
	xorcc	%l5,	%o3,	%g5
	subccc	%i1,	0x077F,	%i6
	umulcc	%l3,	%l0,	%i5
	edge16l	%o7,	%o0,	%o6
	andcc	%i0,	%g3,	%l1
	nop
	set	0x4C, %o6
	lduw	[%l7 + %o6],	%i4
	sdivx	%g2,	0x0C74,	%o2
	sub	%o1,	%o4,	%g7
	ldub	[%l7 + 0x7A],	%l6
	ldsh	[%l7 + 0x46],	%i7
	sethi	0x137A,	%g6
	movvc	%icc,	%o5,	%l4
	sdivcc	%i2,	0x0F88,	%i3
	stx	%g1,	[%l7 + 0x78]
	ldub	[%l7 + 0x6D],	%g4
	sra	%l2,	0x00,	%l5
	edge32n	%o3,	%i1,	%g5
	edge16l	%i6,	%l3,	%i5
	edge16l	%l0,	%o7,	%o0
	movne	%icc,	%i0,	%o6
	sll	%g3,	%l1,	%i4
	for	%f2,	%f12,	%f20
	addcc	%o2,	%g2,	%o4
	movpos	%xcc,	%o1,	%l6
	pdist	%f26,	%f26,	%f0
	array8	%i7,	%g7,	%g6
	edge32n	%o5,	%l4,	%i3
	fmovscc	%xcc,	%f11,	%f31
	fand	%f24,	%f18,	%f10
	for	%f4,	%f2,	%f0
	sir	0x1546
	ldd	[%l7 + 0x30],	%f20
	smul	%g1,	%i2,	%l2
	fmovda	%xcc,	%f26,	%f13
	edge16l	%g4,	%l5,	%i1
	edge8	%o3,	%i6,	%g5
	movg	%icc,	%l3,	%i5
	fnegs	%f29,	%f12
	subc	%l0,	0x0F31,	%o7
	fxnor	%f6,	%f30,	%f20
	sethi	0x0109,	%i0
	edge32	%o6,	%g3,	%o0
	fmovdvs	%icc,	%f4,	%f14
	fmovsg	%icc,	%f22,	%f1
	movn	%xcc,	%i4,	%o2
	edge32l	%l1,	%o4,	%o1
	stb	%g2,	[%l7 + 0x32]
	ldsw	[%l7 + 0x34],	%i7
	addccc	%g7,	0x1849,	%g6
	edge32n	%o5,	%l4,	%i3
	fcmps	%fcc1,	%f20,	%f23
	addcc	%g1,	%i2,	%l6
	edge32l	%g4,	%l2,	%l5
	sethi	0x07E5,	%o3
	popc	0x14E4,	%i6
	alignaddr	%i1,	%l3,	%i5
	lduh	[%l7 + 0x6A],	%g5
	xnorcc	%l0,	0x05DF,	%o7
	stx	%o6,	[%l7 + 0x70]
	fmovde	%icc,	%f0,	%f11
	movn	%xcc,	%i0,	%o0
	fone	%f0
	sdivx	%g3,	0x1433,	%o2
	andcc	%l1,	%o4,	%o1
	movneg	%icc,	%i4,	%i7
	xnor	%g2,	%g6,	%g7
	ld	[%l7 + 0x18],	%f3
	stb	%o5,	[%l7 + 0x28]
	array32	%l4,	%i3,	%i2
	fnegd	%f0,	%f30
	xnor	%g1,	0x02C8,	%l6
	fmovdcc	%icc,	%f9,	%f1
	movcs	%icc,	%l2,	%l5
	fandnot1	%f12,	%f22,	%f16
	sllx	%g4,	0x19,	%i6
	edge16n	%i1,	%l3,	%o3
	mulx	%g5,	%i5,	%l0
	fcmpeq16	%f22,	%f10,	%o6
	fpadd16	%f2,	%f2,	%f30
	udivcc	%o7,	0x0583,	%o0
	addccc	%g3,	0x156C,	%o2
	edge32	%i0,	%o4,	%o1
	sdivx	%i4,	0x1C5E,	%l1
	subccc	%i7,	0x064E,	%g6
	array32	%g2,	%o5,	%g7
	fxor	%f0,	%f28,	%f8
	st	%f21,	[%l7 + 0x44]
	movle	%xcc,	%i3,	%l4
	and	%i2,	0x11BB,	%g1
	array16	%l6,	%l2,	%g4
	fandnot1s	%f1,	%f24,	%f20
	sdivx	%l5,	0x0194,	%i1
	fnor	%f24,	%f22,	%f2
	edge16n	%l3,	%i6,	%o3
	fmovs	%f18,	%f2
	array8	%i5,	%l0,	%o6
	fmovrsgz	%g5,	%f16,	%f10
	movcc	%icc,	%o7,	%o0
	fmuld8ulx16	%f14,	%f20,	%f0
	movrlez	%o2,	0x09C,	%g3
	andcc	%o4,	0x0814,	%o1
	sllx	%i4,	0x0F,	%i0
	std	%f0,	[%l7 + 0x30]
	fmovrslez	%l1,	%f4,	%f4
	movvs	%xcc,	%i7,	%g6
	ldsw	[%l7 + 0x14],	%o5
	movrne	%g2,	0x3FF,	%i3
	fmul8x16	%f30,	%f6,	%f28
	sll	%g7,	%i2,	%g1
	xor	%l4,	%l2,	%g4
	movre	%l6,	%i1,	%l5
	nop
	set	0x58, %l4
	stx	%i6,	[%l7 + %l4]
	movvc	%icc,	%l3,	%o3
	move	%icc,	%i5,	%l0
	subccc	%o6,	%g5,	%o7
	edge32l	%o0,	%o2,	%g3
	sdivx	%o1,	0x1BDD,	%i4
	movvc	%xcc,	%i0,	%l1
	fornot2s	%f28,	%f0,	%f29
	fxnors	%f30,	%f27,	%f12
	ld	[%l7 + 0x18],	%f17
	edge32n	%i7,	%g6,	%o4
	fxor	%f0,	%f28,	%f8
	move	%xcc,	%g2,	%i3
	sdiv	%g7,	0x015B,	%i2
	movrgz	%o5,	%g1,	%l4
	std	%f20,	[%l7 + 0x78]
	subcc	%l2,	%g4,	%i1
	array8	%l5,	%l6,	%i6
	lduh	[%l7 + 0x36],	%l3
	and	%o3,	0x0E3B,	%i5
	movne	%icc,	%o6,	%l0
	edge32ln	%o7,	%g5,	%o2
	movneg	%xcc,	%o0,	%o1
	fnot2	%f4,	%f10
	umul	%g3,	0x0518,	%i0
	lduh	[%l7 + 0x54],	%i4
	addc	%i7,	%g6,	%o4
	fpmerge	%f21,	%f18,	%f16
	ldd	[%l7 + 0x38],	%g2
	sdivcc	%l1,	0x1664,	%g7
	movpos	%xcc,	%i3,	%o5
	ldsw	[%l7 + 0x68],	%g1
	edge16ln	%l4,	%i2,	%g4
	fnands	%f4,	%f29,	%f23
	and	%i1,	%l2,	%l5
	addcc	%i6,	0x0598,	%l6
	addccc	%l3,	%o3,	%o6
	fmovdle	%icc,	%f18,	%f1
	st	%f30,	[%l7 + 0x08]
	movcs	%xcc,	%l0,	%i5
	and	%g5,	%o7,	%o0
	restore %o1, %g3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i4,	0x0A1D,	%i0
	addcc	%g6,	0x1683,	%i7
	fmovdl	%icc,	%f28,	%f27
	sethi	0x0362,	%o4
	std	%f6,	[%l7 + 0x28]
	fmovdcc	%icc,	%f6,	%f8
	fmovdneg	%xcc,	%f26,	%f27
	stx	%g2,	[%l7 + 0x20]
	fcmple16	%f16,	%f4,	%l1
	udivcc	%i3,	0x0979,	%o5
	umul	%g1,	0x02E2,	%l4
	ldsh	[%l7 + 0x54],	%g7
	umulcc	%i2,	0x1CB4,	%i1
	ldsh	[%l7 + 0x26],	%g4
	fmovdleu	%icc,	%f27,	%f20
	sir	0x1E5F
	movvc	%icc,	%l5,	%i6
	ld	[%l7 + 0x5C],	%f16
	lduw	[%l7 + 0x10],	%l6
	mulscc	%l2,	0x163C,	%o3
	edge32l	%l3,	%l0,	%i5
	movrgez	%g5,	0x131,	%o7
	fmovdneg	%xcc,	%f28,	%f1
	st	%f1,	[%l7 + 0x3C]
	movg	%xcc,	%o6,	%o0
	fnot1	%f6,	%f24
	edge32l	%g3,	%o2,	%o1
	andn	%i0,	0x0097,	%i4
	mulx	%i7,	0x1349,	%o4
	edge16l	%g6,	%l1,	%i3
	fabss	%f2,	%f1
	subccc	%g2,	0x0C14,	%o5
	movne	%icc,	%g1,	%l4
	orncc	%i2,	%g7,	%g4
	sdivx	%i1,	0x03A7,	%l5
	ldsh	[%l7 + 0x66],	%l6
	xorcc	%i6,	0x0454,	%o3
	fmovsvc	%icc,	%f14,	%f22
	orcc	%l3,	%l2,	%i5
	mova	%icc,	%g5,	%l0
	stx	%o6,	[%l7 + 0x28]
	edge8	%o0,	%g3,	%o7
	srl	%o1,	%i0,	%i4
	fmovdvc	%xcc,	%f18,	%f17
	fsrc2	%f6,	%f4
	ldd	[%l7 + 0x60],	%i6
	fmovspos	%xcc,	%f19,	%f30
	fnegs	%f7,	%f26
	ldub	[%l7 + 0x25],	%o2
	movg	%icc,	%g6,	%o4
	movrlez	%i3,	%l1,	%g2
	movge	%xcc,	%g1,	%o5
	ldd	[%l7 + 0x58],	%f16
	edge8l	%l4,	%g7,	%g4
	movrgez	%i1,	0x212,	%l5
	andn	%i2,	%i6,	%l6
	movrlez	%l3,	%o3,	%l2
	fand	%f4,	%f24,	%f2
	movcc	%xcc,	%i5,	%l0
	edge16l	%g5,	%o0,	%o6
	save %o7, %g3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i4,	%i0,	%o2
	andncc	%i7,	%o4,	%i3
	sth	%l1,	[%l7 + 0x42]
	movpos	%icc,	%g2,	%g1
	fmul8ulx16	%f20,	%f16,	%f18
	movre	%g6,	%o5,	%l4
	sdivx	%g4,	0x19DA,	%i1
	fcmpd	%fcc3,	%f10,	%f14
	movrne	%g7,	%i2,	%l5
	stb	%l6,	[%l7 + 0x54]
	movrlz	%l3,	0x20D,	%o3
	xnorcc	%i6,	0x0ABB,	%i5
	xnorcc	%l2,	%g5,	%o0
	lduh	[%l7 + 0x44],	%o6
	fmovdleu	%icc,	%f27,	%f7
	sub	%l0,	0x0CE7,	%g3
	fcmpne16	%f30,	%f4,	%o1
	fmovsvs	%icc,	%f25,	%f16
	edge16n	%i4,	%i0,	%o2
	udivcc	%o7,	0x12B0,	%i7
	srl	%i3,	%o4,	%g2
	fnor	%f22,	%f12,	%f14
	fornot2	%f28,	%f16,	%f4
	edge8n	%l1,	%g6,	%o5
	sra	%l4,	0x1A,	%g4
	sdiv	%g1,	0x085E,	%i1
	movgu	%icc,	%i2,	%g7
	orcc	%l5,	%l6,	%o3
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	std	%f24,	[%l7 + 0x30]
	mulscc	%i6,	0x156E,	%l2
	fsrc2s	%f13,	%f2
	orncc	%o0,	%g5,	%l0
	pdist	%f0,	%f30,	%f6
	andncc	%g3,	%o6,	%o1
	array32	%i4,	%i0,	%o7
	subc	%i7,	0x047A,	%o2
	movcs	%icc,	%i3,	%o4
	movrgz	%l1,	0x0FD,	%g6
	st	%f2,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x58],	%o5
	movrlz	%g2,	%g4,	%l4
	fmovda	%icc,	%f24,	%f3
	save %g1, 0x0D18, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i2,	0x09E3,	%l5
	edge8	%l6,	%o3,	%g7
	array32	%l3,	%i6,	%l2
	ldsb	[%l7 + 0x13],	%o0
	srax	%i5,	0x1C,	%l0
	sra	%g5,	0x07,	%o6
	xnorcc	%g3,	%o1,	%i0
	movneg	%icc,	%i4,	%o7
	fcmpeq16	%f12,	%f18,	%o2
	mulx	%i7,	0x125E,	%o4
	stb	%l1,	[%l7 + 0x26]
	ld	[%l7 + 0x60],	%f31
	and	%i3,	%o5,	%g2
	movrgez	%g4,	%l4,	%g6
	stb	%i1,	[%l7 + 0x77]
	andncc	%g1,	%i2,	%l6
	sethi	0x0C08,	%o3
	andcc	%l5,	%l3,	%g7
	srlx	%i6,	%o0,	%i5
	edge8	%l2,	%l0,	%g5
	ldub	[%l7 + 0x16],	%o6
	mulscc	%o1,	%i0,	%i4
	movcc	%icc,	%g3,	%o2
	ld	[%l7 + 0x38],	%f29
	popc	%i7,	%o7
	fmovs	%f17,	%f26
	subcc	%o4,	0x0412,	%i3
	sra	%l1,	%g2,	%o5
	std	%f8,	[%l7 + 0x50]
	alignaddrl	%g4,	%g6,	%l4
	movneg	%xcc,	%i1,	%i2
	popc	%g1,	%l6
	srax	%l5,	0x1B,	%o3
	subccc	%l3,	0x19D0,	%i6
	popc	0x0F62,	%g7
	movle	%icc,	%i5,	%l2
	xnorcc	%l0,	%g5,	%o0
	edge32ln	%o1,	%o6,	%i4
	movg	%xcc,	%i0,	%g3
	movrlez	%i7,	%o2,	%o4
	fcmpeq16	%f30,	%f30,	%i3
	movrne	%o7,	%l1,	%o5
	fmovsn	%xcc,	%f15,	%f12
	fnot1	%f6,	%f20
	fpadd16s	%f28,	%f11,	%f24
	popc	%g2,	%g4
	bshuffle	%f22,	%f28,	%f10
	move	%icc,	%g6,	%i1
	mulscc	%i2,	0x0018,	%g1
	fmul8x16au	%f25,	%f3,	%f22
	restore %l4, %l5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l3,	%l6,	%g7
	srax	%i5,	0x1D,	%l2
	fmul8ulx16	%f10,	%f6,	%f0
	srlx	%l0,	%g5,	%i6
	movn	%xcc,	%o1,	%o0
	alignaddr	%i4,	%i0,	%g3
	movl	%icc,	%i7,	%o2
	fmovse	%xcc,	%f28,	%f14
	addccc	%o6,	%o4,	%o7
	array16	%l1,	%o5,	%g2
	sir	0x1F4D
	edge8ln	%g4,	%g6,	%i1
	movcc	%icc,	%i3,	%i2
	movn	%icc,	%g1,	%l4
	sllx	%l5,	0x1B,	%o3
	edge16n	%l3,	%g7,	%l6
	movcs	%icc,	%i5,	%l2
	fmovs	%f19,	%f18
	stw	%l0,	[%l7 + 0x5C]
	movn	%icc,	%g5,	%i6
	edge32n	%o0,	%o1,	%i0
	fexpand	%f28,	%f30
	ldsb	[%l7 + 0x1B],	%i4
	edge8l	%i7,	%o2,	%o6
	smulcc	%g3,	%o4,	%o7
	fand	%f6,	%f28,	%f14
	fnand	%f20,	%f28,	%f10
	fornot2s	%f26,	%f1,	%f13
	movne	%xcc,	%l1,	%g2
	fmovsvs	%icc,	%f21,	%f28
	movrlz	%g4,	%o5,	%i1
	sdiv	%i3,	0x0814,	%i2
	sll	%g1,	%g6,	%l4
	sdivx	%o3,	0x0C3C,	%l5
	lduw	[%l7 + 0x14],	%l3
	fmovsle	%icc,	%f0,	%f28
	orcc	%g7,	0x0C9A,	%i5
	fsrc2s	%f17,	%f2
	sdivcc	%l2,	0x03CF,	%l0
	ldub	[%l7 + 0x52],	%l6
	ldd	[%l7 + 0x10],	%f20
	xnor	%g5,	%i6,	%o0
	edge16ln	%o1,	%i0,	%i7
	alignaddrl	%i4,	%o2,	%o6
	sth	%g3,	[%l7 + 0x76]
	andncc	%o7,	%l1,	%o4
	stx	%g2,	[%l7 + 0x28]
	fmovrdgz	%g4,	%f4,	%f30
	movpos	%icc,	%o5,	%i1
	fmovdne	%icc,	%f6,	%f16
	or	%i3,	%g1,	%g6
	bshuffle	%f26,	%f24,	%f8
	fmovsvc	%icc,	%f24,	%f13
	edge32ln	%l4,	%o3,	%l5
	movvc	%xcc,	%i2,	%l3
	movg	%xcc,	%i5,	%l2
	array32	%l0,	%g7,	%g5
	fpadd32	%f12,	%f24,	%f12
	edge16n	%i6,	%o0,	%l6
	movneg	%xcc,	%i0,	%o1
	movrgz	%i4,	0x21D,	%o2
	movle	%xcc,	%o6,	%g3
	movle	%icc,	%o7,	%l1
	ldsh	[%l7 + 0x22],	%o4
	fnot2s	%f22,	%f25
	sll	%i7,	%g4,	%g2
	addccc	%i1,	%i3,	%o5
	udivx	%g1,	0x1E92,	%l4
	movpos	%xcc,	%g6,	%l5
	mulx	%i2,	%o3,	%l3
	array32	%i5,	%l0,	%g7
	ld	[%l7 + 0x30],	%f26
	fmovrse	%g5,	%f15,	%f13
	edge16ln	%i6,	%o0,	%l2
	edge32l	%l6,	%i0,	%i4
	mova	%icc,	%o1,	%o2
	movpos	%icc,	%o6,	%g3
	sdivcc	%l1,	0x00C5,	%o7
	stb	%i7,	[%l7 + 0x26]
	fmovdpos	%xcc,	%f0,	%f14
	addccc	%o4,	0x183A,	%g2
	ldd	[%l7 + 0x78],	%i0
	fmovsn	%icc,	%f21,	%f23
	edge16ln	%i3,	%g4,	%g1
	fcmpd	%fcc3,	%f30,	%f22
	movvs	%icc,	%l4,	%g6
	add	%l5,	%o5,	%i2
	fcmpne32	%f14,	%f28,	%o3
	ldsh	[%l7 + 0x14],	%i5
	ldd	[%l7 + 0x60],	%l0
	ld	[%l7 + 0x64],	%f31
	edge8ln	%l3,	%g7,	%i6
	fmovdcc	%xcc,	%f20,	%f16
	umul	%o0,	%g5,	%l6
	sir	0x055D
	movn	%xcc,	%l2,	%i0
	fmovsgu	%icc,	%f1,	%f25
	fmovscs	%xcc,	%f24,	%f19
	sth	%i4,	[%l7 + 0x08]
	fsrc2	%f28,	%f18
	umulcc	%o1,	0x02D1,	%o6
	fsrc1s	%f26,	%f18
	sdivx	%g3,	0x15C5,	%o2
	fcmpeq16	%f22,	%f26,	%l1
	edge8ln	%i7,	%o7,	%o4
	fpsub32	%f30,	%f6,	%f0
	movrlz	%g2,	%i3,	%i1
	st	%f19,	[%l7 + 0x6C]
	fpadd16s	%f6,	%f31,	%f17
	srax	%g4,	0x17,	%l4
	st	%f0,	[%l7 + 0x3C]
	fcmpne16	%f30,	%f10,	%g6
	movge	%icc,	%l5,	%g1
	subc	%o5,	%i2,	%i5
	pdist	%f28,	%f18,	%f30
	fmovsneg	%icc,	%f13,	%f5
	ld	[%l7 + 0x2C],	%f24
	alignaddr	%o3,	%l0,	%g7
	addcc	%l3,	%i6,	%o0
	movre	%g5,	%l6,	%l2
	movn	%xcc,	%i0,	%i4
	udivcc	%o1,	0x1109,	%o6
	fandnot1	%f6,	%f26,	%f30
	udivcc	%o2,	0x1BB4,	%l1
	sll	%g3,	0x09,	%i7
	array8	%o7,	%g2,	%i3
	edge16	%o4,	%i1,	%l4
	fmovrsne	%g4,	%f12,	%f12
	ldd	[%l7 + 0x60],	%g6
	movrgz	%g1,	%l5,	%o5
	mova	%icc,	%i2,	%i5
	fxor	%f30,	%f14,	%f12
	edge8l	%o3,	%g7,	%l3
	orcc	%i6,	0x0324,	%l0
	smulcc	%g5,	0x1563,	%l6
	andcc	%l2,	%i0,	%i4
	movge	%icc,	%o1,	%o0
	mova	%icc,	%o2,	%o6
	alignaddrl	%g3,	%l1,	%o7
	sir	0x19AA
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	movre	%i7,	0x2F0,	%i1
	fabss	%f27,	%f16
	subcc	%l4,	0x015F,	%g4
	srl	%o4,	0x1A,	%g6
	fmovsl	%xcc,	%f2,	%f30
	fmovrslez	%g1,	%f4,	%f10
	movgu	%icc,	%l5,	%i2
	edge16	%i5,	%o5,	%o3
	nop
	set	0x50, %l6
	stw	%l3,	[%l7 + %l6]
	stb	%i6,	[%l7 + 0x5A]
	st	%f26,	[%l7 + 0x48]
	xnorcc	%l0,	%g7,	%l6
	subccc	%l2,	%i0,	%g5
	stx	%o1,	[%l7 + 0x08]
	ld	[%l7 + 0x30],	%f24
	movvc	%icc,	%o0,	%o2
	ldx	[%l7 + 0x38],	%i4
	or	%o6,	0x0928,	%l1
	sdiv	%o7,	0x15F0,	%g3
	for	%f26,	%f20,	%f22
	movrne	%g2,	%i3,	%i7
	xor	%i1,	0x0E69,	%l4
	restore %o4, 0x066A, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g4, 0x1F75, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%xcc,	%f7,	%f29
	srlx	%g1,	0x0C,	%i2
	ldd	[%l7 + 0x48],	%o4
	sllx	%o3,	0x16,	%l3
	movneg	%xcc,	%i5,	%i6
	fsrc1s	%f23,	%f13
	orncc	%g7,	0x0817,	%l0
	fpadd16s	%f12,	%f29,	%f17
	movrgz	%l6,	0x0EE,	%i0
	sethi	0x0804,	%l2
	stx	%g5,	[%l7 + 0x68]
	array16	%o0,	%o2,	%i4
	fcmpd	%fcc3,	%f28,	%f4
	sdivx	%o1,	0x01EA,	%l1
	srl	%o6,	%g3,	%g2
	sethi	0x1142,	%i3
	ldsb	[%l7 + 0x1A],	%i7
	movle	%icc,	%i1,	%l4
	andcc	%o4,	%o7,	%g4
	stb	%l5,	[%l7 + 0x39]
	smul	%g1,	%g6,	%o5
	fpmerge	%f25,	%f22,	%f10
	edge32n	%o3,	%i2,	%l3
	sll	%i6,	0x09,	%i5
	fandnot2s	%f14,	%f12,	%f20
	fcmpeq16	%f4,	%f4,	%l0
	xnorcc	%l6,	%i0,	%g7
	ldsw	[%l7 + 0x6C],	%g5
	udivcc	%o0,	0x1C3D,	%l2
	fsrc1	%f22,	%f14
	movge	%icc,	%i4,	%o1
	edge8	%l1,	%o6,	%o2
	popc	%g2,	%i3
	ldsw	[%l7 + 0x30],	%g3
	movle	%icc,	%i1,	%i7
	ldub	[%l7 + 0x4D],	%o4
	and	%l4,	0x0434,	%o7
	sdivcc	%g4,	0x130B,	%g1
	fnegs	%f23,	%f23
	ldsw	[%l7 + 0x50],	%l5
	stb	%g6,	[%l7 + 0x7D]
	array32	%o3,	%i2,	%l3
	edge32	%i6,	%i5,	%o5
	ldd	[%l7 + 0x38],	%i6
	xor	%i0,	0x0148,	%g7
	mova	%icc,	%g5,	%o0
	movpos	%xcc,	%l2,	%l0
	fnand	%f6,	%f20,	%f8
	ldsh	[%l7 + 0x50],	%i4
	fmul8x16al	%f30,	%f29,	%f22
	movl	%icc,	%o1,	%o6
	orn	%l1,	%o2,	%i3
	fpackfix	%f20,	%f12
	movne	%icc,	%g3,	%i1
	or	%g2,	0x1F0E,	%i7
	fmovrdgz	%l4,	%f10,	%f14
	fsrc2s	%f22,	%f5
	movcs	%icc,	%o4,	%g4
	subccc	%g1,	0x0A0C,	%l5
	movpos	%icc,	%g6,	%o7
	sethi	0x1583,	%i2
	nop
	set	0x7E, %i7
	lduh	[%l7 + %i7],	%o3
	addccc	%l3,	%i5,	%i6
	movcs	%xcc,	%o5,	%l6
	ldub	[%l7 + 0x4A],	%i0
	nop
	set	0x10, %g4
	ldsb	[%l7 + %g4],	%g7
	edge16ln	%o0,	%l2,	%g5
	movl	%icc,	%l0,	%o1
	fcmped	%fcc2,	%f16,	%f6
	edge32ln	%i4,	%l1,	%o2
	array8	%o6,	%g3,	%i1
	add	%g2,	%i3,	%l4
	fmovdne	%xcc,	%f14,	%f7
	edge8n	%i7,	%o4,	%g4
	alignaddrl	%g1,	%g6,	%o7
	edge16	%l5,	%o3,	%i2
	fandnot1	%f0,	%f2,	%f8
	edge32l	%i5,	%l3,	%i6
	smulcc	%o5,	0x00C7,	%i0
	mulscc	%l6,	%o0,	%l2
	fmovde	%xcc,	%f20,	%f26
	array16	%g7,	%l0,	%o1
	andcc	%g5,	0x16BE,	%i4
	fnegs	%f19,	%f24
	fmuld8sux16	%f15,	%f18,	%f18
	movre	%l1,	%o2,	%g3
	array32	%i1,	%o6,	%i3
	array16	%l4,	%g2,	%o4
	nop
	set	0x7B, %o0
	ldub	[%l7 + %o0],	%g4
	umul	%g1,	%i7,	%o7
	andn	%l5,	%g6,	%o3
	orcc	%i2,	0x04F5,	%i5
	lduh	[%l7 + 0x1A],	%i6
	save %o5, %l3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l6,	%o0,	%l2
	alignaddr	%g7,	%l0,	%g5
	ldsb	[%l7 + 0x18],	%o1
	movpos	%xcc,	%i4,	%l1
	fandnot2	%f14,	%f8,	%f10
	ldsb	[%l7 + 0x7D],	%g3
	udivx	%o2,	0x0D2C,	%o6
	ldx	[%l7 + 0x60],	%i3
	fpack16	%f16,	%f12
	edge16	%l4,	%i1,	%g2
	nop
	set	0x10, %i5
	std	%f28,	[%l7 + %i5]
	lduh	[%l7 + 0x1C],	%o4
	ldsh	[%l7 + 0x0A],	%g1
	movneg	%xcc,	%g4,	%i7
	orn	%l5,	%o7,	%o3
	edge8	%g6,	%i5,	%i6
	fmovsle	%xcc,	%f22,	%f6
	lduw	[%l7 + 0x64],	%i2
	sdiv	%o5,	0x0644,	%i0
	fxor	%f26,	%f24,	%f0
	sir	0x029C
	ldsb	[%l7 + 0x15],	%l6
	fpsub32	%f0,	%f6,	%f0
	movre	%l3,	%l2,	%o0
	movpos	%icc,	%l0,	%g7
	edge16ln	%g5,	%i4,	%o1
	fpadd32s	%f30,	%f30,	%f15
	movleu	%icc,	%g3,	%l1
	edge32ln	%o2,	%o6,	%l4
	stw	%i1,	[%l7 + 0x1C]
	andncc	%i3,	%g2,	%g1
	and	%o4,	0x0A12,	%g4
	fnands	%f0,	%f2,	%f26
	ld	[%l7 + 0x14],	%f18
	andcc	%i7,	%l5,	%o7
	movg	%icc,	%g6,	%o3
	udivx	%i6,	0x0A75,	%i2
	fmovsvs	%icc,	%f10,	%f15
	edge8ln	%i5,	%i0,	%o5
	movre	%l6,	0x167,	%l2
	stx	%l3,	[%l7 + 0x48]
	movrgez	%o0,	0x036,	%g7
	fmovdn	%xcc,	%f30,	%f19
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	stb	%i4,	[%l7 + 0x38]
	movpos	%xcc,	%o1,	%g3
	xnor	%l1,	0x0D49,	%o6
	mova	%xcc,	%l4,	%o2
	umulcc	%i3,	%g2,	%i1
	orcc	%o4,	%g1,	%g4
	xnor	%i7,	%l5,	%o7
	ldub	[%l7 + 0x28],	%g6
	edge16n	%o3,	%i2,	%i5
	fmovrdgz	%i6,	%f16,	%f2
	fmuld8ulx16	%f11,	%f15,	%f8
	sir	0x1EFB
	xor	%o5,	%l6,	%l2
	fmovrslz	%l3,	%f19,	%f19
	movrne	%o0,	0x1DE,	%i0
	movneg	%xcc,	%g7,	%l0
	ldsh	[%l7 + 0x70],	%g5
	andn	%i4,	0x1093,	%o1
	edge32ln	%g3,	%o6,	%l1
	fpsub16	%f0,	%f22,	%f0
	array8	%o2,	%i3,	%l4
	movl	%xcc,	%i1,	%g2
	fcmpne16	%f2,	%f14,	%o4
	movg	%icc,	%g4,	%i7
	fpmerge	%f8,	%f2,	%f30
	andcc	%l5,	%g1,	%o7
	array16	%g6,	%o3,	%i5
	fors	%f26,	%f1,	%f19
	edge16ln	%i6,	%i2,	%l6
	orncc	%l2,	0x057B,	%o5
	smulcc	%o0,	%i0,	%l3
	movpos	%icc,	%l0,	%g5
	edge32n	%i4,	%g7,	%o1
	ldd	[%l7 + 0x20],	%f16
	lduh	[%l7 + 0x1A],	%g3
	fmul8x16al	%f7,	%f18,	%f4
	subcc	%o6,	%o2,	%l1
	fmovs	%f8,	%f26
	movvs	%xcc,	%i3,	%i1
	movrgz	%l4,	0x143,	%o4
	array32	%g4,	%i7,	%g2
	lduw	[%l7 + 0x14],	%l5
	stx	%g1,	[%l7 + 0x60]
	sth	%g6,	[%l7 + 0x3E]
	srl	%o3,	%o7,	%i5
	movrgz	%i2,	%l6,	%i6
	ldsb	[%l7 + 0x3A],	%o5
	subc	%o0,	0x126E,	%i0
	movrne	%l3,	0x356,	%l2
	sir	0x0462
	move	%xcc,	%g5,	%l0
	movge	%icc,	%i4,	%o1
	movrlz	%g7,	0x133,	%o6
	xnorcc	%o2,	%l1,	%g3
	movrgez	%i3,	0x0B2,	%l4
	ldd	[%l7 + 0x20],	%i0
	add	%g4,	%o4,	%g2
	ldd	[%l7 + 0x58],	%l4
	andncc	%i7,	%g1,	%g6
	ldub	[%l7 + 0x0F],	%o3
	fmul8sux16	%f14,	%f22,	%f14
	umul	%i5,	0x1BC3,	%i2
	sdiv	%l6,	0x0B6F,	%o7
	ldx	[%l7 + 0x70],	%i6
	ldsw	[%l7 + 0x58],	%o5
	sdivcc	%i0,	0x111F,	%o0
	fmovsvs	%icc,	%f11,	%f30
	sdivcc	%l3,	0x1E87,	%l2
	umulcc	%g5,	%l0,	%o1
	movrgz	%i4,	%o6,	%g7
	xor	%o2,	%l1,	%i3
	edge32	%g3,	%l4,	%g4
	popc	%i1,	%g2
	movrgez	%l5,	0x27E,	%o4
	fmovsgu	%icc,	%f21,	%f13
	edge32	%g1,	%g6,	%i7
	lduh	[%l7 + 0x78],	%i5
	udivcc	%o3,	0x1D0E,	%l6
	fpadd32s	%f19,	%f14,	%f3
	stb	%o7,	[%l7 + 0x5B]
	movneg	%icc,	%i2,	%i6
	edge8l	%i0,	%o0,	%o5
	fabss	%f11,	%f0
	move	%xcc,	%l3,	%g5
	fpmerge	%f19,	%f24,	%f30
	edge32n	%l0,	%l2,	%o1
	ldx	[%l7 + 0x20],	%o6
	edge32	%g7,	%o2,	%i4
	fnot1	%f26,	%f6
	edge16l	%l1,	%i3,	%g3
	ldsh	[%l7 + 0x48],	%l4
	fnors	%f24,	%f6,	%f18
	array8	%g4,	%i1,	%l5
	sth	%g2,	[%l7 + 0x6C]
	srax	%g1,	0x16,	%g6
	edge32	%i7,	%i5,	%o3
	nop
	set	0x28, %l1
	stw	%l6,	[%l7 + %l1]
	ldsh	[%l7 + 0x64],	%o7
	mulscc	%i2,	%i6,	%o4
	edge16n	%i0,	%o5,	%l3
	umulcc	%g5,	%o0,	%l0
	sllx	%o1,	0x01,	%o6
	edge16n	%g7,	%o2,	%i4
	alignaddr	%l1,	%l2,	%i3
	movle	%xcc,	%l4,	%g3
	addccc	%g4,	0x0169,	%i1
	fmovrslz	%g2,	%f9,	%f20
	andcc	%l5,	%g6,	%i7
	ldsw	[%l7 + 0x24],	%i5
	fmovdvs	%xcc,	%f18,	%f25
	fmovdneg	%xcc,	%f11,	%f8
	umul	%o3,	%g1,	%o7
	fcmps	%fcc1,	%f8,	%f14
	srlx	%l6,	0x1C,	%i6
	srl	%o4,	%i0,	%o5
	fcmple32	%f30,	%f26,	%i2
	mulx	%l3,	%g5,	%o0
	udiv	%o1,	0x0078,	%o6
	pdist	%f22,	%f6,	%f4
	movleu	%icc,	%l0,	%g7
	sra	%o2,	0x0B,	%i4
	edge8	%l1,	%l2,	%l4
	movl	%icc,	%g3,	%i3
	subcc	%i1,	0x14F2,	%g2
	edge8	%l5,	%g4,	%i7
	ldd	[%l7 + 0x58],	%g6
	fornot1	%f4,	%f14,	%f22
	sth	%o3,	[%l7 + 0x3C]
	orn	%i5,	%g1,	%o7
	fpadd32	%f0,	%f8,	%f8
	udivx	%i6,	0x165D,	%o4
	edge8n	%i0,	%l6,	%i2
	smul	%o5,	%g5,	%o0
	movrlz	%o1,	%l3,	%o6
	movvc	%icc,	%g7,	%l0
	stb	%o2,	[%l7 + 0x1D]
	movle	%icc,	%i4,	%l2
	mulscc	%l4,	0x192E,	%l1
	ldsb	[%l7 + 0x7E],	%i3
	edge8l	%g3,	%g2,	%i1
	movl	%xcc,	%l5,	%i7
	movg	%icc,	%g4,	%g6
	sll	%i5,	%g1,	%o3
	orcc	%o7,	0x1D87,	%o4
	mulx	%i6,	0x0BAA,	%i0
	fone	%f6
	mova	%icc,	%l6,	%i2
	stx	%o5,	[%l7 + 0x10]
	fpsub16s	%f18,	%f31,	%f12
	ldd	[%l7 + 0x28],	%f14
	addccc	%g5,	%o0,	%l3
	udiv	%o1,	0x007A,	%g7
	edge16n	%o6,	%l0,	%i4
	andncc	%o2,	%l2,	%l1
	mova	%icc,	%i3,	%g3
	fnor	%f12,	%f28,	%f28
	smulcc	%l4,	0x1302,	%g2
	array16	%l5,	%i1,	%i7
	fmovrdlz	%g6,	%f14,	%f4
	movrgez	%i5,	0x3AB,	%g1
	andcc	%o3,	%o7,	%o4
	fands	%f21,	%f26,	%f6
	fands	%f8,	%f12,	%f22
	fmovdpos	%xcc,	%f17,	%f0
	move	%icc,	%g4,	%i6
	fmovdpos	%icc,	%f30,	%f16
	array32	%i0,	%l6,	%o5
	movcc	%xcc,	%g5,	%o0
	restore %l3, %i2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o6,	%g7,	%l0
	addcc	%o2,	%l2,	%i4
	fmovsl	%xcc,	%f12,	%f12
	sir	0x090E
	movgu	%icc,	%l1,	%i3
	andn	%l4,	0x141A,	%g3
	fpadd16s	%f8,	%f10,	%f20
	srl	%g2,	0x18,	%l5
	sra	%i7,	%g6,	%i1
	movre	%i5,	0x029,	%g1
	add	%o7,	0x0304,	%o3
	subc	%g4,	0x13C9,	%i6
	movrgz	%i0,	%l6,	%o4
	movle	%icc,	%o5,	%o0
	ldx	[%l7 + 0x48],	%l3
	addc	%i2,	0x1109,	%g5
	ldd	[%l7 + 0x38],	%f6
	fandnot2s	%f3,	%f3,	%f11
	subccc	%o1,	0x04D5,	%g7
	ldsw	[%l7 + 0x2C],	%l0
	movleu	%xcc,	%o6,	%o2
	edge8	%l2,	%i4,	%i3
	orncc	%l1,	%l4,	%g3
	fandnot1	%f14,	%f12,	%f22
	st	%f7,	[%l7 + 0x20]
	nop
	set	0x08, %l2
	std	%f16,	[%l7 + %l2]
	movcc	%xcc,	%l5,	%i7
	move	%xcc,	%g2,	%i1
	popc	0x195D,	%i5
	stx	%g6,	[%l7 + 0x50]
	ld	[%l7 + 0x68],	%f19
	edge16ln	%g1,	%o3,	%o7
	save %g4, 0x023B, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f10,	[%l7 + 0x48]
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	sdiv	%l6,	0x1400,	%o5
	edge32	%l3,	%o0,	%i2
	fxnor	%f18,	%f16,	%f18
	fmovdcs	%icc,	%f21,	%f31
	restore %o1, 0x07A5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l0,	%g5,	%o2
	edge8ln	%o6,	%l2,	%i3
	movge	%xcc,	%i4,	%l1
	fmuld8ulx16	%f28,	%f23,	%f16
	or	%l4,	%g3,	%l5
	movrlz	%g2,	0x188,	%i1
	nop
	set	0x2C, %l3
	sth	%i5,	[%l7 + %l3]
	udivx	%g6,	0x09F4,	%g1
	fand	%f14,	%f14,	%f20
	fcmple32	%f28,	%f22,	%i7
	fsrc1	%f26,	%f24
	movleu	%xcc,	%o3,	%g4
	movvc	%xcc,	%i0,	%i6
	fpsub16	%f10,	%f20,	%f30
	fcmple32	%f30,	%f24,	%o7
	edge8n	%l6,	%o4,	%o5
	movne	%xcc,	%o0,	%i2
	fors	%f27,	%f5,	%f26
	stx	%o1,	[%l7 + 0x28]
	fmovsg	%xcc,	%f1,	%f14
	array8	%g7,	%l3,	%g5
	fcmpd	%fcc2,	%f12,	%f0
	movcs	%xcc,	%l0,	%o2
	udiv	%o6,	0x1DF9,	%i3
	fnot1s	%f22,	%f23
	fmovsge	%xcc,	%f21,	%f18
	edge8ln	%i4,	%l1,	%l4
	ldsb	[%l7 + 0x14],	%l2
	array32	%l5,	%g2,	%g3
	fxnors	%f7,	%f9,	%f22
	fmovrslz	%i5,	%f27,	%f8
	fmovdgu	%icc,	%f5,	%f2
	std	%f18,	[%l7 + 0x50]
	movrlez	%g6,	0x039,	%i1
	andncc	%i7,	%o3,	%g4
	movl	%icc,	%g1,	%i0
	ldd	[%l7 + 0x20],	%i6
	movrne	%o7,	%o4,	%l6
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	fornot2	%f20,	%f22,	%f6
	fandnot1	%f14,	%f0,	%f26
	xor	%g7,	%l3,	%g5
	alignaddrl	%l0,	%o1,	%o6
	add	%o2,	%i3,	%i4
	movge	%xcc,	%l4,	%l2
	movvc	%icc,	%l5,	%l1
	array32	%g3,	%g2,	%g6
	movvs	%icc,	%i5,	%i7
	fzero	%f26
	ldsw	[%l7 + 0x60],	%o3
	orcc	%g4,	%g1,	%i0
	nop
	set	0x26, %l5
	ldsh	[%l7 + %l5],	%i6
	st	%f6,	[%l7 + 0x5C]
	movvs	%icc,	%i1,	%o4
	movvc	%xcc,	%o7,	%o0
	fmovdpos	%icc,	%f19,	%f19
	srl	%o5,	%l6,	%i2
	lduh	[%l7 + 0x12],	%l3
	fand	%f22,	%f30,	%f2
	edge8l	%g5,	%g7,	%l0
	movn	%icc,	%o6,	%o1
	movrgz	%i3,	%o2,	%l4
	or	%i4,	0x01E5,	%l5
	movneg	%xcc,	%l2,	%g3
	fcmpeq32	%f6,	%f0,	%g2
	ldsw	[%l7 + 0x54],	%g6
	orn	%i5,	0x0A90,	%l1
	fors	%f2,	%f26,	%f28
	movcc	%xcc,	%i7,	%o3
	fmovdcs	%xcc,	%f9,	%f20
	xnor	%g1,	%g4,	%i6
	fpsub16	%f14,	%f24,	%f6
	fpadd32	%f12,	%f24,	%f24
	array32	%i0,	%o4,	%i1
	fcmpgt16	%f20,	%f0,	%o7
	smulcc	%o5,	0x1E57,	%l6
	save %o0, 0x0492, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g5,	%i2
	umulcc	%g7,	0x0DF3,	%l0
	edge16l	%o1,	%o6,	%o2
	fmovdn	%icc,	%f0,	%f14
	fornot2s	%f18,	%f16,	%f20
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%l4
	udiv	%i4,	0x10A1,	%i3
	movne	%xcc,	%l2,	%l5
	fmovdge	%xcc,	%f12,	%f26
	addcc	%g3,	%g2,	%g6
	mulscc	%l1,	0x08C3,	%i5
	andcc	%i7,	0x05A4,	%g1
	nop
	set	0x22, %g1
	sth	%o3,	[%l7 + %g1]
	sdiv	%i6,	0x0013,	%g4
	srax	%o4,	0x1E,	%i0
	movpos	%xcc,	%o7,	%o5
	fmovdgu	%xcc,	%f2,	%f31
	srax	%i1,	0x01,	%o0
	sllx	%l3,	%l6,	%g5
	edge8ln	%i2,	%g7,	%l0
	fornot2s	%f1,	%f23,	%f27
	fmul8ulx16	%f6,	%f0,	%f30
	xnor	%o1,	%o6,	%l4
	sdivcc	%i4,	0x10F8,	%i3
	udivx	%o2,	0x1357,	%l2
	mova	%xcc,	%g3,	%l5
	fzeros	%f18
	alignaddr	%g6,	%l1,	%i5
	sdiv	%g2,	0x0CA1,	%g1
	stx	%i7,	[%l7 + 0x70]
	fmovsge	%icc,	%f24,	%f21
	edge32	%i6,	%o3,	%g4
	mulx	%o4,	%o7,	%i0
	subccc	%i1,	%o5,	%l3
	ldsb	[%l7 + 0x5B],	%o0
	save %l6, %i2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f22,	%f28,	%f12
	xnorcc	%l0,	%o1,	%g5
	sdivcc	%l4,	0x1CF5,	%i4
	alignaddr	%i3,	%o2,	%l2
	lduw	[%l7 + 0x7C],	%o6
	edge16	%l5,	%g6,	%g3
	movre	%i5,	%g2,	%l1
	stw	%g1,	[%l7 + 0x58]
	movvc	%icc,	%i7,	%o3
	srlx	%g4,	%i6,	%o4
	stb	%o7,	[%l7 + 0x59]
	fmovdn	%xcc,	%f17,	%f1
	andcc	%i0,	%o5,	%i1
	movleu	%icc,	%l3,	%l6
	save %o0, 0x064F, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l0,	%g7,	%g5
	sllx	%l4,	%o1,	%i4
	lduw	[%l7 + 0x78],	%i3
	fmovdcs	%icc,	%f8,	%f1
	andcc	%l2,	0x161B,	%o6
	andncc	%o2,	%l5,	%g6
	movne	%icc,	%g3,	%g2
	udivcc	%i5,	0x069A,	%l1
	sethi	0x08D5,	%g1
	or	%o3,	0x0D11,	%i7
	movle	%xcc,	%g4,	%o4
	fmovscs	%icc,	%f21,	%f0
	movpos	%icc,	%o7,	%i6
	fmovdle	%icc,	%f8,	%f29
	movvs	%xcc,	%i0,	%i1
	edge8n	%o5,	%l6,	%o0
	fcmpd	%fcc0,	%f12,	%f10
	movl	%xcc,	%l3,	%l0
	std	%f14,	[%l7 + 0x10]
	fmovs	%f22,	%f23
	udivx	%g7,	0x0701,	%g5
	nop
	set	0x38, %o4
	std	%f10,	[%l7 + %o4]
	sth	%i2,	[%l7 + 0x26]
	fxors	%f31,	%f29,	%f2
	ldsh	[%l7 + 0x40],	%o1
	and	%i4,	%i3,	%l4
	sdivx	%o6,	0x080D,	%o2
	fandnot2	%f4,	%f20,	%f10
	array8	%l2,	%l5,	%g6
	restore %g2, %g3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g1,	0x1F,	%o3
	mulscc	%i7,	0x0152,	%g4
	ld	[%l7 + 0x50],	%f22
	edge32n	%i5,	%o7,	%o4
	nop
	set	0x08, %o2
	stx	%i6,	[%l7 + %o2]
	andcc	%i0,	0x0AB0,	%i1
	fmovscc	%xcc,	%f23,	%f1
	mulscc	%l6,	0x0894,	%o0
	fmovrse	%o5,	%f26,	%f30
	movvc	%icc,	%l0,	%l3
	fexpand	%f10,	%f24
	movge	%xcc,	%g7,	%i2
	sdiv	%o1,	0x18CE,	%i4
	ld	[%l7 + 0x1C],	%f11
	bshuffle	%f0,	%f6,	%f16
	movn	%xcc,	%g5,	%i3
	ldsw	[%l7 + 0x30],	%l4
	fmovsgu	%xcc,	%f14,	%f2
	fmovdvc	%icc,	%f17,	%f30
	movrlz	%o2,	%l2,	%l5
	st	%f0,	[%l7 + 0x38]
	fcmped	%fcc0,	%f26,	%f28
	xorcc	%o6,	%g2,	%g6
	movle	%icc,	%l1,	%g3
	fnot2	%f26,	%f20
	fmovdl	%icc,	%f25,	%f2
	edge8ln	%g1,	%o3,	%g4
	orcc	%i7,	%o7,	%i5
	subccc	%o4,	0x1B76,	%i6
	ldd	[%l7 + 0x38],	%f24
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	sllx	%o0,	%i1,	%o5
	stw	%l0,	[%l7 + 0x48]
	udivcc	%l3,	0x18D5,	%g7
	udivcc	%i2,	0x00F7,	%o1
	movrlez	%i4,	%g5,	%l4
	pdist	%f24,	%f0,	%f4
	edge32ln	%o2,	%i3,	%l5
	stw	%l2,	[%l7 + 0x54]
	udivx	%g2,	0x03E2,	%o6
	fpack16	%f12,	%f6
	movgu	%xcc,	%g6,	%l1
	ldsb	[%l7 + 0x23],	%g3
	fmovda	%icc,	%f20,	%f19
	movcs	%icc,	%g1,	%o3
	movcs	%xcc,	%i7,	%o7
	addcc	%g4,	%i5,	%o4
	movvc	%icc,	%i0,	%i6
	sub	%l6,	%i1,	%o5
	edge8	%l0,	%o0,	%l3
	stw	%i2,	[%l7 + 0x0C]
	orncc	%o1,	%g7,	%g5
	fmul8x16	%f19,	%f22,	%f2
	edge8l	%l4,	%o2,	%i4
	movge	%xcc,	%i3,	%l5
	sub	%g2,	%o6,	%g6
	andcc	%l1,	%l2,	%g3
	mulscc	%o3,	0x1A59,	%g1
	sdiv	%i7,	0x04BD,	%g4
	srl	%i5,	0x11,	%o7
	ldx	[%l7 + 0x08],	%i0
	orcc	%i6,	0x0286,	%o4
	andcc	%l6,	0x1ACE,	%i1
	sll	%l0,	0x02,	%o5
	xnorcc	%o0,	0x1B6F,	%l3
	fmovs	%f18,	%f23
	subcc	%i2,	%g7,	%o1
	edge32ln	%l4,	%o2,	%i4
	andn	%i3,	0x01E8,	%l5
	array32	%g2,	%g5,	%o6
	xorcc	%g6,	0x0C6B,	%l2
	fxnor	%f22,	%f14,	%f20
	lduh	[%l7 + 0x48],	%g3
	udiv	%o3,	0x1740,	%l1
	nop
	set	0x74, %g3
	ldub	[%l7 + %g3],	%g1
	movrlez	%g4,	%i5,	%o7
	xnorcc	%i7,	%i0,	%o4
	andncc	%l6,	%i6,	%i1
	edge8ln	%l0,	%o5,	%l3
	fmul8x16al	%f28,	%f25,	%f4
	popc	0x1181,	%i2
	orn	%g7,	%o1,	%l4
	fnor	%f8,	%f8,	%f28
	fzero	%f30
	fpsub32s	%f1,	%f16,	%f14
	array32	%o0,	%o2,	%i4
	xorcc	%i3,	%l5,	%g5
	lduw	[%l7 + 0x24],	%g2
	nop
	set	0x18, %l0
	ldd	[%l7 + %l0],	%f26
	smul	%g6,	%o6,	%g3
	mova	%icc,	%l2,	%o3
	movrgz	%g1,	0x07C,	%l1
	movrgz	%i5,	%g4,	%i7
	sth	%o7,	[%l7 + 0x26]
	st	%f12,	[%l7 + 0x78]
	addcc	%i0,	0x13EF,	%o4
	ldd	[%l7 + 0x40],	%i6
	fzeros	%f24
	fmovdvc	%icc,	%f21,	%f29
	fandnot2s	%f24,	%f16,	%f8
	fnot1s	%f12,	%f30
	sdivx	%i1,	0x175A,	%l6
	movgu	%xcc,	%o5,	%l0
	fmovsvs	%icc,	%f16,	%f16
	movvs	%xcc,	%i2,	%g7
	movrgz	%o1,	%l4,	%l3
	movcs	%xcc,	%o2,	%o0
	ld	[%l7 + 0x40],	%f7
	movne	%icc,	%i4,	%i3
	fmovrdlez	%g5,	%f28,	%f16
	movle	%icc,	%g2,	%l5
	array16	%o6,	%g6,	%g3
	udiv	%o3,	0x0222,	%g1
	movg	%icc,	%l2,	%i5
	sth	%l1,	[%l7 + 0x66]
	srax	%g4,	%i7,	%i0
	fandnot1	%f14,	%f18,	%f14
	restore %o4, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l6,	%o5,	%i1
	ldsb	[%l7 + 0x0B],	%i2
	fmovdleu	%icc,	%f5,	%f8
	edge16ln	%l0,	%o1,	%g7
	fornot1	%f0,	%f2,	%f14
	or	%l3,	%o2,	%o0
	ldx	[%l7 + 0x78],	%i4
	sethi	0x0D44,	%l4
	or	%i3,	0x1A38,	%g2
	ldsw	[%l7 + 0x48],	%g5
	edge16ln	%o6,	%l5,	%g3
	movl	%icc,	%o3,	%g1
	sdivcc	%g6,	0x18AE,	%l2
	save %i5, 0x18A1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%g4,	%i0,	%o4
	ldd	[%l7 + 0x70],	%i6
	and	%i6,	0x15F8,	%l6
	mulx	%o5,	%i1,	%i2
	movg	%icc,	%l0,	%o1
	movrgez	%o7,	0x224,	%l3
	sra	%g7,	0x10,	%o0
	movrgz	%o2,	0x0C5,	%i4
	sll	%l4,	%i3,	%g2
	fpadd16	%f0,	%f18,	%f6
	movneg	%icc,	%o6,	%l5
	fmovdn	%icc,	%f12,	%f7
	andn	%g5,	%g3,	%g1
	fpsub16	%f12,	%f16,	%f0
	edge16l	%g6,	%o3,	%l2
	edge32	%l1,	%i5,	%i0
	fabss	%f28,	%f31
	movn	%icc,	%o4,	%g4
	fcmpeq16	%f28,	%f28,	%i6
	mova	%icc,	%i7,	%l6
	fcmps	%fcc1,	%f20,	%f7
	movg	%icc,	%i1,	%i2
	udiv	%o5,	0x11F6,	%l0
	movg	%xcc,	%o7,	%o1
	std	%f14,	[%l7 + 0x78]
	movvs	%xcc,	%l3,	%o0
	addccc	%o2,	0x18B5,	%i4
	fpadd16	%f2,	%f4,	%f22
	ldd	[%l7 + 0x38],	%f4
	smul	%g7,	0x1E1C,	%l4
	movleu	%xcc,	%i3,	%o6
	movl	%icc,	%g2,	%l5
	sllx	%g5,	0x1A,	%g3
	udiv	%g1,	0x0E64,	%o3
	udivcc	%g6,	0x1ED0,	%l2
	addccc	%l1,	%i5,	%i0
	fsrc2s	%f15,	%f3
	edge8	%o4,	%i6,	%g4
	andn	%i7,	%i1,	%i2
	sth	%o5,	[%l7 + 0x4A]
	array32	%l0,	%l6,	%o1
	sethi	0x018D,	%l3
	st	%f8,	[%l7 + 0x0C]
	fsrc1	%f24,	%f16
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	smulcc	%i4,	%o2,	%g7
	sethi	0x0854,	%l4
	edge16l	%o6,	%g2,	%l5
	movne	%xcc,	%g5,	%g3
	movleu	%icc,	%g1,	%i3
	movrgez	%o3,	%l2,	%l1
	movle	%icc,	%i5,	%i0
	fcmple16	%f26,	%f0,	%o4
	udivx	%g6,	0x0D92,	%g4
	stx	%i7,	[%l7 + 0x20]
	fmul8x16au	%f23,	%f20,	%f8
	fpadd16	%f0,	%f0,	%f30
	fpadd32s	%f29,	%f21,	%f0
	add	%i6,	%i1,	%o5
	movleu	%xcc,	%l0,	%i2
	movpos	%xcc,	%o1,	%l3
	movvs	%xcc,	%o0,	%l6
	ldsb	[%l7 + 0x31],	%o7
	movne	%xcc,	%i4,	%o2
	srl	%g7,	0x0E,	%l4
	alignaddrl	%g2,	%l5,	%g5
	array8	%o6,	%g3,	%i3
	mulscc	%g1,	%l2,	%l1
	fmovrdgz	%i5,	%f12,	%f24
	edge8l	%o3,	%o4,	%i0
	lduh	[%l7 + 0x2A],	%g4
	udiv	%g6,	0x1FFE,	%i6
	fmovsvs	%xcc,	%f13,	%f6
	addcc	%i1,	%i7,	%l0
	udiv	%i2,	0x129C,	%o5
	alignaddrl	%l3,	%o0,	%l6
	edge32n	%o1,	%o7,	%i4
	sub	%o2,	0x05F2,	%l4
	orncc	%g2,	0x1CD8,	%l5
	sll	%g7,	%g5,	%g3
	movre	%i3,	0x375,	%o6
	sth	%g1,	[%l7 + 0x48]
	movrgz	%l2,	0x291,	%l1
	movvs	%icc,	%i5,	%o4
	ld	[%l7 + 0x1C],	%f14
	umulcc	%o3,	%i0,	%g6
	movgu	%icc,	%g4,	%i1
	save %i6, %l0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%xcc,	%f30,	%f11
	lduh	[%l7 + 0x30],	%o5
	srl	%l3,	0x04,	%o0
	orncc	%i2,	%l6,	%o1
	orncc	%o7,	%i4,	%l4
	edge32	%o2,	%g2,	%g7
	fmul8x16au	%f16,	%f8,	%f22
	edge16	%l5,	%g3,	%g5
	sdivcc	%i3,	0x092E,	%o6
	umulcc	%l2,	%l1,	%g1
	fmul8ulx16	%f8,	%f28,	%f10
	srax	%i5,	0x0E,	%o4
	movcs	%xcc,	%o3,	%g6
	lduw	[%l7 + 0x34],	%i0
	stb	%g4,	[%l7 + 0x16]
	addccc	%i6,	0x0504,	%l0
	fpsub16s	%f29,	%f23,	%f11
	xor	%i7,	%i1,	%l3
	ldx	[%l7 + 0x58],	%o5
	umul	%i2,	%o0,	%o1
	sdivcc	%l6,	0x1E65,	%o7
	movcc	%icc,	%i4,	%l4
	alignaddr	%g2,	%g7,	%o2
	srl	%l5,	0x1D,	%g3
	lduh	[%l7 + 0x0C],	%i3
	fxnor	%f18,	%f8,	%f2
	sdiv	%g5,	0x0AB3,	%l2
	srax	%l1,	0x11,	%g1
	umulcc	%o6,	0x0DE6,	%i5
	orn	%o4,	%o3,	%g6
	addcc	%i0,	0x1099,	%g4
	movne	%icc,	%l0,	%i7
	edge8ln	%i6,	%l3,	%i1
	andn	%o5,	0x1693,	%i2
	fmovspos	%icc,	%f2,	%f29
	fmul8ulx16	%f20,	%f0,	%f4
	ld	[%l7 + 0x2C],	%f26
	mulscc	%o0,	%l6,	%o7
	movrlz	%o1,	0x3ED,	%i4
	fmul8ulx16	%f30,	%f4,	%f16
	array16	%l4,	%g7,	%o2
	movcc	%xcc,	%g2,	%l5
	udivcc	%i3,	0x13C2,	%g3
	movpos	%xcc,	%g5,	%l2
	fandnot2	%f20,	%f28,	%f0
	edge8n	%g1,	%l1,	%i5
	addccc	%o6,	%o4,	%o3
	addcc	%g6,	0x0F94,	%g4
	edge8n	%i0,	%l0,	%i6
	fmovdgu	%icc,	%f19,	%f30
	fnor	%f18,	%f24,	%f20
	fcmpeq16	%f28,	%f16,	%l3
	nop
	set	0x68, %g7
	std	%f6,	[%l7 + %g7]
	edge8n	%i1,	%o5,	%i2
	edge32l	%o0,	%i7,	%l6
	xnorcc	%o1,	0x10AB,	%o7
	alignaddr	%l4,	%g7,	%o2
	subcc	%i4,	0x14E5,	%l5
	mova	%icc,	%i3,	%g2
	alignaddrl	%g3,	%g5,	%l2
	nop
	set	0x58, %g5
	ldx	[%l7 + %g5],	%g1
	fcmpeq32	%f20,	%f10,	%l1
	edge32n	%i5,	%o4,	%o6
	udiv	%g6,	0x0140,	%g4
	subccc	%o3,	0x1737,	%l0
	ld	[%l7 + 0x2C],	%f12
	ld	[%l7 + 0x4C],	%f29
	movvs	%icc,	%i6,	%l3
	ldd	[%l7 + 0x38],	%i0
	restore %i1, 0x1D46, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i2,	0x11A4,	%o0
	andn	%i7,	%o1,	%l6
	fcmpne32	%f12,	%f16,	%o7
	movrlz	%l4,	0x2B2,	%o2
	mulx	%g7,	%l5,	%i4
	bshuffle	%f2,	%f8,	%f14
	fmovdpos	%icc,	%f24,	%f30
	sdiv	%i3,	0x0E37,	%g3
	movneg	%xcc,	%g5,	%l2
	ldsw	[%l7 + 0x14],	%g2
	ldx	[%l7 + 0x48],	%g1
	edge16ln	%i5,	%l1,	%o6
	array32	%o4,	%g6,	%g4
	edge32n	%o3,	%l0,	%i6
	stx	%i0,	[%l7 + 0x10]
	movge	%icc,	%i1,	%o5
	movcs	%icc,	%i2,	%o0
	umul	%l3,	0x0A14,	%i7
	srlx	%l6,	%o7,	%o1
	alignaddr	%o2,	%g7,	%l4
	orn	%i4,	0x1E1D,	%l5
	fmovdne	%xcc,	%f17,	%f0
	edge16	%g3,	%g5,	%l2
	edge16l	%g2,	%g1,	%i3
	movvc	%icc,	%l1,	%i5
	add	%o4,	0x0213,	%g6
	popc	%g4,	%o6
	sllx	%l0,	0x09,	%i6
	ldsh	[%l7 + 0x4E],	%o3
	ldsb	[%l7 + 0x3E],	%i1
	movrlez	%o5,	0x160,	%i2
	xorcc	%o0,	%l3,	%i7
	fpack16	%f16,	%f2
	orncc	%i0,	0x11B3,	%l6
	edge8n	%o1,	%o2,	%g7
	fmovdl	%xcc,	%f30,	%f11
	srlx	%o7,	0x07,	%l4
	sth	%l5,	[%l7 + 0x52]
	andn	%i4,	%g5,	%l2
	fmovdle	%xcc,	%f5,	%f2
	udivcc	%g3,	0x0035,	%g2
	subc	%i3,	%g1,	%i5
	fandnot1	%f4,	%f22,	%f26
	sethi	0x0CDD,	%l1
	udivcc	%g6,	0x0933,	%g4
	movrne	%o6,	%o4,	%i6
	fmovsne	%xcc,	%f2,	%f30
	xnorcc	%l0,	0x0707,	%i1
	orcc	%o3,	0x105F,	%o5
	fmovdle	%xcc,	%f1,	%f7
	add	%i2,	0x1A39,	%o0
	fnot2	%f22,	%f8
	ldsh	[%l7 + 0x16],	%l3
	fornot1	%f16,	%f4,	%f6
	srax	%i0,	%i7,	%l6
	edge8ln	%o2,	%g7,	%o7
	alignaddrl	%l4,	%l5,	%o1
	array8	%i4,	%g5,	%g3
	sdivcc	%l2,	0x067B,	%i3
	edge8l	%g1,	%i5,	%g2
	movleu	%icc,	%g6,	%l1
	sth	%g4,	[%l7 + 0x3E]
	movvs	%xcc,	%o4,	%i6
	edge8n	%o6,	%i1,	%o3
	addcc	%o5,	%i2,	%o0
	edge8l	%l3,	%l0,	%i0
	lduh	[%l7 + 0x0C],	%l6
	edge16n	%o2,	%g7,	%o7
	sir	0x018E
	fors	%f16,	%f21,	%f12
	sllx	%i7,	%l5,	%o1
	fpsub32s	%f25,	%f25,	%f28
	fmovrdne	%l4,	%f22,	%f8
	movleu	%xcc,	%g5,	%i4
	addcc	%l2,	%i3,	%g1
	stx	%g3,	[%l7 + 0x68]
	or	%i5,	0x0E47,	%g6
	xnor	%l1,	%g2,	%g4
	movrgz	%o4,	%o6,	%i6
	andcc	%i1,	%o3,	%i2
	udivcc	%o0,	0x118C,	%o5
	fmovdg	%icc,	%f6,	%f29
	xor	%l0,	%l3,	%l6
	movle	%icc,	%o2,	%i0
	srlx	%g7,	0x05,	%i7
	edge8	%l5,	%o7,	%o1
	fone	%f12
	fmul8sux16	%f16,	%f20,	%f10
	movleu	%xcc,	%l4,	%i4
	fnot1	%f28,	%f14
	edge16n	%g5,	%i3,	%g1
	srlx	%l2,	0x1C,	%i5
	fmovrslz	%g3,	%f1,	%f22
	udiv	%l1,	0x1ED6,	%g6
	movcs	%icc,	%g2,	%o4
	fmovdneg	%icc,	%f26,	%f1
	fmuld8sux16	%f8,	%f17,	%f16
	fnot1s	%f2,	%f18
	xor	%g4,	0x12F2,	%i6
	movvc	%icc,	%i1,	%o3
	fxor	%f30,	%f0,	%f14
	fands	%f6,	%f7,	%f3
	fpsub32s	%f23,	%f29,	%f25
	subc	%o6,	%o0,	%o5
	pdist	%f0,	%f14,	%f6
	xnorcc	%l0,	0x157A,	%l3
	alignaddr	%i2,	%o2,	%i0
	edge32	%g7,	%l6,	%i7
	edge16ln	%o7,	%l5,	%l4
	sdiv	%i4,	0x02D7,	%g5
	movrne	%i3,	%o1,	%l2
	sub	%i5,	0x0C70,	%g1
	xnor	%l1,	0x113A,	%g3
	sub	%g6,	%o4,	%g4
	fmovdl	%xcc,	%f18,	%f7
	array16	%i6,	%i1,	%g2
	fpack16	%f28,	%f14
	lduw	[%l7 + 0x6C],	%o6
	fmovsleu	%icc,	%f23,	%f17
	move	%icc,	%o0,	%o3
	movneg	%xcc,	%o5,	%l3
	andn	%i2,	%l0,	%o2
	movrgez	%g7,	%l6,	%i7
	alignaddr	%o7,	%l5,	%i0
	fpsub16s	%f5,	%f3,	%f7
	edge16	%l4,	%g5,	%i3
	andcc	%i4,	0x1548,	%o1
	fandnot1s	%f6,	%f29,	%f11
	fmovsl	%icc,	%f27,	%f12
	orn	%i5,	0x005F,	%g1
	srax	%l1,	0x09,	%l2
	ld	[%l7 + 0x70],	%f16
	fmovspos	%icc,	%f31,	%f6
	sdiv	%g6,	0x06C3,	%g3
	fpack32	%f14,	%f14,	%f4
	movre	%o4,	%g4,	%i1
	fmul8x16al	%f31,	%f19,	%f20
	array16	%g2,	%i6,	%o0
	srax	%o6,	0x01,	%o5
	movrne	%o3,	%i2,	%l3
	ldub	[%l7 + 0x46],	%o2
	fmul8sux16	%f26,	%f2,	%f0
	edge32l	%l0,	%g7,	%i7
	edge16l	%o7,	%l5,	%l6
	sir	0x1F65
	ldsw	[%l7 + 0x08],	%i0
	ldsb	[%l7 + 0x48],	%l4
	fcmpes	%fcc3,	%f12,	%f14
	stx	%i3,	[%l7 + 0x70]
	mulx	%i4,	%g5,	%o1
	fmuld8sux16	%f27,	%f7,	%f24
	orncc	%g1,	0x0021,	%i5
	mova	%xcc,	%l1,	%g6
	fcmpeq32	%f6,	%f10,	%l2
	fcmpes	%fcc1,	%f20,	%f6
	srl	%g3,	0x13,	%g4
	fones	%f31
	popc	%o4,	%g2
	fmul8x16au	%f2,	%f11,	%f0
	movpos	%icc,	%i6,	%o0
	umul	%i1,	%o5,	%o3
	xnor	%i2,	%l3,	%o6
	mulscc	%l0,	0x1E8B,	%g7
	movrlz	%o2,	0x3BA,	%o7
	edge32n	%l5,	%i7,	%l6
	save %l4, %i0, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x6B],	%i4
	movvs	%xcc,	%o1,	%g1
	edge16n	%g5,	%i5,	%l1
	movg	%xcc,	%g6,	%l2
	fmovdl	%icc,	%f27,	%f13
	movrlz	%g4,	0x146,	%o4
	smulcc	%g2,	%i6,	%g3
	fmovscs	%xcc,	%f25,	%f31
	fmul8sux16	%f12,	%f18,	%f16
	edge32n	%i1,	%o5,	%o0
	alignaddr	%o3,	%l3,	%i2
	movrlez	%l0,	%g7,	%o6
	edge8ln	%o2,	%o7,	%l5
	movg	%xcc,	%l6,	%i7
	movne	%icc,	%i0,	%i3
	fmovsvc	%icc,	%f21,	%f23
	fmovdvs	%xcc,	%f9,	%f16
	ldd	[%l7 + 0x70],	%f12
	movne	%icc,	%l4,	%i4
	sdivcc	%g1,	0x034B,	%g5
	movleu	%xcc,	%o1,	%l1
	orcc	%i5,	0x04DD,	%l2
	edge32ln	%g4,	%g6,	%o4
	subc	%g2,	%i6,	%i1
	siam	0x3
	ldsb	[%l7 + 0x7E],	%o5
	fandnot1s	%f22,	%f25,	%f19
	mulscc	%o0,	%g3,	%l3
	sllx	%o3,	0x17,	%i2
	fmovdcs	%icc,	%f17,	%f13
	or	%l0,	0x12A4,	%g7
	array8	%o2,	%o6,	%l5
	fabss	%f29,	%f2
	mova	%xcc,	%l6,	%i7
	fpadd16	%f24,	%f18,	%f2
	movn	%icc,	%o7,	%i0
	fmovde	%xcc,	%f4,	%f17
	xnor	%i3,	%l4,	%i4
	fmovdvc	%icc,	%f0,	%f10
	orncc	%g5,	0x1ACB,	%g1
	fmovrdlz	%l1,	%f24,	%f4
	edge8l	%o1,	%l2,	%i5
	movleu	%xcc,	%g6,	%g4
	edge8	%o4,	%i6,	%g2
	edge32n	%i1,	%o5,	%o0
	ld	[%l7 + 0x1C],	%f14
	array8	%g3,	%l3,	%i2
	edge16	%o3,	%g7,	%o2
	sir	0x1FA6
	fmovrdgez	%l0,	%f22,	%f30
	ld	[%l7 + 0x54],	%f16
	movvs	%icc,	%l5,	%l6
	alignaddr	%i7,	%o6,	%i0
	sdivcc	%i3,	0x10A2,	%l4
	movneg	%xcc,	%i4,	%o7
	udivcc	%g5,	0x0AE9,	%l1
	orn	%g1,	0x001D,	%o1
	udivx	%l2,	0x0DDB,	%i5
	fmul8x16al	%f5,	%f17,	%f10
	fmovsne	%xcc,	%f9,	%f17
	movcs	%icc,	%g4,	%g6
	movcc	%xcc,	%o4,	%g2
	lduw	[%l7 + 0x60],	%i6
	nop
	set	0x10, %g2
	ldd	[%l7 + %g2],	%f28
	fmovsvs	%icc,	%f11,	%f29
	srl	%o5,	%o0,	%i1
	edge8l	%g3,	%l3,	%i2
	movcs	%icc,	%g7,	%o3
	movle	%xcc,	%o2,	%l5
	andcc	%l0,	0x19B4,	%i7
	lduw	[%l7 + 0x20],	%o6
	movleu	%icc,	%i0,	%i3
	movg	%icc,	%l4,	%l6
	ldub	[%l7 + 0x5B],	%o7
	stx	%i4,	[%l7 + 0x08]
	movne	%icc,	%l1,	%g5
	sllx	%g1,	%o1,	%l2
	smulcc	%g4,	%i5,	%o4
	stx	%g6,	[%l7 + 0x68]
	ldx	[%l7 + 0x48],	%g2
	movl	%xcc,	%o5,	%i6
	movge	%icc,	%o0,	%i1
	alignaddrl	%l3,	%i2,	%g7
	st	%f3,	[%l7 + 0x2C]
	addccc	%g3,	0x1671,	%o2
	add	%l5,	0x1970,	%l0
	edge32l	%o3,	%i7,	%o6
	sdivcc	%i0,	0x0F65,	%i3
	nop
	set	0x0E, %i0
	lduh	[%l7 + %i0],	%l6
	andn	%l4,	%o7,	%i4
	movrlz	%l1,	%g1,	%o1
	edge8ln	%l2,	%g5,	%i5
	array8	%o4,	%g6,	%g4
	std	%f14,	[%l7 + 0x60]
	edge16n	%o5,	%g2,	%o0
	edge8l	%i1,	%l3,	%i2
	fmovdgu	%icc,	%f12,	%f12
	andn	%i6,	%g7,	%g3
	movre	%l5,	0x330,	%l0
	movge	%xcc,	%o2,	%o3
	sub	%i7,	%o6,	%i0
	sllx	%i3,	0x04,	%l6
	movcs	%xcc,	%o7,	%l4
	fmovsleu	%xcc,	%f0,	%f7
	edge32	%i4,	%g1,	%l1
	udivx	%o1,	0x127C,	%g5
	ldx	[%l7 + 0x78],	%l2
	edge16n	%o4,	%i5,	%g4
	movrlez	%g6,	0x3DD,	%o5
	ldx	[%l7 + 0x28],	%g2
	ldsw	[%l7 + 0x74],	%i1
	subc	%o0,	%i2,	%i6
	srl	%g7,	%l3,	%l5
	orncc	%g3,	%o2,	%o3
	lduh	[%l7 + 0x24],	%i7
	ldsh	[%l7 + 0x62],	%l0
	mulx	%o6,	%i3,	%l6
	movrgez	%o7,	%l4,	%i0
	fmovrsne	%g1,	%f29,	%f27
	fors	%f9,	%f21,	%f8
	ldsb	[%l7 + 0x12],	%l1
	umul	%o1,	0x0043,	%g5
	std	%f28,	[%l7 + 0x40]
	edge16l	%i4,	%l2,	%o4
	umulcc	%g4,	0x1979,	%i5
	fsrc2s	%f24,	%f31
	smul	%g6,	%g2,	%o5
	fpack32	%f18,	%f22,	%f4
	sllx	%o0,	0x1C,	%i2
	sdivx	%i1,	0x0F20,	%g7
	edge8n	%l3,	%l5,	%g3
	fandnot1s	%f31,	%f13,	%f3
	movge	%icc,	%o2,	%i6
	sdivx	%i7,	0x1014,	%l0
	edge32ln	%o6,	%i3,	%o3
	ldd	[%l7 + 0x30],	%o6
	and	%l4,	0x1D23,	%i0
	ldub	[%l7 + 0x09],	%l6
	sdivcc	%l1,	0x1283,	%o1
	sub	%g5,	%g1,	%l2
	fcmpne16	%f10,	%f26,	%i4
	std	%f30,	[%l7 + 0x38]
	stb	%o4,	[%l7 + 0x3C]
	orncc	%i5,	%g6,	%g4
	xnor	%g2,	%o0,	%o5
	popc	0x1972,	%i2
	orcc	%g7,	0x1445,	%l3
	pdist	%f4,	%f2,	%f30
	move	%xcc,	%l5,	%i1
	edge8n	%o2,	%g3,	%i6
	fornot1	%f2,	%f18,	%f16
	udivcc	%l0,	0x1D72,	%i7
	ldsw	[%l7 + 0x44],	%o6
	movleu	%icc,	%o3,	%o7
	edge16n	%l4,	%i3,	%l6
	subc	%i0,	%o1,	%g5
	fmovrdgz	%g1,	%f10,	%f22
	ldd	[%l7 + 0x30],	%f28
	array16	%l2,	%l1,	%i4
	edge8n	%o4,	%i5,	%g4
	save %g6, %g2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f15
	edge16n	%i2,	%g7,	%o5
	addc	%l3,	%l5,	%o2
	movl	%icc,	%g3,	%i1
	fmovdcc	%xcc,	%f3,	%f27
	movrgez	%i6,	0x3DF,	%i7
	movcc	%icc,	%l0,	%o3
	srl	%o7,	0x17,	%l4
	sra	%i3,	0x00,	%o6
	srlx	%i0,	%o1,	%l6
	movrlz	%g1,	0x333,	%g5
	nop
	set	0x38, %o3
	sth	%l2,	[%l7 + %o3]
	movvs	%xcc,	%i4,	%o4
	fcmpeq32	%f20,	%f10,	%i5
	movrgez	%l1,	%g6,	%g2
	movcs	%xcc,	%o0,	%g4
	fmovsn	%icc,	%f12,	%f19
	subcc	%i2,	%o5,	%g7
	edge32n	%l3,	%l5,	%o2
	ldd	[%l7 + 0x60],	%i0
	edge8n	%i6,	%i7,	%g3
	movrgez	%l0,	%o7,	%o3
	fmovdpos	%icc,	%f17,	%f25
	fabsd	%f8,	%f16
	smul	%l4,	0x0E01,	%i3
	lduh	[%l7 + 0x28],	%o6
	addccc	%i0,	%l6,	%g1
	lduh	[%l7 + 0x5A],	%g5
	sra	%l2,	0x1B,	%o1
	fandnot2s	%f29,	%f26,	%f26
	addc	%o4,	%i4,	%l1
	ldub	[%l7 + 0x44],	%i5
	smulcc	%g2,	0x0855,	%o0
	edge8n	%g6,	%g4,	%o5
	movg	%xcc,	%i2,	%l3
	ldsw	[%l7 + 0x20],	%l5
	movrlez	%o2,	%i1,	%g7
	sdiv	%i7,	0x14E0,	%g3
	xorcc	%i6,	0x085A,	%l0
	movle	%icc,	%o7,	%o3
	addcc	%i3,	0x0A5F,	%o6
	movg	%icc,	%l4,	%i0
	fmovdneg	%xcc,	%f17,	%f29
	srax	%l6,	0x18,	%g5
	movvc	%icc,	%g1,	%l2
	xorcc	%o4,	%o1,	%i4
	movrlez	%l1,	%g2,	%o0
	fmul8x16	%f17,	%f0,	%f28
	alignaddr	%g6,	%g4,	%i5
	ldx	[%l7 + 0x28],	%o5
	fcmpd	%fcc3,	%f20,	%f22
	sub	%l3,	%l5,	%o2
	edge8l	%i2,	%i1,	%g7
	fmovsg	%icc,	%f18,	%f9
	fnot2	%f0,	%f14
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	movge	%xcc,	%l0,	%g3
	movne	%icc,	%o7,	%o3
	subc	%i3,	%o6,	%i0
	movgu	%icc,	%l6,	%l4
	sdiv	%g1,	0x0250,	%g5
	orcc	%l2,	0x049D,	%o1
	subcc	%o4,	%l1,	%i4
	restore %o0, %g6, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i5,	%o5,	%g4
	save %l5, 0x01F8, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%l3,	0x0DD7,	%i1
	xorcc	%i2,	0x1E0C,	%i7
	popc	0x019D,	%g7
	andcc	%i6,	0x0261,	%g3
	ldx	[%l7 + 0x58],	%l0
	fpadd32	%f26,	%f30,	%f10
	addcc	%o3,	0x115C,	%o7
	movg	%icc,	%i3,	%i0
	movge	%icc,	%o6,	%l6
	sll	%l4,	%g1,	%l2
	edge8	%o1,	%g5,	%o4
	movne	%xcc,	%l1,	%o0
	orcc	%g6,	0x01FF,	%i4
	fmovdcc	%xcc,	%f10,	%f2
	ldsb	[%l7 + 0x2C],	%g2
	movvs	%icc,	%i5,	%g4
	umul	%l5,	0x067B,	%o5
	fmul8x16au	%f26,	%f19,	%f20
	smulcc	%l3,	0x1B58,	%i1
	andncc	%o2,	%i7,	%g7
	movge	%icc,	%i6,	%i2
	smulcc	%g3,	0x0EA0,	%o3
	stx	%o7,	[%l7 + 0x68]
	edge16	%i3,	%l0,	%o6
	movleu	%icc,	%i0,	%l6
	fnot2s	%f22,	%f10
	edge8ln	%l4,	%g1,	%l2
	udivx	%o1,	0x1EDE,	%g5
	fornot1s	%f10,	%f19,	%f4
	mulx	%l1,	0x0AAE,	%o0
	fsrc2	%f8,	%f16
	fmovde	%xcc,	%f12,	%f21
	sra	%o4,	0x08,	%i4
	fmovd	%f6,	%f4
	alignaddrl	%g6,	%g2,	%i5
	movcc	%icc,	%l5,	%g4
	ld	[%l7 + 0x2C],	%f9
	movpos	%icc,	%o5,	%l3
	save %i1, 0x1F7A, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%g7,	%i6,	%i2
	movl	%xcc,	%i7,	%o3
	lduh	[%l7 + 0x6A],	%o7
	subcc	%g3,	0x1CF9,	%i3
	fmovdcs	%icc,	%f15,	%f2
	save %o6, 0x17E8, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x44],	%l6
	edge16ln	%l4,	%g1,	%l2
	mulscc	%o1,	%i0,	%l1
	ldub	[%l7 + 0x08],	%g5
	edge16n	%o4,	%o0,	%g6
	movrne	%g2,	0x18D,	%i4
	edge8	%i5,	%l5,	%g4
	lduw	[%l7 + 0x54],	%l3
	stw	%i1,	[%l7 + 0x6C]
	fmovrsgz	%o5,	%f26,	%f14
	movle	%xcc,	%g7,	%i6
	fpmerge	%f15,	%f13,	%f20
	edge16	%i2,	%i7,	%o3
	fmovdg	%icc,	%f5,	%f21
	fcmpne32	%f0,	%f28,	%o2
	ldd	[%l7 + 0x30],	%f14
	fmovscs	%icc,	%f17,	%f12
	sth	%o7,	[%l7 + 0x74]
	sethi	0x060A,	%g3
	movgu	%xcc,	%o6,	%l0
	movcs	%icc,	%l6,	%l4
	alignaddrl	%g1,	%l2,	%o1
	ldsh	[%l7 + 0x5A],	%i0
	movle	%icc,	%i3,	%g5
	umulcc	%o4,	%o0,	%g6
	movne	%xcc,	%g2,	%i4
	movrgez	%l1,	%l5,	%i5
	fnand	%f26,	%f8,	%f30
	movg	%xcc,	%g4,	%i1
	edge32ln	%o5,	%l3,	%g7
	movneg	%xcc,	%i2,	%i7
	movcs	%xcc,	%i6,	%o3
	orncc	%o2,	0x190C,	%o7
	movg	%xcc,	%o6,	%g3
	fmovrdlz	%l6,	%f20,	%f12
	movrne	%l4,	0x2C1,	%l0
	addccc	%l2,	%o1,	%i0
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	udivx	%o0,	0x021C,	%g1
	xnor	%g2,	0x13FF,	%i4
	addccc	%l1,	%l5,	%g6
	andn	%i5,	0x07A3,	%g4
	addcc	%o5,	0x14F3,	%l3
	movn	%icc,	%i1,	%i2
	edge8ln	%g7,	%i6,	%o3
	ldsh	[%l7 + 0x38],	%i7
	fpmerge	%f10,	%f10,	%f6
	edge16	%o2,	%o7,	%g3
	addccc	%o6,	%l6,	%l0
	xnor	%l4,	%l2,	%o1
	ldsb	[%l7 + 0x46],	%i3
	fcmpgt32	%f22,	%f6,	%i0
	movpos	%xcc,	%g5,	%o4
	movgu	%icc,	%o0,	%g1
	ldub	[%l7 + 0x67],	%i4
	fxnor	%f18,	%f10,	%f24
	movn	%xcc,	%g2,	%l1
	movcc	%xcc,	%g6,	%l5
	ldsw	[%l7 + 0x74],	%i5
	fpadd16s	%f16,	%f24,	%f2
	ldd	[%l7 + 0x40],	%f4
	addcc	%g4,	%o5,	%i1
	sdivcc	%l3,	0x1120,	%g7
	ld	[%l7 + 0x78],	%f1
	srl	%i2,	%o3,	%i7
	edge32	%i6,	%o7,	%g3
	movle	%icc,	%o6,	%l6
	fmovdvs	%icc,	%f4,	%f3
	alignaddr	%o2,	%l0,	%l4
	lduw	[%l7 + 0x24],	%o1
	movrne	%l2,	0x397,	%i3
	ldsh	[%l7 + 0x3E],	%g5
	fmovdpos	%icc,	%f24,	%f16
	sdiv	%o4,	0x0FA9,	%i0
	sir	0x0CBF
	ldsh	[%l7 + 0x08],	%g1
	fmovdgu	%xcc,	%f30,	%f6
	andn	%i4,	%g2,	%o0
	fmovrsne	%g6,	%f28,	%f25
	nop
	set	0x08, %i3
	ldd	[%l7 + %i3],	%f18
	xnor	%l1,	0x1A9F,	%l5
	udiv	%i5,	0x15B1,	%g4
	movrne	%i1,	%l3,	%o5
	fcmped	%fcc1,	%f20,	%f28
	fmovrslez	%g7,	%f8,	%f15
	mulx	%i2,	0x1DC5,	%i7
	edge8ln	%o3,	%o7,	%g3
	stw	%i6,	[%l7 + 0x78]
	restore %l6, %o6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o2,	%o1
	xorcc	%l4,	0x114C,	%i3
	xnorcc	%g5,	0x0A58,	%o4
	xorcc	%i0,	%l2,	%g1
	fmovdvc	%xcc,	%f24,	%f22
	edge32n	%g2,	%i4,	%o0
	udivcc	%g6,	0x08C8,	%l5
	movne	%icc,	%i5,	%l1
	stb	%g4,	[%l7 + 0x14]
	edge32	%i1,	%l3,	%o5
	fmovdpos	%icc,	%f28,	%f23
	movrlz	%g7,	0x0E5,	%i2
	ldx	[%l7 + 0x70],	%o3
	sllx	%i7,	%o7,	%i6
	xorcc	%l6,	%g3,	%l0
	nop
	set	0x44, %i6
	lduw	[%l7 + %i6],	%o6
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%o2
	movrlez	%o1,	0x239,	%l4
	movre	%i3,	0x08F,	%o4
	sdiv	%g5,	0x1143,	%l2
	lduh	[%l7 + 0x76],	%i0
	sth	%g2,	[%l7 + 0x38]
	fmovdvs	%xcc,	%f5,	%f31
	fmovdvc	%icc,	%f9,	%f12
	fornot1s	%f17,	%f14,	%f18
	move	%xcc,	%g1,	%i4
	fmovscc	%xcc,	%f23,	%f19
	alignaddrl	%o0,	%g6,	%i5
	movgu	%xcc,	%l5,	%l1
	movpos	%icc,	%g4,	%l3
	xor	%i1,	%o5,	%g7
	orncc	%i2,	%o3,	%o7
	mulscc	%i7,	%i6,	%l6
	orn	%g3,	0x1578,	%o6
	srl	%o2,	%o1,	%l0
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	fpackfix	%f4,	%f6
	fmovs	%f18,	%f20
	ldd	[%l7 + 0x08],	%f2
	alignaddrl	%g5,	%i3,	%l2
	fnor	%f4,	%f14,	%f2
	edge8	%g2,	%g1,	%i4
	andncc	%i0,	%o0,	%g6
	siam	0x7
	orncc	%l5,	%i5,	%l1
	edge8l	%g4,	%l3,	%o5
	ldsw	[%l7 + 0x30],	%i1
	smulcc	%i2,	%o3,	%o7
	array32	%g7,	%i6,	%l6
	save %g3, 0x1DF1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i7,	%o2,	%o1
	fornot2	%f16,	%f22,	%f30
	subcc	%l0,	%l4,	%g5
	ldx	[%l7 + 0x48],	%i3
	fpack16	%f26,	%f24
	addc	%l2,	0x03AA,	%g2
	fmovde	%icc,	%f11,	%f26
	xnor	%o4,	%i4,	%g1
	fnot2s	%f0,	%f12
	umul	%i0,	%o0,	%l5
	udivcc	%i5,	0x1E67,	%g6
	restore %l1, %g4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f8,	%f0
	fmul8ulx16	%f18,	%f14,	%f26
	orncc	%i1,	%o5,	%o3
	ldsb	[%l7 + 0x35],	%o7
	edge32	%g7,	%i2,	%l6
	sllx	%i6,	0x02,	%o6
	edge8n	%g3,	%o2,	%i7
	fmovdge	%xcc,	%f3,	%f0
	movrlz	%l0,	%l4,	%g5
	smulcc	%o1,	0x0A93,	%i3
	fmovd	%f28,	%f12
	fsrc1s	%f31,	%f26
	movg	%icc,	%g2,	%o4
	pdist	%f14,	%f6,	%f24
	movrgez	%l2,	0x233,	%i4
	fandnot2s	%f29,	%f30,	%f24
	lduh	[%l7 + 0x14],	%g1
	edge8ln	%o0,	%i0,	%i5
	movvs	%icc,	%g6,	%l1
	movre	%g4,	%l3,	%i1
	save %l5, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f24,	%f24
	movcs	%icc,	%g7,	%o7
	xorcc	%i2,	0x174F,	%i6
	edge16	%l6,	%g3,	%o6
	udiv	%o2,	0x199E,	%i7
	fandnot2	%f6,	%f14,	%f20
	move	%icc,	%l4,	%g5
	sth	%l0,	[%l7 + 0x36]
	subccc	%i3,	%o1,	%g2
	movn	%xcc,	%o4,	%l2
	xnorcc	%i4,	0x0872,	%g1
	udivcc	%o0,	0x0F0C,	%i5
	addc	%i0,	%l1,	%g6
	movrne	%g4,	%l3,	%i1
	edge16ln	%o3,	%o5,	%l5
	fmovscc	%icc,	%f8,	%f19
	lduh	[%l7 + 0x72],	%o7
	stb	%g7,	[%l7 + 0x65]
	sub	%i2,	%i6,	%l6
	ldsb	[%l7 + 0x0A],	%g3
	ldsh	[%l7 + 0x36],	%o6
	andn	%o2,	0x0A0A,	%i7
	orcc	%g5,	0x14BA,	%l4
	xorcc	%i3,	0x060C,	%l0
	movrlz	%g2,	0x0D8,	%o4
	move	%icc,	%l2,	%i4
	orncc	%o1,	%o0,	%i5
	addcc	%i0,	%l1,	%g6
	ldsh	[%l7 + 0x20],	%g1
	movrgz	%g4,	%l3,	%o3
	edge32n	%i1,	%l5,	%o5
	fnegd	%f30,	%f6
	umul	%g7,	%i2,	%o7
	sdivx	%i6,	0x1335,	%g3
	umul	%l6,	%o6,	%i7
	fone	%f28
	ldsh	[%l7 + 0x48],	%g5
	fnand	%f28,	%f6,	%f22
	sdiv	%l4,	0x115D,	%i3
	fpmerge	%f1,	%f5,	%f6
	fpmerge	%f10,	%f5,	%f22
	fmul8sux16	%f30,	%f10,	%f24
	fmovda	%icc,	%f4,	%f29
	edge16n	%o2,	%l0,	%g2
	andn	%l2,	%i4,	%o4
	xorcc	%o0,	0x1F49,	%o1
	xnor	%i0,	%l1,	%g6
	alignaddr	%g1,	%i5,	%l3
	umulcc	%g4,	%o3,	%i1
	xorcc	%o5,	0x0C00,	%g7
	stw	%l5,	[%l7 + 0x58]
	movg	%icc,	%o7,	%i6
	edge8l	%g3,	%l6,	%i2
	sth	%o6,	[%l7 + 0x08]
	movcs	%icc,	%i7,	%l4
	mova	%xcc,	%g5,	%i3
	movrlz	%o2,	0x08B,	%l0
	fpadd32s	%f13,	%f26,	%f0
	mova	%icc,	%l2,	%g2
	movle	%xcc,	%i4,	%o0
	movcs	%xcc,	%o1,	%i0
	stb	%l1,	[%l7 + 0x37]
	std	%f4,	[%l7 + 0x70]
	movle	%xcc,	%g6,	%o4
	fpmerge	%f30,	%f21,	%f26
	st	%f5,	[%l7 + 0x2C]
	fmovrdlez	%i5,	%f20,	%f6
	lduh	[%l7 + 0x3A],	%l3
	subccc	%g4,	0x1FF3,	%o3
	sdivcc	%g1,	0x1DD5,	%i1
	edge16l	%g7,	%l5,	%o5
	array8	%i6,	%o7,	%l6
	fmovdne	%xcc,	%f5,	%f28
	movg	%xcc,	%g3,	%i2
	orn	%o6,	%i7,	%g5
	sdiv	%i3,	0x1976,	%l4
	ldd	[%l7 + 0x50],	%f22
	stw	%l0,	[%l7 + 0x38]
	movleu	%icc,	%o2,	%l2
	edge16	%g2,	%o0,	%o1
	fsrc1s	%f29,	%f25
	fpsub16s	%f13,	%f31,	%f30
	smulcc	%i0,	0x1804,	%i4
	std	%f28,	[%l7 + 0x20]
	add	%g6,	0x075D,	%o4
	fabsd	%f6,	%f8
	movgu	%icc,	%l1,	%i5
	fmovrsgz	%g4,	%f15,	%f15
	movcs	%xcc,	%l3,	%o3
	nop
	set	0x37, %o1
	stb	%i1,	[%l7 + %o1]
	add	%g1,	%l5,	%o5
	movleu	%xcc,	%i6,	%g7
	subc	%o7,	0x18A6,	%l6
	movgu	%icc,	%i2,	%o6
	edge8	%g3,	%g5,	%i3
	fandnot2	%f30,	%f16,	%f10
	fpackfix	%f20,	%f31
	movge	%xcc,	%l4,	%l0
	udivcc	%i7,	0x1F5E,	%o2
	sdiv	%g2,	0x184A,	%l2
	movg	%xcc,	%o1,	%o0
	movvc	%xcc,	%i4,	%g6
	subcc	%o4,	0x0EE4,	%i0
	fmovdneg	%xcc,	%f29,	%f10
	fornot1	%f6,	%f20,	%f14
	udiv	%l1,	0x1F54,	%g4
	edge32n	%i5,	%l3,	%o3
	edge8ln	%g1,	%i1,	%o5
	xnor	%l5,	0x0D16,	%g7
	xorcc	%o7,	0x0F5A,	%l6
	fpadd32s	%f12,	%f29,	%f2
	ldd	[%l7 + 0x70],	%i6
	subc	%i2,	0x095E,	%g3
	mulscc	%g5,	0x1FDF,	%o6
	movneg	%icc,	%i3,	%l0
	and	%i7,	0x0231,	%l4
	array8	%g2,	%l2,	%o1
	sll	%o0,	%i4,	%o2
	fpackfix	%f22,	%f18
	addcc	%o4,	%i0,	%l1
	faligndata	%f16,	%f8,	%f20
	smul	%g4,	0x181E,	%g6
	fornot2s	%f12,	%f7,	%f15
	edge8n	%l3,	%o3,	%i5
	fmul8sux16	%f16,	%f20,	%f2
	umulcc	%i1,	%o5,	%g1
	ldsb	[%l7 + 0x7F],	%g7
	fcmple32	%f8,	%f20,	%l5
	edge16n	%l6,	%i6,	%o7
	alignaddr	%g3,	%i2,	%o6
	udivcc	%i3,	0x0F1F,	%g5
	sll	%i7,	0x09,	%l0
	orcc	%g2,	0x0966,	%l2
	std	%f20,	[%l7 + 0x20]
	fnors	%f29,	%f10,	%f13
	fmovdvc	%xcc,	%f31,	%f5
	edge32l	%l4,	%o0,	%o1
	subcc	%i4,	%o4,	%i0
	ldsw	[%l7 + 0x18],	%o2
	array8	%l1,	%g4,	%g6
	nop
	set	0x0F, %i4
	stb	%o3,	[%l7 + %i4]
	xnorcc	%l3,	%i5,	%o5
	movrne	%g1,	0x312,	%i1
	srl	%g7,	%l5,	%l6
	move	%icc,	%i6,	%o7
	fpsub32s	%f31,	%f14,	%f8
	fmovdne	%icc,	%f7,	%f9
	sth	%g3,	[%l7 + 0x4A]
	fpsub16	%f0,	%f6,	%f28
	ld	[%l7 + 0x28],	%f16
	array16	%i2,	%o6,	%g5
	array8	%i3,	%i7,	%l0
	movg	%xcc,	%g2,	%l4
	fmovspos	%xcc,	%f8,	%f19
	fcmpgt16	%f6,	%f12,	%o0
	ldsb	[%l7 + 0x0E],	%o1
	smul	%i4,	0x0A6D,	%o4
	movgu	%xcc,	%i0,	%l2
	sll	%o2,	%l1,	%g6
	udivx	%o3,	0x053C,	%g4
	lduh	[%l7 + 0x40],	%i5
	edge32n	%o5,	%g1,	%i1
	fmovrslz	%g7,	%f21,	%f31
	ldd	[%l7 + 0x60],	%l2
	udiv	%l6,	0x1377,	%l5
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	fnegd	%f12,	%f22
	fmovsle	%icc,	%f27,	%f0
	smulcc	%o6,	0x0B10,	%g5
	umul	%i2,	%i7,	%l0
	edge16	%i3,	%l4,	%g2
	mova	%xcc,	%o0,	%i4
	movre	%o4,	%o1,	%i0
	fmovrslz	%l2,	%f16,	%f16
	edge8n	%l1,	%g6,	%o3
	add	%o2,	%g4,	%o5
	smul	%i5,	0x009A,	%i1
	umul	%g1,	%g7,	%l3
	array8	%l5,	%o7,	%l6
	fpadd32	%f26,	%f20,	%f16
	add	%i6,	0x18B4,	%o6
	stb	%g3,	[%l7 + 0x2A]
	edge16ln	%g5,	%i2,	%l0
	movrne	%i7,	0x25E,	%i3
	array8	%l4,	%g2,	%o0
	ldx	[%l7 + 0x20],	%o4
	fmovrdgez	%i4,	%f16,	%f0
	movge	%icc,	%o1,	%i0
	movcs	%xcc,	%l1,	%g6
	and	%l2,	0x0EC6,	%o3
	movre	%o2,	0x00F,	%g4
	fmovdle	%icc,	%f19,	%f15
	movrlez	%i5,	0x2E0,	%i1
	fmovdgu	%icc,	%f0,	%f4
	udivcc	%o5,	0x15F2,	%g1
	fzeros	%f14
	mova	%icc,	%g7,	%l3
	movre	%o7,	0x02A,	%l6
	sir	0x0DF3
	nop
	set	0x38, %o5
	ldd	[%l7 + %o5],	%i6
	sdiv	%o6,	0x18B7,	%l5
	fone	%f20
	move	%icc,	%g5,	%i2
	fmovsg	%xcc,	%f15,	%f13
	nop
	set	0x54, %i2
	ldsh	[%l7 + %i2],	%g3
	fpadd16s	%f3,	%f14,	%f13
	umulcc	%i7,	%i3,	%l0
	alignaddrl	%l4,	%g2,	%o0
	stb	%i4,	[%l7 + 0x0B]
	fmul8x16al	%f21,	%f31,	%f12
	stb	%o4,	[%l7 + 0x1B]
	nop
	set	0x20, %o6
	std	%f16,	[%l7 + %o6]
	fmovdn	%icc,	%f29,	%f25
	save %i0, %l1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l2,	0x19FE,	%o1
	ldd	[%l7 + 0x08],	%o2
	fmul8x16	%f11,	%f16,	%f20
	ldd	[%l7 + 0x20],	%f10
	fnands	%f19,	%f20,	%f0
	and	%g4,	0x09FF,	%o3
	edge32l	%i5,	%i1,	%o5
	fabsd	%f10,	%f0
	movn	%icc,	%g7,	%g1
	fcmpeq32	%f28,	%f16,	%o7
	fzero	%f14
	nop
	set	0x47, %l4
	stb	%l6,	[%l7 + %l4]
	movrlz	%l3,	%i6,	%o6
	stb	%g5,	[%l7 + 0x18]
	ld	[%l7 + 0x18],	%f25
	andncc	%l5,	%g3,	%i2
	std	%f18,	[%l7 + 0x70]
	subccc	%i7,	%l0,	%l4
	movrne	%g2,	%i3,	%o0
	smulcc	%o4,	%i0,	%i4
	sdivcc	%l1,	0x1509,	%g6
	edge16	%o1,	%l2,	%o2
	addccc	%g4,	%o3,	%i1
	alignaddr	%o5,	%g7,	%i5
	subcc	%g1,	%l6,	%l3
	fmovsn	%icc,	%f5,	%f28
	fpadd32	%f26,	%f16,	%f26
	sth	%i6,	[%l7 + 0x52]
	ldd	[%l7 + 0x60],	%f22
	ldsh	[%l7 + 0x40],	%o7
	andn	%g5,	%o6,	%g3
	udivcc	%i2,	0x1788,	%i7
	fpackfix	%f6,	%f29
	movn	%xcc,	%l5,	%l4
	ldd	[%l7 + 0x58],	%g2
	fnot1s	%f29,	%f28
	sllx	%l0,	0x05,	%i3
	subccc	%o0,	0x082D,	%o4
	umulcc	%i0,	0x0A28,	%l1
	orcc	%g6,	%o1,	%l2
	subcc	%i4,	%o2,	%g4
	fnors	%f4,	%f25,	%f3
	lduw	[%l7 + 0x78],	%i1
	popc	%o3,	%g7
	orncc	%i5,	0x056A,	%o5
	addc	%g1,	0x0D11,	%l6
	fmovsge	%icc,	%f24,	%f11
	ldsb	[%l7 + 0x30],	%i6
	ldub	[%l7 + 0x52],	%o7
	edge32ln	%l3,	%g5,	%o6
	fexpand	%f30,	%f26
	smul	%i2,	0x0F26,	%i7
	fmul8x16al	%f23,	%f12,	%f4
	alignaddr	%g3,	%l5,	%l4
	fabsd	%f6,	%f8
	edge8	%g2,	%l0,	%o0
	movne	%icc,	%i3,	%o4
	mulscc	%i0,	%l1,	%g6
	edge32l	%l2,	%o1,	%o2
	popc	%i4,	%g4
	fmovde	%xcc,	%f16,	%f28
	and	%i1,	%o3,	%g7
	fmovrsgz	%i5,	%f18,	%f15
	fmovsl	%icc,	%f14,	%f18
	edge16	%o5,	%g1,	%i6
	edge32	%o7,	%l3,	%g5
	stb	%o6,	[%l7 + 0x38]
	sra	%l6,	%i7,	%i2
	edge32l	%l5,	%g3,	%l4
	udiv	%l0,	0x193A,	%o0
	movre	%g2,	%i3,	%i0
	fabss	%f30,	%f30
	srlx	%o4,	%l1,	%g6
	edge32	%o1,	%o2,	%l2
	andncc	%i4,	%g4,	%i1
	fmovsne	%xcc,	%f7,	%f14
	edge8l	%o3,	%g7,	%o5
	sll	%g1,	0x04,	%i5
	fpack16	%f16,	%f28
	movrgez	%o7,	0x08C,	%l3
	edge32n	%i6,	%g5,	%o6
	mova	%xcc,	%l6,	%i7
	xnorcc	%i2,	%g3,	%l4
	fexpand	%f8,	%f0
	save %l0, 0x0A1E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f20,	%f14,	%o0
	edge16	%g2,	%i3,	%o4
	sdivx	%l1,	0x0B10,	%g6
	movl	%icc,	%o1,	%i0
	fmovrsgz	%l2,	%f26,	%f25
	fandnot1	%f20,	%f10,	%f8
	sdivx	%o2,	0x0715,	%i4
	xnorcc	%i1,	%g4,	%o3
	movn	%xcc,	%o5,	%g7
	ld	[%l7 + 0x68],	%f20
	addc	%g1,	%i5,	%l3
	and	%o7,	%g5,	%o6
	and	%l6,	%i7,	%i6
	fandnot1s	%f29,	%f31,	%f0
	edge8l	%i2,	%l4,	%l0
	stw	%l5,	[%l7 + 0x64]
	movle	%xcc,	%g3,	%g2
	ldsh	[%l7 + 0x7A],	%o0
	smul	%i3,	%l1,	%o4
	edge32ln	%g6,	%o1,	%i0
	fmuld8sux16	%f16,	%f18,	%f10
	mova	%icc,	%o2,	%l2
	save %i1, %i4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o5,	%g7
	stb	%g4,	[%l7 + 0x60]
	lduw	[%l7 + 0x1C],	%i5
	movl	%xcc,	%g1,	%l3
	addc	%g5,	%o7,	%o6
	fones	%f11
	add	%i7,	%i6,	%i2
	xnor	%l6,	%l0,	%l4
	addccc	%l5,	0x0909,	%g3
	edge8ln	%g2,	%i3,	%o0
	addc	%l1,	0x0E76,	%g6
	andn	%o1,	%i0,	%o4
	umulcc	%l2,	0x0EFC,	%i1
	add	%i4,	0x036F,	%o2
	movle	%icc,	%o3,	%g7
	move	%xcc,	%g4,	%o5
	movge	%xcc,	%i5,	%g1
	movrlz	%g5,	0x094,	%o7
	ldsh	[%l7 + 0x4A],	%o6
	edge16	%i7,	%l3,	%i6
	st	%f18,	[%l7 + 0x4C]
	lduh	[%l7 + 0x5C],	%i2
	fnot1	%f12,	%f12
	fmovrsgz	%l0,	%f4,	%f12
	edge32l	%l4,	%l5,	%g3
	edge8	%l6,	%i3,	%g2
	alignaddrl	%l1,	%g6,	%o1
	movre	%i0,	%o4,	%l2
	andncc	%o0,	%i1,	%i4
	fmovs	%f6,	%f4
	udivcc	%o2,	0x07B9,	%g7
	fmovde	%xcc,	%f19,	%f29
	save %o3, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o5,	0x0B5,	%g1
	fone	%f8
	edge16ln	%g5,	%o6,	%i7
	edge8l	%l3,	%i6,	%i2
	udiv	%l0,	0x008E,	%l4
	movle	%icc,	%l5,	%g3
	save %o7, %i3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%l6,	%g6
	subcc	%l1,	0x1DB7,	%i0
	st	%f20,	[%l7 + 0x4C]
	fmovscs	%xcc,	%f14,	%f7
	fmovrsne	%o1,	%f19,	%f24
	smulcc	%o4,	0x125F,	%l2
	nop
	set	0x50, %o7
	lduw	[%l7 + %o7],	%o0
	restore %i1, 0x0EB6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g7,	%o3,	%g4
	umulcc	%o2,	0x17C7,	%i5
	movrlz	%o5,	%g5,	%o6
	movle	%icc,	%g1,	%l3
	andncc	%i7,	%i6,	%i2
	ldsw	[%l7 + 0x38],	%l4
	stb	%l5,	[%l7 + 0x58]
	sdiv	%l0,	0x1277,	%o7
	fmovsl	%xcc,	%f27,	%f22
	xnorcc	%i3,	%g3,	%g2
	sth	%g6,	[%l7 + 0x56]
	ldx	[%l7 + 0x08],	%l6
	st	%f8,	[%l7 + 0x24]
	sth	%l1,	[%l7 + 0x20]
	xnorcc	%i0,	0x10ED,	%o4
	array32	%l2,	%o1,	%i1
	udivcc	%i4,	0x126F,	%o0
	fandnot1	%f18,	%f18,	%f28
	movleu	%xcc,	%g7,	%o3
	movre	%g4,	0x3C0,	%i5
	fpsub32s	%f25,	%f25,	%f12
	fcmple16	%f6,	%f26,	%o5
	srl	%o2,	%o6,	%g5
	fone	%f18
	movl	%xcc,	%g1,	%l3
	fnot2s	%f2,	%f14
	edge32	%i7,	%i2,	%i6
	array32	%l4,	%l0,	%l5
	xnorcc	%i3,	0x0795,	%o7
	xnorcc	%g3,	%g6,	%l6
	alignaddrl	%g2,	%l1,	%i0
	fabsd	%f4,	%f16
	pdist	%f12,	%f26,	%f20
	edge16n	%o4,	%l2,	%i1
	mulx	%o1,	0x04B0,	%o0
	fmovdleu	%icc,	%f10,	%f8
	fmovrdgez	%g7,	%f0,	%f0
	edge16ln	%o3,	%g4,	%i4
	movgu	%icc,	%i5,	%o2
	andncc	%o5,	%g5,	%o6
	sethi	0x1591,	%l3
	alignaddr	%g1,	%i2,	%i6
	movrlz	%i7,	0x30F,	%l0
	fmovrdlez	%l5,	%f6,	%f2
	movne	%xcc,	%l4,	%o7
	movpos	%xcc,	%i3,	%g3
	fmovdne	%xcc,	%f6,	%f0
	fmovsa	%icc,	%f21,	%f24
	xorcc	%l6,	%g6,	%l1
	ldub	[%l7 + 0x67],	%i0
	edge16	%g2,	%l2,	%o4
	fandnot2s	%f27,	%f7,	%f1
	fand	%f10,	%f24,	%f6
	mulscc	%i1,	%o0,	%o1
	sra	%o3,	0x19,	%g4
	edge8n	%g7,	%i4,	%o2
	edge32	%i5,	%g5,	%o6
	orn	%l3,	%g1,	%i2
	ldsh	[%l7 + 0x36],	%o5
	sir	0x13C8
	sllx	%i7,	%i6,	%l0
	andn	%l4,	%o7,	%l5
	movrne	%i3,	%l6,	%g3
	udivcc	%l1,	0x12A5,	%i0
	subc	%g2,	0x03B2,	%g6
	sdiv	%l2,	0x0538,	%o4
	andncc	%o0,	%i1,	%o1
	edge16	%g4,	%o3,	%g7
	xnor	%i4,	%i5,	%o2
	movvs	%xcc,	%g5,	%o6
	udiv	%g1,	0x1D07,	%l3
	smulcc	%i2,	%o5,	%i7
	fmul8sux16	%f16,	%f20,	%f6
	sllx	%l0,	%i6,	%o7
	fmovsa	%xcc,	%f7,	%f2
	movge	%xcc,	%l5,	%i3
	smul	%l4,	%l6,	%g3
	mulx	%i0,	0x04E3,	%l1
	fmovsvc	%icc,	%f19,	%f21
	edge16l	%g6,	%l2,	%g2
	edge32ln	%o0,	%o4,	%i1
	movcs	%icc,	%o1,	%o3
	sth	%g7,	[%l7 + 0x10]
	sir	0x1401
	fmovdle	%icc,	%f24,	%f19
	nop
	set	0x46, %i7
	sth	%i4,	[%l7 + %i7]
	sth	%g4,	[%l7 + 0x0C]
	movcc	%icc,	%o2,	%i5
	stx	%o6,	[%l7 + 0x10]
	fmuld8sux16	%f4,	%f6,	%f26
	fpackfix	%f2,	%f4
	edge32n	%g1,	%g5,	%l3
	fcmpeq32	%f6,	%f20,	%o5
	addccc	%i7,	%l0,	%i6
	andn	%i2,	%l5,	%o7
	umulcc	%i3,	0x147A,	%l6
	st	%f16,	[%l7 + 0x14]
	xor	%g3,	%i0,	%l1
	stb	%g6,	[%l7 + 0x40]
	fxor	%f14,	%f18,	%f4
	movpos	%xcc,	%l2,	%l4
	nop
	set	0x0C, %l6
	ldsw	[%l7 + %l6],	%o0
	sra	%g2,	%i1,	%o4
	sra	%o3,	0x1B,	%g7
	srax	%o1,	%i4,	%o2
	subc	%g4,	0x0E54,	%i5
	fxnors	%f31,	%f20,	%f5
	fmovsl	%icc,	%f31,	%f2
	edge16ln	%g1,	%o6,	%l3
	sllx	%o5,	%i7,	%l0
	movcc	%xcc,	%g5,	%i2
	addc	%l5,	0x0859,	%o7
	andncc	%i3,	%l6,	%g3
	stw	%i0,	[%l7 + 0x68]
	add	%l1,	%g6,	%i6
	sethi	0x02DA,	%l4
	array16	%l2,	%g2,	%o0
	movrne	%i1,	%o3,	%o4
	xorcc	%g7,	%o1,	%i4
	andn	%o2,	0x0BFD,	%g4
	movgu	%icc,	%g1,	%o6
	movrne	%i5,	0x13F,	%o5
	stb	%i7,	[%l7 + 0x3C]
	fmul8x16au	%f15,	%f17,	%f30
	andcc	%l0,	%l3,	%g5
	fpadd32s	%f19,	%f2,	%f26
	fmovrdgez	%i2,	%f10,	%f0
	ldub	[%l7 + 0x60],	%l5
	mova	%xcc,	%o7,	%i3
	fmul8x16al	%f22,	%f27,	%f20
	movvc	%icc,	%l6,	%i0
	edge16ln	%l1,	%g3,	%g6
	orn	%i6,	0x1E07,	%l2
	fsrc2s	%f20,	%f18
	subccc	%g2,	%l4,	%o0
	fmovdvs	%xcc,	%f30,	%f19
	lduh	[%l7 + 0x12],	%o3
	array32	%o4,	%g7,	%o1
	stw	%i1,	[%l7 + 0x60]
	alignaddrl	%i4,	%o2,	%g4
	fmovsn	%xcc,	%f0,	%f5
	ldd	[%l7 + 0x28],	%f14
	array16	%g1,	%i5,	%o6
	sub	%o5,	%l0,	%i7
	andncc	%g5,	%i2,	%l5
	fandnot2	%f6,	%f14,	%f8
	edge32	%o7,	%l3,	%l6
	andncc	%i3,	%l1,	%g3
	movvc	%xcc,	%i0,	%g6
	sub	%l2,	%i6,	%l4
	fmul8x16	%f6,	%f18,	%f26
	movrlz	%o0,	%o3,	%g2
	ldx	[%l7 + 0x28],	%o4
	addc	%o1,	0x1F7A,	%i1
	fnor	%f16,	%f10,	%f18
	movl	%xcc,	%g7,	%o2
	xnor	%i4,	0x192F,	%g4
	sllx	%g1,	0x0E,	%i5
	edge16n	%o6,	%o5,	%l0
	movneg	%icc,	%g5,	%i7
	movcs	%icc,	%l5,	%i2
	sra	%o7,	%l6,	%l3
	edge16n	%l1,	%i3,	%i0
	ld	[%l7 + 0x10],	%f6
	edge8l	%g3,	%l2,	%g6
	std	%f0,	[%l7 + 0x10]
	nop
	set	0x5C, %o0
	ldsb	[%l7 + %o0],	%i6
	st	%f2,	[%l7 + 0x54]
	fcmpgt16	%f4,	%f4,	%l4
	fxors	%f19,	%f30,	%f30
	edge16l	%o3,	%g2,	%o4
	fmovdneg	%icc,	%f20,	%f1
	mulscc	%o0,	0x0BF9,	%i1
	fmul8ulx16	%f2,	%f2,	%f6
	sll	%o1,	%o2,	%i4
	movleu	%xcc,	%g4,	%g7
	lduh	[%l7 + 0x66],	%i5
	stw	%g1,	[%l7 + 0x4C]
	movrgez	%o6,	0x11C,	%o5
	sll	%l0,	0x1C,	%i7
	st	%f10,	[%l7 + 0x30]
	udivcc	%g5,	0x16E9,	%i2
	movg	%icc,	%l5,	%o7
	fsrc2	%f16,	%f24
	popc	%l3,	%l6
	alignaddr	%i3,	%l1,	%g3
	edge32n	%l2,	%i0,	%i6
	fcmpne32	%f20,	%f16,	%l4
	fcmpeq16	%f18,	%f22,	%g6
	edge8	%o3,	%o4,	%g2
	nop
	set	0x51, %g4
	stb	%i1,	[%l7 + %g4]
	lduw	[%l7 + 0x78],	%o1
	movn	%xcc,	%o2,	%i4
	edge32	%g4,	%g7,	%o0
	movrgez	%i5,	0x25C,	%o6
	edge8n	%o5,	%g1,	%l0
	fpadd32	%f24,	%f28,	%f2
	fmul8ulx16	%f2,	%f10,	%f16
	ldub	[%l7 + 0x32],	%g5
	movleu	%icc,	%i7,	%l5
	add	%i2,	%l3,	%o7
	andn	%i3,	0x02E0,	%l6
	movgu	%icc,	%g3,	%l1
	fmuld8ulx16	%f1,	%f8,	%f10
	fmovsleu	%icc,	%f12,	%f4
	sth	%i0,	[%l7 + 0x46]
	std	%f0,	[%l7 + 0x20]
	orn	%i6,	%l4,	%l2
	edge32n	%g6,	%o4,	%o3
	edge8n	%i1,	%o1,	%o2
	srl	%g2,	%g4,	%g7
	stw	%o0,	[%l7 + 0x7C]
	movrne	%i5,	%i4,	%o6
	alignaddrl	%g1,	%l0,	%o5
	mulx	%i7,	%l5,	%g5
	xnor	%i2,	%l3,	%i3
	popc	0x0D68,	%l6
	pdist	%f2,	%f0,	%f30
	xor	%o7,	%g3,	%i0
	subc	%l1,	%i6,	%l2
	edge32	%g6,	%o4,	%o3
	sir	0x0F8A
	fpadd16s	%f2,	%f21,	%f25
	fmovsne	%icc,	%f29,	%f27
	array16	%l4,	%o1,	%o2
	lduw	[%l7 + 0x78],	%g2
	sdivx	%g4,	0x10E4,	%g7
	std	%f26,	[%l7 + 0x60]
	srax	%i1,	0x0C,	%o0
	edge8	%i5,	%o6,	%i4
	fpsub32	%f18,	%f26,	%f4
	lduh	[%l7 + 0x2A],	%l0
	sdiv	%o5,	0x17CE,	%i7
	movvc	%xcc,	%g1,	%g5
	lduh	[%l7 + 0x3C],	%l5
	movcs	%xcc,	%i2,	%i3
	popc	%l6,	%l3
	orn	%g3,	%i0,	%l1
	ldd	[%l7 + 0x08],	%f22
	edge16n	%o7,	%i6,	%g6
	udivx	%o4,	0x19C7,	%o3
	udiv	%l4,	0x099C,	%o1
	fxors	%f22,	%f19,	%f30
	movrlz	%l2,	%g2,	%o2
	movn	%icc,	%g4,	%i1
	nop
	set	0x2C, %i5
	ldsw	[%l7 + %i5],	%o0
	movne	%icc,	%g7,	%i5
	stb	%i4,	[%l7 + 0x62]
	fmovsne	%xcc,	%f21,	%f7
	movn	%xcc,	%o6,	%o5
	mulscc	%i7,	%g1,	%l0
	addcc	%l5,	%i2,	%i3
	xnor	%g5,	%l6,	%g3
	ld	[%l7 + 0x78],	%f11
	movl	%icc,	%l3,	%l1
	udivx	%o7,	0x024E,	%i6
	edge8l	%g6,	%i0,	%o3
	array32	%o4,	%l4,	%l2
	sra	%g2,	0x18,	%o1
	srax	%g4,	0x02,	%o2
	movrne	%o0,	%i1,	%i5
	movcs	%icc,	%i4,	%o6
	bshuffle	%f2,	%f6,	%f8
	srlx	%g7,	0x14,	%o5
	edge32ln	%i7,	%l0,	%l5
	fmovdcs	%xcc,	%f15,	%f11
	lduh	[%l7 + 0x52],	%g1
	ld	[%l7 + 0x20],	%f10
	movrlez	%i3,	%i2,	%l6
	movcs	%xcc,	%g5,	%g3
	fmovdgu	%icc,	%f2,	%f24
	sethi	0x0684,	%l3
	movgu	%xcc,	%l1,	%i6
	fmovsvs	%xcc,	%f6,	%f19
	siam	0x0
	fors	%f7,	%f20,	%f24
	movcc	%icc,	%g6,	%o7
	addc	%i0,	%o3,	%l4
	mulscc	%l2,	%g2,	%o4
	addcc	%o1,	%g4,	%o2
	stw	%i1,	[%l7 + 0x1C]
	stx	%o0,	[%l7 + 0x78]
	xnor	%i4,	%o6,	%g7
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	fmuld8sux16	%f12,	%f17,	%f10
	ldsb	[%l7 + 0x48],	%o5
	udivcc	%l0,	0x1C15,	%g1
	ldsw	[%l7 + 0x28],	%i3
	fmovrsne	%l5,	%f4,	%f18
	sir	0x05DE
	fpsub16s	%f0,	%f31,	%f28
	fmovsge	%xcc,	%f14,	%f15
	fmul8x16	%f11,	%f16,	%f0
	ldsh	[%l7 + 0x3A],	%i2
	fsrc1	%f14,	%f0
	edge8l	%g5,	%l6,	%l3
	sub	%g3,	%i6,	%l1
	fmovrse	%g6,	%f7,	%f0
	fmul8ulx16	%f6,	%f22,	%f28
	xor	%o7,	0x1314,	%o3
	edge16n	%l4,	%l2,	%i0
	fmovscs	%xcc,	%f29,	%f6
	movgu	%xcc,	%g2,	%o1
	srl	%g4,	0x16,	%o2
	edge32ln	%o4,	%o0,	%i1
	sethi	0x1F65,	%o6
	popc	%g7,	%i5
	array32	%i7,	%i4,	%o5
	edge32l	%g1,	%l0,	%l5
	fmovrslz	%i3,	%f23,	%f15
	srax	%i2,	0x14,	%l6
	fcmpd	%fcc2,	%f12,	%f26
	addc	%g5,	0x030C,	%l3
	fmovrdlz	%g3,	%f6,	%f12
	array8	%i6,	%g6,	%o7
	movrgez	%l1,	%o3,	%l4
	alignaddr	%l2,	%i0,	%o1
	stx	%g2,	[%l7 + 0x58]
	save %o2, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i1,	%o4,	%o6
	fzeros	%f2
	sethi	0x0574,	%i5
	array32	%i7,	%g7,	%i4
	fands	%f1,	%f11,	%f6
	subcc	%o5,	0x0645,	%g1
	fnands	%f9,	%f4,	%f30
	fpsub16s	%f11,	%f17,	%f22
	udivcc	%l0,	0x03DC,	%i3
	movge	%xcc,	%l5,	%l6
	movre	%i2,	%g5,	%l3
	fsrc2s	%f10,	%f15
	edge8l	%i6,	%g3,	%g6
	fabss	%f27,	%f21
	addccc	%l1,	0x0A04,	%o3
	ldd	[%l7 + 0x20],	%f28
	movge	%xcc,	%o7,	%l4
	udivcc	%i0,	0x0BEE,	%l2
	alignaddr	%o1,	%o2,	%g2
	movl	%xcc,	%g4,	%o0
	stb	%i1,	[%l7 + 0x3D]
	edge16n	%o6,	%o4,	%i7
	smul	%g7,	0x11D8,	%i5
	ldd	[%l7 + 0x28],	%i4
	sir	0x0D87
	add	%g1,	0x1F3D,	%o5
	fpsub32s	%f0,	%f12,	%f7
	srax	%l0,	%i3,	%l6
	nop
	set	0x60, %l1
	ldd	[%l7 + %l1],	%f2
	edge32ln	%i2,	%l5,	%g5
	subcc	%i6,	%l3,	%g3
	edge32n	%g6,	%l1,	%o3
	movrne	%o7,	0x1D6,	%l4
	mulscc	%i0,	0x05D1,	%l2
	ldsw	[%l7 + 0x2C],	%o2
	orcc	%g2,	%g4,	%o1
	movleu	%xcc,	%o0,	%i1
	mulx	%o4,	%i7,	%g7
	fmuld8sux16	%f18,	%f0,	%f12
	fpsub16	%f26,	%f4,	%f22
	movre	%i5,	%i4,	%o6
	movrgz	%o5,	0x124,	%g1
	umul	%l0,	%i3,	%l6
	edge16ln	%l5,	%g5,	%i2
	stw	%i6,	[%l7 + 0x10]
	fnegs	%f11,	%f5
	ldsb	[%l7 + 0x53],	%l3
	fmovrslz	%g6,	%f5,	%f19
	stb	%g3,	[%l7 + 0x35]
	stb	%o3,	[%l7 + 0x39]
	movg	%xcc,	%l1,	%l4
	ldd	[%l7 + 0x60],	%f6
	restore %o7, %l2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%xcc,	%i0,	%g4
	add	%g2,	%o1,	%i1
	movrgez	%o4,	%o0,	%g7
	udivcc	%i7,	0x103F,	%i4
	udivx	%o6,	0x132A,	%i5
	lduh	[%l7 + 0x2E],	%g1
	fxnor	%f20,	%f6,	%f24
	fmovsa	%xcc,	%f10,	%f12
	movvc	%icc,	%l0,	%i3
	stw	%l6,	[%l7 + 0x10]
	fmovrdne	%l5,	%f10,	%f12
	xor	%g5,	%i2,	%o5
	mulscc	%l3,	0x17B2,	%i6
	sdivcc	%g3,	0x0480,	%g6
	sdivcc	%l1,	0x1514,	%o3
	orn	%l4,	%o7,	%l2
	add	%i0,	%g4,	%o2
	xorcc	%g2,	0x140B,	%i1
	sdivcc	%o1,	0x126B,	%o4
	array8	%g7,	%o0,	%i7
	fmovrsne	%i4,	%f19,	%f18
	edge32l	%i5,	%o6,	%l0
	movrlz	%i3,	0x1F6,	%g1
	fornot2s	%f22,	%f8,	%f19
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	orn	%o5,	0x1D41,	%g5
	movl	%icc,	%l3,	%g3
	udiv	%i6,	0x1B52,	%g6
	fnand	%f12,	%f18,	%f10
	add	%o3,	0x16EE,	%l4
	movne	%xcc,	%l1,	%l2
	array16	%o7,	%g4,	%o2
	fmovdl	%xcc,	%f10,	%f5
	smul	%g2,	%i0,	%o1
	fpadd32s	%f17,	%f23,	%f3
	pdist	%f26,	%f8,	%f30
	fabsd	%f8,	%f10
	fabsd	%f28,	%f30
	fmovrde	%o4,	%f30,	%f0
	ldsw	[%l7 + 0x58],	%g7
	save %o0, %i7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i5,	0x10,	%o6
	restore %i1, 0x032E, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g1,	0x064,	%l0
	fmovdl	%xcc,	%f0,	%f31
	fmovdneg	%icc,	%f28,	%f13
	nop
	set	0x50, %l3
	std	%f18,	[%l7 + %l3]
	bshuffle	%f14,	%f4,	%f20
	smul	%l5,	%l6,	%i2
	udiv	%o5,	0x1C09,	%g5
	array16	%l3,	%g3,	%g6
	xor	%i6,	%o3,	%l1
	movrgez	%l4,	%l2,	%g4
	or	%o2,	0x0C71,	%g2
	sllx	%o7,	0x14,	%i0
	xnorcc	%o4,	0x1E9F,	%g7
	fmovsl	%icc,	%f3,	%f12
	addccc	%o0,	%i7,	%i4
	or	%i5,	%o6,	%o1
	fcmpd	%fcc0,	%f18,	%f8
	mulx	%i3,	%g1,	%i1
	edge32ln	%l0,	%l5,	%i2
	pdist	%f28,	%f16,	%f12
	fxnor	%f30,	%f0,	%f14
	fornot1	%f28,	%f14,	%f30
	alignaddrl	%l6,	%g5,	%l3
	ldx	[%l7 + 0x18],	%g3
	std	%f24,	[%l7 + 0x20]
	fmul8sux16	%f12,	%f28,	%f18
	alignaddrl	%g6,	%i6,	%o5
	srax	%o3,	0x1A,	%l1
	fmovdneg	%icc,	%f10,	%f9
	add	%l4,	%l2,	%g4
	save %o2, %g2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o7,	%o4,	%o0
	sir	0x0740
	sdiv	%i7,	0x191D,	%g7
	ldx	[%l7 + 0x10],	%i5
	stw	%o6,	[%l7 + 0x54]
	alignaddr	%i4,	%o1,	%g1
	umulcc	%i1,	0x12F2,	%l0
	andcc	%i3,	0x1C35,	%i2
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	movgu	%icc,	%l5,	%g3
	fxnors	%f20,	%f1,	%f23
	sdivx	%i6,	0x198D,	%o5
	umul	%g6,	0x1F85,	%l1
	ld	[%l7 + 0x1C],	%f18
	ldsw	[%l7 + 0x44],	%o3
	andn	%l4,	%g4,	%o2
	sra	%g2,	%l2,	%o7
	sllx	%i0,	0x16,	%o4
	addcc	%i7,	%g7,	%o0
	xnorcc	%o6,	0x1C4E,	%i5
	fxnor	%f22,	%f20,	%f16
	fandnot2	%f6,	%f26,	%f22
	movpos	%icc,	%i4,	%o1
	movrgez	%i1,	0x0B5,	%g1
	andncc	%l0,	%i2,	%l6
	subcc	%i3,	%g5,	%l5
	alignaddr	%g3,	%l3,	%o5
	movpos	%xcc,	%i6,	%l1
	or	%o3,	0x1FE3,	%l4
	fcmple32	%f4,	%f12,	%g6
	fexpand	%f25,	%f20
	fmovrslz	%o2,	%f5,	%f11
	fcmpne32	%f4,	%f4,	%g4
	umul	%g2,	%o7,	%i0
	fmovdgu	%icc,	%f19,	%f7
	xnor	%o4,	0x0DDD,	%l2
	nop
	set	0x30, %l5
	ldd	[%l7 + %l5],	%i6
	andcc	%o0,	0x0253,	%g7
	sdivcc	%i5,	0x1785,	%o6
	edge16	%i4,	%o1,	%g1
	restore %l0, %i1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i2,	%g5,	%i3
	popc	%l5,	%l3
	movrlz	%o5,	0x3B8,	%g3
	fpsub32s	%f8,	%f5,	%f24
	movrlez	%l1,	0x197,	%i6
	mulx	%l4,	0x0A41,	%g6
	addc	%o2,	%o3,	%g4
	xor	%g2,	0x11CF,	%o7
	movl	%icc,	%o4,	%l2
	movcc	%icc,	%i7,	%o0
	srlx	%i0,	0x0B,	%g7
	fnands	%f3,	%f9,	%f24
	movrne	%i5,	%i4,	%o1
	movneg	%xcc,	%o6,	%g1
	sdivx	%l0,	0x0E62,	%l6
	ldsb	[%l7 + 0x5B],	%i1
	mulx	%g5,	0x17FC,	%i2
	srax	%i3,	0x1B,	%l5
	fxors	%f26,	%f8,	%f0
	sdivx	%o5,	0x0C05,	%g3
	std	%f24,	[%l7 + 0x28]
	fpmerge	%f0,	%f12,	%f28
	mulscc	%l3,	0x1138,	%i6
	stw	%l1,	[%l7 + 0x30]
	xnorcc	%l4,	0x077A,	%o2
	edge32ln	%o3,	%g4,	%g2
	udivcc	%o7,	0x0D33,	%o4
	fornot1	%f10,	%f16,	%f14
	stx	%l2,	[%l7 + 0x40]
	srlx	%g6,	%i7,	%o0
	srlx	%g7,	0x1D,	%i5
	fmovdg	%icc,	%f22,	%f22
	fmovrdgz	%i4,	%f26,	%f6
	stb	%o1,	[%l7 + 0x20]
	edge8n	%i0,	%o6,	%l0
	fpadd32s	%f17,	%f21,	%f26
	fpsub32	%f10,	%f16,	%f18
	srax	%g1,	0x10,	%l6
	movvc	%xcc,	%g5,	%i1
	srax	%i2,	%l5,	%i3
	edge32	%o5,	%g3,	%i6
	movle	%icc,	%l3,	%l1
	fmovdvs	%icc,	%f17,	%f30
	sllx	%o2,	%o3,	%g4
	addcc	%g2,	0x0A1B,	%l4
	sethi	0x132E,	%o7
	xnorcc	%o4,	%l2,	%i7
	movrne	%g6,	%g7,	%i5
	addcc	%i4,	%o0,	%i0
	fmul8sux16	%f30,	%f30,	%f10
	ldub	[%l7 + 0x78],	%o1
	fornot1	%f6,	%f24,	%f28
	addccc	%o6,	0x0817,	%l0
	ldd	[%l7 + 0x20],	%f12
	fmovdn	%icc,	%f12,	%f22
	sir	0x0448
	fmovse	%icc,	%f9,	%f28
	movg	%icc,	%g1,	%l6
	movvs	%icc,	%g5,	%i1
	stw	%i2,	[%l7 + 0x10]
	ldd	[%l7 + 0x78],	%i2
	nop
	set	0x37, %g6
	stb	%l5,	[%l7 + %g6]
	mulx	%g3,	0x1F13,	%i6
	subccc	%l3,	0x0F2D,	%o5
	or	%o2,	0x123C,	%l1
	edge8l	%g4,	%g2,	%o3
	std	%f24,	[%l7 + 0x08]
	srax	%l4,	%o7,	%l2
	edge32n	%o4,	%i7,	%g7
	fmovda	%xcc,	%f5,	%f6
	movpos	%xcc,	%i5,	%i4
	andn	%o0,	%g6,	%o1
	fone	%f20
	sra	%i0,	%o6,	%g1
	srax	%l6,	0x1A,	%g5
	edge8n	%i1,	%l0,	%i2
	st	%f14,	[%l7 + 0x6C]
	movl	%xcc,	%i3,	%l5
	movrlez	%i6,	0x17D,	%l3
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	addc	%g4,	0x13E5,	%o2
	fpadd16	%f26,	%f26,	%f10
	save %g2, %l4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f23,	%f12,	%f2
	mova	%xcc,	%l2,	%o3
	nop
	set	0x70, %l2
	sth	%o4,	[%l7 + %l2]
	ldd	[%l7 + 0x78],	%i6
	xnorcc	%i5,	%g7,	%i4
	sth	%g6,	[%l7 + 0x0E]
	fpsub32s	%f7,	%f3,	%f21
	udivcc	%o0,	0x0BDB,	%o1
	srlx	%o6,	0x1A,	%i0
	movrlez	%g1,	0x17E,	%g5
	sra	%i1,	%l6,	%i2
	edge32	%i3,	%l0,	%l5
	sub	%l3,	0x0212,	%o5
	movcc	%icc,	%g3,	%l1
	fcmpgt32	%f14,	%f30,	%i6
	movn	%icc,	%o2,	%g2
	fandnot1s	%f8,	%f4,	%f14
	stx	%l4,	[%l7 + 0x60]
	restore %g4, %l2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o7,	%o4,	%i5
	movvs	%icc,	%i7,	%g7
	sethi	0x1767,	%i4
	orncc	%g6,	0x0B1D,	%o0
	ldsh	[%l7 + 0x4E],	%o1
	edge16ln	%o6,	%i0,	%g1
	xorcc	%g5,	%l6,	%i2
	fandnot1s	%f5,	%f24,	%f19
	edge16	%i1,	%i3,	%l0
	xnor	%l3,	0x037A,	%l5
	xor	%o5,	%g3,	%i6
	movrgez	%l1,	%g2,	%l4
	ld	[%l7 + 0x0C],	%f31
	xor	%g4,	%o2,	%l2
	fones	%f7
	umul	%o3,	%o4,	%i5
	lduh	[%l7 + 0x2A],	%o7
	move	%icc,	%i7,	%i4
	edge8l	%g7,	%g6,	%o0
	ldd	[%l7 + 0x30],	%o6
	movgu	%icc,	%o1,	%g1
	fone	%f4
	fpadd32	%f18,	%f6,	%f16
	mulx	%g5,	0x079B,	%l6
	srl	%i2,	0x15,	%i0
	addcc	%i1,	%i3,	%l3
	movpos	%xcc,	%l0,	%l5
	srax	%o5,	%i6,	%g3
	fmovsgu	%xcc,	%f22,	%f10
	stx	%l1,	[%l7 + 0x78]
	edge32ln	%l4,	%g2,	%o2
	subccc	%l2,	%g4,	%o4
	fcmps	%fcc3,	%f24,	%f28
	fands	%f25,	%f0,	%f29
	xor	%o3,	0x027D,	%o7
	fpackfix	%f16,	%f15
	edge32n	%i7,	%i4,	%g7
	fcmple16	%f22,	%f14,	%g6
	fornot2s	%f2,	%f2,	%f18
	edge32l	%i5,	%o0,	%o6
	addc	%g1,	0x11D8,	%o1
	ldsw	[%l7 + 0x30],	%g5
	udivx	%i2,	0x1460,	%i0
	sir	0x1064
	orcc	%l6,	0x0725,	%i3
	edge32	%i1,	%l0,	%l5
	srax	%l3,	%i6,	%o5
	edge32n	%l1,	%g3,	%g2
	mulx	%l4,	%o2,	%l2
	fmovrslez	%g4,	%f3,	%f30
	lduw	[%l7 + 0x54],	%o4
	edge16n	%o7,	%o3,	%i4
	fcmpgt16	%f14,	%f18,	%g7
	fcmpgt16	%f10,	%f2,	%i7
	movre	%g6,	%i5,	%o6
	edge16n	%g1,	%o1,	%g5
	edge8n	%i2,	%o0,	%i0
	udivcc	%l6,	0x023A,	%i1
	faligndata	%f6,	%f28,	%f28
	movcc	%icc,	%i3,	%l5
	umul	%l3,	%i6,	%l0
	fnands	%f0,	%f15,	%f11
	ldsw	[%l7 + 0x70],	%o5
	edge32	%l1,	%g2,	%g3
	movn	%icc,	%l4,	%l2
	edge8n	%g4,	%o2,	%o4
	sllx	%o3,	%o7,	%g7
	ldsh	[%l7 + 0x60],	%i7
	array16	%i4,	%i5,	%g6
	subccc	%g1,	%o6,	%o1
	udivx	%i2,	0x0CF6,	%o0
	movre	%g5,	%i0,	%l6
	ldub	[%l7 + 0x38],	%i1
	srax	%i3,	0x08,	%l5
	movrne	%i6,	%l3,	%l0
	lduw	[%l7 + 0x3C],	%l1
	nop
	set	0x18, %o4
	ldd	[%l7 + %o4],	%f18
	fsrc2s	%f23,	%f10
	sdiv	%g2,	0x1333,	%g3
	addccc	%o5,	0x1ED3,	%l2
	movrlz	%l4,	%g4,	%o2
	fpadd32	%f30,	%f8,	%f4
	fmovsgu	%xcc,	%f25,	%f20
	movn	%xcc,	%o3,	%o4
	fmovsvc	%xcc,	%f3,	%f31
	edge16	%o7,	%g7,	%i4
	st	%f21,	[%l7 + 0x2C]
	edge16ln	%i7,	%i5,	%g6
	stw	%o6,	[%l7 + 0x44]
	movl	%xcc,	%o1,	%g1
	array8	%o0,	%g5,	%i2
	edge32n	%i0,	%i1,	%l6
	edge16	%l5,	%i6,	%l3
	fmovdcc	%icc,	%f29,	%f29
	pdist	%f18,	%f16,	%f24
	fpadd16	%f0,	%f24,	%f8
	stb	%i3,	[%l7 + 0x57]
	fmovdg	%icc,	%f20,	%f19
	fnands	%f25,	%f27,	%f14
	fxors	%f23,	%f31,	%f17
	fmovdpos	%xcc,	%f4,	%f18
	sub	%l0,	%g2,	%g3
	sir	0x1401
	lduh	[%l7 + 0x58],	%l1
	sra	%l2,	0x1D,	%l4
	fmovdpos	%icc,	%f21,	%f17
	alignaddrl	%g4,	%o2,	%o3
	fpadd32s	%f25,	%f30,	%f25
	addc	%o4,	0x13EB,	%o5
	movrlez	%o7,	%i4,	%i7
	edge8n	%i5,	%g7,	%o6
	addcc	%g6,	0x0CD7,	%g1
	subcc	%o1,	%g5,	%i2
	andcc	%i0,	%o0,	%l6
	fmovrdne	%i1,	%f28,	%f24
	movrne	%l5,	%i6,	%i3
	subccc	%l3,	0x1921,	%l0
	udivx	%g2,	0x1BF7,	%l1
	fnot2s	%f11,	%f26
	fmovdn	%xcc,	%f1,	%f19
	srl	%g3,	%l4,	%l2
	orn	%g4,	%o2,	%o3
	sdivcc	%o4,	0x06B4,	%o5
	ldsw	[%l7 + 0x14],	%i4
	subccc	%i7,	%i5,	%g7
	pdist	%f24,	%f4,	%f10
	st	%f28,	[%l7 + 0x54]
	andncc	%o6,	%g6,	%g1
	movrgez	%o1,	0x3C8,	%g5
	st	%f30,	[%l7 + 0x30]
	xor	%o7,	%i0,	%o0
	ldd	[%l7 + 0x08],	%i6
	andcc	%i1,	%l5,	%i2
	xorcc	%i3,	0x0932,	%l3
	ldsw	[%l7 + 0x6C],	%l0
	fmovsa	%icc,	%f17,	%f4
	lduh	[%l7 + 0x6C],	%i6
	fmovsg	%xcc,	%f21,	%f4
	edge16n	%g2,	%l1,	%l4
	subc	%g3,	%l2,	%o2
	smul	%g4,	0x0006,	%o3
	edge16	%o4,	%o5,	%i7
	addcc	%i4,	%i5,	%g7
	sth	%g6,	[%l7 + 0x5C]
	fnot2	%f6,	%f26
	fxor	%f16,	%f24,	%f24
	ldd	[%l7 + 0x40],	%g0
	sdivx	%o6,	0x0B5D,	%g5
	ldx	[%l7 + 0x20],	%o1
	udiv	%o7,	0x0414,	%i0
	fxnors	%f12,	%f8,	%f27
	st	%f15,	[%l7 + 0x74]
	edge16ln	%o0,	%l6,	%i1
	edge8ln	%l5,	%i3,	%l3
	xnor	%i2,	%i6,	%g2
	ldd	[%l7 + 0x28],	%f18
	ld	[%l7 + 0x78],	%f28
	movrlz	%l0,	%l4,	%g3
	nop
	set	0x5C, %g1
	lduh	[%l7 + %g1],	%l1
	ld	[%l7 + 0x64],	%f30
	fmovdl	%icc,	%f20,	%f12
	sll	%o2,	%l2,	%g4
	edge8n	%o4,	%o3,	%o5
	fmovscs	%xcc,	%f5,	%f22
	fmovsvs	%icc,	%f17,	%f23
	ldsh	[%l7 + 0x44],	%i4
	smul	%i5,	0x13EC,	%i7
	or	%g7,	%g6,	%g1
	fmovsleu	%xcc,	%f1,	%f1
	ldsh	[%l7 + 0x40],	%g5
	orcc	%o1,	%o6,	%o7
	sir	0x03AF
	st	%f8,	[%l7 + 0x20]
	movrgez	%i0,	0x3EA,	%l6
	mulscc	%i1,	0x0852,	%l5
	array8	%i3,	%l3,	%i2
	ldd	[%l7 + 0x38],	%f20
	subccc	%o0,	%g2,	%l0
	fcmpne32	%f12,	%f30,	%l4
	fmovsa	%xcc,	%f8,	%f26
	save %g3, %l1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%xcc,	%f22,	%f4
	udiv	%l2,	0x0F07,	%g4
	movge	%xcc,	%o2,	%o3
	sir	0x11CA
	fmovrsne	%o5,	%f30,	%f10
	sethi	0x12BE,	%i4
	orn	%o4,	0x118B,	%i5
	movcc	%icc,	%g7,	%g6
	subc	%i7,	0x0862,	%g5
	sir	0x11DC
	fmovrslz	%g1,	%f16,	%f10
	movcs	%xcc,	%o6,	%o7
	edge16ln	%o1,	%l6,	%i1
	faligndata	%f10,	%f14,	%f6
	fcmple16	%f24,	%f26,	%i0
	edge16l	%l5,	%i3,	%i2
	movvs	%icc,	%o0,	%l3
	smul	%l0,	%l4,	%g2
	srax	%l1,	0x07,	%g3
	alignaddr	%i6,	%g4,	%l2
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	array16	%i4,	%o5,	%o4
	smulcc	%g7,	0x0212,	%i5
	mulscc	%i7,	0x14D7,	%g6
	edge32n	%g1,	%o6,	%g5
	fcmpgt32	%f12,	%f22,	%o1
	fnot1	%f4,	%f26
	fmovrdne	%o7,	%f14,	%f10
	save %i1, %i0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l5,	%i3
	ldub	[%l7 + 0x54],	%i2
	udiv	%l3,	0x0D42,	%o0
	or	%l4,	%g2,	%l1
	edge32	%l0,	%i6,	%g4
	xor	%l2,	0x0979,	%g3
	ldd	[%l7 + 0x30],	%o2
	movrlz	%o3,	0x164,	%i4
	sllx	%o5,	%o4,	%i5
	fmuld8sux16	%f17,	%f3,	%f6
	alignaddrl	%g7,	%i7,	%g1
	orcc	%g6,	0x1EED,	%g5
	fmovsvc	%xcc,	%f14,	%f26
	fmul8ulx16	%f0,	%f0,	%f8
	restore %o6, 0x154C, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i1,	0x0373,	%i0
	addccc	%l6,	%l5,	%o7
	sllx	%i3,	%l3,	%o0
	ldx	[%l7 + 0x68],	%l4
	sir	0x0EBE
	fands	%f20,	%f6,	%f0
	srlx	%g2,	%i2,	%l1
	subc	%l0,	0x07B8,	%g4
	xorcc	%i6,	%l2,	%o2
	ldd	[%l7 + 0x50],	%o2
	sethi	0x112C,	%i4
	movgu	%icc,	%g3,	%o4
	alignaddrl	%o5,	%g7,	%i7
	xorcc	%i5,	%g6,	%g5
	sdivcc	%o6,	0x0F22,	%o1
	mova	%xcc,	%g1,	%i0
	edge32l	%l6,	%l5,	%o7
	array8	%i1,	%i3,	%o0
	and	%l3,	0x1FE1,	%l4
	movcs	%icc,	%i2,	%l1
	sth	%g2,	[%l7 + 0x66]
	stw	%l0,	[%l7 + 0x58]
	udivcc	%g4,	0x1E7C,	%i6
	orncc	%o2,	%l2,	%o3
	movl	%icc,	%i4,	%g3
	sdivcc	%o4,	0x0684,	%g7
	fmovdneg	%xcc,	%f31,	%f26
	movl	%icc,	%o5,	%i5
	fmovsneg	%icc,	%f6,	%f27
	fnot2	%f2,	%f24
	smul	%i7,	%g5,	%g6
	siam	0x0
	edge8ln	%o1,	%g1,	%i0
	movne	%xcc,	%l6,	%l5
	subccc	%o7,	0x0252,	%o6
	movg	%xcc,	%i3,	%i1
	udivx	%l3,	0x080D,	%l4
	lduw	[%l7 + 0x44],	%o0
	umulcc	%i2,	0x0E4E,	%l1
	edge8	%g2,	%g4,	%l0
	save %i6, %l2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i4,	%g3,	%o2
	fones	%f0
	sethi	0x042B,	%g7
	st	%f22,	[%l7 + 0x60]
	fnot1s	%f9,	%f11
	fexpand	%f9,	%f0
	sth	%o4,	[%l7 + 0x4E]
	movle	%icc,	%i5,	%o5
	array16	%i7,	%g5,	%o1
	addc	%g6,	%g1,	%l6
	nop
	set	0x18, %o2
	ldd	[%l7 + %o2],	%l4
	movcc	%icc,	%i0,	%o7
	subc	%o6,	0x174E,	%i1
	srax	%i3,	0x13,	%l4
	edge8l	%o0,	%l3,	%l1
	fmovdn	%icc,	%f21,	%f10
	sub	%i2,	0x0D31,	%g2
	srlx	%g4,	%i6,	%l0
	ldd	[%l7 + 0x28],	%o2
	edge32ln	%l2,	%g3,	%i4
	fcmpd	%fcc3,	%f24,	%f22
	fand	%f20,	%f28,	%f24
	fmovrdne	%o2,	%f18,	%f26
	xor	%o4,	%g7,	%i5
	mulscc	%i7,	%o5,	%g5
	xnor	%g6,	0x03DE,	%o1
	alignaddr	%g1,	%l6,	%i0
	ldsb	[%l7 + 0x7B],	%l5
	edge8	%o7,	%o6,	%i1
	movrlz	%i3,	0x31B,	%l4
	udivx	%o0,	0x1E64,	%l3
	movvc	%xcc,	%i2,	%l1
	fmovrslz	%g2,	%f30,	%f30
	sub	%g4,	%l0,	%o3
	movcc	%xcc,	%i6,	%g3
	fmovdcc	%icc,	%f31,	%f6
	fnot2	%f2,	%f22
	movg	%xcc,	%l2,	%o2
	array8	%o4,	%i4,	%g7
	edge16	%i7,	%o5,	%g5
	addccc	%i5,	%o1,	%g6
	mova	%icc,	%l6,	%g1
	umulcc	%l5,	%o7,	%o6
	std	%f4,	[%l7 + 0x68]
	move	%xcc,	%i0,	%i3
	alignaddr	%i1,	%o0,	%l4
	srax	%l3,	%i2,	%g2
	movre	%l1,	0x341,	%g4
	srax	%o3,	%i6,	%l0
	fnand	%f20,	%f4,	%f8
	stb	%l2,	[%l7 + 0x4C]
	movvs	%icc,	%o2,	%g3
	ldx	[%l7 + 0x18],	%o4
	bshuffle	%f0,	%f18,	%f6
	edge16	%g7,	%i4,	%i7
	edge8ln	%g5,	%i5,	%o5
	edge16	%g6,	%l6,	%g1
	xnorcc	%l5,	%o7,	%o6
	ldsh	[%l7 + 0x7C],	%i0
	movvs	%xcc,	%o1,	%i1
	alignaddrl	%o0,	%l4,	%l3
	ldd	[%l7 + 0x08],	%i2
	subcc	%i2,	0x16A1,	%l1
	fcmple16	%f14,	%f2,	%g2
	movvc	%xcc,	%o3,	%i6
	fabss	%f22,	%f6
	fpsub32s	%f12,	%f5,	%f20
	mulx	%l0,	%l2,	%o2
	fands	%f20,	%f7,	%f15
	movle	%xcc,	%g3,	%o4
	edge16l	%g7,	%g4,	%i4
	xnorcc	%g5,	%i7,	%i5
	movg	%xcc,	%o5,	%g6
	edge32ln	%l6,	%g1,	%l5
	edge32l	%o6,	%i0,	%o1
	edge8l	%o7,	%i1,	%o0
	array8	%l4,	%l3,	%i3
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	mulscc	%o3,	%g2,	%l0
	sll	%i6,	%o2,	%l2
	sir	0x093C
	fmovscc	%xcc,	%f12,	%f12
	add	%o4,	%g3,	%g7
	alignaddrl	%g4,	%i4,	%i7
	movle	%icc,	%i5,	%o5
	mova	%xcc,	%g5,	%l6
	smulcc	%g1,	0x0918,	%g6
	subcc	%l5,	0x14EC,	%o6
	fmovsge	%icc,	%f20,	%f24
	ldsw	[%l7 + 0x58],	%i0
	andcc	%o7,	0x00B6,	%i1
	std	%f24,	[%l7 + 0x60]
	andncc	%o0,	%o1,	%l3
	andn	%i3,	%l1,	%i2
	st	%f28,	[%l7 + 0x68]
	ldd	[%l7 + 0x38],	%f24
	fpmerge	%f1,	%f2,	%f2
	fcmpes	%fcc0,	%f18,	%f16
	smul	%l4,	0x1AFB,	%o3
	sra	%l0,	0x1E,	%g2
	fmovsle	%icc,	%f24,	%f8
	umulcc	%i6,	0x174F,	%o2
	lduh	[%l7 + 0x56],	%o4
	edge8n	%l2,	%g3,	%g4
	ldsb	[%l7 + 0x5E],	%i4
	subcc	%i7,	%i5,	%g7
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%o4
	mulx	%g5,	0x1018,	%l6
	sethi	0x0F4E,	%g6
	mulscc	%l5,	0x019C,	%o6
	fmovrsgez	%i0,	%f6,	%f8
	fmul8x16al	%f6,	%f26,	%f18
	fmovsneg	%xcc,	%f1,	%f13
	fabsd	%f6,	%f26
	fmovsge	%icc,	%f18,	%f21
	fcmpeq16	%f24,	%f12,	%o7
	movleu	%icc,	%i1,	%o0
	ldsb	[%l7 + 0x17],	%o1
	or	%g1,	0x023D,	%i3
	stw	%l1,	[%l7 + 0x5C]
	stw	%l3,	[%l7 + 0x1C]
	udivcc	%l4,	0x04A9,	%i2
	smul	%l0,	0x05AC,	%o3
	stw	%g2,	[%l7 + 0x54]
	edge16	%o2,	%i6,	%o4
	subcc	%l2,	0x099C,	%g3
	lduw	[%l7 + 0x50],	%i4
	movle	%icc,	%g4,	%i5
	movvc	%icc,	%g7,	%o5
	movcs	%xcc,	%i7,	%l6
	lduw	[%l7 + 0x6C],	%g5
	sub	%g6,	%o6,	%l5
	ldub	[%l7 + 0x26],	%o7
	fmovdl	%icc,	%f31,	%f1
	fcmpeq32	%f12,	%f8,	%i0
	sdiv	%i1,	0x04E3,	%o1
	sth	%g1,	[%l7 + 0x78]
	xnor	%o0,	0x01AB,	%l1
	sll	%i3,	%l3,	%l4
	nop
	set	0x62, %g7
	lduh	[%l7 + %g7],	%i2
	movleu	%xcc,	%o3,	%l0
	srlx	%g2,	%o2,	%i6
	ldsb	[%l7 + 0x5E],	%l2
	fnegs	%f6,	%f26
	orcc	%o4,	0x1EB7,	%g3
	movrlez	%g4,	0x0DA,	%i4
	fone	%f8
	xnorcc	%g7,	0x1A15,	%o5
	movn	%icc,	%i5,	%l6
	subc	%g5,	%i7,	%o6
	fmovspos	%xcc,	%f5,	%f9
	sll	%g6,	%l5,	%o7
	fmovrdlez	%i0,	%f14,	%f24
	movrgz	%i1,	0x112,	%o1
	movre	%o0,	0x19F,	%g1
	fpadd16	%f6,	%f24,	%f22
	sra	%l1,	0x0A,	%l3
	fxor	%f6,	%f10,	%f16
	fcmps	%fcc3,	%f18,	%f16
	ldub	[%l7 + 0x2F],	%l4
	fmovdvc	%icc,	%f7,	%f23
	movn	%xcc,	%i3,	%i2
	edge8l	%o3,	%g2,	%o2
	umul	%i6,	0x128B,	%l2
	movrne	%o4,	%l0,	%g4
	sth	%i4,	[%l7 + 0x3C]
	movl	%icc,	%g3,	%o5
	movrgez	%g7,	0x046,	%i5
	xorcc	%l6,	0x128A,	%i7
	subccc	%g5,	0x0388,	%o6
	fsrc1	%f6,	%f18
	movne	%icc,	%g6,	%o7
	edge32n	%l5,	%i1,	%o1
	ldub	[%l7 + 0x37],	%i0
	movne	%xcc,	%o0,	%g1
	xor	%l3,	0x0B8C,	%l4
	movrgz	%i3,	0x288,	%i2
	fcmpne32	%f2,	%f6,	%l1
	add	%o3,	0x1057,	%o2
	xnor	%g2,	%i6,	%l2
	addc	%o4,	0x0369,	%l0
	edge16l	%g4,	%g3,	%i4
	movcc	%xcc,	%g7,	%i5
	edge32ln	%l6,	%i7,	%o5
	and	%o6,	%g5,	%g6
	fcmple32	%f20,	%f16,	%o7
	edge16n	%i1,	%l5,	%i0
	orn	%o1,	0x08A3,	%o0
	popc	%l3,	%l4
	sdiv	%g1,	0x1881,	%i2
	array32	%l1,	%i3,	%o2
	orncc	%o3,	%g2,	%i6
	andncc	%l2,	%l0,	%g4
	movgu	%icc,	%o4,	%g3
	srl	%i4,	%i5,	%l6
	edge8l	%g7,	%i7,	%o6
	alignaddr	%g5,	%g6,	%o7
	nop
	set	0x2A, %g5
	lduh	[%l7 + %g5],	%o5
	movvc	%icc,	%i1,	%l5
	and	%i0,	%o0,	%l3
	fornot1	%f16,	%f28,	%f4
	fpsub32s	%f23,	%f15,	%f6
	movvc	%xcc,	%l4,	%o1
	array16	%i2,	%g1,	%i3
	fmovrde	%l1,	%f10,	%f4
	edge32	%o3,	%o2,	%g2
	and	%i6,	0x00CF,	%l2
	fmovscs	%xcc,	%f1,	%f28
	movpos	%icc,	%l0,	%g4
	sra	%g3,	%o4,	%i5
	fornot2	%f24,	%f10,	%f18
	edge16	%i4,	%l6,	%i7
	sdiv	%g7,	0x15BE,	%o6
	popc	%g5,	%o7
	add	%g6,	0x1EA0,	%o5
	sdivcc	%l5,	0x0E7A,	%i0
	fmovrdgez	%o0,	%f12,	%f20
	movrlez	%l3,	%l4,	%i1
	ldsb	[%l7 + 0x3B],	%i2
	xnor	%o1,	%g1,	%i3
	ldsw	[%l7 + 0x58],	%o3
	xorcc	%o2,	%l1,	%i6
	sub	%g2,	0x11EC,	%l0
	subc	%g4,	0x1912,	%l2
	movl	%xcc,	%g3,	%o4
	edge8	%i5,	%l6,	%i7
	mova	%xcc,	%g7,	%i4
	orncc	%g5,	%o7,	%g6
	fmovdgu	%xcc,	%f7,	%f26
	edge8	%o6,	%o5,	%l5
	add	%i0,	0x1927,	%o0
	fpadd16	%f8,	%f16,	%f22
	addcc	%l4,	%i1,	%l3
	movrne	%i2,	%o1,	%i3
	alignaddrl	%o3,	%o2,	%l1
	edge32ln	%g1,	%i6,	%g2
	movrlz	%g4,	%l2,	%l0
	fmovrslez	%g3,	%f30,	%f28
	movcs	%icc,	%o4,	%i5
	movcc	%icc,	%i7,	%l6
	movcs	%xcc,	%g7,	%i4
	popc	%o7,	%g6
	sir	0x05B9
	fmuld8ulx16	%f14,	%f6,	%f30
	movne	%xcc,	%o6,	%o5
	ldx	[%l7 + 0x10],	%g5
	subcc	%i0,	%o0,	%l5
	movcc	%xcc,	%l4,	%i1
	movpos	%icc,	%l3,	%i2
	movre	%o1,	0x01E,	%i3
	edge32ln	%o2,	%o3,	%g1
	ldsb	[%l7 + 0x57],	%i6
	movleu	%icc,	%g2,	%l1
	orcc	%l2,	0x145F,	%g4
	edge32ln	%g3,	%l0,	%o4
	xor	%i7,	%i5,	%l6
	lduw	[%l7 + 0x68],	%i4
	fmul8x16al	%f2,	%f1,	%f28
	save %g7, 0x1330, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%icc,	%f17,	%f23
	edge32l	%o6,	%g6,	%o5
	popc	%i0,	%g5
	xnor	%o0,	0x0293,	%l4
	edge32	%l5,	%l3,	%i2
	stb	%o1,	[%l7 + 0x6B]
	sethi	0x17BC,	%i1
	orcc	%i3,	0x04D3,	%o2
	add	%g1,	0x0B3C,	%o3
	sdiv	%i6,	0x120E,	%g2
	fandnot1s	%f11,	%f26,	%f4
	alignaddr	%l1,	%g4,	%g3
	fandnot2s	%f26,	%f7,	%f25
	movre	%l0,	0x161,	%l2
	sub	%o4,	0x0BCE,	%i5
	smulcc	%i7,	0x1F94,	%l6
	fmovrdlz	%g7,	%f10,	%f14
	fmovrdlz	%i4,	%f12,	%f30
	subcc	%o6,	0x07AE,	%o7
	std	%f2,	[%l7 + 0x28]
	fnot2s	%f15,	%f5
	fpadd32	%f16,	%f0,	%f4
	orn	%g6,	0x1687,	%i0
	sth	%o5,	[%l7 + 0x12]
	movpos	%xcc,	%g5,	%l4
	fornot1s	%f9,	%f28,	%f18
	array32	%o0,	%l5,	%i2
	stb	%l3,	[%l7 + 0x52]
	fmovsleu	%icc,	%f7,	%f2
	array8	%o1,	%i3,	%i1
	subccc	%o2,	%o3,	%i6
	sir	0x1305
	stx	%g1,	[%l7 + 0x30]
	sra	%g2,	%l1,	%g3
	st	%f31,	[%l7 + 0x70]
	edge16ln	%l0,	%g4,	%o4
	fmovdgu	%xcc,	%f8,	%f21
	addccc	%i5,	%l2,	%i7
	sir	0x180A
	std	%f18,	[%l7 + 0x78]
	fpadd16	%f14,	%f12,	%f2
	fmovrslez	%g7,	%f30,	%f27
	edge32	%i4,	%o6,	%l6
	sub	%o7,	%g6,	%o5
	orn	%g5,	%l4,	%o0
	fpsub32s	%f19,	%f25,	%f22
	movrne	%i0,	%l5,	%i2
	srax	%o1,	0x0F,	%i3
	ldsw	[%l7 + 0x7C],	%l3
	array8	%o2,	%i1,	%o3
	sra	%g1,	0x1F,	%g2
	fmovdn	%xcc,	%f13,	%f27
	save %i6, 0x155B, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%l0,	%f18,	%f9
	fmovs	%f0,	%f25
	srax	%g4,	%g3,	%i5
	movg	%icc,	%o4,	%i7
	restore %g7, %l2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l6,	0x0C48,	%o7
	ldd	[%l7 + 0x50],	%f14
	movrgz	%i4,	%g6,	%g5
	fpack32	%f26,	%f26,	%f26
	andcc	%o5,	%l4,	%o0
	ldd	[%l7 + 0x60],	%l4
	ldub	[%l7 + 0x4D],	%i0
	mulx	%i2,	%o1,	%i3
	fpmerge	%f30,	%f4,	%f4
	fornot1	%f0,	%f16,	%f28
	fmovrdne	%o2,	%f8,	%f8
	fnot1	%f8,	%f14
	edge32ln	%l3,	%o3,	%i1
	fmovdneg	%xcc,	%f3,	%f19
	fzeros	%f1
	movrgez	%g2,	%i6,	%g1
	umul	%l1,	%l0,	%g4
	fxors	%f0,	%f2,	%f24
	xorcc	%i5,	%o4,	%i7
	orncc	%g7,	%g3,	%l2
	edge32ln	%o6,	%o7,	%i4
	and	%g6,	0x1734,	%l6
	edge16l	%g5,	%l4,	%o0
	fpsub16	%f16,	%f20,	%f20
	orn	%l5,	0x1911,	%i0
	mova	%xcc,	%i2,	%o1
	popc	0x1263,	%o5
	fzero	%f26
	stw	%i3,	[%l7 + 0x5C]
	edge16l	%l3,	%o3,	%o2
	movleu	%icc,	%i1,	%i6
	ldub	[%l7 + 0x73],	%g1
	fcmpeq32	%f8,	%f0,	%l1
	mova	%xcc,	%l0,	%g2
	fcmpes	%fcc2,	%f21,	%f25
	udivx	%i5,	0x1A64,	%o4
	save %g4, 0x0DB7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g7,	%l2
	fmovdpos	%icc,	%f20,	%f3
	fmovsl	%xcc,	%f19,	%f6
	movleu	%icc,	%g3,	%o7
	fcmpeq16	%f22,	%f6,	%o6
	addc	%g6,	0x1899,	%l6
	sub	%i4,	0x1203,	%l4
	fpsub32s	%f27,	%f28,	%f21
	fcmps	%fcc0,	%f27,	%f16
	fpack16	%f8,	%f12
	movne	%icc,	%g5,	%l5
	addcc	%o0,	%i2,	%i0
	fcmpgt32	%f0,	%f8,	%o5
	movvc	%icc,	%o1,	%i3
	fmovsa	%icc,	%f22,	%f2
	edge32n	%l3,	%o2,	%o3
	fmovsl	%xcc,	%f8,	%f20
	and	%i6,	0x1EAB,	%g1
	ldd	[%l7 + 0x68],	%l0
	save %l0, %i1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o4,	%i5
	array32	%g4,	%g7,	%i7
	subcc	%g3,	%o7,	%l2
	mulx	%o6,	%g6,	%l6
	mulx	%l4,	0x04E6,	%i4
	fmovse	%xcc,	%f2,	%f13
	fmovsleu	%xcc,	%f25,	%f14
	movcc	%xcc,	%g5,	%o0
	mulscc	%l5,	%i0,	%i2
	fandnot2s	%f2,	%f25,	%f2
	array32	%o1,	%i3,	%o5
	movneg	%icc,	%o2,	%l3
	orncc	%o3,	0x0CF7,	%i6
	ldd	[%l7 + 0x68],	%f10
	lduw	[%l7 + 0x54],	%g1
	movleu	%icc,	%l0,	%l1
	sethi	0x13B2,	%g2
	edge8ln	%o4,	%i5,	%g4
	udivx	%g7,	0x1DB5,	%i1
	movrgz	%i7,	0x326,	%o7
	movrgz	%g3,	%l2,	%o6
	save %g6, 0x0A80, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l6,	[%l7 + 0x2C]
	fmovrdlz	%g5,	%f6,	%f10
	ldsb	[%l7 + 0x29],	%o0
	ldd	[%l7 + 0x28],	%l4
	edge8l	%i0,	%i4,	%o1
	popc	0x016D,	%i2
	udivcc	%i3,	0x0CD8,	%o2
	subccc	%o5,	%l3,	%i6
	fxnor	%f6,	%f2,	%f8
	and	%g1,	0x1BE3,	%l0
	alignaddrl	%l1,	%g2,	%o3
	udivcc	%o4,	0x0836,	%i5
	ldub	[%l7 + 0x49],	%g7
	st	%f27,	[%l7 + 0x7C]
	edge32ln	%g4,	%i7,	%i1
	fornot1	%f2,	%f4,	%f8
	sethi	0x0DB0,	%g3
	addc	%l2,	0x093F,	%o6
	lduh	[%l7 + 0x7A],	%g6
	movneg	%icc,	%o7,	%l4
	srax	%l6,	%g5,	%l5
	fpadd16s	%f2,	%f6,	%f29
	sethi	0x01F0,	%o0
	fmovs	%f27,	%f0
	nop
	set	0x38, %g2
	ldsh	[%l7 + %g2],	%i0
	movgu	%xcc,	%i4,	%o1
	fmovdleu	%icc,	%f3,	%f17
	fxor	%f18,	%f16,	%f18
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	ld	[%l7 + 0x38],	%f5
	fmovde	%icc,	%f20,	%f22
	movneg	%xcc,	%o2,	%o5
	fmovspos	%icc,	%f20,	%f13
	sub	%i6,	%l3,	%l0
	srax	%g1,	0x16,	%l1
	fmovscc	%xcc,	%f10,	%f25
	popc	0x130A,	%o3
	edge8	%o4,	%g2,	%i5
	smul	%g7,	%i7,	%i1
	addccc	%g3,	%l2,	%g4
	ldx	[%l7 + 0x10],	%g6
	array32	%o7,	%l4,	%o6
	ldub	[%l7 + 0x5C],	%g5
	subc	%l5,	0x03CC,	%o0
	fandnot2	%f26,	%f16,	%f26
	ldd	[%l7 + 0x18],	%i6
	ldx	[%l7 + 0x50],	%i0
	addc	%i4,	0x0161,	%i2
	ldd	[%l7 + 0x60],	%i2
	std	%f6,	[%l7 + 0x38]
	addccc	%o2,	%o1,	%o5
	fxor	%f8,	%f30,	%f14
	fmul8x16au	%f17,	%f31,	%f14
	movcs	%icc,	%i6,	%l0
	fcmpgt32	%f4,	%f30,	%l3
	fmovdne	%icc,	%f1,	%f29
	edge32n	%l1,	%g1,	%o3
	movrne	%g2,	%o4,	%i5
	movrlez	%i7,	%i1,	%g3
	sllx	%l2,	%g7,	%g6
	fmovse	%xcc,	%f22,	%f7
	udivcc	%o7,	0x1153,	%l4
	sir	0x1F46
	ldsb	[%l7 + 0x3C],	%g4
	fmovdne	%icc,	%f3,	%f31
	lduh	[%l7 + 0x66],	%o6
	edge32ln	%g5,	%o0,	%l6
	andncc	%i0,	%i4,	%i2
	udivcc	%i3,	0x03F2,	%o2
	sethi	0x1B98,	%l5
	ldd	[%l7 + 0x08],	%f4
	edge16n	%o5,	%o1,	%i6
	sllx	%l0,	%l1,	%l3
	edge16l	%g1,	%o3,	%g2
	popc	%i5,	%i7
	fmovdne	%icc,	%f12,	%f17
	sdiv	%i1,	0x007F,	%g3
	edge8l	%l2,	%o4,	%g7
	st	%f23,	[%l7 + 0x48]
	edge16n	%o7,	%g6,	%g4
	movcs	%xcc,	%o6,	%g5
	orcc	%l4,	0x113E,	%o0
	lduh	[%l7 + 0x18],	%i0
	fnands	%f3,	%f8,	%f18
	movleu	%icc,	%i4,	%l6
	array16	%i2,	%o2,	%i3
	fmovdne	%xcc,	%f23,	%f17
	fsrc2	%f14,	%f0
	sllx	%o5,	0x00,	%o1
	orn	%l5,	%i6,	%l1
	fmovda	%icc,	%f2,	%f7
	umul	%l0,	%l3,	%o3
	udivx	%g1,	0x1B3E,	%g2
	fnegs	%f23,	%f22
	and	%i5,	0x180E,	%i7
	fmovdleu	%icc,	%f29,	%f15
	srl	%g3,	%l2,	%i1
	edge32ln	%o4,	%o7,	%g6
	array16	%g7,	%g4,	%o6
	andncc	%g5,	%o0,	%l4
	addc	%i4,	%i0,	%l6
	edge32l	%i2,	%o2,	%o5
	movrgez	%o1,	0x082,	%l5
	smul	%i6,	%i3,	%l0
	faligndata	%f0,	%f2,	%f14
	edge32l	%l1,	%l3,	%o3
	fpadd32s	%f31,	%f6,	%f6
	fpmerge	%f25,	%f14,	%f18
	xorcc	%g1,	%i5,	%g2
	edge32l	%g3,	%l2,	%i1
	ldd	[%l7 + 0x20],	%f16
	orn	%o4,	0x05B6,	%i7
	movn	%icc,	%o7,	%g7
	save %g4, %o6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o0,	0x1012,	%l4
	edge16l	%i4,	%g6,	%l6
	lduh	[%l7 + 0x3E],	%i0
	subccc	%i2,	0x1A3E,	%o5
	edge8	%o1,	%l5,	%o2
	std	%f24,	[%l7 + 0x20]
	umul	%i6,	0x11B8,	%l0
	restore %l1, 0x1361, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i3,	%o3,	%g1
	mova	%icc,	%i5,	%g3
	movg	%icc,	%l2,	%i1
	edge16l	%g2,	%o4,	%i7
	smulcc	%o7,	%g4,	%g7
	mulx	%g5,	%o6,	%l4
	array16	%i4,	%g6,	%o0
	udivcc	%l6,	0x1827,	%i0
	or	%o5,	0x1D22,	%i2
	move	%xcc,	%l5,	%o2
	sra	%o1,	%i6,	%l0
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	ldsw	[%l7 + 0x3C],	%o3
	edge8ln	%i3,	%i5,	%g1
	movle	%icc,	%l2,	%g3
	std	%f20,	[%l7 + 0x58]
	addc	%g2,	%i1,	%o4
	add	%i7,	0x0C1B,	%o7
	movcc	%icc,	%g4,	%g7
	fmovrsgez	%g5,	%f3,	%f0
	fmovrsgz	%l4,	%f7,	%f10
	movneg	%xcc,	%i4,	%o6
	movvs	%icc,	%g6,	%o0
	ldsb	[%l7 + 0x58],	%i0
	movpos	%xcc,	%l6,	%i2
	subccc	%l5,	0x10DE,	%o5
	fmovs	%f1,	%f3
	fmul8x16al	%f21,	%f15,	%f16
	movvc	%xcc,	%o2,	%i6
	addcc	%l0,	0x0662,	%o1
	fmovse	%xcc,	%f8,	%f24
	mova	%xcc,	%l1,	%l3
	fmovrdlz	%i3,	%f4,	%f12
	sra	%i5,	0x00,	%g1
	fmovdleu	%xcc,	%f4,	%f11
	mulscc	%o3,	0x0D18,	%g3
	sth	%g2,	[%l7 + 0x18]
	addcc	%l2,	%o4,	%i7
	lduh	[%l7 + 0x6A],	%i1
	movleu	%icc,	%g4,	%g7
	movrlz	%g5,	0x0B6,	%o7
	sir	0x1A12
	udiv	%l4,	0x073B,	%o6
	movpos	%xcc,	%i4,	%o0
	movrgz	%i0,	0x33F,	%l6
	st	%f5,	[%l7 + 0x48]
	add	%g6,	0x19D4,	%l5
	ldx	[%l7 + 0x38],	%o5
	fexpand	%f26,	%f14
	ldd	[%l7 + 0x40],	%f16
	sdivx	%o2,	0x0748,	%i2
	movl	%icc,	%i6,	%o1
	ldub	[%l7 + 0x28],	%l1
	edge16l	%l3,	%i3,	%i5
	movrlez	%l0,	0x1CE,	%o3
	move	%icc,	%g1,	%g2
	movl	%icc,	%g3,	%l2
	edge8ln	%o4,	%i1,	%g4
	std	%f30,	[%l7 + 0x18]
	lduw	[%l7 + 0x18],	%g7
	movrgz	%i7,	0x0FC,	%o7
	edge16	%g5,	%o6,	%i4
	siam	0x5
	movge	%xcc,	%l4,	%o0
	sethi	0x19C7,	%l6
	subc	%g6,	0x0A54,	%l5
	ldd	[%l7 + 0x48],	%i0
	xnor	%o2,	%i2,	%i6
	udiv	%o1,	0x14B7,	%l1
	movle	%icc,	%l3,	%o5
	sth	%i3,	[%l7 + 0x16]
	fnot2	%f28,	%f6
	move	%xcc,	%l0,	%i5
	xnorcc	%g1,	%g2,	%g3
	udiv	%o3,	0x1E61,	%l2
	sth	%o4,	[%l7 + 0x28]
	umulcc	%i1,	0x01A8,	%g7
	movgu	%icc,	%g4,	%i7
	sth	%o7,	[%l7 + 0x36]
	std	%f24,	[%l7 + 0x38]
	movleu	%icc,	%g5,	%o6
	edge8	%i4,	%o0,	%l4
	fmul8sux16	%f0,	%f26,	%f8
	sdivx	%g6,	0x161B,	%l6
	lduw	[%l7 + 0x58],	%i0
	movleu	%xcc,	%l5,	%o2
	movvc	%xcc,	%i2,	%o1
	fmuld8sux16	%f19,	%f23,	%f24
	fmovrdgez	%i6,	%f22,	%f2
	lduw	[%l7 + 0x4C],	%l3
	srlx	%l1,	%o5,	%l0
	srlx	%i5,	0x18,	%g1
	addc	%i3,	0x03C1,	%g3
	movl	%icc,	%o3,	%l2
	srl	%o4,	0x01,	%i1
	orcc	%g7,	%g4,	%i7
	fmovsa	%icc,	%f25,	%f25
	edge16ln	%g2,	%g5,	%o7
	fmovsl	%icc,	%f30,	%f13
	orn	%i4,	0x06F1,	%o6
	popc	%l4,	%g6
	sdivx	%l6,	0x088C,	%i0
	movn	%icc,	%l5,	%o0
	orn	%o2,	0x1F64,	%o1
	stw	%i6,	[%l7 + 0x1C]
	edge16n	%l3,	%i2,	%o5
	nop
	set	0x74, %i0
	lduw	[%l7 + %i0],	%l1
	xnorcc	%l0,	%g1,	%i3
	nop
	set	0x40, %o3
	ldd	[%l7 + %o3],	%f0
	sra	%i5,	%g3,	%o3
	fands	%f9,	%f5,	%f12
	movrne	%l2,	0x0E0,	%i1
	edge16n	%g7,	%o4,	%i7
	sir	0x0DF0
	fmuld8sux16	%f28,	%f9,	%f26
	edge32n	%g2,	%g4,	%g5
	movne	%icc,	%o7,	%i4
	srl	%o6,	%g6,	%l4
	stb	%i0,	[%l7 + 0x59]
	fnegs	%f29,	%f3
	movrlez	%l6,	0x2E0,	%l5
	edge32	%o0,	%o1,	%o2
	fmuld8sux16	%f8,	%f6,	%f16
	fmovdn	%icc,	%f3,	%f5
	movgu	%xcc,	%l3,	%i6
	fandnot2	%f30,	%f28,	%f22
	fpsub32s	%f16,	%f3,	%f28
	fandnot1	%f8,	%f18,	%f28
	fnor	%f24,	%f6,	%f22
	fmovrse	%o5,	%f15,	%f31
	st	%f10,	[%l7 + 0x14]
	mulx	%i2,	%l1,	%l0
	orn	%i3,	%g1,	%g3
	andcc	%i5,	%o3,	%i1
	fones	%f30
	fpmerge	%f1,	%f20,	%f20
	sth	%l2,	[%l7 + 0x54]
	ldd	[%l7 + 0x68],	%f4
	subc	%o4,	0x04A1,	%i7
	smulcc	%g7,	0x1002,	%g2
	fnands	%f27,	%f24,	%f24
	fcmpes	%fcc3,	%f22,	%f11
	smulcc	%g5,	0x1EC5,	%o7
	ldsw	[%l7 + 0x70],	%i4
	sth	%o6,	[%l7 + 0x4A]
	edge8ln	%g6,	%g4,	%i0
	movrlz	%l6,	%l4,	%l5
	edge16ln	%o1,	%o0,	%l3
	nop
	set	0x0C, %g3
	lduw	[%l7 + %g3],	%o2
	fcmpgt16	%f28,	%f26,	%o5
	fzero	%f26
	fmovdvc	%xcc,	%f3,	%f4
	movvc	%icc,	%i2,	%l1
	fandnot1s	%f1,	%f5,	%f7
	movn	%xcc,	%i6,	%i3
	pdist	%f16,	%f20,	%f6
	fxor	%f0,	%f12,	%f4
	movrlez	%g1,	%g3,	%l0
	movg	%xcc,	%o3,	%i1
	movpos	%xcc,	%i5,	%l2
	lduw	[%l7 + 0x4C],	%o4
	alignaddr	%i7,	%g7,	%g2
	movrgz	%g5,	%o7,	%o6
	movg	%xcc,	%g6,	%i4
	sethi	0x03AD,	%i0
	nop
	set	0x60, %i3
	ldsw	[%l7 + %i3],	%g4
	fmul8x16al	%f1,	%f27,	%f4
	xor	%l6,	0x1C4D,	%l4
	orncc	%l5,	%o1,	%l3
	sth	%o0,	[%l7 + 0x4E]
	edge32	%o2,	%o5,	%l1
	sir	0x0A78
	movneg	%xcc,	%i2,	%i6
	sth	%g1,	[%l7 + 0x7A]
	movneg	%icc,	%i3,	%g3
	stw	%o3,	[%l7 + 0x78]
	movge	%icc,	%l0,	%i5
	addccc	%i1,	0x0FF7,	%o4
	movneg	%xcc,	%l2,	%g7
	sir	0x15BB
	array32	%i7,	%g2,	%g5
	fmovdgu	%xcc,	%f16,	%f31
	movre	%o6,	0x02D,	%g6
	xorcc	%i4,	%o7,	%i0
	stb	%l6,	[%l7 + 0x4A]
	fmovdle	%xcc,	%f5,	%f9
	sth	%l4,	[%l7 + 0x58]
	ldd	[%l7 + 0x10],	%g4
	andn	%o1,	0x1B46,	%l3
	lduh	[%l7 + 0x30],	%o0
	std	%f16,	[%l7 + 0x58]
	edge16n	%o2,	%l5,	%o5
	andn	%i2,	%i6,	%g1
	movn	%xcc,	%l1,	%g3
	sdivcc	%i3,	0x18E8,	%o3
	array32	%i5,	%i1,	%o4
	addcc	%l2,	0x0A04,	%l0
	fandnot2s	%f21,	%f9,	%f30
	mulx	%g7,	%g2,	%g5
	movrlez	%o6,	%i7,	%i4
	movg	%xcc,	%g6,	%i0
	stx	%l6,	[%l7 + 0x48]
	movleu	%xcc,	%l4,	%g4
	fands	%f5,	%f19,	%f4
	ldd	[%l7 + 0x40],	%f26
	edge16l	%o7,	%o1,	%o0
	add	%l3,	0x1C27,	%l5
	addccc	%o5,	%o2,	%i6
	fmovrde	%g1,	%f16,	%f18
	fabss	%f22,	%f10
	and	%l1,	%g3,	%i2
	fones	%f23
	movrgez	%o3,	0x3B6,	%i3
	sdivcc	%i1,	0x1AFB,	%o4
	movl	%xcc,	%l2,	%i5
	movrlez	%g7,	%g2,	%l0
	fmovda	%xcc,	%f18,	%f1
	udiv	%o6,	0x00A3,	%i7
	ldsb	[%l7 + 0x0F],	%i4
	fmovdg	%icc,	%f24,	%f13
	movcc	%icc,	%g5,	%i0
	movne	%xcc,	%l6,	%l4
	srl	%g4,	0x0B,	%o7
	edge8l	%g6,	%o0,	%o1
	fsrc1s	%f9,	%f0
	orncc	%l3,	0x063C,	%l5
	fcmpne32	%f12,	%f18,	%o2
	andncc	%i6,	%o5,	%l1
	edge8	%g3,	%g1,	%i2
	sdivx	%i3,	0x0399,	%i1
	addc	%o4,	%o3,	%l2
	fmovdvc	%xcc,	%f30,	%f10
	movcs	%xcc,	%g7,	%i5
	fnand	%f4,	%f12,	%f28
	movvs	%icc,	%l0,	%g2
	array32	%o6,	%i4,	%i7
	fmovdneg	%icc,	%f18,	%f20
	fpsub32	%f30,	%f14,	%f24
	movcc	%icc,	%g5,	%l6
	fmovsgu	%icc,	%f17,	%f28
	movrgz	%i0,	0x163,	%l4
	edge16l	%g4,	%g6,	%o7
	sllx	%o1,	0x0B,	%l3
	ldx	[%l7 + 0x08],	%l5
	movvs	%icc,	%o0,	%i6
	stx	%o2,	[%l7 + 0x60]
	ldsh	[%l7 + 0x4C],	%o5
	fcmpes	%fcc0,	%f3,	%f26
	std	%f0,	[%l7 + 0x50]
	movrlz	%g3,	0x10F,	%l1
	edge16l	%i2,	%g1,	%i1
	sdivx	%o4,	0x1958,	%o3
	stx	%l2,	[%l7 + 0x70]
	sdiv	%i3,	0x0222,	%i5
	movgu	%xcc,	%l0,	%g7
	ldsb	[%l7 + 0x70],	%o6
	edge16ln	%g2,	%i7,	%g5
	fcmpgt32	%f14,	%f24,	%l6
	ldd	[%l7 + 0x38],	%i4
	movvc	%icc,	%l4,	%i0
	lduw	[%l7 + 0x20],	%g4
	ldub	[%l7 + 0x68],	%g6
	move	%xcc,	%o7,	%l3
	fpsub32	%f24,	%f4,	%f12
	fmul8x16au	%f8,	%f7,	%f10
	fmovsne	%xcc,	%f24,	%f16
	restore %o1, 0x07EB, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	%i6,	%o2
	subccc	%o5,	0x0748,	%g3
	movrne	%l1,	0x174,	%g1
	addccc	%i1,	0x1FED,	%i2
	edge16ln	%o4,	%o3,	%l2
	xorcc	%i3,	%l0,	%g7
	sethi	0x0A71,	%i5
	addc	%g2,	0x0F59,	%i7
	fnor	%f4,	%f0,	%f24
	fmovsa	%xcc,	%f25,	%f7
	srl	%g5,	0x15,	%l6
	fcmps	%fcc0,	%f13,	%f7
	fmovsn	%icc,	%f22,	%f29
	fxors	%f13,	%f2,	%f10
	ld	[%l7 + 0x34],	%f19
	movg	%xcc,	%i4,	%o6
	fmul8ulx16	%f28,	%f8,	%f16
	ldd	[%l7 + 0x08],	%f26
	fnot1s	%f21,	%f26
	save %i0, %g4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0C64,	%l4
	save %l3, %o7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o0,	0x12F3,	%l5
	sdivx	%i6,	0x0EEB,	%o2
	subccc	%g3,	0x1964,	%o5
	stx	%g1,	[%l7 + 0x48]
	sethi	0x0844,	%l1
	xor	%i2,	0x08AD,	%o4
	fcmpeq16	%f18,	%f24,	%o3
	fcmpes	%fcc3,	%f29,	%f26
	fmovsge	%icc,	%f26,	%f23
	fpadd32	%f2,	%f30,	%f12
	ldd	[%l7 + 0x28],	%l2
	stw	%i1,	[%l7 + 0x74]
	movcc	%icc,	%i3,	%g7
	edge16n	%i5,	%l0,	%i7
	movne	%xcc,	%g2,	%l6
	movl	%xcc,	%g5,	%o6
	and	%i0,	%g4,	%i4
	fcmpne16	%f24,	%f22,	%g6
	subc	%l4,	%l3,	%o1
	fmul8x16au	%f9,	%f20,	%f6
	sdiv	%o0,	0x13C5,	%o7
	fmovde	%icc,	%f13,	%f6
	ldsh	[%l7 + 0x76],	%i6
	movleu	%icc,	%l5,	%o2
	lduw	[%l7 + 0x10],	%g3
	st	%f22,	[%l7 + 0x1C]
	mulscc	%o5,	0x0CF8,	%l1
	sll	%g1,	%i2,	%o3
	fnands	%f29,	%f4,	%f27
	udivx	%l2,	0x1C45,	%o4
	xnor	%i3,	%g7,	%i5
	fmovsgu	%icc,	%f1,	%f20
	fmul8x16au	%f7,	%f21,	%f28
	ld	[%l7 + 0x6C],	%f16
	edge16l	%i1,	%l0,	%i7
	orn	%g2,	%g5,	%o6
	srax	%i0,	%l6,	%g4
	fnot1	%f14,	%f0
	edge8l	%g6,	%l4,	%i4
	addcc	%o1,	%l3,	%o0
	nop
	set	0x20, %i6
	stx	%o7,	[%l7 + %i6]
	udiv	%l5,	0x1B4E,	%i6
	edge16ln	%g3,	%o2,	%l1
	alignaddr	%g1,	%o5,	%i2
	andn	%o3,	%l2,	%o4
	movne	%xcc,	%g7,	%i5
	fand	%f12,	%f28,	%f30
	fmovsne	%xcc,	%f2,	%f14
	sir	0x108D
	srl	%i1,	%l0,	%i3
	sir	0x025B
	edge8	%i7,	%g2,	%o6
	edge32ln	%i0,	%g5,	%g4
	edge8	%g6,	%l6,	%l4
	xor	%i4,	0x001D,	%l3
	edge32	%o1,	%o7,	%l5
	edge16n	%o0,	%i6,	%o2
	fnands	%f19,	%f18,	%f14
	edge32l	%l1,	%g3,	%g1
	orn	%o5,	%i2,	%o3
	fone	%f14
	addcc	%o4,	0x06FA,	%g7
	movrgz	%l2,	%i5,	%l0
	popc	0x0FCC,	%i3
	st	%f27,	[%l7 + 0x28]
	sethi	0x1204,	%i1
	edge16l	%i7,	%g2,	%o6
	and	%g5,	%i0,	%g4
	fone	%f10
	ldx	[%l7 + 0x68],	%l6
	sdiv	%g6,	0x17A3,	%i4
	srlx	%l4,	0x02,	%l3
	fmovrdne	%o1,	%f0,	%f4
	umul	%l5,	%o0,	%o7
	fmovscs	%icc,	%f14,	%f4
	mova	%icc,	%i6,	%l1
	sll	%g3,	0x08,	%o2
	fmovrdgez	%g1,	%f20,	%f20
	edge16	%o5,	%i2,	%o3
	subcc	%g7,	%l2,	%i5
	fmovdcs	%xcc,	%f12,	%f0
	fmul8sux16	%f26,	%f4,	%f4
	andcc	%l0,	%i3,	%o4
	movne	%xcc,	%i1,	%g2
	edge16ln	%i7,	%g5,	%o6
	ldd	[%l7 + 0x48],	%i0
	movrlez	%l6,	%g6,	%i4
	movpos	%xcc,	%g4,	%l4
	siam	0x7
	andcc	%l3,	0x07AC,	%o1
	edge32l	%l5,	%o7,	%o0
	edge8n	%i6,	%g3,	%o2
	edge8l	%l1,	%o5,	%g1
	fandnot2	%f22,	%f24,	%f28
	ldub	[%l7 + 0x4F],	%o3
	movcs	%xcc,	%i2,	%l2
	fcmpd	%fcc2,	%f24,	%f10
	fzero	%f16
	edge8ln	%g7,	%l0,	%i5
	array16	%o4,	%i1,	%g2
	movpos	%icc,	%i3,	%i7
	fmovdne	%xcc,	%f18,	%f7
	orcc	%o6,	%i0,	%g5
	srl	%l6,	%i4,	%g6
	stx	%g4,	[%l7 + 0x30]
	srlx	%l4,	%l3,	%l5
	fandnot2s	%f6,	%f20,	%f15
	edge8n	%o1,	%o7,	%o0
	fnot1s	%f25,	%f17
	array32	%g3,	%i6,	%l1
	stx	%o2,	[%l7 + 0x68]
	movre	%o5,	%o3,	%g1
	movrne	%i2,	0x015,	%l2
	sdivx	%l0,	0x0515,	%i5
	movrgez	%o4,	0x1A4,	%i1
	alignaddr	%g2,	%i3,	%g7
	sdivcc	%o6,	0x063B,	%i0
	fpadd32s	%f24,	%f10,	%f3
	array8	%i7,	%l6,	%g5
	sra	%i4,	%g4,	%g6
	umul	%l3,	0x04F7,	%l5
	fmovd	%f24,	%f4
	movgu	%xcc,	%l4,	%o7
	movvc	%icc,	%o0,	%o1
	ldub	[%l7 + 0x65],	%i6
	fmuld8sux16	%f14,	%f5,	%f8
	umul	%g3,	%l1,	%o5
	edge16n	%o2,	%g1,	%o3
	movpos	%xcc,	%l2,	%i2
	andncc	%i5,	%l0,	%o4
	movleu	%icc,	%g2,	%i1
	movcc	%xcc,	%g7,	%i3
	movre	%i0,	%o6,	%i7
	fcmpes	%fcc2,	%f18,	%f9
	movne	%xcc,	%l6,	%g5
	fpsub32	%f14,	%f4,	%f0
	xnor	%g4,	0x108B,	%i4
	faligndata	%f28,	%f4,	%f10
	sir	0x0BDF
	xnor	%g6,	%l5,	%l4
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	movpos	%xcc,	%i6,	%g3
	udivcc	%l1,	0x0595,	%o1
	movpos	%icc,	%o2,	%o5
	edge8ln	%g1,	%l2,	%o3
	movne	%xcc,	%i5,	%i2
	ldd	[%l7 + 0x20],	%f18
	for	%f4,	%f6,	%f28
	stw	%o4,	[%l7 + 0x6C]
	movcs	%xcc,	%l0,	%g2
	addc	%g7,	0x0C92,	%i3
	subcc	%i1,	0x0E0A,	%i0
	movre	%o6,	%l6,	%g5
	fmovrsgez	%i7,	%f19,	%f27
	movne	%xcc,	%g4,	%i4
	andn	%g6,	0x0BDB,	%l4
	fpsub32	%f20,	%f10,	%f16
	fandnot1s	%f22,	%f24,	%f4
	fornot1	%f4,	%f2,	%f14
	move	%icc,	%l5,	%o0
	andncc	%o7,	%l3,	%g3
	fmovdle	%icc,	%f6,	%f23
	mulx	%i6,	%l1,	%o2
	fmovdn	%xcc,	%f27,	%f9
	ldx	[%l7 + 0x20],	%o1
	fpackfix	%f0,	%f23
	fmovdne	%xcc,	%f23,	%f17
	movn	%xcc,	%g1,	%o5
	edge32l	%l2,	%o3,	%i5
	edge32ln	%i2,	%o4,	%l0
	fnor	%f4,	%f26,	%f10
	fnors	%f5,	%f16,	%f12
	mulx	%g2,	%i3,	%g7
	std	%f18,	[%l7 + 0x48]
	orncc	%i0,	0x0C96,	%o6
	xnor	%i1,	0x149F,	%l6
	and	%i7,	0x0BA9,	%g5
	move	%icc,	%g4,	%g6
	udiv	%i4,	0x0CB9,	%l5
	save %l4, 0x0F50, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f16,	%f27
	fmovsleu	%xcc,	%f2,	%f10
	movre	%o0,	0x27F,	%g3
	for	%f6,	%f18,	%f8
	fcmpne16	%f16,	%f8,	%l3
	umul	%l1,	0x00A9,	%i6
	array16	%o2,	%g1,	%o1
	movrlz	%o5,	0x03A,	%l2
	fmovrdlez	%i5,	%f24,	%f4
	fxnor	%f20,	%f26,	%f16
	bshuffle	%f24,	%f2,	%f24
	movl	%icc,	%o3,	%i2
	ldub	[%l7 + 0x76],	%o4
	umulcc	%l0,	%i3,	%g7
	udiv	%g2,	0x0F7B,	%i0
	movrlez	%o6,	0x2AA,	%i1
	movl	%xcc,	%l6,	%g5
	ldd	[%l7 + 0x20],	%g4
	movn	%icc,	%i7,	%i4
	sra	%g6,	%l5,	%l4
	addcc	%o7,	%g3,	%l3
	fmovsvc	%icc,	%f3,	%f27
	std	%f0,	[%l7 + 0x30]
	xorcc	%o0,	0x1483,	%i6
	fmul8ulx16	%f12,	%f4,	%f18
	andn	%o2,	%l1,	%o1
	ldsh	[%l7 + 0x22],	%o5
	array8	%l2,	%g1,	%i5
	fcmpne32	%f26,	%f20,	%i2
	fnot2	%f10,	%f22
	and	%o4,	%o3,	%i3
	fcmps	%fcc3,	%f31,	%f22
	mulx	%g7,	0x1E9D,	%g2
	mova	%icc,	%l0,	%o6
	srl	%i1,	%i0,	%g5
	fmul8x16au	%f4,	%f0,	%f6
	fcmped	%fcc2,	%f2,	%f18
	udiv	%l6,	0x144F,	%g4
	movl	%xcc,	%i7,	%i4
	move	%icc,	%g6,	%l4
	fcmple16	%f12,	%f18,	%l5
	movvc	%icc,	%o7,	%l3
	edge8n	%o0,	%i6,	%o2
	ldx	[%l7 + 0x40],	%g3
	xor	%o1,	%o5,	%l1
	sdivx	%g1,	0x1496,	%i5
	ldub	[%l7 + 0x36],	%l2
	nop
	set	0x1E, %i1
	stb	%i2,	[%l7 + %i1]
	alignaddrl	%o4,	%i3,	%g7
	movrgz	%o3,	%g2,	%l0
	save %o6, %i1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i0,	%g4
	sdivcc	%l6,	0x1333,	%i4
	lduh	[%l7 + 0x24],	%i7
	edge16ln	%l4,	%l5,	%o7
	faligndata	%f24,	%f30,	%f0
	movrne	%l3,	%o0,	%i6
	orncc	%g6,	0x0CDA,	%o2
	fmovsvc	%icc,	%f17,	%f11
	sllx	%g3,	%o1,	%o5
	array8	%g1,	%l1,	%i5
	mulscc	%l2,	0x0489,	%i2
	movn	%xcc,	%i3,	%o4
	lduw	[%l7 + 0x78],	%o3
	fornot2s	%f0,	%f31,	%f21
	fxnor	%f2,	%f22,	%f4
	fmovdg	%icc,	%f19,	%f4
	movrne	%g7,	%l0,	%g2
	movcs	%icc,	%i1,	%o6
	sir	0x117C
	add	%i0,	0x05E3,	%g4
	udiv	%l6,	0x1287,	%g5
	fmovdvs	%icc,	%f9,	%f27
	sdiv	%i7,	0x0EE0,	%i4
	fpack16	%f6,	%f18
	addc	%l4,	0x0E30,	%o7
	addc	%l3,	%o0,	%i6
	alignaddrl	%g6,	%l5,	%o2
	movneg	%icc,	%o1,	%g3
	fcmpeq16	%f30,	%f8,	%o5
	fmul8x16al	%f12,	%f19,	%f14
	fandnot1s	%f4,	%f9,	%f0
	std	%f6,	[%l7 + 0x28]
	srl	%l1,	0x07,	%g1
	xnor	%l2,	%i2,	%i3
	sdiv	%i5,	0x0116,	%o4
	st	%f12,	[%l7 + 0x08]
	movle	%icc,	%o3,	%g7
	ldsw	[%l7 + 0x08],	%l0
	srlx	%g2,	0x14,	%i1
	movle	%icc,	%o6,	%g4
	edge16l	%l6,	%g5,	%i7
	fmul8x16al	%f22,	%f13,	%f0
	fmovdcs	%icc,	%f0,	%f30
	edge16n	%i0,	%l4,	%o7
	sllx	%i4,	0x03,	%o0
	fornot2	%f0,	%f2,	%f8
	edge8l	%i6,	%g6,	%l3
	fors	%f24,	%f29,	%f12
	movl	%icc,	%l5,	%o2
	movcs	%icc,	%o1,	%o5
	andncc	%l1,	%g3,	%g1
	lduw	[%l7 + 0x70],	%i2
	movvs	%xcc,	%i3,	%l2
	addccc	%o4,	0x0702,	%i5
	array8	%o3,	%g7,	%g2
	array16	%l0,	%o6,	%g4
	st	%f8,	[%l7 + 0x3C]
	fornot1s	%f26,	%f19,	%f1
	ldsb	[%l7 + 0x09],	%i1
	xnorcc	%l6,	0x1B25,	%g5
	edge32l	%i0,	%l4,	%o7
	edge16l	%i4,	%i7,	%i6
	fpmerge	%f26,	%f30,	%f8
	ldsw	[%l7 + 0x38],	%g6
	fone	%f26
	srax	%o0,	%l3,	%o2
	fpsub32	%f26,	%f12,	%f30
	addcc	%o1,	%l5,	%o5
	mova	%xcc,	%l1,	%g3
	andncc	%i2,	%g1,	%l2
	fmovdneg	%icc,	%f22,	%f8
	movle	%icc,	%i3,	%o4
	lduw	[%l7 + 0x2C],	%i5
	lduw	[%l7 + 0x28],	%g7
	fsrc1s	%f16,	%f29
	mova	%icc,	%g2,	%o3
	fmovrsgez	%o6,	%f8,	%f2
	fnor	%f10,	%f14,	%f12
	fcmpd	%fcc1,	%f30,	%f26
	smul	%g4,	%l0,	%l6
	movvs	%icc,	%i1,	%g5
	array32	%i0,	%o7,	%l4
	movvs	%xcc,	%i7,	%i4
	edge32n	%g6,	%o0,	%i6
	lduw	[%l7 + 0x60],	%l3
	fsrc1s	%f21,	%f29
	fsrc1s	%f1,	%f9
	edge16	%o2,	%o1,	%o5
	fmovsl	%icc,	%f0,	%f27
	umulcc	%l1,	%g3,	%i2
	fsrc1	%f10,	%f14
	movcc	%icc,	%g1,	%l5
	fmovrdgez	%l2,	%f24,	%f16
	array8	%o4,	%i3,	%g7
	sllx	%g2,	0x04,	%o3
	fmovsg	%icc,	%f28,	%f12
	edge8n	%i5,	%o6,	%g4
	fmovse	%icc,	%f26,	%f12
	array32	%l6,	%i1,	%l0
	subcc	%i0,	0x0D76,	%o7
	ldub	[%l7 + 0x2F],	%l4
	movle	%icc,	%g5,	%i7
	fpadd16	%f6,	%f14,	%f6
	ldd	[%l7 + 0x28],	%f20
	save %i4, 0x1C6F, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f24,	%f19,	%f0
	edge16l	%i6,	%l3,	%o2
	sll	%g6,	%o5,	%o1
	sra	%g3,	%l1,	%g1
	srax	%l5,	0x09,	%l2
	sethi	0x0C09,	%i2
	or	%i3,	0x03F9,	%o4
	fmuld8ulx16	%f4,	%f19,	%f28
	sdivcc	%g2,	0x1333,	%o3
	movle	%icc,	%g7,	%i5
	array32	%g4,	%l6,	%o6
	movrlez	%i1,	%l0,	%o7
	mova	%icc,	%l4,	%g5
	fmovrdgz	%i0,	%f6,	%f2
	fnot1	%f10,	%f28
	xnorcc	%i7,	%i4,	%o0
	subcc	%l3,	%o2,	%g6
	udiv	%i6,	0x073F,	%o5
	movrlez	%g3,	0x3FF,	%o1
	restore %l1, %l5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l2,	%i2
	sethi	0x14C4,	%i3
	fmovdne	%icc,	%f16,	%f16
	addccc	%g2,	0x0267,	%o3
	array16	%o4,	%i5,	%g7
	movl	%icc,	%l6,	%g4
	edge16n	%o6,	%l0,	%i1
	popc	%l4,	%g5
	fmovde	%icc,	%f21,	%f16
	sir	0x0204
	addccc	%o7,	0x1354,	%i0
	movre	%i7,	0x2DB,	%o0
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	sra	%g6,	0x14,	%i6
	add	%o5,	%g3,	%o1
	fmovsneg	%xcc,	%f4,	%f19
	srlx	%l1,	0x0E,	%l3
	array32	%g1,	%l2,	%l5
	movn	%xcc,	%i2,	%i3
	movleu	%icc,	%g2,	%o3
	edge16n	%o4,	%g7,	%i5
	lduw	[%l7 + 0x14],	%l6
	mova	%xcc,	%g4,	%l0
	edge32l	%o6,	%i1,	%l4
	fandnot2	%f28,	%f14,	%f12
	fsrc1s	%f11,	%f7
	edge8ln	%g5,	%o7,	%i7
	edge32ln	%i0,	%i4,	%o2
	fpack16	%f8,	%f16
	edge16l	%o0,	%g6,	%o5
	andcc	%i6,	%o1,	%g3
	fxnor	%f20,	%f2,	%f8
	save %l1, %g1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x08, %o1
	lduw	[%l7 + %o1],	%l3
	sub	%i2,	%l5,	%i3
	edge8n	%g2,	%o4,	%o3
	fmovsgu	%xcc,	%f31,	%f19
	alignaddr	%g7,	%l6,	%g4
	fmovspos	%xcc,	%f16,	%f19
	array16	%l0,	%o6,	%i1
	fmovdne	%icc,	%f14,	%f13
	edge8ln	%l4,	%i5,	%g5
	edge16l	%i7,	%i0,	%o7
	move	%icc,	%o2,	%i4
	movl	%xcc,	%o0,	%o5
	fcmpgt16	%f6,	%f12,	%g6
	fmovsl	%icc,	%f5,	%f28
	andn	%o1,	%i6,	%g3
	udiv	%l1,	0x1678,	%l2
	array8	%g1,	%l3,	%l5
	fmovs	%f31,	%f19
	nop
	set	0x5C, %o5
	lduw	[%l7 + %o5],	%i3
	ldsb	[%l7 + 0x11],	%g2
	fornot2s	%f15,	%f5,	%f23
	xorcc	%o4,	0x1B37,	%i2
	movneg	%icc,	%g7,	%o3
	or	%g4,	%l6,	%o6
	movcs	%icc,	%i1,	%l4
	fmovsvs	%xcc,	%f18,	%f23
	fnot1	%f4,	%f18
	fmovspos	%icc,	%f19,	%f13
	or	%i5,	%g5,	%i7
	std	%f20,	[%l7 + 0x18]
	sethi	0x1C37,	%l0
	udivx	%i0,	0x03DD,	%o7
	movl	%icc,	%i4,	%o0
	popc	%o5,	%g6
	mova	%xcc,	%o1,	%o2
	addcc	%i6,	%l1,	%g3
	fmul8x16au	%f12,	%f29,	%f8
	movcs	%xcc,	%g1,	%l3
	srl	%l2,	%i3,	%g2
	lduh	[%l7 + 0x22],	%l5
	sdivcc	%i2,	0x1B0F,	%g7
	movvc	%icc,	%o4,	%o3
	movrgez	%l6,	%g4,	%i1
	udivx	%o6,	0x02CD,	%i5
	movrne	%l4,	0x022,	%g5
	movrlz	%l0,	%i0,	%i7
	lduh	[%l7 + 0x3E],	%o7
	fmovrdne	%i4,	%f6,	%f24
	edge16n	%o0,	%o5,	%o1
	fnot1	%f24,	%f2
	fornot1	%f20,	%f6,	%f12
	stb	%o2,	[%l7 + 0x20]
	xorcc	%i6,	0x07CB,	%g6
	fmovrse	%l1,	%f9,	%f16
	xorcc	%g3,	0x032B,	%g1
	movrne	%l2,	0x295,	%i3
	movrgz	%g2,	%l5,	%i2
	edge32l	%l3,	%g7,	%o4
	fmovse	%xcc,	%f30,	%f19
	ldd	[%l7 + 0x40],	%f2
	movrlez	%o3,	%g4,	%l6
	ldsh	[%l7 + 0x3A],	%i1
	lduw	[%l7 + 0x54],	%o6
	srlx	%l4,	%g5,	%l0
	movle	%xcc,	%i5,	%i7
	mulx	%i0,	0x1AFB,	%o7
	restore %o0, %i4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x60],	%o2
	fmovdne	%xcc,	%f26,	%f3
	udivcc	%i6,	0x058F,	%o5
	sir	0x1266
	movrgez	%l1,	0x05E,	%g3
	fmovdgu	%xcc,	%f2,	%f23
	mulscc	%g1,	0x18E9,	%l2
	movpos	%xcc,	%i3,	%g2
	sra	%g6,	0x1F,	%l5
	movl	%xcc,	%l3,	%i2
	udivcc	%g7,	0x1CA5,	%o3
	mulscc	%o4,	0x113F,	%g4
	sth	%i1,	[%l7 + 0x46]
	xnor	%o6,	0x0D75,	%l6
	edge8n	%g5,	%l4,	%i5
	movg	%xcc,	%l0,	%i7
	movn	%xcc,	%o7,	%o0
	sra	%i0,	0x18,	%i4
	smulcc	%o1,	%i6,	%o2
	andcc	%o5,	0x1793,	%l1
	xorcc	%g3,	%l2,	%g1
	edge32	%g2,	%i3,	%l5
	edge16n	%l3,	%g6,	%i2
	sra	%o3,	0x19,	%o4
	sllx	%g7,	0x19,	%g4
	lduw	[%l7 + 0x08],	%i1
	fcmpgt16	%f16,	%f30,	%o6
	fnegd	%f24,	%f12
	movg	%xcc,	%g5,	%l6
	siam	0x6
	fmovdgu	%xcc,	%f0,	%f24
	sllx	%l4,	0x01,	%i5
	mova	%icc,	%i7,	%l0
	fpadd32s	%f14,	%f10,	%f16
	sra	%o0,	0x16,	%o7
	fmovde	%xcc,	%f29,	%f16
	edge8n	%i0,	%i4,	%i6
	sethi	0x061B,	%o2
	movvs	%xcc,	%o1,	%o5
	ldd	[%l7 + 0x08],	%g2
	fmovdl	%xcc,	%f18,	%f21
	ldd	[%l7 + 0x78],	%f20
	fmovrslez	%l2,	%f12,	%f2
	udivcc	%g1,	0x15A3,	%g2
	std	%f12,	[%l7 + 0x78]
	alignaddr	%l1,	%l5,	%l3
	fnor	%f8,	%f2,	%f8
	movcs	%icc,	%i3,	%i2
	andncc	%o3,	%o4,	%g6
	fsrc2	%f4,	%f6
	addccc	%g7,	%i1,	%g4
	move	%icc,	%o6,	%l6
	udivcc	%l4,	0x03D7,	%i5
	ldsh	[%l7 + 0x0E],	%g5
	sub	%i7,	%o0,	%o7
	edge16l	%i0,	%i4,	%l0
	ldsh	[%l7 + 0x28],	%o2
	subc	%o1,	0x133D,	%i6
	edge8	%g3,	%l2,	%o5
	edge16	%g2,	%g1,	%l5
	movge	%icc,	%l3,	%l1
	ldsw	[%l7 + 0x3C],	%i3
	fzeros	%f15
	sethi	0x0CB8,	%o3
	save %o4, 0x07DB, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f5,	[%l7 + 0x08]
	ldd	[%l7 + 0x40],	%f12
	fmovsg	%icc,	%f2,	%f18
	lduh	[%l7 + 0x60],	%g6
	fmovspos	%xcc,	%f22,	%f14
	fands	%f0,	%f5,	%f31
	fmovrde	%i1,	%f20,	%f30
	edge16ln	%g4,	%o6,	%g7
	fpadd32s	%f13,	%f6,	%f24
	array8	%l6,	%l4,	%g5
	fmovsneg	%icc,	%f4,	%f12
	ldsb	[%l7 + 0x37],	%i7
	fcmple16	%f22,	%f14,	%i5
	fzeros	%f6
	fmovdneg	%xcc,	%f16,	%f22
	fmovrde	%o0,	%f16,	%f24
	smulcc	%i0,	%i4,	%l0
	edge8ln	%o7,	%o1,	%i6
	addccc	%g3,	0x040F,	%l2
	srl	%o5,	%o2,	%g2
	fcmpgt32	%f6,	%f2,	%g1
	addccc	%l3,	0x1AB8,	%l1
	fmovsn	%xcc,	%f14,	%f9
	std	%f8,	[%l7 + 0x70]
	lduh	[%l7 + 0x16],	%i3
	fpackfix	%f10,	%f29
	fsrc2s	%f3,	%f13
	move	%xcc,	%l5,	%o3
	edge16ln	%i2,	%o4,	%g6
	xorcc	%i1,	%g4,	%g7
	movg	%xcc,	%l6,	%o6
	array32	%g5,	%i7,	%i5
	movrgez	%o0,	0x388,	%l4
	stx	%i4,	[%l7 + 0x18]
	move	%icc,	%i0,	%l0
	orncc	%o7,	0x1A55,	%i6
	ldx	[%l7 + 0x30],	%o1
	ldub	[%l7 + 0x08],	%g3
	srl	%o5,	%o2,	%g2
	array8	%l2,	%g1,	%l3
	and	%i3,	%l5,	%o3
	movl	%xcc,	%l1,	%i2
	umulcc	%g6,	0x0810,	%i1
	st	%f28,	[%l7 + 0x3C]
	edge16n	%o4,	%g4,	%l6
	fcmpgt32	%f2,	%f30,	%o6
	edge8	%g5,	%g7,	%i5
	movvs	%xcc,	%o0,	%i7
	movrgez	%l4,	0x1C3,	%i4
	fmovrse	%i0,	%f27,	%f8
	movrne	%o7,	0x069,	%i6
	fmuld8sux16	%f5,	%f10,	%f24
	std	%f14,	[%l7 + 0x58]
	st	%f2,	[%l7 + 0x40]
	fpsub16	%f26,	%f4,	%f16
	fpadd32s	%f21,	%f12,	%f7
	xnor	%l0,	0x04F7,	%o1
	subcc	%g3,	%o5,	%g2
	subccc	%o2,	%g1,	%l3
	movrgez	%l2,	0x03A,	%i3
	andncc	%l5,	%o3,	%i2
	sllx	%l1,	%i1,	%o4
	movleu	%icc,	%g4,	%l6
	ldub	[%l7 + 0x5D],	%g6
	sra	%o6,	0x08,	%g7
	orn	%g5,	%i5,	%o0
	edge32l	%l4,	%i7,	%i0
	udivx	%i4,	0x1302,	%i6
	sir	0x0452
	movn	%icc,	%l0,	%o7
	ldsw	[%l7 + 0x48],	%o1
	movvs	%xcc,	%o5,	%g2
	sdivx	%g3,	0x0416,	%g1
	sub	%l3,	0x1759,	%o2
	udivcc	%l2,	0x1CAE,	%i3
	movcc	%xcc,	%l5,	%o3
	subcc	%l1,	%i1,	%i2
	std	%f0,	[%l7 + 0x50]
	srl	%g4,	0x13,	%l6
	fmovse	%icc,	%f6,	%f11
	orcc	%o4,	%o6,	%g7
	fmovsneg	%xcc,	%f21,	%f12
	fcmps	%fcc3,	%f22,	%f30
	ldx	[%l7 + 0x68],	%g6
	movcs	%xcc,	%i5,	%g5
	lduw	[%l7 + 0x0C],	%l4
	udivcc	%i7,	0x1A63,	%o0
	fcmpd	%fcc2,	%f18,	%f12
	fmovrsgz	%i4,	%f27,	%f10
	andncc	%i0,	%l0,	%i6
	edge16ln	%o7,	%o1,	%o5
	movg	%icc,	%g3,	%g1
	fsrc1	%f18,	%f26
	movcc	%icc,	%l3,	%o2
	udivx	%g2,	0x0AE5,	%i3
	stx	%l2,	[%l7 + 0x08]
	ldub	[%l7 + 0x2F],	%o3
	move	%icc,	%l5,	%i1
	srlx	%l1,	%i2,	%l6
	smul	%o4,	%g4,	%o6
	udivx	%g6,	0x168D,	%i5
	fcmpd	%fcc2,	%f30,	%f20
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	lduh	[%l7 + 0x3A],	%o0
	std	%f14,	[%l7 + 0x58]
	mulx	%i7,	0x1B13,	%i4
	orncc	%i0,	%l0,	%i6
	stw	%o7,	[%l7 + 0x10]
	fexpand	%f16,	%f4
	array8	%o5,	%g3,	%g1
	addc	%o1,	0x0A6F,	%l3
	smul	%o2,	0x08C5,	%g2
	lduw	[%l7 + 0x7C],	%l2
	srlx	%o3,	0x07,	%i3
	ldsw	[%l7 + 0x7C],	%l5
	and	%i1,	%i2,	%l1
	fpsub32s	%f8,	%f1,	%f2
	andcc	%l6,	0x12B7,	%o4
	movcs	%icc,	%o6,	%g6
	fmul8x16	%f26,	%f26,	%f24
	ldsb	[%l7 + 0x0B],	%i5
	fors	%f10,	%f0,	%f9
	fmovdl	%xcc,	%f5,	%f10
	fmovdvs	%icc,	%f17,	%f31
	movvs	%icc,	%g4,	%g5
	fors	%f23,	%f28,	%f4
	umulcc	%l4,	%o0,	%g7
	fandnot1	%f18,	%f6,	%f2
	movle	%icc,	%i7,	%i0
	movle	%xcc,	%i4,	%i6
	addc	%l0,	%o5,	%o7
	xor	%g3,	0x019D,	%g1
	movleu	%icc,	%o1,	%l3
	fnot2	%f6,	%f20
	sdiv	%g2,	0x130F,	%l2
	sdivcc	%o3,	0x0AFB,	%o2
	sdivx	%i3,	0x0D3A,	%i1
	sdivx	%i2,	0x1DA4,	%l1
	fmovsvs	%icc,	%f7,	%f4
	fexpand	%f3,	%f22
	edge8n	%l6,	%o4,	%o6
	st	%f16,	[%l7 + 0x08]
	umulcc	%g6,	%l5,	%i5
	movgu	%icc,	%g4,	%l4
	fnegs	%f25,	%f31
	movvc	%icc,	%g5,	%o0
	udivx	%g7,	0x0B4E,	%i7
	fsrc1s	%f5,	%f10
	movvs	%xcc,	%i0,	%i4
	edge16ln	%i6,	%o5,	%l0
	xorcc	%o7,	%g3,	%g1
	srl	%o1,	0x18,	%l3
	edge16l	%l2,	%g2,	%o2
	nop
	set	0x2A, %i4
	stb	%o3,	[%l7 + %i4]
	ldd	[%l7 + 0x30],	%f26
	array32	%i3,	%i2,	%l1
	restore %i1, %o4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f28,	%f16
	sethi	0x10A0,	%g6
	add	%l6,	0x1E9D,	%l5
	faligndata	%f22,	%f14,	%f22
	mulscc	%i5,	%l4,	%g4
	nop
	set	0x48, %i2
	ldsb	[%l7 + %i2],	%o0
	lduw	[%l7 + 0x58],	%g5
	fmovrdgz	%g7,	%f12,	%f18
	fpsub16	%f8,	%f6,	%f10
	fmovscs	%xcc,	%f22,	%f28
	save %i0, 0x119D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i6,	0x0A69,	%i4
	fmovdleu	%icc,	%f23,	%f16
	udiv	%l0,	0x168C,	%o5
	edge32n	%g3,	%o7,	%g1
	stb	%o1,	[%l7 + 0x4E]
	sllx	%l2,	0x17,	%g2
	fmovrsgz	%l3,	%f19,	%f12
	fmovdl	%icc,	%f3,	%f9
	xnorcc	%o3,	0x060E,	%i3
	ldd	[%l7 + 0x78],	%i2
	movn	%icc,	%o2,	%i1
	andcc	%o4,	%l1,	%o6
	st	%f19,	[%l7 + 0x50]
	orn	%l6,	%l5,	%i5
	udivx	%g6,	0x1D80,	%g4
	edge8	%o0,	%l4,	%g7
	subc	%i0,	%g5,	%i6
	fnot2s	%f0,	%f18
	fmul8x16au	%f8,	%f27,	%f4
	udivx	%i4,	0x0A18,	%i7
	xor	%l0,	0x026A,	%o5
	movle	%icc,	%g3,	%g1
	movgu	%icc,	%o1,	%o7
	fcmpeq16	%f10,	%f16,	%g2
	subccc	%l3,	0x15AA,	%o3
	movl	%xcc,	%i3,	%i2
	movvc	%xcc,	%o2,	%i1
	movneg	%icc,	%o4,	%l2
	edge8	%l1,	%o6,	%l5
	subccc	%i5,	0x1AE6,	%g6
	sir	0x00DC
	alignaddrl	%l6,	%g4,	%o0
	fmovsa	%icc,	%f25,	%f12
	sth	%l4,	[%l7 + 0x6E]
	movgu	%icc,	%i0,	%g7
	movrlez	%g5,	%i6,	%i4
	movpos	%xcc,	%l0,	%i7
	movre	%o5,	0x1F7,	%g3
	movvc	%icc,	%g1,	%o7
	udivx	%g2,	0x1EC4,	%l3
	xor	%o3,	%i3,	%i2
	ldsw	[%l7 + 0x60],	%o2
	movrne	%o1,	%o4,	%i1
	smulcc	%l1,	%l2,	%o6
	addcc	%i5,	0x198F,	%l5
	edge16n	%l6,	%g4,	%o0
	alignaddr	%l4,	%i0,	%g6
	srax	%g5,	0x11,	%g7
	fpadd16	%f14,	%f22,	%f26
	ld	[%l7 + 0x38],	%f27
	udiv	%i6,	0x1C7E,	%i4
	sllx	%l0,	%o5,	%g3
	st	%f10,	[%l7 + 0x6C]
	fmovspos	%icc,	%f20,	%f14
	fmovda	%icc,	%f12,	%f23
	nop
	set	0x38, %o6
	stx	%g1,	[%l7 + %o6]
	mova	%icc,	%i7,	%o7
	umulcc	%l3,	%o3,	%i3
	fcmple32	%f6,	%f30,	%i2
	ld	[%l7 + 0x34],	%f1
	movpos	%xcc,	%o2,	%g2
	mova	%icc,	%o1,	%i1
	movleu	%xcc,	%l1,	%l2
	fxor	%f4,	%f4,	%f28
	alignaddrl	%o4,	%o6,	%i5
	ldd	[%l7 + 0x68],	%i6
	fmovsg	%icc,	%f16,	%f26
	movge	%icc,	%g4,	%l5
	movrlez	%l4,	%i0,	%o0
	edge16ln	%g5,	%g7,	%i6
	fmovdge	%xcc,	%f11,	%f2
	fmul8x16	%f22,	%f22,	%f4
	smulcc	%g6,	0x05D7,	%i4
	ldsh	[%l7 + 0x46],	%l0
	movvc	%xcc,	%g3,	%o5
	xnor	%i7,	0x1FB0,	%g1
	fpackfix	%f30,	%f28
	fnors	%f31,	%f23,	%f2
	ldsb	[%l7 + 0x39],	%l3
	fsrc2	%f0,	%f30
	mulx	%o3,	%i3,	%o7
	orncc	%o2,	%g2,	%i2
	ld	[%l7 + 0x24],	%f14
	udivx	%i1,	0x0D54,	%l1
	fmovrsgez	%l2,	%f10,	%f21
	fmovsge	%icc,	%f10,	%f29
	st	%f1,	[%l7 + 0x6C]
	array32	%o1,	%o6,	%i5
	andncc	%o4,	%g4,	%l5
	fmovrsgez	%l6,	%f25,	%f15
	movl	%xcc,	%i0,	%o0
	lduw	[%l7 + 0x38],	%l4
	smulcc	%g7,	%i6,	%g5
	save %g6, 0x1757, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i4,	0x08F4,	%o5
	udivcc	%g3,	0x00C4,	%g1
	movle	%icc,	%i7,	%o3
	srax	%i3,	0x08,	%o7
	array16	%o2,	%g2,	%i2
	fmovscc	%icc,	%f27,	%f17
	sir	0x0DC7
	srax	%l3,	0x19,	%l1
	nop
	set	0x26, %o7
	lduh	[%l7 + %o7],	%i1
	movrgz	%l2,	0x095,	%o1
	fornot1	%f16,	%f28,	%f10
	edge16	%i5,	%o4,	%o6
	fmovrde	%g4,	%f22,	%f30
	umulcc	%l5,	%l6,	%o0
	add	%i0,	%l4,	%i6
	lduw	[%l7 + 0x24],	%g7
	fcmple16	%f4,	%f30,	%g6
	array32	%g5,	%i4,	%l0
	subccc	%o5,	0x0C52,	%g1
	ldd	[%l7 + 0x28],	%f28
	fmovspos	%icc,	%f8,	%f21
	udiv	%g3,	0x130E,	%o3
	srax	%i3,	0x05,	%o7
	fmovde	%icc,	%f1,	%f17
	ld	[%l7 + 0x70],	%f15
	fmovdge	%icc,	%f17,	%f5
	sra	%o2,	%g2,	%i2
	ld	[%l7 + 0x20],	%f12
	pdist	%f26,	%f28,	%f10
	fmovdg	%icc,	%f20,	%f21
	nop
	set	0x5A, %i7
	ldsb	[%l7 + %i7],	%i7
	fmovscc	%icc,	%f1,	%f5
	xor	%l3,	0x1299,	%i1
	edge32	%l2,	%l1,	%i5
	movn	%xcc,	%o4,	%o1
	fpsub16	%f12,	%f6,	%f26
	udivx	%o6,	0x0FA6,	%l5
	fabsd	%f6,	%f10
	fmovdge	%xcc,	%f9,	%f17
	st	%f14,	[%l7 + 0x14]
	std	%f20,	[%l7 + 0x40]
	movneg	%xcc,	%g4,	%o0
	fmovdneg	%xcc,	%f15,	%f28
	ldsh	[%l7 + 0x3E],	%l6
	srl	%l4,	0x06,	%i0
	addcc	%g7,	0x1FF2,	%i6
	movrlz	%g5,	%i4,	%g6
	movgu	%xcc,	%l0,	%g1
	array32	%o5,	%g3,	%i3
	mova	%icc,	%o7,	%o2
	ldsh	[%l7 + 0x3A],	%o3
	movne	%icc,	%i2,	%i7
	xor	%l3,	%i1,	%l2
	edge32ln	%g2,	%l1,	%o4
	sdiv	%o1,	0x1A3E,	%o6
	fpadd32	%f28,	%f6,	%f14
	move	%icc,	%i5,	%l5
	ldsw	[%l7 + 0x0C],	%o0
	fcmpeq32	%f24,	%f28,	%g4
	addccc	%l6,	0x0B44,	%l4
	fnands	%f25,	%f28,	%f11
	movl	%xcc,	%i0,	%i6
	fmovdvc	%xcc,	%f30,	%f4
	popc	%g5,	%i4
	subccc	%g6,	0x0035,	%g7
	movvs	%icc,	%g1,	%o5
	addccc	%g3,	%i3,	%l0
	mulx	%o7,	%o2,	%i2
	umulcc	%o3,	%i7,	%l3
	fmovdl	%icc,	%f16,	%f13
	edge8n	%i1,	%l2,	%l1
	stw	%o4,	[%l7 + 0x6C]
	movle	%xcc,	%g2,	%o1
	movpos	%xcc,	%i5,	%l5
	edge16n	%o6,	%o0,	%g4
	edge8n	%l6,	%i0,	%l4
	edge32l	%g5,	%i6,	%g6
	fnot1s	%f3,	%f31
	addcc	%g7,	%g1,	%i4
	edge16n	%g3,	%o5,	%i3
	fmovsvc	%xcc,	%f12,	%f17
	sub	%o7,	0x0636,	%l0
	array8	%i2,	%o3,	%o2
	movvs	%xcc,	%l3,	%i7
	addccc	%l2,	0x164B,	%l1
	fmovsge	%icc,	%f17,	%f29
	fmul8x16au	%f28,	%f8,	%f24
	ldsh	[%l7 + 0x1A],	%i1
	edge32n	%g2,	%o4,	%i5
	fandnot1	%f0,	%f12,	%f14
	ldsh	[%l7 + 0x18],	%o1
	srl	%o6,	0x0A,	%o0
	edge8ln	%l5,	%l6,	%i0
	movn	%xcc,	%l4,	%g5
	or	%g4,	%i6,	%g6
	fmovrdlez	%g7,	%f8,	%f16
	fmovdcs	%xcc,	%f3,	%f1
	std	%f4,	[%l7 + 0x70]
	edge32	%i4,	%g1,	%g3
	xorcc	%o5,	%i3,	%o7
	fmovsgu	%icc,	%f19,	%f30
	save %l0, %o3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o2,	%l3
	orn	%i7,	0x1B44,	%l2
	movl	%icc,	%l1,	%i1
	movrlz	%g2,	0x2D2,	%o4
	fmul8x16	%f23,	%f10,	%f30
	movl	%xcc,	%i5,	%o6
	sir	0x1392
	edge8ln	%o0,	%l5,	%l6
	movvc	%icc,	%o1,	%l4
	addcc	%g5,	0x08D1,	%i0
	fcmpeq32	%f22,	%f2,	%i6
	ldub	[%l7 + 0x17],	%g6
	alignaddrl	%g7,	%i4,	%g1
	sra	%g4,	0x06,	%o5
	srl	%g3,	0x02,	%i3
	movvc	%icc,	%l0,	%o3
	fmovrde	%i2,	%f20,	%f8
	fmovsn	%icc,	%f13,	%f24
	edge16ln	%o7,	%l3,	%i7
	or	%o2,	0x1585,	%l1
	movre	%i1,	0x250,	%l2
	sdivx	%g2,	0x0996,	%i5
	fmovdn	%icc,	%f15,	%f29
	stx	%o4,	[%l7 + 0x58]
	stw	%o6,	[%l7 + 0x34]
	edge32n	%o0,	%l6,	%o1
	std	%f20,	[%l7 + 0x20]
	sethi	0x1634,	%l4
	andncc	%g5,	%i0,	%l5
	ldsh	[%l7 + 0x20],	%g6
	ldd	[%l7 + 0x40],	%g6
	addc	%i6,	0x1F77,	%i4
	sth	%g4,	[%l7 + 0x1A]
	sll	%g1,	0x15,	%o5
	for	%f22,	%f14,	%f24
	movrlez	%g3,	0x2BC,	%i3
	and	%o3,	%l0,	%o7
	smulcc	%l3,	0x1D5A,	%i2
	ldub	[%l7 + 0x22],	%o2
	andncc	%l1,	%i1,	%i7
	fcmple16	%f2,	%f4,	%g2
	bshuffle	%f18,	%f8,	%f4
	udivcc	%l2,	0x0EB1,	%i5
	movrgez	%o4,	%o0,	%o6
	xnor	%o1,	%l6,	%l4
	movcs	%xcc,	%i0,	%g5
	alignaddrl	%g6,	%l5,	%g7
	mova	%icc,	%i6,	%i4
	add	%g4,	0x13ED,	%o5
	fcmpne32	%f22,	%f10,	%g3
	ldub	[%l7 + 0x52],	%g1
	sdiv	%i3,	0x0C8C,	%l0
	smulcc	%o3,	0x0D32,	%l3
	sub	%i2,	0x1F7F,	%o2
	and	%l1,	%i1,	%o7
	movrlz	%i7,	%l2,	%g2
	stx	%o4,	[%l7 + 0x50]
	fnor	%f8,	%f14,	%f26
	fnegd	%f16,	%f14
	movl	%icc,	%o0,	%o6
	srax	%i5,	0x07,	%l6
	stx	%o1,	[%l7 + 0x68]
	movg	%icc,	%l4,	%g5
	sdivx	%i0,	0x088B,	%l5
	movg	%icc,	%g6,	%g7
	sra	%i6,	%g4,	%i4
	edge32l	%o5,	%g3,	%g1
	movpos	%xcc,	%i3,	%o3
	movrlz	%l0,	0x150,	%l3
	subccc	%i2,	0x056C,	%o2
	fornot2	%f0,	%f0,	%f16
	movrgez	%l1,	0x23D,	%i1
	movgu	%icc,	%o7,	%l2
	movg	%xcc,	%i7,	%o4
	movcs	%icc,	%g2,	%o6
	ldsh	[%l7 + 0x0A],	%o0
	andn	%l6,	0x0548,	%o1
	popc	%l4,	%g5
	sll	%i0,	0x14,	%i5
	mulscc	%g6,	%g7,	%i6
	fcmple32	%f8,	%f24,	%l5
	fmovda	%icc,	%f23,	%f27
	subc	%g4,	0x0629,	%o5
	sll	%g3,	%g1,	%i4
	or	%o3,	0x18DD,	%l0
	mova	%xcc,	%i3,	%l3
	subccc	%i2,	0x02FE,	%o2
	stx	%l1,	[%l7 + 0x38]
	addc	%o7,	0x1644,	%i1
	stb	%l2,	[%l7 + 0x5A]
	fmuld8sux16	%f31,	%f10,	%f16
	edge16n	%o4,	%g2,	%i7
	mulx	%o0,	0x0BAE,	%o6
	fmovdl	%xcc,	%f11,	%f26
	ldd	[%l7 + 0x18],	%o0
	fmovsle	%icc,	%f7,	%f25
	edge32l	%l4,	%l6,	%i0
	fpadd32	%f16,	%f20,	%f14
	orcc	%i5,	%g5,	%g6
	sub	%i6,	0x0D1A,	%g7
	sir	0x022B
	lduh	[%l7 + 0x3C],	%l5
	subcc	%g4,	0x13F6,	%o5
	movvs	%icc,	%g3,	%i4
	srax	%g1,	%l0,	%o3
	xor	%i3,	%i2,	%o2
	edge8l	%l1,	%o7,	%l3
	array32	%i1,	%l2,	%o4
	array32	%i7,	%g2,	%o0
	umulcc	%o1,	%o6,	%l6
	orn	%l4,	0x1E46,	%i0
	std	%f16,	[%l7 + 0x20]
	sir	0x194A
	orcc	%i5,	0x1C2B,	%g6
	srl	%i6,	0x0B,	%g7
	sethi	0x00F3,	%l5
	sdiv	%g5,	0x1E4D,	%g4
	andcc	%o5,	%i4,	%g3
	alignaddr	%l0,	%o3,	%i3
	movcs	%xcc,	%i2,	%o2
	sir	0x1B76
	sdivx	%g1,	0x172B,	%o7
	edge32n	%l3,	%l1,	%l2
	std	%f14,	[%l7 + 0x20]
	lduh	[%l7 + 0x22],	%o4
	edge8l	%i7,	%i1,	%o0
	fcmpeq16	%f2,	%f26,	%g2
	alignaddrl	%o6,	%l6,	%l4
	movleu	%icc,	%i0,	%o1
	movge	%xcc,	%i5,	%g6
	sra	%i6,	%g7,	%l5
	alignaddrl	%g5,	%o5,	%i4
	st	%f21,	[%l7 + 0x0C]
	fmovsleu	%icc,	%f8,	%f9
	edge8n	%g3,	%l0,	%g4
	movvs	%xcc,	%i3,	%i2
	orcc	%o2,	0x06F6,	%g1
	fnot2s	%f23,	%f18
	movge	%xcc,	%o3,	%l3
	stw	%l1,	[%l7 + 0x18]
	xnorcc	%o7,	0x0BD1,	%o4
	mova	%icc,	%i7,	%i1
	orn	%o0,	%l2,	%g2
	sub	%o6,	%l4,	%i0
	xorcc	%l6,	0x0852,	%o1
	fxor	%f8,	%f26,	%f26
	addcc	%g6,	%i5,	%i6
	fmovrde	%g7,	%f0,	%f22
	ldsh	[%l7 + 0x42],	%g5
	fmovsneg	%xcc,	%f18,	%f24
	add	%l5,	%o5,	%i4
	smul	%l0,	%g4,	%g3
	edge32l	%i2,	%i3,	%g1
	fnegd	%f26,	%f16
	movg	%icc,	%o3,	%l3
	edge16l	%o2,	%o7,	%l1
	movneg	%xcc,	%o4,	%i7
	smulcc	%i1,	%l2,	%o0
	addc	%g2,	%l4,	%i0
	movrgz	%o6,	%o1,	%g6
	movl	%xcc,	%l6,	%i6
	movpos	%xcc,	%g7,	%g5
	udivx	%l5,	0x1007,	%i5
	andncc	%o5,	%i4,	%g4
	std	%f20,	[%l7 + 0x08]
	movvs	%icc,	%g3,	%i2
	std	%f10,	[%l7 + 0x50]
	fcmped	%fcc0,	%f24,	%f4
	edge16ln	%i3,	%g1,	%o3
	array16	%l0,	%l3,	%o2
	sth	%o7,	[%l7 + 0x76]
	fcmpd	%fcc0,	%f6,	%f2
	fmovsneg	%xcc,	%f4,	%f11
	andcc	%o4,	0x0483,	%l1
	fxors	%f29,	%f17,	%f15
	fmovsg	%icc,	%f28,	%f15
	movneg	%xcc,	%i1,	%l2
	or	%i7,	%g2,	%l4
	movpos	%icc,	%i0,	%o6
	fnot1s	%f27,	%f7
	or	%o0,	%o1,	%l6
	udivx	%i6,	0x1D60,	%g6
	ldsb	[%l7 + 0x43],	%g7
	fones	%f3
	subcc	%l5,	%i5,	%g5
	nop
	set	0x58, %l6
	lduh	[%l7 + %l6],	%i4
	addccc	%g4,	0x09EF,	%g3
	popc	0x1C3E,	%i2
	smul	%i3,	0x0ED9,	%o5
	srlx	%g1,	0x16,	%l0
	xorcc	%l3,	0x0EAB,	%o3
	andcc	%o2,	%o4,	%l1
	andncc	%o7,	%l2,	%i1
	sll	%i7,	%g2,	%i0
	subcc	%o6,	%o0,	%l4
	array16	%l6,	%o1,	%g6
	and	%g7,	0x0E9E,	%l5
	array8	%i6,	%i5,	%g5
	udivx	%i4,	0x080A,	%g3
	mulscc	%i2,	0x16F0,	%i3
	sth	%o5,	[%l7 + 0x7E]
	fmul8sux16	%f14,	%f4,	%f10
	fabsd	%f14,	%f2
	edge32	%g4,	%l0,	%l3
	edge32n	%o3,	%g1,	%o4
	movn	%xcc,	%o2,	%o7
	fcmple32	%f12,	%f16,	%l2
	fpsub16s	%f8,	%f26,	%f15
	edge8n	%l1,	%i1,	%g2
	fmul8x16al	%f27,	%f28,	%f22
	sth	%i0,	[%l7 + 0x2C]
	movrlz	%i7,	%o6,	%o0
	sdivcc	%l4,	0x018E,	%l6
	movne	%icc,	%g6,	%o1
	fmovsl	%xcc,	%f7,	%f14
	movleu	%icc,	%l5,	%i6
	srl	%i5,	0x1A,	%g7
	fmovsvs	%xcc,	%f15,	%f5
	array16	%g5,	%i4,	%i2
	sir	0x08E9
	fmovde	%icc,	%f7,	%f15
	andncc	%g3,	%o5,	%g4
	array32	%l0,	%i3,	%l3
	sth	%o3,	[%l7 + 0x2A]
	lduh	[%l7 + 0x50],	%g1
	movgu	%icc,	%o2,	%o7
	array32	%o4,	%l1,	%i1
	edge32n	%l2,	%g2,	%i7
	fmovsge	%icc,	%f26,	%f18
	sdiv	%o6,	0x0EAF,	%i0
	ld	[%l7 + 0x34],	%f11
	sethi	0x0690,	%l4
	fmovsle	%xcc,	%f10,	%f20
	movgu	%xcc,	%l6,	%o0
	xnorcc	%o1,	%g6,	%l5
	udivcc	%i5,	0x08B2,	%g7
	fmovdvs	%xcc,	%f14,	%f28
	nop
	set	0x30, %l4
	ldd	[%l7 + %l4],	%f4
	popc	%g5,	%i4
	andncc	%i2,	%g3,	%o5
	fxnors	%f8,	%f9,	%f9
	edge32	%g4,	%i6,	%i3
	ldd	[%l7 + 0x70],	%f28
	fmul8x16	%f1,	%f12,	%f0
	edge8l	%l0,	%l3,	%o3
	fmovrdgez	%g1,	%f12,	%f2
	popc	0x0217,	%o2
	xor	%o4,	0x10DD,	%o7
	edge32	%i1,	%l1,	%l2
	sethi	0x1E31,	%i7
	orcc	%g2,	0x1751,	%o6
	fmovs	%f31,	%f11
	movl	%xcc,	%l4,	%l6
	xnorcc	%i0,	%o0,	%g6
	ldd	[%l7 + 0x60],	%f10
	movneg	%xcc,	%o1,	%i5
	udivx	%l5,	0x1495,	%g7
	stx	%i4,	[%l7 + 0x08]
	ldub	[%l7 + 0x61],	%i2
	fmovrsgez	%g3,	%f21,	%f23
	movrgz	%g5,	0x36D,	%o5
	mova	%icc,	%g4,	%i3
	edge8l	%i6,	%l0,	%o3
	ldx	[%l7 + 0x10],	%l3
	fmovdpos	%xcc,	%f14,	%f15
	sir	0x0FC6
	and	%o2,	%g1,	%o4
	ldd	[%l7 + 0x10],	%f24
	fcmpes	%fcc3,	%f25,	%f13
	movge	%xcc,	%o7,	%l1
	sll	%l2,	%i1,	%i7
	srl	%g2,	0x1E,	%l4
	fmovda	%xcc,	%f3,	%f2
	fmovsge	%xcc,	%f15,	%f28
	movl	%icc,	%l6,	%o6
	orncc	%o0,	0x16EC,	%i0
	stb	%o1,	[%l7 + 0x41]
	fmovsa	%icc,	%f21,	%f1
	movneg	%xcc,	%i5,	%g6
	xnor	%l5,	%i4,	%g7
	movvc	%xcc,	%g3,	%g5
	sub	%o5,	0x1829,	%g4
	fxnors	%f25,	%f13,	%f25
	add	%i2,	0x05BE,	%i6
	sll	%i3,	0x0A,	%o3
	movge	%xcc,	%l3,	%l0
	xnor	%o2,	0x1205,	%o4
	edge16l	%g1,	%o7,	%l1
	xnor	%l2,	%i7,	%g2
	udivcc	%i1,	0x17E4,	%l4
	fmovdvc	%icc,	%f8,	%f30
	fand	%f4,	%f6,	%f16
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	stx	%i0,	[%l7 + 0x30]
	umulcc	%o0,	0x046A,	%o1
	fmovse	%icc,	%f14,	%f15
	fmovrdgez	%g6,	%f8,	%f2
	mova	%icc,	%i5,	%l5
	srlx	%i4,	%g3,	%g7
	fnands	%f4,	%f25,	%f30
	orncc	%g5,	0x0916,	%o5
	fpmerge	%f12,	%f19,	%f0
	fmovsvs	%icc,	%f23,	%f25
	andcc	%i2,	%g4,	%i3
	movcc	%xcc,	%o3,	%l3
	movn	%icc,	%l0,	%i6
	save %o4, %o2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f4
	nop
	set	0x50, %o0
	ldub	[%l7 + %o0],	%l1
	subccc	%l2,	%i7,	%g1
	fcmpgt32	%f14,	%f22,	%g2
	mulx	%l4,	%i1,	%o6
	sllx	%l6,	%o0,	%o1
	fmovsl	%icc,	%f9,	%f5
	srax	%g6,	%i5,	%l5
	xorcc	%i0,	0x09DC,	%i4
	andncc	%g7,	%g5,	%g3
	subc	%o5,	0x1F0E,	%i2
	st	%f2,	[%l7 + 0x54]
	xorcc	%g4,	0x1223,	%o3
	movle	%icc,	%l3,	%l0
	popc	%i6,	%i3
	lduh	[%l7 + 0x6C],	%o2
	fmovrslez	%o4,	%f26,	%f4
	fcmped	%fcc2,	%f26,	%f20
	movrgz	%o7,	0x201,	%l1
	fors	%f1,	%f26,	%f21
	addcc	%l2,	0x1C6A,	%g1
	sir	0x15EF
	edge32	%g2,	%i7,	%l4
	fexpand	%f11,	%f26
	movle	%icc,	%o6,	%l6
	subcc	%i1,	%o1,	%o0
	srlx	%g6,	0x17,	%i5
	fandnot1s	%f29,	%f29,	%f15
	xnorcc	%i0,	%i4,	%l5
	movcs	%xcc,	%g5,	%g3
	for	%f18,	%f16,	%f6
	sll	%o5,	%i2,	%g4
	movrgez	%o3,	0x339,	%l3
	xnor	%g7,	0x11BC,	%i6
	ldsb	[%l7 + 0x7B],	%i3
	xnor	%o2,	%l0,	%o4
	movl	%icc,	%l1,	%o7
	movle	%icc,	%l2,	%g2
	umul	%g1,	%i7,	%o6
	alignaddrl	%l4,	%l6,	%i1
	fcmple16	%f30,	%f24,	%o1
	sdivcc	%g6,	0x016A,	%i5
	movvc	%icc,	%o0,	%i0
	sllx	%i4,	0x02,	%g5
	edge16ln	%l5,	%o5,	%i2
	fxnors	%f5,	%f26,	%f1
	movrlez	%g3,	%g4,	%l3
	sdivcc	%g7,	0x12A4,	%o3
	smulcc	%i3,	%i6,	%o2
	fpadd16	%f0,	%f6,	%f18
	orn	%o4,	%l0,	%l1
	movrlz	%o7,	0x215,	%g2
	edge16l	%g1,	%l2,	%o6
	fors	%f27,	%f30,	%f13
	smulcc	%i7,	%l6,	%l4
	fpsub16s	%f18,	%f30,	%f10
	st	%f26,	[%l7 + 0x44]
	mova	%icc,	%o1,	%i1
	move	%xcc,	%g6,	%o0
	addccc	%i0,	0x00A9,	%i4
	edge16n	%g5,	%l5,	%i5
	smulcc	%o5,	0x1998,	%i2
	stb	%g4,	[%l7 + 0x0C]
	movneg	%icc,	%g3,	%g7
	movrgz	%o3,	%l3,	%i6
	movrgz	%i3,	%o4,	%l0
	edge32ln	%l1,	%o2,	%g2
	stb	%g1,	[%l7 + 0x0D]
	sdivx	%o7,	0x04B7,	%l2
	sdivcc	%i7,	0x0951,	%o6
	sll	%l4,	%l6,	%i1
	ldx	[%l7 + 0x38],	%g6
	fxnor	%f18,	%f30,	%f30
	sethi	0x0B50,	%o1
	lduw	[%l7 + 0x74],	%o0
	sll	%i0,	%i4,	%l5
	edge16	%g5,	%o5,	%i5
	movl	%icc,	%g4,	%i2
	st	%f22,	[%l7 + 0x3C]
	edge16ln	%g3,	%o3,	%g7
	movl	%icc,	%i6,	%i3
	st	%f26,	[%l7 + 0x54]
	fmovsge	%xcc,	%f20,	%f5
	ldsw	[%l7 + 0x50],	%o4
	movleu	%xcc,	%l3,	%l1
	movrgz	%l0,	%o2,	%g2
	fones	%f0
	fands	%f26,	%f23,	%f0
	array16	%o7,	%l2,	%g1
	fmovs	%f30,	%f21
	array32	%o6,	%l4,	%l6
	array32	%i1,	%g6,	%o1
	movrgez	%o0,	%i7,	%i4
	and	%i0,	%g5,	%o5
	xor	%i5,	%g4,	%l5
	popc	0x0FC3,	%g3
	array16	%i2,	%o3,	%g7
	ld	[%l7 + 0x14],	%f19
	movl	%icc,	%i3,	%o4
	st	%f15,	[%l7 + 0x0C]
	mova	%xcc,	%l3,	%l1
	orcc	%i6,	%o2,	%l0
	udiv	%g2,	0x1B80,	%o7
	orcc	%l2,	0x1AAD,	%g1
	movrne	%o6,	%l6,	%l4
	ld	[%l7 + 0x48],	%f0
	smulcc	%g6,	0x0D7A,	%o1
	lduh	[%l7 + 0x4C],	%i1
	or	%o0,	%i4,	%i7
	fmovsa	%icc,	%f0,	%f0
	edge32l	%g5,	%i0,	%i5
	sdiv	%g4,	0x05A1,	%o5
	movg	%icc,	%g3,	%i2
	subc	%o3,	%l5,	%i3
	ldub	[%l7 + 0x57],	%o4
	fmovrdlez	%l3,	%f8,	%f2
	sethi	0x1A1F,	%g7
	addccc	%l1,	%i6,	%o2
	fmovda	%xcc,	%f12,	%f21
	fnors	%f4,	%f22,	%f8
	movrlz	%l0,	0x26B,	%o7
	edge16ln	%g2,	%l2,	%o6
	fsrc1	%f8,	%f18
	movleu	%icc,	%g1,	%l4
	movcs	%xcc,	%g6,	%o1
	movl	%icc,	%i1,	%o0
	ldsw	[%l7 + 0x10],	%l6
	movgu	%icc,	%i4,	%i7
	subccc	%g5,	%i5,	%g4
	andcc	%i0,	%g3,	%i2
	movn	%icc,	%o5,	%l5
	sth	%i3,	[%l7 + 0x3E]
	edge32n	%o3,	%l3,	%g7
	edge16ln	%l1,	%o4,	%o2
	edge32	%l0,	%o7,	%i6
	mulx	%g2,	0x05ED,	%o6
	fcmpes	%fcc1,	%f5,	%f7
	nop
	set	0x68, %g4
	ldsh	[%l7 + %g4],	%l2
	orcc	%g1,	%l4,	%g6
	movleu	%xcc,	%o1,	%o0
	movneg	%icc,	%l6,	%i4
	addc	%i1,	%g5,	%i5
	sir	0x0211
	ldd	[%l7 + 0x30],	%f18
	for	%f20,	%f18,	%f6
	andn	%i7,	0x14ED,	%i0
	fzero	%f10
	array16	%g3,	%g4,	%i2
	fornot1	%f30,	%f6,	%f20
	fmovsg	%xcc,	%f24,	%f25
	move	%xcc,	%o5,	%i3
	fcmpeq16	%f28,	%f6,	%o3
	ldd	[%l7 + 0x60],	%l2
	umul	%l5,	0x0EA8,	%l1
	andcc	%g7,	0x1CF7,	%o2
	fnegd	%f22,	%f6
	fmovdcc	%icc,	%f11,	%f21
	nop
	set	0x56, %i5
	ldsh	[%l7 + %i5],	%o4
	nop
	set	0x6A, %l3
	ldsb	[%l7 + %l3],	%o7
	movrne	%l0,	%i6,	%g2
	addc	%l2,	0x0CBF,	%g1
	fandnot2	%f16,	%f4,	%f28
	ldd	[%l7 + 0x20],	%o6
	movrne	%l4,	0x15D,	%g6
	stw	%o1,	[%l7 + 0x40]
	andn	%l6,	%i4,	%o0
	edge8	%g5,	%i1,	%i7
	fones	%f1
	fpack32	%f10,	%f26,	%f28
	popc	0x190F,	%i5
	array8	%g3,	%i0,	%g4
	fnegd	%f26,	%f18
	fmovsa	%xcc,	%f25,	%f1
	udiv	%o5,	0x0554,	%i2
	lduh	[%l7 + 0x78],	%o3
	udivx	%i3,	0x0A5C,	%l5
	umul	%l3,	0x0290,	%l1
	stb	%o2,	[%l7 + 0x46]
	sub	%o4,	%g7,	%o7
	mulx	%l0,	0x1EA1,	%i6
	movvc	%xcc,	%l2,	%g2
	movge	%icc,	%o6,	%l4
	udivcc	%g6,	0x0E8B,	%g1
	movrlz	%l6,	0x1EA,	%o1
	srax	%o0,	0x16,	%i4
	edge16	%g5,	%i1,	%i5
	umulcc	%g3,	0x1A75,	%i0
	movle	%xcc,	%i7,	%o5
	sir	0x1236
	fones	%f0
	sir	0x147A
	smul	%g4,	%i2,	%o3
	mova	%xcc,	%i3,	%l5
	fmul8x16	%f30,	%f22,	%f18
	movrne	%l3,	%o2,	%o4
	edge8ln	%l1,	%o7,	%l0
	xnorcc	%g7,	%l2,	%g2
	fmul8x16al	%f26,	%f14,	%f4
	sir	0x1628
	subccc	%o6,	0x0348,	%i6
	movrne	%g6,	%g1,	%l6
	fmovrdlez	%o1,	%f2,	%f24
	array32	%o0,	%i4,	%g5
	edge8l	%i1,	%i5,	%l4
	movneg	%xcc,	%i0,	%i7
	fmovrdgez	%g3,	%f20,	%f12
	sth	%g4,	[%l7 + 0x48]
	movvs	%xcc,	%i2,	%o3
	movgu	%xcc,	%o5,	%l5
	fmovrdlz	%i3,	%f0,	%f28
	fabss	%f15,	%f0
	std	%f16,	[%l7 + 0x50]
	fcmpne32	%f12,	%f24,	%l3
	ldsb	[%l7 + 0x41],	%o4
	movl	%icc,	%o2,	%o7
	fpadd16	%f12,	%f6,	%f10
	add	%l0,	0x1DC7,	%g7
	movrlz	%l1,	%l2,	%o6
	edge8n	%g2,	%g6,	%g1
	movvc	%icc,	%i6,	%o1
	stw	%o0,	[%l7 + 0x24]
	sra	%l6,	%g5,	%i1
	movle	%xcc,	%i5,	%l4
	fmovrde	%i4,	%f8,	%f2
	xnor	%i0,	%i7,	%g4
	stb	%i2,	[%l7 + 0x47]
	srl	%o3,	%o5,	%g3
	fmul8x16au	%f0,	%f31,	%f28
	orncc	%l5,	0x027A,	%l3
	xor	%i3,	%o4,	%o7
	edge16	%o2,	%l0,	%g7
	movrne	%l2,	0x1A3,	%l1
	sdivcc	%g2,	0x0CA9,	%o6
	edge16ln	%g1,	%i6,	%o1
	srax	%g6,	0x15,	%l6
	fmovdl	%xcc,	%f2,	%f13
	movre	%o0,	%i1,	%i5
	orncc	%l4,	0x03C7,	%i4
	fcmpeq32	%f8,	%f20,	%g5
	fmovsl	%xcc,	%f6,	%f22
	movre	%i7,	0x347,	%g4
	movrgez	%i0,	0x186,	%o3
	umul	%o5,	0x0B88,	%i2
	fnegd	%f2,	%f24
	lduw	[%l7 + 0x38],	%g3
	sll	%l5,	0x11,	%i3
	movne	%icc,	%l3,	%o4
	mova	%xcc,	%o7,	%l0
	umul	%o2,	0x08F7,	%g7
	ldsw	[%l7 + 0x6C],	%l2
	fmul8x16au	%f25,	%f0,	%f2
	movle	%xcc,	%l1,	%g2
	lduw	[%l7 + 0x08],	%g1
	edge8	%o6,	%i6,	%g6
	udivx	%l6,	0x043F,	%o1
	ldsh	[%l7 + 0x38],	%o0
	movl	%xcc,	%i1,	%i5
	movrne	%i4,	0x033,	%l4
	fmovsneg	%icc,	%f14,	%f15
	array32	%g5,	%g4,	%i0
	stb	%o3,	[%l7 + 0x0B]
	edge16l	%i7,	%o5,	%i2
	andn	%g3,	0x1111,	%l5
	movl	%xcc,	%i3,	%o4
	fornot2s	%f6,	%f7,	%f28
	movrlez	%l3,	0x024,	%l0
	sra	%o7,	%g7,	%o2
	edge16	%l1,	%l2,	%g2
	fmovs	%f27,	%f16
	sub	%g1,	%o6,	%i6
	edge8n	%g6,	%l6,	%o1
	addc	%o0,	0x1822,	%i1
	fmovrse	%i4,	%f27,	%f18
	edge32n	%l4,	%i5,	%g5
	movvc	%icc,	%g4,	%o3
	fpadd16s	%f9,	%f3,	%f11
	fmul8ulx16	%f6,	%f4,	%f2
	movl	%xcc,	%i0,	%o5
	fcmped	%fcc0,	%f14,	%f2
	sra	%i2,	%i7,	%g3
	mulscc	%i3,	%o4,	%l5
	alignaddr	%l3,	%o7,	%g7
	fmovse	%xcc,	%f21,	%f29
	array32	%l0,	%l1,	%o2
	nop
	set	0x47, %l1
	ldsb	[%l7 + %l1],	%l2
	movrgz	%g2,	0x075,	%g1
	movcc	%xcc,	%i6,	%o6
	orncc	%l6,	0x084D,	%g6
	subc	%o0,	%i1,	%o1
	fmovdvc	%xcc,	%f21,	%f25
	edge16n	%i4,	%l4,	%g5
	xnorcc	%g4,	%o3,	%i0
	sdiv	%o5,	0x1E0B,	%i5
	popc	%i2,	%g3
	orcc	%i3,	%i7,	%o4
	movrlz	%l3,	0x1B2,	%l5
	fxors	%f8,	%f22,	%f17
	alignaddr	%g7,	%l0,	%o7
	addcc	%l1,	0x1DCA,	%o2
	udivcc	%l2,	0x0D7F,	%g2
	sllx	%i6,	0x0E,	%g1
	edge8l	%o6,	%g6,	%o0
	addc	%l6,	0x0D0A,	%o1
	srax	%i4,	0x00,	%l4
	movleu	%xcc,	%i1,	%g5
	ldsb	[%l7 + 0x61],	%o3
	movgu	%xcc,	%i0,	%g4
	orn	%o5,	0x0BE0,	%i2
	addc	%i5,	0x098A,	%g3
	movg	%icc,	%i3,	%i7
	xor	%o4,	0x1898,	%l5
	movpos	%icc,	%l3,	%l0
	xor	%g7,	%l1,	%o7
	andn	%o2,	%l2,	%i6
	movre	%g1,	0x293,	%o6
	srax	%g2,	%g6,	%o0
	movneg	%xcc,	%l6,	%o1
	addcc	%i4,	%i1,	%g5
	andcc	%l4,	0x015E,	%i0
	fcmpne32	%f28,	%f30,	%o3
	srlx	%g4,	%i2,	%i5
	sth	%g3,	[%l7 + 0x78]
	xor	%i3,	0x151D,	%i7
	smul	%o4,	%o5,	%l5
	fcmped	%fcc0,	%f24,	%f6
	movrlz	%l3,	0x359,	%l0
	edge32	%l1,	%o7,	%o2
	std	%f2,	[%l7 + 0x18]
	fnot1s	%f14,	%f19
	stb	%g7,	[%l7 + 0x53]
	nop
	set	0x70, %l5
	std	%f16,	[%l7 + %l5]
	or	%l2,	0x0AC7,	%g1
	movcc	%xcc,	%i6,	%o6
	sdiv	%g6,	0x0836,	%g2
	sub	%o0,	0x02ED,	%l6
	movcs	%xcc,	%o1,	%i1
	fmovrdgz	%i4,	%f10,	%f4
	addccc	%g5,	0x1037,	%l4
	fnot2s	%f28,	%f17
	ldsh	[%l7 + 0x28],	%i0
	orcc	%o3,	%i2,	%g4
	subc	%g3,	0x17C4,	%i3
	subcc	%i5,	%o4,	%o5
	fnors	%f12,	%f23,	%f9
	sth	%l5,	[%l7 + 0x5E]
	movvc	%icc,	%i7,	%l0
	movn	%icc,	%l3,	%l1
	edge32	%o7,	%o2,	%g7
	fmovsvc	%icc,	%f13,	%f26
	edge16n	%l2,	%g1,	%i6
	fcmpeq16	%f20,	%f18,	%o6
	ldd	[%l7 + 0x78],	%g2
	fnegd	%f20,	%f30
	fmovrdne	%o0,	%f22,	%f6
	addcc	%g6,	%o1,	%i1
	ldd	[%l7 + 0x40],	%i6
	ldub	[%l7 + 0x1A],	%i4
	xnor	%g5,	0x0DBD,	%l4
	subc	%o3,	0x09A8,	%i0
	movl	%xcc,	%i2,	%g3
	fmovsl	%icc,	%f4,	%f21
	movle	%xcc,	%g4,	%i5
	andncc	%i3,	%o5,	%l5
	fmovsgu	%xcc,	%f30,	%f21
	fmovdpos	%xcc,	%f18,	%f4
	fmovdge	%icc,	%f13,	%f20
	fmovsleu	%icc,	%f9,	%f2
	smulcc	%i7,	0x0D4E,	%o4
	subc	%l0,	%l3,	%l1
	fabsd	%f28,	%f20
	movleu	%icc,	%o2,	%o7
	orn	%g7,	0x0359,	%g1
	sdiv	%l2,	0x1BCA,	%i6
	fmovs	%f25,	%f29
	sub	%o6,	%o0,	%g6
	fpsub16	%f24,	%f10,	%f16
	udiv	%o1,	0x0F4D,	%g2
	edge8n	%i1,	%i4,	%l6
	edge32n	%l4,	%g5,	%i0
	andn	%o3,	%g3,	%g4
	movcs	%xcc,	%i2,	%i5
	ldd	[%l7 + 0x68],	%f18
	edge32ln	%i3,	%l5,	%o5
	ldsw	[%l7 + 0x0C],	%i7
	subc	%l0,	0x1A28,	%l3
	or	%o4,	%o2,	%l1
	movre	%o7,	0x202,	%g7
	sdivcc	%g1,	0x1526,	%l2
	fmovsvs	%icc,	%f18,	%f23
	movrlez	%o6,	0x1F0,	%o0
	restore %i6, 0x10D4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g2,	0x0AFB,	%i1
	edge16ln	%g6,	%l6,	%i4
	ldx	[%l7 + 0x58],	%l4
	fmovsn	%icc,	%f5,	%f21
	sth	%i0,	[%l7 + 0x70]
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	ldsw	[%l7 + 0x44],	%g4
	ld	[%l7 + 0x18],	%f7
	xnor	%g5,	0x0692,	%i2
	srl	%i3,	0x1E,	%i5
	ldsw	[%l7 + 0x44],	%l5
	sethi	0x1A1B,	%o5
	fmovscc	%xcc,	%f4,	%f5
	fpadd32s	%f14,	%f16,	%f26
	orncc	%i7,	0x0519,	%l3
	subcc	%l0,	%o2,	%l1
	andcc	%o4,	%g7,	%o7
	srl	%l2,	%o6,	%o0
	ldd	[%l7 + 0x08],	%g0
	ld	[%l7 + 0x78],	%f31
	movcs	%icc,	%o1,	%i6
	sll	%g2,	0x06,	%i1
	array8	%l6,	%i4,	%l4
	fand	%f4,	%f18,	%f2
	fmovsa	%icc,	%f21,	%f12
	or	%g6,	%i0,	%o3
	movre	%g3,	%g4,	%g5
	edge16	%i3,	%i5,	%i2
	addcc	%o5,	%l5,	%i7
	ldd	[%l7 + 0x38],	%l0
	movre	%l3,	0x1CD,	%o2
	umul	%l1,	0x0E5A,	%g7
	movpos	%icc,	%o7,	%o4
	fcmps	%fcc1,	%f28,	%f28
	xorcc	%o6,	0x1A2F,	%o0
	ldd	[%l7 + 0x18],	%f4
	fmovdge	%icc,	%f5,	%f6
	subc	%g1,	0x038D,	%o1
	edge8l	%i6,	%l2,	%g2
	fpsub32	%f28,	%f10,	%f6
	addccc	%i1,	%l6,	%i4
	fmovscs	%icc,	%f10,	%f18
	movcs	%xcc,	%l4,	%g6
	ld	[%l7 + 0x24],	%f2
	array8	%i0,	%o3,	%g4
	edge8n	%g3,	%g5,	%i5
	xorcc	%i2,	0x13C7,	%o5
	xnor	%i3,	%l5,	%i7
	movleu	%icc,	%l3,	%o2
	array32	%l1,	%l0,	%o7
	fmovrdgz	%o4,	%f16,	%f30
	stw	%o6,	[%l7 + 0x1C]
	edge8ln	%g7,	%o0,	%g1
	sll	%i6,	%l2,	%o1
	sdivx	%i1,	0x1135,	%g2
	stw	%l6,	[%l7 + 0x50]
	fcmpd	%fcc0,	%f24,	%f18
	array8	%l4,	%i4,	%g6
	std	%f24,	[%l7 + 0x18]
	sra	%o3,	%g4,	%g3
	fmovrsgz	%i0,	%f11,	%f31
	orncc	%g5,	0x15A5,	%i2
	array8	%i5,	%i3,	%o5
	fcmpd	%fcc3,	%f26,	%f12
	movvs	%icc,	%i7,	%l5
	fmovsn	%xcc,	%f22,	%f0
	orcc	%o2,	%l1,	%l0
	xor	%l3,	0x074C,	%o4
	movl	%xcc,	%o6,	%g7
	edge32n	%o0,	%o7,	%g1
	std	%f20,	[%l7 + 0x40]
	mova	%xcc,	%i6,	%o1
	ldsh	[%l7 + 0x7A],	%l2
	edge16ln	%i1,	%l6,	%g2
	fpadd16	%f28,	%f0,	%f8
	ld	[%l7 + 0x10],	%f14
	xorcc	%i4,	0x1F9B,	%l4
	fmovdn	%icc,	%f18,	%f16
	fornot2s	%f27,	%f0,	%f22
	srlx	%g6,	0x08,	%g4
	xnorcc	%o3,	0x034D,	%g3
	fnot1	%f2,	%f22
	ldsh	[%l7 + 0x28],	%i0
	fpadd16	%f4,	%f30,	%f12
	sll	%i2,	0x03,	%g5
	fnor	%f0,	%f30,	%f6
	fones	%f6
	edge32l	%i5,	%o5,	%i3
	addccc	%i7,	%o2,	%l5
	edge16	%l1,	%l0,	%o4
	movcc	%xcc,	%l3,	%o6
	andncc	%g7,	%o0,	%g1
	fone	%f22
	add	%i6,	%o7,	%l2
	udivx	%o1,	0x1800,	%i1
	smulcc	%g2,	0x096F,	%l6
	udiv	%i4,	0x03AC,	%l4
	stb	%g6,	[%l7 + 0x17]
	popc	%g4,	%g3
	srlx	%o3,	0x0B,	%i0
	addc	%i2,	%g5,	%o5
	popc	0x1225,	%i3
	subcc	%i5,	%i7,	%l5
	movrlez	%o2,	%l0,	%l1
	stx	%o4,	[%l7 + 0x18]
	edge32	%o6,	%g7,	%l3
	edge8l	%g1,	%i6,	%o7
	fmovda	%xcc,	%f25,	%f19
	stb	%o0,	[%l7 + 0x2D]
	ldx	[%l7 + 0x68],	%l2
	subc	%o1,	0x17A0,	%i1
	edge16n	%g2,	%i4,	%l6
	movrlez	%l4,	0x3F9,	%g6
	movrgz	%g4,	0x0E0,	%o3
	popc	0x0FCD,	%g3
	smul	%i2,	0x1B1D,	%i0
	movvc	%icc,	%o5,	%g5
	restore %i5, %i3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i7,	0x0035,	%o2
	edge8ln	%l0,	%o4,	%o6
	fmovdle	%icc,	%f10,	%f10
	ldsw	[%l7 + 0x24],	%l1
	movrgz	%g7,	0x27F,	%l3
	movrgz	%i6,	%g1,	%o7
	sll	%o0,	0x03,	%o1
	movcs	%xcc,	%i1,	%g2
	movrne	%i4,	0x112,	%l2
	addccc	%l6,	0x0BB0,	%g6
	lduw	[%l7 + 0x30],	%l4
	sll	%o3,	0x17,	%g3
	edge16ln	%g4,	%i2,	%i0
	srlx	%g5,	%o5,	%i5
	edge8n	%l5,	%i7,	%i3
	mulx	%o2,	0x1CA7,	%l0
	xnor	%o4,	0x0F3F,	%l1
	fzero	%f18
	move	%icc,	%o6,	%g7
	sllx	%l3,	0x1C,	%i6
	save %o7, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x38],	%o1
	addc	%g2,	0x0715,	%i1
	save %i4, 0x0013, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g6,	%l4
	ldsw	[%l7 + 0x60],	%o3
	orcc	%l2,	0x1999,	%g3
	ldsh	[%l7 + 0x10],	%i2
	stx	%i0,	[%l7 + 0x58]
	movrgez	%g5,	%g4,	%i5
	save %o5, 0x0862, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	%o2,	%i3
	movrne	%l0,	%l1,	%o4
	edge8l	%g7,	%l3,	%o6
	fxnor	%f26,	%f28,	%f14
	movrlz	%o7,	0x3F9,	%i6
	srl	%o0,	%g1,	%o1
	edge16ln	%i1,	%g2,	%l6
	movrgez	%g6,	0x3DF,	%i4
	movneg	%icc,	%o3,	%l2
	movgu	%xcc,	%l4,	%g3
	fmul8x16	%f8,	%f16,	%f0
	movgu	%icc,	%i2,	%g5
	movpos	%icc,	%i0,	%g4
	alignaddrl	%o5,	%i5,	%i7
	andncc	%o2,	%i3,	%l5
	fcmpeq16	%f26,	%f2,	%l1
	st	%f3,	[%l7 + 0x68]
	fmovdn	%icc,	%f11,	%f21
	array8	%o4,	%g7,	%l3
	fmovdg	%xcc,	%f12,	%f22
	sub	%o6,	%l0,	%i6
	fzero	%f24
	movrgez	%o7,	0x2DC,	%g1
	fsrc2	%f20,	%f14
	ldd	[%l7 + 0x28],	%f0
	srl	%o0,	0x14,	%o1
	fornot1s	%f18,	%f13,	%f19
	bshuffle	%f2,	%f24,	%f18
	edge32l	%g2,	%l6,	%g6
	movrlz	%i4,	%i1,	%o3
	movne	%xcc,	%l4,	%l2
	edge32l	%i2,	%g3,	%g5
	movle	%icc,	%i0,	%g4
	srlx	%o5,	0x1B,	%i7
	srax	%i5,	0x1A,	%o2
	movpos	%icc,	%i3,	%l5
	movrgez	%l1,	0x001,	%g7
	lduw	[%l7 + 0x78],	%o4
	umulcc	%o6,	%l3,	%l0
	andncc	%o7,	%i6,	%o0
	udiv	%g1,	0x0C9F,	%g2
	sth	%l6,	[%l7 + 0x5A]
	sdivx	%o1,	0x081E,	%i4
	movl	%icc,	%g6,	%o3
	edge32ln	%i1,	%l2,	%l4
	fmovrse	%g3,	%f25,	%f2
	srl	%i2,	%i0,	%g4
	sra	%o5,	%g5,	%i7
	alignaddrl	%i5,	%i3,	%l5
	fmovsg	%icc,	%f30,	%f17
	umulcc	%o2,	%l1,	%g7
	orncc	%o4,	0x1A16,	%o6
	movneg	%icc,	%l0,	%l3
	fmovdl	%icc,	%f19,	%f26
	fpack32	%f22,	%f28,	%f22
	subccc	%i6,	%o0,	%o7
	fmovrdgz	%g2,	%f30,	%f6
	ldub	[%l7 + 0x19],	%l6
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	fmul8sux16	%f18,	%f14,	%f6
	edge32ln	%g1,	%o3,	%i1
	fmovrsgez	%l2,	%f20,	%f27
	movne	%icc,	%l4,	%i2
	srl	%i0,	0x1C,	%g4
	fpackfix	%f16,	%f14
	movcc	%icc,	%g3,	%o5
	subc	%g5,	%i7,	%i5
	fmovdn	%xcc,	%f29,	%f31
	xorcc	%i3,	%l5,	%l1
	edge16n	%o2,	%o4,	%g7
	sth	%l0,	[%l7 + 0x64]
	addc	%l3,	%o6,	%i6
	ldub	[%l7 + 0x38],	%o7
	fpsub32s	%f25,	%f19,	%f13
	ldsw	[%l7 + 0x4C],	%g2
	fones	%f12
	movpos	%xcc,	%o0,	%o1
	udivx	%i4,	0x0E8D,	%l6
	fmovrslz	%g6,	%f1,	%f15
	umulcc	%o3,	0x0237,	%i1
	movcs	%xcc,	%l2,	%g1
	edge32	%i2,	%l4,	%i0
	movcs	%icc,	%g3,	%g4
	orncc	%o5,	0x011A,	%g5
	fnand	%f10,	%f20,	%f28
	edge32ln	%i7,	%i3,	%i5
	and	%l5,	%l1,	%o2
	movle	%icc,	%g7,	%o4
	sll	%l3,	0x16,	%l0
	fmovd	%f22,	%f26
	std	%f20,	[%l7 + 0x08]
	fmovdn	%xcc,	%f9,	%f6
	fmovsl	%icc,	%f27,	%f20
	edge32ln	%i6,	%o6,	%o7
	alignaddrl	%o0,	%o1,	%g2
	fmovsg	%icc,	%f16,	%f26
	xorcc	%l6,	0x1917,	%g6
	movn	%xcc,	%i4,	%i1
	ldsh	[%l7 + 0x46],	%o3
	restore %g1, %l2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc2,	%f28,	%f1
	bshuffle	%f30,	%f6,	%f2
	umulcc	%i2,	%i0,	%g3
	sdiv	%o5,	0x0211,	%g4
	edge8l	%g5,	%i7,	%i3
	umul	%l5,	%i5,	%o2
	movrgez	%l1,	0x213,	%g7
	mulscc	%l3,	0x199F,	%l0
	udivx	%i6,	0x04DD,	%o6
	sethi	0x0E18,	%o7
	addc	%o4,	%o1,	%g2
	popc	0x0EAB,	%l6
	fmul8sux16	%f18,	%f26,	%f30
	udivcc	%o0,	0x0805,	%g6
	subc	%i4,	%i1,	%g1
	fmovdcs	%xcc,	%f17,	%f6
	sll	%l2,	%l4,	%o3
	smulcc	%i2,	0x0E3C,	%g3
	edge16n	%o5,	%i0,	%g5
	fsrc1s	%f24,	%f12
	stb	%i7,	[%l7 + 0x23]
	ldsh	[%l7 + 0x28],	%g4
	nop
	set	0x78, %g6
	ldx	[%l7 + %g6],	%i3
	nop
	set	0x30, %o4
	ldx	[%l7 + %o4],	%i5
	addc	%l5,	%l1,	%o2
	smulcc	%g7,	%l3,	%l0
	sdivx	%o6,	0x0EF6,	%i6
	sub	%o4,	0x0701,	%o7
	edge8l	%o1,	%g2,	%l6
	array16	%o0,	%g6,	%i4
	fcmple16	%f28,	%f20,	%i1
	movrlz	%l2,	0x00C,	%g1
	subcc	%o3,	%i2,	%g3
	andn	%o5,	0x0F83,	%l4
	fornot1	%f4,	%f14,	%f12
	edge32	%g5,	%i0,	%g4
	stb	%i3,	[%l7 + 0x78]
	sdiv	%i7,	0x12A6,	%l5
	array8	%i5,	%l1,	%g7
	xnorcc	%l3,	0x104C,	%l0
	sir	0x0D33
	orn	%o2,	%o6,	%i6
	st	%f8,	[%l7 + 0x20]
	andn	%o4,	%o7,	%o1
	alignaddrl	%g2,	%o0,	%g6
	ldsb	[%l7 + 0x77],	%l6
	fone	%f0
	std	%f12,	[%l7 + 0x58]
	fmovrslz	%i1,	%f9,	%f25
	ldsw	[%l7 + 0x2C],	%i4
	edge32	%l2,	%g1,	%o3
	ldd	[%l7 + 0x38],	%g2
	xorcc	%o5,	0x04A9,	%i2
	movne	%xcc,	%l4,	%g5
	smul	%i0,	0x044E,	%g4
	addcc	%i3,	0x05D1,	%l5
	stw	%i7,	[%l7 + 0x10]
	and	%l1,	0x167D,	%g7
	sir	0x17FC
	fzeros	%f29
	edge32ln	%i5,	%l3,	%l0
	smul	%o2,	0x078A,	%i6
	fmul8x16	%f7,	%f10,	%f2
	lduw	[%l7 + 0x28],	%o6
	fcmps	%fcc1,	%f1,	%f9
	ldsb	[%l7 + 0x26],	%o7
	fnors	%f0,	%f16,	%f5
	fnegd	%f20,	%f22
	siam	0x3
	sdiv	%o4,	0x040D,	%g2
	fxnor	%f6,	%f2,	%f2
	sethi	0x02B9,	%o1
	fmovdpos	%icc,	%f21,	%f18
	sub	%g6,	%o0,	%i1
	movne	%xcc,	%i4,	%l6
	xor	%g1,	%o3,	%l2
	fxor	%f16,	%f28,	%f8
	mulx	%g3,	0x1845,	%o5
	fpadd32s	%f18,	%f13,	%f5
	movleu	%xcc,	%l4,	%i2
	array32	%i0,	%g4,	%g5
	ldsh	[%l7 + 0x12],	%i3
	movvc	%xcc,	%i7,	%l5
	alignaddr	%l1,	%g7,	%l3
	udiv	%l0,	0x1646,	%i5
	edge8n	%o2,	%o6,	%i6
	fmovrslez	%o4,	%f24,	%f1
	sth	%o7,	[%l7 + 0x36]
	movcc	%icc,	%o1,	%g2
	fandnot2s	%f21,	%f22,	%f0
	sllx	%o0,	0x0F,	%g6
	fcmpne32	%f0,	%f16,	%i4
	movvs	%xcc,	%i1,	%l6
	ldsw	[%l7 + 0x58],	%g1
	sll	%o3,	0x04,	%g3
	edge16n	%o5,	%l4,	%l2
	fmovsl	%icc,	%f26,	%f9
	movvc	%icc,	%i0,	%g4
	fmovdneg	%icc,	%f10,	%f15
	xorcc	%i2,	%g5,	%i3
	sethi	0x0CAF,	%i7
	movrne	%l5,	%g7,	%l1
	andcc	%l3,	%i5,	%l0
	movn	%icc,	%o2,	%i6
	movneg	%icc,	%o6,	%o7
	fcmpeq16	%f4,	%f6,	%o4
	fzeros	%f0
	move	%icc,	%o1,	%g2
	fmovdle	%xcc,	%f1,	%f31
	add	%o0,	%i4,	%g6
	fpackfix	%f12,	%f26
	movcc	%xcc,	%l6,	%g1
	movvs	%xcc,	%o3,	%g3
	fpadd32s	%f25,	%f6,	%f20
	std	%f26,	[%l7 + 0x30]
	movge	%xcc,	%i1,	%o5
	udivcc	%l2,	0x0E7B,	%i0
	movle	%icc,	%l4,	%g4
	edge16ln	%g5,	%i2,	%i7
	fcmps	%fcc0,	%f22,	%f18
	ldx	[%l7 + 0x08],	%l5
	umul	%i3,	0x0618,	%l1
	movrne	%g7,	%l3,	%i5
	fmovrdgez	%l0,	%f24,	%f4
	edge16n	%o2,	%o6,	%o7
	edge16l	%i6,	%o1,	%o4
	edge32ln	%g2,	%o0,	%g6
	pdist	%f26,	%f22,	%f28
	edge32n	%i4,	%g1,	%l6
	popc	0x0270,	%g3
	movpos	%icc,	%i1,	%o3
	edge8n	%o5,	%i0,	%l2
	fmuld8sux16	%f8,	%f2,	%f26
	edge32l	%l4,	%g4,	%g5
	fsrc1	%f4,	%f26
	movrlz	%i7,	0x0EA,	%i2
	st	%f14,	[%l7 + 0x74]
	sdiv	%i3,	0x0101,	%l5
	xnorcc	%g7,	%l3,	%l1
	fmovdvc	%icc,	%f18,	%f29
	fone	%f0
	edge16l	%i5,	%o2,	%l0
	andn	%o6,	%o7,	%o1
	andncc	%i6,	%g2,	%o4
	lduw	[%l7 + 0x50],	%g6
	subc	%i4,	%o0,	%g1
	fmovrslez	%g3,	%f9,	%f19
	fcmple32	%f0,	%f8,	%i1
	movrgz	%o3,	%l6,	%i0
	fxor	%f6,	%f4,	%f20
	andn	%l2,	0x1373,	%l4
	std	%f16,	[%l7 + 0x48]
	ld	[%l7 + 0x38],	%f21
	andcc	%g4,	%g5,	%i7
	fmovscs	%icc,	%f16,	%f14
	movrlez	%o5,	%i2,	%l5
	andcc	%i3,	0x12F1,	%g7
	movg	%icc,	%l3,	%i5
	popc	%l1,	%o2
	fmovrdne	%o6,	%f26,	%f30
	fmul8x16al	%f11,	%f17,	%f8
	std	%f14,	[%l7 + 0x48]
	xor	%l0,	%o7,	%i6
	fmovrde	%o1,	%f0,	%f0
	ldx	[%l7 + 0x10],	%o4
	movrgez	%g6,	%g2,	%o0
	orn	%g1,	0x1E44,	%i4
	ldsh	[%l7 + 0x34],	%i1
	addcc	%o3,	0x19C3,	%g3
	movleu	%xcc,	%i0,	%l6
	fornot1	%f10,	%f12,	%f16
	st	%f12,	[%l7 + 0x1C]
	fpsub32s	%f13,	%f4,	%f25
	movrlz	%l2,	0x1EF,	%l4
	movre	%g5,	%g4,	%o5
	array32	%i7,	%i2,	%l5
	array16	%g7,	%l3,	%i3
	srl	%l1,	0x11,	%o2
	st	%f13,	[%l7 + 0x6C]
	fcmpes	%fcc3,	%f6,	%f21
	alignaddrl	%o6,	%l0,	%i5
	movcc	%icc,	%o7,	%o1
	subc	%o4,	%i6,	%g6
	fmovscs	%icc,	%f12,	%f17
	ldsw	[%l7 + 0x1C],	%o0
	pdist	%f22,	%f26,	%f8
	fnands	%f25,	%f23,	%f5
	mova	%icc,	%g1,	%g2
	umul	%i4,	0x05D6,	%i1
	sra	%g3,	0x18,	%i0
	sll	%l6,	%l2,	%l4
	srax	%o3,	%g4,	%g5
	edge8ln	%o5,	%i2,	%i7
	xor	%l5,	0x1D19,	%l3
	srlx	%i3,	0x0D,	%g7
	fcmpne32	%f22,	%f26,	%o2
	fmovrdlez	%l1,	%f14,	%f28
	edge8	%l0,	%i5,	%o6
	umulcc	%o1,	%o4,	%i6
	movl	%icc,	%o7,	%o0
	edge8	%g6,	%g1,	%i4
	array16	%g2,	%i1,	%i0
	fmovrdgez	%l6,	%f12,	%f28
	movvs	%xcc,	%g3,	%l4
	srlx	%o3,	0x1C,	%g4
	fones	%f5
	addcc	%l2,	0x0EFC,	%g5
	movcc	%xcc,	%i2,	%o5
	add	%i7,	%l5,	%i3
	smulcc	%l3,	0x07A3,	%g7
	movg	%icc,	%l1,	%l0
	edge8n	%o2,	%i5,	%o1
	fandnot1	%f12,	%f12,	%f20
	sra	%o4,	%i6,	%o7
	xor	%o0,	%g6,	%g1
	stw	%o6,	[%l7 + 0x2C]
	fpsub16s	%f22,	%f29,	%f3
	stx	%g2,	[%l7 + 0x18]
	sdiv	%i1,	0x067C,	%i0
	array16	%i4,	%g3,	%l4
	for	%f6,	%f2,	%f12
	faligndata	%f12,	%f22,	%f16
	movvc	%icc,	%o3,	%g4
	umul	%l6,	0x0B4B,	%l2
	fmovsge	%xcc,	%f24,	%f24
	ldsb	[%l7 + 0x25],	%i2
	movvs	%icc,	%o5,	%g5
	xor	%i7,	0x0538,	%i3
	movvc	%xcc,	%l3,	%g7
	umul	%l5,	%l1,	%l0
	movre	%o2,	0x0E5,	%o1
	fsrc2s	%f30,	%f12
	xnorcc	%o4,	0x0D6F,	%i5
	sllx	%i6,	0x19,	%o0
	sra	%g6,	%g1,	%o7
	sir	0x0CFB
	sdivcc	%o6,	0x07C6,	%i1
	udivcc	%g2,	0x0953,	%i4
	alignaddr	%i0,	%g3,	%o3
	fpmerge	%f29,	%f24,	%f20
	andcc	%g4,	0x133C,	%l6
	edge16l	%l2,	%l4,	%i2
	movleu	%icc,	%o5,	%i7
	sdivx	%i3,	0x084A,	%g5
	udiv	%l3,	0x131D,	%g7
	movpos	%xcc,	%l1,	%l5
	movvc	%icc,	%l0,	%o1
	sllx	%o2,	%o4,	%i6
	fpsub16s	%f0,	%f20,	%f9
	sir	0x1FAC
	fcmple32	%f26,	%f20,	%i5
	movcs	%xcc,	%g6,	%o0
	movle	%icc,	%o7,	%g1
	and	%o6,	%g2,	%i4
	fmul8sux16	%f14,	%f6,	%f16
	sdiv	%i0,	0x18C0,	%g3
	movrlez	%i1,	0x0CE,	%g4
	fandnot1s	%f3,	%f20,	%f8
	std	%f14,	[%l7 + 0x70]
	movcc	%xcc,	%o3,	%l2
	ld	[%l7 + 0x08],	%f8
	edge32n	%l4,	%i2,	%o5
	add	%i7,	%l6,	%g5
	ldx	[%l7 + 0x68],	%i3
	alignaddrl	%g7,	%l3,	%l1
	sub	%l5,	0x0B49,	%o1
	fandnot2	%f10,	%f4,	%f22
	std	%f14,	[%l7 + 0x48]
	add	%o2,	0x1130,	%o4
	movrlez	%l0,	0x0F0,	%i5
	ldd	[%l7 + 0x60],	%g6
	addcc	%i6,	%o7,	%o0
	or	%g1,	0x0C56,	%g2
	movrlez	%i4,	%i0,	%g3
	bshuffle	%f12,	%f6,	%f6
	st	%f0,	[%l7 + 0x10]
	ldsw	[%l7 + 0x18],	%i1
	fsrc2	%f2,	%f26
	fornot2s	%f4,	%f7,	%f24
	xorcc	%g4,	%o6,	%l2
	sdiv	%o3,	0x1B7E,	%l4
	smulcc	%o5,	%i7,	%l6
	movg	%xcc,	%g5,	%i2
	edge16l	%g7,	%i3,	%l3
	edge16ln	%l1,	%o1,	%l5
	orn	%o2,	0x0A15,	%o4
	addcc	%l0,	0x0D65,	%g6
	movre	%i5,	0x2DB,	%o7
	fsrc1	%f0,	%f12
	std	%f4,	[%l7 + 0x18]
	sllx	%i6,	%o0,	%g1
	and	%g2,	0x1F79,	%i4
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	ldd	[%l7 + 0x20],	%f24
	movpos	%icc,	%i1,	%o6
	array16	%l2,	%g4,	%o3
	for	%f30,	%f6,	%f6
	nop
	set	0x50, %l2
	ldsw	[%l7 + %l2],	%o5
	edge16n	%i7,	%l6,	%l4
	movcs	%icc,	%g5,	%i2
	movrlz	%i3,	0x388,	%g7
	movgu	%icc,	%l1,	%l3
	smul	%l5,	%o1,	%o2
	mulscc	%l0,	0x0D31,	%o4
	smul	%i5,	%o7,	%g6
	sth	%o0,	[%l7 + 0x56]
	smulcc	%i6,	0x13DE,	%g2
	ldsw	[%l7 + 0x50],	%g1
	fpadd16	%f28,	%f26,	%f0
	sllx	%g3,	0x13,	%i0
	edge16ln	%i1,	%o6,	%l2
	movrne	%g4,	0x0EC,	%o3
	popc	0x0AAE,	%o5
	fcmpeq32	%f28,	%f26,	%i4
	sth	%l6,	[%l7 + 0x3A]
	movneg	%xcc,	%l4,	%i7
	stb	%i2,	[%l7 + 0x64]
	fmovrsgz	%i3,	%f11,	%f21
	movrgez	%g7,	%l1,	%g5
	ldub	[%l7 + 0x6F],	%l3
	edge32l	%o1,	%l5,	%l0
	orn	%o2,	0x0261,	%o4
	movne	%icc,	%i5,	%g6
	fnegd	%f26,	%f0
	udiv	%o7,	0x1C62,	%i6
	fcmpes	%fcc3,	%f10,	%f22
	lduh	[%l7 + 0x7E],	%o0
	sethi	0x1EB4,	%g1
	srl	%g2,	%i0,	%i1
	edge32ln	%o6,	%g3,	%l2
	fnegs	%f3,	%f27
	smul	%o3,	%g4,	%o5
	fnand	%f2,	%f20,	%f22
	andn	%i4,	%l6,	%l4
	array16	%i2,	%i3,	%g7
	movrgz	%l1,	0x29F,	%g5
	smulcc	%i7,	%l3,	%l5
	umul	%l0,	0x181C,	%o1
	popc	0x1B86,	%o4
	fcmpeq16	%f22,	%f10,	%i5
	movle	%icc,	%g6,	%o2
	movleu	%xcc,	%o7,	%o0
	xor	%i6,	%g2,	%i0
	edge8	%g1,	%i1,	%o6
	umul	%g3,	%l2,	%g4
	edge8l	%o3,	%o5,	%i4
	movneg	%icc,	%l6,	%l4
	edge8	%i3,	%i2,	%l1
	fmovscc	%xcc,	%f23,	%f20
	edge8n	%g5,	%g7,	%i7
	fmul8x16al	%f9,	%f27,	%f20
	edge8n	%l5,	%l0,	%o1
	subc	%l3,	%i5,	%g6
	fmovs	%f15,	%f28
	array16	%o2,	%o4,	%o7
	fmovdvs	%icc,	%f0,	%f21
	fmovsge	%xcc,	%f11,	%f3
	fpack16	%f30,	%f22
	fmul8x16al	%f13,	%f0,	%f28
	srlx	%o0,	%i6,	%i0
	fcmple32	%f16,	%f0,	%g1
	ldd	[%l7 + 0x50],	%f18
	stb	%g2,	[%l7 + 0x57]
	andcc	%o6,	0x157E,	%g3
	sllx	%i1,	%g4,	%o3
	fmovrsgz	%o5,	%f29,	%f12
	srax	%i4,	%l2,	%l4
	add	%l6,	0x0BE0,	%i2
	movl	%icc,	%l1,	%g5
	edge32ln	%g7,	%i3,	%i7
	edge8n	%l0,	%l5,	%o1
	fmovrdgez	%l3,	%f18,	%f0
	addc	%g6,	0x1284,	%o2
	movn	%icc,	%i5,	%o4
	addccc	%o7,	%o0,	%i6
	fmovsa	%xcc,	%f13,	%f11
	sllx	%g1,	%g2,	%i0
	sll	%o6,	0x14,	%g3
	add	%i1,	0x10B6,	%g4
	fcmpeq16	%f18,	%f30,	%o3
	nop
	set	0x18, %g1
	ldd	[%l7 + %g1],	%f8
	movrlz	%o5,	0x14D,	%l2
	edge8n	%l4,	%l6,	%i2
	fmovsneg	%xcc,	%f28,	%f22
	movrgz	%l1,	0x2E7,	%i4
	edge16	%g5,	%g7,	%i7
	fmovdcs	%icc,	%f30,	%f22
	alignaddrl	%i3,	%l0,	%o1
	movleu	%xcc,	%l3,	%g6
	fmovse	%xcc,	%f15,	%f18
	sllx	%o2,	0x01,	%i5
	srl	%o4,	%l5,	%o7
	fmovdneg	%xcc,	%f23,	%f16
	edge8l	%o0,	%g1,	%i6
	movvs	%xcc,	%g2,	%o6
	stw	%i0,	[%l7 + 0x70]
	ldsh	[%l7 + 0x16],	%g3
	st	%f0,	[%l7 + 0x1C]
	or	%i1,	0x1B1D,	%o3
	mulx	%o5,	%g4,	%l2
	fmovdleu	%xcc,	%f22,	%f9
	stw	%l6,	[%l7 + 0x6C]
	movn	%xcc,	%l4,	%l1
	subccc	%i2,	%g5,	%g7
	orncc	%i4,	0x1FA5,	%i7
	fmovrdgez	%i3,	%f16,	%f18
	sllx	%l0,	0x16,	%l3
	fmovdleu	%icc,	%f19,	%f1
	srlx	%o1,	%g6,	%o2
	or	%i5,	0x158C,	%o4
	subcc	%l5,	0x156B,	%o0
	add	%g1,	%o7,	%g2
	udivcc	%i6,	0x1F0B,	%o6
	fabsd	%f30,	%f30
	fcmpeq16	%f28,	%f8,	%i0
	udiv	%i1,	0x1598,	%o3
	fornot2	%f12,	%f22,	%f30
	movrlez	%g3,	0x00C,	%o5
	ldsw	[%l7 + 0x44],	%l2
	movrlez	%g4,	0x0B8,	%l4
	ldd	[%l7 + 0x58],	%f2
	movrgz	%l1,	0x2FB,	%l6
	movn	%xcc,	%g5,	%i2
	movcc	%xcc,	%i4,	%i7
	ldsw	[%l7 + 0x30],	%i3
	edge8l	%g7,	%l0,	%l3
	ldub	[%l7 + 0x5B],	%g6
	xnor	%o2,	0x0CE0,	%o1
	fcmpeq32	%f2,	%f16,	%i5
	edge32l	%l5,	%o0,	%o4
	umul	%o7,	0x04DF,	%g1
	umul	%i6,	%g2,	%i0
	umul	%i1,	0x005E,	%o6
	xnor	%g3,	0x18EA,	%o5
	subcc	%l2,	0x1563,	%g4
	array16	%o3,	%l1,	%l6
	fpsub32	%f30,	%f0,	%f8
	sth	%l4,	[%l7 + 0x48]
	fmovsneg	%xcc,	%f9,	%f4
	sir	0x0994
	ld	[%l7 + 0x50],	%f1
	add	%i2,	0x15B1,	%g5
	movl	%icc,	%i7,	%i4
	mova	%icc,	%i3,	%l0
	edge8	%l3,	%g7,	%g6
	movg	%xcc,	%o1,	%o2
	fzero	%f8
	xor	%l5,	%o0,	%i5
	edge16l	%o4,	%g1,	%o7
	subc	%g2,	0x14FA,	%i0
	edge32n	%i6,	%o6,	%i1
	andncc	%o5,	%l2,	%g3
	for	%f30,	%f20,	%f20
	ldub	[%l7 + 0x62],	%o3
	umul	%g4,	0x1930,	%l6
	fxnor	%f16,	%f6,	%f16
	addcc	%l4,	0x11D5,	%l1
	stx	%g5,	[%l7 + 0x70]
	array32	%i2,	%i7,	%i4
	std	%f26,	[%l7 + 0x50]
	edge8ln	%l0,	%l3,	%g7
	and	%g6,	%o1,	%i3
	udivcc	%o2,	0x146F,	%o0
	fmul8ulx16	%f28,	%f0,	%f14
	ld	[%l7 + 0x58],	%f20
	orn	%l5,	0x181D,	%o4
	fnot1	%f22,	%f18
	sdivcc	%g1,	0x1BAE,	%o7
	edge8l	%i5,	%i0,	%i6
	array8	%g2,	%o6,	%o5
	sethi	0x0D6A,	%i1
	subcc	%l2,	%g3,	%o3
	sdiv	%l6,	0x0566,	%l4
	sdivx	%g4,	0x03F8,	%l1
	stw	%i2,	[%l7 + 0x0C]
	sth	%g5,	[%l7 + 0x68]
	sethi	0x1902,	%i7
	sdivcc	%i4,	0x18C0,	%l3
	fxor	%f12,	%f6,	%f14
	movge	%icc,	%l0,	%g7
	edge16	%g6,	%i3,	%o1
	sethi	0x073E,	%o2
	ldx	[%l7 + 0x30],	%o0
	addccc	%l5,	0x0885,	%g1
	andncc	%o4,	%o7,	%i0
	smul	%i6,	0x0650,	%i5
	movl	%xcc,	%o6,	%o5
	addcc	%i1,	%l2,	%g3
	xnor	%g2,	%l6,	%l4
	array8	%g4,	%l1,	%o3
	nop
	set	0x38, %l0
	std	%f18,	[%l7 + %l0]
	fmovrsgez	%i2,	%f7,	%f6
	popc	0x07F3,	%i7
	ldsb	[%l7 + 0x77],	%i4
	umulcc	%g5,	0x0D32,	%l0
	fmovsle	%xcc,	%f8,	%f23
	fcmpd	%fcc3,	%f6,	%f14
	addc	%l3,	%g6,	%i3
	add	%g7,	0x038A,	%o2
	sdiv	%o0,	0x0B9B,	%l5
	siam	0x0
	edge32ln	%g1,	%o1,	%o7
	sir	0x16AB
	nop
	set	0x30, %o2
	lduw	[%l7 + %o2],	%o4
	edge16n	%i6,	%i5,	%o6
	srlx	%i0,	0x0B,	%o5
	fmovsne	%xcc,	%f8,	%f6
	pdist	%f24,	%f8,	%f2
	fcmped	%fcc3,	%f20,	%f22
	stw	%l2,	[%l7 + 0x1C]
	alignaddrl	%g3,	%i1,	%g2
	movne	%xcc,	%l6,	%g4
	fxnors	%f8,	%f7,	%f12
	ldd	[%l7 + 0x48],	%l0
	fmovrsgz	%o3,	%f29,	%f10
	array8	%l4,	%i7,	%i2
	fpack16	%f18,	%f15
	nop
	set	0x50, %g5
	std	%f2,	[%l7 + %g5]
	fmovdcs	%icc,	%f28,	%f11
	for	%f8,	%f16,	%f8
	xorcc	%g5,	0x16B3,	%l0
	nop
	set	0x14, %g7
	ldub	[%l7 + %g7],	%i4
	nop
	set	0x2C, %i0
	ldub	[%l7 + %i0],	%g6
	array8	%i3,	%g7,	%o2
	fcmple32	%f18,	%f12,	%l3
	fmovdgu	%icc,	%f11,	%f31
	smulcc	%o0,	0x18E9,	%g1
	restore %o1, 0x1354, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l5,	0x0C2B,	%i6
	movneg	%icc,	%i5,	%o6
	move	%xcc,	%o4,	%o5
	addc	%i0,	%l2,	%i1
	fmovrsgez	%g2,	%f3,	%f11
	orn	%l6,	%g4,	%g3
	addcc	%l1,	0x08C3,	%l4
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	edge32n	%g5,	%l0,	%i4
	fornot1	%f22,	%f24,	%f24
	edge16	%g6,	%i7,	%g7
	mulx	%o2,	0x04A0,	%i3
	fmovd	%f16,	%f18
	nop
	set	0x58, %o3
	stx	%o0,	[%l7 + %o3]
	movcs	%xcc,	%l3,	%g1
	fmovdge	%xcc,	%f1,	%f23
	umul	%o1,	%o7,	%i6
	mulx	%l5,	%o6,	%i5
	movvc	%icc,	%o5,	%o4
	subccc	%l2,	0x152A,	%i0
	fmovrdlz	%i1,	%f14,	%f2
	ldsw	[%l7 + 0x10],	%l6
	pdist	%f10,	%f30,	%f18
	ldd	[%l7 + 0x10],	%f4
	srax	%g2,	%g4,	%g3
	array16	%l1,	%l4,	%i2
	fmovsneg	%icc,	%f11,	%f9
	fones	%f15
	xnorcc	%g5,	%l0,	%o3
	fcmpne32	%f18,	%f2,	%g6
	addcc	%i7,	0x12B8,	%g7
	array32	%i4,	%i3,	%o2
	sdivcc	%l3,	0x0C9F,	%o0
	edge8ln	%o1,	%g1,	%o7
	ldub	[%l7 + 0x53],	%i6
	fand	%f0,	%f4,	%f6
	addcc	%l5,	0x0D24,	%i5
	fandnot2s	%f12,	%f29,	%f15
	orncc	%o5,	0x022D,	%o4
	edge16l	%l2,	%o6,	%i0
	sdivx	%l6,	0x13A4,	%g2
	fand	%f4,	%f0,	%f4
	std	%f18,	[%l7 + 0x38]
	movl	%xcc,	%g4,	%i1
	edge16n	%l1,	%l4,	%g3
	fmuld8sux16	%f6,	%f14,	%f30
	stw	%g5,	[%l7 + 0x20]
	subccc	%l0,	%i2,	%g6
	array8	%i7,	%g7,	%o3
	st	%f26,	[%l7 + 0x1C]
	umul	%i4,	0x02B9,	%i3
	umulcc	%o2,	0x0327,	%o0
	movne	%icc,	%l3,	%g1
	siam	0x1
	umul	%o1,	%o7,	%i6
	sir	0x1F0B
	orncc	%l5,	0x114D,	%i5
	andn	%o5,	0x16FC,	%o4
	edge32ln	%l2,	%o6,	%i0
	fcmpgt32	%f14,	%f14,	%g2
	fmovde	%icc,	%f23,	%f7
	andn	%g4,	0x03F4,	%l6
	edge8l	%i1,	%l1,	%g3
	mulx	%l4,	%l0,	%i2
	fcmpd	%fcc3,	%f22,	%f2
	srl	%g5,	%g6,	%i7
	movle	%icc,	%g7,	%i4
	edge16l	%i3,	%o3,	%o0
	umul	%o2,	0x0CE2,	%l3
	edge16ln	%g1,	%o1,	%i6
	edge16	%o7,	%l5,	%o5
	fmovrdne	%o4,	%f2,	%f0
	ldsh	[%l7 + 0x0E],	%i5
	addc	%l2,	%o6,	%i0
	movcc	%xcc,	%g4,	%g2
	umulcc	%l6,	0x1AE0,	%l1
	ldd	[%l7 + 0x28],	%f26
	alignaddrl	%g3,	%l4,	%l0
	movvs	%xcc,	%i1,	%g5
	fmovda	%icc,	%f14,	%f7
	sdivcc	%i2,	0x0BBA,	%g6
	movl	%icc,	%g7,	%i7
	array16	%i3,	%o3,	%i4
	movne	%xcc,	%o2,	%l3
	andncc	%o0,	%g1,	%o1
	mulscc	%o7,	%i6,	%l5
	ldx	[%l7 + 0x78],	%o4
	fcmpne16	%f0,	%f18,	%i5
	fornot1s	%f18,	%f8,	%f0
	fmovsleu	%xcc,	%f12,	%f5
	fxnor	%f10,	%f30,	%f4
	sdivx	%l2,	0x0EFD,	%o5
	fpmerge	%f6,	%f7,	%f24
	st	%f27,	[%l7 + 0x38]
	edge32l	%i0,	%g4,	%o6
	movl	%xcc,	%l6,	%g2
	fmuld8sux16	%f1,	%f22,	%f0
	fcmps	%fcc2,	%f16,	%f23
	fmovscs	%icc,	%f27,	%f26
	movvs	%xcc,	%l1,	%g3
	lduw	[%l7 + 0x30],	%l4
	movrgz	%l0,	0x371,	%i1
	edge8ln	%i2,	%g5,	%g6
	fpsub32s	%f22,	%f11,	%f29
	edge8	%g7,	%i7,	%o3
	movge	%xcc,	%i4,	%i3
	movgu	%icc,	%o2,	%l3
	xorcc	%g1,	%o1,	%o7
	edge32ln	%i6,	%o0,	%o4
	srax	%i5,	0x11,	%l2
	fmovdcc	%icc,	%f17,	%f14
	xnorcc	%o5,	%l5,	%g4
	edge8	%o6,	%i0,	%g2
	srax	%l6,	0x1C,	%g3
	addccc	%l1,	0x1D0C,	%l4
	fmovdcc	%icc,	%f31,	%f1
	and	%l0,	%i2,	%i1
	save %g6, 0x0420, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i7,	%g7
	movrlz	%o3,	0x137,	%i3
	andcc	%i4,	0x1625,	%l3
	array32	%o2,	%o1,	%g1
	std	%f20,	[%l7 + 0x40]
	fmovsvs	%xcc,	%f30,	%f31
	movleu	%icc,	%i6,	%o0
	fmovsle	%icc,	%f17,	%f10
	subccc	%o4,	0x1903,	%o7
	fandnot1	%f2,	%f2,	%f26
	fsrc1s	%f14,	%f26
	movrgez	%i5,	%o5,	%l5
	fmovd	%f6,	%f0
	movcc	%icc,	%l2,	%o6
	sllx	%i0,	%g4,	%g2
	array32	%l6,	%l1,	%g3
	orn	%l4,	0x1266,	%l0
	addccc	%i1,	0x19F3,	%g6
	movneg	%xcc,	%g5,	%i2
	movvc	%xcc,	%g7,	%i7
	sllx	%o3,	0x0C,	%i4
	movcc	%icc,	%l3,	%o2
	andncc	%o1,	%g1,	%i3
	sub	%o0,	%o4,	%i6
	sdiv	%i5,	0x0D53,	%o7
	st	%f3,	[%l7 + 0x5C]
	edge16n	%l5,	%l2,	%o6
	movre	%i0,	0x2BA,	%o5
	subc	%g4,	0x1308,	%g2
	ldd	[%l7 + 0x08],	%f14
	edge16l	%l1,	%g3,	%l4
	edge8l	%l0,	%i1,	%l6
	xor	%g5,	%g6,	%g7
	fzeros	%f30
	orn	%i2,	0x0DC5,	%o3
	fnot1s	%f0,	%f17
	movneg	%xcc,	%i7,	%i4
	edge16l	%o2,	%o1,	%l3
	fexpand	%f9,	%f2
	movg	%icc,	%g1,	%i3
	ldsh	[%l7 + 0x0A],	%o4
	st	%f0,	[%l7 + 0x18]
	sth	%i6,	[%l7 + 0x6A]
	fors	%f27,	%f5,	%f13
	xnorcc	%i5,	%o0,	%l5
	sdiv	%o7,	0x10B1,	%o6
	orn	%l2,	%o5,	%g4
	xnor	%i0,	0x12E6,	%l1
	orn	%g3,	0x1671,	%g2
	fxnors	%f17,	%f7,	%f21
	edge8ln	%l0,	%i1,	%l4
	fmovrslez	%g5,	%f2,	%f6
	sethi	0x1B7A,	%g6
	sll	%g7,	%l6,	%o3
	orcc	%i2,	0x1552,	%i4
	fnors	%f6,	%f16,	%f23
	movrgz	%i7,	%o1,	%l3
	orcc	%g1,	0x19C0,	%o2
	movre	%o4,	0x17D,	%i3
	movneg	%icc,	%i5,	%o0
	edge32ln	%l5,	%i6,	%o6
	subc	%l2,	%o7,	%o5
	movn	%xcc,	%g4,	%i0
	movl	%xcc,	%g3,	%g2
	stw	%l0,	[%l7 + 0x24]
	edge16n	%l1,	%l4,	%g5
	edge32	%g6,	%g7,	%l6
	movvc	%xcc,	%o3,	%i2
	edge8l	%i4,	%i1,	%i7
	array32	%o1,	%g1,	%o2
	fcmpeq32	%f22,	%f12,	%l3
	xnorcc	%o4,	%i3,	%i5
	ld	[%l7 + 0x48],	%f31
	fmovrdlz	%l5,	%f20,	%f8
	andn	%i6,	%o0,	%l2
	faligndata	%f18,	%f12,	%f22
	smulcc	%o7,	0x1571,	%o5
	addcc	%o6,	0x1E47,	%g4
	fpmerge	%f29,	%f7,	%f6
	fmovscs	%xcc,	%f25,	%f18
	andn	%i0,	%g3,	%l0
	xnorcc	%l1,	0x1ABC,	%g2
	srax	%g5,	%g6,	%l4
	subc	%l6,	0x15D7,	%g7
	alignaddrl	%o3,	%i4,	%i1
	sth	%i7,	[%l7 + 0x28]
	for	%f28,	%f30,	%f14
	alignaddrl	%o1,	%g1,	%i2
	st	%f14,	[%l7 + 0x10]
	movcs	%xcc,	%l3,	%o4
	ldsb	[%l7 + 0x3E],	%i3
	movle	%icc,	%i5,	%l5
	edge8n	%o2,	%o0,	%i6
	siam	0x3
	xnor	%o7,	0x09AF,	%l2
	srl	%o5,	0x0C,	%o6
	udiv	%g4,	0x0FD0,	%g3
	movleu	%icc,	%i0,	%l1
	fmovdcc	%icc,	%f29,	%f16
	edge32ln	%l0,	%g2,	%g5
	sth	%l4,	[%l7 + 0x52]
	array32	%g6,	%g7,	%l6
	lduw	[%l7 + 0x0C],	%i4
	fmovsle	%xcc,	%f6,	%f26
	andcc	%i1,	0x1235,	%i7
	udiv	%o1,	0x0F3E,	%g1
	udivx	%o3,	0x12A5,	%i2
	fpadd32s	%f15,	%f17,	%f13
	edge16n	%o4,	%i3,	%i5
	fnegd	%f30,	%f6
	movrne	%l3,	0x0F6,	%o2
	fmovdl	%xcc,	%f1,	%f26
	sth	%l5,	[%l7 + 0x7E]
	move	%icc,	%i6,	%o0
	restore %l2, 0x0E7D, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%o6
	sir	0x0A0F
	and	%g4,	0x03C7,	%g3
	ldub	[%l7 + 0x43],	%i0
	srl	%l1,	0x14,	%o5
	fpackfix	%f26,	%f7
	movleu	%xcc,	%g2,	%g5
	or	%l0,	0x0EF4,	%l4
	move	%xcc,	%g6,	%l6
	movle	%icc,	%g7,	%i4
	fmuld8ulx16	%f7,	%f4,	%f0
	xnor	%i7,	0x02B4,	%i1
	fxor	%f8,	%f10,	%f22
	fcmpeq16	%f30,	%f2,	%o1
	fpack32	%f2,	%f28,	%f8
	fmul8x16au	%f19,	%f31,	%f18
	fmovsa	%icc,	%f18,	%f20
	movneg	%icc,	%g1,	%i2
	movvc	%icc,	%o3,	%o4
	fmovdl	%icc,	%f8,	%f3
	fnand	%f10,	%f12,	%f12
	sir	0x1C28
	ldd	[%l7 + 0x60],	%f28
	fones	%f23
	sethi	0x14E5,	%i5
	fcmped	%fcc0,	%f10,	%f26
	fmovdl	%xcc,	%f27,	%f10
	edge16l	%l3,	%i3,	%l5
	movre	%i6,	%o0,	%o2
	fpadd16s	%f13,	%f0,	%f30
	fmovrslez	%l2,	%f15,	%f25
	xnorcc	%o6,	0x1401,	%g4
	fabsd	%f8,	%f28
	sdivcc	%o7,	0x1C41,	%g3
	movrlz	%i0,	0x16B,	%l1
	edge32l	%g2,	%o5,	%l0
	subccc	%l4,	0x09B1,	%g5
	xor	%g6,	%l6,	%g7
	movrne	%i4,	0x1AB,	%i7
	edge32ln	%i1,	%g1,	%o1
	movcc	%xcc,	%i2,	%o3
	andcc	%i5,	%l3,	%o4
	and	%i3,	0x0996,	%i6
	ld	[%l7 + 0x3C],	%f24
	movleu	%icc,	%l5,	%o2
	subcc	%o0,	0x021C,	%o6
	fmovdn	%icc,	%f10,	%f10
	movvs	%xcc,	%g4,	%l2
	fandnot1	%f22,	%f2,	%f12
	srlx	%g3,	%i0,	%o7
	sllx	%l1,	0x1C,	%g2
	sir	0x1A11
	movle	%xcc,	%o5,	%l4
	sllx	%g5,	0x1B,	%l0
	fmovdle	%icc,	%f11,	%f3
	ldsw	[%l7 + 0x20],	%g6
	andcc	%l6,	%g7,	%i7
	srax	%i1,	0x1F,	%i4
	movgu	%xcc,	%g1,	%o1
	fnors	%f7,	%f0,	%f31
	orn	%i2,	0x1171,	%o3
	edge16n	%i5,	%l3,	%o4
	srax	%i3,	0x0A,	%l5
	fnors	%f10,	%f27,	%f7
	sll	%i6,	%o0,	%o6
	xnorcc	%g4,	0x0F72,	%o2
	udiv	%g3,	0x19F9,	%i0
	edge16	%o7,	%l2,	%g2
	or	%l1,	%l4,	%o5
	array8	%g5,	%g6,	%l0
	movrne	%g7,	%i7,	%i1
	fmul8x16au	%f14,	%f31,	%f4
	sra	%i4,	%l6,	%o1
	fandnot2	%f12,	%f22,	%f0
	movleu	%xcc,	%g1,	%o3
	fabsd	%f30,	%f16
	udivx	%i5,	0x1D1B,	%i2
	edge8l	%o4,	%l3,	%l5
	ldsh	[%l7 + 0x6C],	%i6
	orn	%o0,	%o6,	%g4
	fone	%f26
	addcc	%i3,	%g3,	%i0
	sdivcc	%o2,	0x0508,	%o7
	mova	%icc,	%g2,	%l1
	movleu	%xcc,	%l2,	%o5
	addcc	%l4,	0x1900,	%g5
	movrgez	%l0,	0x322,	%g6
	bshuffle	%f22,	%f14,	%f2
	add	%i7,	%g7,	%i4
	movl	%xcc,	%l6,	%i1
	alignaddr	%o1,	%o3,	%g1
	array16	%i2,	%o4,	%l3
	fpadd32s	%f10,	%f9,	%f27
	mova	%icc,	%i5,	%i6
	subccc	%l5,	0x1FF5,	%o6
	fmovrsgez	%o0,	%f0,	%f22
	mova	%icc,	%i3,	%g4
	array8	%g3,	%o2,	%o7
	fones	%f12
	edge32	%i0,	%l1,	%l2
	save %o5, %l4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f6,	%f7,	%f19
	srlx	%g5,	0x0E,	%l0
	fcmple16	%f18,	%f26,	%i7
	movleu	%icc,	%g6,	%i4
	movrgez	%l6,	0x3FF,	%g7
	srax	%o1,	0x0E,	%i1
	fmovdle	%xcc,	%f24,	%f30
	movpos	%xcc,	%g1,	%o3
	ldd	[%l7 + 0x78],	%i2
	edge16	%l3,	%o4,	%i6
	nop
	set	0x44, %g3
	stw	%l5,	[%l7 + %g3]
	fmovrde	%i5,	%f8,	%f22
	movrgez	%o0,	0x239,	%o6
	sdivcc	%g4,	0x1945,	%i3
	ldsh	[%l7 + 0x52],	%g3
	umulcc	%o7,	%i0,	%o2
	sdivx	%l1,	0x02F6,	%o5
	add	%l2,	%l4,	%g2
	ldsb	[%l7 + 0x39],	%l0
	ldx	[%l7 + 0x68],	%i7
	array16	%g5,	%g6,	%l6
	fmovsl	%icc,	%f4,	%f29
	sdiv	%g7,	0x02FE,	%i4
	std	%f18,	[%l7 + 0x40]
	lduw	[%l7 + 0x2C],	%o1
	edge32n	%g1,	%o3,	%i1
	sethi	0x1341,	%l3
	ldx	[%l7 + 0x78],	%o4
	srlx	%i2,	%l5,	%i5
	fpsub32s	%f9,	%f4,	%f21
	ld	[%l7 + 0x24],	%f19
	fnot2s	%f16,	%f16
	sethi	0x13A6,	%i6
	sir	0x0F29
	movre	%o0,	0x057,	%g4
	fcmpne16	%f26,	%f14,	%i3
	lduw	[%l7 + 0x6C],	%o6
	movle	%icc,	%o7,	%g3
	fmovsne	%icc,	%f14,	%f10
	ld	[%l7 + 0x1C],	%f30
	fcmpeq32	%f4,	%f14,	%o2
	addcc	%i0,	0x037A,	%l1
	st	%f5,	[%l7 + 0x3C]
	umul	%o5,	0x0372,	%l4
	ldub	[%l7 + 0x34],	%l2
	fnor	%f10,	%f8,	%f30
	umulcc	%g2,	0x1651,	%l0
	andn	%g5,	0x0C95,	%i7
	subc	%g6,	%g7,	%l6
	edge32l	%i4,	%g1,	%o3
	edge32ln	%i1,	%o1,	%o4
	sir	0x10A5
	ldsh	[%l7 + 0x4A],	%l3
	fmovrdlz	%i2,	%f0,	%f14
	srl	%i5,	0x0C,	%i6
	fmovrdgez	%l5,	%f14,	%f22
	edge32n	%o0,	%g4,	%o6
	sub	%o7,	%g3,	%o2
	movgu	%xcc,	%i3,	%i0
	ldub	[%l7 + 0x5D],	%l1
	udivx	%l4,	0x0079,	%l2
	fcmple32	%f6,	%f10,	%g2
	sll	%l0,	0x14,	%o5
	edge16	%i7,	%g6,	%g5
	edge8ln	%g7,	%l6,	%i4
	lduw	[%l7 + 0x5C],	%g1
	subcc	%i1,	%o3,	%o1
	movvc	%icc,	%o4,	%l3
	orn	%i2,	%i5,	%i6
	movg	%icc,	%l5,	%o0
	orcc	%o6,	%o7,	%g4
	fornot2	%f0,	%f20,	%f0
	mulx	%g3,	0x0E48,	%i3
	std	%f8,	[%l7 + 0x78]
	udiv	%i0,	0x199E,	%o2
	umulcc	%l1,	0x0716,	%l4
	sra	%l2,	%g2,	%o5
	fmovdneg	%icc,	%f4,	%f30
	movcs	%icc,	%i7,	%g6
	movrgz	%l0,	0x017,	%g5
	movge	%xcc,	%g7,	%i4
	movrne	%g1,	%l6,	%o3
	stx	%i1,	[%l7 + 0x70]
	fmovdneg	%xcc,	%f25,	%f24
	edge16n	%o4,	%l3,	%o1
	edge32	%i2,	%i5,	%i6
	fmovrdlz	%o0,	%f26,	%f0
	mulscc	%o6,	%l5,	%o7
	fmovdcc	%xcc,	%f17,	%f4
	ldsw	[%l7 + 0x20],	%g4
	edge8	%i3,	%i0,	%o2
	edge32	%l1,	%l4,	%l2
	fands	%f8,	%f21,	%f1
	andncc	%g2,	%o5,	%i7
	mova	%xcc,	%g6,	%l0
	fmovrslez	%g5,	%f8,	%f3
	sdivcc	%g3,	0x17FA,	%i4
	ldub	[%l7 + 0x56],	%g7
	smulcc	%l6,	0x152A,	%g1
	ldd	[%l7 + 0x48],	%f8
	movpos	%icc,	%o3,	%i1
	srlx	%o4,	%l3,	%i2
	movl	%icc,	%o1,	%i6
	movgu	%xcc,	%o0,	%i5
	edge8ln	%o6,	%l5,	%g4
	std	%f14,	[%l7 + 0x48]
	movcc	%xcc,	%i3,	%i0
	movneg	%icc,	%o2,	%o7
	sdivcc	%l1,	0x0697,	%l4
	sdiv	%l2,	0x185D,	%o5
	orn	%g2,	0x181D,	%i7
	orcc	%l0,	%g5,	%g6
	edge32l	%i4,	%g7,	%g3
	sll	%g1,	0x14,	%o3
	fandnot1s	%f13,	%f19,	%f3
	and	%l6,	0x09B7,	%o4
	fmovrsgez	%l3,	%f22,	%f14
	stx	%i2,	[%l7 + 0x20]
	ldd	[%l7 + 0x40],	%o0
	sra	%i1,	%o0,	%i5
	stb	%o6,	[%l7 + 0x16]
	movpos	%icc,	%l5,	%i6
	or	%g4,	%i3,	%o2
	sra	%i0,	%o7,	%l1
	smulcc	%l4,	0x1B2D,	%o5
	andcc	%l2,	%i7,	%l0
	srlx	%g5,	%g2,	%g6
	or	%i4,	%g3,	%g1
	movle	%icc,	%g7,	%o3
	movgu	%icc,	%o4,	%l6
	edge32	%i2,	%o1,	%l3
	movgu	%icc,	%o0,	%i1
	movleu	%xcc,	%i5,	%o6
	xnorcc	%i6,	%g4,	%i3
	movn	%xcc,	%o2,	%i0
	ldsh	[%l7 + 0x56],	%l5
	andncc	%l1,	%l4,	%o5
	srlx	%l2,	0x02,	%o7
	movne	%icc,	%i7,	%g5
	std	%f0,	[%l7 + 0x08]
	movg	%xcc,	%l0,	%g6
	smulcc	%g2,	0x0352,	%i4
	movl	%icc,	%g1,	%g7
	sra	%o3,	0x08,	%g3
	fnot2s	%f5,	%f18
	movre	%l6,	0x2FE,	%i2
	xorcc	%o4,	%o1,	%l3
	umul	%o0,	%i1,	%i5
	alignaddrl	%i6,	%o6,	%i3
	umulcc	%o2,	0x0239,	%i0
	subccc	%g4,	%l1,	%l4
	orncc	%o5,	%l2,	%o7
	fmovs	%f18,	%f13
	array32	%l5,	%i7,	%g5
	fsrc2s	%f6,	%f7
	srlx	%l0,	%g6,	%i4
	movre	%g1,	%g7,	%g2
	movleu	%icc,	%g3,	%o3
	edge16n	%l6,	%o4,	%o1
	lduw	[%l7 + 0x68],	%l3
	bshuffle	%f10,	%f28,	%f4
	lduw	[%l7 + 0x20],	%o0
	mulscc	%i2,	%i5,	%i1
	fmul8x16	%f2,	%f10,	%f18
	edge8ln	%i6,	%i3,	%o2
	st	%f16,	[%l7 + 0x50]
	movrne	%i0,	0x3C8,	%g4
	lduw	[%l7 + 0x1C],	%o6
	addcc	%l4,	0x1A1C,	%l1
	save %l2, 0x1C29, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l5,	%o5,	%g5
	fmovdle	%icc,	%f24,	%f25
	move	%xcc,	%i7,	%g6
	ldub	[%l7 + 0x3F],	%l0
	subcc	%g1,	0x0B01,	%g7
	movvc	%xcc,	%i4,	%g2
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	fnors	%f15,	%f9,	%f19
	smul	%o1,	0x19C5,	%g3
	andncc	%o0,	%l3,	%i2
	movle	%xcc,	%i1,	%i5
	smulcc	%i3,	%i6,	%i0
	edge8	%g4,	%o6,	%l4
	movrgez	%l1,	0x2C9,	%l2
	movne	%xcc,	%o2,	%l5
	andcc	%o7,	%o5,	%g5
	and	%i7,	0x1801,	%l0
	sdivcc	%g1,	0x0A91,	%g6
	movl	%xcc,	%g7,	%g2
	edge16l	%o3,	%l6,	%i4
	ldsw	[%l7 + 0x30],	%o1
	fmul8x16	%f9,	%f18,	%f8
	xnorcc	%g3,	0x06BF,	%o4
	fxnors	%f29,	%f26,	%f13
	fmovs	%f19,	%f13
	fpackfix	%f30,	%f19
	array16	%o0,	%l3,	%i2
	save %i5, 0x185E, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i6,	%i3,	%g4
	xnor	%i0,	0x1EB7,	%o6
	edge32	%l4,	%l2,	%l1
	fmovd	%f4,	%f20
	fxors	%f5,	%f6,	%f31
	movrgz	%l5,	0x00F,	%o2
	edge8	%o5,	%g5,	%i7
	edge8ln	%l0,	%o7,	%g1
	sethi	0x021F,	%g7
	movrlez	%g6,	0x32D,	%g2
	orcc	%o3,	%i4,	%o1
	fcmple16	%f20,	%f0,	%l6
	sdivx	%o4,	0x0171,	%o0
	array16	%l3,	%i2,	%i5
	st	%f10,	[%l7 + 0x70]
	sdiv	%i1,	0x01C2,	%i6
	movrne	%i3,	0x295,	%g4
	andcc	%g3,	%o6,	%l4
	array32	%l2,	%i0,	%l5
	restore %o2, 0x05C8, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o5,	0x0F,	%i7
	mulscc	%l0,	%o7,	%g5
	fpadd16s	%f5,	%f17,	%f2
	edge8	%g7,	%g6,	%g1
	movrgez	%o3,	0x1EB,	%i4
	lduh	[%l7 + 0x32],	%o1
	edge16	%l6,	%o4,	%o0
	ldub	[%l7 + 0x4E],	%l3
	popc	%i2,	%g2
	movcs	%icc,	%i5,	%i1
	add	%i3,	%g4,	%g3
	umulcc	%o6,	%l4,	%i6
	ld	[%l7 + 0x74],	%f1
	edge32ln	%i0,	%l5,	%o2
	fabss	%f19,	%f28
	xnorcc	%l2,	0x0CF6,	%l1
	fmovrsne	%i7,	%f11,	%f19
	edge16n	%l0,	%o5,	%o7
	movrlez	%g7,	%g6,	%g5
	sethi	0x1971,	%g1
	sra	%i4,	0x0D,	%o3
	xnor	%l6,	%o4,	%o0
	movrgez	%l3,	%i2,	%g2
	lduw	[%l7 + 0x14],	%o1
	stw	%i5,	[%l7 + 0x44]
	fpsub32s	%f26,	%f8,	%f21
	xorcc	%i3,	%g4,	%i1
	smulcc	%g3,	%l4,	%o6
	movleu	%icc,	%i6,	%i0
	fxnors	%f4,	%f23,	%f28
	subcc	%o2,	%l5,	%l1
	orncc	%i7,	%l2,	%l0
	movrlez	%o5,	0x3FB,	%g7
	andncc	%g6,	%g5,	%g1
	ldsw	[%l7 + 0x7C],	%o7
	edge16	%o3,	%l6,	%o4
	lduh	[%l7 + 0x54],	%i4
	edge16l	%o0,	%i2,	%l3
	fmul8x16	%f5,	%f16,	%f4
	stb	%g2,	[%l7 + 0x4C]
	srax	%i5,	%i3,	%g4
	array32	%o1,	%g3,	%l4
	movpos	%icc,	%i1,	%o6
	subc	%i6,	%o2,	%l5
	or	%l1,	0x1C13,	%i0
	edge32ln	%l2,	%l0,	%i7
	orn	%g7,	%o5,	%g5
	movcc	%xcc,	%g6,	%g1
	sra	%o3,	%o7,	%o4
	edge16ln	%l6,	%i4,	%i2
	fmovrsgz	%l3,	%f3,	%f10
	srlx	%g2,	%i5,	%i3
	ldsw	[%l7 + 0x24],	%g4
	movvs	%xcc,	%o1,	%g3
	movleu	%icc,	%o0,	%l4
	fpadd16	%f30,	%f4,	%f12
	fpsub32	%f16,	%f22,	%f24
	stb	%o6,	[%l7 + 0x71]
	andn	%i6,	0x1185,	%i1
	fmul8ulx16	%f10,	%f16,	%f30
	edge16l	%l5,	%l1,	%i0
	sll	%l2,	0x01,	%o2
	addcc	%l0,	0x1E34,	%g7
	orn	%o5,	%i7,	%g5
	movre	%g1,	0x026,	%g6
	edge32n	%o7,	%o3,	%l6
	fmovd	%f20,	%f26
	lduh	[%l7 + 0x6A],	%o4
	fmovrse	%i4,	%f23,	%f3
	fsrc2	%f26,	%f24
	fmovdne	%icc,	%f0,	%f17
	movre	%i2,	%l3,	%g2
	subccc	%i3,	%g4,	%i5
	fmovsn	%icc,	%f17,	%f13
	fpsub16	%f4,	%f0,	%f24
	fmovsgu	%icc,	%f24,	%f10
	movcs	%icc,	%o1,	%o0
	ldd	[%l7 + 0x58],	%f22
	andcc	%g3,	0x02C9,	%o6
	sethi	0x1D35,	%l4
	std	%f22,	[%l7 + 0x50]
	subccc	%i6,	%i1,	%l5
	sdiv	%i0,	0x120C,	%l1
	movn	%xcc,	%o2,	%l2
	mulx	%g7,	0x0822,	%l0
	movrlz	%i7,	%g5,	%o5
	movn	%xcc,	%g6,	%o7
	orncc	%g1,	%l6,	%o3
	movg	%icc,	%i4,	%i2
	edge16ln	%l3,	%g2,	%i3
	fmul8x16	%f20,	%f2,	%f8
	sethi	0x15A6,	%o4
	ldsb	[%l7 + 0x30],	%g4
	edge32n	%o1,	%i5,	%g3
	andn	%o0,	0x0CA1,	%o6
	movcs	%icc,	%i6,	%i1
	fcmpeq32	%f30,	%f20,	%l4
	sdivcc	%i0,	0x1708,	%l5
	stw	%o2,	[%l7 + 0x2C]
	ldsw	[%l7 + 0x2C],	%l2
	std	%f30,	[%l7 + 0x40]
	movcc	%xcc,	%l1,	%g7
	edge8ln	%i7,	%g5,	%l0
	fcmpd	%fcc3,	%f12,	%f28
	fnegd	%f26,	%f8
	udivx	%g6,	0x03ED,	%o7
	sethi	0x194A,	%o5
	fmovrse	%l6,	%f0,	%f24
	movcs	%xcc,	%g1,	%o3
	popc	%i4,	%i2
	edge32l	%l3,	%g2,	%o4
	fxors	%f6,	%f1,	%f0
	fmovsg	%xcc,	%f1,	%f31
	stx	%i3,	[%l7 + 0x50]
	fcmpne32	%f26,	%f12,	%o1
	ldsw	[%l7 + 0x48],	%i5
	movgu	%icc,	%g4,	%o0
	alignaddr	%o6,	%i6,	%g3
	move	%xcc,	%i1,	%l4
	edge32	%l5,	%i0,	%l2
	movrgez	%l1,	%o2,	%i7
	sir	0x0B78
	sth	%g7,	[%l7 + 0x30]
	fmovdvs	%xcc,	%f7,	%f2
	andcc	%g5,	0x0A24,	%g6
	bshuffle	%f0,	%f28,	%f6
	save %l0, %o7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f7,	%f0
	fmovdle	%xcc,	%f25,	%f25
	edge16ln	%g1,	%l6,	%i4
	fcmpes	%fcc2,	%f25,	%f8
	edge32l	%i2,	%l3,	%g2
	fand	%f8,	%f16,	%f30
	ldd	[%l7 + 0x28],	%o2
	fmovdneg	%xcc,	%f26,	%f6
	subc	%i3,	0x0F5B,	%o1
	sdivcc	%i5,	0x0862,	%o4
	subcc	%o0,	0x1E5C,	%o6
	movl	%xcc,	%g4,	%g3
	sub	%i6,	0x1E67,	%l4
	xor	%l5,	0x11B6,	%i0
	movre	%i1,	%l2,	%l1
	stx	%o2,	[%l7 + 0x50]
	srax	%i7,	%g7,	%g6
	movcs	%icc,	%g5,	%l0
	xor	%o5,	%g1,	%l6
	fmovdpos	%icc,	%f13,	%f10
	movrgez	%o7,	%i4,	%i2
	umul	%l3,	0x11F1,	%o3
	movne	%icc,	%g2,	%o1
	st	%f31,	[%l7 + 0x58]
	fmovsleu	%icc,	%f28,	%f31
	edge16ln	%i3,	%o4,	%i5
	fmovdge	%icc,	%f30,	%f19
	edge32ln	%o0,	%g4,	%o6
	movcc	%icc,	%i6,	%g3
	lduw	[%l7 + 0x68],	%l5
	udivcc	%i0,	0x0D89,	%i1
	udivcc	%l4,	0x0D79,	%l1
	sdivx	%l2,	0x1A1B,	%o2
	st	%f9,	[%l7 + 0x28]
	fmovdcc	%icc,	%f0,	%f3
	sdiv	%i7,	0x0217,	%g7
	udivcc	%g5,	0x1157,	%g6
	popc	%l0,	%o5
	alignaddrl	%l6,	%g1,	%o7
	movrgez	%i2,	0x30C,	%l3
	fnands	%f30,	%f5,	%f3
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	addccc	%o1,	0x1A82,	%i4
	fnand	%f2,	%f16,	%f8
	edge32n	%o4,	%i5,	%o0
	edge32l	%i3,	%g4,	%o6
	edge8l	%i6,	%g3,	%i0
	sra	%i1,	%l5,	%l1
	movcs	%xcc,	%l2,	%l4
	add	%o2,	%i7,	%g7
	movrgez	%g5,	0x20F,	%l0
	fsrc1	%f8,	%f26
	edge16n	%o5,	%l6,	%g1
	sethi	0x0175,	%o7
	edge16l	%g6,	%i2,	%o3
	pdist	%f26,	%f20,	%f4
	edge32ln	%l3,	%o1,	%g2
	move	%xcc,	%o4,	%i4
	fpadd16	%f12,	%f4,	%f20
	fornot2	%f16,	%f2,	%f0
	sll	%o0,	0x1C,	%i5
	fandnot2	%f22,	%f16,	%f28
	movneg	%xcc,	%g4,	%i3
	subc	%i6,	%g3,	%o6
	sdivcc	%i1,	0x1979,	%l5
	xorcc	%l1,	%i0,	%l4
	fmovdleu	%icc,	%f29,	%f7
	edge8l	%o2,	%l2,	%g7
	addcc	%g5,	%i7,	%l0
	edge8	%o5,	%l6,	%g1
	fpsub16	%f6,	%f24,	%f4
	addcc	%o7,	0x07E3,	%i2
	edge16l	%g6,	%l3,	%o1
	mulscc	%o3,	0x0FE9,	%o4
	popc	%i4,	%o0
	fmovdle	%icc,	%f20,	%f1
	stw	%i5,	[%l7 + 0x48]
	popc	%g4,	%i3
	for	%f0,	%f6,	%f22
	sra	%g2,	%i6,	%g3
	fands	%f21,	%f28,	%f2
	fnegd	%f28,	%f0
	umul	%i1,	0x0A19,	%l5
	edge16	%l1,	%i0,	%o6
	ldub	[%l7 + 0x7E],	%l4
	movg	%xcc,	%o2,	%g7
	movcs	%xcc,	%g5,	%i7
	fmovdl	%xcc,	%f11,	%f21
	movvc	%icc,	%l0,	%l2
	fmovsne	%icc,	%f25,	%f2
	ldub	[%l7 + 0x43],	%l6
	umul	%o5,	%g1,	%o7
	movn	%icc,	%i2,	%l3
	stb	%g6,	[%l7 + 0x2F]
	sllx	%o3,	%o4,	%o1
	edge32n	%o0,	%i4,	%i5
	movneg	%icc,	%g4,	%i3
	movrgz	%i6,	0x188,	%g3
	ldx	[%l7 + 0x58],	%g2
	orcc	%l5,	0x12DD,	%l1
	lduh	[%l7 + 0x1C],	%i1
	fandnot1	%f16,	%f20,	%f6
	and	%i0,	0x1551,	%o6
	movvc	%xcc,	%o2,	%g7
	subc	%l4,	%i7,	%l0
	fmovrdgez	%l2,	%f8,	%f20
	stw	%g5,	[%l7 + 0x58]
	lduh	[%l7 + 0x60],	%l6
	mova	%xcc,	%g1,	%o7
	orncc	%o5,	%l3,	%i2
	st	%f13,	[%l7 + 0x18]
	fsrc1	%f18,	%f22
	sethi	0x17AA,	%o3
	sll	%g6,	0x10,	%o1
	umulcc	%o4,	0x0964,	%i4
	edge32n	%i5,	%g4,	%o0
	fnot1s	%f23,	%f19
	fmovdl	%icc,	%f14,	%f28
	edge16ln	%i3,	%i6,	%g2
	fmovsleu	%icc,	%f22,	%f1
	ldsh	[%l7 + 0x50],	%l5
	fmovspos	%icc,	%f10,	%f27
	fmovdcc	%xcc,	%f8,	%f15
	andcc	%l1,	%i1,	%i0
	fmovdne	%xcc,	%f8,	%f13
	stw	%g3,	[%l7 + 0x6C]
	movpos	%xcc,	%o2,	%o6
	smul	%g7,	%i7,	%l4
	save %l0, %g5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l2,	0x08CB,	%o7
	ldx	[%l7 + 0x48],	%g1
	sub	%l3,	%i2,	%o3
	mulscc	%o5,	0x043C,	%g6
	addc	%o1,	0x03E0,	%i4
	fone	%f20
	movrlez	%i5,	%g4,	%o4
	fzero	%f8
	ld	[%l7 + 0x68],	%f26
	lduw	[%l7 + 0x44],	%o0
	movpos	%xcc,	%i6,	%g2
	sdivx	%i3,	0x0A97,	%l5
	fmovsvs	%xcc,	%f26,	%f25
	movrne	%l1,	%i1,	%g3
	orncc	%o2,	0x023A,	%o6
	umul	%i0,	%g7,	%i7
	sdiv	%l0,	0x1B26,	%l4
	umul	%g5,	%l6,	%l2
	smul	%o7,	%l3,	%g1
	fmovdl	%xcc,	%f12,	%f1
	ldd	[%l7 + 0x20],	%o2
	sdivx	%o5,	0x0046,	%i2
	udivcc	%o1,	0x125C,	%i4
	ldsw	[%l7 + 0x74],	%g6
	fmul8x16au	%f21,	%f9,	%f30
	xnorcc	%i5,	%o4,	%g4
	andn	%o0,	%g2,	%i3
	ldsw	[%l7 + 0x58],	%l5
	ldd	[%l7 + 0x70],	%l0
	alignaddrl	%i6,	%g3,	%i1
	addccc	%o2,	%i0,	%g7
	movvs	%icc,	%o6,	%l0
	ldsb	[%l7 + 0x76],	%l4
	movle	%icc,	%i7,	%g5
	lduw	[%l7 + 0x30],	%l6
	addcc	%o7,	%l3,	%l2
	movcs	%xcc,	%g1,	%o3
	edge32ln	%i2,	%o5,	%i4
	add	%g6,	0x00B6,	%i5
	fnegd	%f4,	%f22
	movre	%o1,	0x345,	%g4
	fxnor	%f26,	%f30,	%f4
	andn	%o0,	0x03B9,	%o4
	array32	%i3,	%g2,	%l1
	fcmpne32	%f14,	%f20,	%i6
	fmovdleu	%icc,	%f2,	%f30
	sdivcc	%g3,	0x1DD9,	%l5
	stw	%i1,	[%l7 + 0x10]
	fnot2s	%f7,	%f20
	ldx	[%l7 + 0x20],	%i0
	fornot2s	%f26,	%f14,	%f15
	fcmpes	%fcc0,	%f7,	%f6
	lduw	[%l7 + 0x44],	%g7
	alignaddr	%o6,	%o2,	%l4
	fnegs	%f30,	%f0
	or	%i7,	%l0,	%l6
	addc	%o7,	0x1F19,	%l3
	fmovspos	%xcc,	%f18,	%f4
	sub	%l2,	0x053D,	%g5
	sra	%o3,	%g1,	%o5
	popc	%i2,	%g6
	edge16	%i5,	%i4,	%o1
	fmovsvs	%xcc,	%f25,	%f7
	fmovdgu	%icc,	%f13,	%f5
	sllx	%o0,	0x03,	%g4
	fones	%f5
	move	%icc,	%i3,	%o4
	or	%g2,	0x0819,	%i6
	sth	%l1,	[%l7 + 0x64]
	movvc	%icc,	%g3,	%l5
	array16	%i1,	%i0,	%g7
	fornot1	%f14,	%f22,	%f10
	movvc	%icc,	%o2,	%l4
	movl	%icc,	%o6,	%l0
	sir	0x0A7F
	ldd	[%l7 + 0x70],	%f22
	srlx	%l6,	0x1A,	%i7
	srax	%o7,	%l3,	%l2
	umul	%o3,	0x10DE,	%g5
	srl	%o5,	%g1,	%g6
	ldub	[%l7 + 0x68],	%i2
	fandnot1	%f2,	%f24,	%f24
	nop
	set	0x4C, %i3
	lduh	[%l7 + %i3],	%i4
	fmul8x16al	%f31,	%f14,	%f4
	ldx	[%l7 + 0x40],	%i5
	ldsw	[%l7 + 0x78],	%o1
	fnands	%f19,	%f7,	%f14
	orn	%g4,	0x0214,	%o0
	udivcc	%o4,	0x18D1,	%g2
	orn	%i6,	%l1,	%g3
	ldsw	[%l7 + 0x24],	%l5
	movne	%xcc,	%i3,	%i1
	movle	%icc,	%g7,	%i0
	orncc	%l4,	0x102A,	%o6
	srax	%o2,	%l6,	%l0
	movcs	%icc,	%i7,	%o7
	fmovsa	%xcc,	%f24,	%f25
	xnor	%l3,	0x15A8,	%l2
	fmovscs	%xcc,	%f18,	%f4
	movvs	%icc,	%g5,	%o3
	ldx	[%l7 + 0x10],	%o5
	fmovdpos	%icc,	%f1,	%f31
	sllx	%g6,	%i2,	%i4
	movcc	%xcc,	%g1,	%i5
	edge16	%o1,	%o0,	%o4
	fcmpgt32	%f22,	%f12,	%g4
	fmovdg	%icc,	%f20,	%f4
	mulscc	%i6,	%l1,	%g3
	fmovrde	%g2,	%f18,	%f18
	xnorcc	%i3,	%l5,	%g7
	alignaddrl	%i0,	%l4,	%i1
	smul	%o6,	0x0CD0,	%o2
	fmuld8ulx16	%f25,	%f21,	%f6
	fpadd32	%f0,	%f18,	%f22
	sethi	0x048C,	%l0
	ldsb	[%l7 + 0x2B],	%l6
	movvc	%icc,	%i7,	%o7
	sdivcc	%l2,	0x0556,	%g5
	umul	%l3,	0x1F09,	%o5
	edge16ln	%g6,	%i2,	%i4
	restore %g1, %i5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o0,	%o4
	fabss	%f21,	%f29
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	fornot2s	%f4,	%f16,	%f2
	umul	%l1,	%g3,	%g2
	xor	%i6,	%l5,	%i3
	mulx	%i0,	0x11C7,	%l4
	mova	%icc,	%i1,	%o6
	ldd	[%l7 + 0x68],	%f10
	udivcc	%o2,	0x14B1,	%g7
	andncc	%l0,	%i7,	%l6
	fmul8sux16	%f0,	%f30,	%f26
	fsrc2	%f18,	%f2
	alignaddr	%o7,	%l2,	%l3
	umulcc	%o5,	%g5,	%g6
	movgu	%icc,	%i4,	%i2
	xorcc	%g1,	0x0C0C,	%o1
	ldub	[%l7 + 0x76],	%o0
	st	%f25,	[%l7 + 0x4C]
	ldub	[%l7 + 0x37],	%i5
	sdiv	%o4,	0x05A2,	%g4
	movrlz	%l1,	%g3,	%o3
	fmovse	%icc,	%f1,	%f6
	movge	%icc,	%g2,	%i6
	movne	%xcc,	%l5,	%i0
	edge8n	%l4,	%i1,	%i3
	subcc	%o6,	%o2,	%l0
	udivcc	%i7,	0x1C51,	%g7
	movneg	%icc,	%o7,	%l6
	movrgz	%l2,	%o5,	%g5
	fmovdg	%icc,	%f27,	%f27
	orncc	%g6,	%i4,	%i2
	andncc	%l3,	%o1,	%o0
	sth	%g1,	[%l7 + 0x74]
	stb	%o4,	[%l7 + 0x56]
	sdivcc	%g4,	0x17AD,	%l1
	fmuld8ulx16	%f4,	%f6,	%f26
	std	%f20,	[%l7 + 0x78]
	fcmpes	%fcc2,	%f24,	%f18
	andncc	%i5,	%o3,	%g2
	edge16	%i6,	%l5,	%i0
	fmovsneg	%xcc,	%f24,	%f8
	umul	%l4,	%i1,	%g3
	fandnot2	%f6,	%f18,	%f2
	edge32n	%o6,	%i3,	%l0
	xor	%i7,	%g7,	%o2
	subc	%l6,	%o7,	%o5
	udiv	%l2,	0x1CB8,	%g5
	ldsw	[%l7 + 0x18],	%g6
	or	%i2,	0x1611,	%i4
	edge16ln	%o1,	%o0,	%l3
	popc	%o4,	%g4
	and	%l1,	0x0E6D,	%i5
	sir	0x0D7E
	addccc	%o3,	0x09EF,	%g1
	ld	[%l7 + 0x68],	%f29
	sethi	0x1651,	%g2
	fpsub16s	%f6,	%f11,	%f3
	lduh	[%l7 + 0x52],	%l5
	xnor	%i6,	%i0,	%i1
	movpos	%xcc,	%l4,	%g3
	srlx	%i3,	0x12,	%o6
	fmovsg	%xcc,	%f16,	%f27
	sra	%i7,	%g7,	%o2
	movg	%icc,	%l6,	%l0
	fmovsvs	%xcc,	%f6,	%f31
	movrne	%o5,	0x078,	%o7
	addccc	%g5,	0x15BA,	%l2
	sdivcc	%g6,	0x136C,	%i4
	xnor	%i2,	0x02A9,	%o1
	udivx	%o0,	0x0059,	%o4
	faligndata	%f20,	%f10,	%f10
	orcc	%g4,	0x1231,	%l3
	array16	%i5,	%l1,	%g1
	stw	%o3,	[%l7 + 0x64]
	subcc	%g2,	0x0AEA,	%l5
	sdivcc	%i0,	0x0EA5,	%i6
	movrne	%l4,	0x14F,	%i1
	ld	[%l7 + 0x34],	%f19
	ldsb	[%l7 + 0x3A],	%i3
	fnegd	%f30,	%f6
	fmuld8ulx16	%f13,	%f17,	%f4
	save %o6, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o2,	0x031D,	%g3
	edge8l	%l6,	%l0,	%o5
	xnorcc	%g5,	%l2,	%o7
	addc	%i4,	%g6,	%i2
	move	%icc,	%o1,	%o4
	movl	%icc,	%o0,	%g4
	movvc	%xcc,	%l3,	%i5
	umulcc	%l1,	%o3,	%g2
	fmovrslez	%l5,	%f3,	%f24
	add	%g1,	0x1E78,	%i0
	andn	%i6,	0x1844,	%i1
	stb	%l4,	[%l7 + 0x73]
	sllx	%o6,	%i3,	%i7
	subc	%o2,	%g3,	%g7
	fmul8x16au	%f12,	%f24,	%f26
	lduh	[%l7 + 0x54],	%l0
	movvc	%xcc,	%o5,	%g5
	movre	%l2,	0x3D8,	%o7
	fandnot2s	%f3,	%f30,	%f18
	array16	%l6,	%g6,	%i2
	fandnot2	%f24,	%f0,	%f10
	fzeros	%f6
	mulscc	%i4,	0x0AD2,	%o1
	movge	%xcc,	%o0,	%g4
	stw	%o4,	[%l7 + 0x28]
	addcc	%i5,	%l1,	%l3
	sra	%g2,	%l5,	%g1
	movcs	%icc,	%i0,	%o3
	sdivcc	%i6,	0x1E01,	%i1
	udivx	%l4,	0x1EB3,	%i3
	fpsub16s	%f7,	%f4,	%f23
	addcc	%o6,	%o2,	%i7
	addccc	%g3,	0x0FE9,	%l0
	movcc	%xcc,	%g7,	%g5
	srax	%o5,	%l2,	%l6
	movrne	%g6,	0x36F,	%i2
	save %o7, %i4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o0,	%g4
	fmovrse	%o4,	%f13,	%f4
	edge8ln	%l1,	%l3,	%i5
	subcc	%g2,	%l5,	%g1
	sethi	0x0E05,	%o3
	edge32l	%i6,	%i0,	%l4
	ldx	[%l7 + 0x70],	%i3
	stb	%o6,	[%l7 + 0x2C]
	movrne	%o2,	0x37C,	%i7
	udivcc	%i1,	0x1803,	%g3
	xor	%g7,	%l0,	%o5
	subccc	%l2,	0x199D,	%l6
	udivx	%g6,	0x0842,	%g5
	xorcc	%o7,	%i2,	%o1
	fsrc2s	%f6,	%f30
	fabsd	%f0,	%f0
	xor	%i4,	0x1FC0,	%o0
	fmovrdlez	%o4,	%f12,	%f18
	fmovsge	%xcc,	%f0,	%f23
	sdivx	%l1,	0x1775,	%l3
	movl	%xcc,	%g4,	%g2
	movre	%i5,	0x065,	%g1
	fnot2s	%f29,	%f4
	stb	%o3,	[%l7 + 0x48]
	movrgz	%l5,	0x287,	%i0
	lduh	[%l7 + 0x28],	%i6
	edge32ln	%i3,	%l4,	%o2
	udivx	%i7,	0x0C5B,	%o6
	orncc	%i1,	%g7,	%g3
	ldd	[%l7 + 0x20],	%f6
	smulcc	%o5,	%l2,	%l0
	srax	%g6,	0x12,	%l6
	lduw	[%l7 + 0x78],	%o7
	fcmped	%fcc2,	%f26,	%f24
	nop
	set	0x28, %g2
	stx	%g5,	[%l7 + %g2]
	udivx	%o1,	0x1562,	%i4
	edge8n	%o0,	%i2,	%o4
	andcc	%l1,	%l3,	%g4
	fmovsg	%icc,	%f24,	%f22
	fxors	%f24,	%f22,	%f12
	fpack32	%f2,	%f0,	%f16
	restore %g2, %i5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l5,	%o3
	std	%f0,	[%l7 + 0x18]
	fxnors	%f0,	%f7,	%f7
	ld	[%l7 + 0x2C],	%f18
	sub	%i6,	0x0599,	%i3
	movne	%icc,	%l4,	%o2
	fmovs	%f29,	%f24
	xor	%i7,	0x0322,	%o6
	fpadd32s	%f15,	%f21,	%f22
	fpadd16s	%f25,	%f7,	%f8
	ldsb	[%l7 + 0x3D],	%i0
	mulscc	%g7,	0x1AB9,	%g3
	fmovrdgz	%o5,	%f10,	%f14
	fnand	%f14,	%f16,	%f8
	sdiv	%l2,	0x120E,	%i1
	sdivx	%l0,	0x0722,	%l6
	movrlz	%o7,	0x313,	%g6
	edge32ln	%o1,	%g5,	%o0
	edge32ln	%i4,	%i2,	%o4
	fmovrslez	%l1,	%f29,	%f25
	std	%f12,	[%l7 + 0x60]
	fmovrde	%l3,	%f30,	%f24
	fmovspos	%icc,	%f12,	%f26
	movvc	%icc,	%g2,	%i5
	fornot1	%f16,	%f0,	%f10
	srax	%g1,	0x06,	%l5
	fmovspos	%icc,	%f10,	%f4
	sth	%o3,	[%l7 + 0x5C]
	fcmpne16	%f10,	%f26,	%i6
	sethi	0x07C9,	%g4
	subccc	%l4,	%o2,	%i7
	fmovsneg	%icc,	%f20,	%f11
	edge8ln	%o6,	%i0,	%g7
	move	%icc,	%g3,	%i3
	addccc	%o5,	%i1,	%l2
	stw	%l0,	[%l7 + 0x54]
	edge16l	%o7,	%l6,	%o1
	andncc	%g5,	%g6,	%i4
	fands	%f10,	%f24,	%f17
	stw	%i2,	[%l7 + 0x64]
	fabss	%f19,	%f22
	alignaddr	%o4,	%l1,	%o0
	stx	%l3,	[%l7 + 0x30]
	edge8	%g2,	%i5,	%l5
	sra	%o3,	0x08,	%g1
	edge16l	%i6,	%l4,	%o2
	fone	%f22
	fpsub32	%f2,	%f24,	%f10
	subc	%i7,	0x00CA,	%g4
	addc	%o6,	%i0,	%g7
	edge32ln	%g3,	%i3,	%o5
	xor	%l2,	0x14FA,	%i1
	fsrc1	%f28,	%f2
	addcc	%o7,	0x03F0,	%l6
	siam	0x0
	movne	%icc,	%l0,	%o1
	ldsw	[%l7 + 0x54],	%g6
	ldsh	[%l7 + 0x2A],	%g5
	movgu	%icc,	%i4,	%o4
	movneg	%xcc,	%i2,	%l1
	ldx	[%l7 + 0x60],	%l3
	lduh	[%l7 + 0x32],	%g2
	fandnot1s	%f31,	%f31,	%f11
	fors	%f2,	%f30,	%f19
	andcc	%i5,	%o0,	%l5
	edge32	%o3,	%i6,	%l4
	addcc	%g1,	0x0649,	%o2
	sdivx	%i7,	0x0FFD,	%o6
	xnorcc	%g4,	0x1B9B,	%g7
	orncc	%i0,	0x1B51,	%i3
	fmovdleu	%xcc,	%f8,	%f14
	edge32	%o5,	%l2,	%i1
	ld	[%l7 + 0x58],	%f0
	xnor	%o7,	%g3,	%l6
	array32	%l0,	%o1,	%g6
	fnot2	%f20,	%f4
	edge8n	%i4,	%g5,	%i2
	edge16ln	%o4,	%l1,	%l3
	ldub	[%l7 + 0x1B],	%i5
	fmovrdne	%o0,	%f24,	%f24
	udiv	%l5,	0x0C00,	%g2
	edge8ln	%o3,	%i6,	%g1
	addccc	%o2,	0x131E,	%l4
	umulcc	%o6,	%g4,	%i7
	or	%i0,	%i3,	%g7
	movrgez	%o5,	%i1,	%o7
	sethi	0x0E44,	%g3
	umulcc	%l6,	0x1DBB,	%l0
	alignaddrl	%l2,	%g6,	%o1
	srl	%i4,	0x0C,	%i2
	fmovde	%xcc,	%f5,	%f18
	andn	%o4,	%g5,	%l3
	or	%l1,	%i5,	%l5
	edge32n	%g2,	%o3,	%i6
	fmul8ulx16	%f8,	%f22,	%f24
	movvc	%xcc,	%g1,	%o2
	movrgz	%o0,	0x325,	%o6
	movn	%xcc,	%l4,	%i7
	edge32n	%g4,	%i3,	%g7
	array16	%i0,	%o5,	%i1
	fors	%f11,	%f29,	%f8
	fpsub32	%f4,	%f26,	%f28
	fmovrslez	%o7,	%f21,	%f31
	udivcc	%l6,	0x0B5E,	%l0
	edge8	%l2,	%g6,	%o1
	ldsw	[%l7 + 0x08],	%i4
	alignaddrl	%i2,	%o4,	%g5
	sra	%l3,	0x0D,	%g3
	andn	%l1,	%l5,	%i5
	fmovsn	%icc,	%f23,	%f14
	save %o3, 0x1F6C, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g1,	%i6
	lduw	[%l7 + 0x54],	%o2
	movge	%xcc,	%o6,	%l4
	orcc	%i7,	%g4,	%o0
	fpack16	%f22,	%f22
	movrlez	%g7,	0x157,	%i3
	st	%f1,	[%l7 + 0x2C]
	ldd	[%l7 + 0x20],	%f16
	movl	%icc,	%o5,	%i0
	array16	%o7,	%i1,	%l6
	movcc	%icc,	%l0,	%g6
	addcc	%o1,	0x076A,	%l2
	movgu	%icc,	%i4,	%o4
	smulcc	%i2,	%l3,	%g5
	subc	%g3,	0x1CCA,	%l5
	movle	%icc,	%l1,	%o3
	popc	%g2,	%i5
	edge32l	%i6,	%o2,	%g1
	movne	%xcc,	%o6,	%i7
	fmul8x16au	%f7,	%f26,	%f16
	popc	0x1EBF,	%g4
	movcc	%xcc,	%o0,	%l4
	udiv	%i3,	0x1E83,	%g7
	udivcc	%i0,	0x037E,	%o5
	ldd	[%l7 + 0x68],	%f14
	std	%f4,	[%l7 + 0x58]
	fmovrsgz	%o7,	%f3,	%f20
	nop
	set	0x1C, %i1
	lduh	[%l7 + %i1],	%l6
	edge32n	%i1,	%l0,	%o1
	orcc	%l2,	%g6,	%i4
	addc	%o4,	%l3,	%g5
	ldsb	[%l7 + 0x5A],	%g3
	ldsw	[%l7 + 0x68],	%i2
	movleu	%xcc,	%l5,	%o3
	sdivx	%l1,	0x1186,	%i5
	lduh	[%l7 + 0x0E],	%g2
	fmovdg	%icc,	%f2,	%f8
	pdist	%f2,	%f10,	%f30
	fmovrslez	%i6,	%f24,	%f0
	fmovdne	%xcc,	%f10,	%f22
	alignaddr	%o2,	%o6,	%g1
	orn	%i7,	%o0,	%l4
	array8	%g4,	%i3,	%i0
	ldx	[%l7 + 0x78],	%o5
	edge8n	%o7,	%g7,	%l6
	movvs	%icc,	%i1,	%o1
	addc	%l0,	%l2,	%i4
	edge16n	%o4,	%g6,	%g5
	movge	%icc,	%g3,	%l3
	movvc	%xcc,	%l5,	%o3
	fmovdgu	%icc,	%f23,	%f3
	sethi	0x1647,	%l1
	alignaddr	%i2,	%i5,	%i6
	sllx	%o2,	%g2,	%g1
	sub	%i7,	%o6,	%l4
	srlx	%g4,	%i3,	%i0
	fmovsl	%icc,	%f8,	%f16
	move	%xcc,	%o0,	%o5
	smulcc	%o7,	%l6,	%i1
	ldd	[%l7 + 0x20],	%o0
	addccc	%l0,	%l2,	%i4
	sth	%g7,	[%l7 + 0x48]
	ldsw	[%l7 + 0x60],	%o4
	andcc	%g5,	%g6,	%l3
	orn	%l5,	%o3,	%g3
	srl	%i2,	%i5,	%l1
	orcc	%i6,	%o2,	%g1
	std	%f10,	[%l7 + 0x10]
	movgu	%icc,	%i7,	%o6
	srl	%l4,	%g2,	%i3
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	movge	%xcc,	%o5,	%l6
	orncc	%i1,	0x0A33,	%o7
	umulcc	%l0,	0x05FD,	%o1
	fcmple32	%f14,	%f20,	%i4
	ldsw	[%l7 + 0x0C],	%l2
	movrgez	%o4,	%g7,	%g6
	fpadd32	%f6,	%f30,	%f30
	edge16	%l3,	%g5,	%l5
	udiv	%o3,	0x1858,	%i2
	subc	%g3,	0x1054,	%l1
	fandnot2	%f30,	%f28,	%f8
	movvs	%xcc,	%i6,	%i5
	lduh	[%l7 + 0x36],	%o2
	umulcc	%i7,	%g1,	%o6
	fornot1	%f20,	%f10,	%f24
	fcmpgt16	%f22,	%f18,	%l4
	stb	%g2,	[%l7 + 0x26]
	orn	%i3,	0x1108,	%i0
	move	%xcc,	%o0,	%g4
	ldx	[%l7 + 0x78],	%o5
	smulcc	%l6,	%i1,	%l0
	ldsw	[%l7 + 0x24],	%o1
	subcc	%o7,	%i4,	%l2
	umul	%g7,	%o4,	%g6
	fpack16	%f16,	%f26
	ldsh	[%l7 + 0x6E],	%l3
	sll	%l5,	%o3,	%i2
	movre	%g3,	%l1,	%g5
	xor	%i6,	0x1145,	%i5
	andncc	%o2,	%g1,	%o6
	fabss	%f2,	%f1
	stb	%i7,	[%l7 + 0x23]
	st	%f16,	[%l7 + 0x34]
	stx	%l4,	[%l7 + 0x08]
	xor	%g2,	%i3,	%o0
	fcmpes	%fcc2,	%f20,	%f31
	fmul8x16al	%f19,	%f28,	%f20
	ldd	[%l7 + 0x68],	%f12
	sll	%g4,	%i0,	%l6
	fmovda	%xcc,	%f4,	%f29
	st	%f28,	[%l7 + 0x1C]
	move	%icc,	%o5,	%i1
	movrgez	%o1,	0x0DE,	%l0
	fmovsvs	%xcc,	%f25,	%f27
	movvs	%icc,	%o7,	%l2
	movneg	%xcc,	%g7,	%o4
	fmovrdgz	%i4,	%f0,	%f28
	srlx	%l3,	0x01,	%g6
	fcmped	%fcc3,	%f30,	%f8
	xorcc	%o3,	0x0775,	%i2
	movrlz	%l5,	0x01B,	%l1
	fmovsge	%icc,	%f6,	%f20
	ldd	[%l7 + 0x30],	%f26
	fmovrdgez	%g5,	%f28,	%f12
	sra	%g3,	%i5,	%i6
	edge16	%g1,	%o2,	%i7
	sdivcc	%o6,	0x0A7F,	%g2
	movneg	%xcc,	%l4,	%o0
	popc	%g4,	%i3
	fcmple32	%f20,	%f14,	%i0
	fone	%f6
	fornot1s	%f14,	%f12,	%f29
	smul	%l6,	0x14FC,	%i1
	fnands	%f12,	%f23,	%f29
	edge16l	%o1,	%l0,	%o7
	sll	%o5,	0x11,	%l2
	fpsub16	%f6,	%f2,	%f14
	lduw	[%l7 + 0x2C],	%o4
	fmovsleu	%icc,	%f1,	%f2
	addccc	%g7,	%i4,	%l3
	ld	[%l7 + 0x64],	%f19
	movgu	%xcc,	%o3,	%i2
	fandnot1s	%f24,	%f10,	%f8
	movcc	%xcc,	%l5,	%g6
	alignaddr	%l1,	%g5,	%i5
	nop
	set	0x08, %i6
	lduw	[%l7 + %i6],	%g3
	udivx	%g1,	0x044E,	%i6
	edge16n	%i7,	%o6,	%g2
	save %l4, 0x01F5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o2,	0x1854,	%g4
	edge32ln	%i3,	%i0,	%i1
	movne	%icc,	%l6,	%l0
	fmovsvc	%xcc,	%f10,	%f22
	restore %o1, %o5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l2,	%o4
	fpsub16s	%f6,	%f28,	%f16
	ld	[%l7 + 0x20],	%f0
	sdivx	%i4,	0x116B,	%g7
	array32	%o3,	%i2,	%l3
	smulcc	%l5,	0x060B,	%l1
	fabsd	%f0,	%f10
	stw	%g5,	[%l7 + 0x54]
	movn	%xcc,	%g6,	%i5
	mulscc	%g1,	0x0222,	%g3
	subccc	%i6,	%i7,	%g2
	andncc	%l4,	%o6,	%o0
	array32	%o2,	%g4,	%i0
	fexpand	%f22,	%f26
	xor	%i3,	0x1047,	%l6
	fcmps	%fcc2,	%f7,	%f0
	lduh	[%l7 + 0x4E],	%l0
	fone	%f2
	movleu	%xcc,	%i1,	%o5
	movg	%icc,	%o1,	%o7
	fmovdpos	%icc,	%f9,	%f17
	ldsh	[%l7 + 0x10],	%o4
	edge16l	%i4,	%g7,	%l2
	alignaddr	%i2,	%o3,	%l3
	orn	%l1,	0x065D,	%l5
	std	%f22,	[%l7 + 0x70]
	orn	%g5,	%g6,	%i5
	st	%f20,	[%l7 + 0x3C]
	sub	%g3,	0x141F,	%i6
	sdiv	%i7,	0x0D4E,	%g1
	fmovsleu	%icc,	%f11,	%f10
	movrgz	%l4,	%g2,	%o6
	andcc	%o0,	%g4,	%o2
	array16	%i0,	%i3,	%l0
	movrgz	%l6,	0x201,	%o5
	movne	%icc,	%o1,	%o7
	movre	%o4,	%i1,	%g7
	movl	%xcc,	%l2,	%i4
	edge8n	%i2,	%o3,	%l1
	edge8ln	%l3,	%g5,	%l5
	sub	%i5,	%g3,	%g6
	edge8l	%i7,	%i6,	%g1
	mulx	%l4,	0x0B85,	%o6
	fornot1s	%f5,	%f16,	%f28
	movrgez	%g2,	0x27A,	%o0
	lduh	[%l7 + 0x48],	%g4
	ldd	[%l7 + 0x68],	%f8
	udivcc	%o2,	0x1CC1,	%i0
	array16	%i3,	%l0,	%o5
	fexpand	%f31,	%f6
	fmovs	%f19,	%f15
	lduw	[%l7 + 0x54],	%l6
	fpsub16	%f24,	%f20,	%f8
	fnands	%f2,	%f23,	%f4
	udivcc	%o7,	0x1D80,	%o1
	movleu	%icc,	%i1,	%o4
	stb	%g7,	[%l7 + 0x49]
	stw	%i4,	[%l7 + 0x58]
	sll	%l2,	0x09,	%i2
	subccc	%l1,	%o3,	%l3
	or	%l5,	0x19C5,	%g5
	andncc	%i5,	%g6,	%i7
	movrlz	%i6,	0x03E,	%g1
	movneg	%xcc,	%g3,	%l4
	fabss	%f23,	%f12
	smulcc	%o6,	%g2,	%o0
	movcc	%xcc,	%o2,	%g4
	fmovdl	%xcc,	%f3,	%f14
	edge32l	%i3,	%l0,	%i0
	movg	%xcc,	%l6,	%o5
	sdivx	%o7,	0x1314,	%i1
	fpack16	%f4,	%f8
	and	%o1,	%o4,	%i4
	edge8	%g7,	%l2,	%i2
	fmovsne	%icc,	%f30,	%f4
	movg	%icc,	%o3,	%l3
	or	%l1,	0x13E0,	%g5
	fnot2	%f14,	%f6
	move	%xcc,	%i5,	%g6
	edge16l	%i7,	%l5,	%i6
	sll	%g3,	0x1E,	%g1
	movn	%icc,	%l4,	%g2
	sth	%o6,	[%l7 + 0x4C]
	sth	%o0,	[%l7 + 0x2C]
	sdivcc	%g4,	0x0139,	%i3
	lduw	[%l7 + 0x2C],	%o2
	xnorcc	%l0,	0x1EAA,	%l6
	fmovsl	%icc,	%f7,	%f8
	orcc	%o5,	%o7,	%i1
	st	%f12,	[%l7 + 0x1C]
	ld	[%l7 + 0x44],	%f23
	array16	%i0,	%o4,	%i4
	edge16	%g7,	%l2,	%o1
	movvc	%icc,	%o3,	%l3
	xnorcc	%l1,	%i2,	%g5
	addc	%g6,	0x11B8,	%i7
	fmovdg	%icc,	%f20,	%f26
	edge8n	%l5,	%i6,	%g3
	udiv	%i5,	0x0177,	%g1
	movne	%icc,	%g2,	%o6
	fmovdpos	%icc,	%f18,	%f16
	mulx	%l4,	%g4,	%i3
	fmovdge	%icc,	%f28,	%f25
	edge8l	%o2,	%o0,	%l0
	edge16	%l6,	%o7,	%i1
	edge32n	%i0,	%o5,	%i4
	fmul8x16al	%f16,	%f7,	%f26
	edge16n	%o4,	%l2,	%g7
	umul	%o1,	%l3,	%l1
	array32	%i2,	%o3,	%g5
	fcmpgt32	%f8,	%f6,	%g6
	movrlez	%i7,	0x197,	%l5
	edge8ln	%i6,	%i5,	%g3
	array8	%g1,	%o6,	%l4
	movle	%xcc,	%g4,	%g2
	fmovsvc	%icc,	%f6,	%f24
	movle	%xcc,	%i3,	%o2
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	sll	%o7,	%i1,	%i0
	movle	%xcc,	%o0,	%i4
	edge32l	%o5,	%l2,	%g7
	ldsh	[%l7 + 0x44],	%o4
	sir	0x0CAC
	movgu	%xcc,	%o1,	%l1
	array16	%l3,	%o3,	%g5
	fmovsa	%icc,	%f6,	%f9
	movrne	%g6,	0x1A8,	%i7
	smulcc	%l5,	0x0262,	%i6
	sub	%i2,	0x0BC8,	%i5
	fmovdneg	%xcc,	%f28,	%f4
	fpadd16s	%f8,	%f21,	%f4
	fand	%f20,	%f28,	%f16
	movrlez	%g3,	0x1B1,	%g1
	mulx	%o6,	0x00CA,	%l4
	nop
	set	0x0B, %o1
	ldub	[%l7 + %o1],	%g2
	fmovdn	%icc,	%f12,	%f28
	movrlez	%g4,	0x21F,	%o2
	stx	%i3,	[%l7 + 0x58]
	stx	%l0,	[%l7 + 0x18]
	nop
	set	0x74, %i4
	lduh	[%l7 + %i4],	%l6
	fmovda	%xcc,	%f8,	%f13
	edge8l	%i1,	%o7,	%o0
	movvc	%icc,	%i4,	%i0
	sll	%l2,	%g7,	%o5
	edge16ln	%o4,	%o1,	%l1
	edge16	%l3,	%o3,	%g5
	ldsw	[%l7 + 0x30],	%g6
	sir	0x1D25
	sra	%l5,	0x0D,	%i7
	srlx	%i2,	%i5,	%g3
	fmovsa	%icc,	%f7,	%f27
	mulscc	%g1,	0x1B4B,	%i6
	movg	%xcc,	%l4,	%o6
	fnot1	%f6,	%f10
	sth	%g2,	[%l7 + 0x5C]
	movle	%icc,	%g4,	%o2
	movgu	%xcc,	%l0,	%i3
	orn	%l6,	%o7,	%o0
	fmovdgu	%xcc,	%f26,	%f2
	umulcc	%i4,	0x1C55,	%i0
	sethi	0x1916,	%i1
	orcc	%g7,	0x1CB7,	%l2
	movcs	%icc,	%o4,	%o5
	fabss	%f18,	%f31
	ldsh	[%l7 + 0x6E],	%l1
	alignaddrl	%l3,	%o1,	%o3
	edge32n	%g6,	%l5,	%i7
	ldx	[%l7 + 0x08],	%i2
	mulx	%g5,	%g3,	%i5
	edge16l	%i6,	%g1,	%l4
	udivcc	%g2,	0x0CEB,	%o6
	ldx	[%l7 + 0x30],	%o2
	fxnors	%f13,	%f7,	%f25
	smulcc	%g4,	%l0,	%l6
	fmovdleu	%icc,	%f19,	%f4
	mova	%xcc,	%o7,	%o0
	ldsh	[%l7 + 0x5E],	%i4
	fmovsgu	%icc,	%f4,	%f24
	ldub	[%l7 + 0x7F],	%i0
	xnor	%i1,	%i3,	%g7
	array16	%o4,	%l2,	%o5
	and	%l3,	0x0BDF,	%l1
	edge32ln	%o1,	%o3,	%g6
	fxnor	%f20,	%f4,	%f6
	fmovrdlz	%l5,	%f30,	%f10
	sll	%i7,	%g5,	%g3
	popc	%i2,	%i5
	ldx	[%l7 + 0x20],	%g1
	ldd	[%l7 + 0x28],	%f26
	fmovrsgz	%l4,	%f27,	%f14
	srlx	%i6,	0x15,	%o6
	fmuld8ulx16	%f19,	%f30,	%f24
	add	%g2,	%g4,	%l0
	movrlz	%l6,	%o2,	%o7
	mulx	%o0,	0x09D9,	%i0
	lduw	[%l7 + 0x70],	%i4
	ldsb	[%l7 + 0x77],	%i1
	fpadd16s	%f29,	%f9,	%f10
	ldub	[%l7 + 0x17],	%g7
	xnor	%o4,	0x059D,	%l2
	edge32	%i3,	%l3,	%l1
	subccc	%o1,	%o5,	%o3
	movle	%xcc,	%g6,	%l5
	movrne	%g5,	%g3,	%i7
	ldsw	[%l7 + 0x7C],	%i5
	array16	%i2,	%l4,	%i6
	srl	%o6,	%g1,	%g4
	movcs	%icc,	%l0,	%l6
	orcc	%o2,	0x1106,	%o7
	fzero	%f26
	save %o0, %g2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x50],	%i4
	subc	%i1,	%g7,	%o4
	sllx	%l2,	%l3,	%i3
	sra	%l1,	%o5,	%o3
	movleu	%icc,	%o1,	%g6
	ldsw	[%l7 + 0x2C],	%l5
	edge16	%g5,	%g3,	%i5
	fmul8ulx16	%f18,	%f16,	%f4
	edge16	%i7,	%i2,	%l4
	edge16	%i6,	%g1,	%o6
	std	%f22,	[%l7 + 0x28]
	movcc	%icc,	%l0,	%g4
	ldd	[%l7 + 0x70],	%i6
	movrne	%o7,	0x3E6,	%o2
	ldsh	[%l7 + 0x3A],	%o0
	movrgz	%g2,	0x049,	%i4
	and	%i0,	%i1,	%g7
	ldsh	[%l7 + 0x0A],	%l2
	add	%o4,	0x11A7,	%i3
	sra	%l1,	%o5,	%o3
	lduw	[%l7 + 0x74],	%l3
	fornot1	%f10,	%f18,	%f26
	sll	%o1,	0x03,	%g6
	edge16n	%l5,	%g3,	%g5
	edge16l	%i7,	%i5,	%l4
	fcmpne32	%f8,	%f22,	%i2
	fpack16	%f26,	%f26
	sir	0x001F
	smul	%g1,	%o6,	%i6
	umul	%g4,	0x18C5,	%l6
	sdiv	%l0,	0x1BB5,	%o7
	fmuld8ulx16	%f23,	%f16,	%f18
	movgu	%icc,	%o0,	%o2
	fmovrdlez	%g2,	%f0,	%f20
	addcc	%i4,	0x01F3,	%i1
	ldub	[%l7 + 0x49],	%i0
	array32	%l2,	%o4,	%i3
	srl	%g7,	0x12,	%o5
	edge32ln	%o3,	%l1,	%l3
	lduw	[%l7 + 0x30],	%o1
	movrgez	%l5,	0x391,	%g3
	andn	%g6,	0x0771,	%i7
	xor	%g5,	0x159F,	%l4
	mulscc	%i2,	0x1703,	%g1
	fpadd16	%f16,	%f28,	%f20
	stw	%i5,	[%l7 + 0x4C]
	array8	%o6,	%g4,	%l6
	udivx	%l0,	0x1E48,	%i6
	subc	%o7,	0x197B,	%o2
	edge8ln	%o0,	%i4,	%i1
	sra	%g2,	%l2,	%i0
	mulx	%o4,	0x115A,	%i3
	xnorcc	%g7,	0x17D7,	%o5
	fand	%f28,	%f4,	%f8
	movrne	%o3,	0x2BB,	%l3
	movre	%o1,	0x296,	%l1
	sth	%g3,	[%l7 + 0x76]
	fmul8x16al	%f21,	%f16,	%f30
	sir	0x03F2
	smulcc	%g6,	0x1779,	%i7
	movcc	%icc,	%l5,	%l4
	subccc	%i2,	%g1,	%i5
	sdivcc	%o6,	0x139B,	%g5
	edge8n	%l6,	%g4,	%i6
	edge32l	%l0,	%o7,	%o0
	fmovrdgez	%o2,	%f22,	%f14
	fcmpd	%fcc1,	%f2,	%f20
	edge16l	%i4,	%i1,	%l2
	movg	%icc,	%i0,	%o4
	smul	%i3,	0x0108,	%g2
	andcc	%g7,	0x0129,	%o5
	ldsh	[%l7 + 0x22],	%o3
	smul	%l3,	%l1,	%g3
	andncc	%g6,	%o1,	%l5
	ldub	[%l7 + 0x59],	%i7
	fcmpeq32	%f4,	%f4,	%l4
	edge16l	%g1,	%i5,	%i2
	andcc	%o6,	%g5,	%g4
	st	%f30,	[%l7 + 0x38]
	fmovs	%f13,	%f8
	edge8n	%i6,	%l6,	%l0
	andncc	%o7,	%o0,	%o2
	orcc	%i1,	0x0B39,	%l2
	nop
	set	0x53, %o5
	ldsb	[%l7 + %o5],	%i0
	and	%o4,	0x0D3D,	%i4
	fmovdpos	%xcc,	%f13,	%f18
	stb	%g2,	[%l7 + 0x59]
	array32	%g7,	%i3,	%o3
	xor	%o5,	%l1,	%g3
	fmovscc	%xcc,	%f4,	%f3
	edge32l	%l3,	%g6,	%l5
	alignaddr	%i7,	%o1,	%l4
	umulcc	%i5,	0x1058,	%i2
	fmuld8ulx16	%f28,	%f10,	%f10
	stw	%g1,	[%l7 + 0x30]
	movrgez	%g5,	%g4,	%i6
	umulcc	%l6,	%o6,	%o7
	smulcc	%o0,	0x16E3,	%l0
	udiv	%i1,	0x083C,	%o2
	alignaddr	%i0,	%l2,	%i4
	st	%f31,	[%l7 + 0x6C]
	fcmpes	%fcc0,	%f10,	%f13
	fpsub16	%f12,	%f0,	%f22
	movcc	%icc,	%g2,	%o4
	edge16l	%g7,	%o3,	%i3
	sth	%o5,	[%l7 + 0x7A]
	ld	[%l7 + 0x2C],	%f0
	faligndata	%f22,	%f24,	%f10
	movcs	%icc,	%l1,	%g3
	umul	%l3,	%g6,	%l5
	udivx	%o1,	0x1ACE,	%l4
	srax	%i7,	%i2,	%g1
	edge32ln	%g5,	%i5,	%g4
	xor	%l6,	0x16DD,	%i6
	orcc	%o7,	%o6,	%o0
	movpos	%icc,	%l0,	%o2
	fnot1	%f2,	%f0
	fnot2s	%f12,	%f25
	std	%f6,	[%l7 + 0x20]
	stw	%i0,	[%l7 + 0x38]
	movvc	%xcc,	%l2,	%i1
	ld	[%l7 + 0x5C],	%f30
	ld	[%l7 + 0x54],	%f29
	sdiv	%g2,	0x02B9,	%o4
	add	%g7,	%i4,	%o3
	srax	%o5,	0x03,	%i3
	mova	%xcc,	%l1,	%l3
	fcmple32	%f18,	%f18,	%g6
	restore %g3, 0x1308, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l5,	0x0B84,	%i7
	ldd	[%l7 + 0x38],	%f16
	movrlz	%i2,	%l4,	%g5
	or	%i5,	0x0E67,	%g4
	movgu	%icc,	%g1,	%l6
	movneg	%xcc,	%i6,	%o7
	fmovrdlz	%o6,	%f8,	%f26
	srax	%o0,	0x1F,	%l0
	sdivx	%o2,	0x03E2,	%l2
	alignaddr	%i1,	%i0,	%g2
	alignaddr	%g7,	%i4,	%o4
	lduw	[%l7 + 0x20],	%o5
	save %o3, 0x1D08, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f28,	%f24,	%i3
	fandnot2s	%f20,	%f24,	%f23
	xor	%l3,	%g3,	%o1
	fmovdpos	%xcc,	%f15,	%f1
	udivcc	%l5,	0x10EA,	%g6
	xorcc	%i2,	0x0966,	%i7
	add	%g5,	0x1316,	%i5
	udiv	%l4,	0x0358,	%g4
	save %l6, %g1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i6,	0x18A7,	%o0
	ldub	[%l7 + 0x61],	%l0
	sllx	%o2,	0x0A,	%l2
	edge8ln	%i1,	%i0,	%g2
	andcc	%o6,	%g7,	%i4
	subc	%o5,	0x0A68,	%o4
	edge16n	%l1,	%o3,	%l3
	xnor	%g3,	%o1,	%l5
	orn	%g6,	%i3,	%i7
	umul	%i2,	0x0817,	%i5
	fmovscc	%xcc,	%f8,	%f17
	movcs	%icc,	%l4,	%g5
	fmovse	%icc,	%f26,	%f9
	edge32	%l6,	%g4,	%o7
	ldsh	[%l7 + 0x42],	%g1
	fandnot2s	%f1,	%f16,	%f1
	sdiv	%o0,	0x0F4C,	%i6
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	fsrc1s	%f31,	%f21
	ldx	[%l7 + 0x68],	%i0
	and	%i1,	0x1BE5,	%g2
	xorcc	%g7,	0x051D,	%i4
	sir	0x1C05
	srax	%o5,	0x12,	%o4
	fand	%f18,	%f8,	%f18
	subcc	%o6,	0x0C16,	%l1
	fmovsvc	%icc,	%f30,	%f30
	umul	%o3,	%g3,	%o1
	movvc	%xcc,	%l5,	%l3
	stw	%i3,	[%l7 + 0x30]
	subcc	%g6,	%i7,	%i2
	fnegd	%f10,	%f6
	movvc	%xcc,	%i5,	%g5
	movrne	%l6,	0x0FC,	%l4
	smulcc	%g4,	%o7,	%o0
	fmovrdgez	%i6,	%f30,	%f2
	ldd	[%l7 + 0x38],	%f18
	addccc	%g1,	0x1224,	%l0
	mova	%icc,	%l2,	%o2
	udiv	%i0,	0x0DF0,	%i1
	andncc	%g7,	%g2,	%o5
	edge32l	%i4,	%o6,	%o4
	ldx	[%l7 + 0x60],	%o3
	fcmple16	%f0,	%f30,	%g3
	sethi	0x0E1C,	%l1
	ld	[%l7 + 0x44],	%f27
	andncc	%l5,	%o1,	%l3
	sdiv	%g6,	0x1408,	%i7
	edge16l	%i2,	%i3,	%i5
	ld	[%l7 + 0x44],	%f25
	orn	%g5,	%l6,	%l4
	stw	%g4,	[%l7 + 0x68]
	andn	%o7,	%o0,	%i6
	stx	%l0,	[%l7 + 0x10]
	ldsh	[%l7 + 0x20],	%g1
	movg	%xcc,	%o2,	%i0
	andcc	%l2,	%i1,	%g2
	movneg	%icc,	%g7,	%o5
	fmovda	%xcc,	%f31,	%f25
	addc	%o6,	0x1FE9,	%i4
	array32	%o4,	%o3,	%l1
	movrlz	%g3,	0x30D,	%o1
	udivcc	%l5,	0x0C86,	%l3
	fandnot2s	%f19,	%f22,	%f29
	restore %g6, %i7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i2, %i5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l6,	%g4,	%o7
	mova	%xcc,	%l4,	%o0
	mova	%icc,	%l0,	%g1
	edge8	%o2,	%i0,	%l2
	edge32ln	%i1,	%g2,	%i6
	ldsw	[%l7 + 0x7C],	%g7
	sllx	%o5,	%i4,	%o6
	fabsd	%f30,	%f6
	save %o4, %o3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o1,	%l1
	smul	%l3,	%l5,	%g6
	array16	%i7,	%i3,	%i2
	fpadd16	%f6,	%f20,	%f16
	addcc	%i5,	0x14BF,	%g5
	sub	%g4,	%o7,	%l6
	edge16	%o0,	%l4,	%g1
	edge8l	%o2,	%l0,	%i0
	edge8l	%i1,	%g2,	%i6
	ldsh	[%l7 + 0x64],	%l2
	andn	%g7,	%o5,	%i4
	xnor	%o4,	0x1112,	%o3
	fpack32	%f22,	%f26,	%f0
	stw	%g3,	[%l7 + 0x2C]
	fnot2s	%f11,	%f24
	edge8	%o6,	%l1,	%o1
	fnand	%f20,	%f22,	%f0
	ldx	[%l7 + 0x18],	%l3
	movvc	%icc,	%l5,	%g6
	movleu	%icc,	%i7,	%i3
	fpsub16	%f22,	%f14,	%f2
	fmovde	%xcc,	%f0,	%f16
	edge32n	%i2,	%g5,	%g4
	nop
	set	0x5C, %o6
	ldsw	[%l7 + %o6],	%i5
	fmovsvs	%icc,	%f14,	%f8
	fors	%f7,	%f0,	%f5
	edge16n	%l6,	%o7,	%l4
	fmovrse	%o0,	%f26,	%f21
	movgu	%icc,	%g1,	%l0
	xnor	%i0,	%i1,	%o2
	movge	%icc,	%i6,	%l2
	lduh	[%l7 + 0x30],	%g7
	edge16ln	%o5,	%g2,	%i4
	xor	%o4,	0x00F5,	%g3
	andn	%o6,	0x175E,	%o3
	ldsh	[%l7 + 0x7E],	%l1
	fmovscc	%xcc,	%f7,	%f10
	smulcc	%l3,	0x17E6,	%o1
	ldsw	[%l7 + 0x50],	%g6
	mulscc	%i7,	%i3,	%l5
	or	%g5,	%g4,	%i2
	edge32l	%i5,	%o7,	%l6
	mulx	%l4,	0x121E,	%o0
	orcc	%g1,	0x0832,	%i0
	smul	%l0,	%i1,	%i6
	stx	%l2,	[%l7 + 0x18]
	ldx	[%l7 + 0x40],	%o2
	edge32n	%o5,	%g2,	%i4
	mulscc	%o4,	%g3,	%g7
	movle	%xcc,	%o3,	%l1
	movcs	%xcc,	%o6,	%o1
	fpmerge	%f30,	%f20,	%f0
	sll	%l3,	0x09,	%i7
	andncc	%g6,	%i3,	%g5
	xnorcc	%l5,	0x11DC,	%i2
	edge8l	%i5,	%g4,	%o7
	ldd	[%l7 + 0x18],	%f20
	ld	[%l7 + 0x40],	%f22
	fandnot1s	%f4,	%f11,	%f5
	sir	0x119A
	movgu	%icc,	%l6,	%o0
	save %g1, 0x05EA, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i0,	%i1
	movcs	%icc,	%i6,	%l2
	movvc	%icc,	%l0,	%o5
	sllx	%g2,	0x06,	%o2
	sllx	%i4,	%o4,	%g3
	ldx	[%l7 + 0x60],	%o3
	srlx	%g7,	%o6,	%o1
	fandnot1	%f24,	%f22,	%f0
	fmovdleu	%icc,	%f28,	%f29
	movvs	%icc,	%l3,	%i7
	srlx	%g6,	0x04,	%l1
	udiv	%i3,	0x00C2,	%l5
	sdiv	%g5,	0x1A5D,	%i2
	fmovrslez	%i5,	%f3,	%f3
	addcc	%g4,	%o7,	%l6
	subcc	%o0,	%l4,	%i0
	mova	%xcc,	%i1,	%g1
	edge32ln	%i6,	%l2,	%o5
	sllx	%g2,	%o2,	%l0
	save %o4, %i4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%o3,	%f1,	%f9
	stb	%g7,	[%l7 + 0x40]
	ldx	[%l7 + 0x08],	%o1
	lduh	[%l7 + 0x28],	%o6
	edge32n	%i7,	%g6,	%l1
	addcc	%i3,	0x1460,	%l3
	orcc	%g5,	0x076F,	%l5
	xorcc	%i5,	0x0620,	%i2
	mulscc	%g4,	%l6,	%o7
	sdiv	%o0,	0x0B05,	%l4
	movrne	%i0,	%g1,	%i6
	ldd	[%l7 + 0x60],	%l2
	stw	%i1,	[%l7 + 0x6C]
	st	%f26,	[%l7 + 0x50]
	fmovrdlez	%g2,	%f6,	%f10
	addccc	%o5,	0x08F8,	%o2
	fnegd	%f24,	%f24
	popc	0x0D9B,	%l0
	stw	%o4,	[%l7 + 0x68]
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	array8	%i4,	%o6,	%i7
	sethi	0x1109,	%o1
	ldd	[%l7 + 0x10],	%f12
	restore %l1, 0x193B, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i3,	0x001A,	%g5
	orn	%l5,	%i5,	%l3
	array16	%g4,	%i2,	%o7
	edge32l	%o0,	%l6,	%i0
	xor	%g1,	0x044F,	%i6
	fornot1	%f28,	%f0,	%f16
	edge16ln	%l4,	%l2,	%i1
	array8	%g2,	%o5,	%o2
	fpadd16	%f18,	%f18,	%f4
	smul	%l0,	0x0822,	%g3
	fmul8sux16	%f22,	%f8,	%f28
	lduw	[%l7 + 0x6C],	%o3
	fcmps	%fcc1,	%f26,	%f30
	xnorcc	%o4,	%g7,	%i4
	sll	%o6,	0x0A,	%o1
	xnor	%l1,	%g6,	%i3
	subcc	%g5,	%i7,	%i5
	movpos	%icc,	%l3,	%g4
	fcmpne16	%f16,	%f24,	%i2
	addcc	%l5,	0x0A03,	%o7
	movcc	%icc,	%l6,	%i0
	movgu	%icc,	%g1,	%o0
	ldsw	[%l7 + 0x74],	%i6
	lduh	[%l7 + 0x5C],	%l2
	movg	%xcc,	%i1,	%g2
	edge8	%o5,	%o2,	%l4
	array32	%l0,	%o3,	%o4
	fmovrde	%g7,	%f20,	%f2
	movneg	%icc,	%g3,	%o6
	movne	%xcc,	%i4,	%o1
	add	%g6,	%l1,	%g5
	edge32ln	%i7,	%i3,	%i5
	ldub	[%l7 + 0x31],	%l3
	ld	[%l7 + 0x34],	%f16
	smulcc	%g4,	%i2,	%l5
	smulcc	%o7,	%l6,	%g1
	movvs	%icc,	%o0,	%i6
	stw	%l2,	[%l7 + 0x1C]
	xor	%i1,	0x0865,	%g2
	edge32n	%i0,	%o2,	%o5
	umulcc	%l0,	%o3,	%o4
	edge32ln	%l4,	%g7,	%g3
	fmovse	%icc,	%f7,	%f5
	mulx	%i4,	0x129B,	%o6
	sdivx	%g6,	0x0D6B,	%l1
	andcc	%o1,	0x113C,	%i7
	fmovdge	%xcc,	%f14,	%f5
	umulcc	%i3,	0x19D8,	%g5
	fnegd	%f22,	%f0
	nop
	set	0x38, %o7
	ldd	[%l7 + %o7],	%f14
	subc	%i5,	%g4,	%i2
	movleu	%xcc,	%l5,	%l3
	ldsw	[%l7 + 0x10],	%o7
	fmovrde	%l6,	%f0,	%f2
	movrgez	%o0,	%g1,	%i6
	sllx	%i1,	0x08,	%g2
	sdivx	%l2,	0x11F7,	%o2
	umulcc	%i0,	%l0,	%o5
	edge16l	%o4,	%o3,	%l4
	movg	%icc,	%g7,	%i4
	mulx	%g3,	%g6,	%o6
	ldsw	[%l7 + 0x18],	%l1
	fmul8sux16	%f30,	%f10,	%f8
	fmovsneg	%xcc,	%f16,	%f30
	edge16l	%o1,	%i7,	%i3
	movneg	%icc,	%g5,	%g4
	movvc	%xcc,	%i2,	%i5
	edge8l	%l5,	%o7,	%l6
	fcmpeq32	%f22,	%f24,	%o0
	sethi	0x1A26,	%g1
	fmovsvs	%icc,	%f12,	%f22
	movle	%icc,	%l3,	%i6
	addccc	%g2,	%i1,	%l2
	movne	%xcc,	%i0,	%o2
	fcmpes	%fcc1,	%f11,	%f4
	fsrc2s	%f11,	%f8
	stb	%o5,	[%l7 + 0x7E]
	movcc	%xcc,	%l0,	%o4
	and	%l4,	%g7,	%i4
	sub	%o3,	0x0EEF,	%g6
	ldsb	[%l7 + 0x75],	%g3
	stb	%l1,	[%l7 + 0x20]
	ldsw	[%l7 + 0x78],	%o1
	stx	%o6,	[%l7 + 0x18]
	alignaddr	%i3,	%g5,	%g4
	movne	%icc,	%i2,	%i7
	fmul8x16au	%f23,	%f1,	%f20
	nop
	set	0x70, %i7
	ldd	[%l7 + %i7],	%f26
	edge32l	%i5,	%o7,	%l5
	andcc	%l6,	0x01A0,	%o0
	fors	%f9,	%f26,	%f9
	sth	%l3,	[%l7 + 0x0E]
	srlx	%i6,	0x14,	%g2
	subcc	%i1,	%g1,	%l2
	srlx	%o2,	0x17,	%i0
	umulcc	%o5,	%l0,	%o4
	srax	%g7,	0x1D,	%i4
	and	%l4,	0x1521,	%o3
	fnegs	%f2,	%f8
	fand	%f12,	%f24,	%f22
	lduh	[%l7 + 0x68],	%g3
	movrne	%g6,	0x0AB,	%o1
	fmovdgu	%xcc,	%f7,	%f12
	array32	%l1,	%o6,	%i3
	subc	%g5,	%i2,	%i7
	ldd	[%l7 + 0x60],	%f12
	alignaddr	%g4,	%o7,	%i5
	xor	%l6,	0x011E,	%l5
	umul	%o0,	%i6,	%l3
	fxnors	%f10,	%f25,	%f1
	movrgez	%g2,	%g1,	%l2
	fpsub32s	%f30,	%f26,	%f17
	fpmerge	%f17,	%f27,	%f18
	fmovd	%f14,	%f8
	save %o2, 0x1FC1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i1,	%l0,	%o4
	movrne	%g7,	%o5,	%l4
	sir	0x1133
	fmovrsgz	%o3,	%f14,	%f27
	save %g3, %g6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f14,	%f22,	%f22
	ld	[%l7 + 0x48],	%f31
	movne	%icc,	%l1,	%o6
	sir	0x19D9
	umul	%i3,	%g5,	%o1
	fone	%f0
	ldub	[%l7 + 0x76],	%i2
	orn	%g4,	%o7,	%i7
	sir	0x1A9F
	subccc	%i5,	0x11C2,	%l5
	sdivx	%o0,	0x0201,	%i6
	orcc	%l3,	%l6,	%g1
	edge8ln	%l2,	%g2,	%i0
	movneg	%icc,	%o2,	%i1
	bshuffle	%f28,	%f24,	%f12
	movvc	%icc,	%o4,	%g7
	movn	%xcc,	%l0,	%o5
	sub	%o3,	%g3,	%l4
	fmovsle	%icc,	%f30,	%f19
	lduw	[%l7 + 0x34],	%g6
	edge8l	%i4,	%o6,	%i3
	addccc	%l1,	%o1,	%g5
	array16	%g4,	%o7,	%i2
	udivcc	%i5,	0x1C71,	%i7
	stx	%o0,	[%l7 + 0x48]
	fmovdcc	%icc,	%f16,	%f17
	andncc	%l5,	%i6,	%l6
	sth	%g1,	[%l7 + 0x0A]
	alignaddrl	%l2,	%l3,	%g2
	fnegd	%f20,	%f18
	subccc	%i0,	0x0305,	%o2
	fmovsg	%xcc,	%f3,	%f8
	edge8ln	%i1,	%o4,	%g7
	movcc	%xcc,	%l0,	%o5
	mulscc	%g3,	0x04BD,	%l4
	srlx	%o3,	0x06,	%i4
	addcc	%g6,	%i3,	%l1
	udiv	%o1,	0x01DB,	%o6
	xorcc	%g5,	0x0E77,	%g4
	alignaddrl	%o7,	%i2,	%i7
	sra	%i5,	0x01,	%l5
	or	%i6,	%o0,	%l6
	sdiv	%l2,	0x0FD3,	%l3
	movrgez	%g1,	0x1BB,	%g2
	sub	%o2,	0x14B7,	%i1
	ldsw	[%l7 + 0x54],	%i0
	fpsub16	%f2,	%f8,	%f22
	addcc	%g7,	0x1323,	%l0
	ldd	[%l7 + 0x60],	%f0
	andcc	%o5,	0x110B,	%g3
	umul	%o4,	%o3,	%i4
	movcc	%icc,	%g6,	%l4
	fmovda	%icc,	%f8,	%f14
	fcmple16	%f22,	%f0,	%i3
	udivcc	%l1,	0x1A80,	%o6
	edge32n	%g5,	%g4,	%o7
	orcc	%i2,	%i7,	%o1
	ldx	[%l7 + 0x60],	%l5
	lduh	[%l7 + 0x34],	%i5
	fcmps	%fcc1,	%f16,	%f27
	edge8	%i6,	%o0,	%l2
	subccc	%l3,	0x135F,	%l6
	edge32l	%g2,	%o2,	%g1
	xnor	%i0,	0x0CA6,	%g7
	ldd	[%l7 + 0x18],	%l0
	sra	%o5,	%g3,	%i1
	edge16ln	%o3,	%i4,	%o4
	save %l4, %g6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f6,	%f13
	udivx	%l1,	0x150C,	%o6
	fornot2s	%f1,	%f22,	%f6
	smulcc	%g4,	0x1977,	%g5
	umulcc	%i2,	%o7,	%o1
	alignaddrl	%l5,	%i5,	%i6
	fmovdn	%icc,	%f22,	%f7
	movrgz	%o0,	0x164,	%i7
	ldd	[%l7 + 0x68],	%l2
	movrgz	%l3,	0x37F,	%l6
	fnot2s	%f31,	%f5
	addc	%o2,	%g2,	%g1
	stx	%g7,	[%l7 + 0x08]
	edge8	%i0,	%l0,	%o5
	edge16ln	%i1,	%o3,	%g3
	udiv	%i4,	0x15C7,	%o4
	movleu	%icc,	%g6,	%l4
	fmovdgu	%icc,	%f17,	%f9
	edge16ln	%l1,	%o6,	%i3
	ld	[%l7 + 0x58],	%f27
	array16	%g5,	%g4,	%o7
	fmuld8ulx16	%f23,	%f23,	%f22
	fandnot1	%f20,	%f26,	%f4
	alignaddr	%i2,	%l5,	%o1
	move	%xcc,	%i5,	%o0
	fmovrse	%i7,	%f12,	%f5
	xorcc	%l2,	%l3,	%l6
	fmovdne	%xcc,	%f27,	%f28
	array16	%o2,	%g2,	%g1
	movrne	%g7,	0x3FA,	%i0
	xnorcc	%l0,	%i6,	%o5
	movre	%o3,	%i1,	%i4
	udivcc	%g3,	0x07CE,	%o4
	movpos	%xcc,	%l4,	%g6
	movvs	%xcc,	%l1,	%o6
	movvs	%icc,	%g5,	%g4
	ldsw	[%l7 + 0x5C],	%o7
	sllx	%i3,	0x16,	%l5
	xnorcc	%o1,	%i2,	%o0
	movl	%icc,	%i7,	%i5
	mova	%xcc,	%l3,	%l6
	alignaddr	%o2,	%l2,	%g2
	movl	%icc,	%g7,	%i0
	siam	0x3
	udivcc	%l0,	0x0A32,	%g1
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	orncc	%i1,	0x1A6D,	%i4
	siam	0x4
	movg	%icc,	%g3,	%o4
	srlx	%l4,	%o3,	%l1
	array16	%g6,	%o6,	%g5
	movre	%o7,	0x165,	%g4
	umul	%i3,	0x194E,	%o1
	stw	%i2,	[%l7 + 0x34]
	ldd	[%l7 + 0x30],	%f18
	edge32	%o0,	%i7,	%l5
	move	%icc,	%i5,	%l6
	ldx	[%l7 + 0x18],	%o2
	movcc	%xcc,	%l3,	%l2
	movrgz	%g7,	0x1A7,	%g2
	udiv	%i0,	0x1A52,	%l0
	sll	%g1,	0x19,	%i6
	fmovrde	%i1,	%f20,	%f0
	movrne	%i4,	0x03E,	%o5
	fmovsvc	%xcc,	%f30,	%f29
	sdivx	%o4,	0x19D7,	%l4
	fmovdgu	%xcc,	%f26,	%f3
	fmovspos	%xcc,	%f28,	%f24
	ldd	[%l7 + 0x08],	%o2
	edge16	%l1,	%g3,	%o6
	movrne	%g5,	%o7,	%g6
	or	%i3,	%g4,	%i2
	movpos	%xcc,	%o0,	%i7
	subcc	%l5,	0x183B,	%i5
	movge	%xcc,	%l6,	%o2
	fmul8sux16	%f10,	%f26,	%f28
	fcmpeq32	%f28,	%f4,	%l3
	movvc	%xcc,	%l2,	%o1
	st	%f21,	[%l7 + 0x6C]
	mulx	%g7,	0x1150,	%g2
	edge32	%l0,	%g1,	%i6
	xor	%i1,	%i4,	%o5
	umulcc	%i0,	%l4,	%o4
	or	%o3,	%l1,	%g3
	sdiv	%g5,	0x0CD2,	%o6
	fabss	%f7,	%f6
	array8	%g6,	%i3,	%o7
	xor	%i2,	%g4,	%i7
	stb	%o0,	[%l7 + 0x70]
	movne	%icc,	%l5,	%l6
	fmovsgu	%icc,	%f14,	%f15
	edge8ln	%i5,	%l3,	%l2
	subccc	%o2,	%g7,	%g2
	lduw	[%l7 + 0x08],	%l0
	movneg	%icc,	%g1,	%i6
	nop
	set	0x10, %i2
	lduw	[%l7 + %i2],	%i1
	and	%o1,	0x194D,	%i4
	movne	%xcc,	%i0,	%o5
	mova	%icc,	%l4,	%o4
	orcc	%o3,	0x1432,	%l1
	edge16	%g3,	%g5,	%o6
	fmuld8ulx16	%f25,	%f22,	%f10
	ldsb	[%l7 + 0x33],	%i3
	fmuld8sux16	%f31,	%f21,	%f16
	fpadd32	%f8,	%f4,	%f30
	fmovsne	%icc,	%f10,	%f31
	fandnot2	%f14,	%f16,	%f0
	mulx	%g6,	%i2,	%g4
	edge32ln	%i7,	%o7,	%o0
	movneg	%icc,	%l5,	%l6
	move	%xcc,	%l3,	%i5
	xor	%o2,	0x03E5,	%l2
	orncc	%g7,	0x1B41,	%l0
	movrgz	%g2,	0x210,	%g1
	sub	%i1,	0x138C,	%i6
	array16	%o1,	%i0,	%o5
	fabsd	%f6,	%f22
	nop
	set	0x55, %l6
	stb	%l4,	[%l7 + %l6]
	srax	%o4,	0x0F,	%o3
	movl	%icc,	%l1,	%i4
	edge32ln	%g3,	%o6,	%g5
	movl	%xcc,	%g6,	%i2
	edge32ln	%g4,	%i7,	%o7
	addcc	%o0,	%i3,	%l5
	srlx	%l3,	0x16,	%i5
	fabsd	%f26,	%f2
	fand	%f8,	%f22,	%f22
	sth	%o2,	[%l7 + 0x3C]
	array32	%l6,	%l2,	%l0
	fcmpeq32	%f4,	%f30,	%g7
	umul	%g2,	%g1,	%i6
	movneg	%xcc,	%i1,	%i0
	movcc	%xcc,	%o1,	%o5
	sub	%l4,	%o3,	%o4
	std	%f22,	[%l7 + 0x50]
	movgu	%xcc,	%l1,	%i4
	fsrc2	%f18,	%f30
	xnor	%o6,	%g3,	%g5
	edge32ln	%i2,	%g6,	%i7
	fxnors	%f16,	%f31,	%f8
	andncc	%o7,	%o0,	%i3
	movpos	%xcc,	%l5,	%l3
	movcc	%xcc,	%i5,	%o2
	alignaddrl	%l6,	%g4,	%l0
	subccc	%g7,	0x0FC9,	%l2
	movleu	%icc,	%g2,	%i6
	sir	0x0260
	xorcc	%g1,	%i0,	%i1
	siam	0x5
	srl	%o1,	0x0C,	%l4
	fmul8ulx16	%f30,	%f6,	%f0
	fsrc2s	%f10,	%f10
	movneg	%icc,	%o5,	%o4
	fmovrsgz	%l1,	%f21,	%f6
	movrne	%i4,	0x2BE,	%o3
	sdiv	%o6,	0x0272,	%g5
	fpackfix	%f4,	%f1
	fnands	%f26,	%f24,	%f4
	stw	%g3,	[%l7 + 0x70]
	movleu	%icc,	%i2,	%i7
	stw	%g6,	[%l7 + 0x54]
	subc	%o0,	0x0B0E,	%o7
	fmovdcs	%xcc,	%f17,	%f3
	edge32	%i3,	%l5,	%i5
	for	%f0,	%f10,	%f20
	movgu	%xcc,	%o2,	%l6
	subc	%l3,	%l0,	%g4
	edge8n	%g7,	%g2,	%i6
	fsrc2s	%f13,	%f13
	ldd	[%l7 + 0x28],	%l2
	fzeros	%f20
	movre	%i0,	%i1,	%g1
	move	%xcc,	%o1,	%l4
	stw	%o4,	[%l7 + 0x60]
	movcs	%icc,	%l1,	%i4
	fmovdpos	%icc,	%f24,	%f15
	fone	%f6
	fpack16	%f2,	%f10
	movge	%xcc,	%o3,	%o6
	udiv	%o5,	0x116C,	%g3
	edge16n	%i2,	%g5,	%g6
	edge16n	%i7,	%o7,	%i3
	fmovdcc	%xcc,	%f22,	%f30
	ldsb	[%l7 + 0x73],	%l5
	fmovdvs	%xcc,	%f7,	%f30
	fmovdneg	%icc,	%f3,	%f4
	sub	%i5,	0x1322,	%o2
	fpack16	%f10,	%f28
	alignaddrl	%l6,	%l3,	%o0
	andn	%g4,	0x092C,	%l0
	movrne	%g7,	0x342,	%i6
	addcc	%l2,	0x0532,	%i0
	srl	%i1,	%g1,	%o1
	fmuld8sux16	%f3,	%f5,	%f10
	srl	%g2,	0x17,	%l4
	ld	[%l7 + 0x48],	%f15
	fpack32	%f6,	%f26,	%f22
	srlx	%o4,	%l1,	%o3
	fnegs	%f27,	%f26
	movgu	%icc,	%o6,	%i4
	alignaddrl	%o5,	%i2,	%g3
	udivcc	%g5,	0x04D5,	%i7
	fmovsle	%icc,	%f20,	%f6
	sll	%g6,	%o7,	%i3
	st	%f10,	[%l7 + 0x18]
	addcc	%l5,	%i5,	%l6
	sub	%o2,	0x02B2,	%l3
	fzero	%f14
	udivcc	%g4,	0x0FF0,	%l0
	movcs	%xcc,	%o0,	%i6
	movrne	%l2,	%g7,	%i1
	siam	0x3
	orn	%g1,	0x017D,	%i0
	nop
	set	0x44, %o0
	ldsw	[%l7 + %o0],	%o1
	fpsub32	%f24,	%f0,	%f26
	nop
	set	0x60, %g4
	ldd	[%l7 + %g4],	%l4
	subc	%o4,	0x15C9,	%l1
	edge8l	%o3,	%o6,	%i4
	movgu	%xcc,	%g2,	%i2
	fmovrdne	%o5,	%f8,	%f30
	andn	%g3,	%g5,	%i7
	sdiv	%o7,	0x0CC3,	%i3
	edge8ln	%g6,	%l5,	%l6
	pdist	%f8,	%f20,	%f24
	stx	%o2,	[%l7 + 0x08]
	alignaddr	%l3,	%g4,	%i5
	fxnors	%f0,	%f14,	%f14
	orncc	%o0,	%i6,	%l0
	sdiv	%g7,	0x07F4,	%l2
	xorcc	%i1,	0x0885,	%g1
	movrlz	%o1,	%l4,	%o4
	fmovdcs	%xcc,	%f4,	%f28
	xnor	%i0,	%l1,	%o3
	stx	%i4,	[%l7 + 0x78]
	mulx	%o6,	0x1B3B,	%i2
	movrgz	%o5,	0x145,	%g2
	stw	%g3,	[%l7 + 0x74]
	add	%i7,	0x16B8,	%o7
	fmovrsne	%g5,	%f30,	%f1
	addc	%i3,	0x1929,	%l5
	edge8ln	%g6,	%o2,	%l6
	addcc	%l3,	%g4,	%i5
	ldsw	[%l7 + 0x20],	%i6
	fones	%f10
	sir	0x16D9
	fmul8x16au	%f28,	%f0,	%f20
	movcc	%xcc,	%l0,	%g7
	fxors	%f17,	%f3,	%f21
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%o0
	or	%i1,	%g1,	%o1
	subcc	%l2,	%o4,	%i0
	sdivx	%l4,	0x04E5,	%o3
	sir	0x1FF3
	xnor	%l1,	0x1CA6,	%i4
	mulscc	%o6,	0x16A7,	%i2
	popc	%g2,	%o5
	edge8ln	%g3,	%i7,	%g5
	umul	%i3,	0x177E,	%o7
	fabsd	%f20,	%f22
	smul	%l5,	%g6,	%o2
	sub	%l6,	0x1CB0,	%l3
	edge32	%i5,	%g4,	%i6
	mulx	%l0,	%g7,	%i1
	edge16n	%o0,	%g1,	%l2
	ldsb	[%l7 + 0x22],	%o4
	udivcc	%i0,	0x1164,	%o1
	fpadd32s	%f7,	%f10,	%f6
	edge16l	%o3,	%l4,	%l1
	ldd	[%l7 + 0x48],	%i4
	subcc	%i2,	%g2,	%o6
	srax	%o5,	0x1C,	%g3
	fpackfix	%f18,	%f15
	movcs	%icc,	%i7,	%g5
	st	%f17,	[%l7 + 0x38]
	edge8	%o7,	%i3,	%l5
	ldsb	[%l7 + 0x4C],	%g6
	movcc	%icc,	%l6,	%o2
	lduw	[%l7 + 0x7C],	%i5
	edge8	%g4,	%i6,	%l0
	umul	%g7,	%l3,	%i1
	orcc	%o0,	0x1B47,	%l2
	andcc	%g1,	%i0,	%o1
	xnor	%o4,	0x1683,	%l4
	movleu	%icc,	%o3,	%l1
	fmovsvc	%icc,	%f19,	%f10
	fmovsn	%icc,	%f12,	%f22
	srlx	%i4,	%i2,	%o6
	subcc	%g2,	0x1F75,	%g3
	subc	%i7,	0x10A3,	%o5
	udiv	%o7,	0x19DC,	%g5
	fmovscc	%icc,	%f31,	%f7
	udivx	%l5,	0x1AA7,	%i3
	add	%g6,	%l6,	%o2
	xor	%i5,	0x0290,	%i6
	fones	%f28
	fcmped	%fcc1,	%f2,	%f24
	umulcc	%g4,	%l0,	%l3
	fones	%f7
	edge8l	%g7,	%o0,	%i1
	edge32	%g1,	%l2,	%o1
	lduh	[%l7 + 0x26],	%o4
	ldsw	[%l7 + 0x7C],	%i0
	umulcc	%o3,	%l4,	%l1
	fmovdpos	%icc,	%f1,	%f10
	fmovdn	%xcc,	%f15,	%f5
	movrne	%i2,	0x10A,	%i4
	xnorcc	%o6,	0x138B,	%g2
	movrlez	%i7,	%g3,	%o5
	fmovdgu	%xcc,	%f5,	%f18
	ldd	[%l7 + 0x68],	%f30
	andcc	%g5,	0x0168,	%l5
	orncc	%o7,	%i3,	%g6
	fone	%f2
	sethi	0x1CCB,	%o2
	umul	%i5,	%i6,	%l6
	smul	%l0,	%l3,	%g4
	or	%o0,	%i1,	%g7
	movne	%xcc,	%g1,	%l2
	xor	%o4,	%i0,	%o3
	alignaddrl	%o1,	%l4,	%i2
	movg	%icc,	%i4,	%l1
	fmovsn	%icc,	%f18,	%f25
	xorcc	%g2,	0x155A,	%i7
	movrlez	%o6,	0x0A4,	%g3
	fxor	%f10,	%f18,	%f18
	stx	%g5,	[%l7 + 0x40]
	orn	%l5,	%o7,	%i3
	mulx	%o5,	%g6,	%o2
	sra	%i6,	%l6,	%l0
	movge	%icc,	%l3,	%g4
	movrlez	%i5,	0x1CE,	%o0
	movre	%i1,	0x2AA,	%g1
	popc	%g7,	%o4
	fmul8x16au	%f26,	%f29,	%f22
	alignaddr	%i0,	%o3,	%o1
	fcmpd	%fcc2,	%f24,	%f16
	subcc	%l4,	%l2,	%i2
	smulcc	%i4,	%g2,	%i7
	movrne	%l1,	%o6,	%g5
	srlx	%g3,	0x16,	%l5
	array32	%o7,	%o5,	%g6
	ldub	[%l7 + 0x54],	%i3
	sethi	0x1D04,	%o2
	movl	%icc,	%l6,	%l0
	ldx	[%l7 + 0x30],	%i6
	smul	%g4,	%i5,	%l3
	orncc	%o0,	0x04AE,	%i1
	xor	%g1,	0x1315,	%g7
	fsrc2	%f0,	%f10
	ldd	[%l7 + 0x18],	%f14
	restore %i0, %o4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f7,	%f16,	%f0
	edge8ln	%o3,	%l4,	%i2
	ldx	[%l7 + 0x40],	%i4
	fmuld8sux16	%f27,	%f30,	%f6
	array32	%l2,	%g2,	%l1
	add	%o6,	%g5,	%g3
	ldd	[%l7 + 0x38],	%f22
	fandnot2	%f0,	%f4,	%f16
	nop
	set	0x1C, %l3
	stw	%i7,	[%l7 + %l3]
	subcc	%l5,	0x0301,	%o7
	movneg	%xcc,	%g6,	%i3
	srlx	%o5,	%o2,	%l6
	udiv	%i6,	0x165B,	%g4
	fmovdvs	%icc,	%f26,	%f11
	fxors	%f11,	%f2,	%f18
	sethi	0x1F26,	%l0
	st	%f19,	[%l7 + 0x2C]
	umulcc	%l3,	%i5,	%i1
	edge32ln	%g1,	%o0,	%g7
	fpack16	%f0,	%f20
	fmul8x16	%f12,	%f26,	%f20
	ldd	[%l7 + 0x40],	%f6
	ldub	[%l7 + 0x1F],	%o4
	movg	%xcc,	%o1,	%o3
	st	%f0,	[%l7 + 0x08]
	fmul8sux16	%f20,	%f26,	%f24
	umulcc	%i0,	%i2,	%l4
	fmovrde	%l2,	%f14,	%f8
	movvs	%xcc,	%g2,	%i4
	xnorcc	%l1,	%g5,	%g3
	array8	%o6,	%l5,	%i7
	movvc	%icc,	%o7,	%i3
	andcc	%g6,	%o5,	%o2
	array8	%l6,	%i6,	%l0
	udivcc	%g4,	0x0D53,	%l3
	orcc	%i5,	%i1,	%g1
	umul	%g7,	0x05EA,	%o0
	popc	%o1,	%o3
	lduw	[%l7 + 0x58],	%i0
	fnands	%f7,	%f5,	%f29
	sdivcc	%o4,	0x0FE9,	%i2
	movre	%l4,	%l2,	%i4
	movg	%xcc,	%l1,	%g5
	sra	%g3,	%g2,	%l5
	fmovd	%f28,	%f26
	fmovsvc	%xcc,	%f7,	%f11
	xnorcc	%i7,	%o7,	%o6
	save %g6, %o5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l6,	0x039,	%i3
	xnorcc	%i6,	0x1ABF,	%g4
	srlx	%l3,	0x00,	%l0
	smul	%i1,	0x0D95,	%g1
	movn	%xcc,	%i5,	%o0
	fmovrdlz	%g7,	%f2,	%f26
	sdivx	%o3,	0x1E03,	%o1
	xnor	%i0,	%i2,	%o4
	subcc	%l2,	%l4,	%l1
	fcmpes	%fcc2,	%f25,	%f10
	nop
	set	0x4C, %l4
	ldub	[%l7 + %l4],	%i4
	sub	%g3,	%g2,	%l5
	fand	%f8,	%f10,	%f18
	subccc	%g5,	0x077D,	%i7
	srl	%o6,	0x1C,	%o7
	fmovsge	%xcc,	%f22,	%f2
	fmovs	%f27,	%f12
	umulcc	%g6,	%o2,	%l6
	movpos	%xcc,	%i3,	%i6
	fandnot1	%f0,	%f10,	%f6
	sub	%g4,	0x06EC,	%o5
	edge32l	%l0,	%l3,	%g1
	st	%f26,	[%l7 + 0x60]
	fmovda	%xcc,	%f25,	%f3
	save %i5, %i1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g7,	%o1,	%i0
	add	%o3,	%i2,	%l2
	subc	%o4,	0x034D,	%l4
	fornot1s	%f12,	%f17,	%f17
	fpsub32	%f6,	%f30,	%f22
	srlx	%i4,	%g3,	%g2
	movre	%l5,	%l1,	%g5
	udivcc	%i7,	0x1884,	%o6
	andncc	%g6,	%o2,	%l6
	lduh	[%l7 + 0x66],	%i3
	fcmpd	%fcc0,	%f22,	%f8
	sra	%i6,	%g4,	%o5
	ldx	[%l7 + 0x20],	%l0
	xorcc	%o7,	0x0A7A,	%l3
	andcc	%i5,	%i1,	%g1
	subccc	%o0,	%g7,	%i0
	sll	%o3,	0x0C,	%o1
	xor	%l2,	0x02E0,	%o4
	udivcc	%i2,	0x1B4C,	%l4
	edge16n	%g3,	%i4,	%l5
	addccc	%g2,	0x19EB,	%g5
	ld	[%l7 + 0x7C],	%f30
	mulscc	%i7,	0x0443,	%l1
	movne	%icc,	%g6,	%o2
	array16	%o6,	%l6,	%i6
	stx	%i3,	[%l7 + 0x48]
	bshuffle	%f24,	%f2,	%f26
	ld	[%l7 + 0x3C],	%f26
	mova	%xcc,	%o5,	%g4
	addc	%l0,	%o7,	%l3
	fmovrdlez	%i5,	%f18,	%f30
	ldub	[%l7 + 0x40],	%g1
	xnorcc	%o0,	0x1AF1,	%g7
	movvs	%xcc,	%i1,	%o3
	fpadd32	%f2,	%f8,	%f22
	fpadd16	%f26,	%f4,	%f12
	edge8	%i0,	%o1,	%o4
	edge32l	%i2,	%l4,	%g3
	edge16	%l2,	%l5,	%g2
	fnand	%f18,	%f18,	%f6
	sth	%g5,	[%l7 + 0x64]
	fpack16	%f12,	%f23
	fpack32	%f24,	%f22,	%f4
	edge8n	%i4,	%i7,	%l1
	srlx	%g6,	%o2,	%l6
	andncc	%o6,	%i6,	%i3
	popc	0x1FB7,	%o5
	movvs	%icc,	%g4,	%o7
	fpadd16s	%f8,	%f12,	%f12
	movleu	%icc,	%l3,	%l0
	ldd	[%l7 + 0x68],	%g0
	subc	%i5,	0x1827,	%o0
	srl	%g7,	%i1,	%o3
	sdivcc	%o1,	0x0E5F,	%i0
	fxnors	%f29,	%f21,	%f11
	lduw	[%l7 + 0x3C],	%i2
	alignaddrl	%o4,	%g3,	%l4
	fones	%f18
	movn	%xcc,	%l2,	%l5
	popc	0x0B6F,	%g5
	fmovdvs	%xcc,	%f8,	%f7
	edge16l	%g2,	%i4,	%l1
	srlx	%g6,	%i7,	%o2
	movrgz	%o6,	0x164,	%i6
	fnands	%f5,	%f7,	%f8
	edge8l	%i3,	%o5,	%g4
	sub	%l6,	%l3,	%l0
	movle	%xcc,	%o7,	%g1
	edge16n	%o0,	%g7,	%i5
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	edge32ln	%o3,	%o4,	%i2
	movrne	%g3,	%l2,	%l5
	ldx	[%l7 + 0x60],	%g5
	siam	0x5
	andcc	%g2,	0x0AF0,	%i4
	andn	%l4,	0x1DC8,	%l1
	move	%icc,	%g6,	%o2
	movrgez	%o6,	%i7,	%i6
	fcmple32	%f26,	%f20,	%o5
	mova	%xcc,	%i3,	%g4
	ldsw	[%l7 + 0x64],	%l3
	ldx	[%l7 + 0x30],	%l0
	movle	%icc,	%o7,	%g1
	fpsub32s	%f19,	%f21,	%f3
	movpos	%icc,	%l6,	%g7
	mova	%icc,	%i5,	%o0
	save %o1, %i1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o3,	[%l7 + 0x33]
	ldsb	[%l7 + 0x72],	%i2
	edge8ln	%g3,	%o4,	%l2
	edge16	%g5,	%l5,	%i4
	ldd	[%l7 + 0x38],	%f12
	st	%f9,	[%l7 + 0x64]
	array32	%l4,	%g2,	%l1
	edge32l	%o2,	%o6,	%i7
	edge16	%g6,	%i6,	%o5
	sethi	0x0FC2,	%g4
	ldsh	[%l7 + 0x0C],	%l3
	ldd	[%l7 + 0x48],	%l0
	fcmps	%fcc0,	%f30,	%f17
	fcmpd	%fcc1,	%f12,	%f10
	add	%i3,	%o7,	%g1
	fmovsvs	%icc,	%f15,	%f16
	fxnors	%f8,	%f8,	%f12
	addc	%l6,	%g7,	%o0
	fands	%f27,	%f6,	%f15
	fsrc1s	%f0,	%f11
	movl	%icc,	%o1,	%i5
	or	%i1,	%o3,	%i2
	or	%i0,	0x0D14,	%o4
	fmovdge	%xcc,	%f6,	%f21
	popc	%l2,	%g5
	addccc	%g3,	0x0E63,	%i4
	stw	%l4,	[%l7 + 0x50]
	sdivcc	%g2,	0x0F9A,	%l1
	array8	%l5,	%o2,	%o6
	fcmpne32	%f30,	%f12,	%i7
	edge32l	%i6,	%o5,	%g4
	sra	%l3,	%l0,	%g6
	movcs	%icc,	%o7,	%g1
	move	%icc,	%l6,	%g7
	edge8l	%i3,	%o1,	%i5
	fmovsvc	%icc,	%f4,	%f2
	fmovdcc	%xcc,	%f31,	%f8
	fmovrdne	%i1,	%f2,	%f30
	edge16n	%o0,	%i2,	%o3
	fmovdn	%icc,	%f25,	%f4
	sth	%o4,	[%l7 + 0x6C]
	ldsh	[%l7 + 0x6C],	%l2
	fand	%f10,	%f30,	%f30
	umul	%g5,	0x06D6,	%i0
	fzeros	%f27
	xnorcc	%i4,	%g3,	%g2
	alignaddr	%l4,	%l5,	%l1
	ldsh	[%l7 + 0x42],	%o6
	edge16	%i7,	%o2,	%i6
	movcs	%icc,	%o5,	%l3
	alignaddrl	%g4,	%l0,	%o7
	xor	%g1,	0x14A6,	%g6
	movgu	%icc,	%g7,	%i3
	ldd	[%l7 + 0x20],	%f30
	fpsub16s	%f18,	%f15,	%f31
	udiv	%l6,	0x08AC,	%o1
	fpackfix	%f12,	%f31
	stw	%i5,	[%l7 + 0x20]
	sth	%i1,	[%l7 + 0x5A]
	fmul8ulx16	%f12,	%f28,	%f4
	smulcc	%o0,	0x1103,	%o3
	fmul8ulx16	%f12,	%f24,	%f2
	edge8l	%i2,	%l2,	%g5
	movvs	%xcc,	%i0,	%o4
	andcc	%g3,	%i4,	%l4
	array32	%g2,	%l5,	%o6
	ldub	[%l7 + 0x23],	%l1
	movre	%i7,	%i6,	%o5
	andcc	%l3,	%g4,	%l0
	fornot2	%f6,	%f16,	%f24
	fmovrdlez	%o2,	%f24,	%f6
	fcmpne16	%f4,	%f26,	%o7
	movrgez	%g6,	%g1,	%i3
	umulcc	%g7,	%l6,	%o1
	subcc	%i5,	%i1,	%o3
	fmovdneg	%icc,	%f24,	%f21
	edge16l	%o0,	%l2,	%i2
	edge16n	%i0,	%g5,	%o4
	fmovsgu	%xcc,	%f8,	%f27
	fxnor	%f14,	%f10,	%f0
	move	%icc,	%g3,	%l4
	movl	%xcc,	%g2,	%l5
	fabsd	%f14,	%f24
	edge16l	%o6,	%i4,	%i7
	stw	%l1,	[%l7 + 0x28]
	std	%f24,	[%l7 + 0x18]
	pdist	%f12,	%f16,	%f12
	stx	%o5,	[%l7 + 0x08]
	mulx	%l3,	%g4,	%i6
	ldd	[%l7 + 0x78],	%l0
	sub	%o2,	0x1E57,	%g6
	move	%xcc,	%o7,	%g1
	edge16l	%g7,	%l6,	%i3
	or	%o1,	%i5,	%o3
	addccc	%o0,	0x011D,	%i1
	sethi	0x19D4,	%i2
	subccc	%l2,	%i0,	%g5
	ldsw	[%l7 + 0x68],	%g3
	edge32ln	%l4,	%g2,	%l5
	udiv	%o6,	0x04DF,	%i4
	ldd	[%l7 + 0x40],	%o4
	or	%l1,	0x1E9C,	%i7
	movgu	%icc,	%l3,	%g4
	fpack32	%f8,	%f30,	%f4
	ld	[%l7 + 0x10],	%f4
	fmovrslez	%i6,	%f21,	%f14
	srax	%o5,	%l0,	%g6
	xor	%o2,	%o7,	%g1
	movvc	%xcc,	%l6,	%g7
	movrlez	%o1,	0x112,	%i3
	fnot2	%f26,	%f12
	ldub	[%l7 + 0x48],	%i5
	restore %o0, 0x14A8, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%i1,	0x1DB8,	%l2
	orncc	%i0,	%g5,	%g3
	xnor	%l4,	0x0409,	%i2
	edge32n	%l5,	%g2,	%i4
	fornot2	%f12,	%f6,	%f16
	umulcc	%o6,	0x0C7D,	%o4
	edge16n	%i7,	%l3,	%l1
	ldsb	[%l7 + 0x49],	%i6
	fnegs	%f8,	%f0
	fmovscs	%icc,	%f26,	%f19
	edge16	%o5,	%l0,	%g6
	sll	%g4,	%o7,	%g1
	srlx	%o2,	%l6,	%o1
	fcmpes	%fcc0,	%f6,	%f10
	ldx	[%l7 + 0x70],	%g7
	fmovdg	%xcc,	%f26,	%f2
	fcmpgt16	%f4,	%f0,	%i3
	fnors	%f23,	%f4,	%f18
	move	%xcc,	%o0,	%o3
	ldd	[%l7 + 0x18],	%f26
	fnot2s	%f4,	%f10
	fsrc1	%f4,	%f22
	fxnors	%f13,	%f29,	%f28
	edge16	%i5,	%i1,	%i0
	add	%g5,	0x09EC,	%g3
	fandnot1s	%f4,	%f1,	%f21
	save %l2, %l4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g2,	%i4,	%o6
	mulscc	%o4,	%i7,	%l5
	ldd	[%l7 + 0x10],	%l0
	array16	%i6,	%l3,	%o5
	sethi	0x0750,	%l0
	stb	%g4,	[%l7 + 0x51]
	fsrc1	%f28,	%f22
	popc	%o7,	%g6
	ldsh	[%l7 + 0x7C],	%o2
	stx	%g1,	[%l7 + 0x30]
	subcc	%l6,	0x1BEE,	%g7
	movn	%icc,	%i3,	%o0
	movrgez	%o1,	0x123,	%o3
	fmovsl	%icc,	%f22,	%f12
	fxors	%f27,	%f16,	%f18
	sll	%i1,	0x1D,	%i0
	orcc	%g5,	%i5,	%g3
	udivcc	%l4,	0x1704,	%i2
	ldd	[%l7 + 0x38],	%f26
	popc	0x0ED5,	%g2
	siam	0x7
	movrgez	%i4,	%l2,	%o6
	edge32	%i7,	%o4,	%l5
	subc	%l1,	%i6,	%l3
	edge16	%l0,	%o5,	%g4
	sll	%g6,	0x12,	%o7
	movrgz	%g1,	0x099,	%o2
	subccc	%g7,	0x0D0E,	%i3
	movgu	%icc,	%o0,	%o1
	ldd	[%l7 + 0x38],	%f12
	srax	%o3,	%l6,	%i1
	edge8l	%i0,	%i5,	%g3
	subc	%l4,	0x1CA5,	%g5
	ldub	[%l7 + 0x55],	%g2
	fmovrde	%i4,	%f10,	%f24
	array32	%l2,	%o6,	%i7
	andncc	%i2,	%l5,	%o4
	movrlz	%l1,	%l3,	%i6
	fmovspos	%icc,	%f1,	%f20
	sub	%o5,	%g4,	%g6
	mulx	%o7,	%l0,	%g1
	orcc	%o2,	0x0EA7,	%i3
	sdivx	%g7,	0x09DB,	%o1
	umul	%o0,	0x0DE8,	%l6
	smul	%i1,	%i0,	%i5
	sra	%o3,	%g3,	%l4
	addcc	%g2,	0x0FED,	%i4
	array32	%l2,	%o6,	%g5
	xorcc	%i2,	0x1532,	%l5
	udiv	%o4,	0x0257,	%l1
	stb	%i7,	[%l7 + 0x54]
	add	%i6,	0x1B3A,	%o5
	andn	%g4,	%l3,	%g6
	fmul8x16	%f7,	%f20,	%f22
	mova	%icc,	%o7,	%g1
	fmovdvc	%icc,	%f8,	%f14
	movl	%icc,	%l0,	%o2
	sdiv	%g7,	0x1B00,	%o1
	andcc	%o0,	0x00F1,	%l6
	orcc	%i1,	0x029D,	%i0
	xorcc	%i3,	%i5,	%o3
	fcmpne32	%f2,	%f28,	%g3
	subccc	%g2,	%l4,	%i4
	sethi	0x070F,	%o6
	umulcc	%l2,	0x12FA,	%g5
	ldsw	[%l7 + 0x08],	%i2
	smulcc	%o4,	%l1,	%i7
	alignaddrl	%i6,	%l5,	%o5
	xorcc	%l3,	%g4,	%g6
	fmovdle	%icc,	%f21,	%f21
	fpsub32s	%f13,	%f9,	%f15
	lduh	[%l7 + 0x22],	%g1
	movle	%xcc,	%o7,	%l0
	setx loop_101, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_101: 	udivx	%o0,	0x0222,	%l6
	addcc	%i1,	%o1,	%i0
	ldx	[%l7 + 0x20],	%i5
	sir	0x1A38
	fcmped	%fcc0,	%f6,	%f4
	addcc	%i3,	%o3,	%g3
	sra	%g2,	%l4,	%o6
	fmovdle	%icc,	%f14,	%f7
	stx	%l2,	[%l7 + 0x78]
	udivx	%g5,	0x0391,	%i4
	fmovdleu	%icc,	%f26,	%f24
	edge16	%o4,	%i2,	%l1
	andncc	%i7,	%i6,	%o5
	fpack16	%f14,	%f20
	ldx	[%l7 + 0x68],	%l3
	fmovdgu	%icc,	%f12,	%f2
	udivcc	%g4,	0x1968,	%l5
	edge16ln	%g6,	%o7,	%l0
	subcc	%g7,	%g1,	%o0
	fmovdg	%xcc,	%f5,	%f27
	fpack16	%f2,	%f9
	movcs	%xcc,	%o2,	%i1
	xnor	%l6,	0x16D8,	%i0
	fmovrdne	%i5,	%f30,	%f28
	sth	%i3,	[%l7 + 0x14]
	sra	%o3,	%g3,	%g2
	mulx	%o1,	0x0B7B,	%l4
	fmovdl	%xcc,	%f16,	%f24
	movn	%xcc,	%o6,	%g5
	edge16	%i4,	%l2,	%i2
	std	%f16,	[%l7 + 0x70]
	stx	%l1,	[%l7 + 0x60]
	edge16l	%i7,	%i6,	%o4
	ldx	[%l7 + 0x10],	%o5
	edge16	%g4,	%l3,	%g6
	ldd	[%l7 + 0x18],	%l4
	smulcc	%o7,	0x01C6,	%g7
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%g0
	addc	%l0,	%o0,	%i1
	mulx	%l6,	%o2,	%i0
	ldub	[%l7 + 0x72],	%i3
	mulx	%o3,	%i5,	%g2
	edge32l	%g3,	%o1,	%o6
	ldd	[%l7 + 0x28],	%g4
	fmovsge	%icc,	%f5,	%f9
	orcc	%l4,	0x1BDA,	%l2
	fpsub32	%f26,	%f8,	%f8
	fabsd	%f22,	%f8
	mulscc	%i4,	0x0E02,	%i2
	movrgez	%l1,	0x308,	%i7
	orn	%o4,	0x008C,	%o5
	fxnors	%f22,	%f2,	%f12
	sdivx	%g4,	0x1DC9,	%l3
	andncc	%g6,	%l5,	%o7
	fxnors	%f16,	%f4,	%f11
	fmovsneg	%icc,	%f4,	%f14
	subc	%g7,	0x05B5,	%i6
	smul	%g1,	%l0,	%i1
	ldd	[%l7 + 0x20],	%o0
	movn	%icc,	%l6,	%o2
	movrgz	%i3,	%o3,	%i0
	sdivcc	%g2,	0x0B0F,	%g3
	fmovrse	%o1,	%f29,	%f25
	fmovsvc	%icc,	%f13,	%f20
	array8	%i5,	%g5,	%o6
	movg	%icc,	%l2,	%i4
	std	%f24,	[%l7 + 0x30]
	nop
	set	0x59, %g6
	ldub	[%l7 + %g6],	%i2
	sdivcc	%l4,	0x0131,	%l1
	lduh	[%l7 + 0x7A],	%o4
	fpackfix	%f30,	%f18
	edge8	%o5,	%i7,	%g4
	fmovrdlez	%l3,	%f16,	%f16
	edge32l	%g6,	%o7,	%l5
	edge32ln	%i6,	%g1,	%l0
	fands	%f17,	%f17,	%f0
	fmovse	%icc,	%f25,	%f22
	fmovrdne	%i1,	%f2,	%f10
	edge16n	%o0,	%l6,	%o2
	sth	%i3,	[%l7 + 0x0C]
	st	%f14,	[%l7 + 0x1C]
	umulcc	%g7,	%o3,	%i0
	fmovrdne	%g3,	%f16,	%f28
	movrgez	%g2,	%o1,	%g5
	ldsb	[%l7 + 0x1D],	%o6
	movvs	%icc,	%i5,	%l2
	fmovdge	%icc,	%f1,	%f15
	xorcc	%i2,	0x1A72,	%i4
	or	%l1,	%l4,	%o5
	movrlez	%i7,	%g4,	%l3
	movpos	%icc,	%o4,	%o7
	movne	%icc,	%g6,	%i6
	ld	[%l7 + 0x10],	%f26
	andn	%g1,	%l5,	%l0
	array32	%o0,	%i1,	%o2
	fmovdn	%icc,	%f27,	%f26
	fmovdpos	%xcc,	%f9,	%f7
	srlx	%l6,	0x1D,	%g7
	movre	%o3,	0x3CA,	%i0
	edge32n	%i3,	%g2,	%o1
	fcmpne16	%f30,	%f6,	%g5
	smul	%g3,	%o6,	%i5
	add	%l2,	0x1DF5,	%i2
	fmovsg	%icc,	%f20,	%f2
	add	%l1,	%i4,	%l4
	st	%f9,	[%l7 + 0x08]
	edge8	%i7,	%g4,	%o5
	stx	%l3,	[%l7 + 0x60]
	udivx	%o4,	0x1466,	%g6
	alignaddrl	%o7,	%i6,	%g1
	addccc	%l5,	%o0,	%l0
	fcmped	%fcc0,	%f16,	%f26
	mulscc	%o2,	0x1032,	%l6
	mova	%icc,	%g7,	%i1
	ldd	[%l7 + 0x68],	%f28
	edge32	%i0,	%i3,	%o3
	xor	%g2,	%g5,	%g3
	edge8n	%o1,	%i5,	%o6
	movrgz	%i2,	0x30E,	%l2
	movrgz	%l1,	%i4,	%i7
	movrlz	%g4,	0x3DC,	%l4
	sir	0x1D0B
	fmovsgu	%icc,	%f12,	%f27
	fcmple16	%f28,	%f0,	%o5
	sdivx	%l3,	0x1415,	%g6
	addcc	%o7,	%o4,	%g1
	addc	%i6,	0x0577,	%o0
	st	%f14,	[%l7 + 0x70]
	sra	%l5,	%l0,	%o2
	edge16	%l6,	%g7,	%i0
	st	%f9,	[%l7 + 0x6C]
	lduh	[%l7 + 0x12],	%i3
	smul	%i1,	0x1371,	%o3
	fmovdpos	%xcc,	%f23,	%f31
	movg	%icc,	%g5,	%g2
	stw	%o1,	[%l7 + 0x64]
	orcc	%g3,	%i5,	%o6
	smulcc	%i2,	0x18A0,	%l2
	fmovrse	%l1,	%f21,	%f10
	movne	%icc,	%i4,	%g4
	fmul8x16au	%f12,	%f28,	%f18
	edge8	%i7,	%o5,	%l4
	lduw	[%l7 + 0x5C],	%g6
	move	%xcc,	%o7,	%o4
	movg	%icc,	%g1,	%l3
	fmul8sux16	%f0,	%f8,	%f8
	udivcc	%i6,	0x1FC6,	%o0
	fmovda	%icc,	%f17,	%f16
	fmovscs	%xcc,	%f22,	%f20
	srlx	%l5,	%l0,	%o2
	srlx	%g7,	0x1C,	%i0
	sdivcc	%l6,	0x16CF,	%i3
	ldsw	[%l7 + 0x48],	%o3
	movge	%icc,	%g5,	%g2
	srl	%o1,	%g3,	%i5
	fmovdle	%icc,	%f10,	%f6
	mulx	%o6,	%i1,	%l2
	fmovda	%icc,	%f29,	%f6
	save %l1, %i2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i4,	%o5,	%i7
	srax	%l4,	0x04,	%o7
	ldsh	[%l7 + 0x50],	%o4
	sir	0x1357
	fxor	%f4,	%f16,	%f6
	umulcc	%g6,	%l3,	%i6
	sub	%g1,	0x0A58,	%l5
	udiv	%o0,	0x08C2,	%l0
	movcc	%icc,	%g7,	%i0
	lduh	[%l7 + 0x18],	%o2
	edge8n	%l6,	%o3,	%g5
	movrlz	%g2,	%o1,	%i3
	fmovd	%f28,	%f24
	ldsw	[%l7 + 0x18],	%g3
	fmovsvs	%icc,	%f31,	%f30
	array16	%i5,	%o6,	%l2
	stb	%i1,	[%l7 + 0x17]
	ldub	[%l7 + 0x0A],	%i2
	move	%xcc,	%l1,	%g4
	srlx	%i4,	0x02,	%o5
	movrgez	%i7,	%o7,	%l4
	nop
	set	0x48, %l1
	sth	%g6,	[%l7 + %l1]
	sra	%l3,	%o4,	%i6
	ldsh	[%l7 + 0x56],	%l5
	edge32n	%g1,	%o0,	%l0
	subcc	%g7,	%o2,	%l6
	xnorcc	%o3,	%i0,	%g5
	sll	%g2,	0x11,	%i3
	movg	%xcc,	%g3,	%i5
	restore %o1, 0x1C2F, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i1,	%i2,	%l1
	movvc	%xcc,	%g4,	%i4
	movvc	%xcc,	%o5,	%l2
	movrgz	%o7,	%l4,	%i7
	movre	%l3,	%g6,	%o4
	movrne	%l5,	%g1,	%i6
	fandnot2	%f12,	%f0,	%f26
	fmovrslez	%o0,	%f0,	%f22
	fmul8x16	%f28,	%f24,	%f2
	movrgez	%l0,	%g7,	%o2
	fzero	%f20
	srlx	%o3,	%l6,	%i0
	movpos	%xcc,	%g5,	%i3
	move	%xcc,	%g3,	%g2
	bshuffle	%f0,	%f8,	%f14
	std	%f4,	[%l7 + 0x20]
	fmovda	%xcc,	%f0,	%f15
	move	%icc,	%o1,	%o6
	edge8	%i5,	%i2,	%l1
	fpmerge	%f23,	%f2,	%f0
	ldx	[%l7 + 0x20],	%i1
	movleu	%icc,	%i4,	%o5
	edge16l	%g4,	%o7,	%l4
	sub	%l2,	0x1C17,	%i7
	fmovdle	%icc,	%f30,	%f28
	movle	%icc,	%g6,	%o4
	xnorcc	%l5,	%l3,	%g1
	fcmpgt32	%f10,	%f22,	%i6
	array16	%l0,	%o0,	%g7
	sethi	0x146C,	%o2
	xor	%l6,	%o3,	%g5
	array8	%i3,	%i0,	%g3
	std	%f4,	[%l7 + 0x60]
	mulscc	%g2,	%o1,	%i5
	fmovrsgz	%o6,	%f27,	%f31
	st	%f18,	[%l7 + 0x10]
	orn	%i2,	0x1A1F,	%i1
	movne	%icc,	%l1,	%o5
	addcc	%g4,	0x1DB6,	%i4
	lduw	[%l7 + 0x28],	%l4
	xorcc	%o7,	0x1978,	%i7
	movn	%xcc,	%l2,	%g6
	movrgz	%o4,	%l3,	%l5
	fornot2	%f10,	%f14,	%f30
	movge	%icc,	%g1,	%l0
	subccc	%i6,	0x1F0B,	%o0
	fmovrdne	%o2,	%f0,	%f14
	array16	%l6,	%g7,	%g5
	sdivx	%i3,	0x13AB,	%i0
	ldsw	[%l7 + 0x5C],	%o3
	xnor	%g2,	%g3,	%i5
	srlx	%o1,	0x19,	%o6
	array32	%i1,	%i2,	%l1
	mulscc	%o5,	%g4,	%i4
	fmuld8sux16	%f19,	%f31,	%f10
	fmovrdne	%l4,	%f20,	%f12
	fmovrsgez	%o7,	%f1,	%f16
	array32	%l2,	%g6,	%o4
	fpadd32	%f12,	%f16,	%f30
	movle	%xcc,	%i7,	%l5
	array16	%g1,	%l0,	%i6
	subc	%l3,	%o0,	%o2
	edge16	%l6,	%g7,	%i3
	andn	%g5,	0x0718,	%i0
	edge16ln	%g2,	%g3,	%o3
	stb	%i5,	[%l7 + 0x47]
	ldd	[%l7 + 0x38],	%f16
	fxor	%f14,	%f12,	%f24
	movvc	%icc,	%o1,	%i1
	st	%f1,	[%l7 + 0x7C]
	ldsw	[%l7 + 0x38],	%i2
	setx loop_102, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_102: 	udivcc	%o5,	0x1FF1,	%i4
	fmovrslz	%g4,	%f2,	%f11
	orn	%l4,	%o7,	%l2
	edge32ln	%o4,	%g6,	%i7
	movrgz	%g1,	%l5,	%l0
	movg	%icc,	%i6,	%o0
	edge8	%o2,	%l6,	%l3
	edge32	%g7,	%g5,	%i3
	nop
	set	0x44, %l2
	sth	%g2,	[%l7 + %l2]
	fnor	%f0,	%f8,	%f22
	movg	%xcc,	%g3,	%i0
	udivx	%o3,	0x0DBC,	%o1
	fmovdcs	%xcc,	%f25,	%f30
	smul	%i1,	0x1922,	%i5
	andn	%i2,	%o6,	%l1
	movge	%xcc,	%i4,	%g4
	stb	%l4,	[%l7 + 0x44]
	fmovsvc	%icc,	%f4,	%f2
	movrlz	%o5,	0x2E5,	%l2
	array8	%o4,	%o7,	%i7
	fzero	%f4
	sra	%g6,	%g1,	%l0
	fornot2	%f14,	%f0,	%f12
	movle	%xcc,	%l5,	%o0
	movgu	%xcc,	%o2,	%i6
	st	%f7,	[%l7 + 0x7C]
	smul	%l3,	%g7,	%g5
	orn	%i3,	0x0AB8,	%l6
	mova	%xcc,	%g3,	%g2
	fsrc2s	%f9,	%f17
	fnor	%f22,	%f30,	%f8
	sub	%o3,	0x0759,	%o1
	lduw	[%l7 + 0x6C],	%i1
	umulcc	%i5,	0x11E8,	%i0
	fxors	%f16,	%f8,	%f7
	movrlez	%i2,	0x085,	%l1
	movrgez	%o6,	0x39F,	%i4
	andncc	%g4,	%o5,	%l2
	orncc	%l4,	%o7,	%o4
	udiv	%g6,	0x09D6,	%g1
	xnorcc	%l0,	0x13A5,	%i7
	xnorcc	%l5,	%o0,	%i6
	edge8l	%o2,	%g7,	%l3
	fmovrslez	%i3,	%f24,	%f8
	movrlz	%g5,	0x27A,	%g3
	mulscc	%g2,	%o3,	%l6
	movre	%i1,	%o1,	%i0
	move	%xcc,	%i2,	%i5
	movvs	%icc,	%o6,	%i4
	sdivcc	%g4,	0x1B2C,	%l1
	mulscc	%l2,	0x1584,	%o5
	edge32n	%l4,	%o7,	%o4
	smulcc	%g1,	%g6,	%i7
	st	%f12,	[%l7 + 0x24]
	xorcc	%l5,	0x083E,	%o0
	fmovdneg	%xcc,	%f26,	%f11
	edge32ln	%l0,	%i6,	%o2
	movle	%icc,	%l3,	%i3
	move	%icc,	%g7,	%g5
	or	%g3,	0x088B,	%o3
	movg	%xcc,	%g2,	%i1
	edge8n	%o1,	%l6,	%i0
	udivx	%i2,	0x192E,	%o6
	movneg	%xcc,	%i4,	%g4
	fcmpne16	%f16,	%f20,	%i5
	orn	%l1,	%o5,	%l2
	std	%f18,	[%l7 + 0x60]
	sir	0x16BF
	movvc	%icc,	%o7,	%l4
	edge32l	%g1,	%o4,	%i7
	sllx	%l5,	0x06,	%g6
	sethi	0x0748,	%o0
	fabsd	%f26,	%f10
	move	%icc,	%l0,	%o2
	fmovspos	%xcc,	%f15,	%f26
	movle	%icc,	%i6,	%l3
	alignaddr	%i3,	%g5,	%g7
	movrgez	%g3,	0x010,	%g2
	movvc	%xcc,	%o3,	%o1
	movle	%icc,	%l6,	%i0
	sth	%i2,	[%l7 + 0x22]
	fmovdle	%icc,	%f20,	%f12
	stb	%o6,	[%l7 + 0x0D]
	fnands	%f18,	%f22,	%f27
	andcc	%i1,	%i4,	%g4
	ldd	[%l7 + 0x48],	%l0
	srax	%o5,	%l2,	%o7
	fmovsl	%icc,	%f17,	%f16
	sir	0x08B2
	fpadd32	%f0,	%f0,	%f26
	subcc	%l4,	0x1F55,	%i5
	array8	%o4,	%i7,	%g1
	ldd	[%l7 + 0x48],	%l4
	fmovdvc	%icc,	%f31,	%f19
	restore %o0, %g6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%icc,	%f27,	%f26
	edge16	%o2,	%l3,	%i3
	fmul8ulx16	%f16,	%f4,	%f28
	movcc	%icc,	%g5,	%g7
	sdivx	%g3,	0x1DC5,	%g2
	mulscc	%o3,	%i6,	%o1
	movneg	%icc,	%l6,	%i0
	move	%icc,	%i2,	%o6
	movgu	%icc,	%i1,	%g4
	movgu	%icc,	%i4,	%o5
	movleu	%xcc,	%l1,	%o7
	ldd	[%l7 + 0x30],	%f28
	addccc	%l2,	%i5,	%l4
	movneg	%icc,	%i7,	%g1
	add	%l5,	0x07DE,	%o4
	sth	%o0,	[%l7 + 0x74]
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f20
	movrlz	%l0,	0x22A,	%g6
	alignaddrl	%l3,	%i3,	%o2
	alignaddr	%g5,	%g3,	%g7
	fzero	%f2
	fmovsvc	%icc,	%f24,	%f7
	movrgez	%g2,	0x003,	%i6
	ldsb	[%l7 + 0x6C],	%o1
	movl	%icc,	%o3,	%i0
	lduh	[%l7 + 0x3C],	%i2
	bshuffle	%f12,	%f6,	%f6
	fornot1s	%f2,	%f9,	%f5
	nop
	set	0x46, %o4
	sth	%o6,	[%l7 + %o4]
	movvc	%xcc,	%i1,	%l6
	fones	%f15
	movvc	%xcc,	%i4,	%o5
	sll	%g4,	%o7,	%l1
	stx	%l2,	[%l7 + 0x38]
	sdivcc	%l4,	0x0748,	%i5
	setx loop_103, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_103: 	or	%o0,	0x1F8B,	%l0
	movn	%xcc,	%l5,	%l3
	ldd	[%l7 + 0x68],	%g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3675
!	Type f   	: 5375
!	Type i   	: 15950
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xF0953716
.word 0x7F14885F
.word 0x287AB055
.word 0xF251DFE4
.word 0xF3D6DFD8
.word 0x013B76A9
.word 0xEC434859
.word 0xC5479EFD
.word 0x1DC77C72
.word 0x2308A2D5
.word 0x28E5AB51
.word 0x6A73A3F2
.word 0x4857A742
.word 0xC545ADA8
.word 0xA513B49D
.word 0xFD1E428E
.word 0x4843DD63
.word 0xD941A54A
.word 0x0BEEFF3F
.word 0x79743110
.word 0x270BD0C4
.word 0x67B4114F
.word 0x0132FCDB
.word 0x1D992629
.word 0xB3627D67
.word 0xD1C4E5A1
.word 0x08A10484
.word 0x2CE7052B
.word 0x8741F928
.word 0x5FCF9DCA
.word 0xA0455D37
.word 0xF7D7BDE8
.word 0x51236657
.word 0xFD84ED19
.word 0x02DFD885
.word 0x98E8CC94
.word 0xA07CFECD
.word 0x31FE50B7
.word 0xA004151A
.word 0x0FA2D4F8
.word 0x3454DF80
.word 0x49D90038
.word 0xB965C6A5
.word 0xF04AFDC2
.word 0xEA83508E
.word 0x9A7A6726
.word 0x30EAB75C
.word 0x89BB237B
.word 0xCED6B365
.word 0x4DB2C6B9
.word 0x4A2EDCEE
.word 0x4D2AB893
.word 0x56B43550
.word 0x4C9DBD3F
.word 0x7B9B8DF1
.word 0x2DB41055
.word 0xC931C730
.word 0x6E652D1A
.word 0xDFE15576
.word 0x317C17E4
.word 0xF05DCB10
.word 0xC366EC76
.word 0x08C53B3C
.word 0x44802F46
.end
