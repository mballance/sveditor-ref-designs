/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window0_f0.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window0_f0.s,v 1.1.1.1 2007/02/13 22:20:15 drp Exp $"
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
	setx	0x62A5A048404FF33D,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0x6,	%g2
	set	0x5,	%g3
	set	0x6,	%g4
	set	0x2,	%g5
	set	0xE,	%g6
	set	0x2,	%g7
	!# Input registers
	set	-0x0,	%i0
	set	-0x8,	%i1
	set	-0x7,	%i2
	set	-0xC,	%i3
	set	-0x7,	%i4
	set	-0x3,	%i5
	set	-0x3,	%i6
	set	-0x9,	%i7
	!# Local registers
	set	0x0BE10A4F,	%l0
	set	0x22AD887A,	%l1
	set	0x7D7C4245,	%l2
	set	0x496E7295,	%l3
	set	0x6684872F,	%l4
	set	0x40F4E5FD,	%l5
	set	0x766678EF,	%l6
	!# Output registers
	set	-0x1609,	%o0
	set	-0x1668,	%o1
	set	0x1018,	%o2
	set	0x1C55,	%o3
	set	0x1DD9,	%o4
	set	-0x053E,	%o5
	set	0x0B51,	%o6
	set	0x0C89,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x0BC8FABCA292EF5F)
	INIT_TH_FP_REG(%l7,%f2,0x751C4DF99DF29016)
	INIT_TH_FP_REG(%l7,%f4,0x2BC2E1C9267C3429)
	INIT_TH_FP_REG(%l7,%f6,0xD19FB2A0B2F9DF68)
	INIT_TH_FP_REG(%l7,%f8,0x962773EA981CD054)
	INIT_TH_FP_REG(%l7,%f10,0x4AB62F57416F2A9D)
	INIT_TH_FP_REG(%l7,%f12,0x82E5CA245A235A58)
	INIT_TH_FP_REG(%l7,%f14,0x34966908FFE9F35F)
	INIT_TH_FP_REG(%l7,%f16,0x3374366228CD3C94)
	INIT_TH_FP_REG(%l7,%f18,0x479C965F14DCD008)
	INIT_TH_FP_REG(%l7,%f20,0xFC9B0FF1C98B3680)
	INIT_TH_FP_REG(%l7,%f22,0xA8526CED898862A2)
	INIT_TH_FP_REG(%l7,%f24,0x30B7D0F76EBA71D0)
	INIT_TH_FP_REG(%l7,%f26,0x6268B8D8587F5591)
	INIT_TH_FP_REG(%l7,%f28,0x42877E489503D57E)
	INIT_TH_FP_REG(%l7,%f30,0x16C2652C89801E5A)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	xor	%i5,	%i0,	%g7
	movcc	%xcc,	%i4,	%o3
	sdivcc	%o0,	0x1C6A,	%l1
	edge8	%l5,	%i1,	%l0
	orcc	%g3,	0x1792,	%o2
	fcmpd	%fcc3,	%f14,	%f4
	pdist	%f22,	%f10,	%f18
	fexpand	%f3,	%f4
	stw	%l6,	[%l7 + 0x20]
	array16	%i2,	%o7,	%o6
	fmovsgu	%xcc,	%f27,	%f6
	ldd	[%l7 + 0x78],	%l2
	std	%f12,	[%l7 + 0x60]
	faligndata	%f6,	%f28,	%f30
	fmovrdgz	%g2,	%f14,	%f26
	movl	%icc,	%o5,	%g4
	or	%o1,	0x13D5,	%g1
	fsrc1	%f28,	%f30
	alignaddrl	%g6,	%g5,	%i7
	mulscc	%i3,	%l2,	%l4
	movne	%xcc,	%i6,	%o4
	mulx	%i0,	%i5,	%g7
	ldsw	[%l7 + 0x48],	%i4
	movrgez	%o0,	%l1,	%o3
	umul	%l5,	%l0,	%g3
	ldd	[%l7 + 0x20],	%f18
	fxors	%f22,	%f7,	%f27
	movge	%xcc,	%i1,	%l6
	fmovspos	%xcc,	%f9,	%f25
	movle	%icc,	%i2,	%o2
	ldsw	[%l7 + 0x6C],	%o7
	fmovspos	%xcc,	%f13,	%f21
	fabss	%f8,	%f3
	fcmped	%fcc3,	%f22,	%f20
	edge32n	%o6,	%l3,	%g2
	array16	%o5,	%g4,	%o1
	subcc	%g1,	0x1400,	%g5
	xnorcc	%i7,	0x0F29,	%g6
	save %i3, %l4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l2,	%i0,	%o4
	sdiv	%i5,	0x0356,	%i4
	xnor	%o0,	%l1,	%o3
	sub	%g7,	0x063C,	%l0
	movrgez	%l5,	%i1,	%g3
	edge32	%i2,	%o2,	%l6
	fcmpeq32	%f10,	%f22,	%o7
	movge	%xcc,	%l3,	%o6
	movrne	%g2,	%g4,	%o1
	save %g1, %o5, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f18,	%f30
	move	%xcc,	%g6,	%i3
	ldsh	[%l7 + 0x7C],	%l4
	and	%i6,	0x1031,	%g5
	sll	%i0,	0x08,	%l2
	addccc	%i5,	%o4,	%i4
	fmovsn	%icc,	%f2,	%f12
	sub	%l1,	0x03A8,	%o3
	siam	0x4
	fxors	%f0,	%f4,	%f5
	movge	%xcc,	%o0,	%g7
	umul	%l0,	0x1ACA,	%l5
	movrgez	%g3,	%i2,	%i1
	fabss	%f11,	%f19
	movleu	%xcc,	%o2,	%l6
	lduh	[%l7 + 0x60],	%l3
	fpsub16	%f26,	%f22,	%f26
	addccc	%o6,	0x1844,	%g2
	edge8	%g4,	%o7,	%o1
	mova	%xcc,	%g1,	%o5
	edge32n	%g6,	%i3,	%l4
	popc	%i6,	%i7
	sethi	0x0D07,	%g5
	udivx	%i0,	0x07B0,	%l2
	edge8l	%o4,	%i5,	%i4
	edge32ln	%o3,	%o0,	%g7
	smul	%l0,	0x12D4,	%l5
	fmovsge	%xcc,	%f6,	%f5
	add	%l1,	%g3,	%i2
	fxors	%f12,	%f29,	%f20
	movrgez	%o2,	0x25E,	%i1
	subcc	%l6,	%o6,	%l3
	sethi	0x037E,	%g4
	subccc	%o7,	%o1,	%g2
	fpsub32s	%f14,	%f12,	%f19
	edge8n	%o5,	%g6,	%g1
	nop
	set	0x3C, %g2
	ldsw	[%l7 + %g2],	%i3
	alignaddr	%l4,	%i6,	%i7
	fandnot2	%f26,	%f22,	%f16
	movcs	%icc,	%i0,	%g5
	ldd	[%l7 + 0x78],	%f6
	nop
	set	0x58, %g1
	stb	%l2,	[%l7 + %g1]
	fmovd	%f8,	%f18
	addccc	%i5,	0x1D80,	%i4
	movleu	%xcc,	%o4,	%o0
	ldsw	[%l7 + 0x5C],	%o3
	sub	%g7,	%l5,	%l0
	udivx	%l1,	0x161B,	%g3
	edge8ln	%i2,	%o2,	%i1
	movvc	%icc,	%o6,	%l3
	stw	%g4,	[%l7 + 0x28]
	fmovdle	%icc,	%f2,	%f30
	ldd	[%l7 + 0x70],	%f14
	movleu	%xcc,	%o7,	%o1
	fmovsgu	%xcc,	%f23,	%f12
	fmovspos	%icc,	%f21,	%f4
	or	%g2,	0x14D4,	%o5
	alignaddr	%g6,	%g1,	%i3
	fmovrsgz	%l6,	%f15,	%f27
	fmul8x16	%f18,	%f14,	%f12
	movrgez	%i6,	0x030,	%i7
	ldsb	[%l7 + 0x46],	%l4
	fmovsn	%xcc,	%f8,	%f1
	edge32	%i0,	%l2,	%i5
	stw	%g5,	[%l7 + 0x0C]
	movcc	%icc,	%i4,	%o0
	orncc	%o4,	0x1EF5,	%g7
	fxor	%f22,	%f10,	%f16
	ldx	[%l7 + 0x70],	%o3
	umul	%l0,	0x03D9,	%l1
	alignaddrl	%g3,	%l5,	%i2
	edge8ln	%i1,	%o6,	%o2
	stx	%l3,	[%l7 + 0x08]
	stb	%g4,	[%l7 + 0x6B]
	ldsh	[%l7 + 0x0A],	%o7
	smul	%o1,	0x145E,	%g2
	xor	%g6,	0x1A99,	%o5
	movleu	%icc,	%g1,	%l6
	nop
	set	0x61, %i7
	stb	%i6,	[%l7 + %i7]
	array16	%i7,	%i3,	%i0
	ldx	[%l7 + 0x20],	%l4
	fmovrdlez	%l2,	%f22,	%f12
	fnors	%f7,	%f28,	%f9
	fzero	%f24
	fpack16	%f6,	%f18
	mova	%icc,	%g5,	%i5
	xnorcc	%o0,	%i4,	%g7
	fmul8ulx16	%f0,	%f4,	%f14
	movvs	%xcc,	%o3,	%l0
	andncc	%l1,	%g3,	%o4
	movleu	%xcc,	%i2,	%l5
	smulcc	%o6,	%o2,	%l3
	sdiv	%i1,	0x02E9,	%g4
	move	%xcc,	%o7,	%o1
	ldd	[%l7 + 0x58],	%g2
	fmovsleu	%icc,	%f5,	%f18
	ldub	[%l7 + 0x60],	%g6
	andcc	%g1,	0x0561,	%o5
	fmovdge	%icc,	%f31,	%f8
	ldsw	[%l7 + 0x64],	%i6
	restore %l6, 0x17C0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i0,	0x1CFC,	%l4
	save %l2, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o0,	%i5,	%i4
	ldub	[%l7 + 0x08],	%o3
	fcmpne16	%f26,	%f4,	%l0
	smul	%l1,	%g7,	%o4
	fzeros	%f24
	edge8n	%g3,	%l5,	%i2
	fabss	%f30,	%f23
	edge32l	%o2,	%l3,	%o6
	subc	%g4,	%i1,	%o7
	edge32l	%g2,	%o1,	%g1
	fnot2s	%f23,	%f9
	movcs	%xcc,	%g6,	%o5
	addc	%l6,	%i6,	%i7
	sir	0x1F2C
	std	%f24,	[%l7 + 0x50]
	st	%f0,	[%l7 + 0x38]
	alignaddr	%l4,	%l2,	%i0
	sub	%g5,	0x0ED5,	%i3
	movvs	%xcc,	%i5,	%o0
	add	%o3,	0x09E4,	%l0
	array32	%l1,	%g7,	%o4
	movvc	%icc,	%g3,	%l5
	fpackfix	%f28,	%f23
	edge32n	%i2,	%o2,	%l3
	fand	%f22,	%f22,	%f22
	nop
	set	0x36, %g3
	sth	%o6,	[%l7 + %g3]
	sllx	%g4,	%i4,	%o7
	mova	%icc,	%g2,	%i1
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	xnor	%o5,	%g6,	%l6
	fmovscc	%xcc,	%f30,	%f1
	fmovrslz	%i7,	%f21,	%f11
	ldd	[%l7 + 0x08],	%i6
	subccc	%l4,	%l2,	%i0
	edge16ln	%i3,	%g5,	%i5
	smulcc	%o0,	0x0CA7,	%l0
	siam	0x4
	fmovsge	%xcc,	%f2,	%f0
	edge16l	%l1,	%o3,	%g7
	stx	%g3,	[%l7 + 0x28]
	st	%f8,	[%l7 + 0x0C]
	movgu	%xcc,	%o4,	%i2
	movg	%icc,	%o2,	%l5
	sdivcc	%l3,	0x11E2,	%g4
	sll	%i4,	0x1F,	%o7
	save %g2, %o6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x56],	%g1
	andncc	%o5,	%g6,	%l6
	fabsd	%f16,	%f16
	umul	%i7,	%i1,	%i6
	xnor	%l4,	0x0D75,	%i0
	fmovsn	%icc,	%f29,	%f13
	movre	%l2,	%i3,	%g5
	subccc	%i5,	0x070B,	%l0
	movrne	%o0,	%l1,	%g7
	mova	%xcc,	%g3,	%o4
	edge32n	%i2,	%o3,	%l5
	movvc	%icc,	%l3,	%o2
	ldd	[%l7 + 0x40],	%g4
	add	%i4,	0x14B8,	%o7
	udivx	%o6,	0x1513,	%o1
	umulcc	%g1,	%g2,	%o5
	edge8	%g6,	%i7,	%i1
	fmovsa	%icc,	%f7,	%f18
	stw	%i6,	[%l7 + 0x58]
	edge16n	%l6,	%i0,	%l4
	xorcc	%l2,	%g5,	%i3
	movne	%xcc,	%i5,	%o0
	fmovsgu	%icc,	%f17,	%f1
	edge8n	%l0,	%g7,	%l1
	edge16l	%o4,	%i2,	%o3
	ld	[%l7 + 0x74],	%f1
	st	%f13,	[%l7 + 0x5C]
	lduh	[%l7 + 0x5A],	%g3
	umul	%l5,	%o2,	%l3
	mova	%icc,	%i4,	%o7
	edge8n	%g4,	%o1,	%o6
	andn	%g2,	0x078D,	%o5
	addccc	%g6,	%i7,	%i1
	fmuld8sux16	%f23,	%f30,	%f24
	addc	%g1,	0x0B76,	%i6
	sra	%l6,	%l4,	%l2
	addc	%i0,	%i3,	%i5
	movrgz	%g5,	%l0,	%g7
	movle	%icc,	%l1,	%o0
	addcc	%o4,	0x0980,	%i2
	sra	%o3,	%g3,	%o2
	restore %l5, %l3, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o7,	%o1,	%g4
	ldub	[%l7 + 0x4F],	%o6
	lduh	[%l7 + 0x7C],	%o5
	subcc	%g6,	0x168E,	%i7
	fsrc2	%f26,	%f0
	stx	%i1,	[%l7 + 0x48]
	movpos	%icc,	%g2,	%i6
	umul	%g1,	0x05BA,	%l6
	fmovsne	%icc,	%f28,	%f1
	mulx	%l4,	%i0,	%l2
	subccc	%i5,	0x1465,	%i3
	xnorcc	%g5,	0x09A5,	%l0
	sdiv	%g7,	0x1504,	%o0
	stw	%l1,	[%l7 + 0x4C]
	mova	%xcc,	%i2,	%o3
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	add	%l5,	%l3,	%i4
	fpsub32	%f12,	%f0,	%f6
	stw	%o7,	[%l7 + 0x08]
	sub	%o2,	0x07E5,	%g4
	fxors	%f24,	%f26,	%f5
	fpsub32s	%f8,	%f30,	%f26
	srax	%o6,	%o1,	%o5
	xnorcc	%g6,	%i1,	%i7
	ldsw	[%l7 + 0x70],	%i6
	fmovdl	%xcc,	%f30,	%f26
	edge32ln	%g1,	%g2,	%l4
	edge8n	%i0,	%l2,	%l6
	movge	%icc,	%i3,	%g5
	smul	%l0,	%i5,	%g7
	fsrc2s	%f5,	%f7
	st	%f4,	[%l7 + 0x24]
	movneg	%xcc,	%l1,	%o0
	movvs	%xcc,	%i2,	%o3
	array16	%g3,	%o4,	%l3
	sdivcc	%l5,	0x1C89,	%i4
	edge32	%o7,	%g4,	%o6
	movcs	%xcc,	%o1,	%o5
	edge16ln	%g6,	%o2,	%i1
	subccc	%i6,	0x1E25,	%g1
	edge16n	%g2,	%i7,	%i0
	edge32n	%l4,	%l2,	%i3
	fpadd32	%f2,	%f28,	%f6
	fmovrde	%l6,	%f12,	%f10
	edge16n	%g5,	%l0,	%g7
	nop
	set	0x7C, %l4
	lduw	[%l7 + %l4],	%l1
	fandnot2	%f30,	%f24,	%f26
	xnorcc	%i5,	%i2,	%o3
	edge32n	%g3,	%o0,	%o4
	sra	%l5,	%i4,	%l3
	ldx	[%l7 + 0x78],	%g4
	subcc	%o6,	%o7,	%o5
	sub	%o1,	%g6,	%i1
	edge32ln	%o2,	%g1,	%g2
	movgu	%xcc,	%i6,	%i0
	save %l4, 0x1AB8, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x2C],	%i3
	andn	%l6,	%i7,	%l0
	ldd	[%l7 + 0x30],	%g4
	sdivx	%g7,	0x00E9,	%l1
	orcc	%i5,	0x17E9,	%o3
	smulcc	%g3,	%o0,	%i2
	sethi	0x0E34,	%l5
	mulscc	%i4,	%o4,	%g4
	fmuld8ulx16	%f11,	%f9,	%f24
	movl	%xcc,	%l3,	%o6
	sdivcc	%o5,	0x046B,	%o1
	subcc	%g6,	0x0EA4,	%i1
	movneg	%icc,	%o2,	%g1
	movcc	%icc,	%g2,	%i6
	orn	%i0,	0x0733,	%o7
	fzeros	%f10
	alignaddr	%l4,	%i3,	%l6
	edge16n	%l2,	%l0,	%i7
	and	%g5,	0x093C,	%l1
	fnot2s	%f31,	%f30
	edge8ln	%i5,	%o3,	%g7
	xnor	%o0,	%i2,	%l5
	movvs	%icc,	%g3,	%i4
	movleu	%icc,	%o4,	%l3
	mulscc	%o6,	%g4,	%o5
	sra	%o1,	0x0B,	%i1
	movn	%xcc,	%o2,	%g1
	add	%g6,	%i6,	%i0
	array16	%o7,	%g2,	%i3
	fmovdvc	%icc,	%f31,	%f2
	smul	%l6,	0x1CFA,	%l2
	ldsh	[%l7 + 0x32],	%l0
	fmovdgu	%icc,	%f25,	%f13
	movle	%xcc,	%l4,	%g5
	fmul8x16au	%f3,	%f12,	%f22
	fxors	%f24,	%f22,	%f9
	edge16ln	%i7,	%l1,	%o3
	edge8n	%i5,	%o0,	%g7
	fmuld8ulx16	%f3,	%f1,	%f22
	sethi	0x0009,	%i2
	lduh	[%l7 + 0x4E],	%g3
	stb	%i4,	[%l7 + 0x37]
	fnands	%f24,	%f30,	%f5
	fabss	%f22,	%f4
	fmovsleu	%icc,	%f19,	%f22
	andcc	%l5,	0x166F,	%l3
	mova	%icc,	%o6,	%g4
	movle	%icc,	%o5,	%o4
	save %i1, %o1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g6,	%o2,	%i6
	edge32l	%o7,	%g2,	%i3
	sethi	0x028A,	%i0
	andcc	%l2,	%l6,	%l4
	ldsw	[%l7 + 0x50],	%g5
	save %i7, %l0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o3,	%i5,	%o0
	edge8ln	%i2,	%g7,	%g3
	sllx	%l5,	%i4,	%o6
	fornot2	%f30,	%f8,	%f22
	sir	0x18CC
	ldd	[%l7 + 0x70],	%g4
	fnot2	%f2,	%f26
	ldx	[%l7 + 0x70],	%l3
	edge8ln	%o5,	%i1,	%o1
	fcmpgt32	%f26,	%f4,	%g1
	movrlez	%g6,	0x006,	%o2
	andn	%o4,	0x1584,	%o7
	edge16	%i6,	%g2,	%i3
	alignaddrl	%l2,	%l6,	%l4
	movle	%xcc,	%g5,	%i0
	subccc	%l0,	0x16E5,	%l1
	edge16n	%i7,	%o3,	%i5
	movle	%icc,	%i2,	%g7
	fmul8ulx16	%f30,	%f26,	%f26
	ldsh	[%l7 + 0x3A],	%g3
	ldub	[%l7 + 0x1C],	%o0
	udivx	%l5,	0x044F,	%o6
	edge8	%g4,	%l3,	%o5
	ldd	[%l7 + 0x70],	%i0
	sdivcc	%i4,	0x0134,	%g1
	movrlz	%o1,	%o2,	%o4
	subcc	%o7,	%g6,	%i6
	edge16	%g2,	%l2,	%l6
	smul	%i3,	0x1D56,	%g5
	xorcc	%l4,	%i0,	%l0
	umulcc	%i7,	%l1,	%i5
	fcmpeq16	%f20,	%f30,	%o3
	fandnot1s	%f10,	%f16,	%f11
	array16	%g7,	%i2,	%g3
	sub	%o0,	%o6,	%g4
	sra	%l3,	%o5,	%l5
	fornot1	%f16,	%f14,	%f24
	sra	%i1,	%g1,	%o1
	bshuffle	%f8,	%f18,	%f4
	stb	%o2,	[%l7 + 0x0C]
	ldsh	[%l7 + 0x0E],	%i4
	udiv	%o7,	0x13FA,	%o4
	lduw	[%l7 + 0x5C],	%g6
	subcc	%i6,	0x0AF2,	%g2
	subcc	%l2,	%l6,	%g5
	movne	%xcc,	%i3,	%i0
	fnor	%f4,	%f22,	%f4
	fnands	%f4,	%f27,	%f15
	movre	%l0,	%l4,	%l1
	save %i7, 0x1015, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o3,	%g7,	%g3
	add	%o0,	%i2,	%o6
	movge	%xcc,	%l3,	%o5
	srax	%l5,	0x01,	%i1
	fmovscc	%xcc,	%f29,	%f4
	fmovrdne	%g1,	%f0,	%f30
	mulx	%g4,	0x14EA,	%o1
	sdivcc	%o2,	0x003D,	%o7
	addccc	%o4,	%i4,	%i6
	fpadd32s	%f9,	%f14,	%f6
	array32	%g6,	%l2,	%l6
	edge32n	%g5,	%g2,	%i3
	fpmerge	%f27,	%f16,	%f12
	movleu	%xcc,	%l0,	%i0
	movleu	%xcc,	%l4,	%i7
	srl	%i5,	0x01,	%l1
	fzeros	%f8
	umul	%o3,	0x0BDF,	%g7
	movvs	%icc,	%g3,	%i2
	fmovsvs	%icc,	%f4,	%f23
	udivx	%o6,	0x175B,	%o0
	fornot1s	%f0,	%f11,	%f15
	movpos	%xcc,	%l3,	%o5
	srax	%l5,	0x0B,	%i1
	alignaddr	%g1,	%g4,	%o2
	stw	%o1,	[%l7 + 0x14]
	st	%f2,	[%l7 + 0x40]
	sdiv	%o4,	0x0720,	%i4
	fnegd	%f24,	%f6
	ldsh	[%l7 + 0x56],	%o7
	move	%xcc,	%g6,	%l2
	edge8ln	%l6,	%i6,	%g5
	or	%i3,	%g2,	%i0
	move	%xcc,	%l0,	%i7
	fpack32	%f8,	%f18,	%f24
	sra	%i5,	0x0D,	%l1
	fnand	%f28,	%f14,	%f16
	subccc	%l4,	%o3,	%g7
	addccc	%g3,	0x1E74,	%i2
	move	%icc,	%o6,	%l3
	movpos	%xcc,	%o5,	%o0
	nop
	set	0x21, %o3
	stb	%i1,	[%l7 + %o3]
	fabsd	%f24,	%f16
	umulcc	%g1,	0x0FA4,	%g4
	nop
	set	0x09, %o1
	ldub	[%l7 + %o1],	%l5
	fmul8sux16	%f10,	%f8,	%f6
	lduw	[%l7 + 0x60],	%o2
	orcc	%o4,	%o1,	%o7
	addcc	%i4,	0x08AE,	%g6
	mulx	%l2,	%i6,	%l6
	sll	%g5,	%i3,	%g2
	fpadd16s	%f19,	%f3,	%f31
	fcmpeq32	%f2,	%f22,	%i0
	orncc	%i7,	%i5,	%l0
	edge16	%l1,	%o3,	%g7
	fcmpd	%fcc2,	%f0,	%f2
	movvc	%xcc,	%g3,	%i2
	ldd	[%l7 + 0x28],	%o6
	stw	%l3,	[%l7 + 0x58]
	st	%f21,	[%l7 + 0x6C]
	edge16ln	%l4,	%o5,	%i1
	movg	%xcc,	%g1,	%g4
	edge16l	%l5,	%o0,	%o2
	movle	%icc,	%o1,	%o4
	fpmerge	%f31,	%f18,	%f2
	sdivx	%i4,	0x19C4,	%g6
	fmuld8ulx16	%f2,	%f7,	%f18
	for	%f10,	%f20,	%f4
	udivx	%o7,	0x178D,	%i6
	andncc	%l6,	%l2,	%g5
	edge16	%g2,	%i3,	%i0
	movrgez	%i7,	%l0,	%l1
	subcc	%i5,	0x07DC,	%g7
	or	%g3,	%i2,	%o3
	movgu	%xcc,	%o6,	%l4
	fexpand	%f26,	%f12
	sdiv	%l3,	0x1090,	%o5
	xor	%g1,	0x1150,	%g4
	save %i1, %l5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o0,	0x1C61,	%o1
	ldx	[%l7 + 0x58],	%i4
	movcc	%xcc,	%g6,	%o4
	edge16l	%i6,	%l6,	%l2
	srax	%o7,	0x1A,	%g5
	fandnot1s	%f8,	%f31,	%f22
	fzeros	%f24
	edge8n	%g2,	%i0,	%i3
	addccc	%i7,	0x19ED,	%l1
	addc	%l0,	%i5,	%g7
	edge16	%g3,	%i2,	%o3
	sir	0x13BE
	edge8	%l4,	%l3,	%o6
	udiv	%o5,	0x1F44,	%g1
	st	%f16,	[%l7 + 0x08]
	movleu	%xcc,	%i1,	%l5
	ld	[%l7 + 0x58],	%f26
	fmovse	%icc,	%f27,	%f1
	ldd	[%l7 + 0x48],	%o2
	movrlez	%g4,	0x2CC,	%o0
	andcc	%i4,	0x0687,	%g6
	or	%o1,	0x0896,	%i6
	udivcc	%l6,	0x0993,	%o4
	udivx	%o7,	0x1F33,	%g5
	std	%f14,	[%l7 + 0x60]
	andncc	%l2,	%g2,	%i3
	movvc	%xcc,	%i0,	%i7
	movvs	%xcc,	%l0,	%i5
	edge32ln	%l1,	%g3,	%g7
	xnorcc	%o3,	%i2,	%l4
	fxnor	%f14,	%f10,	%f24
	fands	%f3,	%f1,	%f22
	ldsh	[%l7 + 0x3A],	%l3
	fcmpeq16	%f24,	%f28,	%o5
	movn	%icc,	%o6,	%g1
	fexpand	%f7,	%f10
	smulcc	%i1,	0x1134,	%o2
	xor	%g4,	0x0FD7,	%l5
	movn	%xcc,	%o0,	%i4
	movg	%xcc,	%g6,	%o1
	popc	%l6,	%i6
	edge32n	%o7,	%o4,	%l2
	edge32ln	%g2,	%i3,	%g5
	srlx	%i0,	0x1E,	%i7
	edge8n	%l0,	%l1,	%i5
	fmovdgu	%xcc,	%f2,	%f12
	fmovrsgez	%g7,	%f27,	%f20
	ld	[%l7 + 0x14],	%f22
	mulx	%g3,	%o3,	%l4
	fmovscs	%icc,	%f4,	%f30
	sth	%l3,	[%l7 + 0x78]
	fandnot2s	%f20,	%f26,	%f9
	array32	%o5,	%o6,	%g1
	std	%f26,	[%l7 + 0x60]
	mulx	%i2,	0x139B,	%i1
	edge8	%o2,	%g4,	%l5
	fmuld8ulx16	%f14,	%f24,	%f22
	udivx	%i4,	0x09D8,	%g6
	nop
	set	0x64, %i4
	ldsw	[%l7 + %i4],	%o1
	xnorcc	%o0,	0x168E,	%l6
	edge16l	%i6,	%o7,	%l2
	fmovdg	%xcc,	%f3,	%f26
	sll	%g2,	%o4,	%g5
	sethi	0x0225,	%i0
	fnot1s	%f30,	%f7
	fnot1s	%f3,	%f2
	fmovrdne	%i7,	%f10,	%f4
	andn	%i3,	%l1,	%l0
	lduw	[%l7 + 0x70],	%i5
	edge16n	%g3,	%g7,	%l4
	ldsb	[%l7 + 0x6F],	%o3
	edge8	%l3,	%o5,	%g1
	movcs	%xcc,	%o6,	%i1
	sth	%o2,	[%l7 + 0x54]
	array16	%i2,	%g4,	%i4
	xorcc	%g6,	%l5,	%o0
	movvs	%xcc,	%l6,	%i6
	ldsw	[%l7 + 0x24],	%o1
	edge8ln	%o7,	%g2,	%o4
	ldx	[%l7 + 0x60],	%g5
	fpadd32	%f0,	%f0,	%f8
	andcc	%i0,	%l2,	%i3
	fmovrdgez	%i7,	%f8,	%f6
	xor	%l1,	%i5,	%g3
	std	%f30,	[%l7 + 0x78]
	edge32l	%g7,	%l4,	%l0
	edge8l	%o3,	%l3,	%o5
	fsrc2s	%f24,	%f19
	stw	%o6,	[%l7 + 0x58]
	srl	%i1,	0x1B,	%o2
	fcmpgt16	%f26,	%f28,	%i2
	sdiv	%g4,	0x1A66,	%g1
	ldx	[%l7 + 0x78],	%g6
	st	%f18,	[%l7 + 0x14]
	edge32	%l5,	%i4,	%o0
	orn	%l6,	%i6,	%o1
	nop
	set	0x70, %l0
	stx	%o7,	[%l7 + %l0]
	movne	%icc,	%o4,	%g2
	orn	%i0,	%g5,	%l2
	array32	%i7,	%l1,	%i5
	stb	%i3,	[%l7 + 0x44]
	popc	%g3,	%g7
	srlx	%l4,	0x1A,	%l0
	nop
	set	0x4C, %i1
	lduw	[%l7 + %i1],	%o3
	fnors	%f14,	%f7,	%f30
	sll	%l3,	0x05,	%o6
	ldsw	[%l7 + 0x1C],	%i1
	udivcc	%o5,	0x1FBA,	%i2
	fmuld8sux16	%f1,	%f24,	%f6
	sllx	%g4,	%g1,	%o2
	udivcc	%l5,	0x0CEE,	%i4
	sra	%g6,	%o0,	%i6
	fexpand	%f31,	%f28
	st	%f14,	[%l7 + 0x68]
	sub	%o1,	%l6,	%o7
	popc	%o4,	%g2
	udiv	%i0,	0x0C52,	%g5
	orn	%i7,	0x14EA,	%l1
	sethi	0x11F6,	%i5
	fmovdvc	%xcc,	%f19,	%f21
	fmovdle	%xcc,	%f5,	%f30
	edge8	%i3,	%g3,	%l2
	fcmpgt32	%f18,	%f14,	%l4
	edge32ln	%g7,	%o3,	%l0
	edge16ln	%o6,	%i1,	%o5
	andcc	%l3,	%i2,	%g1
	fcmpgt32	%f14,	%f18,	%g4
	fcmpd	%fcc1,	%f28,	%f10
	movl	%xcc,	%l5,	%i4
	fcmpne16	%f14,	%f22,	%g6
	siam	0x0
	movge	%xcc,	%o2,	%o0
	sdivcc	%o1,	0x00A9,	%i6
	array32	%o7,	%l6,	%o4
	fmovdvs	%icc,	%f17,	%f26
	mova	%icc,	%g2,	%g5
	orcc	%i0,	%i7,	%l1
	addc	%i3,	0x0F81,	%g3
	fandnot1s	%f21,	%f23,	%f24
	srax	%i5,	0x00,	%l4
	umulcc	%g7,	0x17F1,	%o3
	umulcc	%l2,	0x04CD,	%l0
	orn	%i1,	0x18D3,	%o5
	movcc	%icc,	%o6,	%l3
	fmovrsgz	%g1,	%f10,	%f26
	movrlez	%i2,	0x054,	%g4
	sethi	0x147F,	%i4
	edge32l	%g6,	%l5,	%o2
	st	%f7,	[%l7 + 0x34]
	ldub	[%l7 + 0x2D],	%o0
	fnegd	%f2,	%f22
	movg	%xcc,	%o1,	%i6
	sub	%l6,	0x1CA9,	%o4
	andn	%g2,	%g5,	%o7
	fsrc2	%f4,	%f10
	edge16	%i7,	%i0,	%i3
	nop
	set	0x60, %l1
	stx	%g3,	[%l7 + %l1]
	stw	%l1,	[%l7 + 0x50]
	edge32	%i5,	%l4,	%o3
	edge16	%l2,	%g7,	%l0
	movrgez	%o5,	0x3E0,	%o6
	fmovsl	%xcc,	%f2,	%f15
	restore %l3, %i1, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f8,	%f16
	ldsh	[%l7 + 0x64],	%g4
	movcs	%icc,	%i2,	%g6
	addc	%l5,	%o2,	%i4
	fmovdg	%icc,	%f17,	%f12
	lduw	[%l7 + 0x7C],	%o0
	ldx	[%l7 + 0x30],	%i6
	movvs	%icc,	%o1,	%o4
	subc	%g2,	0x192C,	%g5
	edge16ln	%l6,	%i7,	%o7
	orn	%i0,	%i3,	%g3
	stb	%i5,	[%l7 + 0x59]
	fmovsleu	%xcc,	%f1,	%f31
	ld	[%l7 + 0x30],	%f12
	movl	%xcc,	%l4,	%o3
	fnot1	%f8,	%f4
	stx	%l1,	[%l7 + 0x20]
	bshuffle	%f12,	%f20,	%f20
	movle	%icc,	%l2,	%l0
	movge	%icc,	%g7,	%o5
	alignaddr	%o6,	%l3,	%i1
	sllx	%g4,	0x0D,	%i2
	edge8n	%g6,	%g1,	%o2
	srax	%l5,	%i4,	%o0
	add	%o1,	0x14E5,	%o4
	addccc	%i6,	0x0522,	%g5
	ldx	[%l7 + 0x18],	%l6
	umul	%i7,	0x048E,	%g2
	alignaddrl	%o7,	%i3,	%i0
	sth	%g3,	[%l7 + 0x70]
	smul	%i5,	%o3,	%l4
	fmovsge	%xcc,	%f26,	%f9
	fmovsn	%icc,	%f13,	%f15
	movle	%xcc,	%l2,	%l1
	orn	%l0,	0x1A27,	%g7
	sdivx	%o6,	0x199A,	%l3
	ldsb	[%l7 + 0x51],	%o5
	popc	0x13FB,	%i1
	ldsw	[%l7 + 0x30],	%g4
	sll	%g6,	%g1,	%o2
	sth	%l5,	[%l7 + 0x16]
	fnand	%f20,	%f22,	%f22
	srl	%i2,	%i4,	%o0
	fmovdpos	%icc,	%f16,	%f21
	movl	%xcc,	%o4,	%i6
	subcc	%g5,	%l6,	%o1
	stx	%g2,	[%l7 + 0x50]
	fxor	%f2,	%f16,	%f30
	andncc	%o7,	%i3,	%i7
	udivcc	%g3,	0x0B1B,	%i5
	srlx	%i0,	%o3,	%l4
	movcs	%icc,	%l1,	%l2
	fmovscs	%icc,	%f29,	%f9
	movgu	%xcc,	%g7,	%l0
	movn	%xcc,	%l3,	%o5
	fmovse	%xcc,	%f4,	%f2
	alignaddr	%i1,	%o6,	%g4
	std	%f20,	[%l7 + 0x08]
	movrgz	%g1,	%g6,	%o2
	sra	%l5,	%i2,	%i4
	fmovdn	%xcc,	%f16,	%f4
	movre	%o4,	0x1EE,	%o0
	ldd	[%l7 + 0x38],	%i6
	umulcc	%g5,	%l6,	%g2
	sethi	0x1934,	%o7
	movcs	%xcc,	%i3,	%o1
	array16	%g3,	%i5,	%i7
	fmovsne	%icc,	%f4,	%f7
	fnor	%f4,	%f26,	%f8
	alignaddrl	%i0,	%l4,	%l1
	subcc	%l2,	%o3,	%l0
	sth	%g7,	[%l7 + 0x5A]
	edge32	%o5,	%l3,	%o6
	subc	%g4,	%i1,	%g6
	add	%o2,	%g1,	%l5
	orn	%i4,	%o4,	%o0
	ldsw	[%l7 + 0x10],	%i6
	movrlez	%g5,	0x265,	%l6
	edge32l	%i2,	%o7,	%g2
	fmovdvc	%icc,	%f19,	%f7
	array8	%i3,	%g3,	%i5
	umulcc	%o1,	0x131D,	%i7
	ld	[%l7 + 0x64],	%f29
	sth	%i0,	[%l7 + 0x3C]
	fmovdleu	%xcc,	%f22,	%f6
	edge16ln	%l1,	%l4,	%o3
	edge16	%l0,	%l2,	%g7
	faligndata	%f0,	%f4,	%f16
	subc	%o5,	0x1D3A,	%o6
	addccc	%g4,	%l3,	%i1
	orn	%o2,	%g1,	%g6
	movg	%xcc,	%i4,	%l5
	lduw	[%l7 + 0x30],	%o4
	sdivx	%o0,	0x074B,	%g5
	fmovdcc	%xcc,	%f2,	%f25
	addc	%l6,	0x0789,	%i2
	udivx	%o7,	0x0281,	%i6
	fandnot2	%f2,	%f30,	%f2
	smul	%g2,	0x12EB,	%i3
	movle	%icc,	%i5,	%o1
	movrlez	%i7,	%g3,	%i0
	fandnot2	%f8,	%f28,	%f4
	umulcc	%l1,	%l4,	%o3
	std	%f20,	[%l7 + 0x30]
	fmul8sux16	%f28,	%f24,	%f22
	fxors	%f7,	%f5,	%f24
	srax	%l2,	%l0,	%g7
	edge16ln	%o5,	%o6,	%l3
	edge16n	%g4,	%i1,	%o2
	andncc	%g6,	%i4,	%l5
	lduh	[%l7 + 0x56],	%o4
	movrlz	%g1,	0x2A3,	%g5
	edge32ln	%o0,	%i2,	%o7
	move	%xcc,	%l6,	%g2
	smul	%i3,	0x043A,	%i5
	array16	%o1,	%i7,	%g3
	movge	%icc,	%i6,	%l1
	movvs	%icc,	%l4,	%o3
	array16	%l2,	%i0,	%g7
	fmul8sux16	%f6,	%f2,	%f28
	smul	%o5,	%o6,	%l3
	srax	%l0,	0x0A,	%i1
	move	%xcc,	%g4,	%g6
	xnor	%o2,	%l5,	%i4
	sdiv	%g1,	0x1CBB,	%o4
	movleu	%xcc,	%o0,	%g5
	addc	%o7,	%l6,	%g2
	fornot2s	%f29,	%f12,	%f2
	fsrc1	%f0,	%f4
	addc	%i2,	0x1D38,	%i3
	fcmpne32	%f30,	%f2,	%o1
	movle	%icc,	%i5,	%g3
	srl	%i6,	%l1,	%i7
	ld	[%l7 + 0x70],	%f4
	fcmple32	%f10,	%f10,	%o3
	popc	0x06AF,	%l2
	edge32l	%i0,	%g7,	%l4
	lduw	[%l7 + 0x5C],	%o5
	xnorcc	%o6,	0x1023,	%l3
	andcc	%i1,	%g4,	%l0
	subccc	%g6,	%l5,	%o2
	ldsh	[%l7 + 0x20],	%g1
	xnor	%o4,	0x0D88,	%o0
	smulcc	%i4,	%o7,	%l6
	orncc	%g5,	0x13A8,	%g2
	save %i3, 0x07E0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f28,	%f7
	sir	0x1A56
	mulx	%i2,	0x0C81,	%g3
	fmovsg	%icc,	%f20,	%f14
	fmovspos	%xcc,	%f27,	%f31
	movgu	%xcc,	%i6,	%l1
	ld	[%l7 + 0x3C],	%f14
	orcc	%i5,	%i7,	%o3
	fmovda	%xcc,	%f6,	%f10
	ldd	[%l7 + 0x40],	%i0
	edge16	%g7,	%l4,	%l2
	fpsub32	%f22,	%f0,	%f10
	nop
	set	0x34, %o7
	stw	%o5,	[%l7 + %o7]
	sllx	%l3,	%o6,	%i1
	std	%f6,	[%l7 + 0x50]
	edge16	%l0,	%g6,	%l5
	movl	%xcc,	%g4,	%o2
	popc	0x1987,	%g1
	ldd	[%l7 + 0x20],	%o4
	udivcc	%o0,	0x01C3,	%o7
	fmovdl	%xcc,	%f7,	%f31
	srl	%i4,	%g5,	%l6
	umul	%i3,	%o1,	%i2
	fnegs	%f10,	%f24
	movge	%icc,	%g2,	%i6
	sdiv	%l1,	0x1C5D,	%g3
	fandnot2s	%f22,	%f24,	%f22
	addccc	%i5,	0x1374,	%i7
	sra	%i0,	0x17,	%g7
	edge32n	%l4,	%l2,	%o5
	edge16ln	%o3,	%o6,	%l3
	lduw	[%l7 + 0x78],	%i1
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	mulscc	%l5,	%g4,	%o2
	edge32l	%g1,	%o4,	%o0
	fmovsvs	%xcc,	%f13,	%f0
	ldsb	[%l7 + 0x31],	%o7
	edge16ln	%i4,	%l6,	%i3
	edge16	%g5,	%o1,	%g2
	fexpand	%f26,	%f14
	lduh	[%l7 + 0x50],	%i6
	fpackfix	%f4,	%f13
	smul	%i2,	%g3,	%i5
	movrlez	%l1,	0x3F1,	%i7
	movneg	%xcc,	%i0,	%l4
	movvc	%icc,	%g7,	%l2
	edge16n	%o3,	%o5,	%o6
	sdivx	%i1,	0x1A07,	%l3
	fcmped	%fcc0,	%f6,	%f0
	mulscc	%g6,	0x1D9E,	%l5
	addcc	%l0,	0x0B87,	%g4
	st	%f8,	[%l7 + 0x5C]
	fnand	%f8,	%f0,	%f20
	save %g1, 0x18CE, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%xcc,	%f27,	%f0
	movrgez	%o0,	0x2BE,	%o7
	ldd	[%l7 + 0x20],	%o4
	movrlz	%i4,	%i3,	%l6
	movrlz	%g5,	0x155,	%g2
	fmovspos	%xcc,	%f29,	%f3
	movcc	%xcc,	%o1,	%i6
	mova	%icc,	%i2,	%i5
	std	%f2,	[%l7 + 0x28]
	add	%l1,	%i7,	%g3
	edge8n	%l4,	%g7,	%l2
	sdiv	%o3,	0x0138,	%o5
	xnorcc	%i0,	%i1,	%l3
	fmovsleu	%xcc,	%f29,	%f23
	sethi	0x156B,	%o6
	or	%g6,	%l0,	%l5
	sir	0x1E40
	movne	%icc,	%g4,	%g1
	xor	%o2,	%o0,	%o7
	addcc	%i4,	0x0D6B,	%o4
	srlx	%l6,	0x1A,	%i3
	addccc	%g2,	0x13AB,	%o1
	movre	%i6,	%i2,	%g5
	fmovdg	%icc,	%f11,	%f30
	edge16	%l1,	%i7,	%i5
	fzeros	%f28
	umulcc	%l4,	%g3,	%g7
	subccc	%o3,	%o5,	%i0
	sra	%l2,	0x1B,	%l3
	fand	%f2,	%f10,	%f0
	ldx	[%l7 + 0x08],	%o6
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f24
	edge16ln	%i1,	%l0,	%l5
	faligndata	%f18,	%f2,	%f24
	movpos	%xcc,	%g6,	%g4
	array32	%o2,	%g1,	%o7
	stw	%o0,	[%l7 + 0x64]
	sir	0x1CDB
	andcc	%i4,	0x192E,	%l6
	movvc	%xcc,	%i3,	%o4
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%o1
	xnor	%i6,	0x0726,	%g2
	fmovrsgez	%i2,	%f22,	%f23
	fands	%f8,	%f10,	%f2
	restore %l1, %g5, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l4,	%g3,	%g7
	addc	%o3,	%o5,	%i0
	ld	[%l7 + 0x10],	%f20
	stb	%i7,	[%l7 + 0x53]
	fpsub32s	%f6,	%f20,	%f7
	fnegs	%f17,	%f7
	smul	%l2,	0x15AF,	%o6
	movne	%xcc,	%i1,	%l0
	movneg	%icc,	%l5,	%g6
	edge16l	%g4,	%o2,	%l3
	orn	%o7,	0x1534,	%o0
	movgu	%xcc,	%g1,	%l6
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	popc	0x1D57,	%i3
	movge	%xcc,	%g2,	%i6
	edge8l	%l1,	%i2,	%i5
	orcc	%g5,	%l4,	%g7
	addc	%o3,	%g3,	%i0
	movpos	%icc,	%o5,	%i7
	sdivx	%l2,	0x078D,	%o6
	edge16n	%l0,	%l5,	%i1
	movne	%xcc,	%g6,	%o2
	fornot2s	%f20,	%f22,	%f28
	xnorcc	%l3,	0x0727,	%o7
	subccc	%g4,	%o0,	%g1
	movne	%icc,	%l6,	%o4
	stw	%i4,	[%l7 + 0x38]
	srl	%o1,	%g2,	%i6
	fmovrdne	%l1,	%f18,	%f20
	xorcc	%i3,	0x11C3,	%i2
	mulx	%i5,	0x1906,	%g5
	movvs	%icc,	%g7,	%o3
	fandnot2	%f12,	%f22,	%f30
	andn	%g3,	0x0B55,	%l4
	fsrc2	%f14,	%f4
	orncc	%o5,	0x19F9,	%i7
	mulx	%i0,	0x06C9,	%o6
	fnot1	%f10,	%f2
	sllx	%l2,	0x17,	%l0
	alignaddrl	%l5,	%i1,	%g6
	umul	%o2,	%l3,	%o7
	edge32	%o0,	%g4,	%l6
	st	%f28,	[%l7 + 0x5C]
	xorcc	%o4,	%g1,	%i4
	fnot2	%f6,	%f14
	sll	%o1,	%i6,	%l1
	movrlez	%g2,	%i3,	%i5
	edge32ln	%i2,	%g5,	%g7
	movleu	%icc,	%o3,	%l4
	smulcc	%o5,	0x063F,	%i7
	sethi	0x0638,	%g3
	sllx	%i0,	%l2,	%o6
	fmovrde	%l5,	%f28,	%f16
	stx	%l0,	[%l7 + 0x70]
	fpmerge	%f26,	%f19,	%f22
	save %g6, %i1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%o7,	%o0,	%l3
	movrne	%l6,	%g4,	%g1
	addccc	%i4,	%o1,	%o4
	orncc	%i6,	0x0221,	%g2
	sdivx	%i3,	0x194F,	%l1
	sub	%i5,	0x015B,	%i2
	fmovdvc	%icc,	%f12,	%f14
	fmovsge	%icc,	%f11,	%f30
	faligndata	%f22,	%f6,	%f28
	movgu	%icc,	%g5,	%g7
	fandnot1s	%f23,	%f1,	%f21
	movge	%xcc,	%o3,	%l4
	mulx	%o5,	0x1790,	%i7
	movvc	%xcc,	%g3,	%i0
	or	%o6,	0x17E1,	%l5
	sethi	0x048A,	%l2
	movl	%icc,	%l0,	%g6
	orncc	%o2,	%i1,	%o0
	ldub	[%l7 + 0x08],	%o7
	edge8ln	%l6,	%l3,	%g1
	fpsub16	%f28,	%f20,	%f6
	movleu	%icc,	%i4,	%g4
	srax	%o4,	0x16,	%o1
	srax	%g2,	0x10,	%i6
	edge32n	%i3,	%l1,	%i2
	smulcc	%i5,	0x0FA7,	%g5
	edge16	%g7,	%l4,	%o5
	ldx	[%l7 + 0x10],	%o3
	fmuld8sux16	%f26,	%f24,	%f0
	subccc	%i7,	0x182F,	%g3
	fornot1s	%f6,	%f4,	%f7
	sethi	0x04B3,	%i0
	ldub	[%l7 + 0x63],	%o6
	movneg	%icc,	%l5,	%l2
	fornot2s	%f30,	%f1,	%f16
	sra	%l0,	%g6,	%o2
	popc	0x1453,	%i1
	sllx	%o7,	0x1C,	%l6
	or	%o0,	0x1588,	%g1
	edge8n	%i4,	%l3,	%g4
	ldd	[%l7 + 0x10],	%f26
	orncc	%o4,	0x1241,	%o1
	movge	%xcc,	%g2,	%i6
	alignaddrl	%i3,	%l1,	%i5
	edge8ln	%i2,	%g7,	%g5
	udivcc	%o5,	0x050B,	%l4
	edge8l	%o3,	%i7,	%g3
	srl	%o6,	0x01,	%l5
	movleu	%xcc,	%l2,	%i0
	orncc	%l0,	%g6,	%o2
	sub	%o7,	0x0926,	%i1
	edge32n	%l6,	%g1,	%i4
	umul	%l3,	%o0,	%g4
	movrne	%o4,	0x3FF,	%o1
	stw	%g2,	[%l7 + 0x44]
	xnor	%i6,	%i3,	%l1
	ldsh	[%l7 + 0x48],	%i5
	sub	%g7,	0x002C,	%g5
	movg	%icc,	%o5,	%l4
	fmul8x16	%f16,	%f18,	%f26
	fxor	%f6,	%f2,	%f28
	orn	%i2,	0x182C,	%i7
	mulx	%g3,	0x14DE,	%o6
	subcc	%l5,	%o3,	%i0
	orncc	%l2,	0x191A,	%g6
	sra	%l0,	0x01,	%o7
	fornot2	%f26,	%f4,	%f12
	and	%i1,	%o2,	%g1
	movge	%icc,	%l6,	%i4
	fones	%f14
	ldsw	[%l7 + 0x10],	%l3
	fcmps	%fcc0,	%f15,	%f16
	movrgz	%g4,	%o0,	%o4
	fcmpeq16	%f22,	%f28,	%g2
	fmovdne	%icc,	%f24,	%f20
	srlx	%i6,	0x06,	%o1
	fxors	%f9,	%f6,	%f1
	edge16ln	%i3,	%l1,	%g7
	fcmpgt32	%f22,	%f16,	%i5
	stw	%g5,	[%l7 + 0x54]
	fpadd32s	%f12,	%f7,	%f16
	sll	%o5,	0x03,	%l4
	xor	%i2,	%g3,	%i7
	fmovrslez	%l5,	%f2,	%f22
	sub	%o3,	0x14E9,	%i0
	fmovsneg	%xcc,	%f30,	%f1
	sdivx	%l2,	0x0023,	%g6
	ld	[%l7 + 0x4C],	%f15
	fmovdcs	%icc,	%f31,	%f22
	fpsub16s	%f27,	%f6,	%f23
	umul	%o6,	0x01A5,	%l0
	ldsh	[%l7 + 0x40],	%o7
	edge16ln	%o2,	%g1,	%i1
	subc	%i4,	0x088A,	%l3
	movvs	%icc,	%l6,	%o0
	fnegs	%f28,	%f26
	ldsh	[%l7 + 0x4E],	%g4
	fpsub16s	%f26,	%f21,	%f8
	add	%o4,	%g2,	%i6
	st	%f22,	[%l7 + 0x40]
	edge16n	%i3,	%l1,	%o1
	ldsb	[%l7 + 0x5B],	%i5
	xnorcc	%g5,	0x0BCE,	%o5
	andn	%l4,	%i2,	%g7
	orcc	%g3,	0x1ACC,	%l5
	movl	%xcc,	%i7,	%o3
	edge8l	%i0,	%g6,	%o6
	fmovsne	%icc,	%f10,	%f6
	movgu	%icc,	%l0,	%l2
	srl	%o2,	%g1,	%i1
	srax	%i4,	0x07,	%l3
	save %o7, %o0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x50],	%o4
	fmovrslz	%g2,	%f16,	%f17
	sll	%l6,	0x0F,	%i6
	xor	%i3,	0x1D5F,	%o1
	fpmerge	%f21,	%f4,	%f14
	move	%xcc,	%i5,	%g5
	fmovd	%f26,	%f2
	fcmpgt16	%f16,	%f26,	%o5
	fmovscc	%xcc,	%f1,	%f29
	udiv	%l4,	0x0215,	%i2
	stb	%g7,	[%l7 + 0x2E]
	movpos	%icc,	%g3,	%l5
	fnot2s	%f28,	%f16
	fpadd32	%f22,	%f6,	%f24
	or	%i7,	%o3,	%l1
	restore %g6, 0x025F, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l0,	0x1C62,	%i0
	nop
	set	0x20, %o2
	ldsw	[%l7 + %o2],	%l2
	std	%f14,	[%l7 + 0x28]
	udivcc	%o2,	0x0D04,	%i1
	fmovsneg	%icc,	%f15,	%f14
	movvs	%icc,	%g1,	%l3
	movrlz	%o7,	0x317,	%o0
	addc	%i4,	0x046A,	%o4
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	srl	%l6,	%i6,	%o1
	fmovrdgez	%i3,	%f4,	%f14
	sdivx	%i5,	0x1A8C,	%o5
	mova	%icc,	%g5,	%l4
	sdivcc	%g7,	0x0293,	%g3
	movrlez	%l5,	0x38E,	%i7
	ldx	[%l7 + 0x40],	%o3
	movcc	%icc,	%l1,	%i2
	sth	%o6,	[%l7 + 0x48]
	orn	%l0,	0x1933,	%g6
	sdivx	%l2,	0x10C1,	%o2
	edge8n	%i1,	%i0,	%l3
	srax	%g1,	0x18,	%o0
	mova	%xcc,	%o7,	%o4
	stx	%i4,	[%l7 + 0x30]
	movvs	%icc,	%g4,	%l6
	array32	%g2,	%o1,	%i3
	srlx	%i5,	0x06,	%o5
	std	%f20,	[%l7 + 0x40]
	fnands	%f9,	%f8,	%f14
	xnorcc	%i6,	%l4,	%g7
	udivcc	%g5,	0x153A,	%l5
	smul	%g3,	0x1B5D,	%o3
	orncc	%l1,	%i7,	%o6
	movvc	%xcc,	%l0,	%g6
	and	%i2,	0x0B2C,	%l2
	ld	[%l7 + 0x14],	%f14
	fmovsleu	%xcc,	%f1,	%f17
	movpos	%xcc,	%i1,	%i0
	subccc	%o2,	0x1047,	%l3
	fpsub32	%f28,	%f26,	%f14
	addcc	%g1,	0x1BF7,	%o0
	fcmpeq32	%f12,	%f22,	%o7
	alignaddr	%i4,	%g4,	%o4
	fmovrsgez	%l6,	%f10,	%f16
	stw	%g2,	[%l7 + 0x24]
	movne	%icc,	%o1,	%i5
	bshuffle	%f24,	%f8,	%f6
	fsrc1	%f18,	%f30
	ld	[%l7 + 0x28],	%f0
	fmovsn	%icc,	%f27,	%f2
	fcmpeq16	%f12,	%f28,	%i3
	sethi	0x0400,	%i6
	edge8n	%l4,	%g7,	%g5
	edge8l	%l5,	%o5,	%g3
	mulx	%o3,	%i7,	%o6
	movpos	%icc,	%l1,	%l0
	std	%f28,	[%l7 + 0x50]
	move	%icc,	%i2,	%l2
	edge8	%g6,	%i0,	%i1
	faligndata	%f22,	%f4,	%f30
	addccc	%o2,	%g1,	%l3
	sub	%o7,	%o0,	%g4
	umul	%o4,	0x0A9A,	%i4
	fcmpd	%fcc2,	%f20,	%f24
	sdiv	%g2,	0x084C,	%l6
	ldd	[%l7 + 0x30],	%f14
	edge32	%o1,	%i5,	%i6
	sdivcc	%i3,	0x1541,	%l4
	move	%xcc,	%g5,	%g7
	fabsd	%f6,	%f10
	ldx	[%l7 + 0x08],	%o5
	subcc	%g3,	%l5,	%i7
	ldub	[%l7 + 0x3E],	%o6
	addc	%l1,	0x0150,	%o3
	movrlez	%i2,	%l0,	%g6
	xnor	%l2,	0x0FA8,	%i0
	edge8l	%i1,	%g1,	%l3
	add	%o2,	0x1C38,	%o7
	smul	%o0,	0x1865,	%g4
	ldd	[%l7 + 0x68],	%f0
	andcc	%o4,	%i4,	%g2
	sir	0x19C5
	alignaddrl	%l6,	%o1,	%i5
	ldx	[%l7 + 0x60],	%i3
	edge8l	%l4,	%g5,	%g7
	edge32ln	%o5,	%i6,	%g3
	ldsb	[%l7 + 0x40],	%i7
	st	%f21,	[%l7 + 0x78]
	add	%o6,	%l1,	%l5
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%o2
	sll	%l0,	0x18,	%g6
	edge16	%i2,	%i0,	%i1
	lduh	[%l7 + 0x20],	%g1
	fnand	%f8,	%f26,	%f30
	movne	%xcc,	%l2,	%l3
	movcc	%xcc,	%o7,	%o0
	andncc	%g4,	%o2,	%i4
	sth	%g2,	[%l7 + 0x42]
	edge8ln	%o4,	%o1,	%l6
	udivcc	%i5,	0x173A,	%i3
	fmovsne	%xcc,	%f13,	%f18
	fmovscc	%xcc,	%f2,	%f11
	umulcc	%l4,	0x0EF1,	%g7
	fmovdvc	%icc,	%f0,	%f28
	stx	%o5,	[%l7 + 0x28]
	edge32n	%i6,	%g5,	%i7
	sethi	0x0CC1,	%g3
	xnorcc	%l1,	%l5,	%o3
	ldx	[%l7 + 0x28],	%l0
	mova	%xcc,	%o6,	%g6
	edge16l	%i2,	%i0,	%i1
	bshuffle	%f24,	%f10,	%f28
	srl	%l2,	0x16,	%g1
	addc	%l3,	0x12E4,	%o0
	sra	%o7,	%o2,	%i4
	restore %g4, %o4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%l6,	%i5
	save %g2, 0x1917, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g7,	%l4
	xnorcc	%i6,	%g5,	%o5
	movn	%xcc,	%i7,	%l1
	movrlz	%g3,	%l5,	%l0
	popc	%o6,	%o3
	addcc	%g6,	0x160E,	%i2
	movpos	%icc,	%i1,	%i0
	udiv	%g1,	0x1874,	%l2
	orncc	%o0,	0x14AC,	%l3
	udivcc	%o7,	0x1B8B,	%o2
	fmovdl	%icc,	%f20,	%f19
	movcs	%icc,	%i4,	%o4
	alignaddrl	%o1,	%l6,	%i5
	add	%g4,	0x0FB6,	%g2
	udivx	%i3,	0x0D07,	%l4
	fpack32	%f10,	%f0,	%f14
	edge16l	%i6,	%g5,	%o5
	movgu	%xcc,	%i7,	%l1
	movvc	%xcc,	%g3,	%l5
	edge32	%g7,	%l0,	%o3
	movrlez	%o6,	%i2,	%g6
	fmovsge	%icc,	%f0,	%f31
	alignaddr	%i0,	%i1,	%g1
	fmovsne	%xcc,	%f12,	%f0
	fexpand	%f2,	%f18
	edge32ln	%o0,	%l2,	%o7
	sdivx	%l3,	0x03D5,	%i4
	sdivcc	%o4,	0x1110,	%o1
	fcmpd	%fcc1,	%f28,	%f12
	alignaddr	%o2,	%l6,	%i5
	addcc	%g4,	%g2,	%i3
	movne	%xcc,	%i6,	%l4
	addc	%g5,	%i7,	%l1
	xorcc	%o5,	%l5,	%g3
	movrlz	%g7,	%o3,	%l0
	sub	%o6,	%g6,	%i2
	movrlez	%i1,	0x346,	%i0
	edge32l	%g1,	%l2,	%o0
	xor	%o7,	0x00CD,	%l3
	fcmped	%fcc0,	%f28,	%f18
	movre	%i4,	0x37B,	%o4
	movcc	%icc,	%o2,	%l6
	edge32n	%i5,	%g4,	%o1
	movge	%xcc,	%i3,	%g2
	ldx	[%l7 + 0x40],	%i6
	nop
	set	0x28, %i2
	stb	%g5,	[%l7 + %i2]
	addcc	%l4,	0x04DF,	%i7
	sdiv	%o5,	0x06A5,	%l5
	fmovdne	%icc,	%f6,	%f9
	nop
	set	0x18, %o5
	stx	%l1,	[%l7 + %o5]
	edge16	%g3,	%o3,	%l0
	movrgez	%o6,	0x211,	%g7
	edge16	%g6,	%i1,	%i2
	sllx	%g1,	0x05,	%l2
	mulx	%o0,	%i0,	%l3
	array32	%i4,	%o7,	%o2
	orcc	%o4,	0x1D6D,	%l6
	fmovsle	%xcc,	%f6,	%f10
	edge32n	%i5,	%g4,	%i3
	sub	%o1,	%i6,	%g5
	edge16ln	%g2,	%l4,	%i7
	sra	%l5,	%o5,	%l1
	fmuld8ulx16	%f13,	%f0,	%f10
	fmovsvc	%icc,	%f22,	%f8
	srax	%o3,	%l0,	%g3
	fornot2s	%f31,	%f17,	%f2
	mulx	%o6,	0x056B,	%g6
	sdiv	%i1,	0x013D,	%g7
	movl	%icc,	%g1,	%i2
	movcc	%icc,	%o0,	%l2
	movcc	%icc,	%i0,	%l3
	fcmple16	%f14,	%f8,	%o7
	edge16n	%i4,	%o2,	%o4
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	subcc	%i3,	%o1,	%i6
	xnor	%g4,	0x02F5,	%g5
	edge8	%g2,	%i7,	%l4
	edge32l	%o5,	%l1,	%o3
	fpack32	%f26,	%f12,	%f16
	movcc	%icc,	%l5,	%l0
	sethi	0x1F15,	%o6
	sdivcc	%g3,	0x0CB6,	%g6
	srl	%g7,	0x14,	%i1
	xnor	%i2,	%g1,	%o0
	movrne	%i0,	%l3,	%l2
	movl	%xcc,	%i4,	%o7
	edge32ln	%o2,	%i5,	%l6
	fmovsg	%xcc,	%f23,	%f9
	fmovdcs	%xcc,	%f20,	%f31
	movrgz	%i3,	0x33F,	%o1
	fxnors	%f13,	%f5,	%f27
	edge16l	%o4,	%i6,	%g4
	stw	%g5,	[%l7 + 0x18]
	stx	%g2,	[%l7 + 0x30]
	xor	%i7,	%l4,	%o5
	faligndata	%f26,	%f20,	%f0
	sdivx	%o3,	0x0C4B,	%l1
	ldsb	[%l7 + 0x64],	%l5
	xor	%l0,	%o6,	%g6
	movrlez	%g3,	%g7,	%i1
	umul	%g1,	%i2,	%o0
	fpack32	%f8,	%f22,	%f16
	addc	%i0,	%l2,	%i4
	udiv	%o7,	0x138B,	%l3
	xnor	%i5,	0x0997,	%l6
	sth	%i3,	[%l7 + 0x58]
	srlx	%o2,	0x1F,	%o1
	edge16n	%i6,	%o4,	%g4
	srlx	%g5,	0x00,	%g2
	smulcc	%l4,	%i7,	%o3
	ld	[%l7 + 0x20],	%f1
	fnot2	%f26,	%f4
	subc	%l1,	%l5,	%o5
	udivcc	%o6,	0x028C,	%g6
	movrlez	%l0,	0x1DC,	%g7
	sra	%i1,	0x12,	%g3
	stb	%i2,	[%l7 + 0x46]
	fcmple16	%f16,	%f22,	%g1
	lduh	[%l7 + 0x5E],	%i0
	save %o0, %l2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l3,	0x17F2,	%i4
	mova	%xcc,	%i5,	%i3
	restore %l6, %o1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%o2,	%g5
	movgu	%icc,	%g2,	%g4
	move	%xcc,	%i7,	%l4
	fnot1s	%f25,	%f29
	fmovsne	%icc,	%f18,	%f25
	udivx	%l1,	0x07F5,	%o3
	movrgz	%l5,	%o6,	%o5
	movleu	%xcc,	%l0,	%g7
	addcc	%g6,	%i1,	%i2
	save %g1, %g3, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o0,	0x0800,	%o7
	lduh	[%l7 + 0x34],	%l2
	subcc	%i4,	0x10FB,	%l3
	sdiv	%i3,	0x1F73,	%i5
	edge32	%l6,	%o1,	%o4
	fmovscc	%xcc,	%f7,	%f25
	sra	%o2,	0x07,	%g5
	udivx	%g2,	0x1D34,	%g4
	sllx	%i6,	0x01,	%l4
	ldsh	[%l7 + 0x64],	%i7
	fxor	%f0,	%f26,	%f24
	xor	%l1,	0x0B43,	%l5
	lduh	[%l7 + 0x34],	%o6
	umulcc	%o3,	0x0A1A,	%o5
	movrgz	%g7,	0x069,	%g6
	fpsub32s	%f11,	%f9,	%f16
	movrlez	%l0,	%i2,	%i1
	fmovse	%xcc,	%f7,	%f24
	movge	%icc,	%g1,	%i0
	movrne	%o0,	%g3,	%o7
	st	%f16,	[%l7 + 0x60]
	fmovsg	%xcc,	%f2,	%f10
	udivx	%i4,	0x016F,	%l2
	sllx	%l3,	%i5,	%i3
	stb	%o1,	[%l7 + 0x6A]
	smul	%o4,	%l6,	%g5
	mova	%xcc,	%g2,	%g4
	movvs	%xcc,	%o2,	%i6
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	array32	%o6,	%o3,	%i7
	ldsh	[%l7 + 0x56],	%o5
	movrgez	%g6,	0x185,	%l0
	movrgez	%g7,	0x29C,	%i2
	edge8n	%g1,	%i0,	%i1
	fsrc1s	%f19,	%f31
	movne	%xcc,	%o0,	%g3
	fmovrde	%i4,	%f20,	%f6
	xor	%o7,	0x1092,	%l3
	alignaddr	%l2,	%i5,	%o1
	sra	%i3,	0x0A,	%o4
	sth	%l6,	[%l7 + 0x46]
	fpadd32s	%f4,	%f30,	%f2
	sir	0x1AF1
	fcmpd	%fcc2,	%f10,	%f8
	stx	%g2,	[%l7 + 0x18]
	fmovsa	%icc,	%f21,	%f5
	movrne	%g4,	0x08E,	%o2
	edge16l	%i6,	%l4,	%l1
	fmovsn	%icc,	%f2,	%f5
	xor	%l5,	%o6,	%o3
	movgu	%xcc,	%g5,	%o5
	fzero	%f26
	edge8ln	%g6,	%i7,	%g7
	orn	%l0,	%g1,	%i2
	edge32	%i1,	%i0,	%g3
	srl	%o0,	%i4,	%l3
	nop
	set	0x10, %o6
	ldx	[%l7 + %o6],	%l2
	fmul8x16au	%f30,	%f23,	%f0
	add	%o7,	%o1,	%i5
	orncc	%i3,	0x0A5A,	%o4
	fmovse	%icc,	%f9,	%f25
	mova	%icc,	%l6,	%g2
	restore %g4, %i6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l4,	%l5
	nop
	set	0x68, %o4
	std	%f26,	[%l7 + %o4]
	fcmpgt32	%f16,	%f4,	%l1
	mulx	%o3,	%g5,	%o6
	movrlez	%g6,	%o5,	%i7
	edge16	%l0,	%g1,	%i2
	edge8ln	%i1,	%g7,	%g3
	umulcc	%i0,	%i4,	%l3
	fmovdcs	%xcc,	%f16,	%f7
	movvc	%icc,	%o0,	%o7
	andn	%l2,	%o1,	%i5
	sllx	%i3,	%l6,	%o4
	addccc	%g4,	%i6,	%o2
	ldub	[%l7 + 0x09],	%g2
	array8	%l5,	%l4,	%o3
	lduh	[%l7 + 0x18],	%l1
	udiv	%g5,	0x0DE7,	%g6
	alignaddr	%o5,	%i7,	%o6
	sdivcc	%g1,	0x060D,	%l0
	xorcc	%i1,	0x0BCC,	%i2
	fmovdg	%xcc,	%f17,	%f10
	ldd	[%l7 + 0x48],	%g6
	siam	0x1
	std	%f8,	[%l7 + 0x48]
	popc	%i0,	%g3
	xor	%i4,	%o0,	%l3
	movneg	%icc,	%l2,	%o1
	edge8ln	%o7,	%i3,	%i5
	fmuld8sux16	%f24,	%f25,	%f14
	orncc	%l6,	%g4,	%i6
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%o2
	srlx	%g2,	%o4,	%l4
	fmovdvs	%icc,	%f18,	%f23
	edge8	%l5,	%o3,	%g5
	edge16ln	%g6,	%l1,	%o5
	edge16n	%i7,	%o6,	%l0
	fnor	%f28,	%f16,	%f6
	lduh	[%l7 + 0x32],	%g1
	fpsub16	%f20,	%f6,	%f22
	edge16n	%i2,	%i1,	%g7
	sll	%g3,	0x1A,	%i4
	movle	%xcc,	%o0,	%i0
	st	%f28,	[%l7 + 0x30]
	subcc	%l3,	%o1,	%l2
	sir	0x0D72
	fcmpeq32	%f22,	%f28,	%i3
	xnorcc	%o7,	%i5,	%g4
	stw	%l6,	[%l7 + 0x54]
	nop
	set	0x20, %i6
	ldsh	[%l7 + %i6],	%o2
	ldsh	[%l7 + 0x54],	%i6
	movrgz	%o4,	%g2,	%l4
	edge32	%l5,	%o3,	%g5
	nop
	set	0x18, %g4
	stx	%l1,	[%l7 + %g4]
	udivx	%o5,	0x10CA,	%i7
	movvc	%xcc,	%g6,	%l0
	movrne	%o6,	%g1,	%i2
	edge16ln	%g7,	%g3,	%i1
	movrgez	%o0,	0x3C3,	%i4
	edge32	%i0,	%l3,	%o1
	udivcc	%l2,	0x0846,	%o7
	fmovscc	%xcc,	%f24,	%f21
	sdivx	%i5,	0x0143,	%i3
	stx	%l6,	[%l7 + 0x40]
	sdivx	%o2,	0x0107,	%g4
	udiv	%i6,	0x1170,	%o4
	fnors	%f10,	%f28,	%f3
	fmul8sux16	%f8,	%f8,	%f2
	movcc	%icc,	%l4,	%g2
	movn	%icc,	%o3,	%g5
	sll	%l5,	0x14,	%o5
	fmovrdgez	%i7,	%f12,	%f22
	sdiv	%g6,	0x0448,	%l0
	edge8	%l1,	%o6,	%i2
	movge	%icc,	%g1,	%g3
	udivx	%g7,	0x0B8D,	%o0
	and	%i4,	0x19E4,	%i0
	edge32n	%l3,	%o1,	%l2
	sdivx	%i1,	0x0F7F,	%i5
	alignaddr	%o7,	%i3,	%o2
	lduh	[%l7 + 0x66],	%g4
	movleu	%xcc,	%l6,	%o4
	srax	%i6,	0x02,	%l4
	movrgez	%o3,	0x0D3,	%g2
	orncc	%g5,	0x158C,	%o5
	and	%l5,	0x1D33,	%i7
	andcc	%l0,	%l1,	%o6
	and	%g6,	%g1,	%g3
	fmuld8ulx16	%f25,	%f14,	%f22
	edge16	%i2,	%g7,	%o0
	xnor	%i4,	%l3,	%i0
	fmovdn	%icc,	%f21,	%f25
	ldd	[%l7 + 0x78],	%l2
	addc	%i1,	%i5,	%o1
	ld	[%l7 + 0x78],	%f24
	orncc	%i3,	0x18A0,	%o7
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	movn	%icc,	%o4,	%i6
	movg	%xcc,	%o2,	%l4
	srax	%o3,	%g5,	%g2
	alignaddrl	%o5,	%i7,	%l5
	fone	%f8
	sra	%l0,	0x00,	%o6
	fands	%f30,	%f26,	%f21
	edge16n	%l1,	%g6,	%g1
	fcmple16	%f20,	%f12,	%g3
	fmul8x16au	%f17,	%f30,	%f28
	sll	%g7,	%o0,	%i2
	stx	%l3,	[%l7 + 0x38]
	alignaddr	%i0,	%l2,	%i1
	edge8ln	%i5,	%i4,	%o1
	movleu	%xcc,	%o7,	%i3
	movleu	%icc,	%g4,	%l6
	ld	[%l7 + 0x10],	%f26
	edge32l	%i6,	%o4,	%l4
	addcc	%o3,	0x0501,	%g5
	smulcc	%o2,	0x1C38,	%g2
	alignaddr	%o5,	%i7,	%l0
	orn	%l5,	%l1,	%g6
	ldd	[%l7 + 0x20],	%g0
	fmovsvc	%icc,	%f30,	%f2
	alignaddr	%o6,	%g7,	%o0
	ldsh	[%l7 + 0x10],	%g3
	lduw	[%l7 + 0x64],	%i2
	udivcc	%i0,	0x0855,	%l2
	ldd	[%l7 + 0x18],	%f4
	popc	%l3,	%i5
	edge8	%i4,	%o1,	%i1
	add	%i3,	0x003D,	%g4
	movge	%xcc,	%l6,	%i6
	subc	%o4,	0x0C7A,	%o7
	xnor	%l4,	0x036F,	%g5
	ldd	[%l7 + 0x30],	%o2
	fand	%f14,	%f24,	%f22
	fmovd	%f16,	%f12
	movrlz	%o3,	%g2,	%o5
	sdivx	%l0,	0x1546,	%i7
	umul	%l5,	%l1,	%g6
	st	%f14,	[%l7 + 0x74]
	array8	%g1,	%o6,	%g7
	fmul8sux16	%f26,	%f16,	%f30
	andcc	%o0,	0x1ADF,	%i2
	fmovdvc	%icc,	%f25,	%f2
	fmovsl	%icc,	%f17,	%f26
	movn	%icc,	%i0,	%g3
	edge8	%l3,	%i5,	%l2
	stw	%i4,	[%l7 + 0x18]
	ldsw	[%l7 + 0x64],	%o1
	array16	%i1,	%g4,	%l6
	fpadd16s	%f5,	%f2,	%f19
	andncc	%i3,	%o4,	%o7
	movvc	%icc,	%l4,	%g5
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%i6
	lduw	[%l7 + 0x34],	%o2
	addccc	%o3,	%o5,	%l0
	alignaddrl	%i7,	%l5,	%l1
	array8	%g6,	%g2,	%o6
	sll	%g1,	%g7,	%o0
	subcc	%i2,	0x1FD5,	%i0
	fnand	%f16,	%f24,	%f16
	addc	%l3,	%i5,	%l2
	movrlz	%g3,	0x09A,	%i4
	umulcc	%o1,	%g4,	%i1
	fnegs	%f12,	%f24
	edge8n	%i3,	%l6,	%o4
	stx	%l4,	[%l7 + 0x18]
	fmovse	%icc,	%f8,	%f9
	subcc	%o7,	%i6,	%g5
	andcc	%o3,	%o2,	%o5
	edge16	%i7,	%l0,	%l1
	movn	%icc,	%g6,	%g2
	fmovscc	%xcc,	%f9,	%f25
	nop
	set	0x5C, %l2
	ldsw	[%l7 + %l2],	%o6
	movge	%xcc,	%g1,	%l5
	smul	%o0,	%i2,	%i0
	fmovdg	%icc,	%f16,	%f8
	popc	%l3,	%i5
	ldsw	[%l7 + 0x64],	%g7
	fmovdl	%xcc,	%f15,	%f21
	edge8ln	%l2,	%i4,	%o1
	mova	%xcc,	%g3,	%i1
	ldsh	[%l7 + 0x50],	%i3
	fmovrdgez	%l6,	%f28,	%f12
	fornot1	%f0,	%f30,	%f6
	fmovdl	%xcc,	%f29,	%f21
	ldd	[%l7 + 0x68],	%o4
	array32	%l4,	%o7,	%i6
	fmovd	%f8,	%f16
	srlx	%g4,	0x17,	%g5
	stw	%o2,	[%l7 + 0x28]
	fmovrdgez	%o3,	%f16,	%f10
	mulscc	%i7,	0x1B1B,	%o5
	ldx	[%l7 + 0x20],	%l1
	fmovsne	%xcc,	%f7,	%f8
	srl	%l0,	0x12,	%g2
	fmovsn	%xcc,	%f17,	%f24
	edge8n	%g6,	%o6,	%l5
	edge16	%g1,	%o0,	%i2
	movle	%xcc,	%l3,	%i0
	movneg	%xcc,	%g7,	%l2
	ldsb	[%l7 + 0x7B],	%i4
	smul	%i5,	0x0723,	%o1
	ldsb	[%l7 + 0x72],	%g3
	edge16n	%i3,	%i1,	%o4
	sdivx	%l4,	0x173E,	%l6
	addc	%o7,	0x1641,	%g4
	addc	%i6,	%o2,	%g5
	udivx	%o3,	0x0506,	%o5
	movrgez	%l1,	%l0,	%g2
	sllx	%g6,	%i7,	%l5
	addcc	%g1,	%o6,	%o0
	movrne	%i2,	%i0,	%g7
	array32	%l3,	%i4,	%i5
	and	%o1,	0x12C7,	%g3
	andncc	%i3,	%i1,	%o4
	ldd	[%l7 + 0x60],	%l4
	stx	%l2,	[%l7 + 0x70]
	lduw	[%l7 + 0x74],	%l6
	fpmerge	%f11,	%f0,	%f6
	movrne	%g4,	%i6,	%o2
	fors	%f22,	%f14,	%f26
	orncc	%o7,	%g5,	%o5
	stw	%l1,	[%l7 + 0x34]
	fpmerge	%f6,	%f24,	%f20
	fmovrsne	%o3,	%f7,	%f17
	subccc	%l0,	0x19D9,	%g6
	fxnors	%f11,	%f14,	%f28
	fsrc1s	%f19,	%f19
	fmovsneg	%xcc,	%f8,	%f3
	fpsub16	%f14,	%f22,	%f2
	st	%f7,	[%l7 + 0x08]
	andcc	%i7,	%g2,	%g1
	fmovrdgz	%o6,	%f4,	%f0
	fmovdpos	%icc,	%f13,	%f4
	andncc	%o0,	%l5,	%i2
	edge8	%g7,	%i0,	%i4
	fnor	%f10,	%f4,	%f6
	subccc	%l3,	%i5,	%g3
	movneg	%xcc,	%i3,	%i1
	fmovs	%f10,	%f7
	movpos	%icc,	%o1,	%o4
	fxor	%f0,	%f10,	%f2
	array32	%l2,	%l6,	%l4
	save %i6, %g4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f18,	[%l7 + 0x70]
	move	%xcc,	%o7,	%g5
	edge32n	%l1,	%o5,	%o3
	fxnors	%f13,	%f31,	%f1
	sdivcc	%g6,	0x05AD,	%l0
	move	%xcc,	%i7,	%g1
	fpsub32s	%f4,	%f1,	%f24
	sethi	0x16FE,	%g2
	fpadd16s	%f20,	%f31,	%f23
	andn	%o6,	%l5,	%o0
	fmovse	%icc,	%f1,	%f8
	movvc	%icc,	%i2,	%i0
	fand	%f4,	%f10,	%f20
	fnegd	%f6,	%f16
	add	%i4,	%g7,	%i5
	umul	%l3,	%i3,	%g3
	edge8n	%o1,	%i1,	%o4
	array16	%l2,	%l4,	%l6
	edge8n	%i6,	%g4,	%o7
	sra	%o2,	0x14,	%l1
	udivx	%g5,	0x00C0,	%o5
	add	%o3,	0x1EE3,	%g6
	fmovdle	%xcc,	%f23,	%f11
	movpos	%icc,	%l0,	%g1
	lduw	[%l7 + 0x50],	%g2
	add	%o6,	%l5,	%i7
	fmul8ulx16	%f0,	%f26,	%f26
	restore %i2, 0x183F, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f10,	%f28
	andcc	%i4,	0x1B3C,	%g7
	or	%i5,	0x0B9D,	%l3
	udiv	%o0,	0x1A0A,	%i3
	fcmpd	%fcc3,	%f0,	%f10
	fands	%f25,	%f6,	%f31
	fnegs	%f3,	%f7
	movneg	%icc,	%g3,	%i1
	fmovrdgez	%o4,	%f18,	%f2
	movrgez	%l2,	0x1D8,	%o1
	array32	%l4,	%l6,	%i6
	save %g4, 0x0F11, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o7,	%l1,	%g5
	fmovsleu	%icc,	%f10,	%f7
	fornot1s	%f20,	%f26,	%f18
	nop
	set	0x32, %g7
	ldsb	[%l7 + %g7],	%o3
	edge16	%o5,	%g6,	%g1
	movl	%icc,	%l0,	%o6
	move	%xcc,	%g2,	%i7
	fpsub16	%f16,	%f30,	%f8
	fnot2	%f28,	%f12
	orn	%l5,	0x0571,	%i0
	fmovrse	%i2,	%f1,	%f29
	lduh	[%l7 + 0x56],	%i4
	xnor	%i5,	%l3,	%o0
	orcc	%g7,	0x061F,	%g3
	nop
	set	0x28, %i3
	std	%f14,	[%l7 + %i3]
	fmovsvc	%xcc,	%f30,	%f7
	sdivx	%i3,	0x13B8,	%o4
	andcc	%l2,	%o1,	%l4
	edge32n	%i1,	%l6,	%i6
	ldub	[%l7 + 0x4D],	%o2
	fmovdg	%xcc,	%f6,	%f20
	andcc	%g4,	%l1,	%o7
	smul	%o3,	%o5,	%g6
	edge32	%g5,	%l0,	%g1
	fmovsgu	%icc,	%f31,	%f15
	array8	%g2,	%i7,	%o6
	movvc	%icc,	%l5,	%i0
	srax	%i2,	%i4,	%i5
	st	%f2,	[%l7 + 0x60]
	lduw	[%l7 + 0x24],	%l3
	fnot1	%f2,	%f20
	sdiv	%g7,	0x0633,	%o0
	andncc	%i3,	%o4,	%l2
	popc	0x027D,	%g3
	movl	%icc,	%o1,	%l4
	movrgez	%i1,	%l6,	%i6
	movrlz	%g4,	%l1,	%o2
	fmovdle	%icc,	%f23,	%f21
	movpos	%xcc,	%o7,	%o3
	movneg	%icc,	%o5,	%g5
	movvs	%icc,	%l0,	%g6
	or	%g2,	0x02B3,	%g1
	lduh	[%l7 + 0x36],	%i7
	fmovdleu	%icc,	%f17,	%f17
	addcc	%l5,	0x1352,	%i0
	udivcc	%i2,	0x119A,	%o6
	movvc	%icc,	%i4,	%i5
	sdiv	%l3,	0x16CB,	%g7
	edge8l	%i3,	%o0,	%o4
	array32	%g3,	%l2,	%o1
	fpsub32s	%f0,	%f15,	%f14
	edge8ln	%i1,	%l6,	%l4
	sub	%i6,	0x0E05,	%l1
	fpsub16	%f30,	%f16,	%f12
	orncc	%g4,	0x1F76,	%o7
	fmovrdgez	%o2,	%f12,	%f24
	movvs	%icc,	%o3,	%g5
	xnorcc	%l0,	0x01F1,	%o5
	nop
	set	0x08, %l3
	lduh	[%l7 + %l3],	%g6
	movrgez	%g1,	0x0F5,	%i7
	movrlez	%l5,	0x34C,	%i0
	faligndata	%f30,	%f16,	%f20
	ld	[%l7 + 0x60],	%f26
	edge32	%i2,	%o6,	%g2
	movleu	%icc,	%i4,	%i5
	fmul8sux16	%f8,	%f10,	%f2
	fmuld8ulx16	%f21,	%f30,	%f14
	xorcc	%l3,	0x150A,	%i3
	xor	%o0,	0x178F,	%o4
	fmul8sux16	%f24,	%f20,	%f14
	subcc	%g3,	0x15F9,	%l2
	alignaddr	%g7,	%o1,	%l6
	fpadd16	%f28,	%f20,	%f20
	edge8	%l4,	%i1,	%i6
	addccc	%l1,	0x0DE5,	%o7
	movne	%xcc,	%o2,	%g4
	movn	%xcc,	%o3,	%l0
	fmovdle	%xcc,	%f29,	%f8
	xor	%g5,	%o5,	%g6
	movpos	%icc,	%i7,	%g1
	fpack32	%f26,	%f26,	%f8
	edge16	%l5,	%i0,	%i2
	mova	%icc,	%g2,	%o6
	addccc	%i5,	%l3,	%i3
	movle	%icc,	%i4,	%o0
	edge8	%o4,	%l2,	%g7
	stx	%o1,	[%l7 + 0x20]
	movne	%icc,	%g3,	%l6
	edge8n	%i1,	%i6,	%l4
	fexpand	%f31,	%f26
	movgu	%xcc,	%o7,	%o2
	srlx	%g4,	%l1,	%o3
	sdivx	%l0,	0x07B6,	%o5
	xor	%g5,	%i7,	%g6
	movne	%icc,	%l5,	%g1
	fxors	%f12,	%f23,	%f0
	xorcc	%i0,	0x1B2B,	%g2
	stx	%i2,	[%l7 + 0x20]
	fnot2s	%f10,	%f26
	xnorcc	%i5,	%o6,	%l3
	mulx	%i4,	0x0661,	%o0
	movg	%icc,	%i3,	%l2
	fmul8x16au	%f1,	%f10,	%f6
	ldub	[%l7 + 0x53],	%o4
	fmovs	%f0,	%f15
	fcmpeq32	%f22,	%f4,	%g7
	movl	%xcc,	%o1,	%g3
	movrlez	%i1,	0x190,	%i6
	fmovsg	%xcc,	%f6,	%f1
	ldsw	[%l7 + 0x08],	%l6
	movrlez	%l4,	0x3DD,	%o7
	array16	%o2,	%g4,	%l1
	xorcc	%l0,	%o5,	%o3
	st	%f6,	[%l7 + 0x3C]
	orcc	%g5,	%i7,	%l5
	movcs	%xcc,	%g1,	%i0
	orn	%g2,	0x19F7,	%g6
	movle	%icc,	%i2,	%o6
	fcmpne16	%f10,	%f30,	%l3
	std	%f20,	[%l7 + 0x38]
	edge32	%i5,	%o0,	%i4
	ldub	[%l7 + 0x3B],	%i3
	xnorcc	%l2,	%g7,	%o1
	fmovdl	%icc,	%f24,	%f26
	fandnot2s	%f27,	%f29,	%f1
	movrgz	%g3,	%i1,	%i6
	fpack32	%f28,	%f12,	%f8
	nop
	set	0x68, %i0
	sth	%l6,	[%l7 + %i0]
	movrne	%l4,	0x345,	%o4
	ldsh	[%l7 + 0x1A],	%o7
	fmovrsne	%o2,	%f21,	%f17
	st	%f19,	[%l7 + 0x08]
	nop
	set	0x34, %g2
	ldub	[%l7 + %g2],	%l1
	sth	%l0,	[%l7 + 0x64]
	nop
	set	0x78, %g1
	stw	%g4,	[%l7 + %g1]
	ldub	[%l7 + 0x6F],	%o3
	sth	%g5,	[%l7 + 0x3A]
	array32	%o5,	%i7,	%g1
	mulx	%l5,	0x0345,	%g2
	array8	%g6,	%i0,	%i2
	array32	%l3,	%o6,	%o0
	movne	%icc,	%i4,	%i3
	udivx	%l2,	0x1A27,	%g7
	movre	%o1,	%i5,	%i1
	sir	0x1300
	udivx	%i6,	0x1426,	%g3
	array8	%l4,	%l6,	%o7
	fandnot1	%f28,	%f2,	%f12
	fpadd16s	%f10,	%f2,	%f26
	ldsh	[%l7 + 0x30],	%o2
	sdivx	%o4,	0x1D8E,	%l1
	sdivcc	%g4,	0x06EF,	%l0
	nop
	set	0x48, %i5
	stb	%o3,	[%l7 + %i5]
	srlx	%g5,	%o5,	%g1
	save %i7, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g2,	0x0805,	%i2
	andncc	%i0,	%o6,	%l3
	add	%i4,	0x087F,	%o0
	fpadd16s	%f24,	%f3,	%f1
	and	%i3,	%l2,	%o1
	fcmpeq32	%f20,	%f16,	%g7
	fmovdcs	%icc,	%f22,	%f8
	fmovdleu	%xcc,	%f15,	%f16
	xnorcc	%i5,	%i6,	%i1
	andcc	%l4,	%g3,	%l6
	fpsub16s	%f6,	%f28,	%f9
	save %o7, 0x10C4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o2,	%g4,	%l0
	addc	%o3,	%l1,	%o5
	array32	%g1,	%i7,	%g5
	fmovdcc	%icc,	%f8,	%f18
	subcc	%l5,	0x1874,	%g6
	edge16	%i2,	%g2,	%i0
	stx	%l3,	[%l7 + 0x20]
	edge16n	%o6,	%i4,	%i3
	pdist	%f4,	%f28,	%f12
	fmovda	%xcc,	%f17,	%f18
	xnor	%l2,	0x0F19,	%o1
	andn	%g7,	%i5,	%i6
	sethi	0x1DCA,	%o0
	fmovrdne	%i1,	%f26,	%f20
	movgu	%xcc,	%l4,	%g3
	sub	%l6,	0x16C8,	%o7
	xor	%o4,	%o2,	%l0
	ldsh	[%l7 + 0x26],	%g4
	xorcc	%l1,	%o5,	%g1
	sll	%i7,	%g5,	%o3
	fmovdleu	%icc,	%f19,	%f2
	or	%l5,	0x1240,	%g6
	srax	%i2,	%g2,	%l3
	movg	%xcc,	%o6,	%i0
	xnorcc	%i3,	0x00DD,	%l2
	fmovscs	%xcc,	%f21,	%f29
	movneg	%icc,	%i4,	%o1
	fpsub32s	%f12,	%f6,	%f13
	stw	%g7,	[%l7 + 0x68]
	edge32	%i5,	%o0,	%i1
	srax	%i6,	0x02,	%l4
	udiv	%l6,	0x0ECB,	%g3
	movpos	%icc,	%o7,	%o4
	mulx	%l0,	%o2,	%l1
	movgu	%icc,	%g4,	%o5
	udivcc	%i7,	0x0C8F,	%g5
	movge	%xcc,	%o3,	%g1
	alignaddrl	%l5,	%g6,	%g2
	orcc	%l3,	%o6,	%i0
	mova	%xcc,	%i2,	%l2
	ldub	[%l7 + 0x38],	%i3
	edge32n	%o1,	%i4,	%i5
	fxors	%f31,	%f3,	%f22
	mova	%icc,	%g7,	%o0
	movge	%icc,	%i6,	%l4
	sllx	%l6,	%g3,	%i1
	movrgz	%o7,	0x1D3,	%l0
	fmovdcs	%icc,	%f24,	%f8
	or	%o4,	0x0406,	%l1
	sdivcc	%g4,	0x0546,	%o5
	fpadd16s	%f31,	%f14,	%f31
	subcc	%o2,	%g5,	%o3
	fandnot2	%f28,	%f24,	%f30
	movg	%xcc,	%g1,	%i7
	movrlez	%g6,	%l5,	%g2
	movge	%icc,	%l3,	%i0
	fsrc1	%f28,	%f0
	add	%i2,	0x1BBC,	%o6
	fmovse	%icc,	%f17,	%f27
	addccc	%l2,	%i3,	%i4
	array8	%i5,	%g7,	%o1
	stb	%o0,	[%l7 + 0x2B]
	movn	%icc,	%i6,	%l6
	smul	%g3,	0x0F97,	%i1
	umul	%o7,	%l4,	%o4
	movle	%xcc,	%l1,	%g4
	movneg	%xcc,	%o5,	%o2
	move	%xcc,	%g5,	%l0
	edge32	%g1,	%o3,	%i7
	xor	%g6,	0x1C71,	%g2
	fpmerge	%f25,	%f1,	%f6
	fands	%f10,	%f7,	%f21
	fmovdpos	%icc,	%f11,	%f31
	fpadd16s	%f6,	%f5,	%f13
	fmovrslez	%l3,	%f13,	%f23
	fand	%f24,	%f10,	%f0
	and	%l5,	0x1049,	%i0
	edge8l	%i2,	%o6,	%l2
	subcc	%i4,	%i5,	%g7
	sll	%o1,	%o0,	%i6
	movg	%xcc,	%i3,	%g3
	fmovdn	%icc,	%f16,	%f2
	sdivx	%l6,	0x08B8,	%i1
	stb	%l4,	[%l7 + 0x7C]
	fpsub32s	%f11,	%f15,	%f0
	srlx	%o4,	%l1,	%g4
	fcmpeq16	%f26,	%f16,	%o7
	mulscc	%o5,	%g5,	%o2
	movre	%g1,	%l0,	%i7
	movneg	%icc,	%o3,	%g6
	fmul8ulx16	%f22,	%f16,	%f0
	mova	%xcc,	%l3,	%l5
	ld	[%l7 + 0x78],	%f25
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	fcmpgt32	%f10,	%f18,	%o6
	and	%i4,	0x1100,	%l2
	alignaddrl	%i5,	%o1,	%o0
	ldx	[%l7 + 0x68],	%g7
	fmovdvc	%icc,	%f20,	%f0
	fmovsl	%xcc,	%f0,	%f27
	fmuld8sux16	%f24,	%f9,	%f10
	fmovdcs	%icc,	%f23,	%f12
	fsrc1	%f0,	%f0
	xorcc	%i3,	%g3,	%i6
	and	%l6,	%i1,	%o4
	edge16n	%l1,	%l4,	%g4
	fmovsle	%xcc,	%f25,	%f2
	edge32	%o7,	%o5,	%o2
	restore %g1, 0x0513, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g5,	0x0E1A,	%o3
	fpsub16	%f28,	%f28,	%f20
	addcc	%g6,	%l3,	%l5
	fnor	%f14,	%f24,	%f24
	addc	%i7,	%i0,	%i2
	edge16l	%g2,	%o6,	%i4
	array32	%l2,	%i5,	%o0
	std	%f0,	[%l7 + 0x38]
	movleu	%icc,	%g7,	%o1
	movle	%xcc,	%i3,	%i6
	smulcc	%g3,	%i1,	%l6
	edge32n	%l1,	%o4,	%l4
	fmovrdlez	%o7,	%f18,	%f24
	subc	%g4,	0x186E,	%o2
	movvc	%icc,	%g1,	%o5
	mulx	%l0,	0x12C3,	%o3
	popc	0x0A62,	%g5
	smulcc	%g6,	0x0693,	%l3
	fmovrse	%l5,	%f20,	%f7
	fpsub16	%f6,	%f8,	%f24
	sdivx	%i0,	0x04C0,	%i2
	mova	%icc,	%g2,	%i7
	ld	[%l7 + 0x78],	%f9
	edge16n	%o6,	%l2,	%i4
	fnot1	%f8,	%f2
	edge32n	%i5,	%g7,	%o0
	orn	%o1,	%i6,	%g3
	smulcc	%i3,	0x03A5,	%l6
	edge32ln	%l1,	%o4,	%l4
	edge8ln	%i1,	%o7,	%o2
	udivx	%g4,	0x09C2,	%o5
	lduw	[%l7 + 0x6C],	%g1
	fmovsvc	%xcc,	%f18,	%f24
	fornot2s	%f6,	%f17,	%f18
	xnor	%o3,	0x04CF,	%l0
	edge32	%g6,	%l3,	%l5
	sdiv	%g5,	0x0E05,	%i0
	alignaddrl	%i2,	%g2,	%o6
	edge32n	%i7,	%l2,	%i4
	sub	%i5,	%g7,	%o1
	addccc	%o0,	%g3,	%i6
	movpos	%icc,	%i3,	%l1
	movrne	%o4,	0x1CF,	%l6
	edge32l	%i1,	%l4,	%o7
	fcmpeq16	%f16,	%f24,	%o2
	orncc	%o5,	0x17DB,	%g4
	sth	%g1,	[%l7 + 0x40]
	fmovrslez	%l0,	%f14,	%f12
	movn	%xcc,	%g6,	%l3
	add	%l5,	0x19E3,	%o3
	and	%i0,	%i2,	%g2
	fmovrdgez	%g5,	%f0,	%f0
	fxors	%f9,	%f1,	%f9
	ldd	[%l7 + 0x60],	%o6
	alignaddrl	%l2,	%i4,	%i7
	edge8	%i5,	%o1,	%g7
	udiv	%o0,	0x0F33,	%g3
	stx	%i3,	[%l7 + 0x08]
	alignaddrl	%i6,	%o4,	%l1
	lduh	[%l7 + 0x4E],	%l6
	movg	%icc,	%i1,	%l4
	mulscc	%o7,	%o5,	%o2
	fmovrslez	%g4,	%f11,	%f29
	st	%f18,	[%l7 + 0x14]
	umulcc	%g1,	%g6,	%l0
	nop
	set	0x1A, %g3
	ldsb	[%l7 + %g3],	%l3
	mulscc	%o3,	%i0,	%l5
	srax	%g2,	%i2,	%g5
	movge	%xcc,	%l2,	%o6
	fcmpd	%fcc2,	%f16,	%f0
	movneg	%xcc,	%i7,	%i4
	sethi	0x0811,	%i5
	umul	%g7,	0x011D,	%o1
	mulscc	%g3,	%o0,	%i3
	ldsh	[%l7 + 0x42],	%i6
	movleu	%icc,	%o4,	%l1
	st	%f12,	[%l7 + 0x20]
	udivcc	%l6,	0x0004,	%i1
	sll	%o7,	%l4,	%o5
	movre	%g4,	%o2,	%g6
	edge16l	%l0,	%l3,	%g1
	sethi	0x0AC8,	%o3
	udivx	%l5,	0x0347,	%g2
	xnorcc	%i2,	%g5,	%i0
	smul	%l2,	%i7,	%o6
	edge16l	%i5,	%i4,	%g7
	popc	0x009C,	%g3
	addccc	%o0,	%i3,	%o1
	xor	%i6,	%l1,	%o4
	xor	%l6,	0x1319,	%o7
	add	%i1,	0x063C,	%o5
	or	%g4,	%l4,	%g6
	ldsb	[%l7 + 0x2A],	%l0
	fpackfix	%f4,	%f14
	fmovsne	%icc,	%f28,	%f1
	move	%xcc,	%o2,	%g1
	pdist	%f20,	%f16,	%f12
	movre	%l3,	%o3,	%l5
	sethi	0x0B96,	%g2
	sllx	%i2,	0x1E,	%i0
	sll	%g5,	0x04,	%l2
	sdivcc	%i7,	0x0494,	%i5
	andn	%o6,	0x0A9E,	%g7
	lduh	[%l7 + 0x24],	%g3
	edge8l	%i4,	%i3,	%o1
	sdivcc	%o0,	0x0C43,	%l1
	edge32	%o4,	%i6,	%l6
	srax	%i1,	0x05,	%o7
	srl	%o5,	%l4,	%g4
	fandnot1s	%f23,	%f30,	%f27
	move	%icc,	%l0,	%g6
	ldx	[%l7 + 0x08],	%g1
	sth	%l3,	[%l7 + 0x0A]
	movcs	%xcc,	%o3,	%l5
	andn	%g2,	0x03DC,	%o2
	sll	%i2,	%g5,	%l2
	edge16	%i7,	%i0,	%o6
	addcc	%g7,	%i5,	%i4
	sll	%i3,	0x01,	%g3
	edge8l	%o1,	%o0,	%o4
	srl	%l1,	%l6,	%i6
	ldd	[%l7 + 0x28],	%o6
	fmul8ulx16	%f30,	%f28,	%f4
	move	%icc,	%i1,	%l4
	bshuffle	%f30,	%f30,	%f18
	udivx	%g4,	0x0543,	%o5
	sllx	%g6,	%l0,	%g1
	or	%o3,	%l3,	%l5
	smul	%g2,	0x1AFA,	%i2
	smul	%g5,	0x1C01,	%o2
	subccc	%i7,	0x063B,	%i0
	edge32n	%o6,	%l2,	%i5
	fpack32	%f8,	%f0,	%f18
	mova	%icc,	%i4,	%g7
	andcc	%g3,	0x0215,	%o1
	xnorcc	%o0,	%i3,	%o4
	subcc	%l1,	0x1EF6,	%l6
	fcmpne32	%f4,	%f12,	%i6
	edge32n	%i1,	%l4,	%o7
	smulcc	%o5,	%g6,	%l0
	fcmpgt16	%f10,	%f12,	%g1
	movrlz	%o3,	%l3,	%g4
	fmovdg	%xcc,	%f9,	%f13
	orcc	%l5,	0x1A27,	%g2
	sllx	%g5,	%o2,	%i7
	and	%i2,	0x18A7,	%o6
	fpack16	%f10,	%f13
	fmul8x16al	%f27,	%f12,	%f0
	stx	%l2,	[%l7 + 0x30]
	save %i5, 0x12BD, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i0,	%g7,	%o1
	mova	%xcc,	%o0,	%i3
	movleu	%xcc,	%g3,	%o4
	movle	%xcc,	%l1,	%l6
	orn	%i6,	%l4,	%i1
	fxnors	%f3,	%f30,	%f12
	fmovsvc	%icc,	%f30,	%f21
	edge8l	%o7,	%g6,	%o5
	lduw	[%l7 + 0x7C],	%l0
	sir	0x1AA0
	umulcc	%o3,	%l3,	%g4
	fcmpgt32	%f30,	%f14,	%l5
	sir	0x09C3
	movge	%icc,	%g2,	%g5
	addccc	%g1,	%i7,	%i2
	lduw	[%l7 + 0x2C],	%o2
	fandnot1	%f2,	%f8,	%f0
	or	%l2,	%o6,	%i4
	fmovs	%f10,	%f29
	fmovdpos	%icc,	%f22,	%f13
	sethi	0x11DF,	%i5
	ldd	[%l7 + 0x28],	%i0
	fxnor	%f6,	%f28,	%f8
	udivcc	%g7,	0x0497,	%o1
	alignaddrl	%i3,	%o0,	%g3
	edge32l	%o4,	%l1,	%l6
	udiv	%i6,	0x1E7C,	%i1
	fmovrse	%l4,	%f7,	%f26
	and	%g6,	0x0C6E,	%o7
	st	%f6,	[%l7 + 0x58]
	edge32l	%o5,	%l0,	%l3
	addcc	%o3,	0x1EC2,	%g4
	fmovrsgez	%l5,	%f19,	%f26
	fnegs	%f11,	%f0
	xor	%g5,	0x0521,	%g1
	fcmpeq16	%f28,	%f10,	%i7
	fand	%f4,	%f30,	%f10
	fcmpne32	%f6,	%f10,	%i2
	stx	%o2,	[%l7 + 0x50]
	fand	%f28,	%f26,	%f20
	movvs	%xcc,	%g2,	%l2
	fcmpd	%fcc3,	%f2,	%f16
	sra	%o6,	%i4,	%i0
	movcc	%xcc,	%g7,	%o1
	movcc	%xcc,	%i5,	%o0
	ldd	[%l7 + 0x08],	%i2
	st	%f0,	[%l7 + 0x30]
	xor	%o4,	%l1,	%l6
	subc	%i6,	0x067A,	%g3
	ldsw	[%l7 + 0x14],	%i1
	movrne	%l4,	0x3DE,	%o7
	srlx	%o5,	0x1C,	%g6
	addc	%l3,	%l0,	%o3
	srlx	%l5,	%g4,	%g1
	fpadd32	%f28,	%f24,	%f24
	fpsub16	%f16,	%f16,	%f20
	and	%g5,	%i7,	%i2
	mulscc	%g2,	0x17FA,	%o2
	sra	%o6,	%i4,	%i0
	edge8l	%l2,	%o1,	%g7
	fnor	%f20,	%f6,	%f6
	fmovsgu	%xcc,	%f31,	%f17
	sub	%i5,	%o0,	%o4
	sdivx	%i3,	0x036F,	%l1
	fpsub16s	%f16,	%f26,	%f3
	edge8n	%i6,	%l6,	%g3
	addccc	%i1,	%l4,	%o7
	or	%o5,	0x119D,	%g6
	xnorcc	%l0,	%o3,	%l3
	udivx	%g4,	0x1AFB,	%g1
	edge8n	%l5,	%g5,	%i2
	andn	%i7,	0x1F7A,	%g2
	udiv	%o6,	0x102B,	%o2
	edge8	%i0,	%l2,	%o1
	fxnor	%f22,	%f12,	%f28
	fmul8x16	%f8,	%f4,	%f8
	sub	%i4,	%i5,	%o0
	sdivcc	%g7,	0x0B13,	%i3
	fxnor	%f4,	%f18,	%f14
	subc	%o4,	%l1,	%l6
	fmul8sux16	%f18,	%f12,	%f14
	movpos	%icc,	%g3,	%i1
	srlx	%i6,	%o7,	%o5
	ldsh	[%l7 + 0x64],	%g6
	xnor	%l4,	%l0,	%l3
	array8	%g4,	%o3,	%g1
	stw	%g5,	[%l7 + 0x08]
	orn	%i2,	%i7,	%g2
	fmovrsgez	%l5,	%f20,	%f20
	lduh	[%l7 + 0x3E],	%o6
	movrne	%i0,	%l2,	%o2
	fmovsvc	%icc,	%f1,	%f20
	movvc	%xcc,	%o1,	%i5
	stw	%o0,	[%l7 + 0x24]
	movre	%g7,	0x28C,	%i3
	movg	%icc,	%i4,	%l1
	lduh	[%l7 + 0x3C],	%o4
	or	%g3,	0x0A36,	%l6
	smul	%i6,	%o7,	%o5
	movvs	%icc,	%i1,	%l4
	fsrc2s	%f26,	%f6
	movre	%g6,	%l0,	%l3
	std	%f16,	[%l7 + 0x78]
	xorcc	%g4,	%g1,	%o3
	save %i2, %i7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g5,	0x1F8D,	%o6
	stw	%l5,	[%l7 + 0x4C]
	add	%l2,	0x1345,	%o2
	subcc	%i0,	%o1,	%i5
	addc	%o0,	0x038E,	%i3
	mulx	%i4,	0x0B4D,	%l1
	fmovdle	%icc,	%f16,	%f29
	movre	%g7,	%g3,	%l6
	umul	%i6,	0x0E85,	%o4
	alignaddrl	%o7,	%o5,	%l4
	lduh	[%l7 + 0x68],	%g6
	edge32ln	%i1,	%l0,	%l3
	srlx	%g1,	%g4,	%i2
	fpack16	%f2,	%f17
	array8	%o3,	%g2,	%i7
	sra	%g5,	0x10,	%l5
	sir	0x1663
	fpsub16s	%f26,	%f20,	%f16
	movvs	%icc,	%l2,	%o6
	fmul8x16	%f30,	%f10,	%f24
	nop
	set	0x64, %l4
	ldsh	[%l7 + %l4],	%i0
	andcc	%o2,	0x0CC2,	%o1
	fmul8sux16	%f20,	%f10,	%f0
	edge8n	%i5,	%o0,	%i3
	pdist	%f14,	%f26,	%f12
	fpadd16	%f24,	%f26,	%f16
	andn	%i4,	0x05EB,	%g7
	movre	%g3,	%l6,	%i6
	movre	%o4,	%l1,	%o7
	fxnor	%f8,	%f10,	%f2
	sethi	0x07BC,	%l4
	and	%g6,	0x0E0C,	%i1
	fmovdn	%xcc,	%f29,	%f20
	edge16ln	%o5,	%l0,	%l3
	move	%icc,	%g4,	%g1
	ldx	[%l7 + 0x58],	%o3
	edge16l	%g2,	%i2,	%i7
	umul	%g5,	%l5,	%l2
	sir	0x11EF
	ldd	[%l7 + 0x40],	%f26
	movrgz	%o6,	%o2,	%o1
	mova	%xcc,	%i5,	%i0
	std	%f10,	[%l7 + 0x20]
	fmovrdne	%i3,	%f12,	%f26
	movne	%xcc,	%i4,	%o0
	lduw	[%l7 + 0x60],	%g3
	fxnors	%f14,	%f14,	%f25
	movpos	%icc,	%g7,	%i6
	andncc	%o4,	%l1,	%l6
	movrne	%l4,	%g6,	%i1
	move	%icc,	%o7,	%o5
	alignaddr	%l0,	%l3,	%g1
	edge8n	%o3,	%g2,	%i2
	movneg	%icc,	%i7,	%g4
	fmovdge	%icc,	%f21,	%f8
	ldsw	[%l7 + 0x40],	%g5
	alignaddr	%l5,	%l2,	%o6
	popc	%o2,	%o1
	movrgez	%i5,	%i3,	%i0
	ldsw	[%l7 + 0x0C],	%i4
	andncc	%o0,	%g7,	%i6
	ldd	[%l7 + 0x20],	%o4
	edge16n	%g3,	%l1,	%l6
	sllx	%g6,	0x1A,	%l4
	srlx	%i1,	%o5,	%o7
	movl	%icc,	%l3,	%l0
	fabss	%f19,	%f0
	fcmpgt16	%f2,	%f10,	%g1
	addcc	%o3,	0x110D,	%g2
	edge8n	%i2,	%g4,	%g5
	edge16ln	%l5,	%l2,	%o6
	movre	%o2,	0x14C,	%o1
	edge16l	%i5,	%i7,	%i0
	pdist	%f8,	%f26,	%f22
	fmovrdgez	%i4,	%f14,	%f24
	fcmpd	%fcc2,	%f0,	%f26
	fmul8sux16	%f12,	%f2,	%f28
	movcs	%xcc,	%o0,	%i3
	movg	%icc,	%g7,	%o4
	edge16	%i6,	%g3,	%l1
	sll	%g6,	0x1B,	%l6
	fcmpeq16	%f20,	%f26,	%i1
	mulscc	%l4,	0x0A4C,	%o7
	edge8ln	%l3,	%l0,	%o5
	edge16l	%g1,	%o3,	%g2
	xnor	%i2,	0x0B71,	%g4
	subcc	%g5,	%l2,	%o6
	fandnot2	%f18,	%f2,	%f18
	sdivx	%l5,	0x0D66,	%o1
	movneg	%icc,	%i5,	%o2
	sra	%i0,	%i4,	%i7
	addc	%o0,	%g7,	%o4
	sir	0x11DA
	ldsw	[%l7 + 0x0C],	%i3
	sethi	0x180B,	%g3
	srl	%l1,	%i6,	%l6
	edge16l	%i1,	%g6,	%o7
	andcc	%l4,	0x1743,	%l0
	srlx	%l3,	%g1,	%o5
	fmul8ulx16	%f4,	%f12,	%f14
	std	%f22,	[%l7 + 0x08]
	udivx	%o3,	0x0854,	%g2
	movre	%i2,	0x2CB,	%g4
	movrlz	%l2,	%o6,	%g5
	fmovsg	%xcc,	%f8,	%f0
	movrlz	%o1,	%l5,	%i5
	mova	%xcc,	%i0,	%i4
	ldd	[%l7 + 0x58],	%f8
	udivcc	%o2,	0x0AA2,	%o0
	movcc	%xcc,	%g7,	%o4
	stw	%i7,	[%l7 + 0x54]
	xnor	%g3,	%i3,	%i6
	movge	%xcc,	%l6,	%l1
	xor	%g6,	0x16B3,	%o7
	ldsh	[%l7 + 0x66],	%i1
	movcc	%icc,	%l4,	%l3
	movn	%xcc,	%g1,	%o5
	orncc	%l0,	%o3,	%i2
	smulcc	%g2,	0x0A02,	%l2
	fsrc2s	%f24,	%f13
	xnor	%g4,	%g5,	%o1
	ld	[%l7 + 0x20],	%f17
	fmovdneg	%xcc,	%f12,	%f2
	ldsh	[%l7 + 0x0C],	%l5
	ldsh	[%l7 + 0x26],	%i5
	fxors	%f9,	%f16,	%f20
	fandnot2	%f18,	%f28,	%f12
	movne	%icc,	%i0,	%i4
	edge32	%o2,	%o6,	%g7
	ldd	[%l7 + 0x18],	%o4
	udiv	%o0,	0x1E11,	%i7
	movre	%i3,	0x1A8,	%g3
	xnor	%l6,	0x0A1F,	%i6
	mulx	%l1,	0x06FC,	%o7
	fcmpeq16	%f28,	%f18,	%g6
	ldsb	[%l7 + 0x39],	%i1
	alignaddr	%l3,	%g1,	%l4
	subc	%o5,	0x036D,	%l0
	alignaddr	%o3,	%g2,	%l2
	fones	%f17
	array32	%g4,	%i2,	%g5
	fmovdg	%icc,	%f11,	%f9
	umulcc	%o1,	0x1C26,	%l5
	stb	%i0,	[%l7 + 0x59]
	ldsb	[%l7 + 0x6B],	%i5
	addc	%i4,	0x1E6E,	%o2
	xor	%g7,	%o6,	%o4
	fpsub32s	%f24,	%f4,	%f5
	fornot1	%f28,	%f6,	%f14
	mulx	%o0,	0x09FA,	%i3
	fandnot1	%f18,	%f8,	%f14
	fpsub16	%f0,	%f20,	%f16
	ldx	[%l7 + 0x78],	%i7
	umul	%g3,	0x1E23,	%l6
	subc	%l1,	0x0016,	%o7
	movrlez	%i6,	%g6,	%l3
	sub	%g1,	%l4,	%i1
	pdist	%f26,	%f22,	%f22
	subccc	%l0,	0x01D8,	%o3
	srlx	%o5,	%g2,	%l2
	fcmpeq16	%f22,	%f26,	%g4
	edge32	%i2,	%g5,	%o1
	sir	0x1A41
	fpack16	%f10,	%f3
	ldx	[%l7 + 0x58],	%l5
	edge16ln	%i0,	%i5,	%i4
	movcs	%xcc,	%o2,	%g7
	mulx	%o4,	%o0,	%i3
	udivcc	%o6,	0x0422,	%g3
	edge8	%l6,	%i7,	%l1
	std	%f6,	[%l7 + 0x48]
	movrlez	%i6,	%g6,	%l3
	and	%o7,	%g1,	%i1
	edge8ln	%l0,	%l4,	%o5
	array32	%g2,	%l2,	%o3
	stb	%i2,	[%l7 + 0x2B]
	stb	%g5,	[%l7 + 0x7B]
	movrne	%o1,	%g4,	%l5
	fmovsvs	%xcc,	%f22,	%f22
	movcc	%icc,	%i5,	%i0
	umul	%o2,	%i4,	%o4
	ldd	[%l7 + 0x78],	%f2
	lduw	[%l7 + 0x64],	%g7
	sdivcc	%o0,	0x1C04,	%i3
	fmovsg	%icc,	%f10,	%f18
	ldsh	[%l7 + 0x56],	%o6
	sllx	%g3,	0x0C,	%l6
	movgu	%icc,	%l1,	%i7
	fornot2	%f26,	%f30,	%f26
	ldsw	[%l7 + 0x18],	%g6
	edge8ln	%l3,	%i6,	%o7
	add	%g1,	0x005E,	%l0
	fandnot1	%f26,	%f30,	%f10
	ldd	[%l7 + 0x20],	%l4
	fpsub16s	%f10,	%f7,	%f30
	edge16n	%i1,	%g2,	%l2
	sllx	%o5,	%o3,	%i2
	fmovsg	%icc,	%f15,	%f17
	movcs	%icc,	%g5,	%o1
	udiv	%l5,	0x0E7F,	%g4
	fnand	%f20,	%f30,	%f28
	fmovdleu	%xcc,	%f16,	%f23
	xnor	%i0,	%i5,	%o2
	edge32ln	%o4,	%g7,	%o0
	alignaddrl	%i3,	%o6,	%g3
	sllx	%l6,	0x1B,	%l1
	or	%i7,	%g6,	%l3
	fors	%f6,	%f11,	%f8
	orn	%i6,	%o7,	%i4
	sra	%g1,	0x18,	%l0
	fornot1	%f28,	%f8,	%f16
	fmovrsgez	%l4,	%f8,	%f0
	fcmpd	%fcc3,	%f22,	%f8
	fornot1s	%f11,	%f25,	%f0
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	fmovsvc	%icc,	%f4,	%f17
	stw	%o5,	[%l7 + 0x0C]
	fcmpgt32	%f6,	%f0,	%o3
	fmovrdlez	%i2,	%f12,	%f4
	sub	%g5,	%o1,	%l5
	array32	%l2,	%g4,	%i5
	fmovrdlez	%o2,	%f6,	%f8
	nop
	set	0x50, %o3
	ldx	[%l7 + %o3],	%o4
	andncc	%i0,	%o0,	%g7
	mova	%icc,	%i3,	%o6
	xorcc	%l6,	0x0611,	%g3
	array32	%l1,	%g6,	%l3
	edge32n	%i7,	%o7,	%i6
	edge16ln	%i4,	%g1,	%l4
	fornot2	%f12,	%f10,	%f26
	movneg	%icc,	%i1,	%g2
	andncc	%l0,	%o5,	%i2
	fmovrsgez	%g5,	%f14,	%f17
	fors	%f7,	%f27,	%f12
	ldsw	[%l7 + 0x20],	%o3
	edge16	%l5,	%o1,	%g4
	movrgz	%l2,	%o2,	%o4
	movcc	%xcc,	%i5,	%o0
	fmovsleu	%xcc,	%f3,	%f4
	array32	%g7,	%i0,	%i3
	ldub	[%l7 + 0x6A],	%o6
	move	%xcc,	%g3,	%l1
	std	%f0,	[%l7 + 0x40]
	sdivx	%l6,	0x033D,	%l3
	udivx	%g6,	0x1158,	%i7
	movle	%icc,	%i6,	%i4
	smulcc	%o7,	%g1,	%l4
	st	%f2,	[%l7 + 0x4C]
	fmovdge	%xcc,	%f25,	%f22
	movrlez	%g2,	0x1AD,	%l0
	edge8	%i1,	%i2,	%g5
	subcc	%o3,	%o5,	%l5
	andn	%o1,	%g4,	%o2
	xnor	%l2,	%o4,	%o0
	array16	%i5,	%i0,	%i3
	orcc	%o6,	0x0496,	%g7
	sdivcc	%l1,	0x01DF,	%l6
	fmovdgu	%xcc,	%f12,	%f12
	fcmpeq16	%f26,	%f20,	%l3
	fmovdgu	%xcc,	%f20,	%f17
	sub	%g3,	0x1CEF,	%i7
	movrgez	%i6,	%i4,	%g6
	siam	0x4
	fmovrde	%o7,	%f30,	%f18
	fmovse	%icc,	%f20,	%f15
	alignaddrl	%l4,	%g1,	%g2
	movrgez	%i1,	%l0,	%g5
	movrlz	%o3,	%o5,	%l5
	edge16n	%o1,	%g4,	%o2
	edge32	%l2,	%i2,	%o4
	alignaddrl	%o0,	%i5,	%i0
	ldub	[%l7 + 0x23],	%i3
	sdivx	%o6,	0x08EB,	%l1
	ldd	[%l7 + 0x68],	%i6
	movl	%xcc,	%l3,	%g3
	mova	%icc,	%g7,	%i6
	srl	%i4,	%i7,	%g6
	ld	[%l7 + 0x18],	%f20
	addcc	%o7,	0x0670,	%g1
	fexpand	%f29,	%f12
	lduw	[%l7 + 0x5C],	%g2
	bshuffle	%f16,	%f10,	%f20
	fpmerge	%f10,	%f3,	%f14
	ldsb	[%l7 + 0x22],	%l4
	subccc	%i1,	%l0,	%g5
	edge8n	%o3,	%o5,	%o1
	fmovdleu	%xcc,	%f0,	%f3
	fnot1	%f20,	%f30
	alignaddrl	%g4,	%o2,	%l5
	orn	%i2,	%o4,	%l2
	movgu	%xcc,	%o0,	%i0
	fone	%f6
	smulcc	%i5,	%i3,	%l1
	lduw	[%l7 + 0x08],	%o6
	stb	%l6,	[%l7 + 0x2A]
	umul	%g3,	0x1985,	%g7
	fxor	%f30,	%f26,	%f6
	ldd	[%l7 + 0x18],	%f18
	pdist	%f30,	%f18,	%f18
	ldd	[%l7 + 0x68],	%f10
	xor	%l3,	0x00EA,	%i6
	fnegs	%f27,	%f12
	edge32ln	%i4,	%g6,	%i7
	orncc	%o7,	0x0D61,	%g2
	addccc	%g1,	%l4,	%i1
	subc	%l0,	%g5,	%o3
	fors	%f28,	%f8,	%f10
	fnands	%f10,	%f16,	%f10
	subc	%o5,	%o1,	%o2
	stw	%g4,	[%l7 + 0x64]
	ldsh	[%l7 + 0x5C],	%i2
	lduh	[%l7 + 0x72],	%o4
	udivx	%l5,	0x1123,	%o0
	or	%i0,	0x144E,	%i5
	sllx	%l2,	%l1,	%i3
	move	%icc,	%l6,	%g3
	movcc	%xcc,	%g7,	%o6
	movrgez	%i6,	0x151,	%i4
	movre	%l3,	%g6,	%i7
	movre	%g2,	%o7,	%l4
	fmovsa	%xcc,	%f12,	%f14
	fnegd	%f0,	%f6
	movn	%icc,	%g1,	%l0
	movvs	%xcc,	%g5,	%o3
	subccc	%o5,	%o1,	%i1
	ldub	[%l7 + 0x49],	%o2
	fmovdl	%icc,	%f8,	%f13
	udivx	%i2,	0x13EB,	%o4
	nop
	set	0x20, %o1
	ldsw	[%l7 + %o1],	%g4
	edge16	%o0,	%l5,	%i0
	addcc	%l2,	0x0707,	%l1
	movre	%i5,	%i3,	%l6
	fmovsl	%xcc,	%f8,	%f14
	movleu	%xcc,	%g7,	%o6
	fabss	%f20,	%f25
	move	%icc,	%g3,	%i4
	movge	%xcc,	%l3,	%i6
	movcs	%icc,	%g6,	%g2
	movcc	%xcc,	%o7,	%l4
	smulcc	%g1,	%i7,	%g5
	fmovsn	%xcc,	%f15,	%f25
	movre	%o3,	%l0,	%o1
	fmovrslz	%o5,	%f15,	%f25
	smulcc	%o2,	0x16BB,	%i2
	andcc	%i1,	0x021F,	%g4
	udivx	%o4,	0x143B,	%l5
	srax	%o0,	%i0,	%l2
	mova	%xcc,	%l1,	%i3
	movcs	%icc,	%i5,	%g7
	stw	%l6,	[%l7 + 0x50]
	sllx	%g3,	%i4,	%l3
	andcc	%i6,	0x0715,	%o6
	fandnot1	%f28,	%f28,	%f0
	edge8	%g2,	%o7,	%g6
	sll	%l4,	%i7,	%g1
	andn	%o3,	0x05CB,	%l0
	sll	%g5,	%o1,	%o2
	ldd	[%l7 + 0x60],	%o4
	udiv	%i2,	0x1DCC,	%g4
	fmovs	%f6,	%f23
	fpsub32s	%f29,	%f7,	%f18
	andcc	%i1,	%l5,	%o0
	orn	%o4,	%l2,	%l1
	addcc	%i3,	0x1E6F,	%i5
	movvs	%icc,	%i0,	%g7
	addc	%l6,	0x18B6,	%i4
	movl	%xcc,	%l3,	%i6
	edge16ln	%o6,	%g2,	%g3
	edge32n	%o7,	%g6,	%i7
	st	%f10,	[%l7 + 0x4C]
	st	%f22,	[%l7 + 0x48]
	fmovs	%f21,	%f15
	movgu	%icc,	%l4,	%g1
	ldd	[%l7 + 0x38],	%l0
	movg	%icc,	%g5,	%o1
	ldx	[%l7 + 0x20],	%o2
	movre	%o5,	0x370,	%o3
	ldx	[%l7 + 0x60],	%i2
	or	%g4,	0x05CE,	%l5
	fmovsl	%icc,	%f22,	%f26
	mulx	%i1,	0x077B,	%o0
	movleu	%icc,	%o4,	%l2
	edge32ln	%l1,	%i5,	%i3
	fnegd	%f0,	%f18
	edge32ln	%g7,	%l6,	%i4
	fornot2s	%f2,	%f27,	%f6
	fmovdn	%icc,	%f23,	%f27
	movrgz	%i0,	%l3,	%i6
	fnegs	%f7,	%f12
	fcmpeq16	%f10,	%f20,	%g2
	move	%icc,	%g3,	%o6
	fmovsl	%xcc,	%f12,	%f7
	edge16l	%o7,	%g6,	%l4
	addcc	%i7,	0x0D38,	%g1
	sra	%l0,	%o1,	%g5
	edge16ln	%o2,	%o3,	%i2
	fmovsgu	%xcc,	%f22,	%f13
	edge32n	%o5,	%l5,	%g4
	fmovrsgez	%o0,	%f27,	%f5
	stw	%i1,	[%l7 + 0x0C]
	orn	%l2,	%o4,	%i5
	fnands	%f3,	%f14,	%f15
	fsrc2	%f14,	%f6
	sll	%i3,	0x03,	%l1
	movne	%xcc,	%l6,	%i4
	edge8n	%i0,	%l3,	%g7
	stb	%g2,	[%l7 + 0x0C]
	lduh	[%l7 + 0x08],	%i6
	fands	%f4,	%f13,	%f19
	fmul8sux16	%f22,	%f8,	%f28
	ld	[%l7 + 0x20],	%f10
	subc	%o6,	%g3,	%g6
	movre	%o7,	0x2CF,	%i7
	edge32n	%l4,	%l0,	%o1
	orn	%g1,	%o2,	%o3
	ld	[%l7 + 0x48],	%f17
	edge8n	%g5,	%o5,	%l5
	subcc	%i2,	0x1116,	%g4
	sdivcc	%o0,	0x0671,	%i1
	fzero	%f10
	array8	%l2,	%i5,	%i3
	popc	%o4,	%l6
	fpsub16	%f28,	%f28,	%f4
	edge32l	%i4,	%l1,	%l3
	movrgz	%g7,	0x149,	%g2
	sdivx	%i6,	0x10BE,	%o6
	movg	%icc,	%i0,	%g3
	alignaddr	%o7,	%g6,	%i7
	edge8	%l4,	%l0,	%g1
	mova	%xcc,	%o2,	%o3
	movne	%icc,	%o1,	%g5
	subc	%l5,	%o5,	%g4
	alignaddr	%i2,	%o0,	%i1
	mulscc	%l2,	%i5,	%o4
	ldsb	[%l7 + 0x5E],	%l6
	faligndata	%f16,	%f2,	%f16
	array32	%i3,	%i4,	%l3
	mulscc	%l1,	0x0F0A,	%g2
	udivx	%g7,	0x11EF,	%i6
	or	%o6,	%i0,	%o7
	ldd	[%l7 + 0x08],	%g2
	fmovrdgez	%i7,	%f26,	%f8
	movvc	%icc,	%g6,	%l0
	edge8	%l4,	%o2,	%o3
	fcmpgt16	%f20,	%f2,	%g1
	edge8n	%g5,	%o1,	%o5
	sdiv	%g4,	0x06A3,	%l5
	array32	%i2,	%i1,	%l2
	fornot1s	%f2,	%f21,	%f14
	mulx	%i5,	0x0C66,	%o4
	array32	%o0,	%l6,	%i4
	edge32n	%i3,	%l1,	%g2
	movre	%l3,	0x3BF,	%i6
	umul	%g7,	%i0,	%o7
	edge16	%o6,	%i7,	%g3
	movle	%xcc,	%g6,	%l0
	ldsb	[%l7 + 0x25],	%o2
	st	%f1,	[%l7 + 0x70]
	ldub	[%l7 + 0x53],	%o3
	sdivx	%g1,	0x09CA,	%g5
	fmovsle	%xcc,	%f7,	%f7
	fnand	%f10,	%f30,	%f16
	subcc	%o1,	%l4,	%g4
	alignaddrl	%l5,	%i2,	%i1
	edge16n	%l2,	%o5,	%i5
	movvc	%xcc,	%o0,	%l6
	fpadd16s	%f11,	%f20,	%f24
	movn	%xcc,	%o4,	%i3
	xor	%l1,	%i4,	%l3
	fpackfix	%f26,	%f0
	popc	%i6,	%g2
	edge32n	%g7,	%i0,	%o7
	save %i7, %g3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l0,	0x10B0,	%o6
	edge16	%o3,	%o2,	%g5
	edge16l	%g1,	%o1,	%l4
	sdivcc	%g4,	0x0F7F,	%i2
	fmovdvc	%xcc,	%f23,	%f18
	fzero	%f22
	fmovdvc	%xcc,	%f30,	%f17
	fcmple32	%f24,	%f2,	%l5
	edge32n	%i1,	%l2,	%o5
	fmovsle	%icc,	%f17,	%f4
	ldsb	[%l7 + 0x2A],	%o0
	sir	0x0833
	ld	[%l7 + 0x3C],	%f20
	udivcc	%l6,	0x06B5,	%o4
	lduw	[%l7 + 0x58],	%i5
	andcc	%i3,	0x134E,	%l1
	movvc	%xcc,	%l3,	%i6
	ld	[%l7 + 0x74],	%f22
	fpsub32s	%f3,	%f13,	%f26
	fmovspos	%xcc,	%f10,	%f17
	bshuffle	%f30,	%f30,	%f18
	xorcc	%g2,	%g7,	%i0
	edge16n	%o7,	%i4,	%i7
	ldsw	[%l7 + 0x70],	%g3
	movl	%xcc,	%l0,	%g6
	ldx	[%l7 + 0x60],	%o6
	edge16ln	%o3,	%o2,	%g1
	edge16l	%g5,	%l4,	%o1
	ldsw	[%l7 + 0x40],	%g4
	andncc	%l5,	%i1,	%i2
	sra	%o5,	%o0,	%l6
	fmovsle	%xcc,	%f21,	%f11
	ldsw	[%l7 + 0x50],	%l2
	fmuld8ulx16	%f4,	%f13,	%f12
	addccc	%o4,	%i5,	%i3
	fexpand	%f25,	%f20
	ldd	[%l7 + 0x48],	%f16
	fpadd32	%f18,	%f26,	%f8
	array8	%l1,	%l3,	%g2
	fcmpeq16	%f18,	%f0,	%g7
	movl	%icc,	%i0,	%o7
	fand	%f22,	%f20,	%f6
	popc	%i6,	%i7
	andncc	%i4,	%g3,	%l0
	andcc	%g6,	%o3,	%o2
	movrgez	%g1,	%o6,	%l4
	fandnot1s	%f1,	%f4,	%f29
	move	%xcc,	%g5,	%o1
	fmul8x16al	%f30,	%f31,	%f12
	array32	%g4,	%i1,	%l5
	fzero	%f10
	edge16ln	%o5,	%i2,	%o0
	mulscc	%l2,	0x06B0,	%l6
	edge16ln	%o4,	%i5,	%l1
	lduw	[%l7 + 0x14],	%i3
	udivx	%l3,	0x0A8E,	%g7
	ldub	[%l7 + 0x32],	%g2
	std	%f30,	[%l7 + 0x48]
	subcc	%i0,	%i6,	%o7
	st	%f5,	[%l7 + 0x58]
	pdist	%f24,	%f6,	%f2
	array8	%i7,	%g3,	%i4
	edge16n	%l0,	%o3,	%o2
	umul	%g6,	0x0A3D,	%g1
	andncc	%l4,	%g5,	%o6
	umul	%o1,	0x12DD,	%i1
	movge	%xcc,	%l5,	%g4
	subc	%o5,	0x0779,	%i2
	ldx	[%l7 + 0x08],	%o0
	edge8ln	%l6,	%l2,	%i5
	edge32	%o4,	%i3,	%l3
	fpack16	%f28,	%f25
	st	%f4,	[%l7 + 0x50]
	fmovsgu	%icc,	%f19,	%f23
	fmovrdlz	%g7,	%f22,	%f12
	srax	%g2,	0x09,	%i0
	xnor	%i6,	%l1,	%i7
	edge8l	%g3,	%i4,	%o7
	movrlez	%l0,	0x3FB,	%o2
	edge8n	%o3,	%g1,	%g6
	fmovdpos	%icc,	%f12,	%f16
	srax	%g5,	0x19,	%l4
	array16	%o1,	%i1,	%o6
	stb	%l5,	[%l7 + 0x74]
	edge8n	%g4,	%i2,	%o0
	stw	%l6,	[%l7 + 0x20]
	fmovsa	%icc,	%f3,	%f21
	orncc	%o5,	0x1E17,	%l2
	addcc	%o4,	%i3,	%i5
	udivx	%l3,	0x076E,	%g7
	popc	%g2,	%i0
	movl	%icc,	%i6,	%l1
	movcs	%icc,	%g3,	%i4
	edge16ln	%o7,	%i7,	%l0
	fpackfix	%f30,	%f11
	fnot1	%f24,	%f10
	fmovdl	%xcc,	%f4,	%f16
	ldsh	[%l7 + 0x36],	%o3
	movrlz	%o2,	%g1,	%g5
	movre	%l4,	0x317,	%g6
	fmovrde	%i1,	%f4,	%f26
	andn	%o1,	%o6,	%g4
	movvc	%icc,	%l5,	%o0
	mulx	%l6,	0x07B0,	%i2
	sllx	%l2,	%o5,	%o4
	fpadd16	%f24,	%f26,	%f26
	edge16n	%i5,	%i3,	%l3
	edge8n	%g2,	%i0,	%g7
	sir	0x02B8
	fcmpgt32	%f12,	%f28,	%l1
	array16	%i6,	%g3,	%o7
	st	%f0,	[%l7 + 0x20]
	edge32	%i7,	%i4,	%o3
	mova	%xcc,	%l0,	%g1
	subcc	%g5,	%l4,	%o2
	smulcc	%i1,	0x082F,	%o1
	movle	%icc,	%o6,	%g4
	sdivx	%l5,	0x04F0,	%g6
	lduh	[%l7 + 0x16],	%o0
	movpos	%xcc,	%l6,	%i2
	umulcc	%l2,	0x1C70,	%o5
	fmovsvc	%icc,	%f27,	%f11
	fpsub16	%f24,	%f26,	%f16
	ldx	[%l7 + 0x48],	%o4
	movrlz	%i3,	%i5,	%g2
	fmovscc	%icc,	%f19,	%f0
	sll	%i0,	0x12,	%l3
	fornot1	%f18,	%f24,	%f16
	fmovdneg	%xcc,	%f9,	%f27
	fcmpne32	%f16,	%f16,	%l1
	udiv	%i6,	0x07BE,	%g7
	andn	%g3,	%i7,	%o7
	std	%f8,	[%l7 + 0x40]
	ldd	[%l7 + 0x20],	%f22
	lduw	[%l7 + 0x14],	%o3
	andcc	%i4,	%g1,	%g5
	movge	%xcc,	%l4,	%o2
	edge32ln	%i1,	%l0,	%o1
	andncc	%g4,	%o6,	%g6
	andn	%l5,	%l6,	%i2
	edge16n	%l2,	%o0,	%o5
	subc	%o4,	%i5,	%i3
	lduw	[%l7 + 0x60],	%i0
	stx	%l3,	[%l7 + 0x30]
	stx	%l1,	[%l7 + 0x30]
	sra	%i6,	0x1A,	%g7
	edge32n	%g2,	%i7,	%g3
	sub	%o3,	%o7,	%g1
	move	%icc,	%i4,	%g5
	fpsub16	%f10,	%f22,	%f8
	mulx	%o2,	%i1,	%l4
	ldd	[%l7 + 0x58],	%l0
	xorcc	%o1,	0x099A,	%g4
	array16	%o6,	%l5,	%g6
	stb	%i2,	[%l7 + 0x34]
	stb	%l2,	[%l7 + 0x0B]
	movre	%o0,	%o5,	%l6
	std	%f24,	[%l7 + 0x20]
	movcc	%xcc,	%o4,	%i3
	andcc	%i0,	0x0042,	%l3
	fmovrdgz	%i5,	%f10,	%f30
	addcc	%i6,	%l1,	%g7
	ldd	[%l7 + 0x08],	%f10
	sir	0x1298
	alignaddr	%i7,	%g3,	%g2
	movrne	%o7,	%o3,	%i4
	udiv	%g1,	0x1E55,	%o2
	fcmped	%fcc2,	%f18,	%f30
	addccc	%g5,	%l4,	%l0
	nop
	set	0x0B, %i4
	stb	%o1,	[%l7 + %i4]
	addccc	%i1,	0x0A55,	%o6
	subcc	%g4,	0x0C7C,	%g6
	movl	%xcc,	%l5,	%i2
	udivx	%o0,	0x06F3,	%o5
	nop
	set	0x32, %i7
	ldsb	[%l7 + %i7],	%l6
	save %o4, 0x137D, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%i0,	%i3
	movrgz	%l3,	%i5,	%i6
	lduh	[%l7 + 0x10],	%g7
	fnot1	%f8,	%f14
	fornot1	%f6,	%f10,	%f18
	ldsb	[%l7 + 0x77],	%i7
	movrlez	%l1,	%g3,	%g2
	addccc	%o3,	0x017F,	%i4
	edge32n	%g1,	%o7,	%o2
	ldd	[%l7 + 0x20],	%f16
	stb	%l4,	[%l7 + 0x37]
	mulx	%l0,	%o1,	%i1
	fmovdneg	%icc,	%f12,	%f27
	movne	%icc,	%g5,	%g4
	addc	%o6,	0x04BF,	%l5
	fmul8x16al	%f15,	%f23,	%f8
	stx	%g6,	[%l7 + 0x78]
	fandnot2	%f6,	%f20,	%f20
	fcmpgt16	%f20,	%f14,	%o0
	edge8l	%i2,	%o5,	%o4
	edge32ln	%l6,	%l2,	%i0
	lduh	[%l7 + 0x14],	%l3
	movrgez	%i3,	0x2B1,	%i6
	fandnot1s	%f6,	%f2,	%f20
	bshuffle	%f24,	%f8,	%f4
	bshuffle	%f18,	%f0,	%f12
	umul	%i5,	0x17D4,	%g7
	restore %i7, 0x01C3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f27,	%f28
	xorcc	%g2,	%l1,	%o3
	fzeros	%f17
	movre	%i4,	0x3D2,	%g1
	movrne	%o7,	0x30A,	%o2
	and	%l4,	0x1694,	%l0
	save %o1, 0x15FC, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f2,	%f31
	subc	%i1,	%g4,	%l5
	fornot2	%f0,	%f8,	%f22
	fmovsneg	%icc,	%f31,	%f27
	ldd	[%l7 + 0x10],	%g6
	edge16ln	%o6,	%i2,	%o0
	srl	%o5,	%o4,	%l6
	movne	%xcc,	%l2,	%l3
	xnorcc	%i3,	0x12F2,	%i6
	edge32ln	%i5,	%g7,	%i7
	mova	%icc,	%i0,	%g2
	ldd	[%l7 + 0x08],	%f28
	edge16n	%g3,	%o3,	%l1
	srlx	%g1,	%o7,	%i4
	movrne	%l4,	%l0,	%o1
	edge8l	%o2,	%g5,	%i1
	movvs	%xcc,	%l5,	%g4
	orcc	%g6,	%i2,	%o6
	srl	%o5,	%o0,	%o4
	edge16n	%l2,	%l6,	%l3
	array16	%i6,	%i3,	%i5
	orn	%g7,	0x0FE4,	%i7
	orncc	%g2,	0x0CF4,	%g3
	sir	0x16CF
	addc	%i0,	0x1955,	%l1
	fsrc2	%f0,	%f2
	umul	%g1,	%o3,	%i4
	mova	%xcc,	%l4,	%l0
	fxor	%f0,	%f30,	%f26
	sth	%o7,	[%l7 + 0x78]
	movleu	%icc,	%o2,	%o1
	fabsd	%f4,	%f22
	ldsw	[%l7 + 0x68],	%i1
	edge16ln	%l5,	%g4,	%g6
	and	%i2,	%g5,	%o6
	edge16ln	%o5,	%o4,	%l2
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	umulcc	%l3,	0x1F00,	%i3
	edge16	%i6,	%g7,	%i5
	fnands	%f10,	%f24,	%f16
	ldd	[%l7 + 0x58],	%f4
	edge8	%g2,	%i7,	%i0
	fpsub32	%f0,	%f18,	%f20
	fcmpeq32	%f8,	%f24,	%g3
	std	%f14,	[%l7 + 0x70]
	mulscc	%l1,	0x0B0E,	%g1
	movpos	%xcc,	%o3,	%i4
	udivcc	%l4,	0x195D,	%l0
	subccc	%o2,	%o1,	%i1
	movge	%icc,	%l5,	%o7
	movl	%icc,	%g6,	%g4
	movpos	%icc,	%g5,	%o6
	andncc	%i2,	%o5,	%l2
	fmovdl	%icc,	%f11,	%f28
	array16	%o4,	%l6,	%o0
	ldd	[%l7 + 0x70],	%f18
	and	%i3,	%i6,	%g7
	orcc	%i5,	0x1F99,	%g2
	movne	%xcc,	%l3,	%i7
	ldub	[%l7 + 0x09],	%i0
	fones	%f21
	movleu	%icc,	%g3,	%g1
	sdiv	%l1,	0x0FE1,	%o3
	movle	%icc,	%i4,	%l4
	andn	%l0,	0x1540,	%o1
	movne	%xcc,	%o2,	%i1
	restore %o7, %l5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f16,	%f24,	%f20
	andncc	%g5,	%o6,	%i2
	std	%f22,	[%l7 + 0x30]
	stw	%g4,	[%l7 + 0x74]
	edge16ln	%o5,	%l2,	%l6
	xnor	%o4,	0x1C85,	%o0
	fmovs	%f1,	%f7
	ldsb	[%l7 + 0x70],	%i6
	fnegs	%f8,	%f29
	movvc	%icc,	%g7,	%i5
	popc	%i3,	%l3
	edge16	%g2,	%i0,	%g3
	fnot1	%f6,	%f2
	orncc	%i7,	0x1C20,	%g1
	umul	%l1,	%o3,	%l4
	ldsh	[%l7 + 0x5E],	%l0
	array32	%o1,	%i4,	%i1
	udiv	%o2,	0x113A,	%o7
	movrlez	%l5,	0x176,	%g5
	ldsw	[%l7 + 0x40],	%g6
	fmovspos	%icc,	%f15,	%f4
	addccc	%i2,	0x113E,	%g4
	fors	%f11,	%f22,	%f11
	umul	%o5,	0x0A11,	%o6
	std	%f2,	[%l7 + 0x20]
	fmovdgu	%icc,	%f12,	%f2
	movg	%icc,	%l2,	%o4
	movneg	%icc,	%l6,	%i6
	mova	%xcc,	%o0,	%g7
	sll	%i3,	0x06,	%i5
	edge16l	%l3,	%g2,	%i0
	sdivx	%g3,	0x09F6,	%g1
	mulscc	%i7,	0x1082,	%l1
	stb	%l4,	[%l7 + 0x65]
	subc	%o3,	0x0FD1,	%o1
	fnot2s	%f3,	%f27
	smul	%i4,	%l0,	%i1
	xor	%o2,	0x0CAD,	%o7
	sra	%g5,	%l5,	%g6
	fmovsne	%icc,	%f30,	%f25
	movge	%xcc,	%g4,	%i2
	fnot1	%f2,	%f10
	fmul8x16	%f8,	%f28,	%f26
	udivx	%o5,	0x048E,	%o6
	movneg	%icc,	%o4,	%l6
	ldsb	[%l7 + 0x5F],	%i6
	ldub	[%l7 + 0x31],	%o0
	array16	%l2,	%i3,	%g7
	umul	%i5,	%l3,	%i0
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 433
!	Type f   	: 655
!	Type i   	: 1912
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x7E84CECE
.word 0xF2820374
.word 0xB51F9302
.word 0x208BDCEB
.word 0x1A72DE4E
.word 0x837F82FD
.word 0x40088A69
.word 0x7793A769
.word 0x8F69FF76
.word 0x1741D365
.word 0x6EB48F3C
.word 0xA2BE6028
.word 0xED0D915A
.word 0x349A7221
.word 0xA88E751E
.word 0x6F0333BD
.word 0xB70C6AF3
.word 0xAB92364B
.word 0x3B34E833
.word 0x53B2C0CB
.word 0x1D6028C5
.word 0xC072523E
.word 0x332A5EC2
.word 0xD1118B06
.word 0xC6F336F6
.word 0x694CF091
.word 0xDEE37F0C
.word 0x6B21E741
.word 0x595A143A
.word 0xC6789578
.word 0xF3AEC29C
.word 0x4DD223AF
.word 0x0318EB7B
.word 0x60E4C09E
.word 0x1BB5405D
.word 0x883CBBB9
.word 0xDE422122
.word 0x94EEACBC
.word 0x2A0C4A07
.word 0xBD11D719
.word 0xDE284494
.word 0x60766BAB
.word 0x74A1CB7C
.word 0xC723786D
.word 0x2526E45D
.word 0x26F6CE3B
.word 0xD15DB5AB
.word 0xFFD802EC
.word 0x8780F30C
.word 0xD8F7A9F6
.word 0x6A98FCCB
.word 0xEAF21E3E
.word 0xBE1C11F6
.word 0xD5C920AD
.word 0x552D5E4F
.word 0x1D609685
.word 0x67328BD6
.word 0x408DE334
.word 0x5E2DF80E
.word 0x54C85475
.word 0x9DBFD452
.word 0xE55A2E9D
.word 0x8657311E
.word 0x2FDAB567
.end
