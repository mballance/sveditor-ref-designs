/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f12.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f12.s,v 1.1 2007/05/11 17:22:36 drp Exp $"
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
	setx	0x1F08D6B8B0520A32,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x5,	%g1
	set	0xD,	%g2
	set	0xE,	%g3
	set	0x0,	%g4
	set	0x9,	%g5
	set	0xF,	%g6
	set	0x7,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x6,	%i1
	set	-0x1,	%i2
	set	-0xA,	%i3
	set	-0xA,	%i4
	set	-0x1,	%i5
	set	-0x0,	%i6
	set	-0x1,	%i7
	!# Local registers
	set	0x41838109,	%l0
	set	0x30151F2D,	%l1
	set	0x127FF5B0,	%l2
	set	0x25DAC354,	%l3
	set	0x4DAF2E43,	%l4
	set	0x1459EDF0,	%l5
	set	0x13E4AAE4,	%l6
	!# Output registers
	set	-0x1E14,	%o0
	set	0x1100,	%o1
	set	-0x0268,	%o2
	set	-0x05B8,	%o3
	set	-0x15EC,	%o4
	set	-0x136B,	%o5
	set	-0x18D9,	%o6
	set	0x1DE0,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x3890B7B1B7CE45EB)
	INIT_TH_FP_REG(%l7,%f2,0x3FA56701A157A1A9)
	INIT_TH_FP_REG(%l7,%f4,0xD2A0860DE11E5D69)
	INIT_TH_FP_REG(%l7,%f6,0x1F8151AAE515AE84)
	INIT_TH_FP_REG(%l7,%f8,0x71C1D37A44206453)
	INIT_TH_FP_REG(%l7,%f10,0xA1EF740F38171C33)
	INIT_TH_FP_REG(%l7,%f12,0x5596CC491716A9FB)
	INIT_TH_FP_REG(%l7,%f14,0x8023D28557374F79)
	INIT_TH_FP_REG(%l7,%f16,0xE29DAADDC15F21D8)
	INIT_TH_FP_REG(%l7,%f18,0x50D3FEE3AAA51FF1)
	INIT_TH_FP_REG(%l7,%f20,0x949E1DB542815AFE)
	INIT_TH_FP_REG(%l7,%f22,0xC45F1B8E7385068F)
	INIT_TH_FP_REG(%l7,%f24,0x120D1BBE03CDA33B)
	INIT_TH_FP_REG(%l7,%f26,0xA4FA8518FA2C5A96)
	INIT_TH_FP_REG(%l7,%f28,0xCE4012C95A2CD89D)
	INIT_TH_FP_REG(%l7,%f30,0xA867B122ED075263)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x703, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	smulcc	%i5,	%o3,	%o4
	sir	0x1E6B
	srl	%i1,	%g7,	%l0
	edge32	%g4,	%i2,	%g5
	fcmpne32	%f30,	%f28,	%i6
	fnot1s	%f28,	%f24
	add	%i3,	0x17B5,	%l2
	ldsw	[%l7 + 0x6C],	%o0
	alignaddrl	%i4,	%g3,	%g6
	fmovsle	%icc,	%f10,	%f0
	std	%f0,	[%l7 + 0x70]
	movrlez	%l5,	0x2D3,	%g2
	addc	%i0,	0x0B2D,	%o6
	fsrc1s	%f2,	%f21
	srax	%l3,	0x1B,	%o7
	sdivcc	%i7,	0x0AC8,	%l1
	smul	%l4,	%g1,	%o2
	stw	%l6,	[%l7 + 0x40]
	fpsub32	%f22,	%f18,	%f14
	edge8n	%o5,	%o1,	%i5
	udivx	%o4,	0x0792,	%o3
	movrlez	%g7,	0x014,	%i1
	movg	%icc,	%l0,	%g4
	fmovdl	%xcc,	%f6,	%f19
	addcc	%i2,	%g5,	%i3
	mova	%xcc,	%i6,	%l2
	sdivcc	%i4,	0x0AAD,	%g3
	fsrc2	%f28,	%f18
	xorcc	%o0,	0x176E,	%g6
	movvs	%icc,	%g2,	%l5
	mova	%icc,	%i0,	%o6
	movle	%icc,	%o7,	%i7
	movcc	%xcc,	%l1,	%l3
	fcmps	%fcc1,	%f18,	%f3
	subccc	%l4,	%o2,	%g1
	fmul8x16	%f19,	%f10,	%f22
	edge32n	%o5,	%o1,	%i5
	udiv	%l6,	0x104F,	%o3
	edge16	%o4,	%g7,	%l0
	movg	%xcc,	%i1,	%g4
	ldx	[%l7 + 0x60],	%g5
	movn	%icc,	%i3,	%i2
	edge32ln	%i6,	%i4,	%g3
	orcc	%o0,	0x0D1A,	%g6
	fmovrse	%l2,	%f21,	%f31
	movrgez	%l5,	%g2,	%i0
	fmul8x16au	%f6,	%f30,	%f0
	subccc	%o7,	0x0CF4,	%o6
	edge16	%i7,	%l3,	%l4
	edge16	%l1,	%g1,	%o5
	movrlz	%o1,	0x25E,	%o2
	fmovdg	%xcc,	%f14,	%f31
	sdiv	%l6,	0x1030,	%i5
	addcc	%o3,	0x1DB2,	%o4
	edge32	%l0,	%g7,	%g4
	st	%f23,	[%l7 + 0x20]
	ldd	[%l7 + 0x68],	%g4
	subc	%i1,	%i2,	%i3
	movneg	%icc,	%i4,	%g3
	save %i6, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x192A
	xnorcc	%l5,	0x1695,	%l2
	fmovdcc	%xcc,	%f17,	%f10
	xnorcc	%g2,	%o7,	%i0
	faligndata	%f6,	%f30,	%f6
	movrne	%o6,	0x031,	%i7
	fpsub16s	%f10,	%f26,	%f11
	fsrc1	%f10,	%f2
	fmuld8sux16	%f5,	%f19,	%f10
	ld	[%l7 + 0x74],	%f11
	lduh	[%l7 + 0x2C],	%l3
	orncc	%l1,	%l4,	%o5
	edge16l	%o1,	%g1,	%o2
	fmovrslez	%l6,	%f18,	%f31
	alignaddrl	%o3,	%o4,	%i5
	sdiv	%g7,	0x04CA,	%g4
	ld	[%l7 + 0x18],	%f27
	sir	0x106D
	fmul8x16al	%f30,	%f12,	%f30
	lduw	[%l7 + 0x2C],	%g5
	andncc	%l0,	%i1,	%i3
	fabsd	%f20,	%f12
	ldd	[%l7 + 0x48],	%f20
	movcc	%icc,	%i4,	%i2
	addccc	%i6,	%g6,	%g3
	edge32ln	%l5,	%o0,	%g2
	fmuld8ulx16	%f25,	%f5,	%f30
	lduh	[%l7 + 0x1C],	%l2
	fmovdl	%icc,	%f15,	%f27
	movpos	%icc,	%o7,	%i0
	subc	%o6,	%i7,	%l3
	edge32	%l4,	%o5,	%l1
	orcc	%g1,	0x0324,	%o1
	edge8n	%l6,	%o3,	%o4
	alignaddr	%o2,	%g7,	%g4
	subcc	%g5,	0x1B60,	%i5
	edge16l	%i1,	%l0,	%i3
	nop
	set	0x1A, %l3
	ldub	[%l7 + %l3],	%i4
	sdivx	%i2,	0x08D0,	%g6
	fmovsle	%icc,	%f24,	%f27
	fpadd16	%f22,	%f8,	%f2
	movrgez	%i6,	0x362,	%g3
	edge16l	%l5,	%o0,	%l2
	fsrc2	%f8,	%f12
	popc	0x0B3A,	%o7
	movrlez	%i0,	%o6,	%g2
	orcc	%i7,	0x0DBB,	%l4
	edge32l	%o5,	%l3,	%l1
	sdivx	%g1,	0x1093,	%o1
	lduw	[%l7 + 0x14],	%l6
	subc	%o4,	0x062B,	%o2
	stb	%g7,	[%l7 + 0x42]
	ldsw	[%l7 + 0x0C],	%g4
	fcmped	%fcc3,	%f16,	%f28
	fabsd	%f14,	%f4
	srlx	%o3,	0x01,	%i5
	st	%f5,	[%l7 + 0x78]
	lduw	[%l7 + 0x68],	%i1
	movleu	%icc,	%l0,	%i3
	sub	%i4,	%g5,	%g6
	fnands	%f1,	%f27,	%f24
	fnors	%f13,	%f11,	%f29
	smul	%i6,	%g3,	%i2
	addc	%o0,	%l2,	%o7
	restore %l5, %i0, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g2,	0x0691,	%l4
	array8	%o5,	%i7,	%l1
	ldd	[%l7 + 0x68],	%f20
	andncc	%l3,	%o1,	%l6
	movrgez	%g1,	%o4,	%g7
	ldsb	[%l7 + 0x60],	%o2
	fmovscc	%icc,	%f27,	%f4
	fornot1s	%f4,	%f31,	%f28
	sllx	%g4,	0x14,	%i5
	popc	%i1,	%l0
	srl	%o3,	0x16,	%i4
	andcc	%g5,	%g6,	%i3
	fmovrslez	%g3,	%f30,	%f11
	fnegd	%f14,	%f6
	fmovdleu	%xcc,	%f4,	%f5
	fornot1s	%f10,	%f11,	%f8
	movneg	%icc,	%i6,	%o0
	mulx	%i2,	0x092A,	%o7
	stx	%l5,	[%l7 + 0x48]
	edge32	%l2,	%o6,	%i0
	edge32n	%g2,	%l4,	%o5
	movgu	%icc,	%l1,	%l3
	smulcc	%o1,	%l6,	%i7
	movne	%xcc,	%g1,	%g7
	smulcc	%o4,	0x0B23,	%g4
	addc	%o2,	0x1CA0,	%i5
	mova	%xcc,	%l0,	%o3
	fmovsvs	%icc,	%f0,	%f9
	movrgz	%i1,	0x0C5,	%i4
	movneg	%xcc,	%g6,	%i3
	addc	%g3,	0x1621,	%g5
	xorcc	%i6,	%i2,	%o7
	std	%f28,	[%l7 + 0x38]
	movrgz	%l5,	%l2,	%o0
	save %i0, %o6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f24,	%f12
	ldsh	[%l7 + 0x52],	%o5
	fand	%f26,	%f10,	%f2
	array32	%g2,	%l3,	%o1
	save %l1, 0x02F2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x74],	%f10
	edge16ln	%g1,	%g7,	%o4
	stw	%i7,	[%l7 + 0x60]
	fmovsneg	%icc,	%f27,	%f7
	mulscc	%g4,	%i5,	%l0
	stw	%o2,	[%l7 + 0x28]
	fmovd	%f12,	%f18
	fxnor	%f12,	%f20,	%f30
	fmovdne	%icc,	%f20,	%f5
	fxor	%f16,	%f2,	%f2
	fmovrdne	%o3,	%f18,	%f22
	fmovdcs	%icc,	%f19,	%f4
	movrgez	%i4,	%i1,	%i3
	movre	%g3,	%g6,	%i6
	sll	%g5,	0x1D,	%i2
	movpos	%icc,	%o7,	%l2
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	fmovsn	%xcc,	%f8,	%f23
	mulx	%o6,	%l4,	%g2
	ldub	[%l7 + 0x5E],	%l3
	alignaddr	%o5,	%o1,	%l6
	addc	%g1,	0x0088,	%g7
	or	%o4,	0x13B0,	%i7
	fmuld8ulx16	%f26,	%f14,	%f10
	xnorcc	%g4,	0x06D4,	%l1
	fmovrsgz	%l0,	%f21,	%f25
	lduh	[%l7 + 0x2A],	%o2
	movl	%icc,	%o3,	%i5
	andcc	%i1,	0x15C5,	%i4
	movrgz	%i3,	%g3,	%g6
	add	%g5,	0x1F6C,	%i6
	edge16n	%i2,	%o7,	%l2
	fxor	%f16,	%f14,	%f8
	fpadd16	%f26,	%f4,	%f6
	sir	0x0C85
	fmovdleu	%xcc,	%f21,	%f27
	fpackfix	%f20,	%f16
	fcmpgt32	%f12,	%f16,	%o0
	subc	%i0,	0x17D9,	%o6
	movvc	%icc,	%l5,	%g2
	fmovs	%f0,	%f13
	andncc	%l3,	%o5,	%l4
	movl	%xcc,	%l6,	%g1
	edge16l	%g7,	%o4,	%o1
	move	%icc,	%i7,	%l1
	and	%g4,	%o2,	%o3
	movrlz	%i5,	0x37C,	%l0
	edge16	%i1,	%i3,	%g3
	umul	%g6,	0x15AD,	%g5
	edge16n	%i6,	%i4,	%o7
	array16	%l2,	%i2,	%i0
	orn	%o6,	0x1C7E,	%o0
	movrlez	%g2,	%l5,	%o5
	srlx	%l3,	0x12,	%l6
	fcmpeq32	%f6,	%f0,	%g1
	smulcc	%l4,	%o4,	%g7
	movrlz	%o1,	%i7,	%g4
	edge16	%l1,	%o3,	%i5
	movcs	%icc,	%o2,	%i1
	ldsh	[%l7 + 0x44],	%i3
	bshuffle	%f10,	%f4,	%f24
	move	%xcc,	%l0,	%g3
	subc	%g5,	0x08E6,	%i6
	movn	%xcc,	%i4,	%o7
	sllx	%l2,	0x03,	%i2
	movle	%xcc,	%g6,	%i0
	movrgz	%o6,	0x237,	%o0
	movcs	%xcc,	%l5,	%g2
	subcc	%o5,	%l6,	%g1
	fpmerge	%f2,	%f16,	%f8
	smulcc	%l4,	0x075A,	%l3
	smulcc	%g7,	0x11C9,	%o1
	fand	%f2,	%f10,	%f10
	subcc	%i7,	0x0484,	%g4
	edge16	%o4,	%o3,	%l1
	edge32l	%o2,	%i1,	%i5
	sub	%l0,	0x1F83,	%i3
	movrne	%g3,	0x01A,	%i6
	fnor	%f6,	%f30,	%f2
	srl	%g5,	0x0F,	%i4
	srlx	%l2,	0x0F,	%i2
	edge8l	%g6,	%i0,	%o6
	fsrc1	%f28,	%f18
	fmovrsne	%o7,	%f23,	%f7
	fmovrse	%o0,	%f31,	%f12
	fmovrdgz	%l5,	%f2,	%f0
	mulscc	%g2,	0x10A2,	%o5
	sdivx	%g1,	0x0A1E,	%l6
	orncc	%l4,	0x1822,	%l3
	fcmpgt32	%f14,	%f0,	%g7
	movpos	%icc,	%o1,	%g4
	addcc	%i7,	0x1094,	%o4
	fnot1	%f18,	%f20
	fnand	%f2,	%f24,	%f18
	movre	%l1,	0x282,	%o3
	subcc	%o2,	%i1,	%l0
	fmovsleu	%xcc,	%f23,	%f8
	smulcc	%i5,	%g3,	%i3
	udiv	%g5,	0x1DD5,	%i6
	udivx	%l2,	0x1BB1,	%i4
	movg	%xcc,	%g6,	%i0
	fabsd	%f4,	%f0
	fpack16	%f30,	%f16
	udivcc	%i2,	0x13DD,	%o7
	subcc	%o0,	%o6,	%l5
	fcmps	%fcc1,	%f7,	%f25
	movleu	%icc,	%g2,	%g1
	stw	%l6,	[%l7 + 0x44]
	alignaddrl	%o5,	%l4,	%l3
	alignaddrl	%o1,	%g7,	%i7
	sub	%g4,	%o4,	%l1
	mova	%icc,	%o3,	%i1
	sdiv	%l0,	0x1C84,	%i5
	ld	[%l7 + 0x50],	%f2
	movrgez	%g3,	0x3FE,	%o2
	fandnot1	%f22,	%f20,	%f8
	smulcc	%g5,	0x0191,	%i3
	stb	%l2,	[%l7 + 0x7B]
	movge	%icc,	%i6,	%g6
	sdivx	%i0,	0x0D14,	%i2
	edge8	%i4,	%o0,	%o6
	fmovrdlz	%o7,	%f14,	%f12
	movge	%xcc,	%g2,	%l5
	movleu	%xcc,	%l6,	%o5
	fcmpd	%fcc1,	%f26,	%f22
	xor	%g1,	%l4,	%l3
	smulcc	%o1,	%i7,	%g4
	andn	%g7,	0x12D0,	%o4
	fzero	%f20
	sra	%o3,	0x08,	%l1
	fmovd	%f2,	%f0
	faligndata	%f24,	%f22,	%f0
	fandnot1s	%f8,	%f29,	%f19
	mulscc	%l0,	0x1B1A,	%i5
	fmovrdlz	%g3,	%f18,	%f12
	restore %o2, 0x10FC, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i3,	0x0FAF,	%l2
	smul	%i6,	%g5,	%i0
	fmovrsgz	%g6,	%f21,	%f27
	fmovsne	%icc,	%f21,	%f8
	save %i2, %i4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o7,	0x1C35,	%o6
	array8	%l5,	%l6,	%g2
	fmovspos	%icc,	%f7,	%f20
	move	%xcc,	%g1,	%l4
	fandnot2	%f30,	%f28,	%f10
	orn	%l3,	%o5,	%o1
	alignaddr	%i7,	%g7,	%g4
	fones	%f16
	ldsb	[%l7 + 0x3D],	%o3
	ldsh	[%l7 + 0x08],	%o4
	and	%l1,	%i5,	%l0
	fmovdleu	%xcc,	%f23,	%f3
	fcmpes	%fcc1,	%f9,	%f5
	fmovdg	%xcc,	%f8,	%f7
	fsrc1	%f30,	%f18
	fnegd	%f18,	%f2
	orcc	%g3,	0x0579,	%i1
	faligndata	%f30,	%f2,	%f0
	fmovsneg	%icc,	%f29,	%f19
	xnorcc	%i3,	0x02BE,	%o2
	array16	%l2,	%i6,	%i0
	fmovdleu	%xcc,	%f24,	%f5
	edge32n	%g6,	%g5,	%i2
	fmovrslz	%i4,	%f24,	%f14
	array8	%o7,	%o0,	%l5
	subccc	%l6,	0x1DF5,	%g2
	umulcc	%o6,	0x1C6A,	%l4
	fmovrdlez	%g1,	%f30,	%f30
	ldd	[%l7 + 0x38],	%f14
	xor	%l3,	%o1,	%i7
	ldd	[%l7 + 0x48],	%g6
	movg	%xcc,	%g4,	%o3
	lduw	[%l7 + 0x48],	%o5
	movgu	%icc,	%o4,	%l1
	fmovdle	%icc,	%f27,	%f22
	movre	%i5,	0x084,	%g3
	fnands	%f18,	%f17,	%f25
	smulcc	%l0,	0x1352,	%i3
	sll	%o2,	0x11,	%i1
	std	%f26,	[%l7 + 0x08]
	fsrc2s	%f6,	%f16
	movg	%xcc,	%l2,	%i6
	ldsw	[%l7 + 0x60],	%g6
	xnorcc	%g5,	0x1C77,	%i0
	movvc	%xcc,	%i4,	%i2
	fmovsgu	%icc,	%f4,	%f16
	fnand	%f8,	%f6,	%f12
	movl	%icc,	%o7,	%l5
	edge32ln	%o0,	%l6,	%o6
	addcc	%g2,	0x1EBF,	%l4
	fnot1	%f12,	%f8
	edge16n	%g1,	%o1,	%i7
	mulx	%g7,	0x0F17,	%l3
	stw	%o3,	[%l7 + 0x40]
	mulscc	%o5,	%o4,	%g4
	edge16n	%l1,	%i5,	%l0
	array16	%i3,	%o2,	%g3
	fnand	%f16,	%f28,	%f8
	stb	%l2,	[%l7 + 0x41]
	siam	0x2
	save %i1, 0x1966, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i6,	%i0,	%i4
	movvs	%xcc,	%i2,	%o7
	andcc	%l5,	0x0A70,	%o0
	udiv	%l6,	0x1CF0,	%g5
	std	%f20,	[%l7 + 0x78]
	sllx	%g2,	0x07,	%o6
	andn	%l4,	%o1,	%i7
	subccc	%g7,	0x02CA,	%l3
	fcmple32	%f18,	%f14,	%o3
	movle	%icc,	%o5,	%o4
	fnot2s	%f20,	%f7
	sub	%g4,	0x1A61,	%l1
	fxors	%f7,	%f2,	%f18
	edge8	%g1,	%i5,	%i3
	alignaddrl	%o2,	%l0,	%g3
	fpadd32s	%f8,	%f21,	%f2
	movrlz	%i1,	0x014,	%l2
	movleu	%icc,	%g6,	%i0
	addcc	%i6,	0x0517,	%i2
	edge16	%i4,	%l5,	%o0
	subccc	%o7,	0x0949,	%l6
	fpadd32	%f10,	%f18,	%f10
	alignaddrl	%g5,	%o6,	%g2
	fpadd16s	%f29,	%f22,	%f2
	smul	%l4,	0x062B,	%o1
	stx	%g7,	[%l7 + 0x10]
	fmovrdlz	%i7,	%f26,	%f0
	sdiv	%l3,	0x1553,	%o3
	array8	%o5,	%g4,	%o4
	movvs	%icc,	%g1,	%l1
	movl	%xcc,	%i3,	%i5
	fmovrsgez	%o2,	%f4,	%f11
	subcc	%l0,	0x1948,	%i1
	ldd	[%l7 + 0x38],	%g2
	fnot2	%f10,	%f12
	alignaddr	%l2,	%i0,	%g6
	movvc	%icc,	%i6,	%i4
	addc	%l5,	%i2,	%o7
	xnor	%o0,	%l6,	%o6
	edge8l	%g2,	%l4,	%o1
	edge8	%g5,	%i7,	%l3
	mulscc	%g7,	0x0DE0,	%o5
	fmul8x16	%f16,	%f20,	%f20
	edge16ln	%o3,	%o4,	%g4
	array16	%g1,	%i3,	%i5
	fmovdle	%icc,	%f30,	%f21
	add	%o2,	0x02B6,	%l1
	sethi	0x0896,	%i1
	fcmple32	%f28,	%f28,	%g3
	movge	%xcc,	%l0,	%i0
	nop
	set	0x28, %l6
	ldd	[%l7 + %l6],	%l2
	fmul8x16al	%f22,	%f19,	%f16
	fornot1	%f6,	%f22,	%f14
	movvc	%xcc,	%g6,	%i6
	edge32l	%l5,	%i2,	%o7
	fmuld8ulx16	%f21,	%f6,	%f16
	addc	%o0,	%i4,	%l6
	orncc	%o6,	0x09F8,	%g2
	edge16	%o1,	%g5,	%l4
	or	%i7,	%l3,	%o5
	smul	%g7,	%o3,	%o4
	ldd	[%l7 + 0x68],	%f0
	edge32l	%g4,	%i3,	%g1
	nop
	set	0x60, %o7
	ldx	[%l7 + %o7],	%i5
	edge32l	%o2,	%i1,	%l1
	srax	%g3,	0x0F,	%l0
	array32	%i0,	%g6,	%l2
	smul	%l5,	%i6,	%o7
	st	%f25,	[%l7 + 0x08]
	fnands	%f30,	%f21,	%f31
	ldd	[%l7 + 0x18],	%o0
	edge32n	%i4,	%l6,	%o6
	fmovdcs	%xcc,	%f21,	%f5
	movn	%xcc,	%g2,	%i2
	movl	%xcc,	%g5,	%l4
	fmovse	%icc,	%f20,	%f17
	fcmpeq16	%f8,	%f0,	%o1
	mulx	%l3,	0x1EF4,	%i7
	sth	%g7,	[%l7 + 0x52]
	ldsh	[%l7 + 0x0A],	%o3
	popc	0x049D,	%o4
	movvs	%xcc,	%g4,	%i3
	srax	%g1,	%o5,	%i5
	ldub	[%l7 + 0x3A],	%o2
	fmovrdlez	%i1,	%f24,	%f20
	edge32n	%g3,	%l1,	%l0
	ld	[%l7 + 0x24],	%f22
	fpsub32	%f8,	%f8,	%f10
	movcc	%xcc,	%i0,	%l2
	ldub	[%l7 + 0x24],	%g6
	sub	%i6,	0x12AE,	%l5
	movrne	%o0,	0x3B6,	%i4
	movpos	%xcc,	%o7,	%o6
	srl	%g2,	%i2,	%l6
	array32	%l4,	%g5,	%l3
	sir	0x06A3
	ld	[%l7 + 0x7C],	%f16
	movne	%xcc,	%i7,	%o1
	fmovrslez	%o3,	%f10,	%f6
	or	%o4,	0x162F,	%g7
	edge8	%g4,	%i3,	%g1
	fmovdgu	%xcc,	%f3,	%f23
	srl	%o5,	%o2,	%i1
	movneg	%xcc,	%i5,	%g3
	sub	%l0,	%i0,	%l1
	and	%g6,	0x1BB6,	%l2
	addccc	%i6,	0x1389,	%o0
	movneg	%icc,	%i4,	%o7
	and	%o6,	0x1F85,	%l5
	xnorcc	%g2,	%i2,	%l6
	fpsub32s	%f0,	%f20,	%f17
	movg	%xcc,	%g5,	%l3
	array32	%l4,	%i7,	%o1
	fzeros	%f3
	orncc	%o4,	0x0F5C,	%o3
	fmovrsgz	%g7,	%f11,	%f8
	umul	%i3,	0x1D41,	%g1
	movcs	%icc,	%o5,	%o2
	popc	0x11E4,	%g4
	movne	%icc,	%i1,	%i5
	fcmpne32	%f10,	%f20,	%g3
	stx	%l0,	[%l7 + 0x28]
	ldub	[%l7 + 0x47],	%l1
	fpadd16	%f0,	%f10,	%f14
	nop
	set	0x70, %g5
	stb	%i0,	[%l7 + %g5]
	movrlz	%l2,	%g6,	%o0
	ldx	[%l7 + 0x50],	%i4
	edge32	%o7,	%o6,	%i6
	subc	%g2,	%i2,	%l5
	srlx	%l6,	0x05,	%g5
	edge32n	%l3,	%l4,	%i7
	ldub	[%l7 + 0x72],	%o1
	ldd	[%l7 + 0x30],	%o2
	stw	%g7,	[%l7 + 0x1C]
	nop
	set	0x48, %l4
	stx	%i3,	[%l7 + %l4]
	movneg	%xcc,	%g1,	%o5
	srl	%o2,	0x1C,	%g4
	movn	%xcc,	%o4,	%i5
	ldd	[%l7 + 0x40],	%f2
	udiv	%i1,	0x19A8,	%g3
	fsrc2s	%f9,	%f5
	sra	%l0,	0x05,	%i0
	nop
	set	0x3E, %g3
	ldsh	[%l7 + %g3],	%l2
	sdiv	%g6,	0x178F,	%o0
	umulcc	%i4,	0x1D15,	%o7
	fornot2	%f8,	%f6,	%f12
	stx	%l1,	[%l7 + 0x58]
	xorcc	%i6,	0x1281,	%g2
	smulcc	%i2,	%l5,	%l6
	udivx	%o6,	0x116E,	%g5
	fcmpeq16	%f28,	%f22,	%l3
	subcc	%i7,	%o1,	%o3
	stb	%g7,	[%l7 + 0x56]
	udivx	%l4,	0x1204,	%g1
	movleu	%xcc,	%i3,	%o2
	addccc	%g4,	0x1728,	%o5
	movcs	%xcc,	%o4,	%i1
	movl	%xcc,	%i5,	%g3
	ldsh	[%l7 + 0x20],	%i0
	movcc	%icc,	%l0,	%l2
	fpmerge	%f2,	%f0,	%f24
	movgu	%xcc,	%g6,	%i4
	fmovsge	%icc,	%f23,	%f3
	mulscc	%o0,	%o7,	%i6
	sllx	%g2,	%i2,	%l5
	fmovs	%f2,	%f13
	array32	%l1,	%l6,	%o6
	movvc	%icc,	%g5,	%l3
	lduw	[%l7 + 0x7C],	%o1
	udiv	%i7,	0x1E0B,	%g7
	ldsb	[%l7 + 0x5B],	%o3
	fmovdpos	%icc,	%f11,	%f20
	edge32	%l4,	%g1,	%o2
	udivcc	%i3,	0x0060,	%g4
	movpos	%xcc,	%o4,	%o5
	edge32l	%i5,	%g3,	%i1
	sub	%l0,	0x0D25,	%i0
	ldx	[%l7 + 0x08],	%l2
	srlx	%g6,	0x0D,	%i4
	st	%f6,	[%l7 + 0x48]
	movcc	%xcc,	%o7,	%o0
	ldx	[%l7 + 0x70],	%i6
	edge8	%i2,	%g2,	%l5
	st	%f10,	[%l7 + 0x10]
	subcc	%l1,	0x191C,	%l6
	sll	%g5,	%o6,	%l3
	fmovsg	%xcc,	%f13,	%f27
	movrne	%o1,	0x1E8,	%g7
	fors	%f21,	%f6,	%f21
	edge16ln	%i7,	%o3,	%l4
	udiv	%g1,	0x1481,	%o2
	popc	0x10D5,	%g4
	movcs	%icc,	%o4,	%o5
	xnor	%i5,	0x1A31,	%g3
	subccc	%i1,	%i3,	%l0
	movcs	%xcc,	%l2,	%g6
	stw	%i0,	[%l7 + 0x6C]
	fxor	%f6,	%f4,	%f8
	fandnot2	%f0,	%f30,	%f22
	fcmps	%fcc0,	%f30,	%f0
	xorcc	%i4,	%o7,	%o0
	movl	%icc,	%i6,	%i2
	addccc	%l5,	0x0933,	%g2
	fmul8ulx16	%f6,	%f18,	%f6
	or	%l6,	0x14AA,	%l1
	smul	%o6,	0x1E1A,	%g5
	save %o1, %l3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o3,	0x022F,	%g7
	fmovdcc	%xcc,	%f28,	%f11
	xnorcc	%l4,	0x0B55,	%o2
	smulcc	%g4,	0x1CBB,	%g1
	movrgez	%o5,	%o4,	%i5
	movrne	%i1,	%i3,	%g3
	srax	%l2,	%l0,	%i0
	udivx	%g6,	0x124B,	%o7
	addcc	%i4,	0x0A17,	%i6
	array8	%i2,	%o0,	%g2
	fcmps	%fcc2,	%f27,	%f20
	edge32n	%l6,	%l5,	%o6
	fmovrdgez	%g5,	%f10,	%f2
	sir	0x1FBC
	edge32l	%l1,	%l3,	%i7
	andncc	%o1,	%o3,	%g7
	subcc	%l4,	0x04AF,	%o2
	movn	%xcc,	%g1,	%g4
	movvs	%icc,	%o4,	%o5
	fsrc2	%f24,	%f24
	fmovdne	%xcc,	%f15,	%f19
	ldd	[%l7 + 0x28],	%f18
	mulscc	%i1,	%i5,	%g3
	fnands	%f0,	%f30,	%f17
	umulcc	%l2,	0x19EA,	%l0
	save %i0, %i3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g6,	0x069,	%i4
	xorcc	%i2,	0x00F0,	%o0
	fnot2	%f20,	%f12
	save %i6, 0x1787, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f16,	%f30,	%l5
	srax	%o6,	0x00,	%g2
	xorcc	%l1,	0x1605,	%l3
	ldd	[%l7 + 0x68],	%i6
	fcmple32	%f8,	%f30,	%g5
	fpack32	%f22,	%f2,	%f2
	sra	%o1,	0x1C,	%g7
	srlx	%l4,	%o2,	%o3
	fpadd32s	%f20,	%f11,	%f20
	fandnot2s	%f5,	%f14,	%f23
	fmovrslz	%g1,	%f4,	%f15
	sth	%o4,	[%l7 + 0x54]
	umul	%g4,	0x06D0,	%o5
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	addccc	%l0,	0x1E76,	%l2
	movrgez	%i0,	0x1D4,	%o7
	subc	%i3,	%g6,	%i4
	andn	%i2,	0x0E0D,	%o0
	srl	%i6,	%l6,	%l5
	fmovsleu	%xcc,	%f25,	%f6
	fzeros	%f2
	lduw	[%l7 + 0x74],	%g2
	fmovrsgez	%o6,	%f24,	%f8
	edge32ln	%l3,	%l1,	%g5
	xorcc	%i7,	%g7,	%o1
	udivcc	%o2,	0x127B,	%l4
	sethi	0x1F56,	%g1
	subc	%o4,	%o3,	%o5
	sll	%i5,	0x03,	%i1
	ldx	[%l7 + 0x18],	%g4
	fcmpeq32	%f0,	%f6,	%l0
	movrlz	%g3,	0x1F2,	%l2
	fcmpes	%fcc1,	%f7,	%f13
	movrlez	%o7,	0x0BC,	%i3
	xor	%i0,	0x13AF,	%i4
	nop
	set	0x6A, %o6
	sth	%i2,	[%l7 + %o6]
	xorcc	%o0,	%g6,	%i6
	stw	%l6,	[%l7 + 0x3C]
	movgu	%xcc,	%l5,	%o6
	smul	%l3,	0x1C30,	%l1
	mova	%icc,	%g5,	%i7
	edge16	%g7,	%o1,	%o2
	orn	%g2,	0x121D,	%l4
	ldd	[%l7 + 0x28],	%f12
	edge8l	%g1,	%o3,	%o4
	alignaddr	%o5,	%i5,	%g4
	srax	%i1,	%g3,	%l0
	fsrc1	%f16,	%f8
	edge8	%o7,	%i3,	%l2
	xnor	%i4,	0x1277,	%i0
	fcmpes	%fcc3,	%f21,	%f29
	srlx	%o0,	0x0E,	%g6
	sth	%i2,	[%l7 + 0x7E]
	sth	%l6,	[%l7 + 0x66]
	orn	%l5,	%i6,	%o6
	sll	%l3,	0x06,	%g5
	or	%l1,	0x0F0A,	%g7
	fands	%f9,	%f8,	%f14
	movl	%icc,	%o1,	%o2
	movl	%xcc,	%i7,	%l4
	smulcc	%g1,	0x15C1,	%o3
	ldsb	[%l7 + 0x17],	%g2
	ldsb	[%l7 + 0x6D],	%o4
	addc	%o5,	0x141E,	%g4
	stx	%i1,	[%l7 + 0x08]
	movvs	%icc,	%i5,	%g3
	srlx	%l0,	%o7,	%i3
	fmovdn	%xcc,	%f16,	%f21
	edge16l	%i4,	%i0,	%l2
	movle	%xcc,	%o0,	%g6
	sethi	0x1F9E,	%i2
	fxors	%f17,	%f17,	%f20
	fmovdne	%xcc,	%f29,	%f25
	fexpand	%f23,	%f14
	st	%f1,	[%l7 + 0x58]
	sth	%l6,	[%l7 + 0x56]
	fmovrdlez	%l5,	%f2,	%f2
	edge32l	%o6,	%i6,	%g5
	fmovdg	%icc,	%f1,	%f22
	movrgz	%l1,	0x3CD,	%l3
	stw	%o1,	[%l7 + 0x5C]
	srax	%g7,	0x05,	%i7
	fxors	%f16,	%f0,	%f4
	sdivx	%l4,	0x0BE1,	%o2
	edge16n	%g1,	%o3,	%g2
	movleu	%xcc,	%o4,	%o5
	fandnot1	%f18,	%f26,	%f14
	st	%f1,	[%l7 + 0x14]
	lduw	[%l7 + 0x64],	%g4
	movleu	%icc,	%i5,	%i1
	movn	%xcc,	%g3,	%l0
	fmovrdlz	%i3,	%f8,	%f20
	sdivcc	%i4,	0x0579,	%o7
	sdiv	%l2,	0x0DA9,	%i0
	fpack16	%f2,	%f14
	fpack16	%f14,	%f27
	orcc	%o0,	%i2,	%g6
	st	%f13,	[%l7 + 0x48]
	movvc	%icc,	%l6,	%l5
	fsrc1	%f6,	%f2
	fmovd	%f20,	%f0
	movcc	%icc,	%o6,	%i6
	umul	%g5,	%l3,	%o1
	movrgz	%l1,	%g7,	%i7
	alignaddr	%o2,	%l4,	%g1
	movge	%xcc,	%g2,	%o4
	fabss	%f11,	%f2
	movge	%icc,	%o3,	%o5
	edge16n	%i5,	%g4,	%g3
	movle	%xcc,	%l0,	%i1
	sir	0x0B18
	andn	%i4,	%i3,	%l2
	or	%o7,	%o0,	%i0
	fabss	%f14,	%f7
	fnot1	%f30,	%f16
	movne	%icc,	%i2,	%l6
	stb	%l5,	[%l7 + 0x61]
	array32	%o6,	%i6,	%g5
	edge8	%g6,	%o1,	%l3
	mulscc	%g7,	%l1,	%o2
	mulx	%i7,	%l4,	%g1
	movne	%icc,	%g2,	%o4
	ldd	[%l7 + 0x18],	%o2
	movgu	%icc,	%i5,	%g4
	movvs	%icc,	%g3,	%l0
	orcc	%i1,	%i4,	%i3
	sethi	0x18AD,	%l2
	sir	0x13F5
	xor	%o7,	0x0919,	%o0
	andcc	%o5,	0x1B8F,	%i2
	array32	%i0,	%l5,	%o6
	movpos	%xcc,	%l6,	%g5
	sdivcc	%i6,	0x02F9,	%g6
	addccc	%l3,	0x1DC0,	%o1
	fpackfix	%f28,	%f11
	fmovsvs	%xcc,	%f16,	%f10
	xorcc	%l1,	%g7,	%i7
	fcmpes	%fcc2,	%f17,	%f0
	sir	0x09CA
	fmovdge	%xcc,	%f25,	%f31
	ld	[%l7 + 0x58],	%f2
	fmovsneg	%xcc,	%f5,	%f11
	std	%f8,	[%l7 + 0x70]
	fmul8ulx16	%f16,	%f30,	%f18
	movrlz	%o2,	%l4,	%g1
	alignaddrl	%o4,	%o3,	%g2
	movcc	%xcc,	%i5,	%g4
	edge16ln	%l0,	%i1,	%g3
	alignaddr	%i4,	%l2,	%o7
	fmovsneg	%xcc,	%f26,	%f8
	fsrc2	%f0,	%f28
	edge32	%i3,	%o5,	%i2
	orcc	%i0,	0x0C9A,	%o0
	udiv	%o6,	0x09CA,	%l5
	orcc	%l6,	%g5,	%i6
	fnegd	%f18,	%f16
	movneg	%icc,	%g6,	%o1
	fmovsvc	%xcc,	%f9,	%f27
	mova	%icc,	%l3,	%g7
	fmovrdne	%l1,	%f28,	%f30
	fandnot2s	%f16,	%f20,	%f10
	srax	%i7,	%l4,	%o2
	movl	%xcc,	%g1,	%o4
	fabss	%f24,	%f12
	movn	%icc,	%g2,	%o3
	and	%g4,	%l0,	%i5
	array32	%g3,	%i4,	%i1
	fpadd32	%f12,	%f26,	%f6
	movg	%xcc,	%o7,	%i3
	ldsw	[%l7 + 0x4C],	%l2
	alignaddr	%o5,	%i0,	%o0
	fmovscs	%icc,	%f2,	%f31
	edge32	%o6,	%i2,	%l5
	fmovdl	%xcc,	%f11,	%f11
	edge8n	%g5,	%l6,	%g6
	fmovsle	%icc,	%f14,	%f1
	orcc	%o1,	%l3,	%g7
	edge32ln	%i6,	%l1,	%l4
	udiv	%i7,	0x191F,	%g1
	alignaddrl	%o4,	%o2,	%g2
	movvc	%xcc,	%g4,	%o3
	fmovsl	%xcc,	%f8,	%f9
	umulcc	%l0,	0x14C0,	%i5
	fmovrdgz	%g3,	%f2,	%f6
	fnors	%f0,	%f1,	%f6
	udivcc	%i4,	0x1D5A,	%o7
	movgu	%xcc,	%i1,	%i3
	lduw	[%l7 + 0x24],	%l2
	siam	0x6
	fmovdvc	%icc,	%f20,	%f3
	subccc	%o5,	0x0901,	%o0
	movvc	%xcc,	%i0,	%o6
	fmovrdne	%l5,	%f14,	%f6
	movle	%icc,	%g5,	%l6
	movre	%g6,	%o1,	%l3
	srax	%g7,	0x12,	%i6
	mova	%xcc,	%l1,	%l4
	fmovdvc	%xcc,	%f7,	%f11
	stx	%i7,	[%l7 + 0x10]
	alignaddr	%i2,	%o4,	%o2
	ldd	[%l7 + 0x58],	%g2
	fmovdneg	%icc,	%f8,	%f30
	ldsw	[%l7 + 0x10],	%g1
	addcc	%g4,	%l0,	%i5
	movgu	%xcc,	%g3,	%o3
	save %o7, %i1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%l2
	array16	%i4,	%o5,	%i0
	stw	%o0,	[%l7 + 0x74]
	fmovse	%icc,	%f11,	%f20
	std	%f30,	[%l7 + 0x68]
	fornot2s	%f30,	%f19,	%f13
	udivx	%l5,	0x050B,	%o6
	smulcc	%l6,	%g5,	%g6
	fsrc1s	%f31,	%f11
	movrlez	%o1,	%g7,	%l3
	edge32	%i6,	%l4,	%l1
	andncc	%i2,	%i7,	%o4
	sllx	%o2,	%g1,	%g4
	edge16l	%l0,	%g2,	%i5
	addc	%o3,	0x03F0,	%o7
	fmovsne	%xcc,	%f28,	%f4
	fsrc2s	%f29,	%f28
	andcc	%i1,	%g3,	%l2
	addc	%i3,	0x12D9,	%o5
	sra	%i0,	%o0,	%l5
	movne	%icc,	%o6,	%l6
	popc	%g5,	%g6
	fnot2	%f6,	%f0
	movrgz	%o1,	%i4,	%g7
	fmovrdne	%l3,	%f20,	%f6
	srax	%l4,	0x02,	%i6
	smulcc	%i2,	%i7,	%o4
	xnor	%l1,	%g1,	%g4
	fpadd16s	%f16,	%f9,	%f27
	sllx	%o2,	%g2,	%l0
	ldub	[%l7 + 0x67],	%i5
	fpadd16	%f14,	%f18,	%f16
	sllx	%o3,	0x11,	%o7
	alignaddrl	%g3,	%i1,	%l2
	ldsh	[%l7 + 0x50],	%o5
	sir	0x19B3
	edge8ln	%i3,	%i0,	%o0
	addccc	%o6,	0x0525,	%l5
	fmovdvc	%xcc,	%f26,	%f19
	xnor	%l6,	%g6,	%o1
	andncc	%i4,	%g7,	%g5
	srax	%l3,	0x19,	%l4
	ldd	[%l7 + 0x78],	%f18
	movrlz	%i2,	%i6,	%o4
	stb	%l1,	[%l7 + 0x2F]
	fmul8sux16	%f20,	%f4,	%f24
	fnegs	%f25,	%f19
	movrlez	%g1,	0x1C2,	%g4
	movl	%icc,	%o2,	%i7
	sll	%l0,	0x09,	%i5
	andn	%o3,	0x0C49,	%o7
	edge32ln	%g2,	%g3,	%i1
	fsrc1s	%f5,	%f15
	edge8	%o5,	%l2,	%i0
	xorcc	%o0,	0x18B5,	%o6
	udivx	%i3,	0x1620,	%l6
	fmul8x16al	%f31,	%f2,	%f10
	movre	%g6,	%l5,	%i4
	edge8	%o1,	%g5,	%l3
	movne	%icc,	%g7,	%i2
	udivx	%l4,	0x14E8,	%o4
	sdivx	%l1,	0x11E8,	%i6
	array8	%g4,	%g1,	%i7
	siam	0x2
	fmul8x16au	%f13,	%f3,	%f8
	andcc	%l0,	%i5,	%o2
	movne	%xcc,	%o7,	%o3
	sra	%g2,	0x09,	%g3
	fmovs	%f10,	%f8
	movvs	%xcc,	%o5,	%i1
	fpack32	%f0,	%f10,	%f0
	std	%f10,	[%l7 + 0x38]
	udivx	%l2,	0x073C,	%o0
	udivx	%i0,	0x0002,	%i3
	popc	%o6,	%g6
	sth	%l5,	[%l7 + 0x2C]
	sdivx	%l6,	0x0C9B,	%i4
	xnor	%g5,	0x012A,	%o1
	movn	%xcc,	%l3,	%g7
	fornot1s	%f30,	%f8,	%f16
	fmovdl	%xcc,	%f18,	%f26
	orncc	%l4,	0x0088,	%i2
	ldsw	[%l7 + 0x10],	%l1
	fmovd	%f30,	%f14
	sdiv	%i6,	0x1E35,	%g4
	array32	%o4,	%g1,	%i7
	movvs	%xcc,	%i5,	%l0
	andn	%o7,	%o3,	%o2
	smul	%g3,	%g2,	%i1
	xnorcc	%l2,	0x1859,	%o5
	ldub	[%l7 + 0x37],	%i0
	sllx	%i3,	0x03,	%o0
	fmovrsgz	%g6,	%f31,	%f12
	lduh	[%l7 + 0x72],	%o6
	movvs	%xcc,	%l6,	%i4
	umulcc	%l5,	%g5,	%o1
	srl	%g7,	0x0C,	%l4
	alignaddr	%i2,	%l1,	%i6
	fmovrsne	%g4,	%f19,	%f25
	array8	%o4,	%l3,	%i7
	xnor	%i5,	0x0135,	%l0
	ldub	[%l7 + 0x2A],	%g1
	movneg	%icc,	%o7,	%o2
	umul	%o3,	0x031E,	%g3
	bshuffle	%f28,	%f14,	%f12
	udivcc	%i1,	0x1CE4,	%l2
	srax	%g2,	0x11,	%i0
	edge8ln	%i3,	%o5,	%g6
	restore %o0, 0x0880, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i4,	%l5
	srax	%g5,	0x03,	%o6
	fmovdle	%xcc,	%f5,	%f20
	fxnor	%f30,	%f16,	%f14
	edge32ln	%o1,	%l4,	%i2
	xnorcc	%l1,	%i6,	%g7
	srl	%g4,	0x0D,	%o4
	stw	%i7,	[%l7 + 0x08]
	movg	%xcc,	%l3,	%l0
	move	%xcc,	%g1,	%i5
	fsrc2s	%f16,	%f4
	edge32ln	%o2,	%o3,	%g3
	edge8ln	%o7,	%l2,	%i1
	std	%f30,	[%l7 + 0x38]
	fand	%f18,	%f22,	%f8
	st	%f2,	[%l7 + 0x3C]
	andn	%g2,	0x09DB,	%i0
	ldub	[%l7 + 0x18],	%i3
	st	%f10,	[%l7 + 0x0C]
	fmovsvc	%icc,	%f18,	%f29
	fornot2s	%f6,	%f4,	%f9
	sir	0x07E5
	array8	%g6,	%o5,	%o0
	movrlz	%l6,	%i4,	%l5
	or	%o6,	0x0266,	%o1
	xnorcc	%l4,	0x1487,	%g5
	edge16	%i2,	%i6,	%l1
	sdivcc	%g7,	0x0671,	%o4
	fmovsa	%xcc,	%f20,	%f20
	subc	%g4,	0x177E,	%i7
	ldx	[%l7 + 0x20],	%l3
	movl	%icc,	%g1,	%i5
	fsrc2	%f10,	%f30
	edge8n	%l0,	%o3,	%o2
	movrgz	%o7,	%l2,	%i1
	movvs	%icc,	%g3,	%i0
	alignaddrl	%i3,	%g6,	%g2
	movrne	%o0,	%l6,	%i4
	sra	%o5,	%l5,	%o1
	lduh	[%l7 + 0x0A],	%o6
	ldd	[%l7 + 0x08],	%f20
	stx	%l4,	[%l7 + 0x10]
	ldub	[%l7 + 0x6F],	%i2
	popc	0x1F70,	%g5
	subccc	%l1,	%i6,	%g7
	fxnors	%f13,	%f13,	%f15
	ldub	[%l7 + 0x36],	%g4
	sra	%o4,	%l3,	%i7
	fmovrslz	%i5,	%f4,	%f15
	umulcc	%g1,	0x1498,	%o3
	movne	%icc,	%o2,	%o7
	lduh	[%l7 + 0x60],	%l2
	popc	0x0454,	%l0
	fsrc2s	%f31,	%f20
	sdiv	%g3,	0x1BF7,	%i1
	movrgz	%i0,	%i3,	%g2
	orcc	%g6,	0x1E28,	%l6
	movrgez	%o0,	0x1D7,	%i4
	sub	%o5,	%o1,	%o6
	movle	%icc,	%l4,	%i2
	sethi	0x041B,	%g5
	movn	%icc,	%l5,	%i6
	movrgez	%l1,	%g4,	%o4
	movn	%icc,	%g7,	%i7
	add	%l3,	%i5,	%g1
	movl	%icc,	%o2,	%o7
	movvs	%icc,	%l2,	%o3
	fmuld8sux16	%f8,	%f9,	%f26
	and	%l0,	0x180C,	%i1
	edge32ln	%g3,	%i0,	%i3
	movrgez	%g6,	0x17F,	%l6
	sth	%g2,	[%l7 + 0x56]
	add	%i4,	0x0FD4,	%o5
	fmovsg	%icc,	%f10,	%f20
	array32	%o1,	%o6,	%o0
	edge32	%i2,	%g5,	%l5
	nop
	set	0x28, %g2
	sth	%i6,	[%l7 + %g2]
	array16	%l4,	%g4,	%l1
	movvc	%icc,	%o4,	%i7
	movle	%xcc,	%g7,	%l3
	orn	%g1,	%o2,	%i5
	addc	%o7,	0x0E46,	%l2
	movcc	%icc,	%l0,	%i1
	edge16l	%g3,	%o3,	%i3
	array32	%g6,	%l6,	%g2
	ld	[%l7 + 0x2C],	%f11
	xorcc	%i0,	0x0361,	%i4
	fexpand	%f22,	%f24
	alignaddr	%o1,	%o5,	%o0
	andn	%i2,	0x0F51,	%g5
	movle	%xcc,	%l5,	%o6
	fmovs	%f9,	%f2
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	smul	%l1,	%o4,	%g4
	andcc	%g7,	%i7,	%g1
	ldx	[%l7 + 0x50],	%o2
	fmovdcs	%xcc,	%f18,	%f0
	lduh	[%l7 + 0x12],	%i5
	sllx	%o7,	0x05,	%l3
	ldx	[%l7 + 0x08],	%l0
	ldsw	[%l7 + 0x50],	%i1
	sdiv	%g3,	0x19CB,	%l2
	edge32l	%i3,	%o3,	%g6
	fpsub32s	%f27,	%f31,	%f21
	nop
	set	0x7C, %o0
	lduh	[%l7 + %o0],	%g2
	movvs	%xcc,	%i0,	%i4
	movge	%xcc,	%o1,	%o5
	fnands	%f10,	%f14,	%f26
	movrne	%l6,	%i2,	%o0
	xorcc	%g5,	%o6,	%l5
	xor	%l4,	0x0CD2,	%i6
	popc	0x0580,	%l1
	xorcc	%o4,	%g7,	%g4
	movgu	%icc,	%g1,	%o2
	array16	%i7,	%i5,	%l3
	fpsub32s	%f9,	%f23,	%f3
	fabsd	%f6,	%f24
	fmovrdne	%l0,	%f16,	%f28
	alignaddr	%i1,	%g3,	%l2
	edge16l	%o7,	%o3,	%i3
	fcmps	%fcc1,	%f21,	%f9
	edge8n	%g2,	%g6,	%i0
	bshuffle	%f14,	%f22,	%f14
	fmovdle	%icc,	%f24,	%f18
	movcs	%icc,	%o1,	%o5
	movre	%l6,	%i2,	%o0
	fxnors	%f13,	%f27,	%f29
	edge32	%i4,	%g5,	%o6
	umul	%l5,	%l4,	%i6
	array32	%l1,	%g7,	%g4
	fnot2	%f14,	%f4
	ldsb	[%l7 + 0x41],	%g1
	add	%o2,	%o4,	%i5
	fpadd16	%f4,	%f12,	%f12
	srlx	%i7,	0x0A,	%l0
	save %i1, %g3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%l2,	%f0,	%f25
	popc	%o3,	%o7
	andn	%g2,	%g6,	%i0
	ldub	[%l7 + 0x3E],	%o1
	fmovsvc	%icc,	%f19,	%f30
	stw	%i3,	[%l7 + 0x48]
	movrgz	%l6,	0x0F8,	%o5
	xnor	%i2,	0x1569,	%i4
	movrne	%o0,	0x044,	%g5
	fmovrse	%l5,	%f11,	%f2
	sethi	0x1129,	%o6
	srax	%i6,	%l4,	%l1
	movcs	%icc,	%g7,	%g4
	subcc	%g1,	%o2,	%o4
	srl	%i5,	%l0,	%i1
	ldub	[%l7 + 0x31],	%i7
	addcc	%g3,	%l2,	%l3
	for	%f4,	%f2,	%f0
	xnorcc	%o7,	%o3,	%g2
	movre	%g6,	0x04C,	%o1
	sdivx	%i3,	0x0865,	%i0
	movre	%l6,	0x372,	%o5
	xnorcc	%i2,	0x1DC6,	%i4
	add	%g5,	0x0324,	%l5
	movleu	%xcc,	%o6,	%o0
	sethi	0x0AB0,	%l4
	or	%l1,	0x166C,	%g7
	movvs	%xcc,	%g4,	%g1
	movrgez	%o2,	0x1C1,	%i6
	fsrc1s	%f4,	%f11
	edge16ln	%i5,	%l0,	%i1
	fors	%f19,	%f26,	%f15
	fmul8sux16	%f30,	%f8,	%f12
	movgu	%xcc,	%o4,	%i7
	ldx	[%l7 + 0x30],	%l2
	umul	%l3,	%o7,	%g3
	edge32l	%o3,	%g2,	%o1
	sub	%g6,	%i0,	%l6
	srlx	%i3,	%o5,	%i4
	sdivcc	%i2,	0x10C7,	%g5
	lduw	[%l7 + 0x68],	%l5
	movleu	%xcc,	%o6,	%o0
	fmovrsgz	%l4,	%f1,	%f5
	ldx	[%l7 + 0x10],	%g7
	fpsub16	%f28,	%f20,	%f4
	movvc	%icc,	%g4,	%g1
	fmovdl	%icc,	%f26,	%f3
	restore %l1, %i6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x68],	%f0
	sdivx	%l0,	0x1209,	%o2
	ldsb	[%l7 + 0x7D],	%i1
	ldx	[%l7 + 0x10],	%o4
	fmovrsgez	%l2,	%f23,	%f27
	movvs	%icc,	%i7,	%l3
	orn	%o7,	0x0076,	%o3
	fmovdvs	%xcc,	%f6,	%f26
	movrgez	%g3,	%g2,	%o1
	add	%i0,	0x13A5,	%g6
	add	%i3,	0x1EB1,	%o5
	mulscc	%i4,	%i2,	%g5
	array8	%l5,	%l6,	%o6
	bshuffle	%f30,	%f18,	%f6
	xor	%o0,	0x1988,	%g7
	move	%xcc,	%l4,	%g1
	movg	%xcc,	%l1,	%g4
	sllx	%i5,	0x0B,	%l0
	fone	%f28
	sethi	0x1D9F,	%o2
	ldsb	[%l7 + 0x7D],	%i6
	edge16ln	%i1,	%l2,	%i7
	sub	%l3,	0x1CD5,	%o7
	movre	%o4,	0x062,	%g3
	sub	%o3,	%g2,	%o1
	movrgez	%g6,	%i3,	%o5
	and	%i0,	%i2,	%i4
	ld	[%l7 + 0x6C],	%f31
	addccc	%g5,	0x0426,	%l6
	sdivx	%o6,	0x1258,	%o0
	fpsub16s	%f17,	%f29,	%f15
	lduw	[%l7 + 0x58],	%l5
	sdivcc	%g7,	0x1C7C,	%l4
	movpos	%icc,	%l1,	%g4
	andcc	%i5,	%l0,	%g1
	sub	%o2,	0x171D,	%i6
	edge32l	%l2,	%i7,	%i1
	sll	%l3,	0x1A,	%o4
	smul	%g3,	%o3,	%o7
	movrne	%g2,	0x10C,	%g6
	movvc	%icc,	%i3,	%o1
	andcc	%i0,	%o5,	%i2
	movge	%xcc,	%i4,	%g5
	udiv	%l6,	0x0499,	%o6
	movn	%xcc,	%l5,	%o0
	fmovs	%f31,	%f18
	edge32n	%l4,	%l1,	%g7
	ldub	[%l7 + 0x42],	%g4
	xorcc	%l0,	0x1E30,	%i5
	umulcc	%o2,	%i6,	%g1
	lduh	[%l7 + 0x24],	%l2
	lduh	[%l7 + 0x5A],	%i1
	ldd	[%l7 + 0x18],	%f24
	for	%f0,	%f10,	%f16
	andncc	%l3,	%o4,	%g3
	sub	%o3,	%o7,	%g2
	edge8	%g6,	%i3,	%o1
	fzeros	%f16
	ldd	[%l7 + 0x50],	%i0
	edge8n	%o5,	%i2,	%i4
	udivcc	%g5,	0x06F6,	%i7
	std	%f2,	[%l7 + 0x38]
	faligndata	%f2,	%f4,	%f2
	sethi	0x0CC0,	%o6
	fmovrsne	%l5,	%f1,	%f7
	or	%o0,	%l6,	%l1
	ldsh	[%l7 + 0x3E],	%l4
	sra	%g7,	0x06,	%l0
	edge32n	%i5,	%g4,	%o2
	fxor	%f18,	%f2,	%f4
	edge8ln	%g1,	%l2,	%i6
	alignaddr	%l3,	%o4,	%i1
	add	%o3,	0x0FCE,	%g3
	movpos	%icc,	%o7,	%g6
	nop
	set	0x24, %l0
	ldsh	[%l7 + %l0],	%g2
	movrgz	%i3,	%o1,	%i0
	edge16	%o5,	%i2,	%i4
	subcc	%g5,	%i7,	%o6
	sllx	%l5,	%o0,	%l6
	edge16n	%l4,	%g7,	%l1
	edge16ln	%l0,	%i5,	%o2
	movcs	%xcc,	%g1,	%l2
	fmovrdgez	%g4,	%f8,	%f28
	fpack32	%f24,	%f18,	%f16
	movgu	%icc,	%l3,	%i6
	ldub	[%l7 + 0x68],	%i1
	xnor	%o4,	0x1FD0,	%o3
	ld	[%l7 + 0x08],	%f23
	umulcc	%g3,	0x09BB,	%g6
	subc	%g2,	%i3,	%o7
	movcc	%xcc,	%o1,	%i0
	edge32l	%i2,	%o5,	%i4
	ldd	[%l7 + 0x68],	%i6
	movneg	%icc,	%o6,	%l5
	and	%g5,	0x0A0F,	%o0
	ldsb	[%l7 + 0x66],	%l6
	fmul8x16al	%f11,	%f26,	%f26
	sth	%l4,	[%l7 + 0x6C]
	andn	%l1,	%g7,	%i5
	fnot2s	%f29,	%f25
	movcs	%xcc,	%o2,	%g1
	array32	%l0,	%g4,	%l3
	edge8n	%l2,	%i1,	%i6
	ldd	[%l7 + 0x10],	%o4
	array8	%g3,	%g6,	%o3
	orcc	%g2,	0x1F3F,	%o7
	fmovrde	%o1,	%f18,	%f8
	movcs	%icc,	%i3,	%i2
	addc	%i0,	%i4,	%o5
	edge8n	%i7,	%o6,	%l5
	movrgz	%g5,	0x1AF,	%o0
	addcc	%l6,	0x1F68,	%l1
	and	%g7,	0x1D91,	%i5
	fcmpgt32	%f2,	%f26,	%l4
	edge16ln	%g1,	%o2,	%l0
	fmovdl	%icc,	%f4,	%f14
	movgu	%icc,	%l3,	%g4
	movle	%xcc,	%i1,	%i6
	andn	%o4,	0x1DB8,	%l2
	fmovrslez	%g6,	%f11,	%f21
	st	%f21,	[%l7 + 0x40]
	andncc	%o3,	%g3,	%o7
	mulscc	%o1,	0x1F20,	%g2
	edge8n	%i2,	%i3,	%i0
	sth	%i4,	[%l7 + 0x54]
	lduh	[%l7 + 0x64],	%i7
	movrgez	%o6,	0x187,	%l5
	ldub	[%l7 + 0x7D],	%o5
	fzeros	%f30
	orncc	%o0,	%l6,	%l1
	mova	%icc,	%g7,	%i5
	fmovdn	%icc,	%f3,	%f7
	fmovdcc	%xcc,	%f3,	%f25
	fmovrslez	%g5,	%f25,	%f13
	and	%l4,	%o2,	%g1
	movne	%xcc,	%l0,	%g4
	alignaddrl	%l3,	%i1,	%o4
	movrgez	%i6,	%l2,	%o3
	alignaddrl	%g6,	%g3,	%o1
	sethi	0x0143,	%o7
	fcmpeq16	%f14,	%f12,	%i2
	addccc	%i3,	0x1259,	%i0
	sth	%g2,	[%l7 + 0x50]
	umulcc	%i4,	0x1479,	%i7
	addccc	%o6,	0x06C8,	%l5
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	udiv	%l6,	0x03B4,	%g7
	save %l1, 0x1BAD, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x18],	%g5
	movrne	%o2,	%g1,	%l4
	andn	%g4,	0x0ECC,	%l3
	subc	%l0,	0x120A,	%o4
	fxnor	%f24,	%f22,	%f12
	addccc	%i6,	0x110E,	%l2
	sll	%i1,	0x0C,	%o3
	sdiv	%g3,	0x00F2,	%g6
	udivcc	%o7,	0x0F41,	%i2
	sth	%i3,	[%l7 + 0x12]
	stw	%o1,	[%l7 + 0x70]
	move	%xcc,	%i0,	%i4
	sth	%g2,	[%l7 + 0x3C]
	fxnors	%f25,	%f5,	%f29
	std	%f26,	[%l7 + 0x28]
	ldub	[%l7 + 0x1F],	%o6
	mulx	%i7,	%o5,	%o0
	fmovrsne	%l6,	%f18,	%f23
	fmovd	%f20,	%f30
	stw	%g7,	[%l7 + 0x38]
	edge32l	%l5,	%i5,	%l1
	srlx	%o2,	%g5,	%g1
	restore %l4, 0x129B, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l0,	0x060D,	%o4
	movrgez	%l3,	%l2,	%i6
	fcmpgt32	%f26,	%f4,	%i1
	fmovrdlz	%o3,	%f2,	%f24
	movvc	%icc,	%g3,	%o7
	edge32ln	%i2,	%i3,	%o1
	edge16	%i0,	%g6,	%g2
	movle	%xcc,	%o6,	%i7
	andncc	%o5,	%i4,	%l6
	movleu	%icc,	%o0,	%l5
	sth	%i5,	[%l7 + 0x46]
	fcmps	%fcc2,	%f0,	%f23
	movre	%g7,	%o2,	%g5
	fmovdg	%xcc,	%f11,	%f26
	ldd	[%l7 + 0x58],	%f16
	move	%icc,	%l1,	%g1
	sdivx	%g4,	0x0BBD,	%l0
	fmovrse	%o4,	%f16,	%f9
	movrgz	%l3,	0x315,	%l4
	movgu	%icc,	%i6,	%l2
	smulcc	%o3,	%g3,	%o7
	addccc	%i1,	%i2,	%o1
	fone	%f10
	fsrc1	%f12,	%f6
	sra	%i0,	0x0A,	%g6
	edge8l	%g2,	%i3,	%i7
	movcc	%xcc,	%o6,	%i4
	movre	%o5,	0x0A2,	%o0
	move	%icc,	%l5,	%i5
	fnot2	%f22,	%f18
	fmovrslz	%g7,	%f29,	%f0
	movrne	%l6,	0x209,	%g5
	andcc	%o2,	0x1008,	%g1
	addccc	%g4,	%l1,	%l0
	addcc	%l3,	%l4,	%o4
	ldub	[%l7 + 0x7F],	%i6
	fmovrslz	%l2,	%f20,	%f5
	fmovsneg	%icc,	%f7,	%f12
	addc	%o3,	%o7,	%i1
	fmovdleu	%xcc,	%f8,	%f31
	sub	%g3,	%o1,	%i0
	movrlez	%i2,	0x0C3,	%g6
	movneg	%icc,	%g2,	%i7
	fmovspos	%icc,	%f26,	%f25
	fpack16	%f26,	%f30
	fmovrse	%o6,	%f23,	%f18
	srl	%i3,	%i4,	%o5
	bshuffle	%f2,	%f22,	%f8
	fandnot2s	%f16,	%f6,	%f26
	movcs	%xcc,	%l5,	%o0
	ldsw	[%l7 + 0x5C],	%i5
	nop
	set	0x63, %l2
	ldub	[%l7 + %l2],	%g7
	stb	%g5,	[%l7 + 0x2C]
	movleu	%xcc,	%l6,	%g1
	movn	%icc,	%g4,	%o2
	edge16	%l0,	%l1,	%l4
	fmovscc	%xcc,	%f9,	%f20
	sethi	0x0FFB,	%o4
	edge32ln	%i6,	%l2,	%o3
	movgu	%icc,	%l3,	%o7
	smul	%g3,	%o1,	%i0
	ldsw	[%l7 + 0x5C],	%i1
	movvs	%xcc,	%i2,	%g6
	udiv	%g2,	0x1EC8,	%o6
	umul	%i3,	%i7,	%o5
	umul	%i4,	0x1F50,	%o0
	addcc	%i5,	%l5,	%g7
	ldsh	[%l7 + 0x0E],	%l6
	udiv	%g1,	0x0E64,	%g4
	sethi	0x1C1E,	%g5
	addcc	%l0,	0x0679,	%l1
	lduh	[%l7 + 0x3A],	%l4
	ldsw	[%l7 + 0x44],	%o4
	ldx	[%l7 + 0x78],	%o2
	fpsub16s	%f24,	%f2,	%f2
	lduh	[%l7 + 0x2E],	%l2
	movgu	%icc,	%o3,	%l3
	udivcc	%i6,	0x14FC,	%o7
	andncc	%g3,	%i0,	%i1
	fsrc1	%f30,	%f8
	smul	%o1,	0x1118,	%i2
	ld	[%l7 + 0x18],	%f13
	ldd	[%l7 + 0x48],	%g2
	addcc	%g6,	0x02FC,	%o6
	sdivcc	%i3,	0x1507,	%i7
	movleu	%xcc,	%i4,	%o5
	orn	%o0,	%l5,	%i5
	movneg	%icc,	%g7,	%l6
	fmovdne	%icc,	%f27,	%f12
	edge16n	%g4,	%g5,	%g1
	orncc	%l0,	0x04E1,	%l1
	save %l4, 0x15D0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l2,	%o3,	%l3
	edge16n	%o2,	%o7,	%g3
	movge	%icc,	%i0,	%i6
	fcmpeq16	%f30,	%f2,	%i1
	movleu	%icc,	%o1,	%g2
	array16	%i2,	%g6,	%i3
	edge32l	%o6,	%i7,	%o5
	movrlz	%i4,	%o0,	%i5
	fcmpes	%fcc1,	%f27,	%f28
	sll	%l5,	%l6,	%g4
	fpsub32	%f22,	%f0,	%f16
	movge	%xcc,	%g7,	%g1
	sdiv	%g5,	0x0537,	%l0
	fnot2s	%f25,	%f11
	movg	%xcc,	%l4,	%l1
	orcc	%l2,	0x0DB1,	%o4
	std	%f30,	[%l7 + 0x30]
	lduh	[%l7 + 0x56],	%o3
	edge32ln	%o2,	%o7,	%l3
	fmovdneg	%icc,	%f3,	%f28
	array8	%g3,	%i0,	%i6
	edge8l	%i1,	%g2,	%i2
	sub	%o1,	%g6,	%i3
	fmovdleu	%icc,	%f5,	%f13
	movne	%icc,	%o6,	%i7
	fpsub16	%f14,	%f8,	%f18
	popc	0x0B4D,	%i4
	fornot2s	%f13,	%f13,	%f1
	fandnot1	%f26,	%f18,	%f6
	sethi	0x076C,	%o0
	sdiv	%i5,	0x1E01,	%l5
	move	%xcc,	%l6,	%g4
	add	%o5,	%g7,	%g1
	array8	%l0,	%g5,	%l4
	udiv	%l2,	0x16DE,	%l1
	sdivcc	%o3,	0x0A68,	%o2
	sethi	0x1F99,	%o4
	movgu	%icc,	%o7,	%g3
	fmuld8ulx16	%f31,	%f11,	%f10
	edge8ln	%i0,	%i6,	%i1
	ldub	[%l7 + 0x3D],	%g2
	movl	%xcc,	%l3,	%i2
	ldub	[%l7 + 0x77],	%o1
	udiv	%i3,	0x1C3D,	%g6
	udivcc	%i7,	0x0094,	%i4
	movcc	%icc,	%o6,	%i5
	edge16ln	%o0,	%l5,	%g4
	edge8n	%l6,	%g7,	%o5
	movvs	%icc,	%l0,	%g5
	fpadd32s	%f12,	%f17,	%f30
	sra	%g1,	%l2,	%l1
	sllx	%o3,	0x0E,	%o2
	andn	%o4,	%o7,	%l4
	fcmped	%fcc0,	%f28,	%f28
	mulx	%g3,	%i6,	%i1
	sdiv	%i0,	0x183B,	%g2
	or	%l3,	%i2,	%o1
	stb	%g6,	[%l7 + 0x1B]
	edge8ln	%i3,	%i7,	%o6
	mova	%xcc,	%i4,	%i5
	move	%icc,	%o0,	%g4
	fxor	%f0,	%f10,	%f12
	fandnot1	%f10,	%f18,	%f0
	fmovsg	%xcc,	%f9,	%f28
	orncc	%l5,	%g7,	%l6
	umul	%l0,	%g5,	%o5
	stb	%l2,	[%l7 + 0x0B]
	fandnot1	%f20,	%f0,	%f28
	sdivcc	%g1,	0x0E63,	%l1
	movvs	%xcc,	%o3,	%o4
	xorcc	%o2,	0x0F18,	%l4
	movrne	%g3,	0x326,	%o7
	fmovscs	%icc,	%f10,	%f23
	andn	%i6,	0x0944,	%i0
	fmovdneg	%xcc,	%f0,	%f4
	movcs	%icc,	%i1,	%l3
	fmovrdlz	%g2,	%f4,	%f10
	ldub	[%l7 + 0x34],	%o1
	sdivcc	%g6,	0x0AC1,	%i2
	fnor	%f6,	%f6,	%f30
	sir	0x1BE5
	fpadd16s	%f11,	%f19,	%f27
	sdiv	%i7,	0x0C3A,	%i3
	andcc	%i4,	0x0C94,	%i5
	xnorcc	%o0,	%o6,	%l5
	xnorcc	%g7,	%l6,	%g4
	stw	%g5,	[%l7 + 0x34]
	fmuld8ulx16	%f6,	%f11,	%f20
	move	%icc,	%l0,	%l2
	mova	%icc,	%o5,	%g1
	edge8ln	%o3,	%l1,	%o2
	xorcc	%o4,	0x087A,	%g3
	ldub	[%l7 + 0x75],	%o7
	fmovdgu	%icc,	%f18,	%f9
	xorcc	%l4,	%i6,	%i0
	ldsb	[%l7 + 0x45],	%l3
	movpos	%xcc,	%i1,	%o1
	fnot2	%f14,	%f24
	movneg	%xcc,	%g2,	%i2
	orncc	%i7,	%i3,	%g6
	sdivx	%i5,	0x1D4C,	%o0
	movrlez	%i4,	%l5,	%o6
	std	%f14,	[%l7 + 0x18]
	movgu	%xcc,	%g7,	%l6
	fmovdle	%icc,	%f30,	%f11
	movleu	%xcc,	%g5,	%l0
	orncc	%l2,	0x0C10,	%o5
	movge	%icc,	%g4,	%o3
	movcc	%icc,	%g1,	%l1
	movn	%icc,	%o4,	%o2
	sdivcc	%o7,	0x1B09,	%g3
	subcc	%l4,	%i6,	%i0
	fnegd	%f8,	%f22
	fmovsle	%icc,	%f11,	%f9
	fandnot1	%f28,	%f10,	%f14
	mulx	%l3,	0x0144,	%i1
	fornot1s	%f10,	%f2,	%f13
	fmul8sux16	%f8,	%f14,	%f28
	movpos	%icc,	%g2,	%o1
	edge16l	%i2,	%i7,	%i3
	sir	0x1F56
	sra	%i5,	%g6,	%o0
	movg	%xcc,	%l5,	%o6
	stb	%i4,	[%l7 + 0x79]
	umul	%l6,	0x0585,	%g7
	movrlz	%g5,	0x25D,	%l0
	xorcc	%l2,	%o5,	%g4
	movcc	%icc,	%g1,	%l1
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fmovrslez	%o3,	%f4,	%f12
	edge8n	%g3,	%o7,	%l4
	movrgz	%i6,	0x253,	%l3
	movn	%xcc,	%i0,	%g2
	fnands	%f8,	%f4,	%f20
	movrne	%i1,	0x233,	%i2
	edge32ln	%o1,	%i7,	%i5
	sdivcc	%i3,	0x0B98,	%o0
	sub	%l5,	0x0023,	%g6
	lduh	[%l7 + 0x54],	%o6
	restore %i4, 0x1309, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g5,	%l0,	%g7
	edge32l	%l2,	%o5,	%g1
	movleu	%xcc,	%l1,	%o4
	std	%f26,	[%l7 + 0x68]
	ld	[%l7 + 0x58],	%f6
	movrlez	%o2,	%g4,	%g3
	nop
	set	0x20, %i3
	std	%f22,	[%l7 + %i3]
	movne	%xcc,	%o3,	%l4
	fmovd	%f14,	%f2
	andcc	%o7,	0x0599,	%l3
	xorcc	%i6,	%g2,	%i1
	sllx	%i2,	%o1,	%i7
	fmovse	%icc,	%f31,	%f23
	movge	%icc,	%i0,	%i5
	sdivx	%i3,	0x0491,	%o0
	mulscc	%g6,	0x1F42,	%o6
	movvc	%icc,	%i4,	%l6
	fmovrdlz	%g5,	%f10,	%f22
	popc	%l5,	%g7
	orn	%l0,	%o5,	%g1
	xor	%l2,	0x113A,	%l1
	sethi	0x0DE4,	%o4
	sub	%g4,	0x1617,	%g3
	fnegs	%f21,	%f27
	movgu	%xcc,	%o3,	%l4
	edge8n	%o7,	%l3,	%i6
	andn	%o2,	%g2,	%i1
	fmovda	%icc,	%f30,	%f19
	edge8l	%o1,	%i2,	%i0
	sub	%i5,	%i3,	%o0
	fzeros	%f16
	edge32l	%i7,	%g6,	%o6
	fmovrse	%l6,	%f0,	%f13
	alignaddr	%i4,	%g5,	%g7
	or	%l5,	0x0404,	%o5
	or	%g1,	%l0,	%l1
	fnot1s	%f7,	%f6
	fmovsgu	%icc,	%f18,	%f28
	st	%f25,	[%l7 + 0x60]
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	fmovsgu	%icc,	%f25,	%f31
	fmovse	%icc,	%f0,	%f9
	sth	%g4,	[%l7 + 0x1A]
	ld	[%l7 + 0x40],	%f10
	ldsh	[%l7 + 0x12],	%g3
	addc	%l4,	%o7,	%l3
	andcc	%o3,	%i6,	%o2
	movrlz	%g2,	%o1,	%i1
	addcc	%i0,	0x026F,	%i5
	fsrc1s	%f28,	%f7
	lduh	[%l7 + 0x40],	%i2
	stx	%i3,	[%l7 + 0x18]
	alignaddrl	%i7,	%g6,	%o6
	mulscc	%l6,	%o0,	%g5
	fmovrde	%g7,	%f18,	%f16
	edge32	%i4,	%o5,	%g1
	sdivx	%l5,	0x02E6,	%l0
	stb	%l1,	[%l7 + 0x72]
	srl	%o4,	0x0F,	%l2
	orncc	%g3,	0x1F4A,	%l4
	edge8	%o7,	%g4,	%o3
	fmovdneg	%xcc,	%f5,	%f4
	for	%f10,	%f18,	%f30
	movle	%icc,	%l3,	%i6
	edge16n	%o2,	%g2,	%i1
	movg	%icc,	%o1,	%i0
	fpsub16s	%f10,	%f20,	%f7
	fmuld8sux16	%f20,	%f27,	%f14
	subc	%i5,	%i2,	%i7
	mulscc	%g6,	0x0508,	%i3
	subcc	%o6,	%o0,	%l6
	st	%f9,	[%l7 + 0x6C]
	srax	%g5,	0x05,	%g7
	edge32ln	%o5,	%g1,	%i4
	addccc	%l5,	0x087A,	%l1
	sdivx	%l0,	0x19FC,	%o4
	fxnor	%f30,	%f2,	%f24
	addcc	%g3,	%l4,	%o7
	movrgez	%l2,	0x0E0,	%o3
	fandnot1s	%f21,	%f14,	%f8
	sub	%g4,	0x0C21,	%i6
	srl	%l3,	%o2,	%i1
	fpsub32	%f12,	%f2,	%f24
	sllx	%o1,	%i0,	%i5
	orcc	%g2,	%i7,	%i2
	subccc	%i3,	%g6,	%o0
	smulcc	%l6,	0x14B0,	%g5
	save %o6, %o5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i4,	[%l7 + 0x4C]
	sllx	%g7,	%l1,	%l0
	movn	%xcc,	%o4,	%g3
	smul	%l4,	0x1B23,	%l5
	alignaddr	%l2,	%o7,	%o3
	fmuld8ulx16	%f19,	%f24,	%f12
	fmovrde	%g4,	%f6,	%f0
	fpmerge	%f16,	%f17,	%f22
	stw	%l3,	[%l7 + 0x30]
	movneg	%icc,	%o2,	%i1
	sir	0x11F5
	nop
	set	0x10, %l1
	ldd	[%l7 + %l1],	%f2
	save %i6, 0x03A4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o1,	0x0994,	%g2
	movl	%xcc,	%i7,	%i5
	alignaddrl	%i2,	%i3,	%g6
	fmovscs	%xcc,	%f2,	%f16
	array8	%o0,	%l6,	%g5
	std	%f0,	[%l7 + 0x38]
	andn	%o6,	%o5,	%g1
	ldsw	[%l7 + 0x40],	%i4
	mulx	%g7,	0x160B,	%l0
	fmovdpos	%icc,	%f18,	%f12
	edge16ln	%l1,	%o4,	%l4
	movrne	%g3,	%l2,	%l5
	ld	[%l7 + 0x6C],	%f15
	subccc	%o3,	0x1B96,	%o7
	mulscc	%l3,	0x0A59,	%o2
	sth	%g4,	[%l7 + 0x10]
	sll	%i1,	%i6,	%o1
	sra	%i0,	0x14,	%g2
	xnorcc	%i5,	%i2,	%i7
	edge16n	%i3,	%o0,	%l6
	xorcc	%g5,	0x13FB,	%o6
	fcmple16	%f22,	%f20,	%o5
	sllx	%g1,	%i4,	%g7
	fmovrdne	%g6,	%f2,	%f18
	fand	%f16,	%f8,	%f0
	sethi	0x04CC,	%l0
	movneg	%icc,	%o4,	%l1
	movle	%icc,	%g3,	%l4
	sdivcc	%l5,	0x0392,	%l2
	sll	%o7,	0x07,	%o3
	srax	%l3,	%g4,	%i1
	stb	%i6,	[%l7 + 0x63]
	fpsub32	%f12,	%f20,	%f30
	fmovsleu	%icc,	%f18,	%f18
	edge8n	%o2,	%o1,	%g2
	movcs	%icc,	%i0,	%i2
	fornot1s	%f31,	%f3,	%f10
	movrne	%i5,	%i7,	%i3
	ldd	[%l7 + 0x58],	%f10
	movn	%xcc,	%l6,	%o0
	xnor	%g5,	0x16A1,	%o5
	movcs	%icc,	%o6,	%i4
	edge16n	%g7,	%g1,	%g6
	fornot1	%f6,	%f4,	%f14
	edge16n	%l0,	%o4,	%l1
	fnegd	%f12,	%f10
	movgu	%xcc,	%l4,	%g3
	restore %l5, %o7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%l3,	%o3
	fcmpeq16	%f4,	%f20,	%g4
	movre	%i1,	0x2F4,	%i6
	edge32	%o1,	%g2,	%o2
	edge16ln	%i0,	%i2,	%i5
	nop
	set	0x16, %o2
	ldub	[%l7 + %o2],	%i3
	xor	%i7,	0x1038,	%o0
	udivcc	%g5,	0x04C2,	%l6
	mulx	%o5,	0x013B,	%i4
	fandnot2	%f22,	%f24,	%f2
	fnand	%f12,	%f14,	%f6
	save %g7, %o6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g6,	0x13,	%l0
	mulx	%o4,	%l4,	%g3
	fornot2	%f30,	%f16,	%f22
	ldub	[%l7 + 0x12],	%l5
	movvc	%xcc,	%o7,	%l1
	ldsw	[%l7 + 0x30],	%l3
	sir	0x0D5F
	xorcc	%l2,	0x16CE,	%o3
	fpadd32s	%f31,	%f1,	%f22
	fmovsa	%xcc,	%f0,	%f27
	xorcc	%i1,	%i6,	%g4
	movgu	%icc,	%g2,	%o2
	fand	%f30,	%f24,	%f4
	stx	%o1,	[%l7 + 0x58]
	movrgez	%i0,	%i2,	%i3
	movn	%icc,	%i7,	%o0
	edge32	%i5,	%g5,	%l6
	popc	0x1E63,	%i4
	fornot1s	%f15,	%f17,	%f25
	movrgez	%g7,	0x346,	%o5
	array16	%o6,	%g6,	%l0
	fmovrdgez	%o4,	%f30,	%f30
	fmovsle	%xcc,	%f6,	%f24
	movrgez	%l4,	0x01D,	%g3
	ldsw	[%l7 + 0x60],	%g1
	sth	%o7,	[%l7 + 0x24]
	fnegd	%f20,	%f10
	movrgz	%l1,	0x2A4,	%l3
	addcc	%l5,	0x01EE,	%o3
	sir	0x180D
	popc	%i1,	%i6
	sdiv	%l2,	0x0925,	%g4
	edge16	%o2,	%o1,	%i0
	subc	%i2,	0x0675,	%g2
	sdivcc	%i7,	0x037B,	%i3
	orn	%o0,	%g5,	%l6
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	or	%i5,	0x1C95,	%o5
	fand	%f6,	%f2,	%f26
	lduh	[%l7 + 0x5A],	%o6
	movleu	%icc,	%g6,	%o4
	xorcc	%l0,	0x0041,	%l4
	subc	%g1,	%g3,	%o7
	fmul8sux16	%f4,	%f8,	%f24
	movvc	%xcc,	%l1,	%l3
	mulscc	%o3,	0x0C5E,	%l5
	array8	%i6,	%l2,	%g4
	movrgez	%o2,	%i1,	%o1
	addc	%i0,	0x1B51,	%g2
	movre	%i7,	0x26A,	%i3
	ld	[%l7 + 0x5C],	%f2
	subc	%o0,	%i2,	%l6
	nop
	set	0x28, %g4
	stx	%g5,	[%l7 + %g4]
	std	%f22,	[%l7 + 0x30]
	fmovsle	%icc,	%f13,	%f12
	fmovsne	%icc,	%f30,	%f11
	ldsw	[%l7 + 0x40],	%i4
	fmovdvs	%icc,	%f7,	%f3
	fmovrse	%g7,	%f14,	%f7
	edge8n	%o5,	%o6,	%i5
	fnot2s	%f25,	%f1
	ldsh	[%l7 + 0x2E],	%g6
	sdivcc	%l0,	0x0082,	%o4
	array16	%l4,	%g3,	%o7
	fpack32	%f2,	%f6,	%f8
	or	%l1,	0x0C06,	%l3
	edge32n	%o3,	%g1,	%l5
	fnot1	%f12,	%f2
	ldub	[%l7 + 0x39],	%i6
	ld	[%l7 + 0x7C],	%f8
	orn	%g4,	%l2,	%o2
	edge8n	%o1,	%i0,	%i1
	fors	%f15,	%f19,	%f25
	fmul8x16	%f3,	%f4,	%f0
	sllx	%g2,	%i7,	%o0
	add	%i3,	%i2,	%l6
	ld	[%l7 + 0x40],	%f1
	addccc	%g5,	%i4,	%o5
	fmovs	%f13,	%f12
	movrlez	%g7,	0x387,	%o6
	movge	%xcc,	%g6,	%i5
	movge	%icc,	%o4,	%l0
	mulx	%g3,	%l4,	%o7
	sdivcc	%l3,	0x18AC,	%o3
	ldsb	[%l7 + 0x27],	%g1
	alignaddr	%l1,	%l5,	%i6
	or	%l2,	%g4,	%o1
	addcc	%i0,	0x0A80,	%o2
	fmul8sux16	%f4,	%f4,	%f6
	fmovdvs	%icc,	%f28,	%f0
	fpadd32	%f6,	%f30,	%f22
	fmovrdgz	%g2,	%f22,	%f26
	sir	0x0FB4
	srl	%i1,	0x01,	%o0
	xor	%i7,	%i2,	%i3
	umulcc	%l6,	%i4,	%g5
	movrgez	%g7,	%o5,	%g6
	fnand	%f4,	%f20,	%f0
	fcmpes	%fcc3,	%f2,	%f31
	fors	%f10,	%f9,	%f21
	edge32ln	%o6,	%o4,	%l0
	movleu	%icc,	%i5,	%l4
	sra	%g3,	%l3,	%o3
	fpadd32	%f12,	%f0,	%f8
	andn	%g1,	0x010B,	%l1
	ldsw	[%l7 + 0x18],	%o7
	movrgez	%i6,	0x3A0,	%l2
	fcmpeq16	%f2,	%f26,	%l5
	save %o1, 0x18A4, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f18,	%f8,	%f10
	edge8ln	%o2,	%g2,	%i0
	fmovsvs	%icc,	%f30,	%f10
	ldd	[%l7 + 0x30],	%o0
	fsrc2s	%f19,	%f23
	stw	%i1,	[%l7 + 0x1C]
	xnor	%i2,	%i3,	%i7
	movne	%icc,	%l6,	%i4
	sdivx	%g5,	0x0317,	%o5
	movne	%xcc,	%g7,	%o6
	sth	%o4,	[%l7 + 0x1E]
	fnot1	%f2,	%f18
	array16	%g6,	%l0,	%l4
	srlx	%g3,	%i5,	%o3
	array16	%g1,	%l1,	%o7
	udivcc	%l3,	0x07EA,	%i6
	movle	%xcc,	%l2,	%l5
	movcs	%icc,	%o1,	%o2
	orcc	%g4,	0x0952,	%i0
	edge16	%g2,	%o0,	%i2
	add	%i1,	%i7,	%l6
	stx	%i3,	[%l7 + 0x40]
	movpos	%xcc,	%g5,	%o5
	edge32ln	%i4,	%g7,	%o4
	ldsb	[%l7 + 0x55],	%g6
	ldsw	[%l7 + 0x68],	%o6
	sub	%l4,	%g3,	%i5
	sdivx	%l0,	0x149B,	%o3
	stw	%l1,	[%l7 + 0x20]
	fmovd	%f22,	%f0
	srax	%o7,	%g1,	%i6
	edge16n	%l2,	%l3,	%o1
	lduh	[%l7 + 0x22],	%l5
	movre	%g4,	%o2,	%i0
	movl	%xcc,	%g2,	%i2
	movcs	%xcc,	%o0,	%i7
	addcc	%i1,	0x14F5,	%i3
	fnot1	%f8,	%f0
	fmovs	%f1,	%f0
	andncc	%g5,	%l6,	%o5
	fpsub16	%f28,	%f14,	%f24
	srax	%i4,	%o4,	%g6
	smulcc	%o6,	0x0832,	%l4
	sir	0x0792
	movvs	%icc,	%g3,	%g7
	srax	%i5,	%o3,	%l0
	fpack32	%f14,	%f12,	%f10
	movcc	%icc,	%l1,	%g1
	orncc	%o7,	0x02C4,	%i6
	array32	%l3,	%o1,	%l5
	fcmps	%fcc0,	%f4,	%f27
	fand	%f18,	%f10,	%f8
	andcc	%l2,	%g4,	%i0
	fmovsneg	%xcc,	%f19,	%f19
	fpsub16s	%f7,	%f14,	%f2
	siam	0x3
	ldsh	[%l7 + 0x4C],	%o2
	fmovrse	%i2,	%f2,	%f0
	movle	%icc,	%g2,	%i7
	andcc	%i1,	%o0,	%i3
	movne	%xcc,	%g5,	%l6
	sdivcc	%i4,	0x126F,	%o4
	ldd	[%l7 + 0x20],	%g6
	lduh	[%l7 + 0x08],	%o5
	edge32ln	%o6,	%l4,	%g3
	edge16l	%i5,	%g7,	%o3
	movn	%icc,	%l0,	%l1
	alignaddrl	%g1,	%o7,	%l3
	movge	%xcc,	%i6,	%o1
	mulscc	%l2,	%g4,	%i0
	sir	0x0AAD
	fcmpes	%fcc3,	%f16,	%f30
	sth	%o2,	[%l7 + 0x50]
	edge8n	%l5,	%g2,	%i2
	move	%icc,	%i7,	%i1
	ldsw	[%l7 + 0x78],	%i3
	movpos	%xcc,	%o0,	%g5
	stb	%l6,	[%l7 + 0x3C]
	srlx	%o4,	0x0D,	%g6
	bshuffle	%f28,	%f26,	%f16
	fmovsl	%icc,	%f17,	%f3
	xnorcc	%i4,	0x0103,	%o6
	umul	%o5,	0x0544,	%g3
	st	%f24,	[%l7 + 0x24]
	movrne	%i5,	0x2A2,	%g7
	st	%f14,	[%l7 + 0x60]
	save %o3, 0x030E, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x08],	%l0
	udivx	%g1,	0x0F71,	%l1
	xnorcc	%o7,	%i6,	%o1
	edge16l	%l2,	%g4,	%i0
	fnand	%f26,	%f8,	%f28
	fornot2s	%f7,	%f16,	%f0
	sdivx	%l3,	0x017E,	%o2
	movle	%icc,	%g2,	%i2
	movvs	%xcc,	%i7,	%l5
	movn	%xcc,	%i3,	%o0
	fmovrdgz	%g5,	%f18,	%f18
	umulcc	%l6,	%i1,	%o4
	fandnot1	%f2,	%f20,	%f28
	stx	%g6,	[%l7 + 0x68]
	fmovdne	%xcc,	%f20,	%f2
	movvc	%xcc,	%o6,	%i4
	stw	%g3,	[%l7 + 0x60]
	stb	%o5,	[%l7 + 0x46]
	xnorcc	%g7,	%o3,	%i5
	alignaddr	%l4,	%g1,	%l0
	alignaddr	%l1,	%i6,	%o1
	sethi	0x0FD5,	%l2
	and	%g4,	0x0D5D,	%o7
	mulscc	%l3,	0x0215,	%i0
	sir	0x08C2
	fpsub16s	%f23,	%f26,	%f2
	addccc	%g2,	0x041D,	%o2
	ld	[%l7 + 0x70],	%f3
	sth	%i2,	[%l7 + 0x28]
	fmovspos	%icc,	%f2,	%f25
	smulcc	%i7,	%l5,	%o0
	lduw	[%l7 + 0x1C],	%i3
	movrgz	%g5,	%i1,	%l6
	movpos	%xcc,	%g6,	%o6
	edge16	%o4,	%g3,	%o5
	stw	%g7,	[%l7 + 0x58]
	stx	%i4,	[%l7 + 0x50]
	fmovsn	%icc,	%f9,	%f10
	fmovscc	%icc,	%f27,	%f18
	edge16ln	%i5,	%o3,	%l4
	ldsw	[%l7 + 0x18],	%l0
	addc	%l1,	%i6,	%g1
	fmovsgu	%xcc,	%f11,	%f11
	fandnot2s	%f31,	%f0,	%f13
	addc	%o1,	0x0255,	%g4
	nop
	set	0x38, %l5
	stw	%l2,	[%l7 + %l5]
	movl	%xcc,	%l3,	%i0
	restore %o7, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i2,	0x15B8,	%i7
	stx	%l5,	[%l7 + 0x18]
	sdiv	%o0,	0x1CAD,	%i3
	xnor	%i1,	0x1CF7,	%g5
	st	%f3,	[%l7 + 0x0C]
	popc	0x055C,	%l6
	fornot1	%f2,	%f30,	%f8
	sth	%o6,	[%l7 + 0x7C]
	ld	[%l7 + 0x54],	%f20
	st	%f8,	[%l7 + 0x28]
	sth	%g6,	[%l7 + 0x28]
	mulscc	%o4,	%o5,	%g7
	edge16	%g3,	%i4,	%o3
	mulx	%l4,	%i5,	%l0
	xnor	%i6,	%l1,	%g1
	ldsb	[%l7 + 0x28],	%g4
	fmovsa	%xcc,	%f14,	%f25
	nop
	set	0x30, %i7
	stw	%l2,	[%l7 + %i7]
	mulx	%l3,	%o1,	%o7
	udiv	%i0,	0x157E,	%g2
	mulscc	%o2,	%i7,	%i2
	edge8l	%o0,	%i3,	%i1
	fxor	%f24,	%f4,	%f2
	stw	%g5,	[%l7 + 0x70]
	fcmpgt16	%f8,	%f12,	%l5
	edge16	%o6,	%l6,	%g6
	srl	%o4,	%o5,	%g7
	movl	%xcc,	%i4,	%g3
	or	%o3,	0x0A77,	%i5
	fnors	%f30,	%f19,	%f5
	addcc	%l0,	0x0BD2,	%i6
	subccc	%l1,	%g1,	%g4
	fsrc2s	%f28,	%f27
	sth	%l4,	[%l7 + 0x1E]
	movneg	%xcc,	%l2,	%l3
	movrlz	%o7,	%o1,	%g2
	lduw	[%l7 + 0x38],	%i0
	popc	%o2,	%i2
	nop
	set	0x70, %i1
	stx	%o0,	[%l7 + %i1]
	add	%i3,	%i1,	%g5
	orcc	%i7,	%l5,	%o6
	sub	%g6,	%o4,	%l6
	save %o5, %g7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g3,	0x0451,	%i5
	ldsb	[%l7 + 0x12],	%o3
	fmul8x16al	%f27,	%f9,	%f26
	fcmped	%fcc0,	%f14,	%f16
	ld	[%l7 + 0x3C],	%f10
	edge16l	%i6,	%l0,	%g1
	fmul8x16al	%f11,	%f28,	%f28
	xnor	%g4,	0x0656,	%l1
	sdiv	%l4,	0x14A7,	%l3
	stb	%l2,	[%l7 + 0x40]
	fmul8ulx16	%f6,	%f6,	%f2
	ldub	[%l7 + 0x51],	%o7
	xnor	%g2,	%i0,	%o2
	andn	%i2,	0x07F8,	%o0
	add	%o1,	%i3,	%i1
	alignaddr	%g5,	%i7,	%o6
	movpos	%icc,	%l5,	%g6
	ldsb	[%l7 + 0x15],	%o4
	st	%f28,	[%l7 + 0x50]
	fmul8sux16	%f8,	%f4,	%f26
	nop
	set	0x47, %g7
	ldub	[%l7 + %g7],	%l6
	movne	%icc,	%g7,	%o5
	subc	%g3,	0x004A,	%i5
	sir	0x0A34
	stb	%o3,	[%l7 + 0x58]
	sth	%i6,	[%l7 + 0x2C]
	srlx	%l0,	%i4,	%g4
	ldub	[%l7 + 0x31],	%g1
	sth	%l1,	[%l7 + 0x3C]
	add	%l3,	%l4,	%l2
	fpadd16	%f18,	%f6,	%f18
	addccc	%g2,	%i0,	%o7
	fcmps	%fcc1,	%f6,	%f21
	subcc	%o2,	%i2,	%o0
	edge16n	%o1,	%i3,	%g5
	fmovs	%f8,	%f6
	movvc	%icc,	%i1,	%i7
	edge8	%l5,	%o6,	%o4
	addc	%g6,	%l6,	%o5
	fmul8ulx16	%f24,	%f8,	%f26
	orncc	%g7,	%i5,	%g3
	alignaddr	%o3,	%l0,	%i6
	ldsh	[%l7 + 0x22],	%i4
	ldd	[%l7 + 0x70],	%g0
	umulcc	%g4,	%l3,	%l1
	sub	%l2,	%l4,	%g2
	movleu	%icc,	%o7,	%i0
	subccc	%o2,	0x0CEF,	%i2
	movgu	%xcc,	%o1,	%o0
	stw	%i3,	[%l7 + 0x24]
	fpadd16s	%f24,	%f22,	%f3
	edge32ln	%g5,	%i7,	%l5
	movneg	%icc,	%o6,	%i1
	nop
	set	0x40, %i6
	std	%f28,	[%l7 + %i6]
	ldsb	[%l7 + 0x5E],	%o4
	array32	%g6,	%o5,	%g7
	andcc	%i5,	0x0916,	%l6
	edge16n	%o3,	%l0,	%g3
	subccc	%i4,	%i6,	%g1
	addccc	%l3,	%g4,	%l1
	ldub	[%l7 + 0x5C],	%l4
	subcc	%g2,	%o7,	%l2
	nop
	set	0x70, %o5
	ldd	[%l7 + %o5],	%f2
	movrgez	%o2,	%i0,	%i2
	stb	%o0,	[%l7 + 0x3C]
	and	%i3,	0x1335,	%o1
	or	%i7,	%g5,	%o6
	movneg	%xcc,	%l5,	%o4
	movvc	%icc,	%i1,	%g6
	movpos	%xcc,	%g7,	%o5
	umulcc	%i5,	0x0163,	%o3
	udivx	%l0,	0x1184,	%g3
	movl	%xcc,	%l6,	%i4
	ldsw	[%l7 + 0x2C],	%g1
	movne	%xcc,	%i6,	%g4
	subc	%l3,	%l1,	%g2
	fmovda	%xcc,	%f22,	%f8
	or	%o7,	0x01EE,	%l4
	fmovdgu	%xcc,	%f19,	%f27
	sllx	%l2,	0x10,	%i0
	edge16ln	%o2,	%i2,	%o0
	subccc	%i3,	0x08DF,	%o1
	fmovrslz	%i7,	%f6,	%f25
	movrne	%o6,	%l5,	%g5
	lduw	[%l7 + 0x68],	%i1
	lduw	[%l7 + 0x08],	%o4
	subc	%g7,	0x1282,	%g6
	fmovscs	%icc,	%f1,	%f8
	ldd	[%l7 + 0x38],	%f28
	std	%f24,	[%l7 + 0x60]
	xnorcc	%i5,	%o5,	%o3
	sth	%g3,	[%l7 + 0x64]
	ld	[%l7 + 0x48],	%f9
	udivcc	%l6,	0x152F,	%l0
	sra	%g1,	0x09,	%i6
	movvs	%icc,	%g4,	%l3
	movge	%icc,	%i4,	%g2
	movl	%icc,	%l1,	%o7
	popc	0x11AA,	%l4
	move	%icc,	%i0,	%o2
	movpos	%xcc,	%l2,	%o0
	movrgez	%i3,	0x191,	%o1
	popc	0x0071,	%i2
	movle	%icc,	%i7,	%o6
	movleu	%icc,	%g5,	%i1
	fmul8ulx16	%f14,	%f18,	%f14
	stb	%o4,	[%l7 + 0x7D]
	add	%g7,	0x070D,	%g6
	subc	%i5,	%o5,	%o3
	orn	%g3,	%l6,	%l0
	fcmpes	%fcc3,	%f24,	%f6
	fmovrse	%l5,	%f26,	%f28
	sllx	%i6,	%g4,	%g1
	orncc	%l3,	0x1DF6,	%g2
	movrlz	%l1,	0x111,	%o7
	st	%f18,	[%l7 + 0x40]
	mova	%xcc,	%i4,	%i0
	fnors	%f22,	%f10,	%f24
	subc	%l4,	%l2,	%o0
	movrlz	%o2,	0x176,	%i3
	edge32	%o1,	%i7,	%i2
	sth	%o6,	[%l7 + 0x62]
	addc	%g5,	%o4,	%i1
	sra	%g7,	%i5,	%g6
	xor	%o3,	%o5,	%g3
	lduh	[%l7 + 0x22],	%l6
	mulx	%l0,	0x1EDE,	%l5
	movneg	%icc,	%i6,	%g4
	array16	%g1,	%g2,	%l1
	ldd	[%l7 + 0x48],	%o6
	add	%i4,	%l3,	%i0
	st	%f30,	[%l7 + 0x34]
	ldsh	[%l7 + 0x5E],	%l4
	array16	%l2,	%o2,	%i3
	fmovsg	%icc,	%f10,	%f2
	movrgez	%o0,	0x374,	%i7
	srax	%o1,	0x1C,	%i2
	movrne	%o6,	0x385,	%o4
	addccc	%i1,	%g5,	%i5
	ldsw	[%l7 + 0x08],	%g7
	movg	%xcc,	%g6,	%o3
	fcmple32	%f30,	%f10,	%g3
	xorcc	%l6,	%l0,	%l5
	movle	%icc,	%o5,	%i6
	edge16	%g1,	%g2,	%g4
	mulx	%l1,	0x19E1,	%i4
	st	%f3,	[%l7 + 0x18]
	sdivcc	%o7,	0x13DC,	%i0
	edge8ln	%l3,	%l2,	%o2
	sdivx	%l4,	0x1631,	%o0
	movne	%icc,	%i3,	%o1
	edge8n	%i2,	%o6,	%o4
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	xor	%g7,	%i7,	%g6
	ldub	[%l7 + 0x19],	%o3
	stb	%g3,	[%l7 + 0x32]
	sir	0x07AB
	fmovdcc	%xcc,	%f16,	%f8
	fmovsleu	%icc,	%f11,	%f18
	and	%l0,	0x14CD,	%l6
	lduh	[%l7 + 0x18],	%l5
	orcc	%i6,	%g1,	%o5
	pdist	%f24,	%f2,	%f30
	fzeros	%f24
	mulscc	%g2,	0x1064,	%g4
	movre	%i4,	%o7,	%l1
	subcc	%i0,	%l2,	%l3
	xorcc	%o2,	%o0,	%l4
	lduh	[%l7 + 0x46],	%i3
	subccc	%i2,	0x10B0,	%o1
	movne	%icc,	%o6,	%i1
	movcc	%icc,	%g5,	%i5
	or	%g7,	%i7,	%g6
	fandnot2s	%f24,	%f1,	%f25
	orncc	%o4,	%o3,	%l0
	array16	%g3,	%l5,	%i6
	alignaddr	%l6,	%g1,	%g2
	edge8l	%g4,	%i4,	%o7
	addc	%l1,	%o5,	%l2
	fmovsle	%xcc,	%f7,	%f15
	subc	%l3,	%o2,	%i0
	fnand	%f22,	%f0,	%f8
	fpack32	%f26,	%f0,	%f12
	srlx	%l4,	%i3,	%i2
	movrne	%o1,	0x153,	%o6
	xor	%o0,	0x16FB,	%i1
	movge	%xcc,	%i5,	%g7
	fmovsl	%icc,	%f19,	%f21
	umul	%g5,	%i7,	%o4
	alignaddrl	%g6,	%o3,	%g3
	fexpand	%f5,	%f2
	movge	%xcc,	%l0,	%i6
	ldsb	[%l7 + 0x4B],	%l5
	mulscc	%g1,	%l6,	%g2
	movre	%i4,	0x223,	%o7
	andcc	%g4,	0x167E,	%o5
	mova	%icc,	%l1,	%l3
	udiv	%l2,	0x0A51,	%o2
	nop
	set	0x5C, %o4
	lduh	[%l7 + %o4],	%i0
	fpadd32s	%f9,	%f14,	%f3
	edge8l	%i3,	%l4,	%i2
	stw	%o6,	[%l7 + 0x40]
	srlx	%o0,	0x0B,	%o1
	popc	%i5,	%i1
	fmovrdgez	%g5,	%f12,	%f26
	mova	%icc,	%i7,	%o4
	fnot1	%f0,	%f4
	udivx	%g7,	0x1943,	%g6
	sll	%g3,	0x19,	%l0
	fandnot2	%f18,	%f18,	%f30
	xnorcc	%i6,	%l5,	%o3
	movpos	%xcc,	%l6,	%g1
	stb	%i4,	[%l7 + 0x75]
	movpos	%icc,	%g2,	%o7
	lduw	[%l7 + 0x30],	%g4
	ldd	[%l7 + 0x60],	%l0
	movpos	%xcc,	%o5,	%l3
	xnorcc	%o2,	%l2,	%i3
	movg	%icc,	%l4,	%i2
	fpsub32	%f28,	%f6,	%f0
	sdivx	%i0,	0x0522,	%o0
	stw	%o1,	[%l7 + 0x08]
	fmovdpos	%xcc,	%f5,	%f15
	edge16l	%o6,	%i5,	%g5
	movcc	%xcc,	%i7,	%o4
	movl	%xcc,	%i1,	%g6
	edge32l	%g3,	%g7,	%i6
	fmovsleu	%xcc,	%f5,	%f17
	mova	%xcc,	%l0,	%o3
	xor	%l6,	%l5,	%g1
	movrgz	%i4,	%o7,	%g2
	stx	%l1,	[%l7 + 0x20]
	std	%f12,	[%l7 + 0x40]
	ld	[%l7 + 0x60],	%f1
	xorcc	%o5,	%g4,	%o2
	ldx	[%l7 + 0x08],	%l3
	umulcc	%l2,	0x0443,	%l4
	sllx	%i3,	0x16,	%i2
	andncc	%i0,	%o0,	%o6
	fabss	%f27,	%f12
	addccc	%o1,	%g5,	%i5
	movn	%xcc,	%i7,	%i1
	fmovdneg	%icc,	%f25,	%f11
	sll	%g6,	%o4,	%g7
	sethi	0x1F61,	%i6
	fxor	%f12,	%f28,	%f28
	subccc	%g3,	0x16AC,	%l0
	sth	%o3,	[%l7 + 0x66]
	std	%f26,	[%l7 + 0x58]
	movcc	%icc,	%l5,	%g1
	edge8ln	%l6,	%i4,	%o7
	fmovdneg	%icc,	%f17,	%f0
	addc	%g2,	0x119E,	%o5
	smul	%l1,	0x04E2,	%g4
	sir	0x0F6B
	addc	%o2,	%l3,	%l2
	fornot2	%f16,	%f16,	%f22
	udivx	%i3,	0x196E,	%i2
	sethi	0x1CB1,	%l4
	lduw	[%l7 + 0x28],	%o0
	fmovrdne	%i0,	%f26,	%f20
	movl	%icc,	%o1,	%g5
	sdiv	%i5,	0x1E17,	%i7
	array8	%i1,	%g6,	%o4
	movrlz	%g7,	0x0EE,	%o6
	popc	0x0906,	%i6
	subc	%g3,	%o3,	%l5
	ldd	[%l7 + 0x08],	%g0
	edge32ln	%l6,	%i4,	%o7
	movrlez	%g2,	%l0,	%o5
	mulx	%l1,	0x0DB7,	%o2
	nop
	set	0x1D, %i5
	ldub	[%l7 + %i5],	%g4
	fmovrsne	%l2,	%f22,	%f16
	sir	0x1234
	subc	%i3,	%l3,	%i2
	andcc	%l4,	0x01D8,	%i0
	fmovsa	%xcc,	%f2,	%f26
	udiv	%o1,	0x0582,	%g5
	sdivcc	%i5,	0x11B0,	%i7
	fmovrdgez	%i1,	%f20,	%f30
	sdiv	%g6,	0x1562,	%o4
	alignaddrl	%g7,	%o6,	%o0
	addc	%i6,	%g3,	%o3
	sra	%g1,	0x1C,	%l5
	umulcc	%l6,	0x1185,	%o7
	movl	%xcc,	%g2,	%l0
	xorcc	%o5,	0x1746,	%l1
	movcc	%icc,	%o2,	%i4
	andncc	%g4,	%l2,	%i3
	fmovd	%f28,	%f18
	fmovrdlz	%l3,	%f8,	%f28
	sra	%i2,	0x09,	%l4
	andn	%i0,	%g5,	%i5
	and	%i7,	%o1,	%i1
	sethi	0x1521,	%g6
	orncc	%g7,	0x0571,	%o6
	fmuld8ulx16	%f18,	%f23,	%f14
	subcc	%o4,	%i6,	%o0
	ld	[%l7 + 0x30],	%f19
	stx	%g3,	[%l7 + 0x48]
	fands	%f3,	%f31,	%f20
	movn	%xcc,	%o3,	%g1
	edge8ln	%l5,	%l6,	%g2
	fand	%f2,	%f18,	%f22
	fmovrsne	%o7,	%f3,	%f4
	ldsh	[%l7 + 0x5E],	%o5
	movgu	%icc,	%l0,	%l1
	fmovsg	%xcc,	%f28,	%f7
	smul	%o2,	0x1B7D,	%i4
	array16	%g4,	%i3,	%l3
	fcmple32	%f16,	%f30,	%l2
	fandnot2s	%f31,	%f29,	%f3
	smulcc	%i2,	%l4,	%g5
	udivx	%i5,	0x1083,	%i7
	movneg	%xcc,	%i0,	%o1
	ld	[%l7 + 0x7C],	%f22
	edge16	%i1,	%g7,	%o6
	edge32l	%g6,	%i6,	%o4
	movn	%xcc,	%g3,	%o3
	subcc	%o0,	0x1477,	%g1
	fmovdgu	%xcc,	%f13,	%f14
	fmovspos	%xcc,	%f15,	%f25
	subc	%l6,	0x0D51,	%g2
	stw	%o7,	[%l7 + 0x3C]
	edge8ln	%o5,	%l0,	%l5
	subcc	%l1,	0x1416,	%o2
	subccc	%g4,	%i4,	%l3
	ldd	[%l7 + 0x60],	%i2
	array32	%i2,	%l4,	%g5
	movcc	%icc,	%l2,	%i7
	mulx	%i5,	%i0,	%o1
	sethi	0x1544,	%g7
	orn	%i1,	%g6,	%i6
	sir	0x1808
	ldx	[%l7 + 0x10],	%o4
	ldd	[%l7 + 0x68],	%o6
	fmovdpos	%xcc,	%f17,	%f27
	edge32ln	%g3,	%o3,	%g1
	movrlez	%o0,	0x2B1,	%l6
	smulcc	%g2,	%o7,	%o5
	fcmps	%fcc2,	%f8,	%f2
	movrlz	%l5,	%l1,	%o2
	movg	%xcc,	%l0,	%g4
	ldsb	[%l7 + 0x22],	%i4
	movcc	%xcc,	%i3,	%i2
	smul	%l3,	%l4,	%g5
	ldsb	[%l7 + 0x78],	%i7
	subcc	%l2,	0x1335,	%i0
	stw	%i5,	[%l7 + 0x08]
	fcmpgt32	%f26,	%f16,	%g7
	array16	%o1,	%i1,	%g6
	ldub	[%l7 + 0x0C],	%i6
	movn	%xcc,	%o6,	%g3
	addcc	%o3,	%o4,	%o0
	edge16n	%l6,	%g1,	%g2
	fcmpeq32	%f14,	%f4,	%o5
	fpsub16s	%f0,	%f14,	%f27
	andn	%l5,	0x127A,	%l1
	xnorcc	%o2,	0x040A,	%l0
	fmovrdlz	%g4,	%f28,	%f24
	fmovrslz	%i4,	%f4,	%f1
	fmovdleu	%xcc,	%f21,	%f2
	srax	%i3,	%i2,	%o7
	movrgz	%l4,	%l3,	%g5
	subc	%l2,	0x153C,	%i7
	xnor	%i0,	0x1FFB,	%g7
	alignaddr	%i5,	%i1,	%o1
	smul	%g6,	%i6,	%o6
	move	%icc,	%o3,	%o4
	sir	0x1AEC
	stx	%o0,	[%l7 + 0x20]
	fpadd32	%f6,	%f10,	%f2
	subccc	%l6,	0x1079,	%g3
	std	%f28,	[%l7 + 0x50]
	fmovdgu	%xcc,	%f20,	%f3
	smulcc	%g2,	%o5,	%g1
	addccc	%l5,	%o2,	%l1
	sra	%g4,	0x13,	%l0
	xnor	%i3,	%i2,	%i4
	sdiv	%o7,	0x07A1,	%l3
	add	%g5,	%l2,	%l4
	edge8l	%i7,	%g7,	%i5
	popc	%i1,	%o1
	movg	%icc,	%i0,	%g6
	movrgez	%i6,	0x251,	%o6
	fmovrslez	%o4,	%f30,	%f10
	save %o0, %l6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g2,	%g3,	%g1
	smulcc	%l5,	%o2,	%l1
	orcc	%g4,	%o5,	%i3
	or	%i2,	%i4,	%o7
	fand	%f0,	%f2,	%f24
	fmovrsgz	%l3,	%f14,	%f2
	fxors	%f5,	%f20,	%f15
	movrgez	%l0,	%l2,	%g5
	stw	%l4,	[%l7 + 0x18]
	movg	%xcc,	%i7,	%g7
	fmovdvs	%xcc,	%f12,	%f15
	fxors	%f14,	%f25,	%f13
	edge32n	%i5,	%i1,	%i0
	srl	%o1,	0x1E,	%i6
	sth	%o6,	[%l7 + 0x2E]
	movle	%xcc,	%o4,	%o0
	popc	%l6,	%o3
	fmovde	%icc,	%f5,	%f12
	srlx	%g2,	%g3,	%g6
	fmovsa	%xcc,	%f24,	%f15
	fmovdcs	%icc,	%f18,	%f24
	orn	%g1,	%o2,	%l5
	andncc	%g4,	%o5,	%l1
	movneg	%icc,	%i2,	%i4
	fsrc1s	%f8,	%f9
	addc	%i3,	%o7,	%l0
	mova	%xcc,	%l2,	%g5
	mulx	%l3,	0x0037,	%i7
	xnor	%l4,	0x008B,	%g7
	fnegs	%f23,	%f30
	fpsub16	%f16,	%f2,	%f4
	mulx	%i1,	%i5,	%o1
	array16	%i6,	%o6,	%o4
	movge	%xcc,	%i0,	%o0
	xor	%l6,	0x1AFC,	%o3
	movle	%xcc,	%g2,	%g3
	ldsb	[%l7 + 0x32],	%g1
	movvs	%xcc,	%g6,	%o2
	edge16	%l5,	%o5,	%l1
	smul	%i2,	0x17E6,	%g4
	sir	0x079D
	or	%i4,	0x077D,	%i3
	st	%f19,	[%l7 + 0x48]
	fpsub32	%f20,	%f20,	%f24
	orncc	%o7,	%l0,	%g5
	or	%l2,	0x0B94,	%l3
	edge8l	%i7,	%g7,	%l4
	xnor	%i1,	%o1,	%i6
	edge16ln	%o6,	%i5,	%o4
	smulcc	%i0,	0x158F,	%o0
	fpack32	%f14,	%f28,	%f26
	movne	%icc,	%o3,	%l6
	fmovdgu	%xcc,	%f0,	%f21
	udivx	%g3,	0x0EA1,	%g2
	ld	[%l7 + 0x7C],	%f9
	fmuld8sux16	%f9,	%f10,	%f22
	array16	%g6,	%g1,	%o2
	sdiv	%o5,	0x1604,	%l1
	array32	%i2,	%l5,	%g4
	fmovdg	%icc,	%f7,	%f26
	edge32n	%i3,	%i4,	%o7
	movgu	%icc,	%l0,	%g5
	edge32n	%l3,	%l2,	%i7
	move	%xcc,	%g7,	%i1
	xnor	%l4,	%o1,	%o6
	andcc	%i5,	0x1EE9,	%o4
	fmovrse	%i6,	%f22,	%f0
	fmovrsgz	%o0,	%f18,	%f6
	array8	%i0,	%o3,	%l6
	movgu	%icc,	%g3,	%g2
	fmovrsgez	%g6,	%f31,	%f22
	edge32n	%g1,	%o5,	%l1
	st	%f11,	[%l7 + 0x24]
	sub	%i2,	%o2,	%l5
	array16	%g4,	%i3,	%i4
	addcc	%o7,	%g5,	%l0
	udiv	%l3,	0x02FC,	%i7
	orn	%g7,	0x1FE8,	%l2
	edge8n	%i1,	%o1,	%l4
	subccc	%o6,	0x0361,	%i5
	addcc	%o4,	0x028C,	%o0
	fmovsl	%icc,	%f22,	%f25
	edge16n	%i0,	%o3,	%i6
	fmuld8ulx16	%f18,	%f26,	%f26
	edge16l	%g3,	%l6,	%g6
	and	%g1,	0x0FCD,	%o5
	fmovrsne	%g2,	%f18,	%f12
	addcc	%l1,	%i2,	%o2
	andcc	%l5,	%g4,	%i3
	movpos	%icc,	%i4,	%o7
	std	%f24,	[%l7 + 0x58]
	sethi	0x0621,	%g5
	fpack32	%f6,	%f16,	%f4
	fand	%f22,	%f0,	%f4
	movn	%icc,	%l3,	%i7
	edge8l	%l0,	%g7,	%i1
	movge	%xcc,	%l2,	%l4
	array8	%o1,	%o6,	%i5
	orcc	%o0,	0x1F7F,	%i0
	xorcc	%o4,	%o3,	%g3
	addcc	%i6,	%l6,	%g6
	fxnors	%f18,	%f14,	%f20
	mova	%xcc,	%g1,	%o5
	udivcc	%l1,	0x11BD,	%g2
	movg	%xcc,	%o2,	%l5
	lduh	[%l7 + 0x4A],	%i2
	array32	%i3,	%i4,	%o7
	alignaddrl	%g4,	%l3,	%i7
	umul	%g5,	0x05D7,	%g7
	array32	%i1,	%l0,	%l4
	edge16ln	%o1,	%l2,	%i5
	smulcc	%o6,	0x112B,	%o0
	edge8	%o4,	%o3,	%g3
	fornot2	%f8,	%f10,	%f22
	fmovsvc	%icc,	%f19,	%f28
	ldd	[%l7 + 0x18],	%f12
	sdivcc	%i6,	0x0891,	%l6
	fmovrsne	%g6,	%f24,	%f31
	fmovdvs	%icc,	%f27,	%f21
	fnot1s	%f13,	%f25
	fmovsn	%icc,	%f0,	%f25
	smul	%g1,	0x13CC,	%i0
	andn	%l1,	%g2,	%o2
	addcc	%o5,	%l5,	%i2
	or	%i4,	0x06AE,	%i3
	nop
	set	0x78, %o3
	ldsh	[%l7 + %o3],	%o7
	fmovscs	%icc,	%f0,	%f5
	and	%g4,	0x1115,	%i7
	nop
	set	0x7E, %i4
	ldub	[%l7 + %i4],	%l3
	movrlez	%g5,	%i1,	%l0
	edge32	%l4,	%o1,	%l2
	edge8	%g7,	%i5,	%o0
	andncc	%o6,	%o3,	%g3
	movpos	%icc,	%o4,	%l6
	addccc	%g6,	0x036B,	%g1
	fcmped	%fcc1,	%f18,	%f30
	fcmpne32	%f0,	%f22,	%i6
	restore %i0, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l1,	[%l7 + 0x23]
	sir	0x1D6D
	movre	%l5,	%o5,	%i2
	udivx	%i4,	0x09C0,	%i3
	addc	%g4,	0x0B65,	%i7
	xor	%l3,	%o7,	%i1
	movneg	%icc,	%l0,	%g5
	ld	[%l7 + 0x58],	%f25
	alignaddr	%l4,	%l2,	%g7
	fmovsn	%xcc,	%f15,	%f6
	fmovdvs	%xcc,	%f31,	%f11
	fmovdne	%xcc,	%f7,	%f25
	fpadd32	%f26,	%f6,	%f12
	subc	%i5,	%o0,	%o6
	movrne	%o3,	0x148,	%o1
	udivcc	%g3,	0x1A5E,	%o4
	subc	%g6,	%l6,	%g1
	fmovrde	%i6,	%f20,	%f0
	fands	%f22,	%f0,	%f17
	umul	%g2,	%o2,	%l1
	fmovsvc	%xcc,	%f0,	%f25
	std	%f8,	[%l7 + 0x58]
	movre	%l5,	0x12F,	%i0
	fands	%f24,	%f12,	%f17
	sllx	%i2,	0x1F,	%o5
	fzeros	%f31
	move	%xcc,	%i4,	%i3
	edge16n	%i7,	%g4,	%o7
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	movl	%icc,	%l3,	%l4
	fmovdne	%icc,	%f18,	%f30
	fpadd32	%f26,	%f20,	%f18
	sllx	%l2,	%i5,	%g7
	fmovrse	%o6,	%f26,	%f7
	orncc	%o0,	0x13A6,	%o3
	mulx	%o1,	0x0348,	%g3
	xor	%o4,	%g6,	%l6
	fpsub32s	%f13,	%f5,	%f25
	udivcc	%i6,	0x14CA,	%g2
	edge8n	%g1,	%l1,	%o2
	ldx	[%l7 + 0x38],	%i0
	edge16	%i2,	%l5,	%o5
	lduw	[%l7 + 0x7C],	%i3
	movle	%icc,	%i4,	%g4
	andn	%o7,	0x00E0,	%i1
	movrgz	%l0,	%i7,	%l3
	array8	%g5,	%l2,	%i5
	array16	%l4,	%g7,	%o6
	fornot2s	%f16,	%f14,	%f17
	xnor	%o0,	0x091E,	%o1
	edge8l	%o3,	%g3,	%o4
	stb	%g6,	[%l7 + 0x6D]
	movcc	%xcc,	%i6,	%g2
	ldub	[%l7 + 0x3B],	%l6
	lduw	[%l7 + 0x74],	%g1
	mova	%xcc,	%l1,	%o2
	array32	%i0,	%i2,	%l5
	andn	%o5,	%i3,	%g4
	fcmps	%fcc2,	%f17,	%f27
	smul	%o7,	0x01EE,	%i4
	edge8ln	%l0,	%i1,	%i7
	or	%g5,	%l3,	%i5
	ld	[%l7 + 0x38],	%f4
	ld	[%l7 + 0x2C],	%f25
	sub	%l4,	0x1280,	%l2
	orcc	%o6,	%o0,	%g7
	fabsd	%f14,	%f6
	and	%o1,	%g3,	%o4
	udivx	%g6,	0x0824,	%i6
	edge32n	%g2,	%o3,	%g1
	fmul8x16	%f31,	%f26,	%f30
	orcc	%l6,	%o2,	%l1
	nop
	set	0x4E, %g1
	sth	%i0,	[%l7 + %g1]
	sra	%i2,	%o5,	%i3
	xnorcc	%l5,	%g4,	%o7
	and	%l0,	0x02AF,	%i1
	movpos	%xcc,	%i7,	%g5
	fabss	%f31,	%f19
	movrlz	%l3,	%i5,	%i4
	edge32ln	%l2,	%l4,	%o6
	movrlz	%o0,	%g7,	%g3
	ldub	[%l7 + 0x77],	%o1
	movn	%xcc,	%o4,	%i6
	lduw	[%l7 + 0x08],	%g6
	sth	%g2,	[%l7 + 0x10]
	stb	%o3,	[%l7 + 0x0E]
	st	%f28,	[%l7 + 0x60]
	ldx	[%l7 + 0x58],	%g1
	umul	%l6,	0x10B0,	%o2
	fpsub32s	%f11,	%f1,	%f7
	sdiv	%i0,	0x0B0B,	%l1
	nop
	set	0x54, %i0
	stb	%i2,	[%l7 + %i0]
	fexpand	%f28,	%f16
	ld	[%l7 + 0x5C],	%f6
	orn	%o5,	%l5,	%g4
	stx	%o7,	[%l7 + 0x60]
	udivcc	%i3,	0x14DF,	%l0
	fmul8x16	%f19,	%f0,	%f30
	srax	%i1,	%g5,	%l3
	array16	%i7,	%i5,	%l2
	sll	%l4,	%i4,	%o0
	mulx	%g7,	%o6,	%o1
	edge8ln	%o4,	%i6,	%g3
	movgu	%icc,	%g6,	%g2
	restore %o3, 0x0AE8, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o2,	%g1,	%l1
	srax	%i0,	0x1C,	%i2
	fpackfix	%f6,	%f17
	movle	%icc,	%o5,	%g4
	movrne	%o7,	%l5,	%i3
	edge16l	%i1,	%l0,	%l3
	ld	[%l7 + 0x4C],	%f17
	xorcc	%g5,	0x1FDF,	%i7
	stb	%l2,	[%l7 + 0x7E]
	fcmple32	%f16,	%f24,	%l4
	edge8l	%i5,	%o0,	%g7
	fpackfix	%f24,	%f17
	edge32n	%o6,	%o1,	%o4
	movn	%xcc,	%i6,	%i4
	fsrc2s	%f4,	%f18
	array16	%g6,	%g2,	%o3
	fmovdgu	%icc,	%f0,	%f24
	sdiv	%g3,	0x1F5C,	%o2
	or	%l6,	%g1,	%i0
	array8	%i2,	%l1,	%g4
	nop
	set	0x38, %g6
	stx	%o5,	[%l7 + %g6]
	and	%l5,	%i3,	%i1
	movrlez	%l0,	%l3,	%g5
	fnand	%f4,	%f2,	%f30
	stx	%i7,	[%l7 + 0x60]
	alignaddrl	%l2,	%o7,	%l4
	movrgz	%i5,	%o0,	%g7
	edge32n	%o1,	%o6,	%i6
	fmovdne	%icc,	%f10,	%f2
	edge16n	%o4,	%i4,	%g2
	xnor	%o3,	0x1DBD,	%g6
	ldsh	[%l7 + 0x36],	%o2
	udiv	%l6,	0x0D35,	%g3
	mulx	%g1,	%i2,	%i0
	edge32l	%l1,	%o5,	%g4
	nop
	set	0x0A, %o1
	lduh	[%l7 + %o1],	%l5
	fmovdleu	%icc,	%f18,	%f11
	array8	%i3,	%i1,	%l3
	umulcc	%l0,	%i7,	%g5
	fmovscc	%xcc,	%f29,	%f8
	edge8ln	%o7,	%l4,	%i5
	movcc	%xcc,	%o0,	%l2
	edge32l	%o1,	%o6,	%g7
	alignaddrl	%o4,	%i6,	%g2
	fcmple16	%f12,	%f12,	%i4
	movcs	%xcc,	%o3,	%o2
	movneg	%icc,	%g6,	%l6
	movrlz	%g1,	0x296,	%g3
	ldx	[%l7 + 0x40],	%i0
	edge16l	%i2,	%o5,	%g4
	edge32	%l1,	%i3,	%l5
	movrgz	%l3,	%i1,	%l0
	movrlz	%g5,	0x025,	%i7
	movpos	%xcc,	%l4,	%o7
	ldsw	[%l7 + 0x74],	%i5
	edge16ln	%l2,	%o0,	%o1
	xorcc	%o6,	%o4,	%i6
	array32	%g2,	%i4,	%g7
	mulscc	%o3,	0x0AC5,	%o2
	mulx	%g6,	0x1462,	%l6
	edge8n	%g1,	%g3,	%i2
	fmovdleu	%xcc,	%f9,	%f9
	array16	%i0,	%g4,	%l1
	fcmpne16	%f26,	%f22,	%o5
	fmovsgu	%icc,	%f22,	%f6
	edge32ln	%i3,	%l3,	%i1
	alignaddr	%l5,	%g5,	%i7
	movle	%icc,	%l0,	%l4
	udivcc	%o7,	0x18E2,	%i5
	fmuld8sux16	%f13,	%f31,	%f4
	srl	%o0,	0x05,	%l2
	orncc	%o6,	0x0526,	%o4
	udiv	%o1,	0x1567,	%i6
	movgu	%icc,	%i4,	%g2
	alignaddrl	%o3,	%o2,	%g7
	andn	%l6,	%g6,	%g1
	srl	%g3,	0x01,	%i2
	ldsb	[%l7 + 0x75],	%i0
	array8	%g4,	%l1,	%i3
	fcmple16	%f12,	%f30,	%l3
	or	%o5,	%l5,	%i1
	orcc	%g5,	%i7,	%l4
	edge16n	%o7,	%l0,	%o0
	addccc	%l2,	%i5,	%o6
	fmovda	%xcc,	%f22,	%f31
	movn	%xcc,	%o4,	%i6
	orncc	%o1,	%g2,	%i4
	mulx	%o2,	0x13D2,	%g7
	fmovrslez	%l6,	%f11,	%f18
	movle	%xcc,	%g6,	%g1
	save %o3, 0x1E32, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i2,	%g4,	%l1
	movre	%i0,	%i3,	%l3
	edge16	%l5,	%i1,	%g5
	edge8n	%o5,	%i7,	%o7
	fpadd16s	%f25,	%f14,	%f8
	andncc	%l4,	%l0,	%l2
	sdiv	%i5,	0x1527,	%o0
	fmovdgu	%xcc,	%f5,	%f9
	ldsw	[%l7 + 0x74],	%o4
	xor	%o6,	%o1,	%i6
	fcmps	%fcc2,	%f0,	%f28
	fmovdle	%xcc,	%f1,	%f22
	edge16n	%i4,	%o2,	%g7
	srax	%l6,	%g2,	%g6
	fxnor	%f4,	%f28,	%f16
	andcc	%o3,	%g3,	%i2
	fmovdgu	%xcc,	%f13,	%f16
	movneg	%xcc,	%g1,	%g4
	edge8ln	%i0,	%i3,	%l3
	fnot1	%f8,	%f20
	subcc	%l5,	%i1,	%g5
	add	%o5,	%i7,	%l1
	fmovdg	%xcc,	%f6,	%f10
	sllx	%l4,	%o7,	%l0
	mova	%icc,	%l2,	%i5
	addcc	%o0,	0x0844,	%o6
	mulscc	%o4,	0x00C0,	%i6
	array8	%o1,	%o2,	%g7
	movneg	%icc,	%i4,	%g2
	movl	%icc,	%l6,	%o3
	fmovsleu	%xcc,	%f20,	%f7
	srl	%g3,	0x19,	%g6
	movcs	%xcc,	%i2,	%g4
	subccc	%g1,	0x0CF1,	%i3
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	edge8n	%i1,	%l5,	%o5
	fnot2s	%f28,	%f8
	movn	%icc,	%i7,	%l1
	andcc	%l4,	%g5,	%l0
	sdiv	%o7,	0x018E,	%l2
	sllx	%i5,	%o6,	%o4
	edge8n	%i6,	%o0,	%o2
	ldsw	[%l7 + 0x44],	%o1
	orcc	%i4,	%g2,	%l6
	movcc	%xcc,	%g7,	%o3
	edge32n	%g3,	%i2,	%g6
	movne	%icc,	%g1,	%i3
	fornot2s	%f10,	%f31,	%f20
	movge	%icc,	%g4,	%i0
	addcc	%i1,	%l3,	%l5
	edge16	%o5,	%i7,	%l1
	fornot2s	%f25,	%f27,	%f18
	fexpand	%f30,	%f18
	movcs	%xcc,	%g5,	%l4
	srl	%l0,	%o7,	%l2
	sra	%i5,	0x1D,	%o4
	std	%f28,	[%l7 + 0x48]
	fmovsgu	%icc,	%f28,	%f24
	fabss	%f14,	%f5
	subc	%i6,	0x0E56,	%o0
	edge32l	%o6,	%o2,	%i4
	movg	%xcc,	%o1,	%g2
	sir	0x1CB8
	sra	%l6,	0x16,	%g7
	movgu	%icc,	%g3,	%o3
	fmovdg	%icc,	%f8,	%f1
	add	%i2,	%g6,	%i3
	srax	%g1,	%i0,	%g4
	movle	%icc,	%l3,	%i1
	movcc	%xcc,	%l5,	%o5
	fmovrslez	%l1,	%f9,	%f19
	andn	%g5,	%i7,	%l0
	fornot2s	%f17,	%f17,	%f21
	add	%o7,	0x191B,	%l2
	pdist	%f4,	%f2,	%f2
	fmovsne	%xcc,	%f25,	%f8
	edge8ln	%i5,	%o4,	%l4
	ldsb	[%l7 + 0x0B],	%o0
	fcmpgt32	%f26,	%f24,	%o6
	movrne	%o2,	0x157,	%i4
	udiv	%i6,	0x02B0,	%o1
	orncc	%g2,	0x1298,	%l6
	st	%f30,	[%l7 + 0x0C]
	movrlz	%g7,	0x26D,	%o3
	stw	%i2,	[%l7 + 0x48]
	subccc	%g3,	%i3,	%g1
	smulcc	%g6,	%i0,	%l3
	stw	%i1,	[%l7 + 0x2C]
	save %l5, 0x0606, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f9,	%f28
	stw	%g4,	[%l7 + 0x64]
	ldd	[%l7 + 0x20],	%f16
	alignaddr	%g5,	%i7,	%l1
	popc	%l0,	%o7
	lduw	[%l7 + 0x70],	%i5
	edge32	%l2,	%o4,	%o0
	fxnor	%f30,	%f8,	%f16
	and	%l4,	%o6,	%o2
	or	%i4,	%o1,	%g2
	fors	%f11,	%f10,	%f31
	fands	%f16,	%f11,	%f25
	udivx	%i6,	0x029F,	%g7
	sth	%o3,	[%l7 + 0x42]
	movrne	%l6,	0x25E,	%i2
	movre	%i3,	%g3,	%g6
	movrne	%g1,	0x160,	%i0
	stb	%l3,	[%l7 + 0x39]
	edge16n	%l5,	%i1,	%o5
	fandnot1	%f22,	%f14,	%f24
	fmovsvs	%xcc,	%f25,	%f11
	andcc	%g5,	0x14D0,	%i7
	orcc	%l1,	0x1B0D,	%g4
	fmovspos	%xcc,	%f13,	%f23
	lduh	[%l7 + 0x0E],	%o7
	array16	%i5,	%l0,	%o4
	fnot2	%f2,	%f10
	std	%f10,	[%l7 + 0x68]
	xnor	%l2,	0x1281,	%l4
	fornot2s	%f15,	%f5,	%f8
	movl	%xcc,	%o6,	%o0
	fcmple32	%f8,	%f0,	%i4
	ldub	[%l7 + 0x58],	%o1
	andn	%o2,	0x1DBD,	%i6
	andn	%g7,	0x1BA2,	%o3
	fpsub32s	%f23,	%f23,	%f3
	udivx	%l6,	0x1B82,	%i2
	andncc	%i3,	%g2,	%g3
	fmovdcs	%icc,	%f0,	%f29
	edge8l	%g1,	%i0,	%g6
	srlx	%l5,	%l3,	%o5
	ldub	[%l7 + 0x30],	%i1
	save %g5, 0x087A, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l1,	%g4,	%o7
	sir	0x1173
	mulx	%i5,	0x05EB,	%o4
	ldsw	[%l7 + 0x10],	%l0
	udivx	%l4,	0x076B,	%o6
	array32	%l2,	%o0,	%o1
	sir	0x1070
	fones	%f10
	smul	%i4,	0x009E,	%i6
	movge	%icc,	%g7,	%o3
	andncc	%o2,	%l6,	%i3
	and	%i2,	%g2,	%g1
	fnors	%f2,	%f13,	%f2
	umulcc	%g3,	0x1BBB,	%i0
	stx	%l5,	[%l7 + 0x28]
	fpack32	%f6,	%f20,	%f22
	movre	%l3,	0x187,	%o5
	fmovdneg	%xcc,	%f11,	%f26
	fmovdg	%icc,	%f29,	%f29
	add	%i1,	%g6,	%i7
	andcc	%l1,	%g5,	%g4
	restore %i5, %o4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l0,	%l4,	%l2
	movpos	%icc,	%o6,	%o1
	fzeros	%f21
	alignaddrl	%o0,	%i6,	%g7
	orn	%o3,	%i4,	%o2
	andncc	%l6,	%i2,	%i3
	movneg	%icc,	%g2,	%g3
	movvs	%icc,	%g1,	%l5
	srax	%i0,	%o5,	%i1
	edge8	%g6,	%l3,	%i7
	move	%icc,	%l1,	%g4
	or	%g5,	0x11BD,	%o4
	movrne	%i5,	0x377,	%o7
	edge8l	%l4,	%l2,	%l0
	umulcc	%o1,	%o6,	%i6
	edge16l	%g7,	%o0,	%o3
	subccc	%i4,	0x1ADD,	%l6
	edge32l	%i2,	%o2,	%g2
	ldd	[%l7 + 0x10],	%g2
	fmovsg	%icc,	%f24,	%f14
	xnor	%i3,	0x000C,	%g1
	fmovdneg	%xcc,	%f8,	%f15
	stx	%l5,	[%l7 + 0x70]
	umulcc	%o5,	0x132C,	%i1
	fcmpd	%fcc1,	%f28,	%f14
	popc	0x0E9B,	%i0
	sdivx	%l3,	0x00AB,	%g6
	popc	0x1F4C,	%l1
	edge32n	%i7,	%g5,	%g4
	movrlez	%i5,	0x325,	%o7
	fzero	%f16
	smul	%o4,	0x0BB5,	%l4
	fmovrdgez	%l2,	%f18,	%f26
	sdivcc	%l0,	0x1BB2,	%o6
	fxor	%f16,	%f30,	%f30
	movgu	%icc,	%o1,	%g7
	ld	[%l7 + 0x4C],	%f13
	movvc	%xcc,	%o0,	%i6
	xnor	%o3,	%l6,	%i4
	sra	%o2,	0x0C,	%g2
	smul	%i2,	%g3,	%g1
	movvs	%icc,	%i3,	%l5
	array8	%i1,	%i0,	%l3
	orn	%g6,	0x0EAD,	%l1
	ld	[%l7 + 0x48],	%f20
	udivx	%i7,	0x1B7E,	%o5
	alignaddr	%g4,	%g5,	%i5
	stb	%o4,	[%l7 + 0x56]
	movg	%xcc,	%l4,	%o7
	movl	%xcc,	%l2,	%l0
	fnegs	%f7,	%f12
	ldx	[%l7 + 0x60],	%o6
	movne	%icc,	%o1,	%o0
	ldx	[%l7 + 0x38],	%g7
	fandnot2	%f20,	%f12,	%f28
	srax	%o3,	0x1A,	%l6
	or	%i6,	0x1299,	%i4
	movvs	%xcc,	%o2,	%g2
	array16	%i2,	%g1,	%g3
	stw	%i3,	[%l7 + 0x24]
	ldx	[%l7 + 0x78],	%l5
	fmovrslz	%i0,	%f8,	%f8
	movneg	%xcc,	%l3,	%g6
	srl	%i1,	%i7,	%o5
	edge32	%l1,	%g5,	%i5
	movre	%g4,	%l4,	%o7
	movgu	%icc,	%o4,	%l2
	movneg	%xcc,	%l0,	%o1
	xor	%o0,	%o6,	%g7
	movvc	%icc,	%o3,	%l6
	nop
	set	0x4A, %l3
	sth	%i4,	[%l7 + %l3]
	xor	%i6,	%g2,	%o2
	fandnot2s	%f6,	%f9,	%f30
	edge8ln	%g1,	%g3,	%i3
	mulx	%i2,	%i0,	%l5
	movn	%icc,	%l3,	%g6
	sub	%i7,	0x0EA1,	%o5
	movleu	%xcc,	%l1,	%g5
	ldsb	[%l7 + 0x5E],	%i5
	udiv	%g4,	0x0899,	%i1
	movneg	%icc,	%o7,	%l4
	subccc	%o4,	%l0,	%l2
	fsrc1s	%f15,	%f29
	nop
	set	0x08, %l6
	ldx	[%l7 + %l6],	%o1
	move	%icc,	%o6,	%o0
	movg	%xcc,	%o3,	%l6
	fpadd32	%f4,	%f28,	%f10
	fmovs	%f1,	%f26
	sub	%g7,	%i6,	%g2
	ldsw	[%l7 + 0x58],	%i4
	movrgz	%g1,	%g3,	%i3
	xorcc	%i2,	0x1C51,	%i0
	array8	%l5,	%l3,	%g6
	xor	%i7,	0x1721,	%o5
	edge16ln	%l1,	%g5,	%o2
	fmovrdlz	%g4,	%f22,	%f18
	lduh	[%l7 + 0x68],	%i5
	movrlz	%i1,	0x00D,	%l4
	sethi	0x1C17,	%o4
	ldsb	[%l7 + 0x46],	%l0
	xorcc	%o7,	%o1,	%l2
	save %o6, 0x172D, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f4,	%f30,	%f22
	ldd	[%l7 + 0x40],	%f20
	udivx	%l6,	0x1C6D,	%o3
	alignaddrl	%g7,	%i6,	%g2
	andcc	%g1,	%i4,	%g3
	umulcc	%i3,	0x1CE0,	%i2
	xnor	%l5,	%l3,	%i0
	movcs	%icc,	%g6,	%i7
	fcmple16	%f22,	%f24,	%l1
	fcmped	%fcc0,	%f16,	%f18
	fxnor	%f18,	%f8,	%f0
	umulcc	%o5,	0x1BAF,	%o2
	nop
	set	0x6A, %i2
	lduh	[%l7 + %i2],	%g5
	edge16l	%g4,	%i5,	%i1
	lduh	[%l7 + 0x46],	%o4
	movcc	%xcc,	%l4,	%l0
	xor	%o1,	%l2,	%o6
	popc	0x16F3,	%o0
	udivcc	%l6,	0x17AE,	%o3
	fpack16	%f18,	%f23
	movrne	%o7,	%i6,	%g2
	sethi	0x0638,	%g7
	movvc	%icc,	%i4,	%g3
	subc	%i3,	%i2,	%g1
	lduh	[%l7 + 0x38],	%l5
	smul	%i0,	%l3,	%g6
	fmovd	%f14,	%f6
	movn	%icc,	%i7,	%o5
	srlx	%o2,	0x04,	%l1
	fsrc1	%f24,	%f26
	edge32ln	%g5,	%i5,	%g4
	move	%xcc,	%i1,	%l4
	ldx	[%l7 + 0x30],	%l0
	smulcc	%o4,	%o1,	%o6
	lduw	[%l7 + 0x6C],	%o0
	orn	%l6,	0x1352,	%o3
	movcc	%icc,	%o7,	%l2
	udivcc	%g2,	0x16F1,	%i6
	move	%icc,	%g7,	%g3
	sdivx	%i3,	0x14B7,	%i2
	ldx	[%l7 + 0x30],	%g1
	movvc	%xcc,	%i4,	%l5
	udivcc	%i0,	0x0509,	%g6
	mova	%xcc,	%i7,	%o5
	sethi	0x1E4A,	%o2
	and	%l1,	0x12C2,	%l3
	edge8l	%g5,	%i5,	%i1
	nop
	set	0x28, %g5
	ldsw	[%l7 + %g5],	%g4
	fnor	%f8,	%f2,	%f8
	stb	%l4,	[%l7 + 0x7C]
	stx	%o4,	[%l7 + 0x30]
	udivcc	%o1,	0x0297,	%l0
	fmovda	%icc,	%f28,	%f18
	fmovdn	%xcc,	%f11,	%f4
	movgu	%icc,	%o0,	%o6
	fmovrdgz	%o3,	%f30,	%f16
	sth	%l6,	[%l7 + 0x26]
	movn	%icc,	%o7,	%g2
	movcs	%icc,	%i6,	%g7
	udivx	%g3,	0x054A,	%l2
	nop
	set	0x70, %o7
	ldx	[%l7 + %o7],	%i2
	smulcc	%i3,	0x0F61,	%i4
	xorcc	%g1,	%i0,	%g6
	movleu	%xcc,	%l5,	%i7
	fcmple32	%f0,	%f24,	%o5
	sllx	%l1,	0x0E,	%o2
	subcc	%l3,	%i5,	%g5
	umul	%i1,	%l4,	%g4
	srlx	%o1,	%o4,	%o0
	array16	%l0,	%o6,	%o3
	fmovrsne	%o7,	%f3,	%f29
	smulcc	%l6,	0x1E45,	%i6
	udivcc	%g2,	0x0702,	%g3
	fpsub32	%f14,	%f20,	%f10
	fsrc1	%f2,	%f4
	movg	%icc,	%l2,	%i2
	andncc	%i3,	%i4,	%g7
	fmuld8sux16	%f21,	%f13,	%f20
	stb	%g1,	[%l7 + 0x6B]
	movrne	%i0,	%l5,	%g6
	lduh	[%l7 + 0x4A],	%i7
	fabsd	%f20,	%f12
	srlx	%o5,	%o2,	%l1
	fmovda	%icc,	%f31,	%f5
	sub	%l3,	0x12D6,	%g5
	edge16l	%i5,	%i1,	%l4
	udivx	%o1,	0x0A0D,	%o4
	sllx	%o0,	%g4,	%l0
	nop
	set	0x28, %g3
	std	%f8,	[%l7 + %g3]
	array32	%o3,	%o6,	%o7
	edge32n	%l6,	%g2,	%g3
	stw	%i6,	[%l7 + 0x54]
	edge16	%l2,	%i2,	%i3
	subccc	%g7,	0x08F1,	%g1
	andcc	%i0,	0x0EF1,	%l5
	ld	[%l7 + 0x58],	%f7
	smul	%g6,	0x0D6C,	%i7
	array32	%o5,	%i4,	%l1
	edge32l	%o2,	%g5,	%l3
	lduh	[%l7 + 0x22],	%i5
	fandnot2	%f30,	%f22,	%f18
	fmovrdlz	%l4,	%f0,	%f20
	fpadd16s	%f12,	%f7,	%f25
	ldd	[%l7 + 0x30],	%o0
	add	%i1,	%o0,	%g4
	xnor	%o4,	%o3,	%o6
	ldsb	[%l7 + 0x0C],	%o7
	fmovdpos	%icc,	%f25,	%f25
	fmovdg	%icc,	%f17,	%f30
	movleu	%icc,	%l0,	%l6
	andncc	%g2,	%g3,	%i6
	ldx	[%l7 + 0x60],	%l2
	movvs	%xcc,	%i2,	%g7
	edge32n	%g1,	%i0,	%l5
	fmovscs	%xcc,	%f17,	%f7
	sub	%i3,	%g6,	%o5
	fpadd16	%f26,	%f2,	%f28
	fmovrdlez	%i7,	%f18,	%f8
	array8	%l1,	%o2,	%i4
	movl	%xcc,	%l3,	%i5
	edge8l	%g5,	%o1,	%i1
	movl	%xcc,	%l4,	%o0
	srax	%g4,	0x1E,	%o3
	popc	%o6,	%o7
	srlx	%l0,	%l6,	%o4
	movrlz	%g2,	%g3,	%l2
	add	%i2,	%i6,	%g1
	movg	%xcc,	%i0,	%g7
	fmovdneg	%xcc,	%f12,	%f28
	movrlz	%l5,	%i3,	%o5
	movne	%xcc,	%g6,	%i7
	std	%f0,	[%l7 + 0x68]
	fmovrslz	%l1,	%f8,	%f15
	orncc	%i4,	0x0F4C,	%l3
	edge16ln	%o2,	%i5,	%g5
	udivx	%o1,	0x0B7E,	%l4
	srl	%o0,	0x02,	%g4
	movcs	%icc,	%i1,	%o6
	fmovdpos	%icc,	%f25,	%f23
	fmovrde	%o3,	%f20,	%f16
	ldd	[%l7 + 0x08],	%l0
	fpack32	%f24,	%f24,	%f8
	stw	%l6,	[%l7 + 0x34]
	srlx	%o4,	%o7,	%g3
	and	%g2,	0x1DD5,	%i2
	addc	%i6,	0x1865,	%g1
	edge8	%i0,	%g7,	%l5
	ldsh	[%l7 + 0x66],	%i3
	xor	%o5,	0x02D1,	%l2
	movrgz	%i7,	%g6,	%l1
	movne	%xcc,	%i4,	%l3
	movrgez	%o2,	%g5,	%i5
	movvs	%icc,	%o1,	%l4
	smul	%o0,	%g4,	%i1
	fmul8x16au	%f2,	%f30,	%f14
	mulscc	%o6,	%o3,	%l6
	subccc	%o4,	%l0,	%o7
	mova	%icc,	%g3,	%i2
	xor	%g2,	0x14E9,	%i6
	orcc	%g1,	%g7,	%i0
	fmuld8sux16	%f20,	%f22,	%f26
	popc	0x0F93,	%l5
	orcc	%i3,	0x0CAA,	%l2
	orcc	%i7,	%o5,	%l1
	movrgz	%g6,	0x1B1,	%i4
	xnorcc	%l3,	%g5,	%o2
	ldd	[%l7 + 0x10],	%o0
	fmovdvc	%icc,	%f3,	%f8
	movpos	%xcc,	%l4,	%i5
	ldsw	[%l7 + 0x54],	%g4
	ld	[%l7 + 0x0C],	%f15
	alignaddr	%i1,	%o6,	%o3
	fsrc1	%f14,	%f6
	fmovse	%icc,	%f29,	%f20
	movne	%xcc,	%o0,	%l6
	orcc	%l0,	0x1C4C,	%o4
	ldsb	[%l7 + 0x72],	%o7
	movre	%g3,	0x07D,	%g2
	movrlez	%i2,	0x2E0,	%i6
	array8	%g1,	%i0,	%l5
	ld	[%l7 + 0x68],	%f10
	edge32	%g7,	%l2,	%i3
	fmovsa	%icc,	%f2,	%f7
	edge8ln	%i7,	%o5,	%g6
	umul	%i4,	%l3,	%g5
	fnegs	%f27,	%f25
	movcs	%icc,	%o2,	%o1
	fmovs	%f21,	%f18
	fmovscc	%xcc,	%f21,	%f21
	fnor	%f26,	%f10,	%f6
	movleu	%icc,	%l4,	%i5
	sub	%g4,	%l1,	%i1
	mulscc	%o6,	%o3,	%l6
	ldsw	[%l7 + 0x68],	%l0
	faligndata	%f18,	%f16,	%f4
	fpadd32	%f16,	%f22,	%f4
	ldx	[%l7 + 0x08],	%o0
	fcmpne32	%f16,	%f16,	%o4
	array8	%o7,	%g2,	%g3
	nop
	set	0x20, %l4
	ldd	[%l7 + %l4],	%f0
	array16	%i6,	%i2,	%i0
	srl	%l5,	0x0D,	%g7
	xnor	%l2,	%i3,	%i7
	ldsw	[%l7 + 0x18],	%g1
	ldd	[%l7 + 0x30],	%o4
	move	%icc,	%g6,	%l3
	movl	%icc,	%i4,	%o2
	popc	0x1066,	%g5
	edge16l	%o1,	%i5,	%g4
	fornot1s	%f15,	%f9,	%f17
	fmovdne	%xcc,	%f5,	%f20
	ld	[%l7 + 0x28],	%f26
	movcc	%xcc,	%l1,	%l4
	movneg	%xcc,	%i1,	%o3
	movvc	%xcc,	%l6,	%l0
	fcmped	%fcc0,	%f12,	%f28
	sethi	0x18F8,	%o0
	fornot1	%f0,	%f14,	%f26
	movge	%icc,	%o6,	%o4
	movge	%xcc,	%g2,	%o7
	umul	%g3,	%i2,	%i0
	nop
	set	0x42, %o6
	ldsh	[%l7 + %o6],	%l5
	subc	%i6,	0x1A62,	%g7
	addccc	%i3,	0x10A7,	%l2
	ldx	[%l7 + 0x10],	%g1
	fmovsl	%icc,	%f28,	%f30
	edge16ln	%i7,	%g6,	%o5
	edge16	%i4,	%o2,	%g5
	array16	%o1,	%i5,	%g4
	edge16n	%l3,	%l1,	%l4
	movne	%xcc,	%o3,	%l6
	stw	%l0,	[%l7 + 0x18]
	subc	%i1,	%o6,	%o0
	mulx	%g2,	%o7,	%o4
	addccc	%i2,	%i0,	%g3
	fmovdleu	%icc,	%f19,	%f12
	fandnot2	%f4,	%f20,	%f24
	alignaddrl	%i6,	%l5,	%g7
	edge32ln	%i3,	%l2,	%i7
	sdivcc	%g6,	0x1449,	%o5
	sdivcc	%g1,	0x0085,	%i4
	save %o2, %o1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%g4,	%i5
	mulscc	%l3,	%l1,	%l4
	fcmpeq32	%f18,	%f24,	%l6
	fmovdneg	%xcc,	%f16,	%f19
	add	%o3,	%i1,	%o6
	edge16n	%o0,	%l0,	%g2
	subcc	%o7,	%o4,	%i0
	edge8	%i2,	%i6,	%g3
	sdivcc	%g7,	0x16D8,	%i3
	bshuffle	%f30,	%f30,	%f4
	sdivcc	%l2,	0x11B2,	%l5
	array32	%i7,	%o5,	%g1
	sdivcc	%g6,	0x06BC,	%o2
	edge8n	%o1,	%i4,	%g5
	fabss	%f14,	%f15
	edge32	%i5,	%l3,	%l1
	fones	%f27
	andcc	%g4,	0x0A70,	%l4
	xnorcc	%o3,	%i1,	%o6
	fmovdg	%xcc,	%f21,	%f29
	alignaddrl	%o0,	%l6,	%l0
	fmovsne	%icc,	%f19,	%f21
	lduh	[%l7 + 0x28],	%o7
	stb	%o4,	[%l7 + 0x66]
	movneg	%xcc,	%i0,	%i2
	movrlez	%i6,	%g2,	%g3
	fones	%f13
	edge32l	%i3,	%g7,	%l2
	subcc	%i7,	0x1361,	%o5
	nop
	set	0x64, %g2
	lduw	[%l7 + %g2],	%g1
	movge	%icc,	%g6,	%o2
	fcmpgt16	%f0,	%f28,	%l5
	sir	0x0C95
	movrne	%o1,	%g5,	%i4
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	edge32ln	%i5,	%g4,	%o3
	movrgez	%i1,	%o6,	%l4
	sdivx	%l6,	0x02A9,	%l0
	fmuld8ulx16	%f28,	%f21,	%f18
	std	%f24,	[%l7 + 0x40]
	mulscc	%o0,	0x1BE5,	%o4
	fmovspos	%icc,	%f6,	%f8
	fmovrse	%i0,	%f10,	%f1
	array32	%i2,	%i6,	%o7
	addccc	%g2,	0x0B54,	%i3
	fandnot2s	%f17,	%f9,	%f7
	movgu	%icc,	%g3,	%l2
	fabss	%f3,	%f5
	udivx	%g7,	0x1EB2,	%i7
	popc	0x09BA,	%o5
	movpos	%icc,	%g1,	%g6
	fmovspos	%icc,	%f11,	%f31
	lduw	[%l7 + 0x28],	%o2
	edge32n	%o1,	%l5,	%i4
	subcc	%l3,	%l1,	%i5
	alignaddrl	%g4,	%o3,	%i1
	sethi	0x1FBB,	%g5
	umul	%l4,	%o6,	%l6
	movpos	%icc,	%l0,	%o4
	sdivx	%o0,	0x1878,	%i2
	alignaddr	%i6,	%i0,	%g2
	ldx	[%l7 + 0x10],	%o7
	fmovse	%xcc,	%f17,	%f27
	fand	%f4,	%f10,	%f10
	fsrc1	%f28,	%f24
	fmul8x16	%f1,	%f2,	%f10
	udivx	%g3,	0x15A6,	%l2
	movn	%xcc,	%i3,	%i7
	fcmple16	%f16,	%f28,	%g7
	fmovsleu	%xcc,	%f8,	%f29
	edge16l	%g1,	%g6,	%o2
	fabsd	%f10,	%f8
	orncc	%o1,	%o5,	%l5
	edge16	%l3,	%i4,	%i5
	sir	0x1A4A
	alignaddrl	%g4,	%o3,	%l1
	edge16ln	%g5,	%l4,	%i1
	siam	0x1
	fsrc2s	%f10,	%f31
	ldd	[%l7 + 0x28],	%f20
	ldd	[%l7 + 0x70],	%i6
	stb	%o6,	[%l7 + 0x48]
	edge16ln	%o4,	%l0,	%i2
	fpack16	%f8,	%f2
	movcs	%icc,	%i6,	%o0
	fcmped	%fcc2,	%f24,	%f20
	srl	%g2,	0x00,	%o7
	andncc	%g3,	%l2,	%i3
	movne	%xcc,	%i0,	%g7
	ldsh	[%l7 + 0x6A],	%g1
	fmovdcs	%icc,	%f5,	%f21
	fexpand	%f22,	%f28
	fmovsge	%icc,	%f9,	%f24
	fxors	%f26,	%f30,	%f31
	st	%f11,	[%l7 + 0x28]
	ldsh	[%l7 + 0x4E],	%g6
	ldd	[%l7 + 0x08],	%o2
	umulcc	%i7,	%o1,	%o5
	umul	%l3,	0x05BA,	%i4
	fcmps	%fcc1,	%f9,	%f24
	edge16n	%i5,	%g4,	%o3
	fpack16	%f4,	%f0
	ldsb	[%l7 + 0x6F],	%l5
	smul	%g5,	0x0601,	%l1
	movrne	%i1,	0x314,	%l6
	addc	%o6,	0x1201,	%l4
	alignaddrl	%o4,	%i2,	%l0
	array8	%o0,	%i6,	%o7
	sir	0x16C4
	xorcc	%g2,	%l2,	%g3
	mulx	%i0,	0x1E21,	%g7
	edge8l	%g1,	%i3,	%g6
	smulcc	%o2,	0x1B03,	%i7
	subc	%o1,	%l3,	%i4
	smul	%o5,	%i5,	%o3
	sethi	0x1D1E,	%l5
	xorcc	%g4,	%l1,	%g5
	fsrc2s	%f21,	%f5
	ld	[%l7 + 0x4C],	%f6
	movneg	%icc,	%i1,	%l6
	sth	%o6,	[%l7 + 0x7A]
	xnorcc	%o4,	0x1902,	%l4
	for	%f6,	%f12,	%f26
	std	%f28,	[%l7 + 0x38]
	fornot1	%f4,	%f12,	%f24
	andncc	%l0,	%o0,	%i2
	fpsub32s	%f15,	%f31,	%f12
	ld	[%l7 + 0x28],	%f18
	fnors	%f10,	%f6,	%f26
	fexpand	%f15,	%f22
	udiv	%o7,	0x0F89,	%g2
	fnor	%f18,	%f10,	%f6
	fxnor	%f2,	%f26,	%f12
	umul	%l2,	0x1F38,	%i6
	ldd	[%l7 + 0x70],	%f26
	fmul8x16al	%f25,	%f0,	%f0
	andn	%g3,	%g7,	%i0
	edge32	%g1,	%g6,	%o2
	fmovsleu	%xcc,	%f1,	%f10
	popc	%i7,	%i3
	fpadd32	%f8,	%f6,	%f12
	sdivcc	%o1,	0x0A0B,	%i4
	stb	%o5,	[%l7 + 0x34]
	srl	%i5,	%o3,	%l3
	subc	%g4,	%l5,	%l1
	xorcc	%i1,	0x0C87,	%g5
	fmovdvs	%icc,	%f10,	%f5
	st	%f18,	[%l7 + 0x64]
	srl	%o6,	0x04,	%o4
	movrgz	%l4,	%l6,	%l0
	ldub	[%l7 + 0x66],	%o0
	movre	%o7,	0x101,	%g2
	addccc	%i2,	%i6,	%l2
	fmovd	%f12,	%f18
	movpos	%icc,	%g3,	%i0
	orn	%g1,	%g7,	%g6
	movrgz	%i7,	%o2,	%i3
	or	%o1,	0x1CD2,	%i4
	umul	%i5,	%o3,	%o5
	add	%g4,	0x0CAB,	%l5
	sir	0x1C0D
	fzero	%f28
	fpack16	%f14,	%f19
	stw	%l1,	[%l7 + 0x30]
	smul	%i1,	0x1415,	%g5
	fandnot1	%f16,	%f8,	%f20
	fmovsl	%xcc,	%f29,	%f9
	and	%o6,	0x13A2,	%o4
	umul	%l3,	%l6,	%l0
	movg	%xcc,	%o0,	%o7
	movrgez	%g2,	0x2CE,	%l4
	stb	%i2,	[%l7 + 0x52]
	ldsh	[%l7 + 0x56],	%l2
	mulscc	%i6,	%g3,	%g1
	array8	%i0,	%g7,	%g6
	andn	%i7,	0x12C8,	%o2
	movrgez	%i3,	%o1,	%i4
	edge32n	%o3,	%o5,	%i5
	edge16n	%l5,	%l1,	%i1
	fandnot1s	%f10,	%f19,	%f0
	fxnors	%f23,	%f25,	%f31
	st	%f14,	[%l7 + 0x50]
	smul	%g5,	0x00CC,	%g4
	movrlz	%o6,	0x1F9,	%o4
	mova	%icc,	%l6,	%l3
	movne	%icc,	%l0,	%o7
	edge32n	%o0,	%g2,	%l4
	fcmple16	%f0,	%f6,	%i2
	ld	[%l7 + 0x4C],	%f30
	move	%xcc,	%l2,	%i6
	ldub	[%l7 + 0x16],	%g3
	fcmpeq32	%f2,	%f8,	%g1
	sir	0x01E5
	ldsb	[%l7 + 0x58],	%g7
	edge16l	%i0,	%g6,	%o2
	movleu	%icc,	%i3,	%o1
	or	%i7,	%o3,	%o5
	fzeros	%f5
	movrne	%i4,	%i5,	%l5
	xnor	%l1,	0x0C4D,	%i1
	movvs	%icc,	%g5,	%g4
	addc	%o4,	0x1E9A,	%l6
	fcmpgt16	%f2,	%f12,	%o6
	alignaddr	%l3,	%o7,	%l0
	fandnot2	%f30,	%f18,	%f22
	or	%o0,	0x0668,	%g2
	movpos	%xcc,	%l4,	%l2
	edge16	%i2,	%g3,	%i6
	addccc	%g1,	0x098C,	%i0
	fcmple32	%f4,	%f26,	%g7
	stb	%g6,	[%l7 + 0x17]
	array16	%i3,	%o1,	%o2
	edge16l	%o3,	%i7,	%o5
	udivx	%i5,	0x0B46,	%l5
	movrne	%i4,	0x0F0,	%i1
	edge32n	%g5,	%g4,	%o4
	edge8l	%l6,	%o6,	%l1
	udiv	%o7,	0x155B,	%l3
	movrlz	%o0,	0x3DD,	%g2
	srl	%l4,	%l0,	%i2
	fnot2	%f26,	%f24
	fmovde	%xcc,	%f11,	%f25
	faligndata	%f20,	%f22,	%f2
	fcmple16	%f20,	%f28,	%g3
	fmovs	%f18,	%f27
	edge16ln	%i6,	%l2,	%g1
	subc	%g7,	%g6,	%i0
	fmovrdgez	%o1,	%f14,	%f16
	bshuffle	%f20,	%f26,	%f22
	edge32ln	%o2,	%i3,	%o3
	movne	%icc,	%o5,	%i5
	addcc	%l5,	%i4,	%i1
	lduw	[%l7 + 0x6C],	%g5
	sdiv	%g4,	0x02C9,	%i7
	udiv	%l6,	0x132A,	%o6
	orn	%l1,	%o4,	%o7
	movneg	%xcc,	%o0,	%g2
	edge16l	%l3,	%l4,	%i2
	fpadd32s	%f28,	%f10,	%f1
	ldx	[%l7 + 0x38],	%g3
	stb	%i6,	[%l7 + 0x21]
	edge32n	%l0,	%g1,	%l2
	array8	%g7,	%i0,	%g6
	mulx	%o1,	0x0F5A,	%i3
	alignaddr	%o2,	%o5,	%o3
	movg	%icc,	%l5,	%i4
	orcc	%i5,	%g5,	%i1
	edge8ln	%i7,	%g4,	%o6
	fpackfix	%f16,	%f17
	xorcc	%l1,	0x1222,	%o4
	sub	%l6,	%o7,	%g2
	lduh	[%l7 + 0x38],	%o0
	mulx	%l3,	%i2,	%g3
	udivx	%i6,	0x1B54,	%l4
	mulx	%l0,	0x16F8,	%l2
	alignaddrl	%g7,	%i0,	%g1
	fcmpne16	%f10,	%f26,	%g6
	movcs	%icc,	%i3,	%o2
	movleu	%xcc,	%o1,	%o5
	smul	%l5,	0x1510,	%i4
	fands	%f18,	%f19,	%f6
	st	%f22,	[%l7 + 0x24]
	movrlz	%i5,	0x2F9,	%g5
	ldsh	[%l7 + 0x60],	%o3
	fpack32	%f6,	%f10,	%f14
	addccc	%i7,	%i1,	%o6
	srl	%g4,	0x0C,	%o4
	movrgez	%l6,	%o7,	%g2
	pdist	%f22,	%f4,	%f24
	movleu	%xcc,	%o0,	%l1
	fnegs	%f6,	%f24
	xnor	%i2,	0x0DBE,	%l3
	movre	%i6,	0x1BB,	%l4
	srl	%l0,	0x1B,	%l2
	sub	%g3,	0x17B4,	%i0
	movvc	%xcc,	%g7,	%g6
	orncc	%g1,	%o2,	%o1
	stx	%i3,	[%l7 + 0x08]
	ldsb	[%l7 + 0x34],	%o5
	fors	%f7,	%f31,	%f17
	movn	%icc,	%l5,	%i4
	mova	%icc,	%i5,	%o3
	alignaddrl	%i7,	%i1,	%o6
	move	%icc,	%g4,	%g5
	movpos	%icc,	%l6,	%o4
	alignaddrl	%o7,	%o0,	%g2
	movpos	%xcc,	%i2,	%l1
	movneg	%xcc,	%l3,	%i6
	subcc	%l0,	%l4,	%g3
	ldsw	[%l7 + 0x48],	%i0
	edge8l	%l2,	%g6,	%g7
	udivcc	%o2,	0x0A5D,	%o1
	subccc	%i3,	0x1FD4,	%o5
	udivcc	%l5,	0x1D28,	%i4
	add	%i5,	%g1,	%o3
	nop
	set	0x3C, %l0
	ldsh	[%l7 + %l0],	%i7
	stb	%i1,	[%l7 + 0x37]
	udivcc	%o6,	0x00EF,	%g4
	fmovdcc	%xcc,	%f31,	%f16
	umulcc	%l6,	0x1401,	%g5
	umul	%o7,	0x0FDA,	%o0
	array8	%g2,	%i2,	%o4
	movle	%icc,	%l3,	%i6
	sdivx	%l1,	0x0BB2,	%l4
	xor	%l0,	0x1673,	%i0
	st	%f21,	[%l7 + 0x7C]
	fmovdgu	%xcc,	%f29,	%f25
	stx	%g3,	[%l7 + 0x20]
	or	%l2,	0x08DA,	%g7
	alignaddr	%o2,	%g6,	%o1
	ldd	[%l7 + 0x70],	%o4
	fpsub16s	%f8,	%f8,	%f30
	nop
	set	0x10, %o0
	ldsw	[%l7 + %o0],	%l5
	smulcc	%i4,	%i3,	%g1
	addccc	%i5,	0x1E59,	%i7
	movpos	%xcc,	%i1,	%o6
	movl	%xcc,	%o3,	%g4
	fmovrslez	%g5,	%f14,	%f1
	and	%o7,	%o0,	%l6
	sir	0x014A
	siam	0x4
	ldub	[%l7 + 0x49],	%g2
	movcs	%xcc,	%i2,	%o4
	lduh	[%l7 + 0x16],	%i6
	addc	%l1,	0x0161,	%l3
	nop
	set	0x38, %l2
	ldub	[%l7 + %l2],	%l0
	fcmpeq32	%f12,	%f14,	%i0
	fmovscc	%icc,	%f1,	%f6
	sir	0x0F98
	array32	%l4,	%l2,	%g7
	addcc	%g3,	0x0F9E,	%g6
	edge16ln	%o2,	%o1,	%o5
	edge16n	%l5,	%i3,	%g1
	fone	%f30
	fone	%f30
	sdivcc	%i5,	0x0399,	%i4
	fnot1s	%f8,	%f14
	sll	%i1,	0x03,	%i7
	smul	%o3,	0x1596,	%o6
	movcc	%xcc,	%g4,	%o7
	sethi	0x1FB1,	%o0
	std	%f12,	[%l7 + 0x18]
	sth	%l6,	[%l7 + 0x30]
	andncc	%g5,	%g2,	%i2
	sllx	%o4,	%l1,	%i6
	movn	%icc,	%l0,	%i0
	movcc	%xcc,	%l4,	%l3
	array16	%l2,	%g3,	%g6
	movrne	%g7,	0x03E,	%o2
	xnorcc	%o5,	0x1823,	%o1
	umul	%i3,	0x0987,	%g1
	movgu	%icc,	%l5,	%i4
	ldsw	[%l7 + 0x18],	%i1
	orcc	%i7,	%i5,	%o3
	fmovrdlez	%g4,	%f12,	%f4
	orncc	%o7,	%o6,	%l6
	edge16ln	%o0,	%g2,	%i2
	array8	%o4,	%l1,	%i6
	addccc	%l0,	%i0,	%l4
	mulx	%g5,	%l2,	%l3
	fnot1s	%f8,	%f16
	fandnot2	%f26,	%f12,	%f30
	ldsw	[%l7 + 0x7C],	%g6
	fmovdn	%xcc,	%f6,	%f27
	udivcc	%g3,	0x12BB,	%g7
	ldd	[%l7 + 0x40],	%o4
	array16	%o1,	%i3,	%o2
	movl	%icc,	%g1,	%i4
	fcmpeq32	%f24,	%f28,	%i1
	udiv	%i7,	0x0E82,	%l5
	fcmple16	%f24,	%f14,	%i5
	movge	%icc,	%g4,	%o3
	alignaddrl	%o7,	%l6,	%o0
	sethi	0x07B2,	%g2
	fands	%f19,	%f1,	%f27
	fmovrsgez	%o6,	%f31,	%f3
	array8	%i2,	%l1,	%o4
	addcc	%l0,	0x16AF,	%i0
	orcc	%i6,	%g5,	%l2
	mova	%xcc,	%l4,	%l3
	movl	%icc,	%g3,	%g6
	for	%f18,	%f22,	%f14
	ldd	[%l7 + 0x28],	%g6
	fexpand	%f9,	%f2
	xnor	%o1,	%o5,	%i3
	addcc	%g1,	0x1E3D,	%o2
	xnorcc	%i4,	%i7,	%i1
	movneg	%icc,	%i5,	%g4
	subcc	%o3,	0x0F88,	%o7
	edge16n	%l6,	%o0,	%l5
	array32	%g2,	%o6,	%l1
	fcmple32	%f16,	%f22,	%o4
	st	%f23,	[%l7 + 0x60]
	movrne	%i2,	%l0,	%i0
	edge8	%i6,	%g5,	%l2
	subccc	%l4,	0x1C4E,	%l3
	movge	%icc,	%g6,	%g7
	restore %g3, %o1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g1,	%i3,	%o2
	edge32	%i4,	%i7,	%i5
	stw	%i1,	[%l7 + 0x7C]
	fmovrdlz	%o3,	%f14,	%f28
	xor	%g4,	%o7,	%o0
	fmovspos	%xcc,	%f29,	%f6
	umul	%l5,	%l6,	%o6
	fpadd32s	%f27,	%f0,	%f20
	xorcc	%l1,	%g2,	%i2
	ldsb	[%l7 + 0x36],	%o4
	orn	%l0,	%i6,	%i0
	and	%l2,	%l4,	%g5
	addc	%g6,	0x002A,	%l3
	movneg	%xcc,	%g7,	%g3
	fpadd16s	%f31,	%f13,	%f23
	umulcc	%o1,	0x14A6,	%g1
	fexpand	%f5,	%f6
	xnor	%i3,	%o2,	%i4
	fmul8sux16	%f20,	%f16,	%f4
	fornot2	%f16,	%f4,	%f0
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	edge8n	%i1,	%o3,	%g4
	alignaddr	%o7,	%o0,	%i5
	udivx	%l5,	0x0CB5,	%o6
	bshuffle	%f24,	%f22,	%f2
	fcmpd	%fcc3,	%f0,	%f0
	st	%f12,	[%l7 + 0x7C]
	pdist	%f12,	%f22,	%f28
	and	%l1,	%g2,	%l6
	ldub	[%l7 + 0x60],	%i2
	umul	%o4,	%i6,	%l0
	andn	%l2,	%l4,	%i0
	udiv	%g6,	0x02EF,	%l3
	addc	%g5,	0x065B,	%g7
	srax	%o1,	0x13,	%g3
	orncc	%i3,	0x0C7B,	%o2
	fmovdvs	%icc,	%f3,	%f15
	stb	%i4,	[%l7 + 0x2C]
	sdivcc	%g1,	0x02CA,	%i7
	ldd	[%l7 + 0x40],	%i0
	fmovdleu	%icc,	%f22,	%f31
	addcc	%o5,	0x11F2,	%o3
	movneg	%xcc,	%o7,	%g4
	fcmpes	%fcc0,	%f8,	%f14
	edge16n	%i5,	%o0,	%l5
	array8	%o6,	%l1,	%g2
	fmul8sux16	%f8,	%f14,	%f30
	ld	[%l7 + 0x5C],	%f28
	movpos	%xcc,	%i2,	%l6
	st	%f15,	[%l7 + 0x08]
	sethi	0x0271,	%o4
	fmovspos	%icc,	%f10,	%f3
	stb	%i6,	[%l7 + 0x6E]
	orcc	%l2,	0x0724,	%l4
	edge16l	%l0,	%g6,	%i0
	fcmpne16	%f8,	%f20,	%g5
	ldub	[%l7 + 0x1F],	%g7
	sth	%o1,	[%l7 + 0x3C]
	edge16l	%g3,	%l3,	%o2
	subcc	%i4,	%i3,	%g1
	ldsb	[%l7 + 0x4F],	%i1
	srax	%o5,	0x14,	%i7
	ldsw	[%l7 + 0x3C],	%o3
	movrgz	%g4,	0x3F3,	%i5
	edge32	%o7,	%l5,	%o0
	fzeros	%f10
	xorcc	%l1,	%g2,	%o6
	edge32n	%l6,	%o4,	%i6
	addccc	%i2,	%l4,	%l0
	subccc	%l2,	%g6,	%i0
	edge32l	%g5,	%g7,	%o1
	move	%icc,	%g3,	%l3
	andn	%o2,	%i4,	%i3
	xor	%i1,	0x0301,	%g1
	edge32ln	%i7,	%o3,	%o5
	edge32l	%g4,	%o7,	%l5
	fmovdpos	%icc,	%f31,	%f3
	movvs	%icc,	%o0,	%l1
	udivcc	%i5,	0x0088,	%o6
	xorcc	%g2,	0x1532,	%o4
	fornot2s	%f17,	%f29,	%f29
	addc	%i6,	0x14A3,	%i2
	movneg	%icc,	%l6,	%l4
	movle	%xcc,	%l2,	%l0
	fmovsa	%xcc,	%f0,	%f7
	movcc	%icc,	%i0,	%g5
	fmuld8sux16	%f17,	%f24,	%f18
	sub	%g6,	0x0CF8,	%o1
	sub	%g7,	%l3,	%o2
	addccc	%g3,	%i4,	%i1
	ldx	[%l7 + 0x78],	%g1
	udivx	%i3,	0x0577,	%o3
	orncc	%o5,	%g4,	%i7
	movcc	%xcc,	%l5,	%o7
	orn	%l1,	0x0347,	%o0
	popc	0x06BE,	%i5
	xnor	%g2,	0x0CF2,	%o6
	fmovsgu	%xcc,	%f22,	%f31
	fsrc2s	%f9,	%f2
	udivx	%o4,	0x107B,	%i6
	movrgez	%l6,	0x3CB,	%i2
	add	%l2,	%l4,	%i0
	fabss	%f25,	%f29
	lduh	[%l7 + 0x48],	%g5
	sdiv	%g6,	0x0F6B,	%l0
	pdist	%f20,	%f0,	%f24
	fmovsne	%icc,	%f2,	%f11
	fmovdpos	%icc,	%f20,	%f12
	xor	%o1,	0x07BA,	%l3
	movrlz	%g7,	0x234,	%g3
	fmovrslez	%i4,	%f12,	%f3
	smulcc	%i1,	0x0AB5,	%g1
	movleu	%xcc,	%i3,	%o2
	pdist	%f22,	%f26,	%f24
	andn	%o5,	0x08F9,	%o3
	sir	0x0A54
	movvc	%icc,	%g4,	%i7
	movcc	%icc,	%o7,	%l5
	movge	%icc,	%o0,	%i5
	fnot2	%f16,	%f6
	movl	%xcc,	%l1,	%o6
	fmovsg	%xcc,	%f17,	%f14
	srax	%g2,	%i6,	%l6
	fxors	%f24,	%f25,	%f23
	xnorcc	%i2,	%l2,	%l4
	nop
	set	0x48, %l1
	stx	%i0,	[%l7 + %l1]
	fsrc2s	%f8,	%f1
	fmovrslz	%g5,	%f19,	%f15
	save %g6, %o4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x40],	%l3
	sdivx	%g7,	0x1AD3,	%o1
	fcmple16	%f20,	%f16,	%i4
	umulcc	%g3,	0x1AB3,	%i1
	lduw	[%l7 + 0x68],	%i3
	fmovdg	%icc,	%f24,	%f5
	movvs	%xcc,	%g1,	%o2
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%f30
	nop
	set	0x24, %g4
	ldub	[%l7 + %g4],	%o3
	edge8	%o5,	%g4,	%i7
	xor	%o7,	0x0D40,	%l5
	movvc	%icc,	%o0,	%i5
	edge16l	%l1,	%o6,	%i6
	smulcc	%l6,	0x0771,	%i2
	movl	%xcc,	%l2,	%g2
	orn	%l4,	%g5,	%i0
	movleu	%icc,	%o4,	%g6
	movrlz	%l3,	0x14F,	%g7
	fnands	%f27,	%f31,	%f7
	and	%l0,	0x1CF6,	%o1
	movl	%xcc,	%g3,	%i1
	movrlez	%i3,	%g1,	%o2
	ldsb	[%l7 + 0x7B],	%o3
	st	%f23,	[%l7 + 0x4C]
	movcs	%icc,	%o5,	%i4
	udivcc	%g4,	0x04B1,	%o7
	udivx	%l5,	0x01D0,	%i7
	movrgz	%i5,	0x2A8,	%o0
	fors	%f31,	%f6,	%f27
	alignaddr	%l1,	%i6,	%o6
	array8	%i2,	%l6,	%g2
	sra	%l2,	0x00,	%l4
	fmovdneg	%icc,	%f5,	%f12
	movvs	%icc,	%g5,	%i0
	fnot1	%f10,	%f8
	andn	%o4,	0x0E89,	%g6
	udivx	%g7,	0x1802,	%l0
	sdiv	%l3,	0x0C35,	%o1
	edge32n	%g3,	%i3,	%g1
	ldx	[%l7 + 0x70],	%o2
	stw	%o3,	[%l7 + 0x10]
	movpos	%icc,	%o5,	%i1
	movleu	%icc,	%g4,	%o7
	umul	%l5,	0x1254,	%i7
	ldsb	[%l7 + 0x25],	%i5
	ld	[%l7 + 0x60],	%f9
	fsrc1s	%f21,	%f22
	mulscc	%o0,	0x0193,	%i4
	stb	%i6,	[%l7 + 0x61]
	addccc	%o6,	%i2,	%l1
	sub	%l6,	%l2,	%l4
	xnorcc	%g5,	%i0,	%o4
	orncc	%g2,	%g6,	%l0
	stx	%g7,	[%l7 + 0x10]
	lduh	[%l7 + 0x22],	%l3
	orncc	%o1,	0x0B70,	%i3
	xnor	%g1,	0x03BE,	%g3
	edge32	%o3,	%o2,	%o5
	sth	%i1,	[%l7 + 0x20]
	sethi	0x12E1,	%g4
	fcmpgt16	%f4,	%f28,	%l5
	movrlz	%o7,	0x36B,	%i7
	xnorcc	%o0,	0x15AB,	%i4
	fmovdcs	%icc,	%f1,	%f24
	ldsw	[%l7 + 0x34],	%i6
	addcc	%i5,	0x005E,	%o6
	movvc	%xcc,	%l1,	%l6
	ld	[%l7 + 0x3C],	%f1
	andncc	%i2,	%l4,	%g5
	movrne	%l2,	0x1D7,	%o4
	movrlz	%g2,	0x18A,	%g6
	addcc	%i0,	0x015A,	%g7
	popc	0x0DEE,	%l0
	std	%f18,	[%l7 + 0x50]
	xor	%l3,	0x0649,	%i3
	edge32	%o1,	%g3,	%g1
	edge32	%o3,	%o5,	%o2
	sdivx	%i1,	0x01B1,	%g4
	sethi	0x01E1,	%o7
	movrgez	%i7,	0x074,	%o0
	fnot2s	%f12,	%f16
	fones	%f10
	fands	%f24,	%f15,	%f0
	movre	%l5,	%i6,	%i5
	lduw	[%l7 + 0x5C],	%o6
	fmovscs	%icc,	%f10,	%f30
	lduw	[%l7 + 0x70],	%l1
	alignaddrl	%i4,	%l6,	%l4
	xnor	%i2,	0x1C4F,	%l2
	xnor	%o4,	0x10F6,	%g5
	movgu	%icc,	%g6,	%i0
	ldub	[%l7 + 0x0E],	%g7
	fxnor	%f26,	%f4,	%f18
	array8	%l0,	%g2,	%l3
	fcmple32	%f26,	%f20,	%o1
	xorcc	%g3,	0x07A4,	%g1
	nop
	set	0x34, %l5
	ldub	[%l7 + %l5],	%i3
	xorcc	%o3,	%o5,	%o2
	fmuld8ulx16	%f18,	%f1,	%f4
	sdivcc	%i1,	0x0CB2,	%g4
	fmovdvc	%icc,	%f11,	%f7
	ld	[%l7 + 0x10],	%f20
	popc	0x12AB,	%o7
	sllx	%o0,	0x01,	%i7
	sir	0x0877
	edge32	%l5,	%i5,	%i6
	edge8n	%l1,	%o6,	%l6
	udivx	%i4,	0x1D88,	%l4
	fpsub32	%f24,	%f10,	%f8
	edge32	%l2,	%o4,	%i2
	sll	%g5,	%g6,	%i0
	alignaddr	%l0,	%g7,	%l3
	movrlz	%o1,	0x360,	%g3
	edge16l	%g2,	%i3,	%g1
	std	%f20,	[%l7 + 0x58]
	ldx	[%l7 + 0x18],	%o3
	movge	%icc,	%o2,	%i1
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%o4
	umulcc	%o7,	%g4,	%i7
	addccc	%o0,	%i5,	%i6
	fnor	%f30,	%f30,	%f10
	movrgz	%l1,	0x2E2,	%o6
	udivx	%l6,	0x15C1,	%i4
	srlx	%l5,	0x0E,	%l4
	fmovdl	%xcc,	%f25,	%f10
	edge8	%l2,	%o4,	%i2
	fmovdn	%xcc,	%f21,	%f30
	andn	%g5,	%g6,	%l0
	edge16ln	%i0,	%g7,	%o1
	ldd	[%l7 + 0x58],	%f28
	array32	%l3,	%g2,	%i3
	sdiv	%g1,	0x0284,	%o3
	fpadd32s	%f29,	%f19,	%f5
	addccc	%o2,	%g3,	%i1
	save %o5, 0x0697, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i7,	0x1201,	%o0
	faligndata	%f4,	%f16,	%f4
	edge32n	%i5,	%o7,	%l1
	movvc	%xcc,	%o6,	%l6
	fmovde	%xcc,	%f0,	%f20
	edge8ln	%i6,	%i4,	%l5
	udivcc	%l4,	0x1F6E,	%l2
	movgu	%xcc,	%i2,	%g5
	orcc	%g6,	0x1BB8,	%l0
	array16	%o4,	%g7,	%i0
	orn	%l3,	0x196A,	%o1
	movl	%icc,	%i3,	%g2
	fcmple16	%f10,	%f6,	%g1
	mulx	%o2,	%o3,	%g3
	andncc	%i1,	%g4,	%i7
	srl	%o5,	0x1A,	%o0
	sethi	0x0795,	%i5
	edge32n	%o7,	%l1,	%l6
	subcc	%o6,	0x10A9,	%i4
	fmovdcs	%icc,	%f12,	%f20
	sir	0x1840
	srl	%l5,	0x1D,	%l4
	xorcc	%l2,	0x0C1E,	%i2
	umul	%g5,	%g6,	%i6
	umul	%l0,	0x1E52,	%g7
	move	%icc,	%o4,	%l3
	sth	%o1,	[%l7 + 0x4E]
	srax	%i0,	0x0A,	%i3
	subcc	%g1,	%g2,	%o2
	edge8	%o3,	%g3,	%i1
	movne	%icc,	%g4,	%i7
	subc	%o5,	%i5,	%o0
	fcmple16	%f16,	%f0,	%o7
	edge16n	%l1,	%o6,	%i4
	subc	%l5,	%l6,	%l2
	stx	%i2,	[%l7 + 0x28]
	sdivcc	%g5,	0x0A02,	%l4
	movne	%xcc,	%i6,	%l0
	umul	%g6,	0x0969,	%g7
	fpmerge	%f23,	%f5,	%f14
	movcc	%icc,	%l3,	%o1
	umulcc	%i0,	0x0F3A,	%i3
	andn	%o4,	0x1BEC,	%g1
	nop
	set	0x3A, %i7
	ldsh	[%l7 + %i7],	%g2
	fmovsa	%icc,	%f26,	%f13
	fmovrsgz	%o3,	%f19,	%f18
	nop
	set	0x50, %g7
	stw	%g3,	[%l7 + %g7]
	udivcc	%o2,	0x0203,	%g4
	movcc	%icc,	%i7,	%o5
	fmovse	%icc,	%f27,	%f6
	edge16	%i1,	%o0,	%o7
	subccc	%l1,	%o6,	%i4
	addcc	%i5,	0x1AF8,	%l5
	umulcc	%l6,	0x17DF,	%l2
	ldsb	[%l7 + 0x19],	%g5
	fpadd32s	%f23,	%f15,	%f26
	fcmpeq32	%f26,	%f20,	%l4
	udiv	%i6,	0x08C3,	%i2
	sub	%l0,	%g6,	%l3
	srl	%g7,	%o1,	%i0
	ldx	[%l7 + 0x28],	%i3
	fmovdpos	%icc,	%f10,	%f3
	stx	%g1,	[%l7 + 0x10]
	ldsh	[%l7 + 0x2A],	%o4
	addccc	%o3,	0x1871,	%g2
	umulcc	%g3,	0x1C1E,	%o2
	movrne	%g4,	0x3B0,	%o5
	addc	%i7,	0x09D1,	%i1
	movg	%icc,	%o0,	%l1
	nop
	set	0x10, %i6
	std	%f4,	[%l7 + %i6]
	alignaddrl	%o6,	%o7,	%i5
	movrgez	%l5,	0x26E,	%i4
	movrgz	%l2,	0x08B,	%l6
	movn	%xcc,	%g5,	%i6
	fmovdneg	%xcc,	%f22,	%f18
	stw	%l4,	[%l7 + 0x4C]
	orn	%l0,	0x1487,	%i2
	movne	%icc,	%g6,	%g7
	movneg	%xcc,	%o1,	%l3
	orn	%i0,	%i3,	%o4
	subcc	%o3,	0x1CCF,	%g1
	fabss	%f22,	%f25
	stx	%g3,	[%l7 + 0x60]
	fnand	%f16,	%f16,	%f30
	add	%o2,	%g2,	%o5
	movre	%i7,	%g4,	%o0
	edge32n	%i1,	%o6,	%o7
	sth	%l1,	[%l7 + 0x68]
	fmovda	%xcc,	%f0,	%f12
	sdivcc	%l5,	0x1D71,	%i4
	or	%i5,	%l2,	%l6
	fmovrde	%i6,	%f10,	%f12
	movrlez	%l4,	%l0,	%g5
	movl	%icc,	%g6,	%i2
	andncc	%o1,	%g7,	%i0
	subc	%l3,	%i3,	%o3
	edge16l	%g1,	%g3,	%o2
	movpos	%xcc,	%g2,	%o4
	subc	%o5,	%g4,	%o0
	fmovdneg	%xcc,	%f17,	%f12
	add	%i1,	%i7,	%o7
	fcmpeq32	%f28,	%f0,	%l1
	nop
	set	0x08, %o5
	ldsw	[%l7 + %o5],	%o6
	movge	%icc,	%l5,	%i4
	st	%f27,	[%l7 + 0x08]
	edge8	%i5,	%l2,	%i6
	sra	%l6,	0x18,	%l0
	ldd	[%l7 + 0x58],	%f18
	movvs	%icc,	%g5,	%g6
	ldub	[%l7 + 0x0B],	%l4
	nop
	set	0x7C, %o4
	stb	%o1,	[%l7 + %o4]
	fpadd32s	%f5,	%f19,	%f10
	fmovs	%f28,	%f15
	movvc	%xcc,	%i2,	%g7
	movgu	%icc,	%l3,	%i3
	smulcc	%i0,	%o3,	%g3
	ldub	[%l7 + 0x5E],	%o2
	fsrc1	%f12,	%f12
	fmovscs	%icc,	%f2,	%f11
	fandnot2	%f16,	%f12,	%f2
	lduh	[%l7 + 0x68],	%g1
	edge16l	%o4,	%o5,	%g4
	movvc	%icc,	%o0,	%g2
	sethi	0x1C07,	%i7
	srax	%o7,	0x0E,	%l1
	movn	%xcc,	%i1,	%o6
	umulcc	%l5,	%i4,	%i5
	faligndata	%f30,	%f18,	%f12
	ldsh	[%l7 + 0x22],	%l2
	fabsd	%f8,	%f26
	ldx	[%l7 + 0x50],	%i6
	edge16l	%l6,	%l0,	%g5
	restore %l4, %g6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f23,	%f8
	udivcc	%o1,	0x1EA0,	%l3
	umulcc	%g7,	%i3,	%i0
	edge32n	%o3,	%o2,	%g1
	edge8n	%o4,	%o5,	%g4
	and	%g3,	%g2,	%o0
	mulscc	%i7,	0x1903,	%o7
	alignaddrl	%i1,	%l1,	%o6
	stw	%i4,	[%l7 + 0x44]
	array16	%l5,	%i5,	%l2
	edge16	%i6,	%l6,	%l0
	udiv	%g5,	0x1981,	%l4
	edge16l	%i2,	%o1,	%g6
	movpos	%xcc,	%l3,	%i3
	xor	%g7,	0x15C9,	%i0
	sdiv	%o2,	0x1F58,	%o3
	sll	%g1,	0x03,	%o4
	edge32	%o5,	%g4,	%g3
	sir	0x0EF2
	movgu	%xcc,	%o0,	%g2
	movrlez	%i7,	%i1,	%l1
	andncc	%o6,	%o7,	%l5
	movpos	%xcc,	%i4,	%i5
	sra	%i6,	0x17,	%l2
	fnegd	%f20,	%f20
	srax	%l6,	0x09,	%g5
	save %l4, %i2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g6,	%o1,	%l3
	movrgz	%i3,	0x3C3,	%g7
	sdiv	%o2,	0x1D16,	%o3
	edge8n	%i0,	%o4,	%g1
	fandnot1s	%f23,	%f31,	%f4
	fcmped	%fcc0,	%f12,	%f14
	movvs	%icc,	%o5,	%g4
	movcs	%xcc,	%o0,	%g2
	addcc	%i7,	0x0770,	%i1
	fpack16	%f18,	%f4
	stw	%g3,	[%l7 + 0x1C]
	sdivx	%o6,	0x13BF,	%o7
	xnorcc	%l5,	%i4,	%l1
	edge8n	%i5,	%i6,	%l2
	ldsh	[%l7 + 0x64],	%l6
	stw	%l4,	[%l7 + 0x6C]
	fmovspos	%icc,	%f20,	%f5
	srax	%g5,	%l0,	%i2
	nop
	set	0x4A, %i1
	lduh	[%l7 + %i1],	%o1
	fcmps	%fcc0,	%f9,	%f6
	andncc	%l3,	%g6,	%g7
	edge16ln	%o2,	%o3,	%i0
	sub	%i3,	%o4,	%o5
	fxor	%f28,	%f0,	%f2
	subc	%g4,	%o0,	%g1
	save %i7, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o6,	%o7,	%l5
	addc	%i1,	%l1,	%i4
	xor	%i5,	%i6,	%l2
	smul	%l4,	%l6,	%l0
	sth	%i2,	[%l7 + 0x7A]
	lduw	[%l7 + 0x64],	%o1
	movrgez	%l3,	0x099,	%g5
	xorcc	%g7,	0x150D,	%o2
	xorcc	%o3,	%g6,	%i0
	edge16	%i3,	%o4,	%o5
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fcmple32	%f4,	%f16,	%g1
	fcmpgt16	%f12,	%f28,	%g3
	srlx	%g2,	0x03,	%o7
	edge32n	%l5,	%i1,	%l1
	fnand	%f6,	%f2,	%f2
	xor	%o6,	0x02A6,	%i5
	srlx	%i6,	%i4,	%l4
	fmovdpos	%xcc,	%f21,	%f2
	fnegd	%f12,	%f28
	movpos	%xcc,	%l6,	%l0
	subc	%i2,	%l2,	%o1
	movvc	%icc,	%g5,	%g7
	xnorcc	%l3,	0x1CE2,	%o2
	edge32	%o3,	%g6,	%i0
	orcc	%o4,	%i3,	%o5
	edge8n	%g4,	%i7,	%g1
	andcc	%g3,	0x08ED,	%g2
	edge32	%o0,	%l5,	%i1
	ldd	[%l7 + 0x70],	%o6
	fmovde	%xcc,	%f11,	%f1
	subccc	%l1,	%i5,	%o6
	fnot1	%f18,	%f6
	fmovsvs	%xcc,	%f17,	%f0
	movg	%icc,	%i4,	%l4
	movleu	%xcc,	%l6,	%l0
	sir	0x1664
	lduh	[%l7 + 0x36],	%i6
	edge16n	%i2,	%o1,	%g5
	movcc	%icc,	%l2,	%l3
	edge8n	%g7,	%o3,	%o2
	movrne	%i0,	0x098,	%g6
	edge8ln	%i3,	%o5,	%o4
	udivx	%g4,	0x0B0C,	%g1
	fmovdleu	%xcc,	%f21,	%f11
	movge	%icc,	%g3,	%g2
	movrne	%i7,	%l5,	%i1
	fmovs	%f24,	%f5
	ldsw	[%l7 + 0x20],	%o7
	xorcc	%l1,	%o0,	%i5
	fmovdcc	%xcc,	%f28,	%f7
	edge16l	%i4,	%o6,	%l4
	edge32n	%l0,	%i6,	%i2
	st	%f18,	[%l7 + 0x10]
	movg	%icc,	%o1,	%l6
	sllx	%g5,	0x0C,	%l2
	fcmps	%fcc3,	%f2,	%f27
	alignaddrl	%l3,	%o3,	%g7
	mova	%xcc,	%i0,	%g6
	addcc	%i3,	0x048C,	%o5
	fcmpgt16	%f20,	%f12,	%o4
	mulscc	%o2,	0x1E63,	%g1
	fsrc2s	%f11,	%f10
	movpos	%xcc,	%g3,	%g4
	movrgez	%g2,	0x3A7,	%l5
	andncc	%i7,	%o7,	%l1
	ldx	[%l7 + 0x18],	%i1
	xnorcc	%i5,	%i4,	%o6
	movcs	%xcc,	%l4,	%o0
	edge16n	%i6,	%i2,	%l0
	umulcc	%o1,	0x018F,	%g5
	movvc	%icc,	%l6,	%l2
	st	%f10,	[%l7 + 0x60]
	ldd	[%l7 + 0x08],	%l2
	fpsub16s	%f29,	%f26,	%f14
	srlx	%o3,	%g7,	%i0
	xor	%i3,	0x1D21,	%g6
	fmovrsne	%o4,	%f1,	%f1
	orcc	%o5,	0x0EB4,	%g1
	fmovdneg	%icc,	%f11,	%f25
	alignaddrl	%o2,	%g4,	%g2
	movge	%icc,	%g3,	%l5
	sethi	0x0740,	%i7
	addc	%l1,	%o7,	%i5
	movvc	%icc,	%i4,	%o6
	subccc	%l4,	0x0306,	%i1
	alignaddrl	%i6,	%o0,	%i2
	addcc	%l0,	0x0C13,	%o1
	orncc	%l6,	%g5,	%l2
	smul	%o3,	0x1D9C,	%g7
	fcmpd	%fcc1,	%f4,	%f4
	st	%f31,	[%l7 + 0x38]
	fmovrsne	%i0,	%f18,	%f8
	fmul8x16	%f24,	%f10,	%f4
	fmovdcs	%icc,	%f22,	%f11
	orcc	%l3,	%g6,	%i3
	move	%xcc,	%o5,	%o4
	fmovdne	%xcc,	%f17,	%f10
	add	%g1,	0x0B05,	%g4
	movre	%o2,	0x238,	%g2
	umulcc	%l5,	0x164A,	%g3
	movrgz	%i7,	%o7,	%i5
	movl	%icc,	%i4,	%l1
	fmovrsgz	%l4,	%f5,	%f12
	movpos	%icc,	%i1,	%o6
	fmovsgu	%xcc,	%f29,	%f24
	umulcc	%i6,	0x104F,	%o0
	edge32n	%i2,	%l0,	%o1
	sra	%g5,	0x1C,	%l2
	sdivcc	%o3,	0x01FF,	%g7
	movle	%xcc,	%l6,	%i0
	fmovrse	%g6,	%f27,	%f13
	movn	%icc,	%i3,	%o5
	restore %l3, 0x1568, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x20],	%g1
	sdivcc	%o2,	0x1F7C,	%g4
	fmovdcs	%xcc,	%f11,	%f13
	fmul8sux16	%f4,	%f16,	%f20
	edge32	%g2,	%l5,	%g3
	edge16ln	%o7,	%i7,	%i4
	xnor	%i5,	%l1,	%l4
	stb	%i1,	[%l7 + 0x51]
	movvs	%icc,	%i6,	%o0
	edge8n	%i2,	%o6,	%l0
	stx	%o1,	[%l7 + 0x68]
	sllx	%g5,	%o3,	%g7
	alignaddrl	%l2,	%l6,	%i0
	popc	%g6,	%o5
	fmovs	%f9,	%f6
	orcc	%i3,	0x12CE,	%o4
	edge16	%g1,	%l3,	%o2
	fmovrslz	%g4,	%f27,	%f20
	addc	%l5,	%g2,	%g3
	movcc	%icc,	%o7,	%i4
	fcmpne32	%f6,	%f10,	%i7
	subccc	%i5,	0x1BDA,	%l4
	edge32l	%i1,	%i6,	%o0
	nop
	set	0x70, %i5
	std	%f4,	[%l7 + %i5]
	stb	%i2,	[%l7 + 0x3D]
	fmovdn	%xcc,	%f14,	%f26
	movre	%l1,	%l0,	%o1
	movg	%xcc,	%g5,	%o6
	edge16ln	%o3,	%l2,	%g7
	pdist	%f0,	%f16,	%f30
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	orcc	%i3,	%g6,	%o4
	fnot2	%f12,	%f18
	fmovrdlez	%g1,	%f0,	%f0
	fsrc1s	%f24,	%f27
	fmovrdne	%o2,	%f26,	%f16
	fmovrdlz	%l3,	%f22,	%f8
	fcmpes	%fcc0,	%f31,	%f7
	srl	%g4,	%g2,	%l5
	stb	%g3,	[%l7 + 0x4B]
	subc	%i4,	0x19FC,	%o7
	xnorcc	%i7,	%l4,	%i1
	subc	%i5,	%i6,	%i2
	fmovde	%icc,	%f23,	%f23
	udivcc	%o0,	0x1805,	%l1
	edge32	%l0,	%o1,	%o6
	ldx	[%l7 + 0x78],	%g5
	fsrc1	%f24,	%f12
	edge8l	%o3,	%l2,	%i0
	ldx	[%l7 + 0x38],	%g7
	fxnors	%f31,	%f17,	%f30
	ldx	[%l7 + 0x60],	%l6
	stb	%i3,	[%l7 + 0x74]
	fsrc1s	%f24,	%f29
	orcc	%g6,	%o4,	%o5
	sdiv	%o2,	0x0629,	%l3
	fcmpes	%fcc2,	%f16,	%f12
	xnor	%g4,	0x0299,	%g2
	sethi	0x19A5,	%g1
	fmovsgu	%xcc,	%f18,	%f30
	fmul8x16au	%f3,	%f3,	%f8
	sra	%l5,	%g3,	%i4
	fmovdgu	%xcc,	%f30,	%f7
	sra	%o7,	%i7,	%l4
	edge32l	%i1,	%i6,	%i2
	movvc	%xcc,	%i5,	%l1
	movvs	%xcc,	%o0,	%o1
	movrlz	%l0,	0x365,	%o6
	edge16l	%g5,	%l2,	%o3
	fmovrslez	%g7,	%f3,	%f20
	movpos	%xcc,	%l6,	%i0
	edge16	%g6,	%o4,	%i3
	subcc	%o2,	%l3,	%o5
	edge32	%g4,	%g1,	%l5
	save %g2, %i4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i7,	%o7,	%l4
	stb	%i1,	[%l7 + 0x49]
	ldd	[%l7 + 0x60],	%f24
	movgu	%xcc,	%i6,	%i5
	sethi	0x1CC1,	%l1
	subccc	%o0,	%o1,	%l0
	edge16l	%o6,	%g5,	%i2
	or	%l2,	0x07C9,	%o3
	and	%l6,	%g7,	%i0
	stx	%o4,	[%l7 + 0x10]
	subcc	%g6,	%o2,	%l3
	fmovdneg	%icc,	%f27,	%f22
	fpmerge	%f20,	%f20,	%f10
	movrlz	%o5,	%i3,	%g1
	movn	%xcc,	%g4,	%l5
	ldsw	[%l7 + 0x0C],	%i4
	edge16ln	%g2,	%g3,	%o7
	ld	[%l7 + 0x34],	%f2
	edge8	%l4,	%i1,	%i7
	srlx	%i5,	0x0C,	%l1
	fcmpeq32	%f12,	%f24,	%o0
	movre	%i6,	0x291,	%l0
	std	%f4,	[%l7 + 0x30]
	edge32	%o1,	%o6,	%g5
	movleu	%icc,	%l2,	%i2
	fmovsvc	%xcc,	%f1,	%f17
	ldx	[%l7 + 0x78],	%l6
	ldx	[%l7 + 0x28],	%g7
	fmovrse	%i0,	%f20,	%f30
	sra	%o4,	0x0B,	%g6
	fcmpeq16	%f30,	%f30,	%o2
	sdivx	%l3,	0x0B33,	%o5
	srlx	%i3,	0x1D,	%o3
	ldd	[%l7 + 0x48],	%g0
	st	%f14,	[%l7 + 0x28]
	fmovsge	%xcc,	%f11,	%f8
	movvs	%xcc,	%g4,	%i4
	movl	%xcc,	%l5,	%g2
	andncc	%o7,	%g3,	%l4
	movge	%xcc,	%i1,	%i5
	movrlez	%i7,	0x375,	%o0
	movge	%xcc,	%l1,	%l0
	subcc	%i6,	0x1504,	%o1
	smul	%g5,	%l2,	%i2
	stb	%o6,	[%l7 + 0x5A]
	fmovde	%icc,	%f0,	%f24
	umulcc	%g7,	%i0,	%l6
	fsrc2s	%f17,	%f6
	restore %o4, 0x00F6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzero	%f8
	popc	0x0BF8,	%g6
	ldsb	[%l7 + 0x15],	%o5
	movcc	%icc,	%l3,	%o3
	movcs	%icc,	%i3,	%g4
	st	%f24,	[%l7 + 0x40]
	udivcc	%i4,	0x0C23,	%g1
	fcmple32	%f4,	%f12,	%l5
	ld	[%l7 + 0x34],	%f18
	movvs	%xcc,	%o7,	%g2
	stw	%l4,	[%l7 + 0x18]
	fpadd16s	%f21,	%f0,	%f6
	save %g3, %i5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%i7,	0x1271,	%l1
	ldsw	[%l7 + 0x5C],	%l0
	ldsh	[%l7 + 0x3A],	%o0
	udivcc	%i6,	0x0161,	%o1
	nop
	set	0x50, %o3
	ldd	[%l7 + %o3],	%l2
	orn	%g5,	0x0DC5,	%o6
	movvc	%xcc,	%g7,	%i2
	sll	%l6,	0x06,	%o4
	stb	%o2,	[%l7 + 0x3E]
	array32	%g6,	%o5,	%l3
	save %i0, 0x0409, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o3,	0x1ED4,	%i4
	sll	%g1,	%l5,	%o7
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	movrgez	%g3,	0x20A,	%l4
	edge32l	%i1,	%i5,	%l1
	movrne	%l0,	0x3A0,	%i7
	subcc	%i6,	%o1,	%l2
	lduh	[%l7 + 0x42],	%o0
	sll	%o6,	%g7,	%i2
	xorcc	%l6,	0x153A,	%g5
	movre	%o4,	%o2,	%g6
	array8	%l3,	%o5,	%i0
	fmovdpos	%xcc,	%f18,	%f11
	mova	%icc,	%i3,	%i4
	orn	%o3,	0x08C3,	%l5
	movgu	%xcc,	%g1,	%g2
	orn	%o7,	%g3,	%g4
	orn	%i1,	0x01DD,	%l4
	smul	%i5,	0x0555,	%l0
	movg	%icc,	%l1,	%i7
	stw	%o1,	[%l7 + 0x64]
	movg	%icc,	%i6,	%o0
	fmovdge	%xcc,	%f12,	%f11
	sdivx	%o6,	0x1B27,	%l2
	fcmpne32	%f26,	%f26,	%i2
	udiv	%g7,	0x0333,	%g5
	orcc	%l6,	%o4,	%o2
	edge32ln	%g6,	%o5,	%i0
	udiv	%i3,	0x1777,	%i4
	ld	[%l7 + 0x38],	%f3
	popc	%l3,	%o3
	mulscc	%l5,	0x1344,	%g1
	movrlz	%g2,	0x205,	%o7
	sdivcc	%g4,	0x15D0,	%i1
	sdivx	%g3,	0x121C,	%i5
	orn	%l0,	%l1,	%i7
	fsrc2s	%f27,	%f16
	xnorcc	%o1,	0x02A6,	%l4
	sethi	0x02D8,	%o0
	movrgez	%i6,	%l2,	%o6
	movpos	%xcc,	%i2,	%g5
	movneg	%xcc,	%g7,	%l6
	movrgz	%o2,	%g6,	%o4
	movgu	%xcc,	%i0,	%i3
	movg	%icc,	%o5,	%l3
	fmovdcc	%xcc,	%f21,	%f1
	restore %i4, 0x0DB1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g1,	%o3,	%o7
	fmovsgu	%xcc,	%f27,	%f31
	sub	%g4,	0x0D2A,	%i1
	edge16n	%g3,	%i5,	%g2
	movvc	%icc,	%l1,	%l0
	faligndata	%f10,	%f26,	%f8
	fornot2	%f22,	%f12,	%f28
	sir	0x1D98
	xorcc	%o1,	%l4,	%i7
	edge16l	%i6,	%o0,	%o6
	andncc	%l2,	%g5,	%i2
	movge	%icc,	%l6,	%o2
	movg	%xcc,	%g7,	%g6
	save %i0, 0x05EA, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x65],	%o5
	fmovdleu	%icc,	%f25,	%f0
	udiv	%l3,	0x1276,	%i4
	popc	%l5,	%g1
	fsrc1s	%f9,	%f1
	orn	%o3,	%o7,	%g4
	edge32l	%i3,	%i1,	%g3
	fmovscs	%icc,	%f4,	%f8
	move	%xcc,	%g2,	%i5
	movrgez	%l0,	%l1,	%o1
	subcc	%i7,	0x02A5,	%i6
	sdiv	%l4,	0x024F,	%o0
	movpos	%xcc,	%l2,	%o6
	xorcc	%i2,	0x0782,	%g5
	lduh	[%l7 + 0x76],	%l6
	subc	%o2,	0x0B39,	%g7
	edge32n	%i0,	%o4,	%o5
	movcs	%icc,	%g6,	%i4
	udiv	%l5,	0x1E4C,	%l3
	edge16l	%o3,	%g1,	%g4
	fmovsg	%xcc,	%f27,	%f21
	st	%f25,	[%l7 + 0x5C]
	ldub	[%l7 + 0x14],	%o7
	ldd	[%l7 + 0x28],	%f26
	srax	%i3,	0x1B,	%i1
	fpsub16	%f22,	%f24,	%f16
	edge16ln	%g3,	%i5,	%l0
	array32	%g2,	%o1,	%l1
	addccc	%i7,	0x0B2B,	%i6
	fcmple16	%f12,	%f10,	%o0
	sllx	%l2,	%o6,	%l4
	movne	%xcc,	%g5,	%i2
	xnor	%o2,	0x1349,	%g7
	fmovdn	%icc,	%f9,	%f4
	fmovscs	%xcc,	%f8,	%f30
	fmovrde	%l6,	%f14,	%f24
	smul	%o4,	0x12B8,	%o5
	fpadd32	%f26,	%f24,	%f10
	sdiv	%g6,	0x0580,	%i0
	movg	%icc,	%l5,	%i4
	sub	%o3,	%l3,	%g4
	ldsw	[%l7 + 0x78],	%g1
	movvs	%icc,	%i3,	%i1
	stx	%o7,	[%l7 + 0x10]
	ldd	[%l7 + 0x78],	%i4
	fandnot2	%f14,	%f6,	%f28
	xnor	%g3,	%l0,	%o1
	subccc	%g2,	0x15EB,	%i7
	movg	%xcc,	%i6,	%l1
	ldsb	[%l7 + 0x0C],	%o0
	edge8l	%o6,	%l2,	%g5
	sub	%i2,	0x0579,	%l4
	alignaddr	%g7,	%o2,	%o4
	sra	%l6,	0x1B,	%o5
	array32	%i0,	%l5,	%g6
	movge	%xcc,	%o3,	%i4
	subc	%l3,	%g1,	%i3
	sethi	0x1495,	%i1
	ldsh	[%l7 + 0x60],	%o7
	movrgez	%i5,	%g3,	%g4
	movrgez	%l0,	0x2D7,	%o1
	or	%g2,	0x171D,	%i6
	edge16n	%l1,	%o0,	%i7
	andncc	%l2,	%g5,	%o6
	edge32l	%l4,	%g7,	%o2
	sdiv	%o4,	0x1FC5,	%l6
	sethi	0x1A33,	%o5
	sir	0x032B
	move	%icc,	%i0,	%l5
	fmovrslz	%i2,	%f30,	%f3
	xor	%g6,	0x17A9,	%i4
	stx	%l3,	[%l7 + 0x68]
	array8	%g1,	%i3,	%o3
	andn	%i1,	0x1A02,	%i5
	fcmpgt32	%f28,	%f0,	%o7
	fmovrse	%g3,	%f11,	%f23
	movpos	%icc,	%l0,	%o1
	fnot1s	%f16,	%f31
	srl	%g4,	0x03,	%g2
	ldx	[%l7 + 0x38],	%i6
	sdivcc	%o0,	0x1C4F,	%i7
	andncc	%l2,	%g5,	%l1
	sdivx	%o6,	0x0BE7,	%g7
	movge	%xcc,	%l4,	%o4
	fnegd	%f30,	%f0
	sub	%o2,	%o5,	%l6
	fnot1s	%f18,	%f6
	or	%i0,	%l5,	%g6
	umulcc	%i4,	%l3,	%i2
	movrlez	%i3,	%o3,	%i1
	edge8ln	%i5,	%o7,	%g3
	addc	%g1,	%l0,	%g4
	nop
	set	0x70, %i4
	ldd	[%l7 + %i4],	%f20
	stw	%o1,	[%l7 + 0x78]
	xorcc	%g2,	0x10A5,	%o0
	orn	%i7,	%l2,	%g5
	ldd	[%l7 + 0x08],	%f10
	save %i6, 0x1E6A, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x66],	%o6
	edge16ln	%l4,	%o4,	%o2
	andcc	%o5,	0x14E3,	%l6
	fmul8x16au	%f8,	%f26,	%f2
	stx	%i0,	[%l7 + 0x10]
	movgu	%icc,	%l5,	%g6
	or	%i4,	%l3,	%i2
	udiv	%i3,	0x03A1,	%o3
	movg	%icc,	%i1,	%g7
	fmovsl	%xcc,	%f7,	%f31
	xorcc	%o7,	%i5,	%g3
	fmovdvs	%xcc,	%f17,	%f18
	movrne	%l0,	%g4,	%g1
	sir	0x084E
	fpsub16	%f8,	%f6,	%f2
	or	%o1,	%o0,	%i7
	std	%f18,	[%l7 + 0x68]
	xnorcc	%g2,	0x1F69,	%l2
	ldsw	[%l7 + 0x54],	%i6
	edge16ln	%l1,	%o6,	%g5
	fmovrslez	%l4,	%f24,	%f21
	edge32	%o2,	%o5,	%o4
	smulcc	%l6,	%l5,	%g6
	fmovsge	%icc,	%f22,	%f30
	stw	%i4,	[%l7 + 0x14]
	array16	%i0,	%i2,	%i3
	fmovsleu	%icc,	%f0,	%f0
	movrne	%l3,	0x246,	%i1
	movrne	%g7,	%o7,	%i5
	srax	%o3,	0x0A,	%g3
	edge16n	%g4,	%l0,	%g1
	fcmps	%fcc1,	%f16,	%f1
	subccc	%o0,	0x1954,	%o1
	stw	%i7,	[%l7 + 0x54]
	andncc	%l2,	%g2,	%l1
	fornot2	%f10,	%f14,	%f4
	ldsb	[%l7 + 0x40],	%i6
	array8	%g5,	%l4,	%o2
	fandnot1s	%f26,	%f14,	%f26
	movpos	%xcc,	%o6,	%o5
	fpadd16	%f2,	%f8,	%f20
	smulcc	%l6,	0x149A,	%l5
	sub	%g6,	%o4,	%i4
	stb	%i2,	[%l7 + 0x4D]
	fandnot2s	%f4,	%f13,	%f6
	sll	%i3,	0x1F,	%i0
	sdivcc	%l3,	0x004F,	%g7
	sdivcc	%o7,	0x1E31,	%i5
	fnot2s	%f8,	%f0
	fmovrdlz	%i1,	%f4,	%f22
	stx	%g3,	[%l7 + 0x78]
	fxor	%f0,	%f28,	%f6
	xnor	%g4,	0x10FB,	%l0
	movcs	%xcc,	%g1,	%o3
	st	%f17,	[%l7 + 0x40]
	sethi	0x0408,	%o0
	move	%xcc,	%o1,	%i7
	stw	%g2,	[%l7 + 0x54]
	stw	%l2,	[%l7 + 0x10]
	alignaddrl	%i6,	%g5,	%l1
	fsrc2s	%f3,	%f24
	std	%f28,	[%l7 + 0x18]
	subcc	%o2,	%o6,	%o5
	fnor	%f12,	%f0,	%f16
	xorcc	%l4,	%l6,	%l5
	array16	%g6,	%o4,	%i2
	andn	%i4,	0x090F,	%i0
	move	%xcc,	%i3,	%l3
	edge32ln	%o7,	%g7,	%i1
	lduh	[%l7 + 0x28],	%g3
	srax	%i5,	0x15,	%l0
	addccc	%g1,	0x087C,	%g4
	fmovdvc	%xcc,	%f24,	%f29
	mova	%icc,	%o3,	%o1
	fpsub16	%f10,	%f6,	%f30
	movneg	%icc,	%i7,	%o0
	edge32	%g2,	%l2,	%g5
	std	%f26,	[%l7 + 0x30]
	umulcc	%i6,	%l1,	%o2
	sth	%o6,	[%l7 + 0x60]
	faligndata	%f30,	%f0,	%f6
	array32	%o5,	%l6,	%l4
	udiv	%l5,	0x17B5,	%g6
	movre	%o4,	0x1E4,	%i4
	ld	[%l7 + 0x70],	%f18
	std	%f16,	[%l7 + 0x40]
	movvc	%icc,	%i2,	%i0
	movrne	%l3,	%o7,	%g7
	fpsub16s	%f3,	%f25,	%f11
	edge8n	%i3,	%i1,	%i5
	ldsw	[%l7 + 0x44],	%g3
	fmovrslez	%g1,	%f0,	%f16
	addcc	%g4,	0x0E71,	%l0
	movgu	%icc,	%o3,	%i7
	alignaddrl	%o1,	%g2,	%o0
	fmovdge	%icc,	%f7,	%f20
	srl	%g5,	0x14,	%l2
	edge16n	%l1,	%i6,	%o2
	ld	[%l7 + 0x5C],	%f27
	edge32l	%o5,	%l6,	%l4
	alignaddrl	%l5,	%o6,	%g6
	fxor	%f4,	%f0,	%f24
	movrlez	%i4,	0x35B,	%o4
	movleu	%icc,	%i0,	%l3
	addccc	%i2,	0x0D98,	%o7
	movrgez	%i3,	0x2F2,	%i1
	mulscc	%g7,	%g3,	%g1
	orn	%i5,	%g4,	%l0
	stx	%i7,	[%l7 + 0x70]
	bshuffle	%f10,	%f6,	%f18
	move	%icc,	%o1,	%o3
	fmul8x16	%f6,	%f18,	%f20
	sdivcc	%o0,	0x17DE,	%g5
	sethi	0x0609,	%g2
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	movle	%icc,	%l1,	%l6
	umul	%l4,	0x0065,	%l5
	fxors	%f3,	%f27,	%f22
	addc	%o5,	0x09EB,	%o6
	edge32	%g6,	%o4,	%i4
	ldsw	[%l7 + 0x58],	%i0
	sll	%i2,	0x06,	%o7
	mova	%xcc,	%l3,	%i1
	alignaddrl	%g7,	%g3,	%g1
	movgu	%icc,	%i5,	%g4
	fmovdleu	%xcc,	%f22,	%f11
	lduh	[%l7 + 0x3A],	%l0
	smulcc	%i7,	%i3,	%o1
	edge8ln	%o0,	%o3,	%g5
	umul	%g2,	%l2,	%i6
	nop
	set	0x39, %i0
	stb	%l1,	[%l7 + %i0]
	edge8ln	%l6,	%o2,	%l4
	sllx	%o5,	%l5,	%o6
	fsrc2	%f4,	%f8
	udiv	%g6,	0x076F,	%o4
	movrgz	%i4,	%i2,	%o7
	alignaddrl	%l3,	%i1,	%g7
	edge32ln	%i0,	%g1,	%i5
	ldd	[%l7 + 0x60],	%f0
	fmovdvs	%icc,	%f7,	%f15
	popc	0x0F98,	%g3
	fnand	%f12,	%f4,	%f12
	udivcc	%g4,	0x13BF,	%l0
	ldd	[%l7 + 0x30],	%f2
	save %i3, %o1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o0,	%o3,	%g5
	mulx	%g2,	%i6,	%l1
	fornot2s	%f7,	%f23,	%f28
	fmovsg	%xcc,	%f23,	%f16
	srl	%l2,	%o2,	%l6
	orn	%l4,	0x129B,	%o5
	movre	%o6,	0x37A,	%g6
	pdist	%f22,	%f6,	%f8
	subccc	%o4,	0x0CD7,	%i4
	fcmpeq16	%f30,	%f12,	%i2
	fmul8ulx16	%f18,	%f10,	%f2
	xorcc	%o7,	0x1DF3,	%l5
	fnors	%f20,	%f5,	%f26
	st	%f5,	[%l7 + 0x6C]
	edge16	%i1,	%l3,	%i0
	smulcc	%g1,	%i5,	%g3
	movvs	%xcc,	%g4,	%l0
	stx	%g7,	[%l7 + 0x08]
	edge32n	%i3,	%o1,	%o0
	edge16ln	%i7,	%o3,	%g5
	andcc	%i6,	0x1EEB,	%g2
	fone	%f26
	xnor	%l2,	0x13FD,	%o2
	sir	0x08FB
	fcmple16	%f28,	%f30,	%l6
	fpadd32	%f24,	%f0,	%f12
	ldsh	[%l7 + 0x22],	%l4
	orcc	%o5,	%l1,	%g6
	fmovde	%icc,	%f10,	%f20
	smulcc	%o4,	0x16EB,	%i4
	xor	%i2,	0x0223,	%o6
	andn	%o7,	0x1524,	%i1
	movpos	%xcc,	%l3,	%i0
	movrne	%g1,	%l5,	%i5
	edge8ln	%g3,	%l0,	%g7
	st	%f23,	[%l7 + 0x4C]
	umul	%g4,	%o1,	%i3
	addcc	%o0,	%o3,	%i7
	fmovde	%xcc,	%f6,	%f6
	movrgez	%i6,	0x207,	%g5
	fornot1s	%f5,	%f28,	%f14
	xorcc	%g2,	0x005B,	%l2
	edge16l	%o2,	%l4,	%l6
	movre	%o5,	0x0EB,	%l1
	edge8ln	%o4,	%g6,	%i4
	fcmpgt16	%f8,	%f18,	%i2
	fmovscs	%icc,	%f9,	%f10
	fcmps	%fcc2,	%f28,	%f14
	fcmpne16	%f28,	%f30,	%o6
	movrgz	%o7,	0x352,	%l3
	movrgz	%i1,	%g1,	%i0
	movne	%icc,	%i5,	%g3
	ld	[%l7 + 0x40],	%f3
	movl	%xcc,	%l5,	%l0
	edge16n	%g4,	%o1,	%i3
	mulscc	%g7,	0x10F0,	%o3
	movvs	%icc,	%o0,	%i7
	andcc	%g5,	0x0743,	%i6
	edge32n	%g2,	%o2,	%l4
	array8	%l6,	%l2,	%l1
	edge16	%o4,	%g6,	%i4
	udivx	%o5,	0x1C54,	%o6
	edge32n	%i2,	%o7,	%l3
	sdiv	%g1,	0x1DC1,	%i0
	mulx	%i5,	%i1,	%l5
	mulscc	%g3,	0x03F3,	%g4
	fmovsneg	%icc,	%f12,	%f3
	ldsh	[%l7 + 0x50],	%o1
	sdiv	%l0,	0x1AFE,	%g7
	udivcc	%i3,	0x0087,	%o3
	alignaddr	%i7,	%o0,	%i6
	ldub	[%l7 + 0x48],	%g5
	nop
	set	0x48, %g6
	stx	%g2,	[%l7 + %g6]
	nop
	set	0x36, %g1
	ldsh	[%l7 + %g1],	%o2
	edge16l	%l6,	%l2,	%l1
	edge32ln	%o4,	%g6,	%i4
	edge16n	%o5,	%o6,	%l4
	ld	[%l7 + 0x5C],	%f10
	edge32n	%o7,	%i2,	%g1
	fmovrdne	%l3,	%f16,	%f10
	stx	%i0,	[%l7 + 0x10]
	orncc	%i5,	0x1A48,	%i1
	save %g3, 0x0A98, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o1,	%g4,	%l0
	fnot1	%f4,	%f2
	fmuld8ulx16	%f17,	%f18,	%f0
	fnot1	%f6,	%f18
	movrgz	%g7,	%i3,	%o3
	movcs	%icc,	%i7,	%o0
	fone	%f6
	movg	%xcc,	%g5,	%g2
	add	%i6,	0x0F3F,	%l6
	st	%f30,	[%l7 + 0x50]
	movne	%xcc,	%o2,	%l1
	fmovsle	%icc,	%f15,	%f3
	fmovsn	%icc,	%f14,	%f3
	popc	0x0578,	%o4
	edge32ln	%g6,	%l2,	%i4
	fandnot2s	%f8,	%f9,	%f16
	movrgz	%o5,	%o6,	%l4
	mova	%icc,	%o7,	%g1
	mova	%xcc,	%l3,	%i2
	sdiv	%i5,	0x0AD2,	%i0
	fnot1s	%f6,	%f0
	sdivx	%i1,	0x02B8,	%l5
	movcs	%xcc,	%o1,	%g4
	fands	%f29,	%f5,	%f5
	lduw	[%l7 + 0x10],	%l0
	movcc	%xcc,	%g7,	%g3
	array32	%i3,	%i7,	%o0
	edge8ln	%o3,	%g2,	%g5
	fmovrslez	%i6,	%f14,	%f11
	sdivcc	%l6,	0x1AA0,	%l1
	fmovscc	%xcc,	%f3,	%f12
	fmovscs	%xcc,	%f21,	%f29
	nop
	set	0x6A, %l3
	sth	%o4,	[%l7 + %l3]
	sllx	%o2,	0x06,	%l2
	movrgz	%i4,	%o5,	%o6
	fmovse	%icc,	%f14,	%f16
	fands	%f2,	%f14,	%f11
	ldd	[%l7 + 0x40],	%l4
	fmul8ulx16	%f12,	%f30,	%f4
	fsrc2	%f12,	%f14
	fandnot2s	%f9,	%f3,	%f21
	mulscc	%o7,	%g1,	%g6
	fmovdpos	%xcc,	%f24,	%f21
	umul	%l3,	0x01E6,	%i5
	alignaddrl	%i2,	%i0,	%l5
	movrlz	%i1,	%o1,	%l0
	fand	%f0,	%f30,	%f18
	xorcc	%g4,	0x0144,	%g7
	fpsub32	%f4,	%f12,	%f2
	fexpand	%f20,	%f14
	srlx	%i3,	0x0F,	%i7
	ldx	[%l7 + 0x18],	%g3
	array8	%o0,	%g2,	%g5
	array32	%i6,	%o3,	%l1
	fzero	%f10
	fmul8x16au	%f6,	%f6,	%f20
	fzero	%f18
	sdivcc	%o4,	0x01D1,	%l6
	lduh	[%l7 + 0x0E],	%o2
	array8	%i4,	%l2,	%o6
	movcs	%xcc,	%o5,	%o7
	edge16ln	%g1,	%g6,	%l3
	edge32	%i5,	%l4,	%i0
	fandnot2	%f10,	%f14,	%f12
	movg	%icc,	%l5,	%i1
	orncc	%i2,	%l0,	%o1
	addc	%g4,	0x0A5C,	%g7
	edge32l	%i3,	%g3,	%o0
	siam	0x1
	udivx	%g2,	0x01AE,	%g5
	ldsw	[%l7 + 0x40],	%i7
	smulcc	%o3,	0x14D7,	%l1
	orcc	%i6,	0x1718,	%o4
	xnor	%l6,	0x007B,	%o2
	fmuld8sux16	%f9,	%f22,	%f4
	srax	%l2,	0x00,	%i4
	sra	%o5,	%o6,	%o7
	srl	%g6,	%l3,	%i5
	fmovdneg	%xcc,	%f13,	%f31
	movge	%xcc,	%g1,	%l4
	movrgez	%i0,	0x2DE,	%i1
	mova	%icc,	%l5,	%l0
	fmovscs	%xcc,	%f9,	%f29
	andncc	%i2,	%o1,	%g4
	ldsw	[%l7 + 0x4C],	%g7
	sir	0x19C4
	movleu	%xcc,	%i3,	%g3
	fmovse	%icc,	%f15,	%f21
	umul	%o0,	0x017F,	%g2
	ldub	[%l7 + 0x0D],	%i7
	addccc	%g5,	0x0D03,	%l1
	fnot2	%f22,	%f16
	movpos	%xcc,	%i6,	%o3
	movg	%icc,	%l6,	%o2
	fmovrdgez	%l2,	%f4,	%f20
	sir	0x1596
	subc	%i4,	0x1497,	%o4
	save %o6, %o7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f4,	%f24
	fmul8x16au	%f11,	%f19,	%f16
	alignaddrl	%l3,	%o5,	%g1
	edge8ln	%l4,	%i5,	%i1
	andcc	%l5,	0x196A,	%l0
	srl	%i2,	%o1,	%g4
	ld	[%l7 + 0x34],	%f30
	smul	%i0,	%g7,	%g3
	movle	%icc,	%o0,	%i3
	lduw	[%l7 + 0x68],	%i7
	andncc	%g5,	%l1,	%g2
	mulx	%i6,	%o3,	%o2
	andcc	%l2,	%l6,	%o4
	edge8ln	%i4,	%o7,	%o6
	add	%l3,	0x1903,	%g6
	edge8	%o5,	%l4,	%g1
	orn	%i1,	%l5,	%l0
	edge8ln	%i2,	%o1,	%i5
	faligndata	%f6,	%f30,	%f4
	orncc	%i0,	0x1B29,	%g7
	lduh	[%l7 + 0x6E],	%g3
	umulcc	%g4,	0x1495,	%o0
	srax	%i3,	%i7,	%l1
	fmul8x16al	%f28,	%f27,	%f26
	sll	%g5,	0x11,	%i6
	and	%o3,	0x0FD6,	%g2
	alignaddrl	%o2,	%l2,	%o4
	movge	%icc,	%l6,	%o7
	sub	%i4,	0x0F20,	%o6
	fxors	%f26,	%f31,	%f16
	ldd	[%l7 + 0x48],	%f0
	sdivcc	%g6,	0x1965,	%o5
	sdivx	%l3,	0x07B3,	%g1
	or	%l4,	0x03CB,	%i1
	array16	%l5,	%l0,	%o1
	add	%i5,	%i2,	%i0
	alignaddrl	%g3,	%g7,	%g4
	ldd	[%l7 + 0x38],	%f4
	ldd	[%l7 + 0x18],	%o0
	pdist	%f22,	%f0,	%f2
	addc	%i7,	0x16E1,	%l1
	movgu	%icc,	%i3,	%g5
	fcmpd	%fcc3,	%f4,	%f20
	ldx	[%l7 + 0x78],	%o3
	restore %g2, %i6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	0x0464,	%o4
	ldx	[%l7 + 0x60],	%l6
	alignaddrl	%i4,	%o7,	%o6
	fpack16	%f28,	%f16
	sub	%g6,	0x1030,	%o5
	fmovda	%xcc,	%f25,	%f8
	movrgz	%g1,	%l3,	%l4
	movrlz	%l5,	%l0,	%o1
	movgu	%icc,	%i5,	%i2
	fsrc1	%f14,	%f10
	sub	%i1,	0x14C6,	%i0
	fmovscs	%icc,	%f8,	%f0
	andncc	%g3,	%g4,	%o0
	mulx	%g7,	%i7,	%l1
	sllx	%g5,	0x0C,	%i3
	movre	%g2,	%i6,	%o2
	fmovdcc	%icc,	%f5,	%f12
	movcs	%icc,	%l2,	%o3
	edge32n	%l6,	%i4,	%o4
	fpackfix	%f18,	%f3
	edge8	%o6,	%g6,	%o5
	movvs	%icc,	%g1,	%l3
	fmovdvc	%icc,	%f8,	%f20
	alignaddrl	%l4,	%l5,	%l0
	stw	%o1,	[%l7 + 0x0C]
	sdivcc	%i5,	0x0C31,	%o7
	fmovrdgez	%i1,	%f6,	%f28
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	sub	%g3,	%o0,	%i7
	array16	%g7,	%g5,	%l1
	popc	%g2,	%i3
	edge8n	%i6,	%l2,	%o2
	array8	%o3,	%l6,	%o4
	edge8n	%i4,	%g6,	%o5
	ldsb	[%l7 + 0x6E],	%o6
	andcc	%l3,	%g1,	%l5
	stw	%l4,	[%l7 + 0x34]
	fmovsl	%xcc,	%f22,	%f3
	stw	%l0,	[%l7 + 0x74]
	movvs	%xcc,	%i5,	%o7
	movge	%icc,	%o1,	%i1
	array8	%i2,	%i0,	%g4
	movg	%xcc,	%g3,	%i7
	movle	%icc,	%o0,	%g5
	st	%f25,	[%l7 + 0x40]
	subccc	%g7,	0x181D,	%l1
	andcc	%g2,	0x19AA,	%i3
	sdivcc	%i6,	0x004B,	%o2
	fmovdcs	%xcc,	%f13,	%f30
	sir	0x04FF
	fcmpeq16	%f6,	%f4,	%l2
	movg	%icc,	%o3,	%o4
	st	%f14,	[%l7 + 0x1C]
	fpack32	%f12,	%f10,	%f12
	std	%f10,	[%l7 + 0x40]
	srl	%i4,	%g6,	%l6
	fmovse	%icc,	%f13,	%f31
	movn	%icc,	%o6,	%l3
	alignaddrl	%o5,	%l5,	%l4
	edge32n	%l0,	%g1,	%o7
	edge32	%o1,	%i1,	%i5
	srl	%i0,	%g4,	%g3
	smul	%i2,	%o0,	%g5
	fpmerge	%f16,	%f18,	%f10
	nop
	set	0x70, %l6
	stx	%g7,	[%l7 + %l6]
	fmul8x16al	%f0,	%f12,	%f30
	movvs	%icc,	%l1,	%g2
	fpadd32s	%f22,	%f30,	%f23
	movle	%icc,	%i7,	%i6
	xor	%o2,	%l2,	%i3
	movrgez	%o3,	%i4,	%o4
	movl	%xcc,	%g6,	%l6
	edge32ln	%l3,	%o6,	%o5
	movn	%icc,	%l5,	%l0
	nop
	set	0x10, %o1
	ldd	[%l7 + %o1],	%f24
	xnor	%l4,	0x051E,	%g1
	array16	%o1,	%i1,	%i5
	stb	%o7,	[%l7 + 0x71]
	movcc	%xcc,	%g4,	%g3
	sethi	0x0E81,	%i2
	ldub	[%l7 + 0x4D],	%o0
	mova	%icc,	%g5,	%g7
	fmovsvc	%xcc,	%f18,	%f0
	movne	%icc,	%l1,	%g2
	fmovdge	%xcc,	%f0,	%f21
	addc	%i0,	0x09E1,	%i7
	ldub	[%l7 + 0x68],	%o2
	ldsw	[%l7 + 0x4C],	%i6
	movn	%icc,	%l2,	%i3
	ldd	[%l7 + 0x08],	%i4
	sdivcc	%o3,	0x13F1,	%o4
	fmovsa	%xcc,	%f17,	%f7
	fornot1	%f0,	%f12,	%f14
	movrlz	%l6,	%g6,	%l3
	subccc	%o5,	%o6,	%l0
	stw	%l5,	[%l7 + 0x30]
	lduw	[%l7 + 0x10],	%l4
	xorcc	%g1,	%i1,	%i5
	fmul8x16al	%f2,	%f5,	%f18
	umulcc	%o1,	0x05EB,	%g4
	sllx	%g3,	%o7,	%o0
	lduh	[%l7 + 0x72],	%g5
	udiv	%g7,	0x01D0,	%i2
	fmovde	%icc,	%f11,	%f0
	srax	%l1,	0x1C,	%i0
	fmovdleu	%xcc,	%f20,	%f23
	movvs	%xcc,	%i7,	%g2
	umul	%o2,	0x0568,	%l2
	edge32l	%i3,	%i4,	%o3
	and	%o4,	%i6,	%l6
	andncc	%l3,	%g6,	%o6
	fands	%f1,	%f21,	%f29
	fandnot1	%f4,	%f14,	%f4
	sethi	0x0278,	%l0
	fmovd	%f20,	%f20
	movvc	%icc,	%o5,	%l4
	fpsub16	%f10,	%f20,	%f28
	sethi	0x1AEF,	%g1
	umul	%i1,	0x1E98,	%i5
	siam	0x6
	stx	%o1,	[%l7 + 0x48]
	subccc	%g4,	0x09DC,	%l5
	udiv	%g3,	0x13D0,	%o0
	fcmpgt16	%f8,	%f12,	%o7
	movne	%icc,	%g5,	%i2
	srl	%g7,	%l1,	%i7
	fnot1	%f16,	%f26
	udiv	%i0,	0x14B5,	%g2
	ldx	[%l7 + 0x78],	%l2
	sdiv	%o2,	0x0F76,	%i4
	fmul8x16al	%f3,	%f6,	%f28
	movle	%xcc,	%o3,	%i3
	movcc	%icc,	%o4,	%l6
	movpos	%icc,	%i6,	%g6
	xnorcc	%l3,	0x09E6,	%o6
	movrgz	%l0,	0x0DA,	%o5
	smulcc	%l4,	0x0F9C,	%g1
	fandnot1	%f16,	%f28,	%f2
	movrgz	%i1,	0x3D4,	%o1
	movne	%xcc,	%g4,	%i5
	edge32ln	%g3,	%l5,	%o7
	edge8l	%g5,	%i2,	%o0
	and	%l1,	%g7,	%i7
	edge8ln	%i0,	%g2,	%o2
	sub	%i4,	0x04E9,	%l2
	movvs	%xcc,	%o3,	%o4
	orn	%i3,	0x055B,	%i6
	srlx	%l6,	%g6,	%l3
	nop
	set	0x20, %g5
	stx	%l0,	[%l7 + %g5]
	sdivcc	%o5,	0x055A,	%o6
	or	%l4,	0x138B,	%i1
	movpos	%icc,	%g1,	%g4
	fmovsge	%icc,	%f27,	%f31
	umulcc	%o1,	0x0C01,	%g3
	orcc	%l5,	0x1CFD,	%i5
	fxnors	%f27,	%f16,	%f28
	edge16n	%g5,	%o7,	%i2
	stw	%o0,	[%l7 + 0x24]
	movl	%xcc,	%g7,	%l1
	fmovrdgez	%i7,	%f26,	%f20
	srl	%g2,	%o2,	%i0
	movrgez	%l2,	0x2F4,	%i4
	array32	%o3,	%o4,	%i3
	movne	%icc,	%i6,	%l6
	movneg	%icc,	%g6,	%l3
	fandnot1s	%f26,	%f14,	%f28
	edge32	%l0,	%o6,	%o5
	sll	%l4,	0x19,	%g1
	movcs	%xcc,	%g4,	%o1
	edge32n	%i1,	%g3,	%i5
	edge8ln	%g5,	%o7,	%l5
	array8	%o0,	%i2,	%l1
	udivx	%g7,	0x18E6,	%g2
	fxnors	%f24,	%f13,	%f16
	andncc	%i7,	%o2,	%l2
	ldx	[%l7 + 0x40],	%i4
	fmovrsgz	%o3,	%f10,	%f22
	fmovrdne	%i0,	%f12,	%f24
	fnegs	%f28,	%f28
	fsrc2s	%f23,	%f31
	edge32ln	%i3,	%o4,	%l6
	movle	%xcc,	%i6,	%g6
	umul	%l0,	0x10FA,	%l3
	ld	[%l7 + 0x64],	%f16
	fpsub16	%f16,	%f0,	%f28
	fmovsleu	%xcc,	%f18,	%f14
	movneg	%xcc,	%o6,	%l4
	udivx	%g1,	0x0582,	%o5
	addcc	%g4,	%i1,	%g3
	udivcc	%o1,	0x117B,	%g5
	fzeros	%f7
	fcmpeq32	%f4,	%f24,	%o7
	nop
	set	0x5F, %o7
	stb	%i5,	[%l7 + %o7]
	fmovsneg	%xcc,	%f30,	%f28
	movrne	%o0,	0x137,	%l5
	and	%i2,	0x1B8E,	%g7
	alignaddr	%g2,	%l1,	%i7
	movrgz	%l2,	0x176,	%i4
	udiv	%o2,	0x0BC8,	%o3
	restore %i0, %o4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l6,	%g6
	srlx	%i6,	%l0,	%l3
	umulcc	%l4,	%o6,	%g1
	fexpand	%f16,	%f8
	mova	%xcc,	%o5,	%i1
	movcs	%icc,	%g4,	%g3
	fcmpgt16	%f2,	%f16,	%o1
	movrne	%g5,	%o7,	%o0
	xorcc	%l5,	%i2,	%g7
	fpadd32	%f20,	%f26,	%f8
	std	%f22,	[%l7 + 0x28]
	mova	%xcc,	%i5,	%g2
	mova	%xcc,	%i7,	%l1
	smul	%l2,	%o2,	%i4
	subccc	%o3,	0x0E72,	%i0
	udiv	%o4,	0x0931,	%i3
	fpmerge	%f18,	%f15,	%f12
	edge16n	%g6,	%i6,	%l0
	sll	%l3,	0x0A,	%l4
	udivx	%l6,	0x0946,	%o6
	umulcc	%o5,	0x0127,	%i1
	movrlez	%g1,	%g4,	%g3
	addcc	%g5,	%o7,	%o0
	srax	%l5,	0x18,	%i2
	popc	0x0EE5,	%g7
	edge8l	%i5,	%o1,	%g2
	movcc	%xcc,	%l1,	%i7
	edge8ln	%o2,	%l2,	%o3
	fmovsle	%icc,	%f13,	%f8
	srl	%i0,	0x0F,	%o4
	ldd	[%l7 + 0x70],	%i2
	sethi	0x1E5E,	%i4
	fandnot2	%f26,	%f12,	%f4
	nop
	set	0x58, %g3
	ldsb	[%l7 + %g3],	%i6
	xnorcc	%g6,	0x0BB9,	%l0
	edge32n	%l4,	%l3,	%l6
	movrgez	%o6,	%o5,	%i1
	ldub	[%l7 + 0x6B],	%g4
	fmovrsgez	%g3,	%f28,	%f31
	fcmpgt32	%f14,	%f30,	%g1
	fnand	%f10,	%f18,	%f28
	fcmple32	%f6,	%f4,	%g5
	movrgez	%o0,	0x285,	%l5
	movrne	%i2,	%o7,	%g7
	sth	%o1,	[%l7 + 0x72]
	andn	%g2,	%i5,	%l1
	sethi	0x1613,	%o2
	movle	%icc,	%l2,	%i7
	addc	%o3,	%o4,	%i3
	smul	%i4,	0x1743,	%i0
	mova	%xcc,	%g6,	%l0
	add	%i6,	%l3,	%l4
	fornot2	%f12,	%f24,	%f16
	orcc	%o6,	%l6,	%i1
	fmovsne	%icc,	%f16,	%f21
	sra	%g4,	0x10,	%o5
	lduw	[%l7 + 0x08],	%g3
	fpack32	%f30,	%f6,	%f30
	or	%g1,	%g5,	%o0
	udivcc	%i2,	0x06FB,	%o7
	movgu	%icc,	%g7,	%o1
	movrlz	%g2,	%i5,	%l5
	subcc	%l1,	%o2,	%l2
	movrgez	%i7,	0x1B1,	%o4
	orcc	%i3,	0x1F2E,	%o3
	sub	%i0,	0x1700,	%g6
	movrlez	%i4,	0x3D6,	%i6
	edge8ln	%l3,	%l0,	%l4
	fmovda	%icc,	%f2,	%f10
	ldd	[%l7 + 0x48],	%f30
	movrgez	%o6,	%l6,	%i1
	edge32l	%g4,	%g3,	%g1
	add	%g5,	%o0,	%i2
	subc	%o7,	0x129F,	%g7
	movge	%xcc,	%o5,	%o1
	fandnot2s	%f28,	%f21,	%f3
	array8	%i5,	%g2,	%l1
	fandnot1s	%f22,	%f18,	%f15
	fxnors	%f4,	%f25,	%f27
	array32	%l5,	%l2,	%i7
	movg	%xcc,	%o2,	%i3
	smul	%o3,	0x1104,	%o4
	fmul8ulx16	%f20,	%f2,	%f20
	fxor	%f6,	%f8,	%f26
	movrne	%g6,	%i4,	%i6
	fmovsge	%xcc,	%f2,	%f14
	movre	%l3,	0x225,	%i0
	array16	%l4,	%o6,	%l0
	orncc	%i1,	0x1595,	%l6
	fmovdl	%xcc,	%f0,	%f17
	ldsh	[%l7 + 0x24],	%g4
	save %g3, 0x08F1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o0,	0x138E,	%g1
	fcmpne16	%f6,	%f16,	%i2
	edge16	%g7,	%o5,	%o1
	edge32l	%o7,	%g2,	%i5
	fmovd	%f8,	%f20
	movcs	%xcc,	%l1,	%l5
	fmovdneg	%icc,	%f3,	%f19
	udivx	%i7,	0x0DCE,	%l2
	ldub	[%l7 + 0x5A],	%o2
	xor	%o3,	%i3,	%g6
	fones	%f22
	subcc	%i4,	0x1D02,	%i6
	movpos	%icc,	%o4,	%l3
	srax	%i0,	%l4,	%l0
	ldsb	[%l7 + 0x25],	%i1
	xnor	%o6,	%g4,	%g3
	movcs	%icc,	%g5,	%l6
	fmovse	%xcc,	%f18,	%f8
	sdiv	%g1,	0x16A8,	%i2
	ldd	[%l7 + 0x38],	%f4
	sdivx	%o0,	0x19C7,	%g7
	srax	%o5,	0x13,	%o7
	fmovse	%icc,	%f7,	%f1
	lduh	[%l7 + 0x5E],	%g2
	movge	%xcc,	%i5,	%o1
	movne	%xcc,	%l1,	%l5
	xnor	%i7,	%o2,	%l2
	for	%f10,	%f8,	%f24
	sll	%o3,	0x0F,	%i3
	movrlez	%g6,	%i6,	%o4
	movrne	%l3,	%i4,	%i0
	xnor	%l4,	0x0FAF,	%l0
	movpos	%icc,	%i1,	%g4
	addccc	%o6,	0x160F,	%g5
	movg	%xcc,	%g3,	%g1
	orn	%l6,	%o0,	%i2
	fornot2	%f26,	%f8,	%f8
	smul	%g7,	0x02EF,	%o7
	udivcc	%o5,	0x0DF9,	%g2
	fpack32	%f4,	%f10,	%f22
	fpack32	%f22,	%f18,	%f2
	fmovsg	%xcc,	%f9,	%f25
	mulscc	%o1,	%i5,	%l5
	movrgz	%i7,	%l1,	%l2
	edge32n	%o3,	%i3,	%g6
	edge16l	%i6,	%o2,	%l3
	movrgz	%i4,	%o4,	%l4
	fandnot1	%f16,	%f30,	%f26
	movcs	%xcc,	%i0,	%l0
	and	%g4,	%o6,	%i1
	stw	%g3,	[%l7 + 0x68]
	smul	%g1,	%g5,	%o0
	fandnot1	%f20,	%f30,	%f18
	fmovdl	%xcc,	%f31,	%f4
	movge	%xcc,	%l6,	%g7
	srlx	%i2,	%o5,	%o7
	mova	%icc,	%o1,	%i5
	addcc	%l5,	0x15E9,	%g2
	srax	%i7,	%l1,	%l2
	smulcc	%i3,	%o3,	%i6
	movrne	%g6,	0x320,	%l3
	nop
	set	0x48, %i2
	ldsw	[%l7 + %i2],	%i4
	ldsh	[%l7 + 0x3C],	%o4
	edge32ln	%l4,	%i0,	%o2
	addcc	%g4,	0x040C,	%o6
	addc	%l0,	%i1,	%g3
	fnegs	%f12,	%f5
	array16	%g5,	%g1,	%o0
	smulcc	%g7,	0x1B04,	%i2
	sllx	%o5,	%o7,	%l6
	udivx	%o1,	0x0C4E,	%i5
	lduw	[%l7 + 0x70],	%l5
	movl	%xcc,	%i7,	%g2
	srlx	%l2,	%i3,	%o3
	sll	%l1,	0x0D,	%g6
	movpos	%icc,	%i6,	%l3
	fmovsne	%xcc,	%f16,	%f4
	add	%o4,	0x0C30,	%l4
	movcc	%xcc,	%i4,	%i0
	ldd	[%l7 + 0x30],	%f14
	udiv	%o2,	0x184B,	%g4
	edge16l	%o6,	%i1,	%l0
	fmovsle	%xcc,	%f10,	%f21
	or	%g5,	%g1,	%o0
	stb	%g7,	[%l7 + 0x5D]
	fmovdpos	%icc,	%f21,	%f26
	sdivcc	%g3,	0x1BEE,	%i2
	movrlz	%o5,	%o7,	%o1
	fmovdne	%icc,	%f3,	%f5
	edge32n	%i5,	%l5,	%i7
	stw	%g2,	[%l7 + 0x14]
	movge	%xcc,	%l6,	%i3
	fsrc1	%f12,	%f22
	sth	%l2,	[%l7 + 0x7A]
	udiv	%l1,	0x1101,	%g6
	sth	%i6,	[%l7 + 0x2A]
	addcc	%o3,	%o4,	%l4
	ldd	[%l7 + 0x20],	%l2
	andn	%i0,	0x105D,	%i4
	movre	%o2,	0x3A8,	%o6
	fxors	%f26,	%f15,	%f7
	popc	%g4,	%i1
	umulcc	%l0,	%g1,	%g5
	fmovdneg	%xcc,	%f23,	%f5
	st	%f26,	[%l7 + 0x1C]
	fnors	%f3,	%f27,	%f11
	srl	%o0,	0x07,	%g3
	orncc	%i2,	0x0E79,	%g7
	edge8l	%o5,	%o1,	%i5
	edge16	%o7,	%i7,	%g2
	mulx	%l5,	%i3,	%l2
	orn	%l1,	0x17E3,	%l6
	addc	%i6,	0x0882,	%g6
	edge8l	%o3,	%o4,	%l4
	edge32	%l3,	%i0,	%o2
	popc	%o6,	%i4
	sdiv	%i1,	0x13C1,	%l0
	sth	%g4,	[%l7 + 0x12]
	andcc	%g1,	0x1BB1,	%o0
	st	%f22,	[%l7 + 0x74]
	move	%icc,	%g5,	%g3
	ldsw	[%l7 + 0x78],	%i2
	edge8l	%o5,	%g7,	%i5
	fmul8x16al	%f5,	%f22,	%f6
	ldub	[%l7 + 0x5F],	%o7
	subccc	%i7,	%g2,	%o1
	fcmpne16	%f0,	%f14,	%i3
	fcmple32	%f10,	%f10,	%l5
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	xorcc	%l1,	%o3,	%o4
	subcc	%g6,	%l3,	%i0
	udiv	%o2,	0x0122,	%o6
	restore %l4, 0x0895, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f4,	%f21
	or	%i4,	%g4,	%g1
	fmovdvc	%icc,	%f3,	%f21
	edge32l	%o0,	%l0,	%g5
	sdivcc	%i2,	0x05E0,	%o5
	movrlez	%g7,	0x379,	%i5
	srlx	%g3,	0x18,	%o7
	sra	%i7,	%o1,	%i3
	xnorcc	%l5,	0x1520,	%l2
	sllx	%g2,	0x0D,	%i6
	fandnot2	%f14,	%f26,	%f2
	umul	%l1,	0x188E,	%l6
	stw	%o3,	[%l7 + 0x14]
	xorcc	%o4,	0x1073,	%g6
	fmovdne	%xcc,	%f13,	%f24
	alignaddrl	%l3,	%o2,	%i0
	subcc	%o6,	0x0F4B,	%l4
	movrne	%i4,	0x2D8,	%i1
	xorcc	%g1,	0x0247,	%o0
	fmovse	%icc,	%f1,	%f13
	umulcc	%l0,	0x14B1,	%g4
	fornot2	%f10,	%f8,	%f4
	andcc	%g5,	0x0D42,	%i2
	movgu	%xcc,	%g7,	%o5
	edge32n	%g3,	%o7,	%i5
	fmovrdne	%i7,	%f12,	%f14
	fcmpgt32	%f6,	%f2,	%i3
	fmul8ulx16	%f12,	%f6,	%f4
	movne	%icc,	%l5,	%o1
	fcmps	%fcc2,	%f12,	%f9
	movpos	%icc,	%g2,	%i6
	andncc	%l1,	%l2,	%l6
	fcmpgt16	%f22,	%f26,	%o3
	subccc	%o4,	0x0ACF,	%l3
	fmovd	%f12,	%f2
	fnors	%f12,	%f27,	%f3
	udiv	%o2,	0x1CAC,	%i0
	addcc	%g6,	%l4,	%i4
	fmovdl	%icc,	%f18,	%f19
	movcc	%xcc,	%o6,	%i1
	edge32	%o0,	%g1,	%g4
	nop
	set	0x48, %o6
	ldsw	[%l7 + %o6],	%g5
	stb	%l0,	[%l7 + 0x13]
	fmovrdgz	%i2,	%f16,	%f8
	lduw	[%l7 + 0x44],	%o5
	xnor	%g7,	%g3,	%i5
	std	%f16,	[%l7 + 0x40]
	fcmpgt32	%f0,	%f22,	%i7
	mulx	%o7,	%i3,	%o1
	movge	%icc,	%g2,	%i6
	array16	%l1,	%l2,	%l5
	movle	%xcc,	%o3,	%l6
	sub	%l3,	0x1630,	%o2
	move	%xcc,	%o4,	%g6
	edge32n	%i0,	%i4,	%o6
	alignaddr	%i1,	%l4,	%o0
	alignaddr	%g1,	%g5,	%l0
	ldsb	[%l7 + 0x7A],	%i2
	srax	%g4,	%g7,	%o5
	edge16n	%g3,	%i7,	%o7
	ldsw	[%l7 + 0x7C],	%i5
	edge32n	%o1,	%i3,	%i6
	fmovdcc	%xcc,	%f18,	%f1
	stb	%g2,	[%l7 + 0x36]
	movcc	%xcc,	%l2,	%l5
	addccc	%l1,	0x12CA,	%l6
	fandnot2s	%f5,	%f0,	%f13
	sra	%l3,	0x11,	%o2
	nop
	set	0x50, %g2
	stx	%o4,	[%l7 + %g2]
	smulcc	%o3,	0x1A0E,	%i0
	save %i4, %g6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l4,	[%l7 + 0x08]
	edge8	%o0,	%g1,	%o6
	fnands	%f0,	%f18,	%f1
	xnor	%g5,	%i2,	%l0
	edge16n	%g7,	%o5,	%g3
	std	%f28,	[%l7 + 0x70]
	alignaddrl	%g4,	%i7,	%i5
	sdivcc	%o7,	0x14E5,	%i3
	movrlz	%o1,	0x228,	%i6
	srl	%g2,	0x1E,	%l2
	umulcc	%l1,	%l5,	%l6
	fcmple32	%f16,	%f2,	%l3
	andcc	%o4,	0x151C,	%o2
	sethi	0x17B3,	%o3
	fpmerge	%f1,	%f12,	%f30
	movrgz	%i0,	%i4,	%i1
	udivcc	%g6,	0x1223,	%l4
	stb	%g1,	[%l7 + 0x46]
	fpack16	%f22,	%f31
	ldub	[%l7 + 0x37],	%o6
	movvc	%xcc,	%o0,	%g5
	movpos	%icc,	%i2,	%l0
	fmovsge	%icc,	%f5,	%f7
	fmul8x16	%f5,	%f30,	%f18
	movneg	%xcc,	%g7,	%o5
	umulcc	%g3,	0x0E59,	%i7
	sub	%g4,	%o7,	%i3
	fmovrdne	%o1,	%f22,	%f22
	srl	%i5,	%g2,	%i6
	fmovrslz	%l2,	%f26,	%f7
	sir	0x1459
	edge32l	%l5,	%l6,	%l3
	orn	%l1,	0x084B,	%o4
	xnorcc	%o3,	0x0656,	%o2
	ldd	[%l7 + 0x68],	%f2
	fpadd32	%f30,	%f26,	%f24
	add	%i4,	%i0,	%i1
	xnorcc	%g6,	0x0027,	%g1
	edge16n	%o6,	%l4,	%g5
	fcmps	%fcc1,	%f9,	%f18
	orn	%o0,	%l0,	%g7
	stb	%i2,	[%l7 + 0x5A]
	sir	0x1DE6
	mulx	%g3,	0x18D4,	%o5
	movcs	%icc,	%i7,	%o7
	movge	%xcc,	%i3,	%g4
	andn	%i5,	0x13A4,	%o1
	move	%icc,	%i6,	%l2
	movl	%icc,	%g2,	%l5
	sdiv	%l6,	0x1905,	%l1
	movle	%icc,	%l3,	%o3
	movneg	%icc,	%o4,	%i4
	udivx	%o2,	0x0216,	%i0
	smul	%i1,	0x0551,	%g1
	fmovdleu	%icc,	%f22,	%f9
	fmovse	%icc,	%f7,	%f9
	srax	%o6,	%g6,	%g5
	array16	%o0,	%l0,	%l4
	movleu	%xcc,	%i2,	%g7
	fnand	%f18,	%f28,	%f28
	movleu	%icc,	%o5,	%i7
	nop
	set	0x37, %l4
	ldsb	[%l7 + %l4],	%g3
	stb	%i3,	[%l7 + 0x49]
	smulcc	%g4,	0x0211,	%i5
	movg	%icc,	%o1,	%i6
	and	%o7,	%l2,	%g2
	sdivcc	%l5,	0x1E72,	%l6
	xor	%l3,	0x09C7,	%l1
	fmovrse	%o4,	%f27,	%f15
	movl	%icc,	%o3,	%i4
	fnands	%f7,	%f1,	%f4
	edge32n	%o2,	%i0,	%g1
	movrne	%i1,	0x1F1,	%g6
	fmovsgu	%icc,	%f8,	%f27
	or	%o6,	0x0D9B,	%g5
	fcmpd	%fcc0,	%f12,	%f20
	edge16ln	%l0,	%o0,	%l4
	movn	%xcc,	%g7,	%o5
	sllx	%i2,	0x1F,	%i7
	movrlez	%i3,	0x25F,	%g3
	xor	%i5,	%g4,	%o1
	lduh	[%l7 + 0x0E],	%i6
	sra	%l2,	0x0D,	%g2
	nop
	set	0x58, %l0
	stw	%l5,	[%l7 + %l0]
	array32	%l6,	%l3,	%o7
	movgu	%icc,	%o4,	%o3
	movvs	%xcc,	%i4,	%o2
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	movrlz	%i1,	0x0BC,	%g6
	fone	%f30
	lduh	[%l7 + 0x7C],	%g1
	add	%g5,	%l0,	%o0
	sdivcc	%o6,	0x0A55,	%g7
	popc	0x04E5,	%l4
	fnands	%f20,	%f5,	%f12
	edge8n	%o5,	%i2,	%i7
	udivx	%g3,	0x0C74,	%i3
	andncc	%i5,	%o1,	%g4
	edge16n	%i6,	%g2,	%l2
	smulcc	%l6,	%l5,	%l3
	stx	%o7,	[%l7 + 0x18]
	sdiv	%o3,	0x0F67,	%i4
	ld	[%l7 + 0x18],	%f12
	movvc	%icc,	%o2,	%i0
	fpack16	%f4,	%f25
	movvc	%icc,	%o4,	%l1
	orncc	%g6,	0x0055,	%i1
	movcs	%icc,	%g1,	%g5
	sdivx	%l0,	0x10FA,	%o0
	or	%g7,	0x05E2,	%o6
	for	%f28,	%f12,	%f20
	xor	%l4,	%o5,	%i2
	andcc	%i7,	0x00E1,	%g3
	array16	%i3,	%i5,	%o1
	st	%f20,	[%l7 + 0x08]
	movneg	%xcc,	%g4,	%i6
	fpack32	%f22,	%f20,	%f12
	movpos	%xcc,	%l2,	%l6
	ldsw	[%l7 + 0x54],	%g2
	fmovscc	%xcc,	%f2,	%f8
	stw	%l5,	[%l7 + 0x4C]
	addccc	%o7,	%l3,	%o3
	movrne	%o2,	0x243,	%i0
	stw	%o4,	[%l7 + 0x28]
	sra	%i4,	0x09,	%g6
	smulcc	%l1,	%g1,	%i1
	edge32ln	%l0,	%g5,	%g7
	fmovdg	%icc,	%f0,	%f29
	srl	%o6,	0x13,	%o0
	movne	%xcc,	%o5,	%l4
	alignaddr	%i2,	%g3,	%i7
	movne	%xcc,	%i3,	%i5
	faligndata	%f0,	%f26,	%f2
	popc	%g4,	%o1
	fandnot1	%f14,	%f0,	%f26
	edge16l	%i6,	%l6,	%g2
	edge16	%l2,	%o7,	%l5
	stx	%l3,	[%l7 + 0x68]
	movrgez	%o2,	0x035,	%i0
	and	%o4,	%i4,	%o3
	fabsd	%f8,	%f16
	array16	%g6,	%l1,	%g1
	fornot2s	%f15,	%f15,	%f7
	srlx	%l0,	0x0C,	%g5
	fcmpeq32	%f4,	%f28,	%g7
	fmovrdlez	%i1,	%f18,	%f14
	smul	%o0,	0x1489,	%o5
	fmuld8sux16	%f28,	%f4,	%f16
	ldub	[%l7 + 0x46],	%o6
	add	%l4,	%g3,	%i2
	edge16	%i3,	%i5,	%i7
	nop
	set	0x58, %o0
	std	%f10,	[%l7 + %o0]
	movvs	%xcc,	%g4,	%o1
	ld	[%l7 + 0x40],	%f29
	andncc	%i6,	%g2,	%l6
	movne	%icc,	%o7,	%l5
	umul	%l3,	%l2,	%i0
	udiv	%o4,	0x0216,	%i4
	fnot1	%f8,	%f26
	stx	%o3,	[%l7 + 0x08]
	sir	0x0D40
	fone	%f24
	faligndata	%f16,	%f0,	%f4
	stb	%o2,	[%l7 + 0x69]
	umul	%l1,	0x0AD9,	%g6
	fmovsge	%icc,	%f31,	%f22
	edge8l	%l0,	%g5,	%g1
	subccc	%i1,	0x0BFC,	%o0
	st	%f29,	[%l7 + 0x60]
	ldsw	[%l7 + 0x60],	%g7
	movrlez	%o6,	%o5,	%g3
	fxnors	%f12,	%f3,	%f7
	subcc	%l4,	%i3,	%i2
	movvs	%xcc,	%i5,	%g4
	ldsb	[%l7 + 0x2E],	%o1
	siam	0x2
	srlx	%i7,	0x1F,	%i6
	lduw	[%l7 + 0x6C],	%l6
	movcc	%xcc,	%o7,	%g2
	edge16ln	%l5,	%l2,	%l3
	fors	%f30,	%f12,	%f17
	edge8l	%i0,	%o4,	%i4
	stw	%o3,	[%l7 + 0x34]
	fxnor	%f6,	%f12,	%f28
	movrgz	%l1,	0x2A9,	%g6
	edge32ln	%o2,	%l0,	%g1
	fxors	%f17,	%f30,	%f6
	xor	%g5,	0x1630,	%i1
	alignaddr	%g7,	%o6,	%o5
	or	%o0,	%g3,	%l4
	edge32l	%i2,	%i5,	%i3
	mulscc	%g4,	%i7,	%o1
	fmovsge	%icc,	%f25,	%f17
	movgu	%icc,	%i6,	%l6
	xnor	%g2,	%l5,	%o7
	fcmped	%fcc3,	%f0,	%f4
	fxnor	%f26,	%f8,	%f8
	fmovsleu	%xcc,	%f28,	%f31
	movne	%xcc,	%l2,	%i0
	subccc	%o4,	0x085C,	%i4
	movre	%l3,	0x246,	%l1
	addcc	%o3,	0x024D,	%g6
	add	%o2,	%l0,	%g1
	movrgz	%i1,	%g7,	%g5
	alignaddrl	%o6,	%o0,	%g3
	and	%l4,	%i2,	%o5
	umul	%i3,	%g4,	%i7
	ldub	[%l7 + 0x09],	%i5
	stb	%i6,	[%l7 + 0x23]
	fcmpne32	%f16,	%f26,	%o1
	ldsw	[%l7 + 0x44],	%l6
	fone	%f26
	edge8l	%g2,	%l5,	%o7
	popc	%l2,	%o4
	alignaddr	%i4,	%l3,	%l1
	movrlz	%i0,	0x13F,	%g6
	add	%o2,	%l0,	%g1
	udivcc	%i1,	0x1873,	%o3
	fpmerge	%f11,	%f4,	%f4
	udiv	%g5,	0x13CA,	%g7
	save %o6, 0x0D8E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l4,	%i2,	%o5
	movge	%xcc,	%i3,	%g4
	fcmpeq16	%f26,	%f6,	%i7
	fpack32	%f10,	%f20,	%f28
	restore %o0, %i5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%l6,	%i6
	orcc	%g2,	0x0930,	%o7
	fxor	%f4,	%f0,	%f26
	array16	%l5,	%l2,	%i4
	srax	%l3,	0x00,	%l1
	stb	%i0,	[%l7 + 0x2A]
	movl	%icc,	%o4,	%o2
	movvs	%xcc,	%l0,	%g1
	move	%icc,	%i1,	%g6
	sdiv	%o3,	0x0318,	%g7
	orn	%o6,	0x17A5,	%g3
	fpackfix	%f22,	%f19
	sdiv	%l4,	0x05B7,	%i2
	mulx	%g5,	%o5,	%g4
	movl	%xcc,	%i3,	%o0
	orn	%i7,	0x1303,	%o1
	srlx	%l6,	%i6,	%g2
	fors	%f3,	%f18,	%f17
	fmovsneg	%xcc,	%f31,	%f16
	sll	%o7,	%i5,	%l5
	xnor	%i4,	0x1CB9,	%l2
	movge	%xcc,	%l1,	%l3
	smul	%o4,	%o2,	%l0
	edge16ln	%i0,	%i1,	%g6
	sdivx	%g1,	0x074A,	%o3
	andcc	%o6,	0x0883,	%g7
	move	%icc,	%g3,	%i2
	fmovspos	%icc,	%f12,	%f22
	mova	%icc,	%l4,	%g5
	save %o5, 0x1BA7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%o0,	%i3,	%o1
	xnor	%i7,	%i6,	%g2
	umul	%l6,	%i5,	%o7
	fmovsne	%xcc,	%f25,	%f25
	array32	%l5,	%i4,	%l1
	and	%l3,	0x03DE,	%l2
	edge32ln	%o2,	%o4,	%i0
	sdivx	%i1,	0x19A8,	%l0
	fmovrdgz	%g1,	%f10,	%f0
	fmovdneg	%icc,	%f1,	%f10
	stw	%o3,	[%l7 + 0x18]
	fmovrdgez	%g6,	%f18,	%f22
	movleu	%xcc,	%g7,	%g3
	and	%i2,	%l4,	%o6
	array32	%g5,	%o5,	%g4
	fmovrdlz	%i3,	%f6,	%f30
	fmovdvs	%icc,	%f29,	%f29
	nop
	set	0x7C, %l1
	stb	%o0,	[%l7 + %l1]
	fabss	%f14,	%f12
	sdiv	%o1,	0x006D,	%i7
	stw	%g2,	[%l7 + 0x6C]
	stb	%l6,	[%l7 + 0x52]
	xnor	%i6,	0x0F8A,	%o7
	fzeros	%f29
	umul	%l5,	0x0015,	%i4
	andncc	%l1,	%l3,	%i5
	sdiv	%l2,	0x1066,	%o4
	fmovdcc	%xcc,	%f24,	%f7
	edge32ln	%i0,	%o2,	%l0
	fpadd16s	%f24,	%f30,	%f25
	movcc	%icc,	%g1,	%i1
	movle	%xcc,	%o3,	%g7
	udivx	%g6,	0x00EA,	%g3
	fxors	%f6,	%f27,	%f17
	fxnor	%f30,	%f4,	%f8
	or	%l4,	0x1CB8,	%o6
	alignaddr	%g5,	%o5,	%g4
	std	%f16,	[%l7 + 0x70]
	edge8	%i3,	%i2,	%o0
	smul	%i7,	%o1,	%l6
	edge8l	%i6,	%g2,	%o7
	sdivcc	%l5,	0x026F,	%l1
	ld	[%l7 + 0x34],	%f17
	sethi	0x1122,	%l3
	fxnor	%f16,	%f6,	%f0
	udivx	%i4,	0x0940,	%i5
	umulcc	%l2,	0x0EC9,	%o4
	sir	0x0BFA
	sdivx	%o2,	0x04B1,	%i0
	movcs	%xcc,	%l0,	%g1
	umulcc	%o3,	%i1,	%g6
	sethi	0x0912,	%g7
	ldd	[%l7 + 0x10],	%l4
	edge16ln	%g3,	%g5,	%o5
	srlx	%o6,	0x1B,	%g4
	addc	%i3,	%o0,	%i7
	movvc	%xcc,	%i2,	%l6
	addccc	%o1,	%i6,	%o7
	edge16n	%g2,	%l5,	%l1
	fmovrdlez	%i4,	%f22,	%f8
	stx	%l3,	[%l7 + 0x20]
	add	%i5,	0x15E1,	%o4
	ldub	[%l7 + 0x7C],	%l2
	fcmpgt16	%f26,	%f28,	%o2
	lduh	[%l7 + 0x50],	%l0
	edge8ln	%i0,	%o3,	%g1
	fxors	%f17,	%f30,	%f13
	udivcc	%g6,	0x16FF,	%g7
	fmovsle	%xcc,	%f22,	%f22
	edge8l	%l4,	%g3,	%i1
	sll	%o5,	0x08,	%o6
	ld	[%l7 + 0x54],	%f22
	edge16l	%g5,	%i3,	%g4
	movvs	%xcc,	%i7,	%i2
	subcc	%o0,	%l6,	%o1
	edge8ln	%i6,	%o7,	%l5
	movle	%icc,	%l1,	%i4
	movrlez	%l3,	0x2D0,	%g2
	and	%i5,	0x0277,	%l2
	siam	0x7
	subccc	%o2,	%l0,	%i0
	movne	%xcc,	%o3,	%g1
	sdivcc	%g6,	0x1D16,	%o4
	orncc	%g7,	0x03DF,	%g3
	xnor	%i1,	0x18E0,	%l4
	sllx	%o5,	0x14,	%o6
	ldsh	[%l7 + 0x1A],	%g5
	fmovscs	%icc,	%f12,	%f20
	mova	%xcc,	%g4,	%i7
	edge16l	%i2,	%i3,	%o0
	fmovsl	%icc,	%f3,	%f29
	subc	%l6,	%o1,	%o7
	udivcc	%i6,	0x196F,	%l1
	ldsh	[%l7 + 0x34],	%l5
	fmovsvs	%xcc,	%f23,	%f9
	stb	%l3,	[%l7 + 0x46]
	array32	%i4,	%i5,	%l2
	xnor	%o2,	%l0,	%i0
	siam	0x6
	udiv	%g2,	0x02C8,	%o3
	edge32l	%g1,	%o4,	%g6
	movcc	%xcc,	%g7,	%g3
	fnors	%f7,	%f12,	%f29
	alignaddrl	%i1,	%l4,	%o6
	sll	%g5,	0x1D,	%o5
	subc	%g4,	%i2,	%i3
	udiv	%i7,	0x0807,	%l6
	udiv	%o1,	0x0FD4,	%o0
	orn	%o7,	%l1,	%l5
	movrgez	%i6,	0x15B,	%l3
	srlx	%i4,	%i5,	%o2
	sir	0x0E6C
	move	%icc,	%l2,	%i0
	fmovdn	%icc,	%f19,	%f3
	movge	%icc,	%g2,	%l0
	fpmerge	%f27,	%f18,	%f22
	move	%icc,	%g1,	%o4
	ldd	[%l7 + 0x40],	%f22
	stw	%o3,	[%l7 + 0x60]
	ldd	[%l7 + 0x70],	%g6
	fmovsgu	%icc,	%f20,	%f25
	fmul8sux16	%f12,	%f4,	%f4
	nop
	set	0x26, %o2
	ldsh	[%l7 + %o2],	%g3
	alignaddrl	%g6,	%l4,	%o6
	movrlez	%g5,	0x008,	%o5
	array32	%i1,	%g4,	%i3
	fnor	%f30,	%f30,	%f12
	movneg	%icc,	%i7,	%l6
	edge16l	%o1,	%i2,	%o7
	fmovs	%f25,	%f23
	movne	%icc,	%o0,	%l1
	movle	%icc,	%l5,	%l3
	fmovsl	%icc,	%f30,	%f29
	srl	%i6,	0x18,	%i4
	ldx	[%l7 + 0x40],	%i5
	fcmpgt16	%f8,	%f22,	%o2
	fmovdne	%icc,	%f27,	%f25
	movre	%i0,	0x073,	%l2
	smulcc	%l0,	0x093C,	%g2
	fnegd	%f0,	%f2
	ldx	[%l7 + 0x38],	%o4
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	movrlez	%g1,	0x363,	%l4
	lduh	[%l7 + 0x10],	%o6
	movcc	%icc,	%g5,	%o5
	ldd	[%l7 + 0x20],	%g6
	udiv	%g4,	0x0431,	%i1
	ldd	[%l7 + 0x48],	%f0
	edge32l	%i3,	%l6,	%i7
	stx	%i2,	[%l7 + 0x60]
	movrgez	%o1,	%o0,	%l1
	fnand	%f26,	%f16,	%f0
	fmovdvs	%icc,	%f16,	%f4
	edge16n	%l5,	%l3,	%i6
	movre	%o7,	%i4,	%i5
	edge32n	%o2,	%i0,	%l2
	andncc	%g2,	%o4,	%o3
	edge16n	%g7,	%g3,	%g1
	subcc	%l0,	0x1BB7,	%o6
	fxors	%f4,	%f10,	%f8
	orncc	%l4,	0x051A,	%o5
	movrgez	%g5,	%g6,	%i1
	srlx	%g4,	0x12,	%i3
	fpack16	%f0,	%f8
	movneg	%icc,	%l6,	%i7
	fmuld8sux16	%f5,	%f14,	%f24
	edge16	%o1,	%i2,	%o0
	movvs	%xcc,	%l5,	%l3
	fmovrslz	%l1,	%f25,	%f4
	array16	%i6,	%o7,	%i4
	xnor	%o2,	%i5,	%l2
	udivcc	%i0,	0x066B,	%g2
	sll	%o4,	%g7,	%o3
	siam	0x5
	edge32n	%g3,	%l0,	%o6
	ldsh	[%l7 + 0x1E],	%l4
	mulscc	%g1,	%o5,	%g6
	movrlz	%g5,	%i1,	%g4
	movrlz	%i3,	0x2A8,	%l6
	ldsh	[%l7 + 0x22],	%o1
	array16	%i2,	%i7,	%o0
	movgu	%icc,	%l3,	%l5
	ldsb	[%l7 + 0x16],	%i6
	srl	%l1,	0x17,	%o7
	fmovsn	%xcc,	%f28,	%f23
	alignaddrl	%o2,	%i4,	%i5
	add	%i0,	0x0C98,	%l2
	fandnot2	%f18,	%f4,	%f4
	ldd	[%l7 + 0x30],	%f14
	movrlez	%g2,	0x1A5,	%o4
	ldx	[%l7 + 0x58],	%g7
	ldd	[%l7 + 0x08],	%g2
	umulcc	%l0,	0x1C2A,	%o6
	fpackfix	%f26,	%f15
	edge8n	%l4,	%o3,	%o5
	movgu	%xcc,	%g6,	%g1
	xorcc	%g5,	0x1A00,	%g4
	movne	%xcc,	%i1,	%l6
	array8	%i3,	%i2,	%i7
	fand	%f22,	%f8,	%f0
	stx	%o0,	[%l7 + 0x30]
	sth	%l3,	[%l7 + 0x6E]
	fpsub32	%f8,	%f18,	%f18
	array16	%l5,	%o1,	%l1
	movrgez	%i6,	%o2,	%o7
	sub	%i4,	%i0,	%i5
	edge16l	%g2,	%l2,	%g7
	movgu	%icc,	%g3,	%o4
	andcc	%l0,	0x0BA3,	%o6
	movrgez	%l4,	%o3,	%o5
	and	%g1,	0x06AE,	%g5
	or	%g6,	%g4,	%i1
	srax	%i3,	0x1C,	%l6
	movgu	%xcc,	%i7,	%o0
	movpos	%xcc,	%l3,	%l5
	andncc	%i2,	%o1,	%l1
	mulx	%o2,	0x1E8F,	%i6
	stx	%i4,	[%l7 + 0x50]
	fpsub16	%f16,	%f28,	%f2
	subccc	%i0,	%o7,	%i5
	std	%f16,	[%l7 + 0x68]
	movre	%g2,	0x28B,	%g7
	sdivcc	%l2,	0x1375,	%g3
	stx	%l0,	[%l7 + 0x28]
	movle	%icc,	%o6,	%l4
	xnor	%o4,	%o3,	%g1
	save %o5, %g5, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i1, %i3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	0x19AB,	%i7
	sllx	%l3,	0x1A,	%o0
	movleu	%icc,	%i2,	%o1
	stw	%l5,	[%l7 + 0x58]
	fmovscc	%icc,	%f3,	%f27
	fmovdl	%icc,	%f7,	%f3
	sdivx	%o2,	0x1A81,	%l1
	mova	%xcc,	%i4,	%i0
	fcmple32	%f28,	%f8,	%i6
	sir	0x0EA8
	stb	%i5,	[%l7 + 0x21]
	fsrc2s	%f26,	%f16
	stw	%o7,	[%l7 + 0x6C]
	movn	%xcc,	%g2,	%g7
	movcs	%xcc,	%g3,	%l0
	smul	%l2,	%o6,	%l4
	movrne	%o3,	%o4,	%o5
	fabss	%f19,	%f3
	ldub	[%l7 + 0x65],	%g5
	sdiv	%g6,	0x013D,	%i1
	ld	[%l7 + 0x14],	%f30
	fmovrse	%i3,	%f16,	%f19
	array16	%l6,	%g1,	%i7
	udivcc	%g4,	0x1AD7,	%o0
	andncc	%l3,	%i2,	%l5
	umulcc	%o2,	%o1,	%i4
	nop
	set	0x48, %l2
	ldx	[%l7 + %l2],	%l1
	nop
	set	0x30, %l5
	ldsw	[%l7 + %l5],	%i6
	edge8ln	%i5,	%o7,	%g2
	edge32ln	%g7,	%i0,	%g3
	fcmpgt16	%f6,	%f24,	%l2
	ldsw	[%l7 + 0x30],	%l0
	fzero	%f28
	sdiv	%l4,	0x0DE3,	%o6
	sub	%o3,	0x1E99,	%o4
	edge32l	%g5,	%g6,	%o5
	fzeros	%f12
	movle	%xcc,	%i1,	%l6
	movl	%icc,	%g1,	%i7
	mova	%xcc,	%i3,	%g4
	alignaddr	%o0,	%i2,	%l3
	array16	%l5,	%o2,	%i4
	popc	0x10EB,	%o1
	srax	%l1,	%i6,	%o7
	nop
	set	0x61, %g4
	ldsb	[%l7 + %g4],	%i5
	movle	%xcc,	%g2,	%i0
	mulx	%g7,	%l2,	%l0
	fandnot1	%f10,	%f4,	%f8
	edge32ln	%l4,	%o6,	%g3
	subc	%o4,	0x10D9,	%g5
	srax	%g6,	0x01,	%o5
	fmovsne	%icc,	%f3,	%f17
	orncc	%i1,	%l6,	%o3
	movcc	%icc,	%i7,	%g1
	addccc	%g4,	0x179A,	%i3
	fmovrdlez	%i2,	%f24,	%f30
	fabsd	%f0,	%f14
	stw	%o0,	[%l7 + 0x68]
	subccc	%l3,	%o2,	%l5
	edge16l	%i4,	%l1,	%i6
	fmovse	%xcc,	%f8,	%f16
	ldub	[%l7 + 0x74],	%o1
	movpos	%icc,	%o7,	%i5
	xorcc	%i0,	%g7,	%g2
	smulcc	%l0,	%l2,	%l4
	movg	%xcc,	%o6,	%o4
	andn	%g5,	0x1D2E,	%g6
	sir	0x0C59
	fmovrdlz	%o5,	%f2,	%f24
	ldd	[%l7 + 0x60],	%g2
	movge	%icc,	%l6,	%o3
	movleu	%xcc,	%i1,	%i7
	ldd	[%l7 + 0x38],	%f12
	alignaddr	%g4,	%i3,	%i2
	fornot1s	%f14,	%f22,	%f14
	st	%f12,	[%l7 + 0x68]
	xorcc	%o0,	%l3,	%o2
	andncc	%g1,	%i4,	%l1
	movl	%xcc,	%i6,	%l5
	bshuffle	%f20,	%f22,	%f12
	fmovspos	%xcc,	%f10,	%f10
	ldsb	[%l7 + 0x10],	%o7
	addcc	%i5,	0x179C,	%o1
	ld	[%l7 + 0x7C],	%f2
	sll	%i0,	0x0A,	%g2
	fpsub16	%f20,	%f26,	%f18
	sir	0x129F
	fxors	%f28,	%f23,	%f28
	movg	%xcc,	%g7,	%l2
	orn	%l0,	%o6,	%o4
	movre	%g5,	%g6,	%o5
	lduh	[%l7 + 0x24],	%l4
	xnorcc	%l6,	0x18C3,	%o3
	subcc	%g3,	0x05FD,	%i1
	edge32n	%i7,	%g4,	%i2
	movrgez	%o0,	0x097,	%l3
	movrne	%i3,	0x0B4,	%o2
	andcc	%g1,	%l1,	%i4
	movvs	%xcc,	%i6,	%l5
	orncc	%i5,	0x0F0A,	%o1
	sdiv	%o7,	0x1214,	%g2
	std	%f28,	[%l7 + 0x48]
	mulx	%i0,	%l2,	%g7
	ldd	[%l7 + 0x18],	%f30
	fandnot2	%f10,	%f4,	%f6
	fpsub32s	%f7,	%f9,	%f23
	fabss	%f22,	%f9
	ldd	[%l7 + 0x48],	%f18
	fcmpgt16	%f14,	%f2,	%o6
	srlx	%l0,	%o4,	%g5
	addc	%o5,	0x0E0F,	%g6
	sllx	%l4,	0x04,	%l6
	udivcc	%o3,	0x0594,	%g3
	ldd	[%l7 + 0x58],	%i6
	std	%f14,	[%l7 + 0x18]
	movg	%icc,	%i1,	%i2
	edge16ln	%g4,	%l3,	%i3
	restore %o0, %g1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o2,	%i6
	fcmpne32	%f18,	%f24,	%i4
	edge16	%i5,	%l5,	%o1
	andn	%o7,	0x105E,	%i0
	fmul8ulx16	%f28,	%f24,	%f30
	stb	%g2,	[%l7 + 0x11]
	fandnot1	%f18,	%f16,	%f0
	or	%l2,	0x102F,	%g7
	fmovrde	%o6,	%f18,	%f26
	mova	%icc,	%o4,	%g5
	movne	%xcc,	%o5,	%g6
	andcc	%l4,	0x03B6,	%l6
	fmovrdne	%l0,	%f28,	%f28
	sub	%g3,	%i7,	%o3
	fzeros	%f21
	subcc	%i2,	%g4,	%i1
	srl	%l3,	0x01,	%o0
	sethi	0x0E1B,	%i3
	sub	%g1,	%l1,	%i6
	orcc	%i4,	%o2,	%i5
	alignaddrl	%l5,	%o1,	%o7
	fmovsleu	%xcc,	%f0,	%f7
	fpadd16s	%f3,	%f12,	%f10
	umulcc	%i0,	%g2,	%l2
	edge32	%o6,	%o4,	%g5
	movcc	%icc,	%g7,	%g6
	ldd	[%l7 + 0x08],	%l4
	udiv	%o5,	0x11AB,	%l0
	fmovsne	%xcc,	%f23,	%f14
	srl	%g3,	0x07,	%l6
	ldx	[%l7 + 0x50],	%o3
	popc	%i7,	%i2
	mulscc	%i1,	%g4,	%o0
	fcmped	%fcc3,	%f2,	%f12
	movn	%xcc,	%i3,	%g1
	fmovdcs	%xcc,	%f6,	%f16
	fmovrsgz	%l1,	%f27,	%f24
	ldsh	[%l7 + 0x0C],	%i6
	edge32l	%l3,	%i4,	%o2
	fxors	%f28,	%f25,	%f27
	xnor	%l5,	%i5,	%o7
	fcmple32	%f24,	%f18,	%o1
	movle	%xcc,	%g2,	%l2
	fmovdg	%icc,	%f21,	%f6
	addccc	%i0,	%o6,	%g5
	fpack32	%f28,	%f26,	%f24
	ld	[%l7 + 0x14],	%f24
	xor	%g7,	0x05EC,	%o4
	orn	%g6,	0x0B85,	%o5
	orn	%l0,	0x1C17,	%l4
	movneg	%xcc,	%l6,	%o3
	orncc	%i7,	0x0E96,	%g3
	mulscc	%i2,	0x0640,	%i1
	fandnot2	%f16,	%f24,	%f20
	fcmpeq32	%f14,	%f8,	%o0
	ldsb	[%l7 + 0x64],	%g4
	nop
	set	0x20, %i3
	ldd	[%l7 + %i3],	%g0
	nop
	set	0x58, %i7
	ldsw	[%l7 + %i7],	%i3
	udiv	%i6,	0x1CFC,	%l1
	smulcc	%i4,	%l3,	%l5
	move	%icc,	%i5,	%o7
	xnor	%o2,	%g2,	%o1
	fandnot1	%f22,	%f0,	%f10
	alignaddrl	%l2,	%o6,	%i0
	movrlz	%g7,	0x1DD,	%g5
	edge16	%o4,	%o5,	%l0
	fpsub32s	%f28,	%f26,	%f19
	or	%l4,	0x1BA5,	%g6
	fmovrslz	%o3,	%f3,	%f5
	fxnor	%f4,	%f20,	%f12
	andn	%l6,	0x15EA,	%i7
	udivx	%i2,	0x0746,	%i1
	fnegs	%f0,	%f0
	edge16n	%g3,	%g4,	%g1
	udivx	%o0,	0x0FFA,	%i6
	nop
	set	0x68, %g7
	ldd	[%l7 + %g7],	%f8
	movle	%icc,	%l1,	%i4
	ldd	[%l7 + 0x10],	%l2
	alignaddr	%i3,	%i5,	%o7
	movcs	%xcc,	%o2,	%g2
	sllx	%l5,	0x10,	%o1
	fnot2s	%f3,	%f13
	edge32n	%l2,	%o6,	%g7
	add	%g5,	0x127C,	%o4
	fmuld8ulx16	%f3,	%f13,	%f14
	fmovse	%xcc,	%f1,	%f18
	udivcc	%i0,	0x1E8D,	%l0
	mova	%icc,	%o5,	%g6
	xnorcc	%l4,	0x16B5,	%o3
	movrgez	%i7,	0x1EF,	%i2
	move	%icc,	%l6,	%g3
	movvc	%icc,	%i1,	%g1
	stx	%o0,	[%l7 + 0x78]
	add	%i6,	%g4,	%i4
	addcc	%l1,	0x0FA6,	%l3
	movcc	%icc,	%i3,	%i5
	nop
	set	0x78, %o5
	stw	%o7,	[%l7 + %o5]
	array16	%o2,	%g2,	%o1
	movg	%xcc,	%l2,	%o6
	addccc	%l5,	0x19E5,	%g5
	fzero	%f12
	movpos	%xcc,	%g7,	%o4
	edge8ln	%i0,	%o5,	%g6
	ldsh	[%l7 + 0x4A],	%l0
	ldsh	[%l7 + 0x62],	%o3
	umul	%i7,	0x1BC1,	%l4
	nop
	set	0x70, %o4
	ldx	[%l7 + %o4],	%l6
	subcc	%i2,	0x0133,	%g3
	addcc	%g1,	0x0087,	%i1
	mova	%xcc,	%i6,	%g4
	orncc	%i4,	0x0500,	%l1
	udivcc	%o0,	0x1ED3,	%l3
	edge8ln	%i5,	%i3,	%o2
	sth	%g2,	[%l7 + 0x36]
	sllx	%o7,	0x02,	%l2
	lduw	[%l7 + 0x5C],	%o6
	movrgez	%o1,	%l5,	%g5
	sethi	0x1D9F,	%o4
	edge8	%i0,	%g7,	%o5
	ldx	[%l7 + 0x28],	%l0
	movrne	%o3,	0x0C8,	%i7
	movl	%icc,	%l4,	%l6
	sllx	%g6,	0x0F,	%i2
	udiv	%g1,	0x0231,	%i1
	sub	%g3,	0x00E2,	%i6
	stb	%g4,	[%l7 + 0x10]
	ld	[%l7 + 0x34],	%f17
	movrgez	%i4,	%l1,	%o0
	edge8n	%l3,	%i5,	%o2
	movg	%xcc,	%g2,	%i3
	movge	%xcc,	%o7,	%l2
	sth	%o1,	[%l7 + 0x3A]
	orcc	%o6,	0x128E,	%g5
	array8	%l5,	%o4,	%i0
	movvs	%xcc,	%g7,	%o5
	fone	%f6
	movl	%icc,	%o3,	%l0
	popc	%l4,	%i7
	edge8	%l6,	%i2,	%g1
	movgu	%xcc,	%i1,	%g3
	subcc	%g6,	0x068E,	%g4
	orcc	%i6,	%i4,	%l1
	sdiv	%o0,	0x13C9,	%l3
	sdiv	%o2,	0x1EDD,	%i5
	movn	%icc,	%i3,	%g2
	sethi	0x1646,	%o7
	udiv	%l2,	0x1181,	%o6
	movrne	%o1,	%l5,	%o4
	mulx	%i0,	%g7,	%g5
	udivcc	%o3,	0x0C71,	%o5
	edge8l	%l0,	%l4,	%i7
	movgu	%xcc,	%l6,	%i2
	ldd	[%l7 + 0x40],	%g0
	or	%i1,	%g3,	%g4
	andncc	%i6,	%g6,	%i4
	subcc	%l1,	0x1C20,	%o0
	movcc	%icc,	%l3,	%i5
	fpsub32s	%f8,	%f8,	%f30
	siam	0x7
	fone	%f10
	lduh	[%l7 + 0x28],	%o2
	xnorcc	%i3,	0x070F,	%o7
	fones	%f30
	andn	%l2,	%o6,	%g2
	fmovscc	%xcc,	%f15,	%f14
	ld	[%l7 + 0x2C],	%f3
	sth	%o1,	[%l7 + 0x1A]
	ldsw	[%l7 + 0x30],	%l5
	edge16l	%i0,	%o4,	%g5
	mulx	%g7,	0x0304,	%o3
	st	%f13,	[%l7 + 0x68]
	move	%icc,	%o5,	%l4
	edge32ln	%i7,	%l6,	%l0
	array16	%g1,	%i1,	%g3
	fmovdle	%icc,	%f7,	%f1
	sdivx	%i2,	0x1904,	%i6
	fmovdle	%icc,	%f8,	%f5
	subcc	%g4,	%i4,	%g6
	movrgz	%l1,	0x384,	%l3
	sll	%i5,	%o0,	%o2
	srlx	%i3,	%o7,	%o6
	xor	%g2,	0x1A9F,	%l2
	movrlz	%o1,	0x2E6,	%l5
	or	%i0,	0x1F64,	%o4
	edge8ln	%g7,	%o3,	%o5
	subccc	%l4,	0x14DB,	%g5
	st	%f1,	[%l7 + 0x1C]
	ldd	[%l7 + 0x30],	%f20
	popc	%i7,	%l0
	fzero	%f28
	edge8l	%g1,	%i1,	%l6
	fmul8x16	%f4,	%f2,	%f24
	movrlez	%i2,	%g3,	%i6
	array32	%g4,	%i4,	%g6
	ld	[%l7 + 0x78],	%f1
	mulx	%l3,	%l1,	%o0
	umul	%i5,	0x157E,	%i3
	ldx	[%l7 + 0x10],	%o2
	edge16	%o6,	%o7,	%g2
	array32	%o1,	%l5,	%i0
	fone	%f0
	movvs	%icc,	%l2,	%g7
	andcc	%o4,	0x0D80,	%o3
	edge8n	%l4,	%g5,	%i7
	fandnot1	%f10,	%f24,	%f20
	fcmpne16	%f30,	%f30,	%o5
	fmovsle	%xcc,	%f17,	%f6
	smulcc	%g1,	%l0,	%i1
	alignaddrl	%l6,	%i2,	%g3
	save %g4, 0x0344, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegs	%f11,	%f25
	edge32ln	%g6,	%l3,	%l1
	lduw	[%l7 + 0x28],	%i4
	edge16ln	%o0,	%i3,	%i5
	array8	%o6,	%o7,	%g2
	sth	%o1,	[%l7 + 0x5E]
	ldd	[%l7 + 0x78],	%f2
	xnor	%o2,	0x1A11,	%i0
	movvs	%xcc,	%l5,	%g7
	umulcc	%o4,	0x1FC8,	%o3
	movpos	%icc,	%l4,	%l2
	and	%g5,	0x190A,	%i7
	sir	0x1631
	alignaddr	%o5,	%l0,	%i1
	and	%g1,	0x133A,	%l6
	fmul8x16al	%f5,	%f22,	%f16
	sdivcc	%g3,	0x1A40,	%g4
	edge16	%i2,	%g6,	%l3
	srlx	%i6,	%i4,	%l1
	lduw	[%l7 + 0x60],	%i3
	movleu	%xcc,	%o0,	%o6
	sllx	%i5,	0x19,	%o7
	edge8n	%g2,	%o2,	%i0
	array32	%o1,	%g7,	%l5
	ldub	[%l7 + 0x09],	%o3
	std	%f4,	[%l7 + 0x38]
	edge8l	%o4,	%l2,	%g5
	fmovrse	%l4,	%f26,	%f15
	fmul8ulx16	%f12,	%f12,	%f16
	fsrc1s	%f17,	%f22
	fmuld8sux16	%f18,	%f1,	%f24
	orn	%o5,	0x0BC4,	%l0
	movl	%icc,	%i7,	%g1
	movgu	%xcc,	%l6,	%g3
	smulcc	%i1,	%g4,	%i2
	ldsh	[%l7 + 0x1E],	%g6
	ld	[%l7 + 0x50],	%f6
	movvs	%xcc,	%i6,	%i4
	movrgz	%l1,	0x055,	%l3
	movneg	%icc,	%o0,	%o6
	movcs	%xcc,	%i5,	%o7
	ldd	[%l7 + 0x50],	%f28
	fsrc1s	%f17,	%f18
	sdiv	%g2,	0x0335,	%o2
	movcc	%icc,	%i0,	%i3
	sir	0x1973
	fmovdle	%icc,	%f7,	%f29
	xor	%g7,	%o1,	%o3
	mulx	%o4,	%l2,	%g5
	sub	%l4,	%o5,	%l0
	movpos	%icc,	%i7,	%g1
	smulcc	%l5,	%g3,	%l6
	or	%i1,	%g4,	%g6
	movvc	%icc,	%i6,	%i2
	save %i4, %l3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%o0,	%i5,	%o7
	and	%o6,	%g2,	%o2
	lduh	[%l7 + 0x16],	%i0
	sethi	0x0F74,	%g7
	ldsb	[%l7 + 0x48],	%o1
	move	%icc,	%o3,	%i3
	edge16n	%l2,	%o4,	%g5
	edge32n	%l4,	%o5,	%l0
	udivx	%i7,	0x16E6,	%g1
	array8	%l5,	%l6,	%g3
	sllx	%g4,	0x1A,	%i1
	fnegd	%f10,	%f0
	or	%i6,	0x0C94,	%g6
	ldx	[%l7 + 0x40],	%i4
	addcc	%i2,	%l3,	%l1
	ldsh	[%l7 + 0x26],	%o0
	addccc	%i5,	0x002B,	%o6
	movne	%xcc,	%o7,	%o2
	fmul8x16al	%f14,	%f25,	%f4
	lduh	[%l7 + 0x1C],	%g2
	edge16l	%i0,	%g7,	%o1
	ldd	[%l7 + 0x70],	%f20
	sdivcc	%o3,	0x06BA,	%l2
	edge32n	%i3,	%g5,	%l4
	lduw	[%l7 + 0x1C],	%o4
	stb	%o5,	[%l7 + 0x5C]
	movgu	%xcc,	%i7,	%l0
	sll	%g1,	%l6,	%l5
	sir	0x1919
	movcc	%icc,	%g4,	%g3
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	stx	%i4,	[%l7 + 0x08]
	std	%f14,	[%l7 + 0x48]
	smulcc	%i2,	0x1682,	%l3
	edge32ln	%l1,	%o0,	%g6
	add	%i5,	%o6,	%o7
	movpos	%xcc,	%o2,	%g2
	xorcc	%g7,	0x15CD,	%o1
	fmovrdne	%i0,	%f28,	%f20
	ldsw	[%l7 + 0x50],	%o3
	popc	%l2,	%g5
	smulcc	%l4,	0x0CA2,	%o4
	fmovrsgz	%o5,	%f29,	%f5
	fmovdpos	%xcc,	%f21,	%f16
	srl	%i3,	0x1D,	%l0
	fmovsvs	%xcc,	%f26,	%f6
	edge32ln	%i7,	%l6,	%g1
	srl	%g4,	%l5,	%i1
	movrgez	%g3,	%i4,	%i6
	movrlez	%i2,	0x07E,	%l1
	movn	%xcc,	%l3,	%o0
	fmul8sux16	%f18,	%f22,	%f6
	srax	%i5,	%o6,	%g6
	sdivcc	%o2,	0x0FC0,	%g2
	or	%g7,	0x1955,	%o1
	srax	%o7,	%o3,	%l2
	orcc	%i0,	0x03E8,	%g5
	fnot2	%f12,	%f2
	orcc	%l4,	%o4,	%i3
	nop
	set	0x68, %i1
	ldd	[%l7 + %i1],	%f4
	movvc	%xcc,	%o5,	%l0
	array32	%l6,	%i7,	%g1
	movle	%xcc,	%l5,	%g4
	fmovdpos	%icc,	%f8,	%f18
	edge16ln	%i1,	%i4,	%i6
	edge8l	%i2,	%g3,	%l3
	array8	%l1,	%i5,	%o0
	ldd	[%l7 + 0x68],	%f0
	movne	%icc,	%g6,	%o6
	orn	%g2,	%o2,	%g7
	ldsw	[%l7 + 0x70],	%o1
	udiv	%o7,	0x03F0,	%o3
	fmovrslz	%l2,	%f31,	%f20
	edge32n	%g5,	%i0,	%o4
	xorcc	%l4,	0x1B99,	%i3
	sllx	%o5,	0x12,	%l6
	fpsub32s	%f8,	%f18,	%f5
	fxor	%f30,	%f26,	%f8
	restore %l0, 0x0A9E, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%g1,	%l5,	%i1
	fmul8x16	%f28,	%f10,	%f12
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f10
	fmovrslz	%i4,	%f31,	%f25
	movre	%g4,	0x298,	%i6
	save %i2, %l3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x44],	%g3
	array8	%i5,	%o0,	%o6
	fpadd16s	%f9,	%f28,	%f22
	mulx	%g2,	%o2,	%g6
	movg	%xcc,	%g7,	%o7
	andn	%o1,	%o3,	%l2
	fmovsgu	%xcc,	%f7,	%f29
	sll	%g5,	%i0,	%o4
	fpack32	%f20,	%f24,	%f24
	edge16ln	%i3,	%l4,	%o5
	movrne	%l6,	0x326,	%i7
	edge16n	%g1,	%l0,	%l5
	mulx	%i4,	%i1,	%i6
	movgu	%icc,	%g4,	%l3
	edge32ln	%l1,	%i2,	%g3
	edge16l	%o0,	%i5,	%o6
	movneg	%icc,	%o2,	%g6
	fmovsneg	%icc,	%f3,	%f12
	fmul8x16au	%f0,	%f10,	%f16
	srax	%g2,	0x08,	%o7
	movgu	%icc,	%g7,	%o1
	sub	%l2,	%o3,	%i0
	ldub	[%l7 + 0x6A],	%g5
	array32	%o4,	%l4,	%o5
	ld	[%l7 + 0x08],	%f22
	fone	%f10
	edge32ln	%i3,	%l6,	%g1
	array16	%i7,	%l0,	%l5
	movge	%icc,	%i4,	%i1
	fpadd32s	%f24,	%f1,	%f13
	srl	%i6,	%l3,	%l1
	stw	%i2,	[%l7 + 0x48]
	sll	%g3,	0x11,	%g4
	array32	%i5,	%o0,	%o2
	addcc	%o6,	%g2,	%g6
	array32	%g7,	%o1,	%o7
	ldsh	[%l7 + 0x4C],	%l2
	sdiv	%o3,	0x0366,	%i0
	fnot2	%f22,	%f22
	ld	[%l7 + 0x7C],	%f3
	fpsub32	%f14,	%f8,	%f12
	movre	%g5,	%l4,	%o4
	fmovsle	%xcc,	%f22,	%f19
	xorcc	%i3,	0x1CD4,	%o5
	ld	[%l7 + 0x54],	%f0
	fcmpes	%fcc1,	%f24,	%f23
	udivx	%g1,	0x063F,	%l6
	edge16n	%i7,	%l0,	%l5
	fmovrsgez	%i4,	%f18,	%f12
	subcc	%i1,	%l3,	%l1
	nop
	set	0x0C, %i6
	lduh	[%l7 + %i6],	%i6
	fors	%f8,	%f17,	%f4
	std	%f0,	[%l7 + 0x08]
	movg	%xcc,	%i2,	%g4
	movne	%icc,	%i5,	%o0
	and	%g3,	0x0E61,	%o6
	edge16n	%g2,	%g6,	%o2
	array8	%o1,	%o7,	%l2
	orn	%o3,	%i0,	%g7
	movvs	%xcc,	%g5,	%l4
	fcmple32	%f24,	%f16,	%o4
	udivcc	%o5,	0x1A3E,	%i3
	fandnot1	%f28,	%f26,	%f2
	ldx	[%l7 + 0x78],	%g1
	save %l6, %i7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l5,	%i4
	lduh	[%l7 + 0x58],	%l3
	for	%f10,	%f30,	%f12
	fornot2	%f4,	%f16,	%f30
	fmovdne	%icc,	%f14,	%f22
	fmovdn	%xcc,	%f31,	%f1
	movne	%icc,	%i1,	%l1
	umul	%i6,	0x19E5,	%i2
	fandnot2	%f24,	%f26,	%f4
	fcmpes	%fcc2,	%f15,	%f12
	srax	%g4,	0x1C,	%o0
	sethi	0x126C,	%i5
	subc	%o6,	0x0205,	%g2
	udivx	%g3,	0x13E8,	%g6
	movvc	%icc,	%o1,	%o2
	movgu	%icc,	%o7,	%o3
	fmovrsne	%i0,	%f19,	%f3
	sdiv	%l2,	0x006C,	%g5
	smulcc	%g7,	0x0AD1,	%o4
	ldub	[%l7 + 0x4B],	%o5
	add	%l4,	%g1,	%i3
	movrgz	%l6,	%i7,	%l5
	edge16	%l0,	%l3,	%i4
	save %l1, %i6, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f19,	%f7
	movg	%icc,	%i1,	%g4
	st	%f13,	[%l7 + 0x50]
	fcmped	%fcc3,	%f6,	%f8
	fnand	%f16,	%f22,	%f6
	fpsub32	%f6,	%f20,	%f28
	fmovsgu	%xcc,	%f1,	%f3
	movn	%icc,	%o0,	%i5
	udivx	%g2,	0x0FD8,	%o6
	sethi	0x1E54,	%g3
	sub	%o1,	%o2,	%g6
	movrgez	%o3,	%o7,	%i0
	sub	%g5,	%g7,	%o4
	movpos	%xcc,	%o5,	%l4
	fcmpne32	%f8,	%f20,	%l2
	udivcc	%i3,	0x1F0E,	%g1
	movgu	%icc,	%l6,	%l5
	fmovs	%f30,	%f17
	move	%xcc,	%i7,	%l0
	fmuld8ulx16	%f27,	%f7,	%f20
	alignaddrl	%l3,	%i4,	%l1
	sethi	0x13DC,	%i6
	edge8	%i2,	%i1,	%g4
	fmovrsgz	%o0,	%f11,	%f23
	andn	%i5,	%o6,	%g3
	edge8ln	%o1,	%o2,	%g6
	ldub	[%l7 + 0x32],	%g2
	xorcc	%o7,	%i0,	%o3
	movre	%g7,	0x3E7,	%g5
	ldsb	[%l7 + 0x41],	%o5
	srlx	%l4,	0x03,	%o4
	smulcc	%i3,	%l2,	%g1
	sub	%l5,	0x1C09,	%i7
	save %l0, 0x0B96, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f28,	%f1,	%f28
	edge8	%l3,	%l1,	%i4
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f8
	fmovdcc	%icc,	%f26,	%f14
	addc	%i6,	0x1EAA,	%i2
	andncc	%i1,	%o0,	%i5
	edge16n	%g4,	%o6,	%g3
	fmovsne	%xcc,	%f29,	%f12
	fpmerge	%f31,	%f1,	%f10
	movrgez	%o2,	0x316,	%o1
	orcc	%g2,	0x0577,	%g6
	mulx	%i0,	0x1EBA,	%o3
	movrgez	%o7,	%g7,	%g5
	orncc	%l4,	0x194E,	%o4
	fmovrdgez	%i3,	%f20,	%f20
	orn	%l2,	0x1F07,	%o5
	ldsh	[%l7 + 0x34],	%l5
	xnorcc	%g1,	0x1D82,	%l0
	addcc	%i7,	%l3,	%l1
	sra	%i4,	0x0B,	%i6
	umulcc	%i2,	0x09EE,	%l6
	fmovsa	%xcc,	%f31,	%f3
	fmovsvs	%icc,	%f8,	%f14
	sub	%i1,	%o0,	%i5
	xnor	%o6,	%g3,	%g4
	movrlz	%o2,	0x301,	%g2
	fpsub16s	%f22,	%f6,	%f1
	nop
	set	0x32, %o3
	ldub	[%l7 + %o3],	%o1
	movl	%xcc,	%g6,	%i0
	ld	[%l7 + 0x2C],	%f18
	xnor	%o7,	%o3,	%g5
	fxnors	%f12,	%f28,	%f8
	edge16n	%l4,	%o4,	%i3
	ldsw	[%l7 + 0x50],	%l2
	std	%f26,	[%l7 + 0x30]
	fmul8x16au	%f2,	%f31,	%f8
	fmul8ulx16	%f0,	%f0,	%f28
	stx	%g7,	[%l7 + 0x20]
	edge32n	%o5,	%g1,	%l5
	udivx	%i7,	0x009E,	%l0
	orncc	%l3,	0x0E91,	%i4
	fandnot1s	%f0,	%f25,	%f2
	fmovs	%f14,	%f2
	movneg	%xcc,	%l1,	%i2
	srlx	%l6,	0x0E,	%i6
	sra	%o0,	0x00,	%i5
	andncc	%i1,	%g3,	%g4
	movneg	%xcc,	%o2,	%g2
	move	%icc,	%o1,	%g6
	add	%i0,	0x008C,	%o7
	edge8n	%o3,	%o6,	%l4
	movvs	%xcc,	%g5,	%i3
	lduw	[%l7 + 0x7C],	%o4
	addcc	%l2,	%o5,	%g7
	andn	%g1,	0x1E36,	%i7
	movpos	%icc,	%l0,	%l5
	movvc	%icc,	%l3,	%l1
	subc	%i2,	%i4,	%l6
	fpsub32	%f26,	%f26,	%f18
	nop
	set	0x0E, %g6
	ldsh	[%l7 + %g6],	%i6
	ldub	[%l7 + 0x54],	%o0
	std	%f22,	[%l7 + 0x60]
	edge32ln	%i1,	%i5,	%g3
	xnor	%o2,	0x1B1B,	%g2
	movle	%xcc,	%o1,	%g6
	sll	%i0,	%g4,	%o7
	movcc	%xcc,	%o3,	%o6
	fmovsleu	%icc,	%f3,	%f27
	sdiv	%g5,	0x1342,	%l4
	orn	%o4,	0x1CBF,	%l2
	srl	%i3,	%g7,	%g1
	movrlz	%i7,	%l0,	%l5
	stx	%o5,	[%l7 + 0x10]
	fmovsge	%icc,	%f15,	%f29
	movrgez	%l1,	%i2,	%l3
	fcmpgt32	%f16,	%f4,	%l6
	sllx	%i6,	%i4,	%i1
	or	%i5,	%g3,	%o0
	subc	%g2,	%o1,	%o2
	edge8	%i0,	%g6,	%g4
	mulx	%o3,	0x1315,	%o6
	fnand	%f28,	%f6,	%f28
	movvc	%icc,	%o7,	%g5
	srlx	%o4,	0x11,	%l2
	edge8ln	%l4,	%g7,	%g1
	ldsb	[%l7 + 0x20],	%i7
	sethi	0x08CC,	%i3
	sdivx	%l0,	0x00AA,	%o5
	ld	[%l7 + 0x20],	%f24
	sdiv	%l1,	0x1814,	%l5
	bshuffle	%f2,	%f24,	%f24
	fnot2s	%f24,	%f6
	ldd	[%l7 + 0x40],	%i2
	fsrc1s	%f9,	%f2
	stb	%l6,	[%l7 + 0x0C]
	fmovdle	%icc,	%f24,	%f11
	sdiv	%l3,	0x0BC8,	%i4
	umul	%i6,	0x1F53,	%i5
	xorcc	%g3,	%i1,	%g2
	movgu	%xcc,	%o0,	%o2
	addcc	%o1,	0x0B9C,	%g6
	edge16	%g4,	%o3,	%i0
	popc	0x1FE4,	%o7
	ldub	[%l7 + 0x62],	%g5
	fones	%f31
	umul	%o6,	0x1784,	%o4
	edge16	%l2,	%l4,	%g7
	stw	%i7,	[%l7 + 0x2C]
	orncc	%i3,	%l0,	%o5
	fmovsa	%xcc,	%f31,	%f3
	fnot2	%f24,	%f20
	edge16l	%g1,	%l1,	%i2
	and	%l6,	0x15E5,	%l3
	ldsb	[%l7 + 0x0E],	%i4
	orncc	%i6,	0x05B5,	%l5
	subcc	%g3,	0x0345,	%i1
	movre	%g2,	0x17E,	%o0
	xorcc	%i5,	%o1,	%o2
	lduh	[%l7 + 0x58],	%g6
	and	%g4,	0x0BD1,	%i0
	fmovdvc	%xcc,	%f21,	%f4
	fmovdne	%icc,	%f26,	%f10
	smulcc	%o7,	0x0A79,	%o3
	fcmpgt32	%f14,	%f2,	%g5
	ldx	[%l7 + 0x08],	%o6
	movg	%icc,	%o4,	%l2
	addc	%l4,	%i7,	%g7
	fmul8x16al	%f31,	%f14,	%f12
	fnot1	%f8,	%f10
	subcc	%i3,	%o5,	%g1
	fmuld8ulx16	%f18,	%f31,	%f12
	ldsh	[%l7 + 0x20],	%l0
	sdivcc	%l1,	0x19E2,	%l6
	edge8l	%l3,	%i4,	%i2
	sethi	0x10A1,	%l5
	stx	%i6,	[%l7 + 0x78]
	orn	%i1,	%g3,	%g2
	edge32ln	%i5,	%o1,	%o0
	sdivx	%g6,	0x0DC2,	%g4
	andn	%o2,	0x0378,	%i0
	stw	%o7,	[%l7 + 0x50]
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	srax	%g5,	0x19,	%l2
	stb	%l4,	[%l7 + 0x4E]
	movrne	%o4,	0x122,	%g7
	sdivx	%i7,	0x1B96,	%o5
	addc	%g1,	0x06CE,	%i3
	edge16l	%l0,	%l6,	%l1
	fmuld8ulx16	%f26,	%f4,	%f10
	movrgz	%l3,	%i2,	%l5
	fzero	%f30
	udiv	%i6,	0x1FD2,	%i1
	movcc	%icc,	%g3,	%i4
	movpos	%xcc,	%i5,	%g2
	ldsb	[%l7 + 0x3F],	%o1
	array32	%o0,	%g4,	%o2
	array8	%i0,	%g6,	%o7
	fcmpes	%fcc0,	%f15,	%f0
	array8	%o6,	%g5,	%o3
	fmovrslz	%l4,	%f0,	%f12
	orn	%l2,	%o4,	%g7
	ldd	[%l7 + 0x68],	%i6
	srlx	%o5,	0x15,	%i3
	fmovdvc	%icc,	%f17,	%f23
	fmovsge	%xcc,	%f11,	%f23
	edge16n	%g1,	%l6,	%l1
	fcmpes	%fcc3,	%f8,	%f9
	fmovdge	%icc,	%f30,	%f27
	sdivcc	%l0,	0x0205,	%l3
	popc	%l5,	%i2
	fcmpgt32	%f12,	%f16,	%i1
	movvs	%icc,	%i6,	%g3
	fmovrdlz	%i4,	%f0,	%f8
	smulcc	%g2,	0x18F2,	%i5
	fpsub16s	%f2,	%f8,	%f17
	sth	%o0,	[%l7 + 0x78]
	fxor	%f28,	%f18,	%f30
	fnands	%f28,	%f24,	%f26
	movgu	%xcc,	%o1,	%o2
	sra	%i0,	0x15,	%g6
	andcc	%g4,	%o6,	%g5
	fpsub32s	%f9,	%f10,	%f15
	fpadd32	%f26,	%f26,	%f8
	fmovda	%xcc,	%f27,	%f30
	orncc	%o7,	0x0ACB,	%l4
	srl	%l2,	0x18,	%o3
	fexpand	%f5,	%f8
	edge16n	%o4,	%g7,	%i7
	addc	%i3,	%g1,	%o5
	move	%icc,	%l6,	%l0
	fmovdn	%xcc,	%f24,	%f26
	restore %l1, 0x14EF, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i2,	%l5,	%i6
	siam	0x6
	stw	%g3,	[%l7 + 0x48]
	ldub	[%l7 + 0x4A],	%i4
	ldd	[%l7 + 0x08],	%f20
	xnor	%g2,	0x02E8,	%i5
	fmovdg	%icc,	%f13,	%f11
	addc	%o0,	0x0591,	%i1
	movge	%icc,	%o2,	%o1
	movcs	%xcc,	%g6,	%i0
	array32	%g4,	%g5,	%o6
	sdiv	%o7,	0x182D,	%l2
	st	%f3,	[%l7 + 0x60]
	edge32l	%o3,	%l4,	%g7
	umul	%o4,	0x0687,	%i3
	srlx	%g1,	%o5,	%i7
	movpos	%xcc,	%l6,	%l1
	fmovd	%f30,	%f2
	addccc	%l0,	0x0304,	%l3
	faligndata	%f6,	%f28,	%f24
	ld	[%l7 + 0x4C],	%f1
	movpos	%icc,	%i2,	%i6
	xnorcc	%g3,	%l5,	%g2
	ldd	[%l7 + 0x18],	%i4
	mova	%icc,	%o0,	%i1
	sll	%o2,	0x15,	%i4
	fmovsn	%xcc,	%f25,	%f6
	movle	%icc,	%g6,	%i0
	sub	%o1,	0x042C,	%g5
	ldd	[%l7 + 0x38],	%o6
	movgu	%icc,	%o7,	%l2
	movgu	%icc,	%g4,	%l4
	srl	%g7,	0x1A,	%o4
	movrlez	%i3,	0x079,	%o3
	mova	%xcc,	%o5,	%i7
	fmovscc	%icc,	%f18,	%f22
	sdivcc	%l6,	0x1E13,	%l1
	array16	%g1,	%l3,	%i2
	srax	%l0,	0x0F,	%g3
	xor	%l5,	0x1670,	%g2
	srlx	%i6,	0x1E,	%i5
	alignaddrl	%o0,	%o2,	%i4
	fpadd32	%f2,	%f12,	%f2
	sub	%g6,	0x1BCE,	%i0
	andcc	%i1,	%o1,	%g5
	orncc	%o6,	0x1BBC,	%l2
	stb	%g4,	[%l7 + 0x67]
	subcc	%o7,	%g7,	%o4
	sdiv	%l4,	0x0651,	%o3
	ldd	[%l7 + 0x60],	%o4
	srl	%i3,	%l6,	%i7
	subcc	%l1,	0x0DB2,	%l3
	for	%f10,	%f4,	%f30
	fmovdleu	%xcc,	%f31,	%f19
	edge8n	%g1,	%l0,	%i2
	fmul8sux16	%f30,	%f4,	%f4
	sub	%g3,	0x0F74,	%g2
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	std	%f10,	[%l7 + 0x30]
	fcmpgt32	%f12,	%f8,	%l5
	movl	%icc,	%i4,	%g6
	movl	%xcc,	%o2,	%i0
	fcmpeq32	%f10,	%f0,	%i1
	array8	%g5,	%o1,	%o6
	movneg	%icc,	%g4,	%l2
	stx	%g7,	[%l7 + 0x68]
	fxnors	%f6,	%f13,	%f31
	fcmpne16	%f24,	%f14,	%o7
	mova	%icc,	%o4,	%l4
	movg	%icc,	%o5,	%i3
	movrlez	%l6,	0x19F,	%o3
	smul	%i7,	%l1,	%l3
	sllx	%l0,	0x1B,	%i2
	fornot2s	%f19,	%f24,	%f10
	ldd	[%l7 + 0x58],	%g0
	movcs	%icc,	%g3,	%g2
	array16	%i5,	%o0,	%l5
	ldd	[%l7 + 0x68],	%f20
	fandnot1s	%f3,	%f26,	%f11
	fabsd	%f2,	%f14
	stx	%i6,	[%l7 + 0x68]
	sub	%g6,	0x08F4,	%o2
	or	%i0,	0x1415,	%i1
	sll	%i4,	0x00,	%g5
	udiv	%o1,	0x14D9,	%o6
	movrne	%g4,	%g7,	%o7
	or	%l2,	%o4,	%o5
	fmovdg	%icc,	%f16,	%f9
	array16	%i3,	%l6,	%l4
	ldd	[%l7 + 0x30],	%i6
	add	%l1,	%o3,	%l0
	fornot2	%f30,	%f24,	%f20
	edge16l	%l3,	%g1,	%g3
	mulscc	%g2,	0x176B,	%i5
	fnot2	%f18,	%f8
	ldd	[%l7 + 0x78],	%i2
	movleu	%icc,	%l5,	%o0
	sdivcc	%g6,	0x0E38,	%i6
	movcs	%xcc,	%i0,	%o2
	fmovrsne	%i4,	%f17,	%f13
	edge32ln	%i1,	%g5,	%o1
	fnegd	%f28,	%f24
	ldub	[%l7 + 0x0C],	%o6
	ldsb	[%l7 + 0x77],	%g4
	ld	[%l7 + 0x44],	%f25
	or	%o7,	0x0443,	%g7
	edge8l	%l2,	%o4,	%i3
	fmovdcc	%xcc,	%f28,	%f5
	fzeros	%f8
	edge8	%l6,	%l4,	%o5
	movvs	%icc,	%l1,	%i7
	array8	%l0,	%o3,	%g1
	edge8l	%g3,	%g2,	%i5
	alignaddr	%i2,	%l5,	%o0
	subc	%l3,	%g6,	%i6
	sra	%i0,	%o2,	%i4
	fornot1s	%f30,	%f11,	%f30
	edge32	%g5,	%i1,	%o1
	alignaddrl	%g4,	%o6,	%g7
	lduw	[%l7 + 0x24],	%o7
	array8	%o4,	%i3,	%l2
	udiv	%l6,	0x079C,	%l4
	array8	%l1,	%i7,	%l0
	movne	%icc,	%o5,	%g1
	fcmple16	%f0,	%f30,	%o3
	array16	%g2,	%i5,	%g3
	andcc	%l5,	0x1311,	%o0
	fpadd16s	%f12,	%f15,	%f25
	movrgez	%i2,	%l3,	%i6
	stw	%g6,	[%l7 + 0x1C]
	movrlez	%i0,	%o2,	%g5
	array32	%i1,	%i4,	%o1
	sll	%g4,	%g7,	%o6
	movre	%o7,	%i3,	%o4
	edge16l	%l2,	%l4,	%l1
	fcmpne32	%f2,	%f4,	%l6
	lduw	[%l7 + 0x1C],	%i7
	fxnor	%f26,	%f20,	%f12
	fpadd32s	%f8,	%f4,	%f3
	sllx	%o5,	0x16,	%g1
	movle	%xcc,	%o3,	%l0
	ldd	[%l7 + 0x28],	%f6
	fmovrsne	%i5,	%f11,	%f1
	orncc	%g2,	0x1DFD,	%l5
	edge32ln	%o0,	%i2,	%g3
	movpos	%icc,	%i6,	%g6
	lduh	[%l7 + 0x46],	%i0
	andcc	%o2,	%g5,	%i1
	movrgez	%l3,	0x016,	%o1
	movvs	%icc,	%i4,	%g4
	fexpand	%f19,	%f18
	alignaddrl	%g7,	%o7,	%i3
	movcc	%xcc,	%o4,	%o6
	edge8ln	%l2,	%l4,	%l6
	fnot2s	%f18,	%f8
	umul	%i7,	0x0603,	%l1
	fones	%f24
	fzeros	%f23
	srl	%o5,	%g1,	%o3
	edge16n	%i5,	%g2,	%l0
	edge32	%o0,	%l5,	%g3
	fmovdgu	%xcc,	%f27,	%f22
	movpos	%xcc,	%i2,	%i6
	sth	%i0,	[%l7 + 0x74]
	ldub	[%l7 + 0x16],	%g6
	lduh	[%l7 + 0x3C],	%o2
	srl	%i1,	%g5,	%o1
	udivx	%i4,	0x0E01,	%g4
	edge8l	%l3,	%o7,	%g7
	andn	%i3,	%o4,	%o6
	movcs	%xcc,	%l2,	%l4
	alignaddr	%i7,	%l1,	%l6
	fcmpne32	%f18,	%f28,	%o5
	ldsw	[%l7 + 0x50],	%g1
	udiv	%o3,	0x0523,	%i5
	srl	%g2,	%l0,	%l5
	xnorcc	%g3,	%o0,	%i6
	sra	%i0,	0x0A,	%i2
	movvs	%icc,	%o2,	%g6
	subccc	%i1,	%o1,	%i4
	ldx	[%l7 + 0x18],	%g5
	fnot2s	%f7,	%f19
	xor	%l3,	0x02C5,	%g4
	nop
	set	0x48, %i0
	ldub	[%l7 + %i0],	%o7
	fmovdneg	%xcc,	%f1,	%f30
	sra	%i3,	0x1B,	%o4
	subcc	%o6,	%g7,	%l4
	movgu	%xcc,	%i7,	%l1
	fmovsn	%xcc,	%f7,	%f30
	edge32n	%l2,	%o5,	%l6
	fmovdge	%icc,	%f8,	%f8
	addc	%o3,	0x0058,	%i5
	edge8l	%g1,	%g2,	%l0
	move	%icc,	%l5,	%o0
	srl	%i6,	%g3,	%i2
	srax	%o2,	0x02,	%g6
	stb	%i1,	[%l7 + 0x36]
	movrgez	%i0,	%o1,	%i4
	array32	%g5,	%l3,	%o7
	stx	%i3,	[%l7 + 0x08]
	array16	%g4,	%o6,	%g7
	fmovrsne	%l4,	%f23,	%f0
	edge32ln	%i7,	%l1,	%o4
	sdivx	%l2,	0x0D29,	%l6
	orn	%o3,	%o5,	%g1
	movrne	%i5,	%l0,	%l5
	orcc	%g2,	0x1F04,	%o0
	udivx	%g3,	0x0F3B,	%i6
	fcmpd	%fcc2,	%f28,	%f6
	sra	%i2,	%g6,	%i1
	edge32n	%o2,	%o1,	%i0
	ldx	[%l7 + 0x18],	%g5
	subcc	%l3,	0x17CF,	%i4
	st	%f4,	[%l7 + 0x0C]
	or	%o7,	%g4,	%o6
	ld	[%l7 + 0x6C],	%f15
	ldsw	[%l7 + 0x30],	%i3
	array8	%g7,	%l4,	%i7
	stx	%l1,	[%l7 + 0x20]
	stx	%l2,	[%l7 + 0x68]
	fandnot1s	%f29,	%f14,	%f30
	fnot1s	%f30,	%f18
	restore %o4, 0x1546, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsne	%o5,	%f5,	%f14
	edge32n	%g1,	%l6,	%l0
	fands	%f31,	%f0,	%f15
	stw	%l5,	[%l7 + 0x70]
	movpos	%xcc,	%i5,	%g2
	umulcc	%g3,	%i6,	%i2
	save %g6, %i1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x2A, %g1
	sth	%o1,	[%l7 + %g1]
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	fexpand	%f4,	%f22
	subcc	%i4,	%l3,	%g4
	srlx	%o7,	%i3,	%o6
	fcmpgt32	%f26,	%f2,	%l4
	fmovsl	%xcc,	%f29,	%f14
	sth	%g7,	[%l7 + 0x1E]
	fornot2	%f10,	%f14,	%f24
	movrgz	%i7,	%l1,	%l2
	mova	%xcc,	%o4,	%o5
	xorcc	%o3,	0x07AE,	%l6
	fcmpes	%fcc3,	%f1,	%f30
	fmovrsgz	%l0,	%f23,	%f15
	popc	0x1EC1,	%g1
	fcmpgt16	%f24,	%f24,	%l5
	movleu	%icc,	%i5,	%g2
	fmovda	%xcc,	%f23,	%f27
	fmovrsne	%i6,	%f2,	%f4
	edge32	%i2,	%g3,	%i1
	xor	%g6,	%o1,	%o0
	fnot2s	%f20,	%f21
	ld	[%l7 + 0x34],	%f17
	srax	%o2,	0x0D,	%g5
	edge32	%i0,	%i4,	%g4
	umulcc	%o7,	%i3,	%o6
	sll	%l4,	%l3,	%i7
	andn	%g7,	0x12B8,	%l1
	udivcc	%o4,	0x197C,	%o5
	movrgez	%o3,	%l2,	%l0
	edge32n	%g1,	%l5,	%i5
	sllx	%l6,	%g2,	%i2
	movgu	%xcc,	%g3,	%i1
	edge32l	%i6,	%o1,	%g6
	movle	%xcc,	%o0,	%g5
	ldsb	[%l7 + 0x7D],	%i0
	lduw	[%l7 + 0x70],	%o2
	save %i4, %o7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o6,	%i3,	%l3
	edge16ln	%l4,	%g7,	%l1
	fzeros	%f19
	umulcc	%o4,	%o5,	%o3
	subccc	%l2,	%l0,	%g1
	array16	%l5,	%i7,	%l6
	and	%g2,	%i5,	%g3
	popc	0x198A,	%i2
	fones	%f22
	sra	%i6,	0x15,	%o1
	ldsb	[%l7 + 0x47],	%g6
	movrgez	%i1,	%o0,	%i0
	udivcc	%o2,	0x1797,	%i4
	array16	%g5,	%g4,	%o6
	movrne	%i3,	0x381,	%o7
	udiv	%l3,	0x01A8,	%g7
	fors	%f12,	%f15,	%f24
	addc	%l1,	%o4,	%l4
	fcmpeq16	%f26,	%f8,	%o3
	sll	%l2,	0x07,	%l0
	sethi	0x0556,	%o5
	sub	%g1,	%i7,	%l6
	movle	%icc,	%l5,	%i5
	movrlz	%g2,	%i2,	%i6
	fexpand	%f31,	%f4
	fmovdg	%xcc,	%f31,	%f1
	edge32	%g3,	%o1,	%g6
	move	%xcc,	%i1,	%i0
	sdivcc	%o0,	0x1BD1,	%i4
	ldub	[%l7 + 0x7B],	%g5
	movl	%icc,	%g4,	%o2
	movrne	%o6,	%i3,	%l3
	ldub	[%l7 + 0x4F],	%g7
	movne	%icc,	%l1,	%o7
	stb	%o4,	[%l7 + 0x77]
	fpadd32s	%f3,	%f0,	%f28
	sethi	0x1845,	%l4
	orncc	%l2,	0x12C0,	%l0
	udivcc	%o3,	0x1EEC,	%o5
	movne	%icc,	%i7,	%l6
	movpos	%xcc,	%g1,	%l5
	fnor	%f2,	%f18,	%f12
	movrne	%g2,	0x035,	%i2
	srax	%i6,	%g3,	%i5
	fxor	%f20,	%f22,	%f16
	fcmple16	%f30,	%f8,	%o1
	movvs	%icc,	%i1,	%i0
	fandnot1s	%f16,	%f19,	%f19
	movle	%xcc,	%g6,	%i4
	lduw	[%l7 + 0x08],	%g5
	movcs	%icc,	%g4,	%o2
	fmovrdlez	%o6,	%f18,	%f4
	ldd	[%l7 + 0x28],	%f24
	lduh	[%l7 + 0x56],	%o0
	ldsw	[%l7 + 0x10],	%l3
	edge8n	%g7,	%i3,	%o7
	smul	%l1,	%l4,	%l2
	addcc	%l0,	%o4,	%o5
	sll	%i7,	%o3,	%l6
	subcc	%l5,	0x19B7,	%g1
	movl	%icc,	%g2,	%i6
	or	%g3,	0x15A2,	%i2
	fabss	%f2,	%f28
	fcmple32	%f20,	%f20,	%o1
	fcmps	%fcc0,	%f31,	%f21
	alignaddrl	%i1,	%i0,	%g6
	st	%f17,	[%l7 + 0x28]
	movge	%xcc,	%i5,	%i4
	andn	%g5,	0x1114,	%g4
	movrgz	%o2,	0x236,	%o0
	orncc	%o6,	0x1C72,	%l3
	orcc	%g7,	0x1E53,	%o7
	fsrc1	%f22,	%f28
	subcc	%i3,	0x1999,	%l1
	udivx	%l4,	0x01A6,	%l0
	edge16n	%l2,	%o4,	%i7
	srl	%o3,	%l6,	%l5
	movcc	%xcc,	%o5,	%g1
	mova	%icc,	%g2,	%i6
	sub	%g3,	%i2,	%o1
	restore %i1, 0x11F8, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g6,	0x13D3,	%i4
	addcc	%i5,	%g5,	%g4
	fmovsneg	%xcc,	%f7,	%f19
	move	%icc,	%o0,	%o2
	xnor	%l3,	%o6,	%o7
	edge8l	%g7,	%i3,	%l1
	edge32n	%l4,	%l2,	%o4
	ldsb	[%l7 + 0x4F],	%l0
	movpos	%icc,	%o3,	%l6
	mova	%xcc,	%l5,	%i7
	edge16ln	%o5,	%g1,	%g2
	edge8ln	%i6,	%g3,	%i2
	sethi	0x1939,	%i1
	addcc	%i0,	%o1,	%i4
	alignaddrl	%g6,	%g5,	%i5
	movrlz	%g4,	%o2,	%o0
	movne	%xcc,	%o6,	%l3
	fsrc1s	%f29,	%f5
	movleu	%xcc,	%o7,	%i3
	ldd	[%l7 + 0x58],	%g6
	fornot1	%f28,	%f6,	%f26
	movgu	%xcc,	%l1,	%l4
	orn	%o4,	%l2,	%l0
	edge16	%o3,	%l6,	%l5
	edge16l	%i7,	%g1,	%o5
	movg	%xcc,	%g2,	%g3
	save %i2, %i6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i1,	%i4,	%g6
	edge32ln	%g5,	%i5,	%g4
	movrgz	%o1,	%o0,	%o6
	umulcc	%o2,	%o7,	%l3
	or	%i3,	0x1F1F,	%g7
	add	%l4,	0x103E,	%o4
	fmovdn	%xcc,	%f19,	%f27
	fmovdge	%xcc,	%f16,	%f12
	movrlz	%l1,	0x2DB,	%l0
	movneg	%xcc,	%o3,	%l2
	fmovdneg	%icc,	%f25,	%f26
	for	%f0,	%f10,	%f10
	udivx	%l6,	0x04F0,	%l5
	ldsh	[%l7 + 0x68],	%g1
	nop
	set	0x7B, %l3
	ldub	[%l7 + %l3],	%i7
	fmul8x16au	%f7,	%f4,	%f12
	std	%f18,	[%l7 + 0x18]
	movcs	%icc,	%o5,	%g3
	array32	%i2,	%g2,	%i0
	array8	%i6,	%i4,	%i1
	std	%f16,	[%l7 + 0x78]
	fmovspos	%icc,	%f5,	%f21
	fmovrsne	%g6,	%f19,	%f29
	sll	%g5,	%i5,	%o1
	ldx	[%l7 + 0x70],	%g4
	movg	%icc,	%o0,	%o2
	xnor	%o7,	%o6,	%l3
	addc	%i3,	0x0E16,	%g7
	xnorcc	%l4,	0x1483,	%l1
	fornot1s	%f0,	%f1,	%f5
	fmovdgu	%xcc,	%f25,	%f22
	subcc	%o4,	%o3,	%l0
	subccc	%l2,	%l5,	%g1
	edge8ln	%i7,	%o5,	%l6
	xor	%i2,	%g3,	%g2
	fandnot1	%f6,	%f18,	%f2
	nop
	set	0x62, %o1
	ldsb	[%l7 + %o1],	%i0
	stx	%i6,	[%l7 + 0x78]
	fpadd32	%f6,	%f24,	%f8
	fnegd	%f6,	%f6
	array16	%i4,	%i1,	%g5
	edge16ln	%i5,	%o1,	%g4
	ldx	[%l7 + 0x58],	%g6
	fnot2s	%f17,	%f29
	movgu	%icc,	%o0,	%o2
	alignaddr	%o7,	%l3,	%i3
	sra	%g7,	0x14,	%l4
	movrlez	%l1,	0x326,	%o4
	sllx	%o6,	0x0B,	%o3
	fandnot2	%f0,	%f14,	%f30
	mulscc	%l2,	%l0,	%g1
	edge32ln	%l5,	%i7,	%o5
	fmovdvs	%icc,	%f5,	%f14
	edge16l	%i2,	%g3,	%g2
	ldsh	[%l7 + 0x48],	%i0
	movleu	%xcc,	%i6,	%l6
	array8	%i4,	%i1,	%g5
	umulcc	%i5,	%o1,	%g4
	xnorcc	%g6,	%o0,	%o2
	movcs	%xcc,	%o7,	%l3
	sethi	0x1F44,	%i3
	fxnors	%f9,	%f4,	%f30
	fnot2s	%f29,	%f7
	movn	%icc,	%g7,	%l1
	fmovsleu	%xcc,	%f3,	%f30
	movvs	%xcc,	%l4,	%o4
	add	%o6,	%o3,	%l0
	array32	%l2,	%g1,	%l5
	fcmple16	%f18,	%f22,	%i7
	fmovsgu	%icc,	%f7,	%f11
	andncc	%i2,	%g3,	%g2
	orcc	%i0,	0x1403,	%i6
	smul	%o5,	0x0B06,	%l6
	ld	[%l7 + 0x10],	%f20
	sth	%i1,	[%l7 + 0x56]
	edge32l	%i4,	%g5,	%i5
	lduw	[%l7 + 0x50],	%g4
	udivcc	%g6,	0x184C,	%o0
	fxors	%f18,	%f1,	%f29
	movne	%xcc,	%o1,	%o7
	fnot1	%f6,	%f2
	umulcc	%l3,	0x066F,	%o2
	fmovrdlez	%g7,	%f10,	%f30
	popc	%i3,	%l1
	movrlez	%o4,	%l4,	%o3
	movneg	%icc,	%l0,	%l2
	save %o6, 0x001F, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i7,	%g1,	%i2
	orncc	%g2,	0x0D6E,	%i0
	add	%i6,	0x0317,	%o5
	ldsb	[%l7 + 0x4E],	%l6
	mulx	%i1,	0x10B4,	%i4
	fmovsge	%icc,	%f28,	%f29
	fxors	%f20,	%f29,	%f1
	andncc	%g3,	%g5,	%g4
	array32	%g6,	%o0,	%o1
	fors	%f16,	%f5,	%f3
	edge16l	%o7,	%l3,	%o2
	movrgez	%i5,	0x0E1,	%g7
	ldsb	[%l7 + 0x38],	%l1
	sllx	%o4,	0x1C,	%l4
	andncc	%o3,	%l0,	%l2
	ldsw	[%l7 + 0x34],	%o6
	mova	%icc,	%l5,	%i7
	fcmps	%fcc3,	%f14,	%f15
	movrlz	%i3,	%g1,	%g2
	xorcc	%i0,	0x1595,	%i6
	srl	%o5,	0x09,	%i2
	movvs	%xcc,	%i1,	%l6
	stw	%i4,	[%l7 + 0x28]
	nop
	set	0x0C, %g5
	lduh	[%l7 + %g5],	%g5
	sir	0x1B05
	edge32	%g3,	%g4,	%o0
	sll	%o1,	%g6,	%o7
	ldsb	[%l7 + 0x2F],	%l3
	fmuld8sux16	%f18,	%f12,	%f28
	andncc	%o2,	%i5,	%g7
	fmovsge	%xcc,	%f1,	%f7
	sra	%o4,	%l4,	%o3
	edge16l	%l0,	%l1,	%l2
	orncc	%o6,	%i7,	%i3
	edge16	%l5,	%g2,	%g1
	movvs	%xcc,	%i6,	%o5
	fmovdn	%icc,	%f14,	%f18
	fmovdcc	%xcc,	%f22,	%f0
	ldsw	[%l7 + 0x7C],	%i0
	bshuffle	%f8,	%f8,	%f22
	smulcc	%i2,	0x1334,	%i1
	andncc	%l6,	%i4,	%g3
	subc	%g5,	0x0AD1,	%g4
	edge8ln	%o1,	%g6,	%o0
	edge16ln	%o7,	%o2,	%i5
	fpsub32	%f6,	%f28,	%f30
	sdivcc	%l3,	0x1CF5,	%g7
	array16	%o4,	%o3,	%l0
	subc	%l1,	%l4,	%o6
	sir	0x0ED2
	ldsh	[%l7 + 0x72],	%i7
	fmovrslez	%i3,	%f8,	%f20
	srl	%l2,	%g2,	%g1
	edge16n	%l5,	%o5,	%i6
	fmul8x16al	%f22,	%f17,	%f28
	fcmpes	%fcc1,	%f29,	%f7
	mova	%xcc,	%i0,	%i1
	movcs	%xcc,	%i2,	%l6
	umul	%g3,	%i4,	%g4
	ldsw	[%l7 + 0x58],	%o1
	movge	%icc,	%g5,	%g6
	alignaddrl	%o0,	%o2,	%o7
	edge16l	%i5,	%g7,	%l3
	edge32l	%o3,	%o4,	%l0
	movl	%icc,	%l1,	%l4
	array8	%i7,	%i3,	%o6
	sdivx	%l2,	0x06ED,	%g1
	fmovsge	%xcc,	%f2,	%f11
	sra	%l5,	0x0F,	%o5
	movrgz	%i6,	0x246,	%g2
	mova	%xcc,	%i1,	%i2
	sdivcc	%l6,	0x0B53,	%g3
	mulx	%i4,	0x0BE0,	%i0
	edge32ln	%o1,	%g4,	%g5
	orncc	%o0,	0x019E,	%g6
	movle	%xcc,	%o2,	%o7
	fmovsne	%icc,	%f7,	%f9
	movgu	%icc,	%g7,	%l3
	mova	%xcc,	%o3,	%i5
	xor	%o4,	%l0,	%l4
	fmovsgu	%xcc,	%f18,	%f27
	edge16n	%i7,	%i3,	%l1
	xor	%l2,	%g1,	%o6
	smulcc	%o5,	0x13C8,	%i6
	movleu	%xcc,	%l5,	%g2
	or	%i1,	0x0BD1,	%i2
	mova	%xcc,	%l6,	%g3
	sub	%i0,	0x0C66,	%i4
	st	%f2,	[%l7 + 0x44]
	alignaddr	%o1,	%g5,	%g4
	edge8ln	%g6,	%o2,	%o0
	addccc	%o7,	%g7,	%l3
	fcmple32	%f30,	%f14,	%o3
	edge32	%o4,	%i5,	%l0
	move	%xcc,	%l4,	%i3
	udivcc	%i7,	0x1F43,	%l1
	fsrc2	%f20,	%f12
	movcc	%xcc,	%l2,	%o6
	fmovdpos	%icc,	%f0,	%f14
	fnot2	%f28,	%f26
	andn	%o5,	0x0B6A,	%g1
	sir	0x0CA0
	sub	%l5,	%g2,	%i1
	fone	%f12
	sdivx	%i2,	0x0215,	%i6
	sth	%l6,	[%l7 + 0x0A]
	subcc	%g3,	%i0,	%i4
	alignaddrl	%o1,	%g5,	%g4
	ldx	[%l7 + 0x50],	%g6
	sir	0x1D88
	mulscc	%o0,	%o7,	%o2
	stb	%g7,	[%l7 + 0x52]
	edge16n	%l3,	%o3,	%i5
	fmovda	%xcc,	%f11,	%f14
	ldx	[%l7 + 0x60],	%l0
	movneg	%xcc,	%l4,	%o4
	xnorcc	%i7,	%i3,	%l1
	sth	%l2,	[%l7 + 0x08]
	edge16l	%o6,	%g1,	%l5
	ldd	[%l7 + 0x08],	%g2
	nop
	set	0x12, %l6
	lduh	[%l7 + %l6],	%o5
	edge16n	%i2,	%i6,	%l6
	movvc	%xcc,	%i1,	%i0
	movneg	%xcc,	%i4,	%o1
	lduw	[%l7 + 0x30],	%g3
	movne	%icc,	%g4,	%g6
	fxnors	%f2,	%f12,	%f18
	nop
	set	0x1A, %o7
	sth	%o0,	[%l7 + %o7]
	movgu	%icc,	%o7,	%g5
	sllx	%o2,	%g7,	%o3
	mova	%icc,	%l3,	%l0
	stw	%l4,	[%l7 + 0x50]
	sdivx	%o4,	0x0368,	%i7
	edge16l	%i5,	%l1,	%l2
	edge32	%i3,	%o6,	%g1
	edge8	%g2,	%o5,	%i2
	nop
	set	0x10, %g3
	ldsw	[%l7 + %g3],	%l5
	fandnot2s	%f19,	%f9,	%f23
	fpadd16s	%f22,	%f23,	%f3
	edge32ln	%l6,	%i1,	%i0
	movrgez	%i4,	0x052,	%o1
	fpsub16	%f18,	%f20,	%f14
	ldd	[%l7 + 0x08],	%f0
	std	%f16,	[%l7 + 0x48]
	bshuffle	%f16,	%f20,	%f4
	fornot1s	%f7,	%f18,	%f14
	array32	%i6,	%g4,	%g3
	fpsub16	%f2,	%f6,	%f30
	edge8ln	%o0,	%g6,	%o7
	xnor	%o2,	0x08E5,	%g5
	ldsh	[%l7 + 0x30],	%g7
	fmovscc	%xcc,	%f4,	%f5
	movrlez	%o3,	%l3,	%l0
	ldd	[%l7 + 0x70],	%f20
	ldsb	[%l7 + 0x76],	%l4
	ldd	[%l7 + 0x28],	%o4
	save %i5, %l1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i7,	0x0D98,	%i3
	edge16ln	%g1,	%g2,	%o6
	fand	%f14,	%f16,	%f20
	xor	%o5,	0x1AC8,	%l5
	save %l6, 0x1F5D, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f24,	%f20,	%f30
	sdivcc	%i0,	0x1B2D,	%i4
	st	%f29,	[%l7 + 0x40]
	or	%i2,	0x1F86,	%o1
	ldd	[%l7 + 0x40],	%f2
	ldd	[%l7 + 0x40],	%f4
	andcc	%g4,	%i6,	%g3
	ldsw	[%l7 + 0x08],	%g6
	edge32	%o0,	%o7,	%g5
	udivcc	%o2,	0x1ADE,	%g7
	fsrc2	%f12,	%f10
	subccc	%o3,	0x18F0,	%l0
	sethi	0x12BD,	%l4
	lduh	[%l7 + 0x2E],	%o4
	edge32	%l3,	%l1,	%i5
	andncc	%l2,	%i7,	%g1
	mulx	%i3,	0x0403,	%g2
	movne	%icc,	%o6,	%o5
	movgu	%icc,	%l5,	%l6
	mulx	%i1,	%i0,	%i2
	lduw	[%l7 + 0x74],	%o1
	or	%i4,	0x10D8,	%g4
	lduw	[%l7 + 0x44],	%g3
	ldub	[%l7 + 0x3E],	%g6
	orcc	%i6,	0x1385,	%o7
	smulcc	%g5,	0x1562,	%o2
	sth	%o0,	[%l7 + 0x08]
	movpos	%xcc,	%o3,	%l0
	array16	%l4,	%o4,	%l3
	movg	%icc,	%g7,	%i5
	ld	[%l7 + 0x10],	%f12
	sdiv	%l1,	0x095D,	%i7
	movpos	%icc,	%l2,	%g1
	alignaddrl	%i3,	%g2,	%o6
	sth	%l5,	[%l7 + 0x7E]
	fcmped	%fcc0,	%f2,	%f0
	fmovsge	%xcc,	%f22,	%f21
	fpack16	%f24,	%f13
	edge8n	%o5,	%i1,	%i0
	smul	%l6,	%i2,	%i4
	mulscc	%o1,	%g4,	%g6
	nop
	set	0x5A, %i2
	ldsb	[%l7 + %i2],	%g3
	addcc	%i6,	%g5,	%o2
	movrne	%o7,	%o0,	%l0
	udivx	%o3,	0x1BBF,	%l4
	fmovsle	%xcc,	%f3,	%f22
	fpsub16	%f30,	%f22,	%f24
	mova	%icc,	%o4,	%l3
	ldsb	[%l7 + 0x58],	%i5
	ldsw	[%l7 + 0x54],	%g7
	andcc	%l1,	0x00A3,	%i7
	udiv	%l2,	0x0E66,	%g1
	fmovsg	%icc,	%f16,	%f24
	add	%g2,	0x1C3B,	%i3
	subcc	%l5,	0x1A37,	%o6
	sdivx	%i1,	0x14F7,	%i0
	movgu	%icc,	%o5,	%i2
	array8	%l6,	%i4,	%o1
	xorcc	%g6,	%g3,	%g4
	stx	%g5,	[%l7 + 0x10]
	ldsb	[%l7 + 0x42],	%i6
	fzeros	%f3
	fcmps	%fcc0,	%f5,	%f31
	edge16	%o2,	%o7,	%o0
	movvc	%icc,	%l0,	%l4
	xor	%o4,	0x0DAA,	%l3
	orcc	%i5,	%o3,	%l1
	movne	%xcc,	%i7,	%g7
	fcmped	%fcc1,	%f4,	%f30
	movrlez	%g1,	0x1EE,	%l2
	edge8ln	%i3,	%l5,	%g2
	edge32ln	%i1,	%i0,	%o6
	array8	%i2,	%o5,	%i4
	st	%f6,	[%l7 + 0x2C]
	fmovrdlez	%o1,	%f24,	%f18
	edge16	%l6,	%g6,	%g4
	fornot1	%f18,	%f26,	%f20
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	addcc	%o2,	0x1F5B,	%i6
	and	%o7,	%o0,	%l0
	edge32ln	%o4,	%l3,	%l4
	movg	%icc,	%i5,	%o3
	addcc	%l1,	%g7,	%g1
	siam	0x6
	ldd	[%l7 + 0x68],	%f2
	fxors	%f5,	%f13,	%f10
	nop
	set	0x6C, %g2
	lduh	[%l7 + %g2],	%i7
	sir	0x165D
	movl	%icc,	%i3,	%l5
	edge32ln	%g2,	%l2,	%i0
	fnegd	%f30,	%f24
	andcc	%i1,	%o6,	%o5
	ldsh	[%l7 + 0x52],	%i4
	fornot2s	%f25,	%f3,	%f12
	srlx	%i2,	%o1,	%g6
	ldsw	[%l7 + 0x24],	%l6
	array16	%g3,	%g5,	%o2
	movvc	%icc,	%i6,	%o7
	stb	%g4,	[%l7 + 0x2B]
	andcc	%o0,	%o4,	%l3
	fcmpeq16	%f18,	%f20,	%l4
	edge16ln	%l0,	%i5,	%l1
	edge8ln	%o3,	%g7,	%g1
	addccc	%i7,	%l5,	%i3
	xnorcc	%g2,	0x1152,	%l2
	movvc	%xcc,	%i1,	%o6
	movcs	%xcc,	%i0,	%o5
	edge16l	%i4,	%i2,	%g6
	addc	%l6,	%g3,	%g5
	orncc	%o1,	0x1048,	%i6
	popc	%o2,	%g4
	sdivcc	%o0,	0x0A11,	%o4
	movrgz	%o7,	0x068,	%l3
	addc	%l4,	0x0491,	%l0
	save %l1, 0x0192, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g7,	%g1,	%i7
	fnot1s	%f24,	%f31
	fcmpgt16	%f22,	%f20,	%l5
	udivx	%i3,	0x0971,	%g2
	lduh	[%l7 + 0x5E],	%l2
	fmovde	%xcc,	%f1,	%f18
	fmuld8sux16	%f3,	%f26,	%f4
	ldsb	[%l7 + 0x61],	%i1
	array32	%i5,	%i0,	%o6
	edge16	%o5,	%i2,	%i4
	edge32ln	%g6,	%l6,	%g3
	edge8l	%o1,	%i6,	%o2
	restore %g5, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%o7,	%o4,	%l4
	edge32ln	%l3,	%l1,	%o3
	siam	0x4
	edge16	%l0,	%g1,	%i7
	addcc	%g7,	%i3,	%g2
	fcmpes	%fcc2,	%f17,	%f20
	movneg	%xcc,	%l2,	%i1
	add	%l5,	%i0,	%o6
	andncc	%o5,	%i2,	%i5
	lduw	[%l7 + 0x18],	%i4
	edge32l	%g6,	%g3,	%l6
	edge8ln	%i6,	%o2,	%o1
	save %g4, %o0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%g5,	%f25,	%f17
	ldd	[%l7 + 0x10],	%o4
	movne	%xcc,	%l4,	%l3
	sra	%o3,	%l0,	%l1
	movrlz	%i7,	0x0CE,	%g7
	ldsb	[%l7 + 0x75],	%i3
	udivcc	%g2,	0x13EA,	%l2
	alignaddrl	%i1,	%g1,	%i0
	addccc	%l5,	0x12C5,	%o5
	movge	%xcc,	%i2,	%i5
	edge32	%o6,	%i4,	%g6
	sllx	%g3,	%i6,	%l6
	subcc	%o2,	0x143A,	%g4
	popc	0x0BF7,	%o0
	fmovdle	%xcc,	%f10,	%f10
	addc	%o1,	%o7,	%o4
	movpos	%icc,	%g5,	%l3
	fcmps	%fcc1,	%f16,	%f11
	fmovdl	%xcc,	%f15,	%f26
	umulcc	%l4,	0x1657,	%o3
	fcmpgt32	%f8,	%f24,	%l1
	movre	%i7,	%l0,	%i3
	fzeros	%f8
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	array8	%g2,	%i1,	%g1
	ld	[%l7 + 0x4C],	%f13
	movl	%icc,	%i0,	%l5
	fnot1	%f18,	%f20
	sir	0x1465
	movrgez	%i2,	%i5,	%o6
	array8	%o5,	%g6,	%g3
	edge32ln	%i4,	%i6,	%l6
	fmovsgu	%icc,	%f1,	%f25
	fornot1s	%f26,	%f22,	%f6
	ldsh	[%l7 + 0x66],	%g4
	orcc	%o0,	%o2,	%o1
	umulcc	%o7,	0x0E87,	%g5
	lduw	[%l7 + 0x3C],	%o4
	edge32l	%l3,	%o3,	%l4
	fmovscc	%icc,	%f20,	%f5
	xnor	%l1,	%i7,	%i3
	edge32n	%l0,	%g7,	%g2
	st	%f28,	[%l7 + 0x74]
	alignaddrl	%i1,	%l2,	%i0
	mulx	%l5,	%i2,	%g1
	array16	%i5,	%o5,	%g6
	stw	%o6,	[%l7 + 0x60]
	fabss	%f5,	%f3
	movrgz	%g3,	%i6,	%l6
	ldd	[%l7 + 0x40],	%f16
	fpsub16	%f26,	%f4,	%f26
	movcc	%icc,	%i4,	%o0
	srlx	%o2,	%g4,	%o7
	sdiv	%g5,	0x12DA,	%o4
	sir	0x1C76
	fmovdpos	%icc,	%f20,	%f21
	alignaddrl	%o1,	%o3,	%l3
	movcc	%xcc,	%l4,	%l1
	fmuld8ulx16	%f0,	%f19,	%f30
	fmovscs	%icc,	%f30,	%f14
	fmovsn	%icc,	%f3,	%f25
	alignaddrl	%i3,	%i7,	%l0
	or	%g7,	0x1FCF,	%g2
	mulx	%l2,	%i0,	%l5
	edge32ln	%i1,	%g1,	%i2
	edge32ln	%o5,	%g6,	%i5
	fone	%f12
	addc	%o6,	0x1FCB,	%g3
	move	%xcc,	%l6,	%i6
	fzero	%f6
	fnand	%f4,	%f10,	%f14
	fmovda	%xcc,	%f10,	%f7
	movrne	%i4,	0x085,	%o0
	or	%o2,	0x0C92,	%o7
	fnot2s	%f23,	%f29
	fnand	%f18,	%f16,	%f0
	fpadd16	%f24,	%f20,	%f2
	sdivx	%g5,	0x1C68,	%o4
	edge32n	%o1,	%o3,	%l3
	edge32	%g4,	%l4,	%l1
	edge16	%i7,	%l0,	%i3
	udivcc	%g7,	0x0E3C,	%l2
	srl	%g2,	%l5,	%i1
	ldsw	[%l7 + 0x38],	%g1
	fmovsleu	%icc,	%f18,	%f4
	array8	%i0,	%o5,	%i2
	nop
	set	0x7C, %l4
	ldsh	[%l7 + %l4],	%i5
	stx	%o6,	[%l7 + 0x18]
	movrne	%g3,	%g6,	%l6
	addccc	%i6,	%o0,	%i4
	fpack16	%f24,	%f23
	nop
	set	0x1C, %o6
	ldsh	[%l7 + %o6],	%o7
	fzeros	%f23
	udiv	%g5,	0x0870,	%o2
	fsrc2s	%f4,	%f3
	fandnot2	%f10,	%f24,	%f26
	fmovs	%f5,	%f3
	movn	%icc,	%o1,	%o4
	for	%f18,	%f8,	%f8
	movleu	%xcc,	%o3,	%g4
	sir	0x1B8B
	srlx	%l4,	%l1,	%l3
	fornot2	%f0,	%f30,	%f22
	movg	%xcc,	%l0,	%i7
	sub	%i3,	0x1967,	%l2
	edge8n	%g7,	%g2,	%i1
	fpsub16s	%f28,	%f20,	%f26
	fsrc2s	%f7,	%f19
	sth	%g1,	[%l7 + 0x5A]
	movge	%icc,	%l5,	%i0
	fmovscs	%xcc,	%f3,	%f26
	fzeros	%f28
	fmovdge	%icc,	%f27,	%f18
	edge32ln	%i2,	%o5,	%o6
	popc	0x137E,	%i5
	fmovdne	%icc,	%f22,	%f24
	andn	%g6,	0x09B3,	%l6
	alignaddrl	%i6,	%o0,	%i4
	ldsb	[%l7 + 0x16],	%g3
	array32	%g5,	%o7,	%o1
	ldsw	[%l7 + 0x08],	%o2
	sll	%o3,	%g4,	%o4
	movcs	%icc,	%l1,	%l4
	fmovsn	%icc,	%f7,	%f25
	fmovsge	%xcc,	%f14,	%f21
	fmuld8ulx16	%f9,	%f29,	%f30
	ldsh	[%l7 + 0x4C],	%l3
	fornot1s	%f6,	%f2,	%f30
	ldsb	[%l7 + 0x1C],	%i7
	xor	%i3,	%l0,	%g7
	edge16ln	%l2,	%g2,	%g1
	fandnot1	%f22,	%f30,	%f22
	restore %i1, %i0, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8sux16	%f12,	%f16,	%f30
	edge16	%i2,	%o6,	%o5
	array32	%i5,	%l6,	%g6
	lduh	[%l7 + 0x66],	%i6
	sdivcc	%o0,	0x0F36,	%g3
	save %i4, %o7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o2,	%o1,	%o3
	sdivx	%o4,	0x1EFC,	%l1
	alignaddr	%l4,	%g4,	%i7
	movl	%xcc,	%l3,	%l0
	movleu	%xcc,	%i3,	%l2
	movrne	%g7,	0x22F,	%g1
	edge8ln	%i1,	%i0,	%g2
	add	%l5,	%o6,	%o5
	sra	%i2,	%l6,	%i5
	mova	%icc,	%i6,	%o0
	udiv	%g3,	0x0969,	%g6
	ldd	[%l7 + 0x28],	%f14
	stw	%i4,	[%l7 + 0x48]
	movne	%xcc,	%g5,	%o2
	fmovsgu	%icc,	%f20,	%f24
	udivx	%o1,	0x09E8,	%o7
	fmuld8sux16	%f6,	%f8,	%f12
	subc	%o3,	0x1C9B,	%l1
	fcmps	%fcc1,	%f7,	%f26
	movrne	%l4,	%g4,	%o4
	udivx	%l3,	0x1591,	%i7
	fcmpd	%fcc1,	%f30,	%f30
	array8	%l0,	%l2,	%i3
	popc	%g1,	%i1
	movrne	%i0,	0x36F,	%g2
	fandnot2	%f26,	%f20,	%f12
	movl	%xcc,	%g7,	%l5
	movre	%o5,	%o6,	%i2
	subcc	%i5,	0x0635,	%l6
	edge16	%i6,	%o0,	%g3
	umul	%g6,	%i4,	%o2
	lduw	[%l7 + 0x10],	%o1
	movn	%icc,	%g5,	%o3
	movpos	%icc,	%l1,	%l4
	subcc	%o7,	0x013A,	%g4
	subc	%l3,	%i7,	%l0
	mova	%icc,	%o4,	%l2
	fmovdvc	%icc,	%f0,	%f21
	edge32n	%i3,	%g1,	%i1
	fmuld8ulx16	%f17,	%f19,	%f30
	movleu	%xcc,	%i0,	%g2
	srlx	%l5,	%g7,	%o5
	move	%xcc,	%i2,	%i5
	st	%f2,	[%l7 + 0x3C]
	fmovsle	%icc,	%f5,	%f24
	fands	%f15,	%f28,	%f30
	sethi	0x0FC1,	%l6
	andcc	%o6,	%i6,	%g3
	fmul8x16al	%f29,	%f25,	%f24
	udivx	%g6,	0x18FE,	%i4
	orn	%o2,	0x0F3F,	%o1
	mulscc	%g5,	%o0,	%l1
	mulx	%l4,	%o3,	%o7
	edge8	%l3,	%i7,	%l0
	fpadd16s	%f20,	%f0,	%f12
	movne	%icc,	%g4,	%o4
	fmovrsgez	%l2,	%f23,	%f16
	move	%icc,	%i3,	%i1
	lduw	[%l7 + 0x14],	%g1
	edge16ln	%i0,	%l5,	%g2
	smulcc	%g7,	%i2,	%i5
	fcmpes	%fcc3,	%f1,	%f5
	sllx	%o5,	0x1C,	%l6
	subcc	%o6,	0x0EE4,	%i6
	movleu	%icc,	%g3,	%g6
	fmovdleu	%xcc,	%f19,	%f29
	mulscc	%i4,	%o2,	%o1
	movleu	%xcc,	%g5,	%o0
	stb	%l1,	[%l7 + 0x7C]
	or	%l4,	%o7,	%l3
	nop
	set	0x29, %l0
	ldub	[%l7 + %l0],	%i7
	edge16	%o3,	%l0,	%o4
	lduw	[%l7 + 0x14],	%l2
	or	%g4,	%i3,	%g1
	save %i0, %l5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i1,	0x0C5F,	%i2
	edge8l	%g7,	%i5,	%o5
	sdivcc	%o6,	0x1E1F,	%i6
	sll	%l6,	0x0C,	%g6
	umul	%g3,	%i4,	%o1
	edge8ln	%o2,	%g5,	%l1
	fands	%f23,	%f14,	%f6
	edge16l	%l4,	%o0,	%l3
	edge8	%i7,	%o3,	%o7
	ldsh	[%l7 + 0x24],	%l0
	subcc	%o4,	0x0291,	%g4
	movvc	%xcc,	%i3,	%g1
	fmovdneg	%xcc,	%f6,	%f6
	ldd	[%l7 + 0x08],	%f2
	lduh	[%l7 + 0x78],	%i0
	sra	%l5,	%l2,	%g2
	fmovdvc	%icc,	%f26,	%f11
	popc	0x15E2,	%i2
	fmovsvc	%icc,	%f25,	%f8
	edge32	%i1,	%g7,	%i5
	edge8	%o6,	%o5,	%i6
	addccc	%g6,	%l6,	%g3
	stx	%i4,	[%l7 + 0x08]
	fcmpgt32	%f24,	%f12,	%o2
	sir	0x04B8
	fmovrdne	%g5,	%f6,	%f16
	edge32	%l1,	%o1,	%o0
	mulx	%l3,	%l4,	%o3
	movleu	%icc,	%o7,	%i7
	lduw	[%l7 + 0x20],	%o4
	stw	%l0,	[%l7 + 0x40]
	sir	0x1C0E
	movcs	%xcc,	%i3,	%g4
	fmovdpos	%xcc,	%f21,	%f26
	fmovsge	%icc,	%f19,	%f27
	fornot2s	%f24,	%f13,	%f21
	edge16n	%g1,	%l5,	%i0
	andn	%g2,	0x043A,	%l2
	fnegd	%f18,	%f16
	st	%f30,	[%l7 + 0x24]
	move	%xcc,	%i1,	%i2
	movrne	%i5,	0x073,	%o6
	movg	%xcc,	%o5,	%g7
	orncc	%i6,	0x0DF4,	%l6
	array32	%g3,	%i4,	%g6
	fmuld8ulx16	%f20,	%f29,	%f16
	fnegd	%f28,	%f30
	ldd	[%l7 + 0x70],	%f24
	sth	%o2,	[%l7 + 0x12]
	edge16ln	%g5,	%l1,	%o1
	sdiv	%o0,	0x053B,	%l3
	ldsw	[%l7 + 0x1C],	%l4
	edge16	%o3,	%o7,	%i7
	edge16n	%l0,	%o4,	%i3
	sll	%g4,	%g1,	%l5
	move	%icc,	%g2,	%i0
	movle	%xcc,	%l2,	%i1
	fornot1s	%f24,	%f2,	%f20
	alignaddr	%i5,	%o6,	%i2
	fcmpeq32	%f2,	%f8,	%o5
	pdist	%f14,	%f6,	%f26
	lduw	[%l7 + 0x1C],	%i6
	movn	%xcc,	%l6,	%g3
	srlx	%g7,	0x02,	%g6
	umulcc	%i4,	0x1440,	%o2
	sir	0x156A
	andn	%l1,	%o1,	%o0
	ldx	[%l7 + 0x08],	%g5
	sll	%l3,	0x05,	%o3
	sub	%o7,	0x1271,	%i7
	or	%l0,	0x1A4A,	%o4
	popc	0x053F,	%i3
	subc	%l4,	0x02C8,	%g1
	fnands	%f16,	%f1,	%f25
	movleu	%icc,	%l5,	%g4
	subccc	%g2,	0x0D0A,	%l2
	edge32l	%i0,	%i5,	%i1
	movrgz	%o6,	%o5,	%i2
	movl	%xcc,	%l6,	%g3
	alignaddrl	%i6,	%g6,	%i4
	std	%f0,	[%l7 + 0x50]
	fcmps	%fcc0,	%f29,	%f8
	addccc	%g7,	0x0BC5,	%l1
	mulx	%o2,	%o0,	%g5
	sllx	%l3,	%o3,	%o1
	edge16l	%i7,	%o7,	%o4
	movpos	%icc,	%i3,	%l0
	array16	%l4,	%g1,	%g4
	sdiv	%l5,	0x081A,	%g2
	movle	%xcc,	%i0,	%l2
	srl	%i5,	0x1A,	%i1
	sir	0x1206
	edge8	%o6,	%i2,	%l6
	umulcc	%g3,	%o5,	%i6
	umul	%i4,	0x0C28,	%g7
	ldd	[%l7 + 0x20],	%g6
	movneg	%icc,	%o2,	%o0
	alignaddrl	%l1,	%l3,	%g5
	fmovrse	%o1,	%f19,	%f4
	or	%o3,	%i7,	%o4
	subcc	%i3,	%l0,	%l4
	sll	%g1,	0x18,	%g4
	sllx	%l5,	%g2,	%o7
	smul	%l2,	%i5,	%i1
	orcc	%o6,	0x1208,	%i0
	movn	%icc,	%i2,	%g3
	sdiv	%o5,	0x020B,	%i6
	orcc	%l6,	0x0DA0,	%g7
	movleu	%xcc,	%g6,	%o2
	move	%xcc,	%o0,	%l1
	edge16n	%l3,	%g5,	%o1
	movpos	%icc,	%o3,	%i4
	andn	%i7,	%i3,	%l0
	st	%f11,	[%l7 + 0x68]
	edge16	%o4,	%l4,	%g1
	nop
	set	0x1E, %l1
	ldub	[%l7 + %l1],	%g4
	movvc	%xcc,	%g2,	%l5
	st	%f10,	[%l7 + 0x14]
	smul	%l2,	%o7,	%i5
	mulx	%o6,	%i1,	%i2
	movle	%xcc,	%g3,	%o5
	or	%i6,	0x0C69,	%l6
	udivx	%g7,	0x1440,	%i0
	sub	%g6,	%o0,	%l1
	subcc	%l3,	%g5,	%o2
	fmovspos	%icc,	%f28,	%f16
	movrlez	%o1,	%i4,	%o3
	sir	0x0F0C
	mulscc	%i3,	0x1D2A,	%i7
	orn	%o4,	%l0,	%g1
	edge32n	%l4,	%g4,	%l5
	fpmerge	%f9,	%f8,	%f16
	movvc	%icc,	%l2,	%g2
	fpadd16	%f14,	%f24,	%f4
	fpadd32	%f30,	%f28,	%f12
	movcs	%icc,	%o7,	%o6
	movpos	%icc,	%i1,	%i2
	xnor	%g3,	%o5,	%i5
	fmuld8ulx16	%f3,	%f1,	%f22
	fcmpes	%fcc0,	%f9,	%f24
	addcc	%i6,	0x0AC1,	%l6
	movgu	%xcc,	%i0,	%g7
	movge	%icc,	%g6,	%o0
	addccc	%l1,	0x1E0E,	%g5
	sub	%o2,	%l3,	%o1
	movne	%xcc,	%o3,	%i3
	sll	%i4,	%o4,	%l0
	ldub	[%l7 + 0x71],	%g1
	movrlz	%l4,	%g4,	%i7
	edge32l	%l5,	%l2,	%g2
	movgu	%icc,	%o7,	%o6
	edge8n	%i2,	%i1,	%g3
	fmuld8ulx16	%f31,	%f12,	%f22
	sll	%i5,	0x14,	%i6
	movle	%xcc,	%l6,	%o5
	sdiv	%g7,	0x1A8E,	%i0
	move	%icc,	%o0,	%l1
	fpadd32	%f14,	%f30,	%f20
	std	%f22,	[%l7 + 0x78]
	fmovdvc	%icc,	%f28,	%f26
	subc	%g5,	%o2,	%l3
	edge16l	%g6,	%o3,	%i3
	ld	[%l7 + 0x58],	%f20
	sdivx	%i4,	0x0BC1,	%o1
	movrlz	%l0,	0x220,	%g1
	fnor	%f18,	%f10,	%f28
	mulscc	%l4,	%o4,	%g4
	fcmpeq16	%f16,	%f6,	%l5
	movneg	%xcc,	%i7,	%g2
	fmovsvc	%icc,	%f16,	%f27
	edge16	%l2,	%o7,	%o6
	fpadd16	%f2,	%f18,	%f0
	sllx	%i2,	%i1,	%g3
	fmovrslz	%i5,	%f4,	%f12
	ld	[%l7 + 0x14],	%f1
	movne	%xcc,	%i6,	%o5
	fmovsvc	%xcc,	%f0,	%f29
	alignaddrl	%l6,	%i0,	%g7
	fnors	%f17,	%f22,	%f13
	fmovdvc	%xcc,	%f14,	%f18
	sub	%o0,	0x17B0,	%g5
	addccc	%l1,	%o2,	%l3
	stb	%g6,	[%l7 + 0x77]
	lduh	[%l7 + 0x2C],	%o3
	edge16n	%i3,	%i4,	%l0
	nop
	set	0x68, %o2
	lduh	[%l7 + %o2],	%g1
	sth	%l4,	[%l7 + 0x26]
	movl	%icc,	%o4,	%g4
	movrgez	%l5,	0x16D,	%i7
	edge8l	%o1,	%l2,	%g2
	stb	%o6,	[%l7 + 0x4F]
	popc	0x1A84,	%o7
	edge8	%i1,	%g3,	%i5
	udiv	%i2,	0x1628,	%i6
	xnorcc	%l6,	%o5,	%i0
	stx	%o0,	[%l7 + 0x38]
	edge8	%g7,	%g5,	%o2
	fmovsl	%xcc,	%f14,	%f5
	orncc	%l3,	%g6,	%l1
	subc	%o3,	0x1058,	%i4
	movrlz	%i3,	0x1C0,	%l0
	udivcc	%l4,	0x02BB,	%o4
	std	%f12,	[%l7 + 0x08]
	ldd	[%l7 + 0x60],	%g0
	fcmped	%fcc3,	%f12,	%f4
	umul	%g4,	0x1F7A,	%l5
	movle	%icc,	%i7,	%o1
	orcc	%l2,	%o6,	%g2
	movre	%i1,	0x25A,	%g3
	movcc	%icc,	%o7,	%i2
	movg	%xcc,	%i5,	%i6
	edge16n	%o5,	%i0,	%l6
	movgu	%xcc,	%g7,	%g5
	edge8	%o2,	%l3,	%o0
	fxors	%f1,	%f27,	%f1
	edge8	%g6,	%l1,	%o3
	movleu	%icc,	%i3,	%l0
	ldsw	[%l7 + 0x10],	%l4
	sdiv	%i4,	0x1C4D,	%g1
	orn	%g4,	%o4,	%i7
	bshuffle	%f2,	%f10,	%f20
	movrgez	%l5,	0x126,	%l2
	orcc	%o6,	%o1,	%g2
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	udivcc	%i5,	0x171F,	%i6
	movg	%xcc,	%o5,	%o7
	edge32n	%i0,	%g7,	%l6
	popc	%o2,	%l3
	movgu	%icc,	%g5,	%o0
	edge32ln	%l1,	%o3,	%g6
	alignaddrl	%l0,	%i3,	%i4
	fmovdvs	%xcc,	%f16,	%f21
	ldsh	[%l7 + 0x3C],	%l4
	andcc	%g4,	0x068F,	%o4
	movgu	%icc,	%i7,	%l5
	movrlez	%g1,	%l2,	%o6
	subc	%g2,	%i1,	%g3
	fpsub16s	%f17,	%f18,	%f13
	ldd	[%l7 + 0x70],	%f4
	movre	%o1,	0x1EC,	%i5
	orn	%i2,	0x1E79,	%o5
	fcmpne32	%f10,	%f14,	%o7
	sdivx	%i6,	0x06BB,	%i0
	movle	%icc,	%l6,	%g7
	add	%o2,	0x0D86,	%g5
	movgu	%icc,	%l3,	%l1
	alignaddr	%o0,	%g6,	%o3
	sllx	%l0,	%i4,	%l4
	edge16	%i3,	%o4,	%g4
	sth	%l5,	[%l7 + 0x0A]
	fmovsn	%icc,	%f3,	%f21
	ldsb	[%l7 + 0x5C],	%i7
	fmovsa	%xcc,	%f28,	%f28
	movneg	%icc,	%l2,	%g1
	xnorcc	%o6,	%g2,	%i1
	fmovrdgz	%o1,	%f22,	%f16
	movrlez	%g3,	0x1D2,	%i2
	movrlez	%o5,	%o7,	%i6
	movpos	%icc,	%i5,	%i0
	movrlz	%l6,	%o2,	%g7
	subc	%l3,	%g5,	%o0
	lduw	[%l7 + 0x14],	%l1
	ldd	[%l7 + 0x40],	%f24
	smul	%g6,	0x0629,	%o3
	fpsub32s	%f2,	%f29,	%f16
	movgu	%xcc,	%i4,	%l4
	umul	%l0,	%o4,	%g4
	std	%f2,	[%l7 + 0x10]
	nop
	set	0x78, %o0
	ldd	[%l7 + %o0],	%l4
	subc	%i3,	0x0978,	%l2
	edge16	%i7,	%o6,	%g1
	orn	%g2,	%o1,	%g3
	fmovrdlz	%i2,	%f30,	%f4
	sra	%o5,	%i1,	%i6
	movneg	%xcc,	%i5,	%o7
	movle	%xcc,	%l6,	%i0
	movn	%xcc,	%o2,	%g7
	movleu	%xcc,	%g5,	%o0
	sra	%l1,	%g6,	%o3
	edge32	%l3,	%i4,	%l4
	fzero	%f28
	sth	%o4,	[%l7 + 0x40]
	movrgz	%g4,	0x36C,	%l5
	fmovdleu	%icc,	%f11,	%f16
	fmovdcs	%xcc,	%f6,	%f18
	movneg	%xcc,	%l0,	%l2
	stx	%i7,	[%l7 + 0x08]
	fmovrdlez	%o6,	%f16,	%f26
	fmovspos	%xcc,	%f20,	%f9
	ld	[%l7 + 0x54],	%f31
	subccc	%g1,	0x1753,	%g2
	fmovrdgez	%o1,	%f22,	%f22
	subccc	%i3,	0x1935,	%i2
	edge16ln	%g3,	%o5,	%i6
	ld	[%l7 + 0x34],	%f13
	alignaddr	%i1,	%o7,	%i5
	fmovdleu	%xcc,	%f30,	%f19
	udivcc	%l6,	0x1370,	%i0
	fmovdle	%icc,	%f27,	%f16
	movneg	%icc,	%g7,	%g5
	fpmerge	%f8,	%f25,	%f18
	sll	%o0,	%l1,	%g6
	fcmpgt32	%f6,	%f8,	%o3
	edge8ln	%o2,	%l3,	%i4
	save %o4, 0x0605, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l5,	%g4
	sethi	0x15F5,	%l0
	fmovdvc	%icc,	%f28,	%f3
	edge32l	%l2,	%o6,	%g1
	edge16l	%i7,	%g2,	%i3
	movne	%icc,	%o1,	%g3
	edge32	%o5,	%i2,	%i1
	array32	%i6,	%i5,	%l6
	fcmpd	%fcc1,	%f24,	%f18
	edge32	%i0,	%g7,	%g5
	movgu	%icc,	%o0,	%o7
	sllx	%g6,	%l1,	%o2
	alignaddr	%l3,	%o3,	%o4
	fcmple32	%f16,	%f6,	%l4
	mulx	%l5,	0x152E,	%g4
	subc	%i4,	%l2,	%o6
	edge8ln	%g1,	%l0,	%i7
	restore %i3, %o1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g3,	%i2
	addcc	%o5,	0x00CA,	%i1
	edge8	%i6,	%i5,	%i0
	or	%l6,	0x0D68,	%g5
	movle	%xcc,	%o0,	%g7
	movl	%icc,	%g6,	%o7
	movcc	%icc,	%o2,	%l1
	andncc	%l3,	%o4,	%o3
	addccc	%l4,	0x1739,	%g4
	andncc	%l5,	%i4,	%o6
	sdivx	%g1,	0x0C89,	%l0
	movrgz	%l2,	0x29B,	%i3
	fandnot1s	%f31,	%f3,	%f10
	andcc	%o1,	0x0F88,	%g2
	sth	%g3,	[%l7 + 0x46]
	fandnot1	%f26,	%f24,	%f30
	bshuffle	%f14,	%f22,	%f16
	ldd	[%l7 + 0x08],	%i6
	ldsb	[%l7 + 0x39],	%i2
	movpos	%xcc,	%o5,	%i6
	array8	%i5,	%i0,	%i1
	lduh	[%l7 + 0x38],	%l6
	edge16l	%o0,	%g7,	%g5
	fxnor	%f22,	%f12,	%f4
	srl	%o7,	%g6,	%l1
	array8	%l3,	%o4,	%o3
	subc	%l4,	%o2,	%l5
	alignaddr	%i4,	%g4,	%o6
	edge16l	%g1,	%l0,	%i3
	edge32	%l2,	%o1,	%g2
	umul	%g3,	0x0F45,	%i2
	lduw	[%l7 + 0x7C],	%i7
	movcs	%xcc,	%i6,	%o5
	popc	0x16D3,	%i5
	movre	%i0,	%i1,	%l6
	xnorcc	%g7,	0x0382,	%o0
	movn	%icc,	%o7,	%g5
	addccc	%l1,	%l3,	%o4
	movne	%xcc,	%o3,	%g6
	movl	%icc,	%o2,	%l5
	orncc	%l4,	0x014D,	%i4
	fmuld8sux16	%f23,	%f26,	%f26
	edge16l	%g4,	%o6,	%g1
	srax	%l0,	%i3,	%l2
	fmovdvs	%icc,	%f24,	%f27
	std	%f12,	[%l7 + 0x60]
	fandnot1s	%f0,	%f22,	%f18
	lduw	[%l7 + 0x5C],	%g2
	movrgz	%g3,	0x3E1,	%i2
	fmovsle	%icc,	%f22,	%f8
	fmovsvs	%icc,	%f18,	%f18
	fmovrdgez	%i7,	%f2,	%f14
	edge16n	%o1,	%i6,	%o5
	fcmped	%fcc2,	%f10,	%f18
	sir	0x1FE8
	ldd	[%l7 + 0x10],	%i4
	nop
	set	0x70, %l5
	ldd	[%l7 + %l5],	%i0
	fmovrdgez	%l6,	%f14,	%f24
	andncc	%g7,	%o0,	%i0
	xnor	%g5,	%o7,	%l3
	edge8	%l1,	%o4,	%o3
	addc	%g6,	0x134E,	%o2
	fmovsg	%xcc,	%f9,	%f11
	movgu	%xcc,	%l4,	%i4
	ld	[%l7 + 0x44],	%f18
	movrlez	%l5,	0x2D4,	%o6
	fcmps	%fcc0,	%f28,	%f21
	sdivcc	%g1,	0x069C,	%g4
	popc	0x1641,	%i3
	array16	%l0,	%g2,	%l2
	edge16	%i2,	%g3,	%o1
	movpos	%xcc,	%i6,	%i7
	lduw	[%l7 + 0x24],	%o5
	st	%f31,	[%l7 + 0x64]
	fmovsl	%icc,	%f21,	%f19
	and	%i1,	0x11D8,	%i5
	andcc	%g7,	0x18C7,	%l6
	ldsh	[%l7 + 0x72],	%o0
	sir	0x1338
	stx	%g5,	[%l7 + 0x40]
	sdivcc	%o7,	0x186C,	%l3
	udiv	%l1,	0x148E,	%i0
	movn	%icc,	%o3,	%o4
	subc	%o2,	%g6,	%i4
	edge32ln	%l5,	%o6,	%l4
	andncc	%g4,	%i3,	%l0
	fmovrsne	%g1,	%f10,	%f20
	nop
	set	0x54, %l2
	ldub	[%l7 + %l2],	%l2
	sth	%g2,	[%l7 + 0x5A]
	fandnot2	%f26,	%f22,	%f24
	andncc	%i2,	%g3,	%o1
	srl	%i6,	0x0C,	%o5
	edge16l	%i1,	%i7,	%g7
	ldsh	[%l7 + 0x1C],	%i5
	sllx	%o0,	0x0B,	%l6
	sdivx	%o7,	0x124D,	%l3
	movl	%icc,	%l1,	%i0
	edge16ln	%g5,	%o4,	%o2
	fxors	%f16,	%f19,	%f9
	alignaddr	%g6,	%o3,	%l5
	stb	%i4,	[%l7 + 0x40]
	nop
	set	0x18, %g4
	stw	%l4,	[%l7 + %g4]
	movn	%xcc,	%o6,	%i3
	fornot2	%f30,	%f2,	%f0
	stw	%g4,	[%l7 + 0x38]
	popc	%l0,	%g1
	fors	%f0,	%f5,	%f2
	fxor	%f30,	%f20,	%f28
	sth	%g2,	[%l7 + 0x16]
	fmovdge	%xcc,	%f17,	%f14
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	sllx	%i6,	%o1,	%o5
	fmovdge	%icc,	%f5,	%f29
	andn	%i7,	0x0142,	%g7
	movgu	%xcc,	%i1,	%i5
	orcc	%l6,	0x15BC,	%o0
	edge16l	%l3,	%o7,	%i0
	movneg	%icc,	%g5,	%l1
	xor	%o4,	%o2,	%o3
	st	%f3,	[%l7 + 0x78]
	fand	%f6,	%f22,	%f24
	sll	%l5,	0x18,	%i4
	sllx	%g6,	0x19,	%l4
	edge8	%o6,	%g4,	%i3
	mova	%icc,	%g1,	%l0
	array16	%g2,	%i2,	%g3
	stw	%l2,	[%l7 + 0x38]
	movrlz	%o1,	0x208,	%o5
	fpadd16	%f30,	%f12,	%f16
	fnand	%f10,	%f28,	%f30
	array8	%i7,	%g7,	%i6
	udivcc	%i1,	0x0F2B,	%l6
	srl	%o0,	%l3,	%i5
	pdist	%f0,	%f8,	%f30
	fzero	%f8
	stw	%o7,	[%l7 + 0x3C]
	movcs	%icc,	%i0,	%g5
	addc	%o4,	%l1,	%o2
	umulcc	%l5,	0x0139,	%o3
	fandnot1s	%f20,	%f31,	%f1
	ldd	[%l7 + 0x78],	%g6
	fmul8x16	%f28,	%f2,	%f24
	movre	%l4,	0x13B,	%o6
	srax	%i4,	0x1C,	%i3
	fxnors	%f13,	%f13,	%f14
	movvc	%xcc,	%g4,	%l0
	movrlz	%g1,	%g2,	%i2
	fcmpeq32	%f12,	%f2,	%g3
	edge32ln	%l2,	%o1,	%o5
	xnor	%g7,	%i7,	%i1
	fmovdvc	%icc,	%f1,	%f12
	smulcc	%l6,	%i6,	%l3
	movcs	%icc,	%i5,	%o0
	fcmpeq32	%f28,	%f22,	%i0
	xorcc	%o7,	0x170B,	%g5
	udivcc	%l1,	0x1116,	%o2
	ldd	[%l7 + 0x50],	%f28
	mulx	%l5,	0x1656,	%o4
	ld	[%l7 + 0x3C],	%f19
	bshuffle	%f30,	%f30,	%f2
	smulcc	%o3,	0x1BEE,	%g6
	srlx	%l4,	0x07,	%o6
	sdivx	%i4,	0x17E0,	%g4
	subc	%l0,	0x0B92,	%i3
	fcmpne32	%f0,	%f26,	%g2
	ldsw	[%l7 + 0x0C],	%g1
	andn	%g3,	%l2,	%o1
	fmovsg	%xcc,	%f24,	%f13
	fpack16	%f16,	%f24
	movl	%xcc,	%o5,	%g7
	udivx	%i2,	0x05C1,	%i1
	edge8ln	%i7,	%l6,	%l3
	st	%f25,	[%l7 + 0x34]
	move	%icc,	%i5,	%o0
	sdiv	%i0,	0x1D78,	%i6
	movrlez	%o7,	%l1,	%g5
	ldsw	[%l7 + 0x2C],	%l5
	addcc	%o2,	0x0DD7,	%o4
	edge8l	%o3,	%l4,	%g6
	std	%f12,	[%l7 + 0x28]
	edge32	%o6,	%g4,	%i4
	fmovda	%icc,	%f16,	%f16
	xorcc	%i3,	%g2,	%g1
	fzeros	%f5
	umulcc	%l0,	%g3,	%o1
	save %o5, %l2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f14,	%f27,	%f9
	and	%i1,	0x0D4A,	%i7
	edge8ln	%i2,	%l6,	%l3
	fcmpne16	%f26,	%f14,	%o0
	srlx	%i0,	0x10,	%i6
	edge16l	%i5,	%o7,	%g5
	umul	%l5,	%o2,	%l1
	popc	0x0512,	%o4
	st	%f18,	[%l7 + 0x08]
	xorcc	%o3,	0x114F,	%l4
	fmuld8ulx16	%f21,	%f4,	%f2
	movvc	%xcc,	%g6,	%g4
	sll	%i4,	%i3,	%o6
	edge16l	%g1,	%l0,	%g2
	edge16l	%o1,	%o5,	%l2
	srl	%g3,	%g7,	%i7
	sub	%i1,	%l6,	%i2
	nop
	set	0x40, %i7
	std	%f24,	[%l7 + %i7]
	edge16l	%l3,	%o0,	%i0
	sir	0x0762
	movle	%icc,	%i5,	%i6
	stw	%g5,	[%l7 + 0x30]
	fones	%f22
	movle	%icc,	%l5,	%o2
	edge32l	%l1,	%o4,	%o7
	sll	%l4,	0x0F,	%o3
	subccc	%g4,	%i4,	%i3
	andcc	%o6,	0x18E2,	%g6
	alignaddr	%l0,	%g2,	%o1
	orcc	%g1,	0x10A4,	%l2
	edge8n	%o5,	%g7,	%g3
	sth	%i1,	[%l7 + 0x5A]
	mova	%icc,	%i7,	%i2
	movre	%l6,	%o0,	%i0
	addc	%i5,	0x0EFC,	%i6
	sub	%l3,	0x1584,	%g5
	edge8ln	%o2,	%l1,	%l5
	mulx	%o7,	%o4,	%l4
	orncc	%g4,	%o3,	%i3
	srl	%i4,	%g6,	%o6
	ld	[%l7 + 0x3C],	%f11
	fmovrsgz	%g2,	%f26,	%f28
	edge16ln	%l0,	%g1,	%o1
	edge32	%l2,	%g7,	%g3
	movleu	%icc,	%o5,	%i1
	fabss	%f25,	%f13
	edge16	%i2,	%l6,	%o0
	fmul8x16au	%f23,	%f14,	%f20
	movrgz	%i7,	%i0,	%i5
	movneg	%xcc,	%i6,	%l3
	fors	%f15,	%f4,	%f13
	edge16	%o2,	%g5,	%l5
	subccc	%l1,	%o4,	%l4
	movleu	%xcc,	%g4,	%o7
	fmovrsgz	%i3,	%f4,	%f11
	edge8l	%i4,	%g6,	%o6
	srax	%o3,	0x0A,	%g2
	move	%icc,	%l0,	%o1
	smul	%l2,	0x1266,	%g1
	mulx	%g7,	%g3,	%i1
	ld	[%l7 + 0x54],	%f3
	movcs	%xcc,	%o5,	%l6
	movg	%icc,	%o0,	%i2
	move	%icc,	%i0,	%i5
	movcs	%icc,	%i7,	%l3
	or	%i6,	0x052E,	%o2
	fmovrdne	%g5,	%f30,	%f26
	fands	%f31,	%f13,	%f0
	orn	%l1,	%o4,	%l4
	edge8l	%l5,	%g4,	%o7
	udivcc	%i3,	0x1797,	%i4
	srl	%o6,	0x13,	%g6
	movg	%icc,	%o3,	%l0
	ldsw	[%l7 + 0x40],	%g2
	orcc	%o1,	0x1C9F,	%g1
	ld	[%l7 + 0x34],	%f3
	popc	0x1720,	%g7
	umul	%l2,	%i1,	%g3
	edge32n	%o5,	%l6,	%o0
	movge	%icc,	%i0,	%i5
	sir	0x002C
	movg	%xcc,	%i7,	%i2
	srl	%l3,	0x06,	%o2
	nop
	set	0x58, %g7
	stx	%g5,	[%l7 + %g7]
	popc	0x130F,	%l1
	sdivcc	%i6,	0x07E1,	%l4
	movvc	%xcc,	%o4,	%g4
	or	%o7,	%i3,	%i4
	srax	%l5,	%g6,	%o6
	ldsw	[%l7 + 0x74],	%l0
	andcc	%o3,	0x1DCA,	%o1
	sdivx	%g1,	0x110E,	%g7
	movrne	%l2,	%i1,	%g2
	subc	%g3,	0x09CD,	%l6
	xorcc	%o5,	0x15A9,	%i0
	orcc	%i5,	0x08FD,	%o0
	movl	%icc,	%i7,	%i2
	fandnot2s	%f18,	%f12,	%f9
	xor	%o2,	%l3,	%g5
	stw	%l1,	[%l7 + 0x1C]
	movre	%l4,	0x3B1,	%o4
	fmovdvs	%icc,	%f22,	%f7
	xnorcc	%g4,	0x0B37,	%i6
	sll	%o7,	%i3,	%i4
	fmovs	%f21,	%f0
	fandnot2s	%f18,	%f15,	%f14
	addc	%g6,	0x1697,	%o6
	edge32ln	%l5,	%l0,	%o1
	xnorcc	%o3,	0x115B,	%g1
	andncc	%l2,	%g7,	%i1
	srl	%g2,	%g3,	%l6
	smulcc	%i0,	%i5,	%o0
	array16	%o5,	%i7,	%o2
	movg	%xcc,	%l3,	%g5
	fmovsa	%icc,	%f29,	%f1
	ldub	[%l7 + 0x66],	%i2
	fzeros	%f11
	smulcc	%l4,	%l1,	%o4
	edge16	%g4,	%o7,	%i3
	addccc	%i6,	%g6,	%o6
	fmul8x16au	%f26,	%f21,	%f28
	sethi	0x088F,	%i4
	save %l5, 0x1A14, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o3,	%g1,	%l0
	edge8l	%l2,	%g7,	%g2
	srax	%g3,	%l6,	%i0
	ldd	[%l7 + 0x60],	%f4
	movrlez	%i1,	%i5,	%o0
	andcc	%i7,	%o2,	%l3
	edge16	%o5,	%i2,	%l4
	addc	%g5,	0x0B7C,	%l1
	movn	%icc,	%g4,	%o7
	lduh	[%l7 + 0x78],	%i3
	fpadd16s	%f18,	%f5,	%f8
	array32	%i6,	%o4,	%g6
	xorcc	%o6,	%l5,	%i4
	alignaddrl	%o3,	%o1,	%g1
	movl	%icc,	%l2,	%l0
	array8	%g2,	%g7,	%g3
	edge8l	%i0,	%l6,	%i1
	fpadd32s	%f27,	%f14,	%f16
	restore %i5, %o0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l3,	0x19A5,	%i7
	ld	[%l7 + 0x5C],	%f31
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%i2
	fcmped	%fcc1,	%f14,	%f28
	movge	%xcc,	%o5,	%g5
	edge32ln	%l1,	%g4,	%l4
	for	%f30,	%f8,	%f4
	andn	%o7,	0x0659,	%i6
	ld	[%l7 + 0x4C],	%f0
	fcmpgt32	%f0,	%f12,	%o4
	srax	%g6,	%i3,	%l5
	movrgz	%i4,	%o3,	%o6
	xnorcc	%o1,	0x18D1,	%g1
	movcc	%icc,	%l2,	%g2
	edge8	%g7,	%g3,	%i0
	sdivcc	%l0,	0x1C18,	%l6
	fcmpd	%fcc2,	%f0,	%f10
	sllx	%i5,	0x1E,	%i1
	xorcc	%o2,	%o0,	%l3
	movvs	%icc,	%i7,	%o5
	stb	%i2,	[%l7 + 0x1B]
	edge8	%l1,	%g5,	%l4
	std	%f12,	[%l7 + 0x70]
	fmovrdlez	%g4,	%f0,	%f8
	std	%f4,	[%l7 + 0x68]
	ldx	[%l7 + 0x10],	%o7
	lduh	[%l7 + 0x5C],	%i6
	move	%icc,	%g6,	%o4
	fcmpes	%fcc0,	%f14,	%f26
	umulcc	%l5,	0x16B7,	%i3
	fpsub32	%f6,	%f12,	%f8
	mulscc	%o3,	0x1031,	%i4
	ldd	[%l7 + 0x70],	%o6
	fpsub32s	%f29,	%f20,	%f17
	subc	%o1,	0x1C72,	%l2
	fnot1s	%f22,	%f12
	srlx	%g2,	0x1D,	%g7
	subc	%g1,	0x1FCF,	%i0
	udivx	%g3,	0x06F2,	%l6
	std	%f28,	[%l7 + 0x78]
	sllx	%l0,	0x18,	%i5
	fpadd32	%f4,	%f0,	%f10
	xor	%i1,	0x10B6,	%o0
	ld	[%l7 + 0x70],	%f12
	udivx	%l3,	0x17C6,	%o2
	udivcc	%o5,	0x1883,	%i7
	movn	%xcc,	%i2,	%l1
	xnorcc	%g5,	%l4,	%g4
	movneg	%xcc,	%o7,	%i6
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	fcmped	%fcc2,	%f16,	%f8
	fmovscs	%xcc,	%f22,	%f4
	srax	%l5,	0x1F,	%i3
	umulcc	%i4,	0x0D7A,	%o3
	srax	%o6,	0x11,	%o1
	movne	%icc,	%l2,	%g2
	movcc	%xcc,	%g7,	%g1
	movge	%icc,	%i0,	%l6
	fmovdleu	%xcc,	%f23,	%f24
	movle	%icc,	%l0,	%g3
	movrlez	%i5,	0x1A0,	%o0
	fcmpeq32	%f18,	%f6,	%i1
	movcs	%xcc,	%o2,	%l3
	edge16ln	%i7,	%i2,	%o5
	ldub	[%l7 + 0x4D],	%g5
	edge16ln	%l4,	%g4,	%l1
	restore %i6, %o7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f6,	%f9
	movl	%icc,	%l5,	%g6
	fcmpeq32	%f10,	%f8,	%i4
	fnot2	%f10,	%f22
	movrgz	%i3,	0x1EC,	%o3
	sdiv	%o6,	0x0468,	%o1
	ldd	[%l7 + 0x70],	%f4
	nop
	set	0x78, %i3
	ldsw	[%l7 + %i3],	%g2
	ldsw	[%l7 + 0x0C],	%g7
	movleu	%icc,	%l2,	%g1
	stb	%i0,	[%l7 + 0x23]
	fone	%f2
	ldsb	[%l7 + 0x78],	%l6
	stx	%l0,	[%l7 + 0x28]
	srax	%g3,	0x16,	%o0
	movgu	%icc,	%i5,	%i1
	srl	%l3,	0x00,	%o2
	sir	0x0E33
	xnor	%i2,	0x01FF,	%i7
	sub	%g5,	0x1697,	%o5
	smul	%g4,	%l1,	%i6
	movrlz	%l4,	%o7,	%l5
	ld	[%l7 + 0x40],	%f21
	fmovsl	%icc,	%f13,	%f2
	fmovdg	%icc,	%f14,	%f4
	save %o4, 0x131C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i3,	%o3,	%i4
	movrlz	%o1,	%g2,	%o6
	addcc	%g7,	%l2,	%g1
	srl	%i0,	0x16,	%l6
	fmovscc	%xcc,	%f9,	%f0
	fmovse	%icc,	%f0,	%f5
	movrlz	%g3,	%o0,	%l0
	movne	%icc,	%i1,	%l3
	fnot1	%f10,	%f4
	fmovrslez	%i5,	%f4,	%f21
	movre	%o2,	0x0BB,	%i7
	orncc	%g5,	0x05CB,	%i2
	andn	%o5,	0x1311,	%l1
	movcs	%icc,	%g4,	%i6
	udivx	%o7,	0x0AFA,	%l5
	fnands	%f8,	%f16,	%f23
	edge16	%o4,	%g6,	%i3
	andn	%l4,	0x19EB,	%o3
	stx	%i4,	[%l7 + 0x30]
	movle	%icc,	%o1,	%g2
	edge8n	%o6,	%l2,	%g7
	fmovd	%f0,	%f12
	movcc	%icc,	%g1,	%i0
	fmovsa	%icc,	%f3,	%f29
	fmovdleu	%xcc,	%f1,	%f27
	sll	%l6,	0x02,	%o0
	fpackfix	%f12,	%f11
	alignaddrl	%g3,	%l0,	%i1
	st	%f10,	[%l7 + 0x78]
	save %i5, %l3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g5,	[%l7 + 0x08]
	ldx	[%l7 + 0x58],	%i2
	srax	%o5,	%i7,	%g4
	nop
	set	0x64, %i1
	stw	%i6,	[%l7 + %i1]
	movvc	%icc,	%l1,	%o7
	fnegs	%f4,	%f4
	sth	%l5,	[%l7 + 0x3C]
	fpsub32	%f8,	%f24,	%f6
	edge8ln	%g6,	%i3,	%l4
	movre	%o4,	0x35A,	%i4
	edge32ln	%o1,	%o3,	%o6
	subc	%l2,	%g2,	%g7
	stb	%i0,	[%l7 + 0x2C]
	edge8n	%l6,	%g1,	%o0
	udivcc	%l0,	0x1696,	%i1
	lduh	[%l7 + 0x20],	%g3
	addccc	%l3,	0x061A,	%i5
	array16	%o2,	%i2,	%o5
	addccc	%g5,	%g4,	%i7
	udivx	%l1,	0x07D5,	%o7
	mulscc	%i6,	%l5,	%i3
	edge16l	%l4,	%g6,	%o4
	edge32l	%i4,	%o3,	%o1
	lduw	[%l7 + 0x18],	%l2
	fpsub32	%f30,	%f4,	%f12
	edge16ln	%g2,	%g7,	%i0
	srax	%o6,	0x1B,	%l6
	smul	%o0,	0x0722,	%g1
	orcc	%l0,	%g3,	%i1
	ldsb	[%l7 + 0x6D],	%i5
	udivx	%o2,	0x07F2,	%l3
	sllx	%o5,	%i2,	%g5
	edge16	%i7,	%l1,	%o7
	fmovdpos	%icc,	%f29,	%f27
	movge	%icc,	%i6,	%g4
	fmovsn	%icc,	%f20,	%f28
	and	%i3,	0x1EFC,	%l5
	srl	%l4,	%g6,	%i4
	srax	%o3,	0x05,	%o4
	fpadd16s	%f30,	%f9,	%f18
	addc	%l2,	%o1,	%g7
	std	%f12,	[%l7 + 0x30]
	ldub	[%l7 + 0x3E],	%g2
	ld	[%l7 + 0x58],	%f22
	edge16l	%o6,	%l6,	%o0
	fmul8x16au	%f26,	%f6,	%f30
	edge8n	%i0,	%l0,	%g1
	fmovdleu	%xcc,	%f23,	%f19
	udivcc	%g3,	0x1BF9,	%i1
	sllx	%o2,	0x1C,	%i5
	subccc	%l3,	%o5,	%g5
	andncc	%i7,	%i2,	%o7
	movrlez	%i6,	%l1,	%g4
	sub	%i3,	%l5,	%l4
	fnot1	%f18,	%f28
	movre	%g6,	%o3,	%i4
	xorcc	%l2,	%o1,	%g7
	and	%g2,	%o6,	%o4
	ldd	[%l7 + 0x18],	%i6
	lduh	[%l7 + 0x46],	%i0
	orcc	%l0,	%o0,	%g1
	movl	%icc,	%g3,	%i1
	movge	%xcc,	%i5,	%o2
	ldd	[%l7 + 0x50],	%f18
	nop
	set	0x74, %i5
	ldub	[%l7 + %i5],	%o5
	orn	%l3,	%g5,	%i2
	edge32ln	%i7,	%o7,	%l1
	and	%i6,	%i3,	%g4
	edge16ln	%l5,	%l4,	%g6
	fpadd16s	%f15,	%f5,	%f31
	ldd	[%l7 + 0x28],	%i4
	stb	%o3,	[%l7 + 0x6E]
	movne	%icc,	%o1,	%l2
	movge	%icc,	%g2,	%g7
	fornot2	%f18,	%f0,	%f12
	fsrc1s	%f6,	%f1
	popc	0x0171,	%o4
	srax	%l6,	%o6,	%l0
	fcmpeq16	%f16,	%f2,	%i0
	sdivx	%g1,	0x1EC2,	%o0
	sdivx	%i1,	0x10CE,	%i5
	smulcc	%o2,	%o5,	%g3
	st	%f26,	[%l7 + 0x1C]
	fxnors	%f5,	%f15,	%f28
	popc	%g5,	%i2
	mulscc	%l3,	0x1A90,	%o7
	fandnot2	%f4,	%f8,	%f4
	ld	[%l7 + 0x44],	%f5
	fone	%f18
	ldd	[%l7 + 0x28],	%f24
	subccc	%i7,	%i6,	%l1
	movn	%icc,	%g4,	%l5
	popc	0x1595,	%i3
	udivx	%g6,	0x1375,	%l4
	edge32l	%o3,	%i4,	%l2
	movvc	%xcc,	%o1,	%g2
	edge32ln	%g7,	%o4,	%l6
	srl	%l0,	%i0,	%g1
	ldub	[%l7 + 0x6F],	%o0
	fsrc2s	%f12,	%f17
	movg	%xcc,	%i1,	%i5
	edge16n	%o6,	%o5,	%o2
	lduw	[%l7 + 0x4C],	%g3
	edge32	%i2,	%l3,	%g5
	popc	0x0593,	%i7
	movg	%xcc,	%i6,	%l1
	fpsub16s	%f18,	%f1,	%f15
	edge32	%g4,	%o7,	%l5
	fexpand	%f3,	%f16
	lduh	[%l7 + 0x34],	%g6
	movvc	%icc,	%i3,	%l4
	sdiv	%i4,	0x1DAA,	%o3
	fornot1s	%f5,	%f29,	%f24
	array16	%o1,	%g2,	%l2
	mulx	%g7,	0x114C,	%l6
	edge8ln	%o4,	%i0,	%l0
	fmovscs	%icc,	%f15,	%f31
	mova	%icc,	%o0,	%g1
	subccc	%i1,	%i5,	%o5
	ldub	[%l7 + 0x65],	%o2
	array8	%g3,	%i2,	%l3
	orn	%o6,	0x19EE,	%i7
	movcc	%xcc,	%g5,	%l1
	subccc	%i6,	%o7,	%g4
	movcs	%icc,	%g6,	%i3
	umul	%l5,	%i4,	%o3
	lduh	[%l7 + 0x12],	%o1
	edge16ln	%g2,	%l4,	%g7
	fornot1	%f18,	%f10,	%f30
	edge16ln	%l6,	%l2,	%i0
	lduh	[%l7 + 0x4E],	%l0
	fmovscc	%icc,	%f16,	%f22
	popc	0x0651,	%o0
	edge16n	%g1,	%i1,	%i5
	addc	%o5,	0x0083,	%o4
	orn	%o2,	0x05AE,	%i2
	movge	%icc,	%l3,	%o6
	movl	%icc,	%g3,	%i7
	movvs	%icc,	%g5,	%l1
	sllx	%o7,	0x1D,	%i6
	orn	%g4,	%g6,	%i3
	array8	%l5,	%o3,	%i4
	fmovdge	%xcc,	%f17,	%f2
	or	%o1,	0x0598,	%l4
	and	%g2,	%g7,	%l6
	stw	%l2,	[%l7 + 0x64]
	fmovsn	%xcc,	%f0,	%f23
	movcs	%xcc,	%i0,	%o0
	srax	%g1,	0x0B,	%i1
	udiv	%l0,	0x0509,	%i5
	edge32n	%o5,	%o2,	%i2
	movg	%xcc,	%l3,	%o4
	edge8	%o6,	%g3,	%g5
	add	%i7,	%o7,	%l1
	ldsw	[%l7 + 0x74],	%i6
	sllx	%g6,	%i3,	%g4
	sdiv	%o3,	0x072E,	%i4
	smulcc	%o1,	%l5,	%g2
	nop
	set	0x18, %o4
	ldsh	[%l7 + %o4],	%l4
	fcmped	%fcc3,	%f4,	%f14
	edge8	%g7,	%l2,	%l6
	xnorcc	%i0,	0x05A2,	%g1
	fpack32	%f16,	%f6,	%f28
	movpos	%xcc,	%o0,	%i1
	movvc	%xcc,	%l0,	%i5
	stw	%o5,	[%l7 + 0x54]
	edge32ln	%i2,	%o2,	%l3
	ldx	[%l7 + 0x68],	%o4
	xnorcc	%o6,	0x1B78,	%g5
	st	%f17,	[%l7 + 0x58]
	fxors	%f25,	%f23,	%f29
	ldsh	[%l7 + 0x24],	%i7
	lduw	[%l7 + 0x0C],	%g3
	move	%xcc,	%l1,	%i6
	andn	%o7,	0x132F,	%i3
	srl	%g6,	0x1A,	%o3
	sethi	0x0C24,	%g4
	edge8	%i4,	%o1,	%g2
	array32	%l4,	%l5,	%l2
	movre	%l6,	%g7,	%i0
	alignaddr	%o0,	%g1,	%i1
	add	%l0,	%i5,	%o5
	sethi	0x14FA,	%i2
	mova	%xcc,	%l3,	%o2
	ld	[%l7 + 0x6C],	%f29
	popc	0x0554,	%o6
	srax	%g5,	0x04,	%i7
	edge16ln	%g3,	%l1,	%i6
	movne	%icc,	%o7,	%o4
	fpackfix	%f18,	%f3
	smulcc	%i3,	0x16D7,	%g6
	umul	%g4,	0x1045,	%o3
	andn	%i4,	%o1,	%l4
	movne	%icc,	%g2,	%l5
	fmovdleu	%xcc,	%f31,	%f26
	srl	%l6,	%g7,	%i0
	alignaddrl	%o0,	%g1,	%i1
	orncc	%l2,	%l0,	%i5
	fmovrde	%i2,	%f24,	%f8
	movre	%o5,	%l3,	%o6
	stb	%g5,	[%l7 + 0x68]
	fmovdg	%xcc,	%f13,	%f15
	movneg	%icc,	%o2,	%i7
	orcc	%g3,	0x1B04,	%i6
	nop
	set	0x08, %i6
	stx	%o7,	[%l7 + %i6]
	edge32n	%l1,	%i3,	%o4
	std	%f24,	[%l7 + 0x18]
	mulscc	%g6,	%o3,	%i4
	fcmpne16	%f2,	%f4,	%o1
	edge8	%g4,	%g2,	%l5
	ldsb	[%l7 + 0x67],	%l6
	andcc	%l4,	0x1644,	%i0
	ldsb	[%l7 + 0x28],	%o0
	fmuld8sux16	%f9,	%f18,	%f26
	edge16l	%g7,	%i1,	%l2
	movre	%g1,	%i5,	%l0
	sll	%i2,	0x0E,	%o5
	movl	%xcc,	%l3,	%g5
	stx	%o2,	[%l7 + 0x28]
	fnor	%f30,	%f26,	%f28
	ldx	[%l7 + 0x58],	%o6
	st	%f24,	[%l7 + 0x30]
	lduh	[%l7 + 0x30],	%g3
	udivx	%i7,	0x13A3,	%i6
	subc	%l1,	%i3,	%o7
	andcc	%g6,	%o3,	%o4
	sllx	%i4,	%o1,	%g2
	sir	0x1F81
	ldsb	[%l7 + 0x10],	%l5
	fabsd	%f12,	%f16
	srl	%l6,	%g4,	%l4
	movgu	%icc,	%i0,	%o0
	fmovdpos	%icc,	%f13,	%f27
	edge8n	%g7,	%l2,	%i1
	edge16	%g1,	%l0,	%i5
	sdivcc	%i2,	0x13DB,	%l3
	movcs	%xcc,	%o5,	%g5
	stb	%o2,	[%l7 + 0x46]
	fmovdle	%xcc,	%f16,	%f5
	udivcc	%g3,	0x11BB,	%i7
	stb	%i6,	[%l7 + 0x3C]
	fcmpne16	%f12,	%f26,	%o6
	edge16	%i3,	%o7,	%g6
	fmovdn	%icc,	%f10,	%f2
	sdiv	%o3,	0x134D,	%l1
	orcc	%i4,	0x1539,	%o4
	sth	%g2,	[%l7 + 0x6E]
	fxors	%f13,	%f26,	%f30
	and	%l5,	%l6,	%o1
	ldsb	[%l7 + 0x09],	%g4
	edge8ln	%l4,	%o0,	%i0
	fornot1	%f26,	%f4,	%f10
	fnand	%f22,	%f8,	%f30
	addccc	%l2,	%g7,	%g1
	udiv	%i1,	0x05DB,	%i5
	movcc	%icc,	%l0,	%i2
	movvc	%icc,	%l3,	%g5
	sethi	0x1160,	%o5
	fmuld8ulx16	%f20,	%f28,	%f26
	movneg	%xcc,	%o2,	%g3
	edge32n	%i6,	%o6,	%i7
	popc	%i3,	%o7
	andncc	%o3,	%g6,	%l1
	fmovsge	%icc,	%f29,	%f7
	fnand	%f2,	%f10,	%f18
	subcc	%o4,	0x1574,	%g2
	movgu	%icc,	%i4,	%l5
	udivx	%l6,	0x1E1D,	%o1
	sir	0x06B5
	movre	%g4,	0x2BD,	%l4
	movrne	%i0,	0x0E4,	%o0
	movg	%icc,	%l2,	%g1
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	udiv	%l0,	0x1E21,	%i2
	sdivx	%g5,	0x1BEF,	%o5
	restore %o2, 0x0478, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l3,	%o6,	%i6
	movne	%xcc,	%i7,	%o7
	subcc	%i3,	0x1C2B,	%o3
	srax	%g6,	0x09,	%l1
	andncc	%o4,	%g2,	%l5
	srax	%l6,	%o1,	%i4
	fmovde	%xcc,	%f27,	%f30
	fmovs	%f7,	%f15
	bshuffle	%f0,	%f22,	%f22
	fmovrdne	%l4,	%f10,	%f26
	movleu	%icc,	%i0,	%o0
	edge16n	%g4,	%l2,	%g7
	edge32n	%g1,	%i5,	%l0
	fmovdl	%icc,	%f10,	%f20
	move	%xcc,	%i2,	%i1
	alignaddrl	%o5,	%o2,	%g5
	movrgez	%g3,	%l3,	%i6
	movg	%xcc,	%o6,	%o7
	subccc	%i3,	%i7,	%g6
	fpack32	%f18,	%f0,	%f30
	sth	%o3,	[%l7 + 0x12]
	st	%f19,	[%l7 + 0x20]
	umulcc	%o4,	0x0BA5,	%g2
	ldd	[%l7 + 0x30],	%l0
	fpsub32s	%f25,	%f12,	%f13
	lduh	[%l7 + 0x56],	%l5
	movre	%o1,	0x06E,	%i4
	edge16n	%l6,	%i0,	%o0
	xnorcc	%l4,	%l2,	%g4
	edge8l	%g1,	%i5,	%g7
	addccc	%i2,	0x1C69,	%i1
	orn	%l0,	0x16BE,	%o5
	movleu	%xcc,	%g5,	%o2
	edge8n	%l3,	%g3,	%o6
	fones	%f10
	movleu	%icc,	%o7,	%i6
	fmovdge	%icc,	%f10,	%f5
	srl	%i3,	0x0D,	%g6
	sth	%o3,	[%l7 + 0x4A]
	sth	%i7,	[%l7 + 0x08]
	movpos	%icc,	%o4,	%g2
	xnorcc	%l1,	%o1,	%l5
	udivx	%l6,	0x1AEE,	%i0
	nop
	set	0x48, %o3
	stw	%i4,	[%l7 + %o3]
	udivx	%o0,	0x00FF,	%l2
	movle	%xcc,	%l4,	%g1
	edge32	%i5,	%g4,	%i2
	stw	%i1,	[%l7 + 0x40]
	addcc	%g7,	0x131B,	%o5
	movne	%xcc,	%l0,	%g5
	smulcc	%o2,	%g3,	%o6
	fmovsgu	%icc,	%f19,	%f29
	ldsb	[%l7 + 0x25],	%o7
	movpos	%icc,	%i6,	%i3
	fmovsne	%xcc,	%f26,	%f20
	umul	%l3,	0x020B,	%o3
	xnor	%i7,	%o4,	%g2
	movre	%l1,	0x027,	%o1
	movn	%xcc,	%l5,	%l6
	xnorcc	%g6,	%i0,	%o0
	edge32ln	%i4,	%l2,	%l4
	fpmerge	%f7,	%f15,	%f6
	lduw	[%l7 + 0x74],	%g1
	edge16l	%g4,	%i2,	%i5
	stb	%g7,	[%l7 + 0x30]
	lduh	[%l7 + 0x26],	%i1
	fmovdle	%xcc,	%f10,	%f0
	lduh	[%l7 + 0x38],	%o5
	mova	%xcc,	%l0,	%g5
	std	%f14,	[%l7 + 0x18]
	movl	%xcc,	%o2,	%g3
	alignaddr	%o6,	%o7,	%i6
	fcmps	%fcc0,	%f7,	%f19
	fcmped	%fcc2,	%f8,	%f8
	sth	%l3,	[%l7 + 0x0A]
	sethi	0x132A,	%o3
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	fabss	%f24,	%f26
	stx	%o4,	[%l7 + 0x60]
	fmovsneg	%icc,	%f7,	%f14
	fmovdg	%icc,	%f14,	%f4
	fabss	%f19,	%f3
	smulcc	%l1,	0x19F5,	%g2
	movne	%icc,	%o1,	%l5
	sth	%l6,	[%l7 + 0x4A]
	lduh	[%l7 + 0x5E],	%i0
	fmovdcc	%xcc,	%f8,	%f6
	fmovrdne	%o0,	%f28,	%f26
	fsrc2s	%f30,	%f22
	mulx	%g6,	0x1461,	%l2
	and	%l4,	%i4,	%g1
	nop
	set	0x4C, %i4
	ldsh	[%l7 + %i4],	%g4
	edge32l	%i2,	%i5,	%i1
	sra	%o5,	0x1C,	%l0
	subc	%g7,	%g5,	%o2
	sethi	0x0C96,	%o6
	fmovdcc	%icc,	%f8,	%f9
	fmovs	%f7,	%f14
	or	%o7,	0x0BAD,	%i6
	fsrc1s	%f21,	%f31
	edge32	%g3,	%o3,	%i7
	mulscc	%l3,	%o4,	%i3
	fpsub32	%f2,	%f0,	%f12
	alignaddrl	%g2,	%l1,	%l5
	addc	%o1,	0x015D,	%l6
	fsrc1s	%f15,	%f26
	andcc	%i0,	%o0,	%g6
	array32	%l4,	%i4,	%g1
	smulcc	%l2,	%i2,	%i5
	srlx	%i1,	0x08,	%g4
	xnorcc	%l0,	0x180C,	%o5
	nop
	set	0x32, %g6
	ldsh	[%l7 + %g6],	%g7
	movneg	%xcc,	%o2,	%o6
	lduh	[%l7 + 0x52],	%o7
	fmovrslez	%g5,	%f18,	%f16
	fmul8x16	%f26,	%f18,	%f28
	sethi	0x1953,	%g3
	fmuld8sux16	%f1,	%f4,	%f12
	andncc	%i6,	%i7,	%l3
	move	%xcc,	%o3,	%o4
	fones	%f17
	umulcc	%i3,	0x11C9,	%l1
	fmovsneg	%xcc,	%f24,	%f1
	srl	%g2,	0x19,	%o1
	sir	0x1295
	fmovs	%f7,	%f25
	smul	%l6,	%l5,	%o0
	movn	%xcc,	%g6,	%l4
	ldub	[%l7 + 0x0F],	%i4
	andncc	%i0,	%g1,	%l2
	movre	%i5,	0x102,	%i1
	fandnot1s	%f15,	%f23,	%f6
	movle	%icc,	%g4,	%i2
	fmovrdlz	%o5,	%f12,	%f16
	fmovrdlez	%l0,	%f8,	%f2
	ldd	[%l7 + 0x20],	%g6
	fnot2s	%f9,	%f9
	alignaddr	%o6,	%o7,	%o2
	fxnor	%f22,	%f0,	%f12
	or	%g5,	%i6,	%g3
	movrgez	%i7,	%o3,	%l3
	fzero	%f8
	ld	[%l7 + 0x28],	%f11
	andn	%i3,	%l1,	%g2
	edge32n	%o4,	%l6,	%o1
	movneg	%xcc,	%o0,	%g6
	orcc	%l5,	0x0A33,	%l4
	movrgez	%i0,	0x182,	%i4
	movgu	%icc,	%g1,	%l2
	stx	%i5,	[%l7 + 0x18]
	array8	%i1,	%i2,	%o5
	andncc	%g4,	%g7,	%o6
	fornot2	%f12,	%f8,	%f2
	umul	%l0,	0x0667,	%o2
	addc	%g5,	0x0616,	%o7
	sll	%g3,	0x11,	%i6
	alignaddr	%i7,	%l3,	%i3
	edge8l	%l1,	%g2,	%o4
	movrgez	%l6,	%o1,	%o0
	andcc	%o3,	0x0B4C,	%g6
	subcc	%l5,	0x02C5,	%i0
	movg	%xcc,	%i4,	%l4
	mova	%icc,	%l2,	%i5
	movge	%xcc,	%i1,	%g1
	movvs	%xcc,	%o5,	%i2
	ldsw	[%l7 + 0x28],	%g4
	movrlz	%g7,	0x2A8,	%l0
	smulcc	%o6,	%g5,	%o2
	srl	%o7,	%i6,	%g3
	edge32l	%l3,	%i3,	%i7
	movge	%icc,	%g2,	%l1
	edge8n	%l6,	%o4,	%o1
	movgu	%icc,	%o0,	%o3
	movn	%xcc,	%g6,	%l5
	movneg	%xcc,	%i4,	%i0
	orn	%l4,	%i5,	%i1
	srl	%g1,	0x0C,	%o5
	ldx	[%l7 + 0x58],	%l2
	nop
	set	0x60, %g1
	lduw	[%l7 + %g1],	%g4
	fcmped	%fcc0,	%f2,	%f20
	smul	%i2,	%g7,	%l0
	movneg	%icc,	%g5,	%o2
	fzero	%f6
	edge16l	%o6,	%o7,	%g3
	addccc	%l3,	0x0700,	%i6
	sll	%i3,	0x19,	%g2
	edge16l	%l1,	%l6,	%o4
	fmovdcs	%icc,	%f29,	%f2
	orcc	%o1,	%i7,	%o3
	mulscc	%o0,	%l5,	%i4
	fnot2s	%f9,	%f7
	subccc	%g6,	0x09AA,	%l4
	alignaddr	%i0,	%i1,	%i5
	stx	%o5,	[%l7 + 0x28]
	fmovscs	%xcc,	%f21,	%f26
	fandnot1	%f4,	%f12,	%f6
	ldsb	[%l7 + 0x0E],	%g1
	subc	%g4,	0x11F5,	%l2
	fmul8ulx16	%f20,	%f16,	%f16
	fmovdneg	%icc,	%f20,	%f2
	stx	%g7,	[%l7 + 0x58]
	sdivcc	%i2,	0x1AC2,	%l0
	st	%f4,	[%l7 + 0x74]
	popc	%g5,	%o2
	movge	%xcc,	%o7,	%o6
	edge32	%g3,	%i6,	%l3
	fmul8x16au	%f1,	%f28,	%f18
	nop
	set	0x08, %i0
	ldd	[%l7 + %i0],	%i2
	edge8ln	%l1,	%g2,	%l6
	xor	%o1,	0x1668,	%i7
	alignaddrl	%o4,	%o3,	%o0
	movcc	%icc,	%i4,	%g6
	udivcc	%l4,	0x1FDF,	%i0
	fnegd	%f30,	%f0
	srax	%i1,	0x00,	%l5
	ld	[%l7 + 0x08],	%f30
	edge8n	%i5,	%g1,	%o5
	ldub	[%l7 + 0x1A],	%l2
	movleu	%icc,	%g7,	%g4
	array8	%i2,	%g5,	%o2
	sll	%o7,	0x0C,	%l0
	mova	%icc,	%o6,	%i6
	movvc	%icc,	%g3,	%l3
	array8	%l1,	%g2,	%l6
	sllx	%i3,	0x0D,	%i7
	addccc	%o4,	0x1DB1,	%o3
	orcc	%o0,	%o1,	%g6
	edge16l	%l4,	%i4,	%i0
	sra	%i1,	%l5,	%g1
	fands	%f5,	%f30,	%f30
	alignaddrl	%o5,	%i5,	%g7
	ld	[%l7 + 0x48],	%f15
	fpadd32	%f8,	%f20,	%f28
	orn	%l2,	0x04C7,	%i2
	save %g4, 0x11AB, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack32	%f18,	%f12,	%f20
	mulscc	%o2,	%o7,	%o6
	ldd	[%l7 + 0x68],	%l0
	fmul8x16au	%f10,	%f9,	%f14
	subccc	%g3,	0x0A42,	%i6
	pdist	%f12,	%f0,	%f2
	xor	%l3,	0x0E97,	%g2
	and	%l6,	0x129E,	%l1
	subc	%i3,	0x059A,	%o4
	fmul8sux16	%f0,	%f28,	%f8
	ldsh	[%l7 + 0x52],	%o3
	movleu	%xcc,	%i7,	%o1
	edge16ln	%g6,	%o0,	%i4
	alignaddrl	%l4,	%i0,	%i1
	movvs	%icc,	%g1,	%o5
	stb	%i5,	[%l7 + 0x16]
	movrlez	%l5,	%g7,	%i2
	movg	%xcc,	%g4,	%g5
	movne	%icc,	%o2,	%l2
	andcc	%o7,	0x11B1,	%l0
	movrgez	%g3,	0x19D,	%o6
	subccc	%l3,	%g2,	%l6
	fmovsge	%icc,	%f5,	%f20
	xnorcc	%l1,	0x0974,	%i6
	fmovdg	%xcc,	%f15,	%f3
	xnor	%o4,	%i3,	%o3
	movgu	%xcc,	%i7,	%o1
	xnor	%g6,	0x1D5D,	%o0
	alignaddr	%i4,	%l4,	%i0
	fcmped	%fcc3,	%f30,	%f26
	fzero	%f22
	array16	%i1,	%g1,	%i5
	movg	%icc,	%l5,	%g7
	fmul8sux16	%f16,	%f2,	%f30
	udiv	%o5,	0x18CA,	%g4
	stw	%g5,	[%l7 + 0x30]
	movrlz	%o2,	0x324,	%l2
	fmovscc	%icc,	%f17,	%f14
	srl	%i2,	%l0,	%o7
	udivcc	%o6,	0x1060,	%l3
	subcc	%g3,	%g2,	%l6
	lduw	[%l7 + 0x28],	%i6
	fpsub32s	%f30,	%f15,	%f13
	fcmpes	%fcc3,	%f9,	%f31
	movpos	%xcc,	%l1,	%o4
	udivx	%o3,	0x05CE,	%i7
	edge16	%o1,	%g6,	%o0
	movgu	%xcc,	%i3,	%i4
	fnot1s	%f20,	%f2
	addcc	%l4,	0x1892,	%i1
	movn	%xcc,	%i0,	%i5
	fmovsvs	%icc,	%f22,	%f31
	move	%icc,	%l5,	%g1
	edge16ln	%g7,	%g4,	%o5
	movcs	%icc,	%o2,	%g5
	ldsw	[%l7 + 0x20],	%i2
	movcc	%icc,	%l2,	%l0
	restore %o6, 0x1C42, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l3,	0x1A80,	%g3
	std	%f18,	[%l7 + 0x38]
	ldd	[%l7 + 0x48],	%f30
	std	%f28,	[%l7 + 0x50]
	or	%g2,	%i6,	%l6
	movre	%o4,	0x3BA,	%o3
	fmovsge	%icc,	%f6,	%f20
	lduh	[%l7 + 0x40],	%l1
	addccc	%i7,	0x18DF,	%o1
	ldsh	[%l7 + 0x24],	%o0
	movrne	%g6,	0x3DF,	%i3
	fpack32	%f2,	%f8,	%f20
	ldd	[%l7 + 0x20],	%f2
	ldsw	[%l7 + 0x58],	%i4
	ldd	[%l7 + 0x10],	%f0
	movleu	%icc,	%l4,	%i1
	movrne	%i0,	%l5,	%g1
	sdivcc	%g7,	0x1A7D,	%i5
	lduw	[%l7 + 0x5C],	%o5
	std	%f26,	[%l7 + 0x60]
	nop
	set	0x78, %o1
	std	%f28,	[%l7 + %o1]
	array8	%o2,	%g4,	%i2
	edge32l	%l2,	%l0,	%g5
	mova	%icc,	%o6,	%o7
	stb	%g3,	[%l7 + 0x5F]
	movrgz	%g2,	%i6,	%l6
	fmovsgu	%icc,	%f29,	%f9
	array8	%o4,	%o3,	%l3
	movrlz	%i7,	%l1,	%o1
	fcmpes	%fcc3,	%f24,	%f28
	fmovrslez	%o0,	%f23,	%f11
	sdivx	%i3,	0x14B6,	%g6
	array32	%l4,	%i4,	%i1
	movge	%icc,	%i0,	%g1
	addccc	%g7,	%l5,	%o5
	movg	%icc,	%o2,	%i5
	sdiv	%g4,	0x1632,	%i2
	movne	%xcc,	%l0,	%l2
	movle	%icc,	%o6,	%g5
	andn	%g3,	%g2,	%i6
	smulcc	%l6,	0x07DC,	%o7
	smul	%o3,	%o4,	%i7
	stw	%l3,	[%l7 + 0x18]
	fxnors	%f11,	%f30,	%f4
	xorcc	%l1,	%o0,	%o1
	fmovdge	%xcc,	%f8,	%f0
	and	%i3,	0x1D84,	%g6
	mulscc	%l4,	0x1775,	%i1
	save %i0, %g1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l5,	0x0CFC,	%o5
	orncc	%o2,	%i5,	%i4
	srlx	%g4,	%l0,	%l2
	smulcc	%o6,	0x0957,	%i2
	stw	%g3,	[%l7 + 0x14]
	fmul8sux16	%f4,	%f0,	%f8
	edge32ln	%g2,	%i6,	%g5
	smul	%l6,	0x1BB9,	%o7
	fmovdneg	%icc,	%f14,	%f28
	mova	%xcc,	%o3,	%i7
	fmovdl	%icc,	%f29,	%f23
	edge8ln	%o4,	%l1,	%o0
	addccc	%l3,	0x0780,	%o1
	movrlz	%i3,	%l4,	%i1
	or	%g6,	0x131D,	%g1
	andncc	%i0,	%g7,	%l5
	xnorcc	%o5,	0x100E,	%i5
	lduh	[%l7 + 0x68],	%i4
	movl	%icc,	%g4,	%o2
	addc	%l0,	%l2,	%i2
	srlx	%o6,	%g2,	%i6
	movcc	%icc,	%g5,	%g3
	movl	%xcc,	%l6,	%o7
	fornot1s	%f7,	%f20,	%f14
	movle	%xcc,	%o3,	%o4
	edge16ln	%i7,	%o0,	%l1
	fands	%f17,	%f20,	%f7
	array32	%o1,	%l3,	%i3
	sub	%i1,	%l4,	%g1
	sllx	%g6,	%i0,	%l5
	edge16n	%g7,	%i5,	%o5
	srax	%g4,	0x0C,	%i4
	ld	[%l7 + 0x50],	%f17
	movn	%xcc,	%o2,	%l2
	mova	%icc,	%l0,	%i2
	edge8	%o6,	%i6,	%g2
	orn	%g5,	%g3,	%l6
	movne	%xcc,	%o3,	%o7
	addccc	%i7,	%o4,	%l1
	movvc	%xcc,	%o0,	%l3
	srlx	%i3,	%o1,	%l4
	lduh	[%l7 + 0x72],	%g1
	fornot1	%f0,	%f8,	%f20
	addccc	%i1,	0x0DC8,	%i0
	ldsb	[%l7 + 0x1D],	%g6
	sdivcc	%g7,	0x1E73,	%l5
	fmovrsgez	%i5,	%f8,	%f30
	addcc	%o5,	0x08A1,	%g4
	movn	%xcc,	%o2,	%l2
	fcmped	%fcc1,	%f0,	%f20
	orn	%i4,	0x10AB,	%i2
	fsrc2	%f28,	%f22
	st	%f15,	[%l7 + 0x48]
	edge8l	%o6,	%l0,	%g2
	mulx	%g5,	0x0917,	%g3
	stb	%i6,	[%l7 + 0x0A]
	mulscc	%l6,	0x0A67,	%o7
	andcc	%o3,	0x081D,	%o4
	edge16	%l1,	%i7,	%l3
	movrgz	%o0,	%i3,	%o1
	movl	%icc,	%g1,	%l4
	fandnot2s	%f13,	%f23,	%f26
	sub	%i0,	0x1319,	%i1
	orncc	%g7,	%l5,	%g6
	fabss	%f8,	%f21
	movvc	%icc,	%i5,	%g4
	fcmpeq32	%f30,	%f10,	%o5
	sdivcc	%l2,	0x100D,	%o2
	mulscc	%i4,	0x01E1,	%o6
	sdiv	%i2,	0x16C5,	%g2
	fabss	%f8,	%f8
	ldsh	[%l7 + 0x1E],	%g5
	ldx	[%l7 + 0x58],	%l0
	movcs	%xcc,	%i6,	%l6
	nop
	set	0x78, %g5
	ldd	[%l7 + %g5],	%g2
	sdiv	%o7,	0x1CDE,	%o4
	sethi	0x124A,	%o3
	edge8n	%l1,	%l3,	%o0
	edge16l	%i7,	%o1,	%i3
	sllx	%l4,	0x1A,	%i0
	edge16n	%i1,	%g1,	%g7
	edge8	%g6,	%l5,	%i5
	srlx	%g4,	%l2,	%o2
	fands	%f13,	%f25,	%f3
	array8	%o5,	%i4,	%i2
	fmovrdne	%g2,	%f28,	%f6
	umul	%o6,	%g5,	%l0
	sllx	%i6,	0x0E,	%g3
	fmovsgu	%xcc,	%f8,	%f12
	movrlz	%l6,	%o4,	%o3
	movge	%icc,	%l1,	%o7
	xor	%o0,	%l3,	%i7
	smul	%o1,	%i3,	%l4
	edge32ln	%i0,	%i1,	%g7
	alignaddrl	%g6,	%l5,	%i5
	fmovs	%f9,	%f2
	alignaddr	%g4,	%l2,	%o2
	fpsub16s	%f10,	%f26,	%f9
	alignaddr	%o5,	%i4,	%g1
	fmovdvs	%icc,	%f30,	%f12
	move	%xcc,	%g2,	%o6
	movvc	%icc,	%g5,	%i2
	srl	%l0,	0x18,	%i6
	srlx	%l6,	%o4,	%g3
	fnot1s	%f20,	%f8
	mulx	%o3,	%o7,	%o0
	ldsh	[%l7 + 0x5A],	%l3
	ldub	[%l7 + 0x5A],	%l1
	edge8n	%o1,	%i3,	%i7
	ldd	[%l7 + 0x18],	%l4
	fcmped	%fcc1,	%f12,	%f0
	movleu	%icc,	%i1,	%g7
	movvs	%icc,	%g6,	%i0
	movpos	%xcc,	%l5,	%i5
	fmovdgu	%xcc,	%f9,	%f16
	orncc	%g4,	0x0F9E,	%l2
	ldsb	[%l7 + 0x37],	%o5
	popc	0x0D61,	%i4
	edge32n	%g1,	%o2,	%o6
	sdiv	%g5,	0x198D,	%i2
	srlx	%g2,	0x04,	%i6
	orn	%l0,	%o4,	%l6
	nop
	set	0x78, %l3
	stx	%o3,	[%l7 + %l3]
	movrgz	%g3,	%o7,	%l3
	srl	%l1,	%o1,	%o0
	subcc	%i7,	%i3,	%i1
	edge16n	%g7,	%l4,	%i0
	array32	%l5,	%g6,	%i5
	umulcc	%g4,	%l2,	%i4
	array8	%o5,	%g1,	%o6
	stb	%o2,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%i2
	sir	0x11DF
	ldd	[%l7 + 0x30],	%f10
	sllx	%g5,	%g2,	%i6
	movge	%xcc,	%o4,	%l6
	udivcc	%l0,	0x1A49,	%o3
	fmovdpos	%xcc,	%f4,	%f12
	mulscc	%o7,	0x15ED,	%l3
	movrlz	%l1,	%g3,	%o1
	orncc	%i7,	%o0,	%i3
	sethi	0x1E37,	%g7
	lduw	[%l7 + 0x28],	%l4
	fnor	%f28,	%f6,	%f4
	stb	%i0,	[%l7 + 0x64]
	ld	[%l7 + 0x40],	%f29
	movcc	%xcc,	%l5,	%g6
	movvs	%icc,	%i1,	%i5
	movge	%xcc,	%g4,	%i4
	movrne	%o5,	%l2,	%o6
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	lduh	[%l7 + 0x44],	%g2
	fnor	%f24,	%f0,	%f6
	fpadd32s	%f27,	%f12,	%f10
	save %i6, 0x0018, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l6, 0x18EF, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f6,	%f28
	srl	%o3,	%l0,	%l3
	fmovrde	%o7,	%f28,	%f0
	edge8l	%g3,	%l1,	%o1
	smulcc	%o0,	0x0E1A,	%i3
	fnot1s	%f24,	%f29
	fnegd	%f10,	%f6
	fmovda	%icc,	%f9,	%f30
	array16	%i7,	%l4,	%g7
	mulscc	%l5,	0x120F,	%g6
	fmovdge	%xcc,	%f7,	%f6
	smulcc	%i0,	%i1,	%g4
	sll	%i5,	%i4,	%o5
	mova	%icc,	%o6,	%o2
	alignaddrl	%g1,	%l2,	%g5
	xorcc	%i6,	0x1FB6,	%i2
	fmovsn	%icc,	%f14,	%f12
	addccc	%l6,	0x0734,	%g2
	movre	%o3,	0x2F6,	%o4
	ldsb	[%l7 + 0x44],	%l3
	movrne	%l0,	%g3,	%l1
	fpackfix	%f30,	%f9
	movrgz	%o1,	%o7,	%o0
	orncc	%i3,	%i7,	%g7
	fsrc1s	%f11,	%f6
	ldd	[%l7 + 0x70],	%l4
	std	%f24,	[%l7 + 0x40]
	edge8	%l5,	%i0,	%i1
	stx	%g4,	[%l7 + 0x18]
	edge16	%g6,	%i4,	%i5
	lduh	[%l7 + 0x62],	%o5
	sir	0x05BE
	sdiv	%o2,	0x0302,	%o6
	movcs	%icc,	%g1,	%g5
	fornot1	%f10,	%f14,	%f14
	fpsub16	%f12,	%f12,	%f2
	sdivcc	%l2,	0x0B85,	%i6
	udivx	%l6,	0x1350,	%i2
	stb	%g2,	[%l7 + 0x63]
	edge8n	%o4,	%o3,	%l0
	nop
	set	0x48, %l6
	stx	%l3,	[%l7 + %l6]
	alignaddr	%g3,	%o1,	%l1
	sra	%o0,	%i3,	%i7
	fone	%f14
	restore %o7, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%i0,	%g7
	fcmpgt32	%f2,	%f4,	%i1
	fmuld8ulx16	%f19,	%f17,	%f28
	mulscc	%g4,	%g6,	%i5
	fmovrsgez	%o5,	%f24,	%f26
	edge8ln	%o2,	%o6,	%i4
	fnot1	%f20,	%f0
	edge16ln	%g5,	%l2,	%g1
	andcc	%i6,	%i2,	%g2
	orncc	%l6,	%o4,	%o3
	movne	%icc,	%l3,	%l0
	xnor	%o1,	0x1AB0,	%g3
	ldub	[%l7 + 0x18],	%l1
	umulcc	%i3,	0x1B69,	%o0
	fmovdcc	%xcc,	%f28,	%f26
	fandnot2	%f24,	%f0,	%f14
	ldsw	[%l7 + 0x10],	%o7
	fmovsne	%icc,	%f31,	%f25
	fmovrdlz	%i7,	%f6,	%f20
	fmovsvs	%icc,	%f8,	%f25
	orncc	%l5,	%l4,	%i0
	ldx	[%l7 + 0x60],	%i1
	nop
	set	0x1B, %g3
	stb	%g7,	[%l7 + %g3]
	andncc	%g6,	%g4,	%i5
	stx	%o5,	[%l7 + 0x68]
	ldx	[%l7 + 0x68],	%o6
	sll	%o2,	%g5,	%l2
	orn	%i4,	0x03F2,	%i6
	udivcc	%g1,	0x1030,	%g2
	movl	%xcc,	%l6,	%i2
	fnegd	%f6,	%f14
	movneg	%icc,	%o4,	%l3
	movne	%xcc,	%l0,	%o3
	fmovrse	%g3,	%f29,	%f5
	stw	%l1,	[%l7 + 0x44]
	add	%i3,	0x1AA5,	%o0
	edge32n	%o7,	%i7,	%o1
	fmovs	%f19,	%f6
	popc	0x1BC9,	%l4
	orn	%l5,	0x0BA9,	%i1
	movn	%icc,	%g7,	%i0
	movrgez	%g4,	0x071,	%i5
	movge	%xcc,	%g6,	%o5
	smulcc	%o2,	%o6,	%l2
	stw	%g5,	[%l7 + 0x4C]
	xnor	%i4,	0x059B,	%g1
	movneg	%xcc,	%g2,	%l6
	and	%i6,	%i2,	%o4
	fones	%f28
	ldsh	[%l7 + 0x16],	%l3
	orcc	%o3,	%l0,	%g3
	save %i3, 0x0062, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%o7,	%o0,	%o1
	edge8ln	%i7,	%l5,	%l4
	and	%i1,	0x1366,	%i0
	xor	%g4,	%i5,	%g6
	edge16	%o5,	%g7,	%o2
	ldub	[%l7 + 0x10],	%l2
	subcc	%o6,	%i4,	%g1
	ld	[%l7 + 0x70],	%f20
	movcc	%xcc,	%g2,	%l6
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	fmovdne	%xcc,	%f25,	%f12
	std	%f8,	[%l7 + 0x10]
	movvs	%xcc,	%i2,	%o4
	fzeros	%f19
	xor	%o3,	0x1362,	%l3
	fmovrsgz	%g3,	%f8,	%f15
	orcc	%l0,	0x1A47,	%i3
	addccc	%l1,	%o7,	%o1
	subcc	%i7,	%o0,	%l5
	and	%l4,	%i1,	%i0
	sth	%g4,	[%l7 + 0x36]
	fmovsge	%xcc,	%f26,	%f0
	edge8ln	%i5,	%g6,	%g7
	fzero	%f24
	addcc	%o5,	%l2,	%o2
	fandnot1	%f18,	%f30,	%f10
	movrne	%o6,	%i4,	%g2
	movgu	%icc,	%l6,	%g1
	st	%f12,	[%l7 + 0x7C]
	ldd	[%l7 + 0x18],	%f10
	addc	%g5,	%i2,	%i6
	mova	%xcc,	%o4,	%l3
	fmovs	%f11,	%f17
	movgu	%xcc,	%o3,	%g3
	array16	%i3,	%l1,	%l0
	edge16	%o1,	%i7,	%o0
	sub	%l5,	%l4,	%o7
	sethi	0x09BD,	%i0
	nop
	set	0x3B, %o7
	ldub	[%l7 + %o7],	%g4
	movleu	%xcc,	%i1,	%i5
	andn	%g7,	%g6,	%l2
	udivcc	%o2,	0x0B6C,	%o5
	andcc	%i4,	0x1943,	%o6
	srl	%g2,	%g1,	%l6
	umul	%i2,	0x1613,	%g5
	umulcc	%o4,	0x1F24,	%i6
	ldsh	[%l7 + 0x52],	%l3
	movg	%xcc,	%o3,	%i3
	edge32l	%g3,	%l1,	%o1
	fones	%f20
	movcs	%icc,	%i7,	%l0
	and	%o0,	0x0E5C,	%l5
	fmovda	%icc,	%f24,	%f3
	andcc	%o7,	%i0,	%l4
	fpack16	%f0,	%f14
	array16	%i1,	%g4,	%g7
	movrlz	%i5,	0x302,	%g6
	lduh	[%l7 + 0x70],	%l2
	ldsh	[%l7 + 0x28],	%o2
	subcc	%o5,	0x054A,	%i4
	movrlz	%g2,	0x091,	%g1
	sra	%l6,	0x16,	%i2
	fmovdcs	%xcc,	%f14,	%f7
	movcs	%icc,	%g5,	%o4
	fmovdl	%icc,	%f4,	%f5
	sub	%i6,	%o6,	%l3
	restore %o3, %g3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%o1,	%l1,	%l0
	array8	%i7,	%o0,	%l5
	siam	0x1
	sir	0x0964
	movge	%icc,	%o7,	%l4
	add	%i0,	%i1,	%g7
	lduh	[%l7 + 0x56],	%g4
	fnot1	%f26,	%f14
	array32	%i5,	%l2,	%o2
	popc	%g6,	%o5
	movrne	%i4,	0x027,	%g2
	array8	%g1,	%l6,	%i2
	umul	%g5,	0x0952,	%i6
	stb	%o4,	[%l7 + 0x5D]
	std	%f18,	[%l7 + 0x10]
	fmovsleu	%xcc,	%f22,	%f24
	fpsub16s	%f26,	%f25,	%f12
	fone	%f0
	subccc	%o6,	%o3,	%g3
	movvs	%xcc,	%l3,	%o1
	fmovdle	%xcc,	%f26,	%f10
	movleu	%icc,	%l1,	%i3
	udiv	%i7,	0x195F,	%l0
	movvs	%xcc,	%l5,	%o7
	edge32n	%o0,	%i0,	%l4
	movl	%icc,	%i1,	%g7
	fmovsleu	%icc,	%f31,	%f24
	edge32ln	%g4,	%i5,	%l2
	sdiv	%g6,	0x0622,	%o2
	sllx	%i4,	0x13,	%o5
	fmovdge	%xcc,	%f17,	%f24
	subccc	%g2,	0x1328,	%g1
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	srlx	%o4,	0x19,	%o6
	ldsh	[%l7 + 0x12],	%o3
	addccc	%g3,	0x1009,	%g5
	addc	%l3,	0x03D8,	%o1
	smul	%l1,	0x1757,	%i7
	smulcc	%i3,	0x1A20,	%l0
	subcc	%l5,	0x0F50,	%o7
	array16	%o0,	%i0,	%i1
	orcc	%l4,	0x0251,	%g7
	movrgez	%i5,	%l2,	%g6
	fornot2	%f30,	%f16,	%f26
	movre	%g4,	%i4,	%o2
	addc	%o5,	0x175F,	%g2
	andncc	%i2,	%g1,	%i6
	andcc	%o4,	0x19BC,	%o6
	or	%o3,	%g3,	%g5
	movre	%l6,	%o1,	%l1
	fmovdvc	%icc,	%f23,	%f18
	edge8n	%i7,	%i3,	%l3
	ldsw	[%l7 + 0x5C],	%l5
	move	%icc,	%l0,	%o0
	popc	0x0C93,	%o7
	movg	%icc,	%i1,	%l4
	popc	0x10F1,	%i0
	popc	%g7,	%i5
	sllx	%l2,	0x1B,	%g4
	edge8l	%g6,	%o2,	%i4
	fmovdle	%icc,	%f25,	%f3
	edge16n	%g2,	%i2,	%g1
	fmovdpos	%xcc,	%f8,	%f2
	lduw	[%l7 + 0x30],	%o5
	save %o4, %i6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o3,	%g5,	%l6
	fpsub16	%f30,	%f18,	%f0
	ldub	[%l7 + 0x0A],	%o1
	sub	%l1,	0x00EE,	%i7
	edge16l	%g3,	%i3,	%l3
	movl	%xcc,	%l5,	%o0
	fands	%f27,	%f20,	%f6
	sra	%o7,	0x01,	%l0
	fmovrsgez	%i1,	%f6,	%f5
	fxnors	%f15,	%f6,	%f0
	stw	%l4,	[%l7 + 0x1C]
	addccc	%g7,	0x114D,	%i5
	xnor	%i0,	0x1EF9,	%l2
	xorcc	%g6,	0x04BB,	%o2
	xnorcc	%g4,	0x1D69,	%g2
	alignaddrl	%i2,	%g1,	%i4
	stx	%o4,	[%l7 + 0x68]
	alignaddr	%i6,	%o6,	%o3
	sir	0x109E
	movleu	%xcc,	%o5,	%g5
	mulscc	%l6,	0x0DBB,	%l1
	fmovdvc	%xcc,	%f19,	%f19
	sethi	0x1AEB,	%o1
	move	%icc,	%i7,	%i3
	array16	%g3,	%l3,	%l5
	smul	%o0,	%l0,	%i1
	udivx	%o7,	0x0068,	%l4
	fmovd	%f18,	%f2
	subcc	%g7,	%i0,	%i5
	movrne	%g6,	%o2,	%g4
	fpsub32s	%f7,	%f26,	%f8
	std	%f28,	[%l7 + 0x38]
	srlx	%g2,	0x03,	%l2
	stb	%i2,	[%l7 + 0x41]
	fmovse	%xcc,	%f6,	%f29
	nop
	set	0x20, %g2
	stw	%g1,	[%l7 + %g2]
	edge32n	%i4,	%i6,	%o6
	sdiv	%o4,	0x03B0,	%o3
	movrlz	%o5,	0x0FB,	%g5
	or	%l1,	0x1A21,	%l6
	mulscc	%o1,	%i3,	%i7
	edge16ln	%g3,	%l5,	%l3
	orn	%o0,	%l0,	%o7
	std	%f4,	[%l7 + 0x48]
	fmovdvc	%icc,	%f18,	%f12
	edge32	%i1,	%l4,	%i0
	fabss	%f26,	%f29
	srax	%g7,	0x19,	%i5
	movcc	%icc,	%o2,	%g4
	fmovrdlez	%g6,	%f12,	%f0
	ldx	[%l7 + 0x08],	%g2
	edge8	%l2,	%g1,	%i2
	movvs	%icc,	%i6,	%o6
	fnors	%f19,	%f28,	%f31
	srl	%o4,	%o3,	%i4
	movrne	%g5,	0x32E,	%o5
	orn	%l1,	0x102E,	%o1
	movne	%icc,	%l6,	%i3
	orncc	%g3,	%i7,	%l3
	umulcc	%l5,	0x14CF,	%l0
	fcmpes	%fcc1,	%f4,	%f22
	fmovdvs	%xcc,	%f20,	%f29
	addcc	%o0,	%i1,	%l4
	xorcc	%i0,	%g7,	%i5
	sdivx	%o7,	0x0346,	%o2
	fexpand	%f23,	%f20
	popc	%g4,	%g2
	movre	%g6,	%l2,	%g1
	andncc	%i2,	%i6,	%o6
	alignaddr	%o4,	%o3,	%i4
	movrgz	%g5,	%l1,	%o5
	fcmpgt32	%f4,	%f2,	%o1
	andncc	%i3,	%l6,	%i7
	edge32	%g3,	%l5,	%l3
	ldd	[%l7 + 0x48],	%f30
	fmul8ulx16	%f20,	%f28,	%f22
	ldd	[%l7 + 0x40],	%o0
	edge16	%l0,	%l4,	%i0
	stx	%g7,	[%l7 + 0x08]
	save %i5, %o7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g4,	%g2,	%g6
	movneg	%xcc,	%o2,	%l2
	fandnot2s	%f18,	%f27,	%f23
	fpackfix	%f4,	%f17
	subcc	%g1,	%i6,	%o6
	sllx	%o4,	%o3,	%i2
	ldx	[%l7 + 0x60],	%g5
	st	%f29,	[%l7 + 0x08]
	fnegd	%f4,	%f18
	edge8	%l1,	%i4,	%o5
	ld	[%l7 + 0x78],	%f18
	fmovrsgez	%o1,	%f3,	%f20
	movgu	%icc,	%l6,	%i7
	mulx	%i3,	%l5,	%l3
	nop
	set	0x58, %l4
	std	%f12,	[%l7 + %l4]
	fmovdpos	%xcc,	%f12,	%f16
	movrgz	%g3,	%l0,	%l4
	lduh	[%l7 + 0x40],	%i0
	xorcc	%g7,	%o0,	%o7
	fnegs	%f30,	%f20
	fmovrdgez	%i5,	%f0,	%f8
	mova	%icc,	%i1,	%g4
	fones	%f2
	fornot2	%f8,	%f20,	%f20
	udivcc	%g6,	0x0800,	%g2
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%l2
	orn	%g1,	%o2,	%i6
	edge16ln	%o6,	%o4,	%i2
	xnor	%o3,	0x1700,	%g5
	popc	%l1,	%o5
	sth	%i4,	[%l7 + 0x1A]
	fpsub32s	%f1,	%f23,	%f20
	udivx	%l6,	0x013E,	%o1
	xorcc	%i7,	%l5,	%l3
	sir	0x1B68
	movpos	%icc,	%i3,	%l0
	fands	%f7,	%f15,	%f6
	udivx	%g3,	0x1D33,	%l4
	movpos	%icc,	%g7,	%i0
	movneg	%icc,	%o0,	%i5
	fmovdge	%xcc,	%f20,	%f3
	sethi	0x1CD0,	%i1
	ldx	[%l7 + 0x38],	%o7
	movneg	%icc,	%g4,	%g2
	fpsub16	%f6,	%f28,	%f10
	edge32l	%g6,	%g1,	%o2
	lduh	[%l7 + 0x08],	%i6
	fnand	%f6,	%f26,	%f0
	movgu	%xcc,	%o6,	%l2
	std	%f10,	[%l7 + 0x18]
	subc	%o4,	0x050B,	%o3
	sdiv	%g5,	0x0B41,	%l1
	movrne	%i2,	0x24F,	%o5
	edge16	%l6,	%o1,	%i4
	restore %l5, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l0,	%g3
	movgu	%icc,	%l4,	%i3
	fmul8x16al	%f18,	%f13,	%f14
	edge8l	%g7,	%o0,	%i0
	movcs	%xcc,	%i5,	%i1
	stx	%o7,	[%l7 + 0x68]
	srl	%g4,	%g2,	%g6
	movpos	%xcc,	%g1,	%o2
	fnot2s	%f5,	%f16
	movcs	%icc,	%o6,	%i6
	subccc	%l2,	%o4,	%g5
	lduh	[%l7 + 0x48],	%o3
	udiv	%l1,	0x1379,	%i2
	addccc	%l6,	0x11A8,	%o5
	alignaddrl	%o1,	%i4,	%i7
	fcmpgt16	%f16,	%f6,	%l3
	lduh	[%l7 + 0x5C],	%l0
	xnor	%l5,	%g3,	%i3
	udiv	%l4,	0x1E9A,	%o0
	fmovrdgez	%g7,	%f28,	%f22
	fmovsvs	%xcc,	%f31,	%f10
	movle	%icc,	%i5,	%i0
	smul	%i1,	%g4,	%o7
	movgu	%icc,	%g6,	%g2
	pdist	%f18,	%f20,	%f30
	edge32n	%o2,	%o6,	%i6
	movle	%icc,	%l2,	%g1
	movpos	%icc,	%o4,	%o3
	fmovdl	%xcc,	%f26,	%f20
	movrne	%l1,	%g5,	%l6
	fnegd	%f4,	%f4
	movge	%icc,	%i2,	%o1
	ldub	[%l7 + 0x6E],	%i4
	fmovdvs	%xcc,	%f6,	%f29
	movcs	%xcc,	%i7,	%o5
	subccc	%l3,	%l0,	%l5
	edge32n	%g3,	%l4,	%o0
	movge	%xcc,	%i3,	%i5
	addc	%g7,	0x0CB5,	%i0
	sub	%i1,	%o7,	%g6
	udiv	%g4,	0x09BA,	%o2
	umul	%g2,	%i6,	%l2
	sra	%g1,	0x0A,	%o4
	ldsw	[%l7 + 0x7C],	%o6
	andncc	%l1,	%g5,	%l6
	fmovrdgez	%o3,	%f2,	%f16
	fmovscc	%icc,	%f13,	%f25
	lduh	[%l7 + 0x6E],	%o1
	movvs	%xcc,	%i4,	%i7
	movleu	%icc,	%o5,	%i2
	andcc	%l0,	0x160B,	%l5
	fornot2s	%f19,	%f2,	%f17
	sethi	0x0CAD,	%g3
	fabsd	%f10,	%f16
	fpack16	%f18,	%f1
	fpadd16	%f22,	%f0,	%f30
	movg	%xcc,	%l4,	%l3
	movrlez	%i3,	0x3D8,	%i5
	movneg	%icc,	%g7,	%i0
	movvc	%icc,	%i1,	%o0
	movl	%icc,	%o7,	%g6
	fmul8x16	%f6,	%f8,	%f20
	edge8	%o2,	%g4,	%i6
	array32	%l2,	%g2,	%o4
	movre	%g1,	%o6,	%l1
	sth	%g5,	[%l7 + 0x54]
	movre	%o3,	%l6,	%o1
	edge8l	%i4,	%o5,	%i2
	srax	%l0,	%l5,	%g3
	sub	%l4,	%l3,	%i3
	movre	%i7,	0x09A,	%g7
	sth	%i5,	[%l7 + 0x3E]
	fmul8sux16	%f20,	%f4,	%f8
	fmovdg	%icc,	%f15,	%f11
	smulcc	%i1,	0x10EA,	%i0
	ldd	[%l7 + 0x48],	%f2
	fcmpeq32	%f10,	%f10,	%o7
	lduh	[%l7 + 0x46],	%g6
	movg	%xcc,	%o0,	%g4
	orcc	%o2,	%l2,	%g2
	fcmpes	%fcc1,	%f15,	%f14
	movne	%xcc,	%i6,	%g1
	umulcc	%o6,	%l1,	%o4
	movg	%xcc,	%o3,	%g5
	alignaddrl	%l6,	%o1,	%i4
	fandnot1	%f8,	%f18,	%f26
	ldsh	[%l7 + 0x20],	%o5
	fcmpeq16	%f12,	%f2,	%l0
	edge16n	%i2,	%g3,	%l4
	subcc	%l3,	0x1CBE,	%l5
	sth	%i7,	[%l7 + 0x50]
	xnorcc	%i3,	%g7,	%i5
	fmul8x16au	%f25,	%f27,	%f12
	orn	%i1,	%i0,	%o7
	sub	%g6,	%g4,	%o0
	edge32n	%o2,	%l2,	%g2
	stx	%g1,	[%l7 + 0x10]
	addccc	%i6,	0x1470,	%l1
	edge16l	%o6,	%o3,	%o4
	srl	%l6,	%g5,	%o1
	stb	%o5,	[%l7 + 0x17]
	sub	%l0,	0x0AB8,	%i2
	movrgz	%i4,	0x12C,	%l4
	fones	%f6
	fcmpeq32	%f10,	%f28,	%g3
	edge8n	%l5,	%i7,	%i3
	fsrc1	%f20,	%f20
	ldd	[%l7 + 0x38],	%l2
	movl	%icc,	%i5,	%g7
	orn	%i1,	%i0,	%o7
	ld	[%l7 + 0x6C],	%f14
	movneg	%xcc,	%g6,	%g4
	ldd	[%l7 + 0x48],	%f2
	movrgz	%o2,	0x334,	%l2
	move	%xcc,	%g2,	%g1
	fmovsgu	%icc,	%f30,	%f29
	ldx	[%l7 + 0x60],	%i6
	sir	0x1C1C
	stx	%o0,	[%l7 + 0x10]
	srl	%l1,	%o6,	%o3
	move	%xcc,	%l6,	%g5
	xnorcc	%o1,	0x19C6,	%o4
	fmovrse	%l0,	%f14,	%f7
	movge	%icc,	%o5,	%i2
	fmovs	%f25,	%f2
	ldd	[%l7 + 0x30],	%f8
	andncc	%l4,	%g3,	%i4
	fmovdpos	%xcc,	%f9,	%f17
	and	%l5,	0x12AA,	%i7
	movleu	%xcc,	%l3,	%i5
	sllx	%g7,	%i3,	%i1
	orcc	%o7,	0x13C9,	%g6
	ldub	[%l7 + 0x32],	%i0
	xor	%o2,	%g4,	%g2
	ldub	[%l7 + 0x4C],	%g1
	sdiv	%l2,	0x0452,	%o0
	sir	0x17EE
	alignaddrl	%i6,	%l1,	%o3
	fmovsvs	%icc,	%f14,	%f5
	st	%f1,	[%l7 + 0x38]
	subcc	%o6,	0x146B,	%g5
	udivx	%o1,	0x0BDD,	%o4
	xorcc	%l6,	0x00FD,	%l0
	andncc	%i2,	%l4,	%g3
	fmovscs	%xcc,	%f28,	%f1
	edge32n	%o5,	%i4,	%i7
	addccc	%l3,	%i5,	%l5
	or	%i3,	%g7,	%o7
	movvc	%icc,	%i1,	%i0
	movrgez	%g6,	%g4,	%o2
	udivcc	%g1,	0x172A,	%g2
	orcc	%l2,	0x08B8,	%o0
	lduh	[%l7 + 0x6A],	%l1
	xorcc	%o3,	%i6,	%o6
	fmovspos	%xcc,	%f12,	%f24
	edge8ln	%o1,	%g5,	%o4
	sth	%l6,	[%l7 + 0x3A]
	umulcc	%i2,	%l0,	%g3
	edge8ln	%o5,	%i4,	%i7
	udivcc	%l3,	0x1533,	%l4
	subc	%i5,	%l5,	%i3
	addc	%g7,	0x11DB,	%i1
	fabsd	%f10,	%f24
	addccc	%i0,	0x0969,	%o7
	stx	%g4,	[%l7 + 0x40]
	ldd	[%l7 + 0x68],	%f24
	srlx	%o2,	0x1F,	%g6
	andncc	%g1,	%g2,	%l2
	smulcc	%l1,	0x1152,	%o3
	or	%o0,	0x1824,	%o6
	or	%i6,	%o1,	%g5
	xor	%o4,	0x0D62,	%l6
	fxnors	%f1,	%f17,	%f30
	fnegd	%f26,	%f18
	movcs	%xcc,	%l0,	%i2
	addccc	%o5,	%g3,	%i4
	srl	%l3,	%l4,	%i5
	fabsd	%f0,	%f4
	mulx	%l5,	0x0851,	%i3
	movrgz	%g7,	%i7,	%i1
	smul	%o7,	%g4,	%i0
	edge32ln	%g6,	%o2,	%g1
	stb	%g2,	[%l7 + 0x75]
	umul	%l1,	%o3,	%o0
	addccc	%l2,	0x0ACC,	%o6
	sub	%o1,	0x0379,	%g5
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	stb	%l0,	[%l7 + 0x53]
	fornot2s	%f23,	%f28,	%f2
	srl	%i2,	%g3,	%i4
	fcmpeq16	%f14,	%f24,	%o5
	fmovsa	%xcc,	%f14,	%f27
	fpsub32	%f30,	%f14,	%f30
	fabss	%f17,	%f9
	ldsw	[%l7 + 0x68],	%l3
	alignaddr	%l4,	%l5,	%i5
	sll	%i3,	0x11,	%g7
	andcc	%i1,	0x13B0,	%o7
	edge8ln	%g4,	%i0,	%i7
	ldsh	[%l7 + 0x2E],	%o2
	mulx	%g1,	%g6,	%g2
	umulcc	%o3,	%l1,	%o0
	array8	%l2,	%o6,	%g5
	movvs	%icc,	%i6,	%o4
	movne	%icc,	%l6,	%o1
	fmovsle	%icc,	%f20,	%f7
	fmovdvs	%icc,	%f8,	%f26
	movrgez	%i2,	0x113,	%l0
	smulcc	%i4,	0x0AE2,	%o5
	nop
	set	0x28, %i2
	ldd	[%l7 + %i2],	%g2
	ldd	[%l7 + 0x30],	%l4
	orn	%l3,	%i5,	%l5
	edge8l	%g7,	%i3,	%o7
	sll	%g4,	0x10,	%i0
	array16	%i7,	%o2,	%i1
	orncc	%g1,	0x1B58,	%g2
	movvc	%icc,	%o3,	%l1
	fabsd	%f14,	%f28
	srlx	%g6,	0x08,	%o0
	fors	%f29,	%f0,	%f27
	sdiv	%l2,	0x1F39,	%g5
	array8	%i6,	%o4,	%o6
	save %l6, 0x1401, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i2,	0x2B3,	%i4
	edge8ln	%l0,	%g3,	%l4
	edge32l	%l3,	%i5,	%l5
	add	%o5,	0x1DB9,	%g7
	movpos	%icc,	%i3,	%o7
	subc	%g4,	%i0,	%i7
	fmovsge	%icc,	%f16,	%f0
	mulx	%i1,	%o2,	%g1
	array8	%o3,	%g2,	%g6
	nop
	set	0x5C, %l0
	sth	%o0,	[%l7 + %l0]
	xor	%l2,	%l1,	%i6
	movge	%icc,	%g5,	%o4
	movn	%icc,	%l6,	%o6
	movle	%xcc,	%i2,	%o1
	std	%f22,	[%l7 + 0x78]
	std	%f4,	[%l7 + 0x28]
	restore %i4, %g3, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l0,	0x0F,	%l3
	sllx	%l5,	%o5,	%i5
	lduh	[%l7 + 0x66],	%i3
	udivcc	%o7,	0x1DAD,	%g4
	subcc	%g7,	%i0,	%i7
	fpsub16	%f30,	%f20,	%f12
	st	%f10,	[%l7 + 0x20]
	addccc	%i1,	0x1AF4,	%g1
	add	%o2,	%g2,	%o3
	nop
	set	0x40, %l1
	lduh	[%l7 + %l1],	%g6
	movg	%icc,	%o0,	%l2
	stx	%l1,	[%l7 + 0x28]
	fmovsa	%xcc,	%f18,	%f14
	movrgz	%i6,	0x16A,	%g5
	ldsb	[%l7 + 0x50],	%o4
	fzero	%f30
	popc	%o6,	%i2
	fmovsne	%xcc,	%f22,	%f5
	edge8ln	%l6,	%o1,	%i4
	fcmped	%fcc3,	%f14,	%f0
	movrgez	%l4,	0x284,	%g3
	orcc	%l3,	%l5,	%l0
	fcmps	%fcc1,	%f24,	%f18
	and	%o5,	0x0D69,	%i5
	movrgez	%i3,	%g4,	%g7
	umulcc	%i0,	0x17CA,	%i7
	andncc	%i1,	%g1,	%o7
	edge32l	%g2,	%o3,	%o2
	udivx	%g6,	0x0A8C,	%o0
	std	%f16,	[%l7 + 0x20]
	movpos	%xcc,	%l1,	%i6
	edge8n	%g5,	%o4,	%l2
	udiv	%o6,	0x165C,	%l6
	sllx	%o1,	0x18,	%i2
	sdivx	%i4,	0x1684,	%l4
	ld	[%l7 + 0x40],	%f18
	fcmpgt32	%f0,	%f30,	%l3
	movn	%xcc,	%l5,	%g3
	orcc	%o5,	%l0,	%i5
	movcc	%xcc,	%i3,	%g4
	movre	%g7,	%i7,	%i0
	save %i1, 0x15ED, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g2,	0x12,	%o3
	sdivcc	%o2,	0x0A9F,	%g1
	fandnot2s	%f3,	%f28,	%f24
	or	%g6,	0x00F6,	%o0
	sra	%l1,	%g5,	%o4
	fpadd16s	%f20,	%f10,	%f8
	addccc	%i6,	%o6,	%l2
	fornot1	%f0,	%f4,	%f26
	edge8ln	%o1,	%i2,	%l6
	add	%l4,	0x1F7B,	%i4
	sdivcc	%l5,	0x0661,	%l3
	or	%o5,	%l0,	%g3
	udivx	%i3,	0x19BB,	%i5
	ldsb	[%l7 + 0x7C],	%g7
	edge8n	%g4,	%i7,	%i0
	edge32n	%i1,	%o7,	%g2
	movre	%o3,	0x0B6,	%o2
	fsrc2	%f10,	%f28
	orn	%g6,	0x0D05,	%o0
	edge16ln	%l1,	%g5,	%g1
	movcc	%xcc,	%i6,	%o4
	movvc	%xcc,	%l2,	%o1
	lduh	[%l7 + 0x0C],	%o6
	ld	[%l7 + 0x4C],	%f6
	fmul8x16au	%f0,	%f5,	%f20
	srl	%l6,	%l4,	%i2
	sdiv	%l5,	0x0313,	%i4
	sir	0x1B33
	smulcc	%o5,	0x1B12,	%l0
	andn	%g3,	0x080C,	%i3
	udivx	%l3,	0x0542,	%i5
	movpos	%xcc,	%g7,	%g4
	ldx	[%l7 + 0x58],	%i0
	addcc	%i1,	%o7,	%i7
	fmovdpos	%icc,	%f24,	%f12
	save %g2, %o3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g6,	%o0
	edge16	%l1,	%g5,	%i6
	smul	%o4,	%g1,	%o1
	move	%icc,	%o6,	%l2
	sub	%l6,	0x0878,	%l4
	edge8l	%l5,	%i2,	%o5
	xor	%i4,	%g3,	%i3
	subc	%l3,	%l0,	%i5
	movpos	%icc,	%g7,	%g4
	orncc	%i0,	%o7,	%i1
	fxor	%f30,	%f26,	%f0
	xnor	%i7,	%g2,	%o2
	fcmpgt16	%f4,	%f18,	%o3
	fmovdvc	%xcc,	%f27,	%f10
	movneg	%icc,	%o0,	%l1
	movge	%xcc,	%g5,	%g6
	fmovsneg	%icc,	%f22,	%f13
	fzero	%f6
	mova	%xcc,	%o4,	%i6
	ldub	[%l7 + 0x43],	%o1
	fornot2	%f0,	%f30,	%f18
	mulx	%o6,	%l2,	%g1
	stw	%l6,	[%l7 + 0x10]
	fmovdgu	%icc,	%f14,	%f30
	fpsub16s	%f6,	%f17,	%f9
	addc	%l5,	%i2,	%o5
	st	%f18,	[%l7 + 0x18]
	movcc	%icc,	%l4,	%g3
	edge32n	%i3,	%i4,	%l3
	orcc	%l0,	%i5,	%g7
	sra	%i0,	0x0E,	%o7
	umul	%i1,	%g4,	%g2
	edge8l	%o2,	%o3,	%i7
	movvc	%icc,	%l1,	%g5
	xor	%g6,	%o0,	%i6
	edge32l	%o4,	%o6,	%o1
	fandnot2	%f4,	%f10,	%f10
	ldsw	[%l7 + 0x2C],	%l2
	sdiv	%l6,	0x0AC3,	%g1
	ld	[%l7 + 0x74],	%f25
	udiv	%l5,	0x1652,	%o5
	ld	[%l7 + 0x3C],	%f16
	fpackfix	%f18,	%f12
	subccc	%i2,	%g3,	%i3
	udiv	%i4,	0x1D84,	%l3
	udivx	%l0,	0x1DC1,	%i5
	andn	%l4,	%i0,	%g7
	std	%f30,	[%l7 + 0x28]
	edge16n	%o7,	%i1,	%g4
	orcc	%o2,	0x0A0B,	%o3
	array32	%g2,	%i7,	%g5
	smul	%l1,	%o0,	%i6
	andncc	%g6,	%o6,	%o1
	edge32l	%l2,	%l6,	%g1
	array32	%o4,	%o5,	%l5
	fornot1s	%f8,	%f9,	%f27
	ldx	[%l7 + 0x70],	%g3
	movn	%icc,	%i2,	%i3
	movrlez	%i4,	0x38D,	%l0
	fmovdgu	%icc,	%f0,	%f19
	fcmpes	%fcc3,	%f31,	%f21
	ldd	[%l7 + 0x10],	%f12
	edge16l	%l3,	%i5,	%i0
	fmovsvs	%xcc,	%f0,	%f14
	addc	%l4,	%o7,	%g7
	or	%g4,	0x135A,	%i1
	save %o3, %g2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%g5,	%l1
	srax	%i7,	0x12,	%o0
	xor	%i6,	0x1E9F,	%g6
	movrgez	%o6,	0x126,	%o1
	edge8l	%l6,	%l2,	%g1
	fmovdneg	%xcc,	%f28,	%f15
	movrgz	%o5,	0x025,	%o4
	array8	%l5,	%g3,	%i3
	fand	%f22,	%f18,	%f14
	ldsh	[%l7 + 0x34],	%i2
	fmul8x16	%f17,	%f22,	%f18
	addccc	%l0,	0x1C23,	%i4
	fmovdcc	%xcc,	%f20,	%f21
	fmovrslz	%l3,	%f16,	%f22
	andncc	%i5,	%i0,	%l4
	fone	%f14
	fmuld8ulx16	%f28,	%f16,	%f0
	ldsw	[%l7 + 0x74],	%o7
	movn	%icc,	%g7,	%g4
	alignaddrl	%i1,	%g2,	%o3
	addc	%g5,	%o2,	%l1
	edge8	%i7,	%o0,	%i6
	movg	%icc,	%g6,	%o6
	movneg	%icc,	%o1,	%l6
	movrgz	%g1,	%o5,	%l2
	srax	%o4,	%g3,	%i3
	fnot2s	%f13,	%f12
	std	%f20,	[%l7 + 0x58]
	array32	%i2,	%l5,	%i4
	add	%l0,	0x16C2,	%l3
	alignaddrl	%i5,	%l4,	%o7
	smulcc	%g7,	%i0,	%g4
	sir	0x1012
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fmul8x16al	%f6,	%f17,	%f4
	movrlz	%g5,	0x336,	%o2
	edge8l	%l1,	%o3,	%o0
	popc	0x1849,	%i6
	fpadd16s	%f30,	%f3,	%f14
	udivx	%i7,	0x06B4,	%o6
	stb	%g6,	[%l7 + 0x60]
	st	%f14,	[%l7 + 0x48]
	movneg	%icc,	%o1,	%g1
	movg	%xcc,	%l6,	%l2
	umulcc	%o4,	0x1332,	%g3
	fmovrdne	%i3,	%f24,	%f2
	addc	%o5,	0x0FCE,	%i2
	ldd	[%l7 + 0x60],	%f4
	movg	%xcc,	%i4,	%l5
	mulx	%l0,	0x100A,	%i5
	movrlez	%l3,	%l4,	%o7
	edge16ln	%i0,	%g4,	%i1
	movrgz	%g7,	%g2,	%o2
	udivx	%g5,	0x1398,	%l1
	sth	%o3,	[%l7 + 0x50]
	edge32	%o0,	%i6,	%o6
	edge16ln	%g6,	%i7,	%o1
	fxor	%f26,	%f4,	%f12
	mulx	%l6,	%l2,	%g1
	fandnot1s	%f5,	%f0,	%f19
	fmovsle	%icc,	%f26,	%f27
	subc	%g3,	%o4,	%o5
	edge8	%i2,	%i3,	%i4
	sdivx	%l5,	0x0889,	%l0
	mova	%xcc,	%i5,	%l4
	fmovdcs	%xcc,	%f14,	%f5
	andncc	%l3,	%i0,	%o7
	stx	%g4,	[%l7 + 0x08]
	mulx	%i1,	0x137E,	%g7
	movrlz	%g2,	%o2,	%g5
	mulx	%l1,	0x0C63,	%o3
	addcc	%i6,	%o0,	%g6
	addcc	%o6,	%i7,	%o1
	stb	%l6,	[%l7 + 0x34]
	fmovdleu	%xcc,	%f21,	%f3
	ldx	[%l7 + 0x08],	%l2
	stw	%g3,	[%l7 + 0x10]
	movrlez	%o4,	0x27B,	%o5
	fcmple32	%f4,	%f18,	%i2
	mova	%icc,	%g1,	%i4
	or	%l5,	0x0E9A,	%i3
	bshuffle	%f22,	%f20,	%f16
	andcc	%i5,	0x18C3,	%l4
	addccc	%l3,	0x0944,	%l0
	fands	%f17,	%f30,	%f23
	udiv	%o7,	0x0013,	%g4
	movrlz	%i1,	0x185,	%i0
	movrgz	%g7,	%o2,	%g5
	movvc	%icc,	%g2,	%o3
	alignaddrl	%l1,	%o0,	%i6
	orcc	%g6,	0x0B7F,	%i7
	fmovrsne	%o6,	%f1,	%f24
	edge16ln	%o1,	%l2,	%l6
	edge8n	%g3,	%o5,	%i2
	movrlz	%o4,	0x07E,	%i4
	umulcc	%l5,	0x1030,	%g1
	fmovdne	%xcc,	%f4,	%f26
	edge16l	%i3,	%i5,	%l3
	movn	%icc,	%l0,	%o7
	movrlez	%g4,	%i1,	%i0
	smulcc	%l4,	0x178E,	%o2
	or	%g5,	%g2,	%o3
	movneg	%icc,	%l1,	%o0
	edge32n	%g7,	%i6,	%i7
	restore %g6, %o6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%l6,	%o1
	sdivx	%g3,	0x1435,	%i2
	udivcc	%o5,	0x094D,	%i4
	edge8	%l5,	%o4,	%i3
	fmovdne	%xcc,	%f26,	%f9
	sub	%g1,	0x1EB8,	%i5
	xorcc	%l0,	%o7,	%l3
	popc	0x1353,	%i1
	fmovsg	%xcc,	%f27,	%f0
	lduh	[%l7 + 0x26],	%g4
	sir	0x1169
	fnands	%f30,	%f26,	%f5
	sth	%l4,	[%l7 + 0x18]
	array32	%i0,	%o2,	%g5
	ldsw	[%l7 + 0x5C],	%g2
	xnorcc	%o3,	%l1,	%g7
	fnot1	%f30,	%f12
	edge8l	%o0,	%i6,	%g6
	fmovdge	%xcc,	%f16,	%f26
	fmovsne	%icc,	%f20,	%f3
	xor	%o6,	%l2,	%l6
	sth	%o1,	[%l7 + 0x32]
	movle	%icc,	%g3,	%i2
	udiv	%o5,	0x080E,	%i7
	ldsh	[%l7 + 0x16],	%l5
	xnor	%o4,	%i3,	%g1
	fnot1	%f0,	%f30
	subccc	%i4,	0x092F,	%i5
	siam	0x0
	movrgez	%l0,	0x3CC,	%o7
	fmovscs	%icc,	%f25,	%f8
	mova	%xcc,	%l3,	%g4
	popc	0x12AB,	%i1
	fpadd16s	%f31,	%f26,	%f31
	movrgez	%l4,	%o2,	%i0
	fmovsge	%xcc,	%f19,	%f6
	save %g2, %g5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l1,	0x358,	%o0
	std	%f16,	[%l7 + 0x20]
	andncc	%g7,	%i6,	%o6
	movrgez	%g6,	%l6,	%o1
	addc	%g3,	%l2,	%o5
	addccc	%i2,	%l5,	%i7
	movcs	%xcc,	%i3,	%o4
	alignaddr	%g1,	%i4,	%i5
	udivx	%l0,	0x086F,	%l3
	fmovdvc	%xcc,	%f17,	%f20
	edge32l	%o7,	%i1,	%l4
	movpos	%icc,	%o2,	%i0
	sll	%g4,	0x0C,	%g2
	xnorcc	%g5,	0x01C9,	%l1
	andncc	%o3,	%g7,	%i6
	ldub	[%l7 + 0x49],	%o6
	udivcc	%g6,	0x0AD1,	%l6
	fsrc1	%f14,	%f6
	umulcc	%o1,	%o0,	%l2
	andncc	%g3,	%i2,	%o5
	fxor	%f26,	%f18,	%f28
	addccc	%l5,	0x1A39,	%i7
	fnand	%f22,	%f22,	%f16
	movrgz	%o4,	%i3,	%i4
	movpos	%xcc,	%i5,	%g1
	edge32ln	%l3,	%l0,	%o7
	edge16l	%l4,	%i1,	%i0
	edge8ln	%o2,	%g4,	%g2
	array16	%g5,	%l1,	%g7
	array32	%o3,	%o6,	%g6
	andcc	%i6,	0x052F,	%o1
	add	%o0,	0x19C0,	%l6
	edge32ln	%g3,	%i2,	%l2
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	umul	%o4,	%i3,	%l5
	orcc	%i5,	%i4,	%l3
	orncc	%g1,	%l0,	%l4
	movcc	%xcc,	%i1,	%o7
	fexpand	%f27,	%f22
	mulscc	%i0,	0x1964,	%g4
	or	%g2,	0x045E,	%g5
	edge32ln	%o2,	%l1,	%g7
	ldx	[%l7 + 0x38],	%o6
	ldsw	[%l7 + 0x34],	%g6
	mulx	%o3,	%i6,	%o1
	movrgz	%o0,	0x18E,	%g3
	movre	%i2,	0x1C9,	%l6
	stb	%o5,	[%l7 + 0x4C]
	alignaddr	%i7,	%l2,	%o4
	edge32ln	%l5,	%i5,	%i4
	xorcc	%l3,	%g1,	%i3
	lduh	[%l7 + 0x3A],	%l0
	and	%i1,	%o7,	%i0
	orncc	%l4,	%g4,	%g2
	fornot1s	%f7,	%f15,	%f27
	fpadd32s	%f22,	%f1,	%f17
	mulscc	%g5,	%l1,	%g7
	andncc	%o6,	%g6,	%o2
	fmovrdlez	%o3,	%f10,	%f0
	xnor	%o1,	%o0,	%i6
	movleu	%icc,	%i2,	%g3
	fmovsvs	%xcc,	%f23,	%f20
	subccc	%o5,	0x18A5,	%l6
	sll	%l2,	0x15,	%i7
	or	%o4,	%i5,	%i4
	xnor	%l5,	0x1816,	%g1
	fxnors	%f8,	%f21,	%f2
	fand	%f28,	%f6,	%f2
	movl	%xcc,	%i3,	%l0
	stx	%i1,	[%l7 + 0x48]
	fcmpgt32	%f8,	%f8,	%l3
	sir	0x1DE6
	smulcc	%o7,	0x1A21,	%i0
	sllx	%l4,	0x1B,	%g2
	subc	%g5,	%g4,	%l1
	fmovdleu	%xcc,	%f10,	%f2
	ldsb	[%l7 + 0x79],	%o6
	andn	%g6,	0x0ADF,	%o2
	movgu	%icc,	%g7,	%o1
	ldx	[%l7 + 0x48],	%o0
	edge16ln	%i6,	%i2,	%o3
	movrgez	%g3,	0x163,	%o5
	andncc	%l6,	%i7,	%l2
	fmovscc	%xcc,	%f2,	%f10
	subc	%o4,	%i4,	%i5
	bshuffle	%f22,	%f24,	%f8
	orcc	%l5,	0x1EBA,	%i3
	addcc	%g1,	%l0,	%l3
	umul	%o7,	0x0713,	%i0
	fmovd	%f20,	%f24
	movcs	%icc,	%i1,	%g2
	stw	%g5,	[%l7 + 0x2C]
	xnorcc	%g4,	0x1FDD,	%l1
	addcc	%l4,	%o6,	%g6
	andn	%g7,	0x0A2E,	%o2
	fmuld8sux16	%f10,	%f29,	%f20
	and	%o1,	0x1BAE,	%o0
	bshuffle	%f18,	%f18,	%f2
	movvs	%xcc,	%i6,	%i2
	add	%g3,	%o3,	%l6
	edge32ln	%o5,	%i7,	%l2
	nop
	set	0x38, %o2
	ldsw	[%l7 + %o2],	%o4
	sdiv	%i5,	0x17D7,	%i4
	sdiv	%i3,	0x1948,	%l5
	orcc	%g1,	0x1226,	%l3
	edge8l	%l0,	%i0,	%o7
	edge32l	%i1,	%g2,	%g4
	movrgz	%l1,	%l4,	%o6
	fpmerge	%f7,	%f14,	%f8
	movg	%xcc,	%g6,	%g7
	smulcc	%g5,	%o2,	%o1
	ldd	[%l7 + 0x60],	%o0
	srax	%i2,	0x0A,	%g3
	movl	%xcc,	%o3,	%l6
	fmovrslz	%o5,	%f6,	%f24
	fmovscs	%xcc,	%f20,	%f20
	alignaddrl	%i6,	%i7,	%o4
	edge32ln	%i5,	%i4,	%i3
	movrlz	%l5,	0x15A,	%l2
	alignaddr	%l3,	%l0,	%i0
	stb	%g1,	[%l7 + 0x71]
	xnor	%i1,	%g2,	%g4
	save %l1, %o7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g6,	%l4,	%g5
	edge16	%o2,	%o1,	%o0
	addc	%i2,	0x0CA3,	%g7
	sdivcc	%o3,	0x07CE,	%l6
	movrlz	%g3,	%i6,	%i7
	ldsw	[%l7 + 0x08],	%o4
	fmovrdgez	%o5,	%f28,	%f18
	orn	%i4,	%i3,	%l5
	orcc	%i5,	0x0F08,	%l3
	edge16n	%l2,	%l0,	%g1
	movgu	%xcc,	%i1,	%i0
	fsrc1s	%f10,	%f28
	fornot2	%f0,	%f18,	%f4
	sdivcc	%g4,	0x1B5F,	%g2
	xnor	%l1,	0x0D92,	%o7
	ldsb	[%l7 + 0x10],	%o6
	subcc	%l4,	%g6,	%o2
	edge8l	%g5,	%o0,	%i2
	fornot2s	%f6,	%f22,	%f30
	fcmpeq16	%f22,	%f28,	%o1
	movne	%icc,	%g7,	%l6
	smulcc	%o3,	%g3,	%i6
	fpackfix	%f20,	%f20
	movle	%icc,	%o4,	%o5
	edge16	%i7,	%i4,	%l5
	fmovrse	%i3,	%f20,	%f7
	sdivcc	%i5,	0x08B1,	%l3
	edge16n	%l2,	%g1,	%i1
	movpos	%xcc,	%i0,	%l0
	fmovsn	%xcc,	%f24,	%f17
	fandnot1s	%f24,	%f4,	%f4
	movcs	%xcc,	%g4,	%l1
	fpmerge	%f3,	%f23,	%f18
	movge	%xcc,	%g2,	%o6
	andncc	%o7,	%l4,	%o2
	or	%g6,	%g5,	%o0
	movrgz	%i2,	%o1,	%l6
	fmovrdlez	%o3,	%f2,	%f8
	mova	%xcc,	%g3,	%g7
	udivcc	%i6,	0x1897,	%o4
	orcc	%o5,	%i4,	%l5
	faligndata	%f20,	%f26,	%f4
	fpack32	%f24,	%f2,	%f18
	fmovsvs	%xcc,	%f29,	%f8
	fornot1s	%f14,	%f19,	%f1
	mova	%xcc,	%i7,	%i3
	edge32n	%l3,	%i5,	%l2
	array32	%i1,	%g1,	%l0
	ld	[%l7 + 0x5C],	%f24
	movrgz	%g4,	%i0,	%g2
	fmuld8ulx16	%f31,	%f11,	%f8
	restore %l1, 0x0678, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l4,	%o2
	lduw	[%l7 + 0x28],	%g6
	movleu	%icc,	%g5,	%o6
	udiv	%o0,	0x0674,	%o1
	fandnot1	%f10,	%f26,	%f4
	subc	%l6,	%i2,	%o3
	subc	%g3,	0x0581,	%i6
	fandnot1	%f6,	%f4,	%f22
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	stb	%i4,	[%l7 + 0x0C]
	andcc	%o4,	0x12DC,	%i7
	movg	%icc,	%i3,	%l3
	orncc	%i5,	0x15CF,	%l5
	ldx	[%l7 + 0x68],	%l2
	mulx	%i1,	0x16E2,	%g1
	umul	%g4,	%l0,	%i0
	fxnors	%f25,	%f15,	%f16
	and	%g2,	0x100D,	%l1
	subc	%o7,	0x05D7,	%o2
	edge8ln	%l4,	%g5,	%o6
	add	%g6,	0x0EA7,	%o1
	udiv	%l6,	0x126D,	%o0
	movge	%xcc,	%o3,	%g3
	array8	%i2,	%i6,	%o5
	st	%f26,	[%l7 + 0x18]
	sethi	0x0204,	%g7
	lduw	[%l7 + 0x30],	%i4
	movrlz	%o4,	%i7,	%i3
	sth	%l3,	[%l7 + 0x0C]
	addcc	%i5,	%l2,	%i1
	udivcc	%g1,	0x1E7C,	%l5
	save %g4, 0x05A6, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%i0,	0x0F1C,	%g2
	edge16n	%o7,	%o2,	%l4
	edge32n	%l1,	%o6,	%g6
	movneg	%icc,	%o1,	%g5
	array16	%l6,	%o3,	%g3
	movleu	%xcc,	%i2,	%i6
	ldsw	[%l7 + 0x14],	%o0
	move	%icc,	%g7,	%o5
	fmul8ulx16	%f12,	%f10,	%f18
	sdiv	%o4,	0x0172,	%i7
	movrne	%i3,	0x155,	%l3
	array8	%i5,	%i4,	%l2
	fmovrde	%g1,	%f10,	%f26
	std	%f22,	[%l7 + 0x08]
	add	%i1,	%l5,	%g4
	array16	%i0,	%g2,	%l0
	edge32l	%o2,	%o7,	%l1
	sir	0x10FD
	movrgez	%o6,	%g6,	%o1
	ldd	[%l7 + 0x60],	%g4
	stx	%l6,	[%l7 + 0x20]
	fornot1	%f6,	%f6,	%f12
	fmovsgu	%xcc,	%f15,	%f27
	edge16l	%o3,	%l4,	%i2
	lduh	[%l7 + 0x54],	%i6
	edge32l	%o0,	%g7,	%o5
	array8	%g3,	%o4,	%i7
	movle	%xcc,	%l3,	%i3
	fexpand	%f10,	%f20
	fmovdge	%xcc,	%f6,	%f7
	stw	%i5,	[%l7 + 0x30]
	nop
	set	0x38, %l5
	ldd	[%l7 + %l5],	%l2
	fmuld8ulx16	%f26,	%f9,	%f10
	edge8n	%g1,	%i1,	%l5
	sllx	%i4,	0x1C,	%g4
	fsrc2s	%f2,	%f24
	umul	%g2,	%i0,	%o2
	movle	%xcc,	%o7,	%l0
	sir	0x1DA5
	fmovdgu	%icc,	%f1,	%f24
	sethi	0x059E,	%o6
	orcc	%g6,	0x1C09,	%o1
	fxors	%f8,	%f30,	%f15
	fnot2	%f0,	%f4
	xor	%g5,	%l1,	%o3
	movvc	%icc,	%l6,	%i2
	smulcc	%i6,	0x1F62,	%l4
	edge32n	%o0,	%o5,	%g3
	st	%f17,	[%l7 + 0x50]
	orcc	%o4,	0x0497,	%i7
	edge8ln	%g7,	%i3,	%l3
	fornot1s	%f13,	%f16,	%f30
	movgu	%icc,	%i5,	%g1
	andncc	%i1,	%l5,	%l2
	fnot1s	%f20,	%f17
	siam	0x6
	ldd	[%l7 + 0x40],	%f30
	movrne	%i4,	0x01E,	%g4
	fmovrsgez	%g2,	%f10,	%f23
	ldsw	[%l7 + 0x50],	%o2
	smulcc	%i0,	0x165F,	%o7
	edge16l	%o6,	%g6,	%o1
	orn	%l0,	0x1F35,	%g5
	movle	%xcc,	%l1,	%o3
	add	%i2,	0x114F,	%l6
	stx	%i6,	[%l7 + 0x30]
	movg	%icc,	%l4,	%o5
	movgu	%xcc,	%g3,	%o0
	udiv	%i7,	0x1152,	%g7
	array8	%i3,	%o4,	%i5
	ldsh	[%l7 + 0x38],	%l3
	edge16	%i1,	%l5,	%g1
	movcs	%xcc,	%l2,	%i4
	ldub	[%l7 + 0x1E],	%g2
	ldsb	[%l7 + 0x3F],	%o2
	fpadd32s	%f5,	%f24,	%f17
	orncc	%g4,	%i0,	%o6
	smulcc	%g6,	%o7,	%o1
	movg	%xcc,	%g5,	%l0
	fcmple32	%f14,	%f8,	%o3
	fmovrdne	%l1,	%f8,	%f24
	ldub	[%l7 + 0x42],	%i2
	movrne	%i6,	0x335,	%l6
	or	%l4,	%o5,	%o0
	ldx	[%l7 + 0x70],	%g3
	ldx	[%l7 + 0x78],	%g7
	add	%i3,	%i7,	%i5
	movrgez	%l3,	0x31A,	%i1
	fcmple16	%f0,	%f4,	%l5
	movn	%icc,	%g1,	%l2
	stw	%i4,	[%l7 + 0x28]
	edge8l	%o4,	%o2,	%g2
	fmovsne	%xcc,	%f26,	%f15
	edge16n	%i0,	%g4,	%g6
	bshuffle	%f20,	%f4,	%f18
	nop
	set	0x3C, %o0
	ldsw	[%l7 + %o0],	%o7
	fmovdne	%icc,	%f2,	%f10
	fpsub32s	%f5,	%f26,	%f10
	fmovdgu	%xcc,	%f14,	%f4
	srl	%o1,	0x1C,	%o6
	movrlez	%g5,	0x0BC,	%l0
	udivcc	%o3,	0x19A7,	%l1
	and	%i6,	%l6,	%l4
	movcc	%icc,	%i2,	%o0
	xnorcc	%o5,	0x1458,	%g7
	edge32n	%i3,	%g3,	%i7
	orn	%i5,	%l3,	%l5
	movneg	%icc,	%g1,	%l2
	fsrc2	%f6,	%f26
	lduh	[%l7 + 0x48],	%i4
	addc	%o4,	0x1A6B,	%i1
	fmovscs	%xcc,	%f23,	%f13
	ldub	[%l7 + 0x79],	%o2
	udiv	%g2,	0x0191,	%i0
	ldub	[%l7 + 0x45],	%g4
	fpsub32s	%f25,	%f7,	%f13
	fmul8x16al	%f21,	%f15,	%f18
	stb	%o7,	[%l7 + 0x75]
	fnors	%f26,	%f29,	%f17
	array16	%g6,	%o6,	%o1
	sub	%l0,	0x1E54,	%o3
	fmovdleu	%xcc,	%f0,	%f10
	fmovdge	%xcc,	%f18,	%f12
	udivcc	%g5,	0x0F68,	%i6
	fmovrdlz	%l1,	%f14,	%f12
	movge	%xcc,	%l4,	%i2
	xnorcc	%l6,	0x1688,	%o5
	edge32ln	%o0,	%i3,	%g3
	udivcc	%i7,	0x0D78,	%i5
	fmovrslz	%g7,	%f6,	%f2
	movl	%icc,	%l3,	%l5
	addc	%g1,	0x0E67,	%l2
	edge32ln	%i4,	%o4,	%i1
	fornot1	%f28,	%f8,	%f30
	fnand	%f6,	%f30,	%f26
	array16	%o2,	%g2,	%i0
	sth	%o7,	[%l7 + 0x7C]
	stb	%g6,	[%l7 + 0x38]
	sll	%o6,	0x00,	%g4
	movleu	%xcc,	%l0,	%o3
	fmul8x16au	%f0,	%f18,	%f24
	sub	%o1,	%i6,	%g5
	nop
	set	0x44, %l2
	stb	%l1,	[%l7 + %l2]
	fpackfix	%f24,	%f4
	lduw	[%l7 + 0x40],	%i2
	fzero	%f14
	xor	%l6,	%o5,	%o0
	fsrc1	%f24,	%f26
	movvs	%icc,	%l4,	%g3
	movcc	%xcc,	%i3,	%i5
	fabss	%f10,	%f24
	save %g7, 0x068F, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f4,	%f24,	%l5
	fmovsle	%xcc,	%f28,	%f8
	mova	%xcc,	%g1,	%i7
	or	%l2,	%i4,	%i1
	movrgez	%o2,	0x096,	%g2
	srlx	%o4,	%i0,	%o7
	andn	%o6,	0x1E3E,	%g6
	subc	%g4,	%o3,	%o1
	ld	[%l7 + 0x74],	%f11
	fmul8x16au	%f8,	%f1,	%f24
	nop
	set	0x78, %g4
	ldx	[%l7 + %g4],	%i6
	edge8n	%l0,	%l1,	%i2
	fsrc2s	%f27,	%f2
	udiv	%l6,	0x1FF0,	%g5
	fmovdl	%icc,	%f0,	%f7
	orncc	%o0,	%l4,	%o5
	sth	%i3,	[%l7 + 0x78]
	edge16ln	%g3,	%g7,	%i5
	andncc	%l3,	%l5,	%g1
	xorcc	%i7,	0x136D,	%l2
	movn	%xcc,	%i1,	%i4
	fsrc2	%f8,	%f0
	std	%f30,	[%l7 + 0x18]
	fmuld8sux16	%f22,	%f4,	%f0
	movrgz	%o2,	%o4,	%g2
	fandnot1s	%f0,	%f11,	%f7
	sub	%o7,	%o6,	%i0
	edge32l	%g6,	%o3,	%g4
	andncc	%i6,	%o1,	%l0
	ld	[%l7 + 0x54],	%f30
	udivx	%l1,	0x0E64,	%l6
	srax	%i2,	0x05,	%o0
	fmovscc	%icc,	%f9,	%f21
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f12
	edge16	%g5,	%o5,	%l4
	umulcc	%i3,	0x0CE7,	%g3
	alignaddrl	%i5,	%l3,	%l5
	movvs	%xcc,	%g7,	%i7
	sdivcc	%l2,	0x0CB6,	%g1
	lduw	[%l7 + 0x2C],	%i4
	srlx	%i1,	0x10,	%o2
	edge8l	%o4,	%g2,	%o7
	movre	%o6,	0x308,	%g6
	add	%o3,	%g4,	%i6
	movrgz	%o1,	%l0,	%l1
	orcc	%i0,	%i2,	%l6
	mulscc	%o0,	%g5,	%o5
	ldx	[%l7 + 0x60],	%i3
	orcc	%g3,	%i5,	%l3
	edge32l	%l4,	%l5,	%i7
	sir	0x0C03
	movrlz	%g7,	%l2,	%i4
	udiv	%g1,	0x0D10,	%i1
	andncc	%o2,	%g2,	%o4
	subccc	%o6,	%g6,	%o3
	sethi	0x1B9E,	%o7
	movl	%icc,	%g4,	%i6
	movrgz	%o1,	0x2CF,	%l0
	fpsub16s	%f0,	%f31,	%f18
	array32	%l1,	%i0,	%l6
	nop
	set	0x6D, %o5
	stb	%o0,	[%l7 + %o5]
	array32	%i2,	%o5,	%i3
	fmovdcs	%icc,	%f16,	%f10
	fandnot2s	%f6,	%f28,	%f9
	fmovdcc	%xcc,	%f0,	%f1
	umul	%g3,	0x1C0F,	%i5
	ldsh	[%l7 + 0x72],	%l3
	ldub	[%l7 + 0x5D],	%l4
	xorcc	%g5,	0x1F9E,	%l5
	edge8	%i7,	%g7,	%l2
	sth	%g1,	[%l7 + 0x7E]
	xor	%i4,	%i1,	%o2
	udivx	%g2,	0x19CF,	%o4
	alignaddrl	%g6,	%o3,	%o6
	srl	%o7,	%g4,	%o1
	stx	%l0,	[%l7 + 0x08]
	edge8n	%l1,	%i6,	%i0
	array32	%l6,	%o0,	%i2
	movrgez	%o5,	0x3A1,	%i3
	sllx	%g3,	%l3,	%i5
	udiv	%g5,	0x1449,	%l4
	edge16	%l5,	%i7,	%g7
	stx	%l2,	[%l7 + 0x28]
	srax	%g1,	0x11,	%i4
	edge16ln	%o2,	%g2,	%i1
	mulscc	%o4,	0x1F9D,	%g6
	fnand	%f2,	%f6,	%f20
	udiv	%o6,	0x0149,	%o3
	fmovdne	%icc,	%f13,	%f13
	andcc	%g4,	0x17B6,	%o1
	sdivcc	%o7,	0x0E2A,	%l0
	andncc	%l1,	%i0,	%i6
	movrne	%l6,	0x1B7,	%o0
	edge16ln	%i2,	%i3,	%o5
	nop
	set	0x3C, %i3
	ldsh	[%l7 + %i3],	%l3
	movgu	%icc,	%g3,	%g5
	ld	[%l7 + 0x3C],	%f18
	fmuld8sux16	%f9,	%f8,	%f18
	edge16ln	%l4,	%l5,	%i7
	edge8	%i5,	%l2,	%g1
	stx	%i4,	[%l7 + 0x28]
	stx	%g7,	[%l7 + 0x70]
	fmovsl	%icc,	%f26,	%f0
	subccc	%o2,	%g2,	%i1
	fmovsge	%icc,	%f6,	%f5
	sub	%o4,	%o6,	%o3
	movleu	%icc,	%g6,	%o1
	ldsb	[%l7 + 0x5F],	%o7
	movn	%icc,	%l0,	%g4
	movpos	%xcc,	%i0,	%l1
	srl	%l6,	%i6,	%o0
	movle	%icc,	%i2,	%i3
	ldd	[%l7 + 0x58],	%f20
	st	%f4,	[%l7 + 0x10]
	nop
	set	0x60, %i7
	lduw	[%l7 + %i7],	%o5
	fmovrde	%l3,	%f30,	%f30
	ldub	[%l7 + 0x1C],	%g5
	movre	%l4,	%l5,	%i7
	array32	%i5,	%g3,	%l2
	movrgz	%g1,	0x314,	%g7
	fnors	%f23,	%f5,	%f10
	stx	%o2,	[%l7 + 0x20]
	fmuld8ulx16	%f14,	%f14,	%f28
	movleu	%icc,	%g2,	%i1
	edge16ln	%o4,	%i4,	%o6
	edge32n	%g6,	%o3,	%o7
	sth	%o1,	[%l7 + 0x7E]
	mulx	%l0,	0x1077,	%i0
	fmovdleu	%icc,	%f26,	%f24
	st	%f16,	[%l7 + 0x70]
	sir	0x1B58
	fmovrse	%g4,	%f20,	%f17
	fmovsvc	%icc,	%f21,	%f17
	nop
	set	0x68, %i1
	lduw	[%l7 + %i1],	%l6
	subc	%i6,	%o0,	%l1
	ld	[%l7 + 0x38],	%f21
	fandnot1	%f18,	%f10,	%f2
	fornot2s	%f14,	%f24,	%f27
	stx	%i2,	[%l7 + 0x70]
	movgu	%icc,	%i3,	%o5
	xnor	%l3,	0x066B,	%l4
	sir	0x180B
	ld	[%l7 + 0x6C],	%f23
	addcc	%l5,	0x174D,	%g5
	smulcc	%i7,	0x0DD6,	%g3
	sra	%i5,	0x1C,	%l2
	sllx	%g1,	%o2,	%g2
	sth	%g7,	[%l7 + 0x46]
	movrne	%i1,	0x07A,	%i4
	fnot1s	%f13,	%f10
	popc	%o4,	%g6
	sllx	%o6,	%o7,	%o1
	fmovde	%xcc,	%f19,	%f4
	movl	%xcc,	%l0,	%o3
	save %g4, %i0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i6,	%o0,	%l1
	sdiv	%i3,	0x0ADB,	%o5
	edge8l	%i2,	%l3,	%l4
	fmovrdlez	%l5,	%f26,	%f2
	save %i7, %g3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g5,	[%l7 + 0x43]
	std	%f4,	[%l7 + 0x30]
	ldsw	[%l7 + 0x1C],	%g1
	movneg	%xcc,	%l2,	%o2
	movl	%icc,	%g2,	%i1
	movl	%xcc,	%i4,	%g7
	fmovda	%xcc,	%f4,	%f4
	subccc	%g6,	0x1401,	%o4
	mulx	%o6,	%o1,	%o7
	ldsh	[%l7 + 0x2A],	%o3
	popc	%g4,	%l0
	array16	%i0,	%i6,	%o0
	ldsb	[%l7 + 0x5D],	%l6
	fmovdneg	%xcc,	%f5,	%f23
	fmul8ulx16	%f10,	%f2,	%f6
	edge16	%i3,	%l1,	%o5
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%f4
	ld	[%l7 + 0x60],	%f16
	mova	%xcc,	%i2,	%l4
	alignaddr	%l3,	%l5,	%g3
	mulscc	%i7,	0x0E26,	%i5
	ldx	[%l7 + 0x18],	%g5
	edge16	%l2,	%g1,	%o2
	xnorcc	%i1,	0x1D6E,	%g2
	ldd	[%l7 + 0x38],	%g6
	srax	%g6,	%i4,	%o4
	fmovdneg	%xcc,	%f31,	%f21
	popc	0x0BEA,	%o6
	edge8	%o7,	%o1,	%o3
	sth	%g4,	[%l7 + 0x62]
	xnor	%i0,	%l0,	%o0
	fnot1	%f0,	%f26
	movre	%l6,	0x26E,	%i6
	movcc	%xcc,	%i3,	%l1
	movl	%xcc,	%i2,	%o5
	movcc	%xcc,	%l4,	%l5
	edge8l	%g3,	%l3,	%i5
	sir	0x101A
	ldsw	[%l7 + 0x24],	%i7
	fmovrdne	%l2,	%f12,	%f8
	movrlez	%g1,	0x22D,	%g5
	subccc	%i1,	0x170E,	%o2
	fpadd16s	%f21,	%f12,	%f27
	edge16	%g2,	%g6,	%g7
	sll	%i4,	%o4,	%o7
	fmovdcc	%xcc,	%f4,	%f21
	and	%o6,	%o3,	%g4
	fmovdcs	%icc,	%f31,	%f11
	mova	%xcc,	%i0,	%l0
	fmovscs	%xcc,	%f4,	%f25
	fmovrdlez	%o0,	%f30,	%f26
	smulcc	%o1,	0x02FE,	%i6
	array16	%l6,	%i3,	%l1
	popc	%i2,	%l4
	ld	[%l7 + 0x74],	%f30
	popc	%l5,	%g3
	faligndata	%f24,	%f22,	%f12
	std	%f28,	[%l7 + 0x78]
	ldx	[%l7 + 0x10],	%o5
	fsrc2s	%f12,	%f3
	sll	%i5,	0x14,	%i7
	movge	%icc,	%l3,	%g1
	edge16n	%g5,	%l2,	%o2
	sir	0x1FB6
	movleu	%icc,	%g2,	%g6
	sllx	%g7,	%i1,	%o4
	xor	%o7,	%o6,	%o3
	edge8ln	%i4,	%g4,	%i0
	fmovd	%f14,	%f20
	movrne	%l0,	0x389,	%o1
	sdiv	%o0,	0x138A,	%l6
	edge32ln	%i6,	%l1,	%i2
	ldub	[%l7 + 0x54],	%l4
	movcs	%xcc,	%l5,	%g3
	edge32l	%i3,	%i5,	%i7
	popc	%o5,	%l3
	fcmpeq16	%f28,	%f0,	%g5
	fmovsvs	%xcc,	%f9,	%f0
	fmovsl	%xcc,	%f5,	%f13
	fmovdgu	%icc,	%f12,	%f1
	udivx	%l2,	0x1FFD,	%g1
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%g2
	subcc	%g6,	0x1A24,	%o2
	fmuld8sux16	%f5,	%f2,	%f28
	ldx	[%l7 + 0x70],	%g7
	save %i1, %o7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x60]
	fornot1s	%f21,	%f6,	%f4
	fxors	%f31,	%f2,	%f19
	sllx	%o3,	0x0C,	%i4
	movne	%xcc,	%o4,	%g4
	movge	%icc,	%i0,	%l0
	fmovspos	%icc,	%f16,	%f22
	ldub	[%l7 + 0x17],	%o0
	fnot1s	%f27,	%f6
	fabss	%f27,	%f22
	edge32l	%o1,	%l6,	%i6
	fmul8ulx16	%f16,	%f20,	%f20
	orncc	%i2,	0x0FBB,	%l1
	fmovsn	%icc,	%f22,	%f21
	edge32n	%l4,	%g3,	%l5
	ldd	[%l7 + 0x18],	%f22
	movrlez	%i5,	%i7,	%o5
	sra	%l3,	0x06,	%i3
	array32	%l2,	%g1,	%g5
	movrne	%g2,	%o2,	%g7
	edge32l	%g6,	%o7,	%o6
	array32	%i1,	%o3,	%o4
	orncc	%i4,	0x0568,	%g4
	lduw	[%l7 + 0x24],	%l0
	alignaddr	%o0,	%o1,	%l6
	movg	%xcc,	%i6,	%i2
	fmuld8ulx16	%f8,	%f9,	%f30
	sth	%l1,	[%l7 + 0x0A]
	movleu	%xcc,	%l4,	%i0
	fmovrdne	%l5,	%f20,	%f12
	sdiv	%g3,	0x14CD,	%i7
	movleu	%xcc,	%o5,	%i5
	movg	%xcc,	%l3,	%i3
	andcc	%l2,	%g1,	%g5
	fpadd32s	%f25,	%f30,	%f22
	nop
	set	0x3C, %i6
	ldsh	[%l7 + %i6],	%o2
	fornot1	%f12,	%f4,	%f10
	fors	%f23,	%f18,	%f3
	movvs	%icc,	%g2,	%g6
	movpos	%icc,	%o7,	%g7
	orn	%i1,	%o3,	%o6
	popc	0x004C,	%o4
	movneg	%icc,	%g4,	%i4
	ldsw	[%l7 + 0x18],	%l0
	movpos	%xcc,	%o1,	%o0
	ldx	[%l7 + 0x58],	%i6
	sethi	0x1E6A,	%l6
	st	%f30,	[%l7 + 0x50]
	fexpand	%f28,	%f14
	orncc	%i2,	%l4,	%i0
	fmovdcs	%icc,	%f8,	%f11
	alignaddrl	%l1,	%l5,	%i7
	xorcc	%g3,	0x0FD6,	%i5
	movrlz	%l3,	%i3,	%l2
	movre	%g1,	%g5,	%o5
	fmovdn	%xcc,	%f31,	%f23
	udivcc	%g2,	0x0A81,	%g6
	std	%f22,	[%l7 + 0x38]
	ldx	[%l7 + 0x48],	%o7
	fmovdl	%xcc,	%f27,	%f22
	srax	%g7,	%o2,	%i1
	orn	%o6,	%o3,	%o4
	andn	%i4,	%l0,	%g4
	fmul8sux16	%f26,	%f4,	%f26
	sra	%o1,	%i6,	%o0
	movg	%xcc,	%i2,	%l6
	popc	0x139E,	%i0
	restore %l1, %l4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l5,	[%l7 + 0x32]
	xnor	%g3,	%l3,	%i5
	fnot2	%f8,	%f24
	fcmpne16	%f4,	%f6,	%i3
	fmovrdlez	%l2,	%f2,	%f2
	fmovrsgez	%g5,	%f18,	%f27
	udivcc	%g1,	0x0D67,	%o5
	and	%g2,	0x0939,	%g6
	umulcc	%g7,	%o7,	%o2
	orcc	%o6,	0x080E,	%o3
	edge32ln	%o4,	%i1,	%i4
	srl	%g4,	0x06,	%l0
	and	%o1,	0x11D8,	%o0
	fpsub32s	%f28,	%f20,	%f0
	popc	0x06C8,	%i6
	std	%f18,	[%l7 + 0x10]
	orn	%i2,	%i0,	%l1
	stx	%l4,	[%l7 + 0x28]
	edge8	%l6,	%l5,	%g3
	movne	%icc,	%i7,	%i5
	fmovrdgz	%l3,	%f20,	%f0
	fpack16	%f22,	%f6
	smul	%l2,	%i3,	%g1
	ldd	[%l7 + 0x08],	%o4
	move	%xcc,	%g5,	%g2
	movre	%g6,	%o7,	%g7
	array16	%o2,	%o3,	%o4
	movrgez	%o6,	0x0B6,	%i1
	edge16l	%g4,	%l0,	%i4
	lduh	[%l7 + 0x78],	%o0
	fpadd16	%f0,	%f20,	%f20
	edge8l	%o1,	%i2,	%i0
	xor	%l1,	0x0A39,	%i6
	smul	%l6,	%l4,	%g3
	movpos	%icc,	%i7,	%l5
	stx	%l3,	[%l7 + 0x70]
	stx	%l2,	[%l7 + 0x38]
	fnand	%f24,	%f2,	%f26
	lduw	[%l7 + 0x1C],	%i5
	alignaddr	%g1,	%o5,	%i3
	edge32	%g2,	%g5,	%g6
	xnorcc	%g7,	0x1881,	%o7
	fors	%f28,	%f11,	%f14
	smulcc	%o2,	%o3,	%o4
	fandnot1s	%f26,	%f4,	%f22
	fmovsneg	%icc,	%f8,	%f12
	and	%i1,	0x11FC,	%o6
	fmovdvc	%icc,	%f10,	%f16
	subcc	%l0,	0x0B2F,	%i4
	sub	%o0,	0x131D,	%o1
	movrgez	%g4,	0x08B,	%i0
	movcs	%xcc,	%i2,	%l1
	movrgez	%i6,	%l4,	%g3
	movcs	%icc,	%i7,	%l6
	and	%l5,	%l3,	%l2
	sllx	%i5,	0x15,	%o5
	srlx	%g1,	%i3,	%g2
	fnands	%f15,	%f4,	%f11
	edge8l	%g6,	%g5,	%o7
	udivx	%g7,	0x069B,	%o2
	movne	%xcc,	%o4,	%o3
	orn	%i1,	%l0,	%o6
	andncc	%i4,	%o1,	%g4
	subc	%o0,	0x1ECD,	%i0
	ld	[%l7 + 0x24],	%f13
	edge32l	%l1,	%i6,	%l4
	subcc	%g3,	0x0E6A,	%i2
	edge32	%l6,	%l5,	%i7
	movl	%icc,	%l3,	%i5
	addc	%o5,	%l2,	%g1
	fpsub16s	%f29,	%f13,	%f12
	fmovdvc	%xcc,	%f9,	%f9
	sth	%g2,	[%l7 + 0x46]
	fmovsge	%xcc,	%f15,	%f23
	udiv	%g6,	0x1B90,	%i3
	fmovrsgez	%o7,	%f9,	%f8
	orncc	%g7,	%g5,	%o2
	movvs	%icc,	%o4,	%i1
	subc	%o3,	0x0218,	%l0
	ldd	[%l7 + 0x30],	%f14
	fpadd16	%f28,	%f4,	%f2
	orn	%o6,	0x1F5C,	%o1
	fcmped	%fcc2,	%f18,	%f10
	addc	%g4,	0x0F89,	%i4
	fmovdcs	%icc,	%f0,	%f13
	mulx	%o0,	0x0FD9,	%l1
	add	%i6,	0x0863,	%l4
	movvs	%xcc,	%g3,	%i2
	srlx	%i0,	0x17,	%l5
	fornot2	%f6,	%f0,	%f28
	movrlz	%l6,	0x2C2,	%l3
	movrlez	%i7,	0x2A6,	%o5
	fcmpgt16	%f16,	%f16,	%i5
	ldsw	[%l7 + 0x08],	%g1
	mulx	%l2,	0x1245,	%g6
	fnands	%f0,	%f21,	%f26
	umulcc	%i3,	0x0787,	%o7
	edge16	%g7,	%g2,	%g5
	movvc	%icc,	%o2,	%o4
	addccc	%o3,	%l0,	%o6
	sdivcc	%i1,	0x01B1,	%g4
	sdivx	%o1,	0x1CB6,	%i4
	fmul8ulx16	%f22,	%f20,	%f24
	ld	[%l7 + 0x54],	%f25
	edge16n	%o0,	%i6,	%l1
	movre	%l4,	%g3,	%i2
	std	%f20,	[%l7 + 0x20]
	smul	%i0,	%l5,	%l6
	sdivx	%l3,	0x0A25,	%o5
	fand	%f18,	%f18,	%f22
	movn	%icc,	%i7,	%g1
	movrgz	%i5,	%g6,	%i3
	fmul8x16	%f1,	%f18,	%f0
	ldx	[%l7 + 0x20],	%l2
	movre	%o7,	%g7,	%g5
	fcmpgt32	%f20,	%f14,	%g2
	fmovse	%icc,	%f14,	%f1
	fmovsgu	%xcc,	%f13,	%f23
	edge16l	%o4,	%o2,	%l0
	movre	%o6,	%o3,	%i1
	addc	%g4,	%i4,	%o1
	ldd	[%l7 + 0x70],	%f2
	mulscc	%i6,	%l1,	%o0
	subc	%g3,	%i2,	%l4
	or	%l5,	%i0,	%l3
	movl	%xcc,	%l6,	%i7
	st	%f9,	[%l7 + 0x30]
	andncc	%o5,	%i5,	%g6
	movne	%icc,	%i3,	%l2
	mova	%icc,	%o7,	%g1
	sll	%g5,	%g7,	%g2
	fpadd32s	%f14,	%f31,	%f18
	array16	%o2,	%o4,	%o6
	fabss	%f27,	%f22
	addcc	%o3,	0x0A89,	%i1
	movrne	%l0,	%g4,	%o1
	fmovscs	%icc,	%f11,	%f12
	stw	%i4,	[%l7 + 0x0C]
	fors	%f4,	%f18,	%f3
	fnot2s	%f17,	%f24
	fors	%f28,	%f1,	%f28
	umulcc	%l1,	0x0D69,	%i6
	sth	%g3,	[%l7 + 0x6A]
	fmovrdne	%i2,	%f10,	%f26
	movrgez	%o0,	%l4,	%l5
	srlx	%i0,	%l3,	%l6
	ldsh	[%l7 + 0x7C],	%i7
	ldsb	[%l7 + 0x0B],	%i5
	fmovdleu	%xcc,	%f4,	%f21
	fmovrdgez	%g6,	%f12,	%f16
	ldsw	[%l7 + 0x1C],	%o5
	sdivcc	%i3,	0x0E0C,	%l2
	ldx	[%l7 + 0x68],	%g1
	movvs	%xcc,	%g5,	%g7
	subc	%g2,	%o2,	%o4
	edge32l	%o6,	%o3,	%i1
	movrlez	%l0,	0x2FD,	%g4
	movre	%o1,	%i4,	%l1
	xnor	%o7,	0x1EE9,	%g3
	edge32	%i6,	%o0,	%i2
	edge8l	%l4,	%l5,	%l3
	stw	%l6,	[%l7 + 0x28]
	srax	%i0,	0x12,	%i7
	andncc	%i5,	%g6,	%i3
	sdivcc	%l2,	0x12DC,	%o5
	andcc	%g5,	0x1362,	%g7
	fnor	%f26,	%f16,	%f6
	movcs	%icc,	%g2,	%g1
	ldsb	[%l7 + 0x16],	%o2
	movvs	%xcc,	%o4,	%o3
	movneg	%icc,	%o6,	%i1
	array16	%g4,	%o1,	%i4
	movleu	%icc,	%l1,	%o7
	lduh	[%l7 + 0x4E],	%g3
	mova	%xcc,	%l0,	%o0
	array8	%i6,	%i2,	%l4
	fmovdne	%icc,	%f16,	%f10
	ld	[%l7 + 0x5C],	%f23
	orcc	%l3,	%l5,	%i0
	fmovsvc	%icc,	%f6,	%f30
	popc	0x10BB,	%i7
	ldd	[%l7 + 0x30],	%i4
	movneg	%xcc,	%g6,	%i3
	edge16n	%l2,	%o5,	%g5
	xor	%g7,	0x1565,	%g2
	ld	[%l7 + 0x44],	%f19
	fmul8x16al	%f21,	%f0,	%f12
	udivcc	%l6,	0x0301,	%g1
	st	%f22,	[%l7 + 0x0C]
	fornot1s	%f3,	%f31,	%f5
	edge32ln	%o2,	%o4,	%o3
	movneg	%icc,	%o6,	%i1
	edge8l	%g4,	%i4,	%l1
	sir	0x1A99
	fmovsle	%xcc,	%f18,	%f8
	smul	%o1,	0x0D80,	%o7
	lduh	[%l7 + 0x42],	%g3
	fmovsneg	%xcc,	%f2,	%f3
	smulcc	%l0,	%i6,	%o0
	array16	%l4,	%l3,	%i2
	fmovsge	%xcc,	%f14,	%f3
	sdivx	%l5,	0x0EDD,	%i7
	movne	%xcc,	%i0,	%g6
	andn	%i5,	%i3,	%l2
	movrgez	%o5,	0x04B,	%g5
	movcs	%icc,	%g2,	%l6
	fsrc1s	%f0,	%f31
	xor	%g1,	%o2,	%g7
	movg	%xcc,	%o4,	%o6
	movrgez	%o3,	%i1,	%g4
	movvc	%xcc,	%l1,	%i4
	edge8n	%o1,	%o7,	%l0
	fpadd32	%f0,	%f0,	%f16
	sth	%i6,	[%l7 + 0x62]
	sdivcc	%o0,	0x0CFB,	%l4
	fmovdn	%xcc,	%f17,	%f30
	fmovrdgez	%l3,	%f2,	%f22
	mulx	%i2,	%g3,	%l5
	movrgez	%i0,	0x152,	%i7
	ldd	[%l7 + 0x78],	%g6
	udivx	%i3,	0x1771,	%i5
	subccc	%l2,	%g5,	%o5
	popc	0x1568,	%l6
	sub	%g2,	%g1,	%g7
	mulscc	%o2,	0x0E60,	%o6
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	movne	%icc,	%l1,	%i4
	fmovspos	%icc,	%f21,	%f3
	fabsd	%f14,	%f12
	umulcc	%o1,	0x0FD6,	%g4
	xorcc	%l0,	0x12B9,	%o7
	edge32l	%o0,	%i6,	%l3
	add	%i2,	0x1113,	%l4
	fone	%f26
	edge16n	%l5,	%i0,	%g3
	xnorcc	%g6,	%i3,	%i7
	movrgz	%l2,	0x27D,	%g5
	ldsb	[%l7 + 0x2B],	%o5
	edge32l	%l6,	%g2,	%g1
	sethi	0x1E80,	%i5
	alignaddr	%o2,	%o6,	%g7
	movge	%xcc,	%o4,	%o3
	fpsub16s	%f8,	%f19,	%f29
	add	%l1,	0x09DF,	%i1
	fmovrde	%o1,	%f4,	%f8
	popc	0x0CE3,	%g4
	fpadd16	%f2,	%f22,	%f2
	movvc	%xcc,	%i4,	%l0
	movcs	%xcc,	%o7,	%o0
	xnor	%i6,	0x0B8D,	%l3
	mova	%xcc,	%i2,	%l5
	movn	%xcc,	%i0,	%l4
	fmovdl	%icc,	%f14,	%f26
	movneg	%icc,	%g3,	%g6
	sth	%i7,	[%l7 + 0x16]
	edge8	%l2,	%i3,	%o5
	addcc	%l6,	%g2,	%g5
	udivcc	%g1,	0x16ED,	%i5
	edge32n	%o6,	%o2,	%o4
	fnegd	%f10,	%f6
	fors	%f4,	%f16,	%f10
	sdivx	%o3,	0x1200,	%g7
	movrgez	%l1,	%o1,	%g4
	stx	%i1,	[%l7 + 0x60]
	stb	%l0,	[%l7 + 0x0C]
	udivcc	%i4,	0x0892,	%o0
	fpadd16s	%f21,	%f7,	%f17
	xnor	%o7,	%l3,	%i6
	andn	%i2,	%i0,	%l4
	fsrc1s	%f6,	%f25
	edge32n	%g3,	%l5,	%g6
	subcc	%i7,	0x0483,	%i3
	alignaddrl	%l2,	%l6,	%o5
	ldsw	[%l7 + 0x58],	%g2
	sethi	0x116F,	%g1
	fornot2	%f8,	%f30,	%f14
	movrgz	%g5,	0x3B4,	%o6
	fsrc2	%f26,	%f4
	popc	%o2,	%o4
	fmovdle	%icc,	%f5,	%f29
	fabss	%f22,	%f1
	addc	%i5,	%o3,	%l1
	movcc	%icc,	%g7,	%o1
	sdiv	%g4,	0x0899,	%l0
	fmovdg	%icc,	%f4,	%f22
	addcc	%i1,	0x1DA6,	%o0
	fand	%f8,	%f16,	%f10
	ldd	[%l7 + 0x38],	%f22
	nop
	set	0x34, %o3
	lduw	[%l7 + %o3],	%o7
	andncc	%i4,	%l3,	%i6
	ldsb	[%l7 + 0x4E],	%i2
	movrlez	%i0,	0x378,	%l4
	movne	%xcc,	%l5,	%g3
	subcc	%i7,	0x0E5E,	%i3
	xorcc	%l2,	0x017B,	%g6
	movle	%icc,	%l6,	%o5
	ldd	[%l7 + 0x78],	%f26
	add	%g1,	%g5,	%o6
	movrlez	%g2,	0x1BE,	%o4
	edge8ln	%o2,	%o3,	%l1
	ldsh	[%l7 + 0x36],	%i5
	save %o1, %g7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%g4,	%o0
	edge16l	%o7,	%i4,	%i1
	sir	0x0E56
	movgu	%icc,	%i6,	%i2
	movn	%icc,	%l3,	%l4
	fcmped	%fcc0,	%f28,	%f18
	movrgz	%i0,	%l5,	%g3
	fmovsa	%icc,	%f19,	%f24
	fmovscc	%icc,	%f6,	%f18
	ldd	[%l7 + 0x10],	%i6
	move	%icc,	%l2,	%i3
	fmul8x16au	%f2,	%f1,	%f8
	fmovrdgz	%g6,	%f10,	%f18
	edge16l	%o5,	%l6,	%g5
	andcc	%o6,	0x09D0,	%g2
	lduw	[%l7 + 0x50],	%o4
	movcs	%icc,	%o2,	%g1
	movgu	%xcc,	%l1,	%i5
	fmovs	%f7,	%f12
	movrne	%o3,	0x02F,	%g7
	srax	%o1,	%g4,	%l0
	movrlez	%o0,	%i4,	%i1
	sllx	%i6,	%o7,	%i2
	array16	%l3,	%l4,	%i0
	ldsb	[%l7 + 0x72],	%g3
	nop
	set	0x68, %g6
	ldd	[%l7 + %g6],	%i6
	alignaddr	%l5,	%l2,	%g6
	lduw	[%l7 + 0x44],	%o5
	movl	%xcc,	%i3,	%l6
	fpack16	%f0,	%f6
	fornot2	%f2,	%f8,	%f18
	fnand	%f0,	%f14,	%f22
	sub	%o6,	%g2,	%g5
	umul	%o4,	0x1B76,	%g1
	movgu	%icc,	%o2,	%i5
	umulcc	%l1,	%g7,	%o3
	alignaddrl	%o1,	%l0,	%o0
	fmovd	%f2,	%f20
	alignaddrl	%g4,	%i4,	%i1
	smulcc	%i6,	0x1C5F,	%o7
	fornot2	%f10,	%f2,	%f24
	sllx	%i2,	0x15,	%l3
	movg	%xcc,	%i0,	%l4
	srl	%g3,	0x1C,	%i7
	for	%f28,	%f30,	%f4
	lduw	[%l7 + 0x78],	%l2
	fornot1s	%f24,	%f31,	%f20
	move	%icc,	%g6,	%o5
	sllx	%l5,	%l6,	%o6
	xorcc	%i3,	%g5,	%g2
	restore %o4, 0x107C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o2,	%l1
	ldd	[%l7 + 0x78],	%i4
	edge32	%o3,	%o1,	%l0
	siam	0x1
	fmul8x16	%f25,	%f28,	%f20
	srl	%g7,	0x06,	%g4
	subcc	%o0,	0x00A6,	%i1
	movcc	%xcc,	%i6,	%i4
	edge16	%i2,	%l3,	%o7
	xnor	%l4,	%i0,	%i7
	movrgz	%g3,	%l2,	%g6
	fmovscc	%xcc,	%f24,	%f8
	movn	%icc,	%l5,	%l6
	fmovdvs	%icc,	%f7,	%f13
	sdiv	%o5,	0x0B39,	%i3
	ldx	[%l7 + 0x30],	%o6
	udivx	%g2,	0x1C6C,	%o4
	sub	%g5,	%o2,	%g1
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	movre	%o1,	0x363,	%l0
	edge16n	%g7,	%o0,	%i1
	st	%f5,	[%l7 + 0x6C]
	xnorcc	%i6,	%g4,	%i4
	fands	%f28,	%f14,	%f20
	orcc	%l3,	%i2,	%l4
	fexpand	%f10,	%f24
	movne	%icc,	%o7,	%i7
	array16	%i0,	%g3,	%g6
	fpackfix	%f30,	%f17
	alignaddr	%l5,	%l6,	%l2
	fmovsleu	%icc,	%f19,	%f25
	addc	%i3,	%o6,	%o5
	movne	%icc,	%g2,	%g5
	sdivx	%o2,	0x0019,	%g1
	fmovsvs	%xcc,	%f19,	%f27
	sth	%o4,	[%l7 + 0x0A]
	xnorcc	%l1,	%o3,	%i5
	srl	%l0,	0x08,	%g7
	fzeros	%f11
	mulx	%o1,	0x0C3F,	%o0
	andncc	%i1,	%g4,	%i4
	fsrc1	%f12,	%f2
	movcs	%icc,	%i6,	%i2
	sllx	%l3,	0x19,	%o7
	movre	%l4,	0x17A,	%i7
	fmovrse	%i0,	%f6,	%f29
	fpsub16	%f18,	%f2,	%f18
	srax	%g3,	0x16,	%g6
	movg	%icc,	%l6,	%l2
	edge32ln	%i3,	%o6,	%l5
	mova	%icc,	%o5,	%g5
	stx	%o2,	[%l7 + 0x78]
	srlx	%g1,	%g2,	%l1
	fmovsvc	%xcc,	%f0,	%f3
	fmovrdgez	%o3,	%f16,	%f22
	srl	%o4,	%l0,	%i5
	sir	0x031A
	ldsw	[%l7 + 0x7C],	%o1
	movcc	%xcc,	%g7,	%o0
	stw	%i1,	[%l7 + 0x68]
	fmovscc	%icc,	%f12,	%f12
	add	%i4,	0x178E,	%i6
	movgu	%icc,	%i2,	%g4
	udivx	%o7,	0x0660,	%l3
	lduw	[%l7 + 0x78],	%i7
	or	%i0,	0x1237,	%g3
	fmovrse	%l4,	%f23,	%f22
	movrlz	%g6,	%l2,	%l6
	fsrc2s	%f4,	%f30
	fcmpes	%fcc0,	%f28,	%f28
	ldsh	[%l7 + 0x2A],	%i3
	movleu	%icc,	%o6,	%l5
	mulx	%g5,	0x0391,	%o2
	fxnors	%f23,	%f30,	%f26
	movcs	%xcc,	%g1,	%o5
	movvs	%icc,	%g2,	%o3
	movrgez	%l1,	0x1F1,	%l0
	smul	%o4,	%o1,	%g7
	sdivcc	%i5,	0x1841,	%i1
	for	%f24,	%f0,	%f20
	xor	%i4,	%o0,	%i2
	subc	%i6,	0x16A1,	%g4
	srax	%o7,	%l3,	%i7
	ldx	[%l7 + 0x38],	%g3
	movrgz	%l4,	0x0AD,	%i0
	fmovda	%icc,	%f18,	%f1
	fmuld8ulx16	%f29,	%f22,	%f2
	xnorcc	%g6,	0x10C4,	%l6
	nop
	set	0x38, %i4
	ldd	[%l7 + %i4],	%f26
	st	%f14,	[%l7 + 0x18]
	fpackfix	%f18,	%f8
	fnot1s	%f5,	%f3
	xnorcc	%i3,	0x1E24,	%o6
	ldx	[%l7 + 0x70],	%l2
	umulcc	%g5,	0x097F,	%o2
	fnors	%f7,	%f25,	%f17
	movl	%icc,	%l5,	%g1
	popc	0x0CEB,	%o5
	ldd	[%l7 + 0x40],	%o2
	edge8	%g2,	%l0,	%l1
	udiv	%o4,	0x04E9,	%o1
	sub	%g7,	%i1,	%i5
	sethi	0x17EA,	%i4
	subcc	%i2,	%o0,	%i6
	movrgz	%g4,	0x078,	%l3
	addc	%o7,	%i7,	%l4
	edge32l	%g3,	%i0,	%l6
	lduh	[%l7 + 0x56],	%g6
	fnegd	%f8,	%f8
	edge16ln	%o6,	%i3,	%g5
	edge8	%o2,	%l2,	%l5
	std	%f4,	[%l7 + 0x28]
	movg	%xcc,	%g1,	%o5
	mova	%icc,	%g2,	%l0
	ldsw	[%l7 + 0x4C],	%l1
	fnands	%f13,	%f0,	%f27
	umulcc	%o4,	%o1,	%g7
	addccc	%i1,	%o3,	%i4
	fmovdleu	%icc,	%f7,	%f18
	umulcc	%i5,	0x17B7,	%o0
	fcmpgt16	%f0,	%f14,	%i2
	fnegs	%f29,	%f15
	move	%icc,	%g4,	%l3
	sra	%o7,	%i6,	%l4
	movrgez	%i7,	%g3,	%l6
	movcs	%xcc,	%i0,	%o6
	fmovsa	%icc,	%f22,	%f4
	edge16l	%i3,	%g5,	%o2
	mulscc	%g6,	%l2,	%g1
	fmul8x16	%f29,	%f24,	%f6
	array8	%l5,	%g2,	%l0
	edge16l	%l1,	%o4,	%o5
	sub	%o1,	0x0BF9,	%g7
	umul	%o3,	%i4,	%i1
	sth	%i5,	[%l7 + 0x0A]
	alignaddr	%i2,	%g4,	%o0
	addc	%o7,	0x157A,	%i6
	edge8n	%l4,	%i7,	%l3
	fxor	%f2,	%f16,	%f10
	fandnot2	%f22,	%f8,	%f0
	addcc	%l6,	%i0,	%o6
	fmovsle	%icc,	%f31,	%f12
	orncc	%g3,	0x0F5E,	%g5
	movleu	%xcc,	%o2,	%g6
	popc	0x1BBC,	%l2
	fmovdl	%icc,	%f31,	%f8
	fmovrdlz	%i3,	%f28,	%f16
	movvs	%icc,	%l5,	%g1
	move	%xcc,	%l0,	%l1
	sllx	%o4,	0x08,	%g2
	ldub	[%l7 + 0x67],	%o1
	lduh	[%l7 + 0x16],	%o5
	fors	%f17,	%f17,	%f15
	movrlez	%g7,	0x1D6,	%i4
	xorcc	%o3,	%i5,	%i2
	fcmple16	%f26,	%f4,	%g4
	or	%o0,	%o7,	%i6
	sdivx	%i1,	0x0177,	%i7
	fmul8x16al	%f20,	%f13,	%f18
	ldd	[%l7 + 0x68],	%l4
	movpos	%icc,	%l6,	%i0
	array16	%l3,	%o6,	%g5
	movre	%o2,	%g6,	%g3
	ldd	[%l7 + 0x60],	%l2
	fmovrde	%l5,	%f30,	%f24
	edge16	%g1,	%i3,	%l1
	ldx	[%l7 + 0x40],	%o4
	fexpand	%f20,	%f30
	lduh	[%l7 + 0x72],	%l0
	mova	%xcc,	%o1,	%g2
	ld	[%l7 + 0x3C],	%f18
	fcmps	%fcc1,	%f29,	%f18
	fnands	%f15,	%f29,	%f18
	udivcc	%g7,	0x1306,	%i4
	move	%icc,	%o5,	%o3
	movneg	%icc,	%i2,	%g4
	std	%f4,	[%l7 + 0x40]
	smul	%o0,	0x17AB,	%o7
	move	%icc,	%i5,	%i6
	andncc	%i1,	%l4,	%i7
	sir	0x1805
	movre	%i0,	%l3,	%l6
	fnegd	%f8,	%f18
	udivcc	%g5,	0x1027,	%o2
	movvc	%icc,	%o6,	%g6
	edge32l	%g3,	%l2,	%g1
	movn	%icc,	%i3,	%l1
	alignaddrl	%o4,	%l0,	%l5
	ldsb	[%l7 + 0x63],	%g2
	orn	%o1,	0x1BC3,	%g7
	array8	%o5,	%o3,	%i2
	fnor	%f30,	%f18,	%f16
	fmovdcs	%xcc,	%f2,	%f17
	ldub	[%l7 + 0x50],	%i4
	stx	%o0,	[%l7 + 0x68]
	movrlz	%o7,	%g4,	%i6
	mulscc	%i5,	0x195B,	%l4
	save %i1, 0x0C8E, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l3,	%l6,	%i7
	fmovde	%icc,	%f17,	%f4
	movrlez	%g5,	%o2,	%g6
	edge16	%o6,	%l2,	%g3
	alignaddr	%g1,	%l1,	%o4
	udivx	%i3,	0x0709,	%l0
	sllx	%l5,	0x1A,	%g2
	edge32ln	%o1,	%g7,	%o3
	edge32l	%o5,	%i4,	%o0
	ldd	[%l7 + 0x60],	%f22
	udiv	%o7,	0x0C37,	%i2
	movrlz	%g4,	%i5,	%l4
	fmovs	%f22,	%f21
	fmovrdlz	%i1,	%f2,	%f14
	movle	%xcc,	%i6,	%l3
	movcc	%xcc,	%l6,	%i7
	movcc	%icc,	%g5,	%i0
	and	%g6,	%o6,	%l2
	fors	%f11,	%f2,	%f16
	movge	%icc,	%o2,	%g3
	sra	%l1,	0x0C,	%o4
	movgu	%xcc,	%g1,	%i3
	movre	%l5,	0x211,	%g2
	fnegs	%f0,	%f14
	ldsh	[%l7 + 0x6C],	%l0
	edge32ln	%o1,	%g7,	%o3
	fnands	%f31,	%f15,	%f13
	fxor	%f20,	%f10,	%f20
	andn	%o5,	0x0B82,	%o0
	save %i4, %i2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%i5,	%l4,	%i1
	movle	%icc,	%i6,	%l3
	fcmped	%fcc1,	%f8,	%f30
	ldd	[%l7 + 0x68],	%f8
	ldsw	[%l7 + 0x2C],	%o7
	fsrc2s	%f23,	%f9
	movleu	%xcc,	%i7,	%g5
	edge16ln	%i0,	%l6,	%g6
	ldd	[%l7 + 0x18],	%l2
	move	%icc,	%o2,	%g3
	alignaddr	%o6,	%l1,	%g1
	smul	%i3,	0x03CB,	%l5
	edge32l	%g2,	%l0,	%o4
	sllx	%o1,	0x0C,	%g7
	fmovsneg	%xcc,	%f1,	%f17
	movrlz	%o3,	0x23C,	%o0
	movneg	%xcc,	%i4,	%o5
	sll	%g4,	%i5,	%i2
	bshuffle	%f12,	%f10,	%f20
	fcmps	%fcc3,	%f6,	%f21
	fcmpgt16	%f0,	%f0,	%i1
	move	%icc,	%l4,	%i6
	ldub	[%l7 + 0x55],	%l3
	fmovrdne	%i7,	%f22,	%f0
	for	%f16,	%f10,	%f24
	alignaddrl	%g5,	%o7,	%l6
	ldd	[%l7 + 0x48],	%f2
	fpackfix	%f26,	%f1
	add	%g6,	%l2,	%o2
	ldx	[%l7 + 0x48],	%i0
	fxors	%f6,	%f5,	%f24
	ldx	[%l7 + 0x20],	%o6
	movleu	%xcc,	%l1,	%g3
	edge16	%i3,	%l5,	%g1
	sethi	0x0E86,	%l0
	movn	%xcc,	%o4,	%o1
	movl	%icc,	%g2,	%g7
	fmovsl	%xcc,	%f0,	%f17
	edge8	%o3,	%o0,	%o5
	fxors	%f4,	%f2,	%f14
	fmovspos	%xcc,	%f19,	%f24
	srl	%i4,	%g4,	%i2
	movleu	%xcc,	%i1,	%i5
	and	%i6,	0x1D93,	%l3
	addcc	%i7,	0x0726,	%g5
	movpos	%xcc,	%o7,	%l6
	movvs	%icc,	%l4,	%g6
	andcc	%l2,	0x05EC,	%o2
	sethi	0x1BF5,	%i0
	edge16l	%l1,	%o6,	%g3
	fmovrslez	%l5,	%f11,	%f4
	movneg	%icc,	%i3,	%g1
	fmovrdlz	%l0,	%f2,	%f14
	fmovsgu	%icc,	%f1,	%f12
	edge32ln	%o4,	%o1,	%g7
	xor	%g2,	0x1DC4,	%o3
	mulscc	%o5,	0x1561,	%i4
	movvs	%icc,	%o0,	%i2
	subccc	%i1,	%i5,	%g4
	std	%f2,	[%l7 + 0x40]
	movleu	%xcc,	%i6,	%i7
	ldsw	[%l7 + 0x20],	%g5
	sethi	0x0BA6,	%o7
	fmovscc	%icc,	%f12,	%f29
	ldx	[%l7 + 0x68],	%l6
	sll	%l4,	%g6,	%l2
	andcc	%o2,	0x00E5,	%l3
	umulcc	%l1,	%o6,	%i0
	fcmpd	%fcc1,	%f28,	%f22
	subccc	%l5,	0x0486,	%i3
	fcmpd	%fcc1,	%f22,	%f16
	addccc	%g1,	%g3,	%o4
	std	%f4,	[%l7 + 0x38]
	fmuld8sux16	%f19,	%f16,	%f0
	ldx	[%l7 + 0x10],	%l0
	movrne	%g7,	0x3E6,	%o1
	fmovdvc	%icc,	%f4,	%f4
	udivx	%o3,	0x1139,	%g2
	movn	%icc,	%i4,	%o0
	movcc	%icc,	%i2,	%i1
	movle	%xcc,	%o5,	%g4
	movrgz	%i5,	0x009,	%i6
	andncc	%g5,	%i7,	%l6
	ldsw	[%l7 + 0x20],	%o7
	movcs	%xcc,	%g6,	%l2
	fmovrdgz	%l4,	%f20,	%f6
	fmovdn	%xcc,	%f11,	%f27
	fpsub16	%f14,	%f26,	%f10
	mulscc	%l3,	%o2,	%l1
	orn	%i0,	%l5,	%o6
	xnorcc	%g1,	%g3,	%i3
	fmovda	%xcc,	%f14,	%f16
	xnor	%o4,	0x115B,	%g7
	ldsb	[%l7 + 0x17],	%o1
	fmovsvs	%icc,	%f26,	%f30
	movg	%xcc,	%l0,	%o3
	movpos	%icc,	%i4,	%g2
	orncc	%o0,	0x1E48,	%i1
	stw	%o5,	[%l7 + 0x40]
	fxor	%f6,	%f22,	%f0
	nop
	set	0x76, %i0
	ldsh	[%l7 + %i0],	%g4
	st	%f1,	[%l7 + 0x20]
	udiv	%i5,	0x0D84,	%i2
	fornot1	%f8,	%f24,	%f8
	xnorcc	%i6,	%i7,	%g5
	subc	%o7,	%l6,	%g6
	std	%f6,	[%l7 + 0x48]
	edge32l	%l2,	%l4,	%l3
	xorcc	%o2,	%l1,	%i0
	fandnot2s	%f27,	%f23,	%f7
	sir	0x140D
	addcc	%o6,	0x1D7C,	%l5
	restore %g1, %g3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g7,	%i3,	%l0
	udivcc	%o1,	0x16C1,	%o3
	movvc	%icc,	%g2,	%o0
	smul	%i4,	%i1,	%g4
	edge32	%i5,	%o5,	%i2
	fsrc1s	%f30,	%f15
	fpadd16	%f22,	%f6,	%f22
	udivx	%i7,	0x01E2,	%i6
	udivx	%o7,	0x0443,	%l6
	fmovdne	%xcc,	%f15,	%f19
	save %g6, 0x18F7, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l4,	0x0803,	%g5
	movvs	%xcc,	%o2,	%l3
	movpos	%xcc,	%i0,	%l1
	addc	%l5,	%g1,	%o6
	ldsw	[%l7 + 0x70],	%g3
	movcs	%xcc,	%o4,	%i3
	stb	%l0,	[%l7 + 0x76]
	fpsub32	%f22,	%f24,	%f8
	movre	%g7,	0x143,	%o3
	subc	%g2,	%o0,	%o1
	fmovs	%f18,	%f23
	udiv	%i4,	0x056F,	%g4
	sll	%i1,	0x06,	%i5
	edge16ln	%i2,	%o5,	%i6
	nop
	set	0x0C, %g1
	lduw	[%l7 + %g1],	%o7
	movrlz	%l6,	%g6,	%i7
	orncc	%l4,	0x0E9F,	%l2
	fcmped	%fcc1,	%f18,	%f4
	movvc	%xcc,	%g5,	%l3
	sllx	%o2,	%i0,	%l1
	sdivcc	%g1,	0x1543,	%o6
	edge32ln	%l5,	%o4,	%i3
	fmovrdlz	%l0,	%f28,	%f20
	movrgez	%g3,	%g7,	%o3
	add	%g2,	%o1,	%i4
	movcs	%icc,	%o0,	%g4
	udivx	%i1,	0x1C16,	%i5
	array8	%o5,	%i2,	%i6
	sth	%l6,	[%l7 + 0x3A]
	orncc	%o7,	%g6,	%i7
	addccc	%l4,	%l2,	%l3
	movvs	%xcc,	%o2,	%i0
	movgu	%icc,	%l1,	%g1
	fmovdn	%xcc,	%f12,	%f17
	fmovrdlz	%g5,	%f6,	%f20
	movvc	%icc,	%o6,	%o4
	udivx	%i3,	0x11AC,	%l0
	fmovdge	%icc,	%f18,	%f12
	or	%l5,	%g7,	%g3
	fand	%f26,	%f0,	%f22
	fcmped	%fcc2,	%f24,	%f14
	or	%g2,	0x0F94,	%o3
	popc	%i4,	%o1
	lduw	[%l7 + 0x6C],	%g4
	xnor	%i1,	%i5,	%o0
	ldsh	[%l7 + 0x46],	%i2
	andncc	%i6,	%o5,	%l6
	edge8n	%o7,	%i7,	%l4
	sra	%l2,	%l3,	%g6
	fnands	%f16,	%f24,	%f28
	edge16l	%o2,	%i0,	%g1
	ldx	[%l7 + 0x20],	%g5
	orcc	%l1,	%o4,	%o6
	xorcc	%l0,	%l5,	%i3
	edge32l	%g3,	%g2,	%o3
	srlx	%g7,	0x18,	%o1
	ldx	[%l7 + 0x30],	%i4
	movrgez	%g4,	0x0D4,	%i1
	movle	%icc,	%i5,	%i2
	array16	%o0,	%i6,	%o5
	subcc	%o7,	%l6,	%i7
	fmul8ulx16	%f22,	%f18,	%f6
	movrne	%l2,	0x2D8,	%l4
	move	%xcc,	%l3,	%g6
	sdiv	%i0,	0x0516,	%o2
	edge32ln	%g5,	%g1,	%l1
	save %o6, 0x0CFD, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o4,	%i3
	std	%f6,	[%l7 + 0x70]
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	sllx	%g7,	0x01,	%o1
	movn	%xcc,	%i4,	%g4
	xor	%o3,	0x1C3B,	%i5
	movrgz	%i2,	0x081,	%i1
	array32	%o0,	%i6,	%o5
	srl	%l6,	0x08,	%i7
	fcmpne16	%f0,	%f6,	%o7
	mulscc	%l2,	%l4,	%l3
	fpsub16s	%f2,	%f26,	%f1
	array32	%i0,	%o2,	%g5
	fmovdvs	%xcc,	%f19,	%f7
	orncc	%g1,	0x019E,	%l1
	xorcc	%o6,	%l0,	%g6
	movge	%xcc,	%i3,	%o4
	srl	%g2,	%g3,	%g7
	andncc	%o1,	%i4,	%l5
	for	%f0,	%f0,	%f4
	movge	%xcc,	%g4,	%o3
	sir	0x0C56
	add	%i2,	%i5,	%i1
	edge16	%i6,	%o5,	%o0
	subccc	%i7,	0x03CA,	%l6
	stw	%l2,	[%l7 + 0x34]
	or	%l4,	%l3,	%i0
	addcc	%o7,	%g5,	%o2
	array32	%g1,	%o6,	%l1
	fmovdl	%icc,	%f9,	%f9
	edge16l	%g6,	%l0,	%i3
	movrlez	%g2,	%o4,	%g3
	movcc	%xcc,	%o1,	%g7
	srl	%i4,	%g4,	%o3
	st	%f21,	[%l7 + 0x58]
	sllx	%l5,	0x0F,	%i2
	mulx	%i5,	%i1,	%i6
	edge16l	%o5,	%o0,	%i7
	xnor	%l2,	%l4,	%l6
	fmovscc	%xcc,	%f6,	%f19
	nop
	set	0x50, %o1
	lduh	[%l7 + %o1],	%l3
	edge16l	%i0,	%g5,	%o2
	movcs	%xcc,	%o7,	%o6
	movrgez	%g1,	%l1,	%l0
	movvs	%xcc,	%g6,	%i3
	mova	%xcc,	%o4,	%g2
	xnorcc	%o1,	0x0A56,	%g7
	and	%i4,	%g3,	%g4
	edge8l	%o3,	%l5,	%i5
	fmovsneg	%icc,	%f0,	%f2
	movcs	%xcc,	%i2,	%i1
	orn	%i6,	0x13EE,	%o0
	fornot2s	%f23,	%f7,	%f15
	udivcc	%i7,	0x12BE,	%l2
	udiv	%l4,	0x150E,	%o5
	fmul8x16al	%f9,	%f9,	%f30
	mova	%xcc,	%l6,	%l3
	fnands	%f5,	%f11,	%f31
	subcc	%g5,	%i0,	%o2
	fornot2	%f30,	%f8,	%f12
	movcc	%icc,	%o6,	%o7
	edge8ln	%l1,	%l0,	%g1
	movleu	%icc,	%g6,	%i3
	movle	%icc,	%g2,	%o1
	addcc	%o4,	%i4,	%g3
	std	%f6,	[%l7 + 0x60]
	ldub	[%l7 + 0x45],	%g7
	move	%icc,	%o3,	%g4
	xnorcc	%i5,	%l5,	%i2
	sdivcc	%i1,	0x172D,	%i6
	ldd	[%l7 + 0x68],	%f12
	ld	[%l7 + 0x70],	%f22
	fnegs	%f13,	%f17
	movgu	%xcc,	%i7,	%o0
	smul	%l4,	%l2,	%l6
	sdiv	%o5,	0x04CA,	%g5
	sdivcc	%i0,	0x1A7C,	%l3
	edge8n	%o2,	%o7,	%l1
	udiv	%o6,	0x012A,	%g1
	fornot1s	%f6,	%f26,	%f12
	edge8n	%g6,	%i3,	%l0
	array8	%o1,	%o4,	%i4
	movcc	%icc,	%g3,	%g7
	fmovdleu	%icc,	%f24,	%f31
	addc	%g2,	0x133B,	%g4
	ldx	[%l7 + 0x10],	%o3
	movpos	%icc,	%l5,	%i5
	sth	%i2,	[%l7 + 0x12]
	array16	%i6,	%i7,	%i1
	xorcc	%o0,	%l4,	%l6
	array8	%l2,	%o5,	%i0
	fmovdg	%xcc,	%f14,	%f27
	fnor	%f20,	%f22,	%f10
	fmovdcc	%xcc,	%f3,	%f15
	sdivcc	%l3,	0x128D,	%o2
	movle	%icc,	%o7,	%g5
	movpos	%xcc,	%l1,	%g1
	andncc	%g6,	%o6,	%i3
	fcmped	%fcc2,	%f8,	%f24
	edge16l	%l0,	%o4,	%o1
	alignaddr	%g3,	%i4,	%g7
	sir	0x0426
	movrgez	%g4,	%o3,	%l5
	movne	%icc,	%g2,	%i5
	st	%f0,	[%l7 + 0x74]
	movvs	%icc,	%i2,	%i6
	ldub	[%l7 + 0x64],	%i1
	smulcc	%o0,	0x14B0,	%l4
	ldd	[%l7 + 0x38],	%f20
	udiv	%i7,	0x14D0,	%l6
	ldsh	[%l7 + 0x76],	%o5
	fmovrdgez	%i0,	%f16,	%f30
	edge8ln	%l2,	%o2,	%l3
	sir	0x139F
	fmovs	%f23,	%f18
	fsrc1s	%f16,	%f12
	save %g5, 0x1E74, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g1,	%l1,	%o6
	edge16l	%i3,	%l0,	%g6
	stw	%o1,	[%l7 + 0x64]
	movcc	%xcc,	%o4,	%i4
	fxnor	%f2,	%f10,	%f8
	orn	%g3,	0x1AF6,	%g7
	edge8n	%g4,	%o3,	%l5
	edge8l	%i5,	%g2,	%i2
	nop
	set	0x08, %g5
	stw	%i6,	[%l7 + %g5]
	fcmpne32	%f20,	%f12,	%o0
	stx	%l4,	[%l7 + 0x38]
	or	%i1,	0x14FE,	%i7
	movne	%xcc,	%o5,	%l6
	addcc	%l2,	%i0,	%l3
	movleu	%icc,	%g5,	%o2
	edge16	%g1,	%l1,	%o6
	movge	%icc,	%o7,	%l0
	fmovsle	%icc,	%f26,	%f23
	movcs	%icc,	%i3,	%g6
	edge16	%o1,	%o4,	%g3
	edge32	%i4,	%g7,	%g4
	movre	%l5,	0x2FF,	%i5
	faligndata	%f12,	%f8,	%f0
	lduh	[%l7 + 0x60],	%g2
	movgu	%icc,	%i2,	%i6
	xor	%o0,	%o3,	%i1
	fmul8x16al	%f28,	%f29,	%f30
	fmovdn	%xcc,	%f6,	%f22
	movrgez	%i7,	0x2CC,	%o5
	st	%f5,	[%l7 + 0x5C]
	fmovrsgez	%l4,	%f21,	%f3
	sdivx	%l6,	0x1DF6,	%l2
	movrne	%l3,	0x06E,	%i0
	fpsub16	%f22,	%f10,	%f24
	sllx	%g5,	0x10,	%o2
	fsrc1	%f4,	%f26
	fmovdle	%xcc,	%f21,	%f16
	edge32n	%g1,	%o6,	%l1
	fandnot2	%f6,	%f4,	%f8
	ldd	[%l7 + 0x38],	%f16
	ldd	[%l7 + 0x30],	%o6
	xor	%l0,	0x06B4,	%i3
	sll	%o1,	0x09,	%g6
	nop
	set	0x10, %l6
	ldx	[%l7 + %l6],	%o4
	movre	%g3,	0x185,	%g7
	edge32l	%g4,	%i4,	%i5
	sth	%l5,	[%l7 + 0x7A]
	add	%i2,	0x1DEA,	%g2
	movcc	%xcc,	%o0,	%i6
	edge32n	%i1,	%o3,	%o5
	fsrc2s	%f24,	%f13
	srlx	%i7,	%l4,	%l6
	fmovsvs	%icc,	%f31,	%f4
	addc	%l3,	%l2,	%g5
	srlx	%i0,	0x1F,	%o2
	srl	%g1,	0x0F,	%o6
	nop
	set	0x4A, %g3
	stb	%o7,	[%l7 + %g3]
	siam	0x4
	nop
	set	0x60, %l3
	stw	%l0,	[%l7 + %l3]
	addccc	%i3,	%l1,	%g6
	movpos	%icc,	%o4,	%o1
	or	%g7,	0x0AB1,	%g3
	edge32l	%i4,	%g4,	%l5
	edge16	%i5,	%g2,	%o0
	fmovsa	%icc,	%f0,	%f10
	srl	%i2,	0x1E,	%i1
	st	%f31,	[%l7 + 0x14]
	mulscc	%i6,	%o3,	%i7
	movre	%l4,	0x00B,	%l6
	fpadd32s	%f15,	%f11,	%f1
	fcmpeq32	%f12,	%f10,	%o5
	fones	%f17
	fnot2s	%f3,	%f31
	array16	%l2,	%l3,	%g5
	andn	%i0,	%o2,	%o6
	edge16	%g1,	%l0,	%i3
	array32	%l1,	%g6,	%o4
	andcc	%o1,	%o7,	%g3
	lduh	[%l7 + 0x32],	%g7
	edge8l	%g4,	%i4,	%i5
	fmovrsgz	%g2,	%f13,	%f28
	ldd	[%l7 + 0x68],	%o0
	xorcc	%l5,	0x1B60,	%i2
	xnorcc	%i1,	0x000A,	%i6
	fandnot2	%f26,	%f24,	%f26
	stx	%i7,	[%l7 + 0x38]
	movvs	%xcc,	%l4,	%l6
	movrgz	%o3,	0x0FD,	%l2
	fxors	%f22,	%f7,	%f29
	xor	%l3,	0x1312,	%g5
	alignaddr	%o5,	%o2,	%o6
	xor	%i0,	%l0,	%g1
	array8	%l1,	%g6,	%o4
	alignaddrl	%o1,	%i3,	%g3
	sdivcc	%o7,	0x14FF,	%g7
	movre	%g4,	0x2DA,	%i4
	edge32ln	%i5,	%o0,	%g2
	movgu	%icc,	%i2,	%i1
	edge8n	%l5,	%i6,	%i7
	and	%l6,	0x0843,	%l4
	mulx	%l2,	0x0EF2,	%l3
	fpadd32s	%f0,	%f31,	%f26
	mulscc	%g5,	%o5,	%o2
	lduh	[%l7 + 0x2C],	%o3
	movrgez	%o6,	%i0,	%l0
	fmovsle	%icc,	%f23,	%f12
	ldub	[%l7 + 0x63],	%g1
	movrne	%l1,	%o4,	%g6
	srl	%i3,	%o1,	%o7
	std	%f4,	[%l7 + 0x28]
	ldd	[%l7 + 0x68],	%f22
	edge32ln	%g7,	%g4,	%g3
	add	%i5,	0x0A5C,	%i4
	alignaddrl	%o0,	%g2,	%i1
	popc	0x1B36,	%i2
	sir	0x14CD
	ldsb	[%l7 + 0x6C],	%l5
	edge16l	%i7,	%i6,	%l4
	edge32n	%l2,	%l6,	%l3
	sll	%o5,	%o2,	%g5
	mulscc	%o6,	0x0767,	%i0
	movrne	%o3,	%l0,	%l1
	sdiv	%g1,	0x0EA3,	%o4
	sir	0x0A99
	fandnot2	%f0,	%f28,	%f20
	addccc	%g6,	%o1,	%o7
	fpadd32	%f12,	%f30,	%f12
	umul	%i3,	%g7,	%g4
	smul	%g3,	0x0BA7,	%i4
	umulcc	%o0,	%i5,	%g2
	edge8n	%i1,	%i2,	%i7
	xnorcc	%l5,	0x05F3,	%i6
	xnorcc	%l2,	%l4,	%l3
	addcc	%l6,	%o2,	%o5
	andn	%g5,	%o6,	%o3
	fmovrsgz	%l0,	%f18,	%f17
	xnor	%i0,	0x0E1B,	%l1
	alignaddr	%o4,	%g6,	%o1
	fmovsle	%icc,	%f22,	%f28
	andcc	%o7,	0x07C3,	%g1
	sdiv	%g7,	0x15FF,	%i3
	subc	%g3,	%i4,	%g4
	movg	%icc,	%o0,	%i5
	ldx	[%l7 + 0x20],	%g2
	movle	%icc,	%i2,	%i1
	movg	%icc,	%i7,	%i6
	fpackfix	%f0,	%f6
	srax	%l5,	0x0A,	%l4
	srax	%l3,	%l6,	%l2
	fpack32	%f6,	%f6,	%f14
	movrgez	%o2,	%o5,	%g5
	ldsb	[%l7 + 0x15],	%o6
	movcc	%xcc,	%o3,	%i0
	xnor	%l1,	0x1E06,	%o4
	stw	%g6,	[%l7 + 0x5C]
	xnor	%l0,	0x19C1,	%o7
	array32	%o1,	%g1,	%i3
	movrgz	%g7,	0x01B,	%g3
	fmovrdlez	%i4,	%f20,	%f26
	edge32l	%o0,	%g4,	%i5
	ldub	[%l7 + 0x26],	%i2
	ldsh	[%l7 + 0x2E],	%g2
	lduw	[%l7 + 0x44],	%i7
	ldd	[%l7 + 0x10],	%i0
	sdiv	%l5,	0x0A44,	%i6
	sdivx	%l3,	0x0432,	%l4
	subcc	%l2,	0x021C,	%o2
	edge16	%o5,	%l6,	%g5
	fands	%f23,	%f16,	%f8
	ldsh	[%l7 + 0x42],	%o6
	st	%f21,	[%l7 + 0x0C]
	fpack16	%f6,	%f18
	for	%f8,	%f0,	%f8
	edge16l	%i0,	%o3,	%l1
	edge32	%o4,	%g6,	%o7
	fsrc2	%f2,	%f0
	ldub	[%l7 + 0x7B],	%o1
	movneg	%icc,	%l0,	%g1
	edge8	%i3,	%g3,	%g7
	sethi	0x1047,	%o0
	array16	%i4,	%g4,	%i5
	movgu	%icc,	%i2,	%g2
	movge	%icc,	%i7,	%i1
	fmovsg	%xcc,	%f31,	%f23
	fcmps	%fcc3,	%f14,	%f10
	fcmpes	%fcc1,	%f9,	%f4
	movvs	%xcc,	%i6,	%l5
	umulcc	%l4,	0x1A1E,	%l2
	sra	%l3,	%o2,	%o5
	movrlez	%g5,	%l6,	%o6
	movne	%icc,	%i0,	%l1
	movvc	%icc,	%o3,	%o4
	movrlz	%g6,	%o1,	%o7
	sir	0x02DF
	movrlez	%g1,	0x0DD,	%i3
	movl	%xcc,	%l0,	%g7
	fcmped	%fcc3,	%f20,	%f14
	fmovsge	%icc,	%f6,	%f16
	lduh	[%l7 + 0x6A],	%g3
	sethi	0x1DEB,	%o0
	array32	%g4,	%i5,	%i2
	alignaddrl	%i4,	%g2,	%i7
	fmovsle	%icc,	%f10,	%f5
	mulscc	%i1,	%l5,	%l4
	ldsb	[%l7 + 0x5B],	%l2
	siam	0x1
	srl	%l3,	0x05,	%o2
	std	%f22,	[%l7 + 0x58]
	stx	%i6,	[%l7 + 0x08]
	fmovrdlez	%o5,	%f8,	%f14
	sdiv	%l6,	0x045B,	%o6
	umul	%g5,	%i0,	%o3
	movn	%icc,	%l1,	%g6
	sdiv	%o4,	0x0D14,	%o7
	fmovspos	%xcc,	%f26,	%f1
	edge8	%o1,	%g1,	%i3
	stw	%g7,	[%l7 + 0x58]
	mulx	%l0,	0x19D0,	%g3
	movn	%xcc,	%o0,	%i5
	nop
	set	0x38, %g2
	std	%f0,	[%l7 + %g2]
	edge8l	%g4,	%i4,	%g2
	movrne	%i2,	%i1,	%i7
	andn	%l5,	0x0F31,	%l4
	edge32l	%l3,	%l2,	%o2
	movcs	%xcc,	%i6,	%o5
	alignaddrl	%o6,	%g5,	%l6
	movle	%icc,	%i0,	%l1
	sdiv	%o3,	0x14B6,	%g6
	ldsb	[%l7 + 0x65],	%o4
	umulcc	%o7,	0x16F1,	%g1
	udivcc	%i3,	0x1AD6,	%g7
	mulx	%l0,	%g3,	%o0
	sra	%i5,	0x19,	%g4
	sra	%o1,	%g2,	%i4
	srlx	%i2,	%i1,	%i7
	array32	%l4,	%l5,	%l3
	movre	%l2,	0x1C4,	%o2
	fandnot2	%f8,	%f4,	%f20
	movn	%icc,	%i6,	%o5
	edge32ln	%o6,	%l6,	%g5
	stb	%i0,	[%l7 + 0x35]
	subcc	%o3,	%g6,	%l1
	srax	%o4,	%o7,	%g1
	udivcc	%g7,	0x1B35,	%l0
	edge8n	%i3,	%o0,	%g3
	smulcc	%i5,	%g4,	%g2
	edge32ln	%o1,	%i4,	%i1
	andn	%i7,	0x1ADD,	%l4
	fmovdneg	%xcc,	%f29,	%f18
	edge16	%i2,	%l3,	%l5
	fmovsleu	%xcc,	%f13,	%f5
	edge8ln	%o2,	%l2,	%i6
	udivx	%o6,	0x143C,	%o5
	fmovdn	%xcc,	%f23,	%f10
	andncc	%l6,	%g5,	%i0
	sub	%g6,	%l1,	%o4
	fmovsg	%xcc,	%f21,	%f2
	edge32l	%o3,	%o7,	%g1
	fmovrdlez	%g7,	%f16,	%f22
	sub	%i3,	%o0,	%l0
	movn	%icc,	%i5,	%g4
	ldsw	[%l7 + 0x74],	%g2
	movrlz	%g3,	%o1,	%i1
	array32	%i7,	%l4,	%i2
	popc	0x0188,	%i4
	edge32ln	%l5,	%o2,	%l2
	subc	%i6,	0x1770,	%o6
	fmovdg	%icc,	%f18,	%f7
	bshuffle	%f8,	%f28,	%f16
	fmovsvs	%xcc,	%f0,	%f13
	fmovde	%icc,	%f3,	%f14
	fcmpes	%fcc3,	%f0,	%f11
	movvc	%xcc,	%o5,	%l6
	mulx	%g5,	%i0,	%l3
	nop
	set	0x28, %o7
	ldub	[%l7 + %o7],	%g6
	ldd	[%l7 + 0x78],	%o4
	addcc	%l1,	%o3,	%o7
	edge32l	%g7,	%g1,	%i3
	andcc	%o0,	0x0B0D,	%i5
	sdivcc	%l0,	0x13AA,	%g4
	fcmpd	%fcc2,	%f22,	%f22
	movrgz	%g2,	0x30F,	%g3
	movvs	%icc,	%o1,	%i1
	sllx	%l4,	%i7,	%i2
	sethi	0x086A,	%l5
	edge8ln	%i4,	%o2,	%l2
	fmovrslz	%o6,	%f17,	%f15
	sethi	0x1E8D,	%o5
	fpadd32	%f2,	%f2,	%f10
	fmovsvc	%icc,	%f15,	%f30
	andn	%l6,	%i6,	%i0
	ldd	[%l7 + 0x08],	%f26
	sra	%l3,	0x0C,	%g5
	movrgez	%o4,	%g6,	%l1
	movrlz	%o3,	0x242,	%o7
	fcmpeq16	%f18,	%f0,	%g7
	xorcc	%g1,	%o0,	%i5
	fsrc2	%f30,	%f16
	fmovdpos	%xcc,	%f13,	%f23
	movgu	%icc,	%l0,	%g4
	fnot1s	%f17,	%f11
	sir	0x194B
	array8	%g2,	%i3,	%g3
	move	%icc,	%o1,	%i1
	edge8	%l4,	%i2,	%i7
	alignaddrl	%l5,	%o2,	%l2
	orn	%i4,	0x1A52,	%o5
	array32	%o6,	%l6,	%i0
	fmovrslz	%l3,	%f2,	%f26
	fcmpgt16	%f4,	%f20,	%i6
	udivcc	%g5,	0x14C4,	%g6
	edge8n	%l1,	%o4,	%o3
	fmovde	%icc,	%f1,	%f14
	fnot1	%f20,	%f4
	ldx	[%l7 + 0x30],	%g7
	orncc	%g1,	0x0363,	%o7
	movl	%icc,	%i5,	%l0
	sir	0x1C7F
	fcmpgt16	%f6,	%f0,	%o0
	sdivx	%g4,	0x1847,	%i3
	andncc	%g3,	%g2,	%o1
	subccc	%l4,	0x03CA,	%i2
	edge16ln	%i7,	%l5,	%o2
	fmovrsgez	%i1,	%f16,	%f29
	umulcc	%l2,	0x1EB2,	%o5
	popc	0x1F6B,	%o6
	edge16	%l6,	%i0,	%i4
	and	%i6,	%g5,	%l3
	addcc	%g6,	0x124A,	%l1
	orncc	%o4,	0x11A1,	%o3
	fabsd	%f4,	%f28
	edge8l	%g7,	%o7,	%g1
	restore %l0, %i5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i3,	0x07D4,	%g3
	lduw	[%l7 + 0x0C],	%o0
	fmul8sux16	%f10,	%f2,	%f10
	umul	%g2,	0x0E17,	%l4
	mova	%icc,	%i2,	%i7
	move	%icc,	%l5,	%o2
	movl	%icc,	%i1,	%l2
	movl	%xcc,	%o5,	%o1
	mulx	%o6,	%l6,	%i0
	sra	%i4,	0x06,	%g5
	move	%xcc,	%l3,	%i6
	movgu	%xcc,	%l1,	%o4
	movrgez	%g6,	0x1C5,	%g7
	fmovsleu	%xcc,	%f9,	%f3
	fmovscs	%icc,	%f26,	%f9
	umulcc	%o7,	%o3,	%g1
	fmul8x16au	%f24,	%f27,	%f8
	xnor	%l0,	0x0DAA,	%i5
	sir	0x0AC1
	subccc	%g4,	%i3,	%g3
	andn	%o0,	0x06D2,	%g2
	fmul8ulx16	%f24,	%f14,	%f18
	edge32	%l4,	%i2,	%l5
	udivx	%o2,	0x1A3E,	%i7
	movl	%icc,	%l2,	%i1
	fandnot2s	%f8,	%f28,	%f14
	fcmpgt32	%f6,	%f26,	%o5
	fmovsvc	%xcc,	%f22,	%f2
	fornot2	%f30,	%f16,	%f2
	orn	%o6,	0x16DE,	%l6
	movrgz	%i0,	0x372,	%i4
	fpadd16	%f30,	%f18,	%f28
	subccc	%o1,	0x1E32,	%l3
	fpsub32	%f0,	%f28,	%f24
	stw	%g5,	[%l7 + 0x38]
	edge8l	%i6,	%o4,	%g6
	addcc	%l1,	%o7,	%g7
	ldub	[%l7 + 0x76],	%o3
	ldsh	[%l7 + 0x72],	%g1
	movn	%icc,	%i5,	%l0
	move	%icc,	%i3,	%g3
	edge32n	%g4,	%o0,	%g2
	sdivx	%l4,	0x04B7,	%i2
	andncc	%l5,	%o2,	%i7
	edge8n	%i1,	%l2,	%o5
	for	%f4,	%f12,	%f0
	orcc	%o6,	%i0,	%l6
	subcc	%i4,	0x069C,	%l3
	edge32	%o1,	%g5,	%i6
	srax	%o4,	0x04,	%l1
	fnands	%f14,	%f19,	%f31
	popc	%o7,	%g6
	edge8ln	%g7,	%g1,	%i5
	fpack32	%f12,	%f8,	%f12
	array32	%l0,	%i3,	%o3
	edge32l	%g3,	%o0,	%g2
	std	%f6,	[%l7 + 0x68]
	fnot2	%f30,	%f14
	array16	%g4,	%l4,	%l5
	ldub	[%l7 + 0x42],	%i2
	movl	%xcc,	%i7,	%o2
	fnegd	%f6,	%f12
	sllx	%i1,	0x1C,	%o5
	movvs	%icc,	%o6,	%l2
	fpack32	%f10,	%f24,	%f8
	sethi	0x1ABB,	%i0
	smul	%i4,	%l6,	%o1
	st	%f25,	[%l7 + 0x20]
	array32	%g5,	%l3,	%i6
	movleu	%icc,	%l1,	%o7
	xnor	%o4,	%g7,	%g1
	subc	%g6,	%l0,	%i3
	movrne	%o3,	0x2E5,	%i5
	fmuld8ulx16	%f20,	%f10,	%f26
	movrlez	%g3,	%g2,	%o0
	ldsw	[%l7 + 0x20],	%g4
	movrne	%l4,	%l5,	%i2
	movn	%icc,	%o2,	%i7
	or	%i1,	0x074F,	%o5
	movrne	%l2,	0x140,	%o6
	addccc	%i0,	%i4,	%o1
	nop
	set	0x6D, %l4
	stb	%l6,	[%l7 + %l4]
	subc	%g5,	0x1A44,	%l3
	movge	%icc,	%l1,	%o7
	mulscc	%o4,	%i6,	%g1
	movrgz	%g7,	0x1FA,	%l0
	sra	%i3,	0x01,	%o3
	movrgez	%g6,	%g3,	%g2
	orn	%o0,	%g4,	%i5
	fmovrsgz	%l5,	%f27,	%f20
	srlx	%l4,	%o2,	%i2
	mulx	%i1,	%o5,	%i7
	fcmpne32	%f2,	%f26,	%l2
	edge8l	%i0,	%i4,	%o6
	addc	%o1,	%g5,	%l6
	fcmpd	%fcc1,	%f28,	%f26
	fmovdn	%xcc,	%f20,	%f1
	edge32ln	%l1,	%l3,	%o4
	sdivcc	%i6,	0x1829,	%g1
	movpos	%xcc,	%g7,	%l0
	add	%o7,	0x0767,	%i3
	stw	%g6,	[%l7 + 0x58]
	fnegs	%f7,	%f18
	sllx	%o3,	%g2,	%g3
	fcmple16	%f2,	%f2,	%g4
	pdist	%f22,	%f12,	%f8
	alignaddr	%i5,	%o0,	%l4
	movn	%xcc,	%l5,	%i2
	save %o2, %o5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l2,	0x10EA,	%i7
	fmovdne	%xcc,	%f2,	%f7
	move	%icc,	%i4,	%i0
	sethi	0x1B88,	%o1
	udivx	%g5,	0x0489,	%l6
	move	%icc,	%l1,	%o6
	stx	%l3,	[%l7 + 0x10]
	fcmped	%fcc0,	%f28,	%f30
	movne	%icc,	%o4,	%i6
	fcmple32	%f24,	%f0,	%g1
	fsrc1s	%f3,	%f6
	fmovspos	%xcc,	%f19,	%f3
	fmovdvc	%icc,	%f7,	%f22
	fmovdcs	%xcc,	%f12,	%f9
	lduw	[%l7 + 0x10],	%g7
	subc	%l0,	%i3,	%o7
	orcc	%o3,	%g2,	%g6
	fsrc2	%f30,	%f22
	movrlez	%g3,	0x31D,	%i5
	fpsub16	%f18,	%f28,	%f30
	sth	%g4,	[%l7 + 0x22]
	sdiv	%l4,	0x1AB2,	%o0
	lduh	[%l7 + 0x42],	%i2
	udivx	%l5,	0x1EAD,	%o2
	nop
	set	0x48, %i2
	stx	%i1,	[%l7 + %i2]
	ld	[%l7 + 0x34],	%f17
	stx	%l2,	[%l7 + 0x38]
	sub	%o5,	0x0198,	%i7
	udiv	%i4,	0x1681,	%o1
	st	%f7,	[%l7 + 0x74]
	srl	%i0,	%l6,	%g5
	add	%o6,	%l3,	%l1
	smulcc	%i6,	0x0E71,	%o4
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	sub	%l0,	%i3,	%o7
	edge8	%g2,	%o3,	%g3
	smul	%g6,	%g4,	%i5
	fandnot2s	%f23,	%f26,	%f30
	fands	%f21,	%f30,	%f18
	edge16n	%l4,	%o0,	%i2
	mulx	%o2,	0x17DC,	%i1
	nop
	set	0x38, %l0
	stx	%l5,	[%l7 + %l0]
	st	%f7,	[%l7 + 0x40]
	ldx	[%l7 + 0x60],	%o5
	fpsub32	%f24,	%f28,	%f26
	fnegs	%f28,	%f19
	fpsub16	%f28,	%f2,	%f4
	fornot2	%f24,	%f8,	%f28
	orn	%i7,	%i4,	%o1
	or	%l2,	%l6,	%i0
	movrgez	%g5,	%o6,	%l1
	sdivcc	%l3,	0x1796,	%o4
	orncc	%i6,	%g1,	%g7
	udivcc	%l0,	0x12C1,	%o7
	edge8l	%i3,	%o3,	%g2
	edge16n	%g6,	%g3,	%g4
	subccc	%l4,	0x09D3,	%i5
	smul	%o0,	0x0C1D,	%i2
	ldub	[%l7 + 0x49],	%o2
	movrne	%i1,	0x17B,	%l5
	orncc	%i7,	%o5,	%i4
	fmovrdgz	%o1,	%f28,	%f16
	addccc	%l6,	%i0,	%g5
	fmovsvc	%xcc,	%f5,	%f28
	or	%l2,	0x0391,	%o6
	and	%l3,	%l1,	%i6
	fandnot2	%f12,	%f18,	%f28
	movle	%icc,	%g1,	%o4
	fpadd16s	%f1,	%f2,	%f29
	ldd	[%l7 + 0x20],	%l0
	subc	%o7,	%g7,	%i3
	ldsw	[%l7 + 0x78],	%o3
	andn	%g2,	0x13E0,	%g3
	movcs	%xcc,	%g4,	%g6
	fmovsleu	%icc,	%f11,	%f31
	movpos	%xcc,	%l4,	%o0
	addccc	%i5,	%o2,	%i2
	edge8n	%l5,	%i7,	%o5
	orn	%i4,	%i1,	%l6
	lduh	[%l7 + 0x54],	%o1
	restore %i0, 0x1B7D, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g5,	%f14,	%f12
	sir	0x11DA
	udivcc	%l3,	0x0B61,	%l1
	fcmpgt16	%f10,	%f22,	%i6
	add	%o6,	0x0FB9,	%o4
	fmovscc	%xcc,	%f24,	%f27
	srl	%l0,	0x07,	%g1
	array32	%o7,	%g7,	%i3
	edge32n	%g2,	%g3,	%o3
	ldsw	[%l7 + 0x20],	%g4
	move	%icc,	%g6,	%l4
	subc	%i5,	0x1A12,	%o2
	lduh	[%l7 + 0x7C],	%o0
	fexpand	%f26,	%f2
	movneg	%icc,	%l5,	%i7
	movge	%icc,	%i2,	%o5
	fmul8x16au	%f2,	%f17,	%f10
	mova	%icc,	%i1,	%l6
	umulcc	%i4,	%i0,	%l2
	movg	%xcc,	%g5,	%l3
	fcmpgt32	%f10,	%f22,	%o1
	edge16ln	%i6,	%l1,	%o6
	edge16l	%o4,	%g1,	%l0
	andn	%g7,	%o7,	%i3
	fmovrse	%g3,	%f27,	%f24
	stx	%o3,	[%l7 + 0x58]
	fmovsgu	%icc,	%f23,	%f0
	edge32n	%g4,	%g6,	%l4
	movn	%icc,	%g2,	%o2
	fones	%f28
	edge32ln	%i5,	%o0,	%i7
	mulx	%l5,	%i2,	%o5
	fornot1	%f12,	%f22,	%f30
	andncc	%i1,	%i4,	%i0
	ldsh	[%l7 + 0x1C],	%l2
	movne	%icc,	%g5,	%l6
	subccc	%o1,	0x03EB,	%i6
	fmovsne	%xcc,	%f31,	%f21
	srl	%l1,	%o6,	%o4
	udivx	%g1,	0x01F3,	%l0
	edge8n	%l3,	%g7,	%i3
	lduh	[%l7 + 0x32],	%g3
	fabsd	%f18,	%f28
	fsrc2s	%f20,	%f21
	array8	%o3,	%o7,	%g6
	fcmpne16	%f18,	%f30,	%g4
	movle	%icc,	%l4,	%o2
	movrne	%g2,	%i5,	%i7
	fnegd	%f30,	%f16
	fnand	%f30,	%f28,	%f16
	move	%xcc,	%o0,	%i2
	movleu	%xcc,	%l5,	%i1
	and	%i4,	%o5,	%i0
	fmovrslez	%l2,	%f31,	%f19
	move	%xcc,	%l6,	%o1
	fmovda	%xcc,	%f25,	%f12
	fsrc2	%f12,	%f6
	sir	0x1906
	array8	%i6,	%l1,	%g5
	andcc	%o6,	%o4,	%g1
	fmuld8sux16	%f22,	%f4,	%f6
	sub	%l0,	%l3,	%i3
	fpmerge	%f15,	%f18,	%f0
	fmovdle	%xcc,	%f31,	%f3
	movrlz	%g3,	%o3,	%g7
	fcmpd	%fcc1,	%f30,	%f18
	smul	%g6,	%o7,	%g4
	movcs	%icc,	%o2,	%g2
	fands	%f12,	%f3,	%f10
	array8	%i5,	%l4,	%o0
	fmovrse	%i7,	%f4,	%f2
	move	%xcc,	%i2,	%l5
	fpmerge	%f25,	%f5,	%f30
	subc	%i4,	%o5,	%i0
	movgu	%xcc,	%l2,	%i1
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	edge32n	%l1,	%g5,	%o6
	stw	%o4,	[%l7 + 0x44]
	orcc	%g1,	0x090B,	%i6
	movvs	%xcc,	%l3,	%i3
	edge32ln	%g3,	%o3,	%g7
	movre	%l0,	0x04F,	%o7
	fmovrsgez	%g4,	%f30,	%f3
	edge8	%g6,	%g2,	%o2
	fmovdl	%icc,	%f9,	%f21
	fnot2s	%f3,	%f8
	fmovscs	%icc,	%f18,	%f13
	sll	%i5,	0x12,	%o0
	fcmpgt32	%f0,	%f4,	%i7
	edge16	%i2,	%l5,	%l4
	edge16n	%o5,	%i4,	%i0
	restore %i1, 0x080F, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l6,	%l2
	movleu	%xcc,	%g5,	%l1
	edge16l	%o4,	%g1,	%i6
	stx	%l3,	[%l7 + 0x08]
	movvs	%xcc,	%o6,	%i3
	movneg	%icc,	%g3,	%o3
	ldd	[%l7 + 0x10],	%g6
	edge8n	%l0,	%g4,	%g6
	subcc	%o7,	0x00A8,	%g2
	movrlez	%o2,	%i5,	%o0
	andn	%i2,	%i7,	%l5
	srlx	%l4,	%i4,	%i0
	srl	%o5,	%o1,	%i1
	fmovdge	%xcc,	%f18,	%f6
	and	%l2,	%g5,	%l1
	fpadd16	%f24,	%f4,	%f8
	movrlez	%l6,	%o4,	%g1
	sdivcc	%l3,	0x0B11,	%i6
	ldsb	[%l7 + 0x2E],	%o6
	array8	%g3,	%o3,	%g7
	and	%i3,	%g4,	%l0
	lduw	[%l7 + 0x40],	%o7
	mulscc	%g2,	%g6,	%o2
	fmovscc	%icc,	%f4,	%f30
	udiv	%o0,	0x174B,	%i5
	subcc	%i7,	%i2,	%l4
	sdivx	%i4,	0x01F8,	%l5
	movneg	%xcc,	%o5,	%i0
	mulscc	%i1,	%o1,	%g5
	ldsh	[%l7 + 0x38],	%l1
	movcs	%xcc,	%l6,	%l2
	movvc	%xcc,	%o4,	%l3
	stw	%g1,	[%l7 + 0x54]
	edge32l	%i6,	%o6,	%o3
	xor	%g7,	0x04B7,	%g3
	andn	%i3,	0x0636,	%l0
	fcmpes	%fcc0,	%f23,	%f23
	mova	%icc,	%g4,	%o7
	sdivcc	%g6,	0x1484,	%o2
	edge32n	%o0,	%i5,	%g2
	edge32ln	%i2,	%i7,	%l4
	edge16	%l5,	%o5,	%i4
	edge16	%i1,	%o1,	%g5
	st	%f9,	[%l7 + 0x44]
	fmovsle	%icc,	%f22,	%f3
	movre	%l1,	0x3AA,	%l6
	fcmpgt32	%f10,	%f20,	%l2
	add	%i0,	0x14D4,	%o4
	fcmpgt32	%f22,	%f24,	%g1
	movvc	%xcc,	%l3,	%i6
	movcs	%xcc,	%o3,	%o6
	ldd	[%l7 + 0x68],	%g6
	sllx	%i3,	%g3,	%l0
	edge8l	%o7,	%g6,	%o2
	fsrc2s	%f0,	%f2
	movne	%icc,	%o0,	%i5
	srlx	%g2,	%g4,	%i7
	movneg	%xcc,	%i2,	%l4
	movvs	%xcc,	%o5,	%i4
	lduh	[%l7 + 0x54],	%l5
	edge16	%o1,	%g5,	%i1
	mova	%xcc,	%l1,	%l6
	array8	%l2,	%o4,	%g1
	add	%l3,	%i0,	%o3
	edge32ln	%i6,	%o6,	%i3
	fpackfix	%f22,	%f10
	save %g3, %g7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc2,	%f28,	%f26
	fnegs	%f10,	%f7
	andncc	%g6,	%l0,	%o0
	ldsb	[%l7 + 0x24],	%i5
	alignaddrl	%g2,	%g4,	%i7
	umulcc	%o2,	%i2,	%o5
	fnor	%f4,	%f18,	%f0
	orncc	%l4,	%i4,	%l5
	edge8ln	%g5,	%i1,	%o1
	fmovsneg	%icc,	%f14,	%f5
	xnor	%l1,	%l6,	%o4
	sdiv	%g1,	0x1C12,	%l2
	fcmpne16	%f24,	%f0,	%l3
	udivx	%o3,	0x08F2,	%i0
	edge8ln	%i6,	%i3,	%o6
	fmovs	%f6,	%f12
	sir	0x11D2
	edge32l	%g3,	%g7,	%g6
	ldub	[%l7 + 0x32],	%o7
	movrgz	%l0,	%o0,	%g2
	mulx	%g4,	0x1A76,	%i7
	edge8ln	%o2,	%i5,	%i2
	and	%l4,	0x1529,	%i4
	move	%xcc,	%l5,	%o5
	siam	0x6
	movl	%icc,	%i1,	%g5
	lduh	[%l7 + 0x32],	%o1
	stx	%l6,	[%l7 + 0x40]
	ldd	[%l7 + 0x38],	%o4
	and	%l1,	%l2,	%g1
	movge	%xcc,	%o3,	%l3
	fpack32	%f10,	%f18,	%f14
	popc	0x1FEE,	%i0
	subc	%i3,	%o6,	%i6
	movcc	%icc,	%g7,	%g3
	fsrc1	%f16,	%f26
	movneg	%xcc,	%o7,	%g6
	stx	%l0,	[%l7 + 0x48]
	srax	%o0,	0x10,	%g4
	lduw	[%l7 + 0x24],	%i7
	edge8ln	%o2,	%i5,	%i2
	ld	[%l7 + 0x24],	%f18
	edge8	%l4,	%g2,	%l5
	sdivcc	%i4,	0x05A6,	%o5
	sdivcc	%g5,	0x089C,	%i1
	fmovsn	%xcc,	%f17,	%f12
	xor	%o1,	%o4,	%l1
	fnand	%f14,	%f20,	%f22
	sdivx	%l2,	0x041B,	%l6
	alignaddr	%o3,	%g1,	%i0
	movge	%xcc,	%i3,	%o6
	smul	%l3,	0x07AD,	%g7
	movn	%xcc,	%g3,	%o7
	and	%g6,	%i6,	%o0
	movvs	%icc,	%l0,	%g4
	orncc	%o2,	%i7,	%i2
	movrgez	%i5,	%l4,	%l5
	movle	%icc,	%g2,	%i4
	ldd	[%l7 + 0x58],	%g4
	udiv	%i1,	0x1598,	%o5
	siam	0x2
	array8	%o4,	%o1,	%l1
	movpos	%icc,	%l2,	%o3
	andncc	%g1,	%l6,	%i0
	stw	%i3,	[%l7 + 0x48]
	movcs	%xcc,	%l3,	%g7
	addc	%g3,	0x18B4,	%o7
	fmovsleu	%xcc,	%f23,	%f27
	subccc	%g6,	0x0B9E,	%o6
	and	%i6,	0x09A1,	%l0
	andn	%o0,	%g4,	%o2
	fands	%f22,	%f2,	%f6
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	add	%l4,	0x1164,	%i7
	fmovsvs	%icc,	%f28,	%f17
	edge32n	%g2,	%l5,	%i4
	xnor	%g5,	0x1E95,	%o5
	sdivcc	%o4,	0x0B83,	%i1
	umulcc	%o1,	%l2,	%l1
	xnorcc	%g1,	%l6,	%i0
	fone	%f12
	fnot2s	%f21,	%f21
	sir	0x0C0C
	subcc	%i3,	0x0161,	%o3
	fornot2s	%f24,	%f2,	%f16
	array16	%g7,	%g3,	%o7
	alignaddrl	%l3,	%o6,	%i6
	fsrc1s	%f19,	%f0
	fmovse	%xcc,	%f23,	%f2
	ldsh	[%l7 + 0x20],	%g6
	udiv	%l0,	0x04BF,	%o0
	movge	%icc,	%o2,	%i2
	orn	%i5,	%l4,	%i7
	fpsub32	%f20,	%f20,	%f26
	ldd	[%l7 + 0x40],	%f12
	array32	%g2,	%l5,	%i4
	edge32l	%g4,	%o5,	%g5
	orncc	%i1,	%o1,	%o4
	and	%l1,	%l2,	%l6
	movleu	%xcc,	%g1,	%i0
	or	%i3,	0x0A6F,	%g7
	movne	%icc,	%o3,	%o7
	udivcc	%g3,	0x04A7,	%o6
	fmovsge	%xcc,	%f29,	%f18
	fpack32	%f14,	%f14,	%f10
	udivcc	%l3,	0x1E33,	%i6
	fnegd	%f2,	%f14
	movneg	%xcc,	%g6,	%o0
	ldd	[%l7 + 0x28],	%f2
	addc	%o2,	%i2,	%l0
	movl	%icc,	%l4,	%i7
	sra	%g2,	%l5,	%i4
	fmovscs	%icc,	%f16,	%f7
	addccc	%i5,	0x1AE6,	%o5
	st	%f7,	[%l7 + 0x18]
	movpos	%icc,	%g5,	%i1
	edge8l	%o1,	%o4,	%g4
	alignaddr	%l2,	%l1,	%l6
	stx	%i0,	[%l7 + 0x58]
	movvc	%xcc,	%i3,	%g7
	edge16n	%o3,	%o7,	%g3
	popc	0x1215,	%o6
	smulcc	%l3,	%g1,	%i6
	fmovrde	%g6,	%f0,	%f30
	lduw	[%l7 + 0x28],	%o2
	mova	%xcc,	%i2,	%o0
	fmovscs	%xcc,	%f18,	%f3
	edge8	%l0,	%i7,	%g2
	movrlz	%l5,	0x2A4,	%l4
	orcc	%i5,	0x1A3A,	%o5
	movrgez	%g5,	0x147,	%i1
	edge32ln	%i4,	%o1,	%g4
	fmovscs	%xcc,	%f3,	%f29
	sra	%l2,	%o4,	%l1
	stx	%i0,	[%l7 + 0x18]
	fcmpgt32	%f0,	%f16,	%i3
	nop
	set	0x18, %l1
	sth	%g7,	[%l7 + %l1]
	sll	%o3,	%l6,	%g3
	alignaddr	%o7,	%o6,	%l3
	fmul8ulx16	%f6,	%f2,	%f12
	movle	%icc,	%g1,	%i6
	movrgz	%g6,	0x245,	%i2
	sub	%o0,	%o2,	%i7
	movle	%xcc,	%l0,	%l5
	udivcc	%g2,	0x0805,	%l4
	edge16l	%i5,	%g5,	%i1
	mova	%xcc,	%o5,	%o1
	fmovdneg	%xcc,	%f17,	%f10
	ldub	[%l7 + 0x70],	%i4
	mulx	%g4,	%o4,	%l2
	ldd	[%l7 + 0x10],	%f30
	edge16	%i0,	%i3,	%l1
	movvs	%icc,	%g7,	%l6
	fandnot2s	%f2,	%f27,	%f5
	movcs	%xcc,	%o3,	%g3
	sethi	0x10A2,	%o6
	fcmple16	%f12,	%f30,	%o7
	sdiv	%l3,	0x1A7D,	%i6
	edge16n	%g1,	%g6,	%i2
	stw	%o0,	[%l7 + 0x20]
	stb	%o2,	[%l7 + 0x18]
	movgu	%xcc,	%i7,	%l5
	udivcc	%l0,	0x141E,	%l4
	movn	%xcc,	%i5,	%g5
	andcc	%i1,	0x195E,	%o5
	ldd	[%l7 + 0x60],	%g2
	fornot1	%f22,	%f26,	%f22
	subcc	%o1,	%g4,	%o4
	array32	%i4,	%i0,	%i3
	edge16ln	%l1,	%g7,	%l2
	ldx	[%l7 + 0x28],	%o3
	ldsb	[%l7 + 0x5B],	%g3
	fcmpgt32	%f22,	%f14,	%o6
	fpsub32s	%f6,	%f6,	%f26
	ldub	[%l7 + 0x0C],	%o7
	srl	%l3,	0x10,	%i6
	popc	%g1,	%g6
	movgu	%icc,	%i2,	%o0
	edge32ln	%l6,	%o2,	%l5
	srax	%l0,	%i7,	%i5
	ldsw	[%l7 + 0x50],	%l4
	orcc	%g5,	0x0070,	%i1
	movcs	%icc,	%o5,	%g2
	fandnot2s	%f8,	%f2,	%f19
	stx	%o1,	[%l7 + 0x30]
	sub	%g4,	%i4,	%i0
	movneg	%xcc,	%i3,	%o4
	xnor	%l1,	0x0DAF,	%l2
	addccc	%o3,	%g3,	%o6
	edge8	%o7,	%g7,	%l3
	fornot2	%f16,	%f26,	%f14
	movl	%xcc,	%g1,	%i6
	fandnot2	%f4,	%f26,	%f30
	sir	0x0716
	edge32n	%i2,	%g6,	%o0
	ldsb	[%l7 + 0x0B],	%o2
	fmovsleu	%icc,	%f24,	%f24
	orcc	%l6,	0x1234,	%l5
	smulcc	%i7,	0x1C7D,	%l0
	fsrc1	%f20,	%f10
	movl	%xcc,	%l4,	%i5
	array32	%g5,	%o5,	%g2
	edge32	%i1,	%g4,	%i4
	sllx	%i0,	%o1,	%o4
	mulscc	%l1,	0x0FB7,	%i3
	fmovdvs	%xcc,	%f12,	%f9
	srax	%l2,	%o3,	%g3
	sra	%o6,	%g7,	%l3
	orn	%o7,	%i6,	%g1
	xnorcc	%i2,	%o0,	%o2
	movvc	%xcc,	%l6,	%g6
	fmovsgu	%icc,	%f28,	%f7
	fpackfix	%f18,	%f2
	fpadd32s	%f22,	%f19,	%f17
	stx	%i7,	[%l7 + 0x10]
	sdivcc	%l0,	0x0EC2,	%l4
	and	%i5,	0x00F1,	%g5
	edge8l	%l5,	%o5,	%g2
	edge8ln	%i1,	%g4,	%i4
	srax	%o1,	%i0,	%l1
	ldub	[%l7 + 0x09],	%i3
	fmovspos	%icc,	%f24,	%f3
	ldd	[%l7 + 0x08],	%f24
	fmovse	%xcc,	%f11,	%f20
	edge32	%l2,	%o4,	%o3
	edge32l	%g3,	%o6,	%l3
	addcc	%g7,	%i6,	%o7
	ldd	[%l7 + 0x30],	%g0
	fpadd32s	%f4,	%f26,	%f17
	subccc	%o0,	%i2,	%o2
	fmovdpos	%icc,	%f4,	%f1
	fnot1	%f26,	%f30
	fmovsleu	%icc,	%f27,	%f12
	edge8l	%l6,	%i7,	%l0
	edge16n	%l4,	%g6,	%g5
	movne	%icc,	%l5,	%o5
	ldub	[%l7 + 0x48],	%g2
	edge16l	%i1,	%g4,	%i4
	addccc	%o1,	%i5,	%i0
	array8	%l1,	%l2,	%o4
	srlx	%o3,	%i3,	%g3
	xorcc	%o6,	0x17E6,	%l3
	st	%f10,	[%l7 + 0x30]
	fmovsg	%xcc,	%f4,	%f23
	edge32n	%i6,	%o7,	%g7
	sdivcc	%o0,	0x113D,	%g1
	movleu	%xcc,	%i2,	%l6
	fsrc1s	%f9,	%f5
	fnand	%f14,	%f24,	%f26
	smul	%i7,	0x08C3,	%o2
	mulx	%l4,	%l0,	%g6
	movrgez	%g5,	0x1A3,	%o5
	fmul8x16	%f21,	%f10,	%f28
	smul	%l5,	0x1A4A,	%i1
	srlx	%g4,	0x14,	%i4
	movne	%icc,	%g2,	%o1
	move	%icc,	%i5,	%i0
	fmovrsne	%l2,	%f5,	%f23
	movre	%o4,	%l1,	%o3
	orncc	%i3,	%o6,	%g3
	fnors	%f5,	%f24,	%f29
	ldsh	[%l7 + 0x4C],	%l3
	edge32l	%i6,	%o7,	%g7
	ldd	[%l7 + 0x60],	%f12
	andncc	%o0,	%g1,	%l6
	array32	%i7,	%o2,	%l4
	smulcc	%i2,	%g6,	%g5
	movcc	%icc,	%l0,	%o5
	subccc	%i1,	%g4,	%i4
	move	%icc,	%g2,	%o1
	edge32	%i5,	%l5,	%i0
	movvc	%icc,	%o4,	%l1
	ldsw	[%l7 + 0x2C],	%o3
	movge	%icc,	%l2,	%i3
	fmovrse	%o6,	%f10,	%f1
	nop
	set	0x60, %o2
	sth	%l3,	[%l7 + %o2]
	xor	%g3,	0x03A1,	%i6
	edge8n	%o7,	%o0,	%g7
	fors	%f5,	%f24,	%f6
	stw	%g1,	[%l7 + 0x70]
	ldd	[%l7 + 0x58],	%i6
	move	%icc,	%o2,	%l6
	add	%l4,	0x0104,	%g6
	ldx	[%l7 + 0x78],	%g5
	fnegd	%f28,	%f2
	ldd	[%l7 + 0x18],	%f28
	sra	%i2,	0x16,	%l0
	ldx	[%l7 + 0x08],	%i1
	fpadd16	%f30,	%f30,	%f6
	andn	%o5,	0x09AD,	%i4
	array32	%g4,	%o1,	%i5
	orn	%g2,	0x1A13,	%l5
	movgu	%icc,	%i0,	%l1
	array16	%o4,	%l2,	%o3
	movrgez	%i3,	0x02B,	%l3
	fnor	%f0,	%f22,	%f28
	movne	%icc,	%g3,	%o6
	save %o7, %i6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g1,	%i7,	%o2
	edge32l	%l6,	%l4,	%g6
	movrgz	%g5,	%o0,	%i2
	edge8n	%i1,	%l0,	%i4
	movre	%o5,	%g4,	%i5
	fmovrslez	%g2,	%f3,	%f26
	movgu	%xcc,	%l5,	%i0
	movcc	%xcc,	%l1,	%o4
	ldx	[%l7 + 0x08],	%o1
	addccc	%l2,	%i3,	%o3
	array16	%l3,	%o6,	%o7
	edge16l	%g3,	%i6,	%g1
	fmovsneg	%xcc,	%f19,	%f9
	fmovdpos	%xcc,	%f16,	%f4
	array8	%i7,	%o2,	%l6
	orn	%g7,	%l4,	%g5
	std	%f14,	[%l7 + 0x10]
	orcc	%g6,	0x06B2,	%o0
	xnorcc	%i1,	0x1E27,	%i2
	ldsb	[%l7 + 0x51],	%l0
	mova	%icc,	%i4,	%g4
	edge32l	%i5,	%o5,	%g2
	edge8	%i0,	%l1,	%o4
	srlx	%l5,	%o1,	%l2
	orcc	%i3,	0x010A,	%l3
	edge32ln	%o6,	%o3,	%o7
	subc	%i6,	%g3,	%i7
	edge32l	%g1,	%o2,	%l6
	movcc	%xcc,	%l4,	%g5
	srl	%g6,	0x1E,	%g7
	fsrc1	%f0,	%f14
	save %o0, 0x08F1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f24,	[%l7 + 0x60]
	subccc	%l0,	0x0E7A,	%i2
	xnor	%g4,	0x181F,	%i5
	edge32n	%o5,	%i4,	%g2
	movrlez	%i0,	0x22C,	%l1
	sdivx	%o4,	0x1C7F,	%l5
	movre	%o1,	%i3,	%l3
	xnor	%o6,	0x048D,	%l2
	fpack32	%f30,	%f28,	%f28
	umulcc	%o3,	%i6,	%o7
	orn	%i7,	0x0FB3,	%g3
	edge8ln	%g1,	%l6,	%o2
	alignaddrl	%g5,	%g6,	%l4
	subc	%o0,	%g7,	%i1
	movleu	%icc,	%i2,	%l0
	edge32n	%g4,	%o5,	%i5
	stb	%i4,	[%l7 + 0x67]
	fabss	%f3,	%f14
	stb	%g2,	[%l7 + 0x38]
	mulscc	%i0,	%l1,	%o4
	movvc	%xcc,	%o1,	%i3
	edge32ln	%l3,	%l5,	%o6
	array32	%l2,	%i6,	%o7
	edge8n	%i7,	%g3,	%o3
	mova	%icc,	%l6,	%g1
	movpos	%xcc,	%g5,	%o2
	mova	%xcc,	%g6,	%l4
	movrne	%o0,	0x239,	%i1
	srlx	%g7,	0x11,	%l0
	sdivx	%g4,	0x00D0,	%i2
	orcc	%o5,	0x0894,	%i4
	mova	%icc,	%i5,	%i0
	andn	%g2,	%o4,	%l1
	ldub	[%l7 + 0x63],	%i3
	fmovsle	%icc,	%f14,	%f27
	sir	0x1A50
	srl	%l3,	%o1,	%l5
	movrlez	%l2,	%i6,	%o7
	movcs	%xcc,	%o6,	%g3
	sdivx	%o3,	0x10B3,	%l6
	movgu	%xcc,	%i7,	%g1
	fcmpgt32	%f28,	%f30,	%o2
	and	%g6,	0x05F1,	%g5
	fnot2s	%f5,	%f15
	movne	%icc,	%l4,	%i1
	fmovrsne	%g7,	%f18,	%f25
	movle	%icc,	%o0,	%l0
	edge16ln	%i2,	%g4,	%o5
	sra	%i5,	%i4,	%g2
	movvc	%icc,	%o4,	%i0
	array32	%i3,	%l1,	%o1
	srax	%l5,	0x0D,	%l2
	orcc	%i6,	0x065E,	%l3
	fnot1s	%f21,	%f23
	fmovsvc	%xcc,	%f19,	%f9
	edge8n	%o7,	%o6,	%o3
	xnor	%l6,	0x1F47,	%g3
	andn	%i7,	%g1,	%o2
	sdivcc	%g5,	0x1E91,	%l4
	bshuffle	%f0,	%f12,	%f24
	sth	%i1,	[%l7 + 0x48]
	array8	%g6,	%g7,	%o0
	edge16	%l0,	%g4,	%o5
	add	%i5,	%i2,	%g2
	edge32ln	%i4,	%i0,	%i3
	fnor	%f6,	%f8,	%f6
	xor	%l1,	%o4,	%o1
	addc	%l2,	0x0865,	%l5
	popc	0x19CF,	%i6
	movne	%xcc,	%o7,	%o6
	edge16l	%l3,	%o3,	%l6
	movre	%g3,	0x25B,	%i7
	srax	%g1,	0x1E,	%o2
	edge16n	%g5,	%i1,	%l4
	movrgez	%g7,	%o0,	%l0
	ldx	[%l7 + 0x68],	%g6
	std	%f8,	[%l7 + 0x70]
	sir	0x010B
	sethi	0x0B5B,	%o5
	movleu	%icc,	%i5,	%i2
	move	%xcc,	%g2,	%g4
	edge8ln	%i0,	%i3,	%l1
	fcmpgt16	%f8,	%f16,	%o4
	udiv	%i4,	0x151B,	%o1
	mulx	%l2,	%l5,	%o7
	alignaddr	%o6,	%l3,	%i6
	movrne	%o3,	%l6,	%g3
	movn	%icc,	%i7,	%g1
	fcmpeq16	%f0,	%f10,	%g5
	edge8l	%o2,	%i1,	%l4
	addccc	%g7,	%o0,	%l0
	movne	%xcc,	%o5,	%g6
	sethi	0x1866,	%i2
	movcc	%icc,	%g2,	%g4
	movneg	%icc,	%i5,	%i3
	mulscc	%l1,	0x10B0,	%o4
	fmovdvc	%xcc,	%f3,	%f1
	subcc	%i4,	0x08D7,	%o1
	bshuffle	%f8,	%f0,	%f8
	xnorcc	%l2,	%i0,	%o7
	edge16n	%o6,	%l3,	%l5
	edge32ln	%i6,	%o3,	%g3
	fornot2s	%f28,	%f25,	%f16
	sdiv	%l6,	0x0DA0,	%i7
	fmovsa	%icc,	%f6,	%f6
	edge32l	%g5,	%o2,	%g1
	andncc	%l4,	%i1,	%g7
	fornot2s	%f18,	%f23,	%f26
	ldd	[%l7 + 0x60],	%f12
	fnand	%f26,	%f0,	%f10
	fsrc1s	%f24,	%f17
	movl	%xcc,	%o0,	%o5
	array16	%l0,	%g6,	%g2
	sdivx	%i2,	0x0EC5,	%i5
	fxor	%f28,	%f20,	%f22
	movrne	%g4,	%i3,	%o4
	smulcc	%l1,	0x132F,	%i4
	fnot1	%f20,	%f20
	nop
	set	0x0A, %l5
	ldsh	[%l7 + %l5],	%l2
	and	%i0,	%o1,	%o6
	array8	%o7,	%l5,	%l3
	addc	%i6,	%g3,	%l6
	movvs	%xcc,	%i7,	%g5
	lduw	[%l7 + 0x0C],	%o3
	movrne	%g1,	%o2,	%l4
	fones	%f4
	fpadd32	%f22,	%f8,	%f18
	edge8ln	%i1,	%o0,	%g7
	srlx	%l0,	0x05,	%g6
	srax	%o5,	%i2,	%g2
	fcmpgt32	%f6,	%f12,	%i5
	fmovsn	%icc,	%f3,	%f29
	movre	%g4,	%i3,	%l1
	udivx	%o4,	0x0915,	%i4
	fmovdpos	%icc,	%f7,	%f30
	fmovse	%icc,	%f4,	%f28
	orcc	%l2,	%o1,	%o6
	fxors	%f15,	%f16,	%f6
	mulscc	%o7,	%l5,	%i0
	fnand	%f2,	%f26,	%f28
	edge8l	%l3,	%g3,	%i6
	or	%i7,	0x072D,	%l6
	subc	%g5,	0x134D,	%o3
	movleu	%icc,	%g1,	%l4
	addcc	%o2,	0x062D,	%i1
	array32	%g7,	%l0,	%o0
	smul	%o5,	0x0409,	%i2
	save %g6, 0x17D6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g2,	%i3,	%g4
	movcc	%icc,	%l1,	%i4
	fnegs	%f7,	%f25
	edge16l	%l2,	%o4,	%o6
	sethi	0x09FF,	%o1
	fmovrslez	%o7,	%f1,	%f12
	edge16ln	%l5,	%l3,	%g3
	fpackfix	%f12,	%f9
	edge32l	%i0,	%i7,	%l6
	stx	%g5,	[%l7 + 0x20]
	std	%f2,	[%l7 + 0x60]
	movl	%xcc,	%o3,	%i6
	fornot1	%f14,	%f8,	%f12
	srlx	%g1,	%l4,	%i1
	edge16ln	%o2,	%l0,	%g7
	move	%xcc,	%o5,	%o0
	ldd	[%l7 + 0x30],	%g6
	fmovrsne	%i2,	%f11,	%f19
	fabss	%f15,	%f31
	andn	%g2,	%i5,	%g4
	fmovsle	%xcc,	%f29,	%f31
	edge32ln	%l1,	%i4,	%l2
	edge8	%i3,	%o4,	%o6
	movne	%xcc,	%o1,	%o7
	movrgez	%l3,	%l5,	%i0
	movg	%icc,	%g3,	%l6
	edge32	%i7,	%o3,	%g5
	orncc	%i6,	%l4,	%g1
	sth	%o2,	[%l7 + 0x44]
	movn	%xcc,	%i1,	%g7
	fmovscc	%icc,	%f0,	%f29
	fornot2	%f10,	%f24,	%f16
	ldx	[%l7 + 0x08],	%o5
	save %o0, 0x0C54, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i2,	0x1E41,	%l0
	movvc	%icc,	%g2,	%g4
	movrne	%l1,	%i4,	%i5
	fand	%f18,	%f26,	%f26
	orncc	%l2,	%i3,	%o6
	and	%o1,	%o4,	%o7
	fcmpd	%fcc1,	%f30,	%f14
	for	%f18,	%f8,	%f30
	mulscc	%l5,	%l3,	%g3
	edge8	%l6,	%i7,	%i0
	movgu	%icc,	%g5,	%i6
	movre	%l4,	0x3BA,	%g1
	orncc	%o3,	0x083D,	%i1
	movcs	%icc,	%o2,	%o5
	fmovdg	%xcc,	%f21,	%f6
	sethi	0x18DE,	%g7
	stw	%o0,	[%l7 + 0x60]
	fones	%f29
	fmovrdgz	%g6,	%f8,	%f0
	fmovdge	%xcc,	%f9,	%f12
	srl	%i2,	%g2,	%l0
	orcc	%g4,	%l1,	%i4
	alignaddr	%i5,	%l2,	%o6
	edge16ln	%i3,	%o4,	%o7
	lduh	[%l7 + 0x2C],	%l5
	fmovdne	%icc,	%f1,	%f31
	fandnot2s	%f7,	%f21,	%f31
	mulx	%l3,	%o1,	%l6
	std	%f8,	[%l7 + 0x18]
	fxnors	%f27,	%f4,	%f17
	srl	%g3,	0x11,	%i0
	lduh	[%l7 + 0x24],	%i7
	alignaddrl	%i6,	%g5,	%g1
	ldub	[%l7 + 0x61],	%o3
	mulx	%l4,	0x1044,	%o2
	bshuffle	%f8,	%f20,	%f12
	fnors	%f5,	%f23,	%f9
	subc	%o5,	0x0778,	%g7
	movcc	%xcc,	%i1,	%o0
	sllx	%i2,	0x15,	%g6
	srl	%l0,	0x19,	%g4
	movgu	%xcc,	%g2,	%l1
	std	%f10,	[%l7 + 0x68]
	fmovdle	%xcc,	%f5,	%f31
	ldsw	[%l7 + 0x48],	%i4
	sethi	0x1900,	%l2
	movvc	%xcc,	%i5,	%o6
	movre	%i3,	%o4,	%o7
	array8	%l5,	%l3,	%l6
	xnorcc	%o1,	%i0,	%g3
	popc	%i6,	%g5
	ldsb	[%l7 + 0x68],	%i7
	fornot2	%f4,	%f22,	%f24
	stb	%g1,	[%l7 + 0x0F]
	alignaddrl	%o3,	%o2,	%l4
	orn	%g7,	%o5,	%i1
	edge8n	%o0,	%g6,	%l0
	alignaddr	%g4,	%i2,	%l1
	andn	%i4,	%l2,	%g2
	edge32ln	%o6,	%i5,	%i3
	ldsb	[%l7 + 0x4E],	%o4
	array8	%o7,	%l5,	%l3
	edge8l	%l6,	%i0,	%o1
	orcc	%i6,	0x0BCE,	%g3
	srlx	%g5,	%g1,	%i7
	udiv	%o3,	0x0C82,	%o2
	movrne	%l4,	0x311,	%g7
	movrgz	%o5,	0x0D7,	%i1
	sllx	%g6,	%o0,	%g4
	addcc	%l0,	%i2,	%l1
	ld	[%l7 + 0x7C],	%f12
	fpsub32s	%f15,	%f5,	%f25
	edge8l	%l2,	%g2,	%i4
	sub	%i5,	0x17E0,	%o6
	edge8n	%i3,	%o4,	%l5
	fabsd	%f22,	%f12
	sir	0x112F
	sdiv	%l3,	0x1799,	%o7
	ldsb	[%l7 + 0x2E],	%l6
	alignaddr	%o1,	%i6,	%g3
	stx	%i0,	[%l7 + 0x38]
	move	%icc,	%g1,	%i7
	ldd	[%l7 + 0x78],	%f16
	addccc	%g5,	%o2,	%o3
	addcc	%l4,	%o5,	%i1
	fmovrdne	%g7,	%f28,	%f24
	movrgez	%g6,	%o0,	%l0
	ld	[%l7 + 0x64],	%f5
	addc	%g4,	%i2,	%l2
	movrlz	%l1,	%i4,	%i5
	xnorcc	%g2,	0x0958,	%o6
	smul	%i3,	0x10D0,	%l5
	fmovspos	%icc,	%f15,	%f2
	fone	%f14
	movg	%icc,	%l3,	%o4
	restore %l6, %o1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o7,	%i0,	%g3
	fmovdn	%xcc,	%f4,	%f18
	andncc	%g1,	%g5,	%i7
	fmovdcc	%icc,	%f24,	%f30
	orn	%o2,	%l4,	%o5
	srax	%i1,	%g7,	%o3
	nop
	set	0x68, %o0
	ldd	[%l7 + %o0],	%g6
	st	%f24,	[%l7 + 0x24]
	stx	%l0,	[%l7 + 0x08]
	movrlz	%g4,	0x327,	%i2
	fmovdge	%icc,	%f5,	%f31
	sdivx	%o0,	0x160A,	%l2
	movcs	%xcc,	%i4,	%l1
	sra	%g2,	0x03,	%o6
	sethi	0x0148,	%i3
	subccc	%i5,	0x08A0,	%l3
	edge32n	%o4,	%l5,	%l6
	array32	%o1,	%i6,	%o7
	ldsh	[%l7 + 0x56],	%i0
	stw	%g1,	[%l7 + 0x74]
	movrne	%g3,	%g5,	%o2
	fmul8x16au	%f8,	%f2,	%f20
	sra	%l4,	%i7,	%i1
	movg	%xcc,	%g7,	%o3
	array16	%g6,	%o5,	%l0
	sra	%i2,	%g4,	%l2
	movrgez	%o0,	%l1,	%g2
	ldsh	[%l7 + 0x7A],	%o6
	edge32l	%i3,	%i5,	%l3
	fmovsg	%icc,	%f6,	%f22
	std	%f8,	[%l7 + 0x30]
	popc	%o4,	%l5
	srax	%i4,	0x12,	%o1
	movl	%icc,	%l6,	%i6
	lduw	[%l7 + 0x78],	%i0
	srl	%o7,	0x14,	%g3
	fnot2s	%f6,	%f21
	movgu	%xcc,	%g1,	%o2
	nop
	set	0x6C, %l2
	lduh	[%l7 + %l2],	%g5
	edge32n	%l4,	%i1,	%i7
	ld	[%l7 + 0x08],	%f28
	movrgez	%o3,	%g6,	%o5
	fexpand	%f13,	%f12
	fandnot2s	%f14,	%f21,	%f6
	mulx	%l0,	0x1090,	%i2
	andn	%g4,	%g7,	%o0
	movg	%icc,	%l2,	%l1
	sir	0x0BF0
	lduw	[%l7 + 0x18],	%g2
	fxor	%f0,	%f30,	%f22
	ld	[%l7 + 0x3C],	%f9
	movrlz	%i3,	%i5,	%o6
	movneg	%xcc,	%o4,	%l3
	movcs	%xcc,	%l5,	%o1
	std	%f0,	[%l7 + 0x40]
	movn	%icc,	%l6,	%i4
	fnegd	%f14,	%f12
	mulscc	%i6,	%o7,	%g3
	edge32l	%i0,	%g1,	%o2
	subcc	%g5,	0x16C1,	%l4
	fmovrslz	%i7,	%f12,	%f24
	orncc	%i1,	0x04FA,	%o3
	fmovrde	%g6,	%f0,	%f24
	stb	%l0,	[%l7 + 0x1A]
	xnor	%i2,	0x19E4,	%g4
	fandnot2s	%f16,	%f7,	%f26
	addc	%o5,	%o0,	%g7
	srax	%l2,	0x0C,	%l1
	popc	%i3,	%g2
	andncc	%i5,	%o4,	%o6
	movleu	%xcc,	%l3,	%l5
	st	%f6,	[%l7 + 0x08]
	srax	%l6,	%i4,	%i6
	ldub	[%l7 + 0x2D],	%o7
	movge	%icc,	%g3,	%o1
	movn	%icc,	%i0,	%o2
	edge16l	%g1,	%l4,	%i7
	popc	%i1,	%o3
	sdivx	%g5,	0x0962,	%l0
	array8	%g6,	%g4,	%o5
	orncc	%o0,	%g7,	%l2
	udivx	%l1,	0x0B7D,	%i3
	edge8n	%i2,	%i5,	%o4
	array8	%o6,	%g2,	%l3
	subcc	%l5,	%i4,	%l6
	edge32ln	%i6,	%g3,	%o1
	edge32n	%o7,	%i0,	%g1
	edge16ln	%l4,	%o2,	%i7
	fcmpne32	%f10,	%f10,	%i1
	ld	[%l7 + 0x34],	%f5
	sdiv	%o3,	0x07AD,	%g5
	siam	0x0
	save %l0, 0x1A5C, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o5,	%g4,	%g7
	movrgez	%o0,	%l2,	%l1
	movvc	%icc,	%i2,	%i5
	sth	%i3,	[%l7 + 0x7A]
	andncc	%o6,	%g2,	%o4
	fmul8x16	%f0,	%f16,	%f26
	umul	%l5,	0x0FDB,	%i4
	fxors	%f4,	%f6,	%f5
	movne	%xcc,	%l3,	%l6
	sllx	%g3,	0x19,	%i6
	fmovsneg	%icc,	%f26,	%f12
	ldub	[%l7 + 0x24],	%o1
	lduh	[%l7 + 0x38],	%i0
	add	%o7,	0x1B20,	%l4
	sdiv	%o2,	0x00C2,	%i7
	fmul8sux16	%f12,	%f6,	%f24
	ldsb	[%l7 + 0x52],	%g1
	smul	%i1,	0x009F,	%o3
	subc	%g5,	0x00CC,	%l0
	fmovdge	%icc,	%f5,	%f20
	udiv	%o5,	0x0E23,	%g6
	fmovrslez	%g4,	%f15,	%f29
	edge16n	%g7,	%o0,	%l2
	fxor	%f26,	%f6,	%f8
	fmovrdne	%i2,	%f8,	%f6
	fpsub16	%f26,	%f16,	%f4
	lduw	[%l7 + 0x0C],	%l1
	umul	%i3,	%i5,	%g2
	xnorcc	%o6,	%o4,	%l5
	addc	%l3,	%l6,	%i4
	edge16l	%i6,	%o1,	%i0
	ldx	[%l7 + 0x60],	%g3
	fmovscs	%xcc,	%f13,	%f20
	sll	%o7,	0x1B,	%o2
	udivcc	%i7,	0x0FE7,	%g1
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	ldsw	[%l7 + 0x54],	%o3
	fmovsvs	%xcc,	%f20,	%f0
	fmovd	%f8,	%f8
	fxor	%f2,	%f18,	%f24
	sethi	0x0059,	%l0
	edge8	%g5,	%o5,	%g4
	sdivx	%g6,	0x1683,	%g7
	and	%l2,	%o0,	%i2
	sll	%i3,	%i5,	%g2
	edge32n	%l1,	%o4,	%l5
	movn	%icc,	%o6,	%l3
	fmovspos	%icc,	%f4,	%f10
	movne	%icc,	%l6,	%i4
	movvc	%icc,	%o1,	%i0
	movleu	%xcc,	%i6,	%o7
	sth	%o2,	[%l7 + 0x42]
	xor	%g3,	0x1ECE,	%g1
	movrlz	%l4,	%i1,	%i7
	edge32n	%l0,	%o3,	%g5
	srlx	%o5,	0x16,	%g4
	fand	%f14,	%f0,	%f12
	movrlz	%g7,	%g6,	%o0
	mulscc	%i2,	%i3,	%l2
	sllx	%g2,	0x02,	%l1
	subccc	%i5,	%o4,	%l5
	xor	%l3,	%l6,	%o6
	sdivx	%i4,	0x14EE,	%i0
	sdivcc	%i6,	0x1A50,	%o7
	fmovs	%f16,	%f17
	and	%o2,	%o1,	%g3
	fmul8x16au	%f30,	%f18,	%f30
	mova	%icc,	%l4,	%i1
	movrne	%g1,	0x03C,	%i7
	fpsub16s	%f10,	%f22,	%f28
	siam	0x6
	mulscc	%l0,	0x116B,	%o3
	movrgez	%o5,	0x3A8,	%g5
	nop
	set	0x0C, %o6
	ldsw	[%l7 + %o6],	%g4
	movre	%g7,	%g6,	%o0
	smulcc	%i3,	0x1316,	%i2
	fabss	%f6,	%f18
	andn	%l2,	%l1,	%i5
	fmovsl	%icc,	%f12,	%f26
	lduh	[%l7 + 0x40],	%g2
	movcs	%xcc,	%o4,	%l5
	movg	%xcc,	%l3,	%o6
	edge16ln	%l6,	%i0,	%i6
	smul	%i4,	0x1B61,	%o2
	nop
	set	0x0C, %g7
	ldsw	[%l7 + %g7],	%o1
	lduh	[%l7 + 0x30],	%g3
	stb	%l4,	[%l7 + 0x75]
	fcmpeq32	%f20,	%f26,	%i1
	fandnot1s	%f18,	%f29,	%f22
	movge	%icc,	%g1,	%i7
	fmuld8sux16	%f5,	%f24,	%f30
	edge16n	%o7,	%l0,	%o3
	edge32ln	%g5,	%g4,	%g7
	movrlez	%o5,	0x271,	%o0
	edge32ln	%g6,	%i2,	%i3
	fpackfix	%f20,	%f29
	ldsw	[%l7 + 0x34],	%l1
	subccc	%l2,	%g2,	%o4
	stx	%i5,	[%l7 + 0x40]
	movn	%xcc,	%l3,	%l5
	fcmpne16	%f14,	%f14,	%o6
	fcmple32	%f20,	%f28,	%l6
	array16	%i6,	%i0,	%i4
	andn	%o2,	%o1,	%l4
	fmovrslez	%i1,	%f27,	%f2
	fmovd	%f8,	%f8
	fmovsleu	%xcc,	%f19,	%f11
	fmovdl	%xcc,	%f26,	%f30
	xor	%g1,	0x170F,	%g3
	edge8l	%o7,	%i7,	%l0
	xor	%g5,	%o3,	%g4
	or	%o5,	%g7,	%o0
	fornot2	%f4,	%f18,	%f8
	edge32ln	%g6,	%i3,	%l1
	edge16ln	%l2,	%i2,	%o4
	edge16l	%g2,	%l3,	%i5
	restore %l5, %o6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%i0,	%i4
	movre	%o2,	%i6,	%o1
	sdiv	%i1,	0x14AE,	%l4
	udiv	%g1,	0x07B0,	%g3
	movrgez	%o7,	0x09B,	%l0
	sethi	0x187D,	%g5
	lduw	[%l7 + 0x64],	%i7
	srl	%g4,	%o3,	%o5
	orn	%o0,	0x0671,	%g6
	sra	%g7,	%i3,	%l2
	st	%f15,	[%l7 + 0x2C]
	srl	%l1,	0x13,	%o4
	array32	%g2,	%l3,	%i5
	orncc	%i2,	%o6,	%l5
	alignaddrl	%i0,	%l6,	%i4
	sdivcc	%o2,	0x01D0,	%i6
	orcc	%o1,	0x094E,	%i1
	edge16	%g1,	%l4,	%o7
	andn	%l0,	0x0751,	%g5
	fnands	%f16,	%f13,	%f25
	ldsw	[%l7 + 0x70],	%i7
	fsrc2	%f2,	%f8
	std	%f8,	[%l7 + 0x18]
	edge16ln	%g3,	%g4,	%o3
	movle	%icc,	%o5,	%o0
	orn	%g7,	0x0AF9,	%i3
	mulx	%l2,	%l1,	%g6
	fnot2	%f20,	%f14
	array32	%g2,	%l3,	%i5
	movgu	%icc,	%i2,	%o6
	fpackfix	%f14,	%f8
	lduw	[%l7 + 0x58],	%l5
	edge16n	%o4,	%l6,	%i0
	movrlz	%i4,	0x0F0,	%i6
	movrgez	%o1,	0x090,	%o2
	array16	%i1,	%g1,	%o7
	stb	%l4,	[%l7 + 0x56]
	movle	%icc,	%g5,	%i7
	movne	%icc,	%g3,	%l0
	edge16	%g4,	%o3,	%o5
	fmul8sux16	%f22,	%f8,	%f4
	edge32ln	%g7,	%o0,	%l2
	fmovspos	%icc,	%f31,	%f0
	fmovsn	%xcc,	%f9,	%f8
	orn	%l1,	%i3,	%g6
	fmovsn	%xcc,	%f6,	%f3
	and	%g2,	0x06BB,	%l3
	lduw	[%l7 + 0x18],	%i5
	umul	%i2,	0x08FD,	%o6
	orcc	%o4,	%l6,	%i0
	fmovda	%icc,	%f22,	%f14
	udivcc	%l5,	0x0C66,	%i6
	sth	%i4,	[%l7 + 0x62]
	fmovs	%f0,	%f21
	sll	%o2,	%i1,	%o1
	movvc	%xcc,	%o7,	%g1
	sdivcc	%l4,	0x0874,	%i7
	fcmpes	%fcc1,	%f16,	%f7
	andcc	%g3,	%g5,	%l0
	movcs	%xcc,	%o3,	%g4
	ld	[%l7 + 0x24],	%f29
	fandnot2s	%f20,	%f21,	%f25
	movrne	%g7,	%o0,	%o5
	fmovrsne	%l1,	%f0,	%f19
	xorcc	%l2,	0x07EE,	%i3
	move	%icc,	%g2,	%g6
	edge8l	%l3,	%i5,	%i2
	orcc	%o6,	%o4,	%i0
	st	%f10,	[%l7 + 0x58]
	edge32ln	%l5,	%i6,	%l6
	udivx	%o2,	0x0080,	%i4
	umulcc	%o1,	%i1,	%g1
	sth	%o7,	[%l7 + 0x60]
	srax	%l4,	%g3,	%i7
	movge	%icc,	%g5,	%l0
	popc	0x0C1D,	%g4
	udivx	%g7,	0x0093,	%o0
	fmovsgu	%xcc,	%f11,	%f3
	lduh	[%l7 + 0x16],	%o3
	subccc	%l1,	0x1E81,	%o5
	fmovsn	%icc,	%f20,	%f29
	edge8n	%i3,	%l2,	%g6
	movneg	%xcc,	%g2,	%i5
	addcc	%l3,	0x0D57,	%o6
	sdivcc	%o4,	0x0ECC,	%i0
	edge8l	%l5,	%i6,	%l6
	array16	%i2,	%i4,	%o1
	edge32l	%i1,	%g1,	%o2
	fnors	%f14,	%f31,	%f27
	array32	%o7,	%l4,	%g3
	array8	%i7,	%g5,	%l0
	ldub	[%l7 + 0x6A],	%g7
	ldd	[%l7 + 0x58],	%g4
	fmovdcs	%icc,	%f30,	%f11
	fnegs	%f28,	%f1
	and	%o0,	0x115B,	%l1
	xnor	%o3,	0x0DCB,	%o5
	add	%i3,	0x0147,	%l2
	sir	0x0C0E
	edge32l	%g6,	%g2,	%l3
	srax	%o6,	%i5,	%i0
	ldub	[%l7 + 0x44],	%l5
	orcc	%o4,	%i6,	%l6
	movrlez	%i4,	0x11D,	%i2
	sub	%i1,	%o1,	%o2
	fmovdvs	%xcc,	%f16,	%f27
	ld	[%l7 + 0x68],	%f18
	movvs	%icc,	%g1,	%o7
	movre	%l4,	%i7,	%g5
	stw	%l0,	[%l7 + 0x60]
	add	%g7,	%g4,	%g3
	orn	%o0,	%l1,	%o3
	srlx	%i3,	%l2,	%o5
	fmovdvc	%xcc,	%f3,	%f11
	movrgez	%g2,	%l3,	%o6
	fpadd32	%f18,	%f28,	%f4
	edge32l	%g6,	%i5,	%l5
	fmovs	%f15,	%f10
	nop
	set	0x08, %o5
	ldsw	[%l7 + %o5],	%i0
	add	%i6,	0x066B,	%o4
	ldsb	[%l7 + 0x56],	%i4
	xor	%l6,	%i2,	%i1
	edge8	%o2,	%o1,	%g1
	ldsw	[%l7 + 0x38],	%o7
	nop
	set	0x18, %g4
	ldd	[%l7 + %g4],	%f14
	alignaddr	%l4,	%i7,	%l0
	fpadd16	%f20,	%f24,	%f6
	edge32l	%g7,	%g5,	%g3
	fmovda	%xcc,	%f11,	%f12
	srl	%o0,	%g4,	%o3
	ldsh	[%l7 + 0x5E],	%l1
	ldsw	[%l7 + 0x0C],	%l2
	udivx	%i3,	0x1A3F,	%o5
	add	%g2,	%l3,	%o6
	movneg	%icc,	%i5,	%l5
	movrgz	%i0,	0x1FB,	%i6
	move	%xcc,	%g6,	%i4
	ld	[%l7 + 0x5C],	%f6
	nop
	set	0x5C, %i3
	ldsh	[%l7 + %i3],	%l6
	popc	%i2,	%o4
	edge8l	%o2,	%i1,	%o1
	movvs	%xcc,	%g1,	%l4
	fsrc1s	%f0,	%f8
	edge16l	%i7,	%o7,	%g7
	fmovsa	%icc,	%f27,	%f6
	fmovrse	%g5,	%f12,	%f17
	edge16	%l0,	%g3,	%g4
	fmovrde	%o3,	%f8,	%f12
	faligndata	%f16,	%f2,	%f12
	ldsw	[%l7 + 0x2C],	%o0
	udivcc	%l2,	0x12A7,	%l1
	movre	%o5,	0x0F6,	%i3
	movleu	%icc,	%g2,	%l3
	sll	%o6,	%l5,	%i5
	movrgz	%i0,	%g6,	%i4
	movrlz	%l6,	%i6,	%o4
	fsrc2	%f14,	%f26
	addccc	%i2,	0x181C,	%i1
	xorcc	%o1,	%g1,	%l4
	movre	%i7,	0x1A7,	%o7
	edge8l	%o2,	%g7,	%l0
	fnand	%f28,	%f28,	%f16
	fands	%f19,	%f10,	%f26
	smul	%g3,	0x19BC,	%g5
	movre	%g4,	0x152,	%o3
	siam	0x5
	fandnot2	%f2,	%f22,	%f0
	fsrc1s	%f0,	%f24
	fandnot2s	%f2,	%f31,	%f22
	udivx	%l2,	0x1D7A,	%l1
	mulscc	%o5,	0x1FFD,	%o0
	movpos	%icc,	%i3,	%g2
	sethi	0x1E73,	%o6
	edge8	%l5,	%l3,	%i5
	smulcc	%i0,	0x0B9F,	%g6
	movrlz	%i4,	%i6,	%o4
	udivx	%i2,	0x0E2A,	%l6
	array32	%i1,	%o1,	%g1
	movcs	%icc,	%l4,	%i7
	edge16	%o7,	%o2,	%g7
	stw	%l0,	[%l7 + 0x20]
	sethi	0x0A01,	%g3
	array16	%g4,	%g5,	%l2
	movneg	%xcc,	%l1,	%o5
	fmovdl	%icc,	%f8,	%f18
	xor	%o0,	%o3,	%g2
	subc	%i3,	%o6,	%l3
	udivcc	%l5,	0x0FAB,	%i0
	fnot1	%f16,	%f8
	orncc	%g6,	%i4,	%i6
	edge16ln	%o4,	%i5,	%l6
	subccc	%i1,	%o1,	%g1
	movvs	%xcc,	%i2,	%l4
	lduh	[%l7 + 0x0E],	%i7
	stb	%o7,	[%l7 + 0x1F]
	edge8l	%g7,	%o2,	%g3
	ldx	[%l7 + 0x20],	%l0
	alignaddrl	%g4,	%g5,	%l2
	fnot1	%f28,	%f12
	fmovdcc	%icc,	%f31,	%f15
	fmovsl	%icc,	%f2,	%f19
	fpsub32s	%f10,	%f24,	%f12
	movle	%icc,	%l1,	%o5
	array8	%o3,	%o0,	%i3
	fmovdleu	%icc,	%f30,	%f20
	save %g2, %l3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x70],	%f4
	subc	%i0,	%g6,	%l5
	array32	%i4,	%i6,	%o4
	ldsb	[%l7 + 0x0B],	%i5
	ld	[%l7 + 0x4C],	%f13
	udivx	%l6,	0x1BE8,	%o1
	mova	%icc,	%i1,	%g1
	srlx	%l4,	%i2,	%i7
	edge16	%o7,	%o2,	%g3
	srlx	%l0,	%g7,	%g5
	umul	%g4,	0x1F5A,	%l2
	sllx	%l1,	0x1B,	%o5
	fcmpeq32	%f2,	%f26,	%o3
	stw	%i3,	[%l7 + 0x30]
	fmovrsgz	%g2,	%f30,	%f31
	subcc	%l3,	%o6,	%o0
	std	%f24,	[%l7 + 0x08]
	edge8l	%i0,	%g6,	%i4
	fornot1	%f24,	%f8,	%f16
	umulcc	%l5,	%o4,	%i6
	edge8l	%i5,	%o1,	%i1
	edge8l	%g1,	%l6,	%l4
	xorcc	%i2,	%i7,	%o7
	popc	0x1342,	%o2
	movrlz	%g3,	0x107,	%g7
	fmovsleu	%icc,	%f19,	%f23
	subcc	%g5,	0x0894,	%l0
	xor	%g4,	%l1,	%o5
	fmovde	%icc,	%f18,	%f23
	alignaddrl	%o3,	%l2,	%i3
	stx	%l3,	[%l7 + 0x78]
	ldsw	[%l7 + 0x18],	%g2
	subc	%o0,	%i0,	%g6
	mulscc	%i4,	%o6,	%o4
	st	%f30,	[%l7 + 0x14]
	ldd	[%l7 + 0x50],	%f4
	movle	%icc,	%l5,	%i6
	srax	%i5,	%i1,	%g1
	ld	[%l7 + 0x2C],	%f16
	fcmpgt16	%f30,	%f24,	%l6
	stx	%o1,	[%l7 + 0x50]
	fpmerge	%f24,	%f27,	%f28
	movpos	%icc,	%l4,	%i7
	edge32ln	%o7,	%i2,	%o2
	fpack32	%f24,	%f24,	%f22
	fmovd	%f8,	%f4
	movneg	%xcc,	%g7,	%g5
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	fmovrsgz	%l1,	%f20,	%f23
	addccc	%g4,	%o3,	%o5
	fmovsa	%icc,	%f15,	%f0
	fmovde	%icc,	%f13,	%f9
	xnorcc	%i3,	%l2,	%g2
	movre	%l3,	0x042,	%i0
	fmuld8sux16	%f7,	%f8,	%f16
	movrne	%g6,	0x14D,	%o0
	movge	%xcc,	%o6,	%o4
	xnor	%i4,	%l5,	%i6
	std	%f18,	[%l7 + 0x10]
	fpadd16	%f14,	%f22,	%f6
	lduh	[%l7 + 0x36],	%i1
	fsrc2s	%f31,	%f5
	mulx	%g1,	0x0C3F,	%l6
	ldd	[%l7 + 0x48],	%f16
	fors	%f28,	%f19,	%f25
	fcmpne16	%f6,	%f8,	%i5
	andncc	%l4,	%o1,	%i7
	edge32ln	%o7,	%o2,	%g7
	std	%f8,	[%l7 + 0x48]
	edge32n	%g5,	%i2,	%g3
	xnor	%l0,	0x1F09,	%l1
	movg	%xcc,	%o3,	%o5
	udivcc	%i3,	0x0D4F,	%l2
	movrlez	%g4,	%g2,	%l3
	movge	%xcc,	%g6,	%o0
	udivx	%i0,	0x19D8,	%o6
	fcmpd	%fcc3,	%f12,	%f26
	xnor	%o4,	%l5,	%i6
	lduw	[%l7 + 0x60],	%i1
	or	%g1,	0x0E0C,	%i4
	movvc	%icc,	%i5,	%l4
	movn	%xcc,	%l6,	%o1
	movge	%icc,	%o7,	%o2
	mulx	%g7,	%g5,	%i7
	subc	%i2,	%l0,	%g3
	movvc	%icc,	%l1,	%o5
	edge16ln	%i3,	%l2,	%o3
	array32	%g4,	%l3,	%g6
	movvc	%xcc,	%g2,	%o0
	fmovdpos	%icc,	%f12,	%f4
	edge8n	%o6,	%o4,	%l5
	move	%xcc,	%i0,	%i6
	stx	%i1,	[%l7 + 0x70]
	fzero	%f0
	save %i4, 0x11D9, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i5,	%l6
	edge16ln	%l4,	%o1,	%o2
	ld	[%l7 + 0x44],	%f26
	srl	%o7,	0x08,	%g7
	movne	%xcc,	%i7,	%g5
	smul	%i2,	%l0,	%g3
	fones	%f29
	subcc	%l1,	0x190F,	%i3
	sdiv	%o5,	0x120A,	%o3
	fmul8ulx16	%f20,	%f4,	%f8
	addc	%g4,	0x0480,	%l3
	movrlz	%l2,	%g6,	%o0
	fmovdle	%icc,	%f17,	%f31
	umulcc	%o6,	%g2,	%o4
	xnor	%l5,	0x0252,	%i6
	stb	%i1,	[%l7 + 0x61]
	save %i0, 0x0B69, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i4,	%i5,	%l4
	subc	%l6,	0x1014,	%o1
	edge32	%o2,	%o7,	%i7
	ld	[%l7 + 0x68],	%f17
	orcc	%g7,	%i2,	%l0
	ldsh	[%l7 + 0x36],	%g5
	mulscc	%g3,	0x0477,	%i3
	sllx	%l1,	%o3,	%o5
	sethi	0x0C35,	%l3
	movn	%icc,	%l2,	%g4
	movn	%icc,	%o0,	%g6
	srlx	%g2,	%o4,	%l5
	edge32n	%o6,	%i1,	%i6
	fmul8x16	%f31,	%f26,	%f30
	fpsub16s	%f13,	%f27,	%f26
	edge8	%g1,	%i0,	%i4
	fmovspos	%xcc,	%f10,	%f31
	st	%f6,	[%l7 + 0x20]
	orn	%l4,	%i5,	%o1
	ldsw	[%l7 + 0x14],	%o2
	xnor	%o7,	%l6,	%g7
	fmovdn	%icc,	%f13,	%f26
	ldd	[%l7 + 0x20],	%f20
	sth	%i7,	[%l7 + 0x66]
	sllx	%i2,	0x0C,	%l0
	st	%f24,	[%l7 + 0x78]
	movpos	%xcc,	%g5,	%i3
	ldsb	[%l7 + 0x38],	%g3
	subccc	%l1,	0x19BE,	%o5
	fmul8sux16	%f10,	%f20,	%f10
	movne	%xcc,	%o3,	%l2
	fornot1	%f10,	%f30,	%f4
	edge32l	%l3,	%o0,	%g4
	sdivcc	%g6,	0x038A,	%o4
	subccc	%l5,	0x1214,	%g2
	fzeros	%f11
	movrne	%o6,	%i1,	%g1
	fnot1s	%f21,	%f14
	movvc	%icc,	%i6,	%i0
	udiv	%l4,	0x1F89,	%i5
	ldsb	[%l7 + 0x30],	%o1
	movle	%icc,	%i4,	%o7
	movn	%xcc,	%o2,	%g7
	move	%xcc,	%i7,	%l6
	movvs	%icc,	%i2,	%l0
	movge	%xcc,	%i3,	%g3
	movrgz	%g5,	%l1,	%o3
	fmovsg	%xcc,	%f13,	%f31
	sdivx	%l2,	0x1882,	%l3
	movg	%xcc,	%o5,	%g4
	srax	%g6,	%o4,	%l5
	lduw	[%l7 + 0x70],	%o0
	movrlz	%o6,	%i1,	%g2
	fmovscc	%icc,	%f1,	%f22
	ldd	[%l7 + 0x78],	%i6
	ldd	[%l7 + 0x40],	%g0
	alignaddr	%l4,	%i0,	%o1
	alignaddrl	%i5,	%o7,	%i4
	movcs	%xcc,	%g7,	%i7
	nop
	set	0x34, %i7
	stw	%o2,	[%l7 + %i7]
	ldd	[%l7 + 0x68],	%i2
	fmovsneg	%icc,	%f28,	%f31
	fnor	%f18,	%f22,	%f22
	edge8ln	%l0,	%l6,	%i3
	fxors	%f24,	%f14,	%f16
	ldub	[%l7 + 0x2A],	%g5
	srax	%g3,	0x1D,	%l1
	addc	%l2,	%o3,	%o5
	or	%g4,	%g6,	%o4
	ldsh	[%l7 + 0x52],	%l3
	sethi	0x0A26,	%l5
	sth	%o6,	[%l7 + 0x54]
	sra	%i1,	%o0,	%g2
	edge8n	%i6,	%l4,	%g1
	smulcc	%i0,	0x0BCE,	%i5
	movleu	%icc,	%o1,	%i4
	sub	%o7,	%i7,	%g7
	edge32ln	%i2,	%o2,	%l0
	array8	%i3,	%l6,	%g3
	fornot2	%f10,	%f0,	%f20
	orcc	%g5,	0x0DEB,	%l2
	fpack32	%f16,	%f14,	%f0
	restore %o3, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g6,	0x1753,	%g4
	subccc	%l3,	%o4,	%o6
	subc	%i1,	%l5,	%g2
	edge16n	%i6,	%l4,	%o0
	fmovdge	%icc,	%f27,	%f9
	udiv	%i0,	0x0CFC,	%g1
	movrlez	%i5,	%o1,	%o7
	edge8ln	%i7,	%i4,	%g7
	movrlz	%i2,	%l0,	%i3
	srl	%l6,	0x1C,	%o2
	and	%g5,	0x0CA9,	%g3
	nop
	set	0x08, %i1
	ldx	[%l7 + %i1],	%l2
	xor	%o5,	%o3,	%l1
	fmul8x16au	%f9,	%f3,	%f4
	movcs	%xcc,	%g4,	%l3
	fcmple16	%f10,	%f16,	%o4
	faligndata	%f20,	%f8,	%f8
	popc	0x1789,	%g6
	subcc	%o6,	0x1AFE,	%l5
	addcc	%i1,	%g2,	%i6
	fmovrslez	%o0,	%f28,	%f24
	movrlez	%l4,	0x147,	%i0
	andcc	%g1,	%i5,	%o7
	ldd	[%l7 + 0x48],	%i6
	fnot2	%f22,	%f10
	edge32ln	%o1,	%i4,	%g7
	movleu	%xcc,	%i2,	%l0
	st	%f3,	[%l7 + 0x68]
	edge16	%l6,	%o2,	%i3
	udiv	%g5,	0x0505,	%g3
	edge16l	%o5,	%l2,	%l1
	movleu	%xcc,	%g4,	%o3
	std	%f12,	[%l7 + 0x78]
	umulcc	%o4,	0x04D7,	%l3
	sll	%o6,	%g6,	%i1
	sdivcc	%g2,	0x0413,	%i6
	movrlz	%o0,	%l5,	%i0
	sllx	%g1,	%l4,	%i5
	addcc	%i7,	0x1714,	%o1
	xnorcc	%o7,	%g7,	%i4
	popc	0x03A2,	%i2
	ldd	[%l7 + 0x38],	%l0
	movvc	%icc,	%o2,	%l6
	movleu	%xcc,	%i3,	%g3
	subccc	%g5,	0x0996,	%l2
	udiv	%l1,	0x0A50,	%g4
	edge16n	%o3,	%o4,	%l3
	sll	%o5,	%o6,	%i1
	ldsh	[%l7 + 0x14],	%g6
	ldd	[%l7 + 0x38],	%i6
	edge8	%g2,	%o0,	%l5
	movvc	%xcc,	%g1,	%i0
	bshuffle	%f30,	%f24,	%f4
	movl	%xcc,	%i5,	%i7
	movvs	%xcc,	%l4,	%o1
	sdivcc	%o7,	0x131F,	%g7
	movl	%xcc,	%i2,	%l0
	fmovsn	%icc,	%f24,	%f14
	smul	%i4,	0x1364,	%o2
	movrne	%l6,	0x286,	%g3
	srax	%i3,	%g5,	%l1
	fmovdgu	%xcc,	%f12,	%f18
	edge16n	%l2,	%o3,	%g4
	array32	%l3,	%o5,	%o6
	edge8	%i1,	%o4,	%i6
	movrgez	%g6,	0x0F4,	%g2
	edge8ln	%l5,	%g1,	%i0
	and	%i5,	%i7,	%o0
	fornot2	%f10,	%f10,	%f14
	sub	%l4,	0x0891,	%o1
	fmovrsgz	%o7,	%f24,	%f8
	and	%i2,	0x1F44,	%g7
	alignaddr	%l0,	%o2,	%i4
	fcmped	%fcc0,	%f14,	%f10
	sethi	0x1989,	%g3
	array16	%i3,	%l6,	%l1
	fpsub16s	%f26,	%f20,	%f25
	alignaddr	%g5,	%o3,	%g4
	ldx	[%l7 + 0x50],	%l2
	movvs	%icc,	%l3,	%o6
	lduh	[%l7 + 0x2C],	%i1
	smul	%o5,	%i6,	%o4
	move	%icc,	%g2,	%g6
	add	%l5,	0x038A,	%g1
	lduh	[%l7 + 0x72],	%i0
	fpadd32s	%f28,	%f6,	%f14
	addcc	%i5,	%o0,	%i7
	fornot2	%f0,	%f24,	%f22
	orn	%l4,	%o7,	%o1
	std	%f24,	[%l7 + 0x70]
	fmovsneg	%xcc,	%f13,	%f20
	edge16	%i2,	%l0,	%g7
	smulcc	%i4,	%g3,	%i3
	stw	%o2,	[%l7 + 0x70]
	srl	%l6,	%l1,	%g5
	pdist	%f2,	%f2,	%f10
	alignaddrl	%g4,	%l2,	%l3
	fmovdn	%xcc,	%f9,	%f9
	popc	%o3,	%i1
	stb	%o5,	[%l7 + 0x55]
	edge32ln	%i6,	%o6,	%g2
	movrlz	%o4,	0x3B9,	%g6
	xnorcc	%l5,	%i0,	%i5
	sll	%o0,	0x1D,	%g1
	fornot1s	%f31,	%f4,	%f5
	umul	%l4,	0x0A6E,	%o7
	xnorcc	%i7,	%i2,	%l0
	movl	%xcc,	%o1,	%g7
	movgu	%icc,	%i4,	%g3
	addccc	%o2,	%l6,	%i3
	mulscc	%g5,	%g4,	%l2
	stx	%l1,	[%l7 + 0x28]
	lduw	[%l7 + 0x5C],	%l3
	subcc	%o3,	0x11AD,	%i1
	sllx	%i6,	0x03,	%o6
	ldsh	[%l7 + 0x26],	%o5
	array16	%o4,	%g6,	%l5
	fcmple16	%f30,	%f22,	%g2
	fnot1s	%f29,	%f10
	xnorcc	%i0,	%o0,	%g1
	subccc	%i5,	0x0364,	%o7
	movrlz	%i7,	0x3E8,	%l4
	ldsw	[%l7 + 0x1C],	%l0
	and	%i2,	%g7,	%o1
	edge16	%i4,	%g3,	%o2
	fmovde	%icc,	%f21,	%f24
	movrgez	%l6,	%g5,	%i3
	mova	%icc,	%g4,	%l1
	nop
	set	0x0C, %i5
	lduw	[%l7 + %i5],	%l3
	addc	%l2,	0x144E,	%i1
	movge	%xcc,	%i6,	%o6
	movpos	%xcc,	%o3,	%o5
	movvc	%icc,	%g6,	%o4
	xnorcc	%l5,	%i0,	%o0
	movcc	%icc,	%g2,	%i5
	fcmpgt32	%f16,	%f0,	%o7
	alignaddr	%g1,	%i7,	%l4
	and	%i2,	%g7,	%l0
	addc	%o1,	0x1EEE,	%g3
	xnor	%o2,	0x0C9E,	%l6
	orn	%i4,	0x139C,	%g5
	udivcc	%i3,	0x0F33,	%g4
	nop
	set	0x38, %i6
	ldsh	[%l7 + %i6],	%l3
	fcmpeq32	%f18,	%f2,	%l2
	edge32n	%i1,	%l1,	%o6
	lduw	[%l7 + 0x50],	%o3
	fpadd32s	%f23,	%f16,	%f11
	fpsub32s	%f31,	%f8,	%f17
	subccc	%o5,	%g6,	%o4
	fmovdge	%icc,	%f19,	%f26
	movg	%icc,	%l5,	%i0
	srlx	%i6,	0x0F,	%o0
	fones	%f17
	alignaddrl	%i5,	%o7,	%g2
	array8	%g1,	%i7,	%l4
	stb	%g7,	[%l7 + 0x22]
	fcmpeq16	%f22,	%f4,	%i2
	ldub	[%l7 + 0x3F],	%o1
	fornot2	%f14,	%f14,	%f14
	orncc	%l0,	%o2,	%g3
	fornot1s	%f12,	%f30,	%f2
	ldd	[%l7 + 0x60],	%f4
	fmovdvs	%icc,	%f31,	%f11
	edge32l	%i4,	%l6,	%i3
	edge8	%g4,	%g5,	%l2
	movgu	%xcc,	%i1,	%l3
	mulscc	%o6,	%l1,	%o3
	orcc	%g6,	%o5,	%o4
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	fsrc2	%f26,	%f28
	fmovsge	%icc,	%f7,	%f21
	umulcc	%i5,	%o0,	%o7
	udivx	%g2,	0x02D4,	%g1
	movne	%xcc,	%l4,	%g7
	ldx	[%l7 + 0x68],	%i7
	fcmpeq16	%f2,	%f0,	%i2
	fmul8x16au	%f20,	%f16,	%f8
	srlx	%o1,	%o2,	%l0
	fexpand	%f28,	%f2
	ldd	[%l7 + 0x78],	%i4
	orn	%l6,	0x1BE4,	%g3
	andncc	%i3,	%g4,	%l2
	fcmpgt16	%f10,	%f14,	%i1
	udiv	%l3,	0x08EA,	%g5
	lduw	[%l7 + 0x6C],	%o6
	fpadd16s	%f11,	%f30,	%f13
	fnot2	%f12,	%f8
	ldsw	[%l7 + 0x48],	%o3
	addccc	%g6,	0x1B68,	%o5
	ldd	[%l7 + 0x38],	%l0
	fmul8x16au	%f13,	%f30,	%f26
	sll	%o4,	%i0,	%l5
	sdivcc	%i6,	0x0436,	%o0
	sth	%i5,	[%l7 + 0x26]
	edge16l	%o7,	%g2,	%l4
	movneg	%icc,	%g1,	%g7
	fnand	%f28,	%f22,	%f4
	array16	%i7,	%o1,	%o2
	bshuffle	%f10,	%f28,	%f28
	edge16	%i2,	%l0,	%l6
	sllx	%g3,	0x07,	%i4
	edge8n	%i3,	%g4,	%l2
	ld	[%l7 + 0x70],	%f13
	udivx	%i1,	0x157C,	%l3
	array32	%o6,	%o3,	%g6
	fmuld8ulx16	%f14,	%f6,	%f22
	fmovsleu	%xcc,	%f7,	%f25
	umul	%o5,	0x0A82,	%l1
	popc	0x000A,	%o4
	edge16	%g5,	%l5,	%i0
	fmovdge	%icc,	%f17,	%f10
	orncc	%o0,	%i5,	%i6
	fpmerge	%f11,	%f10,	%f10
	fcmpgt32	%f26,	%f6,	%o7
	edge32ln	%g2,	%g1,	%l4
	srax	%i7,	%o1,	%o2
	movrgz	%i2,	0x35B,	%g7
	addcc	%l0,	0x182F,	%l6
	or	%g3,	0x131E,	%i3
	fmul8ulx16	%f18,	%f6,	%f10
	move	%xcc,	%i4,	%g4
	for	%f16,	%f4,	%f4
	move	%xcc,	%l2,	%i1
	sdivcc	%o6,	0x0BC4,	%o3
	movrgez	%g6,	0x2F3,	%o5
	udivcc	%l3,	0x11EC,	%l1
	movge	%xcc,	%g5,	%o4
	or	%i0,	%l5,	%o0
	movn	%icc,	%i5,	%o7
	sdivcc	%i6,	0x1E89,	%g1
	sethi	0x121E,	%g2
	movrlez	%i7,	%l4,	%o2
	xnor	%o1,	%i2,	%l0
	udivx	%g7,	0x1BD9,	%l6
	fnot2	%f6,	%f20
	mulx	%g3,	%i4,	%i3
	movg	%xcc,	%g4,	%i1
	andn	%l2,	%o3,	%o6
	sub	%o5,	0x1D12,	%g6
	movrne	%l3,	0x0BF,	%g5
	udiv	%l1,	0x10EF,	%o4
	fxors	%f24,	%f3,	%f14
	movrne	%i0,	0x339,	%o0
	edge16l	%i5,	%l5,	%o7
	fmovsle	%xcc,	%f13,	%f11
	edge16ln	%i6,	%g1,	%g2
	fmuld8ulx16	%f24,	%f25,	%f28
	edge8l	%i7,	%l4,	%o2
	sra	%i2,	0x0A,	%l0
	mulscc	%g7,	0x0823,	%o1
	umulcc	%g3,	%i4,	%i3
	array32	%g4,	%l6,	%l2
	movn	%xcc,	%o3,	%i1
	movl	%icc,	%o5,	%o6
	fmovsg	%icc,	%f3,	%f21
	movrlz	%l3,	0x302,	%g6
	lduw	[%l7 + 0x48],	%l1
	andn	%g5,	%o4,	%i0
	orncc	%o0,	0x09BA,	%l5
	edge8	%i5,	%i6,	%g1
	srlx	%g2,	%i7,	%l4
	fpadd16s	%f21,	%f26,	%f28
	fmovdcs	%icc,	%f14,	%f10
	addc	%o2,	%i2,	%o7
	sdivcc	%g7,	0x1880,	%l0
	subc	%o1,	0x1917,	%i4
	sdivx	%i3,	0x0888,	%g4
	fmovdg	%xcc,	%f0,	%f20
	movcs	%icc,	%g3,	%l6
	movrne	%o3,	%i1,	%l2
	subccc	%o5,	0x0D2B,	%l3
	umul	%g6,	%l1,	%g5
	movgu	%icc,	%o4,	%i0
	lduh	[%l7 + 0x12],	%o0
	edge32ln	%o6,	%i5,	%i6
	array32	%l5,	%g1,	%g2
	fnand	%f16,	%f10,	%f22
	sub	%l4,	%o2,	%i2
	ldd	[%l7 + 0x20],	%o6
	ldd	[%l7 + 0x70],	%f28
	ldsw	[%l7 + 0x2C],	%g7
	fmovdl	%icc,	%f26,	%f1
	alignaddr	%l0,	%o1,	%i4
	stw	%i7,	[%l7 + 0x1C]
	sdivcc	%g4,	0x0966,	%g3
	udiv	%i3,	0x18FA,	%l6
	sethi	0x1FAD,	%i1
	movpos	%xcc,	%o3,	%l2
	edge16n	%l3,	%g6,	%l1
	umulcc	%o5,	%o4,	%i0
	umul	%g5,	%o6,	%o0
	movrgez	%i5,	0x389,	%i6
	udiv	%l5,	0x0D7F,	%g1
	movleu	%xcc,	%g2,	%o2
	sethi	0x0B1A,	%l4
	fmovrde	%i2,	%f20,	%f0
	edge8	%o7,	%l0,	%o1
	mova	%xcc,	%g7,	%i7
	fnot1s	%f9,	%f29
	edge8n	%g4,	%i4,	%g3
	siam	0x4
	xnorcc	%l6,	0x1C98,	%i3
	save %o3, 0x1598, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l2,	%l3,	%g6
	smul	%o5,	0x1EC9,	%l1
	andncc	%i0,	%g5,	%o6
	subc	%o4,	0x0D74,	%i5
	stx	%i6,	[%l7 + 0x10]
	fmul8x16al	%f8,	%f0,	%f2
	fcmped	%fcc1,	%f16,	%f0
	movl	%icc,	%l5,	%g1
	st	%f26,	[%l7 + 0x70]
	edge32l	%g2,	%o0,	%o2
	orn	%l4,	0x0B67,	%o7
	srax	%l0,	%i2,	%o1
	xor	%g7,	0x1384,	%g4
	edge8l	%i4,	%i7,	%l6
	movcs	%xcc,	%i3,	%o3
	movleu	%xcc,	%i1,	%g3
	move	%xcc,	%l3,	%g6
	fmul8ulx16	%f14,	%f24,	%f2
	addccc	%l2,	0x190A,	%o5
	ldub	[%l7 + 0x0C],	%l1
	ld	[%l7 + 0x70],	%f17
	fnand	%f8,	%f8,	%f28
	ldd	[%l7 + 0x40],	%f30
	edge8	%g5,	%i0,	%o6
	sdiv	%o4,	0x0DB0,	%i6
	movg	%xcc,	%l5,	%i5
	xnor	%g1,	0x0A8A,	%g2
	popc	%o2,	%o0
	array32	%o7,	%l0,	%i2
	andncc	%l4,	%g7,	%g4
	fmovd	%f2,	%f6
	udivcc	%o1,	0x00A6,	%i4
	sethi	0x091D,	%i7
	edge8n	%i3,	%l6,	%i1
	movn	%xcc,	%g3,	%l3
	addcc	%g6,	%o3,	%o5
	sethi	0x0501,	%l2
	movneg	%icc,	%l1,	%i0
	edge32n	%o6,	%o4,	%i6
	fmovse	%icc,	%f5,	%f31
	ldsh	[%l7 + 0x56],	%g5
	edge32l	%l5,	%i5,	%g2
	srax	%g1,	%o2,	%o7
	movvc	%icc,	%o0,	%l0
	sdivcc	%i2,	0x0F73,	%l4
	srlx	%g7,	0x0C,	%o1
	fand	%f30,	%f30,	%f22
	save %i4, %i7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g4,	0x1E93,	%i1
	edge32l	%g3,	%l6,	%l3
	subc	%o3,	0x0618,	%o5
	edge8	%l2,	%l1,	%g6
	subccc	%o6,	%i0,	%i6
	lduh	[%l7 + 0x30],	%o4
	fabss	%f17,	%f20
	stx	%l5,	[%l7 + 0x70]
	orncc	%g5,	%g2,	%i5
	edge8n	%o2,	%o7,	%o0
	movrlez	%g1,	0x0DC,	%i2
	sdivx	%l4,	0x084E,	%g7
	edge16n	%l0,	%i4,	%i7
	sdivx	%o1,	0x094C,	%g4
	movleu	%xcc,	%i3,	%i1
	movn	%icc,	%l6,	%l3
	sth	%g3,	[%l7 + 0x54]
	fornot1	%f28,	%f26,	%f18
	add	%o5,	%o3,	%l1
	edge32ln	%g6,	%o6,	%i0
	fcmpgt32	%f26,	%f18,	%l2
	fsrc1	%f2,	%f4
	ldsw	[%l7 + 0x2C],	%i6
	add	%o4,	%g5,	%g2
	movrgz	%i5,	0x2B6,	%o2
	smulcc	%o7,	%l5,	%o0
	fabsd	%f28,	%f10
	edge8n	%i2,	%l4,	%g1
	movpos	%icc,	%l0,	%i4
	edge16	%i7,	%g7,	%o1
	edge32l	%i3,	%i1,	%g4
	addccc	%l6,	0x154B,	%l3
	edge32n	%g3,	%o5,	%l1
	movl	%xcc,	%o3,	%o6
	array16	%g6,	%l2,	%i0
	orcc	%i6,	%o4,	%g2
	edge16	%g5,	%o2,	%i5
	restore %l5, %o0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l4,	%g1,	%o7
	xor	%i4,	%l0,	%i7
	stx	%o1,	[%l7 + 0x20]
	orncc	%i3,	%i1,	%g4
	addcc	%l6,	%g7,	%l3
	andcc	%o5,	%g3,	%o3
	orcc	%l1,	0x04F8,	%o6
	mova	%icc,	%l2,	%g6
	movrgez	%i0,	%i6,	%g2
	fmovdcc	%xcc,	%f6,	%f22
	movleu	%icc,	%o4,	%g5
	popc	0x1CC2,	%o2
	movrlez	%l5,	0x103,	%o0
	movpos	%xcc,	%i2,	%i5
	movg	%icc,	%g1,	%l4
	fnegs	%f10,	%f3
	ldx	[%l7 + 0x68],	%o7
	sllx	%l0,	0x02,	%i4
	movg	%icc,	%o1,	%i3
	fmovrdgez	%i1,	%f6,	%f0
	orn	%i7,	%g4,	%g7
	srlx	%l3,	0x08,	%l6
	movl	%icc,	%o5,	%o3
	fpsub16	%f30,	%f10,	%f28
	xorcc	%g3,	%o6,	%l2
	stx	%g6,	[%l7 + 0x38]
	ldsh	[%l7 + 0x78],	%l1
	orncc	%i6,	0x17BF,	%i0
	sra	%o4,	%g5,	%g2
	umul	%l5,	%o0,	%o2
	orcc	%i2,	%i5,	%l4
	movrlz	%g1,	0x0B7,	%o7
	move	%icc,	%l0,	%i4
	fsrc1	%f4,	%f2
	umulcc	%i3,	%o1,	%i1
	orncc	%i7,	0x066B,	%g4
	save %g7, %l3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o3,	%g3
	movn	%xcc,	%l6,	%o6
	fmovdneg	%icc,	%f9,	%f22
	edge32n	%l2,	%l1,	%g6
	fmovdle	%xcc,	%f19,	%f31
	alignaddrl	%i6,	%i0,	%o4
	fornot1	%f20,	%f28,	%f14
	edge8	%g5,	%l5,	%o0
	move	%xcc,	%o2,	%i2
	smulcc	%g2,	%l4,	%i5
	movre	%g1,	%o7,	%l0
	edge16ln	%i4,	%o1,	%i3
	fmovsge	%icc,	%f31,	%f8
	movleu	%icc,	%i7,	%i1
	sra	%g7,	0x11,	%l3
	fandnot2s	%f25,	%f30,	%f18
	fmovdl	%xcc,	%f19,	%f8
	movne	%xcc,	%g4,	%o3
	fmovrsgez	%g3,	%f25,	%f17
	addc	%o5,	0x1ABC,	%l6
	edge32n	%o6,	%l2,	%l1
	orncc	%g6,	0x1DD3,	%i0
	fzero	%f18
	fabsd	%f20,	%f26
	edge8ln	%o4,	%g5,	%i6
	movcc	%icc,	%l5,	%o0
	fnor	%f24,	%f12,	%f14
	movle	%xcc,	%i2,	%g2
	stw	%o2,	[%l7 + 0x28]
	ld	[%l7 + 0x6C],	%f24
	fnot1	%f24,	%f18
	fcmps	%fcc1,	%f16,	%f17
	subc	%i5,	%g1,	%o7
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	movre	%i4,	0x2D2,	%i3
	fmovsvc	%xcc,	%f0,	%f8
	movge	%xcc,	%i7,	%g7
	array32	%i1,	%l3,	%o3
	movl	%xcc,	%g4,	%o5
	save %l6, 0x0209, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l2,	%l1,	%g6
	mulx	%i0,	0x0318,	%o6
	fmovs	%f18,	%f1
	lduh	[%l7 + 0x2A],	%g5
	movcc	%icc,	%i6,	%o4
	alignaddr	%l5,	%i2,	%o0
	srl	%o2,	%i5,	%g1
	sdivcc	%g2,	0x198E,	%l4
	fmovscc	%icc,	%f0,	%f2
	edge32l	%o7,	%o1,	%i4
	movl	%icc,	%i3,	%l0
	fzero	%f6
	ldsw	[%l7 + 0x64],	%g7
	fmovdvc	%xcc,	%f10,	%f25
	fzeros	%f12
	andn	%i7,	%i1,	%o3
	fors	%f12,	%f16,	%f29
	fmovrslez	%l3,	%f3,	%f9
	fmovdle	%icc,	%f19,	%f24
	movle	%xcc,	%o5,	%g4
	fmovrslz	%l6,	%f19,	%f0
	fmovda	%xcc,	%f30,	%f24
	movn	%icc,	%g3,	%l1
	fnegs	%f18,	%f28
	udivx	%l2,	0x1493,	%i0
	fsrc1s	%f12,	%f10
	and	%o6,	0x0403,	%g6
	subccc	%g5,	%o4,	%i6
	movleu	%xcc,	%i2,	%l5
	move	%xcc,	%o2,	%o0
	stb	%i5,	[%l7 + 0x76]
	fnors	%f30,	%f18,	%f15
	nop
	set	0x20, %o4
	ldd	[%l7 + %o4],	%f28
	pdist	%f30,	%f10,	%f30
	ldsw	[%l7 + 0x3C],	%g1
	fnot1s	%f17,	%f29
	lduw	[%l7 + 0x6C],	%g2
	stx	%l4,	[%l7 + 0x40]
	orcc	%o7,	%i4,	%i3
	stw	%o1,	[%l7 + 0x6C]
	nop
	set	0x20, %g6
	ldsw	[%l7 + %g6],	%g7
	ldsw	[%l7 + 0x54],	%i7
	alignaddrl	%l0,	%o3,	%l3
	edge8ln	%o5,	%i1,	%l6
	popc	%g4,	%l1
	movpos	%icc,	%g3,	%l2
	edge32n	%o6,	%g6,	%g5
	fmul8sux16	%f8,	%f16,	%f26
	ldsw	[%l7 + 0x4C],	%o4
	lduw	[%l7 + 0x30],	%i0
	edge32n	%i6,	%i2,	%o2
	andn	%l5,	%i5,	%g1
	fmovrse	%g2,	%f10,	%f14
	srl	%l4,	0x12,	%o0
	or	%i4,	%i3,	%o7
	stb	%o1,	[%l7 + 0x3B]
	alignaddrl	%g7,	%i7,	%l0
	alignaddrl	%l3,	%o5,	%o3
	sllx	%l6,	%g4,	%i1
	edge16l	%g3,	%l2,	%o6
	fnegd	%f6,	%f28
	fmovrdlez	%g6,	%f16,	%f28
	sllx	%g5,	0x04,	%o4
	movvc	%icc,	%l1,	%i0
	ldd	[%l7 + 0x28],	%i6
	add	%o2,	%i2,	%l5
	ldsw	[%l7 + 0x20],	%i5
	fmovrslz	%g1,	%f22,	%f20
	addc	%g2,	0x0B52,	%o0
	sdiv	%l4,	0x1B38,	%i3
	sllx	%i4,	%o7,	%o1
	fmovsg	%icc,	%f21,	%f12
	stx	%i7,	[%l7 + 0x78]
	movrlez	%l0,	%l3,	%g7
	fmovsn	%icc,	%f28,	%f2
	fmul8ulx16	%f20,	%f6,	%f12
	mova	%xcc,	%o3,	%o5
	sdiv	%g4,	0x17F8,	%l6
	movpos	%xcc,	%i1,	%g3
	edge16n	%o6,	%l2,	%g5
	array16	%g6,	%o4,	%i0
	smulcc	%i6,	%l1,	%o2
	fzero	%f14
	alignaddr	%i2,	%i5,	%g1
	fmovdpos	%xcc,	%f18,	%f4
	stx	%g2,	[%l7 + 0x38]
	subc	%l5,	%l4,	%i3
	subccc	%o0,	0x1509,	%o7
	movrne	%i4,	0x062,	%i7
	nop
	set	0x10, %o3
	ldd	[%l7 + %o3],	%o0
	xnor	%l3,	0x0F11,	%g7
	ldsh	[%l7 + 0x76],	%o3
	faligndata	%f30,	%f8,	%f14
	subcc	%l0,	%g4,	%l6
	popc	%i1,	%g3
	ldx	[%l7 + 0x48],	%o6
	ldd	[%l7 + 0x08],	%f16
	andncc	%l2,	%o5,	%g5
	popc	0x143E,	%g6
	movge	%xcc,	%o4,	%i6
	addcc	%l1,	0x0741,	%i0
	smulcc	%o2,	%i5,	%g1
	for	%f2,	%f0,	%f26
	movne	%xcc,	%g2,	%i2
	fsrc2s	%f18,	%f23
	umul	%l4,	%l5,	%i3
	restore %o0, %o7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fzeros	%f2
	edge32n	%o1,	%i4,	%g7
	move	%xcc,	%l3,	%l0
	movpos	%icc,	%o3,	%g4
	fmovrsgez	%l6,	%f20,	%f14
	orncc	%g3,	%o6,	%l2
	fmovrsgz	%i1,	%f19,	%f17
	srax	%g5,	%o5,	%g6
	save %i6, 0x0412, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l1,	%o2
	movl	%xcc,	%i0,	%g1
	sllx	%i5,	%g2,	%i2
	add	%l5,	0x0565,	%i3
	pdist	%f22,	%f24,	%f16
	sra	%o0,	%l4,	%o7
	edge32ln	%o1,	%i7,	%g7
	or	%i4,	%l3,	%o3
	sll	%g4,	0x05,	%l6
	sra	%g3,	0x00,	%l0
	sll	%o6,	0x16,	%i1
	udivx	%g5,	0x0DE1,	%l2
	lduh	[%l7 + 0x2C],	%o5
	fcmpeq16	%f18,	%f30,	%i6
	fxor	%f12,	%f16,	%f20
	st	%f8,	[%l7 + 0x4C]
	edge8n	%g6,	%l1,	%o2
	lduw	[%l7 + 0x7C],	%i0
	fmuld8ulx16	%f30,	%f23,	%f24
	sub	%g1,	0x1565,	%o4
	sth	%i5,	[%l7 + 0x16]
	edge16ln	%g2,	%i2,	%i3
	fpsub32s	%f11,	%f10,	%f29
	ldx	[%l7 + 0x78],	%o0
	ldd	[%l7 + 0x20],	%l4
	movneg	%icc,	%o7,	%l5
	movre	%i7,	%o1,	%g7
	edge16n	%i4,	%o3,	%l3
	stb	%g4,	[%l7 + 0x4C]
	addc	%g3,	0x1911,	%l0
	st	%f12,	[%l7 + 0x48]
	movrne	%l6,	0x08F,	%o6
	edge16ln	%g5,	%l2,	%o5
	ldsw	[%l7 + 0x7C],	%i6
	sdivx	%g6,	0x161B,	%i1
	movrlez	%o2,	%i0,	%l1
	edge32l	%o4,	%g1,	%g2
	stx	%i2,	[%l7 + 0x38]
	orn	%i5,	0x09CD,	%o0
	mulscc	%i3,	%o7,	%l5
	srl	%l4,	%i7,	%o1
	movrne	%g7,	%i4,	%o3
	ldsb	[%l7 + 0x60],	%g4
	std	%f0,	[%l7 + 0x18]
	ldd	[%l7 + 0x08],	%g2
	movn	%icc,	%l3,	%l0
	stb	%o6,	[%l7 + 0x0C]
	add	%g5,	0x09EE,	%l2
	movge	%icc,	%o5,	%i6
	edge32	%l6,	%i1,	%o2
	fnor	%f28,	%f2,	%f20
	fmul8x16al	%f18,	%f9,	%f22
	mova	%icc,	%g6,	%l1
	srl	%i0,	%g1,	%g2
	std	%f14,	[%l7 + 0x28]
	fsrc1	%f0,	%f10
	popc	%i2,	%o4
	fmul8ulx16	%f16,	%f16,	%f16
	movle	%xcc,	%o0,	%i5
	nop
	set	0x1C, %i0
	stw	%o7,	[%l7 + %i0]
	fnegs	%f11,	%f27
	umulcc	%i3,	0x192C,	%l5
	umulcc	%i7,	%l4,	%o1
	movleu	%xcc,	%i4,	%g7
	sdiv	%o3,	0x19C8,	%g4
	movleu	%xcc,	%l3,	%g3
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	edge8n	%o5,	%l2,	%l6
	movl	%xcc,	%i6,	%i1
	fmovdleu	%icc,	%f17,	%f20
	edge8	%o2,	%l1,	%g6
	st	%f9,	[%l7 + 0x3C]
	edge8	%i0,	%g2,	%g1
	movrlez	%o4,	0x0E4,	%i2
	smul	%o0,	%o7,	%i5
	lduh	[%l7 + 0x62],	%i3
	stb	%i7,	[%l7 + 0x7D]
	srl	%l5,	0x1F,	%l4
	orncc	%o1,	0x1D5C,	%g7
	edge16l	%o3,	%i4,	%l3
	edge16	%g4,	%g3,	%l0
	fpsub32s	%f19,	%f11,	%f23
	andn	%g5,	%o6,	%o5
	sdivx	%l6,	0x17C3,	%l2
	fmovrde	%i1,	%f30,	%f28
	sir	0x0887
	nop
	set	0x20, %i4
	ldd	[%l7 + %i4],	%f14
	addccc	%i6,	%l1,	%o2
	edge16n	%i0,	%g2,	%g1
	edge8l	%o4,	%i2,	%g6
	sllx	%o0,	%o7,	%i5
	udiv	%i3,	0x0996,	%l5
	umulcc	%i7,	0x0412,	%l4
	andncc	%o1,	%o3,	%g7
	edge16	%i4,	%l3,	%g3
	fmovsn	%xcc,	%f24,	%f14
	udivx	%l0,	0x12C7,	%g4
	array8	%o6,	%o5,	%g5
	orncc	%l6,	%i1,	%i6
	edge8	%l2,	%l1,	%i0
	fornot2s	%f17,	%f11,	%f11
	edge16n	%g2,	%o2,	%g1
	smulcc	%i2,	%o4,	%o0
	smul	%o7,	%g6,	%i3
	movg	%icc,	%l5,	%i7
	fmovdpos	%icc,	%f12,	%f28
	andcc	%i5,	0x13AF,	%l4
	umulcc	%o1,	%g7,	%o3
	andcc	%i4,	%l3,	%l0
	fones	%f11
	fmovdvc	%icc,	%f10,	%f9
	movg	%xcc,	%g4,	%o6
	movg	%xcc,	%g3,	%o5
	movle	%icc,	%l6,	%i1
	fandnot2	%f2,	%f28,	%f12
	lduh	[%l7 + 0x3C],	%i6
	fpadd32s	%f14,	%f30,	%f9
	array16	%g5,	%l1,	%i0
	alignaddrl	%l2,	%o2,	%g2
	movvc	%icc,	%i2,	%g1
	move	%xcc,	%o4,	%o7
	movcs	%icc,	%g6,	%o0
	xorcc	%i3,	0x0F76,	%i7
	lduh	[%l7 + 0x62],	%i5
	smulcc	%l4,	%o1,	%g7
	xor	%l5,	%i4,	%o3
	movrlez	%l0,	0x164,	%l3
	fpack32	%f12,	%f0,	%f30
	edge32l	%o6,	%g4,	%g3
	movg	%xcc,	%l6,	%i1
	faligndata	%f22,	%f12,	%f6
	ldsh	[%l7 + 0x0C],	%i6
	ldd	[%l7 + 0x40],	%f12
	fsrc2s	%f2,	%f18
	edge32n	%o5,	%l1,	%i0
	movne	%xcc,	%g5,	%o2
	edge16n	%l2,	%g2,	%i2
	fmovdcc	%icc,	%f1,	%f20
	sir	0x0713
	udiv	%g1,	0x1239,	%o7
	smulcc	%o4,	%o0,	%g6
	fmovsg	%xcc,	%f30,	%f30
	fcmps	%fcc3,	%f6,	%f27
	xor	%i7,	0x0C8D,	%i3
	srl	%i5,	%l4,	%o1
	orcc	%l5,	%i4,	%g7
	ldsb	[%l7 + 0x1C],	%l0
	movre	%o3,	%o6,	%g4
	udivx	%g3,	0x18B2,	%l6
	mulscc	%l3,	0x1CC3,	%i6
	sub	%i1,	0x00AB,	%o5
	edge16	%l1,	%i0,	%g5
	xnorcc	%l2,	%o2,	%g2
	lduw	[%l7 + 0x38],	%g1
	movg	%xcc,	%i2,	%o7
	ldsw	[%l7 + 0x60],	%o0
	fmovrdgz	%o4,	%f10,	%f0
	sdivcc	%i7,	0x1EB2,	%i3
	stb	%i5,	[%l7 + 0x72]
	fzero	%f26
	and	%g6,	%l4,	%o1
	sub	%i4,	0x186E,	%l5
	movcc	%icc,	%l0,	%g7
	addc	%o6,	%o3,	%g3
	save %g4, 0x1FAE, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%icc,	%f14,	%f5
	fmul8x16al	%f28,	%f16,	%f22
	srl	%l6,	%i6,	%i1
	andncc	%o5,	%l1,	%i0
	xnorcc	%g5,	0x1FBE,	%l2
	addcc	%o2,	0x0811,	%g1
	umul	%i2,	0x0AA7,	%g2
	fmovdvs	%icc,	%f12,	%f30
	edge16	%o0,	%o4,	%o7
	ldub	[%l7 + 0x49],	%i3
	fmovse	%icc,	%f12,	%f16
	smulcc	%i5,	%g6,	%i7
	xor	%l4,	0x0894,	%o1
	move	%icc,	%i4,	%l0
	movge	%icc,	%l5,	%o6
	movleu	%icc,	%o3,	%g3
	andncc	%g4,	%g7,	%l3
	movcs	%icc,	%i6,	%i1
	restore %l6, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i0,	%l2,	%g5
	fpadd32s	%f7,	%f24,	%f14
	alignaddrl	%o2,	%g1,	%g2
	edge32	%i2,	%o4,	%o0
	mulscc	%i3,	%o7,	%g6
	edge16l	%i5,	%l4,	%i7
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	movrgz	%o1,	%l5,	%o3
	and	%g3,	%o6,	%g7
	fornot2s	%f4,	%f17,	%f14
	movcs	%xcc,	%l3,	%i6
	andcc	%g4,	0x0AA8,	%i1
	addcc	%o5,	0x0D33,	%l1
	fpadd16s	%f6,	%f12,	%f12
	std	%f8,	[%l7 + 0x68]
	edge32n	%i0,	%l6,	%g5
	fmovse	%icc,	%f4,	%f21
	xnor	%l2,	%o2,	%g2
	popc	%g1,	%o4
	fands	%f29,	%f21,	%f9
	orcc	%o0,	%i2,	%i3
	stb	%g6,	[%l7 + 0x35]
	udivx	%i5,	0x1581,	%l4
	edge16ln	%i7,	%i4,	%o7
	fmovdne	%icc,	%f10,	%f29
	bshuffle	%f10,	%f0,	%f28
	stx	%o1,	[%l7 + 0x70]
	andncc	%l5,	%o3,	%l0
	ldsh	[%l7 + 0x70],	%g3
	movrgz	%o6,	0x059,	%g7
	edge16n	%l3,	%g4,	%i1
	xnorcc	%o5,	%l1,	%i0
	fcmple16	%f12,	%f26,	%l6
	stb	%i6,	[%l7 + 0x23]
	faligndata	%f12,	%f30,	%f8
	popc	0x0DF5,	%l2
	andncc	%g5,	%g2,	%o2
	or	%g1,	%o4,	%o0
	umulcc	%i2,	0x019E,	%i3
	array16	%i5,	%g6,	%i7
	ld	[%l7 + 0x24],	%f10
	fmovsne	%icc,	%f11,	%f10
	ld	[%l7 + 0x44],	%f21
	fpsub16s	%f28,	%f6,	%f1
	srl	%i4,	%o7,	%o1
	orn	%l5,	%l4,	%l0
	smulcc	%g3,	%o3,	%o6
	movvs	%xcc,	%l3,	%g4
	fpsub32	%f2,	%f20,	%f10
	movge	%icc,	%i1,	%g7
	edge32ln	%o5,	%l1,	%i0
	fpsub32s	%f7,	%f13,	%f10
	fnot1s	%f21,	%f9
	fands	%f20,	%f19,	%f28
	fmovrdgez	%l6,	%f20,	%f6
	movcs	%icc,	%l2,	%g5
	udivcc	%i6,	0x157A,	%o2
	edge8n	%g1,	%g2,	%o0
	stb	%i2,	[%l7 + 0x55]
	lduw	[%l7 + 0x18],	%i3
	movleu	%icc,	%o4,	%g6
	edge16n	%i5,	%i7,	%i4
	lduw	[%l7 + 0x28],	%o7
	udiv	%l5,	0x043E,	%o1
	mulscc	%l4,	0x1530,	%g3
	lduw	[%l7 + 0x18],	%o3
	xorcc	%o6,	%l3,	%l0
	alignaddrl	%i1,	%g4,	%g7
	nop
	set	0x1E, %o1
	ldub	[%l7 + %o1],	%o5
	movn	%xcc,	%l1,	%l6
	ldx	[%l7 + 0x50],	%l2
	fmovsle	%icc,	%f3,	%f5
	addccc	%g5,	0x02E8,	%i0
	udivcc	%i6,	0x1F57,	%o2
	sth	%g2,	[%l7 + 0x46]
	sll	%o0,	%i2,	%g1
	subc	%i3,	%g6,	%i5
	srlx	%o4,	0x0F,	%i7
	addc	%i4,	0x0260,	%o7
	fnot1s	%f14,	%f0
	fcmpd	%fcc3,	%f14,	%f18
	mova	%icc,	%l5,	%l4
	movge	%xcc,	%o1,	%o3
	edge8ln	%g3,	%o6,	%l3
	ldsh	[%l7 + 0x76],	%i1
	xnorcc	%l0,	%g4,	%g7
	orncc	%o5,	%l1,	%l6
	sth	%l2,	[%l7 + 0x2C]
	stb	%g5,	[%l7 + 0x26]
	fnors	%f19,	%f8,	%f25
	st	%f31,	[%l7 + 0x28]
	movle	%icc,	%i0,	%i6
	movpos	%icc,	%o2,	%g2
	lduw	[%l7 + 0x4C],	%o0
	andcc	%g1,	%i2,	%g6
	ldd	[%l7 + 0x40],	%i2
	fnands	%f19,	%f28,	%f24
	sll	%i5,	%i7,	%i4
	udivx	%o4,	0x1BA1,	%l5
	ldd	[%l7 + 0x58],	%o6
	movcs	%xcc,	%l4,	%o3
	fcmpeq32	%f16,	%f20,	%g3
	fpackfix	%f10,	%f14
	srlx	%o6,	0x03,	%l3
	movg	%xcc,	%o1,	%l0
	mulscc	%i1,	0x1E68,	%g4
	array32	%o5,	%l1,	%l6
	ldsb	[%l7 + 0x22],	%l2
	fpmerge	%f6,	%f16,	%f4
	umul	%g5,	0x089A,	%g7
	array32	%i0,	%o2,	%g2
	fnors	%f4,	%f21,	%f23
	movgu	%icc,	%o0,	%g1
	umulcc	%i2,	%g6,	%i6
	st	%f7,	[%l7 + 0x08]
	stb	%i5,	[%l7 + 0x4D]
	movcc	%icc,	%i3,	%i4
	fpackfix	%f6,	%f20
	fsrc1	%f8,	%f0
	xorcc	%i7,	%o4,	%o7
	andncc	%l5,	%o3,	%g3
	edge32l	%o6,	%l4,	%o1
	alignaddrl	%l0,	%i1,	%g4
	movcs	%icc,	%o5,	%l3
	fmovsa	%icc,	%f30,	%f25
	movvs	%icc,	%l6,	%l1
	movg	%icc,	%l2,	%g5
	edge32ln	%g7,	%i0,	%g2
	mulscc	%o2,	%o0,	%g1
	movrgz	%g6,	0x33E,	%i2
	fxnor	%f10,	%f12,	%f24
	fnand	%f6,	%f30,	%f2
	sth	%i5,	[%l7 + 0x28]
	ldsw	[%l7 + 0x20],	%i3
	orn	%i6,	%i7,	%o4
	edge16l	%o7,	%l5,	%i4
	fmovrsgez	%g3,	%f15,	%f28
	edge16n	%o6,	%l4,	%o1
	fmovsne	%icc,	%f19,	%f17
	fands	%f27,	%f31,	%f1
	sra	%o3,	%i1,	%l0
	fpadd32	%f6,	%f0,	%f26
	movpos	%xcc,	%g4,	%o5
	movrlez	%l6,	0x1A6,	%l3
	srlx	%l1,	%g5,	%l2
	ldd	[%l7 + 0x10],	%f18
	fmovrdlz	%g7,	%f26,	%f12
	fornot2	%f6,	%f26,	%f18
	udivcc	%i0,	0x13F4,	%o2
	udivcc	%g2,	0x178B,	%g1
	subccc	%g6,	%i2,	%o0
	srax	%i3,	0x16,	%i5
	movne	%xcc,	%i6,	%o4
	save %i7, 0x17E4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f22,	%f18
	movre	%l5,	%g3,	%i4
	fand	%f4,	%f10,	%f4
	fmovrdne	%l4,	%f28,	%f26
	subccc	%o1,	0x1A71,	%o6
	ldub	[%l7 + 0x7F],	%i1
	edge8ln	%o3,	%g4,	%l0
	srax	%l6,	%l3,	%l1
	and	%o5,	0x087B,	%g5
	srlx	%g7,	%i0,	%l2
	andcc	%g2,	0x0515,	%o2
	sdiv	%g1,	0x17E2,	%g6
	fmul8x16al	%f19,	%f5,	%f10
	ldx	[%l7 + 0x70],	%i2
	sub	%o0,	0x1C37,	%i3
	or	%i5,	0x0591,	%i6
	sub	%o4,	0x05D5,	%i7
	movn	%icc,	%o7,	%l5
	sub	%g3,	0x1E7E,	%i4
	srax	%o1,	0x14,	%o6
	fpadd32	%f28,	%f30,	%f14
	xnor	%l4,	%o3,	%i1
	add	%l0,	0x0E81,	%l6
	addcc	%l3,	%g4,	%o5
	fmovsvc	%xcc,	%f8,	%f12
	movn	%icc,	%l1,	%g7
	fandnot1s	%f8,	%f3,	%f22
	add	%g5,	0x1DAE,	%i0
	ldsb	[%l7 + 0x30],	%g2
	array32	%l2,	%o2,	%g1
	movrgez	%g6,	0x24E,	%i2
	udivcc	%i3,	0x1FE3,	%o0
	or	%i6,	0x018E,	%i5
	addcc	%o4,	0x0BA0,	%o7
	mova	%icc,	%i7,	%l5
	mulscc	%i4,	%g3,	%o6
	fsrc1	%f28,	%f6
	xnorcc	%l4,	0x0563,	%o3
	ldd	[%l7 + 0x50],	%i0
	srax	%l0,	%l6,	%l3
	ldsw	[%l7 + 0x48],	%o1
	xnorcc	%g4,	%o5,	%l1
	fandnot1s	%f19,	%f30,	%f11
	subcc	%g5,	0x0F99,	%g7
	edge8l	%i0,	%l2,	%g2
	movn	%icc,	%g1,	%g6
	stw	%i2,	[%l7 + 0x58]
	ldd	[%l7 + 0x68],	%f30
	add	%o2,	0x0528,	%i3
	ldd	[%l7 + 0x38],	%f20
	andcc	%i6,	0x143A,	%o0
	nop
	set	0x40, %g5
	ldd	[%l7 + %g5],	%f28
	orn	%o4,	0x17A3,	%i5
	movle	%icc,	%o7,	%l5
	subccc	%i4,	%g3,	%i7
	stw	%l4,	[%l7 + 0x20]
	subc	%o3,	0x1523,	%o6
	fcmple16	%f26,	%f4,	%l0
	sir	0x0A2D
	xor	%l6,	0x140B,	%l3
	fcmpgt16	%f12,	%f12,	%i1
	addc	%o1,	%g4,	%o5
	addc	%l1,	%g5,	%g7
	xorcc	%l2,	0x03C8,	%i0
	sdivcc	%g2,	0x1B94,	%g6
	addc	%i2,	%g1,	%i3
	edge8l	%o2,	%o0,	%i6
	movcs	%xcc,	%o4,	%i5
	fcmpgt16	%f6,	%f16,	%l5
	andncc	%i4,	%o7,	%i7
	movpos	%xcc,	%g3,	%l4
	edge16n	%o6,	%o3,	%l0
	sub	%l3,	0x17A1,	%i1
	lduh	[%l7 + 0x3A],	%l6
	array8	%g4,	%o5,	%l1
	subc	%o1,	0x0818,	%g5
	add	%l2,	%i0,	%g7
	fmul8sux16	%f16,	%f12,	%f18
	movleu	%icc,	%g2,	%i2
	std	%f10,	[%l7 + 0x38]
	orn	%g1,	0x1C0B,	%i3
	edge8l	%g6,	%o2,	%i6
	orncc	%o0,	0x0578,	%o4
	fnands	%f12,	%f21,	%f1
	lduw	[%l7 + 0x7C],	%l5
	alignaddr	%i4,	%o7,	%i7
	umul	%g3,	0x15D6,	%l4
	or	%i5,	%o6,	%o3
	movl	%xcc,	%l3,	%i1
	sir	0x01BA
	fornot2	%f8,	%f28,	%f12
	ldsw	[%l7 + 0x58],	%l6
	addc	%l0,	0x1FF3,	%o5
	sth	%l1,	[%l7 + 0x3E]
	alignaddrl	%g4,	%g5,	%o1
	alignaddrl	%i0,	%g7,	%g2
	edge8	%i2,	%l2,	%g1
	sdivcc	%g6,	0x1906,	%i3
	fpadd32	%f6,	%f20,	%f10
	ldsh	[%l7 + 0x32],	%o2
	ldsh	[%l7 + 0x64],	%i6
	edge32	%o4,	%o0,	%i4
	ld	[%l7 + 0x2C],	%f11
	array16	%l5,	%o7,	%i7
	srl	%g3,	%l4,	%o6
	mulscc	%o3,	0x1EFF,	%i5
	edge32	%i1,	%l3,	%l6
	orn	%l0,	%l1,	%g4
	ldsh	[%l7 + 0x2A],	%o5
	ldsw	[%l7 + 0x34],	%o1
	edge8ln	%g5,	%g7,	%i0
	sdiv	%g2,	0x17BF,	%l2
	movneg	%xcc,	%i2,	%g6
	ldx	[%l7 + 0x60],	%g1
	edge32l	%i3,	%o2,	%o4
	xnor	%o0,	%i4,	%l5
	edge8n	%i6,	%o7,	%i7
	ldx	[%l7 + 0x60],	%g3
	ldd	[%l7 + 0x50],	%f8
	st	%f24,	[%l7 + 0x5C]
	fnot2s	%f6,	%f29
	fmul8ulx16	%f10,	%f28,	%f16
	nop
	set	0x18, %g1
	std	%f2,	[%l7 + %g1]
	ldsw	[%l7 + 0x38],	%l4
	subccc	%o6,	0x1DD1,	%i5
	fmovdleu	%xcc,	%f14,	%f20
	fmovdgu	%icc,	%f1,	%f25
	edge8l	%o3,	%i1,	%l3
	sdiv	%l0,	0x16F4,	%l6
	andncc	%g4,	%o5,	%o1
	sdivx	%l1,	0x0CC3,	%g7
	array8	%g5,	%g2,	%i0
	fmovdcs	%xcc,	%f28,	%f4
	fmovdneg	%xcc,	%f4,	%f26
	edge16l	%l2,	%g6,	%g1
	srax	%i3,	0x17,	%i2
	fzero	%f30
	addccc	%o4,	0x1FB9,	%o0
	edge16	%i4,	%l5,	%o2
	movn	%icc,	%o7,	%i7
	sth	%g3,	[%l7 + 0x20]
	sra	%l4,	0x12,	%o6
	umulcc	%i5,	%i6,	%i1
	stx	%l3,	[%l7 + 0x48]
	array16	%l0,	%o3,	%g4
	fmovs	%f21,	%f29
	orncc	%l6,	%o5,	%o1
	ldsh	[%l7 + 0x72],	%l1
	andncc	%g5,	%g2,	%i0
	xor	%g7,	0x1816,	%g6
	edge16	%g1,	%i3,	%i2
	movgu	%xcc,	%l2,	%o0
	mulx	%o4,	0x14C2,	%l5
	sethi	0x1A19,	%o2
	smulcc	%i4,	0x1067,	%o7
	fmovsa	%xcc,	%f25,	%f29
	edge16l	%i7,	%g3,	%o6
	movcs	%icc,	%i5,	%l4
	array8	%i1,	%l3,	%i6
	subcc	%l0,	%g4,	%l6
	fcmpes	%fcc3,	%f18,	%f20
	edge16	%o5,	%o3,	%l1
	stb	%o1,	[%l7 + 0x3B]
	xor	%g2,	%i0,	%g7
	sdivx	%g5,	0x0F0A,	%g6
	edge16n	%g1,	%i2,	%l2
	movleu	%xcc,	%i3,	%o4
	udiv	%l5,	0x182A,	%o2
	subcc	%o0,	%i4,	%o7
	edge32ln	%i7,	%o6,	%g3
	fcmple32	%f28,	%f24,	%i5
	fmovrse	%i1,	%f5,	%f5
	addccc	%l4,	0x0B52,	%i6
	umul	%l0,	0x0ACA,	%l3
	movpos	%icc,	%g4,	%o5
	fcmpgt32	%f18,	%f28,	%o3
	movpos	%icc,	%l6,	%o1
	movre	%l1,	%g2,	%i0
	array32	%g7,	%g5,	%g6
	edge32ln	%g1,	%i2,	%l2
	edge16n	%i3,	%o4,	%o2
	mulx	%l5,	0x18B9,	%o0
	ldsw	[%l7 + 0x74],	%i4
	fmovsl	%xcc,	%f2,	%f23
	fmovrsne	%i7,	%f6,	%f9
	addcc	%o6,	0x1FF7,	%o7
	fmovspos	%icc,	%f2,	%f3
	fcmple16	%f6,	%f2,	%i5
	udivcc	%i1,	0x137D,	%l4
	edge16ln	%i6,	%g3,	%l3
	fmovsge	%icc,	%f16,	%f8
	movle	%xcc,	%l0,	%o5
	movrne	%g4,	%l6,	%o1
	movpos	%icc,	%l1,	%o3
	movvs	%icc,	%g2,	%i0
	movrne	%g7,	%g6,	%g1
	movrne	%i2,	%g5,	%l2
	move	%xcc,	%i3,	%o4
	popc	%l5,	%o2
	xor	%i4,	0x127B,	%o0
	fexpand	%f5,	%f24
	orcc	%i7,	%o6,	%o7
	nop
	set	0x70, %g3
	lduw	[%l7 + %g3],	%i1
	fxors	%f26,	%f10,	%f14
	udivx	%i5,	0x0B71,	%i6
	stx	%g3,	[%l7 + 0x78]
	srl	%l3,	%l4,	%l0
	fpack32	%f8,	%f20,	%f16
	sdiv	%o5,	0x19E0,	%l6
	alignaddrl	%o1,	%l1,	%o3
	sll	%g4,	0x07,	%g2
	subccc	%g7,	%g6,	%g1
	fmovrdgz	%i2,	%f24,	%f22
	umul	%i0,	%l2,	%i3
	restore %o4, %g5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o2,	%o0,	%i7
	movgu	%xcc,	%o6,	%o7
	andn	%i1,	%i5,	%i6
	stb	%g3,	[%l7 + 0x60]
	fpsub16	%f22,	%f8,	%f4
	xnor	%i4,	%l4,	%l3
	subccc	%o5,	0x13F2,	%l6
	fmovrsne	%l0,	%f12,	%f4
	mulscc	%l1,	0x1519,	%o3
	fmovrsgez	%o1,	%f29,	%f13
	popc	0x1C6C,	%g4
	edge8ln	%g2,	%g7,	%g6
	fandnot1s	%f7,	%f8,	%f19
	sub	%i2,	0x16E8,	%i0
	st	%f26,	[%l7 + 0x6C]
	nop
	set	0x70, %l6
	ldd	[%l7 + %l6],	%f26
	ldx	[%l7 + 0x58],	%g1
	sllx	%l2,	0x19,	%o4
	lduh	[%l7 + 0x50],	%i3
	srlx	%g5,	%l5,	%o2
	fnegs	%f31,	%f31
	sra	%o0,	%i7,	%o6
	fandnot2	%f24,	%f14,	%f4
	fmovrslez	%i1,	%f12,	%f26
	smul	%i5,	0x11EB,	%o7
	stb	%i6,	[%l7 + 0x7C]
	orncc	%g3,	%l4,	%l3
	save %i4, %o5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f4,	%f11,	%f10
	andcc	%l6,	%l1,	%o3
	array8	%g4,	%o1,	%g2
	fcmped	%fcc0,	%f24,	%f26
	alignaddrl	%g7,	%i2,	%i0
	array16	%g1,	%l2,	%o4
	srl	%i3,	%g6,	%l5
	stb	%o2,	[%l7 + 0x23]
	xor	%g5,	0x18B9,	%i7
	orncc	%o6,	%i1,	%o0
	movvs	%xcc,	%o7,	%i6
	nop
	set	0x0C, %l3
	ldsw	[%l7 + %l3],	%g3
	edge16n	%l4,	%i5,	%i4
	subc	%l3,	0x1B99,	%o5
	edge8ln	%l6,	%l1,	%l0
	stx	%o3,	[%l7 + 0x38]
	ldsh	[%l7 + 0x36],	%g4
	sethi	0x1EE4,	%o1
	movge	%icc,	%g2,	%i2
	fmovse	%xcc,	%f15,	%f16
	movcs	%icc,	%g7,	%g1
	subc	%l2,	0x073B,	%o4
	stb	%i0,	[%l7 + 0x20]
	fmovdgu	%xcc,	%f8,	%f22
	ldub	[%l7 + 0x32],	%g6
	edge8l	%l5,	%i3,	%g5
	srl	%o2,	%i7,	%i1
	fandnot2	%f16,	%f26,	%f10
	ldx	[%l7 + 0x20],	%o0
	fone	%f14
	fors	%f23,	%f3,	%f24
	movl	%icc,	%o7,	%o6
	xnor	%g3,	%i6,	%l4
	sethi	0x0280,	%i4
	pdist	%f10,	%f2,	%f12
	fzeros	%f27
	movcs	%icc,	%i5,	%l3
	ldub	[%l7 + 0x18],	%l6
	xorcc	%o5,	%l0,	%l1
	lduw	[%l7 + 0x28],	%o3
	fmovsge	%xcc,	%f20,	%f20
	xnor	%g4,	%g2,	%o1
	st	%f8,	[%l7 + 0x10]
	edge16l	%g7,	%g1,	%i2
	ldsh	[%l7 + 0x32],	%o4
	ldx	[%l7 + 0x78],	%l2
	fcmpes	%fcc3,	%f5,	%f16
	movrne	%i0,	%g6,	%i3
	sllx	%g5,	%l5,	%o2
	stw	%i7,	[%l7 + 0x60]
	ldx	[%l7 + 0x68],	%o0
	fmovdgu	%xcc,	%f23,	%f25
	fmul8x16au	%f3,	%f27,	%f4
	fpsub32s	%f6,	%f20,	%f29
	movrlez	%o7,	0x14D,	%i1
	fmovrsgez	%g3,	%f24,	%f17
	st	%f5,	[%l7 + 0x60]
	udivx	%i6,	0x0569,	%o6
	movg	%icc,	%l4,	%i4
	fmovrsgez	%i5,	%f9,	%f20
	ldd	[%l7 + 0x08],	%f14
	mulx	%l3,	%o5,	%l6
	edge8ln	%l1,	%o3,	%g4
	movg	%icc,	%g2,	%o1
	edge32n	%g7,	%l0,	%g1
	movrlez	%i2,	0x287,	%o4
	fxors	%f14,	%f25,	%f30
	std	%f20,	[%l7 + 0x40]
	sll	%l2,	%i0,	%i3
	movn	%xcc,	%g6,	%l5
	array8	%o2,	%g5,	%o0
	fmovsa	%icc,	%f28,	%f17
	movrgz	%o7,	%i1,	%g3
	movvc	%icc,	%i6,	%o6
	fmovsg	%xcc,	%f30,	%f17
	movrne	%l4,	0x1EE,	%i7
	mulscc	%i4,	%l3,	%i5
	edge16	%o5,	%l6,	%l1
	addc	%o3,	0x1052,	%g4
	sllx	%o1,	0x1A,	%g7
	edge16ln	%g2,	%l0,	%i2
	mulscc	%o4,	%l2,	%i0
	ldd	[%l7 + 0x60],	%f14
	faligndata	%f16,	%f12,	%f26
	subcc	%g1,	0x1020,	%i3
	fones	%f3
	addcc	%g6,	0x08ED,	%o2
	fmovdn	%icc,	%f17,	%f12
	fpack16	%f8,	%f1
	movcc	%icc,	%g5,	%o0
	fmuld8sux16	%f12,	%f16,	%f30
	lduh	[%l7 + 0x40],	%o7
	fmovsn	%icc,	%f18,	%f4
	edge32	%i1,	%g3,	%i6
	edge8	%l5,	%l4,	%i7
	ldx	[%l7 + 0x18],	%i4
	lduw	[%l7 + 0x44],	%l3
	movrgez	%o6,	0x04E,	%o5
	popc	0x1B5A,	%i5
	umul	%l6,	%l1,	%g4
	movrgez	%o3,	%g7,	%o1
	smul	%g2,	%l0,	%o4
	udiv	%i2,	0x044C,	%l2
	move	%icc,	%i0,	%i3
	fandnot2s	%f28,	%f20,	%f11
	udiv	%g6,	0x1345,	%g1
	udivx	%g5,	0x046A,	%o2
	sethi	0x1D19,	%o7
	fmovrslz	%o0,	%f24,	%f4
	movrgez	%g3,	%i6,	%i1
	udivx	%l4,	0x09CA,	%l5
	sra	%i4,	%l3,	%i7
	udivx	%o5,	0x1DB6,	%i5
	edge16ln	%l6,	%o6,	%l1
	srl	%o3,	0x04,	%g4
	alignaddr	%o1,	%g7,	%l0
	sll	%g2,	%i2,	%l2
	alignaddrl	%o4,	%i3,	%i0
	addcc	%g1,	0x0950,	%g6
	fcmpd	%fcc0,	%f20,	%f24
	ldsh	[%l7 + 0x3C],	%o2
	fmovrdgez	%o7,	%f16,	%f30
	fnegd	%f26,	%f4
	subcc	%o0,	%g5,	%g3
	fxnors	%f26,	%f25,	%f9
	movge	%xcc,	%i1,	%i6
	fmovsleu	%icc,	%f7,	%f15
	fandnot2	%f8,	%f16,	%f28
	nop
	set	0x59, %g2
	stb	%l4,	[%l7 + %g2]
	addc	%i4,	0x012E,	%l3
	stb	%l5,	[%l7 + 0x19]
	fnor	%f6,	%f22,	%f6
	fmul8x16	%f27,	%f22,	%f28
	fornot2	%f30,	%f26,	%f2
	orn	%i7,	%i5,	%l6
	and	%o6,	%o5,	%o3
	mova	%xcc,	%g4,	%o1
	fmovsle	%icc,	%f16,	%f6
	edge16l	%l1,	%l0,	%g7
	srl	%g2,	%l2,	%i2
	fmovrdlez	%o4,	%f0,	%f12
	fxnor	%f22,	%f18,	%f0
	movrgz	%i3,	0x337,	%i0
	fmovdle	%icc,	%f19,	%f1
	fcmpne32	%f20,	%f28,	%g6
	xnor	%o2,	%g1,	%o0
	stx	%o7,	[%l7 + 0x60]
	fnor	%f6,	%f22,	%f22
	movrlez	%g5,	%g3,	%i6
	andcc	%l4,	0x1C97,	%i1
	fcmple16	%f10,	%f24,	%l3
	edge16	%i4,	%l5,	%i7
	movne	%xcc,	%i5,	%o6
	fxnor	%f28,	%f12,	%f0
	movl	%icc,	%l6,	%o5
	movrlez	%g4,	%o3,	%o1
	andncc	%l0,	%l1,	%g7
	sllx	%g2,	0x1F,	%l2
	movpos	%icc,	%i2,	%o4
	edge16	%i0,	%i3,	%g6
	andncc	%g1,	%o0,	%o2
	movrgz	%o7,	0x0F0,	%g3
	fabsd	%f0,	%f6
	fxnors	%f16,	%f6,	%f19
	sethi	0x054F,	%g5
	fpadd32s	%f30,	%f14,	%f15
	lduw	[%l7 + 0x18],	%i6
	stb	%l4,	[%l7 + 0x5C]
	sll	%l3,	%i4,	%i1
	fornot1s	%f11,	%f12,	%f10
	fpadd16	%f18,	%f8,	%f26
	umul	%i7,	%l5,	%o6
	array32	%l6,	%i5,	%g4
	movneg	%xcc,	%o3,	%o1
	movl	%xcc,	%l0,	%o5
	umulcc	%g7,	%l1,	%g2
	movrlz	%i2,	0x12B,	%o4
	movrlz	%l2,	%i0,	%g6
	xnorcc	%i3,	%g1,	%o0
	fmuld8ulx16	%f21,	%f20,	%f26
	move	%icc,	%o7,	%o2
	fmovrsne	%g5,	%f23,	%f22
	edge16l	%g3,	%l4,	%i6
	orn	%l3,	%i4,	%i7
	st	%f28,	[%l7 + 0x78]
	andcc	%i1,	0x1BA5,	%l5
	fmovdl	%icc,	%f16,	%f10
	ldsw	[%l7 + 0x08],	%o6
	umulcc	%l6,	0x0E37,	%g4
	fcmple16	%f20,	%f4,	%i5
	mova	%icc,	%o1,	%l0
	xnor	%o3,	%g7,	%l1
	and	%g2,	%i2,	%o5
	edge16	%o4,	%l2,	%g6
	edge8l	%i0,	%i3,	%o0
	ldsw	[%l7 + 0x6C],	%g1
	stw	%o2,	[%l7 + 0x74]
	movl	%xcc,	%o7,	%g3
	sllx	%l4,	0x0E,	%g5
	srlx	%l3,	0x00,	%i4
	srax	%i6,	0x0C,	%i7
	xnorcc	%i1,	0x1AFB,	%l5
	edge8n	%l6,	%g4,	%i5
	fsrc2s	%f19,	%f25
	fcmpes	%fcc1,	%f25,	%f14
	addccc	%o6,	%l0,	%o1
	ldsw	[%l7 + 0x20],	%g7
	edge8n	%l1,	%o3,	%i2
	xor	%o5,	%o4,	%l2
	umul	%g6,	%g2,	%i3
	umul	%i0,	0x1F04,	%g1
	addcc	%o2,	0x1B41,	%o0
	movleu	%icc,	%g3,	%o7
	sdivx	%l4,	0x0279,	%l3
	xnorcc	%i4,	%i6,	%i7
	andcc	%g5,	0x1AAB,	%i1
	fsrc2s	%f25,	%f6
	save %l6, %g4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o6,	%l5
	fmovrdgz	%o1,	%f28,	%f0
	sth	%l0,	[%l7 + 0x50]
	lduw	[%l7 + 0x64],	%g7
	addc	%l1,	0x0BEA,	%i2
	nop
	set	0x64, %o7
	ldsw	[%l7 + %o7],	%o5
	fmovdg	%xcc,	%f22,	%f1
	and	%o4,	%o3,	%g6
	srax	%l2,	%i3,	%i0
	ldsh	[%l7 + 0x26],	%g1
	ldsw	[%l7 + 0x38],	%g2
	edge8n	%o0,	%o2,	%o7
	movpos	%xcc,	%g3,	%l3
	sra	%l4,	%i4,	%i6
	edge32	%g5,	%i1,	%i7
	movvs	%icc,	%l6,	%i5
	movg	%xcc,	%o6,	%g4
	sethi	0x08C5,	%o1
	ldsh	[%l7 + 0x12],	%l5
	fmovscc	%icc,	%f0,	%f21
	addccc	%g7,	0x189D,	%l1
	sir	0x0F08
	fmovsvs	%icc,	%f3,	%f24
	movpos	%icc,	%i2,	%l0
	stb	%o5,	[%l7 + 0x3B]
	movl	%icc,	%o3,	%g6
	array32	%o4,	%i3,	%i0
	movcs	%icc,	%l2,	%g1
	mova	%xcc,	%g2,	%o2
	mova	%xcc,	%o7,	%o0
	ldd	[%l7 + 0x08],	%f2
	addc	%l3,	0x06C5,	%g3
	or	%i4,	0x1008,	%l4
	fornot1s	%f8,	%f31,	%f12
	movl	%xcc,	%i6,	%g5
	fpsub16s	%f30,	%f22,	%f23
	movn	%xcc,	%i1,	%l6
	subccc	%i5,	%i7,	%o6
	fmovscc	%icc,	%f1,	%f10
	fnand	%f24,	%f4,	%f18
	movvc	%icc,	%g4,	%o1
	fornot2	%f14,	%f10,	%f0
	ldsh	[%l7 + 0x24],	%g7
	edge32n	%l5,	%l1,	%l0
	ldd	[%l7 + 0x30],	%f8
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	subccc	%o4,	%i3,	%o3
	ldub	[%l7 + 0x2E],	%l2
	edge16l	%i0,	%g2,	%g1
	movvs	%icc,	%o7,	%o2
	movneg	%xcc,	%l3,	%o0
	addcc	%i4,	0x1D89,	%l4
	fcmpeq32	%f0,	%f6,	%g3
	fcmpne16	%f22,	%f22,	%g5
	fmul8ulx16	%f30,	%f26,	%f0
	stw	%i6,	[%l7 + 0x68]
	movrlez	%l6,	%i5,	%i7
	srlx	%o6,	0x0E,	%g4
	srlx	%i1,	0x00,	%g7
	movrgz	%l5,	0x059,	%l1
	nop
	set	0x5A, %l4
	stb	%l0,	[%l7 + %l4]
	fsrc2s	%f8,	%f30
	umulcc	%o1,	%o5,	%g6
	edge16l	%i2,	%o4,	%i3
	movne	%xcc,	%l2,	%i0
	or	%o3,	%g1,	%o7
	lduh	[%l7 + 0x50],	%o2
	ldd	[%l7 + 0x10],	%f12
	andcc	%g2,	%o0,	%i4
	lduh	[%l7 + 0x48],	%l4
	movleu	%xcc,	%l3,	%g5
	andcc	%g3,	0x1FDE,	%l6
	edge16	%i5,	%i6,	%o6
	smul	%i7,	%i1,	%g4
	sdivcc	%l5,	0x0BFA,	%g7
	restore %l0, 0x0877, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o5,	%g6,	%i2
	edge8	%o4,	%i3,	%l2
	nop
	set	0x50, %l0
	sth	%i0,	[%l7 + %l0]
	array16	%l1,	%g1,	%o7
	fmovsle	%icc,	%f19,	%f27
	movvs	%icc,	%o2,	%o3
	movcc	%xcc,	%o0,	%i4
	std	%f16,	[%l7 + 0x70]
	ld	[%l7 + 0x70],	%f20
	movvc	%xcc,	%g2,	%l4
	mulx	%l3,	0x054E,	%g3
	movvs	%icc,	%g5,	%l6
	sth	%i6,	[%l7 + 0x0C]
	orcc	%o6,	%i5,	%i7
	popc	%g4,	%i1
	alignaddrl	%g7,	%l5,	%o1
	save %o5, %l0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%o4,	0x085D,	%i3
	movrlz	%l2,	%i2,	%i0
	fsrc1s	%f13,	%f14
	sir	0x10A2
	movrgz	%g1,	%o7,	%l1
	fabsd	%f20,	%f24
	fcmpeq16	%f0,	%f22,	%o3
	edge32	%o0,	%o2,	%i4
	fnands	%f0,	%f1,	%f28
	movrne	%g2,	%l4,	%g3
	sra	%g5,	0x00,	%l3
	fmovdge	%icc,	%f1,	%f6
	movge	%icc,	%l6,	%i6
	fands	%f3,	%f14,	%f12
	andcc	%i5,	0x145D,	%i7
	fmovscc	%icc,	%f3,	%f10
	sub	%o6,	%i1,	%g7
	edge8	%l5,	%g4,	%o1
	stw	%l0,	[%l7 + 0x64]
	udivcc	%g6,	0x19E0,	%o5
	srlx	%o4,	0x10,	%l2
	pdist	%f30,	%f16,	%f14
	ld	[%l7 + 0x1C],	%f0
	movcs	%xcc,	%i3,	%i2
	movvc	%icc,	%i0,	%g1
	edge32n	%l1,	%o3,	%o7
	fones	%f27
	fmovde	%icc,	%f30,	%f12
	movne	%xcc,	%o2,	%o0
	udiv	%i4,	0x06D3,	%g2
	fnor	%f16,	%f24,	%f20
	fands	%f7,	%f8,	%f15
	movgu	%icc,	%g3,	%g5
	popc	%l3,	%l4
	edge8	%i6,	%i5,	%i7
	st	%f26,	[%l7 + 0x18]
	ldx	[%l7 + 0x38],	%l6
	smul	%o6,	0x035C,	%i1
	smulcc	%g7,	%l5,	%o1
	movrlez	%g4,	%l0,	%o5
	fandnot1s	%f1,	%f28,	%f10
	udivcc	%o4,	0x1265,	%l2
	std	%f14,	[%l7 + 0x70]
	ldsb	[%l7 + 0x65],	%g6
	movrlz	%i3,	0x3E5,	%i2
	orn	%g1,	0x0E89,	%i0
	or	%l1,	0x1C77,	%o3
	movle	%xcc,	%o7,	%o2
	edge16l	%o0,	%i4,	%g2
	st	%f13,	[%l7 + 0x5C]
	array8	%g5,	%g3,	%l3
	smulcc	%l4,	0x0FF0,	%i6
	addc	%i7,	0x1AE2,	%l6
	ldsh	[%l7 + 0x76],	%o6
	sllx	%i1,	%i5,	%l5
	xnorcc	%o1,	0x1AF5,	%g7
	addcc	%l0,	%o5,	%g4
	lduw	[%l7 + 0x58],	%o4
	mulscc	%g6,	0x1590,	%i3
	fcmpne16	%f20,	%f18,	%i2
	movleu	%xcc,	%g1,	%i0
	alignaddr	%l1,	%l2,	%o3
	umul	%o2,	%o0,	%i4
	sdivcc	%g2,	0x1D6B,	%o7
	ld	[%l7 + 0x58],	%f29
	fsrc1	%f28,	%f12
	movrgez	%g3,	%l3,	%l4
	srlx	%i6,	0x15,	%i7
	edge16n	%l6,	%g5,	%i1
	array8	%o6,	%i5,	%l5
	subc	%g7,	0x056F,	%o1
	array16	%l0,	%o5,	%g4
	srlx	%o4,	%g6,	%i2
	sub	%g1,	0x0AC7,	%i0
	sllx	%i3,	%l1,	%l2
	sth	%o2,	[%l7 + 0x50]
	fmul8x16al	%f19,	%f14,	%f14
	movn	%icc,	%o0,	%i4
	edge32n	%g2,	%o3,	%o7
	movgu	%xcc,	%g3,	%l3
	andn	%l4,	0x1935,	%i7
	movge	%xcc,	%i6,	%l6
	sdivcc	%i1,	0x19C1,	%o6
	fcmps	%fcc2,	%f25,	%f11
	popc	%i5,	%g5
	ldsh	[%l7 + 0x5E],	%l5
	movl	%icc,	%o1,	%l0
	fornot1	%f30,	%f18,	%f6
	edge32ln	%g7,	%g4,	%o5
	sllx	%o4,	0x01,	%i2
	fmovrdlz	%g1,	%f4,	%f2
	smul	%g6,	%i0,	%l1
	movl	%icc,	%i3,	%o2
	std	%f16,	[%l7 + 0x50]
	udivx	%l2,	0x0710,	%i4
	movrlez	%o0,	0x273,	%o3
	ldsb	[%l7 + 0x2D],	%o7
	fmovrsne	%g3,	%f0,	%f21
	array32	%l3,	%l4,	%g2
	ldsb	[%l7 + 0x21],	%i6
	xorcc	%i7,	%i1,	%l6
	addccc	%o6,	%g5,	%i5
	fandnot2	%f26,	%f14,	%f28
	orcc	%l5,	0x1555,	%o1
	edge16	%l0,	%g4,	%o5
	alignaddr	%g7,	%o4,	%i2
	add	%g6,	0x1986,	%i0
	ldsh	[%l7 + 0x62],	%l1
	sdiv	%g1,	0x16C9,	%o2
	mulx	%i3,	%i4,	%o0
	movvs	%icc,	%l2,	%o3
	stw	%g3,	[%l7 + 0x28]
	fcmpgt32	%f30,	%f18,	%o7
	sll	%l4,	0x09,	%g2
	subc	%l3,	0x1152,	%i7
	movl	%xcc,	%i1,	%l6
	movcc	%xcc,	%i6,	%o6
	std	%f26,	[%l7 + 0x70]
	fmovdl	%xcc,	%f10,	%f24
	fors	%f22,	%f13,	%f8
	edge16l	%g5,	%l5,	%i5
	ldsw	[%l7 + 0x50],	%o1
	edge16l	%l0,	%g4,	%o5
	addccc	%o4,	0x01A1,	%g7
	sdivx	%g6,	0x0DAD,	%i2
	movpos	%icc,	%i0,	%g1
	ldsb	[%l7 + 0x63],	%o2
	edge32	%l1,	%i4,	%i3
	ldd	[%l7 + 0x70],	%o0
	movl	%icc,	%l2,	%o3
	movle	%icc,	%g3,	%o7
	ldub	[%l7 + 0x7D],	%g2
	nop
	set	0x0A, %l1
	sth	%l4,	[%l7 + %l1]
	sdiv	%i7,	0x0321,	%l3
	movrlez	%l6,	0x0D0,	%i6
	st	%f13,	[%l7 + 0x34]
	fmuld8sux16	%f1,	%f12,	%f0
	alignaddrl	%i1,	%o6,	%l5
	fmovdle	%icc,	%f24,	%f31
	fcmpeq32	%f0,	%f6,	%g5
	fmovrse	%i5,	%f10,	%f8
	std	%f22,	[%l7 + 0x58]
	or	%l0,	%o1,	%g4
	subcc	%o5,	%g7,	%o4
	array8	%i2,	%g6,	%i0
	edge32l	%g1,	%o2,	%l1
	fands	%f26,	%f25,	%f13
	fpsub32s	%f21,	%f15,	%f6
	std	%f18,	[%l7 + 0x40]
	ldd	[%l7 + 0x60],	%i2
	addcc	%i4,	%l2,	%o3
	srl	%o0,	%o7,	%g2
	move	%icc,	%g3,	%l4
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	add	%l3,	%i6,	%i1
	stb	%o6,	[%l7 + 0x1A]
	lduw	[%l7 + 0x38],	%l5
	movcc	%xcc,	%i5,	%g5
	fandnot2s	%f9,	%f23,	%f0
	ldub	[%l7 + 0x2D],	%o1
	mova	%icc,	%g4,	%o5
	addcc	%g7,	0x110B,	%o4
	sll	%l0,	0x05,	%g6
	movrgez	%i0,	0x09E,	%i2
	stb	%o2,	[%l7 + 0x29]
	popc	0x1EE5,	%l1
	stb	%g1,	[%l7 + 0x46]
	xnor	%i3,	0x052C,	%l2
	orcc	%i4,	%o3,	%o7
	fsrc2s	%f13,	%f15
	sll	%g2,	0x1D,	%o0
	movgu	%xcc,	%g3,	%l4
	fandnot1	%f24,	%f22,	%f16
	fcmpne32	%f22,	%f22,	%l6
	movpos	%xcc,	%l3,	%i7
	fsrc1s	%f12,	%f13
	edge32	%i1,	%i6,	%o6
	mulscc	%l5,	%g5,	%i5
	edge16	%o1,	%o5,	%g7
	xnorcc	%o4,	%g4,	%g6
	fpack16	%f8,	%f23
	alignaddrl	%i0,	%i2,	%o2
	edge16n	%l0,	%g1,	%l1
	fzero	%f10
	movle	%xcc,	%i3,	%i4
	movgu	%icc,	%o3,	%o7
	fmovda	%xcc,	%f1,	%f11
	edge32ln	%l2,	%g2,	%o0
	alignaddrl	%l4,	%g3,	%l6
	fxor	%f16,	%f6,	%f18
	movg	%xcc,	%i7,	%l3
	movpos	%xcc,	%i6,	%o6
	array16	%i1,	%l5,	%i5
	movvc	%icc,	%g5,	%o1
	fsrc2s	%f13,	%f20
	mulscc	%o5,	0x1FC4,	%o4
	movle	%xcc,	%g7,	%g6
	addcc	%g4,	%i2,	%i0
	edge8n	%o2,	%g1,	%l1
	movgu	%icc,	%l0,	%i3
	mulscc	%i4,	0x0220,	%o7
	umulcc	%o3,	0x0310,	%g2
	addccc	%o0,	0x11D3,	%l4
	edge8	%g3,	%l6,	%l2
	edge8	%l3,	%i7,	%i6
	fxor	%f0,	%f14,	%f12
	sth	%i1,	[%l7 + 0x78]
	fnors	%f19,	%f4,	%f29
	xor	%o6,	0x1701,	%i5
	movrgez	%g5,	0x14D,	%l5
	fmovda	%xcc,	%f11,	%f29
	edge32l	%o1,	%o5,	%g7
	fcmple16	%f30,	%f2,	%o4
	movleu	%icc,	%g6,	%g4
	fpsub16s	%f23,	%f27,	%f29
	fabsd	%f12,	%f4
	fpadd16	%f18,	%f30,	%f2
	movrgz	%i0,	%o2,	%g1
	fpsub32s	%f22,	%f8,	%f25
	sra	%l1,	%l0,	%i2
	fnegd	%f18,	%f30
	ldub	[%l7 + 0x57],	%i3
	mulx	%i4,	%o7,	%g2
	stw	%o0,	[%l7 + 0x54]
	edge8ln	%l4,	%o3,	%l6
	movrlez	%l2,	0x1C6,	%l3
	movge	%xcc,	%g3,	%i6
	sll	%i1,	%o6,	%i5
	fmul8sux16	%f12,	%f24,	%f4
	fabss	%f21,	%f18
	movrlez	%i7,	0x2A4,	%l5
	mulx	%g5,	0x0982,	%o5
	restore %o1, 0x18C4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g6,	%o4,	%g4
	xorcc	%i0,	%o2,	%g1
	ldub	[%l7 + 0x2C],	%l1
	andn	%l0,	0x1911,	%i2
	movvc	%icc,	%i3,	%i4
	orcc	%o7,	0x0B76,	%o0
	movvs	%xcc,	%l4,	%g2
	and	%o3,	%l2,	%l3
	fmovsg	%icc,	%f12,	%f25
	andncc	%l6,	%g3,	%i1
	movrlz	%i6,	0x3F5,	%o6
	sir	0x057A
	edge32	%i5,	%l5,	%g5
	subcc	%i7,	0x1B39,	%o1
	sir	0x1A38
	fmuld8sux16	%f10,	%f20,	%f22
	sub	%o5,	%g7,	%o4
	fmovdcs	%xcc,	%f11,	%f6
	alignaddr	%g6,	%i0,	%g4
	fmovdle	%icc,	%f30,	%f19
	srlx	%g1,	0x06,	%l1
	stw	%o2,	[%l7 + 0x08]
	fxors	%f1,	%f9,	%f7
	xorcc	%l0,	%i2,	%i3
	movvc	%icc,	%i4,	%o7
	ldx	[%l7 + 0x28],	%o0
	movgu	%icc,	%l4,	%g2
	edge32ln	%o3,	%l2,	%l6
	fmovdgu	%xcc,	%f20,	%f14
	ld	[%l7 + 0x44],	%f10
	or	%l3,	%i1,	%g3
	movn	%icc,	%o6,	%i6
	subccc	%l5,	0x0193,	%i5
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	movrlz	%g5,	%g7,	%o5
	alignaddrl	%g6,	%i0,	%g4
	fnor	%f18,	%f6,	%f22
	ldd	[%l7 + 0x58],	%g0
	srax	%l1,	0x07,	%o4
	edge8l	%o2,	%i2,	%i3
	fnand	%f22,	%f24,	%f8
	fmovrsgez	%l0,	%f19,	%f11
	smul	%i4,	0x0C88,	%o7
	fmovde	%icc,	%f17,	%f13
	sub	%o0,	%l4,	%g2
	array32	%l2,	%l6,	%o3
	andncc	%i1,	%g3,	%l3
	addc	%i6,	0x00D0,	%l5
	save %o6, 0x06CE, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%o1,	%g5,	%i5
	alignaddr	%g7,	%o5,	%g6
	fmovdvc	%icc,	%f6,	%f19
	st	%f31,	[%l7 + 0x44]
	ldx	[%l7 + 0x58],	%g4
	fmovda	%xcc,	%f21,	%f11
	fsrc2	%f30,	%f24
	fmovrsgz	%i0,	%f0,	%f20
	movne	%xcc,	%g1,	%l1
	edge32l	%o2,	%o4,	%i2
	fpackfix	%f6,	%f17
	fmul8ulx16	%f30,	%f8,	%f28
	popc	%i3,	%l0
	movcs	%icc,	%o7,	%o0
	ldsb	[%l7 + 0x11],	%l4
	fmovrse	%g2,	%f14,	%f6
	srlx	%i4,	0x0A,	%l2
	orncc	%l6,	0x161E,	%o3
	fnors	%f6,	%f19,	%f18
	fcmpne32	%f6,	%f2,	%i1
	alignaddr	%l3,	%i6,	%l5
	movgu	%icc,	%o6,	%i7
	ldd	[%l7 + 0x70],	%o0
	movcc	%xcc,	%g5,	%i5
	st	%f5,	[%l7 + 0x18]
	edge8n	%g7,	%o5,	%g6
	sra	%g3,	%g4,	%i0
	or	%l1,	%o2,	%o4
	fmovsg	%xcc,	%f13,	%f3
	fnor	%f30,	%f24,	%f6
	edge8n	%g1,	%i2,	%l0
	ldub	[%l7 + 0x60],	%i3
	mova	%icc,	%o7,	%l4
	nop
	set	0x24, %i2
	sth	%o0,	[%l7 + %i2]
	smulcc	%i4,	%g2,	%l2
	nop
	set	0x30, %o2
	std	%f30,	[%l7 + %o2]
	fmovdcs	%xcc,	%f4,	%f7
	movpos	%icc,	%l6,	%i1
	movpos	%icc,	%l3,	%i6
	movleu	%xcc,	%o3,	%l5
	movcc	%icc,	%i7,	%o6
	smul	%o1,	0x0FCE,	%g5
	nop
	set	0x38, %o0
	std	%f30,	[%l7 + %o0]
	mulx	%g7,	0x1B11,	%o5
	save %i5, 0x01F1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%g6,	%f30,	%f15
	edge16l	%g4,	%l1,	%i0
	edge32n	%o2,	%o4,	%i2
	andn	%l0,	%g1,	%o7
	array8	%l4,	%o0,	%i4
	fmovdneg	%icc,	%f18,	%f25
	fmovdneg	%icc,	%f29,	%f2
	fmovrsne	%g2,	%f10,	%f31
	movl	%icc,	%i3,	%l2
	faligndata	%f8,	%f6,	%f18
	fmovrdlez	%i1,	%f20,	%f4
	ldsb	[%l7 + 0x57],	%l3
	udivx	%l6,	0x0ED4,	%i6
	andcc	%l5,	%o3,	%i7
	fcmpes	%fcc2,	%f17,	%f15
	edge16ln	%o1,	%o6,	%g5
	srl	%g7,	0x09,	%o5
	andncc	%g3,	%i5,	%g4
	fmovsle	%xcc,	%f8,	%f11
	subcc	%g6,	%l1,	%i0
	addc	%o2,	0x030A,	%o4
	movvs	%icc,	%i2,	%g1
	movcs	%icc,	%l0,	%l4
	sdivcc	%o7,	0x1C39,	%i4
	edge32l	%g2,	%o0,	%l2
	sth	%i3,	[%l7 + 0x48]
	movpos	%icc,	%l3,	%i1
	stb	%l6,	[%l7 + 0x47]
	edge8l	%i6,	%l5,	%i7
	fmovsleu	%icc,	%f18,	%f7
	sdiv	%o3,	0x1746,	%o1
	edge8l	%g5,	%g7,	%o6
	stw	%o5,	[%l7 + 0x6C]
	fandnot2	%f6,	%f8,	%f2
	addc	%g3,	%g4,	%g6
	srax	%l1,	0x04,	%i0
	movrgz	%i5,	%o2,	%o4
	sdivcc	%i2,	0x18D4,	%l0
	movvc	%icc,	%g1,	%o7
	andcc	%i4,	%l4,	%g2
	fmovrdlez	%o0,	%f22,	%f22
	stb	%i3,	[%l7 + 0x38]
	ld	[%l7 + 0x40],	%f5
	lduw	[%l7 + 0x08],	%l2
	fmovsleu	%icc,	%f7,	%f2
	ld	[%l7 + 0x34],	%f18
	edge8	%i1,	%l3,	%l6
	movrgz	%l5,	%i7,	%i6
	fmovrsgez	%o1,	%f2,	%f22
	movrlz	%g5,	%g7,	%o6
	nop
	set	0x4C, %l2
	lduw	[%l7 + %l2],	%o5
	sll	%g3,	%o3,	%g6
	movgu	%xcc,	%g4,	%i0
	srax	%l1,	0x15,	%o2
	nop
	set	0x74, %l5
	lduw	[%l7 + %l5],	%o4
	fpack32	%f6,	%f24,	%f0
	edge16	%i2,	%i5,	%g1
	stb	%l0,	[%l7 + 0x5B]
	sllx	%o7,	0x19,	%i4
	xorcc	%l4,	%g2,	%o0
	fxor	%f0,	%f24,	%f24
	edge16n	%l2,	%i1,	%i3
	std	%f20,	[%l7 + 0x20]
	orcc	%l3,	%l6,	%l5
	subc	%i6,	0x1F24,	%i7
	ldsb	[%l7 + 0x7F],	%g5
	sethi	0x0E16,	%o1
	lduh	[%l7 + 0x48],	%o6
	fandnot1	%f26,	%f30,	%f30
	lduh	[%l7 + 0x10],	%g7
	movneg	%xcc,	%o5,	%g3
	movle	%icc,	%g6,	%o3
	mulx	%i0,	0x1E9C,	%g4
	ldd	[%l7 + 0x50],	%o2
	fzero	%f14
	orn	%l1,	%i2,	%o4
	fcmple16	%f24,	%f10,	%g1
	add	%l0,	0x00B0,	%i5
	edge32	%i4,	%o7,	%l4
	ldub	[%l7 + 0x21],	%o0
	array16	%g2,	%l2,	%i1
	fmovdg	%xcc,	%f12,	%f27
	sdiv	%l3,	0x0BB3,	%l6
	movrne	%i3,	%i6,	%i7
	xor	%l5,	%g5,	%o6
	fpsub16	%f18,	%f16,	%f18
	movle	%icc,	%o1,	%g7
	array16	%g3,	%g6,	%o5
	edge8l	%o3,	%g4,	%i0
	srl	%l1,	0x15,	%i2
	fxnor	%f0,	%f16,	%f10
	sir	0x173E
	umul	%o2,	%g1,	%o4
	fsrc2	%f10,	%f6
	sllx	%l0,	%i5,	%i4
	and	%l4,	%o7,	%o0
	ldd	[%l7 + 0x08],	%f28
	alignaddrl	%l2,	%i1,	%g2
	add	%l3,	0x179F,	%i3
	lduh	[%l7 + 0x78],	%i6
	sra	%i7,	%l5,	%g5
	xnor	%l6,	%o1,	%o6
	udivx	%g3,	0x18F3,	%g7
	ld	[%l7 + 0x10],	%f11
	xnorcc	%o5,	%o3,	%g6
	srlx	%g4,	%l1,	%i2
	sdiv	%i0,	0x00EB,	%g1
	alignaddr	%o4,	%o2,	%i5
	edge8n	%i4,	%l0,	%l4
	fmuld8ulx16	%f7,	%f27,	%f6
	alignaddrl	%o0,	%l2,	%i1
	movne	%xcc,	%o7,	%l3
	fmovsl	%xcc,	%f10,	%f16
	srl	%i3,	0x0C,	%g2
	and	%i6,	%l5,	%i7
	subc	%l6,	0x030B,	%o1
	smulcc	%g5,	0x01AE,	%g3
	andncc	%o6,	%o5,	%o3
	lduw	[%l7 + 0x24],	%g6
	fand	%f26,	%f4,	%f2
	srlx	%g7,	0x0D,	%g4
	movge	%icc,	%l1,	%i0
	nop
	set	0x10, %g7
	ldsw	[%l7 + %g7],	%i2
	edge16l	%g1,	%o4,	%o2
	movn	%xcc,	%i5,	%l0
	nop
	set	0x30, %o6
	stx	%l4,	[%l7 + %o6]
	orncc	%i4,	%o0,	%i1
	xor	%l2,	0x1BBC,	%l3
	ldsh	[%l7 + 0x3A],	%o7
	fcmpes	%fcc1,	%f22,	%f19
	fpsub32	%f8,	%f26,	%f28
	fxors	%f10,	%f25,	%f29
	fpsub16	%f18,	%f14,	%f0
	movcc	%icc,	%g2,	%i6
	edge32ln	%i3,	%i7,	%l6
	edge8ln	%o1,	%l5,	%g3
	movl	%icc,	%o6,	%o5
	umulcc	%g5,	%o3,	%g7
	edge32	%g6,	%l1,	%i0
	movgu	%icc,	%g4,	%i2
	fmovsa	%xcc,	%f4,	%f19
	orn	%o4,	0x098F,	%o2
	fsrc1s	%f14,	%f15
	fpadd32s	%f9,	%f9,	%f11
	edge16l	%i5,	%g1,	%l0
	ldsb	[%l7 + 0x18],	%l4
	popc	0x0268,	%i4
	addccc	%o0,	%l2,	%i1
	xnor	%l3,	0x041B,	%o7
	fpadd16s	%f12,	%f28,	%f23
	movg	%icc,	%g2,	%i6
	fpack32	%f4,	%f6,	%f28
	fmul8ulx16	%f20,	%f26,	%f2
	fxors	%f0,	%f17,	%f10
	fmovdvs	%icc,	%f15,	%f31
	andcc	%i3,	%i7,	%o1
	umul	%l6,	0x07AA,	%g3
	movrgz	%l5,	0x2FF,	%o6
	fmovrde	%o5,	%f18,	%f20
	bshuffle	%f28,	%f14,	%f20
	sll	%g5,	%g7,	%g6
	movrgez	%o3,	%l1,	%g4
	sdivcc	%i0,	0x0994,	%i2
	movleu	%icc,	%o4,	%o2
	restore %i5, 0x1838, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g1,	0x10D4,	%i4
	fpack32	%f2,	%f6,	%f20
	fsrc1s	%f22,	%f9
	fornot2	%f30,	%f30,	%f8
	srl	%l4,	%l2,	%o0
	fpack32	%f6,	%f22,	%f24
	edge8n	%i1,	%o7,	%l3
	edge32	%i6,	%g2,	%i3
	fmovrdne	%i7,	%f4,	%f16
	srax	%l6,	%o1,	%g3
	movne	%xcc,	%o6,	%o5
	popc	0x1C7B,	%l5
	xorcc	%g5,	%g6,	%g7
	add	%o3,	0x158C,	%l1
	xnor	%g4,	%i0,	%i2
	smulcc	%o2,	%i5,	%o4
	orncc	%g1,	0x11B0,	%i4
	stw	%l0,	[%l7 + 0x24]
	sir	0x0273
	sdiv	%l2,	0x172C,	%l4
	fsrc2s	%f17,	%f28
	edge8ln	%o0,	%i1,	%o7
	ldub	[%l7 + 0x4E],	%i6
	pdist	%f8,	%f16,	%f12
	ldd	[%l7 + 0x10],	%f26
	or	%g2,	%l3,	%i7
	array16	%i3,	%o1,	%g3
	fnot1	%f6,	%f30
	ldsw	[%l7 + 0x68],	%l6
	movg	%icc,	%o6,	%l5
	sdivcc	%o5,	0x13DF,	%g6
	fcmped	%fcc2,	%f6,	%f22
	movg	%icc,	%g7,	%o3
	sth	%l1,	[%l7 + 0x3E]
	stw	%g5,	[%l7 + 0x18]
	st	%f26,	[%l7 + 0x64]
	array32	%i0,	%i2,	%o2
	andncc	%i5,	%o4,	%g4
	fmovsn	%xcc,	%f3,	%f19
	andncc	%g1,	%i4,	%l0
	sethi	0x1A9D,	%l2
	srlx	%l4,	%i1,	%o0
	fmovdl	%xcc,	%f7,	%f12
	orncc	%i6,	0x1CAA,	%g2
	ldub	[%l7 + 0x42],	%o7
	edge8ln	%i7,	%i3,	%o1
	movvs	%xcc,	%g3,	%l6
	sdivcc	%l3,	0x1513,	%o6
	movrgez	%o5,	%l5,	%g7
	fmovrslez	%g6,	%f6,	%f27
	fnand	%f30,	%f12,	%f10
	movneg	%icc,	%o3,	%l1
	fxor	%f0,	%f10,	%f14
	ldx	[%l7 + 0x10],	%i0
	sdiv	%g5,	0x06D0,	%o2
	subcc	%i5,	0x0B42,	%i2
	srax	%g4,	%g1,	%o4
	movvc	%xcc,	%i4,	%l0
	stb	%l2,	[%l7 + 0x4B]
	sethi	0x0882,	%i1
	xnorcc	%l4,	%o0,	%i6
	movge	%icc,	%o7,	%g2
	lduh	[%l7 + 0x34],	%i7
	fmuld8ulx16	%f11,	%f31,	%f12
	array32	%o1,	%g3,	%l6
	edge16n	%i3,	%l3,	%o6
	ld	[%l7 + 0x58],	%f10
	fmovrse	%o5,	%f0,	%f0
	subc	%l5,	0x1B51,	%g7
	stx	%g6,	[%l7 + 0x58]
	edge8l	%o3,	%i0,	%l1
	sll	%g5,	0x0B,	%i5
	fmovdvs	%icc,	%f11,	%f19
	addcc	%i2,	%g4,	%o2
	alignaddrl	%g1,	%i4,	%o4
	smulcc	%l0,	0x00DC,	%i1
	edge16ln	%l2,	%l4,	%o0
	ldub	[%l7 + 0x0A],	%o7
	fcmpes	%fcc3,	%f16,	%f14
	fpsub32	%f30,	%f22,	%f26
	xor	%g2,	0x1037,	%i7
	movn	%icc,	%i6,	%g3
	edge16	%l6,	%o1,	%i3
	mulscc	%o6,	0x19E5,	%o5
	srl	%l3,	0x11,	%g7
	ldsb	[%l7 + 0x14],	%l5
	array16	%o3,	%i0,	%g6
	array8	%l1,	%i5,	%i2
	xorcc	%g4,	0x09B4,	%o2
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	nop
	set	0x67, %o5
	ldub	[%l7 + %o5],	%i4
	fnegs	%f14,	%f24
	ldx	[%l7 + 0x38],	%o4
	udivcc	%l0,	0x0187,	%i1
	std	%f30,	[%l7 + 0x48]
	array16	%l2,	%l4,	%o0
	fmovdvs	%xcc,	%f8,	%f26
	sir	0x09D0
	fors	%f28,	%f4,	%f12
	xorcc	%g2,	0x187B,	%o7
	fnot2	%f6,	%f18
	restore %i6, 0x1ADB, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%l6,	%o1
	nop
	set	0x68, %i3
	ldd	[%l7 + %i3],	%i6
	subcc	%i3,	%o6,	%l3
	orn	%g7,	%o5,	%l5
	edge16	%o3,	%i0,	%l1
	edge32n	%i5,	%g6,	%i2
	subcc	%o2,	%g5,	%g1
	sll	%i4,	0x19,	%g4
	xnorcc	%o4,	0x19FC,	%l0
	movn	%icc,	%l2,	%i1
	udivcc	%l4,	0x0DB2,	%o0
	sdiv	%g2,	0x15F0,	%o7
	edge8ln	%g3,	%l6,	%o1
	udivcc	%i6,	0x0BF1,	%i7
	fpadd32s	%f11,	%f21,	%f31
	udivx	%i3,	0x1BF4,	%l3
	edge8ln	%o6,	%g7,	%o5
	andncc	%o3,	%l5,	%i0
	edge8	%l1,	%i5,	%g6
	nop
	set	0x0E, %g4
	sth	%i2,	[%l7 + %g4]
	edge16l	%g5,	%o2,	%g1
	fmul8ulx16	%f6,	%f2,	%f6
	xnorcc	%i4,	0x067C,	%o4
	edge16	%g4,	%l2,	%i1
	fmovrdgz	%l0,	%f30,	%f6
	fmovdneg	%xcc,	%f30,	%f6
	orncc	%l4,	%g2,	%o0
	edge32n	%o7,	%l6,	%g3
	ldsw	[%l7 + 0x68],	%o1
	srl	%i7,	%i3,	%l3
	fornot1s	%f13,	%f12,	%f6
	fxors	%f4,	%f31,	%f0
	save %o6, 0x0593, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g7,	%o5,	%l5
	fzero	%f8
	st	%f3,	[%l7 + 0x0C]
	ldd	[%l7 + 0x30],	%f26
	fmul8x16	%f5,	%f4,	%f26
	edge32n	%i0,	%o3,	%l1
	andncc	%g6,	%i2,	%i5
	sdivcc	%o2,	0x0DBA,	%g1
	nop
	set	0x54, %i1
	ldsb	[%l7 + %i1],	%g5
	fmovrsgz	%i4,	%f13,	%f1
	fcmpne32	%f20,	%f30,	%g4
	stw	%l2,	[%l7 + 0x60]
	movrne	%o4,	%i1,	%l0
	fmovscc	%icc,	%f25,	%f9
	srax	%l4,	%o0,	%g2
	edge32ln	%l6,	%g3,	%o7
	fpsub16	%f6,	%f30,	%f12
	ldsw	[%l7 + 0x54],	%i7
	or	%i3,	0x0BD3,	%l3
	subc	%o1,	%i6,	%g7
	movpos	%icc,	%o5,	%o6
	edge16l	%i0,	%o3,	%l1
	udivx	%g6,	0x01C3,	%i2
	sdivcc	%l5,	0x1540,	%o2
	fzeros	%f3
	udiv	%i5,	0x1A5D,	%g1
	addcc	%g5,	0x02B7,	%i4
	subcc	%l2,	0x123F,	%g4
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	xorcc	%l0,	%l4,	%o0
	edge8	%g2,	%l6,	%o7
	fmovrsne	%i7,	%f13,	%f31
	movneg	%icc,	%i3,	%g3
	save %o1, %l3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o5,	0x0705,	%i6
	stw	%i0,	[%l7 + 0x08]
	fmovrdgez	%o3,	%f24,	%f6
	umul	%o6,	0x035E,	%l1
	ldsh	[%l7 + 0x2A],	%g6
	movl	%xcc,	%i2,	%l5
	and	%i5,	0x1069,	%o2
	movrne	%g5,	0x215,	%i4
	stb	%l2,	[%l7 + 0x31]
	edge16l	%g1,	%i1,	%g4
	srax	%l0,	0x0B,	%o4
	restore %o0, 0x08C8, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x12],	%l4
	movle	%icc,	%o7,	%l6
	movvs	%icc,	%i7,	%i3
	xorcc	%o1,	0x1CE1,	%l3
	fxnor	%f8,	%f18,	%f26
	lduw	[%l7 + 0x5C],	%g3
	edge16ln	%o5,	%i6,	%i0
	fpadd16s	%f5,	%f23,	%f24
	movle	%icc,	%g7,	%o3
	ld	[%l7 + 0x64],	%f26
	mulscc	%l1,	0x0FA8,	%g6
	fnegd	%f4,	%f26
	xnorcc	%i2,	%l5,	%o6
	andncc	%i5,	%g5,	%i4
	movgu	%icc,	%o2,	%l2
	std	%f2,	[%l7 + 0x60]
	edge32n	%g1,	%i1,	%g4
	fnors	%f0,	%f25,	%f18
	fmovsl	%xcc,	%f15,	%f23
	fmuld8ulx16	%f1,	%f21,	%f6
	fcmped	%fcc3,	%f0,	%f10
	movne	%icc,	%o4,	%l0
	ldsw	[%l7 + 0x18],	%g2
	addccc	%l4,	0x1C28,	%o7
	edge16ln	%o0,	%i7,	%i3
	ldx	[%l7 + 0x78],	%l6
	fmovspos	%xcc,	%f11,	%f18
	fandnot2s	%f17,	%f25,	%f12
	ldsw	[%l7 + 0x20],	%o1
	fmovs	%f10,	%f30
	edge32l	%g3,	%l3,	%o5
	subc	%i0,	0x1182,	%g7
	andn	%i6,	0x13B0,	%l1
	xorcc	%o3,	0x0773,	%i2
	edge8	%g6,	%l5,	%o6
	move	%icc,	%i5,	%i4
	movle	%icc,	%o2,	%l2
	movgu	%xcc,	%g5,	%g1
	smul	%g4,	0x1490,	%i1
	srl	%l0,	%o4,	%l4
	and	%g2,	0x1F73,	%o7
	fmovdgu	%icc,	%f29,	%f12
	umulcc	%i7,	0x12FE,	%i3
	movge	%xcc,	%l6,	%o0
	sub	%g3,	%o1,	%o5
	fcmpd	%fcc1,	%f20,	%f20
	movge	%icc,	%i0,	%g7
	movrgz	%l3,	0x318,	%i6
	faligndata	%f12,	%f2,	%f14
	addc	%o3,	%l1,	%i2
	edge16ln	%l5,	%g6,	%o6
	movpos	%icc,	%i5,	%i4
	orncc	%l2,	%g5,	%o2
	fmovscs	%icc,	%f21,	%f15
	ld	[%l7 + 0x34],	%f12
	array16	%g1,	%i1,	%g4
	movcs	%xcc,	%o4,	%l0
	stw	%l4,	[%l7 + 0x5C]
	movg	%icc,	%o7,	%g2
	sdivx	%i7,	0x0FC3,	%i3
	ldd	[%l7 + 0x18],	%o0
	nop
	set	0x50, %i7
	ldub	[%l7 + %i7],	%l6
	nop
	set	0x18, %i6
	ldd	[%l7 + %i6],	%g2
	std	%f30,	[%l7 + 0x48]
	and	%o5,	%i0,	%g7
	ldsh	[%l7 + 0x52],	%l3
	movre	%o1,	%o3,	%l1
	srlx	%i6,	0x11,	%l5
	edge32ln	%i2,	%o6,	%i5
	edge32ln	%g6,	%l2,	%g5
	bshuffle	%f12,	%f22,	%f2
	stx	%i4,	[%l7 + 0x30]
	ldx	[%l7 + 0x08],	%o2
	movleu	%xcc,	%g1,	%g4
	movne	%icc,	%o4,	%i1
	fpadd16s	%f8,	%f25,	%f12
	fpack32	%f14,	%f10,	%f30
	fmovdvs	%icc,	%f7,	%f23
	srax	%l4,	%l0,	%o7
	lduw	[%l7 + 0x10],	%g2
	orcc	%i3,	0x0E12,	%o0
	movge	%xcc,	%l6,	%i7
	addccc	%g3,	%o5,	%i0
	array16	%l3,	%g7,	%o3
	andcc	%l1,	0x118F,	%i6
	popc	0x1154,	%o1
	fabss	%f1,	%f14
	ldsb	[%l7 + 0x4B],	%i2
	movvs	%icc,	%o6,	%i5
	sdiv	%l5,	0x19CA,	%g6
	array32	%l2,	%i4,	%o2
	edge16ln	%g5,	%g1,	%o4
	addcc	%i1,	%g4,	%l0
	andcc	%o7,	%l4,	%g2
	subcc	%i3,	0x0CC8,	%l6
	sub	%i7,	%g3,	%o5
	ldd	[%l7 + 0x30],	%f2
	movle	%icc,	%i0,	%o0
	movrgez	%l3,	%g7,	%o3
	smulcc	%i6,	%o1,	%l1
	orn	%o6,	%i2,	%i5
	umul	%l5,	0x0A05,	%g6
	edge16l	%l2,	%i4,	%g5
	fpadd32	%f28,	%f18,	%f30
	fxor	%f28,	%f30,	%f26
	fmovsg	%icc,	%f16,	%f11
	mova	%icc,	%g1,	%o2
	orncc	%o4,	%g4,	%i1
	movneg	%xcc,	%l0,	%l4
	movg	%icc,	%o7,	%g2
	srlx	%i3,	%i7,	%g3
	lduh	[%l7 + 0x6C],	%o5
	ldd	[%l7 + 0x08],	%f28
	movge	%icc,	%l6,	%i0
	ldsh	[%l7 + 0x5E],	%o0
	movpos	%icc,	%g7,	%l3
	bshuffle	%f8,	%f6,	%f22
	movcc	%xcc,	%o3,	%o1
	movle	%xcc,	%i6,	%l1
	xnor	%o6,	0x0F04,	%i5
	and	%l5,	%g6,	%i2
	fmovspos	%icc,	%f1,	%f12
	orn	%i4,	%l2,	%g1
	edge32n	%g5,	%o4,	%o2
	sra	%g4,	%i1,	%l4
	array32	%o7,	%g2,	%l0
	andncc	%i7,	%i3,	%o5
	udivcc	%g3,	0x15CA,	%l6
	std	%f22,	[%l7 + 0x20]
	srlx	%o0,	%g7,	%l3
	alignaddr	%o3,	%i0,	%i6
	xor	%o1,	0x1BC6,	%l1
	alignaddr	%o6,	%l5,	%g6
	fpack16	%f14,	%f15
	fnot2	%f22,	%f12
	fpadd32	%f6,	%f18,	%f4
	movvc	%icc,	%i5,	%i2
	sllx	%l2,	0x10,	%i4
	fcmpgt16	%f8,	%f28,	%g5
	ldsb	[%l7 + 0x62],	%g1
	st	%f27,	[%l7 + 0x20]
	xorcc	%o4,	0x1FB3,	%g4
	fors	%f4,	%f25,	%f18
	movrlez	%o2,	0x2DC,	%i1
	stb	%o7,	[%l7 + 0x3E]
	movrlz	%l4,	%g2,	%l0
	fmovscc	%icc,	%f21,	%f8
	movl	%icc,	%i7,	%i3
	sdivcc	%o5,	0x074C,	%g3
	movleu	%xcc,	%l6,	%o0
	smulcc	%g7,	0x0085,	%l3
	fmovsvc	%xcc,	%f30,	%f20
	fmovdn	%icc,	%f17,	%f21
	sdiv	%o3,	0x1A27,	%i0
	movle	%xcc,	%i6,	%l1
	ldub	[%l7 + 0x6C],	%o6
	st	%f28,	[%l7 + 0x3C]
	movvs	%xcc,	%o1,	%g6
	fpackfix	%f16,	%f16
	subcc	%i5,	%i2,	%l2
	ldsw	[%l7 + 0x60],	%l5
	xnor	%g5,	0x12C5,	%i4
	ldsb	[%l7 + 0x68],	%g1
	ldd	[%l7 + 0x78],	%o4
	edge8n	%g4,	%i1,	%o7
	subcc	%o2,	0x06B9,	%l4
	edge16	%g2,	%l0,	%i7
	movgu	%icc,	%o5,	%i3
	fsrc1s	%f6,	%f7
	ld	[%l7 + 0x30],	%f25
	stw	%g3,	[%l7 + 0x70]
	ldd	[%l7 + 0x68],	%i6
	array32	%g7,	%o0,	%o3
	movcs	%icc,	%l3,	%i0
	srax	%l1,	%o6,	%o1
	subc	%g6,	0x1348,	%i5
	xorcc	%i2,	%l2,	%i6
	sth	%l5,	[%l7 + 0x2C]
	alignaddrl	%g5,	%g1,	%i4
	fmovsgu	%xcc,	%f15,	%f8
	fpack16	%f30,	%f10
	fmovdn	%xcc,	%f23,	%f6
	edge16l	%g4,	%o4,	%i1
	movcs	%xcc,	%o2,	%o7
	movge	%xcc,	%g2,	%l4
	xor	%i7,	%o5,	%i3
	fmovdcc	%xcc,	%f2,	%f14
	movrgez	%g3,	%l6,	%g7
	alignaddr	%o0,	%l0,	%l3
	lduw	[%l7 + 0x44],	%i0
	movgu	%icc,	%l1,	%o6
	fcmpgt16	%f8,	%f4,	%o1
	udiv	%o3,	0x028D,	%g6
	nop
	set	0x10, %i5
	ldd	[%l7 + %i5],	%i2
	sll	%i5,	0x08,	%i6
	fmovdvs	%xcc,	%f11,	%f0
	edge16ln	%l5,	%l2,	%g5
	stw	%g1,	[%l7 + 0x20]
	andcc	%i4,	0x0506,	%o4
	add	%g4,	0x09D7,	%i1
	or	%o7,	%o2,	%g2
	or	%i7,	%o5,	%i3
	sdivx	%g3,	0x1CF2,	%l4
	orncc	%g7,	0x0460,	%o0
	ldub	[%l7 + 0x65],	%l0
	andcc	%l6,	0x0F45,	%l3
	edge32	%l1,	%o6,	%o1
	edge32	%i0,	%g6,	%o3
	fnors	%f4,	%f29,	%f11
	array8	%i5,	%i6,	%i2
	andn	%l2,	%g5,	%g1
	edge32ln	%l5,	%i4,	%g4
	addc	%i1,	0x1377,	%o4
	ldx	[%l7 + 0x58],	%o7
	fmovsne	%icc,	%f4,	%f29
	sllx	%o2,	%i7,	%o5
	fcmpgt32	%f24,	%f4,	%g2
	edge16	%i3,	%l4,	%g3
	st	%f27,	[%l7 + 0x48]
	xorcc	%o0,	%l0,	%l6
	array8	%l3,	%l1,	%g7
	movvs	%icc,	%o1,	%o6
	sub	%i0,	%g6,	%i5
	fmovrdlez	%o3,	%f0,	%f30
	fcmpeq32	%f26,	%f30,	%i2
	edge16n	%i6,	%g5,	%l2
	fnand	%f24,	%f20,	%f2
	srl	%g1,	%l5,	%i4
	movvs	%icc,	%i1,	%g4
	fmovrde	%o7,	%f24,	%f0
	edge32l	%o2,	%i7,	%o5
	ldub	[%l7 + 0x5E],	%g2
	movgu	%xcc,	%i3,	%l4
	fmovdn	%icc,	%f0,	%f9
	std	%f22,	[%l7 + 0x38]
	movleu	%xcc,	%g3,	%o4
	umulcc	%l0,	0x0617,	%o0
	movpos	%icc,	%l3,	%l6
	udivcc	%l1,	0x18F5,	%o1
	fmovrdne	%o6,	%f28,	%f14
	movcs	%xcc,	%g7,	%g6
	array16	%i5,	%o3,	%i2
	stw	%i0,	[%l7 + 0x50]
	alignaddr	%g5,	%i6,	%g1
	srax	%l5,	0x0C,	%i4
	movle	%icc,	%i1,	%g4
	alignaddrl	%o7,	%o2,	%i7
	udivx	%l2,	0x0A23,	%o5
	addccc	%i3,	%l4,	%g3
	smul	%g2,	%o4,	%l0
	subccc	%l3,	0x10D3,	%o0
	add	%l1,	%o1,	%l6
	mova	%xcc,	%o6,	%g7
	movrlez	%g6,	0x0F8,	%o3
	alignaddr	%i2,	%i0,	%g5
	fxnor	%f4,	%f30,	%f10
	fmul8sux16	%f18,	%f4,	%f28
	fmul8ulx16	%f26,	%f18,	%f10
	andcc	%i5,	%i6,	%g1
	alignaddrl	%i4,	%l5,	%g4
	ldsh	[%l7 + 0x64],	%i1
	udivcc	%o2,	0x171A,	%i7
	fpack32	%f24,	%f4,	%f22
	alignaddr	%l2,	%o5,	%o7
	std	%f12,	[%l7 + 0x78]
	fone	%f22
	movrlez	%i3,	0x0B8,	%l4
	addcc	%g3,	0x04D5,	%o4
	fmovsl	%icc,	%f17,	%f31
	smul	%g2,	%l3,	%o0
	array16	%l0,	%o1,	%l6
	nop
	set	0x4E, %o4
	ldsh	[%l7 + %o4],	%l1
	lduw	[%l7 + 0x74],	%g7
	subccc	%g6,	%o6,	%o3
	orncc	%i2,	%i0,	%g5
	edge32l	%i5,	%i6,	%g1
	smul	%i4,	%g4,	%i1
	orncc	%l5,	0x1F5D,	%i7
	edge16ln	%o2,	%l2,	%o5
	nop
	set	0x68, %g6
	stx	%i3,	[%l7 + %g6]
	fpack32	%f10,	%f4,	%f2
	fmovs	%f0,	%f17
	movn	%icc,	%l4,	%o7
	sdiv	%o4,	0x1767,	%g3
	fmovs	%f10,	%f18
	movl	%icc,	%l3,	%g2
	addcc	%l0,	%o1,	%l6
	nop
	set	0x6C, %o3
	lduh	[%l7 + %o3],	%l1
	movn	%icc,	%g7,	%g6
	sub	%o6,	%o0,	%o3
	movn	%icc,	%i2,	%i0
	xor	%i5,	%i6,	%g1
	edge16n	%g5,	%g4,	%i1
	fexpand	%f30,	%f10
	addcc	%i4,	%i7,	%o2
	add	%l5,	0x167C,	%o5
	save %l2, 0x0B04, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%l4,	0x0EAF,	%o7
	fxnor	%f4,	%f2,	%f4
	addc	%o4,	%l3,	%g2
	movvs	%icc,	%g3,	%l0
	movrlez	%l6,	%l1,	%g7
	umulcc	%g6,	%o6,	%o1
	srlx	%o3,	%o0,	%i0
	lduh	[%l7 + 0x62],	%i5
	ldsh	[%l7 + 0x18],	%i2
	fmovdge	%xcc,	%f24,	%f30
	sllx	%i6,	0x15,	%g1
	subcc	%g4,	%i1,	%i4
	movcc	%icc,	%g5,	%i7
	fmovrdne	%o2,	%f28,	%f14
	movre	%l5,	0x3E5,	%l2
	sra	%i3,	%o5,	%o7
	movvc	%icc,	%l4,	%l3
	fmovrde	%g2,	%f30,	%f4
	edge16l	%o4,	%l0,	%l6
	lduw	[%l7 + 0x54],	%g3
	ldd	[%l7 + 0x20],	%l0
	sll	%g7,	0x16,	%g6
	fmovscc	%xcc,	%f30,	%f18
	movl	%xcc,	%o1,	%o6
	edge8n	%o3,	%i0,	%o0
	fornot1s	%f23,	%f28,	%f24
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	srax	%i6,	%g4,	%i1
	umul	%g1,	%i4,	%g5
	sir	0x152B
	ld	[%l7 + 0x20],	%f6
	udiv	%i7,	0x1204,	%o2
	fandnot2s	%f2,	%f5,	%f6
	edge32	%l2,	%i3,	%l5
	fmovse	%icc,	%f22,	%f19
	fxor	%f30,	%f10,	%f4
	movleu	%xcc,	%o7,	%l4
	ldsb	[%l7 + 0x28],	%l3
	movvc	%xcc,	%g2,	%o5
	addcc	%o4,	%l0,	%l6
	sub	%g3,	%g7,	%l1
	ldd	[%l7 + 0x68],	%f24
	lduh	[%l7 + 0x50],	%g6
	ldd	[%l7 + 0x70],	%o6
	nop
	set	0x60, %i4
	stx	%o1,	[%l7 + %i4]
	stb	%o3,	[%l7 + 0x57]
	edge8l	%o0,	%i0,	%i5
	fone	%f14
	alignaddr	%i6,	%g4,	%i2
	andncc	%i1,	%g1,	%i4
	edge16l	%i7,	%o2,	%g5
	edge8	%l2,	%i3,	%o7
	stb	%l5,	[%l7 + 0x39]
	fcmpd	%fcc1,	%f22,	%f22
	edge16n	%l4,	%l3,	%o5
	sll	%o4,	%l0,	%g2
	subc	%l6,	0x179B,	%g7
	fnegd	%f12,	%f8
	fmovdge	%icc,	%f31,	%f13
	edge8l	%l1,	%g6,	%g3
	mova	%icc,	%o6,	%o1
	movvs	%xcc,	%o3,	%i0
	sdiv	%o0,	0x1064,	%i5
	stb	%i6,	[%l7 + 0x63]
	stx	%g4,	[%l7 + 0x58]
	lduh	[%l7 + 0x40],	%i2
	edge16n	%g1,	%i1,	%i4
	fmovsne	%icc,	%f21,	%f24
	umulcc	%i7,	0x176A,	%o2
	lduh	[%l7 + 0x24],	%g5
	edge32n	%i3,	%o7,	%l5
	fcmple16	%f26,	%f24,	%l2
	udiv	%l4,	0x1E4E,	%o5
	edge8	%o4,	%l0,	%g2
	movvs	%icc,	%l3,	%l6
	srl	%l1,	0x04,	%g7
	fzero	%f6
	sir	0x1753
	nop
	set	0x52, %o1
	sth	%g6,	[%l7 + %o1]
	smul	%o6,	0x097E,	%g3
	udiv	%o3,	0x19FA,	%o1
	lduh	[%l7 + 0x1C],	%o0
	orncc	%i0,	0x12E7,	%i5
	ldx	[%l7 + 0x60],	%i6
	xor	%g4,	0x1E27,	%g1
	sll	%i1,	%i4,	%i2
	andn	%o2,	0x0E4C,	%g5
	fmovdcs	%icc,	%f10,	%f21
	sir	0x017D
	fnegs	%f20,	%f21
	smul	%i3,	%o7,	%i7
	movcs	%xcc,	%l2,	%l4
	fpackfix	%f6,	%f26
	fmovrsgez	%l5,	%f1,	%f20
	st	%f10,	[%l7 + 0x70]
	fmovsn	%icc,	%f30,	%f21
	ldsh	[%l7 + 0x28],	%o4
	edge16ln	%o5,	%l0,	%l3
	movge	%xcc,	%g2,	%l1
	edge16n	%g7,	%l6,	%g6
	stx	%g3,	[%l7 + 0x30]
	movrgz	%o6,	0x129,	%o1
	add	%o0,	%i0,	%o3
	fpsub16	%f8,	%f4,	%f0
	mulscc	%i5,	0x19BA,	%i6
	movpos	%icc,	%g1,	%g4
	fmovdcs	%xcc,	%f23,	%f21
	lduw	[%l7 + 0x18],	%i1
	andncc	%i2,	%i4,	%g5
	fmovrse	%o2,	%f20,	%f16
	xorcc	%i3,	0x0CF8,	%i7
	nop
	set	0x74, %g5
	ldsw	[%l7 + %g5],	%o7
	srlx	%l4,	%l2,	%l5
	fmovrdgz	%o5,	%f22,	%f6
	sdivx	%l0,	0x03EC,	%l3
	edge16n	%g2,	%l1,	%g7
	xor	%l6,	0x0AE0,	%g6
	alignaddr	%o4,	%o6,	%g3
	edge8l	%o1,	%o0,	%o3
	fmovspos	%icc,	%f24,	%f13
	movcs	%xcc,	%i0,	%i5
	andcc	%g1,	0x1496,	%g4
	ldub	[%l7 + 0x2F],	%i6
	movvc	%xcc,	%i2,	%i1
	fpack32	%f14,	%f16,	%f0
	add	%i4,	0x09B9,	%o2
	sll	%g5,	%i3,	%i7
	fcmpd	%fcc2,	%f10,	%f18
	fmovrdgez	%l4,	%f22,	%f4
	ld	[%l7 + 0x24],	%f9
	edge32ln	%o7,	%l5,	%l2
	xnor	%o5,	%l0,	%g2
	add	%l1,	0x0293,	%g7
	smul	%l3,	%l6,	%g6
	movrlz	%o4,	0x1B0,	%o6
	xnorcc	%g3,	%o0,	%o1
	movgu	%xcc,	%o3,	%i0
	movle	%xcc,	%g1,	%g4
	xorcc	%i6,	0x00A1,	%i2
	fmul8x16	%f28,	%f4,	%f24
	smul	%i5,	%i1,	%o2
	ldsw	[%l7 + 0x7C],	%i4
	ldsw	[%l7 + 0x38],	%g5
	movle	%xcc,	%i7,	%i3
	fmovdneg	%xcc,	%f23,	%f11
	or	%o7,	0x0677,	%l5
	umulcc	%l2,	%o5,	%l0
	fzero	%f2
	movrgez	%g2,	%l4,	%l1
	edge32ln	%g7,	%l6,	%g6
	umulcc	%o4,	0x0FA1,	%o6
	fors	%f14,	%f12,	%f21
	udiv	%g3,	0x028E,	%o0
	fcmpes	%fcc3,	%f7,	%f30
	movre	%l3,	%o1,	%i0
	save %g1, 0x12F9, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%i6,	0x0986,	%i2
	popc	0x0FBC,	%i5
	faligndata	%f24,	%f10,	%f2
	edge32l	%o3,	%i1,	%i4
	movrlez	%g5,	0x36F,	%i7
	xor	%i3,	%o7,	%l5
	array8	%o2,	%o5,	%l2
	edge8ln	%l0,	%l4,	%g2
	fpack32	%f24,	%f24,	%f8
	movcc	%xcc,	%g7,	%l6
	fmovdpos	%icc,	%f9,	%f13
	array16	%l1,	%o4,	%o6
	addcc	%g3,	%g6,	%l3
	addccc	%o1,	0x07A9,	%o0
	fandnot2	%f24,	%f0,	%f6
	movrlez	%g1,	%g4,	%i0
	edge8l	%i6,	%i2,	%o3
	smul	%i1,	0x1B13,	%i5
	st	%f28,	[%l7 + 0x14]
	fmul8x16au	%f10,	%f1,	%f14
	srl	%g5,	%i7,	%i3
	movcs	%icc,	%o7,	%i4
	movg	%xcc,	%o2,	%l5
	fmovsa	%xcc,	%f26,	%f30
	std	%f16,	[%l7 + 0x38]
	fmovsge	%icc,	%f19,	%f2
	movvc	%icc,	%l2,	%o5
	orn	%l4,	0x00FE,	%l0
	orn	%g2,	%g7,	%l1
	bshuffle	%f4,	%f4,	%f28
	edge32	%l6,	%o6,	%g3
	fsrc2s	%f17,	%f8
	fnor	%f0,	%f20,	%f14
	alignaddrl	%o4,	%g6,	%o1
	fmovrsgez	%o0,	%f15,	%f4
	array32	%g1,	%g4,	%l3
	sra	%i0,	0x0C,	%i6
	stw	%o3,	[%l7 + 0x64]
	sdivcc	%i1,	0x0CED,	%i2
	edge32l	%i5,	%i7,	%g5
	movn	%icc,	%i3,	%o7
	fpsub32s	%f31,	%f4,	%f25
	alignaddr	%i4,	%l5,	%o2
	movre	%l2,	%l4,	%l0
	srlx	%o5,	0x0B,	%g7
	restore %g2, %l1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l6,	%g3,	%o4
	ld	[%l7 + 0x7C],	%f13
	fcmpd	%fcc0,	%f8,	%f14
	fpackfix	%f8,	%f6
	udiv	%o1,	0x058D,	%g6
	fornot1	%f22,	%f4,	%f30
	ldx	[%l7 + 0x30],	%o0
	array8	%g4,	%l3,	%i0
	array32	%g1,	%i6,	%o3
	or	%i1,	0x1148,	%i5
	alignaddrl	%i7,	%i2,	%i3
	movneg	%icc,	%o7,	%g5
	movl	%icc,	%l5,	%i4
	xorcc	%l2,	%l4,	%o2
	movg	%icc,	%l0,	%g7
	array16	%g2,	%o5,	%l1
	alignaddr	%o6,	%l6,	%g3
	sdiv	%o1,	0x148A,	%o4
	popc	%g6,	%g4
	edge16ln	%l3,	%o0,	%i0
	fzero	%f30
	xor	%g1,	%i6,	%i1
	lduw	[%l7 + 0x3C],	%i5
	fmovsgu	%xcc,	%f28,	%f22
	popc	%i7,	%i2
	movne	%xcc,	%i3,	%o7
	fandnot1s	%f16,	%f29,	%f5
	smulcc	%g5,	%l5,	%o3
	edge16n	%i4,	%l2,	%o2
	fpack32	%f12,	%f4,	%f16
	popc	%l4,	%l0
	move	%icc,	%g2,	%o5
	mulscc	%l1,	%g7,	%l6
	array32	%g3,	%o1,	%o4
	movrgz	%o6,	%g4,	%g6
	edge16n	%l3,	%o0,	%i0
	stw	%i6,	[%l7 + 0x6C]
	srlx	%i1,	0x1B,	%g1
	fxnor	%f30,	%f0,	%f24
	st	%f5,	[%l7 + 0x68]
	fpadd16	%f10,	%f20,	%f22
	std	%f8,	[%l7 + 0x50]
	edge32l	%i5,	%i7,	%i3
	movleu	%icc,	%i2,	%o7
	fnot1	%f20,	%f4
	fzero	%f22
	save %l5, 0x0090, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i4,	%g5
	movrne	%o2,	%l4,	%l2
	movcs	%xcc,	%g2,	%l0
	fzero	%f28
	movcc	%xcc,	%o5,	%l1
	movrgez	%g7,	0x050,	%g3
	movneg	%xcc,	%o1,	%l6
	movvc	%xcc,	%o6,	%g4
	movcs	%icc,	%o4,	%g6
	subc	%l3,	%i0,	%i6
	sdiv	%o0,	0x0117,	%i1
	fpackfix	%f2,	%f16
	edge8	%g1,	%i5,	%i7
	movvc	%icc,	%i3,	%o7
	movg	%xcc,	%i2,	%l5
	edge32n	%i4,	%g5,	%o2
	fnegd	%f20,	%f18
	movne	%xcc,	%o3,	%l4
	fcmple32	%f12,	%f16,	%l2
	srax	%g2,	0x1A,	%l0
	array8	%o5,	%g7,	%l1
	fmovdvs	%icc,	%f26,	%f31
	sra	%g3,	%o1,	%o6
	edge32ln	%l6,	%g4,	%o4
	movrne	%l3,	%g6,	%i6
	movrgez	%i0,	0x194,	%o0
	edge16n	%g1,	%i5,	%i1
	edge8n	%i7,	%o7,	%i3
	fmovdcs	%icc,	%f13,	%f31
	movvs	%xcc,	%l5,	%i2
	array32	%i4,	%g5,	%o2
	movpos	%xcc,	%l4,	%o3
	subcc	%l2,	0x0D51,	%g2
	movne	%xcc,	%o5,	%l0
	movcs	%xcc,	%l1,	%g7
	movn	%xcc,	%o1,	%o6
	sir	0x0986
	movrlez	%g3,	%l6,	%o4
	std	%f4,	[%l7 + 0x08]
	sir	0x0256
	move	%icc,	%l3,	%g4
	movne	%icc,	%g6,	%i6
	stb	%o0,	[%l7 + 0x39]
	edge32	%g1,	%i5,	%i0
	edge8ln	%i1,	%i7,	%o7
	movvc	%icc,	%i3,	%l5
	fcmps	%fcc1,	%f6,	%f22
	movcc	%icc,	%i4,	%i2
	alignaddrl	%g5,	%l4,	%o2
	mulscc	%l2,	0x12EB,	%o3
	edge16	%g2,	%o5,	%l0
	movneg	%xcc,	%l1,	%o1
	fmovd	%f24,	%f30
	edge16l	%g7,	%g3,	%o6
	array16	%l6,	%l3,	%o4
	edge16	%g4,	%i6,	%g6
	lduh	[%l7 + 0x12],	%o0
	stx	%g1,	[%l7 + 0x50]
	st	%f15,	[%l7 + 0x0C]
	movre	%i5,	0x01C,	%i0
	sllx	%i1,	%i7,	%o7
	sll	%l5,	%i3,	%i2
	sra	%g5,	%i4,	%l4
	sll	%l2,	0x13,	%o2
	sethi	0x1CFD,	%g2
	movre	%o5,	%o3,	%l0
	edge8n	%l1,	%g7,	%o1
	lduw	[%l7 + 0x44],	%o6
	edge8ln	%g3,	%l6,	%o4
	stw	%g4,	[%l7 + 0x10]
	movrgez	%i6,	0x2EC,	%l3
	fors	%f26,	%f12,	%f10
	xnor	%o0,	%g6,	%g1
	std	%f10,	[%l7 + 0x48]
	fmovrsgez	%i5,	%f13,	%f7
	edge8ln	%i0,	%i1,	%o7
	fand	%f16,	%f2,	%f6
	array32	%l5,	%i3,	%i2
	udiv	%g5,	0x100D,	%i4
	sra	%i7,	%l4,	%o2
	fnot2	%f2,	%f18
	and	%l2,	%o5,	%o3
	andncc	%l0,	%l1,	%g2
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	movrlez	%g3,	0x125,	%l6
	move	%xcc,	%o4,	%g4
	save %l3, 0x1596, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f21,	%f3
	sth	%i6,	[%l7 + 0x1A]
	movpos	%icc,	%g6,	%g1
	edge8ln	%i0,	%i5,	%i1
	edge32n	%o7,	%l5,	%i3
	edge16l	%g5,	%i4,	%i7
	fmuld8ulx16	%f18,	%f6,	%f24
	fmovrslz	%i2,	%f7,	%f16
	movle	%xcc,	%o2,	%l2
	edge8n	%o5,	%o3,	%l0
	movle	%icc,	%l4,	%l1
	or	%g2,	%g7,	%o1
	movrgz	%g3,	0x10F,	%o6
	sethi	0x012E,	%o4
	movvs	%xcc,	%g4,	%l3
	edge16n	%l6,	%o0,	%i6
	fpadd32	%f10,	%f22,	%f26
	movl	%xcc,	%g6,	%g1
	fmovdcs	%xcc,	%f0,	%f5
	xorcc	%i0,	0x028D,	%i5
	fzero	%f18
	sllx	%o7,	%i1,	%i3
	sdiv	%l5,	0x03AE,	%i4
	add	%g5,	0x1601,	%i2
	fornot2	%f24,	%f6,	%f26
	fmovsl	%icc,	%f26,	%f12
	srax	%o2,	0x0D,	%i7
	fmovrdgz	%l2,	%f2,	%f28
	sdivx	%o3,	0x0F3C,	%o5
	array16	%l4,	%l0,	%l1
	stb	%g7,	[%l7 + 0x11]
	stw	%g2,	[%l7 + 0x18]
	andncc	%g3,	%o6,	%o1
	srl	%g4,	%l3,	%l6
	orn	%o0,	0x0FE5,	%i6
	xor	%o4,	0x0ACE,	%g6
	srlx	%i0,	0x19,	%i5
	movleu	%xcc,	%g1,	%i1
	ldub	[%l7 + 0x66],	%i3
	fmovse	%icc,	%f30,	%f14
	srl	%o7,	0x13,	%i4
	subc	%g5,	0x1286,	%i2
	andncc	%l5,	%i7,	%o2
	movcs	%xcc,	%o3,	%l2
	sub	%l4,	0x03A3,	%o5
	fnegd	%f12,	%f4
	mulx	%l1,	%l0,	%g7
	fcmpne32	%f4,	%f30,	%g2
	umulcc	%g3,	%o6,	%o1
	smul	%g4,	%l6,	%l3
	orcc	%i6,	%o0,	%o4
	movcc	%icc,	%i0,	%g6
	ldsh	[%l7 + 0x52],	%g1
	subccc	%i5,	%i1,	%o7
	subccc	%i4,	%i3,	%i2
	srlx	%g5,	%l5,	%i7
	movpos	%xcc,	%o2,	%o3
	fnot2	%f8,	%f24
	fmovdn	%xcc,	%f8,	%f4
	sll	%l4,	%o5,	%l2
	popc	0x0765,	%l0
	nop
	set	0x0C, %g1
	ldsh	[%l7 + %g1],	%l1
	sdivx	%g7,	0x1181,	%g3
	lduw	[%l7 + 0x64],	%o6
	sra	%o1,	0x16,	%g4
	save %l6, 0x183C, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i6,	%g2,	%o0
	movn	%icc,	%i0,	%o4
	or	%g6,	0x16F1,	%i5
	movgu	%icc,	%i1,	%g1
	edge32ln	%o7,	%i4,	%i3
	ldsh	[%l7 + 0x50],	%i2
	fmovdvs	%xcc,	%f15,	%f9
	addcc	%l5,	%g5,	%i7
	fpadd16s	%f20,	%f21,	%f29
	udivx	%o2,	0x0A9C,	%l4
	movn	%icc,	%o5,	%o3
	movrlez	%l0,	0x1B9,	%l2
	fnot2s	%f15,	%f31
	addcc	%l1,	0x034B,	%g3
	fmovdneg	%xcc,	%f28,	%f7
	fpsub16	%f14,	%f18,	%f20
	mova	%xcc,	%o6,	%o1
	lduw	[%l7 + 0x64],	%g7
	or	%g4,	%l3,	%l6
	fpackfix	%f4,	%f25
	lduh	[%l7 + 0x7A],	%g2
	andn	%i6,	%o0,	%i0
	movne	%xcc,	%o4,	%i5
	movleu	%icc,	%i1,	%g6
	movpos	%icc,	%g1,	%o7
	smul	%i4,	%i3,	%i2
	stx	%g5,	[%l7 + 0x50]
	sth	%i7,	[%l7 + 0x18]
	edge32l	%l5,	%l4,	%o5
	std	%f14,	[%l7 + 0x58]
	sethi	0x1BC6,	%o2
	fcmpne32	%f2,	%f18,	%o3
	andncc	%l0,	%l2,	%l1
	add	%o6,	%o1,	%g3
	xnorcc	%g7,	0x05E4,	%l3
	movvc	%icc,	%g4,	%g2
	std	%f22,	[%l7 + 0x60]
	fpadd16s	%f19,	%f29,	%f13
	movneg	%icc,	%i6,	%l6
	movpos	%xcc,	%o0,	%i0
	addccc	%i5,	0x17AF,	%o4
	fornot1	%f24,	%f0,	%f2
	fmovse	%xcc,	%f9,	%f8
	fmovdcs	%icc,	%f16,	%f30
	sdivx	%g6,	0x06D1,	%i1
	fmovrsgez	%o7,	%f8,	%f31
	ldsh	[%l7 + 0x0A],	%g1
	edge8n	%i4,	%i3,	%g5
	umul	%i2,	%i7,	%l5
	fmovrdlez	%o5,	%f10,	%f20
	mova	%icc,	%o2,	%l4
	subccc	%l0,	0x0C29,	%o3
	movrgz	%l1,	%o6,	%l2
	restore %o1, 0x19B6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g7,	[%l7 + 0x6C]
	edge32	%g4,	%l3,	%g2
	sir	0x0B1F
	ldub	[%l7 + 0x74],	%l6
	movrlz	%i6,	%o0,	%i5
	edge16n	%o4,	%g6,	%i1
	movne	%xcc,	%o7,	%i0
	lduw	[%l7 + 0x58],	%i4
	sdivcc	%g1,	0x1215,	%i3
	movrne	%i2,	0x245,	%g5
	sdiv	%l5,	0x188A,	%i7
	sth	%o5,	[%l7 + 0x10]
	fnor	%f12,	%f12,	%f18
	ldx	[%l7 + 0x70],	%l4
	movl	%icc,	%l0,	%o3
	andncc	%o2,	%o6,	%l1
	nop
	set	0x56, %i0
	sth	%o1,	[%l7 + %i0]
	mulx	%l2,	0x1961,	%g3
	ldx	[%l7 + 0x38],	%g4
	smul	%g7,	0x0581,	%g2
	sdiv	%l6,	0x031A,	%l3
	fnor	%f6,	%f18,	%f8
	srax	%i6,	%o0,	%i5
	edge32ln	%g6,	%o4,	%o7
	and	%i1,	0x1402,	%i4
	movrne	%i0,	0x097,	%g1
	edge8l	%i3,	%i2,	%l5
	fmovrslz	%i7,	%f3,	%f15
	movgu	%xcc,	%o5,	%l4
	xorcc	%g5,	0x12B6,	%o3
	srlx	%l0,	0x1A,	%o2
	movrgz	%o6,	%l1,	%o1
	sir	0x1578
	movcc	%xcc,	%g3,	%l2
	sdivx	%g7,	0x1084,	%g4
	ldsh	[%l7 + 0x48],	%g2
	edge8n	%l3,	%i6,	%l6
	and	%i5,	0x1E0D,	%g6
	xor	%o4,	0x19BB,	%o0
	addccc	%i1,	0x03B0,	%o7
	ldub	[%l7 + 0x3C],	%i4
	fmovs	%f19,	%f25
	subc	%i0,	%i3,	%i2
	orcc	%l5,	%i7,	%o5
	lduw	[%l7 + 0x30],	%g1
	fmovd	%f8,	%f8
	sth	%l4,	[%l7 + 0x66]
	addc	%g5,	0x0B5A,	%o3
	fexpand	%f5,	%f10
	ld	[%l7 + 0x58],	%f21
	mulx	%o2,	%l0,	%o6
	movrne	%l1,	%o1,	%l2
	stx	%g3,	[%l7 + 0x30]
	andncc	%g7,	%g4,	%g2
	sth	%i6,	[%l7 + 0x22]
	movrgez	%l3,	0x286,	%i5
	fmul8x16au	%f9,	%f27,	%f16
	movrne	%l6,	0x0FE,	%g6
	lduw	[%l7 + 0x10],	%o0
	fcmple32	%f4,	%f6,	%i1
	edge8n	%o4,	%i4,	%i0
	fmul8x16au	%f17,	%f18,	%f12
	fmovrdgz	%i3,	%f28,	%f0
	movcs	%icc,	%o7,	%i2
	movrne	%i7,	0x169,	%l5
	sllx	%g1,	%l4,	%g5
	movne	%xcc,	%o5,	%o2
	xnorcc	%l0,	%o6,	%o3
	subccc	%o1,	0x1960,	%l1
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	array8	%g4,	%g2,	%i6
	edge8l	%i5,	%l6,	%g6
	std	%f30,	[%l7 + 0x60]
	edge16ln	%l3,	%o0,	%i1
	srlx	%i4,	0x18,	%i0
	fmul8ulx16	%f20,	%f12,	%f12
	movgu	%xcc,	%o4,	%o7
	movl	%icc,	%i3,	%i7
	edge16	%i2,	%g1,	%l4
	fcmped	%fcc3,	%f10,	%f24
	edge16n	%l5,	%o5,	%o2
	orcc	%l0,	0x1B2C,	%o6
	movrne	%o3,	0x2A8,	%o1
	mova	%xcc,	%l1,	%g5
	ld	[%l7 + 0x4C],	%f26
	fmovse	%xcc,	%f14,	%f28
	umulcc	%l2,	0x0EB5,	%g7
	ld	[%l7 + 0x18],	%f8
	umul	%g4,	0x0831,	%g2
	fmul8x16al	%f6,	%f26,	%f22
	subccc	%i6,	0x1308,	%i5
	umul	%l6,	%g3,	%l3
	sdiv	%o0,	0x09A7,	%g6
	addccc	%i1,	%i0,	%o4
	move	%xcc,	%o7,	%i3
	xnor	%i4,	0x0B04,	%i2
	add	%g1,	0x11C4,	%i7
	edge8	%l5,	%o5,	%o2
	fcmpgt16	%f24,	%f22,	%l4
	fnegd	%f6,	%f4
	movrlez	%o6,	%o3,	%l0
	edge32ln	%o1,	%l1,	%l2
	popc	%g5,	%g7
	edge16n	%g4,	%g2,	%i6
	array8	%i5,	%g3,	%l3
	fpack32	%f18,	%f6,	%f10
	fmovdne	%xcc,	%f29,	%f7
	ldx	[%l7 + 0x50],	%o0
	alignaddr	%l6,	%g6,	%i1
	edge8l	%o4,	%i0,	%o7
	ldd	[%l7 + 0x60],	%i4
	fabsd	%f10,	%f4
	fmovdleu	%xcc,	%f9,	%f24
	subccc	%i3,	0x0608,	%i2
	ldsw	[%l7 + 0x18],	%i7
	fcmped	%fcc2,	%f18,	%f10
	andcc	%l5,	%o5,	%g1
	fmovsge	%icc,	%f0,	%f18
	movn	%xcc,	%o2,	%o6
	udiv	%l4,	0x12A9,	%o3
	movpos	%icc,	%l0,	%l1
	sllx	%l2,	%o1,	%g5
	mulscc	%g7,	%g2,	%i6
	ldd	[%l7 + 0x28],	%f30
	movre	%g4,	%i5,	%l3
	ldub	[%l7 + 0x2F],	%o0
	sth	%l6,	[%l7 + 0x30]
	andcc	%g3,	0x12B8,	%i1
	ldsb	[%l7 + 0x24],	%o4
	sir	0x0CF9
	xor	%g6,	%o7,	%i4
	fpsub32	%f20,	%f30,	%f20
	edge16ln	%i3,	%i2,	%i7
	fzeros	%f20
	and	%i0,	%o5,	%l5
	udiv	%o2,	0x07B9,	%o6
	fmovsa	%xcc,	%f14,	%f0
	fxors	%f9,	%f7,	%f7
	st	%f7,	[%l7 + 0x10]
	udivcc	%l4,	0x0BAD,	%o3
	fmovda	%xcc,	%f28,	%f2
	edge8n	%l0,	%l1,	%l2
	andn	%o1,	%g1,	%g7
	ldx	[%l7 + 0x18],	%g5
	edge16ln	%i6,	%g2,	%g4
	addc	%l3,	%i5,	%l6
	edge8	%o0,	%g3,	%i1
	subccc	%g6,	%o4,	%o7
	fmovdneg	%icc,	%f28,	%f29
	lduh	[%l7 + 0x30],	%i3
	fnor	%f2,	%f28,	%f30
	movcs	%xcc,	%i4,	%i2
	fmovrdlz	%i7,	%f20,	%f26
	edge16n	%i0,	%l5,	%o5
	ldsh	[%l7 + 0x66],	%o2
	edge32l	%l4,	%o6,	%l0
	movrlz	%l1,	%l2,	%o1
	fornot1s	%f4,	%f16,	%f31
	fpackfix	%f2,	%f12
	fmul8sux16	%f26,	%f14,	%f0
	edge16	%o3,	%g7,	%g1
	andcc	%g5,	%i6,	%g4
	ld	[%l7 + 0x20],	%f7
	subcc	%g2,	0x1929,	%i5
	sll	%l6,	%l3,	%g3
	edge16	%i1,	%o0,	%g6
	ldub	[%l7 + 0x42],	%o4
	fmovdcc	%icc,	%f31,	%f4
	sllx	%i3,	%i4,	%i2
	sub	%i7,	%o7,	%i0
	movvs	%icc,	%o5,	%o2
	sdivcc	%l5,	0x0777,	%o6
	and	%l0,	%l1,	%l4
	srlx	%l2,	%o1,	%g7
	stx	%o3,	[%l7 + 0x30]
	stw	%g1,	[%l7 + 0x24]
	or	%g5,	0x14AC,	%i6
	addcc	%g2,	0x1156,	%g4
	movg	%icc,	%l6,	%i5
	stb	%l3,	[%l7 + 0x25]
	stx	%g3,	[%l7 + 0x38]
	fpsub16	%f14,	%f10,	%f6
	fornot1s	%f8,	%f26,	%f15
	array32	%i1,	%g6,	%o4
	stw	%o0,	[%l7 + 0x5C]
	movpos	%xcc,	%i4,	%i3
	nop
	set	0x7C, %l6
	ldsw	[%l7 + %l6],	%i7
	ldsh	[%l7 + 0x76],	%i2
	st	%f6,	[%l7 + 0x6C]
	srlx	%i0,	0x0A,	%o7
	udivx	%o2,	0x19CA,	%l5
	fmovsge	%xcc,	%f27,	%f4
	edge8	%o6,	%o5,	%l1
	lduh	[%l7 + 0x6C],	%l4
	mulx	%l2,	%l0,	%o1
	fmovspos	%xcc,	%f30,	%f28
	alignaddrl	%g7,	%o3,	%g5
	save %i6, %g1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%g4,	%i5
	movge	%xcc,	%l6,	%g3
	movvc	%icc,	%i1,	%g6
	sth	%o4,	[%l7 + 0x20]
	fmovd	%f22,	%f22
	fsrc1	%f4,	%f18
	movn	%icc,	%l3,	%o0
	andn	%i3,	0x12A1,	%i7
	subc	%i2,	0x0267,	%i4
	sra	%o7,	0x0D,	%i0
	edge32l	%o2,	%l5,	%o6
	ldsw	[%l7 + 0x2C],	%l1
	or	%l4,	%l2,	%o5
	fmovdn	%icc,	%f19,	%f9
	popc	%l0,	%g7
	edge8l	%o1,	%o3,	%g5
	fmovdvc	%icc,	%f28,	%f0
	movrlz	%i6,	%g1,	%g2
	movvc	%icc,	%i5,	%g4
	movl	%icc,	%g3,	%l6
	ldsh	[%l7 + 0x64],	%i1
	fandnot1	%f22,	%f18,	%f28
	movrlez	%o4,	%l3,	%o0
	fnands	%f12,	%f9,	%f31
	movcc	%icc,	%i3,	%g6
	sth	%i7,	[%l7 + 0x3A]
	movvc	%xcc,	%i2,	%o7
	fmovrslez	%i0,	%f7,	%f2
	movneg	%icc,	%i4,	%l5
	ldd	[%l7 + 0x48],	%o6
	andn	%l1,	0x10BA,	%o2
	srl	%l4,	0x18,	%o5
	udivx	%l2,	0x0197,	%g7
	addcc	%l0,	0x16D7,	%o1
	sdiv	%o3,	0x1B62,	%i6
	addcc	%g5,	%g2,	%i5
	xnorcc	%g1,	%g4,	%g3
	addcc	%i1,	0x15FB,	%l6
	and	%l3,	0x1EAA,	%o4
	ld	[%l7 + 0x20],	%f21
	sub	%o0,	0x0F79,	%g6
	ldx	[%l7 + 0x58],	%i3
	movrgez	%i2,	0x0DB,	%i7
	save %o7, %i4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o6,	%i0,	%l1
	fmovsvs	%xcc,	%f1,	%f13
	sdivx	%o2,	0x0AB7,	%l4
	orcc	%o5,	0x0E35,	%l2
	fxors	%f0,	%f8,	%f24
	andncc	%g7,	%o1,	%o3
	fnor	%f24,	%f10,	%f10
	subcc	%i6,	%g5,	%l0
	stw	%g2,	[%l7 + 0x70]
	movcc	%xcc,	%g1,	%g4
	mulscc	%i5,	%g3,	%l6
	ldsw	[%l7 + 0x1C],	%i1
	edge16	%o4,	%l3,	%g6
	fpsub32	%f8,	%f22,	%f0
	umul	%o0,	%i3,	%i7
	orn	%o7,	%i2,	%l5
	mova	%xcc,	%i4,	%i0
	srl	%l1,	0x16,	%o2
	smul	%l4,	%o5,	%o6
	fzero	%f0
	srax	%l2,	%g7,	%o1
	fandnot1s	%f12,	%f14,	%f0
	fpack16	%f30,	%f3
	orn	%i6,	0x0C9C,	%g5
	movrlz	%o3,	%l0,	%g2
	fcmple16	%f14,	%f18,	%g4
	fexpand	%f27,	%f18
	stw	%g1,	[%l7 + 0x7C]
	edge8	%g3,	%l6,	%i1
	movvc	%icc,	%i5,	%l3
	subcc	%g6,	%o0,	%o4
	fmovdleu	%icc,	%f1,	%f25
	popc	0x0C8B,	%i3
	fxnors	%f31,	%f28,	%f0
	umulcc	%o7,	0x0D9C,	%i7
	sir	0x1C09
	stx	%i2,	[%l7 + 0x78]
	st	%f25,	[%l7 + 0x64]
	addc	%l5,	0x0D26,	%i4
	fcmpgt16	%f18,	%f12,	%l1
	fnot2	%f18,	%f10
	lduw	[%l7 + 0x54],	%i0
	stw	%l4,	[%l7 + 0x6C]
	movle	%xcc,	%o2,	%o6
	save %o5, 0x119B, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o1,	0x1A,	%l2
	sdivcc	%g5,	0x1C26,	%o3
	array16	%i6,	%g2,	%l0
	sdiv	%g4,	0x0F78,	%g1
	fandnot1s	%f12,	%f9,	%f24
	orcc	%g3,	%i1,	%l6
	movcc	%icc,	%i5,	%l3
	movcc	%xcc,	%o0,	%o4
	subccc	%i3,	%o7,	%i7
	movvc	%icc,	%i2,	%g6
	or	%l5,	0x138A,	%i4
	edge16ln	%l1,	%i0,	%l4
	andncc	%o6,	%o2,	%o5
	movneg	%xcc,	%o1,	%l2
	ldub	[%l7 + 0x78],	%g5
	st	%f6,	[%l7 + 0x50]
	fmovsn	%xcc,	%f14,	%f2
	stw	%o3,	[%l7 + 0x08]
	sdivx	%g7,	0x1A5B,	%i6
	ldd	[%l7 + 0x70],	%l0
	edge16	%g4,	%g2,	%g1
	fmovdg	%icc,	%f10,	%f24
	udiv	%i1,	0x1FB0,	%g3
	fmovsn	%icc,	%f24,	%f14
	udivx	%i5,	0x0C6E,	%l6
	addcc	%l3,	0x1532,	%o4
	fabss	%f30,	%f16
	andcc	%i3,	%o0,	%i7
	sra	%i2,	%o7,	%g6
	edge16l	%l5,	%l1,	%i4
	movneg	%xcc,	%l4,	%o6
	nop
	set	0x49, %g3
	stb	%i0,	[%l7 + %g3]
	sll	%o2,	0x03,	%o5
	add	%l2,	0x1B74,	%g5
	andcc	%o3,	0x1BFD,	%g7
	andn	%o1,	%i6,	%g4
	sra	%g2,	0x16,	%g1
	fmuld8sux16	%f24,	%f20,	%f28
	addc	%i1,	0x0861,	%l0
	movg	%xcc,	%g3,	%i5
	orcc	%l3,	0x0657,	%l6
	fones	%f3
	srax	%o4,	0x10,	%o0
	smulcc	%i3,	%i7,	%i2
	fmovdle	%xcc,	%f18,	%f10
	stw	%o7,	[%l7 + 0x20]
	srax	%g6,	0x1E,	%l1
	movle	%icc,	%i4,	%l5
	movneg	%icc,	%l4,	%o6
	stb	%i0,	[%l7 + 0x38]
	array16	%o2,	%l2,	%g5
	andncc	%o3,	%o5,	%g7
	st	%f25,	[%l7 + 0x50]
	fpsub32	%f12,	%f18,	%f28
	movvs	%icc,	%i6,	%g4
	lduw	[%l7 + 0x2C],	%o1
	movgu	%icc,	%g1,	%i1
	edge8ln	%l0,	%g3,	%i5
	movrlez	%g2,	%l6,	%l3
	fnot2	%f24,	%f12
	fxors	%f10,	%f4,	%f3
	edge16ln	%o0,	%i3,	%i7
	fzeros	%f21
	ld	[%l7 + 0x34],	%f27
	sth	%i2,	[%l7 + 0x14]
	fmul8ulx16	%f16,	%f22,	%f22
	fnot1s	%f7,	%f6
	movne	%xcc,	%o7,	%o4
	andn	%l1,	%i4,	%g6
	std	%f0,	[%l7 + 0x28]
	fcmpes	%fcc2,	%f5,	%f29
	movrne	%l4,	0x1DF,	%l5
	andcc	%o6,	0x021C,	%o2
	movvs	%xcc,	%i0,	%g5
	fmuld8ulx16	%f28,	%f6,	%f30
	edge16n	%l2,	%o5,	%g7
	orn	%o3,	%i6,	%g4
	movrlez	%o1,	%g1,	%l0
	edge8	%i1,	%g3,	%i5
	fmovde	%icc,	%f27,	%f22
	movcs	%icc,	%g2,	%l6
	sth	%l3,	[%l7 + 0x0A]
	std	%f0,	[%l7 + 0x78]
	ldd	[%l7 + 0x50],	%f28
	smul	%o0,	%i3,	%i7
	ldsw	[%l7 + 0x7C],	%i2
	std	%f20,	[%l7 + 0x68]
	edge16l	%o7,	%l1,	%i4
	fsrc1s	%f7,	%f18
	fmovsne	%icc,	%f5,	%f21
	fmovsge	%xcc,	%f2,	%f11
	fnot2s	%f23,	%f31
	sethi	0x12DA,	%g6
	fsrc1	%f20,	%f16
	orncc	%o4,	0x06E7,	%l4
	lduh	[%l7 + 0x0E],	%o6
	movcc	%xcc,	%l5,	%i0
	save %g5, %l2, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g7,	0x16F6,	%o5
	sra	%o3,	0x13,	%i6
	addccc	%o1,	%g1,	%l0
	xnorcc	%i1,	0x16B6,	%g4
	sra	%g3,	0x06,	%i5
	ldsw	[%l7 + 0x74],	%l6
	movl	%icc,	%l3,	%o0
	lduh	[%l7 + 0x48],	%g2
	mulx	%i3,	0x1DB1,	%i7
	sethi	0x12B9,	%o7
	faligndata	%f22,	%f20,	%f0
	stx	%i2,	[%l7 + 0x08]
	edge8n	%i4,	%l1,	%g6
	fmovsgu	%xcc,	%f10,	%f28
	movgu	%xcc,	%l4,	%o6
	mulscc	%o4,	0x1B24,	%i0
	nop
	set	0x27, %l3
	stb	%g5,	[%l7 + %l3]
	movvs	%icc,	%l5,	%o2
	lduh	[%l7 + 0x4E],	%l2
	orncc	%o5,	%g7,	%o3
	movrne	%i6,	%g1,	%o1
	fmul8ulx16	%f28,	%f0,	%f4
	ldd	[%l7 + 0x28],	%f6
	udiv	%l0,	0x140D,	%i1
	ld	[%l7 + 0x68],	%f2
	andncc	%g3,	%i5,	%l6
	addc	%g4,	%o0,	%g2
	move	%xcc,	%i3,	%i7
	smul	%l3,	%i2,	%o7
	fmovdne	%xcc,	%f28,	%f27
	nop
	set	0x3C, %o7
	stb	%i4,	[%l7 + %o7]
	ldx	[%l7 + 0x48],	%l1
	movn	%xcc,	%g6,	%l4
	sdiv	%o4,	0x1113,	%i0
	edge8	%o6,	%g5,	%o2
	movcc	%icc,	%l5,	%o5
	mulx	%g7,	%l2,	%i6
	std	%f24,	[%l7 + 0x70]
	udivx	%o3,	0x187F,	%g1
	movle	%icc,	%o1,	%l0
	movrlz	%i1,	0x20A,	%i5
	fmovs	%f28,	%f30
	save %g3, %l6, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o0,	%i3
	or	%g2,	0x16B3,	%i7
	udiv	%i2,	0x19F1,	%o7
	edge32	%i4,	%l3,	%g6
	fmovspos	%xcc,	%f24,	%f24
	ldd	[%l7 + 0x78],	%f0
	movle	%icc,	%l1,	%l4
	umulcc	%i0,	%o4,	%g5
	fmovrdne	%o2,	%f14,	%f10
	fmovdcc	%xcc,	%f3,	%f28
	fandnot1	%f4,	%f8,	%f26
	fcmpgt32	%f6,	%f20,	%o6
	mulscc	%l5,	%o5,	%l2
	edge32	%i6,	%g7,	%g1
	sllx	%o1,	%o3,	%i1
	movle	%icc,	%l0,	%g3
	movrgez	%i5,	%g4,	%l6
	udivcc	%i3,	0x178B,	%g2
	subccc	%i7,	%o0,	%o7
	xnorcc	%i4,	%i2,	%g6
	ldub	[%l7 + 0x28],	%l3
	movrgez	%l1,	%l4,	%o4
	sir	0x18AA
	movne	%xcc,	%i0,	%g5
	addcc	%o6,	0x00D7,	%l5
	orcc	%o2,	0x18C2,	%l2
	edge16l	%i6,	%g7,	%g1
	alignaddrl	%o5,	%o1,	%i1
	edge16l	%o3,	%g3,	%i5
	movgu	%xcc,	%l0,	%l6
	fnegs	%f25,	%f8
	fmuld8ulx16	%f22,	%f20,	%f4
	addcc	%g4,	%g2,	%i3
	movge	%icc,	%o0,	%o7
	orncc	%i7,	0x14EF,	%i4
	fmovrslez	%g6,	%f15,	%f23
	movleu	%xcc,	%i2,	%l1
	udiv	%l3,	0x0363,	%l4
	movcs	%xcc,	%i0,	%o4
	sth	%o6,	[%l7 + 0x6A]
	smulcc	%g5,	0x161B,	%o2
	alignaddr	%l5,	%l2,	%g7
	fmovscc	%xcc,	%f11,	%f5
	xor	%g1,	%i6,	%o1
	movrgz	%i1,	%o3,	%g3
	orcc	%i5,	%o5,	%l6
	xnorcc	%l0,	%g2,	%i3
	lduw	[%l7 + 0x58],	%g4
	sub	%o0,	0x08DB,	%o7
	movrlez	%i7,	%g6,	%i2
	alignaddr	%i4,	%l3,	%l4
	edge8ln	%i0,	%o4,	%o6
	movrne	%l1,	%g5,	%o2
	edge8n	%l5,	%g7,	%l2
	ldx	[%l7 + 0x50],	%i6
	alignaddrl	%o1,	%i1,	%g1
	sir	0x17E6
	andcc	%o3,	%g3,	%o5
	movge	%icc,	%l6,	%i5
	andncc	%l0,	%g2,	%g4
	fmovdgu	%xcc,	%f11,	%f10
	sdivcc	%o0,	0x0176,	%i3
	movvc	%xcc,	%o7,	%i7
	edge32l	%i2,	%i4,	%l3
	sub	%g6,	0x1B04,	%i0
	srlx	%o4,	0x1F,	%l4
	or	%l1,	%o6,	%o2
	bshuffle	%f22,	%f8,	%f0
	add	%g5,	0x1B7A,	%g7
	fone	%f20
	edge8ln	%l2,	%l5,	%i6
	smulcc	%o1,	%g1,	%o3
	movpos	%xcc,	%g3,	%i1
	addcc	%l6,	0x00BF,	%i5
	addcc	%l0,	0x08C5,	%g2
	movle	%xcc,	%g4,	%o5
	udivx	%i3,	0x0E77,	%o0
	fmovrdgz	%o7,	%f10,	%f4
	fzeros	%f25
	udivx	%i7,	0x1859,	%i2
	fmovdge	%icc,	%f6,	%f20
	smulcc	%i4,	0x082E,	%l3
	umul	%g6,	0x173D,	%i0
	fxnor	%f22,	%f18,	%f0
	orncc	%l4,	%o4,	%l1
	stw	%o6,	[%l7 + 0x08]
	movvc	%icc,	%o2,	%g5
	ldd	[%l7 + 0x40],	%g6
	orn	%l5,	%i6,	%o1
	fmovdgu	%icc,	%f24,	%f7
	fmul8x16	%f29,	%f22,	%f30
	movrlez	%g1,	0x07A,	%l2
	add	%o3,	%i1,	%l6
	subc	%g3,	%l0,	%g2
	std	%f28,	[%l7 + 0x30]
	movl	%xcc,	%i5,	%g4
	mova	%icc,	%i3,	%o5
	stx	%o7,	[%l7 + 0x48]
	sth	%i7,	[%l7 + 0x7E]
	umulcc	%o0,	%i4,	%i2
	st	%f22,	[%l7 + 0x08]
	ldsh	[%l7 + 0x78],	%g6
	xor	%l3,	0x0808,	%l4
	fmovspos	%icc,	%f16,	%f9
	addccc	%o4,	%i0,	%l1
	fmovrsne	%o2,	%f25,	%f29
	fmovrdgez	%g5,	%f18,	%f10
	fmovrdlez	%g7,	%f2,	%f2
	array8	%l5,	%o6,	%i6
	or	%o1,	0x0221,	%l2
	edge32n	%o3,	%i1,	%g1
	stx	%l6,	[%l7 + 0x08]
	or	%l0,	0x0FEE,	%g3
	fmovda	%xcc,	%f6,	%f9
	sethi	0x061E,	%g2
	fmovrdgz	%g4,	%f4,	%f24
	edge32ln	%i5,	%i3,	%o5
	fpadd16s	%f14,	%f23,	%f14
	movpos	%icc,	%i7,	%o0
	movl	%icc,	%o7,	%i4
	fmovdn	%icc,	%f26,	%f5
	movl	%xcc,	%g6,	%l3
	fcmpgt16	%f20,	%f30,	%l4
	addc	%i2,	0x1BF3,	%o4
	movvs	%icc,	%l1,	%i0
	array16	%g5,	%o2,	%l5
	movrne	%g7,	%i6,	%o6
	addc	%o1,	0x1369,	%l2
	andncc	%i1,	%o3,	%g1
	umulcc	%l6,	%l0,	%g3
	and	%g4,	%i5,	%i3
	movge	%icc,	%o5,	%g2
	sth	%o0,	[%l7 + 0x20]
	fnors	%f19,	%f30,	%f30
	fnegd	%f28,	%f22
	edge32ln	%o7,	%i7,	%i4
	fcmpne16	%f22,	%f2,	%l3
	or	%l4,	0x0CEB,	%g6
	fsrc2s	%f20,	%f29
	xnorcc	%o4,	%i2,	%i0
	ldsh	[%l7 + 0x14],	%g5
	movneg	%xcc,	%o2,	%l1
	and	%g7,	%l5,	%i6
	fnand	%f2,	%f0,	%f18
	ldd	[%l7 + 0x18],	%o0
	fcmped	%fcc2,	%f24,	%f20
	fmuld8sux16	%f18,	%f25,	%f14
	movvc	%xcc,	%o6,	%l2
	array32	%i1,	%o3,	%l6
	movrne	%l0,	%g3,	%g1
	edge32	%g4,	%i5,	%o5
	ldd	[%l7 + 0x18],	%f14
	st	%f4,	[%l7 + 0x14]
	movg	%xcc,	%i3,	%g2
	or	%o7,	0x136F,	%o0
	edge16	%i4,	%i7,	%l3
	sth	%l4,	[%l7 + 0x78]
	srlx	%g6,	0x11,	%i2
	xorcc	%o4,	%i0,	%o2
	st	%f10,	[%l7 + 0x34]
	udivcc	%g5,	0x1107,	%l1
	fcmped	%fcc0,	%f4,	%f28
	edge32	%l5,	%i6,	%o1
	edge32	%g7,	%l2,	%i1
	movcs	%xcc,	%o3,	%o6
	fpsub32	%f12,	%f16,	%f28
	movge	%icc,	%l0,	%l6
	subcc	%g1,	0x1F4A,	%g4
	smul	%g3,	0x0B79,	%i5
	sth	%i3,	[%l7 + 0x34]
	fmovsneg	%icc,	%f28,	%f29
	fcmpeq16	%f6,	%f10,	%g2
	fcmpgt32	%f2,	%f14,	%o5
	edge16n	%o0,	%i4,	%i7
	edge8l	%o7,	%l3,	%g6
	sethi	0x0CAD,	%i2
	fmovs	%f19,	%f0
	st	%f29,	[%l7 + 0x38]
	add	%o4,	0x060F,	%i0
	fmovrslz	%l4,	%f17,	%f26
	ldsw	[%l7 + 0x7C],	%g5
	fmovsvs	%xcc,	%f22,	%f5
	ldsb	[%l7 + 0x5E],	%o2
	popc	%l5,	%l1
	sll	%i6,	%o1,	%g7
	edge32ln	%i1,	%o3,	%o6
	fmovsneg	%icc,	%f26,	%f16
	fmovrde	%l0,	%f12,	%f16
	orcc	%l6,	%l2,	%g4
	sdivx	%g1,	0x098C,	%i5
	smulcc	%g3,	%i3,	%g2
	fcmpd	%fcc0,	%f6,	%f16
	edge16l	%o0,	%o5,	%i4
	movvc	%icc,	%i7,	%l3
	fmovrsgez	%g6,	%f0,	%f19
	edge16	%o7,	%o4,	%i0
	ldsw	[%l7 + 0x18],	%l4
	restore %i2, 0x1539, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f29,	%f18
	ldx	[%l7 + 0x48],	%g5
	edge16ln	%l1,	%l5,	%o1
	orcc	%g7,	%i6,	%o3
	srax	%o6,	0x0B,	%l0
	movl	%xcc,	%i1,	%l6
	add	%g4,	%l2,	%g1
	umulcc	%i5,	0x0B17,	%i3
	ldsh	[%l7 + 0x7C],	%g2
	mulx	%g3,	0x1A67,	%o5
	or	%o0,	%i7,	%i4
	edge16	%g6,	%l3,	%o7
	fcmpgt32	%f0,	%f22,	%i0
	sth	%o4,	[%l7 + 0x3C]
	movpos	%xcc,	%i2,	%o2
	movg	%xcc,	%g5,	%l1
	pdist	%f30,	%f28,	%f8
	edge32ln	%l4,	%o1,	%g7
	movg	%xcc,	%i6,	%l5
	edge16	%o6,	%o3,	%i1
	edge16	%l6,	%g4,	%l0
	movvc	%xcc,	%g1,	%l2
	fmovdle	%xcc,	%f31,	%f15
	fmovrde	%i5,	%f0,	%f16
	edge32n	%i3,	%g3,	%o5
	fmovrse	%g2,	%f17,	%f29
	array32	%i7,	%o0,	%i4
	nop
	set	0x20, %g2
	stx	%l3,	[%l7 + %g2]
	udivx	%o7,	0x194A,	%i0
	edge32n	%o4,	%i2,	%g6
	array8	%g5,	%o2,	%l4
	fmovspos	%icc,	%f18,	%f10
	fmovsvc	%icc,	%f30,	%f6
	ldd	[%l7 + 0x70],	%l0
	smulcc	%g7,	%o1,	%l5
	srlx	%i6,	%o3,	%i1
	edge8l	%o6,	%l6,	%l0
	fmovdge	%xcc,	%f8,	%f18
	fands	%f25,	%f12,	%f6
	fmovrde	%g4,	%f26,	%f30
	ldd	[%l7 + 0x68],	%g0
	addcc	%i5,	%i3,	%l2
	orcc	%o5,	%g2,	%g3
	fxor	%f22,	%f26,	%f12
	ldd	[%l7 + 0x08],	%o0
	subc	%i7,	%i4,	%l3
	sdiv	%o7,	0x0571,	%i0
	fcmps	%fcc3,	%f12,	%f10
	movg	%icc,	%i2,	%g6
	ld	[%l7 + 0x60],	%f31
	ld	[%l7 + 0x50],	%f11
	movpos	%icc,	%o4,	%o2
	movgu	%icc,	%g5,	%l1
	ldx	[%l7 + 0x40],	%g7
	addccc	%o1,	0x1999,	%l4
	array8	%i6,	%o3,	%l5
	edge16	%o6,	%i1,	%l0
	addcc	%l6,	0x155B,	%g1
	sra	%i5,	%i3,	%g4
	umul	%o5,	0x0E91,	%l2
	fmovse	%xcc,	%f17,	%f30
	addcc	%g3,	0x1320,	%o0
	ldx	[%l7 + 0x50],	%i7
	array32	%i4,	%l3,	%g2
	alignaddr	%o7,	%i2,	%g6
	lduw	[%l7 + 0x68],	%i0
	xor	%o4,	%o2,	%g5
	edge16n	%g7,	%l1,	%o1
	fors	%f7,	%f17,	%f18
	add	%l4,	%i6,	%o3
	alignaddrl	%l5,	%o6,	%l0
	fandnot2	%f14,	%f4,	%f4
	stx	%l6,	[%l7 + 0x08]
	subc	%g1,	%i1,	%i3
	alignaddrl	%i5,	%o5,	%l2
	ldd	[%l7 + 0x70],	%f4
	stb	%g4,	[%l7 + 0x11]
	xnor	%o0,	%g3,	%i7
	fmovsn	%icc,	%f28,	%f6
	fabsd	%f8,	%f18
	fornot2s	%f9,	%f3,	%f26
	movne	%icc,	%i4,	%g2
	sub	%o7,	0x1957,	%i2
	popc	%g6,	%l3
	andcc	%i0,	0x0E0D,	%o4
	move	%xcc,	%g5,	%o2
	udivcc	%g7,	0x10B4,	%o1
	movl	%icc,	%l4,	%i6
	orn	%o3,	%l1,	%o6
	movvs	%xcc,	%l0,	%l5
	fcmpne16	%f8,	%f14,	%l6
	faligndata	%f0,	%f2,	%f0
	subcc	%i1,	0x1C8B,	%i3
	stb	%g1,	[%l7 + 0x29]
	fmovdgu	%icc,	%f28,	%f10
	sir	0x0E62
	addcc	%i5,	0x018F,	%l2
	orncc	%g4,	0x036A,	%o0
	movrlz	%o5,	%g3,	%i4
	movpos	%icc,	%g2,	%o7
	movvs	%icc,	%i2,	%g6
	xor	%l3,	0x0EB5,	%i7
	movre	%i0,	0x3CD,	%o4
	edge32n	%o2,	%g5,	%o1
	udiv	%g7,	0x1581,	%l4
	movcs	%icc,	%o3,	%i6
	ldd	[%l7 + 0x48],	%o6
	ldx	[%l7 + 0x78],	%l0
	movne	%xcc,	%l1,	%l5
	fcmped	%fcc1,	%f6,	%f16
	fmul8sux16	%f24,	%f20,	%f20
	addccc	%l6,	0x0599,	%i1
	mova	%xcc,	%g1,	%i5
	andncc	%l2,	%i3,	%g4
	or	%o5,	0x1A28,	%g3
	fsrc1	%f20,	%f22
	umulcc	%i4,	0x0047,	%o0
	fones	%f22
	udivcc	%o7,	0x16C2,	%i2
	udivx	%g2,	0x0D45,	%l3
	edge32	%g6,	%i0,	%i7
	smulcc	%o4,	0x1F45,	%g5
	ldub	[%l7 + 0x38],	%o1
	andncc	%o2,	%l4,	%g7
	edge8	%o3,	%o6,	%l0
	addccc	%i6,	0x1EE3,	%l5
	sdiv	%l6,	0x101C,	%i1
	fcmps	%fcc3,	%f3,	%f28
	move	%icc,	%g1,	%l1
	popc	%i5,	%l2
	movn	%xcc,	%g4,	%i3
	movcc	%xcc,	%g3,	%o5
	umul	%i4,	0x00C8,	%o7
	fmovrslez	%o0,	%f17,	%f21
	xnor	%g2,	0x1B76,	%i2
	fmovsge	%icc,	%f23,	%f21
	sra	%g6,	%l3,	%i7
	movcs	%xcc,	%i0,	%o4
	sra	%g5,	0x0E,	%o2
	stw	%o1,	[%l7 + 0x20]
	sub	%l4,	%o3,	%g7
	alignaddrl	%o6,	%i6,	%l5
	sll	%l6,	%l0,	%g1
	addcc	%l1,	%i1,	%l2
	movg	%xcc,	%i5,	%i3
	edge16n	%g4,	%g3,	%i4
	array8	%o7,	%o0,	%o5
	sra	%i2,	%g6,	%l3
	subccc	%g2,	0x039F,	%i7
	ld	[%l7 + 0x70],	%f20
	movrne	%o4,	%i0,	%g5
	movn	%xcc,	%o2,	%l4
	fmovdcs	%icc,	%f16,	%f6
	fnor	%f0,	%f8,	%f12
	std	%f22,	[%l7 + 0x50]
	movgu	%icc,	%o1,	%g7
	array8	%o3,	%i6,	%o6
	edge8l	%l6,	%l0,	%l5
	st	%f19,	[%l7 + 0x20]
	udiv	%g1,	0x12BC,	%l1
	stb	%l2,	[%l7 + 0x3A]
	umulcc	%i1,	0x1248,	%i5
	movvc	%xcc,	%g4,	%i3
	smulcc	%g3,	%o7,	%o0
	sub	%o5,	%i2,	%g6
	edge32n	%i4,	%l3,	%g2
	movvs	%icc,	%o4,	%i7
	movvs	%xcc,	%g5,	%o2
	movge	%icc,	%l4,	%i0
	alignaddrl	%g7,	%o1,	%i6
	fpackfix	%f4,	%f29
	fmovrsne	%o6,	%f13,	%f29
	fmovdn	%xcc,	%f14,	%f19
	fmovrsne	%l6,	%f18,	%f26
	edge8	%o3,	%l0,	%g1
	xor	%l1,	0x11EA,	%l5
	fmovsgu	%icc,	%f8,	%f6
	movl	%xcc,	%l2,	%i1
	edge32ln	%g4,	%i5,	%g3
	orncc	%i3,	%o7,	%o5
	st	%f16,	[%l7 + 0x2C]
	fmovrdlz	%i2,	%f26,	%f4
	udivcc	%g6,	0x0755,	%i4
	popc	%o0,	%l3
	addcc	%o4,	0x0256,	%g2
	ld	[%l7 + 0x34],	%f0
	smulcc	%i7,	0x10F3,	%o2
	ldsb	[%l7 + 0x30],	%g5
	or	%l4,	0x0E15,	%i0
	movrgez	%g7,	0x219,	%o1
	movn	%xcc,	%i6,	%o6
	edge32ln	%o3,	%l0,	%g1
	save %l1, %l6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i1,	%g4,	%l2
	ldsh	[%l7 + 0x44],	%i5
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	movneg	%icc,	%i3,	%o5
	fcmps	%fcc3,	%f11,	%f19
	movne	%xcc,	%g6,	%i2
	movrne	%i4,	%o0,	%l3
	movcc	%icc,	%g2,	%i7
	fors	%f23,	%f4,	%f2
	movpos	%xcc,	%o4,	%o2
	movl	%icc,	%l4,	%g5
	movre	%i0,	%o1,	%i6
	sllx	%o6,	0x08,	%g7
	fornot1	%f26,	%f10,	%f22
	movcc	%xcc,	%o3,	%l0
	srlx	%l1,	0x0E,	%l6
	movrne	%g1,	%i1,	%g4
	smulcc	%l2,	0x19BB,	%i5
	alignaddrl	%g3,	%o7,	%i3
	ldd	[%l7 + 0x68],	%o4
	ldsb	[%l7 + 0x3B],	%g6
	nop
	set	0x52, %l0
	lduh	[%l7 + %l0],	%i2
	save %i4, 0x019B, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l3,	0x0CFA,	%l5
	umulcc	%g2,	%i7,	%o4
	st	%f18,	[%l7 + 0x48]
	xor	%l4,	%o2,	%i0
	array32	%o1,	%i6,	%g5
	alignaddrl	%g7,	%o3,	%l0
	lduh	[%l7 + 0x76],	%l1
	movrlez	%l6,	0x3D2,	%o6
	edge32l	%i1,	%g4,	%g1
	fmovsa	%xcc,	%f10,	%f6
	andcc	%l2,	%g3,	%i5
	edge8l	%o7,	%i3,	%g6
	ldub	[%l7 + 0x23],	%i2
	or	%o5,	%o0,	%i4
	fmuld8sux16	%f19,	%f9,	%f6
	movcc	%icc,	%l3,	%l5
	movne	%icc,	%g2,	%o4
	for	%f18,	%f18,	%f28
	fnegs	%f26,	%f10
	ldsw	[%l7 + 0x64],	%i7
	movne	%icc,	%l4,	%o2
	andcc	%i0,	0x02EE,	%o1
	umulcc	%i6,	0x075B,	%g7
	andcc	%g5,	%l0,	%l1
	bshuffle	%f6,	%f10,	%f0
	fandnot1s	%f8,	%f4,	%f9
	movrlz	%o3,	0x2B5,	%l6
	and	%o6,	0x0922,	%i1
	orncc	%g1,	%l2,	%g4
	stw	%i5,	[%l7 + 0x1C]
	edge16	%o7,	%i3,	%g6
	orncc	%i2,	%o5,	%o0
	mulx	%g3,	0x03BF,	%l3
	or	%l5,	%g2,	%o4
	fmovd	%f22,	%f12
	stw	%i7,	[%l7 + 0x38]
	ldsh	[%l7 + 0x3A],	%i4
	edge8ln	%l4,	%i0,	%o1
	movne	%xcc,	%i6,	%g7
	edge16ln	%g5,	%o2,	%l0
	umulcc	%o3,	0x0C78,	%l6
	addcc	%o6,	0x0C34,	%i1
	fmovsvs	%xcc,	%f31,	%f17
	ldsw	[%l7 + 0x54],	%l1
	orn	%l2,	%g1,	%g4
	orncc	%o7,	0x0C42,	%i5
	std	%f4,	[%l7 + 0x38]
	array16	%i3,	%i2,	%g6
	fmuld8sux16	%f16,	%f4,	%f30
	nop
	set	0x2C, %l1
	stw	%o5,	[%l7 + %l1]
	fzeros	%f31
	movge	%xcc,	%g3,	%l3
	xnorcc	%l5,	%g2,	%o4
	udivcc	%i7,	0x121C,	%o0
	movrlez	%l4,	%i4,	%i0
	movle	%icc,	%i6,	%o1
	stx	%g7,	[%l7 + 0x18]
	sethi	0x1FDA,	%o2
	alignaddr	%g5,	%o3,	%l0
	movg	%xcc,	%o6,	%i1
	edge16l	%l1,	%l6,	%l2
	edge32	%g4,	%o7,	%i5
	movre	%g1,	0x016,	%i3
	xor	%i2,	%g6,	%g3
	array8	%o5,	%l3,	%l5
	fmovdleu	%icc,	%f13,	%f17
	ldd	[%l7 + 0x78],	%f24
	srlx	%g2,	0x06,	%i7
	lduh	[%l7 + 0x74],	%o0
	popc	%o4,	%l4
	orn	%i0,	%i6,	%o1
	mulscc	%i4,	%g7,	%o2
	movleu	%xcc,	%g5,	%o3
	movrgez	%l0,	0x2F4,	%o6
	add	%i1,	0x0377,	%l1
	addccc	%l6,	0x05CD,	%g4
	addcc	%o7,	0x1FCB,	%i5
	smulcc	%l2,	%i3,	%i2
	sdivcc	%g1,	0x10D6,	%g6
	xor	%o5,	0x0FD7,	%g3
	fmovsne	%icc,	%f5,	%f30
	array8	%l5,	%g2,	%i7
	srax	%o0,	%l3,	%l4
	st	%f17,	[%l7 + 0x48]
	fand	%f22,	%f28,	%f16
	fmovdneg	%xcc,	%f13,	%f21
	edge8n	%i0,	%o4,	%i6
	movleu	%icc,	%o1,	%g7
	addcc	%i4,	0x1BCA,	%o2
	movle	%icc,	%g5,	%o3
	ldsw	[%l7 + 0x70],	%l0
	stw	%i1,	[%l7 + 0x30]
	movrgez	%o6,	%l1,	%g4
	edge32	%l6,	%o7,	%i5
	edge8l	%l2,	%i3,	%i2
	mova	%icc,	%g6,	%o5
	fzero	%f10
	sethi	0x1FD7,	%g3
	andcc	%l5,	%g1,	%i7
	fmovdvs	%xcc,	%f29,	%f6
	fcmps	%fcc2,	%f8,	%f4
	movcs	%xcc,	%o0,	%l3
	fmovscc	%xcc,	%f17,	%f28
	mova	%xcc,	%g2,	%i0
	edge32	%l4,	%o4,	%i6
	fmovdneg	%xcc,	%f21,	%f30
	xnorcc	%g7,	0x0485,	%i4
	udiv	%o2,	0x03E6,	%o1
	subccc	%o3,	%g5,	%i1
	ldd	[%l7 + 0x78],	%l0
	udiv	%l1,	0x1B97,	%g4
	fmul8x16	%f4,	%f28,	%f14
	edge8l	%o6,	%l6,	%o7
	edge8n	%i5,	%l2,	%i3
	xnor	%i2,	%o5,	%g6
	ld	[%l7 + 0x18],	%f24
	restore %g3, %g1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i7,	0x1267,	%o0
	sir	0x16E4
	andcc	%g2,	%i0,	%l4
	edge16ln	%l3,	%i6,	%g7
	movrlez	%o4,	%i4,	%o1
	movrlez	%o3,	%g5,	%i1
	ldsh	[%l7 + 0x64],	%o2
	srax	%l0,	0x07,	%g4
	fmovsle	%icc,	%f27,	%f6
	edge32l	%l1,	%l6,	%o6
	fpadd16	%f0,	%f14,	%f28
	fmul8ulx16	%f26,	%f20,	%f2
	andn	%o7,	0x0C8B,	%l2
	fmovdg	%icc,	%f6,	%f28
	smul	%i3,	%i2,	%i5
	fornot2	%f0,	%f26,	%f18
	movneg	%xcc,	%o5,	%g6
	movcc	%xcc,	%g1,	%g3
	movgu	%xcc,	%i7,	%l5
	orcc	%o0,	%g2,	%l4
	alignaddr	%l3,	%i6,	%i0
	fcmpgt32	%f24,	%f4,	%g7
	stb	%i4,	[%l7 + 0x72]
	xnor	%o4,	0x1433,	%o1
	or	%o3,	%i1,	%g5
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movle	%icc,	%l0,	%l6
	sll	%l1,	%o6,	%l2
	orn	%o7,	0x038E,	%i3
	movrgz	%i5,	0x36C,	%i2
	subcc	%g6,	0x0F9C,	%g1
	ldub	[%l7 + 0x27],	%o5
	fnors	%f28,	%f31,	%f28
	edge32l	%i7,	%g3,	%l5
	add	%g2,	0x0746,	%o0
	movcc	%xcc,	%l3,	%l4
	array8	%i0,	%g7,	%i6
	umul	%i4,	%o4,	%o3
	orncc	%o1,	0x10E1,	%g5
	edge16l	%o2,	%g4,	%i1
	xorcc	%l6,	%l0,	%l1
	array32	%o6,	%o7,	%i3
	udivcc	%l2,	0x0509,	%i2
	sdiv	%g6,	0x1CF4,	%g1
	or	%i5,	%o5,	%g3
	mulscc	%l5,	0x0A81,	%g2
	subccc	%i7,	0x151F,	%l3
	edge16	%o0,	%l4,	%i0
	add	%g7,	%i4,	%o4
	mulx	%i6,	%o1,	%g5
	nop
	set	0x6C, %i2
	ldub	[%l7 + %i2],	%o2
	ldx	[%l7 + 0x30],	%g4
	smulcc	%o3,	%i1,	%l6
	fands	%f2,	%f10,	%f8
	edge32ln	%l1,	%l0,	%o7
	edge16	%i3,	%l2,	%i2
	ld	[%l7 + 0x7C],	%f17
	fcmpes	%fcc1,	%f22,	%f20
	mulscc	%o6,	%g6,	%g1
	movre	%i5,	0x1F4,	%o5
	stb	%l5,	[%l7 + 0x3A]
	sllx	%g2,	0x11,	%g3
	stw	%l3,	[%l7 + 0x5C]
	movpos	%xcc,	%i7,	%l4
	popc	%i0,	%g7
	sdiv	%o0,	0x06D4,	%i4
	std	%f30,	[%l7 + 0x78]
	srlx	%i6,	0x16,	%o1
	sra	%g5,	%o4,	%o2
	srax	%g4,	0x13,	%i1
	fmovsg	%xcc,	%f17,	%f20
	movrlz	%o3,	0x11E,	%l6
	movl	%xcc,	%l0,	%o7
	edge8n	%l1,	%i3,	%i2
	orncc	%o6,	0x0E38,	%g6
	addccc	%l2,	0x031A,	%g1
	movpos	%xcc,	%i5,	%o5
	mova	%icc,	%g2,	%l5
	srl	%l3,	0x0A,	%i7
	subc	%l4,	%g3,	%i0
	alignaddr	%o0,	%g7,	%i4
	fnegd	%f4,	%f4
	movge	%xcc,	%i6,	%g5
	sllx	%o4,	0x1D,	%o1
	siam	0x4
	subccc	%o2,	%i1,	%o3
	ldd	[%l7 + 0x70],	%f4
	umul	%g4,	%l0,	%o7
	fmovdpos	%xcc,	%f23,	%f22
	fnegs	%f17,	%f7
	fpsub32	%f12,	%f8,	%f4
	restore %l6, %i3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x14],	%f1
	sth	%o6,	[%l7 + 0x3E]
	sra	%g6,	0x18,	%l2
	edge32n	%g1,	%i2,	%o5
	fmovrdgez	%g2,	%f28,	%f12
	fpmerge	%f7,	%f30,	%f14
	movrgez	%l5,	%i5,	%l3
	edge8n	%l4,	%g3,	%i7
	movrgz	%i0,	0x2D0,	%o0
	std	%f12,	[%l7 + 0x08]
	subcc	%i4,	%i6,	%g7
	fmovrde	%g5,	%f16,	%f4
	addccc	%o4,	0x0D92,	%o2
	movpos	%xcc,	%i1,	%o1
	fxnors	%f20,	%f14,	%f1
	fmovde	%xcc,	%f10,	%f26
	subccc	%o3,	0x10B3,	%g4
	fand	%f20,	%f24,	%f24
	smulcc	%o7,	%l0,	%l6
	subccc	%l1,	%i3,	%o6
	fornot1	%f14,	%f28,	%f10
	andcc	%g6,	0x13B0,	%g1
	st	%f28,	[%l7 + 0x78]
	umulcc	%i2,	0x00AE,	%l2
	srl	%o5,	%l5,	%i5
	fmovrslez	%l3,	%f22,	%f21
	movge	%icc,	%l4,	%g2
	movre	%g3,	0x208,	%i0
	fcmple32	%f10,	%f10,	%o0
	movrgz	%i4,	%i6,	%i7
	srax	%g7,	0x11,	%o4
	andcc	%g5,	%i1,	%o1
	fnand	%f10,	%f8,	%f28
	movcc	%icc,	%o2,	%g4
	fmovda	%icc,	%f2,	%f18
	sllx	%o3,	0x1A,	%l0
	edge8ln	%o7,	%l6,	%i3
	sth	%l1,	[%l7 + 0x3E]
	ldsw	[%l7 + 0x5C],	%o6
	fxor	%f26,	%f8,	%f18
	addcc	%g6,	%i2,	%g1
	sth	%o5,	[%l7 + 0x30]
	udivcc	%l5,	0x184F,	%l2
	add	%i5,	%l4,	%g2
	srl	%l3,	%g3,	%o0
	fzero	%f8
	movgu	%icc,	%i0,	%i6
	xnor	%i4,	%g7,	%o4
	movvs	%icc,	%i7,	%g5
	fnand	%f28,	%f22,	%f14
	subcc	%i1,	0x0F7F,	%o2
	for	%f26,	%f4,	%f2
	mulx	%g4,	%o1,	%o3
	fsrc1	%f10,	%f0
	movl	%icc,	%l0,	%o7
	xnorcc	%i3,	%l6,	%l1
	fornot1s	%f13,	%f10,	%f13
	fmovdpos	%xcc,	%f4,	%f2
	sub	%g6,	0x15BC,	%o6
	fcmpgt16	%f20,	%f8,	%i2
	save %g1, 0x13B9, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x18, %o2
	std	%f30,	[%l7 + %o2]
	umulcc	%l5,	%i5,	%l2
	sir	0x02D0
	andn	%l4,	0x0D96,	%l3
	movl	%xcc,	%g3,	%g2
	and	%o0,	0x0D38,	%i6
	std	%f12,	[%l7 + 0x60]
	ldsh	[%l7 + 0x16],	%i4
	fandnot1	%f26,	%f8,	%f22
	st	%f16,	[%l7 + 0x78]
	addccc	%g7,	%i0,	%o4
	subc	%g5,	0x1D55,	%i7
	movg	%xcc,	%o2,	%g4
	fcmpes	%fcc3,	%f12,	%f27
	udivcc	%o1,	0x1C22,	%o3
	sdiv	%l0,	0x120C,	%i1
	movrlez	%o7,	0x068,	%l6
	fandnot2s	%f8,	%f24,	%f23
	popc	%l1,	%g6
	array16	%o6,	%i2,	%g1
	ldsh	[%l7 + 0x14],	%i3
	alignaddr	%l5,	%i5,	%o5
	xor	%l2,	%l3,	%g3
	sra	%g2,	%l4,	%o0
	xor	%i4,	%i6,	%i0
	lduw	[%l7 + 0x3C],	%o4
	smul	%g5,	%g7,	%o2
	xor	%g4,	%i7,	%o3
	fcmpgt16	%f2,	%f12,	%l0
	fmovsvs	%icc,	%f29,	%f2
	edge32ln	%o1,	%i1,	%l6
	move	%icc,	%o7,	%l1
	edge8n	%o6,	%g6,	%i2
	addc	%g1,	%l5,	%i3
	movl	%icc,	%o5,	%l2
	orcc	%i5,	%g3,	%l3
	sdiv	%l4,	0x0E93,	%o0
	save %g2, %i6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f30,	%f3
	sdivx	%o4,	0x0885,	%i0
	sll	%g7,	%o2,	%g5
	stw	%g4,	[%l7 + 0x1C]
	sllx	%o3,	%i7,	%l0
	fmovdneg	%icc,	%f6,	%f13
	addccc	%o1,	%l6,	%o7
	fcmps	%fcc1,	%f7,	%f30
	udivcc	%l1,	0x044F,	%o6
	sth	%g6,	[%l7 + 0x56]
	movrgez	%i1,	0x054,	%g1
	smul	%l5,	%i3,	%i2
	movrgez	%l2,	0x067,	%o5
	stb	%g3,	[%l7 + 0x18]
	fmovsgu	%xcc,	%f15,	%f24
	or	%i5,	0x0495,	%l4
	movcs	%xcc,	%l3,	%o0
	array8	%g2,	%i6,	%o4
	pdist	%f6,	%f2,	%f10
	fmovde	%xcc,	%f23,	%f19
	array32	%i0,	%g7,	%i4
	srax	%o2,	%g5,	%o3
	movge	%xcc,	%g4,	%i7
	fmul8sux16	%f28,	%f8,	%f22
	xorcc	%l0,	%l6,	%o1
	ldd	[%l7 + 0x20],	%f0
	fmovdgu	%xcc,	%f15,	%f26
	popc	%o7,	%o6
	pdist	%f0,	%f16,	%f4
	sll	%l1,	%i1,	%g1
	fmovrdgz	%l5,	%f22,	%f20
	movleu	%xcc,	%i3,	%g6
	fmovsge	%icc,	%f26,	%f25
	alignaddr	%l2,	%i2,	%o5
	sdivcc	%i5,	0x0430,	%l4
	movrlz	%g3,	%o0,	%g2
	popc	%l3,	%i6
	edge32l	%i0,	%g7,	%o4
	edge32ln	%i4,	%o2,	%o3
	fnot2s	%f3,	%f0
	edge32	%g5,	%i7,	%g4
	sth	%l0,	[%l7 + 0x30]
	mulx	%l6,	0x0132,	%o1
	ldub	[%l7 + 0x32],	%o6
	popc	0x182D,	%l1
	fnands	%f31,	%f3,	%f0
	edge8n	%i1,	%g1,	%l5
	edge16ln	%i3,	%o7,	%l2
	ldsw	[%l7 + 0x24],	%i2
	array32	%o5,	%g6,	%i5
	fcmpne16	%f18,	%f0,	%g3
	movne	%icc,	%l4,	%o0
	srl	%l3,	%i6,	%i0
	sub	%g7,	0x1D2B,	%g2
	array32	%o4,	%i4,	%o3
	subc	%g5,	0x09EC,	%o2
	sethi	0x051A,	%i7
	movcs	%xcc,	%g4,	%l6
	edge32n	%l0,	%o1,	%o6
	stx	%l1,	[%l7 + 0x60]
	nop
	set	0x10, %o0
	lduw	[%l7 + %o0],	%g1
	udivcc	%l5,	0x0D82,	%i1
	save %i3, %l2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%i2,	%g6,	%i5
	edge16ln	%g3,	%o5,	%l4
	stb	%l3,	[%l7 + 0x65]
	fmovdl	%icc,	%f6,	%f9
	smulcc	%o0,	0x053B,	%i6
	edge16ln	%g7,	%i0,	%o4
	fmuld8ulx16	%f12,	%f11,	%f8
	ldsh	[%l7 + 0x6E],	%i4
	addcc	%o3,	%g5,	%o2
	fsrc2	%f10,	%f8
	fmovdg	%icc,	%f3,	%f16
	fmovdl	%icc,	%f8,	%f30
	add	%g2,	0x0024,	%i7
	addc	%g4,	%l6,	%o1
	edge8n	%o6,	%l1,	%l0
	and	%g1,	%i1,	%l5
	movn	%icc,	%i3,	%l2
	ldsb	[%l7 + 0x1F],	%o7
	sethi	0x1F66,	%i2
	movne	%xcc,	%i5,	%g6
	movvc	%icc,	%g3,	%o5
	stx	%l4,	[%l7 + 0x28]
	move	%xcc,	%o0,	%l3
	array32	%i6,	%g7,	%i0
	fandnot1s	%f14,	%f23,	%f18
	sir	0x0E3C
	fnand	%f10,	%f12,	%f16
	sra	%i4,	%o3,	%o4
	st	%f30,	[%l7 + 0x34]
	udiv	%g5,	0x0363,	%o2
	fnors	%f19,	%f8,	%f26
	fandnot1	%f6,	%f28,	%f4
	fcmpgt16	%f14,	%f0,	%g2
	fmovrse	%g4,	%f21,	%f27
	stx	%i7,	[%l7 + 0x78]
	movrlez	%o1,	0x0C2,	%o6
	edge8n	%l6,	%l0,	%g1
	xnorcc	%l1,	%l5,	%i1
	movleu	%xcc,	%l2,	%o7
	fmovdgu	%xcc,	%f7,	%f6
	srlx	%i3,	0x05,	%i2
	srlx	%g6,	0x15,	%g3
	or	%o5,	%i5,	%o0
	movg	%xcc,	%l3,	%l4
	movrlz	%i6,	%i0,	%i4
	popc	0x0528,	%o3
	nop
	set	0x50, %l2
	sth	%o4,	[%l7 + %l2]
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	edge16n	%g2,	%i7,	%o1
	movge	%xcc,	%g4,	%o6
	fmovsvc	%icc,	%f23,	%f24
	fsrc1s	%f12,	%f14
	movrgz	%l0,	%g1,	%l1
	ldub	[%l7 + 0x7F],	%l6
	stb	%i1,	[%l7 + 0x30]
	subccc	%l5,	%l2,	%o7
	edge8	%i3,	%g6,	%g3
	fandnot2s	%f28,	%f30,	%f23
	srax	%o5,	0x16,	%i2
	st	%f14,	[%l7 + 0x34]
	lduh	[%l7 + 0x0E],	%o0
	udivx	%i5,	0x0354,	%l4
	sdiv	%i6,	0x0E5A,	%l3
	fmovrde	%i4,	%f26,	%f28
	ldd	[%l7 + 0x18],	%f4
	lduw	[%l7 + 0x28],	%i0
	stw	%o3,	[%l7 + 0x58]
	fmovdcs	%icc,	%f15,	%f26
	umul	%o4,	0x0EE2,	%o2
	fmovrsgez	%g5,	%f15,	%f8
	fpsub16	%f26,	%f6,	%f24
	sll	%g7,	%i7,	%o1
	fands	%f9,	%f26,	%f30
	sth	%g2,	[%l7 + 0x4A]
	orcc	%g4,	%l0,	%o6
	xnor	%l1,	%g1,	%i1
	fpack32	%f28,	%f14,	%f14
	restore %l6, %l5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i3,	0x1FA6,	%g6
	fmovrde	%o7,	%f12,	%f28
	fmovdn	%xcc,	%f10,	%f7
	movrne	%o5,	%i2,	%g3
	sdivx	%i5,	0x0147,	%l4
	fxnors	%f27,	%f13,	%f20
	udivcc	%o0,	0x112B,	%l3
	movrgz	%i6,	%i0,	%i4
	movle	%icc,	%o4,	%o2
	fmovdne	%xcc,	%f10,	%f30
	sdivcc	%g5,	0x1102,	%o3
	alignaddr	%i7,	%g7,	%o1
	movn	%xcc,	%g4,	%l0
	edge16n	%o6,	%g2,	%l1
	ldsh	[%l7 + 0x16],	%g1
	edge8n	%i1,	%l6,	%l5
	movrlez	%i3,	%g6,	%o7
	sethi	0x0CFF,	%l2
	fpmerge	%f3,	%f5,	%f20
	ldd	[%l7 + 0x40],	%f16
	fmovdleu	%xcc,	%f8,	%f31
	fandnot2s	%f25,	%f15,	%f28
	andcc	%i2,	%g3,	%o5
	fxnor	%f12,	%f20,	%f4
	popc	0x00E0,	%l4
	orn	%o0,	0x0D95,	%i5
	and	%l3,	%i6,	%i4
	andncc	%i0,	%o4,	%o2
	fcmple32	%f26,	%f16,	%o3
	xnorcc	%g5,	%i7,	%g7
	movleu	%icc,	%g4,	%l0
	lduh	[%l7 + 0x22],	%o6
	andncc	%o1,	%g2,	%l1
	udivcc	%g1,	0x1C94,	%l6
	andncc	%i1,	%l5,	%g6
	ld	[%l7 + 0x14],	%f15
	sra	%o7,	0x1C,	%l2
	ldd	[%l7 + 0x38],	%i2
	fmovdcs	%icc,	%f6,	%f16
	movpos	%xcc,	%i2,	%g3
	edge16	%o5,	%o0,	%l4
	sra	%i5,	%l3,	%i6
	fands	%f29,	%f19,	%f22
	array16	%i0,	%o4,	%o2
	subc	%o3,	%g5,	%i7
	fornot2	%f22,	%f20,	%f6
	fmovsneg	%icc,	%f6,	%f15
	movg	%icc,	%g7,	%g4
	ldd	[%l7 + 0x30],	%l0
	movre	%i4,	0x240,	%o1
	lduw	[%l7 + 0x58],	%g2
	fornot1s	%f1,	%f2,	%f31
	xnor	%o6,	0x0A57,	%g1
	orn	%l1,	%l6,	%i1
	stb	%g6,	[%l7 + 0x2E]
	ldsh	[%l7 + 0x44],	%l5
	movg	%xcc,	%o7,	%i3
	ldsw	[%l7 + 0x74],	%l2
	fands	%f26,	%f2,	%f7
	popc	0x1877,	%i2
	for	%f26,	%f24,	%f24
	orn	%g3,	%o5,	%l4
	subccc	%i5,	0x1C10,	%o0
	std	%f24,	[%l7 + 0x08]
	srlx	%i6,	0x00,	%i0
	fmovd	%f18,	%f16
	addcc	%l3,	%o4,	%o2
	srl	%g5,	0x19,	%o3
	alignaddr	%g7,	%i7,	%g4
	movrne	%l0,	%o1,	%i4
	fandnot2	%f8,	%f14,	%f22
	movrne	%g2,	0x1D7,	%g1
	movre	%o6,	%l6,	%l1
	array16	%g6,	%i1,	%l5
	fnors	%f29,	%f23,	%f23
	movg	%icc,	%o7,	%i3
	umulcc	%i2,	%l2,	%o5
	st	%f18,	[%l7 + 0x10]
	fmovdleu	%xcc,	%f4,	%f26
	movre	%g3,	0x059,	%i5
	movvc	%xcc,	%o0,	%i6
	movleu	%icc,	%l4,	%i0
	fpsub16s	%f28,	%f22,	%f13
	mulx	%l3,	0x0B54,	%o2
	srlx	%g5,	0x12,	%o3
	fandnot1	%f18,	%f16,	%f16
	movrlez	%g7,	0x16B,	%i7
	fcmpgt32	%f14,	%f10,	%o4
	st	%f18,	[%l7 + 0x40]
	udiv	%l0,	0x063F,	%g4
	fabsd	%f0,	%f6
	sdivx	%i4,	0x11FD,	%o1
	xor	%g1,	%o6,	%g2
	movpos	%icc,	%l6,	%g6
	sra	%l1,	0x0A,	%l5
	fmovsge	%xcc,	%f0,	%f23
	stb	%i1,	[%l7 + 0x7E]
	movvs	%icc,	%i3,	%o7
	ldsw	[%l7 + 0x28],	%i2
	fpadd16s	%f5,	%f16,	%f9
	xorcc	%o5,	0x197D,	%g3
	lduw	[%l7 + 0x10],	%l2
	fpadd16	%f20,	%f18,	%f6
	array8	%i5,	%o0,	%i6
	fcmpeq32	%f22,	%f8,	%l4
	movvc	%xcc,	%i0,	%o2
	fnand	%f22,	%f18,	%f6
	edge16ln	%l3,	%o3,	%g5
	andcc	%g7,	0x1710,	%i7
	smulcc	%l0,	0x1AB6,	%o4
	nop
	set	0x68, %l5
	ldx	[%l7 + %l5],	%i4
	movge	%icc,	%g4,	%o1
	ldd	[%l7 + 0x68],	%o6
	fmovdg	%icc,	%f4,	%f0
	movg	%icc,	%g1,	%g2
	add	%l6,	%l1,	%g6
	movre	%i1,	0x260,	%i3
	edge32	%l5,	%i2,	%o7
	smul	%g3,	0x1B89,	%l2
	ldx	[%l7 + 0x18],	%o5
	lduw	[%l7 + 0x7C],	%i5
	fmovdge	%icc,	%f16,	%f10
	sdiv	%o0,	0x138E,	%l4
	ld	[%l7 + 0x1C],	%f23
	edge32n	%i6,	%i0,	%o2
	ldd	[%l7 + 0x28],	%f4
	xnorcc	%l3,	%o3,	%g7
	sdivx	%g5,	0x1DED,	%i7
	array8	%l0,	%o4,	%g4
	srlx	%o1,	0x0D,	%i4
	addcc	%o6,	%g2,	%g1
	srlx	%l6,	%g6,	%i1
	ldsh	[%l7 + 0x18],	%i3
	nop
	set	0x68, %g7
	std	%f20,	[%l7 + %g7]
	movle	%xcc,	%l1,	%l5
	sdivx	%i2,	0x1AE2,	%o7
	umul	%l2,	0x1C0E,	%o5
	fnot1	%f0,	%f6
	mulx	%i5,	0x0898,	%g3
	mova	%icc,	%l4,	%i6
	fmuld8ulx16	%f16,	%f17,	%f18
	lduw	[%l7 + 0x54],	%i0
	sra	%o2,	0x0A,	%o0
	subccc	%l3,	%g7,	%o3
	st	%f2,	[%l7 + 0x68]
	sra	%g5,	%i7,	%o4
	andn	%l0,	0x168A,	%o1
	alignaddr	%g4,	%i4,	%o6
	movcs	%icc,	%g2,	%l6
	lduh	[%l7 + 0x08],	%g6
	sdiv	%i1,	0x07D9,	%g1
	fxor	%f12,	%f18,	%f10
	stw	%i3,	[%l7 + 0x1C]
	move	%xcc,	%l5,	%l1
	sethi	0x1D4C,	%i2
	movleu	%icc,	%l2,	%o5
	xnorcc	%i5,	%o7,	%l4
	fmovdge	%icc,	%f20,	%f3
	xor	%g3,	0x096F,	%i6
	smul	%i0,	0x1D07,	%o0
	srlx	%o2,	0x16,	%l3
	array32	%o3,	%g7,	%i7
	edge32ln	%o4,	%g5,	%o1
	movrgez	%l0,	%i4,	%g4
	ldx	[%l7 + 0x68],	%o6
	edge8ln	%l6,	%g2,	%g6
	ldx	[%l7 + 0x58],	%g1
	stw	%i1,	[%l7 + 0x0C]
	fpadd32s	%f1,	%f31,	%f27
	alignaddr	%i3,	%l1,	%i2
	stw	%l5,	[%l7 + 0x3C]
	save %l2, %i5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	movrgz	%i6,	0x151,	%o0
	srlx	%o2,	0x13,	%i0
	mova	%xcc,	%l3,	%o3
	movrgz	%g7,	%o4,	%g5
	fmul8x16	%f19,	%f30,	%f22
	sth	%o1,	[%l7 + 0x4C]
	array8	%l0,	%i7,	%g4
	nop
	set	0x14, %o6
	lduw	[%l7 + %o6],	%o6
	stb	%l6,	[%l7 + 0x5D]
	add	%i4,	%g6,	%g2
	edge16ln	%g1,	%i3,	%i1
	fnot2s	%f9,	%f10
	mulscc	%i2,	%l1,	%l2
	edge32	%l5,	%i5,	%o5
	movl	%xcc,	%g3,	%l4
	fmovrsgz	%i6,	%f30,	%f30
	fandnot2	%f12,	%f8,	%f28
	movvc	%icc,	%o0,	%o2
	umul	%o7,	%i0,	%l3
	ldsb	[%l7 + 0x2A],	%g7
	edge8	%o3,	%o4,	%o1
	fpackfix	%f12,	%f5
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%g4
	ld	[%l7 + 0x68],	%f28
	nop
	set	0x60, %o5
	ldd	[%l7 + %o5],	%f28
	movg	%xcc,	%l0,	%g4
	restore %o6, %l6, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32s	%f14,	%f18,	%f13
	fpadd32	%f2,	%f10,	%f0
	smulcc	%g6,	0x1A8C,	%i7
	movg	%icc,	%g1,	%i3
	umulcc	%g2,	0x0CD9,	%i2
	movcc	%icc,	%i1,	%l2
	edge16l	%l1,	%i5,	%l5
	addc	%o5,	%g3,	%i6
	umulcc	%o0,	%l4,	%o2
	movg	%xcc,	%i0,	%o7
	movvs	%xcc,	%l3,	%g7
	sll	%o3,	%o4,	%o1
	movpos	%icc,	%l0,	%g5
	andcc	%g4,	%o6,	%i4
	sdivx	%l6,	0x1D6A,	%i7
	bshuffle	%f28,	%f4,	%f26
	array32	%g6,	%g1,	%g2
	fmovdle	%icc,	%f19,	%f19
	fmovsvc	%icc,	%f14,	%f10
	fmul8x16al	%f13,	%f3,	%f4
	movcs	%icc,	%i2,	%i1
	movn	%icc,	%l2,	%i3
	subc	%i5,	%l1,	%o5
	ldsb	[%l7 + 0x27],	%g3
	sdivx	%i6,	0x01D3,	%o0
	movre	%l5,	%o2,	%i0
	array16	%l4,	%o7,	%g7
	orn	%l3,	%o4,	%o3
	std	%f30,	[%l7 + 0x48]
	edge16	%o1,	%g5,	%g4
	fmovdge	%icc,	%f7,	%f11
	fpadd16s	%f12,	%f20,	%f15
	orn	%o6,	%i4,	%l0
	fmovsne	%xcc,	%f2,	%f6
	movn	%icc,	%l6,	%g6
	st	%f6,	[%l7 + 0x60]
	movrlez	%g1,	0x249,	%g2
	fmovscc	%xcc,	%f14,	%f24
	alignaddr	%i7,	%i2,	%i1
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	movre	%l1,	0x391,	%i3
	fmovs	%f4,	%f10
	lduh	[%l7 + 0x28],	%o5
	sth	%g3,	[%l7 + 0x74]
	stw	%o0,	[%l7 + 0x18]
	save %l5, 0x1660, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x08DC,	%o2
	fsrc1	%f8,	%f12
	addc	%i0,	0x08D0,	%o7
	movrne	%l4,	0x225,	%l3
	fmovde	%xcc,	%f17,	%f20
	orcc	%g7,	0x16DD,	%o4
	nop
	set	0x40, %i3
	ldd	[%l7 + %i3],	%f10
	movn	%xcc,	%o3,	%g5
	array16	%g4,	%o1,	%o6
	orncc	%i4,	0x165B,	%l0
	sdiv	%l6,	0x02BD,	%g1
	subc	%g2,	0x1E47,	%i7
	mulx	%g6,	0x089E,	%i1
	subcc	%l2,	0x07FB,	%i2
	fmovrdgez	%l1,	%f26,	%f24
	andncc	%i5,	%o5,	%g3
	movneg	%icc,	%o0,	%l5
	fmuld8ulx16	%f23,	%f7,	%f20
	edge32l	%i3,	%o2,	%i0
	siam	0x3
	fmovdvs	%xcc,	%f21,	%f15
	movpos	%xcc,	%i6,	%o7
	udiv	%l3,	0x0873,	%g7
	fmovdl	%icc,	%f17,	%f30
	xorcc	%l4,	0x1176,	%o3
	fnors	%f0,	%f0,	%f10
	addcc	%g5,	0x0A33,	%o4
	edge8l	%o1,	%g4,	%o6
	fmovde	%xcc,	%f19,	%f1
	fmovd	%f22,	%f18
	edge16l	%i4,	%l0,	%g1
	sra	%g2,	%l6,	%g6
	movpos	%xcc,	%i7,	%l2
	ldsh	[%l7 + 0x6A],	%i2
	fandnot1s	%f13,	%f12,	%f26
	edge32l	%i1,	%i5,	%l1
	alignaddrl	%g3,	%o5,	%l5
	edge8n	%i3,	%o0,	%i0
	umulcc	%o2,	%o7,	%i6
	stb	%g7,	[%l7 + 0x62]
	array16	%l4,	%o3,	%l3
	ldsb	[%l7 + 0x7F],	%o4
	edge16l	%o1,	%g4,	%o6
	movcs	%icc,	%g5,	%l0
	orncc	%i4,	0x141C,	%g1
	orcc	%l6,	%g6,	%i7
	stb	%g2,	[%l7 + 0x4C]
	edge16ln	%l2,	%i2,	%i5
	andncc	%l1,	%i1,	%o5
	fsrc2	%f20,	%f28
	fsrc1	%f28,	%f12
	lduw	[%l7 + 0x08],	%g3
	nop
	set	0x67, %i1
	ldub	[%l7 + %i1],	%l5
	ldsw	[%l7 + 0x54],	%i3
	fpsub32	%f22,	%f18,	%f8
	edge16	%i0,	%o2,	%o7
	fmovsle	%icc,	%f24,	%f7
	edge32l	%o0,	%g7,	%l4
	sethi	0x0BB5,	%o3
	st	%f15,	[%l7 + 0x30]
	fmovsleu	%icc,	%f29,	%f27
	sub	%l3,	%o4,	%o1
	ldx	[%l7 + 0x58],	%g4
	add	%o6,	0x1094,	%i6
	fcmpne16	%f26,	%f26,	%l0
	smulcc	%g5,	%g1,	%i4
	sra	%g6,	0x05,	%l6
	or	%i7,	0x00BE,	%g2
	orn	%l2,	%i5,	%l1
	subc	%i1,	0x0FF9,	%i2
	ldd	[%l7 + 0x38],	%o4
	xor	%l5,	%i3,	%i0
	ldsh	[%l7 + 0x5E],	%g3
	movrgz	%o2,	0x102,	%o0
	ldub	[%l7 + 0x3E],	%o7
	movle	%xcc,	%g7,	%o3
	sth	%l4,	[%l7 + 0x3C]
	movge	%icc,	%l3,	%o4
	xorcc	%g4,	%o6,	%o1
	fsrc1	%f26,	%f24
	orcc	%i6,	%g5,	%l0
	srax	%i4,	%g6,	%l6
	umulcc	%i7,	0x0382,	%g2
	edge16l	%l2,	%g1,	%i5
	fpadd16s	%f9,	%f2,	%f0
	sub	%i1,	%l1,	%i2
	sethi	0x0C8C,	%l5
	movg	%xcc,	%o5,	%i3
	sir	0x0283
	fmovdleu	%xcc,	%f14,	%f31
	fmovda	%xcc,	%f9,	%f11
	addcc	%i0,	%o2,	%g3
	smul	%o7,	0x08E1,	%o0
	sdiv	%g7,	0x0C72,	%l4
	srlx	%l3,	0x0E,	%o3
	xnor	%g4,	0x118D,	%o4
	alignaddrl	%o1,	%o6,	%i6
	fmovdneg	%icc,	%f18,	%f22
	fandnot1	%f4,	%f4,	%f16
	edge8ln	%l0,	%g5,	%i4
	array32	%l6,	%g6,	%g2
	edge32l	%l2,	%i7,	%i5
	udivx	%g1,	0x1ECB,	%l1
	movn	%xcc,	%i2,	%l5
	fxnors	%f19,	%f15,	%f25
	edge8l	%i1,	%o5,	%i3
	movge	%icc,	%i0,	%o2
	subccc	%o7,	%g3,	%o0
	mulx	%l4,	%l3,	%g7
	fnot1	%f10,	%f18
	alignaddrl	%g4,	%o3,	%o1
	andcc	%o4,	%i6,	%o6
	fmovsge	%icc,	%f1,	%f14
	fandnot1	%f18,	%f14,	%f30
	srl	%l0,	%i4,	%l6
	fmovse	%icc,	%f24,	%f6
	movle	%icc,	%g6,	%g2
	movrgez	%g5,	0x189,	%l2
	st	%f1,	[%l7 + 0x7C]
	stx	%i5,	[%l7 + 0x20]
	lduh	[%l7 + 0x5A],	%i7
	addc	%l1,	%i2,	%l5
	sdivx	%g1,	0x0F34,	%o5
	movle	%icc,	%i1,	%i0
	fcmple16	%f30,	%f30,	%i3
	sdivx	%o2,	0x1D81,	%o7
	xor	%o0,	%g3,	%l3
	fmovdgu	%xcc,	%f3,	%f28
	array8	%l4,	%g7,	%g4
	udivcc	%o3,	0x1E12,	%o4
	for	%f18,	%f2,	%f30
	movrgez	%o1,	0x125,	%i6
	andcc	%o6,	0x0BEC,	%i4
	fmovdvs	%xcc,	%f5,	%f18
	movrlez	%l0,	0x0E9,	%l6
	addcc	%g6,	0x1155,	%g5
	sth	%l2,	[%l7 + 0x74]
	and	%i5,	%i7,	%l1
	ldx	[%l7 + 0x68],	%i2
	sethi	0x0421,	%l5
	fcmple16	%f28,	%f2,	%g2
	stb	%g1,	[%l7 + 0x2B]
	fpackfix	%f12,	%f27
	edge8l	%i1,	%i0,	%i3
	restore %o5, 0x11FF, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o0,	0x065E,	%g3
	sethi	0x1989,	%l3
	save %o7, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l4,	%o3,	%o4
	std	%f20,	[%l7 + 0x28]
	fnegd	%f22,	%f8
	ldsb	[%l7 + 0x68],	%i6
	fexpand	%f20,	%f6
	fxnor	%f4,	%f12,	%f2
	andncc	%o1,	%o6,	%i4
	move	%icc,	%l6,	%l0
	fpadd16	%f24,	%f28,	%f0
	array8	%g6,	%g5,	%l2
	udiv	%i7,	0x1C78,	%l1
	sth	%i2,	[%l7 + 0x78]
	srl	%i5,	0x1B,	%g2
	umul	%g1,	0x18FD,	%i1
	or	%i0,	%l5,	%i3
	xnor	%o2,	%o5,	%o0
	movre	%l3,	0x079,	%o7
	pdist	%f8,	%f0,	%f12
	movleu	%icc,	%g7,	%g3
	addc	%g4,	0x0B1E,	%l4
	movvs	%icc,	%o4,	%o3
	add	%i6,	0x0DB7,	%o6
	andncc	%i4,	%o1,	%l0
	udivcc	%l6,	0x16E2,	%g6
	edge16ln	%g5,	%i7,	%l1
	sir	0x065D
	xorcc	%l2,	0x1C6A,	%i2
	fmovrdlz	%g2,	%f2,	%f0
	andn	%i5,	%i1,	%i0
	movrgz	%g1,	0x0FB,	%l5
	movvs	%icc,	%i3,	%o2
	movneg	%xcc,	%o5,	%o0
	addc	%o7,	%g7,	%l3
	alignaddr	%g3,	%l4,	%g4
	movrlez	%o3,	0x1DA,	%o4
	edge16ln	%o6,	%i4,	%o1
	srl	%i6,	0x11,	%l0
	fmovrdgez	%g6,	%f10,	%f16
	movge	%icc,	%g5,	%i7
	orn	%l6,	0x016A,	%l2
	and	%i2,	0x1B9B,	%l1
	addccc	%i5,	0x1979,	%i1
	movre	%g2,	0x3AA,	%g1
	movl	%icc,	%i0,	%l5
	addcc	%i3,	0x1CD6,	%o2
	orncc	%o5,	0x02BF,	%o7
	movne	%icc,	%g7,	%o0
	addcc	%l3,	0x0CFC,	%g3
	mulscc	%l4,	0x04CD,	%g4
	addccc	%o4,	0x09D0,	%o3
	movvc	%icc,	%o6,	%o1
	xnorcc	%i4,	%i6,	%l0
	edge8l	%g5,	%i7,	%g6
	array16	%l2,	%i2,	%l6
	addcc	%i5,	%i1,	%l1
	movvs	%xcc,	%g2,	%i0
	std	%f30,	[%l7 + 0x40]
	edge16ln	%g1,	%i3,	%o2
	ldsb	[%l7 + 0x75],	%l5
	lduw	[%l7 + 0x08],	%o7
	stb	%o5,	[%l7 + 0x5D]
	ldsb	[%l7 + 0x6C],	%o0
	fmovsle	%icc,	%f23,	%f23
	st	%f21,	[%l7 + 0x54]
	edge8l	%l3,	%g7,	%g3
	fmovsg	%icc,	%f4,	%f24
	fornot2s	%f30,	%f13,	%f2
	and	%g4,	0x16C3,	%o4
	addc	%l4,	%o6,	%o1
	addc	%i4,	%o3,	%l0
	movrne	%g5,	0x34A,	%i6
	xnor	%g6,	0x0D50,	%l2
	ldsb	[%l7 + 0x19],	%i2
	movrlz	%i7,	0x1A9,	%l6
	fmovrsgz	%i1,	%f29,	%f4
	xor	%l1,	0x0CD7,	%i5
	sllx	%i0,	0x17,	%g1
	fmovrsgez	%i3,	%f23,	%f8
	fsrc2	%f28,	%f2
	mova	%xcc,	%o2,	%l5
	array32	%g2,	%o5,	%o0
	alignaddr	%o7,	%g7,	%l3
	xor	%g4,	0x1934,	%g3
	add	%o4,	%l4,	%o6
	move	%xcc,	%i4,	%o3
	mulscc	%l0,	%g5,	%o1
	fxors	%f0,	%f24,	%f28
	edge8	%g6,	%l2,	%i2
	st	%f24,	[%l7 + 0x30]
	ldsh	[%l7 + 0x44],	%i7
	srlx	%i6,	%i1,	%l6
	udivcc	%i5,	0x1AF6,	%i0
	alignaddrl	%g1,	%i3,	%o2
	edge16ln	%l1,	%g2,	%l5
	array16	%o5,	%o7,	%g7
	addcc	%l3,	%g4,	%g3
	ldd	[%l7 + 0x68],	%f8
	fcmpd	%fcc1,	%f16,	%f2
	sir	0x0BEF
	edge32ln	%o4,	%l4,	%o0
	movcs	%icc,	%o6,	%o3
	orcc	%l0,	0x10CB,	%g5
	nop
	set	0x78, %i7
	ldd	[%l7 + %i7],	%f8
	fmul8x16al	%f11,	%f25,	%f24
	movvs	%xcc,	%o1,	%i4
	pdist	%f14,	%f6,	%f2
	fmovscs	%xcc,	%f7,	%f31
	popc	0x1B0A,	%l2
	fnors	%f3,	%f30,	%f14
	xnorcc	%i2,	%i7,	%i6
	movrgz	%i1,	%l6,	%g6
	andn	%i0,	0x1709,	%g1
	ldsw	[%l7 + 0x24],	%i3
	subc	%o2,	0x1859,	%i5
	fmovrdlz	%l1,	%f12,	%f22
	lduw	[%l7 + 0x64],	%l5
	edge16n	%o5,	%g2,	%o7
	movrgez	%g7,	0x256,	%l3
	mova	%xcc,	%g4,	%g3
	movpos	%xcc,	%l4,	%o4
	array32	%o0,	%o6,	%o3
	fmovdn	%icc,	%f7,	%f8
	movvs	%xcc,	%g5,	%l0
	movn	%xcc,	%i4,	%l2
	movle	%icc,	%o1,	%i2
	addc	%i7,	%i6,	%i1
	srlx	%l6,	%i0,	%g6
	fzero	%f20
	xor	%g1,	0x00E4,	%i3
	sdiv	%i5,	0x0DAE,	%l1
	udivx	%l5,	0x1FA3,	%o2
	smulcc	%g2,	%o5,	%g7
	array8	%o7,	%l3,	%g3
	ldd	[%l7 + 0x68],	%g4
	fmovscc	%xcc,	%f14,	%f19
	movrne	%l4,	%o4,	%o0
	edge16ln	%o6,	%g5,	%l0
	movpos	%icc,	%o3,	%l2
	edge32ln	%o1,	%i2,	%i4
	movrne	%i6,	%i7,	%l6
	fmuld8sux16	%f13,	%f29,	%f28
	nop
	set	0x1A, %i6
	ldsh	[%l7 + %i6],	%i1
	edge8	%i0,	%g1,	%g6
	mulx	%i5,	%l1,	%i3
	and	%o2,	%g2,	%l5
	fmovrdgez	%o5,	%f12,	%f30
	fpackfix	%f28,	%f6
	lduw	[%l7 + 0x0C],	%g7
	fmul8x16au	%f23,	%f24,	%f14
	st	%f3,	[%l7 + 0x78]
	sdivcc	%l3,	0x0888,	%o7
	add	%g3,	0x177B,	%g4
	orn	%l4,	%o0,	%o6
	orn	%o4,	%l0,	%g5
	mulx	%o3,	%l2,	%o1
	fornot1	%f30,	%f16,	%f2
	movrne	%i2,	0x249,	%i4
	andncc	%i6,	%i7,	%i1
	sra	%i0,	%l6,	%g6
	and	%g1,	%i5,	%i3
	movne	%icc,	%l1,	%o2
	fmovdneg	%icc,	%f28,	%f8
	sdivcc	%l5,	0x02F3,	%o5
	std	%f28,	[%l7 + 0x60]
	sub	%g7,	0x1CFA,	%l3
	ldd	[%l7 + 0x78],	%o6
	fmovrdgz	%g2,	%f30,	%f28
	and	%g4,	%l4,	%g3
	nop
	set	0x10, %i5
	std	%f12,	[%l7 + %i5]
	fmovrdgz	%o6,	%f22,	%f8
	fcmpeq16	%f12,	%f28,	%o0
	srl	%l0,	%g5,	%o4
	movg	%icc,	%l2,	%o3
	edge16ln	%o1,	%i2,	%i4
	array16	%i7,	%i6,	%i1
	fmovdle	%xcc,	%f4,	%f23
	orn	%i0,	0x1293,	%g6
	fornot1s	%f15,	%f9,	%f28
	udiv	%l6,	0x058B,	%i5
	add	%i3,	%l1,	%o2
	sll	%g1,	0x04,	%l5
	mova	%xcc,	%o5,	%l3
	smulcc	%g7,	%g2,	%o7
	sub	%g4,	0x113F,	%l4
	edge16n	%o6,	%o0,	%g3
	lduh	[%l7 + 0x54],	%g5
	stw	%l0,	[%l7 + 0x08]
	movrne	%o4,	%l2,	%o1
	move	%xcc,	%o3,	%i4
	xnor	%i2,	0x1322,	%i7
	fmovda	%xcc,	%f0,	%f3
	sll	%i1,	%i0,	%i6
	stb	%g6,	[%l7 + 0x3C]
	fmovse	%icc,	%f16,	%f5
	orcc	%l6,	0x1B7B,	%i3
	add	%i5,	%l1,	%g1
	ldx	[%l7 + 0x38],	%o2
	ld	[%l7 + 0x1C],	%f13
	udivcc	%l5,	0x0DA8,	%l3
	sdiv	%o5,	0x0E72,	%g7
	movcc	%xcc,	%o7,	%g4
	fnegd	%f10,	%f10
	faligndata	%f24,	%f26,	%f8
	orcc	%l4,	0x0BF8,	%o6
	addc	%o0,	0x07C8,	%g3
	smul	%g2,	%l0,	%g5
	nop
	set	0x5C, %g4
	ldsb	[%l7 + %g4],	%o4
	array32	%o1,	%l2,	%o3
	fmovsneg	%icc,	%f30,	%f0
	orncc	%i4,	%i7,	%i2
	array16	%i0,	%i1,	%i6
	fexpand	%f17,	%f28
	sdiv	%l6,	0x1969,	%g6
	edge16	%i5,	%i3,	%g1
	movrgez	%o2,	0x318,	%l5
	smul	%l3,	%l1,	%o5
	fmovrdlz	%g7,	%f10,	%f14
	sub	%o7,	0x068B,	%g4
	lduh	[%l7 + 0x76],	%o6
	movvs	%icc,	%o0,	%g3
	nop
	set	0x76, %g6
	ldsb	[%l7 + %g6],	%g2
	move	%xcc,	%l0,	%l4
	fzeros	%f20
	sdiv	%g5,	0x1BD8,	%o1
	edge32n	%o4,	%o3,	%l2
	sir	0x14D2
	movleu	%icc,	%i7,	%i4
	sra	%i2,	%i1,	%i6
	movvc	%icc,	%i0,	%g6
	sdivx	%l6,	0x004D,	%i3
	orn	%i5,	%g1,	%l5
	srax	%o2,	0x01,	%l3
	umulcc	%o5,	0x014C,	%l1
	fsrc2	%f20,	%f12
	xorcc	%g7,	%o7,	%o6
	subccc	%o0,	%g3,	%g2
	std	%f12,	[%l7 + 0x30]
	mulscc	%l0,	%g4,	%l4
	fornot2	%f10,	%f4,	%f22
	fmovdg	%xcc,	%f28,	%f19
	edge8ln	%o1,	%g5,	%o3
	movpos	%icc,	%l2,	%o4
	ldub	[%l7 + 0x4D],	%i4
	movneg	%xcc,	%i7,	%i1
	andn	%i6,	0x1152,	%i2
	lduh	[%l7 + 0x16],	%i0
	save %g6, %i3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	0x1FB0,	%l5
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	movl	%icc,	%l3,	%o5
	edge8l	%l1,	%g7,	%o6
	srlx	%o7,	0x0B,	%g3
	save %o0, 0x03D8, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g2,	0x10D,	%l4
	ldd	[%l7 + 0x08],	%g4
	and	%g5,	0x12C9,	%o1
	stb	%l2,	[%l7 + 0x67]
	edge8n	%o3,	%i4,	%o4
	movvc	%xcc,	%i7,	%i1
	fands	%f6,	%f6,	%f4
	sub	%i6,	%i0,	%i2
	add	%i3,	%l6,	%i5
	mulx	%g6,	%l5,	%o2
	fandnot2s	%f22,	%f5,	%f10
	fmovse	%icc,	%f27,	%f5
	std	%f28,	[%l7 + 0x78]
	subccc	%g1,	0x1878,	%o5
	srax	%l3,	0x07,	%g7
	sub	%l1,	%o6,	%g3
	or	%o0,	0x1633,	%l0
	fmovrsgez	%g2,	%f9,	%f2
	orn	%l4,	%o7,	%g4
	edge16n	%g5,	%o1,	%l2
	sth	%i4,	[%l7 + 0x30]
	sll	%o4,	0x0B,	%o3
	movvs	%xcc,	%i1,	%i6
	fones	%f6
	movrlz	%i7,	%i2,	%i3
	movgu	%xcc,	%i0,	%l6
	fmovscs	%xcc,	%f27,	%f4
	movrgez	%i5,	0x006,	%l5
	fmul8x16au	%f24,	%f6,	%f12
	array32	%o2,	%g6,	%o5
	stx	%g1,	[%l7 + 0x08]
	srlx	%g7,	%l3,	%l1
	fmovdn	%icc,	%f22,	%f19
	orcc	%g3,	%o0,	%o6
	ldx	[%l7 + 0x20],	%g2
	add	%l4,	0x023F,	%o7
	umul	%g4,	%g5,	%o1
	fpack32	%f10,	%f16,	%f10
	edge16l	%l0,	%i4,	%l2
	lduw	[%l7 + 0x58],	%o4
	fandnot1s	%f27,	%f4,	%f9
	movneg	%xcc,	%i1,	%i6
	addc	%i7,	0x10D6,	%o3
	addccc	%i3,	%i0,	%i2
	movne	%icc,	%i5,	%l5
	edge16	%l6,	%g6,	%o5
	movcc	%xcc,	%g1,	%g7
	udivcc	%l3,	0x186D,	%o2
	fxnor	%f6,	%f18,	%f18
	ldsb	[%l7 + 0x6F],	%g3
	fmovdneg	%icc,	%f11,	%f18
	movl	%xcc,	%o0,	%l1
	sdiv	%o6,	0x04F0,	%l4
	sdiv	%o7,	0x0DCA,	%g4
	edge16	%g2,	%g5,	%o1
	fmovrsne	%l0,	%f21,	%f12
	sllx	%i4,	0x12,	%l2
	stw	%o4,	[%l7 + 0x30]
	sra	%i1,	%i7,	%i6
	fandnot2	%f12,	%f8,	%f20
	ldub	[%l7 + 0x23],	%i3
	movg	%xcc,	%i0,	%i2
	move	%icc,	%i5,	%l5
	nop
	set	0x44, %o4
	ldsw	[%l7 + %o4],	%o3
	sub	%l6,	%g6,	%o5
	xnorcc	%g1,	%g7,	%o2
	fmovdg	%icc,	%f20,	%f28
	srl	%g3,	0x0B,	%o0
	udivx	%l1,	0x0A5B,	%l3
	fandnot2	%f12,	%f20,	%f28
	fcmpne32	%f14,	%f2,	%l4
	movvs	%icc,	%o6,	%g4
	edge16l	%o7,	%g5,	%g2
	movne	%icc,	%o1,	%l0
	sub	%i4,	0x1F51,	%l2
	andcc	%o4,	0x1AFA,	%i1
	movne	%icc,	%i6,	%i7
	edge16l	%i3,	%i2,	%i0
	fmovsle	%icc,	%f8,	%f28
	fnegs	%f26,	%f10
	edge32ln	%l5,	%o3,	%i5
	mulscc	%l6,	0x1080,	%g6
	mulx	%g1,	%o5,	%g7
	and	%o2,	%o0,	%l1
	fmovscc	%xcc,	%f26,	%f3
	and	%g3,	0x1ACB,	%l3
	andn	%o6,	%l4,	%g4
	movcs	%icc,	%o7,	%g5
	movcs	%icc,	%g2,	%o1
	array32	%i4,	%l2,	%l0
	sdiv	%i1,	0x0C9B,	%i6
	addcc	%i7,	0x18EA,	%i3
	andncc	%o4,	%i0,	%l5
	mova	%xcc,	%o3,	%i2
	fpsub32	%f8,	%f26,	%f0
	fornot1	%f20,	%f8,	%f10
	xorcc	%l6,	%g6,	%g1
	stx	%o5,	[%l7 + 0x60]
	udivcc	%i5,	0x017E,	%o2
	and	%o0,	0x0F70,	%l1
	fmovrde	%g3,	%f6,	%f2
	movvs	%xcc,	%g7,	%o6
	sub	%l3,	%g4,	%l4
	udivx	%g5,	0x04BE,	%o7
	fmovrde	%g2,	%f24,	%f14
	fxnors	%f14,	%f9,	%f4
	array8	%i4,	%l2,	%o1
	subcc	%l0,	0x084E,	%i6
	sub	%i7,	0x162B,	%i3
	mulx	%i1,	%i0,	%o4
	st	%f30,	[%l7 + 0x3C]
	std	%f22,	[%l7 + 0x78]
	movvs	%xcc,	%l5,	%i2
	restore %o3, %l6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	siam	0x3
	subcc	%g6,	0x1760,	%o5
	fcmpne16	%f14,	%f28,	%i5
	movrgz	%o0,	%l1,	%o2
	xnorcc	%g7,	0x1EC9,	%o6
	srlx	%l3,	%g3,	%l4
	movcs	%icc,	%g5,	%o7
	andcc	%g2,	0x0890,	%g4
	stw	%l2,	[%l7 + 0x5C]
	nop
	set	0x36, %i4
	sth	%i4,	[%l7 + %i4]
	sub	%o1,	0x1572,	%i6
	xnor	%l0,	0x1FE4,	%i3
	movcc	%icc,	%i1,	%i0
	movrgz	%o4,	0x0B6,	%l5
	movcc	%icc,	%i2,	%i7
	alignaddr	%l6,	%g1,	%g6
	fmovsvs	%icc,	%f6,	%f16
	or	%o3,	0x0F7C,	%o5
	edge32	%o0,	%i5,	%l1
	udivcc	%g7,	0x1242,	%o2
	movg	%icc,	%o6,	%g3
	sdivcc	%l4,	0x0803,	%g5
	edge8ln	%l3,	%g2,	%g4
	fnors	%f1,	%f21,	%f7
	umul	%o7,	%l2,	%i4
	st	%f16,	[%l7 + 0x20]
	fmovsne	%xcc,	%f30,	%f10
	fmovdneg	%xcc,	%f4,	%f20
	fmovdl	%xcc,	%f31,	%f6
	movvc	%xcc,	%i6,	%o1
	movrgez	%l0,	0x3BC,	%i3
	addc	%i0,	0x022B,	%i1
	udivcc	%l5,	0x18DD,	%i2
	stb	%i7,	[%l7 + 0x54]
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%i6
	st	%f24,	[%l7 + 0x0C]
	sethi	0x085A,	%g1
	subccc	%g6,	0x1141,	%o3
	nop
	set	0x08, %g5
	stx	%o4,	[%l7 + %g5]
	ld	[%l7 + 0x24],	%f16
	popc	0x01A1,	%o0
	edge8	%i5,	%o5,	%g7
	stx	%l1,	[%l7 + 0x48]
	mulx	%o2,	0x00B8,	%o6
	edge16ln	%g3,	%g5,	%l4
	fzeros	%f11
	edge8l	%g2,	%l3,	%g4
	ldx	[%l7 + 0x40],	%l2
	umulcc	%i4,	0x108D,	%o7
	movcs	%xcc,	%o1,	%l0
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	movn	%icc,	%i1,	%l5
	pdist	%f8,	%f16,	%f30
	add	%i7,	0x0E41,	%i2
	movpos	%xcc,	%g1,	%l6
	movl	%icc,	%o3,	%o4
	ldsb	[%l7 + 0x15],	%o0
	mulscc	%g6,	0x0C25,	%o5
	smulcc	%g7,	%l1,	%o2
	edge8n	%o6,	%i5,	%g5
	movleu	%icc,	%g3,	%g2
	ldsw	[%l7 + 0x74],	%l4
	fmovrsgez	%g4,	%f8,	%f3
	sethi	0x0CE7,	%l3
	fmovdcc	%xcc,	%f26,	%f31
	movrne	%i4,	0x39C,	%o7
	smul	%l2,	%l0,	%i3
	ld	[%l7 + 0x78],	%f5
	sethi	0x073C,	%i6
	ldsw	[%l7 + 0x58],	%i0
	fmovsne	%xcc,	%f10,	%f15
	add	%o1,	%i1,	%i7
	std	%f28,	[%l7 + 0x28]
	edge32	%i2,	%l5,	%g1
	array8	%l6,	%o4,	%o3
	fcmpgt16	%f18,	%f18,	%o0
	edge8	%o5,	%g7,	%l1
	ldsh	[%l7 + 0x74],	%g6
	edge32n	%o6,	%i5,	%g5
	edge16l	%o2,	%g3,	%g2
	sllx	%g4,	%l4,	%l3
	ldsw	[%l7 + 0x18],	%o7
	smul	%i4,	%l2,	%l0
	fands	%f29,	%f29,	%f11
	srlx	%i6,	%i3,	%o1
	fmovsvc	%xcc,	%f20,	%f9
	sdivcc	%i1,	0x07D5,	%i0
	and	%i7,	0x0150,	%i2
	st	%f20,	[%l7 + 0x1C]
	ldd	[%l7 + 0x68],	%l4
	fmovrdlez	%g1,	%f0,	%f2
	fcmpeq32	%f26,	%f28,	%l6
	fsrc2	%f12,	%f12
	fmovsgu	%xcc,	%f22,	%f9
	edge8ln	%o4,	%o0,	%o3
	movvs	%xcc,	%g7,	%o5
	ldsh	[%l7 + 0x24],	%g6
	fmovrde	%l1,	%f6,	%f20
	sdiv	%i5,	0x16E5,	%g5
	edge8n	%o2,	%g3,	%o6
	fmovdg	%icc,	%f2,	%f9
	movrgez	%g2,	%l4,	%g4
	stb	%l3,	[%l7 + 0x53]
	nop
	set	0x50, %g1
	std	%f0,	[%l7 + %g1]
	popc	%i4,	%l2
	fmovdn	%xcc,	%f11,	%f24
	xor	%l0,	%o7,	%i6
	array32	%i3,	%i1,	%o1
	fmovdg	%xcc,	%f17,	%f23
	edge32l	%i0,	%i7,	%l5
	lduh	[%l7 + 0x10],	%i2
	movpos	%xcc,	%l6,	%g1
	movne	%icc,	%o4,	%o0
	ldsh	[%l7 + 0x64],	%g7
	fmovdgu	%icc,	%f24,	%f20
	fmovdcc	%xcc,	%f3,	%f14
	ld	[%l7 + 0x4C],	%f17
	andcc	%o3,	%o5,	%g6
	sdivx	%l1,	0x098D,	%g5
	std	%f16,	[%l7 + 0x68]
	edge32ln	%i5,	%g3,	%o6
	xnor	%o2,	0x163F,	%g2
	movrgez	%g4,	%l3,	%l4
	fnot2s	%f2,	%f9
	fmovrsgez	%l2,	%f28,	%f24
	movcs	%xcc,	%i4,	%l0
	fmovsne	%xcc,	%f31,	%f30
	umul	%o7,	0x1C57,	%i3
	array8	%i6,	%i1,	%o1
	ldd	[%l7 + 0x30],	%f30
	smul	%i0,	0x105E,	%i7
	fmul8ulx16	%f4,	%f28,	%f10
	ldd	[%l7 + 0x60],	%f28
	fsrc2s	%f5,	%f7
	smulcc	%i2,	0x0F0F,	%l5
	fabss	%f31,	%f6
	and	%g1,	0x07F3,	%o4
	move	%icc,	%l6,	%g7
	addccc	%o3,	%o0,	%g6
	movrlz	%l1,	0x143,	%g5
	fmovrsgez	%o5,	%f15,	%f23
	sub	%g3,	%o6,	%o2
	stx	%g2,	[%l7 + 0x60]
	alignaddr	%g4,	%l3,	%l4
	edge16n	%l2,	%i4,	%i5
	lduw	[%l7 + 0x58],	%l0
	fmul8sux16	%f6,	%f10,	%f12
	udivx	%o7,	0x12C3,	%i6
	mulscc	%i3,	%o1,	%i1
	fcmpeq16	%f6,	%f6,	%i7
	ldd	[%l7 + 0x70],	%i0
	stx	%l5,	[%l7 + 0x60]
	umul	%g1,	%i2,	%l6
	movrlz	%o4,	%o3,	%o0
	edge8	%g7,	%l1,	%g6
	sdiv	%g5,	0x00FE,	%o5
	fpack16	%f6,	%f5
	stb	%g3,	[%l7 + 0x1E]
	xnor	%o6,	%g2,	%o2
	std	%f28,	[%l7 + 0x20]
	andncc	%g4,	%l4,	%l2
	and	%i4,	%i5,	%l3
	alignaddr	%o7,	%l0,	%i3
	addccc	%o1,	0x0D3A,	%i6
	fpsub16	%f18,	%f0,	%f14
	fmovrdlez	%i7,	%f6,	%f30
	fmul8x16	%f13,	%f6,	%f14
	add	%i0,	0x142B,	%i1
	array16	%g1,	%l5,	%l6
	stx	%o4,	[%l7 + 0x38]
	movpos	%icc,	%o3,	%o0
	fmovrdlez	%g7,	%f12,	%f20
	sethi	0x17B6,	%l1
	fmul8ulx16	%f10,	%f10,	%f6
	popc	%g6,	%g5
	movrlez	%o5,	%i2,	%o6
	edge8	%g2,	%g3,	%o2
	fandnot1	%f30,	%f2,	%f30
	fmovdge	%icc,	%f8,	%f12
	sir	0x0946
	array32	%l4,	%g4,	%i4
	andcc	%l2,	0x1DF0,	%l3
	alignaddr	%o7,	%l0,	%i3
	movl	%icc,	%i5,	%o1
	srl	%i7,	0x0E,	%i0
	xor	%i6,	%g1,	%l5
	addc	%l6,	%i1,	%o3
	sethi	0x0870,	%o4
	ldsb	[%l7 + 0x16],	%g7
	movrgez	%o0,	0x235,	%g6
	fnor	%f10,	%f6,	%f28
	stw	%g5,	[%l7 + 0x3C]
	movn	%icc,	%l1,	%o5
	umul	%i2,	%o6,	%g2
	edge32l	%o2,	%l4,	%g4
	ldsh	[%l7 + 0x2A],	%g3
	fmovrdgez	%i4,	%f12,	%f24
	stb	%l3,	[%l7 + 0x09]
	movrlz	%o7,	%l2,	%l0
	fmovsvc	%xcc,	%f12,	%f7
	addcc	%i5,	%i3,	%i7
	ldx	[%l7 + 0x28],	%o1
	movg	%xcc,	%i0,	%g1
	fmovsn	%xcc,	%f28,	%f27
	udivx	%l5,	0x146B,	%l6
	movl	%icc,	%i6,	%o3
	orn	%i1,	0x0385,	%g7
	fmovd	%f12,	%f8
	udivcc	%o0,	0x1B41,	%o4
	movpos	%xcc,	%g6,	%g5
	addc	%l1,	%i2,	%o6
	or	%o5,	%o2,	%l4
	udivx	%g4,	0x05BF,	%g3
	subc	%i4,	%l3,	%o7
	or	%g2,	0x17BE,	%l2
	fpsub16s	%f4,	%f5,	%f21
	fxnor	%f10,	%f10,	%f0
	andcc	%i5,	0x161F,	%i3
	edge8l	%i7,	%o1,	%i0
	fcmpes	%fcc2,	%f25,	%f29
	and	%g1,	%l5,	%l0
	movne	%xcc,	%l6,	%i6
	movn	%icc,	%o3,	%i1
	xorcc	%o0,	0x1F62,	%g7
	ldsw	[%l7 + 0x74],	%o4
	fnegs	%f1,	%f5
	xorcc	%g5,	%l1,	%i2
	stb	%g6,	[%l7 + 0x7B]
	movgu	%icc,	%o5,	%o6
	movcc	%xcc,	%l4,	%g4
	fcmpgt32	%f6,	%f0,	%o2
	stb	%g3,	[%l7 + 0x72]
	orcc	%l3,	0x161B,	%o7
	movvs	%xcc,	%g2,	%i4
	ld	[%l7 + 0x44],	%f15
	movvc	%xcc,	%i5,	%i3
	fcmps	%fcc0,	%f6,	%f12
	sth	%l2,	[%l7 + 0x72]
	std	%f4,	[%l7 + 0x38]
	ldub	[%l7 + 0x0F],	%o1
	ldsh	[%l7 + 0x72],	%i7
	movrgz	%i0,	%g1,	%l0
	fmul8ulx16	%f2,	%f22,	%f30
	addc	%l5,	%l6,	%i6
	smulcc	%i1,	0x1052,	%o3
	sdivcc	%o0,	0x0810,	%o4
	xor	%g7,	0x10FA,	%l1
	mulx	%g5,	0x045A,	%g6
	array8	%i2,	%o5,	%l4
	fmovsle	%xcc,	%f3,	%f0
	fmovdcc	%icc,	%f5,	%f7
	popc	%o6,	%g4
	fmovdleu	%xcc,	%f7,	%f30
	mulscc	%o2,	0x1357,	%g3
	movvs	%icc,	%l3,	%g2
	orncc	%i4,	%i5,	%i3
	fmovrde	%o7,	%f22,	%f26
	fmovrdlz	%l2,	%f4,	%f10
	orncc	%i7,	%o1,	%i0
	fmovs	%f20,	%f25
	edge32n	%g1,	%l0,	%l6
	fone	%f10
	edge32l	%l5,	%i1,	%i6
	ld	[%l7 + 0x24],	%f10
	fmovsneg	%xcc,	%f1,	%f29
	fcmpne32	%f8,	%f4,	%o0
	st	%f30,	[%l7 + 0x64]
	add	%o4,	%g7,	%o3
	fnors	%f5,	%f27,	%f13
	array8	%g5,	%l1,	%i2
	andncc	%g6,	%l4,	%o5
	edge32l	%g4,	%o2,	%g3
	sdiv	%l3,	0x0939,	%g2
	fmovdcc	%icc,	%f14,	%f30
	fornot1	%f0,	%f26,	%f8
	xnorcc	%o6,	0x1002,	%i4
	nop
	set	0x45, %o3
	ldub	[%l7 + %o3],	%i3
	mova	%icc,	%o7,	%i5
	fornot1s	%f27,	%f12,	%f29
	edge32ln	%l2,	%i7,	%o1
	umul	%g1,	%l0,	%i0
	sir	0x08B1
	st	%f25,	[%l7 + 0x20]
	movgu	%xcc,	%l6,	%i1
	move	%xcc,	%i6,	%o0
	fmovrdlz	%l5,	%f26,	%f10
	sethi	0x1A4A,	%o4
	mova	%xcc,	%g7,	%g5
	ldd	[%l7 + 0x28],	%l0
	movge	%xcc,	%o3,	%g6
	sth	%i2,	[%l7 + 0x62]
	movvs	%xcc,	%o5,	%g4
	movpos	%xcc,	%l4,	%g3
	fmovsgu	%icc,	%f13,	%f14
	movpos	%icc,	%o2,	%g2
	movl	%icc,	%o6,	%i4
	movvc	%icc,	%i3,	%l3
	fmul8ulx16	%f14,	%f12,	%f2
	movle	%icc,	%i5,	%o7
	umulcc	%i7,	0x1D25,	%o1
	fpack16	%f18,	%f3
	srax	%l2,	0x10,	%g1
	umul	%l0,	0x03E5,	%i0
	addcc	%i1,	0x0925,	%l6
	movvc	%xcc,	%i6,	%l5
	movrgz	%o0,	%o4,	%g5
	fmovrslz	%l1,	%f30,	%f29
	st	%f5,	[%l7 + 0x30]
	sra	%o3,	%g6,	%g7
	srl	%i2,	0x08,	%g4
	movrgez	%o5,	0x024,	%g3
	stx	%l4,	[%l7 + 0x48]
	addc	%o2,	0x14E9,	%o6
	srax	%g2,	%i3,	%l3
	edge32ln	%i5,	%o7,	%i7
	array16	%o1,	%i4,	%g1
	umul	%l0,	0x193C,	%l2
	stb	%i0,	[%l7 + 0x5B]
	fmovrslz	%i1,	%f18,	%f19
	fmovs	%f23,	%f24
	edge32ln	%i6,	%l6,	%o0
	movgu	%xcc,	%l5,	%o4
	addcc	%g5,	%l1,	%o3
	std	%f24,	[%l7 + 0x10]
	xnorcc	%g6,	0x1BB5,	%g7
	edge32	%i2,	%o5,	%g3
	movg	%icc,	%g4,	%o2
	andcc	%o6,	0x10B5,	%l4
	addccc	%i3,	%l3,	%g2
	udivcc	%i5,	0x110D,	%i7
	fornot2s	%f24,	%f8,	%f10
	edge16ln	%o7,	%i4,	%o1
	movvc	%xcc,	%l0,	%g1
	edge32l	%l2,	%i1,	%i0
	movrgz	%l6,	0x286,	%i6
	andncc	%o0,	%o4,	%l5
	fmovdge	%icc,	%f16,	%f30
	sdiv	%g5,	0x09A7,	%o3
	fnor	%f14,	%f16,	%f8
	orn	%g6,	0x063A,	%g7
	addccc	%l1,	%o5,	%g3
	st	%f30,	[%l7 + 0x2C]
	fmovda	%xcc,	%f18,	%f10
	fands	%f29,	%f10,	%f18
	ldd	[%l7 + 0x10],	%g4
	move	%icc,	%o2,	%o6
	fmul8x16au	%f31,	%f0,	%f12
	subccc	%i2,	%i3,	%l4
	nop
	set	0x0C, %i0
	lduh	[%l7 + %i0],	%g2
	edge32	%i5,	%l3,	%o7
	edge16	%i7,	%i4,	%o1
	edge32l	%l0,	%g1,	%i1
	ldsb	[%l7 + 0x72],	%l2
	edge8	%l6,	%i0,	%o0
	movrgz	%o4,	0x348,	%l5
	movvc	%xcc,	%g5,	%i6
	srlx	%o3,	0x1A,	%g6
	array16	%l1,	%o5,	%g3
	ldsw	[%l7 + 0x68],	%g7
	array16	%g4,	%o6,	%i2
	mova	%xcc,	%o2,	%l4
	movge	%icc,	%g2,	%i5
	orn	%l3,	0x1456,	%i3
	fnot1	%f2,	%f8
	fzeros	%f27
	sir	0x1F2A
	orcc	%o7,	%i7,	%i4
	edge8n	%l0,	%o1,	%g1
	movrgz	%i1,	%l6,	%l2
	and	%i0,	%o4,	%o0
	add	%l5,	%g5,	%i6
	ldub	[%l7 + 0x41],	%o3
	fmovrsne	%l1,	%f24,	%f15
	mulscc	%g6,	%o5,	%g7
	orncc	%g3,	%g4,	%i2
	orncc	%o2,	%l4,	%g2
	fzeros	%f8
	fands	%f6,	%f29,	%f25
	fmovdcs	%xcc,	%f2,	%f27
	edge32l	%i5,	%l3,	%i3
	mulscc	%o6,	0x18B4,	%o7
	movvc	%xcc,	%i7,	%l0
	fmovrsne	%o1,	%f7,	%f23
	sir	0x062D
	sra	%g1,	%i4,	%i1
	umul	%l2,	%i0,	%l6
	ldsb	[%l7 + 0x32],	%o4
	edge16ln	%l5,	%g5,	%i6
	sth	%o0,	[%l7 + 0x4E]
	or	%o3,	%g6,	%l1
	nop
	set	0x18, %l6
	std	%f10,	[%l7 + %l6]
	movrgz	%g7,	%g3,	%g4
	movvc	%icc,	%i2,	%o2
	movleu	%icc,	%l4,	%g2
	xnor	%i5,	%o5,	%i3
	fmovdpos	%xcc,	%f17,	%f18
	movre	%l3,	0x102,	%o6
	fexpand	%f18,	%f16
	movl	%xcc,	%o7,	%i7
	smulcc	%o1,	0x09B4,	%g1
	move	%xcc,	%i4,	%i1
	fmovdneg	%icc,	%f16,	%f28
	ldd	[%l7 + 0x58],	%f6
	xorcc	%l0,	%i0,	%l2
	fcmpeq16	%f10,	%f4,	%o4
	sll	%l6,	0x08,	%g5
	andncc	%l5,	%i6,	%o0
	fmovse	%icc,	%f7,	%f23
	movpos	%xcc,	%o3,	%l1
	movgu	%icc,	%g6,	%g3
	xor	%g7,	%i2,	%g4
	smul	%o2,	%l4,	%i5
	movcs	%xcc,	%o5,	%g2
	fmovdpos	%xcc,	%f2,	%f6
	fands	%f17,	%f2,	%f27
	movrne	%i3,	%o6,	%o7
	edge8ln	%i7,	%l3,	%o1
	fpack32	%f24,	%f22,	%f26
	fmul8x16au	%f7,	%f2,	%f8
	movvc	%icc,	%g1,	%i1
	and	%i4,	%i0,	%l2
	umul	%o4,	%l6,	%l0
	move	%icc,	%l5,	%i6
	stx	%o0,	[%l7 + 0x28]
	mova	%xcc,	%o3,	%l1
	array8	%g6,	%g5,	%g7
	xor	%g3,	%i2,	%o2
	movvc	%xcc,	%l4,	%i5
	edge16	%o5,	%g4,	%g2
	fzero	%f2
	fmovdl	%xcc,	%f11,	%f29
	movvs	%xcc,	%o6,	%i3
	sdivcc	%o7,	0x0169,	%l3
	fcmpgt16	%f30,	%f24,	%o1
	fmovde	%icc,	%f14,	%f31
	movneg	%xcc,	%i7,	%g1
	ldx	[%l7 + 0x48],	%i1
	fmovsgu	%icc,	%f20,	%f4
	ldsw	[%l7 + 0x10],	%i4
	save %l2, 0x14CA, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f0,	%f4
	fornot2	%f6,	%f24,	%f18
	fmovdle	%xcc,	%f30,	%f6
	andncc	%o4,	%l6,	%l5
	movl	%xcc,	%i6,	%o0
	move	%icc,	%o3,	%l1
	andncc	%l0,	%g6,	%g7
	movcs	%icc,	%g3,	%i2
	fmovd	%f12,	%f14
	stx	%g5,	[%l7 + 0x40]
	subccc	%l4,	0x193D,	%i5
	fmovsvc	%xcc,	%f31,	%f17
	edge8n	%o2,	%g4,	%o5
	fpsub16	%f22,	%f10,	%f14
	xorcc	%o6,	0x0890,	%i3
	srax	%g2,	%o7,	%l3
	ldsh	[%l7 + 0x1C],	%o1
	or	%g1,	0x18A8,	%i7
	edge16	%i4,	%l2,	%i0
	fpadd16	%f28,	%f28,	%f30
	sdiv	%i1,	0x195C,	%l6
	movl	%xcc,	%o4,	%i6
	movre	%l5,	%o0,	%l1
	umul	%l0,	0x1F68,	%g6
	alignaddrl	%o3,	%g7,	%i2
	mova	%xcc,	%g3,	%g5
	ldx	[%l7 + 0x58],	%l4
	movle	%icc,	%o2,	%i5
	and	%o5,	0x0A51,	%g4
	fmovdne	%icc,	%f7,	%f5
	sdiv	%o6,	0x058D,	%i3
	addcc	%o7,	0x0CF8,	%g2
	edge16ln	%o1,	%l3,	%i7
	sllx	%g1,	0x1A,	%i4
	andn	%i0,	0x0D26,	%i1
	orncc	%l2,	0x0B9B,	%o4
	movpos	%xcc,	%i6,	%l5
	edge32l	%o0,	%l1,	%l6
	ldsw	[%l7 + 0x2C],	%g6
	fcmped	%fcc1,	%f24,	%f26
	fmovrse	%l0,	%f8,	%f28
	movle	%xcc,	%g7,	%o3
	smulcc	%g3,	0x198B,	%i2
	lduh	[%l7 + 0x70],	%l4
	sll	%g5,	0x09,	%o2
	andncc	%i5,	%g4,	%o6
	edge32	%i3,	%o7,	%o5
	udiv	%o1,	0x0BEE,	%l3
	xnorcc	%i7,	0x0B34,	%g2
	srl	%i4,	%i0,	%i1
	fmovdle	%xcc,	%f23,	%f21
	addc	%l2,	0x0A9A,	%o4
	move	%xcc,	%i6,	%g1
	movne	%xcc,	%o0,	%l5
	movpos	%icc,	%l1,	%g6
	ldsb	[%l7 + 0x45],	%l6
	movleu	%xcc,	%l0,	%g7
	udivx	%g3,	0x055E,	%o3
	movpos	%icc,	%i2,	%g5
	orncc	%l4,	0x1FED,	%o2
	addcc	%g4,	%o6,	%i3
	fxnors	%f8,	%f13,	%f4
	fabss	%f15,	%f13
	array16	%o7,	%i5,	%o5
	fmovd	%f20,	%f24
	umulcc	%l3,	0x1910,	%o1
	edge32	%i7,	%i4,	%g2
	faligndata	%f26,	%f14,	%f18
	ld	[%l7 + 0x20],	%f1
	sdivx	%i0,	0x0802,	%l2
	movrlz	%i1,	%o4,	%i6
	add	%g1,	%o0,	%l5
	movvs	%icc,	%g6,	%l6
	smul	%l0,	0x0594,	%g7
	edge8l	%g3,	%o3,	%i2
	orcc	%l1,	0x1178,	%l4
	movrlez	%g5,	%g4,	%o2
	sub	%o6,	0x009A,	%o7
	movn	%xcc,	%i5,	%o5
	ldd	[%l7 + 0x48],	%f28
	move	%xcc,	%l3,	%i3
	fmovsle	%xcc,	%f22,	%f31
	lduw	[%l7 + 0x7C],	%o1
	fmovsvs	%icc,	%f9,	%f20
	movn	%icc,	%i4,	%i7
	fone	%f24
	subcc	%g2,	0x0200,	%i0
	udiv	%l2,	0x0C85,	%i1
	mulscc	%o4,	0x01C5,	%g1
	add	%o0,	%i6,	%l5
	addccc	%g6,	0x036B,	%l0
	movne	%icc,	%l6,	%g7
	movpos	%xcc,	%o3,	%g3
	xnorcc	%l1,	%i2,	%l4
	udivx	%g4,	0x0C02,	%g5
	edge32n	%o2,	%o6,	%o7
	edge16l	%i5,	%l3,	%i3
	movcc	%icc,	%o1,	%o5
	save %i7, %g2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%l2,	%i0
	stx	%i1,	[%l7 + 0x60]
	xnor	%g1,	0x06C3,	%o4
	movrlez	%i6,	0x259,	%l5
	st	%f18,	[%l7 + 0x40]
	fornot1	%f22,	%f10,	%f4
	movpos	%xcc,	%g6,	%o0
	umul	%l0,	0x0FE0,	%l6
	orncc	%g7,	%g3,	%l1
	umulcc	%o3,	%i2,	%g4
	orncc	%g5,	%o2,	%l4
	movrne	%o6,	0x148,	%i5
	restore %o7, 0x1C6A, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i3,	%o1,	%i7
	xorcc	%o5,	0x0520,	%g2
	add	%i4,	%i0,	%l2
	movg	%xcc,	%g1,	%o4
	movle	%xcc,	%i1,	%l5
	alignaddrl	%i6,	%g6,	%o0
	popc	0x0A64,	%l6
	fmovrsgez	%g7,	%f21,	%f19
	fmovsleu	%icc,	%f9,	%f20
	fcmpne32	%f20,	%f2,	%l0
	udivx	%g3,	0x12A6,	%o3
	fmovsge	%icc,	%f21,	%f3
	movrlez	%l1,	0x3E8,	%g4
	orncc	%i2,	0x065F,	%o2
	udivx	%g5,	0x0B67,	%o6
	st	%f4,	[%l7 + 0x2C]
	fpackfix	%f2,	%f17
	edge32ln	%i5,	%o7,	%l4
	edge16n	%l3,	%i3,	%i7
	sethi	0x0102,	%o1
	srlx	%g2,	%i4,	%o5
	addcc	%i0,	%l2,	%g1
	or	%i1,	0x0A6F,	%o4
	stx	%l5,	[%l7 + 0x50]
	mova	%xcc,	%g6,	%o0
	nop
	set	0x50, %l3
	lduw	[%l7 + %l3],	%i6
	andn	%l6,	%l0,	%g7
	sra	%o3,	0x19,	%l1
	or	%g3,	%i2,	%g4
	ldsh	[%l7 + 0x7C],	%o2
	movrlez	%g5,	%o6,	%o7
	srlx	%l4,	0x02,	%l3
	orn	%i3,	%i7,	%o1
	fmovdn	%icc,	%f10,	%f19
	popc	%i5,	%i4
	array8	%g2,	%i0,	%l2
	lduw	[%l7 + 0x3C],	%o5
	udivx	%g1,	0x05B4,	%i1
	mulx	%o4,	0x0A81,	%l5
	fmovdne	%icc,	%f7,	%f5
	fmovrsgz	%o0,	%f20,	%f30
	ldsh	[%l7 + 0x40],	%i6
	fpadd16	%f14,	%f0,	%f28
	ldx	[%l7 + 0x58],	%g6
	edge8ln	%l0,	%g7,	%o3
	or	%l1,	%l6,	%g3
	st	%f17,	[%l7 + 0x20]
	fnot2s	%f16,	%f30
	subc	%i2,	%o2,	%g4
	movleu	%icc,	%g5,	%o6
	sth	%l4,	[%l7 + 0x56]
	nop
	set	0x4C, %o7
	lduh	[%l7 + %o7],	%o7
	fone	%f26
	movre	%i3,	%i7,	%o1
	addccc	%i5,	0x11F3,	%l3
	edge8	%g2,	%i4,	%i0
	movgu	%xcc,	%o5,	%g1
	fsrc1s	%f17,	%f8
	sllx	%l2,	%i1,	%l5
	subcc	%o4,	0x0EDD,	%i6
	sdivx	%o0,	0x1C9E,	%l0
	fmovsgu	%icc,	%f3,	%f28
	andncc	%g6,	%o3,	%l1
	ldd	[%l7 + 0x68],	%g6
	fcmpne32	%f8,	%f18,	%g3
	fmovs	%f1,	%f5
	sll	%l6,	0x17,	%i2
	ldx	[%l7 + 0x68],	%o2
	sllx	%g4,	0x07,	%g5
	srlx	%o6,	0x0F,	%l4
	sth	%i3,	[%l7 + 0x3C]
	edge16n	%o7,	%o1,	%i7
	fabss	%f28,	%f13
	fmovs	%f8,	%f29
	st	%f21,	[%l7 + 0x58]
	mulx	%i5,	%g2,	%i4
	edge32ln	%l3,	%i0,	%g1
	addcc	%o5,	%l2,	%l5
	fornot1s	%f26,	%f30,	%f25
	fnegs	%f28,	%f20
	orcc	%o4,	0x184B,	%i1
	xnor	%i6,	%o0,	%g6
	movvc	%xcc,	%o3,	%l1
	sth	%g7,	[%l7 + 0x1C]
	stb	%g3,	[%l7 + 0x52]
	fpsub32	%f10,	%f24,	%f20
	movne	%xcc,	%l6,	%i2
	movrgz	%l0,	0x3DC,	%o2
	fmovdle	%xcc,	%f24,	%f5
	ldub	[%l7 + 0x68],	%g4
	addccc	%g5,	0x08E6,	%o6
	udivcc	%i3,	0x0410,	%l4
	fandnot1s	%f18,	%f13,	%f27
	sra	%o1,	0x1E,	%o7
	sethi	0x0935,	%i5
	edge16	%i7,	%g2,	%i4
	fmovscc	%xcc,	%f8,	%f31
	nop
	set	0x77, %g2
	ldsb	[%l7 + %g2],	%l3
	and	%i0,	%o5,	%g1
	fmovsvc	%xcc,	%f28,	%f27
	fmovrse	%l2,	%f17,	%f28
	movle	%icc,	%l5,	%i1
	fcmpne16	%f30,	%f20,	%i6
	movl	%xcc,	%o0,	%o4
	edge32ln	%g6,	%l1,	%g7
	fmuld8sux16	%f17,	%f13,	%f2
	sra	%g3,	%l6,	%i2
	st	%f10,	[%l7 + 0x60]
	sethi	0x0665,	%o3
	fmovrse	%l0,	%f6,	%f11
	fmul8sux16	%f16,	%f30,	%f4
	udivcc	%o2,	0x0D5F,	%g5
	fmovrsne	%o6,	%f1,	%f9
	addccc	%i3,	%l4,	%g4
	srlx	%o1,	%o7,	%i5
	ldsw	[%l7 + 0x6C],	%i7
	movge	%xcc,	%g2,	%l3
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	edge32l	%i4,	%l5,	%l2
	sdivcc	%i6,	0x0A13,	%i1
	umul	%o4,	0x0075,	%o0
	fmovscc	%xcc,	%f14,	%f23
	xor	%g6,	%l1,	%g3
	edge8ln	%l6,	%g7,	%i2
	std	%f8,	[%l7 + 0x60]
	orcc	%o3,	0x1D48,	%l0
	ld	[%l7 + 0x10],	%f1
	fpadd32s	%f5,	%f4,	%f9
	fnot2s	%f29,	%f13
	st	%f24,	[%l7 + 0x54]
	addc	%g5,	0x09BD,	%o2
	movleu	%icc,	%i3,	%o6
	fornot1	%f22,	%f8,	%f8
	fmovsa	%icc,	%f1,	%f31
	fornot1s	%f23,	%f29,	%f18
	movcc	%xcc,	%g4,	%o1
	faligndata	%f10,	%f24,	%f26
	addcc	%o7,	0x1FA6,	%l4
	fcmple16	%f18,	%f22,	%i5
	sra	%g2,	0x08,	%i7
	fmul8sux16	%f26,	%f24,	%f6
	fnors	%f29,	%f5,	%f9
	orcc	%i0,	0x0C3E,	%o5
	fpadd32	%f26,	%f8,	%f10
	fcmple32	%f18,	%f10,	%g1
	movg	%icc,	%i4,	%l3
	orn	%l2,	0x16D3,	%i6
	edge8	%l5,	%o4,	%i1
	movleu	%xcc,	%o0,	%g6
	edge8	%g3,	%l1,	%l6
	movvs	%icc,	%i2,	%g7
	xorcc	%o3,	%g5,	%o2
	srax	%i3,	0x19,	%o6
	edge32	%l0,	%o1,	%g4
	fnand	%f10,	%f16,	%f2
	srlx	%o7,	%i5,	%g2
	fandnot1	%f10,	%f4,	%f10
	ldd	[%l7 + 0x10],	%f10
	fand	%f18,	%f28,	%f28
	ldx	[%l7 + 0x30],	%i7
	sdivx	%i0,	0x1A6C,	%o5
	movre	%g1,	%i4,	%l4
	edge32n	%l3,	%l2,	%i6
	fpack16	%f18,	%f9
	xnorcc	%l5,	%o4,	%i1
	movge	%icc,	%o0,	%g6
	ldd	[%l7 + 0x70],	%g2
	fandnot1	%f8,	%f14,	%f18
	std	%f24,	[%l7 + 0x68]
	lduw	[%l7 + 0x1C],	%l1
	srax	%i2,	%l6,	%o3
	sir	0x15B6
	orcc	%g7,	0x175C,	%g5
	srlx	%i3,	%o6,	%l0
	udiv	%o2,	0x1546,	%o1
	stb	%g4,	[%l7 + 0x70]
	fxors	%f10,	%f5,	%f15
	orncc	%o7,	%g2,	%i7
	move	%xcc,	%i0,	%o5
	xor	%i5,	0x1320,	%g1
	add	%i4,	%l3,	%l2
	ldub	[%l7 + 0x0A],	%l4
	move	%icc,	%i6,	%l5
	movge	%icc,	%o4,	%i1
	movpos	%icc,	%g6,	%o0
	subc	%g3,	%l1,	%i2
	array8	%l6,	%o3,	%g7
	mova	%icc,	%g5,	%o6
	movne	%icc,	%l0,	%i3
	xnorcc	%o1,	%o2,	%g4
	fpack32	%f10,	%f6,	%f4
	restore %o7, %i7, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%o5,	%i0
	faligndata	%f20,	%f22,	%f8
	smulcc	%i5,	%g1,	%l3
	movleu	%xcc,	%l2,	%l4
	srl	%i4,	0x18,	%i6
	orn	%l5,	0x1EF9,	%i1
	fmul8ulx16	%f24,	%f22,	%f16
	edge8n	%o4,	%g6,	%o0
	addcc	%l1,	0x1D9D,	%i2
	addcc	%g3,	%o3,	%l6
	fmul8x16au	%f18,	%f6,	%f22
	sll	%g7,	%o6,	%g5
	movrlez	%i3,	0x1E0,	%l0
	and	%o1,	%o2,	%o7
	popc	0x08B0,	%g4
	edge32n	%g2,	%i7,	%o5
	fmovsne	%icc,	%f6,	%f12
	fmuld8sux16	%f12,	%f9,	%f22
	xnor	%i5,	%i0,	%g1
	ldub	[%l7 + 0x34],	%l2
	smul	%l3,	%i4,	%l4
	for	%f20,	%f10,	%f22
	edge16n	%i6,	%i1,	%l5
	lduw	[%l7 + 0x18],	%g6
	edge16l	%o0,	%l1,	%i2
	movgu	%xcc,	%g3,	%o4
	addccc	%o3,	0x05DF,	%l6
	stb	%o6,	[%l7 + 0x4F]
	udivx	%g7,	0x1023,	%i3
	move	%xcc,	%l0,	%o1
	edge16ln	%g5,	%o7,	%o2
	xnorcc	%g2,	%g4,	%i7
	fmovde	%xcc,	%f24,	%f19
	for	%f0,	%f16,	%f14
	movle	%xcc,	%o5,	%i0
	sub	%g1,	%i5,	%l2
	fxor	%f10,	%f6,	%f30
	fnegs	%f16,	%f14
	movre	%l3,	0x338,	%l4
	movpos	%icc,	%i6,	%i1
	addcc	%l5,	%g6,	%i4
	fmovrsne	%l1,	%f24,	%f30
	movpos	%icc,	%o0,	%g3
	udivcc	%o4,	0x1D04,	%o3
	mova	%xcc,	%i2,	%o6
	fmovsne	%xcc,	%f5,	%f28
	fcmple16	%f2,	%f8,	%l6
	sub	%g7,	0x1293,	%l0
	mulx	%o1,	0x166D,	%i3
	movrne	%g5,	%o2,	%o7
	edge8n	%g2,	%g4,	%i7
	srl	%o5,	0x09,	%i0
	fone	%f10
	ldx	[%l7 + 0x40],	%i5
	fcmpgt32	%f16,	%f28,	%g1
	fnegd	%f6,	%f24
	movrlez	%l3,	0x3A5,	%l2
	std	%f26,	[%l7 + 0x38]
	umulcc	%l4,	0x1A19,	%i6
	smul	%l5,	0x04CC,	%g6
	fmovdvc	%icc,	%f15,	%f15
	fzeros	%f25
	lduw	[%l7 + 0x38],	%i4
	edge16	%i1,	%o0,	%l1
	fsrc2	%f6,	%f28
	fpmerge	%f25,	%f3,	%f30
	fsrc1	%f8,	%f4
	fmovsn	%xcc,	%f16,	%f7
	fsrc1	%f6,	%f4
	subc	%g3,	%o4,	%o3
	ldd	[%l7 + 0x28],	%f16
	movg	%xcc,	%o6,	%l6
	subcc	%i2,	0x1BB1,	%l0
	ld	[%l7 + 0x54],	%f15
	edge8l	%g7,	%o1,	%g5
	st	%f27,	[%l7 + 0x2C]
	subc	%o2,	0x0AC7,	%o7
	movg	%xcc,	%i3,	%g4
	sethi	0x1150,	%g2
	orn	%i7,	0x1285,	%o5
	movre	%i5,	0x234,	%g1
	or	%i0,	0x14D0,	%l2
	sdiv	%l3,	0x19AD,	%l4
	umulcc	%i6,	0x1BD7,	%l5
	move	%xcc,	%g6,	%i4
	fpsub32s	%f30,	%f3,	%f27
	addccc	%i1,	%o0,	%g3
	fornot1s	%f12,	%f16,	%f29
	udivcc	%l1,	0x0535,	%o3
	addccc	%o4,	%l6,	%i2
	mulscc	%o6,	0x0F7D,	%g7
	edge16n	%o1,	%g5,	%l0
	fmovdl	%xcc,	%f16,	%f6
	nop
	set	0x16, %l0
	stb	%o7,	[%l7 + %l0]
	orncc	%o2,	%g4,	%g2
	ldsw	[%l7 + 0x4C],	%i3
	fnand	%f30,	%f10,	%f4
	edge8l	%i7,	%i5,	%o5
	fcmpd	%fcc0,	%f6,	%f30
	movleu	%xcc,	%g1,	%l2
	stb	%i0,	[%l7 + 0x5D]
	smulcc	%l4,	0x0079,	%l3
	fnot2	%f24,	%f14
	movvc	%xcc,	%i6,	%l5
	edge16n	%i4,	%g6,	%o0
	stx	%i1,	[%l7 + 0x18]
	movneg	%icc,	%l1,	%g3
	movne	%icc,	%o3,	%o4
	edge16l	%l6,	%i2,	%g7
	and	%o6,	%o1,	%g5
	movrlz	%l0,	0x1F0,	%o2
	alignaddr	%o7,	%g2,	%g4
	movre	%i7,	%i3,	%o5
	fcmpgt16	%f18,	%f30,	%g1
	xnor	%i5,	0x0915,	%l2
	edge8n	%i0,	%l3,	%l4
	edge8	%i6,	%i4,	%l5
	udiv	%o0,	0x1A66,	%g6
	fmovsle	%icc,	%f3,	%f8
	movpos	%icc,	%i1,	%l1
	move	%icc,	%o3,	%o4
	smulcc	%g3,	%l6,	%g7
	sll	%o6,	0x1D,	%o1
	for	%f22,	%f26,	%f6
	orncc	%g5,	%i2,	%l0
	fmovd	%f18,	%f16
	ldsb	[%l7 + 0x31],	%o2
	srax	%g2,	0x0F,	%g4
	subccc	%o7,	0x09AE,	%i7
	movpos	%icc,	%o5,	%i3
	orn	%i5,	%l2,	%i0
	fpadd32s	%f23,	%f18,	%f6
	ldx	[%l7 + 0x68],	%g1
	srax	%l4,	0x0B,	%l3
	sethi	0x05AA,	%i4
	array8	%l5,	%o0,	%i6
	sdivx	%g6,	0x0F14,	%l1
	save %i1, %o3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l6,	%g3,	%g7
	fpadd16	%f12,	%f10,	%f30
	alignaddrl	%o6,	%g5,	%o1
	andn	%l0,	%o2,	%g2
	fcmped	%fcc0,	%f14,	%f20
	array32	%g4,	%i2,	%o7
	ldx	[%l7 + 0x08],	%i7
	movcs	%xcc,	%i3,	%o5
	move	%xcc,	%l2,	%i0
	edge16	%i5,	%g1,	%l4
	srax	%l3,	%l5,	%i4
	fmovdcs	%xcc,	%f9,	%f10
	movre	%i6,	0x15A,	%o0
	movcc	%xcc,	%l1,	%g6
	fmovsl	%icc,	%f14,	%f4
	srl	%o3,	%i1,	%o4
	subcc	%g3,	%l6,	%o6
	fmovrse	%g7,	%f26,	%f0
	edge8ln	%o1,	%l0,	%o2
	fpadd32	%f16,	%f2,	%f6
	popc	%g2,	%g5
	sth	%i2,	[%l7 + 0x3C]
	sth	%o7,	[%l7 + 0x12]
	orcc	%i7,	0x1DEA,	%i3
	fmovdcc	%xcc,	%f29,	%f28
	fxor	%f14,	%f6,	%f12
	ld	[%l7 + 0x64],	%f19
	edge8n	%g4,	%l2,	%o5
	movn	%xcc,	%i0,	%i5
	fcmpne16	%f26,	%f0,	%l4
	fmovsvc	%xcc,	%f27,	%f14
	addccc	%g1,	%l3,	%l5
	edge16ln	%i6,	%i4,	%o0
	fmovrse	%g6,	%f26,	%f0
	sra	%o3,	0x09,	%i1
	sth	%l1,	[%l7 + 0x20]
	ld	[%l7 + 0x3C],	%f18
	ldd	[%l7 + 0x20],	%f0
	andncc	%g3,	%o4,	%l6
	andncc	%o6,	%g7,	%l0
	edge16l	%o2,	%o1,	%g5
	nop
	set	0x58, %l1
	ldd	[%l7 + %l1],	%f24
	movneg	%xcc,	%i2,	%g2
	fsrc2	%f12,	%f22
	array8	%o7,	%i3,	%i7
	addc	%g4,	0x17A0,	%o5
	fcmpes	%fcc3,	%f6,	%f11
	movrne	%i0,	0x370,	%l2
	edge16n	%i5,	%l4,	%g1
	andcc	%l5,	%l3,	%i6
	stw	%o0,	[%l7 + 0x54]
	edge8ln	%i4,	%g6,	%o3
	movleu	%icc,	%l1,	%i1
	movrne	%o4,	0x24F,	%l6
	stw	%o6,	[%l7 + 0x7C]
	edge32n	%g7,	%g3,	%o2
	movvc	%xcc,	%l0,	%o1
	sll	%i2,	0x16,	%g2
	subcc	%o7,	%i3,	%i7
	nop
	set	0x74, %i2
	ldsw	[%l7 + %i2],	%g5
	fmovdvs	%icc,	%f20,	%f4
	andcc	%o5,	%i0,	%g4
	addc	%i5,	0x1C4D,	%l4
	movn	%icc,	%g1,	%l2
	edge16l	%l3,	%i6,	%o0
	edge16ln	%l5,	%i4,	%g6
	fandnot2s	%f26,	%f30,	%f26
	movvs	%icc,	%o3,	%i1
	sdivcc	%l1,	0x0411,	%o4
	sll	%o6,	0x04,	%g7
	smulcc	%l6,	%o2,	%g3
	subccc	%l0,	0x19AE,	%i2
	fmuld8sux16	%f27,	%f20,	%f20
	and	%g2,	0x1A1A,	%o1
	smulcc	%i3,	%o7,	%i7
	alignaddrl	%o5,	%g5,	%i0
	ldsw	[%l7 + 0x24],	%i5
	ldd	[%l7 + 0x30],	%l4
	movvs	%icc,	%g4,	%l2
	ldsb	[%l7 + 0x08],	%g1
	fmuld8sux16	%f17,	%f17,	%f4
	movrlz	%i6,	%l3,	%o0
	orncc	%l5,	0x0ECD,	%i4
	mulscc	%o3,	%i1,	%g6
	edge16	%o4,	%l1,	%g7
	fornot1s	%f2,	%f19,	%f27
	udivcc	%l6,	0x0590,	%o2
	array16	%g3,	%l0,	%o6
	movre	%g2,	%i2,	%o1
	movge	%xcc,	%i3,	%i7
	sra	%o7,	%o5,	%g5
	lduw	[%l7 + 0x24],	%i0
	mova	%xcc,	%i5,	%g4
	fornot1	%f0,	%f10,	%f20
	movle	%icc,	%l2,	%l4
	stw	%i6,	[%l7 + 0x68]
	movrlz	%l3,	%g1,	%l5
	orcc	%o0,	0x0815,	%i4
	edge16ln	%o3,	%i1,	%g6
	ldd	[%l7 + 0x38],	%o4
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	edge16n	%o2,	%g3,	%g7
	movneg	%xcc,	%l0,	%o6
	mova	%icc,	%g2,	%i2
	save %i3, %o1, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f4,	%f24,	%f4
	subcc	%i7,	%o5,	%g5
	movvc	%xcc,	%i0,	%i5
	bshuffle	%f14,	%f28,	%f2
	sub	%l2,	%l4,	%g4
	fones	%f17
	movle	%icc,	%l3,	%i6
	movvs	%xcc,	%l5,	%o0
	sdivx	%i4,	0x123D,	%g1
	fcmpeq16	%f14,	%f10,	%i1
	ldsb	[%l7 + 0x32],	%g6
	fmovrslez	%o3,	%f24,	%f1
	ldsw	[%l7 + 0x2C],	%l1
	srl	%l6,	%o4,	%g3
	sth	%o2,	[%l7 + 0x22]
	sth	%g7,	[%l7 + 0x5C]
	andcc	%l0,	%o6,	%g2
	movrlez	%i3,	%i2,	%o1
	sll	%i7,	%o5,	%o7
	fornot2	%f24,	%f26,	%f16
	ldsh	[%l7 + 0x16],	%i0
	movcs	%xcc,	%i5,	%l2
	pdist	%f16,	%f14,	%f26
	st	%f23,	[%l7 + 0x58]
	orncc	%l4,	0x1E66,	%g5
	movle	%icc,	%g4,	%i6
	subccc	%l5,	%o0,	%i4
	fmovde	%icc,	%f27,	%f3
	edge16l	%g1,	%l3,	%g6
	andcc	%i1,	0x0A01,	%l1
	edge8l	%l6,	%o3,	%g3
	srl	%o4,	%g7,	%o2
	fpadd16s	%f26,	%f4,	%f21
	xnorcc	%l0,	%g2,	%o6
	fcmped	%fcc3,	%f22,	%f24
	edge8l	%i3,	%i2,	%o1
	edge16	%i7,	%o5,	%o7
	fpack32	%f30,	%f8,	%f8
	sllx	%i5,	%l2,	%l4
	fcmpeq16	%f4,	%f6,	%g5
	and	%i0,	0x17B7,	%i6
	srax	%l5,	0x1E,	%o0
	movvc	%xcc,	%g4,	%g1
	stx	%l3,	[%l7 + 0x38]
	movcs	%xcc,	%g6,	%i1
	fcmpgt16	%f4,	%f22,	%i4
	fmul8ulx16	%f6,	%f12,	%f26
	edge16ln	%l1,	%l6,	%g3
	and	%o4,	0x1A4E,	%o3
	movleu	%icc,	%o2,	%l0
	udiv	%g2,	0x1878,	%g7
	srl	%i3,	%o6,	%i2
	edge16ln	%i7,	%o5,	%o1
	array16	%i5,	%o7,	%l4
	sethi	0x0C8C,	%l2
	fmovde	%icc,	%f29,	%f18
	fmul8x16al	%f7,	%f31,	%f18
	orn	%g5,	%i6,	%i0
	sdivcc	%l5,	0x0DAF,	%g4
	sdivcc	%g1,	0x0406,	%o0
	lduw	[%l7 + 0x48],	%g6
	srlx	%i1,	%i4,	%l3
	movvc	%xcc,	%l6,	%g3
	fmul8x16	%f9,	%f30,	%f24
	fsrc2	%f4,	%f18
	movrne	%l1,	0x3C6,	%o3
	st	%f7,	[%l7 + 0x54]
	subc	%o4,	0x164C,	%o2
	edge8ln	%l0,	%g2,	%g7
	movne	%xcc,	%o6,	%i3
	movl	%icc,	%i7,	%o5
	movleu	%xcc,	%i2,	%i5
	lduh	[%l7 + 0x50],	%o1
	movge	%icc,	%o7,	%l2
	array32	%g5,	%l4,	%i6
	ldd	[%l7 + 0x30],	%i0
	fand	%f2,	%f10,	%f28
	fornot2	%f26,	%f26,	%f26
	movvs	%icc,	%g4,	%g1
	fmovdpos	%xcc,	%f4,	%f23
	stw	%o0,	[%l7 + 0x14]
	fmuld8ulx16	%f20,	%f12,	%f26
	edge8l	%l5,	%i1,	%g6
	fmovdne	%icc,	%f25,	%f1
	movl	%xcc,	%i4,	%l6
	fmovdge	%icc,	%f11,	%f13
	fmovrse	%g3,	%f18,	%f19
	fnot2	%f4,	%f12
	addcc	%l3,	0x1DC2,	%o3
	umul	%l1,	0x0DFF,	%o4
	ldd	[%l7 + 0x78],	%o2
	fmovdneg	%xcc,	%f5,	%f31
	smulcc	%l0,	%g7,	%o6
	fcmpne32	%f2,	%f28,	%g2
	sra	%i7,	0x1F,	%o5
	st	%f7,	[%l7 + 0x48]
	sdivx	%i2,	0x0920,	%i5
	edge8l	%o1,	%i3,	%o7
	fabsd	%f10,	%f22
	umulcc	%l2,	0x1DE7,	%l4
	fpackfix	%f28,	%f18
	subccc	%g5,	0x0076,	%i6
	fmuld8sux16	%f7,	%f24,	%f2
	movrlez	%g4,	%i0,	%g1
	subc	%l5,	0x0F0B,	%o0
	fmovsne	%icc,	%f29,	%f25
	movge	%icc,	%i1,	%g6
	xorcc	%l6,	0x0A08,	%i4
	fsrc1	%f26,	%f18
	stb	%l3,	[%l7 + 0x6C]
	xorcc	%o3,	%g3,	%o4
	srax	%o2,	0x1D,	%l0
	stb	%g7,	[%l7 + 0x7F]
	fmovscc	%icc,	%f31,	%f3
	edge8ln	%l1,	%g2,	%i7
	save %o6, %i2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2	%f4,	%f16,	%f12
	movne	%xcc,	%o1,	%o5
	movcc	%icc,	%i3,	%o7
	movrgz	%l2,	0x2A1,	%g5
	movpos	%icc,	%l4,	%g4
	movl	%xcc,	%i0,	%g1
	movrlz	%i6,	0x1A4,	%l5
	stb	%i1,	[%l7 + 0x60]
	umulcc	%g6,	0x11C4,	%l6
	udiv	%i4,	0x0F5D,	%o0
	ldsh	[%l7 + 0x10],	%o3
	andcc	%l3,	0x0135,	%o4
	fmovrdgez	%o2,	%f16,	%f20
	lduw	[%l7 + 0x74],	%g3
	mova	%xcc,	%l0,	%l1
	move	%xcc,	%g2,	%i7
	edge32n	%g7,	%o6,	%i5
	movn	%icc,	%o1,	%i2
	edge16l	%o5,	%i3,	%l2
	fmovd	%f20,	%f0
	movg	%xcc,	%o7,	%g5
	ld	[%l7 + 0x30],	%f10
	srax	%g4,	0x1D,	%l4
	fzero	%f18
	fcmpes	%fcc3,	%f18,	%f16
	sdivx	%i0,	0x095F,	%i6
	edge32ln	%l5,	%i1,	%g6
	sllx	%l6,	0x11,	%g1
	sethi	0x15C1,	%i4
	fsrc2	%f8,	%f6
	fands	%f29,	%f6,	%f14
	movrlz	%o3,	%l3,	%o4
	st	%f5,	[%l7 + 0x30]
	and	%o2,	0x1CD5,	%g3
	umulcc	%l0,	%o0,	%l1
	ldsh	[%l7 + 0x16],	%g2
	sra	%g7,	0x02,	%i7
	fpadd32	%f2,	%f22,	%f16
	lduh	[%l7 + 0x26],	%o6
	movrne	%i5,	0x14E,	%i2
	srl	%o1,	%i3,	%l2
	addccc	%o7,	%g5,	%o5
	udivcc	%l4,	0x09C3,	%i0
	movle	%icc,	%i6,	%l5
	fxnor	%f22,	%f16,	%f0
	ldsw	[%l7 + 0x54],	%i1
	movn	%icc,	%g6,	%l6
	fmovsneg	%xcc,	%f21,	%f18
	fmovrsgez	%g1,	%f8,	%f1
	sth	%i4,	[%l7 + 0x10]
	edge8ln	%o3,	%g4,	%o4
	movrgz	%o2,	0x224,	%g3
	andcc	%l0,	0x00B0,	%o0
	movrlz	%l3,	%g2,	%l1
	subc	%i7,	0x15E2,	%o6
	movne	%xcc,	%i5,	%g7
	fcmple32	%f18,	%f8,	%o1
	std	%f22,	[%l7 + 0x28]
	sra	%i3,	%i2,	%l2
	andcc	%o7,	%g5,	%o5
	fmovsge	%icc,	%f11,	%f23
	fmovsl	%xcc,	%f18,	%f3
	srax	%i0,	%l4,	%l5
	fmul8x16al	%f26,	%f15,	%f6
	xor	%i1,	%i6,	%g6
	sub	%g1,	0x1101,	%l6
	sllx	%o3,	0x0E,	%i4
	fand	%f16,	%f6,	%f6
	subcc	%o4,	%o2,	%g3
	xnor	%l0,	%g4,	%l3
	xnorcc	%o0,	%l1,	%i7
	sllx	%o6,	0x16,	%i5
	array8	%g7,	%o1,	%g2
	sllx	%i2,	%l2,	%i3
	fand	%f0,	%f26,	%f24
	fmovdpos	%icc,	%f7,	%f29
	movrlez	%o7,	%g5,	%i0
	or	%o5,	0x1798,	%l5
	addcc	%i1,	0x1EF1,	%l4
	alignaddr	%g6,	%g1,	%i6
	edge8ln	%o3,	%i4,	%o4
	movrlez	%l6,	0x05B,	%g3
	addc	%l0,	0x053F,	%g4
	fnegd	%f16,	%f30
	fcmpeq16	%f22,	%f24,	%l3
	array8	%o0,	%o2,	%l1
	fexpand	%f30,	%f20
	andncc	%o6,	%i5,	%i7
	sllx	%o1,	%g2,	%g7
	udivx	%i2,	0x18FE,	%i3
	ldub	[%l7 + 0x6D],	%l2
	edge16l	%o7,	%g5,	%i0
	fmovsl	%icc,	%f7,	%f25
	movvc	%icc,	%o5,	%l5
	nop
	set	0x34, %o2
	stw	%l4,	[%l7 + %o2]
	movrlez	%g6,	0x3E2,	%g1
	fmovdleu	%xcc,	%f13,	%f28
	movl	%xcc,	%i6,	%o3
	fsrc1s	%f21,	%f11
	sdivx	%i4,	0x1BEC,	%o4
	ldsh	[%l7 + 0x48],	%l6
	movgu	%icc,	%g3,	%i1
	movge	%xcc,	%g4,	%l3
	orncc	%o0,	0x10C7,	%l0
	fpack16	%f4,	%f24
	smul	%o2,	%o6,	%i5
	sll	%i7,	0x16,	%o1
	edge8n	%l1,	%g2,	%g7
	fmovrdgez	%i2,	%f18,	%f18
	srlx	%l2,	0x1E,	%o7
	orncc	%g5,	%i3,	%i0
	udivcc	%l5,	0x1781,	%l4
	movg	%xcc,	%o5,	%g1
	ldsh	[%l7 + 0x30],	%g6
	edge8l	%o3,	%i4,	%i6
	andcc	%l6,	0x0EA3,	%g3
	sdiv	%o4,	0x0B68,	%g4
	udiv	%i1,	0x09B5,	%l3
	fmul8x16	%f22,	%f26,	%f14
	movrne	%o0,	%o2,	%o6
	sllx	%l0,	0x16,	%i7
	array8	%i5,	%o1,	%g2
	movle	%icc,	%g7,	%l1
	sll	%i2,	0x18,	%l2
	movpos	%icc,	%g5,	%i3
	and	%o7,	%l5,	%l4
	udivcc	%i0,	0x0A9F,	%g1
	edge32ln	%o5,	%g6,	%o3
	xor	%i4,	0x024B,	%l6
	fmovrsgez	%i6,	%f26,	%f15
	and	%g3,	0x1D50,	%o4
	movgu	%xcc,	%i1,	%l3
	fpsub16	%f6,	%f0,	%f0
	st	%f1,	[%l7 + 0x44]
	smulcc	%g4,	%o0,	%o2
	srl	%l0,	%o6,	%i7
	umul	%i5,	%o1,	%g2
	subccc	%g7,	0x1A82,	%i2
	addccc	%l2,	0x1B1E,	%g5
	sra	%i3,	%l1,	%o7
	andcc	%l5,	%l4,	%i0
	movne	%xcc,	%g1,	%g6
	fpsub16s	%f6,	%f7,	%f26
	mulx	%o3,	0x04AB,	%i4
	alignaddrl	%o5,	%l6,	%i6
	restore %g3, 0x094E, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f24,	%f18,	%l3
	movrlz	%i1,	%o0,	%g4
	movne	%icc,	%l0,	%o6
	movvs	%icc,	%o2,	%i7
	or	%i5,	0x0755,	%o1
	and	%g2,	0x19BC,	%g7
	sdivx	%i2,	0x1391,	%g5
	sethi	0x01C1,	%i3
	movrgez	%l2,	%o7,	%l5
	st	%f11,	[%l7 + 0x50]
	stw	%l4,	[%l7 + 0x20]
	movneg	%icc,	%l1,	%i0
	and	%g6,	%o3,	%i4
	udivcc	%o5,	0x12AE,	%g1
	fmovde	%xcc,	%f2,	%f8
	movcs	%xcc,	%i6,	%g3
	fmovscs	%xcc,	%f29,	%f22
	sdivx	%o4,	0x08BA,	%l6
	ldsw	[%l7 + 0x58],	%l3
	movleu	%xcc,	%i1,	%g4
	lduh	[%l7 + 0x26],	%l0
	sdiv	%o6,	0x087D,	%o0
	subcc	%i7,	%o2,	%i5
	st	%f15,	[%l7 + 0x74]
	fcmple16	%f12,	%f4,	%g2
	movle	%icc,	%g7,	%i2
	movrne	%o1,	0x03B,	%i3
	andncc	%g5,	%o7,	%l5
	subc	%l4,	%l1,	%i0
	mulscc	%g6,	%o3,	%l2
	movrgz	%o5,	%g1,	%i6
	movl	%xcc,	%g3,	%i4
	movcs	%xcc,	%o4,	%l3
	movrgz	%i1,	0x18C,	%l6
	ldsb	[%l7 + 0x5B],	%g4
	umul	%o6,	%o0,	%l0
	movpos	%xcc,	%i7,	%i5
	fmovsvs	%xcc,	%f4,	%f12
	stb	%g2,	[%l7 + 0x24]
	alignaddr	%g7,	%o2,	%i2
	edge32l	%i3,	%o1,	%o7
	mulscc	%g5,	0x1868,	%l5
	subccc	%l1,	%i0,	%l4
	stw	%g6,	[%l7 + 0x68]
	alignaddr	%l2,	%o5,	%g1
	edge8	%i6,	%g3,	%o3
	andncc	%o4,	%i4,	%i1
	andncc	%l6,	%g4,	%o6
	movrlz	%o0,	0x261,	%l3
	movvc	%xcc,	%i7,	%l0
	mulscc	%g2,	0x0183,	%g7
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	movneg	%xcc,	%i3,	%o1
	lduw	[%l7 + 0x24],	%o7
	sth	%i2,	[%l7 + 0x08]
	save %l5, %l1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l4,	%g6,	%l2
	edge8n	%o5,	%i0,	%i6
	subcc	%g3,	0x1FCA,	%g1
	sll	%o4,	%i4,	%o3
	movge	%xcc,	%l6,	%i1
	xnorcc	%o6,	%g4,	%l3
	mova	%xcc,	%o0,	%i7
	array8	%l0,	%g7,	%o2
	ldx	[%l7 + 0x50],	%g2
	fmovdgu	%icc,	%f9,	%f8
	array32	%i5,	%o1,	%o7
	movl	%icc,	%i3,	%i2
	fmovdvc	%xcc,	%f22,	%f19
	sth	%l1,	[%l7 + 0x4E]
	edge8	%l5,	%l4,	%g5
	edge32ln	%l2,	%o5,	%i0
	srlx	%g6,	0x0B,	%i6
	addcc	%g1,	0x12A4,	%g3
	movvc	%icc,	%o4,	%i4
	sth	%l6,	[%l7 + 0x20]
	move	%icc,	%i1,	%o3
	edge16ln	%o6,	%l3,	%g4
	sir	0x16F0
	restore %i7, %o0, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%g7,	%g2
	movcc	%icc,	%i5,	%o2
	ldsh	[%l7 + 0x6E],	%o7
	movg	%xcc,	%o1,	%i3
	xnorcc	%i2,	0x0198,	%l5
	fandnot2	%f12,	%f30,	%f10
	mulx	%l4,	%g5,	%l1
	movrgez	%o5,	%l2,	%i0
	udiv	%g6,	0x103E,	%i6
	sllx	%g1,	0x13,	%g3
	umul	%i4,	%l6,	%i1
	fexpand	%f0,	%f4
	movvs	%icc,	%o4,	%o6
	ld	[%l7 + 0x70],	%f0
	fmovrslz	%l3,	%f15,	%f31
	fmovscc	%xcc,	%f11,	%f25
	fmovdpos	%xcc,	%f12,	%f30
	move	%icc,	%g4,	%o3
	srlx	%i7,	%l0,	%o0
	edge32ln	%g2,	%i5,	%o2
	fmovrslez	%o7,	%f15,	%f22
	std	%f0,	[%l7 + 0x38]
	fzeros	%f19
	mulx	%o1,	%g7,	%i3
	sub	%i2,	0x0B18,	%l5
	mulx	%g5,	%l4,	%o5
	addc	%l2,	%l1,	%i0
	lduw	[%l7 + 0x20],	%i6
	edge8	%g1,	%g3,	%g6
	lduw	[%l7 + 0x08],	%l6
	fmovdleu	%xcc,	%f15,	%f2
	and	%i4,	0x0189,	%o4
	edge32ln	%i1,	%l3,	%g4
	udivx	%o6,	0x14CF,	%i7
	fpadd32s	%f25,	%f6,	%f9
	addccc	%l0,	%o0,	%o3
	std	%f14,	[%l7 + 0x40]
	edge16l	%i5,	%g2,	%o2
	smulcc	%o7,	%o1,	%i3
	edge32ln	%i2,	%g7,	%l5
	fpadd16s	%f14,	%f10,	%f22
	sdivx	%l4,	0x1603,	%g5
	movcs	%icc,	%o5,	%l2
	sth	%i0,	[%l7 + 0x68]
	edge8	%i6,	%l1,	%g3
	movn	%icc,	%g6,	%g1
	move	%icc,	%i4,	%o4
	movvs	%xcc,	%l6,	%i1
	addc	%l3,	%g4,	%i7
	udiv	%o6,	0x131B,	%o0
	sllx	%o3,	0x00,	%i5
	edge8	%l0,	%o2,	%g2
	andcc	%o1,	%o7,	%i2
	fmovdvc	%icc,	%f31,	%f11
	fcmple16	%f8,	%f4,	%i3
	ldd	[%l7 + 0x10],	%f20
	fnot1s	%f16,	%f22
	edge8	%l5,	%g7,	%l4
	sdivcc	%o5,	0x100F,	%g5
	xnorcc	%l2,	0x1EBA,	%i6
	fxnor	%f22,	%f22,	%f8
	andncc	%l1,	%g3,	%g6
	movrgez	%g1,	0x39A,	%i4
	subc	%o4,	%l6,	%i0
	st	%f10,	[%l7 + 0x10]
	sllx	%i1,	%l3,	%g4
	movcc	%icc,	%i7,	%o6
	fmovsl	%xcc,	%f27,	%f20
	subcc	%o3,	0x1AC8,	%o0
	fmovsgu	%xcc,	%f3,	%f19
	addc	%l0,	%i5,	%o2
	fabsd	%f30,	%f8
	ldsw	[%l7 + 0x7C],	%o1
	fandnot2s	%f15,	%f11,	%f26
	fxors	%f15,	%f26,	%f23
	movcs	%xcc,	%g2,	%o7
	subccc	%i3,	%i2,	%g7
	addcc	%l5,	0x0D22,	%o5
	sdivx	%g5,	0x1B52,	%l2
	edge32	%l4,	%l1,	%i6
	srlx	%g6,	0x09,	%g3
	movrgz	%g1,	%i4,	%l6
	xor	%i0,	%o4,	%i1
	fxors	%f29,	%f25,	%f22
	movrlz	%g4,	0x165,	%i7
	fmovscs	%icc,	%f26,	%f23
	subcc	%o6,	%l3,	%o0
	array32	%l0,	%o3,	%i5
	sdiv	%o1,	0x1817,	%g2
	stw	%o2,	[%l7 + 0x7C]
	fcmpne32	%f30,	%f16,	%i3
	movpos	%icc,	%i2,	%g7
	bshuffle	%f4,	%f6,	%f18
	umul	%l5,	%o7,	%o5
	move	%icc,	%l2,	%g5
	fmovsgu	%icc,	%f21,	%f16
	movcc	%xcc,	%l1,	%i6
	movre	%l4,	%g6,	%g1
	movle	%xcc,	%g3,	%l6
	orcc	%i4,	0x03C3,	%i0
	subccc	%o4,	%g4,	%i1
	xnorcc	%i7,	%o6,	%o0
	array16	%l3,	%l0,	%i5
	movcs	%icc,	%o1,	%o3
	sir	0x006A
	movrgz	%g2,	%o2,	%i3
	movrgez	%g7,	0x032,	%i2
	srl	%l5,	%o7,	%l2
	orncc	%g5,	%l1,	%o5
	fmul8x16au	%f21,	%f8,	%f0
	movl	%xcc,	%i6,	%l4
	movl	%xcc,	%g6,	%g1
	mulscc	%g3,	0x076C,	%l6
	and	%i0,	%o4,	%i4
	or	%i1,	0x05B4,	%g4
	fmovdleu	%icc,	%f26,	%f6
	movgu	%icc,	%o6,	%i7
	fmovsn	%icc,	%f7,	%f14
	lduw	[%l7 + 0x68],	%o0
	fone	%f28
	fmovrse	%l3,	%f20,	%f10
	mulx	%i5,	%o1,	%l0
	stb	%g2,	[%l7 + 0x25]
	or	%o2,	0x17CF,	%o3
	fexpand	%f25,	%f26
	srl	%g7,	0x01,	%i3
	edge16n	%i2,	%o7,	%l5
	fpsub16	%f10,	%f14,	%f26
	movleu	%icc,	%g5,	%l1
	fmovdpos	%icc,	%f17,	%f17
	edge16	%o5,	%l2,	%i6
	edge32	%g6,	%l4,	%g1
	std	%f30,	[%l7 + 0x48]
	movrlez	%l6,	%i0,	%o4
	orcc	%g3,	0x0B02,	%i1
	movvs	%icc,	%i4,	%o6
	std	%f26,	[%l7 + 0x50]
	fmovscs	%xcc,	%f23,	%f4
	umulcc	%i7,	0x15AF,	%g4
	or	%l3,	0x1E18,	%o0
	movre	%i5,	%l0,	%o1
	orncc	%g2,	0x19AE,	%o2
	orncc	%o3,	0x1769,	%i3
	fmovdvs	%icc,	%f24,	%f15
	sdivcc	%g7,	0x1E8D,	%o7
	array32	%i2,	%l5,	%g5
	movne	%xcc,	%o5,	%l1
	movgu	%xcc,	%l2,	%i6
	movgu	%xcc,	%l4,	%g6
	add	%l6,	%g1,	%o4
	movpos	%icc,	%i0,	%i1
	movcc	%icc,	%g3,	%o6
	orcc	%i7,	%i4,	%l3
	sir	0x19F8
	movle	%icc,	%g4,	%i5
	stx	%o0,	[%l7 + 0x70]
	popc	0x024F,	%l0
	movrlez	%o1,	0x235,	%g2
	or	%o3,	%i3,	%o2
	fmovsvc	%xcc,	%f23,	%f0
	st	%f28,	[%l7 + 0x1C]
	fmovsn	%xcc,	%f4,	%f30
	edge8l	%o7,	%i2,	%g7
	st	%f17,	[%l7 + 0x5C]
	fcmpne32	%f2,	%f16,	%g5
	array16	%l5,	%o5,	%l1
	popc	0x066B,	%i6
	alignaddrl	%l4,	%g6,	%l6
	movle	%xcc,	%g1,	%o4
	fcmpgt32	%f8,	%f10,	%l2
	fmovdneg	%xcc,	%f17,	%f3
	fmovscc	%xcc,	%f18,	%f7
	sdiv	%i1,	0x1F4E,	%i0
	fmovdl	%xcc,	%f26,	%f22
	edge8ln	%g3,	%i7,	%i4
	movne	%icc,	%o6,	%g4
	movpos	%xcc,	%i5,	%o0
	fmul8ulx16	%f24,	%f12,	%f18
	smulcc	%l0,	%o1,	%l3
	edge16	%o3,	%i3,	%g2
	alignaddrl	%o7,	%i2,	%g7
	ld	[%l7 + 0x5C],	%f14
	umulcc	%o2,	0x0DF7,	%g5
	fmul8sux16	%f22,	%f20,	%f22
	or	%l5,	%l1,	%i6
	sir	0x0EE1
	srl	%l4,	%o5,	%l6
	save %g1, 0x1F9F, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%o4,	%l2
	edge16ln	%i1,	%g3,	%i0
	movg	%icc,	%i4,	%o6
	movrgez	%i7,	0x077,	%i5
	fmovsl	%icc,	%f24,	%f18
	movrlez	%o0,	0x368,	%g4
	fmovsle	%xcc,	%f1,	%f6
	xor	%o1,	0x0DF7,	%l0
	fmovdcs	%xcc,	%f27,	%f10
	sub	%l3,	%i3,	%o3
	movne	%icc,	%g2,	%o7
	movpos	%xcc,	%i2,	%o2
	ldsw	[%l7 + 0x10],	%g5
	addc	%l5,	%g7,	%l1
	alignaddr	%l4,	%i6,	%l6
	fmovdg	%icc,	%f17,	%f6
	and	%o5,	%g6,	%g1
	sth	%o4,	[%l7 + 0x50]
	lduw	[%l7 + 0x58],	%i1
	sra	%g3,	%l2,	%i0
	edge8ln	%i4,	%i7,	%o6
	sub	%i5,	0x1F1F,	%o0
	movcc	%xcc,	%g4,	%o1
	stb	%l3,	[%l7 + 0x69]
	mova	%icc,	%l0,	%i3
	edge32	%g2,	%o3,	%i2
	udivcc	%o2,	0x0914,	%g5
	mulscc	%o7,	%g7,	%l5
	lduh	[%l7 + 0x0A],	%l4
	or	%l1,	0x1708,	%l6
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	ldsb	[%l7 + 0x4D],	%g6
	sll	%i1,	0x08,	%g3
	fmovdvs	%icc,	%f13,	%f23
	st	%f12,	[%l7 + 0x3C]
	xorcc	%l2,	0x1214,	%o4
	fmovd	%f26,	%f8
	fornot2	%f14,	%f18,	%f14
	edge32n	%i4,	%i0,	%i7
	mova	%xcc,	%o6,	%o0
	fcmpeq16	%f12,	%f22,	%g4
	srax	%i5,	%l3,	%l0
	std	%f14,	[%l7 + 0x08]
	movrne	%i3,	%g2,	%o1
	lduh	[%l7 + 0x7E],	%o3
	move	%icc,	%i2,	%o2
	fmul8x16al	%f7,	%f23,	%f0
	sdivx	%o7,	0x0A3A,	%g7
	srl	%l5,	0x10,	%g5
	sth	%l1,	[%l7 + 0x46]
	fnegd	%f8,	%f26
	movrgz	%l4,	%o5,	%l6
	movcs	%icc,	%i6,	%g6
	edge8n	%g1,	%g3,	%l2
	xor	%i1,	0x0220,	%i4
	movcs	%xcc,	%o4,	%i7
	movrlez	%o6,	0x3A4,	%o0
	subccc	%g4,	0x1A69,	%i5
	xor	%i0,	0x0C47,	%l0
	sethi	0x1910,	%i3
	fmovdcc	%icc,	%f12,	%f10
	sir	0x0651
	fand	%f4,	%f6,	%f10
	edge8	%l3,	%g2,	%o1
	array32	%o3,	%o2,	%o7
	movcc	%icc,	%i2,	%g7
	add	%g5,	%l1,	%l5
	movl	%icc,	%o5,	%l6
	fzero	%f22
	edge8	%l4,	%g6,	%i6
	save %g1, %l2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i1,	0x10AA,	%o4
	fmovsn	%xcc,	%f2,	%f20
	movgu	%xcc,	%i4,	%i7
	sdiv	%o6,	0x1798,	%o0
	movge	%icc,	%g4,	%i5
	edge32ln	%i0,	%i3,	%l3
	orncc	%g2,	%l0,	%o1
	and	%o3,	0x19A5,	%o2
	nop
	set	0x60, %o0
	ldd	[%l7 + %o0],	%f30
	sdivx	%i2,	0x0839,	%o7
	edge32n	%g7,	%l1,	%g5
	ldd	[%l7 + 0x18],	%l4
	edge16ln	%o5,	%l6,	%l4
	fmovrdgz	%g6,	%f6,	%f16
	movgu	%xcc,	%g1,	%l2
	fmovrdlez	%i6,	%f14,	%f4
	fmovsn	%icc,	%f28,	%f0
	movneg	%icc,	%g3,	%i1
	sethi	0x0EC9,	%o4
	umulcc	%i7,	0x03B5,	%o6
	fcmpgt32	%f28,	%f20,	%i4
	sub	%g4,	0x158A,	%i5
	mulscc	%o0,	0x14F1,	%i3
	fabsd	%f18,	%f16
	sir	0x0FBF
	fmovsle	%icc,	%f2,	%f13
	movvc	%xcc,	%i0,	%l3
	movpos	%xcc,	%g2,	%o1
	mulx	%o3,	%o2,	%i2
	st	%f15,	[%l7 + 0x44]
	move	%icc,	%l0,	%g7
	fmovdneg	%xcc,	%f8,	%f11
	movne	%icc,	%o7,	%g5
	umulcc	%l5,	%l1,	%o5
	move	%icc,	%l4,	%g6
	array32	%g1,	%l6,	%l2
	edge16n	%i6,	%i1,	%g3
	movg	%icc,	%o4,	%o6
	addc	%i7,	0x1092,	%i4
	addcc	%g4,	0x1D37,	%i5
	ldx	[%l7 + 0x38],	%i3
	srl	%o0,	0x0F,	%l3
	fmovse	%xcc,	%f24,	%f7
	fmovsn	%xcc,	%f2,	%f20
	edge32	%i0,	%o1,	%g2
	srlx	%o3,	0x12,	%i2
	fnot1s	%f22,	%f9
	fornot1s	%f25,	%f28,	%f25
	orn	%o2,	0x1067,	%g7
	xorcc	%o7,	0x0437,	%l0
	and	%g5,	0x1C33,	%l1
	edge32l	%o5,	%l4,	%g6
	fsrc2s	%f20,	%f8
	fmovdneg	%icc,	%f29,	%f18
	xor	%g1,	0x1B77,	%l6
	ldx	[%l7 + 0x40],	%l2
	edge16n	%l5,	%i1,	%g3
	movg	%xcc,	%i6,	%o4
	fmovrsne	%o6,	%f3,	%f11
	movcc	%xcc,	%i7,	%i4
	movcc	%xcc,	%i5,	%g4
	movn	%xcc,	%o0,	%i3
	addccc	%i0,	0x17C9,	%o1
	ldx	[%l7 + 0x20],	%l3
	movvc	%icc,	%g2,	%o3
	movleu	%xcc,	%o2,	%g7
	fmovscs	%xcc,	%f6,	%f20
	popc	0x1CC3,	%o7
	movrlez	%l0,	0x0E5,	%i2
	ldd	[%l7 + 0x30],	%l0
	edge32n	%g5,	%o5,	%l4
	xnorcc	%g1,	0x1790,	%g6
	restore %l2, %l5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgz	%g3,	%f24,	%f16
	alignaddrl	%i1,	%i6,	%o6
	edge8ln	%i7,	%o4,	%i5
	srlx	%g4,	%i4,	%o0
	fandnot1	%f8,	%f10,	%f8
	fornot1	%f26,	%f18,	%f22
	sth	%i0,	[%l7 + 0x2E]
	edge8n	%o1,	%l3,	%g2
	addc	%i3,	0x1E9B,	%o2
	umulcc	%o3,	%g7,	%o7
	smul	%l0,	0x02F4,	%i2
	sll	%g5,	0x1A,	%l1
	fpack32	%f6,	%f18,	%f10
	fxors	%f1,	%f22,	%f0
	fmovsle	%xcc,	%f8,	%f16
	fmovsne	%icc,	%f25,	%f11
	movpos	%icc,	%o5,	%g1
	movcc	%xcc,	%g6,	%l2
	sdiv	%l4,	0x1A12,	%l6
	movre	%l5,	0x15E,	%g3
	save %i6, 0x15EA, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i7,	%o4,	%i5
	sub	%g4,	0x029C,	%i1
	ldd	[%l7 + 0x18],	%o0
	stw	%i4,	[%l7 + 0x08]
	movn	%xcc,	%o1,	%i0
	fmovrdgez	%l3,	%f10,	%f22
	add	%i3,	%o2,	%o3
	smul	%g2,	0x1220,	%o7
	subccc	%g7,	0x04F5,	%i2
	stb	%g5,	[%l7 + 0x7B]
	array32	%l0,	%l1,	%g1
	fmovs	%f5,	%f5
	xnor	%g6,	%o5,	%l2
	fcmple32	%f2,	%f8,	%l6
	fmovdge	%icc,	%f18,	%f11
	sethi	0x0A02,	%l5
	alignaddr	%l4,	%g3,	%i6
	lduh	[%l7 + 0x7C],	%o6
	st	%f4,	[%l7 + 0x44]
	ldd	[%l7 + 0x48],	%i6
	orcc	%i5,	%o4,	%g4
	ldd	[%l7 + 0x70],	%f30
	sethi	0x10C0,	%o0
	fzero	%f18
	ldd	[%l7 + 0x78],	%f20
	subc	%i1,	0x0BF7,	%i4
	smul	%o1,	%l3,	%i0
	fmovda	%icc,	%f5,	%f7
	movrlez	%i3,	%o3,	%g2
	xor	%o2,	0x19EF,	%g7
	umul	%i2,	%o7,	%g5
	subc	%l0,	0x19A6,	%g1
	movrne	%g6,	%o5,	%l2
	movrgz	%l1,	0x2D1,	%l5
	movcc	%xcc,	%l4,	%g3
	movrgz	%i6,	%l6,	%o6
	edge32ln	%i5,	%i7,	%g4
	fmovsneg	%xcc,	%f18,	%f14
	movre	%o4,	%i1,	%i4
	edge16ln	%o1,	%o0,	%l3
	fmul8x16au	%f29,	%f25,	%f6
	movrlz	%i3,	%i0,	%g2
	ldx	[%l7 + 0x28],	%o3
	array8	%g7,	%o2,	%i2
	ldub	[%l7 + 0x1E],	%o7
	edge32n	%g5,	%g1,	%g6
	movvs	%xcc,	%l0,	%o5
	ldd	[%l7 + 0x20],	%f18
	ldsh	[%l7 + 0x3E],	%l1
	popc	%l2,	%l4
	fpsub16	%f6,	%f12,	%f24
	mulx	%l5,	%g3,	%l6
	movvs	%xcc,	%i6,	%i5
	edge8n	%i7,	%g4,	%o4
	move	%xcc,	%o6,	%i1
	movg	%icc,	%o1,	%i4
	movrlz	%l3,	%i3,	%o0
	array16	%i0,	%o3,	%g2
	subc	%g7,	%o2,	%i2
	udivcc	%o7,	0x1953,	%g5
	sdivcc	%g6,	0x185B,	%g1
	udiv	%o5,	0x1700,	%l1
	movrgz	%l2,	0x0E7,	%l0
	fsrc1s	%f22,	%f16
	ldd	[%l7 + 0x60],	%l4
	andcc	%l5,	%l6,	%g3
	subccc	%i5,	0x1870,	%i6
	sth	%g4,	[%l7 + 0x4E]
	edge8n	%o4,	%o6,	%i1
	subc	%i7,	0x0115,	%i4
	addcc	%o1,	0x00A7,	%i3
	edge8ln	%l3,	%o0,	%o3
	std	%f14,	[%l7 + 0x30]
	fmovd	%f22,	%f20
	sdivx	%g2,	0x06F4,	%g7
	fmovdneg	%icc,	%f25,	%f13
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	sll	%i2,	%g6,	%g5
	movvs	%xcc,	%o5,	%l1
	stw	%g1,	[%l7 + 0x60]
	array16	%l2,	%l0,	%l4
	save %l5, 0x09CE, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l6,	0x0E,	%i6
	edge8	%i5,	%o4,	%o6
	movrgez	%g4,	0x21D,	%i7
	ld	[%l7 + 0x14],	%f27
	umul	%i4,	%o1,	%i1
	movpos	%icc,	%l3,	%o0
	edge8	%i3,	%g2,	%g7
	movle	%xcc,	%i0,	%o3
	xor	%o2,	%o7,	%i2
	sllx	%g6,	%g5,	%l1
	andncc	%g1,	%o5,	%l0
	srlx	%l2,	%l5,	%g3
	st	%f17,	[%l7 + 0x78]
	std	%f10,	[%l7 + 0x38]
	fone	%f20
	sdiv	%l6,	0x0DDE,	%i6
	srl	%i5,	%l4,	%o6
	ldsh	[%l7 + 0x76],	%g4
	xorcc	%o4,	%i7,	%o1
	movg	%icc,	%i1,	%i4
	movl	%xcc,	%o0,	%i3
	addc	%g2,	0x0249,	%l3
	xorcc	%i0,	%o3,	%o2
	edge8	%g7,	%o7,	%i2
	fmovrdne	%g5,	%f2,	%f10
	ldsb	[%l7 + 0x76],	%l1
	fnors	%f7,	%f14,	%f30
	movcs	%icc,	%g6,	%o5
	movpos	%icc,	%g1,	%l2
	fmul8sux16	%f16,	%f10,	%f24
	fnegs	%f30,	%f14
	array8	%l0,	%l5,	%l6
	movcs	%xcc,	%g3,	%i6
	array16	%l4,	%i5,	%g4
	xnor	%o6,	0x0B66,	%i7
	edge16l	%o4,	%o1,	%i1
	fmovda	%icc,	%f17,	%f17
	umul	%i4,	%o0,	%g2
	edge32l	%i3,	%i0,	%o3
	movcs	%xcc,	%l3,	%o2
	addccc	%o7,	0x06D4,	%g7
	udiv	%g5,	0x1E1C,	%i2
	popc	0x0CEB,	%g6
	movg	%icc,	%o5,	%g1
	move	%xcc,	%l2,	%l0
	movcc	%xcc,	%l5,	%l6
	orn	%g3,	0x05DB,	%l1
	umulcc	%l4,	0x03F6,	%i6
	ld	[%l7 + 0x54],	%f6
	edge16ln	%i5,	%g4,	%i7
	fcmpeq16	%f2,	%f0,	%o4
	subc	%o1,	0x1F3E,	%i1
	add	%i4,	0x1FC7,	%o6
	xnorcc	%g2,	%o0,	%i0
	siam	0x3
	ldd	[%l7 + 0x10],	%o2
	fmuld8ulx16	%f7,	%f11,	%f6
	movn	%xcc,	%i3,	%o2
	fornot2s	%f20,	%f23,	%f17
	fxnor	%f24,	%f18,	%f16
	fones	%f26
	udivcc	%l3,	0x188F,	%o7
	movcs	%xcc,	%g7,	%g5
	array8	%i2,	%o5,	%g1
	edge8	%l2,	%g6,	%l0
	movle	%icc,	%l5,	%l6
	movvc	%icc,	%g3,	%l1
	popc	0x00E9,	%l4
	array8	%i5,	%i6,	%i7
	fmovda	%icc,	%f3,	%f4
	movn	%icc,	%g4,	%o1
	fpackfix	%f0,	%f11
	movneg	%xcc,	%i1,	%o4
	array32	%i4,	%o6,	%o0
	ldsb	[%l7 + 0x36],	%i0
	restore %o3, %i3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1270
	array8	%l3,	%g2,	%g7
	sir	0x16AC
	subccc	%g5,	0x1915,	%i2
	fmovsg	%icc,	%f30,	%f28
	fmovdvc	%icc,	%f24,	%f3
	subcc	%o7,	0x1004,	%o5
	subc	%l2,	%g6,	%l0
	xnor	%l5,	0x0C6F,	%l6
	umul	%g1,	%l1,	%g3
	umulcc	%i5,	%i6,	%l4
	xnor	%i7,	0x0F39,	%o1
	movl	%xcc,	%i1,	%g4
	fmovdge	%xcc,	%f11,	%f28
	movg	%icc,	%o4,	%i4
	and	%o6,	%i0,	%o0
	fandnot1	%f8,	%f12,	%f12
	edge32n	%i3,	%o2,	%l3
	alignaddr	%g2,	%o3,	%g5
	fandnot2s	%f17,	%f26,	%f30
	pdist	%f4,	%f16,	%f2
	sth	%i2,	[%l7 + 0x5C]
	movne	%xcc,	%o7,	%g7
	sir	0x036C
	mulx	%o5,	%g6,	%l2
	movleu	%xcc,	%l0,	%l5
	movvc	%icc,	%l6,	%g1
	edge16	%g3,	%l1,	%i5
	edge16ln	%l4,	%i6,	%i7
	mulscc	%i1,	0x0508,	%g4
	addcc	%o4,	0x0828,	%i4
	movrgz	%o6,	0x30C,	%o1
	fpackfix	%f24,	%f24
	sllx	%o0,	0x14,	%i3
	popc	0x0CD5,	%o2
	edge16n	%l3,	%g2,	%o3
	addc	%i0,	0x0761,	%g5
	srax	%i2,	%o7,	%o5
	edge16l	%g7,	%g6,	%l0
	alignaddr	%l2,	%l5,	%g1
	fmovdle	%xcc,	%f3,	%f18
	nop
	set	0x18, %l2
	stw	%l6,	[%l7 + %l2]
	fmovdgu	%xcc,	%f23,	%f20
	sdivcc	%l1,	0x0489,	%i5
	movre	%g3,	%l4,	%i7
	fnot2	%f16,	%f6
	ldsb	[%l7 + 0x4B],	%i6
	orncc	%g4,	0x1B37,	%o4
	movne	%xcc,	%i4,	%i1
	addc	%o1,	%o6,	%i3
	edge8ln	%o0,	%l3,	%g2
	fnot1	%f26,	%f30
	stb	%o3,	[%l7 + 0x10]
	fmuld8sux16	%f13,	%f28,	%f8
	edge32n	%o2,	%i0,	%i2
	addccc	%g5,	0x01C0,	%o7
	andncc	%o5,	%g7,	%g6
	subcc	%l0,	%l5,	%l2
	xorcc	%g1,	0x132D,	%l1
	movvs	%icc,	%i5,	%l6
	popc	0x15F5,	%g3
	fmovsge	%icc,	%f4,	%f9
	movpos	%xcc,	%i7,	%i6
	fxors	%f11,	%f18,	%f29
	lduh	[%l7 + 0x78],	%l4
	andncc	%o4,	%i4,	%g4
	array32	%i1,	%o6,	%i3
	fmovrse	%o0,	%f22,	%f30
	ldub	[%l7 + 0x22],	%o1
	fmovdl	%icc,	%f23,	%f12
	sdivcc	%g2,	0x01A5,	%o3
	fone	%f6
	fcmpne32	%f28,	%f24,	%l3
	mulscc	%o2,	%i2,	%i0
	udivx	%o7,	0x0BF6,	%o5
	srax	%g5,	%g6,	%g7
	fornot2s	%f10,	%f28,	%f31
	move	%xcc,	%l0,	%l2
	alignaddrl	%l5,	%l1,	%g1
	movvs	%icc,	%l6,	%i5
	nop
	set	0x40, %l5
	lduh	[%l7 + %l5],	%i7
	movleu	%icc,	%g3,	%l4
	movne	%xcc,	%i6,	%o4
	smul	%g4,	0x067A,	%i4
	addcc	%o6,	0x0AA8,	%i1
	andncc	%i3,	%o0,	%g2
	fmovs	%f21,	%f21
	movcc	%xcc,	%o3,	%l3
	andcc	%o1,	%i2,	%o2
	ldub	[%l7 + 0x5F],	%i0
	ldd	[%l7 + 0x50],	%o4
	sllx	%g5,	0x09,	%g6
	ldsh	[%l7 + 0x4C],	%o7
	fsrc1	%f24,	%f16
	fxor	%f14,	%f12,	%f20
	sra	%l0,	0x09,	%g7
	movvc	%icc,	%l5,	%l2
	movcs	%icc,	%g1,	%l1
	fpsub16	%f8,	%f12,	%f26
	fpadd16	%f22,	%f20,	%f24
	fnands	%f14,	%f0,	%f4
	alignaddrl	%l6,	%i5,	%g3
	fmovsl	%xcc,	%f21,	%f24
	edge32n	%i7,	%i6,	%o4
	movcs	%icc,	%g4,	%i4
	add	%l4,	%i1,	%o6
	srl	%o0,	0x15,	%i3
	xor	%o3,	%g2,	%o1
	and	%i2,	0x1544,	%l3
	xorcc	%o2,	0x1629,	%i0
	fmovrsgz	%g5,	%f22,	%f26
	fpsub16s	%f5,	%f14,	%f19
	movle	%xcc,	%o5,	%o7
	array32	%g6,	%g7,	%l0
	orcc	%l2,	%g1,	%l5
	st	%f3,	[%l7 + 0x38]
	add	%l1,	%l6,	%g3
	nop
	set	0x50, %g7
	lduh	[%l7 + %g7],	%i7
	edge16	%i6,	%o4,	%i5
	save %g4, %i4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x0750,	%o6
	sdivx	%o0,	0x00C8,	%i3
	edge16ln	%g2,	%o3,	%o1
	mova	%icc,	%i2,	%o2
	fexpand	%f3,	%f0
	sllx	%l3,	0x17,	%g5
	movgu	%xcc,	%o5,	%o7
	for	%f26,	%f14,	%f20
	or	%g6,	%g7,	%i0
	movneg	%xcc,	%l2,	%l0
	fmovse	%xcc,	%f4,	%f16
	umul	%l5,	%g1,	%l1
	stw	%l6,	[%l7 + 0x6C]
	fones	%f27
	nop
	set	0x60, %o6
	stw	%i7,	[%l7 + %o6]
	lduw	[%l7 + 0x68],	%g3
	fnot2s	%f10,	%f26
	popc	0x1369,	%i6
	sth	%o4,	[%l7 + 0x70]
	movvs	%icc,	%i5,	%i4
	movcc	%xcc,	%g4,	%l4
	array16	%i1,	%o6,	%i3
	ldsw	[%l7 + 0x2C],	%g2
	fmovrdgez	%o3,	%f12,	%f16
	fmovd	%f16,	%f28
	fmovsl	%icc,	%f3,	%f17
	popc	0x0DDF,	%o1
	xorcc	%o0,	%i2,	%l3
	movcc	%xcc,	%g5,	%o5
	xorcc	%o2,	0x0D1D,	%g6
	movrgz	%o7,	%i0,	%l2
	array16	%l0,	%l5,	%g1
	edge16	%g7,	%l6,	%i7
	edge32	%g3,	%i6,	%l1
	alignaddr	%o4,	%i5,	%i4
	edge8	%l4,	%i1,	%o6
	lduw	[%l7 + 0x5C],	%g4
	movre	%i3,	%g2,	%o1
	mulx	%o3,	%i2,	%l3
	edge16ln	%o0,	%o5,	%g5
	sub	%o2,	%o7,	%i0
	xorcc	%l2,	0x1973,	%g6
	umulcc	%l0,	0x1EC5,	%l5
	udivx	%g7,	0x17E8,	%g1
	edge16l	%i7,	%l6,	%i6
	add	%g3,	0x19C0,	%o4
	smul	%i5,	0x1513,	%i4
	stx	%l4,	[%l7 + 0x10]
	fornot1s	%f17,	%f0,	%f28
	movcs	%icc,	%i1,	%l1
	ldsw	[%l7 + 0x40],	%o6
	movne	%xcc,	%i3,	%g2
	edge8	%g4,	%o1,	%i2
	mulscc	%o3,	0x057D,	%l3
	srax	%o5,	0x07,	%o0
	mulscc	%g5,	0x160B,	%o2
	sra	%i0,	0x05,	%l2
	fpadd16s	%f19,	%f13,	%f22
	fmovrsgez	%o7,	%f28,	%f2
	sir	0x07A4
	edge16n	%l0,	%g6,	%l5
	mova	%xcc,	%g1,	%i7
	movne	%xcc,	%g7,	%l6
	fpack32	%f12,	%f16,	%f20
	fmuld8sux16	%f24,	%f10,	%f18
	edge16n	%i6,	%g3,	%i5
	umulcc	%o4,	0x0CDD,	%l4
	fcmple32	%f22,	%f20,	%i4
	sra	%i1,	%o6,	%l1
	fzeros	%f5
	alignaddr	%g2,	%g4,	%i3
	ldd	[%l7 + 0x30],	%o0
	smul	%i2,	0x0668,	%o3
	faligndata	%f12,	%f26,	%f8
	lduh	[%l7 + 0x68],	%l3
	sub	%o5,	0x035D,	%o0
	sdiv	%o2,	0x0C92,	%i0
	fandnot2	%f4,	%f10,	%f8
	movl	%xcc,	%g5,	%l2
	sir	0x0CA0
	edge16ln	%o7,	%l0,	%l5
	movvs	%xcc,	%g6,	%g1
	fnot1s	%f13,	%f16
	or	%i7,	0x144B,	%l6
	ldub	[%l7 + 0x43],	%i6
	fmul8sux16	%f20,	%f2,	%f28
	srlx	%g7,	0x0F,	%i5
	or	%o4,	0x191E,	%l4
	fmovdvs	%icc,	%f28,	%f19
	fnors	%f27,	%f22,	%f29
	fxnors	%f21,	%f19,	%f24
	ldsh	[%l7 + 0x5C],	%g3
	ldsw	[%l7 + 0x68],	%i1
	addcc	%o6,	%l1,	%g2
	smulcc	%g4,	0x1138,	%i3
	fpadd32s	%f11,	%f24,	%f3
	fxnor	%f30,	%f20,	%f14
	edge16ln	%o1,	%i4,	%i2
	fmovsne	%xcc,	%f19,	%f22
	st	%f28,	[%l7 + 0x6C]
	alignaddr	%l3,	%o3,	%o5
	subcc	%o2,	0x16CD,	%i0
	fcmpes	%fcc2,	%f18,	%f28
	andcc	%o0,	%g5,	%o7
	movgu	%icc,	%l0,	%l5
	ld	[%l7 + 0x50],	%f31
	movn	%xcc,	%g6,	%l2
	fnot2	%f8,	%f10
	edge16l	%g1,	%i7,	%l6
	ldx	[%l7 + 0x50],	%i6
	movvc	%icc,	%g7,	%i5
	array16	%l4,	%o4,	%g3
	movrne	%o6,	0x0EF,	%l1
	edge8l	%g2,	%g4,	%i1
	edge8n	%i3,	%o1,	%i2
	ldsh	[%l7 + 0x2C],	%i4
	or	%l3,	0x0A2D,	%o5
	movrlez	%o2,	%i0,	%o3
	orcc	%g5,	%o0,	%o7
	edge16l	%l5,	%g6,	%l0
	edge32l	%l2,	%g1,	%i7
	fmovdgu	%xcc,	%f15,	%f17
	fsrc2s	%f28,	%f24
	edge16l	%l6,	%i6,	%i5
	srlx	%l4,	0x01,	%g7
	ld	[%l7 + 0x48],	%f26
	movneg	%icc,	%g3,	%o4
	fones	%f20
	fmovdle	%icc,	%f16,	%f23
	fpadd32	%f30,	%f16,	%f12
	edge16l	%o6,	%g2,	%l1
	edge32ln	%i1,	%i3,	%o1
	fmovse	%icc,	%f10,	%f19
	movneg	%xcc,	%i2,	%g4
	orcc	%i4,	%o5,	%o2
	sdivcc	%l3,	0x141A,	%i0
	add	%g5,	0x09C4,	%o3
	mulscc	%o7,	0x0156,	%o0
	stx	%l5,	[%l7 + 0x30]
	movvs	%icc,	%l0,	%g6
	fmovdge	%xcc,	%f8,	%f3
	mova	%xcc,	%l2,	%i7
	std	%f4,	[%l7 + 0x48]
	edge16l	%g1,	%i6,	%l6
	movrlez	%i5,	%g7,	%g3
	srlx	%o4,	%o6,	%g2
	sub	%l1,	%i1,	%l4
	fmovrdgz	%o1,	%f24,	%f24
	edge32n	%i2,	%i3,	%g4
	or	%i4,	%o2,	%l3
	fpadd32s	%f9,	%f19,	%f5
	popc	0x11A0,	%i0
	udivx	%o5,	0x1C6F,	%g5
	movleu	%xcc,	%o7,	%o3
	orn	%l5,	%l0,	%o0
	movrgz	%g6,	%i7,	%g1
	fmovsl	%xcc,	%f28,	%f8
	andn	%i6,	%l2,	%i5
	movrne	%l6,	0x3D2,	%g3
	sll	%g7,	%o4,	%g2
	srl	%o6,	0x07,	%l1
	ldsh	[%l7 + 0x12],	%l4
	stb	%i1,	[%l7 + 0x68]
	ldd	[%l7 + 0x20],	%i2
	fmovda	%xcc,	%f12,	%f21
	xnorcc	%o1,	%g4,	%i4
	smulcc	%i3,	%l3,	%o2
	subc	%o5,	%i0,	%g5
	xnor	%o7,	0x0DB0,	%o3
	udivcc	%l0,	0x1B40,	%o0
	sub	%g6,	%l5,	%g1
	movcc	%icc,	%i7,	%l2
	edge32ln	%i6,	%i5,	%l6
	fnand	%f28,	%f2,	%f4
	fzeros	%f30
	fpsub32	%f8,	%f0,	%f12
	subc	%g3,	0x1CEE,	%o4
	fmovdneg	%xcc,	%f25,	%f14
	fsrc2s	%f16,	%f2
	stb	%g2,	[%l7 + 0x27]
	orncc	%g7,	0x1025,	%l1
	ldsb	[%l7 + 0x2D],	%l4
	move	%icc,	%i1,	%i2
	alignaddr	%o6,	%g4,	%i4
	sra	%o1,	0x01,	%i3
	smul	%o2,	%l3,	%o5
	nop
	set	0x44, %g3
	sth	%g5,	[%l7 + %g3]
	save %o7, 0x00D4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l0,	%o0,	%g6
	movne	%icc,	%l5,	%o3
	fpsub16s	%f7,	%f24,	%f1
	movge	%icc,	%i7,	%l2
	subcc	%g1,	%i5,	%i6
	subccc	%g3,	0x0A15,	%o4
	andncc	%g2,	%l6,	%l1
	udiv	%l4,	0x15AF,	%g7
	andn	%i2,	0x19C4,	%i1
	sub	%o6,	%g4,	%o1
	fandnot2	%f30,	%f4,	%f30
	edge16ln	%i3,	%i4,	%l3
	movle	%icc,	%o5,	%o2
	lduh	[%l7 + 0x2C],	%o7
	srax	%g5,	%l0,	%o0
	ldsb	[%l7 + 0x24],	%i0
	addccc	%l5,	%o3,	%i7
	lduh	[%l7 + 0x3C],	%l2
	ldx	[%l7 + 0x60],	%g1
	sir	0x05BA
	subcc	%i5,	%i6,	%g6
	sll	%o4,	%g3,	%l6
	fmovrsgez	%g2,	%f12,	%f29
	andn	%l4,	0x1A5E,	%l1
	edge16	%i2,	%i1,	%o6
	addccc	%g4,	0x0FC4,	%g7
	nop
	set	0x68, %l4
	lduh	[%l7 + %l4],	%i3
	ldd	[%l7 + 0x50],	%f8
	fpsub32s	%f1,	%f13,	%f18
	xnor	%i4,	%o1,	%o5
	edge8l	%l3,	%o7,	%o2
	fpadd16s	%f20,	%f21,	%f26
	or	%l0,	%o0,	%i0
	fexpand	%f22,	%f26
	fnot1s	%f0,	%f0
	fpsub16	%f14,	%f18,	%f16
	smul	%l5,	0x10BE,	%o3
	fxnor	%f28,	%f30,	%f0
	sir	0x13E9
	array32	%g5,	%i7,	%l2
	fmovsgu	%xcc,	%f9,	%f20
	smul	%g1,	0x1E7E,	%i5
	fmovscc	%xcc,	%f12,	%f29
	subc	%g6,	0x04EA,	%o4
	ldd	[%l7 + 0x10],	%f16
	edge32	%i6,	%l6,	%g3
	edge16	%l4,	%l1,	%g2
	fmovdl	%icc,	%f20,	%f18
	movl	%icc,	%i2,	%i1
	lduh	[%l7 + 0x74],	%g4
	subccc	%g7,	0x1650,	%o6
	ldx	[%l7 + 0x50],	%i3
	fmovdvs	%icc,	%f22,	%f4
	movrlz	%i4,	%o1,	%l3
	fmovdne	%xcc,	%f28,	%f31
	sdivcc	%o7,	0x1F24,	%o5
	movneg	%icc,	%l0,	%o0
	stb	%i0,	[%l7 + 0x0A]
	array32	%o2,	%o3,	%g5
	fmuld8ulx16	%f2,	%f4,	%f0
	movgu	%xcc,	%i7,	%l5
	sethi	0x0A4C,	%l2
	fxor	%f14,	%f12,	%f4
	edge32ln	%g1,	%i5,	%g6
	movrne	%i6,	0x3D7,	%o4
	edge32ln	%l6,	%g3,	%l4
	save %g2, 0x1D47, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdneg	%icc,	%f28,	%f15
	ldd	[%l7 + 0x48],	%f8
	movle	%xcc,	%i2,	%i1
	fxor	%f26,	%f14,	%f18
	sub	%g4,	%g7,	%i3
	edge32	%i4,	%o6,	%l3
	addc	%o1,	0x14F0,	%o5
	movrlez	%o7,	0x132,	%l0
	fmovdneg	%xcc,	%f16,	%f21
	lduw	[%l7 + 0x70],	%o0
	srlx	%o2,	%i0,	%g5
	fmovdn	%xcc,	%f4,	%f8
	orn	%o3,	0x0BB2,	%l5
	addc	%l2,	0x1075,	%g1
	orcc	%i7,	0x1ADC,	%i5
	stb	%i6,	[%l7 + 0x2D]
	srl	%o4,	%l6,	%g6
	umul	%g3,	0x0B35,	%l4
	alignaddrl	%l1,	%i2,	%g2
	fpsub32s	%f24,	%f15,	%f20
	xor	%g4,	0x0323,	%g7
	movg	%xcc,	%i3,	%i1
	orcc	%i4,	0x0A39,	%l3
	edge16	%o6,	%o5,	%o1
	xnorcc	%l0,	0x1BDD,	%o0
	movgu	%xcc,	%o7,	%o2
	movrgez	%g5,	0x25A,	%i0
	movrlz	%l5,	0x37F,	%l2
	udivx	%o3,	0x1141,	%g1
	fmovscc	%icc,	%f6,	%f11
	edge8ln	%i7,	%i5,	%i6
	movle	%icc,	%o4,	%g6
	edge8n	%g3,	%l6,	%l1
	edge32ln	%i2,	%g2,	%g4
	fmovsa	%icc,	%f24,	%f6
	fmuld8sux16	%f24,	%f30,	%f24
	movne	%xcc,	%l4,	%g7
	fornot1	%f20,	%f12,	%f10
	ldd	[%l7 + 0x28],	%f8
	fxor	%f4,	%f4,	%f18
	alignaddrl	%i1,	%i4,	%i3
	umul	%l3,	0x0326,	%o6
	sdiv	%o5,	0x0E5A,	%l0
	and	%o0,	%o7,	%o2
	sdiv	%g5,	0x0CD9,	%i0
	fmovda	%xcc,	%f13,	%f19
	movvs	%xcc,	%l5,	%l2
	movvc	%xcc,	%o1,	%o3
	movrlez	%i7,	0x327,	%g1
	srlx	%i6,	0x1C,	%o4
	sub	%i5,	%g6,	%l6
	movleu	%icc,	%g3,	%l1
	movcc	%icc,	%i2,	%g4
	smul	%l4,	%g7,	%i1
	ldsh	[%l7 + 0x4C],	%g2
	andncc	%i4,	%l3,	%i3
	movne	%xcc,	%o6,	%l0
	sub	%o5,	%o0,	%o2
	movrlz	%g5,	%o7,	%i0
	movleu	%xcc,	%l5,	%o1
	sra	%l2,	%i7,	%g1
	std	%f26,	[%l7 + 0x18]
	edge32ln	%o3,	%i6,	%o4
	ldd	[%l7 + 0x20],	%g6
	movrgez	%i5,	0x2AD,	%l6
	fcmped	%fcc3,	%f22,	%f4
	st	%f29,	[%l7 + 0x48]
	fmovrdlz	%l1,	%f26,	%f30
	orn	%i2,	0x0658,	%g4
	movvs	%icc,	%g3,	%l4
	array32	%g7,	%i1,	%g2
	fmovdcc	%icc,	%f21,	%f21
	fpack16	%f24,	%f23
	ldsh	[%l7 + 0x18],	%i4
	sth	%l3,	[%l7 + 0x22]
	fcmple16	%f6,	%f28,	%i3
	fmovdne	%icc,	%f16,	%f29
	edge32n	%o6,	%l0,	%o0
	orcc	%o2,	%g5,	%o7
	movn	%xcc,	%i0,	%l5
	edge16n	%o1,	%o5,	%i7
	sra	%g1,	0x1E,	%o3
	stx	%i6,	[%l7 + 0x68]
	movl	%xcc,	%o4,	%g6
	sub	%l2,	0x0B94,	%i5
	save %l1, 0x133B, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g4,	%g3,	%l4
	movpos	%icc,	%i2,	%i1
	or	%g7,	0x0DEA,	%g2
	fmovrdlez	%l3,	%f2,	%f14
	sdivcc	%i4,	0x1E23,	%i3
	movvs	%icc,	%o6,	%o0
	xnorcc	%l0,	%o2,	%g5
	popc	%o7,	%l5
	andcc	%i0,	%o1,	%i7
	movgu	%icc,	%g1,	%o5
	edge16n	%o3,	%i6,	%o4
	fmovda	%icc,	%f30,	%f18
	addccc	%g6,	%l2,	%i5
	ldd	[%l7 + 0x60],	%f14
	smul	%l6,	0x087E,	%l1
	sir	0x1EBD
	ldsw	[%l7 + 0x38],	%g3
	sdiv	%g4,	0x09C6,	%i2
	sth	%l4,	[%l7 + 0x2E]
	udivcc	%g7,	0x11D0,	%i1
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	movrgz	%i3,	0x025,	%g2
	fmovd	%f2,	%f2
	movcc	%icc,	%o0,	%l0
	fmovdcc	%xcc,	%f26,	%f7
	sll	%o6,	0x1C,	%g5
	mulscc	%o2,	%o7,	%i0
	movre	%l5,	0x2C0,	%i7
	alignaddr	%g1,	%o5,	%o3
	xor	%o1,	0x0299,	%i6
	stb	%g6,	[%l7 + 0x53]
	andn	%o4,	0x11C6,	%l2
	ldd	[%l7 + 0x58],	%f26
	fmovsl	%icc,	%f5,	%f2
	fcmpgt32	%f26,	%f28,	%l6
	and	%l1,	%i5,	%g3
	mova	%icc,	%i2,	%l4
	ldsw	[%l7 + 0x64],	%g4
	fmovsge	%icc,	%f25,	%f17
	andcc	%g7,	%l3,	%i4
	edge16l	%i1,	%g2,	%i3
	edge8l	%o0,	%o6,	%l0
	movcc	%icc,	%g5,	%o7
	mova	%icc,	%i0,	%o2
	faligndata	%f8,	%f30,	%f14
	edge32l	%l5,	%g1,	%i7
	movg	%xcc,	%o3,	%o1
	movneg	%xcc,	%i6,	%o5
	andn	%g6,	%l2,	%l6
	edge16	%o4,	%l1,	%g3
	ldsb	[%l7 + 0x31],	%i5
	ldsh	[%l7 + 0x58],	%l4
	fmovdvs	%xcc,	%f25,	%f22
	xnor	%i2,	%g7,	%l3
	edge16n	%i4,	%i1,	%g2
	nop
	set	0x48, %o5
	std	%f24,	[%l7 + %o5]
	edge32ln	%i3,	%g4,	%o0
	udivcc	%l0,	0x0118,	%g5
	addc	%o7,	%i0,	%o6
	array8	%o2,	%g1,	%i7
	add	%o3,	%o1,	%i6
	umulcc	%l5,	%o5,	%l2
	or	%g6,	%l6,	%l1
	andn	%o4,	0x0157,	%g3
	sethi	0x0CAE,	%i5
	ldsb	[%l7 + 0x0A],	%i2
	fmul8x16al	%f3,	%f19,	%f4
	ld	[%l7 + 0x3C],	%f30
	subcc	%g7,	0x0902,	%l4
	ldx	[%l7 + 0x70],	%i4
	smulcc	%i1,	%g2,	%l3
	movrgz	%i3,	0x38B,	%g4
	movge	%icc,	%l0,	%o0
	ldsh	[%l7 + 0x1E],	%o7
	alignaddr	%g5,	%i0,	%o2
	fsrc1	%f14,	%f10
	movneg	%xcc,	%g1,	%i7
	udiv	%o3,	0x1525,	%o6
	srax	%o1,	%i6,	%o5
	ldub	[%l7 + 0x3C],	%l5
	nop
	set	0x44, %i1
	lduw	[%l7 + %i1],	%l2
	or	%l6,	%g6,	%o4
	stx	%l1,	[%l7 + 0x20]
	lduh	[%l7 + 0x12],	%g3
	stw	%i2,	[%l7 + 0x24]
	fmovsge	%icc,	%f12,	%f0
	edge16n	%g7,	%i5,	%i4
	orn	%l4,	0x10B0,	%i1
	smul	%g2,	%i3,	%l3
	movl	%xcc,	%l0,	%o0
	xor	%g4,	0x03CA,	%g5
	fsrc1	%f26,	%f22
	fones	%f8
	pdist	%f24,	%f2,	%f0
	movrlez	%o7,	0x06B,	%o2
	subcc	%g1,	%i7,	%i0
	fmuld8ulx16	%f19,	%f23,	%f20
	fmuld8ulx16	%f28,	%f5,	%f16
	movleu	%icc,	%o3,	%o1
	fmovd	%f18,	%f12
	udivx	%i6,	0x0C4A,	%o5
	sdiv	%l5,	0x0CD6,	%o6
	array32	%l2,	%l6,	%g6
	srax	%o4,	%l1,	%i2
	edge32n	%g3,	%g7,	%i4
	std	%f28,	[%l7 + 0x18]
	subccc	%i5,	%i1,	%l4
	fnors	%f25,	%f16,	%f3
	subccc	%g2,	%i3,	%l3
	fsrc1	%f16,	%f10
	alignaddrl	%l0,	%g4,	%o0
	andn	%g5,	0x19D2,	%o2
	sth	%o7,	[%l7 + 0x10]
	fmovsvc	%icc,	%f25,	%f2
	movcc	%xcc,	%g1,	%i7
	movn	%xcc,	%i0,	%o3
	movl	%icc,	%i6,	%o1
	fmovdn	%xcc,	%f17,	%f1
	stb	%l5,	[%l7 + 0x7B]
	udivcc	%o6,	0x0334,	%o5
	movrgz	%l6,	0x39F,	%l2
	and	%o4,	0x0822,	%l1
	ldsh	[%l7 + 0x64],	%i2
	udivcc	%g6,	0x1E1C,	%g7
	orcc	%i4,	%i5,	%g3
	fmovsleu	%icc,	%f16,	%f27
	mova	%xcc,	%i1,	%l4
	edge8n	%i3,	%g2,	%l3
	movrgez	%l0,	%g4,	%o0
	movrlz	%g5,	%o7,	%o2
	mulx	%i7,	%g1,	%o3
	xnorcc	%i6,	0x0003,	%i0
	movvc	%icc,	%o1,	%l5
	sll	%o5,	%o6,	%l2
	movle	%xcc,	%o4,	%l6
	siam	0x6
	ldsb	[%l7 + 0x29],	%l1
	movvc	%icc,	%i2,	%g6
	edge32l	%g7,	%i4,	%g3
	addcc	%i1,	0x17E7,	%l4
	faligndata	%f18,	%f20,	%f4
	movne	%icc,	%i5,	%g2
	edge16n	%l3,	%i3,	%l0
	ld	[%l7 + 0x74],	%f20
	movrlez	%g4,	0x2D2,	%o0
	sllx	%g5,	%o2,	%o7
	movg	%xcc,	%g1,	%o3
	popc	%i7,	%i0
	xor	%o1,	%i6,	%l5
	movgu	%icc,	%o5,	%o6
	fcmpeq16	%f18,	%f16,	%o4
	ld	[%l7 + 0x40],	%f19
	ldx	[%l7 + 0x30],	%l6
	addccc	%l1,	%i2,	%g6
	fmovs	%f8,	%f1
	sth	%l2,	[%l7 + 0x08]
	movne	%xcc,	%i4,	%g3
	sllx	%g7,	0x1B,	%i1
	fmovrdne	%l4,	%f4,	%f8
	movgu	%icc,	%i5,	%g2
	st	%f4,	[%l7 + 0x14]
	movrgz	%i3,	%l0,	%g4
	srlx	%o0,	0x14,	%l3
	orncc	%o2,	%o7,	%g5
	fabsd	%f14,	%f0
	lduw	[%l7 + 0x08],	%g1
	edge16	%i7,	%o3,	%i0
	movpos	%xcc,	%o1,	%l5
	fmovdneg	%icc,	%f15,	%f23
	array16	%i6,	%o5,	%o6
	umulcc	%o4,	%l1,	%i2
	movg	%icc,	%l6,	%l2
	ldsh	[%l7 + 0x64],	%i4
	stb	%g6,	[%l7 + 0x6B]
	umul	%g3,	0x0691,	%g7
	sdivx	%i1,	0x09BA,	%i5
	nop
	set	0x46, %i7
	ldsb	[%l7 + %i7],	%l4
	fnegs	%f7,	%f7
	fmovscs	%xcc,	%f24,	%f0
	sra	%g2,	%l0,	%g4
	edge32l	%o0,	%l3,	%o2
	sub	%i3,	0x00BE,	%o7
	ldd	[%l7 + 0x28],	%f18
	nop
	set	0x10, %i6
	stw	%g1,	[%l7 + %i6]
	move	%icc,	%g5,	%o3
	ldx	[%l7 + 0x58],	%i0
	movrgez	%i7,	0x2D0,	%o1
	fmul8x16	%f8,	%f22,	%f8
	fmovsg	%icc,	%f23,	%f12
	movrlz	%l5,	0x066,	%i6
	fors	%f11,	%f18,	%f19
	movrgz	%o5,	0x31C,	%o6
	sll	%o4,	0x01,	%i2
	std	%f30,	[%l7 + 0x10]
	fmul8x16au	%f9,	%f18,	%f24
	fnot2s	%f14,	%f2
	lduh	[%l7 + 0x58],	%l6
	bshuffle	%f12,	%f30,	%f0
	fpack16	%f6,	%f10
	orcc	%l1,	0x0B1D,	%i4
	fzeros	%f27
	stx	%g6,	[%l7 + 0x40]
	ldsh	[%l7 + 0x7A],	%l2
	edge32l	%g7,	%g3,	%i1
	ldsb	[%l7 + 0x67],	%i5
	smul	%l4,	0x1D6F,	%l0
	edge32ln	%g2,	%g4,	%l3
	lduh	[%l7 + 0x1C],	%o0
	sth	%o2,	[%l7 + 0x34]
	stw	%o7,	[%l7 + 0x6C]
	sdivcc	%g1,	0x0251,	%g5
	move	%icc,	%i3,	%i0
	fxor	%f28,	%f24,	%f4
	fpsub32s	%f11,	%f2,	%f15
	sethi	0x1E9F,	%o3
	movle	%xcc,	%o1,	%l5
	ld	[%l7 + 0x40],	%f23
	edge8l	%i7,	%o5,	%i6
	edge32ln	%o4,	%i2,	%o6
	movcs	%xcc,	%l6,	%i4
	edge16l	%g6,	%l2,	%l1
	orncc	%g7,	0x1F62,	%i1
	ldx	[%l7 + 0x50],	%g3
	sdiv	%i5,	0x1F3E,	%l4
	srax	%l0,	%g4,	%g2
	sllx	%o0,	%o2,	%l3
	fmovdn	%icc,	%f15,	%f20
	ld	[%l7 + 0x14],	%f23
	srl	%g1,	%o7,	%g5
	subccc	%i3,	%i0,	%o1
	umulcc	%l5,	0x179B,	%o3
	lduw	[%l7 + 0x78],	%o5
	srax	%i6,	0x01,	%i7
	movpos	%icc,	%i2,	%o4
	ldx	[%l7 + 0x70],	%l6
	edge8l	%o6,	%i4,	%l2
	fornot2s	%f21,	%f22,	%f9
	srax	%l1,	%g6,	%i1
	fcmpne16	%f26,	%f10,	%g3
	movle	%icc,	%g7,	%l4
	movvs	%icc,	%l0,	%i5
	fsrc1	%f8,	%f14
	movneg	%icc,	%g4,	%g2
	movvs	%xcc,	%o0,	%o2
	andn	%g1,	0x1893,	%o7
	udivx	%l3,	0x0ACA,	%i3
	movneg	%xcc,	%i0,	%g5
	fmul8x16al	%f21,	%f28,	%f10
	move	%icc,	%o1,	%l5
	save %o5, 0x017F, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x64],	%i6
	srax	%i2,	%i7,	%o4
	sdivx	%l6,	0x1F05,	%i4
	fabss	%f27,	%f24
	fandnot2s	%f3,	%f22,	%f18
	edge8ln	%l2,	%o6,	%g6
	add	%i1,	0x0C50,	%g3
	fmovrdne	%l1,	%f12,	%f6
	edge16l	%l4,	%g7,	%l0
	or	%g4,	0x0356,	%i5
	popc	%g2,	%o2
	edge8n	%o0,	%o7,	%l3
	edge8n	%i3,	%i0,	%g5
	edge16n	%g1,	%l5,	%o1
	fxor	%f18,	%f2,	%f24
	sdivx	%o5,	0x10BD,	%o3
	srl	%i2,	0x0B,	%i7
	movge	%xcc,	%i6,	%o4
	subccc	%l6,	%i4,	%l2
	add	%o6,	0x0660,	%g6
	fpmerge	%f21,	%f13,	%f16
	fnot2	%f10,	%f0
	lduw	[%l7 + 0x30],	%i1
	popc	0x0536,	%l1
	orn	%g3,	%l4,	%g7
	fcmpd	%fcc2,	%f8,	%f16
	and	%g4,	%l0,	%i5
	xorcc	%o2,	%g2,	%o0
	edge8ln	%o7,	%l3,	%i3
	fcmpes	%fcc0,	%f1,	%f27
	edge32ln	%i0,	%g5,	%l5
	fmovda	%icc,	%f12,	%f12
	movgu	%xcc,	%o1,	%o5
	add	%g1,	0x1129,	%i2
	edge32ln	%i7,	%o3,	%o4
	st	%f31,	[%l7 + 0x48]
	edge32ln	%i6,	%l6,	%l2
	orncc	%i4,	0x150F,	%o6
	fmovdle	%icc,	%f1,	%f11
	array16	%i1,	%l1,	%g6
	edge8	%g3,	%g7,	%l4
	edge8	%l0,	%g4,	%o2
	mulx	%g2,	%i5,	%o7
	restore %o0, %i3, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g5,	0x1762,	%l5
	edge32ln	%o1,	%i0,	%g1
	fmovdpos	%xcc,	%f6,	%f14
	addc	%i2,	%i7,	%o5
	fmovs	%f20,	%f15
	edge32	%o3,	%i6,	%o4
	xor	%l6,	%i4,	%l2
	edge16	%i1,	%o6,	%l1
	andcc	%g6,	0x0F27,	%g7
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	movrgez	%o2,	%l0,	%i5
	fandnot2s	%f23,	%f10,	%f17
	movcs	%icc,	%g2,	%o7
	sdiv	%i3,	0x0AFC,	%o0
	srl	%l3,	%g5,	%l5
	array16	%i0,	%o1,	%g1
	fmovd	%f28,	%f10
	fpack32	%f26,	%f16,	%f22
	add	%i2,	0x0720,	%o5
	popc	0x114B,	%o3
	addcc	%i7,	%i6,	%l6
	movcs	%xcc,	%i4,	%l2
	ld	[%l7 + 0x68],	%f11
	move	%icc,	%o4,	%i1
	fmovdcs	%icc,	%f16,	%f20
	xnor	%o6,	0x1ACE,	%g6
	srl	%g7,	0x07,	%g3
	movcs	%icc,	%l1,	%g4
	fones	%f24
	fors	%f9,	%f4,	%f2
	mova	%icc,	%l4,	%o2
	fmuld8sux16	%f1,	%f8,	%f12
	fmovde	%icc,	%f8,	%f29
	movle	%icc,	%l0,	%g2
	save %i5, %i3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%l3,	[%l7 + 0x60]
	umulcc	%g5,	%l5,	%i0
	srax	%o1,	0x15,	%o0
	ldd	[%l7 + 0x40],	%i2
	lduw	[%l7 + 0x74],	%o5
	sdiv	%o3,	0x1A07,	%g1
	movl	%xcc,	%i7,	%l6
	udiv	%i4,	0x0C4C,	%i6
	ldd	[%l7 + 0x38],	%f8
	xnor	%o4,	0x1883,	%l2
	fmovsleu	%icc,	%f28,	%f8
	std	%f26,	[%l7 + 0x68]
	movl	%icc,	%i1,	%g6
	mova	%xcc,	%o6,	%g3
	movrgz	%g7,	%g4,	%l4
	fsrc1	%f10,	%f8
	fcmps	%fcc1,	%f26,	%f22
	fands	%f9,	%f27,	%f0
	subcc	%l1,	%o2,	%l0
	or	%g2,	%i3,	%o7
	movl	%xcc,	%l3,	%g5
	ldub	[%l7 + 0x1D],	%l5
	edge16l	%i0,	%o1,	%i5
	edge8	%i2,	%o5,	%o3
	mova	%xcc,	%g1,	%i7
	fmovdge	%xcc,	%f17,	%f6
	andcc	%l6,	0x1691,	%i4
	udivx	%o0,	0x11E8,	%i6
	fmovdg	%icc,	%f15,	%f15
	popc	0x0045,	%l2
	srlx	%o4,	%g6,	%o6
	movgu	%icc,	%g3,	%i1
	edge16n	%g4,	%g7,	%l4
	save %o2, 0x14C2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%l1,	%g2
	edge32l	%o7,	%i3,	%g5
	movvc	%xcc,	%l5,	%i0
	sethi	0x006C,	%o1
	srl	%l3,	0x10,	%i2
	udivx	%o5,	0x1478,	%i5
	edge16l	%o3,	%g1,	%l6
	sdivcc	%i4,	0x1D46,	%i7
	pdist	%f6,	%f18,	%f0
	fmovdcc	%xcc,	%f0,	%f22
	addccc	%o0,	0x1649,	%i6
	fcmpne16	%f20,	%f24,	%o4
	popc	0x1465,	%l2
	sth	%o6,	[%l7 + 0x7E]
	fpadd16s	%f29,	%f7,	%f25
	movge	%xcc,	%g6,	%g3
	edge16n	%g4,	%i1,	%g7
	edge8ln	%l4,	%l0,	%l1
	fmovrse	%g2,	%f26,	%f3
	array8	%o2,	%o7,	%g5
	save %i3, %i0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x14C5,	%l5
	add	%l3,	0x198B,	%o5
	srl	%i2,	%i5,	%g1
	movcc	%icc,	%o3,	%l6
	movvs	%icc,	%i4,	%i7
	sdivcc	%i6,	0x025A,	%o0
	movre	%l2,	0x1F5,	%o6
	addccc	%g6,	0x048E,	%g3
	movl	%xcc,	%g4,	%i1
	fpsub16s	%f18,	%f27,	%f18
	fmovdl	%icc,	%f18,	%f23
	edge16n	%g7,	%l4,	%l0
	mova	%icc,	%l1,	%o4
	fzero	%f14
	sll	%o2,	0x04,	%o7
	fmovsleu	%icc,	%f29,	%f29
	orn	%g5,	%g2,	%i0
	xorcc	%o1,	0x0049,	%l5
	alignaddr	%l3,	%o5,	%i3
	lduw	[%l7 + 0x4C],	%i2
	fcmps	%fcc1,	%f18,	%f6
	fcmpgt32	%f8,	%f28,	%g1
	edge32	%o3,	%i5,	%i4
	fsrc1s	%f21,	%f4
	movcc	%icc,	%i7,	%i6
	fcmpeq32	%f10,	%f22,	%l6
	ldd	[%l7 + 0x58],	%f30
	fnand	%f20,	%f4,	%f4
	movvc	%icc,	%o0,	%o6
	addc	%l2,	0x0A1F,	%g6
	ldub	[%l7 + 0x6D],	%g4
	array32	%g3,	%g7,	%l4
	ldsh	[%l7 + 0x10],	%l0
	andn	%i1,	0x10BE,	%l1
	ldsh	[%l7 + 0x52],	%o2
	fnot1	%f24,	%f4
	sethi	0x03E0,	%o7
	fmovsa	%xcc,	%f18,	%f23
	edge32l	%o4,	%g5,	%g2
	movleu	%xcc,	%o1,	%i0
	movge	%icc,	%l5,	%l3
	fmovdleu	%icc,	%f18,	%f6
	fabss	%f19,	%f22
	srax	%i3,	0x03,	%o5
	sdivcc	%g1,	0x1466,	%i2
	or	%o3,	0x18F1,	%i4
	restore %i7, 0x070C, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l6,	%o0
	smulcc	%i5,	%o6,	%g6
	movrgez	%g4,	%l2,	%g7
	sdiv	%l4,	0x0A8D,	%l0
	stw	%i1,	[%l7 + 0x2C]
	orn	%l1,	%g3,	%o2
	fabss	%f5,	%f25
	mova	%xcc,	%o4,	%g5
	fmovdn	%xcc,	%f0,	%f30
	add	%g2,	%o1,	%o7
	addccc	%i0,	%l5,	%l3
	sethi	0x009B,	%i3
	movvc	%xcc,	%o5,	%i2
	fmovsn	%icc,	%f18,	%f30
	ldsb	[%l7 + 0x0F],	%o3
	or	%i4,	0x1B17,	%g1
	udiv	%i7,	0x0F8B,	%i6
	fmovdgu	%icc,	%f10,	%f12
	stb	%l6,	[%l7 + 0x64]
	fmovde	%icc,	%f29,	%f8
	or	%o0,	%i5,	%o6
	movne	%xcc,	%g6,	%g4
	ldd	[%l7 + 0x68],	%f30
	st	%f27,	[%l7 + 0x6C]
	mulx	%g7,	%l2,	%l4
	fcmpeq16	%f24,	%f22,	%l0
	xnorcc	%l1,	0x1928,	%i1
	sll	%o2,	%o4,	%g5
	movg	%icc,	%g2,	%o1
	ldd	[%l7 + 0x70],	%o6
	fmovsgu	%xcc,	%f17,	%f10
	stx	%i0,	[%l7 + 0x30]
	nop
	set	0x58, %i5
	ldd	[%l7 + %i5],	%g2
	ld	[%l7 + 0x6C],	%f6
	alignaddr	%l5,	%l3,	%i3
	movrgez	%i2,	%o5,	%o3
	movrgez	%i4,	0x255,	%i7
	srl	%g1,	%i6,	%o0
	st	%f31,	[%l7 + 0x28]
	addcc	%l6,	%o6,	%i5
	fmovsgu	%icc,	%f8,	%f14
	subccc	%g4,	0x012D,	%g7
	orcc	%g6,	%l4,	%l2
	movle	%icc,	%l1,	%i1
	fnot1	%f30,	%f22
	udivcc	%l0,	0x17BB,	%o4
	movcc	%xcc,	%o2,	%g2
	fmovsa	%xcc,	%f8,	%f2
	fmovdneg	%icc,	%f26,	%f3
	xorcc	%o1,	0x0321,	%o7
	fpsub16s	%f1,	%f4,	%f25
	or	%i0,	%g5,	%g3
	addc	%l3,	%l5,	%i2
	sth	%i3,	[%l7 + 0x58]
	fmovdne	%xcc,	%f20,	%f16
	ldsw	[%l7 + 0x58],	%o5
	xorcc	%o3,	0x0A6D,	%i7
	ldd	[%l7 + 0x58],	%i4
	sir	0x02D7
	edge32n	%g1,	%o0,	%l6
	movrgz	%i6,	0x28E,	%i5
	siam	0x4
	edge8	%g4,	%o6,	%g6
	srax	%g7,	0x01,	%l4
	fmul8x16al	%f25,	%f21,	%f10
	movle	%xcc,	%l1,	%l2
	fmovdl	%icc,	%f2,	%f11
	xnorcc	%l0,	0x0BA9,	%o4
	smul	%i1,	%o2,	%o1
	and	%g2,	0x000B,	%i0
	movle	%xcc,	%o7,	%g5
	sllx	%g3,	0x1B,	%l3
	st	%f26,	[%l7 + 0x30]
	movge	%icc,	%i2,	%i3
	edge32	%o5,	%o3,	%i7
	udiv	%l5,	0x00E3,	%i4
	movrne	%g1,	%o0,	%i6
	srax	%i5,	%l6,	%g4
	or	%o6,	%g7,	%l4
	fabss	%f30,	%f22
	ldsh	[%l7 + 0x44],	%l1
	fmul8ulx16	%f16,	%f4,	%f16
	fpsub32	%f0,	%f6,	%f10
	udivx	%l2,	0x08DF,	%g6
	ldsb	[%l7 + 0x5B],	%o4
	lduw	[%l7 + 0x44],	%i1
	fmovdneg	%xcc,	%f1,	%f27
	orn	%l0,	0x0692,	%o2
	addc	%g2,	0x0982,	%o1
	movne	%icc,	%i0,	%o7
	array32	%g3,	%l3,	%g5
	and	%i2,	%i3,	%o5
	ld	[%l7 + 0x08],	%f28
	addc	%o3,	%l5,	%i7
	fmovrdgz	%g1,	%f0,	%f6
	fmovsn	%xcc,	%f27,	%f14
	orncc	%o0,	0x0ACB,	%i4
	edge8	%i5,	%l6,	%g4
	stb	%o6,	[%l7 + 0x41]
	umul	%i6,	0x0261,	%l4
	mulscc	%l1,	%g7,	%g6
	fnot2	%f4,	%f16
	addcc	%l2,	%o4,	%l0
	smul	%o2,	%i1,	%g2
	sllx	%i0,	0x16,	%o1
	fmovse	%icc,	%f23,	%f13
	movrlz	%g3,	0x116,	%l3
	fornot1	%f16,	%f10,	%f30
	fmovsneg	%icc,	%f22,	%f0
	fmovrdlz	%g5,	%f26,	%f20
	stb	%o7,	[%l7 + 0x42]
	fmovda	%icc,	%f21,	%f4
	st	%f21,	[%l7 + 0x48]
	udivx	%i3,	0x0A9B,	%i2
	srl	%o5,	%o3,	%i7
	fpsub16s	%f1,	%f14,	%f20
	ldx	[%l7 + 0x28],	%l5
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	or	%l6,	%o0,	%g4
	xnorcc	%i6,	%o6,	%l4
	fpack16	%f16,	%f13
	movl	%icc,	%g7,	%l1
	fpmerge	%f24,	%f31,	%f6
	subccc	%g6,	%o4,	%l2
	movne	%xcc,	%o2,	%i1
	sdiv	%l0,	0x015F,	%i0
	restore %g2, %o1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%g5,	%l3
	sir	0x17E2
	fcmpeq16	%f10,	%f14,	%o7
	orcc	%i3,	%i2,	%o5
	alignaddrl	%i7,	%o3,	%l5
	sdiv	%g1,	0x0E9A,	%i5
	popc	%l6,	%o0
	xnor	%i4,	%i6,	%o6
	array32	%l4,	%g7,	%g4
	movn	%icc,	%g6,	%l1
	addc	%l2,	%o2,	%i1
	fzeros	%f1
	mulx	%o4,	%i0,	%l0
	sir	0x0BFB
	stw	%o1,	[%l7 + 0x64]
	xorcc	%g2,	0x0FAF,	%g3
	ldsb	[%l7 + 0x3F],	%g5
	fmovdcs	%xcc,	%f18,	%f29
	fpsub32	%f16,	%f2,	%f8
	and	%o7,	0x0C2E,	%l3
	umulcc	%i3,	%i2,	%o5
	edge8ln	%o3,	%i7,	%l5
	mulscc	%g1,	%i5,	%l6
	edge32n	%o0,	%i4,	%o6
	andcc	%i6,	%g7,	%l4
	fcmple16	%f4,	%f0,	%g4
	orcc	%g6,	%l2,	%o2
	stw	%i1,	[%l7 + 0x58]
	movvs	%icc,	%o4,	%l1
	xnor	%l0,	0x0D7F,	%o1
	movgu	%xcc,	%g2,	%i0
	or	%g3,	0x1416,	%o7
	mulscc	%l3,	%g5,	%i2
	movcs	%xcc,	%o5,	%o3
	sub	%i3,	0x167D,	%l5
	fmul8x16au	%f23,	%f16,	%f30
	smul	%i7,	%i5,	%g1
	movvc	%xcc,	%l6,	%i4
	movrlz	%o0,	%i6,	%o6
	mulx	%l4,	%g7,	%g4
	subccc	%g6,	0x1635,	%o2
	sdivcc	%l2,	0x0776,	%i1
	andncc	%l1,	%l0,	%o4
	fnor	%f6,	%f8,	%f0
	xnor	%o1,	%i0,	%g2
	fmovrse	%o7,	%f15,	%f3
	move	%xcc,	%g3,	%g5
	movrgez	%i2,	0x318,	%o5
	subc	%o3,	%l3,	%l5
	ldub	[%l7 + 0x7D],	%i3
	udivx	%i5,	0x0C95,	%i7
	smul	%g1,	%l6,	%i4
	alignaddr	%o0,	%i6,	%o6
	movneg	%xcc,	%g7,	%g4
	orn	%g6,	0x1C4C,	%o2
	movcc	%xcc,	%l4,	%l2
	andcc	%l1,	0x1832,	%i1
	movpos	%icc,	%o4,	%l0
	andncc	%i0,	%g2,	%o1
	srax	%g3,	%g5,	%o7
	and	%o5,	0x1EA6,	%o3
	movcs	%icc,	%i2,	%l3
	array32	%i3,	%i5,	%l5
	edge8n	%g1,	%i7,	%i4
	srl	%l6,	%i6,	%o0
	subccc	%g7,	0x1CC3,	%o6
	andn	%g4,	0x13FC,	%o2
	ldd	[%l7 + 0x40],	%f6
	addc	%l4,	0x0DC5,	%l2
	movleu	%icc,	%g6,	%l1
	fmuld8sux16	%f1,	%f6,	%f20
	fnot2	%f6,	%f22
	fnand	%f12,	%f22,	%f4
	movrne	%i1,	%o4,	%l0
	edge32ln	%i0,	%o1,	%g3
	mulscc	%g5,	%o7,	%o5
	movvs	%icc,	%o3,	%g2
	nop
	set	0x78, %i3
	ldd	[%l7 + %i3],	%f26
	array32	%i2,	%i3,	%i5
	andncc	%l3,	%l5,	%i7
	orncc	%i4,	%g1,	%l6
	ld	[%l7 + 0x08],	%f26
	or	%i6,	%g7,	%o0
	stb	%g4,	[%l7 + 0x26]
	ldd	[%l7 + 0x60],	%f14
	fnor	%f4,	%f16,	%f6
	sir	0x1537
	array8	%o6,	%o2,	%l2
	andcc	%g6,	%l4,	%l1
	stx	%o4,	[%l7 + 0x48]
	sth	%i1,	[%l7 + 0x32]
	movvc	%xcc,	%l0,	%o1
	srax	%g3,	0x18,	%i0
	nop
	set	0x40, %g6
	std	%f28,	[%l7 + %g6]
	orncc	%o7,	0x18DC,	%o5
	ldsw	[%l7 + 0x44],	%o3
	fand	%f10,	%f0,	%f28
	alignaddr	%g5,	%i2,	%i3
	edge8n	%i5,	%g2,	%l5
	srax	%i7,	0x13,	%l3
	xor	%g1,	0x0620,	%l6
	ld	[%l7 + 0x34],	%f3
	mulscc	%i6,	0x1569,	%g7
	movre	%i4,	%o0,	%o6
	move	%icc,	%g4,	%o2
	fnot1s	%f11,	%f26
	edge8	%g6,	%l4,	%l1
	subcc	%l2,	0x1683,	%i1
	fnot2	%f20,	%f22
	ldsh	[%l7 + 0x4A],	%l0
	bshuffle	%f4,	%f16,	%f12
	ldsw	[%l7 + 0x28],	%o1
	movvs	%xcc,	%g3,	%i0
	xnorcc	%o4,	%o5,	%o7
	ldub	[%l7 + 0x0B],	%g5
	sdivx	%i2,	0x12F8,	%o3
	movneg	%icc,	%i5,	%g2
	fsrc2s	%f9,	%f13
	movg	%icc,	%i3,	%i7
	fornot2	%f20,	%f20,	%f0
	movn	%icc,	%l5,	%l3
	edge16ln	%g1,	%l6,	%g7
	fnegd	%f18,	%f4
	edge32	%i6,	%o0,	%o6
	edge32n	%i4,	%o2,	%g6
	save %l4, 0x1698, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l2,	0x053D,	%i1
	movrne	%g4,	%o1,	%l0
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	orn	%o7,	%o4,	%i2
	xnor	%g5,	0x0A26,	%i5
	fxors	%f9,	%f28,	%f20
	ldsw	[%l7 + 0x68],	%o3
	array32	%g2,	%i7,	%i3
	edge16	%l3,	%l5,	%g1
	srax	%g7,	0x12,	%i6
	fmul8x16au	%f8,	%f20,	%f8
	fmovsgu	%xcc,	%f30,	%f14
	stb	%o0,	[%l7 + 0x43]
	mulx	%o6,	%l6,	%o2
	stb	%g6,	[%l7 + 0x5B]
	umulcc	%l4,	0x0F18,	%l1
	addc	%l2,	0x0AD8,	%i4
	smul	%g4,	0x187A,	%i1
	fmovdpos	%xcc,	%f13,	%f3
	mulx	%l0,	%o1,	%g3
	sethi	0x1BC0,	%o5
	sdivcc	%o7,	0x1DA5,	%i0
	and	%i2,	0x1FD3,	%o4
	movrlez	%i5,	0x052,	%g5
	array32	%g2,	%o3,	%i3
	ldd	[%l7 + 0x28],	%f18
	movcs	%xcc,	%i7,	%l5
	alignaddr	%l3,	%g1,	%g7
	movrlez	%i6,	0x1B9,	%o6
	edge8l	%l6,	%o0,	%g6
	sth	%l4,	[%l7 + 0x08]
	edge32ln	%l1,	%l2,	%i4
	fnot2s	%f30,	%f9
	sll	%g4,	%i1,	%o2
	subccc	%o1,	%g3,	%l0
	movn	%xcc,	%o7,	%o5
	umul	%i0,	%o4,	%i2
	srl	%g5,	%g2,	%o3
	subc	%i5,	%i7,	%i3
	array8	%l5,	%g1,	%l3
	movvs	%icc,	%i6,	%o6
	movrgz	%g7,	0x241,	%l6
	alignaddr	%g6,	%o0,	%l4
	movcc	%icc,	%l1,	%i4
	fsrc1	%f4,	%f22
	faligndata	%f10,	%f2,	%f8
	fmul8x16	%f7,	%f6,	%f18
	movvs	%xcc,	%g4,	%l2
	movg	%xcc,	%i1,	%o2
	movpos	%icc,	%o1,	%l0
	fmovsvc	%xcc,	%f20,	%f22
	sub	%g3,	0x15C8,	%o5
	fones	%f7
	fnors	%f6,	%f1,	%f28
	or	%i0,	0x0091,	%o7
	fmovrdne	%o4,	%f2,	%f30
	fmovrsgez	%g5,	%f2,	%f26
	fmovrde	%i2,	%f10,	%f28
	stx	%o3,	[%l7 + 0x18]
	movle	%icc,	%i5,	%i7
	subc	%i3,	%l5,	%g2
	movrlz	%g1,	0x2CB,	%i6
	fmovse	%xcc,	%f13,	%f28
	nop
	set	0x68, %g4
	stw	%l3,	[%l7 + %g4]
	ldx	[%l7 + 0x40],	%g7
	movvc	%icc,	%l6,	%g6
	movleu	%xcc,	%o6,	%o0
	sub	%l1,	%i4,	%g4
	edge32l	%l2,	%i1,	%l4
	movrlez	%o1,	0x3AC,	%o2
	fmovsle	%icc,	%f8,	%f1
	edge8ln	%l0,	%o5,	%i0
	xnorcc	%g3,	0x1396,	%o7
	array32	%o4,	%g5,	%o3
	alignaddrl	%i5,	%i2,	%i3
	sdivcc	%l5,	0x0586,	%g2
	stx	%i7,	[%l7 + 0x40]
	lduw	[%l7 + 0x74],	%g1
	movvc	%xcc,	%l3,	%g7
	std	%f16,	[%l7 + 0x50]
	orn	%i6,	0x1A5F,	%l6
	or	%g6,	%o0,	%l1
	movcs	%xcc,	%o6,	%i4
	stb	%l2,	[%l7 + 0x42]
	orcc	%g4,	%i1,	%o1
	fmovse	%xcc,	%f21,	%f9
	srlx	%l4,	%o2,	%o5
	edge32ln	%l0,	%i0,	%o7
	fmul8ulx16	%f8,	%f22,	%f28
	movleu	%icc,	%o4,	%g3
	movrlez	%g5,	%o3,	%i5
	addcc	%i2,	%i3,	%l5
	stw	%g2,	[%l7 + 0x24]
	udiv	%i7,	0x10DB,	%l3
	movgu	%xcc,	%g7,	%g1
	alignaddrl	%i6,	%l6,	%o0
	fmovsg	%icc,	%f19,	%f3
	popc	0x0ED2,	%g6
	movne	%xcc,	%l1,	%o6
	fornot2s	%f20,	%f1,	%f16
	fmovdne	%icc,	%f11,	%f8
	movleu	%icc,	%i4,	%g4
	udivx	%l2,	0x1F5D,	%o1
	or	%i1,	%o2,	%o5
	movvs	%icc,	%l4,	%l0
	edge32ln	%o7,	%o4,	%i0
	movl	%xcc,	%g5,	%o3
	array8	%g3,	%i5,	%i2
	edge8ln	%l5,	%i3,	%g2
	orcc	%i7,	%l3,	%g7
	fpadd32s	%f14,	%f20,	%f4
	std	%f12,	[%l7 + 0x50]
	xnor	%g1,	0x1490,	%l6
	save %i6, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o6,	%i4,	%l1
	sllx	%l2,	0x15,	%o1
	movpos	%xcc,	%i1,	%g4
	edge16ln	%o2,	%l4,	%o5
	ldsb	[%l7 + 0x10],	%l0
	movrlz	%o7,	%o4,	%g5
	fmovrdlz	%i0,	%f22,	%f24
	movleu	%icc,	%g3,	%o3
	save %i2, 0x0EB2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l5,	0x0B36,	%i3
	xnor	%i7,	0x0D93,	%l3
	smul	%g7,	%g1,	%l6
	restore %g2, %g6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o0,	%o6,	%l1
	edge16n	%i4,	%o1,	%i1
	stw	%g4,	[%l7 + 0x1C]
	sdivx	%o2,	0x06F6,	%l2
	udivx	%l4,	0x0A15,	%l0
	fnands	%f29,	%f24,	%f22
	fpadd16s	%f31,	%f26,	%f22
	sll	%o5,	0x1E,	%o4
	movne	%xcc,	%g5,	%o7
	addc	%g3,	0x1E68,	%i0
	sll	%i2,	0x1C,	%o3
	or	%i5,	%l5,	%i3
	array16	%l3,	%g7,	%i7
	movrlz	%g1,	0x2A1,	%g2
	ldub	[%l7 + 0x4B],	%g6
	movrgz	%l6,	0x39E,	%i6
	edge8n	%o0,	%l1,	%o6
	movrlz	%o1,	%i4,	%i1
	xorcc	%o2,	0x1C85,	%g4
	edge16	%l2,	%l4,	%l0
	edge8	%o5,	%g5,	%o4
	xnorcc	%g3,	0x03FE,	%i0
	st	%f20,	[%l7 + 0x0C]
	movl	%xcc,	%o7,	%o3
	edge16n	%i2,	%l5,	%i3
	array32	%l3,	%i5,	%g7
	sra	%g1,	%g2,	%i7
	subcc	%g6,	0x1691,	%i6
	ldsb	[%l7 + 0x67],	%o0
	edge8ln	%l1,	%o6,	%o1
	orcc	%l6,	0x1C86,	%i4
	edge32n	%o2,	%i1,	%g4
	fornot1	%f2,	%f4,	%f2
	fcmpgt32	%f6,	%f20,	%l2
	fsrc1s	%f18,	%f21
	fmovrdne	%l4,	%f28,	%f8
	fandnot2	%f10,	%f2,	%f2
	movle	%xcc,	%o5,	%l0
	fmovrdgez	%o4,	%f14,	%f0
	stw	%g3,	[%l7 + 0x74]
	edge8n	%g5,	%i0,	%o7
	movleu	%icc,	%o3,	%l5
	fmovrdlez	%i3,	%f12,	%f10
	sethi	0x1DE7,	%l3
	fpack32	%f14,	%f4,	%f18
	sdivcc	%i5,	0x0A27,	%g7
	sdivcc	%g1,	0x1AAD,	%g2
	fzeros	%f19
	movne	%icc,	%i7,	%i2
	edge8	%i6,	%o0,	%g6
	ldub	[%l7 + 0x70],	%o6
	fmovsl	%icc,	%f23,	%f24
	edge8	%o1,	%l6,	%i4
	fmovdneg	%xcc,	%f31,	%f19
	fpsub16	%f8,	%f12,	%f28
	xnor	%l1,	0x1BDE,	%i1
	movgu	%xcc,	%o2,	%l2
	srlx	%l4,	0x0B,	%o5
	fmovrslz	%l0,	%f8,	%f20
	xnor	%o4,	%g4,	%g5
	addc	%i0,	%o7,	%g3
	lduw	[%l7 + 0x10],	%o3
	sll	%l5,	%i3,	%l3
	movcs	%xcc,	%g7,	%i5
	orncc	%g1,	%i7,	%g2
	edge8l	%i6,	%i2,	%g6
	fpsub32s	%f8,	%f18,	%f24
	fpadd32s	%f23,	%f27,	%f15
	edge32n	%o0,	%o6,	%l6
	movneg	%xcc,	%o1,	%i4
	addcc	%l1,	%i1,	%l2
	sir	0x1EF2
	smulcc	%l4,	%o2,	%l0
	array8	%o4,	%g4,	%g5
	umul	%o5,	0x0709,	%o7
	alignaddrl	%i0,	%o3,	%l5
	ldsb	[%l7 + 0x36],	%g3
	mulx	%i3,	0x1CEC,	%l3
	andn	%i5,	0x16DD,	%g7
	movre	%i7,	0x2EE,	%g1
	srl	%i6,	%i2,	%g2
	addc	%o0,	%o6,	%l6
	fsrc2s	%f21,	%f27
	save %g6, 0x0C1E, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l1,	%o1
	fmovdl	%xcc,	%f17,	%f10
	movn	%xcc,	%l2,	%i1
	fmovd	%f26,	%f8
	save %l4, %l0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f18,	%f30
	fexpand	%f11,	%f16
	movgu	%icc,	%g4,	%o2
	fmovdcc	%xcc,	%f15,	%f5
	movne	%icc,	%g5,	%o5
	stw	%o7,	[%l7 + 0x4C]
	sth	%i0,	[%l7 + 0x5C]
	ldsw	[%l7 + 0x3C],	%o3
	subcc	%g3,	0x0FF3,	%l5
	and	%i3,	%l3,	%g7
	xor	%i5,	%i7,	%g1
	umulcc	%i2,	%i6,	%o0
	movne	%xcc,	%o6,	%g2
	subccc	%l6,	%g6,	%l1
	fnot1s	%f8,	%f29
	array8	%o1,	%l2,	%i4
	udivx	%i1,	0x0762,	%l4
	subcc	%o4,	%g4,	%o2
	sdivx	%g5,	0x155D,	%o5
	addcc	%o7,	0x1A69,	%i0
	xor	%l0,	%g3,	%o3
	fabsd	%f14,	%f0
	sll	%l5,	0x02,	%i3
	fpadd32	%f12,	%f10,	%f12
	movrlz	%g7,	%l3,	%i5
	movge	%icc,	%g1,	%i7
	and	%i2,	%o0,	%i6
	srax	%o6,	0x14,	%g2
	movrlez	%g6,	0x1CD,	%l1
	smul	%l6,	%o1,	%l2
	mova	%xcc,	%i1,	%l4
	mova	%icc,	%i4,	%g4
	stx	%o2,	[%l7 + 0x20]
	ldsw	[%l7 + 0x4C],	%g5
	ld	[%l7 + 0x58],	%f7
	edge32	%o5,	%o4,	%i0
	subc	%o7,	%g3,	%l0
	fmovsle	%xcc,	%f10,	%f25
	movrlez	%o3,	0x34C,	%l5
	movg	%icc,	%g7,	%i3
	xnor	%i5,	0x0977,	%g1
	smul	%l3,	%i2,	%i7
	movrgz	%i6,	%o0,	%o6
	movre	%g6,	0x169,	%l1
	ldsw	[%l7 + 0x6C],	%l6
	addccc	%o1,	%l2,	%i1
	sra	%g2,	0x18,	%l4
	fpadd32s	%f2,	%f19,	%f24
	lduw	[%l7 + 0x20],	%i4
	ldx	[%l7 + 0x18],	%o2
	umulcc	%g4,	0x1BF5,	%g5
	fmovspos	%xcc,	%f19,	%f4
	ld	[%l7 + 0x34],	%f7
	sethi	0x09A3,	%o4
	lduh	[%l7 + 0x2E],	%i0
	mulx	%o5,	%o7,	%l0
	array16	%o3,	%l5,	%g7
	fones	%f4
	fpsub32	%f0,	%f8,	%f22
	sra	%i3,	0x11,	%g3
	movneg	%xcc,	%i5,	%g1
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	movleu	%icc,	%o0,	%i6
	fmovrsgz	%o6,	%f21,	%f20
	fmovdl	%xcc,	%f19,	%f9
	srlx	%g6,	0x08,	%l1
	udiv	%l6,	0x15B1,	%l2
	umulcc	%i1,	0x1D20,	%g2
	fcmpd	%fcc0,	%f16,	%f28
	orncc	%l4,	%o1,	%i4
	mova	%icc,	%g4,	%g5
	ldsh	[%l7 + 0x24],	%o4
	mova	%xcc,	%i0,	%o5
	movrne	%o7,	%o2,	%o3
	edge32n	%l0,	%g7,	%l5
	edge16n	%i3,	%i5,	%g3
	array16	%g1,	%i7,	%i2
	save %o0, %i6, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovs	%f24,	%f15
	fcmpeq16	%f14,	%f12,	%l3
	umulcc	%l1,	%g6,	%l6
	ldsh	[%l7 + 0x40],	%i1
	st	%f0,	[%l7 + 0x0C]
	edge16n	%l2,	%l4,	%g2
	edge16n	%i4,	%g4,	%g5
	fmovsa	%xcc,	%f7,	%f30
	st	%f19,	[%l7 + 0x6C]
	fcmped	%fcc3,	%f16,	%f10
	udiv	%o4,	0x136A,	%i0
	lduw	[%l7 + 0x64],	%o1
	fpadd32	%f4,	%f24,	%f22
	orn	%o7,	0x168D,	%o2
	and	%o3,	0x080B,	%o5
	faligndata	%f0,	%f10,	%f14
	movl	%icc,	%l0,	%g7
	fcmple16	%f22,	%f0,	%i3
	st	%f26,	[%l7 + 0x14]
	movrne	%i5,	0x1B5,	%g3
	alignaddrl	%l5,	%i7,	%g1
	edge8n	%i2,	%i6,	%o6
	fmovdleu	%xcc,	%f28,	%f18
	sethi	0x1744,	%l3
	fexpand	%f21,	%f26
	ldsh	[%l7 + 0x54],	%l1
	edge32	%g6,	%o0,	%i1
	fmovdg	%icc,	%f7,	%f0
	fcmpgt32	%f30,	%f28,	%l2
	subcc	%l4,	%l6,	%i4
	xnor	%g2,	%g5,	%g4
	sdiv	%i0,	0x047D,	%o4
	smul	%o1,	%o7,	%o3
	ldsb	[%l7 + 0x42],	%o5
	xor	%o2,	0x0ACE,	%l0
	mulscc	%i3,	0x03F7,	%g7
	srax	%g3,	%l5,	%i5
	fones	%f21
	fsrc1	%f8,	%f12
	restore %i7, %g1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f30,	%f6,	%f2
	andcc	%o6,	0x1B70,	%l3
	sir	0x134D
	udiv	%l1,	0x0B1C,	%g6
	popc	%o0,	%i6
	udivcc	%l2,	0x13A4,	%l4
	fmuld8ulx16	%f4,	%f29,	%f12
	xnorcc	%l6,	%i1,	%g2
	ldsw	[%l7 + 0x18],	%g5
	sethi	0x1900,	%i4
	or	%i0,	%o4,	%o1
	and	%o7,	%o3,	%o5
	movvc	%xcc,	%g4,	%o2
	subcc	%l0,	0x1F50,	%i3
	fpsub16s	%f0,	%f19,	%f29
	fmovsge	%xcc,	%f18,	%f19
	ldsh	[%l7 + 0x66],	%g7
	fmovsvs	%icc,	%f23,	%f21
	movcc	%xcc,	%g3,	%l5
	edge32	%i7,	%g1,	%i5
	addc	%o6,	0x082D,	%l3
	sethi	0x1F6A,	%l1
	orncc	%g6,	%o0,	%i2
	sth	%l2,	[%l7 + 0x26]
	fsrc1s	%f14,	%f23
	movcs	%xcc,	%l4,	%i6
	sll	%i1,	%l6,	%g5
	movne	%xcc,	%i4,	%i0
	lduw	[%l7 + 0x44],	%g2
	edge32	%o4,	%o1,	%o7
	array32	%o5,	%g4,	%o2
	fands	%f23,	%f13,	%f2
	array32	%l0,	%i3,	%g7
	stx	%o3,	[%l7 + 0x20]
	sth	%l5,	[%l7 + 0x4C]
	movvs	%xcc,	%g3,	%g1
	lduh	[%l7 + 0x40],	%i5
	ldd	[%l7 + 0x70],	%f22
	st	%f8,	[%l7 + 0x78]
	edge32n	%i7,	%l3,	%o6
	array32	%g6,	%l1,	%i2
	fxnor	%f4,	%f16,	%f8
	movre	%l2,	0x25A,	%o0
	mulx	%l4,	0x190A,	%i1
	or	%i6,	0x1F6F,	%g5
	fmovda	%xcc,	%f16,	%f0
	ldd	[%l7 + 0x08],	%i4
	xor	%i0,	%g2,	%l6
	udiv	%o4,	0x07BB,	%o7
	ldsb	[%l7 + 0x54],	%o5
	xnor	%g4,	0x0FA8,	%o2
	mova	%xcc,	%o1,	%i3
	udivcc	%g7,	0x18EB,	%l0
	movrne	%o3,	%l5,	%g1
	move	%icc,	%i5,	%i7
	sethi	0x1109,	%g3
	fornot1s	%f28,	%f30,	%f19
	fpsub16s	%f29,	%f23,	%f19
	subcc	%o6,	%g6,	%l3
	umulcc	%l1,	0x09EE,	%l2
	fcmps	%fcc1,	%f8,	%f25
	subcc	%o0,	%l4,	%i1
	edge8l	%i2,	%i6,	%g5
	fpsub16	%f20,	%f8,	%f6
	fxnors	%f23,	%f7,	%f30
	xorcc	%i4,	0x1258,	%g2
	popc	%l6,	%i0
	stx	%o4,	[%l7 + 0x60]
	ldub	[%l7 + 0x36],	%o5
	movrne	%g4,	0x026,	%o2
	move	%icc,	%o1,	%i3
	array16	%g7,	%l0,	%o7
	movge	%icc,	%l5,	%o3
	sra	%i5,	0x12,	%g1
	movleu	%xcc,	%i7,	%o6
	sethi	0x08F8,	%g6
	movrgz	%g3,	0x1D3,	%l3
	fnors	%f18,	%f10,	%f11
	movg	%icc,	%l1,	%l2
	addccc	%o0,	0x1EDF,	%i1
	array8	%i2,	%i6,	%l4
	fmovscc	%xcc,	%f26,	%f6
	movle	%xcc,	%i4,	%g2
	movvc	%xcc,	%g5,	%l6
	fmovrdlz	%o4,	%f0,	%f12
	ldsw	[%l7 + 0x50],	%o5
	fnot2s	%f16,	%f16
	fmovsge	%xcc,	%f26,	%f15
	nop
	set	0x08, %i4
	lduw	[%l7 + %i4],	%g4
	mova	%icc,	%o2,	%o1
	fcmpeq32	%f28,	%f12,	%i0
	movcs	%icc,	%i3,	%l0
	udivcc	%g7,	0x106B,	%l5
	edge8ln	%o3,	%o7,	%g1
	alignaddr	%i5,	%o6,	%g6
	fmul8x16	%f7,	%f22,	%f24
	udiv	%i7,	0x17F5,	%g3
	nop
	set	0x78, %o4
	stw	%l3,	[%l7 + %o4]
	add	%l2,	0x1953,	%l1
	movrgz	%i1,	0x26B,	%o0
	addc	%i2,	0x072F,	%i6
	st	%f4,	[%l7 + 0x14]
	sethi	0x1ACB,	%i4
	fnegs	%f15,	%f4
	movcs	%icc,	%g2,	%l4
	movrne	%g5,	0x117,	%l6
	popc	0x017A,	%o5
	movrlz	%o4,	0x078,	%g4
	ld	[%l7 + 0x64],	%f22
	fcmps	%fcc1,	%f0,	%f23
	array16	%o1,	%o2,	%i3
	nop
	set	0x30, %g5
	ldd	[%l7 + %g5],	%l0
	st	%f0,	[%l7 + 0x24]
	sub	%i0,	%g7,	%o3
	mulx	%l5,	0x0B73,	%o7
	movneg	%xcc,	%g1,	%i5
	edge16ln	%g6,	%i7,	%g3
	srax	%l3,	%o6,	%l2
	fexpand	%f19,	%f8
	bshuffle	%f30,	%f10,	%f30
	fexpand	%f30,	%f8
	andcc	%i1,	%l1,	%o0
	sth	%i2,	[%l7 + 0x64]
	std	%f12,	[%l7 + 0x58]
	mova	%icc,	%i4,	%g2
	sethi	0x00F2,	%l4
	orn	%i6,	0x1FD3,	%g5
	fmovrsne	%o5,	%f17,	%f29
	fandnot1s	%f21,	%f18,	%f26
	movleu	%xcc,	%l6,	%o4
	subc	%o1,	%g4,	%o2
	sdivx	%i3,	0x13AE,	%l0
	fcmpeq16	%f0,	%f22,	%g7
	ldub	[%l7 + 0x29],	%o3
	movvs	%icc,	%i0,	%o7
	smulcc	%g1,	0x05BC,	%l5
	lduw	[%l7 + 0x10],	%g6
	ldsh	[%l7 + 0x46],	%i7
	fone	%f30
	movle	%icc,	%i5,	%l3
	sub	%o6,	0x1F29,	%l2
	sllx	%g3,	%l1,	%o0
	sth	%i2,	[%l7 + 0x0E]
	subccc	%i4,	%i1,	%l4
	movge	%icc,	%i6,	%g5
	edge32ln	%o5,	%l6,	%o4
	movg	%icc,	%o1,	%g2
	ld	[%l7 + 0x10],	%f23
	fmovrsgz	%g4,	%f5,	%f28
	nop
	set	0x18, %o1
	lduh	[%l7 + %o1],	%o2
	fmovrdlz	%i3,	%f4,	%f16
	movleu	%icc,	%g7,	%o3
	udivcc	%l0,	0x1D53,	%o7
	movne	%icc,	%g1,	%l5
	movleu	%icc,	%i0,	%i7
	nop
	set	0x08, %o3
	ldd	[%l7 + %o3],	%f0
	movne	%icc,	%i5,	%l3
	fpadd32s	%f12,	%f4,	%f22
	smul	%o6,	%l2,	%g3
	movge	%xcc,	%g6,	%l1
	fnot1	%f26,	%f18
	edge8n	%o0,	%i2,	%i1
	save %l4, 0x1F22, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x08, %i0
	ldx	[%l7 + %i0],	%i6
	subcc	%o5,	0x02B1,	%l6
	fsrc2s	%f27,	%f30
	subccc	%o4,	%o1,	%g2
	movg	%xcc,	%g5,	%o2
	mova	%xcc,	%g4,	%i3
	umulcc	%o3,	%g7,	%l0
	fcmpne32	%f16,	%f4,	%o7
	ldd	[%l7 + 0x70],	%l4
	ldsw	[%l7 + 0x6C],	%g1
	fcmpeq32	%f0,	%f2,	%i7
	xor	%i0,	0x0D3C,	%l3
	fzeros	%f16
	sir	0x148B
	fornot2s	%f13,	%f27,	%f23
	mulscc	%i5,	0x0EDF,	%o6
	alignaddr	%l2,	%g3,	%l1
	smulcc	%o0,	%g6,	%i1
	ldsb	[%l7 + 0x2B],	%l4
	alignaddrl	%i2,	%i4,	%o5
	sdiv	%i6,	0x125F,	%o4
	ldx	[%l7 + 0x38],	%o1
	addc	%g2,	0x158A,	%g5
	mulx	%l6,	%g4,	%i3
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	addccc	%l0,	0x1C16,	%g7
	movvs	%icc,	%l5,	%o7
	ld	[%l7 + 0x54],	%f19
	add	%g1,	0x19C7,	%i7
	lduh	[%l7 + 0x7A],	%l3
	nop
	set	0x2C, %g1
	stw	%i5,	[%l7 + %g1]
	sir	0x18A4
	fmovrdne	%o6,	%f2,	%f14
	smulcc	%l2,	0x1875,	%g3
	movrlz	%l1,	0x3B5,	%i0
	fmul8x16au	%f14,	%f18,	%f28
	mova	%icc,	%g6,	%i1
	movpos	%xcc,	%o0,	%i2
	movcs	%icc,	%i4,	%o5
	array8	%l4,	%o4,	%i6
	movneg	%icc,	%o1,	%g5
	fmul8x16al	%f29,	%f19,	%f12
	mova	%icc,	%l6,	%g2
	and	%i3,	0x1970,	%o2
	movg	%xcc,	%g4,	%o3
	movn	%xcc,	%g7,	%l0
	pdist	%f14,	%f12,	%f20
	andncc	%l5,	%g1,	%o7
	mova	%xcc,	%l3,	%i7
	sth	%i5,	[%l7 + 0x74]
	andn	%l2,	0x0B56,	%g3
	movge	%xcc,	%l1,	%o6
	fmovrdlez	%i0,	%f12,	%f18
	move	%icc,	%g6,	%i1
	ldd	[%l7 + 0x38],	%f10
	save %o0, %i4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o5,	%l4
	fpsub32s	%f1,	%f3,	%f9
	fcmpgt32	%f28,	%f2,	%i6
	array8	%o4,	%g5,	%l6
	subcc	%o1,	0x16C8,	%g2
	add	%o2,	0x1757,	%g4
	edge8l	%i3,	%o3,	%l0
	umul	%l5,	%g1,	%o7
	lduw	[%l7 + 0x50],	%g7
	mulscc	%l3,	%i5,	%l2
	edge32n	%g3,	%l1,	%o6
	movrgz	%i0,	0x141,	%g6
	edge16ln	%i1,	%i7,	%o0
	movge	%icc,	%i2,	%o5
	restore %l4, %i6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f9,	%f13
	movrgz	%g5,	%l6,	%o1
	mova	%icc,	%i4,	%o2
	fnot2s	%f8,	%f11
	movpos	%icc,	%g4,	%i3
	movgu	%xcc,	%g2,	%o3
	stb	%l5,	[%l7 + 0x13]
	movne	%xcc,	%l0,	%o7
	fmovrde	%g1,	%f0,	%f22
	sir	0x16B0
	edge32	%g7,	%i5,	%l2
	move	%xcc,	%g3,	%l1
	movne	%icc,	%l3,	%o6
	ldsw	[%l7 + 0x64],	%i0
	subcc	%i1,	%i7,	%g6
	fmovsa	%xcc,	%f1,	%f12
	subc	%o0,	0x1765,	%o5
	movl	%xcc,	%l4,	%i2
	stx	%i6,	[%l7 + 0x10]
	fnot1	%f8,	%f14
	edge8ln	%g5,	%l6,	%o1
	nop
	set	0x10, %l3
	ldd	[%l7 + %l3],	%o4
	movrgez	%i4,	0x239,	%o2
	fcmpd	%fcc3,	%f0,	%f6
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	fnors	%f21,	%f24,	%f6
	ldd	[%l7 + 0x20],	%g2
	andcc	%o3,	0x1320,	%l0
	move	%icc,	%o7,	%l5
	xor	%g7,	0x1365,	%i5
	fsrc2s	%f24,	%f18
	movneg	%xcc,	%l2,	%g3
	fpackfix	%f16,	%f7
	movrlez	%g1,	%l3,	%o6
	edge8n	%l1,	%i1,	%i0
	edge16	%i7,	%g6,	%o0
	xorcc	%l4,	0x0494,	%i2
	nop
	set	0x32, %l6
	sth	%o5,	[%l7 + %l6]
	save %g5, %l6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%o4,	%o1
	sub	%o2,	%i4,	%i3
	std	%f18,	[%l7 + 0x68]
	mulscc	%g2,	0x19AE,	%o3
	fmovsge	%xcc,	%f24,	%f22
	fpsub32	%f10,	%f24,	%f4
	fsrc2s	%f27,	%f3
	sdivx	%g4,	0x064A,	%o7
	alignaddrl	%l5,	%l0,	%i5
	sdivcc	%l2,	0x056F,	%g3
	nop
	set	0x1F, %g2
	stb	%g7,	[%l7 + %g2]
	fpadd32	%f6,	%f24,	%f24
	sll	%g1,	0x00,	%l3
	addccc	%o6,	0x0D53,	%i1
	sllx	%l1,	%i7,	%i0
	faligndata	%f18,	%f30,	%f18
	movle	%icc,	%o0,	%l4
	fmovrslez	%i2,	%f11,	%f30
	movgu	%xcc,	%g6,	%o5
	stw	%l6,	[%l7 + 0x78]
	movrgz	%g5,	0x237,	%o4
	srl	%o1,	%o2,	%i6
	movre	%i4,	%g2,	%i3
	addcc	%o3,	%o7,	%g4
	ldsh	[%l7 + 0x34],	%l5
	xnorcc	%i5,	%l0,	%g3
	smul	%g7,	0x0E88,	%g1
	fpsub32	%f22,	%f0,	%f28
	and	%l2,	0x007C,	%o6
	movl	%xcc,	%i1,	%l3
	movle	%xcc,	%l1,	%i0
	movle	%icc,	%i7,	%l4
	restore %i2, 0x027F, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o5,	%l6,	%o0
	smulcc	%o4,	%g5,	%o1
	fcmpgt16	%f14,	%f6,	%i6
	andn	%i4,	%g2,	%i3
	stb	%o3,	[%l7 + 0x4B]
	fnegd	%f30,	%f10
	fmovsgu	%xcc,	%f23,	%f27
	sth	%o7,	[%l7 + 0x62]
	andcc	%g4,	%l5,	%o2
	lduh	[%l7 + 0x4A],	%l0
	alignaddrl	%i5,	%g3,	%g7
	array8	%l2,	%o6,	%i1
	ldsh	[%l7 + 0x26],	%l3
	or	%l1,	%i0,	%i7
	movcc	%xcc,	%g1,	%i2
	edge8l	%l4,	%g6,	%o5
	fcmpeq32	%f28,	%f22,	%l6
	nop
	set	0x50, %o7
	ldd	[%l7 + %o7],	%o4
	fmovde	%icc,	%f11,	%f10
	fmovrdne	%g5,	%f12,	%f30
	edge16	%o0,	%i6,	%o1
	fabss	%f4,	%f18
	mova	%icc,	%g2,	%i3
	movrne	%i4,	0x390,	%o7
	array8	%g4,	%o3,	%o2
	edge16	%l5,	%l0,	%i5
	fsrc2	%f20,	%f4
	movpos	%xcc,	%g7,	%g3
	fnor	%f18,	%f16,	%f12
	stb	%l2,	[%l7 + 0x1F]
	ldsh	[%l7 + 0x6E],	%o6
	fmovdvc	%xcc,	%f26,	%f22
	fnot1	%f24,	%f4
	movrgez	%l3,	0x22C,	%l1
	fmovrdgz	%i0,	%f28,	%f30
	alignaddrl	%i1,	%i7,	%g1
	ld	[%l7 + 0x28],	%f16
	nop
	set	0x08, %l0
	ldx	[%l7 + %l0],	%l4
	subccc	%g6,	%i2,	%l6
	subc	%o4,	0x03C5,	%o5
	movle	%icc,	%o0,	%g5
	movrgez	%i6,	0x0E5,	%o1
	movrne	%i3,	0x2FA,	%g2
	movgu	%xcc,	%i4,	%o7
	ldx	[%l7 + 0x08],	%g4
	stw	%o3,	[%l7 + 0x50]
	ldd	[%l7 + 0x08],	%l4
	sir	0x1710
	udivcc	%l0,	0x0620,	%i5
	edge16n	%o2,	%g7,	%l2
	ldsw	[%l7 + 0x68],	%o6
	fnot1	%f18,	%f20
	sub	%l3,	%g3,	%l1
	movl	%xcc,	%i1,	%i0
	movrgz	%i7,	%g1,	%l4
	edge16l	%g6,	%l6,	%i2
	ldsb	[%l7 + 0x1F],	%o4
	st	%f29,	[%l7 + 0x14]
	edge32n	%o0,	%g5,	%i6
	ld	[%l7 + 0x2C],	%f29
	fornot2s	%f4,	%f27,	%f11
	edge16ln	%o1,	%i3,	%o5
	edge16ln	%i4,	%o7,	%g2
	fnot2s	%f24,	%f0
	movrgez	%g4,	0x130,	%o3
	array32	%l0,	%i5,	%o2
	sllx	%l5,	0x1B,	%l2
	fmul8x16al	%f4,	%f14,	%f20
	st	%f17,	[%l7 + 0x7C]
	addcc	%g7,	%l3,	%g3
	array8	%o6,	%l1,	%i1
	fornot1	%f2,	%f26,	%f26
	nop
	set	0x28, %l1
	ldsb	[%l7 + %l1],	%i7
	array8	%i0,	%l4,	%g1
	std	%f22,	[%l7 + 0x18]
	movneg	%icc,	%g6,	%l6
	mova	%xcc,	%i2,	%o0
	fandnot2s	%f30,	%f10,	%f13
	movrlez	%o4,	0x117,	%g5
	st	%f5,	[%l7 + 0x18]
	move	%icc,	%i6,	%i3
	xor	%o1,	%o5,	%o7
	sdivx	%g2,	0x10D1,	%g4
	ldsh	[%l7 + 0x5C],	%o3
	movne	%xcc,	%l0,	%i5
	movrlez	%o2,	0x141,	%i4
	ld	[%l7 + 0x3C],	%f17
	sllx	%l5,	0x05,	%l2
	sethi	0x13B6,	%l3
	ldsb	[%l7 + 0x4C],	%g7
	andcc	%o6,	0x0D0C,	%g3
	fabsd	%f14,	%f4
	fcmpne16	%f12,	%f22,	%l1
	umul	%i1,	%i7,	%l4
	faligndata	%f4,	%f12,	%f18
	fcmpd	%fcc1,	%f0,	%f2
	movrgez	%i0,	%g1,	%l6
	ldsh	[%l7 + 0x7A],	%g6
	array8	%i2,	%o0,	%o4
	movrgez	%g5,	0x17F,	%i3
	fnand	%f20,	%f24,	%f30
	edge8	%o1,	%o5,	%i6
	movrlz	%o7,	%g4,	%g2
	movvc	%icc,	%l0,	%o3
	fcmped	%fcc1,	%f16,	%f20
	smul	%i5,	%i4,	%l5
	movleu	%icc,	%l2,	%o2
	save %g7, %l3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f29,	%f26,	%f11
	srlx	%g3,	0x1D,	%i1
	fmovrslez	%l1,	%f17,	%f1
	sdivcc	%i7,	0x0EAA,	%i0
	stb	%g1,	[%l7 + 0x4D]
	addcc	%l4,	%l6,	%g6
	andcc	%i2,	0x1302,	%o4
	andn	%g5,	%i3,	%o1
	array8	%o0,	%o5,	%o7
	movvc	%icc,	%g4,	%g2
	fors	%f2,	%f2,	%f24
	fpack16	%f20,	%f2
	movpos	%icc,	%l0,	%o3
	fmovda	%xcc,	%f16,	%f16
	ldub	[%l7 + 0x23],	%i5
	movpos	%icc,	%i4,	%i6
	edge32n	%l5,	%l2,	%g7
	udivx	%l3,	0x05B2,	%o2
	fpsub16	%f26,	%f28,	%f14
	fcmpgt32	%f6,	%f30,	%o6
	fmovscs	%icc,	%f20,	%f5
	popc	%g3,	%l1
	movrlz	%i1,	0x204,	%i0
	edge8l	%g1,	%l4,	%i7
	addc	%g6,	%i2,	%o4
	orcc	%l6,	0x15C1,	%i3
	fsrc2s	%f31,	%f1
	save %o1, 0x06C7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o0,	0x1246,	%o5
	addccc	%g4,	0x1B3E,	%g2
	orcc	%l0,	0x1E08,	%o7
	alignaddr	%o3,	%i5,	%i6
	edge32ln	%l5,	%i4,	%l2
	fmovda	%icc,	%f8,	%f16
	ldsb	[%l7 + 0x32],	%g7
	movpos	%icc,	%o2,	%l3
	mulscc	%g3,	%l1,	%i1
	udivcc	%o6,	0x1108,	%g1
	movrlz	%i0,	0x1AA,	%l4
	alignaddr	%g6,	%i2,	%o4
	fmovspos	%icc,	%f31,	%f13
	movneg	%icc,	%l6,	%i7
	sdivcc	%i3,	0x135E,	%g5
	array8	%o1,	%o5,	%g4
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	ldsw	[%l7 + 0x6C],	%o3
	addccc	%g2,	%i5,	%i6
	fmovdcs	%xcc,	%f18,	%f13
	andcc	%l5,	%i4,	%g7
	or	%o2,	0x139B,	%l2
	sra	%g3,	0x0F,	%l3
	sethi	0x1CC0,	%i1
	fmovsl	%xcc,	%f5,	%f25
	fmuld8ulx16	%f19,	%f6,	%f10
	ldd	[%l7 + 0x78],	%o6
	fxnors	%f12,	%f5,	%f11
	ldsw	[%l7 + 0x18],	%l1
	movpos	%xcc,	%g1,	%i0
	srax	%l4,	%i2,	%g6
	st	%f17,	[%l7 + 0x68]
	or	%o4,	%i7,	%l6
	umulcc	%i3,	0x0B98,	%o1
	smul	%o5,	%g5,	%o0
	movre	%g4,	%l0,	%o3
	movle	%icc,	%o7,	%i5
	edge8l	%i6,	%l5,	%g2
	sdivcc	%i4,	0x1AF3,	%o2
	nop
	set	0x08, %i2
	stw	%g7,	[%l7 + %i2]
	array32	%g3,	%l2,	%i1
	lduh	[%l7 + 0x62],	%l3
	ldub	[%l7 + 0x3B],	%o6
	ldx	[%l7 + 0x70],	%l1
	edge8l	%i0,	%g1,	%l4
	xorcc	%g6,	%i2,	%o4
	fandnot2s	%f25,	%f8,	%f27
	ldsh	[%l7 + 0x0E],	%i7
	edge32ln	%l6,	%o1,	%o5
	move	%icc,	%g5,	%o0
	fmovsg	%icc,	%f23,	%f7
	movrne	%i3,	%l0,	%o3
	fmovrse	%o7,	%f11,	%f20
	std	%f14,	[%l7 + 0x20]
	fmovscs	%xcc,	%f6,	%f21
	fcmple32	%f22,	%f20,	%i5
	nop
	set	0x10, %o0
	ldd	[%l7 + %o0],	%f14
	edge8	%g4,	%i6,	%l5
	edge32n	%g2,	%o2,	%g7
	andncc	%i4,	%g3,	%i1
	movle	%xcc,	%l2,	%o6
	st	%f21,	[%l7 + 0x60]
	ldub	[%l7 + 0x18],	%l3
	sll	%l1,	%g1,	%i0
	edge16n	%l4,	%g6,	%i2
	srlx	%i7,	%o4,	%l6
	ldsb	[%l7 + 0x2E],	%o1
	udivcc	%g5,	0x0B93,	%o5
	movge	%icc,	%i3,	%o0
	movcc	%xcc,	%l0,	%o3
	array8	%i5,	%o7,	%g4
	array8	%i6,	%g2,	%o2
	movge	%icc,	%l5,	%i4
	umul	%g7,	%g3,	%i1
	udivx	%o6,	0x162E,	%l3
	ldub	[%l7 + 0x3A],	%l2
	edge32n	%g1,	%i0,	%l4
	movvc	%xcc,	%g6,	%l1
	movvc	%icc,	%i7,	%i2
	sth	%l6,	[%l7 + 0x7C]
	fcmpne32	%f12,	%f18,	%o1
	fand	%f28,	%f30,	%f26
	mulscc	%o4,	%o5,	%i3
	movpos	%icc,	%o0,	%l0
	save %o3, 0x08D3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f30,	%f24,	%g5
	movcs	%icc,	%o7,	%i6
	fnand	%f30,	%f22,	%f12
	orcc	%g4,	%o2,	%g2
	ldub	[%l7 + 0x61],	%i4
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%l5
	fmovrdlz	%g7,	%f30,	%f30
	umul	%g3,	%i1,	%o6
	move	%icc,	%l3,	%g1
	array8	%i0,	%l4,	%l2
	sth	%l1,	[%l7 + 0x62]
	orn	%i7,	%i2,	%g6
	subcc	%l6,	%o1,	%o5
	stb	%o4,	[%l7 + 0x2F]
	fandnot2s	%f18,	%f25,	%f13
	std	%f20,	[%l7 + 0x28]
	sllx	%o0,	0x08,	%l0
	movn	%xcc,	%o3,	%i3
	xor	%g5,	%i5,	%i6
	movpos	%icc,	%o7,	%g4
	ldub	[%l7 + 0x43],	%g2
	edge16l	%o2,	%i4,	%g7
	ldsw	[%l7 + 0x6C],	%g3
	fnot2s	%f26,	%f15
	xorcc	%i1,	0x12B6,	%l5
	xorcc	%l3,	%o6,	%i0
	fmovdne	%icc,	%f17,	%f24
	fmovrdlz	%l4,	%f8,	%f2
	ldsh	[%l7 + 0x46],	%g1
	fmovdneg	%xcc,	%f23,	%f25
	fmovsleu	%xcc,	%f23,	%f9
	addc	%l1,	0x170C,	%l2
	stw	%i2,	[%l7 + 0x24]
	movrgez	%i7,	0x08A,	%l6
	edge8ln	%g6,	%o1,	%o5
	mova	%icc,	%o4,	%o0
	fmul8sux16	%f0,	%f14,	%f28
	movgu	%icc,	%o3,	%l0
	fmovdvc	%xcc,	%f23,	%f0
	sll	%g5,	%i3,	%i5
	ldx	[%l7 + 0x70],	%o7
	st	%f0,	[%l7 + 0x58]
	fpadd32	%f10,	%f8,	%f2
	fsrc2s	%f5,	%f19
	movpos	%icc,	%g4,	%g2
	fmovscs	%xcc,	%f24,	%f12
	fcmpgt16	%f24,	%f26,	%i6
	andcc	%i4,	0x0E56,	%o2
	fnors	%f25,	%f27,	%f13
	stw	%g7,	[%l7 + 0x54]
	edge8ln	%i1,	%g3,	%l3
	fmovda	%icc,	%f28,	%f25
	fcmpne32	%f8,	%f28,	%o6
	fmovsa	%icc,	%f6,	%f1
	sdivcc	%i0,	0x07E5,	%l4
	std	%f8,	[%l7 + 0x30]
	edge16l	%g1,	%l5,	%l1
	edge32l	%i2,	%i7,	%l6
	umulcc	%l2,	%o1,	%g6
	smulcc	%o4,	0x07ED,	%o5
	fmovscc	%icc,	%f31,	%f25
	edge16	%o0,	%o3,	%g5
	ldub	[%l7 + 0x59],	%l0
	subcc	%i3,	0x12F8,	%o7
	edge32ln	%i5,	%g2,	%g4
	subc	%i4,	0x0B2C,	%i6
	edge16l	%o2,	%g7,	%i1
	udivx	%g3,	0x1825,	%l3
	sethi	0x1994,	%o6
	sll	%l4,	0x14,	%i0
	ldd	[%l7 + 0x70],	%f16
	edge8l	%l5,	%l1,	%g1
	edge32	%i2,	%i7,	%l6
	sdivx	%l2,	0x168F,	%g6
	edge32l	%o4,	%o1,	%o0
	st	%f19,	[%l7 + 0x68]
	udivcc	%o3,	0x0F8E,	%o5
	umulcc	%l0,	0x1500,	%g5
	sllx	%i3,	0x0D,	%o7
	fnor	%f16,	%f4,	%f8
	smul	%i5,	0x13DB,	%g2
	fandnot1s	%f12,	%f11,	%f18
	fxnor	%f26,	%f22,	%f6
	subccc	%i4,	0x13D7,	%i6
	edge32l	%g4,	%o2,	%g7
	fnegs	%f31,	%f15
	edge8l	%g3,	%l3,	%o6
	nop
	set	0x48, %l5
	stb	%l4,	[%l7 + %l5]
	movcs	%xcc,	%i0,	%i1
	mulx	%l5,	%g1,	%l1
	movneg	%icc,	%i2,	%i7
	smulcc	%l2,	0x05A8,	%l6
	fxor	%f18,	%f6,	%f8
	edge32ln	%g6,	%o1,	%o4
	std	%f26,	[%l7 + 0x78]
	umul	%o3,	%o0,	%o5
	sdivcc	%g5,	0x0A3B,	%l0
	movl	%icc,	%o7,	%i5
	movvs	%xcc,	%g2,	%i3
	udivcc	%i4,	0x1A5F,	%g4
	movre	%i6,	0x3E6,	%o2
	fcmps	%fcc2,	%f21,	%f1
	fpadd32s	%f18,	%f23,	%f15
	fxnors	%f29,	%f16,	%f14
	movrlz	%g7,	%l3,	%g3
	edge32l	%l4,	%o6,	%i1
	alignaddrl	%i0,	%l5,	%l1
	std	%f16,	[%l7 + 0x40]
	movvc	%icc,	%i2,	%g1
	movn	%xcc,	%l2,	%i7
	ldd	[%l7 + 0x60],	%f20
	lduw	[%l7 + 0x1C],	%l6
	srl	%o1,	%g6,	%o4
	fmovs	%f25,	%f28
	addc	%o3,	%o0,	%g5
	ldd	[%l7 + 0x18],	%f30
	stx	%l0,	[%l7 + 0x28]
	fmovdge	%xcc,	%f26,	%f19
	array32	%o5,	%i5,	%g2
	umul	%i3,	%i4,	%g4
	movrgez	%o7,	%o2,	%i6
	mulscc	%g7,	%l3,	%l4
	subccc	%o6,	0x1F2A,	%i1
	movge	%xcc,	%i0,	%g3
	orn	%l5,	0x0B40,	%i2
	movrgz	%l1,	0x16C,	%l2
	fornot1	%f18,	%f10,	%f6
	edge16ln	%g1,	%i7,	%o1
	movrgz	%l6,	%g6,	%o4
	array16	%o3,	%g5,	%o0
	edge8n	%o5,	%i5,	%l0
	fmovdg	%xcc,	%f27,	%f28
	edge8l	%i3,	%g2,	%i4
	stb	%o7,	[%l7 + 0x71]
	move	%icc,	%o2,	%i6
	fnands	%f13,	%f22,	%f9
	alignaddr	%g4,	%g7,	%l3
	movgu	%icc,	%l4,	%i1
	fsrc1s	%f6,	%f17
	restore %o6, %i0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l5, %l1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f11,	%f5
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	xor	%o1,	%g6,	%o4
	xorcc	%l6,	0x1E46,	%o3
	sth	%o0,	[%l7 + 0x14]
	mulx	%g5,	%o5,	%l0
	orcc	%i5,	0x19E1,	%i3
	edge16	%g2,	%o7,	%o2
	addc	%i6,	0x044A,	%i4
	fmovrdgez	%g4,	%f28,	%f16
	sllx	%l3,	%g7,	%l4
	ld	[%l7 + 0x6C],	%f7
	edge16n	%i1,	%o6,	%i0
	lduw	[%l7 + 0x14],	%l5
	fmul8x16	%f18,	%f14,	%f4
	fmovsn	%xcc,	%f13,	%f27
	movge	%icc,	%g3,	%l1
	srl	%i2,	%l2,	%g1
	orcc	%i7,	%g6,	%o1
	fmovdpos	%xcc,	%f3,	%f16
	fpadd32s	%f23,	%f8,	%f25
	edge32l	%o4,	%o3,	%o0
	sra	%g5,	%o5,	%l6
	sir	0x088A
	orn	%i5,	%l0,	%g2
	popc	%i3,	%o7
	fmuld8ulx16	%f14,	%f9,	%f26
	fmovdvc	%xcc,	%f14,	%f18
	mulx	%i6,	0x0621,	%o2
	movre	%g4,	0x239,	%i4
	xnorcc	%l3,	%l4,	%g7
	array16	%o6,	%i0,	%i1
	fsrc1s	%f29,	%f15
	xor	%g3,	0x13B1,	%l1
	restore %i2, 0x121C, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l2,	%i7
	edge8n	%g6,	%o1,	%o4
	movpos	%xcc,	%g1,	%o0
	movne	%xcc,	%o3,	%g5
	xnorcc	%l6,	0x13E4,	%o5
	movrlz	%i5,	%l0,	%i3
	fpsub32s	%f10,	%f23,	%f1
	movrne	%g2,	0x063,	%i6
	udivcc	%o7,	0x0A31,	%o2
	umul	%g4,	0x11F5,	%l3
	edge16ln	%i4,	%g7,	%o6
	move	%xcc,	%i0,	%i1
	fmovdle	%xcc,	%f29,	%f9
	fnot1s	%f7,	%f25
	mulscc	%g3,	0x0F4F,	%l1
	alignaddr	%i2,	%l5,	%l2
	udivcc	%l4,	0x0C6C,	%g6
	orcc	%i7,	%o4,	%g1
	fmovsvs	%xcc,	%f22,	%f7
	sub	%o1,	%o3,	%o0
	or	%g5,	%l6,	%i5
	movvs	%icc,	%o5,	%i3
	movle	%icc,	%g2,	%i6
	fmovsvc	%xcc,	%f15,	%f9
	subc	%l0,	%o2,	%o7
	stb	%l3,	[%l7 + 0x15]
	sub	%i4,	%g4,	%g7
	xnor	%o6,	%i0,	%i1
	subcc	%g3,	%l1,	%l5
	ldd	[%l7 + 0x08],	%f12
	sdivcc	%i2,	0x068A,	%l4
	orcc	%l2,	0x0B9C,	%i7
	and	%o4,	0x1846,	%g6
	movl	%icc,	%o1,	%o3
	stb	%o0,	[%l7 + 0x2B]
	ldsw	[%l7 + 0x50],	%g1
	fmovde	%icc,	%f15,	%f29
	sllx	%l6,	0x04,	%g5
	fones	%f10
	fmovrdlez	%i5,	%f28,	%f16
	sth	%i3,	[%l7 + 0x68]
	movl	%icc,	%g2,	%o5
	xnorcc	%i6,	%l0,	%o7
	move	%xcc,	%l3,	%i4
	or	%g4,	0x0E8E,	%g7
	fcmple32	%f22,	%f16,	%o6
	fmovde	%icc,	%f25,	%f23
	addc	%o2,	%i1,	%i0
	orncc	%l1,	0x094C,	%g3
	umulcc	%i2,	0x12C4,	%l4
	lduh	[%l7 + 0x10],	%l2
	stw	%i7,	[%l7 + 0x24]
	stb	%o4,	[%l7 + 0x37]
	move	%xcc,	%l5,	%g6
	add	%o3,	%o1,	%g1
	srl	%l6,	%o0,	%g5
	nop
	set	0x77, %g7
	stb	%i5,	[%l7 + %g7]
	sethi	0x03A7,	%g2
	lduw	[%l7 + 0x7C],	%i3
	ldsw	[%l7 + 0x34],	%i6
	udivx	%l0,	0x1D9F,	%o5
	addcc	%o7,	0x02CC,	%l3
	sdiv	%g4,	0x1982,	%i4
	movrgez	%o6,	%o2,	%g7
	xnorcc	%i0,	%l1,	%i1
	xnorcc	%i2,	0x0650,	%g3
	movrgez	%l2,	0x060,	%i7
	xnor	%o4,	%l5,	%l4
	addccc	%g6,	0x12A6,	%o1
	umul	%o3,	%l6,	%g1
	xnor	%o0,	0x122B,	%i5
	movrlz	%g5,	0x266,	%i3
	fandnot2	%f10,	%f30,	%f28
	movrgz	%i6,	0x2B7,	%g2
	mulscc	%l0,	%o7,	%l3
	st	%f21,	[%l7 + 0x38]
	udivx	%g4,	0x0B38,	%o5
	movvs	%xcc,	%i4,	%o6
	subc	%g7,	0x101C,	%o2
	andn	%i0,	%i1,	%l1
	fsrc1	%f0,	%f20
	stx	%g3,	[%l7 + 0x48]
	udiv	%i2,	0x051F,	%l2
	fpack32	%f14,	%f2,	%f14
	andncc	%o4,	%l5,	%l4
	edge8n	%g6,	%i7,	%o3
	std	%f14,	[%l7 + 0x70]
	fpack32	%f4,	%f30,	%f4
	stw	%o1,	[%l7 + 0x50]
	faligndata	%f26,	%f14,	%f14
	array16	%l6,	%o0,	%g1
	sir	0x0E13
	fmovrslez	%i5,	%f13,	%f16
	movvc	%icc,	%g5,	%i6
	sub	%i3,	0x0A46,	%l0
	fsrc2s	%f3,	%f25
	alignaddrl	%g2,	%l3,	%g4
	fnot2	%f30,	%f8
	movrgz	%o7,	0x317,	%i4
	fmovdleu	%xcc,	%f14,	%f24
	fsrc1s	%f2,	%f7
	andn	%o6,	%o5,	%g7
	ldub	[%l7 + 0x54],	%i0
	movl	%xcc,	%i1,	%o2
	stb	%l1,	[%l7 + 0x7F]
	movrne	%g3,	%l2,	%i2
	fmuld8ulx16	%f28,	%f25,	%f20
	save %l5, 0x0B81, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x32],	%g6
	movrgez	%o4,	%o3,	%o1
	nop
	set	0x7E, %o2
	ldub	[%l7 + %o2],	%l6
	edge16ln	%o0,	%g1,	%i5
	edge16n	%i7,	%i6,	%i3
	movne	%xcc,	%l0,	%g5
	andncc	%l3,	%g2,	%o7
	ldsw	[%l7 + 0x6C],	%g4
	lduh	[%l7 + 0x0E],	%o6
	fpsub32s	%f13,	%f26,	%f18
	fmovscc	%icc,	%f30,	%f9
	or	%i4,	%o5,	%g7
	ldsb	[%l7 + 0x74],	%i0
	fmovda	%xcc,	%f12,	%f3
	edge8	%i1,	%o2,	%g3
	addcc	%l1,	%l2,	%l5
	movcs	%xcc,	%i2,	%l4
	umul	%g6,	0x031D,	%o3
	array32	%o4,	%l6,	%o0
	fornot1	%f30,	%f0,	%f30
	addc	%g1,	0x0FF1,	%i5
	sll	%i7,	%i6,	%o1
	movrne	%i3,	%l0,	%g5
	edge16n	%g2,	%o7,	%l3
	fcmpeq32	%f16,	%f26,	%g4
	ldd	[%l7 + 0x70],	%i4
	save %o5, %o6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g7,	%o2,	%i1
	movpos	%xcc,	%l1,	%g3
	stb	%l2,	[%l7 + 0x72]
	move	%xcc,	%l5,	%i2
	fnegs	%f19,	%f22
	movleu	%xcc,	%l4,	%g6
	udivcc	%o3,	0x1C52,	%l6
	movrgz	%o4,	%g1,	%o0
	umulcc	%i7,	%i6,	%i5
	movvs	%xcc,	%o1,	%l0
	fornot2	%f2,	%f22,	%f20
	srlx	%i3,	0x0F,	%g5
	mulx	%o7,	%l3,	%g4
	ldsw	[%l7 + 0x3C],	%i4
	array16	%g2,	%o5,	%i0
	and	%g7,	%o6,	%i1
	nop
	set	0x1C, %g3
	lduh	[%l7 + %g3],	%o2
	stb	%g3,	[%l7 + 0x0B]
	movre	%l2,	%l5,	%i2
	subccc	%l1,	%l4,	%g6
	movre	%l6,	%o4,	%o3
	orn	%g1,	0x0B9A,	%i7
	fpack32	%f6,	%f24,	%f4
	alignaddr	%o0,	%i5,	%o1
	umul	%l0,	0x18D1,	%i3
	fnors	%f19,	%f14,	%f24
	movn	%icc,	%g5,	%o7
	fmovrdne	%i6,	%f28,	%f4
	udiv	%l3,	0x0D1B,	%i4
	xnor	%g4,	0x1A1C,	%o5
	ldsh	[%l7 + 0x26],	%i0
	popc	%g7,	%o6
	nop
	set	0x49, %l4
	ldsb	[%l7 + %l4],	%i1
	fpack16	%f2,	%f21
	fxnor	%f20,	%f10,	%f20
	umul	%g2,	%o2,	%g3
	xnorcc	%l5,	%l2,	%i2
	smulcc	%l1,	0x0FBA,	%l4
	fmovdcc	%icc,	%f15,	%f9
	movrlz	%l6,	%o4,	%g6
	movge	%xcc,	%o3,	%g1
	ldsh	[%l7 + 0x28],	%i7
	for	%f20,	%f28,	%f24
	movle	%icc,	%i5,	%o1
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	alignaddr	%g5,	%l0,	%i6
	nop
	set	0x10, %o6
	ldd	[%l7 + %o6],	%l2
	fmovdne	%icc,	%f29,	%f18
	movcs	%xcc,	%o7,	%i4
	fmul8ulx16	%f18,	%f0,	%f26
	srax	%g4,	%o5,	%i0
	mova	%icc,	%o6,	%i1
	fmovrdgz	%g7,	%f14,	%f0
	fmovdcs	%xcc,	%f2,	%f15
	mulx	%g2,	%o2,	%g3
	fnegd	%f18,	%f2
	ldd	[%l7 + 0x58],	%l2
	stx	%i2,	[%l7 + 0x78]
	movrlez	%l1,	%l5,	%l6
	edge32n	%l4,	%o4,	%g6
	lduh	[%l7 + 0x30],	%g1
	edge16ln	%i7,	%i5,	%o3
	movvs	%icc,	%o0,	%i3
	sir	0x0EC4
	movvs	%icc,	%o1,	%g5
	fmuld8sux16	%f11,	%f19,	%f28
	mulscc	%l0,	%i6,	%l3
	smul	%o7,	%g4,	%o5
	edge32n	%i0,	%o6,	%i4
	subcc	%i1,	%g2,	%o2
	edge8ln	%g7,	%g3,	%l2
	sethi	0x059C,	%l1
	umulcc	%i2,	%l6,	%l4
	edge32n	%o4,	%g6,	%g1
	lduh	[%l7 + 0x32],	%l5
	fmovscs	%xcc,	%f13,	%f4
	movpos	%xcc,	%i7,	%i5
	xorcc	%o3,	%o0,	%o1
	lduw	[%l7 + 0x1C],	%g5
	andn	%l0,	0x16C8,	%i6
	orncc	%l3,	%i3,	%o7
	fmovrslez	%g4,	%f5,	%f21
	movg	%xcc,	%i0,	%o5
	udivx	%o6,	0x09C7,	%i4
	mova	%xcc,	%g2,	%i1
	edge16n	%o2,	%g3,	%l2
	fandnot1s	%f29,	%f16,	%f14
	std	%f8,	[%l7 + 0x30]
	ld	[%l7 + 0x6C],	%f22
	andncc	%g7,	%l1,	%l6
	ldd	[%l7 + 0x28],	%l4
	sra	%o4,	%i2,	%g6
	sdiv	%g1,	0x1899,	%l5
	udiv	%i5,	0x0C0B,	%i7
	sra	%o3,	0x1B,	%o1
	fnot2s	%f30,	%f27
	edge8n	%g5,	%o0,	%l0
	fnor	%f0,	%f30,	%f12
	sth	%i6,	[%l7 + 0x6A]
	umulcc	%i3,	%o7,	%l3
	edge32n	%g4,	%i0,	%o6
	edge32l	%i4,	%g2,	%i1
	movrgez	%o5,	0x3E3,	%g3
	movrgz	%o2,	%g7,	%l2
	movre	%l6,	0x3EB,	%l1
	save %l4, %i2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%g1,	%l5,	%i5
	movl	%xcc,	%g6,	%i7
	array8	%o1,	%o3,	%o0
	movre	%g5,	0x3C3,	%i6
	ld	[%l7 + 0x1C],	%f2
	umul	%i3,	%o7,	%l3
	alignaddr	%l0,	%g4,	%i0
	movl	%icc,	%i4,	%g2
	sll	%o6,	%i1,	%o5
	fmovsvs	%icc,	%f18,	%f5
	ld	[%l7 + 0x6C],	%f1
	fmovdcc	%xcc,	%f8,	%f14
	pdist	%f20,	%f28,	%f8
	xor	%g3,	0x080B,	%g7
	fmovse	%icc,	%f28,	%f24
	movrne	%o2,	%l2,	%l6
	movge	%xcc,	%l1,	%l4
	fornot1s	%f26,	%f26,	%f31
	fornot2s	%f9,	%f21,	%f5
	fpsub32s	%f29,	%f21,	%f29
	movrgz	%i2,	%g1,	%o4
	mova	%xcc,	%i5,	%g6
	orncc	%l5,	0x0E3C,	%i7
	edge16ln	%o3,	%o0,	%o1
	array8	%i6,	%g5,	%i3
	fnot2	%f2,	%f0
	fmovdne	%icc,	%f16,	%f1
	umul	%o7,	%l0,	%l3
	ldsh	[%l7 + 0x70],	%i0
	movcc	%xcc,	%i4,	%g4
	movrgz	%o6,	%i1,	%g2
	sllx	%o5,	0x05,	%g3
	sethi	0x04F4,	%o2
	sdivx	%g7,	0x1A3A,	%l2
	xnor	%l6,	%l1,	%l4
	movgu	%icc,	%g1,	%o4
	fmovrslz	%i2,	%f25,	%f29
	fmovrdgez	%g6,	%f2,	%f14
	srax	%i5,	%i7,	%l5
	movleu	%icc,	%o0,	%o1
	fxnors	%f18,	%f4,	%f9
	fmovsgu	%icc,	%f23,	%f3
	or	%i6,	0x02E9,	%o3
	fabsd	%f30,	%f26
	fmovse	%icc,	%f26,	%f7
	ldub	[%l7 + 0x46],	%i3
	sra	%g5,	0x05,	%o7
	fpmerge	%f26,	%f14,	%f20
	edge32ln	%l3,	%i0,	%l0
	edge32l	%g4,	%i4,	%i1
	stw	%g2,	[%l7 + 0x30]
	fmovsl	%icc,	%f21,	%f20
	edge8n	%o5,	%g3,	%o6
	srlx	%o2,	0x1E,	%g7
	movge	%icc,	%l2,	%l1
	movg	%xcc,	%l6,	%g1
	fmovscc	%xcc,	%f18,	%f8
	ldd	[%l7 + 0x48],	%o4
	srl	%l4,	%i2,	%g6
	movre	%i5,	0x02F,	%l5
	sdivx	%i7,	0x1553,	%o0
	andn	%o1,	0x1603,	%o3
	edge16	%i6,	%i3,	%g5
	sdiv	%l3,	0x01EF,	%o7
	smul	%i0,	%g4,	%l0
	fcmps	%fcc2,	%f16,	%f30
	fnot2s	%f6,	%f25
	fmovrslz	%i4,	%f24,	%f12
	sethi	0x1AD6,	%i1
	array16	%o5,	%g2,	%o6
	addc	%o2,	0x0168,	%g7
	ldsh	[%l7 + 0x28],	%l2
	movpos	%xcc,	%g3,	%l1
	sll	%g1,	0x0D,	%o4
	udiv	%l6,	0x0999,	%i2
	nop
	set	0x18, %o5
	ldx	[%l7 + %o5],	%l4
	popc	%g6,	%i5
	sub	%i7,	0x08B1,	%l5
	lduh	[%l7 + 0x58],	%o1
	ldx	[%l7 + 0x40],	%o0
	fmovspos	%xcc,	%f4,	%f27
	addccc	%i6,	%i3,	%g5
	sra	%o3,	%l3,	%o7
	movrgez	%i0,	0x19A,	%g4
	mova	%xcc,	%i4,	%i1
	orn	%o5,	0x06BA,	%g2
	fsrc1s	%f11,	%f21
	movge	%xcc,	%o6,	%l0
	ldsw	[%l7 + 0x24],	%g7
	fmovsvs	%xcc,	%f12,	%f24
	movle	%icc,	%o2,	%l2
	srl	%l1,	0x1E,	%g3
	popc	%g1,	%l6
	movrlz	%o4,	%i2,	%l4
	smul	%g6,	%i7,	%l5
	ldx	[%l7 + 0x48],	%i5
	edge32	%o1,	%o0,	%i3
	mulx	%g5,	%o3,	%i6
	smulcc	%o7,	%l3,	%g4
	fmovde	%icc,	%f25,	%f25
	edge32l	%i0,	%i1,	%i4
	and	%o5,	0x04E9,	%g2
	nop
	set	0x78, %i1
	ldx	[%l7 + %i1],	%l0
	umul	%o6,	%o2,	%l2
	movrne	%l1,	0x14B,	%g3
	movl	%icc,	%g1,	%l6
	edge8n	%o4,	%g7,	%l4
	subcc	%g6,	%i2,	%l5
	and	%i7,	0x11A4,	%o1
	array32	%i5,	%o0,	%i3
	movleu	%xcc,	%o3,	%g5
	ldd	[%l7 + 0x50],	%f30
	ldd	[%l7 + 0x50],	%o6
	fmovrsgz	%l3,	%f23,	%f4
	mulscc	%g4,	0x1224,	%i6
	add	%i1,	%i4,	%i0
	fpack16	%f30,	%f2
	fmul8ulx16	%f18,	%f14,	%f14
	addc	%g2,	0x1EB9,	%l0
	xnorcc	%o5,	%o6,	%o2
	smul	%l1,	0x0553,	%l2
	sethi	0x1212,	%g3
	fmul8x16	%f19,	%f0,	%f20
	movre	%g1,	0x191,	%l6
	fmovrsgez	%g7,	%f1,	%f5
	ldsb	[%l7 + 0x2B],	%o4
	fsrc2s	%f8,	%f15
	fmovsge	%xcc,	%f13,	%f15
	movg	%icc,	%l4,	%i2
	sra	%l5,	%g6,	%o1
	array32	%i7,	%i5,	%i3
	umul	%o0,	%o3,	%g5
	subccc	%o7,	0x1BBA,	%g4
	movcs	%icc,	%l3,	%i1
	edge8n	%i4,	%i6,	%i0
	mulscc	%g2,	%o5,	%l0
	umul	%o6,	0x12F5,	%o2
	movre	%l1,	0x13B,	%l2
	movvc	%xcc,	%g1,	%g3
	edge16n	%l6,	%g7,	%l4
	orncc	%o4,	%i2,	%g6
	movpos	%xcc,	%l5,	%o1
	edge16	%i7,	%i5,	%o0
	ldx	[%l7 + 0x18],	%i3
	xorcc	%o3,	%o7,	%g4
	movle	%icc,	%l3,	%i1
	movcc	%icc,	%g5,	%i6
	add	%i4,	%i0,	%o5
	alignaddr	%g2,	%o6,	%o2
	edge16	%l0,	%l1,	%g1
	std	%f24,	[%l7 + 0x68]
	movle	%xcc,	%l2,	%l6
	srl	%g7,	0x17,	%l4
	edge8ln	%g3,	%o4,	%g6
	edge32ln	%i2,	%o1,	%i7
	fcmpgt32	%f18,	%f10,	%l5
	ldx	[%l7 + 0x48],	%o0
	fnot2s	%f16,	%f26
	fsrc2	%f0,	%f14
	movrne	%i3,	0x1B2,	%i5
	ldd	[%l7 + 0x50],	%o2
	restore %o7, 0x0ACD, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g4,	[%l7 + 0x10]
	movgu	%icc,	%i1,	%g5
	movvs	%icc,	%i4,	%i0
	smul	%i6,	0x0393,	%o5
	faligndata	%f20,	%f0,	%f6
	movge	%icc,	%o6,	%g2
	fands	%f27,	%f31,	%f4
	sdiv	%l0,	0x1B84,	%o2
	ldsb	[%l7 + 0x62],	%l1
	ldsb	[%l7 + 0x4A],	%l2
	lduw	[%l7 + 0x7C],	%g1
	edge8n	%g7,	%l6,	%g3
	alignaddrl	%o4,	%g6,	%i2
	movvc	%icc,	%o1,	%i7
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	ldx	[%l7 + 0x18],	%l5
	edge16n	%i3,	%i5,	%o7
	stx	%o3,	[%l7 + 0x18]
	st	%f2,	[%l7 + 0x0C]
	fpsub32	%f12,	%f26,	%f4
	xorcc	%g4,	0x1C45,	%l3
	fmovdvc	%icc,	%f30,	%f27
	fors	%f1,	%f17,	%f24
	xorcc	%g5,	%i4,	%i1
	addc	%i0,	%i6,	%o6
	edge32l	%o5,	%g2,	%l0
	fcmps	%fcc0,	%f7,	%f31
	ldub	[%l7 + 0x4E],	%o2
	ldd	[%l7 + 0x08],	%l2
	movvs	%icc,	%g1,	%g7
	fmovsleu	%xcc,	%f7,	%f13
	sra	%l1,	0x0D,	%l6
	movpos	%xcc,	%g3,	%o4
	movre	%g6,	0x2DB,	%i2
	fcmpne32	%f26,	%f16,	%i7
	fpadd16	%f12,	%f30,	%f26
	srl	%l4,	%o0,	%o1
	nop
	set	0x36, %i6
	sth	%l5,	[%l7 + %i6]
	sethi	0x15D4,	%i3
	fxors	%f12,	%f21,	%f16
	movre	%o7,	0x004,	%o3
	ldsh	[%l7 + 0x14],	%g4
	fmovs	%f13,	%f31
	st	%f1,	[%l7 + 0x6C]
	smul	%i5,	0x0393,	%l3
	fmovdle	%icc,	%f1,	%f21
	sdivcc	%i4,	0x03D8,	%i1
	movrlez	%g5,	%i6,	%i0
	fornot1	%f26,	%f0,	%f0
	sdivx	%o6,	0x16E4,	%o5
	edge32n	%g2,	%l0,	%o2
	xnor	%g1,	%l2,	%g7
	orn	%l6,	%l1,	%g3
	save %g6, %i2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o4,	%o0,	%o1
	xnorcc	%l4,	%i3,	%l5
	andn	%o3,	0x10B1,	%g4
	addc	%o7,	0x1056,	%l3
	nop
	set	0x20, %i7
	ldd	[%l7 + %i7],	%i4
	fmovrsne	%i4,	%f31,	%f15
	fnot1s	%f1,	%f31
	udivx	%i1,	0x0480,	%g5
	fcmpne16	%f24,	%f28,	%i6
	array32	%o6,	%i0,	%g2
	movcs	%icc,	%o5,	%o2
	movrne	%l0,	0x319,	%l2
	andn	%g7,	0x03B5,	%l6
	st	%f6,	[%l7 + 0x44]
	fmovdg	%icc,	%f17,	%f12
	umulcc	%l1,	0x03B7,	%g3
	sub	%g6,	0x157C,	%g1
	smul	%i2,	0x1C61,	%i7
	alignaddr	%o0,	%o1,	%o4
	movn	%icc,	%l4,	%l5
	sir	0x0903
	edge16	%o3,	%i3,	%g4
	movle	%icc,	%l3,	%o7
	fmovsleu	%icc,	%f14,	%f1
	sub	%i5,	%i4,	%g5
	fnot2s	%f22,	%f14
	srax	%i6,	0x17,	%i1
	addccc	%o6,	0x01FB,	%g2
	fmuld8sux16	%f22,	%f10,	%f2
	ldub	[%l7 + 0x75],	%o5
	udiv	%i0,	0x0B2A,	%l0
	array16	%o2,	%g7,	%l6
	movg	%xcc,	%l2,	%g3
	edge32ln	%l1,	%g1,	%i2
	andcc	%i7,	%g6,	%o1
	array32	%o0,	%o4,	%l5
	fnot2	%f22,	%f26
	ld	[%l7 + 0x50],	%f28
	edge8l	%o3,	%l4,	%g4
	movn	%icc,	%l3,	%o7
	sth	%i5,	[%l7 + 0x12]
	ldsw	[%l7 + 0x20],	%i3
	fmovsle	%xcc,	%f12,	%f4
	move	%xcc,	%g5,	%i4
	andn	%i1,	0x061C,	%o6
	bshuffle	%f14,	%f30,	%f22
	edge32ln	%g2,	%o5,	%i0
	movrlez	%i6,	%l0,	%g7
	fmovsvc	%xcc,	%f21,	%f18
	movvc	%xcc,	%l6,	%o2
	sethi	0x13F2,	%l2
	array32	%l1,	%g3,	%g1
	srlx	%i2,	0x0E,	%g6
	stw	%o1,	[%l7 + 0x58]
	fmovdne	%icc,	%f0,	%f4
	array8	%i7,	%o0,	%o4
	movrgez	%l5,	%l4,	%o3
	orncc	%g4,	0x1CF6,	%l3
	fmovsvs	%icc,	%f12,	%f10
	orncc	%i5,	%i3,	%o7
	movrgez	%g5,	%i4,	%o6
	sllx	%i1,	0x08,	%o5
	fmovd	%f28,	%f18
	edge32n	%i0,	%i6,	%l0
	sir	0x1930
	fnors	%f14,	%f17,	%f2
	srl	%g7,	0x0A,	%g2
	orn	%l6,	0x0FCF,	%l2
	movl	%xcc,	%o2,	%g3
	subcc	%g1,	0x1344,	%i2
	edge16	%g6,	%o1,	%i7
	movre	%l1,	0x2F9,	%o4
	move	%xcc,	%o0,	%l4
	lduh	[%l7 + 0x40],	%o3
	umul	%g4,	%l5,	%i5
	sub	%i3,	%l3,	%o7
	stb	%g5,	[%l7 + 0x21]
	fmovsvs	%xcc,	%f9,	%f6
	sethi	0x00D9,	%i4
	subccc	%i1,	0x1629,	%o5
	fmovspos	%xcc,	%f3,	%f4
	fmovsvc	%xcc,	%f0,	%f23
	ldsh	[%l7 + 0x2A],	%i0
	sra	%o6,	0x11,	%i6
	fornot2	%f4,	%f2,	%f20
	movvc	%xcc,	%l0,	%g2
	fpsub32	%f20,	%f26,	%f26
	movrgez	%l6,	0x340,	%g7
	srlx	%o2,	%l2,	%g1
	srlx	%i2,	%g6,	%g3
	fmovdgu	%xcc,	%f23,	%f16
	fsrc2s	%f10,	%f11
	fpmerge	%f27,	%f4,	%f26
	addccc	%i7,	0x0E22,	%l1
	fmovrdgez	%o1,	%f6,	%f14
	edge8n	%o0,	%o4,	%l4
	fsrc1	%f4,	%f0
	fxnors	%f18,	%f28,	%f29
	sub	%o3,	%l5,	%i5
	fcmpgt16	%f12,	%f26,	%i3
	movg	%xcc,	%l3,	%g4
	fmovda	%icc,	%f29,	%f30
	fpadd32	%f20,	%f24,	%f4
	edge32ln	%o7,	%i4,	%i1
	srl	%o5,	%i0,	%o6
	fmovse	%xcc,	%f1,	%f16
	xor	%i6,	0x0B71,	%l0
	movrlez	%g5,	%g2,	%g7
	save %l6, 0x1D30, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%g1,	0x1BBA,	%i2
	edge32l	%g6,	%o2,	%g3
	fmuld8sux16	%f1,	%f5,	%f2
	fornot2s	%f3,	%f4,	%f9
	sth	%l1,	[%l7 + 0x64]
	movrne	%i7,	%o1,	%o4
	ldd	[%l7 + 0x40],	%f24
	movcs	%icc,	%l4,	%o0
	movpos	%xcc,	%o3,	%i5
	sdivx	%l5,	0x0EC6,	%i3
	fpsub32	%f20,	%f22,	%f2
	udiv	%l3,	0x0C8A,	%g4
	fmovsa	%xcc,	%f23,	%f16
	siam	0x7
	movvs	%xcc,	%o7,	%i4
	edge16n	%o5,	%i0,	%o6
	mulscc	%i6,	%i1,	%g5
	edge8ln	%g2,	%g7,	%l0
	umulcc	%l2,	0x07F8,	%l6
	xnorcc	%g1,	0x1208,	%g6
	movrgez	%i2,	0x0F1,	%g3
	movpos	%icc,	%l1,	%o2
	edge32l	%o1,	%i7,	%l4
	edge8l	%o0,	%o4,	%i5
	and	%o3,	%l5,	%l3
	fcmpgt16	%f28,	%f6,	%i3
	edge32ln	%g4,	%o7,	%o5
	popc	%i0,	%o6
	movle	%icc,	%i6,	%i4
	movne	%icc,	%i1,	%g5
	xnor	%g7,	%l0,	%l2
	movle	%icc,	%g2,	%g1
	fsrc2	%f8,	%f12
	array32	%l6,	%g6,	%g3
	or	%i2,	%l1,	%o1
	fmovde	%icc,	%f4,	%f20
	andncc	%i7,	%l4,	%o0
	orcc	%o2,	0x0814,	%i5
	fsrc2s	%f6,	%f23
	fmovrdne	%o4,	%f18,	%f12
	fones	%f2
	movleu	%icc,	%o3,	%l3
	edge16	%i3,	%l5,	%o7
	umulcc	%o5,	%i0,	%g4
	fcmple32	%f24,	%f14,	%o6
	fcmple16	%f12,	%f30,	%i4
	sdivcc	%i6,	0x0AB4,	%g5
	stb	%g7,	[%l7 + 0x4C]
	addc	%l0,	%i1,	%g2
	andncc	%l2,	%g1,	%l6
	udivx	%g6,	0x10BF,	%i2
	movrlz	%g3,	%o1,	%i7
	fmovrsne	%l4,	%f27,	%f30
	and	%o0,	0x01A8,	%l1
	lduh	[%l7 + 0x52],	%i5
	edge16l	%o4,	%o2,	%l3
	movcc	%xcc,	%o3,	%i3
	ldub	[%l7 + 0x19],	%o7
	edge16l	%l5,	%i0,	%o5
	movrgez	%g4,	%i4,	%i6
	andcc	%g5,	0x075E,	%o6
	sll	%g7,	%l0,	%g2
	fmul8x16	%f7,	%f10,	%f16
	edge8	%l2,	%i1,	%l6
	fpsub16	%f12,	%f20,	%f16
	movrlz	%g6,	%i2,	%g1
	fmovsvs	%icc,	%f27,	%f20
	fpsub32s	%f3,	%f18,	%f0
	srl	%o1,	0x0E,	%i7
	xor	%l4,	0x1805,	%o0
	fmul8x16al	%f9,	%f11,	%f6
	mulscc	%l1,	%g3,	%i5
	and	%o2,	0x0684,	%o4
	edge32n	%o3,	%l3,	%i3
	ldsw	[%l7 + 0x64],	%l5
	fandnot2	%f30,	%f10,	%f10
	movne	%xcc,	%o7,	%i0
	movne	%xcc,	%g4,	%o5
	stx	%i4,	[%l7 + 0x10]
	array8	%g5,	%i6,	%o6
	restore %l0, %g2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i1,	%l6,	%g6
	orncc	%i2,	%l2,	%g1
	movcs	%xcc,	%i7,	%o1
	fpsub16s	%f7,	%f12,	%f17
	movvc	%xcc,	%o0,	%l4
	nop
	set	0x30, %i5
	ldsw	[%l7 + %i5],	%g3
	sdivx	%i5,	0x0AAA,	%l1
	addcc	%o2,	0x0FFD,	%o3
	sdivcc	%l3,	0x0E66,	%o4
	add	%l5,	0x1DF3,	%o7
	addc	%i0,	%i3,	%o5
	lduw	[%l7 + 0x2C],	%i4
	fcmpeq16	%f12,	%f22,	%g5
	edge8n	%i6,	%o6,	%g4
	stb	%l0,	[%l7 + 0x26]
	fcmpes	%fcc1,	%f30,	%f27
	xnorcc	%g7,	0x11F6,	%g2
	fabsd	%f2,	%f6
	fmovdleu	%xcc,	%f23,	%f0
	alignaddrl	%i1,	%l6,	%i2
	movneg	%xcc,	%g6,	%l2
	orn	%i7,	0x1DE1,	%g1
	sdivx	%o0,	0x0F9A,	%o1
	andcc	%l4,	%g3,	%i5
	sth	%l1,	[%l7 + 0x2A]
	save %o3, %o2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple32	%f18,	%f20,	%o4
	fpsub32s	%f17,	%f21,	%f27
	sth	%l5,	[%l7 + 0x16]
	movl	%xcc,	%o7,	%i0
	alignaddr	%i3,	%i4,	%g5
	andncc	%o5,	%o6,	%i6
	andn	%g4,	%l0,	%g7
	mova	%icc,	%i1,	%l6
	fcmple16	%f24,	%f4,	%g2
	andcc	%i2,	%l2,	%g6
	movvs	%icc,	%g1,	%o0
	sllx	%o1,	0x19,	%i7
	orn	%g3,	0x0EC9,	%i5
	subc	%l4,	%o3,	%l1
	sdivcc	%o2,	0x01D0,	%o4
	movrne	%l5,	%l3,	%i0
	movgu	%icc,	%o7,	%i4
	ldd	[%l7 + 0x78],	%g4
	fsrc1	%f24,	%f26
	ldsw	[%l7 + 0x5C],	%o5
	xnorcc	%o6,	0x142B,	%i3
	fones	%f11
	ldsw	[%l7 + 0x74],	%g4
	movcc	%xcc,	%i6,	%g7
	edge32	%i1,	%l0,	%l6
	movgu	%xcc,	%i2,	%g2
	fmovdn	%xcc,	%f11,	%f31
	subcc	%l2,	0x0D58,	%g6
	alignaddrl	%o0,	%g1,	%o1
	ldx	[%l7 + 0x30],	%i7
	udivcc	%i5,	0x08B7,	%l4
	fmovrslez	%o3,	%f0,	%f9
	edge8ln	%l1,	%g3,	%o4
	sra	%o2,	%l5,	%i0
	ldd	[%l7 + 0x78],	%o6
	movcc	%icc,	%i4,	%l3
	movcc	%icc,	%o5,	%o6
	srax	%g5,	0x0E,	%i3
	and	%i6,	0x0A4C,	%g4
	edge8n	%g7,	%i1,	%l6
	andncc	%l0,	%g2,	%i2
	alignaddrl	%g6,	%o0,	%l2
	fmovsne	%icc,	%f31,	%f22
	movre	%g1,	%o1,	%i5
	orncc	%l4,	%i7,	%l1
	smulcc	%g3,	0x047F,	%o3
	or	%o2,	%l5,	%o4
	srlx	%i0,	0x19,	%o7
	std	%f10,	[%l7 + 0x60]
	for	%f12,	%f10,	%f28
	mulx	%i4,	0x0302,	%o5
	xor	%o6,	%g5,	%l3
	or	%i3,	0x0739,	%i6
	stx	%g4,	[%l7 + 0x38]
	add	%i1,	0x03B2,	%l6
	movre	%l0,	%g7,	%i2
	edge8n	%g2,	%o0,	%l2
	fands	%f18,	%f3,	%f26
	movrgz	%g1,	%g6,	%i5
	fxor	%f2,	%f8,	%f20
	edge8ln	%o1,	%l4,	%i7
	stx	%g3,	[%l7 + 0x20]
	stw	%o3,	[%l7 + 0x10]
	movg	%xcc,	%l1,	%l5
	sdivx	%o4,	0x15AE,	%i0
	movrgez	%o2,	%o7,	%i4
	fmul8sux16	%f12,	%f30,	%f2
	fpsub16	%f18,	%f6,	%f20
	movrlez	%o5,	%g5,	%l3
	fsrc1s	%f7,	%f22
	umul	%i3,	0x02C9,	%o6
	movleu	%xcc,	%g4,	%i1
	udiv	%i6,	0x135D,	%l6
	movrne	%g7,	%l0,	%i2
	or	%g2,	0x0195,	%o0
	fornot1s	%f31,	%f1,	%f10
	movcs	%xcc,	%g1,	%g6
	umulcc	%i5,	0x07DC,	%o1
	fmovsg	%xcc,	%f20,	%f7
	array32	%l4,	%i7,	%g3
	movrgz	%o3,	0x350,	%l1
	ldd	[%l7 + 0x30],	%l4
	fmovsa	%xcc,	%f3,	%f3
	edge32n	%o4,	%l2,	%i0
	xnorcc	%o2,	%o7,	%o5
	movneg	%xcc,	%g5,	%i4
	smulcc	%i3,	0x105D,	%l3
	sth	%o6,	[%l7 + 0x3C]
	fcmple32	%f16,	%f12,	%i1
	udivcc	%i6,	0x1E19,	%l6
	array16	%g4,	%g7,	%i2
	subc	%l0,	0x1709,	%g2
	sdiv	%g1,	0x0642,	%o0
	edge8l	%g6,	%i5,	%o1
	fmovdvc	%icc,	%f30,	%f6
	movneg	%icc,	%i7,	%g3
	and	%l4,	0x1E7F,	%o3
	fabsd	%f26,	%f30
	fmovspos	%xcc,	%f7,	%f30
	array16	%l5,	%l1,	%o4
	faligndata	%f14,	%f20,	%f14
	movne	%xcc,	%i0,	%l2
	movvc	%icc,	%o2,	%o5
	movvc	%icc,	%g5,	%o7
	lduh	[%l7 + 0x2C],	%i4
	movvs	%xcc,	%i3,	%o6
	fmovdn	%xcc,	%f7,	%f5
	fzeros	%f6
	mulscc	%i1,	0x1A37,	%i6
	alignaddr	%l3,	%g4,	%g7
	edge16ln	%l6,	%i2,	%g2
	movgu	%xcc,	%g1,	%o0
	sethi	0x1C33,	%g6
	smulcc	%l0,	0x0EFD,	%i5
	movpos	%icc,	%o1,	%g3
	sdivcc	%l4,	0x1ED7,	%o3
	movrgz	%i7,	0x1E3,	%l5
	edge16l	%l1,	%o4,	%l2
	edge32ln	%o2,	%i0,	%g5
	fmovdle	%icc,	%f23,	%f0
	movne	%icc,	%o5,	%o7
	fmovrde	%i3,	%f14,	%f30
	fmovspos	%xcc,	%f25,	%f30
	smul	%o6,	%i1,	%i4
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	popc	0x11B5,	%l6
	fcmple16	%f22,	%f2,	%i2
	ldsw	[%l7 + 0x78],	%g2
	movvs	%xcc,	%g1,	%o0
	movrne	%g4,	%g6,	%i5
	edge16ln	%l0,	%g3,	%l4
	fornot1s	%f23,	%f6,	%f31
	udivcc	%o3,	0x1D7F,	%i7
	mova	%icc,	%l5,	%o1
	mova	%icc,	%o4,	%l1
	fornot1	%f24,	%f24,	%f20
	fcmpes	%fcc3,	%f10,	%f4
	ldsb	[%l7 + 0x31],	%o2
	edge16n	%i0,	%g5,	%l2
	std	%f18,	[%l7 + 0x18]
	sll	%o5,	%i3,	%o7
	udiv	%o6,	0x0F5D,	%i1
	sllx	%i4,	%l3,	%g7
	fcmpeq32	%f22,	%f14,	%l6
	edge8l	%i6,	%g2,	%g1
	nop
	set	0x72, %i3
	ldub	[%l7 + %i3],	%i2
	udiv	%o0,	0x1FB2,	%g4
	fors	%f9,	%f24,	%f30
	movpos	%xcc,	%i5,	%l0
	lduw	[%l7 + 0x28],	%g6
	fmovdne	%xcc,	%f5,	%f11
	udivcc	%g3,	0x187E,	%o3
	edge32l	%i7,	%l5,	%o1
	sllx	%l4,	0x01,	%l1
	movn	%icc,	%o2,	%o4
	movge	%xcc,	%g5,	%l2
	ldub	[%l7 + 0x65],	%i0
	edge8n	%i3,	%o7,	%o5
	movcc	%icc,	%i1,	%i4
	fcmpes	%fcc0,	%f18,	%f21
	movrlz	%o6,	%g7,	%l3
	fmovdn	%icc,	%f14,	%f15
	sll	%l6,	%i6,	%g2
	siam	0x0
	srax	%g1,	0x1F,	%o0
	movn	%icc,	%g4,	%i2
	ldsw	[%l7 + 0x5C],	%i5
	alignaddrl	%l0,	%g3,	%g6
	stb	%o3,	[%l7 + 0x1F]
	sdiv	%l5,	0x0861,	%i7
	edge8ln	%o1,	%l4,	%o2
	sdivcc	%o4,	0x139B,	%l1
	fmovsgu	%icc,	%f1,	%f14
	ldsh	[%l7 + 0x4E],	%l2
	xorcc	%i0,	%i3,	%o7
	ldd	[%l7 + 0x68],	%f26
	addc	%o5,	%g5,	%i4
	fmovdneg	%xcc,	%f20,	%f9
	nop
	set	0x38, %g4
	stb	%o6,	[%l7 + %g4]
	array8	%g7,	%i1,	%l3
	array16	%l6,	%g2,	%g1
	movcc	%xcc,	%i6,	%g4
	sdivx	%o0,	0x18B0,	%i5
	udiv	%l0,	0x1688,	%g3
	smulcc	%i2,	%o3,	%l5
	nop
	set	0x2A, %i4
	ldsh	[%l7 + %i4],	%i7
	edge32ln	%g6,	%o1,	%l4
	andncc	%o4,	%o2,	%l2
	edge8ln	%l1,	%i3,	%o7
	fmovdleu	%icc,	%f19,	%f12
	edge16n	%o5,	%i0,	%g5
	addcc	%o6,	%g7,	%i1
	fnot1	%f0,	%f14
	sdiv	%i4,	0x01D6,	%l6
	movleu	%xcc,	%l3,	%g2
	move	%icc,	%i6,	%g1
	sdivx	%o0,	0x1B6D,	%i5
	sdiv	%g4,	0x045B,	%l0
	fmul8x16al	%f17,	%f25,	%f30
	popc	0x141A,	%i2
	array8	%g3,	%o3,	%i7
	std	%f28,	[%l7 + 0x10]
	movre	%l5,	%g6,	%l4
	subc	%o4,	0x007B,	%o1
	ldd	[%l7 + 0x08],	%l2
	andn	%l1,	%o2,	%o7
	xor	%o5,	0x14E3,	%i0
	ldd	[%l7 + 0x08],	%i2
	orncc	%o6,	0x140A,	%g7
	fcmpes	%fcc2,	%f13,	%f8
	sth	%g5,	[%l7 + 0x3C]
	movrne	%i4,	%i1,	%l6
	fmovrslz	%l3,	%f5,	%f11
	sll	%g2,	%g1,	%o0
	mova	%xcc,	%i5,	%g4
	fmovdcc	%xcc,	%f31,	%f21
	lduh	[%l7 + 0x08],	%i6
	ldsb	[%l7 + 0x30],	%i2
	movge	%xcc,	%l0,	%g3
	orncc	%i7,	%o3,	%l5
	fandnot1s	%f14,	%f8,	%f25
	sth	%g6,	[%l7 + 0x22]
	fsrc1	%f8,	%f18
	udivcc	%o4,	0x08A3,	%l4
	movcc	%icc,	%l2,	%o1
	xor	%l1,	0x012C,	%o2
	movge	%icc,	%o5,	%o7
	orn	%i0,	0x1031,	%i3
	fmovdcs	%icc,	%f6,	%f28
	edge8n	%g7,	%g5,	%i4
	andcc	%o6,	%l6,	%l3
	fmovrdlez	%g2,	%f20,	%f14
	fcmpeq32	%f24,	%f20,	%g1
	movleu	%xcc,	%i1,	%i5
	fnegs	%f18,	%f1
	sdiv	%g4,	0x12AA,	%i6
	umulcc	%i2,	%o0,	%l0
	fsrc2	%f30,	%f24
	stw	%i7,	[%l7 + 0x44]
	ldx	[%l7 + 0x28],	%o3
	movl	%icc,	%l5,	%g3
	addcc	%o4,	%l4,	%g6
	ldsb	[%l7 + 0x21],	%l2
	movvc	%icc,	%o1,	%l1
	array8	%o2,	%o5,	%o7
	fsrc2s	%f22,	%f29
	sdivx	%i0,	0x0876,	%i3
	movre	%g7,	0x08A,	%g5
	stx	%i4,	[%l7 + 0x28]
	std	%f10,	[%l7 + 0x30]
	fcmpes	%fcc3,	%f22,	%f19
	save %l6, 0x1BDC, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%xcc,	%f15,	%f15
	fmovse	%xcc,	%f11,	%f1
	fmul8sux16	%f22,	%f20,	%f12
	ldd	[%l7 + 0x18],	%f28
	edge8l	%g2,	%l3,	%i1
	fmovsneg	%xcc,	%f24,	%f9
	sdivcc	%i5,	0x0657,	%g4
	movne	%icc,	%i6,	%g1
	fmovspos	%xcc,	%f16,	%f0
	udiv	%o0,	0x1FE1,	%l0
	movrlz	%i7,	%o3,	%l5
	edge16ln	%i2,	%o4,	%g3
	fabss	%f8,	%f6
	edge32	%g6,	%l4,	%o1
	subccc	%l1,	%o2,	%o5
	fpadd16s	%f11,	%f20,	%f22
	mulscc	%o7,	0x0E49,	%i0
	siam	0x1
	fmovsle	%icc,	%f5,	%f12
	fcmple32	%f10,	%f4,	%i3
	smulcc	%g7,	0x1666,	%l2
	fmul8x16	%f13,	%f8,	%f18
	popc	%g5,	%i4
	udivcc	%l6,	0x1EDC,	%o6
	umul	%l3,	%i1,	%i5
	or	%g4,	0x08F5,	%i6
	mulscc	%g1,	%o0,	%g2
	fxnor	%f16,	%f4,	%f28
	ldsb	[%l7 + 0x21],	%l0
	sdivcc	%o3,	0x1859,	%i7
	array32	%i2,	%l5,	%g3
	srax	%o4,	%g6,	%l4
	subccc	%l1,	0x0B72,	%o1
	movrlez	%o5,	0x37D,	%o2
	movl	%xcc,	%o7,	%i0
	fmovsle	%icc,	%f19,	%f21
	subc	%g7,	0x1D10,	%l2
	fmovdne	%xcc,	%f15,	%f20
	nop
	set	0x34, %g6
	ldsw	[%l7 + %g6],	%i3
	or	%g5,	0x058B,	%i4
	ldsw	[%l7 + 0x78],	%l6
	addc	%l3,	0x17DC,	%i1
	lduw	[%l7 + 0x2C],	%o6
	array32	%i5,	%g4,	%g1
	orncc	%i6,	0x0937,	%o0
	xorcc	%l0,	0x045D,	%g2
	sdivcc	%o3,	0x17B9,	%i2
	fmovrslz	%l5,	%f11,	%f28
	edge8	%g3,	%o4,	%i7
	xorcc	%l4,	0x07EF,	%g6
	edge16l	%l1,	%o1,	%o2
	movl	%icc,	%o5,	%o7
	fpsub32	%f14,	%f26,	%f12
	ldub	[%l7 + 0x74],	%i0
	edge32n	%g7,	%i3,	%l2
	fmovrslz	%g5,	%f8,	%f15
	alignaddrl	%i4,	%l6,	%l3
	std	%f28,	[%l7 + 0x58]
	fexpand	%f9,	%f6
	addccc	%i1,	%i5,	%g4
	andn	%g1,	0x0415,	%o6
	ldub	[%l7 + 0x0A],	%o0
	mova	%xcc,	%i6,	%l0
	st	%f28,	[%l7 + 0x3C]
	st	%f31,	[%l7 + 0x60]
	smulcc	%g2,	0x0797,	%o3
	andn	%i2,	0x0CB9,	%l5
	fsrc1	%f4,	%f2
	sdivx	%g3,	0x17F2,	%o4
	movrlez	%l4,	0x330,	%i7
	subcc	%l1,	%o1,	%o2
	restore %o5, %g6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%xcc,	%f9,	%f28
	edge32n	%g7,	%i3,	%o7
	fnands	%f5,	%f26,	%f17
	ldd	[%l7 + 0x10],	%f22
	mulx	%l2,	0x1B04,	%i4
	fmovsge	%icc,	%f10,	%f5
	movvc	%xcc,	%g5,	%l6
	movrgez	%l3,	%i1,	%i5
	edge16l	%g1,	%g4,	%o6
	fxors	%f15,	%f0,	%f3
	movcs	%xcc,	%o0,	%i6
	movvs	%icc,	%l0,	%g2
	addcc	%o3,	0x082F,	%i2
	stw	%g3,	[%l7 + 0x70]
	addc	%l5,	%l4,	%i7
	fsrc1	%f22,	%f8
	udivcc	%l1,	0x0982,	%o1
	lduw	[%l7 + 0x0C],	%o4
	fmovdcc	%xcc,	%f30,	%f28
	movrlez	%o2,	0x13F,	%g6
	subc	%o5,	0x10FB,	%g7
	movrlz	%i3,	0x1B6,	%i0
	fcmple16	%f8,	%f30,	%l2
	fmovse	%xcc,	%f28,	%f25
	mova	%icc,	%i4,	%o7
	edge32	%l6,	%g5,	%i1
	movrgez	%i5,	0x0E7,	%g1
	move	%icc,	%g4,	%o6
	save %l3, 0x1169, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x68],	%l0
	sethi	0x1E2C,	%o0
	movgu	%xcc,	%o3,	%i2
	movrlez	%g3,	0x002,	%l5
	xnor	%l4,	%g2,	%i7
	nop
	set	0x78, %g5
	ldx	[%l7 + %g5],	%o1
	mulscc	%l1,	%o2,	%o4
	fpadd16	%f16,	%f20,	%f0
	fcmpd	%fcc3,	%f0,	%f30
	movge	%xcc,	%g6,	%o5
	umulcc	%g7,	0x0076,	%i0
	xnorcc	%i3,	0x07C8,	%l2
	std	%f6,	[%l7 + 0x78]
	orcc	%o7,	0x15D3,	%i4
	fabss	%f2,	%f23
	edge32l	%g5,	%i1,	%l6
	edge16ln	%g1,	%i5,	%g4
	umulcc	%o6,	0x1CFF,	%l3
	stx	%i6,	[%l7 + 0x20]
	nop
	set	0x1C, %o4
	ldsw	[%l7 + %o4],	%l0
	fornot1s	%f21,	%f4,	%f23
	fzeros	%f13
	andcc	%o0,	0x14F3,	%i2
	movn	%xcc,	%g3,	%o3
	ldsh	[%l7 + 0x6E],	%l4
	fcmpeq16	%f10,	%f24,	%l5
	fmovsge	%xcc,	%f0,	%f28
	st	%f9,	[%l7 + 0x3C]
	addc	%g2,	%o1,	%l1
	edge16n	%o2,	%o4,	%g6
	sllx	%o5,	0x16,	%i7
	sdivcc	%i0,	0x19B6,	%g7
	xor	%i3,	%o7,	%i4
	andncc	%l2,	%g5,	%l6
	std	%f28,	[%l7 + 0x60]
	fxnors	%f20,	%f23,	%f3
	fxnors	%f3,	%f6,	%f26
	fzeros	%f10
	ldsb	[%l7 + 0x45],	%i1
	andn	%g1,	0x1530,	%g4
	addc	%i5,	%l3,	%i6
	fmul8x16	%f10,	%f2,	%f26
	fandnot1	%f14,	%f4,	%f26
	movleu	%icc,	%l0,	%o6
	mulx	%o0,	0x04C3,	%i2
	sir	0x1C26
	ld	[%l7 + 0x20],	%f14
	fsrc1	%f20,	%f20
	movrne	%o3,	0x32D,	%l4
	sllx	%l5,	%g2,	%o1
	subccc	%l1,	%o2,	%g3
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	movre	%i0,	%i7,	%g7
	or	%o7,	%i4,	%i3
	andncc	%l2,	%g5,	%l6
	fones	%f9
	movre	%i1,	%g1,	%g4
	and	%i5,	0x08F8,	%l3
	edge32ln	%i6,	%l0,	%o0
	sdivx	%i2,	0x040F,	%o6
	movrlez	%l4,	%o3,	%l5
	mova	%xcc,	%g2,	%o1
	fpack16	%f20,	%f25
	addccc	%l1,	%g3,	%o2
	movl	%xcc,	%o4,	%o5
	and	%g6,	0x1F3B,	%i0
	edge8ln	%g7,	%i7,	%i4
	fandnot1s	%f10,	%f17,	%f0
	ldsb	[%l7 + 0x22],	%i3
	edge32	%l2,	%o7,	%g5
	ldx	[%l7 + 0x60],	%l6
	lduw	[%l7 + 0x0C],	%g1
	nop
	set	0x20, %o1
	ldd	[%l7 + %o1],	%f22
	addccc	%g4,	%i5,	%l3
	edge32	%i6,	%i1,	%o0
	fmovrsgz	%i2,	%f23,	%f2
	orncc	%o6,	%l4,	%o3
	ldsb	[%l7 + 0x48],	%l0
	sth	%g2,	[%l7 + 0x4A]
	fmul8ulx16	%f20,	%f14,	%f10
	movcs	%xcc,	%o1,	%l5
	ld	[%l7 + 0x34],	%f16
	nop
	set	0x08, %o3
	lduw	[%l7 + %o3],	%g3
	umulcc	%l1,	0x0F37,	%o2
	ldub	[%l7 + 0x6E],	%o5
	or	%g6,	0x170B,	%o4
	edge16	%i0,	%g7,	%i7
	std	%f14,	[%l7 + 0x28]
	sdivx	%i4,	0x0FB2,	%i3
	movg	%icc,	%o7,	%g5
	edge16	%l2,	%l6,	%g4
	nop
	set	0x42, %i0
	ldsh	[%l7 + %i0],	%g1
	fmovrdlez	%i5,	%f24,	%f30
	fmovspos	%icc,	%f1,	%f15
	sub	%i6,	0x03EF,	%i1
	fmovdpos	%xcc,	%f14,	%f12
	fmovrsgz	%o0,	%f10,	%f13
	subc	%l3,	0x1336,	%i2
	sra	%o6,	%o3,	%l0
	fpack16	%f12,	%f3
	xnor	%g2,	0x099B,	%l4
	andcc	%o1,	%g3,	%l5
	movle	%icc,	%l1,	%o5
	and	%o2,	0x12B5,	%g6
	sth	%o4,	[%l7 + 0x22]
	movpos	%xcc,	%i0,	%g7
	fsrc2	%f24,	%f20
	fmovsgu	%icc,	%f28,	%f22
	udivcc	%i4,	0x1CA8,	%i7
	sub	%i3,	0x1099,	%g5
	nop
	set	0x18, %l3
	ldd	[%l7 + %l3],	%f4
	edge16n	%o7,	%l6,	%l2
	movneg	%icc,	%g4,	%i5
	fpack32	%f14,	%f30,	%f18
	edge32n	%g1,	%i1,	%i6
	sdivcc	%o0,	0x1A8F,	%i2
	ldd	[%l7 + 0x48],	%f8
	movneg	%xcc,	%l3,	%o6
	udivx	%l0,	0x1AEB,	%g2
	sra	%o3,	0x09,	%o1
	ldsb	[%l7 + 0x3E],	%g3
	fpadd16	%f28,	%f24,	%f30
	or	%l4,	%l1,	%o5
	fornot1	%f16,	%f30,	%f28
	movleu	%xcc,	%o2,	%l5
	sra	%o4,	0x00,	%i0
	smulcc	%g7,	%g6,	%i7
	fcmple16	%f30,	%f8,	%i3
	udiv	%i4,	0x0F7C,	%o7
	movvs	%xcc,	%g5,	%l6
	sethi	0x140F,	%g4
	smulcc	%l2,	%i5,	%i1
	fmul8x16	%f26,	%f2,	%f20
	udivcc	%i6,	0x0BB9,	%o0
	ldsw	[%l7 + 0x68],	%i2
	fmovrse	%g1,	%f5,	%f8
	movn	%xcc,	%o6,	%l3
	movrne	%l0,	0x207,	%o3
	fmovsle	%xcc,	%f1,	%f30
	umulcc	%g2,	%o1,	%g3
	movn	%icc,	%l1,	%l4
	save %o2, %o5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f22,	%f4,	%i0
	andncc	%g7,	%g6,	%o4
	ldub	[%l7 + 0x2E],	%i7
	ld	[%l7 + 0x74],	%f8
	movvc	%icc,	%i3,	%i4
	movre	%g5,	%l6,	%g4
	andn	%l2,	0x0AC7,	%i5
	mova	%xcc,	%i1,	%o7
	lduh	[%l7 + 0x68],	%i6
	ldd	[%l7 + 0x60],	%i2
	edge8n	%g1,	%o6,	%l3
	fornot2s	%f16,	%f24,	%f10
	sth	%o0,	[%l7 + 0x78]
	orcc	%o3,	0x1F5F,	%l0
	fmul8x16	%f0,	%f6,	%f22
	fmovse	%xcc,	%f31,	%f4
	udivcc	%o1,	0x1C83,	%g3
	umulcc	%g2,	0x12C6,	%l4
	orcc	%l1,	%o5,	%o2
	fmuld8ulx16	%f10,	%f11,	%f8
	move	%icc,	%l5,	%i0
	movcc	%icc,	%g7,	%g6
	xnorcc	%i7,	0x1853,	%o4
	movrlz	%i4,	%i3,	%g5
	fmovd	%f24,	%f22
	edge8	%g4,	%l6,	%l2
	ldd	[%l7 + 0x68],	%i4
	ldsw	[%l7 + 0x1C],	%i1
	nop
	set	0x24, %g1
	ldsw	[%l7 + %g1],	%i6
	or	%o7,	0x12F1,	%i2
	xnor	%g1,	0x1670,	%o6
	ldsh	[%l7 + 0x36],	%o0
	addcc	%l3,	%o3,	%l0
	array8	%o1,	%g3,	%g2
	udivx	%l1,	0x0923,	%o5
	sll	%o2,	%l4,	%l5
	umul	%g7,	%i0,	%g6
	nop
	set	0x70, %g2
	std	%f22,	[%l7 + %g2]
	orn	%o4,	0x07A0,	%i7
	sethi	0x10D5,	%i3
	nop
	set	0x5F, %o7
	ldub	[%l7 + %o7],	%g5
	fmul8sux16	%f2,	%f28,	%f4
	fzeros	%f6
	array8	%i4,	%l6,	%g4
	fmovse	%icc,	%f29,	%f14
	st	%f16,	[%l7 + 0x78]
	fxors	%f21,	%f22,	%f5
	and	%i5,	0x04E1,	%l2
	movre	%i6,	0x066,	%i1
	edge8ln	%i2,	%g1,	%o7
	orcc	%o6,	%l3,	%o3
	addcc	%o0,	0x17AF,	%o1
	fmovrsgez	%g3,	%f25,	%f28
	lduw	[%l7 + 0x54],	%g2
	smulcc	%l1,	%l0,	%o2
	fnand	%f8,	%f2,	%f16
	ldsb	[%l7 + 0x0D],	%o5
	orn	%l5,	%l4,	%i0
	movl	%icc,	%g6,	%o4
	ldd	[%l7 + 0x70],	%f2
	sllx	%g7,	%i7,	%g5
	udiv	%i3,	0x038C,	%l6
	fmovs	%f21,	%f17
	subcc	%i4,	%i5,	%g4
	edge16l	%l2,	%i1,	%i6
	addccc	%i2,	0x0547,	%g1
	sth	%o7,	[%l7 + 0x3C]
	edge32	%o6,	%o3,	%l3
	movrne	%o1,	0x38E,	%g3
	xnorcc	%o0,	%l1,	%l0
	ldsh	[%l7 + 0x68],	%g2
	sllx	%o5,	%l5,	%l4
	st	%f23,	[%l7 + 0x64]
	srax	%o2,	0x02,	%g6
	xorcc	%i0,	0x0030,	%g7
	restore %o4, %i7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l6,	%i3,	%i4
	fmul8x16al	%f5,	%f16,	%f28
	std	%f0,	[%l7 + 0x40]
	smul	%i5,	0x1C23,	%l2
	movcc	%xcc,	%i1,	%g4
	movge	%xcc,	%i6,	%g1
	movcs	%icc,	%o7,	%o6
	andcc	%o3,	0x1EA1,	%l3
	st	%f18,	[%l7 + 0x74]
	movle	%xcc,	%o1,	%g3
	sethi	0x0562,	%o0
	movneg	%icc,	%i2,	%l1
	addc	%g2,	%l0,	%o5
	movvc	%icc,	%l5,	%o2
	fnegd	%f24,	%f22
	movneg	%xcc,	%g6,	%i0
	orn	%l4,	%o4,	%g7
	edge16l	%g5,	%l6,	%i7
	andcc	%i4,	%i3,	%l2
	sth	%i5,	[%l7 + 0x66]
	sll	%i1,	%g4,	%g1
	sdivcc	%o7,	0x087C,	%o6
	sth	%o3,	[%l7 + 0x68]
	or	%l3,	0x022A,	%i6
	sdiv	%g3,	0x1BE4,	%o1
	array16	%o0,	%i2,	%l1
	ldd	[%l7 + 0x50],	%l0
	sdivcc	%g2,	0x15FD,	%l5
	fornot2s	%f31,	%f19,	%f7
	sdiv	%o2,	0x0820,	%o5
	st	%f7,	[%l7 + 0x18]
	srlx	%g6,	0x00,	%i0
	sra	%l4,	%g7,	%g5
	edge32l	%l6,	%o4,	%i7
	alignaddrl	%i3,	%l2,	%i4
	movrlz	%i1,	0x13E,	%g4
	addcc	%g1,	%i5,	%o6
	alignaddrl	%o7,	%o3,	%i6
	sllx	%g3,	%o1,	%o0
	smulcc	%l3,	%i2,	%l0
	movrlz	%g2,	%l5,	%l1
	fmovsneg	%xcc,	%f17,	%f2
	movg	%icc,	%o2,	%o5
	nop
	set	0x35, %l6
	ldub	[%l7 + %l6],	%i0
	pdist	%f0,	%f28,	%f16
	orcc	%l4,	%g6,	%g7
	mulscc	%l6,	0x0FDB,	%o4
	subccc	%i7,	%i3,	%g5
	fpadd32s	%f6,	%f17,	%f16
	movle	%xcc,	%l2,	%i1
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	fand	%f6,	%f12,	%f10
	andcc	%i5,	0x09B9,	%o6
	addcc	%o3,	%i6,	%o7
	lduw	[%l7 + 0x74],	%o1
	fpsub32s	%f4,	%f6,	%f11
	xorcc	%o0,	0x145C,	%l3
	sethi	0x18D9,	%i2
	smul	%g3,	%g2,	%l5
	fmovrde	%l0,	%f20,	%f20
	fmovdneg	%icc,	%f19,	%f26
	movg	%icc,	%o2,	%l1
	sll	%i0,	%o5,	%l4
	srax	%g6,	%g7,	%o4
	fsrc2	%f22,	%f16
	addc	%i7,	0x18D2,	%l6
	array16	%i3,	%g5,	%i1
	movn	%xcc,	%i4,	%g4
	stw	%l2,	[%l7 + 0x68]
	fmovs	%f14,	%f29
	popc	0x0E0E,	%i5
	xorcc	%g1,	0x04A6,	%o3
	restore %o6, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o1,	%o0,	%l3
	save %i2, %g2, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x14],	%f17
	edge16	%l0,	%l5,	%o2
	subc	%i0,	%o5,	%l4
	edge32ln	%l1,	%g6,	%g7
	fornot2s	%f8,	%f5,	%f22
	fnot1	%f10,	%f10
	edge16ln	%o4,	%i7,	%i3
	orncc	%l6,	0x095C,	%i1
	edge16n	%g5,	%i4,	%l2
	movge	%icc,	%g4,	%g1
	addcc	%i5,	%o6,	%o3
	fmovdneg	%icc,	%f8,	%f10
	sdivcc	%o7,	0x1763,	%i6
	sra	%o1,	%o0,	%i2
	movgu	%icc,	%l3,	%g2
	ldsb	[%l7 + 0x69],	%l0
	popc	%g3,	%l5
	movne	%xcc,	%i0,	%o2
	ldd	[%l7 + 0x48],	%l4
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	fnot1s	%f14,	%f10
	movrgz	%o4,	0x38B,	%g7
	edge8	%i3,	%l6,	%i1
	sub	%g5,	%i7,	%l2
	save %g4, %g1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o6,	0x0525,	%i5
	lduw	[%l7 + 0x20],	%o7
	lduh	[%l7 + 0x20],	%o3
	nop
	set	0x20, %l1
	stw	%o1,	[%l7 + %l1]
	fmovscc	%xcc,	%f28,	%f17
	std	%f0,	[%l7 + 0x78]
	save %o0, %i2, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%icc,	%g2,	%l0
	subc	%g3,	%l3,	%i0
	fsrc2	%f20,	%f20
	movcc	%icc,	%o2,	%l5
	fmovrdgez	%o5,	%f16,	%f20
	ldsw	[%l7 + 0x30],	%g6
	add	%l1,	%o4,	%l4
	sir	0x0878
	movrgz	%g7,	0x31C,	%l6
	fmovdge	%icc,	%f20,	%f8
	ld	[%l7 + 0x14],	%f1
	fpsub16s	%f27,	%f15,	%f16
	sethi	0x168F,	%i1
	movrlz	%g5,	0x0FB,	%i7
	sir	0x1F9E
	srax	%i3,	0x05,	%g4
	sir	0x1CD4
	stw	%l2,	[%l7 + 0x64]
	smul	%g1,	0x0445,	%i4
	movrgez	%i5,	%o7,	%o3
	stw	%o6,	[%l7 + 0x08]
	fornot2s	%f17,	%f18,	%f20
	array8	%o1,	%o0,	%i2
	xorcc	%i6,	%g2,	%l0
	fmovdneg	%icc,	%f16,	%f11
	fmovsvc	%icc,	%f18,	%f31
	ldsb	[%l7 + 0x6E],	%g3
	subcc	%l3,	%i0,	%o2
	ldd	[%l7 + 0x58],	%l4
	sth	%o5,	[%l7 + 0x58]
	fpmerge	%f12,	%f13,	%f6
	fpsub16s	%f22,	%f30,	%f26
	ldx	[%l7 + 0x48],	%l1
	srax	%g6,	0x1E,	%o4
	movcc	%xcc,	%g7,	%l6
	addccc	%i1,	0x1A74,	%g5
	movvc	%icc,	%i7,	%i3
	fnegd	%f14,	%f20
	fmovdgu	%icc,	%f7,	%f12
	sdiv	%l4,	0x1AEB,	%l2
	fpadd32	%f6,	%f26,	%f2
	orncc	%g1,	0x0343,	%i4
	array8	%g4,	%i5,	%o7
	edge16ln	%o3,	%o1,	%o6
	restore %o0, 0x1E75, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%g2,	%l0
	fmovs	%f31,	%f1
	movg	%icc,	%i2,	%l3
	movrgez	%i0,	0x220,	%o2
	fmovscc	%xcc,	%f23,	%f18
	stw	%l5,	[%l7 + 0x34]
	srl	%o5,	%g3,	%g6
	movne	%xcc,	%o4,	%l1
	ld	[%l7 + 0x28],	%f4
	orn	%g7,	%l6,	%g5
	popc	0x0467,	%i1
	fmovdcs	%icc,	%f2,	%f2
	edge32n	%i7,	%i3,	%l2
	fmovscc	%xcc,	%f3,	%f16
	edge16n	%g1,	%l4,	%i4
	fone	%f4
	sethi	0x1F4F,	%g4
	fmovdn	%icc,	%f26,	%f23
	movg	%icc,	%i5,	%o3
	sir	0x1138
	subc	%o1,	%o7,	%o0
	edge8l	%i6,	%o6,	%l0
	srax	%g2,	0x07,	%i2
	udivcc	%l3,	0x110A,	%o2
	movrlz	%l5,	0x146,	%o5
	fmovdcc	%xcc,	%f2,	%f27
	movre	%g3,	%g6,	%i0
	ldd	[%l7 + 0x70],	%f14
	movcs	%xcc,	%o4,	%l1
	movgu	%icc,	%g7,	%l6
	movleu	%icc,	%g5,	%i1
	movvc	%xcc,	%i7,	%l2
	movcs	%icc,	%g1,	%l4
	fmovdcc	%xcc,	%f2,	%f7
	movneg	%icc,	%i3,	%i4
	orn	%i5,	0x0C90,	%g4
	ldd	[%l7 + 0x40],	%o2
	ldd	[%l7 + 0x38],	%o0
	popc	%o0,	%i6
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	addccc	%l0,	0x031C,	%g2
	fmovrse	%l3,	%f23,	%f16
	array32	%o2,	%i2,	%o5
	subccc	%l5,	0x1485,	%g6
	fornot2	%f24,	%f10,	%f30
	sll	%g3,	%o4,	%l1
	fpack32	%f22,	%f18,	%f24
	udivx	%i0,	0x1B91,	%g7
	addc	%l6,	%g5,	%i7
	sth	%l2,	[%l7 + 0x64]
	st	%f19,	[%l7 + 0x40]
	ldsw	[%l7 + 0x50],	%g1
	movne	%icc,	%l4,	%i1
	orn	%i4,	%i3,	%i5
	subccc	%g4,	%o1,	%o3
	fandnot2s	%f24,	%f6,	%f17
	nop
	set	0x48, %i2
	ldd	[%l7 + %i2],	%i6
	edge16l	%o0,	%o6,	%l0
	umul	%o7,	%l3,	%g2
	or	%i2,	%o2,	%o5
	sdiv	%l5,	0x1E50,	%g3
	fornot2	%f18,	%f14,	%f12
	fmul8ulx16	%f12,	%f26,	%f20
	movne	%icc,	%o4,	%l1
	movrlez	%i0,	0x360,	%g6
	fpsub32s	%f23,	%f16,	%f2
	sub	%g7,	0x1746,	%g5
	edge32l	%l6,	%l2,	%i7
	fandnot2	%f0,	%f28,	%f18
	lduw	[%l7 + 0x2C],	%g1
	sethi	0x0890,	%l4
	movcc	%xcc,	%i4,	%i1
	sethi	0x1F54,	%i5
	sdiv	%g4,	0x0E91,	%i3
	addc	%o1,	0x1E8B,	%i6
	srl	%o0,	%o3,	%o6
	fzero	%f18
	movle	%icc,	%l0,	%l3
	fmovrdgez	%g2,	%f12,	%f4
	restore %i2, 0x0EF8, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x07B1,	%o2
	subcc	%l5,	0x0ACB,	%o5
	addccc	%o4,	%l1,	%g3
	addcc	%i0,	0x10B4,	%g7
	srl	%g5,	0x12,	%l6
	movle	%icc,	%g6,	%l2
	fmovdcs	%xcc,	%f0,	%f3
	ldsh	[%l7 + 0x24],	%g1
	andn	%i7,	0x135D,	%i4
	sub	%i1,	0x0DFA,	%i5
	sra	%l4,	%i3,	%o1
	sethi	0x135A,	%i6
	std	%f22,	[%l7 + 0x38]
	andncc	%g4,	%o0,	%o3
	movcc	%xcc,	%l0,	%l3
	stx	%o6,	[%l7 + 0x40]
	fmovsn	%icc,	%f2,	%f29
	save %i2, 0x1708, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o2,	%l5
	addcc	%o7,	%o5,	%l1
	sub	%o4,	%g3,	%g7
	xnorcc	%g5,	%i0,	%l6
	orncc	%g6,	0x0466,	%g1
	fandnot2s	%f21,	%f23,	%f2
	movvs	%icc,	%l2,	%i4
	edge8l	%i1,	%i7,	%i5
	sll	%i3,	0x09,	%l4
	edge32	%o1,	%g4,	%o0
	subcc	%i6,	0x1685,	%o3
	fmovsg	%icc,	%f24,	%f14
	addcc	%l3,	0x1CF7,	%l0
	or	%i2,	0x02EE,	%g2
	movgu	%icc,	%o2,	%l5
	alignaddrl	%o7,	%o5,	%o6
	sethi	0x0744,	%o4
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	sth	%g7,	[%l7 + 0x62]
	mova	%xcc,	%i0,	%g5
	xnorcc	%g6,	0x0E7C,	%l6
	ldd	[%l7 + 0x70],	%l2
	udivx	%i4,	0x1EAC,	%g1
	fands	%f2,	%f3,	%f20
	sllx	%i1,	%i7,	%i3
	fmovdcs	%xcc,	%f5,	%f22
	fpsub16	%f12,	%f18,	%f30
	stb	%l4,	[%l7 + 0x6F]
	fmuld8ulx16	%f3,	%f24,	%f20
	array32	%o1,	%i5,	%g4
	sethi	0x0B28,	%o0
	subcc	%i6,	%l3,	%o3
	orcc	%i2,	%g2,	%l0
	movrlez	%o2,	0x113,	%l5
	edge16l	%o5,	%o7,	%o6
	udivx	%l1,	0x1C95,	%o4
	fandnot1s	%f20,	%f20,	%f19
	fmovs	%f31,	%f7
	ldd	[%l7 + 0x30],	%f30
	ldub	[%l7 + 0x16],	%g7
	stx	%g3,	[%l7 + 0x28]
	edge16ln	%i0,	%g5,	%l6
	sdivx	%g6,	0x0CCA,	%i4
	sub	%l2,	%g1,	%i1
	sra	%i7,	%l4,	%i3
	movcs	%icc,	%o1,	%i5
	fnor	%f4,	%f22,	%f8
	movneg	%xcc,	%g4,	%i6
	movpos	%xcc,	%o0,	%l3
	ldsh	[%l7 + 0x7C],	%o3
	ldub	[%l7 + 0x70],	%i2
	ldsb	[%l7 + 0x0D],	%l0
	fones	%f3
	alignaddr	%g2,	%o2,	%l5
	xnorcc	%o7,	%o6,	%o5
	movleu	%xcc,	%o4,	%g7
	movn	%icc,	%g3,	%l1
	lduw	[%l7 + 0x70],	%i0
	stx	%g5,	[%l7 + 0x68]
	fmovsg	%xcc,	%f31,	%f4
	edge32l	%g6,	%l6,	%l2
	addccc	%g1,	0x1458,	%i1
	srlx	%i4,	%l4,	%i7
	array16	%o1,	%i3,	%i5
	edge16	%g4,	%i6,	%l3
	fmovda	%icc,	%f13,	%f9
	smul	%o0,	0x1139,	%i2
	fnot1s	%f5,	%f19
	movle	%xcc,	%o3,	%l0
	stx	%o2,	[%l7 + 0x18]
	alignaddr	%l5,	%g2,	%o6
	fexpand	%f9,	%f20
	sub	%o5,	%o4,	%o7
	faligndata	%f12,	%f16,	%f26
	srlx	%g7,	0x18,	%g3
	movrne	%l1,	0x17D,	%g5
	movvs	%xcc,	%g6,	%i0
	fmovdge	%icc,	%f3,	%f26
	edge8	%l6,	%g1,	%l2
	movrlez	%i1,	%l4,	%i4
	movrgz	%i7,	%o1,	%i3
	srax	%g4,	0x09,	%i6
	srax	%l3,	%o0,	%i5
	movre	%i2,	%o3,	%l0
	movg	%xcc,	%o2,	%l5
	xorcc	%g2,	0x1FB1,	%o6
	ldd	[%l7 + 0x60],	%f8
	fmovrdlz	%o4,	%f20,	%f20
	stx	%o7,	[%l7 + 0x08]
	save %o5, 0x180C, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt16	%f14,	%f30,	%g3
	movl	%xcc,	%g5,	%l1
	fmovdcc	%icc,	%f10,	%f0
	srax	%g6,	%l6,	%g1
	fmovdge	%xcc,	%f24,	%f7
	movrne	%l2,	%i1,	%l4
	fmovda	%icc,	%f19,	%f7
	movvc	%xcc,	%i4,	%i7
	array16	%i0,	%o1,	%i3
	mulx	%i6,	%l3,	%g4
	movne	%xcc,	%o0,	%i2
	sth	%i5,	[%l7 + 0x10]
	edge32	%o3,	%l0,	%o2
	ldsw	[%l7 + 0x1C],	%l5
	mulscc	%g2,	0x1B2D,	%o6
	fnor	%f14,	%f18,	%f30
	fmovrse	%o7,	%f12,	%f9
	subcc	%o4,	%g7,	%g3
	fabss	%f31,	%f18
	edge32n	%g5,	%o5,	%g6
	or	%l6,	0x00BE,	%g1
	sdivcc	%l1,	0x07E8,	%l2
	fcmpgt16	%f24,	%f6,	%i1
	ldd	[%l7 + 0x28],	%f28
	fmovsa	%xcc,	%f20,	%f11
	movl	%xcc,	%l4,	%i4
	edge32n	%i7,	%o1,	%i3
	udiv	%i6,	0x0AF8,	%i0
	movcs	%icc,	%l3,	%g4
	umul	%i2,	0x0985,	%i5
	edge8l	%o0,	%l0,	%o2
	fpackfix	%f8,	%f28
	stb	%l5,	[%l7 + 0x28]
	movrgez	%o3,	0x2A4,	%o6
	andcc	%o7,	0x08A5,	%g2
	fpackfix	%f2,	%f31
	sra	%o4,	%g3,	%g7
	fpadd16	%f20,	%f22,	%f16
	movcs	%icc,	%o5,	%g5
	ldub	[%l7 + 0x73],	%g6
	movneg	%icc,	%g1,	%l1
	move	%icc,	%l6,	%i1
	movrlz	%l2,	%l4,	%i4
	edge8ln	%i7,	%i3,	%i6
	smulcc	%i0,	0x097E,	%l3
	fmul8ulx16	%f28,	%f24,	%f22
	andcc	%o1,	%g4,	%i5
	ldd	[%l7 + 0x08],	%i2
	fnot2s	%f4,	%f22
	ldsh	[%l7 + 0x24],	%o0
	edge16l	%o2,	%l0,	%o3
	edge8ln	%l5,	%o6,	%o7
	edge8n	%o4,	%g3,	%g7
	movcs	%icc,	%g2,	%o5
	addcc	%g6,	%g5,	%g1
	edge32l	%l1,	%l6,	%l2
	xnorcc	%i1,	0x1361,	%l4
	fnegd	%f2,	%f18
	fmovsneg	%xcc,	%f5,	%f2
	ldsw	[%l7 + 0x64],	%i7
	movgu	%xcc,	%i4,	%i3
	sub	%i6,	%i0,	%l3
	edge8ln	%o1,	%i5,	%i2
	subcc	%g4,	0x06BD,	%o0
	fsrc2s	%f4,	%f4
	srax	%l0,	0x0F,	%o3
	lduh	[%l7 + 0x72],	%l5
	fmovsneg	%icc,	%f0,	%f11
	st	%f30,	[%l7 + 0x3C]
	fpadd16	%f28,	%f24,	%f14
	movgu	%icc,	%o2,	%o6
	xnor	%o4,	0x0AA6,	%o7
	subccc	%g3,	%g2,	%g7
	movpos	%icc,	%g6,	%o5
	ldd	[%l7 + 0x70],	%g0
	umul	%l1,	%l6,	%l2
	fmovse	%xcc,	%f28,	%f8
	array8	%i1,	%l4,	%g5
	movrgez	%i4,	0x23D,	%i7
	smul	%i6,	0x00E2,	%i3
	srax	%l3,	0x12,	%i0
	fcmple16	%f10,	%f8,	%i5
	mova	%icc,	%i2,	%g4
	or	%o0,	0x0D3D,	%l0
	andn	%o3,	0x0FE2,	%l5
	sll	%o2,	0x06,	%o6
	fmovrdne	%o4,	%f26,	%f22
	array8	%o1,	%g3,	%o7
	movcc	%icc,	%g2,	%g6
	popc	0x1E79,	%g7
	fpadd16	%f0,	%f10,	%f12
	addcc	%g1,	0x0D5D,	%l1
	orncc	%l6,	%o5,	%l2
	fmovrdgez	%l4,	%f20,	%f8
	mulx	%g5,	%i4,	%i1
	movl	%icc,	%i6,	%i7
	movrlz	%i3,	%l3,	%i0
	sra	%i2,	%i5,	%o0
	sth	%l0,	[%l7 + 0x3C]
	srax	%o3,	0x0D,	%l5
	smulcc	%o2,	0x0C4E,	%g4
	stw	%o4,	[%l7 + 0x10]
	edge32	%o1,	%g3,	%o6
	sdiv	%g2,	0x0A4E,	%o7
	lduh	[%l7 + 0x58],	%g6
	fcmpeq32	%f18,	%f20,	%g1
	movle	%xcc,	%g7,	%l6
	ldd	[%l7 + 0x18],	%o4
	fabss	%f12,	%f13
	ldsh	[%l7 + 0x1A],	%l1
	movvc	%icc,	%l2,	%g5
	movvs	%icc,	%l4,	%i4
	edge32	%i6,	%i1,	%i3
	edge32n	%l3,	%i7,	%i0
	or	%i2,	0x14C3,	%o0
	addc	%i5,	%o3,	%l5
	andcc	%l0,	0x0FAF,	%g4
	array8	%o2,	%o4,	%o1
	edge32n	%o6,	%g3,	%g2
	edge16ln	%g6,	%o7,	%g1
	edge8l	%l6,	%o5,	%g7
	ldx	[%l7 + 0x50],	%l2
	fmovsle	%xcc,	%f30,	%f13
	popc	%l1,	%g5
	lduh	[%l7 + 0x14],	%i4
	movneg	%icc,	%l4,	%i1
	movl	%icc,	%i3,	%i6
	fmovrsne	%i7,	%f26,	%f22
	movrgez	%l3,	%i2,	%i0
	faligndata	%f16,	%f16,	%f0
	fmovrdgez	%o0,	%f30,	%f26
	fsrc1	%f18,	%f22
	restore %o3, %i5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%l5,	%o2
	ldx	[%l7 + 0x10],	%o4
	movvs	%xcc,	%o1,	%g4
	movvc	%icc,	%g3,	%g2
	fmovrdgez	%g6,	%f30,	%f0
	save %o7, %o6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1D],	%l6
	movrlez	%o5,	0x229,	%g7
	udivcc	%l2,	0x03F2,	%g5
	movcs	%xcc,	%l1,	%i4
	movcs	%icc,	%l4,	%i3
	movne	%icc,	%i6,	%i7
	movre	%i1,	0x37A,	%i2
	sll	%l3,	0x1C,	%o0
	fcmpd	%fcc0,	%f30,	%f6
	umulcc	%o3,	0x1104,	%i5
	srlx	%i0,	%l0,	%l5
	movpos	%xcc,	%o4,	%o2
	edge8l	%o1,	%g4,	%g3
	edge32l	%g2,	%g6,	%o7
	movcc	%xcc,	%o6,	%g1
	edge8l	%o5,	%g7,	%l6
	srax	%l2,	0x16,	%l1
	or	%g5,	%l4,	%i4
	fmovsn	%icc,	%f14,	%f11
	movg	%xcc,	%i6,	%i7
	stb	%i3,	[%l7 + 0x26]
	mova	%icc,	%i2,	%l3
	movrne	%o0,	0x10B,	%o3
	movg	%icc,	%i1,	%i0
	and	%i5,	0x1656,	%l0
	fmovrslz	%o4,	%f9,	%f31
	alignaddrl	%l5,	%o1,	%o2
	orcc	%g4,	%g3,	%g2
	movpos	%xcc,	%o7,	%o6
	ldub	[%l7 + 0x25],	%g1
	fandnot2s	%f20,	%f16,	%f24
	stb	%o5,	[%l7 + 0x12]
	sdivcc	%g6,	0x1685,	%l6
	edge16n	%g7,	%l1,	%l2
	edge16l	%g5,	%i4,	%l4
	fmovrsgez	%i7,	%f28,	%f20
	fmovdge	%xcc,	%f4,	%f30
	movg	%icc,	%i6,	%i2
	orn	%l3,	%i3,	%o0
	smul	%o3,	0x0F5D,	%i0
	orncc	%i1,	%i5,	%l0
	nop
	set	0x1C, %l0
	stw	%o4,	[%l7 + %l0]
	edge16l	%o1,	%o2,	%l5
	sethi	0x0C16,	%g4
	udiv	%g2,	0x074C,	%o7
	addc	%o6,	%g3,	%o5
	movrgz	%g6,	%l6,	%g7
	fexpand	%f26,	%f14
	alignaddrl	%l1,	%l2,	%g5
	umulcc	%i4,	%l4,	%i7
	edge32l	%i6,	%g1,	%l3
	ldx	[%l7 + 0x20],	%i2
	fmovrse	%i3,	%f25,	%f0
	or	%o0,	%o3,	%i0
	alignaddr	%i5,	%i1,	%l0
	nop
	set	0x5F, %o0
	ldsb	[%l7 + %o0],	%o1
	ldx	[%l7 + 0x70],	%o4
	orncc	%o2,	0x0B4A,	%g4
	ldsw	[%l7 + 0x34],	%l5
	andncc	%g2,	%o7,	%o6
	movle	%xcc,	%g3,	%o5
	ldsh	[%l7 + 0x24],	%l6
	mulscc	%g6,	%g7,	%l1
	fmovsg	%icc,	%f17,	%f8
	fmovsgu	%icc,	%f29,	%f30
	subc	%l2,	0x13E7,	%g5
	st	%f4,	[%l7 + 0x60]
	edge32l	%l4,	%i7,	%i6
	lduh	[%l7 + 0x44],	%i4
	std	%f6,	[%l7 + 0x58]
	movneg	%icc,	%l3,	%g1
	movre	%i2,	0x26E,	%o0
	subc	%o3,	0x17A9,	%i3
	udivx	%i5,	0x0B46,	%i0
	addccc	%i1,	%o1,	%o4
	addccc	%o2,	%g4,	%l0
	fmovspos	%xcc,	%f13,	%f19
	movvs	%icc,	%l5,	%o7
	edge32	%g2,	%g3,	%o5
	movn	%xcc,	%l6,	%o6
	mulscc	%g7,	0x1952,	%g6
	edge16	%l1,	%g5,	%l2
	edge8	%i7,	%l4,	%i4
	sth	%l3,	[%l7 + 0x3A]
	mova	%icc,	%i6,	%g1
	mova	%xcc,	%o0,	%i2
	ldsw	[%l7 + 0x70],	%o3
	movne	%xcc,	%i5,	%i0
	movrgez	%i1,	%o1,	%o4
	edge16ln	%o2,	%g4,	%i3
	xnorcc	%l5,	%l0,	%o7
	fpsub32	%f30,	%f2,	%f24
	ldd	[%l7 + 0x68],	%g2
	array16	%o5,	%l6,	%g2
	movn	%xcc,	%g7,	%o6
	xorcc	%g6,	0x02B1,	%g5
	movne	%xcc,	%l1,	%l2
	alignaddr	%i7,	%l4,	%l3
	smulcc	%i4,	0x14C5,	%i6
	stw	%o0,	[%l7 + 0x6C]
	movcs	%icc,	%g1,	%i2
	xorcc	%o3,	0x002E,	%i5
	ldd	[%l7 + 0x30],	%f14
	sethi	0x04CE,	%i0
	fmul8x16al	%f28,	%f16,	%f24
	udivx	%i1,	0x1EAD,	%o1
	fpsub16	%f26,	%f30,	%f22
	andn	%o2,	0x10E0,	%g4
	movne	%icc,	%i3,	%o4
	movrgez	%l0,	0x2A2,	%o7
	orncc	%l5,	%o5,	%l6
	movleu	%icc,	%g3,	%g2
	fmovsl	%xcc,	%f30,	%f13
	udiv	%o6,	0x1F20,	%g7
	addc	%g6,	0x02A0,	%l1
	array8	%g5,	%i7,	%l4
	edge16	%l3,	%l2,	%i4
	umul	%o0,	0x1942,	%i6
	sdivcc	%g1,	0x0A47,	%i2
	array32	%o3,	%i5,	%i1
	umulcc	%o1,	0x1994,	%o2
	add	%g4,	%i3,	%o4
	fornot2	%f24,	%f30,	%f12
	sub	%i0,	%o7,	%l5
	movrgez	%l0,	%l6,	%o5
	array16	%g2,	%o6,	%g7
	edge32	%g3,	%l1,	%g6
	fcmps	%fcc0,	%f26,	%f16
	sdivx	%i7,	0x1F52,	%l4
	array16	%l3,	%g5,	%l2
	xor	%o0,	0x0FD8,	%i6
	movre	%i4,	0x251,	%g1
	movcc	%icc,	%o3,	%i5
	subccc	%i2,	%i1,	%o1
	stx	%g4,	[%l7 + 0x60]
	ldd	[%l7 + 0x40],	%f16
	fpadd32s	%f15,	%f13,	%f24
	srl	%i3,	%o4,	%o2
	andn	%i0,	%l5,	%l0
	movn	%xcc,	%o7,	%o5
	array32	%g2,	%l6,	%g7
	sra	%g3,	%o6,	%g6
	alignaddrl	%l1,	%l4,	%l3
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	fmovd	%f12,	%f28
	fpmerge	%f17,	%f31,	%f18
	stb	%o0,	[%l7 + 0x73]
	addccc	%l2,	%i6,	%i4
	std	%f24,	[%l7 + 0x60]
	edge32n	%o3,	%i5,	%g1
	fmovrse	%i2,	%f10,	%f7
	stx	%i1,	[%l7 + 0x78]
	sll	%g4,	%i3,	%o1
	sdivx	%o2,	0x0B51,	%i0
	ldsw	[%l7 + 0x5C],	%o4
	edge8	%l5,	%l0,	%o5
	orn	%o7,	0x09B0,	%g2
	movpos	%icc,	%l6,	%g7
	fsrc2	%f28,	%f22
	ldsb	[%l7 + 0x20],	%g3
	fornot2	%f20,	%f30,	%f16
	movge	%icc,	%g6,	%o6
	movgu	%icc,	%l4,	%l3
	movvc	%xcc,	%l1,	%g5
	stw	%i7,	[%l7 + 0x4C]
	sub	%o0,	0x020E,	%l2
	lduw	[%l7 + 0x20],	%i4
	edge8l	%i6,	%i5,	%o3
	udivx	%g1,	0x14B4,	%i1
	edge8n	%i2,	%i3,	%o1
	nop
	set	0x78, %l2
	std	%f8,	[%l7 + %l2]
	orncc	%o2,	0x1FF5,	%g4
	movl	%xcc,	%i0,	%o4
	sll	%l5,	%o5,	%l0
	save %o7, 0x0BBD, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1s	%f11,	%f13
	edge16ln	%g7,	%l6,	%g3
	movneg	%xcc,	%g6,	%o6
	restore %l3, 0x1388, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l1,	%g5
	xnorcc	%i7,	0x1331,	%o0
	fmovs	%f3,	%f20
	fpsub32s	%f17,	%f18,	%f30
	movneg	%icc,	%i4,	%i6
	movne	%xcc,	%i5,	%l2
	edge16n	%g1,	%i1,	%o3
	fnors	%f31,	%f3,	%f9
	mova	%icc,	%i3,	%i2
	edge32ln	%o1,	%o2,	%g4
	sll	%o4,	%i0,	%l5
	subcc	%l0,	%o5,	%o7
	ldsb	[%l7 + 0x4E],	%g2
	addccc	%g7,	0x122B,	%g3
	array8	%g6,	%l6,	%l3
	edge8ln	%o6,	%l1,	%l4
	pdist	%f28,	%f0,	%f14
	movge	%icc,	%g5,	%o0
	srlx	%i7,	0x07,	%i6
	ldsh	[%l7 + 0x56],	%i4
	edge32n	%i5,	%g1,	%l2
	array16	%i1,	%o3,	%i2
	xnorcc	%o1,	%i3,	%o2
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	movgu	%xcc,	%l0,	%o5
	fcmpeq32	%f10,	%f12,	%l5
	edge8	%g2,	%o7,	%g3
	sth	%g6,	[%l7 + 0x1C]
	fmul8ulx16	%f6,	%f4,	%f10
	add	%g7,	%l6,	%o6
	alignaddrl	%l3,	%l4,	%g5
	array8	%o0,	%i7,	%i6
	orncc	%i4,	0x0CEC,	%i5
	mova	%xcc,	%l1,	%l2
	fmovdvc	%xcc,	%f12,	%f3
	ldsh	[%l7 + 0x40],	%i1
	lduw	[%l7 + 0x1C],	%o3
	fmul8sux16	%f24,	%f12,	%f0
	edge8l	%i2,	%o1,	%g1
	popc	%o2,	%i3
	popc	%o4,	%g4
	array16	%i0,	%o5,	%l0
	ldsb	[%l7 + 0x1F],	%l5
	fmul8ulx16	%f6,	%f14,	%f0
	movcs	%icc,	%g2,	%g3
	sir	0x0C25
	smul	%o7,	0x07D5,	%g6
	orn	%l6,	0x1551,	%o6
	stx	%g7,	[%l7 + 0x68]
	smul	%l4,	%g5,	%o0
	fmovspos	%xcc,	%f31,	%f31
	movleu	%icc,	%l3,	%i7
	movrne	%i4,	%i6,	%i5
	andcc	%l1,	%i1,	%l2
	fzero	%f2
	fmovrse	%o3,	%f13,	%f24
	srl	%i2,	0x16,	%g1
	edge16ln	%o2,	%i3,	%o4
	fcmpgt32	%f2,	%f10,	%o1
	save %i0, %g4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x14D1,	%l0
	andn	%l5,	%g2,	%g3
	edge32	%g6,	%l6,	%o7
	fxnors	%f8,	%f13,	%f11
	alignaddrl	%g7,	%o6,	%g5
	udivx	%l4,	0x161D,	%o0
	mulx	%l3,	0x0A63,	%i7
	sir	0x1F4A
	sll	%i6,	0x03,	%i5
	movle	%icc,	%l1,	%i1
	ld	[%l7 + 0x1C],	%f3
	edge16ln	%i4,	%o3,	%i2
	xor	%l2,	0x099B,	%o2
	mova	%xcc,	%g1,	%o4
	fmul8sux16	%f24,	%f4,	%f26
	stb	%i3,	[%l7 + 0x50]
	nop
	set	0x20, %g7
	stx	%i0,	[%l7 + %g7]
	siam	0x6
	save %g4, %o5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l5,	%g2,	%g3
	movrne	%l0,	%g6,	%o7
	fxors	%f28,	%f10,	%f7
	alignaddrl	%l6,	%g7,	%g5
	umul	%l4,	%o6,	%o0
	fcmpne32	%f26,	%f20,	%l3
	smul	%i7,	0x18AE,	%i6
	fandnot1s	%f11,	%f4,	%f23
	movrgz	%i5,	%i1,	%l1
	fmovrslez	%i4,	%f21,	%f8
	add	%o3,	%l2,	%o2
	movrne	%g1,	0x2BC,	%i2
	sdivcc	%o4,	0x0E14,	%i0
	sra	%g4,	%i3,	%o1
	movrgez	%o5,	0x249,	%g2
	addccc	%l5,	%l0,	%g3
	movvs	%icc,	%g6,	%o7
	ldd	[%l7 + 0x58],	%f22
	lduw	[%l7 + 0x18],	%l6
	fpadd32s	%f25,	%f26,	%f7
	edge8l	%g7,	%l4,	%g5
	edge16l	%o0,	%l3,	%o6
	faligndata	%f0,	%f28,	%f28
	array8	%i6,	%i7,	%i1
	subcc	%i5,	0x0F29,	%i4
	fmovrdgz	%o3,	%f4,	%f16
	stx	%l2,	[%l7 + 0x78]
	udiv	%o2,	0x1CEA,	%l1
	fcmpne16	%f18,	%f24,	%i2
	fmovdcs	%icc,	%f31,	%f16
	edge32l	%g1,	%i0,	%g4
	srl	%i3,	%o4,	%o1
	umulcc	%o5,	0x1964,	%l5
	xnorcc	%g2,	%g3,	%g6
	movcs	%xcc,	%o7,	%l6
	movg	%xcc,	%l0,	%l4
	lduw	[%l7 + 0x68],	%g5
	sub	%o0,	0x1CD2,	%g7
	fors	%f14,	%f27,	%f26
	xnorcc	%o6,	0x0C8D,	%i6
	stb	%i7,	[%l7 + 0x13]
	or	%i1,	0x06A3,	%l3
	movvs	%icc,	%i5,	%o3
	fabsd	%f14,	%f16
	orn	%l2,	0x0817,	%i4
	mulscc	%l1,	0x11CC,	%o2
	andcc	%g1,	%i0,	%i2
	nop
	set	0x66, %l5
	ldsh	[%l7 + %l5],	%g4
	or	%i3,	%o4,	%o5
	movcc	%xcc,	%l5,	%g2
	mova	%xcc,	%o1,	%g3
	fmovrsgz	%o7,	%f21,	%f18
	edge16	%l6,	%l0,	%l4
	fmovda	%xcc,	%f2,	%f20
	umulcc	%g6,	%o0,	%g7
	fpsub16	%f16,	%f30,	%f26
	umul	%o6,	0x18FE,	%i6
	sllx	%g5,	%i7,	%l3
	or	%i1,	%i5,	%l2
	stb	%o3,	[%l7 + 0x55]
	fmovspos	%xcc,	%f9,	%f27
	edge16	%i4,	%l1,	%o2
	fsrc1s	%f2,	%f27
	fcmpne16	%f12,	%f2,	%g1
	movrgz	%i2,	%g4,	%i0
	smul	%o4,	0x1E54,	%i3
	edge32	%l5,	%o5,	%g2
	fnand	%f26,	%f6,	%f30
	sethi	0x0CE8,	%g3
	smulcc	%o7,	%o1,	%l6
	sth	%l4,	[%l7 + 0x56]
	orcc	%l0,	0x0FFD,	%o0
	movrgez	%g7,	%o6,	%g6
	sdiv	%g5,	0x1AFF,	%i7
	array32	%i6,	%i1,	%i5
	fpadd16s	%f10,	%f20,	%f15
	smulcc	%l3,	%o3,	%i4
	nop
	set	0x58, %o2
	ldx	[%l7 + %o2],	%l1
	xor	%l2,	0x0FE7,	%o2
	movge	%icc,	%i2,	%g1
	edge32n	%i0,	%o4,	%i3
	st	%f27,	[%l7 + 0x10]
	edge8l	%g4,	%o5,	%g2
	srlx	%g3,	0x19,	%l5
	sdiv	%o7,	0x1286,	%o1
	movvc	%xcc,	%l6,	%l4
	movcc	%xcc,	%l0,	%o0
	alignaddr	%g7,	%o6,	%g5
	fmovsgu	%icc,	%f9,	%f1
	edge8ln	%i7,	%g6,	%i1
	fcmpne32	%f10,	%f28,	%i5
	edge8l	%l3,	%i6,	%o3
	restore %i4, %l1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f18,	%f7
	movneg	%icc,	%l2,	%g1
	movle	%icc,	%i2,	%i0
	movl	%xcc,	%o4,	%g4
	srl	%o5,	%i3,	%g2
	array32	%g3,	%o7,	%o1
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	fmovdcc	%icc,	%f24,	%f0
	mulx	%l0,	%o0,	%l4
	ldub	[%l7 + 0x6B],	%o6
	udiv	%g5,	0x070A,	%i7
	movne	%xcc,	%g7,	%i1
	alignaddrl	%g6,	%i5,	%l3
	sth	%i6,	[%l7 + 0x46]
	movcc	%icc,	%i4,	%o3
	sll	%l1,	%o2,	%l2
	movleu	%icc,	%i2,	%g1
	ldx	[%l7 + 0x08],	%o4
	fornot1	%f18,	%f26,	%f30
	andcc	%g4,	0x0FA2,	%o5
	fsrc2	%f0,	%f0
	faligndata	%f24,	%f4,	%f24
	orcc	%i0,	0x0D8C,	%g2
	fmovrdlez	%i3,	%f4,	%f16
	smul	%g3,	0x061A,	%o1
	nop
	set	0x60, %l4
	stw	%l5,	[%l7 + %l4]
	andn	%o7,	0x0A52,	%l6
	subc	%o0,	0x1144,	%l4
	movge	%icc,	%o6,	%l0
	array32	%i7,	%g7,	%i1
	ldd	[%l7 + 0x38],	%f10
	edge16	%g5,	%i5,	%g6
	movn	%icc,	%i6,	%l3
	movl	%icc,	%i4,	%o3
	mulx	%l1,	0x0BE0,	%l2
	andncc	%i2,	%g1,	%o4
	fmovsleu	%xcc,	%f26,	%f7
	edge32l	%o2,	%g4,	%o5
	stw	%i0,	[%l7 + 0x74]
	and	%i3,	%g3,	%o1
	movrgez	%g2,	0x074,	%l5
	orncc	%o7,	0x049F,	%l6
	udiv	%l4,	0x00EB,	%o0
	fcmpne32	%f14,	%f22,	%o6
	lduw	[%l7 + 0x48],	%i7
	popc	%l0,	%i1
	move	%xcc,	%g7,	%g5
	smulcc	%g6,	%i6,	%l3
	subcc	%i4,	%i5,	%l1
	movrlz	%o3,	%i2,	%g1
	array16	%o4,	%l2,	%g4
	siam	0x5
	orcc	%o5,	%i0,	%o2
	array8	%i3,	%g3,	%o1
	orn	%l5,	0x0D6F,	%g2
	movrlz	%o7,	%l4,	%l6
	movre	%o0,	0x126,	%o6
	edge8l	%i7,	%i1,	%l0
	udivx	%g5,	0x197F,	%g7
	sdivcc	%g6,	0x14DE,	%i6
	movneg	%icc,	%i4,	%l3
	sdivx	%l1,	0x1951,	%i5
	orn	%o3,	%i2,	%g1
	lduw	[%l7 + 0x48],	%l2
	movne	%icc,	%g4,	%o5
	lduw	[%l7 + 0x0C],	%o4
	sir	0x07B1
	st	%f1,	[%l7 + 0x34]
	srax	%i0,	0x17,	%i3
	save %o2, 0x1FAF, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f28,	[%l7 + 0x08]
	mova	%xcc,	%g3,	%l5
	xorcc	%g2,	0x1521,	%o7
	xnor	%l4,	0x043A,	%l6
	orncc	%o0,	0x1BB5,	%i7
	stw	%o6,	[%l7 + 0x4C]
	edge8n	%i1,	%g5,	%g7
	nop
	set	0x40, %g3
	ldd	[%l7 + %g3],	%l0
	mulscc	%g6,	%i6,	%l3
	ldsh	[%l7 + 0x5C],	%l1
	movre	%i5,	%i4,	%o3
	fcmple32	%f10,	%f14,	%i2
	fnors	%f11,	%f14,	%f17
	stw	%l2,	[%l7 + 0x70]
	movvc	%icc,	%g1,	%g4
	and	%o4,	%o5,	%i0
	edge32n	%o2,	%i3,	%o1
	fpsub16s	%f27,	%f16,	%f9
	ldsb	[%l7 + 0x5D],	%g3
	fandnot1	%f14,	%f26,	%f10
	movvc	%xcc,	%g2,	%o7
	smulcc	%l4,	0x1E78,	%l6
	mulx	%l5,	%o0,	%i7
	subcc	%i1,	%o6,	%g7
	movneg	%icc,	%g5,	%g6
	movrlz	%l0,	%i6,	%l1
	ldx	[%l7 + 0x78],	%i5
	addccc	%i4,	0x1E09,	%o3
	ldx	[%l7 + 0x18],	%l3
	movge	%icc,	%i2,	%l2
	fmul8sux16	%f10,	%f4,	%f4
	edge32ln	%g4,	%g1,	%o5
	sdivx	%i0,	0x1EEE,	%o2
	udivx	%i3,	0x169B,	%o4
	orn	%g3,	0x01CE,	%o1
	movre	%g2,	%o7,	%l4
	sethi	0x0DC1,	%l6
	sdiv	%l5,	0x0B0A,	%o0
	xor	%i7,	0x10ED,	%o6
	orcc	%i1,	0x06D1,	%g7
	mova	%xcc,	%g5,	%g6
	mulscc	%l0,	%l1,	%i6
	movrlz	%i5,	%i4,	%o3
	sth	%l3,	[%l7 + 0x74]
	fsrc1s	%f15,	%f24
	edge16n	%i2,	%g4,	%g1
	ld	[%l7 + 0x60],	%f18
	fmovsa	%icc,	%f7,	%f16
	ldd	[%l7 + 0x58],	%f10
	ldd	[%l7 + 0x50],	%f28
	edge16l	%o5,	%i0,	%o2
	fmovrsgz	%i3,	%f12,	%f5
	movre	%o4,	0x378,	%g3
	movg	%xcc,	%o1,	%l2
	udiv	%o7,	0x139D,	%l4
	save %l6, 0x1F32, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%xcc,	%f6,	%f10
	umulcc	%g2,	%i7,	%o6
	sdivcc	%i1,	0x0813,	%o0
	ldd	[%l7 + 0x28],	%g6
	fxnor	%f14,	%f26,	%f12
	fmovsgu	%xcc,	%f24,	%f2
	edge32n	%g5,	%l0,	%g6
	fsrc1	%f2,	%f22
	movgu	%xcc,	%i6,	%i5
	edge16ln	%l1,	%i4,	%l3
	subccc	%o3,	%i2,	%g4
	sdiv	%o5,	0x1DE5,	%g1
	srl	%i0,	%o2,	%o4
	edge8l	%g3,	%o1,	%l2
	lduh	[%l7 + 0x22],	%i3
	ldsb	[%l7 + 0x2E],	%o7
	fmovrdgz	%l6,	%f0,	%f24
	nop
	set	0x68, %o6
	stx	%l4,	[%l7 + %o6]
	movrgez	%l5,	0x3CE,	%g2
	addcc	%o6,	0x0CBA,	%i7
	sdiv	%o0,	0x0193,	%g7
	sdivcc	%g5,	0x1FA2,	%i1
	fmovsgu	%xcc,	%f1,	%f4
	stw	%l0,	[%l7 + 0x68]
	movrlez	%i6,	0x13E,	%g6
	mulscc	%l1,	%i5,	%i4
	movre	%o3,	%i2,	%l3
	fnot1s	%f29,	%f2
	edge16n	%g4,	%g1,	%o5
	movne	%icc,	%i0,	%o4
	sethi	0x0FF4,	%g3
	fnot1s	%f22,	%f23
	std	%f4,	[%l7 + 0x50]
	movrgz	%o2,	%o1,	%l2
	popc	0x0F40,	%o7
	mova	%xcc,	%l6,	%l4
	fmovdn	%icc,	%f5,	%f10
	fones	%f5
	ldx	[%l7 + 0x60],	%l5
	mulx	%g2,	%o6,	%i3
	ldd	[%l7 + 0x48],	%f4
	fmovrdne	%o0,	%f8,	%f2
	std	%f24,	[%l7 + 0x30]
	movn	%xcc,	%i7,	%g5
	fmul8x16	%f27,	%f20,	%f10
	xnorcc	%g7,	%i1,	%i6
	fornot2	%f20,	%f30,	%f20
	movleu	%icc,	%l0,	%l1
	movrlz	%i5,	%i4,	%o3
	sir	0x1432
	ldsb	[%l7 + 0x4A],	%i2
	fmovde	%icc,	%f4,	%f1
	fmovsvs	%icc,	%f30,	%f29
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%f22
	subc	%l3,	0x184E,	%g6
	movcs	%xcc,	%g4,	%g1
	xor	%o5,	%o4,	%g3
	sth	%o2,	[%l7 + 0x4A]
	ldd	[%l7 + 0x30],	%f30
	sth	%i0,	[%l7 + 0x7C]
	umul	%o1,	%o7,	%l6
	ldsb	[%l7 + 0x31],	%l2
	xnorcc	%l4,	%g2,	%o6
	ldsh	[%l7 + 0x54],	%i3
	movl	%xcc,	%l5,	%o0
	movne	%icc,	%g5,	%i7
	sll	%g7,	%i1,	%l0
	srl	%i6,	0x1E,	%l1
	pdist	%f24,	%f2,	%f24
	movrgez	%i5,	%i4,	%i2
	movrne	%l3,	%g6,	%g4
	movrgez	%g1,	0x05D,	%o3
	fmovdcc	%xcc,	%f13,	%f10
	alignaddr	%o5,	%o4,	%g3
	udivx	%i0,	0x0EE3,	%o1
	edge8n	%o7,	%l6,	%l2
	movleu	%xcc,	%o2,	%l4
	movn	%xcc,	%o6,	%i3
	fxors	%f22,	%f29,	%f18
	fmovd	%f20,	%f0
	move	%xcc,	%g2,	%l5
	move	%icc,	%g5,	%o0
	edge8l	%i7,	%i1,	%g7
	array32	%l0,	%i6,	%i5
	fcmpgt16	%f20,	%f14,	%l1
	mulx	%i2,	0x15FC,	%i4
	subccc	%g6,	%l3,	%g4
	movle	%xcc,	%o3,	%o5
	sub	%g1,	0x0415,	%o4
	fmovrdlez	%g3,	%f26,	%f2
	edge32n	%i0,	%o1,	%l6
	xorcc	%l2,	0x034A,	%o2
	umulcc	%l4,	0x118D,	%o6
	fxnor	%f4,	%f6,	%f6
	lduw	[%l7 + 0x28],	%i3
	movg	%icc,	%o7,	%l5
	mulscc	%g5,	%o0,	%i7
	save %g2, 0x01CF, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f17,	%f11
	save %l0, %i6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g7,	0x0E02,	%i2
	sir	0x04E5
	edge8l	%l1,	%i4,	%g6
	sub	%g4,	%o3,	%l3
	fmovsle	%icc,	%f7,	%f7
	movrgz	%o5,	%g1,	%o4
	srax	%g3,	%i0,	%o1
	subcc	%l2,	0x0C3C,	%l6
	movleu	%icc,	%l4,	%o2
	fxors	%f28,	%f19,	%f20
	move	%icc,	%o6,	%o7
	movle	%icc,	%l5,	%g5
	smul	%i3,	%i7,	%o0
	ldx	[%l7 + 0x38],	%g2
	srax	%i1,	%l0,	%i5
	fmovdneg	%xcc,	%f31,	%f13
	sra	%g7,	0x05,	%i2
	fmul8x16al	%f30,	%f10,	%f24
	srax	%l1,	0x13,	%i6
	andncc	%g6,	%g4,	%o3
	array8	%i4,	%o5,	%g1
	save %l3, %o4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f0,	%f12,	%o1
	addcc	%l2,	%g3,	%l6
	mova	%xcc,	%l4,	%o6
	movl	%xcc,	%o7,	%l5
	fmovde	%xcc,	%f5,	%f22
	fandnot2s	%f18,	%f13,	%f30
	fpack32	%f30,	%f12,	%f10
	sth	%o2,	[%l7 + 0x20]
	fones	%f19
	sdivx	%i3,	0x0790,	%g5
	fandnot1s	%f8,	%f4,	%f19
	stx	%o0,	[%l7 + 0x70]
	fmovscs	%xcc,	%f29,	%f13
	mulscc	%i7,	%i1,	%g2
	edge16n	%l0,	%i5,	%i2
	fmuld8ulx16	%f11,	%f6,	%f16
	fmovsn	%xcc,	%f23,	%f15
	movne	%icc,	%g7,	%i6
	movcc	%icc,	%l1,	%g6
	fmovda	%xcc,	%f10,	%f12
	udivx	%g4,	0x17C6,	%o3
	ldsw	[%l7 + 0x34],	%i4
	fmovdvs	%xcc,	%f30,	%f25
	stb	%o5,	[%l7 + 0x2C]
	ldub	[%l7 + 0x52],	%g1
	mova	%xcc,	%l3,	%i0
	ld	[%l7 + 0x3C],	%f24
	udiv	%o1,	0x0A99,	%o4
	sdiv	%l2,	0x06B0,	%l6
	sub	%g3,	%l4,	%o6
	movre	%o7,	0x116,	%l5
	edge16	%o2,	%i3,	%o0
	fpadd32	%f8,	%f10,	%f22
	xnor	%g5,	0x1C9B,	%i1
	addcc	%i7,	%l0,	%g2
	stw	%i2,	[%l7 + 0x20]
	fmovrsgez	%g7,	%f23,	%f20
	fcmpne16	%f8,	%f28,	%i6
	fand	%f18,	%f24,	%f26
	movgu	%xcc,	%l1,	%i5
	ldd	[%l7 + 0x30],	%f10
	subcc	%g4,	0x0A5E,	%o3
	mulx	%i4,	0x015D,	%g6
	restore %o5, 0x15B7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i0,	0x1C0,	%g1
	fcmps	%fcc3,	%f29,	%f1
	sir	0x053D
	fsrc1	%f4,	%f0
	udivcc	%o1,	0x1ECD,	%o4
	fmul8x16al	%f20,	%f3,	%f0
	andncc	%l6,	%l2,	%l4
	edge32	%g3,	%o7,	%o6
	fmovrslez	%l5,	%f6,	%f4
	nop
	set	0x38, %i6
	ldsb	[%l7 + %i6],	%i3
	fmovdvs	%xcc,	%f5,	%f15
	movcs	%xcc,	%o0,	%o2
	and	%g5,	%i7,	%i1
	and	%g2,	%i2,	%l0
	movcc	%xcc,	%g7,	%i6
	or	%i5,	%l1,	%g4
	addccc	%i4,	%g6,	%o3
	stw	%o5,	[%l7 + 0x68]
	edge16n	%i0,	%l3,	%o1
	movpos	%xcc,	%g1,	%o4
	andn	%l2,	%l4,	%l6
	fandnot2	%f4,	%f16,	%f2
	subcc	%g3,	%o7,	%o6
	nop
	set	0x38, %i7
	ldd	[%l7 + %i7],	%f26
	sethi	0x1A3F,	%i3
	alignaddrl	%l5,	%o0,	%o2
	sethi	0x0CE9,	%i7
	sir	0x16E7
	andn	%g5,	0x1499,	%g2
	movcs	%icc,	%i1,	%l0
	mulscc	%i2,	0x103A,	%g7
	movrlz	%i5,	%l1,	%i6
	mulscc	%g4,	0x058E,	%i4
	fsrc1	%f12,	%f0
	sllx	%o3,	0x08,	%g6
	xorcc	%o5,	0x1487,	%i0
	movrne	%o1,	%g1,	%l3
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	movrlez	%l6,	%g3,	%o7
	fmul8x16au	%f6,	%f13,	%f24
	movcc	%xcc,	%l4,	%i3
	ldd	[%l7 + 0x60],	%l4
	stw	%o0,	[%l7 + 0x24]
	mulscc	%o6,	0x0C46,	%o2
	fnot2	%f16,	%f2
	mova	%icc,	%g5,	%g2
	edge32	%i1,	%l0,	%i2
	movrne	%i7,	0x32C,	%g7
	fnand	%f28,	%f12,	%f24
	popc	0x0D30,	%i5
	sth	%l1,	[%l7 + 0x26]
	edge8ln	%i6,	%g4,	%i4
	movrlez	%g6,	0x2B7,	%o5
	addc	%i0,	%o1,	%o3
	fmul8x16	%f19,	%f10,	%f10
	movrgez	%g1,	%l2,	%o4
	movle	%xcc,	%l3,	%l6
	edge32l	%o7,	%l4,	%g3
	fnor	%f14,	%f16,	%f10
	popc	0x12DD,	%i3
	sdivx	%o0,	0x17B7,	%o6
	fmovdle	%icc,	%f31,	%f8
	movre	%o2,	%g5,	%l5
	xnorcc	%i1,	%g2,	%l0
	edge8	%i2,	%i7,	%i5
	ldsw	[%l7 + 0x30],	%l1
	subccc	%g7,	0x1A8E,	%i6
	ldd	[%l7 + 0x28],	%g4
	movcs	%icc,	%i4,	%o5
	udivcc	%g6,	0x0D57,	%o1
	movrgz	%o3,	0x3BB,	%i0
	movne	%icc,	%g1,	%o4
	edge32n	%l3,	%l6,	%o7
	edge8l	%l2,	%l4,	%i3
	lduw	[%l7 + 0x1C],	%g3
	fcmps	%fcc0,	%f17,	%f28
	edge32l	%o6,	%o0,	%g5
	st	%f19,	[%l7 + 0x6C]
	movn	%icc,	%l5,	%i1
	fmovscc	%xcc,	%f14,	%f30
	st	%f8,	[%l7 + 0x74]
	orn	%o2,	%g2,	%l0
	siam	0x0
	edge16ln	%i7,	%i5,	%l1
	fornot1	%f0,	%f4,	%f22
	smulcc	%g7,	%i2,	%i6
	nop
	set	0x44, %i5
	lduh	[%l7 + %i5],	%g4
	movrgz	%o5,	0x0AF,	%g6
	fnor	%f16,	%f18,	%f22
	edge16l	%i4,	%o3,	%i0
	edge16	%g1,	%o4,	%l3
	st	%f2,	[%l7 + 0x14]
	movl	%icc,	%l6,	%o1
	fpsub16s	%f27,	%f27,	%f26
	nop
	set	0x3C, %i3
	sth	%o7,	[%l7 + %i3]
	stw	%l4,	[%l7 + 0x64]
	movrlez	%i3,	%g3,	%l2
	lduw	[%l7 + 0x64],	%o6
	pdist	%f18,	%f22,	%f8
	addcc	%g5,	%o0,	%l5
	ld	[%l7 + 0x44],	%f30
	subccc	%i1,	0x0125,	%g2
	fcmpes	%fcc2,	%f22,	%f1
	movneg	%xcc,	%l0,	%i7
	srl	%o2,	0x10,	%l1
	fors	%f8,	%f14,	%f25
	std	%f6,	[%l7 + 0x58]
	edge16	%i5,	%g7,	%i2
	udiv	%g4,	0x00D7,	%o5
	ldd	[%l7 + 0x18],	%i6
	ldub	[%l7 + 0x5B],	%i4
	restore %o3, %i0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%o4,	0x333,	%g6
	array16	%l6,	%l3,	%o1
	ldx	[%l7 + 0x18],	%o7
	fmovdvs	%icc,	%f11,	%f23
	srax	%l4,	0x1A,	%g3
	addccc	%l2,	0x1ABD,	%o6
	fmuld8sux16	%f22,	%f19,	%f6
	xnorcc	%g5,	%o0,	%l5
	movrne	%i3,	0x0BB,	%g2
	sub	%l0,	%i1,	%o2
	fxor	%f16,	%f6,	%f4
	fpsub16	%f24,	%f28,	%f28
	sra	%i7,	%l1,	%g7
	movrlez	%i5,	0x36F,	%g4
	udiv	%i2,	0x17D8,	%o5
	ldsw	[%l7 + 0x24],	%i6
	fmovspos	%icc,	%f8,	%f24
	fpsub32s	%f7,	%f15,	%f0
	fnot1	%f26,	%f22
	sth	%i4,	[%l7 + 0x28]
	edge16n	%i0,	%o3,	%o4
	save %g6, 0x0460, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l3,	%o1,	%l6
	fornot2s	%f11,	%f30,	%f9
	andcc	%l4,	%o7,	%g3
	fornot1	%f14,	%f12,	%f8
	save %o6, %g5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%o0,	%i3,	%g2
	sth	%l0,	[%l7 + 0x54]
	movge	%xcc,	%l5,	%o2
	subc	%i1,	%l1,	%g7
	std	%f4,	[%l7 + 0x20]
	srl	%i7,	%g4,	%i2
	alignaddrl	%i5,	%i6,	%i4
	ldub	[%l7 + 0x3C],	%o5
	subc	%i0,	0x054E,	%o4
	movge	%xcc,	%o3,	%g6
	movg	%icc,	%g1,	%l3
	fmovsa	%icc,	%f29,	%f27
	movrlez	%o1,	%l6,	%o7
	st	%f1,	[%l7 + 0x2C]
	move	%xcc,	%l4,	%g3
	fmovsle	%icc,	%f3,	%f12
	movcs	%icc,	%o6,	%g5
	edge8n	%l2,	%i3,	%g2
	subc	%o0,	0x1E3E,	%l5
	udiv	%l0,	0x03BC,	%i1
	ldub	[%l7 + 0x24],	%l1
	sra	%o2,	%i7,	%g4
	edge16	%g7,	%i5,	%i6
	fsrc1s	%f9,	%f4
	sll	%i4,	%o5,	%i0
	orncc	%o4,	0x0605,	%o3
	stw	%g6,	[%l7 + 0x24]
	movvs	%xcc,	%i2,	%g1
	fmovdg	%xcc,	%f3,	%f12
	edge16l	%l3,	%o1,	%l6
	movpos	%xcc,	%l4,	%o7
	movneg	%xcc,	%o6,	%g5
	xorcc	%l2,	0x06D4,	%g3
	addc	%g2,	0x03D0,	%i3
	edge32	%o0,	%l0,	%l5
	fmovdle	%xcc,	%f8,	%f30
	srlx	%l1,	%o2,	%i7
	fnands	%f24,	%f13,	%f12
	movrlz	%g4,	0x14E,	%g7
	edge16ln	%i1,	%i6,	%i5
	addccc	%o5,	0x1EED,	%i4
	fpsub16s	%f21,	%f9,	%f8
	fnot1s	%f1,	%f1
	fcmped	%fcc2,	%f2,	%f6
	orncc	%o4,	%o3,	%g6
	addcc	%i0,	0x13C9,	%g1
	xorcc	%i2,	0x0DFD,	%l3
	popc	%o1,	%l4
	smul	%l6,	0x1B86,	%o7
	fones	%f7
	std	%f2,	[%l7 + 0x68]
	stx	%g5,	[%l7 + 0x10]
	edge8	%o6,	%g3,	%l2
	std	%f24,	[%l7 + 0x50]
	srax	%g2,	0x16,	%o0
	mova	%xcc,	%l0,	%l5
	movrne	%i3,	%l1,	%o2
	addccc	%g4,	0x1E51,	%i7
	edge8l	%i1,	%i6,	%g7
	edge8	%o5,	%i4,	%o4
	edge8n	%i5,	%o3,	%i0
	stx	%g1,	[%l7 + 0x78]
	smulcc	%g6,	%i2,	%o1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3638
!	Type f   	: 5296
!	Type i   	: 16066
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0xC44EDE6C
.word 0x2C55A9F7
.word 0x1E9D93BD
.word 0xBE08E943
.word 0x3B7EE877
.word 0x2B476465
.word 0xC8B4FA2F
.word 0x7CBFE669
.word 0x1893A230
.word 0x0AABEFC3
.word 0xCB6E1748
.word 0xD587A770
.word 0x27239218
.word 0x5171EAE5
.word 0x9A1ACA69
.word 0xF19CF47D
.word 0x73E005B5
.word 0xC52F132F
.word 0x0680399A
.word 0xD79E2536
.word 0x142B88AC
.word 0x185B8945
.word 0x27DE290F
.word 0x98A73DC2
.word 0x5B3C46C6
.word 0x0A68F66C
.word 0x0CC2279F
.word 0x43E7D430
.word 0x474AF274
.word 0x75417388
.word 0x5492D61C
.word 0xF746A665
.word 0xDF9EF26C
.word 0xE1C5461E
.word 0x18374646
.word 0x0C084E5D
.word 0x71E8CD89
.word 0x4DB8A620
.word 0x45438FDD
.word 0x42244D0A
.word 0x1CEBD1B4
.word 0x1DB1B9F4
.word 0xA4EDE8CD
.word 0xD6502E05
.word 0x7EC2653B
.word 0x5CFD72B4
.word 0xDD4C7EF0
.word 0x747F4301
.word 0x2ACD459D
.word 0x90D9CFBD
.word 0x715059CD
.word 0xFC594F04
.word 0x5386F9F7
.word 0x7302E444
.word 0xF7820E8E
.word 0x7D8451A6
.word 0xCD0C12CE
.word 0xDF6F9389
.word 0xCA91130E
.word 0xC8E2D4B0
.word 0xC2C1764F
.word 0x682DDD06
.word 0x6DD91564
.word 0x780EFD39
.end
