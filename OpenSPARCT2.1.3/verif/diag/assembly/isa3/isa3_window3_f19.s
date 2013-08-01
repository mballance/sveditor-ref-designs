/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f19.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f19.s,v 1.1 2007/05/11 17:22:38 drp Exp $"
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
	setx	0x4777B2A58045BBBE,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x1,	%g1
	set	0x1,	%g2
	set	0xA,	%g3
	set	0x9,	%g4
	set	0x4,	%g5
	set	0x4,	%g6
	set	0x4,	%g7
	!# Input registers
	set	-0x5,	%i0
	set	-0xF,	%i1
	set	-0x8,	%i2
	set	-0x6,	%i3
	set	-0x8,	%i4
	set	-0x8,	%i5
	set	-0x0,	%i6
	set	-0x0,	%i7
	!# Local registers
	set	0x20B5F110,	%l0
	set	0x62FFE369,	%l1
	set	0x4484B9F6,	%l2
	set	0x03683385,	%l3
	set	0x50D5CBD4,	%l4
	set	0x2665F00B,	%l5
	set	0x0BE5EC94,	%l6
	!# Output registers
	set	0x0349,	%o0
	set	-0x1D07,	%o1
	set	-0x073E,	%o2
	set	0x0AEA,	%o3
	set	-0x11E0,	%o4
	set	-0x130C,	%o5
	set	0x02DD,	%o6
	set	0x114E,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xD4115E8FB0CF44F2)
	INIT_TH_FP_REG(%l7,%f2,0x2E85BF0F34AEFB6C)
	INIT_TH_FP_REG(%l7,%f4,0xD4216548DFD7D2C8)
	INIT_TH_FP_REG(%l7,%f6,0xD34D9803D06AF34C)
	INIT_TH_FP_REG(%l7,%f8,0x0E4FE3870038A0D5)
	INIT_TH_FP_REG(%l7,%f10,0x679B2EF44F4E8744)
	INIT_TH_FP_REG(%l7,%f12,0x33E4CA1B847CC931)
	INIT_TH_FP_REG(%l7,%f14,0x3A78A2594449E7FA)
	INIT_TH_FP_REG(%l7,%f16,0x383B767DF6D8605C)
	INIT_TH_FP_REG(%l7,%f18,0x3B16DDF08BE021B0)
	INIT_TH_FP_REG(%l7,%f20,0x2403CA0A1DB762F1)
	INIT_TH_FP_REG(%l7,%f22,0x271E9A7F184B0F4E)
	INIT_TH_FP_REG(%l7,%f24,0xBC4CE8200DFBCF5F)
	INIT_TH_FP_REG(%l7,%f26,0x198C7C1F267E27D9)
	INIT_TH_FP_REG(%l7,%f28,0x03DFFF43D8FDB43A)
	INIT_TH_FP_REG(%l7,%f30,0xE5BA85CF795A3DCA)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0xB93, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	or	%l0,	0x0E05,	%l3
	ld	[%l7 + 0x74],	%f8
	movge	%icc,	%g1,	%g4
	save %o7, %g5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%i1,	%i4
	ldub	[%l7 + 0x3D],	%o5
	edge16l	%l6,	%g2,	%i0
	edge8ln	%o6,	%i3,	%o2
	fmovsge	%xcc,	%f4,	%f24
	movg	%xcc,	%l2,	%g6
	fmovde	%icc,	%f21,	%f27
	sethi	0x031F,	%o3
	mulx	%o0,	0x150A,	%i2
	fcmpgt32	%f12,	%f0,	%g3
	edge16ln	%o1,	%l4,	%i5
	fcmped	%fcc1,	%f24,	%f20
	fcmps	%fcc1,	%f14,	%f2
	fzeros	%f0
	popc	0x114E,	%i7
	movl	%icc,	%l5,	%o4
	for	%f0,	%f6,	%f12
	fcmpgt32	%f4,	%f0,	%g7
	fxor	%f10,	%f28,	%f18
	movrne	%l1,	%l3,	%l0
	fxnors	%f0,	%f31,	%f9
	fmovscc	%xcc,	%f23,	%f0
	addcc	%g4,	0x0BA0,	%g1
	smulcc	%g5,	0x00F8,	%i6
	andncc	%o7,	%i1,	%o5
	fnand	%f10,	%f20,	%f18
	movcc	%icc,	%i4,	%l6
	sethi	0x1116,	%g2
	udivx	%o6,	0x1CAD,	%i0
	fnot1s	%f30,	%f18
	andcc	%i3,	0x1667,	%o2
	movn	%xcc,	%l2,	%o3
	edge32n	%o0,	%i2,	%g6
	srax	%g3,	0x15,	%o1
	movpos	%icc,	%l4,	%i7
	ldsw	[%l7 + 0x64],	%l5
	srl	%i5,	%g7,	%l1
	array8	%l3,	%o4,	%g4
	fcmpeq32	%f18,	%f10,	%g1
	or	%g5,	%l0,	%o7
	movrlez	%i6,	0x180,	%o5
	edge32n	%i1,	%l6,	%g2
	movge	%xcc,	%o6,	%i4
	sir	0x17F0
	fands	%f17,	%f2,	%f1
	sir	0x1E99
	orcc	%i0,	%i3,	%o2
	mova	%xcc,	%l2,	%o0
	array8	%i2,	%g6,	%g3
	fpmerge	%f28,	%f10,	%f18
	sllx	%o1,	%l4,	%i7
	alignaddrl	%l5,	%o3,	%g7
	xnorcc	%l1,	%i5,	%l3
	stx	%o4,	[%l7 + 0x68]
	fpadd16s	%f4,	%f11,	%f10
	array16	%g4,	%g5,	%l0
	fmovrdgz	%o7,	%f6,	%f16
	popc	%g1,	%o5
	movleu	%xcc,	%i6,	%l6
	edge16ln	%g2,	%o6,	%i4
	ldsw	[%l7 + 0x30],	%i0
	movrgez	%i3,	%o2,	%i1
	sdiv	%o0,	0x10B6,	%l2
	stx	%i2,	[%l7 + 0x60]
	movg	%xcc,	%g3,	%g6
	srax	%l4,	%i7,	%o1
	srl	%l5,	%g7,	%o3
	sll	%l1,	0x0E,	%i5
	movge	%xcc,	%l3,	%g4
	xnor	%o4,	0x1630,	%g5
	movpos	%xcc,	%o7,	%l0
	sth	%g1,	[%l7 + 0x0A]
	movcs	%icc,	%i6,	%l6
	movg	%icc,	%o5,	%o6
	subcc	%g2,	0x1669,	%i0
	fcmpgt32	%f28,	%f2,	%i3
	andn	%i4,	%o2,	%o0
	fmovrdlz	%i1,	%f6,	%f8
	movcs	%xcc,	%i2,	%g3
	addcc	%g6,	0x1DEB,	%l4
	udivx	%i7,	0x0305,	%o1
	movvs	%icc,	%l2,	%l5
	st	%f27,	[%l7 + 0x40]
	fmovdvc	%icc,	%f9,	%f21
	ldx	[%l7 + 0x78],	%o3
	sllx	%g7,	0x01,	%i5
	edge32n	%l1,	%g4,	%l3
	movge	%xcc,	%o4,	%g5
	umulcc	%o7,	0x1208,	%g1
	subcc	%l0,	0x11E8,	%l6
	nop
	set	0x38, %g7
	ldx	[%l7 + %g7],	%i6
	subcc	%o6,	%o5,	%i0
	st	%f7,	[%l7 + 0x58]
	nop
	set	0x7C, %i5
	sth	%i3,	[%l7 + %i5]
	movre	%g2,	%o2,	%o0
	fnegd	%f12,	%f18
	umulcc	%i4,	0x1051,	%i1
	fpadd16s	%f4,	%f14,	%f24
	sth	%g3,	[%l7 + 0x1E]
	mulscc	%i2,	0x12BE,	%g6
	movrne	%i7,	%o1,	%l2
	xorcc	%l4,	0x00F2,	%l5
	umulcc	%o3,	%i5,	%g7
	xnor	%l1,	0x0F8D,	%g4
	fmovsl	%xcc,	%f1,	%f22
	add	%l3,	%g5,	%o4
	alignaddrl	%g1,	%o7,	%l0
	nop
	set	0x70, %l0
	ldsw	[%l7 + %l0],	%i6
	andcc	%l6,	0x080A,	%o6
	fcmpd	%fcc2,	%f6,	%f30
	umul	%o5,	%i3,	%g2
	fxors	%f2,	%f4,	%f10
	movvc	%xcc,	%o2,	%i0
	ldx	[%l7 + 0x68],	%i4
	fmovrdlez	%o0,	%f28,	%f0
	alignaddr	%g3,	%i1,	%g6
	movrgez	%i7,	0x007,	%o1
	fmovdcs	%xcc,	%f18,	%f7
	edge8l	%i2,	%l4,	%l2
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%o2
	sir	0x0D12
	stw	%i5,	[%l7 + 0x10]
	fandnot1s	%f8,	%f15,	%f16
	movn	%icc,	%g7,	%l1
	array8	%g4,	%l3,	%l5
	fcmpgt16	%f28,	%f10,	%g5
	fmovdne	%xcc,	%f19,	%f13
	edge32	%g1,	%o4,	%l0
	alignaddrl	%i6,	%l6,	%o7
	mulscc	%o5,	%i3,	%g2
	edge32n	%o6,	%o2,	%i4
	edge8n	%i0,	%g3,	%i1
	edge16l	%o0,	%i7,	%g6
	umulcc	%i2,	%l4,	%l2
	edge16l	%o3,	%o1,	%g7
	move	%xcc,	%i5,	%g4
	stw	%l3,	[%l7 + 0x5C]
	srl	%l5,	%g5,	%g1
	addcc	%l1,	0x1414,	%l0
	fmovsgu	%xcc,	%f28,	%f7
	edge32ln	%o4,	%i6,	%o7
	edge8l	%l6,	%o5,	%i3
	sub	%g2,	%o6,	%o2
	xnor	%i0,	0x145F,	%i4
	smul	%i1,	%o0,	%i7
	array32	%g6,	%g3,	%i2
	edge8l	%l2,	%l4,	%o1
	umulcc	%o3,	%i5,	%g7
	fornot2	%f12,	%f2,	%f2
	stb	%g4,	[%l7 + 0x6F]
	ldub	[%l7 + 0x74],	%l3
	fzeros	%f17
	fmovda	%xcc,	%f3,	%f26
	movcs	%xcc,	%l5,	%g1
	fmovdneg	%icc,	%f0,	%f13
	umulcc	%g5,	%l1,	%o4
	fnors	%f27,	%f7,	%f8
	bshuffle	%f6,	%f0,	%f14
	movrlez	%i6,	0x224,	%l0
	edge16ln	%o7,	%l6,	%o5
	array32	%i3,	%o6,	%g2
	sra	%i0,	%o2,	%i1
	movle	%xcc,	%o0,	%i4
	ldub	[%l7 + 0x31],	%i7
	edge16ln	%g6,	%i2,	%l2
	restore %l4, 0x020B, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%o3,	%o1,	%g7
	sethi	0x0A25,	%i5
	fmovsleu	%xcc,	%f2,	%f28
	add	%l3,	%g4,	%g1
	movrgez	%g5,	0x034,	%l5
	movgu	%xcc,	%l1,	%o4
	save %l0, 0x0E08, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l6,	%o5,	%o7
	andn	%i3,	%o6,	%i0
	array16	%o2,	%g2,	%o0
	xorcc	%i4,	0x1179,	%i7
	edge8	%g6,	%i2,	%l2
	movge	%xcc,	%l4,	%i1
	ldx	[%l7 + 0x50],	%g3
	fornot2	%f2,	%f8,	%f24
	sir	0x0192
	xnorcc	%o1,	%g7,	%o3
	fpack16	%f22,	%f10
	sdivx	%i5,	0x0C3C,	%g4
	umulcc	%l3,	%g5,	%l5
	stw	%g1,	[%l7 + 0x08]
	movg	%icc,	%l1,	%l0
	addc	%i6,	%o4,	%l6
	fors	%f14,	%f6,	%f10
	fxor	%f12,	%f12,	%f4
	udiv	%o7,	0x09E5,	%i3
	orncc	%o5,	0x1564,	%i0
	fxor	%f28,	%f14,	%f0
	umul	%o2,	%g2,	%o0
	addc	%o6,	0x157A,	%i7
	fmuld8ulx16	%f5,	%f12,	%f0
	stw	%g6,	[%l7 + 0x18]
	alignaddr	%i4,	%l2,	%l4
	ldsh	[%l7 + 0x7E],	%i1
	udiv	%g3,	0x146C,	%o1
	fands	%f12,	%f13,	%f16
	fcmpne16	%f30,	%f14,	%i2
	udivx	%g7,	0x03F2,	%i5
	smulcc	%o3,	%g4,	%l3
	addc	%g5,	0x1C1C,	%g1
	edge32n	%l5,	%l0,	%l1
	fmovscc	%xcc,	%f5,	%f19
	array16	%o4,	%l6,	%o7
	alignaddrl	%i3,	%i6,	%o5
	ldsh	[%l7 + 0x52],	%o2
	fnand	%f10,	%f4,	%f4
	stb	%i0,	[%l7 + 0x17]
	fpsub32s	%f15,	%f5,	%f30
	movne	%xcc,	%g2,	%o0
	movne	%xcc,	%i7,	%g6
	movg	%icc,	%i4,	%o6
	orcc	%l2,	%i1,	%g3
	fcmpeq16	%f20,	%f6,	%o1
	fpack32	%f28,	%f16,	%f6
	andn	%l4,	%i2,	%i5
	edge8	%o3,	%g4,	%l3
	movge	%xcc,	%g5,	%g7
	smulcc	%l5,	0x01F1,	%l0
	edge32ln	%g1,	%o4,	%l6
	fmovdn	%xcc,	%f14,	%f28
	stw	%l1,	[%l7 + 0x18]
	ldsb	[%l7 + 0x10],	%i3
	edge8	%i6,	%o5,	%o7
	movg	%xcc,	%o2,	%i0
	fxnors	%f7,	%f13,	%f5
	mulx	%o0,	%i7,	%g2
	fcmpeq16	%f0,	%f12,	%g6
	move	%xcc,	%i4,	%o6
	fors	%f18,	%f16,	%f16
	nop
	set	0x5E, %o3
	lduh	[%l7 + %o3],	%l2
	stw	%i1,	[%l7 + 0x6C]
	nop
	set	0x68, %o5
	ldd	[%l7 + %o5],	%o0
	edge8l	%g3,	%i2,	%l4
	fmovdleu	%xcc,	%f9,	%f5
	movre	%i5,	0x1DD,	%o3
	fands	%f18,	%f13,	%f15
	edge32ln	%g4,	%g5,	%l3
	subc	%g7,	%l5,	%g1
	xor	%l0,	0x0610,	%o4
	mulx	%l6,	%i3,	%i6
	fmul8ulx16	%f18,	%f0,	%f16
	fcmple16	%f22,	%f6,	%o5
	orcc	%o7,	0x0431,	%o2
	lduh	[%l7 + 0x3E],	%l1
	movne	%icc,	%o0,	%i7
	edge8	%i0,	%g2,	%g6
	ldd	[%l7 + 0x48],	%f6
	edge32n	%i4,	%l2,	%i1
	andncc	%o6,	%o1,	%g3
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	fmovdl	%xcc,	%f7,	%f5
	array8	%o3,	%g4,	%i5
	fmovsneg	%icc,	%f11,	%f21
	edge32	%g5,	%l3,	%g7
	stx	%l5,	[%l7 + 0x10]
	subccc	%l0,	0x1AF6,	%g1
	ld	[%l7 + 0x1C],	%f7
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%f18
	edge32n	%o4,	%i3,	%l6
	movge	%icc,	%o5,	%o7
	or	%o2,	0x08C6,	%i6
	fmovrse	%l1,	%f31,	%f21
	movne	%xcc,	%o0,	%i7
	array8	%i0,	%g2,	%g6
	lduh	[%l7 + 0x1C],	%i4
	sub	%l2,	%i1,	%o6
	for	%f4,	%f20,	%f16
	bshuffle	%f26,	%f20,	%f18
	edge16n	%o1,	%l4,	%g3
	fmovscc	%xcc,	%f6,	%f1
	fmovdn	%xcc,	%f18,	%f30
	movrgez	%o3,	0x35F,	%g4
	movgu	%xcc,	%i5,	%g5
	fcmps	%fcc1,	%f2,	%f4
	fmovdpos	%icc,	%f21,	%f23
	edge16n	%l3,	%g7,	%l5
	movrgez	%l0,	0x2FD,	%g1
	movge	%icc,	%i2,	%i3
	movneg	%icc,	%o4,	%o5
	add	%o7,	%l6,	%i6
	addcc	%l1,	0x17DE,	%o0
	movcs	%xcc,	%i7,	%i0
	orn	%o2,	%g2,	%i4
	orncc	%g6,	%l2,	%i1
	edge16	%o1,	%o6,	%l4
	sth	%g3,	[%l7 + 0x7C]
	fmovscs	%xcc,	%f30,	%f4
	umul	%o3,	0x0573,	%i5
	orcc	%g5,	0x1D28,	%l3
	movvc	%icc,	%g7,	%l5
	fmovdvs	%icc,	%f6,	%f2
	movgu	%icc,	%l0,	%g1
	save %i2, 0x0B5E, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g4,	0x17,	%o5
	orcc	%o7,	0x1CBF,	%l6
	fmovsleu	%xcc,	%f10,	%f14
	movrlz	%o4,	0x3E3,	%l1
	fabsd	%f20,	%f0
	edge8	%i6,	%o0,	%i0
	movcc	%icc,	%o2,	%g2
	addccc	%i7,	%i4,	%l2
	movre	%g6,	%i1,	%o1
	fsrc1	%f24,	%f14
	udiv	%o6,	0x13C6,	%l4
	movrne	%o3,	%i5,	%g5
	andncc	%g3,	%l3,	%g7
	fpadd16	%f18,	%f4,	%f4
	andcc	%l0,	0x15E4,	%l5
	movneg	%xcc,	%i2,	%g1
	array8	%g4,	%i3,	%o7
	addcc	%l6,	%o4,	%l1
	move	%xcc,	%o5,	%i6
	ldsh	[%l7 + 0x3C],	%o0
	array8	%o2,	%i0,	%g2
	movleu	%icc,	%i4,	%i7
	fmovdgu	%icc,	%f26,	%f14
	movrlz	%g6,	0x04C,	%l2
	smul	%o1,	0x09D1,	%i1
	fmuld8sux16	%f10,	%f1,	%f6
	array32	%l4,	%o3,	%o6
	movrlz	%i5,	%g3,	%l3
	andcc	%g7,	%g5,	%l5
	movvs	%xcc,	%l0,	%i2
	edge32ln	%g4,	%i3,	%o7
	popc	%l6,	%o4
	movleu	%icc,	%l1,	%g1
	fnot2s	%f16,	%f0
	movn	%xcc,	%o5,	%i6
	andncc	%o0,	%o2,	%g2
	movrgz	%i0,	0x18C,	%i7
	movrgez	%g6,	%i4,	%o1
	sdivcc	%l2,	0x0AAE,	%i1
	movl	%xcc,	%l4,	%o3
	movneg	%xcc,	%i5,	%o6
	sethi	0x169D,	%g3
	fcmpgt16	%f6,	%f26,	%g7
	edge16ln	%g5,	%l5,	%l0
	addcc	%i2,	0x1857,	%l3
	edge8l	%g4,	%i3,	%o7
	sdivx	%l6,	0x1DEB,	%o4
	addc	%g1,	%o5,	%i6
	and	%l1,	0x0248,	%o0
	restore %o2, 0x01FD, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%g6,	%i4
	movle	%xcc,	%o1,	%l2
	sth	%i1,	[%l7 + 0x0E]
	fcmple32	%f14,	%f2,	%i0
	edge8l	%o3,	%l4,	%i5
	movl	%xcc,	%g3,	%g7
	movpos	%icc,	%o6,	%g5
	fmovrde	%l0,	%f22,	%f22
	udiv	%i2,	0x1FD1,	%l3
	andncc	%g4,	%i3,	%l5
	edge32	%o7,	%o4,	%l6
	xor	%o5,	%g1,	%l1
	add	%o0,	%o2,	%i6
	sir	0x0F09
	ldsb	[%l7 + 0x2C],	%g2
	lduh	[%l7 + 0x52],	%i7
	sdivx	%i4,	0x0F6E,	%o1
	and	%l2,	%g6,	%i1
	movrlz	%o3,	0x1F9,	%l4
	movge	%xcc,	%i5,	%i0
	fmovdvc	%icc,	%f1,	%f23
	orn	%g3,	%g7,	%o6
	edge32ln	%l0,	%i2,	%l3
	xorcc	%g5,	0x0186,	%i3
	ldsh	[%l7 + 0x32],	%l5
	subc	%g4,	%o7,	%o4
	fnegd	%f12,	%f10
	xorcc	%l6,	%g1,	%o5
	smul	%o0,	%l1,	%o2
	fabsd	%f2,	%f14
	fpadd16	%f18,	%f14,	%f4
	fmovdge	%xcc,	%f30,	%f10
	fmul8x16al	%f2,	%f19,	%f22
	save %g2, %i7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x0C],	%i6
	fpack32	%f12,	%f24,	%f16
	movrne	%l2,	%o1,	%g6
	edge8	%i1,	%o3,	%i5
	sethi	0x1BE1,	%i0
	umulcc	%l4,	0x0AB9,	%g3
	edge8ln	%o6,	%g7,	%l0
	fcmped	%fcc1,	%f26,	%f8
	fsrc1	%f12,	%f30
	xor	%i2,	%l3,	%i3
	fmovde	%icc,	%f4,	%f12
	movrlz	%l5,	0x04A,	%g4
	andn	%g5,	0x023C,	%o7
	sdivx	%l6,	0x1213,	%g1
	array8	%o5,	%o0,	%l1
	movle	%xcc,	%o4,	%g2
	mova	%xcc,	%i7,	%o2
	st	%f21,	[%l7 + 0x18]
	orncc	%i4,	0x0A78,	%l2
	fmovrsgez	%i6,	%f18,	%f8
	udiv	%o1,	0x0BA7,	%i1
	and	%g6,	%i5,	%i0
	save %l4, 0x157C, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o6,	%g3,	%g7
	edge32	%l0,	%l3,	%i2
	add	%l5,	0x18C3,	%g4
	xorcc	%g5,	%i3,	%l6
	fxor	%f12,	%f0,	%f20
	srax	%g1,	%o7,	%o0
	orcc	%o5,	%o4,	%l1
	sub	%g2,	0x0408,	%i7
	fmovrse	%i4,	%f2,	%f26
	fands	%f14,	%f4,	%f9
	ld	[%l7 + 0x60],	%f15
	edge32l	%l2,	%o2,	%i6
	fmovd	%f12,	%f26
	fmovdleu	%xcc,	%f4,	%f1
	smul	%o1,	0x1BCC,	%i1
	sethi	0x1445,	%i5
	sdiv	%g6,	0x0E13,	%i0
	sth	%o3,	[%l7 + 0x5E]
	fmovrdgez	%l4,	%f22,	%f6
	movle	%icc,	%g3,	%o6
	fpsub16s	%f18,	%f21,	%f14
	stw	%g7,	[%l7 + 0x08]
	fmovdcc	%icc,	%f30,	%f12
	save %l3, 0x08D2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	0x180E,	%g4
	ldsw	[%l7 + 0x2C],	%i2
	xnor	%i3,	%g5,	%g1
	fcmple16	%f10,	%f20,	%l6
	udivcc	%o7,	0x0239,	%o5
	nop
	set	0x16, %o2
	ldsh	[%l7 + %o2],	%o0
	std	%f28,	[%l7 + 0x70]
	movcc	%xcc,	%l1,	%o4
	udivx	%g2,	0x0D84,	%i4
	movge	%xcc,	%l2,	%i7
	fmovdl	%icc,	%f16,	%f8
	andncc	%i6,	%o2,	%o1
	edge16n	%i1,	%g6,	%i0
	fabss	%f5,	%f9
	edge8l	%i5,	%o3,	%l4
	orcc	%g3,	0x1181,	%o6
	movne	%xcc,	%l3,	%g7
	stw	%l0,	[%l7 + 0x2C]
	fandnot1	%f6,	%f26,	%f0
	movcs	%xcc,	%l5,	%g4
	ldsb	[%l7 + 0x13],	%i2
	std	%f16,	[%l7 + 0x38]
	faligndata	%f12,	%f22,	%f16
	ldsw	[%l7 + 0x1C],	%g5
	fcmped	%fcc0,	%f30,	%f20
	sra	%g1,	0x12,	%l6
	fmul8x16	%f13,	%f4,	%f22
	fcmpeq32	%f26,	%f26,	%i3
	xor	%o7,	%o0,	%o5
	fmovdle	%xcc,	%f15,	%f4
	edge16n	%l1,	%o4,	%g2
	ldd	[%l7 + 0x20],	%f16
	sethi	0x0957,	%i4
	nop
	set	0x5B, %l1
	ldub	[%l7 + %l1],	%l2
	fmovrdgz	%i7,	%f6,	%f2
	edge16n	%i6,	%o1,	%i1
	fmovrsgez	%o2,	%f13,	%f16
	movleu	%xcc,	%g6,	%i5
	fpack32	%f0,	%f12,	%f2
	sllx	%i0,	0x18,	%o3
	fpsub16	%f16,	%f22,	%f28
	movg	%xcc,	%g3,	%o6
	movleu	%icc,	%l3,	%g7
	sdivcc	%l0,	0x0415,	%l4
	movge	%xcc,	%g4,	%i2
	fmovs	%f31,	%f2
	movl	%icc,	%l5,	%g5
	movrlz	%g1,	0x030,	%i3
	fmovrslez	%l6,	%f18,	%f14
	fmovsle	%icc,	%f18,	%f1
	udivcc	%o0,	0x0C1F,	%o7
	sub	%o5,	0x1CE8,	%l1
	save %g2, %o4, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i7,	0x0508,	%i6
	edge16	%o1,	%i1,	%o2
	fpadd32s	%f25,	%f1,	%f20
	movge	%icc,	%l2,	%i5
	add	%i0,	0x1F80,	%g6
	sth	%o3,	[%l7 + 0x3C]
	ldx	[%l7 + 0x48],	%o6
	addc	%l3,	0x115F,	%g7
	movrlez	%g3,	%l4,	%l0
	fmul8sux16	%f16,	%f6,	%f20
	sdivx	%g4,	0x15AD,	%l5
	movgu	%xcc,	%g5,	%i2
	edge16l	%g1,	%i3,	%l6
	smul	%o7,	%o0,	%l1
	fmovsvs	%icc,	%f5,	%f8
	sub	%o5,	%o4,	%i4
	lduh	[%l7 + 0x52],	%i7
	fmovs	%f5,	%f12
	subc	%i6,	0x05A7,	%o1
	fcmpes	%fcc0,	%f0,	%f1
	udivx	%g2,	0x0BBA,	%i1
	fnot2s	%f26,	%f19
	edge16l	%o2,	%l2,	%i0
	edge32l	%i5,	%o3,	%g6
	sllx	%l3,	0x0D,	%g7
	edge16	%g3,	%l4,	%l0
	sth	%o6,	[%l7 + 0x68]
	sdivcc	%g4,	0x1220,	%l5
	movgu	%xcc,	%g5,	%g1
	movcc	%icc,	%i3,	%l6
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	lduw	[%l7 + 0x58],	%l1
	fmovdle	%xcc,	%f16,	%f24
	edge16n	%o5,	%i4,	%i7
	array16	%o4,	%i6,	%g2
	edge8l	%i1,	%o1,	%l2
	fmovrslz	%o2,	%f11,	%f2
	fors	%f17,	%f2,	%f0
	subc	%i0,	%o3,	%i5
	addcc	%g6,	%g7,	%l3
	std	%f18,	[%l7 + 0x58]
	movgu	%icc,	%l4,	%l0
	nop
	set	0x1F, %g4
	ldub	[%l7 + %g4],	%g3
	sdiv	%o6,	0x0A77,	%g4
	lduh	[%l7 + 0x46],	%g5
	subc	%g1,	0x0A7F,	%i3
	mova	%xcc,	%l6,	%l5
	edge32	%o7,	%i2,	%o0
	sub	%o5,	%i4,	%i7
	xnor	%l1,	0x1379,	%i6
	movcc	%icc,	%g2,	%i1
	movrlz	%o4,	0x07C,	%l2
	fmovdpos	%xcc,	%f6,	%f9
	xor	%o2,	0x1404,	%i0
	fxnor	%f20,	%f20,	%f28
	xorcc	%o1,	%i5,	%o3
	subc	%g7,	%l3,	%g6
	movvs	%xcc,	%l0,	%l4
	alignaddrl	%o6,	%g3,	%g5
	subc	%g1,	%g4,	%l6
	add	%l5,	%o7,	%i3
	sethi	0x0F0B,	%i2
	movgu	%icc,	%o5,	%i4
	sub	%i7,	%o0,	%l1
	fmovscs	%xcc,	%f10,	%f22
	fmovdcs	%xcc,	%f12,	%f13
	smulcc	%g2,	0x1810,	%i1
	popc	0x0CE0,	%i6
	movvc	%xcc,	%o4,	%l2
	fnands	%f6,	%f25,	%f23
	sdiv	%i0,	0x0A9A,	%o1
	sra	%o2,	%o3,	%g7
	movpos	%xcc,	%i5,	%l3
	fands	%f12,	%f21,	%f6
	array32	%l0,	%g6,	%l4
	movvs	%xcc,	%o6,	%g3
	umul	%g5,	%g1,	%g4
	movle	%xcc,	%l5,	%o7
	fandnot2s	%f2,	%f10,	%f12
	sub	%l6,	0x06E7,	%i2
	ldsb	[%l7 + 0x0E],	%i3
	subc	%o5,	%i4,	%o0
	movg	%xcc,	%i7,	%l1
	array32	%g2,	%i1,	%o4
	addcc	%i6,	%i0,	%l2
	sdivcc	%o1,	0x0A60,	%o2
	sir	0x009C
	fones	%f1
	sdivx	%o3,	0x1958,	%i5
	umulcc	%g7,	%l0,	%g6
	edge16	%l4,	%l3,	%o6
	edge32	%g3,	%g1,	%g5
	sub	%l5,	0x00F6,	%g4
	stb	%o7,	[%l7 + 0x12]
	st	%f27,	[%l7 + 0x54]
	orncc	%i2,	%l6,	%o5
	edge16ln	%i3,	%o0,	%i7
	fmovdneg	%xcc,	%f28,	%f26
	ldd	[%l7 + 0x48],	%f20
	bshuffle	%f0,	%f30,	%f14
	ldd	[%l7 + 0x08],	%f24
	movleu	%xcc,	%i4,	%g2
	movrgz	%i1,	0x0D3,	%l1
	sllx	%o4,	%i6,	%l2
	fabss	%f14,	%f17
	subc	%i0,	0x1C63,	%o2
	fornot2	%f30,	%f12,	%f4
	sra	%o3,	%o1,	%g7
	movge	%icc,	%i5,	%l0
	movg	%xcc,	%g6,	%l4
	movvc	%xcc,	%l3,	%o6
	array32	%g1,	%g5,	%g3
	fmul8x16	%f14,	%f28,	%f10
	sllx	%g4,	%l5,	%i2
	addccc	%o7,	%l6,	%o5
	smulcc	%i3,	%o0,	%i7
	udivx	%i4,	0x1137,	%g2
	sdiv	%l1,	0x12E1,	%o4
	fnands	%f16,	%f21,	%f22
	udiv	%i1,	0x1FFA,	%l2
	movneg	%icc,	%i0,	%o2
	smulcc	%o3,	0x04F5,	%i6
	fpadd32s	%f26,	%f24,	%f19
	edge16	%o1,	%g7,	%l0
	edge32	%g6,	%i5,	%l4
	fpsub16s	%f15,	%f28,	%f5
	and	%l3,	0x1C20,	%g1
	movne	%xcc,	%g5,	%o6
	andncc	%g4,	%g3,	%l5
	stx	%i2,	[%l7 + 0x18]
	fabsd	%f12,	%f20
	sll	%o7,	%o5,	%i3
	mova	%xcc,	%l6,	%o0
	orn	%i4,	%g2,	%i7
	fcmpeq32	%f4,	%f0,	%l1
	edge16	%i1,	%l2,	%o4
	subccc	%i0,	%o3,	%o2
	fandnot1	%f20,	%f12,	%f22
	ldsw	[%l7 + 0x1C],	%i6
	movg	%xcc,	%o1,	%g7
	xnorcc	%g6,	%i5,	%l4
	bshuffle	%f4,	%f6,	%f14
	andcc	%l0,	%l3,	%g1
	fones	%f7
	ldub	[%l7 + 0x33],	%o6
	fmovdvs	%xcc,	%f23,	%f9
	subccc	%g4,	0x1730,	%g3
	stb	%g5,	[%l7 + 0x3D]
	stx	%i2,	[%l7 + 0x58]
	fpmerge	%f25,	%f2,	%f12
	umul	%l5,	%o7,	%o5
	fones	%f23
	array8	%l6,	%o0,	%i3
	xnor	%g2,	%i4,	%l1
	fnegd	%f12,	%f20
	movrgz	%i1,	0x0AD,	%l2
	fmovdge	%xcc,	%f28,	%f2
	movpos	%xcc,	%i7,	%i0
	sdivx	%o4,	0x0CCB,	%o3
	ldd	[%l7 + 0x08],	%i6
	edge16n	%o2,	%g7,	%o1
	umulcc	%g6,	0x1642,	%l4
	array16	%i5,	%l0,	%l3
	subc	%o6,	0x1328,	%g4
	alignaddrl	%g3,	%g5,	%g1
	pdist	%f20,	%f10,	%f2
	fmovrdgez	%l5,	%f0,	%f20
	umul	%o7,	0x0F51,	%i2
	ldx	[%l7 + 0x20],	%l6
	nop
	set	0x16, %g6
	ldsh	[%l7 + %g6],	%o5
	udiv	%i3,	0x1825,	%g2
	edge16	%i4,	%l1,	%o0
	xnorcc	%l2,	0x18CF,	%i1
	fpack32	%f28,	%f6,	%f26
	movrne	%i7,	0x2D0,	%o4
	lduh	[%l7 + 0x16],	%o3
	movrlz	%i0,	0x19D,	%i6
	movrlez	%o2,	0x273,	%g7
	mulscc	%g6,	0x0BFB,	%o1
	sra	%l4,	0x1E,	%i5
	ldub	[%l7 + 0x59],	%l0
	andcc	%o6,	0x194C,	%l3
	ldd	[%l7 + 0x40],	%g2
	sdivcc	%g5,	0x1313,	%g1
	movg	%xcc,	%l5,	%o7
	ldsb	[%l7 + 0x34],	%i2
	orncc	%l6,	0x05BF,	%g4
	movle	%xcc,	%o5,	%i3
	fmovdge	%icc,	%f20,	%f22
	movcs	%icc,	%i4,	%l1
	xnorcc	%g2,	0x19AC,	%o0
	fabsd	%f22,	%f8
	sth	%l2,	[%l7 + 0x50]
	fmovsle	%xcc,	%f5,	%f26
	xor	%i1,	0x18C1,	%o4
	fmovdgu	%xcc,	%f12,	%f4
	movleu	%xcc,	%i7,	%i0
	st	%f28,	[%l7 + 0x2C]
	fmovse	%icc,	%f10,	%f10
	sth	%o3,	[%l7 + 0x7A]
	sth	%i6,	[%l7 + 0x12]
	edge8l	%o2,	%g6,	%g7
	edge32n	%o1,	%l4,	%l0
	lduw	[%l7 + 0x78],	%i5
	movl	%icc,	%l3,	%o6
	umul	%g5,	0x132D,	%g1
	ldsw	[%l7 + 0x5C],	%l5
	edge8ln	%g3,	%o7,	%l6
	sllx	%i2,	0x10,	%g4
	sir	0x15C8
	move	%icc,	%o5,	%i3
	move	%xcc,	%i4,	%l1
	xnorcc	%o0,	%g2,	%i1
	udivx	%l2,	0x0CED,	%o4
	ldsb	[%l7 + 0x4D],	%i7
	fors	%f12,	%f14,	%f3
	fmovdle	%xcc,	%f10,	%f22
	movcc	%icc,	%o3,	%i6
	fmovdge	%icc,	%f24,	%f11
	save %o2, %g6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o1,	0x078D,	%l4
	ldsh	[%l7 + 0x4A],	%l0
	edge16n	%g7,	%i5,	%l3
	smul	%g5,	0x143D,	%g1
	movle	%icc,	%o6,	%g3
	edge16l	%o7,	%l5,	%i2
	ldsw	[%l7 + 0x08],	%l6
	movg	%icc,	%g4,	%i3
	sir	0x0EFB
	edge8	%i4,	%o5,	%o0
	lduh	[%l7 + 0x6C],	%l1
	edge32	%i1,	%g2,	%l2
	sdivcc	%i7,	0x0205,	%o3
	fmovda	%icc,	%f4,	%f7
	fmovsneg	%xcc,	%f10,	%f16
	sub	%o4,	%o2,	%i6
	nop
	set	0x16, %i2
	lduh	[%l7 + %i2],	%g6
	st	%f16,	[%l7 + 0x10]
	orncc	%o1,	0x0C78,	%i0
	movrlz	%l0,	0x246,	%l4
	andncc	%g7,	%l3,	%g5
	edge32l	%i5,	%g1,	%g3
	alignaddrl	%o7,	%o6,	%l5
	edge16n	%i2,	%g4,	%l6
	st	%f26,	[%l7 + 0x50]
	fmovsleu	%xcc,	%f3,	%f3
	lduw	[%l7 + 0x34],	%i4
	umulcc	%o5,	%i3,	%o0
	fmovdgu	%xcc,	%f6,	%f15
	fmovsl	%xcc,	%f12,	%f21
	alignaddr	%i1,	%l1,	%l2
	ld	[%l7 + 0x18],	%f24
	andncc	%i7,	%o3,	%g2
	udivcc	%o4,	0x1F12,	%o2
	umulcc	%i6,	0x0072,	%o1
	alignaddrl	%g6,	%l0,	%i0
	ldd	[%l7 + 0x30],	%f24
	fcmple32	%f12,	%f30,	%l4
	sub	%l3,	%g5,	%i5
	movre	%g7,	0x270,	%g1
	andcc	%g3,	%o6,	%o7
	sdiv	%l5,	0x003A,	%g4
	sdiv	%l6,	0x0983,	%i4
	movg	%icc,	%i2,	%i3
	xnor	%o0,	%i1,	%o5
	edge16n	%l2,	%i7,	%o3
	sethi	0x0F4C,	%g2
	edge16l	%l1,	%o4,	%i6
	movl	%icc,	%o1,	%o2
	mulscc	%g6,	%l0,	%l4
	ldsw	[%l7 + 0x3C],	%i0
	fmovsvs	%xcc,	%f10,	%f26
	restore %l3, 0x0A24, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f30,	%f5,	%f10
	ldd	[%l7 + 0x38],	%g6
	fsrc2	%f30,	%f2
	sll	%g5,	%g3,	%g1
	sethi	0x1FE2,	%o6
	movrlez	%o7,	0x073,	%l5
	edge16ln	%l6,	%i4,	%g4
	fzeros	%f16
	move	%icc,	%i2,	%i3
	stb	%o0,	[%l7 + 0x14]
	fmovd	%f10,	%f10
	ldsw	[%l7 + 0x58],	%o5
	sra	%l2,	0x14,	%i7
	udiv	%o3,	0x1C6B,	%g2
	fpadd16s	%f12,	%f28,	%f11
	movpos	%xcc,	%l1,	%o4
	sir	0x113E
	movle	%xcc,	%i1,	%i6
	movpos	%xcc,	%o2,	%o1
	array8	%g6,	%l0,	%i0
	ld	[%l7 + 0x18],	%f25
	ldsw	[%l7 + 0x1C],	%l4
	subc	%i5,	%l3,	%g5
	alignaddr	%g7,	%g1,	%g3
	fcmpes	%fcc2,	%f24,	%f14
	movgu	%icc,	%o6,	%o7
	edge32n	%l6,	%i4,	%l5
	sir	0x0AE0
	addc	%g4,	0x055A,	%i2
	edge8ln	%i3,	%o5,	%l2
	fmovrdgz	%o0,	%f0,	%f18
	fmovrde	%i7,	%f28,	%f18
	edge16l	%g2,	%l1,	%o4
	array32	%i1,	%o3,	%i6
	mova	%xcc,	%o1,	%g6
	smulcc	%l0,	0x0EFF,	%o2
	ldsb	[%l7 + 0x74],	%i0
	umul	%l4,	%i5,	%g5
	movcc	%icc,	%l3,	%g7
	movge	%xcc,	%g3,	%o6
	subc	%g1,	0x04CD,	%o7
	fornot2s	%f24,	%f11,	%f21
	ld	[%l7 + 0x74],	%f4
	sth	%i4,	[%l7 + 0x6A]
	movg	%xcc,	%l5,	%l6
	ld	[%l7 + 0x30],	%f13
	edge8	%g4,	%i2,	%o5
	st	%f0,	[%l7 + 0x60]
	fmovdcs	%xcc,	%f30,	%f6
	or	%l2,	0x1BE5,	%o0
	xorcc	%i7,	0x0CC4,	%g2
	lduw	[%l7 + 0x54],	%i3
	andcc	%o4,	0x0D3D,	%i1
	edge32ln	%o3,	%l1,	%o1
	and	%g6,	0x0FE1,	%l0
	andncc	%i6,	%i0,	%o2
	edge32n	%i5,	%l4,	%l3
	movneg	%icc,	%g5,	%g3
	ldsh	[%l7 + 0x68],	%o6
	st	%f1,	[%l7 + 0x48]
	movge	%icc,	%g7,	%o7
	and	%i4,	%l5,	%g1
	alignaddrl	%g4,	%l6,	%i2
	ldsw	[%l7 + 0x7C],	%l2
	umulcc	%o5,	%i7,	%o0
	srlx	%i3,	%g2,	%i1
	fones	%f14
	sll	%o3,	%l1,	%o1
	alignaddrl	%o4,	%l0,	%i6
	edge16	%g6,	%o2,	%i0
	st	%f14,	[%l7 + 0x38]
	ld	[%l7 + 0x48],	%f5
	alignaddr	%i5,	%l3,	%l4
	sdivx	%g5,	0x068C,	%o6
	fcmpes	%fcc1,	%f23,	%f19
	ldsb	[%l7 + 0x45],	%g3
	or	%o7,	%i4,	%g7
	fzeros	%f23
	addc	%l5,	%g4,	%l6
	subc	%i2,	0x0F61,	%l2
	or	%g1,	%i7,	%o0
	mulx	%i3,	0x0A3C,	%g2
	movg	%xcc,	%i1,	%o5
	movl	%xcc,	%o3,	%o1
	movge	%xcc,	%l1,	%o4
	sub	%l0,	0x1074,	%g6
	ldsh	[%l7 + 0x70],	%i6
	addccc	%i0,	%o2,	%l3
	sub	%i5,	0x1833,	%l4
	edge8ln	%g5,	%g3,	%o6
	movcc	%icc,	%o7,	%g7
	sra	%i4,	%g4,	%l5
	fpadd16	%f18,	%f0,	%f10
	st	%f6,	[%l7 + 0x14]
	ldx	[%l7 + 0x48],	%i2
	mova	%icc,	%l2,	%g1
	fmovsl	%icc,	%f18,	%f6
	smulcc	%i7,	0x1C06,	%l6
	movcs	%xcc,	%i3,	%g2
	movcc	%icc,	%i1,	%o0
	movl	%icc,	%o3,	%o1
	fnors	%f14,	%f27,	%f18
	movleu	%xcc,	%o5,	%o4
	andn	%l1,	%g6,	%l0
	fcmple32	%f18,	%f16,	%i0
	fmovdg	%icc,	%f20,	%f2
	movgu	%icc,	%o2,	%i6
	udivcc	%i5,	0x02C1,	%l4
	array8	%l3,	%g3,	%o6
	alignaddr	%g5,	%g7,	%i4
	xnor	%o7,	0x1EC4,	%g4
	fnors	%f28,	%f31,	%f10
	orncc	%l5,	0x1AC4,	%i2
	fmovrdlz	%g1,	%f14,	%f10
	stb	%i7,	[%l7 + 0x26]
	edge16n	%l2,	%i3,	%g2
	fmovsneg	%icc,	%f21,	%f14
	add	%i1,	0x1171,	%o0
	move	%icc,	%o3,	%l6
	movrgez	%o1,	0x036,	%o4
	fmovsneg	%xcc,	%f11,	%f29
	edge8n	%o5,	%l1,	%g6
	ldd	[%l7 + 0x20],	%f10
	movne	%icc,	%i0,	%o2
	ldd	[%l7 + 0x50],	%f24
	fmul8x16al	%f9,	%f20,	%f30
	or	%i6,	%l0,	%i5
	movn	%xcc,	%l4,	%l3
	or	%g3,	%o6,	%g7
	umul	%g5,	%i4,	%o7
	subc	%g4,	0x098B,	%l5
	and	%g1,	%i2,	%l2
	fmovrde	%i3,	%f0,	%f22
	stw	%g2,	[%l7 + 0x40]
	move	%icc,	%i7,	%o0
	movleu	%icc,	%i1,	%l6
	ldub	[%l7 + 0x3D],	%o3
	subc	%o4,	0x1548,	%o1
	fcmple16	%f26,	%f0,	%l1
	ldd	[%l7 + 0x18],	%g6
	edge8n	%o5,	%i0,	%i6
	fmuld8ulx16	%f8,	%f12,	%f26
	edge32ln	%l0,	%o2,	%l4
	ldsh	[%l7 + 0x50],	%i5
	subcc	%g3,	%l3,	%g7
	movrgez	%g5,	%o6,	%o7
	sdiv	%i4,	0x0801,	%g4
	fmul8x16al	%f20,	%f17,	%f4
	movg	%xcc,	%l5,	%i2
	movrgz	%g1,	%i3,	%l2
	subcc	%i7,	%g2,	%i1
	stb	%l6,	[%l7 + 0x58]
	fmul8sux16	%f14,	%f26,	%f10
	fone	%f24
	fcmpgt32	%f10,	%f22,	%o0
	fmovrsne	%o4,	%f0,	%f31
	fsrc1	%f16,	%f12
	nop
	set	0x4A, %i4
	sth	%o3,	[%l7 + %i4]
	lduw	[%l7 + 0x2C],	%o1
	ldd	[%l7 + 0x70],	%f12
	xorcc	%g6,	0x157E,	%o5
	nop
	set	0x66, %i3
	stb	%l1,	[%l7 + %i3]
	sth	%i6,	[%l7 + 0x3C]
	fmovsne	%icc,	%f24,	%f8
	udivcc	%i0,	0x12FA,	%l0
	edge16n	%o2,	%i5,	%g3
	subc	%l3,	%l4,	%g5
	fpsub16	%f26,	%f12,	%f28
	orncc	%g7,	%o7,	%o6
	lduw	[%l7 + 0x34],	%i4
	st	%f6,	[%l7 + 0x54]
	ldsw	[%l7 + 0x58],	%g4
	udivcc	%l5,	0x128B,	%i2
	faligndata	%f0,	%f26,	%f16
	bshuffle	%f8,	%f10,	%f30
	sethi	0x128E,	%g1
	ldsb	[%l7 + 0x52],	%l2
	mulscc	%i3,	%i7,	%g2
	movge	%xcc,	%i1,	%l6
	fnot1s	%f18,	%f23
	stx	%o4,	[%l7 + 0x50]
	array8	%o3,	%o1,	%g6
	orcc	%o0,	%o5,	%l1
	ldsh	[%l7 + 0x76],	%i6
	fandnot1s	%f3,	%f5,	%f27
	fandnot2	%f8,	%f22,	%f10
	fmovsg	%xcc,	%f0,	%f25
	movrgez	%i0,	%o2,	%l0
	umulcc	%g3,	0x0150,	%i5
	fmovrsgz	%l3,	%f4,	%f25
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	movpos	%icc,	%o7,	%o6
	umul	%i4,	0x058B,	%g4
	movvs	%icc,	%g7,	%l5
	nop
	set	0x72, %g1
	ldub	[%l7 + %g1],	%g1
	xor	%i2,	0x0CC0,	%i3
	movn	%icc,	%l2,	%i7
	fzeros	%f14
	and	%g2,	%i1,	%o4
	smulcc	%o3,	%o1,	%g6
	fpsub32s	%f30,	%f28,	%f30
	stx	%l6,	[%l7 + 0x70]
	std	%f6,	[%l7 + 0x70]
	save %o0, 0x1920, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i6,	%i0
	ldsw	[%l7 + 0x54],	%l1
	movpos	%xcc,	%o2,	%l0
	pdist	%f2,	%f10,	%f8
	ldd	[%l7 + 0x78],	%i4
	array16	%g3,	%l3,	%g5
	stw	%o7,	[%l7 + 0x30]
	stw	%o6,	[%l7 + 0x48]
	stb	%i4,	[%l7 + 0x3F]
	lduw	[%l7 + 0x40],	%g4
	movvc	%xcc,	%g7,	%l5
	array16	%g1,	%l4,	%i2
	subc	%i3,	%l2,	%g2
	smulcc	%i1,	0x1394,	%o4
	st	%f25,	[%l7 + 0x74]
	fmovsvc	%xcc,	%f9,	%f12
	xor	%i7,	0x1412,	%o1
	save %o3, 0x1B06, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o0,	[%l7 + 0x0E]
	movn	%icc,	%o5,	%i6
	save %i0, 0x02AB, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o2,	%l1,	%i5
	edge16ln	%g3,	%l0,	%l3
	fmovdgu	%xcc,	%f26,	%f0
	andn	%o7,	0x0D1D,	%o6
	movl	%icc,	%i4,	%g4
	movrlz	%g7,	%g5,	%g1
	alignaddrl	%l5,	%i2,	%i3
	array32	%l4,	%g2,	%i1
	movge	%icc,	%o4,	%i7
	orcc	%o1,	%o3,	%l2
	alignaddr	%l6,	%o5,	%i6
	fnand	%f8,	%f18,	%f14
	edge8l	%o0,	%g6,	%i0
	xnorcc	%l1,	%o2,	%g3
	edge8l	%i5,	%l0,	%l3
	lduw	[%l7 + 0x70],	%o7
	movg	%icc,	%i4,	%g4
	andcc	%o6,	%g5,	%g7
	fxnor	%f22,	%f4,	%f10
	subc	%g1,	%l5,	%i2
	stx	%i3,	[%l7 + 0x60]
	subcc	%g2,	%i1,	%l4
	add	%o4,	0x19DA,	%o1
	fmovdneg	%icc,	%f19,	%f22
	andcc	%o3,	%i7,	%l6
	sdivx	%l2,	0x1878,	%i6
	udivx	%o5,	0x05FE,	%g6
	edge16ln	%o0,	%i0,	%l1
	movrgz	%g3,	0x1FF,	%i5
	movrlz	%o2,	%l3,	%l0
	movrlez	%o7,	%g4,	%o6
	fmovrdgz	%g5,	%f28,	%f16
	ldd	[%l7 + 0x20],	%f18
	mulscc	%i4,	0x03EC,	%g1
	sdivx	%l5,	0x1CE2,	%i2
	movl	%icc,	%i3,	%g7
	umulcc	%i1,	0x0133,	%g2
	fcmple32	%f20,	%f28,	%l4
	srax	%o4,	0x0A,	%o1
	movle	%xcc,	%o3,	%i7
	ld	[%l7 + 0x08],	%f31
	movvc	%icc,	%l6,	%l2
	subc	%i6,	0x1749,	%o5
	fcmpeq32	%f4,	%f14,	%o0
	addccc	%i0,	%g6,	%g3
	fmovdne	%xcc,	%f8,	%f20
	edge8ln	%i5,	%o2,	%l1
	orn	%l3,	0x13BF,	%l0
	mova	%xcc,	%g4,	%o6
	st	%f6,	[%l7 + 0x78]
	movrne	%o7,	%g5,	%g1
	fmul8x16au	%f6,	%f27,	%f4
	umulcc	%i4,	%l5,	%i2
	sdivcc	%g7,	0x1D56,	%i3
	popc	0x14CE,	%g2
	fpmerge	%f7,	%f0,	%f16
	movcs	%icc,	%i1,	%l4
	fmovse	%xcc,	%f4,	%f3
	movg	%xcc,	%o4,	%o1
	edge16l	%i7,	%o3,	%l6
	fmovrslz	%l2,	%f24,	%f10
	fmovsne	%icc,	%f7,	%f25
	subcc	%i6,	%o0,	%i0
	restore %g6, %o5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%i5,	%f0,	%f8
	or	%l1,	%l3,	%o2
	fone	%f14
	fmovdle	%xcc,	%f16,	%f4
	andn	%l0,	0x13A0,	%o6
	xnorcc	%g4,	%o7,	%g1
	fmovrdne	%i4,	%f30,	%f22
	sdivx	%g5,	0x0474,	%i2
	sir	0x164C
	movge	%xcc,	%g7,	%i3
	movgu	%xcc,	%g2,	%l5
	edge16l	%i1,	%l4,	%o4
	nop
	set	0x1A, %g3
	lduh	[%l7 + %g3],	%o1
	fcmpeq16	%f14,	%f12,	%i7
	xnorcc	%l6,	%l2,	%o3
	add	%o0,	0x09D3,	%i0
	movn	%xcc,	%g6,	%o5
	movrlz	%i6,	0x1CB,	%i5
	srlx	%g3,	0x10,	%l3
	mulscc	%l1,	0x0E2B,	%l0
	nop
	set	0x52, %g2
	lduh	[%l7 + %g2],	%o2
	ldub	[%l7 + 0x5F],	%o6
	subccc	%o7,	0x13D3,	%g4
	addccc	%i4,	0x0BA6,	%g5
	sth	%i2,	[%l7 + 0x68]
	sdivx	%g7,	0x183E,	%g1
	edge16l	%i3,	%l5,	%i1
	smulcc	%l4,	%o4,	%g2
	ld	[%l7 + 0x74],	%f25
	srax	%o1,	%i7,	%l2
	array32	%l6,	%o3,	%o0
	udiv	%g6,	0x1D21,	%i0
	addc	%o5,	0x1471,	%i5
	pdist	%f2,	%f10,	%f16
	alignaddrl	%g3,	%i6,	%l1
	movre	%l0,	0x019,	%o2
	edge16n	%o6,	%o7,	%g4
	addcc	%i4,	%g5,	%i2
	xnorcc	%l3,	%g1,	%i3
	array16	%l5,	%g7,	%l4
	movrgz	%i1,	0x130,	%o4
	stb	%o1,	[%l7 + 0x52]
	fabss	%f11,	%f23
	movge	%icc,	%i7,	%g2
	std	%f22,	[%l7 + 0x40]
	fcmpd	%fcc3,	%f4,	%f14
	sth	%l2,	[%l7 + 0x38]
	fabsd	%f22,	%f4
	fones	%f25
	fmuld8sux16	%f10,	%f27,	%f12
	sdivcc	%o3,	0x1852,	%l6
	ldd	[%l7 + 0x50],	%o0
	addccc	%i0,	%o5,	%g6
	fpmerge	%f26,	%f29,	%f24
	edge32n	%i5,	%g3,	%i6
	srl	%l1,	%o2,	%o6
	move	%icc,	%l0,	%o7
	edge16ln	%i4,	%g5,	%i2
	subccc	%g4,	0x03F4,	%g1
	edge16n	%l3,	%i3,	%g7
	nop
	set	0x44, %i0
	stw	%l5,	[%l7 + %i0]
	movgu	%xcc,	%i1,	%l4
	fpsub32s	%f8,	%f29,	%f27
	edge16	%o1,	%i7,	%o4
	fmovrdgez	%l2,	%f4,	%f28
	fand	%f22,	%f24,	%f8
	stb	%o3,	[%l7 + 0x20]
	ldub	[%l7 + 0x5A],	%l6
	fmovdg	%xcc,	%f20,	%f23
	fmovrdne	%g2,	%f22,	%f26
	array32	%i0,	%o0,	%g6
	fsrc1	%f30,	%f2
	stx	%o5,	[%l7 + 0x28]
	array32	%g3,	%i6,	%l1
	movcc	%icc,	%i5,	%o2
	movrgez	%o6,	0x061,	%o7
	movrgz	%i4,	0x2F4,	%g5
	subcc	%l0,	%i2,	%g1
	udiv	%l3,	0x1704,	%g4
	movrgez	%g7,	%l5,	%i1
	stx	%i3,	[%l7 + 0x10]
	movne	%xcc,	%l4,	%i7
	movn	%icc,	%o1,	%l2
	or	%o3,	%o4,	%l6
	movrgez	%g2,	0x096,	%o0
	udivcc	%i0,	0x1155,	%o5
	fcmpd	%fcc1,	%f14,	%f26
	smul	%g6,	%g3,	%l1
	subccc	%i5,	0x040C,	%o2
	subcc	%o6,	%i6,	%i4
	sth	%o7,	[%l7 + 0x3E]
	fmovrslz	%g5,	%f13,	%f27
	subc	%l0,	%i2,	%l3
	save %g4, 0x1E09, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l5,	%i1,	%i3
	mulscc	%l4,	0x027C,	%i7
	orncc	%o1,	%g1,	%l2
	fnors	%f11,	%f13,	%f20
	for	%f4,	%f30,	%f14
	fmovdgu	%icc,	%f31,	%f29
	movle	%xcc,	%o4,	%l6
	xnor	%g2,	%o0,	%o3
	subcc	%i0,	0x161F,	%g6
	faligndata	%f8,	%f16,	%f26
	fcmpgt16	%f8,	%f12,	%o5
	edge16l	%l1,	%i5,	%g3
	edge16ln	%o6,	%i6,	%i4
	movleu	%xcc,	%o7,	%o2
	fpack16	%f30,	%f5
	fcmpgt16	%f14,	%f2,	%l0
	st	%f14,	[%l7 + 0x24]
	movrlz	%g5,	%i2,	%g4
	fmovsgu	%xcc,	%f13,	%f18
	andn	%g7,	0x0B31,	%l3
	movpos	%icc,	%l5,	%i1
	andn	%i3,	0x0BF8,	%i7
	fandnot1	%f2,	%f8,	%f18
	fmovsa	%xcc,	%f13,	%f7
	xorcc	%l4,	%g1,	%l2
	movcc	%icc,	%o4,	%o1
	andn	%l6,	0x17D2,	%o0
	smulcc	%g2,	%i0,	%g6
	edge16l	%o5,	%o3,	%l1
	sll	%i5,	%o6,	%g3
	sdivx	%i4,	0x1FB4,	%o7
	xnorcc	%i6,	0x0627,	%o2
	popc	0x0670,	%g5
	stx	%i2,	[%l7 + 0x38]
	movcc	%icc,	%l0,	%g7
	fmovdgu	%icc,	%f3,	%f21
	fcmpne32	%f16,	%f26,	%g4
	alignaddr	%l5,	%l3,	%i3
	movrlz	%i7,	0x208,	%i1
	mova	%icc,	%g1,	%l4
	fmovsgu	%xcc,	%f21,	%f26
	addcc	%o4,	%o1,	%l2
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	srlx	%i0,	0x11,	%g2
	edge8n	%o5,	%o3,	%g6
	move	%xcc,	%i5,	%o6
	movg	%xcc,	%l1,	%i4
	ld	[%l7 + 0x78],	%f21
	fmovsneg	%xcc,	%f10,	%f31
	edge8n	%g3,	%i6,	%o7
	fnegs	%f21,	%f27
	umul	%o2,	0x08F8,	%g5
	lduw	[%l7 + 0x34],	%i2
	move	%icc,	%g7,	%l0
	edge16n	%l5,	%l3,	%g4
	movre	%i7,	0x3CE,	%i1
	smulcc	%i3,	0x17B7,	%l4
	sll	%g1,	%o4,	%l2
	stw	%o1,	[%l7 + 0x2C]
	restore %o0, 0x109F, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g2,	%l6,	%o3
	fmovsle	%xcc,	%f31,	%f23
	movleu	%icc,	%o5,	%i5
	lduw	[%l7 + 0x0C],	%g6
	stb	%o6,	[%l7 + 0x6E]
	fmovrslez	%l1,	%f23,	%f11
	pdist	%f28,	%f14,	%f26
	umulcc	%g3,	%i4,	%i6
	edge32	%o7,	%o2,	%g5
	srlx	%i2,	%l0,	%l5
	fmul8sux16	%f26,	%f16,	%f24
	xnorcc	%l3,	0x0DEA,	%g7
	fornot1s	%f16,	%f26,	%f30
	stb	%g4,	[%l7 + 0x0A]
	edge32ln	%i1,	%i7,	%i3
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	edge8l	%l2,	%o0,	%o1
	fmovsgu	%icc,	%f20,	%f20
	fcmped	%fcc1,	%f26,	%f0
	sll	%g2,	%i0,	%l6
	fone	%f6
	smulcc	%o3,	%i5,	%g6
	fmovsgu	%xcc,	%f26,	%f26
	movge	%xcc,	%o5,	%o6
	edge32l	%l1,	%i4,	%i6
	movn	%icc,	%o7,	%g3
	movrgez	%g5,	0x2C4,	%o2
	sdivx	%i2,	0x092B,	%l5
	sir	0x115E
	stb	%l0,	[%l7 + 0x52]
	fmul8ulx16	%f22,	%f14,	%f10
	nop
	set	0x08, %l5
	stx	%l3,	[%l7 + %l5]
	smulcc	%g7,	%i1,	%g4
	alignaddr	%i7,	%l4,	%o4
	andn	%g1,	%i3,	%l2
	orn	%o0,	%g2,	%o1
	fcmpgt16	%f14,	%f10,	%i0
	alignaddr	%o3,	%i5,	%l6
	fcmple32	%f2,	%f12,	%o5
	andn	%o6,	%g6,	%i4
	edge32ln	%l1,	%o7,	%i6
	fabsd	%f0,	%f20
	fmovdl	%icc,	%f30,	%f4
	ldsw	[%l7 + 0x68],	%g5
	fmovscc	%icc,	%f26,	%f10
	srax	%g3,	0x0A,	%o2
	fnot2s	%f16,	%f18
	movrgz	%i2,	0x3E8,	%l0
	mulx	%l5,	0x1C6F,	%g7
	orncc	%i1,	0x0353,	%l3
	move	%xcc,	%g4,	%i7
	fmovsleu	%icc,	%f18,	%f12
	umul	%o4,	0x1C6C,	%l4
	andn	%g1,	%l2,	%o0
	edge8l	%i3,	%g2,	%o1
	movre	%i0,	%o3,	%i5
	xor	%o5,	%l6,	%g6
	pdist	%f4,	%f24,	%f26
	movcc	%icc,	%i4,	%l1
	andncc	%o7,	%o6,	%g5
	movgu	%xcc,	%g3,	%o2
	fpsub32s	%f1,	%f14,	%f21
	movrgez	%i6,	%l0,	%i2
	addc	%l5,	%i1,	%l3
	movn	%xcc,	%g4,	%i7
	andcc	%g7,	0x1143,	%l4
	srlx	%g1,	%o4,	%l2
	edge8ln	%i3,	%g2,	%o1
	fand	%f24,	%f0,	%f22
	fmovdneg	%xcc,	%f17,	%f16
	std	%f8,	[%l7 + 0x50]
	smul	%i0,	%o0,	%i5
	movl	%icc,	%o5,	%l6
	sll	%g6,	0x15,	%o3
	sir	0x1C0C
	movcs	%icc,	%i4,	%l1
	andcc	%o7,	0x033A,	%o6
	mulscc	%g3,	%o2,	%g5
	fmovrde	%i6,	%f6,	%f8
	for	%f28,	%f18,	%f24
	restore %i2, %l5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l3,	%i1,	%g4
	sethi	0x1C89,	%g7
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	lduw	[%l7 + 0x4C],	%o4
	array32	%i3,	%l2,	%g2
	sdivx	%o1,	0x0FA9,	%i0
	ldd	[%l7 + 0x48],	%i4
	movneg	%xcc,	%o5,	%o0
	edge32ln	%l6,	%o3,	%i4
	edge16ln	%g6,	%l1,	%o6
	sll	%g3,	%o2,	%g5
	ldsh	[%l7 + 0x16],	%i6
	array32	%o7,	%l5,	%i2
	movcc	%icc,	%l0,	%l3
	fxors	%f17,	%f26,	%f20
	edge32l	%i1,	%g7,	%g4
	xor	%i7,	%l4,	%o4
	orn	%g1,	0x0959,	%i3
	fpack32	%f30,	%f6,	%f4
	stx	%g2,	[%l7 + 0x18]
	array16	%l2,	%o1,	%i5
	edge16	%o5,	%o0,	%i0
	udivx	%l6,	0x1F91,	%i4
	movre	%o3,	0x3AD,	%g6
	edge32ln	%l1,	%o6,	%o2
	andcc	%g5,	%i6,	%g3
	stx	%o7,	[%l7 + 0x10]
	stx	%i2,	[%l7 + 0x18]
	fxnors	%f11,	%f7,	%f29
	movrgez	%l0,	%l3,	%l5
	umul	%g7,	%g4,	%i1
	edge16l	%i7,	%o4,	%l4
	movre	%i3,	%g2,	%l2
	ldsh	[%l7 + 0x3A],	%g1
	srlx	%o1,	0x10,	%i5
	fcmpeq32	%f2,	%f14,	%o0
	ldsh	[%l7 + 0x3A],	%i0
	add	%l6,	0x0475,	%o5
	movrlz	%i4,	0x312,	%g6
	fmovrdgez	%l1,	%f4,	%f20
	fmovsneg	%icc,	%f23,	%f12
	fmovrsne	%o3,	%f5,	%f11
	fcmpne32	%f12,	%f4,	%o2
	fmovsne	%xcc,	%f11,	%f15
	save %o6, %g5, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g3,	0x0BBE,	%o7
	movrlez	%i2,	0x39E,	%l0
	edge8	%l3,	%g7,	%g4
	edge16l	%i1,	%l5,	%i7
	ld	[%l7 + 0x08],	%f25
	stb	%o4,	[%l7 + 0x39]
	fmovsvc	%xcc,	%f1,	%f2
	std	%f4,	[%l7 + 0x38]
	edge32n	%l4,	%i3,	%l2
	fcmps	%fcc3,	%f11,	%f8
	fands	%f6,	%f5,	%f23
	sir	0x1E4C
	movleu	%xcc,	%g1,	%o1
	movneg	%xcc,	%g2,	%o0
	fpsub16s	%f24,	%f7,	%f31
	umul	%i5,	%l6,	%o5
	edge8n	%i0,	%g6,	%l1
	fabsd	%f28,	%f6
	edge8n	%i4,	%o2,	%o6
	mulx	%o3,	%g5,	%i6
	fabss	%f22,	%f6
	xor	%o7,	%g3,	%i2
	edge8n	%l0,	%l3,	%g4
	mulx	%g7,	%i1,	%i7
	edge8l	%l5,	%o4,	%i3
	array16	%l2,	%l4,	%o1
	movvc	%icc,	%g2,	%o0
	fmovsvs	%icc,	%f13,	%f5
	smul	%i5,	0x1FA0,	%l6
	orncc	%o5,	%g1,	%i0
	udivx	%l1,	0x110A,	%i4
	fmovrslz	%o2,	%f25,	%f28
	fmuld8sux16	%f27,	%f3,	%f0
	udivx	%g6,	0x1B3F,	%o3
	sllx	%o6,	%g5,	%i6
	sdivcc	%g3,	0x08BF,	%i2
	add	%l0,	0x0318,	%l3
	add	%o7,	0x1C7B,	%g7
	ldsh	[%l7 + 0x30],	%g4
	fornot1s	%f6,	%f9,	%f16
	save %i7, %i1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%l5
	fornot1	%f2,	%f8,	%f28
	std	%f2,	[%l7 + 0x50]
	ldub	[%l7 + 0x0E],	%i3
	fornot1	%f18,	%f12,	%f26
	move	%xcc,	%l4,	%o1
	sllx	%g2,	%l2,	%o0
	movpos	%xcc,	%l6,	%i5
	movne	%xcc,	%o5,	%g1
	addccc	%i0,	0x1998,	%l1
	sir	0x062E
	and	%i4,	%g6,	%o2
	edge32n	%o3,	%o6,	%i6
	udivcc	%g3,	0x1154,	%g5
	xnor	%i2,	0x0947,	%l3
	array32	%l0,	%g7,	%o7
	and	%g4,	0x117B,	%i1
	ldd	[%l7 + 0x78],	%o4
	ldx	[%l7 + 0x10],	%i7
	array8	%i3,	%l4,	%l5
	popc	%o1,	%l2
	fmul8sux16	%f6,	%f4,	%f26
	sth	%o0,	[%l7 + 0x0E]
	stw	%g2,	[%l7 + 0x14]
	subc	%i5,	0x0515,	%l6
	sll	%o5,	%i0,	%g1
	sra	%l1,	%g6,	%o2
	stx	%i4,	[%l7 + 0x60]
	alignaddr	%o6,	%o3,	%i6
	movrne	%g5,	0x15E,	%g3
	smulcc	%l3,	%l0,	%i2
	movre	%g7,	0x0F6,	%o7
	srlx	%i1,	0x0B,	%o4
	ldd	[%l7 + 0x68],	%f16
	stb	%g4,	[%l7 + 0x0A]
	fmovrdne	%i7,	%f16,	%f8
	xnorcc	%i3,	%l4,	%l5
	fmul8ulx16	%f20,	%f12,	%f12
	movl	%xcc,	%l2,	%o1
	movrgez	%g2,	0x0B0,	%i5
	sdivx	%l6,	0x0473,	%o5
	save %i0, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%icc,	%f19,	%f0
	edge8	%l1,	%g6,	%i4
	fmul8ulx16	%f10,	%f18,	%f8
	ldd	[%l7 + 0x58],	%f2
	fmovdne	%icc,	%f9,	%f22
	fmovrslz	%o6,	%f21,	%f1
	orn	%o2,	%o3,	%g5
	std	%f26,	[%l7 + 0x48]
	ldub	[%l7 + 0x24],	%i6
	nop
	set	0x08, %l2
	lduh	[%l7 + %l2],	%l3
	ldub	[%l7 + 0x2C],	%g3
	xnorcc	%i2,	0x1E8E,	%l0
	movre	%o7,	0x3D2,	%g7
	udivx	%i1,	0x053F,	%g4
	sllx	%o4,	0x0B,	%i7
	udivx	%l4,	0x1EE2,	%i3
	fnand	%f20,	%f4,	%f24
	fmovsleu	%xcc,	%f24,	%f10
	udivx	%l5,	0x06B4,	%l2
	stb	%o1,	[%l7 + 0x19]
	fmovsleu	%icc,	%f17,	%f9
	ldsh	[%l7 + 0x1E],	%i5
	sdiv	%l6,	0x0246,	%g2
	fnegs	%f24,	%f6
	ldsb	[%l7 + 0x62],	%i0
	xorcc	%o5,	0x02D0,	%g1
	mulx	%l1,	0x195A,	%g6
	nop
	set	0x59, %l3
	stb	%i4,	[%l7 + %l3]
	udiv	%o0,	0x17EF,	%o2
	fmovs	%f31,	%f14
	fmovsne	%xcc,	%f25,	%f30
	alignaddr	%o6,	%g5,	%o3
	fmovd	%f26,	%f8
	umulcc	%l3,	%g3,	%i2
	ld	[%l7 + 0x14],	%f18
	addc	%i6,	%o7,	%g7
	faligndata	%f14,	%f2,	%f22
	st	%f0,	[%l7 + 0x30]
	movrlz	%i1,	%g4,	%l0
	fsrc2s	%f2,	%f1
	udivcc	%o4,	0x1835,	%i7
	nop
	set	0x28, %i7
	ldx	[%l7 + %i7],	%i3
	stw	%l5,	[%l7 + 0x40]
	ldsh	[%l7 + 0x56],	%l2
	fnot2	%f18,	%f2
	mulx	%l4,	0x1F8D,	%i5
	alignaddr	%l6,	%g2,	%i0
	stb	%o5,	[%l7 + 0x22]
	mulscc	%g1,	%l1,	%o1
	movle	%xcc,	%i4,	%g6
	edge16ln	%o0,	%o6,	%g5
	movg	%icc,	%o2,	%l3
	ldsb	[%l7 + 0x47],	%g3
	andn	%i2,	%i6,	%o3
	sll	%g7,	0x1B,	%i1
	srl	%g4,	0x18,	%l0
	fandnot1	%f2,	%f20,	%f0
	ldub	[%l7 + 0x41],	%o4
	movle	%icc,	%o7,	%i7
	udiv	%l5,	0x0620,	%i3
	std	%f28,	[%l7 + 0x18]
	movrlez	%l4,	%l2,	%i5
	mova	%xcc,	%l6,	%g2
	ldd	[%l7 + 0x18],	%f10
	edge8ln	%o5,	%i0,	%l1
	ldub	[%l7 + 0x6C],	%g1
	udivcc	%i4,	0x11EC,	%g6
	umul	%o1,	%o0,	%o6
	ldsb	[%l7 + 0x30],	%g5
	fcmple32	%f10,	%f26,	%l3
	addccc	%g3,	%i2,	%o2
	siam	0x1
	fmovsl	%xcc,	%f24,	%f3
	edge32	%o3,	%g7,	%i1
	fzero	%f26
	edge32	%i6,	%g4,	%l0
	movrgz	%o7,	%i7,	%o4
	movge	%icc,	%l5,	%i3
	movleu	%icc,	%l2,	%l4
	sth	%i5,	[%l7 + 0x24]
	fcmple16	%f22,	%f0,	%g2
	fmovdl	%icc,	%f31,	%f15
	sethi	0x1667,	%o5
	andn	%i0,	0x0C0E,	%l6
	fmovdneg	%xcc,	%f16,	%f13
	alignaddrl	%g1,	%l1,	%g6
	edge16	%i4,	%o0,	%o6
	edge32l	%g5,	%l3,	%o1
	subc	%g3,	0x1D5E,	%i2
	movrlz	%o2,	0x3E2,	%o3
	restore %i1, 0x057A, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g7,	%g4,	%o7
	ld	[%l7 + 0x2C],	%f12
	array32	%l0,	%o4,	%i7
	sub	%i3,	0x17CE,	%l5
	edge32n	%l2,	%i5,	%l4
	xnorcc	%o5,	0x025C,	%i0
	edge8n	%l6,	%g2,	%l1
	sdivcc	%g1,	0x0ECF,	%i4
	movcc	%xcc,	%g6,	%o6
	fzero	%f18
	array16	%g5,	%l3,	%o0
	fcmpes	%fcc1,	%f7,	%f14
	sub	%g3,	0x1D7E,	%o1
	fnand	%f26,	%f6,	%f4
	edge8	%o2,	%o3,	%i1
	array8	%i2,	%g7,	%i6
	movl	%xcc,	%o7,	%g4
	movleu	%icc,	%o4,	%i7
	fmovd	%f16,	%f14
	orn	%l0,	%l5,	%l2
	movrlez	%i3,	%i5,	%l4
	edge8	%i0,	%o5,	%g2
	movn	%xcc,	%l1,	%g1
	movrne	%l6,	%i4,	%o6
	st	%f17,	[%l7 + 0x64]
	movgu	%xcc,	%g5,	%g6
	fmovrdlez	%l3,	%f0,	%f12
	edge16l	%o0,	%o1,	%o2
	ldub	[%l7 + 0x3A],	%o3
	srlx	%g3,	0x0A,	%i1
	edge8n	%g7,	%i6,	%i2
	srl	%g4,	0x1A,	%o4
	fxor	%f10,	%f30,	%f10
	fmovrslz	%i7,	%f3,	%f26
	movleu	%xcc,	%l0,	%l5
	subc	%o7,	0x0508,	%i3
	fandnot1s	%f27,	%f3,	%f1
	fpadd32s	%f7,	%f27,	%f21
	movleu	%icc,	%l2,	%l4
	sth	%i5,	[%l7 + 0x0A]
	movrlz	%i0,	0x0C9,	%g2
	fzeros	%f11
	umul	%o5,	%l1,	%l6
	fmovrse	%i4,	%f28,	%f19
	movcc	%xcc,	%o6,	%g1
	fmovdle	%xcc,	%f28,	%f15
	nop
	set	0x30, %i1
	ldx	[%l7 + %i1],	%g5
	xor	%l3,	%o0,	%g6
	lduw	[%l7 + 0x30],	%o1
	orn	%o3,	%g3,	%o2
	movrgz	%g7,	0x253,	%i6
	popc	%i2,	%g4
	srax	%i1,	0x08,	%i7
	fmovrdlez	%l0,	%f16,	%f20
	fmovrsgz	%l5,	%f25,	%f12
	fcmple16	%f4,	%f22,	%o7
	movrne	%i3,	0x12C,	%o4
	movvs	%icc,	%l4,	%i5
	srax	%i0,	%l2,	%o5
	edge8ln	%g2,	%l6,	%i4
	and	%o6,	%g1,	%l1
	udivcc	%g5,	0x093B,	%o0
	fnand	%f10,	%f2,	%f16
	fmovrdlez	%l3,	%f6,	%f30
	movg	%icc,	%g6,	%o3
	sdivcc	%g3,	0x0A63,	%o1
	orncc	%g7,	0x18D4,	%o2
	stx	%i6,	[%l7 + 0x18]
	lduw	[%l7 + 0x64],	%i2
	orcc	%i1,	0x08EC,	%g4
	and	%l0,	0x1044,	%l5
	alignaddrl	%o7,	%i7,	%o4
	movrne	%l4,	0x0D5,	%i5
	mova	%xcc,	%i0,	%i3
	sllx	%o5,	0x1E,	%l2
	andcc	%l6,	0x0FA7,	%g2
	movcc	%xcc,	%i4,	%g1
	subc	%l1,	%o6,	%o0
	sdiv	%g5,	0x0C7B,	%l3
	sub	%o3,	%g6,	%g3
	edge16l	%g7,	%o1,	%i6
	sdivx	%i2,	0x03FA,	%i1
	fmul8sux16	%f24,	%f12,	%f6
	st	%f1,	[%l7 + 0x08]
	fcmpes	%fcc0,	%f16,	%f25
	movvc	%icc,	%g4,	%l0
	alignaddrl	%o2,	%o7,	%l5
	edge32l	%i7,	%l4,	%o4
	array16	%i0,	%i5,	%o5
	ldd	[%l7 + 0x68],	%f12
	movrgz	%l2,	%l6,	%i3
	stx	%i4,	[%l7 + 0x10]
	fmovsvs	%icc,	%f0,	%f0
	movpos	%icc,	%g1,	%l1
	sub	%g2,	0x044E,	%o6
	edge32l	%g5,	%l3,	%o3
	edge32n	%o0,	%g3,	%g6
	fcmpeq32	%f14,	%f30,	%g7
	ld	[%l7 + 0x14],	%f24
	xor	%i6,	%i2,	%o1
	stw	%i1,	[%l7 + 0x08]
	fmovrslez	%l0,	%f13,	%f26
	popc	0x00B4,	%o2
	sdiv	%o7,	0x12F4,	%g4
	sdivx	%i7,	0x0454,	%l5
	array32	%l4,	%i0,	%i5
	srl	%o4,	0x17,	%o5
	sir	0x0976
	edge16ln	%l2,	%l6,	%i4
	lduh	[%l7 + 0x3C],	%g1
	edge32n	%i3,	%g2,	%l1
	fmul8sux16	%f4,	%f28,	%f20
	xorcc	%g5,	%l3,	%o3
	stw	%o0,	[%l7 + 0x14]
	movcc	%icc,	%g3,	%o6
	fcmps	%fcc1,	%f18,	%f9
	fmovdneg	%xcc,	%f18,	%f11
	sllx	%g6,	%i6,	%i2
	movrlez	%o1,	%i1,	%g7
	edge16l	%o2,	%o7,	%g4
	orcc	%l0,	0x1A46,	%i7
	lduw	[%l7 + 0x5C],	%l5
	umulcc	%l4,	0x11B9,	%i0
	movrlz	%i5,	0x3ED,	%o5
	addc	%l2,	0x189C,	%o4
	stx	%l6,	[%l7 + 0x30]
	fcmped	%fcc2,	%f4,	%f2
	movleu	%icc,	%g1,	%i3
	edge16l	%i4,	%g2,	%l1
	movge	%xcc,	%l3,	%g5
	ldd	[%l7 + 0x48],	%f6
	stw	%o0,	[%l7 + 0x08]
	fmul8ulx16	%f20,	%f8,	%f14
	nop
	set	0x20, %o7
	sth	%g3,	[%l7 + %o7]
	fmovdge	%icc,	%f26,	%f29
	ldsw	[%l7 + 0x44],	%o6
	lduh	[%l7 + 0x18],	%o3
	xor	%g6,	%i6,	%o1
	stx	%i2,	[%l7 + 0x48]
	mulx	%i1,	0x1B5E,	%o2
	fmovrdne	%o7,	%f18,	%f2
	subcc	%g7,	%l0,	%i7
	fzeros	%f4
	movne	%xcc,	%l5,	%l4
	pdist	%f28,	%f2,	%f10
	movl	%xcc,	%g4,	%i0
	smulcc	%i5,	0x1B6D,	%l2
	edge32	%o4,	%l6,	%g1
	fmovrde	%i3,	%f30,	%f18
	fmovsa	%xcc,	%f4,	%f24
	edge32ln	%o5,	%g2,	%i4
	sra	%l1,	0x1C,	%l3
	edge8n	%o0,	%g3,	%g5
	mulscc	%o3,	%g6,	%o6
	ldsw	[%l7 + 0x50],	%o1
	fnot2s	%f21,	%f11
	umul	%i2,	%i6,	%i1
	movle	%icc,	%o2,	%g7
	ldsw	[%l7 + 0x4C],	%l0
	fmovde	%xcc,	%f26,	%f24
	edge8n	%i7,	%l5,	%o7
	sir	0x1598
	andcc	%l4,	%i0,	%g4
	edge32	%i5,	%o4,	%l6
	st	%f31,	[%l7 + 0x4C]
	movrgez	%l2,	%i3,	%o5
	fmovsne	%xcc,	%f4,	%f29
	xor	%g1,	%g2,	%l1
	fxnors	%f10,	%f20,	%f15
	array8	%l3,	%i4,	%g3
	edge16l	%g5,	%o3,	%o0
	andcc	%g6,	0x02C1,	%o6
	sub	%o1,	%i6,	%i2
	move	%xcc,	%i1,	%g7
	fornot2s	%f5,	%f3,	%f19
	udivx	%o2,	0x01E8,	%l0
	fmovsvs	%xcc,	%f13,	%f13
	sdivx	%l5,	0x0C6E,	%o7
	stw	%l4,	[%l7 + 0x38]
	movne	%xcc,	%i7,	%i0
	addcc	%g4,	0x027B,	%i5
	xnor	%o4,	0x1596,	%l2
	srl	%i3,	%o5,	%l6
	nop
	set	0x60, %o4
	lduh	[%l7 + %o4],	%g2
	andncc	%g1,	%l3,	%l1
	edge32ln	%i4,	%g3,	%o3
	edge32ln	%g5,	%g6,	%o6
	move	%xcc,	%o0,	%o1
	fors	%f29,	%f1,	%f25
	umulcc	%i2,	0x009D,	%i6
	fmovrslz	%g7,	%f27,	%f3
	fpack16	%f28,	%f13
	add	%o2,	0x10F1,	%i1
	fmovsleu	%xcc,	%f2,	%f3
	array16	%l5,	%o7,	%l4
	lduw	[%l7 + 0x44],	%l0
	ldsb	[%l7 + 0x28],	%i7
	edge16	%i0,	%i5,	%g4
	movpos	%icc,	%l2,	%o4
	fnands	%f29,	%f30,	%f24
	movrne	%o5,	0x0B9,	%i3
	fmovdpos	%xcc,	%f28,	%f27
	ldd	[%l7 + 0x58],	%g2
	sth	%l6,	[%l7 + 0x76]
	andncc	%g1,	%l3,	%l1
	movrgez	%i4,	%o3,	%g5
	move	%xcc,	%g3,	%o6
	add	%o0,	0x1520,	%o1
	ldsw	[%l7 + 0x0C],	%g6
	movleu	%icc,	%i6,	%i2
	mova	%icc,	%o2,	%g7
	fnand	%f4,	%f8,	%f14
	umulcc	%l5,	%o7,	%l4
	ldub	[%l7 + 0x2D],	%i1
	edge8n	%i7,	%i0,	%l0
	sth	%i5,	[%l7 + 0x4C]
	movvc	%icc,	%l2,	%g4
	ldd	[%l7 + 0x58],	%o4
	add	%o4,	%i3,	%g2
	movrgz	%g1,	%l6,	%l3
	fmovrslez	%i4,	%f27,	%f31
	movle	%xcc,	%o3,	%g5
	movn	%xcc,	%l1,	%g3
	subccc	%o6,	%o0,	%o1
	udiv	%i6,	0x0BE8,	%i2
	mulx	%o2,	%g6,	%l5
	fmovdpos	%xcc,	%f24,	%f0
	movcc	%icc,	%g7,	%o7
	sth	%i1,	[%l7 + 0x64]
	fmovdge	%xcc,	%f31,	%f14
	std	%f2,	[%l7 + 0x60]
	fmovdne	%icc,	%f13,	%f23
	fmul8x16al	%f4,	%f18,	%f4
	srax	%l4,	%i7,	%i0
	movre	%l0,	%l2,	%i5
	ldsb	[%l7 + 0x58],	%o5
	orn	%o4,	%i3,	%g2
	sethi	0x169F,	%g1
	array8	%g4,	%l6,	%i4
	edge8	%l3,	%o3,	%g5
	movle	%xcc,	%g3,	%o6
	edge8ln	%o0,	%l1,	%i6
	addcc	%o1,	0x0C18,	%o2
	array8	%i2,	%l5,	%g7
	sth	%g6,	[%l7 + 0x5C]
	popc	0x000F,	%o7
	smul	%i1,	%i7,	%i0
	and	%l4,	%l0,	%l2
	fmul8x16	%f24,	%f14,	%f8
	fmovd	%f10,	%f0
	movvs	%icc,	%i5,	%o5
	orn	%i3,	0x05FF,	%g2
	movrgez	%g1,	%o4,	%l6
	udivx	%i4,	0x1BCC,	%g4
	move	%xcc,	%o3,	%g5
	orncc	%g3,	0x0D88,	%o6
	andncc	%o0,	%l3,	%l1
	movcs	%icc,	%o1,	%i6
	sdivcc	%o2,	0x01D8,	%l5
	xorcc	%i2,	0x074F,	%g7
	array8	%g6,	%i1,	%i7
	ldsh	[%l7 + 0x1E],	%i0
	fmovrdgez	%l4,	%f8,	%f18
	movcs	%icc,	%o7,	%l2
	fpadd32s	%f15,	%f20,	%f15
	or	%l0,	0x1DB3,	%i5
	fmovsvc	%xcc,	%f8,	%f31
	mulx	%o5,	%g2,	%g1
	addcc	%o4,	%i3,	%i4
	fmovsn	%xcc,	%f18,	%f2
	movcc	%icc,	%l6,	%g4
	edge16n	%g5,	%g3,	%o6
	popc	%o3,	%l3
	movge	%xcc,	%o0,	%o1
	movge	%xcc,	%i6,	%o2
	movne	%xcc,	%l1,	%i2
	orncc	%l5,	0x1FB8,	%g6
	edge32l	%i1,	%i7,	%g7
	fabss	%f18,	%f29
	orcc	%i0,	0x05AD,	%o7
	edge16l	%l4,	%l0,	%l2
	movge	%xcc,	%o5,	%i5
	edge16n	%g1,	%g2,	%i3
	ldx	[%l7 + 0x70],	%i4
	fmovsle	%xcc,	%f3,	%f8
	movre	%o4,	0x2F8,	%g4
	addccc	%l6,	0x093F,	%g3
	fcmpne16	%f8,	%f12,	%o6
	sdivcc	%g5,	0x0971,	%l3
	edge8ln	%o0,	%o1,	%o3
	stx	%o2,	[%l7 + 0x58]
	st	%f19,	[%l7 + 0x50]
	fxors	%f14,	%f1,	%f30
	movvc	%icc,	%l1,	%i2
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	ld	[%l7 + 0x18],	%f6
	fcmpne16	%f16,	%f6,	%l5
	edge32l	%i1,	%i7,	%g7
	smulcc	%i0,	0x1838,	%l4
	orn	%o7,	0x1DC7,	%l0
	fmul8x16au	%f22,	%f7,	%f16
	movg	%xcc,	%l2,	%i5
	edge16ln	%g1,	%o5,	%g2
	xorcc	%i3,	0x1D4F,	%i4
	xor	%o4,	0x1F1F,	%l6
	movrlz	%g3,	%g4,	%o6
	fmovdleu	%xcc,	%f10,	%f16
	fpadd32s	%f18,	%f29,	%f15
	add	%l3,	%o0,	%o1
	array32	%o3,	%g5,	%o2
	fmovrsne	%i2,	%f6,	%f28
	movrlez	%l1,	%g6,	%l5
	addcc	%i1,	0x1A8D,	%i7
	array32	%i6,	%i0,	%l4
	ldsh	[%l7 + 0x22],	%o7
	fmovrslez	%g7,	%f31,	%f2
	srax	%l0,	0x08,	%l2
	fpack32	%f30,	%f2,	%f26
	stb	%g1,	[%l7 + 0x35]
	xnor	%o5,	0x1F72,	%g2
	xor	%i5,	%i3,	%o4
	movcs	%xcc,	%i4,	%l6
	addc	%g4,	%g3,	%o6
	udivcc	%l3,	0x017C,	%o0
	srlx	%o3,	%o1,	%g5
	movvs	%icc,	%i2,	%o2
	stb	%g6,	[%l7 + 0x53]
	xnorcc	%l1,	0x051F,	%i1
	fmovsvc	%icc,	%f19,	%f8
	movleu	%xcc,	%i7,	%i6
	edge32ln	%l5,	%l4,	%i0
	ldd	[%l7 + 0x48],	%f22
	sll	%g7,	%o7,	%l2
	mulx	%g1,	0x148E,	%l0
	fmovscc	%xcc,	%f0,	%f5
	andn	%o5,	0x0AF7,	%i5
	fmovd	%f22,	%f18
	andcc	%g2,	0x19C6,	%o4
	fpsub16s	%f1,	%f22,	%f16
	array32	%i4,	%i3,	%l6
	orcc	%g4,	%g3,	%l3
	movg	%icc,	%o0,	%o3
	lduw	[%l7 + 0x44],	%o6
	and	%o1,	%g5,	%i2
	edge16ln	%g6,	%o2,	%i1
	umul	%l1,	%i6,	%i7
	fnegd	%f0,	%f24
	and	%l5,	0x142C,	%i0
	addccc	%g7,	%l4,	%l2
	orncc	%g1,	0x0A26,	%l0
	movre	%o7,	0x0D3,	%o5
	srax	%g2,	0x12,	%o4
	sethi	0x10E0,	%i5
	edge16	%i3,	%i4,	%l6
	mulscc	%g4,	0x036E,	%g3
	addccc	%o0,	%o3,	%l3
	fpsub32	%f28,	%f4,	%f16
	xnor	%o1,	0x148F,	%o6
	subc	%g5,	%i2,	%o2
	stw	%g6,	[%l7 + 0x54]
	fmovdn	%xcc,	%f31,	%f10
	sllx	%l1,	%i6,	%i7
	fmovdgu	%xcc,	%f29,	%f14
	movleu	%xcc,	%l5,	%i1
	addccc	%i0,	%g7,	%l2
	movleu	%icc,	%l4,	%l0
	fcmpgt32	%f16,	%f24,	%o7
	fmuld8ulx16	%f29,	%f7,	%f30
	movrlz	%o5,	0x167,	%g1
	srl	%o4,	%g2,	%i5
	mova	%xcc,	%i3,	%l6
	alignaddrl	%g4,	%i4,	%o0
	umulcc	%g3,	%o3,	%o1
	ldd	[%l7 + 0x38],	%f28
	edge8n	%o6,	%l3,	%g5
	subc	%i2,	%o2,	%l1
	stb	%i6,	[%l7 + 0x6F]
	mova	%icc,	%g6,	%i7
	fandnot2s	%f0,	%f3,	%f30
	andncc	%i1,	%i0,	%g7
	subc	%l5,	0x19C7,	%l4
	udiv	%l2,	0x071B,	%o7
	orncc	%o5,	%l0,	%g1
	fmovsleu	%icc,	%f31,	%f5
	move	%xcc,	%o4,	%g2
	lduh	[%l7 + 0x1A],	%i3
	fnand	%f8,	%f0,	%f14
	andncc	%l6,	%i5,	%g4
	ldd	[%l7 + 0x30],	%f18
	move	%icc,	%i4,	%g3
	fmovsn	%xcc,	%f5,	%f27
	sth	%o3,	[%l7 + 0x64]
	movg	%icc,	%o0,	%o1
	array32	%o6,	%l3,	%i2
	fpmerge	%f0,	%f14,	%f8
	ld	[%l7 + 0x6C],	%f16
	sdivcc	%g5,	0x126F,	%l1
	edge32n	%o2,	%i6,	%g6
	fnegs	%f13,	%f30
	fcmpne32	%f30,	%f26,	%i1
	andncc	%i7,	%i0,	%g7
	fandnot1s	%f29,	%f25,	%f14
	fmovrse	%l5,	%f18,	%f4
	sll	%l4,	0x12,	%o7
	edge8n	%o5,	%l0,	%g1
	movrgz	%l2,	%g2,	%o4
	ld	[%l7 + 0x78],	%f28
	addc	%i3,	0x1238,	%i5
	subccc	%l6,	0x0581,	%g4
	fnot2s	%f25,	%f13
	movrlz	%g3,	0x052,	%o3
	movrgez	%i4,	%o1,	%o0
	movg	%xcc,	%o6,	%l3
	xnorcc	%g5,	0x0A2B,	%l1
	fmovrslez	%i2,	%f3,	%f21
	movneg	%icc,	%o2,	%g6
	fcmpne16	%f20,	%f18,	%i6
	fmovda	%icc,	%f1,	%f10
	fmovrsne	%i7,	%f1,	%f3
	fmovsn	%icc,	%f26,	%f8
	xorcc	%i0,	0x1004,	%g7
	edge32ln	%l5,	%l4,	%i1
	edge32ln	%o7,	%o5,	%g1
	sra	%l0,	%l2,	%g2
	stx	%i3,	[%l7 + 0x50]
	orcc	%o4,	%i5,	%l6
	movrlez	%g4,	0x3DF,	%g3
	umulcc	%o3,	%i4,	%o1
	array16	%o6,	%l3,	%g5
	edge32n	%l1,	%o0,	%o2
	sra	%i2,	0x00,	%i6
	addc	%g6,	0x0DB2,	%i0
	edge8n	%g7,	%i7,	%l5
	orcc	%i1,	%l4,	%o5
	mulx	%o7,	%g1,	%l2
	movge	%icc,	%l0,	%g2
	movneg	%xcc,	%i3,	%i5
	fmuld8sux16	%f5,	%f12,	%f12
	fandnot1	%f4,	%f12,	%f0
	udiv	%o4,	0x19D3,	%g4
	alignaddr	%l6,	%g3,	%o3
	udivcc	%o1,	0x07E1,	%o6
	fcmpeq16	%f24,	%f18,	%i4
	fmovsleu	%xcc,	%f11,	%f10
	movle	%xcc,	%g5,	%l1
	edge8ln	%o0,	%l3,	%o2
	fcmple32	%f22,	%f20,	%i2
	movleu	%xcc,	%g6,	%i0
	movrgez	%g7,	0x041,	%i6
	fmovrdgez	%l5,	%f30,	%f30
	array8	%i1,	%i7,	%o5
	ldd	[%l7 + 0x60],	%f8
	umulcc	%l4,	0x154F,	%o7
	ldx	[%l7 + 0x58],	%l2
	add	%l0,	%g1,	%i3
	movne	%xcc,	%g2,	%i5
	movcc	%xcc,	%o4,	%g4
	fands	%f2,	%f7,	%f18
	movge	%icc,	%g3,	%o3
	subcc	%o1,	0x13C5,	%o6
	ldsw	[%l7 + 0x64],	%i4
	umulcc	%g5,	0x16D8,	%l6
	movne	%xcc,	%o0,	%l3
	xnorcc	%l1,	%o2,	%g6
	movrne	%i2,	0x0F1,	%i0
	edge32	%g7,	%i6,	%i1
	addccc	%l5,	%o5,	%l4
	movvs	%icc,	%o7,	%i7
	movrlez	%l2,	%g1,	%l0
	orncc	%i3,	%g2,	%i5
	lduh	[%l7 + 0x30],	%g4
	sll	%g3,	%o4,	%o1
	movpos	%icc,	%o3,	%o6
	sdivcc	%g5,	0x1DBD,	%l6
	edge32	%i4,	%o0,	%l3
	movcc	%icc,	%o2,	%g6
	andn	%l1,	0x19F4,	%i2
	sllx	%g7,	0x11,	%i6
	srax	%i1,	%i0,	%l5
	xor	%o5,	%l4,	%o7
	edge8	%l2,	%i7,	%g1
	subccc	%l0,	%i3,	%g2
	movneg	%icc,	%i5,	%g3
	orcc	%o4,	%o1,	%g4
	fmovdpos	%xcc,	%f26,	%f2
	fsrc1	%f2,	%f0
	xnor	%o3,	0x09B9,	%g5
	fmovdne	%icc,	%f23,	%f30
	or	%o6,	0x1496,	%l6
	fcmple32	%f2,	%f14,	%i4
	movrlz	%l3,	0x34C,	%o2
	edge32n	%o0,	%g6,	%l1
	alignaddrl	%g7,	%i2,	%i1
	edge32l	%i0,	%i6,	%l5
	udivx	%o5,	0x02FF,	%l4
	udivcc	%o7,	0x060A,	%l2
	and	%g1,	0x1A47,	%i7
	mulx	%i3,	%l0,	%i5
	umulcc	%g2,	%g3,	%o1
	stw	%g4,	[%l7 + 0x0C]
	subcc	%o4,	0x188F,	%o3
	save %o6, 0x1C20, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g5,	0x1662,	%l3
	fandnot2	%f22,	%f14,	%f24
	sub	%o2,	%o0,	%g6
	xnor	%l1,	0x05DC,	%i4
	ldsw	[%l7 + 0x7C],	%i2
	fmovsl	%icc,	%f1,	%f13
	ldsw	[%l7 + 0x6C],	%i1
	stx	%g7,	[%l7 + 0x38]
	sll	%i0,	%i6,	%l5
	sdivx	%o5,	0x156D,	%l4
	movl	%xcc,	%o7,	%l2
	stx	%g1,	[%l7 + 0x18]
	edge16ln	%i7,	%i3,	%l0
	movrne	%g2,	0x1F3,	%i5
	movpos	%icc,	%o1,	%g4
	ldub	[%l7 + 0x3E],	%o4
	ldx	[%l7 + 0x30],	%g3
	fmuld8ulx16	%f7,	%f16,	%f26
	edge8l	%o3,	%o6,	%l6
	fcmped	%fcc0,	%f14,	%f18
	addcc	%l3,	%o2,	%o0
	fcmpeq32	%f12,	%f16,	%g5
	fmovrslez	%l1,	%f31,	%f20
	sth	%i4,	[%l7 + 0x6C]
	fmovrsgez	%g6,	%f25,	%f22
	addccc	%i1,	%g7,	%i2
	ldsw	[%l7 + 0x44],	%i6
	andcc	%l5,	0x08B3,	%o5
	movne	%icc,	%l4,	%o7
	ldx	[%l7 + 0x50],	%i0
	srlx	%g1,	0x18,	%i7
	fmovdvs	%xcc,	%f31,	%f2
	movneg	%icc,	%i3,	%l0
	andn	%l2,	0x0C1B,	%i5
	ldsh	[%l7 + 0x0C],	%o1
	movrlz	%g4,	%g2,	%o4
	fnot1	%f22,	%f4
	stx	%o3,	[%l7 + 0x68]
	restore %g3, %l6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o2,	0x1990,	%l3
	sll	%g5,	0x14,	%o0
	fzeros	%f7
	udiv	%l1,	0x0EE9,	%g6
	fcmped	%fcc0,	%f30,	%f16
	movvc	%icc,	%i4,	%i1
	edge16ln	%i2,	%i6,	%g7
	subccc	%o5,	%l4,	%o7
	orcc	%i0,	0x1CBA,	%l5
	ldub	[%l7 + 0x6C],	%g1
	movge	%icc,	%i3,	%l0
	subcc	%l2,	%i7,	%o1
	std	%f2,	[%l7 + 0x38]
	sra	%g4,	%g2,	%o4
	popc	%i5,	%g3
	smul	%o3,	0x0A8E,	%o6
	fmovdcs	%xcc,	%f9,	%f3
	alignaddrl	%o2,	%l3,	%g5
	popc	%o0,	%l1
	movrlez	%g6,	0x0AB,	%l6
	fmovrdne	%i4,	%f12,	%f8
	fpadd32	%f12,	%f22,	%f0
	fmovsvc	%xcc,	%f9,	%f16
	edge16l	%i1,	%i2,	%i6
	ldsh	[%l7 + 0x60],	%g7
	movgu	%icc,	%o5,	%l4
	movne	%xcc,	%i0,	%o7
	sll	%g1,	0x00,	%l5
	sethi	0x15EE,	%l0
	fmul8x16al	%f30,	%f0,	%f0
	movleu	%icc,	%i3,	%l2
	fmovsg	%icc,	%f17,	%f11
	movg	%xcc,	%i7,	%o1
	movrne	%g2,	0x053,	%g4
	subccc	%o4,	%g3,	%o3
	edge16l	%o6,	%i5,	%o2
	std	%f10,	[%l7 + 0x70]
	and	%l3,	0x06A4,	%o0
	fmovsa	%xcc,	%f15,	%f24
	fmovdle	%icc,	%f29,	%f7
	fpackfix	%f12,	%f23
	srax	%g5,	0x1F,	%g6
	fmovdg	%icc,	%f23,	%f6
	andncc	%l6,	%l1,	%i1
	fsrc1s	%f4,	%f27
	movrlz	%i2,	%i4,	%g7
	add	%o5,	%l4,	%i0
	fzero	%f14
	edge8	%o7,	%g1,	%l5
	sra	%i6,	%i3,	%l2
	sllx	%i7,	0x11,	%l0
	srlx	%g2,	0x1A,	%o1
	movcs	%xcc,	%o4,	%g4
	fandnot1	%f2,	%f30,	%f16
	fmovspos	%xcc,	%f2,	%f29
	pdist	%f8,	%f28,	%f6
	fmovrdlz	%g3,	%f16,	%f4
	movne	%xcc,	%o3,	%o6
	andcc	%i5,	0x1683,	%o2
	edge16	%o0,	%l3,	%g6
	srl	%g5,	%l6,	%l1
	fmovsle	%xcc,	%f31,	%f15
	udivx	%i1,	0x098A,	%i2
	fcmpd	%fcc2,	%f28,	%f22
	fmovs	%f14,	%f14
	movn	%xcc,	%g7,	%i4
	mova	%icc,	%o5,	%l4
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	movcs	%icc,	%l5,	%i3
	add	%i6,	0x141E,	%i7
	edge16l	%l2,	%l0,	%g2
	fors	%f25,	%f5,	%f19
	fxors	%f29,	%f20,	%f25
	lduw	[%l7 + 0x44],	%o4
	movrgz	%g4,	0x108,	%o1
	edge8l	%g3,	%o6,	%i5
	for	%f0,	%f26,	%f2
	ld	[%l7 + 0x7C],	%f26
	edge32n	%o3,	%o0,	%o2
	movrne	%l3,	0x156,	%g6
	andn	%g5,	%l6,	%l1
	movrgez	%i2,	0x18C,	%i1
	alignaddr	%g7,	%i4,	%o5
	edge32l	%l4,	%g1,	%i0
	ldub	[%l7 + 0x69],	%o7
	fmovse	%icc,	%f1,	%f0
	stx	%l5,	[%l7 + 0x68]
	fpadd16	%f20,	%f8,	%f4
	udivx	%i6,	0x0DE6,	%i7
	stx	%l2,	[%l7 + 0x20]
	movneg	%icc,	%i3,	%g2
	sth	%l0,	[%l7 + 0x7A]
	movcc	%icc,	%g4,	%o4
	edge16l	%o1,	%g3,	%o6
	lduh	[%l7 + 0x7C],	%i5
	fmovsle	%icc,	%f24,	%f13
	nop
	set	0x28, %o6
	stx	%o3,	[%l7 + %o6]
	orn	%o2,	%o0,	%g6
	movcc	%xcc,	%g5,	%l3
	fmovscc	%xcc,	%f9,	%f8
	andcc	%l1,	%i2,	%l6
	fxnors	%f31,	%f3,	%f29
	fmul8x16au	%f1,	%f11,	%f30
	movcs	%icc,	%g7,	%i1
	srlx	%o5,	%l4,	%g1
	fpsub16s	%f8,	%f28,	%f3
	movre	%i4,	%o7,	%l5
	sllx	%i6,	%i7,	%l2
	stx	%i0,	[%l7 + 0x30]
	movrlez	%g2,	0x100,	%l0
	fnot1	%f10,	%f4
	mova	%xcc,	%g4,	%o4
	movcc	%xcc,	%o1,	%g3
	ldx	[%l7 + 0x38],	%o6
	edge16	%i3,	%o3,	%o2
	fsrc2s	%f9,	%f25
	movrne	%o0,	0x2DB,	%g6
	addcc	%i5,	0x1F04,	%g5
	array16	%l1,	%l3,	%i2
	fnegd	%f2,	%f4
	ldsh	[%l7 + 0x46],	%g7
	fmuld8ulx16	%f3,	%f17,	%f6
	sllx	%i1,	0x0F,	%l6
	sll	%o5,	%l4,	%i4
	ldsh	[%l7 + 0x4E],	%g1
	orn	%o7,	%l5,	%i7
	fpsub16s	%f4,	%f3,	%f31
	array32	%i6,	%l2,	%i0
	lduw	[%l7 + 0x3C],	%g2
	movn	%icc,	%l0,	%o4
	movrlez	%g4,	0x094,	%o1
	fmovdgu	%icc,	%f15,	%f8
	add	%o6,	0x18FE,	%i3
	smulcc	%g3,	0x18EF,	%o2
	subccc	%o3,	%o0,	%g6
	edge32n	%g5,	%i5,	%l3
	sra	%i2,	%g7,	%i1
	movcs	%xcc,	%l6,	%l1
	fmovrdne	%l4,	%f26,	%f10
	sdivcc	%o5,	0x0795,	%i4
	srl	%g1,	0x01,	%o7
	xnorcc	%i7,	%l5,	%i6
	fpmerge	%f0,	%f12,	%f2
	fnot2s	%f8,	%f18
	movg	%icc,	%l2,	%g2
	ldub	[%l7 + 0x1D],	%l0
	movg	%xcc,	%i0,	%o4
	andncc	%g4,	%o6,	%o1
	orncc	%g3,	0x0657,	%i3
	addccc	%o2,	%o0,	%o3
	movleu	%icc,	%g5,	%g6
	xorcc	%l3,	%i2,	%g7
	fmovdpos	%icc,	%f18,	%f13
	save %i1, %l6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i5,	0x1DD3,	%o5
	st	%f26,	[%l7 + 0x58]
	fmovdge	%icc,	%f0,	%f29
	fnot2	%f2,	%f18
	mulscc	%l4,	0x1F28,	%g1
	edge32l	%o7,	%i4,	%l5
	sth	%i6,	[%l7 + 0x34]
	movrlz	%i7,	%g2,	%l2
	movrgz	%i0,	0x08C,	%o4
	addcc	%l0,	0x08CE,	%o6
	srax	%g4,	%g3,	%i3
	movg	%icc,	%o1,	%o0
	fnot2s	%f11,	%f31
	nop
	set	0x6C, %o0
	lduw	[%l7 + %o0],	%o2
	st	%f14,	[%l7 + 0x44]
	udivcc	%g5,	0x0360,	%o3
	andcc	%l3,	0x06F1,	%i2
	edge8ln	%g6,	%i1,	%l6
	sllx	%l1,	0x0B,	%g7
	orncc	%i5,	%o5,	%g1
	fnegs	%f7,	%f3
	movcc	%icc,	%o7,	%l4
	umulcc	%l5,	%i6,	%i4
	edge16	%g2,	%l2,	%i7
	xor	%o4,	%l0,	%o6
	fmovsle	%xcc,	%f30,	%f1
	movvs	%xcc,	%g4,	%i0
	umulcc	%i3,	%o1,	%o0
	edge8ln	%g3,	%o2,	%g5
	addc	%o3,	0x1A6D,	%i2
	fcmpne32	%f22,	%f26,	%l3
	srlx	%i1,	%g6,	%l6
	fsrc1s	%f1,	%f15
	addc	%g7,	0x1F87,	%i5
	ldd	[%l7 + 0x48],	%l0
	fnors	%f26,	%f27,	%f29
	fabsd	%f4,	%f28
	xorcc	%o5,	0x19CF,	%o7
	fpackfix	%f18,	%f7
	mulx	%g1,	%l5,	%i6
	fcmpeq16	%f6,	%f28,	%l4
	srl	%g2,	0x14,	%l2
	xorcc	%i4,	%o4,	%i7
	alignaddr	%l0,	%o6,	%g4
	lduh	[%l7 + 0x1E],	%i0
	orcc	%i3,	%o0,	%o1
	sdivx	%g3,	0x1DB0,	%o2
	edge8	%g5,	%i2,	%o3
	movleu	%icc,	%i1,	%l3
	movpos	%xcc,	%l6,	%g7
	andcc	%i5,	%g6,	%o5
	ldsw	[%l7 + 0x0C],	%o7
	sra	%g1,	0x07,	%l1
	xorcc	%l5,	%l4,	%i6
	movrne	%l2,	0x214,	%g2
	addccc	%o4,	%i7,	%l0
	movre	%i4,	0x373,	%o6
	and	%g4,	%i3,	%i0
	mulscc	%o0,	%o1,	%o2
	st	%f6,	[%l7 + 0x5C]
	andn	%g5,	0x04B8,	%g3
	fmovsvs	%xcc,	%f27,	%f19
	movn	%xcc,	%o3,	%i1
	movrlez	%i2,	0x389,	%l3
	movneg	%xcc,	%l6,	%i5
	fxnors	%f12,	%f0,	%f10
	fmovdn	%icc,	%f22,	%f18
	edge8	%g6,	%g7,	%o7
	movg	%xcc,	%o5,	%g1
	edge16l	%l1,	%l4,	%i6
	edge32l	%l2,	%g2,	%l5
	fnegd	%f12,	%f14
	ldd	[%l7 + 0x70],	%f26
	fpadd16s	%f23,	%f13,	%f20
	fors	%f15,	%f24,	%f25
	xnorcc	%i7,	0x143A,	%l0
	ldsw	[%l7 + 0x50],	%i4
	andcc	%o6,	0x0DC5,	%g4
	movl	%xcc,	%i3,	%o4
	sdivx	%i0,	0x1A16,	%o1
	andncc	%o0,	%g5,	%g3
	orcc	%o3,	%o2,	%i1
	movcs	%icc,	%i2,	%l3
	fmovrse	%l6,	%f31,	%f20
	addccc	%i5,	0x0B25,	%g6
	sethi	0x11C6,	%o7
	fpack16	%f22,	%f13
	fmovrslez	%g7,	%f15,	%f28
	edge32l	%g1,	%o5,	%l4
	stb	%i6,	[%l7 + 0x6A]
	fmovsn	%icc,	%f3,	%f3
	ldd	[%l7 + 0x40],	%f18
	edge8n	%l2,	%g2,	%l1
	orncc	%i7,	%l5,	%l0
	srax	%i4,	%g4,	%o6
	edge16n	%i3,	%i0,	%o4
	array32	%o1,	%o0,	%g3
	fandnot1s	%f29,	%f8,	%f25
	edge32n	%g5,	%o2,	%i1
	movg	%xcc,	%o3,	%i2
	subccc	%l6,	0x0AD7,	%i5
	stw	%g6,	[%l7 + 0x30]
	umul	%o7,	0x1FBE,	%l3
	mova	%icc,	%g7,	%g1
	edge16	%l4,	%o5,	%l2
	fxnor	%f22,	%f8,	%f20
	movneg	%xcc,	%i6,	%g2
	array8	%i7,	%l5,	%l1
	smulcc	%l0,	%i4,	%g4
	fnegs	%f19,	%f21
	lduw	[%l7 + 0x40],	%o6
	edge32ln	%i3,	%o4,	%i0
	lduh	[%l7 + 0x32],	%o1
	bshuffle	%f2,	%f8,	%f6
	movgu	%xcc,	%o0,	%g5
	andn	%o2,	0x1E09,	%g3
	ldx	[%l7 + 0x68],	%i1
	movneg	%icc,	%o3,	%l6
	sll	%i5,	%g6,	%o7
	st	%f30,	[%l7 + 0x60]
	array32	%l3,	%i2,	%g7
	fmovdpos	%xcc,	%f18,	%f1
	fmovdle	%icc,	%f0,	%f29
	sth	%g1,	[%l7 + 0x44]
	sra	%l4,	%o5,	%l2
	movvs	%xcc,	%g2,	%i6
	alignaddrl	%l5,	%l1,	%i7
	sub	%l0,	0x136E,	%g4
	udivcc	%i4,	0x1D38,	%i3
	edge16	%o6,	%i0,	%o1
	alignaddrl	%o0,	%o4,	%g5
	srl	%g3,	0x0F,	%i1
	movneg	%icc,	%o3,	%o2
	sdivcc	%i5,	0x1E42,	%g6
	movg	%icc,	%o7,	%l6
	movrlez	%l3,	%i2,	%g7
	sll	%l4,	%o5,	%g1
	movrgz	%l2,	%g2,	%i6
	orcc	%l1,	0x16DD,	%i7
	fpsub32s	%f10,	%f16,	%f19
	fmovsn	%icc,	%f22,	%f13
	mulscc	%l5,	0x0EDE,	%l0
	movle	%icc,	%i4,	%g4
	fcmpgt32	%f2,	%f12,	%o6
	ldsb	[%l7 + 0x60],	%i3
	mulx	%o1,	%o0,	%i0
	umulcc	%g5,	0x18FE,	%o4
	movge	%xcc,	%g3,	%o3
	fnands	%f22,	%f4,	%f11
	subcc	%o2,	%i5,	%i1
	nop
	set	0x72, %l4
	lduh	[%l7 + %l4],	%o7
	edge32l	%g6,	%l6,	%i2
	srax	%g7,	0x17,	%l4
	fmul8x16	%f28,	%f4,	%f16
	movge	%icc,	%o5,	%g1
	array32	%l3,	%g2,	%l2
	mulscc	%i6,	%l1,	%l5
	edge32l	%i7,	%i4,	%l0
	faligndata	%f24,	%f16,	%f10
	addcc	%o6,	%i3,	%g4
	sdivcc	%o1,	0x142D,	%o0
	movcs	%icc,	%g5,	%o4
	srlx	%i0,	0x0B,	%g3
	edge8	%o3,	%o2,	%i1
	array16	%o7,	%g6,	%l6
	movrne	%i5,	0x11B,	%i2
	fmovdneg	%xcc,	%f21,	%f8
	lduh	[%l7 + 0x52],	%g7
	sub	%l4,	%o5,	%g1
	movcs	%icc,	%l3,	%l2
	edge32n	%g2,	%l1,	%i6
	xor	%i7,	0x1F25,	%l5
	fsrc1	%f12,	%f10
	smulcc	%l0,	%o6,	%i3
	movrgez	%g4,	%i4,	%o0
	fmovrde	%o1,	%f24,	%f26
	fmovse	%xcc,	%f5,	%f4
	popc	%o4,	%i0
	movre	%g5,	0x2ED,	%g3
	fmovdvc	%icc,	%f26,	%f14
	sub	%o3,	0x0264,	%o2
	alignaddr	%i1,	%o7,	%l6
	alignaddr	%g6,	%i2,	%i5
	fmul8ulx16	%f14,	%f26,	%f28
	edge32	%l4,	%o5,	%g7
	and	%g1,	0x07F0,	%l2
	sdivcc	%g2,	0x0004,	%l1
	edge8l	%l3,	%i7,	%l5
	sdiv	%l0,	0x1380,	%o6
	xnor	%i6,	%i3,	%i4
	array8	%o0,	%g4,	%o4
	alignaddrl	%o1,	%i0,	%g3
	edge8n	%o3,	%g5,	%o2
	xor	%i1,	%o7,	%g6
	movrne	%i2,	%i5,	%l4
	sdivcc	%l6,	0x0BE0,	%g7
	xnorcc	%g1,	0x08C2,	%o5
	movvc	%icc,	%l2,	%g2
	edge16l	%l1,	%i7,	%l3
	edge8	%l0,	%o6,	%l5
	fmul8x16	%f12,	%f24,	%f22
	fmovrdlz	%i3,	%f12,	%f2
	edge8n	%i6,	%i4,	%g4
	movpos	%icc,	%o4,	%o1
	ldd	[%l7 + 0x38],	%i0
	sdivcc	%o0,	0x1F43,	%g3
	srl	%g5,	0x04,	%o3
	fmovdge	%icc,	%f15,	%f3
	fcmpeq16	%f12,	%f24,	%o2
	edge32	%i1,	%o7,	%i2
	edge16	%i5,	%l4,	%l6
	sdivcc	%g6,	0x15B2,	%g7
	fmovsg	%icc,	%f6,	%f8
	array16	%o5,	%g1,	%g2
	stw	%l1,	[%l7 + 0x54]
	movge	%xcc,	%l2,	%l3
	subcc	%l0,	0x1BE5,	%i7
	fmovsleu	%xcc,	%f13,	%f24
	stb	%l5,	[%l7 + 0x3C]
	fmul8x16au	%f25,	%f30,	%f12
	xor	%o6,	%i6,	%i4
	srax	%g4,	%i3,	%o4
	ld	[%l7 + 0x08],	%f16
	or	%o1,	%i0,	%o0
	fmovrdlz	%g3,	%f12,	%f26
	restore %o3, %g5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o7,	%i2,	%i5
	ldsb	[%l7 + 0x66],	%l4
	ldub	[%l7 + 0x76],	%i1
	movcs	%xcc,	%l6,	%g7
	move	%icc,	%o5,	%g6
	ldd	[%l7 + 0x30],	%f22
	movcc	%xcc,	%g1,	%g2
	orncc	%l2,	%l1,	%l3
	faligndata	%f0,	%f28,	%f20
	sth	%i7,	[%l7 + 0x64]
	edge32n	%l5,	%o6,	%l0
	alignaddr	%i4,	%g4,	%i6
	movrlz	%o4,	%i3,	%o1
	fmovspos	%xcc,	%f16,	%f5
	udiv	%i0,	0x1ED4,	%g3
	fsrc1	%f22,	%f4
	edge8	%o3,	%o0,	%g5
	sdivcc	%o7,	0x109C,	%o2
	edge8ln	%i2,	%l4,	%i1
	fcmpne16	%f30,	%f26,	%l6
	umulcc	%i5,	0x10EF,	%g7
	ldub	[%l7 + 0x59],	%o5
	sub	%g6,	0x0C27,	%g1
	stb	%g2,	[%l7 + 0x62]
	edge32l	%l2,	%l1,	%i7
	ldsh	[%l7 + 0x52],	%l5
	edge16n	%o6,	%l0,	%l3
	movpos	%icc,	%i4,	%i6
	fmovsneg	%icc,	%f1,	%f7
	movcs	%xcc,	%g4,	%o4
	ldx	[%l7 + 0x68],	%o1
	orncc	%i3,	0x0633,	%g3
	fnands	%f30,	%f13,	%f24
	edge16n	%o3,	%o0,	%i0
	movvc	%xcc,	%o7,	%g5
	ldd	[%l7 + 0x78],	%f16
	umulcc	%o2,	%l4,	%i2
	movrlez	%i1,	0x126,	%l6
	umul	%g7,	%o5,	%g6
	fornot2	%f18,	%f4,	%f20
	xnor	%i5,	%g1,	%g2
	edge8ln	%l2,	%l1,	%i7
	udivx	%o6,	0x124A,	%l0
	fmovscs	%icc,	%f28,	%f3
	fnot2	%f24,	%f18
	movleu	%xcc,	%l5,	%i4
	xnor	%i6,	0x0168,	%l3
	xnor	%o4,	0x143E,	%o1
	addccc	%i3,	0x0E16,	%g3
	edge32ln	%g4,	%o0,	%i0
	stw	%o3,	[%l7 + 0x44]
	andncc	%g5,	%o7,	%o2
	lduh	[%l7 + 0x78],	%l4
	movneg	%icc,	%i2,	%l6
	fmovsle	%icc,	%f21,	%f3
	fnot1s	%f0,	%f1
	faligndata	%f0,	%f16,	%f0
	udivcc	%i1,	0x0F0E,	%g7
	edge8	%o5,	%g6,	%g1
	udivx	%i5,	0x0E8A,	%l2
	umul	%l1,	0x145C,	%i7
	movle	%xcc,	%g2,	%l0
	umul	%o6,	%i4,	%l5
	array32	%i6,	%o4,	%o1
	movrne	%i3,	%g3,	%g4
	movle	%icc,	%l3,	%i0
	edge16ln	%o0,	%g5,	%o3
	st	%f0,	[%l7 + 0x4C]
	sethi	0x0323,	%o7
	fmovrdlz	%l4,	%f28,	%f28
	array32	%o2,	%i2,	%l6
	edge32n	%i1,	%g7,	%o5
	xnor	%g1,	%i5,	%l2
	movn	%xcc,	%l1,	%i7
	lduh	[%l7 + 0x16],	%g6
	movg	%xcc,	%g2,	%o6
	stb	%i4,	[%l7 + 0x17]
	addccc	%l0,	0x0D22,	%l5
	movcs	%xcc,	%o4,	%o1
	xnor	%i3,	0x1405,	%i6
	array16	%g4,	%g3,	%i0
	movge	%xcc,	%l3,	%o0
	edge8n	%o3,	%g5,	%l4
	movle	%icc,	%o2,	%o7
	srax	%l6,	0x06,	%i2
	fmul8x16al	%f5,	%f3,	%f8
	movrlz	%i1,	0x326,	%g7
	udivcc	%o5,	0x16E9,	%i5
	sll	%l2,	%l1,	%i7
	fmovsgu	%icc,	%f13,	%f21
	lduh	[%l7 + 0x48],	%g1
	movl	%xcc,	%g2,	%o6
	addccc	%i4,	0x08D5,	%l0
	save %l5, %g6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o4,	0x17FD,	%i3
	sir	0x038C
	popc	0x195B,	%i6
	fpackfix	%f20,	%f4
	movvs	%xcc,	%g4,	%i0
	movgu	%xcc,	%l3,	%o0
	udivcc	%o3,	0x01CC,	%g3
	ldub	[%l7 + 0x79],	%l4
	fnot1s	%f23,	%f21
	smul	%g5,	0x1D35,	%o2
	fands	%f21,	%f25,	%f16
	movre	%o7,	0x35D,	%l6
	movvc	%icc,	%i1,	%g7
	fcmped	%fcc0,	%f24,	%f18
	movneg	%xcc,	%o5,	%i2
	subcc	%l2,	0x1390,	%l1
	xnor	%i7,	%g1,	%g2
	edge16n	%i5,	%i4,	%o6
	ld	[%l7 + 0x3C],	%f31
	fabss	%f3,	%f5
	andcc	%l0,	%l5,	%g6
	ldx	[%l7 + 0x20],	%o4
	mova	%icc,	%o1,	%i6
	edge16	%g4,	%i0,	%i3
	subc	%o0,	%l3,	%g3
	fcmple32	%f16,	%f14,	%o3
	fmovda	%icc,	%f7,	%f24
	movl	%xcc,	%g5,	%o2
	sll	%l4,	0x16,	%l6
	ld	[%l7 + 0x78],	%f9
	edge8l	%o7,	%g7,	%i1
	udiv	%o5,	0x07AA,	%i2
	andncc	%l1,	%i7,	%g1
	edge8	%l2,	%i5,	%i4
	movcc	%xcc,	%g2,	%o6
	movleu	%xcc,	%l5,	%l0
	movrgez	%o4,	%g6,	%o1
	ldd	[%l7 + 0x40],	%f22
	edge32l	%i6,	%i0,	%g4
	xnorcc	%i3,	0x1AFC,	%o0
	edge8n	%l3,	%g3,	%g5
	edge32ln	%o2,	%l4,	%l6
	fmovs	%f14,	%f30
	mulx	%o3,	0x0352,	%g7
	addc	%i1,	0x0756,	%o7
	fmovrse	%o5,	%f4,	%f2
	or	%l1,	0x05F7,	%i7
	edge32	%g1,	%i2,	%l2
	orcc	%i5,	%i4,	%o6
	srl	%l5,	0x15,	%l0
	xorcc	%g2,	0x0E5B,	%g6
	ldsb	[%l7 + 0x0D],	%o4
	fmovrdgez	%i6,	%f4,	%f2
	movge	%xcc,	%o1,	%g4
	stw	%i3,	[%l7 + 0x3C]
	movne	%xcc,	%o0,	%i0
	srlx	%g3,	%g5,	%o2
	edge8	%l4,	%l3,	%o3
	lduh	[%l7 + 0x64],	%l6
	sdiv	%i1,	0x0167,	%g7
	movvc	%icc,	%o5,	%l1
	ldx	[%l7 + 0x70],	%o7
	fmovdpos	%icc,	%f30,	%f3
	movcc	%icc,	%g1,	%i2
	mulx	%l2,	%i5,	%i7
	fxnors	%f12,	%f21,	%f7
	subcc	%o6,	%i4,	%l5
	fmovdleu	%icc,	%f2,	%f23
	movvc	%xcc,	%g2,	%g6
	popc	%l0,	%i6
	fcmpgt16	%f18,	%f24,	%o1
	ldsw	[%l7 + 0x48],	%o4
	stx	%i3,	[%l7 + 0x68]
	movl	%icc,	%g4,	%o0
	srlx	%i0,	%g5,	%o2
	fmovrsne	%g3,	%f6,	%f31
	movgu	%xcc,	%l3,	%o3
	movvc	%xcc,	%l4,	%l6
	fmovspos	%icc,	%f8,	%f7
	sub	%i1,	%g7,	%l1
	movleu	%xcc,	%o5,	%o7
	fmul8x16au	%f13,	%f18,	%f14
	edge32ln	%i2,	%l2,	%i5
	edge16ln	%i7,	%o6,	%g1
	fornot2	%f22,	%f10,	%f12
	st	%f7,	[%l7 + 0x74]
	sll	%l5,	%i4,	%g6
	orcc	%l0,	%i6,	%g2
	edge32	%o4,	%i3,	%g4
	orn	%o1,	%i0,	%o0
	ldx	[%l7 + 0x38],	%g5
	sub	%g3,	%o2,	%o3
	andncc	%l3,	%l4,	%i1
	orn	%l6,	0x0D30,	%l1
	andn	%g7,	%o7,	%i2
	stw	%l2,	[%l7 + 0x4C]
	fcmpeq32	%f8,	%f18,	%o5
	orn	%i5,	%i7,	%o6
	edge8	%l5,	%i4,	%g6
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	fmuld8sux16	%f7,	%f23,	%f4
	smulcc	%o4,	0x167E,	%l0
	bshuffle	%f26,	%f22,	%f8
	movrgz	%i3,	0x23B,	%g4
	movcc	%xcc,	%o1,	%i0
	xorcc	%o0,	0x0E13,	%g5
	fnot2s	%f6,	%f10
	movrlez	%g3,	0x231,	%o3
	xnorcc	%l3,	0x149A,	%l4
	array32	%o2,	%l6,	%l1
	fors	%f27,	%f18,	%f19
	sth	%i1,	[%l7 + 0x10]
	edge8n	%g7,	%i2,	%l2
	orn	%o5,	%o7,	%i7
	ldub	[%l7 + 0x59],	%o6
	fmuld8ulx16	%f6,	%f17,	%f14
	movgu	%icc,	%l5,	%i4
	fpsub16s	%f13,	%f20,	%f28
	sra	%g6,	%i5,	%i6
	smul	%g1,	%g2,	%o4
	mova	%icc,	%l0,	%i3
	movrgz	%g4,	%i0,	%o0
	alignaddrl	%o1,	%g3,	%o3
	sir	0x14EC
	udivx	%l3,	0x06AA,	%g5
	edge8n	%o2,	%l6,	%l1
	lduh	[%l7 + 0x42],	%i1
	sth	%l4,	[%l7 + 0x12]
	xnorcc	%g7,	%l2,	%o5
	umul	%o7,	0x1705,	%i7
	fexpand	%f0,	%f18
	fmovdcc	%icc,	%f5,	%f22
	addccc	%i2,	%o6,	%l5
	sethi	0x05B3,	%i4
	fandnot1	%f8,	%f6,	%f0
	ldx	[%l7 + 0x38],	%i5
	sth	%g6,	[%l7 + 0x62]
	xor	%i6,	0x13F6,	%g2
	edge8l	%g1,	%l0,	%o4
	edge8l	%g4,	%i3,	%i0
	smulcc	%o1,	%o0,	%g3
	addc	%o3,	0x0007,	%g5
	movcs	%xcc,	%o2,	%l3
	fmul8x16au	%f8,	%f25,	%f0
	movrne	%l1,	%i1,	%l4
	sth	%l6,	[%l7 + 0x24]
	std	%f0,	[%l7 + 0x48]
	umulcc	%g7,	0x0454,	%o5
	or	%l2,	%i7,	%o7
	sdiv	%i2,	0x1AEA,	%l5
	udiv	%i4,	0x1F39,	%o6
	mulx	%g6,	%i6,	%g2
	edge8l	%g1,	%l0,	%i5
	siam	0x3
	fmuld8ulx16	%f8,	%f19,	%f6
	sra	%g4,	%o4,	%i3
	srax	%i0,	0x08,	%o0
	std	%f20,	[%l7 + 0x40]
	stb	%o1,	[%l7 + 0x76]
	edge16	%g3,	%o3,	%g5
	edge8ln	%l3,	%l1,	%i1
	udivx	%o2,	0x0849,	%l6
	xnorcc	%l4,	0x1488,	%g7
	udivx	%l2,	0x08ED,	%i7
	edge8l	%o5,	%o7,	%l5
	ldd	[%l7 + 0x40],	%i4
	udivx	%o6,	0x08AE,	%i2
	ldsh	[%l7 + 0x6A],	%g6
	fmovrsgez	%i6,	%f18,	%f8
	addc	%g1,	%g2,	%i5
	st	%f13,	[%l7 + 0x44]
	srl	%g4,	0x03,	%o4
	mulscc	%i3,	0x164B,	%i0
	movneg	%xcc,	%l0,	%o1
	fmovsn	%xcc,	%f13,	%f31
	ldub	[%l7 + 0x62],	%o0
	fmovsvs	%icc,	%f22,	%f12
	udivcc	%g3,	0x1E83,	%g5
	stb	%o3,	[%l7 + 0x58]
	fpsub16	%f8,	%f2,	%f8
	sdivcc	%l3,	0x0BC7,	%i1
	movgu	%icc,	%o2,	%l6
	movcc	%xcc,	%l4,	%l1
	fmovdgu	%icc,	%f28,	%f30
	fmovrslz	%l2,	%f21,	%f13
	sth	%g7,	[%l7 + 0x74]
	edge16ln	%o5,	%i7,	%l5
	xnor	%o7,	0x1FCB,	%i4
	fzeros	%f30
	sdiv	%i2,	0x1697,	%g6
	xor	%i6,	0x04C7,	%g1
	sub	%g2,	%i5,	%o6
	stx	%g4,	[%l7 + 0x10]
	sth	%o4,	[%l7 + 0x10]
	movrne	%i3,	0x398,	%l0
	sll	%o1,	%o0,	%i0
	fnot2s	%f3,	%f30
	movrgez	%g3,	%g5,	%l3
	edge8ln	%i1,	%o3,	%o2
	array32	%l6,	%l1,	%l2
	subccc	%l4,	%g7,	%o5
	mova	%xcc,	%l5,	%o7
	movrgz	%i4,	0x207,	%i2
	sll	%i7,	%i6,	%g1
	array16	%g6,	%g2,	%o6
	move	%xcc,	%i5,	%g4
	movre	%i3,	0x1B8,	%o4
	sir	0x03CF
	andcc	%l0,	%o1,	%i0
	sllx	%o0,	0x09,	%g3
	xor	%g5,	%i1,	%l3
	subccc	%o3,	0x01CA,	%l6
	fnand	%f26,	%f14,	%f20
	or	%o2,	0x08D2,	%l2
	orcc	%l1,	0x12A9,	%l4
	sth	%o5,	[%l7 + 0x62]
	fmovsle	%xcc,	%f16,	%f12
	movrlez	%l5,	%o7,	%g7
	xnorcc	%i2,	0x121E,	%i4
	edge8ln	%i7,	%i6,	%g6
	movl	%xcc,	%g1,	%g2
	subcc	%i5,	0x13D6,	%g4
	edge16l	%o6,	%i3,	%o4
	pdist	%f2,	%f26,	%f6
	stx	%l0,	[%l7 + 0x50]
	ldd	[%l7 + 0x58],	%f24
	fmul8x16al	%f20,	%f24,	%f30
	orncc	%o1,	0x1A71,	%i0
	movg	%xcc,	%g3,	%g5
	sll	%o0,	%i1,	%o3
	edge16	%l6,	%l3,	%o2
	mova	%xcc,	%l2,	%l1
	sub	%l4,	0x16B7,	%o5
	andcc	%o7,	%l5,	%g7
	movle	%xcc,	%i4,	%i7
	fxnor	%f12,	%f0,	%f22
	fornot1s	%f12,	%f17,	%f3
	movrgz	%i6,	0x3FD,	%i2
	add	%g6,	%g2,	%g1
	orn	%i5,	0x1939,	%o6
	andcc	%i3,	%g4,	%o4
	st	%f8,	[%l7 + 0x60]
	addc	%l0,	%o1,	%i0
	fmovdvs	%xcc,	%f8,	%f20
	movrgez	%g3,	%o0,	%g5
	stw	%o3,	[%l7 + 0x68]
	edge32l	%l6,	%l3,	%i1
	alignaddr	%l2,	%l1,	%l4
	movle	%xcc,	%o5,	%o2
	movrlez	%l5,	0x230,	%o7
	lduh	[%l7 + 0x68],	%g7
	subcc	%i7,	0x092F,	%i4
	ldsh	[%l7 + 0x6E],	%i6
	edge32n	%i2,	%g2,	%g1
	subc	%i5,	0x0271,	%g6
	movne	%icc,	%i3,	%o6
	mulscc	%o4,	%l0,	%o1
	sub	%i0,	%g3,	%g4
	movcs	%icc,	%o0,	%g5
	movg	%icc,	%o3,	%l3
	mulscc	%i1,	0x060C,	%l2
	sdiv	%l1,	0x12FE,	%l6
	umulcc	%l4,	%o2,	%o5
	edge8l	%o7,	%l5,	%g7
	udivcc	%i4,	0x065C,	%i7
	sethi	0x1DBF,	%i2
	sllx	%i6,	%g1,	%g2
	movvc	%xcc,	%i5,	%i3
	addcc	%g6,	%o6,	%o4
	movre	%l0,	0x29B,	%i0
	fmul8x16au	%f17,	%f4,	%f18
	fmovsne	%icc,	%f7,	%f1
	ldsw	[%l7 + 0x40],	%g3
	movneg	%xcc,	%o1,	%g4
	stb	%g5,	[%l7 + 0x41]
	edge8n	%o3,	%l3,	%i1
	fpack32	%f20,	%f0,	%f26
	orncc	%l2,	0x0EF8,	%o0
	srax	%l6,	0x0A,	%l4
	edge8l	%o2,	%o5,	%o7
	srax	%l5,	0x14,	%l1
	save %g7, 0x1240, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i2,	%i6
	st	%f10,	[%l7 + 0x28]
	movneg	%xcc,	%g1,	%g2
	movgu	%xcc,	%i4,	%i3
	sll	%g6,	0x1F,	%i5
	array16	%o4,	%o6,	%i0
	restore %l0, %o1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g5,	0x1D65,	%o3
	sra	%l3,	0x15,	%i1
	fpackfix	%f4,	%f12
	sir	0x0921
	lduh	[%l7 + 0x32],	%l2
	fmovrsgez	%g3,	%f23,	%f28
	movpos	%icc,	%o0,	%l4
	fxnor	%f16,	%f12,	%f10
	siam	0x4
	sdiv	%l6,	0x1BD4,	%o2
	movn	%icc,	%o5,	%o7
	mova	%xcc,	%l5,	%g7
	fabsd	%f20,	%f14
	sdiv	%i7,	0x0B16,	%i2
	fsrc1	%f10,	%f10
	subc	%i6,	0x0AF2,	%l1
	movre	%g1,	%g2,	%i4
	lduh	[%l7 + 0x76],	%g6
	andn	%i5,	0x11BA,	%o4
	fmovdl	%xcc,	%f2,	%f15
	movl	%xcc,	%i3,	%o6
	movpos	%xcc,	%i0,	%l0
	sra	%o1,	0x05,	%g4
	ldd	[%l7 + 0x40],	%f20
	ld	[%l7 + 0x4C],	%f26
	smul	%g5,	0x0832,	%l3
	fmul8x16au	%f18,	%f13,	%f14
	xnorcc	%i1,	0x199F,	%l2
	fnand	%f28,	%f10,	%f8
	fmovsgu	%icc,	%f8,	%f7
	subcc	%o3,	0x0EAA,	%g3
	movn	%icc,	%l4,	%o0
	edge8ln	%o2,	%l6,	%o5
	lduh	[%l7 + 0x24],	%o7
	addccc	%g7,	%l5,	%i2
	array16	%i6,	%l1,	%i7
	mulscc	%g2,	0x1EEE,	%g1
	array16	%i4,	%g6,	%o4
	udivcc	%i3,	0x0C8C,	%i5
	umul	%i0,	%o6,	%l0
	movl	%xcc,	%g4,	%g5
	edge16	%l3,	%i1,	%o1
	array16	%o3,	%l2,	%g3
	fmovdne	%xcc,	%f24,	%f18
	movre	%o0,	%o2,	%l4
	movleu	%xcc,	%o5,	%o7
	sra	%g7,	0x1A,	%l5
	umul	%l6,	%i2,	%i6
	fmovdge	%xcc,	%f26,	%f11
	movre	%i7,	0x3A9,	%g2
	fand	%f20,	%f28,	%f0
	ldsb	[%l7 + 0x34],	%l1
	fexpand	%f31,	%f4
	array16	%i4,	%g6,	%o4
	sir	0x01DA
	srax	%g1,	%i3,	%i5
	andn	%o6,	0x1F6F,	%i0
	pdist	%f24,	%f24,	%f22
	edge8l	%l0,	%g5,	%g4
	edge16ln	%l3,	%o1,	%i1
	movvc	%icc,	%l2,	%g3
	fcmpgt32	%f30,	%f0,	%o3
	edge32n	%o0,	%l4,	%o2
	alignaddrl	%o5,	%o7,	%g7
	smulcc	%l6,	%l5,	%i6
	movneg	%icc,	%i2,	%i7
	movle	%icc,	%g2,	%i4
	stx	%l1,	[%l7 + 0x58]
	fpadd16s	%f28,	%f8,	%f2
	movcc	%icc,	%g6,	%o4
	fmuld8sux16	%f0,	%f11,	%f18
	sdivcc	%g1,	0x1AF4,	%i5
	fmovdg	%icc,	%f29,	%f0
	fexpand	%f15,	%f4
	sdivx	%o6,	0x0525,	%i0
	xnorcc	%i3,	%g5,	%l0
	save %g4, 0x014A, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x78],	%i1
	udiv	%l2,	0x1239,	%g3
	xnorcc	%o3,	%o1,	%l4
	srl	%o0,	%o2,	%o7
	lduh	[%l7 + 0x46],	%o5
	sth	%g7,	[%l7 + 0x76]
	orcc	%l6,	%i6,	%l5
	movle	%icc,	%i7,	%i2
	xnorcc	%g2,	%i4,	%l1
	subc	%g6,	%g1,	%i5
	siam	0x3
	fmovdvc	%icc,	%f23,	%f14
	or	%o4,	%o6,	%i3
	fcmpes	%fcc2,	%f10,	%f24
	udivx	%g5,	0x0CB1,	%i0
	movrlez	%g4,	0x350,	%l3
	movrlz	%l0,	0x3EE,	%i1
	sdivx	%g3,	0x19F1,	%l2
	fand	%f6,	%f14,	%f14
	fmovscc	%xcc,	%f9,	%f9
	edge16ln	%o1,	%o3,	%l4
	fxor	%f20,	%f2,	%f12
	fcmpeq16	%f2,	%f0,	%o0
	udivcc	%o7,	0x01DD,	%o2
	st	%f23,	[%l7 + 0x34]
	mova	%xcc,	%g7,	%o5
	fmovspos	%icc,	%f11,	%f30
	addcc	%i6,	%l5,	%l6
	ldsw	[%l7 + 0x5C],	%i7
	stb	%i2,	[%l7 + 0x54]
	andncc	%i4,	%l1,	%g2
	std	%f14,	[%l7 + 0x78]
	fabsd	%f0,	%f18
	fnot2	%f18,	%f2
	orcc	%g6,	0x1F53,	%g1
	orn	%i5,	%o6,	%i3
	alignaddrl	%o4,	%i0,	%g4
	movn	%xcc,	%l3,	%l0
	orcc	%i1,	0x06FA,	%g3
	for	%f28,	%f4,	%f16
	fpadd16	%f0,	%f26,	%f18
	edge8ln	%g5,	%l2,	%o3
	sdivx	%l4,	0x1835,	%o1
	edge8l	%o7,	%o0,	%o2
	movpos	%icc,	%o5,	%g7
	mulscc	%l5,	%l6,	%i7
	ldsw	[%l7 + 0x48],	%i2
	save %i6, 0x13FA, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l1,	0x0FB0,	%g6
	xor	%g1,	0x1699,	%i5
	srl	%g2,	0x0C,	%i3
	movle	%icc,	%o6,	%i0
	fones	%f26
	nop
	set	0x5C, %g5
	stw	%o4,	[%l7 + %g5]
	xor	%l3,	0x0809,	%g4
	alignaddrl	%i1,	%g3,	%g5
	fmovdleu	%xcc,	%f10,	%f6
	fabss	%f14,	%f26
	movcs	%icc,	%l2,	%l0
	movrgez	%l4,	0x1D6,	%o3
	std	%f16,	[%l7 + 0x40]
	xnor	%o1,	%o0,	%o2
	sir	0x13C3
	ldd	[%l7 + 0x28],	%o4
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	fnot2s	%f15,	%f7
	lduw	[%l7 + 0x74],	%i7
	fmovrdlz	%o7,	%f22,	%f8
	xnor	%i2,	0x0D26,	%i4
	umulcc	%l1,	0x0515,	%i6
	addc	%g6,	%i5,	%g2
	movpos	%icc,	%i3,	%o6
	edge16l	%g1,	%o4,	%l3
	edge16l	%g4,	%i1,	%i0
	sra	%g3,	%l2,	%l0
	stb	%g5,	[%l7 + 0x6D]
	movrgz	%l4,	0x009,	%o1
	xnor	%o0,	0x0B75,	%o3
	stb	%o2,	[%l7 + 0x0C]
	sdivx	%g7,	0x1704,	%l5
	edge8n	%l6,	%i7,	%o7
	edge16n	%o5,	%i2,	%i4
	stb	%l1,	[%l7 + 0x0A]
	xor	%g6,	0x1356,	%i6
	fmovdneg	%xcc,	%f1,	%f20
	ldsb	[%l7 + 0x46],	%g2
	ld	[%l7 + 0x10],	%f16
	alignaddrl	%i5,	%o6,	%i3
	mulx	%g1,	0x1319,	%l3
	fmovdcc	%icc,	%f20,	%f0
	fcmpd	%fcc1,	%f2,	%f8
	xor	%g4,	0x15D8,	%i1
	sdivcc	%i0,	0x01C7,	%o4
	lduh	[%l7 + 0x20],	%l2
	edge8l	%g3,	%g5,	%l0
	or	%o1,	%l4,	%o3
	udiv	%o2,	0x0678,	%g7
	fmovrsgez	%o0,	%f13,	%f16
	stb	%l5,	[%l7 + 0x47]
	or	%i7,	%l6,	%o5
	udivx	%o7,	0x0609,	%i4
	udiv	%i2,	0x02F6,	%g6
	sub	%i6,	0x13EE,	%g2
	mulscc	%l1,	%o6,	%i3
	save %g1, %l3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i1,	%g4,	%o4
	sdiv	%i0,	0x0144,	%l2
	movvs	%icc,	%g3,	%g5
	xorcc	%l0,	%o1,	%o3
	fmovdvc	%xcc,	%f7,	%f5
	srax	%l4,	0x1D,	%g7
	edge8ln	%o2,	%o0,	%i7
	ldsw	[%l7 + 0x50],	%l6
	movpos	%icc,	%l5,	%o5
	ld	[%l7 + 0x2C],	%f27
	smulcc	%i4,	0x1931,	%o7
	movge	%xcc,	%i2,	%i6
	ldub	[%l7 + 0x6C],	%g6
	udiv	%l1,	0x0B08,	%g2
	sll	%i3,	%g1,	%o6
	movvs	%icc,	%i5,	%i1
	std	%f4,	[%l7 + 0x10]
	edge32ln	%g4,	%l3,	%o4
	edge8	%i0,	%l2,	%g5
	xorcc	%l0,	%o1,	%g3
	movneg	%icc,	%l4,	%o3
	add	%o2,	0x0C83,	%g7
	fpadd32s	%f4,	%f0,	%f20
	addccc	%i7,	0x1DBC,	%l6
	fmovsle	%icc,	%f14,	%f2
	edge16	%o0,	%l5,	%o5
	fcmpeq16	%f10,	%f20,	%o7
	fandnot2s	%f8,	%f3,	%f13
	fnot1s	%f8,	%f21
	movneg	%icc,	%i4,	%i2
	ldsw	[%l7 + 0x70],	%g6
	smul	%l1,	%g2,	%i6
	fornot2	%f22,	%f0,	%f28
	edge16n	%i3,	%o6,	%i5
	fmovd	%f0,	%f28
	movge	%xcc,	%g1,	%g4
	movvs	%icc,	%l3,	%i1
	array16	%o4,	%i0,	%g5
	fmovdle	%xcc,	%f3,	%f10
	array32	%l2,	%o1,	%l0
	stb	%l4,	[%l7 + 0x54]
	fmovda	%icc,	%f18,	%f19
	srlx	%g3,	%o2,	%g7
	sdivx	%o3,	0x0BD7,	%i7
	movrlz	%l6,	0x3CF,	%l5
	xnorcc	%o0,	%o5,	%i4
	edge32l	%o7,	%g6,	%l1
	save %g2, %i6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i3,	%o6,	%g1
	alignaddrl	%g4,	%i5,	%l3
	fmovrdgz	%i1,	%f26,	%f2
	movrlez	%i0,	%g5,	%o4
	xnorcc	%o1,	0x132A,	%l2
	ldsh	[%l7 + 0x62],	%l4
	array32	%g3,	%l0,	%o2
	movl	%icc,	%g7,	%o3
	udivx	%i7,	0x08AC,	%l6
	fpsub32	%f4,	%f2,	%f14
	movgu	%xcc,	%l5,	%o5
	fmovrde	%o0,	%f10,	%f10
	sdiv	%i4,	0x12BE,	%g6
	subcc	%l1,	%g2,	%i6
	fpack16	%f12,	%f2
	fmovrdne	%i2,	%f6,	%f20
	srax	%i3,	0x19,	%o7
	fmovsg	%xcc,	%f19,	%f20
	sdivx	%o6,	0x0750,	%g4
	fpack16	%f18,	%f20
	fmovsl	%icc,	%f21,	%f5
	movpos	%xcc,	%i5,	%g1
	st	%f31,	[%l7 + 0x54]
	lduw	[%l7 + 0x44],	%i1
	movg	%icc,	%l3,	%g5
	orcc	%o4,	%i0,	%o1
	subc	%l4,	0x1592,	%l2
	edge16	%l0,	%o2,	%g7
	fcmpeq32	%f24,	%f30,	%o3
	movgu	%icc,	%i7,	%g3
	fpack16	%f8,	%f8
	subcc	%l6,	0x039B,	%l5
	sllx	%o0,	0x1A,	%i4
	movn	%icc,	%g6,	%o5
	ldd	[%l7 + 0x58],	%f6
	orcc	%l1,	0x0179,	%i6
	ldx	[%l7 + 0x08],	%g2
	ldsh	[%l7 + 0x7C],	%i2
	movrlz	%o7,	0x01A,	%o6
	movle	%icc,	%i3,	%g4
	movn	%xcc,	%g1,	%i1
	edge8n	%l3,	%i5,	%o4
	edge16	%g5,	%i0,	%o1
	movcc	%xcc,	%l4,	%l2
	udiv	%l0,	0x120C,	%g7
	fcmped	%fcc3,	%f12,	%f26
	fcmpne16	%f26,	%f8,	%o3
	ldd	[%l7 + 0x10],	%o2
	fmovdn	%xcc,	%f23,	%f6
	movrlez	%i7,	0x240,	%l6
	sub	%l5,	%o0,	%i4
	addccc	%g6,	%g3,	%o5
	smulcc	%l1,	0x178B,	%i6
	srlx	%g2,	0x1F,	%o7
	movle	%xcc,	%i2,	%o6
	sllx	%g4,	0x02,	%g1
	ldsb	[%l7 + 0x4B],	%i3
	mulscc	%l3,	%i1,	%o4
	edge32l	%i5,	%i0,	%o1
	movrne	%l4,	0x2F8,	%g5
	andncc	%l0,	%l2,	%g7
	fmovrslz	%o3,	%f21,	%f15
	fmovda	%xcc,	%f8,	%f15
	ldub	[%l7 + 0x42],	%i7
	movvs	%icc,	%l6,	%l5
	restore %o0, %o2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f8,	%f8
	andn	%g3,	0x0953,	%i4
	st	%f4,	[%l7 + 0x5C]
	orncc	%o5,	%l1,	%i6
	array32	%o7,	%i2,	%g2
	movne	%icc,	%o6,	%g1
	fmul8ulx16	%f8,	%f8,	%f0
	andcc	%g4,	%l3,	%i1
	smulcc	%i3,	0x1BD4,	%o4
	srax	%i5,	0x05,	%i0
	ldx	[%l7 + 0x38],	%l4
	xor	%g5,	%l0,	%o1
	fmovrsgez	%g7,	%f9,	%f8
	smul	%o3,	%l2,	%l6
	sll	%i7,	0x1D,	%l5
	ldub	[%l7 + 0x40],	%o2
	edge16n	%g6,	%o0,	%i4
	fmovdn	%xcc,	%f20,	%f26
	fmovdpos	%xcc,	%f21,	%f6
	sdivcc	%o5,	0x0CF6,	%g3
	fxors	%f2,	%f3,	%f2
	xorcc	%i6,	0x0D02,	%l1
	addcc	%i2,	%o7,	%o6
	subc	%g2,	%g1,	%l3
	movvc	%xcc,	%i1,	%g4
	sdivx	%i3,	0x05FC,	%o4
	array32	%i0,	%l4,	%g5
	alignaddrl	%i5,	%o1,	%l0
	ldx	[%l7 + 0x40],	%g7
	sll	%l2,	0x18,	%o3
	fmovdle	%xcc,	%f28,	%f0
	subccc	%l6,	%l5,	%o2
	orcc	%i7,	0x0A29,	%g6
	andncc	%o0,	%o5,	%g3
	fnegs	%f12,	%f9
	edge16n	%i6,	%l1,	%i2
	movrlez	%i4,	%o6,	%g2
	movne	%xcc,	%g1,	%o7
	sllx	%l3,	%i1,	%i3
	sethi	0x1C0A,	%o4
	fcmpne16	%f28,	%f2,	%i0
	fmovrdne	%g4,	%f14,	%f22
	alignaddrl	%l4,	%g5,	%i5
	xnor	%o1,	0x0714,	%l0
	fnors	%f30,	%f31,	%f13
	fmovdn	%xcc,	%f11,	%f8
	orn	%l2,	%g7,	%l6
	xorcc	%l5,	0x0FA7,	%o2
	add	%i7,	%g6,	%o3
	movge	%icc,	%o0,	%o5
	addc	%i6,	0x1860,	%l1
	ldd	[%l7 + 0x10],	%f6
	edge8n	%i2,	%i4,	%o6
	array16	%g2,	%g3,	%o7
	subccc	%l3,	%g1,	%i3
	sdiv	%o4,	0x099F,	%i1
	edge16n	%g4,	%l4,	%g5
	fcmpne16	%f12,	%f8,	%i0
	sethi	0x0D64,	%i5
	ldub	[%l7 + 0x52],	%l0
	movrgz	%o1,	%l2,	%g7
	srlx	%l5,	%l6,	%o2
	subccc	%i7,	0x0161,	%g6
	ldsh	[%l7 + 0x7E],	%o3
	edge32n	%o5,	%i6,	%o0
	orncc	%l1,	%i2,	%o6
	fpsub32s	%f18,	%f23,	%f2
	fmovrsgz	%g2,	%f1,	%f31
	subc	%g3,	%o7,	%l3
	movrne	%i4,	0x35D,	%g1
	stb	%o4,	[%l7 + 0x39]
	movne	%xcc,	%i3,	%g4
	fandnot1	%f12,	%f22,	%f4
	edge32ln	%i1,	%g5,	%i0
	fmovsle	%icc,	%f13,	%f24
	fmovsge	%icc,	%f25,	%f15
	fmovrsgz	%i5,	%f27,	%f19
	fnot1s	%f0,	%f13
	addc	%l4,	0x1F5A,	%o1
	ldd	[%l7 + 0x20],	%f24
	array8	%l2,	%l0,	%l5
	sdiv	%l6,	0x12B4,	%o2
	subcc	%i7,	%g6,	%o3
	subccc	%o5,	%g7,	%o0
	nop
	set	0x3B, %o1
	ldub	[%l7 + %o1],	%l1
	movleu	%icc,	%i6,	%o6
	fmul8x16al	%f8,	%f2,	%f0
	fmovsg	%icc,	%f4,	%f13
	edge16ln	%g2,	%i2,	%o7
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	fnot2	%f26,	%f20
	xnorcc	%g1,	%o4,	%g3
	array8	%i3,	%g4,	%g5
	fnor	%f20,	%f10,	%f8
	lduw	[%l7 + 0x44],	%i0
	edge32ln	%i1,	%i5,	%o1
	sdiv	%l2,	0x0061,	%l0
	ldsb	[%l7 + 0x23],	%l5
	movleu	%xcc,	%l6,	%o2
	movvc	%xcc,	%i7,	%l4
	std	%f28,	[%l7 + 0x10]
	udiv	%g6,	0x0B82,	%o3
	movg	%xcc,	%g7,	%o5
	xorcc	%o0,	%l1,	%i6
	srlx	%o6,	%g2,	%i2
	and	%o7,	0x1AAE,	%l3
	udivx	%g1,	0x0B9E,	%i4
	array32	%o4,	%g3,	%g4
	srl	%i3,	0x0F,	%g5
	edge16n	%i1,	%i5,	%i0
	ld	[%l7 + 0x3C],	%f11
	restore %l2, %o1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x40],	%l6
	sir	0x19A7
	ldx	[%l7 + 0x10],	%o2
	edge8n	%l0,	%l4,	%g6
	sethi	0x01F6,	%o3
	movrne	%g7,	%i7,	%o0
	and	%l1,	0x0FF4,	%o5
	movle	%icc,	%i6,	%g2
	edge16l	%i2,	%o7,	%l3
	save %g1, 0x16AB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o6,	[%l7 + 0x08]
	sdivcc	%o4,	0x1396,	%g3
	edge8n	%g4,	%g5,	%i1
	lduw	[%l7 + 0x60],	%i5
	andcc	%i3,	0x1718,	%i0
	ldx	[%l7 + 0x20],	%l2
	udivcc	%o1,	0x0D8B,	%l6
	fmovsleu	%xcc,	%f4,	%f4
	fmovrdlez	%l5,	%f16,	%f22
	mulx	%o2,	%l0,	%l4
	sub	%o3,	0x15E6,	%g6
	ldsb	[%l7 + 0x58],	%i7
	movn	%icc,	%g7,	%l1
	movrlz	%o5,	%o0,	%g2
	edge32l	%i2,	%i6,	%o7
	fnands	%f21,	%f21,	%f30
	movrgz	%g1,	0x048,	%i4
	edge16ln	%o6,	%l3,	%g3
	fexpand	%f14,	%f0
	popc	0x0FBC,	%o4
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	add	%i3,	%i0,	%l2
	sth	%o1,	[%l7 + 0x1A]
	nop
	set	0x20, %i5
	stx	%i1,	[%l7 + %i5]
	sllx	%l6,	%o2,	%l0
	popc	0x1710,	%l4
	sethi	0x0888,	%o3
	fmovrslez	%g6,	%f25,	%f6
	sdivx	%i7,	0x18D0,	%g7
	ldx	[%l7 + 0x40],	%l1
	fmovsvs	%icc,	%f11,	%f20
	movrlz	%o5,	0x379,	%o0
	faligndata	%f30,	%f20,	%f28
	fnot1	%f26,	%f18
	sth	%l5,	[%l7 + 0x40]
	alignaddr	%i2,	%i6,	%g2
	fmovdneg	%icc,	%f30,	%f14
	smulcc	%o7,	0x0BC3,	%i4
	edge16l	%g1,	%l3,	%o6
	movvs	%xcc,	%g3,	%g4
	sdiv	%g5,	0x0476,	%i5
	movge	%xcc,	%i3,	%i0
	bshuffle	%f26,	%f4,	%f0
	fmovrdlz	%o4,	%f28,	%f12
	edge8ln	%l2,	%i1,	%o1
	srlx	%o2,	0x12,	%l0
	movcs	%icc,	%l6,	%o3
	movrne	%l4,	0x024,	%g6
	fcmped	%fcc1,	%f24,	%f18
	srlx	%g7,	%l1,	%o5
	fmovdle	%icc,	%f31,	%f20
	orcc	%o0,	%i7,	%i2
	lduh	[%l7 + 0x48],	%l5
	ldsh	[%l7 + 0x56],	%g2
	smul	%o7,	%i6,	%i4
	movcs	%xcc,	%l3,	%g1
	lduw	[%l7 + 0x24],	%g3
	orncc	%g4,	0x19BB,	%g5
	fmovrdgz	%o6,	%f26,	%f6
	xnor	%i3,	0x19EE,	%i5
	ldx	[%l7 + 0x08],	%o4
	fpsub32s	%f13,	%f14,	%f25
	orn	%l2,	%i1,	%i0
	or	%o2,	%o1,	%l6
	movrne	%l0,	0x2E9,	%o3
	edge8ln	%g6,	%g7,	%l1
	edge32l	%o5,	%o0,	%i7
	ldd	[%l7 + 0x20],	%f12
	movrne	%l4,	%l5,	%i2
	ldub	[%l7 + 0x58],	%o7
	move	%xcc,	%g2,	%i4
	movrlez	%l3,	0x276,	%g1
	sir	0x1A2C
	fsrc1	%f12,	%f26
	ldd	[%l7 + 0x58],	%i6
	nop
	set	0x4C, %g7
	sth	%g3,	[%l7 + %g7]
	fornot2s	%f16,	%f20,	%f12
	fxnors	%f21,	%f2,	%f18
	sethi	0x1A29,	%g5
	movre	%g4,	%o6,	%i5
	fpadd16s	%f15,	%f6,	%f10
	movge	%xcc,	%o4,	%l2
	ldx	[%l7 + 0x50],	%i3
	fmovrsne	%i1,	%f17,	%f31
	ldd	[%l7 + 0x70],	%o2
	sth	%i0,	[%l7 + 0x2C]
	fxnors	%f18,	%f9,	%f12
	stx	%l6,	[%l7 + 0x10]
	fornot1s	%f1,	%f2,	%f19
	movcs	%xcc,	%l0,	%o3
	movleu	%xcc,	%o1,	%g7
	movn	%icc,	%l1,	%g6
	movpos	%icc,	%o0,	%i7
	fpsub32s	%f9,	%f20,	%f5
	movgu	%icc,	%l4,	%l5
	fands	%f14,	%f4,	%f30
	movge	%icc,	%i2,	%o7
	sdivcc	%o5,	0x1B0E,	%g2
	movg	%icc,	%l3,	%g1
	lduh	[%l7 + 0x72],	%i4
	edge32l	%i6,	%g3,	%g4
	fmovspos	%xcc,	%f4,	%f1
	ldub	[%l7 + 0x33],	%o6
	xnor	%i5,	0x1F67,	%o4
	subcc	%l2,	%i3,	%g5
	edge32	%i1,	%o2,	%i0
	fmovsg	%xcc,	%f11,	%f22
	addc	%l6,	%l0,	%o3
	fmovrdgez	%o1,	%f4,	%f20
	fpack16	%f2,	%f23
	ldx	[%l7 + 0x50],	%l1
	umul	%g7,	0x0782,	%g6
	sir	0x0356
	orncc	%o0,	%l4,	%l5
	movl	%xcc,	%i2,	%o7
	ldd	[%l7 + 0x10],	%f16
	movvc	%icc,	%i7,	%o5
	save %l3, %g1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fones	%f16
	fmovdg	%icc,	%f30,	%f2
	xnorcc	%i4,	%i6,	%g3
	movpos	%xcc,	%o6,	%g4
	sra	%o4,	0x1E,	%l2
	edge16n	%i3,	%i5,	%g5
	stb	%o2,	[%l7 + 0x08]
	srl	%i0,	0x04,	%l6
	siam	0x0
	sll	%l0,	%o3,	%o1
	movrlz	%i1,	%l1,	%g6
	movrgez	%o0,	%g7,	%l4
	movrgz	%i2,	0x15F,	%o7
	edge32	%i7,	%l5,	%o5
	edge8ln	%l3,	%g2,	%i4
	addcc	%g1,	%i6,	%g3
	movn	%xcc,	%g4,	%o4
	edge16l	%o6,	%i3,	%i5
	movn	%icc,	%g5,	%o2
	fpadd32s	%f14,	%f14,	%f16
	fmovdg	%xcc,	%f3,	%f30
	movpos	%icc,	%l2,	%l6
	srlx	%l0,	%o3,	%i0
	stb	%i1,	[%l7 + 0x7A]
	fmul8x16al	%f13,	%f0,	%f16
	array8	%o1,	%l1,	%g6
	fnors	%f25,	%f20,	%f6
	fpackfix	%f0,	%f28
	add	%o0,	%l4,	%g7
	ldub	[%l7 + 0x2B],	%o7
	movgu	%xcc,	%i2,	%i7
	fmovdg	%icc,	%f6,	%f15
	fcmpne32	%f24,	%f4,	%l5
	fcmpd	%fcc3,	%f24,	%f10
	mova	%xcc,	%o5,	%l3
	fmovda	%xcc,	%f12,	%f9
	umulcc	%i4,	%g1,	%g2
	edge8l	%g3,	%g4,	%o4
	orcc	%o6,	%i3,	%i5
	array32	%i6,	%g5,	%o2
	array8	%l2,	%l6,	%o3
	fmovrsgz	%i0,	%f3,	%f15
	movneg	%xcc,	%i1,	%l0
	fmovrdlz	%l1,	%f30,	%f12
	movne	%xcc,	%o1,	%g6
	restore %l4, 0x0322, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f28,	%f2
	xorcc	%o0,	0x112C,	%o7
	andncc	%i7,	%i2,	%o5
	std	%f16,	[%l7 + 0x40]
	ldx	[%l7 + 0x18],	%l5
	mova	%icc,	%l3,	%g1
	fands	%f6,	%f29,	%f15
	sdivcc	%i4,	0x16AD,	%g2
	add	%g3,	0x11CC,	%o4
	edge8	%o6,	%i3,	%g4
	fmul8x16	%f5,	%f10,	%f4
	subcc	%i6,	0x0AE4,	%i5
	edge8n	%g5,	%o2,	%l6
	orncc	%l2,	%i0,	%i1
	edge32l	%l0,	%l1,	%o1
	movgu	%icc,	%g6,	%l4
	sll	%g7,	%o3,	%o7
	fzeros	%f11
	addc	%i7,	0x197E,	%o0
	subcc	%i2,	%o5,	%l3
	edge32l	%g1,	%i4,	%g2
	smul	%l5,	0x0426,	%o4
	fnot2	%f14,	%f26
	ldsw	[%l7 + 0x0C],	%o6
	ldx	[%l7 + 0x20],	%g3
	andncc	%i3,	%i6,	%i5
	fxnor	%f2,	%f26,	%f10
	orncc	%g4,	%g5,	%l6
	and	%l2,	%i0,	%o2
	or	%l0,	0x146D,	%l1
	fmul8ulx16	%f4,	%f30,	%f6
	movrgez	%i1,	0x1A6,	%o1
	fcmpne16	%f6,	%f20,	%l4
	sllx	%g7,	%o3,	%o7
	ld	[%l7 + 0x28],	%f13
	sir	0x198D
	smul	%i7,	0x171E,	%o0
	andn	%i2,	0x030A,	%g6
	stw	%l3,	[%l7 + 0x1C]
	ldx	[%l7 + 0x08],	%o5
	edge8n	%i4,	%g1,	%l5
	fmovrslz	%g2,	%f10,	%f10
	lduw	[%l7 + 0x7C],	%o6
	sdivcc	%o4,	0x14CD,	%g3
	fcmpne32	%f14,	%f14,	%i6
	edge8l	%i5,	%i3,	%g5
	movne	%xcc,	%l6,	%g4
	srax	%l2,	%i0,	%o2
	fmovsleu	%xcc,	%f8,	%f1
	edge16l	%l1,	%i1,	%o1
	edge32l	%l0,	%l4,	%g7
	fandnot2	%f22,	%f24,	%f12
	fmovsa	%icc,	%f24,	%f26
	edge8l	%o7,	%i7,	%o0
	ldsw	[%l7 + 0x78],	%o3
	edge8l	%i2,	%g6,	%l3
	srl	%o5,	%i4,	%g1
	fsrc2	%f4,	%f16
	srax	%g2,	0x11,	%o6
	lduw	[%l7 + 0x64],	%o4
	srlx	%l5,	0x0E,	%g3
	sdiv	%i6,	0x1009,	%i3
	fcmpgt16	%f30,	%f14,	%i5
	fcmped	%fcc0,	%f0,	%f6
	edge32	%l6,	%g5,	%g4
	addccc	%l2,	0x0BA3,	%o2
	fmovsge	%icc,	%f31,	%f7
	subccc	%i0,	%i1,	%o1
	umul	%l0,	0x10DF,	%l1
	subccc	%g7,	0x0812,	%l4
	mulscc	%i7,	%o0,	%o7
	save %o3, 0x19E3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i2,	%l3
	srax	%o5,	0x10,	%i4
	srax	%g2,	0x1E,	%g1
	edge8l	%o4,	%o6,	%g3
	movcs	%icc,	%i6,	%l5
	ldd	[%l7 + 0x68],	%i2
	sra	%i5,	%g5,	%g4
	fcmps	%fcc2,	%f2,	%f14
	ldd	[%l7 + 0x28],	%f16
	sir	0x1356
	fcmpgt32	%f30,	%f12,	%l6
	fmovrdlez	%o2,	%f30,	%f12
	andncc	%i0,	%l2,	%o1
	sdivx	%l0,	0x0C62,	%l1
	fsrc2	%f16,	%f22
	srl	%g7,	0x08,	%i1
	movrlz	%l4,	%i7,	%o7
	movrgez	%o3,	0x21B,	%g6
	edge32ln	%o0,	%l3,	%o5
	movre	%i4,	0x0DD,	%i2
	xorcc	%g2,	%g1,	%o4
	subc	%g3,	%i6,	%l5
	xorcc	%o6,	0x1328,	%i5
	fmovsa	%icc,	%f14,	%f29
	udivx	%g5,	0x03FF,	%i3
	umul	%g4,	0x0144,	%l6
	movcs	%xcc,	%i0,	%o2
	sub	%o1,	%l2,	%l1
	edge16l	%l0,	%i1,	%g7
	udivcc	%l4,	0x1BCF,	%i7
	edge16l	%o3,	%g6,	%o0
	sllx	%o7,	%l3,	%i4
	mulscc	%i2,	0x10EE,	%o5
	std	%f24,	[%l7 + 0x48]
	orn	%g2,	%g1,	%o4
	edge32ln	%i6,	%g3,	%o6
	fmovsneg	%xcc,	%f22,	%f25
	edge16ln	%l5,	%i5,	%g5
	movvs	%icc,	%i3,	%g4
	fnor	%f22,	%f30,	%f2
	movleu	%xcc,	%l6,	%i0
	stw	%o2,	[%l7 + 0x34]
	movn	%icc,	%o1,	%l1
	movn	%icc,	%l0,	%i1
	array16	%l2,	%l4,	%i7
	fmovdne	%icc,	%f13,	%f24
	edge8	%g7,	%g6,	%o3
	nop
	set	0x24, %l6
	stw	%o0,	[%l7 + %l6]
	fmul8x16au	%f28,	%f29,	%f0
	fmul8sux16	%f10,	%f0,	%f10
	orn	%o7,	%i4,	%l3
	edge16	%o5,	%g2,	%g1
	fmovdg	%icc,	%f2,	%f1
	pdist	%f8,	%f4,	%f2
	array32	%i2,	%i6,	%g3
	xnorcc	%o6,	0x1FEA,	%o4
	array16	%i5,	%l5,	%g5
	fmovrsgz	%i3,	%f28,	%f24
	movg	%xcc,	%l6,	%g4
	andcc	%i0,	0x075A,	%o1
	movg	%xcc,	%o2,	%l1
	fmovda	%xcc,	%f22,	%f21
	sdiv	%i1,	0x15E0,	%l0
	movvs	%icc,	%l2,	%l4
	movcs	%icc,	%g7,	%i7
	fandnot2s	%f12,	%f4,	%f29
	edge32n	%o3,	%o0,	%g6
	fmovrde	%o7,	%f16,	%f2
	save %l3, 0x05FC, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o5,	%g2
	lduh	[%l7 + 0x5E],	%i2
	edge16ln	%i6,	%g3,	%o6
	fmovdcc	%icc,	%f29,	%f23
	ld	[%l7 + 0x10],	%f26
	fmovs	%f24,	%f24
	ldd	[%l7 + 0x68],	%g0
	popc	0x1D87,	%o4
	subc	%l5,	%g5,	%i5
	fnot1	%f0,	%f0
	movneg	%icc,	%l6,	%i3
	movrne	%g4,	0x165,	%o1
	edge8l	%o2,	%l1,	%i1
	sll	%i0,	%l2,	%l4
	srl	%g7,	0x1C,	%i7
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fpsub32s	%f12,	%f23,	%f14
	fpadd16s	%f30,	%f3,	%f17
	fnor	%f4,	%f16,	%f18
	fxnors	%f0,	%f9,	%f30
	fmovse	%xcc,	%f6,	%f7
	fandnot2	%f0,	%f0,	%f12
	andncc	%g6,	%o0,	%o7
	move	%icc,	%l3,	%o5
	movrlez	%g2,	0x0F3,	%i2
	ldd	[%l7 + 0x60],	%i6
	movrlez	%g3,	0x153,	%i4
	sethi	0x1A72,	%g1
	fmovrsgz	%o6,	%f13,	%f22
	ld	[%l7 + 0x48],	%f7
	alignaddr	%l5,	%g5,	%o4
	sth	%i5,	[%l7 + 0x2E]
	mulscc	%i3,	0x1A95,	%g4
	addc	%o1,	0x0889,	%o2
	orncc	%l6,	0x15BF,	%l1
	movg	%icc,	%i0,	%i1
	edge8n	%l4,	%g7,	%i7
	fnor	%f6,	%f4,	%f14
	ldsh	[%l7 + 0x7C],	%l2
	edge16n	%l0,	%o3,	%g6
	subcc	%o7,	0x07AD,	%l3
	fcmpeq32	%f26,	%f14,	%o5
	edge8ln	%o0,	%i2,	%i6
	ldsw	[%l7 + 0x50],	%g2
	stw	%g3,	[%l7 + 0x70]
	sub	%g1,	%o6,	%l5
	xor	%i4,	0x1F9E,	%g5
	ld	[%l7 + 0x48],	%f3
	fmovdg	%icc,	%f4,	%f18
	fzeros	%f24
	movge	%icc,	%o4,	%i5
	movne	%xcc,	%g4,	%o1
	subc	%o2,	0x001B,	%i3
	edge8	%l1,	%l6,	%i0
	sll	%i1,	0x0F,	%l4
	fmovsgu	%xcc,	%f11,	%f23
	fxors	%f19,	%f26,	%f0
	stb	%i7,	[%l7 + 0x39]
	movvs	%icc,	%l2,	%g7
	movge	%xcc,	%o3,	%l0
	stx	%o7,	[%l7 + 0x48]
	mulscc	%l3,	%o5,	%o0
	fnands	%f4,	%f31,	%f25
	fands	%f2,	%f21,	%f15
	edge16l	%i2,	%g6,	%g2
	alignaddrl	%g3,	%g1,	%i6
	edge16ln	%l5,	%i4,	%g5
	alignaddrl	%o4,	%o6,	%i5
	sethi	0x18B3,	%o1
	sub	%o2,	0x1993,	%g4
	movl	%xcc,	%i3,	%l6
	save %l1, %i1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i7, %l4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0F8F,	%o3
	save %l0, 0x16B4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x38],	%l3
	sllx	%o7,	%o0,	%o5
	xorcc	%i2,	%g6,	%g2
	mulx	%g3,	0x0D48,	%g1
	edge32n	%i6,	%i4,	%l5
	movge	%icc,	%o4,	%o6
	lduh	[%l7 + 0x2E],	%i5
	array8	%o1,	%g5,	%o2
	movn	%xcc,	%g4,	%l6
	fmovdvs	%xcc,	%f26,	%f16
	edge16l	%i3,	%l1,	%i1
	movrgz	%i7,	%l4,	%g7
	move	%xcc,	%o3,	%i0
	fcmpeq16	%f26,	%f12,	%l0
	or	%l3,	%o7,	%l2
	andn	%o0,	0x181E,	%i2
	sir	0x0A79
	edge16n	%o5,	%g6,	%g2
	movrne	%g1,	0x20F,	%i6
	sth	%g3,	[%l7 + 0x42]
	andncc	%l5,	%o4,	%i4
	edge16	%i5,	%o6,	%o1
	addc	%o2,	%g5,	%l6
	fmovdcs	%icc,	%f7,	%f3
	fnor	%f28,	%f18,	%f26
	xor	%g4,	%i3,	%i1
	ldsb	[%l7 + 0x28],	%i7
	addcc	%l1,	0x0029,	%l4
	fandnot2s	%f25,	%f11,	%f19
	nop
	set	0x54, %o3
	stw	%o3,	[%l7 + %o3]
	alignaddr	%i0,	%g7,	%l0
	udiv	%o7,	0x110C,	%l3
	edge16n	%o0,	%i2,	%l2
	fcmps	%fcc3,	%f14,	%f22
	sdiv	%o5,	0x0BF0,	%g2
	fmovrdgez	%g6,	%f24,	%f16
	fmovdvc	%icc,	%f16,	%f1
	fabss	%f5,	%f13
	udivx	%g1,	0x14C3,	%g3
	orn	%i6,	0x0B1A,	%o4
	lduh	[%l7 + 0x78],	%l5
	addc	%i5,	%o6,	%o1
	fmovrde	%i4,	%f30,	%f24
	orn	%o2,	0x0A65,	%l6
	stb	%g5,	[%l7 + 0x6C]
	udivcc	%g4,	0x0ACF,	%i1
	fmul8ulx16	%f22,	%f6,	%f4
	edge32l	%i3,	%l1,	%i7
	fcmpd	%fcc1,	%f30,	%f28
	sub	%l4,	%o3,	%i0
	sra	%g7,	%o7,	%l0
	udivx	%o0,	0x0D40,	%i2
	fcmps	%fcc1,	%f10,	%f17
	movl	%icc,	%l3,	%l2
	movcc	%xcc,	%o5,	%g6
	array16	%g2,	%g1,	%i6
	sra	%o4,	%l5,	%i5
	movcs	%icc,	%g3,	%o1
	stx	%o6,	[%l7 + 0x40]
	sll	%i4,	0x15,	%o2
	movrgez	%g5,	%l6,	%i1
	fmovde	%icc,	%f2,	%f20
	sdivcc	%i3,	0x1C8E,	%g4
	stb	%i7,	[%l7 + 0x6C]
	edge8ln	%l4,	%l1,	%i0
	popc	0x1127,	%o3
	ldub	[%l7 + 0x62],	%g7
	add	%l0,	%o7,	%o0
	movl	%xcc,	%l3,	%l2
	fpadd32s	%f1,	%f27,	%f3
	subccc	%o5,	0x110F,	%g6
	array16	%g2,	%g1,	%i2
	bshuffle	%f20,	%f2,	%f2
	smul	%i6,	0x1FB4,	%o4
	orcc	%l5,	0x06D7,	%g3
	edge32l	%i5,	%o1,	%i4
	fmovsvs	%xcc,	%f10,	%f18
	srax	%o2,	0x19,	%o6
	movcc	%icc,	%l6,	%g5
	fmovsvc	%xcc,	%f29,	%f23
	alignaddrl	%i3,	%g4,	%i1
	fnors	%f12,	%f14,	%f21
	addcc	%l4,	0x1FE5,	%l1
	mulscc	%i7,	0x0FD3,	%i0
	srl	%g7,	0x1D,	%o3
	add	%o7,	0x0B59,	%l0
	edge16	%o0,	%l3,	%l2
	fxors	%f16,	%f19,	%f24
	move	%icc,	%o5,	%g2
	movleu	%icc,	%g6,	%i2
	addcc	%g1,	0x0AD7,	%o4
	xorcc	%i6,	0x19E9,	%l5
	or	%i5,	0x1917,	%g3
	fmovdcs	%xcc,	%f22,	%f28
	subccc	%i4,	0x1773,	%o2
	movn	%icc,	%o1,	%l6
	srl	%o6,	0x0F,	%g5
	sll	%i3,	%g4,	%l4
	smul	%l1,	%i1,	%i0
	alignaddrl	%i7,	%o3,	%o7
	subcc	%l0,	0x000F,	%o0
	udivcc	%g7,	0x1A84,	%l2
	fabss	%f21,	%f28
	fnot1s	%f31,	%f17
	sethi	0x0681,	%l3
	fmovdgu	%xcc,	%f23,	%f12
	addcc	%g2,	%g6,	%i2
	save %o5, 0x02A5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g1,	%i6,	%l5
	movg	%xcc,	%i5,	%i4
	movrlez	%o2,	0x055,	%o1
	array8	%g3,	%o6,	%l6
	mova	%icc,	%i3,	%g4
	fmovrsne	%l4,	%f22,	%f17
	movg	%xcc,	%l1,	%i1
	fmovrde	%g5,	%f26,	%f26
	ldd	[%l7 + 0x20],	%i6
	edge32l	%o3,	%i0,	%l0
	movge	%icc,	%o7,	%g7
	fzeros	%f13
	movleu	%xcc,	%o0,	%l2
	edge16n	%l3,	%g6,	%i2
	edge32	%g2,	%o4,	%g1
	edge16	%o5,	%l5,	%i5
	movl	%icc,	%i4,	%i6
	addc	%o1,	%g3,	%o6
	edge8	%l6,	%o2,	%g4
	movne	%xcc,	%l4,	%i3
	subccc	%l1,	0x0249,	%g5
	fandnot2s	%f22,	%f1,	%f31
	fpsub16	%f14,	%f20,	%f6
	array8	%i7,	%o3,	%i1
	smulcc	%l0,	0x0BBD,	%o7
	stb	%g7,	[%l7 + 0x23]
	fnot1	%f16,	%f26
	nop
	set	0x6F, %o5
	ldub	[%l7 + %o5],	%o0
	edge32n	%l2,	%l3,	%g6
	movpos	%xcc,	%i0,	%g2
	popc	0x16CC,	%o4
	stw	%i2,	[%l7 + 0x2C]
	alignaddrl	%g1,	%l5,	%o5
	smul	%i4,	0x1806,	%i6
	alignaddr	%o1,	%g3,	%i5
	fmovdgu	%xcc,	%f22,	%f25
	fcmps	%fcc0,	%f14,	%f2
	ldd	[%l7 + 0x58],	%o6
	fornot2	%f4,	%f30,	%f16
	ldub	[%l7 + 0x49],	%l6
	array32	%g4,	%o2,	%i3
	xorcc	%l1,	0x18AD,	%l4
	ldx	[%l7 + 0x78],	%i7
	umulcc	%o3,	0x1BD7,	%g5
	orn	%i1,	%o7,	%l0
	movrlez	%o0,	0x335,	%l2
	ldd	[%l7 + 0x50],	%f16
	fxnor	%f2,	%f26,	%f8
	ldx	[%l7 + 0x28],	%g7
	fmovrdgez	%l3,	%f0,	%f18
	save %i0, %g2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%xcc,	%f6,	%f16
	movre	%i2,	%o4,	%g1
	array32	%l5,	%o5,	%i6
	movge	%icc,	%o1,	%i4
	ldub	[%l7 + 0x1E],	%i5
	andncc	%g3,	%l6,	%o6
	smulcc	%o2,	%i3,	%g4
	fornot1s	%f12,	%f9,	%f20
	stw	%l4,	[%l7 + 0x34]
	stw	%l1,	[%l7 + 0x70]
	add	%o3,	0x1E56,	%g5
	save %i7, 0x1C8B, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l0,	0x16C1,	%o7
	udiv	%l2,	0x0FAF,	%o0
	movleu	%xcc,	%l3,	%i0
	movl	%xcc,	%g2,	%g6
	sub	%g7,	0x1BF5,	%o4
	add	%i2,	0x0B1F,	%l5
	fcmpne32	%f22,	%f30,	%g1
	lduw	[%l7 + 0x30],	%o5
	alignaddrl	%i6,	%i4,	%o1
	edge32	%g3,	%i5,	%o6
	orn	%o2,	0x0112,	%l6
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	fmovsvs	%icc,	%f3,	%f29
	popc	0x0295,	%o3
	array32	%g5,	%i7,	%i1
	orncc	%l0,	%o7,	%l2
	fpack16	%f14,	%f17
	fpadd32s	%f26,	%f21,	%f18
	edge32ln	%g4,	%l3,	%i0
	movge	%xcc,	%o0,	%g2
	fmovsn	%xcc,	%f26,	%f27
	edge16n	%g6,	%o4,	%i2
	ldub	[%l7 + 0x21],	%l5
	smulcc	%g7,	0x1851,	%g1
	nop
	set	0x2C, %l0
	ldsw	[%l7 + %l0],	%o5
	movrgz	%i6,	0x251,	%o1
	sllx	%g3,	0x0B,	%i5
	array16	%o6,	%i4,	%o2
	movg	%icc,	%l6,	%l4
	srlx	%l1,	0x05,	%i3
	movl	%icc,	%o3,	%i7
	movge	%xcc,	%g5,	%l0
	fmovrde	%o7,	%f2,	%f24
	mulx	%i1,	%g4,	%l2
	nop
	set	0x18, %i6
	ldx	[%l7 + %i6],	%l3
	smul	%i0,	0x0AD2,	%o0
	array16	%g2,	%o4,	%i2
	movcs	%icc,	%g6,	%l5
	andcc	%g7,	0x05DE,	%g1
	edge16l	%o5,	%o1,	%g3
	save %i5, %o6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i6,	%o2
	popc	0x0B27,	%l6
	edge8	%l1,	%i3,	%l4
	st	%f3,	[%l7 + 0x48]
	ldsw	[%l7 + 0x50],	%o3
	srl	%i7,	0x0B,	%g5
	umul	%l0,	0x151D,	%i1
	ld	[%l7 + 0x34],	%f26
	fcmpgt32	%f26,	%f10,	%o7
	popc	%l2,	%l3
	smulcc	%g4,	0x004B,	%o0
	lduh	[%l7 + 0x7A],	%g2
	ld	[%l7 + 0x44],	%f21
	edge8n	%o4,	%i2,	%i0
	smul	%g6,	0x0CF6,	%g7
	edge8n	%l5,	%o5,	%o1
	std	%f18,	[%l7 + 0x60]
	mova	%xcc,	%g3,	%i5
	movneg	%icc,	%o6,	%i4
	edge16n	%i6,	%g1,	%o2
	stb	%l1,	[%l7 + 0x2A]
	move	%icc,	%i3,	%l4
	fpmerge	%f17,	%f14,	%f4
	fsrc2	%f14,	%f6
	fmovdg	%icc,	%f25,	%f2
	ldd	[%l7 + 0x58],	%o2
	ldub	[%l7 + 0x0C],	%l6
	subccc	%i7,	%l0,	%i1
	umul	%o7,	%g5,	%l2
	stw	%l3,	[%l7 + 0x14]
	udiv	%g4,	0x005F,	%g2
	mova	%xcc,	%o4,	%o0
	lduh	[%l7 + 0x24],	%i2
	movn	%xcc,	%g6,	%i0
	sdivcc	%l5,	0x1B28,	%g7
	movgu	%xcc,	%o1,	%o5
	movrlez	%g3,	0x1A1,	%o6
	movvc	%icc,	%i4,	%i6
	or	%g1,	%o2,	%i5
	fabss	%f29,	%f30
	movcc	%xcc,	%l1,	%l4
	umulcc	%i3,	%l6,	%o3
	fandnot2s	%f30,	%f27,	%f2
	edge8n	%l0,	%i7,	%o7
	sll	%i1,	%g5,	%l3
	xnor	%l2,	%g2,	%g4
	andcc	%o4,	%i2,	%o0
	xorcc	%i0,	0x0B8D,	%l5
	move	%xcc,	%g6,	%g7
	smulcc	%o1,	0x14FD,	%g3
	sll	%o6,	%i4,	%i6
	fnor	%f10,	%f6,	%f22
	st	%f13,	[%l7 + 0x70]
	srl	%g1,	0x10,	%o2
	fones	%f31
	add	%i5,	%l1,	%l4
	fornot2s	%f3,	%f22,	%f17
	movg	%xcc,	%o5,	%i3
	ldub	[%l7 + 0x49],	%l6
	fcmpgt16	%f22,	%f20,	%o3
	array32	%l0,	%o7,	%i7
	movpos	%icc,	%g5,	%i1
	sub	%l3,	0x08BE,	%l2
	fmul8x16au	%f25,	%f11,	%f14
	udiv	%g2,	0x194C,	%g4
	fmul8sux16	%f20,	%f26,	%f22
	stb	%i2,	[%l7 + 0x1C]
	sth	%o4,	[%l7 + 0x18]
	umulcc	%i0,	0x125A,	%l5
	sra	%o0,	%g6,	%o1
	movneg	%xcc,	%g7,	%o6
	ldd	[%l7 + 0x58],	%f0
	edge32ln	%g3,	%i4,	%g1
	addccc	%o2,	0x0305,	%i6
	movvs	%icc,	%l1,	%i5
	stb	%l4,	[%l7 + 0x10]
	orcc	%o5,	%i3,	%o3
	or	%l0,	0x0A12,	%l6
	movg	%icc,	%i7,	%g5
	fmovrsgez	%i1,	%f28,	%f11
	addccc	%o7,	0x1577,	%l2
	or	%g2,	0x08D9,	%g4
	umulcc	%l3,	0x19A8,	%o4
	edge16n	%i0,	%l5,	%i2
	fnor	%f20,	%f24,	%f28
	movge	%icc,	%o0,	%o1
	movpos	%icc,	%g7,	%g6
	movcs	%xcc,	%o6,	%i4
	movg	%icc,	%g3,	%g1
	fmovrslz	%i6,	%f26,	%f31
	movl	%xcc,	%l1,	%i5
	mulscc	%l4,	0x0BD9,	%o5
	fxors	%f26,	%f7,	%f28
	movne	%xcc,	%i3,	%o3
	fnegs	%f31,	%f29
	movn	%icc,	%o2,	%l0
	orcc	%l6,	%i7,	%i1
	edge32l	%g5,	%o7,	%l2
	ld	[%l7 + 0x38],	%f14
	add	%g2,	0x0307,	%g4
	alignaddrl	%l3,	%i0,	%l5
	edge32n	%o4,	%o0,	%o1
	edge16	%i2,	%g6,	%g7
	umul	%i4,	0x1CF7,	%g3
	srlx	%o6,	%i6,	%g1
	sra	%i5,	0x14,	%l4
	nop
	set	0x14, %o2
	lduw	[%l7 + %o2],	%l1
	stw	%i3,	[%l7 + 0x58]
	sdiv	%o3,	0x04D7,	%o5
	ldsw	[%l7 + 0x38],	%l0
	fmovdvc	%icc,	%f0,	%f25
	fcmpeq16	%f18,	%f22,	%o2
	srl	%l6,	%i7,	%g5
	subccc	%i1,	0x17E6,	%o7
	umulcc	%l2,	0x0CF1,	%g4
	movcc	%xcc,	%g2,	%l3
	movrne	%i0,	0x041,	%l5
	fcmpeq16	%f28,	%f28,	%o4
	sdiv	%o0,	0x1D19,	%o1
	movre	%i2,	0x007,	%g7
	edge32	%g6,	%g3,	%o6
	or	%i6,	%i4,	%i5
	sethi	0x1837,	%g1
	subccc	%l1,	0x0561,	%i3
	sra	%o3,	%l4,	%o5
	fmovrsne	%l0,	%f23,	%f8
	subccc	%l6,	%i7,	%g5
	udivx	%o2,	0x1DB8,	%o7
	alignaddr	%l2,	%g4,	%i1
	edge32l	%l3,	%i0,	%l5
	fmovrsne	%o4,	%f30,	%f14
	udivx	%g2,	0x0EE9,	%o0
	edge8l	%i2,	%o1,	%g7
	movre	%g6,	%o6,	%i6
	fmuld8sux16	%f6,	%f18,	%f22
	orn	%g3,	0x00EA,	%i4
	orncc	%g1,	0x1484,	%i5
	fmovda	%icc,	%f31,	%f19
	movl	%icc,	%l1,	%o3
	movrlez	%l4,	%i3,	%o5
	fmovdvc	%icc,	%f20,	%f2
	movleu	%icc,	%l6,	%l0
	fnot1s	%f23,	%f7
	movne	%icc,	%i7,	%g5
	movneg	%xcc,	%o2,	%o7
	sethi	0x1F8C,	%g4
	fmovsge	%icc,	%f26,	%f21
	array16	%l2,	%l3,	%i1
	fabss	%f8,	%f16
	array8	%i0,	%o4,	%g2
	srlx	%o0,	%i2,	%o1
	addcc	%l5,	0x05CA,	%g7
	and	%g6,	%i6,	%o6
	movpos	%xcc,	%i4,	%g3
	movrne	%g1,	0x228,	%l1
	srlx	%o3,	0x00,	%i5
	udivx	%l4,	0x1628,	%i3
	movrgez	%o5,	%l6,	%l0
	fmovsg	%icc,	%f20,	%f3
	sth	%i7,	[%l7 + 0x26]
	fmovd	%f22,	%f14
	movrgz	%o2,	0x2DD,	%g5
	srlx	%g4,	0x12,	%o7
	movcs	%xcc,	%l2,	%l3
	ldd	[%l7 + 0x50],	%i0
	sdivcc	%o4,	0x011D,	%i0
	ldd	[%l7 + 0x40],	%g2
	movne	%xcc,	%i2,	%o0
	edge16n	%o1,	%l5,	%g7
	movge	%icc,	%i6,	%o6
	fxors	%f17,	%f8,	%f20
	addcc	%i4,	%g6,	%g1
	movge	%xcc,	%l1,	%g3
	srlx	%o3,	0x0A,	%i5
	srax	%i3,	%l4,	%l6
	movgu	%xcc,	%o5,	%i7
	udivx	%o2,	0x13A9,	%g5
	or	%g4,	0x15F7,	%l0
	fmovdle	%icc,	%f12,	%f19
	fmovdgu	%icc,	%f10,	%f6
	lduh	[%l7 + 0x1A],	%o7
	fnot1	%f0,	%f24
	nop
	set	0x76, %l1
	ldsb	[%l7 + %l1],	%l2
	lduh	[%l7 + 0x10],	%l3
	ldub	[%l7 + 0x6E],	%i1
	edge8	%o4,	%g2,	%i2
	ldx	[%l7 + 0x50],	%o0
	movle	%icc,	%i0,	%o1
	sir	0x0F86
	andncc	%g7,	%l5,	%o6
	faligndata	%f18,	%f6,	%f24
	movrgez	%i6,	%i4,	%g1
	fnegs	%f19,	%f8
	xorcc	%g6,	%g3,	%o3
	edge32ln	%l1,	%i3,	%i5
	lduw	[%l7 + 0x68],	%l6
	movrlz	%o5,	%l4,	%i7
	addc	%g5,	%g4,	%l0
	fabsd	%f4,	%f10
	fpadd32	%f30,	%f14,	%f26
	stx	%o2,	[%l7 + 0x38]
	movgu	%xcc,	%l2,	%l3
	stx	%o7,	[%l7 + 0x10]
	fnot1s	%f23,	%f9
	ldsb	[%l7 + 0x78],	%i1
	andncc	%o4,	%i2,	%o0
	edge16n	%g2,	%i0,	%g7
	lduw	[%l7 + 0x20],	%o1
	xnor	%l5,	%i6,	%o6
	fcmpeq16	%f8,	%f16,	%g1
	andn	%i4,	0x0B29,	%g6
	xnorcc	%o3,	0x0E44,	%g3
	st	%f15,	[%l7 + 0x68]
	fors	%f24,	%f13,	%f22
	stb	%i3,	[%l7 + 0x2A]
	subcc	%l1,	0x17A0,	%l6
	nop
	set	0x64, %g6
	sth	%i5,	[%l7 + %g6]
	array8	%l4,	%i7,	%g5
	restore %o5, 0x0401, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f0,	%f6
	fornot1	%f22,	%f20,	%f18
	edge8	%o2,	%l0,	%l2
	fzeros	%f4
	addcc	%o7,	%l3,	%o4
	fnors	%f17,	%f19,	%f10
	std	%f2,	[%l7 + 0x78]
	smul	%i1,	%i2,	%o0
	umul	%g2,	%g7,	%i0
	lduw	[%l7 + 0x44],	%l5
	xnorcc	%o1,	0x093F,	%i6
	movpos	%xcc,	%g1,	%o6
	popc	%g6,	%i4
	edge32l	%g3,	%i3,	%l1
	sir	0x0FE7
	add	%o3,	%l6,	%l4
	movre	%i7,	0x36B,	%g5
	xnor	%i5,	0x091E,	%g4
	movvc	%icc,	%o2,	%l0
	edge32ln	%l2,	%o7,	%l3
	stx	%o5,	[%l7 + 0x28]
	fmovsne	%xcc,	%f1,	%f13
	move	%xcc,	%i1,	%i2
	save %o0, %g2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i0,	%o4,	%o1
	movvc	%xcc,	%i6,	%l5
	movcc	%icc,	%g1,	%o6
	fmovsg	%icc,	%f7,	%f2
	movvc	%xcc,	%g6,	%g3
	addccc	%i3,	%l1,	%i4
	sethi	0x1A8A,	%o3
	siam	0x0
	edge32	%l4,	%i7,	%l6
	alignaddrl	%i5,	%g5,	%o2
	movn	%xcc,	%g4,	%l0
	umul	%o7,	%l2,	%o5
	ld	[%l7 + 0x78],	%f30
	movrlez	%i1,	%i2,	%o0
	umul	%l3,	%g7,	%i0
	ldx	[%l7 + 0x68],	%o4
	fmovdleu	%xcc,	%f17,	%f7
	edge16	%o1,	%i6,	%g2
	nop
	set	0x0C, %i2
	ldsw	[%l7 + %i2],	%l5
	stx	%g1,	[%l7 + 0x28]
	movge	%xcc,	%g6,	%o6
	fmovsvc	%icc,	%f29,	%f24
	umul	%i3,	0x0405,	%g3
	fors	%f16,	%f20,	%f13
	array8	%i4,	%o3,	%l4
	faligndata	%f8,	%f14,	%f26
	nop
	set	0x40, %i4
	ldx	[%l7 + %i4],	%l1
	movn	%icc,	%l6,	%i5
	edge16n	%g5,	%o2,	%i7
	edge16ln	%g4,	%l0,	%l2
	edge32l	%o7,	%o5,	%i1
	array16	%o0,	%i2,	%g7
	xnorcc	%i0,	0x1ECE,	%o4
	movneg	%xcc,	%l3,	%o1
	fmovrslz	%g2,	%f11,	%f29
	udivcc	%l5,	0x04A6,	%i6
	xnor	%g1,	0x0EB2,	%o6
	stx	%i3,	[%l7 + 0x08]
	or	%g3,	%g6,	%i4
	orncc	%l4,	%o3,	%l1
	fpsub32	%f26,	%f14,	%f2
	fornot1	%f22,	%f18,	%f2
	sth	%l6,	[%l7 + 0x1A]
	ldx	[%l7 + 0x50],	%i5
	st	%f7,	[%l7 + 0x50]
	fnot2	%f18,	%f20
	fcmpeq16	%f16,	%f6,	%g5
	umulcc	%i7,	0x1C04,	%o2
	subc	%l0,	0x029E,	%g4
	fnot1s	%f5,	%f2
	edge16n	%l2,	%o7,	%o5
	mulscc	%o0,	0x08BC,	%i2
	fmovdneg	%icc,	%f12,	%f2
	fmovrdgez	%i1,	%f24,	%f16
	sra	%g7,	0x19,	%o4
	lduh	[%l7 + 0x70],	%i0
	sethi	0x015A,	%o1
	srax	%l3,	%g2,	%l5
	fmovdge	%xcc,	%f9,	%f21
	fmovdgu	%xcc,	%f14,	%f16
	fones	%f5
	and	%g1,	0x075E,	%i6
	alignaddrl	%o6,	%i3,	%g6
	array16	%g3,	%i4,	%l4
	subccc	%l1,	0x0D7A,	%o3
	movrlez	%l6,	%i5,	%i7
	fcmpne32	%f26,	%f16,	%o2
	fcmps	%fcc1,	%f16,	%f19
	movrgz	%g5,	0x2AE,	%l0
	movrgez	%g4,	%l2,	%o5
	fmul8sux16	%f18,	%f6,	%f4
	mulx	%o0,	%i2,	%o7
	orn	%i1,	0x13E2,	%o4
	fnands	%f5,	%f25,	%f17
	ldub	[%l7 + 0x38],	%g7
	edge16l	%o1,	%l3,	%i0
	umul	%g2,	%l5,	%i6
	sllx	%o6,	%g1,	%g6
	subc	%i3,	0x0760,	%g3
	fandnot2s	%f11,	%f17,	%f4
	fmovsvc	%icc,	%f28,	%f7
	alignaddr	%i4,	%l1,	%o3
	movcs	%xcc,	%l6,	%i5
	sub	%i7,	0x1162,	%l4
	alignaddr	%o2,	%l0,	%g4
	add	%g5,	%l2,	%o0
	fcmpne16	%f18,	%f14,	%o5
	ldd	[%l7 + 0x38],	%f16
	edge32l	%i2,	%o7,	%i1
	array32	%g7,	%o1,	%o4
	faligndata	%f26,	%f0,	%f26
	movn	%xcc,	%i0,	%l3
	movge	%xcc,	%l5,	%i6
	andncc	%o6,	%g2,	%g1
	fors	%f14,	%f22,	%f26
	sllx	%i3,	0x1C,	%g6
	xnorcc	%g3,	0x0FE1,	%i4
	fabss	%f22,	%f26
	fcmpne16	%f4,	%f4,	%o3
	movrne	%l1,	%i5,	%l6
	movcc	%icc,	%i7,	%o2
	lduh	[%l7 + 0x64],	%l0
	subcc	%l4,	0x0021,	%g5
	fnot2s	%f0,	%f20
	edge32l	%g4,	%l2,	%o0
	edge16ln	%i2,	%o7,	%i1
	edge16l	%o5,	%g7,	%o4
	fornot1	%f28,	%f18,	%f0
	fmovdge	%icc,	%f10,	%f28
	edge8l	%i0,	%o1,	%l5
	fmovrsgz	%i6,	%f3,	%f19
	fmovs	%f7,	%f21
	xor	%o6,	%g2,	%g1
	udivx	%i3,	0x0A2F,	%g6
	mulx	%g3,	0x03E6,	%l3
	fmovs	%f8,	%f16
	edge8n	%o3,	%i4,	%i5
	fcmped	%fcc1,	%f14,	%f26
	alignaddr	%l1,	%l6,	%i7
	sdivx	%l0,	0x0CB7,	%o2
	fzero	%f4
	ldx	[%l7 + 0x08],	%g5
	fnand	%f14,	%f30,	%f18
	fmovdcs	%xcc,	%f13,	%f20
	alignaddr	%l4,	%l2,	%o0
	edge8n	%g4,	%o7,	%i2
	movgu	%icc,	%o5,	%i1
	movrlez	%o4,	%g7,	%o1
	movvs	%icc,	%l5,	%i0
	movn	%icc,	%o6,	%g2
	xorcc	%i6,	0x16BF,	%i3
	lduh	[%l7 + 0x38],	%g1
	fornot2	%f12,	%f14,	%f12
	add	%g3,	0x0B8E,	%g6
	ld	[%l7 + 0x38],	%f24
	or	%l3,	0x16FE,	%o3
	edge8	%i4,	%i5,	%l1
	movgu	%xcc,	%i7,	%l6
	umulcc	%l0,	%o2,	%l4
	movrne	%l2,	%o0,	%g5
	fmovsg	%icc,	%f9,	%f27
	edge32ln	%g4,	%i2,	%o7
	alignaddr	%o5,	%o4,	%g7
	ld	[%l7 + 0x78],	%f27
	sllx	%i1,	%l5,	%i0
	sdivx	%o6,	0x0036,	%g2
	edge32ln	%o1,	%i3,	%i6
	fmovdle	%xcc,	%f23,	%f3
	lduh	[%l7 + 0x46],	%g1
	fnors	%f31,	%f11,	%f21
	orn	%g6,	%g3,	%o3
	ldsb	[%l7 + 0x25],	%l3
	movre	%i5,	%i4,	%l1
	movrlz	%l6,	0x1A2,	%i7
	smul	%l0,	0x02E6,	%o2
	sub	%l2,	0x0155,	%o0
	xor	%l4,	%g4,	%i2
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	addcc	%o4,	%o5,	%i1
	andcc	%g7,	%l5,	%o6
	fcmpgt16	%f18,	%f28,	%g2
	edge8	%i0,	%o1,	%i6
	sll	%i3,	%g6,	%g3
	smulcc	%o3,	%l3,	%i5
	xnorcc	%g1,	%i4,	%l6
	bshuffle	%f16,	%f0,	%f2
	array16	%l1,	%l0,	%o2
	fabss	%f30,	%f16
	fxor	%f2,	%f8,	%f18
	ldx	[%l7 + 0x78],	%l2
	fmovrsgez	%o0,	%f17,	%f26
	xor	%i7,	0x1A99,	%l4
	movn	%icc,	%g4,	%o7
	movn	%xcc,	%i2,	%g5
	movneg	%icc,	%o5,	%i1
	fmovsvs	%icc,	%f12,	%f4
	edge8n	%g7,	%o4,	%o6
	edge8	%g2,	%l5,	%o1
	movge	%icc,	%i0,	%i6
	andcc	%g6,	0x03E6,	%i3
	edge8	%o3,	%g3,	%l3
	fpadd16	%f18,	%f12,	%f28
	bshuffle	%f8,	%f12,	%f28
	movrlez	%g1,	%i5,	%i4
	edge16	%l1,	%l0,	%o2
	popc	%l6,	%l2
	addccc	%i7,	0x1362,	%o0
	srl	%g4,	0x1D,	%o7
	sub	%l4,	%g5,	%i2
	ldd	[%l7 + 0x20],	%i0
	movrlez	%g7,	0x3E2,	%o4
	xnor	%o6,	%o5,	%g2
	movre	%o1,	0x2D4,	%i0
	movrgz	%l5,	%i6,	%i3
	sub	%o3,	0x0B39,	%g3
	udiv	%g6,	0x0153,	%g1
	orn	%i5,	%l3,	%i4
	sra	%l0,	0x1C,	%l1
	edge16	%o2,	%l6,	%l2
	orncc	%o0,	%i7,	%o7
	movrgez	%g4,	%g5,	%l4
	fnand	%f16,	%f24,	%f22
	array32	%i1,	%i2,	%g7
	orn	%o6,	0x1999,	%o4
	fcmpd	%fcc0,	%f2,	%f30
	ldsw	[%l7 + 0x68],	%g2
	bshuffle	%f4,	%f0,	%f18
	movrgz	%o5,	0x0A8,	%o1
	sra	%l5,	0x0C,	%i0
	edge8ln	%i6,	%o3,	%g3
	move	%icc,	%i3,	%g6
	array16	%g1,	%l3,	%i5
	sll	%l0,	0x0F,	%i4
	edge8ln	%o2,	%l6,	%l2
	movcc	%icc,	%o0,	%i7
	movgu	%xcc,	%o7,	%g4
	array8	%l1,	%l4,	%i1
	ldx	[%l7 + 0x18],	%g5
	fsrc1	%f4,	%f22
	array8	%i2,	%o6,	%g7
	movl	%xcc,	%g2,	%o4
	fxor	%f14,	%f4,	%f4
	fexpand	%f25,	%f24
	fandnot1	%f6,	%f4,	%f16
	move	%icc,	%o1,	%l5
	move	%xcc,	%o5,	%i0
	add	%i6,	0x159F,	%g3
	fmovde	%xcc,	%f11,	%f19
	fornot1	%f26,	%f14,	%f4
	sth	%o3,	[%l7 + 0x08]
	fabsd	%f14,	%f26
	stw	%g6,	[%l7 + 0x78]
	movvc	%xcc,	%i3,	%l3
	movge	%icc,	%g1,	%l0
	movne	%xcc,	%i5,	%i4
	fpsub16s	%f5,	%f11,	%f30
	ldub	[%l7 + 0x47],	%l6
	fcmps	%fcc1,	%f1,	%f6
	ldub	[%l7 + 0x3C],	%o2
	lduh	[%l7 + 0x44],	%l2
	edge16ln	%i7,	%o7,	%o0
	orcc	%g4,	%l4,	%l1
	fsrc2	%f28,	%f6
	movcs	%xcc,	%g5,	%i2
	movrgez	%o6,	0x0C3,	%i1
	sll	%g2,	0x0C,	%o4
	edge16n	%g7,	%l5,	%o5
	mulscc	%i0,	0x023D,	%i6
	edge8ln	%g3,	%o3,	%o1
	movrgz	%g6,	0x1AF,	%l3
	lduw	[%l7 + 0x70],	%i3
	andncc	%g1,	%i5,	%l0
	sdivx	%l6,	0x1754,	%o2
	addccc	%i4,	%i7,	%l2
	fpadd16	%f18,	%f12,	%f8
	mova	%icc,	%o0,	%o7
	movcs	%icc,	%g4,	%l4
	movne	%xcc,	%l1,	%i2
	fpack16	%f28,	%f11
	fandnot2	%f4,	%f26,	%f18
	ld	[%l7 + 0x44],	%f5
	fmovdge	%xcc,	%f24,	%f25
	umulcc	%o6,	%g5,	%i1
	fmul8x16	%f25,	%f26,	%f6
	nop
	set	0x5A, %i3
	lduh	[%l7 + %i3],	%g2
	sllx	%g7,	%l5,	%o4
	edge16l	%o5,	%i0,	%g3
	sdivcc	%o3,	0x1C67,	%o1
	array8	%i6,	%l3,	%i3
	srax	%g1,	%i5,	%l0
	std	%f14,	[%l7 + 0x50]
	fnands	%f26,	%f8,	%f29
	fzero	%f26
	movpos	%icc,	%g6,	%o2
	fpsub16	%f12,	%f20,	%f20
	edge16l	%l6,	%i4,	%i7
	movcc	%xcc,	%l2,	%o7
	mova	%icc,	%o0,	%l4
	movcs	%xcc,	%g4,	%l1
	std	%f24,	[%l7 + 0x30]
	edge32ln	%o6,	%i2,	%g5
	edge8	%i1,	%g2,	%l5
	srl	%g7,	%o5,	%i0
	fpackfix	%f0,	%f7
	edge8l	%o4,	%o3,	%o1
	orn	%i6,	%g3,	%l3
	edge8	%g1,	%i3,	%l0
	fmovsvs	%xcc,	%f14,	%f9
	mova	%xcc,	%g6,	%i5
	movrgez	%o2,	%i4,	%i7
	umul	%l2,	0x0AC4,	%o7
	subc	%l6,	%l4,	%o0
	subc	%g4,	0x128D,	%o6
	orn	%i2,	%g5,	%i1
	edge32ln	%g2,	%l5,	%g7
	fcmple16	%f6,	%f10,	%l1
	sdiv	%i0,	0x1FEF,	%o5
	stb	%o4,	[%l7 + 0x37]
	fmuld8ulx16	%f16,	%f11,	%f22
	ld	[%l7 + 0x24],	%f2
	srl	%o1,	%o3,	%i6
	addccc	%l3,	%g3,	%i3
	addc	%l0,	0x1AD0,	%g6
	mova	%xcc,	%g1,	%o2
	fmovrde	%i4,	%f18,	%f10
	movleu	%xcc,	%i5,	%i7
	udiv	%o7,	0x0164,	%l2
	movcc	%xcc,	%l6,	%o0
	movn	%icc,	%l4,	%o6
	xnor	%g4,	%i2,	%i1
	fnands	%f10,	%f20,	%f15
	edge16n	%g2,	%g5,	%g7
	smul	%l5,	0x1DF0,	%i0
	stb	%o5,	[%l7 + 0x1E]
	andncc	%o4,	%l1,	%o3
	movneg	%icc,	%o1,	%l3
	mulscc	%i6,	%i3,	%l0
	smulcc	%g3,	%g6,	%o2
	or	%g1,	0x013D,	%i4
	fandnot2	%f16,	%f18,	%f16
	mulscc	%i7,	%i5,	%l2
	udivx	%o7,	0x1D61,	%o0
	fnand	%f26,	%f30,	%f12
	movleu	%xcc,	%l4,	%l6
	ldd	[%l7 + 0x28],	%o6
	sllx	%g4,	%i1,	%i2
	sir	0x0A13
	movne	%icc,	%g5,	%g2
	smul	%g7,	0x1E2E,	%l5
	andncc	%o5,	%i0,	%l1
	movcc	%xcc,	%o3,	%o1
	movvc	%icc,	%l3,	%o4
	ldd	[%l7 + 0x68],	%f4
	orcc	%i6,	%i3,	%g3
	sir	0x04CA
	fmovrdlz	%g6,	%f22,	%f12
	ldsw	[%l7 + 0x54],	%l0
	fmovdgu	%xcc,	%f16,	%f31
	movre	%g1,	%i4,	%i7
	ldsb	[%l7 + 0x5E],	%i5
	fnands	%f3,	%f23,	%f7
	st	%f10,	[%l7 + 0x18]
	movcs	%icc,	%o2,	%l2
	sdiv	%o7,	0x1106,	%l4
	sdivx	%l6,	0x19CB,	%o6
	movrne	%g4,	%o0,	%i1
	subc	%i2,	%g5,	%g7
	sub	%l5,	0x1F3C,	%o5
	sra	%g2,	%l1,	%i0
	sdivx	%o3,	0x1CD6,	%o1
	ldsh	[%l7 + 0x36],	%l3
	movrgez	%o4,	0x0DC,	%i6
	fnors	%f1,	%f6,	%f30
	ldx	[%l7 + 0x38],	%g3
	edge16ln	%g6,	%i3,	%l0
	lduh	[%l7 + 0x32],	%g1
	movcs	%xcc,	%i4,	%i7
	and	%o2,	0x1DEE,	%l2
	sllx	%o7,	0x1A,	%l4
	subcc	%i5,	0x026E,	%o6
	fnands	%f27,	%f7,	%f9
	sir	0x19C4
	movre	%g4,	0x058,	%o0
	smulcc	%i1,	%i2,	%g5
	ldsw	[%l7 + 0x14],	%l6
	fmovrslez	%l5,	%f29,	%f5
	xnor	%g7,	0x1802,	%g2
	fmovrde	%o5,	%f0,	%f26
	fornot1	%f18,	%f6,	%f24
	xorcc	%i0,	0x061A,	%o3
	addccc	%l1,	0x0612,	%o1
	movl	%icc,	%o4,	%i6
	orcc	%l3,	%g6,	%g3
	stw	%i3,	[%l7 + 0x14]
	fabsd	%f2,	%f2
	ldsb	[%l7 + 0x50],	%l0
	ldub	[%l7 + 0x3C],	%g1
	fpsub16s	%f24,	%f30,	%f24
	fmovdneg	%icc,	%f20,	%f27
	sth	%i7,	[%l7 + 0x28]
	fnot1s	%f24,	%f26
	ldd	[%l7 + 0x48],	%i4
	fmovda	%xcc,	%f12,	%f12
	udiv	%l2,	0x0A86,	%o2
	edge16	%o7,	%l4,	%i5
	nop
	set	0x20, %g4
	sth	%g4,	[%l7 + %g4]
	fmovdgu	%icc,	%f15,	%f6
	ldd	[%l7 + 0x08],	%o6
	umulcc	%o0,	0x0B6B,	%i2
	move	%xcc,	%i1,	%l6
	srl	%l5,	%g5,	%g7
	fmovdpos	%icc,	%f2,	%f5
	sll	%o5,	%i0,	%o3
	fcmped	%fcc1,	%f0,	%f26
	alignaddrl	%g2,	%o1,	%o4
	edge16	%i6,	%l3,	%l1
	ld	[%l7 + 0x24],	%f24
	subcc	%g6,	%i3,	%g3
	alignaddr	%l0,	%g1,	%i4
	fmul8x16au	%f21,	%f0,	%f20
	add	%l2,	%i7,	%o2
	udivx	%o7,	0x0A2D,	%l4
	edge32l	%i5,	%o6,	%g4
	srlx	%o0,	%i1,	%l6
	array32	%i2,	%g5,	%g7
	stx	%l5,	[%l7 + 0x68]
	movcc	%xcc,	%o5,	%i0
	movrlez	%g2,	%o1,	%o4
	movn	%xcc,	%i6,	%o3
	popc	%l1,	%l3
	edge16	%i3,	%g6,	%g3
	fnot2s	%f13,	%f30
	lduw	[%l7 + 0x34],	%g1
	fone	%f0
	movrne	%i4,	%l2,	%i7
	fmovdleu	%xcc,	%f30,	%f19
	umul	%l0,	0x09D4,	%o2
	fmovsvs	%icc,	%f0,	%f24
	edge8l	%l4,	%i5,	%o6
	st	%f13,	[%l7 + 0x4C]
	movrne	%o7,	0x1FD,	%g4
	fsrc2s	%f30,	%f0
	edge16	%i1,	%o0,	%l6
	fmovda	%icc,	%f5,	%f17
	orcc	%g5,	%g7,	%l5
	addccc	%i2,	0x0577,	%o5
	fmovsg	%xcc,	%f16,	%f11
	fornot1	%f2,	%f14,	%f22
	siam	0x3
	umul	%i0,	%g2,	%o4
	udivcc	%i6,	0x029B,	%o1
	addc	%o3,	%l3,	%l1
	movrgez	%i3,	%g3,	%g1
	stw	%g6,	[%l7 + 0x24]
	sdivcc	%i4,	0x1643,	%i7
	fornot1s	%f11,	%f23,	%f31
	andcc	%l2,	%l0,	%o2
	udivcc	%i5,	0x193B,	%l4
	movrgez	%o7,	0x069,	%g4
	movrgez	%o6,	%o0,	%i1
	addc	%l6,	0x03E0,	%g5
	lduw	[%l7 + 0x78],	%g7
	udivx	%l5,	0x1552,	%o5
	addcc	%i2,	%g2,	%i0
	andcc	%o4,	0x04BA,	%o1
	movn	%icc,	%i6,	%l3
	fpsub32s	%f2,	%f20,	%f24
	edge16	%l1,	%i3,	%g3
	edge16n	%o3,	%g6,	%g1
	or	%i4,	%l2,	%l0
	srl	%i7,	%o2,	%l4
	movrlz	%o7,	0x10C,	%i5
	movre	%o6,	0x327,	%g4
	sethi	0x0A6C,	%o0
	sethi	0x1978,	%i1
	fors	%f24,	%f25,	%f13
	movvc	%xcc,	%l6,	%g7
	edge16	%l5,	%o5,	%i2
	restore %g2, 0x1384, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o4,	%i0,	%o1
	fnot1s	%f27,	%f11
	fornot1s	%f1,	%f1,	%f28
	fcmpgt16	%f14,	%f12,	%i6
	fmul8x16	%f19,	%f26,	%f0
	save %l3, 0x0EF8, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%icc,	%f8,	%f12
	lduw	[%l7 + 0x28],	%l1
	edge32l	%o3,	%g6,	%g3
	std	%f8,	[%l7 + 0x38]
	edge8l	%g1,	%i4,	%l0
	fmul8x16	%f29,	%f12,	%f0
	umulcc	%i7,	0x1C4B,	%o2
	sra	%l4,	0x02,	%l2
	fcmpd	%fcc0,	%f4,	%f2
	fsrc2s	%f14,	%f4
	fmuld8ulx16	%f23,	%f14,	%f22
	save %o7, 0x0F39, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x25],	%g4
	xnorcc	%o6,	0x1C9A,	%i1
	fcmpes	%fcc3,	%f17,	%f20
	andn	%l6,	0x1BF7,	%o0
	stx	%l5,	[%l7 + 0x18]
	stb	%o5,	[%l7 + 0x7E]
	move	%icc,	%g7,	%i2
	fmovscs	%icc,	%f12,	%f13
	nop
	set	0x73, %g3
	ldub	[%l7 + %g3],	%g5
	nop
	set	0x35, %g2
	ldub	[%l7 + %g2],	%o4
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	movrlez	%i6,	0x274,	%l3
	movrgez	%i3,	0x2B9,	%l1
	subc	%o1,	0x1011,	%g6
	sethi	0x0DC9,	%g3
	fsrc1	%f20,	%f2
	edge32	%o3,	%g1,	%l0
	sdiv	%i7,	0x1C45,	%o2
	addccc	%i4,	0x0BE3,	%l4
	edge16ln	%o7,	%i5,	%g4
	sethi	0x03C7,	%o6
	fands	%f8,	%f31,	%f21
	stx	%l2,	[%l7 + 0x30]
	fcmple32	%f12,	%f6,	%l6
	smul	%o0,	0x1D5C,	%l5
	movvs	%icc,	%i1,	%o5
	udivx	%g7,	0x1898,	%i2
	xnor	%g5,	%g2,	%o4
	fmovsge	%xcc,	%f29,	%f3
	sdivcc	%i0,	0x0804,	%i6
	fmovdg	%icc,	%f25,	%f31
	movcc	%icc,	%i3,	%l3
	fand	%f0,	%f2,	%f30
	xor	%o1,	0x1857,	%l1
	edge16n	%g6,	%g3,	%g1
	addccc	%o3,	0x01A8,	%i7
	subccc	%o2,	%i4,	%l0
	subcc	%l4,	0x15A4,	%i5
	fabsd	%f18,	%f24
	fxnors	%f13,	%f22,	%f3
	srax	%o7,	%o6,	%g4
	andncc	%l6,	%l2,	%o0
	andn	%l5,	%o5,	%i1
	movneg	%icc,	%g7,	%i2
	fmovdn	%icc,	%f7,	%f26
	addc	%g2,	0x0D63,	%g5
	fmovspos	%icc,	%f14,	%f7
	fcmple32	%f10,	%f26,	%i0
	sir	0x0DC4
	udiv	%i6,	0x1C0F,	%o4
	edge32n	%l3,	%i3,	%o1
	edge32l	%l1,	%g3,	%g1
	udivx	%g6,	0x0D7C,	%o3
	fmovrdne	%o2,	%f28,	%f22
	edge16ln	%i4,	%l0,	%l4
	stw	%i7,	[%l7 + 0x40]
	fmovrdgez	%i5,	%f18,	%f12
	edge8ln	%o6,	%o7,	%g4
	restore %l6, 0x0F33, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l5,	0x316,	%o5
	mulx	%i1,	%o0,	%i2
	mova	%icc,	%g2,	%g5
	edge32	%g7,	%i0,	%i6
	fmovda	%icc,	%f9,	%f13
	bshuffle	%f28,	%f12,	%f4
	edge16l	%o4,	%i3,	%o1
	fpsub32s	%f18,	%f17,	%f17
	edge16	%l1,	%g3,	%g1
	fmovrde	%l3,	%f2,	%f22
	movrgez	%g6,	0x0EE,	%o2
	sir	0x01C5
	movpos	%xcc,	%o3,	%i4
	edge8ln	%l4,	%l0,	%i5
	fcmpgt16	%f22,	%f28,	%o6
	stb	%o7,	[%l7 + 0x5E]
	stb	%g4,	[%l7 + 0x5A]
	fmovdneg	%xcc,	%f12,	%f23
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	edge16l	%o5,	%l5,	%o0
	ldx	[%l7 + 0x38],	%i2
	addcc	%i1,	%g5,	%g7
	fzero	%f16
	xorcc	%g2,	0x0C12,	%i0
	or	%i6,	0x1078,	%o4
	fcmple16	%f10,	%f0,	%i3
	fors	%f18,	%f16,	%f0
	sra	%o1,	%l1,	%g1
	sdivcc	%l3,	0x1BEB,	%g6
	ldsw	[%l7 + 0x70],	%g3
	edge32n	%o3,	%i4,	%l4
	array8	%o2,	%l0,	%o6
	stx	%o7,	[%l7 + 0x68]
	fornot2s	%f9,	%f7,	%f2
	edge8ln	%i5,	%i7,	%l6
	fzero	%f24
	orncc	%l2,	0x0B8C,	%o5
	srax	%l5,	0x16,	%o0
	edge32	%g4,	%i2,	%i1
	fmovrsgez	%g7,	%f11,	%f31
	ld	[%l7 + 0x18],	%f15
	udivcc	%g2,	0x0491,	%g5
	st	%f8,	[%l7 + 0x34]
	fone	%f22
	or	%i6,	%o4,	%i3
	xnor	%o1,	0x1958,	%l1
	st	%f20,	[%l7 + 0x10]
	nop
	set	0x1C, %g1
	stw	%g1,	[%l7 + %g1]
	fmovde	%icc,	%f0,	%f4
	movg	%icc,	%i0,	%l3
	fors	%f21,	%f15,	%f14
	umulcc	%g6,	%g3,	%i4
	fmovs	%f7,	%f31
	mulscc	%l4,	0x0EAE,	%o2
	siam	0x0
	sdivx	%o3,	0x05AB,	%l0
	fornot2s	%f6,	%f6,	%f23
	restore %o6, 0x0BD5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f16,	%f14
	edge8ln	%i7,	%l6,	%l2
	orcc	%i5,	%o5,	%o0
	alignaddrl	%g4,	%l5,	%i2
	add	%g7,	0x0095,	%i1
	fmovrdlz	%g2,	%f14,	%f4
	xnorcc	%i6,	%g5,	%o4
	andncc	%i3,	%o1,	%l1
	alignaddr	%i0,	%g1,	%g6
	movpos	%icc,	%l3,	%i4
	movrlez	%g3,	0x348,	%l4
	stw	%o2,	[%l7 + 0x58]
	movgu	%icc,	%o3,	%o6
	move	%xcc,	%o7,	%l0
	fnegs	%f21,	%f23
	ldsh	[%l7 + 0x46],	%i7
	udivx	%l2,	0x1E66,	%i5
	edge8ln	%o5,	%o0,	%g4
	fandnot1s	%f19,	%f29,	%f4
	srlx	%l5,	%i2,	%l6
	umul	%i1,	%g7,	%i6
	fnegd	%f24,	%f20
	fxors	%f12,	%f8,	%f28
	movvs	%xcc,	%g5,	%g2
	fsrc2	%f6,	%f18
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	ld	[%l7 + 0x44],	%f12
	movle	%xcc,	%l1,	%o1
	ldd	[%l7 + 0x68],	%i0
	sll	%g1,	%g6,	%l3
	movpos	%icc,	%i4,	%g3
	udivx	%o2,	0x1ADF,	%l4
	ldd	[%l7 + 0x70],	%o6
	fpadd16	%f20,	%f0,	%f8
	lduw	[%l7 + 0x7C],	%o7
	smul	%o3,	0x0DA8,	%l0
	sub	%i7,	0x0C73,	%i5
	umul	%o5,	%l2,	%o0
	addccc	%g4,	0x0423,	%i2
	fmovdn	%icc,	%f22,	%f18
	movcs	%icc,	%l5,	%l6
	subccc	%i1,	0x11E8,	%i6
	save %g7, 0x1829, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x60, %l5
	std	%f22,	[%l7 + %l5]
	fexpand	%f17,	%f14
	edge16n	%g2,	%i3,	%l1
	edge16	%o1,	%o4,	%i0
	or	%g1,	%l3,	%g6
	sub	%g3,	%o2,	%l4
	sllx	%o6,	0x1F,	%i4
	edge16	%o3,	%l0,	%o7
	ldx	[%l7 + 0x20],	%i7
	ldx	[%l7 + 0x08],	%o5
	edge32l	%i5,	%o0,	%g4
	udivcc	%l2,	0x06D5,	%l5
	array16	%l6,	%i1,	%i2
	fsrc1s	%f5,	%f25
	movleu	%icc,	%i6,	%g7
	ldub	[%l7 + 0x52],	%g5
	orn	%i3,	0x0152,	%g2
	fabsd	%f18,	%f22
	sll	%o1,	%l1,	%i0
	faligndata	%f18,	%f22,	%f20
	movge	%icc,	%g1,	%l3
	fmovsleu	%icc,	%f19,	%f7
	fcmpd	%fcc2,	%f14,	%f16
	st	%f13,	[%l7 + 0x0C]
	edge32n	%o4,	%g6,	%g3
	save %o2, 0x085D, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x68],	%i4
	edge16n	%l4,	%o3,	%l0
	orncc	%i7,	%o5,	%i5
	smulcc	%o7,	%o0,	%g4
	move	%icc,	%l5,	%l6
	umul	%i1,	0x0EFC,	%i2
	movge	%xcc,	%i6,	%l2
	subccc	%g5,	0x0C6A,	%g7
	move	%icc,	%g2,	%i3
	alignaddrl	%l1,	%i0,	%g1
	array32	%o1,	%o4,	%l3
	fxnors	%f26,	%f21,	%f15
	movrlz	%g3,	0x258,	%o2
	edge8ln	%g6,	%o6,	%l4
	smul	%o3,	%l0,	%i7
	edge16ln	%o5,	%i4,	%i5
	alignaddrl	%o0,	%g4,	%o7
	movrlz	%l6,	0x24F,	%l5
	xorcc	%i1,	%i6,	%i2
	smul	%l2,	%g7,	%g5
	mulx	%g2,	%i3,	%l1
	faligndata	%f22,	%f20,	%f0
	fcmple16	%f30,	%f18,	%i0
	ldsb	[%l7 + 0x49],	%o1
	movne	%icc,	%g1,	%o4
	movge	%xcc,	%g3,	%l3
	movvc	%xcc,	%o2,	%g6
	ld	[%l7 + 0x78],	%f1
	sll	%o6,	%o3,	%l0
	mulx	%l4,	0x053E,	%o5
	nop
	set	0x58, %l2
	stw	%i7,	[%l7 + %l2]
	sll	%i4,	0x1F,	%i5
	mulx	%o0,	%o7,	%l6
	edge16n	%l5,	%g4,	%i6
	nop
	set	0x6F, %l3
	ldub	[%l7 + %l3],	%i2
	addc	%i1,	%l2,	%g5
	edge32n	%g2,	%g7,	%l1
	srl	%i3,	%o1,	%g1
	orncc	%o4,	0x0C55,	%g3
	fcmpd	%fcc3,	%f26,	%f24
	fmovsgu	%xcc,	%f8,	%f22
	umulcc	%l3,	%i0,	%g6
	fmovsne	%xcc,	%f13,	%f26
	edge32ln	%o2,	%o6,	%l0
	movge	%icc,	%l4,	%o5
	fmovscc	%icc,	%f0,	%f17
	fmovsvs	%xcc,	%f11,	%f10
	addccc	%i7,	%o3,	%i5
	lduh	[%l7 + 0x44],	%o0
	movcc	%xcc,	%i4,	%l6
	udivcc	%l5,	0x11F3,	%g4
	fmovda	%icc,	%f10,	%f10
	srl	%o7,	0x02,	%i2
	ldub	[%l7 + 0x1C],	%i6
	movne	%xcc,	%i1,	%g5
	movrlz	%l2,	%g7,	%l1
	move	%xcc,	%i3,	%o1
	edge32n	%g1,	%o4,	%g2
	movvc	%xcc,	%l3,	%g3
	fabsd	%f24,	%f28
	edge8n	%i0,	%o2,	%o6
	addcc	%l0,	%l4,	%o5
	stb	%i7,	[%l7 + 0x08]
	alignaddrl	%o3,	%g6,	%i5
	movvs	%xcc,	%i4,	%l6
	edge16l	%l5,	%o0,	%o7
	movrgez	%i2,	0x08B,	%g4
	fnand	%f8,	%f14,	%f28
	fcmpne16	%f24,	%f16,	%i6
	srl	%i1,	0x0C,	%l2
	movleu	%xcc,	%g7,	%l1
	fcmpd	%fcc1,	%f18,	%f4
	fnor	%f6,	%f2,	%f2
	orcc	%i3,	%g5,	%o1
	fmovdleu	%xcc,	%f11,	%f17
	orn	%g1,	%o4,	%l3
	ldub	[%l7 + 0x27],	%g3
	addcc	%i0,	0x1899,	%g2
	addcc	%o6,	%l0,	%o2
	bshuffle	%f14,	%f16,	%f22
	lduw	[%l7 + 0x34],	%l4
	fornot2s	%f30,	%f1,	%f16
	andncc	%o5,	%i7,	%g6
	fsrc1	%f16,	%f20
	fmovdgu	%icc,	%f27,	%f27
	fmovdvc	%xcc,	%f22,	%f7
	movg	%icc,	%i5,	%i4
	edge8l	%l6,	%l5,	%o3
	fmovscc	%icc,	%f4,	%f9
	ldd	[%l7 + 0x58],	%o6
	ldsw	[%l7 + 0x6C],	%o0
	movn	%xcc,	%g4,	%i2
	fmul8x16	%f16,	%f20,	%f30
	movvs	%xcc,	%i1,	%i6
	movge	%xcc,	%l2,	%l1
	array16	%g7,	%g5,	%o1
	srax	%i3,	%o4,	%g1
	movre	%l3,	0x271,	%g3
	sll	%g2,	0x06,	%o6
	ldsh	[%l7 + 0x36],	%i0
	xor	%l0,	0x014F,	%o2
	sra	%l4,	%o5,	%i7
	stx	%i5,	[%l7 + 0x20]
	fxnor	%f6,	%f24,	%f24
	stb	%g6,	[%l7 + 0x4B]
	orncc	%l6,	0x068D,	%i4
	fmovdvc	%xcc,	%f12,	%f11
	addc	%o3,	0x0FB9,	%o7
	fmovda	%icc,	%f10,	%f12
	udivcc	%l5,	0x0149,	%o0
	movle	%icc,	%g4,	%i1
	movgu	%icc,	%i6,	%i2
	movrne	%l1,	%g7,	%l2
	lduh	[%l7 + 0x26],	%g5
	fmovrsgz	%i3,	%f1,	%f11
	array16	%o4,	%g1,	%l3
	popc	%o1,	%g3
	mova	%xcc,	%o6,	%g2
	xor	%l0,	%i0,	%l4
	fand	%f6,	%f24,	%f26
	fsrc1s	%f24,	%f10
	fmovsleu	%icc,	%f31,	%f30
	subc	%o5,	%o2,	%i7
	fmovdcc	%icc,	%f0,	%f19
	array8	%g6,	%i5,	%l6
	ldx	[%l7 + 0x50],	%o3
	sir	0x0B0B
	sub	%o7,	0x0448,	%i4
	addcc	%o0,	0x0D75,	%l5
	lduh	[%l7 + 0x24],	%g4
	fmovrdlz	%i6,	%f0,	%f18
	fcmpeq32	%f22,	%f26,	%i2
	fmovrde	%l1,	%f8,	%f16
	mova	%xcc,	%i1,	%g7
	mulx	%g5,	%i3,	%o4
	fmovsle	%icc,	%f31,	%f4
	orcc	%l2,	0x172D,	%l3
	st	%f30,	[%l7 + 0x7C]
	sdiv	%g1,	0x06EE,	%g3
	fandnot1s	%f23,	%f1,	%f19
	fmovsneg	%icc,	%f30,	%f0
	alignaddr	%o6,	%o1,	%l0
	udivx	%g2,	0x032E,	%l4
	subccc	%i0,	%o5,	%o2
	fmovspos	%xcc,	%f12,	%f30
	fxors	%f15,	%f26,	%f13
	sdivcc	%g6,	0x18DD,	%i5
	fmovrslz	%l6,	%f7,	%f9
	sdivcc	%i7,	0x1B26,	%o3
	stw	%o7,	[%l7 + 0x58]
	nop
	set	0x48, %i7
	std	%f30,	[%l7 + %i7]
	edge32n	%i4,	%o0,	%g4
	fmovscc	%icc,	%f29,	%f24
	fpadd16	%f18,	%f24,	%f12
	sdiv	%i6,	0x0D4A,	%i2
	fnand	%f28,	%f14,	%f20
	fandnot1s	%f4,	%f18,	%f20
	umul	%l1,	0x1927,	%i1
	fmovscs	%xcc,	%f21,	%f2
	movvs	%icc,	%g7,	%g5
	fmovrdlz	%l5,	%f18,	%f14
	edge16	%o4,	%l2,	%i3
	sdiv	%l3,	0x020D,	%g1
	fmovsleu	%icc,	%f30,	%f3
	or	%o6,	0x1554,	%o1
	orncc	%l0,	0x0EC5,	%g3
	srax	%g2,	0x1A,	%i0
	udivx	%l4,	0x065F,	%o5
	udivcc	%o2,	0x1433,	%g6
	fnot1s	%f17,	%f24
	array8	%l6,	%i7,	%o3
	movleu	%icc,	%i5,	%o7
	srax	%i4,	%o0,	%g4
	edge8ln	%i2,	%i6,	%i1
	addccc	%g7,	%g5,	%l5
	ldsw	[%l7 + 0x44],	%l1
	fmovrslez	%o4,	%f25,	%f16
	srl	%l2,	0x18,	%l3
	stb	%g1,	[%l7 + 0x75]
	fand	%f28,	%f20,	%f0
	fmovsle	%xcc,	%f19,	%f10
	udivcc	%i3,	0x00A1,	%o1
	movrlez	%l0,	%o6,	%g3
	fmovsvc	%xcc,	%f17,	%f10
	umul	%i0,	0x0C39,	%l4
	srlx	%o5,	%g2,	%o2
	udivcc	%g6,	0x082D,	%l6
	addc	%o3,	0x15AE,	%i5
	edge8l	%i7,	%i4,	%o0
	movle	%icc,	%g4,	%o7
	umulcc	%i6,	0x0F22,	%i2
	fmovrdlez	%g7,	%f12,	%f18
	sllx	%i1,	0x0F,	%g5
	fmovdle	%xcc,	%f8,	%f5
	fcmpeq16	%f12,	%f0,	%l1
	edge16	%o4,	%l2,	%l5
	smulcc	%l3,	0x19D8,	%g1
	movcc	%xcc,	%o1,	%i3
	sth	%l0,	[%l7 + 0x10]
	fmovsvs	%xcc,	%f25,	%f15
	umulcc	%g3,	0x0DCC,	%i0
	popc	%o6,	%l4
	fornot1s	%f25,	%f21,	%f3
	movrgez	%o5,	%g2,	%o2
	movrne	%l6,	0x1DF,	%o3
	movvc	%xcc,	%i5,	%i7
	edge8l	%g6,	%i4,	%o0
	movcs	%icc,	%g4,	%i6
	sth	%i2,	[%l7 + 0x4E]
	sub	%g7,	0x0C0C,	%i1
	movvs	%icc,	%o7,	%g5
	movre	%o4,	%l2,	%l5
	array32	%l1,	%l3,	%g1
	movleu	%icc,	%o1,	%i3
	orncc	%l0,	%g3,	%o6
	andn	%l4,	%o5,	%i0
	movrlez	%o2,	%l6,	%g2
	fnot2	%f12,	%f26
	fmovsne	%icc,	%f24,	%f18
	movre	%i5,	%o3,	%g6
	sir	0x1166
	fmovscs	%icc,	%f30,	%f7
	movgu	%xcc,	%i7,	%i4
	lduh	[%l7 + 0x26],	%o0
	movge	%icc,	%i6,	%i2
	sdivx	%g7,	0x0320,	%g4
	fabsd	%f20,	%f16
	edge32ln	%i1,	%g5,	%o7
	ldd	[%l7 + 0x28],	%f2
	sdiv	%l2,	0x179A,	%l5
	st	%f25,	[%l7 + 0x58]
	movl	%icc,	%o4,	%l3
	fmul8x16al	%f8,	%f18,	%f8
	edge16	%l1,	%o1,	%g1
	movcs	%icc,	%l0,	%g3
	or	%o6,	0x01F5,	%l4
	fand	%f8,	%f28,	%f28
	xnorcc	%o5,	%i0,	%o2
	lduh	[%l7 + 0x3C],	%i3
	udiv	%l6,	0x1124,	%g2
	xorcc	%i5,	0x15F9,	%o3
	mulx	%g6,	0x1418,	%i4
	edge16l	%i7,	%o0,	%i2
	smul	%i6,	%g7,	%i1
	fpsub32	%f14,	%f8,	%f4
	movcc	%icc,	%g5,	%o7
	fmovs	%f29,	%f12
	st	%f9,	[%l7 + 0x58]
	mova	%xcc,	%g4,	%l2
	edge8l	%o4,	%l5,	%l3
	edge16n	%l1,	%g1,	%o1
	movrgez	%l0,	0x2FD,	%o6
	sdivcc	%l4,	0x0A19,	%o5
	andcc	%i0,	0x093D,	%g3
	fexpand	%f0,	%f12
	fexpand	%f1,	%f8
	movgu	%xcc,	%i3,	%o2
	fmul8ulx16	%f20,	%f28,	%f20
	movvc	%xcc,	%g2,	%l6
	movre	%i5,	0x304,	%o3
	movrlez	%i4,	%i7,	%o0
	xnorcc	%i2,	0x0C27,	%i6
	ldd	[%l7 + 0x20],	%f6
	movrlez	%g6,	%g7,	%i1
	xor	%o7,	0x037F,	%g4
	ldsw	[%l7 + 0x40],	%g5
	sdiv	%o4,	0x05DA,	%l5
	fcmpne32	%f22,	%f18,	%l2
	fcmpgt16	%f6,	%f22,	%l1
	edge32l	%l3,	%o1,	%l0
	srl	%g1,	0x0A,	%l4
	fmovrslez	%o6,	%f3,	%f16
	addc	%i0,	0x1CB1,	%o5
	srlx	%i3,	0x02,	%o2
	smulcc	%g3,	%l6,	%i5
	nop
	set	0x5C, %i1
	ldsw	[%l7 + %i1],	%o3
	movrlez	%g2,	%i4,	%o0
	sub	%i7,	%i2,	%g6
	edge32n	%i6,	%g7,	%i1
	fmovsa	%xcc,	%f5,	%f9
	nop
	set	0x60, %o7
	ldd	[%l7 + %o7],	%g4
	movvs	%icc,	%o7,	%g5
	fmovdn	%xcc,	%f18,	%f2
	movrgz	%l5,	%o4,	%l2
	edge32ln	%l1,	%l3,	%o1
	fmovs	%f3,	%f0
	subcc	%l0,	0x0D4A,	%g1
	movl	%xcc,	%l4,	%o6
	st	%f16,	[%l7 + 0x70]
	fsrc1	%f24,	%f14
	edge8n	%i0,	%i3,	%o5
	nop
	set	0x38, %i0
	stx	%o2,	[%l7 + %i0]
	movre	%g3,	%l6,	%i5
	srl	%o3,	%i4,	%g2
	fmovrdlz	%o0,	%f18,	%f8
	fsrc1s	%f16,	%f10
	edge8	%i7,	%i2,	%i6
	save %g7, %g6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x187C
	movrgz	%o7,	0x00C,	%g4
	sll	%g5,	0x06,	%o4
	edge8l	%l2,	%l5,	%l3
	and	%l1,	%o1,	%g1
	subc	%l0,	0x1B43,	%o6
	movn	%xcc,	%i0,	%l4
	movcc	%xcc,	%i3,	%o5
	mulscc	%g3,	0x19E5,	%o2
	fmovrdgez	%l6,	%f6,	%f18
	smul	%i5,	0x0547,	%i4
	edge16l	%o3,	%g2,	%o0
	smulcc	%i7,	0x186C,	%i2
	movvs	%icc,	%g7,	%i6
	array8	%i1,	%g6,	%g4
	sdivcc	%g5,	0x1AF2,	%o4
	fmovsgu	%icc,	%f4,	%f10
	ldx	[%l7 + 0x48],	%o7
	fmovs	%f24,	%f15
	addccc	%l5,	0x094B,	%l3
	sethi	0x0531,	%l2
	st	%f2,	[%l7 + 0x38]
	fpack16	%f22,	%f28
	ldd	[%l7 + 0x08],	%o0
	edge32l	%g1,	%l0,	%o6
	and	%l1,	0x0910,	%l4
	fmul8x16al	%f31,	%f19,	%f24
	movrlz	%i0,	%i3,	%g3
	edge32n	%o2,	%o5,	%l6
	fmovscs	%icc,	%f11,	%f18
	movrne	%i5,	0x3FB,	%i4
	sra	%g2,	0x17,	%o3
	stw	%i7,	[%l7 + 0x28]
	fmovrdlz	%i2,	%f22,	%f16
	srlx	%g7,	0x1F,	%o0
	array8	%i6,	%g6,	%i1
	orcc	%g5,	%g4,	%o7
	smulcc	%o4,	%l3,	%l2
	movle	%icc,	%l5,	%o1
	movleu	%xcc,	%g1,	%o6
	movn	%xcc,	%l1,	%l4
	fmovsn	%xcc,	%f13,	%f26
	movg	%xcc,	%l0,	%i0
	fmovdne	%icc,	%f16,	%f10
	movvs	%icc,	%g3,	%o2
	fcmped	%fcc3,	%f20,	%f2
	move	%icc,	%i3,	%o5
	udivcc	%l6,	0x085E,	%i5
	movcs	%icc,	%i4,	%o3
	edge32l	%g2,	%i2,	%g7
	restore %o0, 0x013F, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%g6,	%f23,	%f21
	srl	%i1,	0x00,	%i7
	edge16ln	%g4,	%g5,	%o4
	fmovdcs	%xcc,	%f4,	%f21
	orcc	%o7,	0x0B6F,	%l3
	save %l2, 0x147B, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g1,	0x0F87,	%l5
	fandnot1	%f18,	%f30,	%f26
	fabsd	%f10,	%f10
	smulcc	%l1,	%o6,	%l0
	fandnot1	%f16,	%f6,	%f0
	sdiv	%i0,	0x13CA,	%g3
	fnot2	%f18,	%f26
	fors	%f20,	%f16,	%f3
	subcc	%l4,	0x0FC7,	%o2
	st	%f29,	[%l7 + 0x48]
	xorcc	%o5,	0x03BA,	%l6
	ldsw	[%l7 + 0x78],	%i3
	fcmpeq16	%f20,	%f16,	%i5
	movvs	%xcc,	%o3,	%i4
	movn	%xcc,	%g2,	%i2
	movl	%icc,	%o0,	%i6
	edge32n	%g6,	%i1,	%g7
	edge32	%i7,	%g5,	%g4
	array16	%o7,	%o4,	%l2
	orcc	%l3,	0x0CDB,	%o1
	sir	0x16A9
	ldsh	[%l7 + 0x42],	%g1
	sllx	%l1,	0x1A,	%l5
	udiv	%l0,	0x0F87,	%o6
	mulx	%i0,	0x01E8,	%l4
	andcc	%g3,	0x11B2,	%o2
	edge32	%l6,	%i3,	%o5
	movvc	%xcc,	%i5,	%i4
	fmovdleu	%icc,	%f26,	%f17
	fsrc2s	%f18,	%f13
	sra	%o3,	%i2,	%o0
	fpadd16s	%f25,	%f21,	%f8
	orn	%i6,	0x1461,	%g6
	orn	%i1,	%g7,	%g2
	movleu	%xcc,	%i7,	%g5
	xorcc	%o7,	%o4,	%g4
	popc	0x01FB,	%l3
	movrne	%o1,	0x36B,	%l2
	edge16n	%g1,	%l5,	%l1
	movleu	%xcc,	%o6,	%l0
	save %l4, 0x0986, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i0,	0x07E5,	%o2
	movleu	%xcc,	%l6,	%i3
	ldd	[%l7 + 0x50],	%i4
	movl	%xcc,	%i4,	%o3
	movleu	%xcc,	%i2,	%o5
	edge16n	%o0,	%g6,	%i1
	alignaddrl	%g7,	%g2,	%i6
	ldsb	[%l7 + 0x1D],	%i7
	edge16n	%g5,	%o4,	%o7
	stx	%g4,	[%l7 + 0x78]
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	edge32n	%l5,	%l2,	%l1
	sdivx	%o6,	0x0084,	%l4
	srl	%l0,	%i0,	%g3
	sdiv	%o2,	0x16FE,	%l6
	movrlez	%i5,	0x076,	%i3
	addc	%o3,	0x092D,	%i4
	fmuld8ulx16	%f2,	%f26,	%f8
	movrne	%o5,	0x016,	%o0
	edge16ln	%i2,	%g6,	%i1
	fmovsge	%icc,	%f8,	%f31
	sethi	0x16DC,	%g2
	edge32	%i6,	%g7,	%i7
	std	%f24,	[%l7 + 0x20]
	fmovdneg	%icc,	%f4,	%f20
	andn	%g5,	%o7,	%g4
	srl	%o1,	0x08,	%o4
	movneg	%xcc,	%g1,	%l3
	srlx	%l5,	0x01,	%l2
	stx	%l1,	[%l7 + 0x70]
	movrgz	%l4,	%o6,	%l0
	movrgz	%g3,	0x13A,	%i0
	movrlez	%o2,	%i5,	%i3
	ldd	[%l7 + 0x50],	%f30
	fmovde	%icc,	%f7,	%f9
	umulcc	%l6,	%i4,	%o5
	udivcc	%o0,	0x1FD8,	%i2
	movrlz	%g6,	0x120,	%o3
	std	%f10,	[%l7 + 0x70]
	addcc	%g2,	0x1873,	%i6
	fmovdg	%icc,	%f23,	%f13
	movrlz	%g7,	%i1,	%i7
	fmovdge	%xcc,	%f16,	%f25
	array8	%o7,	%g5,	%o1
	sdivcc	%o4,	0x1F9C,	%g4
	fmovrsgez	%g1,	%f13,	%f20
	movcs	%xcc,	%l5,	%l3
	srax	%l1,	0x0B,	%l4
	movg	%xcc,	%l2,	%o6
	fmovrdlz	%g3,	%f26,	%f14
	edge32	%i0,	%o2,	%i5
	movg	%xcc,	%l0,	%l6
	edge32ln	%i4,	%o5,	%o0
	ldx	[%l7 + 0x50],	%i2
	st	%f25,	[%l7 + 0x60]
	edge32ln	%i3,	%g6,	%o3
	fandnot2s	%f29,	%f3,	%f20
	edge32	%i6,	%g7,	%i1
	stx	%g2,	[%l7 + 0x58]
	movrlz	%o7,	0x0DF,	%i7
	movpos	%icc,	%g5,	%o4
	srl	%o1,	%g4,	%l5
	fnot1	%f26,	%f20
	fmul8x16	%f30,	%f24,	%f30
	srax	%g1,	0x10,	%l1
	fors	%f26,	%f20,	%f21
	for	%f20,	%f26,	%f6
	umulcc	%l3,	%l4,	%l2
	fmovrsgez	%o6,	%f4,	%f7
	stw	%g3,	[%l7 + 0x20]
	ldsh	[%l7 + 0x14],	%o2
	ldx	[%l7 + 0x40],	%i0
	fpmerge	%f7,	%f23,	%f18
	orn	%i5,	0x13CE,	%l0
	edge32l	%l6,	%o5,	%i4
	fmovrdlz	%o0,	%f26,	%f22
	fcmps	%fcc0,	%f25,	%f6
	mova	%xcc,	%i2,	%g6
	fnot2s	%f0,	%f14
	sll	%i3,	%i6,	%o3
	alignaddrl	%g7,	%g2,	%o7
	sdivcc	%i1,	0x07D7,	%g5
	subccc	%o4,	0x1D40,	%i7
	smulcc	%o1,	%g4,	%l5
	movleu	%icc,	%l1,	%l3
	std	%f14,	[%l7 + 0x30]
	fcmpes	%fcc1,	%f9,	%f29
	movl	%icc,	%l4,	%g1
	andn	%l2,	%g3,	%o2
	movrne	%i0,	0x29A,	%o6
	movvc	%xcc,	%i5,	%l0
	movrgez	%l6,	0x1A8,	%o5
	fcmpes	%fcc1,	%f21,	%f6
	fabss	%f2,	%f3
	fmovsg	%xcc,	%f4,	%f16
	fmovsgu	%icc,	%f25,	%f12
	srax	%o0,	0x1B,	%i2
	fmovs	%f7,	%f26
	fandnot2s	%f14,	%f5,	%f7
	addccc	%i4,	%g6,	%i6
	movrlz	%o3,	%i3,	%g2
	fabsd	%f24,	%f0
	edge8l	%g7,	%i1,	%g5
	mulscc	%o7,	%i7,	%o1
	xorcc	%g4,	%l5,	%l1
	stx	%l3,	[%l7 + 0x60]
	subcc	%l4,	%g1,	%o4
	st	%f11,	[%l7 + 0x6C]
	ldub	[%l7 + 0x15],	%l2
	sra	%o2,	0x1F,	%i0
	umulcc	%o6,	0x10DD,	%g3
	smul	%l0,	0x1759,	%i5
	restore %o5, %l6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o0,	0x1B40,	%g6
	movcc	%xcc,	%i4,	%o3
	edge8l	%i6,	%i3,	%g2
	smulcc	%g7,	0x134F,	%g5
	fors	%f14,	%f10,	%f9
	popc	0x12CB,	%o7
	umul	%i1,	0x101E,	%i7
	orncc	%o1,	0x068D,	%l5
	subcc	%l1,	%l3,	%l4
	fmovsne	%xcc,	%f3,	%f11
	ldsw	[%l7 + 0x28],	%g1
	addc	%g4,	0x1570,	%l2
	smul	%o4,	%o2,	%o6
	move	%xcc,	%i0,	%l0
	sdivcc	%g3,	0x0BFD,	%o5
	movn	%icc,	%l6,	%i2
	stw	%o0,	[%l7 + 0x4C]
	fcmps	%fcc3,	%f29,	%f29
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	sub	%i6,	%i3,	%i4
	edge8	%g2,	%g5,	%g7
	alignaddr	%o7,	%i1,	%o1
	fcmpes	%fcc0,	%f30,	%f15
	movpos	%icc,	%i7,	%l1
	sllx	%l3,	0x13,	%l5
	ld	[%l7 + 0x6C],	%f14
	restore %g1, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	%o2,	%o6
	fmovd	%f24,	%f4
	alignaddrl	%o4,	%i0,	%g3
	fmovscs	%icc,	%f11,	%f8
	orncc	%o5,	0x1E34,	%l0
	fmovdcc	%xcc,	%f21,	%f5
	srlx	%i2,	%l6,	%g6
	addccc	%i5,	%o0,	%i6
	orncc	%i3,	0x13F3,	%o3
	array16	%i4,	%g2,	%g7
	orcc	%g5,	0x1D1B,	%i1
	sir	0x0D7D
	fmovrdgez	%o1,	%f16,	%f28
	movpos	%xcc,	%o7,	%l1
	movrlez	%l3,	%i7,	%g1
	movle	%xcc,	%l4,	%l2
	fmovsa	%xcc,	%f15,	%f20
	movrgz	%g4,	0x21F,	%o2
	movgu	%xcc,	%o6,	%l5
	srl	%o4,	0x02,	%g3
	sdivx	%i0,	0x1C75,	%o5
	or	%l0,	%l6,	%g6
	fcmpne16	%f16,	%f4,	%i2
	ldub	[%l7 + 0x78],	%i5
	umul	%o0,	0x074C,	%i3
	edge16	%o3,	%i4,	%i6
	movrne	%g2,	%g5,	%i1
	udivcc	%g7,	0x0E71,	%o1
	save %l1, %o7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdne	%g1,	%f24,	%f10
	sdiv	%l4,	0x0923,	%i7
	nop
	set	0x60, %o6
	lduw	[%l7 + %o6],	%g4
	stw	%o2,	[%l7 + 0x48]
	fnot1s	%f13,	%f7
	movneg	%icc,	%l2,	%l5
	udiv	%o6,	0x0443,	%o4
	movvc	%xcc,	%i0,	%g3
	addccc	%l0,	%l6,	%g6
	sdivcc	%i2,	0x197D,	%i5
	fcmple32	%f12,	%f14,	%o0
	fpadd32s	%f16,	%f11,	%f10
	fand	%f2,	%f22,	%f28
	popc	%o5,	%o3
	fmovdleu	%xcc,	%f1,	%f17
	sdiv	%i4,	0x1574,	%i3
	edge16l	%g2,	%g5,	%i6
	fpadd32s	%f12,	%f4,	%f9
	st	%f6,	[%l7 + 0x08]
	movvc	%xcc,	%i1,	%o1
	movrgz	%l1,	0x2F9,	%o7
	fmuld8sux16	%f22,	%f18,	%f0
	mulx	%g7,	0x0B68,	%g1
	movrlz	%l4,	%l3,	%g4
	sth	%i7,	[%l7 + 0x7A]
	movrgez	%o2,	%l2,	%o6
	lduw	[%l7 + 0x38],	%l5
	array32	%o4,	%g3,	%i0
	sdivcc	%l6,	0x0BF1,	%l0
	ldd	[%l7 + 0x40],	%f2
	movrne	%g6,	%i2,	%i5
	orncc	%o0,	0x14F6,	%o3
	ldd	[%l7 + 0x40],	%i4
	fxors	%f24,	%f27,	%f3
	fmovdle	%icc,	%f17,	%f8
	ld	[%l7 + 0x34],	%f26
	movrlez	%o5,	0x2C5,	%i3
	subcc	%g5,	%g2,	%i1
	sth	%o1,	[%l7 + 0x68]
	addcc	%i6,	%o7,	%g7
	movneg	%xcc,	%l1,	%g1
	ld	[%l7 + 0x64],	%f7
	edge32	%l3,	%g4,	%l4
	ldx	[%l7 + 0x20],	%o2
	xnor	%l2,	0x007E,	%o6
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	edge8ln	%g3,	%i0,	%l6
	sllx	%l0,	%o4,	%g6
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%i2
	movrlz	%o0,	%i5,	%o3
	fmovrdgez	%i4,	%f24,	%f14
	fmovdpos	%icc,	%f5,	%f13
	movl	%xcc,	%i3,	%g5
	edge8l	%g2,	%i1,	%o1
	fpsub32s	%f13,	%f2,	%f9
	add	%o5,	%o7,	%g7
	umulcc	%i6,	0x0066,	%l1
	edge16l	%g1,	%g4,	%l4
	orncc	%l3,	0x15E5,	%o2
	edge32	%o6,	%l5,	%l2
	fmul8sux16	%f4,	%f22,	%f20
	movgu	%icc,	%i7,	%i0
	nop
	set	0x5D, %l4
	ldsb	[%l7 + %l4],	%g3
	movvc	%icc,	%l6,	%o4
	array8	%l0,	%g6,	%o0
	fmovdn	%xcc,	%f12,	%f19
	orn	%i2,	0x1200,	%i5
	faligndata	%f14,	%f18,	%f14
	edge32l	%i4,	%o3,	%g5
	st	%f0,	[%l7 + 0x40]
	udiv	%g2,	0x1F24,	%i3
	fmovs	%f1,	%f25
	lduw	[%l7 + 0x1C],	%i1
	movrgez	%o5,	0x0BE,	%o7
	udivcc	%o1,	0x1809,	%g7
	fmovdne	%xcc,	%f1,	%f8
	fornot2s	%f30,	%f31,	%f1
	movre	%i6,	%g1,	%l1
	orncc	%g4,	%l3,	%l4
	orcc	%o2,	%l5,	%o6
	movrlez	%l2,	%i7,	%i0
	fabss	%f26,	%f2
	ldd	[%l7 + 0x40],	%i6
	orn	%g3,	0x1DE7,	%l0
	ldd	[%l7 + 0x18],	%g6
	nop
	set	0x20, %g5
	std	%f10,	[%l7 + %g5]
	popc	%o0,	%i2
	xnorcc	%i5,	0x0859,	%o4
	sllx	%o3,	%g5,	%g2
	alignaddrl	%i4,	%i3,	%o5
	edge8ln	%o7,	%i1,	%g7
	subccc	%o1,	%i6,	%g1
	bshuffle	%f14,	%f20,	%f18
	alignaddr	%g4,	%l1,	%l4
	mulscc	%o2,	0x1EAA,	%l5
	sth	%o6,	[%l7 + 0x2C]
	fxnor	%f26,	%f16,	%f30
	fpack16	%f12,	%f23
	movvc	%icc,	%l3,	%l2
	sdivcc	%i7,	0x09AC,	%l6
	movpos	%xcc,	%g3,	%l0
	movrgez	%i0,	%g6,	%o0
	edge16n	%i2,	%i5,	%o3
	addc	%o4,	0x18AD,	%g2
	movrne	%g5,	0x0BC,	%i4
	andcc	%o5,	%o7,	%i1
	movrlez	%g7,	0x0F1,	%o1
	edge32	%i3,	%i6,	%g1
	alignaddr	%l1,	%g4,	%l4
	xorcc	%o2,	%o6,	%l5
	ldd	[%l7 + 0x38],	%f18
	andncc	%l2,	%l3,	%l6
	sllx	%i7,	%g3,	%l0
	movrlez	%i0,	%o0,	%i2
	sdiv	%g6,	0x1F72,	%o3
	fpadd16s	%f18,	%f21,	%f3
	andncc	%i5,	%g2,	%o4
	fsrc1	%f14,	%f14
	save %g5, 0x0C92, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o7,	%i1,	%g7
	edge8ln	%o5,	%o1,	%i6
	fpadd32	%f14,	%f10,	%f26
	addcc	%i3,	0x09AF,	%l1
	fmuld8sux16	%f12,	%f27,	%f4
	sll	%g1,	0x14,	%l4
	movg	%xcc,	%o2,	%o6
	lduh	[%l7 + 0x26],	%g4
	udivx	%l5,	0x0AB1,	%l3
	movle	%xcc,	%l6,	%i7
	fmovd	%f8,	%f22
	move	%xcc,	%g3,	%l2
	fzeros	%f22
	mova	%icc,	%l0,	%o0
	edge32	%i0,	%g6,	%o3
	subcc	%i2,	%g2,	%o4
	fpsub16	%f4,	%f28,	%f10
	xor	%g5,	0x1F32,	%i4
	andn	%o7,	%i5,	%i1
	movn	%xcc,	%o5,	%g7
	edge16l	%i6,	%i3,	%l1
	udivx	%g1,	0x1DA1,	%l4
	movvs	%icc,	%o1,	%o6
	ld	[%l7 + 0x50],	%f31
	ld	[%l7 + 0x58],	%f15
	edge8n	%g4,	%l5,	%l3
	fmovsneg	%icc,	%f7,	%f2
	fmovde	%icc,	%f27,	%f20
	and	%l6,	0x1E68,	%o2
	sdiv	%g3,	0x177B,	%l2
	srax	%i7,	0x0C,	%l0
	fmovscc	%icc,	%f2,	%f13
	edge8l	%o0,	%i0,	%o3
	edge16ln	%i2,	%g2,	%o4
	move	%xcc,	%g5,	%i4
	fnands	%f11,	%f13,	%f27
	stw	%g6,	[%l7 + 0x44]
	array16	%o7,	%i1,	%o5
	mulscc	%i5,	0x0150,	%i6
	sdivx	%g7,	0x1BD5,	%l1
	movl	%xcc,	%i3,	%g1
	sdiv	%o1,	0x1A7F,	%o6
	movle	%icc,	%l4,	%l5
	smul	%l3,	0x1A9B,	%l6
	edge8l	%o2,	%g3,	%g4
	movcs	%xcc,	%l2,	%l0
	andcc	%o0,	0x138D,	%i0
	edge8	%o3,	%i2,	%g2
	std	%f10,	[%l7 + 0x30]
	edge32ln	%o4,	%i7,	%g5
	movpos	%icc,	%i4,	%g6
	movrgz	%o7,	0x38A,	%i1
	udiv	%i5,	0x1C0A,	%i6
	udivcc	%g7,	0x01A4,	%o5
	edge8n	%i3,	%g1,	%o1
	nop
	set	0x60, %o4
	std	%f16,	[%l7 + %o4]
	subccc	%o6,	0x131A,	%l1
	stw	%l5,	[%l7 + 0x0C]
	sra	%l3,	0x1D,	%l4
	movn	%xcc,	%l6,	%g3
	movle	%icc,	%g4,	%l2
	fxors	%f28,	%f16,	%f26
	restore %l0, %o0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o2,	%i2,	%g2
	fpsub16s	%f16,	%f27,	%f28
	mulx	%o4,	0x1CC0,	%i7
	sllx	%g5,	0x11,	%o3
	ldx	[%l7 + 0x28],	%g6
	std	%f30,	[%l7 + 0x70]
	andcc	%o7,	0x0A39,	%i1
	popc	%i5,	%i4
	smul	%g7,	0x1B26,	%i6
	fornot2	%f22,	%f0,	%f6
	edge32ln	%o5,	%g1,	%o1
	edge32l	%i3,	%o6,	%l5
	alignaddrl	%l3,	%l1,	%l6
	movre	%l4,	%g4,	%g3
	fcmple16	%f18,	%f12,	%l0
	popc	%o0,	%i0
	fmovdvs	%icc,	%f2,	%f27
	fcmpne16	%f20,	%f14,	%l2
	edge16n	%o2,	%g2,	%i2
	movre	%i7,	0x356,	%o4
	movl	%icc,	%g5,	%o3
	srlx	%g6,	%i1,	%i5
	ldsh	[%l7 + 0x5A],	%o7
	fandnot1	%f24,	%f18,	%f12
	fpsub32	%f12,	%f14,	%f20
	addcc	%i4,	%i6,	%g7
	movvc	%xcc,	%g1,	%o1
	fpack16	%f16,	%f21
	movgu	%xcc,	%i3,	%o6
	movne	%icc,	%l5,	%o5
	fcmpes	%fcc3,	%f18,	%f27
	ldsw	[%l7 + 0x18],	%l1
	movneg	%icc,	%l3,	%l4
	stw	%g4,	[%l7 + 0x70]
	fmovdle	%xcc,	%f17,	%f4
	fpadd16s	%f15,	%f20,	%f18
	alignaddr	%g3,	%l6,	%l0
	edge16n	%o0,	%l2,	%i0
	sllx	%o2,	0x0D,	%i2
	movvc	%icc,	%i7,	%g2
	array8	%g5,	%o3,	%o4
	movcc	%xcc,	%g6,	%i1
	subc	%i5,	0x159A,	%o7
	lduw	[%l7 + 0x24],	%i6
	movge	%icc,	%g7,	%g1
	subccc	%o1,	%i4,	%i3
	array8	%l5,	%o6,	%o5
	stw	%l1,	[%l7 + 0x7C]
	stw	%l3,	[%l7 + 0x20]
	popc	%l4,	%g3
	movrgz	%g4,	0x298,	%l6
	movcc	%icc,	%o0,	%l2
	mova	%icc,	%l0,	%i0
	alignaddrl	%o2,	%i7,	%i2
	sdivcc	%g2,	0x1E55,	%o3
	subcc	%g5,	%o4,	%g6
	fmul8sux16	%f22,	%f20,	%f6
	fmovspos	%icc,	%f22,	%f17
	stb	%i1,	[%l7 + 0x2F]
	nop
	set	0x50, %i5
	ldx	[%l7 + %i5],	%o7
	fabss	%f31,	%f19
	udivx	%i6,	0x0A35,	%g7
	addccc	%i5,	0x0A7C,	%g1
	fandnot1s	%f26,	%f25,	%f16
	stb	%o1,	[%l7 + 0x5E]
	ldsh	[%l7 + 0x64],	%i4
	ldsb	[%l7 + 0x65],	%l5
	movcc	%icc,	%o6,	%i3
	fornot1s	%f24,	%f0,	%f9
	popc	%o5,	%l3
	sllx	%l1,	%l4,	%g3
	add	%g4,	0x0CE8,	%l6
	fmovrdgez	%o0,	%f6,	%f12
	smul	%l2,	0x0706,	%l0
	edge16l	%o2,	%i7,	%i2
	sdivcc	%i0,	0x090C,	%o3
	xor	%g2,	%o4,	%g6
	andn	%i1,	%o7,	%i6
	move	%xcc,	%g5,	%i5
	subcc	%g7,	%o1,	%g1
	alignaddrl	%l5,	%i4,	%o6
	movne	%xcc,	%o5,	%i3
	sdivcc	%l1,	0x1E80,	%l4
	lduw	[%l7 + 0x3C],	%l3
	udivcc	%g3,	0x04E3,	%g4
	movcs	%icc,	%l6,	%o0
	movpos	%icc,	%l2,	%o2
	movne	%icc,	%i7,	%i2
	edge16n	%l0,	%o3,	%i0
	add	%o4,	%g6,	%i1
	fcmpne32	%f28,	%f28,	%o7
	mulscc	%g2,	%g5,	%i6
	ld	[%l7 + 0x54],	%f30
	movre	%g7,	%i5,	%g1
	st	%f2,	[%l7 + 0x48]
	fpack32	%f22,	%f14,	%f22
	udivx	%o1,	0x1652,	%l5
	smul	%i4,	%o6,	%i3
	udivx	%l1,	0x064D,	%o5
	movleu	%xcc,	%l4,	%g3
	umulcc	%l3,	0x0A8D,	%g4
	fnegs	%f29,	%f2
	orncc	%o0,	%l2,	%l6
	addcc	%o2,	%i7,	%l0
	std	%f0,	[%l7 + 0x40]
	xnorcc	%i2,	%i0,	%o3
	edge32n	%g6,	%i1,	%o7
	srl	%o4,	%g2,	%i6
	fandnot2s	%f13,	%f7,	%f22
	umulcc	%g5,	%i5,	%g1
	udivx	%o1,	0x0C54,	%l5
	stx	%g7,	[%l7 + 0x30]
	nop
	set	0x08, %o1
	ldsb	[%l7 + %o1],	%o6
	sethi	0x10D7,	%i4
	movrne	%l1,	0x145,	%i3
	fnands	%f21,	%f18,	%f19
	fandnot1s	%f1,	%f28,	%f16
	umul	%l4,	0x057B,	%o5
	umul	%g3,	%g4,	%o0
	fmovsvs	%icc,	%f20,	%f25
	movneg	%xcc,	%l2,	%l3
	edge16l	%l6,	%i7,	%l0
	sub	%o2,	0x028B,	%i0
	fpadd16	%f12,	%f8,	%f4
	xorcc	%o3,	%i2,	%g6
	xorcc	%o7,	%o4,	%g2
	fzeros	%f19
	st	%f2,	[%l7 + 0x6C]
	move	%xcc,	%i1,	%i6
	movcc	%icc,	%g5,	%i5
	edge16ln	%o1,	%g1,	%g7
	fnot1	%f10,	%f2
	movn	%icc,	%l5,	%o6
	fnot2s	%f7,	%f22
	fmovdg	%icc,	%f6,	%f7
	pdist	%f28,	%f16,	%f24
	andncc	%i4,	%l1,	%i3
	sub	%l4,	0x11A6,	%g3
	std	%f4,	[%l7 + 0x68]
	xnorcc	%o5,	%o0,	%g4
	srl	%l2,	%l3,	%l6
	srlx	%i7,	0x0A,	%o2
	save %l0, %i0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x63],	%o3
	fpadd32s	%f14,	%f9,	%f29
	xor	%g6,	%o7,	%g2
	stw	%o4,	[%l7 + 0x08]
	st	%f5,	[%l7 + 0x5C]
	fmovde	%icc,	%f8,	%f14
	edge16ln	%i6,	%g5,	%i1
	edge16ln	%o1,	%i5,	%g1
	edge16l	%l5,	%g7,	%o6
	srl	%i4,	%i3,	%l1
	ld	[%l7 + 0x68],	%f25
	addccc	%l4,	0x06F2,	%o5
	movvc	%icc,	%o0,	%g3
	edge32ln	%g4,	%l2,	%l3
	movcc	%icc,	%i7,	%o2
	edge32	%l0,	%i0,	%i2
	fmul8x16al	%f16,	%f25,	%f22
	add	%o3,	0x0DD9,	%l6
	sth	%g6,	[%l7 + 0x1C]
	fornot1s	%f23,	%f31,	%f18
	movpos	%xcc,	%o7,	%g2
	subcc	%i6,	%o4,	%g5
	xor	%o1,	0x1D6F,	%i1
	sth	%i5,	[%l7 + 0x40]
	udivx	%g1,	0x1952,	%g7
	movrlez	%l5,	%o6,	%i3
	edge32l	%l1,	%i4,	%l4
	addc	%o0,	%o5,	%g4
	movrlz	%l2,	%g3,	%i7
	sethi	0x192F,	%o2
	sir	0x1301
	fpsub16s	%f30,	%f26,	%f30
	alignaddrl	%l3,	%i0,	%i2
	movvs	%xcc,	%l0,	%l6
	addccc	%o3,	0x17DE,	%g6
	movl	%xcc,	%g2,	%o7
	edge32n	%o4,	%i6,	%g5
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	movneg	%icc,	%g1,	%g7
	sra	%l5,	0x1B,	%i5
	umul	%i3,	0x16B6,	%o6
	fsrc2s	%f22,	%f25
	movle	%xcc,	%l1,	%i4
	sethi	0x1540,	%o0
	nop
	set	0x48, %g7
	ldsh	[%l7 + %g7],	%o5
	edge8l	%g4,	%l2,	%g3
	xnorcc	%l4,	0x0F6D,	%i7
	movrgez	%l3,	0x214,	%o2
	fzero	%f12
	fnands	%f16,	%f11,	%f3
	fmul8x16al	%f14,	%f16,	%f18
	fmovde	%icc,	%f6,	%f3
	edge8l	%i2,	%l0,	%l6
	xor	%o3,	0x1A7E,	%g6
	lduw	[%l7 + 0x18],	%g2
	smulcc	%o7,	%i0,	%o4
	fmovdl	%icc,	%f30,	%f6
	xnor	%i6,	%g5,	%o1
	ldsb	[%l7 + 0x77],	%i1
	edge32n	%g7,	%g1,	%l5
	alignaddrl	%i3,	%i5,	%o6
	array16	%l1,	%i4,	%o5
	fsrc2s	%f12,	%f0
	fabss	%f1,	%f29
	srax	%g4,	0x14,	%l2
	subccc	%o0,	0x1939,	%g3
	bshuffle	%f10,	%f22,	%f8
	movrlez	%l4,	%l3,	%o2
	fand	%f4,	%f4,	%f20
	sra	%i7,	%l0,	%l6
	sir	0x1964
	smulcc	%i2,	0x1B16,	%g6
	edge16ln	%o3,	%g2,	%o7
	array32	%o4,	%i0,	%g5
	fmuld8sux16	%f12,	%f22,	%f16
	move	%xcc,	%i6,	%i1
	movl	%icc,	%g7,	%o1
	fmovsg	%icc,	%f3,	%f28
	addccc	%l5,	%i3,	%g1
	fmovdgu	%xcc,	%f28,	%f30
	movneg	%icc,	%o6,	%i5
	edge32n	%l1,	%o5,	%i4
	edge16ln	%g4,	%o0,	%l2
	fmovsvs	%icc,	%f8,	%f12
	alignaddrl	%g3,	%l3,	%l4
	array32	%i7,	%o2,	%l0
	movle	%xcc,	%i2,	%g6
	ldd	[%l7 + 0x58],	%f10
	movcs	%icc,	%l6,	%g2
	fpsub32s	%f15,	%f0,	%f12
	fmovdneg	%xcc,	%f2,	%f28
	fmovsg	%xcc,	%f30,	%f25
	and	%o7,	0x19A0,	%o3
	ld	[%l7 + 0x08],	%f22
	sdivcc	%o4,	0x1918,	%i0
	edge32l	%g5,	%i1,	%i6
	fsrc2	%f24,	%f8
	andcc	%o1,	%l5,	%i3
	ldub	[%l7 + 0x60],	%g7
	movge	%xcc,	%o6,	%i5
	udivcc	%l1,	0x02F3,	%g1
	edge32	%o5,	%i4,	%o0
	xorcc	%l2,	%g4,	%g3
	fmovrdlez	%l4,	%f8,	%f26
	fmul8ulx16	%f8,	%f12,	%f12
	xorcc	%l3,	%o2,	%i7
	nop
	set	0x70, %l6
	stx	%l0,	[%l7 + %l6]
	movrlez	%g6,	0x000,	%l6
	edge16	%g2,	%o7,	%o3
	or	%i2,	%i0,	%g5
	movgu	%icc,	%i1,	%i6
	udivx	%o1,	0x0F60,	%l5
	fmovda	%icc,	%f17,	%f29
	movn	%icc,	%o4,	%i3
	edge32ln	%o6,	%g7,	%i5
	fone	%f12
	edge8	%l1,	%o5,	%i4
	movpos	%xcc,	%g1,	%o0
	ldsw	[%l7 + 0x74],	%l2
	lduw	[%l7 + 0x10],	%g3
	fmovdleu	%icc,	%f6,	%f18
	smul	%g4,	%l3,	%l4
	movrgz	%o2,	0x204,	%i7
	st	%f0,	[%l7 + 0x64]
	fcmpgt32	%f2,	%f20,	%l0
	ldsb	[%l7 + 0x12],	%l6
	sra	%g2,	0x07,	%g6
	sllx	%o3,	%i2,	%i0
	save %g5, %i1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	%l5,	%i6
	ld	[%l7 + 0x60],	%f24
	faligndata	%f22,	%f10,	%f16
	alignaddr	%o4,	%i3,	%o6
	edge16n	%g7,	%i5,	%o5
	movpos	%xcc,	%l1,	%g1
	edge32ln	%o0,	%l2,	%i4
	xorcc	%g4,	%g3,	%l4
	sth	%l3,	[%l7 + 0x10]
	sdiv	%i7,	0x04C1,	%l0
	umul	%l6,	0x0325,	%g2
	xnorcc	%o2,	%o3,	%g6
	umul	%i0,	0x00C4,	%g5
	addccc	%i1,	%o7,	%o1
	pdist	%f2,	%f4,	%f8
	smul	%i2,	%i6,	%o4
	ldx	[%l7 + 0x48],	%l5
	fmul8sux16	%f6,	%f28,	%f20
	or	%i3,	0x0C2F,	%g7
	fandnot1s	%f19,	%f27,	%f10
	addcc	%i5,	0x068B,	%o6
	save %l1, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o5,	%i4
	mova	%xcc,	%g4,	%g3
	edge8ln	%l4,	%l2,	%l3
	sub	%l0,	0x15CD,	%i7
	and	%l6,	%o2,	%o3
	srl	%g2,	%g6,	%i0
	fnot2	%f30,	%f12
	umul	%g5,	%o7,	%o1
	fands	%f14,	%f25,	%f25
	andcc	%i1,	0x0CEC,	%i2
	movcc	%xcc,	%i6,	%l5
	fmovdvs	%xcc,	%f14,	%f19
	st	%f14,	[%l7 + 0x60]
	mova	%icc,	%o4,	%g7
	ldsh	[%l7 + 0x7A],	%i5
	stx	%i3,	[%l7 + 0x70]
	fabsd	%f18,	%f26
	ldx	[%l7 + 0x18],	%o6
	ldsh	[%l7 + 0x4C],	%g1
	fmovdcc	%xcc,	%f13,	%f4
	fandnot1s	%f12,	%f29,	%f17
	mulx	%o0,	%o5,	%l1
	move	%xcc,	%i4,	%g3
	move	%xcc,	%l4,	%g4
	edge8l	%l3,	%l0,	%i7
	edge16l	%l2,	%o2,	%o3
	fpackfix	%f20,	%f9
	fmovdgu	%xcc,	%f12,	%f2
	movgu	%xcc,	%l6,	%g6
	stx	%g2,	[%l7 + 0x50]
	st	%f21,	[%l7 + 0x48]
	std	%f16,	[%l7 + 0x68]
	srax	%i0,	%o7,	%o1
	bshuffle	%f24,	%f2,	%f26
	stb	%i1,	[%l7 + 0x32]
	nop
	set	0x50, %o5
	ldsb	[%l7 + %o5],	%i2
	udivx	%g5,	0x1FB6,	%i6
	faligndata	%f2,	%f26,	%f16
	addcc	%l5,	%g7,	%i5
	sir	0x0824
	fpsub32	%f6,	%f12,	%f6
	fpsub32s	%f20,	%f6,	%f27
	movrne	%o4,	0x0CC,	%o6
	fmovda	%xcc,	%f6,	%f4
	ldd	[%l7 + 0x68],	%g0
	ldsh	[%l7 + 0x7C],	%i3
	edge16n	%o0,	%o5,	%l1
	edge16n	%i4,	%l4,	%g3
	movrne	%g4,	%l3,	%i7
	movcs	%xcc,	%l0,	%l2
	std	%f10,	[%l7 + 0x68]
	movg	%xcc,	%o2,	%o3
	alignaddrl	%l6,	%g2,	%g6
	sra	%i0,	0x17,	%o7
	xnor	%i1,	0x0F9E,	%o1
	stb	%g5,	[%l7 + 0x2F]
	smulcc	%i2,	%i6,	%g7
	addccc	%l5,	0x13A6,	%i5
	smulcc	%o4,	0x0D0B,	%g1
	fmovsleu	%icc,	%f23,	%f7
	movrgez	%o6,	%i3,	%o0
	edge16ln	%o5,	%i4,	%l4
	lduw	[%l7 + 0x38],	%g3
	movre	%l1,	0x0EC,	%g4
	nop
	set	0x30, %o3
	stb	%l3,	[%l7 + %o3]
	nop
	set	0x1C, %i6
	sth	%i7,	[%l7 + %i6]
	alignaddrl	%l0,	%l2,	%o3
	udiv	%l6,	0x04C8,	%g2
	stw	%o2,	[%l7 + 0x10]
	sra	%i0,	0x1B,	%o7
	lduw	[%l7 + 0x44],	%i1
	alignaddrl	%g6,	%g5,	%o1
	fones	%f4
	movgu	%icc,	%i2,	%g7
	mulscc	%i6,	0x1878,	%l5
	addccc	%o4,	0x1A2E,	%i5
	sllx	%o6,	%i3,	%o0
	sdivx	%o5,	0x1840,	%i4
	movg	%xcc,	%g1,	%g3
	movleu	%xcc,	%l4,	%g4
	movg	%icc,	%l1,	%l3
	fmovrdgz	%l0,	%f14,	%f20
	movge	%xcc,	%i7,	%l2
	fsrc1	%f30,	%f24
	fcmple32	%f12,	%f16,	%l6
	ldsb	[%l7 + 0x68],	%o3
	ldub	[%l7 + 0x38],	%o2
	restore %i0, %g2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o7,	%g6,	%g5
	edge16n	%o1,	%i2,	%i6
	stb	%l5,	[%l7 + 0x13]
	mova	%icc,	%o4,	%g7
	fmovdle	%icc,	%f9,	%f26
	fmovde	%xcc,	%f0,	%f11
	udiv	%o6,	0x10C5,	%i5
	movne	%xcc,	%o0,	%o5
	sth	%i4,	[%l7 + 0x72]
	udiv	%g1,	0x022A,	%g3
	fmul8ulx16	%f4,	%f20,	%f2
	fzeros	%f29
	fpadd16	%f10,	%f6,	%f24
	edge32ln	%i3,	%g4,	%l1
	orn	%l4,	0x01F0,	%l0
	orncc	%i7,	%l3,	%l2
	movvs	%xcc,	%l6,	%o2
	fmovsg	%xcc,	%f30,	%f24
	ldsb	[%l7 + 0x30],	%i0
	movvs	%icc,	%g2,	%i1
	edge32n	%o7,	%o3,	%g6
	sdiv	%o1,	0x1579,	%i2
	and	%i6,	%l5,	%g5
	fmul8x16	%f12,	%f0,	%f14
	srax	%o4,	%g7,	%o6
	or	%o0,	%o5,	%i5
	ldd	[%l7 + 0x40],	%g0
	mulscc	%g3,	0x127D,	%i4
	movge	%icc,	%i3,	%g4
	std	%f14,	[%l7 + 0x38]
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	fmovdneg	%xcc,	%f21,	%f20
	std	%f14,	[%l7 + 0x58]
	udivcc	%l0,	0x0880,	%i7
	edge8l	%l2,	%l6,	%l3
	umul	%i0,	0x1274,	%g2
	sll	%o2,	0x18,	%i1
	array32	%o3,	%o7,	%o1
	nop
	set	0x6D, %l0
	ldub	[%l7 + %l0],	%g6
	array16	%i6,	%l5,	%g5
	movre	%i2,	0x22D,	%o4
	fmovdge	%icc,	%f21,	%f8
	fzero	%f24
	movl	%icc,	%g7,	%o0
	srlx	%o6,	%o5,	%i5
	movvs	%icc,	%g1,	%i4
	movpos	%icc,	%g3,	%i3
	edge32ln	%l4,	%g4,	%l1
	orcc	%i7,	0x062A,	%l2
	sth	%l6,	[%l7 + 0x50]
	fmovsg	%icc,	%f27,	%f10
	fornot1	%f22,	%f6,	%f30
	udivx	%l0,	0x14AE,	%l3
	movcs	%xcc,	%i0,	%o2
	fexpand	%f29,	%f30
	andncc	%g2,	%i1,	%o3
	alignaddr	%o7,	%g6,	%o1
	ldub	[%l7 + 0x0A],	%l5
	movleu	%xcc,	%g5,	%i2
	addc	%o4,	%i6,	%o0
	nop
	set	0x28, %l1
	lduh	[%l7 + %l1],	%o6
	array16	%o5,	%g7,	%i5
	srax	%i4,	0x19,	%g1
	fmul8x16al	%f25,	%f7,	%f18
	ldx	[%l7 + 0x18],	%g3
	andcc	%i3,	0x04F0,	%l4
	edge8n	%g4,	%i7,	%l1
	edge8ln	%l6,	%l2,	%l0
	srlx	%l3,	%o2,	%g2
	sethi	0x16FF,	%i1
	addc	%i0,	%o3,	%o7
	srax	%g6,	%o1,	%g5
	fmovrdgez	%i2,	%f30,	%f28
	and	%l5,	%o4,	%o0
	smulcc	%o6,	%o5,	%g7
	edge32	%i5,	%i4,	%g1
	stb	%g3,	[%l7 + 0x3F]
	edge32n	%i6,	%l4,	%i3
	ldsw	[%l7 + 0x10],	%i7
	ldx	[%l7 + 0x18],	%l1
	subccc	%l6,	0x0FB6,	%l2
	xnor	%g4,	0x064A,	%l3
	srl	%o2,	%g2,	%i1
	fandnot1s	%f1,	%f27,	%f0
	fcmpd	%fcc2,	%f14,	%f0
	fmovsne	%icc,	%f14,	%f9
	orn	%l0,	%i0,	%o3
	nop
	set	0x36, %o2
	stb	%g6,	[%l7 + %o2]
	movrgez	%o1,	%g5,	%i2
	xnorcc	%l5,	0x17AA,	%o4
	fmovrse	%o0,	%f16,	%f7
	fmovdge	%xcc,	%f13,	%f8
	fsrc1s	%f27,	%f23
	xnorcc	%o7,	%o6,	%o5
	srl	%g7,	0x17,	%i5
	edge8l	%g1,	%g3,	%i4
	movrlez	%i6,	0x301,	%l4
	sethi	0x0A57,	%i3
	lduh	[%l7 + 0x20],	%i7
	ldsb	[%l7 + 0x45],	%l1
	ldd	[%l7 + 0x20],	%l2
	smul	%l6,	0x0FD2,	%g4
	ldsh	[%l7 + 0x44],	%o2
	fmovrdlz	%l3,	%f20,	%f10
	orn	%g2,	0x0B55,	%l0
	bshuffle	%f24,	%f22,	%f30
	edge32l	%i1,	%o3,	%i0
	sir	0x029D
	ldd	[%l7 + 0x10],	%f30
	fsrc2s	%f29,	%f17
	orncc	%g6,	%o1,	%g5
	srax	%i2,	0x03,	%o4
	movrgez	%o0,	0x1CD,	%l5
	orcc	%o6,	%o5,	%o7
	fmovrsgz	%i5,	%f7,	%f5
	edge32l	%g1,	%g7,	%i4
	stw	%i6,	[%l7 + 0x20]
	ldsw	[%l7 + 0x1C],	%l4
	edge16ln	%i3,	%i7,	%g3
	ldsb	[%l7 + 0x69],	%l1
	movcs	%xcc,	%l6,	%g4
	edge8l	%l2,	%l3,	%o2
	stw	%g2,	[%l7 + 0x30]
	add	%l0,	%i1,	%i0
	udivx	%g6,	0x0176,	%o1
	movg	%xcc,	%g5,	%i2
	fandnot1	%f16,	%f20,	%f4
	alignaddr	%o4,	%o0,	%o3
	fmovd	%f24,	%f20
	mulscc	%o6,	%o5,	%l5
	edge8l	%i5,	%g1,	%o7
	xnorcc	%g7,	%i6,	%i4
	ld	[%l7 + 0x44],	%f4
	srlx	%i3,	0x1B,	%i7
	fnot2	%f22,	%f0
	fpsub32s	%f5,	%f13,	%f0
	ldd	[%l7 + 0x08],	%f12
	umulcc	%l4,	0x1D0A,	%g3
	edge8n	%l6,	%l1,	%g4
	movvs	%icc,	%l2,	%l3
	ldd	[%l7 + 0x68],	%g2
	addcc	%l0,	0x093E,	%o2
	fxor	%f0,	%f28,	%f10
	edge16	%i0,	%g6,	%o1
	alignaddrl	%i1,	%i2,	%o4
	fmovsge	%xcc,	%f22,	%f8
	mulscc	%g5,	0x0757,	%o3
	movne	%xcc,	%o0,	%o6
	andn	%l5,	0x0389,	%i5
	orn	%o5,	%o7,	%g7
	movrgez	%g1,	%i6,	%i4
	alignaddr	%i3,	%l4,	%g3
	fmul8sux16	%f30,	%f8,	%f8
	fmovsvs	%icc,	%f24,	%f12
	sdivx	%i7,	0x0EE8,	%l6
	umul	%g4,	0x0113,	%l1
	fmovsg	%xcc,	%f12,	%f24
	sra	%l3,	%l2,	%g2
	fmovdle	%icc,	%f8,	%f25
	xorcc	%o2,	%i0,	%l0
	udivcc	%o1,	0x0E9A,	%i1
	movleu	%xcc,	%i2,	%g6
	fexpand	%f24,	%f16
	subc	%o4,	%g5,	%o0
	fmovsg	%icc,	%f31,	%f16
	sra	%o6,	0x05,	%o3
	sdiv	%i5,	0x0FD8,	%o5
	subc	%o7,	0x0988,	%g7
	udivx	%g1,	0x032F,	%i6
	movleu	%xcc,	%i4,	%i3
	movneg	%icc,	%l4,	%g3
	smul	%i7,	0x0F3D,	%l6
	fpsub16s	%f19,	%f6,	%f12
	stx	%g4,	[%l7 + 0x68]
	umulcc	%l1,	%l5,	%l3
	ldsh	[%l7 + 0x42],	%l2
	fands	%f31,	%f31,	%f21
	mulscc	%o2,	0x1580,	%g2
	movre	%i0,	%l0,	%o1
	stb	%i2,	[%l7 + 0x73]
	smulcc	%g6,	0x13AA,	%i1
	lduw	[%l7 + 0x44],	%g5
	stx	%o0,	[%l7 + 0x30]
	udiv	%o4,	0x0EF3,	%o3
	orcc	%o6,	0x041D,	%o5
	siam	0x3
	ldd	[%l7 + 0x18],	%f24
	edge8ln	%i5,	%o7,	%g7
	alignaddrl	%g1,	%i4,	%i6
	lduw	[%l7 + 0x7C],	%l4
	fandnot2s	%f1,	%f10,	%f2
	umul	%g3,	0x0D3F,	%i7
	array16	%i3,	%g4,	%l1
	pdist	%f24,	%f12,	%f0
	movrlz	%l6,	0x145,	%l3
	udiv	%l2,	0x1FBD,	%o2
	edge16n	%l5,	%i0,	%l0
	save %g2, %i2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i1,	0x1906,	%g6
	move	%icc,	%o0,	%o4
	fmovrdlz	%g5,	%f6,	%f0
	stx	%o3,	[%l7 + 0x50]
	fandnot2s	%f29,	%f1,	%f18
	fones	%f22
	add	%o5,	%i5,	%o6
	array32	%o7,	%g1,	%i4
	movleu	%icc,	%g7,	%i6
	movge	%icc,	%g3,	%i7
	ldd	[%l7 + 0x08],	%l4
	udiv	%i3,	0x116E,	%l1
	ldsh	[%l7 + 0x62],	%l6
	srax	%l3,	%l2,	%g4
	addccc	%o2,	0x1E89,	%l5
	movpos	%xcc,	%i0,	%l0
	fnor	%f24,	%f22,	%f24
	move	%icc,	%g2,	%i2
	movge	%icc,	%i1,	%o1
	edge32	%g6,	%o4,	%g5
	movg	%icc,	%o3,	%o5
	fmovrsne	%i5,	%f28,	%f28
	fornot2s	%f9,	%f23,	%f5
	ld	[%l7 + 0x6C],	%f10
	srax	%o6,	%o0,	%o7
	andncc	%i4,	%g7,	%g1
	save %i6, 0x0B41, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0490,	%g3
	fmovde	%icc,	%f21,	%f27
	mulx	%l4,	0x0748,	%i3
	alignaddr	%l1,	%l3,	%l6
	fcmpgt16	%f4,	%f30,	%l2
	movrgez	%o2,	0x124,	%g4
	udiv	%i0,	0x13F0,	%l5
	movle	%xcc,	%g2,	%l0
	save %i2, 0x1397, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f20,	%f18,	%g6
	movne	%icc,	%i1,	%o4
	movrlz	%g5,	0x263,	%o3
	sdivx	%i5,	0x1F9B,	%o5
	fnot2s	%f10,	%f27
	movn	%xcc,	%o6,	%o7
	udiv	%o0,	0x0B24,	%g7
	add	%i4,	0x13F4,	%g1
	fpadd32s	%f1,	%f8,	%f31
	movpos	%xcc,	%i6,	%g3
	xnorcc	%l4,	0x075E,	%i7
	fpadd16	%f20,	%f18,	%f24
	edge16ln	%l1,	%l3,	%i3
	save %l6, %o2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f16,	%f22,	%f12
	sllx	%l2,	%i0,	%l5
	fmovdcs	%icc,	%f5,	%f7
	movrlz	%l0,	%i2,	%o1
	addccc	%g2,	0x11DC,	%g6
	udivcc	%o4,	0x0831,	%i1
	udivx	%g5,	0x1D10,	%o3
	movne	%xcc,	%o5,	%o6
	fcmple32	%f24,	%f16,	%o7
	udivx	%o0,	0x03A8,	%i5
	andncc	%g7,	%g1,	%i6
	ldd	[%l7 + 0x40],	%i4
	umulcc	%g3,	%i7,	%l4
	edge8n	%l3,	%i3,	%l6
	orn	%o2,	%g4,	%l2
	edge32	%i0,	%l5,	%l0
	edge8ln	%l1,	%o1,	%g2
	fornot2s	%f5,	%f1,	%f29
	fmovsg	%icc,	%f27,	%f8
	edge16n	%g6,	%i2,	%i1
	popc	%g5,	%o3
	sdivcc	%o5,	0x148B,	%o6
	movcc	%icc,	%o7,	%o4
	stw	%i5,	[%l7 + 0x34]
	edge16	%g7,	%o0,	%g1
	movg	%icc,	%i6,	%g3
	fmovsleu	%xcc,	%f17,	%f19
	alignaddr	%i7,	%i4,	%l4
	fcmpne32	%f0,	%f28,	%l3
	mulx	%i3,	0x12AF,	%o2
	sll	%l6,	%g4,	%l2
	edge32l	%l5,	%l0,	%i0
	std	%f28,	[%l7 + 0x08]
	movne	%xcc,	%l1,	%g2
	orcc	%g6,	0x0288,	%i2
	mova	%icc,	%o1,	%i1
	xnorcc	%o3,	0x1CC5,	%g5
	edge32ln	%o6,	%o5,	%o4
	stx	%i5,	[%l7 + 0x28]
	fcmped	%fcc2,	%f4,	%f18
	movpos	%icc,	%o7,	%o0
	sth	%g1,	[%l7 + 0x58]
	movcs	%icc,	%g7,	%i6
	orn	%g3,	0x069E,	%i7
	popc	0x04F3,	%l4
	array32	%l3,	%i4,	%o2
	add	%i3,	%g4,	%l6
	movre	%l2,	0x0EB,	%l0
	fsrc2	%f22,	%f22
	edge8	%i0,	%l5,	%l1
	move	%icc,	%g2,	%i2
	movne	%icc,	%g6,	%o1
	xnor	%i1,	0x19F4,	%o3
	subc	%o6,	%g5,	%o4
	xorcc	%o5,	%o7,	%i5
	edge16	%g1,	%o0,	%g7
	udivx	%i6,	0x19BF,	%i7
	fmovrsgez	%g3,	%f7,	%f24
	ldsb	[%l7 + 0x28],	%l3
	movle	%icc,	%i4,	%o2
	movrlz	%i3,	%l4,	%g4
	movgu	%icc,	%l6,	%l0
	movneg	%icc,	%i0,	%l2
	fmovdcs	%xcc,	%f28,	%f7
	fmovdg	%xcc,	%f24,	%f20
	movl	%icc,	%l1,	%l5
	lduh	[%l7 + 0x4E],	%i2
	movneg	%icc,	%g6,	%o1
	sra	%g2,	0x0E,	%o3
	subc	%i1,	%g5,	%o4
	fmovdcc	%xcc,	%f2,	%f15
	movvs	%icc,	%o5,	%o6
	edge16	%o7,	%g1,	%i5
	fnot2	%f30,	%f14
	nop
	set	0x63, %g6
	ldub	[%l7 + %g6],	%o0
	fcmpeq16	%f8,	%f2,	%i6
	nop
	set	0x2F, %i4
	ldsb	[%l7 + %i4],	%g7
	edge8ln	%g3,	%l3,	%i4
	fornot1	%f22,	%f16,	%f6
	restore %i7, %o2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%g4,	%f14,	%f2
	movne	%icc,	%l6,	%l0
	fandnot2	%f24,	%f26,	%f8
	sethi	0x1C95,	%i0
	udiv	%i3,	0x1FE3,	%l1
	alignaddr	%l2,	%i2,	%l5
	ldsb	[%l7 + 0x25],	%o1
	xor	%g2,	%o3,	%i1
	fcmpeq32	%f14,	%f22,	%g6
	sdiv	%o4,	0x166F,	%o5
	addc	%g5,	%o7,	%g1
	andn	%o6,	%o0,	%i5
	ldsb	[%l7 + 0x7A],	%g7
	movvc	%xcc,	%i6,	%l3
	fmovrslz	%i4,	%f4,	%f20
	smul	%g3,	0x17F7,	%i7
	fmovdne	%icc,	%f10,	%f23
	fmuld8ulx16	%f0,	%f20,	%f18
	andncc	%o2,	%g4,	%l6
	sub	%l0,	%l4,	%i0
	fnot2	%f8,	%f30
	movn	%xcc,	%i3,	%l2
	udivx	%i2,	0x1F41,	%l5
	fcmpeq16	%f6,	%f18,	%l1
	fnot1s	%f10,	%f11
	orn	%g2,	0x18FD,	%o3
	edge8	%i1,	%o1,	%o4
	mulx	%o5,	%g5,	%g6
	andcc	%o7,	0x1328,	%g1
	sir	0x1F94
	movrlz	%o6,	0x11D,	%i5
	movre	%o0,	%i6,	%g7
	udivx	%l3,	0x1DCF,	%i4
	fpadd16s	%f5,	%f8,	%f15
	fone	%f0
	array16	%g3,	%o2,	%i7
	orcc	%l6,	%l0,	%g4
	fnegd	%f28,	%f24
	orncc	%i0,	0x1F99,	%l4
	sir	0x0EA5
	fzero	%f0
	or	%i3,	%l2,	%i2
	fmovdge	%icc,	%f18,	%f8
	subc	%l5,	%l1,	%o3
	fmovsvc	%icc,	%f8,	%f30
	smulcc	%g2,	0x1558,	%o1
	movneg	%xcc,	%o4,	%i1
	addc	%g5,	0x0411,	%g6
	subcc	%o5,	%o7,	%o6
	fabss	%f13,	%f17
	ldd	[%l7 + 0x58],	%i4
	fmuld8ulx16	%f8,	%f22,	%f12
	stw	%o0,	[%l7 + 0x68]
	orcc	%i6,	0x1961,	%g1
	mova	%icc,	%g7,	%i4
	fmovsl	%xcc,	%f8,	%f28
	movrgz	%g3,	0x0FD,	%l3
	fmul8sux16	%f24,	%f14,	%f20
	andncc	%i7,	%o2,	%l0
	movrgz	%l6,	0x035,	%g4
	mulscc	%l4,	0x1E99,	%i3
	fmovrdlez	%l2,	%f22,	%f2
	subcc	%i0,	0x182B,	%l5
	array32	%l1,	%i2,	%o3
	edge32n	%o1,	%o4,	%i1
	movrne	%g2,	%g6,	%g5
	movleu	%xcc,	%o7,	%o5
	fmovsge	%icc,	%f15,	%f16
	mulx	%i5,	0x043D,	%o6
	mova	%icc,	%o0,	%g1
	edge32l	%i6,	%i4,	%g7
	ldsb	[%l7 + 0x23],	%g3
	fcmple32	%f8,	%f24,	%i7
	srl	%o2,	%l0,	%l3
	fcmpgt32	%f20,	%f4,	%g4
	array32	%l4,	%l6,	%l2
	addccc	%i0,	%l5,	%i3
	movrlz	%l1,	0x2BA,	%o3
	subcc	%o1,	%o4,	%i1
	fpadd16	%f20,	%f0,	%f0
	lduh	[%l7 + 0x66],	%g2
	umul	%i2,	%g6,	%o7
	movge	%icc,	%o5,	%g5
	movn	%xcc,	%o6,	%i5
	lduh	[%l7 + 0x08],	%o0
	addccc	%g1,	%i4,	%i6
	edge8ln	%g3,	%i7,	%g7
	edge8l	%o2,	%l0,	%l3
	fmovdn	%icc,	%f4,	%f15
	addc	%g4,	%l4,	%l2
	xnor	%i0,	%l5,	%l6
	movcc	%xcc,	%l1,	%i3
	sdivcc	%o1,	0x06A6,	%o4
	std	%f4,	[%l7 + 0x60]
	edge8ln	%i1,	%g2,	%i2
	movrne	%g6,	%o3,	%o5
	fmovrdgz	%g5,	%f24,	%f18
	andncc	%o7,	%i5,	%o0
	movrgez	%g1,	%o6,	%i6
	edge16n	%i4,	%i7,	%g7
	mova	%icc,	%g3,	%l0
	edge16l	%l3,	%g4,	%o2
	srax	%l2,	%l4,	%i0
	movvc	%xcc,	%l6,	%l1
	movg	%icc,	%l5,	%o1
	srlx	%i3,	%o4,	%i1
	movcc	%xcc,	%i2,	%g2
	mulscc	%o3,	0x0261,	%g6
	sdivx	%g5,	0x085A,	%o7
	orncc	%o5,	0x0D98,	%o0
	fones	%f13
	xor	%g1,	0x0741,	%o6
	sdiv	%i5,	0x04FD,	%i6
	alignaddr	%i7,	%g7,	%g3
	srax	%l0,	0x05,	%l3
	lduw	[%l7 + 0x78],	%g4
	addccc	%o2,	0x1061,	%l2
	movneg	%icc,	%l4,	%i4
	sdivx	%l6,	0x0130,	%i0
	fmovdne	%icc,	%f22,	%f24
	array32	%l1,	%o1,	%l5
	umulcc	%i3,	0x0EAB,	%o4
	edge32n	%i2,	%g2,	%o3
	edge8l	%g6,	%i1,	%o7
	movrgz	%g5,	%o5,	%o0
	edge32l	%o6,	%g1,	%i5
	movrlez	%i7,	%i6,	%g7
	movne	%icc,	%g3,	%l3
	ldsb	[%l7 + 0x18],	%l0
	sth	%g4,	[%l7 + 0x3E]
	fmovrslz	%o2,	%f31,	%f28
	array16	%l2,	%l4,	%l6
	movcs	%xcc,	%i4,	%l1
	subc	%o1,	0x0A07,	%i0
	edge16	%l5,	%i3,	%o4
	array8	%g2,	%i2,	%g6
	sethi	0x1AFA,	%i1
	lduw	[%l7 + 0x38],	%o3
	sethi	0x01C0,	%g5
	subccc	%o7,	0x19EC,	%o0
	movvc	%icc,	%o6,	%o5
	or	%g1,	%i5,	%i6
	udivx	%i7,	0x1334,	%g3
	mova	%xcc,	%l3,	%g7
	array8	%g4,	%o2,	%l0
	xnor	%l2,	0x13B5,	%l4
	edge32n	%i4,	%l1,	%l6
	movvc	%xcc,	%o1,	%l5
	sdivcc	%i0,	0x0DDA,	%i3
	udivcc	%g2,	0x0C60,	%i2
	array32	%o4,	%i1,	%g6
	umul	%o3,	0x0023,	%g5
	fpsub16s	%f3,	%f19,	%f19
	addccc	%o0,	%o7,	%o5
	fnegd	%f0,	%f24
	edge16ln	%g1,	%i5,	%o6
	movle	%icc,	%i6,	%g3
	movgu	%xcc,	%l3,	%i7
	ld	[%l7 + 0x14],	%f6
	xnorcc	%g7,	%g4,	%l0
	fmovsle	%xcc,	%f12,	%f29
	smulcc	%o2,	0x08FE,	%l2
	sll	%l4,	0x18,	%l1
	fnegd	%f10,	%f20
	array8	%i4,	%o1,	%l5
	edge8n	%i0,	%i3,	%l6
	addcc	%g2,	0x0E2C,	%i2
	xnor	%i1,	0x1D4B,	%o4
	fmovrdlez	%g6,	%f10,	%f24
	movrlz	%g5,	%o3,	%o7
	fmovsleu	%icc,	%f29,	%f5
	nop
	set	0x60, %i2
	lduw	[%l7 + %i2],	%o5
	fmovs	%f23,	%f22
	or	%g1,	%i5,	%o0
	fmovscs	%xcc,	%f25,	%f21
	fmovsn	%icc,	%f1,	%f8
	sll	%i6,	0x0D,	%g3
	fmovsa	%xcc,	%f13,	%f5
	add	%l3,	0x0B6A,	%o6
	sllx	%i7,	%g4,	%l0
	subccc	%g7,	%o2,	%l2
	fmovsleu	%xcc,	%f23,	%f28
	fcmple16	%f22,	%f14,	%l4
	edge16l	%i4,	%o1,	%l5
	fmovsleu	%icc,	%f12,	%f27
	edge8	%l1,	%i0,	%i3
	fmul8sux16	%f12,	%f8,	%f28
	fmovsa	%icc,	%f14,	%f31
	movl	%xcc,	%g2,	%l6
	or	%i1,	%i2,	%o4
	movleu	%icc,	%g5,	%g6
	fpack16	%f8,	%f15
	movl	%xcc,	%o7,	%o3
	smulcc	%o5,	%g1,	%o0
	xorcc	%i5,	0x1541,	%i6
	sdivx	%l3,	0x1E73,	%g3
	movrgz	%i7,	%g4,	%o6
	fcmps	%fcc1,	%f23,	%f7
	ldd	[%l7 + 0x70],	%f26
	edge16l	%g7,	%l0,	%o2
	movcc	%xcc,	%l4,	%l2
	andn	%i4,	%l5,	%l1
	popc	0x1517,	%o1
	xor	%i3,	%i0,	%l6
	fmovs	%f12,	%f22
	movleu	%icc,	%i1,	%i2
	fmovdg	%xcc,	%f28,	%f0
	orncc	%g2,	0x01AF,	%o4
	alignaddrl	%g6,	%g5,	%o7
	andncc	%o5,	%g1,	%o3
	xor	%i5,	%o0,	%l3
	fnot1s	%f6,	%f26
	udivx	%i6,	0x16BF,	%i7
	fmuld8sux16	%f14,	%f26,	%f26
	umul	%g4,	0x0666,	%g3
	fpsub32s	%f18,	%f9,	%f20
	movvc	%xcc,	%o6,	%l0
	andncc	%o2,	%g7,	%l2
	mulscc	%l4,	0x1035,	%i4
	stx	%l1,	[%l7 + 0x58]
	alignaddr	%o1,	%l5,	%i0
	edge16ln	%l6,	%i3,	%i2
	orcc	%g2,	%o4,	%g6
	fzero	%f6
	ldub	[%l7 + 0x08],	%g5
	ldsb	[%l7 + 0x42],	%i1
	edge8n	%o5,	%o7,	%o3
	movrlez	%i5,	%o0,	%l3
	ldx	[%l7 + 0x70],	%g1
	fmul8x16	%f26,	%f6,	%f20
	ldd	[%l7 + 0x58],	%f8
	movvc	%icc,	%i6,	%g4
	fmovrdne	%g3,	%f18,	%f20
	fxor	%f24,	%f12,	%f20
	fmovrse	%o6,	%f3,	%f26
	ldd	[%l7 + 0x58],	%f0
	ldd	[%l7 + 0x58],	%f16
	edge8	%i7,	%o2,	%l0
	movcs	%icc,	%g7,	%l4
	smul	%i4,	%l2,	%l1
	fornot2s	%f17,	%f26,	%f1
	fpadd16s	%f14,	%f3,	%f2
	ldub	[%l7 + 0x09],	%o1
	nop
	set	0x10, %g4
	ldd	[%l7 + %g4],	%i0
	smul	%l6,	0x163C,	%l5
	movleu	%icc,	%i3,	%g2
	add	%i2,	0x1EE0,	%o4
	movrgez	%g5,	%g6,	%o5
	and	%i1,	%o3,	%i5
	std	%f2,	[%l7 + 0x40]
	fmovrsgz	%o0,	%f2,	%f12
	fnands	%f30,	%f13,	%f17
	nop
	set	0x48, %g3
	ldsw	[%l7 + %g3],	%o7
	srlx	%g1,	0x17,	%i6
	orncc	%l3,	%g3,	%o6
	ld	[%l7 + 0x30],	%f5
	movrlz	%i7,	0x127,	%g4
	or	%o2,	%l0,	%l4
	fmovdge	%icc,	%f1,	%f25
	fnot1	%f4,	%f4
	orn	%g7,	0x1724,	%l2
	edge16n	%l1,	%o1,	%i4
	fcmpeq32	%f16,	%f16,	%i0
	ldd	[%l7 + 0x58],	%i6
	fmovdvs	%xcc,	%f7,	%f26
	edge32ln	%l5,	%i3,	%g2
	xnor	%i2,	%g5,	%g6
	and	%o4,	0x16DC,	%i1
	fsrc1	%f4,	%f10
	addc	%o5,	0x0605,	%o3
	orcc	%i5,	0x1CA7,	%o7
	sllx	%g1,	0x0E,	%o0
	movne	%xcc,	%i6,	%g3
	fmovsne	%xcc,	%f11,	%f6
	fand	%f14,	%f22,	%f14
	fmovrsne	%o6,	%f20,	%f1
	mova	%icc,	%l3,	%i7
	array32	%o2,	%l0,	%l4
	ldd	[%l7 + 0x58],	%f6
	fmovdleu	%icc,	%f17,	%f21
	sllx	%g7,	0x0F,	%l2
	fnegd	%f4,	%f28
	array8	%l1,	%g4,	%i4
	stx	%i0,	[%l7 + 0x28]
	edge32ln	%l6,	%o1,	%l5
	addcc	%i3,	0x134F,	%g2
	fmuld8sux16	%f5,	%f14,	%f24
	andcc	%g5,	%g6,	%o4
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	fmovdgu	%icc,	%f29,	%f4
	movcc	%icc,	%i5,	%o5
	movl	%xcc,	%o7,	%g1
	movn	%icc,	%o0,	%g3
	xnor	%i6,	0x1C18,	%l3
	fnot2	%f24,	%f16
	movne	%icc,	%o6,	%o2
	ldub	[%l7 + 0x79],	%l0
	fmovsne	%icc,	%f0,	%f4
	fmuld8ulx16	%f24,	%f14,	%f8
	array8	%l4,	%g7,	%l2
	udivcc	%l1,	0x0638,	%g4
	subc	%i7,	0x05B8,	%i4
	fmovrsne	%i0,	%f5,	%f17
	orcc	%o1,	%l5,	%l6
	movvc	%xcc,	%g2,	%i3
	nop
	set	0x38, %g2
	ldsw	[%l7 + %g2],	%g5
	movcs	%icc,	%o4,	%g6
	fmovdgu	%icc,	%f17,	%f11
	save %i2, 0x0A71, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i5,	%o3,	%o7
	xorcc	%o5,	%g1,	%o0
	move	%icc,	%g3,	%i6
	stx	%o6,	[%l7 + 0x30]
	move	%icc,	%l3,	%l0
	fmovsne	%icc,	%f1,	%f17
	fones	%f1
	fmovrdgz	%o2,	%f24,	%f20
	orcc	%l4,	%l2,	%l1
	ldsb	[%l7 + 0x79],	%g7
	fmul8ulx16	%f6,	%f2,	%f20
	edge8l	%i7,	%i4,	%g4
	edge8ln	%i0,	%l5,	%l6
	fcmple16	%f28,	%f6,	%o1
	sra	%g2,	0x0B,	%g5
	movcc	%xcc,	%o4,	%i3
	movcs	%xcc,	%i2,	%i1
	orn	%g6,	%o3,	%o7
	ldsw	[%l7 + 0x54],	%i5
	movvs	%xcc,	%g1,	%o5
	fpack16	%f28,	%f29
	array16	%g3,	%o0,	%i6
	xnorcc	%l3,	0x0CA5,	%l0
	ld	[%l7 + 0x7C],	%f18
	srlx	%o2,	%o6,	%l4
	fnot2s	%f18,	%f11
	fnot1s	%f19,	%f0
	udiv	%l2,	0x0435,	%g7
	xnor	%i7,	%l1,	%g4
	fmovdle	%xcc,	%f5,	%f5
	ldub	[%l7 + 0x5F],	%i0
	fmovsleu	%icc,	%f23,	%f23
	edge32n	%l5,	%i4,	%o1
	fcmpes	%fcc2,	%f2,	%f31
	array16	%l6,	%g5,	%o4
	siam	0x4
	fmovs	%f2,	%f20
	movpos	%xcc,	%i3,	%i2
	umulcc	%i1,	%g2,	%g6
	ldd	[%l7 + 0x10],	%f6
	edge32ln	%o7,	%o3,	%g1
	movrgz	%o5,	%g3,	%o0
	fxnors	%f22,	%f6,	%f31
	andncc	%i6,	%i5,	%l0
	movvc	%icc,	%o2,	%o6
	fmovsg	%icc,	%f16,	%f29
	movre	%l3,	%l2,	%g7
	save %i7, %l4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%i0,	%g4
	xor	%l5,	%o1,	%i4
	smulcc	%l6,	0x189F,	%g5
	fmovdleu	%xcc,	%f12,	%f5
	andn	%o4,	0x1027,	%i3
	ld	[%l7 + 0x78],	%f13
	fnot2	%f30,	%f20
	movcc	%icc,	%i2,	%g2
	edge8	%i1,	%o7,	%g6
	movre	%o3,	%o5,	%g3
	edge16l	%g1,	%o0,	%i6
	edge8l	%l0,	%o2,	%o6
	std	%f26,	[%l7 + 0x78]
	sir	0x0530
	mulscc	%l3,	0x1D13,	%l2
	edge8ln	%i5,	%i7,	%g7
	fmovrse	%l4,	%f24,	%f17
	sll	%l1,	%g4,	%i0
	fcmps	%fcc1,	%f31,	%f7
	faligndata	%f26,	%f4,	%f16
	sdiv	%o1,	0x1CC0,	%l5
	lduw	[%l7 + 0x78],	%i4
	movge	%xcc,	%l6,	%o4
	fornot2s	%f9,	%f27,	%f7
	movcs	%xcc,	%g5,	%i2
	andncc	%i3,	%i1,	%o7
	ldub	[%l7 + 0x5F],	%g6
	sdiv	%g2,	0x0761,	%o3
	movleu	%icc,	%o5,	%g3
	andn	%o0,	%i6,	%l0
	fxor	%f8,	%f4,	%f20
	movl	%xcc,	%o2,	%o6
	fmul8x16au	%f19,	%f19,	%f16
	edge32n	%g1,	%l2,	%l3
	sdiv	%i5,	0x17EC,	%i7
	subc	%l4,	0x1972,	%g7
	stx	%l1,	[%l7 + 0x78]
	edge16	%i0,	%o1,	%l5
	xorcc	%g4,	%l6,	%i4
	ldx	[%l7 + 0x10],	%o4
	sub	%g5,	%i2,	%i1
	fsrc2	%f22,	%f8
	edge8l	%o7,	%g6,	%g2
	udivx	%i3,	0x0EE3,	%o5
	movvc	%icc,	%o3,	%o0
	movvs	%xcc,	%i6,	%g3
	fpmerge	%f28,	%f16,	%f12
	udivcc	%l0,	0x0FE8,	%o6
	array8	%g1,	%o2,	%l3
	stx	%l2,	[%l7 + 0x38]
	movvs	%xcc,	%i5,	%i7
	andncc	%g7,	%l1,	%i0
	or	%l4,	%l5,	%g4
	movvc	%xcc,	%o1,	%l6
	movvs	%xcc,	%o4,	%i4
	movrlez	%g5,	0x331,	%i1
	udivx	%i2,	0x1CA9,	%g6
	andncc	%g2,	%o7,	%i3
	fcmpeq16	%f30,	%f12,	%o5
	array32	%o3,	%i6,	%g3
	alignaddrl	%l0,	%o0,	%g1
	ldub	[%l7 + 0x2D],	%o2
	movne	%xcc,	%l3,	%o6
	array32	%l2,	%i7,	%g7
	movrlz	%i5,	0x1E3,	%l1
	fsrc2s	%f3,	%f9
	fpmerge	%f15,	%f25,	%f20
	udivx	%i0,	0x0991,	%l5
	umul	%l4,	0x0EE8,	%g4
	fones	%f9
	movrgez	%o1,	0x181,	%o4
	fmovdl	%icc,	%f3,	%f20
	stx	%l6,	[%l7 + 0x20]
	edge16ln	%i4,	%g5,	%i2
	edge32l	%i1,	%g2,	%o7
	fsrc2	%f10,	%f28
	movrne	%i3,	%g6,	%o3
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i6
	andcc	%o5,	0x1955,	%l0
	orn	%o0,	0x0C84,	%g1
	fmovdge	%xcc,	%f5,	%f20
	sub	%o2,	%g3,	%l3
	udivx	%l2,	0x083F,	%i7
	subcc	%g7,	%o6,	%l1
	sll	%i5,	%i0,	%l4
	stb	%l5,	[%l7 + 0x47]
	fmovsgu	%xcc,	%f22,	%f0
	subcc	%g4,	0x188B,	%o1
	and	%o4,	%l6,	%i4
	ldd	[%l7 + 0x38],	%g4
	smul	%i1,	0x1B30,	%i2
	subccc	%o7,	%i3,	%g2
	udiv	%o3,	0x0A58,	%i6
	movrlez	%g6,	%o5,	%o0
	movrne	%g1,	%l0,	%g3
	fnand	%f0,	%f16,	%f0
	ld	[%l7 + 0x7C],	%f26
	smulcc	%l3,	%o2,	%i7
	subccc	%l2,	0x086F,	%g7
	sdiv	%o6,	0x0B97,	%i5
	fmovrslez	%i0,	%f24,	%f18
	srl	%l4,	%l1,	%l5
	fmovrdgez	%o1,	%f10,	%f0
	movrlz	%o4,	%g4,	%i4
	fmovdge	%icc,	%f3,	%f16
	subc	%g5,	0x07EC,	%i1
	sdivcc	%i2,	0x1357,	%l6
	sth	%o7,	[%l7 + 0x1E]
	or	%g2,	%o3,	%i3
	movl	%xcc,	%g6,	%i6
	andncc	%o0,	%g1,	%o5
	movcc	%icc,	%g3,	%l0
	sub	%o2,	%i7,	%l2
	array32	%g7,	%o6,	%l3
	movl	%xcc,	%i0,	%i5
	xor	%l4,	0x0F1E,	%l1
	edge8	%l5,	%o1,	%o4
	move	%icc,	%i4,	%g5
	fexpand	%f3,	%f16
	addc	%g4,	%i2,	%i1
	addcc	%o7,	%g2,	%l6
	ldd	[%l7 + 0x40],	%o2
	xnor	%i3,	%g6,	%i6
	mulscc	%g1,	0x0F96,	%o0
	xorcc	%o5,	0x0B29,	%g3
	edge16l	%l0,	%i7,	%l2
	fcmpeq32	%f22,	%f4,	%g7
	edge16n	%o6,	%l3,	%o2
	sth	%i5,	[%l7 + 0x0C]
	movrlez	%i0,	%l1,	%l4
	array16	%o1,	%o4,	%l5
	array8	%g5,	%g4,	%i4
	edge32	%i2,	%i1,	%g2
	andcc	%l6,	0x0CE9,	%o7
	edge32n	%o3,	%g6,	%i3
	orcc	%g1,	0x068F,	%o0
	stb	%o5,	[%l7 + 0x51]
	movrlez	%g3,	0x30B,	%i6
	movrlez	%i7,	%l0,	%l2
	edge32	%g7,	%l3,	%o6
	smulcc	%o2,	%i5,	%l1
	faligndata	%f2,	%f2,	%f18
	movgu	%icc,	%l4,	%i0
	xnor	%o4,	0x08C5,	%o1
	fxnors	%f24,	%f16,	%f5
	movneg	%icc,	%l5,	%g4
	add	%i4,	%g5,	%i2
	edge16	%i1,	%g2,	%o7
	udivcc	%o3,	0x1B90,	%l6
	sdiv	%g6,	0x1320,	%i3
	fpadd16s	%f28,	%f29,	%f15
	ld	[%l7 + 0x4C],	%f31
	restore %o0, 0x1034, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f12,	%f22,	%o5
	udivx	%g3,	0x00B1,	%i7
	stb	%l0,	[%l7 + 0x31]
	fpsub32s	%f2,	%f17,	%f0
	std	%f4,	[%l7 + 0x18]
	for	%f0,	%f14,	%f18
	fors	%f20,	%f26,	%f9
	fmovrse	%l2,	%f13,	%f22
	st	%f9,	[%l7 + 0x60]
	umulcc	%i6,	%l3,	%g7
	movre	%o2,	%i5,	%l1
	fmovsne	%xcc,	%f3,	%f5
	edge32n	%o6,	%l4,	%i0
	and	%o1,	%o4,	%l5
	subccc	%i4,	0x1660,	%g5
	fmovsneg	%xcc,	%f26,	%f27
	ldub	[%l7 + 0x64],	%i2
	ldsw	[%l7 + 0x60],	%g4
	stw	%i1,	[%l7 + 0x4C]
	edge16ln	%o7,	%o3,	%l6
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	orn	%o0,	%g1,	%o5
	sdivx	%g3,	0x054C,	%i7
	alignaddr	%l0,	%l2,	%i3
	srl	%i6,	%l3,	%o2
	umul	%g7,	0x1450,	%l1
	move	%icc,	%o6,	%l4
	add	%i0,	0x120E,	%i5
	subccc	%o4,	0x0076,	%o1
	fmovd	%f8,	%f22
	restore %i4, %l5, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f18,	%f30,	%f24
	movcc	%icc,	%g4,	%i2
	pdist	%f8,	%f26,	%f4
	movgu	%icc,	%i1,	%o3
	fsrc2s	%f0,	%f4
	ld	[%l7 + 0x44],	%f30
	xorcc	%l6,	%o7,	%g2
	fpsub16	%f4,	%f18,	%f26
	fmovsle	%icc,	%f1,	%f4
	orncc	%o0,	0x0364,	%g1
	movle	%xcc,	%g6,	%o5
	siam	0x0
	nop
	set	0x5E, %l5
	sth	%i7,	[%l7 + %l5]
	srlx	%l0,	0x1D,	%l2
	udivcc	%i3,	0x179B,	%g3
	fsrc2	%f26,	%f26
	xnorcc	%l3,	%i6,	%g7
	smul	%o2,	0x1003,	%o6
	ldsb	[%l7 + 0x61],	%l4
	fmovdpos	%icc,	%f5,	%f17
	umul	%l1,	%i5,	%i0
	ldd	[%l7 + 0x60],	%f4
	fcmpgt16	%f8,	%f6,	%o4
	movleu	%icc,	%o1,	%l5
	fandnot1	%f6,	%f26,	%f8
	udivx	%g5,	0x1E33,	%g4
	movrne	%i2,	%i4,	%o3
	lduw	[%l7 + 0x74],	%l6
	movcs	%icc,	%i1,	%g2
	edge16	%o7,	%o0,	%g6
	save %o5, %i7, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x30, %g1
	stw	%l0,	[%l7 + %g1]
	ldx	[%l7 + 0x10],	%i3
	edge16ln	%l2,	%l3,	%i6
	edge16l	%g7,	%o2,	%o6
	orcc	%l4,	%l1,	%g3
	edge8n	%i0,	%o4,	%i5
	std	%f22,	[%l7 + 0x58]
	addccc	%o1,	%l5,	%g5
	addc	%g4,	0x050A,	%i2
	movrne	%i4,	0x19E,	%l6
	lduw	[%l7 + 0x48],	%o3
	srlx	%g2,	%i1,	%o0
	movcc	%icc,	%o7,	%g6
	alignaddr	%o5,	%i7,	%l0
	udivx	%g1,	0x1499,	%i3
	fmovsvc	%xcc,	%f29,	%f15
	umul	%l2,	%i6,	%g7
	movgu	%icc,	%l3,	%o6
	orn	%l4,	0x1973,	%o2
	umul	%g3,	%i0,	%l1
	stx	%i5,	[%l7 + 0x18]
	movl	%xcc,	%o1,	%l5
	edge32l	%g5,	%o4,	%g4
	umulcc	%i4,	%i2,	%l6
	movgu	%icc,	%g2,	%i1
	edge32l	%o3,	%o0,	%o7
	ldub	[%l7 + 0x60],	%g6
	nop
	set	0x76, %l3
	lduh	[%l7 + %l3],	%o5
	lduw	[%l7 + 0x40],	%i7
	xnorcc	%l0,	%g1,	%i3
	movrgz	%i6,	0x1FE,	%g7
	andn	%l2,	%l3,	%l4
	edge32n	%o2,	%g3,	%o6
	fmovrsgz	%l1,	%f6,	%f20
	stb	%i5,	[%l7 + 0x77]
	fzeros	%f25
	sdiv	%o1,	0x0DE9,	%i0
	edge32ln	%l5,	%o4,	%g4
	save %g5, 0x111F, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%l6,	%g2
	popc	0x1EC4,	%i1
	nop
	set	0x28, %l2
	stx	%o3,	[%l7 + %l2]
	fxnor	%f16,	%f6,	%f2
	fmovrslz	%o0,	%f0,	%f14
	stx	%o7,	[%l7 + 0x38]
	fnegs	%f20,	%f10
	movn	%icc,	%g6,	%i2
	sdiv	%i7,	0x1CCC,	%l0
	ldsw	[%l7 + 0x14],	%o5
	movrgez	%i3,	0x391,	%g1
	fmovse	%icc,	%f5,	%f2
	fmul8x16	%f11,	%f4,	%f14
	sth	%i6,	[%l7 + 0x16]
	movrne	%g7,	0x16D,	%l2
	fxnor	%f0,	%f0,	%f10
	movrne	%l4,	%o2,	%g3
	fxnors	%f11,	%f21,	%f14
	edge32l	%o6,	%l1,	%i5
	ld	[%l7 + 0x7C],	%f24
	lduh	[%l7 + 0x62],	%l3
	subccc	%o1,	%i0,	%o4
	edge32l	%g4,	%l5,	%i4
	udiv	%g5,	0x02B9,	%g2
	fpadd16s	%f12,	%f1,	%f17
	movl	%icc,	%l6,	%o3
	edge8ln	%o0,	%i1,	%o7
	fcmpne32	%f18,	%f0,	%i2
	fmovrslez	%i7,	%f15,	%f11
	xor	%g6,	0x1EED,	%l0
	xnor	%i3,	%g1,	%o5
	sub	%g7,	0x1DF0,	%i6
	sethi	0x09E8,	%l4
	subcc	%l2,	%o2,	%o6
	movrgez	%g3,	%i5,	%l1
	fcmps	%fcc1,	%f21,	%f16
	movvs	%icc,	%l3,	%o1
	addc	%o4,	%i0,	%l5
	lduw	[%l7 + 0x54],	%i4
	fmovsneg	%xcc,	%f4,	%f12
	edge16n	%g5,	%g2,	%g4
	or	%o3,	0x1C39,	%l6
	edge32l	%o0,	%o7,	%i1
	mulscc	%i7,	0x028A,	%g6
	fandnot2s	%f10,	%f0,	%f28
	udiv	%l0,	0x1E88,	%i3
	movcs	%xcc,	%g1,	%i2
	edge32	%g7,	%o5,	%l4
	sdivx	%l2,	0x12C2,	%o2
	mulscc	%i6,	%g3,	%i5
	edge16ln	%o6,	%l1,	%l3
	xorcc	%o1,	0x16AC,	%o4
	ldd	[%l7 + 0x40],	%i0
	fcmpne16	%f30,	%f2,	%l5
	sir	0x002C
	sir	0x181E
	andn	%g5,	0x1BD0,	%g2
	udivx	%i4,	0x1250,	%o3
	fexpand	%f29,	%f14
	udivcc	%g4,	0x12A0,	%l6
	movg	%icc,	%o7,	%o0
	fmovrdgz	%i1,	%f8,	%f16
	mova	%icc,	%g6,	%i7
	fnands	%f12,	%f13,	%f1
	edge32ln	%l0,	%g1,	%i2
	umulcc	%i3,	%o5,	%g7
	addcc	%l2,	%l4,	%o2
	fmuld8sux16	%f11,	%f14,	%f8
	movge	%icc,	%i6,	%g3
	sdiv	%o6,	0x1D20,	%i5
	fandnot2s	%f4,	%f28,	%f23
	edge16l	%l3,	%o1,	%o4
	fandnot2s	%f12,	%f0,	%f30
	fmul8x16au	%f1,	%f15,	%f0
	ldsw	[%l7 + 0x60],	%l1
	smul	%i0,	%g5,	%l5
	movn	%xcc,	%g2,	%o3
	array16	%i4,	%g4,	%o7
	srl	%l6,	0x0D,	%i1
	movle	%xcc,	%o0,	%g6
	movgu	%icc,	%i7,	%g1
	edge32	%i2,	%l0,	%i3
	ldub	[%l7 + 0x79],	%g7
	orcc	%l2,	0x00D8,	%o5
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	udivcc	%g3,	0x1D64,	%i5
	fpsub32	%f6,	%f20,	%f0
	xnorcc	%l3,	%o6,	%o4
	movgu	%xcc,	%o1,	%l1
	addcc	%g5,	%l5,	%g2
	fornot2s	%f21,	%f31,	%f19
	restore %i0, %i4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x18],	%f16
	edge8l	%o7,	%l6,	%g4
	ldd	[%l7 + 0x28],	%f18
	movgu	%icc,	%i1,	%o0
	movle	%xcc,	%i7,	%g6
	movge	%icc,	%g1,	%l0
	alignaddr	%i3,	%i2,	%l2
	stx	%g7,	[%l7 + 0x58]
	movgu	%xcc,	%o5,	%i6
	stb	%o2,	[%l7 + 0x2F]
	alignaddr	%g3,	%i5,	%l3
	sth	%o6,	[%l7 + 0x68]
	fmul8x16	%f5,	%f8,	%f12
	fmovrdlz	%l4,	%f18,	%f8
	movle	%xcc,	%o1,	%l1
	sub	%o4,	0x102A,	%l5
	movcs	%xcc,	%g2,	%i0
	and	%i4,	%o3,	%o7
	fnot2s	%f2,	%f31
	fmovrsne	%l6,	%f10,	%f10
	fnegd	%f2,	%f12
	add	%g4,	%g5,	%o0
	udivx	%i1,	0x1A00,	%i7
	orcc	%g1,	0x0884,	%l0
	smul	%g6,	0x1E68,	%i2
	movneg	%icc,	%i3,	%l2
	movcc	%icc,	%o5,	%i6
	edge32n	%g7,	%o2,	%i5
	sra	%l3,	%g3,	%l4
	addc	%o6,	0x1A60,	%o1
	movrlez	%l1,	%l5,	%g2
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	movn	%icc,	%o4,	%o7
	xnor	%l6,	%g5,	%o0
	stx	%g4,	[%l7 + 0x20]
	sth	%i7,	[%l7 + 0x14]
	ldd	[%l7 + 0x18],	%i0
	fornot1	%f18,	%f14,	%f2
	fmovsleu	%icc,	%f24,	%f21
	fmovsa	%xcc,	%f3,	%f27
	lduw	[%l7 + 0x38],	%g1
	mova	%xcc,	%l0,	%g6
	movne	%xcc,	%i3,	%i2
	fpack32	%f12,	%f10,	%f6
	alignaddr	%o5,	%i6,	%g7
	array8	%l2,	%i5,	%o2
	fmovdne	%icc,	%f1,	%f4
	movvs	%xcc,	%g3,	%l3
	sll	%o6,	0x1C,	%o1
	fmovs	%f20,	%f23
	ldd	[%l7 + 0x48],	%l0
	movleu	%xcc,	%l4,	%g2
	edge32l	%l5,	%i4,	%i0
	edge16	%o4,	%o3,	%l6
	fcmpne16	%f18,	%f20,	%g5
	mulx	%o0,	%o7,	%i7
	sdiv	%g4,	0x0967,	%g1
	fmuld8ulx16	%f19,	%f22,	%f20
	fmovsgu	%icc,	%f4,	%f17
	edge32ln	%l0,	%g6,	%i1
	movrgez	%i2,	0x0DD,	%o5
	fcmpd	%fcc1,	%f26,	%f8
	fnot2	%f16,	%f30
	std	%f20,	[%l7 + 0x68]
	sllx	%i3,	%g7,	%l2
	fornot1	%f14,	%f14,	%f24
	sub	%i6,	0x0575,	%i5
	xnorcc	%g3,	%o2,	%l3
	edge32n	%o1,	%l1,	%o6
	movleu	%icc,	%g2,	%l4
	fpsub32s	%f16,	%f2,	%f7
	movle	%xcc,	%i4,	%i0
	movrgz	%l5,	%o3,	%o4
	fmul8sux16	%f30,	%f10,	%f6
	srl	%l6,	%g5,	%o0
	and	%i7,	%g4,	%g1
	fcmps	%fcc3,	%f21,	%f25
	fcmpeq32	%f16,	%f22,	%l0
	movvs	%xcc,	%o7,	%g6
	fmovrdlez	%i1,	%f24,	%f10
	xorcc	%i2,	0x13FC,	%i3
	st	%f14,	[%l7 + 0x24]
	ldd	[%l7 + 0x18],	%o4
	sllx	%g7,	%l2,	%i5
	subcc	%i6,	%g3,	%l3
	fmovdleu	%icc,	%f19,	%f26
	movg	%icc,	%o2,	%l1
	nop
	set	0x70, %i1
	stx	%o6,	[%l7 + %i1]
	fcmped	%fcc1,	%f28,	%f22
	movcs	%xcc,	%o1,	%g2
	orcc	%i4,	0x0643,	%i0
	fmovsleu	%xcc,	%f18,	%f11
	or	%l4,	%l5,	%o4
	ldub	[%l7 + 0x69],	%l6
	mulx	%o3,	0x0074,	%o0
	edge32ln	%g5,	%g4,	%i7
	subcc	%l0,	%o7,	%g6
	edge32	%i1,	%g1,	%i3
	faligndata	%f0,	%f24,	%f18
	sethi	0x113B,	%o5
	udiv	%i2,	0x057F,	%g7
	xnorcc	%i5,	%i6,	%l2
	sra	%l3,	0x15,	%g3
	movvs	%xcc,	%o2,	%o6
	edge8l	%o1,	%g2,	%l1
	edge16l	%i4,	%i0,	%l4
	addc	%l5,	%o4,	%o3
	stb	%l6,	[%l7 + 0x66]
	save %o0, 0x13F7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f6,	[%l7 + 0x10]
	sdiv	%i7,	0x1A34,	%l0
	ld	[%l7 + 0x50],	%f10
	fmovrdgz	%o7,	%f20,	%f16
	fors	%f5,	%f2,	%f5
	movgu	%icc,	%g5,	%g6
	ldub	[%l7 + 0x6F],	%g1
	fmovrdgez	%i1,	%f0,	%f0
	fabsd	%f0,	%f0
	ldd	[%l7 + 0x10],	%f0
	fmovrdlez	%o5,	%f20,	%f14
	orn	%i3,	0x0764,	%i2
	sethi	0x0183,	%g7
	udivcc	%i6,	0x1AA3,	%l2
	lduw	[%l7 + 0x58],	%i5
	fsrc2	%f6,	%f12
	fmovdpos	%icc,	%f3,	%f15
	movcc	%xcc,	%g3,	%o2
	sir	0x1CCD
	sll	%l3,	%o6,	%o1
	udivx	%g2,	0x0BA6,	%i4
	movcs	%xcc,	%i0,	%l1
	ldd	[%l7 + 0x38],	%l4
	mulx	%o4,	%l5,	%o3
	fmovrsne	%l6,	%f21,	%f22
	fcmple16	%f0,	%f22,	%o0
	ldsw	[%l7 + 0x08],	%g4
	sub	%l0,	0x0677,	%o7
	fcmpd	%fcc1,	%f28,	%f12
	fmovdge	%xcc,	%f8,	%f16
	edge8n	%i7,	%g6,	%g1
	xorcc	%i1,	%o5,	%g5
	subcc	%i3,	%g7,	%i2
	mulscc	%i6,	%i5,	%g3
	move	%icc,	%l2,	%l3
	popc	%o6,	%o2
	array8	%o1,	%i4,	%i0
	udivx	%l1,	0x13C2,	%l4
	smulcc	%o4,	%g2,	%l5
	nop
	set	0x0D, %i7
	ldub	[%l7 + %i7],	%o3
	fxors	%f5,	%f15,	%f24
	subcc	%l6,	0x174E,	%o0
	ldsb	[%l7 + 0x1B],	%g4
	movcs	%icc,	%o7,	%l0
	movre	%i7,	%g1,	%i1
	andcc	%g6,	%g5,	%i3
	fmovd	%f4,	%f12
	edge8n	%g7,	%o5,	%i2
	mova	%xcc,	%i6,	%g3
	fcmpne16	%f10,	%f12,	%l2
	fpsub16s	%f10,	%f20,	%f10
	mulx	%i5,	%o6,	%l3
	edge8	%o2,	%i4,	%i0
	and	%o1,	0x0F04,	%l1
	ldsh	[%l7 + 0x30],	%o4
	stw	%l4,	[%l7 + 0x40]
	fmovda	%xcc,	%f30,	%f9
	movneg	%xcc,	%l5,	%o3
	movvs	%icc,	%l6,	%g2
	umul	%g4,	%o0,	%l0
	xnorcc	%o7,	%i7,	%g1
	fmovdgu	%icc,	%f30,	%f10
	fpack16	%f0,	%f30
	fmovdg	%xcc,	%f5,	%f16
	movrne	%g6,	0x34F,	%g5
	sdivcc	%i3,	0x1544,	%g7
	umul	%o5,	%i2,	%i1
	popc	0x060D,	%g3
	ldsb	[%l7 + 0x58],	%l2
	fmovse	%xcc,	%f15,	%f25
	array32	%i6,	%o6,	%i5
	sra	%o2,	0x11,	%l3
	fmul8x16al	%f15,	%f20,	%f20
	edge16n	%i0,	%o1,	%i4
	movl	%icc,	%l1,	%o4
	edge8l	%l5,	%o3,	%l4
	sll	%l6,	%g2,	%g4
	edge32ln	%o0,	%o7,	%i7
	sir	0x1157
	edge16l	%g1,	%l0,	%g5
	movcc	%xcc,	%i3,	%g7
	fmovsne	%icc,	%f24,	%f1
	nop
	set	0x1C, %i0
	stw	%o5,	[%l7 + %i0]
	sdivx	%g6,	0x018A,	%i1
	fmul8x16au	%f14,	%f15,	%f2
	movne	%xcc,	%i2,	%g3
	movge	%xcc,	%i6,	%l2
	smulcc	%i5,	0x1FDD,	%o6
	fmovsn	%icc,	%f29,	%f21
	subccc	%l3,	0x074F,	%o2
	fmovrsne	%o1,	%f26,	%f5
	edge32n	%i4,	%l1,	%i0
	sdivcc	%o4,	0x1D64,	%o3
	fpsub16s	%f22,	%f31,	%f8
	fnors	%f2,	%f9,	%f14
	movne	%xcc,	%l4,	%l5
	xnorcc	%g2,	0x0FF4,	%l6
	fabsd	%f24,	%f4
	fpsub16s	%f20,	%f19,	%f19
	umul	%o0,	%o7,	%g4
	fmovsvs	%xcc,	%f21,	%f28
	sll	%g1,	%l0,	%g5
	edge8n	%i3,	%g7,	%i7
	fnot1s	%f18,	%f11
	addcc	%g6,	%i1,	%i2
	movn	%icc,	%g3,	%o5
	edge32ln	%l2,	%i6,	%i5
	ldsh	[%l7 + 0x70],	%l3
	sdiv	%o6,	0x1973,	%o2
	fsrc1s	%f15,	%f24
	movle	%icc,	%i4,	%l1
	subc	%o1,	%o4,	%o3
	srlx	%i0,	0x1B,	%l5
	bshuffle	%f10,	%f26,	%f0
	lduh	[%l7 + 0x1E],	%g2
	ldsh	[%l7 + 0x08],	%l4
	restore %l6, %o7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g4,	%l0,	%g5
	fnot2	%f10,	%f16
	addc	%g1,	%i3,	%g7
	fmul8x16au	%f18,	%f7,	%f28
	udiv	%g6,	0x1ABA,	%i1
	fmovsa	%icc,	%f3,	%f30
	pdist	%f8,	%f16,	%f28
	fexpand	%f28,	%f26
	movle	%xcc,	%i7,	%g3
	fpsub16	%f24,	%f22,	%f16
	ldub	[%l7 + 0x27],	%i2
	ldub	[%l7 + 0x51],	%l2
	fmovdcc	%xcc,	%f7,	%f17
	movvs	%icc,	%i6,	%i5
	subc	%l3,	%o5,	%o2
	fmovdge	%icc,	%f11,	%f16
	sdivx	%o6,	0x10FC,	%l1
	fornot1	%f2,	%f22,	%f8
	bshuffle	%f2,	%f0,	%f8
	stx	%o1,	[%l7 + 0x68]
	stx	%o4,	[%l7 + 0x60]
	sllx	%o3,	%i4,	%l5
	srax	%g2,	0x02,	%l4
	movrlz	%l6,	0x102,	%o7
	std	%f4,	[%l7 + 0x30]
	srl	%i0,	%g4,	%o0
	ldub	[%l7 + 0x29],	%l0
	sdivcc	%g1,	0x0979,	%i3
	fmovsg	%xcc,	%f8,	%f5
	sra	%g7,	0x07,	%g6
	fmovrsgz	%i1,	%f31,	%f21
	sllx	%g5,	%i7,	%g3
	fornot1s	%f24,	%f30,	%f22
	srax	%l2,	%i6,	%i5
	movrgz	%i2,	0x058,	%o5
	ldsw	[%l7 + 0x14],	%o2
	andn	%o6,	%l3,	%o1
	xorcc	%o4,	0x14DF,	%l1
	movcc	%xcc,	%o3,	%i4
	addcc	%g2,	%l5,	%l6
	stb	%o7,	[%l7 + 0x6B]
	edge16	%l4,	%i0,	%g4
	addccc	%l0,	0x05C8,	%o0
	fexpand	%f17,	%f8
	fmovrdgz	%g1,	%f0,	%f4
	sethi	0x03FB,	%i3
	sllx	%g7,	%i1,	%g6
	movne	%xcc,	%g5,	%g3
	movrgz	%l2,	%i6,	%i7
	edge16l	%i2,	%i5,	%o2
	fpsub16	%f8,	%f10,	%f14
	edge32l	%o5,	%l3,	%o1
	fsrc2s	%f11,	%f19
	movleu	%icc,	%o6,	%l1
	fmovs	%f28,	%f10
	udivcc	%o3,	0x1B7E,	%i4
	xnor	%g2,	%o4,	%l6
	fmuld8sux16	%f24,	%f18,	%f6
	movrlz	%l5,	%o7,	%i0
	edge8	%l4,	%g4,	%o0
	sll	%l0,	%i3,	%g7
	fsrc2	%f24,	%f28
	fcmpeq32	%f6,	%f26,	%g1
	edge16ln	%i1,	%g6,	%g3
	subccc	%g5,	%i6,	%l2
	fpsub16s	%f9,	%f19,	%f7
	orn	%i7,	%i2,	%o2
	save %i5, 0x05FE, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o1,	%o5
	fcmpd	%fcc2,	%f6,	%f4
	umul	%l1,	%o6,	%i4
	movvc	%icc,	%g2,	%o3
	lduw	[%l7 + 0x64],	%l6
	fpsub16s	%f15,	%f10,	%f12
	andcc	%o4,	%o7,	%l5
	ld	[%l7 + 0x10],	%f2
	xor	%i0,	0x091A,	%l4
	mova	%xcc,	%o0,	%l0
	srlx	%i3,	%g4,	%g1
	sll	%g7,	%i1,	%g3
	xnorcc	%g5,	0x1C41,	%i6
	edge32ln	%l2,	%i7,	%g6
	sir	0x1DD3
	subc	%i2,	0x10DA,	%i5
	fpsub32s	%f8,	%f31,	%f5
	fsrc2	%f10,	%f14
	edge8l	%o2,	%o1,	%l3
	fornot2	%f24,	%f18,	%f24
	alignaddrl	%o5,	%o6,	%i4
	ldsh	[%l7 + 0x12],	%l1
	xor	%o3,	0x1BDC,	%l6
	fcmple32	%f26,	%f8,	%g2
	movn	%icc,	%o7,	%o4
	movrlez	%i0,	%l4,	%l5
	stw	%o0,	[%l7 + 0x10]
	edge8n	%i3,	%l0,	%g4
	edge8n	%g1,	%i1,	%g3
	fxnors	%f10,	%f9,	%f23
	fmul8x16al	%f18,	%f2,	%f6
	fxnor	%f28,	%f0,	%f8
	andn	%g5,	%i6,	%g7
	ldsb	[%l7 + 0x6C],	%i7
	movl	%xcc,	%g6,	%l2
	movrne	%i2,	0x20E,	%o2
	stw	%o1,	[%l7 + 0x08]
	edge8l	%l3,	%i5,	%o5
	sll	%i4,	%l1,	%o3
	array16	%l6,	%o6,	%o7
	fmovdvc	%icc,	%f14,	%f7
	movcc	%icc,	%o4,	%i0
	array8	%l4,	%l5,	%g2
	andcc	%o0,	0x185C,	%l0
	edge16l	%i3,	%g4,	%g1
	edge32l	%g3,	%i1,	%g5
	fmovsge	%xcc,	%f20,	%f10
	udivx	%i6,	0x1FC6,	%i7
	edge8l	%g7,	%g6,	%i2
	ldd	[%l7 + 0x20],	%f10
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	sth	%l3,	[%l7 + 0x1C]
	or	%l2,	0x16A9,	%o5
	xnor	%i4,	%l1,	%i5
	edge32ln	%l6,	%o6,	%o7
	movcs	%xcc,	%o4,	%i0
	add	%l4,	%o3,	%l5
	ldx	[%l7 + 0x48],	%o0
	andcc	%l0,	0x0128,	%g2
	andncc	%g4,	%g1,	%i3
	fpack32	%f8,	%f4,	%f20
	orncc	%g3,	0x0BBD,	%i1
	udivcc	%i6,	0x1D96,	%i7
	movvc	%xcc,	%g5,	%g7
	udiv	%g6,	0x0B4D,	%o2
	stw	%i2,	[%l7 + 0x64]
	sdivx	%o1,	0x1552,	%l2
	fabss	%f23,	%f5
	movgu	%icc,	%o5,	%l3
	addcc	%l1,	%i5,	%l6
	edge16l	%i4,	%o7,	%o4
	for	%f26,	%f20,	%f8
	movrlz	%i0,	0x2DE,	%l4
	fmovdcc	%icc,	%f15,	%f16
	fornot1s	%f28,	%f14,	%f19
	orcc	%o6,	0x081E,	%l5
	movcs	%xcc,	%o3,	%o0
	udivx	%g2,	0x1BBD,	%l0
	fnors	%f0,	%f21,	%f28
	fmovdvs	%icc,	%f2,	%f9
	fmovdcs	%xcc,	%f25,	%f14
	udivx	%g4,	0x0014,	%g1
	fmovdle	%xcc,	%f19,	%f21
	fexpand	%f11,	%f12
	edge16	%g3,	%i1,	%i3
	mova	%xcc,	%i6,	%i7
	fmovsa	%icc,	%f30,	%f6
	xnorcc	%g5,	%g6,	%o2
	fand	%f24,	%f6,	%f30
	xor	%g7,	%i2,	%o1
	sra	%o5,	0x0D,	%l2
	fmovdpos	%xcc,	%f14,	%f31
	fmovdge	%icc,	%f8,	%f6
	movcc	%xcc,	%l3,	%i5
	ldx	[%l7 + 0x78],	%l1
	nop
	set	0x7F, %o7
	ldsb	[%l7 + %o7],	%l6
	subccc	%i4,	%o4,	%o7
	sir	0x1258
	xnor	%i0,	%o6,	%l5
	addcc	%o3,	0x15D2,	%o0
	ldsw	[%l7 + 0x34],	%l4
	movvs	%icc,	%l0,	%g4
	sir	0x1FCE
	fmovse	%xcc,	%f0,	%f20
	movpos	%xcc,	%g2,	%g1
	fxor	%f22,	%f24,	%f14
	edge8ln	%g3,	%i1,	%i6
	ldx	[%l7 + 0x30],	%i7
	movpos	%icc,	%i3,	%g5
	subc	%o2,	0x0CD3,	%g7
	fmovdleu	%xcc,	%f5,	%f11
	ldsb	[%l7 + 0x0A],	%g6
	edge32n	%o1,	%i2,	%o5
	fmovsa	%xcc,	%f2,	%f31
	array8	%l2,	%i5,	%l3
	fpadd16	%f2,	%f22,	%f0
	ldx	[%l7 + 0x40],	%l6
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%f26
	movleu	%xcc,	%l1,	%o4
	fcmpes	%fcc3,	%f11,	%f25
	fmovd	%f18,	%f24
	sethi	0x0238,	%i4
	subc	%i0,	%o7,	%l5
	udiv	%o3,	0x17BF,	%o0
	udivcc	%o6,	0x0675,	%l4
	orcc	%g4,	0x18CD,	%l0
	edge8l	%g2,	%g1,	%i1
	array8	%g3,	%i7,	%i6
	ldsb	[%l7 + 0x2D],	%g5
	orncc	%o2,	0x1451,	%i3
	stx	%g6,	[%l7 + 0x48]
	stx	%g7,	[%l7 + 0x28]
	subcc	%i2,	%o1,	%l2
	sth	%i5,	[%l7 + 0x5E]
	fmovdne	%icc,	%f21,	%f31
	fnand	%f20,	%f0,	%f26
	fpadd16s	%f20,	%f8,	%f15
	fnot1	%f24,	%f28
	lduw	[%l7 + 0x68],	%l3
	sdiv	%l6,	0x0CD2,	%l1
	edge32ln	%o5,	%o4,	%i0
	fmovdgu	%icc,	%f24,	%f21
	ldub	[%l7 + 0x7F],	%i4
	sub	%o7,	0x0C70,	%o3
	movgu	%xcc,	%l5,	%o6
	udivcc	%o0,	0x0F14,	%g4
	andn	%l4,	%l0,	%g2
	fmovrde	%i1,	%f26,	%f20
	orncc	%g1,	%i7,	%g3
	fsrc1s	%f20,	%f27
	srax	%i6,	0x16,	%o2
	xnor	%i3,	0x1160,	%g5
	fpsub32s	%f27,	%f20,	%f8
	fnand	%f14,	%f28,	%f0
	movleu	%xcc,	%g6,	%g7
	alignaddrl	%o1,	%i2,	%l2
	movgu	%icc,	%l3,	%i5
	movvs	%icc,	%l1,	%o5
	xnor	%l6,	%i0,	%o4
	ldub	[%l7 + 0x70],	%o7
	umul	%o3,	0x0057,	%i4
	fandnot2	%f26,	%f28,	%f8
	movrgez	%o6,	0x1DC,	%o0
	sllx	%l5,	0x15,	%g4
	xnorcc	%l4,	0x1C85,	%l0
	xnor	%i1,	%g1,	%g2
	movg	%xcc,	%g3,	%i6
	umul	%o2,	%i7,	%g5
	and	%g6,	0x06D9,	%g7
	ldsw	[%l7 + 0x34],	%i3
	add	%o1,	0x0296,	%i2
	fpack32	%f8,	%f0,	%f14
	umulcc	%l2,	0x1CC6,	%l3
	movvs	%icc,	%i5,	%o5
	sdivcc	%l6,	0x1855,	%l1
	stw	%i0,	[%l7 + 0x34]
	alignaddrl	%o4,	%o3,	%o7
	xorcc	%i4,	%o0,	%l5
	ldub	[%l7 + 0x60],	%g4
	fmovrdlez	%o6,	%f30,	%f28
	fcmpne16	%f0,	%f28,	%l0
	umulcc	%i1,	0x16D6,	%l4
	sllx	%g2,	%g1,	%g3
	stw	%o2,	[%l7 + 0x54]
	edge16n	%i6,	%g5,	%i7
	stx	%g7,	[%l7 + 0x38]
	sethi	0x1AD1,	%g6
	sdivcc	%i3,	0x0F28,	%i2
	udivx	%l2,	0x0C5D,	%o1
	fcmple16	%f12,	%f30,	%l3
	stw	%i5,	[%l7 + 0x08]
	fornot1s	%f14,	%f20,	%f28
	fmovdcs	%icc,	%f14,	%f8
	lduw	[%l7 + 0x20],	%o5
	edge32n	%l1,	%i0,	%l6
	fmovdcs	%icc,	%f20,	%f27
	movcs	%icc,	%o4,	%o7
	std	%f10,	[%l7 + 0x30]
	edge8ln	%i4,	%o3,	%l5
	movle	%icc,	%g4,	%o0
	fmovrsgez	%l0,	%f6,	%f14
	fmovdg	%xcc,	%f7,	%f29
	movne	%icc,	%i1,	%l4
	add	%o6,	0x0A24,	%g1
	smul	%g2,	0x0D02,	%g3
	movvs	%icc,	%o2,	%i6
	andcc	%g5,	%i7,	%g6
	edge8n	%g7,	%i3,	%l2
	fzeros	%f0
	udivcc	%o1,	0x1201,	%i2
	xnorcc	%l3,	0x1DE7,	%i5
	addcc	%l1,	%o5,	%i0
	fcmple32	%f12,	%f10,	%o4
	andn	%o7,	0x07B5,	%l6
	sethi	0x071B,	%o3
	movn	%xcc,	%l5,	%g4
	fandnot1s	%f30,	%f17,	%f9
	movge	%icc,	%i4,	%o0
	fcmpgt16	%f22,	%f10,	%i1
	andncc	%l4,	%o6,	%l0
	fmovspos	%icc,	%f7,	%f19
	ldx	[%l7 + 0x20],	%g1
	umulcc	%g3,	0x1BEC,	%o2
	movvs	%xcc,	%g2,	%i6
	mova	%xcc,	%i7,	%g6
	movle	%xcc,	%g5,	%g7
	stx	%l2,	[%l7 + 0x60]
	movn	%xcc,	%i3,	%i2
	addccc	%o1,	%i5,	%l3
	movn	%icc,	%l1,	%o5
	movpos	%icc,	%i0,	%o7
	andcc	%o4,	%o3,	%l5
	fpsub16	%f22,	%f24,	%f16
	addccc	%g4,	%i4,	%o0
	movle	%icc,	%i1,	%l4
	and	%o6,	%l6,	%g1
	ldub	[%l7 + 0x63],	%l0
	udivcc	%o2,	0x045A,	%g2
	ldsb	[%l7 + 0x6F],	%g3
	edge8l	%i6,	%i7,	%g5
	fcmpes	%fcc2,	%f23,	%f2
	fmul8x16al	%f16,	%f21,	%f12
	fmovda	%icc,	%f26,	%f30
	fxnor	%f2,	%f0,	%f0
	ldd	[%l7 + 0x10],	%f18
	movrlez	%g7,	0x3D0,	%g6
	fnot2	%f4,	%f24
	lduh	[%l7 + 0x08],	%i3
	addcc	%i2,	0x048C,	%l2
	movvc	%xcc,	%i5,	%o1
	edge8	%l1,	%o5,	%l3
	movl	%icc,	%o7,	%o4
	fpsub16	%f2,	%f22,	%f28
	movg	%icc,	%o3,	%l5
	fmovdcc	%icc,	%f28,	%f31
	movge	%icc,	%g4,	%i4
	save %i0, %o0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l4,	%o6
	movle	%xcc,	%l6,	%l0
	udivcc	%g1,	0x199E,	%o2
	addc	%g3,	%i6,	%i7
	srl	%g5,	0x17,	%g7
	fmovsn	%icc,	%f10,	%f21
	andcc	%g6,	0x0CC3,	%g2
	sllx	%i2,	%l2,	%i3
	fabss	%f15,	%f0
	fnegs	%f19,	%f19
	fmovsne	%xcc,	%f11,	%f23
	ld	[%l7 + 0x28],	%f8
	lduh	[%l7 + 0x6E],	%o1
	xnorcc	%l1,	%i5,	%l3
	array16	%o5,	%o4,	%o3
	movrgz	%o7,	0x0FC,	%l5
	fmovrdlez	%i4,	%f0,	%f6
	srax	%g4,	%o0,	%i0
	udivx	%l4,	0x1746,	%i1
	movrne	%l6,	0x074,	%o6
	srlx	%l0,	0x05,	%g1
	movvs	%icc,	%o2,	%g3
	movvs	%xcc,	%i7,	%i6
	and	%g7,	%g6,	%g2
	stb	%g5,	[%l7 + 0x6D]
	subc	%l2,	%i3,	%i2
	smul	%o1,	0x0419,	%l1
	subcc	%l3,	0x1B73,	%o5
	sub	%i5,	0x1D9D,	%o4
	sdivcc	%o3,	0x085B,	%o7
	movge	%icc,	%l5,	%i4
	xnorcc	%o0,	%i0,	%l4
	movleu	%icc,	%g4,	%i1
	fmovsa	%icc,	%f9,	%f19
	save %o6, 0x00B0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l6,	[%l7 + 0x54]
	fmovsgu	%icc,	%f3,	%f6
	xnorcc	%o2,	0x1C6C,	%g3
	sdivx	%g1,	0x0567,	%i6
	xnor	%g7,	0x0E64,	%i7
	edge8	%g6,	%g2,	%l2
	sethi	0x121D,	%g5
	alignaddr	%i3,	%i2,	%l1
	andn	%l3,	%o5,	%o1
	stx	%o4,	[%l7 + 0x60]
	movne	%xcc,	%i5,	%o3
	fpack32	%f6,	%f6,	%f6
	edge8	%o7,	%i4,	%l5
	popc	%i0,	%o0
	movleu	%xcc,	%l4,	%i1
	orn	%o6,	%l0,	%g4
	fcmpeq32	%f10,	%f28,	%l6
	fmovsne	%xcc,	%f29,	%f3
	sth	%o2,	[%l7 + 0x16]
	fsrc2	%f14,	%f26
	movg	%xcc,	%g3,	%i6
	ldsw	[%l7 + 0x24],	%g1
	xorcc	%g7,	%g6,	%i7
	fmovdne	%xcc,	%f16,	%f13
	fmovs	%f15,	%f0
	fornot2s	%f28,	%f14,	%f4
	movpos	%xcc,	%g2,	%l2
	edge16ln	%g5,	%i2,	%i3
	addcc	%l3,	%o5,	%o1
	umul	%l1,	%i5,	%o4
	fcmple32	%f6,	%f18,	%o3
	st	%f3,	[%l7 + 0x40]
	fmovrsgz	%o7,	%f3,	%f7
	edge32n	%i4,	%i0,	%o0
	smulcc	%l5,	%l4,	%o6
	movgu	%icc,	%i1,	%l0
	and	%g4,	0x04B3,	%o2
	popc	0x1ADD,	%l6
	mulscc	%g3,	0x16C1,	%g1
	edge16n	%i6,	%g7,	%i7
	fmovdne	%icc,	%f15,	%f28
	movrlz	%g2,	%g6,	%l2
	array32	%i2,	%i3,	%l3
	sethi	0x15BE,	%o5
	fmovsne	%icc,	%f12,	%f10
	sir	0x1AC9
	mova	%icc,	%g5,	%o1
	movge	%xcc,	%i5,	%o4
	movgu	%xcc,	%l1,	%o3
	srl	%i4,	%i0,	%o0
	orcc	%l5,	%l4,	%o7
	movneg	%xcc,	%i1,	%l0
	stb	%o6,	[%l7 + 0x61]
	addcc	%o2,	0x1092,	%l6
	xnor	%g4,	0x0EAE,	%g1
	fmovrdgz	%g3,	%f12,	%f12
	movrlez	%g7,	0x383,	%i7
	fands	%f15,	%f15,	%f11
	sdiv	%i6,	0x096A,	%g2
	fands	%f0,	%f23,	%f30
	ldub	[%l7 + 0x30],	%l2
	xor	%g6,	%i2,	%i3
	ldsw	[%l7 + 0x78],	%l3
	nop
	set	0x6D, %l4
	ldub	[%l7 + %l4],	%g5
	ldd	[%l7 + 0x08],	%o4
	edge16	%o1,	%o4,	%i5
	alignaddr	%l1,	%o3,	%i4
	mulscc	%o0,	%l5,	%l4
	save %i0, %i1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f8,	[%l7 + 0x50]
	movg	%xcc,	%o6,	%o2
	fornot2	%f10,	%f28,	%f22
	udivx	%l0,	0x0960,	%g4
	ldub	[%l7 + 0x0E],	%l6
	fsrc1	%f8,	%f24
	edge32	%g1,	%g3,	%g7
	andncc	%i7,	%i6,	%g2
	ldsw	[%l7 + 0x3C],	%g6
	movrgez	%i2,	0x3CB,	%l2
	edge16ln	%i3,	%g5,	%o5
	andncc	%o1,	%l3,	%i5
	and	%l1,	%o3,	%o4
	add	%o0,	%i4,	%l4
	std	%f0,	[%l7 + 0x70]
	ldsw	[%l7 + 0x74],	%l5
	sra	%i1,	0x1D,	%i0
	edge32ln	%o6,	%o7,	%o2
	fornot2s	%f24,	%f8,	%f18
	fmovrslez	%g4,	%f19,	%f27
	fandnot1s	%f17,	%f24,	%f10
	stb	%l6,	[%l7 + 0x35]
	orncc	%l0,	%g3,	%g7
	fcmpeq16	%f12,	%f10,	%i7
	stw	%g1,	[%l7 + 0x28]
	nop
	set	0x38, %o0
	stx	%g2,	[%l7 + %o0]
	popc	%g6,	%i2
	fabss	%f7,	%f7
	or	%i6,	0x0C4D,	%i3
	edge8	%g5,	%l2,	%o5
	movrne	%o1,	0x3AF,	%l3
	edge16	%i5,	%o3,	%l1
	ldd	[%l7 + 0x70],	%o0
	move	%xcc,	%o4,	%l4
	std	%f22,	[%l7 + 0x30]
	movne	%icc,	%l5,	%i1
	umulcc	%i0,	0x0D33,	%i4
	edge16n	%o7,	%o2,	%o6
	movcs	%icc,	%l6,	%g4
	ldsw	[%l7 + 0x78],	%l0
	movvc	%xcc,	%g7,	%i7
	fmovsvc	%icc,	%f10,	%f11
	xnorcc	%g1,	0x19C0,	%g2
	edge32	%g6,	%i2,	%g3
	edge16n	%i3,	%i6,	%g5
	faligndata	%f22,	%f16,	%f18
	mova	%icc,	%o5,	%l2
	fones	%f8
	movge	%icc,	%l3,	%o1
	umul	%o3,	0x00C9,	%l1
	edge32l	%o0,	%i5,	%l4
	edge32n	%l5,	%o4,	%i1
	orncc	%i4,	%i0,	%o7
	movge	%xcc,	%o2,	%o6
	movrgz	%g4,	%l0,	%l6
	move	%xcc,	%g7,	%g1
	fmovrde	%i7,	%f4,	%f2
	srlx	%g2,	%i2,	%g6
	edge32	%g3,	%i6,	%g5
	for	%f18,	%f2,	%f24
	sub	%o5,	%l2,	%l3
	fmovdvc	%xcc,	%f30,	%f9
	movre	%o1,	%i3,	%o3
	sir	0x1243
	stw	%o0,	[%l7 + 0x08]
	ld	[%l7 + 0x5C],	%f14
	movneg	%icc,	%i5,	%l1
	fmovse	%icc,	%f1,	%f30
	udivx	%l4,	0x1141,	%l5
	movgu	%xcc,	%o4,	%i1
	udiv	%i4,	0x01E9,	%o7
	sllx	%o2,	%i0,	%g4
	lduw	[%l7 + 0x10],	%l0
	fnot1	%f8,	%f10
	edge16n	%l6,	%g7,	%g1
	fcmpeq16	%f12,	%f24,	%i7
	fxor	%f30,	%f18,	%f16
	fmovdcc	%icc,	%f19,	%f31
	edge8	%o6,	%i2,	%g2
	edge16n	%g3,	%g6,	%g5
	fpadd32s	%f28,	%f21,	%f6
	sir	0x0EC8
	fmovrsgez	%o5,	%f13,	%f28
	subc	%l2,	0x02D0,	%i6
	udiv	%o1,	0x0184,	%i3
	orncc	%l3,	%o0,	%i5
	fands	%f14,	%f16,	%f19
	fpsub32	%f8,	%f14,	%f12
	fornot2s	%f8,	%f28,	%f29
	edge8	%l1,	%l4,	%o3
	smulcc	%o4,	%l5,	%i4
	sth	%o7,	[%l7 + 0x40]
	movrlez	%i1,	0x11B,	%i0
	fmovsg	%xcc,	%f13,	%f27
	edge8	%g4,	%o2,	%l0
	fmovrslz	%l6,	%f1,	%f0
	alignaddrl	%g7,	%i7,	%o6
	movpos	%xcc,	%g1,	%i2
	umul	%g3,	%g2,	%g5
	fmovs	%f25,	%f7
	movrlez	%o5,	%l2,	%i6
	fcmpd	%fcc1,	%f18,	%f6
	lduh	[%l7 + 0x70],	%g6
	restore %o1, %l3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i5,	%l1,	%l4
	fmovsl	%xcc,	%f11,	%f19
	ldub	[%l7 + 0x38],	%o3
	stw	%o0,	[%l7 + 0x78]
	udivcc	%l5,	0x160B,	%o4
	subc	%i4,	%o7,	%i1
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%i0
	edge8ln	%g4,	%l0,	%l6
	and	%o2,	%g7,	%o6
	addc	%g1,	%i7,	%g3
	edge32n	%i2,	%g2,	%o5
	andncc	%l2,	%i6,	%g6
	fexpand	%f7,	%f2
	movne	%xcc,	%o1,	%l3
	stb	%g5,	[%l7 + 0x46]
	fnors	%f19,	%f4,	%f13
	stb	%i5,	[%l7 + 0x67]
	sub	%i3,	%l4,	%o3
	fpadd32	%f12,	%f18,	%f26
	fnor	%f6,	%f14,	%f4
	ld	[%l7 + 0x5C],	%f1
	subc	%l1,	0x0813,	%o0
	ldsb	[%l7 + 0x78],	%l5
	or	%i4,	%o4,	%o7
	edge32n	%i0,	%i1,	%l0
	edge8l	%l6,	%o2,	%g4
	fmovd	%f30,	%f22
	umul	%g7,	0x0193,	%o6
	sdiv	%g1,	0x07D8,	%g3
	subcc	%i7,	%g2,	%o5
	movpos	%icc,	%i2,	%i6
	and	%g6,	%l2,	%o1
	movn	%xcc,	%g5,	%i5
	fabsd	%f2,	%f10
	fzero	%f30
	popc	%l3,	%i3
	edge8ln	%l4,	%l1,	%o0
	mulx	%l5,	%i4,	%o4
	nop
	set	0x24, %o4
	lduh	[%l7 + %o4],	%o3
	edge32n	%i0,	%i1,	%l0
	save %l6, %o2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g7,	0x02B2,	%o6
	umul	%g1,	0x1696,	%g4
	stx	%g3,	[%l7 + 0x60]
	ldd	[%l7 + 0x58],	%i6
	array32	%g2,	%o5,	%i6
	edge32ln	%g6,	%l2,	%o1
	movvs	%xcc,	%i2,	%g5
	ldsw	[%l7 + 0x50],	%i5
	fand	%f4,	%f12,	%f18
	array16	%l3,	%i3,	%l1
	save %o0, %l5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o4,	%i4
	fmovrsgz	%o3,	%f26,	%f3
	udivx	%i0,	0x09AD,	%i1
	fsrc1s	%f25,	%f17
	srax	%l0,	0x18,	%l6
	movg	%icc,	%o7,	%g7
	srlx	%o6,	0x0F,	%g1
	nop
	set	0x74, %o1
	sth	%g4,	[%l7 + %o1]
	edge16n	%o2,	%g3,	%g2
	edge16ln	%o5,	%i6,	%g6
	for	%f8,	%f24,	%f26
	subc	%l2,	%i7,	%i2
	fpadd16	%f18,	%f30,	%f18
	nop
	set	0x20, %g7
	ldsw	[%l7 + %g7],	%o1
	movge	%icc,	%i5,	%g5
	ldx	[%l7 + 0x68],	%l3
	st	%f16,	[%l7 + 0x7C]
	move	%xcc,	%i3,	%l1
	smulcc	%o0,	0x061A,	%l4
	movne	%xcc,	%o4,	%i4
	add	%o3,	0x0E5A,	%l5
	fmul8x16au	%f17,	%f4,	%f12
	xnorcc	%i0,	0x101B,	%i1
	movpos	%icc,	%l6,	%o7
	movrgz	%l0,	0x3EB,	%g7
	movne	%xcc,	%o6,	%g1
	xnor	%g4,	%g3,	%g2
	orn	%o5,	0x04F7,	%o2
	fmovdneg	%xcc,	%f16,	%f10
	array16	%i6,	%g6,	%l2
	edge8ln	%i7,	%i2,	%i5
	fpsub16s	%f13,	%f29,	%f25
	udivcc	%o1,	0x0BAD,	%g5
	addc	%l3,	0x0D5A,	%i3
	movvc	%xcc,	%l1,	%l4
	sdiv	%o0,	0x0D59,	%i4
	srl	%o4,	0x09,	%l5
	edge32n	%i0,	%i1,	%o3
	umul	%o7,	0x13C4,	%l0
	nop
	set	0x78, %l6
	stx	%l6,	[%l7 + %l6]
	fmovdl	%icc,	%f19,	%f18
	sdivx	%o6,	0x0161,	%g7
	nop
	set	0x68, %o5
	ldx	[%l7 + %o5],	%g4
	alignaddr	%g3,	%g2,	%g1
	fmuld8sux16	%f8,	%f13,	%f6
	ldd	[%l7 + 0x48],	%o2
	subc	%o5,	0x0A8A,	%i6
	mova	%xcc,	%g6,	%l2
	orn	%i7,	0x02C7,	%i5
	siam	0x7
	fmovdvs	%icc,	%f0,	%f5
	movrgz	%o1,	%g5,	%l3
	sdivx	%i3,	0x0129,	%i2
	array8	%l4,	%l1,	%o0
	ldx	[%l7 + 0x40],	%i4
	save %o4, %l5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x4E],	%o3
	mova	%xcc,	%i0,	%o7
	fmovrdgez	%l6,	%f12,	%f12
	smulcc	%o6,	%l0,	%g7
	movn	%xcc,	%g4,	%g2
	sub	%g3,	0x0030,	%g1
	sth	%o5,	[%l7 + 0x50]
	edge32	%i6,	%g6,	%o2
	fmovsge	%xcc,	%f14,	%f22
	nop
	set	0x68, %o3
	ldd	[%l7 + %o3],	%l2
	movgu	%xcc,	%i5,	%o1
	fmovdvs	%xcc,	%f13,	%f23
	stw	%i7,	[%l7 + 0x6C]
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	edge32n	%i3,	%l4,	%l1
	fcmple32	%f18,	%f2,	%o0
	stx	%i4,	[%l7 + 0x48]
	srl	%o4,	%i1,	%o3
	fxor	%f22,	%f28,	%f24
	movg	%icc,	%i0,	%l5
	lduw	[%l7 + 0x6C],	%l6
	fmovdleu	%icc,	%f14,	%f19
	andncc	%o6,	%l0,	%o7
	edge16ln	%g7,	%g4,	%g2
	edge32n	%g3,	%o5,	%g1
	sth	%g6,	[%l7 + 0x68]
	movne	%xcc,	%o2,	%i6
	udiv	%l2,	0x1955,	%i5
	or	%o1,	0x0DD0,	%l3
	bshuffle	%f20,	%f10,	%f20
	alignaddr	%g5,	%i7,	%i3
	movge	%xcc,	%i2,	%l4
	movgu	%xcc,	%l1,	%o0
	movle	%icc,	%i4,	%i1
	udivx	%o4,	0x1AEA,	%i0
	edge8ln	%l5,	%o3,	%o6
	movcs	%icc,	%l0,	%l6
	addcc	%o7,	%g7,	%g2
	smulcc	%g4,	0x0569,	%o5
	sir	0x0EF7
	orncc	%g1,	%g6,	%g3
	ldsh	[%l7 + 0x42],	%i6
	udivx	%o2,	0x1437,	%l2
	movneg	%xcc,	%o1,	%i5
	edge8ln	%l3,	%g5,	%i7
	sllx	%i2,	%i3,	%l4
	fpadd32s	%f17,	%f19,	%f19
	ldd	[%l7 + 0x10],	%f12
	movcs	%icc,	%o0,	%i4
	fmovrslez	%i1,	%f4,	%f12
	andncc	%l1,	%o4,	%l5
	array16	%i0,	%o6,	%l0
	srlx	%l6,	0x19,	%o3
	ldx	[%l7 + 0x28],	%o7
	fmovrdlz	%g7,	%f26,	%f0
	ldsw	[%l7 + 0x24],	%g4
	restore %g2, 0x1B1F, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x14B4
	fmovrslz	%o5,	%f24,	%f13
	ldx	[%l7 + 0x38],	%g3
	array16	%i6,	%o2,	%l2
	fmovrsgz	%g6,	%f3,	%f3
	ldub	[%l7 + 0x4C],	%o1
	array16	%i5,	%g5,	%i7
	movneg	%xcc,	%i2,	%l3
	array16	%i3,	%o0,	%l4
	stw	%i4,	[%l7 + 0x44]
	sub	%i1,	0x0B3B,	%o4
	addcc	%l1,	%i0,	%l5
	sdiv	%o6,	0x1614,	%l6
	edge16n	%l0,	%o3,	%o7
	array16	%g7,	%g2,	%g4
	ldub	[%l7 + 0x46],	%g1
	ld	[%l7 + 0x6C],	%f30
	movl	%icc,	%o5,	%g3
	and	%o2,	0x0044,	%l2
	array32	%i6,	%o1,	%i5
	xorcc	%g5,	%i7,	%g6
	fxors	%f16,	%f30,	%f3
	edge16	%i2,	%l3,	%i3
	fmovdle	%xcc,	%f13,	%f9
	edge32ln	%l4,	%o0,	%i4
	orncc	%o4,	%i1,	%l1
	popc	0x07D1,	%l5
	alignaddrl	%i0,	%o6,	%l6
	fmovscs	%icc,	%f23,	%f2
	add	%o3,	%l0,	%o7
	or	%g7,	0x12FA,	%g2
	edge32l	%g1,	%o5,	%g3
	fcmped	%fcc3,	%f20,	%f14
	fmovrdne	%g4,	%f8,	%f6
	fmovdvs	%xcc,	%f29,	%f23
	movgu	%xcc,	%l2,	%o2
	srax	%o1,	%i5,	%g5
	andcc	%i6,	%i7,	%i2
	movl	%icc,	%l3,	%g6
	stw	%i3,	[%l7 + 0x38]
	st	%f27,	[%l7 + 0x78]
	edge8ln	%l4,	%o0,	%i4
	subc	%o4,	%l1,	%i1
	xor	%i0,	0x169F,	%o6
	stx	%l6,	[%l7 + 0x40]
	movvc	%icc,	%o3,	%l5
	ldsh	[%l7 + 0x78],	%o7
	edge8	%l0,	%g7,	%g1
	popc	%o5,	%g2
	xnorcc	%g4,	0x07E8,	%g3
	fpadd16s	%f12,	%f13,	%f0
	edge32n	%o2,	%o1,	%l2
	sth	%i5,	[%l7 + 0x6A]
	lduw	[%l7 + 0x58],	%g5
	for	%f0,	%f4,	%f10
	movcc	%icc,	%i7,	%i6
	sdivx	%i2,	0x1554,	%l3
	popc	%g6,	%l4
	edge8l	%o0,	%i4,	%o4
	edge16l	%l1,	%i1,	%i0
	movleu	%icc,	%i3,	%l6
	subcc	%o6,	%o3,	%l5
	sllx	%l0,	0x05,	%g7
	edge16n	%g1,	%o7,	%o5
	ldsb	[%l7 + 0x62],	%g2
	edge16ln	%g4,	%o2,	%o1
	add	%g3,	%l2,	%g5
	sllx	%i5,	0x08,	%i6
	sdiv	%i7,	0x1E98,	%l3
	fmovdn	%icc,	%f2,	%f15
	fmul8x16	%f23,	%f6,	%f24
	mova	%icc,	%i2,	%l4
	bshuffle	%f30,	%f22,	%f10
	or	%o0,	%g6,	%i4
	std	%f8,	[%l7 + 0x78]
	edge16l	%o4,	%l1,	%i1
	addccc	%i0,	0x0585,	%i3
	ldx	[%l7 + 0x60],	%l6
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	fone	%f16
	udiv	%g7,	0x0876,	%g1
	srax	%o7,	%o5,	%o6
	movle	%xcc,	%g2,	%g4
	sll	%o1,	0x1A,	%g3
	subc	%o2,	%g5,	%l2
	srl	%i5,	0x12,	%i7
	andcc	%i6,	0x0A63,	%l3
	movneg	%xcc,	%l4,	%o0
	xorcc	%g6,	%i4,	%o4
	fmovrde	%i2,	%f26,	%f18
	edge32l	%i1,	%i0,	%i3
	movle	%icc,	%l6,	%l1
	ldx	[%l7 + 0x68],	%o3
	umul	%l5,	%l0,	%g7
	sth	%o7,	[%l7 + 0x74]
	lduw	[%l7 + 0x44],	%g1
	subccc	%o6,	%o5,	%g2
	movneg	%icc,	%g4,	%o1
	fands	%f17,	%f27,	%f29
	lduh	[%l7 + 0x36],	%o2
	umul	%g3,	%g5,	%i5
	movrlz	%l2,	0x190,	%i6
	ld	[%l7 + 0x0C],	%f5
	addccc	%i7,	0x103C,	%l4
	edge16l	%l3,	%o0,	%g6
	fpadd32	%f14,	%f8,	%f14
	fpsub32s	%f23,	%f13,	%f8
	std	%f6,	[%l7 + 0x18]
	fands	%f0,	%f4,	%f7
	andncc	%o4,	%i4,	%i1
	mulx	%i0,	0x0A16,	%i2
	movgu	%xcc,	%i3,	%l6
	nop
	set	0x27, %i5
	stb	%l1,	[%l7 + %i5]
	fpmerge	%f14,	%f5,	%f12
	edge8	%o3,	%l0,	%l5
	stw	%o7,	[%l7 + 0x20]
	subccc	%g7,	%g1,	%o6
	mova	%xcc,	%g2,	%g4
	stx	%o5,	[%l7 + 0x18]
	edge32	%o1,	%o2,	%g5
	srax	%g3,	0x13,	%l2
	fcmple32	%f20,	%f8,	%i6
	addccc	%i5,	%i7,	%l3
	fnot1s	%f2,	%f24
	array8	%l4,	%o0,	%o4
	and	%i4,	0x0481,	%g6
	fornot1	%f30,	%f24,	%f22
	ldsh	[%l7 + 0x6C],	%i1
	fnor	%f4,	%f16,	%f0
	pdist	%f14,	%f24,	%f6
	xnorcc	%i2,	%i0,	%i3
	ldsw	[%l7 + 0x30],	%l1
	movvs	%xcc,	%o3,	%l0
	movle	%xcc,	%l5,	%l6
	movrgez	%o7,	%g7,	%o6
	umulcc	%g1,	0x08D9,	%g4
	fmovdcs	%icc,	%f14,	%f2
	edge32l	%o5,	%g2,	%o2
	addcc	%g5,	%g3,	%o1
	mova	%xcc,	%i6,	%i5
	addccc	%l2,	0x1FC6,	%i7
	stb	%l4,	[%l7 + 0x6A]
	sub	%l3,	0x1137,	%o4
	stw	%i4,	[%l7 + 0x08]
	std	%f8,	[%l7 + 0x38]
	movcc	%icc,	%g6,	%i1
	save %i2, 0x1BE8, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i3,	%l1,	%o0
	subc	%l0,	0x1C79,	%o3
	stb	%l5,	[%l7 + 0x10]
	nop
	set	0x30, %l0
	stw	%o7,	[%l7 + %l0]
	nop
	set	0x28, %l1
	lduw	[%l7 + %l1],	%g7
	edge16n	%l6,	%o6,	%g4
	movrgz	%o5,	%g2,	%o2
	stw	%g1,	[%l7 + 0x14]
	xor	%g3,	0x1123,	%g5
	srax	%i6,	%i5,	%o1
	ldd	[%l7 + 0x18],	%i6
	fandnot2s	%f4,	%f17,	%f26
	ldd	[%l7 + 0x20],	%f18
	xnorcc	%l2,	%l4,	%l3
	movvs	%icc,	%i4,	%o4
	movl	%xcc,	%i1,	%i2
	ld	[%l7 + 0x34],	%f13
	fmovdne	%xcc,	%f10,	%f28
	fmovsa	%icc,	%f28,	%f4
	edge8l	%g6,	%i3,	%i0
	ldx	[%l7 + 0x28],	%o0
	sdivx	%l1,	0x0599,	%l0
	addcc	%o3,	0x0042,	%o7
	subc	%l5,	%g7,	%l6
	fmovdcc	%xcc,	%f21,	%f22
	ldx	[%l7 + 0x40],	%g4
	mova	%icc,	%o5,	%g2
	std	%f18,	[%l7 + 0x08]
	edge16ln	%o2,	%g1,	%o6
	edge8	%g3,	%i6,	%i5
	movg	%xcc,	%g5,	%o1
	array8	%l2,	%i7,	%l3
	movl	%icc,	%i4,	%l4
	movle	%xcc,	%o4,	%i1
	stw	%i2,	[%l7 + 0x44]
	ldsh	[%l7 + 0x56],	%i3
	movvs	%icc,	%g6,	%o0
	alignaddrl	%l1,	%l0,	%o3
	fmovrdlz	%o7,	%f4,	%f0
	edge8	%l5,	%i0,	%g7
	sllx	%l6,	%g4,	%o5
	sll	%g2,	%g1,	%o2
	fpmerge	%f12,	%f13,	%f22
	movne	%icc,	%g3,	%o6
	edge8ln	%i5,	%g5,	%i6
	movg	%xcc,	%o1,	%i7
	smulcc	%l2,	0x05B6,	%i4
	fpsub32	%f18,	%f22,	%f2
	stw	%l3,	[%l7 + 0x20]
	fcmple16	%f8,	%f22,	%o4
	lduw	[%l7 + 0x48],	%i1
	xnor	%l4,	%i2,	%g6
	fcmpeq16	%f4,	%f2,	%o0
	addc	%i3,	%l0,	%o3
	udivcc	%l1,	0x1183,	%o7
	fmovrdgz	%l5,	%f16,	%f10
	fcmpne32	%f2,	%f24,	%g7
	movrne	%l6,	%g4,	%i0
	movg	%xcc,	%g2,	%g1
	sethi	0x0CFD,	%o5
	edge16ln	%o2,	%o6,	%g3
	fandnot2	%f0,	%f14,	%f28
	movrgez	%g5,	%i5,	%o1
	fexpand	%f17,	%f8
	fmul8x16al	%f3,	%f5,	%f12
	xnorcc	%i7,	%l2,	%i4
	edge8	%i6,	%l3,	%i1
	sub	%l4,	0x01CF,	%i2
	sdivcc	%g6,	0x1A01,	%o4
	umul	%o0,	%l0,	%i3
	sll	%l1,	%o3,	%l5
	addc	%g7,	%o7,	%g4
	ld	[%l7 + 0x0C],	%f22
	alignaddrl	%l6,	%g2,	%g1
	move	%icc,	%o5,	%o2
	fnor	%f24,	%f30,	%f16
	popc	%i0,	%g3
	movne	%icc,	%o6,	%g5
	ldsw	[%l7 + 0x28],	%i5
	edge32ln	%i7,	%l2,	%i4
	sll	%i6,	0x18,	%l3
	orn	%i1,	0x0992,	%o1
	fands	%f12,	%f29,	%f1
	or	%i2,	%l4,	%o4
	edge8ln	%g6,	%o0,	%l0
	subccc	%l1,	0x0E14,	%i3
	fmovd	%f2,	%f10
	udivcc	%o3,	0x0269,	%g7
	sethi	0x0DE7,	%o7
	movrgez	%g4,	%l6,	%l5
	fmovde	%icc,	%f8,	%f15
	fmovrdlez	%g1,	%f4,	%f20
	sth	%o5,	[%l7 + 0x3C]
	movneg	%icc,	%o2,	%i0
	restore %g2, 0x1CAE, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g5,	0x0D07,	%i5
	movle	%xcc,	%g3,	%l2
	and	%i4,	%i6,	%l3
	fxors	%f19,	%f12,	%f12
	fxnor	%f14,	%f28,	%f16
	ld	[%l7 + 0x40],	%f26
	fnand	%f0,	%f6,	%f28
	andn	%i7,	0x194E,	%o1
	subc	%i1,	0x117E,	%l4
	stx	%o4,	[%l7 + 0x50]
	movn	%xcc,	%i2,	%g6
	sir	0x142B
	mova	%icc,	%o0,	%l1
	edge32	%l0,	%o3,	%i3
	subcc	%g7,	0x1A6C,	%g4
	edge16	%o7,	%l5,	%g1
	sdivx	%l6,	0x12F1,	%o5
	movcc	%icc,	%i0,	%o2
	sdiv	%o6,	0x0968,	%g2
	andn	%i5,	0x1850,	%g3
	sdiv	%g5,	0x00CB,	%i4
	umul	%i6,	0x199B,	%l2
	sth	%i7,	[%l7 + 0x16]
	edge8l	%l3,	%i1,	%o1
	fmovdn	%xcc,	%f10,	%f20
	movn	%icc,	%o4,	%l4
	xnorcc	%g6,	%i2,	%l1
	fandnot2s	%f24,	%f4,	%f23
	lduh	[%l7 + 0x2E],	%o0
	fpadd16s	%f17,	%f10,	%f14
	fones	%f1
	std	%f26,	[%l7 + 0x28]
	sdivcc	%o3,	0x000F,	%i3
	umul	%g7,	%g4,	%l0
	xnorcc	%o7,	%g1,	%l5
	fnors	%f16,	%f11,	%f28
	fmovdleu	%icc,	%f19,	%f28
	srl	%o5,	%l6,	%i0
	sdiv	%o2,	0x1CA9,	%g2
	ldub	[%l7 + 0x74],	%o6
	ldsw	[%l7 + 0x68],	%g3
	movg	%xcc,	%i5,	%g5
	edge32ln	%i6,	%l2,	%i4
	fmovsgu	%icc,	%f12,	%f12
	edge8n	%l3,	%i7,	%o1
	edge32ln	%i1,	%o4,	%g6
	sdivx	%l4,	0x0E42,	%l1
	fmovrdgez	%o0,	%f0,	%f0
	alignaddrl	%o3,	%i2,	%g7
	movcs	%xcc,	%i3,	%l0
	srlx	%o7,	0x0D,	%g1
	sra	%l5,	0x0B,	%g4
	sth	%l6,	[%l7 + 0x36]
	sth	%o5,	[%l7 + 0x26]
	fpsub32	%f26,	%f20,	%f12
	ldub	[%l7 + 0x58],	%i0
	addccc	%g2,	%o6,	%o2
	fmovscs	%icc,	%f3,	%f4
	addcc	%i5,	0x02BE,	%g3
	fmovsleu	%icc,	%f28,	%f3
	stw	%i6,	[%l7 + 0x20]
	sth	%g5,	[%l7 + 0x52]
	fpackfix	%f2,	%f12
	sllx	%l2,	%l3,	%i4
	ldub	[%l7 + 0x68],	%o1
	edge8l	%i7,	%i1,	%o4
	movn	%icc,	%l4,	%l1
	fmovsneg	%xcc,	%f1,	%f31
	subccc	%g6,	0x18A1,	%o0
	edge16n	%i2,	%g7,	%o3
	or	%i3,	0x0C3A,	%l0
	andncc	%o7,	%l5,	%g4
	fmovdne	%xcc,	%f5,	%f3
	andcc	%g1,	0x1D24,	%l6
	fmovdleu	%icc,	%f17,	%f18
	mulx	%i0,	%o5,	%g2
	edge32n	%o6,	%i5,	%o2
	sll	%g3,	%i6,	%g5
	fnands	%f26,	%f26,	%f10
	fcmpgt32	%f6,	%f14,	%l3
	subccc	%l2,	0x0186,	%i4
	addccc	%i7,	%i1,	%o4
	sdiv	%o1,	0x1837,	%l4
	fmovrdgz	%l1,	%f6,	%f22
	movne	%icc,	%o0,	%g6
	subccc	%i2,	0x0ED6,	%o3
	stw	%i3,	[%l7 + 0x74]
	umul	%l0,	%o7,	%g7
	move	%icc,	%l5,	%g1
	movg	%icc,	%g4,	%i0
	ld	[%l7 + 0x20],	%f18
	udiv	%o5,	0x0B53,	%g2
	fornot2	%f4,	%f24,	%f18
	movcs	%icc,	%l6,	%i5
	sethi	0x109E,	%o2
	ld	[%l7 + 0x20],	%f31
	edge16ln	%o6,	%g3,	%g5
	udiv	%i6,	0x1680,	%l2
	movpos	%icc,	%l3,	%i7
	fmovsleu	%icc,	%f16,	%f23
	alignaddrl	%i4,	%o4,	%i1
	alignaddr	%o1,	%l4,	%o0
	movne	%icc,	%l1,	%g6
	fmovse	%icc,	%f28,	%f30
	andncc	%i2,	%o3,	%l0
	ldsh	[%l7 + 0x6E],	%o7
	movvc	%icc,	%i3,	%l5
	array32	%g1,	%g7,	%i0
	smul	%g4,	%g2,	%o5
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	addccc	%o2,	0x1A08,	%g5
	mulscc	%i6,	%l2,	%g3
	movn	%xcc,	%i7,	%i4
	ldx	[%l7 + 0x58],	%o4
	ldd	[%l7 + 0x30],	%l2
	add	%o1,	0x03EF,	%l4
	array16	%o0,	%i1,	%l1
	sll	%i2,	%o3,	%g6
	movcs	%xcc,	%l0,	%o7
	udiv	%l5,	0x089D,	%i3
	smulcc	%g7,	0x10FD,	%g1
	movpos	%xcc,	%i0,	%g4
	st	%f3,	[%l7 + 0x58]
	fnot1	%f30,	%f2
	subc	%g2,	%o5,	%l6
	fmovsge	%icc,	%f11,	%f11
	sllx	%o6,	%i5,	%g5
	edge16n	%o2,	%i6,	%g3
	ldx	[%l7 + 0x78],	%i7
	umul	%i4,	0x13F6,	%o4
	fzeros	%f12
	fcmpne16	%f30,	%f20,	%l2
	subcc	%o1,	%l3,	%l4
	stx	%i1,	[%l7 + 0x38]
	movg	%xcc,	%o0,	%i2
	edge32ln	%l1,	%o3,	%l0
	alignaddrl	%g6,	%l5,	%o7
	sub	%i3,	%g1,	%i0
	subccc	%g4,	0x1958,	%g7
	movge	%xcc,	%o5,	%l6
	movg	%icc,	%o6,	%i5
	array16	%g5,	%g2,	%o2
	mulscc	%i6,	0x13A9,	%g3
	sra	%i4,	%o4,	%i7
	addcc	%l2,	0x150C,	%o1
	edge32	%l3,	%i1,	%l4
	srlx	%i2,	%o0,	%o3
	array16	%l0,	%g6,	%l1
	or	%o7,	0x121C,	%l5
	ldd	[%l7 + 0x40],	%g0
	fmovsvs	%xcc,	%f12,	%f3
	siam	0x6
	stw	%i3,	[%l7 + 0x0C]
	fnands	%f20,	%f25,	%f20
	fcmpne16	%f0,	%f28,	%i0
	nop
	set	0x2C, %i6
	stw	%g4,	[%l7 + %i6]
	movrgz	%g7,	0x113,	%o5
	xor	%l6,	%i5,	%g5
	or	%g2,	0x1EFB,	%o2
	and	%o6,	%i6,	%i4
	movne	%xcc,	%g3,	%i7
	fandnot2s	%f31,	%f16,	%f20
	fpadd16s	%f19,	%f26,	%f5
	fmovrdlz	%l2,	%f16,	%f28
	ldx	[%l7 + 0x48],	%o1
	mova	%icc,	%l3,	%o4
	edge16n	%l4,	%i1,	%i2
	sub	%o3,	0x0BE2,	%o0
	fcmpne16	%f20,	%f10,	%g6
	movvc	%icc,	%l0,	%o7
	nop
	set	0x68, %o2
	sth	%l1,	[%l7 + %o2]
	movge	%xcc,	%l5,	%g1
	fmovrsgez	%i0,	%f31,	%f22
	fpadd32	%f22,	%f10,	%f2
	sir	0x1080
	udivcc	%g4,	0x0F89,	%i3
	fmovscc	%xcc,	%f20,	%f14
	fmovrsgez	%o5,	%f1,	%f22
	orcc	%g7,	0x1286,	%i5
	xorcc	%g5,	%g2,	%l6
	orncc	%o2,	0x178B,	%i6
	or	%o6,	0x0823,	%g3
	lduh	[%l7 + 0x56],	%i7
	fmovrdlez	%i4,	%f14,	%f16
	fone	%f26
	movrgez	%o1,	%l2,	%l3
	fmul8x16al	%f3,	%f17,	%f28
	fcmps	%fcc0,	%f18,	%f31
	sdivx	%o4,	0x0315,	%l4
	movgu	%xcc,	%i2,	%i1
	fmovdgu	%xcc,	%f18,	%f23
	sra	%o3,	0x06,	%o0
	mulscc	%l0,	0x1C64,	%g6
	fmul8x16al	%f20,	%f23,	%f8
	xnorcc	%o7,	%l5,	%l1
	fsrc2	%f10,	%f22
	addc	%g1,	%i0,	%i3
	movl	%xcc,	%o5,	%g7
	fnor	%f8,	%f8,	%f0
	udivx	%i5,	0x0A85,	%g4
	move	%icc,	%g5,	%l6
	sll	%g2,	%i6,	%o2
	fpack32	%f12,	%f28,	%f16
	xorcc	%o6,	0x0F3B,	%i7
	ldsb	[%l7 + 0x24],	%i4
	fornot2	%f30,	%f24,	%f6
	movre	%o1,	0x06D,	%l2
	fmovda	%icc,	%f14,	%f14
	umul	%l3,	0x0600,	%g3
	smulcc	%o4,	%i2,	%i1
	edge8l	%o3,	%o0,	%l0
	movrne	%g6,	%o7,	%l4
	fmovrsgz	%l5,	%f8,	%f9
	fmovsle	%icc,	%f18,	%f21
	fpadd16	%f10,	%f18,	%f8
	edge32	%l1,	%i0,	%i3
	movrlz	%o5,	%g7,	%g1
	move	%xcc,	%g4,	%i5
	mova	%icc,	%g5,	%g2
	movvc	%icc,	%l6,	%o2
	sra	%o6,	%i7,	%i4
	move	%icc,	%i6,	%l2
	fpadd32s	%f2,	%f24,	%f2
	ldd	[%l7 + 0x30],	%l2
	fzero	%f20
	ldx	[%l7 + 0x68],	%o1
	andcc	%g3,	0x0447,	%o4
	fornot2	%f4,	%f16,	%f6
	edge16n	%i1,	%o3,	%o0
	restore %l0, 0x1819, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%g6,	%l4
	fmovdvc	%xcc,	%f21,	%f16
	movpos	%icc,	%o7,	%l1
	edge16n	%i0,	%i3,	%l5
	fcmpes	%fcc0,	%f10,	%f6
	save %o5, 0x0A49, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g4,	%g7,	%i5
	movrne	%g5,	%g2,	%l6
	fcmple16	%f6,	%f16,	%o6
	xor	%o2,	%i7,	%i6
	movrlez	%i4,	%l2,	%o1
	std	%f2,	[%l7 + 0x58]
	ldub	[%l7 + 0x6F],	%g3
	andncc	%l3,	%o4,	%i1
	fxor	%f22,	%f26,	%f14
	fmovrdgz	%o3,	%f14,	%f16
	array16	%o0,	%i2,	%g6
	edge32	%l4,	%o7,	%l0
	lduw	[%l7 + 0x20],	%l1
	fmovsvs	%xcc,	%f18,	%f10
	movne	%xcc,	%i3,	%i0
	move	%icc,	%l5,	%g1
	movcc	%xcc,	%g4,	%g7
	smulcc	%i5,	%o5,	%g2
	fmuld8sux16	%f12,	%f2,	%f6
	and	%l6,	%g5,	%o2
	movge	%xcc,	%o6,	%i7
	addcc	%i4,	0x1764,	%l2
	umul	%i6,	%o1,	%l3
	addccc	%g3,	%i1,	%o3
	fpack32	%f6,	%f16,	%f12
	edge8ln	%o0,	%o4,	%i2
	popc	0x030D,	%l4
	mulx	%o7,	0x1ADC,	%l0
	fmovsa	%xcc,	%f4,	%f5
	edge16	%l1,	%g6,	%i3
	fornot2s	%f8,	%f14,	%f1
	movne	%icc,	%i0,	%g1
	sdiv	%g4,	0x0317,	%l5
	fmovrdne	%g7,	%f6,	%f0
	array8	%o5,	%g2,	%i5
	sdivx	%l6,	0x070E,	%o2
	ldx	[%l7 + 0x50],	%o6
	fpadd16	%f20,	%f6,	%f26
	popc	0x07F6,	%i7
	movrlez	%i4,	%g5,	%l2
	srlx	%o1,	0x1A,	%i6
	edge8	%g3,	%l3,	%o3
	edge16n	%o0,	%i1,	%i2
	mulscc	%o4,	%l4,	%o7
	addccc	%l0,	0x106D,	%l1
	movgu	%icc,	%i3,	%g6
	andn	%i0,	0x1656,	%g4
	save %l5, 0x1153, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f3,	%f15
	edge32ln	%g1,	%g2,	%i5
	fxors	%f8,	%f29,	%f27
	fmovsleu	%xcc,	%f24,	%f26
	xorcc	%l6,	%o2,	%o6
	movn	%xcc,	%i7,	%o5
	fmovdvc	%icc,	%f26,	%f24
	array32	%g5,	%i4,	%l2
	addcc	%o1,	%g3,	%l3
	ldd	[%l7 + 0x10],	%f26
	alignaddrl	%o3,	%i6,	%o0
	movgu	%xcc,	%i1,	%o4
	st	%f21,	[%l7 + 0x08]
	addcc	%l4,	0x16E3,	%i2
	edge16	%l0,	%l1,	%i3
	edge16	%g6,	%i0,	%g4
	sethi	0x1A24,	%l5
	fmovsa	%icc,	%f19,	%f28
	array8	%o7,	%g7,	%g1
	srl	%i5,	%g2,	%l6
	fmovdvc	%xcc,	%f30,	%f23
	sethi	0x11E7,	%o6
	save %o2, %o5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%i4,	%l2,	%g5
	fmovdcs	%icc,	%f0,	%f13
	sra	%o1,	%g3,	%l3
	movvc	%icc,	%o3,	%i6
	xnorcc	%i1,	%o4,	%o0
	sir	0x1956
	fmul8x16au	%f28,	%f16,	%f26
	addc	%i2,	%l4,	%l1
	fmul8ulx16	%f28,	%f26,	%f20
	movneg	%icc,	%l0,	%g6
	umulcc	%i3,	%g4,	%i0
	fsrc1	%f14,	%f16
	movrgz	%o7,	0x327,	%l5
	movle	%xcc,	%g1,	%i5
	umulcc	%g2,	%l6,	%o6
	mova	%icc,	%o2,	%o5
	movleu	%xcc,	%i7,	%g7
	stb	%l2,	[%l7 + 0x66]
	std	%f0,	[%l7 + 0x38]
	nop
	set	0x70, %g6
	sth	%g5,	[%l7 + %g6]
	sdivx	%i4,	0x0BFB,	%o1
	movl	%xcc,	%l3,	%o3
	xor	%i6,	0x041B,	%g3
	mova	%xcc,	%o4,	%i1
	fmul8x16au	%f26,	%f11,	%f24
	edge32ln	%i2,	%o0,	%l1
	edge32l	%l4,	%l0,	%i3
	fmovdcc	%xcc,	%f21,	%f24
	umulcc	%g6,	0x141E,	%i0
	lduw	[%l7 + 0x28],	%o7
	edge16l	%l5,	%g1,	%i5
	movcs	%icc,	%g4,	%g2
	sra	%o6,	0x11,	%o2
	movneg	%icc,	%l6,	%i7
	fmovsn	%icc,	%f30,	%f0
	xorcc	%g7,	0x0C78,	%o5
	fmovdcc	%icc,	%f26,	%f27
	fnot2	%f14,	%f10
	movpos	%icc,	%l2,	%i4
	faligndata	%f2,	%f20,	%f24
	movcs	%xcc,	%o1,	%g5
	andcc	%l3,	%i6,	%g3
	andcc	%o4,	%o3,	%i2
	fmovdvc	%xcc,	%f26,	%f27
	std	%f26,	[%l7 + 0x08]
	movneg	%xcc,	%i1,	%o0
	sdivcc	%l1,	0x0E2E,	%l0
	smulcc	%l4,	%g6,	%i3
	sllx	%i0,	0x13,	%o7
	fornot2	%f24,	%f4,	%f28
	popc	%l5,	%g1
	mulx	%g4,	0x01B6,	%g2
	srlx	%o6,	%o2,	%l6
	orcc	%i7,	%i5,	%o5
	ld	[%l7 + 0x54],	%f18
	sethi	0x12CA,	%g7
	fnor	%f26,	%f18,	%f24
	edge32	%i4,	%l2,	%g5
	edge16	%o1,	%l3,	%g3
	save %o4, 0x1E62, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f0,	%f15
	sir	0x131F
	fandnot1	%f0,	%f10,	%f28
	fcmpne16	%f8,	%f30,	%i6
	fnor	%f10,	%f10,	%f14
	edge8	%i1,	%o0,	%l1
	edge32	%l0,	%l4,	%g6
	edge32	%i2,	%i3,	%o7
	fmovsvc	%icc,	%f3,	%f0
	movgu	%icc,	%l5,	%g1
	movrgez	%i0,	0x04F,	%g4
	movge	%icc,	%o6,	%g2
	stx	%o2,	[%l7 + 0x58]
	movgu	%xcc,	%l6,	%i5
	fmovde	%xcc,	%f5,	%f23
	subcc	%i7,	%o5,	%g7
	orn	%i4,	0x1896,	%l2
	fandnot2s	%f18,	%f20,	%f14
	orn	%o1,	%l3,	%g3
	edge16ln	%g5,	%o3,	%i6
	edge8	%i1,	%o0,	%l1
	ldsh	[%l7 + 0x40],	%o4
	edge32n	%l0,	%g6,	%i2
	lduh	[%l7 + 0x48],	%i3
	fsrc1	%f4,	%f26
	udiv	%l4,	0x08F5,	%l5
	fcmped	%fcc3,	%f12,	%f14
	movre	%o7,	0x21F,	%i0
	fcmped	%fcc0,	%f4,	%f14
	edge8l	%g1,	%o6,	%g4
	xnorcc	%o2,	%g2,	%l6
	movg	%xcc,	%i7,	%i5
	movvs	%icc,	%o5,	%i4
	fmovrde	%l2,	%f12,	%f30
	fcmpes	%fcc0,	%f12,	%f20
	stb	%g7,	[%l7 + 0x3A]
	movvs	%icc,	%o1,	%l3
	subccc	%g3,	0x1F8D,	%g5
	fcmple16	%f2,	%f8,	%i6
	fabss	%f10,	%f9
	sub	%o3,	%o0,	%l1
	save %i1, %o4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l0,	%i2,	%l4
	stw	%i3,	[%l7 + 0x58]
	sub	%o7,	0x0538,	%l5
	lduw	[%l7 + 0x5C],	%g1
	lduw	[%l7 + 0x50],	%o6
	array16	%g4,	%o2,	%g2
	stw	%l6,	[%l7 + 0x68]
	array32	%i7,	%i0,	%i5
	edge32	%o5,	%l2,	%g7
	movge	%xcc,	%i4,	%o1
	st	%f19,	[%l7 + 0x28]
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	movrgz	%l3,	%i6,	%o0
	sir	0x161B
	movrgez	%l1,	%i1,	%o3
	sllx	%g6,	0x01,	%o4
	fmovsl	%xcc,	%f11,	%f29
	ld	[%l7 + 0x3C],	%f20
	movrlz	%l0,	0x0F1,	%l4
	edge8n	%i3,	%o7,	%l5
	andn	%i2,	0x1F29,	%g1
	ldsh	[%l7 + 0x2A],	%g4
	movne	%icc,	%o6,	%g2
	alignaddr	%l6,	%i7,	%i0
	orn	%o2,	0x11E7,	%o5
	fmovsg	%xcc,	%f17,	%f12
	movcc	%icc,	%i5,	%l2
	xnor	%i4,	%g7,	%g3
	ldx	[%l7 + 0x30],	%g5
	andn	%o1,	0x09E3,	%l3
	ld	[%l7 + 0x10],	%f9
	movl	%xcc,	%o0,	%i6
	fexpand	%f20,	%f2
	save %l1, 0x0C60, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i1,	0x032D,	%g6
	xorcc	%o4,	%l4,	%l0
	movrlz	%i3,	0x369,	%o7
	movgu	%xcc,	%l5,	%g1
	sir	0x0D31
	sir	0x0306
	sth	%i2,	[%l7 + 0x0C]
	ld	[%l7 + 0x74],	%f29
	fcmps	%fcc3,	%f0,	%f19
	movge	%icc,	%o6,	%g4
	ldsb	[%l7 + 0x65],	%g2
	edge8	%i7,	%l6,	%o2
	move	%xcc,	%o5,	%i5
	udivx	%i0,	0x015F,	%l2
	stw	%i4,	[%l7 + 0x78]
	fnegs	%f4,	%f24
	fmovrsne	%g7,	%f24,	%f29
	movle	%xcc,	%g5,	%o1
	fmovrsgz	%g3,	%f17,	%f7
	sethi	0x009F,	%l3
	sll	%i6,	%l1,	%o0
	smulcc	%i1,	0x1159,	%g6
	andncc	%o3,	%l4,	%l0
	sdivcc	%o4,	0x08B5,	%i3
	lduw	[%l7 + 0x60],	%l5
	fandnot1	%f12,	%f26,	%f2
	fmovrse	%o7,	%f31,	%f15
	xor	%i2,	0x1E5F,	%g1
	sll	%g4,	%o6,	%g2
	mulscc	%i7,	0x0116,	%o2
	sllx	%l6,	%i5,	%o5
	xor	%l2,	%i4,	%i0
	movcc	%icc,	%g7,	%o1
	movrgz	%g3,	0x2D6,	%l3
	sdivx	%g5,	0x07F5,	%l1
	fxnor	%f22,	%f2,	%f30
	andcc	%i6,	%o0,	%g6
	fmovdne	%xcc,	%f4,	%f12
	alignaddr	%o3,	%i1,	%l0
	movvs	%xcc,	%l4,	%i3
	ldd	[%l7 + 0x78],	%o4
	edge32n	%l5,	%i2,	%g1
	edge32n	%g4,	%o6,	%o7
	edge16	%g2,	%i7,	%l6
	fpsub32s	%f25,	%f14,	%f25
	fnands	%f1,	%f7,	%f20
	ld	[%l7 + 0x58],	%f25
	edge32n	%i5,	%o5,	%l2
	ldx	[%l7 + 0x38],	%i4
	ldd	[%l7 + 0x18],	%f12
	movcs	%icc,	%o2,	%g7
	fmovdcs	%xcc,	%f1,	%f8
	alignaddrl	%i0,	%o1,	%g3
	ldsb	[%l7 + 0x18],	%g5
	stb	%l1,	[%l7 + 0x27]
	subcc	%i6,	0x1E76,	%l3
	fxor	%f2,	%f20,	%f28
	edge8ln	%g6,	%o0,	%i1
	smul	%o3,	0x0BD3,	%l0
	st	%f30,	[%l7 + 0x44]
	sub	%l4,	%o4,	%l5
	fpsub32s	%f1,	%f3,	%f6
	movcc	%xcc,	%i3,	%g1
	fmovsneg	%xcc,	%f25,	%f6
	movneg	%icc,	%i2,	%o6
	ldub	[%l7 + 0x75],	%g4
	fcmpes	%fcc3,	%f29,	%f8
	sdiv	%g2,	0x15C3,	%o7
	fnot2	%f20,	%f26
	addccc	%i7,	0x1530,	%l6
	edge8n	%i5,	%l2,	%i4
	ldub	[%l7 + 0x50],	%o5
	fornot2	%f14,	%f8,	%f8
	movrgz	%o2,	0x21D,	%g7
	sethi	0x1367,	%i0
	fmovrsgez	%g3,	%f30,	%f19
	srlx	%o1,	%g5,	%l1
	fpmerge	%f16,	%f16,	%f28
	orncc	%i6,	0x0904,	%l3
	orncc	%g6,	%o0,	%i1
	orcc	%l0,	%l4,	%o3
	nop
	set	0x34, %i4
	stw	%o4,	[%l7 + %i4]
	xnor	%l5,	%i3,	%g1
	fmovsne	%xcc,	%f29,	%f13
	subcc	%o6,	%g4,	%i2
	fcmpne32	%f12,	%f24,	%g2
	xorcc	%i7,	%l6,	%i5
	ldsw	[%l7 + 0x5C],	%l2
	fxnor	%f20,	%f4,	%f30
	edge32	%o7,	%o5,	%o2
	restore %i4, 0x0F01, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g3,	[%l7 + 0x67]
	movrlz	%o1,	0x325,	%g5
	sll	%l1,	%i6,	%l3
	movrlz	%g6,	%o0,	%i1
	fandnot2s	%f8,	%f18,	%f15
	ldd	[%l7 + 0x50],	%f18
	movn	%xcc,	%l0,	%l4
	movn	%xcc,	%o3,	%g7
	fmovdne	%icc,	%f15,	%f18
	xnorcc	%o4,	0x13BF,	%i3
	movrlez	%g1,	0x34F,	%l5
	movre	%g4,	%i2,	%o6
	edge32ln	%g2,	%l6,	%i5
	srlx	%i7,	%o7,	%o5
	fnands	%f29,	%f19,	%f20
	mova	%icc,	%l2,	%i4
	xorcc	%i0,	0x00EB,	%o2
	sra	%o1,	0x0F,	%g3
	fmul8x16al	%f10,	%f1,	%f14
	fmovda	%icc,	%f7,	%f12
	xor	%l1,	0x0E0B,	%g5
	ld	[%l7 + 0x4C],	%f8
	fpsub32s	%f26,	%f21,	%f4
	srl	%i6,	0x10,	%l3
	addccc	%g6,	%o0,	%l0
	fmovrdgz	%i1,	%f28,	%f0
	fmul8x16al	%f15,	%f18,	%f16
	fone	%f18
	fpack16	%f0,	%f5
	ldd	[%l7 + 0x60],	%f28
	array32	%o3,	%l4,	%o4
	edge16n	%i3,	%g1,	%l5
	fmovdvc	%icc,	%f11,	%f5
	sdiv	%g7,	0x1493,	%i2
	and	%o6,	%g2,	%l6
	std	%f12,	[%l7 + 0x18]
	lduh	[%l7 + 0x7C],	%i5
	nop
	set	0x78, %g4
	std	%f26,	[%l7 + %g4]
	srlx	%g4,	%o7,	%o5
	andcc	%i7,	0x115A,	%i4
	edge32	%l2,	%o2,	%o1
	fmul8x16	%f2,	%f12,	%f28
	xor	%g3,	0x1C30,	%i0
	edge32ln	%l1,	%g5,	%i6
	fnors	%f16,	%f31,	%f29
	srl	%l3,	%o0,	%g6
	fcmpgt16	%f4,	%f14,	%i1
	edge8ln	%l0,	%o3,	%l4
	andncc	%o4,	%i3,	%g1
	ldub	[%l7 + 0x2A],	%g7
	ldd	[%l7 + 0x60],	%l4
	udivx	%i2,	0x046A,	%o6
	andcc	%g2,	%l6,	%i5
	ldsh	[%l7 + 0x4C],	%g4
	mulscc	%o5,	%i7,	%o7
	fmovrslez	%i4,	%f9,	%f19
	edge8n	%o2,	%o1,	%l2
	mova	%xcc,	%i0,	%l1
	movcs	%icc,	%g3,	%g5
	mulscc	%i6,	0x11BF,	%l3
	sth	%g6,	[%l7 + 0x16]
	udivcc	%o0,	0x1B42,	%i1
	sll	%l0,	%o3,	%l4
	fxors	%f0,	%f5,	%f19
	orn	%i3,	0x01E0,	%g1
	srl	%o4,	%g7,	%i2
	movneg	%xcc,	%o6,	%g2
	movgu	%xcc,	%l6,	%i5
	sllx	%g4,	%o5,	%l5
	movl	%xcc,	%i7,	%i4
	edge8	%o7,	%o1,	%o2
	edge16ln	%l2,	%l1,	%i0
	stw	%g3,	[%l7 + 0x34]
	fmuld8ulx16	%f2,	%f27,	%f18
	movvs	%icc,	%i6,	%l3
	edge32n	%g6,	%g5,	%o0
	fmovdcc	%xcc,	%f23,	%f30
	movn	%icc,	%l0,	%i1
	mova	%icc,	%l4,	%o3
	ldsb	[%l7 + 0x55],	%i3
	movge	%icc,	%g1,	%o4
	fmovrdne	%i2,	%f22,	%f24
	stw	%g7,	[%l7 + 0x3C]
	fmovrsgez	%g2,	%f11,	%f17
	subc	%l6,	%o6,	%g4
	nop
	set	0x7C, %i2
	stw	%i5,	[%l7 + %i2]
	fandnot1s	%f4,	%f18,	%f2
	fmovsge	%icc,	%f10,	%f14
	orcc	%o5,	0x072E,	%l5
	ld	[%l7 + 0x1C],	%f17
	fone	%f18
	srlx	%i7,	0x09,	%o7
	mulscc	%o1,	0x1663,	%i4
	xnorcc	%l2,	0x01D7,	%o2
	popc	0x1A7E,	%l1
	popc	0x17AB,	%i0
	nop
	set	0x68, %g2
	stb	%g3,	[%l7 + %g2]
	fmovda	%xcc,	%f23,	%f7
	movvs	%xcc,	%i6,	%g6
	andcc	%l3,	%g5,	%o0
	sra	%i1,	%l4,	%o3
	stx	%i3,	[%l7 + 0x08]
	sll	%l0,	%g1,	%o4
	ldub	[%l7 + 0x4F],	%g7
	movneg	%icc,	%g2,	%i2
	andncc	%o6,	%g4,	%i5
	addc	%o5,	%l6,	%i7
	save %l5, %o7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x0C, %i3
	stb	%i4,	[%l7 + %i3]
	fcmpne16	%f2,	%f24,	%l2
	xnorcc	%l1,	%o2,	%g3
	movre	%i0,	%g6,	%i6
	subccc	%g5,	0x0A14,	%o0
	edge8ln	%i1,	%l3,	%o3
	mulscc	%i3,	0x18A5,	%l4
	movne	%icc,	%g1,	%l0
	ldsb	[%l7 + 0x6C],	%g7
	sdivx	%o4,	0x115A,	%i2
	fnegd	%f20,	%f22
	alignaddr	%o6,	%g4,	%i5
	srl	%g2,	0x09,	%o5
	movrlez	%l6,	%i7,	%l5
	ldsh	[%l7 + 0x1C],	%o7
	srl	%i4,	%l2,	%o1
	orcc	%o2,	%l1,	%g3
	movrlez	%i0,	%i6,	%g6
	movrgez	%g5,	0x009,	%i1
	fsrc1	%f30,	%f30
	ldsh	[%l7 + 0x16],	%o0
	sllx	%l3,	0x17,	%o3
	fmovdcs	%xcc,	%f6,	%f24
	ldsw	[%l7 + 0x5C],	%i3
	fmovrdlz	%g1,	%f28,	%f12
	lduw	[%l7 + 0x10],	%l4
	edge16l	%l0,	%g7,	%o4
	fmovde	%icc,	%f7,	%f14
	fandnot1s	%f26,	%f20,	%f26
	udiv	%i2,	0x05E4,	%g4
	lduw	[%l7 + 0x0C],	%i5
	fmovde	%icc,	%f1,	%f12
	ldsb	[%l7 + 0x26],	%o6
	ldx	[%l7 + 0x50],	%g2
	fpmerge	%f22,	%f13,	%f2
	stw	%o5,	[%l7 + 0x0C]
	sir	0x096B
	or	%l6,	0x13DE,	%i7
	edge8ln	%o7,	%i4,	%l2
	stx	%o1,	[%l7 + 0x48]
	fcmpne32	%f2,	%f30,	%o2
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	fmovdn	%icc,	%f25,	%f26
	alignaddr	%i6,	%g6,	%g3
	addccc	%i1,	0x1F30,	%o0
	umul	%l3,	%o3,	%g5
	smul	%g1,	%i3,	%l0
	sll	%g7,	%l4,	%o4
	umul	%g4,	%i5,	%i2
	sir	0x11D4
	fnand	%f22,	%f10,	%f0
	fnegs	%f3,	%f28
	movre	%g2,	0x08E,	%o5
	xnor	%o6,	0x04C1,	%l6
	movrne	%i7,	0x3C2,	%i4
	mulscc	%o7,	0x0948,	%l2
	andcc	%o1,	%l5,	%o2
	edge32ln	%i0,	%i6,	%g6
	edge16l	%l1,	%g3,	%i1
	sir	0x0BBF
	umul	%l3,	%o0,	%o3
	sdivx	%g1,	0x0DEE,	%g5
	stw	%i3,	[%l7 + 0x48]
	array32	%g7,	%l0,	%l4
	movrlz	%o4,	0x1EA,	%g4
	sra	%i2,	%g2,	%i5
	array16	%o5,	%o6,	%l6
	ldsw	[%l7 + 0x48],	%i7
	edge8ln	%o7,	%l2,	%o1
	ldx	[%l7 + 0x48],	%l5
	orncc	%o2,	0x1BEA,	%i4
	std	%f30,	[%l7 + 0x78]
	array8	%i6,	%g6,	%l1
	umulcc	%g3,	%i1,	%i0
	st	%f13,	[%l7 + 0x6C]
	sll	%l3,	%o3,	%g1
	fones	%f29
	ldx	[%l7 + 0x40],	%g5
	udivx	%o0,	0x1B61,	%g7
	fpackfix	%f14,	%f2
	fcmpgt32	%f18,	%f4,	%i3
	xnor	%l0,	0x1ADE,	%l4
	movpos	%icc,	%g4,	%i2
	or	%g2,	0x02A8,	%o4
	movneg	%icc,	%i5,	%o6
	srlx	%o5,	%i7,	%l6
	fcmped	%fcc1,	%f24,	%f30
	xor	%o7,	0x1206,	%o1
	mulscc	%l5,	%o2,	%i4
	stx	%l2,	[%l7 + 0x38]
	fmovrdlz	%i6,	%f28,	%f6
	edge16ln	%g6,	%l1,	%i1
	movrgez	%i0,	0x208,	%g3
	andncc	%o3,	%l3,	%g5
	srax	%g1,	0x09,	%g7
	movrlez	%o0,	0x082,	%l0
	sethi	0x0762,	%i3
	srax	%g4,	%l4,	%i2
	for	%f6,	%f4,	%f28
	udivx	%o4,	0x0BF6,	%i5
	fpack16	%f22,	%f28
	movre	%g2,	0x3C9,	%o5
	sir	0x0E65
	fnot2	%f4,	%f2
	movrne	%o6,	%i7,	%o7
	smul	%l6,	0x04CC,	%l5
	fmovdge	%xcc,	%f3,	%f13
	umulcc	%o1,	%o2,	%l2
	stx	%i4,	[%l7 + 0x50]
	movleu	%xcc,	%i6,	%g6
	fmul8ulx16	%f10,	%f18,	%f14
	array8	%l1,	%i0,	%i1
	movcs	%xcc,	%g3,	%l3
	fmul8ulx16	%f12,	%f14,	%f12
	alignaddr	%g5,	%g1,	%g7
	edge8n	%o0,	%l0,	%o3
	xorcc	%g4,	0x087B,	%l4
	movne	%xcc,	%i2,	%i3
	movl	%icc,	%i5,	%o4
	sdivx	%g2,	0x059D,	%o6
	ldd	[%l7 + 0x60],	%f24
	edge16	%i7,	%o7,	%o5
	udivcc	%l5,	0x195D,	%o1
	smul	%l6,	0x15AD,	%o2
	ldd	[%l7 + 0x68],	%l2
	movl	%xcc,	%i4,	%g6
	smul	%i6,	0x1C95,	%i0
	fpsub16s	%f16,	%f4,	%f19
	fpsub32	%f18,	%f16,	%f30
	fmovsle	%xcc,	%f28,	%f31
	ldx	[%l7 + 0x48],	%l1
	movrne	%i1,	0x2D3,	%g3
	mova	%icc,	%l3,	%g1
	fmovsl	%icc,	%f14,	%f26
	ldub	[%l7 + 0x79],	%g7
	movrlz	%o0,	0x382,	%l0
	add	%g5,	0x1D22,	%g4
	addccc	%o3,	0x02A8,	%l4
	edge16n	%i3,	%i2,	%i5
	movrlez	%o4,	%o6,	%i7
	fnors	%f10,	%f20,	%f13
	or	%o7,	%o5,	%g2
	movrlz	%o1,	0x249,	%l5
	orncc	%l6,	0x1EE9,	%l2
	edge32n	%i4,	%o2,	%i6
	fors	%f1,	%f29,	%f30
	mulscc	%i0,	0x0C39,	%g6
	popc	%l1,	%g3
	movcs	%icc,	%l3,	%g1
	edge16ln	%i1,	%o0,	%g7
	addccc	%l0,	%g5,	%o3
	sethi	0x0A79,	%l4
	orncc	%i3,	0x1C31,	%g4
	fsrc1s	%f27,	%f17
	fpadd32	%f8,	%f26,	%f12
	restore %i5, 0x06C8, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o6,	%o4,	%o7
	sub	%o5,	%i7,	%o1
	and	%g2,	%l6,	%l5
	sth	%l2,	[%l7 + 0x1C]
	fmovrdgz	%o2,	%f0,	%f2
	umul	%i6,	%i4,	%i0
	std	%f12,	[%l7 + 0x20]
	array16	%l1,	%g6,	%g3
	fmovsle	%icc,	%f23,	%f15
	edge32	%l3,	%g1,	%i1
	movneg	%icc,	%g7,	%l0
	fmovdneg	%xcc,	%f27,	%f16
	srax	%o0,	%o3,	%g5
	sir	0x044D
	umulcc	%i3,	%g4,	%l4
	sub	%i2,	%i5,	%o6
	fmovsvs	%icc,	%f16,	%f4
	ldsh	[%l7 + 0x5A],	%o4
	movpos	%icc,	%o5,	%o7
	fmovda	%icc,	%f22,	%f20
	fmovdvc	%icc,	%f14,	%f31
	fors	%f26,	%f30,	%f27
	movne	%icc,	%i7,	%o1
	xnorcc	%l6,	0x15FA,	%g2
	movneg	%xcc,	%l5,	%o2
	andn	%i6,	0x0234,	%l2
	alignaddr	%i4,	%i0,	%l1
	movrne	%g3,	0x197,	%g6
	xnorcc	%g1,	0x0226,	%l3
	nop
	set	0x08, %l5
	std	%f14,	[%l7 + %l5]
	fnors	%f2,	%f18,	%f14
	sub	%g7,	%l0,	%i1
	mulx	%o3,	%g5,	%i3
	fpack32	%f18,	%f24,	%f30
	movne	%xcc,	%o0,	%l4
	xor	%g4,	0x07CC,	%i2
	smul	%i5,	%o6,	%o4
	smul	%o7,	0x1C23,	%i7
	movneg	%icc,	%o1,	%l6
	edge8	%g2,	%l5,	%o5
	fsrc1s	%f10,	%f2
	fcmpgt32	%f12,	%f18,	%i6
	fmovsge	%xcc,	%f25,	%f20
	siam	0x6
	subc	%l2,	0x0C41,	%o2
	movcs	%icc,	%i4,	%l1
	movge	%icc,	%g3,	%i0
	srl	%g1,	%g6,	%g7
	popc	0x1BF6,	%l0
	lduh	[%l7 + 0x20],	%i1
	array8	%o3,	%l3,	%g5
	movle	%xcc,	%o0,	%i3
	fmovspos	%xcc,	%f29,	%f22
	movgu	%icc,	%g4,	%i2
	srlx	%i5,	%o6,	%o4
	sllx	%l4,	%o7,	%o1
	movrlz	%l6,	%i7,	%l5
	fmovrslz	%g2,	%f29,	%f11
	movl	%icc,	%o5,	%l2
	add	%o2,	0x1B4C,	%i4
	sdivx	%l1,	0x083D,	%i6
	fmovdleu	%xcc,	%f12,	%f26
	stb	%g3,	[%l7 + 0x6F]
	addc	%i0,	%g6,	%g7
	array32	%l0,	%g1,	%i1
	ldx	[%l7 + 0x30],	%o3
	fcmpne32	%f30,	%f2,	%l3
	edge8	%o0,	%i3,	%g5
	fmovdn	%icc,	%f16,	%f14
	xorcc	%i2,	0x1E6E,	%g4
	udivcc	%i5,	0x07AC,	%o6
	mulscc	%l4,	%o7,	%o1
	stw	%l6,	[%l7 + 0x34]
	movrlz	%i7,	%o4,	%g2
	udiv	%l5,	0x1EAA,	%o5
	srax	%l2,	0x05,	%o2
	ldsw	[%l7 + 0x20],	%l1
	movle	%xcc,	%i4,	%g3
	sra	%i0,	%i6,	%g6
	fpadd32	%f0,	%f20,	%f14
	fmovsvc	%xcc,	%f0,	%f5
	fmovsge	%icc,	%f2,	%f9
	edge32n	%l0,	%g1,	%i1
	orcc	%o3,	%l3,	%g7
	edge16n	%i3,	%g5,	%o0
	movleu	%xcc,	%i2,	%g4
	subc	%i5,	%l4,	%o6
	umulcc	%o1,	0x194D,	%l6
	mulx	%i7,	%o7,	%g2
	fmul8x16	%f6,	%f10,	%f26
	edge16l	%l5,	%o4,	%l2
	fmovsl	%icc,	%f27,	%f5
	fmovsne	%xcc,	%f3,	%f2
	move	%xcc,	%o5,	%l1
	or	%o2,	%g3,	%i0
	umulcc	%i4,	0x0BB3,	%i6
	movleu	%xcc,	%l0,	%g6
	fpsub32s	%f7,	%f0,	%f3
	ld	[%l7 + 0x18],	%f27
	orn	%g1,	%i1,	%l3
	fmovrdgez	%o3,	%f2,	%f26
	sub	%i3,	%g5,	%g7
	ldsb	[%l7 + 0x52],	%o0
	nop
	set	0x10, %g3
	ldd	[%l7 + %g3],	%i2
	subccc	%g4,	0x0668,	%l4
	ldsb	[%l7 + 0x5F],	%o6
	fmovsvc	%xcc,	%f9,	%f4
	xor	%i5,	0x002E,	%l6
	addccc	%o1,	0x140F,	%o7
	fnot2	%f6,	%f12
	edge32n	%g2,	%i7,	%o4
	ldsb	[%l7 + 0x2E],	%l2
	sethi	0x143A,	%o5
	edge32l	%l5,	%l1,	%g3
	movcc	%xcc,	%o2,	%i4
	ldx	[%l7 + 0x18],	%i6
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	movne	%xcc,	%g1,	%i1
	nop
	set	0x1D, %l3
	ldsb	[%l7 + %l3],	%l3
	ldd	[%l7 + 0x58],	%f6
	move	%xcc,	%o3,	%l0
	sra	%i3,	%g7,	%o0
	fpackfix	%f4,	%f26
	umul	%i2,	%g5,	%l4
	movrlez	%o6,	0x25D,	%i5
	fmovrsgez	%g4,	%f22,	%f27
	fpadd16s	%f28,	%f11,	%f28
	save %o1, 0x1745, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g2,	%f14,	%f2
	add	%o7,	%i7,	%l2
	orncc	%o4,	%o5,	%l5
	srlx	%g3,	0x0B,	%o2
	subc	%i4,	%i6,	%i0
	popc	%g6,	%g1
	edge8l	%l1,	%l3,	%i1
	fmovsgu	%icc,	%f5,	%f25
	ldsw	[%l7 + 0x34],	%o3
	mulx	%l0,	0x0FE3,	%i3
	fsrc1s	%f16,	%f11
	addccc	%g7,	%o0,	%i2
	movl	%xcc,	%l4,	%o6
	ldd	[%l7 + 0x40],	%i4
	fpsub16	%f22,	%f16,	%f14
	udivcc	%g5,	0x14BD,	%g4
	movgu	%xcc,	%l6,	%o1
	movrgz	%g2,	%o7,	%i7
	movcs	%icc,	%o4,	%o5
	movvs	%xcc,	%l5,	%l2
	edge16ln	%g3,	%i4,	%o2
	umul	%i0,	0x1A14,	%g6
	ldx	[%l7 + 0x10],	%g1
	ldsw	[%l7 + 0x7C],	%l1
	array8	%i6,	%l3,	%i1
	movre	%o3,	%i3,	%g7
	fands	%f7,	%f21,	%f23
	sra	%o0,	%i2,	%l4
	fmovdleu	%icc,	%f24,	%f13
	std	%f16,	[%l7 + 0x70]
	edge16ln	%l0,	%o6,	%g5
	fcmple16	%f18,	%f0,	%i5
	edge16	%g4,	%l6,	%g2
	fornot1s	%f18,	%f1,	%f5
	fmovsg	%icc,	%f5,	%f10
	fpsub16s	%f8,	%f19,	%f3
	movvs	%xcc,	%o7,	%i7
	smul	%o4,	%o5,	%o1
	move	%xcc,	%l5,	%l2
	fmovscc	%icc,	%f9,	%f31
	edge32n	%g3,	%o2,	%i0
	sdiv	%i4,	0x1927,	%g1
	nop
	set	0x28, %g1
	stx	%l1,	[%l7 + %g1]
	orn	%g6,	%l3,	%i6
	fpadd32	%f26,	%f14,	%f28
	sethi	0x1166,	%o3
	fcmpeq16	%f18,	%f26,	%i3
	fmovdvs	%xcc,	%f27,	%f18
	fones	%f30
	fmovscc	%xcc,	%f26,	%f0
	fabsd	%f24,	%f26
	fxnor	%f30,	%f14,	%f16
	sdivx	%i1,	0x1AA0,	%g7
	addcc	%o0,	%i2,	%l0
	movne	%icc,	%o6,	%g5
	fcmpne16	%f26,	%f2,	%i5
	fmovsl	%icc,	%f13,	%f20
	sethi	0x0B32,	%g4
	movpos	%xcc,	%l6,	%l4
	srlx	%g2,	0x1D,	%i7
	fcmpne16	%f30,	%f26,	%o4
	array8	%o7,	%o5,	%l5
	fmovrsne	%o1,	%f3,	%f7
	udivx	%g3,	0x180F,	%l2
	fpadd32	%f12,	%f24,	%f0
	add	%i0,	%o2,	%g1
	stw	%i4,	[%l7 + 0x1C]
	restore %g6, %l3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f20,	%f4
	edge16n	%o3,	%l1,	%i1
	movrlz	%g7,	%o0,	%i2
	fnot2	%f10,	%f0
	edge16n	%i3,	%l0,	%o6
	sth	%g5,	[%l7 + 0x78]
	movrgz	%i5,	%g4,	%l4
	andcc	%l6,	%i7,	%o4
	mova	%xcc,	%g2,	%o5
	fmul8x16al	%f30,	%f21,	%f26
	and	%o7,	%l5,	%o1
	movpos	%icc,	%l2,	%g3
	xorcc	%i0,	0x0A6A,	%g1
	xorcc	%o2,	0x1F3E,	%g6
	sir	0x12AA
	orncc	%i4,	0x088B,	%i6
	udiv	%l3,	0x1278,	%l1
	ldd	[%l7 + 0x20],	%f24
	andncc	%o3,	%g7,	%i1
	andn	%o0,	0x0D15,	%i2
	edge8l	%i3,	%l0,	%o6
	edge16	%i5,	%g5,	%g4
	popc	0x14DD,	%l4
	add	%l6,	0x1AA6,	%i7
	edge16ln	%o4,	%g2,	%o7
	subccc	%l5,	%o5,	%o1
	ldsb	[%l7 + 0x43],	%l2
	srax	%i0,	0x14,	%g1
	movn	%xcc,	%g3,	%g6
	fcmpeq32	%f0,	%f12,	%i4
	sir	0x087C
	sll	%i6,	0x06,	%l3
	orncc	%o2,	0x0A5D,	%l1
	fsrc1	%f2,	%f8
	fmovsleu	%icc,	%f17,	%f9
	fcmpne16	%f0,	%f28,	%g7
	nop
	set	0x7C, %l2
	ldub	[%l7 + %l2],	%i1
	ldsh	[%l7 + 0x56],	%o3
	fsrc1s	%f26,	%f6
	andncc	%o0,	%i3,	%l0
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	fsrc1s	%f19,	%f18
	stb	%g5,	[%l7 + 0x1C]
	ldsh	[%l7 + 0x14],	%g4
	movpos	%icc,	%i2,	%l4
	std	%f2,	[%l7 + 0x28]
	movl	%icc,	%i7,	%l6
	fnands	%f17,	%f26,	%f6
	srlx	%g2,	0x12,	%o4
	movcc	%icc,	%l5,	%o5
	subccc	%o7,	%l2,	%o1
	edge32	%i0,	%g1,	%g3
	movpos	%icc,	%g6,	%i4
	stb	%l3,	[%l7 + 0x15]
	alignaddr	%i6,	%l1,	%o2
	lduh	[%l7 + 0x28],	%i1
	fcmpd	%fcc0,	%f8,	%f14
	movrlez	%o3,	%o0,	%g7
	alignaddr	%i3,	%l0,	%i5
	sethi	0x190A,	%g5
	movcc	%icc,	%o6,	%g4
	ld	[%l7 + 0x3C],	%f23
	ldsb	[%l7 + 0x73],	%i2
	xor	%i7,	0x1CAF,	%l4
	movge	%xcc,	%l6,	%g2
	siam	0x2
	sth	%o4,	[%l7 + 0x42]
	movcc	%xcc,	%o5,	%o7
	fmovsgu	%xcc,	%f31,	%f11
	mulx	%l5,	0x0B41,	%o1
	movleu	%xcc,	%i0,	%g1
	fpsub32	%f16,	%f26,	%f2
	xnorcc	%l2,	%g3,	%i4
	orcc	%g6,	%i6,	%l3
	fandnot1	%f20,	%f6,	%f18
	sub	%l1,	%o2,	%o3
	movrlz	%o0,	0x23D,	%i1
	sub	%g7,	%i3,	%i5
	sub	%l0,	0x1860,	%o6
	fmovsa	%xcc,	%f1,	%f27
	fornot1	%f0,	%f2,	%f4
	movne	%icc,	%g5,	%i2
	mova	%xcc,	%i7,	%g4
	xnor	%l4,	%g2,	%o4
	ldub	[%l7 + 0x70],	%l6
	sth	%o7,	[%l7 + 0x1A]
	fmovsneg	%xcc,	%f8,	%f22
	fnands	%f12,	%f1,	%f2
	sllx	%l5,	%o1,	%o5
	xorcc	%i0,	0x0F39,	%l2
	stx	%g3,	[%l7 + 0x70]
	sdiv	%g1,	0x06B3,	%i4
	sethi	0x1D4F,	%i6
	addccc	%g6,	%l3,	%o2
	edge16	%l1,	%o0,	%i1
	fpack32	%f14,	%f16,	%f28
	save %g7, %i3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f18,	%f27
	fandnot2s	%f24,	%f13,	%f17
	movrne	%l0,	0x147,	%o6
	movle	%icc,	%g5,	%i5
	fmovrse	%i7,	%f31,	%f5
	fpsub32s	%f24,	%f22,	%f13
	fmovdle	%icc,	%f29,	%f31
	sethi	0x0BFB,	%g4
	mova	%xcc,	%i2,	%g2
	srl	%o4,	%l4,	%o7
	movcc	%xcc,	%l6,	%l5
	orncc	%o5,	%o1,	%i0
	movcs	%xcc,	%g3,	%g1
	fmovsa	%xcc,	%f17,	%f13
	lduh	[%l7 + 0x74],	%i4
	orncc	%i6,	%g6,	%l3
	movl	%icc,	%l2,	%l1
	edge8n	%o0,	%i1,	%o2
	srlx	%i3,	0x0D,	%g7
	sdiv	%o3,	0x0495,	%l0
	addcc	%g5,	0x00A0,	%i5
	movgu	%icc,	%i7,	%o6
	subc	%i2,	0x079C,	%g2
	addc	%g4,	%o4,	%o7
	edge32ln	%l6,	%l4,	%l5
	fsrc1	%f8,	%f26
	ldx	[%l7 + 0x38],	%o5
	smul	%i0,	%g3,	%g1
	stw	%o1,	[%l7 + 0x6C]
	movgu	%icc,	%i6,	%g6
	subccc	%l3,	%l2,	%i4
	movrne	%l1,	%i1,	%o2
	edge8ln	%o0,	%g7,	%o3
	movrgz	%i3,	0x239,	%g5
	fpack16	%f22,	%f29
	alignaddr	%i5,	%i7,	%o6
	udiv	%i2,	0x16EC,	%l0
	edge32n	%g4,	%g2,	%o4
	ld	[%l7 + 0x30],	%f18
	movleu	%xcc,	%l6,	%l4
	sdivcc	%l5,	0x18D5,	%o7
	movcs	%icc,	%o5,	%g3
	movvc	%xcc,	%g1,	%i0
	movre	%o1,	%g6,	%i6
	xnor	%l2,	%l3,	%l1
	mova	%icc,	%i4,	%o2
	orn	%i1,	%o0,	%g7
	smul	%i3,	%o3,	%g5
	nop
	set	0x68, %i7
	sth	%i5,	[%l7 + %i7]
	fmul8x16au	%f2,	%f19,	%f24
	srax	%o6,	%i7,	%i2
	edge8ln	%l0,	%g4,	%o4
	srlx	%g2,	0x19,	%l4
	nop
	set	0x08, %i0
	ldsw	[%l7 + %i0],	%l6
	movl	%icc,	%o7,	%o5
	fand	%f16,	%f0,	%f22
	smul	%g3,	%g1,	%i0
	fpmerge	%f15,	%f13,	%f12
	srax	%o1,	%l5,	%g6
	fpadd16s	%f6,	%f27,	%f23
	xor	%l2,	0x1046,	%l3
	save %i6, %l1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i1,	%i4
	fmuld8sux16	%f10,	%f28,	%f12
	andncc	%g7,	%i3,	%o3
	movpos	%xcc,	%g5,	%i5
	edge8	%o6,	%i7,	%i2
	udivcc	%l0,	0x05E5,	%g4
	subcc	%o0,	0x093B,	%g2
	ldx	[%l7 + 0x10],	%o4
	movg	%xcc,	%l6,	%o7
	fxnors	%f7,	%f26,	%f8
	sdivcc	%o5,	0x0346,	%g3
	fpsub16s	%f3,	%f12,	%f7
	edge8l	%l4,	%i0,	%g1
	edge16n	%l5,	%g6,	%o1
	sethi	0x0EFE,	%l3
	smulcc	%i6,	%l2,	%l1
	movcs	%xcc,	%o2,	%i4
	movl	%icc,	%g7,	%i1
	fzeros	%f4
	movrne	%o3,	%g5,	%i5
	andn	%i3,	0x1FF6,	%o6
	sir	0x1BA2
	fcmpes	%fcc2,	%f0,	%f30
	movl	%icc,	%i2,	%l0
	array8	%g4,	%o0,	%i7
	xnor	%g2,	%l6,	%o4
	stx	%o5,	[%l7 + 0x68]
	fsrc2s	%f10,	%f19
	subcc	%o7,	%l4,	%g3
	fnot2	%f16,	%f10
	movg	%xcc,	%g1,	%l5
	fmovdcs	%icc,	%f24,	%f22
	orncc	%i0,	0x104B,	%g6
	mulx	%o1,	0x00FB,	%i6
	sllx	%l3,	0x17,	%l2
	fcmpes	%fcc0,	%f16,	%f0
	sllx	%o2,	0x1B,	%i4
	fmovdl	%xcc,	%f12,	%f5
	alignaddrl	%g7,	%i1,	%l1
	sdivcc	%g5,	0x08FB,	%o3
	ldsb	[%l7 + 0x6B],	%i3
	ldd	[%l7 + 0x70],	%o6
	move	%xcc,	%i2,	%i5
	sllx	%l0,	%o0,	%g4
	movleu	%xcc,	%i7,	%g2
	mulscc	%o4,	%l6,	%o7
	fmovscc	%icc,	%f6,	%f11
	movre	%l4,	%g3,	%o5
	fcmpes	%fcc1,	%f23,	%f4
	fnegs	%f26,	%f22
	sdivx	%l5,	0x1AE7,	%g1
	andn	%g6,	0x0337,	%o1
	sir	0x0EFA
	sdivx	%i0,	0x01DA,	%l3
	movrlez	%l2,	0x3E2,	%o2
	edge16	%i6,	%g7,	%i1
	fmovdvc	%xcc,	%f22,	%f6
	sdivcc	%l1,	0x1F36,	%i4
	sethi	0x0C3C,	%o3
	addcc	%i3,	0x000A,	%g5
	add	%o6,	%i2,	%l0
	movrlez	%o0,	0x0D4,	%g4
	fmuld8sux16	%f19,	%f14,	%f30
	ldd	[%l7 + 0x70],	%f16
	fmovsleu	%icc,	%f31,	%f1
	nop
	set	0x52, %i1
	lduh	[%l7 + %i1],	%i5
	movrgez	%i7,	%o4,	%l6
	fmovscc	%icc,	%f18,	%f30
	movne	%icc,	%g2,	%l4
	ldd	[%l7 + 0x38],	%g2
	movcc	%icc,	%o5,	%o7
	edge32ln	%g1,	%l5,	%o1
	movrne	%g6,	%l3,	%l2
	smul	%o2,	%i0,	%g7
	movrlz	%i1,	0x06E,	%l1
	smulcc	%i4,	0x16DA,	%o3
	fmovrsgez	%i3,	%f13,	%f25
	edge8ln	%g5,	%i6,	%o6
	udivx	%i2,	0x0DEB,	%l0
	fxors	%f6,	%f31,	%f0
	edge8ln	%o0,	%i5,	%i7
	udiv	%o4,	0x1DAD,	%l6
	ldd	[%l7 + 0x18],	%f14
	smulcc	%g4,	0x15FF,	%l4
	ldx	[%l7 + 0x78],	%g3
	srlx	%g2,	%o7,	%g1
	edge32n	%l5,	%o5,	%o1
	movcs	%xcc,	%g6,	%l3
	alignaddrl	%l2,	%o2,	%g7
	sdivx	%i0,	0x1EC3,	%i1
	udivcc	%i4,	0x1E08,	%o3
	restore %l1, 0x1A5A, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i6,	%g5,	%i2
	mulscc	%l0,	0x1D12,	%o6
	ldub	[%l7 + 0x53],	%o0
	edge8l	%i7,	%i5,	%l6
	alignaddrl	%o4,	%l4,	%g4
	save %g2, %g3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o7,	%l5,	%o5
	movre	%o1,	%l3,	%l2
	movn	%xcc,	%g6,	%o2
	fmovdge	%xcc,	%f9,	%f4
	ldsw	[%l7 + 0x24],	%g7
	array8	%i0,	%i4,	%i1
	stx	%o3,	[%l7 + 0x68]
	sllx	%i3,	0x0A,	%l1
	movrgz	%g5,	%i6,	%i2
	sra	%o6,	0x0D,	%l0
	smulcc	%i7,	%o0,	%l6
	fcmple16	%f26,	%f30,	%o4
	movcc	%xcc,	%i5,	%g4
	orcc	%l4,	%g2,	%g1
	addc	%g3,	0x0880,	%o7
	orcc	%o5,	%l5,	%o1
	movrlez	%l3,	%g6,	%l2
	save %o2, 0x0545, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i0,	0x127C,	%i1
	xor	%i4,	%i3,	%o3
	edge16l	%g5,	%i6,	%i2
	movvc	%xcc,	%o6,	%l0
	or	%i7,	0x141B,	%o0
	xnorcc	%l6,	0x192F,	%l1
	addccc	%i5,	0x1A1E,	%g4
	subc	%l4,	%o4,	%g2
	xorcc	%g3,	%g1,	%o5
	addcc	%o7,	0x03FC,	%o1
	orncc	%l5,	0x13A4,	%g6
	addcc	%l2,	0x1A91,	%l3
	movvs	%icc,	%o2,	%g7
	alignaddrl	%i1,	%i4,	%i3
	ldsh	[%l7 + 0x42],	%o3
	smul	%g5,	%i0,	%i6
	ldub	[%l7 + 0x74],	%o6
	alignaddrl	%i2,	%i7,	%l0
	fsrc1	%f14,	%f18
	movrgz	%o0,	%l1,	%l6
	edge32l	%i5,	%g4,	%o4
	addc	%l4,	0x0FB6,	%g2
	fcmple32	%f28,	%f6,	%g3
	smul	%o5,	0x0E86,	%o7
	fandnot1s	%f18,	%f27,	%f17
	srax	%o1,	0x04,	%l5
	move	%icc,	%g6,	%l2
	umul	%g1,	%l3,	%g7
	orn	%i1,	%i4,	%i3
	srlx	%o3,	%o2,	%g5
	fmovdn	%xcc,	%f26,	%f11
	fcmpd	%fcc2,	%f8,	%f8
	lduw	[%l7 + 0x50],	%i0
	movneg	%xcc,	%i6,	%i2
	fpack32	%f18,	%f26,	%f24
	ldd	[%l7 + 0x38],	%o6
	fornot1	%f2,	%f22,	%f26
	fmovrdlz	%l0,	%f2,	%f10
	fandnot1	%f4,	%f26,	%f14
	mulx	%o0,	%l1,	%i7
	ldsb	[%l7 + 0x08],	%i5
	fmovsn	%xcc,	%f5,	%f17
	udivcc	%g4,	0x0706,	%l6
	ldd	[%l7 + 0x08],	%o4
	movre	%g2,	0x01A,	%g3
	fxors	%f27,	%f29,	%f26
	fmovsne	%xcc,	%f28,	%f1
	edge8n	%o5,	%o7,	%o1
	ld	[%l7 + 0x2C],	%f2
	edge8n	%l4,	%l5,	%g6
	fmovscc	%icc,	%f0,	%f23
	st	%f19,	[%l7 + 0x38]
	mulscc	%l2,	0x1224,	%l3
	st	%f13,	[%l7 + 0x4C]
	xorcc	%g1,	0x1555,	%i1
	fones	%f9
	edge16l	%g7,	%i4,	%i3
	std	%f16,	[%l7 + 0x70]
	subccc	%o2,	%g5,	%o3
	udivx	%i0,	0x14ED,	%i6
	mova	%icc,	%o6,	%i2
	for	%f26,	%f6,	%f16
	fmovrdne	%o0,	%f22,	%f26
	edge8l	%l1,	%l0,	%i7
	ldub	[%l7 + 0x66],	%g4
	subcc	%l6,	%o4,	%g2
	movrlz	%i5,	0x059,	%o5
	movn	%xcc,	%g3,	%o7
	array16	%l4,	%o1,	%g6
	fsrc2	%f20,	%f24
	srlx	%l2,	0x18,	%l3
	fcmped	%fcc2,	%f6,	%f2
	andcc	%l5,	%g1,	%i1
	edge32l	%i4,	%i3,	%g7
	and	%o2,	%o3,	%g5
	stw	%i0,	[%l7 + 0x20]
	lduh	[%l7 + 0x0E],	%o6
	st	%f11,	[%l7 + 0x6C]
	movgu	%icc,	%i2,	%i6
	movg	%icc,	%o0,	%l0
	movneg	%icc,	%i7,	%l1
	or	%g4,	%o4,	%g2
	fornot2	%f24,	%f24,	%f2
	ldd	[%l7 + 0x58],	%i4
	fmovrsne	%l6,	%f25,	%f30
	umul	%g3,	0x14F7,	%o7
	orncc	%o5,	0x09B4,	%o1
	movne	%icc,	%l4,	%g6
	fpack16	%f14,	%f15
	movrlez	%l3,	0x1C2,	%l5
	popc	0x05CE,	%g1
	alignaddrl	%l2,	%i4,	%i3
	fmovsl	%xcc,	%f0,	%f22
	movcc	%icc,	%i1,	%g7
	ldsh	[%l7 + 0x14],	%o2
	movcc	%xcc,	%o3,	%i0
	movle	%icc,	%g5,	%i2
	fands	%f20,	%f18,	%f26
	addcc	%o6,	0x0042,	%i6
	umulcc	%o0,	0x001B,	%i7
	sub	%l0,	%l1,	%o4
	popc	%g4,	%g2
	array16	%i5,	%l6,	%g3
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%o4
	movle	%xcc,	%o1,	%l4
	xnor	%g6,	0x0159,	%l3
	movre	%l5,	0x01A,	%o7
	ldsw	[%l7 + 0x08],	%l2
	sir	0x1AF4
	andn	%i4,	%i3,	%i1
	smulcc	%g7,	%g1,	%o3
	sub	%i0,	%g5,	%o2
	fandnot1	%f16,	%f30,	%f6
	sra	%i2,	0x16,	%i6
	andn	%o6,	%i7,	%o0
	sll	%l0,	%l1,	%o4
	srax	%g2,	0x06,	%i5
	ldx	[%l7 + 0x60],	%l6
	sir	0x1DC7
	edge8l	%g3,	%o5,	%o1
	umulcc	%g4,	0x0A00,	%l4
	umul	%l3,	0x0B99,	%g6
	fcmpne16	%f22,	%f10,	%l5
	sll	%o7,	0x10,	%l2
	lduw	[%l7 + 0x24],	%i3
	mulscc	%i4,	%g7,	%i1
	stw	%g1,	[%l7 + 0x38]
	fnot2	%f18,	%f2
	sub	%i0,	%o3,	%g5
	xorcc	%o2,	%i6,	%i2
	ldub	[%l7 + 0x26],	%o6
	smulcc	%i7,	%o0,	%l0
	ldsw	[%l7 + 0x50],	%l1
	mulscc	%o4,	0x1C35,	%g2
	movn	%xcc,	%i5,	%l6
	movpos	%icc,	%g3,	%o1
	movg	%icc,	%g4,	%l4
	udivcc	%l3,	0x09B8,	%g6
	movg	%xcc,	%o5,	%l5
	stb	%l2,	[%l7 + 0x3F]
	movvc	%icc,	%o7,	%i4
	orcc	%g7,	%i3,	%i1
	nop
	set	0x28, %l4
	ldd	[%l7 + %l4],	%g0
	umulcc	%o3,	%i0,	%o2
	umul	%g5,	%i2,	%o6
	sll	%i6,	0x09,	%i7
	fnot1	%f2,	%f12
	ld	[%l7 + 0x60],	%f29
	save %o0, 0x18F4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x40],	%o4
	siam	0x4
	add	%l0,	0x05AE,	%g2
	orn	%l6,	0x0467,	%g3
	fsrc2	%f18,	%f30
	edge8ln	%i5,	%g4,	%o1
	andcc	%l4,	%l3,	%o5
	movle	%xcc,	%g6,	%l2
	umulcc	%l5,	%o7,	%i4
	xnorcc	%i3,	0x1A1A,	%g7
	stw	%i1,	[%l7 + 0x34]
	movgu	%icc,	%o3,	%g1
	fmovdgu	%xcc,	%f20,	%f21
	fsrc2s	%f16,	%f23
	fmovdg	%icc,	%f4,	%f4
	fmovrdne	%o2,	%f14,	%f12
	movrgz	%i0,	%g5,	%o6
	movrne	%i6,	0x311,	%i2
	fornot2s	%f26,	%f10,	%f4
	movge	%xcc,	%i7,	%l1
	movne	%xcc,	%o0,	%o4
	edge16n	%g2,	%l0,	%g3
	fmovdg	%icc,	%f8,	%f24
	sdivcc	%l6,	0x17A3,	%i5
	xorcc	%o1,	0x1343,	%l4
	orncc	%g4,	%l3,	%o5
	fnors	%f30,	%f3,	%f13
	fmovdpos	%icc,	%f18,	%f3
	xnor	%g6,	%l5,	%o7
	fxor	%f12,	%f22,	%f22
	sdivx	%l2,	0x08D4,	%i4
	udivx	%g7,	0x1B7E,	%i3
	edge16n	%o3,	%i1,	%o2
	smul	%i0,	0x02D5,	%g1
	fmovrde	%o6,	%f8,	%f6
	andcc	%g5,	%i6,	%i7
	movl	%xcc,	%i2,	%l1
	fmovdleu	%xcc,	%f4,	%f14
	nop
	set	0x48, %o7
	ldd	[%l7 + %o7],	%f10
	ld	[%l7 + 0x58],	%f16
	sub	%o0,	%g2,	%o4
	srlx	%g3,	0x08,	%l0
	sdivcc	%i5,	0x1853,	%o1
	movrlz	%l4,	0x0F1,	%l6
	movg	%xcc,	%l3,	%g4
	movgu	%xcc,	%g6,	%l5
	movrlez	%o7,	0x06D,	%l2
	xnorcc	%o5,	0x102C,	%g7
	srlx	%i3,	%i4,	%o3
	fmovrdlz	%i1,	%f24,	%f6
	movrne	%i0,	0x3A9,	%g1
	addcc	%o6,	0x05CB,	%o2
	sdiv	%i6,	0x0F94,	%i7
	fmovdg	%icc,	%f14,	%f10
	edge16	%i2,	%g5,	%o0
	udivcc	%g2,	0x0395,	%l1
	fpadd32s	%f31,	%f18,	%f6
	fnand	%f10,	%f14,	%f12
	movleu	%icc,	%o4,	%l0
	fmovdpos	%xcc,	%f15,	%f29
	movleu	%icc,	%i5,	%g3
	sdiv	%o1,	0x0737,	%l4
	sdivcc	%l3,	0x162C,	%l6
	fmovdne	%xcc,	%f30,	%f26
	sllx	%g6,	0x0D,	%g4
	movne	%xcc,	%o7,	%l2
	sethi	0x07D6,	%o5
	mulx	%l5,	%g7,	%i4
	ldsw	[%l7 + 0x2C],	%o3
	sub	%i3,	0x0E3D,	%i1
	stx	%i0,	[%l7 + 0x08]
	xnorcc	%g1,	%o6,	%o2
	st	%f7,	[%l7 + 0x6C]
	addc	%i6,	0x0887,	%i2
	fpadd32s	%f31,	%f30,	%f5
	fmovrdne	%g5,	%f12,	%f30
	lduh	[%l7 + 0x5E],	%o0
	movrne	%i7,	%g2,	%l1
	subc	%l0,	0x0981,	%o4
	andcc	%i5,	0x15D0,	%g3
	movpos	%xcc,	%l4,	%o1
	fmovsne	%icc,	%f0,	%f11
	xor	%l6,	0x1554,	%g6
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	sdiv	%l2,	0x0C93,	%l3
	movne	%icc,	%o5,	%l5
	ldsh	[%l7 + 0x78],	%i4
	fzero	%f24
	fmovda	%xcc,	%f5,	%f29
	movleu	%icc,	%o3,	%i3
	edge16	%i1,	%g7,	%i0
	orn	%g1,	0x02B6,	%o2
	move	%icc,	%i6,	%i2
	movrgz	%o6,	%g5,	%i7
	array8	%g2,	%o0,	%l1
	movne	%xcc,	%o4,	%l0
	fpack16	%f24,	%f25
	movge	%xcc,	%g3,	%i5
	movrlez	%l4,	0x0AC,	%o1
	fmovdge	%xcc,	%f18,	%f5
	fpack32	%f30,	%f0,	%f6
	fxnor	%f2,	%f2,	%f28
	alignaddr	%l6,	%g4,	%o7
	sll	%l2,	%l3,	%g6
	movneg	%icc,	%o5,	%l5
	fmovrdgez	%o3,	%f28,	%f10
	fmovrdlez	%i4,	%f30,	%f28
	ldsw	[%l7 + 0x50],	%i3
	andcc	%g7,	0x1E3D,	%i1
	orcc	%g1,	0x04E4,	%o2
	ldx	[%l7 + 0x40],	%i6
	orn	%i0,	%o6,	%i2
	movgu	%xcc,	%g5,	%i7
	addccc	%g2,	%l1,	%o4
	or	%o0,	0x01AB,	%l0
	movre	%g3,	0x1BD,	%i5
	sth	%l4,	[%l7 + 0x6E]
	fmovspos	%icc,	%f31,	%f14
	movrgez	%o1,	%l6,	%g4
	and	%l2,	%o7,	%l3
	edge8	%g6,	%l5,	%o3
	add	%i4,	%o5,	%i3
	fcmpd	%fcc3,	%f24,	%f12
	sir	0x0F11
	stw	%g7,	[%l7 + 0x54]
	ld	[%l7 + 0x48],	%f5
	smul	%g1,	0x1345,	%o2
	sra	%i6,	%i1,	%o6
	mulscc	%i2,	0x0F85,	%g5
	std	%f30,	[%l7 + 0x78]
	xor	%i0,	0x19BE,	%i7
	smul	%l1,	%g2,	%o4
	edge16n	%o0,	%l0,	%g3
	edge32l	%i5,	%l4,	%l6
	movre	%g4,	%l2,	%o7
	addccc	%o1,	%g6,	%l3
	orncc	%l5,	0x015C,	%o3
	fmovse	%xcc,	%f12,	%f18
	sdivcc	%o5,	0x0603,	%i3
	ldd	[%l7 + 0x68],	%f10
	ldd	[%l7 + 0x70],	%i4
	edge8n	%g7,	%o2,	%g1
	for	%f26,	%f0,	%f30
	sllx	%i1,	0x1A,	%o6
	addccc	%i6,	%i2,	%g5
	addc	%i7,	0x181E,	%i0
	xnorcc	%l1,	%o4,	%o0
	udivcc	%l0,	0x0B7C,	%g2
	std	%f24,	[%l7 + 0x70]
	edge32ln	%g3,	%i5,	%l4
	edge32n	%l6,	%g4,	%l2
	ldsh	[%l7 + 0x0C],	%o1
	movrgz	%o7,	0x2CE,	%g6
	stb	%l5,	[%l7 + 0x25]
	movn	%xcc,	%l3,	%o5
	fxors	%f10,	%f31,	%f0
	sir	0x0BD4
	restore %o3, 0x1203, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g7,	%i3
	fsrc2s	%f18,	%f1
	subccc	%g1,	0x0AB6,	%i1
	and	%o2,	0x1A2A,	%o6
	mova	%xcc,	%i6,	%i2
	andncc	%g5,	%i7,	%l1
	orn	%i0,	%o0,	%o4
	movle	%xcc,	%l0,	%g2
	fmovsn	%icc,	%f23,	%f26
	movrgz	%i5,	0x05A,	%g3
	lduw	[%l7 + 0x50],	%l4
	movvc	%xcc,	%l6,	%g4
	movn	%xcc,	%o1,	%l2
	fmovdcs	%xcc,	%f14,	%f12
	stw	%o7,	[%l7 + 0x08]
	move	%xcc,	%g6,	%l5
	ldsh	[%l7 + 0x72],	%o5
	orncc	%l3,	%i4,	%g7
	udivcc	%i3,	0x0C71,	%o3
	edge16l	%i1,	%o2,	%g1
	ldsh	[%l7 + 0x68],	%o6
	fcmpne16	%f16,	%f24,	%i6
	orn	%i2,	0x1748,	%i7
	ldx	[%l7 + 0x70],	%g5
	std	%f4,	[%l7 + 0x58]
	addccc	%i0,	0x0F3D,	%l1
	srl	%o4,	%l0,	%g2
	subc	%o0,	%g3,	%l4
	fmovrdgez	%l6,	%f22,	%f24
	fands	%f4,	%f11,	%f18
	fmovdleu	%xcc,	%f21,	%f7
	subc	%i5,	%g4,	%o1
	fcmps	%fcc0,	%f26,	%f20
	ldub	[%l7 + 0x7A],	%o7
	udivx	%l2,	0x19F0,	%g6
	edge32	%l5,	%o5,	%l3
	movrgez	%g7,	0x2F5,	%i3
	xnorcc	%i4,	%o3,	%i1
	ldsb	[%l7 + 0x1C],	%g1
	edge32ln	%o6,	%i6,	%o2
	edge32	%i2,	%g5,	%i7
	movgu	%icc,	%l1,	%i0
	lduw	[%l7 + 0x50],	%l0
	orcc	%g2,	0x1CD1,	%o0
	array32	%o4,	%g3,	%l4
	fmul8sux16	%f22,	%f8,	%f20
	stb	%i5,	[%l7 + 0x3C]
	edge16	%l6,	%g4,	%o7
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	lduw	[%l7 + 0x70],	%l5
	sir	0x1462
	stb	%o5,	[%l7 + 0x41]
	movcs	%icc,	%l3,	%g7
	nop
	set	0x18, %o0
	ldsw	[%l7 + %o0],	%i3
	ldsh	[%l7 + 0x58],	%o3
	movne	%xcc,	%i1,	%g1
	fandnot2	%f8,	%f0,	%f14
	sub	%o6,	0x1997,	%i4
	addc	%i6,	%o2,	%g5
	addcc	%i7,	0x1BC9,	%i2
	umul	%l1,	0x1EC4,	%l0
	xorcc	%g2,	%i0,	%o4
	sllx	%g3,	%l4,	%o0
	sethi	0x0F96,	%i5
	sdivcc	%g4,	0x0A85,	%l6
	array32	%o1,	%g6,	%l2
	edge32l	%l5,	%o7,	%l3
	movrne	%g7,	%o5,	%o3
	ldub	[%l7 + 0x2F],	%i3
	ldub	[%l7 + 0x31],	%g1
	array32	%i1,	%i4,	%i6
	popc	0x0741,	%o6
	fxor	%f10,	%f8,	%f30
	edge8ln	%g5,	%o2,	%i7
	fmovrdne	%l1,	%f16,	%f26
	sll	%l0,	0x1F,	%g2
	fsrc2s	%f16,	%f13
	movcs	%icc,	%i0,	%o4
	fmovdpos	%icc,	%f17,	%f22
	movn	%xcc,	%g3,	%i2
	stx	%l4,	[%l7 + 0x10]
	umul	%o0,	%g4,	%i5
	udivx	%l6,	0x0465,	%g6
	umulcc	%o1,	0x17AD,	%l2
	movn	%icc,	%l5,	%o7
	smulcc	%g7,	%o5,	%o3
	fsrc1s	%f6,	%f0
	movcs	%xcc,	%i3,	%l3
	fornot1s	%f19,	%f26,	%f20
	subccc	%i1,	0x0DB7,	%g1
	subcc	%i6,	0x0CD3,	%i4
	fmovdne	%xcc,	%f27,	%f5
	movl	%icc,	%o6,	%o2
	movre	%g5,	0x155,	%i7
	ld	[%l7 + 0x78],	%f16
	smul	%l1,	0x07E3,	%l0
	movleu	%xcc,	%g2,	%o4
	xnorcc	%g3,	%i0,	%i2
	fcmpeq16	%f28,	%f4,	%o0
	edge8l	%g4,	%i5,	%l6
	ldsb	[%l7 + 0x59],	%g6
	fnot2	%f14,	%f28
	movleu	%xcc,	%o1,	%l4
	fpadd16	%f16,	%f4,	%f28
	movrne	%l5,	%o7,	%l2
	subccc	%g7,	0x1B75,	%o5
	fnot2s	%f24,	%f12
	movge	%icc,	%i3,	%o3
	fnors	%f28,	%f22,	%f24
	movrne	%l3,	%i1,	%i6
	and	%i4,	%o6,	%g1
	edge16n	%o2,	%i7,	%g5
	fmovscs	%icc,	%f19,	%f22
	mova	%xcc,	%l0,	%l1
	orncc	%o4,	%g3,	%g2
	srlx	%i0,	0x17,	%o0
	stx	%g4,	[%l7 + 0x68]
	movne	%xcc,	%i5,	%i2
	movg	%icc,	%g6,	%o1
	stw	%l6,	[%l7 + 0x34]
	sth	%l4,	[%l7 + 0x2A]
	fmul8ulx16	%f18,	%f24,	%f2
	movvc	%icc,	%l5,	%l2
	movgu	%xcc,	%g7,	%o7
	addccc	%o5,	0x1BED,	%i3
	movrgez	%l3,	0x1B9,	%o3
	movrlz	%i1,	0x1C6,	%i6
	movre	%o6,	0x19D,	%g1
	movrlz	%i4,	%i7,	%g5
	movcs	%icc,	%o2,	%l0
	sir	0x0D35
	save %l1, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%icc,	%f5,	%f19
	sir	0x0253
	fnor	%f22,	%f6,	%f10
	movrgz	%i0,	0x30F,	%g2
	edge8	%g4,	%o0,	%i5
	subc	%g6,	0x09A7,	%o1
	movcs	%xcc,	%i2,	%l4
	xor	%l5,	%l2,	%l6
	xor	%g7,	%o7,	%o5
	xnorcc	%i3,	%o3,	%l3
	fmovscs	%xcc,	%f9,	%f4
	movre	%i1,	0x280,	%o6
	std	%f12,	[%l7 + 0x10]
	ldsb	[%l7 + 0x48],	%g1
	popc	%i4,	%i7
	movvc	%xcc,	%g5,	%i6
	sra	%l0,	%l1,	%o2
	andncc	%g3,	%i0,	%g2
	edge16n	%o4,	%g4,	%i5
	fmul8sux16	%f14,	%f16,	%f16
	nop
	set	0x68, %g5
	sth	%g6,	[%l7 + %g5]
	movrne	%o1,	%i2,	%l4
	ldsw	[%l7 + 0x44],	%l5
	orn	%o0,	%l6,	%g7
	andn	%l2,	0x0461,	%o7
	alignaddr	%i3,	%o5,	%o3
	edge8	%l3,	%o6,	%i1
	movcc	%xcc,	%i4,	%i7
	andn	%g1,	0x1675,	%g5
	sth	%l0,	[%l7 + 0x2E]
	sllx	%i6,	%l1,	%o2
	movcc	%icc,	%g3,	%i0
	save %g2, 0x10FF, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%icc,	%f1,	%f8
	sdivcc	%o4,	0x0B93,	%g6
	ldsw	[%l7 + 0x3C],	%i5
	restore %o1, %i2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f8,	%f4,	%f30
	edge16n	%o0,	%l6,	%g7
	smulcc	%l2,	%l5,	%i3
	addcc	%o7,	0x13E8,	%o5
	movleu	%xcc,	%l3,	%o6
	fmovscs	%icc,	%f24,	%f16
	edge8	%i1,	%i4,	%i7
	movvs	%icc,	%g1,	%o3
	lduh	[%l7 + 0x76],	%l0
	std	%f8,	[%l7 + 0x18]
	array8	%i6,	%l1,	%g5
	udivx	%o2,	0x1ABB,	%g3
	subccc	%i0,	0x08E7,	%g4
	umul	%o4,	0x0CF5,	%g2
	movge	%icc,	%g6,	%o1
	xnor	%i2,	0x01C4,	%l4
	smul	%o0,	%l6,	%g7
	srlx	%l2,	0x17,	%l5
	edge32l	%i5,	%i3,	%o5
	fone	%f4
	move	%icc,	%o7,	%o6
	mulx	%l3,	%i1,	%i4
	fornot2s	%f22,	%f12,	%f6
	fandnot2s	%f3,	%f21,	%f4
	fexpand	%f30,	%f20
	addccc	%i7,	%g1,	%l0
	fxors	%f13,	%f0,	%f9
	edge8n	%o3,	%i6,	%g5
	lduw	[%l7 + 0x38],	%o2
	and	%l1,	%g3,	%g4
	udivcc	%o4,	0x15E8,	%g2
	umul	%i0,	%o1,	%g6
	sllx	%i2,	%l4,	%l6
	edge32n	%g7,	%l2,	%o0
	udivcc	%l5,	0x159D,	%i3
	fmovdne	%xcc,	%f9,	%f8
	fzero	%f28
	save %i5, 0x15E8, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o5,	0x0B22,	%l3
	sll	%i1,	0x0A,	%i4
	edge8ln	%o6,	%g1,	%l0
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	sll	%i7,	0x07,	%g5
	fmovdvc	%xcc,	%f14,	%f18
	alignaddr	%l1,	%o2,	%g4
	xor	%g3,	0x1303,	%g2
	movleu	%xcc,	%o4,	%o1
	sll	%g6,	%i2,	%l4
	umul	%l6,	0x1E85,	%i0
	movrlz	%g7,	0x3C2,	%l2
	movneg	%icc,	%l5,	%i3
	sra	%i5,	0x1E,	%o0
	andcc	%o5,	%l3,	%o7
	movrlez	%i4,	%o6,	%i1
	fmovsle	%xcc,	%f16,	%f9
	alignaddrl	%g1,	%l0,	%i6
	move	%icc,	%o3,	%g5
	edge8ln	%l1,	%i7,	%g4
	alignaddrl	%o2,	%g3,	%g2
	orcc	%o1,	%o4,	%i2
	movneg	%icc,	%l4,	%l6
	mova	%xcc,	%g6,	%i0
	udivcc	%l2,	0x16E0,	%l5
	fornot2s	%f10,	%f12,	%f19
	fcmpgt16	%f6,	%f4,	%i3
	srlx	%i5,	0x15,	%g7
	smul	%o5,	0x1412,	%o0
	movle	%icc,	%l3,	%o7
	andncc	%i4,	%i1,	%g1
	fcmpne16	%f20,	%f4,	%o6
	fnands	%f5,	%f9,	%f14
	ldsb	[%l7 + 0x41],	%l0
	fpadd32s	%f24,	%f15,	%f3
	sra	%o3,	%g5,	%l1
	edge8n	%i7,	%i6,	%g4
	fandnot1	%f8,	%f20,	%f24
	fnegd	%f26,	%f30
	nop
	set	0x18, %o4
	ldx	[%l7 + %o4],	%o2
	xnorcc	%g2,	%g3,	%o4
	smul	%o1,	%l4,	%l6
	movn	%icc,	%i2,	%g6
	save %l2, 0x193B, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f6,	%f12,	%f6
	addcc	%l5,	0x05EA,	%i5
	movcc	%xcc,	%g7,	%o5
	edge32n	%i3,	%o0,	%l3
	movcc	%icc,	%o7,	%i1
	movgu	%xcc,	%g1,	%i4
	sth	%l0,	[%l7 + 0x22]
	edge32l	%o3,	%g5,	%o6
	mova	%xcc,	%i7,	%i6
	mulx	%l1,	0x1461,	%o2
	andcc	%g2,	%g3,	%o4
	fmovscs	%xcc,	%f16,	%f23
	fsrc1	%f8,	%f6
	movrlez	%o1,	%l4,	%g4
	orcc	%l6,	0x1BDA,	%i2
	fmul8x16	%f29,	%f14,	%f26
	or	%l2,	0x086F,	%g6
	fmovdvs	%xcc,	%f20,	%f20
	lduw	[%l7 + 0x14],	%i0
	fandnot2s	%f18,	%f2,	%f18
	movneg	%xcc,	%l5,	%g7
	fmovdneg	%icc,	%f22,	%f19
	srl	%i5,	0x15,	%o5
	sllx	%o0,	%i3,	%l3
	movne	%xcc,	%i1,	%o7
	fxor	%f30,	%f22,	%f16
	udivcc	%i4,	0x0CE6,	%g1
	fpack32	%f2,	%f8,	%f18
	fmovsge	%xcc,	%f15,	%f0
	sll	%l0,	0x02,	%o3
	sllx	%o6,	0x02,	%i7
	movvs	%icc,	%i6,	%g5
	addcc	%o2,	0x067F,	%l1
	subcc	%g2,	0x0A8D,	%g3
	movvc	%icc,	%o1,	%o4
	edge32n	%g4,	%l6,	%i2
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%l2
	umulcc	%l4,	%g6,	%l5
	srlx	%i0,	0x06,	%g7
	fsrc2	%f28,	%f8
	sll	%o5,	0x04,	%o0
	fcmps	%fcc2,	%f23,	%f15
	or	%i3,	%i5,	%l3
	movcc	%icc,	%i1,	%i4
	add	%o7,	%l0,	%g1
	fnegd	%f2,	%f20
	add	%o3,	0x0305,	%i7
	fmuld8ulx16	%f1,	%f10,	%f12
	movle	%xcc,	%o6,	%i6
	stw	%g5,	[%l7 + 0x08]
	subccc	%o2,	%g2,	%g3
	ldsw	[%l7 + 0x74],	%o1
	srlx	%l1,	%o4,	%g4
	add	%l6,	0x166F,	%i2
	edge16n	%l2,	%l4,	%l5
	fmovrdne	%i0,	%f16,	%f18
	fmovsneg	%xcc,	%f3,	%f24
	edge8ln	%g7,	%g6,	%o5
	addcc	%o0,	%i3,	%l3
	ldsb	[%l7 + 0x0A],	%i5
	edge32l	%i4,	%i1,	%l0
	fcmpd	%fcc1,	%f0,	%f28
	or	%o7,	%g1,	%i7
	subccc	%o3,	%o6,	%g5
	sth	%i6,	[%l7 + 0x1C]
	nop
	set	0x7C, %l6
	ldsh	[%l7 + %l6],	%o2
	edge8	%g2,	%o1,	%g3
	fmovsa	%icc,	%f20,	%f2
	edge16ln	%o4,	%l1,	%l6
	edge16ln	%g4,	%l2,	%l4
	movrgez	%i2,	%l5,	%i0
	fmovse	%icc,	%f13,	%f11
	subcc	%g7,	%o5,	%o0
	fmul8ulx16	%f0,	%f2,	%f18
	movne	%icc,	%g6,	%l3
	andn	%i5,	%i3,	%i4
	movrne	%l0,	0x0DF,	%i1
	addc	%g1,	0x02FB,	%o7
	udivcc	%o3,	0x08F4,	%i7
	udivx	%o6,	0x1EB9,	%g5
	sdivx	%i6,	0x1282,	%g2
	srl	%o2,	0x00,	%g3
	edge32ln	%o4,	%l1,	%o1
	fmovdn	%xcc,	%f11,	%f9
	bshuffle	%f30,	%f14,	%f30
	fnot1s	%f21,	%f22
	movrgz	%l6,	%l2,	%l4
	andncc	%i2,	%l5,	%g4
	xnor	%g7,	%i0,	%o0
	xnorcc	%g6,	%l3,	%i5
	movcc	%xcc,	%o5,	%i4
	andn	%l0,	%i1,	%i3
	addc	%o7,	0x1B8E,	%o3
	array8	%i7,	%o6,	%g5
	edge32	%g1,	%i6,	%o2
	fpadd16	%f18,	%f24,	%f2
	sth	%g2,	[%l7 + 0x60]
	fmovsne	%icc,	%f15,	%f19
	alignaddr	%g3,	%l1,	%o1
	edge32	%l6,	%l2,	%o4
	add	%i2,	0x06A5,	%l4
	subcc	%l5,	0x12F4,	%g7
	fmul8x16	%f9,	%f30,	%f12
	smulcc	%i0,	0x0972,	%o0
	fcmple32	%f10,	%f22,	%g4
	stb	%l3,	[%l7 + 0x31]
	movrne	%g6,	0x3D0,	%i5
	sdiv	%o5,	0x1986,	%l0
	fpsub16	%f8,	%f18,	%f10
	movrgez	%i4,	%i3,	%i1
	movvc	%icc,	%o7,	%o3
	ldsw	[%l7 + 0x4C],	%o6
	sth	%g5,	[%l7 + 0x24]
	movre	%i7,	0x2BD,	%g1
	nop
	set	0x0F, %g7
	stb	%o2,	[%l7 + %g7]
	save %g2, 0x1156, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l1,	%o1
	andncc	%l6,	%l2,	%i6
	sllx	%o4,	%l4,	%i2
	stw	%l5,	[%l7 + 0x10]
	mulx	%g7,	0x0C04,	%o0
	fand	%f10,	%f2,	%f30
	sra	%i0,	%l3,	%g6
	movvs	%icc,	%g4,	%i5
	faligndata	%f0,	%f30,	%f30
	fmovrdgz	%o5,	%f4,	%f0
	st	%f6,	[%l7 + 0x08]
	fmovse	%xcc,	%f23,	%f12
	movrlz	%i4,	%l0,	%i1
	ldsw	[%l7 + 0x6C],	%o7
	popc	%o3,	%i3
	movgu	%icc,	%o6,	%g5
	fpadd16	%f12,	%f16,	%f16
	udiv	%g1,	0x1310,	%o2
	edge32n	%i7,	%g3,	%l1
	stx	%g2,	[%l7 + 0x18]
	fmovspos	%icc,	%f27,	%f10
	udivcc	%o1,	0x0F11,	%l6
	restore %l2, %i6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i2,	0x1C4D,	%l4
	ldd	[%l7 + 0x20],	%l4
	andncc	%o0,	%g7,	%i0
	stw	%g6,	[%l7 + 0x74]
	array32	%l3,	%i5,	%g4
	movneg	%icc,	%o5,	%l0
	std	%f26,	[%l7 + 0x60]
	edge16l	%i1,	%o7,	%i4
	xorcc	%o3,	%i3,	%o6
	edge8n	%g1,	%g5,	%o2
	movcs	%icc,	%i7,	%l1
	mulscc	%g2,	0x1FC2,	%g3
	fcmpeq32	%f10,	%f22,	%l6
	sll	%o1,	%l2,	%o4
	fors	%f9,	%f3,	%f0
	ldsw	[%l7 + 0x08],	%i6
	save %l4, 0x1CAA, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o0,	0x0F3B,	%l5
	edge32n	%i0,	%g7,	%g6
	popc	%l3,	%g4
	xor	%o5,	0x0C21,	%i5
	fsrc2s	%f16,	%f5
	add	%i1,	0x0921,	%l0
	sllx	%o7,	0x16,	%i4
	movgu	%icc,	%o3,	%o6
	movne	%icc,	%g1,	%g5
	nop
	set	0x68, %o5
	ldsb	[%l7 + %o5],	%o2
	fnegs	%f13,	%f22
	nop
	set	0x7F, %o3
	ldsb	[%l7 + %o3],	%i7
	sdivcc	%i3,	0x0835,	%g2
	ldub	[%l7 + 0x25],	%l1
	fmovsgu	%icc,	%f5,	%f10
	st	%f3,	[%l7 + 0x74]
	ldsb	[%l7 + 0x50],	%l6
	subcc	%g3,	%o1,	%o4
	addc	%l2,	0x01BA,	%l4
	fcmpes	%fcc0,	%f22,	%f13
	smulcc	%i2,	0x14A1,	%i6
	movle	%xcc,	%l5,	%o0
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	srl	%g7,	%g4,	%o5
	or	%l3,	%i5,	%i1
	edge32n	%o7,	%i4,	%l0
	orcc	%o3,	0x183D,	%g1
	udiv	%o6,	0x1C88,	%g5
	restore %i7, 0x06F8, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	%l1,	%l6
	fcmpgt16	%f20,	%f0,	%o2
	mova	%xcc,	%g3,	%o1
	xor	%l2,	%o4,	%l4
	ld	[%l7 + 0x08],	%f23
	nop
	set	0x1D, %i5
	ldub	[%l7 + %i5],	%i2
	srax	%l5,	0x17,	%o0
	ldsw	[%l7 + 0x34],	%i6
	smulcc	%i0,	0x141E,	%g7
	fandnot1	%f2,	%f10,	%f30
	ldsw	[%l7 + 0x60],	%g6
	fcmpeq32	%f20,	%f18,	%o5
	movle	%icc,	%l3,	%i5
	edge16l	%g4,	%i1,	%o7
	sir	0x1B8B
	movge	%xcc,	%l0,	%i4
	movrlz	%o3,	%o6,	%g5
	fmovspos	%icc,	%f27,	%f3
	st	%f3,	[%l7 + 0x30]
	andncc	%i7,	%i3,	%g1
	xor	%l1,	%g2,	%o2
	movl	%icc,	%l6,	%o1
	fmovsne	%icc,	%f21,	%f17
	fand	%f20,	%f0,	%f18
	fmovd	%f6,	%f16
	fmuld8sux16	%f4,	%f19,	%f26
	lduw	[%l7 + 0x2C],	%g3
	movcs	%icc,	%o4,	%l4
	edge8l	%i2,	%l5,	%l2
	fmovrse	%o0,	%f23,	%f4
	movcc	%xcc,	%i0,	%i6
	umul	%g7,	0x15BA,	%g6
	andncc	%l3,	%i5,	%o5
	addc	%i1,	%o7,	%l0
	movl	%xcc,	%i4,	%g4
	xnor	%o3,	%o6,	%g5
	udivcc	%i7,	0x19D7,	%g1
	movrlz	%l1,	0x330,	%i3
	fcmped	%fcc0,	%f22,	%f30
	smul	%o2,	0x0234,	%l6
	movgu	%icc,	%g2,	%o1
	array16	%o4,	%l4,	%g3
	sir	0x0132
	edge32n	%l5,	%l2,	%o0
	movn	%xcc,	%i2,	%i6
	umul	%g7,	%i0,	%g6
	add	%i5,	0x0401,	%o5
	fpsub16s	%f11,	%f25,	%f24
	addcc	%l3,	%i1,	%l0
	movle	%xcc,	%i4,	%g4
	fsrc1s	%f18,	%f6
	subc	%o7,	%o6,	%g5
	ldsb	[%l7 + 0x1C],	%i7
	edge32	%g1,	%l1,	%i3
	sdivx	%o3,	0x0FC9,	%l6
	subc	%g2,	0x133E,	%o1
	movne	%xcc,	%o4,	%o2
	fxors	%f31,	%f7,	%f26
	fmovsneg	%xcc,	%f25,	%f22
	fmul8x16au	%f23,	%f5,	%f0
	fpadd32	%f12,	%f6,	%f6
	pdist	%f30,	%f2,	%f6
	alignaddr	%g3,	%l4,	%l5
	movre	%l2,	0x2D4,	%o0
	fandnot1s	%f30,	%f11,	%f31
	movg	%icc,	%i2,	%g7
	fmovsa	%xcc,	%f21,	%f24
	edge16l	%i0,	%i6,	%i5
	movcc	%xcc,	%g6,	%l3
	sdiv	%i1,	0x089A,	%o5
	movrne	%i4,	%l0,	%g4
	xnor	%o7,	%o6,	%g5
	array8	%i7,	%g1,	%i3
	subccc	%o3,	0x0BEA,	%l1
	udivx	%l6,	0x16AB,	%g2
	fpack16	%f26,	%f13
	fmovdle	%icc,	%f20,	%f23
	movrne	%o1,	%o2,	%o4
	xorcc	%g3,	%l4,	%l5
	stw	%l2,	[%l7 + 0x0C]
	xorcc	%i2,	0x0B65,	%g7
	movrgz	%i0,	%o0,	%i6
	subccc	%i5,	%g6,	%l3
	stw	%o5,	[%l7 + 0x10]
	udivcc	%i1,	0x0698,	%i4
	sir	0x02DA
	array32	%l0,	%o7,	%o6
	xnor	%g4,	%i7,	%g5
	sub	%i3,	0x0A91,	%g1
	edge32	%o3,	%l6,	%g2
	sllx	%o1,	%o2,	%l1
	sub	%g3,	0x04B2,	%o4
	fpsub32s	%f4,	%f12,	%f18
	movrlez	%l4,	0x182,	%l5
	sll	%l2,	%i2,	%i0
	movne	%icc,	%g7,	%i6
	fmovrde	%i5,	%f26,	%f10
	movrgz	%o0,	0x002,	%l3
	fexpand	%f18,	%f4
	fpsub32s	%f7,	%f16,	%f20
	ldx	[%l7 + 0x58],	%o5
	ldsw	[%l7 + 0x74],	%g6
	movgu	%icc,	%i1,	%i4
	or	%o7,	0x0A54,	%o6
	lduw	[%l7 + 0x14],	%g4
	stx	%i7,	[%l7 + 0x10]
	fpackfix	%f6,	%f26
	andn	%g5,	%l0,	%g1
	lduw	[%l7 + 0x50],	%i3
	pdist	%f4,	%f18,	%f4
	xnorcc	%o3,	%l6,	%g2
	srlx	%o1,	%l1,	%o2
	ldsw	[%l7 + 0x34],	%g3
	movrgez	%l4,	%l5,	%o4
	fmovdgu	%icc,	%f26,	%f17
	sllx	%l2,	0x02,	%i0
	sra	%g7,	%i6,	%i2
	sethi	0x0B38,	%i5
	subc	%o0,	0x1976,	%l3
	fmovs	%f7,	%f20
	sub	%g6,	0x0BE4,	%o5
	xorcc	%i1,	0x1284,	%o7
	edge32l	%o6,	%i4,	%i7
	movn	%xcc,	%g5,	%g4
	bshuffle	%f20,	%f0,	%f18
	lduw	[%l7 + 0x68],	%l0
	fmuld8ulx16	%f30,	%f14,	%f18
	fmovrde	%i3,	%f20,	%f20
	fmovrse	%g1,	%f5,	%f24
	srl	%l6,	%g2,	%o3
	fand	%f10,	%f30,	%f22
	fmovdgu	%icc,	%f27,	%f28
	umulcc	%l1,	%o2,	%o1
	add	%l4,	0x07CF,	%g3
	st	%f28,	[%l7 + 0x28]
	fmovse	%xcc,	%f7,	%f29
	ldd	[%l7 + 0x28],	%o4
	fmovdcs	%icc,	%f28,	%f15
	stb	%l2,	[%l7 + 0x48]
	alignaddr	%i0,	%g7,	%i6
	subc	%l5,	0x0E1B,	%i2
	ldsh	[%l7 + 0x7A],	%i5
	orn	%l3,	%g6,	%o0
	or	%i1,	0x0E7E,	%o5
	stb	%o7,	[%l7 + 0x62]
	sub	%o6,	0x1FDD,	%i4
	subccc	%i7,	0x17EA,	%g4
	std	%f24,	[%l7 + 0x60]
	subccc	%l0,	%g5,	%g1
	smul	%l6,	0x0979,	%g2
	ldx	[%l7 + 0x38],	%o3
	alignaddrl	%i3,	%l1,	%o1
	edge8l	%l4,	%o2,	%g3
	edge16l	%l2,	%o4,	%i0
	fornot1	%f14,	%f10,	%f30
	movcs	%xcc,	%i6,	%g7
	movcs	%icc,	%i2,	%l5
	fmovdgu	%icc,	%f12,	%f15
	fand	%f8,	%f26,	%f10
	array32	%l3,	%i5,	%g6
	or	%o0,	%i1,	%o7
	fmul8sux16	%f4,	%f2,	%f6
	sllx	%o5,	0x01,	%o6
	movrlz	%i7,	0x254,	%g4
	edge16n	%l0,	%g5,	%g1
	xnorcc	%i4,	0x1A28,	%l6
	fmul8sux16	%f4,	%f28,	%f24
	movn	%icc,	%o3,	%i3
	xnor	%l1,	0x0120,	%o1
	lduh	[%l7 + 0x3E],	%l4
	orcc	%g2,	0x04DE,	%o2
	sethi	0x1A82,	%l2
	ld	[%l7 + 0x58],	%f28
	sdivcc	%o4,	0x04AD,	%g3
	subcc	%i6,	%g7,	%i0
	edge16ln	%l5,	%i2,	%i5
	nop
	set	0x62, %l0
	sth	%g6,	[%l7 + %l0]
	andncc	%l3,	%i1,	%o7
	movrne	%o0,	%o6,	%o5
	orcc	%i7,	0x0906,	%l0
	std	%f14,	[%l7 + 0x28]
	fornot1s	%f18,	%f22,	%f2
	sdivcc	%g4,	0x1329,	%g5
	movg	%xcc,	%i4,	%g1
	edge32	%o3,	%i3,	%l1
	sllx	%o1,	0x1A,	%l6
	save %g2, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f16,	[%l7 + 0x48]
	addc	%o2,	%g3,	%i6
	fmovdne	%xcc,	%f12,	%f27
	edge32l	%g7,	%o4,	%i0
	array16	%l5,	%i2,	%i5
	movpos	%icc,	%g6,	%i1
	movrgz	%l3,	0x2BE,	%o0
	movgu	%xcc,	%o6,	%o7
	xorcc	%o5,	%i7,	%l0
	subccc	%g5,	%g4,	%i4
	ldsb	[%l7 + 0x6B],	%o3
	movcs	%xcc,	%g1,	%l1
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%o1
	smulcc	%l6,	0x0398,	%g2
	movvs	%xcc,	%i3,	%l4
	stb	%o2,	[%l7 + 0x7A]
	srl	%l2,	%g3,	%i6
	subcc	%o4,	0x0F19,	%g7
	subccc	%l5,	%i0,	%i5
	and	%i2,	%g6,	%i1
	movrlz	%l3,	%o6,	%o7
	fandnot1s	%f25,	%f30,	%f12
	smul	%o5,	0x084B,	%o0
	fpack32	%f12,	%f8,	%f20
	lduh	[%l7 + 0x12],	%l0
	bshuffle	%f24,	%f4,	%f22
	movcs	%icc,	%i7,	%g4
	srl	%i4,	0x02,	%g5
	srl	%o3,	0x14,	%g1
	xor	%o1,	0x1805,	%l1
	sdiv	%l6,	0x0439,	%g2
	array32	%l4,	%o2,	%l2
	fmovdpos	%xcc,	%f20,	%f9
	fpsub32s	%f31,	%f26,	%f31
	movg	%xcc,	%g3,	%i6
	movvs	%icc,	%i3,	%o4
	add	%l5,	0x0794,	%g7
	stb	%i5,	[%l7 + 0x6A]
	subc	%i2,	0x1630,	%g6
	fmovrse	%i1,	%f4,	%f5
	fmovrdlez	%i0,	%f22,	%f2
	addccc	%l3,	%o6,	%o5
	fnot2	%f14,	%f12
	fmovdl	%xcc,	%f16,	%f30
	edge16n	%o7,	%l0,	%i7
	edge32	%g4,	%o0,	%g5
	ldsb	[%l7 + 0x4E],	%i4
	edge8ln	%g1,	%o1,	%o3
	movrne	%l1,	0x31A,	%g2
	movrlez	%l6,	0x002,	%o2
	andcc	%l4,	0x1150,	%g3
	fmovdn	%icc,	%f13,	%f18
	movneg	%icc,	%i6,	%i3
	fmovrslz	%l2,	%f8,	%f27
	fmul8x16al	%f14,	%f17,	%f2
	sethi	0x168B,	%l5
	movcs	%xcc,	%o4,	%g7
	fmul8x16al	%f28,	%f24,	%f18
	fmovrslz	%i5,	%f17,	%f21
	sth	%g6,	[%l7 + 0x52]
	udivx	%i2,	0x18D6,	%i1
	fmovrslez	%i0,	%f16,	%f29
	udiv	%o6,	0x081C,	%o5
	sub	%l3,	0x0B4E,	%l0
	movne	%xcc,	%o7,	%i7
	orn	%g4,	0x035F,	%g5
	sdivcc	%o0,	0x13AE,	%g1
	fmovdvs	%xcc,	%f1,	%f3
	stx	%o1,	[%l7 + 0x70]
	mova	%xcc,	%i4,	%l1
	or	%o3,	0x1CED,	%g2
	for	%f0,	%f18,	%f8
	fornot1	%f4,	%f0,	%f28
	ldsh	[%l7 + 0x66],	%l6
	edge8n	%o2,	%g3,	%l4
	fcmpeq32	%f8,	%f6,	%i6
	stx	%i3,	[%l7 + 0x58]
	ldub	[%l7 + 0x41],	%l5
	movrlez	%o4,	%l2,	%i5
	edge32l	%g6,	%i2,	%i1
	stw	%i0,	[%l7 + 0x78]
	xor	%o6,	%o5,	%g7
	movpos	%icc,	%l0,	%l3
	umulcc	%i7,	0x1FB8,	%o7
	udivx	%g4,	0x1938,	%g5
	mova	%icc,	%g1,	%o1
	edge16ln	%o0,	%l1,	%i4
	movrlez	%o3,	0x353,	%l6
	popc	%o2,	%g3
	umul	%l4,	%g2,	%i3
	addc	%i6,	%l5,	%o4
	fcmpes	%fcc3,	%f20,	%f19
	movg	%xcc,	%i5,	%g6
	or	%i2,	0x1117,	%l2
	fornot2	%f22,	%f24,	%f26
	st	%f28,	[%l7 + 0x34]
	edge8n	%i1,	%o6,	%i0
	fnand	%f8,	%f6,	%f4
	fmovdleu	%icc,	%f27,	%f10
	subcc	%g7,	0x01A2,	%l0
	fcmpeq16	%f12,	%f4,	%o5
	edge8ln	%l3,	%o7,	%i7
	fand	%f20,	%f12,	%f8
	movl	%xcc,	%g5,	%g1
	orn	%g4,	0x1DE7,	%o1
	array16	%l1,	%i4,	%o0
	orcc	%l6,	0x11BF,	%o2
	fnot1	%f30,	%f8
	st	%f13,	[%l7 + 0x5C]
	stx	%g3,	[%l7 + 0x20]
	xnor	%o3,	0x09B8,	%l4
	movcs	%xcc,	%g2,	%i3
	fnot2s	%f27,	%f12
	and	%i6,	%o4,	%l5
	movpos	%xcc,	%g6,	%i2
	and	%i5,	0x0D42,	%i1
	edge16n	%l2,	%o6,	%i0
	edge8n	%g7,	%l0,	%o5
	ld	[%l7 + 0x70],	%f15
	edge16	%o7,	%i7,	%l3
	movcs	%icc,	%g1,	%g5
	array16	%o1,	%l1,	%g4
	fmovdl	%icc,	%f11,	%f5
	sra	%i4,	0x15,	%l6
	umulcc	%o2,	0x0F41,	%o0
	addccc	%o3,	0x0AC0,	%l4
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	sra	%i6,	0x02,	%o4
	fmovse	%xcc,	%f21,	%f10
	array32	%l5,	%g6,	%i2
	fmovsneg	%icc,	%f16,	%f30
	fandnot1s	%f9,	%f22,	%f22
	movg	%xcc,	%i5,	%i3
	fmovrdne	%i1,	%f22,	%f8
	movrgez	%o6,	0x01B,	%l2
	ldub	[%l7 + 0x5E],	%g7
	fcmple16	%f0,	%f26,	%i0
	fandnot1	%f30,	%f4,	%f26
	mulscc	%l0,	%o5,	%o7
	edge32	%i7,	%l3,	%g5
	sdivx	%g1,	0x1A31,	%l1
	sra	%o1,	0x08,	%g4
	and	%i4,	0x0E4D,	%l6
	edge8	%o0,	%o3,	%l4
	sth	%g3,	[%l7 + 0x3C]
	array32	%g2,	%i6,	%o4
	array16	%l5,	%o2,	%g6
	subccc	%i2,	%i3,	%i5
	xnorcc	%o6,	%i1,	%l2
	fmovsg	%xcc,	%f25,	%f1
	ldd	[%l7 + 0x60],	%f8
	fmovrdgez	%i0,	%f6,	%f16
	alignaddr	%g7,	%l0,	%o7
	umulcc	%i7,	%l3,	%g5
	sra	%o5,	%g1,	%l1
	lduw	[%l7 + 0x58],	%o1
	udivcc	%i4,	0x1826,	%l6
	edge32	%g4,	%o0,	%o3
	movpos	%icc,	%g3,	%g2
	sdivx	%l4,	0x1C0F,	%i6
	mulscc	%o4,	0x1948,	%l5
	ldd	[%l7 + 0x38],	%g6
	movvc	%icc,	%o2,	%i2
	smulcc	%i3,	0x1F6E,	%o6
	xor	%i5,	0x1235,	%i1
	sll	%l2,	%g7,	%i0
	movrne	%o7,	%i7,	%l3
	fmovsvc	%icc,	%f3,	%f8
	fmovrdne	%g5,	%f26,	%f8
	edge8	%o5,	%l0,	%g1
	orn	%l1,	0x142E,	%i4
	movcs	%icc,	%o1,	%g4
	subc	%l6,	%o0,	%g3
	subcc	%o3,	%g2,	%i6
	add	%l4,	%l5,	%g6
	ldd	[%l7 + 0x68],	%f2
	movrne	%o2,	0x3E4,	%o4
	umulcc	%i3,	0x1508,	%i2
	addccc	%o6,	%i1,	%l2
	subcc	%i5,	%i0,	%g7
	movg	%xcc,	%i7,	%o7
	alignaddr	%l3,	%g5,	%o5
	array32	%l0,	%l1,	%g1
	edge8ln	%i4,	%o1,	%l6
	movrgz	%g4,	0x367,	%o0
	edge16l	%o3,	%g3,	%i6
	edge32ln	%l4,	%g2,	%g6
	move	%icc,	%o2,	%o4
	move	%xcc,	%i3,	%l5
	smulcc	%i2,	0x040C,	%i1
	addcc	%o6,	%i5,	%i0
	xor	%l2,	%i7,	%o7
	fmovdpos	%xcc,	%f18,	%f19
	orncc	%g7,	0x08BE,	%g5
	movrlez	%l3,	0x329,	%o5
	fcmple16	%f18,	%f6,	%l0
	smul	%g1,	0x12C6,	%l1
	movge	%xcc,	%o1,	%i4
	array16	%g4,	%l6,	%o0
	edge16	%o3,	%i6,	%g3
	ldd	[%l7 + 0x38],	%f30
	edge32n	%l4,	%g2,	%g6
	movle	%icc,	%o2,	%o4
	orncc	%i3,	%i2,	%l5
	fnot2s	%f27,	%f24
	addccc	%i1,	0x15A9,	%o6
	smulcc	%i5,	%i0,	%l2
	edge8ln	%i7,	%o7,	%g7
	edge16ln	%l3,	%o5,	%l0
	movrlez	%g5,	%l1,	%o1
	smul	%g1,	0x1B30,	%i4
	array8	%l6,	%o0,	%g4
	fmovsa	%icc,	%f28,	%f0
	lduh	[%l7 + 0x24],	%i6
	fmovscs	%xcc,	%f3,	%f10
	fmovrdlz	%o3,	%f28,	%f28
	edge32l	%l4,	%g2,	%g6
	mulscc	%g3,	0x1C07,	%o4
	xnorcc	%o2,	%i2,	%l5
	orcc	%i3,	%i1,	%o6
	sdivcc	%i0,	0x0C0E,	%i5
	sub	%l2,	%i7,	%o7
	movrlz	%l3,	%g7,	%o5
	addc	%l0,	%g5,	%l1
	fpsub16	%f18,	%f28,	%f20
	movgu	%icc,	%g1,	%o1
	fmovdcs	%xcc,	%f6,	%f0
	fpadd32s	%f11,	%f22,	%f30
	lduw	[%l7 + 0x34],	%i4
	stw	%o0,	[%l7 + 0x3C]
	xor	%g4,	0x1AFC,	%i6
	movg	%icc,	%l6,	%o3
	edge16	%g2,	%l4,	%g3
	ldsw	[%l7 + 0x60],	%o4
	fmovsn	%icc,	%f16,	%f7
	mulscc	%o2,	0x06B1,	%i2
	subc	%l5,	%g6,	%i3
	movrlez	%o6,	%i1,	%i0
	fmovrdlz	%i5,	%f16,	%f22
	udivx	%l2,	0x1EA0,	%i7
	movrgz	%l3,	0x2DB,	%o7
	srlx	%g7,	%o5,	%g5
	or	%l0,	%g1,	%l1
	nop
	set	0x78, %o2
	sth	%o1,	[%l7 + %o2]
	edge32n	%i4,	%o0,	%g4
	faligndata	%f28,	%f12,	%f24
	movle	%xcc,	%l6,	%i6
	edge16	%g2,	%l4,	%g3
	subcc	%o3,	%o4,	%i2
	movleu	%icc,	%l5,	%o2
	movneg	%icc,	%g6,	%o6
	for	%f12,	%f16,	%f24
	ldx	[%l7 + 0x30],	%i1
	umul	%i3,	0x0FF8,	%i0
	stx	%i5,	[%l7 + 0x20]
	lduh	[%l7 + 0x48],	%l2
	udiv	%l3,	0x18C1,	%i7
	fone	%f28
	umul	%g7,	0x1582,	%o5
	edge32n	%g5,	%l0,	%o7
	fpadd16	%f10,	%f10,	%f12
	mulx	%g1,	%l1,	%o1
	movleu	%icc,	%i4,	%o0
	movvc	%icc,	%g4,	%l6
	array8	%g2,	%i6,	%g3
	movgu	%icc,	%l4,	%o3
	move	%xcc,	%o4,	%l5
	fnot1s	%f17,	%f18
	fpackfix	%f24,	%f15
	fpmerge	%f3,	%f3,	%f12
	fmovsa	%icc,	%f22,	%f30
	lduh	[%l7 + 0x24],	%i2
	umul	%g6,	0x1333,	%o2
	fmovdvs	%icc,	%f31,	%f26
	movrne	%i1,	0x204,	%o6
	edge16l	%i3,	%i5,	%l2
	edge8l	%l3,	%i7,	%i0
	addcc	%g7,	%o5,	%l0
	fpsub32s	%f6,	%f11,	%f20
	fnegd	%f14,	%f28
	xnorcc	%o7,	0x09A6,	%g1
	lduw	[%l7 + 0x08],	%l1
	edge32n	%o1,	%g5,	%i4
	ld	[%l7 + 0x74],	%f18
	fmovrslez	%g4,	%f11,	%f31
	and	%l6,	0x03EF,	%o0
	movrne	%g2,	0x38E,	%g3
	mulscc	%l4,	%i6,	%o4
	fzero	%f26
	edge32l	%l5,	%i2,	%o3
	fnot2	%f12,	%f22
	addc	%o2,	%g6,	%o6
	stw	%i3,	[%l7 + 0x70]
	fmovrsgz	%i5,	%f20,	%f22
	edge16	%i1,	%l2,	%i7
	ldd	[%l7 + 0x30],	%l2
	ldub	[%l7 + 0x17],	%g7
	lduw	[%l7 + 0x3C],	%o5
	ldx	[%l7 + 0x30],	%i0
	xnor	%l0,	%o7,	%g1
	stx	%o1,	[%l7 + 0x60]
	array32	%g5,	%i4,	%g4
	xnorcc	%l6,	0x1D69,	%l1
	fpmerge	%f16,	%f28,	%f26
	subcc	%g2,	%o0,	%g3
	stb	%i6,	[%l7 + 0x7B]
	st	%f9,	[%l7 + 0x74]
	ldsw	[%l7 + 0x1C],	%o4
	move	%xcc,	%l5,	%l4
	andncc	%o3,	%i2,	%g6
	fxors	%f3,	%f4,	%f22
	sth	%o2,	[%l7 + 0x42]
	xorcc	%i3,	%o6,	%i1
	movrgz	%i5,	%l2,	%i7
	mova	%icc,	%l3,	%g7
	edge32l	%i0,	%l0,	%o7
	alignaddr	%g1,	%o5,	%g5
	array8	%i4,	%o1,	%g4
	edge32	%l6,	%l1,	%g2
	orn	%o0,	%i6,	%g3
	popc	0x1C57,	%l5
	edge16	%o4,	%o3,	%l4
	fnor	%f20,	%f12,	%f24
	sllx	%i2,	0x1C,	%g6
	xor	%o2,	0x1D7C,	%o6
	edge8n	%i1,	%i5,	%i3
	stw	%i7,	[%l7 + 0x1C]
	fnot1	%f12,	%f0
	movle	%icc,	%l3,	%g7
	movge	%icc,	%i0,	%l2
	movrlz	%l0,	0x3E1,	%g1
	move	%icc,	%o5,	%o7
	edge32l	%i4,	%o1,	%g5
	fcmpes	%fcc0,	%f4,	%f17
	xorcc	%l6,	0x0A66,	%g4
	movgu	%icc,	%l1,	%g2
	fmovdn	%xcc,	%f28,	%f28
	sdivx	%o0,	0x1849,	%i6
	popc	0x069B,	%l5
	fnegs	%f31,	%f3
	add	%o4,	0x1170,	%g3
	ldsb	[%l7 + 0x56],	%l4
	edge16ln	%o3,	%g6,	%i2
	ldsw	[%l7 + 0x68],	%o6
	sllx	%o2,	0x02,	%i5
	fnot2s	%f11,	%f1
	movvc	%icc,	%i1,	%i7
	movrne	%l3,	0x07A,	%i3
	or	%i0,	%l2,	%l0
	std	%f28,	[%l7 + 0x60]
	srlx	%g1,	%g7,	%o5
	stw	%o7,	[%l7 + 0x0C]
	fcmpd	%fcc3,	%f0,	%f20
	movleu	%xcc,	%i4,	%g5
	udivcc	%l6,	0x0EA5,	%g4
	fmul8ulx16	%f14,	%f10,	%f16
	restore %l1, 0x1939, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%o1,	%l5
	sdiv	%i6,	0x0A0E,	%o4
	ldsh	[%l7 + 0x40],	%g3
	fcmpeq32	%f16,	%f6,	%o3
	fmovrdgez	%g6,	%f22,	%f10
	fmovse	%icc,	%f18,	%f18
	xnor	%l4,	0x08F7,	%o6
	movneg	%xcc,	%o2,	%i2
	fmovrsgez	%i1,	%f23,	%f0
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	movleu	%xcc,	%i3,	%i0
	alignaddrl	%l2,	%l3,	%g1
	and	%l0,	%o5,	%g7
	xnorcc	%i4,	0x19A0,	%g5
	srax	%o7,	0x11,	%l6
	sll	%l1,	%g4,	%g2
	st	%f31,	[%l7 + 0x10]
	ldd	[%l7 + 0x78],	%f10
	srax	%o0,	0x1B,	%o1
	mulscc	%l5,	%o4,	%g3
	lduw	[%l7 + 0x54],	%i6
	st	%f25,	[%l7 + 0x0C]
	andncc	%g6,	%o3,	%l4
	mulscc	%o2,	%i2,	%o6
	movvc	%xcc,	%i7,	%i1
	alignaddrl	%i3,	%i0,	%i5
	smulcc	%l3,	0x011F,	%l2
	lduh	[%l7 + 0x2E],	%g1
	movge	%xcc,	%l0,	%g7
	xnorcc	%i4,	0x1041,	%g5
	sllx	%o7,	%l6,	%o5
	movle	%xcc,	%g4,	%l1
	fcmps	%fcc0,	%f2,	%f6
	fnands	%f2,	%f20,	%f19
	lduw	[%l7 + 0x20],	%o0
	fmuld8sux16	%f13,	%f21,	%f10
	edge32ln	%g2,	%o1,	%l5
	stb	%o4,	[%l7 + 0x7D]
	andcc	%g3,	0x0674,	%g6
	smulcc	%i6,	%o3,	%l4
	array32	%i2,	%o6,	%i7
	fmovde	%icc,	%f20,	%f15
	xnor	%o2,	0x1909,	%i3
	edge8ln	%i1,	%i0,	%i5
	movneg	%icc,	%l2,	%l3
	move	%icc,	%g1,	%g7
	movn	%xcc,	%i4,	%g5
	udiv	%l0,	0x0281,	%l6
	srlx	%o7,	%o5,	%g4
	movrne	%o0,	%g2,	%l1
	umul	%l5,	%o4,	%g3
	fcmpes	%fcc0,	%f25,	%f11
	fcmpeq16	%f28,	%f30,	%o1
	ldsw	[%l7 + 0x14],	%g6
	fmovrslz	%o3,	%f28,	%f29
	movle	%xcc,	%i6,	%i2
	addcc	%o6,	%i7,	%l4
	movle	%icc,	%o2,	%i1
	stb	%i3,	[%l7 + 0x67]
	xnorcc	%i5,	%l2,	%i0
	movleu	%xcc,	%l3,	%g1
	fmovsn	%icc,	%f10,	%f18
	subccc	%i4,	0x13B1,	%g7
	fabsd	%f14,	%f12
	fmovdl	%xcc,	%f12,	%f28
	fmovspos	%icc,	%f2,	%f10
	fabss	%f6,	%f19
	edge32ln	%g5,	%l6,	%l0
	fandnot2s	%f3,	%f10,	%f13
	alignaddr	%o5,	%o7,	%g4
	fmovdne	%icc,	%f18,	%f5
	srl	%g2,	0x0F,	%l1
	alignaddr	%o0,	%l5,	%g3
	move	%icc,	%o4,	%g6
	lduh	[%l7 + 0x70],	%o1
	andcc	%o3,	%i6,	%i2
	fornot1	%f26,	%f4,	%f12
	movge	%xcc,	%i7,	%o6
	array16	%o2,	%l4,	%i1
	edge32	%i3,	%l2,	%i0
	sdivx	%l3,	0x1191,	%i5
	std	%f14,	[%l7 + 0x60]
	fmovspos	%icc,	%f3,	%f4
	fmovsgu	%xcc,	%f27,	%f4
	mova	%icc,	%i4,	%g7
	udiv	%g1,	0x01F2,	%g5
	fmovrse	%l6,	%f25,	%f26
	and	%o5,	0x1B98,	%o7
	fmovrse	%l0,	%f15,	%f7
	popc	0x06E8,	%g4
	addccc	%g2,	0x0167,	%o0
	ldd	[%l7 + 0x78],	%l4
	fands	%f9,	%f31,	%f20
	mulscc	%l1,	%g3,	%o4
	movrlez	%g6,	0x1EE,	%o3
	movgu	%icc,	%o1,	%i6
	movre	%i2,	%i7,	%o2
	sth	%l4,	[%l7 + 0x3A]
	restore %o6, 0x0240, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x28],	%l2
	fmovsl	%xcc,	%f21,	%f31
	nop
	set	0x1A, %i6
	ldsh	[%l7 + %i6],	%i1
	subcc	%i0,	0x03BF,	%l3
	ldd	[%l7 + 0x10],	%i4
	ldub	[%l7 + 0x74],	%g7
	srl	%i4,	%g1,	%g5
	edge16l	%l6,	%o7,	%l0
	xor	%g4,	%g2,	%o5
	orn	%o0,	0x1010,	%l5
	edge8	%l1,	%g3,	%g6
	st	%f4,	[%l7 + 0x1C]
	stx	%o3,	[%l7 + 0x38]
	andn	%o4,	%o1,	%i2
	ldsb	[%l7 + 0x41],	%i7
	mulx	%i6,	0x077D,	%l4
	orncc	%o6,	%i3,	%l2
	movrlez	%o2,	%i1,	%i0
	movcs	%icc,	%l3,	%g7
	movle	%icc,	%i4,	%g1
	fpadd16	%f0,	%f20,	%f24
	array32	%g5,	%l6,	%o7
	fmovd	%f26,	%f6
	smulcc	%l0,	0x0DCF,	%g4
	fmul8x16au	%f7,	%f21,	%f6
	fcmpgt16	%f28,	%f22,	%i5
	fexpand	%f9,	%f2
	movrgz	%o5,	%g2,	%o0
	sra	%l1,	%l5,	%g6
	ldsh	[%l7 + 0x4E],	%g3
	fandnot1s	%f15,	%f13,	%f18
	sdivcc	%o4,	0x1460,	%o1
	ldx	[%l7 + 0x30],	%o3
	lduw	[%l7 + 0x60],	%i2
	edge16ln	%i6,	%i7,	%o6
	sra	%i3,	%l2,	%o2
	fcmple32	%f12,	%f22,	%l4
	addc	%i0,	0x1C6D,	%i1
	fors	%f10,	%f4,	%f31
	mulscc	%l3,	0x03EB,	%i4
	ldsw	[%l7 + 0x78],	%g1
	movneg	%xcc,	%g5,	%l6
	sth	%g7,	[%l7 + 0x12]
	andncc	%l0,	%g4,	%i5
	fmovrsgz	%o7,	%f27,	%f28
	sdivcc	%g2,	0x06E4,	%o5
	edge16l	%o0,	%l1,	%l5
	stb	%g6,	[%l7 + 0x6A]
	fpadd32	%f0,	%f12,	%f22
	add	%g3,	%o1,	%o4
	movpos	%icc,	%o3,	%i6
	ldsw	[%l7 + 0x50],	%i7
	fmul8x16al	%f31,	%f7,	%f12
	fmovdvs	%icc,	%f7,	%f16
	sra	%o6,	0x18,	%i3
	xor	%l2,	0x15A2,	%i2
	xor	%l4,	0x1326,	%o2
	xnorcc	%i1,	0x0578,	%i0
	movleu	%icc,	%i4,	%l3
	fmovspos	%icc,	%f23,	%f29
	srax	%g1,	0x14,	%l6
	orcc	%g5,	%l0,	%g7
	movvs	%icc,	%i5,	%o7
	ldsh	[%l7 + 0x10],	%g2
	subccc	%g4,	%o0,	%o5
	xor	%l5,	%l1,	%g3
	fandnot2	%f16,	%f16,	%f16
	fmovdn	%icc,	%f9,	%f12
	sllx	%o1,	0x1E,	%g6
	movpos	%xcc,	%o4,	%o3
	edge32n	%i7,	%o6,	%i6
	movrgez	%i3,	0x388,	%i2
	smulcc	%l4,	0x0F9B,	%l2
	sll	%i1,	0x1F,	%o2
	fands	%f24,	%f16,	%f9
	lduw	[%l7 + 0x7C],	%i0
	mova	%icc,	%l3,	%i4
	movrlez	%g1,	%l6,	%l0
	fpackfix	%f2,	%f0
	fcmple32	%f20,	%f28,	%g5
	ldub	[%l7 + 0x3F],	%i5
	fmovsle	%xcc,	%f2,	%f12
	fmovdne	%icc,	%f29,	%f19
	movrlz	%g7,	%o7,	%g4
	fmul8x16	%f8,	%f6,	%f4
	movrne	%o0,	%o5,	%g2
	addc	%l1,	%g3,	%l5
	umul	%o1,	0x197B,	%o4
	srl	%g6,	0x18,	%i7
	fornot2s	%f3,	%f8,	%f2
	movne	%icc,	%o6,	%o3
	edge8l	%i3,	%i6,	%l4
	movg	%icc,	%l2,	%i2
	sll	%o2,	%i0,	%i1
	andncc	%l3,	%g1,	%i4
	movrlez	%l0,	%g5,	%l6
	sll	%g7,	%i5,	%o7
	ld	[%l7 + 0x08],	%f16
	orcc	%g4,	%o5,	%o0
	st	%f26,	[%l7 + 0x64]
	fmovd	%f12,	%f30
	fmovrde	%l1,	%f20,	%f2
	fpsub16	%f12,	%f2,	%f28
	edge32	%g2,	%l5,	%g3
	udivcc	%o1,	0x1FCD,	%o4
	fmovsa	%icc,	%f26,	%f27
	andncc	%g6,	%i7,	%o6
	alignaddrl	%i3,	%i6,	%l4
	sll	%o3,	0x17,	%l2
	mulscc	%i2,	%o2,	%i0
	ldd	[%l7 + 0x60],	%f18
	fmovdvs	%xcc,	%f10,	%f24
	fpack32	%f4,	%f24,	%f20
	subccc	%l3,	%g1,	%i4
	alignaddr	%i1,	%l0,	%g5
	sll	%l6,	0x10,	%i5
	orcc	%g7,	0x0F41,	%o7
	fmovdpos	%xcc,	%f25,	%f28
	smulcc	%g4,	%o0,	%l1
	edge32n	%g2,	%l5,	%o5
	movrgz	%g3,	%o1,	%g6
	movg	%icc,	%i7,	%o6
	addccc	%o4,	%i3,	%i6
	sub	%o3,	0x1C6E,	%l2
	array8	%i2,	%l4,	%o2
	fand	%f16,	%f10,	%f18
	fnot2s	%f28,	%f9
	ldsh	[%l7 + 0x30],	%l3
	stw	%g1,	[%l7 + 0x08]
	movg	%xcc,	%i4,	%i0
	edge16n	%i1,	%l0,	%l6
	edge32l	%g5,	%g7,	%o7
	lduh	[%l7 + 0x70],	%i5
	orncc	%o0,	%g4,	%l1
	movcs	%xcc,	%l5,	%g2
	mulscc	%o5,	0x1773,	%g3
	edge32ln	%o1,	%g6,	%i7
	xnorcc	%o6,	%i3,	%o4
	fpadd32	%f4,	%f18,	%f0
	ldsh	[%l7 + 0x76],	%i6
	movrlz	%l2,	0x1CF,	%i2
	movl	%xcc,	%o3,	%o2
	sdiv	%l3,	0x0D4A,	%g1
	fcmpd	%fcc0,	%f22,	%f2
	sethi	0x06B0,	%i4
	ldsh	[%l7 + 0x28],	%l4
	sub	%i0,	0x0EA1,	%i1
	stw	%l0,	[%l7 + 0x70]
	movvc	%xcc,	%g5,	%g7
	mova	%icc,	%l6,	%o7
	fcmpes	%fcc0,	%f19,	%f21
	fcmple32	%f4,	%f16,	%o0
	ldd	[%l7 + 0x28],	%i4
	movcs	%xcc,	%g4,	%l1
	movg	%xcc,	%g2,	%o5
	movrgez	%g3,	%l5,	%o1
	xnor	%i7,	%g6,	%o6
	fors	%f30,	%f14,	%f21
	edge16ln	%o4,	%i3,	%i6
	ldx	[%l7 + 0x40],	%i2
	orncc	%l2,	%o2,	%o3
	fmovdneg	%icc,	%f3,	%f17
	fmovdcc	%xcc,	%f7,	%f24
	movrne	%g1,	0x1A3,	%l3
	sdivx	%i4,	0x1B5B,	%i0
	edge32	%i1,	%l0,	%l4
	save %g7, 0x107B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f20,	%f12,	%o7
	fmul8x16au	%f22,	%f2,	%f6
	xorcc	%o0,	%g5,	%g4
	ldsb	[%l7 + 0x33],	%l1
	fmovsgu	%icc,	%f21,	%f0
	alignaddr	%g2,	%o5,	%g3
	save %i5, %l5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x2C],	%g6
	movrlz	%o6,	0x0C9,	%o4
	alignaddrl	%i3,	%i6,	%i2
	fmovdgu	%icc,	%f30,	%f4
	addc	%o1,	%l2,	%o2
	xorcc	%o3,	0x1356,	%g1
	movle	%xcc,	%i4,	%l3
	edge16n	%i1,	%i0,	%l0
	array8	%g7,	%l6,	%l4
	edge32ln	%o0,	%o7,	%g5
	fpsub16	%f12,	%f30,	%f18
	ld	[%l7 + 0x1C],	%f10
	subc	%l1,	%g4,	%g2
	movpos	%icc,	%o5,	%i5
	movvs	%xcc,	%l5,	%i7
	sllx	%g6,	%o6,	%o4
	movrgz	%i3,	0x283,	%g3
	ldsh	[%l7 + 0x72],	%i6
	fxnor	%f6,	%f22,	%f26
	sdiv	%o1,	0x025C,	%i2
	mulx	%o2,	%l2,	%o3
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	ldsb	[%l7 + 0x7E],	%i0
	fmovdvs	%icc,	%f8,	%f13
	fmovsn	%xcc,	%f17,	%f0
	fmovsne	%xcc,	%f18,	%f16
	subcc	%i1,	0x1A8C,	%g7
	addc	%l6,	%l4,	%o0
	sra	%o7,	0x19,	%l0
	edge32l	%l1,	%g4,	%g2
	fmul8x16	%f12,	%f8,	%f22
	sdivx	%g5,	0x0580,	%o5
	sdiv	%i5,	0x03A3,	%l5
	edge16l	%i7,	%o6,	%o4
	edge32n	%g6,	%i3,	%i6
	smulcc	%g3,	%o1,	%i2
	fpsub16s	%f2,	%f29,	%f25
	sdivcc	%o2,	0x0190,	%l2
	edge32n	%o3,	%l3,	%i4
	movpos	%icc,	%i0,	%g1
	xor	%g7,	%l6,	%i1
	array32	%o0,	%o7,	%l0
	mulscc	%l1,	0x0670,	%l4
	movrgz	%g2,	%g4,	%o5
	xnor	%i5,	0x1CB9,	%g5
	srax	%i7,	%o6,	%o4
	movge	%xcc,	%l5,	%g6
	movrgz	%i6,	%g3,	%i3
	movl	%xcc,	%o1,	%o2
	fmovdl	%xcc,	%f7,	%f12
	fmovrdgz	%i2,	%f26,	%f30
	stw	%o3,	[%l7 + 0x3C]
	ldx	[%l7 + 0x08],	%l3
	orn	%l2,	0x1012,	%i0
	movrne	%i4,	%g7,	%g1
	edge32	%l6,	%i1,	%o7
	faligndata	%f14,	%f20,	%f22
	edge8ln	%o0,	%l1,	%l4
	sll	%g2,	0x1E,	%l0
	sethi	0x1EEB,	%o5
	movrgez	%i5,	%g5,	%g4
	fnand	%f2,	%f12,	%f12
	fmovspos	%xcc,	%f14,	%f9
	fpmerge	%f16,	%f19,	%f8
	stb	%o6,	[%l7 + 0x39]
	fnors	%f30,	%f24,	%f30
	edge32l	%i7,	%l5,	%g6
	smulcc	%i6,	%o4,	%g3
	lduh	[%l7 + 0x48],	%i3
	array32	%o2,	%i2,	%o1
	fmovrdgz	%o3,	%f8,	%f20
	sllx	%l3,	%l2,	%i0
	fpack32	%f2,	%f10,	%f24
	movpos	%xcc,	%i4,	%g1
	edge32l	%g7,	%i1,	%l6
	edge32l	%o7,	%l1,	%l4
	sllx	%g2,	%o0,	%o5
	subcc	%l0,	0x19B8,	%g5
	sdivcc	%g4,	0x010D,	%i5
	smul	%i7,	0x1F1D,	%l5
	edge32ln	%g6,	%o6,	%i6
	sth	%g3,	[%l7 + 0x2A]
	movgu	%icc,	%i3,	%o2
	subcc	%i2,	%o1,	%o4
	fmul8x16	%f4,	%f10,	%f0
	fcmpne32	%f8,	%f22,	%o3
	movrlez	%l3,	0x27D,	%i0
	fmovsn	%xcc,	%f13,	%f19
	movl	%icc,	%i4,	%g1
	xor	%g7,	%l2,	%i1
	array32	%o7,	%l6,	%l1
	udiv	%g2,	0x1CD3,	%o0
	udivx	%o5,	0x0252,	%l0
	faligndata	%f10,	%f2,	%f16
	fmovsa	%icc,	%f31,	%f6
	fmovs	%f22,	%f17
	fnot2s	%f10,	%f1
	bshuffle	%f6,	%f12,	%f20
	movrlez	%g5,	%l4,	%i5
	ldd	[%l7 + 0x40],	%g4
	edge8ln	%i7,	%g6,	%o6
	fmovsgu	%xcc,	%f30,	%f1
	umul	%l5,	%g3,	%i3
	alignaddrl	%i6,	%i2,	%o1
	fsrc1s	%f19,	%f3
	fsrc1	%f22,	%f20
	edge16n	%o4,	%o2,	%l3
	ldd	[%l7 + 0x38],	%o2
	fxors	%f18,	%f25,	%f25
	alignaddrl	%i0,	%i4,	%g7
	addc	%l2,	0x0AAC,	%g1
	lduw	[%l7 + 0x64],	%i1
	xnorcc	%l6,	0x0417,	%o7
	umulcc	%l1,	0x1EF4,	%g2
	fpsub16	%f14,	%f12,	%f14
	fcmped	%fcc1,	%f2,	%f0
	movneg	%icc,	%o5,	%l0
	movg	%icc,	%o0,	%l4
	movgu	%icc,	%g5,	%g4
	movl	%icc,	%i5,	%i7
	srax	%o6,	%l5,	%g6
	movle	%icc,	%g3,	%i6
	udivx	%i2,	0x074E,	%o1
	alignaddrl	%o4,	%o2,	%i3
	add	%l3,	0x1394,	%i0
	edge16ln	%i4,	%o3,	%l2
	ldd	[%l7 + 0x08],	%f24
	movvs	%xcc,	%g1,	%g7
	xnorcc	%l6,	0x11F7,	%i1
	sdiv	%l1,	0x00E1,	%g2
	edge32ln	%o7,	%o5,	%l0
	ldsw	[%l7 + 0x10],	%l4
	nop
	set	0x10, %i4
	std	%f26,	[%l7 + %i4]
	fmovdvs	%xcc,	%f12,	%f15
	subccc	%g5,	0x0104,	%g4
	subc	%o0,	%i5,	%i7
	stx	%o6,	[%l7 + 0x58]
	edge16	%l5,	%g3,	%g6
	st	%f24,	[%l7 + 0x14]
	movleu	%xcc,	%i6,	%o1
	movn	%xcc,	%i2,	%o4
	edge16n	%i3,	%o2,	%l3
	edge32ln	%i4,	%o3,	%l2
	smul	%i0,	%g1,	%l6
	sdivcc	%g7,	0x084F,	%i1
	edge16n	%l1,	%o7,	%o5
	st	%f15,	[%l7 + 0x60]
	umul	%g2,	0x01FA,	%l0
	alignaddr	%g5,	%g4,	%o0
	edge16l	%l4,	%i7,	%i5
	addccc	%o6,	%l5,	%g3
	sdivcc	%i6,	0x1B2A,	%o1
	movgu	%icc,	%i2,	%g6
	xnor	%i3,	%o4,	%o2
	addc	%i4,	%o3,	%l3
	fnors	%f31,	%f26,	%f28
	addcc	%l2,	0x19B0,	%g1
	fpsub32	%f2,	%f6,	%f22
	fmovrdlz	%i0,	%f14,	%f10
	fmul8x16al	%f20,	%f24,	%f22
	ldub	[%l7 + 0x26],	%g7
	subcc	%i1,	0x1902,	%l6
	fpsub32	%f12,	%f0,	%f12
	bshuffle	%f6,	%f30,	%f2
	edge16	%l1,	%o5,	%o7
	sra	%l0,	%g2,	%g5
	fabss	%f6,	%f16
	umul	%o0,	%l4,	%g4
	movcs	%xcc,	%i7,	%o6
	fmovdpos	%xcc,	%f14,	%f15
	subccc	%i5,	0x0C52,	%g3
	movcc	%xcc,	%l5,	%i6
	movrlz	%i2,	%g6,	%o1
	fmovsge	%xcc,	%f28,	%f29
	ld	[%l7 + 0x6C],	%f13
	lduw	[%l7 + 0x34],	%i3
	movleu	%xcc,	%o2,	%o4
	fornot2	%f12,	%f24,	%f28
	subc	%o3,	%l3,	%i4
	alignaddrl	%l2,	%g1,	%i0
	movrlez	%i1,	%l6,	%g7
	fornot1	%f24,	%f22,	%f4
	subcc	%o5,	0x04F2,	%o7
	addc	%l1,	%l0,	%g2
	addccc	%o0,	0x1C0B,	%g5
	smulcc	%g4,	%i7,	%o6
	fnegs	%f0,	%f29
	mulscc	%l4,	0x1EB4,	%g3
	movg	%xcc,	%i5,	%l5
	fcmps	%fcc0,	%f26,	%f28
	fcmpne32	%f0,	%f28,	%i2
	movrgez	%g6,	%o1,	%i6
	movcs	%xcc,	%i3,	%o2
	save %o3, 0x19D9, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i4,	%o4,	%l2
	fmovrdgez	%i0,	%f2,	%f22
	fmovdvc	%icc,	%f26,	%f1
	smul	%i1,	%l6,	%g1
	smulcc	%o5,	0x0EF5,	%g7
	movn	%icc,	%o7,	%l1
	sllx	%l0,	%g2,	%g5
	popc	%o0,	%i7
	smul	%o6,	0x0434,	%l4
	movrne	%g3,	%i5,	%g4
	edge16	%i2,	%g6,	%o1
	xnorcc	%i6,	0x1083,	%i3
	ldd	[%l7 + 0x40],	%l4
	stw	%o2,	[%l7 + 0x50]
	movleu	%xcc,	%o3,	%l3
	sdiv	%i4,	0x15CC,	%l2
	edge8l	%i0,	%o4,	%i1
	ldub	[%l7 + 0x7E],	%l6
	fmul8ulx16	%f30,	%f16,	%f30
	fpmerge	%f5,	%f17,	%f8
	umulcc	%o5,	0x174B,	%g1
	sdiv	%o7,	0x0211,	%l1
	movge	%xcc,	%g7,	%l0
	mova	%xcc,	%g2,	%g5
	fcmpeq16	%f6,	%f10,	%i7
	fmovsleu	%xcc,	%f27,	%f16
	edge16n	%o0,	%o6,	%l4
	ldsb	[%l7 + 0x0E],	%i5
	fmul8x16au	%f24,	%f23,	%f20
	umulcc	%g4,	0x0A26,	%g3
	fors	%f26,	%f7,	%f28
	xorcc	%i2,	%g6,	%i6
	stx	%i3,	[%l7 + 0x60]
	nop
	set	0x0B, %g4
	ldsb	[%l7 + %g4],	%o1
	nop
	set	0x0C, %g6
	ldsw	[%l7 + %g6],	%l5
	edge32l	%o2,	%l3,	%i4
	orcc	%l2,	%o3,	%i0
	fmovdleu	%icc,	%f29,	%f12
	movge	%icc,	%i1,	%l6
	movrlez	%o4,	0x349,	%o5
	fmovdl	%xcc,	%f29,	%f9
	movge	%icc,	%g1,	%l1
	subc	%o7,	0x0569,	%l0
	fpackfix	%f20,	%f16
	andcc	%g2,	0x1711,	%g7
	movn	%icc,	%g5,	%o0
	ldub	[%l7 + 0x0D],	%o6
	umul	%i7,	%i5,	%g4
	xnor	%g3,	0x010C,	%l4
	fmovdgu	%xcc,	%f23,	%f14
	orncc	%g6,	%i6,	%i3
	sub	%i2,	%l5,	%o1
	fpsub16s	%f5,	%f15,	%f2
	udivx	%o2,	0x16C8,	%i4
	array16	%l2,	%o3,	%i0
	movg	%xcc,	%i1,	%l3
	smul	%o4,	0x143D,	%o5
	or	%l6,	%g1,	%l1
	edge32n	%o7,	%g2,	%l0
	edge16l	%g7,	%o0,	%g5
	addc	%i7,	%o6,	%g4
	stb	%i5,	[%l7 + 0x7A]
	fpmerge	%f17,	%f16,	%f16
	edge16ln	%l4,	%g6,	%i6
	array32	%i3,	%i2,	%g3
	sir	0x0EE5
	andn	%l5,	%o1,	%i4
	ldsw	[%l7 + 0x5C],	%l2
	pdist	%f2,	%f18,	%f6
	fcmpgt16	%f20,	%f20,	%o2
	sdivcc	%i0,	0x0C64,	%o3
	xnorcc	%i1,	0x054D,	%l3
	add	%o4,	0x1BE0,	%l6
	fmovdn	%icc,	%f26,	%f4
	alignaddrl	%g1,	%l1,	%o5
	lduw	[%l7 + 0x70],	%g2
	movrne	%l0,	0x10C,	%g7
	save %o0, %g5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o6,	[%l7 + 0x78]
	movrgz	%o7,	0x3D4,	%i5
	orcc	%g4,	%l4,	%g6
	movpos	%icc,	%i6,	%i3
	movvs	%icc,	%g3,	%i2
	fcmpd	%fcc3,	%f2,	%f6
	fpadd16s	%f13,	%f20,	%f15
	fnegs	%f10,	%f11
	alignaddr	%o1,	%l5,	%l2
	edge8ln	%i4,	%i0,	%o2
	edge8	%o3,	%l3,	%o4
	lduw	[%l7 + 0x54],	%l6
	movre	%i1,	0x1D9,	%l1
	edge16	%o5,	%g1,	%l0
	and	%g7,	0x0BCF,	%g2
	movgu	%xcc,	%o0,	%i7
	udivx	%o6,	0x12AA,	%g5
	stb	%o7,	[%l7 + 0x6D]
	fzeros	%f21
	fmovdneg	%xcc,	%f20,	%f23
	fmovdcc	%icc,	%f0,	%f5
	edge32n	%i5,	%l4,	%g4
	sllx	%g6,	%i3,	%i6
	edge32ln	%i2,	%o1,	%l5
	sdivcc	%l2,	0x14D0,	%g3
	orcc	%i4,	0x130E,	%i0
	subcc	%o3,	0x1778,	%o2
	fzeros	%f19
	mova	%xcc,	%l3,	%o4
	fmovsg	%icc,	%f30,	%f4
	sdiv	%i1,	0x0715,	%l6
	andncc	%o5,	%l1,	%g1
	edge32ln	%g7,	%l0,	%g2
	fornot2	%f6,	%f28,	%f10
	fmovsge	%xcc,	%f25,	%f15
	movvs	%icc,	%o0,	%o6
	ldsb	[%l7 + 0x09],	%i7
	ldsh	[%l7 + 0x4E],	%g5
	fpsub32	%f0,	%f20,	%f22
	udivx	%o7,	0x0547,	%l4
	subcc	%i5,	%g6,	%i3
	orncc	%i6,	0x1409,	%g4
	mulscc	%i2,	0x021E,	%o1
	fcmped	%fcc2,	%f8,	%f12
	and	%l5,	%l2,	%g3
	fmovsl	%xcc,	%f1,	%f2
	fnot1s	%f6,	%f12
	fabsd	%f18,	%f0
	fornot2	%f16,	%f4,	%f12
	movgu	%icc,	%i4,	%o3
	fornot2	%f16,	%f0,	%f26
	sth	%o2,	[%l7 + 0x5C]
	fmovrslz	%l3,	%f23,	%f19
	srax	%o4,	0x0F,	%i1
	ldsh	[%l7 + 0x24],	%l6
	srl	%o5,	%i0,	%l1
	movrne	%g1,	0x128,	%g7
	sethi	0x1253,	%l0
	or	%o0,	0x076D,	%o6
	st	%f8,	[%l7 + 0x68]
	array32	%i7,	%g5,	%o7
	edge16ln	%g2,	%l4,	%g6
	orcc	%i3,	0x14D2,	%i6
	fmovs	%f12,	%f23
	movne	%xcc,	%g4,	%i5
	restore %o1, %l5, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%f12
	movne	%xcc,	%l2,	%i4
	ldd	[%l7 + 0x18],	%f20
	fmuld8ulx16	%f30,	%f5,	%f24
	xor	%g3,	%o3,	%o2
	fsrc1s	%f0,	%f18
	fpackfix	%f24,	%f4
	fandnot1	%f6,	%f30,	%f14
	edge8	%o4,	%i1,	%l3
	alignaddrl	%l6,	%o5,	%l1
	ldd	[%l7 + 0x78],	%f2
	subc	%g1,	%g7,	%i0
	movpos	%xcc,	%l0,	%o0
	movrgz	%o6,	0x154,	%i7
	xnor	%o7,	0x1E70,	%g5
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%g2
	mulscc	%l4,	0x08F8,	%i3
	srl	%g6,	0x0E,	%g4
	edge8l	%i5,	%i6,	%l5
	sth	%i2,	[%l7 + 0x58]
	fones	%f14
	movge	%xcc,	%l2,	%o1
	fmovrdne	%i4,	%f18,	%f18
	fandnot2	%f12,	%f24,	%f8
	movcs	%icc,	%o3,	%g3
	fcmple32	%f20,	%f26,	%o2
	subc	%o4,	0x157F,	%i1
	fsrc2s	%f21,	%f27
	ld	[%l7 + 0x48],	%f28
	udivx	%l3,	0x0B9D,	%o5
	fmuld8sux16	%f6,	%f28,	%f0
	movcc	%icc,	%l1,	%l6
	sll	%g1,	%g7,	%i0
	movne	%icc,	%o0,	%o6
	movneg	%xcc,	%l0,	%i7
	xnor	%o7,	0x14F1,	%g2
	and	%l4,	%i3,	%g6
	sllx	%g4,	0x0D,	%g5
	movl	%icc,	%i6,	%l5
	fmovsgu	%xcc,	%f2,	%f24
	movvs	%icc,	%i5,	%l2
	edge32	%o1,	%i4,	%o3
	st	%f3,	[%l7 + 0x1C]
	ldsw	[%l7 + 0x60],	%g3
	subc	%o2,	%i2,	%o4
	pdist	%f2,	%f20,	%f10
	fnot2	%f4,	%f14
	ldub	[%l7 + 0x66],	%l3
	movn	%xcc,	%o5,	%i1
	ldsh	[%l7 + 0x08],	%l6
	fxnor	%f16,	%f0,	%f20
	sdivcc	%g1,	0x0C7F,	%g7
	movvc	%xcc,	%l1,	%o0
	edge16l	%o6,	%l0,	%i0
	sllx	%i7,	0x1C,	%o7
	movrlez	%l4,	0x25B,	%g2
	st	%f4,	[%l7 + 0x1C]
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	fandnot1s	%f14,	%f29,	%f19
	save %g4, 0x0222, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x50],	%i5
	edge16	%l2,	%l5,	%i4
	fpadd16	%f10,	%f14,	%f24
	orcc	%o3,	0x158B,	%o1
	movcs	%icc,	%g3,	%o2
	sllx	%i2,	0x15,	%o4
	srax	%l3,	%o5,	%l6
	srax	%i1,	%g7,	%l1
	subc	%o0,	%o6,	%l0
	fmovrdgz	%g1,	%f14,	%f10
	fxnors	%f21,	%f16,	%f13
	move	%icc,	%i7,	%o7
	fxors	%f13,	%f28,	%f1
	stb	%l4,	[%l7 + 0x6F]
	mova	%icc,	%i0,	%g2
	movg	%xcc,	%g6,	%g5
	fpack32	%f30,	%f6,	%f30
	andcc	%g4,	%i3,	%i5
	andn	%l2,	0x14C6,	%i6
	sdivx	%l5,	0x1E62,	%o3
	smulcc	%o1,	%g3,	%i4
	ldub	[%l7 + 0x44],	%i2
	fmovdneg	%icc,	%f31,	%f16
	ldd	[%l7 + 0x18],	%o2
	sdiv	%o4,	0x0763,	%l3
	sth	%l6,	[%l7 + 0x78]
	movgu	%xcc,	%i1,	%g7
	fnot1s	%f16,	%f20
	movleu	%xcc,	%o5,	%o0
	std	%f14,	[%l7 + 0x40]
	addccc	%o6,	0x05C0,	%l1
	nop
	set	0x67, %g2
	ldub	[%l7 + %g2],	%l0
	fmovrsne	%i7,	%f15,	%f1
	stx	%o7,	[%l7 + 0x68]
	edge32ln	%g1,	%i0,	%g2
	sir	0x0E0F
	edge16	%g6,	%l4,	%g4
	srlx	%g5,	%i5,	%l2
	orcc	%i6,	0x11AA,	%i3
	sethi	0x1362,	%l5
	fandnot1s	%f0,	%f15,	%f1
	ldd	[%l7 + 0x38],	%o0
	ldsw	[%l7 + 0x48],	%o3
	ldx	[%l7 + 0x48],	%g3
	udiv	%i4,	0x1EDD,	%i2
	xorcc	%o2,	%l3,	%o4
	movcc	%xcc,	%i1,	%g7
	fnot2	%f28,	%f6
	edge8l	%o5,	%o0,	%l6
	alignaddr	%l1,	%l0,	%i7
	edge8l	%o7,	%o6,	%i0
	srax	%g1,	%g2,	%l4
	array8	%g4,	%g6,	%i5
	fnegd	%f14,	%f8
	movcs	%xcc,	%l2,	%i6
	fmovrdlez	%i3,	%f18,	%f4
	fnot1s	%f7,	%f23
	fornot1	%f28,	%f8,	%f30
	movrlz	%g5,	%o1,	%o3
	srlx	%l5,	0x19,	%i4
	andn	%i2,	0x0787,	%o2
	edge16n	%l3,	%g3,	%i1
	edge8ln	%g7,	%o5,	%o4
	fnegd	%f6,	%f10
	sir	0x1296
	fornot2	%f16,	%f8,	%f28
	orcc	%l6,	0x1F78,	%o0
	sllx	%l0,	%i7,	%o7
	fmovdcc	%icc,	%f19,	%f8
	edge32n	%o6,	%l1,	%g1
	movvs	%xcc,	%i0,	%l4
	movrlz	%g4,	%g6,	%g2
	lduh	[%l7 + 0x24],	%l2
	mova	%icc,	%i6,	%i3
	smul	%i5,	%o1,	%g5
	array16	%o3,	%i4,	%i2
	movl	%xcc,	%l5,	%l3
	array32	%o2,	%i1,	%g7
	sth	%o5,	[%l7 + 0x7A]
	movneg	%icc,	%g3,	%l6
	sir	0x18E4
	udiv	%o4,	0x0E15,	%l0
	fcmpne16	%f10,	%f28,	%i7
	fxors	%f8,	%f13,	%f6
	ldd	[%l7 + 0x30],	%f14
	umul	%o7,	0x1376,	%o0
	save %l1, 0x0F6F, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o6,	%i0,	%g4
	umulcc	%l4,	%g2,	%l2
	ldd	[%l7 + 0x70],	%g6
	sdivx	%i6,	0x0929,	%i5
	siam	0x6
	std	%f20,	[%l7 + 0x68]
	edge8	%i3,	%o1,	%o3
	srax	%g5,	%i2,	%l5
	sir	0x0EB5
	fnot2s	%f18,	%f4
	fcmpne32	%f12,	%f14,	%i4
	xorcc	%l3,	0x1494,	%i1
	subc	%o2,	0x119A,	%g7
	smul	%o5,	%l6,	%o4
	ldsb	[%l7 + 0x0F],	%g3
	andncc	%i7,	%o7,	%l0
	stx	%o0,	[%l7 + 0x20]
	smul	%g1,	%l1,	%o6
	movvs	%icc,	%g4,	%l4
	xor	%g2,	%l2,	%g6
	orncc	%i6,	%i5,	%i0
	orcc	%i3,	%o3,	%g5
	fxnors	%f7,	%f8,	%f14
	orn	%i2,	0x0172,	%l5
	mulx	%i4,	0x0217,	%o1
	sll	%i1,	%l3,	%g7
	ldsh	[%l7 + 0x26],	%o2
	mova	%xcc,	%o5,	%l6
	udivcc	%g3,	0x0376,	%i7
	fmul8x16	%f23,	%f30,	%f6
	movg	%icc,	%o7,	%o4
	array8	%o0,	%l0,	%l1
	ldx	[%l7 + 0x70],	%g1
	fmuld8ulx16	%f30,	%f11,	%f6
	smul	%g4,	%l4,	%g2
	fmovdn	%icc,	%f17,	%f11
	mulscc	%o6,	%l2,	%i6
	std	%f2,	[%l7 + 0x18]
	addc	%i5,	0x1F49,	%i0
	xnorcc	%g6,	%o3,	%i3
	movrgz	%i2,	0x027,	%l5
	edge32n	%g5,	%o1,	%i4
	subccc	%l3,	%g7,	%o2
	movre	%o5,	0x28D,	%i1
	edge16ln	%l6,	%g3,	%i7
	edge32ln	%o4,	%o7,	%o0
	andn	%l1,	%g1,	%g4
	sub	%l0,	%g2,	%l4
	orncc	%l2,	%o6,	%i5
	siam	0x7
	udivx	%i0,	0x0F73,	%g6
	fmovdcs	%icc,	%f17,	%f11
	popc	0x02C2,	%o3
	fnegd	%f26,	%f28
	movne	%xcc,	%i3,	%i6
	srl	%l5,	%g5,	%o1
	fxnors	%f4,	%f21,	%f22
	addcc	%i2,	%l3,	%i4
	andncc	%g7,	%o2,	%o5
	movneg	%icc,	%l6,	%i1
	mulscc	%g3,	%i7,	%o7
	fmovscs	%icc,	%f15,	%f12
	movcs	%icc,	%o4,	%o0
	xnor	%g1,	0x0B86,	%g4
	movrne	%l0,	0x3D3,	%l1
	fpadd16s	%f23,	%f22,	%f17
	addc	%l4,	0x11F6,	%l2
	xorcc	%o6,	%g2,	%i0
	ldsb	[%l7 + 0x40],	%i5
	lduh	[%l7 + 0x6C],	%g6
	for	%f28,	%f20,	%f8
	movne	%xcc,	%o3,	%i3
	stb	%i6,	[%l7 + 0x1A]
	sdiv	%l5,	0x1922,	%g5
	movcs	%icc,	%i2,	%o1
	movgu	%icc,	%l3,	%g7
	fcmpes	%fcc1,	%f4,	%f4
	movneg	%icc,	%i4,	%o5
	fmul8x16al	%f22,	%f28,	%f30
	movcc	%icc,	%l6,	%i1
	subc	%g3,	%o2,	%i7
	movne	%xcc,	%o4,	%o7
	fpack16	%f20,	%f27
	fmuld8sux16	%f31,	%f11,	%f0
	xor	%o0,	0x0AF6,	%g1
	movgu	%xcc,	%l0,	%g4
	xnor	%l4,	0x0311,	%l2
	movrne	%o6,	0x1C5,	%l1
	edge32	%g2,	%i5,	%g6
	movre	%o3,	%i0,	%i6
	edge8ln	%l5,	%i3,	%g5
	edge32ln	%o1,	%l3,	%i2
	fmovrslez	%i4,	%f21,	%f13
	fmovsl	%icc,	%f26,	%f30
	fmovspos	%icc,	%f13,	%f26
	sdivx	%g7,	0x1863,	%l6
	movrne	%i1,	0x18E,	%o5
	fmul8sux16	%f14,	%f14,	%f6
	srax	%g3,	%o2,	%o4
	andncc	%o7,	%o0,	%i7
	udiv	%g1,	0x14BE,	%g4
	orcc	%l0,	0x0603,	%l2
	udiv	%l4,	0x08BD,	%l1
	ldd	[%l7 + 0x20],	%f28
	mulx	%o6,	0x086B,	%g2
	stx	%g6,	[%l7 + 0x70]
	fcmped	%fcc1,	%f8,	%f6
	edge16ln	%o3,	%i0,	%i5
	movneg	%xcc,	%i6,	%l5
	edge8ln	%i3,	%o1,	%g5
	subccc	%l3,	%i4,	%i2
	fmovdcc	%icc,	%f28,	%f23
	umulcc	%l6,	0x0420,	%i1
	fmovrsgz	%o5,	%f2,	%f19
	movvs	%xcc,	%g7,	%o2
	ldsw	[%l7 + 0x74],	%o4
	edge32n	%g3,	%o0,	%o7
	ldd	[%l7 + 0x28],	%f4
	ldd	[%l7 + 0x18],	%i6
	fsrc2	%f24,	%f14
	fmovdneg	%icc,	%f9,	%f18
	faligndata	%f18,	%f10,	%f24
	movpos	%icc,	%g4,	%l0
	fmovdpos	%xcc,	%f24,	%f12
	movrlz	%l2,	%g1,	%l1
	stb	%o6,	[%l7 + 0x09]
	udivx	%l4,	0x1763,	%g2
	movle	%icc,	%o3,	%i0
	movvc	%icc,	%i5,	%g6
	ldsb	[%l7 + 0x46],	%l5
	stw	%i6,	[%l7 + 0x54]
	stb	%i3,	[%l7 + 0x63]
	sllx	%g5,	0x03,	%l3
	fmovrsne	%i4,	%f14,	%f13
	sub	%i2,	0x14F6,	%l6
	movle	%icc,	%i1,	%o5
	array8	%g7,	%o2,	%o1
	fmuld8ulx16	%f28,	%f9,	%f20
	stw	%o4,	[%l7 + 0x6C]
	addccc	%g3,	%o0,	%i7
	edge32l	%o7,	%l0,	%g4
	for	%f14,	%f8,	%f6
	movrlez	%g1,	0x164,	%l1
	udivx	%l2,	0x08FA,	%o6
	movl	%icc,	%l4,	%o3
	fmovdvs	%xcc,	%f21,	%f12
	array16	%g2,	%i5,	%g6
	fpadd32	%f4,	%f20,	%f8
	edge8ln	%i0,	%l5,	%i3
	fabss	%f18,	%f20
	movge	%icc,	%g5,	%l3
	movcc	%icc,	%i4,	%i6
	ldsw	[%l7 + 0x5C],	%l6
	save %i1, 0x0A77, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%i2,	0x1511,	%g7
	mova	%icc,	%o1,	%o2
	fmovdvc	%xcc,	%f25,	%f15
	sdiv	%o4,	0x0B3A,	%o0
	movrlez	%g3,	%i7,	%o7
	movge	%xcc,	%g4,	%l0
	alignaddr	%l1,	%l2,	%g1
	and	%o6,	%l4,	%o3
	srax	%i5,	%g2,	%i0
	sethi	0x1098,	%l5
	fcmps	%fcc2,	%f31,	%f23
	sll	%i3,	0x14,	%g6
	movcs	%icc,	%l3,	%g5
	lduw	[%l7 + 0x24],	%i4
	popc	0x1CF1,	%l6
	edge8l	%i1,	%o5,	%i2
	ldd	[%l7 + 0x38],	%i6
	stb	%g7,	[%l7 + 0x38]
	srl	%o2,	%o4,	%o0
	andcc	%g3,	%i7,	%o1
	ldx	[%l7 + 0x38],	%g4
	save %l0, %o7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%g1,	%l1,	%o6
	mulx	%l4,	%o3,	%g2
	lduw	[%l7 + 0x54],	%i5
	edge32n	%l5,	%i0,	%i3
	subcc	%l3,	0x0D00,	%g6
	ldx	[%l7 + 0x70],	%g5
	andcc	%i4,	0x1986,	%i1
	stb	%o5,	[%l7 + 0x1B]
	lduw	[%l7 + 0x30],	%l6
	array32	%i6,	%g7,	%o2
	smul	%o4,	%o0,	%i2
	stw	%g3,	[%l7 + 0x1C]
	fmovrslz	%i7,	%f13,	%f4
	smulcc	%o1,	%l0,	%g4
	or	%l2,	%o7,	%g1
	xor	%l1,	%o6,	%l4
	movg	%xcc,	%g2,	%o3
	sub	%l5,	%i0,	%i5
	sth	%i3,	[%l7 + 0x6A]
	add	%g6,	0x18BF,	%g5
	popc	%i4,	%l3
	alignaddrl	%i1,	%l6,	%i6
	udivcc	%o5,	0x1952,	%g7
	sdivcc	%o4,	0x1CD5,	%o2
	edge32n	%i2,	%g3,	%o0
	popc	0x0237,	%o1
	fandnot2	%f26,	%f10,	%f10
	edge8	%l0,	%g4,	%l2
	udivcc	%i7,	0x1170,	%o7
	xor	%g1,	0x0805,	%l1
	or	%l4,	0x15EF,	%o6
	andncc	%g2,	%l5,	%i0
	movvs	%icc,	%i5,	%i3
	and	%g6,	%g5,	%o3
	ldx	[%l7 + 0x38],	%i4
	mulx	%l3,	0x0261,	%l6
	subccc	%i6,	%i1,	%g7
	lduw	[%l7 + 0x44],	%o5
	fmovsg	%icc,	%f6,	%f21
	sdivcc	%o4,	0x0FBD,	%i2
	movrgz	%g3,	0x106,	%o2
	stw	%o0,	[%l7 + 0x7C]
	movle	%icc,	%o1,	%l0
	orncc	%l2,	0x19BD,	%i7
	ldd	[%l7 + 0x30],	%f22
	movpos	%icc,	%o7,	%g4
	fnot1s	%f28,	%f30
	movge	%icc,	%g1,	%l4
	edge32n	%o6,	%l1,	%g2
	alignaddrl	%l5,	%i0,	%i5
	fmovdpos	%xcc,	%f24,	%f18
	udiv	%g6,	0x1294,	%g5
	movre	%o3,	0x099,	%i4
	movrgz	%i3,	0x0DF,	%l3
	ldd	[%l7 + 0x18],	%i6
	srlx	%i6,	%i1,	%g7
	subcc	%o4,	%i2,	%o5
	umulcc	%g3,	%o2,	%o1
	sdiv	%o0,	0x068F,	%l2
	fmovrsgez	%l0,	%f7,	%f21
	addc	%i7,	%g4,	%g1
	std	%f2,	[%l7 + 0x60]
	fsrc1	%f4,	%f22
	mulscc	%l4,	%o6,	%o7
	addccc	%l1,	0x17C5,	%g2
	fmovrdlez	%i0,	%f8,	%f12
	ldsw	[%l7 + 0x20],	%l5
	ldsw	[%l7 + 0x30],	%i5
	movrlz	%g6,	0x14D,	%o3
	xnorcc	%g5,	0x128A,	%i3
	fornot1s	%f19,	%f16,	%f0
	fmovrde	%i4,	%f30,	%f22
	movne	%icc,	%l3,	%i6
	edge16l	%i1,	%l6,	%g7
	fones	%f10
	subcc	%o4,	%i2,	%o5
	movne	%icc,	%o2,	%o1
	subcc	%g3,	0x0A6B,	%l2
	restore %o0, 0x1675, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%g4,	%g1,	%l4
	movvs	%xcc,	%o6,	%o7
	subcc	%l1,	%g2,	%i0
	movvc	%icc,	%l5,	%i5
	movcs	%icc,	%g6,	%o3
	add	%i7,	%g5,	%i4
	movrlez	%i3,	%i6,	%i1
	nop
	set	0x60, %i3
	std	%f14,	[%l7 + %i3]
	udiv	%l3,	0x0788,	%l6
	edge32ln	%o4,	%g7,	%o5
	edge8	%i2,	%o2,	%g3
	addc	%o1,	%l2,	%l0
	umulcc	%g4,	0x1F22,	%o0
	subc	%l4,	%o6,	%g1
	popc	0x07B2,	%o7
	movl	%icc,	%g2,	%i0
	fexpand	%f9,	%f12
	smul	%l5,	%i5,	%g6
	udivcc	%o3,	0x0CE5,	%i7
	srax	%l1,	0x1B,	%g5
	movrlez	%i4,	%i6,	%i1
	movpos	%icc,	%l3,	%l6
	st	%f13,	[%l7 + 0x74]
	array16	%i3,	%o4,	%g7
	array8	%i2,	%o5,	%g3
	xor	%o2,	0x035E,	%l2
	udiv	%l0,	0x1210,	%g4
	movpos	%icc,	%o0,	%l4
	srlx	%o6,	0x03,	%o1
	ld	[%l7 + 0x6C],	%f17
	fmovdvc	%xcc,	%f4,	%f22
	movg	%icc,	%g1,	%g2
	alignaddr	%o7,	%i0,	%i5
	edge8l	%g6,	%o3,	%l5
	subccc	%l1,	%g5,	%i4
	movle	%xcc,	%i7,	%i6
	movrgez	%l3,	0x188,	%l6
	edge8n	%i1,	%i3,	%g7
	movrgz	%o4,	0x1B3,	%i2
	array32	%o5,	%g3,	%o2
	move	%icc,	%l0,	%g4
	popc	%o0,	%l2
	alignaddrl	%l4,	%o1,	%o6
	std	%f18,	[%l7 + 0x20]
	addccc	%g1,	0x1B8B,	%o7
	popc	%g2,	%i0
	andcc	%i5,	%o3,	%l5
	sra	%g6,	%g5,	%l1
	fxnor	%f28,	%f28,	%f0
	movge	%xcc,	%i7,	%i4
	movvc	%icc,	%l3,	%l6
	subccc	%i6,	%i3,	%g7
	ldx	[%l7 + 0x28],	%i1
	faligndata	%f24,	%f30,	%f6
	srl	%o4,	%o5,	%g3
	movrlz	%i2,	%l0,	%o2
	sub	%g4,	%o0,	%l4
	movne	%icc,	%l2,	%o6
	lduw	[%l7 + 0x24],	%o1
	ldd	[%l7 + 0x40],	%o6
	nop
	set	0x6E, %g3
	sth	%g2,	[%l7 + %g3]
	fzeros	%f11
	fornot1	%f30,	%f26,	%f12
	orcc	%i0,	0x0D28,	%g1
	nop
	set	0x38, %l3
	ldd	[%l7 + %l3],	%f18
	movrgz	%i5,	%l5,	%g6
	ldsw	[%l7 + 0x7C],	%o3
	ldsh	[%l7 + 0x6C],	%l1
	srax	%i7,	%g5,	%i4
	popc	0x00DD,	%l3
	edge8l	%l6,	%i3,	%i6
	edge32	%i1,	%o4,	%g7
	movne	%xcc,	%g3,	%i2
	xnorcc	%o5,	0x0765,	%o2
	movvc	%icc,	%l0,	%o0
	and	%g4,	%l2,	%l4
	fmovdge	%icc,	%f25,	%f14
	udiv	%o6,	0x086A,	%o7
	xorcc	%o1,	%i0,	%g2
	fsrc2s	%f5,	%f28
	nop
	set	0x56, %g1
	ldsh	[%l7 + %g1],	%g1
	umulcc	%i5,	0x1FC9,	%g6
	ldsh	[%l7 + 0x78],	%l5
	fmovdneg	%icc,	%f13,	%f16
	sll	%l1,	%i7,	%o3
	udivx	%g5,	0x0E2C,	%l3
	ldd	[%l7 + 0x60],	%f14
	sdivcc	%l6,	0x1AE0,	%i4
	addc	%i3,	0x1109,	%i6
	movgu	%xcc,	%i1,	%o4
	xorcc	%g7,	0x11EE,	%i2
	addccc	%g3,	0x03D3,	%o2
	ld	[%l7 + 0x38],	%f14
	andcc	%l0,	%o0,	%o5
	orcc	%l2,	0x077B,	%g4
	stw	%o6,	[%l7 + 0x74]
	sllx	%l4,	%o7,	%i0
	smulcc	%o1,	0x0F51,	%g1
	xorcc	%g2,	0x06E7,	%g6
	movrgez	%l5,	%l1,	%i7
	array32	%i5,	%g5,	%l3
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	fnegs	%f9,	%f4
	edge32l	%l6,	%i3,	%i6
	fmovdvs	%icc,	%f10,	%f18
	sll	%i1,	%o4,	%i2
	st	%f17,	[%l7 + 0x3C]
	stb	%g7,	[%l7 + 0x24]
	edge8l	%o2,	%g3,	%l0
	edge8n	%o0,	%o5,	%g4
	xnor	%o6,	0x113C,	%l4
	orcc	%o7,	%i0,	%l2
	movneg	%icc,	%g1,	%o1
	udivcc	%g2,	0x1DBC,	%g6
	movre	%l5,	%l1,	%i7
	bshuffle	%f2,	%f10,	%f12
	addcc	%g5,	%i5,	%l3
	srax	%o3,	%i4,	%i3
	popc	%i6,	%l6
	fnegd	%f16,	%f18
	fpackfix	%f16,	%f27
	sra	%o4,	0x1F,	%i1
	sub	%i2,	%o2,	%g3
	orcc	%l0,	0x1B01,	%g7
	movrgez	%o0,	0x047,	%o5
	fones	%f5
	stx	%o6,	[%l7 + 0x18]
	and	%g4,	%o7,	%l4
	movcc	%xcc,	%i0,	%l2
	array8	%o1,	%g2,	%g1
	fmovsg	%xcc,	%f22,	%f22
	std	%f26,	[%l7 + 0x30]
	save %g6, 0x14A3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i7,	0x016A,	%l5
	orcc	%i5,	%g5,	%l3
	for	%f22,	%f20,	%f6
	udiv	%i4,	0x068D,	%i3
	movcc	%xcc,	%o3,	%l6
	sll	%i6,	%i1,	%o4
	smul	%o2,	0x189F,	%i2
	sub	%l0,	%g3,	%g7
	ld	[%l7 + 0x58],	%f1
	alignaddr	%o5,	%o0,	%o6
	array8	%g4,	%l4,	%i0
	fcmps	%fcc0,	%f15,	%f18
	fmovdcc	%xcc,	%f28,	%f7
	lduh	[%l7 + 0x3E],	%l2
	movge	%icc,	%o7,	%o1
	mulscc	%g2,	%g1,	%g6
	udivcc	%i7,	0x10D6,	%l5
	ldsh	[%l7 + 0x44],	%i5
	movcc	%icc,	%g5,	%l1
	smul	%l3,	%i4,	%o3
	st	%f29,	[%l7 + 0x20]
	movpos	%xcc,	%i3,	%i6
	fcmple32	%f30,	%f22,	%i1
	move	%icc,	%o4,	%o2
	fzero	%f18
	ldd	[%l7 + 0x10],	%f22
	smulcc	%l6,	0x1DC9,	%l0
	ldd	[%l7 + 0x28],	%f20
	sethi	0x093B,	%g3
	andcc	%g7,	%i2,	%o5
	fmovsleu	%xcc,	%f24,	%f11
	movleu	%xcc,	%o6,	%o0
	fzero	%f30
	move	%xcc,	%g4,	%i0
	sub	%l4,	0x19A3,	%l2
	sub	%o1,	%g2,	%o7
	andncc	%g1,	%i7,	%g6
	movrgz	%i5,	0x15E,	%g5
	mova	%icc,	%l1,	%l3
	fors	%f12,	%f6,	%f7
	fmovsleu	%xcc,	%f18,	%f3
	ldsb	[%l7 + 0x7F],	%l5
	fpsub32	%f22,	%f0,	%f2
	fandnot2	%f10,	%f6,	%f6
	edge32ln	%i4,	%i3,	%o3
	edge32l	%i6,	%i1,	%o4
	mulscc	%o2,	%l0,	%l6
	edge32	%g7,	%g3,	%i2
	stx	%o6,	[%l7 + 0x78]
	movre	%o5,	0x369,	%o0
	sdivcc	%i0,	0x15AA,	%g4
	fcmple32	%f8,	%f14,	%l2
	edge32n	%l4,	%g2,	%o7
	fmovde	%xcc,	%f31,	%f14
	fcmpne16	%f16,	%f6,	%g1
	addcc	%i7,	0x0FDC,	%g6
	sth	%i5,	[%l7 + 0x7A]
	movneg	%xcc,	%g5,	%o1
	popc	%l1,	%l5
	movrlz	%i4,	%l3,	%i3
	fcmps	%fcc1,	%f21,	%f28
	edge16n	%o3,	%i1,	%o4
	andn	%o2,	0x0119,	%i6
	edge16l	%l6,	%l0,	%g7
	edge16ln	%g3,	%o6,	%i2
	movneg	%xcc,	%o0,	%o5
	edge32ln	%i0,	%l2,	%g4
	addccc	%g2,	0x1BB7,	%l4
	or	%g1,	%i7,	%g6
	xnorcc	%o7,	0x0C82,	%g5
	fmovrde	%i5,	%f28,	%f2
	fmovsvs	%icc,	%f19,	%f25
	sub	%o1,	0x046C,	%l1
	add	%l5,	%l3,	%i3
	movleu	%xcc,	%o3,	%i4
	ldd	[%l7 + 0x68],	%i0
	edge8ln	%o2,	%o4,	%l6
	mulscc	%l0,	0x1972,	%i6
	movcc	%xcc,	%g3,	%g7
	srax	%o6,	0x11,	%o0
	sllx	%o5,	%i2,	%l2
	ldd	[%l7 + 0x58],	%i0
	sth	%g4,	[%l7 + 0x0E]
	stx	%g2,	[%l7 + 0x38]
	fandnot1s	%f27,	%f27,	%f25
	fmovscs	%xcc,	%f22,	%f9
	fmovdvs	%xcc,	%f4,	%f30
	sir	0x07DE
	fsrc2s	%f7,	%f3
	orcc	%g1,	%i7,	%l4
	edge16l	%o7,	%g5,	%i5
	mulx	%g6,	0x1E3B,	%l1
	fsrc2s	%f15,	%f18
	movvc	%xcc,	%l5,	%l3
	movge	%icc,	%o1,	%o3
	edge32	%i3,	%i1,	%o2
	fnegs	%f18,	%f28
	umulcc	%i4,	%o4,	%l0
	array8	%l6,	%i6,	%g3
	andncc	%g7,	%o6,	%o0
	xor	%i2,	0x0C11,	%l2
	movn	%xcc,	%i0,	%o5
	siam	0x4
	popc	0x175C,	%g4
	fmovse	%icc,	%f19,	%f23
	add	%g1,	0x124B,	%i7
	edge16	%l4,	%o7,	%g2
	movpos	%icc,	%g5,	%g6
	movrne	%i5,	0x359,	%l5
	sra	%l1,	%o1,	%o3
	srl	%i3,	%l3,	%o2
	alignaddrl	%i1,	%o4,	%l0
	movrne	%i4,	0x393,	%i6
	lduw	[%l7 + 0x14],	%l6
	edge32n	%g7,	%o6,	%g3
	sth	%o0,	[%l7 + 0x32]
	movne	%icc,	%i2,	%l2
	edge16	%o5,	%i0,	%g1
	sllx	%g4,	%l4,	%i7
	sra	%o7,	%g2,	%g5
	movneg	%xcc,	%g6,	%l5
	movrlez	%l1,	0x396,	%i5
	subc	%o3,	0x13DA,	%i3
	edge8	%o1,	%l3,	%i1
	fexpand	%f26,	%f26
	xnorcc	%o4,	%o2,	%i4
	bshuffle	%f6,	%f12,	%f30
	restore %i6, %l6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l0,	%g3,	%o0
	movrne	%i2,	%o6,	%o5
	subcc	%l2,	0x15F0,	%g1
	ldd	[%l7 + 0x20],	%f20
	fsrc2s	%f17,	%f22
	andn	%g4,	0x031A,	%l4
	movn	%xcc,	%i7,	%i0
	andncc	%o7,	%g5,	%g2
	movn	%xcc,	%l5,	%l1
	sub	%i5,	0x0079,	%o3
	fmovscs	%xcc,	%f5,	%f18
	movle	%icc,	%g6,	%i3
	ldsw	[%l7 + 0x08],	%o1
	mulx	%l3,	%i1,	%o2
	movrgez	%o4,	%i4,	%l6
	edge8ln	%g7,	%l0,	%i6
	andcc	%o0,	0x1BAC,	%i2
	stx	%o6,	[%l7 + 0x70]
	fcmpes	%fcc3,	%f5,	%f14
	udivx	%o5,	0x0EE1,	%g3
	srax	%l2,	0x0C,	%g1
	xor	%l4,	0x03DE,	%i7
	umulcc	%g4,	%o7,	%i0
	fmovrdlz	%g2,	%f28,	%f4
	andn	%g5,	0x1646,	%l1
	movleu	%xcc,	%i5,	%l5
	edge16	%g6,	%i3,	%o1
	movpos	%icc,	%o3,	%l3
	edge8	%i1,	%o2,	%o4
	andncc	%i4,	%g7,	%l6
	fzero	%f26
	orncc	%l0,	%o0,	%i6
	mulscc	%o6,	0x07DD,	%i2
	sdivcc	%g3,	0x1721,	%l2
	ldsw	[%l7 + 0x1C],	%g1
	fmovsle	%xcc,	%f14,	%f22
	fone	%f8
	mulscc	%l4,	%i7,	%g4
	andn	%o7,	%i0,	%g2
	add	%o5,	0x15CA,	%l1
	movrlz	%g5,	0x099,	%i5
	udiv	%l5,	0x095B,	%g6
	andcc	%o1,	%o3,	%i3
	ld	[%l7 + 0x70],	%f8
	umul	%l3,	0x10AB,	%i1
	addc	%o2,	%o4,	%i4
	movne	%icc,	%l6,	%g7
	ldx	[%l7 + 0x08],	%o0
	nop
	set	0x3A, %l5
	ldub	[%l7 + %l5],	%i6
	movcc	%icc,	%o6,	%l0
	ldx	[%l7 + 0x28],	%i2
	stx	%g3,	[%l7 + 0x20]
	ldsh	[%l7 + 0x0A],	%l2
	orcc	%l4,	%g1,	%i7
	or	%o7,	%i0,	%g4
	edge16n	%o5,	%g2,	%g5
	smul	%l1,	%i5,	%l5
	smul	%o1,	%o3,	%i3
	sub	%l3,	%i1,	%o2
	movleu	%icc,	%o4,	%i4
	alignaddrl	%g6,	%g7,	%o0
	movgu	%xcc,	%l6,	%o6
	udivx	%l0,	0x1F1F,	%i6
	fmovspos	%xcc,	%f29,	%f9
	subcc	%i2,	%g3,	%l2
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f24
	popc	0x0D1C,	%l4
	fsrc1	%f10,	%f26
	subc	%g1,	%i7,	%o7
	addccc	%i0,	%o5,	%g2
	udivx	%g5,	0x0882,	%l1
	movcc	%icc,	%i5,	%g4
	orcc	%l5,	0x05F3,	%o3
	fmul8sux16	%f6,	%f30,	%f20
	xorcc	%o1,	%l3,	%i1
	fmovdcs	%xcc,	%f8,	%f27
	edge16	%o2,	%o4,	%i4
	sllx	%i3,	0x07,	%g7
	ldub	[%l7 + 0x79],	%g6
	sth	%l6,	[%l7 + 0x48]
	ldub	[%l7 + 0x3D],	%o6
	xnorcc	%o0,	%l0,	%i2
	edge32	%i6,	%l2,	%g3
	fmuld8ulx16	%f26,	%f27,	%f16
	fmul8x16	%f24,	%f10,	%f14
	mulscc	%g1,	0x0AEE,	%i7
	sdiv	%o7,	0x0E82,	%i0
	stb	%l4,	[%l7 + 0x6B]
	umulcc	%g2,	%g5,	%l1
	lduw	[%l7 + 0x58],	%i5
	array8	%g4,	%o5,	%o3
	ldd	[%l7 + 0x48],	%l4
	fmovda	%icc,	%f23,	%f7
	fmovda	%xcc,	%f24,	%f22
	andcc	%o1,	%i1,	%l3
	subccc	%o4,	%o2,	%i4
	ldsb	[%l7 + 0x38],	%i3
	movpos	%xcc,	%g6,	%l6
	fnor	%f2,	%f22,	%f30
	nop
	set	0x38, %i7
	stw	%o6,	[%l7 + %i7]
	fmovsvs	%xcc,	%f3,	%f31
	smul	%g7,	%l0,	%o0
	sdivx	%i6,	0x0FA2,	%l2
	ldd	[%l7 + 0x50],	%f2
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%g2
	movvc	%icc,	%i2,	%i7
	andn	%g1,	0x125C,	%i0
	mulx	%o7,	%l4,	%g5
	movrgz	%g2,	%i5,	%l1
	edge8n	%o5,	%o3,	%l5
	fornot2	%f30,	%f0,	%f0
	edge8n	%o1,	%g4,	%l3
	umul	%i1,	%o2,	%i4
	fcmpd	%fcc2,	%f22,	%f2
	array8	%o4,	%g6,	%i3
	sub	%l6,	0x0D59,	%o6
	edge8n	%g7,	%l0,	%i6
	movrgz	%o0,	0x152,	%l2
	edge16l	%g3,	%i2,	%g1
	sth	%i7,	[%l7 + 0x08]
	movleu	%icc,	%i0,	%l4
	xorcc	%o7,	0x1283,	%g2
	andn	%i5,	0x1FE5,	%g5
	movvc	%xcc,	%o5,	%l1
	or	%o3,	0x1BEA,	%o1
	ldsb	[%l7 + 0x45],	%l5
	fnegd	%f10,	%f26
	ldsw	[%l7 + 0x74],	%l3
	andn	%i1,	%g4,	%o2
	xnor	%i4,	0x0E00,	%g6
	movvc	%xcc,	%o4,	%i3
	edge8	%l6,	%o6,	%l0
	fpsub32s	%f6,	%f18,	%f14
	edge16ln	%i6,	%g7,	%l2
	andn	%o0,	0x1CB5,	%i2
	subccc	%g1,	0x0A07,	%i7
	fpadd32	%f2,	%f20,	%f2
	srlx	%g3,	%i0,	%o7
	stb	%g2,	[%l7 + 0x61]
	fnand	%f12,	%f30,	%f12
	movvs	%icc,	%i5,	%g5
	xor	%o5,	%l4,	%o3
	fpsub32	%f22,	%f28,	%f16
	andcc	%o1,	0x1C37,	%l1
	fcmpgt16	%f28,	%f8,	%l5
	orn	%i1,	0x1EB1,	%g4
	or	%l3,	%i4,	%o2
	udiv	%g6,	0x0497,	%o4
	edge16ln	%i3,	%o6,	%l0
	edge8ln	%l6,	%i6,	%g7
	orncc	%l2,	0x1E51,	%o0
	addc	%i2,	%i7,	%g1
	array32	%i0,	%g3,	%g2
	sll	%o7,	0x0E,	%g5
	mova	%icc,	%o5,	%l4
	andncc	%o3,	%i5,	%l1
	xorcc	%o1,	%i1,	%l5
	fpadd32	%f0,	%f24,	%f2
	smulcc	%l3,	%g4,	%o2
	movrgz	%i4,	0x0F1,	%o4
	udiv	%g6,	0x1800,	%o6
	alignaddr	%l0,	%l6,	%i3
	sdivcc	%g7,	0x16CA,	%l2
	movrne	%o0,	%i2,	%i7
	movneg	%icc,	%i6,	%i0
	stw	%g1,	[%l7 + 0x64]
	fmovrdne	%g3,	%f22,	%f12
	edge32l	%g2,	%o7,	%o5
	addccc	%g5,	%l4,	%o3
	movrgz	%l1,	%i5,	%i1
	movge	%icc,	%l5,	%o1
	mulscc	%l3,	0x158F,	%g4
	movge	%icc,	%o2,	%i4
	array16	%o4,	%g6,	%l0
	movpos	%xcc,	%l6,	%i3
	umulcc	%o6,	0x0F7D,	%l2
	movrlez	%o0,	0x33F,	%g7
	movge	%xcc,	%i7,	%i2
	array8	%i6,	%g1,	%g3
	andncc	%i0,	%o7,	%g2
	popc	%o5,	%l4
	movneg	%icc,	%o3,	%g5
	mulscc	%l1,	0x1BEC,	%i5
	movpos	%xcc,	%l5,	%i1
	andn	%o1,	%l3,	%o2
	move	%xcc,	%i4,	%g4
	umul	%o4,	%l0,	%g6
	fcmpeq32	%f20,	%f0,	%i3
	sdivx	%o6,	0x02FE,	%l2
	movcs	%icc,	%o0,	%g7
	edge16ln	%l6,	%i2,	%i6
	sdivx	%i7,	0x10A5,	%g1
	fmovsn	%icc,	%f18,	%f4
	ldsh	[%l7 + 0x36],	%i0
	stx	%o7,	[%l7 + 0x60]
	movl	%icc,	%g3,	%g2
	alignaddrl	%o5,	%o3,	%l4
	movrgz	%g5,	0x295,	%l1
	fmovrslz	%i5,	%f14,	%f5
	fmul8x16al	%f11,	%f25,	%f30
	sir	0x1E88
	movl	%icc,	%l5,	%i1
	movne	%xcc,	%l3,	%o1
	fnegs	%f21,	%f23
	fzeros	%f6
	movg	%xcc,	%i4,	%o2
	movvc	%icc,	%o4,	%l0
	movn	%xcc,	%g4,	%i3
	ldd	[%l7 + 0x70],	%g6
	fmovdvc	%icc,	%f18,	%f7
	xorcc	%o6,	%l2,	%o0
	stx	%g7,	[%l7 + 0x18]
	edge8l	%i2,	%i6,	%i7
	fpack32	%f2,	%f16,	%f22
	fand	%f6,	%f28,	%f6
	movcc	%icc,	%g1,	%i0
	lduh	[%l7 + 0x58],	%o7
	smulcc	%l6,	%g3,	%g2
	sdivcc	%o5,	0x0657,	%l4
	movn	%icc,	%o3,	%g5
	srax	%l1,	0x0B,	%i5
	subccc	%i1,	0x1787,	%l3
	movvc	%xcc,	%l5,	%i4
	sllx	%o1,	0x14,	%o4
	fcmps	%fcc2,	%f23,	%f10
	stx	%o2,	[%l7 + 0x68]
	subcc	%g4,	%l0,	%i3
	subccc	%o6,	%l2,	%o0
	udivx	%g6,	0x009A,	%i2
	stw	%i6,	[%l7 + 0x18]
	orcc	%i7,	0x17AA,	%g7
	bshuffle	%f0,	%f8,	%f30
	srax	%g1,	%i0,	%l6
	udivcc	%o7,	0x0EE6,	%g3
	fones	%f29
	ldub	[%l7 + 0x47],	%g2
	orcc	%l4,	0x19F5,	%o3
	ldd	[%l7 + 0x60],	%g4
	fands	%f26,	%f9,	%f31
	fandnot2	%f2,	%f4,	%f12
	fmovs	%f18,	%f0
	fmovd	%f10,	%f22
	nop
	set	0x1B, %o6
	stb	%o5,	[%l7 + %o6]
	movrne	%i5,	0x3E3,	%i1
	fmovsgu	%xcc,	%f22,	%f5
	fmovdge	%xcc,	%f16,	%f6
	andcc	%l3,	0x0BCC,	%l1
	array8	%i4,	%o1,	%l5
	ldd	[%l7 + 0x58],	%f10
	fmovrsgz	%o4,	%f12,	%f22
	fandnot2s	%f4,	%f28,	%f7
	edge32n	%g4,	%o2,	%i3
	alignaddrl	%l0,	%l2,	%o6
	fexpand	%f4,	%f8
	move	%icc,	%o0,	%i2
	smulcc	%g6,	%i7,	%i6
	ldd	[%l7 + 0x28],	%f26
	xor	%g7,	0x1F9A,	%i0
	popc	%l6,	%g1
	smulcc	%g3,	0x0797,	%o7
	fcmped	%fcc0,	%f18,	%f26
	fmovrslez	%g2,	%f30,	%f3
	fmovrsgz	%l4,	%f29,	%f10
	sdivcc	%g5,	0x1C83,	%o3
	sth	%o5,	[%l7 + 0x2E]
	std	%f24,	[%l7 + 0x30]
	array32	%i1,	%l3,	%l1
	fornot1	%f20,	%f14,	%f30
	umulcc	%i5,	0x087F,	%i4
	ld	[%l7 + 0x64],	%f1
	movvs	%xcc,	%l5,	%o1
	move	%xcc,	%o4,	%o2
	movrgz	%i3,	0x164,	%g4
	ldx	[%l7 + 0x30],	%l0
	movre	%o6,	0x1B3,	%o0
	fmovrslz	%i2,	%f4,	%f2
	mulx	%l2,	%g6,	%i6
	udivcc	%g7,	0x1D81,	%i7
	fcmpne32	%f28,	%f30,	%i0
	fcmpne16	%f28,	%f28,	%g1
	nop
	set	0x5E, %i1
	ldsh	[%l7 + %i1],	%l6
	fxor	%f14,	%f18,	%f2
	and	%g3,	0x0E9B,	%g2
	udivcc	%o7,	0x1F99,	%g5
	edge16	%o3,	%o5,	%l4
	ldsh	[%l7 + 0x66],	%i1
	movg	%icc,	%l3,	%i5
	xnor	%i4,	%l5,	%l1
	fmovsvs	%xcc,	%f5,	%f28
	popc	%o4,	%o2
	std	%f24,	[%l7 + 0x30]
	sdiv	%i3,	0x1AE0,	%o1
	subccc	%g4,	%l0,	%o0
	std	%f26,	[%l7 + 0x50]
	ldd	[%l7 + 0x50],	%f22
	edge32ln	%i2,	%o6,	%l2
	xnorcc	%g6,	%i6,	%i7
	fors	%f17,	%f24,	%f14
	add	%g7,	0x0762,	%i0
	ldub	[%l7 + 0x71],	%l6
	fexpand	%f17,	%f18
	sth	%g3,	[%l7 + 0x68]
	ldd	[%l7 + 0x58],	%g0
	alignaddr	%g2,	%o7,	%g5
	udiv	%o3,	0x02A5,	%l4
	orn	%i1,	%o5,	%i5
	fxnors	%f26,	%f20,	%f0
	ldub	[%l7 + 0x0E],	%i4
	andn	%l3,	%l1,	%l5
	movne	%icc,	%o2,	%o4
	stx	%o1,	[%l7 + 0x60]
	and	%g4,	0x0B25,	%l0
	popc	0x17C3,	%o0
	faligndata	%f28,	%f18,	%f20
	fabss	%f10,	%f25
	udivcc	%i3,	0x00F4,	%o6
	movvs	%icc,	%l2,	%g6
	movvc	%icc,	%i2,	%i6
	move	%xcc,	%i7,	%i0
	smul	%g7,	%l6,	%g1
	movleu	%icc,	%g3,	%o7
	fpsub32	%f26,	%f24,	%f14
	sub	%g2,	0x1F93,	%o3
	fmovrdne	%g5,	%f0,	%f20
	movg	%icc,	%i1,	%l4
	and	%o5,	%i5,	%l3
	ldx	[%l7 + 0x20],	%l1
	movleu	%icc,	%i4,	%l5
	fmul8x16al	%f31,	%f23,	%f22
	popc	%o4,	%o1
	nop
	set	0x10, %o7
	std	%f8,	[%l7 + %o7]
	edge8	%o2,	%g4,	%o0
	movrgz	%i3,	0x3FE,	%o6
	fpsub16s	%f20,	%f7,	%f31
	movre	%l2,	%l0,	%i2
	stw	%i6,	[%l7 + 0x2C]
	udiv	%i7,	0x1E5A,	%g6
	mulscc	%g7,	%l6,	%i0
	srlx	%g3,	0x14,	%o7
	sll	%g2,	0x08,	%o3
	xor	%g1,	0x177B,	%g5
	movge	%xcc,	%l4,	%o5
	mulscc	%i1,	0x1953,	%l3
	fcmpne32	%f26,	%f16,	%l1
	ld	[%l7 + 0x70],	%f2
	sth	%i4,	[%l7 + 0x72]
	addccc	%i5,	0x0A59,	%o4
	stw	%l5,	[%l7 + 0x24]
	lduh	[%l7 + 0x66],	%o2
	lduw	[%l7 + 0x5C],	%g4
	fmovsleu	%xcc,	%f5,	%f25
	fmovdn	%icc,	%f30,	%f8
	mulscc	%o1,	%i3,	%o0
	fmul8sux16	%f16,	%f26,	%f26
	array16	%l2,	%o6,	%i2
	add	%i6,	0x087C,	%l0
	edge32n	%g6,	%i7,	%g7
	fcmpeq16	%f20,	%f0,	%i0
	fand	%f28,	%f14,	%f2
	srl	%l6,	0x0E,	%g3
	movgu	%xcc,	%g2,	%o3
	subcc	%g1,	%g5,	%l4
	edge8n	%o5,	%o7,	%i1
	fsrc2s	%f17,	%f10
	ldd	[%l7 + 0x30],	%f10
	movrlz	%l3,	0x2D2,	%i4
	array8	%i5,	%l1,	%o4
	fmovrsne	%l5,	%f29,	%f19
	fmovdle	%icc,	%f30,	%f3
	nop
	set	0x38, %o0
	stx	%g4,	[%l7 + %o0]
	fmul8x16al	%f2,	%f14,	%f0
	ld	[%l7 + 0x5C],	%f16
	fcmpgt32	%f26,	%f28,	%o1
	fcmpd	%fcc2,	%f2,	%f4
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	and	%o2,	%l2,	%o6
	stx	%i2,	[%l7 + 0x78]
	andcc	%l0,	%i6,	%i7
	mulx	%g7,	0x1ED5,	%i0
	subccc	%g6,	%l6,	%g3
	fmovdpos	%xcc,	%f6,	%f25
	movge	%xcc,	%o3,	%g1
	sllx	%g5,	%g2,	%l4
	movcc	%icc,	%o5,	%o7
	nop
	set	0x72, %l4
	sth	%i1,	[%l7 + %l4]
	ld	[%l7 + 0x5C],	%f20
	xor	%i4,	0x1E3D,	%l3
	movvc	%icc,	%l1,	%o4
	umul	%l5,	0x03A8,	%i5
	fornot1	%f22,	%f2,	%f14
	sethi	0x0693,	%o1
	xor	%i3,	0x12C4,	%g4
	udivcc	%o0,	0x15DB,	%l2
	add	%o2,	%i2,	%l0
	edge32	%o6,	%i7,	%i6
	smul	%i0,	%g7,	%g6
	udivx	%g3,	0x1643,	%l6
	fmovse	%icc,	%f0,	%f22
	fmuld8sux16	%f24,	%f30,	%f8
	srlx	%o3,	%g1,	%g5
	edge32l	%l4,	%g2,	%o7
	addccc	%i1,	0x19B1,	%o5
	addccc	%l3,	0x1B80,	%i4
	std	%f0,	[%l7 + 0x18]
	movrlz	%o4,	0x32E,	%l5
	movne	%xcc,	%i5,	%o1
	movrlez	%l1,	%g4,	%i3
	movvs	%icc,	%l2,	%o2
	and	%i2,	%o0,	%l0
	fand	%f16,	%f14,	%f28
	udivcc	%o6,	0x0930,	%i6
	sllx	%i7,	0x11,	%i0
	movcs	%icc,	%g7,	%g6
	sth	%g3,	[%l7 + 0x46]
	fmovrslez	%o3,	%f28,	%f27
	sth	%l6,	[%l7 + 0x30]
	lduw	[%l7 + 0x14],	%g1
	movrlez	%l4,	%g2,	%g5
	mova	%xcc,	%i1,	%o5
	movpos	%xcc,	%l3,	%o7
	movcc	%xcc,	%i4,	%o4
	mulscc	%i5,	%l5,	%o1
	std	%f10,	[%l7 + 0x30]
	subc	%l1,	%g4,	%i3
	edge16l	%o2,	%i2,	%o0
	subc	%l0,	%o6,	%l2
	fcmped	%fcc0,	%f4,	%f14
	subccc	%i7,	0x0803,	%i0
	st	%f17,	[%l7 + 0x2C]
	sll	%i6,	0x01,	%g6
	movge	%icc,	%g3,	%o3
	array16	%l6,	%g1,	%g7
	edge8l	%l4,	%g2,	%g5
	sir	0x0837
	fmovrdgz	%o5,	%f28,	%f22
	fmovspos	%icc,	%f19,	%f4
	fmovsleu	%icc,	%f30,	%f16
	fxor	%f16,	%f6,	%f22
	smul	%l3,	%o7,	%i1
	andn	%o4,	0x104C,	%i4
	edge32	%i5,	%o1,	%l1
	mulscc	%l5,	%i3,	%o2
	srax	%i2,	%g4,	%o0
	edge16ln	%o6,	%l0,	%i7
	andcc	%i0,	0x1E8A,	%l2
	movgu	%icc,	%g6,	%g3
	fnegs	%f1,	%f21
	fornot1	%f20,	%f30,	%f10
	edge32n	%i6,	%o3,	%g1
	fmovd	%f28,	%f10
	xorcc	%g7,	%l6,	%l4
	fsrc1s	%f13,	%f25
	movre	%g2,	0x34A,	%g5
	fands	%f28,	%f16,	%f22
	movvs	%icc,	%l3,	%o5
	edge8l	%o7,	%i1,	%i4
	addc	%o4,	%o1,	%i5
	ldx	[%l7 + 0x50],	%l1
	movgu	%icc,	%l5,	%o2
	edge32	%i2,	%g4,	%o0
	smul	%o6,	%l0,	%i7
	sth	%i3,	[%l7 + 0x50]
	edge32	%i0,	%g6,	%l2
	movle	%xcc,	%i6,	%o3
	fmovdn	%xcc,	%f20,	%f23
	movvs	%xcc,	%g3,	%g1
	fxor	%f12,	%f20,	%f30
	movle	%icc,	%l6,	%l4
	ldsw	[%l7 + 0x78],	%g7
	edge32n	%g5,	%g2,	%l3
	movvc	%xcc,	%o7,	%o5
	movge	%icc,	%i4,	%i1
	movg	%xcc,	%o4,	%i5
	addcc	%l1,	%l5,	%o2
	bshuffle	%f20,	%f28,	%f6
	movrne	%o1,	0x2B6,	%i2
	fpsub16s	%f0,	%f29,	%f6
	fpack16	%f14,	%f16
	array16	%o0,	%o6,	%g4
	xnorcc	%i7,	0x08E6,	%l0
	srax	%i0,	0x05,	%g6
	restore %i3, %i6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l2,	0x275,	%g3
	movpos	%xcc,	%l6,	%l4
	array32	%g7,	%g5,	%g1
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	stw	%i4,	[%l7 + 0x44]
	movg	%xcc,	%o5,	%o4
	fxors	%f14,	%f19,	%f26
	sdivcc	%i5,	0x0376,	%i1
	mulscc	%l5,	%l1,	%o1
	nop
	set	0x48, %g5
	ldx	[%l7 + %g5],	%o2
	movvc	%icc,	%i2,	%o6
	srax	%o0,	0x1D,	%i7
	fcmpd	%fcc0,	%f30,	%f16
	sllx	%l0,	0x03,	%g4
	fmovrdlez	%i0,	%f20,	%f18
	movrne	%g6,	%i3,	%i6
	movn	%icc,	%o3,	%g3
	srl	%l2,	%l6,	%g7
	umulcc	%g5,	%l4,	%g1
	udivcc	%g2,	0x1BDD,	%l3
	movcs	%icc,	%o7,	%i4
	xorcc	%o4,	%o5,	%i5
	sethi	0x0650,	%i1
	subccc	%l1,	0x12C8,	%o1
	edge8ln	%o2,	%i2,	%o6
	umul	%l5,	0x1226,	%i7
	udivx	%l0,	0x18B5,	%o0
	fmovdne	%icc,	%f0,	%f8
	fcmpne32	%f16,	%f12,	%i0
	xor	%g4,	%g6,	%i3
	ldsh	[%l7 + 0x2A],	%o3
	movrlez	%g3,	%l2,	%i6
	ldx	[%l7 + 0x68],	%l6
	movpos	%icc,	%g5,	%l4
	fornot2s	%f31,	%f0,	%f26
	edge8n	%g1,	%g2,	%l3
	andcc	%o7,	0x0477,	%g7
	sethi	0x10E7,	%o4
	movrgz	%o5,	%i4,	%i5
	nop
	set	0x69, %o1
	stb	%l1,	[%l7 + %o1]
	sth	%o1,	[%l7 + 0x22]
	movle	%xcc,	%o2,	%i2
	alignaddrl	%i1,	%l5,	%i7
	smulcc	%o6,	%o0,	%i0
	movl	%xcc,	%g4,	%g6
	addcc	%l0,	%i3,	%o3
	fmul8x16al	%f20,	%f12,	%f14
	movleu	%icc,	%l2,	%g3
	move	%xcc,	%i6,	%g5
	ld	[%l7 + 0x28],	%f28
	movrlz	%l4,	0x230,	%l6
	stx	%g1,	[%l7 + 0x60]
	fnegs	%f20,	%f31
	stb	%g2,	[%l7 + 0x26]
	nop
	set	0x58, %l6
	std	%f20,	[%l7 + %l6]
	fandnot1s	%f11,	%f0,	%f15
	movne	%xcc,	%o7,	%l3
	edge32	%o4,	%g7,	%i4
	edge16n	%i5,	%l1,	%o5
	subc	%o1,	%i2,	%o2
	lduh	[%l7 + 0x10],	%i1
	movvs	%icc,	%l5,	%o6
	movg	%xcc,	%o0,	%i0
	fmovsneg	%xcc,	%f7,	%f1
	fmovse	%xcc,	%f21,	%f2
	ldx	[%l7 + 0x50],	%g4
	movrne	%i7,	%g6,	%i3
	movcs	%icc,	%o3,	%l2
	smulcc	%g3,	0x1A55,	%l0
	st	%f16,	[%l7 + 0x3C]
	lduh	[%l7 + 0x42],	%g5
	sdivcc	%l4,	0x112A,	%l6
	fmovsvc	%xcc,	%f18,	%f26
	array32	%i6,	%g2,	%g1
	movre	%l3,	0x03D,	%o4
	fcmped	%fcc3,	%f2,	%f30
	stw	%g7,	[%l7 + 0x08]
	save %o7, %i4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o5,	%o1,	%i2
	addc	%l1,	%o2,	%i1
	movcc	%xcc,	%o6,	%o0
	st	%f1,	[%l7 + 0x14]
	fmovrdgez	%i0,	%f10,	%f6
	std	%f18,	[%l7 + 0x08]
	sdivcc	%l5,	0x1E58,	%g4
	andcc	%i7,	0x1C0E,	%g6
	sth	%o3,	[%l7 + 0x72]
	edge32n	%l2,	%g3,	%i3
	restore %g5, 0x1A38, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l6,	%l4,	%g2
	movpos	%icc,	%i6,	%l3
	movn	%icc,	%g1,	%g7
	fmovrslz	%o7,	%f2,	%f31
	umul	%o4,	0x0E9C,	%i5
	fsrc1	%f2,	%f18
	andncc	%o5,	%i4,	%o1
	srlx	%l1,	0x01,	%o2
	edge32n	%i2,	%o6,	%o0
	add	%i1,	%i0,	%g4
	lduw	[%l7 + 0x10],	%l5
	movneg	%xcc,	%i7,	%o3
	edge8l	%g6,	%g3,	%l2
	edge32ln	%i3,	%g5,	%l0
	umulcc	%l4,	%l6,	%i6
	mulscc	%l3,	%g2,	%g1
	fmovdg	%icc,	%f19,	%f11
	mulscc	%g7,	0x08AD,	%o7
	fzero	%f6
	fnot1	%f8,	%f16
	orn	%i5,	0x0D11,	%o5
	stb	%o4,	[%l7 + 0x39]
	alignaddrl	%o1,	%i4,	%l1
	save %o2, %o6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i2,	0x13DE,	%i1
	fpackfix	%f16,	%f0
	lduh	[%l7 + 0x54],	%g4
	movne	%icc,	%i0,	%l5
	fmovrse	%o3,	%f23,	%f16
	edge16	%g6,	%i7,	%g3
	orn	%i3,	0x1B2C,	%l2
	move	%xcc,	%g5,	%l0
	fmovsgu	%xcc,	%f28,	%f8
	ldsb	[%l7 + 0x44],	%l6
	fmovda	%xcc,	%f2,	%f4
	fmul8ulx16	%f0,	%f24,	%f28
	edge16l	%l4,	%l3,	%i6
	sra	%g2,	0x0C,	%g7
	mulscc	%o7,	%g1,	%o5
	edge8n	%o4,	%o1,	%i5
	sra	%l1,	%o2,	%o6
	fexpand	%f3,	%f10
	edge8l	%o0,	%i4,	%i1
	subccc	%i2,	%g4,	%l5
	movne	%xcc,	%i0,	%o3
	movle	%icc,	%g6,	%i7
	array32	%g3,	%i3,	%l2
	movgu	%icc,	%g5,	%l6
	sdiv	%l4,	0x03C8,	%l3
	movcc	%icc,	%i6,	%l0
	andcc	%g7,	0x0A4E,	%o7
	andcc	%g2,	0x08C6,	%o5
	xor	%g1,	%o1,	%i5
	sethi	0x19D8,	%l1
	orn	%o2,	%o6,	%o0
	movrlz	%o4,	%i4,	%i2
	sir	0x126F
	add	%i1,	%l5,	%i0
	ldub	[%l7 + 0x56],	%g4
	fors	%f26,	%f0,	%f8
	fcmpgt32	%f4,	%f6,	%o3
	array32	%g6,	%i7,	%i3
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
	set	0x58, %g7
	std	%f4,	[%l7 + %g7]
	sra	%l6,	%l4,	%g5
	fmovrdlez	%i6,	%f18,	%f16
	ldsh	[%l7 + 0x22],	%l0
	ldub	[%l7 + 0x7B],	%g7
	edge16l	%o7,	%l3,	%g2
	mulx	%g1,	%o5,	%o1
	std	%f26,	[%l7 + 0x18]
	ldx	[%l7 + 0x68],	%l1
	lduw	[%l7 + 0x6C],	%i5
	fmovdpos	%xcc,	%f0,	%f3
	mova	%icc,	%o2,	%o0
	stw	%o4,	[%l7 + 0x58]
	fpackfix	%f20,	%f11
	fabss	%f7,	%f29
	umulcc	%o6,	0x1907,	%i2
	fmovrse	%i1,	%f20,	%f5
	fpadd16s	%f3,	%f0,	%f7
	subc	%i4,	%l5,	%g4
	save %o3, %i0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g6,	0x0879,	%l2
	sethi	0x1140,	%g3
	sethi	0x0804,	%i3
	xnorcc	%l6,	%l4,	%g5
	ldub	[%l7 + 0x4A],	%i6
	stx	%g7,	[%l7 + 0x70]
	srlx	%l0,	0x0B,	%l3
	stx	%g2,	[%l7 + 0x38]
	srlx	%o7,	%g1,	%o5
	srlx	%o1,	%i5,	%l1
	mulscc	%o2,	0x0D16,	%o4
	smulcc	%o0,	0x08EA,	%o6
	mulscc	%i2,	0x138C,	%i1
	fnor	%f12,	%f14,	%f10
	subccc	%i4,	0x002C,	%l5
	lduh	[%l7 + 0x6E],	%g4
	nop
	set	0x40, %o4
	sth	%i0,	[%l7 + %o4]
	ldsw	[%l7 + 0x3C],	%o3
	restore %g6, %i7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	bshuffle	%f16,	%f4,	%f24
	smul	%l2,	0x1479,	%l6
	fandnot1s	%f27,	%f0,	%f26
	st	%f9,	[%l7 + 0x64]
	ldub	[%l7 + 0x67],	%i3
	stb	%g5,	[%l7 + 0x4C]
	fmovs	%f8,	%f2
	ldd	[%l7 + 0x70],	%i6
	ldsw	[%l7 + 0x2C],	%g7
	or	%l4,	0x0760,	%l3
	subc	%g2,	0x02C5,	%l0
	add	%o7,	%o5,	%o1
	movrlez	%i5,	0x0F0,	%g1
	fsrc2s	%f11,	%f1
	xor	%l1,	%o4,	%o0
	sllx	%o2,	%o6,	%i1
	movpos	%icc,	%i4,	%l5
	addcc	%g4,	0x1986,	%i0
	umulcc	%o3,	%g6,	%i2
	movn	%xcc,	%g3,	%i7
	movneg	%xcc,	%l2,	%l6
	fmovdneg	%xcc,	%f12,	%f25
	fcmpeq16	%f28,	%f2,	%g5
	movvs	%xcc,	%i6,	%i3
	movge	%icc,	%g7,	%l3
	subc	%l4,	0x1E1E,	%g2
	movle	%icc,	%o7,	%o5
	fmovde	%icc,	%f5,	%f4
	lduw	[%l7 + 0x68],	%l0
	fmuld8ulx16	%f25,	%f3,	%f24
	edge8l	%i5,	%o1,	%l1
	mulx	%o4,	0x1A1A,	%g1
	fmuld8ulx16	%f4,	%f27,	%f26
	array32	%o2,	%o6,	%o0
	movrne	%i4,	0x1D9,	%i1
	or	%l5,	0x051B,	%i0
	subccc	%g4,	0x1398,	%o3
	orn	%g6,	%g3,	%i2
	ldd	[%l7 + 0x70],	%f10
	mova	%xcc,	%l2,	%l6
	movcc	%icc,	%g5,	%i6
	subcc	%i7,	%i3,	%l3
	bshuffle	%f16,	%f4,	%f28
	fmovsa	%icc,	%f20,	%f19
	fones	%f30
	fandnot2s	%f24,	%f16,	%f5
	orcc	%l4,	%g2,	%o7
	subcc	%g7,	%o5,	%l0
	array16	%o1,	%l1,	%o4
	xnor	%i5,	0x1B1E,	%o2
	fzeros	%f20
	fpsub16s	%f9,	%f7,	%f18
	movne	%xcc,	%o6,	%o0
	edge8n	%g1,	%i4,	%i1
	fmovscs	%icc,	%f25,	%f24
	edge8n	%i0,	%g4,	%l5
	movrne	%o3,	%g6,	%g3
	edge16l	%l2,	%l6,	%g5
	edge16	%i2,	%i6,	%i7
	edge16	%l3,	%l4,	%i3
	edge16ln	%g2,	%o7,	%o5
	andcc	%l0,	%g7,	%o1
	nop
	set	0x28, %o5
	std	%f0,	[%l7 + %o5]
	movcs	%xcc,	%o4,	%l1
	fnands	%f29,	%f13,	%f1
	movrne	%i5,	0x14E,	%o6
	std	%f18,	[%l7 + 0x38]
	stb	%o2,	[%l7 + 0x0C]
	fsrc2s	%f0,	%f19
	orcc	%g1,	0x1C7F,	%i4
	mova	%xcc,	%i1,	%o0
	movvc	%icc,	%i0,	%l5
	movcs	%xcc,	%o3,	%g4
	orcc	%g6,	0x08DE,	%g3
	mova	%xcc,	%l6,	%l2
	save %g5, %i6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l3,	0x1471,	%l4
	udivcc	%i7,	0x0C78,	%i3
	udivx	%g2,	0x1861,	%o5
	movrne	%l0,	0x30A,	%o7
	mulx	%g7,	0x0BF9,	%o4
	edge16l	%l1,	%o1,	%o6
	or	%i5,	%o2,	%i4
	stx	%i1,	[%l7 + 0x50]
	array16	%g1,	%o0,	%l5
	fxnors	%f25,	%f11,	%f0
	ldsh	[%l7 + 0x64],	%o3
	fnegd	%f8,	%f20
	fmovde	%xcc,	%f22,	%f6
	ldub	[%l7 + 0x21],	%i0
	movg	%icc,	%g4,	%g6
	or	%g3,	%l6,	%l2
	lduw	[%l7 + 0x78],	%i6
	ld	[%l7 + 0x78],	%f23
	alignaddr	%i2,	%g5,	%l4
	fpack32	%f6,	%f2,	%f24
	fmovrdlez	%i7,	%f4,	%f6
	movleu	%xcc,	%l3,	%i3
	fmovd	%f12,	%f28
	addc	%o5,	0x08BE,	%g2
	alignaddrl	%o7,	%g7,	%o4
	srl	%l0,	%o1,	%l1
	movgu	%xcc,	%o6,	%i5
	xnorcc	%o2,	%i1,	%i4
	sllx	%o0,	%g1,	%o3
	fcmpne32	%f10,	%f10,	%l5
	fmovdg	%xcc,	%f23,	%f16
	fmovsne	%icc,	%f5,	%f30
	movrlz	%i0,	0x1FA,	%g4
	edge8	%g3,	%g6,	%l6
	udivx	%i6,	0x19A1,	%l2
	movleu	%xcc,	%i2,	%g5
	edge16	%i7,	%l3,	%i3
	movvc	%xcc,	%o5,	%g2
	fandnot1	%f30,	%f4,	%f16
	sethi	0x05EA,	%l4
	fmovdvc	%xcc,	%f10,	%f12
	alignaddr	%g7,	%o4,	%l0
	smulcc	%o7,	%o1,	%o6
	st	%f29,	[%l7 + 0x28]
	ldsh	[%l7 + 0x70],	%i5
	ldsb	[%l7 + 0x15],	%l1
	fcmped	%fcc2,	%f18,	%f22
	fpackfix	%f14,	%f16
	popc	%i1,	%o2
	fmovscs	%icc,	%f8,	%f5
	edge8n	%i4,	%g1,	%o3
	edge32n	%l5,	%o0,	%g4
	umul	%g3,	0x054A,	%g6
	fmovrdlez	%i0,	%f6,	%f30
	movrgez	%i6,	0x2DB,	%l2
	or	%l6,	0x0EAD,	%i2
	sdivx	%g5,	0x1E0F,	%i7
	edge8l	%l3,	%i3,	%g2
	fmul8ulx16	%f12,	%f14,	%f30
	edge8ln	%l4,	%o5,	%o4
	siam	0x4
	alignaddrl	%g7,	%l0,	%o7
	fmuld8ulx16	%f0,	%f10,	%f12
	movvc	%xcc,	%o6,	%o1
	fmovdvc	%icc,	%f3,	%f21
	mova	%xcc,	%i5,	%l1
	and	%i1,	0x0886,	%i4
	array8	%g1,	%o2,	%o3
	fnegs	%f9,	%f2
	sub	%l5,	%o0,	%g4
	umulcc	%g3,	%g6,	%i0
	ldd	[%l7 + 0x40],	%i6
	movne	%icc,	%l6,	%l2
	array8	%g5,	%i7,	%l3
	sdivcc	%i2,	0x050E,	%i3
	movne	%xcc,	%g2,	%l4
	fcmpes	%fcc1,	%f2,	%f9
	sdivx	%o4,	0x100D,	%g7
	sdivx	%o5,	0x012E,	%l0
	and	%o6,	%o1,	%i5
	fmovdne	%xcc,	%f28,	%f17
	fands	%f14,	%f5,	%f24
	sub	%o7,	0x03F8,	%l1
	edge8	%i1,	%i4,	%o2
	edge32ln	%g1,	%l5,	%o0
	ld	[%l7 + 0x14],	%f17
	fpsub16	%f16,	%f24,	%f26
	xnor	%o3,	0x1296,	%g3
	xorcc	%g6,	%g4,	%i6
	save %l6, %l2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i7,	0x03DA,	%l3
	faligndata	%f10,	%f16,	%f28
	st	%f18,	[%l7 + 0x48]
	orcc	%i2,	%g5,	%g2
	fmovdge	%xcc,	%f13,	%f10
	movcs	%icc,	%l4,	%i3
	fxnors	%f11,	%f31,	%f31
	fmovsg	%xcc,	%f26,	%f25
	fandnot1	%f30,	%f6,	%f22
	fmovsle	%xcc,	%f28,	%f14
	movrne	%g7,	0x3A1,	%o5
	ldd	[%l7 + 0x58],	%l0
	sdivcc	%o6,	0x0CD7,	%o1
	fmovrdgz	%o4,	%f22,	%f18
	edge16	%o7,	%i5,	%l1
	fpsub16s	%f3,	%f12,	%f20
	ldsh	[%l7 + 0x3C],	%i1
	fmovspos	%icc,	%f6,	%f27
	movl	%icc,	%o2,	%i4
	orcc	%g1,	0x1495,	%l5
	save %o3, 0x1478, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f25
	sir	0x0A0D
	sir	0x15B6
	smulcc	%g6,	0x0D7A,	%g3
	fmovrslz	%i6,	%f20,	%f18
	siam	0x6
	edge32n	%g4,	%l6,	%l2
	add	%i0,	0x0C2F,	%i7
	edge16l	%i2,	%g5,	%g2
	sdivx	%l3,	0x02C8,	%l4
	lduw	[%l7 + 0x10],	%g7
	srlx	%i3,	%l0,	%o6
	fornot2	%f4,	%f24,	%f22
	edge16n	%o1,	%o5,	%o4
	fmovrdgz	%i5,	%f26,	%f30
	movvc	%xcc,	%o7,	%i1
	fnegs	%f23,	%f10
	fpmerge	%f28,	%f9,	%f18
	array32	%o2,	%i4,	%l1
	xnor	%l5,	%o3,	%o0
	fmovd	%f4,	%f14
	or	%g1,	0x0FD2,	%g6
	fmovdge	%xcc,	%f4,	%f11
	fmovdcs	%xcc,	%f7,	%f23
	subcc	%g3,	%g4,	%l6
	movrgz	%l2,	%i0,	%i7
	srlx	%i2,	0x1C,	%g5
	edge32n	%g2,	%l3,	%i6
	ldx	[%l7 + 0x48],	%l4
	ldd	[%l7 + 0x78],	%f6
	std	%f10,	[%l7 + 0x08]
	orn	%i3,	0x0961,	%l0
	stx	%o6,	[%l7 + 0x40]
	sub	%o1,	%o5,	%g7
	edge8ln	%o4,	%o7,	%i1
	mova	%icc,	%o2,	%i5
	andncc	%i4,	%l1,	%o3
	movrlez	%o0,	%l5,	%g6
	xor	%g1,	%g3,	%l6
	addc	%g4,	0x1DE8,	%i0
	movrgez	%i7,	0x2CD,	%l2
	edge8ln	%i2,	%g5,	%g2
	fcmpgt32	%f24,	%f8,	%i6
	movge	%xcc,	%l4,	%l3
	array8	%l0,	%o6,	%i3
	sll	%o5,	%g7,	%o4
	movvc	%icc,	%o7,	%i1
	movrne	%o1,	0x011,	%i5
	sdiv	%i4,	0x0F90,	%l1
	fcmped	%fcc0,	%f16,	%f10
	udiv	%o2,	0x0B6C,	%o3
	udiv	%o0,	0x00ED,	%g6
	xor	%l5,	%g1,	%l6
	mulx	%g4,	%g3,	%i7
	movre	%i0,	%l2,	%g5
	umulcc	%g2,	0x1B82,	%i2
	xnor	%i6,	%l4,	%l0
	ldx	[%l7 + 0x18],	%o6
	fmovsne	%xcc,	%f11,	%f26
	smulcc	%l3,	%o5,	%g7
	fandnot2	%f30,	%f6,	%f0
	sdivx	%o4,	0x04E8,	%i3
	fcmple16	%f0,	%f30,	%o7
	mulx	%o1,	%i1,	%i4
	fands	%f24,	%f13,	%f31
	lduh	[%l7 + 0x66],	%l1
	mulscc	%o2,	%i5,	%o0
	movpos	%xcc,	%o3,	%g6
	ldsb	[%l7 + 0x0E],	%g1
	fmovdcs	%icc,	%f8,	%f19
	edge32n	%l5,	%l6,	%g3
	ldub	[%l7 + 0x5E],	%g4
	edge8n	%i7,	%i0,	%g5
	udivx	%l2,	0x0454,	%g2
	movrlz	%i6,	0x22E,	%i2
	nop
	set	0x58, %i5
	std	%f28,	[%l7 + %i5]
	edge16	%l4,	%o6,	%l0
	movrlez	%o5,	0x329,	%g7
	movleu	%icc,	%o4,	%i3
	mulscc	%l3,	0x1136,	%o7
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%i1
	fornot1s	%f17,	%f12,	%f24
	fmovdvc	%xcc,	%f31,	%f6
	umulcc	%i4,	0x1E5F,	%l1
	subcc	%o2,	0x0787,	%o1
	move	%xcc,	%o0,	%o3
	std	%f28,	[%l7 + 0x38]
	stb	%g6,	[%l7 + 0x0F]
	popc	0x1F2A,	%i5
	fmovdcc	%icc,	%f23,	%f4
	ldd	[%l7 + 0x40],	%f6
	sra	%g1,	%l6,	%g3
	subccc	%g4,	%i7,	%i0
	fmovse	%xcc,	%f0,	%f27
	orncc	%g5,	0x0693,	%l2
	mulx	%g2,	0x0174,	%l5
	and	%i2,	0x1E4E,	%i6
	xnor	%o6,	0x0E4B,	%l0
	edge8ln	%l4,	%g7,	%o5
	edge16n	%i3,	%o4,	%l3
	sll	%o7,	%i4,	%l1
	mulx	%o2,	%i1,	%o0
	alignaddr	%o1,	%o3,	%i5
	edge16l	%g6,	%l6,	%g3
	srax	%g1,	0x1A,	%i7
	movcs	%icc,	%i0,	%g4
	movne	%icc,	%g5,	%l2
	sdivx	%l5,	0x066C,	%i2
	fmovrdlez	%g2,	%f6,	%f8
	fmovdcs	%xcc,	%f21,	%f29
	sethi	0x1248,	%i6
	mulscc	%o6,	0x14B7,	%l4
	andcc	%g7,	0x0317,	%o5
	fmovrde	%l0,	%f24,	%f18
	edge8	%o4,	%l3,	%o7
	fmovda	%icc,	%f28,	%f11
	mova	%xcc,	%i4,	%l1
	and	%o2,	%i3,	%o0
	edge8	%o1,	%o3,	%i1
	fmovse	%xcc,	%f14,	%f9
	ldx	[%l7 + 0x70],	%i5
	fandnot1	%f4,	%f28,	%f16
	move	%icc,	%g6,	%g3
	mulx	%g1,	0x025A,	%i7
	addcc	%i0,	0x0F95,	%g4
	addc	%l6,	%g5,	%l2
	movcs	%xcc,	%i2,	%g2
	andn	%i6,	%l5,	%o6
	movre	%g7,	0x32E,	%l4
	fpadd16	%f24,	%f24,	%f18
	movle	%xcc,	%l0,	%o4
	movvs	%icc,	%o5,	%l3
	movcs	%icc,	%o7,	%i4
	lduw	[%l7 + 0x64],	%o2
	add	%i3,	%l1,	%o0
	movcs	%icc,	%o3,	%i1
	movne	%icc,	%o1,	%i5
	edge16n	%g6,	%g3,	%i7
	fpsub32s	%f10,	%f23,	%f23
	sdivx	%g1,	0x190D,	%g4
	fpsub16s	%f4,	%f8,	%f12
	sdivcc	%l6,	0x114C,	%g5
	movge	%xcc,	%i0,	%i2
	array16	%l2,	%g2,	%l5
	fsrc1	%f24,	%f8
	umulcc	%i6,	%g7,	%o6
	move	%icc,	%l0,	%l4
	movcs	%icc,	%o5,	%o4
	ldd	[%l7 + 0x10],	%o6
	edge8l	%l3,	%o2,	%i4
	edge8ln	%l1,	%i3,	%o0
	edge8n	%i1,	%o1,	%i5
	udivx	%o3,	0x1A6F,	%g3
	fmovsa	%xcc,	%f14,	%f30
	fmovrsgz	%i7,	%f15,	%f8
	addccc	%g1,	%g6,	%l6
	lduh	[%l7 + 0x28],	%g5
	xnor	%g4,	0x064F,	%i0
	save %l2, %i2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i6,	%l5,	%g7
	movvc	%icc,	%o6,	%l4
	movvc	%xcc,	%l0,	%o4
	popc	%o5,	%l3
	or	%o2,	0x1D21,	%o7
	stw	%l1,	[%l7 + 0x50]
	smulcc	%i3,	%i4,	%i1
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	add	%o3,	%g3,	%g1
	movcc	%icc,	%i7,	%g6
	nop
	set	0x40, %l1
	ldd	[%l7 + %l1],	%i6
	sllx	%g4,	0x1F,	%i0
	mulscc	%g5,	0x0FBD,	%l2
	orncc	%g2,	0x1168,	%i6
	subc	%l5,	0x1D6F,	%g7
	subc	%i2,	%l4,	%o6
	subc	%l0,	%o5,	%o4
	fcmpgt32	%f12,	%f26,	%l3
	sir	0x0B3F
	srlx	%o2,	%o7,	%i3
	array32	%l1,	%i1,	%i4
	std	%f16,	[%l7 + 0x30]
	restore %i5, %o0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f3,	%f30
	edge8ln	%o1,	%g1,	%g3
	faligndata	%f30,	%f24,	%f4
	std	%f8,	[%l7 + 0x18]
	ldsb	[%l7 + 0x2C],	%g6
	sir	0x0991
	movre	%i7,	0x2B0,	%g4
	edge8l	%i0,	%g5,	%l2
	srax	%g2,	%l6,	%i6
	fornot1	%f22,	%f22,	%f18
	fpadd32	%f10,	%f28,	%f22
	nop
	set	0x74, %l0
	ldsw	[%l7 + %l0],	%g7
	fcmpgt32	%f14,	%f6,	%i2
	stw	%l4,	[%l7 + 0x34]
	fpack32	%f0,	%f12,	%f8
	array16	%l5,	%l0,	%o5
	or	%o4,	%o6,	%l3
	ldub	[%l7 + 0x3C],	%o7
	movrlz	%i3,	%l1,	%i1
	sth	%o2,	[%l7 + 0x0E]
	movpos	%xcc,	%i5,	%i4
	save %o3, 0x142D, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f10,	%f24,	%f24
	move	%xcc,	%g1,	%o0
	movl	%icc,	%g3,	%g6
	or	%i7,	%i0,	%g5
	addcc	%g4,	0x0818,	%g2
	lduw	[%l7 + 0x64],	%l6
	st	%f18,	[%l7 + 0x5C]
	mulx	%l2,	0x1EDB,	%i6
	alignaddrl	%i2,	%g7,	%l4
	faligndata	%f10,	%f16,	%f8
	umul	%l0,	%l5,	%o4
	fnot2	%f28,	%f22
	popc	0x13F1,	%o6
	fmovdn	%icc,	%f1,	%f26
	array8	%l3,	%o7,	%o5
	movcs	%icc,	%i3,	%i1
	std	%f10,	[%l7 + 0x68]
	stx	%l1,	[%l7 + 0x40]
	nop
	set	0x18, %i6
	ldsw	[%l7 + %i6],	%o2
	fmovsge	%icc,	%f30,	%f26
	movrlz	%i4,	%o3,	%i5
	subccc	%o1,	%g1,	%o0
	orn	%g3,	%g6,	%i7
	edge32	%g5,	%g4,	%i0
	and	%g2,	%l2,	%l6
	edge8l	%i2,	%i6,	%g7
	sllx	%l0,	0x06,	%l5
	smulcc	%o4,	0x0095,	%l4
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	smulcc	%o5,	%l3,	%i1
	edge32n	%l1,	%i3,	%o2
	fmovdneg	%xcc,	%f12,	%f18
	umulcc	%i4,	0x1E9B,	%i5
	popc	%o3,	%o1
	stx	%o0,	[%l7 + 0x20]
	fmovdn	%xcc,	%f29,	%f4
	mulx	%g3,	0x047D,	%g6
	udivx	%i7,	0x0A69,	%g1
	fnors	%f2,	%f25,	%f17
	edge16n	%g5,	%g4,	%g2
	ldsw	[%l7 + 0x2C],	%l2
	movrgz	%i0,	%l6,	%i2
	fmul8ulx16	%f6,	%f12,	%f16
	fmovse	%icc,	%f20,	%f31
	movge	%icc,	%i6,	%l0
	ld	[%l7 + 0x5C],	%f20
	umul	%l5,	0x0F10,	%o4
	fmovsge	%icc,	%f12,	%f2
	edge16	%g7,	%o6,	%l4
	move	%xcc,	%o7,	%l3
	ldd	[%l7 + 0x68],	%f18
	movre	%o5,	0x11A,	%i1
	movneg	%xcc,	%l1,	%i3
	edge32l	%o2,	%i5,	%i4
	fabsd	%f16,	%f6
	movrne	%o3,	0x0E2,	%o0
	save %o1, %g6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%g1,	%i7,	%g5
	smulcc	%g4,	0x1020,	%l2
	fornot1	%f2,	%f22,	%f22
	orn	%g2,	%l6,	%i2
	subccc	%i0,	0x05CD,	%i6
	edge32ln	%l0,	%o4,	%l5
	movvc	%icc,	%g7,	%l4
	edge16n	%o6,	%o7,	%l3
	movn	%xcc,	%o5,	%l1
	fmul8ulx16	%f10,	%f18,	%f26
	orn	%i1,	%i3,	%o2
	edge8l	%i4,	%o3,	%i5
	fornot1	%f22,	%f10,	%f12
	xnorcc	%o0,	%o1,	%g3
	edge32l	%g1,	%i7,	%g6
	restore %g4, %l2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x44],	%l6
	andcc	%i2,	%g5,	%i0
	addc	%l0,	%i6,	%l5
	xorcc	%g7,	%l4,	%o6
	bshuffle	%f0,	%f30,	%f22
	lduw	[%l7 + 0x7C],	%o7
	fornot2s	%f16,	%f10,	%f27
	ldub	[%l7 + 0x30],	%o4
	and	%o5,	%l1,	%i1
	sth	%l3,	[%l7 + 0x46]
	edge32n	%o2,	%i3,	%o3
	edge16ln	%i5,	%i4,	%o1
	sth	%o0,	[%l7 + 0x56]
	for	%f30,	%f6,	%f28
	sdiv	%g1,	0x05FD,	%i7
	sth	%g3,	[%l7 + 0x42]
	fnot1s	%f20,	%f4
	umulcc	%g6,	0x155E,	%g4
	edge16ln	%l2,	%l6,	%g2
	edge8ln	%i2,	%i0,	%l0
	edge16n	%g5,	%l5,	%g7
	movrgez	%l4,	%i6,	%o6
	fpadd16s	%f26,	%f12,	%f20
	movrgez	%o4,	0x0E0,	%o7
	andn	%l1,	0x01FC,	%i1
	movne	%icc,	%o5,	%l3
	edge16n	%i3,	%o3,	%o2
	ldd	[%l7 + 0x50],	%i4
	alignaddr	%i5,	%o1,	%g1
	xorcc	%o0,	0x117B,	%i7
	edge16n	%g3,	%g6,	%g4
	edge8ln	%l6,	%l2,	%g2
	movpos	%icc,	%i0,	%l0
	fcmpd	%fcc3,	%f4,	%f26
	mulscc	%g5,	0x067E,	%i2
	fpadd32	%f4,	%f0,	%f6
	stx	%l5,	[%l7 + 0x08]
	popc	0x12EA,	%l4
	fnot2s	%f12,	%f16
	umul	%g7,	0x05EB,	%i6
	fpadd32	%f16,	%f8,	%f16
	fpadd16s	%f22,	%f24,	%f0
	movpos	%icc,	%o6,	%o7
	nop
	set	0x08, %i4
	ldx	[%l7 + %i4],	%l1
	fmovdgu	%xcc,	%f1,	%f20
	fmul8sux16	%f6,	%f0,	%f22
	fmovsvs	%icc,	%f1,	%f20
	movne	%xcc,	%i1,	%o4
	fnegd	%f4,	%f28
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	sir	0x089F
	array32	%i3,	%i4,	%i5
	st	%f12,	[%l7 + 0x24]
	ldsh	[%l7 + 0x5C],	%o2
	restore %o1, 0x11EA, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f24,	%f2,	%f12
	fmovsgu	%xcc,	%f9,	%f7
	sir	0x1CEA
	umulcc	%i7,	0x03B5,	%g3
	sth	%g6,	[%l7 + 0x7C]
	edge16ln	%g1,	%g4,	%l6
	fmovrsgz	%l2,	%f1,	%f10
	movleu	%xcc,	%i0,	%g2
	edge16n	%l0,	%i2,	%l5
	fmovsneg	%icc,	%f17,	%f15
	addcc	%l4,	0x1923,	%g5
	movcs	%icc,	%g7,	%o6
	umul	%i6,	0x0698,	%o7
	addc	%l1,	0x1DAF,	%i1
	array8	%o4,	%o5,	%l3
	movrgez	%o3,	0x24B,	%i3
	fmovspos	%xcc,	%f6,	%f25
	xor	%i5,	%o2,	%i4
	fcmple32	%f26,	%f0,	%o0
	fmovdg	%xcc,	%f9,	%f22
	edge32	%o1,	%i7,	%g6
	movle	%xcc,	%g3,	%g4
	fsrc2	%f10,	%f24
	orcc	%g1,	%l6,	%i0
	fmovrdlez	%l2,	%f24,	%f6
	lduw	[%l7 + 0x34],	%g2
	edge32n	%l0,	%i2,	%l4
	pdist	%f10,	%f26,	%f30
	fcmple32	%f30,	%f6,	%g5
	fcmpd	%fcc0,	%f0,	%f2
	subcc	%l5,	0x17C2,	%g7
	ldsh	[%l7 + 0x7E],	%o6
	xnorcc	%o7,	%l1,	%i6
	edge8	%i1,	%o5,	%o4
	ldsb	[%l7 + 0x74],	%l3
	sub	%i3,	0x1B79,	%i5
	popc	0x05C9,	%o3
	fcmple32	%f10,	%f2,	%i4
	fmovdgu	%xcc,	%f31,	%f11
	fmovdne	%icc,	%f25,	%f21
	nop
	set	0x78, %o2
	ldd	[%l7 + %o2],	%f18
	array32	%o2,	%o1,	%o0
	movcs	%icc,	%i7,	%g6
	umul	%g3,	%g1,	%g4
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%i0
	xor	%l6,	%g2,	%l2
	movrne	%l0,	%l4,	%i2
	xnor	%l5,	%g7,	%g5
	subc	%o6,	0x00A4,	%l1
	smulcc	%i6,	%o7,	%i1
	fmovdgu	%xcc,	%f1,	%f15
	fsrc1s	%f12,	%f3
	fmovrdgez	%o4,	%f30,	%f28
	edge8n	%l3,	%i3,	%i5
	st	%f20,	[%l7 + 0x28]
	movle	%icc,	%o5,	%i4
	edge8n	%o3,	%o1,	%o0
	array16	%i7,	%g6,	%g3
	mova	%xcc,	%o2,	%g4
	andn	%i0,	%g1,	%g2
	orn	%l2,	0x0617,	%l0
	sdiv	%l6,	0x1A4A,	%i2
	pdist	%f8,	%f10,	%f0
	array16	%l4,	%g7,	%l5
	fmovdneg	%xcc,	%f30,	%f28
	sdivx	%g5,	0x0436,	%o6
	sub	%i6,	%l1,	%o7
	movrlz	%o4,	%i1,	%l3
	ldub	[%l7 + 0x10],	%i3
	edge8ln	%o5,	%i4,	%o3
	edge32n	%i5,	%o1,	%o0
	movvs	%icc,	%i7,	%g3
	fsrc1s	%f8,	%f13
	udivx	%g6,	0x1E22,	%g4
	sllx	%o2,	%i0,	%g1
	ldx	[%l7 + 0x30],	%g2
	orncc	%l0,	%l2,	%i2
	sdivcc	%l4,	0x1F41,	%g7
	fabss	%f7,	%f24
	ldsw	[%l7 + 0x14],	%l5
	popc	0x0DCF,	%l6
	srl	%o6,	0x04,	%i6
	lduw	[%l7 + 0x4C],	%l1
	save %g5, %o7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f0,	%f8,	%f26
	movgu	%xcc,	%i1,	%i3
	fpsub32	%f22,	%f18,	%f8
	popc	0x002E,	%l3
	smul	%o5,	0x13F6,	%o3
	mulscc	%i5,	%o1,	%i4
	addc	%i7,	%o0,	%g3
	addccc	%g4,	%o2,	%g6
	fcmpgt32	%f12,	%f30,	%i0
	edge32ln	%g1,	%g2,	%l0
	ldd	[%l7 + 0x30],	%f6
	addcc	%l2,	%l4,	%g7
	st	%f11,	[%l7 + 0x58]
	addc	%i2,	%l5,	%l6
	xnorcc	%o6,	%i6,	%l1
	ldsw	[%l7 + 0x34],	%g5
	fmovdcc	%xcc,	%f25,	%f9
	srl	%o7,	%o4,	%i1
	ld	[%l7 + 0x78],	%f12
	stx	%i3,	[%l7 + 0x70]
	movrne	%l3,	%o5,	%o3
	movrlez	%i5,	%o1,	%i7
	edge32n	%o0,	%i4,	%g3
	fmovrse	%o2,	%f16,	%f28
	fmovdneg	%icc,	%f10,	%f6
	fmovsle	%icc,	%f1,	%f21
	sdivx	%g4,	0x1190,	%g6
	fmovrslez	%i0,	%f30,	%f8
	edge16ln	%g1,	%g2,	%l0
	mulx	%l2,	%g7,	%i2
	edge8n	%l4,	%l6,	%l5
	andcc	%i6,	%o6,	%l1
	fnands	%f0,	%f3,	%f14
	addc	%g5,	0x0A7E,	%o4
	movne	%xcc,	%o7,	%i1
	andncc	%i3,	%l3,	%o5
	ldd	[%l7 + 0x50],	%o2
	fmovsvs	%icc,	%f7,	%f21
	ldsb	[%l7 + 0x79],	%i5
	xnor	%i7,	0x1F73,	%o0
	stx	%o1,	[%l7 + 0x70]
	fnands	%f4,	%f6,	%f1
	fpackfix	%f14,	%f6
	move	%xcc,	%i4,	%g3
	array8	%o2,	%g4,	%g6
	stx	%g1,	[%l7 + 0x10]
	orn	%g2,	%i0,	%l0
	ldx	[%l7 + 0x60],	%g7
	movl	%icc,	%i2,	%l2
	addccc	%l4,	0x0676,	%l6
	stw	%i6,	[%l7 + 0x18]
	udivcc	%l5,	0x0A17,	%o6
	edge8	%l1,	%g5,	%o7
	add	%i1,	%i3,	%l3
	movrlz	%o4,	0x295,	%o5
	sth	%i5,	[%l7 + 0x68]
	fxnors	%f21,	%f4,	%f2
	edge16n	%i7,	%o3,	%o0
	xor	%i4,	%o1,	%g3
	ldsb	[%l7 + 0x35],	%g4
	fandnot2	%f28,	%f4,	%f24
	st	%f24,	[%l7 + 0x78]
	or	%o2,	%g6,	%g2
	fpsub16	%f16,	%f20,	%f8
	sdivx	%i0,	0x007E,	%g1
	array32	%l0,	%g7,	%l2
	and	%i2,	0x168B,	%l6
	fmovdcs	%xcc,	%f19,	%f10
	fmul8x16	%f19,	%f4,	%f12
	edge32ln	%l4,	%i6,	%l5
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	fandnot2s	%f1,	%f6,	%f28
	addcc	%o7,	%i1,	%l3
	save %i3, 0x0A8F, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i5,	0x0C75,	%i7
	fpsub32s	%f3,	%f25,	%f13
	fmovd	%f30,	%f30
	fmovrsne	%o5,	%f0,	%f18
	fsrc1	%f2,	%f4
	movrlz	%o0,	%i4,	%o1
	movrgez	%o3,	0x366,	%g3
	fmovda	%xcc,	%f26,	%f14
	fone	%f12
	fmovscs	%xcc,	%f1,	%f30
	edge16ln	%o2,	%g4,	%g6
	stb	%g2,	[%l7 + 0x1C]
	std	%f20,	[%l7 + 0x78]
	fnot2	%f8,	%f20
	xnor	%g1,	0x0B8A,	%i0
	edge8	%l0,	%l2,	%i2
	sra	%g7,	%l6,	%l4
	array16	%i6,	%l5,	%l1
	fmovrde	%o6,	%f16,	%f18
	fpsub16	%f24,	%f20,	%f28
	sdiv	%o7,	0x0028,	%i1
	mulscc	%l3,	%i3,	%g5
	edge16	%i5,	%o4,	%o5
	fmovrsgz	%i7,	%f29,	%f28
	sir	0x19CF
	movn	%xcc,	%o0,	%i4
	edge8l	%o1,	%g3,	%o2
	smulcc	%o3,	%g6,	%g2
	edge8l	%g1,	%i0,	%g4
	edge8n	%l2,	%l0,	%g7
	fandnot2s	%f0,	%f22,	%f14
	fcmpne32	%f10,	%f16,	%l6
	fnot1s	%f16,	%f27
	fmovrdlez	%l4,	%f10,	%f2
	fcmped	%fcc2,	%f14,	%f20
	mulscc	%i2,	0x191E,	%i6
	fmul8x16	%f12,	%f4,	%f24
	srax	%l1,	%l5,	%o6
	movn	%xcc,	%i1,	%l3
	addcc	%i3,	%g5,	%o7
	srlx	%i5,	0x12,	%o5
	movneg	%xcc,	%o4,	%i7
	edge16l	%i4,	%o0,	%g3
	add	%o1,	%o2,	%o3
	and	%g6,	%g1,	%i0
	fnegd	%f30,	%f12
	addccc	%g2,	%g4,	%l2
	fxnors	%f23,	%f29,	%f20
	edge16l	%l0,	%g7,	%l4
	smulcc	%l6,	0x0E73,	%i6
	movrgz	%l1,	0x0C8,	%i2
	edge32	%l5,	%i1,	%l3
	fmovscs	%xcc,	%f14,	%f20
	movre	%o6,	0x374,	%i3
	movre	%o7,	%i5,	%o5
	fmovdleu	%icc,	%f21,	%f0
	edge16	%o4,	%g5,	%i7
	lduh	[%l7 + 0x6E],	%i4
	ldsb	[%l7 + 0x58],	%g3
	fexpand	%f5,	%f30
	edge16ln	%o0,	%o2,	%o3
	fmovrde	%g6,	%f28,	%f18
	mova	%xcc,	%g1,	%i0
	fnor	%f4,	%f2,	%f18
	sll	%o1,	%g2,	%g4
	xnor	%l0,	0x1024,	%l2
	fmovrse	%g7,	%f18,	%f17
	smulcc	%l6,	%l4,	%i6
	udivcc	%i2,	0x1E88,	%l5
	xnorcc	%i1,	0x1B5B,	%l1
	movrlez	%o6,	0x1B1,	%l3
	fmovsg	%icc,	%f2,	%f30
	sir	0x1977
	smulcc	%i3,	0x024A,	%o7
	fmovd	%f10,	%f12
	udiv	%i5,	0x0D51,	%o4
	nop
	set	0x38, %i2
	ldx	[%l7 + %i2],	%g5
	or	%o5,	0x0594,	%i4
	smul	%i7,	0x0113,	%o0
	addc	%g3,	%o3,	%g6
	fpack16	%f18,	%f20
	andcc	%o2,	%i0,	%g1
	srlx	%o1,	0x07,	%g2
	alignaddrl	%g4,	%l2,	%g7
	std	%f20,	[%l7 + 0x48]
	stw	%l0,	[%l7 + 0x1C]
	udivx	%l6,	0x037C,	%i6
	edge16l	%l4,	%i2,	%i1
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f24
	fcmple32	%f14,	%f18,	%l5
	movl	%xcc,	%l1,	%l3
	movle	%icc,	%o6,	%i3
	subcc	%i5,	%o7,	%o4
	movrne	%o5,	%g5,	%i7
	srax	%i4,	%g3,	%o3
	sdivx	%g6,	0x0FE6,	%o0
	sdiv	%i0,	0x148A,	%o2
	fcmped	%fcc3,	%f28,	%f24
	fmovdle	%xcc,	%f12,	%f19
	fmovdle	%icc,	%f21,	%f16
	ldsw	[%l7 + 0x2C],	%o1
	edge32l	%g1,	%g2,	%l2
	std	%f22,	[%l7 + 0x68]
	fandnot2	%f16,	%f30,	%f18
	nop
	set	0x60, %i3
	lduw	[%l7 + %i3],	%g4
	add	%g7,	0x03B9,	%l0
	movge	%icc,	%i6,	%l4
	smulcc	%i2,	%l6,	%i1
	movpos	%xcc,	%l1,	%l5
	mulscc	%l3,	%o6,	%i3
	fmovsa	%icc,	%f29,	%f17
	lduh	[%l7 + 0x34],	%i5
	fnegd	%f6,	%f8
	edge8n	%o7,	%o5,	%o4
	srl	%i7,	0x09,	%g5
	movrgez	%g3,	%i4,	%o3
	sdivx	%g6,	0x0AE0,	%i0
	orn	%o0,	%o1,	%o2
	movleu	%icc,	%g2,	%l2
	fmovrsgz	%g4,	%f1,	%f22
	movne	%icc,	%g7,	%g1
	movvs	%icc,	%i6,	%l4
	add	%i2,	%l6,	%i1
	movneg	%xcc,	%l1,	%l0
	sdivcc	%l5,	0x127A,	%o6
	edge16	%i3,	%i5,	%o7
	movge	%icc,	%o5,	%l3
	sth	%i7,	[%l7 + 0x1E]
	ldx	[%l7 + 0x28],	%o4
	ldx	[%l7 + 0x50],	%g5
	sdivx	%g3,	0x0F14,	%i4
	for	%f10,	%f16,	%f22
	movvc	%xcc,	%g6,	%i0
	edge32n	%o3,	%o0,	%o1
	movvc	%xcc,	%o2,	%l2
	popc	%g4,	%g7
	std	%f24,	[%l7 + 0x18]
	udiv	%g1,	0x1AA3,	%g2
	sethi	0x0020,	%l4
	or	%i2,	%i6,	%l6
	array8	%l1,	%l0,	%l5
	srl	%i1,	0x1C,	%o6
	std	%f8,	[%l7 + 0x28]
	stx	%i5,	[%l7 + 0x60]
	movrgz	%o7,	%i3,	%o5
	umulcc	%l3,	%o4,	%i7
	ldsw	[%l7 + 0x5C],	%g5
	fornot2	%f2,	%f0,	%f18
	stb	%i4,	[%l7 + 0x7C]
	edge32l	%g3,	%g6,	%i0
	fmovrdlz	%o0,	%f6,	%f0
	array8	%o1,	%o2,	%o3
	fandnot1s	%f14,	%f5,	%f25
	fcmps	%fcc1,	%f4,	%f31
	restore %l2, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g2,	%l4,	%i2
	subccc	%g1,	%i6,	%l1
	udivcc	%l6,	0x12A1,	%l5
	fnand	%f4,	%f18,	%f4
	edge8l	%l0,	%o6,	%i5
	fmovdpos	%icc,	%f5,	%f30
	udivx	%o7,	0x068E,	%i1
	mulscc	%i3,	0x02B8,	%l3
	alignaddr	%o4,	%o5,	%g5
	sllx	%i7,	0x0F,	%g3
	fmovdge	%icc,	%f18,	%f16
	fnand	%f10,	%f12,	%f14
	ldd	[%l7 + 0x50],	%g6
	mulscc	%i0,	%o0,	%o1
	array8	%i4,	%o2,	%o3
	umulcc	%g7,	0x12B8,	%g4
	sth	%l2,	[%l7 + 0x1A]
	udiv	%l4,	0x14A3,	%g2
	movge	%icc,	%i2,	%g1
	xor	%l1,	%i6,	%l5
	edge32l	%l6,	%l0,	%i5
	fpackfix	%f20,	%f9
	fmovsg	%xcc,	%f15,	%f13
	movneg	%icc,	%o6,	%o7
	srax	%i1,	%l3,	%i3
	fmovscs	%icc,	%f22,	%f28
	stx	%o5,	[%l7 + 0x08]
	edge16l	%g5,	%i7,	%g3
	lduw	[%l7 + 0x7C],	%g6
	alignaddr	%i0,	%o4,	%o1
	smul	%o0,	%o2,	%i4
	udiv	%o3,	0x179F,	%g7
	sir	0x1A99
	fors	%f2,	%f13,	%f8
	fxnor	%f6,	%f8,	%f4
	xnor	%g4,	%l4,	%g2
	xnor	%l2,	%g1,	%l1
	sdivx	%i2,	0x04E3,	%l5
	fnor	%f22,	%f16,	%f24
	fnot2	%f24,	%f20
	udivcc	%i6,	0x1B35,	%l6
	srlx	%l0,	%i5,	%o6
	st	%f15,	[%l7 + 0x6C]
	edge8l	%o7,	%i1,	%i3
	movpos	%icc,	%o5,	%l3
	fmovdvc	%icc,	%f19,	%f27
	edge32l	%i7,	%g3,	%g5
	array8	%i0,	%g6,	%o4
	andncc	%o0,	%o1,	%i4
	stb	%o3,	[%l7 + 0x1C]
	andn	%o2,	%g7,	%g4
	movrlz	%g2,	0x0B1,	%l4
	andn	%l2,	%g1,	%i2
	edge32l	%l5,	%l1,	%l6
	sll	%l0,	0x07,	%i5
	sdivx	%o6,	0x1FB3,	%i6
	edge32ln	%o7,	%i1,	%i3
	ldx	[%l7 + 0x58],	%o5
	fmovsg	%icc,	%f27,	%f5
	lduh	[%l7 + 0x56],	%i7
	addccc	%g3,	0x1642,	%g5
	save %i0, 0x0CE2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%l3,	%o0,	%o4
	xnorcc	%o1,	0x073E,	%o3
	and	%o2,	%i4,	%g7
	edge32l	%g2,	%l4,	%g4
	array16	%l2,	%g1,	%i2
	stx	%l1,	[%l7 + 0x20]
	array16	%l6,	%l0,	%i5
	sub	%l5,	%i6,	%o6
	edge16n	%i1,	%i3,	%o7
	fmovda	%icc,	%f13,	%f17
	movgu	%icc,	%i7,	%g3
	addcc	%o5,	%g5,	%g6
	fnand	%f6,	%f2,	%f14
	smul	%l3,	0x1431,	%i0
	ldx	[%l7 + 0x58],	%o0
	fnot2	%f26,	%f6
	srlx	%o4,	0x16,	%o1
	movg	%icc,	%o2,	%i4
	movcc	%xcc,	%o3,	%g2
	udivcc	%g7,	0x05F4,	%l4
	mova	%icc,	%g4,	%g1
	andcc	%i2,	%l2,	%l1
	movne	%xcc,	%l6,	%i5
	subccc	%l5,	%i6,	%o6
	fmovdl	%icc,	%f31,	%f22
	movgu	%icc,	%i1,	%i3
	ldsb	[%l7 + 0x1E],	%l0
	srax	%i7,	%o7,	%o5
	edge32ln	%g5,	%g6,	%l3
	popc	0x156C,	%i0
	orcc	%o0,	0x06D8,	%o4
	fones	%f12
	movgu	%icc,	%g3,	%o2
	subc	%o1,	%i4,	%g2
	and	%g7,	0x0A34,	%l4
	movrgz	%o3,	0x1CE,	%g4
	popc	0x0CB2,	%i2
	sll	%l2,	%g1,	%l1
	ldd	[%l7 + 0x50],	%f0
	fpsub32s	%f21,	%f20,	%f12
	edge16l	%i5,	%l6,	%i6
	sethi	0x1A92,	%l5
	edge32n	%o6,	%i1,	%l0
	fpack32	%f10,	%f14,	%f30
	movpos	%icc,	%i3,	%i7
	subc	%o5,	%o7,	%g5
	movl	%icc,	%l3,	%i0
	orcc	%o0,	%o4,	%g3
	movre	%o2,	0x1F1,	%g6
	fmovdg	%xcc,	%f22,	%f15
	fmovs	%f8,	%f28
	subccc	%o1,	0x1B3B,	%g2
	sub	%i4,	%g7,	%l4
	fmovse	%xcc,	%f28,	%f7
	popc	%o3,	%i2
	fnot1s	%f0,	%f26
	ldsb	[%l7 + 0x29],	%l2
	movvs	%xcc,	%g4,	%g1
	ldsh	[%l7 + 0x72],	%i5
	subc	%l6,	%l1,	%l5
	umul	%i6,	%o6,	%l0
	movn	%xcc,	%i3,	%i7
	ld	[%l7 + 0x50],	%f6
	sra	%o5,	0x0E,	%o7
	mulscc	%i1,	%g5,	%i0
	movre	%l3,	0x1CF,	%o0
	fxors	%f7,	%f18,	%f11
	edge8n	%g3,	%o2,	%g6
	mulx	%o1,	0x0C38,	%o4
	fornot1s	%f10,	%f27,	%f7
	fands	%f26,	%f16,	%f26
	movrgez	%g2,	0x211,	%g7
	andncc	%i4,	%o3,	%l4
	edge16l	%i2,	%l2,	%g1
	edge32n	%i5,	%g4,	%l1
	fmovdn	%icc,	%f6,	%f11
	fmovrdgz	%l5,	%f14,	%f6
	srlx	%l6,	%o6,	%l0
	movcc	%icc,	%i3,	%i6
	fcmpd	%fcc1,	%f6,	%f8
	mulscc	%i7,	0x1C97,	%o5
	fmovscs	%xcc,	%f23,	%f12
	or	%i1,	%o7,	%g5
	st	%f9,	[%l7 + 0x68]
	stx	%i0,	[%l7 + 0x70]
	ldub	[%l7 + 0x17],	%o0
	movcc	%xcc,	%g3,	%o2
	or	%l3,	0x016D,	%g6
	or	%o4,	%o1,	%g2
	subccc	%i4,	0x03C9,	%o3
	fandnot2	%f26,	%f2,	%f0
	or	%g7,	%l4,	%l2
	movrgz	%g1,	%i2,	%i5
	udivcc	%g4,	0x1CB5,	%l5
	movrlz	%l6,	0x1B0,	%o6
	fmovsne	%icc,	%f4,	%f21
	fpack16	%f20,	%f29
	umul	%l1,	%i3,	%l0
	mulx	%i7,	0x16F2,	%o5
	udivx	%i6,	0x0964,	%i1
	movl	%icc,	%g5,	%i0
	lduw	[%l7 + 0x54],	%o7
	movl	%xcc,	%g3,	%o2
	srax	%o0,	0x0A,	%l3
	movpos	%icc,	%o4,	%g6
	add	%g2,	0x0841,	%i4
	movrlez	%o1,	0x1D4,	%o3
	edge16n	%g7,	%l4,	%g1
	sra	%i2,	%l2,	%g4
	alignaddrl	%l5,	%l6,	%i5
	umul	%o6,	%l1,	%l0
	mulscc	%i7,	0x0D7E,	%i3
	sll	%i6,	0x12,	%i1
	std	%f28,	[%l7 + 0x10]
	movvs	%icc,	%g5,	%i0
	fand	%f8,	%f28,	%f6
	edge32	%o7,	%g3,	%o5
	xor	%o0,	0x1D77,	%o2
	ldsh	[%l7 + 0x3E],	%o4
	alignaddrl	%l3,	%g6,	%i4
	or	%g2,	0x1328,	%o1
	addcc	%o3,	0x021A,	%l4
	udiv	%g1,	0x0FE8,	%g7
	sdiv	%l2,	0x0E74,	%g4
	fmovscs	%xcc,	%f23,	%f30
	movneg	%xcc,	%l5,	%i2
	edge8ln	%l6,	%i5,	%o6
	edge8l	%l0,	%i7,	%i3
	fpadd32s	%f5,	%f20,	%f9
	xorcc	%i6,	%i1,	%g5
	ldsb	[%l7 + 0x10],	%l1
	fmovsleu	%xcc,	%f31,	%f1
	array16	%i0,	%o7,	%o5
	fzero	%f14
	edge16	%o0,	%o2,	%o4
	for	%f26,	%f8,	%f28
	fmovsleu	%icc,	%f27,	%f17
	lduw	[%l7 + 0x50],	%g3
	and	%g6,	%i4,	%g2
	fornot2	%f20,	%f8,	%f18
	xnorcc	%o1,	0x04A7,	%o3
	fmovdcs	%icc,	%f10,	%f24
	array8	%l3,	%l4,	%g1
	orncc	%g7,	0x0503,	%l2
	nop
	set	0x20, %g3
	std	%f4,	[%l7 + %g3]
	fornot2	%f2,	%f30,	%f30
	movle	%xcc,	%l5,	%g4
	fmovd	%f26,	%f28
	ldsw	[%l7 + 0x40],	%i2
	alignaddr	%i5,	%o6,	%l6
	movcs	%icc,	%i7,	%l0
	lduw	[%l7 + 0x4C],	%i6
	movcs	%xcc,	%i1,	%i3
	movrlz	%g5,	%i0,	%l1
	srl	%o7,	%o5,	%o2
	subc	%o0,	%o4,	%g6
	movrgez	%g3,	%i4,	%o1
	ldd	[%l7 + 0x70],	%o2
	lduh	[%l7 + 0x2E],	%g2
	srax	%l3,	0x00,	%l4
	stb	%g1,	[%l7 + 0x12]
	ldd	[%l7 + 0x10],	%f16
	ldsb	[%l7 + 0x0B],	%g7
	movvc	%xcc,	%l5,	%g4
	edge32ln	%l2,	%i5,	%o6
	or	%i2,	%i7,	%l6
	fpadd32	%f4,	%f30,	%f8
	movgu	%icc,	%l0,	%i6
	fone	%f26
	fpadd16	%f10,	%f22,	%f16
	movl	%xcc,	%i1,	%g5
	movl	%icc,	%i0,	%i3
	srlx	%o7,	%o5,	%l1
	std	%f16,	[%l7 + 0x78]
	nop
	set	0x5C, %g2
	ldsb	[%l7 + %g2],	%o0
	fmovdpos	%icc,	%f5,	%f18
	sdivcc	%o4,	0x0A6A,	%o2
	alignaddr	%g3,	%g6,	%o1
	fabsd	%f6,	%f4
	ldub	[%l7 + 0x58],	%i4
	srlx	%o3,	%g2,	%l4
	fnors	%f20,	%f9,	%f15
	lduw	[%l7 + 0x08],	%l3
	array16	%g7,	%g1,	%l5
	andn	%l2,	0x1DFE,	%i5
	lduh	[%l7 + 0x34],	%o6
	ldx	[%l7 + 0x58],	%g4
	movrgez	%i7,	%i2,	%l6
	fexpand	%f1,	%f24
	orn	%l0,	0x11F8,	%i6
	umulcc	%g5,	%i1,	%i0
	add	%i3,	0x030C,	%o5
	fmovdcs	%xcc,	%f26,	%f2
	andn	%o7,	%l1,	%o4
	std	%f12,	[%l7 + 0x08]
	mulx	%o0,	%g3,	%g6
	array32	%o2,	%i4,	%o3
	andn	%o1,	%l4,	%g2
	sllx	%l3,	%g7,	%g1
	fcmpne16	%f16,	%f0,	%l2
	nop
	set	0x3B, %g1
	ldsb	[%l7 + %g1],	%i5
	array8	%o6,	%l5,	%i7
	fandnot1	%f28,	%f2,	%f12
	movge	%icc,	%i2,	%l6
	ldd	[%l7 + 0x70],	%l0
	addccc	%i6,	%g5,	%i1
	std	%f14,	[%l7 + 0x28]
	nop
	set	0x39, %l3
	ldsb	[%l7 + %l3],	%g4
	mulscc	%i0,	%o5,	%o7
	stx	%l1,	[%l7 + 0x50]
	sll	%o4,	0x0F,	%o0
	faligndata	%f20,	%f30,	%f6
	smulcc	%g3,	0x1E02,	%i3
	fpmerge	%f19,	%f5,	%f4
	ldub	[%l7 + 0x38],	%g6
	fabsd	%f16,	%f18
	alignaddr	%o2,	%o3,	%i4
	fnors	%f8,	%f19,	%f19
	stw	%l4,	[%l7 + 0x68]
	fmovd	%f8,	%f4
	edge16	%g2,	%l3,	%g7
	movvs	%xcc,	%g1,	%o1
	fmovsvc	%icc,	%f26,	%f17
	or	%l2,	%i5,	%l5
	fmovdg	%xcc,	%f25,	%f30
	fmovsvs	%icc,	%f9,	%f18
	movcc	%xcc,	%i7,	%i2
	mova	%icc,	%l6,	%l0
	ldsb	[%l7 + 0x4D],	%o6
	addc	%g5,	0x0AD8,	%i6
	edge32l	%i1,	%i0,	%o5
	fnot1s	%f0,	%f7
	andcc	%g4,	%o7,	%l1
	stw	%o0,	[%l7 + 0x70]
	stw	%g3,	[%l7 + 0x20]
	fmuld8sux16	%f27,	%f15,	%f16
	edge8ln	%i3,	%o4,	%g6
	fmovdvc	%xcc,	%f5,	%f3
	mulscc	%o2,	%i4,	%l4
	mova	%xcc,	%g2,	%o3
	ldub	[%l7 + 0x4C],	%l3
	or	%g7,	0x0910,	%g1
	sethi	0x09F9,	%l2
	std	%f4,	[%l7 + 0x70]
	lduw	[%l7 + 0x40],	%i5
	ldx	[%l7 + 0x38],	%l5
	ldsh	[%l7 + 0x0E],	%o1
	xnorcc	%i2,	%i7,	%l6
	fcmpne16	%f8,	%f26,	%l0
	orcc	%g5,	%i6,	%o6
	sethi	0x1B18,	%i0
	movg	%icc,	%o5,	%g4
	popc	%i1,	%o7
	sir	0x16AF
	move	%xcc,	%l1,	%o0
	array8	%g3,	%o4,	%i3
	edge8l	%g6,	%i4,	%l4
	xnorcc	%o2,	0x10C4,	%o3
	addccc	%g2,	%g7,	%l3
	movrlz	%l2,	%g1,	%l5
	and	%o1,	%i5,	%i7
	orncc	%i2,	0x193B,	%l0
	orcc	%l6,	%i6,	%o6
	sth	%i0,	[%l7 + 0x52]
	fmovdvc	%icc,	%f27,	%f26
	mova	%xcc,	%o5,	%g4
	sethi	0x16FD,	%i1
	add	%o7,	%g5,	%l1
	sll	%o0,	0x17,	%o4
	sth	%i3,	[%l7 + 0x5E]
	stx	%g6,	[%l7 + 0x18]
	fmovdl	%icc,	%f6,	%f17
	movrgez	%i4,	%g3,	%o2
	sdiv	%l4,	0x162F,	%o3
	movvs	%icc,	%g7,	%g2
	udiv	%l2,	0x08F0,	%l3
	sra	%g1,	0x18,	%l5
	edge8n	%o1,	%i7,	%i5
	ldx	[%l7 + 0x48],	%l0
	xor	%l6,	%i6,	%o6
	xorcc	%i0,	0x175D,	%i2
	movvs	%icc,	%g4,	%o5
	movcs	%icc,	%i1,	%o7
	fornot2s	%f4,	%f1,	%f20
	fmovrdlz	%g5,	%f10,	%f16
	sir	0x0D11
	edge8	%l1,	%o4,	%i3
	fornot1	%f18,	%f12,	%f2
	sdiv	%g6,	0x1F05,	%o0
	edge32ln	%g3,	%i4,	%o2
	edge32ln	%l4,	%g7,	%o3
	fpsub16s	%f7,	%f26,	%f29
	smul	%g2,	%l3,	%g1
	stb	%l5,	[%l7 + 0x68]
	ldd	[%l7 + 0x38],	%f18
	fmovrsne	%l2,	%f11,	%f20
	fmovrsgz	%i7,	%f22,	%f31
	fzero	%f30
	smulcc	%i5,	0x0BD7,	%o1
	fmovsleu	%xcc,	%f20,	%f9
	movrne	%l6,	%l0,	%i6
	edge8n	%i0,	%o6,	%i2
	fpadd16s	%f13,	%f3,	%f11
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	fornot1	%f24,	%f0,	%f0
	movvs	%xcc,	%o5,	%o7
	movvs	%icc,	%g5,	%l1
	ldub	[%l7 + 0x0A],	%o4
	umulcc	%g6,	0x160F,	%o0
	subccc	%i3,	%g3,	%o2
	alignaddrl	%i4,	%g7,	%l4
	umulcc	%o3,	0x089A,	%l3
	edge16l	%g2,	%g1,	%l5
	mulscc	%l2,	%i5,	%o1
	sth	%l6,	[%l7 + 0x62]
	ldsw	[%l7 + 0x5C],	%l0
	ldub	[%l7 + 0x3A],	%i6
	smulcc	%i7,	%o6,	%i2
	movne	%xcc,	%i0,	%g4
	addccc	%i1,	0x0494,	%o7
	lduw	[%l7 + 0x38],	%g5
	srax	%o5,	%o4,	%l1
	array32	%g6,	%i3,	%g3
	xnor	%o2,	0x1455,	%o0
	smul	%g7,	%i4,	%l4
	fmovrslez	%l3,	%f14,	%f27
	fmovrse	%g2,	%f20,	%f29
	fmul8x16	%f29,	%f22,	%f16
	fsrc1	%f2,	%f2
	movrgz	%o3,	0x391,	%l5
	edge16n	%l2,	%g1,	%i5
	stw	%l6,	[%l7 + 0x4C]
	fmovrdne	%o1,	%f6,	%f26
	xnor	%l0,	0x07D5,	%i6
	movg	%icc,	%o6,	%i7
	alignaddrl	%i2,	%i0,	%g4
	fpackfix	%f18,	%f31
	fabsd	%f30,	%f26
	fmovscc	%xcc,	%f31,	%f2
	mulx	%i1,	0x105A,	%g5
	save %o7, %o5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	%i3,	%l1
	xor	%o2,	%o0,	%g7
	mulscc	%g3,	0x0649,	%i4
	xnor	%l4,	0x1BDC,	%g2
	alignaddr	%l3,	%o3,	%l2
	stx	%g1,	[%l7 + 0x28]
	movl	%xcc,	%l5,	%i5
	subccc	%o1,	0x1FF2,	%l6
	ldsh	[%l7 + 0x7C],	%i6
	fmovdle	%xcc,	%f6,	%f16
	fmovse	%icc,	%f14,	%f9
	mulscc	%l0,	%o6,	%i2
	edge32	%i0,	%g4,	%i1
	sllx	%g5,	%i7,	%o7
	lduh	[%l7 + 0x44],	%o5
	fxors	%f10,	%f11,	%f4
	fxor	%f6,	%f28,	%f4
	fnot1	%f8,	%f16
	fsrc2	%f20,	%f28
	ldub	[%l7 + 0x0F],	%g6
	smul	%o4,	%i3,	%l1
	xorcc	%o2,	%o0,	%g3
	nop
	set	0x50, %l5
	std	%f12,	[%l7 + %l5]
	fcmps	%fcc3,	%f7,	%f10
	and	%i4,	0x122E,	%l4
	lduw	[%l7 + 0x48],	%g2
	srax	%l3,	%o3,	%g7
	edge8l	%g1,	%l5,	%l2
	fmovrsgz	%i5,	%f31,	%f15
	fmovsl	%xcc,	%f6,	%f19
	fandnot2	%f4,	%f2,	%f8
	umulcc	%l6,	%o1,	%l0
	xor	%o6,	%i2,	%i6
	addccc	%i0,	%i1,	%g4
	sdiv	%g5,	0x1B49,	%i7
	fcmpne16	%f18,	%f30,	%o7
	fpadd16	%f0,	%f12,	%f0
	edge16n	%o5,	%g6,	%o4
	xnorcc	%i3,	%o2,	%l1
	mulx	%o0,	0x0C82,	%g3
	xorcc	%i4,	%l4,	%l3
	for	%f20,	%f12,	%f16
	addc	%o3,	%g2,	%g1
	fands	%f3,	%f29,	%f16
	array8	%g7,	%l2,	%i5
	ldsh	[%l7 + 0x22],	%l5
	andncc	%o1,	%l0,	%l6
	popc	0x0596,	%i2
	udiv	%i6,	0x176F,	%o6
	fpsub16	%f2,	%f12,	%f6
	mulscc	%i1,	%i0,	%g4
	fmovse	%xcc,	%f20,	%f29
	xor	%g5,	%i7,	%o7
	fmovdcs	%icc,	%f27,	%f12
	edge32l	%o5,	%o4,	%i3
	smul	%o2,	0x1158,	%g6
	edge8l	%l1,	%g3,	%i4
	subcc	%o0,	0x16F0,	%l4
	fmovrslez	%l3,	%f23,	%f31
	alignaddr	%o3,	%g1,	%g2
	andncc	%l2,	%i5,	%l5
	edge8n	%g7,	%l0,	%o1
	edge8ln	%l6,	%i2,	%o6
	ldd	[%l7 + 0x70],	%f20
	and	%i1,	%i6,	%g4
	save %g5, %i0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i7,	%o5,	%o4
	edge32	%i3,	%g6,	%l1
	fpack16	%f20,	%f22
	addcc	%g3,	%i4,	%o2
	st	%f5,	[%l7 + 0x4C]
	mulscc	%l4,	%o0,	%l3
	xnorcc	%g1,	0x1F16,	%o3
	udiv	%g2,	0x114A,	%l2
	fmovsn	%icc,	%f7,	%f1
	ldx	[%l7 + 0x18],	%i5
	movl	%icc,	%g7,	%l5
	fmovdge	%xcc,	%f29,	%f28
	sdivcc	%o1,	0x0DFB,	%l0
	edge8l	%l6,	%o6,	%i1
	stx	%i6,	[%l7 + 0x78]
	xor	%g4,	0x0506,	%i2
	smul	%g5,	0x1C23,	%i0
	mova	%icc,	%o7,	%o5
	movre	%o4,	%i7,	%g6
	udiv	%l1,	0x0828,	%i3
	movrgz	%g3,	%i4,	%l4
	fpadd32s	%f12,	%f30,	%f20
	fpsub16s	%f10,	%f13,	%f19
	subc	%o0,	0x07E9,	%o2
	edge8n	%g1,	%o3,	%g2
	save %l3, 0x1640, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g7,	0x18EC,	%l5
	movn	%xcc,	%o1,	%l0
	edge8l	%i5,	%l6,	%i1
	fmovrslz	%i6,	%f19,	%f15
	sir	0x158F
	edge8l	%g4,	%o6,	%g5
	save %i2, %i0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o4,	0x0BFF,	%i7
	andcc	%g6,	%l1,	%i3
	array8	%g3,	%i4,	%l4
	edge8	%o5,	%o0,	%o2
	ld	[%l7 + 0x70],	%f20
	lduh	[%l7 + 0x42],	%g1
	st	%f17,	[%l7 + 0x10]
	movleu	%icc,	%g2,	%l3
	addcc	%l2,	%o3,	%l5
	sllx	%g7,	%o1,	%l0
	sdiv	%l6,	0x1C51,	%i5
	save %i6, 0x1BAA, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o6,	%g4
	edge32	%g5,	%i2,	%i0
	addccc	%o4,	0x11C2,	%i7
	umul	%g6,	0x0721,	%o7
	xor	%l1,	0x1430,	%g3
	fnegd	%f18,	%f20
	nop
	set	0x24, %l2
	ldsw	[%l7 + %l2],	%i4
	udiv	%l4,	0x0593,	%i3
	fmovrdgez	%o0,	%f16,	%f12
	fcmpgt32	%f24,	%f6,	%o2
	alignaddr	%g1,	%o5,	%l3
	movre	%g2,	0x14D,	%o3
	st	%f23,	[%l7 + 0x50]
	fmovsge	%icc,	%f21,	%f2
	sra	%l5,	%l2,	%g7
	fexpand	%f21,	%f30
	fnand	%f26,	%f12,	%f2
	umul	%l0,	%l6,	%o1
	movcs	%xcc,	%i6,	%i1
	movneg	%xcc,	%o6,	%i5
	fmovda	%xcc,	%f11,	%f12
	movrgez	%g5,	0x20B,	%g4
	fxnors	%f31,	%f22,	%f2
	orcc	%i0,	%o4,	%i7
	sdivx	%g6,	0x0634,	%o7
	fpmerge	%f6,	%f17,	%f22
	sll	%i2,	%g3,	%i4
	subccc	%l1,	%l4,	%o0
	fexpand	%f27,	%f4
	addccc	%i3,	0x03B2,	%o2
	edge32l	%g1,	%o5,	%l3
	orncc	%g2,	0x037B,	%o3
	stw	%l5,	[%l7 + 0x64]
	andncc	%g7,	%l0,	%l2
	movle	%icc,	%l6,	%i6
	lduh	[%l7 + 0x56],	%o1
	movvs	%xcc,	%o6,	%i5
	udivcc	%g5,	0x0A83,	%g4
	andcc	%i0,	%o4,	%i7
	orncc	%g6,	0x15A5,	%o7
	ld	[%l7 + 0x4C],	%f26
	stw	%i2,	[%l7 + 0x34]
	xnorcc	%g3,	0x03D4,	%i4
	ldd	[%l7 + 0x38],	%f6
	udivcc	%i1,	0x108E,	%l1
	fmovscs	%xcc,	%f10,	%f31
	srlx	%l4,	%o0,	%o2
	umulcc	%g1,	0x0030,	%o5
	edge32	%l3,	%g2,	%i3
	umulcc	%o3,	0x0412,	%g7
	ld	[%l7 + 0x28],	%f15
	sdiv	%l5,	0x12FF,	%l2
	edge8n	%l6,	%i6,	%o1
	edge32	%l0,	%i5,	%o6
	mova	%xcc,	%g4,	%i0
	fmovrsgz	%o4,	%f22,	%f31
	addccc	%i7,	0x186F,	%g5
	fmovdcc	%xcc,	%f20,	%f4
	stx	%g6,	[%l7 + 0x68]
	ldsw	[%l7 + 0x10],	%i2
	edge8ln	%o7,	%i4,	%i1
	edge8	%g3,	%l1,	%l4
	fpsub16s	%f20,	%f13,	%f2
	popc	%o2,	%g1
	xorcc	%o5,	0x17DB,	%l3
	fpsub16s	%f6,	%f14,	%f0
	ldd	[%l7 + 0x20],	%f4
	fmul8x16au	%f23,	%f5,	%f4
	ldx	[%l7 + 0x70],	%o0
	restore %g2, %o3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%f10
	fnors	%f15,	%f15,	%f26
	edge32n	%g7,	%l5,	%l6
	array8	%i6,	%o1,	%l0
	orncc	%i5,	0x1B2D,	%l2
	edge8l	%o6,	%g4,	%o4
	edge8ln	%i7,	%g5,	%i0
	edge16n	%i2,	%o7,	%i4
	edge32	%i1,	%g3,	%l1
	ldx	[%l7 + 0x78],	%l4
	fsrc2	%f0,	%f10
	fandnot1s	%f27,	%f11,	%f29
	fmovdgu	%icc,	%f24,	%f9
	fcmpgt16	%f24,	%f6,	%o2
	movre	%g6,	0x1E7,	%g1
	ldd	[%l7 + 0x10],	%o4
	andcc	%o0,	%l3,	%g2
	xnorcc	%i3,	%g7,	%l5
	sth	%o3,	[%l7 + 0x3C]
	nop
	set	0x50, %i0
	ldx	[%l7 + %i0],	%l6
	ldd	[%l7 + 0x58],	%f8
	movvs	%xcc,	%o1,	%l0
	fmovrdlez	%i5,	%f26,	%f28
	orcc	%i6,	0x0EBC,	%l2
	addcc	%o6,	0x05DB,	%o4
	edge8ln	%i7,	%g5,	%i0
	fmovdn	%xcc,	%f27,	%f29
	subcc	%i2,	0x0FA8,	%o7
	edge8l	%i4,	%i1,	%g3
	fmovsn	%icc,	%f2,	%f31
	lduh	[%l7 + 0x64],	%l1
	fmuld8sux16	%f21,	%f26,	%f2
	subc	%l4,	0x11BE,	%g4
	orncc	%g6,	%o2,	%g1
	stx	%o0,	[%l7 + 0x08]
	ld	[%l7 + 0x50],	%f30
	fmovrdgz	%o5,	%f30,	%f12
	movge	%icc,	%l3,	%i3
	movvc	%icc,	%g2,	%g7
	array16	%o3,	%l6,	%l5
	add	%o1,	%i5,	%l0
	ldub	[%l7 + 0x0B],	%i6
	fxnors	%f12,	%f9,	%f1
	ldd	[%l7 + 0x08],	%f4
	edge8n	%o6,	%l2,	%o4
	edge32l	%g5,	%i7,	%i2
	ldx	[%l7 + 0x48],	%o7
	andcc	%i0,	%i1,	%i4
	array32	%l1,	%g3,	%g4
	or	%l4,	%o2,	%g6
	sdiv	%g1,	0x02E8,	%o5
	orn	%l3,	%o0,	%g2
	udiv	%i3,	0x1185,	%g7
	fmovdleu	%xcc,	%f3,	%f6
	alignaddrl	%o3,	%l6,	%o1
	subc	%l5,	0x02AC,	%l0
	umul	%i6,	0x0D8B,	%o6
	orn	%i5,	%l2,	%o4
	fmuld8ulx16	%f21,	%f5,	%f18
	st	%f28,	[%l7 + 0x1C]
	movle	%xcc,	%i7,	%g5
	movl	%icc,	%i2,	%o7
	srax	%i1,	%i4,	%l1
	movg	%icc,	%i0,	%g4
	fsrc1	%f14,	%f2
	fxor	%f26,	%f22,	%f10
	nop
	set	0x1C, %o6
	lduh	[%l7 + %o6],	%g3
	movre	%o2,	0x3C1,	%g6
	movvs	%xcc,	%g1,	%l4
	srl	%o5,	%l3,	%g2
	srl	%o0,	0x0B,	%g7
	fone	%f18
	fornot2	%f8,	%f22,	%f12
	sra	%o3,	0x18,	%i3
	srlx	%o1,	%l5,	%l0
	movgu	%icc,	%i6,	%o6
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	fandnot1	%f26,	%f30,	%f24
	srax	%i7,	0x06,	%g5
	mova	%xcc,	%l2,	%o7
	sth	%i2,	[%l7 + 0x14]
	smulcc	%i1,	0x11C7,	%l1
	sub	%i4,	0x0EFF,	%i0
	sub	%g4,	0x1EE8,	%g3
	xorcc	%g6,	0x1A67,	%g1
	edge32	%l4,	%o5,	%o2
	movpos	%xcc,	%g2,	%o0
	fmovrdlz	%l3,	%f0,	%f6
	umul	%g7,	%o3,	%i3
	fmovdg	%icc,	%f8,	%f0
	movleu	%xcc,	%l5,	%o1
	umulcc	%l0,	0x1DF8,	%o6
	fmovscc	%icc,	%f7,	%f4
	fornot2	%f0,	%f16,	%f0
	st	%f9,	[%l7 + 0x58]
	xor	%i5,	0x09FA,	%i6
	movcs	%icc,	%o4,	%i7
	fnegd	%f28,	%f10
	srl	%l6,	0x14,	%l2
	edge32	%g5,	%o7,	%i2
	fcmpeq32	%f2,	%f24,	%l1
	alignaddrl	%i4,	%i1,	%i0
	edge8n	%g4,	%g6,	%g1
	movrne	%l4,	%o5,	%g3
	ldsb	[%l7 + 0x6E],	%g2
	fmovdcc	%xcc,	%f25,	%f22
	edge32n	%o0,	%l3,	%g7
	ld	[%l7 + 0x28],	%f14
	sllx	%o3,	%o2,	%i3
	movvc	%xcc,	%o1,	%l0
	ldsb	[%l7 + 0x3D],	%l5
	ldsh	[%l7 + 0x4A],	%i5
	sra	%o6,	0x0D,	%o4
	fpsub32s	%f6,	%f20,	%f3
	udivx	%i7,	0x05AC,	%l6
	ldx	[%l7 + 0x20],	%i6
	xorcc	%g5,	0x0FDA,	%l2
	udiv	%o7,	0x1066,	%l1
	fmovdge	%xcc,	%f17,	%f27
	edge16l	%i2,	%i4,	%i1
	addccc	%i0,	%g4,	%g1
	mova	%xcc,	%g6,	%l4
	fabsd	%f4,	%f10
	edge16	%o5,	%g3,	%o0
	movrgez	%g2,	%g7,	%l3
	movcc	%xcc,	%o2,	%i3
	addc	%o3,	0x00A6,	%o1
	fnegd	%f30,	%f22
	edge32l	%l5,	%l0,	%i5
	edge16ln	%o4,	%i7,	%o6
	alignaddrl	%i6,	%l6,	%g5
	movleu	%xcc,	%o7,	%l1
	sllx	%i2,	0x07,	%l2
	movrne	%i4,	0x1DB,	%i1
	movpos	%icc,	%i0,	%g1
	movrlz	%g4,	0x1D6,	%l4
	smulcc	%g6,	%o5,	%g3
	fcmpgt32	%f30,	%f16,	%g2
	edge32	%g7,	%o0,	%o2
	srl	%l3,	%i3,	%o1
	movrlez	%l5,	%l0,	%o3
	orncc	%i5,	0x19E6,	%i7
	edge8n	%o6,	%o4,	%i6
	smulcc	%g5,	0x0BC1,	%o7
	movleu	%icc,	%l1,	%l6
	stb	%i2,	[%l7 + 0x26]
	smul	%i4,	0x06A9,	%i1
	fmovdn	%icc,	%f1,	%f15
	movrlz	%i0,	%l2,	%g4
	alignaddr	%g1,	%g6,	%o5
	xor	%g3,	0x058E,	%g2
	fandnot1s	%f10,	%f22,	%f28
	andncc	%g7,	%l4,	%o2
	movl	%xcc,	%l3,	%i3
	srax	%o1,	%l5,	%o0
	orn	%l0,	%i5,	%i7
	sdiv	%o3,	0x1718,	%o6
	udivx	%o4,	0x0649,	%g5
	std	%f18,	[%l7 + 0x58]
	fand	%f16,	%f26,	%f20
	sllx	%o7,	0x07,	%l1
	ld	[%l7 + 0x78],	%f27
	andcc	%l6,	%i6,	%i2
	movrgz	%i4,	%i0,	%l2
	stb	%g4,	[%l7 + 0x2C]
	array16	%i1,	%g6,	%g1
	lduh	[%l7 + 0x42],	%o5
	fcmple16	%f22,	%f8,	%g3
	fcmpne32	%f10,	%f28,	%g2
	fnot1	%f20,	%f24
	fpadd32s	%f25,	%f24,	%f28
	movle	%xcc,	%l4,	%g7
	movrne	%o2,	%i3,	%o1
	fones	%f27
	nop
	set	0x38, %i1
	std	%f28,	[%l7 + %i1]
	add	%l3,	%o0,	%l5
	srl	%l0,	%i7,	%o3
	edge8n	%i5,	%o6,	%g5
	fand	%f16,	%f24,	%f10
	fmovdvs	%xcc,	%f10,	%f10
	lduw	[%l7 + 0x0C],	%o7
	alignaddrl	%o4,	%l1,	%l6
	orncc	%i2,	%i6,	%i0
	ldd	[%l7 + 0x70],	%f26
	popc	%l2,	%g4
	fornot1	%f6,	%f16,	%f22
	sub	%i4,	0x1B77,	%i1
	fornot1s	%f13,	%f3,	%f12
	std	%f28,	[%l7 + 0x20]
	srl	%g6,	0x1B,	%o5
	mova	%xcc,	%g1,	%g3
	addccc	%g2,	0x1C05,	%g7
	lduw	[%l7 + 0x10],	%o2
	fmovrse	%l4,	%f3,	%f1
	movrgz	%i3,	0x36D,	%o1
	fcmple16	%f2,	%f20,	%o0
	addc	%l3,	%l0,	%l5
	array16	%i7,	%o3,	%o6
	xorcc	%i5,	0x0366,	%o7
	umul	%o4,	%g5,	%l6
	edge16ln	%i2,	%i6,	%l1
	edge8n	%l2,	%i0,	%i4
	bshuffle	%f18,	%f14,	%f12
	ldsb	[%l7 + 0x34],	%g4
	ldd	[%l7 + 0x08],	%f26
	ldd	[%l7 + 0x68],	%f2
	fpack16	%f10,	%f17
	xnor	%i1,	%g6,	%g1
	movneg	%icc,	%g3,	%g2
	udiv	%g7,	0x00FF,	%o5
	movpos	%icc,	%l4,	%o2
	lduw	[%l7 + 0x28],	%i3
	move	%icc,	%o0,	%o1
	alignaddr	%l0,	%l5,	%l3
	ldd	[%l7 + 0x60],	%f6
	movrgz	%o3,	%o6,	%i5
	sdivcc	%o7,	0x0664,	%i7
	srax	%g5,	%l6,	%o4
	edge16n	%i6,	%l1,	%l2
	edge32n	%i0,	%i4,	%g4
	fmul8x16al	%f17,	%f28,	%f0
	lduw	[%l7 + 0x70],	%i2
	movrlez	%g6,	0x394,	%i1
	udiv	%g1,	0x1789,	%g3
	orcc	%g7,	0x0412,	%o5
	andn	%g2,	%o2,	%i3
	srlx	%o0,	0x09,	%o1
	edge32n	%l4,	%l5,	%l0
	and	%l3,	%o6,	%i5
	array32	%o3,	%o7,	%g5
	andcc	%l6,	0x1A5C,	%i7
	fmovdpos	%xcc,	%f20,	%f30
	mova	%xcc,	%i6,	%l1
	subcc	%l2,	%o4,	%i0
	fmovsleu	%xcc,	%f20,	%f19
	ldsh	[%l7 + 0x64],	%i4
	fabsd	%f0,	%f22
	movg	%icc,	%g4,	%g6
	movge	%icc,	%i1,	%g1
	fcmped	%fcc1,	%f8,	%f6
	move	%icc,	%g3,	%g7
	andcc	%o5,	0x132F,	%i2
	ldub	[%l7 + 0x0E],	%o2
	fpsub32	%f4,	%f28,	%f14
	subccc	%i3,	0x0426,	%o0
	edge8ln	%g2,	%o1,	%l5
	array8	%l0,	%l3,	%l4
	fnegs	%f22,	%f6
	save %i5, 0x02B7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f17,	%f8,	%f20
	array16	%o6,	%o7,	%g5
	fmovdge	%xcc,	%f21,	%f27
	sdivx	%i7,	0x08D9,	%i6
	alignaddr	%l6,	%l2,	%o4
	sdivcc	%i0,	0x16B9,	%l1
	udivcc	%i4,	0x1E0E,	%g6
	movvs	%icc,	%g4,	%i1
	alignaddrl	%g1,	%g7,	%g3
	fmovscs	%icc,	%f3,	%f17
	fpack32	%f6,	%f16,	%f10
	movrgz	%i2,	%o2,	%o5
	edge8l	%o0,	%g2,	%o1
	and	%i3,	%l0,	%l5
	orcc	%l3,	%l4,	%o3
	or	%i5,	0x0082,	%o7
	fzeros	%f29
	alignaddr	%o6,	%g5,	%i6
	bshuffle	%f14,	%f0,	%f28
	movrlez	%l6,	%i7,	%o4
	udivcc	%l2,	0x168A,	%l1
	xnor	%i0,	0x161B,	%g6
	movcs	%icc,	%g4,	%i4
	std	%f8,	[%l7 + 0x40]
	move	%icc,	%i1,	%g7
	fmovsneg	%icc,	%f5,	%f25
	lduw	[%l7 + 0x24],	%g1
	fmovse	%xcc,	%f2,	%f12
	st	%f26,	[%l7 + 0x08]
	fxors	%f5,	%f30,	%f13
	save %g3, 0x03EE, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f4,	%f20
	fcmpne16	%f10,	%f16,	%o2
	edge32n	%o5,	%o0,	%g2
	xor	%i3,	%o1,	%l0
	srlx	%l3,	0x19,	%l5
	array16	%l4,	%o3,	%i5
	edge8	%o6,	%g5,	%o7
	subccc	%l6,	0x0BB8,	%i7
	xor	%i6,	0x04A9,	%l2
	edge32l	%l1,	%i0,	%g6
	fmovrdgz	%g4,	%f6,	%f4
	edge16n	%i4,	%o4,	%g7
	edge8l	%g1,	%g3,	%i1
	addc	%i2,	%o5,	%o0
	movrlz	%o2,	0x0A9,	%g2
	fcmpes	%fcc3,	%f15,	%f23
	addccc	%i3,	%l0,	%o1
	movcs	%xcc,	%l3,	%l5
	movl	%xcc,	%l4,	%i5
	fmovsg	%xcc,	%f12,	%f25
	movn	%xcc,	%o3,	%g5
	fmovscs	%xcc,	%f1,	%f4
	sdiv	%o7,	0x1A95,	%l6
	edge16l	%o6,	%i6,	%l2
	movrlz	%l1,	%i7,	%i0
	fpadd32s	%f11,	%f12,	%f6
	stx	%g4,	[%l7 + 0x18]
	fxor	%f0,	%f12,	%f28
	srlx	%g6,	%i4,	%g7
	xnor	%g1,	%o4,	%i1
	fxnors	%f30,	%f27,	%f29
	edge16	%g3,	%i2,	%o0
	fmovsvs	%icc,	%f28,	%f16
	edge16l	%o2,	%g2,	%i3
	srl	%l0,	0x09,	%o5
	smulcc	%l3,	0x128C,	%o1
	fmovrdgz	%l4,	%f6,	%f0
	movvs	%icc,	%i5,	%o3
	movvs	%xcc,	%g5,	%l5
	xnor	%o7,	0x07F3,	%l6
	fmovse	%xcc,	%f16,	%f22
	subcc	%o6,	%i6,	%l1
	sethi	0x031B,	%l2
	edge8ln	%i7,	%i0,	%g4
	movre	%g6,	0x0D8,	%i4
	umul	%g7,	%g1,	%o4
	sth	%g3,	[%l7 + 0x0E]
	ldsh	[%l7 + 0x12],	%i1
	movg	%icc,	%o0,	%i2
	movrlez	%o2,	0x062,	%g2
	fmovdl	%xcc,	%f12,	%f15
	fpadd32s	%f25,	%f19,	%f24
	edge16n	%l0,	%i3,	%l3
	umulcc	%o1,	0x011B,	%l4
	fnegd	%f20,	%f12
	fpsub32	%f26,	%f18,	%f8
	alignaddrl	%i5,	%o5,	%g5
	subc	%o3,	0x1C2E,	%o7
	andn	%l5,	%o6,	%i6
	fzeros	%f1
	srl	%l1,	0x01,	%l6
	restore %i7, 0x108A, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g4,	%l2
	alignaddrl	%g6,	%i4,	%g7
	edge32n	%g1,	%o4,	%g3
	fzeros	%f8
	fmovdleu	%xcc,	%f24,	%f3
	fabss	%f5,	%f10
	udivcc	%i1,	0x1403,	%o0
	movrne	%o2,	0x115,	%i2
	fmovsgu	%xcc,	%f17,	%f12
	edge32	%l0,	%g2,	%i3
	sethi	0x07A0,	%l3
	andn	%o1,	0x0A0F,	%i5
	move	%icc,	%l4,	%o5
	movcs	%xcc,	%o3,	%o7
	srl	%l5,	0x07,	%o6
	mova	%icc,	%i6,	%l1
	orncc	%l6,	%g5,	%i7
	movcc	%xcc,	%g4,	%i0
	edge8ln	%l2,	%g6,	%i4
	fmovse	%icc,	%f6,	%f27
	stw	%g1,	[%l7 + 0x64]
	edge8ln	%o4,	%g7,	%i1
	movvs	%icc,	%g3,	%o2
	fmovsle	%icc,	%f13,	%f5
	edge32l	%o0,	%l0,	%i2
	fnegs	%f12,	%f17
	fmovdle	%icc,	%f26,	%f12
	andcc	%i3,	%g2,	%o1
	fmovda	%icc,	%f18,	%f19
	sdivx	%i5,	0x1046,	%l4
	sir	0x1D43
	fsrc2	%f6,	%f10
	fabss	%f18,	%f12
	fmul8x16al	%f1,	%f5,	%f18
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	fmovdcc	%xcc,	%f4,	%f20
	srlx	%o5,	0x0E,	%l5
	xnor	%i6,	0x0592,	%l1
	restore %o6, %g5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f6,	%f14
	movl	%icc,	%g4,	%i0
	fmovrdlz	%i7,	%f0,	%f0
	edge8n	%g6,	%i4,	%g1
	nop
	set	0x48, %i7
	ldd	[%l7 + %i7],	%f14
	edge32ln	%l2,	%o4,	%g7
	orn	%i1,	0x06E7,	%g3
	andcc	%o2,	0x04E1,	%l0
	andncc	%i2,	%i3,	%g2
	movrgez	%o0,	0x3C1,	%o1
	fxnors	%f23,	%f23,	%f11
	fmovsneg	%icc,	%f18,	%f6
	nop
	set	0x69, %o0
	stb	%i5,	[%l7 + %o0]
	fone	%f20
	or	%l4,	0x1E30,	%l3
	fabss	%f27,	%f10
	movrlez	%o7,	0x395,	%o5
	udivx	%l5,	0x117D,	%o3
	umul	%l1,	0x09E5,	%o6
	fmovspos	%icc,	%f13,	%f27
	movrne	%g5,	0x179,	%i6
	ldd	[%l7 + 0x18],	%f12
	movrlez	%l6,	0x1AC,	%i0
	fnot1	%f20,	%f2
	array32	%g4,	%g6,	%i7
	movge	%xcc,	%g1,	%i4
	subc	%l2,	%g7,	%i1
	fmul8sux16	%f28,	%f12,	%f12
	or	%o4,	0x0DE2,	%o2
	popc	%l0,	%g3
	movrlz	%i3,	0x367,	%i2
	movrlez	%o0,	%g2,	%i5
	fpadd16	%f14,	%f12,	%f28
	fmovda	%icc,	%f24,	%f20
	smul	%o1,	0x01F3,	%l4
	ld	[%l7 + 0x5C],	%f0
	fsrc2	%f4,	%f24
	save %o7, %o5, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l5,	%o3
	save %l1, %o6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g5,	%i0
	movre	%l6,	0x1D5,	%g4
	smulcc	%i7,	%g6,	%i4
	edge32l	%l2,	%g1,	%i1
	sir	0x17EB
	movgu	%icc,	%o4,	%g7
	ldd	[%l7 + 0x50],	%l0
	fands	%f17,	%f4,	%f31
	xorcc	%o2,	%i3,	%i2
	fnegs	%f9,	%f13
	ldx	[%l7 + 0x18],	%o0
	movrgez	%g2,	0x2A5,	%g3
	alignaddr	%o1,	%i5,	%o7
	sllx	%o5,	0x11,	%l3
	sdivcc	%l4,	0x0385,	%l5
	orcc	%l1,	0x0337,	%o3
	lduw	[%l7 + 0x70],	%o6
	ldsh	[%l7 + 0x48],	%g5
	movn	%icc,	%i0,	%l6
	sdivcc	%g4,	0x0236,	%i6
	mulx	%g6,	0x15A1,	%i7
	ldx	[%l7 + 0x38],	%i4
	array16	%g1,	%i1,	%o4
	stx	%l2,	[%l7 + 0x48]
	lduh	[%l7 + 0x36],	%g7
	movrlez	%l0,	0x054,	%o2
	lduw	[%l7 + 0x6C],	%i3
	xorcc	%o0,	0x1690,	%g2
	ldsw	[%l7 + 0x24],	%g3
	edge8	%i2,	%o1,	%i5
	ldd	[%l7 + 0x58],	%o4
	array32	%o7,	%l4,	%l3
	nop
	set	0x0C, %l4
	sth	%l1,	[%l7 + %l4]
	sdivx	%l5,	0x0BAE,	%o3
	ldd	[%l7 + 0x28],	%f16
	or	%o6,	%g5,	%i0
	subcc	%l6,	%i6,	%g4
	fornot2	%f24,	%f20,	%f16
	fmovdne	%xcc,	%f19,	%f23
	stx	%i7,	[%l7 + 0x18]
	movrgez	%i4,	%g1,	%g6
	popc	0x03A9,	%i1
	fmovdleu	%icc,	%f17,	%f27
	sir	0x0AB2
	ldsw	[%l7 + 0x58],	%o4
	srl	%g7,	%l2,	%o2
	alignaddrl	%l0,	%o0,	%g2
	orcc	%g3,	%i2,	%i3
	fpadd16	%f18,	%f12,	%f28
	ldx	[%l7 + 0x78],	%i5
	addc	%o1,	%o5,	%o7
	xnorcc	%l3,	%l1,	%l5
	subcc	%l4,	%o3,	%o6
	fpsub16s	%f24,	%f27,	%f19
	smulcc	%g5,	%l6,	%i6
	movle	%xcc,	%i0,	%i7
	ldsb	[%l7 + 0x6C],	%g4
	sll	%g1,	0x0B,	%i4
	movvs	%icc,	%i1,	%g6
	fpsub16s	%f30,	%f5,	%f15
	addc	%g7,	%o4,	%l2
	fpsub16	%f2,	%f22,	%f28
	subccc	%l0,	0x1497,	%o2
	and	%o0,	%g3,	%i2
	fpadd16	%f6,	%f2,	%f22
	or	%i3,	0x117A,	%g2
	alignaddrl	%i5,	%o1,	%o5
	movrlz	%o7,	%l1,	%l3
	mulscc	%l5,	0x1E52,	%o3
	std	%f28,	[%l7 + 0x30]
	fmovdl	%icc,	%f29,	%f14
	fmovscs	%xcc,	%f26,	%f24
	fmul8x16	%f2,	%f22,	%f16
	fcmpd	%fcc3,	%f0,	%f0
	fzeros	%f14
	orncc	%l4,	%o6,	%g5
	orncc	%l6,	%i0,	%i7
	alignaddrl	%g4,	%g1,	%i4
	ldd	[%l7 + 0x60],	%i0
	movne	%icc,	%i6,	%g6
	xnorcc	%o4,	%l2,	%g7
	edge16	%l0,	%o2,	%g3
	umulcc	%i2,	0x170A,	%i3
	smulcc	%g2,	%o0,	%i5
	fsrc1s	%f18,	%f21
	smul	%o5,	%o7,	%o1
	movgu	%icc,	%l1,	%l3
	stb	%l5,	[%l7 + 0x70]
	fand	%f20,	%f0,	%f30
	srax	%l4,	0x0C,	%o6
	fmul8x16au	%f6,	%f25,	%f16
	lduw	[%l7 + 0x0C],	%o3
	srlx	%l6,	%i0,	%g5
	edge8l	%i7,	%g4,	%i4
	movpos	%icc,	%g1,	%i1
	fpsub32s	%f14,	%f5,	%f11
	sdivx	%i6,	0x0582,	%g6
	move	%xcc,	%o4,	%l2
	fzeros	%f8
	sth	%g7,	[%l7 + 0x30]
	sra	%l0,	0x0A,	%g3
	mulscc	%i2,	0x06A4,	%i3
	edge16	%g2,	%o2,	%o0
	edge8ln	%i5,	%o5,	%o1
	andcc	%o7,	%l1,	%l5
	movcs	%xcc,	%l3,	%o6
	fxor	%f0,	%f22,	%f2
	nop
	set	0x30, %g5
	ldx	[%l7 + %g5],	%l4
	fornot2s	%f21,	%f4,	%f20
	edge16ln	%l6,	%o3,	%i0
	fmovrdlz	%i7,	%f2,	%f0
	orn	%g5,	%g4,	%i4
	fabsd	%f30,	%f16
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	movgu	%xcc,	%g6,	%l2
	ldd	[%l7 + 0x40],	%f10
	movn	%xcc,	%g7,	%l0
	fmul8x16al	%f14,	%f21,	%f2
	movvc	%icc,	%o4,	%i2
	movvs	%xcc,	%i3,	%g2
	subc	%g3,	0x0149,	%o2
	fmovdle	%xcc,	%f14,	%f8
	srlx	%i5,	0x08,	%o0
	fandnot1	%f30,	%f20,	%f8
	mulscc	%o5,	%o1,	%o7
	addccc	%l1,	0x0F15,	%l5
	andn	%l3,	%o6,	%l4
	sir	0x1D93
	sub	%l6,	%o3,	%i7
	alignaddr	%g5,	%i0,	%g4
	fmovsn	%xcc,	%f7,	%f21
	edge8	%i4,	%i6,	%i1
	orncc	%g1,	%g6,	%l2
	fmovdge	%icc,	%f25,	%f31
	sll	%g7,	0x1C,	%l0
	array8	%i2,	%o4,	%g2
	stb	%g3,	[%l7 + 0x45]
	sra	%o2,	0x0D,	%i3
	edge16l	%o0,	%o5,	%o1
	or	%i5,	%o7,	%l1
	stb	%l3,	[%l7 + 0x49]
	save %l5, 0x0AFD, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l4,	%o3,	%l6
	sub	%g5,	%i0,	%i7
	sub	%i4,	%g4,	%i1
	smul	%g1,	0x1F7F,	%g6
	pdist	%f20,	%f10,	%f8
	edge8l	%l2,	%g7,	%i6
	fnegd	%f12,	%f0
	movcc	%icc,	%l0,	%o4
	ldsw	[%l7 + 0x50],	%g2
	fmovscc	%xcc,	%f10,	%f23
	fmul8x16al	%f0,	%f17,	%f26
	orn	%g3,	0x09FD,	%o2
	or	%i2,	0x0A69,	%o0
	fornot1s	%f11,	%f6,	%f1
	alignaddr	%i3,	%o5,	%i5
	edge32l	%o1,	%o7,	%l1
	xor	%l5,	%l3,	%o6
	fmovrsgez	%o3,	%f27,	%f16
	move	%xcc,	%l6,	%l4
	fmul8ulx16	%f0,	%f18,	%f20
	sdiv	%i0,	0x0F58,	%i7
	andncc	%g5,	%g4,	%i1
	stw	%i4,	[%l7 + 0x78]
	fmul8x16al	%f7,	%f22,	%f10
	subc	%g6,	0x0580,	%l2
	nop
	set	0x12, %o7
	stb	%g1,	[%l7 + %o7]
	udivx	%g7,	0x04C5,	%l0
	subc	%i6,	0x1EA0,	%g2
	alignaddrl	%o4,	%g3,	%o2
	movge	%xcc,	%o0,	%i3
	fnegs	%f3,	%f15
	andcc	%i2,	%o5,	%o1
	fnands	%f24,	%f11,	%f18
	movrne	%o7,	0x0F1,	%i5
	subcc	%l5,	%l3,	%l1
	sra	%o6,	%l6,	%o3
	srl	%l4,	0x05,	%i0
	edge16	%g5,	%g4,	%i7
	fmovde	%icc,	%f23,	%f14
	st	%f15,	[%l7 + 0x40]
	subccc	%i4,	0x08CF,	%g6
	movrgez	%l2,	%g1,	%i1
	movrlez	%l0,	%g7,	%i6
	movrlez	%g2,	0x2E7,	%g3
	fmovdgu	%xcc,	%f16,	%f31
	fpadd32	%f30,	%f0,	%f24
	popc	%o2,	%o0
	movne	%xcc,	%o4,	%i3
	andcc	%i2,	0x0F19,	%o5
	udivcc	%o1,	0x0817,	%o7
	fpack32	%f22,	%f16,	%f12
	xorcc	%i5,	%l3,	%l5
	subc	%o6,	%l6,	%o3
	srax	%l4,	%l1,	%g5
	edge8n	%g4,	%i0,	%i7
	andncc	%g6,	%l2,	%i4
	ldsh	[%l7 + 0x64],	%i1
	movleu	%icc,	%l0,	%g7
	movrgez	%i6,	0x19E,	%g2
	fsrc2	%f28,	%f28
	sll	%g3,	%o2,	%g1
	edge16	%o0,	%o4,	%i2
	sethi	0x0873,	%o5
	fmul8sux16	%f22,	%f28,	%f30
	edge32ln	%i3,	%o1,	%o7
	ldd	[%l7 + 0x30],	%f8
	edge8n	%i5,	%l5,	%o6
	srl	%l6,	%l3,	%l4
	fmovdcs	%xcc,	%f0,	%f16
	movrlez	%l1,	0x26E,	%g5
	sir	0x0615
	sub	%o3,	%i0,	%i7
	popc	0x0626,	%g4
	edge8n	%l2,	%i4,	%g6
	mulx	%i1,	0x07F2,	%l0
	movrgez	%g7,	%i6,	%g2
	xnorcc	%g3,	0x1821,	%o2
	edge8ln	%o0,	%g1,	%i2
	move	%xcc,	%o5,	%i3
	sir	0x075A
	ldd	[%l7 + 0x70],	%o4
	edge32ln	%o1,	%o7,	%l5
	movcs	%icc,	%i5,	%o6
	xorcc	%l6,	0x02AD,	%l3
	restore %l1, %l4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x6C],	%i0
	fmovd	%f30,	%f20
	sth	%o3,	[%l7 + 0x60]
	nop
	set	0x6C, %l6
	lduh	[%l7 + %l6],	%g4
	umul	%i7,	0x1EC8,	%l2
	edge16	%i4,	%i1,	%g6
	fcmpne32	%f20,	%f30,	%g7
	movn	%xcc,	%l0,	%g2
	xnorcc	%i6,	%g3,	%o2
	fandnot2s	%f27,	%f12,	%f21
	xor	%g1,	%o0,	%i2
	fsrc2s	%f30,	%f20
	st	%f24,	[%l7 + 0x5C]
	fmovrdlez	%o5,	%f24,	%f4
	popc	%o4,	%i3
	lduw	[%l7 + 0x08],	%o7
	edge8ln	%l5,	%o1,	%i5
	movcs	%xcc,	%o6,	%l3
	fmovsl	%xcc,	%f5,	%f9
	fandnot1	%f22,	%f30,	%f26
	sra	%l1,	0x01,	%l4
	udiv	%l6,	0x0E5A,	%i0
	srax	%o3,	%g5,	%g4
	fmovdne	%xcc,	%f19,	%f15
	ldx	[%l7 + 0x70],	%l2
	movge	%xcc,	%i7,	%i4
	fmovrdne	%i1,	%f28,	%f18
	xorcc	%g6,	0x120F,	%g7
	xnorcc	%g2,	%l0,	%g3
	andn	%o2,	0x0698,	%g1
	fmovsvc	%icc,	%f19,	%f11
	umul	%i6,	0x09A9,	%o0
	edge32ln	%o5,	%o4,	%i2
	nop
	set	0x1C, %o1
	sth	%i3,	[%l7 + %o1]
	and	%o7,	0x0C14,	%o1
	movg	%icc,	%i5,	%o6
	lduh	[%l7 + 0x2C],	%l3
	movgu	%icc,	%l5,	%l1
	bshuffle	%f12,	%f24,	%f18
	lduh	[%l7 + 0x64],	%l4
	fornot2s	%f5,	%f28,	%f6
	movne	%xcc,	%l6,	%o3
	sub	%i0,	0x1D2D,	%g5
	ldsh	[%l7 + 0x5C],	%l2
	mova	%xcc,	%g4,	%i7
	fsrc2	%f4,	%f0
	stb	%i4,	[%l7 + 0x39]
	fcmple16	%f28,	%f26,	%g6
	mova	%icc,	%i1,	%g7
	fmul8ulx16	%f12,	%f2,	%f0
	fzeros	%f8
	fmovdpos	%xcc,	%f30,	%f24
	movrne	%l0,	0x19C,	%g2
	st	%f19,	[%l7 + 0x50]
	movleu	%xcc,	%o2,	%g3
	sir	0x0A25
	xor	%g1,	0x11BF,	%o0
	lduw	[%l7 + 0x48],	%i6
	orn	%o4,	0x0987,	%i2
	movl	%icc,	%i3,	%o7
	ldsb	[%l7 + 0x19],	%o1
	smulcc	%o5,	0x0F00,	%i5
	subccc	%l3,	%o6,	%l5
	andncc	%l1,	%l6,	%l4
	movcs	%icc,	%o3,	%i0
	addcc	%g5,	%l2,	%g4
	addcc	%i4,	%g6,	%i7
	movcs	%icc,	%g7,	%i1
	nop
	set	0x64, %g7
	ldsw	[%l7 + %g7],	%l0
	movre	%o2,	%g3,	%g1
	ldsw	[%l7 + 0x4C],	%o0
	array32	%g2,	%o4,	%i2
	sub	%i6,	0x0577,	%i3
	edge16ln	%o7,	%o5,	%o1
	mulscc	%i5,	%o6,	%l5
	subcc	%l3,	0x093F,	%l1
	fcmpgt16	%f20,	%f14,	%l6
	subc	%o3,	0x0985,	%l4
	umul	%i0,	0x0AE6,	%g5
	fmovsl	%xcc,	%f3,	%f26
	stx	%g4,	[%l7 + 0x58]
	orcc	%i4,	%g6,	%i7
	movcs	%xcc,	%l2,	%g7
	lduw	[%l7 + 0x3C],	%i1
	edge16ln	%l0,	%g3,	%o2
	sub	%g1,	%g2,	%o4
	fmovsl	%xcc,	%f14,	%f31
	umul	%i2,	%o0,	%i6
	sth	%i3,	[%l7 + 0x0C]
	fmovrdgz	%o5,	%f22,	%f0
	ldsb	[%l7 + 0x13],	%o1
	subcc	%i5,	%o7,	%o6
	fcmple32	%f26,	%f24,	%l5
	popc	%l1,	%l3
	fmovspos	%xcc,	%f2,	%f29
	fmuld8ulx16	%f23,	%f26,	%f10
	fmovdvc	%icc,	%f31,	%f17
	fornot2s	%f9,	%f10,	%f22
	alignaddr	%l6,	%o3,	%i0
	fmovse	%xcc,	%f17,	%f3
	movle	%icc,	%g5,	%l4
	alignaddr	%g4,	%g6,	%i4
	mulx	%i7,	0x1427,	%l2
	fmovsgu	%icc,	%f2,	%f20
	fmovsle	%xcc,	%f17,	%f17
	mulscc	%i1,	0x0BEC,	%g7
	andcc	%l0,	%o2,	%g1
	move	%xcc,	%g2,	%o4
	subc	%i2,	0x0F09,	%g3
	xorcc	%i6,	0x1FA6,	%i3
	movrgz	%o5,	%o0,	%i5
	movle	%xcc,	%o7,	%o1
	and	%l5,	%o6,	%l3
	fmovdvs	%icc,	%f10,	%f2
	subccc	%l1,	0x165A,	%l6
	faligndata	%f10,	%f18,	%f18
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	edge8n	%o3,	%g6,	%i4
	fmovrdlez	%i7,	%f24,	%f16
	fmul8ulx16	%f26,	%f12,	%f0
	edge8	%g4,	%i1,	%g7
	alignaddrl	%l0,	%l2,	%o2
	fmovdvc	%xcc,	%f28,	%f24
	sdivx	%g2,	0x157C,	%o4
	ldsb	[%l7 + 0x27],	%g1
	edge16	%i2,	%i6,	%g3
	edge32	%i3,	%o5,	%o0
	srlx	%i5,	%o1,	%o7
	andncc	%l5,	%o6,	%l1
	fpack32	%f14,	%f12,	%f22
	fxors	%f12,	%f8,	%f3
	nop
	set	0x34, %o4
	ldsb	[%l7 + %o4],	%l3
	udivx	%i0,	0x0BEA,	%g5
	fmovrdlez	%l4,	%f10,	%f26
	bshuffle	%f22,	%f26,	%f28
	move	%xcc,	%l6,	%g6
	xor	%i4,	0x154A,	%o3
	fmovdpos	%icc,	%f1,	%f0
	edge8	%g4,	%i7,	%i1
	edge16ln	%g7,	%l2,	%l0
	stx	%o2,	[%l7 + 0x78]
	popc	0x0D6A,	%g2
	sethi	0x1EBF,	%o4
	stw	%g1,	[%l7 + 0x48]
	srl	%i6,	0x11,	%g3
	fcmpeq32	%f18,	%f10,	%i3
	udiv	%o5,	0x1569,	%o0
	movl	%xcc,	%i2,	%i5
	fmovrdlez	%o1,	%f30,	%f12
	movrlez	%l5,	%o7,	%o6
	movne	%xcc,	%l1,	%i0
	sdivx	%g5,	0x0235,	%l4
	addccc	%l6,	0x0AAA,	%l3
	movg	%icc,	%i4,	%o3
	movpos	%icc,	%g4,	%g6
	movrne	%i1,	0x34F,	%i7
	fxnors	%f13,	%f26,	%f8
	movrgez	%l2,	%g7,	%o2
	fmovsn	%icc,	%f20,	%f1
	movvs	%xcc,	%g2,	%o4
	movneg	%icc,	%l0,	%g1
	movvs	%xcc,	%i6,	%i3
	fpsub32	%f0,	%f10,	%f22
	fmovdg	%icc,	%f27,	%f31
	sir	0x01F1
	edge32n	%g3,	%o5,	%i2
	edge16	%o0,	%o1,	%l5
	movcs	%xcc,	%i5,	%o6
	xnorcc	%o7,	%l1,	%i0
	movleu	%xcc,	%g5,	%l6
	xnorcc	%l4,	0x1412,	%l3
	save %o3, 0x1F4E, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f20,	%f20,	%i4
	and	%i1,	%g6,	%i7
	edge8	%l2,	%o2,	%g2
	fmovspos	%icc,	%f31,	%f6
	movre	%o4,	0x29B,	%l0
	stb	%g7,	[%l7 + 0x14]
	movvs	%xcc,	%i6,	%i3
	ldub	[%l7 + 0x4B],	%g1
	sra	%o5,	%i2,	%g3
	and	%o1,	%o0,	%i5
	movcs	%icc,	%o6,	%l5
	movle	%icc,	%o7,	%i0
	fmovdneg	%xcc,	%f18,	%f15
	fcmpeq16	%f24,	%f26,	%g5
	movgu	%icc,	%l1,	%l6
	add	%l4,	%o3,	%l3
	edge8n	%i4,	%i1,	%g4
	stb	%g6,	[%l7 + 0x60]
	sll	%l2,	0x12,	%i7
	fpsub16s	%f4,	%f17,	%f20
	fcmple16	%f30,	%f8,	%o2
	add	%o4,	%l0,	%g7
	sdivcc	%i6,	0x06F1,	%g2
	ldsb	[%l7 + 0x0C],	%g1
	movvc	%xcc,	%i3,	%o5
	fxnors	%f26,	%f11,	%f29
	sll	%g3,	%i2,	%o1
	movvc	%icc,	%o0,	%i5
	move	%icc,	%o6,	%l5
	movrlez	%i0,	0x2D4,	%g5
	fmul8x16al	%f9,	%f20,	%f18
	udivcc	%l1,	0x09DC,	%l6
	fmuld8ulx16	%f19,	%f31,	%f0
	stw	%l4,	[%l7 + 0x74]
	andncc	%o3,	%l3,	%i4
	movg	%xcc,	%i1,	%g4
	edge32	%g6,	%o7,	%i7
	fmovsn	%xcc,	%f2,	%f24
	array8	%l2,	%o4,	%o2
	movrne	%g7,	%i6,	%l0
	alignaddrl	%g2,	%g1,	%i3
	movcs	%icc,	%g3,	%o5
	alignaddrl	%o1,	%o0,	%i2
	movvs	%icc,	%i5,	%o6
	fcmpgt32	%f30,	%f16,	%i0
	ldx	[%l7 + 0x38],	%l5
	movge	%icc,	%g5,	%l6
	addc	%l4,	0x1995,	%l1
	edge32l	%l3,	%o3,	%i1
	save %i4, %g6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%g4,	%l2
	stx	%i7,	[%l7 + 0x30]
	movre	%o2,	%o4,	%i6
	subccc	%g7,	0x037D,	%g2
	movcc	%icc,	%l0,	%i3
	movleu	%xcc,	%g1,	%o5
	movneg	%xcc,	%g3,	%o1
	lduw	[%l7 + 0x64],	%o0
	movrgez	%i2,	0x27B,	%o6
	sdivcc	%i0,	0x15FA,	%i5
	fmovrsne	%g5,	%f7,	%f14
	fnands	%f3,	%f31,	%f10
	fmovdn	%xcc,	%f26,	%f0
	mulx	%l5,	%l6,	%l4
	ldsw	[%l7 + 0x68],	%l1
	move	%icc,	%o3,	%l3
	movgu	%xcc,	%i1,	%i4
	movvc	%icc,	%o7,	%g4
	movrne	%g6,	0x1DF,	%l2
	edge16l	%o2,	%o4,	%i6
	smul	%i7,	0x0B87,	%g2
	bshuffle	%f4,	%f22,	%f30
	ld	[%l7 + 0x74],	%f8
	movle	%icc,	%l0,	%g7
	movleu	%xcc,	%g1,	%o5
	fsrc1s	%f11,	%f24
	movg	%xcc,	%i3,	%o1
	addcc	%g3,	0x1241,	%o0
	movrgz	%o6,	0x3D2,	%i2
	fmovrde	%i5,	%f14,	%f2
	std	%f24,	[%l7 + 0x20]
	fabss	%f0,	%f24
	srax	%i0,	0x18,	%l5
	edge32	%l6,	%l4,	%l1
	and	%o3,	%l3,	%i1
	orncc	%g5,	%i4,	%o7
	movleu	%icc,	%g6,	%g4
	andcc	%l2,	%o2,	%i6
	ldd	[%l7 + 0x78],	%o4
	movre	%i7,	%l0,	%g7
	edge16l	%g1,	%o5,	%g2
	edge32n	%i3,	%o1,	%g3
	andncc	%o0,	%i2,	%o6
	movvs	%xcc,	%i5,	%l5
	movvc	%xcc,	%i0,	%l6
	fmovsneg	%icc,	%f20,	%f11
	movrlez	%l4,	%o3,	%l1
	std	%f22,	[%l7 + 0x18]
	sll	%i1,	0x13,	%g5
	edge8	%i4,	%o7,	%l3
	movcc	%xcc,	%g4,	%l2
	fmovsge	%icc,	%f15,	%f13
	st	%f28,	[%l7 + 0x2C]
	popc	0x1E8D,	%g6
	alignaddrl	%o2,	%o4,	%i6
	movg	%xcc,	%i7,	%l0
	movrlz	%g1,	%g7,	%g2
	edge8	%i3,	%o1,	%g3
	movvc	%xcc,	%o5,	%o0
	smulcc	%i2,	%o6,	%l5
	movcc	%icc,	%i5,	%l6
	edge8	%l4,	%i0,	%l1
	movrgz	%i1,	0x05E,	%g5
	udiv	%o3,	0x0666,	%i4
	fmovsvc	%xcc,	%f22,	%f23
	movre	%o7,	%l3,	%l2
	movle	%icc,	%g4,	%g6
	stx	%o2,	[%l7 + 0x70]
	addc	%i6,	0x147F,	%o4
	xorcc	%l0,	0x1F91,	%i7
	fmovrsne	%g7,	%f30,	%f22
	add	%g1,	%i3,	%o1
	ldsh	[%l7 + 0x76],	%g3
	movl	%icc,	%g2,	%o0
	edge8	%i2,	%o5,	%o6
	fzero	%f12
	array16	%i5,	%l5,	%l4
	subc	%i0,	%l6,	%i1
	udiv	%g5,	0x1365,	%o3
	movrlz	%i4,	%o7,	%l3
	smul	%l1,	0x1429,	%l2
	sll	%g4,	%o2,	%g6
	sdivcc	%i6,	0x0F1F,	%o4
	addccc	%i7,	0x0791,	%g7
	movrne	%l0,	0x233,	%i3
	lduw	[%l7 + 0x50],	%o1
	ldsw	[%l7 + 0x3C],	%g3
	fnot1	%f6,	%f2
	restore %g1, 0x1699, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%g2,	%f23,	%f18
	ldx	[%l7 + 0x78],	%i2
	ldsh	[%l7 + 0x46],	%o5
	fmovdgu	%xcc,	%f16,	%f18
	ldx	[%l7 + 0x18],	%i5
	fxnors	%f7,	%f25,	%f22
	andncc	%l5,	%o6,	%i0
	save %l4, %i1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l6,	0x005E,	%i4
	fnegs	%f10,	%f7
	fsrc2	%f28,	%f10
	stb	%o7,	[%l7 + 0x2F]
	edge16	%l3,	%o3,	%l2
	sub	%g4,	%o2,	%g6
	fmovsa	%icc,	%f14,	%f14
	edge32l	%i6,	%o4,	%i7
	lduh	[%l7 + 0x0A],	%g7
	ldsh	[%l7 + 0x4E],	%l1
	fmul8x16al	%f11,	%f20,	%f20
	movrlz	%l0,	%o1,	%g3
	ldx	[%l7 + 0x08],	%i3
	fmovsleu	%icc,	%f2,	%f27
	stx	%o0,	[%l7 + 0x60]
	movrne	%g2,	%i2,	%o5
	subc	%i5,	%g1,	%l5
	mulscc	%i0,	0x167C,	%l4
	srax	%i1,	0x19,	%g5
	fsrc1s	%f1,	%f2
	addcc	%l6,	%o6,	%o7
	mulx	%i4,	%l3,	%o3
	siam	0x4
	save %l2, %o2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g6,	%i6
	ldsb	[%l7 + 0x48],	%i7
	sllx	%g7,	0x08,	%l1
	movle	%xcc,	%l0,	%o4
	lduh	[%l7 + 0x10],	%g3
	sllx	%o1,	%i3,	%g2
	orncc	%o0,	%i2,	%o5
	movcs	%icc,	%g1,	%l5
	alignaddrl	%i0,	%i5,	%l4
	movneg	%xcc,	%g5,	%i1
	lduw	[%l7 + 0x3C],	%l6
	ldd	[%l7 + 0x70],	%f20
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	movrne	%o3,	%l2,	%o2
	fors	%f27,	%f7,	%f11
	addcc	%l3,	0x1B82,	%g6
	fmovrdgz	%i6,	%f12,	%f20
	fmovsvs	%xcc,	%f14,	%f20
	orn	%i7,	0x0DEB,	%g4
	edge16ln	%g7,	%l0,	%o4
	umulcc	%l1,	0x0855,	%g3
	move	%xcc,	%i3,	%g2
	movg	%xcc,	%o1,	%i2
	sdivx	%o5,	0x07C1,	%o0
	movle	%icc,	%g1,	%i0
	movvc	%icc,	%l5,	%l4
	edge16l	%g5,	%i5,	%l6
	lduh	[%l7 + 0x38],	%i1
	for	%f12,	%f12,	%f22
	xorcc	%o6,	0x0343,	%o7
	orcc	%i4,	0x1A78,	%o3
	lduh	[%l7 + 0x46],	%l2
	fmovrslez	%o2,	%f27,	%f28
	fmovdvs	%xcc,	%f12,	%f17
	ld	[%l7 + 0x70],	%f29
	nop
	set	0x74, %i5
	lduw	[%l7 + %i5],	%g6
	ldsh	[%l7 + 0x48],	%i6
	alignaddr	%i7,	%g4,	%g7
	lduw	[%l7 + 0x1C],	%l3
	sra	%l0,	%l1,	%g3
	sub	%o4,	0x0527,	%g2
	ldd	[%l7 + 0x20],	%i2
	ldd	[%l7 + 0x08],	%f16
	lduw	[%l7 + 0x60],	%o1
	sub	%i2,	%o0,	%g1
	array32	%i0,	%o5,	%l4
	movle	%icc,	%l5,	%g5
	fmovdle	%xcc,	%f21,	%f1
	umul	%i5,	%i1,	%o6
	ldd	[%l7 + 0x10],	%o6
	stb	%i4,	[%l7 + 0x4C]
	sub	%o3,	0x1EA5,	%l6
	fcmps	%fcc0,	%f18,	%f27
	array32	%o2,	%l2,	%g6
	mulscc	%i7,	%g4,	%g7
	fsrc1s	%f0,	%f13
	xorcc	%i6,	%l3,	%l1
	edge16l	%g3,	%o4,	%g2
	mova	%xcc,	%l0,	%o1
	umul	%i2,	%i3,	%o0
	bshuffle	%f20,	%f4,	%f30
	fxor	%f12,	%f22,	%f22
	nop
	set	0x68, %o3
	ldsw	[%l7 + %o3],	%g1
	fnand	%f22,	%f30,	%f12
	lduh	[%l7 + 0x28],	%o5
	stb	%l4,	[%l7 + 0x5B]
	edge8	%l5,	%i0,	%i5
	movcc	%xcc,	%g5,	%i1
	xorcc	%o7,	0x19F8,	%o6
	movvc	%icc,	%i4,	%l6
	fmovde	%xcc,	%f21,	%f26
	movre	%o2,	0x0F3,	%o3
	edge16ln	%l2,	%i7,	%g6
	fmovrdlez	%g4,	%f18,	%f26
	and	%g7,	0x1F3A,	%l3
	edge16	%i6,	%l1,	%o4
	fcmple16	%f0,	%f14,	%g2
	edge16n	%l0,	%o1,	%g3
	umulcc	%i2,	0x11D8,	%o0
	sth	%g1,	[%l7 + 0x30]
	fnot1	%f16,	%f0
	fmovrdgz	%i3,	%f28,	%f14
	umulcc	%o5,	%l5,	%l4
	lduh	[%l7 + 0x50],	%i5
	smulcc	%i0,	0x0FBC,	%g5
	lduh	[%l7 + 0x28],	%o7
	smul	%o6,	%i4,	%l6
	movrlez	%o2,	0x058,	%o3
	movvc	%xcc,	%l2,	%i7
	alignaddr	%g6,	%g4,	%g7
	smul	%l3,	%i6,	%i1
	sdivx	%o4,	0x19AA,	%g2
	movrne	%l0,	0x292,	%o1
	subc	%g3,	0x1C22,	%i2
	sll	%o0,	0x0B,	%g1
	sdivx	%i3,	0x12D7,	%o5
	xorcc	%l1,	%l5,	%i5
	xorcc	%l4,	0x1FF0,	%i0
	fpadd16	%f6,	%f2,	%f10
	fcmpgt32	%f10,	%f10,	%o7
	udivx	%o6,	0x0878,	%i4
	ldd	[%l7 + 0x20],	%g4
	stb	%o2,	[%l7 + 0x37]
	edge16ln	%o3,	%l6,	%l2
	andn	%i7,	%g6,	%g4
	xnor	%l3,	0x068E,	%i6
	fsrc1s	%f10,	%f7
	fmovse	%icc,	%f25,	%f11
	movre	%i1,	%g7,	%o4
	ldsh	[%l7 + 0x60],	%l0
	array16	%g2,	%g3,	%i2
	fmovsleu	%xcc,	%f31,	%f22
	lduh	[%l7 + 0x2A],	%o1
	movre	%o0,	%i3,	%o5
	move	%icc,	%g1,	%l1
	smul	%i5,	%l4,	%i0
	xnor	%l5,	%o7,	%i4
	fcmpgt16	%f30,	%f6,	%o6
	fmovsl	%icc,	%f16,	%f16
	popc	0x02EC,	%g5
	addc	%o2,	%l6,	%l2
	st	%f29,	[%l7 + 0x14]
	stx	%o3,	[%l7 + 0x50]
	ldx	[%l7 + 0x70],	%i7
	edge16ln	%g6,	%g4,	%i6
	edge32n	%l3,	%g7,	%i1
	ldd	[%l7 + 0x08],	%f26
	std	%f30,	[%l7 + 0x40]
	fnot2	%f16,	%f20
	stx	%o4,	[%l7 + 0x28]
	movl	%icc,	%l0,	%g2
	add	%i2,	0x0A13,	%o1
	sllx	%g3,	%o0,	%i3
	fmovrse	%o5,	%f27,	%f17
	edge8l	%l1,	%i5,	%g1
	lduw	[%l7 + 0x1C],	%l4
	sdivx	%i0,	0x1BB0,	%o7
	fcmped	%fcc2,	%f18,	%f18
	sth	%i4,	[%l7 + 0x0A]
	movrlez	%o6,	0x2F4,	%g5
	srax	%l5,	0x13,	%o2
	orncc	%l2,	%l6,	%o3
	movgu	%icc,	%g6,	%i7
	ldsh	[%l7 + 0x2A],	%i6
	movrlez	%g4,	0x03B,	%g7
	sdivcc	%i1,	0x016A,	%l3
	edge32l	%o4,	%l0,	%i2
	fmovrdgz	%o1,	%f18,	%f20
	lduh	[%l7 + 0x58],	%g2
	umul	%g3,	0x1F70,	%o0
	sdivcc	%o5,	0x0F70,	%i3
	sethi	0x1461,	%l1
	smulcc	%i5,	0x19B4,	%l4
	fmovsneg	%xcc,	%f27,	%f4
	edge16	%g1,	%o7,	%i0
	edge16ln	%o6,	%g5,	%l5
	ldsh	[%l7 + 0x5C],	%i4
	andcc	%o2,	0x0A2C,	%l6
	srl	%l2,	0x0E,	%g6
	movl	%icc,	%i7,	%o3
	movneg	%icc,	%i6,	%g4
	fmovrsgz	%g7,	%f6,	%f10
	movrlz	%l3,	%i1,	%o4
	restore %l0, 0x1BB4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x2A],	%g2
	mulx	%g3,	%o0,	%i2
	fcmple16	%f4,	%f4,	%o5
	srax	%l1,	0x02,	%i3
	array8	%i5,	%l4,	%g1
	udiv	%i0,	0x1DBE,	%o6
	movre	%o7,	0x3E6,	%l5
	fandnot2s	%f2,	%f18,	%f31
	ldsb	[%l7 + 0x53],	%g5
	or	%i4,	0x0BA5,	%l6
	ld	[%l7 + 0x10],	%f19
	sra	%l2,	0x18,	%g6
	alignaddr	%i7,	%o3,	%i6
	ldsb	[%l7 + 0x72],	%g4
	edge32n	%o2,	%l3,	%g7
	fnors	%f22,	%f1,	%f4
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	movvs	%xcc,	%o1,	%g2
	sth	%g3,	[%l7 + 0x5C]
	movge	%xcc,	%o0,	%i2
	movrlez	%l1,	%o5,	%i5
	fcmpgt32	%f14,	%f20,	%l4
	alignaddr	%g1,	%i0,	%o6
	movrlez	%o7,	%l5,	%g5
	st	%f29,	[%l7 + 0x44]
	edge16ln	%i4,	%i3,	%l2
	alignaddr	%l6,	%g6,	%i7
	lduh	[%l7 + 0x7A],	%o3
	subccc	%g4,	%i6,	%o2
	sethi	0x1E92,	%g7
	movn	%xcc,	%l3,	%l0
	addc	%o4,	%o1,	%i1
	restore %g3, %o0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l1,	[%l7 + 0x28]
	sub	%o5,	%g2,	%i5
	xnor	%g1,	%l4,	%i0
	movrlez	%o6,	%l5,	%o7
	array32	%g5,	%i4,	%l2
	andcc	%l6,	0x09D3,	%g6
	ldd	[%l7 + 0x28],	%i2
	lduh	[%l7 + 0x26],	%o3
	udivx	%g4,	0x143F,	%i6
	xnorcc	%i7,	%g7,	%l3
	ld	[%l7 + 0x24],	%f31
	edge16	%o2,	%l0,	%o4
	edge32n	%o1,	%g3,	%i1
	addccc	%o0,	0x1B31,	%i2
	mulx	%o5,	0x08D1,	%g2
	nop
	set	0x34, %o5
	stw	%l1,	[%l7 + %o5]
	array8	%i5,	%l4,	%g1
	mova	%xcc,	%i0,	%o6
	movleu	%xcc,	%l5,	%o7
	sethi	0x127B,	%i4
	movrlz	%l2,	0x12C,	%g5
	mulx	%g6,	%l6,	%i3
	stx	%o3,	[%l7 + 0x30]
	andcc	%i6,	0x1B5D,	%g4
	ldsw	[%l7 + 0x38],	%g7
	orncc	%i7,	%l3,	%l0
	addc	%o4,	%o1,	%o2
	ldsb	[%l7 + 0x0A],	%g3
	edge8l	%o0,	%i2,	%i1
	movl	%icc,	%g2,	%o5
	movneg	%icc,	%i5,	%l4
	ldub	[%l7 + 0x5A],	%g1
	add	%l1,	0x03AA,	%i0
	addcc	%l5,	%o6,	%i4
	movge	%icc,	%o7,	%g5
	movn	%icc,	%g6,	%l6
	fnegs	%f5,	%f5
	orn	%i3,	0x12F6,	%o3
	fnegs	%f23,	%f4
	fmuld8sux16	%f3,	%f31,	%f14
	movleu	%xcc,	%i6,	%l2
	std	%f22,	[%l7 + 0x38]
	movre	%g7,	%i7,	%l3
	stx	%l0,	[%l7 + 0x08]
	mulx	%g4,	%o1,	%o2
	subc	%o4,	%o0,	%i2
	stb	%g3,	[%l7 + 0x6F]
	movleu	%icc,	%g2,	%o5
	nop
	set	0x34, %l1
	ldsb	[%l7 + %l1],	%i1
	stx	%l4,	[%l7 + 0x08]
	fmovrdgz	%i5,	%f26,	%f12
	edge8	%g1,	%i0,	%l5
	movvc	%xcc,	%o6,	%i4
	mulx	%l1,	%o7,	%g6
	edge16ln	%g5,	%l6,	%i3
	addc	%i6,	0x0ABC,	%l2
	movrgz	%g7,	0x2F3,	%i7
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	edge8l	%o3,	%g4,	%o1
	edge32n	%o2,	%o0,	%i2
	edge8l	%g3,	%o4,	%o5
	srl	%i1,	%l4,	%g2
	edge32	%g1,	%i5,	%l5
	edge16ln	%i0,	%o6,	%l1
	sllx	%i4,	0x18,	%g6
	fabsd	%f10,	%f16
	mulx	%o7,	0x0AE8,	%g5
	fornot2s	%f30,	%f16,	%f3
	fcmpgt16	%f24,	%f22,	%i3
	stw	%i6,	[%l7 + 0x0C]
	smul	%l2,	0x0834,	%l6
	edge32ln	%i7,	%l3,	%g7
	sir	0x0AAC
	edge16ln	%l0,	%g4,	%o3
	edge16ln	%o2,	%o0,	%i2
	subc	%g3,	%o4,	%o1
	edge16n	%i1,	%l4,	%g2
	edge8n	%o5,	%i5,	%g1
	edge16	%l5,	%o6,	%l1
	fors	%f19,	%f8,	%f27
	xorcc	%i4,	%i0,	%o7
	fone	%f28
	fcmpgt16	%f22,	%f8,	%g6
	addccc	%i3,	%i6,	%l2
	move	%icc,	%g5,	%l6
	movn	%xcc,	%i7,	%g7
	edge32	%l3,	%l0,	%o3
	movne	%icc,	%g4,	%o2
	fmovdg	%xcc,	%f1,	%f8
	movcs	%icc,	%o0,	%g3
	xorcc	%o4,	0x0C9F,	%o1
	fcmpes	%fcc1,	%f1,	%f24
	edge16n	%i1,	%l4,	%g2
	movneg	%xcc,	%o5,	%i2
	andn	%i5,	0x1CB4,	%l5
	fsrc2s	%f17,	%f9
	fand	%f8,	%f30,	%f16
	popc	%g1,	%l1
	array16	%i4,	%o6,	%o7
	sdivx	%g6,	0x1084,	%i0
	fmul8x16	%f14,	%f18,	%f8
	add	%i6,	%i3,	%l2
	ldsb	[%l7 + 0x71],	%l6
	array8	%g5,	%g7,	%l3
	ldsh	[%l7 + 0x26],	%i7
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%f10
	fand	%f26,	%f4,	%f12
	edge16l	%o3,	%g4,	%o2
	movcc	%icc,	%l0,	%g3
	movrgez	%o0,	0x1DF,	%o1
	save %o4, %i1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l4,	%i2
	edge32n	%i5,	%l5,	%g1
	sir	0x1CA4
	addc	%l1,	%i4,	%o5
	array8	%o7,	%o6,	%g6
	orcc	%i6,	0x1EB4,	%i0
	fmovdgu	%xcc,	%f9,	%f17
	fmovrdne	%l2,	%f14,	%f30
	fornot1	%f28,	%f0,	%f8
	addcc	%i3,	%g5,	%g7
	fand	%f6,	%f30,	%f30
	movneg	%icc,	%l3,	%l6
	fmovrsgz	%i7,	%f0,	%f3
	movle	%icc,	%o3,	%g4
	array32	%o2,	%g3,	%o0
	ldx	[%l7 + 0x38],	%o1
	smul	%l0,	0x11D5,	%i1
	movn	%icc,	%o4,	%l4
	edge8l	%g2,	%i5,	%l5
	fmul8x16al	%f18,	%f15,	%f12
	fmovdleu	%icc,	%f20,	%f24
	udivx	%g1,	0x13B0,	%l1
	lduw	[%l7 + 0x38],	%i4
	fcmpgt32	%f26,	%f26,	%o5
	sdiv	%o7,	0x116C,	%i2
	sdivcc	%g6,	0x16AE,	%o6
	sll	%i0,	0x1C,	%i6
	udivx	%i3,	0x053A,	%g5
	fmul8x16	%f27,	%f14,	%f20
	xnor	%l2,	0x055C,	%g7
	movleu	%icc,	%l3,	%l6
	ld	[%l7 + 0x30],	%f18
	smul	%i7,	%o3,	%g4
	fcmple16	%f8,	%f10,	%g3
	edge8l	%o0,	%o1,	%o2
	edge32	%i1,	%o4,	%l0
	andcc	%l4,	%g2,	%i5
	subcc	%g1,	%l5,	%i4
	sth	%o5,	[%l7 + 0x20]
	ldd	[%l7 + 0x28],	%l0
	xnorcc	%o7,	0x0ED9,	%i2
	edge16	%o6,	%g6,	%i0
	sra	%i6,	%i3,	%g5
	edge8n	%l2,	%g7,	%l3
	and	%l6,	%o3,	%i7
	move	%xcc,	%g3,	%o0
	ldx	[%l7 + 0x58],	%o1
	smul	%o2,	0x11A2,	%g4
	addcc	%o4,	0x14C3,	%i1
	fnor	%f14,	%f6,	%f28
	edge8l	%l0,	%l4,	%i5
	fnot2s	%f9,	%f19
	movrlz	%g1,	%g2,	%i4
	sdivx	%l5,	0x1722,	%o5
	xor	%l1,	%o7,	%i2
	fornot1	%f4,	%f6,	%f8
	sub	%o6,	0x1E2F,	%i0
	sub	%i6,	%i3,	%g6
	ldub	[%l7 + 0x52],	%l2
	edge8ln	%g7,	%l3,	%g5
	edge16n	%l6,	%i7,	%o3
	ldsh	[%l7 + 0x34],	%o0
	ldd	[%l7 + 0x38],	%f22
	addc	%g3,	%o2,	%o1
	fmovsle	%xcc,	%f5,	%f28
	movrne	%g4,	%i1,	%o4
	fcmple16	%f22,	%f24,	%l0
	movgu	%icc,	%i5,	%l4
	lduh	[%l7 + 0x6C],	%g1
	lduw	[%l7 + 0x48],	%g2
	sra	%l5,	%o5,	%l1
	xnorcc	%i4,	%o7,	%o6
	movrlz	%i2,	%i6,	%i3
	movne	%icc,	%i0,	%g6
	srl	%g7,	0x1B,	%l3
	udivcc	%g5,	0x1160,	%l6
	movne	%icc,	%l2,	%o3
	edge16n	%i7,	%o0,	%g3
	array16	%o2,	%o1,	%i1
	movleu	%xcc,	%g4,	%o4
	edge8ln	%i5,	%l0,	%g1
	movg	%icc,	%l4,	%g2
	addccc	%l5,	%o5,	%l1
	srl	%o7,	0x17,	%o6
	array8	%i4,	%i2,	%i3
	addcc	%i0,	0x1E58,	%g6
	stb	%i6,	[%l7 + 0x73]
	orncc	%g7,	0x1184,	%g5
	edge8ln	%l6,	%l3,	%l2
	restore %o3, %i7, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o2,	%f14,	%f24
	mulscc	%g3,	%i1,	%g4
	edge8l	%o4,	%o1,	%l0
	edge32n	%g1,	%l4,	%i5
	movg	%xcc,	%g2,	%o5
	umulcc	%l5,	%o7,	%o6
	fnot1	%f18,	%f28
	st	%f2,	[%l7 + 0x78]
	srax	%l1,	%i2,	%i3
	fmovsge	%xcc,	%f31,	%f16
	fmovdneg	%xcc,	%f20,	%f26
	movrgz	%i4,	%i0,	%i6
	fmovscc	%icc,	%f28,	%f14
	movrgz	%g7,	%g6,	%g5
	sra	%l3,	%l6,	%o3
	fpmerge	%f17,	%f13,	%f18
	fmovsn	%icc,	%f21,	%f18
	edge16	%l2,	%i7,	%o2
	fmovdne	%icc,	%f23,	%f13
	mulx	%g3,	0x19BE,	%o0
	fmovdvs	%icc,	%f17,	%f16
	fmovsa	%xcc,	%f14,	%f28
	fmovdvs	%xcc,	%f28,	%f13
	fpadd32	%f10,	%f8,	%f26
	movcs	%xcc,	%g4,	%o4
	movleu	%xcc,	%i1,	%o1
	ldsb	[%l7 + 0x61],	%l0
	movrgez	%g1,	0x1A2,	%i5
	movrlez	%g2,	0x259,	%l4
	fmovscs	%icc,	%f6,	%f14
	edge16	%o5,	%l5,	%o7
	sdivcc	%l1,	0x0374,	%i2
	alignaddr	%i3,	%o6,	%i0
	sll	%i6,	%g7,	%g6
	movcc	%icc,	%i4,	%l3
	fsrc1	%f28,	%f28
	ldsb	[%l7 + 0x59],	%l6
	sdivx	%g5,	0x0CB0,	%l2
	sethi	0x1E35,	%o3
	movvs	%xcc,	%o2,	%g3
	sllx	%i7,	0x09,	%o0
	ldsw	[%l7 + 0x38],	%g4
	edge8ln	%i1,	%o4,	%l0
	mulx	%g1,	0x182F,	%i5
	ldd	[%l7 + 0x78],	%g2
	movleu	%xcc,	%l4,	%o5
	fcmpne16	%f26,	%f14,	%l5
	fmovsn	%xcc,	%f25,	%f11
	edge32	%o1,	%o7,	%i2
	xnor	%i3,	%o6,	%l1
	mulx	%i0,	%g7,	%g6
	movge	%xcc,	%i6,	%l3
	orncc	%l6,	0x12FC,	%i4
	fmovd	%f18,	%f0
	stx	%g5,	[%l7 + 0x60]
	subc	%o3,	%l2,	%g3
	st	%f8,	[%l7 + 0x3C]
	smul	%i7,	0x0829,	%o0
	addccc	%o2,	%i1,	%o4
	fabsd	%f24,	%f18
	nop
	set	0x30, %i6
	stx	%g4,	[%l7 + %i6]
	edge8n	%g1,	%l0,	%i5
	fmovdleu	%icc,	%f3,	%f29
	orn	%l4,	0x1FE0,	%o5
	sub	%l5,	%o1,	%g2
	ldd	[%l7 + 0x08],	%f12
	ld	[%l7 + 0x64],	%f10
	sllx	%o7,	0x12,	%i3
	ldsh	[%l7 + 0x3E],	%o6
	fmovscs	%xcc,	%f17,	%f16
	orcc	%l1,	%i2,	%i0
	xnor	%g6,	%i6,	%g7
	sdivx	%l6,	0x058A,	%l3
	movcs	%xcc,	%i4,	%o3
	fandnot1	%f14,	%f8,	%f2
	ldsb	[%l7 + 0x1F],	%l2
	edge16n	%g5,	%i7,	%o0
	smul	%o2,	0x028F,	%i1
	movrgz	%g3,	%o4,	%g1
	movrlez	%g4,	%l0,	%i5
	fmovdl	%xcc,	%f9,	%f22
	fmul8x16au	%f17,	%f3,	%f18
	fabss	%f28,	%f15
	array8	%l4,	%o5,	%l5
	movvs	%xcc,	%g2,	%o7
	addcc	%o1,	0x04FA,	%o6
	and	%i3,	0x00A9,	%i2
	movrgez	%i0,	%l1,	%g6
	movrlez	%i6,	%g7,	%l6
	edge8n	%i4,	%l3,	%l2
	fcmpne16	%f16,	%f24,	%o3
	fmovse	%xcc,	%f21,	%f14
	sethi	0x0A43,	%i7
	edge32n	%g5,	%o0,	%i1
	mulscc	%g3,	0x0CB5,	%o2
	fone	%f24
	subcc	%g1,	%g4,	%l0
	subcc	%o4,	0x1270,	%l4
	movpos	%xcc,	%i5,	%o5
	movrgz	%l5,	0x37E,	%o7
	fnot1s	%f21,	%f2
	sub	%o1,	%o6,	%i3
	mova	%icc,	%g2,	%i0
	subcc	%l1,	%g6,	%i2
	nop
	set	0x6C, %i4
	ldub	[%l7 + %i4],	%g7
	movpos	%xcc,	%i6,	%l6
	andn	%i4,	0x0523,	%l2
	fpadd32s	%f23,	%f19,	%f5
	edge16l	%o3,	%i7,	%l3
	ldub	[%l7 + 0x68],	%g5
	orncc	%o0,	0x0D1D,	%g3
	ldsh	[%l7 + 0x18],	%i1
	movrgz	%o2,	0x2E1,	%g4
	movpos	%icc,	%g1,	%l0
	array32	%o4,	%i5,	%o5
	array16	%l4,	%o7,	%l5
	umulcc	%o6,	%o1,	%i3
	array16	%i0,	%g2,	%g6
	fmovrsne	%i2,	%f21,	%f24
	orn	%l1,	0x0BC5,	%g7
	save %i6, %i4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%l6,	%f14,	%f0
	movvs	%icc,	%o3,	%i7
	edge16ln	%g5,	%o0,	%l3
	subccc	%i1,	%g3,	%o2
	fcmpgt16	%f28,	%f24,	%g1
	fmovdg	%xcc,	%f28,	%f19
	array8	%g4,	%l0,	%o4
	save %o5, %i5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l5,	%o7,	%o1
	mova	%icc,	%i3,	%i0
	stw	%g2,	[%l7 + 0x18]
	fnot2	%f28,	%f18
	fmuld8ulx16	%f8,	%f29,	%f10
	fsrc1	%f22,	%f2
	array8	%o6,	%i2,	%l1
	movg	%icc,	%g6,	%g7
	array32	%i6,	%l2,	%i4
	or	%l6,	0x0825,	%o3
	alignaddr	%g5,	%o0,	%i7
	movpos	%xcc,	%l3,	%i1
	nop
	set	0x60, %g4
	ldx	[%l7 + %g4],	%o2
	sth	%g1,	[%l7 + 0x4A]
	fabsd	%f0,	%f2
	sub	%g4,	0x03A8,	%l0
	popc	0x07A6,	%g3
	subcc	%o4,	0x1081,	%o5
	movpos	%xcc,	%l4,	%l5
	nop
	set	0x68, %o2
	stx	%o7,	[%l7 + %o2]
	edge8l	%i5,	%o1,	%i0
	movg	%xcc,	%g2,	%o6
	fmovsge	%xcc,	%f10,	%f28
	sdiv	%i3,	0x0D44,	%l1
	sdivcc	%i2,	0x1636,	%g7
	andcc	%g6,	%l2,	%i4
	fones	%f6
	movleu	%xcc,	%i6,	%l6
	alignaddrl	%o3,	%g5,	%i7
	mova	%xcc,	%o0,	%i1
	fmovsn	%icc,	%f14,	%f26
	xorcc	%o2,	0x1982,	%l3
	popc	0x16E0,	%g4
	smulcc	%g1,	%g3,	%o4
	movleu	%icc,	%l0,	%l4
	addc	%o5,	%l5,	%o7
	fmovrse	%o1,	%f20,	%f10
	bshuffle	%f10,	%f8,	%f12
	ldd	[%l7 + 0x08],	%f4
	fmovdcs	%icc,	%f18,	%f12
	sth	%i5,	[%l7 + 0x0E]
	addccc	%g2,	%o6,	%i0
	stx	%i3,	[%l7 + 0x38]
	fxnors	%f20,	%f25,	%f20
	stw	%l1,	[%l7 + 0x1C]
	or	%g7,	%i2,	%l2
	subc	%g6,	0x19E9,	%i6
	alignaddrl	%i4,	%o3,	%l6
	array32	%i7,	%o0,	%i1
	array8	%o2,	%g5,	%g4
	ldsb	[%l7 + 0x12],	%g1
	edge8ln	%g3,	%o4,	%l3
	fabss	%f9,	%f27
	array16	%l4,	%o5,	%l0
	subc	%l5,	%o7,	%i5
	and	%g2,	0x0FA2,	%o1
	umulcc	%i0,	%i3,	%l1
	fmovdl	%icc,	%f31,	%f31
	save %o6, %g7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x40],	%g6
	addcc	%i6,	%l2,	%i4
	xnorcc	%o3,	0x11A2,	%i7
	mova	%icc,	%l6,	%i1
	edge8	%o2,	%g5,	%g4
	edge16n	%o0,	%g3,	%g1
	ld	[%l7 + 0x60],	%f10
	movre	%l3,	%l4,	%o5
	fpsub32	%f18,	%f20,	%f18
	fmovsl	%icc,	%f21,	%f10
	nop
	set	0x5C, %i2
	ldsw	[%l7 + %i2],	%o4
	ldsh	[%l7 + 0x36],	%l0
	st	%f4,	[%l7 + 0x30]
	xorcc	%l5,	%o7,	%i5
	movrne	%g2,	0x0E0,	%o1
	edge8	%i3,	%i0,	%o6
	edge8ln	%l1,	%i2,	%g7
	movcs	%icc,	%g6,	%l2
	fcmpeq16	%f18,	%f28,	%i6
	fxnor	%f10,	%f18,	%f2
	sdivx	%o3,	0x018F,	%i7
	ldsb	[%l7 + 0x17],	%i4
	ldd	[%l7 + 0x58],	%f30
	mova	%icc,	%l6,	%i1
	fmul8x16	%f4,	%f18,	%f14
	fornot1s	%f6,	%f23,	%f5
	ldsw	[%l7 + 0x70],	%o2
	std	%f20,	[%l7 + 0x20]
	fnot1s	%f15,	%f21
	edge8l	%g4,	%g5,	%g3
	orcc	%o0,	%l3,	%g1
	sdivcc	%l4,	0x1EA9,	%o4
	andcc	%l0,	%l5,	%o5
	ld	[%l7 + 0x34],	%f5
	smul	%o7,	0x0A1E,	%i5
	smulcc	%o1,	%i3,	%g2
	lduw	[%l7 + 0x3C],	%o6
	edge16	%l1,	%i0,	%i2
	fnot2	%f8,	%f6
	sdivcc	%g7,	0x1619,	%l2
	edge32n	%i6,	%g6,	%o3
	movre	%i7,	%l6,	%i4
	popc	%i1,	%g4
	subcc	%g5,	0x0B2B,	%o2
	stw	%o0,	[%l7 + 0x74]
	fmovrsne	%g3,	%f8,	%f1
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	xorcc	%l3,	0x0DF3,	%o4
	std	%f10,	[%l7 + 0x38]
	ldsb	[%l7 + 0x6D],	%l0
	stx	%l5,	[%l7 + 0x58]
	st	%f8,	[%l7 + 0x18]
	movre	%o7,	%i5,	%o5
	mulscc	%i3,	%o1,	%g2
	alignaddr	%o6,	%l1,	%i0
	sub	%i2,	0x0892,	%g7
	movrlz	%l2,	0x34E,	%i6
	udivx	%g6,	0x04CF,	%o3
	ldd	[%l7 + 0x70],	%i6
	sll	%l6,	0x0D,	%i1
	movl	%icc,	%g4,	%i4
	movgu	%icc,	%g5,	%o2
	fmovsge	%xcc,	%f9,	%f25
	popc	%o0,	%g3
	movpos	%icc,	%l4,	%l3
	fmovrse	%g1,	%f8,	%f22
	movgu	%icc,	%l0,	%o4
	movgu	%icc,	%l5,	%i5
	edge8	%o5,	%o7,	%i3
	udivcc	%g2,	0x1EF9,	%o1
	sllx	%l1,	%i0,	%o6
	movneg	%xcc,	%g7,	%l2
	sethi	0x07F5,	%i6
	movvs	%icc,	%i2,	%g6
	subcc	%i7,	%l6,	%o3
	movneg	%icc,	%i1,	%g4
	edge32ln	%i4,	%o2,	%g5
	ldx	[%l7 + 0x78],	%o0
	fornot2	%f24,	%f8,	%f10
	fmovsle	%xcc,	%f24,	%f6
	restore %g3, %l4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f30,	%f14,	%f16
	andcc	%g1,	0x0A47,	%o4
	umul	%l0,	0x0E55,	%i5
	fmovrsgz	%l5,	%f10,	%f12
	movrlz	%o7,	%i3,	%g2
	subcc	%o5,	%o1,	%l1
	subc	%o6,	%g7,	%l2
	ldd	[%l7 + 0x18],	%i6
	fmovrdne	%i0,	%f14,	%f22
	srl	%g6,	0x12,	%i7
	movge	%icc,	%i2,	%l6
	movge	%icc,	%i1,	%g4
	addc	%i4,	0x0C07,	%o3
	ldx	[%l7 + 0x40],	%g5
	udiv	%o0,	0x0320,	%o2
	array16	%l4,	%l3,	%g1
	movre	%o4,	0x390,	%l0
	bshuffle	%f0,	%f10,	%f16
	movg	%xcc,	%i5,	%g3
	sdivcc	%l5,	0x1503,	%i3
	udivx	%g2,	0x1F32,	%o7
	movne	%xcc,	%o1,	%l1
	fcmple16	%f12,	%f16,	%o6
	subcc	%g7,	0x021D,	%o5
	fnegs	%f30,	%f0
	edge32	%l2,	%i6,	%g6
	fmovsvc	%xcc,	%f1,	%f28
	orcc	%i7,	0x013B,	%i0
	edge8l	%i2,	%l6,	%g4
	movre	%i1,	%o3,	%g5
	fors	%f4,	%f30,	%f15
	nop
	set	0x50, %i3
	ldsw	[%l7 + %i3],	%i4
	fsrc2s	%f22,	%f29
	srlx	%o0,	%o2,	%l3
	addcc	%g1,	%o4,	%l4
	movleu	%xcc,	%i5,	%l0
	array8	%l5,	%i3,	%g2
	mulscc	%o7,	%g3,	%o1
	smulcc	%o6,	0x1E6D,	%g7
	ldub	[%l7 + 0x34],	%o5
	addccc	%l2,	%i6,	%g6
	sir	0x019A
	movleu	%xcc,	%i7,	%l1
	fxnor	%f30,	%f18,	%f24
	mova	%icc,	%i2,	%l6
	ldsw	[%l7 + 0x4C],	%g4
	lduh	[%l7 + 0x58],	%i0
	subccc	%i1,	%g5,	%o3
	st	%f4,	[%l7 + 0x78]
	mulx	%i4,	%o2,	%o0
	fmovrslez	%g1,	%f5,	%f29
	fones	%f8
	stb	%o4,	[%l7 + 0x27]
	movl	%xcc,	%l3,	%i5
	edge16ln	%l4,	%l5,	%i3
	ldd	[%l7 + 0x50],	%f26
	movvc	%xcc,	%l0,	%g2
	ldsw	[%l7 + 0x28],	%o7
	udivcc	%o1,	0x0446,	%g3
	fmovrslez	%g7,	%f19,	%f27
	or	%o6,	%o5,	%i6
	subccc	%g6,	0x06FA,	%l2
	fmovscc	%xcc,	%f11,	%f7
	xnor	%l1,	%i2,	%l6
	subc	%g4,	0x03BA,	%i7
	srlx	%i1,	%g5,	%o3
	udivx	%i4,	0x15AE,	%o2
	fmovsn	%xcc,	%f9,	%f22
	stx	%i0,	[%l7 + 0x30]
	movrlez	%o0,	0x2AB,	%g1
	orcc	%o4,	%l3,	%l4
	fmul8x16au	%f11,	%f3,	%f18
	andncc	%i5,	%i3,	%l5
	srlx	%g2,	0x0B,	%o7
	edge16	%o1,	%g3,	%l0
	edge16n	%g7,	%o5,	%i6
	fmovscs	%xcc,	%f31,	%f28
	udiv	%g6,	0x1604,	%o6
	edge32ln	%l2,	%l1,	%i2
	movrgez	%l6,	%g4,	%i7
	movrlez	%g5,	0x2C0,	%i1
	movrlz	%i4,	0x007,	%o3
	srlx	%i0,	%o0,	%g1
	movgu	%xcc,	%o4,	%l3
	xnorcc	%o2,	0x1198,	%i5
	stx	%i3,	[%l7 + 0x68]
	addc	%l5,	0x15A0,	%g2
	fmovrsgz	%l4,	%f28,	%f30
	addcc	%o1,	%o7,	%g3
	xnorcc	%l0,	0x0D50,	%o5
	movvs	%xcc,	%g7,	%g6
	fmovrsgez	%i6,	%f6,	%f0
	movg	%xcc,	%l2,	%o6
	popc	0x0BF9,	%i2
	movge	%icc,	%l6,	%l1
	ldub	[%l7 + 0x74],	%i7
	udivcc	%g4,	0x0E98,	%i1
	xorcc	%g5,	0x0934,	%i4
	popc	%i0,	%o3
	std	%f6,	[%l7 + 0x48]
	movrne	%g1,	0x026,	%o0
	fmovsl	%xcc,	%f1,	%f13
	movpos	%xcc,	%l3,	%o2
	movne	%xcc,	%o4,	%i3
	ldub	[%l7 + 0x73],	%i5
	movre	%g2,	0x2B0,	%l4
	edge16	%l5,	%o7,	%g3
	movvc	%xcc,	%o1,	%l0
	fpsub16	%f18,	%f28,	%f14
	ldsw	[%l7 + 0x7C],	%g7
	sll	%g6,	%o5,	%l2
	mulscc	%o6,	%i2,	%i6
	ld	[%l7 + 0x1C],	%f21
	ldsh	[%l7 + 0x26],	%l6
	udiv	%l1,	0x145D,	%g4
	std	%f30,	[%l7 + 0x70]
	fnegs	%f24,	%f30
	udivx	%i1,	0x0239,	%g5
	umul	%i7,	0x1FA7,	%i4
	ldub	[%l7 + 0x3F],	%o3
	fandnot2s	%f10,	%f1,	%f13
	stb	%g1,	[%l7 + 0x5A]
	movn	%xcc,	%o0,	%l3
	mova	%icc,	%o2,	%i0
	edge8ln	%o4,	%i5,	%i3
	sll	%g2,	0x0D,	%l5
	sth	%l4,	[%l7 + 0x42]
	mova	%xcc,	%g3,	%o7
	movne	%xcc,	%l0,	%g7
	fnand	%f14,	%f24,	%f14
	fmovsvs	%xcc,	%f0,	%f15
	sethi	0x063B,	%o1
	ldsb	[%l7 + 0x62],	%g6
	array8	%l2,	%o6,	%o5
	umulcc	%i6,	0x0784,	%l6
	sth	%l1,	[%l7 + 0x62]
	movneg	%icc,	%i2,	%g4
	xnorcc	%g5,	0x09AD,	%i1
	udivcc	%i7,	0x0A30,	%i4
	movrlz	%g1,	%o0,	%o3
	sethi	0x1D78,	%l3
	stx	%o2,	[%l7 + 0x30]
	addccc	%i0,	0x020F,	%i5
	edge32	%i3,	%o4,	%l5
	xnor	%g2,	0x1FE7,	%l4
	ldd	[%l7 + 0x58],	%g2
	movrne	%l0,	%o7,	%g7
	xorcc	%o1,	0x1863,	%l2
	movleu	%icc,	%g6,	%o6
	sllx	%i6,	%l6,	%o5
	ldsh	[%l7 + 0x38],	%l1
	andcc	%g4,	0x1F10,	%g5
	fmovdge	%icc,	%f16,	%f8
	movpos	%icc,	%i1,	%i2
	std	%f10,	[%l7 + 0x70]
	umulcc	%i4,	%g1,	%o0
	fcmps	%fcc1,	%f0,	%f5
	umul	%o3,	0x0637,	%l3
	fxors	%f7,	%f0,	%f5
	ldsb	[%l7 + 0x23],	%i7
	smul	%i0,	0x129C,	%o2
	orn	%i5,	0x19D8,	%o4
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	edge16n	%i3,	%g3,	%o7
	ldx	[%l7 + 0x78],	%g7
	save %l0, 0x09EB, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	%g6,	%i6
	udiv	%o6,	0x1970,	%o5
	movleu	%xcc,	%l1,	%l6
	fmovsvs	%icc,	%f22,	%f20
	ldd	[%l7 + 0x60],	%g4
	xorcc	%i1,	%g4,	%i2
	movre	%i4,	%g1,	%o0
	popc	0x1DEF,	%o3
	movleu	%icc,	%i7,	%l3
	or	%o2,	0x0D32,	%i0
	fcmped	%fcc3,	%f28,	%f14
	fnegs	%f8,	%f5
	addc	%o4,	0x0FD1,	%l5
	edge8	%i5,	%l4,	%g2
	edge8l	%i3,	%g3,	%o7
	fors	%f8,	%f30,	%f24
	sdiv	%l0,	0x1813,	%l2
	ldd	[%l7 + 0x58],	%o0
	lduw	[%l7 + 0x68],	%g6
	array8	%i6,	%o6,	%o5
	movcs	%icc,	%g7,	%l6
	save %g5, %l1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2s	%f7,	%f28
	fcmpgt16	%f10,	%f28,	%i2
	edge8ln	%i4,	%i1,	%o0
	xnorcc	%g1,	0x13B7,	%i7
	movneg	%xcc,	%l3,	%o2
	ldd	[%l7 + 0x70],	%i0
	edge8n	%o3,	%o4,	%i5
	fmovsneg	%xcc,	%f7,	%f7
	fnot1	%f6,	%f24
	sir	0x01A0
	edge32	%l4,	%g2,	%i3
	popc	%l5,	%g3
	movrgez	%l0,	%o7,	%l2
	array32	%o1,	%g6,	%i6
	movcc	%xcc,	%o6,	%g7
	movl	%xcc,	%o5,	%g5
	addc	%l1,	0x125C,	%l6
	edge8ln	%i2,	%g4,	%i1
	stw	%i4,	[%l7 + 0x74]
	ldd	[%l7 + 0x50],	%g0
	umul	%i7,	0x0164,	%l3
	movrlz	%o0,	0x0BD,	%i0
	stw	%o3,	[%l7 + 0x68]
	fmovrsgz	%o4,	%f26,	%f2
	fabss	%f16,	%f28
	std	%f18,	[%l7 + 0x68]
	fmovdle	%icc,	%f19,	%f19
	fmovspos	%icc,	%f9,	%f30
	stw	%i5,	[%l7 + 0x6C]
	sll	%l4,	%o2,	%g2
	andcc	%i3,	0x1492,	%l5
	alignaddrl	%l0,	%o7,	%g3
	fnot1	%f2,	%f28
	srlx	%l2,	%g6,	%i6
	movn	%icc,	%o1,	%g7
	fmovrse	%o6,	%f4,	%f13
	movcs	%xcc,	%o5,	%l1
	subccc	%g5,	0x0D55,	%l6
	movleu	%icc,	%g4,	%i2
	ldx	[%l7 + 0x38],	%i1
	fnot1	%f22,	%f16
	edge32	%g1,	%i7,	%l3
	movneg	%icc,	%i4,	%o0
	orcc	%o3,	%i0,	%o4
	ldsh	[%l7 + 0x0A],	%l4
	smulcc	%o2,	%i5,	%i3
	fxors	%f7,	%f17,	%f6
	movneg	%xcc,	%g2,	%l5
	lduw	[%l7 + 0x34],	%o7
	movgu	%xcc,	%l0,	%l2
	fmovdvs	%xcc,	%f10,	%f27
	srl	%g3,	0x05,	%i6
	movrlez	%o1,	0x130,	%g7
	fmovrslz	%o6,	%f15,	%f9
	orcc	%o5,	%g6,	%l1
	movrne	%l6,	%g5,	%i2
	sdivx	%g4,	0x0CB0,	%i1
	fmovdvc	%xcc,	%f1,	%f20
	udiv	%g1,	0x084F,	%i7
	popc	0x158E,	%i4
	fors	%f31,	%f8,	%f18
	andn	%l3,	%o0,	%o3
	movrne	%o4,	0x076,	%i0
	popc	%l4,	%i5
	nop
	set	0x50, %g6
	ldx	[%l7 + %g6],	%o2
	edge16n	%g2,	%i3,	%o7
	stx	%l5,	[%l7 + 0x18]
	udivcc	%l2,	0x0F8A,	%l0
	edge8n	%g3,	%o1,	%g7
	ld	[%l7 + 0x7C],	%f8
	sub	%i6,	%o6,	%o5
	fpadd32	%f10,	%f30,	%f30
	addccc	%g6,	%l6,	%l1
	fcmple16	%f12,	%f28,	%g5
	sub	%g4,	0x0402,	%i1
	andncc	%g1,	%i7,	%i2
	movrgez	%l3,	0x07E,	%o0
	movrne	%i4,	0x136,	%o4
	fmovscc	%xcc,	%f22,	%f7
	movrlez	%i0,	0x0ED,	%l4
	fcmpne16	%f8,	%f28,	%o3
	stx	%i5,	[%l7 + 0x48]
	movl	%xcc,	%g2,	%i3
	mulx	%o7,	%l5,	%o2
	movrne	%l2,	%g3,	%o1
	sth	%g7,	[%l7 + 0x50]
	movrgez	%l0,	%o6,	%i6
	andn	%g6,	%o5,	%l1
	array8	%l6,	%g4,	%g5
	fmul8x16al	%f30,	%f21,	%f12
	movre	%i1,	0x32D,	%g1
	movpos	%icc,	%i2,	%l3
	movvc	%icc,	%o0,	%i7
	umulcc	%i4,	%i0,	%o4
	edge8l	%o3,	%l4,	%g2
	fmovscc	%icc,	%f4,	%f17
	movrgz	%i3,	%o7,	%i5
	fcmple16	%f14,	%f22,	%l5
	move	%icc,	%o2,	%g3
	ld	[%l7 + 0x08],	%f24
	udivcc	%o1,	0x1CB8,	%l2
	xorcc	%g7,	%o6,	%l0
	mova	%icc,	%i6,	%o5
	fmuld8sux16	%f24,	%f16,	%f6
	fxnor	%f24,	%f26,	%f8
	udiv	%g6,	0x1DAA,	%l1
	orn	%g4,	0x0D5D,	%l6
	fmovdneg	%xcc,	%f5,	%f3
	fmovscs	%icc,	%f11,	%f29
	fcmple16	%f8,	%f6,	%i1
	xnor	%g5,	%g1,	%i2
	udivcc	%l3,	0x1CC4,	%o0
	fnand	%f4,	%f10,	%f16
	ldsb	[%l7 + 0x0A],	%i4
	movl	%xcc,	%i7,	%o4
	movre	%i0,	%l4,	%o3
	movrgez	%i3,	0x196,	%g2
	movg	%icc,	%o7,	%i5
	subccc	%o2,	%l5,	%o1
	xorcc	%l2,	%g3,	%o6
	ld	[%l7 + 0x38],	%f0
	sdivx	%l0,	0x1A79,	%g7
	andn	%o5,	%i6,	%g6
	orcc	%l1,	%l6,	%g4
	add	%i1,	%g1,	%i2
	fmul8x16al	%f26,	%f7,	%f20
	faligndata	%f30,	%f24,	%f8
	sir	0x02A1
	edge16	%l3,	%o0,	%i4
	andcc	%g5,	%i7,	%i0
	xorcc	%l4,	0x0EDB,	%o4
	sdivx	%i3,	0x101F,	%g2
	alignaddrl	%o3,	%i5,	%o2
	fexpand	%f26,	%f2
	ldx	[%l7 + 0x58],	%o7
	edge16	%o1,	%l5,	%g3
	udiv	%o6,	0x0927,	%l2
	xnorcc	%g7,	0x1F10,	%l0
	fmovdg	%icc,	%f20,	%f14
	fpack32	%f28,	%f30,	%f18
	andn	%i6,	%g6,	%l1
	movrlez	%o5,	%g4,	%l6
	fornot2	%f22,	%f18,	%f0
	sub	%i1,	%g1,	%l3
	bshuffle	%f18,	%f8,	%f10
	fpadd32	%f28,	%f30,	%f24
	move	%xcc,	%o0,	%i4
	umulcc	%i2,	%i7,	%i0
	srlx	%l4,	0x0C,	%g5
	ldd	[%l7 + 0x08],	%i2
	and	%o4,	%g2,	%i5
	sra	%o2,	0x0D,	%o7
	udivcc	%o3,	0x008B,	%o1
	movn	%xcc,	%g3,	%o6
	movl	%icc,	%l2,	%g7
	std	%f24,	[%l7 + 0x68]
	srl	%l0,	0x00,	%i6
	orn	%g6,	%l1,	%l5
	smulcc	%o5,	%l6,	%i1
	subc	%g4,	%g1,	%o0
	xnor	%i4,	0x1813,	%l3
	fsrc2	%f14,	%f16
	ldsw	[%l7 + 0x24],	%i2
	orn	%i0,	0x0FCF,	%l4
	subccc	%g5,	%i3,	%i7
	and	%o4,	%i5,	%o2
	fsrc2	%f12,	%f22
	xorcc	%g2,	0x00F7,	%o3
	fnands	%f5,	%f16,	%f27
	ld	[%l7 + 0x38],	%f17
	and	%o7,	0x0540,	%o1
	srlx	%o6,	%g3,	%l2
	move	%xcc,	%g7,	%i6
	movrgz	%g6,	0x2EB,	%l0
	orcc	%l1,	%l5,	%o5
	edge32	%l6,	%i1,	%g1
	fmovsn	%xcc,	%f15,	%f13
	edge32l	%g4,	%o0,	%l3
	edge8ln	%i2,	%i0,	%l4
	movrgz	%i4,	0x23C,	%g5
	fmovde	%icc,	%f3,	%f23
	sll	%i7,	%i3,	%o4
	fcmple32	%f16,	%f30,	%o2
	lduh	[%l7 + 0x4E],	%g2
	andcc	%o3,	0x1449,	%o7
	popc	0x0A17,	%o1
	st	%f9,	[%l7 + 0x64]
	fmovde	%xcc,	%f21,	%f21
	addccc	%o6,	%i5,	%g3
	edge8n	%l2,	%g7,	%g6
	sdiv	%l0,	0x04AA,	%i6
	edge16	%l1,	%l5,	%o5
	movle	%icc,	%l6,	%g1
	movneg	%xcc,	%g4,	%i1
	edge32l	%o0,	%i2,	%l3
	andcc	%i0,	%i4,	%l4
	edge16ln	%g5,	%i7,	%o4
	movrgz	%i3,	%g2,	%o2
	or	%o7,	0x1395,	%o3
	std	%f20,	[%l7 + 0x48]
	restore %o1, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x2C],	%f10
	movrgez	%l2,	%o6,	%g6
	save %l0, 0x0304, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i6,	%l1,	%o5
	fmovrdlez	%l5,	%f22,	%f0
	xor	%l6,	0x09E9,	%g4
	fandnot2	%f18,	%f20,	%f18
	smul	%i1,	%g1,	%i2
	fornot2	%f20,	%f30,	%f26
	array16	%l3,	%i0,	%i4
	sdivcc	%l4,	0x1ED6,	%o0
	fzeros	%f15
	udiv	%i7,	0x1F4F,	%g5
	andn	%o4,	0x0F54,	%g2
	or	%o2,	%i3,	%o3
	fcmple32	%f16,	%f6,	%o7
	sllx	%o1,	%g3,	%i5
	fxor	%f14,	%f2,	%f10
	alignaddrl	%l2,	%o6,	%g6
	movre	%l0,	%g7,	%l1
	ld	[%l7 + 0x2C],	%f16
	movrgez	%o5,	%l5,	%i6
	movge	%icc,	%g4,	%i1
	movvs	%xcc,	%g1,	%i2
	ldub	[%l7 + 0x68],	%l3
	movrlz	%i0,	0x18B,	%i4
	edge32ln	%l6,	%o0,	%i7
	nop
	set	0x2C, %g2
	lduw	[%l7 + %g2],	%g5
	fors	%f6,	%f14,	%f31
	movleu	%xcc,	%o4,	%l4
	addcc	%o2,	%g2,	%i3
	fmovdvs	%xcc,	%f24,	%f17
	sdivcc	%o7,	0x12B1,	%o3
	fxnor	%f6,	%f20,	%f24
	nop
	set	0x10, %g3
	stx	%g3,	[%l7 + %g3]
	subc	%o1,	0x10EB,	%i5
	ld	[%l7 + 0x4C],	%f23
	sub	%l2,	0x08B8,	%g6
	andcc	%o6,	0x170A,	%g7
	movl	%xcc,	%l0,	%o5
	mova	%icc,	%l1,	%i6
	stw	%g4,	[%l7 + 0x48]
	fpadd32	%f2,	%f24,	%f26
	sdivx	%i1,	0x1774,	%l5
	alignaddrl	%g1,	%i2,	%i0
	fmovsg	%xcc,	%f5,	%f5
	movpos	%xcc,	%l3,	%l6
	fcmpne16	%f30,	%f20,	%i4
	movre	%o0,	%i7,	%o4
	fmul8sux16	%f2,	%f16,	%f22
	sllx	%g5,	0x16,	%o2
	movvc	%icc,	%g2,	%i3
	edge32	%l4,	%o7,	%o3
	movgu	%xcc,	%o1,	%i5
	ldub	[%l7 + 0x71],	%g3
	sll	%g6,	%l2,	%g7
	edge32ln	%o6,	%o5,	%l0
	sethi	0x033D,	%l1
	ldd	[%l7 + 0x50],	%i6
	movg	%xcc,	%g4,	%i1
	mova	%xcc,	%g1,	%l5
	edge16l	%i2,	%i0,	%l3
	fpsub16	%f10,	%f10,	%f2
	fmovda	%xcc,	%f29,	%f20
	smulcc	%i4,	0x11B2,	%o0
	edge16n	%i7,	%l6,	%o4
	move	%xcc,	%o2,	%g5
	smul	%i3,	%g2,	%o7
	fmovdvs	%icc,	%f9,	%f30
	edge16	%l4,	%o1,	%o3
	addccc	%g3,	0x0C46,	%g6
	sra	%l2,	0x1B,	%i5
	sir	0x05D1
	mova	%icc,	%g7,	%o5
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%o6
	ldd	[%l7 + 0x60],	%l0
	std	%f20,	[%l7 + 0x58]
	edge32ln	%i6,	%l0,	%g4
	sir	0x1F2F
	movre	%g1,	0x24D,	%i1
	orncc	%l5,	%i0,	%i2
	addccc	%i4,	0x0D9E,	%o0
	ld	[%l7 + 0x48],	%f9
	fmul8sux16	%f6,	%f2,	%f2
	sdivx	%l3,	0x1536,	%i7
	udivcc	%l6,	0x0C47,	%o2
	ldx	[%l7 + 0x30],	%g5
	smul	%o4,	%i3,	%o7
	fmovrdne	%g2,	%f8,	%f24
	movle	%icc,	%o1,	%o3
	fcmple16	%f10,	%f22,	%l4
	movcc	%icc,	%g6,	%l2
	nop
	set	0x20, %l5
	stx	%i5,	[%l7 + %l5]
	fmovscc	%xcc,	%f12,	%f26
	mulscc	%g3,	0x02F3,	%g7
	edge8l	%o6,	%l1,	%i6
	edge16	%l0,	%g4,	%g1
	fcmpne16	%f14,	%f10,	%i1
	fmovsle	%icc,	%f4,	%f21
	addc	%l5,	0x0CB6,	%i0
	sir	0x17DD
	lduw	[%l7 + 0x08],	%i2
	movg	%xcc,	%i4,	%o0
	orncc	%o5,	0x1F84,	%l3
	lduw	[%l7 + 0x08],	%i7
	fmovsvs	%icc,	%f9,	%f25
	movneg	%xcc,	%l6,	%g5
	umul	%o4,	%o2,	%o7
	fmovdl	%xcc,	%f23,	%f19
	xorcc	%g2,	%i3,	%o3
	and	%l4,	0x0D38,	%g6
	ldd	[%l7 + 0x20],	%f26
	movn	%xcc,	%l2,	%o1
	edge16	%g3,	%g7,	%i5
	movl	%xcc,	%o6,	%l1
	edge16l	%i6,	%l0,	%g1
	and	%i1,	%l5,	%g4
	fmovrse	%i0,	%f26,	%f11
	nop
	set	0x70, %l3
	ldd	[%l7 + %l3],	%i4
	add	%i2,	%o0,	%o5
	orn	%i7,	0x145C,	%l6
	lduw	[%l7 + 0x24],	%l3
	sub	%g5,	%o4,	%o7
	fmovde	%xcc,	%f4,	%f25
	edge8	%g2,	%o2,	%o3
	fabsd	%f8,	%f14
	st	%f10,	[%l7 + 0x50]
	save %i3, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g6,	%g3
	umulcc	%o1,	%g7,	%o6
	ld	[%l7 + 0x74],	%f18
	movgu	%xcc,	%l1,	%i6
	addccc	%i5,	0x03BA,	%l0
	fsrc2s	%f3,	%f6
	or	%g1,	%l5,	%i1
	ldd	[%l7 + 0x10],	%f12
	edge16ln	%i0,	%g4,	%i4
	save %o0, 0x1F70, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i2,	%i7,	%l6
	edge8n	%l3,	%g5,	%o7
	edge8ln	%g2,	%o4,	%o3
	movvs	%xcc,	%o2,	%l4
	ldsh	[%l7 + 0x6E],	%l2
	smul	%i3,	%g6,	%o1
	add	%g3,	0x0991,	%g7
	andcc	%l1,	%o6,	%i5
	fsrc2s	%f9,	%f20
	array32	%l0,	%i6,	%g1
	edge8ln	%l5,	%i1,	%i0
	andncc	%i4,	%g4,	%o5
	xnorcc	%o0,	%i2,	%i7
	fxnor	%f10,	%f22,	%f24
	sub	%l6,	%g5,	%o7
	fabsd	%f12,	%f4
	edge8ln	%g2,	%o4,	%o3
	fnot1s	%f18,	%f23
	orcc	%o2,	0x0AA6,	%l4
	ld	[%l7 + 0x64],	%f6
	sdivx	%l2,	0x006C,	%i3
	fmovsvc	%icc,	%f9,	%f23
	movcs	%icc,	%g6,	%l3
	addcc	%g3,	%g7,	%l1
	fsrc1	%f16,	%f28
	edge16	%o6,	%i5,	%l0
	movn	%xcc,	%o1,	%i6
	movcc	%icc,	%g1,	%i1
	xnor	%l5,	%i4,	%g4
	fornot1s	%f19,	%f21,	%f12
	movleu	%xcc,	%o5,	%i0
	edge8ln	%o0,	%i7,	%l6
	movge	%xcc,	%g5,	%o7
	subc	%i2,	0x0120,	%g2
	xnor	%o3,	%o2,	%l4
	smulcc	%l2,	%o4,	%g6
	fsrc1s	%f11,	%f22
	movrgz	%l3,	0x2B4,	%i3
	udiv	%g7,	0x1F30,	%g3
	move	%xcc,	%o6,	%i5
	ldsh	[%l7 + 0x48],	%l1
	movne	%icc,	%o1,	%l0
	edge16ln	%g1,	%i6,	%l5
	bshuffle	%f14,	%f22,	%f24
	sdiv	%i4,	0x02CD,	%i1
	sllx	%o5,	%g4,	%i0
	smulcc	%i7,	0x177B,	%o0
	sethi	0x087B,	%g5
	udivcc	%o7,	0x1EC7,	%l6
	fxnor	%f28,	%f10,	%f16
	movrgez	%i2,	0x308,	%o3
	lduw	[%l7 + 0x58],	%g2
	array32	%o2,	%l4,	%l2
	xnor	%g6,	%l3,	%o4
	xorcc	%g7,	%i3,	%g3
	fandnot2	%f26,	%f6,	%f14
	movrlez	%o6,	%l1,	%o1
	sethi	0x06E6,	%l0
	ldsb	[%l7 + 0x4F],	%i5
	fcmpeq32	%f18,	%f30,	%g1
	fands	%f6,	%f31,	%f30
	movcs	%xcc,	%i6,	%i4
	subc	%l5,	0x1844,	%o5
	srl	%i1,	%i0,	%g4
	fcmple16	%f28,	%f2,	%o0
	umul	%g5,	0x08D5,	%o7
	ldd	[%l7 + 0x10],	%i6
	srl	%i2,	%i7,	%o3
	movle	%icc,	%o2,	%l4
	sllx	%l2,	%g6,	%l3
	srl	%o4,	0x0F,	%g7
	movrgz	%i3,	0x22D,	%g3
	movvs	%xcc,	%o6,	%l1
	andcc	%g2,	%l0,	%i5
	fmovdn	%xcc,	%f25,	%f17
	addccc	%o1,	%g1,	%i6
	fmovdgu	%xcc,	%f2,	%f9
	fmovdleu	%icc,	%f18,	%f20
	movl	%xcc,	%i4,	%l5
	orncc	%o5,	%i1,	%i0
	movpos	%xcc,	%g4,	%g5
	sdivcc	%o0,	0x1805,	%l6
	sth	%i2,	[%l7 + 0x62]
	stx	%i7,	[%l7 + 0x20]
	xor	%o7,	%o2,	%l4
	edge32ln	%l2,	%o3,	%l3
	fpadd32	%f20,	%f4,	%f18
	fsrc2s	%f15,	%f1
	srl	%g6,	%g7,	%i3
	xor	%g3,	0x1CC9,	%o6
	fcmpes	%fcc1,	%f9,	%f27
	fsrc2s	%f19,	%f16
	alignaddrl	%l1,	%g2,	%o4
	fmovdcs	%xcc,	%f20,	%f24
	fmovdneg	%xcc,	%f9,	%f20
	nop
	set	0x58, %l2
	stw	%l0,	[%l7 + %l2]
	fmovrde	%i5,	%f0,	%f8
	add	%o1,	%g1,	%i6
	lduh	[%l7 + 0x28],	%i4
	fcmpne32	%f4,	%f28,	%o5
	sra	%l5,	0x10,	%i1
	movrgez	%g4,	%g5,	%o0
	nop
	set	0x78, %o6
	ldd	[%l7 + %o6],	%f24
	edge16n	%l6,	%i0,	%i7
	edge16n	%o7,	%o2,	%i2
	edge16ln	%l2,	%o3,	%l4
	fmovdcc	%xcc,	%f30,	%f15
	srl	%l3,	0x10,	%g7
	smulcc	%g6,	0x165C,	%g3
	array16	%i3,	%l1,	%o6
	fcmps	%fcc2,	%f17,	%f3
	fmovrdgez	%g2,	%f4,	%f26
	udivx	%l0,	0x0F17,	%i5
	sllx	%o4,	%o1,	%i6
	mova	%xcc,	%i4,	%g1
	fmuld8sux16	%f22,	%f9,	%f4
	ldsh	[%l7 + 0x64],	%l5
	sdivx	%o5,	0x08D3,	%i1
	edge16n	%g5,	%g4,	%l6
	edge16n	%i0,	%o0,	%o7
	movl	%xcc,	%i7,	%i2
	movgu	%icc,	%l2,	%o3
	fornot1	%f2,	%f22,	%f18
	addccc	%o2,	%l4,	%g7
	fabsd	%f2,	%f8
	fpadd32s	%f8,	%f24,	%f4
	udivx	%l3,	0x030F,	%g3
	edge32ln	%i3,	%l1,	%g6
	umulcc	%g2,	0x15C7,	%l0
	udiv	%i5,	0x1F3A,	%o4
	edge8	%o1,	%i6,	%o6
	xor	%i4,	%g1,	%l5
	andncc	%o5,	%g5,	%i1
	fzero	%f16
	fzero	%f0
	popc	0x1D35,	%l6
	lduw	[%l7 + 0x64],	%g4
	fmovdgu	%icc,	%f1,	%f21
	subcc	%o0,	0x1881,	%i0
	fpadd16s	%f18,	%f2,	%f4
	orncc	%o7,	0x1A9B,	%i7
	fones	%f13
	udiv	%i2,	0x1867,	%l2
	array8	%o3,	%l4,	%o2
	andncc	%g7,	%l3,	%i3
	movge	%icc,	%g3,	%g6
	alignaddrl	%l1,	%g2,	%i5
	sll	%o4,	0x15,	%o1
	fcmpes	%fcc0,	%f7,	%f21
	movcs	%icc,	%l0,	%i6
	sllx	%i4,	%o6,	%g1
	ldsb	[%l7 + 0x15],	%o5
	bshuffle	%f26,	%f4,	%f4
	pdist	%f24,	%f4,	%f28
	umulcc	%g5,	0x11BF,	%l5
	subccc	%l6,	%i1,	%g4
	sra	%o0,	%i0,	%o7
	srax	%i7,	%i2,	%l2
	fmovda	%icc,	%f1,	%f5
	orn	%o3,	0x035B,	%l4
	fmovrslz	%g7,	%f23,	%f15
	addccc	%o2,	0x1842,	%l3
	subccc	%i3,	%g6,	%l1
	movleu	%icc,	%g2,	%i5
	sethi	0x1B64,	%o4
	alignaddrl	%g3,	%l0,	%o1
	ldsb	[%l7 + 0x6E],	%i4
	srax	%o6,	0x1F,	%g1
	fmovdvc	%xcc,	%f11,	%f16
	edge8	%o5,	%g5,	%l5
	fornot1s	%f27,	%f15,	%f21
	fcmped	%fcc0,	%f24,	%f24
	movrgez	%l6,	%i6,	%i1
	ldx	[%l7 + 0x40],	%g4
	or	%o0,	0x1754,	%o7
	fmovsvc	%xcc,	%f29,	%f30
	movg	%xcc,	%i0,	%i2
	fmovs	%f3,	%f30
	edge32l	%l2,	%i7,	%l4
	fmovscc	%icc,	%f3,	%f18
	mova	%xcc,	%g7,	%o2
	fmovscc	%icc,	%f16,	%f5
	fmovdvc	%xcc,	%f15,	%f4
	movrlz	%o3,	%i3,	%l3
	xorcc	%l1,	0x1A4C,	%g6
	movgu	%icc,	%i5,	%o4
	sir	0x1337
	addccc	%g2,	0x01E7,	%l0
	fmovrdgz	%o1,	%f16,	%f26
	fmul8x16al	%f0,	%f10,	%f10
	movrgez	%i4,	%o6,	%g1
	ldx	[%l7 + 0x20],	%g3
	fpmerge	%f19,	%f0,	%f18
	popc	0x1DBB,	%g5
	add	%l5,	0x10B2,	%l6
	edge16	%i6,	%i1,	%g4
	fone	%f6
	fpack32	%f18,	%f6,	%f18
	fmovda	%xcc,	%f29,	%f23
	movneg	%icc,	%o5,	%o7
	fpack32	%f14,	%f20,	%f18
	fpack32	%f26,	%f6,	%f10
	udivx	%i0,	0x0C6F,	%o0
	srax	%i2,	0x00,	%l2
	xnorcc	%l4,	0x1F7A,	%i7
	movrgz	%o2,	%o3,	%i3
	movcc	%icc,	%g7,	%l3
	fmovdg	%icc,	%f20,	%f28
	sra	%l1,	%g6,	%i5
	udivx	%g2,	0x12CD,	%o4
	movge	%icc,	%o1,	%i4
	sth	%o6,	[%l7 + 0x3C]
	stx	%g1,	[%l7 + 0x10]
	srl	%l0,	0x07,	%g3
	edge8l	%g5,	%l5,	%l6
	fcmped	%fcc3,	%f28,	%f0
	movrlz	%i6,	%i1,	%o5
	movle	%icc,	%g4,	%o7
	movle	%icc,	%o0,	%i2
	fmul8x16au	%f31,	%f23,	%f12
	movne	%xcc,	%l2,	%i0
	fpsub32	%f2,	%f14,	%f30
	edge8ln	%l4,	%i7,	%o3
	fmovrsgz	%o2,	%f29,	%f11
	fone	%f30
	fexpand	%f9,	%f10
	ldsb	[%l7 + 0x57],	%g7
	andncc	%l3,	%l1,	%g6
	movcc	%icc,	%i5,	%i3
	udivx	%g2,	0x0AD5,	%o4
	movvs	%xcc,	%i4,	%o1
	movne	%xcc,	%o6,	%g1
	movrne	%g3,	0x377,	%l0
	movne	%xcc,	%g5,	%l6
	movn	%icc,	%l5,	%i1
	fmovdgu	%icc,	%f0,	%f30
	andcc	%i6,	%g4,	%o7
	move	%xcc,	%o5,	%o0
	movneg	%xcc,	%l2,	%i2
	fmovsneg	%xcc,	%f28,	%f31
	movge	%icc,	%i0,	%i7
	srl	%o3,	0x0B,	%o2
	addcc	%g7,	0x1718,	%l3
	fone	%f4
	or	%l4,	%l1,	%g6
	fmovdl	%xcc,	%f29,	%f10
	udiv	%i3,	0x0601,	%i5
	alignaddr	%o4,	%i4,	%g2
	fpack32	%f30,	%f16,	%f20
	edge8	%o6,	%o1,	%g1
	movle	%xcc,	%l0,	%g5
	alignaddr	%g3,	%l6,	%i1
	fones	%f14
	edge32n	%i6,	%l5,	%g4
	smulcc	%o7,	%o0,	%l2
	movrlz	%o5,	0x370,	%i0
	movrne	%i2,	%i7,	%o2
	fmovrse	%g7,	%f3,	%f13
	movn	%icc,	%o3,	%l4
	sth	%l1,	[%l7 + 0x0E]
	orcc	%g6,	%i3,	%i5
	edge8ln	%l3,	%o4,	%g2
	or	%o6,	%o1,	%i4
	orn	%g1,	0x16F2,	%l0
	movg	%xcc,	%g5,	%g3
	edge32ln	%l6,	%i1,	%l5
	movneg	%xcc,	%i6,	%g4
	ldd	[%l7 + 0x58],	%f28
	fmovdg	%xcc,	%f23,	%f19
	alignaddrl	%o0,	%l2,	%o7
	xorcc	%i0,	0x1A48,	%o5
	andcc	%i7,	%o2,	%i2
	movle	%icc,	%g7,	%l4
	ld	[%l7 + 0x68],	%f11
	lduw	[%l7 + 0x34],	%l1
	edge32n	%o3,	%g6,	%i3
	lduw	[%l7 + 0x70],	%i5
	movneg	%xcc,	%o4,	%g2
	stx	%l3,	[%l7 + 0x40]
	ldd	[%l7 + 0x50],	%o0
	nop
	set	0x60, %i0
	lduh	[%l7 + %i0],	%i4
	xnorcc	%g1,	%o6,	%g5
	alignaddrl	%l0,	%g3,	%l6
	edge32ln	%i1,	%l5,	%g4
	sth	%o0,	[%l7 + 0x28]
	array16	%i6,	%o7,	%i0
	fnand	%f24,	%f24,	%f2
	ldsw	[%l7 + 0x38],	%o5
	addc	%l2,	0x11DD,	%o2
	fcmpeq16	%f30,	%f26,	%i7
	movle	%icc,	%g7,	%l4
	array16	%l1,	%o3,	%i2
	xnor	%i3,	0x135F,	%g6
	movge	%icc,	%o4,	%g2
	ldd	[%l7 + 0x08],	%f4
	movcc	%xcc,	%i5,	%o1
	fnegd	%f28,	%f28
	fmovrdlz	%l3,	%f0,	%f28
	edge32l	%i4,	%o6,	%g1
	ldx	[%l7 + 0x58],	%g5
	subcc	%l0,	0x1B8C,	%g3
	xnorcc	%l6,	%i1,	%l5
	movre	%o0,	0x056,	%i6
	fmul8ulx16	%f24,	%f14,	%f16
	fsrc1	%f30,	%f4
	array8	%o7,	%g4,	%i0
	sir	0x0084
	lduh	[%l7 + 0x5C],	%l2
	array16	%o2,	%o5,	%g7
	sdivx	%l4,	0x0F2D,	%l1
	ld	[%l7 + 0x0C],	%f3
	srlx	%i7,	0x1B,	%i2
	movl	%xcc,	%o3,	%i3
	fxor	%f16,	%f28,	%f18
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	sub	%o1,	%l3,	%i4
	udivx	%o6,	0x06B2,	%g1
	xorcc	%i5,	%l0,	%g3
	subc	%l6,	0x1E6E,	%g5
	stx	%i1,	[%l7 + 0x38]
	fcmps	%fcc1,	%f22,	%f13
	ldsb	[%l7 + 0x39],	%l5
	fmovsle	%xcc,	%f25,	%f30
	edge16	%o0,	%o7,	%g4
	movle	%icc,	%i6,	%i0
	sub	%o2,	0x0C36,	%l2
	subcc	%o5,	%g7,	%l1
	sra	%l4,	%i7,	%o3
	movvs	%icc,	%i2,	%o4
	lduh	[%l7 + 0x0C],	%g6
	subc	%g2,	%i3,	%o1
	movcc	%icc,	%i4,	%l3
	edge8l	%g1,	%i5,	%o6
	srax	%l0,	0x0D,	%g3
	fmovrslez	%l6,	%f20,	%f23
	fmul8sux16	%f2,	%f10,	%f2
	ldx	[%l7 + 0x50],	%g5
	fmovdg	%xcc,	%f20,	%f19
	for	%f10,	%f26,	%f14
	movrne	%l5,	%o0,	%i1
	fcmpgt16	%f20,	%f14,	%g4
	andcc	%o7,	0x05CD,	%i0
	fcmple32	%f12,	%f8,	%o2
	fcmps	%fcc2,	%f12,	%f9
	srax	%l2,	0x0E,	%i6
	mulx	%g7,	0x1E81,	%o5
	stx	%l1,	[%l7 + 0x68]
	fcmpd	%fcc1,	%f26,	%f30
	fmovsleu	%icc,	%f2,	%f18
	fmul8sux16	%f2,	%f10,	%f26
	subc	%l4,	%i7,	%i2
	edge8ln	%o3,	%o4,	%g6
	ldsb	[%l7 + 0x6A],	%g2
	movpos	%icc,	%o1,	%i3
	stx	%l3,	[%l7 + 0x08]
	andcc	%i4,	0x154F,	%g1
	sllx	%o6,	0x0C,	%l0
	ldd	[%l7 + 0x70],	%f14
	fexpand	%f28,	%f20
	movg	%icc,	%i5,	%g3
	umul	%l6,	%l5,	%o0
	fsrc1s	%f19,	%f17
	sra	%i1,	0x1C,	%g4
	edge32	%o7,	%g5,	%i0
	andn	%l2,	%i6,	%g7
	addccc	%o2,	%l1,	%o5
	movrne	%l4,	%i2,	%i7
	edge8ln	%o4,	%g6,	%o3
	sub	%o1,	%i3,	%l3
	array16	%g2,	%g1,	%i4
	restore %l0, %i5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l6,	[%l7 + 0x34]
	fmovdl	%xcc,	%f9,	%f6
	mulx	%l5,	%o0,	%g3
	movrgez	%i1,	%o7,	%g5
	movrne	%g4,	%l2,	%i6
	movcc	%icc,	%g7,	%o2
	movpos	%icc,	%i0,	%o5
	edge16l	%l4,	%l1,	%i7
	edge8ln	%o4,	%i2,	%g6
	movne	%xcc,	%o1,	%o3
	move	%xcc,	%l3,	%g2
	srlx	%g1,	0x05,	%i4
	addcc	%i3,	%l0,	%i5
	umul	%l6,	%o6,	%l5
	sethi	0x1F40,	%o0
	movle	%icc,	%g3,	%i1
	sub	%g5,	0x1E6A,	%o7
	add	%g4,	%l2,	%g7
	sub	%o2,	%i6,	%o5
	movrlz	%i0,	0x030,	%l1
	umulcc	%l4,	0x1AC9,	%i7
	array8	%o4,	%i2,	%o1
	ld	[%l7 + 0x6C],	%f17
	fmovrdgez	%g6,	%f10,	%f20
	movvc	%xcc,	%o3,	%g2
	srax	%g1,	0x0F,	%l3
	fmovde	%xcc,	%f1,	%f19
	fmul8x16au	%f6,	%f8,	%f8
	array16	%i3,	%l0,	%i4
	std	%f18,	[%l7 + 0x08]
	fnot2	%f24,	%f30
	popc	%i5,	%o6
	ld	[%l7 + 0x74],	%f9
	stb	%l5,	[%l7 + 0x22]
	movl	%icc,	%l6,	%g3
	save %o0, 0x06A4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o7,	%g5,	%g4
	srax	%g7,	%o2,	%i6
	movneg	%icc,	%l2,	%o5
	nop
	set	0x2C, %i7
	lduw	[%l7 + %i7],	%l1
	move	%xcc,	%i0,	%i7
	sllx	%o4,	0x1C,	%i2
	edge32n	%o1,	%l4,	%g6
	fmovrdlz	%o3,	%f22,	%f24
	array32	%g1,	%g2,	%l3
	movrlez	%i3,	0x357,	%i4
	addccc	%i5,	0x10F0,	%l0
	fmovsge	%icc,	%f13,	%f14
	andn	%l5,	%o6,	%g3
	nop
	set	0x68, %i1
	ldx	[%l7 + %i1],	%o0
	movrgz	%l6,	%o7,	%i1
	ldub	[%l7 + 0x49],	%g4
	srl	%g7,	0x18,	%o2
	ld	[%l7 + 0x18],	%f21
	sdivcc	%i6,	0x19F6,	%g5
	edge16n	%l2,	%l1,	%o5
	fmovrdne	%i7,	%f2,	%f26
	movne	%icc,	%i0,	%i2
	edge8ln	%o1,	%o4,	%g6
	fornot2s	%f26,	%f15,	%f0
	fnor	%f10,	%f12,	%f2
	xor	%l4,	0x1406,	%g1
	st	%f6,	[%l7 + 0x4C]
	sdivx	%o3,	0x0BD9,	%l3
	fornot2s	%f22,	%f21,	%f5
	movvs	%icc,	%i3,	%g2
	st	%f31,	[%l7 + 0x4C]
	fmovscs	%icc,	%f19,	%f26
	udiv	%i5,	0x1DE0,	%i4
	save %l0, %o6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o0,	%g3,	%o7
	movvs	%icc,	%i1,	%g4
	ldd	[%l7 + 0x08],	%f0
	addc	%l6,	%g7,	%o2
	movrlez	%g5,	%l2,	%i6
	array8	%l1,	%i7,	%i0
	fcmpd	%fcc2,	%f30,	%f22
	fcmpes	%fcc0,	%f30,	%f4
	array32	%o5,	%o1,	%i2
	ldd	[%l7 + 0x48],	%f30
	edge16n	%o4,	%g6,	%l4
	edge16	%o3,	%l3,	%g1
	movcc	%xcc,	%g2,	%i5
	xnor	%i4,	0x161E,	%l0
	fmul8sux16	%f8,	%f0,	%f22
	edge32n	%o6,	%l5,	%o0
	fmovdge	%xcc,	%f9,	%f31
	smul	%g3,	%i3,	%i1
	std	%f18,	[%l7 + 0x58]
	ldsh	[%l7 + 0x16],	%o7
	edge16n	%l6,	%g7,	%o2
	and	%g5,	%l2,	%g4
	sll	%i6,	0x18,	%l1
	movrgez	%i0,	%o5,	%o1
	edge8l	%i7,	%o4,	%i2
	udivcc	%l4,	0x1ACA,	%g6
	orcc	%o3,	0x1D6D,	%l3
	ldd	[%l7 + 0x68],	%g0
	fmovdge	%xcc,	%f10,	%f17
	movrlz	%g2,	0x034,	%i5
	ldub	[%l7 + 0x6C],	%l0
	fxor	%f14,	%f28,	%f16
	pdist	%f16,	%f26,	%f4
	fmovdvc	%xcc,	%f8,	%f2
	fpsub32	%f16,	%f12,	%f22
	andncc	%o6,	%l5,	%i4
	alignaddrl	%o0,	%g3,	%i3
	edge16l	%i1,	%o7,	%g7
	edge16ln	%o2,	%l6,	%l2
	addccc	%g5,	0x01B7,	%g4
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%i6
	fmovdcs	%xcc,	%f12,	%f26
	fnands	%f15,	%f20,	%f19
	orncc	%l1,	0x1AE4,	%i0
	mulscc	%o5,	0x0908,	%o1
	movleu	%xcc,	%i7,	%i2
	add	%o4,	0x1015,	%l4
	move	%xcc,	%g6,	%o3
	andn	%l3,	0x1D95,	%g1
	subccc	%g2,	0x1F2E,	%i5
	movpos	%xcc,	%o6,	%l5
	fsrc1	%f26,	%f0
	movpos	%xcc,	%i4,	%o0
	fzeros	%f1
	movcc	%xcc,	%l0,	%i3
	move	%icc,	%g3,	%i1
	mulx	%o7,	%g7,	%l6
	sra	%l2,	%o2,	%g5
	movleu	%icc,	%g4,	%l1
	andncc	%i6,	%o5,	%o1
	xorcc	%i0,	0x1BF4,	%i2
	ldd	[%l7 + 0x40],	%i6
	subc	%l4,	0x0B12,	%g6
	st	%f15,	[%l7 + 0x30]
	fmovsg	%xcc,	%f7,	%f10
	sir	0x010B
	movg	%xcc,	%o3,	%l3
	xnor	%o4,	%g2,	%g1
	sllx	%i5,	%o6,	%l5
	orcc	%o0,	%l0,	%i3
	mulscc	%g3,	%i4,	%o7
	edge32l	%i1,	%g7,	%l2
	sra	%o2,	0x1F,	%g5
	array8	%g4,	%l6,	%l1
	movrgez	%i6,	0x3E2,	%o1
	sllx	%o5,	0x0F,	%i2
	addc	%i0,	0x1BF6,	%l4
	srlx	%i7,	%g6,	%l3
	smulcc	%o4,	0x18A0,	%o3
	movrne	%g1,	0x126,	%i5
	nop
	set	0x3E, %g5
	sth	%g2,	[%l7 + %g5]
	umulcc	%l5,	%o6,	%o0
	movvc	%icc,	%l0,	%g3
	fpsub16s	%f2,	%f21,	%f0
	alignaddr	%i4,	%i3,	%i1
	edge16n	%o7,	%l2,	%g7
	fpsub32	%f20,	%f26,	%f2
	fzero	%f8
	sra	%o2,	0x1A,	%g4
	xnor	%l6,	0x1755,	%l1
	subcc	%g5,	0x0E80,	%i6
	xorcc	%o5,	%o1,	%i2
	movre	%i0,	%l4,	%g6
	edge8	%i7,	%l3,	%o3
	udiv	%g1,	0x19DF,	%i5
	stw	%g2,	[%l7 + 0x48]
	edge8l	%o4,	%o6,	%o0
	fnot2	%f24,	%f0
	fpsub32	%f18,	%f0,	%f0
	edge8l	%l0,	%g3,	%i4
	orncc	%i3,	%l5,	%o7
	andncc	%i1,	%g7,	%l2
	srl	%o2,	%l6,	%l1
	edge32n	%g5,	%g4,	%i6
	ldsb	[%l7 + 0x55],	%o1
	fmovdneg	%xcc,	%f19,	%f22
	fnors	%f4,	%f4,	%f9
	movpos	%xcc,	%o5,	%i0
	ldx	[%l7 + 0x38],	%i2
	ld	[%l7 + 0x50],	%f3
	sethi	0x0888,	%l4
	movneg	%xcc,	%i7,	%l3
	fmul8sux16	%f16,	%f8,	%f4
	xnorcc	%o3,	0x1DCC,	%g1
	sra	%g6,	%i5,	%o4
	movvc	%xcc,	%o6,	%o0
	fmovrslez	%l0,	%f22,	%f10
	edge8	%g2,	%i4,	%g3
	fpsub32	%f12,	%f18,	%f2
	movl	%xcc,	%i3,	%l5
	orn	%i1,	%g7,	%o7
	movcc	%xcc,	%o2,	%l6
	edge16	%l2,	%g5,	%g4
	srl	%l1,	0x10,	%o1
	edge16l	%i6,	%o5,	%i2
	ldsh	[%l7 + 0x1E],	%l4
	fands	%f23,	%f18,	%f30
	udiv	%i0,	0x0A81,	%i7
	mulx	%o3,	0x018F,	%g1
	edge32	%l3,	%g6,	%o4
	sdiv	%i5,	0x0041,	%o0
	st	%f3,	[%l7 + 0x70]
	array32	%l0,	%o6,	%g2
	sir	0x0789
	addccc	%i4,	%g3,	%l5
	addccc	%i3,	%g7,	%i1
	fnot2s	%f6,	%f13
	ld	[%l7 + 0x20],	%f7
	st	%f1,	[%l7 + 0x6C]
	addc	%o2,	0x017E,	%l6
	fmovdvs	%xcc,	%f27,	%f27
	fmovdl	%icc,	%f14,	%f30
	addcc	%l2,	%g5,	%o7
	movleu	%icc,	%l1,	%o1
	sra	%i6,	0x19,	%o5
	movle	%icc,	%i2,	%l4
	ldsb	[%l7 + 0x52],	%i0
	edge8n	%i7,	%o3,	%g4
	array16	%l3,	%g6,	%g1
	fmovrdgez	%i5,	%f24,	%f8
	movn	%icc,	%o0,	%l0
	udivx	%o6,	0x0AAD,	%o4
	fpmerge	%f27,	%f23,	%f30
	fmovdpos	%icc,	%f4,	%f22
	movleu	%icc,	%i4,	%g2
	movre	%g3,	%i3,	%g7
	srlx	%l5,	0x19,	%i1
	movrne	%l6,	%o2,	%l2
	std	%f22,	[%l7 + 0x28]
	fmovsneg	%icc,	%f28,	%f11
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	st	%f20,	[%l7 + 0x38]
	edge8ln	%o7,	%i6,	%o1
	edge32n	%o5,	%l4,	%i2
	fnand	%f0,	%f30,	%f24
	faligndata	%f4,	%f12,	%f30
	addcc	%i0,	%o3,	%i7
	fmul8ulx16	%f0,	%f0,	%f28
	movre	%l3,	%g6,	%g1
	fmovsg	%xcc,	%f18,	%f15
	umul	%i5,	0x116C,	%g4
	popc	0x11E7,	%l0
	stw	%o0,	[%l7 + 0x30]
	siam	0x7
	movvs	%icc,	%o4,	%i4
	addcc	%g2,	0x0BC4,	%g3
	edge8n	%o6,	%g7,	%i3
	nop
	set	0x1F, %o7
	ldsb	[%l7 + %o7],	%l5
	andn	%l6,	%o2,	%l2
	fmovdcc	%icc,	%f19,	%f6
	fmovdneg	%icc,	%f16,	%f17
	subcc	%g5,	%l1,	%i1
	fabss	%f30,	%f0
	add	%i6,	%o7,	%o1
	sdivcc	%l4,	0x0A4F,	%o5
	andncc	%i0,	%o3,	%i2
	movge	%xcc,	%l3,	%i7
	edge8n	%g1,	%g6,	%g4
	bshuffle	%f6,	%f2,	%f26
	fcmps	%fcc2,	%f24,	%f10
	movne	%xcc,	%i5,	%l0
	fxor	%f10,	%f18,	%f24
	sir	0x118E
	orncc	%o4,	%o0,	%i4
	udiv	%g3,	0x1BCB,	%o6
	subc	%g2,	%g7,	%i3
	movl	%icc,	%l6,	%l5
	addc	%l2,	%g5,	%l1
	array32	%o2,	%i6,	%i1
	umul	%o1,	%o7,	%l4
	ldub	[%l7 + 0x2D],	%o5
	nop
	set	0x26, %l4
	stb	%i0,	[%l7 + %l4]
	xnorcc	%o3,	0x06FF,	%l3
	movne	%icc,	%i2,	%g1
	ldd	[%l7 + 0x28],	%i6
	fzeros	%f5
	movn	%icc,	%g4,	%g6
	fmovrsne	%i5,	%f8,	%f8
	sdivx	%l0,	0x0EE3,	%o4
	restore %o0, 0x0C06, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o6,	%g2
	save %g7, 0x0709, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x38],	%f11
	xor	%l6,	0x0923,	%i3
	nop
	set	0x76, %o1
	ldsb	[%l7 + %o1],	%l2
	sdivcc	%l5,	0x1A2A,	%l1
	udivcc	%o2,	0x0CF8,	%g5
	std	%f10,	[%l7 + 0x20]
	edge32n	%i6,	%o1,	%i1
	st	%f3,	[%l7 + 0x64]
	movrlez	%l4,	0x2DC,	%o7
	addc	%o5,	%i0,	%o3
	movrgz	%i2,	0x046,	%g1
	stw	%i7,	[%l7 + 0x64]
	xorcc	%g4,	%l3,	%i5
	srax	%g6,	%l0,	%o4
	fnot1	%f22,	%f20
	udiv	%g3,	0x0DDC,	%o6
	fmovdne	%icc,	%f14,	%f21
	edge8l	%o0,	%g7,	%i4
	xor	%g2,	0x0132,	%l6
	array16	%l2,	%l5,	%i3
	movrgez	%l1,	0x33C,	%o2
	movleu	%icc,	%g5,	%i6
	xorcc	%o1,	%l4,	%o7
	udivcc	%i1,	0x18B5,	%i0
	udivx	%o3,	0x0211,	%o5
	movre	%i2,	0x293,	%i7
	srl	%g1,	%g4,	%i5
	fnot1	%f20,	%f2
	fand	%f26,	%f0,	%f4
	fmovdge	%xcc,	%f18,	%f7
	fmovsle	%xcc,	%f27,	%f8
	array8	%l3,	%l0,	%g6
	sth	%g3,	[%l7 + 0x38]
	orn	%o6,	0x1DA3,	%o0
	array32	%o4,	%g7,	%g2
	lduh	[%l7 + 0x6C],	%l6
	nop
	set	0x48, %l6
	stx	%i4,	[%l7 + %l6]
	sdiv	%l2,	0x0F0D,	%l5
	ldsh	[%l7 + 0x6A],	%i3
	sll	%l1,	%o2,	%i6
	udiv	%o1,	0x0345,	%g5
	alignaddrl	%o7,	%i1,	%i0
	fpadd16	%f28,	%f16,	%f18
	edge32n	%o3,	%o5,	%l4
	fnot1s	%f20,	%f12
	ldd	[%l7 + 0x30],	%i6
	sll	%i2,	0x02,	%g1
	movne	%xcc,	%g4,	%i5
	movcs	%icc,	%l0,	%g6
	xor	%g3,	%o6,	%l3
	edge32l	%o4,	%o0,	%g2
	sth	%g7,	[%l7 + 0x6E]
	edge32n	%l6,	%i4,	%l2
	ldd	[%l7 + 0x48],	%l4
	movre	%l1,	0x121,	%i3
	mova	%icc,	%o2,	%o1
	stw	%i6,	[%l7 + 0x58]
	ldd	[%l7 + 0x18],	%f12
	addccc	%g5,	%o7,	%i0
	lduh	[%l7 + 0x12],	%i1
	stb	%o3,	[%l7 + 0x27]
	udivcc	%o5,	0x1F47,	%l4
	edge32ln	%i2,	%g1,	%g4
	and	%i7,	%i5,	%l0
	fmovdvc	%icc,	%f16,	%f10
	fxors	%f0,	%f5,	%f27
	fabss	%f15,	%f22
	or	%g3,	%o6,	%g6
	std	%f10,	[%l7 + 0x40]
	movrlz	%o4,	0x0B4,	%l3
	alignaddrl	%o0,	%g2,	%g7
	fcmpeq32	%f4,	%f6,	%l6
	umulcc	%i4,	%l2,	%l5
	movne	%icc,	%l1,	%o2
	ldsb	[%l7 + 0x67],	%o1
	popc	0x0804,	%i3
	ldx	[%l7 + 0x38],	%i6
	sir	0x0899
	stb	%o7,	[%l7 + 0x61]
	fmovsge	%icc,	%f21,	%f23
	sra	%g5,	0x10,	%i0
	sethi	0x1CB3,	%i1
	orn	%o3,	%l4,	%i2
	movleu	%icc,	%g1,	%o5
	udiv	%i7,	0x149F,	%i5
	sll	%l0,	0x0B,	%g4
	nop
	set	0x68, %o4
	ldsh	[%l7 + %o4],	%o6
	sllx	%g3,	%g6,	%l3
	add	%o4,	0x0C2C,	%g2
	xnorcc	%g7,	0x0A94,	%l6
	mulx	%i4,	%l2,	%l5
	addcc	%o0,	%l1,	%o2
	ldsw	[%l7 + 0x08],	%i3
	nop
	set	0x60, %g7
	sth	%o1,	[%l7 + %g7]
	movge	%icc,	%i6,	%o7
	edge8n	%i0,	%g5,	%o3
	ldsw	[%l7 + 0x54],	%l4
	array32	%i1,	%i2,	%o5
	edge16n	%i7,	%g1,	%i5
	lduh	[%l7 + 0x52],	%g4
	andncc	%l0,	%g3,	%g6
	udivx	%o6,	0x04B6,	%o4
	sll	%g2,	0x07,	%l3
	movvc	%icc,	%l6,	%g7
	addccc	%i4,	0x0B50,	%l5
	edge8	%o0,	%l1,	%o2
	fcmpne32	%f22,	%f16,	%l2
	ldx	[%l7 + 0x68],	%o1
	fpadd16s	%f22,	%f31,	%f24
	movrgz	%i6,	%o7,	%i3
	edge16l	%i0,	%o3,	%l4
	xor	%i1,	0x12BC,	%i2
	fmovsgu	%icc,	%f13,	%f10
	mulscc	%g5,	0x1F75,	%o5
	movleu	%xcc,	%g1,	%i7
	fmovrdgez	%g4,	%f4,	%f4
	srlx	%i5,	%g3,	%l0
	fmovrdgz	%o6,	%f30,	%f10
	alignaddrl	%g6,	%o4,	%g2
	stw	%l6,	[%l7 + 0x38]
	mulx	%l3,	0x0BBE,	%g7
	mulscc	%i4,	0x192A,	%o0
	edge32l	%l1,	%o2,	%l2
	edge16n	%o1,	%l5,	%i6
	stw	%i3,	[%l7 + 0x64]
	sdiv	%i0,	0x1055,	%o7
	movleu	%xcc,	%o3,	%l4
	nop
	set	0x70, %i5
	stx	%i2,	[%l7 + %i5]
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	std	%f24,	[%l7 + 0x08]
	movrgez	%g1,	%i7,	%g4
	edge8l	%i5,	%o5,	%l0
	fabss	%f14,	%f27
	smulcc	%o6,	0x1A31,	%g3
	edge32	%g6,	%g2,	%o4
	srlx	%l6,	0x1D,	%l3
	sll	%i4,	%o0,	%l1
	subc	%o2,	0x01A8,	%l2
	fmovrslz	%g7,	%f20,	%f18
	sir	0x042F
	sra	%o1,	%l5,	%i3
	fsrc1	%f28,	%f10
	fzero	%f2
	ldub	[%l7 + 0x46],	%i0
	movn	%xcc,	%i6,	%o7
	fmovsn	%xcc,	%f12,	%f30
	fornot1s	%f7,	%f5,	%f5
	movgu	%xcc,	%l4,	%i2
	movne	%xcc,	%i1,	%o3
	movleu	%xcc,	%g5,	%g1
	sdivx	%i7,	0x1074,	%i5
	fpadd16	%f24,	%f2,	%f18
	movl	%icc,	%o5,	%g4
	fmovrde	%o6,	%f16,	%f24
	ldub	[%l7 + 0x08],	%g3
	edge8n	%l0,	%g6,	%g2
	edge32n	%o4,	%l3,	%l6
	movvs	%xcc,	%o0,	%l1
	movgu	%xcc,	%o2,	%i4
	fmovsneg	%xcc,	%f27,	%f14
	udivx	%l2,	0x00BE,	%o1
	edge32ln	%g7,	%l5,	%i3
	movpos	%xcc,	%i0,	%i6
	edge16n	%o7,	%i2,	%l4
	edge32l	%o3,	%i1,	%g1
	ldsh	[%l7 + 0x74],	%i7
	fmovse	%xcc,	%f25,	%f15
	fandnot2	%f4,	%f22,	%f8
	sllx	%g5,	0x0B,	%i5
	fmovsvs	%icc,	%f1,	%f4
	movneg	%icc,	%o5,	%o6
	sra	%g3,	0x0A,	%g4
	std	%f0,	[%l7 + 0x40]
	sdiv	%g6,	0x05A8,	%g2
	movneg	%icc,	%l0,	%o4
	add	%l6,	0x1F3D,	%l3
	movneg	%icc,	%l1,	%o2
	mulx	%o0,	%l2,	%i4
	xorcc	%o1,	0x0DFC,	%l5
	fornot2	%f2,	%f0,	%f10
	fmul8x16al	%f7,	%f15,	%f22
	edge8l	%g7,	%i3,	%i6
	fmul8ulx16	%f8,	%f4,	%f6
	fcmpgt16	%f28,	%f10,	%o7
	ld	[%l7 + 0x40],	%f20
	fmovscc	%icc,	%f25,	%f28
	movcc	%icc,	%i0,	%i2
	sub	%l4,	%o3,	%i1
	fmovdleu	%xcc,	%f26,	%f6
	movle	%icc,	%g1,	%g5
	fsrc1s	%f13,	%f18
	sir	0x0812
	ldub	[%l7 + 0x37],	%i5
	udiv	%o5,	0x1A65,	%i7
	sub	%g3,	0x0DE4,	%g4
	fmovdgu	%icc,	%f28,	%f20
	edge8n	%g6,	%o6,	%l0
	save %o4, %g2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l1,	0x0A,	%l6
	edge32ln	%o0,	%l2,	%o2
	fmovrdne	%i4,	%f12,	%f26
	subcc	%l5,	0x1D74,	%o1
	stb	%g7,	[%l7 + 0x65]
	edge16	%i3,	%o7,	%i0
	edge16l	%i6,	%l4,	%o3
	pdist	%f2,	%f6,	%f22
	andncc	%i2,	%i1,	%g1
	lduw	[%l7 + 0x50],	%g5
	movrlz	%o5,	0x326,	%i5
	edge16ln	%g3,	%g4,	%i7
	mova	%icc,	%o6,	%g6
	fsrc2	%f14,	%f20
	orncc	%l0,	%g2,	%l3
	array32	%o4,	%l6,	%l1
	stw	%o0,	[%l7 + 0x48]
	and	%l2,	%o2,	%l5
	sethi	0x018D,	%o1
	or	%i4,	%i3,	%g7
	fnot2s	%f24,	%f15
	movvc	%xcc,	%i0,	%o7
	movn	%xcc,	%l4,	%o3
	pdist	%f0,	%f24,	%f26
	edge16n	%i6,	%i2,	%i1
	fsrc2s	%f2,	%f23
	movre	%g5,	%g1,	%o5
	movgu	%icc,	%g3,	%i5
	orn	%g4,	0x1448,	%i7
	sethi	0x1C06,	%o6
	movneg	%xcc,	%l0,	%g2
	srax	%g6,	0x02,	%o4
	movge	%icc,	%l3,	%l6
	fsrc2	%f22,	%f14
	andn	%o0,	0x1A61,	%l1
	subc	%o2,	%l2,	%o1
	subc	%l5,	0x0D07,	%i3
	fmovrsgez	%i4,	%f18,	%f28
	edge8ln	%g7,	%i0,	%l4
	smul	%o7,	0x013D,	%o3
	fmovsvs	%xcc,	%f2,	%f13
	edge32l	%i2,	%i1,	%g5
	movle	%xcc,	%g1,	%i6
	fmovdvc	%icc,	%f25,	%f23
	subc	%g3,	%i5,	%g4
	orn	%o5,	%o6,	%l0
	fzero	%f26
	fmovrdgez	%i7,	%f22,	%f26
	xor	%g2,	0x0FAA,	%g6
	array32	%l3,	%l6,	%o0
	fabss	%f18,	%f15
	sdiv	%o4,	0x106F,	%l1
	mulx	%l2,	0x13A9,	%o1
	fmovs	%f3,	%f15
	sub	%o2,	%l5,	%i4
	ldsh	[%l7 + 0x40],	%i3
	orn	%i0,	%l4,	%g7
	fmovscc	%icc,	%f22,	%f10
	sth	%o7,	[%l7 + 0x40]
	andncc	%o3,	%i2,	%g5
	fpadd16	%f22,	%f14,	%f14
	movpos	%xcc,	%g1,	%i6
	fpsub16	%f20,	%f12,	%f2
	stw	%g3,	[%l7 + 0x30]
	stw	%i1,	[%l7 + 0x30]
	sth	%g4,	[%l7 + 0x70]
	ldub	[%l7 + 0x46],	%i5
	nop
	set	0x60, %o3
	ldx	[%l7 + %o3],	%o6
	edge32l	%o5,	%i7,	%l0
	fmul8x16au	%f6,	%f21,	%f10
	srax	%g6,	0x14,	%g2
	srl	%l6,	%o0,	%o4
	lduw	[%l7 + 0x24],	%l1
	sdivcc	%l2,	0x12D6,	%o1
	fmovrdlez	%l3,	%f22,	%f6
	andcc	%l5,	0x0D61,	%i4
	array8	%i3,	%o2,	%i0
	orn	%l4,	0x1E8A,	%g7
	xnorcc	%o7,	0x1970,	%o3
	movrne	%g5,	%i2,	%g1
	fmovsn	%icc,	%f31,	%f25
	movcs	%icc,	%g3,	%i6
	fsrc2	%f26,	%f14
	movgu	%icc,	%g4,	%i1
	ldx	[%l7 + 0x60],	%o6
	orncc	%o5,	%i7,	%l0
	array32	%i5,	%g2,	%g6
	fxnors	%f24,	%f29,	%f19
	smul	%o0,	0x0880,	%l6
	popc	%o4,	%l1
	fmovse	%xcc,	%f14,	%f25
	edge16n	%o1,	%l3,	%l5
	edge16ln	%l2,	%i3,	%i4
	nop
	set	0x40, %o5
	std	%f4,	[%l7 + %o5]
	st	%f25,	[%l7 + 0x6C]
	edge32n	%o2,	%l4,	%g7
	array8	%o7,	%o3,	%g5
	nop
	set	0x4E, %l1
	stb	%i0,	[%l7 + %l1]
	fnors	%f31,	%f2,	%f23
	srl	%i2,	%g3,	%g1
	sdiv	%g4,	0x11A2,	%i1
	mulx	%i6,	%o6,	%i7
	fmovrde	%l0,	%f0,	%f4
	srl	%o5,	0x1F,	%i5
	add	%g2,	0x10AC,	%o0
	stx	%g6,	[%l7 + 0x48]
	lduw	[%l7 + 0x48],	%o4
	popc	%l6,	%o1
	orn	%l3,	%l5,	%l1
	array32	%i3,	%i4,	%o2
	ldsb	[%l7 + 0x48],	%l4
	sll	%l2,	0x15,	%o7
	save %o3, %g7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i2,	0x0083,	%g3
	movle	%xcc,	%g1,	%g4
	fmovrsne	%i0,	%f5,	%f5
	fpsub16s	%f26,	%f15,	%f25
	udiv	%i6,	0x0C64,	%i1
	array8	%o6,	%i7,	%l0
	nop
	set	0x6A, %l0
	ldsh	[%l7 + %l0],	%i5
	fmovdge	%icc,	%f11,	%f18
	fnors	%f31,	%f0,	%f16
	fornot2s	%f24,	%f19,	%f3
	lduw	[%l7 + 0x6C],	%o5
	fpack32	%f12,	%f12,	%f14
	mulscc	%o0,	%g2,	%g6
	fmul8x16au	%f22,	%f13,	%f24
	xnorcc	%o4,	0x1D8F,	%l6
	mova	%xcc,	%l3,	%l5
	subccc	%o1,	%i3,	%i4
	array8	%l1,	%o2,	%l4
	umul	%o7,	0x1FA4,	%l2
	fcmped	%fcc2,	%f20,	%f18
	sethi	0x0796,	%o3
	and	%g7,	%g5,	%g3
	movle	%icc,	%i2,	%g4
	ldub	[%l7 + 0x4B],	%i0
	fmovdn	%xcc,	%f13,	%f12
	fzeros	%f13
	fnot2	%f0,	%f12
	fmovdvc	%icc,	%f13,	%f29
	movle	%xcc,	%i6,	%g1
	ldub	[%l7 + 0x21],	%o6
	stx	%i7,	[%l7 + 0x18]
	srlx	%i1,	0x1C,	%l0
	sdivcc	%o5,	0x0C1F,	%o0
	subcc	%g2,	%i5,	%o4
	movrlz	%l6,	0x335,	%l3
	lduw	[%l7 + 0x64],	%g6
	movcs	%xcc,	%o1,	%l5
	subcc	%i3,	%i4,	%o2
	subccc	%l1,	0x11E2,	%o7
	fone	%f28
	orn	%l4,	0x04C0,	%o3
	srlx	%l2,	0x19,	%g5
	ldsw	[%l7 + 0x18],	%g7
	fmovsneg	%icc,	%f26,	%f16
	srl	%i2,	0x07,	%g4
	edge32l	%i0,	%i6,	%g3
	ld	[%l7 + 0x28],	%f22
	sethi	0x03A2,	%g1
	movcc	%icc,	%i7,	%o6
	movvs	%icc,	%l0,	%i1
	fmovsneg	%xcc,	%f28,	%f27
	edge32	%o5,	%o0,	%g2
	ldsb	[%l7 + 0x1E],	%o4
	fornot1s	%f21,	%f17,	%f15
	move	%xcc,	%i5,	%l3
	movrgez	%l6,	0x35D,	%o1
	alignaddrl	%l5,	%g6,	%i3
	sllx	%o2,	%l1,	%i4
	movcs	%xcc,	%o7,	%l4
	sdivcc	%l2,	0x098C,	%g5
	xor	%o3,	%i2,	%g4
	stw	%g7,	[%l7 + 0x38]
	xorcc	%i6,	0x1B28,	%g3
	movcs	%xcc,	%g1,	%i0
	fnot2	%f16,	%f30
	restore %i7, %l0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o5,	%o0,	%o6
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	edge32n	%l3,	%l6,	%g2
	edge16l	%o1,	%g6,	%i3
	udiv	%o2,	0x1252,	%l5
	sth	%i4,	[%l7 + 0x0C]
	fpack16	%f6,	%f7
	movvc	%xcc,	%o7,	%l4
	movrlz	%l2,	%g5,	%o3
	umulcc	%i2,	0x0D13,	%l1
	edge16n	%g7,	%i6,	%g3
	sll	%g1,	%g4,	%i7
	movgu	%icc,	%i0,	%i1
	movle	%xcc,	%l0,	%o0
	fcmped	%fcc2,	%f14,	%f14
	alignaddrl	%o5,	%o6,	%i5
	sub	%l3,	0x15EB,	%o4
	alignaddrl	%g2,	%o1,	%g6
	udivx	%l6,	0x0055,	%o2
	edge32	%i3,	%i4,	%l5
	move	%icc,	%l4,	%l2
	srl	%o7,	%g5,	%i2
	edge32ln	%l1,	%o3,	%g7
	movcs	%xcc,	%g3,	%g1
	mulscc	%g4,	0x1A26,	%i7
	umul	%i6,	0x1883,	%i1
	xorcc	%l0,	%o0,	%i0
	edge32	%o6,	%o5,	%l3
	orcc	%o4,	%g2,	%i5
	movleu	%icc,	%g6,	%o1
	addccc	%l6,	%i3,	%o2
	movrlez	%i4,	%l5,	%l4
	movleu	%icc,	%o7,	%g5
	movre	%i2,	%l1,	%o3
	smul	%l2,	%g7,	%g3
	srl	%g1,	0x1D,	%g4
	ldub	[%l7 + 0x78],	%i7
	movvs	%xcc,	%i6,	%i1
	ld	[%l7 + 0x6C],	%f29
	fmovdleu	%icc,	%f30,	%f24
	edge16ln	%o0,	%l0,	%i0
	alignaddr	%o5,	%l3,	%o6
	move	%icc,	%g2,	%o4
	movrgez	%i5,	0x3DF,	%o1
	srlx	%g6,	%i3,	%o2
	sdivx	%i4,	0x0E50,	%l5
	addccc	%l6,	0x0109,	%l4
	edge8ln	%g5,	%i2,	%o7
	edge8n	%o3,	%l2,	%g7
	andn	%l1,	0x0FA3,	%g1
	ldsw	[%l7 + 0x38],	%g3
	ldub	[%l7 + 0x70],	%i7
	fors	%f20,	%f18,	%f31
	movvs	%icc,	%i6,	%i1
	umulcc	%g4,	%o0,	%l0
	subccc	%o5,	%i0,	%l3
	pdist	%f28,	%f0,	%f12
	movrne	%o6,	%o4,	%g2
	edge16ln	%i5,	%o1,	%i3
	sir	0x185E
	sub	%o2,	%i4,	%l5
	st	%f1,	[%l7 + 0x28]
	or	%l6,	0x12A9,	%g6
	movcc	%icc,	%l4,	%i2
	ldsb	[%l7 + 0x1F],	%g5
	movvs	%xcc,	%o7,	%l2
	fsrc2	%f18,	%f0
	edge16l	%g7,	%l1,	%o3
	orcc	%g1,	%g3,	%i6
	movgu	%icc,	%i7,	%i1
	srlx	%o0,	%g4,	%o5
	fmul8ulx16	%f16,	%f18,	%f10
	movgu	%icc,	%l0,	%l3
	srl	%o6,	%i0,	%o4
	mova	%icc,	%g2,	%i5
	fmovrdlz	%o1,	%f2,	%f8
	edge8n	%o2,	%i3,	%i4
	nop
	set	0x78, %i6
	stx	%l5,	[%l7 + %i6]
	pdist	%f4,	%f14,	%f12
	edge16l	%l6,	%l4,	%i2
	fmul8sux16	%f20,	%f30,	%f20
	subccc	%g6,	%o7,	%l2
	addccc	%g5,	0x0DBD,	%l1
	movvc	%xcc,	%o3,	%g7
	movge	%icc,	%g3,	%i6
	movcs	%icc,	%g1,	%i7
	sdivcc	%o0,	0x0F79,	%i1
	fmovdpos	%xcc,	%f9,	%f1
	edge32n	%o5,	%g4,	%l0
	fmovdvs	%icc,	%f5,	%f30
	sub	%o6,	%l3,	%i0
	ldub	[%l7 + 0x0F],	%g2
	stb	%i5,	[%l7 + 0x65]
	movpos	%xcc,	%o1,	%o2
	smulcc	%o4,	0x05E9,	%i4
	fmovrdne	%i3,	%f6,	%f8
	fpsub16	%f28,	%f14,	%f0
	movg	%icc,	%l6,	%l5
	fpadd32	%f8,	%f22,	%f28
	movl	%icc,	%i2,	%g6
	fnor	%f16,	%f4,	%f10
	udiv	%l4,	0x0A31,	%l2
	lduw	[%l7 + 0x10],	%g5
	restore %o7, 0x1A98, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f15,	[%l7 + 0x14]
	fmovscc	%xcc,	%f16,	%f17
	edge32	%g7,	%o3,	%g3
	sth	%g1,	[%l7 + 0x40]
	movneg	%xcc,	%i6,	%i7
	movne	%xcc,	%o0,	%o5
	alignaddr	%i1,	%l0,	%g4
	sllx	%l3,	0x0F,	%o6
	alignaddr	%i0,	%i5,	%o1
	movgu	%icc,	%g2,	%o2
	udivcc	%o4,	0x0F66,	%i4
	array8	%i3,	%l5,	%l6
	fcmpne16	%f22,	%f0,	%g6
	movre	%l4,	%l2,	%i2
	array32	%g5,	%o7,	%l1
	fmul8sux16	%f18,	%f26,	%f26
	ldd	[%l7 + 0x28],	%f14
	ldsw	[%l7 + 0x30],	%g7
	alignaddrl	%o3,	%g3,	%g1
	fxor	%f4,	%f20,	%f18
	srlx	%i7,	%i6,	%o5
	popc	0x0C1D,	%o0
	movrne	%i1,	%l0,	%l3
	udiv	%o6,	0x0E7D,	%i0
	edge16ln	%g4,	%i5,	%g2
	movle	%xcc,	%o1,	%o4
	movrgez	%i4,	%o2,	%i3
	subccc	%l6,	%g6,	%l5
	movpos	%icc,	%l2,	%i2
	fandnot2	%f16,	%f30,	%f30
	movcs	%xcc,	%l4,	%g5
	subcc	%o7,	%g7,	%l1
	fsrc1	%f6,	%f28
	movne	%icc,	%o3,	%g3
	movpos	%icc,	%g1,	%i7
	array8	%o5,	%o0,	%i6
	movrlez	%i1,	%l0,	%l3
	fands	%f24,	%f4,	%f4
	fmovscs	%icc,	%f8,	%f8
	alignaddrl	%o6,	%g4,	%i0
	fpack32	%f14,	%f6,	%f10
	sdivx	%i5,	0x0207,	%g2
	fornot1	%f2,	%f6,	%f4
	fpackfix	%f10,	%f24
	smulcc	%o4,	%o1,	%i4
	andn	%i3,	0x1680,	%o2
	ldub	[%l7 + 0x21],	%l6
	andcc	%l5,	0x0F27,	%l2
	edge8ln	%g6,	%l4,	%i2
	subccc	%g5,	%o7,	%l1
	sllx	%g7,	0x11,	%g3
	std	%f18,	[%l7 + 0x10]
	move	%xcc,	%g1,	%i7
	edge32ln	%o5,	%o3,	%o0
	edge16	%i1,	%i6,	%l0
	ldd	[%l7 + 0x30],	%f2
	fmovsvs	%icc,	%f29,	%f26
	movpos	%xcc,	%l3,	%g4
	fmuld8ulx16	%f13,	%f12,	%f8
	or	%i0,	%o6,	%i5
	fornot1	%f28,	%f16,	%f20
	ldsh	[%l7 + 0x08],	%o4
	umulcc	%o1,	%i4,	%g2
	fmovsg	%xcc,	%f19,	%f2
	srl	%i3,	0x03,	%l6
	edge16ln	%o2,	%l5,	%l2
	fpadd16	%f30,	%f20,	%f12
	fornot1s	%f7,	%f21,	%f19
	umulcc	%g6,	%l4,	%i2
	movre	%g5,	%o7,	%g7
	mova	%icc,	%l1,	%g1
	fmul8sux16	%f4,	%f24,	%f2
	udivcc	%i7,	0x117A,	%o5
	movrgez	%o3,	0x234,	%g3
	andn	%o0,	0x1C2B,	%i1
	sdivcc	%l0,	0x02DA,	%i6
	fmovrdlz	%g4,	%f4,	%f14
	fmul8x16au	%f13,	%f28,	%f28
	st	%f11,	[%l7 + 0x38]
	addc	%l3,	0x1D5D,	%i0
	array32	%i5,	%o4,	%o1
	nop
	set	0x1F, %i4
	ldub	[%l7 + %i4],	%o6
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	array32	%l6,	%o2,	%l5
	save %g6, 0x1AAA, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l2,	%g5,	%i2
	bshuffle	%f10,	%f22,	%f10
	fxnors	%f26,	%f11,	%f29
	movcc	%icc,	%o7,	%l1
	movneg	%xcc,	%g7,	%i7
	movrlez	%g1,	0x245,	%o3
	sth	%g3,	[%l7 + 0x50]
	sll	%o0,	0x17,	%o5
	orncc	%l0,	0x0DD1,	%i6
	edge32l	%g4,	%l3,	%i1
	movrlz	%i5,	%o4,	%i0
	movge	%xcc,	%o1,	%o6
	ldsh	[%l7 + 0x34],	%i4
	ld	[%l7 + 0x64],	%f4
	popc	0x060F,	%i3
	edge32	%g2,	%l6,	%l5
	movrlez	%g6,	0x16E,	%o2
	edge8ln	%l4,	%g5,	%i2
	orn	%l2,	%l1,	%o7
	and	%g7,	0x0008,	%i7
	movcs	%xcc,	%g1,	%g3
	xorcc	%o0,	%o3,	%o5
	edge32l	%i6,	%g4,	%l0
	ldd	[%l7 + 0x18],	%l2
	edge8	%i5,	%o4,	%i1
	edge16	%i0,	%o6,	%i4
	andncc	%i3,	%o1,	%l6
	movvs	%xcc,	%g2,	%g6
	sth	%o2,	[%l7 + 0x44]
	sllx	%l5,	0x10,	%g5
	fabsd	%f2,	%f8
	addc	%l4,	0x1CE5,	%l2
	movvc	%icc,	%i2,	%l1
	nop
	set	0x74, %g4
	ldsw	[%l7 + %g4],	%g7
	fpack32	%f16,	%f18,	%f12
	subc	%o7,	%g1,	%i7
	fcmps	%fcc1,	%f2,	%f21
	edge32l	%g3,	%o3,	%o0
	addccc	%o5,	0x1F7A,	%i6
	stb	%l0,	[%l7 + 0x3C]
	srax	%g4,	0x0A,	%l3
	movrlz	%i5,	%o4,	%i0
	edge8n	%o6,	%i1,	%i3
	edge8n	%o1,	%i4,	%g2
	fnors	%f5,	%f19,	%f8
	subc	%g6,	%l6,	%l5
	fnand	%f22,	%f14,	%f24
	fmovda	%xcc,	%f13,	%f2
	sdivx	%o2,	0x188A,	%l4
	xnor	%g5,	%i2,	%l1
	addc	%g7,	0x1FDA,	%l2
	movrgez	%g1,	0x00D,	%i7
	fsrc1s	%f19,	%f31
	sll	%g3,	0x02,	%o7
	fornot2	%f8,	%f6,	%f16
	movneg	%xcc,	%o0,	%o3
	subccc	%o5,	0x1CE1,	%l0
	smulcc	%i6,	0x1A7F,	%g4
	udivx	%i5,	0x0EA8,	%l3
	movvs	%xcc,	%i0,	%o6
	fnors	%f13,	%f24,	%f26
	mova	%icc,	%o4,	%i1
	sra	%i3,	%o1,	%g2
	sir	0x0E5E
	sub	%i4,	%g6,	%l5
	sra	%l6,	0x15,	%l4
	array32	%o2,	%i2,	%l1
	movrgz	%g5,	0x365,	%l2
	movleu	%icc,	%g1,	%g7
	stb	%g3,	[%l7 + 0x19]
	or	%o7,	0x1ED3,	%i7
	save %o0, 0x119B, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l0,	%o5,	%i6
	movneg	%icc,	%g4,	%l3
	movle	%xcc,	%i0,	%i5
	fpsub16s	%f19,	%f1,	%f23
	sra	%o6,	%o4,	%i3
	alignaddr	%o1,	%i1,	%i4
	stw	%g2,	[%l7 + 0x70]
	movn	%xcc,	%l5,	%l6
	movcc	%xcc,	%g6,	%l4
	addccc	%o2,	0x1FF1,	%l1
	fcmpne16	%f10,	%f0,	%g5
	sir	0x03B9
	ldx	[%l7 + 0x78],	%l2
	popc	%g1,	%i2
	fpsub32s	%f7,	%f11,	%f26
	sir	0x1538
	fmovdne	%xcc,	%f26,	%f24
	fcmps	%fcc1,	%f20,	%f14
	fxors	%f17,	%f4,	%f18
	sdiv	%g3,	0x0016,	%g7
	ldsb	[%l7 + 0x1B],	%o7
	array32	%i7,	%o0,	%o3
	movcs	%xcc,	%o5,	%l0
	fcmple16	%f24,	%f16,	%g4
	fmul8x16al	%f30,	%f2,	%f2
	fmul8x16au	%f24,	%f18,	%f26
	fpmerge	%f10,	%f15,	%f0
	fpadd32	%f22,	%f12,	%f20
	alignaddr	%i6,	%l3,	%i5
	fornot1	%f8,	%f6,	%f24
	movvc	%icc,	%o6,	%i0
	orcc	%i3,	0x1573,	%o4
	array16	%i1,	%i4,	%g2
	ldub	[%l7 + 0x23],	%o1
	lduh	[%l7 + 0x56],	%l6
	mova	%xcc,	%g6,	%l5
	movg	%xcc,	%o2,	%l1
	umulcc	%g5,	%l4,	%g1
	ld	[%l7 + 0x28],	%f7
	udivcc	%l2,	0x19E6,	%i2
	sdivcc	%g7,	0x11F1,	%o7
	mova	%icc,	%i7,	%g3
	addc	%o0,	%o5,	%o3
	fpadd16s	%f30,	%f19,	%f9
	smul	%g4,	%i6,	%l3
	ldd	[%l7 + 0x60],	%i4
	sdivcc	%l0,	0x1A88,	%o6
	fcmpgt32	%f24,	%f10,	%i3
	movpos	%icc,	%o4,	%i0
	movg	%xcc,	%i1,	%g2
	move	%icc,	%i4,	%l6
	lduw	[%l7 + 0x7C],	%o1
	edge32ln	%l5,	%o2,	%g6
	mulscc	%g5,	0x1B9B,	%l4
	fmovsvs	%xcc,	%f9,	%f5
	movrlz	%g1,	0x37A,	%l2
	edge16	%i2,	%g7,	%l1
	xorcc	%i7,	0x0CED,	%g3
	stb	%o7,	[%l7 + 0x7F]
	addc	%o0,	%o3,	%g4
	addccc	%i6,	%o5,	%l3
	sethi	0x0F43,	%l0
	sub	%i5,	0x1942,	%o6
	mova	%xcc,	%o4,	%i0
	st	%f4,	[%l7 + 0x58]
	fmovdgu	%icc,	%f6,	%f2
	movn	%icc,	%i1,	%i3
	sll	%g2,	0x1B,	%i4
	fones	%f31
	edge16	%o1,	%l5,	%o2
	array8	%l6,	%g6,	%l4
	fmovdge	%icc,	%f15,	%f29
	fcmpne32	%f22,	%f26,	%g1
	ldd	[%l7 + 0x20],	%g4
	sdivcc	%i2,	0x1422,	%g7
	edge16n	%l2,	%l1,	%g3
	movrlz	%o7,	0x3B4,	%o0
	stx	%o3,	[%l7 + 0x58]
	fmul8ulx16	%f28,	%f22,	%f10
	add	%g4,	%i7,	%i6
	fmovdleu	%icc,	%f7,	%f24
	fornot2s	%f0,	%f31,	%f27
	mulscc	%l3,	%l0,	%o5
	lduh	[%l7 + 0x2E],	%i5
	udivx	%o4,	0x1A53,	%o6
	edge32ln	%i1,	%i3,	%g2
	smulcc	%i0,	%i4,	%o1
	ld	[%l7 + 0x34],	%f1
	stw	%l5,	[%l7 + 0x0C]
	fmovsa	%xcc,	%f4,	%f20
	stw	%o2,	[%l7 + 0x5C]
	movg	%icc,	%g6,	%l4
	stw	%g1,	[%l7 + 0x58]
	srlx	%l6,	%i2,	%g7
	add	%g5,	%l2,	%l1
	movcc	%xcc,	%g3,	%o7
	sub	%o0,	0x1587,	%o3
	fpack16	%f8,	%f28
	mulx	%i7,	0x0FE3,	%g4
	addcc	%l3,	%l0,	%o5
	movrgz	%i5,	%i6,	%o6
	movvc	%xcc,	%i1,	%i3
	movgu	%xcc,	%g2,	%i0
	sll	%o4,	%i4,	%o1
	umulcc	%l5,	0x0E43,	%g6
	edge8n	%o2,	%g1,	%l6
	fmovse	%icc,	%f0,	%f12
	edge16l	%l4,	%i2,	%g7
	fmovrsgez	%l2,	%f25,	%f0
	edge8n	%l1,	%g3,	%o7
	fnot2	%f4,	%f0
	movrlz	%o0,	0x01B,	%g5
	fmovse	%xcc,	%f27,	%f1
	fxnors	%f23,	%f5,	%f3
	orcc	%i7,	0x1465,	%o3
	andncc	%g4,	%l3,	%o5
	fmovsl	%icc,	%f15,	%f4
	sllx	%l0,	0x0B,	%i5
	fcmple32	%f26,	%f4,	%o6
	fmovdg	%xcc,	%f29,	%f19
	movvc	%icc,	%i6,	%i3
	fmovscc	%icc,	%f25,	%f6
	orn	%g2,	%i0,	%i1
	udivcc	%o4,	0x19A3,	%o1
	movcc	%icc,	%l5,	%g6
	fxor	%f24,	%f30,	%f26
	add	%i4,	0x0534,	%g1
	sllx	%o2,	0x09,	%l6
	umul	%i2,	%g7,	%l2
	srax	%l4,	%g3,	%l1
	edge8n	%o7,	%g5,	%i7
	udivcc	%o0,	0x0205,	%o3
	ld	[%l7 + 0x68],	%f28
	xnor	%g4,	0x1B1A,	%o5
	ldd	[%l7 + 0x68],	%f12
	alignaddr	%l3,	%i5,	%l0
	array32	%i6,	%i3,	%g2
	movge	%icc,	%i0,	%o6
	fmuld8ulx16	%f17,	%f3,	%f8
	sdivcc	%o4,	0x0BFE,	%o1
	lduh	[%l7 + 0x50],	%l5
	fcmpeq16	%f28,	%f10,	%i1
	edge16l	%g6,	%i4,	%g1
	movrlz	%l6,	%i2,	%o2
	movleu	%xcc,	%g7,	%l2
	fsrc2s	%f16,	%f29
	movge	%xcc,	%l4,	%l1
	srlx	%g3,	%g5,	%i7
	movle	%icc,	%o7,	%o0
	sll	%o3,	0x14,	%o5
	fmul8x16	%f31,	%f2,	%f8
	fnands	%f31,	%f4,	%f6
	addcc	%g4,	0x0BA4,	%i5
	movrlz	%l3,	0x206,	%i6
	sll	%l0,	0x12,	%i3
	srlx	%i0,	0x06,	%g2
	sir	0x0882
	fzero	%f14
	movvs	%xcc,	%o4,	%o1
	andcc	%l5,	0x15DC,	%o6
	move	%xcc,	%i1,	%g6
	fcmpgt32	%f8,	%f28,	%g1
	sll	%i4,	0x13,	%l6
	stw	%i2,	[%l7 + 0x18]
	fmovdn	%icc,	%f25,	%f2
	andcc	%o2,	%g7,	%l2
	ldsh	[%l7 + 0x5A],	%l1
	st	%f29,	[%l7 + 0x30]
	movrgez	%g3,	0x074,	%l4
	srlx	%g5,	%i7,	%o0
	movrgz	%o3,	%o5,	%g4
	fmovsne	%xcc,	%f4,	%f30
	lduw	[%l7 + 0x3C],	%i5
	fxnor	%f30,	%f16,	%f20
	mulx	%o7,	0x19AB,	%i6
	edge8ln	%l0,	%l3,	%i3
	ldsw	[%l7 + 0x60],	%g2
	edge8l	%i0,	%o4,	%l5
	fpadd32s	%f10,	%f16,	%f1
	orn	%o6,	%i1,	%g6
	smulcc	%o1,	%i4,	%g1
	add	%l6,	%i2,	%o2
	sub	%l2,	%l1,	%g3
	movpos	%xcc,	%l4,	%g7
	mova	%xcc,	%i7,	%g5
	or	%o0,	0x1680,	%o5
	movre	%o3,	0x063,	%g4
	orn	%o7,	%i6,	%l0
	fcmple32	%f20,	%f30,	%i5
	srax	%l3,	%g2,	%i3
	fmovdn	%xcc,	%f30,	%f21
	sdivx	%i0,	0x1937,	%l5
	and	%o4,	0x04F0,	%i1
	smulcc	%g6,	%o6,	%o1
	fmovdcs	%xcc,	%f26,	%f9
	mova	%icc,	%g1,	%i4
	movrgez	%i2,	0x187,	%o2
	movrlz	%l2,	%l6,	%l1
	movrlz	%l4,	%g3,	%g7
	sub	%g5,	%i7,	%o5
	nop
	set	0x08, %o2
	ldx	[%l7 + %o2],	%o0
	xnor	%o3,	%g4,	%i6
	movl	%xcc,	%o7,	%i5
	xnorcc	%l0,	%g2,	%l3
	andcc	%i0,	%l5,	%o4
	movneg	%icc,	%i1,	%g6
	sll	%o6,	%i3,	%o1
	movge	%icc,	%i4,	%i2
	nop
	set	0x30, %i3
	std	%f24,	[%l7 + %i3]
	lduw	[%l7 + 0x64],	%o2
	nop
	set	0x50, %i2
	std	%f6,	[%l7 + %i2]
	ldd	[%l7 + 0x28],	%f4
	smulcc	%l2,	%l6,	%g1
	mulx	%l1,	%g3,	%l4
	st	%f12,	[%l7 + 0x28]
	sethi	0x00AB,	%g5
	xor	%g7,	%o5,	%o0
	ld	[%l7 + 0x60],	%f29
	fornot2	%f30,	%f18,	%f4
	edge32n	%o3,	%i7,	%i6
	andn	%o7,	%i5,	%g4
	fnands	%f2,	%f22,	%f21
	lduh	[%l7 + 0x5E],	%g2
	fnot2	%f2,	%f16
	xorcc	%l0,	0x1CDD,	%l3
	restore %i0, 0x0632, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i1,	0x1C4C,	%g6
	xnor	%l5,	%i3,	%o1
	fnors	%f12,	%f14,	%f8
	movge	%icc,	%i4,	%o6
	fsrc1s	%f15,	%f10
	xor	%i2,	0x0768,	%o2
	fmovsgu	%icc,	%f24,	%f17
	edge32l	%l6,	%l2,	%l1
	addcc	%g3,	0x0FE2,	%g1
	edge16l	%g5,	%g7,	%l4
	movne	%xcc,	%o5,	%o3
	sdivx	%o0,	0x055E,	%i7
	sir	0x06E2
	mova	%xcc,	%o7,	%i6
	mulscc	%g4,	0x1BCD,	%g2
	fors	%f29,	%f18,	%f7
	and	%l0,	%l3,	%i5
	fmovrdne	%o4,	%f22,	%f10
	orcc	%i0,	0x05E6,	%i1
	fmovsvs	%xcc,	%f21,	%f23
	movneg	%icc,	%g6,	%i3
	srlx	%o1,	0x11,	%i4
	srlx	%o6,	%l5,	%o2
	movvc	%xcc,	%i2,	%l2
	fexpand	%f25,	%f18
	fmovdpos	%icc,	%f26,	%f29
	movn	%icc,	%l1,	%l6
	edge32ln	%g3,	%g5,	%g7
	movrlz	%g1,	0x271,	%l4
	fone	%f16
	ldx	[%l7 + 0x68],	%o5
	st	%f8,	[%l7 + 0x64]
	addcc	%o3,	0x0AD9,	%i7
	fcmpes	%fcc1,	%f2,	%f31
	udivx	%o0,	0x158E,	%i6
	or	%g4,	%o7,	%l0
	xnor	%l3,	%g2,	%i5
	sdivcc	%o4,	0x1CB2,	%i1
	edge32	%g6,	%i0,	%i3
	movcs	%xcc,	%o1,	%o6
	fzeros	%f0
	movn	%icc,	%l5,	%o2
	stw	%i4,	[%l7 + 0x64]
	movre	%i2,	0x222,	%l2
	srax	%l1,	%g3,	%l6
	popc	0x1BC7,	%g5
	mulx	%g7,	0x008A,	%l4
	srl	%g1,	%o3,	%i7
	fornot1	%f6,	%f24,	%f10
	array32	%o0,	%i6,	%g4
	xor	%o7,	0x008B,	%l0
	edge8	%l3,	%g2,	%o5
	addc	%o4,	0x1CCA,	%i1
	array32	%g6,	%i5,	%i3
	xor	%i0,	0x0A3A,	%o1
	xnor	%l5,	%o6,	%i4
	movrlz	%i2,	%o2,	%l1
	st	%f15,	[%l7 + 0x38]
	ldsb	[%l7 + 0x34],	%g3
	subc	%l2,	0x0074,	%g5
	sdivcc	%g7,	0x09B3,	%l4
	fmovrdne	%l6,	%f12,	%f26
	mova	%xcc,	%g1,	%o3
	sllx	%o0,	0x0F,	%i6
	ldsh	[%l7 + 0x76],	%g4
	fmovdl	%xcc,	%f27,	%f1
	move	%icc,	%i7,	%o7
	movvc	%icc,	%l3,	%l0
	sra	%g2,	0x06,	%o4
	addc	%i1,	0x11D5,	%o5
	fmovsa	%xcc,	%f1,	%f15
	ld	[%l7 + 0x34],	%f25
	add	%g6,	0x1FE0,	%i5
	edge16ln	%i0,	%i3,	%o1
	sll	%l5,	0x12,	%i4
	fcmpd	%fcc0,	%f4,	%f16
	fmovdcs	%icc,	%f6,	%f20
	subcc	%o6,	%o2,	%i2
	subccc	%g3,	%l2,	%g5
	st	%f26,	[%l7 + 0x50]
	edge8l	%g7,	%l1,	%l6
	addccc	%l4,	%g1,	%o0
	ldx	[%l7 + 0x30],	%i6
	fandnot2s	%f17,	%f12,	%f0
	lduh	[%l7 + 0x48],	%o3
	fcmple16	%f22,	%f12,	%g4
	movrgez	%o7,	0x31A,	%l3
	fpack32	%f14,	%f16,	%f30
	edge32ln	%i7,	%g2,	%o4
	subcc	%l0,	0x01DE,	%o5
	sll	%i1,	%g6,	%i0
	xorcc	%i3,	0x0AEA,	%i5
	edge8	%l5,	%o1,	%o6
	fmovs	%f1,	%f21
	movleu	%xcc,	%i4,	%i2
	movrlez	%g3,	%l2,	%o2
	movrlez	%g7,	0x309,	%l1
	orncc	%l6,	%g5,	%g1
	ld	[%l7 + 0x34],	%f19
	ldd	[%l7 + 0x18],	%o0
	movg	%icc,	%l4,	%o3
	sir	0x1062
	xorcc	%i6,	0x0907,	%g4
	edge16	%l3,	%o7,	%g2
	array8	%i7,	%l0,	%o4
	xor	%o5,	%g6,	%i0
	save %i3, 0x0505, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i1,	%l5,	%o1
	smul	%i4,	%i2,	%g3
	sll	%l2,	0x17,	%o6
	andcc	%o2,	%g7,	%l6
	ldd	[%l7 + 0x38],	%f2
	fsrc1s	%f9,	%f25
	fxnors	%f20,	%f0,	%f18
	stw	%g5,	[%l7 + 0x08]
	edge32	%l1,	%g1,	%l4
	lduw	[%l7 + 0x24],	%o3
	fcmpgt32	%f28,	%f0,	%i6
	subcc	%o0,	0x18EB,	%l3
	ld	[%l7 + 0x74],	%f9
	nop
	set	0x08, %g2
	stw	%o7,	[%l7 + %g2]
	movle	%xcc,	%g4,	%i7
	srl	%l0,	%g2,	%o4
	nop
	set	0x24, %g6
	stw	%o5,	[%l7 + %g6]
	fmovspos	%icc,	%f18,	%f20
	edge32n	%i0,	%g6,	%i5
	movrgez	%i1,	0x106,	%i3
	array32	%l5,	%i4,	%o1
	fones	%f13
	fcmpeq16	%f30,	%f22,	%i2
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	edge16l	%g7,	%l6,	%o2
	array16	%g5,	%l1,	%l4
	array32	%g1,	%o3,	%i6
	nop
	set	0x08, %g1
	ldx	[%l7 + %g1],	%l3
	ldub	[%l7 + 0x67],	%o7
	smulcc	%g4,	0x1ED3,	%o0
	add	%l0,	%i7,	%o4
	andcc	%g2,	%o5,	%i0
	movrgz	%i5,	0x01D,	%g6
	srlx	%i3,	%l5,	%i1
	fmuld8sux16	%f6,	%f27,	%f26
	fmovrsne	%i4,	%f17,	%f11
	fnand	%f0,	%f14,	%f26
	array16	%i2,	%l2,	%g3
	for	%f24,	%f26,	%f20
	movrgez	%o1,	%o6,	%g7
	sdivcc	%l6,	0x0AB4,	%o2
	sdiv	%l1,	0x0FBD,	%g5
	edge8n	%g1,	%l4,	%i6
	or	%o3,	%o7,	%g4
	edge16ln	%l3,	%l0,	%o0
	alignaddrl	%i7,	%g2,	%o5
	sub	%o4,	%i0,	%g6
	fcmpne32	%f6,	%f6,	%i3
	fand	%f12,	%f16,	%f10
	sra	%i5,	0x17,	%l5
	ldx	[%l7 + 0x48],	%i1
	alignaddrl	%i2,	%l2,	%i4
	fmovdl	%xcc,	%f23,	%f28
	subccc	%g3,	%o1,	%g7
	lduh	[%l7 + 0x5E],	%o6
	sdiv	%l6,	0x010F,	%o2
	fmovrde	%g5,	%f12,	%f26
	fmovrdlez	%l1,	%f12,	%f14
	movrgz	%l4,	0x31C,	%i6
	movrgz	%o3,	%g1,	%g4
	fmovrdne	%o7,	%f18,	%f26
	sllx	%l3,	0x06,	%l0
	fors	%f8,	%f23,	%f12
	ldd	[%l7 + 0x48],	%f20
	fmovsg	%icc,	%f6,	%f0
	movleu	%icc,	%o0,	%g2
	fmovdle	%icc,	%f29,	%f8
	fornot2	%f16,	%f22,	%f26
	or	%o5,	0x1413,	%i7
	movrgz	%i0,	%o4,	%i3
	std	%f20,	[%l7 + 0x28]
	ld	[%l7 + 0x60],	%f20
	array8	%i5,	%l5,	%g6
	mova	%xcc,	%i2,	%l2
	fsrc1	%f2,	%f8
	stw	%i4,	[%l7 + 0x08]
	movvs	%xcc,	%g3,	%o1
	andcc	%i1,	%g7,	%o6
	smul	%l6,	0x180F,	%g5
	fnot1s	%f6,	%f5
	sethi	0x05A6,	%o2
	edge8n	%l4,	%i6,	%o3
	movne	%icc,	%l1,	%g4
	edge32l	%g1,	%o7,	%l0
	addc	%o0,	%l3,	%g2
	movle	%xcc,	%i7,	%i0
	movne	%xcc,	%o4,	%i3
	edge32ln	%i5,	%o5,	%g6
	edge8n	%l5,	%l2,	%i4
	xorcc	%g3,	0x0706,	%o1
	mulscc	%i2,	0x0130,	%g7
	movn	%xcc,	%i1,	%o6
	ld	[%l7 + 0x64],	%f3
	movge	%icc,	%g5,	%l6
	array32	%o2,	%l4,	%o3
	edge8ln	%i6,	%l1,	%g1
	umul	%o7,	0x05FD,	%l0
	subc	%o0,	%l3,	%g2
	movne	%icc,	%g4,	%i0
	edge16l	%o4,	%i3,	%i5
	fcmple32	%f12,	%f26,	%o5
	movne	%icc,	%g6,	%i7
	movgu	%xcc,	%l5,	%i4
	array16	%l2,	%o1,	%i2
	mulx	%g3,	0x189E,	%g7
	subcc	%o6,	0x00DE,	%g5
	lduh	[%l7 + 0x52],	%i1
	sir	0x00F8
	edge32ln	%l6,	%o2,	%o3
	sll	%i6,	0x00,	%l4
	fmovde	%icc,	%f15,	%f31
	sth	%l1,	[%l7 + 0x52]
	fmul8sux16	%f6,	%f6,	%f26
	fcmple32	%f2,	%f4,	%o7
	edge8ln	%g1,	%l0,	%l3
	addccc	%g2,	%g4,	%i0
	edge8n	%o0,	%o4,	%i5
	edge32ln	%i3,	%g6,	%o5
	addcc	%l5,	0x1C73,	%i4
	movle	%icc,	%i7,	%l2
	mulscc	%o1,	0x031A,	%g3
	popc	%i2,	%g7
	movg	%xcc,	%g5,	%o6
	ldsw	[%l7 + 0x6C],	%i1
	srlx	%o2,	0x1B,	%l6
	movg	%icc,	%i6,	%l4
	edge16	%l1,	%o3,	%g1
	edge32l	%o7,	%l0,	%l3
	mulx	%g4,	%g2,	%o0
	edge8ln	%o4,	%i0,	%i5
	lduw	[%l7 + 0x34],	%g6
	sdivx	%o5,	0x1893,	%i3
	fmovd	%f28,	%f22
	move	%xcc,	%i4,	%i7
	umulcc	%l2,	0x1F7E,	%l5
	or	%g3,	%o1,	%i2
	edge8n	%g7,	%g5,	%o6
	edge32n	%o2,	%i1,	%i6
	xnor	%l4,	%l6,	%l1
	movrlez	%g1,	0x30D,	%o7
	subc	%l0,	%l3,	%o3
	umulcc	%g2,	%o0,	%g4
	addcc	%i0,	0x1913,	%o4
	srlx	%g6,	%o5,	%i3
	udivx	%i4,	0x0D68,	%i7
	movrne	%i5,	0x234,	%l2
	movre	%l5,	0x008,	%o1
	lduh	[%l7 + 0x0C],	%g3
	fornot2	%f18,	%f4,	%f26
	fmovrslez	%g7,	%f11,	%f7
	fmovdvc	%icc,	%f26,	%f8
	std	%f22,	[%l7 + 0x78]
	orcc	%i2,	0x1B6C,	%o6
	restore %g5, 0x00B1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i6, %l4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i1,	0x0CC2,	%g1
	addcc	%o7,	%l1,	%l3
	nop
	set	0x38, %l5
	stx	%o3,	[%l7 + %l5]
	movg	%xcc,	%l0,	%o0
	edge32l	%g2,	%i0,	%g4
	fnegd	%f10,	%f28
	sir	0x0581
	edge8	%g6,	%o5,	%o4
	popc	0x1B57,	%i4
	edge32ln	%i3,	%i7,	%i5
	edge32ln	%l5,	%l2,	%g3
	fmovdn	%icc,	%f31,	%f25
	umul	%g7,	0x17FA,	%o1
	srlx	%o6,	%g5,	%i2
	stx	%o2,	[%l7 + 0x70]
	andcc	%l4,	0x13EA,	%l6
	sdivx	%i6,	0x0079,	%i1
	movre	%o7,	%g1,	%l3
	mulscc	%o3,	%l1,	%o0
	fnot2s	%f1,	%f23
	ldub	[%l7 + 0x54],	%l0
	fmovrdlez	%i0,	%f4,	%f30
	fmovsneg	%xcc,	%f9,	%f2
	udivx	%g4,	0x1972,	%g6
	fexpand	%f16,	%f20
	orn	%o5,	%o4,	%g2
	umul	%i4,	0x14BD,	%i3
	movre	%i5,	0x01A,	%i7
	movre	%l2,	0x07A,	%l5
	andcc	%g3,	0x0BDF,	%g7
	fpack32	%f0,	%f0,	%f10
	nop
	set	0x24, %g3
	lduw	[%l7 + %g3],	%o6
	sdiv	%o1,	0x1F82,	%i2
	srlx	%g5,	0x0E,	%l4
	mulscc	%l6,	0x0AC0,	%i6
	udiv	%o2,	0x099F,	%i1
	add	%o7,	%g1,	%o3
	array8	%l1,	%o0,	%l3
	fpsub16s	%f12,	%f23,	%f25
	andcc	%i0,	%g4,	%g6
	fmuld8sux16	%f7,	%f11,	%f16
	addccc	%o5,	%l0,	%o4
	srlx	%g2,	%i4,	%i5
	alignaddr	%i3,	%i7,	%l5
	movcc	%icc,	%l2,	%g7
	stb	%o6,	[%l7 + 0x2B]
	fnot1	%f8,	%f4
	fpsub16s	%f3,	%f27,	%f9
	srlx	%g3,	%o1,	%i2
	edge8n	%l4,	%l6,	%i6
	and	%o2,	%i1,	%o7
	sllx	%g1,	0x0F,	%o3
	movre	%l1,	%o0,	%g5
	edge16n	%i0,	%g4,	%g6
	movcs	%icc,	%l3,	%l0
	fmovscc	%xcc,	%f30,	%f23
	fmovrdlz	%o4,	%f30,	%f20
	fmovsge	%icc,	%f3,	%f10
	smulcc	%o5,	%g2,	%i4
	ld	[%l7 + 0x60],	%f31
	fmovscc	%xcc,	%f11,	%f24
	ldx	[%l7 + 0x38],	%i3
	fxnor	%f10,	%f10,	%f28
	sdivx	%i5,	0x1385,	%i7
	array16	%l5,	%g7,	%o6
	movgu	%xcc,	%l2,	%g3
	movn	%icc,	%i2,	%l4
	sir	0x0ABB
	sllx	%o1,	%l6,	%o2
	sth	%i6,	[%l7 + 0x56]
	ldd	[%l7 + 0x50],	%f26
	fpadd16s	%f2,	%f25,	%f0
	sll	%i1,	0x1C,	%g1
	movrlz	%o7,	%o3,	%o0
	sdivcc	%g5,	0x1C30,	%l1
	fornot2	%f10,	%f22,	%f2
	movrgz	%i0,	%g6,	%l3
	umul	%l0,	%o4,	%o5
	fmovsl	%xcc,	%f13,	%f5
	umul	%g4,	0x08A1,	%g2
	addcc	%i3,	%i5,	%i4
	orcc	%i7,	%g7,	%l5
	stb	%o6,	[%l7 + 0x18]
	movcc	%icc,	%l2,	%g3
	sra	%i2,	0x1E,	%l4
	fmovs	%f3,	%f24
	fandnot1	%f30,	%f0,	%f30
	movle	%icc,	%o1,	%o2
	sll	%l6,	%i6,	%i1
	edge32l	%g1,	%o7,	%o0
	edge32ln	%g5,	%l1,	%o3
	subc	%g6,	0x1A6F,	%l3
	umulcc	%i0,	%o4,	%o5
	std	%f24,	[%l7 + 0x20]
	movn	%xcc,	%g4,	%g2
	fmovscc	%xcc,	%f3,	%f27
	edge16ln	%l0,	%i3,	%i5
	ldsw	[%l7 + 0x60],	%i7
	addccc	%g7,	0x0A99,	%l5
	mulscc	%i4,	0x13F7,	%o6
	xor	%g3,	0x0866,	%l2
	fmovspos	%xcc,	%f3,	%f17
	fmovsle	%icc,	%f3,	%f3
	edge8ln	%i2,	%o1,	%o2
	fcmpeq16	%f0,	%f24,	%l6
	stw	%i6,	[%l7 + 0x0C]
	movl	%icc,	%l4,	%i1
	ldsh	[%l7 + 0x0A],	%o7
	edge16	%g1,	%o0,	%l1
	ldd	[%l7 + 0x18],	%g4
	fcmple32	%f6,	%f30,	%g6
	fcmpes	%fcc2,	%f21,	%f27
	fors	%f14,	%f13,	%f8
	sth	%o3,	[%l7 + 0x22]
	array16	%l3,	%o4,	%i0
	andn	%o5,	%g2,	%l0
	sir	0x0671
	movle	%xcc,	%i3,	%i5
	faligndata	%f16,	%f12,	%f0
	fands	%f2,	%f17,	%f21
	movge	%xcc,	%i7,	%g7
	smulcc	%g4,	%i4,	%o6
	xnor	%l5,	0x0016,	%l2
	edge16ln	%i2,	%o1,	%g3
	movrne	%o2,	0x39A,	%l6
	fone	%f2
	array8	%l4,	%i6,	%i1
	edge16n	%g1,	%o0,	%l1
	stx	%o7,	[%l7 + 0x70]
	movrlz	%g5,	%o3,	%l3
	addccc	%o4,	%i0,	%o5
	fmovrsne	%g2,	%f20,	%f3
	lduw	[%l7 + 0x74],	%l0
	stw	%g6,	[%l7 + 0x6C]
	fmovsge	%xcc,	%f4,	%f12
	movrgz	%i5,	0x16F,	%i3
	siam	0x7
	ldd	[%l7 + 0x48],	%f8
	stx	%g7,	[%l7 + 0x48]
	lduh	[%l7 + 0x32],	%i7
	mulscc	%i4,	%o6,	%g4
	addc	%l2,	%l5,	%i2
	st	%f21,	[%l7 + 0x30]
	fornot1s	%f8,	%f13,	%f17
	andcc	%g3,	%o2,	%l6
	fnands	%f0,	%f19,	%f28
	mulx	%o1,	0x12B7,	%l4
	sdiv	%i1,	0x1338,	%i6
	fones	%f10
	mulx	%o0,	0x0C27,	%l1
	xnor	%o7,	%g1,	%g5
	sdiv	%l3,	0x0792,	%o4
	edge16ln	%i0,	%o3,	%o5
	st	%f13,	[%l7 + 0x14]
	edge16	%l0,	%g2,	%i5
	andncc	%i3,	%g6,	%g7
	fmovdneg	%xcc,	%f7,	%f13
	mulx	%i7,	0x00EA,	%i4
	edge8n	%o6,	%l2,	%g4
	mova	%xcc,	%l5,	%g3
	fmovsvc	%xcc,	%f23,	%f19
	fmovdgu	%icc,	%f23,	%f30
	xnor	%o2,	0x1EC0,	%l6
	edge8l	%o1,	%l4,	%i1
	fands	%f4,	%f18,	%f21
	srax	%i2,	0x1E,	%i6
	umul	%o0,	0x0EC0,	%l1
	edge16	%o7,	%g1,	%l3
	umul	%o4,	%i0,	%g5
	and	%o5,	0x0DD7,	%o3
	udivcc	%g2,	0x09C0,	%i5
	subcc	%l0,	%g6,	%g7
	fmovrdlz	%i3,	%f6,	%f20
	bshuffle	%f14,	%f10,	%f8
	nop
	set	0x0C, %l3
	stw	%i4,	[%l7 + %l3]
	edge8	%o6,	%i7,	%g4
	movrlz	%l2,	%l5,	%o2
	smul	%l6,	0x1130,	%g3
	movvs	%icc,	%o1,	%l4
	ldd	[%l7 + 0x28],	%f22
	mova	%xcc,	%i1,	%i6
	sub	%o0,	%i2,	%o7
	addc	%g1,	0x037B,	%l1
	sdiv	%l3,	0x1400,	%o4
	stb	%g5,	[%l7 + 0x68]
	fmovd	%f8,	%f4
	sllx	%o5,	%o3,	%g2
	fmuld8sux16	%f20,	%f5,	%f16
	movvc	%icc,	%i5,	%i0
	movcs	%xcc,	%g6,	%g7
	ldsb	[%l7 + 0x39],	%i3
	edge16n	%i4,	%o6,	%l0
	smul	%i7,	%g4,	%l5
	movrlez	%o2,	%l2,	%l6
	stw	%g3,	[%l7 + 0x70]
	ldd	[%l7 + 0x08],	%f26
	fand	%f18,	%f18,	%f18
	ldd	[%l7 + 0x10],	%f28
	smulcc	%l4,	%o1,	%i1
	fpsub16s	%f29,	%f25,	%f28
	subcc	%o0,	0x18EB,	%i2
	sdiv	%i6,	0x159E,	%g1
	edge32	%l1,	%o7,	%l3
	ldsb	[%l7 + 0x0A],	%o4
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%f30
	movpos	%xcc,	%g5,	%o3
	fmovdleu	%icc,	%f7,	%f6
	fmuld8sux16	%f5,	%f29,	%f8
	fmovdleu	%xcc,	%f12,	%f28
	xnor	%g2,	0x0B98,	%o5
	popc	0x0F88,	%i0
	array32	%i5,	%g6,	%i3
	fmovrslez	%i4,	%f3,	%f3
	fandnot2	%f10,	%f6,	%f18
	array8	%o6,	%g7,	%l0
	array32	%g4,	%l5,	%i7
	fandnot2	%f4,	%f12,	%f2
	edge16l	%l2,	%o2,	%l6
	fmovsa	%icc,	%f28,	%f8
	movg	%xcc,	%l4,	%o1
	addccc	%g3,	0x1A2E,	%o0
	fmovs	%f16,	%f20
	or	%i1,	%i6,	%g1
	udiv	%i2,	0x1BB2,	%o7
	sdiv	%l1,	0x0CBA,	%o4
	movrne	%l3,	0x297,	%g5
	sra	%o3,	%o5,	%i0
	mulscc	%g2,	%g6,	%i5
	subc	%i4,	0x1556,	%i3
	movrgz	%g7,	0x3F7,	%l0
	edge8l	%g4,	%o6,	%i7
	movleu	%icc,	%l5,	%o2
	array16	%l6,	%l2,	%l4
	fmovsneg	%icc,	%f19,	%f19
	fornot2	%f18,	%f24,	%f20
	movgu	%xcc,	%g3,	%o1
	edge32l	%i1,	%i6,	%o0
	movge	%xcc,	%g1,	%i2
	movle	%icc,	%l1,	%o4
	nop
	set	0x60, %i0
	std	%f4,	[%l7 + %i0]
	sth	%l3,	[%l7 + 0x7A]
	edge16l	%o7,	%g5,	%o3
	edge32l	%o5,	%g2,	%g6
	fnot1s	%f13,	%f30
	andn	%i5,	0x07D6,	%i0
	ldsb	[%l7 + 0x4E],	%i3
	and	%i4,	%l0,	%g4
	siam	0x3
	fcmpgt16	%f8,	%f22,	%o6
	fnor	%f24,	%f8,	%f16
	st	%f0,	[%l7 + 0x3C]
	movcc	%xcc,	%i7,	%g7
	popc	%l5,	%o2
	edge8l	%l2,	%l6,	%g3
	movl	%xcc,	%o1,	%l4
	andn	%i6,	0x1167,	%i1
	fmovrslez	%g1,	%f0,	%f15
	fsrc1s	%f13,	%f26
	mulscc	%o0,	0x08AB,	%l1
	popc	0x061E,	%i2
	ldsh	[%l7 + 0x0A],	%o4
	sir	0x11A4
	movrgz	%l3,	0x101,	%o7
	edge32n	%g5,	%o5,	%g2
	ldx	[%l7 + 0x68],	%g6
	movcc	%xcc,	%i5,	%o3
	fmovdg	%xcc,	%f29,	%f29
	movgu	%icc,	%i0,	%i3
	movge	%icc,	%i4,	%g4
	edge8l	%l0,	%i7,	%g7
	stb	%o6,	[%l7 + 0x0C]
	fmovdvc	%xcc,	%f18,	%f20
	edge32	%o2,	%l2,	%l6
	add	%l5,	%o1,	%l4
	fmovdvc	%xcc,	%f20,	%f5
	edge8	%i6,	%i1,	%g1
	ldd	[%l7 + 0x50],	%o0
	umulcc	%l1,	%g3,	%o4
	nop
	set	0x08, %i7
	ldsw	[%l7 + %i7],	%l3
	ld	[%l7 + 0x14],	%f26
	edge8n	%o7,	%g5,	%o5
	popc	0x1800,	%g2
	movle	%xcc,	%g6,	%i2
	movge	%xcc,	%o3,	%i5
	stw	%i0,	[%l7 + 0x70]
	fmovrdne	%i4,	%f20,	%f28
	movle	%icc,	%g4,	%i3
	orcc	%i7,	%g7,	%l0
	fcmps	%fcc2,	%f6,	%f18
	andn	%o6,	%o2,	%l2
	nop
	set	0x5A, %i1
	lduh	[%l7 + %i1],	%l6
	movre	%o1,	%l4,	%l5
	ldub	[%l7 + 0x30],	%i1
	subcc	%g1,	%o0,	%l1
	movle	%icc,	%i6,	%g3
	edge32ln	%o4,	%l3,	%o7
	sdiv	%g5,	0x0703,	%o5
	udiv	%g6,	0x0A27,	%g2
	movrlez	%o3,	%i5,	%i2
	srl	%i0,	%g4,	%i3
	stx	%i7,	[%l7 + 0x30]
	fmul8x16	%f5,	%f28,	%f4
	movle	%icc,	%i4,	%g7
	or	%l0,	%o6,	%l2
	xorcc	%o2,	%l6,	%l4
	fmovsa	%xcc,	%f9,	%f3
	ldd	[%l7 + 0x50],	%o0
	xor	%l5,	0x01A7,	%g1
	umul	%o0,	0x0F7C,	%l1
	fmovdne	%xcc,	%f8,	%f8
	sllx	%i1,	%g3,	%o4
	orncc	%i6,	0x0A85,	%l3
	sethi	0x045A,	%g5
	edge16ln	%o7,	%g6,	%g2
	sir	0x1A20
	lduh	[%l7 + 0x7A],	%o5
	movcc	%icc,	%o3,	%i5
	fone	%f30
	smul	%i2,	0x1535,	%i0
	fmovdne	%icc,	%f2,	%f1
	xor	%g4,	0x1681,	%i7
	movle	%icc,	%i3,	%g7
	umul	%l0,	0x0DB5,	%o6
	stw	%i4,	[%l7 + 0x08]
	xorcc	%l2,	0x1D2D,	%o2
	movn	%icc,	%l6,	%o1
	fmovsvc	%xcc,	%f0,	%f30
	lduw	[%l7 + 0x60],	%l5
	edge8l	%g1,	%o0,	%l1
	subc	%i1,	%g3,	%o4
	fmovrde	%i6,	%f2,	%f2
	nop
	set	0x64, %o0
	stw	%l3,	[%l7 + %o0]
	edge32l	%l4,	%g5,	%o7
	sub	%g6,	0x16CD,	%o5
	movpos	%icc,	%g2,	%o3
	addccc	%i2,	%i0,	%i5
	fxnor	%f20,	%f26,	%f10
	sllx	%i7,	0x00,	%g4
	movgu	%icc,	%g7,	%l0
	fsrc2	%f6,	%f20
	movle	%icc,	%i3,	%o6
	fmovsl	%xcc,	%f14,	%f4
	fmovsge	%icc,	%f5,	%f15
	sub	%i4,	%o2,	%l6
	edge32n	%o1,	%l5,	%l2
	fmovsa	%xcc,	%f2,	%f7
	array8	%o0,	%l1,	%g1
	nop
	set	0x20, %g5
	ldx	[%l7 + %g5],	%g3
	subccc	%i1,	%i6,	%l3
	edge16ln	%o4,	%l4,	%o7
	subc	%g6,	%o5,	%g2
	sdivx	%g5,	0x0395,	%o3
	ldsb	[%l7 + 0x55],	%i0
	std	%f18,	[%l7 + 0x30]
	edge16	%i2,	%i5,	%g4
	subcc	%g7,	%l0,	%i7
	alignaddr	%o6,	%i3,	%o2
	fmovsne	%icc,	%f23,	%f4
	movl	%xcc,	%l6,	%o1
	mova	%icc,	%l5,	%i4
	sll	%l2,	%o0,	%l1
	addc	%g1,	0x1407,	%i1
	subc	%g3,	0x17F9,	%l3
	lduw	[%l7 + 0x50],	%o4
	ldd	[%l7 + 0x28],	%i6
	fornot1	%f30,	%f6,	%f16
	ldsh	[%l7 + 0x70],	%o7
	ldd	[%l7 + 0x10],	%f24
	array32	%g6,	%l4,	%g2
	fmovdneg	%icc,	%f12,	%f6
	and	%o5,	0x1BFB,	%o3
	movpos	%icc,	%g5,	%i2
	fors	%f26,	%f16,	%f9
	fcmpeq32	%f8,	%f28,	%i0
	umulcc	%i5,	%g4,	%g7
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	edge16ln	%i3,	%l0,	%l6
	st	%f20,	[%l7 + 0x68]
	xnorcc	%o1,	0x11D0,	%o2
	ldsb	[%l7 + 0x54],	%l5
	edge16l	%l2,	%i4,	%l1
	movn	%xcc,	%g1,	%o0
	fpadd32s	%f10,	%f30,	%f28
	add	%g3,	%l3,	%o4
	umul	%i6,	%o7,	%g6
	movle	%icc,	%l4,	%i1
	edge32n	%o5,	%g2,	%o3
	ldd	[%l7 + 0x60],	%g4
	fcmpgt32	%f8,	%f22,	%i0
	fand	%f20,	%f14,	%f22
	xnor	%i5,	%i2,	%g4
	mulx	%g7,	0x0F57,	%i7
	movrgz	%i3,	0x1F2,	%o6
	array32	%l0,	%o1,	%l6
	movrgez	%l5,	0x363,	%l2
	fpadd32s	%f15,	%f11,	%f28
	orncc	%i4,	%l1,	%g1
	fzeros	%f23
	edge16n	%o0,	%o2,	%g3
	xnorcc	%l3,	0x026A,	%i6
	ldsb	[%l7 + 0x3E],	%o7
	edge8ln	%o4,	%g6,	%i1
	movpos	%xcc,	%o5,	%l4
	movvs	%xcc,	%g2,	%o3
	srax	%g5,	0x01,	%i5
	st	%f2,	[%l7 + 0x5C]
	sth	%i0,	[%l7 + 0x6A]
	movrgez	%g4,	0x227,	%g7
	fmovsneg	%xcc,	%f26,	%f22
	andcc	%i2,	0x0064,	%i3
	andncc	%o6,	%i7,	%o1
	movrlz	%l0,	0x08D,	%l6
	sethi	0x10E9,	%l5
	fcmpeq16	%f4,	%f18,	%i4
	udivx	%l1,	0x06E5,	%l2
	sdivcc	%g1,	0x1F95,	%o2
	sll	%g3,	%l3,	%o0
	movne	%icc,	%o7,	%i6
	orcc	%g6,	0x0E73,	%o4
	add	%i1,	%l4,	%o5
	stb	%g2,	[%l7 + 0x7F]
	st	%f24,	[%l7 + 0x7C]
	alignaddrl	%o3,	%g5,	%i0
	edge16l	%g4,	%i5,	%g7
	fone	%f14
	edge32	%i3,	%i2,	%i7
	sra	%o6,	0x19,	%o1
	mulscc	%l6,	%l0,	%l5
	smulcc	%l1,	0x1363,	%l2
	sdivx	%g1,	0x1067,	%i4
	srlx	%o2,	%g3,	%o0
	orncc	%l3,	0x02FE,	%i6
	sub	%o7,	%o4,	%i1
	edge32n	%g6,	%l4,	%o5
	st	%f12,	[%l7 + 0x2C]
	addcc	%o3,	%g2,	%g5
	movge	%xcc,	%i0,	%g4
	lduh	[%l7 + 0x42],	%g7
	fmovdvs	%icc,	%f12,	%f1
	stx	%i5,	[%l7 + 0x78]
	xorcc	%i2,	%i3,	%o6
	edge16l	%o1,	%i7,	%l6
	andcc	%l5,	0x0604,	%l0
	movrlz	%l1,	%g1,	%l2
	movgu	%icc,	%o2,	%g3
	lduw	[%l7 + 0x40],	%i4
	movvc	%icc,	%o0,	%i6
	bshuffle	%f14,	%f0,	%f28
	fsrc1s	%f23,	%f20
	fpsub32	%f20,	%f28,	%f14
	move	%icc,	%l3,	%o7
	move	%icc,	%i1,	%g6
	umul	%l4,	0x19E0,	%o5
	orcc	%o3,	0x0DF6,	%g2
	addcc	%o4,	0x0C6F,	%i0
	sllx	%g5,	%g7,	%i5
	fmovde	%icc,	%f25,	%f26
	udivcc	%i2,	0x0120,	%g4
	edge32l	%i3,	%o1,	%o6
	sll	%l6,	%l5,	%l0
	subc	%l1,	%g1,	%l2
	sth	%i7,	[%l7 + 0x74]
	popc	0x03DE,	%g3
	edge16ln	%o2,	%i4,	%i6
	xor	%l3,	0x1088,	%o7
	andncc	%o0,	%g6,	%i1
	movne	%icc,	%o5,	%o3
	fmul8x16al	%f31,	%f28,	%f30
	edge32n	%g2,	%o4,	%i0
	xor	%g5,	0x1365,	%g7
	fmovsl	%xcc,	%f1,	%f13
	movleu	%xcc,	%l4,	%i5
	ldx	[%l7 + 0x08],	%g4
	movgu	%icc,	%i3,	%o1
	movrlz	%o6,	0x0FB,	%i2
	fmul8ulx16	%f8,	%f24,	%f30
	umulcc	%l6,	0x03BC,	%l5
	fors	%f17,	%f7,	%f7
	fmovsn	%icc,	%f29,	%f7
	array32	%l0,	%l1,	%g1
	umulcc	%l2,	%i7,	%o2
	addccc	%i4,	0x1B63,	%g3
	ldub	[%l7 + 0x6C],	%i6
	save %o7, %o0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g6,	0x1273,	%i1
	udivcc	%o3,	0x1525,	%o5
	sllx	%o4,	%i0,	%g2
	fcmpeq32	%f18,	%f30,	%g5
	sir	0x11F5
	lduh	[%l7 + 0x36],	%g7
	ldd	[%l7 + 0x70],	%f26
	movpos	%icc,	%l4,	%g4
	fmul8ulx16	%f2,	%f20,	%f8
	movre	%i3,	%o1,	%i5
	movleu	%xcc,	%o6,	%l6
	mulx	%l5,	%l0,	%l1
	for	%f10,	%f8,	%f14
	smulcc	%g1,	%i2,	%l2
	std	%f8,	[%l7 + 0x68]
	fmovsa	%xcc,	%f23,	%f1
	fabsd	%f20,	%f4
	nop
	set	0x20, %o7
	std	%f26,	[%l7 + %o7]
	subccc	%i7,	%o2,	%i4
	srl	%i6,	%o7,	%o0
	movle	%xcc,	%g3,	%l3
	movgu	%icc,	%i1,	%o3
	or	%g6,	%o5,	%o4
	xorcc	%i0,	0x177A,	%g5
	movneg	%xcc,	%g2,	%g7
	movcc	%xcc,	%g4,	%l4
	fmovdneg	%icc,	%f22,	%f15
	movne	%xcc,	%i3,	%o1
	add	%i5,	%o6,	%l6
	popc	%l0,	%l1
	movl	%xcc,	%l5,	%g1
	mulscc	%i2,	%i7,	%o2
	movgu	%xcc,	%i4,	%i6
	ldub	[%l7 + 0x63],	%l2
	movl	%xcc,	%o7,	%g3
	ldsh	[%l7 + 0x74],	%l3
	mulscc	%i1,	%o0,	%g6
	subcc	%o5,	%o3,	%i0
	ld	[%l7 + 0x40],	%f0
	movvs	%xcc,	%g5,	%g2
	movrlez	%o4,	%g7,	%l4
	addcc	%i3,	%g4,	%i5
	ldub	[%l7 + 0x63],	%o1
	ldd	[%l7 + 0x20],	%o6
	movrlez	%l6,	0x288,	%l1
	alignaddrl	%l5,	%g1,	%i2
	movre	%i7,	%o2,	%i4
	fnand	%f0,	%f22,	%f24
	edge32l	%l0,	%i6,	%l2
	pdist	%f8,	%f16,	%f18
	restore %o7, 0x1A54, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i1,	0x00C9,	%o0
	addccc	%g6,	%o5,	%l3
	fmovdneg	%xcc,	%f7,	%f15
	sir	0x146B
	edge32ln	%i0,	%g5,	%g2
	udiv	%o3,	0x0076,	%o4
	edge16ln	%g7,	%l4,	%i3
	edge32	%i5,	%g4,	%o1
	nop
	set	0x0C, %o6
	sth	%l6,	[%l7 + %o6]
	orn	%o6,	%l5,	%l1
	edge32l	%i2,	%g1,	%o2
	fabss	%f25,	%f17
	sll	%i4,	0x1C,	%l0
	subc	%i6,	0x0F06,	%l2
	orcc	%i7,	0x06BC,	%g3
	fands	%f11,	%f21,	%f6
	sdiv	%o7,	0x0F67,	%i1
	movl	%icc,	%o0,	%o5
	xor	%l3,	%i0,	%g5
	sth	%g6,	[%l7 + 0x22]
	movg	%xcc,	%o3,	%g2
	movneg	%xcc,	%g7,	%l4
	andncc	%i3,	%i5,	%g4
	addccc	%o4,	%o1,	%o6
	movcc	%icc,	%l6,	%l1
	movre	%i2,	%g1,	%l5
	addcc	%i4,	0x0C76,	%l0
	movg	%icc,	%i6,	%l2
	sll	%o2,	%i7,	%g3
	and	%o7,	0x1A96,	%i1
	edge32n	%o0,	%o5,	%l3
	st	%f22,	[%l7 + 0x08]
	fmul8x16au	%f2,	%f11,	%f26
	smul	%g5,	%i0,	%o3
	save %g6, %g2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g7,	0x081A,	%i3
	subcc	%i5,	%o4,	%g4
	fcmpes	%fcc1,	%f6,	%f8
	fmovrdne	%o1,	%f2,	%f20
	edge8ln	%l6,	%o6,	%i2
	subc	%g1,	0x186C,	%l5
	fmovsleu	%xcc,	%f27,	%f11
	subccc	%l1,	%l0,	%i6
	edge8	%l2,	%i4,	%i7
	umul	%o2,	%g3,	%o7
	ldsw	[%l7 + 0x68],	%o0
	movpos	%icc,	%i1,	%l3
	movvc	%icc,	%g5,	%i0
	fcmpes	%fcc1,	%f18,	%f23
	sth	%o5,	[%l7 + 0x46]
	movge	%icc,	%g6,	%g2
	movleu	%icc,	%o3,	%l4
	fexpand	%f17,	%f8
	edge32n	%g7,	%i3,	%o4
	addccc	%i5,	0x0DAE,	%g4
	fmovspos	%xcc,	%f14,	%f5
	sll	%l6,	%o6,	%i2
	movg	%icc,	%g1,	%o1
	movpos	%icc,	%l1,	%l0
	mulx	%i6,	0x04DC,	%l2
	fnot2s	%f30,	%f2
	fmovdn	%icc,	%f4,	%f19
	umulcc	%i4,	%i7,	%o2
	udivcc	%g3,	0x1FEB,	%o7
	movge	%icc,	%o0,	%i1
	movn	%icc,	%l5,	%g5
	fnands	%f18,	%f0,	%f2
	edge16l	%l3,	%o5,	%g6
	ldd	[%l7 + 0x58],	%g2
	movle	%xcc,	%i0,	%l4
	orn	%o3,	0x01D7,	%i3
	ldx	[%l7 + 0x50],	%o4
	xorcc	%i5,	0x1363,	%g7
	movpos	%xcc,	%g4,	%l6
	fmovda	%icc,	%f14,	%f29
	edge32n	%o6,	%g1,	%i2
	sethi	0x1524,	%l1
	alignaddr	%o1,	%i6,	%l0
	alignaddr	%l2,	%i7,	%i4
	fpadd16s	%f13,	%f3,	%f20
	addccc	%o2,	0x1330,	%o7
	fornot1	%f12,	%f0,	%f26
	movrlz	%o0,	%g3,	%l5
	lduw	[%l7 + 0x0C],	%i1
	andn	%g5,	0x1A60,	%o5
	sdiv	%l3,	0x13DA,	%g2
	fmovrsne	%i0,	%f5,	%f25
	sdiv	%l4,	0x1FCB,	%o3
	fmovsle	%xcc,	%f17,	%f0
	subccc	%g6,	%o4,	%i3
	ldx	[%l7 + 0x10],	%i5
	edge32n	%g4,	%g7,	%l6
	fmul8x16	%f4,	%f26,	%f28
	edge16ln	%g1,	%i2,	%l1
	xor	%o6,	0x08DA,	%o1
	edge8ln	%i6,	%l0,	%i7
	ldsw	[%l7 + 0x2C],	%l2
	ldd	[%l7 + 0x40],	%o2
	orncc	%i4,	0x0CB6,	%o7
	fpack16	%f10,	%f31
	xnor	%o0,	%g3,	%i1
	add	%g5,	0x1D2F,	%o5
	addc	%l5,	%g2,	%i0
	sll	%l4,	0x1A,	%l3
	stx	%o3,	[%l7 + 0x48]
	nop
	set	0x68, %o1
	ldsh	[%l7 + %o1],	%o4
	movvs	%xcc,	%i3,	%i5
	ldub	[%l7 + 0x36],	%g4
	xor	%g7,	%g6,	%l6
	movrgez	%i2,	0x08F,	%l1
	movrgez	%o6,	0x348,	%o1
	movrgez	%i6,	%g1,	%l0
	stx	%l2,	[%l7 + 0x08]
	fnegd	%f26,	%f6
	movrne	%o2,	0x3DD,	%i7
	xnorcc	%o7,	0x1770,	%i4
	xorcc	%o0,	0x071A,	%i1
	movpos	%xcc,	%g5,	%g3
	fmovdne	%xcc,	%f5,	%f8
	fxors	%f23,	%f11,	%f20
	udivx	%l5,	0x11DE,	%o5
	fmovdg	%icc,	%f2,	%f8
	srl	%g2,	%i0,	%l3
	move	%xcc,	%o3,	%l4
	orncc	%o4,	%i5,	%i3
	siam	0x1
	movge	%icc,	%g4,	%g6
	edge8n	%g7,	%l6,	%i2
	orcc	%o6,	%o1,	%l1
	fmovscc	%icc,	%f1,	%f20
	fmovdpos	%icc,	%f12,	%f11
	edge16l	%i6,	%g1,	%l2
	edge16ln	%o2,	%l0,	%i7
	fmovsleu	%xcc,	%f28,	%f18
	fxor	%f18,	%f30,	%f2
	fnot2s	%f0,	%f6
	andncc	%o7,	%o0,	%i1
	orn	%g5,	0x0601,	%g3
	movge	%xcc,	%i4,	%l5
	or	%g2,	0x0394,	%i0
	movl	%xcc,	%o5,	%o3
	ldsh	[%l7 + 0x24],	%l3
	fsrc2	%f20,	%f4
	edge32ln	%l4,	%o4,	%i3
	fmovdneg	%xcc,	%f16,	%f31
	subcc	%i5,	%g6,	%g4
	subccc	%g7,	0x1E6B,	%l6
	sir	0x0C27
	sdivcc	%i2,	0x10A7,	%o6
	andcc	%l1,	0x186C,	%i6
	movrne	%o1,	0x0B8,	%l2
	movneg	%icc,	%o2,	%g1
	movle	%xcc,	%l0,	%o7
	udivx	%i7,	0x0C8D,	%o0
	movvs	%xcc,	%i1,	%g5
	sdiv	%i4,	0x1F0A,	%g3
	edge16n	%g2,	%l5,	%o5
	fcmps	%fcc3,	%f4,	%f24
	edge32l	%o3,	%l3,	%l4
	udivx	%i0,	0x0ECD,	%i3
	sdiv	%i5,	0x0826,	%g6
	alignaddrl	%g4,	%g7,	%l6
	stx	%i2,	[%l7 + 0x60]
	fmovrdgez	%o6,	%f18,	%f28
	addcc	%o4,	%i6,	%o1
	movcs	%xcc,	%l2,	%o2
	edge8n	%g1,	%l1,	%l0
	movneg	%xcc,	%i7,	%o0
	fsrc2	%f14,	%f26
	umul	%i1,	0x11C3,	%g5
	udivcc	%i4,	0x04CC,	%g3
	srax	%o7,	0x0F,	%l5
	andcc	%g2,	0x0D02,	%o3
	fpsub32s	%f23,	%f19,	%f8
	edge16	%o5,	%l4,	%i0
	movgu	%xcc,	%l3,	%i3
	ld	[%l7 + 0x4C],	%f24
	fpadd32	%f30,	%f28,	%f30
	popc	%i5,	%g4
	xor	%g6,	%g7,	%l6
	movrgez	%o6,	0x072,	%o4
	fpack32	%f0,	%f6,	%f2
	or	%i2,	0x1634,	%i6
	fmovsneg	%icc,	%f8,	%f13
	movge	%xcc,	%l2,	%o2
	movg	%icc,	%o1,	%l1
	stw	%g1,	[%l7 + 0x18]
	andcc	%i7,	0x1529,	%o0
	fcmpgt32	%f14,	%f2,	%i1
	fpack16	%f18,	%f11
	edge16	%l0,	%g5,	%i4
	fsrc2	%f4,	%f22
	fcmps	%fcc2,	%f21,	%f2
	srax	%g3,	%l5,	%g2
	andncc	%o7,	%o3,	%o5
	save %l4, %l3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f1,	%f6,	%f24
	fcmpgt32	%f8,	%f8,	%i5
	sdiv	%i0,	0x0C06,	%g4
	orncc	%g7,	0x1BE7,	%l6
	fones	%f31
	xnorcc	%g6,	%o6,	%i2
	mova	%xcc,	%i6,	%l2
	array16	%o2,	%o4,	%l1
	fsrc2	%f16,	%f28
	edge16ln	%g1,	%o1,	%o0
	movcs	%xcc,	%i7,	%l0
	fandnot2	%f18,	%f26,	%f20
	edge16l	%g5,	%i4,	%i1
	movle	%icc,	%g3,	%l5
	nop
	set	0x20, %l4
	ldx	[%l7 + %l4],	%o7
	srax	%o3,	%o5,	%g2
	edge32	%l3,	%i3,	%i5
	alignaddr	%l4,	%g4,	%i0
	fmul8x16au	%f7,	%f17,	%f30
	fmuld8ulx16	%f25,	%f2,	%f18
	xnorcc	%l6,	0x094E,	%g6
	xor	%g7,	0x11D4,	%i2
	umul	%i6,	0x1B32,	%o6
	sub	%l2,	0x1F25,	%o4
	addcc	%l1,	%g1,	%o2
	fxor	%f10,	%f10,	%f26
	udiv	%o0,	0x0D06,	%i7
	sir	0x188F
	movgu	%xcc,	%l0,	%o1
	sethi	0x04DD,	%g5
	movrgz	%i4,	%g3,	%i1
	sdivcc	%o7,	0x10F2,	%l5
	fmovrsgz	%o3,	%f25,	%f10
	stx	%o5,	[%l7 + 0x60]
	movrne	%l3,	0x393,	%i3
	sir	0x07CF
	edge16n	%g2,	%l4,	%i5
	subc	%g4,	%i0,	%l6
	fsrc2	%f4,	%f24
	alignaddr	%g7,	%g6,	%i2
	movrgez	%o6,	0x2F2,	%l2
	array16	%i6,	%l1,	%g1
	edge32l	%o4,	%o2,	%i7
	array8	%l0,	%o1,	%g5
	movcc	%icc,	%o0,	%i4
	ldx	[%l7 + 0x18],	%i1
	and	%g3,	%l5,	%o3
	fandnot2s	%f12,	%f10,	%f1
	sub	%o7,	%o5,	%l3
	movgu	%xcc,	%i3,	%l4
	udiv	%g2,	0x05E1,	%g4
	orncc	%i0,	0x043D,	%l6
	movcs	%xcc,	%g7,	%g6
	subccc	%i5,	%o6,	%l2
	movcs	%icc,	%i2,	%l1
	fmovda	%icc,	%f28,	%f25
	array8	%g1,	%i6,	%o4
	movvs	%icc,	%i7,	%l0
	ldsw	[%l7 + 0x2C],	%o1
	xorcc	%o2,	0x0071,	%g5
	fmovsne	%icc,	%f3,	%f7
	fmovsne	%xcc,	%f13,	%f10
	stb	%o0,	[%l7 + 0x35]
	nop
	set	0x43, %l6
	ldsb	[%l7 + %l6],	%i1
	srlx	%g3,	%l5,	%i4
	fmovs	%f29,	%f23
	ldd	[%l7 + 0x78],	%o6
	lduw	[%l7 + 0x44],	%o3
	movrne	%o5,	%i3,	%l3
	sub	%g2,	0x0C7C,	%g4
	edge16n	%l4,	%i0,	%g7
	ldsb	[%l7 + 0x0C],	%g6
	fornot2s	%f12,	%f0,	%f1
	fmovrdgez	%l6,	%f18,	%f14
	array8	%i5,	%o6,	%i2
	fmovsvs	%icc,	%f1,	%f26
	sth	%l1,	[%l7 + 0x12]
	andn	%l2,	0x1A64,	%g1
	fmul8sux16	%f28,	%f16,	%f12
	sethi	0x0719,	%i6
	mova	%icc,	%i7,	%o4
	srl	%o1,	%o2,	%g5
	fmovdne	%xcc,	%f7,	%f24
	mulx	%o0,	%i1,	%g3
	edge16	%l5,	%l0,	%o7
	movcs	%icc,	%o3,	%i4
	ldsh	[%l7 + 0x5A],	%i3
	movre	%l3,	%g2,	%o5
	ld	[%l7 + 0x34],	%f17
	sll	%g4,	%l4,	%i0
	array8	%g7,	%l6,	%g6
	orcc	%o6,	0x06D1,	%i5
	addc	%i2,	%l2,	%g1
	sdivcc	%l1,	0x00BB,	%i6
	sth	%i7,	[%l7 + 0x3C]
	sth	%o1,	[%l7 + 0x0C]
	ld	[%l7 + 0x50],	%f0
	ldsw	[%l7 + 0x1C],	%o2
	addccc	%g5,	%o0,	%o4
	stx	%i1,	[%l7 + 0x10]
	fmovdne	%xcc,	%f7,	%f11
	fmovrdlez	%g3,	%f24,	%f12
	addc	%l0,	%o7,	%l5
	addc	%o3,	%i4,	%l3
	srax	%i3,	0x15,	%g2
	movcs	%icc,	%o5,	%l4
	orcc	%g4,	%i0,	%g7
	fands	%f24,	%f13,	%f6
	edge32l	%l6,	%g6,	%i5
	xor	%i2,	0x130A,	%l2
	srlx	%g1,	%o6,	%l1
	fmovrdlz	%i6,	%f26,	%f4
	movg	%icc,	%o1,	%o2
	mova	%xcc,	%g5,	%i7
	movre	%o4,	0x228,	%o0
	std	%f10,	[%l7 + 0x70]
	umul	%g3,	%l0,	%i1
	nop
	set	0x4A, %g7
	ldsb	[%l7 + %g7],	%o7
	movl	%xcc,	%l5,	%o3
	subccc	%i4,	%l3,	%i3
	srlx	%o5,	%g2,	%l4
	udivx	%i0,	0x0169,	%g7
	movrlz	%g4,	0x1DB,	%l6
	movrlez	%g6,	%i2,	%l2
	srax	%i5,	0x16,	%o6
	fnot2s	%f29,	%f18
	sra	%g1,	0x1C,	%l1
	edge16	%o1,	%i6,	%g5
	sir	0x03D5
	umul	%i7,	%o2,	%o4
	xnorcc	%g3,	0x1281,	%o0
	udivx	%i1,	0x1C73,	%o7
	umulcc	%l5,	0x0763,	%l0
	and	%i4,	0x1E47,	%l3
	fcmps	%fcc0,	%f10,	%f29
	fpsub32	%f6,	%f16,	%f6
	ldd	[%l7 + 0x50],	%f2
	array16	%i3,	%o3,	%o5
	fmuld8sux16	%f25,	%f3,	%f12
	move	%icc,	%g2,	%l4
	ldd	[%l7 + 0x18],	%g6
	fsrc2s	%f8,	%f8
	fzeros	%f5
	movrgez	%i0,	%g4,	%l6
	sdivx	%g6,	0x1820,	%l2
	fmovdg	%icc,	%f26,	%f17
	ld	[%l7 + 0x34],	%f18
	umulcc	%i5,	0x1DEB,	%i2
	st	%f14,	[%l7 + 0x1C]
	fcmpne32	%f4,	%f10,	%g1
	ldsh	[%l7 + 0x68],	%o6
	sir	0x08A3
	xnorcc	%o1,	%l1,	%g5
	fmovsvc	%xcc,	%f25,	%f22
	xnorcc	%i6,	%i7,	%o4
	stx	%o2,	[%l7 + 0x28]
	movre	%g3,	0x21A,	%i1
	fmul8x16au	%f23,	%f26,	%f30
	movge	%icc,	%o7,	%o0
	edge8ln	%l0,	%l5,	%i4
	sth	%i3,	[%l7 + 0x58]
	edge8	%l3,	%o3,	%o5
	edge16n	%g2,	%l4,	%i0
	udiv	%g4,	0x0975,	%g7
	movcs	%xcc,	%l6,	%g6
	save %i5, 0x131D, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g1,	%l2,	%o6
	xorcc	%o1,	0x18AF,	%g5
	popc	0x0D24,	%i6
	or	%l1,	0x0B8A,	%o4
	movgu	%icc,	%o2,	%i7
	movrne	%g3,	0x2B8,	%o7
	ldd	[%l7 + 0x58],	%f14
	fmul8ulx16	%f18,	%f22,	%f6
	movrlz	%i1,	%o0,	%l5
	srax	%i4,	0x15,	%i3
	ldsb	[%l7 + 0x60],	%l3
	movgu	%icc,	%l0,	%o3
	fmovdl	%icc,	%f22,	%f24
	andcc	%g2,	0x1FFA,	%o5
	orcc	%l4,	0x1942,	%g4
	edge16ln	%g7,	%l6,	%i0
	movgu	%icc,	%g6,	%i5
	array16	%g1,	%l2,	%i2
	addcc	%o1,	%g5,	%o6
	sll	%i6,	0x11,	%o4
	edge8n	%l1,	%i7,	%o2
	ldsh	[%l7 + 0x2A],	%o7
	mulx	%g3,	%i1,	%o0
	xorcc	%i4,	%i3,	%l5
	fabsd	%f6,	%f0
	popc	%l0,	%o3
	lduw	[%l7 + 0x4C],	%g2
	orcc	%l3,	0x08F9,	%o5
	fxors	%f23,	%f0,	%f0
	edge32l	%g4,	%g7,	%l6
	addccc	%l4,	0x115D,	%i0
	ld	[%l7 + 0x74],	%f31
	movge	%icc,	%g6,	%i5
	and	%l2,	%i2,	%o1
	stw	%g1,	[%l7 + 0x24]
	movpos	%xcc,	%g5,	%o6
	sdivx	%i6,	0x1C3C,	%o4
	xnorcc	%i7,	%o2,	%o7
	ldsb	[%l7 + 0x38],	%g3
	srl	%l1,	%i1,	%o0
	ldd	[%l7 + 0x28],	%f14
	popc	%i3,	%i4
	fsrc2	%f8,	%f22
	andn	%l0,	%l5,	%g2
	add	%o3,	%o5,	%g4
	mova	%xcc,	%g7,	%l6
	stw	%l3,	[%l7 + 0x60]
	alignaddrl	%i0,	%l4,	%g6
	sdivcc	%i5,	0x16DD,	%i2
	fsrc2	%f6,	%f8
	movre	%l2,	%g1,	%o1
	fcmple16	%f24,	%f10,	%o6
	movcc	%xcc,	%i6,	%o4
	for	%f12,	%f2,	%f12
	fmuld8ulx16	%f3,	%f24,	%f0
	fmovrdlez	%g5,	%f0,	%f22
	fmovdvc	%icc,	%f6,	%f8
	xorcc	%o2,	0x069F,	%o7
	ldd	[%l7 + 0x50],	%f24
	ldsh	[%l7 + 0x1E],	%g3
	udivx	%i7,	0x1C68,	%l1
	std	%f10,	[%l7 + 0x38]
	sll	%o0,	0x0C,	%i1
	stw	%i4,	[%l7 + 0x60]
	ldsw	[%l7 + 0x1C],	%i3
	fmuld8sux16	%f9,	%f19,	%f20
	movle	%icc,	%l0,	%g2
	subcc	%o3,	%o5,	%g4
	edge16n	%g7,	%l6,	%l3
	movrgez	%l5,	%l4,	%g6
	sdivcc	%i0,	0x1DD6,	%i2
	addccc	%i5,	%g1,	%o1
	lduw	[%l7 + 0x68],	%l2
	xorcc	%i6,	0x0B2E,	%o4
	fcmpne32	%f10,	%f22,	%g5
	array16	%o6,	%o2,	%o7
	movle	%icc,	%g3,	%i7
	fxors	%f11,	%f6,	%f20
	andcc	%l1,	0x06DE,	%i1
	edge16	%i4,	%i3,	%o0
	fmovsa	%xcc,	%f31,	%f30
	edge8	%g2,	%l0,	%o5
	xorcc	%g4,	0x0101,	%g7
	movgu	%icc,	%l6,	%o3
	stx	%l3,	[%l7 + 0x40]
	fmovspos	%icc,	%f3,	%f5
	smulcc	%l5,	%l4,	%g6
	fmovdne	%icc,	%f18,	%f30
	umulcc	%i0,	%i2,	%i5
	edge32ln	%g1,	%o1,	%i6
	xorcc	%o4,	%l2,	%g5
	fmovsleu	%xcc,	%f29,	%f1
	fpmerge	%f2,	%f26,	%f24
	srax	%o6,	0x07,	%o2
	stb	%g3,	[%l7 + 0x36]
	movge	%icc,	%i7,	%o7
	ldub	[%l7 + 0x30],	%l1
	or	%i4,	0x0250,	%i1
	fmovsvc	%xcc,	%f19,	%f16
	udivx	%o0,	0x0540,	%g2
	edge8l	%l0,	%o5,	%g4
	fmovrdlz	%g7,	%f6,	%f22
	fcmpne32	%f8,	%f24,	%l6
	fmovsa	%xcc,	%f19,	%f12
	fmovspos	%xcc,	%f16,	%f10
	ldd	[%l7 + 0x40],	%f0
	sir	0x188B
	smulcc	%i3,	%o3,	%l5
	ldsh	[%l7 + 0x1A],	%l4
	stx	%g6,	[%l7 + 0x70]
	andncc	%l3,	%i0,	%i5
	edge32l	%g1,	%o1,	%i2
	ldub	[%l7 + 0x7B],	%o4
	fnot2	%f22,	%f2
	srl	%l2,	0x11,	%g5
	faligndata	%f16,	%f8,	%f20
	movvs	%xcc,	%o6,	%o2
	fone	%f22
	mova	%icc,	%i6,	%i7
	sethi	0x0CF6,	%o7
	andncc	%l1,	%i4,	%i1
	ldsb	[%l7 + 0x5D],	%o0
	sll	%g2,	0x0A,	%g3
	popc	0x1F31,	%l0
	xorcc	%o5,	%g4,	%l6
	umulcc	%g7,	0x07FA,	%i3
	udivx	%l5,	0x1524,	%o3
	movrgz	%l4,	0x307,	%l3
	movpos	%icc,	%g6,	%i5
	xor	%g1,	0x1F41,	%i0
	srax	%i2,	%o4,	%l2
	ldsb	[%l7 + 0x0A],	%o1
	ldub	[%l7 + 0x37],	%g5
	sdivcc	%o6,	0x173B,	%i6
	fmovda	%xcc,	%f16,	%f28
	edge32ln	%i7,	%o2,	%o7
	addcc	%l1,	0x0C18,	%i4
	udivx	%i1,	0x00C7,	%o0
	srlx	%g3,	%g2,	%o5
	fmovrdne	%g4,	%f18,	%f16
	movle	%xcc,	%l6,	%g7
	ldd	[%l7 + 0x38],	%f14
	array32	%l0,	%i3,	%o3
	nop
	set	0x3C, %o4
	ldsw	[%l7 + %o4],	%l5
	sub	%l4,	0x1B64,	%g6
	movrgz	%i5,	0x38B,	%g1
	sdiv	%i0,	0x1906,	%l3
	addccc	%i2,	0x0D07,	%l2
	movne	%icc,	%o4,	%o1
	std	%f30,	[%l7 + 0x50]
	xor	%g5,	%o6,	%i7
	sth	%o2,	[%l7 + 0x52]
	fabsd	%f0,	%f10
	sdivcc	%o7,	0x1A9D,	%i6
	ld	[%l7 + 0x18],	%f2
	sll	%l1,	%i4,	%o0
	andcc	%g3,	0x07C8,	%g2
	stx	%o5,	[%l7 + 0x18]
	fmovspos	%icc,	%f15,	%f21
	array16	%g4,	%l6,	%g7
	ldd	[%l7 + 0x08],	%i0
	stb	%l0,	[%l7 + 0x1B]
	edge8n	%o3,	%l5,	%i3
	fmovrslz	%l4,	%f26,	%f17
	fcmpes	%fcc0,	%f3,	%f7
	andncc	%g6,	%i5,	%g1
	ldsh	[%l7 + 0x40],	%i0
	alignaddrl	%l3,	%i2,	%o4
	subcc	%o1,	0x1E59,	%g5
	array8	%l2,	%i7,	%o6
	ldd	[%l7 + 0x18],	%o2
	smul	%o7,	0x008D,	%i6
	xnorcc	%l1,	%o0,	%i4
	movge	%icc,	%g3,	%o5
	movg	%icc,	%g4,	%l6
	movrlez	%g7,	0x1B5,	%g2
	edge32	%i1,	%l0,	%o3
	edge32n	%i3,	%l5,	%l4
	fmovrdgez	%g6,	%f12,	%f6
	movn	%xcc,	%g1,	%i0
	fmovdl	%icc,	%f9,	%f10
	sth	%l3,	[%l7 + 0x7E]
	movl	%xcc,	%i5,	%o4
	fcmpgt16	%f30,	%f24,	%i2
	movvc	%icc,	%g5,	%o1
	popc	%i7,	%o6
	smul	%o2,	%l2,	%o7
	fmul8x16al	%f31,	%f27,	%f14
	siam	0x1
	movleu	%xcc,	%l1,	%i6
	srax	%o0,	%i4,	%g3
	fnor	%f4,	%f20,	%f4
	sethi	0x0327,	%g4
	fcmpeq16	%f12,	%f4,	%o5
	fxnor	%f0,	%f8,	%f0
	movl	%icc,	%l6,	%g2
	fmovrslez	%i1,	%f23,	%f31
	fmovsgu	%icc,	%f9,	%f4
	edge32ln	%g7,	%l0,	%i3
	fpsub32	%f18,	%f10,	%f30
	addc	%l5,	%o3,	%l4
	udiv	%g1,	0x1DB0,	%g6
	sll	%l3,	0x17,	%i5
	and	%o4,	0x05F9,	%i2
	fpmerge	%f29,	%f13,	%f6
	fmovdl	%xcc,	%f20,	%f4
	orcc	%g5,	0x1C17,	%o1
	sdiv	%i0,	0x1546,	%i7
	fsrc2s	%f11,	%f28
	fmovsvc	%xcc,	%f12,	%f29
	fors	%f2,	%f26,	%f13
	umulcc	%o6,	0x01C4,	%l2
	fmovrde	%o7,	%f16,	%f18
	xorcc	%l1,	0x19B0,	%i6
	ldsh	[%l7 + 0x52],	%o2
	movcs	%xcc,	%o0,	%i4
	andncc	%g4,	%g3,	%o5
	move	%xcc,	%g2,	%i1
	edge16l	%l6,	%g7,	%i3
	subcc	%l5,	%o3,	%l4
	fandnot1s	%f28,	%f12,	%f11
	xnor	%g1,	0x10FA,	%l0
	srlx	%g6,	0x05,	%l3
	edge32ln	%i5,	%o4,	%g5
	ld	[%l7 + 0x58],	%f19
	movrlz	%o1,	0x191,	%i2
	udiv	%i7,	0x04CA,	%o6
	andn	%i0,	%l2,	%o7
	fmovsvs	%icc,	%f7,	%f13
	fornot2	%f8,	%f10,	%f28
	smulcc	%i6,	%l1,	%o0
	orcc	%o2,	0x199C,	%g4
	srl	%i4,	%o5,	%g3
	srlx	%g2,	0x18,	%l6
	fmul8x16al	%f26,	%f1,	%f16
	fmovrdne	%g7,	%f8,	%f14
	ldsb	[%l7 + 0x3E],	%i3
	sllx	%i1,	0x05,	%l5
	siam	0x2
	fmovspos	%xcc,	%f31,	%f26
	mova	%icc,	%o3,	%l4
	movg	%icc,	%l0,	%g6
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	stw	%o4,	[%l7 + 0x1C]
	edge32n	%o1,	%i2,	%i7
	edge16n	%g5,	%i0,	%l2
	fxnors	%f6,	%f21,	%f31
	fmovdg	%xcc,	%f13,	%f28
	edge16ln	%o7,	%o6,	%l1
	fmul8x16al	%f9,	%f11,	%f30
	lduh	[%l7 + 0x6E],	%i6
	fpsub16	%f6,	%f18,	%f16
	save %o0, 0x18E2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f18,	%f6
	array32	%o2,	%i4,	%g3
	sub	%o5,	0x12E0,	%l6
	movne	%xcc,	%g2,	%g7
	movpos	%icc,	%i1,	%l5
	sllx	%o3,	0x0B,	%i3
	addcc	%l0,	%g6,	%l3
	sdiv	%i5,	0x13F5,	%g1
	alignaddrl	%o4,	%l4,	%o1
	or	%i2,	0x058D,	%g5
	movgu	%icc,	%i0,	%l2
	addccc	%i7,	%o7,	%l1
	ldd	[%l7 + 0x78],	%i6
	edge32ln	%o6,	%g4,	%o0
	edge32n	%i4,	%g3,	%o2
	addccc	%o5,	%l6,	%g2
	and	%g7,	%l5,	%o3
	sethi	0x1209,	%i1
	ldub	[%l7 + 0x62],	%i3
	fmovdgu	%icc,	%f29,	%f8
	addc	%l0,	%g6,	%l3
	movrlz	%i5,	%g1,	%l4
	andcc	%o1,	%o4,	%g5
	fmovrslz	%i0,	%f26,	%f28
	xor	%l2,	%i7,	%i2
	edge16	%l1,	%o7,	%i6
	fmovdne	%xcc,	%f30,	%f20
	fnot2s	%f24,	%f13
	array32	%g4,	%o0,	%o6
	st	%f6,	[%l7 + 0x14]
	movneg	%icc,	%g3,	%i4
	ldd	[%l7 + 0x50],	%f22
	sllx	%o2,	0x1C,	%l6
	movn	%icc,	%g2,	%g7
	umulcc	%o5,	%o3,	%i1
	movne	%icc,	%i3,	%l5
	alignaddr	%g6,	%l0,	%l3
	movpos	%xcc,	%i5,	%g1
	fpadd32	%f16,	%f18,	%f20
	smulcc	%o1,	%o4,	%l4
	restore %g5, 0x040B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x76, %i5
	ldsh	[%l7 + %i5],	%i7
	edge16ln	%i0,	%l1,	%i2
	st	%f9,	[%l7 + 0x44]
	movvs	%icc,	%o7,	%i6
	ldd	[%l7 + 0x48],	%o0
	nop
	set	0x58, %o5
	ldsw	[%l7 + %o5],	%o6
	movleu	%xcc,	%g3,	%g4
	subccc	%i4,	%l6,	%g2
	movn	%icc,	%g7,	%o5
	movrgz	%o2,	0x25C,	%i1
	smulcc	%i3,	%l5,	%g6
	edge8n	%o3,	%l3,	%l0
	addcc	%i5,	0x05CC,	%g1
	fmovdvs	%xcc,	%f0,	%f21
	fands	%f1,	%f19,	%f12
	smulcc	%o4,	%o1,	%l4
	move	%xcc,	%g5,	%i7
	orcc	%i0,	0x1D4C,	%l2
	fcmpne16	%f10,	%f24,	%l1
	orn	%o7,	0x0437,	%i2
	fmul8x16al	%f19,	%f0,	%f26
	addccc	%o0,	0x0799,	%o6
	sdivx	%i6,	0x0943,	%g3
	ld	[%l7 + 0x70],	%f1
	stb	%g4,	[%l7 + 0x19]
	andncc	%i4,	%l6,	%g2
	sdivx	%g7,	0x12C2,	%o2
	movrne	%o5,	0x24D,	%i3
	array16	%l5,	%g6,	%o3
	orcc	%l3,	%i1,	%i5
	movne	%icc,	%g1,	%o4
	orncc	%o1,	0x0ADC,	%l4
	orcc	%g5,	%i7,	%l0
	array8	%i0,	%l2,	%l1
	fornot1s	%f5,	%f14,	%f29
	edge16l	%o7,	%i2,	%o0
	edge32l	%o6,	%i6,	%g4
	umul	%i4,	%l6,	%g3
	fcmpd	%fcc3,	%f10,	%f14
	srl	%g2,	%g7,	%o5
	movrgz	%o2,	0x053,	%i3
	sethi	0x1782,	%l5
	mulx	%g6,	0x142D,	%o3
	movrlz	%l3,	0x051,	%i1
	and	%g1,	0x1EA3,	%i5
	fabsd	%f20,	%f22
	faligndata	%f2,	%f14,	%f16
	mulscc	%o4,	0x1E04,	%o1
	fmovscc	%xcc,	%f9,	%f6
	xorcc	%g5,	0x17C5,	%i7
	movgu	%xcc,	%l4,	%i0
	udivx	%l0,	0x0FB1,	%l2
	lduh	[%l7 + 0x7A],	%l1
	edge32n	%i2,	%o0,	%o6
	edge8n	%i6,	%o7,	%g4
	lduw	[%l7 + 0x30],	%i4
	ldub	[%l7 + 0x0B],	%g3
	ldsb	[%l7 + 0x1B],	%l6
	stx	%g7,	[%l7 + 0x50]
	ldsw	[%l7 + 0x4C],	%o5
	subccc	%o2,	0x002F,	%i3
	siam	0x7
	ldsh	[%l7 + 0x7C],	%g2
	popc	%l5,	%g6
	fpack16	%f20,	%f7
	fmovdcs	%xcc,	%f13,	%f12
	edge16n	%l3,	%i1,	%g1
	addcc	%o3,	0x1EFF,	%o4
	edge8	%o1,	%g5,	%i5
	fmuld8ulx16	%f10,	%f2,	%f24
	movl	%xcc,	%i7,	%i0
	srl	%l0,	0x0C,	%l4
	andcc	%l1,	0x03B6,	%l2
	fmovsne	%xcc,	%f26,	%f21
	subcc	%i2,	0x1567,	%o0
	edge32ln	%i6,	%o7,	%g4
	sllx	%i4,	%g3,	%o6
	addccc	%g7,	0x033A,	%l6
	fnot1	%f16,	%f24
	movre	%o5,	%o2,	%i3
	fmovs	%f29,	%f14
	array32	%l5,	%g6,	%l3
	fmovsvc	%icc,	%f20,	%f27
	fpmerge	%f31,	%f7,	%f10
	srax	%g2,	%g1,	%o3
	fmovrdlz	%i1,	%f30,	%f0
	orcc	%o4,	0x10C5,	%g5
	movge	%icc,	%o1,	%i5
	fmul8ulx16	%f14,	%f16,	%f24
	xor	%i7,	0x0485,	%i0
	fmul8x16al	%f20,	%f30,	%f16
	fmovrdne	%l0,	%f26,	%f10
	movle	%icc,	%l4,	%l2
	fcmpeq32	%f24,	%f28,	%l1
	movneg	%icc,	%o0,	%i6
	fmovdgu	%icc,	%f13,	%f14
	fmovsl	%icc,	%f19,	%f21
	movrlez	%i2,	0x321,	%g4
	edge8n	%o7,	%i4,	%o6
	fand	%f30,	%f18,	%f8
	sdiv	%g3,	0x1F73,	%l6
	edge32n	%g7,	%o5,	%i3
	umulcc	%o2,	0x0993,	%g6
	ld	[%l7 + 0x4C],	%f26
	fpackfix	%f24,	%f22
	ld	[%l7 + 0x30],	%f5
	fmovrse	%l5,	%f23,	%f21
	addccc	%g2,	0x01B9,	%g1
	fpadd16s	%f22,	%f7,	%f15
	ldsh	[%l7 + 0x32],	%o3
	movcc	%xcc,	%l3,	%o4
	movn	%xcc,	%i1,	%g5
	nop
	set	0x5C, %l1
	lduw	[%l7 + %l1],	%i5
	fnegd	%f0,	%f26
	edge32l	%i7,	%i0,	%l0
	fmovscs	%xcc,	%f27,	%f1
	sdivx	%o1,	0x1C31,	%l2
	fmul8x16al	%f27,	%f23,	%f20
	mova	%xcc,	%l1,	%o0
	fcmpes	%fcc3,	%f0,	%f31
	movrlz	%l4,	%i2,	%i6
	movrgez	%o7,	0x363,	%i4
	fnegd	%f0,	%f12
	std	%f8,	[%l7 + 0x70]
	fmovsa	%icc,	%f30,	%f10
	fmovdgu	%xcc,	%f21,	%f12
	edge16n	%g4,	%o6,	%g3
	popc	%l6,	%o5
	sdiv	%i3,	0x1503,	%g7
	subccc	%g6,	0x158B,	%l5
	mova	%icc,	%o2,	%g2
	movg	%xcc,	%o3,	%l3
	subc	%o4,	0x03B1,	%i1
	array32	%g1,	%i5,	%g5
	addccc	%i7,	0x1904,	%l0
	movcs	%icc,	%i0,	%l2
	udivcc	%l1,	0x07FE,	%o1
	movcc	%icc,	%o0,	%l4
	fmovdg	%xcc,	%f21,	%f25
	std	%f22,	[%l7 + 0x08]
	edge16ln	%i2,	%o7,	%i6
	xnor	%g4,	0x1798,	%i4
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	fnot1	%f12,	%f18
	fzeros	%f15
	edge8l	%i3,	%g7,	%g6
	sdiv	%o5,	0x18C2,	%l5
	movleu	%xcc,	%g2,	%o2
	movleu	%xcc,	%o3,	%l3
	addc	%o4,	0x1E41,	%g1
	fpsub16	%f28,	%f22,	%f2
	movrgez	%i1,	0x297,	%g5
	for	%f10,	%f2,	%f16
	movleu	%xcc,	%i7,	%i5
	fmovdle	%xcc,	%f7,	%f25
	fmovdne	%xcc,	%f25,	%f9
	st	%f6,	[%l7 + 0x34]
	subc	%i0,	0x1CBA,	%l0
	movn	%icc,	%l2,	%o1
	movrgez	%l1,	0x1C4,	%l4
	fpadd16	%f26,	%f6,	%f26
	sub	%i2,	%o0,	%o7
	ldub	[%l7 + 0x0F],	%g4
	add	%i6,	%g3,	%i4
	fmovdg	%xcc,	%f6,	%f15
	addc	%o6,	%i3,	%g7
	andn	%g6,	%l6,	%l5
	alignaddr	%o5,	%g2,	%o2
	fcmple16	%f14,	%f0,	%l3
	movn	%icc,	%o3,	%g1
	ld	[%l7 + 0x24],	%f27
	mova	%icc,	%i1,	%o4
	fpack16	%f12,	%f10
	subcc	%i7,	%i5,	%i0
	sth	%l0,	[%l7 + 0x6E]
	edge16l	%l2,	%g5,	%o1
	udiv	%l4,	0x030B,	%l1
	ldub	[%l7 + 0x08],	%i2
	sir	0x1B2C
	mulscc	%o0,	0x05B7,	%o7
	edge16l	%g4,	%g3,	%i6
	sir	0x02E8
	stx	%i4,	[%l7 + 0x38]
	edge8n	%o6,	%i3,	%g7
	array16	%l6,	%l5,	%o5
	fcmpne32	%f12,	%f10,	%g6
	srlx	%o2,	%l3,	%g2
	fpsub16	%f18,	%f10,	%f2
	xnorcc	%g1,	%i1,	%o4
	edge8	%i7,	%i5,	%o3
	sllx	%l0,	0x0B,	%i0
	edge8n	%g5,	%l2,	%l4
	mulscc	%o1,	%l1,	%o0
	ldub	[%l7 + 0x22],	%i2
	fmovsvc	%xcc,	%f2,	%f23
	andcc	%o7,	0x1E8C,	%g3
	array8	%g4,	%i4,	%i6
	array8	%o6,	%g7,	%i3
	udiv	%l5,	0x04CB,	%o5
	movgu	%icc,	%g6,	%o2
	lduw	[%l7 + 0x48],	%l3
	fmovsg	%icc,	%f18,	%f23
	umulcc	%l6,	0x14C9,	%g1
	edge32ln	%i1,	%g2,	%i7
	mulscc	%o4,	%i5,	%o3
	fmovsvc	%xcc,	%f23,	%f17
	addc	%l0,	0x1567,	%i0
	array32	%l2,	%g5,	%l4
	fmovdl	%icc,	%f4,	%f7
	fmovrslez	%o1,	%f20,	%f28
	lduh	[%l7 + 0x12],	%l1
	movrlz	%i2,	0x1F1,	%o7
	fmovsvc	%icc,	%f6,	%f19
	sllx	%g3,	%o0,	%g4
	movrne	%i4,	%i6,	%o6
	smul	%i3,	%g7,	%l5
	mova	%xcc,	%g6,	%o5
	edge8n	%l3,	%o2,	%g1
	xorcc	%i1,	%g2,	%l6
	fmul8x16au	%f30,	%f0,	%f0
	stb	%o4,	[%l7 + 0x2D]
	movcc	%xcc,	%i7,	%o3
	umulcc	%l0,	0x1A60,	%i0
	fnegs	%f25,	%f3
	fmovsvs	%xcc,	%f26,	%f23
	restore %i5, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o1,	%l1,	%i2
	edge8	%o7,	%g3,	%l4
	save %o0, 0x0DAF, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%g4,	%o6
	alignaddrl	%i3,	%i6,	%g7
	add	%l5,	0x11AF,	%o5
	array16	%g6,	%l3,	%g1
	sdivx	%o2,	0x1C3C,	%i1
	alignaddr	%l6,	%g2,	%o4
	sdivx	%o3,	0x0E93,	%l0
	udiv	%i7,	0x050B,	%i5
	stw	%g5,	[%l7 + 0x7C]
	movg	%xcc,	%i0,	%l2
	stx	%o1,	[%l7 + 0x10]
	movrlz	%i2,	%o7,	%g3
	ldub	[%l7 + 0x58],	%l4
	fmul8x16al	%f9,	%f4,	%f4
	andncc	%l1,	%i4,	%g4
	ldub	[%l7 + 0x6C],	%o0
	udivcc	%i3,	0x17E4,	%i6
	lduw	[%l7 + 0x74],	%o6
	umul	%g7,	0x028D,	%o5
	udivcc	%l5,	0x06E0,	%g6
	fornot1	%f10,	%f2,	%f30
	move	%icc,	%l3,	%g1
	for	%f0,	%f20,	%f22
	addcc	%o2,	0x16E6,	%i1
	xor	%g2,	0x01E9,	%l6
	sdivcc	%o4,	0x1D66,	%o3
	sethi	0x06C1,	%l0
	add	%i5,	0x0F76,	%i7
	andcc	%i0,	%g5,	%o1
	for	%f28,	%f22,	%f0
	fand	%f20,	%f8,	%f2
	fandnot2	%f14,	%f4,	%f4
	addcc	%l2,	%i2,	%g3
	sdivcc	%l4,	0x13BF,	%o7
	fmovdne	%xcc,	%f26,	%f0
	movleu	%xcc,	%i4,	%l1
	movpos	%xcc,	%o0,	%g4
	xorcc	%i6,	%i3,	%o6
	nop
	set	0x70, %l0
	ldub	[%l7 + %l0],	%o5
	mulscc	%l5,	%g6,	%l3
	subccc	%g7,	0x1392,	%g1
	srax	%i1,	%o2,	%l6
	ldsh	[%l7 + 0x70],	%g2
	stb	%o3,	[%l7 + 0x24]
	fand	%f2,	%f26,	%f30
	smul	%l0,	%i5,	%o4
	fmovspos	%icc,	%f15,	%f30
	fmovsl	%xcc,	%f12,	%f29
	ldsb	[%l7 + 0x79],	%i7
	movl	%xcc,	%g5,	%o1
	nop
	set	0x70, %o3
	ldsw	[%l7 + %o3],	%i0
	movge	%icc,	%l2,	%i2
	and	%g3,	0x07B1,	%o7
	fmovsne	%xcc,	%f15,	%f9
	fmovrsne	%l4,	%f0,	%f4
	movpos	%xcc,	%i4,	%l1
	xnor	%o0,	0x0818,	%i6
	fpsub32	%f22,	%f10,	%f18
	fpadd16s	%f30,	%f19,	%f3
	alignaddr	%g4,	%i3,	%o5
	edge32ln	%o6,	%g6,	%l3
	edge16	%l5,	%g7,	%g1
	srl	%i1,	%l6,	%o2
	sllx	%g2,	%l0,	%i5
	edge8n	%o4,	%o3,	%g5
	alignaddr	%o1,	%i7,	%i0
	fnands	%f25,	%f23,	%f3
	movneg	%xcc,	%l2,	%i2
	andn	%o7,	0x1D61,	%g3
	ldsh	[%l7 + 0x0C],	%l4
	orncc	%i4,	%o0,	%l1
	sdivx	%i6,	0x0E30,	%g4
	fpsub32	%f4,	%f24,	%f16
	sub	%o5,	0x1099,	%o6
	xorcc	%i3,	0x1D28,	%g6
	addc	%l5,	%g7,	%l3
	fabsd	%f20,	%f28
	array32	%i1,	%l6,	%g1
	edge32n	%g2,	%l0,	%o2
	sll	%o4,	0x00,	%i5
	edge8ln	%o3,	%g5,	%i7
	xnor	%i0,	%l2,	%o1
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	fnor	%f8,	%f4,	%f16
	sllx	%l4,	%g3,	%o0
	edge8n	%l1,	%i4,	%i6
	ldd	[%l7 + 0x58],	%f0
	fcmpd	%fcc1,	%f16,	%f10
	edge32ln	%g4,	%o5,	%o6
	ldub	[%l7 + 0x30],	%g6
	edge8ln	%i3,	%g7,	%l3
	lduh	[%l7 + 0x0C],	%l5
	ldd	[%l7 + 0x58],	%f12
	movn	%icc,	%i1,	%g1
	umul	%l6,	0x1ADF,	%l0
	stx	%g2,	[%l7 + 0x40]
	edge32ln	%o4,	%i5,	%o2
	sdivx	%g5,	0x0417,	%i7
	movg	%icc,	%i0,	%o3
	sdivcc	%l2,	0x0F2E,	%i2
	mova	%xcc,	%o7,	%l4
	addccc	%o1,	%o0,	%g3
	movge	%icc,	%i4,	%i6
	ldsh	[%l7 + 0x0E],	%l1
	alignaddr	%g4,	%o6,	%o5
	fpsub16s	%f15,	%f28,	%f25
	umulcc	%g6,	0x0A41,	%i3
	addc	%g7,	%l5,	%i1
	movrlez	%g1,	0x170,	%l6
	addccc	%l0,	0x065A,	%g2
	and	%o4,	%i5,	%o2
	fmovrsgz	%l3,	%f20,	%f7
	stb	%i7,	[%l7 + 0x32]
	fandnot1s	%f7,	%f13,	%f19
	fmovsneg	%icc,	%f19,	%f17
	sllx	%i0,	%g5,	%o3
	andcc	%l2,	%o7,	%i2
	edge16l	%o1,	%l4,	%o0
	movrgz	%i4,	0x190,	%i6
	edge16n	%l1,	%g4,	%g3
	movrgz	%o6,	%o5,	%g6
	orcc	%g7,	0x090C,	%i3
	array32	%i1,	%l5,	%l6
	xorcc	%g1,	%l0,	%o4
	fnot2s	%f6,	%f25
	alignaddr	%i5,	%g2,	%l3
	addccc	%i7,	%i0,	%g5
	st	%f21,	[%l7 + 0x08]
	andn	%o3,	%o2,	%o7
	alignaddr	%i2,	%o1,	%l2
	movle	%xcc,	%l4,	%i4
	lduw	[%l7 + 0x28],	%i6
	fmovsvc	%icc,	%f0,	%f6
	alignaddrl	%o0,	%g4,	%g3
	stb	%o6,	[%l7 + 0x24]
	popc	0x0D76,	%l1
	fmovrslez	%o5,	%f0,	%f3
	edge16	%g7,	%i3,	%i1
	fcmpeq32	%f4,	%f26,	%l5
	movneg	%xcc,	%l6,	%g1
	sir	0x0A97
	movcc	%icc,	%g6,	%l0
	faligndata	%f14,	%f10,	%f16
	nop
	set	0x54, %i4
	ldsw	[%l7 + %i4],	%i5
	movpos	%xcc,	%o4,	%l3
	fnand	%f0,	%f4,	%f24
	stx	%g2,	[%l7 + 0x28]
	fcmpes	%fcc3,	%f14,	%f29
	fnot2	%f22,	%f28
	movleu	%icc,	%i0,	%g5
	alignaddr	%i7,	%o2,	%o3
	edge16l	%o7,	%o1,	%i2
	fnands	%f17,	%f28,	%f27
	nop
	set	0x38, %i6
	ldx	[%l7 + %i6],	%l4
	sra	%l2,	%i4,	%o0
	smulcc	%g4,	0x0FEA,	%g3
	movneg	%icc,	%o6,	%l1
	ld	[%l7 + 0x38],	%f22
	andcc	%i6,	%g7,	%i3
	edge32ln	%i1,	%o5,	%l6
	fcmple32	%f24,	%f16,	%l5
	fpsub16s	%f17,	%f5,	%f25
	alignaddrl	%g1,	%l0,	%i5
	udiv	%g6,	0x0138,	%l3
	movvc	%icc,	%g2,	%i0
	umulcc	%g5,	0x129A,	%o4
	edge32l	%i7,	%o2,	%o3
	and	%o1,	0x0AC0,	%i2
	edge16	%o7,	%l4,	%l2
	array16	%i4,	%g4,	%o0
	ldub	[%l7 + 0x44],	%g3
	ldx	[%l7 + 0x20],	%l1
	movcs	%xcc,	%i6,	%g7
	mulscc	%i3,	0x02B9,	%i1
	fcmpgt32	%f16,	%f24,	%o5
	alignaddr	%o6,	%l5,	%l6
	movrgez	%l0,	0x0BB,	%g1
	fpsub32	%f26,	%f8,	%f30
	st	%f23,	[%l7 + 0x34]
	fmovdcs	%xcc,	%f15,	%f7
	edge32n	%g6,	%i5,	%g2
	lduw	[%l7 + 0x7C],	%i0
	smulcc	%g5,	0x1914,	%l3
	orcc	%o4,	0x0446,	%o2
	sth	%i7,	[%l7 + 0x4E]
	edge32	%o3,	%i2,	%o1
	array16	%o7,	%l2,	%i4
	mova	%xcc,	%l4,	%g4
	fsrc1	%f24,	%f16
	addcc	%o0,	0x0102,	%g3
	edge16ln	%i6,	%l1,	%g7
	edge8	%i3,	%o5,	%i1
	ldsh	[%l7 + 0x70],	%l5
	movrlz	%o6,	0x07C,	%l0
	edge32ln	%g1,	%l6,	%i5
	edge8l	%g2,	%i0,	%g5
	ldd	[%l7 + 0x10],	%l2
	movle	%icc,	%o4,	%g6
	edge16n	%i7,	%o2,	%i2
	umulcc	%o1,	0x0D81,	%o3
	srl	%l2,	%i4,	%o7
	smul	%l4,	0x1FC3,	%o0
	edge16	%g3,	%i6,	%l1
	fandnot1s	%f26,	%f27,	%f1
	orcc	%g7,	%i3,	%o5
	andcc	%i1,	%g4,	%l5
	xor	%o6,	%g1,	%l0
	movrlez	%l6,	%g2,	%i5
	ldsw	[%l7 + 0x60],	%g5
	fnand	%f22,	%f14,	%f0
	movrlez	%i0,	0x02A,	%o4
	orn	%l3,	%g6,	%o2
	edge16	%i7,	%o1,	%o3
	edge16	%i2,	%i4,	%l2
	st	%f30,	[%l7 + 0x0C]
	xorcc	%l4,	%o7,	%o0
	sub	%i6,	0x0C4D,	%g3
	sub	%l1,	%g7,	%o5
	alignaddrl	%i1,	%g4,	%i3
	fmovsn	%xcc,	%f28,	%f4
	sub	%o6,	0x0132,	%l5
	srlx	%l0,	%l6,	%g1
	edge16l	%i5,	%g2,	%g5
	movvs	%xcc,	%o4,	%l3
	fmovrsne	%i0,	%f8,	%f28
	fmovs	%f9,	%f31
	fandnot1s	%f29,	%f6,	%f14
	fmovrslez	%o2,	%f5,	%f13
	movne	%icc,	%g6,	%o1
	fmovdneg	%icc,	%f24,	%f9
	movrne	%i7,	%i2,	%i4
	umulcc	%o3,	%l4,	%o7
	ldub	[%l7 + 0x59],	%o0
	fpackfix	%f2,	%f4
	ld	[%l7 + 0x6C],	%f24
	stx	%i6,	[%l7 + 0x48]
	fmuld8sux16	%f1,	%f17,	%f2
	for	%f30,	%f30,	%f6
	sth	%g3,	[%l7 + 0x52]
	movne	%icc,	%l1,	%l2
	fmovsa	%icc,	%f19,	%f15
	ldd	[%l7 + 0x78],	%o4
	ldx	[%l7 + 0x30],	%g7
	fmovdl	%icc,	%f15,	%f10
	andncc	%g4,	%i1,	%o6
	movl	%icc,	%l5,	%i3
	xnor	%l6,	0x04C3,	%g1
	fornot1	%f28,	%f16,	%f8
	lduw	[%l7 + 0x48],	%i5
	edge32ln	%g2,	%l0,	%g5
	add	%l3,	0x0165,	%i0
	movl	%xcc,	%o2,	%g6
	edge32l	%o1,	%i7,	%i2
	movvs	%icc,	%o4,	%i4
	alignaddrl	%l4,	%o3,	%o7
	andcc	%i6,	0x109B,	%o0
	fmovsleu	%xcc,	%f26,	%f0
	addcc	%l1,	0x1008,	%l2
	fcmple16	%f10,	%f30,	%o5
	array8	%g3,	%g7,	%i1
	edge32l	%o6,	%g4,	%l5
	movrgz	%i3,	0x3FE,	%l6
	addc	%g1,	0x070E,	%i5
	movcc	%icc,	%g2,	%g5
	fmovdcs	%xcc,	%f6,	%f16
	xnor	%l3,	%l0,	%o2
	fpack32	%f22,	%f0,	%f4
	edge32n	%g6,	%i0,	%o1
	orn	%i2,	%o4,	%i4
	movge	%xcc,	%l4,	%i7
	fandnot1s	%f16,	%f31,	%f26
	udivcc	%o7,	0x0DF5,	%o3
	ldsw	[%l7 + 0x40],	%o0
	sth	%i6,	[%l7 + 0x70]
	fcmpd	%fcc2,	%f12,	%f26
	sethi	0x1696,	%l2
	movne	%xcc,	%l1,	%o5
	edge16n	%g7,	%i1,	%o6
	sub	%g4,	0x1361,	%l5
	and	%i3,	%l6,	%g1
	addccc	%i5,	0x11DB,	%g3
	smul	%g2,	%l3,	%g5
	stb	%l0,	[%l7 + 0x5E]
	movgu	%icc,	%o2,	%i0
	movrgz	%g6,	%i2,	%o4
	umul	%o1,	0x0997,	%l4
	subccc	%i4,	0x0D83,	%i7
	edge32	%o7,	%o0,	%i6
	sethi	0x01CC,	%o3
	orn	%l1,	0x0EFB,	%o5
	xorcc	%l2,	0x1335,	%g7
	std	%f26,	[%l7 + 0x40]
	fmovs	%f29,	%f20
	sth	%i1,	[%l7 + 0x46]
	ldsw	[%l7 + 0x7C],	%g4
	andn	%l5,	0x1CF1,	%i3
	save %l6, %o6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f18,	%f24,	%f2
	edge16ln	%g1,	%g2,	%g3
	subcc	%g5,	0x1C9F,	%l3
	nop
	set	0x54, %g4
	stb	%l0,	[%l7 + %g4]
	lduh	[%l7 + 0x6A],	%o2
	fabsd	%f28,	%f0
	stb	%i0,	[%l7 + 0x1F]
	sll	%i2,	0x08,	%o4
	movge	%icc,	%o1,	%g6
	fnand	%f8,	%f30,	%f20
	fsrc1s	%f25,	%f2
	movrlz	%l4,	%i7,	%i4
	movn	%icc,	%o7,	%o0
	move	%xcc,	%o3,	%i6
	addc	%l1,	0x03B1,	%o5
	orn	%l2,	0x1352,	%i1
	sdivcc	%g4,	0x12E6,	%g7
	stw	%i3,	[%l7 + 0x28]
	movrgez	%l5,	%o6,	%l6
	edge16n	%i5,	%g1,	%g2
	fsrc2s	%f1,	%f25
	fmovdleu	%xcc,	%f4,	%f22
	fmovdleu	%icc,	%f30,	%f27
	fnegs	%f30,	%f7
	std	%f2,	[%l7 + 0x78]
	fsrc2	%f6,	%f24
	restore %g5, 0x030D, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%l3,	%l0
	mulscc	%i0,	0x0FE4,	%o2
	fcmpne32	%f6,	%f4,	%o4
	xnor	%o1,	0x04DD,	%g6
	and	%l4,	%i7,	%i4
	fcmpgt16	%f20,	%f26,	%i2
	or	%o0,	%o3,	%o7
	alignaddrl	%i6,	%o5,	%l2
	subcc	%l1,	%i1,	%g4
	xnor	%g7,	0x0522,	%l5
	fmovsleu	%icc,	%f23,	%f10
	fcmpne32	%f20,	%f2,	%i3
	udivcc	%l6,	0x0C49,	%o6
	movg	%xcc,	%g1,	%i5
	fmovdle	%xcc,	%f21,	%f5
	udivx	%g5,	0x0C6D,	%g2
	fzeros	%f29
	move	%icc,	%l3,	%l0
	edge8l	%i0,	%g3,	%o4
	movg	%xcc,	%o2,	%o1
	movre	%g6,	%i7,	%i4
	std	%f4,	[%l7 + 0x38]
	udivcc	%l4,	0x05A9,	%o0
	array16	%i2,	%o3,	%i6
	fmovsg	%xcc,	%f2,	%f8
	sth	%o7,	[%l7 + 0x5A]
	save %o5, %l1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x48],	%f9
	sdivx	%g4,	0x0A29,	%i1
	orncc	%l5,	0x04C8,	%i3
	fmovd	%f14,	%f28
	array32	%l6,	%g7,	%g1
	mulx	%o6,	0x1D8E,	%g5
	ldd	[%l7 + 0x40],	%f4
	edge8l	%i5,	%l3,	%g2
	sth	%l0,	[%l7 + 0x78]
	edge32l	%i0,	%g3,	%o2
	movrgez	%o4,	0x2D6,	%o1
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	lduh	[%l7 + 0x78],	%i4
	ldd	[%l7 + 0x68],	%o0
	addc	%l4,	%i2,	%i6
	sra	%o3,	%o5,	%l1
	move	%icc,	%o7,	%l2
	fands	%f14,	%f23,	%f2
	edge8ln	%g4,	%i1,	%l5
	movrlz	%l6,	%g7,	%g1
	subc	%o6,	%g5,	%i5
	andcc	%l3,	%g2,	%l0
	movcc	%xcc,	%i3,	%g3
	smulcc	%i0,	0x14C8,	%o4
	sll	%o2,	0x13,	%o1
	fmovdle	%xcc,	%f30,	%f15
	fmovsleu	%xcc,	%f10,	%f0
	andncc	%g6,	%i4,	%i7
	fmovrse	%o0,	%f4,	%f14
	orncc	%l4,	%i6,	%o3
	edge32ln	%o5,	%l1,	%i2
	fmovd	%f30,	%f18
	stx	%o7,	[%l7 + 0x18]
	edge8	%g4,	%i1,	%l5
	fnegd	%f12,	%f18
	stx	%l2,	[%l7 + 0x78]
	edge8	%l6,	%g1,	%o6
	array32	%g5,	%g7,	%l3
	srl	%g2,	%i5,	%l0
	fnor	%f16,	%f26,	%f16
	mulx	%g3,	%i0,	%i3
	edge16n	%o2,	%o1,	%o4
	fmovspos	%xcc,	%f29,	%f30
	edge32ln	%g6,	%i7,	%o0
	fcmps	%fcc0,	%f5,	%f10
	edge16	%i4,	%l4,	%i6
	sub	%o3,	0x0F4F,	%l1
	array8	%i2,	%o7,	%o5
	fmovsvs	%xcc,	%f4,	%f13
	fmovsl	%xcc,	%f22,	%f30
	std	%f12,	[%l7 + 0x58]
	ldsw	[%l7 + 0x24],	%g4
	ld	[%l7 + 0x20],	%f1
	movl	%xcc,	%l5,	%i1
	mulx	%l6,	%l2,	%o6
	fxnor	%f10,	%f16,	%f6
	edge32n	%g1,	%g5,	%g7
	subccc	%g2,	%i5,	%l3
	orn	%l0,	0x176C,	%i0
	orncc	%g3,	%o2,	%o1
	fmuld8ulx16	%f26,	%f18,	%f8
	move	%icc,	%i3,	%g6
	stb	%i7,	[%l7 + 0x56]
	udiv	%o0,	0x0E39,	%o4
	move	%xcc,	%i4,	%l4
	udiv	%o3,	0x13FF,	%l1
	move	%xcc,	%i2,	%o7
	sllx	%o5,	0x0F,	%i6
	fmovrsgez	%l5,	%f21,	%f31
	ldx	[%l7 + 0x20],	%i1
	edge8ln	%g4,	%l6,	%o6
	udivcc	%g1,	0x049E,	%g5
	array8	%l2,	%g7,	%g2
	udivcc	%l3,	0x17BC,	%i5
	movge	%xcc,	%i0,	%g3
	mulscc	%o2,	0x1468,	%o1
	movpos	%xcc,	%l0,	%i3
	movvs	%icc,	%i7,	%g6
	edge8n	%o0,	%i4,	%l4
	fmovrdgz	%o3,	%f12,	%f10
	movpos	%icc,	%o4,	%l1
	edge16n	%o7,	%i2,	%i6
	mova	%icc,	%o5,	%l5
	array32	%i1,	%l6,	%g4
	edge16l	%o6,	%g5,	%g1
	st	%f19,	[%l7 + 0x28]
	andcc	%l2,	0x08C4,	%g2
	mulscc	%l3,	%i5,	%i0
	movre	%g3,	%o2,	%o1
	addc	%l0,	0x1613,	%g7
	smulcc	%i7,	0x19D9,	%g6
	ldsb	[%l7 + 0x3B],	%o0
	and	%i3,	%l4,	%i4
	edge32ln	%o4,	%o3,	%l1
	edge32l	%o7,	%i2,	%o5
	fmul8x16al	%f22,	%f22,	%f0
	subc	%i6,	%i1,	%l5
	ldub	[%l7 + 0x3E],	%g4
	smulcc	%o6,	%g5,	%l6
	edge16ln	%g1,	%l2,	%g2
	stx	%l3,	[%l7 + 0x50]
	sub	%i5,	0x0B98,	%g3
	srax	%o2,	0x1A,	%i0
	std	%f26,	[%l7 + 0x58]
	fmovrslez	%l0,	%f4,	%f6
	sdivcc	%g7,	0x0730,	%i7
	andcc	%g6,	%o0,	%o1
	movleu	%xcc,	%i3,	%i4
	movvc	%xcc,	%l4,	%o4
	andn	%l1,	0x1833,	%o7
	ldsb	[%l7 + 0x7A],	%i2
	lduh	[%l7 + 0x78],	%o3
	movg	%icc,	%o5,	%i6
	fpack16	%f20,	%f31
	fmovdvs	%icc,	%f11,	%f30
	movleu	%xcc,	%l5,	%i1
	fcmped	%fcc1,	%f16,	%f0
	xnorcc	%o6,	0x0CC9,	%g5
	fsrc2s	%f14,	%f11
	sdiv	%g4,	0x0224,	%g1
	edge32	%l6,	%g2,	%l2
	fabss	%f10,	%f9
	srlx	%l3,	0x10,	%i5
	udivcc	%g3,	0x05D5,	%o2
	fsrc2	%f30,	%f6
	fcmpd	%fcc0,	%f10,	%f4
	movvc	%xcc,	%i0,	%g7
	subc	%l0,	%i7,	%g6
	movl	%icc,	%o0,	%i3
	edge16ln	%i4,	%o1,	%l4
	save %l1, 0x0059, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%o3,	%o5
	subc	%i6,	%i2,	%i1
	orncc	%l5,	%o6,	%g4
	add	%g5,	0x0CC7,	%g1
	movne	%icc,	%l6,	%g2
	fmovse	%icc,	%f5,	%f15
	stx	%l3,	[%l7 + 0x38]
	fmovsle	%icc,	%f4,	%f25
	movneg	%xcc,	%i5,	%l2
	subccc	%g3,	%o2,	%i0
	movre	%l0,	%i7,	%g6
	edge8n	%o0,	%i3,	%i4
	fsrc1	%f6,	%f30
	mulx	%o1,	0x1EAE,	%l4
	orn	%g7,	%l1,	%o7
	movle	%xcc,	%o3,	%o5
	or	%o4,	0x06DE,	%i6
	udivcc	%i1,	0x0ACD,	%l5
	fmul8x16au	%f10,	%f29,	%f2
	edge32	%i2,	%o6,	%g5
	orcc	%g1,	0x1784,	%g4
	movcc	%icc,	%g2,	%l6
	movcs	%icc,	%i5,	%l3
	sub	%l2,	%g3,	%i0
	bshuffle	%f4,	%f2,	%f2
	fmovdge	%xcc,	%f17,	%f12
	movleu	%xcc,	%o2,	%i7
	fmul8x16al	%f5,	%f2,	%f10
	xnor	%l0,	%g6,	%i3
	fmovda	%icc,	%f0,	%f1
	ldub	[%l7 + 0x41],	%i4
	fmovrslez	%o0,	%f29,	%f7
	sethi	0x12B1,	%o1
	edge32ln	%g7,	%l4,	%o7
	movrlez	%l1,	0x2BB,	%o5
	mulscc	%o4,	0x0D10,	%i6
	fsrc2s	%f26,	%f23
	sth	%i1,	[%l7 + 0x7A]
	movl	%xcc,	%o3,	%l5
	orncc	%o6,	%i2,	%g1
	xor	%g4,	%g2,	%g5
	siam	0x5
	movne	%icc,	%l6,	%i5
	sdivx	%l2,	0x0740,	%g3
	sra	%l3,	%i0,	%i7
	subccc	%o2,	0x1EEA,	%l0
	std	%f12,	[%l7 + 0x38]
	add	%g6,	0x1422,	%i3
	fornot1s	%f10,	%f8,	%f2
	edge32n	%i4,	%o1,	%g7
	save %l4, 0x160F, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l1,	%o5,	%o7
	srax	%i6,	0x1D,	%o4
	edge32l	%i1,	%l5,	%o6
	fpack32	%f30,	%f0,	%f20
	fmul8ulx16	%f24,	%f26,	%f26
	edge16	%i2,	%g1,	%g4
	std	%f8,	[%l7 + 0x60]
	edge32	%g2,	%o3,	%g5
	fmovdl	%icc,	%f22,	%f4
	fmovrdgz	%i5,	%f8,	%f0
	ldd	[%l7 + 0x50],	%l2
	edge32l	%l6,	%g3,	%i0
	movgu	%xcc,	%i7,	%l3
	movneg	%xcc,	%o2,	%l0
	sll	%g6,	0x1B,	%i4
	save %i3, %o1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l4,	0x0EB,	%l1
	edge16	%o5,	%o7,	%i6
	andcc	%o4,	0x1AD2,	%o0
	movrgez	%l5,	0x32E,	%i1
	srlx	%o6,	%g1,	%g4
	save %i2, 0x18C4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g5,	%i5,	%g2
	ldx	[%l7 + 0x58],	%l2
	andncc	%l6,	%g3,	%i0
	movle	%xcc,	%l3,	%o2
	ld	[%l7 + 0x74],	%f17
	or	%i7,	0x044A,	%l0
	fzero	%f14
	andncc	%i4,	%g6,	%o1
	array16	%g7,	%l4,	%i3
	fmovrsgz	%l1,	%f25,	%f18
	fmovrslez	%o5,	%f16,	%f31
	for	%f8,	%f16,	%f20
	movle	%xcc,	%o7,	%o4
	edge8ln	%i6,	%o0,	%l5
	fcmpgt16	%f20,	%f18,	%i1
	edge32l	%o6,	%g1,	%g4
	stw	%i2,	[%l7 + 0x0C]
	orncc	%o3,	%i5,	%g2
	nop
	set	0x66, %i3
	ldsb	[%l7 + %i3],	%g5
	ldsw	[%l7 + 0x64],	%l6
	edge32n	%g3,	%i0,	%l3
	movgu	%icc,	%o2,	%l2
	lduw	[%l7 + 0x24],	%i7
	xnor	%i4,	0x150F,	%l0
	lduh	[%l7 + 0x28],	%g6
	subc	%g7,	%o1,	%i3
	fmovrdne	%l1,	%f20,	%f0
	lduh	[%l7 + 0x1E],	%l4
	and	%o5,	%o7,	%o4
	sra	%i6,	0x0F,	%l5
	edge32n	%i1,	%o6,	%o0
	edge8l	%g1,	%g4,	%o3
	movvc	%icc,	%i5,	%i2
	nop
	set	0x30, %i2
	std	%f0,	[%l7 + %i2]
	movl	%icc,	%g5,	%l6
	fnand	%f6,	%f18,	%f6
	array32	%g2,	%i0,	%g3
	movvs	%icc,	%o2,	%l2
	sethi	0x1CFE,	%l3
	fandnot2s	%f29,	%f21,	%f2
	movcs	%xcc,	%i7,	%i4
	fones	%f14
	ldd	[%l7 + 0x20],	%f2
	movrlz	%g6,	%l0,	%o1
	alignaddrl	%i3,	%g7,	%l1
	smulcc	%l4,	0x0343,	%o5
	popc	%o4,	%o7
	srl	%l5,	0x1B,	%i6
	ldsh	[%l7 + 0x38],	%i1
	alignaddr	%o0,	%g1,	%g4
	restore %o3, %o6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f27,	%f7,	%f1
	udivcc	%i2,	0x15BB,	%g5
	addccc	%l6,	%i0,	%g3
	subcc	%g2,	0x1D00,	%l2
	fmovsleu	%icc,	%f26,	%f19
	movrlz	%o2,	0x30C,	%l3
	ld	[%l7 + 0x08],	%f7
	st	%f20,	[%l7 + 0x3C]
	ldub	[%l7 + 0x2C],	%i7
	faligndata	%f8,	%f30,	%f30
	fmul8x16	%f1,	%f24,	%f20
	movrgez	%i4,	%l0,	%g6
	sdivcc	%i3,	0x0210,	%o1
	mova	%icc,	%l1,	%l4
	orncc	%o5,	%g7,	%o4
	alignaddrl	%o7,	%l5,	%i6
	fmovrslz	%o0,	%f3,	%f22
	edge8l	%i1,	%g1,	%g4
	fmovrdgz	%o6,	%f12,	%f4
	mova	%icc,	%i5,	%o3
	movrne	%i2,	0x1FD,	%g5
	sllx	%l6,	%g3,	%g2
	subccc	%i0,	0x1CC3,	%o2
	fmovrdne	%l3,	%f18,	%f6
	nop
	set	0x30, %g2
	stw	%i7,	[%l7 + %g2]
	movcc	%xcc,	%l2,	%i4
	fornot1	%f14,	%f4,	%f6
	sdivx	%g6,	0x0147,	%l0
	srl	%o1,	0x0A,	%i3
	andn	%l1,	%l4,	%o5
	addccc	%g7,	0x1E12,	%o4
	fmovsn	%icc,	%f26,	%f4
	fmovsleu	%xcc,	%f2,	%f9
	edge32	%l5,	%o7,	%o0
	movrne	%i6,	0x277,	%g1
	sllx	%g4,	0x0A,	%i1
	andcc	%o6,	%i5,	%o3
	array16	%g5,	%l6,	%g3
	nop
	set	0x6C, %g6
	ldsw	[%l7 + %g6],	%i2
	addc	%i0,	0x11E3,	%o2
	smul	%g2,	0x1119,	%i7
	fcmpne16	%f10,	%f14,	%l2
	movl	%xcc,	%i4,	%l3
	lduw	[%l7 + 0x4C],	%l0
	addccc	%o1,	0x1EBE,	%i3
	movge	%icc,	%g6,	%l1
	srlx	%l4,	%g7,	%o4
	udivx	%l5,	0x01DC,	%o5
	subcc	%o0,	%o7,	%i6
	st	%f23,	[%l7 + 0x28]
	lduh	[%l7 + 0x50],	%g1
	subc	%i1,	0x0BC1,	%g4
	or	%i5,	%o6,	%g5
	addc	%o3,	%g3,	%i2
	srlx	%l6,	0x18,	%i0
	fmovrsgez	%o2,	%f9,	%f28
	fcmpeq32	%f6,	%f0,	%i7
	andn	%l2,	0x1D83,	%g2
	srl	%l3,	%l0,	%o1
	fornot1s	%f17,	%f31,	%f13
	st	%f1,	[%l7 + 0x58]
	popc	0x181B,	%i3
	movpos	%xcc,	%i4,	%g6
	movrlez	%l1,	%l4,	%g7
	std	%f12,	[%l7 + 0x60]
	ldd	[%l7 + 0x08],	%f0
	move	%xcc,	%o4,	%l5
	fmovrslez	%o5,	%f16,	%f0
	srl	%o0,	%i6,	%g1
	xnor	%o7,	0x1EC7,	%i1
	ldsh	[%l7 + 0x70],	%g4
	array32	%i5,	%o6,	%o3
	fabsd	%f24,	%f10
	movvc	%xcc,	%g5,	%i2
	sra	%g3,	0x14,	%l6
	fmovde	%xcc,	%f21,	%f12
	subc	%i0,	0x0517,	%i7
	movrgez	%o2,	0x2C9,	%l2
	fmovrdlez	%g2,	%f2,	%f8
	umulcc	%l0,	0x11FF,	%o1
	movvc	%icc,	%i3,	%i4
	mulx	%l3,	0x07E8,	%g6
	sdiv	%l1,	0x1020,	%g7
	mulscc	%l4,	%l5,	%o5
	std	%f12,	[%l7 + 0x28]
	edge8l	%o4,	%o0,	%i6
	movpos	%xcc,	%g1,	%o7
	movrgez	%g4,	%i5,	%i1
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	fand	%f10,	%f24,	%f30
	movvs	%icc,	%g5,	%g3
	edge16ln	%i2,	%l6,	%i7
	edge32n	%o2,	%l2,	%i0
	lduw	[%l7 + 0x14],	%l0
	movg	%icc,	%o1,	%g2
	fmovsl	%xcc,	%f15,	%f17
	srl	%i4,	%i3,	%l3
	udiv	%g6,	0x1473,	%l1
	andcc	%g7,	%l5,	%o5
	fandnot2	%f0,	%f26,	%f2
	sdiv	%l4,	0x19AB,	%o0
	sra	%i6,	0x1D,	%g1
	edge8l	%o4,	%g4,	%i5
	edge16n	%i1,	%o6,	%o7
	sethi	0x0AF5,	%g5
	fcmpeq32	%f10,	%f0,	%o3
	movl	%icc,	%g3,	%i2
	fmuld8ulx16	%f24,	%f5,	%f20
	xnor	%i7,	%l6,	%o2
	fcmpes	%fcc2,	%f24,	%f31
	fones	%f9
	addc	%l2,	%i0,	%l0
	sir	0x001C
	fornot2	%f2,	%f18,	%f26
	add	%g2,	%o1,	%i4
	fmovrsgz	%l3,	%f10,	%f31
	orncc	%g6,	%l1,	%g7
	fmovd	%f4,	%f6
	mulx	%i3,	0x0136,	%l5
	fcmpgt16	%f30,	%f24,	%l4
	stw	%o0,	[%l7 + 0x0C]
	sdivx	%i6,	0x095C,	%g1
	xorcc	%o5,	%o4,	%i5
	movne	%icc,	%g4,	%o6
	edge8n	%o7,	%g5,	%i1
	fmovdge	%xcc,	%f20,	%f17
	smul	%g3,	0x18D3,	%o3
	orcc	%i7,	%l6,	%o2
	stw	%l2,	[%l7 + 0x40]
	xor	%i2,	0x0B39,	%l0
	fpmerge	%f11,	%f21,	%f22
	nop
	set	0x28, %o2
	std	%f4,	[%l7 + %o2]
	edge16l	%i0,	%g2,	%i4
	edge32l	%l3,	%o1,	%l1
	fsrc1s	%f27,	%f11
	udivx	%g7,	0x0DC2,	%g6
	edge16l	%l5,	%i3,	%l4
	orcc	%i6,	0x1EA6,	%o0
	fmovsg	%icc,	%f8,	%f25
	lduw	[%l7 + 0x6C],	%o5
	fzero	%f4
	fsrc2s	%f2,	%f0
	nop
	set	0x50, %g1
	std	%f6,	[%l7 + %g1]
	nop
	set	0x2C, %l5
	stw	%o4,	[%l7 + %l5]
	movcc	%icc,	%g1,	%i5
	stw	%g4,	[%l7 + 0x50]
	movleu	%icc,	%o7,	%g5
	mulscc	%i1,	0x0FFB,	%o6
	sub	%o3,	%i7,	%l6
	udivx	%g3,	0x0849,	%l2
	xnor	%i2,	%l0,	%i0
	smulcc	%g2,	%o2,	%l3
	movre	%i4,	0x127,	%l1
	movcc	%xcc,	%o1,	%g6
	srax	%l5,	%g7,	%l4
	ldx	[%l7 + 0x20],	%i6
	movrlez	%i3,	0x3CD,	%o0
	ldub	[%l7 + 0x17],	%o4
	fmovsl	%xcc,	%f16,	%f9
	srlx	%g1,	%o5,	%g4
	sll	%i5,	%o7,	%i1
	fmovrdlez	%o6,	%f28,	%f26
	lduw	[%l7 + 0x78],	%o3
	array16	%g5,	%l6,	%i7
	ldx	[%l7 + 0x20],	%g3
	edge8n	%i2,	%l0,	%l2
	fmovsle	%xcc,	%f1,	%f28
	subccc	%i0,	0x04D0,	%g2
	movn	%xcc,	%o2,	%i4
	edge16	%l3,	%o1,	%g6
	movvc	%xcc,	%l5,	%l1
	orncc	%l4,	%g7,	%i3
	edge32ln	%i6,	%o4,	%o0
	edge8n	%g1,	%g4,	%i5
	sub	%o7,	0x0950,	%o5
	andncc	%i1,	%o3,	%o6
	movrlz	%l6,	%g5,	%i7
	movge	%icc,	%i2,	%g3
	ldsb	[%l7 + 0x1E],	%l2
	fmovde	%xcc,	%f0,	%f15
	movn	%icc,	%l0,	%g2
	movl	%xcc,	%o2,	%i4
	fpsub32	%f24,	%f12,	%f4
	edge32ln	%i0,	%l3,	%g6
	fmovrdlez	%o1,	%f12,	%f20
	edge32l	%l1,	%l4,	%l5
	xnor	%i3,	0x02F5,	%i6
	mova	%xcc,	%o4,	%o0
	mulscc	%g1,	0x10C8,	%g7
	fmovrdlez	%g4,	%f26,	%f6
	stw	%o7,	[%l7 + 0x44]
	movcc	%xcc,	%i5,	%i1
	xnorcc	%o5,	%o3,	%o6
	move	%xcc,	%g5,	%l6
	sir	0x1641
	xnor	%i2,	0x11FE,	%g3
	fmovrsgz	%l2,	%f17,	%f10
	andn	%i7,	%l0,	%g2
	st	%f22,	[%l7 + 0x34]
	alignaddrl	%i4,	%o2,	%i0
	or	%l3,	0x141B,	%g6
	fmovsvc	%xcc,	%f22,	%f2
	lduw	[%l7 + 0x58],	%o1
	subccc	%l4,	%l1,	%i3
	edge8ln	%i6,	%o4,	%o0
	movrgez	%g1,	%l5,	%g4
	fmovsn	%icc,	%f17,	%f8
	fmul8x16al	%f23,	%f29,	%f22
	movg	%icc,	%g7,	%o7
	umulcc	%i1,	%i5,	%o3
	movne	%icc,	%o6,	%o5
	movleu	%icc,	%l6,	%i2
	lduh	[%l7 + 0x2A],	%g5
	edge8	%g3,	%i7,	%l2
	fsrc1s	%f5,	%f22
	restore %g2, %i4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o2,	0x06F2,	%i0
	movgu	%icc,	%l3,	%g6
	fpsub32	%f16,	%f26,	%f8
	edge8l	%l4,	%o1,	%l1
	ldsw	[%l7 + 0x54],	%i3
	ld	[%l7 + 0x60],	%f25
	alignaddrl	%i6,	%o4,	%o0
	lduw	[%l7 + 0x1C],	%l5
	ldd	[%l7 + 0x70],	%f24
	fcmps	%fcc0,	%f30,	%f27
	fmul8x16	%f10,	%f8,	%f10
	fxor	%f24,	%f18,	%f6
	fornot1s	%f5,	%f14,	%f25
	edge8ln	%g1,	%g7,	%o7
	andncc	%g4,	%i5,	%o3
	udivx	%i1,	0x0388,	%o6
	edge16	%l6,	%i2,	%g5
	ldx	[%l7 + 0x68],	%g3
	edge32ln	%o5,	%l2,	%g2
	ldd	[%l7 + 0x58],	%f26
	smul	%i4,	0x0AB3,	%i7
	fmovrslez	%o2,	%f10,	%f6
	and	%i0,	0x1966,	%l0
	movpos	%icc,	%l3,	%l4
	fmovrsgz	%o1,	%f16,	%f5
	sdivcc	%l1,	0x1B47,	%i3
	movl	%xcc,	%g6,	%o4
	edge8n	%i6,	%o0,	%g1
	fpsub32	%f22,	%f18,	%f10
	ldsb	[%l7 + 0x2C],	%g7
	xor	%o7,	0x122B,	%l5
	ldsw	[%l7 + 0x1C],	%g4
	orn	%o3,	0x1CE1,	%i5
	edge16ln	%o6,	%l6,	%i1
	fmovrdlz	%g5,	%f8,	%f16
	save %i2, 0x11FD, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g3,	%g2,	%l2
	ldx	[%l7 + 0x60],	%i4
	smulcc	%i7,	0x17B8,	%o2
	nop
	set	0x20, %l3
	stx	%l0,	[%l7 + %l3]
	edge32n	%l3,	%i0,	%o1
	edge8	%l4,	%i3,	%g6
	nop
	set	0x64, %l2
	stw	%o4,	[%l7 + %l2]
	xorcc	%i6,	%o0,	%g1
	alignaddrl	%g7,	%o7,	%l1
	move	%icc,	%l5,	%g4
	movcc	%xcc,	%o3,	%o6
	ldsw	[%l7 + 0x6C],	%l6
	fpsub32s	%f29,	%f21,	%f1
	orcc	%i1,	%g5,	%i5
	movn	%icc,	%o5,	%g3
	ldd	[%l7 + 0x78],	%f8
	edge16	%i2,	%l2,	%i4
	edge32l	%i7,	%g2,	%l0
	and	%o2,	%l3,	%i0
	sdiv	%o1,	0x1BF4,	%i3
	fmovscc	%xcc,	%f19,	%f8
	edge16	%g6,	%o4,	%l4
	fmovde	%icc,	%f11,	%f29
	lduh	[%l7 + 0x44],	%i6
	edge32n	%g1,	%o0,	%o7
	movrgz	%l1,	0x1A4,	%l5
	movrlez	%g7,	%g4,	%o3
	subc	%l6,	%o6,	%i1
	xor	%i5,	%g5,	%o5
	udiv	%g3,	0x0A3E,	%l2
	fand	%f14,	%f12,	%f28
	sra	%i2,	0x0D,	%i4
	movrgz	%g2,	0x2F0,	%l0
	addc	%o2,	0x1CAE,	%i7
	and	%i0,	0x0791,	%l3
	move	%icc,	%i3,	%g6
	umul	%o4,	%o1,	%i6
	sethi	0x0396,	%l4
	std	%f14,	[%l7 + 0x30]
	orncc	%o0,	%g1,	%l1
	xnorcc	%o7,	0x1BB8,	%g7
	fmovrse	%l5,	%f28,	%f27
	fpack32	%f20,	%f12,	%f30
	smul	%o3,	%g4,	%o6
	movn	%xcc,	%i1,	%i5
	edge8ln	%l6,	%o5,	%g3
	xorcc	%l2,	%g5,	%i4
	bshuffle	%f22,	%f28,	%f26
	udivcc	%g2,	0x0175,	%l0
	lduw	[%l7 + 0x60],	%o2
	edge8	%i7,	%i0,	%l3
	fmovsgu	%xcc,	%f11,	%f1
	edge16l	%i3,	%i2,	%o4
	umulcc	%g6,	0x0AD3,	%o1
	movg	%xcc,	%i6,	%o0
	movrgez	%g1,	%l1,	%o7
	movvc	%xcc,	%g7,	%l4
	fmovsne	%xcc,	%f30,	%f15
	movgu	%icc,	%l5,	%g4
	mulscc	%o6,	%i1,	%i5
	stw	%o3,	[%l7 + 0x54]
	fmovdg	%xcc,	%f4,	%f22
	fmovrdgz	%l6,	%f8,	%f26
	fmovrsgz	%g3,	%f22,	%f8
	fmovdpos	%xcc,	%f4,	%f15
	fpack16	%f14,	%f13
	fpmerge	%f8,	%f2,	%f18
	fnegs	%f14,	%f15
	fmul8x16	%f18,	%f10,	%f20
	pdist	%f16,	%f4,	%f0
	std	%f14,	[%l7 + 0x30]
	movpos	%xcc,	%o5,	%g5
	stb	%l2,	[%l7 + 0x79]
	sir	0x1F12
	fcmpes	%fcc1,	%f17,	%f6
	andcc	%g2,	%l0,	%o2
	nop
	set	0x74, %i0
	ldsw	[%l7 + %i0],	%i7
	edge16n	%i4,	%i0,	%l3
	faligndata	%f30,	%f14,	%f28
	xnorcc	%i2,	0x0802,	%o4
	fornot2s	%f29,	%f27,	%f3
	array16	%i3,	%o1,	%i6
	subccc	%g6,	%g1,	%l1
	movcc	%icc,	%o7,	%o0
	xorcc	%l4,	%l5,	%g4
	andcc	%o6,	0x1770,	%i1
	addc	%g7,	0x0985,	%o3
	movrgez	%l6,	%i5,	%o5
	smulcc	%g3,	0x00F0,	%l2
	fmovdvs	%icc,	%f5,	%f16
	subc	%g2,	%g5,	%o2
	movrlez	%i7,	0x087,	%l0
	edge16l	%i0,	%l3,	%i2
	sra	%o4,	%i4,	%i3
	andncc	%i6,	%o1,	%g1
	array32	%l1,	%g6,	%o0
	mulscc	%l4,	%l5,	%o7
	fmul8x16	%f6,	%f8,	%f0
	andncc	%o6,	%g4,	%i1
	fandnot1s	%f11,	%f18,	%f31
	alignaddr	%o3,	%l6,	%i5
	srax	%g7,	%o5,	%g3
	edge8n	%g2,	%l2,	%o2
	subcc	%i7,	%g5,	%l0
	smul	%l3,	0x1E43,	%i0
	subcc	%i2,	0x09E9,	%o4
	movvc	%icc,	%i4,	%i6
	edge8	%i3,	%g1,	%l1
	umulcc	%o1,	0x1F60,	%o0
	movn	%xcc,	%l4,	%l5
	ldsh	[%l7 + 0x7A],	%g6
	fmovrslz	%o7,	%f28,	%f7
	fmovde	%icc,	%f18,	%f21
	save %g4, 0x07A1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o3,	%f22,	%f10
	fsrc1	%f8,	%f0
	xnorcc	%l6,	%i1,	%i5
	edge32n	%g7,	%o5,	%g2
	addccc	%g3,	0x0DEA,	%l2
	xor	%i7,	%g5,	%o2
	movle	%xcc,	%l3,	%l0
	stb	%i2,	[%l7 + 0x51]
	sir	0x0192
	ldx	[%l7 + 0x38],	%i0
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	fands	%f11,	%f22,	%f4
	udiv	%o4,	0x1606,	%g1
	xorcc	%i3,	%l1,	%o1
	edge32ln	%o0,	%l5,	%l4
	std	%f2,	[%l7 + 0x48]
	ldx	[%l7 + 0x28],	%o7
	mova	%xcc,	%g4,	%o6
	stw	%o3,	[%l7 + 0x48]
	edge32ln	%g6,	%l6,	%i5
	fandnot2	%f22,	%f22,	%f0
	movgu	%xcc,	%g7,	%i1
	fmovrdlz	%o5,	%f0,	%f16
	srl	%g3,	%g2,	%i7
	movrgez	%l2,	%g5,	%o2
	ldsh	[%l7 + 0x6E],	%l3
	ldsb	[%l7 + 0x11],	%l0
	array16	%i2,	%i0,	%i4
	edge16ln	%o4,	%i6,	%g1
	ldd	[%l7 + 0x38],	%f20
	srl	%i3,	%l1,	%o1
	movrgez	%l5,	%l4,	%o7
	edge32n	%o0,	%o6,	%o3
	movg	%icc,	%g6,	%g4
	movge	%xcc,	%i5,	%g7
	ldd	[%l7 + 0x78],	%f14
	movpos	%xcc,	%l6,	%i1
	mulx	%g3,	0x19A4,	%o5
	movg	%icc,	%i7,	%g2
	xnor	%g5,	0x0C4E,	%l2
	mulx	%o2,	%l3,	%i2
	fand	%f4,	%f4,	%f6
	fpadd32s	%f10,	%f17,	%f29
	edge32n	%i0,	%l0,	%o4
	xor	%i6,	%i4,	%g1
	restore %i3, %l1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l5,	0x025,	%l4
	mulx	%o0,	%o6,	%o7
	edge8l	%g6,	%o3,	%g4
	addcc	%g7,	%l6,	%i1
	fcmpeq32	%f10,	%f8,	%i5
	subc	%g3,	%o5,	%i7
	fpadd32s	%f27,	%f14,	%f1
	fnor	%f12,	%f26,	%f30
	xnor	%g5,	%g2,	%o2
	fmovdg	%icc,	%f4,	%f14
	sra	%l3,	%l2,	%i2
	stb	%l0,	[%l7 + 0x3B]
	sllx	%i0,	%o4,	%i6
	movne	%icc,	%i4,	%g1
	andncc	%i3,	%o1,	%l1
	movpos	%xcc,	%l4,	%o0
	movvc	%icc,	%l5,	%o7
	fmovdcs	%icc,	%f6,	%f18
	umulcc	%o6,	0x1151,	%o3
	fabss	%f9,	%f29
	fmovdcc	%icc,	%f24,	%f27
	orcc	%g6,	%g7,	%l6
	fabsd	%f2,	%f22
	array32	%g4,	%i1,	%i5
	addc	%o5,	%i7,	%g3
	movleu	%icc,	%g2,	%o2
	ldx	[%l7 + 0x30],	%l3
	move	%icc,	%g5,	%i2
	movrne	%l2,	%i0,	%l0
	stx	%i6,	[%l7 + 0x18]
	array32	%o4,	%g1,	%i3
	lduh	[%l7 + 0x0C],	%i4
	sdivcc	%l1,	0x0963,	%l4
	popc	0x18C8,	%o0
	movrne	%o1,	0x086,	%l5
	umul	%o7,	0x1BD0,	%o3
	fpsub32s	%f16,	%f31,	%f17
	movleu	%xcc,	%o6,	%g6
	fxors	%f30,	%f16,	%f24
	lduh	[%l7 + 0x46],	%g7
	andncc	%g4,	%i1,	%i5
	edge16l	%o5,	%l6,	%i7
	mulscc	%g3,	%o2,	%l3
	fpsub16s	%f5,	%f12,	%f11
	fpsub16	%f6,	%f16,	%f20
	fmovdl	%xcc,	%f12,	%f30
	edge8	%g2,	%g5,	%i2
	mova	%icc,	%i0,	%l2
	movre	%i6,	%o4,	%l0
	nop
	set	0x5C, %i7
	stw	%i3,	[%l7 + %i7]
	orn	%i4,	0x1185,	%g1
	popc	0x08F3,	%l4
	save %l1, %o0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o1,	%o7
	and	%o3,	0x01D0,	%o6
	fcmpes	%fcc2,	%f4,	%f2
	for	%f12,	%f18,	%f8
	edge32n	%g7,	%g6,	%g4
	fmovs	%f9,	%f16
	mulx	%i1,	%i5,	%l6
	mova	%xcc,	%i7,	%o5
	lduw	[%l7 + 0x24],	%o2
	array8	%g3,	%g2,	%l3
	umul	%g5,	%i0,	%l2
	fandnot2s	%f15,	%f22,	%f15
	alignaddr	%i2,	%o4,	%i6
	fmul8ulx16	%f8,	%f10,	%f28
	movcs	%xcc,	%l0,	%i4
	ld	[%l7 + 0x4C],	%f12
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	restore %g1, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o1,	0x0726,	%o7
	movcs	%icc,	%l5,	%o3
	movl	%xcc,	%o6,	%g6
	fmovse	%xcc,	%f26,	%f27
	fmuld8sux16	%f29,	%f23,	%f2
	save %g7, %i1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f8,	%f2,	%f30
	nop
	set	0x24, %g3
	stw	%i5,	[%l7 + %g3]
	edge8n	%l6,	%o5,	%i7
	fmovsge	%icc,	%f15,	%f4
	bshuffle	%f14,	%f24,	%f14
	move	%icc,	%o2,	%g2
	bshuffle	%f24,	%f28,	%f8
	movge	%icc,	%l3,	%g5
	fabss	%f11,	%f0
	fcmpgt16	%f22,	%f26,	%i0
	udiv	%g3,	0x0207,	%i2
	movg	%icc,	%l2,	%o4
	and	%l0,	0x07B1,	%i4
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	array8	%g1,	%l1,	%o1
	array8	%o7,	%l5,	%o3
	orcc	%o6,	%g6,	%o0
	andncc	%i1,	%g4,	%g7
	orncc	%l6,	0x164F,	%o5
	fsrc1	%f24,	%f12
	edge16ln	%i7,	%o2,	%i5
	sdivx	%l3,	0x0BFD,	%g5
	array8	%g2,	%i0,	%i2
	fmovrslez	%l2,	%f17,	%f1
	fnot1s	%f0,	%f9
	orn	%o4,	0x13CC,	%g3
	edge32ln	%l0,	%i4,	%i3
	srl	%i6,	%l4,	%l1
	edge32	%o1,	%g1,	%l5
	movrgz	%o7,	%o6,	%g6
	smul	%o3,	%i1,	%g4
	fcmpne16	%f30,	%f12,	%g7
	addc	%l6,	%o5,	%o0
	edge8	%o2,	%i5,	%i7
	lduw	[%l7 + 0x64],	%g5
	for	%f0,	%f16,	%f2
	ldd	[%l7 + 0x50],	%f2
	fmovdleu	%xcc,	%f23,	%f14
	edge8ln	%l3,	%g2,	%i0
	fmovrslez	%i2,	%f20,	%f1
	fornot1s	%f27,	%f21,	%f28
	udivcc	%l2,	0x17A6,	%o4
	fmovdle	%xcc,	%f29,	%f6
	std	%f26,	[%l7 + 0x08]
	fmovdgu	%icc,	%f5,	%f29
	fexpand	%f9,	%f30
	movrgez	%l0,	%g3,	%i3
	movl	%icc,	%i4,	%l4
	alignaddrl	%i6,	%l1,	%g1
	sdiv	%l5,	0x1D8A,	%o1
	add	%o7,	%o6,	%g6
	fmovrslez	%o3,	%f18,	%f17
	save %g4, %g7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o5,	%l6
	fcmpd	%fcc2,	%f0,	%f0
	addc	%o2,	%i5,	%o0
	fmul8x16al	%f31,	%f25,	%f0
	fpack32	%f2,	%f18,	%f8
	fxnor	%f0,	%f4,	%f30
	sdivx	%i7,	0x009B,	%g5
	movl	%icc,	%l3,	%g2
	edge8n	%i2,	%i0,	%o4
	movl	%icc,	%l2,	%l0
	popc	%i3,	%g3
	edge32ln	%i4,	%l4,	%i6
	orncc	%g1,	%l1,	%o1
	edge32	%o7,	%o6,	%l5
	movrgz	%g6,	%g4,	%g7
	movrgz	%o3,	%i1,	%o5
	srl	%l6,	%i5,	%o0
	andncc	%i7,	%g5,	%o2
	umulcc	%l3,	0x15B9,	%i2
	mulx	%i0,	0x064C,	%o4
	fone	%f18
	edge16n	%l2,	%g2,	%l0
	orn	%i3,	0x1AF7,	%g3
	mova	%xcc,	%l4,	%i4
	fones	%f2
	srax	%i6,	0x07,	%l1
	orncc	%o1,	%o7,	%o6
	fone	%f8
	movl	%xcc,	%l5,	%g1
	edge32ln	%g4,	%g6,	%g7
	or	%i1,	%o5,	%o3
	fmovdcc	%xcc,	%f31,	%f7
	fmovsn	%icc,	%f3,	%f21
	fmovsle	%xcc,	%f12,	%f7
	restore %l6, 0x061B, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i7,	%g5,	%o2
	srl	%l3,	%o0,	%i0
	edge32l	%o4,	%i2,	%g2
	edge16n	%l0,	%l2,	%i3
	srax	%l4,	0x1E,	%i4
	stw	%i6,	[%l7 + 0x50]
	lduw	[%l7 + 0x38],	%l1
	fmovrdgz	%o1,	%f22,	%f0
	fmovdvc	%icc,	%f4,	%f13
	sethi	0x0766,	%g3
	movge	%icc,	%o7,	%o6
	movgu	%icc,	%g1,	%l5
	lduw	[%l7 + 0x50],	%g6
	andn	%g4,	%g7,	%i1
	movcs	%icc,	%o5,	%l6
	nop
	set	0x40, %o0
	std	%f28,	[%l7 + %o0]
	sra	%o3,	%i5,	%g5
	alignaddrl	%o2,	%i7,	%o0
	movcs	%icc,	%i0,	%o4
	fabsd	%f2,	%f2
	edge16n	%l3,	%g2,	%l0
	sdivcc	%i2,	0x1F93,	%i3
	addccc	%l4,	0x16DB,	%i4
	sth	%l2,	[%l7 + 0x40]
	fnand	%f20,	%f22,	%f2
	ldsw	[%l7 + 0x24],	%l1
	fandnot1s	%f30,	%f1,	%f4
	umulcc	%o1,	0x00D7,	%g3
	lduw	[%l7 + 0x08],	%o7
	edge16n	%i6,	%o6,	%l5
	std	%f2,	[%l7 + 0x18]
	fpackfix	%f22,	%f27
	edge8l	%g1,	%g4,	%g6
	fmovdvc	%xcc,	%f9,	%f23
	array8	%g7,	%o5,	%l6
	addccc	%i1,	0x1744,	%o3
	fnand	%f4,	%f12,	%f28
	orcc	%g5,	%i5,	%o2
	save %i7, %o0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%i0,	%l3
	subccc	%l0,	0x1DBB,	%i2
	xor	%g2,	0x0524,	%l4
	srax	%i3,	%i4,	%l2
	sir	0x0F0E
	movvc	%icc,	%o1,	%g3
	ldub	[%l7 + 0x1C],	%l1
	edge32ln	%i6,	%o6,	%o7
	fnot2s	%f21,	%f12
	movrlz	%l5,	0x22D,	%g1
	fmovdcs	%icc,	%f17,	%f18
	stx	%g4,	[%l7 + 0x78]
	movrgez	%g6,	%o5,	%g7
	movle	%xcc,	%i1,	%l6
	mova	%icc,	%g5,	%o3
	edge16ln	%i5,	%i7,	%o2
	ldd	[%l7 + 0x58],	%f18
	edge32ln	%o4,	%o0,	%l3
	and	%i0,	%l0,	%i2
	orcc	%l4,	0x1EA4,	%g2
	andcc	%i3,	0x1068,	%i4
	ldsh	[%l7 + 0x3C],	%l2
	fmovsa	%icc,	%f25,	%f28
	array16	%o1,	%g3,	%i6
	subccc	%o6,	0x18DA,	%l1
	fxor	%f14,	%f24,	%f26
	fxnors	%f25,	%f13,	%f3
	srl	%o7,	%l5,	%g4
	ldd	[%l7 + 0x38],	%g6
	fmovrde	%o5,	%f18,	%f18
	sdivx	%g7,	0x1153,	%g1
	stw	%l6,	[%l7 + 0x64]
	edge8ln	%g5,	%i1,	%i5
	edge16n	%o3,	%o2,	%i7
	array16	%o4,	%l3,	%i0
	umulcc	%o0,	0x00F3,	%l0
	sll	%l4,	%g2,	%i2
	movn	%xcc,	%i4,	%i3
	umulcc	%l2,	0x1432,	%g3
	sdiv	%i6,	0x03F6,	%o6
	movvs	%icc,	%o1,	%o7
	alignaddr	%l1,	%g4,	%l5
	fmovspos	%icc,	%f27,	%f24
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	movcc	%xcc,	%g7,	%g1
	sub	%g5,	%i1,	%l6
	mulscc	%i5,	0x0E42,	%o2
	addcc	%o3,	%o4,	%i7
	movge	%icc,	%i0,	%l3
	fpackfix	%f14,	%f24
	fabsd	%f16,	%f24
	movrne	%o0,	0x0E6,	%l4
	mulx	%l0,	%g2,	%i4
	edge32n	%i2,	%l2,	%i3
	mova	%xcc,	%i6,	%o6
	edge8n	%o1,	%g3,	%l1
	ldsw	[%l7 + 0x64],	%o7
	nop
	set	0x10, %g5
	ldx	[%l7 + %g5],	%g4
	fpsub32s	%f30,	%f20,	%f26
	edge16ln	%o5,	%g6,	%l5
	srl	%g1,	0x16,	%g5
	sra	%i1,	0x01,	%l6
	udiv	%g7,	0x0D09,	%i5
	fcmps	%fcc0,	%f3,	%f29
	ld	[%l7 + 0x3C],	%f3
	movn	%icc,	%o3,	%o4
	xnorcc	%o2,	%i0,	%i7
	movge	%xcc,	%o0,	%l4
	xor	%l0,	%l3,	%i4
	sdivx	%g2,	0x1732,	%l2
	fmovsgu	%xcc,	%f19,	%f29
	movrgez	%i2,	0x07D,	%i3
	edge16	%i6,	%o6,	%g3
	fpack16	%f18,	%f24
	fmovscs	%xcc,	%f20,	%f15
	udiv	%o1,	0x0DD9,	%l1
	movrgez	%o7,	0x159,	%o5
	fmovsg	%icc,	%f5,	%f17
	fmovsgu	%xcc,	%f18,	%f4
	movn	%xcc,	%g6,	%g4
	fmuld8sux16	%f13,	%f13,	%f20
	subccc	%l5,	0x14F1,	%g5
	fcmpne16	%f24,	%f8,	%i1
	mulx	%g1,	%g7,	%i5
	ld	[%l7 + 0x50],	%f26
	movre	%o3,	0x288,	%o4
	udivcc	%o2,	0x1526,	%l6
	subc	%i7,	0x1F71,	%o0
	udivx	%l4,	0x15F5,	%i0
	fnegd	%f28,	%f4
	sll	%l0,	0x06,	%l3
	fmovdvc	%xcc,	%f16,	%f9
	movle	%icc,	%g2,	%i4
	edge16ln	%l2,	%i2,	%i3
	fmovdleu	%xcc,	%f30,	%f27
	nop
	set	0x30, %i1
	stx	%i6,	[%l7 + %i1]
	addc	%o6,	0x112A,	%g3
	umulcc	%o1,	0x075F,	%l1
	ldd	[%l7 + 0x50],	%o6
	movvs	%xcc,	%g6,	%g4
	fmuld8ulx16	%f12,	%f27,	%f28
	lduw	[%l7 + 0x2C],	%l5
	array32	%g5,	%o5,	%i1
	mulx	%g1,	0x16A8,	%g7
	fcmpne16	%f10,	%f0,	%i5
	edge32	%o4,	%o2,	%o3
	ldsh	[%l7 + 0x46],	%i7
	xor	%l6,	0x080B,	%o0
	fmovrslz	%i0,	%f18,	%f0
	andn	%l0,	%l4,	%l3
	edge16l	%i4,	%g2,	%l2
	edge16ln	%i3,	%i2,	%o6
	edge32	%i6,	%g3,	%o1
	fmovsl	%xcc,	%f25,	%f12
	movre	%l1,	%g6,	%o7
	fpsub16	%f8,	%f28,	%f18
	ldsb	[%l7 + 0x0C],	%g4
	edge8l	%g5,	%l5,	%o5
	fmovrdlz	%i1,	%f14,	%f20
	movle	%xcc,	%g7,	%i5
	sethi	0x10BB,	%o4
	movgu	%icc,	%o2,	%g1
	sdiv	%i7,	0x0642,	%o3
	fmovsge	%xcc,	%f1,	%f8
	movrne	%l6,	%o0,	%l0
	faligndata	%f2,	%f24,	%f30
	subc	%l4,	%l3,	%i4
	fnot1	%f4,	%f8
	smul	%g2,	%l2,	%i3
	fmovdl	%icc,	%f7,	%f11
	stb	%i0,	[%l7 + 0x32]
	fmul8x16au	%f1,	%f15,	%f0
	mulx	%o6,	%i6,	%i2
	xor	%g3,	0x1DD5,	%o1
	fpsub16s	%f31,	%f3,	%f14
	udivx	%g6,	0x10DD,	%o7
	edge16n	%l1,	%g4,	%l5
	edge16l	%g5,	%o5,	%g7
	movg	%icc,	%i5,	%o4
	stw	%o2,	[%l7 + 0x5C]
	xor	%g1,	0x0961,	%i1
	for	%f14,	%f24,	%f12
	alignaddrl	%i7,	%o3,	%l6
	fpadd32	%f26,	%f30,	%f4
	sdiv	%l0,	0x1F90,	%o0
	stx	%l4,	[%l7 + 0x18]
	fpackfix	%f22,	%f12
	movl	%icc,	%l3,	%i4
	fpack32	%f10,	%f12,	%f4
	addc	%l2,	%g2,	%i0
	srl	%o6,	0x0A,	%i3
	udiv	%i6,	0x1CA6,	%g3
	fmovrsgz	%i2,	%f2,	%f29
	sth	%g6,	[%l7 + 0x52]
	movrlz	%o1,	%l1,	%o7
	lduh	[%l7 + 0x4C],	%l5
	udiv	%g4,	0x1766,	%o5
	edge8	%g7,	%g5,	%o4
	addcc	%i5,	0x1BFB,	%o2
	andncc	%g1,	%i7,	%o3
	udiv	%l6,	0x0A85,	%i1
	movge	%xcc,	%l0,	%l4
	movrgez	%l3,	%o0,	%i4
	movvc	%xcc,	%l2,	%g2
	smulcc	%i0,	0x17F4,	%o6
	movrgez	%i3,	0x1C3,	%g3
	edge16l	%i2,	%g6,	%o1
	fpsub16s	%f29,	%f22,	%f27
	movleu	%icc,	%l1,	%o7
	and	%i6,	0x0C44,	%g4
	orncc	%o5,	%g7,	%g5
	xor	%o4,	%l5,	%o2
	popc	0x0487,	%i5
	fandnot1	%f12,	%f6,	%f14
	sra	%i7,	%g1,	%l6
	std	%f24,	[%l7 + 0x10]
	movn	%icc,	%i1,	%o3
	mulscc	%l0,	%l4,	%o0
	movrgez	%i4,	0x2FE,	%l3
	xnor	%g2,	%i0,	%l2
	fmovspos	%icc,	%f5,	%f25
	fnot1	%f30,	%f26
	fandnot2s	%f2,	%f2,	%f14
	srlx	%i3,	0x0E,	%g3
	fmovrslez	%o6,	%f17,	%f30
	edge32	%i2,	%o1,	%g6
	subcc	%l1,	%o7,	%i6
	fabss	%f10,	%f26
	ldd	[%l7 + 0x20],	%g4
	lduw	[%l7 + 0x64],	%g7
	st	%f7,	[%l7 + 0x40]
	smul	%o5,	0x0FF8,	%g5
	edge32	%l5,	%o4,	%i5
	alignaddr	%i7,	%g1,	%l6
	move	%xcc,	%o2,	%i1
	and	%l0,	%o3,	%l4
	movl	%icc,	%o0,	%i4
	movleu	%icc,	%g2,	%l3
	ldsw	[%l7 + 0x0C],	%l2
	movge	%xcc,	%i3,	%g3
	subccc	%o6,	0x11CB,	%i2
	fmovsa	%icc,	%f29,	%f12
	andcc	%o1,	%i0,	%l1
	ldd	[%l7 + 0x30],	%g6
	alignaddr	%o7,	%i6,	%g7
	udivcc	%o5,	0x1013,	%g4
	add	%g5,	%o4,	%i5
	edge16ln	%i7,	%g1,	%l5
	fcmped	%fcc3,	%f8,	%f0
	bshuffle	%f26,	%f8,	%f8
	xorcc	%l6,	%o2,	%l0
	movleu	%xcc,	%i1,	%l4
	fmovsleu	%icc,	%f17,	%f1
	fcmpeq32	%f18,	%f0,	%o0
	movgu	%xcc,	%i4,	%o3
	subccc	%g2,	%l3,	%i3
	edge8l	%g3,	%o6,	%l2
	fmovsleu	%icc,	%f14,	%f31
	movrlez	%o1,	0x295,	%i0
	nop
	set	0x28, %o6
	ldd	[%l7 + %o6],	%l0
	sth	%g6,	[%l7 + 0x6E]
	sdivx	%i2,	0x02D7,	%i6
	array32	%o7,	%g7,	%o5
	sir	0x0973
	movleu	%xcc,	%g5,	%o4
	fandnot2s	%f29,	%f21,	%f15
	edge16	%i5,	%i7,	%g1
	edge16n	%l5,	%g4,	%o2
	ldsh	[%l7 + 0x62],	%l6
	movne	%icc,	%l0,	%i1
	fmovsleu	%icc,	%f29,	%f14
	save %o0, 0x0A44, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l4,	%g2,	%l3
	add	%o3,	%g3,	%o6
	fnor	%f10,	%f28,	%f24
	fcmpgt16	%f4,	%f14,	%i3
	fxnors	%f26,	%f28,	%f26
	edge16n	%l2,	%o1,	%i0
	udivx	%l1,	0x1721,	%i2
	fnegs	%f1,	%f14
	addcc	%i6,	0x1140,	%g6
	sethi	0x0664,	%o7
	fmovrdlez	%g7,	%f6,	%f18
	fmovdvc	%icc,	%f19,	%f17
	pdist	%f24,	%f4,	%f2
	movvc	%icc,	%g5,	%o5
	save %i5, 0x05AB, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g1,	%i7,	%g4
	andcc	%o2,	0x0845,	%l6
	movcs	%icc,	%l0,	%i1
	fabsd	%f30,	%f4
	restore %l5, %o0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x68],	%f28
	edge16l	%g2,	%l3,	%o3
	movneg	%icc,	%g3,	%o6
	addccc	%i3,	0x0494,	%i4
	movrgz	%l2,	%i0,	%o1
	alignaddr	%i2,	%l1,	%g6
	sdivx	%i6,	0x12F9,	%o7
	fmovdvs	%icc,	%f8,	%f5
	xor	%g5,	0x1FB6,	%g7
	movrgez	%o5,	0x369,	%o4
	ldsh	[%l7 + 0x2A],	%g1
	movcc	%xcc,	%i7,	%g4
	sethi	0x0A97,	%o2
	fmovdge	%icc,	%f19,	%f14
	xorcc	%l6,	0x0BA0,	%i5
	subcc	%l0,	0x13D3,	%l5
	array8	%o0,	%l4,	%i1
	and	%l3,	0x0413,	%g2
	fcmpd	%fcc0,	%f0,	%f6
	lduh	[%l7 + 0x28],	%g3
	alignaddrl	%o3,	%o6,	%i4
	movneg	%xcc,	%i3,	%i0
	ldub	[%l7 + 0x50],	%l2
	movvs	%icc,	%o1,	%l1
	add	%g6,	0x1CFE,	%i6
	mulx	%i2,	0x0928,	%o7
	ldsh	[%l7 + 0x54],	%g5
	movne	%icc,	%o5,	%o4
	ldd	[%l7 + 0x50],	%g0
	andn	%g7,	%i7,	%g4
	move	%icc,	%o2,	%i5
	mova	%icc,	%l6,	%l0
	sdivcc	%o0,	0x1AA9,	%l5
	move	%icc,	%i1,	%l4
	fcmpne32	%f10,	%f4,	%l3
	sra	%g2,	%o3,	%o6
	movvs	%icc,	%i4,	%i3
	fcmped	%fcc2,	%f28,	%f28
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	subc	%o1,	0x0715,	%g6
	edge8ln	%l1,	%i6,	%i2
	ldub	[%l7 + 0x61],	%o7
	movvc	%icc,	%g5,	%o5
	fmovdleu	%xcc,	%f17,	%f8
	sllx	%o4,	%g1,	%g7
	movcs	%icc,	%g4,	%o2
	movpos	%icc,	%i5,	%l6
	movrlz	%i7,	%o0,	%l5
	sethi	0x16D2,	%i1
	mulscc	%l4,	0x1990,	%l3
	movvc	%xcc,	%g2,	%o3
	add	%l0,	0x0C36,	%o6
	sethi	0x14F9,	%i4
	sdivx	%i3,	0x1C11,	%g3
	ldsh	[%l7 + 0x3A],	%i0
	alignaddr	%l2,	%o1,	%g6
	movpos	%xcc,	%i6,	%l1
	save %i2, 0x1A9E, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o5,	%o4,	%g5
	alignaddr	%g7,	%g4,	%g1
	subc	%i5,	%l6,	%o2
	fnot2	%f16,	%f18
	alignaddrl	%i7,	%o0,	%l5
	mova	%xcc,	%i1,	%l4
	stw	%g2,	[%l7 + 0x3C]
	sllx	%o3,	0x03,	%l3
	mulx	%l0,	%o6,	%i4
	fpsub32	%f6,	%f12,	%f2
	subc	%g3,	%i3,	%i0
	movge	%icc,	%o1,	%g6
	edge8n	%i6,	%l1,	%l2
	fornot2s	%f11,	%f5,	%f2
	add	%i2,	%o5,	%o7
	andn	%o4,	0x1762,	%g7
	fabsd	%f14,	%f18
	fmul8x16al	%f22,	%f0,	%f30
	movrlz	%g4,	0x3F3,	%g5
	sra	%i5,	%l6,	%g1
	movrlez	%i7,	0x10D,	%o0
	edge8	%l5,	%o2,	%l4
	popc	0x1FB9,	%g2
	edge8ln	%i1,	%l3,	%l0
	movrlez	%o6,	0x2E9,	%i4
	xnor	%o3,	0x0424,	%i3
	movvs	%xcc,	%g3,	%i0
	orn	%o1,	0x00E1,	%i6
	fmul8x16	%f16,	%f26,	%f20
	sth	%g6,	[%l7 + 0x7A]
	movge	%icc,	%l2,	%i2
	movg	%icc,	%o5,	%l1
	fpsub32s	%f19,	%f28,	%f19
	add	%o7,	0x1F29,	%g7
	ldsh	[%l7 + 0x6A],	%g4
	fands	%f13,	%f29,	%f19
	restore %g5, 0x181F, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o4,	%g1,	%l6
	fandnot1s	%f8,	%f16,	%f26
	udiv	%i7,	0x1F9C,	%l5
	movvc	%xcc,	%o2,	%o0
	move	%xcc,	%l4,	%i1
	udivcc	%l3,	0x1A29,	%g2
	fmovd	%f14,	%f0
	ldsh	[%l7 + 0x44],	%l0
	ldx	[%l7 + 0x48],	%o6
	std	%f10,	[%l7 + 0x60]
	or	%o3,	%i3,	%g3
	array32	%i4,	%i0,	%o1
	udiv	%i6,	0x1961,	%l2
	movleu	%xcc,	%g6,	%o5
	fmuld8sux16	%f14,	%f1,	%f2
	movl	%xcc,	%i2,	%o7
	edge16l	%g7,	%g4,	%l1
	edge16l	%g5,	%i5,	%g1
	sll	%o4,	%i7,	%l6
	array8	%l5,	%o2,	%o0
	ldx	[%l7 + 0x60],	%i1
	addccc	%l4,	%g2,	%l3
	sir	0x1F77
	movcc	%xcc,	%o6,	%l0
	edge8n	%o3,	%g3,	%i3
	srlx	%i0,	0x03,	%o1
	movneg	%xcc,	%i4,	%l2
	lduw	[%l7 + 0x70],	%g6
	edge8ln	%i6,	%o5,	%i2
	sethi	0x1486,	%g7
	lduh	[%l7 + 0x7A],	%o7
	movrlz	%l1,	0x2A1,	%g4
	ldub	[%l7 + 0x6B],	%g5
	smulcc	%i5,	%o4,	%g1
	movleu	%xcc,	%i7,	%l6
	fmovrdne	%l5,	%f2,	%f20
	fmovscs	%xcc,	%f14,	%f17
	movn	%icc,	%o2,	%i1
	edge16n	%o0,	%g2,	%l3
	fcmpgt16	%f24,	%f20,	%o6
	edge16l	%l0,	%l4,	%o3
	movpos	%xcc,	%i3,	%i0
	stx	%o1,	[%l7 + 0x78]
	ldx	[%l7 + 0x48],	%g3
	sra	%i4,	%g6,	%l2
	alignaddr	%o5,	%i2,	%i6
	ldd	[%l7 + 0x68],	%f2
	orn	%o7,	0x11A5,	%l1
	udivcc	%g4,	0x0863,	%g5
	movne	%icc,	%i5,	%o4
	sllx	%g1,	%i7,	%l6
	subccc	%l5,	0x10A8,	%g7
	andncc	%o2,	%i1,	%g2
	save %l3, 0x06CC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f10,	%f18
	andn	%o0,	%l0,	%o3
	movvs	%icc,	%i3,	%i0
	edge8	%o1,	%g3,	%i4
	edge8n	%l4,	%g6,	%o5
	edge16ln	%i2,	%l2,	%i6
	mulscc	%l1,	0x1F71,	%o7
	std	%f2,	[%l7 + 0x08]
	sethi	0x0494,	%g5
	mulscc	%g4,	%o4,	%g1
	movn	%xcc,	%i5,	%l6
	edge32n	%l5,	%g7,	%i7
	movre	%i1,	%g2,	%o2
	fmovsgu	%icc,	%f16,	%f1
	movre	%o6,	0x37D,	%o0
	addc	%l3,	%l0,	%i3
	fmul8x16au	%f8,	%f10,	%f16
	nop
	set	0x44, %o7
	stb	%i0,	[%l7 + %o7]
	edge16	%o3,	%g3,	%i4
	movvs	%xcc,	%o1,	%g6
	edge16n	%o5,	%l4,	%l2
	fmovdgu	%icc,	%f23,	%f5
	fcmpeq16	%f26,	%f2,	%i2
	fmovdvc	%xcc,	%f7,	%f3
	movge	%icc,	%i6,	%o7
	fmovdleu	%xcc,	%f15,	%f13
	ldx	[%l7 + 0x08],	%l1
	movleu	%xcc,	%g5,	%o4
	subc	%g1,	%g4,	%l6
	xnor	%l5,	0x0DCA,	%g7
	sdivx	%i7,	0x1473,	%i5
	ldd	[%l7 + 0x20],	%i0
	sra	%g2,	0x08,	%o6
	mulx	%o2,	0x10FF,	%o0
	movrlez	%l3,	%i3,	%i0
	fpadd32	%f2,	%f2,	%f14
	sra	%l0,	0x07,	%g3
	fmovse	%icc,	%f18,	%f0
	andncc	%i4,	%o1,	%g6
	addcc	%o5,	%o3,	%l2
	sra	%l4,	0x0C,	%i2
	or	%o7,	%i6,	%g5
	ldd	[%l7 + 0x70],	%o4
	fmovdle	%icc,	%f23,	%f25
	movre	%l1,	0x2A1,	%g4
	movge	%xcc,	%l6,	%l5
	movrgez	%g1,	0x0B7,	%i7
	edge32	%g7,	%i1,	%i5
	srax	%g2,	%o2,	%o0
	fcmpes	%fcc0,	%f16,	%f6
	edge16l	%l3,	%o6,	%i3
	or	%l0,	0x12F0,	%g3
	subccc	%i4,	%o1,	%i0
	std	%f16,	[%l7 + 0x08]
	udivx	%o5,	0x1982,	%o3
	fnot2	%f10,	%f4
	movrgz	%g6,	%l2,	%l4
	sdiv	%o7,	0x052E,	%i2
	udivx	%g5,	0x00B4,	%o4
	stb	%l1,	[%l7 + 0x68]
	umul	%i6,	%g4,	%l5
	fnot1s	%f9,	%f5
	array16	%g1,	%i7,	%l6
	movpos	%icc,	%g7,	%i5
	fmovsn	%icc,	%f21,	%f19
	movvc	%icc,	%i1,	%g2
	movne	%icc,	%o0,	%l3
	movg	%icc,	%o6,	%o2
	ldsb	[%l7 + 0x60],	%l0
	movvs	%icc,	%i3,	%g3
	fnot2	%f10,	%f30
	sethi	0x1209,	%o1
	movpos	%xcc,	%i0,	%i4
	fornot2	%f22,	%f12,	%f28
	alignaddr	%o3,	%o5,	%l2
	movrlez	%l4,	%g6,	%o7
	edge8ln	%i2,	%o4,	%g5
	sth	%l1,	[%l7 + 0x6C]
	sethi	0x05DD,	%i6
	movrne	%g4,	%g1,	%i7
	sir	0x0CED
	addc	%l6,	%g7,	%i5
	srax	%i1,	0x07,	%l5
	ldsb	[%l7 + 0x2A],	%o0
	movvs	%xcc,	%l3,	%o6
	movl	%xcc,	%o2,	%l0
	mulx	%g2,	0x105C,	%g3
	siam	0x7
	movpos	%xcc,	%i3,	%o1
	edge16l	%i4,	%o3,	%i0
	udivcc	%o5,	0x137D,	%l4
	sub	%g6,	0x0F2F,	%o7
	fcmple32	%f18,	%f2,	%i2
	edge8l	%l2,	%g5,	%l1
	alignaddr	%i6,	%g4,	%o4
	ld	[%l7 + 0x24],	%f13
	ld	[%l7 + 0x54],	%f4
	fandnot2	%f16,	%f14,	%f28
	movrne	%i7,	0x084,	%l6
	xnor	%g1,	0x10FD,	%i5
	movvs	%xcc,	%g7,	%l5
	fpsub32s	%f22,	%f22,	%f9
	sdivx	%o0,	0x02B5,	%i1
	fnegs	%f23,	%f1
	fmul8x16al	%f19,	%f22,	%f20
	subcc	%o6,	%l3,	%o2
	udiv	%g2,	0x17C4,	%g3
	udivx	%l0,	0x047F,	%i3
	alignaddrl	%i4,	%o1,	%o3
	edge32	%i0,	%l4,	%o5
	addc	%o7,	%i2,	%l2
	xnor	%g5,	%l1,	%i6
	movge	%xcc,	%g6,	%o4
	movpos	%icc,	%g4,	%l6
	ldd	[%l7 + 0x28],	%g0
	subcc	%i7,	%i5,	%g7
	fpadd16s	%f11,	%f2,	%f5
	lduh	[%l7 + 0x44],	%o0
	move	%icc,	%i1,	%o6
	movn	%xcc,	%l3,	%l5
	lduw	[%l7 + 0x48],	%g2
	fmovrse	%o2,	%f6,	%f12
	sdivcc	%l0,	0x1C6B,	%i3
	movne	%xcc,	%g3,	%o1
	umul	%o3,	%i4,	%l4
	movrlez	%i0,	0x071,	%o5
	fmovsleu	%xcc,	%f30,	%f0
	edge32l	%o7,	%l2,	%g5
	stx	%l1,	[%l7 + 0x40]
	array16	%i6,	%g6,	%i2
	fornot2s	%f4,	%f19,	%f16
	edge16ln	%g4,	%o4,	%l6
	sir	0x1319
	ld	[%l7 + 0x78],	%f31
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	ldd	[%l7 + 0x30],	%f30
	edge16n	%o0,	%i1,	%g7
	stb	%o6,	[%l7 + 0x3E]
	save %l3, 0x13CD, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f22,	%f14,	%f24
	xnor	%o2,	0x0F00,	%g2
	smulcc	%i3,	%l0,	%g3
	std	%f8,	[%l7 + 0x60]
	ldsw	[%l7 + 0x30],	%o3
	orn	%i4,	%o1,	%i0
	alignaddr	%l4,	%o7,	%o5
	udiv	%l2,	0x15D5,	%l1
	movgu	%icc,	%i6,	%g6
	xnorcc	%g5,	%g4,	%i2
	movn	%icc,	%l6,	%i7
	bshuffle	%f4,	%f22,	%f12
	move	%xcc,	%g1,	%i5
	movneg	%icc,	%o4,	%o0
	sllx	%i1,	0x08,	%g7
	add	%l3,	%l5,	%o6
	mova	%xcc,	%o2,	%g2
	st	%f12,	[%l7 + 0x2C]
	add	%i3,	0x044E,	%l0
	popc	%o3,	%g3
	udiv	%o1,	0x1935,	%i0
	andncc	%i4,	%o7,	%l4
	fmovscc	%icc,	%f3,	%f27
	orcc	%l2,	0x0489,	%o5
	fxors	%f10,	%f2,	%f1
	fmovdcs	%icc,	%f0,	%f8
	srlx	%i6,	0x00,	%g6
	fmuld8sux16	%f13,	%f21,	%f6
	edge32ln	%g5,	%l1,	%g4
	movrne	%l6,	0x242,	%i7
	srlx	%i2,	0x0D,	%i5
	edge16n	%o4,	%o0,	%g1
	fmuld8sux16	%f0,	%f0,	%f16
	fmovrdlez	%i1,	%f20,	%f28
	ld	[%l7 + 0x08],	%f10
	udivcc	%g7,	0x0F27,	%l5
	edge16ln	%l3,	%o6,	%g2
	sub	%o2,	%i3,	%o3
	mulscc	%g3,	0x0C62,	%l0
	stw	%o1,	[%l7 + 0x40]
	fnot2s	%f22,	%f12
	movne	%xcc,	%i4,	%i0
	fmovdcs	%xcc,	%f22,	%f8
	stw	%l4,	[%l7 + 0x40]
	fcmped	%fcc2,	%f24,	%f18
	array8	%o7,	%l2,	%o5
	movre	%g6,	0x124,	%g5
	ldd	[%l7 + 0x58],	%f4
	fmovdneg	%icc,	%f12,	%f7
	srl	%l1,	%i6,	%g4
	fnors	%f15,	%f27,	%f28
	ldx	[%l7 + 0x20],	%l6
	sra	%i7,	%i5,	%i2
	sub	%o0,	0x1225,	%o4
	mulx	%i1,	0x1480,	%g1
	nop
	set	0x54, %l4
	ldsw	[%l7 + %l4],	%g7
	lduh	[%l7 + 0x24],	%l5
	fpsub16s	%f26,	%f24,	%f7
	movcc	%icc,	%o6,	%l3
	subc	%g2,	%i3,	%o3
	fcmpd	%fcc1,	%f26,	%f16
	movrlz	%o2,	%l0,	%o1
	srl	%i4,	%i0,	%l4
	fxnor	%f4,	%f4,	%f2
	fnand	%f12,	%f24,	%f26
	movg	%icc,	%g3,	%o7
	fandnot1	%f18,	%f18,	%f12
	movleu	%xcc,	%l2,	%o5
	fmovdvc	%xcc,	%f25,	%f4
	movrne	%g5,	%g6,	%l1
	sethi	0x1D0C,	%i6
	fmovde	%icc,	%f9,	%f12
	sethi	0x0165,	%g4
	umulcc	%i7,	%l6,	%i5
	addccc	%o0,	0x1040,	%o4
	fmul8x16au	%f12,	%f19,	%f4
	fandnot1s	%f1,	%f15,	%f20
	fabss	%f22,	%f5
	fornot1	%f30,	%f12,	%f26
	subcc	%i1,	0x1DEE,	%i2
	mulx	%g1,	0x15A9,	%g7
	sir	0x1D53
	edge32l	%l5,	%l3,	%g2
	sll	%i3,	%o3,	%o6
	edge16	%l0,	%o2,	%o1
	movcc	%icc,	%i0,	%l4
	edge16l	%g3,	%o7,	%l2
	udivx	%i4,	0x0EEA,	%g5
	stw	%g6,	[%l7 + 0x60]
	movvs	%icc,	%o5,	%l1
	ldsb	[%l7 + 0x1B],	%i6
	fand	%f20,	%f18,	%f10
	sth	%i7,	[%l7 + 0x72]
	edge32l	%g4,	%i5,	%l6
	edge8ln	%o0,	%i1,	%o4
	ldsb	[%l7 + 0x76],	%i2
	subccc	%g1,	%g7,	%l5
	save %l3, 0x0F94, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g2,	%o3,	%l0
	edge16n	%o2,	%o6,	%o1
	sethi	0x127B,	%l4
	andn	%g3,	0x17DA,	%o7
	subc	%l2,	%i4,	%g5
	fand	%f12,	%f6,	%f10
	nop
	set	0x48, %l6
	ldx	[%l7 + %l6],	%i0
	sllx	%g6,	%o5,	%i6
	add	%i7,	0x1EC6,	%l1
	nop
	set	0x20, %o1
	lduw	[%l7 + %o1],	%i5
	fmovdn	%icc,	%f2,	%f8
	ldd	[%l7 + 0x18],	%f28
	sethi	0x0EFE,	%l6
	stb	%o0,	[%l7 + 0x63]
	ldsh	[%l7 + 0x2A],	%g4
	movneg	%icc,	%i1,	%o4
	fcmpeq16	%f20,	%f16,	%i2
	movge	%icc,	%g7,	%l5
	array8	%g1,	%i3,	%l3
	nop
	set	0x62, %g7
	ldsh	[%l7 + %g7],	%g2
	sir	0x1866
	ldsw	[%l7 + 0x0C],	%l0
	fmovse	%xcc,	%f4,	%f0
	edge32l	%o3,	%o6,	%o2
	ldsh	[%l7 + 0x54],	%o1
	lduw	[%l7 + 0x08],	%g3
	movg	%icc,	%o7,	%l4
	sdiv	%l2,	0x1B34,	%i4
	array16	%i0,	%g5,	%o5
	ldub	[%l7 + 0x1A],	%i6
	stw	%g6,	[%l7 + 0x78]
	edge32ln	%l1,	%i7,	%l6
	alignaddrl	%o0,	%g4,	%i5
	umul	%o4,	0x0694,	%i2
	std	%f26,	[%l7 + 0x30]
	srlx	%g7,	%l5,	%g1
	srl	%i3,	%i1,	%g2
	fpack16	%f6,	%f14
	movle	%icc,	%l3,	%l0
	srax	%o6,	%o2,	%o1
	ldd	[%l7 + 0x58],	%f4
	and	%o3,	%g3,	%l4
	edge8n	%l2,	%i4,	%i0
	movre	%g5,	0x205,	%o5
	edge8n	%i6,	%g6,	%l1
	sir	0x1A2C
	addc	%o7,	%l6,	%o0
	fcmple32	%f14,	%f14,	%g4
	sth	%i7,	[%l7 + 0x68]
	smulcc	%i5,	%o4,	%i2
	sra	%l5,	%g7,	%g1
	subccc	%i1,	%i3,	%g2
	popc	0x1C42,	%l0
	orncc	%l3,	0x0FD2,	%o2
	fones	%f4
	fmuld8ulx16	%f10,	%f13,	%f10
	fmovdvc	%xcc,	%f27,	%f10
	umul	%o6,	%o3,	%g3
	array32	%o1,	%l2,	%i4
	edge32ln	%i0,	%g5,	%l4
	fnands	%f4,	%f30,	%f28
	umul	%o5,	%i6,	%g6
	nop
	set	0x24, %o4
	lduw	[%l7 + %o4],	%o7
	fornot1	%f26,	%f14,	%f6
	umul	%l1,	%o0,	%g4
	st	%f8,	[%l7 + 0x60]
	movn	%xcc,	%l6,	%i5
	array32	%o4,	%i7,	%i2
	movrgz	%g7,	%l5,	%i1
	movn	%xcc,	%i3,	%g1
	mulx	%l0,	%l3,	%g2
	smul	%o6,	%o2,	%g3
	fabsd	%f8,	%f12
	fands	%f17,	%f1,	%f31
	sdivx	%o1,	0x1058,	%o3
	xnorcc	%i4,	0x00CA,	%i0
	or	%g5,	%l4,	%l2
	fnegs	%f31,	%f3
	umul	%i6,	%g6,	%o7
	sir	0x01E5
	fpack16	%f18,	%f30
	andncc	%l1,	%o0,	%g4
	movpos	%xcc,	%o5,	%i5
	sethi	0x1FB6,	%l6
	fand	%f8,	%f14,	%f4
	sllx	%i7,	0x06,	%o4
	fmovs	%f24,	%f30
	edge8	%i2,	%g7,	%i1
	orncc	%i3,	%l5,	%l0
	and	%l3,	0x0844,	%g2
	movrlz	%g1,	0x06F,	%o2
	lduw	[%l7 + 0x48],	%o6
	fnot2s	%f9,	%f3
	movrlz	%g3,	0x198,	%o1
	or	%i4,	0x0D21,	%o3
	fmovrslez	%i0,	%f27,	%f16
	sir	0x1446
	srlx	%l4,	0x11,	%g5
	addccc	%l2,	0x0968,	%g6
	movge	%xcc,	%o7,	%l1
	fabsd	%f0,	%f20
	fmovdg	%xcc,	%f15,	%f29
	orn	%i6,	%g4,	%o5
	fone	%f30
	xnorcc	%o0,	0x02FB,	%l6
	orcc	%i7,	0x1334,	%i5
	srlx	%i2,	0x0A,	%g7
	edge8	%o4,	%i1,	%i3
	sethi	0x1A03,	%l5
	fmovrdgez	%l3,	%f26,	%f22
	edge16l	%g2,	%l0,	%o2
	fmul8x16	%f3,	%f16,	%f18
	mulx	%o6,	%g1,	%o1
	fpadd32s	%f12,	%f4,	%f25
	edge32	%g3,	%i4,	%o3
	fsrc2s	%f10,	%f16
	alignaddr	%i0,	%g5,	%l4
	edge16ln	%l2,	%o7,	%g6
	nop
	set	0x19, %i5
	ldsb	[%l7 + %i5],	%i6
	movvs	%xcc,	%g4,	%o5
	fmovrslez	%o0,	%f10,	%f29
	orcc	%l6,	%i7,	%l1
	fmovrdgez	%i2,	%f30,	%f24
	ldsh	[%l7 + 0x78],	%g7
	sethi	0x0B78,	%o4
	ldd	[%l7 + 0x78],	%i0
	save %i5, %i3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l5,	0x0380,	%l0
	orn	%g2,	%o2,	%o6
	movrlez	%o1,	%g1,	%g3
	movrlez	%o3,	0x27A,	%i4
	movvc	%xcc,	%i0,	%l4
	edge32l	%l2,	%o7,	%g5
	subcc	%i6,	%g6,	%o5
	ldd	[%l7 + 0x68],	%f24
	fandnot2s	%f8,	%f17,	%f11
	subcc	%o0,	0x0735,	%g4
	smulcc	%l6,	0x0FA5,	%i7
	smul	%l1,	%g7,	%i2
	ldub	[%l7 + 0x66],	%i1
	fmovda	%icc,	%f13,	%f3
	movneg	%icc,	%o4,	%i5
	stb	%i3,	[%l7 + 0x16]
	sra	%l3,	%l0,	%g2
	fmovsleu	%xcc,	%f20,	%f1
	addcc	%o2,	%o6,	%l5
	sllx	%g1,	%o1,	%o3
	andcc	%g3,	0x0DA1,	%i0
	smul	%l4,	0x0585,	%i4
	movrlz	%o7,	0x3FB,	%l2
	fmovdcs	%icc,	%f18,	%f21
	sra	%g5,	0x04,	%g6
	movne	%icc,	%i6,	%o5
	xorcc	%g4,	%l6,	%o0
	stx	%l1,	[%l7 + 0x68]
	movg	%xcc,	%g7,	%i7
	fpackfix	%f22,	%f8
	move	%xcc,	%i2,	%i1
	popc	%i5,	%o4
	sllx	%i3,	0x01,	%l3
	movrlez	%g2,	%o2,	%o6
	movrlz	%l5,	%g1,	%l0
	sir	0x0730
	fcmpne16	%f4,	%f14,	%o1
	movrne	%g3,	0x09F,	%o3
	movcs	%xcc,	%i0,	%l4
	addc	%i4,	0x0D9E,	%o7
	stb	%g5,	[%l7 + 0x0A]
	array32	%l2,	%g6,	%i6
	fnands	%f28,	%f23,	%f9
	alignaddr	%g4,	%l6,	%o0
	fmul8x16au	%f2,	%f28,	%f12
	mulx	%l1,	%o5,	%g7
	stb	%i2,	[%l7 + 0x7E]
	ldsh	[%l7 + 0x54],	%i7
	mulscc	%i5,	0x1F71,	%i1
	ld	[%l7 + 0x74],	%f19
	fpadd32	%f26,	%f14,	%f6
	fcmped	%fcc0,	%f14,	%f12
	movge	%xcc,	%o4,	%l3
	sll	%g2,	0x0C,	%i3
	xnorcc	%o2,	%l5,	%o6
	st	%f7,	[%l7 + 0x6C]
	edge8ln	%g1,	%o1,	%g3
	mulscc	%l0,	0x1293,	%o3
	fpackfix	%f28,	%f20
	smulcc	%i0,	%i4,	%l4
	fmovrdne	%o7,	%f24,	%f20
	std	%f30,	[%l7 + 0x10]
	fzeros	%f12
	fpmerge	%f23,	%f20,	%f24
	fmovsvc	%xcc,	%f30,	%f8
	srl	%g5,	%l2,	%i6
	movpos	%xcc,	%g6,	%l6
	umulcc	%o0,	%l1,	%o5
	fmovdg	%xcc,	%f23,	%f29
	udivx	%g4,	0x130B,	%i2
	movneg	%xcc,	%i7,	%g7
	move	%icc,	%i5,	%o4
	fandnot2	%f16,	%f6,	%f8
	andncc	%i1,	%g2,	%i3
	movcc	%xcc,	%l3,	%o2
	andncc	%o6,	%g1,	%l5
	fmovsl	%icc,	%f20,	%f21
	movrgez	%o1,	%l0,	%o3
	movne	%icc,	%g3,	%i0
	edge16	%l4,	%o7,	%i4
	sllx	%l2,	%i6,	%g6
	orcc	%g5,	%l6,	%o0
	fmovdleu	%icc,	%f17,	%f23
	fandnot1s	%f18,	%f6,	%f27
	fmovdgu	%xcc,	%f20,	%f19
	mulscc	%l1,	0x0489,	%g4
	std	%f6,	[%l7 + 0x18]
	edge8	%o5,	%i7,	%g7
	edge32n	%i5,	%o4,	%i2
	array32	%i1,	%g2,	%i3
	orncc	%l3,	%o2,	%g1
	fandnot2s	%f21,	%f10,	%f13
	xnor	%o6,	0x18DF,	%l5
	sll	%l0,	%o3,	%o1
	restore %i0, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f18,	%f8,	%f24
	xor	%i4,	0x0D32,	%l2
	movvs	%icc,	%o7,	%i6
	std	%f12,	[%l7 + 0x48]
	fmovdleu	%icc,	%f5,	%f26
	popc	%g5,	%g6
	mulx	%l6,	0x03D7,	%l1
	fpadd32	%f24,	%f30,	%f10
	fmovdvc	%icc,	%f3,	%f26
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	fmovsge	%icc,	%f25,	%f1
	move	%icc,	%g7,	%i5
	mulscc	%g4,	%i2,	%i1
	mulx	%g2,	%i3,	%l3
	array32	%o2,	%o4,	%o6
	edge16l	%l5,	%l0,	%o3
	array32	%o1,	%i0,	%g3
	array16	%l4,	%i4,	%g1
	edge32	%o7,	%i6,	%l2
	stb	%g5,	[%l7 + 0x2B]
	fmovsle	%xcc,	%f15,	%f20
	sdivx	%l6,	0x01FF,	%g6
	fnors	%f13,	%f24,	%f5
	movrlez	%l1,	0x265,	%o0
	nop
	set	0x08, %l1
	lduw	[%l7 + %l1],	%o5
	fmovsl	%xcc,	%f4,	%f24
	movg	%xcc,	%i7,	%i5
	addcc	%g7,	%i2,	%g4
	and	%g2,	0x14F3,	%i1
	fmul8x16au	%f18,	%f24,	%f28
	fornot1	%f6,	%f10,	%f24
	fpsub16	%f24,	%f8,	%f14
	fcmpeq16	%f28,	%f6,	%i3
	fmovsgu	%icc,	%f7,	%f13
	edge32ln	%l3,	%o4,	%o6
	umul	%o2,	0x0E70,	%l0
	movvs	%xcc,	%o3,	%o1
	mova	%icc,	%l5,	%i0
	udiv	%l4,	0x06BD,	%g3
	alignaddr	%i4,	%o7,	%i6
	movrgz	%l2,	0x0E1,	%g5
	alignaddrl	%g1,	%l6,	%l1
	udivx	%g6,	0x15C8,	%o5
	movre	%i7,	0x37E,	%i5
	add	%o0,	0x0D2C,	%i2
	edge8	%g4,	%g2,	%i1
	fmovs	%f22,	%f7
	srl	%i3,	%l3,	%g7
	andn	%o4,	%o6,	%l0
	srl	%o3,	0x06,	%o2
	subccc	%l5,	%o1,	%l4
	nop
	set	0x38, %l0
	ldx	[%l7 + %l0],	%g3
	fpsub16s	%f30,	%f24,	%f4
	xor	%i0,	0x185C,	%i4
	fnor	%f26,	%f20,	%f26
	movpos	%xcc,	%o7,	%i6
	sra	%l2,	0x02,	%g1
	movrne	%g5,	0x179,	%l1
	xnorcc	%g6,	0x05D6,	%l6
	srax	%o5,	0x11,	%i5
	fmovrslez	%o0,	%f31,	%f26
	sir	0x0344
	st	%f22,	[%l7 + 0x34]
	smulcc	%i2,	0x156A,	%i7
	fmovsgu	%xcc,	%f26,	%f8
	srax	%g4,	0x0C,	%i1
	stw	%i3,	[%l7 + 0x3C]
	edge32n	%g2,	%l3,	%o4
	fmovscc	%icc,	%f2,	%f11
	mulscc	%g7,	0x0790,	%l0
	edge32ln	%o3,	%o6,	%o2
	popc	%o1,	%l5
	sdivx	%g3,	0x1499,	%l4
	umulcc	%i4,	%i0,	%i6
	orn	%l2,	0x037D,	%g1
	fcmps	%fcc2,	%f26,	%f26
	xnorcc	%g5,	%o7,	%l1
	orn	%l6,	%g6,	%o5
	edge32	%i5,	%o0,	%i2
	subccc	%g4,	%i7,	%i1
	alignaddrl	%i3,	%g2,	%o4
	fxnor	%f10,	%f22,	%f8
	fmovrsgez	%g7,	%f0,	%f16
	addc	%l0,	%o3,	%o6
	alignaddrl	%o2,	%o1,	%l3
	udivx	%g3,	0x0BCA,	%l5
	fxnors	%f13,	%f23,	%f14
	fmovrdlez	%l4,	%f6,	%f10
	std	%f18,	[%l7 + 0x38]
	edge16ln	%i0,	%i4,	%i6
	fmovrdlz	%l2,	%f24,	%f16
	movrgez	%g5,	0x088,	%g1
	srl	%o7,	0x15,	%l1
	sir	0x143E
	edge16	%g6,	%l6,	%i5
	xorcc	%o5,	%o0,	%g4
	fmovspos	%icc,	%f5,	%f5
	edge16l	%i7,	%i2,	%i1
	fornot2	%f26,	%f20,	%f0
	sdivcc	%i3,	0x1857,	%g2
	alignaddr	%o4,	%l0,	%o3
	fmul8ulx16	%f10,	%f26,	%f6
	addccc	%o6,	%g7,	%o2
	stb	%l3,	[%l7 + 0x6E]
	edge16ln	%o1,	%g3,	%l5
	ldsw	[%l7 + 0x38],	%i0
	lduh	[%l7 + 0x24],	%i4
	edge32l	%i6,	%l4,	%l2
	movrlz	%g1,	0x2D9,	%g5
	fsrc1s	%f8,	%f27
	lduh	[%l7 + 0x2C],	%o7
	srlx	%g6,	0x09,	%l1
	fpadd16s	%f29,	%f24,	%f6
	fmovsneg	%icc,	%f17,	%f21
	movrlz	%i5,	%o5,	%l6
	mulx	%o0,	%i7,	%g4
	movvs	%xcc,	%i1,	%i3
	fpack32	%f2,	%f10,	%f2
	array16	%g2,	%i2,	%l0
	smulcc	%o4,	0x1EE5,	%o6
	sub	%g7,	0x039F,	%o3
	std	%f0,	[%l7 + 0x48]
	alignaddr	%l3,	%o1,	%g3
	alignaddr	%l5,	%i0,	%i4
	sll	%i6,	%l4,	%l2
	edge16	%g1,	%g5,	%o2
	smul	%o7,	0x00F9,	%l1
	popc	0x064A,	%g6
	and	%i5,	0x0487,	%o5
	edge16n	%o0,	%l6,	%i7
	addc	%i1,	%g4,	%i3
	fmovda	%xcc,	%f18,	%f10
	lduh	[%l7 + 0x7A],	%i2
	movrlz	%l0,	%g2,	%o4
	fxnor	%f14,	%f30,	%f14
	fsrc1s	%f21,	%f29
	ldub	[%l7 + 0x59],	%o6
	sra	%g7,	%l3,	%o3
	sra	%g3,	0x08,	%l5
	edge8l	%i0,	%o1,	%i6
	sth	%l4,	[%l7 + 0x3E]
	orncc	%l2,	%g1,	%g5
	mova	%xcc,	%i4,	%o2
	ldd	[%l7 + 0x18],	%f18
	ldx	[%l7 + 0x18],	%l1
	movl	%icc,	%g6,	%o7
	udivcc	%o5,	0x0CBD,	%i5
	edge8	%o0,	%l6,	%i7
	movpos	%icc,	%g4,	%i1
	movre	%i3,	%l0,	%i2
	movle	%xcc,	%o4,	%g2
	fexpand	%f10,	%f12
	movvs	%icc,	%o6,	%g7
	sub	%o3,	0x09C2,	%l3
	sth	%l5,	[%l7 + 0x2C]
	fmovs	%f17,	%f12
	edge8ln	%i0,	%g3,	%i6
	ldub	[%l7 + 0x47],	%l4
	fsrc2	%f2,	%f8
	edge8l	%l2,	%g1,	%o1
	stx	%i4,	[%l7 + 0x60]
	and	%g5,	%o2,	%l1
	array32	%g6,	%o5,	%i5
	fmovrdgez	%o7,	%f12,	%f30
	subc	%l6,	%i7,	%g4
	xorcc	%i1,	0x175E,	%o0
	ldsw	[%l7 + 0x3C],	%i3
	movrgez	%i2,	%l0,	%o4
	mulscc	%g2,	0x1C88,	%g7
	movl	%icc,	%o3,	%l3
	sth	%l5,	[%l7 + 0x5E]
	fmovdvs	%xcc,	%f14,	%f8
	stx	%i0,	[%l7 + 0x10]
	ldd	[%l7 + 0x28],	%o6
	fmovsn	%icc,	%f6,	%f20
	edge8n	%i6,	%g3,	%l2
	movleu	%xcc,	%g1,	%l4
	fcmpd	%fcc3,	%f26,	%f12
	subc	%o1,	0x1395,	%i4
	fcmple16	%f4,	%f10,	%g5
	popc	0x10A1,	%l1
	fcmped	%fcc0,	%f24,	%f26
	udivcc	%o2,	0x0F15,	%o5
	movcs	%icc,	%i5,	%g6
	edge16	%o7,	%l6,	%i7
	sub	%i1,	%g4,	%i3
	andcc	%o0,	%i2,	%l0
	xorcc	%g2,	%g7,	%o4
	fmovdne	%xcc,	%f26,	%f2
	mulscc	%l3,	%o3,	%i0
	and	%o6,	%i6,	%l5
	edge32n	%l2,	%g3,	%g1
	fmovrslez	%o1,	%f30,	%f24
	edge8l	%i4,	%g5,	%l4
	edge8l	%o2,	%l1,	%o5
	stb	%g6,	[%l7 + 0x3D]
	movg	%xcc,	%o7,	%l6
	move	%icc,	%i7,	%i5
	edge8l	%g4,	%i3,	%i1
	ldd	[%l7 + 0x28],	%i2
	movrlz	%l0,	%g2,	%o0
	sub	%g7,	0x10DD,	%l3
	fmul8ulx16	%f20,	%f6,	%f20
	fand	%f0,	%f26,	%f6
	popc	0x1533,	%o3
	array16	%i0,	%o6,	%i6
	ldsh	[%l7 + 0x54],	%l5
	fcmpgt32	%f30,	%f16,	%o4
	and	%g3,	%g1,	%o1
	edge8ln	%i4,	%g5,	%l4
	edge32n	%o2,	%l1,	%o5
	lduh	[%l7 + 0x2C],	%g6
	fcmpeq16	%f4,	%f24,	%l2
	ld	[%l7 + 0x10],	%f21
	fnors	%f21,	%f26,	%f7
	movrne	%l6,	0x2FD,	%i7
	xorcc	%o7,	0x1E7F,	%i5
	movcc	%xcc,	%i3,	%i1
	edge16n	%i2,	%l0,	%g2
	popc	%o0,	%g4
	fmul8x16al	%f0,	%f20,	%f20
	lduh	[%l7 + 0x6E],	%g7
	fmovdcs	%icc,	%f13,	%f28
	fandnot2s	%f2,	%f16,	%f17
	edge8n	%o3,	%i0,	%o6
	stb	%l3,	[%l7 + 0x50]
	fpmerge	%f1,	%f31,	%f30
	ldd	[%l7 + 0x60],	%i6
	mova	%icc,	%o4,	%g3
	fexpand	%f8,	%f26
	fnand	%f0,	%f30,	%f12
	addccc	%l5,	0x0252,	%o1
	edge16	%g1,	%g5,	%i4
	movgu	%icc,	%o2,	%l1
	stb	%l4,	[%l7 + 0x4D]
	nop
	set	0x78, %o3
	std	%f12,	[%l7 + %o3]
	movcc	%xcc,	%o5,	%l2
	umulcc	%g6,	0x0DE2,	%i7
	srlx	%l6,	%i5,	%o7
	fmovspos	%xcc,	%f20,	%f8
	bshuffle	%f22,	%f2,	%f10
	edge8	%i1,	%i3,	%l0
	umulcc	%g2,	0x0DAA,	%i2
	movre	%o0,	%g4,	%o3
	array32	%i0,	%o6,	%g7
	restore %i6, %l3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o4,	%o1,	%g1
	ldsh	[%l7 + 0x54],	%g5
	fxor	%f14,	%f26,	%f26
	nop
	set	0x48, %i4
	std	%f4,	[%l7 + %i4]
	fmovdcc	%xcc,	%f4,	%f16
	fcmpeq32	%f28,	%f14,	%i4
	ld	[%l7 + 0x3C],	%f24
	srax	%l5,	0x13,	%o2
	fsrc1s	%f5,	%f28
	xor	%l4,	0x03C1,	%o5
	movvc	%xcc,	%l2,	%l1
	fmovdne	%icc,	%f12,	%f22
	smul	%i7,	%l6,	%g6
	nop
	set	0x74, %i6
	sth	%o7,	[%l7 + %i6]
	movre	%i1,	%i5,	%l0
	sth	%g2,	[%l7 + 0x4E]
	save %i2, 0x0ADF, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g4,	%o3,	%i3
	st	%f16,	[%l7 + 0x50]
	fmovsa	%icc,	%f31,	%f8
	fsrc1	%f18,	%f2
	fmovdvc	%xcc,	%f22,	%f25
	fcmpd	%fcc3,	%f28,	%f30
	andncc	%i0,	%g7,	%i6
	ldx	[%l7 + 0x70],	%o6
	srax	%g3,	%l3,	%o4
	fexpand	%f21,	%f0
	fsrc2s	%f21,	%f1
	fmovdl	%icc,	%f24,	%f16
	movgu	%icc,	%o1,	%g1
	movrlez	%i4,	%g5,	%o2
	sub	%l5,	0x1844,	%o5
	udiv	%l4,	0x0F3C,	%l1
	pdist	%f0,	%f24,	%f4
	edge32l	%l2,	%l6,	%g6
	fmovdcc	%xcc,	%f16,	%f10
	sra	%o7,	0x18,	%i1
	edge8ln	%i7,	%l0,	%g2
	nop
	set	0x71, %o5
	ldsb	[%l7 + %o5],	%i5
	fandnot2s	%f12,	%f20,	%f10
	fnand	%f10,	%f8,	%f16
	edge32ln	%i2,	%o0,	%o3
	movn	%xcc,	%g4,	%i3
	mulx	%i0,	%i6,	%o6
	ldx	[%l7 + 0x78],	%g3
	or	%l3,	0x176D,	%g7
	edge8l	%o4,	%g1,	%o1
	fmovdcc	%icc,	%f1,	%f20
	sub	%i4,	%g5,	%l5
	udivx	%o2,	0x1816,	%l4
	ldsh	[%l7 + 0x6C],	%l1
	movcs	%icc,	%l2,	%l6
	sth	%o5,	[%l7 + 0x48]
	array16	%g6,	%o7,	%i7
	edge32l	%l0,	%g2,	%i1
	ldx	[%l7 + 0x08],	%i5
	edge32l	%i2,	%o3,	%g4
	fmovd	%f2,	%f28
	st	%f1,	[%l7 + 0x14]
	movrgez	%i3,	0x04D,	%o0
	udiv	%i0,	0x17B0,	%i6
	alignaddr	%o6,	%l3,	%g7
	smul	%o4,	0x00D3,	%g3
	fand	%f28,	%f20,	%f14
	fmovrde	%o1,	%f10,	%f14
	fmovrsgz	%i4,	%f13,	%f2
	fmovrdlez	%g1,	%f20,	%f24
	lduh	[%l7 + 0x12],	%l5
	sllx	%o2,	%g5,	%l4
	fpackfix	%f8,	%f31
	fmul8x16al	%f4,	%f14,	%f22
	edge16ln	%l2,	%l6,	%l1
	srax	%o5,	0x0D,	%g6
	edge16	%i7,	%o7,	%g2
	xnor	%i1,	%l0,	%i5
	movne	%icc,	%o3,	%i2
	sir	0x1D36
	edge8l	%g4,	%o0,	%i3
	fcmple16	%f22,	%f0,	%i0
	edge8ln	%o6,	%i6,	%l3
	ld	[%l7 + 0x10],	%f19
	sth	%o4,	[%l7 + 0x36]
	movle	%xcc,	%g3,	%g7
	mova	%xcc,	%o1,	%i4
	movl	%icc,	%l5,	%o2
	orn	%g5,	0x0D08,	%l4
	edge8l	%g1,	%l2,	%l1
	mulx	%o5,	%g6,	%l6
	sth	%o7,	[%l7 + 0x3C]
	popc	0x0284,	%g2
	movne	%xcc,	%i1,	%l0
	movcs	%xcc,	%i5,	%o3
	fmovspos	%xcc,	%f30,	%f21
	stw	%i2,	[%l7 + 0x14]
	fnegs	%f18,	%f0
	popc	%g4,	%i7
	sdivx	%o0,	0x1AAD,	%i0
	array8	%o6,	%i6,	%i3
	faligndata	%f16,	%f30,	%f14
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	udiv	%g7,	0x14C0,	%o1
	array8	%l3,	%l5,	%i4
	andcc	%g5,	%o2,	%l4
	fmovsg	%icc,	%f11,	%f13
	bshuffle	%f28,	%f28,	%f16
	edge32n	%l2,	%g1,	%l1
	udivx	%g6,	0x1049,	%o5
	movle	%xcc,	%o7,	%l6
	ldub	[%l7 + 0x3E],	%i1
	xnorcc	%g2,	%l0,	%o3
	fone	%f24
	movrgez	%i5,	0x351,	%i2
	edge8ln	%i7,	%g4,	%i0
	srax	%o0,	0x01,	%i6
	add	%o6,	0x1644,	%i3
	movge	%xcc,	%g3,	%g7
	sth	%o4,	[%l7 + 0x7A]
	addc	%l3,	0x122E,	%o1
	fmovsn	%xcc,	%f22,	%f17
	srlx	%l5,	%i4,	%o2
	fmovrslz	%l4,	%f14,	%f14
	fmovdne	%xcc,	%f6,	%f28
	movcc	%xcc,	%l2,	%g1
	array8	%l1,	%g6,	%o5
	ldsw	[%l7 + 0x38],	%o7
	sra	%g5,	0x14,	%l6
	edge32	%i1,	%g2,	%l0
	srax	%o3,	0x19,	%i2
	movn	%xcc,	%i7,	%i5
	fcmpgt32	%f22,	%f2,	%g4
	movpos	%xcc,	%o0,	%i6
	edge32n	%o6,	%i0,	%i3
	ldsw	[%l7 + 0x64],	%g3
	sdivx	%o4,	0x08E7,	%g7
	st	%f28,	[%l7 + 0x0C]
	movleu	%icc,	%l3,	%l5
	sir	0x040C
	edge16ln	%i4,	%o1,	%l4
	fmovdcc	%xcc,	%f2,	%f10
	umul	%l2,	0x17E1,	%o2
	sllx	%g1,	0x0F,	%g6
	udiv	%l1,	0x1302,	%o7
	umulcc	%o5,	%g5,	%l6
	edge16n	%i1,	%l0,	%g2
	nop
	set	0x5A, %g4
	sth	%i2,	[%l7 + %g4]
	movcs	%icc,	%i7,	%i5
	edge16n	%o3,	%o0,	%i6
	srax	%g4,	0x1B,	%o6
	movneg	%xcc,	%i3,	%g3
	ldsb	[%l7 + 0x7D],	%o4
	movn	%xcc,	%i0,	%l3
	add	%g7,	%l5,	%i4
	sll	%l4,	%l2,	%o2
	edge32	%o1,	%g6,	%l1
	xnorcc	%o7,	%o5,	%g1
	ldd	[%l7 + 0x40],	%g4
	movn	%icc,	%i1,	%l0
	smul	%l6,	%g2,	%i7
	udivx	%i5,	0x085A,	%o3
	fandnot2s	%f4,	%f13,	%f13
	lduh	[%l7 + 0x70],	%o0
	ldx	[%l7 + 0x60],	%i6
	edge16l	%i2,	%g4,	%i3
	movge	%xcc,	%g3,	%o4
	fcmps	%fcc3,	%f11,	%f2
	orncc	%i0,	%l3,	%g7
	fmovsvs	%xcc,	%f21,	%f1
	fmovrdlz	%o6,	%f10,	%f10
	srax	%l5,	0x07,	%l4
	fmovs	%f4,	%f30
	movvs	%xcc,	%l2,	%i4
	edge8n	%o1,	%o2,	%l1
	srl	%o7,	0x1E,	%g6
	edge32	%o5,	%g5,	%g1
	ldd	[%l7 + 0x48],	%l0
	sdiv	%l6,	0x1A98,	%g2
	edge16n	%i1,	%i5,	%i7
	popc	0x1CFE,	%o3
	fornot2s	%f10,	%f5,	%f19
	movleu	%icc,	%o0,	%i6
	fexpand	%f6,	%f18
	movg	%xcc,	%i2,	%g4
	movrlez	%i3,	%g3,	%i0
	movcs	%xcc,	%o4,	%g7
	fmovscs	%xcc,	%f19,	%f3
	srax	%o6,	%l5,	%l3
	sll	%l2,	0x0D,	%i4
	movrgz	%o1,	0x24B,	%l4
	andcc	%o2,	0x1CA0,	%o7
	fsrc2s	%f19,	%f18
	lduh	[%l7 + 0x0A],	%g6
	ldd	[%l7 + 0x20],	%f14
	movrlez	%o5,	0x3A0,	%l1
	mova	%icc,	%g5,	%l0
	srax	%l6,	%g1,	%i1
	fmovdcs	%xcc,	%f26,	%f1
	orn	%g2,	0x1149,	%i5
	fmovdpos	%xcc,	%f22,	%f27
	edge16	%i7,	%o3,	%o0
	fmovdle	%xcc,	%f11,	%f17
	movrgz	%i6,	%i2,	%g4
	movleu	%icc,	%g3,	%i0
	sub	%i3,	0x07DB,	%g7
	movcs	%icc,	%o4,	%o6
	mulscc	%l5,	0x1CF4,	%l3
	sllx	%i4,	%l2,	%l4
	for	%f16,	%f24,	%f4
	movrlez	%o2,	%o7,	%g6
	edge32n	%o1,	%o5,	%g5
	movvc	%xcc,	%l0,	%l6
	mova	%icc,	%l1,	%i1
	ldd	[%l7 + 0x20],	%f8
	and	%g1,	0x0664,	%g2
	fxors	%f10,	%f29,	%f19
	fmuld8sux16	%f28,	%f15,	%f16
	movvs	%xcc,	%i7,	%o3
	movgu	%icc,	%i5,	%o0
	movrgz	%i2,	0x2B0,	%g4
	fmovd	%f30,	%f24
	edge8n	%i6,	%i0,	%i3
	subccc	%g3,	0x0E91,	%g7
	stx	%o4,	[%l7 + 0x78]
	fcmpgt16	%f30,	%f4,	%o6
	xorcc	%l3,	0x1397,	%l5
	save %l2, 0x18CB, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l4,	[%l7 + 0x5D]
	edge16ln	%o7,	%o2,	%g6
	fxnors	%f25,	%f28,	%f27
	sllx	%o5,	0x1C,	%g5
	lduw	[%l7 + 0x44],	%l0
	movne	%icc,	%o1,	%l6
	std	%f10,	[%l7 + 0x40]
	edge16l	%l1,	%i1,	%g2
	andn	%i7,	%o3,	%i5
	edge8n	%g1,	%i2,	%o0
	andcc	%g4,	%i0,	%i3
	smulcc	%g3,	0x09CD,	%g7
	ldub	[%l7 + 0x7C],	%i6
	lduh	[%l7 + 0x50],	%o4
	mova	%icc,	%o6,	%l3
	ldsw	[%l7 + 0x78],	%l5
	umul	%i4,	%l2,	%l4
	movneg	%icc,	%o7,	%g6
	addccc	%o2,	%g5,	%l0
	ld	[%l7 + 0x34],	%f11
	nop
	set	0x78, %i3
	stw	%o5,	[%l7 + %i3]
	edge8	%o1,	%l1,	%i1
	lduh	[%l7 + 0x0C],	%l6
	edge32ln	%i7,	%o3,	%i5
	movrlz	%g2,	0x207,	%g1
	stb	%o0,	[%l7 + 0x21]
	stw	%i2,	[%l7 + 0x10]
	alignaddrl	%i0,	%i3,	%g3
	fnor	%f22,	%f8,	%f22
	fornot1s	%f31,	%f28,	%f25
	movcs	%xcc,	%g7,	%g4
	subc	%i6,	%o4,	%l3
	popc	%l5,	%o6
	sir	0x0DA3
	add	%i4,	0x12D6,	%l2
	sra	%l4,	0x19,	%o7
	edge16n	%g6,	%o2,	%g5
	lduw	[%l7 + 0x3C],	%l0
	edge32l	%o1,	%l1,	%o5
	ldd	[%l7 + 0x58],	%f26
	movgu	%icc,	%i1,	%l6
	fmovda	%icc,	%f2,	%f27
	movg	%icc,	%o3,	%i5
	array32	%g2,	%g1,	%o0
	popc	0x0C9A,	%i7
	fmovdge	%xcc,	%f27,	%f9
	movvs	%xcc,	%i0,	%i2
	movpos	%xcc,	%g3,	%i3
	array16	%g4,	%i6,	%o4
	fmovspos	%xcc,	%f10,	%f25
	xnorcc	%l3,	0x082A,	%l5
	ld	[%l7 + 0x18],	%f30
	movrlz	%g7,	%i4,	%o6
	fmovsle	%xcc,	%f8,	%f11
	xorcc	%l2,	%o7,	%l4
	movg	%xcc,	%g6,	%g5
	bshuffle	%f28,	%f16,	%f18
	fpsub16s	%f25,	%f7,	%f16
	mova	%xcc,	%l0,	%o2
	ldub	[%l7 + 0x0C],	%o1
	st	%f6,	[%l7 + 0x20]
	fmovsge	%xcc,	%f1,	%f10
	movleu	%icc,	%l1,	%i1
	fmovsg	%icc,	%f7,	%f4
	st	%f22,	[%l7 + 0x5C]
	addcc	%o5,	%l6,	%o3
	xor	%g2,	%i5,	%o0
	edge16ln	%g1,	%i0,	%i7
	orcc	%g3,	%i3,	%i2
	umul	%g4,	%o4,	%i6
	movpos	%xcc,	%l5,	%g7
	movpos	%icc,	%i4,	%o6
	orncc	%l2,	%o7,	%l4
	fcmps	%fcc2,	%f28,	%f10
	addc	%l3,	0x08E4,	%g5
	array16	%g6,	%o2,	%l0
	xor	%o1,	0x17E6,	%l1
	movneg	%icc,	%i1,	%o5
	fones	%f8
	ldx	[%l7 + 0x40],	%o3
	ld	[%l7 + 0x24],	%f9
	movre	%g2,	%i5,	%l6
	movne	%xcc,	%o0,	%i0
	andncc	%g1,	%g3,	%i3
	fmovs	%f26,	%f2
	movle	%xcc,	%i2,	%i7
	fandnot1	%f2,	%f24,	%f10
	sllx	%o4,	0x0F,	%g4
	movvs	%icc,	%i6,	%g7
	std	%f2,	[%l7 + 0x58]
	andncc	%i4,	%o6,	%l5
	umulcc	%l2,	0x0966,	%o7
	array32	%l3,	%l4,	%g6
	fmovde	%icc,	%f3,	%f23
	movcc	%xcc,	%o2,	%l0
	udivx	%g5,	0x139E,	%o1
	udivcc	%l1,	0x1E7A,	%i1
	edge32ln	%o5,	%g2,	%i5
	srlx	%o3,	0x07,	%l6
	sth	%o0,	[%l7 + 0x5A]
	ldd	[%l7 + 0x40],	%f30
	ldd	[%l7 + 0x18],	%i0
	fmovsleu	%xcc,	%f30,	%f9
	fmovrslz	%g1,	%f2,	%f15
	siam	0x1
	movre	%i3,	%g3,	%i2
	ldsh	[%l7 + 0x56],	%o4
	edge8l	%i7,	%i6,	%g4
	fmul8x16au	%f15,	%f18,	%f0
	addc	%g7,	%o6,	%i4
	ldd	[%l7 + 0x18],	%f12
	ldsh	[%l7 + 0x5E],	%l5
	sethi	0x12E1,	%o7
	save %l2, 0x1D81, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f9,	%f1
	edge8ln	%l3,	%o2,	%g6
	fmovdleu	%icc,	%f21,	%f31
	fmuld8sux16	%f12,	%f9,	%f10
	ldsb	[%l7 + 0x71],	%g5
	fcmpd	%fcc2,	%f24,	%f26
	edge8	%o1,	%l0,	%i1
	fmovdleu	%icc,	%f1,	%f22
	fcmpne32	%f14,	%f22,	%l1
	or	%o5,	%g2,	%o3
	fxnors	%f5,	%f23,	%f8
	xorcc	%l6,	0x0642,	%o0
	edge32ln	%i5,	%g1,	%i0
	st	%f30,	[%l7 + 0x28]
	fornot2s	%f1,	%f25,	%f24
	edge32ln	%g3,	%i2,	%o4
	fandnot1	%f2,	%f10,	%f12
	fmovrsgez	%i7,	%f21,	%f16
	sth	%i3,	[%l7 + 0x22]
	umulcc	%g4,	0x0E49,	%i6
	edge32l	%g7,	%o6,	%l5
	movcs	%icc,	%o7,	%l2
	addccc	%l4,	0x0983,	%i4
	umulcc	%l3,	0x0984,	%g6
	movleu	%xcc,	%o2,	%g5
	movpos	%xcc,	%o1,	%i1
	fmul8sux16	%f28,	%f12,	%f30
	fpsub32	%f30,	%f16,	%f18
	stx	%l1,	[%l7 + 0x08]
	lduw	[%l7 + 0x60],	%o5
	andncc	%l0,	%o3,	%l6
	sdivx	%o0,	0x04C2,	%i5
	movvs	%xcc,	%g1,	%g2
	smul	%i0,	%i2,	%g3
	smulcc	%o4,	%i3,	%i7
	lduw	[%l7 + 0x70],	%i6
	movneg	%icc,	%g7,	%g4
	smulcc	%l5,	0x10A9,	%o7
	umulcc	%l2,	0x0C7D,	%l4
	or	%o6,	%l3,	%i4
	ldub	[%l7 + 0x67],	%o2
	sll	%g5,	%o1,	%g6
	nop
	set	0x61, %i2
	stb	%l1,	[%l7 + %i2]
	sllx	%o5,	%i1,	%o3
	fmovdgu	%xcc,	%f21,	%f2
	subcc	%l6,	%l0,	%i5
	and	%g1,	%g2,	%o0
	sub	%i2,	0x14A1,	%i0
	ldsh	[%l7 + 0x46],	%o4
	fmovrslez	%i3,	%f28,	%f5
	fmovsneg	%icc,	%f27,	%f0
	ldsw	[%l7 + 0x08],	%g3
	movrlez	%i6,	0x3C6,	%i7
	alignaddrl	%g7,	%l5,	%o7
	fcmpgt32	%f14,	%f24,	%g4
	movrlz	%l2,	0x3A1,	%l4
	mulx	%o6,	0x0E0D,	%l3
	ldub	[%l7 + 0x56],	%o2
	movcs	%xcc,	%i4,	%g5
	fandnot1s	%f21,	%f25,	%f24
	move	%icc,	%g6,	%o1
	fxnor	%f30,	%f6,	%f16
	smulcc	%l1,	0x0477,	%i1
	fxors	%f15,	%f0,	%f22
	srax	%o5,	%o3,	%l6
	edge16ln	%i5,	%g1,	%g2
	xor	%l0,	0x1CA2,	%o0
	fmovsvc	%icc,	%f17,	%f5
	mulx	%i2,	%i0,	%i3
	edge16	%o4,	%i6,	%i7
	stx	%g3,	[%l7 + 0x68]
	fpadd16s	%f22,	%f17,	%f5
	ldd	[%l7 + 0x20],	%l4
	orcc	%o7,	0x1B2A,	%g7
	xnor	%g4,	0x1F52,	%l4
	sdivx	%o6,	0x0559,	%l3
	and	%l2,	%o2,	%i4
	movre	%g6,	0x2A1,	%g5
	sdivcc	%l1,	0x102F,	%o1
	fmovrdne	%i1,	%f10,	%f14
	and	%o3,	%o5,	%i5
	udiv	%l6,	0x0A13,	%g1
	fmovrsgez	%g2,	%f4,	%f25
	srl	%l0,	0x19,	%i2
	edge16l	%i0,	%o0,	%i3
	fmovrdgez	%o4,	%f4,	%f4
	ldsb	[%l7 + 0x6D],	%i7
	fpmerge	%f4,	%f7,	%f4
	sub	%i6,	%l5,	%g3
	movcs	%xcc,	%o7,	%g7
	fandnot2s	%f10,	%f30,	%f9
	fabss	%f10,	%f21
	fpadd16s	%f17,	%f24,	%f9
	udivcc	%g4,	0x0E92,	%o6
	fzero	%f10
	std	%f6,	[%l7 + 0x48]
	xor	%l4,	%l2,	%o2
	fmovrse	%l3,	%f11,	%f26
	fmovspos	%icc,	%f11,	%f10
	fmovsle	%icc,	%f4,	%f18
	ld	[%l7 + 0x18],	%f11
	stb	%g6,	[%l7 + 0x53]
	fmovda	%xcc,	%f20,	%f30
	fmovdcc	%icc,	%f30,	%f22
	fornot2s	%f27,	%f14,	%f21
	movgu	%xcc,	%i4,	%l1
	orncc	%o1,	0x1A1F,	%i1
	sdiv	%g5,	0x00EB,	%o3
	fcmpne16	%f24,	%f26,	%o5
	edge32l	%l6,	%g1,	%i5
	movpos	%icc,	%g2,	%l0
	fmovdcc	%icc,	%f17,	%f27
	ldsh	[%l7 + 0x2C],	%i0
	movrne	%i2,	0x013,	%i3
	orn	%o4,	%o0,	%i6
	fnot1	%f8,	%f18
	movrlz	%i7,	%l5,	%o7
	fexpand	%f30,	%f14
	sethi	0x0405,	%g7
	fmovdle	%icc,	%f23,	%f8
	array8	%g3,	%o6,	%g4
	subc	%l4,	%o2,	%l3
	xnorcc	%l2,	0x1868,	%i4
	orn	%l1,	0x0B7F,	%o1
	ldsh	[%l7 + 0x5E],	%i1
	movle	%icc,	%g5,	%o3
	mulscc	%o5,	%l6,	%g1
	edge16l	%g6,	%g2,	%l0
	edge8n	%i5,	%i2,	%i0
	restore %i3, 0x06E6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%i6,	%i7
	popc	0x010D,	%l5
	movcc	%icc,	%o7,	%g7
	xnor	%g3,	%o0,	%o6
	array32	%g4,	%l4,	%o2
	stw	%l2,	[%l7 + 0x20]
	sll	%l3,	%l1,	%o1
	array16	%i1,	%i4,	%g5
	movcs	%icc,	%o5,	%o3
	udivx	%g1,	0x1F3B,	%g6
	smulcc	%g2,	%l0,	%l6
	movge	%icc,	%i2,	%i5
	sethi	0x1675,	%i3
	edge8ln	%i0,	%o4,	%i6
	fornot1	%f20,	%f24,	%f20
	edge8l	%l5,	%i7,	%g7
	edge32l	%g3,	%o7,	%o0
	and	%g4,	0x13BA,	%l4
	alignaddr	%o2,	%o6,	%l3
	movcc	%icc,	%l1,	%l2
	subc	%i1,	%i4,	%g5
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	fmovdn	%xcc,	%f24,	%f31
	movle	%icc,	%o3,	%g6
	fpadd16	%f16,	%f16,	%f0
	edge32	%g2,	%g1,	%l0
	fandnot2s	%f0,	%f22,	%f5
	fmovse	%xcc,	%f8,	%f20
	ldub	[%l7 + 0x3F],	%l6
	smulcc	%i2,	%i3,	%i5
	nop
	set	0x46, %g2
	ldsh	[%l7 + %g2],	%i0
	array32	%o4,	%i6,	%i7
	fmovrdlz	%l5,	%f18,	%f0
	movrlez	%g7,	%o7,	%o0
	fmovscs	%xcc,	%f16,	%f10
	sir	0x013C
	addc	%g4,	%g3,	%o2
	fnot2s	%f13,	%f9
	movrgez	%l4,	%l3,	%o6
	movg	%xcc,	%l1,	%l2
	movvc	%xcc,	%i4,	%g5
	udivx	%i1,	0x0B95,	%o1
	fmovdleu	%xcc,	%f22,	%f19
	stw	%o3,	[%l7 + 0x20]
	move	%xcc,	%g6,	%g2
	smul	%o5,	%l0,	%g1
	srl	%l6,	%i3,	%i2
	sllx	%i0,	0x15,	%i5
	fmovrslez	%o4,	%f13,	%f5
	smulcc	%i6,	%i7,	%g7
	array8	%l5,	%o0,	%o7
	udivcc	%g3,	0x161B,	%g4
	fcmpne16	%f12,	%f4,	%o2
	sll	%l4,	0x0B,	%o6
	udivx	%l3,	0x163C,	%l1
	save %l2, 0x1894, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g5,	%o1
	fcmps	%fcc2,	%f30,	%f18
	edge32n	%i1,	%o3,	%g6
	fmovsgu	%xcc,	%f31,	%f24
	fmul8x16al	%f18,	%f11,	%f30
	sra	%g2,	0x0F,	%l0
	fornot1	%f8,	%f26,	%f0
	movne	%icc,	%o5,	%g1
	mulscc	%i3,	0x13DB,	%l6
	fmovsn	%icc,	%f27,	%f8
	movrgez	%i2,	%i5,	%i0
	fpmerge	%f18,	%f24,	%f18
	fnot1	%f20,	%f22
	fmovrdgez	%i6,	%f4,	%f28
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%o4
	edge32	%i7,	%g7,	%o0
	smul	%o7,	%g3,	%g4
	lduh	[%l7 + 0x42],	%l5
	movrgz	%o2,	%o6,	%l4
	smulcc	%l3,	%l1,	%i4
	xnor	%l2,	0x1046,	%g5
	fmovrsgz	%i1,	%f0,	%f18
	srax	%o3,	%g6,	%g2
	edge16l	%o1,	%l0,	%o5
	save %i3, %l6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i5,	%i2,	%i6
	restore %o4, %i7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%i0,	%f28,	%f26
	movleu	%xcc,	%o0,	%o7
	fmovrdgz	%g3,	%f26,	%f0
	st	%f0,	[%l7 + 0x70]
	movcc	%icc,	%l5,	%o2
	mulx	%g4,	%o6,	%l4
	fmovscc	%icc,	%f3,	%f11
	fmovdvs	%icc,	%f14,	%f18
	fmovdcs	%icc,	%f12,	%f18
	subcc	%l1,	%i4,	%l3
	array16	%l2,	%i1,	%g5
	fcmped	%fcc0,	%f0,	%f26
	srax	%o3,	%g2,	%o1
	andcc	%g6,	0x0AC8,	%l0
	edge8	%o5,	%i3,	%l6
	movre	%g1,	%i5,	%i6
	addcc	%i2,	%o4,	%i7
	movcs	%xcc,	%g7,	%o0
	edge8l	%o7,	%i0,	%l5
	movleu	%icc,	%g3,	%g4
	xnorcc	%o6,	%o2,	%l1
	mulscc	%l4,	0x1A74,	%i4
	xnorcc	%l3,	0x1C6B,	%i1
	array16	%g5,	%o3,	%g2
	fmovrsne	%l2,	%f13,	%f13
	movne	%icc,	%o1,	%l0
	fmovs	%f2,	%f3
	st	%f9,	[%l7 + 0x3C]
	andcc	%o5,	%g6,	%l6
	ldub	[%l7 + 0x38],	%i3
	orncc	%i5,	%g1,	%i6
	orn	%o4,	0x055D,	%i7
	fmovrsgz	%i2,	%f13,	%f14
	fmovrsne	%g7,	%f12,	%f14
	stx	%o7,	[%l7 + 0x48]
	srlx	%o0,	0x12,	%i0
	srlx	%l5,	0x09,	%g3
	nop
	set	0x64, %g6
	stw	%o6,	[%l7 + %g6]
	ldsb	[%l7 + 0x09],	%o2
	mova	%xcc,	%l1,	%l4
	fxnors	%f9,	%f9,	%f24
	fmovscc	%icc,	%f14,	%f14
	sllx	%i4,	0x01,	%l3
	lduh	[%l7 + 0x3E],	%i1
	orn	%g5,	0x1836,	%g4
	mulscc	%g2,	0x1E1E,	%l2
	stw	%o3,	[%l7 + 0x48]
	stw	%o1,	[%l7 + 0x38]
	sethi	0x1F17,	%l0
	smul	%o5,	0x000D,	%l6
	fcmps	%fcc1,	%f26,	%f19
	orncc	%i3,	0x1835,	%g6
	ldsw	[%l7 + 0x40],	%g1
	edge16ln	%i6,	%i5,	%i7
	subcc	%o4,	%g7,	%i2
	fmovscc	%icc,	%f11,	%f23
	srlx	%o0,	%i0,	%l5
	fmovdcs	%icc,	%f5,	%f28
	fmul8sux16	%f8,	%f20,	%f10
	fornot1	%f10,	%f26,	%f28
	movrlz	%o7,	%g3,	%o6
	fmovsvs	%icc,	%f4,	%f27
	movpos	%icc,	%l1,	%o2
	subccc	%i4,	%l4,	%i1
	movrlz	%g5,	0x28E,	%l3
	edge16l	%g2,	%l2,	%g4
	edge16l	%o1,	%l0,	%o5
	fcmpeq16	%f28,	%f12,	%l6
	edge16n	%i3,	%o3,	%g1
	fmul8sux16	%f2,	%f12,	%f22
	sub	%i6,	0x0510,	%g6
	save %i5, 0x0197, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o4,	%i2,	%g7
	ldx	[%l7 + 0x30],	%i0
	sllx	%o0,	0x12,	%o7
	fzero	%f22
	or	%l5,	%o6,	%g3
	edge16n	%o2,	%l1,	%l4
	movgu	%icc,	%i4,	%i1
	xnorcc	%l3,	%g2,	%l2
	fmul8x16	%f16,	%f16,	%f8
	movle	%xcc,	%g5,	%o1
	fmovrslz	%g4,	%f13,	%f23
	save %o5, %l0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i3,	%o3
	srlx	%g1,	0x0C,	%i6
	fnegd	%f10,	%f8
	movgu	%icc,	%i5,	%g6
	movrlez	%o4,	0x181,	%i2
	movcs	%icc,	%g7,	%i7
	xnor	%o0,	0x1E53,	%i0
	sdivx	%l5,	0x0B78,	%o6
	and	%o7,	0x182A,	%o2
	move	%xcc,	%l1,	%l4
	sethi	0x055C,	%i4
	ldd	[%l7 + 0x10],	%f18
	for	%f14,	%f0,	%f10
	movrlez	%i1,	%g3,	%l3
	nop
	set	0x20, %g1
	ldx	[%l7 + %g1],	%g2
	fzero	%f4
	andn	%g5,	%l2,	%g4
	udivx	%o1,	0x1EB9,	%o5
	sdivcc	%l6,	0x0840,	%l0
	andcc	%i3,	0x1398,	%o3
	umulcc	%g1,	%i6,	%g6
	fmovdcs	%icc,	%f18,	%f0
	edge16l	%i5,	%o4,	%g7
	fmul8x16	%f14,	%f12,	%f28
	lduh	[%l7 + 0x70],	%i2
	popc	0x154C,	%i7
	xor	%i0,	0x14C1,	%o0
	fabss	%f10,	%f7
	srlx	%l5,	%o6,	%o2
	fnot1	%f30,	%f12
	edge32n	%o7,	%l4,	%i4
	fmovsge	%xcc,	%f24,	%f14
	sra	%l1,	%i1,	%l3
	std	%f30,	[%l7 + 0x30]
	fmovrsgez	%g3,	%f12,	%f2
	sethi	0x04A4,	%g5
	fcmpne32	%f12,	%f24,	%g2
	fand	%f30,	%f4,	%f8
	movrgz	%g4,	0x150,	%o1
	lduh	[%l7 + 0x1E],	%l2
	edge32ln	%l6,	%o5,	%i3
	fpack32	%f4,	%f30,	%f16
	edge32l	%o3,	%l0,	%i6
	movvc	%xcc,	%g6,	%g1
	sdivx	%o4,	0x0E07,	%g7
	sth	%i2,	[%l7 + 0x52]
	addc	%i5,	%i0,	%i7
	addcc	%l5,	%o0,	%o6
	fornot2s	%f27,	%f13,	%f22
	subcc	%o2,	0x1891,	%o7
	mulx	%i4,	0x1472,	%l4
	movvs	%xcc,	%i1,	%l1
	fmuld8sux16	%f0,	%f5,	%f30
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	nop
	set	0x30, %l5
	stx	%g3,	[%l7 + %l5]
	edge32n	%g4,	%l2,	%l6
	edge8	%o1,	%i3,	%o5
	fandnot1s	%f24,	%f22,	%f9
	udiv	%l0,	0x09E9,	%i6
	fmovdvs	%xcc,	%f30,	%f30
	movrne	%g6,	0x390,	%g1
	ldd	[%l7 + 0x38],	%o4
	fmovrdne	%o3,	%f0,	%f22
	edge8	%i2,	%i5,	%g7
	edge16	%i7,	%l5,	%o0
	orn	%i0,	0x072E,	%o2
	sdivx	%o7,	0x1ADB,	%i4
	sdiv	%l4,	0x0412,	%o6
	andcc	%i1,	0x184B,	%l1
	orn	%l3,	%g2,	%g5
	fnot2s	%f26,	%f18
	edge32ln	%g4,	%l2,	%l6
	movre	%o1,	%i3,	%g3
	ldd	[%l7 + 0x40],	%f22
	sra	%l0,	0x0F,	%i6
	sdivcc	%g6,	0x050A,	%g1
	sub	%o5,	0x1F63,	%o4
	movrgez	%i2,	%i5,	%o3
	edge8l	%g7,	%i7,	%o0
	nop
	set	0x38, %l3
	stw	%i0,	[%l7 + %l3]
	movge	%xcc,	%o2,	%l5
	fmul8ulx16	%f30,	%f18,	%f22
	movvs	%xcc,	%i4,	%l4
	stw	%o6,	[%l7 + 0x18]
	movpos	%icc,	%o7,	%i1
	fcmpes	%fcc0,	%f31,	%f25
	sethi	0x12BF,	%l1
	edge32ln	%g2,	%g5,	%g4
	fcmped	%fcc2,	%f14,	%f4
	srl	%l3,	%l6,	%o1
	movle	%icc,	%l2,	%i3
	edge8l	%l0,	%g3,	%g6
	move	%icc,	%g1,	%o5
	edge8l	%i6,	%o4,	%i2
	mulx	%o3,	%g7,	%i5
	ldd	[%l7 + 0x60],	%o0
	stb	%i0,	[%l7 + 0x0E]
	fmul8sux16	%f16,	%f8,	%f8
	std	%f26,	[%l7 + 0x28]
	sth	%i7,	[%l7 + 0x7E]
	ldd	[%l7 + 0x50],	%l4
	sethi	0x1486,	%o2
	edge32n	%i4,	%l4,	%o7
	edge8l	%o6,	%i1,	%l1
	mulscc	%g5,	%g4,	%g2
	fandnot1	%f10,	%f6,	%f8
	movpos	%icc,	%l6,	%l3
	edge8l	%l2,	%o1,	%i3
	ldsb	[%l7 + 0x2B],	%g3
	fsrc2	%f20,	%f4
	movgu	%xcc,	%g6,	%l0
	subcc	%o5,	0x1907,	%g1
	srl	%o4,	%i6,	%i2
	movcs	%xcc,	%o3,	%g7
	ldsh	[%l7 + 0x3A],	%i5
	fmovdle	%xcc,	%f21,	%f19
	umul	%o0,	0x0876,	%i0
	array16	%i7,	%o2,	%l5
	addc	%i4,	0x0C9A,	%l4
	fone	%f10
	movn	%xcc,	%o7,	%i1
	movcc	%icc,	%o6,	%g5
	movne	%icc,	%l1,	%g2
	udivx	%l6,	0x11E8,	%g4
	fmovdcs	%xcc,	%f31,	%f29
	movgu	%icc,	%l2,	%l3
	smul	%o1,	0x0CCF,	%g3
	fmovdn	%icc,	%f25,	%f28
	edge8n	%g6,	%l0,	%i3
	orn	%o5,	%o4,	%i6
	udivx	%g1,	0x155D,	%o3
	movvs	%icc,	%i2,	%i5
	nop
	set	0x74, %l2
	lduh	[%l7 + %l2],	%g7
	sllx	%o0,	0x13,	%i0
	array16	%o2,	%l5,	%i7
	stx	%i4,	[%l7 + 0x78]
	fmovs	%f21,	%f30
	ldx	[%l7 + 0x20],	%o7
	movrgez	%l4,	0x299,	%o6
	ldub	[%l7 + 0x6A],	%i1
	sethi	0x07E7,	%g5
	fmuld8sux16	%f2,	%f30,	%f22
	fcmpgt16	%f26,	%f20,	%l1
	ldx	[%l7 + 0x18],	%l6
	movleu	%xcc,	%g2,	%g4
	fnegs	%f16,	%f1
	movcs	%icc,	%l2,	%o1
	array32	%l3,	%g6,	%l0
	edge8	%i3,	%o5,	%g3
	edge8ln	%o4,	%g1,	%o3
	sdivx	%i6,	0x1B35,	%i5
	pdist	%f18,	%f30,	%f16
	alignaddr	%i2,	%o0,	%i0
	sir	0x07B4
	alignaddrl	%o2,	%g7,	%l5
	fmovdn	%icc,	%f27,	%f7
	edge32n	%i4,	%i7,	%l4
	lduw	[%l7 + 0x0C],	%o7
	fandnot1s	%f23,	%f0,	%f29
	alignaddrl	%o6,	%g5,	%i1
	srl	%l6,	0x0B,	%g2
	sdivx	%l1,	0x11D5,	%l2
	orn	%o1,	%l3,	%g4
	fmuld8sux16	%f5,	%f8,	%f8
	edge8l	%g6,	%l0,	%i3
	sir	0x13F4
	subcc	%g3,	%o5,	%g1
	siam	0x0
	fmovdn	%icc,	%f25,	%f8
	edge16	%o3,	%o4,	%i5
	fxor	%f14,	%f22,	%f30
	fnot2	%f12,	%f4
	sra	%i2,	%i6,	%i0
	mulx	%o0,	0x0FFD,	%o2
	movg	%xcc,	%g7,	%i4
	movle	%xcc,	%i7,	%l5
	fandnot1	%f26,	%f14,	%f6
	subc	%l4,	%o7,	%o6
	fmovdn	%xcc,	%f16,	%f30
	movgu	%xcc,	%i1,	%l6
	fandnot2s	%f26,	%f16,	%f17
	subc	%g5,	0x1461,	%g2
	fnands	%f7,	%f29,	%f16
	edge16	%l2,	%l1,	%o1
	ldx	[%l7 + 0x70],	%l3
	xnor	%g4,	%l0,	%g6
	or	%i3,	%g3,	%g1
	movrgz	%o5,	0x34B,	%o3
	fpadd32s	%f24,	%f22,	%f7
	smul	%i5,	0x0A2D,	%o4
	fmovdcc	%xcc,	%f18,	%f24
	movrgez	%i6,	%i2,	%o0
	alignaddr	%i0,	%g7,	%o2
	ldub	[%l7 + 0x6F],	%i7
	edge32ln	%l5,	%i4,	%l4
	array16	%o6,	%i1,	%o7
	fandnot1	%f10,	%f18,	%f30
	ldd	[%l7 + 0x08],	%f24
	udiv	%g5,	0x08EC,	%g2
	movl	%xcc,	%l2,	%l1
	sdivcc	%l6,	0x09E0,	%o1
	sll	%l3,	0x0B,	%l0
	alignaddr	%g4,	%i3,	%g3
	movn	%xcc,	%g1,	%g6
	sdiv	%o5,	0x0F66,	%i5
	edge32n	%o3,	%i6,	%i2
	sth	%o0,	[%l7 + 0x4A]
	edge8l	%o4,	%i0,	%o2
	lduh	[%l7 + 0x16],	%i7
	movneg	%icc,	%g7,	%l5
	fmovrde	%i4,	%f0,	%f14
	movle	%xcc,	%o6,	%l4
	addcc	%o7,	0x026B,	%g5
	movre	%g2,	%l2,	%i1
	ld	[%l7 + 0x18],	%f9
	fmovdvc	%xcc,	%f28,	%f27
	smulcc	%l6,	0x0146,	%o1
	movrlez	%l3,	0x0B7,	%l1
	array8	%l0,	%i3,	%g3
	movrlz	%g4,	0x336,	%g6
	edge8	%g1,	%o5,	%i5
	stw	%o3,	[%l7 + 0x48]
	edge32ln	%i2,	%i6,	%o0
	fpmerge	%f30,	%f15,	%f24
	movcs	%xcc,	%o4,	%i0
	srlx	%i7,	%g7,	%o2
	sllx	%i4,	0x14,	%o6
	ldd	[%l7 + 0x78],	%l4
	st	%f14,	[%l7 + 0x70]
	fand	%f2,	%f24,	%f10
	mulscc	%l5,	%o7,	%g2
	ldsb	[%l7 + 0x20],	%g5
	edge32	%l2,	%i1,	%o1
	edge8	%l3,	%l1,	%l0
	move	%icc,	%i3,	%l6
	save %g4, %g3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f17,	%f31
	udivx	%o5,	0x168B,	%i5
	ldsw	[%l7 + 0x58],	%g6
	movvc	%icc,	%i2,	%o3
	movpos	%icc,	%i6,	%o0
	edge32ln	%o4,	%i0,	%g7
	movrlz	%i7,	%o2,	%o6
	umul	%i4,	%l4,	%l5
	movrgez	%o7,	0x0FD,	%g2
	movre	%l2,	0x127,	%g5
	fmul8ulx16	%f30,	%f8,	%f0
	udiv	%o1,	0x0A0B,	%i1
	sdivcc	%l3,	0x14C9,	%l1
	restore %l0, %i3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g3,	%g1
	andcc	%o5,	0x174A,	%g4
	udivx	%g6,	0x1DD8,	%i5
	srl	%i2,	%o3,	%o0
	movleu	%xcc,	%i6,	%i0
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	alignaddrl	%o4,	%o6,	%i4
	and	%o2,	%l4,	%o7
	mulscc	%g2,	0x1814,	%l2
	fmovrdne	%l5,	%f0,	%f12
	edge16	%g5,	%o1,	%l3
	fcmpd	%fcc1,	%f8,	%f26
	edge32ln	%i1,	%l0,	%i3
	restore %l1, 0x1054, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%g1,	%l6
	edge8n	%o5,	%g4,	%i5
	movrlez	%i2,	%g6,	%o0
	movge	%xcc,	%o3,	%i6
	ldx	[%l7 + 0x40],	%i0
	save %g7, 0x07CD, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o6,	%i4,	%o2
	edge16l	%l4,	%i7,	%g2
	orncc	%l2,	%l5,	%o7
	save %o1, %l3, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i1,	0x0F46,	%l0
	movvs	%icc,	%l1,	%i3
	andncc	%g3,	%l6,	%g1
	fcmple16	%f8,	%f28,	%g4
	fpsub32	%f30,	%f14,	%f10
	fcmpeq16	%f0,	%f10,	%o5
	alignaddrl	%i2,	%i5,	%g6
	umulcc	%o3,	%i6,	%i0
	fmovdcc	%xcc,	%f27,	%f19
	edge16l	%o0,	%g7,	%o4
	fmovrdlez	%o6,	%f2,	%f16
	srl	%o2,	0x17,	%l4
	movrlez	%i4,	%g2,	%l2
	fornot2	%f24,	%f22,	%f20
	ldd	[%l7 + 0x58],	%i6
	fpsub16	%f4,	%f2,	%f12
	umulcc	%l5,	0x012C,	%o1
	sdivcc	%o7,	0x0970,	%g5
	xor	%i1,	0x1502,	%l0
	fmovdl	%xcc,	%f6,	%f20
	movrgz	%l3,	%l1,	%g3
	and	%l6,	%i3,	%g1
	edge16ln	%o5,	%i2,	%i5
	fmovscs	%xcc,	%f1,	%f15
	sdivx	%g6,	0x0BEB,	%o3
	movn	%icc,	%g4,	%i6
	andn	%o0,	0x04A8,	%i0
	stw	%o4,	[%l7 + 0x48]
	fmovsle	%xcc,	%f25,	%f28
	edge32	%o6,	%o2,	%l4
	fmul8x16al	%f20,	%f10,	%f0
	move	%xcc,	%g7,	%g2
	xorcc	%l2,	0x0392,	%i7
	sir	0x08C9
	lduw	[%l7 + 0x08],	%i4
	bshuffle	%f0,	%f28,	%f24
	sra	%o1,	%o7,	%l5
	subccc	%g5,	0x0A29,	%i1
	andn	%l0,	%l3,	%g3
	xorcc	%l1,	0x1EBA,	%i3
	nop
	set	0x58, %i0
	ldd	[%l7 + %i0],	%g0
	fmovdcc	%xcc,	%f22,	%f9
	movle	%xcc,	%o5,	%l6
	fpadd32s	%f28,	%f13,	%f23
	array8	%i2,	%i5,	%g6
	fpadd32s	%f24,	%f4,	%f18
	ld	[%l7 + 0x58],	%f11
	andncc	%o3,	%i6,	%g4
	andcc	%i0,	%o4,	%o6
	subccc	%o0,	%o2,	%g7
	movre	%g2,	0x317,	%l4
	fmovdn	%xcc,	%f7,	%f28
	popc	0x14B3,	%l2
	srlx	%i7,	%i4,	%o7
	st	%f30,	[%l7 + 0x58]
	ldsb	[%l7 + 0x64],	%l5
	sdivcc	%g5,	0x1869,	%o1
	orncc	%i1,	0x14BC,	%l0
	sll	%g3,	0x17,	%l1
	edge16	%i3,	%l3,	%g1
	popc	%l6,	%o5
	ldd	[%l7 + 0x78],	%i2
	array32	%g6,	%i5,	%i6
	fmovdne	%xcc,	%f10,	%f20
	mulscc	%o3,	%i0,	%o4
	sdivx	%o6,	0x11AE,	%o0
	ldd	[%l7 + 0x30],	%o2
	fnot1s	%f19,	%f6
	move	%icc,	%g7,	%g2
	array16	%l4,	%l2,	%i7
	srlx	%g4,	%i4,	%o7
	fcmpeq32	%f22,	%f2,	%l5
	ldd	[%l7 + 0x10],	%g4
	sdiv	%o1,	0x0404,	%l0
	movgu	%icc,	%i1,	%l1
	movge	%xcc,	%g3,	%i3
	array8	%l3,	%l6,	%g1
	ldx	[%l7 + 0x18],	%i2
	umul	%g6,	0x06C8,	%i5
	fors	%f31,	%f14,	%f28
	ldsw	[%l7 + 0x70],	%i6
	subccc	%o5,	0x1A17,	%i0
	or	%o3,	%o4,	%o6
	udivx	%o0,	0x06A0,	%g7
	sra	%g2,	0x05,	%l4
	xnorcc	%o2,	%i7,	%g4
	sth	%i4,	[%l7 + 0x12]
	fmovdge	%xcc,	%f0,	%f4
	udivcc	%l2,	0x1D1F,	%l5
	orcc	%g5,	0x1C05,	%o7
	edge16	%l0,	%o1,	%l1
	fmovdl	%xcc,	%f18,	%f1
	movg	%icc,	%g3,	%i1
	edge16ln	%i3,	%l3,	%g1
	orcc	%i2,	0x12BB,	%g6
	movl	%xcc,	%l6,	%i6
	udivcc	%i5,	0x196F,	%i0
	edge32	%o5,	%o3,	%o6
	st	%f11,	[%l7 + 0x7C]
	subccc	%o4,	0x0585,	%o0
	fmovse	%icc,	%f21,	%f20
	umulcc	%g2,	0x043D,	%l4
	edge8ln	%o2,	%i7,	%g4
	sdivcc	%g7,	0x17FF,	%i4
	xor	%l5,	%l2,	%g5
	movvc	%xcc,	%o7,	%o1
	fnegs	%f10,	%f14
	fmuld8ulx16	%f16,	%f18,	%f0
	movneg	%icc,	%l0,	%g3
	sdiv	%i1,	0x0DC8,	%l1
	movvc	%icc,	%i3,	%g1
	array32	%i2,	%g6,	%l3
	fnot2s	%f11,	%f9
	movrlz	%l6,	%i5,	%i0
	udivx	%o5,	0x188D,	%i6
	fpadd32	%f24,	%f30,	%f14
	fmovscs	%xcc,	%f8,	%f2
	movn	%icc,	%o3,	%o6
	fpsub16s	%f15,	%f16,	%f12
	ldx	[%l7 + 0x28],	%o4
	movrlz	%g2,	%l4,	%o0
	movge	%icc,	%o2,	%g4
	move	%xcc,	%g7,	%i7
	movrgz	%l5,	%l2,	%i4
	nop
	set	0x14, %i7
	ldsh	[%l7 + %i7],	%g5
	sll	%o1,	0x08,	%o7
	movneg	%icc,	%g3,	%i1
	array16	%l0,	%l1,	%i3
	movn	%xcc,	%i2,	%g1
	movvc	%icc,	%g6,	%l3
	sdivcc	%l6,	0x0185,	%i0
	udiv	%i5,	0x09B7,	%o5
	fpsub32	%f0,	%f18,	%f18
	movge	%icc,	%o3,	%o6
	nop
	set	0x08, %o0
	lduw	[%l7 + %o0],	%o4
	edge8ln	%g2,	%i6,	%o0
	addccc	%o2,	0x0CEF,	%l4
	udiv	%g7,	0x0F83,	%i7
	fmovrde	%l5,	%f10,	%f16
	edge16ln	%g4,	%l2,	%i4
	movrlz	%g5,	0x041,	%o7
	fcmpd	%fcc3,	%f10,	%f10
	fmovdgu	%icc,	%f12,	%f9
	fmul8x16al	%f25,	%f11,	%f4
	fmovrdgz	%g3,	%f22,	%f4
	movvs	%xcc,	%i1,	%o1
	array32	%l0,	%i3,	%l1
	ldsb	[%l7 + 0x3D],	%i2
	sdiv	%g6,	0x0A59,	%l3
	sra	%g1,	%l6,	%i5
	movgu	%icc,	%o5,	%i0
	movneg	%icc,	%o3,	%o6
	addc	%o4,	%i6,	%g2
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	sth	%g7,	[%l7 + 0x08]
	mova	%xcc,	%i7,	%g4
	movl	%xcc,	%l5,	%l2
	move	%xcc,	%g5,	%i4
	addccc	%g3,	%o7,	%o1
	sethi	0x1758,	%i1
	sdivcc	%i3,	0x058A,	%l0
	pdist	%f28,	%f2,	%f16
	fmovdpos	%icc,	%f9,	%f16
	fmovd	%f28,	%f8
	mulx	%i2,	0x1F69,	%g6
	movneg	%icc,	%l3,	%g1
	fsrc2s	%f19,	%f9
	sir	0x18EA
	save %l6, %i5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l1,	%o3,	%o6
	fmovsle	%xcc,	%f29,	%f14
	ldub	[%l7 + 0x7A],	%o4
	fpadd16	%f30,	%f8,	%f26
	srl	%i6,	%g2,	%i0
	sdivcc	%o2,	0x0DD0,	%l4
	restore %g7, %o0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l5,	0x12E3,	%l2
	lduh	[%l7 + 0x70],	%g5
	sdivcc	%i7,	0x17E5,	%i4
	movn	%xcc,	%o7,	%o1
	ldub	[%l7 + 0x26],	%g3
	movvc	%icc,	%i1,	%i3
	fxors	%f13,	%f27,	%f7
	sllx	%l0,	%i2,	%l3
	subc	%g6,	0x10EF,	%l6
	movgu	%icc,	%i5,	%o5
	subccc	%l1,	0x0697,	%o3
	st	%f2,	[%l7 + 0x34]
	movne	%xcc,	%o6,	%g1
	udiv	%i6,	0x09B2,	%g2
	smulcc	%i0,	0x166E,	%o4
	fmovrdlez	%l4,	%f8,	%f10
	movvc	%icc,	%g7,	%o2
	edge16	%g4,	%l5,	%l2
	array8	%o0,	%g5,	%i4
	orncc	%i7,	%o7,	%g3
	movgu	%xcc,	%i1,	%o1
	fmovrsne	%i3,	%f7,	%f7
	movre	%l0,	%i2,	%g6
	andncc	%l3,	%i5,	%l6
	st	%f22,	[%l7 + 0x48]
	addccc	%l1,	0x0B5E,	%o5
	udiv	%o3,	0x0B37,	%g1
	movle	%xcc,	%i6,	%o6
	nop
	set	0x40, %g3
	ldsw	[%l7 + %g3],	%g2
	fmovda	%icc,	%f8,	%f14
	movg	%xcc,	%i0,	%o4
	fmovdl	%xcc,	%f28,	%f18
	addc	%l4,	0x19E9,	%g7
	sethi	0x1562,	%o2
	fnor	%f24,	%f20,	%f22
	movcc	%xcc,	%g4,	%l2
	orcc	%o0,	0x0308,	%l5
	sth	%i4,	[%l7 + 0x12]
	alignaddrl	%i7,	%g5,	%o7
	ldd	[%l7 + 0x18],	%f28
	ldub	[%l7 + 0x6B],	%i1
	sdivx	%o1,	0x1C22,	%g3
	fpsub16s	%f1,	%f11,	%f30
	orn	%i3,	%l0,	%g6
	addc	%l3,	%i2,	%i5
	fnot2	%f28,	%f24
	siam	0x1
	fmovdvs	%icc,	%f25,	%f29
	edge32n	%l6,	%o5,	%l1
	mulscc	%g1,	0x0B4F,	%i6
	movneg	%xcc,	%o3,	%o6
	sdivcc	%i0,	0x1F89,	%g2
	orncc	%o4,	0x1231,	%l4
	movvc	%icc,	%g7,	%g4
	edge32l	%o2,	%l2,	%o0
	srlx	%l5,	%i7,	%g5
	lduh	[%l7 + 0x4A],	%i4
	movrlz	%i1,	%o7,	%o1
	alignaddrl	%i3,	%l0,	%g6
	addccc	%l3,	%i2,	%g3
	lduw	[%l7 + 0x3C],	%i5
	movge	%icc,	%o5,	%l6
	array32	%g1,	%l1,	%i6
	edge32l	%o6,	%i0,	%o3
	umul	%o4,	%l4,	%g7
	movneg	%xcc,	%g4,	%o2
	movg	%icc,	%l2,	%g2
	fmul8sux16	%f20,	%f6,	%f26
	andcc	%l5,	%i7,	%o0
	sllx	%g5,	%i1,	%o7
	movrlz	%o1,	%i3,	%i4
	movge	%xcc,	%g6,	%l0
	edge8ln	%i2,	%l3,	%i5
	movrgez	%g3,	%o5,	%g1
	movrlz	%l6,	0x313,	%i6
	udivcc	%l1,	0x0CBA,	%o6
	mulx	%i0,	0x00C5,	%o3
	fmuld8sux16	%f8,	%f31,	%f2
	fandnot1s	%f8,	%f24,	%f30
	ldx	[%l7 + 0x60],	%o4
	udivx	%l4,	0x034F,	%g4
	sra	%o2,	%l2,	%g7
	add	%g2,	%l5,	%o0
	andn	%g5,	0x025E,	%i1
	mova	%xcc,	%o7,	%o1
	xorcc	%i7,	0x0667,	%i4
	edge8n	%g6,	%i3,	%i2
	sllx	%l3,	%i5,	%g3
	or	%o5,	%g1,	%l6
	lduh	[%l7 + 0x66],	%l0
	fpsub16	%f8,	%f12,	%f20
	smul	%l1,	0x092F,	%o6
	andncc	%i0,	%i6,	%o4
	fpmerge	%f23,	%f27,	%f26
	stw	%l4,	[%l7 + 0x7C]
	nop
	set	0x32, %i1
	lduh	[%l7 + %i1],	%o3
	subccc	%g4,	0x1E90,	%o2
	fmul8ulx16	%f30,	%f16,	%f20
	movrgz	%g7,	0x067,	%l2
	ldsw	[%l7 + 0x34],	%g2
	movpos	%xcc,	%l5,	%g5
	movre	%i1,	%o0,	%o7
	fpsub32	%f16,	%f26,	%f0
	sub	%i7,	%i4,	%g6
	udivcc	%i3,	0x0CE0,	%i2
	movcs	%icc,	%o1,	%i5
	movge	%icc,	%l3,	%g3
	edge32	%o5,	%g1,	%l6
	sdiv	%l0,	0x173B,	%o6
	movrne	%l1,	0x0D8,	%i6
	fmovrsgz	%i0,	%f31,	%f11
	ldd	[%l7 + 0x60],	%f20
	ldsw	[%l7 + 0x0C],	%o4
	fpackfix	%f12,	%f10
	fmovdcs	%xcc,	%f2,	%f20
	movvc	%icc,	%l4,	%o3
	movneg	%icc,	%g4,	%o2
	ldx	[%l7 + 0x58],	%l2
	and	%g2,	0x0069,	%g7
	fmovdn	%icc,	%f17,	%f22
	fnors	%f10,	%f19,	%f22
	fsrc2s	%f7,	%f15
	fmovdl	%icc,	%f6,	%f21
	movleu	%icc,	%g5,	%l5
	stx	%i1,	[%l7 + 0x60]
	fcmpne32	%f20,	%f24,	%o7
	fmovsg	%icc,	%f19,	%f30
	nop
	set	0x20, %o6
	std	%f12,	[%l7 + %o6]
	fmovscc	%xcc,	%f7,	%f31
	mulscc	%o0,	0x0CCC,	%i4
	movn	%xcc,	%g6,	%i3
	movpos	%icc,	%i7,	%i2
	sth	%i5,	[%l7 + 0x3E]
	stw	%l3,	[%l7 + 0x08]
	st	%f11,	[%l7 + 0x18]
	subcc	%g3,	%o5,	%o1
	fmovsa	%xcc,	%f4,	%f11
	stw	%l6,	[%l7 + 0x44]
	addc	%l0,	0x0C78,	%g1
	orncc	%o6,	0x166F,	%l1
	sdivcc	%i0,	0x12DD,	%i6
	fmovsvc	%xcc,	%f7,	%f24
	lduh	[%l7 + 0x5E],	%o4
	fmovsleu	%icc,	%f14,	%f13
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	move	%icc,	%o2,	%l2
	ld	[%l7 + 0x38],	%f30
	movrgz	%g7,	0x376,	%g2
	ldub	[%l7 + 0x21],	%g5
	popc	%l5,	%o7
	movpos	%xcc,	%o0,	%i1
	edge8n	%i4,	%i3,	%g6
	fmovdle	%xcc,	%f11,	%f11
	addcc	%i7,	%i5,	%l3
	ldsb	[%l7 + 0x6D],	%i2
	fmovse	%icc,	%f17,	%f27
	ldx	[%l7 + 0x40],	%o5
	edge8n	%o1,	%g3,	%l0
	ld	[%l7 + 0x50],	%f30
	udiv	%g1,	0x0ACE,	%o6
	alignaddr	%l1,	%l6,	%i6
	xnorcc	%o4,	0x129F,	%l4
	xnor	%i0,	0x012E,	%g4
	ld	[%l7 + 0x5C],	%f25
	save %o3, %o2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l2,	%g2
	edge32ln	%g5,	%l5,	%o0
	addcc	%i1,	0x0633,	%i4
	movrlez	%i3,	0x01C,	%o7
	fmovsl	%icc,	%f19,	%f13
	movpos	%xcc,	%g6,	%i7
	mulscc	%l3,	0x019F,	%i2
	ldd	[%l7 + 0x38],	%f4
	edge32n	%o5,	%i5,	%g3
	ldd	[%l7 + 0x70],	%l0
	subcc	%o1,	0x1D96,	%o6
	movcc	%xcc,	%l1,	%g1
	fcmple32	%f30,	%f0,	%l6
	restore %i6, %o4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l4,	%g4
	or	%o2,	0x04C3,	%o3
	siam	0x7
	edge8ln	%g7,	%g2,	%l2
	edge8l	%g5,	%l5,	%i1
	subccc	%i4,	0x0B2A,	%o0
	fmovrsgez	%o7,	%f1,	%f16
	ld	[%l7 + 0x3C],	%f0
	addcc	%g6,	%i7,	%l3
	xnorcc	%i3,	0x1930,	%i2
	addcc	%o5,	0x15D7,	%g3
	array32	%l0,	%o1,	%o6
	alignaddrl	%l1,	%g1,	%i5
	lduw	[%l7 + 0x7C],	%l6
	ldd	[%l7 + 0x18],	%f8
	edge16	%o4,	%i0,	%i6
	edge16ln	%l4,	%o2,	%o3
	std	%f0,	[%l7 + 0x68]
	movle	%icc,	%g4,	%g2
	ldub	[%l7 + 0x08],	%g7
	movrgz	%g5,	%l5,	%i1
	ldsh	[%l7 + 0x0E],	%i4
	fxnor	%f20,	%f20,	%f4
	edge8n	%l2,	%o0,	%o7
	fmovdle	%xcc,	%f6,	%f7
	save %g6, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i3,	0x0457,	%i2
	movneg	%xcc,	%g3,	%l0
	movcs	%xcc,	%o1,	%o6
	add	%l1,	%o5,	%g1
	movrgz	%i5,	%l6,	%i0
	stb	%i6,	[%l7 + 0x60]
	alignaddr	%l4,	%o4,	%o2
	movne	%xcc,	%o3,	%g2
	stb	%g4,	[%l7 + 0x4B]
	andcc	%g7,	%g5,	%i1
	fsrc1s	%f6,	%f22
	alignaddr	%l5,	%l2,	%i4
	movrlz	%o0,	0x3FE,	%g6
	smul	%i7,	0x00AA,	%l3
	edge32	%i3,	%o7,	%i2
	fmovsa	%xcc,	%f31,	%f10
	array16	%g3,	%o1,	%l0
	stx	%l1,	[%l7 + 0x68]
	umulcc	%o5,	0x1E5C,	%o6
	movrgz	%g1,	0x18A,	%l6
	fands	%f28,	%f20,	%f12
	array32	%i0,	%i6,	%l4
	edge8	%i5,	%o4,	%o2
	edge16l	%g2,	%g4,	%g7
	lduh	[%l7 + 0x5C],	%g5
	ldsb	[%l7 + 0x71],	%o3
	movge	%xcc,	%l5,	%i1
	fnors	%f14,	%f23,	%f25
	st	%f29,	[%l7 + 0x2C]
	edge32ln	%i4,	%o0,	%l2
	udiv	%g6,	0x09D8,	%i7
	movne	%xcc,	%i3,	%l3
	edge16l	%o7,	%i2,	%o1
	fornot2	%f10,	%f8,	%f22
	addcc	%l0,	%l1,	%o5
	fmovd	%f10,	%f12
	movgu	%xcc,	%o6,	%g3
	edge16	%l6,	%i0,	%g1
	fpadd32s	%f9,	%f30,	%f10
	fandnot1s	%f18,	%f23,	%f5
	fandnot2	%f22,	%f12,	%f22
	umulcc	%l4,	0x0023,	%i6
	st	%f2,	[%l7 + 0x54]
	subccc	%o4,	0x1AC9,	%i5
	movrlez	%o2,	%g4,	%g7
	stb	%g2,	[%l7 + 0x45]
	edge8n	%o3,	%g5,	%i1
	movcs	%xcc,	%l5,	%o0
	movle	%xcc,	%i4,	%l2
	edge32n	%g6,	%i3,	%l3
	fmuld8sux16	%f30,	%f21,	%f2
	fnand	%f16,	%f4,	%f26
	subc	%o7,	%i7,	%i2
	stx	%l0,	[%l7 + 0x18]
	andcc	%l1,	%o1,	%o6
	xnorcc	%o5,	%l6,	%g3
	edge8ln	%g1,	%i0,	%l4
	umulcc	%o4,	%i5,	%i6
	st	%f16,	[%l7 + 0x10]
	lduw	[%l7 + 0x74],	%o2
	fcmple16	%f2,	%f24,	%g7
	sll	%g2,	%o3,	%g4
	udivx	%i1,	0x175A,	%g5
	ldsw	[%l7 + 0x30],	%l5
	movgu	%icc,	%o0,	%l2
	sir	0x1E3B
	fmovdcc	%icc,	%f19,	%f18
	fmovscs	%icc,	%f20,	%f20
	sdivx	%i4,	0x0A4F,	%i3
	addc	%g6,	%l3,	%i7
	alignaddrl	%o7,	%i2,	%l1
	array32	%l0,	%o1,	%o5
	ldd	[%l7 + 0x28],	%f16
	movrlz	%o6,	%g3,	%l6
	movg	%icc,	%i0,	%l4
	lduh	[%l7 + 0x34],	%g1
	sdivx	%i5,	0x0A6B,	%o4
	umul	%i6,	%o2,	%g2
	edge32	%g7,	%o3,	%i1
	sethi	0x15CC,	%g5
	lduh	[%l7 + 0x52],	%l5
	movre	%o0,	%l2,	%i4
	std	%f22,	[%l7 + 0x70]
	fmul8x16	%f1,	%f12,	%f8
	mova	%xcc,	%g4,	%g6
	edge16	%l3,	%i3,	%i7
	fnot2	%f30,	%f18
	nop
	set	0x3E, %g5
	ldsh	[%l7 + %g5],	%i2
	fmovrdlez	%l1,	%f2,	%f4
	orncc	%o7,	0x1842,	%l0
	sethi	0x0ACE,	%o5
	movne	%xcc,	%o6,	%o1
	edge32	%g3,	%i0,	%l6
	subcc	%g1,	0x15FF,	%i5
	movrne	%l4,	%i6,	%o4
	subcc	%g2,	0x0AC1,	%o2
	movne	%icc,	%o3,	%i1
	movl	%icc,	%g7,	%l5
	fmul8ulx16	%f8,	%f14,	%f12
	movge	%xcc,	%g5,	%o0
	umul	%i4,	0x1CD9,	%g4
	sra	%g6,	%l2,	%i3
	fmovrdgz	%l3,	%f18,	%f18
	ldsw	[%l7 + 0x60],	%i2
	addc	%i7,	0x16B5,	%l1
	movge	%icc,	%o7,	%o5
	xorcc	%l0,	0x1917,	%o6
	array32	%o1,	%g3,	%i0
	movge	%xcc,	%l6,	%g1
	edge32	%i5,	%i6,	%l4
	movre	%o4,	0x05A,	%o2
	smul	%o3,	%g2,	%i1
	sll	%g7,	0x0F,	%g5
	movle	%icc,	%o0,	%l5
	mova	%icc,	%i4,	%g6
	sub	%l2,	%g4,	%i3
	smulcc	%l3,	%i2,	%l1
	ldsh	[%l7 + 0x20],	%o7
	fmovrdgz	%o5,	%f4,	%f2
	edge32ln	%i7,	%l0,	%o6
	sra	%g3,	0x1B,	%o1
	ldsb	[%l7 + 0x31],	%i0
	addc	%g1,	%l6,	%i6
	edge32l	%l4,	%i5,	%o2
	umulcc	%o4,	%o3,	%i1
	andn	%g2,	%g5,	%o0
	movpos	%icc,	%l5,	%i4
	fmovsle	%xcc,	%f4,	%f24
	subcc	%g6,	%g7,	%g4
	subcc	%l2,	0x0A47,	%l3
	ldx	[%l7 + 0x08],	%i2
	edge8	%i3,	%l1,	%o5
	fnot2	%f8,	%f0
	smul	%i7,	%o7,	%l0
	ldsh	[%l7 + 0x14],	%o6
	std	%f10,	[%l7 + 0x58]
	movvs	%xcc,	%g3,	%i0
	movvs	%xcc,	%g1,	%l6
	fexpand	%f20,	%f28
	fsrc1s	%f1,	%f29
	ldx	[%l7 + 0x10],	%o1
	edge16n	%i6,	%i5,	%l4
	udiv	%o4,	0x0BBE,	%o2
	edge32l	%i1,	%g2,	%g5
	alignaddrl	%o3,	%l5,	%i4
	fmovrdlez	%o0,	%f22,	%f26
	movgu	%xcc,	%g6,	%g7
	or	%g4,	0x01D9,	%l3
	xor	%i2,	0x0F99,	%i3
	srlx	%l2,	%o5,	%l1
	fmul8sux16	%f24,	%f8,	%f2
	fmovdgu	%xcc,	%f24,	%f13
	fpadd16s	%f0,	%f11,	%f12
	for	%f14,	%f10,	%f10
	movrgez	%i7,	0x2CD,	%l0
	fpackfix	%f14,	%f13
	xor	%o7,	%o6,	%i0
	movrlz	%g3,	0x1D2,	%l6
	mulx	%g1,	%o1,	%i5
	andcc	%i6,	0x13C8,	%l4
	stw	%o4,	[%l7 + 0x20]
	array32	%o2,	%g2,	%i1
	fpadd32s	%f9,	%f15,	%f27
	fmovsl	%xcc,	%f22,	%f17
	movcc	%icc,	%g5,	%o3
	srlx	%l5,	%i4,	%o0
	fmovrde	%g7,	%f8,	%f4
	edge16l	%g6,	%l3,	%i2
	fands	%f2,	%f3,	%f12
	fmovdg	%xcc,	%f2,	%f1
	ldd	[%l7 + 0x38],	%f8
	movneg	%xcc,	%i3,	%l2
	movcs	%xcc,	%o5,	%g4
	fors	%f10,	%f28,	%f6
	movle	%icc,	%l1,	%l0
	orn	%i7,	%o6,	%o7
	sra	%g3,	0x08,	%i0
	ldd	[%l7 + 0x40],	%g0
	fmovdge	%xcc,	%f9,	%f30
	pdist	%f22,	%f30,	%f26
	edge32n	%o1,	%l6,	%i5
	alignaddr	%l4,	%i6,	%o2
	addcc	%o4,	%i1,	%g5
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	ldd	[%l7 + 0x40],	%f8
	fmovdl	%xcc,	%f23,	%f12
	stx	%o0,	[%l7 + 0x38]
	addcc	%g7,	0x10E1,	%g6
	fmovrslez	%l3,	%f16,	%f12
	srlx	%l5,	%i2,	%i3
	fpadd16s	%f17,	%f14,	%f12
	fmovdle	%xcc,	%f15,	%f1
	fmovrsgez	%l2,	%f12,	%f24
	movrlez	%g4,	%l1,	%o5
	fmovdg	%icc,	%f14,	%f12
	movge	%xcc,	%i7,	%o6
	fcmpes	%fcc1,	%f15,	%f5
	edge16n	%l0,	%o7,	%g3
	ldd	[%l7 + 0x18],	%i0
	sir	0x0239
	smulcc	%g1,	0x0252,	%o1
	std	%f14,	[%l7 + 0x40]
	orn	%l6,	%l4,	%i5
	array16	%i6,	%o4,	%i1
	addcc	%g5,	0x1B5F,	%g2
	fsrc2	%f20,	%f2
	srlx	%o2,	%i4,	%o3
	st	%f31,	[%l7 + 0x24]
	ldub	[%l7 + 0x4E],	%o0
	addcc	%g7,	%l3,	%g6
	fpsub16s	%f19,	%f30,	%f26
	edge32l	%i2,	%l5,	%i3
	save %g4, %l1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1F12,	%o5
	addccc	%o6,	%l0,	%o7
	move	%icc,	%g3,	%i7
	fmovsl	%xcc,	%f11,	%f19
	movrlez	%i0,	0x1CF,	%o1
	array16	%l6,	%l4,	%g1
	sethi	0x0D9F,	%i6
	sub	%i5,	0x13C0,	%o4
	fcmpgt32	%f2,	%f30,	%i1
	fpack32	%f0,	%f20,	%f20
	fornot2s	%f20,	%f24,	%f26
	movrne	%g2,	%g5,	%o2
	srlx	%o3,	0x0A,	%o0
	udiv	%g7,	0x0D62,	%l3
	fmovdpos	%icc,	%f5,	%f8
	srax	%i4,	%g6,	%i2
	fmovscs	%xcc,	%f12,	%f24
	array16	%l5,	%i3,	%g4
	edge8	%l1,	%l2,	%o5
	edge32l	%l0,	%o6,	%g3
	stx	%i7,	[%l7 + 0x18]
	srlx	%i0,	%o1,	%l6
	movrne	%l4,	0x2AC,	%o7
	fmovd	%f0,	%f22
	ldsh	[%l7 + 0x58],	%g1
	movrgz	%i5,	%o4,	%i6
	umul	%i1,	%g5,	%o2
	movrgez	%g2,	0x25B,	%o3
	edge8l	%g7,	%l3,	%i4
	array32	%o0,	%i2,	%l5
	orn	%g6,	0x0211,	%i3
	stx	%g4,	[%l7 + 0x10]
	fsrc1	%f8,	%f30
	alignaddr	%l2,	%l1,	%o5
	fxnor	%f6,	%f4,	%f26
	movg	%xcc,	%o6,	%g3
	umulcc	%l0,	%i0,	%o1
	orncc	%i7,	0x0799,	%l6
	ldd	[%l7 + 0x78],	%l4
	fandnot1	%f26,	%f26,	%f6
	xorcc	%o7,	0x11B2,	%i5
	fpackfix	%f28,	%f15
	lduw	[%l7 + 0x74],	%o4
	sdivx	%i6,	0x067D,	%i1
	mulx	%g5,	%g1,	%g2
	movne	%icc,	%o3,	%g7
	popc	0x05E0,	%o2
	sethi	0x16F5,	%i4
	ld	[%l7 + 0x3C],	%f2
	edge16ln	%o0,	%l3,	%l5
	fpackfix	%f28,	%f9
	stw	%i2,	[%l7 + 0x30]
	nop
	set	0x48, %o7
	lduw	[%l7 + %o7],	%i3
	fnand	%f22,	%f8,	%f4
	ldd	[%l7 + 0x70],	%f12
	xnor	%g4,	%g6,	%l2
	for	%f6,	%f28,	%f16
	array8	%l1,	%o6,	%g3
	edge8l	%l0,	%i0,	%o5
	udivcc	%o1,	0x095D,	%l6
	edge32ln	%l4,	%o7,	%i7
	andcc	%i5,	0x01EA,	%o4
	andn	%i1,	0x0A3E,	%i6
	sdivx	%g5,	0x0D69,	%g1
	movrgez	%g2,	0x231,	%g7
	fand	%f10,	%f6,	%f14
	fpackfix	%f2,	%f4
	orcc	%o2,	%i4,	%o0
	edge32l	%o3,	%l3,	%i2
	fpadd16s	%f31,	%f23,	%f11
	andn	%i3,	0x10C3,	%l5
	sra	%g4,	%g6,	%l1
	array32	%o6,	%g3,	%l0
	mulscc	%i0,	%o5,	%o1
	orn	%l2,	%l4,	%l6
	fmovdcs	%icc,	%f17,	%f26
	movrlz	%i7,	%i5,	%o4
	move	%xcc,	%o7,	%i1
	array8	%g5,	%g1,	%i6
	fcmpeq32	%f22,	%f14,	%g7
	fxnors	%f17,	%f2,	%f9
	lduh	[%l7 + 0x38],	%g2
	fmovsleu	%xcc,	%f1,	%f30
	movrlez	%o2,	%o0,	%i4
	lduw	[%l7 + 0x0C],	%o3
	sdivcc	%i2,	0x0118,	%i3
	add	%l5,	0x033C,	%l3
	ldub	[%l7 + 0x35],	%g6
	xorcc	%g4,	%o6,	%g3
	mova	%xcc,	%l0,	%l1
	ldub	[%l7 + 0x29],	%i0
	movg	%icc,	%o1,	%o5
	fmovscc	%icc,	%f28,	%f28
	fmovrdne	%l2,	%f16,	%f20
	sll	%l6,	%i7,	%i5
	fmovsle	%xcc,	%f10,	%f25
	or	%l4,	%o7,	%o4
	fmuld8sux16	%f20,	%f0,	%f0
	movgu	%xcc,	%g5,	%g1
	movvs	%xcc,	%i1,	%g7
	addc	%g2,	0x1759,	%i6
	lduh	[%l7 + 0x12],	%o0
	fmul8x16au	%f4,	%f12,	%f20
	fmovdl	%icc,	%f5,	%f14
	sll	%i4,	0x19,	%o2
	edge16n	%o3,	%i3,	%i2
	for	%f24,	%f30,	%f16
	andcc	%l5,	0x08F0,	%l3
	nop
	set	0x12, %l6
	sth	%g6,	[%l7 + %l6]
	xnor	%g4,	%o6,	%g3
	andn	%l1,	%l0,	%i0
	sethi	0x0525,	%o5
	umul	%l2,	%o1,	%l6
	lduh	[%l7 + 0x6C],	%i7
	movre	%i5,	0x2ED,	%o7
	movl	%xcc,	%o4,	%l4
	andncc	%g1,	%i1,	%g5
	movneg	%xcc,	%g7,	%i6
	movvs	%icc,	%o0,	%g2
	fmovsg	%xcc,	%f24,	%f5
	movpos	%icc,	%i4,	%o2
	sub	%i3,	%o3,	%l5
	alignaddrl	%l3,	%g6,	%i2
	orn	%g4,	0x1114,	%g3
	movcs	%icc,	%o6,	%l0
	udiv	%l1,	0x1E32,	%i0
	orncc	%l2,	%o5,	%l6
	sllx	%i7,	%i5,	%o7
	edge32ln	%o4,	%l4,	%g1
	fmovrde	%i1,	%f4,	%f16
	array32	%o1,	%g5,	%i6
	edge32l	%g7,	%o0,	%g2
	fmovsge	%xcc,	%f1,	%f19
	movne	%icc,	%o2,	%i3
	umulcc	%i4,	0x1041,	%o3
	fnands	%f17,	%f23,	%f10
	or	%l3,	%l5,	%g6
	fmovsneg	%icc,	%f1,	%f24
	orn	%i2,	%g4,	%g3
	fmovd	%f16,	%f18
	move	%xcc,	%o6,	%l0
	movge	%icc,	%l1,	%l2
	movgu	%xcc,	%i0,	%o5
	save %l6, 0x0437, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o7,	%i5
	sdiv	%o4,	0x0FCD,	%l4
	edge32l	%g1,	%o1,	%i1
	movne	%icc,	%g5,	%i6
	fmovdvc	%xcc,	%f7,	%f4
	edge16l	%o0,	%g7,	%g2
	andcc	%i3,	%o2,	%i4
	subc	%l3,	%o3,	%l5
	fzeros	%f12
	stw	%i2,	[%l7 + 0x68]
	umulcc	%g4,	%g3,	%g6
	fmovsgu	%xcc,	%f27,	%f4
	movre	%o6,	0x126,	%l0
	edge16ln	%l1,	%i0,	%l2
	lduh	[%l7 + 0x7C],	%o5
	edge16n	%i7,	%o7,	%i5
	or	%o4,	%l4,	%l6
	orn	%o1,	0x05E0,	%g1
	array8	%g5,	%i6,	%i1
	movn	%icc,	%g7,	%o0
	ldx	[%l7 + 0x20],	%i3
	fmovsneg	%icc,	%f6,	%f23
	movl	%icc,	%g2,	%i4
	andcc	%l3,	0x068A,	%o3
	fcmpne32	%f16,	%f12,	%l5
	movleu	%xcc,	%i2,	%g4
	ldsw	[%l7 + 0x64],	%o2
	fcmpeq32	%f30,	%f24,	%g6
	ldsh	[%l7 + 0x62],	%o6
	lduw	[%l7 + 0x4C],	%g3
	nop
	set	0x40, %l4
	ldx	[%l7 + %l4],	%l0
	stw	%i0,	[%l7 + 0x1C]
	sdivx	%l2,	0x1A64,	%l1
	movge	%icc,	%i7,	%o7
	sir	0x03D3
	and	%i5,	%o4,	%o5
	orcc	%l6,	%l4,	%o1
	movrlez	%g5,	0x301,	%g1
	edge16n	%i6,	%g7,	%o0
	sra	%i1,	0x1A,	%g2
	ldsw	[%l7 + 0x44],	%i4
	st	%f0,	[%l7 + 0x64]
	sir	0x1529
	sth	%l3,	[%l7 + 0x42]
	movvc	%icc,	%o3,	%i3
	fmovrsgz	%i2,	%f31,	%f15
	edge8	%g4,	%l5,	%g6
	array16	%o6,	%g3,	%l0
	stw	%o2,	[%l7 + 0x1C]
	fcmpd	%fcc2,	%f16,	%f10
	sir	0x1C7B
	popc	0x1A4B,	%i0
	stw	%l2,	[%l7 + 0x30]
	edge32l	%i7,	%l1,	%i5
	xnor	%o4,	%o5,	%o7
	movn	%icc,	%l4,	%o1
	sdivcc	%g5,	0x16BB,	%l6
	alignaddr	%g1,	%g7,	%o0
	addc	%i1,	%g2,	%i6
	ldsw	[%l7 + 0x24],	%l3
	fcmple32	%f16,	%f10,	%o3
	smulcc	%i3,	0x0886,	%i2
	lduh	[%l7 + 0x6C],	%g4
	fxnor	%f14,	%f6,	%f4
	ldsh	[%l7 + 0x50],	%l5
	xnor	%g6,	0x1701,	%o6
	fabsd	%f14,	%f14
	smulcc	%g3,	0x00E5,	%i4
	nop
	set	0x5D, %g7
	ldub	[%l7 + %g7],	%l0
	lduw	[%l7 + 0x18],	%i0
	movge	%icc,	%l2,	%i7
	umul	%o2,	0x1C64,	%l1
	restore %i5, 0x1DF6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o7,	%l4,	%o1
	popc	0x1808,	%g5
	udivcc	%l6,	0x1B47,	%o4
	movrlez	%g7,	0x148,	%g1
	array32	%i1,	%g2,	%o0
	array16	%l3,	%i6,	%o3
	udivcc	%i2,	0x1617,	%i3
	movle	%icc,	%g4,	%l5
	edge16l	%g6,	%g3,	%i4
	array8	%o6,	%i0,	%l2
	movpos	%icc,	%i7,	%o2
	fpadd16s	%f2,	%f5,	%f17
	fcmpgt32	%f18,	%f20,	%l0
	edge32	%i5,	%l1,	%o5
	sub	%o7,	0x04F0,	%o1
	fand	%f26,	%f20,	%f16
	fmovdcs	%icc,	%f0,	%f12
	edge16l	%l4,	%l6,	%g5
	fmovsvs	%icc,	%f0,	%f15
	xnorcc	%g7,	%g1,	%i1
	std	%f6,	[%l7 + 0x50]
	sub	%o4,	%g2,	%o0
	edge32	%i6,	%o3,	%i2
	fmul8x16al	%f5,	%f16,	%f28
	movg	%icc,	%i3,	%g4
	fcmps	%fcc3,	%f1,	%f5
	andncc	%l3,	%g6,	%g3
	andncc	%i4,	%l5,	%o6
	movrlez	%i0,	%l2,	%i7
	fmovsvs	%icc,	%f0,	%f4
	st	%f30,	[%l7 + 0x24]
	addcc	%l0,	%i5,	%l1
	fcmpeq16	%f4,	%f20,	%o5
	sdiv	%o7,	0x04CF,	%o1
	edge8ln	%o2,	%l4,	%l6
	srlx	%g5,	%g1,	%g7
	movrlez	%o4,	%i1,	%o0
	edge8	%g2,	%i6,	%i2
	array8	%o3,	%g4,	%l3
	fmovrsgz	%i3,	%f8,	%f15
	orcc	%g3,	0x0716,	%g6
	addcc	%i4,	%l5,	%i0
	alignaddrl	%l2,	%o6,	%i7
	edge32ln	%l0,	%l1,	%o5
	subccc	%o7,	0x1C57,	%i5
	sub	%o1,	%o2,	%l6
	lduw	[%l7 + 0x4C],	%g5
	ldsb	[%l7 + 0x30],	%l4
	array16	%g7,	%g1,	%o4
	movn	%icc,	%o0,	%i1
	popc	%g2,	%i2
	ldd	[%l7 + 0x50],	%f12
	movleu	%icc,	%o3,	%i6
	save %l3, %g4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f1,	%f8,	%f3
	fmuld8ulx16	%f16,	%f8,	%f28
	fmovrdlez	%g6,	%f2,	%f10
	sub	%i3,	0x0D51,	%i4
	fmovdcs	%xcc,	%f26,	%f12
	array32	%i0,	%l5,	%o6
	movge	%icc,	%l2,	%i7
	movcs	%xcc,	%l1,	%l0
	fmovrsgz	%o5,	%f8,	%f28
	movleu	%icc,	%i5,	%o1
	orcc	%o2,	%l6,	%o7
	movle	%xcc,	%g5,	%g7
	edge16	%l4,	%g1,	%o0
	ldd	[%l7 + 0x20],	%i0
	movvs	%icc,	%g2,	%i2
	addccc	%o3,	%i6,	%l3
	movg	%icc,	%g4,	%g3
	edge8n	%o4,	%i3,	%g6
	smulcc	%i4,	%l5,	%i0
	add	%o6,	%i7,	%l1
	addccc	%l2,	0x119C,	%l0
	movrgz	%i5,	0x292,	%o5
	nop
	set	0x08, %o1
	std	%f6,	[%l7 + %o1]
	fnands	%f8,	%f27,	%f17
	save %o1, %o2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x48],	%f6
	umul	%g5,	%g7,	%l4
	pdist	%f4,	%f24,	%f6
	edge8	%g1,	%o7,	%i1
	ldsb	[%l7 + 0x33],	%g2
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	save %i6, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g3,	%o0
	st	%f25,	[%l7 + 0x68]
	stx	%i3,	[%l7 + 0x38]
	fnor	%f4,	%f20,	%f14
	and	%g6,	0x054F,	%i4
	sra	%l5,	0x1D,	%o4
	add	%o6,	%i0,	%l1
	fnot1	%f2,	%f28
	or	%l2,	%i7,	%l0
	stb	%i5,	[%l7 + 0x3A]
	movge	%xcc,	%o1,	%o2
	addcc	%o5,	0x094F,	%l6
	fmovdvc	%icc,	%f9,	%f13
	subcc	%g5,	0x0DC1,	%l4
	edge16l	%g7,	%o7,	%g1
	pdist	%f12,	%f0,	%f26
	fxor	%f2,	%f16,	%f8
	fabss	%f3,	%f4
	save %i1, %i2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%g2,	0x013A,	%i6
	fnegs	%f29,	%f6
	movvs	%icc,	%l3,	%g3
	movrgez	%o0,	%g4,	%i3
	alignaddrl	%i4,	%l5,	%o4
	movl	%xcc,	%o6,	%i0
	faligndata	%f10,	%f22,	%f6
	umulcc	%l1,	%g6,	%i7
	fcmped	%fcc1,	%f16,	%f0
	movcc	%icc,	%l2,	%l0
	fmovscs	%icc,	%f29,	%f13
	or	%o1,	0x1552,	%o2
	ldd	[%l7 + 0x70],	%f16
	movre	%o5,	0x10A,	%l6
	xnorcc	%i5,	%l4,	%g7
	xor	%o7,	0x1DBE,	%g5
	sethi	0x194A,	%g1
	movle	%xcc,	%i1,	%i2
	edge32ln	%g2,	%o3,	%l3
	edge8	%g3,	%o0,	%g4
	sra	%i3,	%i4,	%i6
	subc	%l5,	0x00E2,	%o4
	fmul8ulx16	%f14,	%f16,	%f10
	movne	%icc,	%i0,	%o6
	edge8l	%l1,	%i7,	%l2
	or	%l0,	0x0AA6,	%g6
	udivx	%o2,	0x10E8,	%o5
	umul	%o1,	0x0523,	%l6
	mulx	%l4,	%g7,	%o7
	sllx	%g5,	%g1,	%i1
	andn	%i5,	%g2,	%o3
	ldsh	[%l7 + 0x12],	%i2
	andcc	%g3,	%o0,	%l3
	movcs	%xcc,	%g4,	%i4
	edge16ln	%i6,	%l5,	%o4
	fmovsa	%xcc,	%f21,	%f8
	fcmpne32	%f4,	%f8,	%i3
	movre	%o6,	0x139,	%l1
	srl	%i0,	0x04,	%l2
	lduw	[%l7 + 0x08],	%l0
	edge16	%i7,	%o2,	%o5
	fcmpgt32	%f8,	%f4,	%o1
	orcc	%l6,	%l4,	%g6
	movgu	%icc,	%o7,	%g7
	orncc	%g1,	0x1F5A,	%g5
	ldx	[%l7 + 0x20],	%i5
	movleu	%icc,	%i1,	%g2
	fxnor	%f28,	%f20,	%f14
	movvc	%icc,	%o3,	%g3
	lduw	[%l7 + 0x08],	%o0
	edge32ln	%i2,	%l3,	%i4
	movl	%icc,	%i6,	%l5
	ldsh	[%l7 + 0x5E],	%g4
	fpsub16	%f22,	%f24,	%f18
	sra	%o4,	0x1B,	%o6
	umul	%l1,	0x1A57,	%i3
	nop
	set	0x0A, %o4
	ldsh	[%l7 + %o4],	%l2
	fmovsgu	%icc,	%f19,	%f1
	edge32	%i0,	%l0,	%i7
	movleu	%icc,	%o5,	%o2
	stb	%o1,	[%l7 + 0x26]
	movcs	%icc,	%l4,	%l6
	movne	%icc,	%o7,	%g7
	movn	%icc,	%g6,	%g1
	fmovrde	%g5,	%f16,	%f26
	movge	%icc,	%i5,	%g2
	alignaddr	%o3,	%g3,	%i1
	sdivcc	%o0,	0x1B39,	%i2
	sub	%i4,	0x03AA,	%i6
	ldd	[%l7 + 0x10],	%l2
	sll	%g4,	%l5,	%o4
	ldsh	[%l7 + 0x32],	%l1
	movrne	%o6,	0x2E9,	%i3
	restore %l2, %l0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x74],	%o5
	stw	%o2,	[%l7 + 0x5C]
	andncc	%i7,	%l4,	%l6
	add	%o1,	0x1F85,	%g7
	edge16l	%o7,	%g6,	%g5
	edge16ln	%i5,	%g1,	%g2
	subcc	%g3,	%i1,	%o0
	stx	%i2,	[%l7 + 0x68]
	andncc	%i4,	%i6,	%o3
	edge8	%l3,	%l5,	%g4
	xor	%o4,	0x032E,	%l1
	sll	%o6,	0x05,	%i3
	movg	%xcc,	%l2,	%i0
	movleu	%xcc,	%o5,	%o2
	sdiv	%l0,	0x1D2A,	%l4
	std	%f18,	[%l7 + 0x08]
	edge16	%i7,	%o1,	%l6
	movrgz	%o7,	%g6,	%g7
	fnot2	%f0,	%f26
	popc	%g5,	%g1
	xorcc	%g2,	%g3,	%i1
	save %o0, 0x1C74, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x48],	%i2
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	movgu	%icc,	%l3,	%i6
	fcmpne16	%f24,	%f22,	%g4
	movre	%o4,	%l1,	%o6
	fmul8sux16	%f24,	%f22,	%f4
	lduh	[%l7 + 0x6A],	%l5
	sir	0x091E
	array32	%l2,	%i3,	%o5
	and	%o2,	%i0,	%l4
	movpos	%icc,	%i7,	%o1
	fmovrsgz	%l0,	%f7,	%f6
	sll	%l6,	0x13,	%o7
	edge32l	%g6,	%g7,	%g5
	sll	%g2,	%g3,	%g1
	movn	%icc,	%o0,	%i1
	lduh	[%l7 + 0x32],	%i2
	ld	[%l7 + 0x44],	%f12
	movrlez	%i4,	%i5,	%o3
	sir	0x1571
	movl	%icc,	%l3,	%g4
	sra	%i6,	0x03,	%o4
	restore %o6, %l1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x64],	%l2
	move	%xcc,	%i3,	%o2
	add	%o5,	0x1A4F,	%i0
	array16	%l4,	%i7,	%o1
	movg	%icc,	%l6,	%o7
	fmovd	%f16,	%f6
	alignaddrl	%l0,	%g6,	%g7
	fmovda	%xcc,	%f26,	%f23
	fmovdne	%icc,	%f19,	%f24
	movrgz	%g2,	0x33B,	%g5
	fors	%f10,	%f19,	%f9
	edge32ln	%g1,	%g3,	%o0
	orcc	%i2,	0x13DC,	%i1
	fornot2	%f24,	%f2,	%f22
	fmovs	%f5,	%f29
	movcs	%icc,	%i5,	%i4
	edge8l	%o3,	%l3,	%i6
	andcc	%g4,	%o4,	%o6
	edge16l	%l5,	%l1,	%i3
	fandnot1	%f18,	%f30,	%f2
	addc	%o2,	%l2,	%o5
	movn	%xcc,	%l4,	%i0
	fmovrsgz	%o1,	%f14,	%f24
	sth	%l6,	[%l7 + 0x44]
	nop
	set	0x12, %l1
	ldsh	[%l7 + %l1],	%o7
	fzero	%f14
	orcc	%i7,	0x1B8C,	%g6
	popc	%l0,	%g2
	andcc	%g5,	%g1,	%g3
	movpos	%xcc,	%g7,	%o0
	subccc	%i1,	0x1E59,	%i5
	orn	%i2,	%i4,	%o3
	add	%l3,	%g4,	%o4
	fmuld8ulx16	%f15,	%f13,	%f4
	edge16n	%o6,	%i6,	%l5
	fnot1	%f8,	%f10
	udiv	%l1,	0x10D9,	%o2
	edge8	%i3,	%o5,	%l2
	movrne	%l4,	%o1,	%i0
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	ld	[%l7 + 0x28],	%f0
	orn	%l0,	0x192D,	%o7
	sir	0x0B7F
	alignaddrl	%g5,	%g1,	%g3
	srl	%g2,	0x14,	%g7
	ld	[%l7 + 0x0C],	%f19
	fmovrdne	%o0,	%f16,	%f16
	edge32n	%i5,	%i1,	%i4
	movne	%icc,	%i2,	%l3
	fmovdl	%icc,	%f24,	%f10
	ldd	[%l7 + 0x40],	%f30
	sethi	0x1F9C,	%g4
	andn	%o3,	0x1C19,	%o6
	movrne	%o4,	%i6,	%l1
	edge16	%o2,	%i3,	%o5
	fmovscs	%xcc,	%f19,	%f23
	edge32n	%l2,	%l5,	%o1
	umulcc	%l4,	%i0,	%i7
	fmovs	%f19,	%f0
	stb	%l6,	[%l7 + 0x46]
	mova	%xcc,	%g6,	%o7
	fones	%f30
	popc	0x0487,	%g5
	sllx	%g1,	0x18,	%l0
	andncc	%g3,	%g7,	%o0
	fnegd	%f24,	%f26
	fmovrdne	%g2,	%f26,	%f18
	movpos	%xcc,	%i1,	%i4
	movl	%icc,	%i5,	%i2
	fpsub32s	%f19,	%f12,	%f0
	orcc	%l3,	0x0F64,	%g4
	sub	%o3,	0x03E7,	%o6
	addccc	%o4,	0x0499,	%l1
	udivx	%i6,	0x0243,	%i3
	movpos	%xcc,	%o2,	%o5
	ldx	[%l7 + 0x70],	%l2
	array8	%l5,	%l4,	%o1
	st	%f10,	[%l7 + 0x2C]
	and	%i0,	0x0A18,	%l6
	fmovsl	%icc,	%f3,	%f30
	fzeros	%f9
	or	%i7,	%g6,	%o7
	movgu	%xcc,	%g5,	%l0
	fmovscs	%xcc,	%f14,	%f4
	fcmple16	%f26,	%f16,	%g1
	fone	%f24
	fand	%f0,	%f10,	%f26
	add	%g3,	%o0,	%g7
	edge32	%i1,	%i4,	%g2
	movl	%xcc,	%i2,	%i5
	fmovdgu	%xcc,	%f17,	%f26
	sdiv	%g4,	0x0B03,	%l3
	sethi	0x08F9,	%o3
	andn	%o6,	%o4,	%i6
	orncc	%i3,	0x075A,	%l1
	fcmpne16	%f20,	%f28,	%o5
	movrlez	%o2,	%l2,	%l4
	movne	%xcc,	%l5,	%o1
	or	%i0,	0x0CE1,	%l6
	movgu	%icc,	%g6,	%i7
	orcc	%o7,	%g5,	%l0
	ldd	[%l7 + 0x60],	%f16
	edge8	%g3,	%g1,	%g7
	mulx	%o0,	%i1,	%g2
	smulcc	%i4,	%i2,	%i5
	xorcc	%l3,	%g4,	%o3
	lduw	[%l7 + 0x28],	%o4
	orn	%o6,	%i6,	%i3
	movle	%icc,	%o5,	%o2
	movge	%icc,	%l2,	%l1
	st	%f13,	[%l7 + 0x20]
	orncc	%l4,	%l5,	%i0
	ldx	[%l7 + 0x70],	%o1
	stx	%g6,	[%l7 + 0x20]
	edge8	%l6,	%o7,	%g5
	srl	%i7,	0x06,	%l0
	orn	%g1,	0x1F9B,	%g7
	array8	%g3,	%i1,	%g2
	fmovse	%icc,	%f24,	%f31
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%f4
	edge32n	%o0,	%i4,	%i5
	movrgez	%l3,	%g4,	%o3
	and	%i2,	%o4,	%i6
	stx	%o6,	[%l7 + 0x78]
	fmovdcs	%icc,	%f10,	%f7
	ldd	[%l7 + 0x70],	%f24
	movle	%xcc,	%i3,	%o2
	and	%o5,	%l1,	%l4
	ld	[%l7 + 0x74],	%f27
	edge16l	%l2,	%l5,	%o1
	smul	%g6,	0x1A3D,	%i0
	fcmple16	%f28,	%f18,	%o7
	movrgz	%g5,	0x07C,	%i7
	std	%f10,	[%l7 + 0x18]
	movg	%xcc,	%l6,	%l0
	fmovdpos	%icc,	%f6,	%f25
	umul	%g1,	%g7,	%i1
	sra	%g2,	0x1A,	%o0
	stb	%i4,	[%l7 + 0x11]
	fmovdneg	%icc,	%f31,	%f18
	fandnot1	%f24,	%f0,	%f12
	fandnot2	%f4,	%f12,	%f18
	fcmps	%fcc1,	%f1,	%f10
	alignaddrl	%i5,	%g3,	%l3
	movl	%xcc,	%g4,	%i2
	addc	%o3,	%o4,	%o6
	edge16l	%i3,	%i6,	%o5
	sll	%l1,	0x13,	%o2
	movne	%icc,	%l4,	%l5
	umul	%o1,	%l2,	%g6
	fpadd16s	%f8,	%f1,	%f28
	fmovscc	%icc,	%f0,	%f3
	fnot1	%f8,	%f2
	edge8n	%o7,	%g5,	%i0
	orncc	%l6,	0x1BE0,	%i7
	sra	%l0,	0x0D,	%g1
	movrlez	%g7,	%g2,	%i1
	restore %o0, %i5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%l3,	%g4
	ldd	[%l7 + 0x60],	%g2
	fandnot2s	%f4,	%f6,	%f22
	srl	%o3,	0x1C,	%i2
	movneg	%icc,	%o4,	%o6
	bshuffle	%f24,	%f30,	%f0
	fsrc1s	%f17,	%f16
	fmovrslz	%i3,	%f25,	%f14
	stb	%o5,	[%l7 + 0x20]
	fmovde	%xcc,	%f10,	%f28
	movg	%xcc,	%l1,	%o2
	movvs	%xcc,	%l4,	%l5
	ldd	[%l7 + 0x70],	%i6
	array16	%l2,	%g6,	%o1
	srax	%o7,	%g5,	%i0
	movrne	%i7,	0x3B7,	%l0
	edge16l	%l6,	%g7,	%g1
	sll	%i1,	0x08,	%o0
	fxnors	%f18,	%f12,	%f7
	or	%i5,	%i4,	%g2
	movge	%icc,	%g4,	%g3
	fpadd32s	%f16,	%f13,	%f24
	ldsb	[%l7 + 0x5A],	%l3
	fpack16	%f20,	%f22
	ldsb	[%l7 + 0x23],	%i2
	movrlez	%o3,	0x020,	%o4
	edge16n	%o6,	%i3,	%l1
	fmul8ulx16	%f20,	%f0,	%f10
	movpos	%icc,	%o5,	%o2
	add	%l5,	0x0014,	%l4
	fmovsge	%icc,	%f10,	%f22
	addcc	%i6,	%l2,	%o1
	fsrc2s	%f29,	%f28
	udivx	%o7,	0x12F0,	%g5
	ldd	[%l7 + 0x40],	%f22
	edge32n	%g6,	%i0,	%l0
	sdivcc	%l6,	0x1B99,	%i7
	stw	%g1,	[%l7 + 0x08]
	orcc	%g7,	0x0E28,	%o0
	st	%f8,	[%l7 + 0x48]
	fnand	%f14,	%f22,	%f6
	umul	%i1,	%i4,	%g2
	movrlez	%i5,	0x2E6,	%g4
	umul	%l3,	0x1D79,	%g3
	edge8	%i2,	%o4,	%o6
	lduh	[%l7 + 0x0C],	%o3
	sdivx	%l1,	0x10BC,	%i3
	edge32ln	%o5,	%l5,	%l4
	udivcc	%o2,	0x11CE,	%i6
	edge8	%o1,	%o7,	%l2
	edge16n	%g6,	%g5,	%i0
	ldsb	[%l7 + 0x2A],	%l0
	addcc	%l6,	0x07B3,	%i7
	fsrc2s	%f20,	%f30
	mulx	%g1,	%g7,	%i1
	srl	%i4,	0x17,	%o0
	st	%f12,	[%l7 + 0x40]
	movge	%xcc,	%i5,	%g2
	fmovrdlz	%l3,	%f8,	%f22
	movn	%icc,	%g3,	%i2
	sdivcc	%o4,	0x1F3D,	%o6
	array16	%o3,	%l1,	%g4
	edge32ln	%o5,	%l5,	%i3
	edge16	%o2,	%i6,	%l4
	fmovrdlz	%o1,	%f6,	%f4
	ldx	[%l7 + 0x70],	%l2
	subc	%g6,	0x0D79,	%o7
	smul	%g5,	0x13CE,	%l0
	fpsub32	%f24,	%f30,	%f0
	fmovdleu	%xcc,	%f24,	%f2
	fmovsvs	%xcc,	%f28,	%f8
	edge16ln	%l6,	%i0,	%i7
	edge8ln	%g1,	%i1,	%g7
	umul	%o0,	%i5,	%i4
	sdiv	%l3,	0x1E05,	%g3
	movrgez	%i2,	0x3E9,	%o4
	xnor	%o6,	%o3,	%g2
	movleu	%xcc,	%g4,	%l1
	smulcc	%o5,	0x18D0,	%i3
	movrlez	%l5,	0x36A,	%o2
	ldsw	[%l7 + 0x30],	%i6
	fcmpd	%fcc1,	%f30,	%f6
	sllx	%l4,	%l2,	%g6
	fornot2s	%f14,	%f22,	%f28
	fmovrdlez	%o1,	%f4,	%f28
	movleu	%icc,	%g5,	%o7
	fmul8x16	%f22,	%f28,	%f12
	stb	%l0,	[%l7 + 0x5E]
	fmovsg	%xcc,	%f14,	%f13
	movle	%icc,	%i0,	%i7
	std	%f14,	[%l7 + 0x60]
	edge8n	%g1,	%i1,	%g7
	fmul8sux16	%f24,	%f26,	%f24
	fandnot2s	%f22,	%f24,	%f9
	fmovdg	%icc,	%f20,	%f5
	fmovrsgz	%l6,	%f11,	%f24
	fcmpeq32	%f12,	%f8,	%o0
	lduw	[%l7 + 0x5C],	%i4
	movne	%xcc,	%i5,	%l3
	pdist	%f8,	%f22,	%f12
	edge32l	%i2,	%o4,	%o6
	orn	%o3,	%g2,	%g4
	fmovdle	%xcc,	%f0,	%f30
	edge16l	%g3,	%l1,	%i3
	fcmped	%fcc0,	%f22,	%f26
	movg	%icc,	%o5,	%l5
	orn	%i6,	%o2,	%l4
	fornot2s	%f4,	%f19,	%f25
	fcmple16	%f28,	%f18,	%l2
	faligndata	%f4,	%f12,	%f16
	edge32l	%o1,	%g6,	%o7
	ldd	[%l7 + 0x20],	%f10
	fone	%f4
	sth	%l0,	[%l7 + 0x18]
	movre	%g5,	%i0,	%g1
	ldd	[%l7 + 0x30],	%f6
	st	%f19,	[%l7 + 0x64]
	xnor	%i7,	0x0FC6,	%i1
	or	%l6,	%g7,	%i4
	sir	0x1746
	alignaddr	%o0,	%i5,	%i2
	addccc	%l3,	0x1289,	%o4
	movl	%icc,	%o3,	%g2
	movg	%xcc,	%o6,	%g4
	fpsub32	%f2,	%f28,	%f6
	subccc	%g3,	%l1,	%o5
	stx	%i3,	[%l7 + 0x38]
	smul	%l5,	0x181E,	%o2
	andcc	%i6,	0x16D8,	%l4
	xorcc	%o1,	0x036B,	%l2
	fmovrdgz	%g6,	%f30,	%f6
	fcmpne16	%f22,	%f30,	%l0
	smulcc	%o7,	%g5,	%i0
	xor	%i7,	0x12B3,	%i1
	fmovsa	%xcc,	%f23,	%f19
	stw	%l6,	[%l7 + 0x54]
	movl	%icc,	%g7,	%g1
	fmul8x16au	%f23,	%f0,	%f26
	ldsh	[%l7 + 0x6C],	%o0
	fmovsvc	%xcc,	%f4,	%f26
	popc	%i5,	%i4
	siam	0x3
	subcc	%l3,	%o4,	%i2
	or	%g2,	%o3,	%g4
	srax	%g3,	0x00,	%l1
	xorcc	%o5,	%i3,	%o6
	edge8l	%o2,	%l5,	%i6
	edge32n	%o1,	%l2,	%l4
	ldsw	[%l7 + 0x74],	%l0
	mova	%xcc,	%g6,	%g5
	array8	%o7,	%i0,	%i7
	mulx	%l6,	0x0418,	%i1
	edge8l	%g7,	%g1,	%o0
	move	%icc,	%i4,	%l3
	edge8n	%o4,	%i5,	%g2
	xor	%i2,	0x0F2A,	%g4
	sllx	%g3,	%o3,	%l1
	sra	%o5,	%i3,	%o2
	subcc	%l5,	%o6,	%o1
	mova	%xcc,	%i6,	%l2
	ldsh	[%l7 + 0x68],	%l0
	andncc	%g6,	%g5,	%o7
	xorcc	%l4,	%i0,	%l6
	sllx	%i7,	%g7,	%i1
	andncc	%g1,	%o0,	%i4
	edge16n	%l3,	%o4,	%i5
	fmovda	%xcc,	%f19,	%f8
	fors	%f18,	%f2,	%f9
	addc	%g2,	0x0FC0,	%g4
	movvc	%icc,	%g3,	%o3
	addcc	%i2,	%l1,	%o5
	st	%f25,	[%l7 + 0x48]
	sub	%o2,	%l5,	%i3
	andn	%o6,	0x1A1C,	%i6
	alignaddr	%o1,	%l2,	%g6
	fandnot1s	%f0,	%f13,	%f12
	movrgz	%g5,	0x05B,	%o7
	nop
	set	0x78, %o3
	std	%f20,	[%l7 + %o3]
	ld	[%l7 + 0x40],	%f27
	andcc	%l4,	0x0E7F,	%i0
	stx	%l6,	[%l7 + 0x60]
	sll	%l0,	0x0C,	%i7
	srl	%g7,	0x15,	%g1
	movge	%icc,	%i1,	%i4
	for	%f18,	%f24,	%f14
	sdiv	%l3,	0x0B53,	%o4
	edge32l	%o0,	%g2,	%g4
	movgu	%xcc,	%i5,	%o3
	fandnot1s	%f31,	%f19,	%f10
	and	%g3,	%i2,	%o5
	alignaddrl	%l1,	%o2,	%i3
	fzeros	%f9
	edge32n	%o6,	%l5,	%o1
	movpos	%xcc,	%i6,	%l2
	fcmple16	%f8,	%f12,	%g6
	movg	%xcc,	%g5,	%o7
	movge	%icc,	%i0,	%l6
	edge16n	%l4,	%l0,	%i7
	movneg	%icc,	%g1,	%i1
	movle	%icc,	%g7,	%i4
	orncc	%o4,	0x15C3,	%l3
	movg	%icc,	%o0,	%g2
	movneg	%xcc,	%i5,	%o3
	fmovdvc	%xcc,	%f27,	%f27
	addccc	%g3,	0x0174,	%g4
	ldx	[%l7 + 0x20],	%i2
	mulscc	%l1,	0x16FC,	%o5
	movg	%xcc,	%o2,	%o6
	array32	%i3,	%l5,	%i6
	fzeros	%f18
	fcmpes	%fcc0,	%f25,	%f16
	sdivx	%l2,	0x1E2E,	%o1
	fsrc2s	%f6,	%f9
	movrgz	%g6,	0x11D,	%g5
	popc	%i0,	%o7
	fmovdgu	%xcc,	%f5,	%f20
	movleu	%xcc,	%l6,	%l4
	addccc	%i7,	0x179F,	%g1
	st	%f6,	[%l7 + 0x64]
	fxors	%f27,	%f29,	%f3
	fsrc2s	%f15,	%f16
	sdivcc	%l0,	0x1EDB,	%g7
	edge16ln	%i1,	%i4,	%l3
	array8	%o4,	%o0,	%i5
	subcc	%g2,	0x0514,	%g3
	andncc	%o3,	%i2,	%g4
	fzero	%f18
	fmovrse	%o5,	%f4,	%f28
	array16	%o2,	%o6,	%i3
	andn	%l1,	%l5,	%i6
	pdist	%f12,	%f18,	%f0
	fmovscc	%icc,	%f10,	%f15
	ldsb	[%l7 + 0x77],	%o1
	nop
	set	0x40, %l0
	sth	%g6,	[%l7 + %l0]
	add	%l2,	%g5,	%o7
	ldd	[%l7 + 0x58],	%f16
	mulx	%i0,	%l6,	%i7
	andncc	%l4,	%g1,	%g7
	array16	%l0,	%i1,	%l3
	movg	%xcc,	%i4,	%o0
	movneg	%icc,	%o4,	%g2
	sth	%g3,	[%l7 + 0x26]
	movgu	%xcc,	%i5,	%o3
	ldsw	[%l7 + 0x28],	%i2
	fmul8x16au	%f24,	%f28,	%f4
	xnorcc	%o5,	%g4,	%o2
	fmovdn	%icc,	%f25,	%f14
	array8	%i3,	%o6,	%l5
	smul	%i6,	%l1,	%o1
	stb	%l2,	[%l7 + 0x3A]
	edge32n	%g6,	%g5,	%i0
	movn	%icc,	%o7,	%i7
	fmovsvs	%xcc,	%f22,	%f8
	subc	%l4,	%g1,	%g7
	ldub	[%l7 + 0x3B],	%l0
	array16	%l6,	%l3,	%i1
	fands	%f0,	%f18,	%f24
	fmovspos	%icc,	%f19,	%f30
	edge16n	%o0,	%o4,	%i4
	save %g3, 0x0D77, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f9,	%f24
	fmovrslez	%o3,	%f4,	%f31
	movle	%icc,	%i2,	%g2
	fmovdneg	%icc,	%f10,	%f12
	smulcc	%g4,	%o5,	%i3
	edge32l	%o6,	%o2,	%l5
	stb	%i6,	[%l7 + 0x39]
	smul	%l1,	%l2,	%o1
	movrne	%g5,	0x00C,	%i0
	addccc	%o7,	0x1290,	%i7
	ldx	[%l7 + 0x40],	%g6
	edge32n	%l4,	%g7,	%g1
	sll	%l0,	%l6,	%l3
	subccc	%i1,	0x1474,	%o0
	subcc	%o4,	0x1740,	%i4
	ldx	[%l7 + 0x48],	%i5
	fsrc2	%f20,	%f26
	umul	%o3,	0x1D7F,	%i2
	fandnot1s	%f5,	%f4,	%f11
	sll	%g2,	0x07,	%g4
	sll	%o5,	0x0E,	%g3
	std	%f8,	[%l7 + 0x18]
	umulcc	%o6,	0x1915,	%i3
	addccc	%o2,	0x0C17,	%l5
	addcc	%i6,	0x125D,	%l2
	ldd	[%l7 + 0x58],	%l0
	nop
	set	0x46, %i4
	sth	%o1,	[%l7 + %i4]
	std	%f22,	[%l7 + 0x68]
	ldsw	[%l7 + 0x08],	%i0
	movrlez	%o7,	0x159,	%i7
	fpack32	%f4,	%f4,	%f26
	subc	%g6,	%g5,	%g7
	andncc	%l4,	%g1,	%l6
	pdist	%f6,	%f28,	%f20
	movleu	%xcc,	%l3,	%i1
	addcc	%l0,	0x0585,	%o4
	andcc	%i4,	0x09CC,	%o0
	mova	%icc,	%o3,	%i2
	fpsub32s	%f11,	%f14,	%f14
	sllx	%i5,	0x11,	%g4
	stb	%g2,	[%l7 + 0x0E]
	edge16ln	%g3,	%o5,	%i3
	edge8l	%o2,	%o6,	%i6
	edge8n	%l2,	%l1,	%o1
	fmovrsne	%i0,	%f26,	%f23
	fmovsleu	%icc,	%f15,	%f22
	stb	%l5,	[%l7 + 0x7B]
	movrgez	%i7,	0x3EF,	%o7
	alignaddr	%g5,	%g6,	%g7
	movneg	%xcc,	%l4,	%l6
	lduw	[%l7 + 0x44],	%l3
	edge32l	%i1,	%l0,	%g1
	movrlez	%o4,	%o0,	%i4
	movne	%xcc,	%o3,	%i5
	sir	0x1ADC
	sllx	%i2,	0x1D,	%g2
	sdivcc	%g3,	0x1001,	%o5
	movvc	%icc,	%g4,	%i3
	fmovsa	%xcc,	%f2,	%f29
	xnorcc	%o2,	%i6,	%l2
	srlx	%o6,	0x0A,	%l1
	sub	%o1,	0x14A0,	%i0
	sth	%i7,	[%l7 + 0x6C]
	edge8ln	%o7,	%g5,	%l5
	faligndata	%f8,	%f14,	%f30
	udiv	%g6,	0x1CE5,	%g7
	ldd	[%l7 + 0x10],	%f12
	umulcc	%l6,	%l3,	%i1
	fmuld8ulx16	%f13,	%f21,	%f26
	faligndata	%f0,	%f6,	%f26
	fcmpgt16	%f20,	%f6,	%l4
	fxors	%f9,	%f6,	%f28
	save %g1, 0x1F3D, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l0,	%i4,	%o0
	stw	%i5,	[%l7 + 0x7C]
	movne	%xcc,	%i2,	%o3
	edge16l	%g3,	%o5,	%g2
	addccc	%g4,	0x1DCE,	%o2
	sllx	%i3,	0x13,	%i6
	lduw	[%l7 + 0x08],	%l2
	fmovdgu	%xcc,	%f14,	%f7
	addcc	%l1,	0x0B06,	%o1
	udivcc	%i0,	0x001A,	%i7
	and	%o6,	0x0312,	%g5
	fandnot1s	%f12,	%f7,	%f8
	nop
	set	0x60, %o5
	std	%f28,	[%l7 + %o5]
	fcmpgt16	%f26,	%f26,	%l5
	array32	%o7,	%g7,	%l6
	popc	%g6,	%i1
	std	%f0,	[%l7 + 0x18]
	ldx	[%l7 + 0x20],	%l4
	sir	0x04CE
	fmovs	%f5,	%f9
	fmovda	%icc,	%f28,	%f7
	movrgz	%g1,	%l3,	%l0
	udivx	%i4,	0x05D8,	%o0
	fmovdle	%icc,	%f23,	%f11
	sth	%o4,	[%l7 + 0x14]
	sdivcc	%i2,	0x1E92,	%o3
	movle	%icc,	%g3,	%o5
	movrgz	%g2,	0x3E4,	%g4
	ldx	[%l7 + 0x38],	%o2
	srl	%i5,	%i3,	%i6
	fandnot1s	%f7,	%f10,	%f27
	edge8l	%l2,	%l1,	%i0
	movrlz	%o1,	%o6,	%g5
	ldub	[%l7 + 0x31],	%i7
	stx	%l5,	[%l7 + 0x28]
	fnegd	%f12,	%f10
	sdiv	%o7,	0x1EFF,	%g7
	sllx	%g6,	%l6,	%l4
	udivcc	%g1,	0x0302,	%l3
	edge16ln	%i1,	%l0,	%o0
	fmovsgu	%icc,	%f21,	%f22
	fcmped	%fcc2,	%f30,	%f4
	andcc	%o4,	0x106C,	%i2
	alignaddrl	%o3,	%i4,	%o5
	smulcc	%g3,	%g2,	%o2
	fornot2	%f20,	%f0,	%f8
	or	%g4,	%i5,	%i3
	orn	%l2,	0x148D,	%l1
	stx	%i6,	[%l7 + 0x30]
	fmovs	%f14,	%f0
	movre	%o1,	%i0,	%o6
	sdivcc	%g5,	0x158B,	%l5
	edge32n	%i7,	%o7,	%g7
	fornot2	%f26,	%f0,	%f4
	subccc	%l6,	0x15F0,	%l4
	movvs	%icc,	%g1,	%g6
	array16	%i1,	%l0,	%l3
	ldx	[%l7 + 0x30],	%o0
	array8	%i2,	%o4,	%i4
	edge8l	%o3,	%o5,	%g3
	movrgez	%g2,	0x1E6,	%g4
	movrlez	%o2,	%i3,	%l2
	movrgz	%l1,	0x3B9,	%i6
	xnor	%o1,	0x1B6D,	%i5
	fmovdle	%icc,	%f14,	%f9
	fmovrdgez	%o6,	%f30,	%f28
	movne	%icc,	%g5,	%l5
	orcc	%i7,	%o7,	%g7
	srax	%i0,	0x02,	%l6
	movle	%icc,	%g1,	%l4
	mulx	%i1,	0x17D5,	%l0
	ldd	[%l7 + 0x78],	%g6
	smul	%l3,	0x1574,	%i2
	movpos	%icc,	%o0,	%o4
	move	%xcc,	%i4,	%o3
	move	%xcc,	%g3,	%g2
	fmovdl	%icc,	%f2,	%f23
	fnegd	%f16,	%f22
	array16	%o5,	%g4,	%i3
	sllx	%o2,	%l2,	%i6
	ldd	[%l7 + 0x40],	%l0
	ldd	[%l7 + 0x58],	%o0
	movgu	%xcc,	%i5,	%o6
	movvs	%icc,	%l5,	%i7
	array8	%o7,	%g5,	%i0
	addcc	%l6,	%g7,	%l4
	alignaddr	%g1,	%l0,	%g6
	fmovdge	%xcc,	%f28,	%f29
	faligndata	%f16,	%f16,	%f30
	bshuffle	%f30,	%f16,	%f24
	add	%i1,	0x0A34,	%i2
	array8	%l3,	%o0,	%o4
	subccc	%i4,	%g3,	%o3
	edge32n	%o5,	%g4,	%i3
	move	%xcc,	%o2,	%l2
	fmovsgu	%icc,	%f20,	%f31
	fmovdvs	%icc,	%f11,	%f12
	movvs	%icc,	%g2,	%l1
	fpadd16	%f6,	%f24,	%f20
	edge8l	%i6,	%o1,	%o6
	movrgez	%l5,	0x181,	%i7
	sra	%i5,	%o7,	%g5
	subcc	%l6,	%g7,	%i0
	ldsb	[%l7 + 0x13],	%l4
	edge16ln	%l0,	%g6,	%g1
	fnands	%f11,	%f10,	%f15
	stw	%i2,	[%l7 + 0x44]
	movcs	%icc,	%i1,	%o0
	array32	%o4,	%i4,	%l3
	fmul8ulx16	%f12,	%f8,	%f4
	fmovrdlz	%o3,	%f30,	%f24
	add	%o5,	0x092E,	%g3
	stb	%i3,	[%l7 + 0x35]
	move	%icc,	%o2,	%g4
	movne	%xcc,	%l2,	%g2
	sll	%l1,	%o1,	%o6
	sllx	%l5,	%i6,	%i7
	smul	%i5,	%o7,	%l6
	fpsub16s	%f26,	%f31,	%f3
	std	%f18,	[%l7 + 0x40]
	fcmpeq16	%f14,	%f22,	%g5
	orcc	%g7,	0x0F2B,	%l4
	orcc	%l0,	%i0,	%g1
	popc	0x1ED3,	%g6
	movrgez	%i1,	0x254,	%i2
	fnot1s	%f15,	%f22
	andcc	%o0,	%i4,	%l3
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	sdivx	%g3,	0x014B,	%i3
	fpack16	%f12,	%f2
	edge8l	%o2,	%o3,	%g4
	lduw	[%l7 + 0x28],	%l2
	andncc	%l1,	%g2,	%o1
	xor	%o6,	%i6,	%i7
	ldsb	[%l7 + 0x19],	%i5
	addccc	%l5,	%l6,	%o7
	edge32n	%g7,	%l4,	%g5
	fmovde	%xcc,	%f16,	%f27
	sdivx	%i0,	0x0A44,	%l0
	ldx	[%l7 + 0x30],	%g6
	orncc	%i1,	0x00F5,	%i2
	edge16ln	%o0,	%g1,	%i4
	edge16n	%o4,	%l3,	%o5
	umulcc	%g3,	0x0FCD,	%i3
	mulscc	%o2,	0x02D9,	%g4
	movle	%icc,	%o3,	%l2
	fors	%f22,	%f16,	%f0
	addcc	%l1,	0x03B9,	%g2
	fmovspos	%xcc,	%f29,	%f0
	udivx	%o1,	0x08B0,	%i6
	mulx	%i7,	%i5,	%o6
	xorcc	%l5,	%o7,	%g7
	sll	%l4,	0x19,	%l6
	fmovrdlez	%i0,	%f10,	%f26
	udivx	%g5,	0x122A,	%l0
	movrgz	%g6,	0x284,	%i2
	edge8l	%i1,	%o0,	%g1
	fmovrdlz	%i4,	%f26,	%f10
	movrne	%o4,	0x0D2,	%o5
	movre	%g3,	0x059,	%l3
	move	%icc,	%o2,	%i3
	udivcc	%o3,	0x11CC,	%g4
	addccc	%l1,	%g2,	%o1
	fpackfix	%f10,	%f0
	fpsub32s	%f13,	%f3,	%f12
	fcmpne32	%f2,	%f2,	%l2
	movleu	%icc,	%i6,	%i7
	smul	%o6,	%i5,	%l5
	sllx	%o7,	0x0F,	%g7
	nop
	set	0x70, %g4
	ldd	[%l7 + %g4],	%i6
	mova	%xcc,	%l4,	%i0
	move	%xcc,	%l0,	%g6
	fmul8ulx16	%f8,	%f0,	%f6
	edge8ln	%g5,	%i1,	%i2
	sllx	%g1,	0x10,	%i4
	fors	%f12,	%f3,	%f3
	umulcc	%o4,	0x0638,	%o0
	ldx	[%l7 + 0x40],	%o5
	sub	%g3,	0x1285,	%o2
	fmovrsgez	%i3,	%f24,	%f9
	edge16ln	%o3,	%g4,	%l1
	fpsub16s	%f2,	%f29,	%f22
	edge8ln	%l3,	%o1,	%l2
	ldsh	[%l7 + 0x38],	%g2
	movl	%icc,	%i6,	%i7
	sdivx	%i5,	0x01A3,	%o6
	restore %l5, %o7, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l4,	%i0,	%l6
	ldsw	[%l7 + 0x78],	%l0
	sdivcc	%g5,	0x018F,	%i1
	fmuld8sux16	%f12,	%f14,	%f8
	movvs	%xcc,	%i2,	%g1
	andncc	%g6,	%i4,	%o0
	movcc	%xcc,	%o5,	%o4
	udivx	%g3,	0x1DF9,	%i3
	stb	%o3,	[%l7 + 0x61]
	movgu	%icc,	%o2,	%l1
	fandnot1	%f28,	%f14,	%f16
	edge32	%g4,	%o1,	%l2
	movge	%xcc,	%l3,	%i6
	srlx	%g2,	%i5,	%o6
	fmovdn	%xcc,	%f7,	%f8
	movrlez	%l5,	%o7,	%i7
	lduh	[%l7 + 0x48],	%l4
	srl	%g7,	0x1B,	%l6
	stw	%i0,	[%l7 + 0x2C]
	popc	0x0AFF,	%g5
	ld	[%l7 + 0x6C],	%f30
	andn	%l0,	0x1FF0,	%i2
	ldsb	[%l7 + 0x35],	%i1
	movgu	%xcc,	%g1,	%i4
	edge8	%o0,	%o5,	%g6
	add	%o4,	0x1784,	%i3
	fsrc2s	%f9,	%f13
	edge16l	%o3,	%o2,	%g3
	orn	%l1,	0x102C,	%g4
	std	%f24,	[%l7 + 0x60]
	sdivx	%l2,	0x1C53,	%l3
	movneg	%icc,	%o1,	%g2
	fone	%f20
	popc	0x167B,	%i6
	orcc	%o6,	%i5,	%o7
	sub	%l5,	%l4,	%i7
	ldx	[%l7 + 0x60],	%l6
	edge16l	%g7,	%i0,	%g5
	ldsh	[%l7 + 0x5A],	%i2
	mova	%icc,	%l0,	%i1
	movvc	%icc,	%i4,	%o0
	st	%f17,	[%l7 + 0x64]
	sdiv	%o5,	0x0D4E,	%g6
	edge32n	%o4,	%i3,	%o3
	movg	%icc,	%o2,	%g3
	movrlez	%l1,	%g4,	%g1
	fmovdvs	%xcc,	%f28,	%f28
	xor	%l3,	0x0C93,	%o1
	fmovrse	%l2,	%f23,	%f2
	movn	%icc,	%i6,	%g2
	addcc	%o6,	%o7,	%i5
	nop
	set	0x3C, %i6
	ldsw	[%l7 + %i6],	%l5
	and	%l4,	0x1019,	%i7
	addccc	%l6,	0x0F55,	%i0
	orncc	%g7,	0x0CBF,	%g5
	movl	%xcc,	%i2,	%l0
	sethi	0x0F9B,	%i1
	stx	%o0,	[%l7 + 0x08]
	fmovsvc	%icc,	%f24,	%f17
	sllx	%o5,	%g6,	%i4
	subccc	%i3,	0x0163,	%o4
	xorcc	%o3,	%g3,	%o2
	ldsb	[%l7 + 0x7F],	%g4
	popc	0x14F2,	%l1
	edge8	%l3,	%o1,	%g1
	std	%f6,	[%l7 + 0x50]
	ldub	[%l7 + 0x6E],	%i6
	movvs	%xcc,	%l2,	%g2
	alignaddr	%o6,	%o7,	%l5
	edge16	%i5,	%i7,	%l6
	movrlz	%i0,	%l4,	%g5
	mulx	%i2,	0x141B,	%g7
	udiv	%i1,	0x0513,	%o0
	srax	%l0,	0x02,	%g6
	fmovse	%icc,	%f10,	%f19
	fmovdcc	%icc,	%f16,	%f11
	fmovsvc	%icc,	%f15,	%f5
	stw	%i4,	[%l7 + 0x74]
	movpos	%icc,	%o5,	%o4
	edge16n	%o3,	%i3,	%o2
	ldub	[%l7 + 0x15],	%g4
	andn	%l1,	%l3,	%o1
	orn	%g1,	%g3,	%l2
	fzeros	%f31
	sllx	%g2,	%i6,	%o7
	st	%f6,	[%l7 + 0x18]
	edge16ln	%o6,	%l5,	%i7
	movrgz	%i5,	0x255,	%i0
	addc	%l6,	0x17F3,	%g5
	smul	%l4,	%i2,	%i1
	sdiv	%o0,	0x0B2E,	%g7
	movgu	%xcc,	%l0,	%g6
	edge16n	%o5,	%o4,	%i4
	std	%f2,	[%l7 + 0x20]
	sll	%i3,	0x00,	%o2
	edge32n	%o3,	%l1,	%l3
	orncc	%o1,	%g4,	%g1
	udivx	%l2,	0x11DB,	%g3
	st	%f19,	[%l7 + 0x50]
	edge16	%i6,	%g2,	%o6
	umulcc	%l5,	%o7,	%i7
	movgu	%xcc,	%i5,	%i0
	fmovde	%xcc,	%f9,	%f23
	movcc	%xcc,	%l6,	%g5
	subcc	%i2,	%l4,	%o0
	srl	%g7,	%i1,	%l0
	fcmple16	%f0,	%f12,	%g6
	fnot1	%f22,	%f4
	alignaddr	%o4,	%o5,	%i3
	sll	%o2,	%o3,	%l1
	add	%l3,	%o1,	%g4
	smulcc	%g1,	%i4,	%l2
	save %i6, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l5,	0x0589,	%o7
	fexpand	%f0,	%f20
	fmovdn	%xcc,	%f6,	%f1
	edge16	%i7,	%i5,	%i0
	sdivcc	%o6,	0x025E,	%g5
	ldsh	[%l7 + 0x24],	%i2
	movrgez	%l4,	0x125,	%o0
	movleu	%icc,	%l6,	%i1
	lduh	[%l7 + 0x7A],	%g7
	edge32n	%g6,	%o4,	%l0
	fnot1	%f4,	%f16
	movl	%icc,	%i3,	%o2
	nop
	set	0x54, %i3
	lduh	[%l7 + %i3],	%o3
	movpos	%icc,	%o5,	%l3
	movneg	%icc,	%l1,	%g4
	movrlez	%o1,	%g1,	%l2
	xorcc	%i4,	0x0E07,	%i6
	fpsub32s	%f22,	%f30,	%f27
	fmovrdlez	%g2,	%f18,	%f18
	lduw	[%l7 + 0x3C],	%g3
	fmovda	%icc,	%f2,	%f7
	bshuffle	%f14,	%f26,	%f18
	mulx	%l5,	%o7,	%i7
	edge16l	%i0,	%i5,	%g5
	mulx	%i2,	0x1ACA,	%l4
	std	%f16,	[%l7 + 0x78]
	movvc	%icc,	%o0,	%o6
	mova	%xcc,	%l6,	%g7
	fmovsgu	%xcc,	%f22,	%f29
	fandnot2	%f0,	%f26,	%f6
	nop
	set	0x10, %g2
	ldub	[%l7 + %g2],	%g6
	edge32l	%o4,	%i1,	%l0
	movcs	%icc,	%o2,	%o3
	mulscc	%o5,	0x1E5A,	%i3
	fmovscc	%icc,	%f19,	%f24
	edge32l	%l3,	%l1,	%o1
	fmovspos	%icc,	%f21,	%f27
	ldsw	[%l7 + 0x6C],	%g1
	movgu	%xcc,	%l2,	%g4
	sethi	0x0699,	%i6
	fmul8x16au	%f15,	%f8,	%f12
	movle	%xcc,	%i4,	%g2
	sir	0x1AEB
	sth	%g3,	[%l7 + 0x5E]
	sra	%l5,	%i7,	%i0
	xnor	%o7,	0x1D07,	%i5
	edge8l	%i2,	%g5,	%o0
	edge32	%o6,	%l4,	%l6
	sethi	0x0790,	%g6
	alignaddrl	%o4,	%i1,	%l0
	movrlez	%g7,	0x3F3,	%o3
	ldd	[%l7 + 0x70],	%o2
	addccc	%i3,	%l3,	%o5
	movre	%l1,	%o1,	%l2
	fornot1	%f4,	%f28,	%f16
	srl	%g1,	%i6,	%g4
	movrgz	%i4,	%g3,	%l5
	srax	%g2,	0x05,	%i7
	edge16l	%o7,	%i0,	%i5
	fmovsleu	%xcc,	%f20,	%f9
	std	%f24,	[%l7 + 0x58]
	fmovdle	%xcc,	%f16,	%f9
	mulx	%g5,	0x1EF7,	%i2
	sll	%o0,	0x02,	%o6
	movgu	%icc,	%l4,	%l6
	ldd	[%l7 + 0x10],	%o4
	edge32	%i1,	%g6,	%g7
	movl	%icc,	%l0,	%o3
	movre	%i3,	0x048,	%o2
	subc	%o5,	%l1,	%o1
	alignaddr	%l3,	%l2,	%g1
	nop
	set	0x58, %i2
	lduw	[%l7 + %i2],	%g4
	move	%xcc,	%i6,	%g3
	movrlez	%l5,	0x173,	%g2
	fsrc1	%f8,	%f12
	movre	%i4,	%i7,	%i0
	smul	%i5,	0x0ABD,	%o7
	orcc	%i2,	%g5,	%o6
	fmovdne	%icc,	%f13,	%f19
	movrlez	%o0,	0x0D6,	%l6
	fmovrsne	%o4,	%f12,	%f27
	siam	0x7
	nop
	set	0x60, %o2
	stw	%i1,	[%l7 + %o2]
	movre	%l4,	0x100,	%g7
	fmovda	%icc,	%f23,	%f12
	save %l0, 0x08E0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i3,	0x19,	%g6
	fcmpes	%fcc2,	%f26,	%f6
	edge32n	%o2,	%o5,	%o1
	mulscc	%l3,	0x019E,	%l1
	sdivcc	%g1,	0x1E0B,	%g4
	fpsub32s	%f5,	%f31,	%f11
	fmovdpos	%icc,	%f24,	%f27
	alignaddr	%i6,	%g3,	%l5
	sub	%g2,	%i4,	%i7
	umulcc	%i0,	0x12D4,	%l2
	edge32l	%o7,	%i2,	%i5
	fcmpes	%fcc3,	%f17,	%f10
	srlx	%g5,	0x1A,	%o6
	movrlez	%l6,	%o4,	%o0
	sub	%l4,	%i1,	%l0
	orncc	%o3,	%g7,	%g6
	or	%o2,	%o5,	%o1
	andcc	%i3,	0x0629,	%l3
	sllx	%g1,	0x17,	%g4
	and	%l1,	0x0E2D,	%g3
	stw	%l5,	[%l7 + 0x10]
	st	%f12,	[%l7 + 0x24]
	ldsb	[%l7 + 0x2C],	%i6
	sllx	%g2,	%i7,	%i0
	array32	%i4,	%l2,	%o7
	fcmps	%fcc2,	%f4,	%f13
	umulcc	%i5,	%g5,	%i2
	sethi	0x112A,	%o6
	movrlz	%l6,	0x1B6,	%o0
	ldsb	[%l7 + 0x1A],	%o4
	sllx	%l4,	%i1,	%l0
	ldd	[%l7 + 0x50],	%f0
	nop
	set	0x40, %g6
	lduw	[%l7 + %g6],	%o3
	array8	%g6,	%o2,	%g7
	fpack16	%f30,	%f23
	nop
	set	0x35, %l5
	stb	%o1,	[%l7 + %l5]
	udiv	%i3,	0x0B54,	%o5
	sra	%l3,	0x09,	%g4
	movl	%xcc,	%l1,	%g1
	stw	%l5,	[%l7 + 0x08]
	fmovspos	%xcc,	%f5,	%f13
	sth	%g3,	[%l7 + 0x50]
	ld	[%l7 + 0x68],	%f26
	std	%f8,	[%l7 + 0x38]
	fmul8x16al	%f19,	%f9,	%f20
	movcs	%xcc,	%i6,	%g2
	smulcc	%i0,	%i4,	%i7
	addc	%l2,	0x1D03,	%o7
	movvc	%xcc,	%g5,	%i2
	fcmps	%fcc0,	%f5,	%f0
	sllx	%i5,	%o6,	%l6
	movrgez	%o4,	0x188,	%l4
	edge32	%o0,	%l0,	%i1
	fmovsl	%icc,	%f3,	%f18
	sdiv	%o3,	0x1CDF,	%o2
	sdiv	%g7,	0x03D9,	%o1
	stx	%i3,	[%l7 + 0x40]
	fmovsvs	%icc,	%f0,	%f28
	fmovrsgz	%o5,	%f10,	%f17
	ld	[%l7 + 0x0C],	%f16
	stw	%g6,	[%l7 + 0x70]
	sra	%l3,	%g4,	%l1
	nop
	set	0x60, %g1
	ldsh	[%l7 + %g1],	%g1
	std	%f4,	[%l7 + 0x10]
	movpos	%xcc,	%l5,	%g3
	fands	%f16,	%f19,	%f0
	stx	%g2,	[%l7 + 0x60]
	ldd	[%l7 + 0x48],	%i6
	nop
	set	0x49, %l2
	ldub	[%l7 + %l2],	%i4
	srl	%i7,	0x15,	%i0
	addc	%l2,	%o7,	%i2
	movpos	%xcc,	%i5,	%o6
	fnot1s	%f26,	%f3
	fmovscs	%xcc,	%f22,	%f1
	fnot1	%f10,	%f10
	fones	%f10
	movne	%icc,	%l6,	%o4
	movpos	%icc,	%l4,	%g5
	udivx	%l0,	0x00FC,	%o0
	sllx	%i1,	0x12,	%o2
	ldx	[%l7 + 0x60],	%g7
	movg	%icc,	%o1,	%o3
	sll	%o5,	%g6,	%l3
	sir	0x18F8
	lduh	[%l7 + 0x78],	%g4
	addcc	%l1,	0x00F2,	%g1
	fmovsgu	%xcc,	%f15,	%f2
	edge8ln	%l5,	%i3,	%g3
	mova	%xcc,	%i6,	%g2
	movpos	%icc,	%i4,	%i7
	mulscc	%l2,	%i0,	%i2
	std	%f20,	[%l7 + 0x58]
	srl	%i5,	0x0D,	%o7
	subcc	%o6,	0x1E70,	%o4
	edge32	%l6,	%g5,	%l0
	orcc	%o0,	0x0069,	%i1
	edge8ln	%o2,	%g7,	%o1
	save %l4, %o5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o3,	0x01,	%l3
	movpos	%xcc,	%l1,	%g4
	fmovsge	%xcc,	%f26,	%f9
	andncc	%g1,	%l5,	%i3
	alignaddrl	%g3,	%i6,	%i4
	movrlez	%g2,	%i7,	%i0
	smul	%l2,	%i5,	%o7
	fmovdvs	%xcc,	%f23,	%f7
	movvc	%icc,	%i2,	%o4
	edge32ln	%o6,	%g5,	%l0
	array8	%o0,	%i1,	%o2
	srax	%l6,	%g7,	%l4
	sdiv	%o5,	0x1479,	%o1
	movrgez	%o3,	%g6,	%l3
	fcmpes	%fcc0,	%f12,	%f13
	movn	%xcc,	%l1,	%g1
	lduw	[%l7 + 0x20],	%g4
	fmovrslz	%i3,	%f20,	%f4
	sdivcc	%g3,	0x102C,	%i6
	edge8ln	%i4,	%l5,	%g2
	fnot1	%f18,	%f22
	orcc	%i0,	%l2,	%i5
	movn	%xcc,	%i7,	%i2
	fmovrsne	%o4,	%f17,	%f18
	ldsb	[%l7 + 0x56],	%o7
	mulx	%g5,	%o6,	%o0
	fors	%f25,	%f11,	%f9
	srlx	%l0,	%i1,	%l6
	edge8l	%g7,	%l4,	%o5
	lduh	[%l7 + 0x76],	%o2
	stw	%o1,	[%l7 + 0x48]
	orncc	%o3,	%g6,	%l1
	sethi	0x05B5,	%g1
	fcmpes	%fcc3,	%f19,	%f26
	fmovrdgz	%l3,	%f14,	%f30
	subc	%g4,	%i3,	%g3
	fcmpd	%fcc3,	%f26,	%f2
	edge8l	%i4,	%i6,	%l5
	stw	%g2,	[%l7 + 0x50]
	ld	[%l7 + 0x54],	%f31
	movg	%icc,	%l2,	%i5
	movre	%i0,	0x230,	%i2
	xor	%o4,	0x1306,	%o7
	movl	%xcc,	%i7,	%o6
	srax	%o0,	0x1B,	%g5
	sllx	%i1,	%l0,	%l6
	lduw	[%l7 + 0x60],	%l4
	fcmpne16	%f22,	%f20,	%g7
	sdivx	%o5,	0x0FBC,	%o1
	edge16n	%o2,	%o3,	%l1
	movrlz	%g6,	%l3,	%g1
	array8	%i3,	%g4,	%g3
	fnands	%f30,	%f12,	%f8
	lduh	[%l7 + 0x6C],	%i4
	movleu	%icc,	%l5,	%i6
	andcc	%g2,	0x1CF4,	%l2
	movcs	%xcc,	%i5,	%i0
	movgu	%xcc,	%i2,	%o4
	umul	%o7,	%o6,	%i7
	ldsh	[%l7 + 0x1A],	%o0
	movvc	%xcc,	%g5,	%i1
	movrlz	%l0,	%l4,	%l6
	fmovdg	%xcc,	%f28,	%f22
	movre	%o5,	0x1C6,	%g7
	edge32l	%o2,	%o3,	%o1
	movleu	%icc,	%g6,	%l1
	alignaddrl	%g1,	%i3,	%g4
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	movg	%xcc,	%l5,	%g2
	addcc	%i6,	%l2,	%i0
	movneg	%icc,	%i2,	%o4
	xnorcc	%i5,	%o6,	%o7
	movne	%xcc,	%o0,	%g5
	movle	%icc,	%i1,	%l0
	movleu	%xcc,	%i7,	%l6
	array32	%l4,	%g7,	%o2
	ldx	[%l7 + 0x60],	%o3
	movrgez	%o1,	%g6,	%l1
	sdivx	%o5,	0x1502,	%g1
	popc	0x1CC6,	%g4
	ldsw	[%l7 + 0x74],	%i3
	orn	%g3,	%i4,	%l5
	st	%f17,	[%l7 + 0x08]
	udiv	%g2,	0x0582,	%i6
	bshuffle	%f0,	%f4,	%f14
	fmovrdne	%l3,	%f18,	%f2
	edge8l	%i0,	%l2,	%i2
	fxnors	%f11,	%f15,	%f5
	array32	%o4,	%o6,	%o7
	save %o0, 0x17E4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x7E],	%i5
	ldsb	[%l7 + 0x17],	%l0
	sth	%i7,	[%l7 + 0x2A]
	and	%l6,	0x01B9,	%i1
	fmovsne	%icc,	%f4,	%f3
	fmovdvs	%xcc,	%f11,	%f21
	ldd	[%l7 + 0x78],	%l4
	movgu	%icc,	%o2,	%o3
	siam	0x2
	movne	%xcc,	%g7,	%g6
	ldx	[%l7 + 0x30],	%l1
	fcmple32	%f28,	%f2,	%o5
	fmovrdlez	%g1,	%f2,	%f20
	ldsw	[%l7 + 0x30],	%o1
	fmovsn	%xcc,	%f20,	%f10
	sllx	%i3,	0x0B,	%g4
	sethi	0x11E3,	%i4
	andncc	%l5,	%g3,	%i6
	srl	%l3,	%g2,	%l2
	and	%i2,	%o4,	%o6
	edge8l	%o7,	%o0,	%g5
	st	%f3,	[%l7 + 0x4C]
	ldsh	[%l7 + 0x6E],	%i0
	addccc	%l0,	%i7,	%i5
	mulx	%l6,	0x096F,	%l4
	sdivx	%o2,	0x02DE,	%i1
	restore %g7, 0x13FD, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o3,	%o5,	%g1
	movneg	%xcc,	%o1,	%l1
	srax	%g4,	0x1D,	%i3
	movcs	%xcc,	%i4,	%l5
	fmovsn	%xcc,	%f10,	%f16
	lduh	[%l7 + 0x66],	%i6
	sub	%g3,	0x1809,	%l3
	and	%g2,	%i2,	%o4
	orncc	%l2,	0x08C9,	%o6
	subcc	%o7,	0x1331,	%g5
	save %i0, %o0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%l0,	%i5
	smulcc	%l6,	%l4,	%i1
	fandnot1	%f26,	%f24,	%f30
	sdivx	%o2,	0x1091,	%g7
	fmovsneg	%xcc,	%f22,	%f29
	sir	0x012E
	fpackfix	%f24,	%f4
	fmovsgu	%icc,	%f22,	%f19
	and	%o3,	%o5,	%g6
	addcc	%o1,	%g1,	%l1
	sdivx	%g4,	0x170A,	%i4
	ld	[%l7 + 0x58],	%f5
	ldd	[%l7 + 0x70],	%i2
	xnor	%i6,	0x13CC,	%g3
	std	%f24,	[%l7 + 0x20]
	edge8n	%l5,	%l3,	%i2
	lduh	[%l7 + 0x7A],	%g2
	edge32	%o4,	%o6,	%l2
	movl	%icc,	%o7,	%g5
	ldsh	[%l7 + 0x64],	%i0
	edge8	%i7,	%o0,	%i5
	edge32	%l6,	%l4,	%i1
	xnorcc	%l0,	0x00B7,	%g7
	fmovda	%xcc,	%f3,	%f2
	edge8ln	%o3,	%o5,	%o2
	movrlz	%o1,	0x18F,	%g6
	movl	%icc,	%l1,	%g4
	edge8l	%i4,	%i3,	%i6
	fmovscs	%xcc,	%f27,	%f7
	save %g3, %l5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l3,	%i2
	subcc	%o4,	0x17C0,	%g2
	fornot1s	%f7,	%f2,	%f22
	edge16ln	%l2,	%o7,	%o6
	fmovscc	%icc,	%f14,	%f26
	move	%icc,	%i0,	%g5
	sll	%o0,	%i7,	%i5
	fpackfix	%f14,	%f15
	fmovsn	%xcc,	%f0,	%f7
	sir	0x0581
	and	%l4,	0x1FC4,	%l6
	fsrc2	%f14,	%f16
	move	%icc,	%i1,	%g7
	fpsub16	%f4,	%f4,	%f6
	sdiv	%l0,	0x1474,	%o3
	fornot1s	%f2,	%f11,	%f11
	st	%f14,	[%l7 + 0x0C]
	movre	%o5,	0x1A8,	%o2
	popc	0x09D5,	%o1
	movgu	%xcc,	%g6,	%g4
	subcc	%l1,	%i4,	%i6
	lduw	[%l7 + 0x44],	%g3
	add	%i3,	0x11A0,	%l5
	andcc	%g1,	%l3,	%i2
	movrgez	%o4,	%g2,	%l2
	edge16	%o6,	%i0,	%g5
	sll	%o0,	0x05,	%o7
	movrgz	%i5,	0x1BE,	%l4
	sethi	0x1DEC,	%i7
	umulcc	%i1,	0x1531,	%g7
	mulx	%l6,	0x0130,	%l0
	fmovsne	%xcc,	%f10,	%f25
	fmovsge	%icc,	%f2,	%f18
	or	%o5,	%o3,	%o2
	mulscc	%o1,	%g6,	%g4
	fmul8x16	%f30,	%f16,	%f14
	movrgz	%i4,	%l1,	%i6
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	ldub	[%l7 + 0x0A],	%g1
	and	%l5,	0x1D6C,	%i2
	xnorcc	%l3,	%o4,	%l2
	xor	%o6,	%g2,	%i0
	fmovdle	%xcc,	%f2,	%f10
	for	%f28,	%f20,	%f20
	edge8	%g5,	%o7,	%i5
	orcc	%l4,	0x0F92,	%i7
	edge16	%i1,	%g7,	%l6
	mulscc	%o0,	%o5,	%l0
	fzero	%f18
	andncc	%o2,	%o3,	%o1
	edge8ln	%g4,	%i4,	%l1
	fmovdleu	%icc,	%f15,	%f0
	stx	%i6,	[%l7 + 0x48]
	std	%f2,	[%l7 + 0x18]
	fsrc1s	%f17,	%f2
	udivcc	%g3,	0x0CB7,	%i3
	edge16l	%g6,	%l5,	%g1
	smul	%l3,	0x1895,	%i2
	udivx	%l2,	0x1FA2,	%o6
	mulscc	%g2,	%o4,	%i0
	ld	[%l7 + 0x6C],	%f6
	fnegs	%f8,	%f6
	orn	%o7,	0x0FB3,	%g5
	restore %l4, 0x0EBB, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f12,	%f11
	srax	%i1,	%g7,	%l6
	bshuffle	%f28,	%f16,	%f24
	edge32	%i5,	%o0,	%l0
	std	%f30,	[%l7 + 0x60]
	movn	%xcc,	%o2,	%o3
	fcmpne32	%f26,	%f10,	%o1
	movle	%icc,	%o5,	%g4
	xor	%l1,	%i4,	%i6
	udiv	%g3,	0x05B3,	%i3
	movrne	%l5,	0x2E0,	%g6
	andcc	%g1,	%l3,	%i2
	mulx	%l2,	%g2,	%o4
	smulcc	%i0,	%o7,	%o6
	edge16	%l4,	%i7,	%i1
	alignaddr	%g7,	%g5,	%i5
	fcmpne16	%f2,	%f24,	%l6
	move	%xcc,	%o0,	%l0
	stb	%o2,	[%l7 + 0x4E]
	fsrc2s	%f21,	%f14
	fpmerge	%f6,	%f28,	%f28
	fmovrdne	%o1,	%f28,	%f6
	movge	%icc,	%o5,	%o3
	fnot1	%f24,	%f10
	movle	%xcc,	%l1,	%g4
	st	%f19,	[%l7 + 0x58]
	array32	%i6,	%i4,	%g3
	popc	%i3,	%g6
	alignaddrl	%g1,	%l5,	%i2
	andncc	%l3,	%g2,	%l2
	array32	%o4,	%i0,	%o7
	ldsw	[%l7 + 0x24],	%l4
	fmovscs	%xcc,	%f21,	%f21
	popc	%i7,	%i1
	orncc	%g7,	%o6,	%i5
	movg	%icc,	%g5,	%o0
	fmuld8ulx16	%f5,	%f31,	%f18
	edge16	%l0,	%o2,	%o1
	ldd	[%l7 + 0x40],	%f0
	movrlz	%o5,	%o3,	%l6
	srl	%g4,	%i6,	%i4
	orn	%l1,	%g3,	%g6
	fmovdn	%xcc,	%f29,	%f26
	fsrc2s	%f16,	%f1
	movrlez	%i3,	0x120,	%l5
	movrlez	%g1,	%l3,	%i2
	sdivx	%g2,	0x02DD,	%l2
	subccc	%i0,	0x0C27,	%o7
	edge16	%o4,	%l4,	%i1
	edge32n	%i7,	%g7,	%o6
	fmovde	%xcc,	%f24,	%f0
	edge32ln	%i5,	%g5,	%l0
	sll	%o0,	0x03,	%o2
	edge32l	%o5,	%o1,	%l6
	andcc	%g4,	0x1AA2,	%i6
	xor	%o3,	0x0382,	%i4
	udivcc	%l1,	0x118A,	%g3
	sethi	0x13E1,	%g6
	smul	%l5,	0x00E0,	%i3
	fmovspos	%icc,	%f17,	%f4
	save %l3, 0x1246, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g1,	%g2,	%i0
	subcc	%l2,	%o4,	%l4
	srl	%i1,	%o7,	%g7
	subc	%i7,	0x0853,	%o6
	orncc	%g5,	%l0,	%o0
	sethi	0x0351,	%i5
	fabsd	%f10,	%f30
	fmovsne	%icc,	%f19,	%f20
	mulscc	%o5,	0x0C76,	%o1
	fpsub16s	%f10,	%f20,	%f10
	smulcc	%l6,	%g4,	%o2
	orcc	%i6,	%o3,	%i4
	sth	%l1,	[%l7 + 0x34]
	alignaddrl	%g3,	%l5,	%i3
	edge32l	%g6,	%i2,	%g1
	fmuld8ulx16	%f26,	%f29,	%f10
	fandnot1s	%f24,	%f15,	%f29
	fcmple16	%f6,	%f28,	%g2
	array8	%l3,	%i0,	%l2
	fmovd	%f24,	%f16
	fpadd32	%f8,	%f22,	%f20
	movle	%xcc,	%o4,	%i1
	edge8l	%o7,	%g7,	%i7
	andn	%l4,	0x1B78,	%g5
	std	%f14,	[%l7 + 0x30]
	fandnot2	%f10,	%f20,	%f30
	nop
	set	0x44, %l3
	stw	%o6,	[%l7 + %l3]
	udivcc	%o0,	0x1B50,	%i5
	movrlez	%o5,	%o1,	%l0
	lduw	[%l7 + 0x68],	%g4
	mova	%icc,	%l6,	%o2
	mulx	%i6,	0x12E6,	%i4
	edge8n	%o3,	%l1,	%l5
	orcc	%g3,	0x033B,	%g6
	movrlz	%i2,	0x321,	%i3
	fands	%f22,	%f5,	%f22
	movneg	%xcc,	%g2,	%g1
	or	%i0,	%l3,	%o4
	add	%l2,	%i1,	%o7
	fpadd32s	%f8,	%f9,	%f5
	sethi	0x0E85,	%i7
	orn	%l4,	%g7,	%g5
	addccc	%o6,	0x06BE,	%o0
	fmul8x16al	%f16,	%f10,	%f26
	smul	%i5,	0x029E,	%o1
	stb	%o5,	[%l7 + 0x7B]
	save %l0, %g4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o2,	%i6,	%o3
	ldsh	[%l7 + 0x3E],	%i4
	ldsb	[%l7 + 0x71],	%l1
	stb	%l5,	[%l7 + 0x3C]
	popc	0x11CA,	%g6
	fmul8ulx16	%f6,	%f6,	%f30
	fandnot1	%f6,	%f20,	%f4
	sth	%g3,	[%l7 + 0x7C]
	fmul8x16	%f27,	%f10,	%f6
	fmul8sux16	%f4,	%f16,	%f0
	orcc	%i2,	0x017C,	%i3
	movvc	%xcc,	%g1,	%g2
	subccc	%i0,	%l3,	%o4
	array8	%l2,	%i1,	%o7
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	udivx	%g5,	0x0485,	%l4
	std	%f22,	[%l7 + 0x48]
	ld	[%l7 + 0x7C],	%f24
	fornot1s	%f13,	%f12,	%f10
	smul	%o0,	%o6,	%i5
	movleu	%xcc,	%o1,	%o5
	mulx	%l0,	0x0C71,	%l6
	fandnot1s	%f18,	%f28,	%f20
	fpadd32	%f8,	%f24,	%f6
	andcc	%g4,	%i6,	%o3
	udivcc	%o2,	0x0484,	%l1
	fmovrde	%i4,	%f28,	%f4
	fmovsvc	%icc,	%f12,	%f27
	fnegs	%f28,	%f21
	movrlz	%l5,	%g6,	%i2
	edge32l	%i3,	%g3,	%g1
	fabsd	%f20,	%f24
	stw	%g2,	[%l7 + 0x1C]
	fands	%f9,	%f7,	%f16
	ldd	[%l7 + 0x58],	%l2
	edge32ln	%i0,	%o4,	%l2
	mova	%icc,	%i1,	%i7
	for	%f18,	%f26,	%f14
	movvs	%icc,	%o7,	%g5
	udivx	%l4,	0x0982,	%o0
	fmovdcs	%icc,	%f20,	%f11
	movpos	%icc,	%o6,	%g7
	sllx	%o1,	%i5,	%l0
	orn	%l6,	%o5,	%i6
	move	%icc,	%o3,	%g4
	mulscc	%l1,	%o2,	%l5
	and	%g6,	%i2,	%i3
	fmovrsgez	%i4,	%f8,	%f22
	movl	%icc,	%g1,	%g2
	edge8	%g3,	%i0,	%l3
	movcs	%icc,	%l2,	%o4
	fcmpgt32	%f24,	%f18,	%i7
	edge16	%i1,	%o7,	%g5
	sub	%o0,	0x0DE9,	%o6
	sth	%l4,	[%l7 + 0x28]
	ldx	[%l7 + 0x30],	%o1
	sll	%i5,	%g7,	%l6
	edge8	%l0,	%o5,	%o3
	fnors	%f11,	%f12,	%f22
	edge8n	%i6,	%l1,	%o2
	umul	%g4,	%g6,	%i2
	subcc	%l5,	%i4,	%i3
	array16	%g1,	%g3,	%g2
	edge32	%i0,	%l2,	%l3
	fsrc2s	%f25,	%f14
	and	%i7,	0x01A2,	%o4
	edge16	%i1,	%o7,	%o0
	fsrc2s	%f1,	%f0
	movpos	%xcc,	%o6,	%l4
	movg	%icc,	%o1,	%g5
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3561
!	Type f   	: 5460
!	Type i   	: 15979
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x43D34764
.word 0xFD3080CA
.word 0xB8599F2D
.word 0xDB4B370F
.word 0xF559785E
.word 0xDC7C58B3
.word 0x9B78FF4E
.word 0x7BF6789C
.word 0x37AF22C3
.word 0x697E95A1
.word 0xEF00C663
.word 0xB269D715
.word 0x6752A693
.word 0xEC087CB2
.word 0xCDA762DF
.word 0x0302FD0A
.word 0x4115B477
.word 0xAA568FFA
.word 0x4E2734AF
.word 0x22CB766B
.word 0xC6D66235
.word 0x0F3B4159
.word 0x9A469F0D
.word 0x7DD3E676
.word 0x9AE4FAD7
.word 0xD32F7A89
.word 0xB5C73EBA
.word 0x793B7FFD
.word 0x5A220914
.word 0xE85A4BF7
.word 0x7C191ED8
.word 0x338252C1
.word 0x81E366A1
.word 0xBB6B2315
.word 0x4C830A1D
.word 0x8472FB75
.word 0x5B95F8EE
.word 0x4F05578D
.word 0xD368132F
.word 0xEB835D15
.word 0x88814B0C
.word 0x02862CE1
.word 0x4E1A9763
.word 0x8A9DCF77
.word 0x83534DE3
.word 0x762AC7F8
.word 0xBA0FDA9F
.word 0x395E2118
.word 0x86367B6A
.word 0x03B57EEC
.word 0x423E0A80
.word 0xD577E38C
.word 0x1ADF817C
.word 0x02FB7888
.word 0x521232C2
.word 0xCCEAAE0C
.word 0x6886EA50
.word 0x71542A2D
.word 0x5F344559
.word 0x399DBA6A
.word 0x72C2407D
.word 0x433EF9DE
.word 0x5709B705
.word 0xF0B0E023
.end
