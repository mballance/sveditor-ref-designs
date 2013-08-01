/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f5.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f5.s,v 1.1 2007/05/11 17:22:38 drp Exp $"
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
	setx	0x45FA6A58904180C1,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xF,	%g1
	set	0x5,	%g2
	set	0xB,	%g3
	set	0x5,	%g4
	set	0xB,	%g5
	set	0xA,	%g6
	set	0xD,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0x6,	%i1
	set	-0x5,	%i2
	set	-0x9,	%i3
	set	-0x1,	%i4
	set	-0x3,	%i5
	set	-0x8,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x1BBCE696,	%l0
	set	0x616AF251,	%l1
	set	0x2A3E5019,	%l2
	set	0x2DB10D7A,	%l3
	set	0x5E645B75,	%l4
	set	0x55ECBDE9,	%l5
	set	0x2F74F932,	%l6
	!# Output registers
	set	0x1F6A,	%o0
	set	-0x05F2,	%o1
	set	-0x11F5,	%o2
	set	0x1F73,	%o3
	set	-0x01FF,	%o4
	set	-0x1C42,	%o5
	set	0x01B9,	%o6
	set	0x0F49,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x32699498926CF234)
	INIT_TH_FP_REG(%l7,%f2,0xCA3A50480B01EA40)
	INIT_TH_FP_REG(%l7,%f4,0xBB3EF673D1D29EE0)
	INIT_TH_FP_REG(%l7,%f6,0xB209BB5788E66987)
	INIT_TH_FP_REG(%l7,%f8,0xE295DD8DC055F19B)
	INIT_TH_FP_REG(%l7,%f10,0x0358F257BD94994D)
	INIT_TH_FP_REG(%l7,%f12,0x185CAFB7B186EB76)
	INIT_TH_FP_REG(%l7,%f14,0x746D204CBB22838F)
	INIT_TH_FP_REG(%l7,%f16,0x025936D1D43636C5)
	INIT_TH_FP_REG(%l7,%f18,0x2ED1B965738B9CE1)
	INIT_TH_FP_REG(%l7,%f20,0x67A5C5946CDE6B78)
	INIT_TH_FP_REG(%l7,%f22,0xC6BEA6B9CA83819D)
	INIT_TH_FP_REG(%l7,%f24,0xC63B755C7F7059EE)
	INIT_TH_FP_REG(%l7,%f26,0xA06DD94CCD527F69)
	INIT_TH_FP_REG(%l7,%f28,0xEB27B5901D1CF56B)
	INIT_TH_FP_REG(%l7,%f30,0xB8B7FE86156A92D5)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	stb	%o6,	[%l7 + 0x55]
	save %l3, 0x0D10, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%i7,	%l1,	%l0
	fandnot1s	%f5,	%f31,	%f24
	fone	%f2
	edge16	%o4,	%i1,	%i3
	mulx	%i4,	0x09CF,	%l4
	fmovdge	%xcc,	%f18,	%f11
	edge8n	%g5,	%i0,	%o7
	mova	%xcc,	%i5,	%o3
	smulcc	%o1,	0x1AE8,	%i2
	save %g3, %l2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g2,	%g4
	edge8	%o0,	%g7,	%g1
	ldd	[%l7 + 0x68],	%i6
	array8	%o2,	%o5,	%o6
	ldd	[%l7 + 0x30],	%f10
	st	%f5,	[%l7 + 0x74]
	st	%f3,	[%l7 + 0x70]
	orncc	%l3,	%l5,	%i6
	stb	%i7,	[%l7 + 0x56]
	std	%f30,	[%l7 + 0x38]
	nop
	set	0x20, %l5
	ldd	[%l7 + %l5],	%l0
	fmuld8ulx16	%f12,	%f1,	%f20
	edge32n	%o4,	%i1,	%l1
	xnor	%i4,	%l4,	%g5
	fnors	%f4,	%f13,	%f19
	orcc	%i0,	%i3,	%o7
	add	%o3,	%o1,	%i2
	lduw	[%l7 + 0x10],	%g3
	addccc	%l2,	0x1D7B,	%g6
	edge8n	%g2,	%i5,	%g4
	array32	%g7,	%o0,	%l6
	mova	%xcc,	%o2,	%o5
	movcc	%xcc,	%g1,	%l3
	andn	%o6,	0x07EE,	%l5
	srl	%i7,	0x16,	%l0
	movrgez	%i6,	0x1E5,	%i1
	fmovdvs	%xcc,	%f30,	%f3
	udivcc	%o4,	0x054A,	%l1
	xorcc	%l4,	%i4,	%i0
	fnot2	%f20,	%f0
	movn	%xcc,	%i3,	%o7
	ldsh	[%l7 + 0x58],	%o3
	fmul8x16	%f12,	%f18,	%f14
	edge16l	%g5,	%o1,	%i2
	move	%xcc,	%l2,	%g3
	movcc	%icc,	%g6,	%g2
	fcmple32	%f20,	%f26,	%i5
	nop
	set	0x40, %l2
	stb	%g7,	[%l7 + %l2]
	ldx	[%l7 + 0x30],	%o0
	fnegs	%f30,	%f23
	fmovscc	%xcc,	%f31,	%f10
	orn	%l6,	%g4,	%o5
	fexpand	%f24,	%f24
	movcs	%icc,	%o2,	%g1
	restore %l3, 0x16AB, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o6,	%i7
	mova	%xcc,	%i6,	%l0
	ldsb	[%l7 + 0x1E],	%i1
	nop
	set	0x50, %g5
	ldd	[%l7 + %g5],	%o4
	srlx	%l1,	%l4,	%i0
	udiv	%i4,	0x09A8,	%i3
	fmovdge	%icc,	%f23,	%f3
	stx	%o3,	[%l7 + 0x38]
	movrlez	%g5,	0x316,	%o1
	fxor	%f0,	%f18,	%f30
	fcmple32	%f24,	%f28,	%o7
	fmovrsne	%l2,	%f6,	%f7
	subccc	%g3,	0x0B39,	%i2
	edge8ln	%g2,	%i5,	%g7
	smul	%o0,	%l6,	%g6
	movvs	%xcc,	%o5,	%g4
	movneg	%xcc,	%o2,	%g1
	fmovse	%xcc,	%f19,	%f7
	andncc	%l3,	%l5,	%o6
	smulcc	%i7,	%l0,	%i1
	mova	%xcc,	%o4,	%l1
	srax	%i6,	0x10,	%l4
	edge16l	%i4,	%i0,	%i3
	edge8	%g5,	%o1,	%o7
	sra	%o3,	0x0C,	%g3
	for	%f22,	%f20,	%f20
	save %i2, %g2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%g7,	%l2,	%l6
	fmul8x16al	%f13,	%f2,	%f6
	edge32l	%g6,	%o5,	%o0
	edge8n	%g4,	%g1,	%l3
	fmovdvc	%xcc,	%f16,	%f10
	fmul8ulx16	%f26,	%f18,	%f28
	fmul8ulx16	%f0,	%f16,	%f14
	edge16n	%l5,	%o6,	%o2
	sdiv	%l0,	0x14C1,	%i1
	srlx	%o4,	0x1B,	%l1
	fmul8x16al	%f14,	%f1,	%f2
	edge16	%i6,	%l4,	%i7
	fandnot1	%f24,	%f20,	%f18
	movgu	%xcc,	%i4,	%i3
	srax	%i0,	0x08,	%o1
	orcc	%o7,	0x08D5,	%o3
	mulx	%g5,	0x04A6,	%i2
	srax	%g3,	%i5,	%g7
	movn	%icc,	%l2,	%g2
	edge32ln	%l6,	%o5,	%o0
	movvs	%xcc,	%g4,	%g1
	movcs	%xcc,	%g6,	%l5
	nop
	set	0x44, %o4
	ldsw	[%l7 + %o4],	%o6
	ldub	[%l7 + 0x38],	%l3
	fandnot1s	%f5,	%f29,	%f4
	edge32	%o2,	%i1,	%l0
	mova	%xcc,	%l1,	%i6
	fnot1s	%f5,	%f13
	fnot1	%f2,	%f18
	fmovde	%icc,	%f4,	%f28
	alignaddrl	%o4,	%l4,	%i4
	fmovrdgez	%i7,	%f2,	%f6
	movvs	%xcc,	%i0,	%i3
	movcs	%xcc,	%o7,	%o3
	fmovse	%xcc,	%f28,	%f14
	movl	%icc,	%o1,	%g5
	fmovdcc	%xcc,	%f18,	%f20
	sdiv	%g3,	0x1E16,	%i5
	fxnor	%f24,	%f28,	%f0
	edge32	%i2,	%l2,	%g7
	sdivx	%l6,	0x1D0D,	%g2
	fmovrdlz	%o0,	%f10,	%f8
	fmul8ulx16	%f10,	%f6,	%f12
	orncc	%o5,	0x1121,	%g1
	movne	%icc,	%g4,	%l5
	movrgez	%o6,	%g6,	%o2
	ldsw	[%l7 + 0x78],	%i1
	fnegs	%f30,	%f0
	mulscc	%l0,	0x0750,	%l1
	subcc	%l3,	%o4,	%i6
	movle	%xcc,	%i4,	%i7
	save %i0, 0x1E56, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o7,	%i3,	%o1
	smulcc	%o3,	0x0D8E,	%g5
	popc	0x1580,	%g3
	fmovdcs	%xcc,	%f25,	%f19
	fpadd32	%f8,	%f4,	%f16
	smulcc	%i2,	%i5,	%l2
	fmovsne	%icc,	%f11,	%f17
	udivcc	%g7,	0x0947,	%g2
	and	%o0,	%o5,	%g1
	std	%f4,	[%l7 + 0x20]
	udivx	%g4,	0x16C9,	%l6
	fmul8x16	%f3,	%f24,	%f18
	srl	%l5,	%g6,	%o2
	save %i1, 0x07B4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l1,	%l0
	andcc	%l3,	0x197C,	%i6
	movle	%icc,	%i4,	%i7
	fnand	%f16,	%f6,	%f16
	movrgez	%o4,	0x3F1,	%l4
	add	%i0,	0x15DC,	%o7
	stx	%i3,	[%l7 + 0x50]
	alignaddrl	%o1,	%g5,	%o3
	fands	%f11,	%f2,	%f13
	ldd	[%l7 + 0x78],	%i2
	sub	%i5,	0x0209,	%l2
	ld	[%l7 + 0x70],	%f25
	edge32n	%g3,	%g7,	%g2
	ldsh	[%l7 + 0x46],	%o0
	ldd	[%l7 + 0x28],	%f16
	movpos	%icc,	%g1,	%o5
	umul	%l6,	%g4,	%l5
	fpadd32s	%f16,	%f2,	%f25
	fmovdl	%xcc,	%f29,	%f10
	ldd	[%l7 + 0x70],	%o2
	umulcc	%g6,	0x0048,	%o6
	fcmpes	%fcc0,	%f7,	%f27
	umul	%l1,	%i1,	%l3
	movge	%xcc,	%l0,	%i4
	andncc	%i6,	%o4,	%l4
	ldsh	[%l7 + 0x7A],	%i7
	udiv	%o7,	0x0D99,	%i3
	fmovsg	%icc,	%f6,	%f7
	array8	%o1,	%i0,	%o3
	movpos	%xcc,	%i2,	%g5
	move	%icc,	%l2,	%g3
	movrne	%g7,	%i5,	%g2
	fzeros	%f2
	array32	%o0,	%g1,	%l6
	ldub	[%l7 + 0x45],	%o5
	edge8ln	%l5,	%o2,	%g4
	movvc	%icc,	%g6,	%l1
	save %o6, 0x01A1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l3,	%l0
	movn	%icc,	%i4,	%i6
	fones	%f27
	movrgz	%l4,	0x1E3,	%i7
	movl	%icc,	%o7,	%o4
	umulcc	%i3,	%o1,	%i0
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	orn	%l2,	0x1C8C,	%g3
	edge32l	%g7,	%i5,	%g2
	movvs	%xcc,	%o0,	%l6
	movrgz	%g1,	0x2B2,	%l5
	smul	%o5,	%g4,	%o2
	movle	%icc,	%g6,	%o6
	sethi	0x007A,	%l1
	stw	%l3,	[%l7 + 0x34]
	sdivx	%l0,	0x1076,	%i4
	andcc	%i6,	0x0C14,	%i1
	fmovdneg	%icc,	%f26,	%f27
	sdivx	%l4,	0x058F,	%o7
	orcc	%i7,	0x1C6E,	%i3
	fmovsa	%xcc,	%f29,	%f25
	array16	%o4,	%o1,	%i2
	addcc	%i0,	0x16E8,	%g5
	fmovscs	%icc,	%f17,	%f28
	fmovrslez	%o3,	%f18,	%f4
	smul	%l2,	%g3,	%g7
	popc	0x08E2,	%i5
	udiv	%o0,	0x1366,	%l6
	udiv	%g2,	0x01A4,	%l5
	lduw	[%l7 + 0x10],	%o5
	edge16n	%g1,	%o2,	%g4
	array16	%g6,	%l1,	%o6
	fmovdgu	%icc,	%f18,	%f12
	sub	%l0,	%l3,	%i4
	fmovdcc	%icc,	%f11,	%f16
	alignaddr	%i1,	%i6,	%o7
	fcmpgt32	%f16,	%f24,	%l4
	fpsub16s	%f26,	%f12,	%f3
	fmovscc	%icc,	%f29,	%f31
	movre	%i7,	0x3FF,	%i3
	sll	%o4,	%o1,	%i0
	addccc	%g5,	0x1509,	%o3
	sllx	%i2,	0x1B,	%l2
	fcmpeq32	%f22,	%f14,	%g7
	and	%i5,	0x1D49,	%o0
	movgu	%icc,	%g3,	%l6
	movrgz	%l5,	0x195,	%g2
	mulscc	%o5,	0x1F2F,	%o2
	edge8l	%g4,	%g6,	%g1
	edge16n	%l1,	%l0,	%l3
	umulcc	%i4,	0x19B9,	%o6
	movgu	%xcc,	%i1,	%o7
	fmovsvc	%xcc,	%f18,	%f22
	edge32ln	%l4,	%i7,	%i3
	movle	%xcc,	%i6,	%o1
	movrlz	%i0,	%g5,	%o3
	movgu	%xcc,	%i2,	%o4
	sir	0x045F
	st	%f9,	[%l7 + 0x74]
	andncc	%g7,	%i5,	%o0
	edge16n	%g3,	%l2,	%l6
	fors	%f14,	%f9,	%f29
	movcc	%icc,	%l5,	%g2
	movg	%icc,	%o5,	%g4
	edge8l	%g6,	%o2,	%g1
	srl	%l1,	%l3,	%i4
	ldsw	[%l7 + 0x64],	%o6
	stw	%i1,	[%l7 + 0x44]
	edge8l	%o7,	%l0,	%l4
	stx	%i7,	[%l7 + 0x60]
	fsrc1	%f26,	%f0
	orn	%i3,	%o1,	%i0
	sethi	0x169F,	%i6
	move	%icc,	%g5,	%i2
	fcmpne16	%f14,	%f12,	%o3
	alignaddr	%o4,	%g7,	%o0
	edge32n	%i5,	%g3,	%l6
	fmovdpos	%icc,	%f10,	%f17
	movrne	%l5,	%g2,	%l2
	movpos	%xcc,	%g4,	%o5
	andcc	%o2,	0x1621,	%g6
	fmovdl	%icc,	%f10,	%f20
	siam	0x2
	fnot2	%f26,	%f12
	fmovd	%f8,	%f6
	fsrc2s	%f12,	%f3
	nop
	set	0x78, %o6
	ldx	[%l7 + %o6],	%g1
	udiv	%l1,	0x00EC,	%l3
	array8	%o6,	%i4,	%o7
	movrne	%i1,	%l0,	%i7
	addc	%l4,	%o1,	%i0
	subcc	%i6,	%i3,	%i2
	movne	%icc,	%o3,	%o4
	udivx	%g7,	0x0EE7,	%g5
	ld	[%l7 + 0x64],	%f28
	movge	%icc,	%o0,	%g3
	and	%l6,	%i5,	%l5
	sra	%l2,	%g4,	%g2
	sllx	%o5,	%g6,	%g1
	xor	%o2,	%l1,	%l3
	edge8n	%o6,	%i4,	%o7
	ldsh	[%l7 + 0x52],	%l0
	fpack16	%f22,	%f18
	and	%i1,	%i7,	%o1
	fsrc2s	%f29,	%f9
	edge8	%l4,	%i6,	%i0
	edge16ln	%i3,	%i2,	%o4
	nop
	set	0x30, %o7
	lduw	[%l7 + %o7],	%o3
	ldd	[%l7 + 0x58],	%g4
	andcc	%o0,	%g7,	%l6
	ldd	[%l7 + 0x60],	%f6
	mova	%xcc,	%g3,	%i5
	stb	%l2,	[%l7 + 0x08]
	fmovs	%f3,	%f28
	std	%f16,	[%l7 + 0x28]
	ldd	[%l7 + 0x40],	%f28
	addccc	%g4,	%g2,	%o5
	movl	%xcc,	%l5,	%g6
	fmuld8ulx16	%f15,	%f29,	%f2
	subc	%g1,	0x1296,	%o2
	xor	%l1,	0x0C73,	%l3
	movcc	%icc,	%i4,	%o6
	addcc	%l0,	0x12E3,	%i1
	edge8ln	%i7,	%o7,	%o1
	movgu	%icc,	%i6,	%i0
	movle	%icc,	%l4,	%i3
	sub	%i2,	0x1219,	%o4
	fmovdn	%xcc,	%f21,	%f28
	move	%xcc,	%o3,	%o0
	mulx	%g7,	0x11C1,	%l6
	movvs	%icc,	%g5,	%i5
	fcmpne32	%f30,	%f2,	%g3
	xnorcc	%l2,	0x00AD,	%g4
	pdist	%f26,	%f12,	%f24
	fcmpeq16	%f14,	%f12,	%o5
	fexpand	%f29,	%f4
	orncc	%l5,	0x0FA2,	%g2
	edge8n	%g1,	%o2,	%g6
	fmovsleu	%icc,	%f28,	%f29
	movneg	%xcc,	%l1,	%l3
	sdivx	%i4,	0x099D,	%o6
	movrne	%l0,	%i1,	%i7
	movrlez	%o7,	0x307,	%i6
	fands	%f28,	%f15,	%f10
	addc	%o1,	%l4,	%i3
	movg	%icc,	%i2,	%i0
	udiv	%o4,	0x0C51,	%o3
	fmovde	%icc,	%f17,	%f5
	fmovdleu	%icc,	%f13,	%f4
	mulx	%g7,	%o0,	%g5
	movrgez	%i5,	%l6,	%g3
	xorcc	%l2,	%o5,	%g4
	srlx	%g2,	%l5,	%o2
	movgu	%xcc,	%g6,	%l1
	restore %l3, %g1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f24,	%f30,	%f8
	andn	%l0,	%i4,	%i1
	fmovdleu	%xcc,	%f23,	%f30
	ld	[%l7 + 0x7C],	%f22
	popc	%o7,	%i7
	fmovrdne	%i6,	%f16,	%f14
	andn	%o1,	0x1820,	%l4
	array32	%i3,	%i2,	%o4
	subcc	%o3,	%i0,	%o0
	xor	%g5,	0x0735,	%i5
	fpadd32	%f22,	%f2,	%f16
	fnegs	%f21,	%f24
	edge32l	%g7,	%l6,	%l2
	andn	%g3,	%o5,	%g2
	edge32ln	%g4,	%o2,	%l5
	movn	%icc,	%l1,	%l3
	edge8l	%g6,	%o6,	%l0
	ldsb	[%l7 + 0x13],	%g1
	fpadd32	%f10,	%f28,	%f20
	edge16n	%i1,	%o7,	%i7
	edge16l	%i6,	%o1,	%l4
	lduh	[%l7 + 0x1E],	%i4
	st	%f8,	[%l7 + 0x38]
	xnorcc	%i3,	%o4,	%o3
	mulx	%i2,	%i0,	%g5
	sra	%o0,	0x1D,	%g7
	fones	%f17
	fmovspos	%icc,	%f4,	%f24
	movl	%xcc,	%l6,	%i5
	fcmpeq32	%f2,	%f0,	%l2
	fandnot2s	%f31,	%f5,	%f31
	fnot2s	%f17,	%f31
	movneg	%xcc,	%o5,	%g2
	sll	%g3,	%g4,	%l5
	stb	%o2,	[%l7 + 0x33]
	edge16l	%l3,	%l1,	%g6
	ldsh	[%l7 + 0x6E],	%l0
	std	%f24,	[%l7 + 0x30]
	fandnot1	%f4,	%f10,	%f14
	and	%g1,	%i1,	%o6
	sll	%i7,	%i6,	%o1
	addccc	%l4,	0x14FF,	%i4
	ldx	[%l7 + 0x70],	%i3
	fmovsneg	%icc,	%f17,	%f3
	fpmerge	%f31,	%f27,	%f16
	addccc	%o4,	0x0BBF,	%o3
	fone	%f6
	addcc	%i2,	0x144A,	%i0
	move	%xcc,	%g5,	%o0
	fsrc2s	%f7,	%f2
	orncc	%g7,	%l6,	%i5
	popc	%l2,	%o5
	alignaddr	%o7,	%g2,	%g3
	orcc	%g4,	%o2,	%l5
	xor	%l1,	0x173B,	%l3
	orncc	%l0,	%g6,	%g1
	sdiv	%o6,	0x047B,	%i1
	movcs	%icc,	%i6,	%i7
	stx	%l4,	[%l7 + 0x10]
	array32	%o1,	%i4,	%i3
	edge16ln	%o3,	%o4,	%i0
	fcmped	%fcc1,	%f6,	%f10
	st	%f10,	[%l7 + 0x20]
	edge8ln	%i2,	%o0,	%g7
	movpos	%icc,	%g5,	%l6
	fmuld8ulx16	%f0,	%f28,	%f12
	edge16l	%l2,	%o5,	%o7
	movle	%icc,	%i5,	%g2
	fmovrse	%g3,	%f19,	%f2
	ldd	[%l7 + 0x70],	%o2
	movre	%g4,	0x0F0,	%l5
	orncc	%l3,	0x1BE9,	%l1
	sethi	0x0FC5,	%l0
	fors	%f7,	%f7,	%f8
	movvc	%xcc,	%g1,	%g6
	fmovrdlez	%i1,	%f10,	%f24
	andncc	%o6,	%i7,	%i6
	fmovrslez	%o1,	%f7,	%f9
	fcmpne16	%f12,	%f20,	%l4
	sllx	%i4,	%o3,	%i3
	sdiv	%i0,	0x14EB,	%o4
	lduh	[%l7 + 0x6A],	%i2
	movg	%icc,	%g7,	%g5
	fmovsg	%xcc,	%f2,	%f13
	add	%l6,	0x1445,	%o0
	ldsw	[%l7 + 0x30],	%o5
	movle	%icc,	%o7,	%i5
	fmovsvs	%xcc,	%f30,	%f21
	movrlz	%l2,	%g3,	%o2
	fmovsge	%xcc,	%f8,	%f26
	sdivcc	%g2,	0x1425,	%g4
	sllx	%l5,	0x0A,	%l1
	sir	0x1D19
	fmovsneg	%icc,	%f17,	%f11
	xnor	%l0,	0x1BF3,	%g1
	array8	%g6,	%l3,	%o6
	movle	%icc,	%i1,	%i7
	subc	%i6,	0x1F8E,	%o1
	addcc	%i4,	0x0955,	%o3
	popc	0x047C,	%l4
	mulscc	%i0,	0x0E30,	%i3
	fpadd16s	%f9,	%f23,	%f29
	fmovsgu	%xcc,	%f3,	%f15
	fnor	%f30,	%f8,	%f16
	movleu	%icc,	%o4,	%i2
	fmovsgu	%xcc,	%f1,	%f27
	fmovsneg	%xcc,	%f1,	%f1
	fands	%f31,	%f0,	%f30
	andcc	%g5,	0x07F3,	%l6
	sdivcc	%o0,	0x18D0,	%o5
	alignaddrl	%g7,	%o7,	%l2
	alignaddr	%g3,	%i5,	%g2
	array16	%o2,	%g4,	%l1
	xnor	%l0,	%l5,	%g1
	lduw	[%l7 + 0x1C],	%l3
	movvc	%xcc,	%g6,	%o6
	sir	0x15BD
	xnorcc	%i1,	%i7,	%i6
	movpos	%xcc,	%o1,	%o3
	smulcc	%l4,	%i0,	%i4
	fmovrsgez	%o4,	%f5,	%f9
	fnand	%f24,	%f4,	%f26
	andncc	%i3,	%i2,	%g5
	stb	%l6,	[%l7 + 0x20]
	st	%f11,	[%l7 + 0x10]
	sethi	0x16D7,	%o0
	nop
	set	0x6A, %i2
	stb	%g7,	[%l7 + %i2]
	fsrc2	%f14,	%f30
	lduw	[%l7 + 0x08],	%o5
	sir	0x0D91
	movn	%xcc,	%l2,	%g3
	ldd	[%l7 + 0x40],	%o6
	movrlz	%g2,	%o2,	%i5
	xor	%l1,	0x1EC3,	%l0
	movcs	%xcc,	%g4,	%g1
	array16	%l3,	%l5,	%g6
	fmovde	%xcc,	%f5,	%f28
	fmovsneg	%icc,	%f2,	%f5
	fnors	%f15,	%f22,	%f6
	fcmpes	%fcc2,	%f31,	%f23
	edge32	%i1,	%i7,	%o6
	xnorcc	%i6,	%o1,	%o3
	movcc	%xcc,	%l4,	%i4
	ldx	[%l7 + 0x40],	%o4
	movcs	%xcc,	%i0,	%i3
	fmovrsgz	%g5,	%f10,	%f10
	movrgez	%i2,	%l6,	%g7
	stb	%o5,	[%l7 + 0x72]
	alignaddr	%o0,	%l2,	%o7
	edge8l	%g2,	%o2,	%i5
	srax	%g3,	%l0,	%g4
	fmovsgu	%xcc,	%f24,	%f30
	subc	%g1,	0x1163,	%l1
	fsrc2	%f26,	%f28
	edge8	%l3,	%l5,	%i1
	sethi	0x14E0,	%i7
	movrlez	%g6,	%o6,	%o1
	movne	%xcc,	%i6,	%o3
	movpos	%icc,	%i4,	%o4
	andcc	%i0,	0x0F73,	%i3
	edge8l	%g5,	%l4,	%i2
	popc	%l6,	%o5
	array8	%g7,	%o0,	%o7
	orncc	%l2,	0x1AFD,	%g2
	xnor	%o2,	%i5,	%l0
	and	%g4,	%g3,	%g1
	fornot1	%f18,	%f24,	%f0
	edge16ln	%l1,	%l3,	%i1
	fmovsa	%icc,	%f23,	%f7
	sdiv	%l5,	0x0F16,	%g6
	stx	%i7,	[%l7 + 0x30]
	std	%f28,	[%l7 + 0x78]
	ld	[%l7 + 0x40],	%f20
	movpos	%icc,	%o1,	%o6
	mulx	%i6,	%o3,	%i4
	fxnor	%f10,	%f12,	%f24
	edge16l	%i0,	%o4,	%g5
	save %l4, %i3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o5,	%g7,	%o0
	fmovspos	%icc,	%f17,	%f26
	movcs	%icc,	%i2,	%l2
	array8	%g2,	%o2,	%i5
	fand	%f30,	%f14,	%f14
	andncc	%o7,	%l0,	%g4
	smul	%g3,	0x0CE1,	%l1
	udivcc	%l3,	0x0C41,	%g1
	ld	[%l7 + 0x74],	%f24
	sth	%l5,	[%l7 + 0x60]
	srl	%g6,	0x14,	%i7
	subcc	%o1,	0x0FC7,	%i1
	fmovrde	%i6,	%f28,	%f14
	movvc	%xcc,	%o6,	%o3
	ldub	[%l7 + 0x55],	%i4
	fmovrdne	%i0,	%f10,	%f26
	andn	%g5,	%o4,	%i3
	edge32n	%l6,	%o5,	%g7
	movle	%icc,	%o0,	%l4
	edge32n	%l2,	%g2,	%i2
	movgu	%xcc,	%o2,	%i5
	array32	%o7,	%l0,	%g3
	alignaddr	%g4,	%l3,	%l1
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	ldsh	[%l7 + 0x3E],	%o1
	array32	%i1,	%i6,	%o6
	fmovsa	%xcc,	%f20,	%f18
	fpmerge	%f23,	%f11,	%f30
	fnors	%f23,	%f15,	%f27
	fpadd16s	%f6,	%f20,	%f23
	movrlez	%g6,	%o3,	%i4
	fnot1s	%f24,	%f15
	fzero	%f18
	movl	%xcc,	%i0,	%o4
	addcc	%i3,	0x0947,	%g5
	sll	%o5,	%l6,	%g7
	sub	%o0,	0x05A7,	%l4
	movrgez	%g2,	%i2,	%l2
	edge8l	%i5,	%o7,	%o2
	subcc	%g3,	%g4,	%l3
	subc	%l0,	0x1B7F,	%l5
	fandnot1	%f4,	%f10,	%f30
	fmovrsne	%g1,	%f20,	%f27
	sth	%l1,	[%l7 + 0x3C]
	fmovrdgz	%o1,	%f4,	%f6
	ldd	[%l7 + 0x20],	%i0
	movne	%icc,	%i7,	%i6
	movn	%xcc,	%o6,	%g6
	edge8l	%o3,	%i0,	%i4
	lduh	[%l7 + 0x60],	%o4
	ldsb	[%l7 + 0x13],	%g5
	edge8l	%i3,	%o5,	%g7
	stw	%o0,	[%l7 + 0x18]
	fmovrde	%l4,	%f6,	%f0
	fmovsg	%icc,	%f13,	%f17
	and	%g2,	0x1FCD,	%i2
	fcmple16	%f16,	%f30,	%l2
	sllx	%i5,	0x00,	%l6
	array8	%o2,	%o7,	%g3
	movg	%icc,	%g4,	%l0
	or	%l5,	0x11AE,	%l3
	addc	%g1,	%l1,	%o1
	ldsh	[%l7 + 0x0A],	%i7
	fandnot2s	%f12,	%f16,	%f4
	fsrc2	%f30,	%f28
	bshuffle	%f22,	%f20,	%f12
	ldx	[%l7 + 0x78],	%i1
	umul	%o6,	0x1654,	%g6
	stw	%i6,	[%l7 + 0x20]
	fnegd	%f18,	%f30
	fcmped	%fcc2,	%f30,	%f30
	addccc	%i0,	%o3,	%i4
	sethi	0x0EC9,	%g5
	restore %o4, %o5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x68, %o1
	stw	%o0,	[%l7 + %o1]
	edge8	%l4,	%g2,	%g7
	addccc	%i2,	0x0AE9,	%i5
	fmovspos	%xcc,	%f31,	%f26
	movrlez	%l6,	%o2,	%l2
	ldsb	[%l7 + 0x71],	%o7
	fxnors	%f18,	%f31,	%f27
	ldsh	[%l7 + 0x52],	%g4
	edge32ln	%g3,	%l0,	%l3
	sdivcc	%g1,	0x00E4,	%l5
	popc	0x01E5,	%o1
	fcmpd	%fcc3,	%f6,	%f6
	addcc	%l1,	%i7,	%o6
	srlx	%g6,	0x04,	%i1
	umulcc	%i6,	%o3,	%i4
	fnand	%f24,	%f0,	%f14
	andn	%i0,	%o4,	%o5
	fcmped	%fcc3,	%f10,	%f18
	fmul8ulx16	%f20,	%f28,	%f6
	edge32l	%g5,	%i3,	%l4
	udiv	%o0,	0x0B74,	%g7
	ldsb	[%l7 + 0x7A],	%i2
	movpos	%icc,	%i5,	%g2
	sub	%l6,	%o2,	%o7
	ldub	[%l7 + 0x22],	%g4
	sllx	%g3,	%l2,	%l0
	st	%f6,	[%l7 + 0x40]
	fnegs	%f0,	%f10
	fpackfix	%f8,	%f9
	edge32l	%g1,	%l3,	%o1
	subcc	%l1,	%l5,	%i7
	smulcc	%o6,	%g6,	%i1
	fcmpgt16	%f10,	%f30,	%i6
	fmovrdlez	%o3,	%f12,	%f26
	movpos	%xcc,	%i4,	%o4
	fands	%f19,	%f31,	%f6
	xnor	%o5,	0x1987,	%g5
	stx	%i3,	[%l7 + 0x30]
	fornot1	%f22,	%f26,	%f2
	or	%i0,	0x101F,	%l4
	smulcc	%g7,	%i2,	%i5
	udivx	%o0,	0x0191,	%g2
	umulcc	%l6,	0x097E,	%o7
	srlx	%g4,	%g3,	%l2
	andn	%l0,	0x05B0,	%o2
	movvc	%xcc,	%l3,	%g1
	stx	%o1,	[%l7 + 0x68]
	fmovrdlez	%l1,	%f0,	%f6
	fandnot2	%f18,	%f4,	%f6
	andn	%i7,	0x19BD,	%o6
	fmovrdgz	%g6,	%f16,	%f22
	mulscc	%i1,	0x01E1,	%i6
	movvs	%xcc,	%l5,	%i4
	srlx	%o4,	0x1B,	%o3
	subccc	%g5,	0x1A83,	%o5
	edge8ln	%i0,	%l4,	%g7
	xorcc	%i2,	0x08FB,	%i3
	xor	%o0,	0x00DF,	%i5
	ldsw	[%l7 + 0x3C],	%g2
	fpmerge	%f31,	%f0,	%f4
	fpack32	%f10,	%f24,	%f10
	edge32ln	%o7,	%l6,	%g4
	movn	%icc,	%l2,	%l0
	sdivx	%o2,	0x10D0,	%g3
	fcmps	%fcc0,	%f20,	%f8
	sub	%l3,	%g1,	%l1
	sra	%o1,	0x16,	%i7
	fcmpeq16	%f4,	%f2,	%g6
	movrgez	%i1,	%o6,	%i6
	movrgez	%i4,	0x2A8,	%o4
	umul	%l5,	0x0CCF,	%g5
	movne	%icc,	%o3,	%o5
	subccc	%i0,	%g7,	%i2
	movn	%xcc,	%i3,	%l4
	fone	%f16
	ldd	[%l7 + 0x48],	%o0
	fmovdleu	%xcc,	%f4,	%f14
	movcc	%icc,	%i5,	%o7
	udivx	%l6,	0x1107,	%g4
	udiv	%g2,	0x1C5A,	%l0
	stb	%l2,	[%l7 + 0x13]
	fones	%f13
	subcc	%o2,	%l3,	%g3
	fmovsa	%xcc,	%f26,	%f19
	movn	%icc,	%g1,	%o1
	fpadd32s	%f13,	%f6,	%f25
	array32	%l1,	%i7,	%i1
	fcmpgt32	%f28,	%f8,	%g6
	edge32	%i6,	%o6,	%o4
	andn	%i4,	%g5,	%o3
	add	%o5,	0x1CDE,	%i0
	fnor	%f28,	%f0,	%f4
	sdivx	%g7,	0x07EC,	%i2
	udiv	%i3,	0x0F94,	%l5
	fmovdl	%xcc,	%f11,	%f16
	movre	%l4,	%i5,	%o7
	fmovdgu	%xcc,	%f15,	%f14
	fcmps	%fcc1,	%f19,	%f12
	edge8	%o0,	%g4,	%l6
	movcc	%icc,	%l0,	%g2
	movneg	%icc,	%l2,	%l3
	fmovsn	%xcc,	%f0,	%f3
	edge8n	%o2,	%g3,	%g1
	udiv	%l1,	0x0A09,	%o1
	sub	%i1,	%i7,	%i6
	andncc	%o6,	%o4,	%g6
	sir	0x15F7
	srl	%i4,	%g5,	%o3
	fmovsle	%icc,	%f5,	%f26
	edge32ln	%i0,	%o5,	%i2
	sdiv	%g7,	0x0A77,	%i3
	edge16ln	%l5,	%l4,	%o7
	edge8n	%i5,	%g4,	%l6
	fmovsvs	%icc,	%f4,	%f20
	movge	%icc,	%l0,	%o0
	fmovscs	%xcc,	%f2,	%f8
	save %l2, %l3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f7,	%f28
	stb	%g2,	[%l7 + 0x34]
	edge8ln	%g1,	%g3,	%l1
	movpos	%xcc,	%i1,	%o1
	ldub	[%l7 + 0x08],	%i6
	edge32l	%i7,	%o6,	%o4
	ld	[%l7 + 0x64],	%f30
	sra	%i4,	0x09,	%g6
	edge32ln	%g5,	%o3,	%i0
	fcmple16	%f20,	%f20,	%i2
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	movrlez	%l5,	%o5,	%l4
	movn	%icc,	%o7,	%g4
	movn	%icc,	%i5,	%l6
	fcmple16	%f24,	%f16,	%o0
	movpos	%icc,	%l2,	%l3
	edge8	%o2,	%l0,	%g1
	fcmpeq32	%f14,	%f14,	%g3
	fmul8ulx16	%f26,	%f12,	%f6
	stx	%g2,	[%l7 + 0x20]
	srl	%l1,	%i1,	%o1
	fone	%f2
	fnot2	%f30,	%f14
	movvs	%icc,	%i7,	%o6
	movrlez	%o4,	%i4,	%i6
	movrne	%g5,	%g6,	%o3
	edge8n	%i2,	%i0,	%g7
	fors	%f2,	%f28,	%f2
	lduw	[%l7 + 0x1C],	%i3
	smul	%o5,	%l5,	%o7
	udivx	%g4,	0x1538,	%i5
	ldsb	[%l7 + 0x3A],	%l6
	ld	[%l7 + 0x50],	%f7
	sll	%l4,	0x1D,	%l2
	movn	%icc,	%l3,	%o0
	addcc	%o2,	%g1,	%g3
	edge16n	%g2,	%l1,	%i1
	xor	%o1,	%l0,	%o6
	andncc	%i7,	%i4,	%o4
	fmovsneg	%xcc,	%f14,	%f9
	fcmpne16	%f8,	%f26,	%i6
	sdivcc	%g6,	0x0E6F,	%g5
	lduw	[%l7 + 0x10],	%i2
	sdivcc	%o3,	0x0C26,	%g7
	subc	%i0,	0x1079,	%o5
	edge8ln	%i3,	%o7,	%l5
	edge16n	%g4,	%i5,	%l4
	ldd	[%l7 + 0x78],	%i6
	movleu	%xcc,	%l3,	%o0
	edge16n	%o2,	%l2,	%g3
	lduh	[%l7 + 0x0C],	%g1
	ldsw	[%l7 + 0x0C],	%l1
	ldsh	[%l7 + 0x68],	%g2
	movcc	%xcc,	%i1,	%l0
	movpos	%icc,	%o6,	%i7
	ldd	[%l7 + 0x48],	%o0
	andn	%o4,	%i6,	%g6
	umul	%i4,	%g5,	%i2
	alignaddrl	%g7,	%o3,	%o5
	movrlez	%i3,	%o7,	%i0
	movvs	%xcc,	%g4,	%l5
	fcmple16	%f22,	%f14,	%i5
	add	%l6,	0x09E8,	%l4
	ldd	[%l7 + 0x40],	%o0
	fmovscc	%xcc,	%f5,	%f26
	ldx	[%l7 + 0x28],	%o2
	movrlez	%l3,	0x3DD,	%g3
	andcc	%g1,	%l2,	%g2
	edge8n	%l1,	%l0,	%o6
	edge8n	%i7,	%o1,	%o4
	lduh	[%l7 + 0x4A],	%i1
	fpack32	%f8,	%f28,	%f2
	xnorcc	%i6,	0x1AF7,	%g6
	edge16	%g5,	%i4,	%i2
	fnot1s	%f9,	%f16
	stb	%g7,	[%l7 + 0x44]
	addc	%o3,	%o5,	%i3
	sethi	0x124E,	%o7
	sethi	0x05B5,	%g4
	edge8ln	%l5,	%i5,	%l6
	move	%icc,	%i0,	%o0
	fmovrdne	%l4,	%f8,	%f22
	subc	%o2,	%g3,	%g1
	ldsh	[%l7 + 0x18],	%l2
	fmovsg	%icc,	%f13,	%f10
	fmovda	%xcc,	%f21,	%f4
	fmovde	%xcc,	%f29,	%f19
	nop
	set	0x78, %o3
	stw	%g2,	[%l7 + %o3]
	fabsd	%f18,	%f10
	sth	%l1,	[%l7 + 0x22]
	st	%f15,	[%l7 + 0x64]
	ldd	[%l7 + 0x10],	%l0
	fmovrsgez	%l3,	%f0,	%f26
	umul	%i7,	0x0510,	%o1
	fand	%f0,	%f2,	%f6
	fnor	%f14,	%f20,	%f12
	sll	%o4,	0x09,	%o6
	edge8l	%i6,	%g6,	%g5
	movpos	%xcc,	%i4,	%i1
	andncc	%i2,	%g7,	%o5
	xor	%o3,	%o7,	%g4
	stw	%i3,	[%l7 + 0x48]
	fxors	%f4,	%f11,	%f9
	fpadd16s	%f23,	%f17,	%f14
	fmovrdne	%i5,	%f12,	%f12
	udivcc	%l6,	0x1997,	%i0
	ldub	[%l7 + 0x0A],	%l5
	andcc	%l4,	%o2,	%o0
	stw	%g1,	[%l7 + 0x6C]
	movrgz	%g3,	0x021,	%l2
	popc	%l1,	%l0
	fmovde	%xcc,	%f13,	%f5
	movrlez	%g2,	%l3,	%i7
	fmovrde	%o4,	%f22,	%f26
	mova	%icc,	%o6,	%o1
	edge8n	%i6,	%g5,	%g6
	add	%i4,	0x1069,	%i2
	fmul8x16au	%f22,	%f6,	%f16
	fpadd32	%f6,	%f8,	%f18
	sll	%g7,	%o5,	%i1
	fmovdvs	%icc,	%f13,	%f15
	subcc	%o7,	%g4,	%o3
	fcmpeq16	%f14,	%f28,	%i5
	sdiv	%i3,	0x037C,	%i0
	umul	%l5,	0x1480,	%l6
	popc	0x1E57,	%o2
	fmul8x16al	%f22,	%f6,	%f16
	and	%o0,	%l4,	%g3
	movrgez	%g1,	%l2,	%l0
	xnorcc	%l1,	0x1109,	%g2
	ldd	[%l7 + 0x30],	%f28
	fsrc1s	%f14,	%f18
	array32	%i7,	%o4,	%l3
	edge8ln	%o1,	%i6,	%o6
	fxnor	%f14,	%f22,	%f22
	stb	%g5,	[%l7 + 0x38]
	fcmpgt32	%f24,	%f26,	%g6
	fmovspos	%icc,	%f19,	%f22
	ldsw	[%l7 + 0x60],	%i4
	fmovrde	%i2,	%f18,	%f22
	movle	%xcc,	%o5,	%g7
	edge8l	%i1,	%o7,	%g4
	bshuffle	%f26,	%f18,	%f30
	add	%o3,	0x150B,	%i5
	edge16ln	%i3,	%i0,	%l5
	movleu	%xcc,	%o2,	%l6
	addccc	%o0,	0x17AF,	%g3
	movg	%icc,	%l4,	%l2
	edge8n	%l0,	%g1,	%l1
	mulscc	%i7,	%o4,	%l3
	srax	%g2,	%i6,	%o1
	movre	%o6,	0x254,	%g5
	stw	%g6,	[%l7 + 0x54]
	udiv	%i2,	0x1369,	%o5
	fors	%f4,	%f25,	%f14
	addcc	%i4,	0x08D1,	%g7
	movge	%icc,	%i1,	%o7
	fsrc1s	%f8,	%f14
	orncc	%g4,	0x0B09,	%i5
	andcc	%o3,	0x14B4,	%i0
	mulscc	%i3,	0x00B9,	%l5
	edge8	%o2,	%o0,	%g3
	xorcc	%l4,	%l2,	%l6
	fmovdle	%xcc,	%f29,	%f16
	movneg	%xcc,	%g1,	%l1
	ldsh	[%l7 + 0x22],	%i7
	restore %l0, %o4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l3,	%o1,	%i6
	fnot1	%f30,	%f16
	fpack16	%f8,	%f22
	movn	%xcc,	%o6,	%g6
	stx	%i2,	[%l7 + 0x70]
	movcs	%icc,	%o5,	%i4
	ldx	[%l7 + 0x30],	%g7
	fpadd16s	%f23,	%f1,	%f29
	fmovdn	%xcc,	%f6,	%f25
	edge8l	%i1,	%g5,	%g4
	movrlz	%i5,	0x3B9,	%o7
	ldd	[%l7 + 0x48],	%o2
	sllx	%i3,	0x15,	%i0
	fnot1	%f22,	%f0
	mulscc	%o2,	%l5,	%o0
	edge16l	%l4,	%g3,	%l2
	st	%f23,	[%l7 + 0x54]
	edge8l	%l6,	%l1,	%i7
	and	%g1,	0x0566,	%o4
	andncc	%l0,	%g2,	%l3
	fandnot1s	%f29,	%f15,	%f8
	sir	0x05D4
	sub	%i6,	%o1,	%g6
	fmovrslz	%o6,	%f8,	%f30
	edge32n	%o5,	%i4,	%g7
	ldsw	[%l7 + 0x0C],	%i1
	andcc	%g5,	%g4,	%i2
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	fmovsgu	%xcc,	%f25,	%f24
	udivcc	%o7,	0x0F9E,	%i0
	edge32l	%i3,	%l5,	%o2
	edge16n	%o0,	%l4,	%g3
	fand	%f8,	%f8,	%f20
	lduh	[%l7 + 0x7A],	%l2
	fmovdneg	%xcc,	%f10,	%f16
	edge32ln	%l6,	%i7,	%l1
	for	%f30,	%f22,	%f24
	fmuld8sux16	%f0,	%f20,	%f16
	xnorcc	%g1,	0x177C,	%o4
	umul	%l0,	0x1287,	%g2
	andncc	%l3,	%o1,	%i6
	xor	%g6,	0x0B0C,	%o5
	fmovscs	%xcc,	%f15,	%f20
	fmovsneg	%xcc,	%f28,	%f3
	nop
	set	0x24, %i7
	lduw	[%l7 + %i7],	%o6
	nop
	set	0x50, %g2
	ldd	[%l7 + %g2],	%f0
	andncc	%g7,	%i1,	%g5
	movre	%g4,	0x213,	%i2
	sdiv	%i5,	0x1B22,	%i4
	mova	%icc,	%o7,	%o3
	subc	%i0,	%l5,	%o2
	stw	%i3,	[%l7 + 0x30]
	srlx	%o0,	0x06,	%g3
	fcmple16	%f6,	%f6,	%l4
	orncc	%l6,	%l2,	%l1
	movcs	%icc,	%g1,	%i7
	subccc	%l0,	%o4,	%g2
	orncc	%o1,	0x0CAD,	%l3
	movrne	%i6,	0x0EA,	%g6
	movleu	%xcc,	%o5,	%g7
	sdivcc	%o6,	0x1FEF,	%g5
	movvs	%xcc,	%g4,	%i1
	sllx	%i2,	0x1C,	%i5
	fcmpeq32	%f24,	%f16,	%o7
	srl	%o3,	%i0,	%l5
	fand	%f6,	%f6,	%f26
	ldsh	[%l7 + 0x6C],	%i4
	move	%icc,	%i3,	%o0
	movvc	%icc,	%g3,	%l4
	andcc	%l6,	0x01AE,	%l2
	alignaddr	%l1,	%o2,	%i7
	stw	%g1,	[%l7 + 0x50]
	ldsb	[%l7 + 0x0E],	%o4
	sir	0x1F9D
	edge32l	%l0,	%o1,	%l3
	fmovsge	%xcc,	%f14,	%f14
	lduh	[%l7 + 0x64],	%i6
	fsrc2s	%f28,	%f24
	ldd	[%l7 + 0x10],	%g2
	fexpand	%f17,	%f6
	alignaddr	%o5,	%g7,	%o6
	popc	0x1675,	%g6
	fmul8x16al	%f25,	%f22,	%f12
	srl	%g5,	%i1,	%g4
	edge32l	%i2,	%o7,	%i5
	orcc	%o3,	%l5,	%i4
	ldsb	[%l7 + 0x78],	%i0
	movle	%icc,	%i3,	%g3
	fmovspos	%icc,	%f29,	%f6
	edge32n	%o0,	%l6,	%l2
	st	%f14,	[%l7 + 0x5C]
	movle	%icc,	%l4,	%o2
	movgu	%icc,	%i7,	%g1
	ldub	[%l7 + 0x51],	%l1
	alignaddrl	%l0,	%o4,	%o1
	fpsub16s	%f5,	%f9,	%f26
	and	%l3,	0x144B,	%i6
	fmovdneg	%icc,	%f25,	%f27
	orn	%g2,	0x130D,	%g7
	edge32n	%o6,	%o5,	%g5
	alignaddrl	%i1,	%g4,	%g6
	fmovscc	%xcc,	%f23,	%f23
	mulscc	%o7,	%i2,	%o3
	fnot1s	%f29,	%f27
	save %l5, %i5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i3,	%g3,	%o0
	edge8ln	%i4,	%l2,	%l6
	srax	%l4,	%o2,	%i7
	mulscc	%l1,	%l0,	%o4
	restore %g1, 0x0F78, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i6,	0x1AFD,	%l3
	movrgz	%g7,	%o6,	%o5
	movg	%icc,	%g2,	%i1
	sethi	0x0C1D,	%g4
	move	%icc,	%g5,	%o7
	addcc	%g6,	0x0403,	%o3
	movne	%icc,	%l5,	%i2
	sth	%i5,	[%l7 + 0x34]
	fand	%f14,	%f28,	%f14
	fsrc1	%f16,	%f22
	ldsb	[%l7 + 0x5E],	%i3
	std	%f10,	[%l7 + 0x20]
	movrlez	%i0,	%o0,	%i4
	edge8ln	%l2,	%g3,	%l4
	edge8n	%o2,	%l6,	%l1
	fnot1	%f30,	%f28
	fsrc2	%f6,	%f24
	fxor	%f28,	%f4,	%f4
	movgu	%icc,	%i7,	%o4
	ldsb	[%l7 + 0x4B],	%l0
	stw	%o1,	[%l7 + 0x08]
	addc	%i6,	%g1,	%g7
	fornot1s	%f20,	%f30,	%f1
	movre	%o6,	0x1C1,	%l3
	umulcc	%g2,	%o5,	%i1
	fmovde	%xcc,	%f24,	%f13
	fmul8x16	%f23,	%f24,	%f2
	sdiv	%g5,	0x0C59,	%g4
	edge8ln	%o7,	%o3,	%g6
	andcc	%i2,	0x1571,	%l5
	edge32ln	%i3,	%i0,	%i5
	subcc	%o0,	0x140C,	%i4
	smul	%l2,	%g3,	%l4
	ldsh	[%l7 + 0x36],	%o2
	faligndata	%f30,	%f20,	%f14
	stx	%l1,	[%l7 + 0x48]
	smul	%l6,	0x1B40,	%i7
	movn	%xcc,	%o4,	%l0
	sll	%o1,	0x14,	%g1
	edge16l	%g7,	%i6,	%l3
	fmovsvc	%icc,	%f1,	%f5
	ld	[%l7 + 0x50],	%f22
	movrne	%o6,	%g2,	%o5
	fpsub16s	%f18,	%f4,	%f25
	udiv	%g5,	0x0622,	%g4
	fand	%f22,	%f0,	%f26
	sllx	%o7,	0x10,	%i1
	fsrc1s	%f19,	%f9
	array32	%g6,	%i2,	%o3
	movrne	%l5,	0x2D6,	%i3
	add	%i5,	%i0,	%i4
	alignaddr	%l2,	%o0,	%g3
	movrgez	%o2,	0x29B,	%l1
	edge32l	%l6,	%i7,	%o4
	fors	%f31,	%f27,	%f11
	lduh	[%l7 + 0x50],	%l0
	fmovrdne	%o1,	%f12,	%f0
	fmuld8sux16	%f26,	%f11,	%f28
	udivcc	%l4,	0x008A,	%g7
	edge16	%g1,	%i6,	%l3
	movrgz	%o6,	0x328,	%g2
	edge16l	%o5,	%g5,	%g4
	sdivcc	%i1,	0x0408,	%g6
	andncc	%o7,	%o3,	%i2
	alignaddrl	%i3,	%l5,	%i5
	smulcc	%i4,	0x1EBE,	%l2
	movneg	%xcc,	%i0,	%g3
	mulx	%o2,	0x1E5B,	%o0
	edge16n	%l6,	%i7,	%o4
	fmuld8sux16	%f16,	%f15,	%f8
	bshuffle	%f12,	%f22,	%f2
	save %l1, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x68],	%f6
	movneg	%xcc,	%l0,	%g1
	popc	%g7,	%i6
	edge32	%o6,	%g2,	%o5
	fandnot2	%f6,	%f20,	%f18
	xnor	%l3,	0x0A5C,	%g5
	fmovdpos	%xcc,	%f21,	%f28
	edge32l	%g4,	%i1,	%g6
	srax	%o7,	%o3,	%i2
	ldd	[%l7 + 0x58],	%l4
	fmovdge	%icc,	%f17,	%f31
	movrlz	%i3,	0x2DB,	%i5
	save %l2, 0x1B4B, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g3,	%i4,	%o2
	ldub	[%l7 + 0x44],	%l6
	udiv	%o0,	0x0687,	%o4
	movleu	%icc,	%i7,	%l1
	sllx	%l4,	%o1,	%l0
	edge8n	%g1,	%g7,	%o6
	edge16l	%i6,	%o5,	%g2
	sir	0x1F03
	sethi	0x0A05,	%g5
	mulscc	%l3,	%g4,	%g6
	fmovsneg	%xcc,	%f28,	%f26
	udivcc	%o7,	0x113B,	%i1
	lduh	[%l7 + 0x60],	%o3
	sth	%i2,	[%l7 + 0x0A]
	movre	%i3,	%l5,	%i5
	addc	%i0,	0x1947,	%g3
	andncc	%i4,	%o2,	%l6
	movneg	%xcc,	%o0,	%l2
	fand	%f28,	%f20,	%f0
	alignaddrl	%i7,	%l1,	%o4
	nop
	set	0x20, %g3
	std	%f12,	[%l7 + %g3]
	addcc	%o1,	0x017C,	%l0
	sethi	0x02B3,	%g1
	nop
	set	0x20, %l3
	ldd	[%l7 + %l3],	%l4
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	fornot2	%f20,	%f4,	%f16
	sethi	0x01FF,	%g7
	subccc	%o5,	0x0D66,	%g2
	edge16n	%g5,	%g4,	%l3
	udiv	%o7,	0x1074,	%g6
	edge8n	%i1,	%o3,	%i2
	fmovsle	%xcc,	%f12,	%f27
	edge32	%l5,	%i5,	%i0
	movpos	%xcc,	%g3,	%i4
	fmovdl	%icc,	%f28,	%f7
	fmovrdgz	%i3,	%f26,	%f20
	fmovscc	%icc,	%f0,	%f0
	movrgez	%l6,	0x2B3,	%o2
	st	%f31,	[%l7 + 0x7C]
	fmovdleu	%icc,	%f26,	%f6
	edge16l	%o0,	%i7,	%l1
	addcc	%l2,	0x0ACE,	%o4
	lduw	[%l7 + 0x70],	%l0
	fmovrslez	%g1,	%f7,	%f3
	sir	0x1F08
	sllx	%l4,	%o6,	%o1
	stb	%i6,	[%l7 + 0x20]
	std	%f26,	[%l7 + 0x70]
	edge32n	%o5,	%g7,	%g5
	fmovrdgz	%g4,	%f6,	%f2
	lduw	[%l7 + 0x64],	%g2
	fmovsne	%icc,	%f0,	%f6
	andcc	%l3,	0x1556,	%g6
	fnot1	%f10,	%f12
	movrgez	%i1,	%o3,	%o7
	edge32ln	%i2,	%i5,	%l5
	edge32ln	%i0,	%g3,	%i4
	movcs	%icc,	%l6,	%o2
	xor	%o0,	0x069C,	%i3
	fcmps	%fcc2,	%f15,	%f3
	fnor	%f12,	%f8,	%f0
	ldsb	[%l7 + 0x3A],	%i7
	orn	%l2,	0x084C,	%l1
	movpos	%icc,	%l0,	%o4
	fmovsne	%xcc,	%f15,	%f7
	edge8	%l4,	%o6,	%o1
	ldsb	[%l7 + 0x65],	%i6
	ldd	[%l7 + 0x08],	%g0
	fmovscs	%icc,	%f14,	%f13
	addc	%o5,	%g5,	%g4
	edge32n	%g2,	%l3,	%g6
	movg	%xcc,	%g7,	%i1
	movleu	%icc,	%o7,	%o3
	edge32n	%i5,	%l5,	%i2
	movre	%g3,	%i0,	%l6
	orcc	%i4,	0x0F74,	%o0
	xor	%o2,	0x0198,	%i7
	smul	%l2,	%i3,	%l1
	movre	%l0,	%o4,	%l4
	fornot1s	%f23,	%f17,	%f11
	mulscc	%o6,	0x034A,	%i6
	edge16l	%o1,	%g1,	%g5
	sdivx	%g4,	0x0F37,	%o5
	movrlz	%l3,	%g2,	%g7
	array32	%i1,	%g6,	%o7
	movvc	%xcc,	%o3,	%l5
	edge32n	%i5,	%g3,	%i2
	add	%l6,	0x1157,	%i4
	xnor	%i0,	%o2,	%i7
	fcmped	%fcc2,	%f24,	%f0
	or	%o0,	%i3,	%l2
	fzero	%f18
	orn	%l0,	%l1,	%l4
	fmovdne	%icc,	%f22,	%f29
	stw	%o6,	[%l7 + 0x4C]
	edge32n	%i6,	%o1,	%o4
	fmovsn	%xcc,	%f25,	%f11
	sub	%g5,	%g4,	%g1
	restore %l3, %o5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i1,	%g6,	%g7
	save %o3, %l5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%g3,	%i5
	nop
	set	0x68, %l4
	std	%f2,	[%l7 + %l4]
	addccc	%l6,	0x0646,	%i2
	fnands	%f23,	%f4,	%f31
	edge16l	%i0,	%o2,	%i4
	fpsub32s	%f0,	%f31,	%f23
	sdiv	%i7,	0x0C61,	%o0
	ldsb	[%l7 + 0x1F],	%l2
	srl	%i3,	0x02,	%l0
	edge8	%l1,	%o6,	%l4
	bshuffle	%f26,	%f10,	%f26
	andcc	%i6,	%o1,	%g5
	smul	%o4,	0x1818,	%g4
	fmovde	%xcc,	%f13,	%f21
	mulx	%g1,	%o5,	%l3
	fnor	%f4,	%f12,	%f8
	movne	%icc,	%i1,	%g2
	fpack32	%f12,	%f12,	%f14
	movle	%icc,	%g6,	%g7
	movleu	%icc,	%o3,	%l5
	movre	%g3,	0x3EF,	%o7
	smulcc	%l6,	%i2,	%i0
	sethi	0x1AE4,	%o2
	fmovrdgez	%i5,	%f24,	%f4
	edge32l	%i4,	%o0,	%l2
	fpadd32s	%f23,	%f31,	%f8
	subcc	%i3,	0x1FC1,	%i7
	movleu	%xcc,	%l0,	%l1
	subcc	%o6,	%i6,	%o1
	fnand	%f22,	%f0,	%f6
	stb	%g5,	[%l7 + 0x73]
	ld	[%l7 + 0x58],	%f22
	sra	%l4,	%g4,	%o4
	alignaddrl	%o5,	%g1,	%l3
	xnor	%i1,	%g6,	%g2
	fmovrdne	%g7,	%f26,	%f30
	andn	%l5,	%o3,	%o7
	fmul8x16au	%f0,	%f16,	%f18
	udivcc	%l6,	0x1C66,	%i2
	edge32l	%g3,	%i0,	%o2
	subc	%i5,	%o0,	%i4
	faligndata	%f12,	%f4,	%f18
	fmul8sux16	%f16,	%f26,	%f24
	fmovda	%xcc,	%f18,	%f31
	xnor	%l2,	%i3,	%l0
	fmovdn	%xcc,	%f28,	%f16
	fmul8x16	%f18,	%f4,	%f18
	umul	%i7,	0x0015,	%l1
	sdivx	%i6,	0x02B1,	%o1
	ldsw	[%l7 + 0x74],	%o6
	edge8l	%g5,	%l4,	%g4
	alignaddrl	%o5,	%o4,	%l3
	fmovsvc	%xcc,	%f3,	%f2
	sdivcc	%g1,	0x136F,	%g6
	fmovsneg	%xcc,	%f29,	%f28
	stx	%i1,	[%l7 + 0x48]
	fcmpd	%fcc2,	%f28,	%f26
	umul	%g2,	0x11DB,	%g7
	fnot1s	%f11,	%f1
	fxnor	%f0,	%f18,	%f26
	movvs	%xcc,	%l5,	%o7
	sethi	0x078B,	%o3
	movrgz	%l6,	0x37C,	%i2
	movpos	%icc,	%i0,	%g3
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	fmovda	%xcc,	%f29,	%f13
	fmul8x16al	%f27,	%f1,	%f18
	movg	%icc,	%o0,	%i4
	popc	%l2,	%l0
	sth	%i3,	[%l7 + 0x22]
	movge	%xcc,	%i7,	%l1
	fands	%f17,	%f1,	%f22
	fmovscs	%icc,	%f11,	%f23
	andncc	%o1,	%o6,	%i6
	fnors	%f31,	%f20,	%f6
	stb	%g5,	[%l7 + 0x08]
	edge32ln	%g4,	%l4,	%o5
	edge32ln	%o4,	%g1,	%l3
	edge16	%g6,	%g2,	%i1
	udivcc	%l5,	0x1BA4,	%g7
	movrne	%o7,	0x30A,	%o3
	xorcc	%l6,	%i2,	%g3
	sdiv	%i0,	0x0971,	%i5
	sir	0x1DCA
	fpadd16	%f26,	%f30,	%f6
	movrgez	%o2,	%o0,	%i4
	mova	%xcc,	%l0,	%l2
	edge16l	%i3,	%l1,	%i7
	fnot2	%f24,	%f18
	orn	%o6,	%o1,	%g5
	stb	%g4,	[%l7 + 0x75]
	array32	%i6,	%l4,	%o4
	edge16n	%g1,	%l3,	%o5
	fpsub32s	%f9,	%f7,	%f28
	sethi	0x093E,	%g2
	movne	%xcc,	%i1,	%g6
	movge	%icc,	%g7,	%o7
	fnot1	%f6,	%f14
	udiv	%l5,	0x1000,	%l6
	fmul8x16al	%f9,	%f3,	%f30
	sllx	%i2,	0x12,	%o3
	movge	%xcc,	%g3,	%i0
	alignaddr	%i5,	%o2,	%o0
	nop
	set	0x5C, %i0
	stb	%l0,	[%l7 + %i0]
	umulcc	%l2,	%i4,	%l1
	orcc	%i7,	0x0DA1,	%i3
	movcs	%icc,	%o6,	%o1
	udivx	%g4,	0x178D,	%i6
	movrlez	%l4,	%o4,	%g5
	nop
	set	0x60, %g7
	ldd	[%l7 + %g7],	%f16
	st	%f6,	[%l7 + 0x2C]
	movcc	%xcc,	%g1,	%l3
	movrgz	%o5,	0x3F2,	%g2
	fmovsvc	%icc,	%f0,	%f12
	fmovrslez	%g6,	%f13,	%f31
	fpack32	%f26,	%f28,	%f2
	fmul8ulx16	%f8,	%f26,	%f0
	edge16l	%g7,	%o7,	%i1
	addc	%l5,	%i2,	%o3
	movrlz	%l6,	%i0,	%g3
	movrgez	%o2,	0x10A,	%i5
	addccc	%o0,	%l0,	%l2
	array16	%l1,	%i4,	%i7
	fcmpgt16	%f18,	%f24,	%i3
	lduh	[%l7 + 0x28],	%o1
	andncc	%o6,	%i6,	%g4
	movg	%icc,	%l4,	%g5
	edge8n	%g1,	%l3,	%o5
	stx	%g2,	[%l7 + 0x40]
	movcs	%xcc,	%g6,	%g7
	ld	[%l7 + 0x6C],	%f11
	save %o4, %o7, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i2,	%o3,	%l6
	mulscc	%l5,	%i0,	%g3
	umul	%o2,	0x1B0E,	%o0
	movneg	%icc,	%i5,	%l0
	mova	%xcc,	%l1,	%i4
	edge16	%i7,	%i3,	%o1
	alignaddr	%l2,	%o6,	%g4
	movpos	%icc,	%l4,	%i6
	xor	%g1,	%l3,	%g5
	fpack16	%f26,	%f8
	edge16l	%o5,	%g2,	%g6
	ldub	[%l7 + 0x63],	%o4
	orncc	%g7,	0x1AA0,	%i1
	ldx	[%l7 + 0x70],	%o7
	popc	0x1011,	%o3
	smulcc	%i2,	0x0191,	%l6
	ldx	[%l7 + 0x48],	%i0
	movcc	%xcc,	%g3,	%l5
	edge32n	%o0,	%o2,	%l0
	movgu	%icc,	%l1,	%i5
	srax	%i4,	0x0B,	%i7
	stx	%o1,	[%l7 + 0x60]
	fmovsle	%icc,	%f19,	%f31
	fand	%f18,	%f12,	%f20
	ldd	[%l7 + 0x38],	%f8
	sll	%l2,	%o6,	%g4
	restore %i3, 0x023E, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g1,	%l4
	ldub	[%l7 + 0x12],	%g5
	xnor	%l3,	0x0975,	%o5
	fpsub32s	%f20,	%f22,	%f26
	fsrc2	%f30,	%f4
	fcmpeq16	%f10,	%f24,	%g6
	fornot1	%f30,	%f4,	%f20
	nop
	set	0x64, %i6
	sth	%o4,	[%l7 + %i6]
	andcc	%g7,	0x13F6,	%g2
	faligndata	%f22,	%f16,	%f8
	fpadd16s	%f13,	%f8,	%f25
	subc	%i1,	%o7,	%o3
	lduw	[%l7 + 0x74],	%l6
	nop
	set	0x75, %i3
	stb	%i2,	[%l7 + %i3]
	sll	%g3,	0x02,	%i0
	ldx	[%l7 + 0x58],	%l5
	array32	%o2,	%l0,	%l1
	addcc	%o0,	%i5,	%i7
	fcmpgt32	%f2,	%f22,	%o1
	fmovdvc	%icc,	%f29,	%f0
	ldd	[%l7 + 0x60],	%l2
	array32	%i4,	%o6,	%i3
	movn	%xcc,	%i6,	%g1
	fmovrsne	%g4,	%f8,	%f7
	movneg	%icc,	%l4,	%g5
	addccc	%o5,	%l3,	%g6
	smul	%g7,	%g2,	%i1
	move	%xcc,	%o7,	%o3
	sth	%l6,	[%l7 + 0x44]
	movrgez	%i2,	0x34A,	%o4
	srl	%g3,	0x07,	%i0
	fpadd32	%f24,	%f20,	%f6
	edge32n	%o2,	%l0,	%l5
	srlx	%l1,	0x10,	%o0
	edge32l	%i5,	%o1,	%l2
	edge16l	%i7,	%i4,	%o6
	sdivcc	%i6,	0x004C,	%g1
	array8	%g4,	%l4,	%i3
	alignaddrl	%o5,	%l3,	%g5
	fpadd16s	%f23,	%f11,	%f10
	fornot2s	%f18,	%f25,	%f23
	orncc	%g6,	%g7,	%g2
	mulx	%o7,	0x0F8E,	%i1
	array16	%o3,	%i2,	%l6
	movl	%xcc,	%o4,	%g3
	andn	%o2,	0x1961,	%i0
	xnorcc	%l0,	0x1E0B,	%l1
	movrne	%o0,	%i5,	%l5
	srlx	%o1,	0x05,	%i7
	alignaddrl	%l2,	%o6,	%i4
	orn	%g1,	%g4,	%i6
	move	%icc,	%l4,	%o5
	sll	%l3,	%g5,	%i3
	sdivcc	%g7,	0x17C7,	%g6
	edge8	%g2,	%i1,	%o7
	fmovdl	%xcc,	%f12,	%f27
	fcmped	%fcc1,	%f24,	%f24
	subcc	%o3,	%i2,	%l6
	sra	%g3,	0x07,	%o4
	array8	%o2,	%i0,	%l1
	stx	%l0,	[%l7 + 0x40]
	move	%xcc,	%o0,	%i5
	mulx	%o1,	%l5,	%i7
	fmovdle	%icc,	%f21,	%f22
	ldsb	[%l7 + 0x7C],	%l2
	smulcc	%o6,	0x0C4E,	%i4
	movrlez	%g4,	0x2EF,	%g1
	fmovsg	%icc,	%f0,	%f18
	add	%l4,	%i6,	%l3
	subcc	%o5,	0x18D2,	%i3
	fmovrde	%g5,	%f2,	%f28
	fmovrsgz	%g6,	%f4,	%f1
	mulscc	%g2,	%i1,	%g7
	add	%o7,	0x005C,	%o3
	movn	%icc,	%i2,	%g3
	addccc	%o4,	%o2,	%l6
	fcmpgt32	%f18,	%f0,	%l1
	movl	%icc,	%l0,	%o0
	subccc	%i5,	%o1,	%i0
	addcc	%l5,	%l2,	%i7
	movvs	%icc,	%o6,	%i4
	orn	%g4,	%g1,	%l4
	movl	%icc,	%i6,	%l3
	edge32ln	%o5,	%i3,	%g5
	fmovrdlz	%g2,	%f14,	%f12
	movrlez	%i1,	0x320,	%g6
	fmovdvc	%icc,	%f12,	%f20
	udiv	%o7,	0x0525,	%g7
	movle	%icc,	%o3,	%g3
	andncc	%o4,	%i2,	%l6
	alignaddr	%o2,	%l0,	%o0
	umulcc	%i5,	%o1,	%l1
	edge16n	%i0,	%l5,	%i7
	fmovdcs	%xcc,	%f3,	%f24
	movge	%icc,	%o6,	%l2
	andn	%i4,	0x0C9A,	%g4
	umulcc	%g1,	%i6,	%l4
	subc	%o5,	%l3,	%g5
	movgu	%icc,	%g2,	%i3
	movleu	%xcc,	%i1,	%g6
	addc	%o7,	%o3,	%g3
	nop
	set	0x56, %l0
	stb	%g7,	[%l7 + %l0]
	array16	%o4,	%i2,	%l6
	or	%l0,	0x06C1,	%o2
	sdivx	%o0,	0x0EAD,	%i5
	subcc	%l1,	0x00A6,	%i0
	movg	%xcc,	%o1,	%l5
	smul	%i7,	0x1DF5,	%o6
	edge16	%l2,	%g4,	%i4
	addccc	%g1,	0x022A,	%i6
	orcc	%l4,	%o5,	%l3
	nop
	set	0x68, %l6
	ldx	[%l7 + %l6],	%g5
	movrgz	%i3,	0x2AF,	%i1
	andcc	%g6,	0x08A2,	%o7
	movre	%o3,	%g3,	%g7
	edge16ln	%g2,	%o4,	%i2
	movge	%xcc,	%l6,	%o2
	nop
	set	0x40, %i5
	ldd	[%l7 + %i5],	%f30
	fmovdcc	%icc,	%f28,	%f0
	fmovdpos	%icc,	%f19,	%f27
	fmovsgu	%xcc,	%f19,	%f14
	move	%xcc,	%l0,	%i5
	edge32	%o0,	%i0,	%o1
	ldsh	[%l7 + 0x50],	%l5
	mulx	%l1,	%o6,	%l2
	srax	%g4,	%i4,	%g1
	edge8l	%i6,	%i7,	%l4
	edge8	%o5,	%g5,	%i3
	fnot1	%f8,	%f18
	sdivx	%i1,	0x1629,	%l3
	subcc	%g6,	%o3,	%g3
	udiv	%g7,	0x0E75,	%g2
	edge16	%o4,	%i2,	%l6
	movge	%xcc,	%o2,	%l0
	edge16n	%i5,	%o0,	%i0
	ld	[%l7 + 0x64],	%f19
	subccc	%o7,	0x059E,	%l5
	movle	%xcc,	%l1,	%o1
	edge32l	%l2,	%o6,	%g4
	edge32	%g1,	%i6,	%i7
	smulcc	%l4,	%o5,	%i4
	st	%f18,	[%l7 + 0x48]
	orn	%i3,	0x05EF,	%i1
	movrgez	%g5,	0x341,	%g6
	andn	%o3,	0x1700,	%g3
	edge32ln	%g7,	%g2,	%o4
	sllx	%l3,	%l6,	%i2
	movleu	%xcc,	%l0,	%o2
	fmovse	%xcc,	%f16,	%f4
	save %o0, %i5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i0,	[%l7 + 0x48]
	smul	%l1,	%o1,	%l2
	sll	%o6,	%l5,	%g4
	orcc	%g1,	%i6,	%i7
	udiv	%o5,	0x1263,	%l4
	umul	%i4,	0x013B,	%i1
	fmovsa	%xcc,	%f11,	%f5
	sethi	0x0ECA,	%i3
	movpos	%icc,	%g5,	%g6
	edge16n	%o3,	%g7,	%g3
	ldsw	[%l7 + 0x20],	%g2
	siam	0x1
	mulx	%o4,	0x0955,	%l3
	fands	%f29,	%f13,	%f25
	std	%f22,	[%l7 + 0x68]
	fmovsvc	%xcc,	%f9,	%f29
	edge16	%l6,	%i2,	%l0
	xnor	%o2,	0x0200,	%i5
	fnot2	%f16,	%f14
	move	%icc,	%o0,	%o7
	ldsh	[%l7 + 0x56],	%i0
	movpos	%xcc,	%l1,	%l2
	fnand	%f14,	%f30,	%f22
	sdivx	%o6,	0x1913,	%l5
	popc	%o1,	%g1
	movvc	%xcc,	%g4,	%i7
	fxor	%f14,	%f10,	%f2
	umulcc	%o5,	0x1B2D,	%l4
	fones	%f28
	edge32ln	%i6,	%i4,	%i1
	subccc	%g5,	0x1170,	%g6
	movg	%xcc,	%o3,	%i3
	xorcc	%g3,	0x075C,	%g2
	sll	%o4,	0x06,	%l3
	sll	%g7,	0x1F,	%l6
	movne	%icc,	%l0,	%i2
	mulscc	%i5,	%o2,	%o0
	srlx	%i0,	%o7,	%l1
	subcc	%l2,	0x0529,	%o6
	fcmpeq32	%f28,	%f30,	%o1
	fmovsneg	%icc,	%f28,	%f24
	edge8ln	%l5,	%g4,	%g1
	movcs	%icc,	%i7,	%o5
	fmovdneg	%xcc,	%f9,	%f13
	std	%f8,	[%l7 + 0x38]
	fcmps	%fcc2,	%f18,	%f15
	or	%i6,	0x195D,	%l4
	sdivx	%i4,	0x0284,	%i1
	fmovrsgez	%g5,	%f2,	%f2
	fnot2	%f28,	%f0
	srlx	%o3,	%g6,	%i3
	edge32	%g3,	%g2,	%l3
	move	%xcc,	%o4,	%g7
	move	%icc,	%l6,	%i2
	addccc	%l0,	%i5,	%o2
	subc	%i0,	0x1069,	%o0
	fmovsleu	%xcc,	%f30,	%f7
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	xnorcc	%o1,	0x1CB9,	%o7
	xnorcc	%g4,	0x08B2,	%g1
	movn	%icc,	%i7,	%l5
	stx	%i6,	[%l7 + 0x30]
	umulcc	%l4,	0x1750,	%i4
	sdiv	%o5,	0x0E0D,	%i1
	mulscc	%o3,	%g5,	%i3
	stx	%g3,	[%l7 + 0x48]
	fpackfix	%f24,	%f24
	ldsb	[%l7 + 0x20],	%g6
	edge32ln	%g2,	%o4,	%g7
	or	%l3,	0x1772,	%i2
	movvs	%xcc,	%l6,	%l0
	and	%o2,	%i5,	%o0
	udiv	%i0,	0x010A,	%l1
	fcmpgt32	%f28,	%f26,	%l2
	umul	%o1,	0x0764,	%o7
	fxor	%f14,	%f20,	%f4
	fpadd32	%f28,	%f28,	%f16
	sdivcc	%g4,	0x06F5,	%g1
	array8	%i7,	%l5,	%o6
	edge32l	%l4,	%i6,	%o5
	array32	%i1,	%i4,	%o3
	movrlz	%g5,	0x1DD,	%i3
	fmovsge	%icc,	%f26,	%f28
	movge	%icc,	%g6,	%g2
	fmovsgu	%xcc,	%f16,	%f16
	xorcc	%g3,	%o4,	%g7
	edge8l	%l3,	%i2,	%l6
	fpadd16s	%f6,	%f23,	%f22
	edge32l	%o2,	%i5,	%o0
	ldub	[%l7 + 0x2E],	%l0
	fpadd16	%f6,	%f4,	%f2
	add	%l1,	%l2,	%i0
	edge32n	%o7,	%g4,	%g1
	array32	%i7,	%l5,	%o6
	nop
	set	0x4A, %i4
	ldub	[%l7 + %i4],	%o1
	movrlez	%i6,	%l4,	%o5
	edge16	%i4,	%i1,	%g5
	fpsub16	%f8,	%f30,	%f0
	ld	[%l7 + 0x7C],	%f10
	edge8l	%o3,	%i3,	%g2
	addccc	%g6,	0x1459,	%g3
	fornot1s	%f4,	%f3,	%f17
	movg	%xcc,	%g7,	%o4
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%f26
	move	%xcc,	%l3,	%l6
	fnor	%f10,	%f28,	%f20
	srl	%i2,	%o2,	%o0
	srlx	%i5,	0x0E,	%l0
	std	%f16,	[%l7 + 0x48]
	andcc	%l1,	0x0966,	%l2
	ldd	[%l7 + 0x30],	%f6
	sra	%i0,	0x09,	%g4
	subc	%g1,	%i7,	%o7
	alignaddr	%l5,	%o1,	%i6
	andncc	%o6,	%o5,	%l4
	umulcc	%i1,	%i4,	%g5
	orncc	%i3,	%o3,	%g2
	fmuld8sux16	%f29,	%f25,	%f0
	udivcc	%g6,	0x03C3,	%g3
	udivx	%o4,	0x0C4A,	%g7
	fmovrsgz	%l6,	%f26,	%f6
	fpmerge	%f16,	%f17,	%f22
	edge32	%l3,	%o2,	%o0
	edge16l	%i2,	%l0,	%l1
	fandnot1	%f18,	%f2,	%f28
	smul	%l2,	0x0CEE,	%i5
	fmovrdlez	%i0,	%f24,	%f2
	xnor	%g4,	%g1,	%o7
	movneg	%xcc,	%l5,	%i7
	orcc	%o1,	0x16D3,	%o6
	fmovspos	%xcc,	%f7,	%f5
	move	%xcc,	%o5,	%i6
	edge16ln	%i1,	%i4,	%g5
	fcmpeq16	%f4,	%f22,	%i3
	save %l4, 0x0273, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g6,	%o3,	%g3
	movre	%g7,	0x07B,	%o4
	edge8n	%l6,	%l3,	%o0
	lduh	[%l7 + 0x50],	%i2
	sra	%l0,	%l1,	%l2
	mulx	%o2,	0x1E66,	%i0
	addcc	%i5,	%g4,	%o7
	nop
	set	0x20, %g6
	ldd	[%l7 + %g6],	%f16
	udivx	%g1,	0x1E56,	%l5
	edge8ln	%i7,	%o6,	%o1
	andcc	%o5,	0x0B20,	%i1
	edge32	%i4,	%i6,	%i3
	restore %l4, 0x0170, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g5,	%o3,	%g3
	alignaddrl	%g6,	%o4,	%l6
	movg	%icc,	%l3,	%o0
	subccc	%i2,	%l0,	%l1
	fmovdge	%xcc,	%f4,	%f23
	fcmpd	%fcc2,	%f2,	%f12
	fandnot2s	%f13,	%f8,	%f17
	ld	[%l7 + 0x74],	%f2
	edge32l	%g7,	%o2,	%l2
	addcc	%i0,	0x0E86,	%g4
	addc	%o7,	0x0142,	%g1
	lduh	[%l7 + 0x78],	%i5
	edge8ln	%i7,	%l5,	%o1
	fors	%f25,	%f10,	%f15
	nop
	set	0x56, %g1
	stb	%o6,	[%l7 + %g1]
	movcc	%xcc,	%o5,	%i1
	edge16	%i4,	%i3,	%l4
	ldsw	[%l7 + 0x48],	%i6
	sth	%g2,	[%l7 + 0x30]
	movrlz	%o3,	%g3,	%g5
	movle	%icc,	%o4,	%g6
	movcc	%icc,	%l3,	%l6
	umul	%o0,	0x16C1,	%i2
	fmovdl	%icc,	%f21,	%f21
	andcc	%l1,	0x1BE3,	%g7
	orn	%l0,	0x136C,	%o2
	umul	%l2,	0x1E31,	%g4
	fmovdleu	%xcc,	%f9,	%f13
	mova	%xcc,	%i0,	%o7
	edge32l	%g1,	%i5,	%i7
	addccc	%o1,	%l5,	%o5
	movcs	%xcc,	%i1,	%o6
	ldsb	[%l7 + 0x3D],	%i3
	fpadd16	%f20,	%f24,	%f14
	sub	%i4,	%l4,	%g2
	movneg	%icc,	%o3,	%g3
	movgu	%xcc,	%g5,	%i6
	array32	%g6,	%o4,	%l3
	array8	%o0,	%i2,	%l6
	movl	%xcc,	%g7,	%l0
	fmovsa	%xcc,	%f15,	%f31
	andn	%l1,	%l2,	%o2
	std	%f12,	[%l7 + 0x38]
	movle	%icc,	%i0,	%g4
	sllx	%o7,	%g1,	%i7
	edge32	%o1,	%l5,	%i5
	sll	%i1,	0x0D,	%o5
	ldsh	[%l7 + 0x7A],	%o6
	movgu	%xcc,	%i3,	%l4
	addcc	%g2,	%i4,	%o3
	ldsb	[%l7 + 0x73],	%g5
	edge16l	%i6,	%g6,	%o4
	andcc	%g3,	0x0F8A,	%o0
	orn	%l3,	0x0C75,	%l6
	fmovdgu	%xcc,	%f0,	%f8
	nop
	set	0x08, %i1
	stx	%i2,	[%l7 + %i1]
	ldub	[%l7 + 0x08],	%l0
	sdiv	%g7,	0x0E5D,	%l2
	edge8	%o2,	%i0,	%g4
	fnors	%f20,	%f31,	%f25
	fexpand	%f13,	%f12
	movrgez	%l1,	%g1,	%i7
	fmovdle	%xcc,	%f12,	%f26
	mulscc	%o1,	0x10EF,	%o7
	save %l5, 0x1D9D, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i1,	%o6,	%o5
	subcc	%i3,	0x1DBA,	%g2
	ldsb	[%l7 + 0x3F],	%l4
	orncc	%o3,	%g5,	%i6
	fcmped	%fcc1,	%f14,	%f26
	ldsh	[%l7 + 0x6A],	%g6
	ldsh	[%l7 + 0x4A],	%i4
	orcc	%o4,	0x02C7,	%o0
	udivcc	%l3,	0x0170,	%l6
	fmovdne	%xcc,	%f31,	%f27
	st	%f0,	[%l7 + 0x60]
	sllx	%g3,	0x1A,	%i2
	movre	%g7,	0x0CA,	%l2
	popc	%o2,	%l0
	smulcc	%i0,	%g4,	%g1
	move	%xcc,	%i7,	%l1
	movvc	%xcc,	%o7,	%o1
	ld	[%l7 + 0x30],	%f13
	xnorcc	%i5,	%l5,	%o6
	edge16n	%o5,	%i3,	%g2
	fand	%f20,	%f12,	%f6
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	mova	%icc,	%i6,	%g6
	ldub	[%l7 + 0x0A],	%i4
	fcmpd	%fcc2,	%f2,	%f22
	fpadd32s	%f13,	%f6,	%f10
	fnot1s	%f1,	%f12
	edge16ln	%o4,	%o0,	%l3
	stb	%g5,	[%l7 + 0x68]
	movcs	%xcc,	%g3,	%l6
	or	%g7,	%i2,	%l2
	array16	%l0,	%o2,	%i0
	orcc	%g1,	%g4,	%i7
	fmovsleu	%xcc,	%f21,	%f7
	addcc	%l1,	0x1CAE,	%o7
	fmovrsgz	%o1,	%f4,	%f0
	movge	%icc,	%l5,	%i5
	sub	%o6,	0x0C73,	%o5
	movne	%icc,	%i3,	%l4
	sir	0x0EF1
	edge16ln	%o3,	%g2,	%i1
	stb	%g6,	[%l7 + 0x56]
	fpsub32	%f28,	%f14,	%f16
	fmul8x16al	%f29,	%f5,	%f30
	movneg	%icc,	%i6,	%i4
	std	%f24,	[%l7 + 0x70]
	addccc	%o0,	0x1641,	%l3
	xnor	%g5,	%g3,	%o4
	subcc	%l6,	%i2,	%l2
	srlx	%l0,	0x1C,	%o2
	movrne	%g7,	%i0,	%g4
	movgu	%xcc,	%i7,	%l1
	movrgez	%g1,	0x0B4,	%o1
	movneg	%xcc,	%l5,	%o7
	umulcc	%i5,	0x06D4,	%o6
	sir	0x13B1
	fpadd32s	%f9,	%f21,	%f15
	orn	%i3,	0x02E9,	%o5
	ldsw	[%l7 + 0x74],	%l4
	sdiv	%g2,	0x1E5F,	%i1
	addccc	%o3,	%g6,	%i4
	edge16n	%o0,	%l3,	%i6
	nop
	set	0x40, %o5
	ldsb	[%l7 + %o5],	%g5
	edge8l	%g3,	%o4,	%i2
	sdivx	%l6,	0x10D0,	%l2
	ldx	[%l7 + 0x68],	%o2
	fmovdvc	%xcc,	%f4,	%f5
	fandnot2s	%f30,	%f16,	%f30
	fmovdcs	%xcc,	%f24,	%f17
	ld	[%l7 + 0x2C],	%f10
	save %l0, 0x1235, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x6C],	%f29
	fmovrdgez	%g7,	%f10,	%f2
	umulcc	%g4,	0x1774,	%i7
	andncc	%l1,	%o1,	%l5
	movre	%o7,	%i5,	%o6
	udivcc	%i3,	0x1F25,	%o5
	movle	%icc,	%l4,	%g1
	fmovsge	%xcc,	%f30,	%f25
	udivcc	%g2,	0x197B,	%i1
	udiv	%o3,	0x00F3,	%g6
	movn	%xcc,	%o0,	%l3
	move	%icc,	%i4,	%g5
	subc	%g3,	0x0923,	%o4
	std	%f8,	[%l7 + 0x68]
	edge32	%i6,	%l6,	%l2
	movvs	%icc,	%o2,	%l0
	umulcc	%i2,	0x04F6,	%g7
	ldsb	[%l7 + 0x34],	%i0
	smulcc	%i7,	%l1,	%g4
	fand	%f22,	%f14,	%f10
	movge	%icc,	%l5,	%o7
	fmovdcc	%xcc,	%f31,	%f22
	ldd	[%l7 + 0x40],	%f8
	pdist	%f10,	%f28,	%f24
	movpos	%icc,	%i5,	%o1
	fcmpes	%fcc0,	%f2,	%f4
	addc	%o6,	0x0AB6,	%o5
	nop
	set	0x58, %g4
	lduh	[%l7 + %g4],	%i3
	edge16ln	%g1,	%g2,	%l4
	fmovdcc	%xcc,	%f15,	%f0
	srl	%i1,	0x09,	%g6
	std	%f20,	[%l7 + 0x60]
	movvs	%xcc,	%o3,	%o0
	st	%f8,	[%l7 + 0x54]
	sllx	%l3,	%i4,	%g3
	edge16n	%o4,	%g5,	%i6
	subcc	%l2,	%o2,	%l0
	fxnors	%f7,	%f3,	%f16
	ld	[%l7 + 0x48],	%f29
	fmovsa	%icc,	%f16,	%f1
	fmovrse	%i2,	%f14,	%f8
	movneg	%icc,	%g7,	%i0
	edge32n	%l6,	%i7,	%l1
	fxnor	%f10,	%f20,	%f12
	mulx	%g4,	%o7,	%i5
	udiv	%l5,	0x139C,	%o1
	stx	%o5,	[%l7 + 0x50]
	mulx	%o6,	%g1,	%g2
	addcc	%i3,	%i1,	%l4
	andn	%o3,	0x05E9,	%g6
	addcc	%o0,	%l3,	%i4
	orcc	%o4,	%g5,	%g3
	andcc	%l2,	0x0725,	%i6
	edge32l	%o2,	%l0,	%i2
	fornot1	%f24,	%f26,	%f4
	stx	%g7,	[%l7 + 0x30]
	and	%l6,	%i0,	%l1
	movvs	%icc,	%g4,	%o7
	movre	%i7,	0x029,	%l5
	ldub	[%l7 + 0x37],	%o1
	add	%o5,	0x13F4,	%i5
	xorcc	%g1,	0x073E,	%g2
	movgu	%icc,	%i3,	%i1
	fxnor	%f18,	%f18,	%f0
	mova	%xcc,	%o6,	%l4
	movvc	%xcc,	%o3,	%g6
	move	%xcc,	%o0,	%l3
	srl	%o4,	%g5,	%i4
	movrlez	%g3,	%l2,	%i6
	movleu	%icc,	%o2,	%l0
	popc	0x1360,	%g7
	std	%f4,	[%l7 + 0x40]
	subccc	%i2,	%l6,	%l1
	movrlz	%i0,	%o7,	%g4
	edge32ln	%i7,	%o1,	%l5
	fones	%f10
	movrlez	%o5,	%i5,	%g2
	addccc	%g1,	0x0D75,	%i1
	subc	%o6,	%i3,	%l4
	movrlez	%g6,	0x38F,	%o0
	fmul8x16au	%f17,	%f7,	%f2
	alignaddr	%o3,	%l3,	%o4
	sir	0x1E12
	smulcc	%i4,	0x1F42,	%g5
	orn	%g3,	%l2,	%i6
	fornot2s	%f19,	%f18,	%f4
	orncc	%o2,	0x1FDB,	%g7
	movleu	%icc,	%i2,	%l0
	umul	%l6,	%l1,	%i0
	movle	%icc,	%g4,	%o7
	faligndata	%f18,	%f8,	%f12
	stb	%o1,	[%l7 + 0x41]
	ldsb	[%l7 + 0x3B],	%i7
	fmovscs	%xcc,	%f9,	%f19
	std	%f8,	[%l7 + 0x20]
	movneg	%xcc,	%o5,	%l5
	orn	%i5,	%g1,	%g2
	move	%xcc,	%o6,	%i1
	edge16l	%i3,	%g6,	%o0
	and	%o3,	%l3,	%o4
	sir	0x18FB
	movvs	%xcc,	%l4,	%g5
	and	%i4,	%g3,	%i6
	movgu	%icc,	%l2,	%o2
	fcmpne32	%f22,	%f30,	%g7
	ldsb	[%l7 + 0x2B],	%l0
	ldd	[%l7 + 0x10],	%i2
	nop
	set	0x2C, %l1
	stw	%l1,	[%l7 + %l1]
	edge8ln	%i0,	%l6,	%o7
	umul	%g4,	%i7,	%o1
	stb	%o5,	[%l7 + 0x6A]
	movn	%xcc,	%i5,	%l5
	orncc	%g2,	0x16AE,	%g1
	fmovscc	%icc,	%f26,	%f22
	lduw	[%l7 + 0x78],	%o6
	subcc	%i1,	0x14D0,	%i3
	sll	%g6,	%o0,	%o3
	fmovda	%xcc,	%f24,	%f3
	movg	%icc,	%l3,	%l4
	edge16	%g5,	%o4,	%g3
	subcc	%i6,	0x1F2F,	%i4
	fmuld8sux16	%f10,	%f25,	%f0
	fmovrsgez	%l2,	%f3,	%f9
	stb	%o2,	[%l7 + 0x6B]
	movn	%icc,	%l0,	%i2
	movge	%xcc,	%l1,	%g7
	xorcc	%i0,	%l6,	%o7
	lduw	[%l7 + 0x74],	%i7
	fmovsvc	%xcc,	%f13,	%f24
	edge32n	%g4,	%o5,	%i5
	edge8n	%o1,	%l5,	%g1
	movrgez	%o6,	%g2,	%i1
	edge8	%g6,	%o0,	%i3
	fmovd	%f10,	%f12
	srax	%l3,	%l4,	%o3
	lduw	[%l7 + 0x38],	%o4
	ldsw	[%l7 + 0x54],	%g5
	fandnot1s	%f15,	%f7,	%f13
	edge16l	%g3,	%i6,	%i4
	fmovscs	%icc,	%f29,	%f20
	mulscc	%o2,	0x088F,	%l0
	fandnot2	%f0,	%f4,	%f8
	fcmpne16	%f22,	%f6,	%i2
	movrlz	%l1,	%l2,	%g7
	fpack16	%f6,	%f6
	orncc	%l6,	%o7,	%i0
	addc	%i7,	0x1ABA,	%g4
	fmul8x16	%f16,	%f6,	%f10
	movrgez	%o5,	%o1,	%i5
	fmovdpos	%icc,	%f6,	%f2
	stw	%g1,	[%l7 + 0x78]
	edge32n	%o6,	%l5,	%g2
	stx	%i1,	[%l7 + 0x50]
	umul	%g6,	%o0,	%i3
	edge32n	%l4,	%o3,	%l3
	movrgz	%g5,	%o4,	%i6
	array32	%g3,	%i4,	%l0
	sdivx	%i2,	0x1F11,	%o2
	stw	%l1,	[%l7 + 0x40]
	umul	%l2,	%g7,	%o7
	ldd	[%l7 + 0x20],	%i6
	ldd	[%l7 + 0x70],	%f24
	save %i0, 0x130D, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f10,	[%l7 + 0x08]
	subcc	%o5,	%o1,	%i5
	xnor	%i7,	%o6,	%l5
	fmul8sux16	%f0,	%f18,	%f6
	edge16ln	%g2,	%g1,	%g6
	fmul8x16	%f25,	%f2,	%f8
	edge16	%i1,	%o0,	%l4
	fmovrsgez	%o3,	%f27,	%f25
	xnor	%i3,	0x11BC,	%g5
	edge32n	%l3,	%i6,	%g3
	movrgz	%i4,	0x0F2,	%l0
	edge16n	%o4,	%o2,	%i2
	ld	[%l7 + 0x74],	%f14
	sethi	0x004B,	%l2
	fmovrdlz	%g7,	%f30,	%f30
	movge	%xcc,	%l1,	%o7
	edge8ln	%i0,	%g4,	%o5
	udivcc	%o1,	0x07BE,	%l6
	edge16ln	%i5,	%i7,	%o6
	addccc	%g2,	%g1,	%g6
	std	%f6,	[%l7 + 0x28]
	ldub	[%l7 + 0x3A],	%i1
	srlx	%l5,	0x13,	%o0
	xorcc	%o3,	0x107E,	%i3
	fornot1	%f26,	%f8,	%f16
	movge	%icc,	%g5,	%l4
	sub	%l3,	0x1901,	%g3
	fcmps	%fcc3,	%f2,	%f4
	ldsb	[%l7 + 0x13],	%i6
	fandnot2	%f4,	%f12,	%f12
	add	%l0,	%i4,	%o2
	fmovdpos	%xcc,	%f18,	%f17
	movrgz	%o4,	%i2,	%g7
	fcmpeq16	%f2,	%f24,	%l1
	stw	%l2,	[%l7 + 0x30]
	fmovsn	%icc,	%f14,	%f29
	udivcc	%i0,	0x14F5,	%g4
	edge32	%o7,	%o1,	%l6
	subccc	%o5,	0x0B37,	%i7
	movleu	%xcc,	%o6,	%i5
	movneg	%icc,	%g1,	%g2
	movrgz	%i1,	0x055,	%l5
	ldub	[%l7 + 0x1D],	%g6
	movcs	%icc,	%o0,	%i3
	fcmpgt16	%f8,	%f28,	%g5
	fmul8x16	%f0,	%f4,	%f0
	subccc	%l4,	%o3,	%l3
	std	%f14,	[%l7 + 0x10]
	addcc	%g3,	0x15C0,	%l0
	move	%icc,	%i6,	%o2
	save %o4, 0x0586, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x50, %l5
	lduh	[%l7 + %l5],	%g7
	fnand	%f10,	%f20,	%f6
	for	%f10,	%f12,	%f22
	edge8	%l1,	%l2,	%i0
	fmovdne	%icc,	%f18,	%f2
	movleu	%icc,	%i4,	%g4
	edge8n	%o7,	%l6,	%o5
	fmovrdlz	%i7,	%f30,	%f14
	array32	%o6,	%i5,	%g1
	faligndata	%f22,	%f26,	%f26
	ldx	[%l7 + 0x48],	%g2
	movn	%icc,	%o1,	%l5
	fpsub16s	%f14,	%f9,	%f20
	and	%g6,	0x0136,	%i1
	edge16ln	%o0,	%g5,	%i3
	nop
	set	0x40, %l2
	ldsw	[%l7 + %l2],	%o3
	fmovdg	%xcc,	%f16,	%f22
	lduh	[%l7 + 0x3E],	%l4
	addc	%g3,	0x1DA6,	%l0
	subc	%l3,	0x07A8,	%o2
	faligndata	%f2,	%f6,	%f18
	mova	%icc,	%o4,	%i6
	xor	%g7,	%l1,	%l2
	movg	%icc,	%i0,	%i2
	movgu	%xcc,	%g4,	%o7
	xor	%i4,	%o5,	%l6
	movg	%xcc,	%i7,	%o6
	movleu	%xcc,	%g1,	%g2
	movleu	%icc,	%o1,	%l5
	array32	%i5,	%g6,	%i1
	movvs	%xcc,	%o0,	%g5
	movge	%icc,	%i3,	%o3
	xor	%l4,	%l0,	%g3
	edge32ln	%o2,	%l3,	%i6
	movneg	%xcc,	%o4,	%l1
	movneg	%icc,	%l2,	%g7
	movrlz	%i2,	0x345,	%i0
	movrgz	%o7,	0x3D8,	%g4
	alignaddrl	%i4,	%o5,	%l6
	sra	%o6,	%i7,	%g2
	movrgz	%o1,	0x31E,	%g1
	stx	%i5,	[%l7 + 0x48]
	andncc	%g6,	%l5,	%o0
	save %i1, 0x0B74, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i3,	%l4
	fnegd	%f2,	%f12
	srax	%o3,	%l0,	%g3
	fmovdleu	%xcc,	%f18,	%f13
	edge16	%l3,	%i6,	%o2
	addc	%l1,	%l2,	%g7
	fmovsvs	%xcc,	%f8,	%f14
	addc	%i2,	%i0,	%o4
	alignaddrl	%o7,	%i4,	%o5
	fmovdg	%xcc,	%f16,	%f14
	movl	%icc,	%g4,	%o6
	fcmpeq16	%f0,	%f0,	%i7
	sethi	0x050F,	%g2
	movrgz	%l6,	0x327,	%g1
	orcc	%i5,	%g6,	%o1
	movcc	%xcc,	%o0,	%l5
	movneg	%xcc,	%g5,	%i3
	addcc	%i1,	0x168A,	%o3
	sdivx	%l4,	0x1B5D,	%g3
	sdivcc	%l0,	0x18F7,	%i6
	fxnors	%f23,	%f20,	%f0
	edge16	%l3,	%l1,	%l2
	fone	%f8
	orncc	%g7,	%i2,	%o2
	save %o4, 0x0148, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f29,	[%l7 + 0x7C]
	xnorcc	%i0,	0x1676,	%o5
	movre	%i4,	0x046,	%o6
	addc	%g4,	0x1F8B,	%i7
	movrlz	%l6,	0x3C3,	%g1
	fmovsne	%icc,	%f3,	%f13
	andn	%i5,	%g6,	%g2
	mova	%xcc,	%o0,	%l5
	move	%icc,	%g5,	%o1
	movrlez	%i3,	%i1,	%o3
	fmovspos	%icc,	%f18,	%f15
	fmovdgu	%xcc,	%f22,	%f9
	fandnot2s	%f19,	%f0,	%f9
	lduh	[%l7 + 0x50],	%l4
	sth	%l0,	[%l7 + 0x5E]
	addccc	%g3,	%l3,	%i6
	orcc	%l1,	%l2,	%i2
	andcc	%o2,	0x1AA1,	%g7
	move	%xcc,	%o4,	%i0
	smul	%o5,	%o7,	%i4
	smul	%o6,	%g4,	%i7
	edge16l	%g1,	%l6,	%i5
	fmovdvc	%xcc,	%f16,	%f15
	fzeros	%f13
	addc	%g2,	0x1B11,	%g6
	ldub	[%l7 + 0x56],	%o0
	udiv	%g5,	0x07F9,	%l5
	movrlez	%o1,	0x0B9,	%i3
	xnor	%i1,	0x1079,	%o3
	xnorcc	%l0,	%g3,	%l4
	edge32ln	%l3,	%i6,	%l1
	orncc	%l2,	0x12EB,	%i2
	std	%f18,	[%l7 + 0x60]
	fmovsa	%xcc,	%f29,	%f15
	restore %o2, 0x08B2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f1,	%f27,	%f18
	fmovdcs	%icc,	%f22,	%f27
	andncc	%g7,	%o5,	%o7
	fmovrsgez	%i0,	%f10,	%f25
	lduh	[%l7 + 0x36],	%o6
	movgu	%icc,	%i4,	%i7
	fxnors	%f30,	%f6,	%f14
	add	%g4,	0x1509,	%g1
	udivcc	%l6,	0x0C46,	%g2
	movvs	%xcc,	%g6,	%o0
	edge8n	%g5,	%l5,	%o1
	stb	%i5,	[%l7 + 0x52]
	mulscc	%i3,	%o3,	%i1
	fmovsge	%xcc,	%f0,	%f3
	edge16l	%g3,	%l0,	%l3
	sethi	0x1E84,	%i6
	movge	%icc,	%l1,	%l2
	andn	%i2,	0x1E5B,	%o2
	move	%icc,	%l4,	%o4
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	restore %i0, 0x0721, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i7,	%i4,	%g4
	ldsh	[%l7 + 0x70],	%g1
	array32	%g2,	%l6,	%g6
	fxors	%f21,	%f8,	%f5
	movrlez	%o0,	%l5,	%g5
	andn	%o1,	0x14F1,	%i3
	std	%f8,	[%l7 + 0x38]
	sub	%i5,	%i1,	%o3
	popc	%l0,	%l3
	sllx	%g3,	0x02,	%i6
	ldd	[%l7 + 0x10],	%f12
	add	%l2,	%l1,	%o2
	array8	%l4,	%o4,	%g7
	udivcc	%i2,	0x128A,	%o7
	andncc	%o5,	%o6,	%i0
	movrlz	%i4,	0x10B,	%i7
	edge16ln	%g1,	%g2,	%g4
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	edge8ln	%l5,	%o0,	%o1
	nop
	set	0x34, %o2
	stw	%g5,	[%l7 + %o2]
	movcc	%icc,	%i3,	%i5
	mova	%icc,	%i1,	%l0
	fcmpd	%fcc0,	%f20,	%f14
	orncc	%o3,	%l3,	%g3
	addc	%i6,	0x0A6C,	%l1
	alignaddr	%l2,	%l4,	%o2
	ldd	[%l7 + 0x28],	%f2
	movvc	%icc,	%o4,	%g7
	edge16ln	%o7,	%i2,	%o5
	fmovdleu	%icc,	%f30,	%f26
	fpsub16s	%f13,	%f27,	%f26
	nop
	set	0x3B, %g5
	stb	%i0,	[%l7 + %g5]
	movcs	%icc,	%o6,	%i4
	movge	%xcc,	%g1,	%g2
	nop
	set	0x51, %o6
	ldub	[%l7 + %o6],	%g4
	smulcc	%i7,	%l6,	%l5
	edge16n	%g6,	%o1,	%g5
	fmovsg	%icc,	%f23,	%f5
	fsrc1s	%f4,	%f10
	movrgez	%o0,	0x39E,	%i3
	fmovdn	%xcc,	%f10,	%f8
	array8	%i1,	%l0,	%i5
	fmovdcs	%xcc,	%f9,	%f23
	addcc	%o3,	0x0F7B,	%l3
	fcmple16	%f18,	%f8,	%i6
	ldd	[%l7 + 0x20],	%f4
	addc	%l1,	0x153F,	%l2
	sllx	%l4,	%g3,	%o2
	restore %o4, 0x09FF, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i2,	%g7,	%o5
	movrlez	%i0,	%i4,	%g1
	edge16ln	%g2,	%o6,	%i7
	xnor	%g4,	%l6,	%l5
	edge16	%o1,	%g5,	%g6
	std	%f16,	[%l7 + 0x10]
	fmul8x16	%f11,	%f4,	%f20
	fandnot1s	%f10,	%f5,	%f13
	sra	%i3,	0x00,	%i1
	movne	%xcc,	%l0,	%o0
	movvs	%icc,	%o3,	%l3
	fmovdl	%icc,	%f25,	%f9
	fmovdpos	%xcc,	%f12,	%f15
	fnegd	%f14,	%f6
	sethi	0x00DB,	%i6
	movrgz	%l1,	0x354,	%i5
	edge16l	%l2,	%g3,	%l4
	addcc	%o2,	%o4,	%o7
	fmovrslz	%g7,	%f18,	%f23
	add	%i2,	%o5,	%i4
	andcc	%g1,	0x179F,	%g2
	array32	%i0,	%o6,	%i7
	mova	%xcc,	%l6,	%l5
	fornot1	%f14,	%f2,	%f28
	movge	%xcc,	%o1,	%g4
	movgu	%xcc,	%g6,	%i3
	ldsw	[%l7 + 0x34],	%i1
	umulcc	%l0,	0x08E2,	%o0
	movrne	%g5,	0x12E,	%o3
	movrne	%i6,	0x2BA,	%l1
	fcmpes	%fcc3,	%f27,	%f25
	std	%f30,	[%l7 + 0x20]
	smulcc	%i5,	0x114F,	%l2
	xor	%l3,	0x0E58,	%g3
	sra	%l4,	0x04,	%o4
	fors	%f11,	%f31,	%f9
	movn	%icc,	%o7,	%g7
	subc	%i2,	%o5,	%i4
	udivcc	%g1,	0x19DB,	%g2
	movrgez	%i0,	0x024,	%o2
	movneg	%icc,	%o6,	%i7
	edge16ln	%l5,	%l6,	%o1
	move	%icc,	%g6,	%i3
	fmovsne	%xcc,	%f21,	%f1
	fpackfix	%f8,	%f28
	popc	0x0585,	%i1
	movn	%xcc,	%g4,	%l0
	sethi	0x0F1F,	%o0
	fpack16	%f14,	%f20
	fmovdvs	%xcc,	%f30,	%f10
	sllx	%o3,	%i6,	%g5
	subcc	%i5,	0x0796,	%l1
	sth	%l3,	[%l7 + 0x08]
	array16	%g3,	%l2,	%o4
	sdiv	%o7,	0x1C0B,	%g7
	fmovdgu	%icc,	%f6,	%f25
	array32	%l4,	%i2,	%i4
	edge16l	%g1,	%g2,	%o5
	ldx	[%l7 + 0x58],	%i0
	edge8l	%o2,	%o6,	%i7
	fcmpeq32	%f14,	%f20,	%l5
	smulcc	%o1,	%g6,	%i3
	fmovsg	%icc,	%f3,	%f0
	st	%f18,	[%l7 + 0x64]
	edge32l	%i1,	%g4,	%l0
	edge16ln	%o0,	%o3,	%l6
	lduw	[%l7 + 0x64],	%i6
	movrgez	%i5,	%l1,	%g5
	edge32n	%g3,	%l2,	%o4
	edge16n	%o7,	%l3,	%l4
	movrne	%i2,	0x2EA,	%g7
	stw	%i4,	[%l7 + 0x20]
	edge8n	%g2,	%o5,	%i0
	nop
	set	0x08, %o4
	ldsh	[%l7 + %o4],	%g1
	edge32n	%o2,	%i7,	%o6
	edge16l	%l5,	%g6,	%i3
	mulscc	%o1,	%g4,	%i1
	stb	%o0,	[%l7 + 0x30]
	movn	%icc,	%l0,	%l6
	sdivcc	%o3,	0x1761,	%i5
	fmovdg	%xcc,	%f2,	%f28
	save %l1, %g5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x0F32
	edge16	%i6,	%l2,	%o4
	movcs	%xcc,	%l3,	%o7
	fxor	%f20,	%f6,	%f18
	movl	%icc,	%l4,	%g7
	udiv	%i2,	0x1089,	%i4
	orncc	%o5,	%i0,	%g1
	subccc	%o2,	0x110C,	%g2
	sra	%o6,	0x19,	%i7
	srl	%l5,	0x00,	%g6
	edge32ln	%o1,	%i3,	%i1
	edge16n	%o0,	%l0,	%g4
	stw	%l6,	[%l7 + 0x30]
	fxnor	%f26,	%f4,	%f20
	stx	%o3,	[%l7 + 0x18]
	edge32ln	%i5,	%g5,	%g3
	ldsb	[%l7 + 0x73],	%l1
	array32	%i6,	%o4,	%l2
	move	%xcc,	%l3,	%l4
	xnorcc	%o7,	%i2,	%i4
	sll	%o5,	%i0,	%g7
	xnorcc	%g1,	%o2,	%o6
	edge16	%g2,	%i7,	%l5
	mova	%icc,	%g6,	%i3
	fabsd	%f20,	%f22
	addcc	%o1,	%i1,	%o0
	movle	%icc,	%l0,	%g4
	and	%l6,	%o3,	%g5
	ldsh	[%l7 + 0x2C],	%g3
	fmovdle	%icc,	%f17,	%f22
	ldsw	[%l7 + 0x6C],	%l1
	movl	%xcc,	%i6,	%i5
	movn	%xcc,	%o4,	%l3
	subccc	%l4,	0x09A6,	%o7
	subcc	%i2,	0x1DD5,	%l2
	movvc	%xcc,	%o5,	%i0
	ldsh	[%l7 + 0x1C],	%g7
	fcmple32	%f28,	%f14,	%i4
	mova	%icc,	%g1,	%o6
	fpackfix	%f10,	%f30
	array32	%o2,	%i7,	%l5
	array32	%g6,	%i3,	%o1
	orn	%i1,	0x11AF,	%o0
	mova	%xcc,	%l0,	%g4
	fmovsa	%icc,	%f22,	%f14
	andcc	%l6,	0x04BE,	%o3
	stw	%g5,	[%l7 + 0x58]
	fmul8sux16	%f14,	%f6,	%f26
	fmovsl	%xcc,	%f11,	%f24
	fand	%f22,	%f30,	%f22
	std	%f30,	[%l7 + 0x20]
	movl	%icc,	%g2,	%g3
	siam	0x6
	array16	%i6,	%i5,	%l1
	edge16l	%o4,	%l4,	%o7
	movcs	%icc,	%l3,	%i2
	edge8n	%o5,	%i0,	%l2
	fpsub32s	%f18,	%f0,	%f10
	fnot1s	%f5,	%f4
	popc	%i4,	%g7
	fsrc1	%f8,	%f8
	std	%f20,	[%l7 + 0x28]
	fsrc2	%f2,	%f2
	ld	[%l7 + 0x14],	%f30
	movleu	%xcc,	%o6,	%o2
	fmul8ulx16	%f18,	%f20,	%f24
	movrgz	%g1,	0x1C9,	%l5
	or	%i7,	0x000F,	%i3
	fzeros	%f30
	edge16	%o1,	%g6,	%o0
	ldsb	[%l7 + 0x45],	%l0
	fornot2	%f12,	%f22,	%f2
	ld	[%l7 + 0x08],	%f2
	sdivcc	%g4,	0x0A82,	%i1
	xnor	%l6,	%g5,	%o3
	sll	%g2,	%g3,	%i6
	xnorcc	%i5,	0x0B64,	%o4
	movneg	%xcc,	%l1,	%o7
	edge8n	%l4,	%l3,	%i2
	movn	%xcc,	%o5,	%i0
	save %i4, 0x10AB, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l2,	%f26,	%f14
	subcc	%o6,	0x1704,	%o2
	and	%g1,	0x1095,	%i7
	sdiv	%l5,	0x1333,	%i3
	udiv	%g6,	0x16C2,	%o0
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	edge16ln	%o1,	%l6,	%g5
	srax	%g2,	%o3,	%g3
	edge32ln	%i6,	%o4,	%l1
	sra	%i5,	0x07,	%l4
	ld	[%l7 + 0x74],	%f31
	smul	%l3,	0x18E3,	%i2
	ldx	[%l7 + 0x28],	%o5
	nop
	set	0x30, %i2
	std	%f24,	[%l7 + %i2]
	umul	%i0,	%o7,	%i4
	mova	%xcc,	%g7,	%l2
	sth	%o6,	[%l7 + 0x2C]
	fmovdl	%icc,	%f23,	%f18
	mova	%icc,	%o2,	%i7
	nop
	set	0x74, %o7
	lduh	[%l7 + %o7],	%l5
	movn	%xcc,	%i3,	%g1
	or	%o0,	0x1879,	%g6
	andcc	%g4,	%i1,	%o1
	movcc	%icc,	%l0,	%l6
	array8	%g2,	%o3,	%g5
	andn	%i6,	%g3,	%o4
	edge32	%i5,	%l1,	%l4
	fmovrdgz	%i2,	%f24,	%f30
	mova	%xcc,	%o5,	%i0
	popc	%l3,	%o7
	array16	%i4,	%l2,	%g7
	fmovscc	%xcc,	%f12,	%f14
	fandnot1	%f24,	%f18,	%f14
	fmovdneg	%xcc,	%f2,	%f31
	fmovsne	%icc,	%f31,	%f30
	stx	%o2,	[%l7 + 0x18]
	fand	%f26,	%f14,	%f26
	movrlez	%i7,	0x184,	%l5
	edge32	%i3,	%o6,	%g1
	array8	%o0,	%g6,	%g4
	xnor	%i1,	0x0886,	%o1
	mulscc	%l0,	0x1ABC,	%g2
	movpos	%icc,	%o3,	%g5
	movcc	%icc,	%l6,	%g3
	fpackfix	%f2,	%f29
	std	%f18,	[%l7 + 0x50]
	std	%f26,	[%l7 + 0x70]
	edge32ln	%i6,	%o4,	%i5
	fmovrsne	%l1,	%f25,	%f14
	movg	%icc,	%l4,	%i2
	movpos	%xcc,	%i0,	%o5
	ldsb	[%l7 + 0x5F],	%o7
	ldsw	[%l7 + 0x38],	%l3
	ldx	[%l7 + 0x30],	%l2
	add	%i4,	%g7,	%i7
	fandnot2	%f14,	%f0,	%f10
	edge32	%l5,	%o2,	%o6
	addcc	%g1,	0x1142,	%o0
	mulscc	%i3,	%g4,	%g6
	fcmple32	%f24,	%f30,	%i1
	movre	%l0,	0x04E,	%g2
	ldsw	[%l7 + 0x60],	%o1
	ldd	[%l7 + 0x40],	%f0
	lduw	[%l7 + 0x34],	%o3
	fmovdl	%xcc,	%f20,	%f22
	ldx	[%l7 + 0x10],	%g5
	fxor	%f0,	%f12,	%f24
	array16	%g3,	%l6,	%i6
	movn	%xcc,	%i5,	%l1
	ldd	[%l7 + 0x10],	%f10
	fmovsle	%xcc,	%f4,	%f3
	sllx	%l4,	0x11,	%o4
	for	%f28,	%f12,	%f18
	or	%i2,	0x0902,	%i0
	fcmpeq16	%f16,	%f18,	%o7
	mulscc	%o5,	%l3,	%i4
	alignaddrl	%l2,	%g7,	%i7
	ldsh	[%l7 + 0x62],	%o2
	sllx	%o6,	%g1,	%l5
	fmovdcc	%xcc,	%f19,	%f21
	subccc	%i3,	0x0898,	%o0
	add	%g4,	0x0B1D,	%g6
	fmovdneg	%xcc,	%f15,	%f31
	fmovdle	%icc,	%f24,	%f11
	nop
	set	0x4E, %o1
	lduh	[%l7 + %o1],	%l0
	ldsw	[%l7 + 0x18],	%g2
	array32	%i1,	%o3,	%g5
	fmovdleu	%icc,	%f24,	%f6
	srlx	%g3,	0x06,	%o1
	ldub	[%l7 + 0x2E],	%i6
	movvc	%xcc,	%l6,	%l1
	fpsub16s	%f21,	%f6,	%f5
	srlx	%l4,	%o4,	%i2
	udiv	%i5,	0x0B4F,	%i0
	orn	%o7,	0x09FF,	%l3
	mulscc	%i4,	%l2,	%o5
	ldd	[%l7 + 0x68],	%g6
	ldub	[%l7 + 0x2A],	%i7
	std	%f4,	[%l7 + 0x08]
	edge8n	%o2,	%o6,	%l5
	movle	%xcc,	%i3,	%g1
	srax	%o0,	%g6,	%g4
	or	%g2,	%i1,	%o3
	ldd	[%l7 + 0x08],	%f16
	edge8n	%g5,	%g3,	%o1
	movl	%xcc,	%l0,	%l6
	sir	0x0D14
	smul	%l1,	%i6,	%o4
	fmovd	%f26,	%f6
	fmovdn	%xcc,	%f30,	%f19
	ldsw	[%l7 + 0x7C],	%l4
	fcmpes	%fcc0,	%f19,	%f12
	fcmple16	%f26,	%f18,	%i5
	ldsw	[%l7 + 0x44],	%i2
	movgu	%icc,	%i0,	%o7
	subcc	%i4,	%l3,	%o5
	edge16	%g7,	%l2,	%o2
	addccc	%o6,	%l5,	%i3
	mulscc	%i7,	0x1601,	%o0
	edge8n	%g6,	%g4,	%g2
	fnegs	%f17,	%f21
	fmovdge	%xcc,	%f12,	%f3
	edge8ln	%i1,	%g1,	%g5
	edge16ln	%g3,	%o1,	%l0
	edge16	%l6,	%o3,	%i6
	movgu	%icc,	%l1,	%o4
	addcc	%l4,	0x1493,	%i2
	sdiv	%i5,	0x0215,	%o7
	orn	%i4,	0x144D,	%i0
	edge16n	%o5,	%l3,	%l2
	fpsub32s	%f7,	%f30,	%f24
	movpos	%icc,	%o2,	%o6
	ldsh	[%l7 + 0x3C],	%l5
	edge8l	%i3,	%i7,	%g7
	fcmpeq32	%f10,	%f16,	%g6
	movl	%icc,	%o0,	%g4
	movn	%icc,	%i1,	%g2
	edge16n	%g1,	%g3,	%g5
	fmovsgu	%xcc,	%f3,	%f22
	fmovrdne	%o1,	%f22,	%f20
	alignaddrl	%l0,	%o3,	%l6
	sdivx	%i6,	0x06F7,	%o4
	movleu	%icc,	%l4,	%l1
	movg	%icc,	%i2,	%i5
	fmovs	%f11,	%f23
	edge16n	%i4,	%i0,	%o5
	fones	%f21
	mulscc	%o7,	0x0E61,	%l3
	mulx	%l2,	%o2,	%o6
	fmuld8ulx16	%f4,	%f2,	%f28
	sdiv	%i3,	0x05FC,	%l5
	movpos	%icc,	%i7,	%g6
	or	%o0,	0x03FA,	%g7
	movleu	%icc,	%i1,	%g4
	ldsb	[%l7 + 0x77],	%g1
	fmovdpos	%icc,	%f30,	%f27
	restore %g3, 0x0223, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	%l0,	%g2
	srl	%o3,	0x00,	%i6
	srl	%l6,	%l4,	%o4
	sdivx	%i2,	0x1A56,	%i5
	movg	%icc,	%i4,	%i0
	movneg	%xcc,	%o5,	%l1
	fmovrdgez	%l3,	%f2,	%f0
	smulcc	%o7,	0x0554,	%l2
	fmuld8ulx16	%f9,	%f10,	%f16
	lduw	[%l7 + 0x30],	%o6
	ld	[%l7 + 0x08],	%f30
	movre	%i3,	%o2,	%l5
	fpsub32s	%f17,	%f6,	%f15
	for	%f30,	%f16,	%f22
	fornot1	%f18,	%f28,	%f12
	udivx	%g6,	0x1734,	%i7
	fmovsl	%icc,	%f17,	%f21
	subccc	%o0,	%i1,	%g7
	movrne	%g4,	0x307,	%g3
	edge16ln	%g1,	%o1,	%g5
	alignaddrl	%l0,	%o3,	%g2
	fcmpes	%fcc2,	%f31,	%f6
	fmovrdne	%l6,	%f12,	%f2
	std	%f28,	[%l7 + 0x40]
	ldsb	[%l7 + 0x15],	%l4
	subc	%i6,	%i2,	%i5
	andcc	%o4,	%i4,	%i0
	addc	%l1,	0x162D,	%l3
	ldd	[%l7 + 0x68],	%f4
	addc	%o7,	0x0149,	%l2
	umul	%o6,	%o5,	%i3
	movn	%icc,	%o2,	%l5
	fcmped	%fcc3,	%f26,	%f24
	addc	%i7,	%g6,	%i1
	pdist	%f14,	%f8,	%f6
	fsrc2	%f28,	%f14
	ldd	[%l7 + 0x30],	%f28
	movrlez	%o0,	0x087,	%g4
	sdivcc	%g3,	0x0FD8,	%g7
	addcc	%o1,	0x0B9A,	%g1
	fmuld8sux16	%f19,	%f4,	%f4
	ldub	[%l7 + 0x36],	%l0
	orcc	%g5,	0x0C41,	%o3
	fpadd32	%f14,	%f18,	%f20
	xor	%l6,	%g2,	%i6
	fabsd	%f16,	%f30
	fmul8x16al	%f9,	%f13,	%f26
	edge32ln	%l4,	%i2,	%i5
	sir	0x00F1
	array32	%o4,	%i4,	%l1
	edge16ln	%i0,	%o7,	%l2
	umulcc	%l3,	0x17D1,	%o5
	umulcc	%i3,	0x0342,	%o2
	edge32l	%o6,	%l5,	%g6
	sdiv	%i7,	0x0A46,	%o0
	addcc	%g4,	%i1,	%g7
	movg	%icc,	%g3,	%g1
	movpos	%icc,	%l0,	%o1
	subc	%o3,	%g5,	%g2
	movg	%icc,	%l6,	%l4
	addcc	%i2,	%i5,	%o4
	stw	%i4,	[%l7 + 0x50]
	movvs	%xcc,	%l1,	%i6
	save %i0, 0x07A2, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%o7,	%o5
	fmovde	%icc,	%f23,	%f17
	fexpand	%f8,	%f20
	edge32ln	%l3,	%o2,	%o6
	movne	%xcc,	%l5,	%g6
	subcc	%i3,	%i7,	%g4
	ld	[%l7 + 0x2C],	%f5
	movneg	%xcc,	%o0,	%i1
	movcs	%icc,	%g7,	%g1
	movcs	%icc,	%l0,	%o1
	alignaddr	%o3,	%g5,	%g2
	sir	0x0F24
	fmovdleu	%xcc,	%f29,	%f30
	array16	%l6,	%l4,	%i2
	umulcc	%i5,	%g3,	%i4
	subc	%l1,	0x0BEB,	%i6
	movrgz	%i0,	0x208,	%o4
	sub	%o7,	0x0A53,	%l2
	nop
	set	0x20, %o3
	std	%f0,	[%l7 + %o3]
	array32	%l3,	%o5,	%o2
	udivcc	%o6,	0x1D22,	%l5
	sth	%i3,	[%l7 + 0x52]
	fmovspos	%icc,	%f13,	%f31
	fnand	%f14,	%f2,	%f16
	sdivcc	%i7,	0x1459,	%g4
	fnot2s	%f10,	%f17
	sth	%o0,	[%l7 + 0x14]
	movgu	%icc,	%i1,	%g6
	fpmerge	%f23,	%f7,	%f18
	movcs	%icc,	%g1,	%l0
	umulcc	%g7,	0x0CC2,	%o3
	srax	%g5,	0x11,	%o1
	stx	%g2,	[%l7 + 0x70]
	edge32ln	%l6,	%i2,	%i5
	lduw	[%l7 + 0x5C],	%g3
	movrgez	%l4,	0x0FD,	%i4
	sdivx	%l1,	0x1D00,	%i0
	sir	0x1944
	fmovde	%icc,	%f16,	%f25
	fcmpeq16	%f2,	%f4,	%i6
	ldx	[%l7 + 0x18],	%o4
	stx	%l2,	[%l7 + 0x48]
	umul	%l3,	%o5,	%o2
	sethi	0x00B3,	%o7
	fmovdne	%icc,	%f0,	%f30
	movleu	%icc,	%l5,	%i3
	xnor	%i7,	%g4,	%o6
	addcc	%o0,	%i1,	%g1
	movle	%icc,	%g6,	%l0
	fmul8ulx16	%f18,	%f8,	%f20
	fandnot1	%f2,	%f12,	%f22
	movre	%g7,	0x240,	%g5
	fands	%f9,	%f30,	%f13
	ldd	[%l7 + 0x48],	%o2
	fmovrsgez	%g2,	%f31,	%f29
	umul	%o1,	%l6,	%i5
	edge16l	%i2,	%g3,	%l4
	movvc	%xcc,	%l1,	%i0
	movn	%xcc,	%i6,	%i4
	movvc	%icc,	%o4,	%l2
	movvc	%icc,	%o5,	%l3
	edge32l	%o2,	%l5,	%i3
	movrlz	%o7,	%g4,	%i7
	fcmpgt16	%f18,	%f14,	%o6
	ldx	[%l7 + 0x18],	%i1
	orcc	%o0,	%g1,	%l0
	subcc	%g6,	0x0BDE,	%g7
	fmovrdne	%o3,	%f10,	%f16
	save %g2, 0x1446, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o1,	0x0704,	%i5
	mulx	%i2,	0x143A,	%l6
	st	%f14,	[%l7 + 0x3C]
	sdiv	%g3,	0x16CE,	%l4
	fandnot2s	%f7,	%f16,	%f1
	sll	%l1,	0x00,	%i6
	alignaddr	%i0,	%o4,	%i4
	edge8	%l2,	%l3,	%o2
	edge32ln	%o5,	%i3,	%l5
	fornot2s	%f17,	%f25,	%f27
	edge8	%g4,	%o7,	%i7
	udivx	%o6,	0x1B3F,	%o0
	nop
	set	0x10, %i7
	lduw	[%l7 + %i7],	%g1
	alignaddr	%l0,	%i1,	%g6
	fmuld8sux16	%f27,	%f6,	%f18
	srlx	%o3,	0x14,	%g7
	edge8ln	%g5,	%o1,	%i5
	or	%i2,	0x1DAE,	%l6
	sll	%g2,	%l4,	%g3
	sdivx	%i6,	0x1A9A,	%l1
	xor	%o4,	0x0748,	%i4
	sth	%i0,	[%l7 + 0x58]
	movvc	%icc,	%l3,	%l2
	fandnot1	%f26,	%f24,	%f12
	subccc	%o2,	0x17E5,	%i3
	edge16l	%o5,	%l5,	%g4
	smul	%o7,	0x06D0,	%i7
	movcc	%icc,	%o0,	%g1
	srlx	%l0,	%i1,	%g6
	movneg	%icc,	%o3,	%g7
	addcc	%g5,	%o6,	%i5
	srax	%i2,	%o1,	%g2
	srlx	%l4,	%g3,	%l6
	fmovdgu	%icc,	%f18,	%f0
	fmovda	%icc,	%f5,	%f13
	fmovsge	%icc,	%f16,	%f0
	ldub	[%l7 + 0x17],	%i6
	mova	%icc,	%o4,	%l1
	orn	%i4,	%l3,	%l2
	fmovdle	%xcc,	%f0,	%f2
	movn	%icc,	%i0,	%o2
	fcmpeq32	%f26,	%f6,	%i3
	fpadd32s	%f0,	%f28,	%f30
	ldsh	[%l7 + 0x18],	%l5
	andcc	%g4,	%o5,	%o7
	subccc	%o0,	0x11E5,	%g1
	movcs	%xcc,	%l0,	%i7
	move	%icc,	%i1,	%g6
	xorcc	%g7,	0x1493,	%g5
	fmovde	%icc,	%f20,	%f10
	lduh	[%l7 + 0x2A],	%o3
	fxors	%f25,	%f19,	%f18
	umulcc	%i5,	%i2,	%o6
	sll	%g2,	%l4,	%g3
	movg	%xcc,	%l6,	%o1
	edge8l	%i6,	%o4,	%i4
	udivx	%l3,	0x0FCB,	%l2
	movle	%icc,	%l1,	%i0
	fmovde	%xcc,	%f28,	%f30
	sra	%o2,	0x11,	%l5
	stb	%g4,	[%l7 + 0x2B]
	xorcc	%i3,	%o7,	%o5
	mulscc	%o0,	0x1EB5,	%l0
	edge8l	%g1,	%i7,	%g6
	save %i1, 0x087A, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrse	%o3,	%f9,	%f3
	ld	[%l7 + 0x70],	%f26
	fornot2s	%f22,	%f19,	%f6
	addc	%i5,	%i2,	%g7
	std	%f22,	[%l7 + 0x30]
	array32	%o6,	%l4,	%g2
	nop
	set	0x4C, %g3
	lduh	[%l7 + %g3],	%g3
	ld	[%l7 + 0x48],	%f4
	xor	%o1,	%i6,	%l6
	xnorcc	%o4,	%l3,	%l2
	edge16	%i4,	%l1,	%i0
	save %o2, %l5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o7,	0x0E59,	%i3
	smulcc	%o0,	0x1BB6,	%l0
	fzeros	%f27
	movcs	%icc,	%o5,	%g1
	movle	%xcc,	%i7,	%g6
	movre	%g5,	%o3,	%i1
	save %i2, %g7, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l4,	%g2
	sdiv	%g3,	0x1558,	%o1
	fnand	%f28,	%f4,	%f4
	lduw	[%l7 + 0x6C],	%i6
	addc	%i5,	%o4,	%l3
	movrlz	%l6,	%i4,	%l1
	udiv	%i0,	0x1B48,	%l2
	movleu	%xcc,	%l5,	%g4
	edge16l	%o2,	%o7,	%i3
	movrgz	%o0,	0x1E4,	%l0
	sir	0x0B84
	movrlz	%g1,	%o5,	%i7
	fmovsvs	%icc,	%f23,	%f17
	array16	%g6,	%o3,	%i1
	edge32l	%i2,	%g7,	%o6
	fmovsgu	%icc,	%f24,	%f21
	movn	%icc,	%l4,	%g2
	mova	%icc,	%g3,	%g5
	edge32	%o1,	%i5,	%i6
	movcc	%xcc,	%o4,	%l3
	orn	%l6,	%i4,	%l1
	sra	%l2,	%l5,	%i0
	fpack16	%f0,	%f20
	ldub	[%l7 + 0x1B],	%o2
	lduw	[%l7 + 0x54],	%g4
	edge8	%o7,	%o0,	%i3
	movle	%xcc,	%g1,	%l0
	nop
	set	0x48, %g2
	std	%f6,	[%l7 + %g2]
	movg	%xcc,	%o5,	%i7
	sethi	0x0F8B,	%g6
	sdiv	%i1,	0x1337,	%i2
	fabsd	%f24,	%f8
	add	%o3,	%g7,	%l4
	orn	%o6,	0x0DF4,	%g2
	umul	%g5,	0x0E58,	%g3
	movrgz	%o1,	0x298,	%i5
	movn	%icc,	%o4,	%i6
	edge8n	%l3,	%i4,	%l1
	edge8l	%l2,	%l6,	%l5
	add	%i0,	%o2,	%o7
	movleu	%icc,	%o0,	%g4
	sll	%i3,	%l0,	%o5
	add	%g1,	0x028D,	%g6
	ldsb	[%l7 + 0x31],	%i1
	edge8n	%i7,	%o3,	%g7
	for	%f22,	%f0,	%f20
	addccc	%l4,	0x0341,	%i2
	alignaddr	%g2,	%g5,	%o6
	ldx	[%l7 + 0x18],	%g3
	movle	%xcc,	%i5,	%o1
	nop
	set	0x10, %l4
	ldsh	[%l7 + %l4],	%o4
	movneg	%xcc,	%i6,	%i4
	umul	%l3,	%l2,	%l6
	movre	%l5,	0x162,	%i0
	andcc	%l1,	0x1306,	%o7
	ldx	[%l7 + 0x58],	%o2
	movn	%xcc,	%g4,	%i3
	nop
	set	0x08, %l3
	std	%f10,	[%l7 + %l3]
	edge16l	%l0,	%o5,	%o0
	movge	%icc,	%g1,	%i1
	mova	%xcc,	%i7,	%o3
	lduw	[%l7 + 0x10],	%g6
	sub	%g7,	0x06B1,	%l4
	siam	0x4
	movle	%xcc,	%g2,	%g5
	array16	%o6,	%i2,	%g3
	fcmpeq16	%f30,	%f30,	%o1
	udiv	%i5,	0x1906,	%o4
	add	%i4,	0x0AD8,	%l3
	sdiv	%i6,	0x0B4B,	%l6
	ldd	[%l7 + 0x78],	%l4
	srlx	%l2,	0x0A,	%i0
	sub	%l1,	%o7,	%o2
	movvc	%icc,	%i3,	%g4
	ldd	[%l7 + 0x20],	%f18
	movvc	%xcc,	%l0,	%o0
	lduw	[%l7 + 0x64],	%o5
	movrne	%g1,	%i1,	%i7
	fnor	%f16,	%f28,	%f8
	ldd	[%l7 + 0x20],	%o2
	xorcc	%g6,	0x0369,	%l4
	fpsub32s	%f14,	%f17,	%f21
	or	%g2,	%g5,	%o6
	movrlez	%g7,	%i2,	%g3
	fmovrslez	%i5,	%f28,	%f28
	fmovrse	%o4,	%f20,	%f24
	fpsub16	%f22,	%f4,	%f18
	mova	%icc,	%o1,	%l3
	mulx	%i4,	%i6,	%l6
	edge8n	%l2,	%i0,	%l5
	or	%l1,	%o7,	%o2
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	movrgz	%l0,	0x292,	%o0
	movge	%xcc,	%g1,	%o5
	movgu	%xcc,	%i1,	%i7
	xorcc	%o3,	%l4,	%g6
	xorcc	%g5,	%g2,	%o6
	fcmpeq32	%f6,	%f28,	%g7
	smul	%g3,	0x101A,	%i5
	movrgz	%i2,	0x05B,	%o1
	stb	%o4,	[%l7 + 0x67]
	edge8	%i4,	%i6,	%l3
	fmovrdlz	%l6,	%f24,	%f10
	movneg	%xcc,	%l2,	%i0
	movrne	%l1,	%l5,	%o2
	edge16n	%g4,	%i3,	%l0
	addcc	%o7,	%g1,	%o5
	fornot2s	%f14,	%f0,	%f21
	edge32n	%o0,	%i1,	%i7
	stb	%l4,	[%l7 + 0x21]
	edge32l	%g6,	%o3,	%g5
	nop
	set	0x18, %i0
	sth	%g2,	[%l7 + %i0]
	ldd	[%l7 + 0x78],	%f24
	fmul8x16	%f27,	%f12,	%f28
	andcc	%g7,	%o6,	%g3
	edge16	%i2,	%o1,	%o4
	st	%f27,	[%l7 + 0x74]
	ldx	[%l7 + 0x38],	%i5
	stx	%i4,	[%l7 + 0x40]
	movvc	%icc,	%l3,	%i6
	srlx	%l2,	0x01,	%i0
	movrne	%l6,	%l5,	%o2
	ldsb	[%l7 + 0x4B],	%g4
	movre	%i3,	%l0,	%l1
	movrgz	%o7,	0x2E4,	%g1
	srl	%o0,	%o5,	%i1
	fands	%f28,	%f1,	%f16
	fmovsle	%xcc,	%f31,	%f27
	move	%icc,	%i7,	%l4
	fmovd	%f22,	%f12
	subc	%o3,	0x165F,	%g6
	movrlz	%g2,	0x272,	%g7
	ldsh	[%l7 + 0x5E],	%o6
	fxor	%f10,	%f6,	%f4
	fmovrdlz	%g5,	%f20,	%f4
	edge16n	%i2,	%g3,	%o1
	edge16	%o4,	%i5,	%l3
	srl	%i6,	0x02,	%i4
	xnor	%i0,	%l6,	%l5
	ldd	[%l7 + 0x40],	%f10
	addc	%o2,	%g4,	%l2
	fzero	%f26
	fpackfix	%f10,	%f6
	edge32ln	%l0,	%l1,	%o7
	array32	%g1,	%o0,	%i3
	ldub	[%l7 + 0x0C],	%o5
	addcc	%i1,	%i7,	%o3
	fmul8ulx16	%f12,	%f16,	%f28
	edge16l	%l4,	%g6,	%g2
	fcmpeq32	%f12,	%f2,	%o6
	mova	%xcc,	%g7,	%g5
	srl	%g3,	0x13,	%o1
	andncc	%i2,	%o4,	%i5
	sll	%l3,	0x1D,	%i6
	xnor	%i4,	0x0113,	%i0
	edge8ln	%l6,	%l5,	%o2
	fpsub32	%f12,	%f28,	%f14
	udiv	%g4,	0x0093,	%l0
	stw	%l2,	[%l7 + 0x28]
	fmovdcs	%icc,	%f26,	%f13
	fpsub16s	%f18,	%f31,	%f18
	sdivx	%l1,	0x099F,	%o7
	xnor	%o0,	0x136C,	%i3
	mulscc	%g1,	0x1971,	%i1
	pdist	%f22,	%f2,	%f16
	srl	%i7,	%o5,	%o3
	movpos	%xcc,	%g6,	%g2
	orcc	%l4,	%o6,	%g5
	ld	[%l7 + 0x08],	%f30
	sdiv	%g7,	0x03E5,	%o1
	add	%g3,	%i2,	%i5
	movrlz	%o4,	0x21B,	%i6
	sub	%i4,	%l3,	%i0
	fnot1	%f6,	%f0
	fmovspos	%icc,	%f10,	%f5
	sdiv	%l6,	0x1B26,	%l5
	ldsb	[%l7 + 0x67],	%g4
	udiv	%o2,	0x1B4D,	%l0
	movvc	%xcc,	%l1,	%l2
	fcmped	%fcc3,	%f24,	%f26
	st	%f2,	[%l7 + 0x20]
	umulcc	%o7,	%i3,	%g1
	fxnors	%f25,	%f10,	%f12
	udivx	%o0,	0x0DF7,	%i1
	stw	%o5,	[%l7 + 0x14]
	fmovrde	%i7,	%f4,	%f30
	subccc	%g6,	%g2,	%o3
	ld	[%l7 + 0x50],	%f2
	orn	%o6,	0x01CE,	%l4
	movleu	%xcc,	%g7,	%o1
	movvs	%xcc,	%g5,	%g3
	fcmpgt32	%f6,	%f14,	%i5
	fones	%f15
	orn	%o4,	0x007A,	%i6
	sdivcc	%i2,	0x0C7A,	%i4
	for	%f14,	%f22,	%f26
	lduh	[%l7 + 0x08],	%i0
	restore %l6, 0x134C, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f7,	%f24,	%f13
	array8	%g4,	%l3,	%l0
	fones	%f19
	fmovdcs	%xcc,	%f17,	%f15
	subc	%l1,	0x111D,	%o2
	movrlz	%o7,	%i3,	%l2
	edge32l	%o0,	%i1,	%o5
	ldx	[%l7 + 0x30],	%g1
	sllx	%g6,	%g2,	%o3
	xnorcc	%o6,	0x1153,	%i7
	movvs	%icc,	%g7,	%o1
	fmovsge	%icc,	%f17,	%f2
	edge32	%g5,	%g3,	%l4
	edge8	%o4,	%i6,	%i2
	ldub	[%l7 + 0x24],	%i5
	st	%f1,	[%l7 + 0x78]
	faligndata	%f10,	%f18,	%f4
	andn	%i0,	0x1564,	%i4
	movvc	%icc,	%l5,	%l6
	movg	%icc,	%l3,	%g4
	smul	%l0,	0x1B86,	%l1
	fmuld8sux16	%f7,	%f28,	%f16
	fnot1s	%f18,	%f18
	andcc	%o2,	0x01F8,	%i3
	edge32	%l2,	%o7,	%o0
	udiv	%i1,	0x00A4,	%o5
	movrlz	%g6,	%g2,	%g1
	fmovrdgz	%o3,	%f28,	%f6
	edge8	%o6,	%g7,	%i7
	stx	%g5,	[%l7 + 0x60]
	fnot2s	%f4,	%f13
	movne	%icc,	%o1,	%l4
	sir	0x1FAD
	sth	%g3,	[%l7 + 0x38]
	fmovdcs	%xcc,	%f6,	%f18
	smul	%o4,	0x13E8,	%i2
	movleu	%xcc,	%i5,	%i0
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	movcc	%icc,	%l6,	%l3
	sethi	0x1DA5,	%g4
	fzeros	%f18
	faligndata	%f30,	%f22,	%f16
	or	%l0,	0x04F0,	%l1
	xor	%l5,	%i3,	%o2
	stw	%l2,	[%l7 + 0x2C]
	movn	%xcc,	%o0,	%o7
	fmul8x16al	%f15,	%f2,	%f28
	lduw	[%l7 + 0x40],	%i1
	edge32l	%o5,	%g6,	%g1
	edge16l	%o3,	%o6,	%g2
	udiv	%g7,	0x1811,	%g5
	alignaddrl	%o1,	%l4,	%g3
	edge16ln	%i7,	%o4,	%i2
	sub	%i0,	%i5,	%i4
	sir	0x04FB
	fmovsne	%icc,	%f26,	%f8
	movrne	%i6,	0x2AE,	%l3
	stw	%l6,	[%l7 + 0x08]
	lduh	[%l7 + 0x68],	%l0
	xorcc	%l1,	%g4,	%i3
	andncc	%o2,	%l2,	%l5
	edge32l	%o7,	%i1,	%o5
	ld	[%l7 + 0x68],	%f5
	fornot2s	%f15,	%f29,	%f31
	movvc	%xcc,	%o0,	%g6
	fcmpeq16	%f30,	%f12,	%o3
	orcc	%o6,	0x0364,	%g1
	fpack32	%f16,	%f4,	%f0
	save %g2, %g5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%o1,	%g3,	%i7
	movge	%xcc,	%o4,	%l4
	udivx	%i2,	0x1F69,	%i0
	nop
	set	0x60, %i6
	stb	%i5,	[%l7 + %i6]
	movn	%icc,	%i4,	%l3
	orn	%i6,	0x18F0,	%l0
	fmovsge	%icc,	%f26,	%f31
	and	%l1,	0x1344,	%g4
	movcs	%xcc,	%l6,	%i3
	sdiv	%o2,	0x170E,	%l2
	movn	%icc,	%l5,	%o7
	fnands	%f5,	%f3,	%f22
	ldd	[%l7 + 0x70],	%o4
	fmovscs	%icc,	%f31,	%f21
	stb	%i1,	[%l7 + 0x55]
	mulscc	%o0,	%g6,	%o6
	xorcc	%o3,	0x0867,	%g1
	movre	%g2,	0x322,	%g7
	edge16	%o1,	%g3,	%g5
	alignaddr	%i7,	%o4,	%l4
	sll	%i0,	0x1C,	%i5
	fands	%f22,	%f3,	%f7
	save %i2, 0x0229, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f20,	%f13,	%f16
	subcc	%i6,	%l0,	%l1
	movn	%xcc,	%i4,	%l6
	andcc	%i3,	%o2,	%g4
	xorcc	%l5,	0x19C0,	%o7
	fabsd	%f18,	%f28
	edge8n	%l2,	%o5,	%i1
	ldx	[%l7 + 0x68],	%g6
	addc	%o0,	%o6,	%o3
	ld	[%l7 + 0x24],	%f8
	movn	%xcc,	%g2,	%g7
	movle	%xcc,	%g1,	%g3
	nop
	set	0x34, %g7
	lduw	[%l7 + %g7],	%o1
	sdiv	%i7,	0x0BAF,	%o4
	udivcc	%g5,	0x1CE3,	%l4
	fmovsg	%icc,	%f12,	%f31
	fmovrde	%i5,	%f2,	%f20
	fcmpne32	%f22,	%f26,	%i0
	fmovsleu	%xcc,	%f31,	%f19
	fabss	%f12,	%f4
	movpos	%xcc,	%l3,	%i2
	xorcc	%i6,	%l1,	%l0
	smulcc	%l6,	0x1039,	%i4
	subccc	%i3,	0x0C6E,	%o2
	fpadd16	%f22,	%f0,	%f22
	movrlz	%g4,	%l5,	%o7
	fpack32	%f20,	%f0,	%f14
	fmovscc	%icc,	%f17,	%f13
	fors	%f8,	%f7,	%f27
	sll	%l2,	0x02,	%o5
	fnot2s	%f9,	%f19
	movcc	%icc,	%g6,	%o0
	sdivcc	%i1,	0x0E27,	%o6
	subccc	%g2,	%g7,	%o3
	array32	%g3,	%o1,	%i7
	udiv	%g1,	0x0AC6,	%g5
	movge	%xcc,	%l4,	%o4
	sub	%i5,	0x0E0F,	%l3
	movneg	%xcc,	%i2,	%i6
	stx	%i0,	[%l7 + 0x68]
	edge32l	%l0,	%l6,	%l1
	movleu	%icc,	%i3,	%o2
	movvc	%xcc,	%i4,	%g4
	fmovdvs	%xcc,	%f16,	%f13
	edge8	%o7,	%l5,	%o5
	fandnot2	%f12,	%f16,	%f14
	srlx	%l2,	0x1C,	%g6
	movrlz	%i1,	%o6,	%g2
	movl	%xcc,	%g7,	%o3
	fmovsle	%xcc,	%f0,	%f18
	fmovsgu	%icc,	%f30,	%f3
	fmul8x16au	%f30,	%f20,	%f6
	fmovsn	%xcc,	%f12,	%f30
	edge16ln	%g3,	%o1,	%i7
	fornot1s	%f10,	%f13,	%f4
	fmovdl	%icc,	%f8,	%f31
	fpadd16	%f30,	%f10,	%f2
	udiv	%g1,	0x1368,	%o0
	movneg	%icc,	%g5,	%l4
	ldsh	[%l7 + 0x18],	%i5
	alignaddr	%o4,	%i2,	%i6
	mova	%xcc,	%l3,	%i0
	array32	%l6,	%l0,	%i3
	sll	%o2,	%i4,	%l1
	orncc	%o7,	0x1C27,	%l5
	fmovspos	%icc,	%f15,	%f6
	srl	%g4,	%l2,	%g6
	movpos	%icc,	%i1,	%o6
	edge32n	%g2,	%g7,	%o5
	movvc	%icc,	%o3,	%o1
	udiv	%g3,	0x0CD7,	%i7
	mova	%xcc,	%g1,	%g5
	movvs	%xcc,	%l4,	%i5
	fmovdl	%icc,	%f23,	%f1
	fcmpes	%fcc0,	%f9,	%f1
	edge16ln	%o0,	%i2,	%o4
	fmovrdlez	%l3,	%f22,	%f18
	or	%i0,	%l6,	%i6
	edge8l	%l0,	%i3,	%o2
	sdiv	%l1,	0x003E,	%o7
	movleu	%icc,	%i4,	%l5
	fmul8sux16	%f4,	%f14,	%f6
	sub	%l2,	0x00A5,	%g6
	array32	%i1,	%g4,	%g2
	andncc	%g7,	%o5,	%o6
	fornot2	%f14,	%f22,	%f2
	stw	%o3,	[%l7 + 0x1C]
	fnor	%f14,	%f30,	%f12
	stb	%g3,	[%l7 + 0x7D]
	add	%i7,	0x1AF8,	%g1
	fmovscc	%icc,	%f18,	%f22
	fmovsleu	%xcc,	%f12,	%f6
	orncc	%o1,	0x06D7,	%l4
	sth	%g5,	[%l7 + 0x56]
	sub	%o0,	%i5,	%i2
	sth	%o4,	[%l7 + 0x52]
	addccc	%l3,	%i0,	%i6
	movge	%xcc,	%l6,	%l0
	movpos	%xcc,	%i3,	%o2
	smulcc	%l1,	%i4,	%l5
	orcc	%l2,	0x15AC,	%g6
	sra	%i1,	0x1E,	%o7
	fnand	%f10,	%f2,	%f0
	orncc	%g2,	0x1FDE,	%g7
	ldd	[%l7 + 0x30],	%f6
	move	%icc,	%g4,	%o5
	movl	%xcc,	%o3,	%o6
	edge8l	%i7,	%g3,	%g1
	addccc	%l4,	0x13C1,	%o1
	fnegs	%f22,	%f12
	udivcc	%o0,	0x1971,	%g5
	ld	[%l7 + 0x24],	%f20
	edge8l	%i2,	%o4,	%l3
	movneg	%xcc,	%i5,	%i6
	alignaddr	%l6,	%i0,	%i3
	edge16	%l0,	%l1,	%i4
	movpos	%icc,	%l5,	%o2
	subc	%l2,	0x1C29,	%i1
	fexpand	%f28,	%f4
	sdiv	%o7,	0x0F42,	%g6
	fones	%f11
	subc	%g2,	%g7,	%o5
	fcmpne32	%f12,	%f6,	%g4
	sll	%o6,	0x0D,	%i7
	fnands	%f21,	%f30,	%f23
	sth	%g3,	[%l7 + 0x66]
	sdiv	%g1,	0x11D9,	%l4
	addcc	%o3,	%o1,	%g5
	fmovsgu	%icc,	%f30,	%f23
	edge16	%i2,	%o4,	%o0
	fmovsleu	%icc,	%f17,	%f24
	mulscc	%i5,	%i6,	%l3
	ldsw	[%l7 + 0x10],	%l6
	movrlz	%i0,	0x33E,	%i3
	or	%l0,	0x1F2B,	%l1
	movne	%icc,	%i4,	%l5
	fmovrdgez	%o2,	%f20,	%f28
	movrgz	%i1,	0x006,	%o7
	array32	%g6,	%l2,	%g2
	array8	%g7,	%g4,	%o6
	popc	0x1D98,	%i7
	srlx	%g3,	%o5,	%g1
	sdivx	%o3,	0x0259,	%l4
	umul	%g5,	0x1B7A,	%i2
	orncc	%o4,	0x051E,	%o1
	umul	%o0,	0x1E80,	%i6
	movle	%xcc,	%i5,	%l3
	movl	%xcc,	%i0,	%l6
	fmovsle	%icc,	%f17,	%f1
	array32	%l0,	%l1,	%i3
	fpsub32	%f28,	%f10,	%f10
	ldx	[%l7 + 0x68],	%i4
	ldsh	[%l7 + 0x74],	%l5
	movvs	%xcc,	%o2,	%o7
	orncc	%i1,	%l2,	%g6
	std	%f4,	[%l7 + 0x70]
	edge32n	%g2,	%g4,	%g7
	subc	%i7,	%o6,	%o5
	orncc	%g1,	%o3,	%l4
	nop
	set	0x66, %l0
	sth	%g5,	[%l7 + %l0]
	srl	%i2,	0x1F,	%g3
	edge16	%o1,	%o0,	%o4
	movne	%icc,	%i5,	%i6
	sra	%l3,	0x07,	%l6
	fnegs	%f15,	%f30
	xnor	%i0,	0x0CC6,	%l1
	subccc	%l0,	%i4,	%i3
	edge8ln	%l5,	%o2,	%o7
	umulcc	%l2,	0x1BC5,	%g6
	ldsw	[%l7 + 0x70],	%g2
	ldd	[%l7 + 0x08],	%f0
	edge16l	%g4,	%g7,	%i1
	movrlez	%i7,	%o6,	%g1
	movg	%icc,	%o5,	%o3
	and	%g5,	0x0205,	%l4
	fsrc1s	%f19,	%f20
	lduw	[%l7 + 0x40],	%g3
	umulcc	%i2,	0x0A09,	%o1
	fmovsge	%xcc,	%f0,	%f28
	sllx	%o4,	0x0F,	%o0
	umul	%i5,	%i6,	%l6
	ldsw	[%l7 + 0x28],	%l3
	movrlez	%l1,	0x3C3,	%l0
	ldx	[%l7 + 0x38],	%i4
	movneg	%xcc,	%i0,	%i3
	stw	%l5,	[%l7 + 0x60]
	stx	%o2,	[%l7 + 0x78]
	fnot2s	%f8,	%f11
	restore %l2, 0x037D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%o7,	%g2,	%g4
	orcc	%i1,	0x0EE4,	%g7
	fmuld8ulx16	%f9,	%f17,	%f28
	movcs	%xcc,	%i7,	%g1
	movrlz	%o5,	0x10F,	%o3
	ldub	[%l7 + 0x24],	%g5
	movrne	%l4,	%g3,	%i2
	fmovdl	%icc,	%f2,	%f0
	edge32l	%o1,	%o4,	%o0
	sllx	%i5,	%o6,	%l6
	st	%f0,	[%l7 + 0x6C]
	fcmpeq32	%f28,	%f16,	%l3
	fxnors	%f10,	%f24,	%f31
	edge32l	%l1,	%l0,	%i6
	movl	%xcc,	%i0,	%i4
	nop
	set	0x6B, %i3
	stb	%l5,	[%l7 + %i3]
	st	%f4,	[%l7 + 0x08]
	fxors	%f26,	%f10,	%f22
	movne	%xcc,	%i3,	%o2
	sethi	0x02A4,	%l2
	fmovse	%icc,	%f7,	%f11
	fone	%f10
	edge8n	%g6,	%o7,	%g2
	udivx	%g4,	0x0697,	%g7
	array16	%i7,	%g1,	%i1
	sdivcc	%o3,	0x18C6,	%g5
	srax	%l4,	%g3,	%o5
	array8	%i2,	%o1,	%o0
	sth	%i5,	[%l7 + 0x28]
	movge	%xcc,	%o4,	%l6
	fmovdleu	%icc,	%f29,	%f1
	xnor	%o6,	0x00A9,	%l1
	smulcc	%l0,	0x000B,	%i6
	srl	%l3,	%i4,	%l5
	movgu	%icc,	%i0,	%i3
	sll	%l2,	0x15,	%o2
	sth	%o7,	[%l7 + 0x72]
	edge32n	%g6,	%g2,	%g7
	sub	%i7,	%g1,	%g4
	edge16	%i1,	%g5,	%l4
	edge16	%o3,	%g3,	%i2
	movgu	%icc,	%o1,	%o5
	movn	%icc,	%i5,	%o0
	edge16l	%l6,	%o6,	%l1
	ldsw	[%l7 + 0x14],	%l0
	fnors	%f20,	%f0,	%f8
	srax	%o4,	%l3,	%i4
	move	%icc,	%i6,	%l5
	srlx	%i0,	0x13,	%l2
	edge32ln	%o2,	%o7,	%i3
	alignaddr	%g6,	%g2,	%g7
	movvs	%xcc,	%i7,	%g4
	ldsb	[%l7 + 0x30],	%i1
	fands	%f30,	%f9,	%f23
	subccc	%g5,	%g1,	%l4
	udivcc	%o3,	0x1BE8,	%i2
	subc	%g3,	0x04D8,	%o5
	ldd	[%l7 + 0x60],	%i4
	alignaddrl	%o0,	%o1,	%l6
	movrlz	%o6,	0x3A0,	%l0
	or	%o4,	%l1,	%l3
	add	%i6,	0x10D0,	%i4
	fabsd	%f28,	%f4
	mulx	%l5,	%l2,	%i0
	fmovdle	%xcc,	%f3,	%f1
	fmovdvc	%xcc,	%f11,	%f14
	movl	%icc,	%o7,	%i3
	addccc	%g6,	0x18EF,	%o2
	mova	%icc,	%g2,	%g7
	sir	0x0FAC
	sdivx	%i7,	0x04A5,	%i1
	movrne	%g5,	0x282,	%g4
	array32	%l4,	%o3,	%i2
	alignaddrl	%g1,	%g3,	%i5
	ld	[%l7 + 0x70],	%f26
	fmovda	%icc,	%f22,	%f22
	move	%xcc,	%o5,	%o0
	xor	%o1,	%l6,	%o6
	umulcc	%l0,	%o4,	%l1
	lduh	[%l7 + 0x44],	%l3
	xnorcc	%i4,	0x1ECD,	%l5
	srlx	%l2,	0x05,	%i6
	andcc	%i0,	%o7,	%g6
	fpack16	%f2,	%f3
	fcmpgt16	%f16,	%f10,	%i3
	sth	%g2,	[%l7 + 0x58]
	movvc	%icc,	%g7,	%i7
	movge	%icc,	%i1,	%g5
	andncc	%g4,	%o2,	%o3
	movcc	%icc,	%i2,	%l4
	movvc	%icc,	%g3,	%i5
	edge32ln	%g1,	%o0,	%o5
	movne	%icc,	%o1,	%o6
	edge32	%l6,	%o4,	%l1
	and	%l0,	%l3,	%i4
	movvc	%xcc,	%l2,	%i6
	movrgz	%i0,	0x131,	%o7
	addcc	%g6,	0x0E68,	%i3
	lduw	[%l7 + 0x40],	%l5
	alignaddrl	%g7,	%g2,	%i7
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	array32	%o3,	%i2,	%g4
	edge16l	%l4,	%g3,	%g1
	fmovspos	%xcc,	%f12,	%f4
	fxnor	%f18,	%f26,	%f30
	movg	%icc,	%o0,	%i5
	fsrc1s	%f20,	%f10
	fnot2	%f12,	%f6
	nop
	set	0x30, %i5
	stx	%o1,	[%l7 + %i5]
	movpos	%icc,	%o5,	%l6
	ldub	[%l7 + 0x0F],	%o6
	sdivx	%o4,	0x0EEE,	%l0
	xnorcc	%l3,	0x1F14,	%i4
	or	%l2,	%l1,	%i0
	srl	%i6,	0x07,	%g6
	move	%icc,	%o7,	%l5
	movle	%xcc,	%i3,	%g7
	fmovdcs	%icc,	%f26,	%f9
	movrne	%g2,	%g5,	%i7
	sethi	0x0C8C,	%o2
	faligndata	%f20,	%f2,	%f24
	array32	%o3,	%i2,	%i1
	movre	%l4,	%g3,	%g1
	edge16l	%o0,	%i5,	%g4
	smul	%o1,	0x13D4,	%o5
	fandnot1	%f6,	%f12,	%f18
	movleu	%icc,	%l6,	%o4
	fornot2	%f16,	%f10,	%f24
	fcmped	%fcc3,	%f20,	%f8
	sth	%l0,	[%l7 + 0x40]
	fand	%f14,	%f12,	%f10
	orncc	%l3,	%i4,	%l2
	movre	%l1,	%i0,	%i6
	fnegs	%f19,	%f13
	edge32n	%o6,	%o7,	%g6
	orcc	%i3,	%l5,	%g2
	ldsw	[%l7 + 0x74],	%g5
	fcmpes	%fcc0,	%f0,	%f14
	movre	%g7,	0x180,	%o2
	edge32n	%o3,	%i2,	%i7
	movneg	%icc,	%i1,	%g3
	edge32	%g1,	%l4,	%o0
	sth	%g4,	[%l7 + 0x5E]
	fmovrdgz	%i5,	%f24,	%f0
	alignaddr	%o5,	%l6,	%o4
	mova	%icc,	%l0,	%o1
	alignaddr	%i4,	%l2,	%l3
	array16	%i0,	%l1,	%o6
	fnand	%f0,	%f30,	%f18
	movl	%xcc,	%o7,	%i6
	fnand	%f26,	%f30,	%f8
	addc	%i3,	0x16AD,	%l5
	orncc	%g2,	%g6,	%g5
	orn	%g7,	0x197C,	%o3
	ldsb	[%l7 + 0x7F],	%i2
	srl	%o2,	%i7,	%g3
	restore %i1, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f2,	%f6
	movcc	%xcc,	%g4,	%l4
	pdist	%f6,	%f16,	%f26
	fmovrsne	%o5,	%f14,	%f21
	umul	%l6,	%o4,	%i5
	array32	%l0,	%i4,	%l2
	udivcc	%l3,	0x08F4,	%i0
	array32	%l1,	%o6,	%o7
	save %i6, %i3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5F],	%g2
	subccc	%g6,	%l5,	%g5
	std	%f30,	[%l7 + 0x28]
	array8	%g7,	%o3,	%i2
	orcc	%i7,	%o2,	%g3
	edge32	%i1,	%g1,	%g4
	sdivcc	%l4,	0x036E,	%o0
	xorcc	%o5,	0x0F1F,	%l6
	movl	%xcc,	%o4,	%i5
	array32	%i4,	%l2,	%l3
	orn	%i0,	0x09DD,	%l0
	ldsw	[%l7 + 0x2C],	%o6
	smul	%l1,	%o7,	%i3
	fands	%f8,	%f4,	%f17
	ldx	[%l7 + 0x50],	%o1
	movrne	%g2,	%i6,	%l5
	fabsd	%f20,	%f2
	fmul8sux16	%f30,	%f16,	%f26
	xor	%g5,	0x08FA,	%g7
	array8	%o3,	%i2,	%g6
	edge8ln	%o2,	%i7,	%g3
	fands	%f13,	%f8,	%f27
	fnand	%f30,	%f2,	%f2
	array16	%g1,	%i1,	%l4
	fnot2	%f6,	%f20
	fmovscc	%xcc,	%f14,	%f20
	fnot2s	%f14,	%f13
	mulscc	%g4,	%o0,	%l6
	sethi	0x1010,	%o4
	fmovdneg	%icc,	%f22,	%f6
	fmovsvc	%icc,	%f26,	%f1
	movrlez	%i5,	%o5,	%i4
	fcmpne16	%f0,	%f26,	%l2
	xnor	%l3,	0x0FA4,	%i0
	lduh	[%l7 + 0x0C],	%o6
	addccc	%l1,	%o7,	%l0
	movpos	%xcc,	%i3,	%g2
	add	%i6,	0x0236,	%o1
	edge16l	%l5,	%g7,	%o3
	fmovrdgez	%g5,	%f6,	%f2
	fsrc1	%f0,	%f6
	siam	0x7
	movn	%xcc,	%g6,	%i2
	movcc	%xcc,	%o2,	%g3
	fpack32	%f2,	%f14,	%f16
	add	%i7,	%g1,	%i1
	array8	%l4,	%o0,	%g4
	fpsub16	%f4,	%f20,	%f0
	movcs	%icc,	%o4,	%l6
	edge16ln	%o5,	%i5,	%l2
	orcc	%i4,	%i0,	%o6
	mulx	%l1,	%l3,	%o7
	popc	0x0C9C,	%l0
	srlx	%i3,	0x19,	%g2
	ldsh	[%l7 + 0x48],	%o1
	movn	%icc,	%l5,	%i6
	fnot1	%f28,	%f8
	fcmpeq32	%f14,	%f0,	%o3
	and	%g5,	0x0705,	%g7
	nop
	set	0x28, %i4
	sth	%g6,	[%l7 + %i4]
	ldsb	[%l7 + 0x7E],	%i2
	alignaddr	%o2,	%g3,	%i7
	fpsub32s	%f9,	%f31,	%f14
	movrgez	%i1,	%l4,	%o0
	movpos	%xcc,	%g4,	%g1
	fnegs	%f13,	%f29
	alignaddr	%l6,	%o4,	%o5
	movre	%i5,	0x154,	%i4
	orncc	%i0,	%o6,	%l1
	faligndata	%f4,	%f14,	%f6
	movrgz	%l2,	%l3,	%o7
	bshuffle	%f4,	%f10,	%f26
	movrgez	%i3,	%g2,	%l0
	fandnot1s	%f16,	%f21,	%f25
	fmovrdne	%l5,	%f24,	%f10
	array8	%o1,	%o3,	%g5
	fmovscs	%xcc,	%f12,	%f25
	movneg	%xcc,	%g7,	%i6
	srlx	%i2,	0x04,	%o2
	edge8	%g3,	%i7,	%g6
	ldsw	[%l7 + 0x64],	%i1
	ldsh	[%l7 + 0x16],	%l4
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	fcmpne32	%f20,	%f16,	%o4
	movn	%xcc,	%l6,	%i5
	ldd	[%l7 + 0x20],	%i4
	lduh	[%l7 + 0x5C],	%i0
	fmovrse	%o6,	%f0,	%f22
	lduh	[%l7 + 0x1C],	%l1
	movrgz	%o5,	%l3,	%o7
	smul	%l2,	0x1A77,	%g2
	edge8ln	%l0,	%i3,	%o1
	fmovrsgez	%l5,	%f8,	%f11
	sllx	%o3,	%g7,	%g5
	sth	%i6,	[%l7 + 0x44]
	ld	[%l7 + 0x50],	%f2
	movg	%icc,	%i2,	%o2
	mova	%xcc,	%g3,	%i7
	movge	%icc,	%i1,	%l4
	xnorcc	%g4,	%g6,	%o0
	array32	%o4,	%l6,	%g1
	fornot2s	%f15,	%f19,	%f7
	movrlez	%i4,	%i0,	%o6
	mulscc	%l1,	%o5,	%l3
	udiv	%o7,	0x194E,	%i5
	fmovda	%icc,	%f16,	%f5
	ldx	[%l7 + 0x58],	%l2
	fmuld8ulx16	%f31,	%f16,	%f20
	udiv	%l0,	0x13E9,	%g2
	sdivcc	%o1,	0x1317,	%l5
	sllx	%i3,	%g7,	%g5
	ldsh	[%l7 + 0x64],	%i6
	fcmped	%fcc3,	%f28,	%f24
	lduh	[%l7 + 0x62],	%o3
	srlx	%o2,	0x13,	%g3
	sdiv	%i2,	0x1786,	%i7
	addcc	%l4,	0x1890,	%g4
	fornot1s	%f4,	%f15,	%f6
	srlx	%g6,	%o0,	%i1
	stw	%o4,	[%l7 + 0x68]
	fmovrdne	%g1,	%f14,	%f10
	fmul8x16	%f13,	%f8,	%f14
	alignaddrl	%i4,	%l6,	%o6
	edge16n	%i0,	%o5,	%l3
	lduw	[%l7 + 0x10],	%l1
	andncc	%i5,	%l2,	%l0
	ldd	[%l7 + 0x40],	%f0
	stb	%o7,	[%l7 + 0x4D]
	fmovsne	%xcc,	%f5,	%f3
	srl	%o1,	%g2,	%i3
	srl	%g7,	0x05,	%g5
	sdiv	%i6,	0x0FBB,	%l5
	movrlez	%o2,	0x144,	%o3
	sra	%g3,	%i2,	%i7
	sir	0x0A7D
	fandnot2s	%f31,	%f3,	%f30
	ldx	[%l7 + 0x20],	%g4
	ldsh	[%l7 + 0x2A],	%g6
	sdivx	%o0,	0x08FF,	%l4
	subccc	%i1,	%o4,	%g1
	sra	%i4,	%o6,	%l6
	sdiv	%i0,	0x0F31,	%o5
	sub	%l3,	%i5,	%l2
	fmul8sux16	%f8,	%f2,	%f16
	movvs	%icc,	%l1,	%o7
	addcc	%o1,	%g2,	%i3
	mulscc	%l0,	0x0143,	%g7
	fmovdcs	%icc,	%f16,	%f19
	edge32n	%i6,	%l5,	%g5
	movpos	%xcc,	%o2,	%g3
	fornot2	%f14,	%f0,	%f2
	orncc	%o3,	%i7,	%i2
	edge8ln	%g4,	%g6,	%o0
	fmovde	%xcc,	%f21,	%f24
	fmul8x16	%f7,	%f30,	%f0
	subccc	%l4,	0x15AA,	%o4
	subcc	%i1,	0x17D1,	%g1
	subcc	%o6,	0x086E,	%l6
	movre	%i0,	0x0B2,	%i4
	fmovsl	%xcc,	%f14,	%f9
	movvs	%xcc,	%l3,	%i5
	sdivx	%o5,	0x17EB,	%l2
	movrne	%l1,	0x34E,	%o1
	ld	[%l7 + 0x38],	%f25
	movleu	%xcc,	%g2,	%o7
	movn	%xcc,	%i3,	%l0
	orcc	%g7,	%i6,	%l5
	fmuld8ulx16	%f30,	%f16,	%f24
	edge8l	%g5,	%o2,	%o3
	movrne	%i7,	%i2,	%g3
	movvc	%xcc,	%g6,	%g4
	edge16l	%l4,	%o0,	%i1
	fzero	%f10
	edge16	%g1,	%o4,	%l6
	sdivx	%i0,	0x04A3,	%o6
	movrgez	%i4,	0x14E,	%l3
	addcc	%i5,	%l2,	%l1
	movgu	%icc,	%o5,	%o1
	fnands	%f7,	%f3,	%f2
	array8	%o7,	%i3,	%g2
	fmovdleu	%xcc,	%f1,	%f26
	fmovsa	%xcc,	%f19,	%f26
	srlx	%g7,	0x00,	%l0
	smulcc	%l5,	0x0081,	%i6
	movvs	%xcc,	%o2,	%g5
	fandnot2s	%f23,	%f28,	%f12
	movvc	%icc,	%o3,	%i7
	ldsh	[%l7 + 0x18],	%i2
	mova	%xcc,	%g3,	%g6
	smulcc	%l4,	%g4,	%i1
	xorcc	%g1,	%o0,	%l6
	movgu	%icc,	%o4,	%i0
	st	%f10,	[%l7 + 0x40]
	movrgz	%o6,	0x235,	%l3
	fsrc2s	%f15,	%f16
	edge32n	%i5,	%l2,	%i4
	fpsub16	%f2,	%f20,	%f26
	movcc	%xcc,	%l1,	%o1
	fmovspos	%icc,	%f13,	%f1
	fzero	%f24
	smulcc	%o7,	%o5,	%i3
	and	%g2,	%l0,	%l5
	fcmpd	%fcc0,	%f14,	%f26
	movrgz	%i6,	%o2,	%g7
	movrgz	%g5,	%o3,	%i2
	fmovrsne	%i7,	%f21,	%f26
	srl	%g6,	0x1B,	%g3
	subcc	%l4,	0x1508,	%i1
	fmovs	%f5,	%f18
	st	%f31,	[%l7 + 0x34]
	addc	%g1,	%g4,	%o0
	movcc	%xcc,	%o4,	%i0
	movgu	%icc,	%l6,	%o6
	addccc	%i5,	0x0D0E,	%l2
	and	%i4,	%l3,	%l1
	nop
	set	0x7C, %l6
	stw	%o1,	[%l7 + %l6]
	orcc	%o5,	%o7,	%i3
	edge16ln	%l0,	%g2,	%l5
	movpos	%icc,	%o2,	%g7
	fsrc1	%f20,	%f12
	edge32	%i6,	%g5,	%o3
	fors	%f19,	%f10,	%f23
	orn	%i7,	0x08F0,	%g6
	movre	%i2,	0x212,	%g3
	fmovsge	%icc,	%f2,	%f20
	fnot2	%f20,	%f20
	movne	%xcc,	%i1,	%l4
	edge16l	%g1,	%g4,	%o0
	srlx	%o4,	0x16,	%l6
	movrlez	%o6,	%i0,	%i5
	ldsw	[%l7 + 0x44],	%l2
	srl	%i4,	0x16,	%l1
	array32	%l3,	%o1,	%o7
	movleu	%icc,	%i3,	%l0
	alignaddrl	%g2,	%o5,	%l5
	fcmpes	%fcc0,	%f28,	%f6
	sdiv	%o2,	0x1016,	%i6
	fmovsgu	%icc,	%f31,	%f23
	subccc	%g5,	%g7,	%o3
	movg	%icc,	%g6,	%i7
	ldd	[%l7 + 0x48],	%g2
	fpadd16	%f0,	%f6,	%f12
	umulcc	%i1,	%i2,	%g1
	umul	%g4,	0x1EEE,	%o0
	movneg	%xcc,	%l4,	%l6
	fmovdcs	%icc,	%f4,	%f3
	fpadd32s	%f10,	%f5,	%f9
	movrlz	%o4,	%i0,	%i5
	xnorcc	%o6,	0x14A3,	%i4
	edge8ln	%l1,	%l3,	%o1
	nop
	set	0x30, %o0
	ldx	[%l7 + %o0],	%o7
	fmovsne	%xcc,	%f18,	%f5
	fcmpd	%fcc3,	%f30,	%f8
	smul	%i3,	%l0,	%l2
	xor	%g2,	%l5,	%o5
	subcc	%o2,	0x0207,	%i6
	smulcc	%g7,	0x1767,	%g5
	movle	%icc,	%g6,	%o3
	sdivx	%g3,	0x0EAE,	%i7
	ldub	[%l7 + 0x3F],	%i2
	alignaddrl	%i1,	%g4,	%o0
	ldx	[%l7 + 0x48],	%l4
	subc	%l6,	%o4,	%i0
	edge8n	%i5,	%o6,	%i4
	edge8l	%l1,	%g1,	%l3
	ldsw	[%l7 + 0x64],	%o1
	fnot2	%f0,	%f2
	add	%i3,	0x1080,	%o7
	movrlz	%l0,	%l2,	%g2
	sdivcc	%l5,	0x0D0A,	%o5
	edge32ln	%o2,	%g7,	%i6
	fcmpeq16	%f6,	%f12,	%g5
	sllx	%g6,	0x0B,	%o3
	smulcc	%i7,	%g3,	%i1
	sdivx	%g4,	0x07E6,	%o0
	fpack16	%f8,	%f21
	xnorcc	%i2,	0x1CF4,	%l4
	fornot1s	%f17,	%f6,	%f15
	ldd	[%l7 + 0x78],	%i6
	st	%f1,	[%l7 + 0x0C]
	fsrc1s	%f27,	%f30
	save %i0, %o4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o6,	%l1
	fnot1	%f12,	%f18
	ldub	[%l7 + 0x75],	%i4
	array8	%l3,	%g1,	%o1
	fxor	%f12,	%f28,	%f30
	std	%f2,	[%l7 + 0x68]
	ldd	[%l7 + 0x70],	%f30
	mulx	%i3,	%l0,	%l2
	fpmerge	%f4,	%f31,	%f12
	sth	%g2,	[%l7 + 0x4E]
	add	%l5,	0x0A0D,	%o7
	sdivx	%o5,	0x07B1,	%g7
	ldsw	[%l7 + 0x4C],	%o2
	fmul8sux16	%f0,	%f28,	%f8
	edge32l	%i6,	%g6,	%g5
	ldx	[%l7 + 0x38],	%i7
	mulx	%g3,	%i1,	%o3
	udivcc	%o0,	0x0FF9,	%g4
	ldd	[%l7 + 0x30],	%i2
	xorcc	%l4,	0x138F,	%i0
	udivcc	%l6,	0x0164,	%i5
	andncc	%o4,	%o6,	%l1
	movge	%icc,	%i4,	%g1
	subcc	%o1,	0x15CE,	%i3
	mulscc	%l0,	0x0E8A,	%l2
	and	%g2,	0x0628,	%l3
	movne	%icc,	%l5,	%o7
	subccc	%o5,	0x02DD,	%o2
	restore %g7, %g6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i6,	%g3,	%i7
	fxnors	%f15,	%f25,	%f8
	fnand	%f18,	%f14,	%f6
	fnor	%f16,	%f24,	%f22
	alignaddrl	%o3,	%i1,	%g4
	sra	%o0,	0x1D,	%i2
	xorcc	%l4,	0x0F47,	%i0
	edge16	%l6,	%i5,	%o4
	movrgz	%o6,	0x101,	%i4
	xnorcc	%g1,	0x0D06,	%o1
	movne	%icc,	%l1,	%l0
	movg	%icc,	%l2,	%g2
	movneg	%xcc,	%l3,	%i3
	movre	%o7,	%l5,	%o2
	addc	%g7,	0x1D32,	%g6
	fmovdne	%xcc,	%f2,	%f17
	fzero	%f4
	movrlez	%o5,	%i6,	%g5
	edge16	%g3,	%i7,	%i1
	stb	%o3,	[%l7 + 0x4B]
	std	%f26,	[%l7 + 0x40]
	mulscc	%g4,	%o0,	%i2
	mova	%icc,	%l4,	%l6
	fmovrdlez	%i5,	%f24,	%f24
	movgu	%icc,	%o4,	%i0
	movvc	%xcc,	%o6,	%g1
	array32	%i4,	%o1,	%l1
	fmovda	%xcc,	%f24,	%f24
	movl	%xcc,	%l2,	%l0
	stx	%l3,	[%l7 + 0x50]
	udivx	%i3,	0x042B,	%o7
	andn	%l5,	%o2,	%g2
	movg	%xcc,	%g7,	%o5
	sethi	0x0F95,	%g6
	fmovdneg	%xcc,	%f16,	%f6
	fsrc2	%f28,	%f2
	sir	0x0E9D
	fpadd32	%f14,	%f6,	%f22
	lduw	[%l7 + 0x6C],	%g5
	or	%i6,	0x0B6C,	%i7
	udivx	%g3,	0x093D,	%o3
	fmovs	%f9,	%f24
	udivcc	%i1,	0x0094,	%g4
	ldd	[%l7 + 0x68],	%f8
	fmovrse	%i2,	%f16,	%f23
	fmovda	%xcc,	%f24,	%f16
	srlx	%l4,	0x05,	%o0
	fmovse	%xcc,	%f0,	%f27
	fpadd16	%f4,	%f14,	%f10
	fmovdne	%xcc,	%f26,	%f31
	udivx	%l6,	0x1CFD,	%o4
	umul	%i5,	0x04FF,	%o6
	nop
	set	0x74, %g6
	stb	%i0,	[%l7 + %g6]
	edge16	%g1,	%i4,	%o1
	fzero	%f10
	srl	%l1,	0x1D,	%l0
	fcmpgt32	%f18,	%f10,	%l2
	fmovspos	%xcc,	%f6,	%f25
	movge	%xcc,	%i3,	%l3
	movrlez	%o7,	0x16F,	%l5
	srl	%g2,	0x05,	%o2
	movcs	%xcc,	%g7,	%o5
	edge32l	%g5,	%i6,	%i7
	ldd	[%l7 + 0x38],	%g6
	fmovs	%f28,	%f28
	ldsw	[%l7 + 0x50],	%g3
	fcmpd	%fcc0,	%f18,	%f0
	movrlez	%i1,	0x2F6,	%g4
	sdivcc	%o3,	0x1BBF,	%l4
	xor	%o0,	%l6,	%i2
	fcmps	%fcc0,	%f22,	%f13
	udivx	%i5,	0x06E7,	%o4
	orcc	%o6,	%g1,	%i0
	fmovrdgz	%i4,	%f14,	%f2
	xnor	%l1,	0x0FC8,	%l0
	fmovscs	%xcc,	%f13,	%f9
	edge16n	%o1,	%l2,	%l3
	sth	%o7,	[%l7 + 0x78]
	xorcc	%i3,	0x0A76,	%g2
	movpos	%xcc,	%o2,	%g7
	lduh	[%l7 + 0x6C],	%o5
	ld	[%l7 + 0x54],	%f0
	orcc	%g5,	0x1A54,	%l5
	movg	%xcc,	%i6,	%i7
	andn	%g6,	0x10C9,	%g3
	fandnot1s	%f17,	%f15,	%f17
	mova	%xcc,	%g4,	%i1
	sdivcc	%o3,	0x1ECD,	%l4
	movrne	%o0,	%i2,	%l6
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	subc	%g1,	0x0EEA,	%i0
	fand	%f0,	%f16,	%f6
	fmovs	%f10,	%f3
	edge16n	%o4,	%i4,	%l0
	fnot1	%f24,	%f28
	fmovrdgez	%o1,	%f20,	%f6
	fmovdn	%icc,	%f11,	%f27
	ldsh	[%l7 + 0x38],	%l2
	fmovrdne	%l3,	%f24,	%f18
	stx	%l1,	[%l7 + 0x48]
	sub	%o7,	%g2,	%o2
	stw	%g7,	[%l7 + 0x30]
	fmovsgu	%icc,	%f1,	%f1
	edge16ln	%o5,	%g5,	%l5
	edge8n	%i6,	%i7,	%g6
	sir	0x15EE
	or	%g3,	0x054A,	%i3
	fmovrse	%i1,	%f26,	%f13
	mova	%icc,	%o3,	%l4
	fpmerge	%f29,	%f15,	%f0
	mova	%icc,	%g4,	%o0
	sll	%i2,	%l6,	%o6
	ld	[%l7 + 0x30],	%f27
	edge8	%g1,	%i5,	%i0
	movgu	%icc,	%o4,	%l0
	subcc	%i4,	0x072C,	%l2
	fcmpne16	%f10,	%f18,	%o1
	ld	[%l7 + 0x14],	%f21
	movl	%xcc,	%l1,	%o7
	fmovdcs	%icc,	%f9,	%f0
	edge32l	%l3,	%g2,	%o2
	fmovsa	%xcc,	%f16,	%f13
	subcc	%o5,	%g7,	%g5
	srl	%i6,	%l5,	%g6
	fmovdleu	%xcc,	%f11,	%f1
	fmovsgu	%icc,	%f13,	%f13
	ldx	[%l7 + 0x50],	%g3
	edge32l	%i7,	%i1,	%i3
	fors	%f2,	%f14,	%f22
	udiv	%l4,	0x06C9,	%g4
	fmovsvs	%xcc,	%f28,	%f29
	movrlz	%o0,	0x255,	%o3
	movg	%icc,	%l6,	%o6
	subcc	%i2,	0x0C4B,	%i5
	orncc	%g1,	0x0D01,	%i0
	srlx	%o4,	0x0C,	%l0
	andncc	%i4,	%o1,	%l2
	fmovdg	%xcc,	%f1,	%f7
	subccc	%o7,	0x191E,	%l1
	fpack32	%f20,	%f0,	%f0
	sdivcc	%g2,	0x17D2,	%o2
	movvs	%icc,	%l3,	%o5
	sdivcc	%g5,	0x0703,	%i6
	srax	%l5,	%g6,	%g3
	alignaddrl	%i7,	%i1,	%g7
	stw	%l4,	[%l7 + 0x08]
	fcmpne32	%f8,	%f28,	%i3
	stw	%o0,	[%l7 + 0x18]
	movleu	%icc,	%o3,	%g4
	movrlz	%l6,	0x33E,	%i2
	addccc	%i5,	%o6,	%i0
	lduw	[%l7 + 0x08],	%o4
	xor	%g1,	0x14A3,	%l0
	ldub	[%l7 + 0x66],	%o1
	fmovsne	%icc,	%f3,	%f27
	edge16	%i4,	%o7,	%l1
	nop
	set	0x40, %i1
	lduw	[%l7 + %i1],	%g2
	lduh	[%l7 + 0x64],	%l2
	fcmpeq32	%f4,	%f10,	%o2
	array16	%l3,	%g5,	%i6
	fsrc1s	%f23,	%f17
	fxnor	%f4,	%f16,	%f4
	movg	%icc,	%o5,	%l5
	sra	%g3,	%i7,	%i1
	addccc	%g6,	%l4,	%g7
	ldsb	[%l7 + 0x23],	%i3
	movne	%icc,	%o3,	%g4
	addccc	%l6,	0x1CAC,	%o0
	andncc	%i5,	%o6,	%i0
	fmovrdlz	%o4,	%f10,	%f24
	edge16n	%g1,	%l0,	%o1
	nop
	set	0x30, %g1
	lduw	[%l7 + %g1],	%i2
	udivcc	%i4,	0x08C9,	%o7
	lduw	[%l7 + 0x2C],	%l1
	fcmpes	%fcc3,	%f25,	%f28
	mulx	%l2,	%g2,	%o2
	stw	%l3,	[%l7 + 0x74]
	ld	[%l7 + 0x2C],	%f25
	addcc	%g5,	%i6,	%o5
	fpadd32	%f30,	%f14,	%f2
	sdiv	%l5,	0x1F88,	%g3
	movleu	%icc,	%i7,	%i1
	ldsw	[%l7 + 0x38],	%g6
	sdivx	%g7,	0x1625,	%i3
	movcc	%icc,	%l4,	%g4
	smulcc	%o3,	%l6,	%o0
	fcmps	%fcc3,	%f13,	%f17
	fandnot1	%f4,	%f22,	%f12
	edge32ln	%o6,	%i5,	%i0
	movcs	%icc,	%g1,	%l0
	save %o1, 0x0109, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x30],	%f8
	xnor	%i4,	0x144C,	%o7
	movne	%icc,	%i2,	%l2
	array8	%l1,	%o2,	%l3
	sdivx	%g2,	0x026E,	%g5
	movpos	%xcc,	%o5,	%i6
	save %g3, 0x0C23, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x51],	%l5
	fabsd	%f0,	%f18
	edge32	%i1,	%g7,	%g6
	andn	%i3,	%l4,	%g4
	srlx	%l6,	0x12,	%o3
	fmovsleu	%icc,	%f2,	%f9
	movre	%o6,	0x291,	%o0
	udivx	%i5,	0x0BF6,	%i0
	umulcc	%g1,	%o1,	%o4
	ldsw	[%l7 + 0x3C],	%i4
	fsrc2s	%f6,	%f7
	sdivx	%l0,	0x1679,	%i2
	sra	%o7,	0x0E,	%l2
	fxnor	%f24,	%f12,	%f28
	st	%f21,	[%l7 + 0x3C]
	movrgez	%o2,	0x0DD,	%l1
	fpsub32	%f14,	%f24,	%f24
	alignaddr	%l3,	%g5,	%o5
	udivx	%i6,	0x0B5A,	%g2
	orcc	%i7,	0x1091,	%g3
	mulscc	%l5,	0x1863,	%g7
	srl	%g6,	0x16,	%i1
	sethi	0x0BAB,	%l4
	orncc	%g4,	0x023F,	%i3
	movpos	%xcc,	%o3,	%o6
	movpos	%icc,	%l6,	%o0
	orncc	%i0,	0x141C,	%i5
	edge16ln	%g1,	%o1,	%i4
	edge32	%o4,	%i2,	%l0
	stx	%o7,	[%l7 + 0x28]
	movrgz	%o2,	0x17D,	%l1
	umulcc	%l3,	%l2,	%o5
	movcs	%xcc,	%i6,	%g5
	movge	%icc,	%i7,	%g3
	sub	%l5,	0x176E,	%g7
	sra	%g2,	0x13,	%i1
	edge8n	%l4,	%g6,	%i3
	smul	%g4,	%o3,	%l6
	sdivcc	%o6,	0x06D5,	%o0
	ldub	[%l7 + 0x62],	%i5
	mulscc	%g1,	%i0,	%o1
	ldx	[%l7 + 0x10],	%i4
	lduh	[%l7 + 0x12],	%i2
	movrgez	%l0,	0x158,	%o4
	movgu	%xcc,	%o7,	%l1
	subcc	%o2,	%l3,	%l2
	movrlz	%o5,	0x276,	%i6
	lduw	[%l7 + 0x64],	%i7
	movrlz	%g5,	%g3,	%g7
	fnands	%f13,	%f15,	%f17
	stw	%l5,	[%l7 + 0x30]
	sir	0x082D
	sdiv	%i1,	0x17C0,	%l4
	udivcc	%g6,	0x023C,	%i3
	movrne	%g4,	%g2,	%o3
	popc	0x11BF,	%l6
	movrlez	%o6,	0x3BB,	%o0
	addcc	%g1,	0x0766,	%i0
	movvc	%xcc,	%i5,	%i4
	ldd	[%l7 + 0x58],	%f18
	andcc	%i2,	0x112A,	%l0
	movg	%xcc,	%o4,	%o1
	ldsw	[%l7 + 0x60],	%o7
	fmovdpos	%xcc,	%f9,	%f1
	andncc	%o2,	%l3,	%l2
	movvc	%icc,	%l1,	%o5
	sub	%i6,	%i7,	%g5
	sll	%g3,	0x0E,	%g7
	srax	%i1,	0x1A,	%l4
	edge16ln	%l5,	%g6,	%g4
	movrlez	%g2,	%o3,	%l6
	fcmpeq32	%f12,	%f12,	%i3
	udiv	%o0,	0x03B0,	%o6
	fmovrdlz	%g1,	%f20,	%f10
	xnor	%i0,	0x1F3D,	%i4
	sdivx	%i5,	0x1421,	%i2
	st	%f23,	[%l7 + 0x60]
	fmovdn	%xcc,	%f5,	%f18
	alignaddr	%o4,	%l0,	%o1
	add	%o2,	0x032F,	%l3
	udiv	%l2,	0x0DA2,	%o7
	umul	%o5,	0x03D3,	%i6
	ldd	[%l7 + 0x18],	%f0
	movrlz	%l1,	%i7,	%g3
	ldd	[%l7 + 0x48],	%f20
	fmovsne	%icc,	%f31,	%f17
	edge32	%g7,	%i1,	%l4
	movg	%icc,	%g5,	%l5
	fandnot2s	%f22,	%f28,	%f4
	movneg	%icc,	%g6,	%g2
	fmovrsne	%g4,	%f25,	%f3
	movge	%icc,	%o3,	%i3
	orn	%l6,	0x1680,	%o6
	move	%xcc,	%o0,	%i0
	alignaddr	%i4,	%g1,	%i5
	fmul8ulx16	%f6,	%f8,	%f22
	sub	%o4,	0x18E0,	%l0
	fornot2	%f22,	%f22,	%f6
	edge8l	%i2,	%o1,	%l3
	ldsw	[%l7 + 0x54],	%l2
	ldx	[%l7 + 0x10],	%o2
	udiv	%o7,	0x1264,	%i6
	srlx	%o5,	%l1,	%i7
	movneg	%icc,	%g3,	%i1
	ldsh	[%l7 + 0x34],	%l4
	subccc	%g7,	0x117D,	%g5
	movg	%xcc,	%l5,	%g6
	fmul8x16al	%f21,	%f9,	%f28
	movpos	%icc,	%g2,	%o3
	array32	%g4,	%l6,	%o6
	movn	%icc,	%o0,	%i0
	sra	%i3,	%g1,	%i4
	addccc	%i5,	%l0,	%o4
	ld	[%l7 + 0x48],	%f3
	orcc	%i2,	0x06D3,	%l3
	andcc	%o1,	%l2,	%o2
	movcs	%xcc,	%i6,	%o5
	movpos	%xcc,	%l1,	%i7
	save %o7, 0x12E9, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%g3,	%g7
	restore %g5, %l4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x10],	%f10
	fmovsa	%icc,	%f28,	%f31
	sth	%l5,	[%l7 + 0x22]
	movle	%xcc,	%g2,	%g4
	fmovd	%f28,	%f20
	movrlz	%l6,	%o3,	%o0
	edge32l	%o6,	%i0,	%g1
	movvc	%xcc,	%i3,	%i4
	xor	%l0,	0x1025,	%o4
	edge32ln	%i2,	%i5,	%l3
	fmovrdlez	%l2,	%f20,	%f28
	movl	%xcc,	%o2,	%i6
	fornot1s	%f23,	%f6,	%f17
	movrne	%o5,	%l1,	%i7
	edge32n	%o1,	%o7,	%g3
	sir	0x0AA3
	fmovse	%xcc,	%f3,	%f26
	array8	%i1,	%g7,	%g5
	subccc	%g6,	%l4,	%g2
	edge32	%l5,	%l6,	%g4
	fmul8x16au	%f0,	%f8,	%f8
	orn	%o0,	0x0061,	%o6
	ldsw	[%l7 + 0x30],	%i0
	fmovrde	%o3,	%f30,	%f20
	and	%i3,	%i4,	%g1
	srlx	%o4,	0x01,	%l0
	movvs	%xcc,	%i5,	%i2
	fmovdl	%xcc,	%f10,	%f27
	srax	%l3,	%l2,	%i6
	edge8	%o2,	%l1,	%i7
	xnor	%o1,	0x0D0F,	%o5
	movrgez	%g3,	0x2B3,	%i1
	subccc	%g7,	%g5,	%g6
	fmovdneg	%icc,	%f14,	%f29
	movleu	%xcc,	%l4,	%o7
	xor	%l5,	0x01B0,	%l6
	fsrc1s	%f29,	%f7
	edge16ln	%g4,	%o0,	%o6
	array8	%i0,	%o3,	%g2
	movn	%icc,	%i3,	%i4
	movvc	%xcc,	%o4,	%g1
	ldsw	[%l7 + 0x40],	%l0
	edge16ln	%i2,	%i5,	%l2
	movge	%xcc,	%l3,	%o2
	xor	%l1,	0x17DA,	%i7
	fxor	%f14,	%f6,	%f6
	ldsw	[%l7 + 0x10],	%i6
	fmovdg	%icc,	%f18,	%f11
	subcc	%o1,	0x0501,	%g3
	mulx	%i1,	0x1DFB,	%o5
	fcmpes	%fcc1,	%f13,	%f2
	edge16n	%g5,	%g6,	%g7
	lduh	[%l7 + 0x58],	%o7
	xnorcc	%l4,	%l5,	%l6
	srax	%o0,	%g4,	%i0
	fmul8sux16	%f18,	%f28,	%f12
	andn	%o6,	0x1C51,	%g2
	movvs	%icc,	%i3,	%i4
	movrne	%o3,	%o4,	%l0
	mulx	%g1,	%i2,	%l2
	fmovrsgez	%i5,	%f3,	%f4
	edge8n	%o2,	%l1,	%i7
	ldsb	[%l7 + 0x67],	%l3
	udivcc	%i6,	0x0E6A,	%o1
	smulcc	%g3,	%o5,	%g5
	andncc	%g6,	%g7,	%o7
	edge16ln	%i1,	%l5,	%l4
	ld	[%l7 + 0x70],	%f24
	mova	%xcc,	%l6,	%g4
	xorcc	%o0,	0x1277,	%i0
	ldsh	[%l7 + 0x4E],	%g2
	std	%f20,	[%l7 + 0x28]
	edge8	%o6,	%i4,	%o3
	movgu	%xcc,	%o4,	%l0
	nop
	set	0x64, %o5
	ldsw	[%l7 + %o5],	%i3
	fmovsneg	%xcc,	%f7,	%f31
	array16	%g1,	%i2,	%i5
	movrgez	%l2,	0x1B5,	%l1
	movvs	%icc,	%o2,	%i7
	st	%f11,	[%l7 + 0x3C]
	ldsw	[%l7 + 0x68],	%l3
	fxnors	%f9,	%f25,	%f23
	fornot1	%f24,	%f8,	%f10
	srlx	%o1,	0x11,	%g3
	fmovdcc	%xcc,	%f22,	%f3
	addcc	%o5,	%i6,	%g6
	nop
	set	0x28, %g4
	std	%f6,	[%l7 + %g4]
	add	%g5,	%o7,	%i1
	udivx	%g7,	0x1EE2,	%l4
	fpmerge	%f17,	%f0,	%f6
	sdivcc	%l5,	0x0A5B,	%l6
	addc	%g4,	0x0F35,	%i0
	nop
	set	0x78, %l1
	lduw	[%l7 + %l1],	%o0
	ldd	[%l7 + 0x38],	%g2
	andncc	%o6,	%i4,	%o3
	fmovsgu	%icc,	%f15,	%f20
	mulscc	%o4,	0x0742,	%i3
	ldd	[%l7 + 0x50],	%l0
	srax	%g1,	%i5,	%i2
	edge16ln	%l2,	%o2,	%l1
	edge8l	%i7,	%o1,	%g3
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	fornot1s	%f18,	%f18,	%f6
	restore %o5, 0x1278, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g5,	0x03A6,	%o7
	ldsh	[%l7 + 0x76],	%g7
	udiv	%i1,	0x1559,	%l5
	or	%l4,	0x1DF6,	%l6
	addccc	%g4,	%o0,	%g2
	ldd	[%l7 + 0x40],	%o6
	umulcc	%i4,	0x1196,	%o3
	lduh	[%l7 + 0x70],	%o4
	fmovdge	%icc,	%f14,	%f0
	fmovde	%xcc,	%f8,	%f25
	subc	%i3,	%i0,	%l0
	srlx	%g1,	%i2,	%i5
	movn	%icc,	%l2,	%l1
	movcc	%icc,	%o2,	%i7
	array8	%g3,	%l3,	%i6
	orcc	%o1,	%g6,	%g5
	edge16l	%o7,	%o5,	%g7
	popc	%i1,	%l5
	edge32	%l4,	%l6,	%o0
	movrgz	%g2,	%o6,	%i4
	movn	%icc,	%g4,	%o4
	stx	%o3,	[%l7 + 0x30]
	and	%i3,	0x051F,	%l0
	alignaddr	%g1,	%i0,	%i2
	and	%i5,	%l2,	%o2
	smulcc	%i7,	0x0990,	%l1
	fmul8sux16	%f20,	%f24,	%f22
	fpadd16s	%f26,	%f27,	%f9
	edge32	%l3,	%i6,	%o1
	ld	[%l7 + 0x1C],	%f5
	umulcc	%g6,	%g5,	%o7
	fmovsl	%icc,	%f9,	%f17
	movvs	%icc,	%o5,	%g7
	fmovrslez	%g3,	%f28,	%f29
	fmovrdgz	%i1,	%f2,	%f30
	ldsw	[%l7 + 0x14],	%l5
	srlx	%l6,	0x05,	%l4
	ldd	[%l7 + 0x38],	%g2
	fmovdpos	%icc,	%f13,	%f21
	xnorcc	%o6,	%i4,	%o0
	std	%f12,	[%l7 + 0x20]
	edge16l	%o4,	%o3,	%g4
	fpadd32s	%f1,	%f25,	%f29
	sllx	%l0,	0x0D,	%i3
	udivcc	%i0,	0x040F,	%i2
	movne	%icc,	%i5,	%l2
	fmovsl	%xcc,	%f24,	%f5
	mova	%icc,	%g1,	%o2
	edge32n	%l1,	%i7,	%i6
	edge32ln	%l3,	%o1,	%g5
	andncc	%g6,	%o7,	%o5
	edge8	%g3,	%g7,	%l5
	mova	%icc,	%i1,	%l4
	ld	[%l7 + 0x14],	%f26
	movcc	%icc,	%g2,	%l6
	or	%i4,	0x011F,	%o0
	fabsd	%f0,	%f2
	movrlez	%o6,	0x3DA,	%o3
	fsrc2s	%f19,	%f8
	fmovrslz	%o4,	%f0,	%f3
	mova	%icc,	%g4,	%i3
	stw	%l0,	[%l7 + 0x20]
	fandnot2	%f30,	%f26,	%f6
	addcc	%i2,	0x1DF8,	%i5
	andcc	%i0,	0x1E3E,	%l2
	fmovrdlz	%o2,	%f26,	%f4
	alignaddr	%g1,	%l1,	%i6
	stx	%l3,	[%l7 + 0x78]
	lduh	[%l7 + 0x18],	%o1
	fandnot2s	%f17,	%f3,	%f12
	or	%g5,	0x19DF,	%i7
	fmovdle	%xcc,	%f27,	%f28
	udivcc	%o7,	0x0A56,	%o5
	and	%g3,	%g6,	%l5
	edge8ln	%i1,	%g7,	%l4
	array32	%g2,	%l6,	%o0
	lduw	[%l7 + 0x64],	%o6
	std	%f10,	[%l7 + 0x78]
	and	%i4,	0x010F,	%o3
	srax	%g4,	%o4,	%i3
	srlx	%l0,	%i5,	%i0
	sub	%l2,	%o2,	%g1
	movrlez	%l1,	%i2,	%i6
	ldx	[%l7 + 0x40],	%o1
	movrlez	%l3,	%g5,	%o7
	srax	%o5,	%g3,	%g6
	movvc	%xcc,	%i7,	%i1
	orncc	%l5,	0x12BB,	%g7
	sub	%l4,	0x1ED4,	%g2
	save %o0, %o6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1EBA,	%o3
	fxnors	%f18,	%f31,	%f30
	xor	%g4,	0x17B6,	%o4
	smul	%i3,	%l0,	%i4
	ldx	[%l7 + 0x08],	%i0
	ldsb	[%l7 + 0x6A],	%i5
	movrlez	%l2,	0x2FC,	%g1
	xnorcc	%l1,	%o2,	%i2
	edge8n	%o1,	%i6,	%g5
	ldsb	[%l7 + 0x61],	%l3
	fnor	%f10,	%f14,	%f8
	edge32ln	%o5,	%o7,	%g6
	sub	%g3,	%i7,	%l5
	orn	%i1,	%g7,	%l4
	ldd	[%l7 + 0x70],	%g2
	array32	%o0,	%l6,	%o3
	alignaddrl	%o6,	%o4,	%g4
	movrgz	%l0,	0x151,	%i4
	stx	%i0,	[%l7 + 0x30]
	fsrc1	%f16,	%f24
	fpsub16s	%f22,	%f17,	%f27
	addc	%i5,	0x1413,	%l2
	fexpand	%f9,	%f26
	fnor	%f20,	%f12,	%f24
	bshuffle	%f26,	%f22,	%f18
	fornot2	%f14,	%f20,	%f24
	srax	%i3,	%g1,	%o2
	sra	%i2,	0x0E,	%o1
	edge8	%i6,	%g5,	%l1
	fcmpes	%fcc1,	%f8,	%f10
	edge32ln	%l3,	%o5,	%o7
	array32	%g3,	%i7,	%g6
	edge8	%i1,	%l5,	%l4
	sll	%g2,	%o0,	%g7
	andcc	%l6,	0x1091,	%o6
	fmovsle	%xcc,	%f28,	%f26
	edge8n	%o4,	%g4,	%o3
	stx	%i4,	[%l7 + 0x78]
	orncc	%i0,	0x0922,	%l0
	sethi	0x181F,	%i5
	stb	%l2,	[%l7 + 0x0F]
	movpos	%xcc,	%g1,	%o2
	fone	%f22
	ldx	[%l7 + 0x78],	%i2
	andcc	%i3,	0x1659,	%o1
	movrgz	%g5,	0x3B5,	%i6
	edge32	%l1,	%o5,	%o7
	edge8ln	%g3,	%l3,	%i7
	movn	%icc,	%g6,	%l5
	sth	%l4,	[%l7 + 0x62]
	movrgz	%g2,	%i1,	%o0
	ldd	[%l7 + 0x48],	%f8
	edge32ln	%l6,	%g7,	%o6
	movgu	%icc,	%g4,	%o4
	fabss	%f6,	%f31
	movgu	%xcc,	%i4,	%o3
	movg	%icc,	%l0,	%i5
	lduh	[%l7 + 0x4A],	%i0
	stb	%g1,	[%l7 + 0x7D]
	lduw	[%l7 + 0x78],	%o2
	mulx	%i2,	0x1ED2,	%i3
	mulscc	%o1,	0x029F,	%g5
	movrlez	%i6,	0x155,	%l1
	movg	%xcc,	%l2,	%o5
	sdivcc	%o7,	0x0363,	%l3
	xnorcc	%i7,	%g6,	%l5
	movneg	%icc,	%g3,	%l4
	xor	%g2,	0x0FEF,	%i1
	movneg	%icc,	%o0,	%g7
	sub	%l6,	%g4,	%o4
	ldd	[%l7 + 0x60],	%o6
	orncc	%o3,	%i4,	%i5
	movl	%icc,	%i0,	%l0
	fmovdvs	%icc,	%f8,	%f1
	stb	%g1,	[%l7 + 0x09]
	sdivx	%i2,	0x1320,	%i3
	edge32l	%o1,	%g5,	%o2
	ldsb	[%l7 + 0x2E],	%l1
	smulcc	%l2,	0x0038,	%i6
	movrgz	%o5,	0x0DE,	%o7
	fmovsvc	%xcc,	%f13,	%f13
	ldub	[%l7 + 0x28],	%l3
	and	%g6,	0x00A5,	%l5
	fmovdneg	%xcc,	%f22,	%f24
	ldd	[%l7 + 0x18],	%f0
	movne	%icc,	%i7,	%l4
	popc	0x1A96,	%g2
	smulcc	%i1,	0x0C74,	%g3
	edge32	%o0,	%g7,	%g4
	movre	%o4,	%o6,	%o3
	srl	%i4,	%i5,	%i0
	udiv	%l6,	0x1807,	%g1
	movleu	%xcc,	%i2,	%l0
	and	%i3,	0x007C,	%g5
	andn	%o2,	%o1,	%l1
	fmovscs	%icc,	%f8,	%f12
	edge8	%l2,	%i6,	%o5
	edge16	%o7,	%l3,	%l5
	ldx	[%l7 + 0x58],	%i7
	fand	%f16,	%f20,	%f16
	lduh	[%l7 + 0x48],	%l4
	fnegd	%f26,	%f2
	lduw	[%l7 + 0x40],	%g2
	edge8l	%i1,	%g6,	%g3
	fmovrsne	%g7,	%f10,	%f31
	edge8l	%g4,	%o0,	%o6
	movrgz	%o3,	0x23D,	%i4
	alignaddrl	%o4,	%i5,	%l6
	edge8l	%g1,	%i2,	%l0
	fcmpd	%fcc2,	%f6,	%f14
	movpos	%icc,	%i0,	%i3
	lduh	[%l7 + 0x48],	%o2
	sth	%g5,	[%l7 + 0x68]
	sdiv	%l1,	0x021D,	%l2
	ldd	[%l7 + 0x30],	%o0
	fnegd	%f28,	%f26
	xorcc	%o5,	%o7,	%i6
	edge16n	%l5,	%i7,	%l4
	smulcc	%l3,	%g2,	%g6
	fmovrdlz	%g3,	%f20,	%f28
	popc	%g7,	%i1
	array8	%g4,	%o6,	%o3
	movrlez	%i4,	0x156,	%o4
	ld	[%l7 + 0x08],	%f23
	movrne	%o0,	%l6,	%g1
	sdiv	%i5,	0x11A5,	%l0
	xor	%i0,	%i2,	%o2
	sdiv	%g5,	0x1BE4,	%l1
	edge16l	%i3,	%o1,	%o5
	save %o7, 0x05F3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f1,	%f18
	movpos	%xcc,	%l2,	%i7
	ldd	[%l7 + 0x30],	%l4
	fmovdg	%xcc,	%f3,	%f30
	orcc	%l4,	%g2,	%l3
	mulscc	%g3,	0x0681,	%g6
	array8	%g7,	%g4,	%i1
	movcc	%icc,	%o6,	%i4
	addccc	%o4,	%o3,	%o0
	mova	%icc,	%l6,	%g1
	xorcc	%l0,	0x1A48,	%i0
	edge16ln	%i5,	%o2,	%i2
	subc	%l1,	%i3,	%o1
	fmovrde	%g5,	%f12,	%f20
	fcmpes	%fcc1,	%f30,	%f18
	fnot2	%f2,	%f14
	srlx	%o7,	0x1F,	%o5
	sdivx	%i6,	0x1998,	%l2
	udivx	%l5,	0x1287,	%l4
	fmovdg	%xcc,	%f17,	%f19
	ldd	[%l7 + 0x48],	%i6
	fmovdle	%icc,	%f16,	%f1
	fnot1	%f14,	%f8
	ldsb	[%l7 + 0x49],	%l3
	array8	%g3,	%g2,	%g7
	edge8l	%g4,	%g6,	%o6
	ldsh	[%l7 + 0x46],	%i1
	and	%i4,	0x0246,	%o3
	edge16ln	%o0,	%l6,	%o4
	fmovd	%f28,	%f24
	or	%g1,	%i0,	%i5
	fmul8x16au	%f14,	%f7,	%f30
	mova	%xcc,	%o2,	%i2
	srax	%l0,	0x16,	%l1
	edge8ln	%o1,	%i3,	%o7
	umul	%o5,	%i6,	%l2
	alignaddr	%l5,	%g5,	%i7
	add	%l3,	%g3,	%l4
	subccc	%g2,	0x0BC3,	%g4
	fmovdcc	%xcc,	%f29,	%f14
	xnorcc	%g7,	0x0751,	%g6
	addc	%o6,	%i1,	%i4
	lduw	[%l7 + 0x60],	%o0
	movre	%l6,	%o3,	%g1
	fcmpgt32	%f8,	%f2,	%i0
	smul	%i5,	0x07D0,	%o2
	fnor	%f20,	%f8,	%f22
	movgu	%xcc,	%o4,	%l0
	add	%i2,	0x126C,	%o1
	stx	%i3,	[%l7 + 0x38]
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	edge32l	%o7,	%l5,	%g5
	addccc	%l2,	0x11EF,	%i7
	xnorcc	%g3,	%l4,	%l3
	movvc	%icc,	%g4,	%g2
	fmovdvs	%icc,	%f25,	%f4
	edge8	%g6,	%g7,	%i1
	fmul8x16al	%f15,	%f30,	%f6
	movneg	%icc,	%o6,	%i4
	edge16n	%l6,	%o0,	%g1
	movleu	%xcc,	%i0,	%o3
	fmovdg	%icc,	%f21,	%f27
	edge16l	%o2,	%i5,	%l0
	fcmpd	%fcc1,	%f20,	%f2
	movpos	%icc,	%o4,	%o1
	movneg	%xcc,	%i2,	%i3
	sra	%l1,	%i6,	%o7
	mulscc	%l5,	%o5,	%l2
	lduh	[%l7 + 0x22],	%i7
	lduw	[%l7 + 0x40],	%g5
	movcc	%icc,	%l4,	%g3
	edge16n	%g4,	%l3,	%g2
	fone	%f10
	ldsh	[%l7 + 0x2E],	%g7
	fmul8x16au	%f15,	%f30,	%f26
	mova	%xcc,	%g6,	%o6
	movcc	%icc,	%i1,	%l6
	fmovdleu	%xcc,	%f26,	%f28
	sub	%o0,	0x1C2F,	%i4
	smulcc	%i0,	0x02AD,	%o3
	alignaddr	%o2,	%i5,	%l0
	xorcc	%o4,	0x0BA6,	%g1
	and	%o1,	0x1043,	%i3
	movg	%xcc,	%l1,	%i6
	movrlez	%i2,	0x245,	%o7
	umulcc	%o5,	%l2,	%l5
	lduw	[%l7 + 0x20],	%i7
	subccc	%l4,	0x128B,	%g3
	fmul8ulx16	%f2,	%f16,	%f18
	st	%f17,	[%l7 + 0x78]
	movg	%xcc,	%g4,	%g5
	and	%l3,	0x0067,	%g7
	lduh	[%l7 + 0x6E],	%g2
	fpmerge	%f16,	%f24,	%f12
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%f0
	edge32ln	%o6,	%g6,	%i1
	edge16	%o0,	%i4,	%l6
	fmovsvc	%icc,	%f25,	%f3
	sir	0x153B
	xor	%o3,	0x1212,	%i0
	smul	%i5,	0x0244,	%o2
	mulx	%o4,	%g1,	%l0
	subccc	%i3,	0x195B,	%l1
	ldsw	[%l7 + 0x5C],	%i6
	edge32ln	%o1,	%o7,	%i2
	edge32ln	%o5,	%l2,	%i7
	movrgz	%l4,	0x109,	%l5
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%g2
	andn	%g4,	0x18DF,	%l3
	fabss	%f18,	%f30
	subc	%g5,	%g7,	%g2
	ldd	[%l7 + 0x60],	%o6
	xnor	%i1,	0x0740,	%o0
	alignaddrl	%g6,	%l6,	%i4
	array8	%o3,	%i0,	%i5
	popc	0x1674,	%o2
	movneg	%xcc,	%o4,	%g1
	movrlz	%l0,	0x2B3,	%i3
	srl	%i6,	0x19,	%l1
	lduw	[%l7 + 0x48],	%o7
	movleu	%icc,	%o1,	%o5
	edge32ln	%l2,	%i2,	%l4
	fmul8x16au	%f8,	%f4,	%f26
	add	%l5,	%g3,	%i7
	srlx	%g4,	%l3,	%g7
	alignaddrl	%g2,	%g5,	%o6
	subcc	%i1,	%g6,	%o0
	addccc	%i4,	%l6,	%i0
	movcc	%xcc,	%o3,	%o2
	sub	%o4,	%g1,	%l0
	mulx	%i5,	0x09F6,	%i3
	fcmpd	%fcc0,	%f28,	%f12
	srl	%i6,	0x1D,	%l1
	ldsw	[%l7 + 0x6C],	%o1
	fcmps	%fcc2,	%f15,	%f16
	umul	%o7,	0x0153,	%l2
	fpack16	%f8,	%f22
	ldsb	[%l7 + 0x1D],	%o5
	ldsw	[%l7 + 0x18],	%l4
	movvs	%icc,	%l5,	%i2
	fmovsg	%xcc,	%f18,	%f4
	sdivx	%g3,	0x075B,	%g4
	ldx	[%l7 + 0x60],	%i7
	edge32l	%l3,	%g7,	%g5
	edge8l	%g2,	%o6,	%g6
	fnands	%f8,	%f18,	%f3
	fmovdle	%icc,	%f11,	%f19
	sethi	0x068C,	%o0
	lduw	[%l7 + 0x58],	%i4
	movcc	%xcc,	%l6,	%i1
	fmovscc	%icc,	%f0,	%f19
	fzeros	%f14
	array32	%o3,	%i0,	%o2
	fandnot2	%f4,	%f2,	%f16
	xorcc	%o4,	%l0,	%i5
	nop
	set	0x7C, %o2
	lduh	[%l7 + %o2],	%i3
	sir	0x1971
	add	%i6,	%g1,	%o1
	umulcc	%l1,	%l2,	%o7
	movrgez	%o5,	0x0CD,	%l4
	movl	%xcc,	%l5,	%i2
	fsrc2	%f2,	%f12
	add	%g3,	%i7,	%g4
	andcc	%l3,	0x070F,	%g7
	ldsw	[%l7 + 0x5C],	%g5
	edge32	%o6,	%g2,	%g6
	fmovdg	%icc,	%f12,	%f4
	std	%f22,	[%l7 + 0x70]
	orcc	%o0,	%i4,	%l6
	movpos	%xcc,	%o3,	%i0
	orcc	%o2,	%i1,	%l0
	movcc	%icc,	%i5,	%i3
	sra	%i6,	0x16,	%g1
	popc	%o1,	%l1
	sll	%l2,	%o7,	%o4
	udiv	%l4,	0x0028,	%o5
	movrlz	%i2,	0x022,	%g3
	sethi	0x0C9E,	%l5
	fone	%f12
	umulcc	%g4,	%l3,	%g7
	movrlz	%i7,	%o6,	%g5
	srlx	%g2,	%g6,	%i4
	udivcc	%l6,	0x0E27,	%o0
	movneg	%xcc,	%i0,	%o3
	lduw	[%l7 + 0x28],	%o2
	movrlz	%i1,	0x115,	%i5
	movcs	%icc,	%i3,	%l0
	lduw	[%l7 + 0x38],	%g1
	array8	%o1,	%l1,	%l2
	lduh	[%l7 + 0x78],	%o7
	edge8	%i6,	%o4,	%o5
	edge8l	%i2,	%l4,	%l5
	edge8	%g3,	%g4,	%g7
	std	%f14,	[%l7 + 0x68]
	edge32l	%i7,	%l3,	%o6
	smul	%g5,	%g6,	%i4
	popc	0x0D16,	%g2
	or	%l6,	0x18EA,	%i0
	save %o0, %o2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f18,	%f14
	movle	%icc,	%i5,	%i1
	movl	%icc,	%i3,	%l0
	nop
	set	0x60, %o6
	ldd	[%l7 + %o6],	%f8
	movn	%icc,	%o1,	%l1
	orcc	%g1,	%l2,	%i6
	edge16ln	%o7,	%o4,	%o5
	xorcc	%i2,	0x0F6E,	%l4
	movcc	%icc,	%l5,	%g3
	fmovrslz	%g7,	%f27,	%f25
	alignaddr	%i7,	%l3,	%o6
	edge8l	%g4,	%g5,	%g6
	fsrc1	%f12,	%f22
	orn	%g2,	0x030D,	%l6
	edge16l	%i4,	%o0,	%i0
	fcmpne16	%f30,	%f14,	%o2
	fone	%f24
	st	%f24,	[%l7 + 0x3C]
	movg	%xcc,	%o3,	%i1
	fpsub16s	%f24,	%f30,	%f22
	st	%f1,	[%l7 + 0x34]
	fmul8x16au	%f24,	%f21,	%f20
	stw	%i3,	[%l7 + 0x60]
	fmovspos	%icc,	%f23,	%f28
	movn	%icc,	%i5,	%l0
	umulcc	%o1,	%l1,	%g1
	movneg	%xcc,	%i6,	%o7
	ldub	[%l7 + 0x2B],	%l2
	orn	%o5,	%o4,	%l4
	nop
	set	0x2F, %g5
	stb	%i2,	[%l7 + %g5]
	fmovrslz	%l5,	%f25,	%f28
	smulcc	%g3,	%g7,	%i7
	smul	%o6,	0x0CD7,	%g4
	edge32	%g5,	%g6,	%g2
	std	%f6,	[%l7 + 0x38]
	subc	%l6,	0x08BF,	%i4
	movrlez	%o0,	%l3,	%i0
	orcc	%o3,	0x0E16,	%o2
	movle	%xcc,	%i1,	%i5
	movre	%i3,	%o1,	%l1
	stb	%l0,	[%l7 + 0x4E]
	movgu	%xcc,	%i6,	%g1
	movn	%xcc,	%l2,	%o7
	srax	%o4,	%o5,	%i2
	smul	%l4,	%g3,	%l5
	sdivx	%i7,	0x0A4F,	%o6
	mulscc	%g7,	%g5,	%g4
	xorcc	%g2,	0x0E30,	%g6
	srax	%i4,	%l6,	%o0
	orcc	%i0,	0x161F,	%l3
	fsrc2	%f24,	%f6
	sra	%o3,	0x05,	%i1
	sub	%i5,	0x1CD1,	%i3
	fmul8x16au	%f17,	%f8,	%f10
	sllx	%o1,	0x16,	%o2
	edge16	%l1,	%l0,	%i6
	fone	%f6
	fnors	%f25,	%f26,	%f21
	ldsb	[%l7 + 0x65],	%g1
	edge32ln	%l2,	%o7,	%o5
	nop
	set	0x10, %o4
	lduw	[%l7 + %o4],	%i2
	movrgz	%l4,	%g3,	%o4
	ldsh	[%l7 + 0x4A],	%l5
	fmovdne	%xcc,	%f14,	%f29
	ldd	[%l7 + 0x70],	%f14
	sethi	0x164C,	%i7
	udivcc	%o6,	0x09CA,	%g7
	fmovdge	%xcc,	%f19,	%f29
	lduh	[%l7 + 0x22],	%g5
	movvc	%xcc,	%g4,	%g6
	movrne	%i4,	0x2BD,	%l6
	movg	%icc,	%g2,	%i0
	movcc	%xcc,	%l3,	%o3
	fmovsn	%icc,	%f8,	%f29
	movn	%xcc,	%o0,	%i5
	ldsh	[%l7 + 0x6E],	%i3
	fand	%f28,	%f0,	%f16
	andn	%o1,	0x0336,	%o2
	and	%i1,	0x17C4,	%l0
	movneg	%icc,	%l1,	%g1
	fcmpd	%fcc3,	%f28,	%f8
	ldd	[%l7 + 0x30],	%f18
	fpsub16	%f0,	%f20,	%f14
	save %i6, 0x1FEA, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x0433,	%i2
	ldsb	[%l7 + 0x16],	%l4
	fmovs	%f25,	%f16
	sethi	0x0A6F,	%g3
	orncc	%o4,	%o5,	%l5
	edge32ln	%i7,	%g7,	%g5
	fnot2s	%f31,	%f9
	edge32ln	%o6,	%g6,	%i4
	umulcc	%g4,	%g2,	%i0
	sub	%l6,	0x15CF,	%o3
	orcc	%o0,	0x023E,	%i5
	udivcc	%l3,	0x1483,	%o1
	orn	%o2,	0x000C,	%i1
	ldsw	[%l7 + 0x4C],	%i3
	popc	%l0,	%l1
	sll	%i6,	0x18,	%l2
	movneg	%icc,	%g1,	%o7
	nop
	set	0x48, %i2
	std	%f14,	[%l7 + %i2]
	fandnot2	%f10,	%f2,	%f16
	fmovd	%f0,	%f28
	movne	%xcc,	%l4,	%i2
	fornot1s	%f15,	%f5,	%f8
	subccc	%g3,	%o5,	%o4
	movcc	%xcc,	%l5,	%g7
	sub	%i7,	0x02D1,	%g5
	alignaddr	%o6,	%i4,	%g4
	movrlez	%g2,	%g6,	%l6
	std	%f16,	[%l7 + 0x38]
	movrgz	%o3,	%o0,	%i0
	movrne	%l3,	0x17F,	%o1
	edge8	%o2,	%i5,	%i1
	edge32ln	%l0,	%l1,	%i6
	movcc	%icc,	%l2,	%g1
	fmovrslez	%i3,	%f11,	%f5
	fmovdvc	%xcc,	%f24,	%f14
	andn	%l4,	%o7,	%g3
	ldd	[%l7 + 0x28],	%f28
	lduw	[%l7 + 0x6C],	%i2
	udiv	%o4,	0x06AB,	%l5
	or	%g7,	0x09AF,	%o5
	xor	%g5,	0x0F42,	%i7
	edge16n	%i4,	%o6,	%g4
	movn	%xcc,	%g2,	%g6
	fpadd32s	%f14,	%f12,	%f1
	fcmple16	%f26,	%f16,	%l6
	edge8n	%o0,	%o3,	%l3
	sdiv	%o1,	0x09C6,	%o2
	fmovrdgz	%i5,	%f26,	%f18
	nop
	set	0x60, %o1
	ldsb	[%l7 + %o1],	%i0
	udiv	%l0,	0x1752,	%i1
	fnot1	%f2,	%f22
	sll	%i6,	0x12,	%l1
	st	%f22,	[%l7 + 0x0C]
	fcmps	%fcc3,	%f28,	%f17
	movre	%g1,	%l2,	%i3
	edge8n	%l4,	%o7,	%g3
	umulcc	%i2,	0x06A8,	%o4
	movrlz	%g7,	0x014,	%l5
	udivcc	%o5,	0x097C,	%g5
	fmovsl	%icc,	%f26,	%f1
	array32	%i7,	%i4,	%o6
	movl	%xcc,	%g2,	%g6
	subcc	%g4,	0x1E00,	%o0
	edge16n	%o3,	%l6,	%o1
	stx	%o2,	[%l7 + 0x18]
	fcmps	%fcc3,	%f21,	%f20
	srax	%l3,	%i0,	%i5
	fmovdcc	%xcc,	%f19,	%f2
	fmul8ulx16	%f12,	%f30,	%f30
	sdivx	%l0,	0x01BC,	%i1
	udiv	%i6,	0x0F74,	%g1
	umul	%l2,	0x0C0B,	%i3
	fmovdne	%xcc,	%f4,	%f18
	ldsb	[%l7 + 0x4B],	%l1
	xnor	%o7,	%g3,	%i2
	udivcc	%l4,	0x10B8,	%g7
	array8	%o4,	%l5,	%o5
	subc	%g5,	0x0FA3,	%i4
	fpadd32s	%f13,	%f19,	%f1
	fmovdgu	%icc,	%f5,	%f29
	ldsb	[%l7 + 0x77],	%i7
	edge8n	%g2,	%g6,	%o6
	edge16l	%o0,	%o3,	%l6
	addcc	%o1,	%g4,	%o2
	orcc	%l3,	%i0,	%i5
	sdivx	%i1,	0x0173,	%l0
	move	%icc,	%i6,	%l2
	fand	%f18,	%f6,	%f2
	fnands	%f4,	%f25,	%f28
	orn	%i3,	%l1,	%o7
	sra	%g3,	0x00,	%i2
	udivx	%g1,	0x1284,	%l4
	movvc	%xcc,	%o4,	%g7
	fpadd32	%f8,	%f22,	%f16
	movrgz	%l5,	%g5,	%o5
	edge16ln	%i7,	%i4,	%g2
	sra	%g6,	%o6,	%o0
	edge8n	%l6,	%o1,	%o3
	fmuld8sux16	%f30,	%f28,	%f18
	orncc	%o2,	0x0395,	%g4
	ldx	[%l7 + 0x70],	%i0
	fabss	%f22,	%f3
	fmovdge	%icc,	%f30,	%f23
	lduh	[%l7 + 0x36],	%l3
	srlx	%i5,	0x0B,	%i1
	alignaddr	%l0,	%l2,	%i6
	xnor	%i3,	%l1,	%o7
	movle	%xcc,	%g3,	%i2
	edge8ln	%l4,	%o4,	%g7
	lduw	[%l7 + 0x38],	%g1
	ldd	[%l7 + 0x30],	%f22
	movleu	%icc,	%g5,	%o5
	ld	[%l7 + 0x60],	%f10
	sub	%l5,	0x1DD2,	%i4
	fmovdne	%icc,	%f25,	%f26
	movcc	%icc,	%g2,	%i7
	mulx	%g6,	0x0C42,	%o0
	fmovrsgz	%l6,	%f9,	%f14
	edge8n	%o1,	%o6,	%o3
	movrlz	%g4,	%o2,	%l3
	sub	%i0,	%i1,	%l0
	subccc	%i5,	0x0AC5,	%l2
	alignaddrl	%i3,	%l1,	%i6
	edge32l	%g3,	%o7,	%i2
	ldub	[%l7 + 0x3D],	%l4
	array8	%g7,	%o4,	%g5
	fsrc1s	%f12,	%f4
	movg	%icc,	%g1,	%o5
	lduh	[%l7 + 0x40],	%i4
	movg	%icc,	%g2,	%l5
	fpsub16s	%f21,	%f9,	%f13
	fcmpgt32	%f6,	%f4,	%g6
	edge8	%i7,	%o0,	%l6
	sethi	0x0AB6,	%o6
	fsrc1s	%f6,	%f13
	smulcc	%o1,	0x0FCC,	%o3
	alignaddrl	%g4,	%l3,	%i0
	ldd	[%l7 + 0x30],	%i0
	movge	%icc,	%o2,	%i5
	fmovrsgz	%l0,	%f22,	%f23
	sll	%l2,	0x0C,	%l1
	movcs	%icc,	%i6,	%g3
	mulx	%o7,	0x043B,	%i3
	srlx	%i2,	0x15,	%g7
	ldd	[%l7 + 0x28],	%f30
	addcc	%l4,	%g5,	%g1
	addc	%o5,	%i4,	%g2
	mova	%xcc,	%l5,	%o4
	sethi	0x1D3F,	%i7
	edge8l	%g6,	%l6,	%o6
	fmovrdne	%o0,	%f6,	%f30
	nop
	set	0x30, %o3
	stx	%o3,	[%l7 + %o3]
	srl	%o1,	0x10,	%l3
	edge16ln	%i0,	%g4,	%o2
	lduh	[%l7 + 0x62],	%i1
	fsrc2	%f20,	%f14
	andcc	%i5,	%l0,	%l1
	movpos	%xcc,	%l2,	%g3
	fmovdg	%icc,	%f27,	%f22
	ldx	[%l7 + 0x60],	%i6
	smul	%o7,	%i3,	%g7
	addccc	%i2,	0x0634,	%g5
	alignaddr	%g1,	%o5,	%l4
	ld	[%l7 + 0x08],	%f27
	sllx	%i4,	%g2,	%l5
	fmul8x16au	%f16,	%f6,	%f30
	movneg	%icc,	%i7,	%g6
	fmovsg	%xcc,	%f25,	%f24
	umulcc	%l6,	0x1744,	%o6
	lduw	[%l7 + 0x44],	%o4
	move	%xcc,	%o0,	%o1
	xorcc	%l3,	%i0,	%g4
	sra	%o2,	0x07,	%i1
	fpsub32	%f24,	%f0,	%f22
	andncc	%o3,	%l0,	%i5
	ldsb	[%l7 + 0x16],	%l2
	nop
	set	0x74, %o7
	lduw	[%l7 + %o7],	%l1
	sdivx	%i6,	0x06AC,	%o7
	mulx	%i3,	%g3,	%i2
	andncc	%g7,	%g5,	%o5
	fmovs	%f26,	%f23
	fnand	%f24,	%f8,	%f30
	srax	%l4,	%g1,	%g2
	smul	%i4,	0x00AC,	%i7
	edge32ln	%l5,	%g6,	%o6
	fmovrsgz	%l6,	%f3,	%f11
	fands	%f16,	%f9,	%f1
	fxor	%f28,	%f30,	%f2
	mulscc	%o0,	0x1B1C,	%o4
	stb	%o1,	[%l7 + 0x14]
	fmovsvc	%icc,	%f9,	%f27
	udiv	%i0,	0x048A,	%l3
	edge32ln	%o2,	%g4,	%i1
	fcmpne16	%f14,	%f4,	%o3
	fcmpes	%fcc3,	%f14,	%f31
	edge8ln	%i5,	%l2,	%l1
	sethi	0x07E7,	%i6
	ldsh	[%l7 + 0x76],	%l0
	fmovsvc	%xcc,	%f11,	%f25
	xorcc	%o7,	0x0A72,	%i3
	stb	%g3,	[%l7 + 0x11]
	fmovsvc	%xcc,	%f17,	%f29
	andcc	%g7,	%g5,	%o5
	fones	%f14
	xor	%l4,	%g1,	%g2
	fors	%f22,	%f10,	%f19
	sllx	%i2,	%i4,	%i7
	movne	%xcc,	%g6,	%l5
	movvc	%xcc,	%o6,	%l6
	movneg	%icc,	%o4,	%o0
	fmovdge	%icc,	%f28,	%f9
	addccc	%i0,	0x1141,	%o1
	umulcc	%o2,	%l3,	%g4
	fmovrdlz	%i1,	%f18,	%f8
	movg	%icc,	%i5,	%o3
	fmovrdgez	%l1,	%f18,	%f4
	sub	%l2,	%i6,	%l0
	st	%f15,	[%l7 + 0x78]
	std	%f24,	[%l7 + 0x28]
	fcmps	%fcc1,	%f22,	%f14
	mulx	%i3,	0x1BB4,	%o7
	movle	%xcc,	%g3,	%g7
	sth	%o5,	[%l7 + 0x6A]
	movne	%icc,	%l4,	%g5
	edge16ln	%g2,	%g1,	%i4
	srlx	%i2,	%g6,	%i7
	movre	%l5,	0x21D,	%l6
	fsrc1s	%f6,	%f30
	and	%o6,	%o4,	%o0
	addccc	%o1,	%o2,	%l3
	edge8n	%i0,	%g4,	%i5
	umul	%i1,	%o3,	%l2
	xor	%l1,	0x0D78,	%l0
	movrgz	%i6,	0x3A0,	%o7
	sethi	0x1299,	%g3
	xorcc	%i3,	%o5,	%g7
	fnegs	%f6,	%f29
	stw	%g5,	[%l7 + 0x78]
	addc	%g2,	%l4,	%i4
	lduw	[%l7 + 0x2C],	%i2
	movre	%g6,	0x2E7,	%g1
	fexpand	%f7,	%f22
	save %i7, 0x0BDC, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o6,	0x13C2,	%l6
	movrne	%o4,	%o1,	%o0
	fmovscc	%xcc,	%f18,	%f18
	srl	%l3,	%o2,	%g4
	save %i5, 0x0983, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i1,	%l2
	fnor	%f26,	%f18,	%f22
	sethi	0x182F,	%l1
	restore %l0, %i6, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o3,	%i3
	fmovrse	%o5,	%f26,	%f16
	edge16ln	%g7,	%g5,	%g3
	edge32n	%l4,	%i4,	%g2
	movre	%g6,	0x174,	%i2
	movne	%xcc,	%g1,	%l5
	xnor	%i7,	%o6,	%o4
	movge	%icc,	%o1,	%l6
	fmovsvs	%xcc,	%f21,	%f28
	movgu	%xcc,	%o0,	%l3
	srlx	%o2,	0x1F,	%i5
	udivcc	%g4,	0x02D3,	%i0
	st	%f11,	[%l7 + 0x14]
	udiv	%i1,	0x0266,	%l1
	movcs	%icc,	%l2,	%l0
	fpsub32	%f22,	%f30,	%f8
	stw	%o7,	[%l7 + 0x3C]
	sra	%i6,	%i3,	%o5
	sllx	%g7,	0x09,	%o3
	fmovdvs	%icc,	%f14,	%f17
	fmovsg	%icc,	%f29,	%f15
	udivx	%g5,	0x1EFD,	%l4
	fpackfix	%f4,	%f22
	edge16l	%i4,	%g3,	%g2
	fmovdpos	%xcc,	%f5,	%f16
	stw	%i2,	[%l7 + 0x2C]
	sdiv	%g6,	0x04EF,	%l5
	alignaddr	%i7,	%g1,	%o4
	xorcc	%o1,	%o6,	%l6
	fmovs	%f13,	%f0
	sir	0x09D8
	ld	[%l7 + 0x7C],	%f30
	fand	%f18,	%f30,	%f28
	subcc	%o0,	0x1950,	%o2
	faligndata	%f30,	%f14,	%f20
	xorcc	%l3,	%i5,	%i0
	nop
	set	0x58, %i7
	sth	%g4,	[%l7 + %i7]
	edge32ln	%l1,	%l2,	%i1
	udiv	%l0,	0x1562,	%i6
	xnor	%o7,	0x06FE,	%o5
	fcmple16	%f0,	%f28,	%g7
	orncc	%o3,	0x159D,	%g5
	sra	%l4,	0x05,	%i4
	fmovspos	%icc,	%f4,	%f6
	sub	%g3,	%g2,	%i3
	ldsw	[%l7 + 0x5C],	%g6
	fmovdge	%icc,	%f12,	%f17
	edge8n	%l5,	%i7,	%g1
	stw	%o4,	[%l7 + 0x54]
	movleu	%xcc,	%o1,	%i2
	movvc	%icc,	%l6,	%o0
	mulx	%o2,	0x05A3,	%o6
	sir	0x1D8E
	fandnot2	%f0,	%f2,	%f6
	movvc	%icc,	%l3,	%i0
	sethi	0x1789,	%i5
	stw	%g4,	[%l7 + 0x5C]
	ld	[%l7 + 0x2C],	%f27
	movrgz	%l1,	0x051,	%i1
	edge8n	%l2,	%i6,	%o7
	addcc	%l0,	0x052A,	%o5
	edge8ln	%o3,	%g5,	%g7
	fmovsle	%icc,	%f9,	%f20
	movrgz	%l4,	%i4,	%g2
	fcmpeq16	%f26,	%f20,	%i3
	fcmpgt16	%f26,	%f16,	%g6
	fzero	%f16
	xnorcc	%l5,	0x136D,	%i7
	movrlez	%g1,	0x379,	%o4
	xor	%o1,	0x108D,	%i2
	srlx	%l6,	0x1C,	%g3
	edge16l	%o0,	%o6,	%l3
	ldd	[%l7 + 0x20],	%i0
	orn	%o2,	0x1964,	%g4
	fcmpd	%fcc3,	%f12,	%f24
	mulscc	%l1,	%i1,	%i5
	movvc	%icc,	%i6,	%l2
	umul	%l0,	%o5,	%o7
	smul	%g5,	%g7,	%l4
	fmovrsne	%i4,	%f31,	%f25
	popc	0x0631,	%o3
	nop
	set	0x38, %g2
	ldd	[%l7 + %g2],	%i2
	edge8l	%g6,	%g2,	%i7
	fmovrdlz	%l5,	%f14,	%f12
	array32	%o4,	%o1,	%i2
	orcc	%g1,	%g3,	%o0
	ldx	[%l7 + 0x38],	%l6
	mova	%xcc,	%o6,	%i0
	sra	%o2,	0x08,	%g4
	edge16l	%l1,	%l3,	%i1
	stw	%i6,	[%l7 + 0x2C]
	edge16	%l2,	%l0,	%i5
	fzeros	%f10
	alignaddrl	%o7,	%o5,	%g5
	fornot2	%f22,	%f0,	%f24
	movre	%g7,	%l4,	%i4
	ldsb	[%l7 + 0x68],	%i3
	edge32l	%o3,	%g6,	%g2
	movcc	%xcc,	%i7,	%o4
	edge16ln	%o1,	%l5,	%g1
	add	%g3,	%o0,	%l6
	movvs	%xcc,	%o6,	%i2
	movcc	%xcc,	%o2,	%g4
	alignaddrl	%l1,	%i0,	%i1
	ldsb	[%l7 + 0x1D],	%l3
	fmovdle	%icc,	%f9,	%f28
	lduw	[%l7 + 0x34],	%i6
	sllx	%l2,	0x16,	%l0
	fmovrsgz	%i5,	%f0,	%f3
	edge8	%o5,	%g5,	%o7
	save %l4, 0x0A1C, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i3,	%g7
	ldub	[%l7 + 0x69],	%g6
	fsrc1s	%f24,	%f18
	edge16ln	%g2,	%o3,	%o4
	ldsh	[%l7 + 0x2E],	%i7
	ldx	[%l7 + 0x28],	%l5
	edge32l	%g1,	%g3,	%o1
	movcs	%icc,	%l6,	%o6
	movrlez	%i2,	0x337,	%o2
	mulscc	%g4,	0x12A1,	%l1
	edge8l	%o0,	%i0,	%i1
	movg	%xcc,	%l3,	%l2
	udivcc	%l0,	0x063D,	%i6
	stx	%o5,	[%l7 + 0x20]
	edge8n	%g5,	%o7,	%l4
	movrlz	%i5,	%i4,	%i3
	fmovrdlez	%g7,	%f18,	%f26
	fmovsgu	%icc,	%f17,	%f5
	sdivcc	%g6,	0x1A36,	%g2
	fmovdvc	%xcc,	%f17,	%f29
	stx	%o3,	[%l7 + 0x28]
	popc	0x0888,	%o4
	fmul8x16al	%f3,	%f1,	%f16
	movl	%xcc,	%l5,	%g1
	ldd	[%l7 + 0x70],	%f20
	nop
	set	0x58, %g3
	stx	%g3,	[%l7 + %g3]
	edge8l	%i7,	%o1,	%l6
	udivx	%o6,	0x1135,	%i2
	fpadd16	%f30,	%f30,	%f14
	sra	%o2,	%g4,	%l1
	movl	%icc,	%o0,	%i0
	fmovrdlez	%l3,	%f12,	%f14
	edge32	%i1,	%l0,	%i6
	edge32n	%o5,	%l2,	%g5
	subccc	%l4,	%i5,	%i4
	add	%o7,	%g7,	%g6
	srl	%i3,	0x16,	%g2
	fpadd16s	%f6,	%f24,	%f26
	addc	%o4,	%l5,	%o3
	udiv	%g3,	0x1F32,	%g1
	sth	%i7,	[%l7 + 0x5C]
	movgu	%icc,	%l6,	%o6
	movvc	%xcc,	%o1,	%o2
	xorcc	%g4,	0x0971,	%i2
	edge8ln	%l1,	%i0,	%l3
	andncc	%i1,	%o0,	%l0
	fors	%f3,	%f12,	%f19
	fmovdn	%icc,	%f21,	%f15
	stw	%i6,	[%l7 + 0x74]
	sdiv	%l2,	0x0E79,	%g5
	edge32	%l4,	%i5,	%i4
	movge	%icc,	%o7,	%g7
	xorcc	%o5,	%i3,	%g6
	mova	%xcc,	%o4,	%l5
	edge8ln	%o3,	%g2,	%g1
	siam	0x3
	edge8	%g3,	%i7,	%l6
	stx	%o6,	[%l7 + 0x10]
	movcs	%icc,	%o1,	%o2
	fcmple32	%f0,	%f20,	%i2
	fmovrdlez	%g4,	%f28,	%f22
	array16	%i0,	%l1,	%i1
	sllx	%o0,	%l0,	%i6
	edge32ln	%l3,	%g5,	%l4
	fandnot1s	%f12,	%f17,	%f31
	edge16	%i5,	%l2,	%o7
	orn	%i4,	0x1D24,	%o5
	movrgez	%i3,	%g6,	%o4
	fcmps	%fcc2,	%f22,	%f12
	fxor	%f4,	%f12,	%f12
	sdivcc	%g7,	0x15F7,	%l5
	stb	%g2,	[%l7 + 0x21]
	fnot1	%f20,	%f22
	edge16	%g1,	%o3,	%i7
	move	%xcc,	%l6,	%g3
	fpackfix	%f12,	%f20
	movrlez	%o1,	0x33D,	%o2
	sdivcc	%i2,	0x1156,	%g4
	mulx	%i0,	%o6,	%l1
	fone	%f12
	fmovsa	%icc,	%f6,	%f29
	fcmple32	%f24,	%f8,	%i1
	fmuld8ulx16	%f4,	%f24,	%f2
	array8	%l0,	%o0,	%i6
	orcc	%l3,	%l4,	%g5
	fmovdcc	%icc,	%f5,	%f20
	stx	%i5,	[%l7 + 0x50]
	movneg	%xcc,	%o7,	%i4
	stx	%o5,	[%l7 + 0x20]
	subcc	%l2,	0x13CA,	%i3
	fmovse	%icc,	%f9,	%f2
	lduw	[%l7 + 0x7C],	%g6
	fxor	%f8,	%f24,	%f6
	alignaddr	%o4,	%g7,	%l5
	movne	%xcc,	%g2,	%g1
	movre	%i7,	0x2FC,	%o3
	movn	%xcc,	%l6,	%g3
	umulcc	%o1,	%o2,	%g4
	ldsb	[%l7 + 0x55],	%i0
	xor	%i2,	0x1AFF,	%l1
	move	%xcc,	%o6,	%i1
	fnands	%f31,	%f24,	%f10
	movne	%xcc,	%o0,	%l0
	movrgez	%i6,	0x16A,	%l3
	fmovdpos	%xcc,	%f4,	%f25
	edge16ln	%g5,	%l4,	%i5
	smul	%i4,	0x1CFA,	%o7
	fnegd	%f0,	%f24
	ldsw	[%l7 + 0x48],	%o5
	sra	%l2,	%i3,	%g6
	movgu	%icc,	%o4,	%l5
	sdivx	%g2,	0x19A8,	%g1
	edge8ln	%i7,	%o3,	%g7
	edge32ln	%l6,	%o1,	%o2
	fmovrsgez	%g3,	%f5,	%f16
	stb	%i0,	[%l7 + 0x71]
	sethi	0x1DC3,	%i2
	movleu	%xcc,	%g4,	%l1
	std	%f24,	[%l7 + 0x30]
	sra	%i1,	%o0,	%o6
	xorcc	%i6,	%l3,	%g5
	move	%xcc,	%l0,	%l4
	movle	%xcc,	%i4,	%o7
	edge8	%o5,	%l2,	%i5
	movvc	%icc,	%g6,	%o4
	std	%f0,	[%l7 + 0x50]
	sllx	%l5,	0x05,	%g2
	for	%f30,	%f16,	%f12
	alignaddr	%g1,	%i3,	%o3
	addcc	%i7,	%g7,	%o1
	andncc	%l6,	%g3,	%i0
	std	%f24,	[%l7 + 0x60]
	movle	%icc,	%i2,	%o2
	sll	%l1,	%i1,	%g4
	fnot1	%f18,	%f4
	and	%o6,	%i6,	%l3
	fmovrdlez	%o0,	%f4,	%f6
	fmovdvc	%icc,	%f20,	%f2
	srlx	%l0,	0x0E,	%g5
	udiv	%i4,	0x107E,	%l4
	movpos	%xcc,	%o5,	%o7
	movcc	%icc,	%l2,	%i5
	umul	%g6,	%l5,	%o4
	mulscc	%g1,	%g2,	%o3
	movrgz	%i3,	%i7,	%g7
	stw	%o1,	[%l7 + 0x6C]
	addcc	%l6,	%i0,	%g3
	fnegd	%f2,	%f8
	alignaddrl	%o2,	%i2,	%l1
	fmuld8ulx16	%f28,	%f9,	%f30
	sth	%g4,	[%l7 + 0x60]
	fornot1s	%f6,	%f21,	%f20
	edge32n	%o6,	%i6,	%i1
	sdivcc	%o0,	0x1CA5,	%l0
	edge32l	%g5,	%i4,	%l3
	subccc	%l4,	0x1DCC,	%o5
	movvs	%icc,	%o7,	%l2
	fmovrdlz	%g6,	%f6,	%f18
	fcmps	%fcc2,	%f13,	%f31
	fmovdl	%icc,	%f8,	%f26
	array32	%l5,	%o4,	%g1
	movleu	%icc,	%g2,	%i5
	fmovsvc	%icc,	%f15,	%f0
	sra	%i3,	0x10,	%i7
	edge16ln	%g7,	%o3,	%l6
	or	%i0,	%g3,	%o2
	nop
	set	0x11, %l4
	ldsb	[%l7 + %l4],	%i2
	srax	%o1,	0x0C,	%l1
	smulcc	%o6,	0x13DA,	%i6
	sub	%i1,	0x1248,	%o0
	xorcc	%l0,	0x0C12,	%g5
	xorcc	%i4,	0x0515,	%l3
	fcmped	%fcc2,	%f0,	%f18
	fmovs	%f2,	%f5
	xnor	%g4,	%o5,	%l4
	subccc	%o7,	%g6,	%l5
	fsrc1s	%f1,	%f12
	ldsb	[%l7 + 0x63],	%l2
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	fxors	%f0,	%f19,	%f31
	movgu	%xcc,	%i5,	%i3
	stx	%i7,	[%l7 + 0x58]
	udiv	%g7,	0x147E,	%o3
	sth	%g2,	[%l7 + 0x56]
	lduw	[%l7 + 0x30],	%l6
	edge32	%i0,	%g3,	%o2
	alignaddrl	%o1,	%l1,	%o6
	movle	%icc,	%i6,	%i1
	movre	%o0,	%i2,	%l0
	sir	0x0A23
	fmovrdne	%i4,	%f14,	%f18
	sllx	%g5,	0x00,	%l3
	fmovsvc	%icc,	%f16,	%f26
	nop
	set	0x70, %i0
	ldd	[%l7 + %i0],	%f18
	edge32n	%g4,	%l4,	%o5
	fnands	%f17,	%f24,	%f8
	ldsw	[%l7 + 0x5C],	%g6
	st	%f26,	[%l7 + 0x7C]
	addcc	%l5,	0x0AA5,	%o7
	fcmped	%fcc0,	%f4,	%f22
	xnor	%g1,	0x08B9,	%o4
	srax	%l2,	%i5,	%i7
	fornot2s	%f15,	%f0,	%f14
	fxor	%f20,	%f8,	%f22
	fcmpgt32	%f16,	%f18,	%g7
	andcc	%o3,	0x12FB,	%g2
	mova	%xcc,	%l6,	%i0
	ld	[%l7 + 0x60],	%f22
	movg	%icc,	%i3,	%o2
	udivcc	%g3,	0x087A,	%o1
	movre	%l1,	%o6,	%i6
	sllx	%o0,	%i1,	%l0
	fcmped	%fcc1,	%f30,	%f8
	xor	%i4,	%i2,	%g5
	addcc	%l3,	%g4,	%o5
	fmovd	%f14,	%f16
	movg	%xcc,	%g6,	%l5
	edge8ln	%l4,	%g1,	%o7
	movleu	%xcc,	%o4,	%i5
	xorcc	%i7,	%l2,	%o3
	fmovrslz	%g7,	%f0,	%f3
	edge32ln	%g2,	%i0,	%l6
	fnegd	%f18,	%f2
	edge8l	%i3,	%g3,	%o2
	subc	%o1,	%o6,	%i6
	nop
	set	0x14, %i6
	ldub	[%l7 + %i6],	%o0
	fmul8ulx16	%f24,	%f14,	%f2
	edge16l	%l1,	%l0,	%i4
	movne	%icc,	%i1,	%g5
	smulcc	%i2,	0x0726,	%l3
	fmovse	%icc,	%f20,	%f31
	alignaddr	%g4,	%o5,	%l5
	fcmpne16	%f4,	%f22,	%l4
	movl	%xcc,	%g1,	%o7
	sdivx	%g6,	0x1509,	%o4
	fmovsleu	%icc,	%f14,	%f16
	fmovdge	%icc,	%f30,	%f28
	udivx	%i7,	0x0E48,	%l2
	add	%i5,	0x07BD,	%o3
	array8	%g7,	%i0,	%g2
	save %i3, 0x0FC3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o2,	%g3
	movvc	%icc,	%o1,	%i6
	xorcc	%o0,	0x1422,	%l1
	stw	%l0,	[%l7 + 0x68]
	movle	%icc,	%i4,	%o6
	alignaddr	%i1,	%i2,	%g5
	movrne	%l3,	%o5,	%l5
	fmovse	%xcc,	%f26,	%f12
	xnor	%l4,	0x1407,	%g1
	movgu	%xcc,	%g4,	%g6
	ldub	[%l7 + 0x1E],	%o4
	addc	%o7,	%l2,	%i7
	fmovrslz	%i5,	%f6,	%f23
	fnot1	%f28,	%f24
	movcc	%icc,	%o3,	%i0
	fmovsge	%xcc,	%f2,	%f12
	array32	%g2,	%i3,	%l6
	sdivx	%g7,	0x0F82,	%o2
	edge8n	%g3,	%o1,	%i6
	fandnot2s	%f22,	%f28,	%f4
	srlx	%l1,	0x07,	%l0
	mova	%xcc,	%i4,	%o6
	std	%f14,	[%l7 + 0x08]
	edge8	%i1,	%i2,	%o0
	nop
	set	0x7A, %g7
	sth	%l3,	[%l7 + %g7]
	sth	%o5,	[%l7 + 0x70]
	ldd	[%l7 + 0x30],	%f0
	fmovdle	%xcc,	%f7,	%f6
	sethi	0x0C31,	%g5
	restore %l5, %g1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f28,	%f0
	ldsw	[%l7 + 0x40],	%g6
	addcc	%g4,	%o4,	%o7
	save %l2, %i7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o3,	%g2
	udivcc	%i3,	0x1C3E,	%i0
	fpackfix	%f8,	%f1
	sdivcc	%l6,	0x02F2,	%o2
	ldx	[%l7 + 0x68],	%g7
	xor	%g3,	0x0165,	%i6
	array32	%l1,	%o1,	%i4
	movpos	%xcc,	%l0,	%i1
	movg	%icc,	%i2,	%o6
	add	%l3,	%o0,	%o5
	addccc	%l5,	0x1DD2,	%g5
	sth	%g1,	[%l7 + 0x7E]
	stb	%g6,	[%l7 + 0x68]
	fmovsleu	%xcc,	%f13,	%f9
	alignaddr	%l4,	%g4,	%o7
	movvc	%icc,	%o4,	%l2
	fmovrsgz	%i7,	%f10,	%f1
	and	%i5,	%o3,	%i3
	movn	%icc,	%g2,	%i0
	add	%o2,	%g7,	%l6
	fpadd32	%f26,	%f14,	%f2
	xorcc	%g3,	0x1051,	%i6
	fmovdl	%xcc,	%f22,	%f18
	and	%l1,	%i4,	%l0
	ldub	[%l7 + 0x1E],	%i1
	stb	%i2,	[%l7 + 0x6F]
	xor	%o1,	%o6,	%o0
	orncc	%o5,	0x037E,	%l5
	fmovdl	%icc,	%f0,	%f26
	sth	%g5,	[%l7 + 0x32]
	xorcc	%g1,	0x0B79,	%g6
	udivx	%l4,	0x019E,	%l3
	fmovsne	%xcc,	%f2,	%f30
	popc	%o7,	%g4
	std	%f18,	[%l7 + 0x78]
	fpack16	%f22,	%f14
	sllx	%o4,	%i7,	%i5
	movcc	%xcc,	%o3,	%l2
	edge32l	%i3,	%g2,	%i0
	movge	%xcc,	%o2,	%g7
	array8	%g3,	%l6,	%i6
	movre	%l1,	0x0F5,	%l0
	sdivcc	%i4,	0x112F,	%i1
	st	%f5,	[%l7 + 0x48]
	udivcc	%i2,	0x0ABD,	%o1
	orn	%o0,	%o5,	%l5
	movne	%xcc,	%g5,	%o6
	movpos	%xcc,	%g6,	%g1
	addcc	%l3,	0x17CD,	%o7
	stw	%g4,	[%l7 + 0x24]
	andcc	%l4,	%i7,	%o4
	ldd	[%l7 + 0x60],	%i4
	smul	%l2,	0x03B3,	%o3
	fmovdcs	%xcc,	%f10,	%f17
	ldsb	[%l7 + 0x11],	%g2
	movl	%icc,	%i0,	%i3
	movleu	%icc,	%g7,	%o2
	andncc	%g3,	%l6,	%i6
	movrlz	%l0,	0x182,	%l1
	andncc	%i4,	%i2,	%o1
	umul	%o0,	0x1BC6,	%o5
	fmovsvc	%icc,	%f1,	%f30
	subcc	%l5,	%g5,	%i1
	movvc	%xcc,	%g6,	%g1
	fpackfix	%f14,	%f10
	fnands	%f16,	%f22,	%f23
	movpos	%icc,	%o6,	%l3
	movre	%o7,	%g4,	%l4
	movleu	%xcc,	%i7,	%i5
	andn	%l2,	0x1C26,	%o3
	sir	0x1668
	fexpand	%f10,	%f20
	sub	%g2,	%i0,	%i3
	fpadd32	%f22,	%f26,	%f6
	mova	%xcc,	%g7,	%o2
	lduw	[%l7 + 0x60],	%o4
	movg	%icc,	%g3,	%l6
	udivcc	%i6,	0x1715,	%l1
	fsrc2	%f0,	%f28
	fmovrsgez	%i4,	%f17,	%f25
	ldd	[%l7 + 0x30],	%f18
	edge16ln	%i2,	%o1,	%l0
	movgu	%xcc,	%o0,	%l5
	edge8n	%g5,	%i1,	%o5
	movne	%icc,	%g1,	%g6
	ldsh	[%l7 + 0x4C],	%o6
	movrgz	%l3,	0x1FC,	%o7
	addcc	%l4,	%i7,	%i5
	edge16l	%g4,	%o3,	%l2
	fornot2s	%f21,	%f24,	%f7
	movl	%xcc,	%g2,	%i3
	std	%f6,	[%l7 + 0x18]
	andncc	%i0,	%o2,	%g7
	addcc	%o4,	0x142B,	%g3
	udivcc	%l6,	0x0435,	%i6
	ld	[%l7 + 0x18],	%f3
	array32	%i4,	%l1,	%i2
	sdiv	%l0,	0x164C,	%o0
	fsrc2s	%f16,	%f6
	edge8	%o1,	%l5,	%i1
	fnot1s	%f1,	%f15
	orn	%o5,	%g1,	%g5
	orn	%g6,	%l3,	%o6
	fpsub32s	%f22,	%f29,	%f7
	edge8	%o7,	%i7,	%i5
	fnors	%f26,	%f18,	%f21
	nop
	set	0x48, %l3
	std	%f14,	[%l7 + %l3]
	fcmple16	%f18,	%f20,	%l4
	fpadd16s	%f6,	%f19,	%f22
	ldsw	[%l7 + 0x08],	%g4
	ldub	[%l7 + 0x3B],	%l2
	edge32ln	%g2,	%i3,	%o3
	xnorcc	%i0,	0x0974,	%o2
	fxor	%f4,	%f8,	%f10
	movrgez	%g7,	0x0A7,	%g3
	movne	%icc,	%o4,	%i6
	andn	%l6,	%l1,	%i4
	fcmps	%fcc0,	%f30,	%f15
	ldd	[%l7 + 0x50],	%i2
	movne	%xcc,	%o0,	%o1
	movle	%xcc,	%l0,	%l5
	srl	%o5,	0x19,	%i1
	fnot2s	%f2,	%f24
	and	%g5,	0x027C,	%g6
	udivx	%l3,	0x061C,	%g1
	fmovse	%icc,	%f17,	%f20
	smul	%o6,	%i7,	%o7
	srl	%l4,	0x08,	%g4
	xorcc	%l2,	0x0919,	%i5
	subcc	%g2,	0x1AEF,	%o3
	fcmped	%fcc3,	%f8,	%f20
	umul	%i0,	0x1F66,	%o2
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	fpsub16	%f18,	%f24,	%f10
	xorcc	%g3,	%o4,	%i6
	fmovrdlez	%l6,	%f10,	%f14
	for	%f24,	%f20,	%f8
	movg	%xcc,	%i4,	%i2
	movneg	%xcc,	%o0,	%o1
	fmovsneg	%icc,	%f20,	%f4
	ldsh	[%l7 + 0x6A],	%l0
	udivcc	%l1,	0x1472,	%l5
	fsrc1s	%f18,	%f8
	smulcc	%i1,	%o5,	%g5
	fmovsne	%xcc,	%f27,	%f3
	mova	%xcc,	%l3,	%g1
	fmovsvc	%icc,	%f20,	%f5
	fmovscc	%icc,	%f7,	%f20
	movge	%xcc,	%g6,	%o6
	sllx	%o7,	%l4,	%i7
	xorcc	%l2,	%g4,	%i5
	movpos	%xcc,	%o3,	%g2
	fmovde	%xcc,	%f2,	%f31
	sub	%i0,	%g7,	%i3
	ldx	[%l7 + 0x58],	%o2
	mulx	%g3,	%i6,	%o4
	edge32l	%l6,	%i2,	%o0
	smul	%i4,	%l0,	%o1
	smul	%l1,	0x1CB0,	%i1
	alignaddrl	%o5,	%g5,	%l3
	movrgez	%l5,	0x2AA,	%g6
	fmovrdlz	%g1,	%f0,	%f12
	xnorcc	%o6,	%l4,	%o7
	restore %i7, 0x109B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%g4,	%i5,	%o3
	srlx	%i0,	0x1E,	%g2
	subc	%g7,	%i3,	%o2
	std	%f2,	[%l7 + 0x08]
	ldub	[%l7 + 0x1F],	%g3
	movle	%icc,	%o4,	%l6
	andcc	%i6,	0x00F6,	%i2
	nop
	set	0x6C, %i3
	stb	%o0,	[%l7 + %i3]
	addcc	%i4,	%l0,	%l1
	movvs	%xcc,	%o1,	%i1
	edge16ln	%g5,	%l3,	%o5
	orncc	%g6,	0x1284,	%g1
	edge16l	%l5,	%o6,	%o7
	fandnot1s	%f18,	%f1,	%f21
	movrlez	%l4,	%i7,	%l2
	edge16l	%i5,	%o3,	%g4
	movrgz	%g2,	%i0,	%g7
	movg	%icc,	%i3,	%g3
	subccc	%o2,	0x084E,	%l6
	movge	%xcc,	%o4,	%i6
	fmovdvs	%icc,	%f31,	%f26
	ld	[%l7 + 0x08],	%f17
	srlx	%i2,	0x1C,	%i4
	xnorcc	%o0,	%l1,	%o1
	edge16	%l0,	%g5,	%i1
	sdiv	%l3,	0x1EFE,	%o5
	sdivx	%g6,	0x13A2,	%g1
	sub	%o6,	0x1929,	%o7
	ldsb	[%l7 + 0x24],	%l4
	edge16	%l5,	%i7,	%i5
	xorcc	%o3,	%l2,	%g2
	sll	%g4,	0x1B,	%i0
	sethi	0x1024,	%i3
	ld	[%l7 + 0x4C],	%f25
	orcc	%g3,	%o2,	%l6
	mulscc	%g7,	0x10F7,	%i6
	edge32l	%i2,	%o4,	%o0
	subcc	%l1,	0x1E57,	%o1
	move	%xcc,	%i4,	%l0
	sdivx	%i1,	0x1A17,	%l3
	fandnot2s	%f1,	%f4,	%f25
	nop
	set	0x78, %l0
	stw	%o5,	[%l7 + %l0]
	fmovsvs	%xcc,	%f7,	%f4
	movle	%xcc,	%g6,	%g1
	stx	%o6,	[%l7 + 0x10]
	edge16ln	%g5,	%o7,	%l5
	sth	%i7,	[%l7 + 0x18]
	ldsh	[%l7 + 0x66],	%i5
	addc	%l4,	0x0B58,	%l2
	fmovrdgez	%g2,	%f20,	%f22
	movvc	%xcc,	%g4,	%o3
	fnot2s	%f23,	%f24
	edge16	%i3,	%i0,	%g3
	subcc	%l6,	%o2,	%i6
	edge16n	%g7,	%i2,	%o4
	ldsb	[%l7 + 0x70],	%o0
	fpadd32	%f28,	%f20,	%f18
	xor	%l1,	%i4,	%l0
	st	%f18,	[%l7 + 0x24]
	fmovscs	%icc,	%f3,	%f0
	srl	%o1,	%i1,	%l3
	fmuld8ulx16	%f20,	%f8,	%f16
	ldx	[%l7 + 0x70],	%o5
	movl	%xcc,	%g6,	%o6
	ldd	[%l7 + 0x10],	%g4
	udiv	%o7,	0x0E78,	%g1
	sllx	%l5,	%i5,	%l4
	fmovdvc	%icc,	%f4,	%f20
	ldsh	[%l7 + 0x36],	%i7
	fmovsne	%xcc,	%f30,	%f19
	movleu	%icc,	%g2,	%l2
	std	%f4,	[%l7 + 0x08]
	fmovsg	%icc,	%f8,	%f22
	fmovdcs	%xcc,	%f0,	%f6
	fmovscs	%xcc,	%f18,	%f26
	udivx	%g4,	0x130F,	%o3
	sllx	%i3,	%g3,	%i0
	subc	%o2,	0x1D95,	%l6
	ldx	[%l7 + 0x38],	%i6
	movleu	%xcc,	%i2,	%o4
	fpackfix	%f16,	%f19
	movge	%icc,	%o0,	%l1
	fmul8x16al	%f13,	%f17,	%f0
	stx	%g7,	[%l7 + 0x18]
	ldsw	[%l7 + 0x6C],	%l0
	stb	%o1,	[%l7 + 0x0F]
	ld	[%l7 + 0x64],	%f24
	movgu	%icc,	%i4,	%i1
	array8	%o5,	%g6,	%l3
	nop
	set	0x7D, %i4
	ldub	[%l7 + %i4],	%g5
	fones	%f7
	sir	0x18DD
	save %o6, 0x1139, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l5,	%i5,	%g1
	nop
	set	0x6A, %i5
	sth	%i7,	[%l7 + %i5]
	lduw	[%l7 + 0x40],	%l4
	fone	%f8
	addc	%g2,	%g4,	%o3
	sra	%i3,	%l2,	%i0
	movcs	%icc,	%g3,	%l6
	movpos	%xcc,	%o2,	%i2
	orn	%o4,	%i6,	%o0
	srl	%l1,	0x0B,	%l0
	fpsub16s	%f3,	%f1,	%f23
	sir	0x10F9
	xnor	%o1,	%g7,	%i4
	sub	%o5,	%g6,	%l3
	stb	%g5,	[%l7 + 0x38]
	movle	%icc,	%o6,	%i1
	bshuffle	%f26,	%f14,	%f24
	ldsh	[%l7 + 0x22],	%l5
	fmovrsgez	%i5,	%f26,	%f23
	edge32	%o7,	%g1,	%l4
	ldd	[%l7 + 0x40],	%i6
	edge16n	%g2,	%o3,	%i3
	mulx	%l2,	0x0B83,	%g4
	movrgez	%g3,	%l6,	%i0
	addcc	%i2,	%o4,	%i6
	mova	%icc,	%o0,	%l1
	subccc	%l0,	%o2,	%o1
	edge8	%g7,	%i4,	%g6
	udivcc	%l3,	0x1C58,	%o5
	fornot1	%f12,	%f28,	%f28
	ldsh	[%l7 + 0x54],	%g5
	movg	%icc,	%o6,	%i1
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fmul8x16au	%f2,	%f2,	%f20
	std	%f14,	[%l7 + 0x18]
	movne	%xcc,	%l5,	%g1
	movne	%xcc,	%l4,	%g2
	fcmpd	%fcc0,	%f2,	%f14
	ldsh	[%l7 + 0x0A],	%o3
	alignaddr	%i7,	%i3,	%l2
	movrlz	%g3,	%g4,	%i0
	mulscc	%i2,	%o4,	%i6
	fmovd	%f0,	%f26
	orn	%o0,	0x15C9,	%l1
	restore %l6, 0x0798, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o1,	%o2,	%g7
	popc	%i4,	%l3
	xor	%o5,	%g5,	%o6
	movrlez	%i1,	0x363,	%g6
	fnegd	%f4,	%f14
	fmovsleu	%icc,	%f30,	%f28
	smul	%i5,	%l5,	%o7
	fcmple32	%f18,	%f0,	%l4
	movn	%icc,	%g1,	%g2
	andn	%o3,	0x0659,	%i3
	array8	%l2,	%g3,	%g4
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	fcmpne32	%f22,	%f22,	%o4
	movre	%i6,	%o0,	%l6
	andncc	%l0,	%o1,	%o2
	movvs	%xcc,	%g7,	%l1
	addc	%i4,	0x0B6C,	%l3
	edge8n	%g5,	%o6,	%i1
	subcc	%g6,	0x098C,	%o5
	nop
	set	0x54, %o0
	ldsw	[%l7 + %o0],	%l5
	fmovscs	%icc,	%f21,	%f30
	movl	%xcc,	%i5,	%l4
	fmovrde	%o7,	%f0,	%f22
	edge8n	%g1,	%o3,	%g2
	orcc	%l2,	0x1670,	%i3
	fands	%f28,	%f30,	%f7
	orncc	%g4,	%i0,	%i2
	array8	%i7,	%o4,	%g3
	fmovdge	%xcc,	%f2,	%f16
	udivcc	%o0,	0x193E,	%l6
	fcmple32	%f16,	%f0,	%l0
	movge	%icc,	%o1,	%o2
	movcs	%xcc,	%g7,	%i6
	nop
	set	0x26, %g6
	sth	%i4,	[%l7 + %g6]
	mulx	%l1,	%g5,	%l3
	alignaddr	%i1,	%g6,	%o5
	xorcc	%o6,	0x1AA2,	%i5
	sth	%l4,	[%l7 + 0x60]
	fcmple32	%f24,	%f8,	%o7
	fcmpes	%fcc2,	%f2,	%f8
	ldsw	[%l7 + 0x64],	%g1
	ldub	[%l7 + 0x4F],	%l5
	addccc	%g2,	%l2,	%o3
	lduw	[%l7 + 0x40],	%i3
	movrgez	%g4,	%i0,	%i2
	and	%o4,	%g3,	%o0
	xorcc	%i7,	%l6,	%l0
	std	%f14,	[%l7 + 0x48]
	sub	%o1,	%o2,	%i6
	ldd	[%l7 + 0x20],	%f10
	movcc	%icc,	%g7,	%l1
	sth	%g5,	[%l7 + 0x3E]
	std	%f12,	[%l7 + 0x30]
	fpsub32	%f20,	%f0,	%f8
	array16	%i4,	%i1,	%g6
	edge32	%l3,	%o6,	%o5
	alignaddr	%l4,	%o7,	%i5
	alignaddr	%l5,	%g1,	%g2
	fmovrdgz	%o3,	%f22,	%f14
	andncc	%i3,	%g4,	%l2
	sir	0x1607
	sethi	0x0624,	%i2
	fnot2	%f2,	%f16
	edge32	%i0,	%g3,	%o4
	movcs	%xcc,	%i7,	%o0
	ldub	[%l7 + 0x10],	%l0
	edge32ln	%l6,	%o2,	%o1
	popc	%g7,	%i6
	subccc	%g5,	%l1,	%i4
	fcmps	%fcc1,	%f11,	%f23
	movvs	%icc,	%g6,	%l3
	ld	[%l7 + 0x24],	%f24
	lduw	[%l7 + 0x7C],	%i1
	fxors	%f19,	%f26,	%f31
	addc	%o6,	0x046D,	%o5
	movn	%xcc,	%l4,	%i5
	andcc	%l5,	%g1,	%o7
	movrlez	%o3,	0x3E1,	%i3
	fandnot1	%f0,	%f28,	%f0
	array32	%g2,	%g4,	%l2
	movrgez	%i2,	0x020,	%g3
	fabsd	%f20,	%f6
	siam	0x4
	movrne	%o4,	0x1A5,	%i0
	movre	%i7,	0x34D,	%o0
	ldub	[%l7 + 0x6B],	%l6
	addcc	%l0,	%o2,	%g7
	fnot2s	%f21,	%f0
	xorcc	%o1,	%g5,	%l1
	smulcc	%i4,	0x16E0,	%i6
	umulcc	%g6,	0x0B19,	%i1
	edge8n	%l3,	%o6,	%l4
	lduh	[%l7 + 0x16],	%o5
	fcmpne32	%f28,	%f8,	%l5
	ldsw	[%l7 + 0x30],	%g1
	and	%i5,	0x0F9E,	%o7
	movg	%xcc,	%i3,	%g2
	movvs	%xcc,	%g4,	%o3
	array8	%i2,	%g3,	%l2
	movrgez	%i0,	0x30B,	%i7
	mulx	%o4,	%l6,	%o0
	movle	%icc,	%o2,	%l0
	sllx	%g7,	0x06,	%o1
	orn	%g5,	0x13D7,	%l1
	fmovrslez	%i4,	%f9,	%f15
	movrlez	%g6,	0x161,	%i6
	fnors	%f10,	%f1,	%f26
	fandnot2s	%f19,	%f29,	%f5
	alignaddr	%l3,	%i1,	%o6
	fmovdne	%xcc,	%f30,	%f26
	sethi	0x1DBB,	%o5
	addcc	%l4,	0x0C65,	%g1
	srl	%i5,	%l5,	%i3
	ldd	[%l7 + 0x78],	%g2
	sethi	0x10D9,	%o7
	array8	%o3,	%i2,	%g3
	move	%xcc,	%g4,	%i0
	sdivcc	%l2,	0x1EE2,	%o4
	fmovrse	%l6,	%f5,	%f28
	fsrc2	%f10,	%f30
	fzeros	%f15
	fnot1	%f14,	%f2
	subccc	%i7,	0x12ED,	%o2
	andn	%l0,	0x0559,	%g7
	sdivx	%o1,	0x0556,	%o0
	move	%icc,	%l1,	%i4
	ldsw	[%l7 + 0x24],	%g5
	andncc	%i6,	%g6,	%i1
	fcmpgt32	%f2,	%f0,	%l3
	ldub	[%l7 + 0x7F],	%o6
	fmovsgu	%icc,	%f25,	%f11
	movne	%xcc,	%l4,	%o5
	smulcc	%g1,	0x0297,	%i5
	fmovsg	%icc,	%f5,	%f16
	fand	%f6,	%f16,	%f20
	andncc	%l5,	%g2,	%i3
	array32	%o7,	%i2,	%g3
	smul	%g4,	0x0E98,	%i0
	array32	%l2,	%o3,	%l6
	subc	%i7,	%o4,	%o2
	srl	%l0,	0x1C,	%o1
	fzero	%f4
	movrlez	%o0,	0x3B7,	%l1
	fpackfix	%f12,	%f3
	edge8l	%g7,	%g5,	%i6
	edge8n	%g6,	%i1,	%l3
	movrlez	%o6,	%l4,	%o5
	sdivcc	%i4,	0x0E20,	%g1
	movvs	%icc,	%l5,	%g2
	srl	%i3,	%i5,	%i2
	addc	%o7,	%g4,	%g3
	movgu	%icc,	%i0,	%l2
	stx	%o3,	[%l7 + 0x20]
	edge16n	%l6,	%o4,	%i7
	edge32ln	%o2,	%o1,	%l0
	std	%f22,	[%l7 + 0x38]
	fmovsg	%icc,	%f29,	%f6
	ldub	[%l7 + 0x0F],	%l1
	movpos	%icc,	%g7,	%o0
	restore %g5, 0x0862, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i1,	0x030D,	%l3
	subcc	%o6,	0x047F,	%i6
	smul	%o5,	%l4,	%g1
	fmovsne	%icc,	%f26,	%f25
	addc	%i4,	%l5,	%i3
	siam	0x6
	addcc	%g2,	%i2,	%i5
	alignaddrl	%g4,	%o7,	%g3
	subccc	%i0,	%o3,	%l6
	movge	%icc,	%o4,	%l2
	stx	%o2,	[%l7 + 0x18]
	movcs	%xcc,	%i7,	%l0
	movcs	%xcc,	%o1,	%g7
	movvs	%xcc,	%o0,	%l1
	movneg	%icc,	%g6,	%i1
	movrgez	%g5,	0x027,	%l3
	st	%f12,	[%l7 + 0x34]
	srl	%o6,	%i6,	%o5
	xor	%l4,	%i4,	%g1
	fcmpne16	%f0,	%f6,	%i3
	edge16	%g2,	%l5,	%i2
	fmovspos	%icc,	%f4,	%f15
	add	%g4,	%o7,	%g3
	subc	%i0,	0x0A1E,	%o3
	ldub	[%l7 + 0x7F],	%i5
	popc	0x15F4,	%o4
	fmovdneg	%icc,	%f29,	%f29
	edge16l	%l6,	%l2,	%i7
	subcc	%o2,	%l0,	%o1
	subcc	%o0,	%l1,	%g7
	sth	%i1,	[%l7 + 0x6C]
	fnegs	%f6,	%f30
	andn	%g5,	0x01B9,	%g6
	stb	%l3,	[%l7 + 0x41]
	and	%o6,	%i6,	%o5
	movpos	%xcc,	%l4,	%g1
	edge8ln	%i3,	%i4,	%g2
	movcc	%xcc,	%i2,	%l5
	stx	%o7,	[%l7 + 0x30]
	ldsh	[%l7 + 0x1A],	%g4
	stx	%g3,	[%l7 + 0x70]
	move	%xcc,	%o3,	%i0
	fmovrsgz	%o4,	%f2,	%f30
	fornot1	%f2,	%f6,	%f28
	movcc	%icc,	%i5,	%l6
	andncc	%i7,	%l2,	%o2
	xor	%o1,	0x0435,	%o0
	movne	%xcc,	%l1,	%g7
	alignaddr	%i1,	%l0,	%g5
	popc	0x0100,	%l3
	sth	%g6,	[%l7 + 0x50]
	movrlez	%o6,	%i6,	%o5
	sdivcc	%g1,	0x07C1,	%i3
	fmuld8sux16	%f8,	%f19,	%f4
	edge32ln	%i4,	%l4,	%g2
	ldsh	[%l7 + 0x58],	%l5
	sdivx	%o7,	0x1253,	%i2
	stx	%g4,	[%l7 + 0x40]
	stw	%o3,	[%l7 + 0x48]
	srl	%i0,	%g3,	%o4
	fcmpgt16	%f12,	%f8,	%l6
	fmovsn	%icc,	%f6,	%f17
	popc	%i7,	%l2
	xorcc	%i5,	0x0D72,	%o2
	fpadd32s	%f22,	%f5,	%f9
	sir	0x0B4A
	edge8ln	%o0,	%l1,	%o1
	alignaddr	%g7,	%l0,	%i1
	addccc	%l3,	%g6,	%o6
	ldsb	[%l7 + 0x1D],	%i6
	udivcc	%o5,	0x1352,	%g5
	fmovsle	%xcc,	%f0,	%f24
	xnorcc	%i3,	0x0914,	%g1
	save %i4, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%o7,	0x09D5,	%g2
	edge8ln	%i2,	%g4,	%o3
	movcs	%xcc,	%g3,	%o4
	movvc	%icc,	%l6,	%i0
	stb	%l2,	[%l7 + 0x66]
	alignaddrl	%i5,	%o2,	%o0
	add	%l1,	%o1,	%g7
	edge8n	%l0,	%i7,	%l3
	mulscc	%i1,	%g6,	%o6
	fzeros	%f8
	array8	%i6,	%o5,	%g5
	edge8ln	%i3,	%i4,	%g1
	fmovdgu	%icc,	%f27,	%f31
	sir	0x0076
	array32	%l5,	%l4,	%g2
	movre	%i2,	0x149,	%g4
	fnand	%f8,	%f22,	%f24
	fones	%f4
	movvc	%xcc,	%o7,	%o3
	ldsh	[%l7 + 0x30],	%g3
	orncc	%l6,	%o4,	%l2
	movrne	%i0,	%o2,	%i5
	orn	%l1,	0x1B4A,	%o0
	movrne	%g7,	%o1,	%l0
	sllx	%i7,	%l3,	%g6
	fsrc1s	%f5,	%f22
	ldsw	[%l7 + 0x7C],	%o6
	ldsh	[%l7 + 0x6C],	%i1
	sub	%o5,	%g5,	%i3
	orncc	%i4,	%g1,	%l5
	edge32l	%l4,	%g2,	%i6
	fandnot1s	%f7,	%f25,	%f21
	fmovdvs	%icc,	%f15,	%f28
	faligndata	%f12,	%f0,	%f22
	udivcc	%g4,	0x1640,	%i2
	fmovsgu	%icc,	%f18,	%f19
	movg	%icc,	%o3,	%g3
	sra	%o7,	%o4,	%l2
	udiv	%i0,	0x1CE3,	%o2
	array32	%l6,	%i5,	%o0
	and	%l1,	%g7,	%o1
	mulscc	%l0,	0x13D9,	%i7
	mova	%icc,	%g6,	%o6
	fpsub16s	%f9,	%f8,	%f16
	or	%i1,	%l3,	%o5
	fone	%f30
	xnorcc	%g5,	0x0F0B,	%i3
	fnegs	%f29,	%f8
	fmovspos	%xcc,	%f14,	%f9
	fmuld8sux16	%f14,	%f7,	%f26
	fornot2	%f12,	%f14,	%f28
	ldx	[%l7 + 0x28],	%i4
	fpadd32	%f28,	%f20,	%f6
	lduh	[%l7 + 0x16],	%g1
	orncc	%l5,	0x1562,	%g2
	udivcc	%i6,	0x1B87,	%l4
	subc	%i2,	0x1CA5,	%g4
	st	%f24,	[%l7 + 0x30]
	srl	%g3,	%o7,	%o3
	sdivx	%l2,	0x01AB,	%i0
	edge32l	%o2,	%l6,	%i5
	popc	%o4,	%o0
	ldsh	[%l7 + 0x14],	%g7
	fmovdvc	%xcc,	%f23,	%f23
	udivx	%o1,	0x0E9A,	%l0
	array16	%i7,	%l1,	%o6
	fnot2	%f10,	%f14
	edge16n	%i1,	%l3,	%g6
	and	%g5,	%i3,	%i4
	fcmpne32	%f20,	%f4,	%o5
	movneg	%icc,	%l5,	%g1
	and	%i6,	0x0E00,	%g2
	ldx	[%l7 + 0x18],	%l4
	fmovrdne	%i2,	%f28,	%f6
	movneg	%xcc,	%g4,	%o7
	fpsub32s	%f0,	%f13,	%f9
	movn	%xcc,	%o3,	%l2
	andncc	%i0,	%g3,	%o2
	st	%f5,	[%l7 + 0x54]
	sth	%l6,	[%l7 + 0x5E]
	std	%f26,	[%l7 + 0x50]
	sdivcc	%i5,	0x1C79,	%o0
	sir	0x1E7D
	sth	%o4,	[%l7 + 0x64]
	fmovda	%icc,	%f27,	%f23
	fmovde	%icc,	%f31,	%f29
	edge16n	%o1,	%g7,	%l0
	fnors	%f0,	%f26,	%f15
	fmul8x16au	%f18,	%f10,	%f12
	sra	%l1,	0x1F,	%o6
	movcs	%xcc,	%i1,	%i7
	movne	%icc,	%g6,	%g5
	umulcc	%i3,	0x07F3,	%l3
	edge32ln	%o5,	%i4,	%l5
	edge8ln	%g1,	%g2,	%i6
	movneg	%icc,	%i2,	%g4
	sir	0x159E
	sdivcc	%l4,	0x0CB5,	%o3
	movn	%xcc,	%o7,	%l2
	sdivcc	%g3,	0x0C57,	%i0
	edge16l	%l6,	%i5,	%o0
	sub	%o4,	%o2,	%o1
	stb	%g7,	[%l7 + 0x12]
	srlx	%l0,	0x10,	%o6
	lduw	[%l7 + 0x08],	%i1
	xnorcc	%i7,	%l1,	%g6
	movneg	%xcc,	%i3,	%l3
	movrne	%o5,	0x1E4,	%g5
	umulcc	%i4,	0x198F,	%l5
	sub	%g2,	0x0759,	%g1
	popc	%i2,	%g4
	sdiv	%l4,	0x0E2D,	%o3
	andcc	%i6,	%o7,	%l2
	umulcc	%i0,	%g3,	%i5
	movneg	%icc,	%l6,	%o0
	sdivx	%o4,	0x1327,	%o1
	siam	0x1
	fmovrslz	%g7,	%f29,	%f2
	sth	%o2,	[%l7 + 0x1C]
	lduw	[%l7 + 0x20],	%l0
	sdivcc	%o6,	0x1CED,	%i1
	srlx	%i7,	%g6,	%l1
	edge8l	%l3,	%i3,	%g5
	xorcc	%i4,	0x16F9,	%o5
	orcc	%l5,	%g2,	%i2
	edge32n	%g1,	%l4,	%g4
	fnot2	%f28,	%f2
	fmovscc	%icc,	%f24,	%f31
	movgu	%icc,	%i6,	%o7
	edge32l	%l2,	%o3,	%g3
	stw	%i0,	[%l7 + 0x38]
	fpsub32	%f6,	%f20,	%f0
	ldsh	[%l7 + 0x7E],	%l6
	edge16	%i5,	%o4,	%o1
	umulcc	%o0,	0x0369,	%g7
	xnor	%o2,	0x0509,	%l0
	fpsub16s	%f9,	%f21,	%f6
	fmovrsgz	%o6,	%f12,	%f13
	movne	%icc,	%i1,	%i7
	srlx	%l1,	%l3,	%i3
	movrne	%g5,	%i4,	%o5
	edge32ln	%l5,	%g2,	%i2
	fands	%f4,	%f30,	%f11
	movrgez	%g1,	0x3D5,	%l4
	lduh	[%l7 + 0x08],	%g4
	andncc	%i6,	%o7,	%l2
	movpos	%xcc,	%g6,	%g3
	fnot2	%f28,	%f8
	fmovsge	%xcc,	%f10,	%f1
	edge32	%o3,	%i0,	%l6
	movn	%xcc,	%o4,	%o1
	fexpand	%f23,	%f24
	edge32n	%i5,	%o0,	%o2
	alignaddr	%g7,	%o6,	%l0
	fmovdne	%icc,	%f25,	%f3
	sub	%i1,	0x0EEA,	%i7
	orncc	%l3,	0x03D7,	%i3
	std	%f28,	[%l7 + 0x48]
	sdiv	%l1,	0x0479,	%g5
	addcc	%o5,	0x0346,	%i4
	sdiv	%l5,	0x0EDF,	%g2
	andn	%g1,	%l4,	%g4
	movneg	%xcc,	%i6,	%o7
	sra	%l2,	%i2,	%g3
	udivcc	%g6,	0x0E76,	%o3
	movre	%i0,	0x045,	%o4
	alignaddrl	%o1,	%l6,	%i5
	udivcc	%o0,	0x0324,	%g7
	andncc	%o2,	%o6,	%i1
	orn	%l0,	0x0B76,	%l3
	edge8l	%i7,	%l1,	%g5
	movge	%icc,	%i3,	%i4
	std	%f26,	[%l7 + 0x20]
	srax	%o5,	0x16,	%g2
	std	%f18,	[%l7 + 0x40]
	movl	%xcc,	%l5,	%l4
	pdist	%f10,	%f28,	%f30
	move	%xcc,	%g1,	%i6
	fmovdn	%xcc,	%f23,	%f20
	movcc	%xcc,	%o7,	%g4
	lduh	[%l7 + 0x78],	%i2
	fcmpne16	%f24,	%f12,	%l2
	ldd	[%l7 + 0x60],	%f8
	orcc	%g3,	0x17E4,	%g6
	sra	%i0,	0x1B,	%o4
	ldd	[%l7 + 0x10],	%f26
	fxnors	%f25,	%f29,	%f25
	orcc	%o1,	%o3,	%i5
	lduh	[%l7 + 0x30],	%l6
	udiv	%g7,	0x1EF0,	%o0
	ldsw	[%l7 + 0x40],	%o2
	subccc	%i1,	%o6,	%l3
	ldx	[%l7 + 0x30],	%i7
	movvc	%xcc,	%l1,	%l0
	movge	%icc,	%g5,	%i3
	subcc	%i4,	0x06D5,	%o5
	fmul8x16au	%f0,	%f19,	%f26
	sth	%l5,	[%l7 + 0x1A]
	stw	%g2,	[%l7 + 0x2C]
	edge8ln	%g1,	%l4,	%o7
	fcmple32	%f24,	%f10,	%g4
	srlx	%i2,	0x0F,	%i6
	sllx	%l2,	%g3,	%i0
	sdiv	%g6,	0x14C3,	%o1
	stw	%o3,	[%l7 + 0x14]
	sllx	%o4,	0x08,	%l6
	movcs	%xcc,	%g7,	%o0
	movne	%xcc,	%i5,	%o2
	andncc	%o6,	%l3,	%i1
	ldsb	[%l7 + 0x6B],	%i7
	addccc	%l0,	%l1,	%i3
	andncc	%g5,	%i4,	%o5
	ldd	[%l7 + 0x58],	%f10
	xnorcc	%l5,	0x071E,	%g1
	andncc	%g2,	%o7,	%g4
	fmovsle	%icc,	%f18,	%f26
	fsrc1	%f20,	%f12
	srlx	%i2,	%l4,	%l2
	sll	%g3,	%i0,	%i6
	xorcc	%o1,	0x0AA6,	%o3
	xnor	%o4,	0x1570,	%g6
	movrne	%g7,	0x202,	%l6
	nop
	set	0x70, %i1
	lduw	[%l7 + %i1],	%i5
	lduh	[%l7 + 0x6C],	%o2
	fmovsn	%xcc,	%f10,	%f10
	ld	[%l7 + 0x28],	%f21
	movrlez	%o6,	0x3F7,	%l3
	xnor	%o0,	0x1684,	%i1
	mulx	%i7,	%l0,	%l1
	movre	%i3,	%i4,	%o5
	sdivcc	%g5,	0x0830,	%l5
	fornot1	%f18,	%f8,	%f4
	edge32ln	%g1,	%g2,	%g4
	movvc	%icc,	%i2,	%o7
	sir	0x0818
	ldsw	[%l7 + 0x0C],	%l4
	movl	%xcc,	%g3,	%i0
	edge32	%l2,	%o1,	%o3
	sethi	0x07C9,	%i6
	ldsw	[%l7 + 0x08],	%g6
	subc	%o4,	%l6,	%g7
	fabsd	%f0,	%f8
	fmovrde	%o2,	%f24,	%f24
	fmovdgu	%icc,	%f7,	%f2
	edge32	%i5,	%o6,	%o0
	sll	%l3,	%i7,	%i1
	sllx	%l1,	%i3,	%i4
	umul	%l0,	0x058D,	%o5
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	movleu	%xcc,	%g2,	%g4
	sllx	%i2,	0x0B,	%l4
	array32	%g3,	%o7,	%l2
	edge8	%i0,	%o3,	%o1
	mulx	%i6,	0x031C,	%o4
	fmovdneg	%icc,	%f11,	%f0
	xor	%l6,	%g6,	%o2
	sth	%i5,	[%l7 + 0x32]
	std	%f14,	[%l7 + 0x20]
	subc	%o6,	%g7,	%l3
	subccc	%i7,	0x07ED,	%o0
	popc	%i1,	%i3
	fnor	%f4,	%f10,	%f24
	fabss	%f11,	%f7
	sdiv	%i4,	0x14DA,	%l1
	movcs	%xcc,	%o5,	%g5
	fzeros	%f22
	udivx	%g1,	0x09C2,	%l0
	fzero	%f30
	sir	0x1E1B
	sra	%g2,	%l5,	%g4
	stb	%l4,	[%l7 + 0x46]
	mulscc	%i2,	0x0235,	%g3
	movrlz	%o7,	%l2,	%o3
	ldsh	[%l7 + 0x0C],	%i0
	sdivcc	%i6,	0x19F0,	%o4
	fcmpes	%fcc1,	%f15,	%f15
	sdiv	%o1,	0x1A6C,	%l6
	move	%xcc,	%o2,	%g6
	ldsb	[%l7 + 0x0E],	%o6
	edge16n	%i5,	%g7,	%l3
	move	%icc,	%o0,	%i7
	sra	%i1,	0x18,	%i3
	movneg	%icc,	%l1,	%i4
	edge8	%o5,	%g1,	%g5
	subccc	%g2,	%l0,	%g4
	fcmpd	%fcc0,	%f4,	%f14
	edge32n	%l4,	%l5,	%g3
	sra	%i2,	%o7,	%o3
	lduh	[%l7 + 0x22],	%l2
	movrne	%i0,	%i6,	%o4
	stb	%o1,	[%l7 + 0x0D]
	fmovrse	%l6,	%f28,	%f28
	fmovscc	%xcc,	%f11,	%f22
	sdivcc	%o2,	0x1A18,	%g6
	fandnot2s	%f16,	%f15,	%f25
	sir	0x1E5F
	ldub	[%l7 + 0x76],	%i5
	sethi	0x068A,	%g7
	smulcc	%l3,	%o0,	%o6
	smul	%i1,	%i3,	%i7
	array32	%l1,	%o5,	%i4
	movrlz	%g1,	0x0F6,	%g5
	movcc	%xcc,	%g2,	%l0
	movpos	%icc,	%g4,	%l5
	ldd	[%l7 + 0x20],	%l4
	ldd	[%l7 + 0x70],	%i2
	move	%xcc,	%o7,	%g3
	ld	[%l7 + 0x20],	%f0
	movvs	%xcc,	%l2,	%o3
	ldx	[%l7 + 0x60],	%i6
	fcmpne16	%f26,	%f24,	%o4
	array32	%o1,	%i0,	%o2
	movcc	%xcc,	%g6,	%l6
	and	%i5,	0x11FD,	%g7
	sllx	%l3,	0x0E,	%o6
	sllx	%o0,	0x12,	%i3
	movcs	%xcc,	%i7,	%i1
	ld	[%l7 + 0x5C],	%f23
	sll	%o5,	%l1,	%i4
	sir	0x1230
	fcmple16	%f12,	%f24,	%g1
	lduh	[%l7 + 0x10],	%g2
	edge8l	%l0,	%g4,	%l5
	or	%g5,	%l4,	%i2
	fandnot2	%f10,	%f0,	%f20
	movpos	%icc,	%o7,	%g3
	fpsub16s	%f11,	%f15,	%f14
	fmovsvs	%xcc,	%f3,	%f18
	udivx	%o3,	0x0797,	%i6
	xorcc	%o4,	%l2,	%i0
	movrlez	%o1,	%o2,	%g6
	and	%i5,	%g7,	%l3
	nop
	set	0x5E, %l6
	ldub	[%l7 + %l6],	%l6
	fnand	%f30,	%f14,	%f10
	orn	%o6,	%o0,	%i7
	sdivcc	%i1,	0x00AC,	%o5
	movre	%l1,	0x01D,	%i4
	stw	%i3,	[%l7 + 0x60]
	ldub	[%l7 + 0x34],	%g2
	movcc	%icc,	%l0,	%g1
	movneg	%xcc,	%g4,	%g5
	add	%l4,	0x19A4,	%l5
	lduw	[%l7 + 0x64],	%o7
	fmul8sux16	%f8,	%f24,	%f8
	subc	%i2,	%g3,	%o3
	fpack16	%f30,	%f9
	edge16ln	%i6,	%o4,	%i0
	movl	%xcc,	%o1,	%o2
	stw	%g6,	[%l7 + 0x14]
	edge32l	%i5,	%l2,	%g7
	movvc	%icc,	%l3,	%l6
	subc	%o0,	%i7,	%o6
	fnands	%f13,	%f0,	%f16
	ldd	[%l7 + 0x78],	%i0
	umul	%o5,	%l1,	%i4
	fnegd	%f20,	%f4
	fnands	%f11,	%f17,	%f13
	nop
	set	0x20, %o5
	ldd	[%l7 + %o5],	%f28
	sdivcc	%i3,	0x1FC9,	%g2
	siam	0x3
	edge16	%g1,	%l0,	%g5
	sra	%l4,	0x0C,	%l5
	edge16n	%o7,	%i2,	%g3
	subccc	%g4,	0x09B2,	%i6
	mova	%xcc,	%o3,	%o4
	fmovsg	%icc,	%f25,	%f8
	edge32ln	%o1,	%o2,	%i0
	nop
	set	0x0C, %g4
	ldsh	[%l7 + %g4],	%i5
	and	%g6,	%l2,	%g7
	fcmple16	%f22,	%f2,	%l3
	andcc	%o0,	%i7,	%l6
	fmul8x16	%f16,	%f28,	%f4
	udivx	%o6,	0x0DB4,	%o5
	alignaddr	%l1,	%i1,	%i3
	fand	%f28,	%f20,	%f0
	movleu	%icc,	%g2,	%i4
	edge8l	%l0,	%g1,	%l4
	fmul8sux16	%f0,	%f10,	%f2
	edge8ln	%l5,	%o7,	%i2
	edge32ln	%g5,	%g4,	%i6
	array16	%o3,	%o4,	%o1
	or	%o2,	%i0,	%g3
	umul	%i5,	%g6,	%l2
	fpadd32	%f24,	%f28,	%f26
	movrlz	%g7,	0x320,	%o0
	movrlez	%l3,	%l6,	%o6
	ld	[%l7 + 0x70],	%f1
	xor	%i7,	0x10DB,	%l1
	xorcc	%i1,	%o5,	%g2
	sub	%i4,	%i3,	%g1
	movre	%l4,	0x21C,	%l0
	fones	%f27
	fpack16	%f20,	%f9
	movl	%icc,	%o7,	%l5
	xorcc	%i2,	0x1E7F,	%g4
	andncc	%i6,	%g5,	%o4
	movg	%xcc,	%o3,	%o1
	fxor	%f14,	%f20,	%f14
	movrgz	%i0,	0x100,	%o2
	fsrc1	%f24,	%f6
	edge8ln	%i5,	%g3,	%g6
	ld	[%l7 + 0x38],	%f19
	movneg	%xcc,	%l2,	%o0
	sir	0x1486
	and	%l3,	0x1B7F,	%g7
	sdivx	%l6,	0x0051,	%i7
	st	%f23,	[%l7 + 0x20]
	orn	%o6,	%l1,	%o5
	smulcc	%i1,	%i4,	%i3
	srlx	%g2,	0x00,	%g1
	movrlz	%l0,	%o7,	%l4
	fcmps	%fcc3,	%f10,	%f8
	faligndata	%f24,	%f24,	%f14
	fcmpd	%fcc0,	%f14,	%f26
	fands	%f4,	%f31,	%f2
	srlx	%l5,	%i2,	%i6
	ldsb	[%l7 + 0x59],	%g5
	fmovs	%f1,	%f2
	subc	%o4,	0x0329,	%o3
	movvs	%xcc,	%o1,	%g4
	xnorcc	%o2,	0x09AD,	%i5
	st	%f17,	[%l7 + 0x54]
	smulcc	%g3,	%i0,	%l2
	ldd	[%l7 + 0x50],	%o0
	edge16ln	%l3,	%g7,	%l6
	fmovsgu	%icc,	%f19,	%f28
	alignaddrl	%i7,	%g6,	%o6
	sllx	%l1,	%i1,	%o5
	stw	%i4,	[%l7 + 0x34]
	sth	%i3,	[%l7 + 0x66]
	fmovdleu	%xcc,	%f30,	%f21
	srlx	%g1,	%l0,	%o7
	edge8ln	%l4,	%g2,	%l5
	andn	%i2,	0x1531,	%i6
	movrgez	%o4,	%g5,	%o1
	movge	%icc,	%o3,	%g4
	edge32	%o2,	%i5,	%g3
	fmovrsgz	%l2,	%f9,	%f6
	lduh	[%l7 + 0x48],	%o0
	edge8l	%l3,	%g7,	%i0
	subcc	%i7,	0x187E,	%l6
	array8	%o6,	%g6,	%l1
	popc	0x0B56,	%o5
	movcc	%icc,	%i4,	%i1
	fors	%f8,	%f25,	%f6
	xnor	%g1,	0x14EE,	%i3
	edge16n	%o7,	%l0,	%g2
	sth	%l4,	[%l7 + 0x22]
	sdivx	%i2,	0x1AD6,	%l5
	umul	%i6,	%o4,	%o1
	sir	0x1D21
	sll	%o3,	%g4,	%g5
	udivx	%i5,	0x1AD9,	%o2
	fmovrslez	%g3,	%f26,	%f9
	fcmple16	%f18,	%f14,	%o0
	movcs	%icc,	%l3,	%l2
	sdivx	%g7,	0x111F,	%i0
	smulcc	%l6,	%o6,	%g6
	movcc	%xcc,	%l1,	%i7
	edge32	%i4,	%o5,	%i1
	fornot2	%f28,	%f14,	%f2
	movre	%i3,	%g1,	%o7
	fnands	%f3,	%f4,	%f6
	lduh	[%l7 + 0x76],	%g2
	fcmple16	%f2,	%f28,	%l4
	ldsh	[%l7 + 0x44],	%l0
	or	%i2,	%i6,	%l5
	orcc	%o4,	0x0454,	%o3
	movvc	%icc,	%g4,	%g5
	save %o1, 0x0570, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%o2,	%o0
	sllx	%l3,	%g7,	%l2
	movle	%icc,	%i0,	%l6
	lduw	[%l7 + 0x24],	%g6
	subc	%o6,	%l1,	%i4
	umulcc	%o5,	0x193F,	%i7
	sth	%i1,	[%l7 + 0x3A]
	st	%f31,	[%l7 + 0x28]
	add	%i3,	%o7,	%g2
	fmovsne	%icc,	%f14,	%f1
	fandnot1	%f8,	%f18,	%f28
	movne	%icc,	%l4,	%l0
	edge16ln	%g1,	%i2,	%i6
	movpos	%icc,	%l5,	%o4
	fpsub16s	%f11,	%f15,	%f19
	ldsw	[%l7 + 0x1C],	%g4
	fnot1s	%f17,	%f10
	xor	%o3,	0x020F,	%g5
	fsrc2s	%f17,	%f4
	smul	%i5,	0x1B0B,	%g3
	smulcc	%o1,	0x0BA0,	%o0
	sll	%o2,	%l3,	%l2
	edge16n	%i0,	%l6,	%g7
	edge16l	%g6,	%o6,	%i4
	movn	%xcc,	%l1,	%o5
	movgu	%icc,	%i1,	%i7
	fornot1	%f20,	%f12,	%f2
	fmovs	%f31,	%f3
	fnot1	%f10,	%f12
	sir	0x0272
	nop
	set	0x35, %g1
	ldub	[%l7 + %g1],	%o7
	fmovsn	%xcc,	%f17,	%f23
	andn	%i3,	0x1818,	%g2
	sethi	0x10D4,	%l0
	xorcc	%g1,	0x0B2C,	%i2
	edge16	%l4,	%l5,	%o4
	movle	%icc,	%i6,	%o3
	mulscc	%g4,	%i5,	%g5
	smul	%o1,	0x160C,	%g3
	sub	%o0,	0x0EB1,	%o2
	movl	%xcc,	%l3,	%i0
	movvs	%icc,	%l2,	%g7
	edge32n	%g6,	%o6,	%l6
	movg	%icc,	%l1,	%o5
	add	%i1,	%i4,	%i7
	movre	%i3,	0x23F,	%o7
	fnegd	%f0,	%f14
	edge8ln	%g2,	%l0,	%i2
	fmovsn	%icc,	%f0,	%f21
	addccc	%g1,	0x1539,	%l4
	ldsh	[%l7 + 0x0E],	%o4
	move	%icc,	%i6,	%l5
	umulcc	%g4,	0x1307,	%i5
	fmovse	%icc,	%f4,	%f0
	smul	%g5,	%o3,	%g3
	orcc	%o1,	%o2,	%l3
	edge32ln	%i0,	%o0,	%g7
	srl	%l2,	%o6,	%g6
	ld	[%l7 + 0x54],	%f2
	xorcc	%l1,	%l6,	%i1
	fsrc1s	%f11,	%f30
	edge32	%o5,	%i4,	%i7
	ld	[%l7 + 0x10],	%f8
	edge8n	%i3,	%o7,	%g2
	fsrc2s	%f26,	%f27
	edge32	%i2,	%l0,	%l4
	array16	%o4,	%i6,	%l5
	fmovsleu	%xcc,	%f5,	%f2
	fmovdleu	%xcc,	%f0,	%f14
	fmovsneg	%icc,	%f14,	%f17
	fmovsleu	%xcc,	%f25,	%f17
	subc	%g4,	0x1C16,	%i5
	addcc	%g1,	0x124E,	%g5
	xor	%o3,	%g3,	%o2
	movvc	%xcc,	%l3,	%i0
	fpack16	%f2,	%f8
	umulcc	%o1,	0x191B,	%g7
	nop
	set	0x38, %l2
	ldd	[%l7 + %l2],	%l2
	fpack16	%f2,	%f10
	fmovsleu	%icc,	%f16,	%f13
	stx	%o6,	[%l7 + 0x38]
	fornot1s	%f3,	%f29,	%f24
	ldx	[%l7 + 0x30],	%g6
	edge16ln	%l1,	%o0,	%l6
	umul	%i1,	%o5,	%i4
	movre	%i3,	0x259,	%o7
	fexpand	%f19,	%f20
	fmovrsgez	%g2,	%f6,	%f0
	fmovrsgz	%i2,	%f25,	%f9
	movg	%xcc,	%l0,	%i7
	srlx	%o4,	0x0F,	%i6
	nop
	set	0x2D, %l5
	ldsb	[%l7 + %l5],	%l5
	and	%g4,	%l4,	%g1
	movge	%xcc,	%i5,	%g5
	udivx	%g3,	0x0FA3,	%o2
	fmovsl	%xcc,	%f17,	%f4
	nop
	set	0x54, %o2
	ldsh	[%l7 + %o2],	%o3
	fmovdg	%xcc,	%f22,	%f9
	std	%f10,	[%l7 + 0x08]
	ld	[%l7 + 0x50],	%f16
	fpadd32s	%f17,	%f15,	%f6
	movpos	%xcc,	%l3,	%i0
	smulcc	%g7,	0x0ABC,	%o1
	fmovdleu	%icc,	%f4,	%f1
	srlx	%o6,	%g6,	%l1
	ldsw	[%l7 + 0x5C],	%o0
	fornot2	%f22,	%f26,	%f4
	movg	%xcc,	%l6,	%i1
	ldsh	[%l7 + 0x6A],	%l2
	edge8ln	%o5,	%i3,	%i4
	orcc	%g2,	0x0FE2,	%i2
	movg	%icc,	%l0,	%i7
	edge8	%o7,	%i6,	%l5
	movcc	%icc,	%o4,	%g4
	udivcc	%g1,	0x1646,	%l4
	fmovdcs	%xcc,	%f9,	%f31
	nop
	set	0x64, %o6
	stw	%i5,	[%l7 + %o6]
	alignaddrl	%g3,	%o2,	%o3
	edge8n	%g5,	%l3,	%g7
	smulcc	%o1,	%i0,	%o6
	sra	%l1,	%g6,	%o0
	fmovscs	%xcc,	%f3,	%f18
	edge8l	%l6,	%l2,	%o5
	fmovrde	%i1,	%f20,	%f16
	fcmpgt16	%f8,	%f14,	%i3
	xnorcc	%g2,	%i4,	%l0
	save %i2, %i7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f30,	%f3,	%f14
	sub	%l5,	%i6,	%g4
	udivx	%g1,	0x07A9,	%l4
	nop
	set	0x2B, %g5
	ldub	[%l7 + %g5],	%o4
	edge32n	%g3,	%o2,	%i5
	edge8l	%g5,	%l3,	%o3
	udivx	%o1,	0x0B1D,	%g7
	ldsh	[%l7 + 0x24],	%o6
	movl	%icc,	%l1,	%g6
	movvc	%icc,	%i0,	%o0
	edge16	%l6,	%l2,	%i1
	edge8n	%i3,	%o5,	%g2
	movne	%xcc,	%i4,	%l0
	popc	0x0F55,	%i2
	udivx	%i7,	0x15B2,	%o7
	fmovsg	%icc,	%f16,	%f5
	sdiv	%i6,	0x160C,	%l5
	array32	%g1,	%g4,	%l4
	fpsub16s	%f11,	%f4,	%f6
	srax	%o4,	0x1D,	%o2
	and	%i5,	0x159D,	%g3
	srlx	%g5,	0x14,	%l3
	movrgz	%o3,	0x326,	%g7
	andn	%o6,	%o1,	%l1
	umulcc	%g6,	0x1BF1,	%i0
	movne	%icc,	%o0,	%l2
	orcc	%i1,	0x1348,	%i3
	addc	%l6,	0x0847,	%g2
	ldd	[%l7 + 0x28],	%o4
	movge	%xcc,	%l0,	%i4
	stb	%i7,	[%l7 + 0x36]
	fmovsg	%xcc,	%f27,	%f3
	udiv	%i2,	0x0CBF,	%i6
	addccc	%o7,	0x0F4E,	%g1
	fmovsvs	%icc,	%f0,	%f25
	ldx	[%l7 + 0x70],	%g4
	orcc	%l5,	%l4,	%o4
	fmovrsne	%i5,	%f7,	%f11
	popc	0x1632,	%o2
	sir	0x0052
	movpos	%xcc,	%g3,	%l3
	fmovdvc	%icc,	%f4,	%f23
	lduh	[%l7 + 0x5A],	%g5
	andn	%g7,	%o6,	%o3
	movcs	%xcc,	%o1,	%l1
	sdivx	%g6,	0x08CD,	%i0
	stb	%l2,	[%l7 + 0x6D]
	nop
	set	0x78, %o4
	stx	%o0,	[%l7 + %o4]
	fmovsvc	%icc,	%f24,	%f15
	umul	%i1,	%i3,	%g2
	and	%o5,	0x1CB9,	%l0
	movl	%icc,	%l6,	%i4
	fmovdn	%xcc,	%f17,	%f14
	movrne	%i2,	0x3EE,	%i7
	umulcc	%i6,	0x0249,	%g1
	fands	%f31,	%f11,	%f0
	edge8ln	%g4,	%o7,	%l4
	andn	%o4,	%l5,	%i5
	smulcc	%g3,	%o2,	%l3
	movrlz	%g7,	%g5,	%o6
	srax	%o3,	0x08,	%l1
	movg	%icc,	%g6,	%o1
	ldsh	[%l7 + 0x40],	%l2
	movvc	%xcc,	%i0,	%o0
	fandnot1s	%f20,	%f23,	%f9
	array8	%i1,	%g2,	%o5
	orcc	%l0,	0x1B43,	%l6
	movge	%xcc,	%i3,	%i2
	fmovrsgez	%i4,	%f4,	%f12
	subcc	%i6,	0x16E5,	%i7
	fone	%f4
	fmovscs	%icc,	%f30,	%f17
	smul	%g1,	%o7,	%l4
	movpos	%icc,	%o4,	%g4
	subcc	%i5,	0x162B,	%l5
	sllx	%o2,	%l3,	%g7
	smul	%g3,	0x190C,	%o6
	xorcc	%o3,	0x0AC0,	%g5
	smulcc	%l1,	0x0BB2,	%o1
	pdist	%f18,	%f2,	%f26
	fornot1s	%f12,	%f29,	%f20
	sethi	0x124C,	%g6
	nop
	set	0x68, %l1
	lduh	[%l7 + %l1],	%i0
	fsrc2	%f0,	%f20
	sdiv	%o0,	0x1585,	%i1
	fmovde	%xcc,	%f24,	%f31
	movrgz	%g2,	%o5,	%l0
	sll	%l6,	%i3,	%i2
	edge16ln	%i4,	%i6,	%l2
	fmovsvs	%icc,	%f29,	%f30
	xnorcc	%g1,	%o7,	%l4
	array16	%i7,	%o4,	%i5
	fsrc1	%f22,	%f20
	fpackfix	%f24,	%f18
	nop
	set	0x10, %o1
	stb	%g4,	[%l7 + %o1]
	sll	%l5,	%o2,	%g7
	ldsh	[%l7 + 0x70],	%g3
	fmovrdlez	%l3,	%f10,	%f2
	movpos	%icc,	%o3,	%o6
	sethi	0x031D,	%l1
	fmovs	%f11,	%f1
	edge32l	%o1,	%g5,	%g6
	edge8ln	%o0,	%i0,	%i1
	edge8l	%g2,	%l0,	%o5
	lduw	[%l7 + 0x1C],	%i3
	for	%f10,	%f2,	%f16
	udivx	%l6,	0x07CB,	%i4
	alignaddrl	%i2,	%i6,	%l2
	fmovrsne	%g1,	%f20,	%f28
	subccc	%l4,	0x031A,	%o7
	fcmpgt32	%f18,	%f12,	%i7
	fnot2s	%f17,	%f15
	movrne	%o4,	0x0F7,	%g4
	smulcc	%i5,	%o2,	%g7
	movneg	%icc,	%g3,	%l5
	fmovde	%icc,	%f31,	%f0
	fones	%f22
	std	%f20,	[%l7 + 0x30]
	bshuffle	%f26,	%f2,	%f6
	add	%l3,	%o3,	%o6
	subcc	%l1,	0x15AB,	%o1
	subcc	%g5,	0x010F,	%o0
	edge8	%g6,	%i1,	%g2
	sdivcc	%l0,	0x1A0F,	%i0
	movge	%icc,	%i3,	%l6
	for	%f24,	%f12,	%f26
	udivcc	%i4,	0x1B2D,	%i2
	xorcc	%i6,	0x0AEB,	%l2
	movle	%icc,	%g1,	%l4
	fcmpne16	%f4,	%f20,	%o5
	fmovdvc	%icc,	%f19,	%f8
	and	%o7,	%i7,	%o4
	alignaddrl	%i5,	%o2,	%g7
	movgu	%icc,	%g4,	%l5
	xor	%l3,	0x0546,	%o3
	smul	%g3,	%l1,	%o6
	st	%f27,	[%l7 + 0x10]
	movrgz	%g5,	0x1A4,	%o0
	movne	%icc,	%o1,	%g6
	add	%i1,	0x1A40,	%l0
	movvs	%icc,	%i0,	%i3
	movle	%icc,	%g2,	%i4
	movrne	%i2,	%i6,	%l2
	nop
	set	0x48, %o3
	ldsb	[%l7 + %o3],	%g1
	fmovdge	%icc,	%f6,	%f24
	pdist	%f14,	%f18,	%f10
	st	%f30,	[%l7 + 0x54]
	ldsb	[%l7 + 0x5D],	%l4
	movge	%xcc,	%l6,	%o5
	sethi	0x053A,	%o7
	srax	%o4,	%i5,	%o2
	sdivx	%g7,	0x0F44,	%i7
	movgu	%xcc,	%g4,	%l3
	movleu	%xcc,	%l5,	%o3
	sdivcc	%g3,	0x063A,	%l1
	subc	%g5,	0x0EAE,	%o6
	ldsh	[%l7 + 0x3C],	%o1
	array16	%o0,	%g6,	%l0
	array32	%i1,	%i3,	%g2
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%i4
	fmovsgu	%icc,	%f5,	%f24
	fandnot2	%f2,	%f8,	%f4
	fmovrdgez	%i0,	%f24,	%f2
	or	%i2,	0x1B5B,	%l2
	movrgz	%g1,	%l4,	%l6
	movleu	%icc,	%o5,	%o7
	sdiv	%o4,	0x163A,	%i6
	andn	%i5,	%g7,	%i7
	or	%g4,	%l3,	%l5
	movrgz	%o2,	%o3,	%l1
	fands	%f23,	%f2,	%f1
	movge	%icc,	%g3,	%g5
	edge16l	%o6,	%o0,	%o1
	std	%f4,	[%l7 + 0x20]
	movcc	%xcc,	%l0,	%g6
	fxnor	%f12,	%f4,	%f22
	movleu	%icc,	%i3,	%g2
	sub	%i4,	0x17A0,	%i1
	lduw	[%l7 + 0x24],	%i2
	xnorcc	%i0,	0x0E2A,	%g1
	edge16	%l4,	%l6,	%o5
	movcc	%icc,	%l2,	%o4
	fmovrsne	%i6,	%f21,	%f1
	fmovrslz	%i5,	%f15,	%f30
	restore %o7, %g7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l3,	%i7,	%l5
	andcc	%o3,	%o2,	%g3
	orcc	%g5,	%l1,	%o6
	fpsub16	%f6,	%f22,	%f4
	subccc	%o0,	0x0F9F,	%l0
	xnor	%o1,	0x1824,	%i3
	edge16ln	%g2,	%i4,	%g6
	fmovdcs	%icc,	%f19,	%f17
	edge32n	%i1,	%i0,	%i2
	fcmpeq16	%f30,	%f28,	%l4
	movvs	%xcc,	%g1,	%l6
	subccc	%o5,	0x14F0,	%l2
	fxor	%f10,	%f24,	%f16
	fmovdne	%icc,	%f23,	%f27
	xorcc	%o4,	0x19C4,	%i5
	pdist	%f22,	%f12,	%f22
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	sir	0x15F1
	mulx	%g4,	0x00FE,	%i7
	sethi	0x0F42,	%l5
	fmovsleu	%xcc,	%f11,	%f13
	movrgz	%l3,	0x137,	%o2
	sllx	%g3,	0x1F,	%g5
	sll	%l1,	0x0B,	%o6
	srax	%o0,	%o3,	%o1
	movvs	%xcc,	%l0,	%g2
	andn	%i4,	%i3,	%g6
	array8	%i0,	%i1,	%i2
	ldd	[%l7 + 0x30],	%l4
	xor	%g1,	%o5,	%l6
	fmovrdgz	%l2,	%f10,	%f0
	xnor	%o4,	0x09FB,	%i5
	xorcc	%i6,	%g7,	%o7
	subc	%i7,	%g4,	%l5
	sllx	%o2,	0x11,	%g3
	fnor	%f10,	%f30,	%f26
	sra	%l3,	0x1E,	%g5
	fmovdge	%xcc,	%f28,	%f23
	or	%o6,	%o0,	%l1
	edge8n	%o1,	%o3,	%g2
	srax	%i4,	%l0,	%g6
	lduh	[%l7 + 0x20],	%i3
	fmovscc	%icc,	%f27,	%f2
	lduw	[%l7 + 0x28],	%i0
	sth	%i1,	[%l7 + 0x34]
	edge16	%i2,	%g1,	%l4
	edge32ln	%l6,	%o5,	%o4
	fmovsge	%icc,	%f12,	%f21
	sdivcc	%i5,	0x1C8E,	%i6
	lduw	[%l7 + 0x74],	%l2
	movg	%icc,	%o7,	%g7
	stb	%g4,	[%l7 + 0x54]
	add	%l5,	%i7,	%g3
	umulcc	%l3,	0x0041,	%g5
	xnor	%o2,	0x0C05,	%o0
	fmovsg	%xcc,	%f25,	%f23
	edge32ln	%l1,	%o6,	%o3
	fmovsleu	%icc,	%f7,	%f17
	add	%g2,	0x0834,	%i4
	subcc	%l0,	%g6,	%i3
	sethi	0x1576,	%o1
	umul	%i1,	%i0,	%g1
	edge16l	%i2,	%l6,	%l4
	fcmpne32	%f14,	%f26,	%o4
	edge16ln	%o5,	%i5,	%i6
	xor	%l2,	0x0A20,	%o7
	fmovd	%f10,	%f26
	srax	%g7,	0x08,	%g4
	movpos	%icc,	%i7,	%g3
	ldub	[%l7 + 0x1C],	%l5
	movl	%icc,	%g5,	%o2
	umul	%l3,	%o0,	%l1
	save %o3, 0x198B, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxnors	%f6,	%f19,	%f9
	fnegs	%f26,	%f11
	subc	%i4,	%o6,	%l0
	movvs	%xcc,	%g6,	%i3
	stw	%i1,	[%l7 + 0x10]
	sdiv	%o1,	0x08B3,	%i0
	edge8l	%i2,	%g1,	%l4
	fsrc2s	%f3,	%f1
	subccc	%o4,	0x1980,	%l6
	addccc	%o5,	0x041A,	%i6
	orcc	%l2,	%o7,	%g7
	edge32l	%i5,	%g4,	%i7
	and	%l5,	0x182B,	%g3
	stb	%o2,	[%l7 + 0x3B]
	srax	%l3,	%g5,	%o0
	sll	%o3,	0x19,	%g2
	ldsh	[%l7 + 0x16],	%i4
	umul	%l1,	%l0,	%o6
	fcmped	%fcc2,	%f18,	%f24
	orn	%g6,	%i1,	%i3
	fzero	%f10
	udiv	%i0,	0x144C,	%o1
	movg	%icc,	%i2,	%l4
	edge16l	%g1,	%o4,	%l6
	movneg	%icc,	%i6,	%l2
	movle	%xcc,	%o5,	%g7
	umul	%i5,	0x0DE0,	%o7
	edge16ln	%i7,	%l5,	%g4
	movleu	%icc,	%g3,	%l3
	stw	%o2,	[%l7 + 0x2C]
	fmovd	%f6,	%f4
	movl	%xcc,	%g5,	%o0
	andn	%g2,	%o3,	%i4
	array16	%l1,	%o6,	%l0
	stx	%g6,	[%l7 + 0x20]
	sub	%i1,	%i3,	%i0
	sllx	%i2,	%o1,	%l4
	alignaddr	%o4,	%l6,	%g1
	edge8ln	%i6,	%o5,	%l2
	fmovdge	%icc,	%f20,	%f16
	andn	%g7,	%o7,	%i7
	sdivcc	%l5,	0x0F7D,	%i5
	sdivx	%g4,	0x1FE0,	%g3
	movle	%xcc,	%o2,	%g5
	add	%o0,	%g2,	%o3
	ldx	[%l7 + 0x78],	%i4
	move	%icc,	%l1,	%l3
	sir	0x1215
	movvc	%xcc,	%o6,	%l0
	edge8	%g6,	%i3,	%i0
	sir	0x1759
	or	%i2,	%o1,	%i1
	movg	%xcc,	%l4,	%o4
	edge16ln	%l6,	%i6,	%o5
	ldsh	[%l7 + 0x66],	%g1
	edge32l	%l2,	%g7,	%i7
	movgu	%icc,	%l5,	%i5
	stb	%o7,	[%l7 + 0x13]
	movn	%icc,	%g3,	%o2
	or	%g4,	%o0,	%g2
	srlx	%g5,	0x11,	%i4
	addcc	%o3,	0x1508,	%l3
	ldx	[%l7 + 0x78],	%l1
	sth	%l0,	[%l7 + 0x30]
	movl	%icc,	%o6,	%g6
	edge32l	%i3,	%i2,	%o1
	movcc	%xcc,	%i0,	%i1
	addc	%o4,	0x116A,	%l4
	ldub	[%l7 + 0x08],	%i6
	move	%icc,	%o5,	%l6
	xor	%l2,	%g1,	%i7
	fcmpgt16	%f14,	%f30,	%g7
	andcc	%l5,	%o7,	%g3
	fcmpne16	%f16,	%f16,	%o2
	fmovrslz	%i5,	%f3,	%f25
	fxors	%f5,	%f19,	%f7
	srl	%o0,	%g2,	%g5
	std	%f12,	[%l7 + 0x20]
	andn	%g4,	0x1775,	%i4
	ldd	[%l7 + 0x18],	%l2
	and	%l1,	%l0,	%o3
	orncc	%o6,	%i3,	%i2
	restore %g6, %o1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o4,	%i1,	%i6
	edge8n	%l4,	%o5,	%l6
	xor	%l2,	0x16E9,	%g1
	xnorcc	%g7,	0x0674,	%i7
	mova	%xcc,	%l5,	%g3
	fcmpne16	%f24,	%f8,	%o7
	edge16n	%i5,	%o0,	%o2
	edge32	%g5,	%g4,	%g2
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%i4
	fmul8ulx16	%f16,	%f24,	%f4
	sra	%l3,	0x0E,	%l0
	array16	%l1,	%o6,	%i3
	xnorcc	%i2,	0x1E5F,	%o3
	sdivcc	%o1,	0x1E35,	%i0
	fsrc1s	%f10,	%f0
	movrgz	%g6,	%i1,	%i6
	sra	%o4,	%l4,	%l6
	popc	%o5,	%l2
	fornot1	%f16,	%f2,	%f4
	lduw	[%l7 + 0x48],	%g1
	movgu	%icc,	%i7,	%l5
	subcc	%g3,	0x1DCB,	%o7
	subccc	%g7,	%i5,	%o2
	smulcc	%g5,	0x0A1B,	%g4
	edge16	%o0,	%g2,	%i4
	fsrc2s	%f22,	%f30
	srlx	%l3,	0x18,	%l1
	fandnot1	%f0,	%f28,	%f18
	array8	%l0,	%o6,	%i2
	and	%o3,	%i3,	%o1
	stw	%i0,	[%l7 + 0x34]
	sra	%g6,	0x03,	%i6
	fmovrslz	%i1,	%f28,	%f2
	sra	%l4,	%l6,	%o5
	fmovdpos	%xcc,	%f23,	%f7
	ld	[%l7 + 0x08],	%f5
	movrlez	%l2,	0x37E,	%o4
	edge8ln	%i7,	%g1,	%g3
	addccc	%o7,	0x0FCF,	%l5
	movgu	%xcc,	%g7,	%o2
	nop
	set	0x54, %i7
	ldub	[%l7 + %i7],	%g5
	xnorcc	%i5,	%o0,	%g4
	ldx	[%l7 + 0x40],	%g2
	std	%f0,	[%l7 + 0x70]
	orncc	%l3,	%l1,	%i4
	sdiv	%l0,	0x02C3,	%o6
	stb	%o3,	[%l7 + 0x51]
	fmovrslz	%i3,	%f21,	%f29
	ldd	[%l7 + 0x10],	%i2
	addc	%o1,	%g6,	%i6
	fors	%f26,	%f4,	%f28
	fpadd16s	%f16,	%f6,	%f13
	stb	%i0,	[%l7 + 0x76]
	movpos	%xcc,	%l4,	%l6
	fmovs	%f19,	%f12
	xnor	%o5,	0x0B85,	%i1
	edge16l	%l2,	%i7,	%g1
	ldsh	[%l7 + 0x38],	%o4
	alignaddr	%g3,	%o7,	%g7
	orn	%l5,	%o2,	%i5
	xorcc	%o0,	%g5,	%g4
	edge8ln	%g2,	%l3,	%l1
	andn	%i4,	0x13B5,	%o6
	edge32	%l0,	%o3,	%i2
	fnot2s	%f7,	%f2
	udivx	%o1,	0x13EC,	%g6
	edge32l	%i6,	%i0,	%l4
	xorcc	%l6,	0x06EA,	%i3
	ldx	[%l7 + 0x70],	%i1
	array32	%l2,	%i7,	%o5
	movpos	%xcc,	%o4,	%g1
	fmul8x16au	%f22,	%f27,	%f18
	srlx	%g3,	0x12,	%g7
	and	%o7,	0x1F22,	%o2
	edge16ln	%l5,	%i5,	%o0
	save %g4, 0x1423, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x039D
	fpadd32	%f26,	%f22,	%f16
	movpos	%icc,	%g2,	%l3
	fmovdl	%xcc,	%f25,	%f17
	edge16n	%i4,	%l1,	%o6
	umulcc	%l0,	%o3,	%o1
	movrlez	%i2,	%i6,	%g6
	nop
	set	0x1A, %g2
	lduh	[%l7 + %g2],	%i0
	fmovrsne	%l4,	%f19,	%f25
	for	%f6,	%f26,	%f28
	edge32ln	%l6,	%i3,	%i1
	movneg	%icc,	%i7,	%o5
	or	%l2,	0x1DAC,	%g1
	movrlz	%o4,	%g7,	%g3
	mulscc	%o7,	%o2,	%i5
	edge32n	%o0,	%l5,	%g4
	udivcc	%g2,	0x1A07,	%g5
	fmovrse	%i4,	%f2,	%f7
	fandnot1s	%f26,	%f29,	%f7
	xnor	%l1,	0x06BA,	%o6
	std	%f20,	[%l7 + 0x38]
	srl	%l0,	%l3,	%o1
	udiv	%o3,	0x06C8,	%i2
	fones	%f5
	ld	[%l7 + 0x4C],	%f31
	fmovsleu	%icc,	%f18,	%f18
	movrgez	%i6,	%i0,	%g6
	sir	0x190B
	udiv	%l6,	0x1AA8,	%l4
	xnorcc	%i3,	%i1,	%o5
	movpos	%xcc,	%l2,	%i7
	edge16	%g1,	%g7,	%g3
	edge32l	%o4,	%o2,	%i5
	movcc	%xcc,	%o7,	%o0
	movre	%l5,	%g2,	%g5
	orcc	%g4,	0x0712,	%l1
	stw	%i4,	[%l7 + 0x10]
	udiv	%o6,	0x0A62,	%l3
	fcmpgt16	%f20,	%f20,	%o1
	edge32n	%o3,	%i2,	%l0
	ldsh	[%l7 + 0x52],	%i0
	array32	%i6,	%l6,	%g6
	fmovrse	%l4,	%f3,	%f16
	edge8l	%i3,	%o5,	%l2
	movg	%icc,	%i1,	%i7
	mulscc	%g7,	0x15E3,	%g1
	edge16ln	%g3,	%o2,	%o4
	stw	%i5,	[%l7 + 0x5C]
	sll	%o7,	%l5,	%g2
	addccc	%g5,	%g4,	%o0
	movneg	%xcc,	%i4,	%o6
	sdivcc	%l3,	0x165C,	%l1
	srax	%o3,	0x0F,	%o1
	ldx	[%l7 + 0x68],	%i2
	fcmped	%fcc1,	%f2,	%f22
	alignaddrl	%l0,	%i0,	%l6
	sdivcc	%g6,	0x0AC7,	%l4
	andncc	%i3,	%i6,	%l2
	fcmpes	%fcc3,	%f2,	%f24
	movle	%xcc,	%i1,	%i7
	ldd	[%l7 + 0x10],	%o4
	alignaddrl	%g7,	%g1,	%g3
	movre	%o4,	%i5,	%o7
	st	%f1,	[%l7 + 0x34]
	save %l5, %o2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g2,	%o0
	fmovsa	%xcc,	%f1,	%f15
	smulcc	%g4,	0x1774,	%i4
	movpos	%icc,	%l3,	%o6
	sub	%l1,	%o3,	%o1
	array32	%i2,	%l0,	%i0
	sethi	0x017A,	%g6
	alignaddrl	%l4,	%l6,	%i6
	alignaddr	%l2,	%i1,	%i3
	fmovrsgz	%i7,	%f14,	%f12
	movrlez	%o5,	%g1,	%g7
	movre	%g3,	%i5,	%o7
	movvs	%xcc,	%o4,	%l5
	edge8l	%g5,	%g2,	%o2
	fmovde	%icc,	%f4,	%f17
	addccc	%g4,	0x0518,	%o0
	xnorcc	%l3,	%o6,	%l1
	fmuld8ulx16	%f2,	%f12,	%f12
	fmovdcc	%xcc,	%f23,	%f9
	udivcc	%i4,	0x07D9,	%o1
	edge8ln	%i2,	%l0,	%o3
	smulcc	%i0,	%l4,	%l6
	movrgz	%i6,	%l2,	%g6
	fcmple16	%f6,	%f16,	%i3
	fnegd	%f6,	%f0
	mulscc	%i1,	%i7,	%g1
	fmovspos	%icc,	%f16,	%f18
	fzeros	%f20
	st	%f1,	[%l7 + 0x6C]
	nop
	set	0x0C, %l4
	sth	%g7,	[%l7 + %l4]
	fornot2s	%f19,	%f25,	%f20
	fcmps	%fcc1,	%f30,	%f19
	mova	%icc,	%o5,	%g3
	udiv	%o7,	0x09DA,	%i5
	fand	%f4,	%f24,	%f2
	sll	%o4,	0x1C,	%l5
	movge	%icc,	%g2,	%g5
	fand	%f30,	%f30,	%f12
	sth	%g4,	[%l7 + 0x08]
	sllx	%o2,	0x1C,	%l3
	or	%o0,	%l1,	%o6
	edge8l	%i4,	%i2,	%l0
	or	%o3,	0x0EFC,	%i0
	xnor	%l4,	%l6,	%i6
	movvc	%icc,	%o1,	%g6
	edge8ln	%i3,	%l2,	%i1
	fones	%f1
	ldsb	[%l7 + 0x64],	%g1
	movvc	%icc,	%g7,	%o5
	fpmerge	%f6,	%f17,	%f30
	stx	%i7,	[%l7 + 0x18]
	addccc	%g3,	0x076B,	%o7
	stw	%i5,	[%l7 + 0x70]
	addc	%l5,	0x1962,	%g2
	mova	%icc,	%o4,	%g5
	sir	0x1FC0
	fcmps	%fcc1,	%f4,	%f20
	edge16	%g4,	%l3,	%o0
	edge8l	%o2,	%o6,	%l1
	movl	%icc,	%i4,	%i2
	sdiv	%l0,	0x0704,	%i0
	fmovrdlz	%l4,	%f0,	%f26
	edge16ln	%l6,	%i6,	%o3
	fpsub16s	%f15,	%f27,	%f2
	fandnot1	%f12,	%f18,	%f8
	movg	%xcc,	%o1,	%i3
	alignaddr	%g6,	%i1,	%l2
	movrlz	%g1,	0x06F,	%o5
	fmovscs	%xcc,	%f1,	%f13
	fxor	%f2,	%f30,	%f10
	movre	%i7,	0x235,	%g7
	movneg	%icc,	%o7,	%i5
	ldx	[%l7 + 0x38],	%g3
	fmovdneg	%xcc,	%f31,	%f13
	movrlz	%l5,	%o4,	%g2
	fmovrsne	%g4,	%f16,	%f1
	ldsb	[%l7 + 0x36],	%g5
	fnot2	%f24,	%f12
	sdivx	%l3,	0x1E8D,	%o0
	udiv	%o2,	0x00EE,	%o6
	fcmped	%fcc0,	%f0,	%f2
	umul	%l1,	%i2,	%l0
	fmovsneg	%xcc,	%f15,	%f20
	movrgz	%i4,	%i0,	%l6
	movgu	%xcc,	%l4,	%i6
	ldub	[%l7 + 0x52],	%o1
	movneg	%icc,	%i3,	%g6
	movgu	%icc,	%o3,	%i1
	stw	%l2,	[%l7 + 0x68]
	ldsb	[%l7 + 0x3C],	%g1
	srax	%o5,	%g7,	%o7
	lduw	[%l7 + 0x30],	%i7
	fpadd32	%f24,	%f30,	%f26
	bshuffle	%f8,	%f8,	%f24
	sra	%g3,	%l5,	%o4
	xorcc	%g2,	0x0557,	%i5
	stw	%g5,	[%l7 + 0x2C]
	edge16	%l3,	%o0,	%g4
	xorcc	%o2,	0x1CD4,	%l1
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	fpsub16s	%f5,	%f3,	%f10
	fpack16	%f8,	%f12
	fcmpne16	%f16,	%f26,	%i0
	nop
	set	0x60, %i0
	ldx	[%l7 + %i0],	%l6
	edge8	%l4,	%l0,	%i6
	udivx	%i3,	0x11B2,	%o1
	stw	%g6,	[%l7 + 0x48]
	array32	%o3,	%i1,	%l2
	st	%f9,	[%l7 + 0x08]
	fcmps	%fcc3,	%f16,	%f28
	movneg	%xcc,	%g1,	%g7
	edge32n	%o5,	%o7,	%i7
	movrgz	%l5,	0x001,	%g3
	addccc	%g2,	0x15EE,	%i5
	fmovda	%xcc,	%f20,	%f11
	ldd	[%l7 + 0x40],	%g4
	srlx	%o4,	%l3,	%o0
	andn	%g4,	%l1,	%o2
	ldsw	[%l7 + 0x70],	%i2
	sll	%i4,	0x0E,	%i0
	fcmpne32	%f14,	%f24,	%l6
	movrgez	%l4,	0x1F9,	%o6
	xorcc	%l0,	%i3,	%o1
	array32	%g6,	%o3,	%i1
	movrlez	%i6,	0x3FC,	%l2
	movcs	%icc,	%g1,	%o5
	nop
	set	0x6C, %i6
	ldsw	[%l7 + %i6],	%o7
	movcc	%xcc,	%i7,	%l5
	st	%f30,	[%l7 + 0x08]
	movgu	%icc,	%g7,	%g3
	subc	%g2,	0x15CC,	%g5
	andncc	%o4,	%l3,	%o0
	array16	%i5,	%l1,	%g4
	ldsb	[%l7 + 0x0C],	%o2
	fabsd	%f22,	%f30
	sdivcc	%i2,	0x1E1C,	%i0
	fnors	%f5,	%f10,	%f13
	lduw	[%l7 + 0x5C],	%l6
	lduh	[%l7 + 0x1C],	%i4
	sethi	0x0A63,	%o6
	array16	%l4,	%i3,	%l0
	orn	%g6,	%o1,	%i1
	movvs	%icc,	%o3,	%i6
	edge16ln	%l2,	%o5,	%o7
	nop
	set	0x68, %g3
	stw	%i7,	[%l7 + %g3]
	edge8n	%g1,	%g7,	%g3
	st	%f2,	[%l7 + 0x60]
	orn	%l5,	%g2,	%o4
	subccc	%g5,	0x06B4,	%o0
	nop
	set	0x38, %l3
	lduw	[%l7 + %l3],	%l3
	fpadd32s	%f25,	%f20,	%f26
	array8	%l1,	%g4,	%o2
	alignaddr	%i2,	%i0,	%i5
	srl	%l6,	%o6,	%l4
	fmovsne	%icc,	%f16,	%f13
	edge8	%i4,	%i3,	%g6
	edge8n	%o1,	%l0,	%i1
	st	%f12,	[%l7 + 0x70]
	fmovrdgz	%o3,	%f28,	%f10
	edge16ln	%i6,	%l2,	%o7
	nop
	set	0x65, %g7
	stb	%i7,	[%l7 + %g7]
	mova	%icc,	%o5,	%g7
	sdivcc	%g3,	0x1ADE,	%l5
	fmovrsne	%g1,	%f18,	%f10
	lduh	[%l7 + 0x22],	%g2
	fmovdpos	%xcc,	%f14,	%f5
	save %g5, 0x10C4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%l3,	0x0E04,	%o0
	stw	%g4,	[%l7 + 0x48]
	fcmps	%fcc2,	%f5,	%f17
	movcs	%icc,	%o2,	%l1
	restore %i2, %i5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l6,	%l4,	%o6
	srl	%i3,	%i4,	%g6
	fmovrdgz	%o1,	%f26,	%f28
	fmovrdlz	%l0,	%f30,	%f14
	movg	%xcc,	%o3,	%i6
	movleu	%icc,	%i1,	%l2
	xnor	%o7,	0x1D63,	%i7
	fmul8x16al	%f4,	%f24,	%f28
	smulcc	%g7,	%g3,	%o5
	udiv	%g1,	0x01F5,	%l5
	save %g2, %g5, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l3,	%o0,	%o2
	array32	%g4,	%i2,	%l1
	mulscc	%i0,	0x0D59,	%i5
	lduw	[%l7 + 0x48],	%l4
	smulcc	%o6,	%l6,	%i4
	ldub	[%l7 + 0x20],	%i3
	fexpand	%f4,	%f0
	fmovrdne	%g6,	%f8,	%f24
	subc	%o1,	0x0AF3,	%l0
	sth	%o3,	[%l7 + 0x58]
	srax	%i6,	0x1C,	%i1
	ldd	[%l7 + 0x20],	%f6
	sra	%l2,	0x1C,	%i7
	alignaddr	%g7,	%g3,	%o5
	edge8l	%g1,	%o7,	%l5
	smul	%g2,	%o4,	%g5
	andncc	%l3,	%o0,	%g4
	srlx	%i2,	%o2,	%l1
	movl	%xcc,	%i0,	%i5
	addc	%l4,	%l6,	%o6
	stb	%i4,	[%l7 + 0x15]
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	mulx	%i3,	0x0A27,	%l0
	movgu	%xcc,	%i6,	%o3
	andn	%l2,	%i7,	%i1
	movrlez	%g3,	%g7,	%o5
	srl	%g1,	0x1C,	%l5
	movgu	%xcc,	%o7,	%g2
	fcmple16	%f16,	%f2,	%g5
	udivcc	%l3,	0x0367,	%o0
	move	%icc,	%o4,	%g4
	movrlez	%o2,	0x398,	%l1
	umul	%i2,	0x1B8A,	%i5
	mova	%icc,	%l4,	%l6
	fnegs	%f0,	%f29
	ldx	[%l7 + 0x70],	%o6
	movcc	%icc,	%i0,	%g6
	nop
	set	0x66, %l0
	ldsb	[%l7 + %l0],	%i4
	xor	%i3,	%l0,	%i6
	movneg	%icc,	%o3,	%o1
	subc	%i7,	0x03CB,	%i1
	sethi	0x1743,	%g3
	movle	%icc,	%l2,	%o5
	xnor	%g1,	%g7,	%l5
	addccc	%g2,	%o7,	%l3
	addc	%g5,	0x0701,	%o0
	srlx	%o4,	0x05,	%o2
	and	%g4,	%l1,	%i2
	fpadd32	%f16,	%f20,	%f30
	sethi	0x0623,	%i5
	fandnot1	%f2,	%f14,	%f6
	ldub	[%l7 + 0x55],	%l6
	movrgz	%l4,	%o6,	%i0
	orcc	%i4,	0x0497,	%g6
	sth	%i3,	[%l7 + 0x60]
	fmovd	%f28,	%f20
	movne	%xcc,	%i6,	%o3
	edge16ln	%o1,	%i7,	%l0
	fcmpgt16	%f30,	%f4,	%g3
	sdivcc	%l2,	0x08F0,	%i1
	subcc	%o5,	0x085F,	%g7
	ldsw	[%l7 + 0x10],	%g1
	ldd	[%l7 + 0x30],	%g2
	edge8l	%l5,	%l3,	%o7
	andn	%o0,	0x0971,	%o4
	st	%f28,	[%l7 + 0x34]
	movcc	%icc,	%o2,	%g5
	edge8l	%g4,	%i2,	%i5
	addccc	%l1,	0x0365,	%l4
	srax	%l6,	%o6,	%i0
	movrgz	%i4,	0x2BD,	%g6
	ldx	[%l7 + 0x38],	%i6
	ldx	[%l7 + 0x58],	%o3
	ldsb	[%l7 + 0x5B],	%i3
	fmovdge	%xcc,	%f29,	%f6
	smulcc	%i7,	%l0,	%g3
	sdiv	%o1,	0x1928,	%l2
	array8	%i1,	%g7,	%g1
	stb	%o5,	[%l7 + 0x45]
	edge8l	%g2,	%l3,	%l5
	ldd	[%l7 + 0x48],	%f0
	ld	[%l7 + 0x44],	%f11
	add	%o0,	%o4,	%o7
	sth	%g5,	[%l7 + 0x38]
	fxor	%f18,	%f4,	%f16
	movrne	%g4,	%i2,	%i5
	movrne	%o2,	0x206,	%l4
	ldsw	[%l7 + 0x2C],	%l1
	lduh	[%l7 + 0x44],	%o6
	movneg	%xcc,	%i0,	%i4
	array32	%g6,	%i6,	%l6
	sdivcc	%o3,	0x0CCE,	%i7
	edge8	%l0,	%i3,	%g3
	stx	%o1,	[%l7 + 0x20]
	ldsh	[%l7 + 0x42],	%l2
	fnot1	%f14,	%f16
	sdivx	%i1,	0x0CC9,	%g1
	sub	%g7,	0x0F1E,	%o5
	edge8n	%l3,	%g2,	%o0
	ldsb	[%l7 + 0x36],	%o4
	ldsh	[%l7 + 0x52],	%l5
	movrgez	%o7,	%g4,	%i2
	or	%i5,	0x1E4A,	%g5
	edge32ln	%l4,	%o2,	%o6
	ldub	[%l7 + 0x25],	%i0
	smul	%i4,	0x061E,	%l1
	stx	%i6,	[%l7 + 0x60]
	sdiv	%g6,	0x0AFB,	%l6
	popc	%i7,	%o3
	andcc	%i3,	0x10A0,	%l0
	fmul8x16	%f8,	%f0,	%f4
	move	%icc,	%g3,	%l2
	edge8l	%i1,	%o1,	%g7
	srlx	%g1,	%o5,	%g2
	sll	%l3,	0x06,	%o0
	sub	%o4,	0x0E24,	%l5
	sll	%g4,	%i2,	%i5
	fcmps	%fcc3,	%f15,	%f4
	alignaddrl	%g5,	%o7,	%l4
	addcc	%o6,	0x1873,	%o2
	edge32n	%i4,	%l1,	%i0
	ld	[%l7 + 0x40],	%f8
	fpadd16	%f28,	%f6,	%f6
	restore %i6, %l6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o3,	%i3,	%l0
	andcc	%g3,	%g6,	%l2
	orn	%o1,	0x16CF,	%g7
	edge16ln	%g1,	%i1,	%o5
	sdivx	%l3,	0x003C,	%g2
	movne	%icc,	%o0,	%l5
	ldx	[%l7 + 0x18],	%o4
	edge32ln	%i2,	%i5,	%g4
	fnot1s	%f17,	%f2
	movpos	%xcc,	%g5,	%l4
	popc	0x11F6,	%o7
	srax	%o2,	0x1B,	%o6
	save %l1, %i0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%l6,	%i7
	fxors	%f27,	%f14,	%f27
	umul	%o3,	%i6,	%l0
	ld	[%l7 + 0x54],	%f8
	std	%f16,	[%l7 + 0x28]
	ldsh	[%l7 + 0x40],	%i3
	edge8n	%g3,	%g6,	%o1
	fones	%f29
	sir	0x009B
	xnor	%l2,	0x08B3,	%g1
	ldsh	[%l7 + 0x3E],	%i1
	udivx	%g7,	0x1FC4,	%o5
	fmovrdgez	%l3,	%f20,	%f10
	fnot1s	%f26,	%f22
	array32	%o0,	%l5,	%g2
	ldd	[%l7 + 0x48],	%f20
	edge32n	%o4,	%i5,	%g4
	addccc	%i2,	0x1B47,	%g5
	or	%o7,	%l4,	%o6
	sethi	0x0BED,	%o2
	fmovrdlz	%l1,	%f4,	%f8
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	udivcc	%o3,	0x19E6,	%i7
	edge16l	%i6,	%i3,	%l0
	movcc	%xcc,	%g3,	%o1
	ldsb	[%l7 + 0x4D],	%g6
	fone	%f12
	fcmpd	%fcc2,	%f26,	%f2
	stx	%g1,	[%l7 + 0x60]
	movge	%icc,	%l2,	%i1
	fmovspos	%xcc,	%f3,	%f5
	xnorcc	%g7,	%o5,	%o0
	fmovrslz	%l5,	%f21,	%f10
	ldsb	[%l7 + 0x65],	%l3
	fmovdvc	%icc,	%f21,	%f9
	fandnot1s	%f25,	%f11,	%f15
	movpos	%xcc,	%o4,	%i5
	move	%xcc,	%g4,	%i2
	xor	%g5,	%o7,	%l4
	mulx	%g2,	%o2,	%o6
	edge8l	%l1,	%l6,	%i4
	save %i0, 0x106D, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i7,	%i3
	fandnot1	%f16,	%f2,	%f28
	save %l0, 0x0311, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g3,	%g6
	fmovscc	%xcc,	%f20,	%f17
	movgu	%icc,	%g1,	%l2
	edge8l	%i1,	%o1,	%g7
	sub	%o5,	0x0276,	%o0
	sra	%l5,	%l3,	%o4
	edge8n	%i5,	%i2,	%g5
	faligndata	%f24,	%f0,	%f4
	fmovdpos	%xcc,	%f0,	%f12
	save %o7, %g4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l4,	%o2
	ld	[%l7 + 0x28],	%f28
	mova	%xcc,	%l1,	%o6
	lduw	[%l7 + 0x50],	%i4
	movge	%xcc,	%l6,	%o3
	stb	%i0,	[%l7 + 0x73]
	andcc	%i7,	0x1437,	%i3
	movneg	%xcc,	%i6,	%l0
	stw	%g3,	[%l7 + 0x64]
	fmovrslz	%g6,	%f9,	%f28
	fornot2s	%f6,	%f9,	%f19
	xnorcc	%l2,	0x0ABF,	%g1
	sdivcc	%o1,	0x0AE4,	%g7
	movpos	%icc,	%o5,	%i1
	fmovsvs	%icc,	%f28,	%f2
	movrlez	%o0,	%l5,	%l3
	fandnot2	%f18,	%f12,	%f24
	xnor	%o4,	%i2,	%g5
	lduw	[%l7 + 0x1C],	%i5
	and	%g4,	0x1CA1,	%o7
	movrlez	%g2,	0x382,	%l4
	sll	%o2,	%o6,	%l1
	fmovsg	%xcc,	%f13,	%f14
	udivcc	%l6,	0x00E8,	%o3
	addcc	%i0,	%i7,	%i4
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%i6
	fnands	%f20,	%f14,	%f23
	ldd	[%l7 + 0x28],	%l0
	sub	%i3,	0x1E05,	%g6
	xnorcc	%g3,	0x0BB5,	%g1
	fmovdne	%icc,	%f7,	%f28
	sub	%l2,	%o1,	%g7
	fxor	%f0,	%f14,	%f18
	sdivx	%o5,	0x129A,	%i1
	movvc	%xcc,	%l5,	%o0
	orncc	%l3,	%i2,	%g5
	edge16ln	%i5,	%o4,	%g4
	movrlz	%g2,	0x07F,	%l4
	edge8n	%o2,	%o7,	%l1
	ldub	[%l7 + 0x7B],	%o6
	smul	%o3,	%i0,	%l6
	popc	0x15CB,	%i7
	fmovdgu	%icc,	%f31,	%f18
	sdiv	%i4,	0x0532,	%i6
	for	%f2,	%f20,	%f30
	edge16n	%l0,	%i3,	%g3
	fnors	%f28,	%f18,	%f16
	sllx	%g6,	%g1,	%l2
	fsrc1s	%f5,	%f10
	sir	0x1356
	umulcc	%g7,	0x0BDE,	%o1
	fcmps	%fcc3,	%f12,	%f6
	st	%f19,	[%l7 + 0x58]
	udiv	%i1,	0x114F,	%l5
	edge8ln	%o0,	%l3,	%i2
	sth	%o5,	[%l7 + 0x2A]
	and	%g5,	0x1CB2,	%i5
	srax	%g4,	0x0A,	%g2
	andncc	%l4,	%o2,	%o4
	edge16	%o7,	%o6,	%l1
	ld	[%l7 + 0x54],	%f18
	movcs	%xcc,	%o3,	%i0
	sdivx	%l6,	0x12CA,	%i4
	movl	%xcc,	%i6,	%l0
	fnot1s	%f13,	%f2
	alignaddr	%i3,	%g3,	%i7
	std	%f6,	[%l7 + 0x40]
	sdivx	%g6,	0x086A,	%l2
	mulx	%g1,	0x1FFB,	%o1
	addcc	%g7,	%l5,	%o0
	nop
	set	0x2C, %i4
	stw	%l3,	[%l7 + %i4]
	edge16	%i1,	%i2,	%o5
	edge8l	%g5,	%i5,	%g2
	xor	%l4,	%o2,	%o4
	edge16l	%o7,	%o6,	%g4
	orn	%o3,	0x153C,	%i0
	fcmpeq16	%f26,	%f26,	%l6
	sra	%l1,	%i6,	%l0
	sub	%i4,	%g3,	%i3
	nop
	set	0x68, %i5
	ldsh	[%l7 + %i5],	%g6
	sub	%i7,	%l2,	%g1
	sll	%g7,	0x04,	%o1
	save %l5, %l3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%o0,	%o5
	add	%i2,	0x0C4E,	%g5
	movge	%xcc,	%i5,	%g2
	ldsh	[%l7 + 0x20],	%o2
	ldsb	[%l7 + 0x4F],	%o4
	addccc	%l4,	0x0AD6,	%o6
	and	%g4,	0x1A17,	%o7
	ldd	[%l7 + 0x70],	%i0
	restore %l6, 0x0E0F, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%i6
	addccc	%l0,	0x0D53,	%i4
	fmovrdlz	%g3,	%f20,	%f10
	fmovd	%f6,	%f24
	popc	%i3,	%l1
	mova	%xcc,	%g6,	%l2
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	movle	%xcc,	%g7,	%l5
	andn	%l3,	%i1,	%o1
	fmovde	%xcc,	%f15,	%f1
	stw	%o5,	[%l7 + 0x64]
	edge8l	%i2,	%o0,	%g5
	addcc	%i5,	%o2,	%g2
	sll	%l4,	0x0A,	%o6
	nop
	set	0x40, %g6
	std	%f24,	[%l7 + %g6]
	edge16	%o4,	%g4,	%o7
	fmuld8ulx16	%f30,	%f17,	%f28
	lduh	[%l7 + 0x7C],	%i0
	subc	%l6,	%i6,	%l0
	xnorcc	%i4,	%g3,	%o3
	ldd	[%l7 + 0x58],	%f16
	movl	%icc,	%l1,	%i3
	movn	%xcc,	%l2,	%g6
	alignaddrl	%i7,	%g1,	%g7
	movn	%xcc,	%l3,	%l5
	fpsub16s	%f26,	%f23,	%f21
	fones	%f28
	sdivcc	%i1,	0x0B11,	%o5
	sdiv	%o1,	0x1740,	%o0
	edge8	%g5,	%i5,	%o2
	movre	%g2,	%l4,	%o6
	ldsh	[%l7 + 0x42],	%o4
	andn	%g4,	%o7,	%i2
	fcmpne32	%f2,	%f28,	%i0
	srax	%l6,	%l0,	%i6
	fnot1	%f4,	%f10
	save %i4, %o3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g3,	%i3,	%g6
	mulx	%l2,	0x143F,	%g1
	ld	[%l7 + 0x40],	%f23
	fcmpeq16	%f30,	%f14,	%g7
	move	%xcc,	%i7,	%l3
	xor	%l5,	0x083E,	%i1
	addc	%o1,	%o0,	%o5
	andn	%g5,	0x0FA2,	%i5
	fmovdcs	%xcc,	%f19,	%f7
	nop
	set	0x1C, %i1
	ldsh	[%l7 + %i1],	%o2
	mulscc	%l4,	0x07DF,	%o6
	andncc	%o4,	%g2,	%o7
	movvs	%xcc,	%g4,	%i2
	mova	%xcc,	%i0,	%l6
	xnorcc	%l0,	0x181A,	%i4
	edge8	%o3,	%l1,	%g3
	movle	%icc,	%i3,	%i6
	alignaddr	%l2,	%g6,	%g7
	andn	%i7,	0x0E6E,	%l3
	fmul8x16au	%f26,	%f30,	%f8
	fpadd16	%f26,	%f0,	%f2
	subcc	%l5,	%g1,	%i1
	ldsw	[%l7 + 0x24],	%o0
	sir	0x0630
	popc	%o5,	%g5
	orn	%i5,	%o2,	%o1
	fpackfix	%f4,	%f14
	movrlz	%o6,	%l4,	%g2
	lduh	[%l7 + 0x6E],	%o7
	st	%f21,	[%l7 + 0x28]
	movn	%xcc,	%g4,	%o4
	movre	%i0,	0x2D7,	%i2
	sir	0x1DA6
	umul	%l6,	0x1D12,	%l0
	subccc	%i4,	%l1,	%o3
	fmovsvc	%icc,	%f10,	%f16
	sub	%g3,	%i3,	%i6
	movle	%icc,	%l2,	%g7
	ldsh	[%l7 + 0x32],	%g6
	mulscc	%l3,	0x09B7,	%i7
	xnor	%g1,	0x1B20,	%l5
	edge8l	%o0,	%i1,	%g5
	st	%f26,	[%l7 + 0x60]
	movn	%xcc,	%i5,	%o2
	fpadd32	%f12,	%f12,	%f24
	movge	%icc,	%o1,	%o6
	ldx	[%l7 + 0x70],	%o5
	fmul8x16al	%f11,	%f17,	%f26
	orncc	%l4,	0x059E,	%o7
	nop
	set	0x08, %l6
	ldd	[%l7 + %l6],	%f20
	ld	[%l7 + 0x7C],	%f2
	nop
	set	0x08, %o5
	ldsw	[%l7 + %o5],	%g2
	edge16ln	%o4,	%g4,	%i0
	alignaddr	%l6,	%i2,	%l0
	movre	%i4,	0x1A7,	%o3
	nop
	set	0x28, %g4
	ldx	[%l7 + %g4],	%l1
	edge8l	%i3,	%g3,	%l2
	restore %g7, %g6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l3,	0x1CBD,	%g1
	addcc	%i7,	%l5,	%i1
	sth	%o0,	[%l7 + 0x58]
	fpsub16	%f14,	%f10,	%f22
	andn	%g5,	0x09E9,	%i5
	edge32	%o2,	%o6,	%o5
	fsrc2	%f28,	%f6
	edge32	%l4,	%o1,	%g2
	edge16	%o7,	%g4,	%i0
	movcs	%xcc,	%o4,	%l6
	subccc	%l0,	%i2,	%i4
	fmovdleu	%icc,	%f15,	%f21
	popc	0x1476,	%l1
	edge8n	%i3,	%o3,	%l2
	popc	%g3,	%g6
	sdivx	%g7,	0x0F5A,	%i6
	movrlez	%l3,	0x314,	%g1
	sll	%l5,	0x14,	%i7
	subc	%o0,	%i1,	%g5
	sir	0x13D6
	subc	%o2,	0x138B,	%i5
	edge16	%o6,	%o5,	%o1
	sdivx	%l4,	0x0CC7,	%g2
	sdivx	%g4,	0x1143,	%o7
	edge32	%o4,	%i0,	%l6
	fandnot2	%f6,	%f16,	%f22
	fpadd32s	%f18,	%f17,	%f2
	fnors	%f8,	%f9,	%f6
	srlx	%l0,	%i2,	%l1
	fnot1s	%f28,	%f4
	addc	%i3,	0x14A6,	%i4
	fpsub16	%f16,	%f8,	%f24
	sllx	%o3,	%g3,	%g6
	nop
	set	0x48, %o0
	ldsb	[%l7 + %o0],	%l2
	orcc	%g7,	%l3,	%g1
	orcc	%i6,	%i7,	%o0
	movrne	%l5,	0x0C5,	%g5
	fzeros	%f18
	srlx	%i1,	%i5,	%o2
	fsrc2s	%f12,	%f9
	lduh	[%l7 + 0x68],	%o5
	array16	%o6,	%l4,	%g2
	edge32n	%g4,	%o7,	%o4
	nop
	set	0x2C, %g1
	stw	%i0,	[%l7 + %g1]
	movneg	%icc,	%l6,	%l0
	xnor	%i2,	%l1,	%o1
	edge8l	%i3,	%o3,	%g3
	movrlz	%i4,	0x1D2,	%l2
	edge8	%g7,	%g6,	%l3
	fmovdge	%icc,	%f11,	%f7
	fmovsa	%icc,	%f10,	%f18
	srlx	%i6,	0x1F,	%i7
	umulcc	%g1,	%o0,	%l5
	move	%icc,	%i1,	%g5
	fpsub16s	%f3,	%f16,	%f15
	ldub	[%l7 + 0x13],	%i5
	edge16ln	%o2,	%o5,	%l4
	movrlz	%o6,	0x2AE,	%g4
	save %g2, %o4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdleu	%icc,	%f27,	%f25
	ldsw	[%l7 + 0x34],	%i0
	edge16n	%l6,	%i2,	%l0
	fcmpgt32	%f20,	%f30,	%l1
	movg	%icc,	%o1,	%i3
	sth	%g3,	[%l7 + 0x4C]
	movrne	%o3,	%i4,	%l2
	sdiv	%g7,	0x14F0,	%l3
	fone	%f20
	ld	[%l7 + 0x48],	%f18
	movrlz	%i6,	%i7,	%g6
	ldx	[%l7 + 0x78],	%g1
	udiv	%l5,	0x1197,	%i1
	and	%g5,	0x196B,	%o0
	xorcc	%o2,	%o5,	%l4
	stx	%i5,	[%l7 + 0x30]
	sir	0x0F4B
	or	%o6,	0x1C06,	%g4
	srlx	%o4,	%o7,	%g2
	sllx	%l6,	0x13,	%i2
	movvs	%icc,	%l0,	%i0
	edge16n	%l1,	%o1,	%i3
	fsrc1s	%f2,	%f26
	sir	0x0625
	fcmpne32	%f28,	%f0,	%o3
	array16	%g3,	%i4,	%g7
	ldsh	[%l7 + 0x74],	%l2
	fpack16	%f10,	%f26
	fone	%f6
	fnand	%f20,	%f22,	%f0
	orcc	%i6,	0x12BE,	%l3
	fors	%f10,	%f7,	%f2
	popc	0x0D3B,	%g6
	fornot2s	%f31,	%f2,	%f26
	movge	%icc,	%i7,	%g1
	srl	%i1,	0x10,	%l5
	ld	[%l7 + 0x38],	%f1
	fpsub16s	%f9,	%f25,	%f19
	fcmpeq16	%f18,	%f12,	%g5
	subcc	%o0,	0x0824,	%o5
	ldub	[%l7 + 0x15],	%o2
	ldd	[%l7 + 0x68],	%l4
	movleu	%xcc,	%o6,	%i5
	edge32	%o4,	%o7,	%g2
	movrne	%l6,	%g4,	%l0
	addccc	%i0,	0x0BE5,	%i2
	movneg	%xcc,	%o1,	%l1
	fornot1	%f4,	%f14,	%f22
	smulcc	%o3,	%i3,	%i4
	umulcc	%g7,	0x1711,	%l2
	orn	%g3,	0x03BB,	%l3
	edge32ln	%g6,	%i6,	%g1
	stb	%i7,	[%l7 + 0x0E]
	movre	%i1,	%l5,	%o0
	movrgz	%g5,	0x35B,	%o5
	movrne	%o2,	0x3B2,	%l4
	edge32l	%i5,	%o4,	%o6
	alignaddrl	%g2,	%o7,	%g4
	fcmple16	%f24,	%f18,	%l0
	ldx	[%l7 + 0x48],	%i0
	fmovdleu	%xcc,	%f15,	%f9
	sth	%l6,	[%l7 + 0x34]
	srl	%i2,	0x13,	%l1
	fpadd32	%f26,	%f30,	%f6
	fzeros	%f19
	edge8	%o3,	%i3,	%o1
	save %i4, 0x0269, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f24,	%f6,	%f22
	smul	%l2,	0x0F89,	%l3
	stx	%g3,	[%l7 + 0x48]
	ldsb	[%l7 + 0x72],	%g6
	fpadd32	%f4,	%f26,	%f12
	xnorcc	%g1,	0x1B52,	%i7
	movn	%icc,	%i6,	%i1
	fmovdg	%icc,	%f15,	%f26
	lduw	[%l7 + 0x54],	%o0
	edge16l	%g5,	%l5,	%o2
	movrlz	%o5,	%l4,	%i5
	movn	%xcc,	%o6,	%g2
	stw	%o4,	[%l7 + 0x68]
	movvs	%xcc,	%g4,	%o7
	and	%l0,	0x1058,	%l6
	andn	%i0,	0x0C1F,	%i2
	movrlz	%l1,	0x388,	%i3
	std	%f8,	[%l7 + 0x38]
	addc	%o1,	0x156D,	%i4
	fones	%f19
	sdiv	%g7,	0x151C,	%o3
	alignaddrl	%l2,	%l3,	%g3
	sll	%g6,	0x0C,	%i7
	movleu	%xcc,	%g1,	%i6
	edge32n	%o0,	%i1,	%g5
	fsrc2s	%f26,	%f0
	or	%o2,	%l5,	%o5
	sdivx	%i5,	0x1694,	%o6
	umul	%l4,	%o4,	%g2
	srl	%o7,	0x16,	%l0
	mulscc	%l6,	%g4,	%i0
	sub	%l1,	%i2,	%i3
	movrgez	%o1,	0x21A,	%i4
	addc	%o3,	0x0DD9,	%g7
	popc	%l2,	%g3
	addccc	%l3,	0x0BB5,	%i7
	fcmpne16	%f10,	%f2,	%g6
	movrlez	%g1,	%o0,	%i1
	mova	%icc,	%g5,	%o2
	ldsw	[%l7 + 0x5C],	%i6
	fmovscc	%icc,	%f10,	%f13
	edge32l	%o5,	%l5,	%i5
	srax	%l4,	0x1E,	%o6
	movpos	%xcc,	%o4,	%o7
	ldsw	[%l7 + 0x14],	%l0
	mulscc	%l6,	0x1FB9,	%g4
	alignaddrl	%g2,	%i0,	%l1
	addcc	%i2,	0x03B6,	%o1
	fmovrde	%i4,	%f4,	%f2
	popc	%i3,	%g7
	addccc	%o3,	0x0B0E,	%g3
	addc	%l2,	0x118F,	%i7
	alignaddrl	%g6,	%l3,	%g1
	edge8n	%o0,	%g5,	%i1
	move	%icc,	%i6,	%o2
	move	%icc,	%o5,	%i5
	andcc	%l4,	%o6,	%o4
	movvc	%icc,	%l5,	%o7
	ldd	[%l7 + 0x68],	%i6
	edge32	%l0,	%g2,	%i0
	edge8n	%l1,	%g4,	%i2
	fmovse	%icc,	%f23,	%f4
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	fmovda	%icc,	%f19,	%f31
	fmovdleu	%icc,	%f25,	%f29
	udivcc	%o1,	0x1A0A,	%o3
	sethi	0x121D,	%g7
	srlx	%g3,	0x1D,	%l2
	save %i7, 0x0A48, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g1,	[%l7 + 0x21]
	alignaddr	%o0,	%l3,	%i1
	lduh	[%l7 + 0x1C],	%g5
	mulscc	%o2,	%o5,	%i6
	ld	[%l7 + 0x18],	%f31
	umulcc	%l4,	0x0A9C,	%o6
	movge	%xcc,	%i5,	%l5
	for	%f20,	%f18,	%f18
	alignaddr	%o7,	%l6,	%o4
	or	%g2,	0x1317,	%l0
	edge8n	%i0,	%g4,	%l1
	udivx	%i2,	0x0F81,	%i4
	lduw	[%l7 + 0x18],	%o1
	sub	%i3,	0x0EDC,	%g7
	array8	%g3,	%l2,	%i7
	edge32n	%g6,	%g1,	%o3
	fcmpes	%fcc3,	%f31,	%f12
	ld	[%l7 + 0x38],	%f19
	orncc	%l3,	0x00A0,	%o0
	and	%g5,	0x1531,	%i1
	edge32ln	%o2,	%i6,	%o5
	array16	%l4,	%o6,	%l5
	movgu	%icc,	%o7,	%i5
	ldsw	[%l7 + 0x20],	%l6
	fmovrdlez	%g2,	%f22,	%f30
	edge16ln	%o4,	%l0,	%g4
	alignaddrl	%l1,	%i2,	%i4
	save %i0, %o1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%g3,	%g7,	%l2
	edge8	%i7,	%g1,	%g6
	and	%o3,	%l3,	%g5
	fmovsg	%xcc,	%f24,	%f29
	sth	%o0,	[%l7 + 0x16]
	sll	%o2,	%i6,	%i1
	lduw	[%l7 + 0x74],	%o5
	fmovspos	%xcc,	%f7,	%f2
	udiv	%l4,	0x1AE1,	%o6
	sdiv	%l5,	0x0EA5,	%i5
	movneg	%icc,	%o7,	%l6
	fcmpne16	%f24,	%f22,	%g2
	sth	%o4,	[%l7 + 0x76]
	movne	%icc,	%l0,	%l1
	andcc	%i2,	%i4,	%g4
	xnor	%o1,	%i3,	%g3
	lduh	[%l7 + 0x28],	%i0
	popc	%l2,	%i7
	xnorcc	%g7,	0x0E9C,	%g1
	edge8	%o3,	%g6,	%g5
	lduh	[%l7 + 0x22],	%o0
	orcc	%l3,	0x060E,	%o2
	orncc	%i6,	0x185D,	%i1
	andcc	%o5,	%o6,	%l4
	orn	%l5,	0x1BC2,	%o7
	orcc	%l6,	0x0A33,	%i5
	ldsb	[%l7 + 0x60],	%o4
	fmovda	%icc,	%f22,	%f11
	ldx	[%l7 + 0x10],	%l0
	movg	%xcc,	%l1,	%i2
	xnorcc	%g2,	%i4,	%g4
	ld	[%l7 + 0x10],	%f2
	andncc	%i3,	%o1,	%g3
	movleu	%icc,	%l2,	%i0
	mulscc	%g7,	%g1,	%o3
	st	%f8,	[%l7 + 0x30]
	fnands	%f23,	%f27,	%f18
	smul	%i7,	0x1BE9,	%g5
	fcmps	%fcc1,	%f5,	%f24
	sllx	%o0,	0x0E,	%g6
	lduw	[%l7 + 0x30],	%l3
	fornot1	%f22,	%f28,	%f26
	edge16ln	%i6,	%i1,	%o5
	sethi	0x06AB,	%o2
	fmovrse	%o6,	%f1,	%f20
	ldsb	[%l7 + 0x49],	%l5
	popc	0x10FF,	%l4
	restore %o7, %l6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l0,	%i5,	%i2
	stx	%g2,	[%l7 + 0x28]
	fmovdn	%icc,	%f14,	%f13
	fmovrdlez	%l1,	%f0,	%f20
	udivx	%g4,	0x07AE,	%i4
	fpmerge	%f30,	%f8,	%f26
	siam	0x3
	array32	%o1,	%i3,	%l2
	fsrc1s	%f28,	%f25
	fmovde	%icc,	%f4,	%f4
	fnot2s	%f8,	%f9
	sdivx	%g3,	0x0DB8,	%g7
	fabsd	%f22,	%f26
	popc	%i0,	%o3
	ld	[%l7 + 0x40],	%f7
	edge16	%g1,	%i7,	%o0
	fpsub32	%f20,	%f16,	%f0
	lduh	[%l7 + 0x50],	%g5
	mova	%icc,	%g6,	%i6
	xorcc	%l3,	0x1291,	%o5
	nop
	set	0x68, %l2
	ldd	[%l7 + %l2],	%o2
	popc	0x0917,	%o6
	edge32	%i1,	%l5,	%l4
	fmuld8sux16	%f8,	%f18,	%f0
	andcc	%l6,	%o7,	%o4
	sir	0x0E9D
	ldx	[%l7 + 0x18],	%i5
	fsrc1s	%f29,	%f4
	movrlez	%l0,	0x1F4,	%i2
	fmovsneg	%icc,	%f29,	%f11
	ldd	[%l7 + 0x78],	%g2
	stb	%g4,	[%l7 + 0x57]
	movvs	%xcc,	%i4,	%l1
	andcc	%o1,	%i3,	%g3
	smul	%g7,	0x0D1E,	%l2
	movrne	%i0,	0x2A8,	%o3
	movcc	%xcc,	%g1,	%i7
	fpsub32	%f14,	%f12,	%f16
	subccc	%o0,	%g5,	%i6
	fmovscc	%xcc,	%f31,	%f6
	addcc	%l3,	%o5,	%o2
	andn	%g6,	%o6,	%i1
	fmovs	%f15,	%f15
	lduh	[%l7 + 0x12],	%l5
	pdist	%f10,	%f26,	%f28
	orcc	%l6,	%o7,	%l4
	array8	%o4,	%i5,	%i2
	subc	%l0,	0x0A8D,	%g4
	move	%icc,	%g2,	%i4
	nop
	set	0x5C, %o2
	stb	%l1,	[%l7 + %o2]
	fcmps	%fcc1,	%f0,	%f16
	array8	%o1,	%g3,	%i3
	xor	%l2,	%i0,	%o3
	edge8l	%g7,	%g1,	%o0
	sub	%i7,	%g5,	%l3
	fmovdge	%xcc,	%f21,	%f24
	edge32ln	%o5,	%i6,	%g6
	fnot2	%f18,	%f26
	fmovsvs	%icc,	%f20,	%f27
	movvs	%xcc,	%o2,	%i1
	movge	%xcc,	%o6,	%l6
	nop
	set	0x40, %o6
	stx	%l5,	[%l7 + %o6]
	array32	%o7,	%l4,	%o4
	edge32n	%i5,	%l0,	%g4
	edge32	%g2,	%i2,	%l1
	edge16ln	%i4,	%o1,	%g3
	edge32	%i3,	%i0,	%o3
	smul	%l2,	0x179A,	%g7
	sllx	%o0,	0x08,	%i7
	fornot1s	%f9,	%f2,	%f5
	ldsh	[%l7 + 0x7A],	%g5
	addcc	%l3,	0x0F58,	%o5
	fmovrse	%g1,	%f21,	%f26
	movre	%i6,	0x3EB,	%g6
	mulscc	%o2,	%o6,	%l6
	fcmpne32	%f24,	%f14,	%l5
	fmovdcs	%xcc,	%f23,	%f25
	fornot1	%f8,	%f26,	%f26
	fmovsge	%xcc,	%f20,	%f6
	sir	0x040E
	fpmerge	%f31,	%f3,	%f4
	ldsw	[%l7 + 0x78],	%o7
	srl	%l4,	0x1D,	%i1
	sra	%o4,	%i5,	%l0
	edge32	%g4,	%i2,	%g2
	srl	%l1,	0x1A,	%i4
	mulscc	%g3,	%i3,	%i0
	xor	%o1,	%l2,	%g7
	nop
	set	0x29, %l5
	ldsb	[%l7 + %l5],	%o3
	array32	%i7,	%o0,	%g5
	for	%f12,	%f14,	%f28
	xor	%l3,	%o5,	%g1
	fxnors	%f16,	%f4,	%f21
	subcc	%i6,	0x0AA0,	%o2
	edge8n	%o6,	%g6,	%l5
	fmovrslz	%o7,	%f4,	%f10
	ldx	[%l7 + 0x68],	%l4
	sra	%i1,	0x0D,	%o4
	movle	%xcc,	%i5,	%l6
	ldd	[%l7 + 0x10],	%f24
	addccc	%g4,	%l0,	%g2
	orcc	%l1,	%i2,	%i4
	fmovsneg	%xcc,	%f27,	%f11
	edge8n	%i3,	%g3,	%o1
	ldub	[%l7 + 0x75],	%l2
	smul	%i0,	0x0C0F,	%g7
	movn	%icc,	%i7,	%o3
	movre	%g5,	%l3,	%o0
	fmovdle	%icc,	%f27,	%f23
	subc	%g1,	0x0316,	%i6
	ldsw	[%l7 + 0x34],	%o2
	save %o5, %o6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g6,	%f30,	%f22
	movcs	%xcc,	%l4,	%o7
	edge32n	%i1,	%o4,	%l6
	edge32l	%g4,	%l0,	%g2
	movrgez	%i5,	%i2,	%i4
	st	%f31,	[%l7 + 0x54]
	array16	%l1,	%i3,	%o1
	movre	%g3,	%i0,	%l2
	fpsub32s	%f29,	%f1,	%f26
	st	%f29,	[%l7 + 0x58]
	edge8ln	%g7,	%o3,	%g5
	bshuffle	%f2,	%f24,	%f6
	edge8ln	%i7,	%l3,	%g1
	xorcc	%i6,	0x154F,	%o0
	fpack16	%f4,	%f30
	fpmerge	%f2,	%f1,	%f12
	array32	%o2,	%o5,	%o6
	xnor	%g6,	%l5,	%l4
	ldx	[%l7 + 0x50],	%i1
	movge	%icc,	%o4,	%l6
	andncc	%o7,	%l0,	%g2
	popc	%g4,	%i5
	edge8	%i4,	%l1,	%i2
	sllx	%o1,	0x03,	%g3
	edge32	%i0,	%i3,	%l2
	andncc	%g7,	%o3,	%g5
	movl	%xcc,	%i7,	%g1
	movpos	%xcc,	%l3,	%o0
	stx	%o2,	[%l7 + 0x48]
	array8	%o5,	%o6,	%i6
	addc	%g6,	0x1081,	%l4
	sth	%i1,	[%l7 + 0x1A]
	srlx	%l5,	0x0B,	%l6
	ldub	[%l7 + 0x23],	%o4
	popc	%o7,	%l0
	fexpand	%f28,	%f26
	popc	0x1F0C,	%g2
	fxors	%f8,	%f5,	%f2
	sra	%i5,	0x11,	%i4
	stw	%g4,	[%l7 + 0x54]
	movre	%l1,	%i2,	%o1
	andcc	%i0,	0x1377,	%i3
	addcc	%l2,	0x04F1,	%g7
	fpackfix	%f28,	%f15
	array8	%g3,	%g5,	%i7
	movle	%xcc,	%o3,	%g1
	ldd	[%l7 + 0x40],	%f8
	edge8ln	%o0,	%o2,	%l3
	movle	%icc,	%o5,	%i6
	edge32l	%g6,	%o6,	%i1
	stx	%l5,	[%l7 + 0x48]
	fcmpeq32	%f4,	%f8,	%l4
	fmovscc	%xcc,	%f21,	%f18
	and	%l6,	0x152A,	%o4
	edge32	%l0,	%g2,	%i5
	array32	%i4,	%o7,	%l1
	ldd	[%l7 + 0x70],	%f4
	ldd	[%l7 + 0x70],	%i2
	edge16n	%o1,	%g4,	%i3
	movn	%icc,	%i0,	%l2
	andncc	%g7,	%g5,	%i7
	fmovdpos	%icc,	%f4,	%f18
	sra	%g3,	0x1C,	%g1
	lduh	[%l7 + 0x14],	%o3
	fpadd16	%f6,	%f20,	%f10
	sdivcc	%o0,	0x1A2B,	%o2
	ldx	[%l7 + 0x60],	%l3
	fpadd32s	%f29,	%f25,	%f1
	move	%icc,	%i6,	%g6
	andncc	%o5,	%o6,	%i1
	array16	%l5,	%l6,	%l4
	fmovrdlez	%o4,	%f4,	%f14
	fxnors	%f21,	%f8,	%f11
	edge8l	%l0,	%g2,	%i4
	mulscc	%i5,	%l1,	%o7
	ldd	[%l7 + 0x10],	%f2
	ldsw	[%l7 + 0x38],	%o1
	movneg	%xcc,	%g4,	%i2
	popc	0x001F,	%i0
	popc	%l2,	%g7
	xnor	%i3,	%i7,	%g3
	fcmpgt16	%f18,	%f8,	%g1
	stw	%g5,	[%l7 + 0x24]
	movrlz	%o0,	0x3DB,	%o3
	movvs	%icc,	%l3,	%i6
	xorcc	%o2,	%g6,	%o5
	fxnor	%f10,	%f16,	%f24
	lduh	[%l7 + 0x7C],	%i1
	fmovsneg	%icc,	%f1,	%f14
	movcc	%xcc,	%l5,	%l6
	srax	%o6,	%l4,	%l0
	ldsh	[%l7 + 0x22],	%o4
	fandnot2s	%f17,	%f27,	%f7
	edge16ln	%i4,	%g2,	%i5
	movvs	%xcc,	%o7,	%o1
	sdivx	%g4,	0x03AD,	%i2
	lduw	[%l7 + 0x74],	%i0
	fmovsge	%icc,	%f2,	%f25
	std	%f30,	[%l7 + 0x50]
	fmovda	%xcc,	%f16,	%f22
	umul	%l2,	0x0BD7,	%g7
	fabsd	%f12,	%f6
	fsrc1	%f2,	%f30
	movrne	%i3,	0x10D,	%i7
	st	%f6,	[%l7 + 0x20]
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	mulscc	%o0,	%l1,	%l3
	movrlez	%o3,	0x2A2,	%i6
	orncc	%o2,	%o5,	%g6
	fmovsl	%xcc,	%f14,	%f10
	edge32	%l5,	%i1,	%l6
	and	%l4,	0x1533,	%l0
	movrlez	%o6,	0x143,	%i4
	addcc	%o4,	%i5,	%g2
	fcmple16	%f18,	%f16,	%o7
	fsrc1	%f16,	%f22
	movcs	%xcc,	%g4,	%i2
	fzeros	%f3
	sub	%o1,	%l2,	%i0
	fsrc1	%f26,	%f12
	movrgz	%g7,	%i7,	%g3
	save %g1, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o0,	%l3,	%l1
	nop
	set	0x4C, %o4
	lduw	[%l7 + %o4],	%o3
	fmovspos	%icc,	%f25,	%f22
	sir	0x09D3
	addcc	%i6,	%o2,	%o5
	fpsub32s	%f19,	%f1,	%f2
	umul	%g6,	%l5,	%l6
	ldsb	[%l7 + 0x1C],	%i1
	subccc	%l4,	%l0,	%o6
	fmovdvs	%icc,	%f6,	%f13
	fpsub32s	%f15,	%f12,	%f20
	edge32	%i4,	%i5,	%o4
	movcs	%icc,	%g2,	%o7
	srlx	%i2,	%o1,	%g4
	fcmple32	%f4,	%f12,	%i0
	fmovda	%xcc,	%f24,	%f14
	andcc	%g7,	0x02F9,	%i7
	fcmple16	%f22,	%f24,	%g3
	add	%l2,	%g5,	%g1
	sir	0x0256
	fmovdge	%icc,	%f16,	%f26
	fxnors	%f27,	%f31,	%f16
	orncc	%i3,	0x0E7E,	%o0
	array16	%l3,	%l1,	%o3
	array16	%o2,	%o5,	%i6
	fnors	%f6,	%f25,	%f6
	orcc	%l5,	0x182C,	%l6
	movn	%xcc,	%g6,	%l4
	fmovsleu	%icc,	%f7,	%f15
	subccc	%i1,	0x118F,	%l0
	ldd	[%l7 + 0x50],	%f18
	move	%icc,	%o6,	%i5
	movleu	%icc,	%i4,	%o4
	edge16ln	%o7,	%i2,	%g2
	fmuld8ulx16	%f3,	%f22,	%f30
	fcmpd	%fcc1,	%f0,	%f4
	xnor	%g4,	%i0,	%g7
	mulx	%o1,	%g3,	%l2
	edge32n	%i7,	%g1,	%g5
	orcc	%i3,	%l3,	%o0
	fmovdne	%xcc,	%f16,	%f3
	movrgez	%o3,	%l1,	%o2
	edge32n	%i6,	%o5,	%l5
	ldd	[%l7 + 0x08],	%i6
	ldd	[%l7 + 0x08],	%f28
	stx	%l4,	[%l7 + 0x48]
	fabsd	%f10,	%f10
	edge8	%i1,	%l0,	%o6
	popc	0x1D2C,	%g6
	sth	%i5,	[%l7 + 0x10]
	sth	%o4,	[%l7 + 0x7C]
	movge	%icc,	%o7,	%i4
	fcmpd	%fcc1,	%f14,	%f8
	udivx	%g2,	0x0B02,	%i2
	fmovsl	%xcc,	%f8,	%f27
	restore %i0, %g4, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%o1,	%l2,	%g3
	fmul8x16al	%f8,	%f12,	%f18
	umulcc	%i7,	%g1,	%i3
	mulx	%l3,	0x02F3,	%g5
	fornot1s	%f6,	%f14,	%f5
	sllx	%o3,	0x09,	%l1
	st	%f17,	[%l7 + 0x70]
	sll	%o2,	0x13,	%i6
	subcc	%o0,	%o5,	%l6
	ldd	[%l7 + 0x50],	%l4
	subcc	%l5,	0x1845,	%l0
	movre	%i1,	0x02B,	%g6
	edge8n	%i5,	%o6,	%o4
	xor	%o7,	0x1BD6,	%i4
	movcc	%xcc,	%i2,	%g2
	umul	%g4,	%g7,	%i0
	edge32l	%o1,	%g3,	%l2
	ldd	[%l7 + 0x68],	%i6
	array16	%g1,	%i3,	%g5
	movcs	%xcc,	%l3,	%l1
	fcmple32	%f8,	%f22,	%o2
	move	%icc,	%o3,	%o0
	subc	%o5,	%l6,	%l4
	sllx	%l5,	%l0,	%i1
	nop
	set	0x28, %g5
	lduw	[%l7 + %g5],	%i6
	movvs	%xcc,	%i5,	%o6
	fsrc2s	%f13,	%f9
	fxnors	%f17,	%f12,	%f28
	add	%g6,	0x11B5,	%o4
	fnot1s	%f27,	%f1
	srax	%i4,	%o7,	%i2
	andn	%g2,	0x07ED,	%g4
	ldd	[%l7 + 0x20],	%i0
	movvs	%xcc,	%o1,	%g3
	fmovdg	%icc,	%f3,	%f30
	movrne	%l2,	%i7,	%g7
	lduw	[%l7 + 0x0C],	%g1
	movcs	%xcc,	%i3,	%l3
	array8	%g5,	%l1,	%o3
	udivx	%o0,	0x1470,	%o5
	xnorcc	%o2,	%l4,	%l5
	addc	%l0,	%l6,	%i6
	fxnor	%f16,	%f24,	%f20
	fcmpeq32	%f20,	%f0,	%i5
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	edge8	%o4,	%g6,	%o7
	popc	%i4,	%g2
	edge16l	%i2,	%i0,	%g4
	fnot2	%f16,	%f12
	fnegs	%f1,	%f12
	edge8n	%g3,	%l2,	%o1
	nop
	set	0x23, %l1
	ldub	[%l7 + %l1],	%i7
	sdivcc	%g1,	0x156C,	%i3
	lduw	[%l7 + 0x08],	%l3
	lduw	[%l7 + 0x64],	%g5
	movneg	%icc,	%g7,	%l1
	fmovsn	%icc,	%f21,	%f0
	ld	[%l7 + 0x0C],	%f2
	edge8ln	%o0,	%o5,	%o3
	udiv	%l4,	0x0E26,	%l5
	fcmpne32	%f4,	%f14,	%o2
	fmovdcs	%xcc,	%f5,	%f15
	fpsub32	%f4,	%f16,	%f30
	fmovdn	%xcc,	%f1,	%f31
	movrgez	%l0,	%l6,	%i6
	fpadd16s	%f17,	%f23,	%f8
	addccc	%i1,	%i5,	%o4
	edge8n	%g6,	%o7,	%i4
	nop
	set	0x48, %o3
	ldd	[%l7 + %o3],	%f6
	movrlz	%o6,	0x3F5,	%i2
	fcmpeq32	%f0,	%f30,	%i0
	sub	%g4,	0x01E6,	%g3
	movrgz	%l2,	0x03F,	%g2
	orn	%i7,	%o1,	%i3
	subccc	%g1,	%l3,	%g5
	movg	%icc,	%g7,	%o0
	addcc	%o5,	%o3,	%l1
	stw	%l5,	[%l7 + 0x08]
	movcc	%icc,	%o2,	%l4
	edge16ln	%l6,	%i6,	%i1
	ld	[%l7 + 0x20],	%f24
	ldx	[%l7 + 0x50],	%i5
	fpadd32s	%f6,	%f18,	%f25
	umulcc	%l0,	%o4,	%o7
	addc	%i4,	%o6,	%g6
	fmul8x16	%f31,	%f0,	%f12
	stx	%i0,	[%l7 + 0x60]
	ldsh	[%l7 + 0x74],	%i2
	st	%f23,	[%l7 + 0x60]
	umul	%g4,	%g3,	%l2
	srax	%i7,	0x07,	%o1
	fmovdgu	%icc,	%f17,	%f16
	fmovsne	%xcc,	%f19,	%f13
	subc	%i3,	%g1,	%l3
	sethi	0x02FA,	%g5
	ldsb	[%l7 + 0x11],	%g2
	edge16	%g7,	%o5,	%o3
	ld	[%l7 + 0x18],	%f24
	sdivcc	%l1,	0x0DBA,	%o0
	fsrc2s	%f5,	%f22
	subcc	%o2,	%l4,	%l6
	fmovdpos	%xcc,	%f15,	%f10
	edge8ln	%i6,	%i1,	%l5
	ld	[%l7 + 0x08],	%f8
	popc	%l0,	%i5
	sdivcc	%o7,	0x0408,	%i4
	umul	%o6,	%o4,	%g6
	edge32ln	%i0,	%g4,	%i2
	sll	%l2,	0x0E,	%g3
	movge	%icc,	%i7,	%i3
	stb	%o1,	[%l7 + 0x2A]
	movrgez	%l3,	0x220,	%g1
	addcc	%g5,	%g2,	%o5
	fnegd	%f20,	%f18
	pdist	%f24,	%f14,	%f0
	fcmpeq16	%f16,	%f28,	%g7
	edge8	%l1,	%o3,	%o0
	movrlz	%o2,	0x27A,	%l4
	movrgz	%l6,	0x3A9,	%i6
	xorcc	%i1,	0x1A23,	%l0
	movvs	%xcc,	%i5,	%l5
	fmovdpos	%icc,	%f29,	%f25
	fmovrdlz	%o7,	%f0,	%f4
	orcc	%o6,	0x0499,	%o4
	movrgez	%g6,	%i4,	%g4
	movg	%icc,	%i2,	%i0
	umulcc	%g3,	0x1A5A,	%i7
	edge32n	%i3,	%o1,	%l2
	sdivcc	%g1,	0x167F,	%l3
	movrgz	%g2,	%g5,	%g7
	fornot2	%f26,	%f30,	%f24
	movg	%xcc,	%l1,	%o3
	edge16ln	%o5,	%o0,	%l4
	fones	%f9
	fmovsle	%xcc,	%f30,	%f27
	movne	%icc,	%o2,	%l6
	movrgez	%i6,	0x37D,	%i1
	ldx	[%l7 + 0x60],	%i5
	subccc	%l0,	0x0138,	%l5
	sdiv	%o6,	0x1296,	%o4
	andn	%g6,	0x1A4C,	%i4
	edge16l	%g4,	%o7,	%i0
	xnor	%g3,	0x1AF2,	%i7
	movrgez	%i3,	0x3DC,	%i2
	nop
	set	0x68, %o1
	lduw	[%l7 + %o1],	%o1
	andcc	%l2,	0x0B3D,	%g1
	lduw	[%l7 + 0x50],	%g2
	edge16ln	%l3,	%g7,	%g5
	sdiv	%l1,	0x005F,	%o3
	udivcc	%o5,	0x0153,	%o0
	fmovdcc	%icc,	%f16,	%f7
	movvc	%icc,	%o2,	%l4
	fsrc1	%f2,	%f30
	fnot2s	%f9,	%f6
	subcc	%l6,	%i1,	%i6
	fmovdcs	%xcc,	%f28,	%f17
	fmovspos	%xcc,	%f24,	%f26
	popc	0x02B0,	%l0
	fmovdleu	%icc,	%f30,	%f7
	add	%i5,	0x046A,	%o6
	fmovrsgez	%l5,	%f12,	%f1
	movne	%xcc,	%g6,	%o4
	edge32l	%i4,	%o7,	%i0
	sdivcc	%g3,	0x02F2,	%g4
	xor	%i7,	%i2,	%o1
	udiv	%l2,	0x12CA,	%g1
	srl	%i3,	0x0A,	%g2
	fcmps	%fcc1,	%f15,	%f6
	lduw	[%l7 + 0x3C],	%l3
	fpsub16	%f8,	%f18,	%f28
	pdist	%f6,	%f30,	%f6
	sdiv	%g7,	0x118A,	%g5
	addccc	%l1,	%o5,	%o0
	fandnot1s	%f5,	%f1,	%f14
	mova	%xcc,	%o2,	%o3
	subccc	%l4,	0x0567,	%l6
	orn	%i6,	0x0753,	%l0
	lduh	[%l7 + 0x2E],	%i5
	sllx	%o6,	0x1C,	%l5
	fmuld8ulx16	%f30,	%f9,	%f28
	orcc	%g6,	0x18A3,	%o4
	orncc	%i4,	%i1,	%o7
	add	%g3,	0x1CC8,	%g4
	ldub	[%l7 + 0x54],	%i0
	umulcc	%i7,	%o1,	%l2
	ld	[%l7 + 0x2C],	%f26
	array8	%i2,	%i3,	%g2
	fmovdcc	%icc,	%f0,	%f25
	fmovdvc	%icc,	%f6,	%f29
	movvs	%xcc,	%g1,	%l3
	fmovdleu	%icc,	%f20,	%f17
	sdivcc	%g7,	0x18DE,	%g5
	edge32l	%l1,	%o0,	%o5
	orncc	%o3,	%o2,	%l4
	array16	%i6,	%l0,	%l6
	array16	%o6,	%i5,	%g6
	umul	%o4,	0x009C,	%l5
	movn	%icc,	%i4,	%i1
	addc	%g3,	%o7,	%i0
	orn	%i7,	0x1368,	%g4
	addccc	%l2,	0x1039,	%i2
	alignaddr	%i3,	%o1,	%g1
	movneg	%xcc,	%l3,	%g7
	array8	%g2,	%g5,	%l1
	popc	0x175B,	%o5
	mulx	%o0,	%o2,	%o3
	edge16ln	%i6,	%l0,	%l4
	fmovsgu	%xcc,	%f25,	%f19
	srl	%o6,	0x12,	%i5
	sth	%g6,	[%l7 + 0x38]
	fornot1s	%f21,	%f26,	%f9
	lduw	[%l7 + 0x68],	%o4
	fnot1s	%f6,	%f7
	srl	%l5,	%l6,	%i4
	array32	%g3,	%i1,	%i0
	edge16ln	%i7,	%g4,	%o7
	fpack32	%f14,	%f6,	%f22
	edge8n	%i2,	%l2,	%i3
	movge	%xcc,	%g1,	%o1
	fmovspos	%xcc,	%f5,	%f15
	alignaddrl	%g7,	%g2,	%g5
	movle	%icc,	%l3,	%o5
	fmovsgu	%xcc,	%f10,	%f0
	udivcc	%l1,	0x08F6,	%o2
	stx	%o3,	[%l7 + 0x58]
	fmovsl	%icc,	%f28,	%f16
	sethi	0x039A,	%o0
	ld	[%l7 + 0x08],	%f12
	movrlz	%i6,	0x172,	%l0
	movgu	%xcc,	%o6,	%l4
	movcs	%icc,	%i5,	%g6
	umulcc	%o4,	%l6,	%l5
	orncc	%i4,	%g3,	%i0
	movrne	%i7,	%g4,	%o7
	ld	[%l7 + 0x30],	%f14
	movrlz	%i1,	%i2,	%l2
	umulcc	%g1,	%i3,	%g7
	alignaddrl	%g2,	%g5,	%o1
	addccc	%o5,	0x1AB2,	%l3
	edge8n	%o2,	%l1,	%o0
	sdivx	%o3,	0x0C23,	%i6
	andcc	%l0,	0x1C91,	%o6
	movle	%icc,	%i5,	%g6
	sra	%l4,	%l6,	%o4
	fmovrdne	%i4,	%f22,	%f12
	movle	%xcc,	%g3,	%l5
	std	%f24,	[%l7 + 0x58]
	sethi	0x012A,	%i7
	fmovsgu	%xcc,	%f19,	%f25
	fmul8x16au	%f5,	%f16,	%f10
	movneg	%icc,	%i0,	%g4
	movleu	%xcc,	%i1,	%o7
	movpos	%xcc,	%i2,	%l2
	fmovde	%icc,	%f23,	%f19
	srl	%g1,	%i3,	%g2
	movvs	%icc,	%g5,	%o1
	xnor	%g7,	%l3,	%o2
	fmovsa	%icc,	%f2,	%f13
	movneg	%icc,	%o5,	%l1
	move	%icc,	%o3,	%i6
	fxors	%f20,	%f2,	%f11
	alignaddrl	%o0,	%l0,	%i5
	save %o6, %g6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f6,	%f20,	%f26
	orcc	%o4,	%i4,	%g3
	movg	%icc,	%l6,	%l5
	movg	%xcc,	%i7,	%i0
	addccc	%g4,	%i1,	%i2
	sdivcc	%l2,	0x119D,	%g1
	movvs	%xcc,	%o7,	%g2
	movrgez	%i3,	0x220,	%o1
	sdiv	%g5,	0x03C6,	%l3
	movgu	%icc,	%o2,	%g7
	umulcc	%o5,	0x179A,	%l1
	sdivcc	%i6,	0x1B40,	%o3
	edge32l	%l0,	%o0,	%o6
	edge8n	%g6,	%i5,	%l4
	edge16ln	%o4,	%g3,	%l6
	sir	0x057F
	edge16ln	%l5,	%i4,	%i0
	movn	%xcc,	%i7,	%i1
	array16	%g4,	%i2,	%l2
	fornot2	%f4,	%f24,	%f0
	movcc	%icc,	%g1,	%g2
	edge8ln	%i3,	%o7,	%g5
	mulscc	%l3,	0x04C3,	%o2
	edge16	%o1,	%g7,	%l1
	udiv	%o5,	0x15BC,	%o3
	fcmpgt32	%f30,	%f26,	%i6
	fcmpes	%fcc1,	%f31,	%f12
	edge16ln	%o0,	%l0,	%o6
	fmovdneg	%xcc,	%f16,	%f21
	save %i5, 0x1AB1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l4,	0x1E2C,	%o4
	xorcc	%g3,	0x1B85,	%l6
	ld	[%l7 + 0x5C],	%f2
	move	%icc,	%i4,	%l5
	move	%icc,	%i7,	%i0
	stw	%i1,	[%l7 + 0x78]
	orncc	%i2,	%l2,	%g1
	ld	[%l7 + 0x40],	%f28
	fmul8x16	%f25,	%f4,	%f16
	edge32n	%g4,	%g2,	%o7
	udivx	%g5,	0x1209,	%l3
	movle	%icc,	%i3,	%o2
	st	%f10,	[%l7 + 0x48]
	fzeros	%f17
	fsrc2	%f14,	%f8
	ldsb	[%l7 + 0x21],	%g7
	edge8l	%o1,	%o5,	%l1
	xnorcc	%i6,	0x0780,	%o0
	edge32	%o3,	%l0,	%i5
	and	%o6,	%l4,	%o4
	sllx	%g3,	%g6,	%l6
	ldd	[%l7 + 0x28],	%i4
	udivcc	%i7,	0x1440,	%l5
	subcc	%i0,	0x193A,	%i1
	edge32ln	%l2,	%g1,	%i2
	edge32n	%g4,	%g2,	%o7
	xnorcc	%g5,	%l3,	%i3
	fcmpeq32	%f6,	%f18,	%o2
	orcc	%g7,	0x0CA0,	%o1
	udivcc	%l1,	0x0171,	%i6
	movrgz	%o0,	%o5,	%o3
	andn	%i5,	0x15A9,	%l0
	orncc	%o6,	%o4,	%g3
	movgu	%icc,	%g6,	%l6
	edge8ln	%l4,	%i7,	%l5
	movpos	%icc,	%i0,	%i1
	movrgez	%i4,	0x3A4,	%g1
	and	%l2,	%g4,	%g2
	ldd	[%l7 + 0x30],	%i2
	movl	%icc,	%g5,	%l3
	xor	%o7,	0x1C66,	%i3
	fexpand	%f15,	%f24
	orncc	%g7,	0x04AD,	%o1
	ld	[%l7 + 0x34],	%f29
	edge32ln	%o2,	%i6,	%l1
	nop
	set	0x74, %i2
	lduh	[%l7 + %i2],	%o5
	ldsh	[%l7 + 0x3C],	%o3
	sra	%i5,	0x0A,	%o0
	sll	%l0,	%o6,	%g3
	popc	%o4,	%l6
	fandnot1s	%f23,	%f26,	%f31
	movl	%icc,	%l4,	%g6
	lduw	[%l7 + 0x44],	%l5
	sth	%i0,	[%l7 + 0x32]
	mova	%icc,	%i1,	%i7
	mulscc	%i4,	%g1,	%g4
	array16	%l2,	%g2,	%i2
	edge16ln	%g5,	%l3,	%i3
	addcc	%o7,	%o1,	%o2
	sra	%i6,	0x07,	%l1
	alignaddrl	%o5,	%g7,	%o3
	movrgez	%o0,	0x20C,	%l0
	movrgz	%i5,	0x2CC,	%o6
	mova	%xcc,	%g3,	%l6
	udiv	%o4,	0x037A,	%l4
	sdiv	%l5,	0x0F90,	%i0
	edge32l	%i1,	%g6,	%i7
	fmul8x16al	%f10,	%f22,	%f24
	alignaddrl	%i4,	%g4,	%g1
	ldd	[%l7 + 0x50],	%l2
	edge8l	%i2,	%g5,	%g2
	smulcc	%i3,	%l3,	%o1
	addccc	%o2,	%o7,	%l1
	alignaddr	%o5,	%g7,	%o3
	stb	%i6,	[%l7 + 0x08]
	fnor	%f6,	%f28,	%f0
	fone	%f18
	movneg	%icc,	%o0,	%l0
	movrlz	%o6,	0x3E9,	%g3
	sethi	0x0DA6,	%l6
	fmovsg	%xcc,	%f2,	%f1
	ldd	[%l7 + 0x70],	%f18
	sethi	0x067C,	%o4
	umul	%i5,	%l5,	%i0
	edge32ln	%i1,	%g6,	%i7
	movpos	%icc,	%i4,	%l4
	fmovdvc	%icc,	%f16,	%f30
	udivcc	%g1,	0x1CA6,	%g4
	ldub	[%l7 + 0x12],	%l2
	movl	%icc,	%g5,	%i2
	fpsub32s	%f7,	%f26,	%f21
	andcc	%g2,	%l3,	%i3
	udivcc	%o2,	0x124B,	%o1
	movg	%icc,	%l1,	%o5
	fand	%f10,	%f6,	%f10
	smulcc	%g7,	%o3,	%i6
	edge32ln	%o7,	%o0,	%l0
	udivx	%g3,	0x068D,	%l6
	movvc	%icc,	%o6,	%o4
	sdivx	%l5,	0x1D42,	%i5
	umul	%i1,	%g6,	%i7
	ldd	[%l7 + 0x60],	%i0
	udiv	%l4,	0x13CB,	%g1
	fornot2	%f10,	%f22,	%f12
	edge16ln	%i4,	%g4,	%g5
	movl	%icc,	%i2,	%g2
	std	%f8,	[%l7 + 0x40]
	ldsw	[%l7 + 0x14],	%l3
	fcmpgt16	%f4,	%f6,	%i3
	stw	%o2,	[%l7 + 0x68]
	ld	[%l7 + 0x60],	%f3
	fandnot2s	%f5,	%f27,	%f11
	srax	%o1,	%l2,	%o5
	fxnor	%f14,	%f18,	%f4
	fmovdl	%icc,	%f8,	%f23
	movrgz	%g7,	%l1,	%o3
	subccc	%i6,	0x10DD,	%o0
	xor	%o7,	0x0D05,	%g3
	addcc	%l6,	%l0,	%o6
	fmovsvs	%icc,	%f30,	%f18
	fcmpgt16	%f22,	%f26,	%l5
	edge8n	%i5,	%o4,	%i1
	ldd	[%l7 + 0x30],	%g6
	fnegs	%f19,	%f11
	movneg	%icc,	%i0,	%i7
	fnor	%f28,	%f18,	%f0
	sth	%l4,	[%l7 + 0x14]
	fpack32	%f20,	%f28,	%f4
	subcc	%i4,	0x0DDC,	%g1
	sra	%g5,	%g4,	%g2
	ldd	[%l7 + 0x48],	%f28
	ld	[%l7 + 0x70],	%f24
	movne	%xcc,	%i2,	%l3
	stx	%o2,	[%l7 + 0x30]
	movcc	%icc,	%o1,	%l2
	movre	%o5,	0x0B8,	%i3
	fmovrsgez	%l1,	%f6,	%f7
	fnegs	%f11,	%f19
	movrlz	%g7,	0x286,	%o3
	edge8l	%o0,	%i6,	%g3
	srl	%o7,	0x02,	%l0
	edge8n	%o6,	%l6,	%i5
	ldub	[%l7 + 0x4B],	%l5
	srlx	%i1,	%o4,	%i0
	sllx	%g6,	0x14,	%l4
	fornot1s	%f30,	%f10,	%f12
	edge32l	%i4,	%g1,	%g5
	ldsh	[%l7 + 0x10],	%i7
	fzeros	%f22
	fmuld8ulx16	%f5,	%f26,	%f24
	movcc	%xcc,	%g4,	%g2
	smul	%i2,	0x1A52,	%l3
	movgu	%icc,	%o2,	%l2
	movre	%o1,	%o5,	%l1
	edge8ln	%g7,	%i3,	%o3
	andncc	%o0,	%i6,	%o7
	edge16l	%l0,	%g3,	%o6
	ldsh	[%l7 + 0x2C],	%l6
	nop
	set	0x30, %i7
	ldd	[%l7 + %i7],	%f30
	movcc	%xcc,	%l5,	%i1
	movl	%xcc,	%i5,	%i0
	st	%f13,	[%l7 + 0x10]
	restore %g6, %l4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g1,	%g5,	%i4
	edge16n	%i7,	%g2,	%g4
	mova	%xcc,	%l3,	%i2
	andcc	%l2,	0x181B,	%o1
	movgu	%icc,	%o2,	%o5
	fornot2s	%f17,	%f4,	%f8
	ldx	[%l7 + 0x58],	%l1
	lduh	[%l7 + 0x44],	%i3
	movrlez	%o3,	%o0,	%g7
	movrgez	%i6,	%o7,	%g3
	movge	%icc,	%o6,	%l6
	srlx	%l5,	%i1,	%l0
	udivcc	%i5,	0x0DDF,	%g6
	sdivx	%l4,	0x0226,	%i0
	edge16l	%o4,	%g5,	%g1
	fmovscs	%icc,	%f16,	%f19
	movrgz	%i7,	0x392,	%i4
	ld	[%l7 + 0x24],	%f19
	movl	%xcc,	%g2,	%g4
	ld	[%l7 + 0x5C],	%f27
	andncc	%i2,	%l3,	%l2
	fcmpgt32	%f24,	%f16,	%o1
	std	%f0,	[%l7 + 0x10]
	fmovspos	%xcc,	%f9,	%f6
	ldx	[%l7 + 0x58],	%o2
	fzero	%f6
	ldd	[%l7 + 0x28],	%l0
	popc	%o5,	%o3
	fabss	%f15,	%f19
	edge16l	%i3,	%o0,	%g7
	array8	%i6,	%o7,	%g3
	xor	%o6,	%l6,	%l5
	fmovdleu	%xcc,	%f23,	%f1
	fpack32	%f4,	%f28,	%f28
	edge16l	%l0,	%i5,	%i1
	movcc	%icc,	%g6,	%l4
	fcmpne16	%f30,	%f10,	%o4
	fmovspos	%icc,	%f12,	%f15
	movrlez	%g5,	0x35C,	%g1
	popc	0x03A8,	%i0
	udivx	%i4,	0x0EF9,	%i7
	edge16l	%g2,	%i2,	%g4
	move	%icc,	%l2,	%o1
	move	%icc,	%o2,	%l3
	smulcc	%l1,	0x12D0,	%o5
	edge16	%i3,	%o3,	%o0
	edge16	%i6,	%g7,	%g3
	ldsh	[%l7 + 0x30],	%o7
	alignaddr	%l6,	%l5,	%o6
	movge	%icc,	%i5,	%l0
	std	%f12,	[%l7 + 0x50]
	fmovda	%icc,	%f20,	%f24
	movvc	%xcc,	%i1,	%l4
	edge32l	%o4,	%g6,	%g5
	fnor	%f30,	%f4,	%f12
	ldsb	[%l7 + 0x1D],	%g1
	smulcc	%i0,	%i7,	%g2
	ldsb	[%l7 + 0x45],	%i4
	fmovdle	%icc,	%f19,	%f8
	movrlz	%i2,	0x129,	%l2
	fmovdle	%xcc,	%f18,	%f1
	sdivcc	%o1,	0x1C28,	%o2
	movge	%icc,	%g4,	%l3
	sll	%l1,	0x11,	%o5
	subc	%i3,	%o3,	%i6
	edge16	%g7,	%g3,	%o0
	smul	%o7,	0x03FA,	%l5
	edge32	%l6,	%o6,	%l0
	movle	%icc,	%i1,	%i5
	addc	%o4,	%l4,	%g5
	edge8n	%g1,	%g6,	%i0
	addc	%i7,	%g2,	%i2
	orncc	%l2,	%i4,	%o1
	movrlez	%o2,	%l3,	%l1
	movrgez	%g4,	%o5,	%i3
	xorcc	%i6,	0x0B32,	%o3
	fmovdneg	%icc,	%f8,	%f1
	fmovse	%icc,	%f0,	%f14
	xnor	%g7,	%o0,	%o7
	stb	%l5,	[%l7 + 0x25]
	fors	%f29,	%f10,	%f23
	udiv	%g3,	0x14FD,	%o6
	lduw	[%l7 + 0x18],	%l0
	umul	%l6,	%i5,	%i1
	addcc	%o4,	%l4,	%g1
	std	%f24,	[%l7 + 0x40]
	ldd	[%l7 + 0x50],	%g6
	fmovda	%xcc,	%f0,	%f14
	movne	%xcc,	%g5,	%i0
	mova	%icc,	%g2,	%i7
	sub	%i2,	0x10D8,	%i4
	fnands	%f17,	%f25,	%f27
	edge32	%l2,	%o2,	%o1
	udivcc	%l3,	0x1183,	%g4
	edge8n	%o5,	%l1,	%i6
	udiv	%o3,	0x0277,	%g7
	fmul8ulx16	%f14,	%f20,	%f0
	ldsh	[%l7 + 0x68],	%o0
	xnor	%i3,	%o7,	%l5
	and	%g3,	%o6,	%l6
	xnorcc	%i5,	0x0B62,	%i1
	edge8l	%l0,	%o4,	%l4
	xorcc	%g6,	0x1CED,	%g5
	or	%i0,	%g1,	%g2
	smul	%i7,	%i2,	%i4
	fmovrdgez	%o2,	%f2,	%f10
	xnorcc	%l2,	0x05DE,	%l3
	movne	%icc,	%g4,	%o1
	edge8	%l1,	%i6,	%o5
	sdiv	%o3,	0x062F,	%o0
	fmovsn	%icc,	%f14,	%f1
	movrgz	%i3,	0x040,	%g7
	srlx	%l5,	0x15,	%o7
	or	%g3,	0x039B,	%o6
	smul	%l6,	%i5,	%l0
	movgu	%xcc,	%o4,	%l4
	fmovrdgz	%g6,	%f26,	%f26
	edge32ln	%g5,	%i0,	%g1
	save %i1, 0x0B9F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%i2,	%i4,	%o2
	fand	%f30,	%f10,	%f8
	xor	%l2,	0x0BEE,	%l3
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	xor	%g4,	%i6,	%o5
	srax	%l1,	%o3,	%i3
	sll	%g7,	%l5,	%o0
	fmovrsgz	%g3,	%f8,	%f23
	sdivcc	%o6,	0x1DA2,	%o7
	sth	%i5,	[%l7 + 0x30]
	edge8n	%l6,	%o4,	%l4
	ldub	[%l7 + 0x44],	%l0
	edge16l	%g6,	%i0,	%g1
	xnorcc	%g5,	%i1,	%i2
	udiv	%g2,	0x1028,	%i4
	srl	%l2,	0x07,	%l3
	stb	%i7,	[%l7 + 0x41]
	ldx	[%l7 + 0x48],	%o1
	fmovdneg	%xcc,	%f17,	%f2
	save %o2, 0x0E7B, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g4,	%o5,	%l1
	restore %i3, 0x098A, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x63, %g2
	stb	%o3,	[%l7 + %g2]
	fabss	%f10,	%f23
	lduh	[%l7 + 0x38],	%l5
	ldsw	[%l7 + 0x6C],	%o0
	orcc	%g3,	0x178A,	%o7
	st	%f12,	[%l7 + 0x34]
	lduw	[%l7 + 0x1C],	%o6
	udiv	%i5,	0x1AFE,	%o4
	fmuld8ulx16	%f0,	%f20,	%f16
	orncc	%l6,	0x0ACA,	%l0
	alignaddr	%g6,	%l4,	%i0
	umulcc	%g1,	0x17A0,	%i1
	orncc	%g5,	0x0D08,	%g2
	alignaddr	%i2,	%i4,	%l2
	array16	%i7,	%o1,	%o2
	fpsub32	%f14,	%f24,	%f18
	ldsw	[%l7 + 0x20],	%i6
	mova	%icc,	%l3,	%o5
	ld	[%l7 + 0x3C],	%f24
	fxor	%f24,	%f10,	%f2
	ldsw	[%l7 + 0x08],	%l1
	sra	%g4,	%i3,	%o3
	for	%f20,	%f20,	%f30
	edge16ln	%l5,	%g7,	%g3
	andncc	%o0,	%o7,	%i5
	fpadd16	%f8,	%f4,	%f0
	edge32l	%o4,	%l6,	%l0
	movrne	%o6,	%g6,	%l4
	fcmpne32	%f6,	%f2,	%i0
	fpackfix	%f0,	%f14
	fors	%f3,	%f1,	%f3
	movle	%icc,	%g1,	%g5
	edge16	%g2,	%i2,	%i1
	movge	%xcc,	%i4,	%i7
	lduw	[%l7 + 0x30],	%o1
	movcc	%icc,	%o2,	%l2
	srlx	%i6,	%o5,	%l3
	sth	%l1,	[%l7 + 0x34]
	stb	%i3,	[%l7 + 0x16]
	alignaddr	%o3,	%g4,	%l5
	orn	%g7,	%o0,	%g3
	xor	%o7,	%i5,	%o4
	movgu	%icc,	%l6,	%o6
	edge16ln	%l0,	%g6,	%l4
	movrgez	%g1,	%g5,	%g2
	edge16	%i0,	%i2,	%i4
	array16	%i1,	%i7,	%o1
	add	%l2,	0x13BD,	%o2
	fmovdg	%xcc,	%f26,	%f6
	ldx	[%l7 + 0x50],	%o5
	array16	%l3,	%l1,	%i3
	edge32l	%i6,	%o3,	%l5
	std	%f18,	[%l7 + 0x20]
	movrne	%g4,	0x1D0,	%o0
	addcc	%g7,	%g3,	%i5
	xnor	%o7,	0x0349,	%o4
	fmovrdne	%o6,	%f4,	%f22
	subc	%l6,	0x14B3,	%l0
	st	%f4,	[%l7 + 0x4C]
	st	%f16,	[%l7 + 0x24]
	edge32ln	%l4,	%g1,	%g6
	edge16l	%g2,	%g5,	%i2
	sub	%i4,	%i1,	%i0
	fsrc2	%f30,	%f20
	fmovsge	%icc,	%f9,	%f31
	stw	%o1,	[%l7 + 0x58]
	umulcc	%i7,	%l2,	%o2
	or	%l3,	0x1BDA,	%o5
	sll	%i3,	0x00,	%i6
	edge16n	%l1,	%l5,	%g4
	movcc	%xcc,	%o0,	%g7
	stx	%o3,	[%l7 + 0x28]
	xnorcc	%i5,	0x1C1F,	%g3
	xnor	%o4,	0x0242,	%o6
	movleu	%xcc,	%o7,	%l6
	ld	[%l7 + 0x34],	%f6
	fcmple32	%f6,	%f26,	%l4
	srax	%g1,	0x09,	%g6
	udiv	%g2,	0x0A11,	%g5
	sdiv	%i2,	0x15EB,	%i4
	sethi	0x02A3,	%l0
	fsrc2s	%f5,	%f11
	edge32ln	%i1,	%i0,	%i7
	sdivcc	%o1,	0x0491,	%l2
	movrgz	%l3,	%o2,	%i3
	xnor	%i6,	0x1BFA,	%o5
	xor	%l1,	%g4,	%l5
	std	%f20,	[%l7 + 0x60]
	edge16	%o0,	%o3,	%i5
	subccc	%g3,	0x03CE,	%o4
	xnor	%g7,	0x1E25,	%o7
	nop
	set	0x62, %o7
	sth	%o6,	[%l7 + %o7]
	fnot2s	%f19,	%f18
	alignaddrl	%l4,	%g1,	%l6
	orcc	%g6,	0x1F52,	%g2
	sdivcc	%i2,	0x1EB8,	%i4
	movgu	%icc,	%g5,	%l0
	fmovdneg	%xcc,	%f11,	%f7
	srax	%i0,	0x15,	%i1
	udivcc	%i7,	0x1023,	%l2
	umulcc	%o1,	%o2,	%l3
	edge32ln	%i6,	%i3,	%o5
	array16	%g4,	%l5,	%l1
	movrlez	%o3,	0x1F5,	%o0
	fmovdvs	%xcc,	%f17,	%f15
	sub	%g3,	%i5,	%o4
	sdivcc	%o7,	0x1A7B,	%g7
	movleu	%xcc,	%l4,	%o6
	movvc	%icc,	%l6,	%g1
	fmovscc	%xcc,	%f9,	%f9
	xorcc	%g2,	%i2,	%g6
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	edge16ln	%l0,	%i7,	%i1
	edge8	%l2,	%o2,	%o1
	movrgez	%l3,	0x21B,	%i3
	fandnot1	%f10,	%f4,	%f16
	movrgez	%i6,	0x00B,	%g4
	stw	%o5,	[%l7 + 0x78]
	movcc	%xcc,	%l1,	%o3
	andcc	%l5,	%o0,	%i5
	fmovsleu	%icc,	%f0,	%f31
	andn	%g3,	0x1DDD,	%o4
	stb	%o7,	[%l7 + 0x73]
	sdivx	%l4,	0x1D68,	%o6
	movleu	%xcc,	%g7,	%g1
	udivx	%l6,	0x1E6A,	%g2
	xnor	%g6,	%i2,	%g5
	smulcc	%i4,	%l0,	%i0
	edge8	%i1,	%i7,	%l2
	subccc	%o1,	0x176D,	%l3
	movn	%icc,	%i3,	%i6
	edge8l	%o2,	%g4,	%l1
	orcc	%o5,	0x04DE,	%o3
	ldsw	[%l7 + 0x50],	%l5
	sdivcc	%o0,	0x022B,	%g3
	stx	%o4,	[%l7 + 0x28]
	fcmpeq16	%f22,	%f30,	%i5
	stb	%o7,	[%l7 + 0x63]
	fmovrslez	%o6,	%f22,	%f2
	movcs	%xcc,	%g7,	%l4
	fmovsa	%xcc,	%f18,	%f9
	lduh	[%l7 + 0x7A],	%g1
	pdist	%f6,	%f24,	%f20
	alignaddr	%g2,	%g6,	%i2
	array16	%l6,	%i4,	%l0
	movcs	%icc,	%g5,	%i1
	movvc	%xcc,	%i7,	%i0
	stx	%l2,	[%l7 + 0x58]
	for	%f24,	%f8,	%f30
	alignaddr	%l3,	%o1,	%i6
	mova	%icc,	%i3,	%g4
	move	%icc,	%o2,	%o5
	movgu	%icc,	%o3,	%l5
	movle	%xcc,	%o0,	%l1
	umul	%g3,	0x007C,	%o4
	udiv	%o7,	0x0AE0,	%o6
	array32	%g7,	%i5,	%g1
	edge32	%l4,	%g6,	%g2
	sdivcc	%i2,	0x0798,	%l6
	xnor	%l0,	0x0853,	%i4
	udiv	%i1,	0x09DC,	%g5
	sdivx	%i0,	0x1C0D,	%i7
	srlx	%l2,	%l3,	%i6
	ldd	[%l7 + 0x20],	%i2
	fmovdcs	%xcc,	%f26,	%f3
	fmul8x16al	%f14,	%f2,	%f30
	movvs	%icc,	%g4,	%o1
	fandnot1	%f20,	%f28,	%f8
	stb	%o2,	[%l7 + 0x7E]
	and	%o5,	%o3,	%l5
	xorcc	%o0,	%g3,	%l1
	sethi	0x1A9D,	%o4
	movrne	%o7,	0x354,	%g7
	ldsb	[%l7 + 0x79],	%i5
	nop
	set	0x6E, %l4
	ldsh	[%l7 + %l4],	%o6
	ldub	[%l7 + 0x3E],	%l4
	orncc	%g6,	0x1A64,	%g2
	umul	%i2,	0x0BF0,	%l6
	subccc	%g1,	%i4,	%l0
	subccc	%i1,	%g5,	%i7
	umulcc	%l2,	%l3,	%i0
	edge32	%i6,	%g4,	%i3
	subcc	%o1,	%o5,	%o2
	movg	%icc,	%l5,	%o3
	andncc	%o0,	%l1,	%o4
	xorcc	%o7,	0x06AC,	%g3
	fone	%f24
	sdiv	%i5,	0x1FB2,	%o6
	fmovsl	%xcc,	%f27,	%f4
	udivcc	%l4,	0x1320,	%g7
	faligndata	%f8,	%f18,	%f14
	fnot2s	%f22,	%f2
	movgu	%icc,	%g2,	%g6
	fcmpne16	%f24,	%f14,	%l6
	fmovdleu	%icc,	%f25,	%f27
	fxors	%f23,	%f3,	%f3
	restore %g1, 0x0A06, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x62],	%i4
	lduh	[%l7 + 0x42],	%l0
	fmovrdgez	%i1,	%f22,	%f0
	sdivcc	%g5,	0x123B,	%l2
	smulcc	%i7,	%l3,	%i0
	movg	%icc,	%g4,	%i6
	movre	%o1,	0x25E,	%o5
	subc	%o2,	%i3,	%o3
	fnot1	%f18,	%f26
	fmovdn	%xcc,	%f6,	%f6
	movneg	%xcc,	%o0,	%l1
	movne	%icc,	%l5,	%o4
	xorcc	%o7,	0x0224,	%i5
	fmovsne	%icc,	%f3,	%f15
	edge32l	%o6,	%g3,	%l4
	edge32	%g2,	%g7,	%g6
	andn	%g1,	%l6,	%i2
	umul	%i4,	0x1BA2,	%i1
	lduh	[%l7 + 0x22],	%l0
	popc	0x0318,	%l2
	orn	%i7,	%g5,	%l3
	fmovdg	%xcc,	%f11,	%f31
	stb	%g4,	[%l7 + 0x11]
	movvc	%xcc,	%i6,	%i0
	fmovsvc	%icc,	%f21,	%f6
	orn	%o1,	%o5,	%o2
	sdivcc	%o3,	0x18E5,	%i3
	fcmpeq16	%f12,	%f8,	%l1
	edge16n	%l5,	%o0,	%o7
	mulscc	%o4,	0x1EE5,	%i5
	fmovdge	%xcc,	%f29,	%f24
	fpackfix	%f2,	%f28
	subccc	%g3,	0x0115,	%l4
	edge16ln	%g2,	%g7,	%g6
	ldd	[%l7 + 0x58],	%f2
	andn	%o6,	0x033D,	%g1
	fxor	%f30,	%f8,	%f26
	movrlez	%i2,	0x215,	%i4
	nop
	set	0x71, %i0
	stb	%i1,	[%l7 + %i0]
	fmovdle	%icc,	%f31,	%f16
	edge32	%l6,	%l0,	%i7
	array16	%g5,	%l3,	%g4
	edge16ln	%l2,	%i6,	%i0
	fmul8x16	%f14,	%f6,	%f28
	edge16l	%o5,	%o2,	%o1
	fpackfix	%f12,	%f11
	subccc	%i3,	0x0BB1,	%o3
	sdivx	%l5,	0x09C2,	%o0
	sllx	%o7,	%o4,	%l1
	add	%i5,	0x0C24,	%l4
	srlx	%g3,	0x19,	%g7
	mulx	%g2,	0x1EBC,	%o6
	lduw	[%l7 + 0x68],	%g6
	popc	0x19F1,	%i2
	fmovrse	%i4,	%f23,	%f8
	movg	%icc,	%g1,	%l6
	nop
	set	0x08, %i6
	ldsh	[%l7 + %i6],	%i1
	edge16l	%l0,	%g5,	%i7
	fmovrsgz	%l3,	%f0,	%f24
	std	%f8,	[%l7 + 0x10]
	sir	0x0234
	movrgz	%l2,	%i6,	%g4
	umulcc	%i0,	%o2,	%o1
	stb	%o5,	[%l7 + 0x2A]
	fmovsvs	%xcc,	%f9,	%f8
	movpos	%icc,	%o3,	%l5
	udivcc	%o0,	0x1902,	%i3
	sth	%o4,	[%l7 + 0x64]
	movre	%l1,	0x06C,	%o7
	sir	0x035D
	xor	%i5,	0x0B9F,	%l4
	subc	%g3,	%g2,	%o6
	edge32l	%g6,	%i2,	%g7
	fzero	%f30
	subc	%g1,	0x1E91,	%l6
	alignaddr	%i4,	%l0,	%i1
	save %i7, 0x1BC4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l2,	%l3,	%i6
	fands	%f24,	%f15,	%f1
	edge16	%g4,	%o2,	%i0
	fors	%f6,	%f1,	%f29
	fcmpgt16	%f26,	%f6,	%o1
	fmovs	%f19,	%f7
	srl	%o3,	0x10,	%o5
	addc	%l5,	0x0A4A,	%i3
	fmovrsgz	%o0,	%f21,	%f0
	edge16ln	%l1,	%o4,	%i5
	edge16l	%o7,	%g3,	%g2
	fcmpne32	%f6,	%f18,	%o6
	sth	%g6,	[%l7 + 0x16]
	std	%f14,	[%l7 + 0x60]
	alignaddrl	%l4,	%i2,	%g1
	movrlez	%g7,	%l6,	%i4
	addc	%l0,	%i1,	%g5
	array8	%l2,	%l3,	%i6
	array16	%g4,	%i7,	%o2
	andcc	%i0,	0x0113,	%o3
	mulscc	%o1,	%o5,	%i3
	orn	%l5,	0x0B43,	%o0
	orncc	%o4,	%i5,	%l1
	udiv	%g3,	0x0493,	%g2
	stb	%o7,	[%l7 + 0x4F]
	fmovdleu	%icc,	%f21,	%f19
	edge16	%o6,	%l4,	%g6
	edge32ln	%i2,	%g7,	%l6
	srl	%i4,	%g1,	%l0
	lduw	[%l7 + 0x3C],	%g5
	movvc	%xcc,	%l2,	%i1
	andncc	%l3,	%i6,	%i7
	movge	%xcc,	%o2,	%i0
	movg	%xcc,	%g4,	%o1
	fnors	%f22,	%f22,	%f16
	movrne	%o5,	%i3,	%o3
	fnegs	%f2,	%f2
	movpos	%icc,	%l5,	%o0
	sll	%i5,	0x0C,	%o4
	fpack16	%f14,	%f8
	orn	%g3,	%l1,	%g2
	and	%o7,	0x1CC2,	%l4
	array8	%g6,	%o6,	%g7
	srax	%i2,	%l6,	%g1
	movrlz	%i4,	0x0A8,	%g5
	add	%l0,	%l2,	%l3
	lduw	[%l7 + 0x30],	%i6
	ldsh	[%l7 + 0x32],	%i1
	srl	%o2,	0x1A,	%i7
	fcmpgt16	%f8,	%f10,	%i0
	xor	%o1,	%g4,	%o5
	movne	%xcc,	%o3,	%l5
	nop
	set	0x36, %g3
	stb	%i3,	[%l7 + %g3]
	edge8n	%o0,	%i5,	%g3
	sdiv	%o4,	0x0DAE,	%g2
	fmovdn	%xcc,	%f3,	%f29
	addc	%l1,	0x0DF1,	%l4
	edge32n	%g6,	%o7,	%o6
	umul	%i2,	%g7,	%g1
	sllx	%l6,	0x14,	%i4
	fmul8x16al	%f28,	%f16,	%f16
	edge16ln	%l0,	%g5,	%l2
	edge8ln	%l3,	%i1,	%i6
	fmovda	%icc,	%f15,	%f4
	stb	%i7,	[%l7 + 0x1A]
	sethi	0x097B,	%i0
	fornot1s	%f18,	%f9,	%f15
	movvs	%xcc,	%o1,	%g4
	fmovdneg	%icc,	%f13,	%f21
	xor	%o5,	0x004D,	%o3
	edge16n	%l5,	%o2,	%i3
	addccc	%i5,	%g3,	%o4
	mulx	%g2,	%o0,	%l4
	pdist	%f8,	%f16,	%f14
	std	%f0,	[%l7 + 0x48]
	edge32n	%g6,	%l1,	%o6
	srax	%o7,	%g7,	%g1
	fmovdg	%xcc,	%f28,	%f31
	edge8ln	%l6,	%i4,	%l0
	srax	%i2,	0x01,	%g5
	fsrc2s	%f2,	%f10
	ldd	[%l7 + 0x78],	%f22
	lduw	[%l7 + 0x74],	%l2
	xor	%i1,	0x0AAB,	%i6
	stb	%l3,	[%l7 + 0x10]
	edge32n	%i7,	%i0,	%g4
	edge8ln	%o1,	%o5,	%l5
	alignaddr	%o3,	%o2,	%i3
	array32	%i5,	%g3,	%o4
	movneg	%xcc,	%g2,	%l4
	fmul8sux16	%f0,	%f0,	%f16
	edge16n	%g6,	%l1,	%o6
	ld	[%l7 + 0x3C],	%f24
	sll	%o0,	0x0A,	%g7
	movre	%g1,	%l6,	%o7
	fnand	%f20,	%f8,	%f28
	mulscc	%i4,	%l0,	%i2
	fnot2	%f26,	%f10
	movrne	%l2,	%g5,	%i6
	fpadd16s	%f11,	%f23,	%f6
	orcc	%l3,	%i7,	%i1
	fmovdcc	%xcc,	%f10,	%f30
	movleu	%xcc,	%g4,	%i0
	subccc	%o5,	%o1,	%o3
	fmovrsne	%o2,	%f26,	%f22
	movne	%icc,	%i3,	%i5
	fpackfix	%f14,	%f7
	subcc	%g3,	%o4,	%l5
	ld	[%l7 + 0x30],	%f3
	srl	%l4,	0x17,	%g6
	edge8n	%l1,	%g2,	%o6
	fandnot2	%f20,	%f18,	%f12
	fmovsneg	%icc,	%f23,	%f30
	udiv	%o0,	0x02FC,	%g1
	move	%xcc,	%l6,	%o7
	fpsub32s	%f31,	%f19,	%f24
	mulx	%i4,	0x188A,	%g7
	udivcc	%i2,	0x04C7,	%l0
	alignaddrl	%g5,	%l2,	%i6
	movg	%icc,	%l3,	%i7
	alignaddr	%i1,	%g4,	%o5
	udivcc	%o1,	0x0A83,	%o3
	movvc	%xcc,	%o2,	%i3
	st	%f14,	[%l7 + 0x10]
	xnor	%i5,	%g3,	%o4
	and	%i0,	0x09CE,	%l5
	popc	0x0B1E,	%l4
	sub	%l1,	0x013D,	%g6
	orcc	%g2,	%o6,	%o0
	sir	0x0627
	edge32l	%g1,	%l6,	%o7
	movrlez	%g7,	0x3C5,	%i2
	edge32ln	%i4,	%g5,	%l2
	sir	0x1F0C
	sdivx	%i6,	0x1DA1,	%l0
	movvs	%xcc,	%i7,	%l3
	fmovsge	%xcc,	%f10,	%f10
	fmovrdlez	%i1,	%f30,	%f28
	fxnors	%f31,	%f25,	%f30
	mulscc	%g4,	%o5,	%o3
	edge16ln	%o2,	%i3,	%i5
	edge32	%g3,	%o4,	%o1
	movrgz	%l5,	%i0,	%l1
	movcc	%icc,	%l4,	%g2
	addcc	%g6,	%o6,	%o0
	fpadd16	%f10,	%f0,	%f26
	array16	%g1,	%l6,	%g7
	edge32ln	%o7,	%i4,	%i2
	fmovd	%f18,	%f6
	edge32	%g5,	%l2,	%l0
	movle	%icc,	%i6,	%i7
	ldd	[%l7 + 0x78],	%f18
	sra	%l3,	0x04,	%i1
	movpos	%icc,	%o5,	%g4
	ld	[%l7 + 0x70],	%f30
	edge16n	%o3,	%o2,	%i3
	smul	%i5,	0x14E7,	%o4
	movrlez	%o1,	0x160,	%l5
	sll	%i0,	0x12,	%l1
	movge	%xcc,	%g3,	%g2
	fmul8ulx16	%f14,	%f14,	%f22
	edge8l	%g6,	%l4,	%o6
	edge16n	%o0,	%g1,	%g7
	umulcc	%l6,	0x0742,	%o7
	sll	%i2,	0x0C,	%g5
	fmovsgu	%icc,	%f30,	%f17
	movrgez	%l2,	%l0,	%i6
	andncc	%i4,	%l3,	%i7
	fcmpgt16	%f28,	%f4,	%i1
	edge32ln	%o5,	%o3,	%g4
	fmovrslez	%i3,	%f7,	%f19
	addcc	%i5,	0x1311,	%o2
	xor	%o1,	0x1DC8,	%o4
	edge32l	%l5,	%i0,	%l1
	fones	%f26
	std	%f16,	[%l7 + 0x78]
	edge16ln	%g3,	%g2,	%g6
	srax	%o6,	0x0D,	%o0
	alignaddrl	%g1,	%g7,	%l6
	xor	%l4,	%i2,	%g5
	nop
	set	0x40, %l3
	stx	%o7,	[%l7 + %l3]
	for	%f16,	%f8,	%f30
	sethi	0x0295,	%l2
	andncc	%l0,	%i6,	%i4
	orncc	%i7,	0x0131,	%l3
	edge32n	%i1,	%o5,	%o3
	movpos	%icc,	%i3,	%g4
	edge16	%i5,	%o1,	%o2
	edge16n	%o4,	%i0,	%l5
	alignaddrl	%g3,	%g2,	%g6
	bshuffle	%f0,	%f18,	%f10
	edge8l	%o6,	%l1,	%g1
	sth	%o0,	[%l7 + 0x78]
	edge8l	%l6,	%g7,	%l4
	fnot1s	%f21,	%f11
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	fand	%f26,	%f28,	%f26
	edge32n	%l0,	%i6,	%i4
	movpos	%icc,	%i7,	%l2
	movleu	%xcc,	%i1,	%l3
	movgu	%icc,	%o5,	%i3
	andncc	%g4,	%o3,	%i5
	sdiv	%o2,	0x19B9,	%o1
	fpadd32	%f2,	%f18,	%f22
	lduh	[%l7 + 0x12],	%i0
	save %l5, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g6,	0x1793,	%g2
	subcc	%l1,	0x0B3F,	%g1
	edge32l	%o6,	%o0,	%g7
	edge32ln	%l4,	%i2,	%o7
	lduw	[%l7 + 0x28],	%g5
	restore %l6, %l0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%i7,	[%l7 + 0x18]
	sir	0x1BFE
	fnot2	%f4,	%f20
	andcc	%i6,	%l2,	%l3
	stw	%o5,	[%l7 + 0x58]
	array32	%i1,	%g4,	%o3
	movrlez	%i3,	0x0C6,	%o2
	stw	%i5,	[%l7 + 0x24]
	popc	0x0B93,	%i0
	smul	%o1,	0x0D37,	%l5
	orn	%o4,	%g3,	%g6
	sdivcc	%l1,	0x0F6A,	%g1
	edge32n	%g2,	%o6,	%o0
	sub	%g7,	%i2,	%o7
	subcc	%g5,	%l4,	%l6
	udivcc	%l0,	0x19FA,	%i7
	mulscc	%i6,	0x15AF,	%i4
	movgu	%xcc,	%l3,	%l2
	srl	%o5,	0x12,	%g4
	ldd	[%l7 + 0x58],	%f0
	add	%i1,	%i3,	%o3
	mova	%icc,	%i5,	%o2
	sub	%o1,	%l5,	%i0
	fpsub16	%f4,	%f12,	%f24
	fcmpne32	%f8,	%f6,	%g3
	srl	%g6,	0x08,	%o4
	fexpand	%f25,	%f22
	lduw	[%l7 + 0x38],	%g1
	movleu	%icc,	%g2,	%o6
	movvs	%icc,	%l1,	%o0
	movre	%i2,	0x1D0,	%g7
	fmovscs	%xcc,	%f19,	%f13
	sdivcc	%o7,	0x1087,	%l4
	sra	%g5,	0x1E,	%l6
	sth	%i7,	[%l7 + 0x38]
	edge32	%i6,	%l0,	%i4
	movrlz	%l3,	0x294,	%l2
	nop
	set	0x08, %g7
	ldd	[%l7 + %g7],	%f6
	subccc	%o5,	%g4,	%i1
	andn	%i3,	0x1D6D,	%o3
	edge16	%o2,	%i5,	%o1
	movgu	%xcc,	%i0,	%l5
	fmovscs	%xcc,	%f21,	%f20
	alignaddr	%g6,	%g3,	%g1
	fmovsa	%icc,	%f27,	%f14
	movneg	%xcc,	%g2,	%o6
	orncc	%o4,	0x17CB,	%l1
	sll	%i2,	%o0,	%o7
	andcc	%g7,	%g5,	%l6
	umul	%i7,	%l4,	%i6
	array16	%l0,	%l3,	%i4
	movneg	%xcc,	%o5,	%g4
	movleu	%icc,	%l2,	%i1
	save %i3, %o2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o1,	%o3,	%l5
	movcc	%icc,	%i0,	%g3
	nop
	set	0x28, %i3
	ldx	[%l7 + %i3],	%g6
	fpack16	%f26,	%f15
	movn	%xcc,	%g2,	%o6
	movrgz	%o4,	0x19B,	%l1
	edge16l	%i2,	%g1,	%o0
	array16	%o7,	%g5,	%l6
	fmovdgu	%xcc,	%f18,	%f7
	orn	%g7,	0x12BC,	%l4
	addc	%i6,	%l0,	%l3
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	movre	%g4,	0x35E,	%l2
	xnorcc	%i1,	0x139A,	%o5
	sdivx	%o2,	0x1A9E,	%i3
	fabsd	%f14,	%f18
	stw	%i5,	[%l7 + 0x5C]
	xor	%o3,	0x1610,	%l5
	movrgz	%i0,	0x15B,	%g3
	movcs	%xcc,	%o1,	%g2
	movrgez	%o6,	0x3BB,	%g6
	popc	0x0D1A,	%l1
	sdivcc	%o4,	0x0D90,	%i2
	subcc	%o0,	0x063C,	%g1
	fmovspos	%icc,	%f8,	%f29
	edge8	%o7,	%l6,	%g5
	edge8	%l4,	%g7,	%i6
	movle	%xcc,	%l3,	%i4
	umul	%i7,	%g4,	%l0
	sllx	%l2,	%o5,	%o2
	alignaddr	%i1,	%i5,	%o3
	movle	%xcc,	%l5,	%i0
	std	%f4,	[%l7 + 0x60]
	orcc	%i3,	%o1,	%g2
	sllx	%o6,	0x06,	%g6
	alignaddrl	%l1,	%g3,	%i2
	andn	%o4,	0x0A71,	%o0
	ldsh	[%l7 + 0x10],	%o7
	xor	%l6,	%g1,	%g5
	edge16n	%l4,	%g7,	%i6
	fnegs	%f21,	%f0
	and	%l3,	0x1D86,	%i7
	addcc	%g4,	0x1988,	%i4
	movvc	%icc,	%l0,	%o5
	sth	%l2,	[%l7 + 0x52]
	fpmerge	%f4,	%f10,	%f6
	sdiv	%i1,	0x0C7C,	%i5
	edge32l	%o3,	%l5,	%o2
	ldd	[%l7 + 0x20],	%i2
	srl	%i0,	%o1,	%o6
	movcs	%xcc,	%g2,	%g6
	mulx	%l1,	0x1DF3,	%i2
	subccc	%o4,	%o0,	%o7
	movleu	%icc,	%l6,	%g3
	subcc	%g1,	0x0C31,	%g5
	fmovrslz	%l4,	%f28,	%f11
	ld	[%l7 + 0x54],	%f2
	ldd	[%l7 + 0x18],	%i6
	fxors	%f3,	%f11,	%f5
	sdivx	%g7,	0x1032,	%i7
	fcmped	%fcc1,	%f30,	%f30
	fmovd	%f16,	%f2
	fmovdcc	%icc,	%f0,	%f28
	srax	%g4,	%l3,	%i4
	st	%f21,	[%l7 + 0x30]
	sra	%l0,	0x16,	%l2
	fmovsl	%xcc,	%f26,	%f29
	fmul8sux16	%f16,	%f2,	%f12
	srax	%i1,	%i5,	%o5
	movcc	%xcc,	%l5,	%o2
	ldsh	[%l7 + 0x34],	%o3
	alignaddr	%i0,	%i3,	%o6
	bshuffle	%f20,	%f8,	%f12
	srlx	%g2,	0x11,	%g6
	array32	%o1,	%l1,	%o4
	movg	%icc,	%o0,	%o7
	mulscc	%l6,	0x11F2,	%i2
	movpos	%icc,	%g3,	%g1
	sethi	0x1A4B,	%l4
	movle	%icc,	%i6,	%g7
	fsrc2	%f8,	%f2
	movl	%xcc,	%g5,	%g4
	subcc	%l3,	0x1C47,	%i7
	fsrc1s	%f0,	%f3
	stx	%l0,	[%l7 + 0x38]
	fmovsvc	%icc,	%f31,	%f0
	stb	%l2,	[%l7 + 0x18]
	alignaddr	%i4,	%i1,	%i5
	lduh	[%l7 + 0x5E],	%l5
	andn	%o5,	0x14CF,	%o3
	lduh	[%l7 + 0x18],	%i0
	fmovsleu	%xcc,	%f11,	%f13
	fmovsle	%icc,	%f18,	%f29
	subcc	%o2,	0x11E9,	%o6
	movcs	%xcc,	%g2,	%i3
	movvc	%xcc,	%g6,	%o1
	mova	%xcc,	%l1,	%o0
	fmovscs	%icc,	%f13,	%f22
	movrne	%o4,	%o7,	%i2
	edge32ln	%g3,	%g1,	%l6
	mulscc	%i6,	%l4,	%g7
	fmovsg	%xcc,	%f0,	%f23
	movrlez	%g4,	0x3FF,	%g5
	move	%xcc,	%l3,	%l0
	ldsh	[%l7 + 0x0E],	%i7
	edge32	%l2,	%i1,	%i5
	movpos	%xcc,	%l5,	%o5
	lduh	[%l7 + 0x1E],	%o3
	umulcc	%i0,	%i4,	%o6
	ldd	[%l7 + 0x38],	%o2
	edge16l	%g2,	%i3,	%o1
	smul	%l1,	%g6,	%o4
	ldsw	[%l7 + 0x44],	%o7
	movleu	%xcc,	%i2,	%g3
	movrne	%g1,	%o0,	%l6
	addc	%l4,	0x14F3,	%i6
	fmovrsne	%g4,	%f26,	%f8
	edge8	%g5,	%l3,	%g7
	edge8	%l0,	%l2,	%i7
	udivcc	%i1,	0x14C3,	%i5
	sdiv	%o5,	0x189C,	%o3
	ldsb	[%l7 + 0x0D],	%l5
	subccc	%i0,	0x1A06,	%i4
	subcc	%o6,	0x18F3,	%g2
	edge16l	%i3,	%o2,	%l1
	edge16l	%o1,	%g6,	%o7
	movrne	%i2,	%g3,	%g1
	nop
	set	0x5C, %l0
	lduw	[%l7 + %l0],	%o4
	movge	%xcc,	%l6,	%o0
	andncc	%i6,	%g4,	%l4
	smulcc	%g5,	%g7,	%l3
	edge16l	%l0,	%i7,	%l2
	ldd	[%l7 + 0x08],	%i4
	mulx	%i1,	%o5,	%l5
	sll	%i0,	%o3,	%i4
	fcmps	%fcc1,	%f15,	%f15
	orcc	%o6,	0x06A0,	%g2
	addccc	%i3,	0x1E30,	%o2
	srax	%o1,	0x0C,	%g6
	ldd	[%l7 + 0x50],	%l0
	udiv	%o7,	0x0CEB,	%i2
	movge	%xcc,	%g3,	%o4
	orcc	%l6,	%g1,	%o0
	edge16ln	%g4,	%i6,	%g5
	sethi	0x01A6,	%g7
	movrlez	%l4,	%l3,	%i7
	umulcc	%l2,	0x1F41,	%i5
	srax	%i1,	%o5,	%l0
	smulcc	%l5,	%i0,	%o3
	addccc	%o6,	%i4,	%i3
	smulcc	%g2,	0x057D,	%o1
	orncc	%o2,	%g6,	%l1
	sra	%o7,	%g3,	%o4
	movvs	%icc,	%l6,	%g1
	sdivx	%o0,	0x0621,	%i2
	edge32ln	%i6,	%g5,	%g7
	edge32ln	%l4,	%l3,	%g4
	pdist	%f0,	%f4,	%f20
	movneg	%xcc,	%l2,	%i5
	sir	0x1DA4
	move	%xcc,	%i1,	%i7
	edge32l	%o5,	%l0,	%i0
	addccc	%o3,	0x0D2B,	%o6
	edge32l	%l5,	%i4,	%i3
	fmul8x16	%f24,	%f18,	%f26
	xorcc	%o1,	0x120A,	%o2
	fpackfix	%f20,	%f4
	mulscc	%g2,	0x1244,	%g6
	or	%o7,	0x0F74,	%l1
	sdiv	%g3,	0x17A6,	%o4
	and	%l6,	%o0,	%i2
	andcc	%g1,	%i6,	%g7
	fmovspos	%xcc,	%f29,	%f31
	movrgz	%l4,	0x194,	%g5
	or	%g4,	0x104B,	%l2
	save %i5, %l3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f3,	%f2
	subcc	%o5,	%l0,	%i0
	ld	[%l7 + 0x0C],	%f10
	udivcc	%i1,	0x13F1,	%o3
	addc	%l5,	%o6,	%i4
	movleu	%icc,	%i3,	%o2
	andncc	%g2,	%o1,	%o7
	fmovscc	%xcc,	%f9,	%f24
	movvs	%xcc,	%l1,	%g6
	stx	%g3,	[%l7 + 0x40]
	fors	%f28,	%f0,	%f24
	edge8ln	%l6,	%o4,	%i2
	array8	%o0,	%g1,	%i6
	fxnor	%f4,	%f14,	%f24
	fnands	%f9,	%f10,	%f2
	ldd	[%l7 + 0x40],	%f20
	movle	%icc,	%g7,	%l4
	mulscc	%g4,	0x00D0,	%g5
	fones	%f28
	stx	%l2,	[%l7 + 0x58]
	nop
	set	0x38, %i4
	ldsh	[%l7 + %i4],	%l3
	addccc	%i5,	0x122D,	%o5
	std	%f0,	[%l7 + 0x10]
	addccc	%l0,	0x0D57,	%i0
	movcs	%icc,	%i7,	%i1
	andncc	%l5,	%o6,	%o3
	fsrc1	%f2,	%f26
	movn	%xcc,	%i4,	%o2
	movpos	%icc,	%g2,	%o1
	array8	%i3,	%o7,	%l1
	subc	%g6,	%l6,	%g3
	orcc	%i2,	0x0D61,	%o0
	movrgez	%o4,	0x30B,	%i6
	fmovsa	%xcc,	%f20,	%f25
	udivx	%g1,	0x1609,	%g7
	array32	%l4,	%g4,	%l2
	movpos	%icc,	%g5,	%l3
	fcmpgt32	%f6,	%f6,	%o5
	std	%f30,	[%l7 + 0x50]
	smul	%l0,	0x05D0,	%i5
	edge32l	%i7,	%i1,	%i0
	ldd	[%l7 + 0x10],	%f30
	sll	%o6,	%l5,	%i4
	edge16ln	%o2,	%g2,	%o3
	popc	0x0EC0,	%o1
	sdivx	%i3,	0x0D56,	%l1
	movre	%g6,	0x39F,	%l6
	array8	%g3,	%i2,	%o0
	array32	%o4,	%o7,	%i6
	udiv	%g7,	0x043A,	%g1
	orncc	%g4,	0x106E,	%l2
	edge8ln	%l4,	%l3,	%g5
	fmovdle	%xcc,	%f10,	%f13
	edge32l	%o5,	%l0,	%i5
	edge8n	%i7,	%i1,	%i0
	movrne	%l5,	%i4,	%o2
	movvc	%icc,	%g2,	%o6
	stb	%o1,	[%l7 + 0x50]
	nop
	set	0x21, %i5
	stb	%i3,	[%l7 + %i5]
	array8	%o3,	%g6,	%l1
	movrgz	%g3,	0x21B,	%l6
	edge16ln	%i2,	%o4,	%o7
	andcc	%o0,	%i6,	%g7
	mova	%icc,	%g4,	%l2
	movge	%xcc,	%l4,	%g1
	array32	%g5,	%o5,	%l0
	edge8ln	%l3,	%i5,	%i7
	fmovscs	%xcc,	%f30,	%f12
	addc	%i0,	%l5,	%i1
	movre	%i4,	%g2,	%o2
	udivcc	%o1,	0x0BA6,	%i3
	movg	%icc,	%o6,	%o3
	fandnot1s	%f23,	%f6,	%f27
	movne	%xcc,	%l1,	%g6
	andncc	%g3,	%l6,	%i2
	fpadd16s	%f0,	%f24,	%f6
	fmovsg	%xcc,	%f31,	%f4
	edge16n	%o4,	%o7,	%i6
	orcc	%g7,	0x082C,	%g4
	orn	%l2,	%l4,	%g1
	fones	%f28
	lduh	[%l7 + 0x32],	%g5
	ldx	[%l7 + 0x30],	%o0
	or	%l0,	%o5,	%l3
	movrlez	%i7,	0x05B,	%i5
	save %i0, 0x0E8B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i1,	%i4,	%g2
	fmovsleu	%xcc,	%f7,	%f10
	edge16ln	%o1,	%i3,	%o2
	fmovsg	%icc,	%f27,	%f4
	addc	%o3,	0x0D16,	%o6
	fcmpne32	%f8,	%f30,	%g6
	fmul8x16	%f11,	%f30,	%f14
	edge32ln	%l1,	%g3,	%l6
	movrlz	%o4,	0x059,	%o7
	addccc	%i2,	%g7,	%i6
	srax	%l2,	0x19,	%l4
	siam	0x0
	or	%g4,	0x01BA,	%g1
	nop
	set	0x76, %g6
	stb	%g5,	[%l7 + %g6]
	movg	%xcc,	%o0,	%o5
	sub	%l0,	0x008E,	%l3
	edge8	%i7,	%i0,	%l5
	udivcc	%i5,	0x1A89,	%i4
	srlx	%i1,	0x14,	%o1
	ldsb	[%l7 + 0x1B],	%i3
	subc	%g2,	0x1048,	%o2
	alignaddr	%o6,	%g6,	%l1
	fmovsa	%icc,	%f1,	%f16
	xnorcc	%o3,	0x1025,	%g3
	edge8	%o4,	%o7,	%l6
	fnot2	%f10,	%f12
	fmovdvc	%xcc,	%f0,	%f19
	ldd	[%l7 + 0x50],	%f18
	alignaddrl	%i2,	%g7,	%i6
	sth	%l2,	[%l7 + 0x34]
	stw	%g4,	[%l7 + 0x24]
	movrlez	%g1,	%g5,	%o0
	stx	%l4,	[%l7 + 0x40]
	movleu	%xcc,	%l0,	%o5
	sdivcc	%i7,	0x1317,	%l3
	udiv	%i0,	0x0885,	%l5
	sir	0x13F5
	fmovrde	%i5,	%f20,	%f0
	addccc	%i4,	0x0028,	%o1
	andcc	%i3,	0x1159,	%i1
	udivx	%g2,	0x076E,	%o6
	edge8l	%g6,	%l1,	%o2
	movrne	%o3,	%g3,	%o4
	xorcc	%l6,	%i2,	%o7
	sdivx	%i6,	0x0786,	%g7
	and	%g4,	%g1,	%l2
	add	%g5,	%l4,	%l0
	save %o0, 0x15CB, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdgu	%icc,	%f28,	%f0
	mulscc	%i7,	0x0B7F,	%l3
	and	%i0,	%l5,	%i4
	movl	%xcc,	%i5,	%i3
	fpadd16	%f22,	%f20,	%f2
	umul	%i1,	0x0D96,	%g2
	fnot1	%f8,	%f24
	movl	%icc,	%o1,	%o6
	ldub	[%l7 + 0x53],	%g6
	fcmpeq32	%f2,	%f30,	%l1
	addcc	%o2,	0x12F4,	%o3
	movrgez	%o4,	0x263,	%g3
	orcc	%l6,	0x1D98,	%i2
	orn	%o7,	%i6,	%g7
	stx	%g1,	[%l7 + 0x38]
	fmovrdne	%g4,	%f22,	%f10
	fnegs	%f19,	%f7
	ldub	[%l7 + 0x5E],	%g5
	sdiv	%l2,	0x03BB,	%l4
	movle	%xcc,	%l0,	%o5
	fsrc2s	%f13,	%f29
	umulcc	%i7,	%o0,	%l3
	movpos	%icc,	%l5,	%i0
	ldsb	[%l7 + 0x45],	%i4
	movge	%icc,	%i3,	%i5
	movrgez	%i1,	0x1BA,	%o1
	fnands	%f18,	%f28,	%f18
	movl	%xcc,	%o6,	%g2
	umul	%g6,	0x1F7F,	%l1
	st	%f9,	[%l7 + 0x40]
	edge8l	%o3,	%o4,	%o2
	fmovsge	%xcc,	%f7,	%f6
	fcmpeq16	%f10,	%f18,	%g3
	fnegs	%f5,	%f13
	fandnot1	%f4,	%f28,	%f28
	array32	%l6,	%i2,	%i6
	edge16n	%o7,	%g7,	%g4
	alignaddrl	%g5,	%g1,	%l4
	or	%l0,	%o5,	%l2
	movcs	%icc,	%i7,	%l3
	fmovrsne	%l5,	%f31,	%f10
	ldub	[%l7 + 0x1A],	%i0
	fmovdpos	%icc,	%f2,	%f29
	sllx	%o0,	0x1E,	%i4
	orncc	%i5,	%i3,	%o1
	fmovsa	%xcc,	%f14,	%f7
	mulx	%o6,	0x0F8D,	%g2
	udivcc	%g6,	0x0B84,	%l1
	fcmpeq16	%f26,	%f2,	%i1
	subccc	%o4,	%o2,	%g3
	fmovdcc	%icc,	%f27,	%f14
	sra	%o3,	%l6,	%i2
	move	%xcc,	%i6,	%o7
	fmovdcs	%xcc,	%f15,	%f4
	orncc	%g4,	%g5,	%g7
	movneg	%icc,	%g1,	%l0
	array32	%l4,	%o5,	%i7
	xor	%l2,	0x1892,	%l3
	array32	%l5,	%o0,	%i0
	restore %i5, 0x0239, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o1,	%o6,	%i4
	fandnot2	%f26,	%f30,	%f24
	xor	%g2,	0x09F8,	%l1
	umul	%i1,	%g6,	%o4
	fsrc2	%f30,	%f6
	array16	%o2,	%g3,	%l6
	movleu	%xcc,	%o3,	%i6
	edge8n	%o7,	%g4,	%g5
	alignaddr	%i2,	%g1,	%l0
	fmovspos	%xcc,	%f3,	%f21
	movvs	%xcc,	%g7,	%l4
	addc	%i7,	%o5,	%l2
	movne	%xcc,	%l5,	%o0
	movge	%xcc,	%i0,	%i5
	fcmple32	%f4,	%f28,	%l3
	ldsw	[%l7 + 0x58],	%i3
	movl	%xcc,	%o6,	%i4
	xnorcc	%o1,	%g2,	%l1
	ldsb	[%l7 + 0x0B],	%g6
	movge	%xcc,	%o4,	%o2
	edge8l	%g3,	%i1,	%o3
	edge32n	%i6,	%l6,	%g4
	orcc	%g5,	%i2,	%g1
	subc	%o7,	%g7,	%l4
	sdiv	%i7,	0x10CF,	%o5
	xnorcc	%l0,	%l5,	%l2
	ldsw	[%l7 + 0x08],	%o0
	edge16	%i5,	%l3,	%i3
	stb	%o6,	[%l7 + 0x1B]
	fxor	%f10,	%f4,	%f18
	movpos	%icc,	%i4,	%o1
	srl	%g2,	0x08,	%l1
	subcc	%i0,	0x0D39,	%o4
	movrgez	%g6,	%o2,	%i1
	alignaddr	%g3,	%o3,	%l6
	sll	%g4,	%i6,	%g5
	xorcc	%g1,	0x16F4,	%i2
	movvc	%xcc,	%g7,	%o7
	array8	%l4,	%i7,	%o5
	edge16ln	%l0,	%l5,	%o0
	fmovrdgz	%i5,	%f12,	%f6
	stx	%l2,	[%l7 + 0x20]
	lduh	[%l7 + 0x6E],	%i3
	move	%xcc,	%l3,	%i4
	sdiv	%o6,	0x05FD,	%o1
	fmovscs	%icc,	%f9,	%f4
	fcmpeq16	%f24,	%f18,	%g2
	xor	%l1,	0x1EAE,	%o4
	sethi	0x027F,	%g6
	fmovrsgez	%o2,	%f5,	%f20
	fand	%f2,	%f20,	%f10
	or	%i0,	%i1,	%g3
	stb	%l6,	[%l7 + 0x2E]
	popc	0x0E9C,	%o3
	ldx	[%l7 + 0x38],	%i6
	ldub	[%l7 + 0x2E],	%g4
	sdivx	%g1,	0x0A5B,	%i2
	sll	%g7,	%o7,	%l4
	lduh	[%l7 + 0x64],	%i7
	fxors	%f15,	%f22,	%f12
	popc	0x1E56,	%g5
	ldx	[%l7 + 0x48],	%o5
	movpos	%xcc,	%l5,	%o0
	stx	%i5,	[%l7 + 0x68]
	add	%l2,	0x011A,	%l0
	smulcc	%i3,	%l3,	%o6
	edge8ln	%i4,	%o1,	%l1
	or	%g2,	%g6,	%o4
	save %o2, %i1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f4,	%f2,	%g3
	xor	%o3,	0x09FB,	%l6
	movvs	%xcc,	%g4,	%i6
	ldsh	[%l7 + 0x60],	%g1
	fmovrdlez	%g7,	%f6,	%f22
	sth	%o7,	[%l7 + 0x18]
	ld	[%l7 + 0x50],	%f3
	lduw	[%l7 + 0x24],	%i2
	edge32ln	%l4,	%g5,	%i7
	movre	%o5,	%o0,	%l5
	fornot1	%f16,	%f24,	%f26
	fabss	%f24,	%f27
	stw	%i5,	[%l7 + 0x14]
	fpack32	%f20,	%f8,	%f16
	edge8ln	%l0,	%i3,	%l2
	alignaddr	%l3,	%o6,	%i4
	add	%l1,	%g2,	%g6
	fcmpne32	%f26,	%f10,	%o4
	orn	%o1,	%o2,	%i1
	and	%i0,	%g3,	%l6
	popc	0x0D69,	%o3
	sth	%i6,	[%l7 + 0x6C]
	bshuffle	%f26,	%f26,	%f26
	xorcc	%g1,	0x1CFA,	%g4
	nop
	set	0x08, %i1
	std	%f8,	[%l7 + %i1]
	ldub	[%l7 + 0x24],	%g7
	fnot1s	%f24,	%f0
	movvc	%xcc,	%i2,	%o7
	lduh	[%l7 + 0x78],	%g5
	sth	%l4,	[%l7 + 0x1C]
	edge16	%o5,	%i7,	%l5
	subcc	%i5,	%l0,	%i3
	popc	%l2,	%l3
	andn	%o6,	0x184A,	%o0
	fones	%f14
	andncc	%i4,	%g2,	%l1
	fone	%f30
	edge16n	%g6,	%o1,	%o2
	andcc	%i1,	%i0,	%o4
	movl	%xcc,	%g3,	%o3
	movl	%xcc,	%l6,	%i6
	fcmpd	%fcc0,	%f18,	%f26
	udivcc	%g1,	0x0F95,	%g4
	popc	0x0D78,	%i2
	fornot2s	%f16,	%f30,	%f16
	stx	%o7,	[%l7 + 0x50]
	edge16n	%g7,	%g5,	%l4
	fpadd32	%f16,	%f26,	%f14
	edge32ln	%i7,	%o5,	%l5
	fone	%f10
	ldd	[%l7 + 0x40],	%f6
	edge16ln	%l0,	%i5,	%l2
	udivx	%i3,	0x1C1B,	%o6
	sethi	0x181E,	%l3
	movne	%icc,	%i4,	%g2
	movn	%xcc,	%l1,	%g6
	move	%icc,	%o1,	%o2
	ldsb	[%l7 + 0x4A],	%i1
	movleu	%icc,	%o0,	%i0
	addc	%g3,	0x0F9E,	%o3
	sdivx	%o4,	0x0F95,	%l6
	udiv	%g1,	0x09EA,	%g4
	stw	%i6,	[%l7 + 0x78]
	movpos	%icc,	%i2,	%o7
	movle	%xcc,	%g7,	%g5
	addcc	%i7,	0x096A,	%l4
	array16	%o5,	%l0,	%i5
	fmovdle	%xcc,	%f0,	%f24
	edge16n	%l5,	%i3,	%l2
	fzero	%f28
	srax	%o6,	0x0B,	%l3
	fmovdleu	%icc,	%f13,	%f15
	sethi	0x1188,	%i4
	smul	%g2,	%g6,	%o1
	fmovdne	%xcc,	%f22,	%f31
	mulx	%l1,	%o2,	%o0
	fmovrdlez	%i1,	%f2,	%f10
	edge32l	%i0,	%g3,	%o3
	movleu	%xcc,	%l6,	%g1
	movpos	%icc,	%g4,	%o4
	edge8l	%i6,	%i2,	%o7
	movcc	%icc,	%g5,	%i7
	fmuld8sux16	%f6,	%f31,	%f30
	sdiv	%l4,	0x0118,	%g7
	sll	%l0,	%i5,	%o5
	sllx	%i3,	%l2,	%o6
	andcc	%l3,	0x1C7F,	%i4
	movcs	%xcc,	%g2,	%l5
	fmovdleu	%icc,	%f26,	%f3
	array8	%g6,	%l1,	%o1
	fsrc1	%f10,	%f6
	xnor	%o2,	%o0,	%i0
	movneg	%icc,	%g3,	%o3
	umul	%l6,	%i1,	%g4
	edge32	%o4,	%i6,	%g1
	fpadd32	%f10,	%f30,	%f6
	andn	%o7,	%i2,	%g5
	fands	%f25,	%f16,	%f26
	umulcc	%l4,	%g7,	%l0
	movgu	%icc,	%i7,	%i5
	sdivx	%i3,	0x04E7,	%l2
	andcc	%o5,	%l3,	%o6
	movl	%xcc,	%i4,	%g2
	udivcc	%l5,	0x1FC4,	%l1
	xnorcc	%o1,	%g6,	%o2
	array8	%o0,	%g3,	%i0
	edge16ln	%l6,	%i1,	%o3
	fnor	%f4,	%f18,	%f30
	addccc	%g4,	%i6,	%g1
	sdivcc	%o4,	0x18C7,	%i2
	udivcc	%g5,	0x16C3,	%o7
	movcs	%xcc,	%g7,	%l0
	and	%l4,	%i7,	%i3
	array16	%i5,	%o5,	%l3
	sdivx	%l2,	0x1D87,	%o6
	movvs	%icc,	%i4,	%l5
	ldsw	[%l7 + 0x1C],	%g2
	fxnor	%f20,	%f16,	%f2
	movrgez	%l1,	%o1,	%o2
	lduh	[%l7 + 0x7C],	%g6
	fand	%f2,	%f16,	%f4
	edge8l	%g3,	%o0,	%i0
	fmovdneg	%xcc,	%f19,	%f5
	ldd	[%l7 + 0x48],	%i0
	movn	%icc,	%o3,	%l6
	udivcc	%i6,	0x0F78,	%g1
	movleu	%xcc,	%g4,	%i2
	smul	%o4,	0x04F7,	%o7
	movrlz	%g5,	0x22C,	%l0
	movrne	%l4,	0x271,	%i7
	siam	0x3
	sth	%g7,	[%l7 + 0x40]
	add	%i5,	%o5,	%l3
	fzero	%f22
	ldub	[%l7 + 0x34],	%i3
	fcmpeq32	%f24,	%f0,	%l2
	movcc	%xcc,	%o6,	%l5
	udivcc	%g2,	0x1096,	%l1
	fcmpgt32	%f22,	%f16,	%i4
	movleu	%xcc,	%o1,	%o2
	movcs	%xcc,	%g6,	%g3
	subc	%o0,	0x0E45,	%i1
	siam	0x3
	addc	%o3,	%i0,	%l6
	movgu	%icc,	%g1,	%g4
	smul	%i2,	0x042C,	%o4
	fand	%f14,	%f0,	%f28
	ld	[%l7 + 0x54],	%f21
	lduh	[%l7 + 0x4A],	%o7
	fcmpgt16	%f8,	%f2,	%i6
	stx	%l0,	[%l7 + 0x10]
	movrgz	%l4,	0x1FD,	%g5
	movcc	%icc,	%g7,	%i7
	array16	%o5,	%l3,	%i3
	movpos	%xcc,	%l2,	%o6
	fmovdpos	%xcc,	%f9,	%f28
	umulcc	%i5,	%g2,	%l1
	fmuld8ulx16	%f5,	%f23,	%f16
	edge32l	%i4,	%l5,	%o2
	smulcc	%o1,	0x081C,	%g3
	edge8l	%o0,	%i1,	%g6
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	fornot2s	%f13,	%f20,	%f22
	fsrc1	%f20,	%f4
	fcmpgt16	%f30,	%f16,	%g4
	edge8	%i2,	%o4,	%o7
	sethi	0x14F6,	%i0
	subc	%l0,	0x0D80,	%i6
	movcc	%icc,	%l4,	%g7
	fnot2	%f14,	%f28
	alignaddrl	%g5,	%i7,	%o5
	ldsw	[%l7 + 0x7C],	%l3
	edge8n	%l2,	%o6,	%i3
	sethi	0x1B53,	%i5
	fcmpne16	%f12,	%f14,	%g2
	lduw	[%l7 + 0x64],	%i4
	movn	%icc,	%l5,	%o2
	mulx	%o1,	0x06B6,	%l1
	fnegs	%f10,	%f23
	sth	%o0,	[%l7 + 0x70]
	ldsb	[%l7 + 0x55],	%i1
	fpadd32s	%f7,	%f7,	%f31
	fmovrdgez	%g3,	%f16,	%f8
	add	%o3,	%l6,	%g6
	orcc	%g1,	0x1E3B,	%i2
	edge32	%g4,	%o4,	%o7
	edge16n	%l0,	%i6,	%l4
	sdivcc	%g7,	0x1681,	%g5
	or	%i0,	0x1FF4,	%i7
	udivcc	%l3,	0x18BE,	%o5
	addc	%l2,	0x1830,	%o6
	edge32	%i5,	%i3,	%i4
	umul	%g2,	0x181E,	%l5
	movg	%icc,	%o1,	%o2
	stx	%l1,	[%l7 + 0x48]
	edge32l	%o0,	%g3,	%i1
	andn	%l6,	0x0CD9,	%g6
	fmovdg	%icc,	%f30,	%f25
	edge8l	%o3,	%g1,	%g4
	fmovrse	%i2,	%f25,	%f29
	ldx	[%l7 + 0x40],	%o7
	orncc	%o4,	%i6,	%l4
	fmovrsne	%g7,	%f19,	%f9
	fnot2s	%f14,	%f4
	smul	%l0,	0x0658,	%g5
	fnot1s	%f19,	%f22
	fpadd16s	%f8,	%f31,	%f8
	ldx	[%l7 + 0x70],	%i0
	sth	%l3,	[%l7 + 0x5A]
	movrlez	%o5,	0x121,	%l2
	addcc	%i7,	%i5,	%i3
	sra	%o6,	0x1A,	%i4
	movre	%l5,	%g2,	%o1
	stb	%o2,	[%l7 + 0x39]
	fnand	%f28,	%f6,	%f28
	fmovrsne	%l1,	%f30,	%f16
	sllx	%g3,	%o0,	%l6
	edge16ln	%i1,	%g6,	%o3
	array32	%g4,	%g1,	%i2
	ldd	[%l7 + 0x38],	%f16
	edge16l	%o4,	%i6,	%l4
	lduh	[%l7 + 0x60],	%g7
	stx	%l0,	[%l7 + 0x08]
	fpack32	%f16,	%f12,	%f4
	save %o7, 0x1665, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub32	%f18,	%f10,	%f2
	fpackfix	%f26,	%f31
	subccc	%l3,	0x01E3,	%o5
	subc	%l2,	%g5,	%i5
	orcc	%i3,	0x133F,	%i7
	ldsw	[%l7 + 0x20],	%i4
	edge32ln	%l5,	%g2,	%o6
	movne	%xcc,	%o1,	%o2
	lduh	[%l7 + 0x50],	%g3
	alignaddr	%l1,	%o0,	%i1
	andncc	%l6,	%o3,	%g6
	fmul8sux16	%f0,	%f28,	%f30
	xnorcc	%g4,	0x1024,	%g1
	fmovrslz	%o4,	%f6,	%f23
	stb	%i2,	[%l7 + 0x4D]
	sethi	0x0308,	%i6
	movg	%xcc,	%l4,	%l0
	fcmps	%fcc2,	%f5,	%f20
	sra	%o7,	%g7,	%i0
	subcc	%l3,	0x0C83,	%o5
	addccc	%l2,	0x0488,	%g5
	std	%f8,	[%l7 + 0x10]
	fmovs	%f25,	%f4
	sdivcc	%i3,	0x1D8A,	%i5
	ldsh	[%l7 + 0x12],	%i7
	edge16	%i4,	%l5,	%g2
	movleu	%icc,	%o1,	%o2
	fmul8x16	%f18,	%f24,	%f4
	movle	%icc,	%o6,	%l1
	fmovrsgez	%g3,	%f9,	%f6
	andncc	%i1,	%l6,	%o3
	movn	%xcc,	%o0,	%g4
	orcc	%g1,	0x0B47,	%o4
	array16	%g6,	%i6,	%l4
	restore %l0, %o7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f22,	%f12,	%f2
	udiv	%i0,	0x0F2B,	%l3
	sllx	%g7,	%l2,	%g5
	fsrc2s	%f19,	%f31
	edge32n	%i3,	%i5,	%o5
	st	%f7,	[%l7 + 0x70]
	stx	%i7,	[%l7 + 0x48]
	edge8	%l5,	%g2,	%o1
	array16	%i4,	%o6,	%l1
	st	%f13,	[%l7 + 0x44]
	ldd	[%l7 + 0x40],	%f30
	st	%f26,	[%l7 + 0x18]
	fmovrdlz	%g3,	%f18,	%f22
	stb	%i1,	[%l7 + 0x5B]
	movcs	%icc,	%l6,	%o3
	and	%o2,	0x00C6,	%g4
	pdist	%f22,	%f18,	%f2
	srax	%g1,	0x18,	%o4
	movrgz	%o0,	0x2D2,	%g6
	sub	%i6,	0x0B22,	%l4
	or	%o7,	0x18C4,	%l0
	orncc	%i2,	%l3,	%g7
	fcmpd	%fcc0,	%f22,	%f16
	edge32n	%i0,	%l2,	%g5
	movg	%icc,	%i3,	%i5
	srlx	%o5,	%l5,	%g2
	or	%o1,	%i7,	%i4
	movrlez	%o6,	%l1,	%i1
	movne	%xcc,	%l6,	%o3
	alignaddr	%o2,	%g3,	%g4
	fsrc1s	%f21,	%f4
	fmovsneg	%icc,	%f26,	%f24
	ldd	[%l7 + 0x08],	%f26
	srlx	%o4,	0x1C,	%g1
	alignaddrl	%g6,	%i6,	%o0
	movrne	%o7,	%l4,	%l0
	fandnot2	%f6,	%f20,	%f0
	movpos	%icc,	%i2,	%g7
	array8	%i0,	%l3,	%l2
	movg	%xcc,	%i3,	%g5
	ldub	[%l7 + 0x6E],	%i5
	movl	%xcc,	%o5,	%l5
	fpadd32	%f22,	%f20,	%f6
	array32	%g2,	%o1,	%i7
	fmovde	%xcc,	%f31,	%f25
	fmovrde	%o6,	%f12,	%f8
	and	%l1,	0x153A,	%i1
	movcc	%icc,	%l6,	%i4
	edge32l	%o3,	%g3,	%g4
	umul	%o2,	%g1,	%o4
	fmovdcc	%xcc,	%f10,	%f14
	movcs	%xcc,	%i6,	%g6
	sethi	0x191B,	%o7
	fmovsleu	%icc,	%f20,	%f18
	edge8n	%o0,	%l0,	%i2
	fmovrslez	%g7,	%f12,	%f17
	addc	%i0,	0x168E,	%l4
	edge16l	%l2,	%i3,	%g5
	addc	%l3,	%i5,	%l5
	movgu	%icc,	%g2,	%o5
	movneg	%icc,	%i7,	%o1
	fandnot2	%f14,	%f10,	%f0
	fmovdg	%xcc,	%f8,	%f11
	pdist	%f20,	%f26,	%f4
	srlx	%l1,	%o6,	%i1
	subcc	%i4,	0x1D55,	%l6
	edge16n	%o3,	%g3,	%o2
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%g0
	andcc	%g4,	%o4,	%g6
	fmovse	%xcc,	%f12,	%f31
	ldd	[%l7 + 0x38],	%i6
	stx	%o7,	[%l7 + 0x48]
	save %l0, %i2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f0,	[%l7 + 0x38]
	fmovdpos	%xcc,	%f31,	%f7
	sll	%i0,	0x0C,	%o0
	smulcc	%l2,	0x0776,	%l4
	addc	%g5,	0x136E,	%i3
	xnorcc	%l3,	0x1FF1,	%l5
	fpadd32s	%f4,	%f16,	%f13
	movrlz	%g2,	%i5,	%o5
	fxor	%f20,	%f12,	%f18
	fmovse	%xcc,	%f25,	%f2
	stx	%i7,	[%l7 + 0x10]
	edge16l	%o1,	%l1,	%o6
	edge16l	%i4,	%i1,	%o3
	movre	%g3,	%l6,	%g1
	fxnor	%f30,	%f10,	%f16
	mulscc	%o2,	0x0072,	%o4
	stw	%g4,	[%l7 + 0x50]
	st	%f26,	[%l7 + 0x34]
	mova	%icc,	%i6,	%g6
	ldsb	[%l7 + 0x29],	%l0
	xnor	%i2,	%o7,	%i0
	std	%f10,	[%l7 + 0x60]
	fmovde	%icc,	%f16,	%f20
	fcmpeq16	%f12,	%f4,	%g7
	and	%l2,	0x1E03,	%o0
	ldd	[%l7 + 0x08],	%f0
	movrlz	%g5,	0x328,	%l4
	xorcc	%i3,	%l3,	%g2
	lduw	[%l7 + 0x58],	%i5
	subccc	%o5,	0x14E2,	%l5
	sll	%i7,	%o1,	%l1
	nop
	set	0x3E, %l6
	ldsh	[%l7 + %l6],	%i4
	stw	%o6,	[%l7 + 0x2C]
	sub	%o3,	0x0671,	%i1
	sir	0x1C57
	udiv	%l6,	0x0079,	%g1
	edge16ln	%g3,	%o4,	%o2
	sth	%g4,	[%l7 + 0x58]
	stx	%g6,	[%l7 + 0x48]
	array16	%i6,	%l0,	%i2
	array8	%o7,	%i0,	%g7
	fzero	%f0
	movne	%icc,	%o0,	%l2
	orcc	%l4,	0x0CC3,	%g5
	movl	%icc,	%l3,	%g2
	and	%i5,	0x1DD7,	%o5
	subccc	%l5,	0x0167,	%i3
	orn	%i7,	%o1,	%i4
	movvc	%xcc,	%o6,	%l1
	andncc	%o3,	%l6,	%g1
	edge16l	%g3,	%i1,	%o4
	movpos	%xcc,	%o2,	%g6
	andcc	%g4,	0x1FAA,	%i6
	and	%i2,	%o7,	%l0
	fmul8sux16	%f28,	%f26,	%f0
	srl	%g7,	0x15,	%o0
	stb	%l2,	[%l7 + 0x2A]
	array8	%i0,	%l4,	%g5
	movrlz	%g2,	%i5,	%l3
	sll	%l5,	0x0B,	%o5
	stw	%i7,	[%l7 + 0x6C]
	edge16	%i3,	%i4,	%o6
	movrgz	%l1,	%o1,	%o3
	fxors	%f31,	%f1,	%f27
	st	%f15,	[%l7 + 0x54]
	edge32n	%g1,	%g3,	%l6
	fcmpeq32	%f24,	%f18,	%i1
	andn	%o2,	%g6,	%o4
	fmovscc	%icc,	%f9,	%f5
	stw	%g4,	[%l7 + 0x60]
	movneg	%icc,	%i6,	%i2
	movcs	%xcc,	%l0,	%o7
	movrgz	%g7,	%o0,	%l2
	edge16	%i0,	%l4,	%g2
	fcmpeq16	%f8,	%f2,	%i5
	xorcc	%l3,	0x0ADB,	%l5
	ldsb	[%l7 + 0x75],	%o5
	movrlez	%g5,	%i7,	%i4
	sdivx	%i3,	0x0B74,	%l1
	fmovdl	%icc,	%f26,	%f14
	movg	%xcc,	%o6,	%o1
	edge32l	%o3,	%g1,	%g3
	sra	%l6,	%o2,	%g6
	srlx	%i1,	%g4,	%i6
	subc	%i2,	%l0,	%o7
	ld	[%l7 + 0x30],	%f8
	addccc	%g7,	%o4,	%o0
	srl	%i0,	0x04,	%l2
	fnors	%f26,	%f7,	%f2
	array16	%l4,	%i5,	%l3
	andncc	%g2,	%l5,	%g5
	ldd	[%l7 + 0x38],	%i6
	fcmpes	%fcc3,	%f12,	%f23
	movrgz	%o5,	%i3,	%l1
	xnor	%i4,	0x07F8,	%o1
	fcmpes	%fcc2,	%f17,	%f26
	movgu	%icc,	%o3,	%g1
	xnor	%o6,	%g3,	%l6
	and	%g6,	%o2,	%i1
	movleu	%xcc,	%g4,	%i6
	mova	%icc,	%l0,	%o7
	sir	0x1235
	edge16l	%i2,	%g7,	%o4
	ldub	[%l7 + 0x2D],	%o0
	xnorcc	%l2,	0x126B,	%i0
	andcc	%i5,	0x0566,	%l4
	add	%g2,	%l3,	%l5
	subc	%g5,	0x1EBB,	%i7
	smul	%o5,	0x0470,	%l1
	stx	%i4,	[%l7 + 0x30]
	and	%o1,	0x1F0B,	%i3
	addc	%g1,	0x0C72,	%o3
	movgu	%xcc,	%g3,	%o6
	ldsb	[%l7 + 0x4F],	%l6
	sra	%g6,	%i1,	%o2
	lduh	[%l7 + 0x46],	%i6
	subcc	%g4,	%o7,	%l0
	fone	%f2
	movgu	%xcc,	%g7,	%i2
	sth	%o4,	[%l7 + 0x10]
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	edge8l	%l4,	%g2,	%i5
	srlx	%l3,	%g5,	%i7
	fcmpes	%fcc3,	%f20,	%f14
	mulscc	%l5,	%l1,	%i4
	edge8	%o5,	%o1,	%g1
	fsrc1s	%f11,	%f16
	orn	%o3,	%i3,	%o6
	fmovsvs	%icc,	%f14,	%f23
	edge16	%l6,	%g6,	%g3
	fmovrdgez	%o2,	%f10,	%f18
	sllx	%i1,	0x0F,	%g4
	fmovdne	%xcc,	%f17,	%f0
	movpos	%xcc,	%o7,	%i6
	faligndata	%f2,	%f10,	%f4
	movvc	%xcc,	%l0,	%g7
	sth	%i2,	[%l7 + 0x70]
	movleu	%xcc,	%o4,	%o0
	movne	%xcc,	%i0,	%l4
	sth	%g2,	[%l7 + 0x32]
	movn	%icc,	%l2,	%l3
	fpsub16	%f6,	%f30,	%f6
	fmovdcs	%icc,	%f28,	%f29
	addc	%i5,	0x037A,	%i7
	edge32	%g5,	%l5,	%i4
	edge8n	%l1,	%o5,	%o1
	fcmpne16	%f0,	%f26,	%o3
	edge8l	%i3,	%g1,	%o6
	srax	%l6,	%g6,	%g3
	stw	%o2,	[%l7 + 0x7C]
	edge16l	%i1,	%g4,	%o7
	edge16ln	%l0,	%g7,	%i2
	movvc	%xcc,	%o4,	%o0
	xnor	%i0,	0x05BE,	%i6
	ldsb	[%l7 + 0x15],	%l4
	and	%l2,	0x1359,	%l3
	orncc	%g2,	%i7,	%g5
	save %i5, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o5,	0x3BD,	%i4
	andcc	%o3,	%i3,	%o1
	mulscc	%o6,	%l6,	%g1
	st	%f22,	[%l7 + 0x38]
	fcmps	%fcc2,	%f27,	%f31
	std	%f14,	[%l7 + 0x30]
	andcc	%g6,	%o2,	%g3
	movle	%xcc,	%g4,	%o7
	edge32	%i1,	%g7,	%i2
	sdiv	%l0,	0x0D04,	%o0
	fpackfix	%f2,	%f6
	fnot2s	%f27,	%f19
	addc	%o4,	%i0,	%i6
	edge32	%l4,	%l3,	%g2
	xnor	%i7,	%g5,	%i5
	andcc	%l5,	0x10B2,	%l1
	stx	%o5,	[%l7 + 0x20]
	ldsw	[%l7 + 0x1C],	%l2
	movrlez	%i4,	0x34E,	%i3
	edge32ln	%o3,	%o1,	%o6
	fmul8x16al	%f25,	%f19,	%f4
	edge32	%l6,	%g1,	%g6
	subccc	%o2,	0x06FA,	%g4
	movvc	%icc,	%g3,	%i1
	and	%o7,	0x0138,	%i2
	edge8n	%l0,	%o0,	%g7
	edge8	%o4,	%i0,	%i6
	ld	[%l7 + 0x58],	%f0
	movpos	%xcc,	%l4,	%g2
	smul	%i7,	%g5,	%l3
	fmovse	%icc,	%f21,	%f3
	fmovrdlz	%i5,	%f28,	%f12
	ldx	[%l7 + 0x20],	%l1
	sub	%o5,	0x1859,	%l5
	fmovse	%xcc,	%f19,	%f30
	for	%f20,	%f10,	%f14
	movre	%i4,	0x098,	%i3
	xnorcc	%o3,	%o1,	%l2
	edge16l	%l6,	%o6,	%g6
	stb	%g1,	[%l7 + 0x22]
	srax	%o2,	%g3,	%g4
	restore %o7, %i1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%l0,	%g7
	sra	%o4,	%o0,	%i0
	edge8n	%i6,	%g2,	%i7
	fmovdgu	%xcc,	%f16,	%f1
	fcmpes	%fcc2,	%f4,	%f27
	srax	%g5,	0x04,	%l3
	ldsh	[%l7 + 0x0A],	%i5
	movl	%xcc,	%l4,	%o5
	stb	%l5,	[%l7 + 0x59]
	andncc	%i4,	%l1,	%i3
	ldub	[%l7 + 0x41],	%o1
	fcmple32	%f0,	%f26,	%o3
	fmovdpos	%icc,	%f17,	%f4
	udiv	%l2,	0x0044,	%l6
	array32	%o6,	%g1,	%o2
	array32	%g3,	%g4,	%g6
	stw	%i1,	[%l7 + 0x7C]
	sethi	0x0CC5,	%i2
	movre	%l0,	%g7,	%o4
	xor	%o7,	%o0,	%i0
	orn	%g2,	0x0318,	%i7
	movrgz	%i6,	0x29F,	%g5
	andcc	%l3,	%l4,	%i5
	andn	%l5,	0x004B,	%i4
	edge8ln	%o5,	%l1,	%o1
	movre	%o3,	%l2,	%i3
	subcc	%l6,	0x18C2,	%o6
	movrlz	%g1,	0x02B,	%o2
	umul	%g4,	0x1CA8,	%g3
	movrlez	%g6,	%i1,	%l0
	fmovscs	%icc,	%f11,	%f16
	fpsub32	%f10,	%f12,	%f12
	movcs	%xcc,	%g7,	%o4
	addcc	%o7,	0x1F8C,	%i2
	fnor	%f4,	%f22,	%f26
	fsrc1	%f24,	%f24
	array8	%i0,	%g2,	%i7
	udiv	%o0,	0x1AE0,	%i6
	fcmpgt16	%f24,	%f26,	%l3
	fmul8x16au	%f13,	%f9,	%f26
	sra	%g5,	%l4,	%l5
	edge16l	%i5,	%i4,	%o5
	edge8ln	%o1,	%o3,	%l1
	stb	%l2,	[%l7 + 0x1E]
	bshuffle	%f0,	%f6,	%f10
	fcmpeq16	%f22,	%f22,	%l6
	movrgez	%i3,	0x14B,	%g1
	fmuld8ulx16	%f24,	%f24,	%f2
	add	%o2,	0x0756,	%g4
	fornot2s	%f24,	%f13,	%f28
	movpos	%xcc,	%g3,	%o6
	umulcc	%g6,	0x199E,	%i1
	ldx	[%l7 + 0x18],	%g7
	subc	%l0,	0x04DB,	%o4
	or	%i2,	%i0,	%g2
	fnot1s	%f8,	%f22
	andcc	%o7,	0x196B,	%i7
	stx	%o0,	[%l7 + 0x18]
	ldd	[%l7 + 0x20],	%i6
	edge32ln	%l3,	%l4,	%g5
	popc	%l5,	%i5
	xor	%i4,	0x05EB,	%o1
	sll	%o3,	0x10,	%l1
	fcmpes	%fcc3,	%f18,	%f23
	fcmped	%fcc1,	%f6,	%f2
	st	%f14,	[%l7 + 0x30]
	fmovsg	%xcc,	%f8,	%f21
	save %l2, 0x0254, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i3,	0x1B5E,	%g1
	st	%f5,	[%l7 + 0x6C]
	movcs	%icc,	%l6,	%o2
	sra	%g3,	%g4,	%o6
	xnor	%g6,	%i1,	%l0
	fmovdneg	%xcc,	%f23,	%f14
	fmovdvs	%icc,	%f25,	%f11
	edge32	%g7,	%o4,	%i0
	ld	[%l7 + 0x70],	%f4
	movrgz	%i2,	%o7,	%g2
	movgu	%xcc,	%i7,	%i6
	movg	%xcc,	%l3,	%o0
	addccc	%l4,	%g5,	%i5
	movrlz	%i4,	%o1,	%o3
	orncc	%l1,	%l5,	%l2
	umul	%o5,	%i3,	%l6
	add	%o2,	%g3,	%g1
	movle	%icc,	%o6,	%g6
	ldsw	[%l7 + 0x14],	%g4
	xnor	%l0,	0x19E8,	%g7
	ldsh	[%l7 + 0x26],	%i1
	move	%icc,	%i0,	%i2
	orcc	%o4,	0x0514,	%g2
	fones	%f1
	mulx	%i7,	%i6,	%o7
	srax	%l3,	0x00,	%o0
	edge32ln	%g5,	%i5,	%i4
	movge	%icc,	%l4,	%o3
	sethi	0x13D6,	%l1
	sth	%l5,	[%l7 + 0x14]
	orcc	%o1,	%o5,	%l2
	edge16	%l6,	%i3,	%o2
	subc	%g3,	0x0B8C,	%o6
	add	%g6,	0x1150,	%g4
	movle	%icc,	%g1,	%g7
	ldub	[%l7 + 0x15],	%i1
	movrne	%i0,	0x25E,	%l0
	udivx	%i2,	0x0E00,	%o4
	std	%f24,	[%l7 + 0x38]
	fornot2	%f8,	%f2,	%f20
	fsrc1	%f30,	%f20
	mova	%icc,	%i7,	%i6
	fmovdgu	%icc,	%f13,	%f27
	fmovrse	%o7,	%f20,	%f16
	ld	[%l7 + 0x60],	%f17
	sll	%g2,	0x07,	%l3
	xorcc	%o0,	%i5,	%g5
	edge32l	%l4,	%i4,	%o3
	edge16ln	%l5,	%l1,	%o5
	fmovsa	%icc,	%f23,	%f31
	ldub	[%l7 + 0x0D],	%l2
	movvc	%xcc,	%l6,	%o1
	fmovdn	%icc,	%f31,	%f25
	ldx	[%l7 + 0x18],	%i3
	movle	%xcc,	%o2,	%o6
	mova	%icc,	%g6,	%g3
	fsrc1s	%f26,	%f16
	srax	%g1,	0x04,	%g7
	xnorcc	%i1,	0x12A1,	%i0
	fmovsn	%icc,	%f0,	%f8
	edge16	%g4,	%i2,	%l0
	movgu	%icc,	%i7,	%i6
	edge8	%o7,	%o4,	%g2
	ld	[%l7 + 0x1C],	%f28
	edge8ln	%l3,	%i5,	%o0
	fones	%f30
	xnorcc	%l4,	0x1B2D,	%i4
	ldx	[%l7 + 0x20],	%g5
	movre	%l5,	0x11B,	%l1
	fpadd16s	%f7,	%f7,	%f19
	ldsb	[%l7 + 0x25],	%o3
	fzero	%f12
	addc	%o5,	0x0B1A,	%l6
	alignaddr	%l2,	%i3,	%o1
	sub	%o6,	0x034B,	%g6
	lduw	[%l7 + 0x68],	%g3
	fandnot2	%f30,	%f22,	%f8
	lduh	[%l7 + 0x36],	%g1
	edge32ln	%g7,	%i1,	%o2
	edge16n	%g4,	%i2,	%i0
	edge16ln	%i7,	%l0,	%o7
	lduw	[%l7 + 0x14],	%i6
	fmul8x16	%f30,	%f30,	%f12
	fcmpes	%fcc1,	%f11,	%f21
	movge	%xcc,	%g2,	%l3
	fmovs	%f29,	%f30
	movle	%icc,	%o4,	%i5
	nop
	set	0x5C, %o0
	lduh	[%l7 + %o0],	%o0
	lduh	[%l7 + 0x66],	%l4
	subcc	%g5,	%i4,	%l5
	edge8n	%o3,	%o5,	%l1
	subccc	%l6,	%l2,	%i3
	edge8	%o6,	%o1,	%g3
	edge16	%g1,	%g6,	%g7
	movl	%icc,	%o2,	%i1
	movleu	%icc,	%i2,	%i0
	edge16l	%g4,	%l0,	%o7
	orncc	%i7,	0x1D3E,	%i6
	lduw	[%l7 + 0x5C],	%g2
	andncc	%l3,	%i5,	%o4
	sth	%l4,	[%l7 + 0x0A]
	orncc	%o0,	0x00A5,	%g5
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	fmovrslz	%i4,	%f3,	%f22
	movrlz	%o5,	%l1,	%l2
	fmovdn	%icc,	%f20,	%f0
	movvc	%xcc,	%i3,	%o6
	ldx	[%l7 + 0x70],	%l6
	andncc	%o1,	%g3,	%g1
	movrlez	%g7,	%g6,	%i1
	subcc	%o2,	%i0,	%g4
	smul	%i2,	%o7,	%l0
	ldsh	[%l7 + 0x34],	%i7
	array8	%i6,	%g2,	%l3
	movne	%xcc,	%o4,	%i5
	sdivcc	%l4,	0x003B,	%o0
	edge32ln	%g5,	%o3,	%i4
	xor	%l5,	0x1FAE,	%o5
	edge16ln	%l1,	%i3,	%o6
	movgu	%icc,	%l2,	%o1
	fmovrsne	%g3,	%f0,	%f7
	fand	%f0,	%f8,	%f8
	fcmped	%fcc0,	%f2,	%f10
	movvs	%xcc,	%l6,	%g7
	lduw	[%l7 + 0x20],	%g1
	fones	%f18
	array16	%i1,	%g6,	%i0
	stx	%g4,	[%l7 + 0x10]
	umulcc	%o2,	0x0876,	%o7
	stx	%i2,	[%l7 + 0x60]
	fxor	%f12,	%f24,	%f24
	umul	%i7,	0x1BA9,	%l0
	udivcc	%i6,	0x17EA,	%g2
	edge32l	%o4,	%i5,	%l4
	array32	%o0,	%g5,	%l3
	fmovdvs	%xcc,	%f2,	%f23
	edge8ln	%i4,	%o3,	%l5
	subc	%o5,	0x1616,	%i3
	movle	%icc,	%l1,	%l2
	udiv	%o6,	0x06F0,	%o1
	movne	%xcc,	%l6,	%g7
	ldd	[%l7 + 0x78],	%g0
	mulx	%g3,	%g6,	%i1
	restore %i0, 0x1DFF, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g4,	%i2,	%o7
	movneg	%xcc,	%l0,	%i6
	ld	[%l7 + 0x54],	%f9
	orn	%i7,	%g2,	%o4
	array8	%l4,	%o0,	%i5
	nop
	set	0x54, %g1
	stw	%g5,	[%l7 + %g1]
	mulx	%l3,	%i4,	%l5
	fmul8ulx16	%f2,	%f8,	%f0
	array8	%o5,	%i3,	%l1
	andcc	%o3,	%o6,	%l2
	edge8	%o1,	%g7,	%g1
	srlx	%g3,	0x09,	%l6
	fmovsleu	%xcc,	%f23,	%f6
	fpmerge	%f9,	%f2,	%f30
	stw	%g6,	[%l7 + 0x28]
	alignaddrl	%i0,	%o2,	%i1
	fmul8x16	%f31,	%f26,	%f28
	movrgz	%i2,	%g4,	%o7
	movrlz	%i6,	%i7,	%g2
	fnands	%f22,	%f2,	%f6
	movn	%icc,	%l0,	%l4
	movle	%xcc,	%o0,	%o4
	stw	%i5,	[%l7 + 0x0C]
	movrlez	%g5,	%l3,	%i4
	movge	%xcc,	%l5,	%i3
	mulx	%l1,	%o5,	%o3
	mulx	%o6,	0x1E1F,	%l2
	array16	%o1,	%g7,	%g1
	ldd	[%l7 + 0x30],	%g2
	lduh	[%l7 + 0x68],	%g6
	andcc	%l6,	0x1DDF,	%i0
	srax	%i1,	0x05,	%o2
	movgu	%icc,	%i2,	%o7
	fmovs	%f17,	%f22
	movcs	%icc,	%g4,	%i6
	and	%g2,	0x0D7B,	%i7
	addccc	%l0,	0x1D82,	%o0
	movrgz	%o4,	%l4,	%g5
	edge8	%i5,	%i4,	%l3
	save %i3, 0x13E4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc0,	%f22,	%f14
	edge16ln	%l5,	%o3,	%o6
	movg	%xcc,	%o5,	%o1
	andn	%g7,	%l2,	%g3
	movleu	%xcc,	%g1,	%l6
	movpos	%xcc,	%g6,	%i1
	edge8l	%i0,	%i2,	%o2
	fsrc2s	%f28,	%f1
	ld	[%l7 + 0x38],	%f0
	lduh	[%l7 + 0x64],	%g4
	edge16ln	%i6,	%o7,	%i7
	ld	[%l7 + 0x64],	%f7
	add	%g2,	%l0,	%o0
	orn	%l4,	0x16D0,	%g5
	orcc	%i5,	%o4,	%i4
	ldsh	[%l7 + 0x62],	%i3
	fmovrdlz	%l1,	%f16,	%f30
	add	%l5,	0x1FC3,	%o3
	edge32l	%o6,	%l3,	%o5
	sethi	0x161D,	%g7
	array16	%l2,	%g3,	%o1
	fmovdge	%xcc,	%f28,	%f27
	ldsb	[%l7 + 0x5A],	%g1
	fcmple16	%f26,	%f10,	%g6
	fmovrdne	%i1,	%f8,	%f24
	fpadd16	%f26,	%f18,	%f30
	movvc	%icc,	%i0,	%l6
	xnorcc	%o2,	0x1112,	%i2
	xnorcc	%i6,	0x07A6,	%o7
	fands	%f24,	%f26,	%f13
	array8	%i7,	%g4,	%g2
	udivcc	%l0,	0x0CF1,	%o0
	sdiv	%l4,	0x06AF,	%g5
	subc	%i5,	0x021D,	%i4
	movle	%xcc,	%i3,	%l1
	fcmpd	%fcc1,	%f16,	%f8
	xor	%o4,	%l5,	%o3
	orncc	%l3,	%o5,	%g7
	ldsb	[%l7 + 0x15],	%l2
	subc	%o6,	%o1,	%g1
	subccc	%g3,	0x15B0,	%i1
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	movl	%icc,	%l6,	%i2
	fnor	%f30,	%f26,	%f20
	xor	%i6,	%i7,	%g4
	edge8	%g2,	%l0,	%o7
	xnorcc	%o0,	%g5,	%i5
	movge	%xcc,	%i4,	%l4
	lduw	[%l7 + 0x3C],	%l1
	fand	%f16,	%f22,	%f22
	addccc	%o4,	0x139A,	%l5
	fcmpd	%fcc3,	%f26,	%f18
	edge32ln	%o3,	%i3,	%o5
	addcc	%g7,	0x1BF6,	%l3
	ldsw	[%l7 + 0x3C],	%l2
	fpsub32	%f14,	%f12,	%f28
	movrgez	%o1,	%g1,	%o6
	addccc	%g3,	%i0,	%g6
	movrlez	%o2,	%l6,	%i1
	fmovdne	%xcc,	%f22,	%f13
	save %i6, 0x14E8, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i2,	0x00FC,	%g4
	movne	%xcc,	%g2,	%l0
	fnors	%f23,	%f6,	%f9
	sdiv	%o7,	0x0CFA,	%o0
	addcc	%i5,	%i4,	%g5
	edge32n	%l4,	%l1,	%o4
	fmovsne	%icc,	%f12,	%f3
	movvc	%xcc,	%l5,	%o3
	movneg	%xcc,	%i3,	%o5
	edge16n	%l3,	%l2,	%o1
	array16	%g1,	%o6,	%g7
	edge16n	%i0,	%g6,	%g3
	mova	%xcc,	%l6,	%o2
	sdivx	%i1,	0x18A4,	%i7
	movgu	%icc,	%i6,	%g4
	movcs	%icc,	%g2,	%l0
	fmovsleu	%xcc,	%f23,	%f6
	array16	%o7,	%i2,	%i5
	fornot2s	%f24,	%f6,	%f7
	umulcc	%o0,	%i4,	%g5
	andncc	%l4,	%o4,	%l1
	movrgez	%o3,	%i3,	%l5
	array16	%o5,	%l3,	%l2
	fcmpgt32	%f4,	%f28,	%g1
	restore %o1, %o6, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%g7,	%g6
	fandnot2	%f6,	%f10,	%f4
	edge16	%g3,	%o2,	%i1
	subccc	%i7,	0x0EEE,	%i6
	edge32n	%l6,	%g2,	%l0
	udivcc	%o7,	0x06A0,	%i2
	fpack32	%f24,	%f22,	%f22
	movgu	%xcc,	%g4,	%i5
	subc	%i4,	%g5,	%l4
	edge16ln	%o4,	%l1,	%o0
	movre	%o3,	0x24E,	%l5
	ldx	[%l7 + 0x10],	%o5
	stx	%i3,	[%l7 + 0x28]
	xor	%l3,	0x0A38,	%g1
	sdivcc	%o1,	0x05C1,	%o6
	fmovsneg	%xcc,	%f26,	%f24
	fmovsle	%xcc,	%f16,	%f11
	umul	%l2,	0x11BA,	%i0
	movne	%icc,	%g6,	%g7
	smulcc	%g3,	0x1823,	%i1
	save %o2, %i6, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l6,	%l0,	%o7
	ldub	[%l7 + 0x48],	%i2
	movrlez	%g2,	0x2A4,	%g4
	movne	%xcc,	%i5,	%i4
	fcmpne16	%f20,	%f22,	%l4
	movvs	%xcc,	%o4,	%g5
	subc	%o0,	%o3,	%l5
	udiv	%o5,	0x1C7E,	%i3
	fmovsa	%xcc,	%f24,	%f24
	fcmps	%fcc0,	%f3,	%f14
	sll	%l3,	0x0E,	%g1
	addcc	%l1,	%o6,	%l2
	edge16	%i0,	%g6,	%g7
	ldd	[%l7 + 0x38],	%f6
	sdiv	%o1,	0x0876,	%i1
	ldd	[%l7 + 0x58],	%f8
	edge32ln	%o2,	%g3,	%i7
	umulcc	%l6,	0x16F6,	%l0
	fornot2s	%f20,	%f21,	%f9
	mulx	%o7,	%i6,	%g2
	fcmpgt32	%f2,	%f30,	%i2
	addcc	%i5,	%g4,	%i4
	edge8l	%o4,	%l4,	%o0
	ldub	[%l7 + 0x47],	%g5
	edge32	%o3,	%o5,	%i3
	ldub	[%l7 + 0x59],	%l5
	fmovsa	%icc,	%f4,	%f1
	st	%f17,	[%l7 + 0x44]
	sllx	%g1,	%l1,	%l3
	sub	%o6,	0x175E,	%i0
	fpsub32	%f2,	%f2,	%f20
	lduh	[%l7 + 0x30],	%l2
	edge16	%g7,	%g6,	%o1
	fmovsleu	%xcc,	%f15,	%f26
	ldd	[%l7 + 0x08],	%i0
	popc	%g3,	%o2
	smulcc	%i7,	%l6,	%l0
	smulcc	%o7,	0x0185,	%g2
	fxors	%f3,	%f4,	%f7
	sll	%i2,	0x16,	%i5
	fmovrsgz	%i6,	%f9,	%f2
	fmovd	%f6,	%f22
	fxnor	%f10,	%f18,	%f8
	fmovdg	%icc,	%f8,	%f4
	addc	%g4,	0x0A10,	%i4
	fmovdg	%xcc,	%f4,	%f4
	movg	%xcc,	%o4,	%l4
	array16	%o0,	%g5,	%o5
	array32	%o3,	%i3,	%g1
	fornot2s	%f25,	%f14,	%f3
	ldsh	[%l7 + 0x78],	%l5
	movneg	%xcc,	%l1,	%l3
	xor	%o6,	%i0,	%g7
	movgu	%xcc,	%g6,	%l2
	alignaddr	%i1,	%g3,	%o1
	edge32l	%o2,	%i7,	%l0
	movg	%xcc,	%l6,	%o7
	sra	%i2,	%i5,	%i6
	fand	%f14,	%f12,	%f8
	movrlez	%g4,	%g2,	%i4
	sdiv	%o4,	0x1055,	%o0
	movvc	%icc,	%l4,	%o5
	smulcc	%g5,	0x1068,	%i3
	or	%o3,	%g1,	%l1
	orncc	%l5,	%l3,	%o6
	movpos	%icc,	%i0,	%g6
	ldsh	[%l7 + 0x48],	%l2
	ld	[%l7 + 0x58],	%f10
	std	%f10,	[%l7 + 0x38]
	srax	%g7,	0x0A,	%i1
	mulscc	%g3,	0x01A9,	%o2
	movcc	%xcc,	%i7,	%o1
	xnorcc	%l6,	0x1C27,	%o7
	movneg	%icc,	%i2,	%l0
	array8	%i5,	%g4,	%g2
	std	%f24,	[%l7 + 0x08]
	fors	%f23,	%f6,	%f20
	fmul8x16au	%f6,	%f29,	%f26
	ldd	[%l7 + 0x60],	%i4
	movle	%icc,	%i6,	%o0
	sdivx	%o4,	0x042E,	%o5
	movg	%icc,	%l4,	%g5
	ldub	[%l7 + 0x2A],	%i3
	fornot2	%f22,	%f18,	%f14
	lduw	[%l7 + 0x28],	%o3
	array16	%g1,	%l1,	%l3
	movge	%xcc,	%o6,	%l5
	andn	%i0,	0x08E9,	%l2
	fnegd	%f26,	%f12
	fxor	%f4,	%f22,	%f16
	sethi	0x0BE7,	%g6
	movn	%icc,	%g7,	%g3
	ldsh	[%l7 + 0x2E],	%o2
	orncc	%i7,	0x1F99,	%o1
	fmovrdlez	%i1,	%f20,	%f20
	sll	%o7,	0x13,	%i2
	mova	%xcc,	%l6,	%i5
	fmovsne	%icc,	%f7,	%f25
	sethi	0x1073,	%l0
	fcmple16	%f24,	%f12,	%g4
	edge16	%i4,	%i6,	%g2
	popc	0x0DB7,	%o0
	movge	%xcc,	%o4,	%l4
	fmovdvc	%icc,	%f3,	%f28
	movrgez	%g5,	0x371,	%o5
	fmovsle	%xcc,	%f10,	%f13
	smulcc	%o3,	%i3,	%l1
	fmovsa	%xcc,	%f1,	%f22
	sllx	%g1,	%o6,	%l5
	umulcc	%l3,	0x0DBD,	%l2
	ldub	[%l7 + 0x29],	%i0
	movneg	%xcc,	%g7,	%g3
	sir	0x0F09
	movge	%icc,	%o2,	%g6
	orn	%o1,	%i7,	%o7
	lduh	[%l7 + 0x26],	%i1
	stw	%l6,	[%l7 + 0x14]
	array8	%i5,	%l0,	%g4
	andn	%i2,	0x1FA7,	%i4
	ldsb	[%l7 + 0x6E],	%g2
	stb	%i6,	[%l7 + 0x71]
	mova	%icc,	%o0,	%o4
	movleu	%icc,	%l4,	%g5
	edge16	%o5,	%i3,	%l1
	movle	%xcc,	%o3,	%o6
	smulcc	%g1,	0x0160,	%l5
	addcc	%l3,	0x1047,	%l2
	fmovrsgez	%i0,	%f25,	%f0
	fxors	%f27,	%f12,	%f2
	array32	%g3,	%o2,	%g6
	fmovsle	%xcc,	%f19,	%f7
	ld	[%l7 + 0x40],	%f16
	ldub	[%l7 + 0x11],	%g7
	sir	0x12D7
	alignaddrl	%i7,	%o7,	%i1
	fnand	%f16,	%f28,	%f22
	edge32ln	%o1,	%i5,	%l6
	and	%l0,	%g4,	%i4
	ldd	[%l7 + 0x10],	%f14
	smul	%i2,	%g2,	%i6
	movrlz	%o4,	0x218,	%l4
	udivcc	%g5,	0x1864,	%o5
	movleu	%xcc,	%i3,	%l1
	movcc	%icc,	%o3,	%o6
	fmul8x16au	%f26,	%f20,	%f2
	movn	%icc,	%o0,	%g1
	ldsb	[%l7 + 0x31],	%l5
	ldsb	[%l7 + 0x59],	%l2
	fpadd32	%f30,	%f20,	%f0
	alignaddr	%l3,	%i0,	%o2
	edge16	%g6,	%g3,	%g7
	fmovrdlez	%o7,	%f28,	%f2
	fors	%f19,	%f11,	%f16
	sdivcc	%i1,	0x1E94,	%o1
	movle	%icc,	%i7,	%i5
	fornot1s	%f13,	%f11,	%f30
	movne	%icc,	%l6,	%g4
	popc	%l0,	%i4
	fcmple16	%f10,	%f30,	%g2
	fmovrdne	%i2,	%f30,	%f4
	ldub	[%l7 + 0x5E],	%o4
	movpos	%icc,	%i6,	%l4
	udiv	%g5,	0x0ACC,	%i3
	ldd	[%l7 + 0x50],	%f20
	movvs	%icc,	%l1,	%o5
	ldsh	[%l7 + 0x7E],	%o3
	edge16ln	%o6,	%g1,	%o0
	fnot2	%f26,	%f8
	fxors	%f2,	%f4,	%f28
	movge	%xcc,	%l5,	%l3
	fone	%f0
	mulx	%l2,	0x062A,	%o2
	fmovrdgz	%g6,	%f18,	%f2
	popc	%i0,	%g7
	fmovrdlz	%g3,	%f10,	%f6
	edge32l	%i1,	%o1,	%i7
	fcmpeq16	%f14,	%f0,	%i5
	and	%l6,	%o7,	%l0
	stx	%i4,	[%l7 + 0x70]
	fmovdge	%xcc,	%f10,	%f14
	fmovdle	%icc,	%f10,	%f2
	srlx	%g2,	%i2,	%g4
	edge8l	%o4,	%i6,	%l4
	movre	%i3,	0x10E,	%g5
	sub	%o5,	0x1574,	%l1
	fpmerge	%f6,	%f0,	%f8
	ldsw	[%l7 + 0x30],	%o3
	movvs	%icc,	%o6,	%o0
	udivcc	%l5,	0x1037,	%l3
	movgu	%icc,	%g1,	%o2
	array32	%l2,	%g6,	%i0
	xnorcc	%g7,	0x1A04,	%i1
	alignaddrl	%g3,	%o1,	%i5
	movcc	%xcc,	%i7,	%l6
	andncc	%l0,	%o7,	%i4
	alignaddrl	%i2,	%g4,	%g2
	movrlz	%o4,	%i6,	%l4
	umulcc	%i3,	%g5,	%l1
	edge16	%o3,	%o5,	%o0
	save %l5, 0x0E27, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsgu	%icc,	%f1,	%f26
	edge32	%o6,	%o2,	%l2
	addcc	%g1,	0x009B,	%i0
	st	%f26,	[%l7 + 0x30]
	move	%icc,	%g7,	%i1
	movvc	%xcc,	%g3,	%g6
	mova	%icc,	%i5,	%o1
	subccc	%l6,	%i7,	%l0
	movvs	%icc,	%o7,	%i2
	edge8l	%i4,	%g2,	%o4
	movrgz	%i6,	0x2C0,	%l4
	lduh	[%l7 + 0x7E],	%i3
	sethi	0x0A70,	%g5
	movvs	%xcc,	%g4,	%o3
	movle	%xcc,	%l1,	%o0
	fpsub16	%f30,	%f30,	%f18
	nop
	set	0x40, %g4
	ldx	[%l7 + %g4],	%o5
	sra	%l5,	%o6,	%l3
	addc	%l2,	%g1,	%i0
	ldsh	[%l7 + 0x5A],	%o2
	mulscc	%i1,	0x11E6,	%g7
	subcc	%g3,	%g6,	%i5
	ldsh	[%l7 + 0x24],	%o1
	edge32n	%i7,	%l6,	%o7
	movcs	%xcc,	%i2,	%i4
	smul	%g2,	%l0,	%o4
	fcmple32	%f28,	%f14,	%l4
	edge16l	%i3,	%i6,	%g4
	umul	%g5,	0x09F4,	%l1
	fmovrdne	%o0,	%f30,	%f26
	sub	%o3,	%l5,	%o6
	xnor	%l3,	0x162D,	%o5
	edge16ln	%g1,	%i0,	%o2
	fxnor	%f30,	%f8,	%f0
	subc	%i1,	%l2,	%g7
	edge8ln	%g6,	%i5,	%o1
	sdivcc	%g3,	0x0BEE,	%i7
	sdiv	%o7,	0x1F59,	%l6
	smulcc	%i2,	0x1399,	%i4
	fmovdpos	%xcc,	%f16,	%f3
	edge32n	%l0,	%o4,	%g2
	udiv	%l4,	0x0B77,	%i6
	xnorcc	%g4,	%i3,	%l1
	edge16ln	%g5,	%o0,	%l5
	lduw	[%l7 + 0x70],	%o6
	lduw	[%l7 + 0x14],	%l3
	array16	%o3,	%o5,	%i0
	move	%xcc,	%g1,	%o2
	srax	%i1,	%g7,	%l2
	movvs	%icc,	%i5,	%g6
	fmul8ulx16	%f2,	%f16,	%f2
	movneg	%icc,	%g3,	%i7
	ldsb	[%l7 + 0x55],	%o1
	movne	%icc,	%o7,	%i2
	add	%i4,	%l0,	%l6
	srax	%o4,	%g2,	%l4
	fcmple16	%f10,	%f4,	%i6
	edge8n	%g4,	%l1,	%i3
	fandnot1s	%f4,	%f26,	%f7
	smulcc	%g5,	0x1B23,	%o0
	fandnot2s	%f24,	%f4,	%f24
	sll	%l5,	%o6,	%l3
	array8	%o3,	%o5,	%i0
	edge16n	%o2,	%g1,	%i1
	xor	%g7,	0x0E29,	%i5
	fmovrslez	%g6,	%f23,	%f21
	sllx	%l2,	%i7,	%o1
	fzero	%f22
	fmovrse	%o7,	%f15,	%f0
	fpadd16s	%f15,	%f18,	%f4
	lduh	[%l7 + 0x40],	%g3
	ldsh	[%l7 + 0x42],	%i2
	udivcc	%i4,	0x00B4,	%l6
	ld	[%l7 + 0x58],	%f1
	ldsh	[%l7 + 0x76],	%o4
	alignaddrl	%l0,	%l4,	%g2
	ldsh	[%l7 + 0x28],	%i6
	xnorcc	%g4,	0x147A,	%i3
	orcc	%l1,	%o0,	%l5
	fmovsg	%xcc,	%f1,	%f12
	movvc	%xcc,	%o6,	%g5
	nop
	set	0x0C, %l2
	stw	%l3,	[%l7 + %l2]
	movrlez	%o5,	0x12D,	%i0
	mulscc	%o2,	0x1202,	%o3
	fnot1s	%f4,	%f29
	udivcc	%i1,	0x1713,	%g1
	subcc	%i5,	%g6,	%g7
	fmovdleu	%icc,	%f2,	%f4
	ldx	[%l7 + 0x10],	%i7
	or	%o1,	0x00D5,	%l2
	fmovrdlz	%o7,	%f8,	%f12
	edge32n	%i2,	%g3,	%i4
	andcc	%o4,	0x0021,	%l6
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	addcc	%i6,	%g4,	%g2
	ldsb	[%l7 + 0x5C],	%i3
	addc	%o0,	%l5,	%l1
	srax	%o6,	0x00,	%g5
	fmovsneg	%icc,	%f19,	%f17
	movle	%icc,	%o5,	%l3
	ldd	[%l7 + 0x78],	%i0
	ldub	[%l7 + 0x29],	%o3
	fornot2s	%f4,	%f26,	%f21
	sub	%o2,	%g1,	%i5
	ldub	[%l7 + 0x30],	%g6
	alignaddr	%i1,	%g7,	%o1
	fmovdcs	%icc,	%f23,	%f3
	sllx	%l2,	%o7,	%i7
	mova	%icc,	%g3,	%i2
	and	%i4,	%o4,	%l0
	udiv	%l6,	0x077D,	%i6
	popc	%g4,	%l4
	edge32n	%g2,	%o0,	%i3
	movleu	%icc,	%l1,	%o6
	popc	%l5,	%o5
	edge16ln	%l3,	%i0,	%g5
	st	%f25,	[%l7 + 0x20]
	stb	%o2,	[%l7 + 0x5E]
	fmovdge	%xcc,	%f4,	%f26
	std	%f24,	[%l7 + 0x70]
	umul	%g1,	0x179B,	%i5
	addc	%o3,	0x00C0,	%g6
	smulcc	%g7,	%o1,	%i1
	movrne	%o7,	0x39B,	%l2
	udivx	%i7,	0x1B36,	%i2
	edge32	%i4,	%o4,	%l0
	stw	%l6,	[%l7 + 0x70]
	edge32	%i6,	%g3,	%l4
	movn	%xcc,	%g4,	%o0
	fmovrdlz	%i3,	%f6,	%f4
	fmovscs	%xcc,	%f2,	%f10
	fmovsle	%xcc,	%f20,	%f19
	fexpand	%f17,	%f6
	alignaddrl	%l1,	%o6,	%g2
	ldx	[%l7 + 0x60],	%o5
	mova	%xcc,	%l5,	%i0
	sra	%l3,	%o2,	%g5
	andn	%g1,	%i5,	%o3
	sdiv	%g6,	0x00A1,	%o1
	fandnot2s	%f12,	%f3,	%f22
	movn	%icc,	%g7,	%i1
	fmovsl	%icc,	%f7,	%f22
	fnand	%f14,	%f4,	%f20
	fsrc2	%f30,	%f16
	fmovdl	%xcc,	%f23,	%f18
	ldsh	[%l7 + 0x4E],	%o7
	fornot1	%f14,	%f24,	%f2
	fmovsne	%icc,	%f10,	%f0
	fmovs	%f1,	%f6
	ldx	[%l7 + 0x68],	%i7
	fmovdne	%icc,	%f18,	%f18
	orncc	%l2,	0x0C99,	%i4
	movne	%icc,	%o4,	%i2
	fsrc1s	%f13,	%f18
	xor	%l6,	0x108B,	%i6
	movleu	%xcc,	%g3,	%l0
	or	%g4,	0x0979,	%l4
	sdivx	%o0,	0x1ADE,	%l1
	fnot2s	%f21,	%f16
	lduw	[%l7 + 0x68],	%o6
	std	%f24,	[%l7 + 0x58]
	movleu	%icc,	%g2,	%i3
	movrne	%o5,	0x2FF,	%i0
	fcmpeq16	%f30,	%f30,	%l3
	sdivx	%o2,	0x1B9E,	%g5
	andncc	%g1,	%i5,	%l5
	fmul8x16au	%f17,	%f4,	%f20
	srlx	%o3,	0x12,	%o1
	movrgz	%g7,	0x3C6,	%g6
	edge8n	%i1,	%o7,	%l2
	ldsb	[%l7 + 0x73],	%i7
	ldd	[%l7 + 0x68],	%o4
	fmovdleu	%icc,	%f20,	%f25
	array16	%i4,	%i2,	%l6
	umul	%g3,	%i6,	%g4
	ldub	[%l7 + 0x40],	%l0
	ldsh	[%l7 + 0x74],	%l4
	mulx	%l1,	0x08E6,	%o6
	sth	%o0,	[%l7 + 0x1C]
	edge16l	%g2,	%i3,	%o5
	alignaddr	%i0,	%l3,	%g5
	smul	%o2,	0x0EF2,	%g1
	udivx	%i5,	0x0AEB,	%l5
	edge16	%o3,	%o1,	%g7
	fmovdcs	%xcc,	%f12,	%f6
	for	%f28,	%f0,	%f30
	ldub	[%l7 + 0x25],	%g6
	addc	%o7,	0x13EC,	%l2
	movcs	%icc,	%i7,	%i1
	movneg	%icc,	%i4,	%i2
	edge8	%l6,	%o4,	%g3
	movrgz	%i6,	0x047,	%l0
	ld	[%l7 + 0x14],	%f10
	movvs	%icc,	%g4,	%l4
	edge32ln	%o6,	%l1,	%o0
	fmovsn	%icc,	%f26,	%f7
	andcc	%g2,	%i3,	%o5
	subcc	%l3,	%i0,	%o2
	fmovsneg	%icc,	%f2,	%f5
	movrlz	%g5,	0x1A8,	%i5
	fmovscc	%xcc,	%f30,	%f15
	save %l5, 0x0FAC, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x1D],	%o1
	movge	%icc,	%g1,	%g7
	fandnot1	%f18,	%f10,	%f6
	add	%g6,	%l2,	%o7
	mulscc	%i1,	0x0203,	%i7
	movrlz	%i2,	%l6,	%o4
	fmovrdlez	%g3,	%f20,	%f6
	movn	%xcc,	%i4,	%l0
	fmuld8ulx16	%f19,	%f6,	%f10
	fmovdne	%xcc,	%f15,	%f29
	mova	%xcc,	%i6,	%g4
	movrlez	%l4,	0x197,	%l1
	fornot1s	%f13,	%f20,	%f13
	restore %o6, 0x0B40, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i3,	0x1186,	%o5
	subccc	%l3,	%i0,	%o0
	nop
	set	0x58, %o2
	stx	%o2,	[%l7 + %o2]
	movcc	%xcc,	%i5,	%g5
	sethi	0x10E5,	%l5
	udivcc	%o3,	0x0BEF,	%g1
	stx	%o1,	[%l7 + 0x18]
	alignaddr	%g6,	%l2,	%o7
	edge32l	%g7,	%i1,	%i7
	ld	[%l7 + 0x08],	%f2
	smul	%l6,	0x0987,	%o4
	movvs	%icc,	%i2,	%i4
	nop
	set	0x20, %o6
	ldd	[%l7 + %o6],	%g2
	fpsub32s	%f16,	%f7,	%f10
	sethi	0x0F07,	%i6
	movne	%xcc,	%g4,	%l0
	save %l4, %l1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g2,	%o5,	%i3
	movvc	%icc,	%l3,	%i0
	addccc	%o0,	%o2,	%i5
	edge16ln	%l5,	%o3,	%g1
	smulcc	%g5,	0x004A,	%o1
	fnegd	%f20,	%f18
	subc	%l2,	0x0041,	%o7
	umulcc	%g6,	%g7,	%i1
	std	%f2,	[%l7 + 0x18]
	edge16	%i7,	%o4,	%i2
	fpack32	%f6,	%f12,	%f8
	fmul8sux16	%f12,	%f6,	%f18
	andcc	%i4,	0x0E90,	%g3
	andcc	%l6,	%g4,	%l0
	popc	0x1041,	%i6
	movrlz	%l4,	0x323,	%o6
	srax	%l1,	0x1D,	%g2
	array8	%i3,	%l3,	%o5
	fcmpne16	%f20,	%f2,	%i0
	ldsb	[%l7 + 0x7A],	%o2
	subccc	%o0,	0x1A29,	%l5
	movcc	%icc,	%o3,	%g1
	movvs	%icc,	%i5,	%o1
	edge16n	%g5,	%l2,	%o7
	udivcc	%g6,	0x0A39,	%i1
	edge32l	%g7,	%o4,	%i2
	movle	%icc,	%i4,	%i7
	array32	%l6,	%g4,	%g3
	ldd	[%l7 + 0x48],	%f28
	fnot1	%f8,	%f2
	addccc	%l0,	%l4,	%i6
	add	%l1,	0x1320,	%o6
	xnorcc	%i3,	0x1F12,	%l3
	fcmped	%fcc2,	%f16,	%f8
	edge32ln	%g2,	%o5,	%i0
	add	%o2,	%l5,	%o0
	addccc	%g1,	0x0592,	%i5
	fmovdvs	%icc,	%f21,	%f26
	ldd	[%l7 + 0x28],	%o2
	srl	%g5,	%o1,	%o7
	std	%f14,	[%l7 + 0x30]
	array16	%g6,	%l2,	%g7
	fmovse	%icc,	%f7,	%f4
	movl	%icc,	%o4,	%i1
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	movgu	%xcc,	%g4,	%i4
	ldd	[%l7 + 0x78],	%f20
	stb	%g3,	[%l7 + 0x4B]
	bshuffle	%f8,	%f6,	%f20
	fmovsne	%icc,	%f24,	%f13
	movl	%xcc,	%l0,	%i6
	movrgz	%l1,	%l4,	%o6
	ld	[%l7 + 0x70],	%f13
	edge32n	%l3,	%i3,	%g2
	edge16n	%i0,	%o2,	%o5
	xnor	%o0,	%g1,	%l5
	andcc	%o3,	%g5,	%i5
	stx	%o1,	[%l7 + 0x20]
	fmovsne	%xcc,	%f14,	%f30
	ldd	[%l7 + 0x28],	%g6
	fmovsg	%xcc,	%f23,	%f29
	fornot2s	%f17,	%f10,	%f11
	fors	%f10,	%f14,	%f19
	array8	%o7,	%g7,	%o4
	movrgz	%l2,	0x2BC,	%i2
	movneg	%xcc,	%i7,	%l6
	movcc	%icc,	%g4,	%i1
	orcc	%g3,	0x043E,	%l0
	movn	%icc,	%i6,	%l1
	movleu	%xcc,	%i4,	%l4
	edge16n	%l3,	%o6,	%g2
	alignaddr	%i3,	%i0,	%o2
	fandnot1	%f20,	%f26,	%f30
	edge8l	%o5,	%g1,	%o0
	movre	%l5,	%g5,	%i5
	movl	%icc,	%o3,	%g6
	nop
	set	0x14, %l5
	lduw	[%l7 + %l5],	%o7
	popc	0x1308,	%g7
	ldx	[%l7 + 0x70],	%o1
	fmovrsne	%o4,	%f21,	%f17
	fnot2	%f0,	%f6
	andn	%i2,	%i7,	%l6
	movrgez	%l2,	%i1,	%g3
	movne	%icc,	%g4,	%l0
	movrgz	%l1,	0x11D,	%i6
	addcc	%l4,	%l3,	%o6
	orcc	%i4,	%i3,	%i0
	edge16ln	%o2,	%g2,	%g1
	mulscc	%o0,	%o5,	%g5
	edge16l	%i5,	%o3,	%g6
	fxors	%f23,	%f21,	%f23
	edge8	%l5,	%o7,	%o1
	xor	%o4,	%g7,	%i7
	mulscc	%i2,	0x15A8,	%l6
	addccc	%l2,	%i1,	%g3
	movrlez	%l0,	%g4,	%l1
	ldsh	[%l7 + 0x40],	%l4
	movgu	%icc,	%i6,	%o6
	movg	%icc,	%i4,	%l3
	for	%f26,	%f4,	%f20
	alignaddr	%i3,	%o2,	%g2
	bshuffle	%f30,	%f8,	%f20
	fsrc2s	%f15,	%f27
	std	%f8,	[%l7 + 0x28]
	edge16n	%i0,	%o0,	%g1
	fmul8sux16	%f14,	%f28,	%f4
	fmovsvs	%icc,	%f29,	%f11
	smul	%g5,	0x01D2,	%o5
	sdivcc	%o3,	0x1B2A,	%g6
	fmovsvs	%icc,	%f8,	%f29
	edge8l	%i5,	%l5,	%o7
	stx	%o4,	[%l7 + 0x48]
	addccc	%g7,	%i7,	%i2
	array16	%o1,	%l2,	%i1
	ldsw	[%l7 + 0x4C],	%l6
	addc	%l0,	%g4,	%g3
	ldub	[%l7 + 0x6D],	%l1
	udiv	%i6,	0x1D8B,	%l4
	fmovdgu	%icc,	%f26,	%f9
	fmovsne	%xcc,	%f9,	%f13
	udivcc	%o6,	0x1BE3,	%i4
	mulx	%l3,	0x17FD,	%i3
	movre	%o2,	0x183,	%i0
	umul	%g2,	0x15CA,	%g1
	fmovdcs	%xcc,	%f21,	%f13
	addccc	%o0,	%o5,	%o3
	movg	%icc,	%g5,	%g6
	movrgz	%l5,	0x08A,	%o7
	movrlez	%o4,	%i5,	%i7
	ld	[%l7 + 0x3C],	%f4
	movgu	%icc,	%i2,	%o1
	edge8l	%g7,	%l2,	%l6
	fzeros	%f1
	xnor	%i1,	0x1E1D,	%l0
	smulcc	%g3,	%l1,	%g4
	ldub	[%l7 + 0x3D],	%i6
	alignaddrl	%l4,	%i4,	%l3
	edge8ln	%o6,	%o2,	%i0
	fmovrsgz	%g2,	%f28,	%f13
	fcmple32	%f16,	%f0,	%g1
	fmovdpos	%xcc,	%f0,	%f21
	edge16l	%o0,	%i3,	%o5
	save %g5, %o3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l5,	[%l7 + 0x58]
	orcc	%o7,	0x0E8B,	%o4
	lduh	[%l7 + 0x52],	%i5
	ldsw	[%l7 + 0x24],	%i7
	array32	%i2,	%o1,	%l2
	orcc	%l6,	0x0A3A,	%g7
	xnorcc	%l0,	%g3,	%l1
	edge8	%i1,	%i6,	%g4
	fmul8x16al	%f31,	%f22,	%f28
	movl	%icc,	%l4,	%i4
	sra	%l3,	0x18,	%o6
	st	%f10,	[%l7 + 0x38]
	array32	%i0,	%g2,	%g1
	srax	%o0,	%i3,	%o5
	orn	%o2,	0x0460,	%o3
	edge8ln	%g6,	%l5,	%g5
	fxors	%f4,	%f14,	%f21
	edge32l	%o7,	%i5,	%o4
	fmovs	%f2,	%f30
	edge8	%i2,	%o1,	%i7
	movvs	%icc,	%l6,	%g7
	edge32n	%l2,	%l0,	%l1
	mulx	%i1,	0x07F2,	%g3
	movvc	%icc,	%i6,	%l4
	movvc	%icc,	%i4,	%l3
	orn	%g4,	0x0DEE,	%o6
	edge8n	%g2,	%g1,	%o0
	ldx	[%l7 + 0x30],	%i0
	orcc	%o5,	%i3,	%o3
	andncc	%g6,	%o2,	%g5
	fandnot1	%f10,	%f24,	%f22
	fornot1s	%f29,	%f1,	%f4
	srlx	%l5,	0x0E,	%i5
	mova	%icc,	%o7,	%i2
	addccc	%o4,	0x17BC,	%o1
	fsrc1s	%f21,	%f25
	alignaddrl	%l6,	%i7,	%l2
	edge16ln	%l0,	%l1,	%g7
	sdiv	%i1,	0x183C,	%g3
	fmovdneg	%icc,	%f22,	%f19
	edge16l	%i6,	%l4,	%l3
	andncc	%g4,	%i4,	%g2
	fcmpne32	%f4,	%f16,	%g1
	movcc	%icc,	%o6,	%i0
	sth	%o5,	[%l7 + 0x4E]
	subc	%i3,	0x0B57,	%o0
	fmovdgu	%icc,	%f16,	%f7
	edge32l	%o3,	%g6,	%o2
	fcmpes	%fcc2,	%f14,	%f16
	alignaddr	%l5,	%i5,	%o7
	fornot1s	%f9,	%f0,	%f6
	restore %i2, 0x1B84, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f0,	%f2
	mulscc	%o4,	%o1,	%i7
	lduh	[%l7 + 0x5E],	%l2
	or	%l6,	%l0,	%l1
	ldsw	[%l7 + 0x30],	%i1
	fpadd32	%f4,	%f16,	%f24
	fmovsl	%icc,	%f23,	%f8
	sub	%g3,	0x0C0E,	%i6
	sub	%g7,	%l3,	%l4
	movne	%xcc,	%g4,	%g2
	xorcc	%g1,	%o6,	%i0
	ldsw	[%l7 + 0x70],	%i4
	edge8ln	%o5,	%o0,	%o3
	fornot2	%f14,	%f4,	%f18
	fornot2s	%f3,	%f9,	%f25
	movvs	%xcc,	%g6,	%o2
	movn	%xcc,	%l5,	%i3
	edge32n	%i5,	%i2,	%o7
	fpadd16	%f0,	%f24,	%f22
	fcmple32	%f20,	%f24,	%o4
	stx	%o1,	[%l7 + 0x10]
	fmovdge	%icc,	%f31,	%f31
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	movn	%xcc,	%l0,	%l1
	fexpand	%f10,	%f30
	array32	%i1,	%l6,	%g3
	fmovd	%f22,	%f2
	orcc	%g7,	0x07DC,	%i6
	andcc	%l4,	%l3,	%g4
	edge16l	%g1,	%g2,	%o6
	movleu	%icc,	%i0,	%o5
	st	%f30,	[%l7 + 0x54]
	addcc	%i4,	%o0,	%o3
	udivx	%g6,	0x1CC4,	%l5
	movne	%icc,	%o2,	%i5
	add	%i3,	0x1739,	%i2
	fmovsle	%xcc,	%f16,	%f6
	xnorcc	%o7,	%o4,	%o1
	fmovdcc	%icc,	%f27,	%f24
	fmovda	%icc,	%f8,	%f17
	addc	%i7,	0x1C49,	%g5
	st	%f14,	[%l7 + 0x64]
	or	%l2,	0x1C26,	%l0
	movrne	%l1,	%i1,	%g3
	fnot1	%f10,	%f28
	ld	[%l7 + 0x58],	%f30
	nop
	set	0x24, %g5
	ldsw	[%l7 + %g5],	%g7
	subc	%i6,	%l6,	%l3
	xnorcc	%g4,	0x1F6C,	%l4
	umul	%g1,	0x0617,	%g2
	move	%xcc,	%o6,	%i0
	lduh	[%l7 + 0x5A],	%i4
	fcmple16	%f4,	%f10,	%o5
	movrlez	%o0,	0x2A9,	%o3
	movrlez	%l5,	0x288,	%g6
	alignaddrl	%i5,	%i3,	%i2
	edge32n	%o7,	%o4,	%o2
	array32	%o1,	%i7,	%g5
	edge32n	%l2,	%l1,	%l0
	fmovscs	%xcc,	%f19,	%f23
	xnor	%g3,	0x1099,	%g7
	add	%i6,	0x0FB3,	%l6
	smul	%l3,	%g4,	%i1
	fones	%f27
	smulcc	%l4,	0x033B,	%g2
	movrlz	%g1,	%o6,	%i4
	movpos	%icc,	%i0,	%o0
	orncc	%o3,	0x1AE0,	%l5
	sth	%o5,	[%l7 + 0x24]
	ldsh	[%l7 + 0x7C],	%g6
	smulcc	%i3,	%i2,	%o7
	nop
	set	0x46, %l1
	ldsb	[%l7 + %l1],	%o4
	movrlez	%o2,	%o1,	%i5
	ldub	[%l7 + 0x4C],	%i7
	movre	%g5,	%l2,	%l0
	ld	[%l7 + 0x4C],	%f16
	addccc	%g3,	%g7,	%l1
	fmovdneg	%icc,	%f11,	%f12
	umul	%i6,	%l6,	%l3
	fmovsge	%xcc,	%f28,	%f16
	edge8l	%i1,	%l4,	%g4
	ldub	[%l7 + 0x1A],	%g1
	alignaddrl	%g2,	%o6,	%i0
	movvs	%icc,	%i4,	%o3
	sdiv	%o0,	0x0D69,	%o5
	movcc	%icc,	%g6,	%i3
	movrlez	%i2,	%o7,	%o4
	movrne	%l5,	%o2,	%o1
	xnorcc	%i5,	0x1434,	%i7
	restore %g5, 0x0872, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l0,	%g3,	%g7
	ldsh	[%l7 + 0x74],	%i6
	fcmple16	%f10,	%f28,	%l1
	fcmps	%fcc0,	%f9,	%f3
	xorcc	%l6,	%l3,	%l4
	movre	%g4,	0x37D,	%i1
	fmovrdne	%g1,	%f20,	%f6
	umulcc	%o6,	0x0BDB,	%g2
	orncc	%i0,	0x067C,	%i4
	edge32n	%o3,	%o0,	%o5
	orncc	%i3,	%g6,	%i2
	movge	%xcc,	%o7,	%l5
	movre	%o4,	0x349,	%o2
	fcmple16	%f18,	%f10,	%i5
	movle	%icc,	%i7,	%g5
	edge16	%l2,	%o1,	%l0
	sdiv	%g3,	0x0637,	%g7
	fmovdgu	%xcc,	%f19,	%f26
	xnorcc	%l1,	0x1933,	%i6
	movne	%icc,	%l6,	%l4
	subc	%g4,	0x01D3,	%i1
	movvs	%xcc,	%g1,	%l3
	sll	%o6,	%g2,	%i4
	ldsb	[%l7 + 0x3A],	%i0
	movgu	%xcc,	%o3,	%o5
	fpsub32	%f18,	%f30,	%f20
	orn	%i3,	%g6,	%o0
	sth	%i2,	[%l7 + 0x7A]
	udiv	%l5,	0x0285,	%o4
	andn	%o2,	%i5,	%i7
	fnot1s	%f7,	%f19
	edge8ln	%o7,	%l2,	%g5
	fmovde	%icc,	%f17,	%f21
	stx	%l0,	[%l7 + 0x10]
	sethi	0x0B53,	%g3
	orncc	%o1,	%l1,	%i6
	movvs	%xcc,	%l6,	%g7
	edge16l	%g4,	%i1,	%l4
	orncc	%g1,	0x1032,	%l3
	sub	%g2,	%o6,	%i0
	sub	%o3,	%o5,	%i4
	fmovrdlz	%g6,	%f28,	%f24
	fmovsn	%xcc,	%f29,	%f22
	movn	%xcc,	%i3,	%i2
	edge8ln	%o0,	%l5,	%o4
	fnegs	%f28,	%f1
	srlx	%o2,	0x1C,	%i5
	smul	%i7,	%o7,	%g5
	ldsb	[%l7 + 0x37],	%l0
	smulcc	%g3,	%l2,	%l1
	ldx	[%l7 + 0x20],	%o1
	smul	%l6,	0x112E,	%i6
	mulscc	%g7,	%i1,	%l4
	fnot1s	%f13,	%f4
	fpackfix	%f12,	%f4
	edge32	%g4,	%g1,	%l3
	fandnot2s	%f24,	%f14,	%f18
	ldd	[%l7 + 0x30],	%g2
	movcc	%xcc,	%o6,	%i0
	stx	%o5,	[%l7 + 0x58]
	fpadd32	%f16,	%f30,	%f10
	movleu	%xcc,	%o3,	%g6
	fpack32	%f28,	%f14,	%f12
	fmovrde	%i4,	%f2,	%f16
	ldsh	[%l7 + 0x32],	%i2
	umulcc	%o0,	0x048D,	%l5
	movle	%icc,	%o4,	%o2
	srlx	%i3,	0x0B,	%i7
	andcc	%i5,	0x1FCD,	%o7
	stw	%g5,	[%l7 + 0x24]
	siam	0x6
	udivx	%g3,	0x1537,	%l2
	edge8n	%l1,	%o1,	%l0
	movrne	%i6,	0x297,	%g7
	subc	%l6,	%i1,	%l4
	srl	%g1,	%l3,	%g4
	fmovscs	%icc,	%f15,	%f27
	fpack16	%f12,	%f23
	alignaddr	%o6,	%g2,	%o5
	fmul8sux16	%f6,	%f24,	%f16
	orcc	%i0,	0x1C35,	%o3
	or	%g6,	%i2,	%o0
	fcmpes	%fcc2,	%f2,	%f9
	movvc	%icc,	%i4,	%o4
	sllx	%l5,	0x14,	%o2
	srl	%i7,	0x13,	%i5
	xor	%o7,	0x06EA,	%g5
	edge16ln	%g3,	%l2,	%i3
	addcc	%o1,	0x0602,	%l1
	ldub	[%l7 + 0x21],	%i6
	movvs	%xcc,	%l0,	%g7
	edge32n	%l6,	%l4,	%i1
	edge16n	%l3,	%g1,	%g4
	array8	%o6,	%g2,	%o5
	movrlez	%i0,	%o3,	%i2
	movcc	%icc,	%g6,	%i4
	srl	%o0,	%o4,	%l5
	edge32l	%o2,	%i5,	%o7
	movgu	%icc,	%i7,	%g3
	movle	%xcc,	%g5,	%l2
	array32	%i3,	%l1,	%o1
	edge16	%i6,	%l0,	%g7
	fandnot2	%f30,	%f0,	%f16
	fcmpne32	%f12,	%f4,	%l4
	movvc	%xcc,	%i1,	%l6
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	fmovdg	%xcc,	%f24,	%f13
	save %o6, 0x0D89, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o5,	%g4,	%i0
	movvs	%icc,	%o3,	%i2
	udivx	%g6,	0x0913,	%o0
	nop
	set	0x44, %o4
	stw	%o4,	[%l7 + %o4]
	and	%i4,	%o2,	%i5
	ldsb	[%l7 + 0x4F],	%o7
	stb	%l5,	[%l7 + 0x63]
	fmovsneg	%xcc,	%f3,	%f29
	movleu	%icc,	%g3,	%i7
	fzero	%f14
	sdiv	%l2,	0x1050,	%g5
	array16	%l1,	%o1,	%i3
	edge16n	%l0,	%g7,	%l4
	edge32ln	%i1,	%i6,	%g1
	fnand	%f12,	%f26,	%f24
	bshuffle	%f10,	%f20,	%f18
	subcc	%l6,	0x03E0,	%o6
	sllx	%l3,	%o5,	%g4
	fxor	%f4,	%f26,	%f22
	movle	%icc,	%i0,	%g2
	edge32	%o3,	%i2,	%g6
	sdivx	%o4,	0x0BAE,	%i4
	stx	%o0,	[%l7 + 0x20]
	fnot1	%f18,	%f2
	ld	[%l7 + 0x48],	%f5
	xnorcc	%i5,	%o7,	%l5
	movrlez	%g3,	%i7,	%o2
	umul	%g5,	0x1168,	%l1
	movvc	%icc,	%o1,	%i3
	alignaddr	%l0,	%l2,	%g7
	movge	%icc,	%i1,	%l4
	movge	%xcc,	%i6,	%g1
	umul	%o6,	%l3,	%o5
	std	%f24,	[%l7 + 0x28]
	sdivcc	%g4,	0x153C,	%i0
	umul	%l6,	0x01C1,	%o3
	movge	%xcc,	%g2,	%i2
	movrlz	%o4,	0x1E3,	%i4
	move	%icc,	%g6,	%o0
	fsrc2s	%f5,	%f6
	fmovdne	%xcc,	%f15,	%f29
	movrgez	%o7,	0x214,	%l5
	movg	%icc,	%g3,	%i7
	sdivx	%i5,	0x0AB0,	%o2
	srl	%l1,	0x1C,	%g5
	sub	%i3,	0x0268,	%l0
	bshuffle	%f0,	%f16,	%f28
	xnor	%o1,	0x068D,	%g7
	andn	%l2,	%l4,	%i1
	sir	0x1103
	xorcc	%i6,	0x1911,	%o6
	fmovsn	%xcc,	%f9,	%f24
	fmovsa	%xcc,	%f15,	%f3
	movcc	%xcc,	%l3,	%g1
	edge32n	%g4,	%i0,	%l6
	mulscc	%o3,	%o5,	%i2
	sra	%o4,	%i4,	%g6
	fmovrse	%o0,	%f17,	%f22
	alignaddrl	%g2,	%l5,	%g3
	fnot2s	%f12,	%f17
	fmovsleu	%xcc,	%f31,	%f8
	siam	0x5
	fnors	%f3,	%f16,	%f9
	movleu	%xcc,	%o7,	%i5
	sir	0x1911
	movgu	%xcc,	%o2,	%l1
	movvs	%xcc,	%i7,	%i3
	movrlez	%g5,	0x34D,	%o1
	mulscc	%l0,	%l2,	%l4
	movl	%xcc,	%g7,	%i6
	orncc	%i1,	0x0015,	%l3
	fpsub32s	%f31,	%f15,	%f5
	edge32n	%g1,	%g4,	%i0
	fpadd16s	%f19,	%f11,	%f9
	edge16ln	%l6,	%o3,	%o6
	fmovda	%icc,	%f29,	%f20
	fcmple32	%f26,	%f4,	%o5
	alignaddr	%o4,	%i2,	%i4
	fmovrdlz	%o0,	%f30,	%f8
	subccc	%g6,	0x112D,	%g2
	srlx	%l5,	%o7,	%g3
	edge32l	%o2,	%i5,	%l1
	movn	%xcc,	%i7,	%g5
	fpackfix	%f18,	%f14
	edge8l	%i3,	%o1,	%l0
	movrgz	%l2,	%l4,	%g7
	fmovdpos	%xcc,	%f27,	%f12
	fpsub16s	%f1,	%f22,	%f23
	fandnot2s	%f3,	%f30,	%f31
	umulcc	%i1,	%l3,	%g1
	ldsb	[%l7 + 0x65],	%g4
	edge16n	%i6,	%i0,	%l6
	or	%o6,	0x1594,	%o3
	save %o5, 0x0387, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f21,	[%l7 + 0x3C]
	move	%xcc,	%i4,	%o4
	restore %o0, %g6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%g2,	0x12,	%g3
	alignaddrl	%o7,	%o2,	%l1
	add	%i7,	%g5,	%i3
	sllx	%o1,	0x1A,	%i5
	stx	%l2,	[%l7 + 0x60]
	subc	%l0,	%l4,	%g7
	addc	%i1,	0x17DC,	%g1
	movneg	%xcc,	%l3,	%g4
	fcmpne16	%f2,	%f2,	%i6
	movne	%xcc,	%i0,	%o6
	fmovda	%xcc,	%f5,	%f5
	edge8ln	%l6,	%o3,	%i2
	sir	0x10BE
	movre	%o5,	0x258,	%i4
	orncc	%o0,	%o4,	%l5
	ldsh	[%l7 + 0x5A],	%g2
	movrlz	%g6,	0x166,	%g3
	and	%o7,	%l1,	%i7
	smulcc	%o2,	0x1B21,	%i3
	movpos	%icc,	%g5,	%i5
	udivx	%l2,	0x11C8,	%o1
	edge32n	%l0,	%l4,	%g7
	edge8n	%g1,	%i1,	%l3
	lduw	[%l7 + 0x7C],	%i6
	fmovdleu	%xcc,	%f22,	%f2
	smulcc	%i0,	%g4,	%l6
	fmovrdgz	%o3,	%f16,	%f24
	fxnors	%f19,	%f1,	%f19
	udiv	%i2,	0x035C,	%o5
	xnor	%i4,	0x1533,	%o6
	movge	%icc,	%o4,	%o0
	edge8n	%l5,	%g6,	%g3
	fmovsn	%icc,	%f10,	%f28
	orn	%o7,	%l1,	%i7
	sllx	%g2,	0x02,	%o2
	stx	%g5,	[%l7 + 0x40]
	edge16n	%i3,	%i5,	%l2
	fmovsge	%icc,	%f31,	%f17
	edge8l	%l0,	%o1,	%l4
	fones	%f28
	orncc	%g1,	0x1F75,	%g7
	fand	%f30,	%f8,	%f30
	orncc	%l3,	%i6,	%i1
	fandnot2	%f10,	%f20,	%f28
	xorcc	%i0,	%l6,	%g4
	or	%o3,	%i2,	%i4
	movge	%xcc,	%o5,	%o4
	and	%o6,	%l5,	%o0
	stw	%g3,	[%l7 + 0x34]
	movrne	%o7,	%g6,	%l1
	or	%g2,	0x1B5A,	%i7
	ldsh	[%l7 + 0x3C],	%o2
	array16	%i3,	%i5,	%l2
	lduh	[%l7 + 0x5A],	%l0
	movle	%xcc,	%g5,	%l4
	move	%xcc,	%o1,	%g1
	fmovdn	%xcc,	%f19,	%f20
	andn	%l3,	%g7,	%i1
	movrne	%i6,	%l6,	%i0
	edge8	%o3,	%i2,	%g4
	stw	%o5,	[%l7 + 0x78]
	udivcc	%o4,	0x1838,	%i4
	fmovrsne	%o6,	%f10,	%f27
	edge16ln	%l5,	%g3,	%o7
	ldd	[%l7 + 0x10],	%f28
	movneg	%xcc,	%o0,	%g6
	fmovs	%f2,	%f12
	movneg	%icc,	%l1,	%i7
	fmovrsne	%o2,	%f23,	%f11
	fmovdneg	%icc,	%f10,	%f2
	movcs	%xcc,	%g2,	%i5
	fmovdleu	%icc,	%f15,	%f21
	udivx	%i3,	0x167E,	%l2
	ldd	[%l7 + 0x30],	%g4
	mulscc	%l4,	%l0,	%g1
	fmovs	%f5,	%f20
	srlx	%l3,	0x07,	%o1
	fmovse	%xcc,	%f26,	%f21
	movrgez	%g7,	0x339,	%i6
	movgu	%icc,	%l6,	%i1
	fnot1	%f14,	%f8
	array8	%o3,	%i2,	%i0
	movvc	%icc,	%o5,	%o4
	fmovrdgz	%i4,	%f30,	%f18
	movle	%icc,	%g4,	%l5
	mulscc	%g3,	0x1925,	%o7
	movrne	%o0,	0x366,	%o6
	subcc	%g6,	%i7,	%l1
	orcc	%g2,	%i5,	%i3
	movcs	%icc,	%l2,	%g5
	smul	%l4,	%l0,	%g1
	fmovspos	%icc,	%f18,	%f4
	edge32l	%o2,	%o1,	%l3
	sllx	%i6,	0x1F,	%l6
	fmovsleu	%xcc,	%f20,	%f8
	sllx	%g7,	%i1,	%o3
	movre	%i2,	%o5,	%i0
	popc	%i4,	%g4
	fandnot1	%f28,	%f18,	%f14
	alignaddrl	%o4,	%g3,	%o7
	fnands	%f18,	%f15,	%f2
	stx	%o0,	[%l7 + 0x78]
	fmovrse	%o6,	%f19,	%f8
	edge32ln	%l5,	%i7,	%l1
	smul	%g6,	0x19AB,	%g2
	fornot2	%f20,	%f10,	%f26
	umulcc	%i5,	0x028D,	%i3
	movl	%xcc,	%g5,	%l2
	st	%f16,	[%l7 + 0x30]
	umulcc	%l0,	%l4,	%o2
	ldd	[%l7 + 0x30],	%f6
	orcc	%g1,	0x00E2,	%l3
	xorcc	%i6,	%o1,	%l6
	fexpand	%f12,	%f10
	ldx	[%l7 + 0x38],	%g7
	fmovdvs	%xcc,	%f28,	%f25
	orncc	%i1,	0x1A4D,	%i2
	orn	%o3,	%o5,	%i0
	st	%f8,	[%l7 + 0x64]
	fxnors	%f13,	%f18,	%f20
	mulx	%g4,	0x18C8,	%o4
	edge32	%i4,	%o7,	%g3
	smul	%o0,	0x097E,	%o6
	srlx	%l5,	%i7,	%g6
	fmuld8sux16	%f6,	%f19,	%f30
	fmovsgu	%icc,	%f8,	%f16
	movcc	%xcc,	%l1,	%i5
	orncc	%i3,	%g5,	%l2
	sdivcc	%l0,	0x1FDD,	%g2
	fmuld8sux16	%f31,	%f13,	%f12
	movcc	%icc,	%l4,	%g1
	fmovsle	%icc,	%f13,	%f1
	fnands	%f26,	%f5,	%f9
	ld	[%l7 + 0x64],	%f3
	edge16l	%l3,	%i6,	%o2
	movcs	%xcc,	%o1,	%l6
	srl	%i1,	%i2,	%g7
	subccc	%o3,	0x1A73,	%i0
	move	%icc,	%o5,	%g4
	edge8	%i4,	%o4,	%g3
	sth	%o0,	[%l7 + 0x22]
	orcc	%o6,	%l5,	%i7
	movn	%icc,	%g6,	%o7
	stb	%i5,	[%l7 + 0x35]
	andncc	%l1,	%i3,	%l2
	edge32	%l0,	%g2,	%g5
	addc	%g1,	0x1A4F,	%l4
	sub	%i6,	%l3,	%o1
	movrne	%o2,	%l6,	%i2
	movne	%xcc,	%g7,	%i1
	fxors	%f12,	%f13,	%f8
	stb	%o3,	[%l7 + 0x0C]
	fmovdcs	%xcc,	%f16,	%f11
	sth	%i0,	[%l7 + 0x14]
	srlx	%g4,	%i4,	%o5
	stw	%g3,	[%l7 + 0x48]
	sth	%o0,	[%l7 + 0x16]
	fmovsvc	%xcc,	%f29,	%f7
	srax	%o4,	0x1D,	%l5
	stb	%o6,	[%l7 + 0x7B]
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	sdiv	%i5,	0x1468,	%g6
	restore %l1, %i3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	%g5,	%g2
	fone	%f18
	movrlez	%g1,	%l4,	%l3
	or	%i6,	%o2,	%l6
	movcc	%icc,	%o1,	%g7
	movrgz	%i1,	%i2,	%i0
	ldx	[%l7 + 0x50],	%g4
	movleu	%icc,	%o3,	%o5
	edge8ln	%g3,	%i4,	%o0
	add	%l5,	%o4,	%o6
	subcc	%i7,	0x1748,	%i5
	fpsub32	%f26,	%f10,	%f8
	lduw	[%l7 + 0x18],	%o7
	subcc	%l1,	0x15FB,	%g6
	orcc	%l0,	0x1EE2,	%i3
	edge32l	%l2,	%g5,	%g1
	edge16l	%l4,	%l3,	%i6
	movrlz	%g2,	0x062,	%o2
	fmovsneg	%xcc,	%f22,	%f13
	movre	%o1,	%l6,	%g7
	srax	%i1,	%i2,	%g4
	addc	%i0,	%o3,	%o5
	movrlez	%i4,	0x0B2,	%g3
	movg	%icc,	%o0,	%l5
	lduh	[%l7 + 0x6A],	%o6
	stb	%o4,	[%l7 + 0x13]
	st	%f14,	[%l7 + 0x28]
	mulscc	%i5,	%o7,	%i7
	movneg	%xcc,	%l1,	%l0
	lduh	[%l7 + 0x70],	%g6
	stx	%l2,	[%l7 + 0x70]
	alignaddrl	%g5,	%g1,	%i3
	ldub	[%l7 + 0x13],	%l3
	popc	%i6,	%l4
	fsrc1s	%f2,	%f22
	edge16	%g2,	%o1,	%o2
	xor	%g7,	0x0CC0,	%i1
	ldsb	[%l7 + 0x4A],	%l6
	fxor	%f20,	%f24,	%f18
	alignaddr	%i2,	%i0,	%o3
	xorcc	%g4,	0x0571,	%o5
	fnors	%f6,	%f17,	%f15
	movn	%xcc,	%g3,	%o0
	fpmerge	%f15,	%f23,	%f24
	stb	%i4,	[%l7 + 0x16]
	fpack32	%f10,	%f4,	%f12
	fmovrsgez	%l5,	%f2,	%f25
	orcc	%o6,	0x08A2,	%o4
	sub	%o7,	%i5,	%i7
	fpsub32s	%f4,	%f10,	%f5
	srl	%l1,	%l0,	%g6
	movrgez	%l2,	0x080,	%g1
	subccc	%g5,	0x0076,	%i3
	lduh	[%l7 + 0x7E],	%i6
	st	%f20,	[%l7 + 0x6C]
	popc	0x0B7F,	%l3
	xnorcc	%g2,	0x17E6,	%o1
	andcc	%l4,	%o2,	%i1
	for	%f12,	%f4,	%f14
	movl	%icc,	%l6,	%g7
	array16	%i2,	%o3,	%g4
	move	%xcc,	%o5,	%g3
	udivx	%o0,	0x1920,	%i4
	fornot1	%f16,	%f10,	%f12
	sllx	%l5,	%o6,	%i0
	fxor	%f28,	%f12,	%f18
	addcc	%o4,	0x03E8,	%i5
	edge32l	%o7,	%l1,	%i7
	fone	%f4
	array32	%g6,	%l0,	%l2
	fmuld8sux16	%f6,	%f27,	%f22
	srax	%g1,	%i3,	%i6
	sra	%g5,	0x02,	%l3
	movcs	%icc,	%g2,	%l4
	edge8	%o1,	%o2,	%i1
	fmovscs	%xcc,	%f2,	%f21
	ldx	[%l7 + 0x38],	%l6
	fornot1	%f26,	%f16,	%f18
	edge8ln	%i2,	%g7,	%o3
	movrgz	%o5,	0x0F6,	%g4
	add	%g3,	0x0D24,	%i4
	lduh	[%l7 + 0x28],	%l5
	fands	%f20,	%f14,	%f2
	movcs	%icc,	%o0,	%i0
	ldsb	[%l7 + 0x4E],	%o6
	addccc	%i5,	0x07EF,	%o4
	xor	%o7,	0x180D,	%i7
	movrgez	%l1,	0x32D,	%g6
	alignaddrl	%l2,	%l0,	%i3
	movge	%icc,	%i6,	%g5
	mova	%icc,	%g1,	%l3
	alignaddrl	%l4,	%o1,	%o2
	movrne	%i1,	0x2E9,	%l6
	fpadd16	%f10,	%f24,	%f14
	fandnot2	%f20,	%f6,	%f6
	srax	%g2,	%g7,	%i2
	stw	%o5,	[%l7 + 0x60]
	ldd	[%l7 + 0x28],	%g4
	fnot1	%f10,	%f16
	movcc	%icc,	%g3,	%o3
	sdiv	%i4,	0x0715,	%l5
	srl	%o0,	%o6,	%i0
	add	%i5,	%o4,	%i7
	edge8n	%o7,	%g6,	%l2
	ld	[%l7 + 0x0C],	%f6
	edge32n	%l1,	%i3,	%i6
	sub	%l0,	%g5,	%l3
	array32	%l4,	%o1,	%g1
	movvc	%xcc,	%o2,	%l6
	xnor	%i1,	%g2,	%g7
	sub	%o5,	%g4,	%g3
	fcmps	%fcc2,	%f26,	%f11
	fone	%f0
	umulcc	%i2,	%i4,	%l5
	ldsb	[%l7 + 0x18],	%o3
	ld	[%l7 + 0x48],	%f28
	movrgz	%o0,	%o6,	%i0
	orn	%i5,	%i7,	%o4
	xor	%o7,	0x1B0B,	%g6
	nop
	set	0x30, %o3
	ldd	[%l7 + %o3],	%l0
	fmul8sux16	%f4,	%f0,	%f12
	srax	%l2,	%i6,	%i3
	xor	%l0,	%l3,	%g5
	sllx	%o1,	%l4,	%g1
	edge16n	%o2,	%i1,	%l6
	movl	%icc,	%g2,	%g7
	movrlez	%g4,	%g3,	%o5
	sdiv	%i2,	0x0F7F,	%i4
	edge16ln	%o3,	%o0,	%o6
	edge32l	%i0,	%i5,	%l5
	sdivx	%o4,	0x1CBF,	%o7
	ldx	[%l7 + 0x30],	%i7
	stw	%g6,	[%l7 + 0x64]
	edge32n	%l1,	%i6,	%l2
	fnot2s	%f21,	%f31
	edge8ln	%l0,	%l3,	%i3
	fmovspos	%icc,	%f18,	%f22
	move	%icc,	%g5,	%l4
	movrgez	%o1,	0x20F,	%o2
	fmuld8sux16	%f28,	%f0,	%f14
	edge32n	%i1,	%g1,	%g2
	udivx	%g7,	0x048E,	%g4
	array16	%g3,	%l6,	%i2
	sll	%o5,	%i4,	%o0
	array8	%o6,	%o3,	%i5
	addcc	%l5,	0x0C85,	%i0
	fabsd	%f0,	%f18
	sir	0x064D
	udivcc	%o7,	0x1227,	%i7
	fornot1s	%f5,	%f21,	%f20
	edge32	%o4,	%g6,	%l1
	array8	%i6,	%l2,	%l3
	fxnors	%f29,	%f11,	%f8
	ldx	[%l7 + 0x58],	%l0
	fcmpeq16	%f30,	%f18,	%g5
	save %i3, 0x0463, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l4,	%o2,	%g1
	udivx	%g2,	0x0993,	%g7
	movgu	%icc,	%i1,	%g3
	smul	%g4,	%i2,	%o5
	array8	%i4,	%o0,	%o6
	fabss	%f21,	%f26
	lduh	[%l7 + 0x12],	%o3
	fmovrde	%i5,	%f30,	%f2
	xnor	%l5,	0x1211,	%l6
	movg	%xcc,	%i0,	%i7
	fzeros	%f7
	sdivx	%o4,	0x0202,	%o7
	udivx	%l1,	0x01A9,	%i6
	and	%g6,	%l3,	%l0
	std	%f0,	[%l7 + 0x70]
	sdiv	%l2,	0x04BA,	%g5
	fone	%f12
	sir	0x14B4
	xnor	%o1,	%i3,	%o2
	fmovdne	%xcc,	%f22,	%f7
	lduh	[%l7 + 0x54],	%l4
	ldsh	[%l7 + 0x52],	%g1
	movpos	%xcc,	%g2,	%i1
	ldx	[%l7 + 0x30],	%g7
	array8	%g3,	%i2,	%g4
	xor	%o5,	0x11C4,	%i4
	mova	%icc,	%o0,	%o6
	movl	%icc,	%o3,	%i5
	lduw	[%l7 + 0x40],	%l5
	xorcc	%i0,	0x048A,	%l6
	stw	%i7,	[%l7 + 0x1C]
	fxor	%f8,	%f16,	%f20
	fmovsleu	%xcc,	%f27,	%f15
	movrlz	%o4,	0x0BB,	%o7
	addc	%i6,	%g6,	%l1
	movrlz	%l0,	%l2,	%g5
	movrlz	%l3,	%i3,	%o1
	ldsb	[%l7 + 0x34],	%o2
	edge8ln	%l4,	%g1,	%i1
	movrgez	%g7,	0x2C9,	%g2
	mulscc	%i2,	0x13DC,	%g3
	alignaddr	%o5,	%g4,	%o0
	fmovsvc	%icc,	%f30,	%f27
	movne	%icc,	%o6,	%o3
	movgu	%icc,	%i5,	%i4
	orncc	%i0,	%l5,	%i7
	edge32n	%o4,	%l6,	%o7
	srax	%g6,	0x0D,	%l1
	srl	%l0,	%i6,	%g5
	ldd	[%l7 + 0x30],	%f22
	movleu	%xcc,	%l2,	%i3
	sdiv	%o1,	0x1F43,	%o2
	mulx	%l4,	0x0F3E,	%l3
	fzeros	%f14
	sethi	0x089B,	%g1
	movgu	%xcc,	%i1,	%g7
	fnors	%f6,	%f24,	%f0
	xnorcc	%i2,	0x0BD2,	%g2
	fmovd	%f22,	%f0
	fxors	%f19,	%f30,	%f26
	umulcc	%o5,	%g4,	%g3
	sir	0x10A7
	xnorcc	%o0,	%o3,	%i5
	movvc	%icc,	%o6,	%i0
	movvc	%xcc,	%i4,	%l5
	std	%f12,	[%l7 + 0x70]
	fpadd32	%f22,	%f24,	%f6
	edge32	%i7,	%l6,	%o7
	movpos	%xcc,	%g6,	%o4
	srl	%l0,	%l1,	%g5
	movrne	%i6,	%i3,	%o1
	srax	%l2,	0x09,	%l4
	sdiv	%l3,	0x0C91,	%g1
	fexpand	%f19,	%f18
	fmovdn	%icc,	%f14,	%f27
	ldx	[%l7 + 0x48],	%o2
	ldd	[%l7 + 0x10],	%f0
	udivx	%g7,	0x1F83,	%i2
	fnot1	%f30,	%f12
	movcc	%icc,	%i1,	%o5
	stx	%g4,	[%l7 + 0x30]
	fmul8sux16	%f2,	%f4,	%f20
	alignaddr	%g2,	%g3,	%o3
	movvc	%xcc,	%o0,	%o6
	alignaddr	%i0,	%i4,	%i5
	edge32l	%i7,	%l5,	%o7
	array32	%g6,	%o4,	%l0
	srax	%l1,	%l6,	%g5
	movrgz	%i6,	0x2DE,	%i3
	fmovrdgz	%l2,	%f14,	%f8
	movrgz	%o1,	%l3,	%g1
	lduw	[%l7 + 0x4C],	%l4
	fmuld8sux16	%f9,	%f26,	%f16
	fmovsle	%xcc,	%f30,	%f8
	movle	%icc,	%o2,	%i2
	fxnor	%f28,	%f30,	%f22
	xnor	%i1,	%g7,	%g4
	fnand	%f6,	%f10,	%f30
	nop
	set	0x74, %o1
	stw	%g2,	[%l7 + %o1]
	xnor	%g3,	0x01F1,	%o5
	andncc	%o0,	%o6,	%i0
	udiv	%o3,	0x13A9,	%i4
	edge32	%i5,	%i7,	%l5
	ldsh	[%l7 + 0x4C],	%g6
	movl	%xcc,	%o4,	%l0
	fmovsneg	%icc,	%f26,	%f2
	fmovdl	%icc,	%f19,	%f27
	st	%f0,	[%l7 + 0x18]
	fcmpes	%fcc1,	%f7,	%f27
	movle	%icc,	%l1,	%o7
	ldsw	[%l7 + 0x5C],	%g5
	std	%f26,	[%l7 + 0x48]
	edge16l	%l6,	%i3,	%i6
	movrgz	%o1,	0x334,	%l3
	stb	%l2,	[%l7 + 0x49]
	orn	%g1,	0x0251,	%o2
	sll	%l4,	0x17,	%i2
	fpsub32s	%f30,	%f27,	%f12
	ldsh	[%l7 + 0x38],	%g7
	movcs	%icc,	%g4,	%i1
	movleu	%icc,	%g2,	%g3
	sra	%o5,	0x1C,	%o0
	ldsb	[%l7 + 0x3E],	%i0
	fmovdneg	%xcc,	%f15,	%f10
	xnor	%o3,	0x0125,	%o6
	edge32ln	%i4,	%i7,	%i5
	movpos	%icc,	%g6,	%l5
	movneg	%icc,	%l0,	%o4
	alignaddrl	%l1,	%o7,	%g5
	movneg	%xcc,	%l6,	%i3
	popc	%i6,	%o1
	udiv	%l2,	0x005B,	%g1
	fmovrsgez	%o2,	%f7,	%f27
	fmovrdgez	%l4,	%f20,	%f24
	fnors	%f9,	%f10,	%f18
	and	%i2,	0x1360,	%g7
	fornot2s	%f28,	%f8,	%f21
	fpadd32s	%f20,	%f27,	%f13
	fnand	%f28,	%f28,	%f8
	save %g4, %i1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2s	%f10,	%f19,	%f28
	fnegs	%f18,	%f2
	edge32	%l3,	%g3,	%o0
	save %i0, 0x0BCC, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o3,	0x0956,	%i4
	array32	%o6,	%i7,	%g6
	ldsw	[%l7 + 0x40],	%l5
	movrgez	%l0,	%o4,	%i5
	fxors	%f25,	%f26,	%f3
	xor	%o7,	%l1,	%g5
	movgu	%xcc,	%l6,	%i3
	edge8l	%o1,	%i6,	%l2
	array16	%o2,	%g1,	%i2
	sra	%l4,	%g4,	%i1
	st	%f12,	[%l7 + 0x14]
	srl	%g7,	0x06,	%g2
	edge32l	%g3,	%o0,	%i0
	fcmpgt16	%f30,	%f0,	%l3
	or	%o3,	%o5,	%o6
	andcc	%i4,	0x1B05,	%g6
	ldx	[%l7 + 0x58],	%i7
	fmovsge	%xcc,	%f16,	%f8
	fmovdpos	%icc,	%f26,	%f18
	popc	0x10FB,	%l0
	fmovsneg	%icc,	%f20,	%f24
	xnorcc	%o4,	%l5,	%i5
	ldd	[%l7 + 0x10],	%o6
	ldsh	[%l7 + 0x3C],	%g5
	fmovs	%f0,	%f10
	xnor	%l1,	%l6,	%i3
	sub	%i6,	%l2,	%o1
	movge	%xcc,	%g1,	%i2
	sllx	%l4,	0x04,	%o2
	sdivcc	%g4,	0x1887,	%i1
	sdiv	%g7,	0x15C7,	%g2
	ldd	[%l7 + 0x50],	%o0
	edge16n	%g3,	%i0,	%o3
	ldd	[%l7 + 0x08],	%l2
	and	%o6,	%o5,	%g6
	addccc	%i4,	%i7,	%o4
	movpos	%icc,	%l5,	%i5
	edge16ln	%l0,	%o7,	%l1
	movrgez	%l6,	%g5,	%i6
	fmovdneg	%xcc,	%f17,	%f30
	fsrc2	%f16,	%f6
	addc	%l2,	%o1,	%g1
	edge16	%i3,	%l4,	%o2
	sdivx	%i2,	0x0AA3,	%i1
	fnot1s	%f3,	%f10
	fandnot1s	%f3,	%f24,	%f15
	sub	%g7,	%g2,	%o0
	movl	%icc,	%g3,	%i0
	fandnot2s	%f18,	%f25,	%f21
	movvs	%xcc,	%g4,	%l3
	fmovsn	%icc,	%f23,	%f24
	fmovs	%f30,	%f18
	mulscc	%o3,	0x1FD3,	%o6
	save %g6, %i4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x4F],	%o5
	mulx	%l5,	%o4,	%i5
	st	%f5,	[%l7 + 0x6C]
	addc	%l0,	%l1,	%o7
	srl	%g5,	%i6,	%l6
	fcmpeq16	%f12,	%f10,	%l2
	addcc	%o1,	0x145D,	%g1
	fmovdvc	%icc,	%f18,	%f28
	sdiv	%i3,	0x16EC,	%l4
	fnot2s	%f10,	%f12
	nop
	set	0x08, %i2
	ldd	[%l7 + %i2],	%f20
	movcc	%icc,	%o2,	%i2
	edge16ln	%g7,	%g2,	%o0
	fornot1	%f18,	%f0,	%f26
	movcs	%xcc,	%g3,	%i0
	fxor	%f26,	%f12,	%f6
	fandnot1s	%f26,	%f30,	%f3
	sll	%g4,	0x11,	%i1
	movneg	%icc,	%l3,	%o6
	edge16	%o3,	%g6,	%i7
	edge32	%o5,	%i4,	%l5
	movpos	%xcc,	%o4,	%i5
	sdiv	%l0,	0x1975,	%l1
	smulcc	%g5,	0x179A,	%i6
	fcmped	%fcc1,	%f20,	%f8
	add	%l6,	%l2,	%o1
	fnegs	%f28,	%f28
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	edge8ln	%o2,	%i2,	%g7
	sir	0x19B4
	movl	%icc,	%l4,	%o0
	srax	%g2,	0x0E,	%g3
	subcc	%g4,	%i0,	%l3
	udivx	%i1,	0x194C,	%o6
	fmovsleu	%icc,	%f25,	%f27
	fabsd	%f30,	%f4
	fmovrdgz	%g6,	%f26,	%f16
	fand	%f4,	%f12,	%f8
	fmovsa	%xcc,	%f4,	%f6
	fabss	%f27,	%f20
	subccc	%o3,	0x0DFD,	%i7
	movrlz	%o5,	%l5,	%o4
	ld	[%l7 + 0x68],	%f23
	sllx	%i5,	%l0,	%l1
	subcc	%g5,	0x17B4,	%i6
	sub	%i4,	%l6,	%o1
	fpadd16s	%f10,	%f24,	%f2
	smulcc	%g1,	%o7,	%i3
	edge8n	%l2,	%o2,	%i2
	stw	%g7,	[%l7 + 0x34]
	movne	%xcc,	%o0,	%l4
	lduh	[%l7 + 0x2C],	%g2
	mulscc	%g4,	0x189C,	%g3
	fmovsvc	%xcc,	%f27,	%f14
	st	%f24,	[%l7 + 0x64]
	alignaddrl	%l3,	%i1,	%i0
	or	%o6,	%o3,	%g6
	orcc	%o5,	0x0BAC,	%i7
	edge32n	%l5,	%i5,	%o4
	array32	%l0,	%l1,	%i6
	fornot2	%f22,	%f20,	%f8
	array8	%g5,	%l6,	%i4
	sll	%o1,	%g1,	%i3
	sra	%o7,	0x0B,	%o2
	ldub	[%l7 + 0x52],	%i2
	movre	%g7,	0x223,	%l2
	fmovsgu	%icc,	%f26,	%f28
	edge32ln	%l4,	%g2,	%g4
	restore %o0, %l3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i0,	0x0F18,	%g3
	array8	%o3,	%o6,	%g6
	fmovrde	%i7,	%f12,	%f22
	st	%f11,	[%l7 + 0x2C]
	mova	%icc,	%o5,	%i5
	movre	%l5,	%o4,	%l0
	edge16ln	%i6,	%l1,	%g5
	std	%f2,	[%l7 + 0x10]
	orncc	%i4,	%o1,	%g1
	stb	%i3,	[%l7 + 0x75]
	ldub	[%l7 + 0x7B],	%l6
	popc	%o2,	%o7
	movrne	%i2,	0x04E,	%g7
	movrgez	%l2,	0x0B0,	%g2
	fnot2s	%f20,	%f11
	smul	%l4,	0x0EE3,	%g4
	edge8ln	%o0,	%i1,	%l3
	and	%g3,	0x05B0,	%i0
	movne	%icc,	%o6,	%o3
	ldub	[%l7 + 0x43],	%g6
	sethi	0x0FBD,	%i7
	array16	%i5,	%o5,	%o4
	sub	%l5,	%l0,	%i6
	edge32l	%g5,	%l1,	%o1
	xnor	%g1,	0x1215,	%i3
	fmovscc	%xcc,	%f19,	%f11
	stw	%l6,	[%l7 + 0x1C]
	movcs	%xcc,	%i4,	%o2
	edge32ln	%o7,	%g7,	%l2
	fmul8x16al	%f30,	%f31,	%f16
	andn	%i2,	0x06C7,	%l4
	sth	%g4,	[%l7 + 0x5E]
	movvc	%icc,	%g2,	%o0
	xor	%i1,	%g3,	%l3
	fnegd	%f10,	%f12
	lduw	[%l7 + 0x58],	%i0
	fmul8x16	%f29,	%f8,	%f30
	mulx	%o6,	0x174C,	%g6
	edge16	%i7,	%i5,	%o3
	ld	[%l7 + 0x18],	%f11
	movvs	%icc,	%o4,	%l5
	edge32	%o5,	%l0,	%i6
	sdivx	%l1,	0x07DB,	%o1
	ld	[%l7 + 0x14],	%f0
	edge32	%g1,	%i3,	%l6
	sdivcc	%g5,	0x0AE8,	%o2
	ldsh	[%l7 + 0x34],	%i4
	umulcc	%g7,	0x0E84,	%l2
	sth	%i2,	[%l7 + 0x30]
	movrgz	%o7,	%g4,	%g2
	edge32	%o0,	%l4,	%g3
	ld	[%l7 + 0x38],	%f14
	movrne	%i1,	%l3,	%o6
	sllx	%i0,	%g6,	%i5
	popc	%o3,	%i7
	edge16n	%o4,	%o5,	%l5
	edge32n	%l0,	%l1,	%o1
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	movcc	%xcc,	%g5,	%l6
	faligndata	%f16,	%f14,	%f2
	fpmerge	%f21,	%f1,	%f2
	ld	[%l7 + 0x28],	%f4
	fmovs	%f2,	%f13
	alignaddrl	%o2,	%g7,	%i4
	movl	%xcc,	%i2,	%o7
	st	%f21,	[%l7 + 0x14]
	fmovdn	%icc,	%f8,	%f27
	ldub	[%l7 + 0x22],	%g4
	add	%g2,	%o0,	%l2
	fexpand	%f13,	%f4
	movgu	%icc,	%g3,	%i1
	movre	%l3,	0x336,	%l4
	xnor	%i0,	0x1E41,	%o6
	srl	%g6,	0x17,	%i5
	fpadd32s	%f18,	%f26,	%f10
	stw	%i7,	[%l7 + 0x20]
	addccc	%o3,	%o4,	%l5
	movcs	%icc,	%l0,	%o5
	add	%l1,	0x1633,	%i6
	fpadd16s	%f2,	%f7,	%f12
	ldsw	[%l7 + 0x7C],	%o1
	array32	%i3,	%g1,	%g5
	movrlez	%o2,	0x0E5,	%l6
	movrgz	%i4,	0x2CB,	%i2
	edge32n	%o7,	%g7,	%g4
	fmovsvs	%icc,	%f15,	%f15
	popc	%g2,	%o0
	nop
	set	0x20, %g2
	ldd	[%l7 + %g2],	%g2
	movne	%xcc,	%l2,	%i1
	fmovspos	%xcc,	%f4,	%f24
	smulcc	%l4,	0x023A,	%i0
	andncc	%o6,	%l3,	%g6
	movrlz	%i7,	%i5,	%o4
	st	%f19,	[%l7 + 0x5C]
	orncc	%l5,	0x0CE6,	%o3
	sir	0x1E26
	orcc	%o5,	%l1,	%i6
	fsrc1s	%f30,	%f4
	bshuffle	%f14,	%f18,	%f22
	fands	%f4,	%f30,	%f20
	edge16n	%o1,	%i3,	%l0
	edge16	%g1,	%o2,	%g5
	fmovdg	%icc,	%f0,	%f10
	ld	[%l7 + 0x78],	%f1
	xnor	%l6,	%i4,	%o7
	movneg	%xcc,	%i2,	%g7
	fandnot2s	%f14,	%f7,	%f0
	fmovsne	%xcc,	%f26,	%f4
	addc	%g4,	%g2,	%o0
	edge16	%l2,	%g3,	%i1
	fxor	%f28,	%f18,	%f2
	xor	%i0,	%o6,	%l3
	fmuld8sux16	%f0,	%f10,	%f22
	alignaddr	%g6,	%l4,	%i5
	edge32ln	%o4,	%l5,	%o3
	addcc	%o5,	0x1DBD,	%l1
	movg	%icc,	%i6,	%o1
	for	%f4,	%f14,	%f0
	ldsb	[%l7 + 0x5F],	%i3
	movl	%xcc,	%l0,	%i7
	fpadd32s	%f23,	%f27,	%f30
	orn	%g1,	%g5,	%l6
	mulx	%i4,	%o7,	%i2
	ldx	[%l7 + 0x70],	%g7
	mulx	%o2,	%g2,	%g4
	movg	%icc,	%o0,	%l2
	addccc	%i1,	%g3,	%o6
	sdiv	%l3,	0x1EFA,	%g6
	edge32ln	%i0,	%i5,	%l4
	movcs	%xcc,	%l5,	%o4
	smulcc	%o5,	0x0C0E,	%l1
	movvc	%xcc,	%o3,	%i6
	movgu	%xcc,	%i3,	%o1
	sethi	0x0C0B,	%i7
	movneg	%icc,	%l0,	%g5
	movvs	%icc,	%l6,	%i4
	addcc	%g1,	0x0C76,	%o7
	edge8	%g7,	%o2,	%i2
	smulcc	%g2,	0x14AA,	%o0
	srax	%l2,	%i1,	%g4
	stx	%o6,	[%l7 + 0x18]
	nop
	set	0x36, %o7
	stb	%l3,	[%l7 + %o7]
	orn	%g6,	0x093E,	%i0
	restore %g3, %i5, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%l4,	%o5,	%o4
	movne	%icc,	%o3,	%l1
	edge8	%i6,	%o1,	%i3
	movcs	%icc,	%i7,	%g5
	edge32n	%l6,	%i4,	%l0
	ld	[%l7 + 0x60],	%f15
	edge8l	%o7,	%g7,	%g1
	orncc	%i2,	%o2,	%o0
	stb	%l2,	[%l7 + 0x40]
	edge32l	%i1,	%g4,	%o6
	nop
	set	0x3C, %i7
	ldsh	[%l7 + %i7],	%g2
	subcc	%g6,	0x0971,	%i0
	mulscc	%l3,	0x02E6,	%i5
	ldub	[%l7 + 0x3C],	%l5
	sdivx	%l4,	0x19D9,	%g3
	lduw	[%l7 + 0x4C],	%o5
	array8	%o3,	%l1,	%o4
	andn	%i6,	0x1636,	%i3
	orncc	%i7,	0x16A9,	%o1
	ldsw	[%l7 + 0x40],	%g5
	addcc	%l6,	%l0,	%o7
	ldub	[%l7 + 0x1C],	%g7
	save %i4, 0x0782, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x78],	%i2
	subccc	%o0,	%l2,	%i1
	subc	%o2,	%g4,	%o6
	edge32n	%g2,	%i0,	%g6
	array8	%i5,	%l5,	%l3
	movleu	%xcc,	%l4,	%g3
	movrne	%o3,	%o5,	%o4
	sllx	%l1,	%i3,	%i6
	edge32l	%o1,	%g5,	%l6
	srlx	%l0,	0x1A,	%o7
	edge32	%g7,	%i7,	%g1
	smul	%i2,	0x10DE,	%i4
	movle	%icc,	%l2,	%i1
	subccc	%o2,	0x1924,	%o0
	lduh	[%l7 + 0x5E],	%o6
	array16	%g2,	%i0,	%g6
	subc	%i5,	0x0B01,	%l5
	smul	%l3,	%l4,	%g3
	subcc	%o3,	%o5,	%o4
	fmovdn	%icc,	%f27,	%f23
	edge16	%l1,	%g4,	%i6
	sll	%i3,	%g5,	%l6
	addccc	%o1,	0x12CC,	%o7
	sll	%l0,	%g7,	%g1
	fcmple16	%f8,	%f18,	%i7
	sllx	%i4,	0x16,	%i2
	fpack32	%f20,	%f14,	%f18
	fmuld8sux16	%f17,	%f24,	%f20
	subccc	%i1,	%l2,	%o0
	addcc	%o6,	0x1484,	%g2
	edge16n	%o2,	%i0,	%g6
	lduw	[%l7 + 0x54],	%i5
	sdiv	%l5,	0x1A83,	%l3
	array16	%l4,	%g3,	%o5
	fcmpeq32	%f8,	%f22,	%o4
	fmovdne	%xcc,	%f28,	%f3
	move	%icc,	%o3,	%g4
	mulx	%i6,	0x1305,	%l1
	fmovdn	%xcc,	%f14,	%f0
	subc	%i3,	0x1E0F,	%l6
	umulcc	%o1,	0x0615,	%o7
	fnot2	%f26,	%f14
	sll	%l0,	0x0E,	%g5
	edge8l	%g7,	%g1,	%i4
	fmovdvc	%xcc,	%f24,	%f15
	ld	[%l7 + 0x6C],	%f8
	edge32n	%i7,	%i2,	%l2
	xor	%i1,	%o0,	%g2
	xor	%o6,	0x064C,	%i0
	ldsw	[%l7 + 0x24],	%o2
	subccc	%g6,	0x1767,	%l5
	edge32	%i5,	%l4,	%g3
	orncc	%o5,	0x08C3,	%o4
	fnegs	%f6,	%f0
	addc	%o3,	0x076C,	%l3
	fmovsneg	%icc,	%f6,	%f9
	nop
	set	0x30, %l4
	ldx	[%l7 + %l4],	%i6
	fmovrsgez	%g4,	%f18,	%f0
	srlx	%i3,	%l1,	%l6
	move	%icc,	%o7,	%o1
	pdist	%f28,	%f2,	%f6
	subcc	%l0,	%g5,	%g7
	movcc	%xcc,	%g1,	%i4
	save %i2, 0x0C5D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i1,	%l2,	%o0
	ldub	[%l7 + 0x64],	%o6
	nop
	set	0x58, %i6
	ldsw	[%l7 + %i6],	%i0
	edge8ln	%o2,	%g2,	%g6
	xnorcc	%l5,	%l4,	%i5
	edge16ln	%g3,	%o4,	%o5
	fmul8ulx16	%f28,	%f8,	%f4
	fpadd32	%f4,	%f22,	%f10
	umul	%o3,	0x0EAD,	%i6
	sdiv	%g4,	0x172C,	%i3
	fmovrsgez	%l1,	%f17,	%f8
	xnor	%l3,	%l6,	%o7
	edge8l	%l0,	%o1,	%g7
	umul	%g1,	%i4,	%i2
	sub	%i7,	%i1,	%g5
	xorcc	%o0,	%o6,	%i0
	udivcc	%o2,	0x1B67,	%g2
	fxnor	%f12,	%f0,	%f28
	movrgz	%l2,	%g6,	%l5
	fpsub16s	%f0,	%f12,	%f30
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	fmovscs	%xcc,	%f0,	%f15
	umulcc	%g3,	%o4,	%o5
	fmovsl	%xcc,	%f8,	%f15
	umulcc	%o3,	0x12D3,	%g4
	fsrc2	%f2,	%f10
	orncc	%i6,	0x0131,	%i3
	andn	%l1,	%l6,	%o7
	movle	%xcc,	%l0,	%o1
	addc	%g7,	0x1C0E,	%g1
	array8	%i4,	%i2,	%l3
	fmovdvs	%xcc,	%f8,	%f12
	move	%xcc,	%i7,	%i1
	fmovrdne	%g5,	%f14,	%f26
	edge8n	%o0,	%i0,	%o2
	fmovdle	%icc,	%f30,	%f14
	fcmpne16	%f16,	%f30,	%o6
	srl	%l2,	0x08,	%g6
	stb	%l5,	[%l7 + 0x32]
	array32	%g2,	%i5,	%g3
	movg	%xcc,	%o4,	%o5
	edge8n	%l4,	%o3,	%i6
	fabss	%f8,	%f28
	fcmpes	%fcc2,	%f27,	%f22
	movcs	%xcc,	%g4,	%l1
	movre	%l6,	0x3D0,	%o7
	fmovdpos	%icc,	%f1,	%f23
	sra	%i3,	%l0,	%g7
	fpadd16	%f2,	%f18,	%f14
	fmovdcc	%xcc,	%f30,	%f15
	movvs	%icc,	%g1,	%o1
	orn	%i4,	%i2,	%l3
	orcc	%i1,	0x1162,	%g5
	lduw	[%l7 + 0x6C],	%o0
	smul	%i7,	0x16C1,	%o2
	subc	%i0,	%l2,	%o6
	movcs	%icc,	%g6,	%g2
	fnand	%f26,	%f16,	%f2
	movvs	%xcc,	%l5,	%i5
	andcc	%g3,	0x0893,	%o5
	fnot1	%f2,	%f4
	add	%o4,	0x1A92,	%o3
	xor	%i6,	%l4,	%g4
	fsrc2	%f12,	%f6
	edge32n	%l6,	%o7,	%i3
	andn	%l0,	0x1172,	%g7
	movcs	%xcc,	%g1,	%l1
	movvc	%icc,	%i4,	%i2
	ldsw	[%l7 + 0x18],	%o1
	array8	%l3,	%i1,	%g5
	xnorcc	%o0,	%o2,	%i0
	fmul8x16	%f21,	%f0,	%f22
	nop
	set	0x13, %i0
	ldsb	[%l7 + %i0],	%i7
	mulx	%o6,	0x02BE,	%g6
	sub	%l2,	%g2,	%i5
	addccc	%l5,	0x164F,	%o5
	fpadd16	%f18,	%f22,	%f10
	mova	%icc,	%o4,	%g3
	fpsub16	%f20,	%f20,	%f16
	edge8l	%i6,	%o3,	%l4
	ldsw	[%l7 + 0x20],	%l6
	edge32n	%g4,	%o7,	%l0
	stx	%g7,	[%l7 + 0x68]
	movre	%i3,	0x3FF,	%g1
	fnands	%f29,	%f4,	%f22
	andcc	%l1,	%i2,	%i4
	addc	%l3,	%o1,	%i1
	mova	%icc,	%o0,	%o2
	subc	%g5,	0x1336,	%i7
	fmovdpos	%xcc,	%f0,	%f27
	edge8	%i0,	%o6,	%g6
	fandnot2	%f16,	%f16,	%f10
	sir	0x1711
	restore %l2, 0x1203, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g2,	[%l7 + 0x69]
	fmovdge	%xcc,	%f20,	%f7
	fmovdgu	%xcc,	%f16,	%f10
	sll	%o5,	0x16,	%l5
	fcmpeq16	%f12,	%f8,	%o4
	ldub	[%l7 + 0x68],	%g3
	movrlez	%o3,	%l4,	%l6
	sdivx	%i6,	0x1404,	%g4
	edge8	%o7,	%g7,	%i3
	andcc	%l0,	%g1,	%i2
	edge8	%l1,	%i4,	%l3
	udivcc	%i1,	0x02C3,	%o1
	movrlez	%o2,	0x299,	%o0
	fmovdcs	%icc,	%f16,	%f25
	fandnot1s	%f10,	%f12,	%f3
	fmovdg	%icc,	%f31,	%f26
	mova	%xcc,	%g5,	%i7
	edge8	%o6,	%i0,	%l2
	fcmpgt16	%f20,	%f24,	%i5
	fmovrdgez	%g2,	%f2,	%f10
	fmul8sux16	%f6,	%f2,	%f2
	faligndata	%f22,	%f10,	%f0
	edge16l	%o5,	%l5,	%g6
	edge8n	%g3,	%o3,	%o4
	ld	[%l7 + 0x18],	%f22
	udivx	%l4,	0x1124,	%i6
	xorcc	%g4,	0x0E87,	%l6
	edge32n	%g7,	%o7,	%l0
	std	%f4,	[%l7 + 0x08]
	save %g1, %i3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%i2,	0x0F,	%l3
	for	%f4,	%f2,	%f10
	fabss	%f15,	%f21
	fmovrslz	%i4,	%f25,	%f10
	fmuld8sux16	%f12,	%f30,	%f26
	andn	%o1,	0x0201,	%i1
	ldd	[%l7 + 0x38],	%f6
	edge8l	%o2,	%g5,	%i7
	bshuffle	%f22,	%f8,	%f0
	smul	%o6,	0x12CE,	%i0
	fmovdneg	%icc,	%f11,	%f2
	movrgz	%l2,	%i5,	%g2
	edge8l	%o5,	%o0,	%g6
	fmul8x16	%f29,	%f30,	%f8
	edge32ln	%l5,	%o3,	%g3
	smul	%o4,	%l4,	%g4
	fmul8x16	%f22,	%f2,	%f16
	sth	%l6,	[%l7 + 0x56]
	sll	%g7,	%o7,	%i6
	edge16l	%l0,	%g1,	%i3
	mulx	%i2,	%l1,	%i4
	umul	%o1,	%i1,	%o2
	stw	%g5,	[%l7 + 0x20]
	smul	%l3,	0x18A4,	%i7
	fmovrsgez	%o6,	%f26,	%f14
	nop
	set	0x38, %g3
	std	%f24,	[%l7 + %g3]
	movpos	%icc,	%l2,	%i0
	edge32	%g2,	%o5,	%o0
	edge16l	%g6,	%l5,	%i5
	and	%g3,	%o3,	%o4
	edge32ln	%l4,	%g4,	%l6
	udivx	%o7,	0x13B2,	%i6
	stw	%l0,	[%l7 + 0x10]
	array8	%g7,	%g1,	%i2
	fxnor	%f26,	%f6,	%f24
	fabss	%f25,	%f8
	xor	%l1,	%i4,	%i3
	ldx	[%l7 + 0x28],	%i1
	pdist	%f16,	%f16,	%f22
	movgu	%icc,	%o2,	%g5
	fmovd	%f12,	%f14
	ldub	[%l7 + 0x6F],	%l3
	nop
	set	0x76, %l3
	sth	%i7,	[%l7 + %l3]
	ldd	[%l7 + 0x38],	%f16
	umulcc	%o6,	%l2,	%o1
	movleu	%icc,	%i0,	%g2
	movrlez	%o5,	0x1EA,	%g6
	fpsub32s	%f23,	%f31,	%f19
	save %l5, %o0, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o3,	%o4,	%i5
	movcc	%xcc,	%l4,	%l6
	movrlez	%o7,	0x2F5,	%g4
	movgu	%icc,	%i6,	%g7
	sdiv	%l0,	0x04D6,	%g1
	mulscc	%i2,	0x1497,	%l1
	movneg	%icc,	%i4,	%i1
	edge16n	%i3,	%g5,	%l3
	ldub	[%l7 + 0x6E],	%i7
	movrgez	%o2,	%o6,	%o1
	edge32n	%l2,	%i0,	%g2
	mulscc	%o5,	0x1E48,	%g6
	sra	%o0,	%g3,	%o3
	movn	%icc,	%l5,	%i5
	st	%f8,	[%l7 + 0x60]
	fmovsgu	%xcc,	%f25,	%f29
	fexpand	%f10,	%f10
	movleu	%icc,	%l4,	%o4
	alignaddr	%o7,	%l6,	%g4
	fmovrse	%i6,	%f21,	%f7
	ldub	[%l7 + 0x7E],	%l0
	edge8n	%g1,	%g7,	%i2
	sethi	0x177B,	%i4
	fandnot2	%f16,	%f30,	%f8
	popc	%i1,	%i3
	sub	%l1,	0x0B43,	%g5
	movle	%xcc,	%l3,	%o2
	ldd	[%l7 + 0x18],	%f4
	sra	%i7,	0x10,	%o1
	edge32ln	%o6,	%l2,	%g2
	srax	%o5,	%g6,	%i0
	fmovsn	%xcc,	%f6,	%f29
	ldx	[%l7 + 0x60],	%g3
	array32	%o0,	%l5,	%o3
	ldsw	[%l7 + 0x7C],	%l4
	ldub	[%l7 + 0x0B],	%i5
	fnands	%f15,	%f29,	%f2
	movge	%icc,	%o7,	%o4
	fmovrsne	%l6,	%f23,	%f27
	edge8l	%g4,	%l0,	%i6
	sir	0x00BF
	fmovrdne	%g1,	%f14,	%f10
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	movrgez	%g7,	%i3,	%l1
	fornot1	%f18,	%f24,	%f12
	nop
	set	0x20, %i3
	stx	%l3,	[%l7 + %i3]
	sllx	%o2,	%g5,	%o1
	std	%f22,	[%l7 + 0x68]
	movgu	%xcc,	%o6,	%l2
	andncc	%g2,	%o5,	%g6
	movne	%icc,	%i7,	%i0
	addcc	%g3,	0x0A47,	%l5
	andcc	%o0,	0x10D5,	%l4
	sdivx	%i5,	0x116A,	%o7
	fnor	%f14,	%f12,	%f10
	udiv	%o4,	0x06DB,	%o3
	fmovdne	%xcc,	%f6,	%f20
	fcmple32	%f8,	%f14,	%g4
	ldd	[%l7 + 0x50],	%f6
	movgu	%icc,	%l6,	%l0
	bshuffle	%f10,	%f14,	%f4
	edge16	%i6,	%g1,	%i2
	ldd	[%l7 + 0x38],	%f26
	array32	%i1,	%i4,	%i3
	fmovsge	%icc,	%f4,	%f27
	fmovdcc	%xcc,	%f17,	%f16
	movvs	%icc,	%g7,	%l1
	edge8n	%l3,	%o2,	%g5
	and	%o1,	%l2,	%g2
	ldsh	[%l7 + 0x7C],	%o5
	udivx	%o6,	0x1185,	%g6
	edge8	%i0,	%i7,	%l5
	sll	%g3,	%l4,	%o0
	fpsub32s	%f26,	%f10,	%f27
	fcmpeq16	%f26,	%f0,	%o7
	srl	%i5,	%o4,	%g4
	sethi	0x0EB2,	%l6
	edge8l	%l0,	%i6,	%g1
	move	%icc,	%o3,	%i2
	subcc	%i4,	0x0958,	%i3
	orncc	%g7,	%l1,	%i1
	ldsh	[%l7 + 0x20],	%l3
	ldx	[%l7 + 0x58],	%o2
	sdivx	%o1,	0x1C67,	%g5
	edge16n	%g2,	%o5,	%o6
	fmovdvs	%xcc,	%f18,	%f0
	subcc	%g6,	%i0,	%i7
	edge16	%l2,	%l5,	%l4
	stb	%o0,	[%l7 + 0x7A]
	sllx	%g3,	0x14,	%i5
	movgu	%xcc,	%o4,	%o7
	restore %l6, 0x0113, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%g4,	%i6
	fmovsneg	%xcc,	%f27,	%f16
	fpsub16s	%f16,	%f30,	%f6
	movrlez	%g1,	%o3,	%i4
	movleu	%xcc,	%i2,	%i3
	fmovsn	%icc,	%f6,	%f6
	array32	%l1,	%g7,	%l3
	fnot2	%f10,	%f30
	lduw	[%l7 + 0x7C],	%i1
	fpsub32s	%f14,	%f22,	%f11
	array8	%o1,	%o2,	%g2
	ldsb	[%l7 + 0x1A],	%g5
	ldsb	[%l7 + 0x56],	%o5
	movl	%icc,	%o6,	%i0
	fmovs	%f21,	%f10
	andn	%i7,	%g6,	%l2
	sub	%l4,	0x187A,	%o0
	xnor	%g3,	%i5,	%o4
	fxnors	%f12,	%f9,	%f8
	stb	%o7,	[%l7 + 0x2A]
	fmovdvs	%xcc,	%f3,	%f15
	fmovdvc	%icc,	%f5,	%f9
	addccc	%l5,	0x0887,	%l0
	nop
	set	0x24, %g7
	lduw	[%l7 + %g7],	%g4
	movrlez	%i6,	0x07C,	%l6
	array16	%o3,	%g1,	%i2
	array16	%i3,	%i4,	%l1
	fmovrdne	%l3,	%f6,	%f30
	for	%f16,	%f28,	%f30
	mulscc	%g7,	%i1,	%o2
	ld	[%l7 + 0x70],	%f21
	addcc	%g2,	%g5,	%o5
	orn	%o1,	%o6,	%i0
	fcmpne16	%f10,	%f8,	%g6
	addccc	%i7,	%l4,	%l2
	sllx	%g3,	0x1E,	%o0
	xor	%i5,	0x18A1,	%o4
	edge8	%o7,	%l5,	%l0
	fornot1	%f4,	%f8,	%f30
	array16	%g4,	%i6,	%l6
	fmovd	%f30,	%f22
	fxnors	%f16,	%f14,	%f8
	fmovdge	%xcc,	%f16,	%f31
	sdivcc	%g1,	0x124B,	%i2
	stb	%o3,	[%l7 + 0x57]
	movg	%icc,	%i3,	%i4
	st	%f0,	[%l7 + 0x10]
	sth	%l1,	[%l7 + 0x4E]
	edge32n	%l3,	%g7,	%o2
	mulscc	%g2,	%i1,	%o5
	fpack16	%f10,	%f30
	fmovdge	%xcc,	%f17,	%f10
	movre	%o1,	%o6,	%i0
	movrlez	%g5,	0x064,	%i7
	subc	%l4,	%g6,	%g3
	or	%l2,	0x050D,	%i5
	ldub	[%l7 + 0x7D],	%o4
	movre	%o0,	%l5,	%l0
	movl	%icc,	%o7,	%g4
	edge8l	%i6,	%g1,	%i2
	fmovrdlez	%l6,	%f20,	%f28
	edge32l	%i3,	%i4,	%o3
	movgu	%xcc,	%l3,	%g7
	fmovsge	%xcc,	%f2,	%f18
	orncc	%l1,	0x0193,	%g2
	sth	%o2,	[%l7 + 0x4E]
	sir	0x0F3E
	ldd	[%l7 + 0x38],	%o4
	sethi	0x1066,	%i1
	movgu	%xcc,	%o1,	%o6
	lduw	[%l7 + 0x48],	%i0
	ld	[%l7 + 0x08],	%f17
	pdist	%f22,	%f12,	%f16
	movvs	%icc,	%g5,	%l4
	xnor	%i7,	0x0F57,	%g6
	fnands	%f24,	%f12,	%f30
	fcmple16	%f10,	%f12,	%g3
	fnot1	%f8,	%f8
	addcc	%l2,	%i5,	%o4
	movrlez	%o0,	%l0,	%o7
	popc	%g4,	%i6
	fcmped	%fcc1,	%f28,	%f0
	sir	0x0615
	fmovdcc	%icc,	%f12,	%f8
	stx	%g1,	[%l7 + 0x60]
	save %l5, %i2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i4,	%i3,	%o3
	fnands	%f22,	%f8,	%f6
	smulcc	%l3,	0x1992,	%g7
	alignaddr	%g2,	%l1,	%o5
	sll	%o2,	%i1,	%o1
	addccc	%o6,	%i0,	%l4
	fors	%f15,	%f6,	%f22
	edge8n	%i7,	%g6,	%g3
	or	%g5,	%l2,	%i5
	fmovsl	%xcc,	%f13,	%f1
	movrgez	%o0,	0x3E7,	%l0
	fmovspos	%icc,	%f21,	%f22
	nop
	set	0x34, %i4
	stw	%o7,	[%l7 + %i4]
	subcc	%g4,	0x12C3,	%o4
	umulcc	%g1,	%i6,	%i2
	movcc	%icc,	%l6,	%l5
	fzeros	%f19
	ldx	[%l7 + 0x70],	%i3
	edge16l	%i4,	%l3,	%o3
	udiv	%g2,	0x0AE7,	%l1
	fmovd	%f26,	%f18
	fmovscc	%xcc,	%f26,	%f27
	movrlez	%g7,	%o2,	%o5
	ldub	[%l7 + 0x3F],	%i1
	fxnors	%f21,	%f19,	%f18
	edge16n	%o1,	%o6,	%i0
	srlx	%i7,	%l4,	%g6
	fors	%f18,	%f22,	%f27
	fmovrsgez	%g5,	%f18,	%f4
	sll	%l2,	0x1D,	%g3
	movrlz	%o0,	%i5,	%l0
	fmovsne	%icc,	%f6,	%f2
	movrlz	%g4,	%o7,	%g1
	fpsub32	%f24,	%f0,	%f12
	movrlz	%i6,	%o4,	%i2
	movn	%xcc,	%l6,	%l5
	alignaddr	%i3,	%i4,	%o3
	st	%f11,	[%l7 + 0x38]
	sir	0x1E72
	edge8l	%l3,	%g2,	%g7
	stx	%l1,	[%l7 + 0x50]
	orcc	%o5,	%i1,	%o1
	fmovdne	%icc,	%f14,	%f27
	fcmped	%fcc3,	%f26,	%f26
	srl	%o2,	%o6,	%i7
	lduh	[%l7 + 0x28],	%l4
	xor	%g6,	0x004D,	%g5
	ldd	[%l7 + 0x78],	%i0
	addcc	%g3,	0x1C2B,	%o0
	movrne	%l2,	%l0,	%i5
	fnor	%f2,	%f18,	%f24
	sir	0x0AB4
	fmuld8sux16	%f7,	%f4,	%f20
	sir	0x0609
	edge8	%o7,	%g4,	%g1
	fcmpd	%fcc1,	%f8,	%f14
	st	%f15,	[%l7 + 0x50]
	fnands	%f19,	%f24,	%f6
	fmovsgu	%icc,	%f18,	%f12
	alignaddr	%o4,	%i6,	%i2
	stb	%l6,	[%l7 + 0x35]
	sdiv	%i3,	0x193B,	%l5
	fmovsge	%icc,	%f10,	%f25
	array8	%o3,	%l3,	%g2
	stb	%i4,	[%l7 + 0x40]
	fsrc1s	%f12,	%f0
	stb	%g7,	[%l7 + 0x3E]
	addc	%o5,	%l1,	%i1
	mulscc	%o2,	%o1,	%i7
	fpmerge	%f15,	%f6,	%f0
	edge32n	%o6,	%l4,	%g5
	popc	%i0,	%g6
	or	%o0,	%l2,	%g3
	move	%xcc,	%l0,	%o7
	fnors	%f12,	%f28,	%f8
	addccc	%g4,	0x17B5,	%i5
	movvc	%icc,	%o4,	%i6
	ldx	[%l7 + 0x70],	%i2
	fmovsge	%icc,	%f3,	%f30
	movne	%xcc,	%l6,	%g1
	fnor	%f18,	%f20,	%f6
	srlx	%l5,	%o3,	%l3
	st	%f7,	[%l7 + 0x0C]
	umul	%g2,	%i4,	%i3
	fnand	%f2,	%f8,	%f4
	nop
	set	0x68, %i5
	ldub	[%l7 + %i5],	%o5
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	orncc	%o2,	%g7,	%o1
	sdivx	%i7,	0x0658,	%o6
	andcc	%g5,	%l4,	%g6
	mulx	%o0,	0x137C,	%i0
	array32	%g3,	%l0,	%l2
	stw	%o7,	[%l7 + 0x64]
	srl	%i5,	%g4,	%i6
	fmovda	%icc,	%f1,	%f26
	fmovsvc	%xcc,	%f25,	%f15
	fmul8ulx16	%f6,	%f24,	%f28
	sllx	%i2,	0x13,	%o4
	movne	%xcc,	%l6,	%g1
	fcmpgt16	%f10,	%f6,	%o3
	fors	%f23,	%f22,	%f8
	fmovdleu	%icc,	%f26,	%f18
	sth	%l5,	[%l7 + 0x42]
	ldsh	[%l7 + 0x60],	%g2
	fcmpgt32	%f0,	%f2,	%i4
	sll	%i3,	0x11,	%l3
	umul	%o5,	0x1853,	%l1
	srax	%i1,	%o2,	%g7
	movg	%icc,	%i7,	%o6
	movvc	%xcc,	%o1,	%g5
	ldx	[%l7 + 0x70],	%g6
	movne	%xcc,	%l4,	%o0
	sllx	%i0,	%l0,	%g3
	xor	%l2,	%i5,	%g4
	edge32l	%i6,	%o7,	%o4
	edge16n	%l6,	%i2,	%o3
	sdivx	%g1,	0x06CB,	%l5
	array32	%g2,	%i4,	%i3
	edge8l	%l3,	%l1,	%i1
	udivx	%o2,	0x1CD7,	%o5
	fcmple16	%f8,	%f28,	%i7
	movrne	%o6,	0x23D,	%g7
	movne	%icc,	%o1,	%g5
	movrgz	%g6,	0x337,	%o0
	edge8	%i0,	%l4,	%g3
	andncc	%l0,	%i5,	%l2
	udivx	%g4,	0x190F,	%o7
	sir	0x0823
	popc	0x0760,	%o4
	fmovdl	%icc,	%f21,	%f3
	movcs	%xcc,	%l6,	%i2
	sdivcc	%o3,	0x0D7B,	%g1
	stw	%l5,	[%l7 + 0x6C]
	movpos	%icc,	%i6,	%g2
	orcc	%i4,	0x048C,	%i3
	movvc	%xcc,	%l1,	%i1
	udivx	%o2,	0x0C14,	%o5
	ldd	[%l7 + 0x18],	%l2
	mova	%xcc,	%o6,	%g7
	andn	%o1,	%i7,	%g6
	movrlz	%g5,	0x158,	%o0
	fmovdg	%icc,	%f1,	%f0
	edge16	%l4,	%i0,	%l0
	movpos	%xcc,	%g3,	%l2
	movleu	%xcc,	%i5,	%g4
	edge8l	%o7,	%l6,	%i2
	lduh	[%l7 + 0x38],	%o3
	fmovrsgz	%g1,	%f1,	%f22
	srlx	%o4,	%l5,	%g2
	popc	%i6,	%i4
	fmovsle	%xcc,	%f23,	%f11
	sdivx	%i3,	0x14A6,	%l1
	popc	0x180A,	%i1
	nop
	set	0x1B, %g6
	ldsb	[%l7 + %g6],	%o5
	movge	%icc,	%l3,	%o6
	orncc	%g7,	0x10CB,	%o1
	edge16ln	%i7,	%g6,	%o2
	fmovsvc	%xcc,	%f0,	%f24
	xorcc	%o0,	%g5,	%l4
	movcc	%icc,	%i0,	%g3
	ldd	[%l7 + 0x38],	%f20
	srlx	%l2,	%l0,	%i5
	edge16l	%g4,	%o7,	%l6
	movcc	%xcc,	%i2,	%o3
	ld	[%l7 + 0x34],	%f27
	smul	%g1,	0x120F,	%l5
	fmovsl	%xcc,	%f11,	%f15
	lduh	[%l7 + 0x38],	%g2
	srax	%o4,	%i4,	%i6
	movrgez	%i3,	%i1,	%l1
	fexpand	%f15,	%f20
	fcmpeq16	%f24,	%f4,	%l3
	movleu	%xcc,	%o6,	%g7
	st	%f27,	[%l7 + 0x3C]
	subcc	%o5,	%o1,	%i7
	std	%f18,	[%l7 + 0x70]
	fands	%f14,	%f23,	%f26
	movrlz	%g6,	%o2,	%g5
	edge32ln	%l4,	%o0,	%i0
	movge	%xcc,	%l2,	%l0
	or	%g3,	0x09AC,	%g4
	lduw	[%l7 + 0x18],	%o7
	sdivx	%i5,	0x13D5,	%l6
	fornot2	%f14,	%f4,	%f20
	movrne	%i2,	0x063,	%g1
	movre	%l5,	0x2B2,	%g2
	addccc	%o3,	%o4,	%i4
	sdivcc	%i6,	0x079E,	%i3
	edge8l	%i1,	%l3,	%l1
	std	%f30,	[%l7 + 0x20]
	ldsw	[%l7 + 0x14],	%o6
	save %g7, 0x1241, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i7,	0x0EA9,	%o5
	sdivcc	%g6,	0x1BE6,	%g5
	xnor	%l4,	0x012E,	%o2
	movneg	%xcc,	%i0,	%l2
	smulcc	%o0,	0x179B,	%g3
	subcc	%g4,	%o7,	%i5
	movvs	%icc,	%l6,	%l0
	addc	%g1,	%l5,	%g2
	sub	%i2,	%o3,	%i4
	movge	%icc,	%o4,	%i3
	st	%f27,	[%l7 + 0x5C]
	addccc	%i6,	0x0E54,	%i1
	subccc	%l1,	0x03F3,	%o6
	andn	%g7,	%o1,	%i7
	movrgez	%o5,	%g6,	%g5
	ldd	[%l7 + 0x38],	%f8
	fmovd	%f18,	%f12
	fand	%f30,	%f30,	%f8
	fzero	%f20
	udivcc	%l3,	0x0CEB,	%o2
	movg	%icc,	%i0,	%l2
	and	%l4,	0x0DE6,	%g3
	xorcc	%o0,	0x1E1C,	%o7
	fsrc2s	%f10,	%f25
	st	%f31,	[%l7 + 0x18]
	sra	%g4,	0x07,	%i5
	nop
	set	0x3C, %i1
	ldsh	[%l7 + %i1],	%l6
	xnorcc	%l0,	0x00A7,	%g1
	fmovsne	%xcc,	%f10,	%f24
	fornot2	%f22,	%f18,	%f2
	sdivcc	%l5,	0x18D1,	%i2
	edge32l	%g2,	%i4,	%o3
	srax	%i3,	%i6,	%o4
	fnegd	%f10,	%f24
	movrne	%l1,	%o6,	%i1
	movvs	%icc,	%o1,	%g7
	fands	%f13,	%f28,	%f28
	lduw	[%l7 + 0x6C],	%o5
	fandnot2	%f28,	%f8,	%f2
	srl	%g6,	0x05,	%g5
	stw	%l3,	[%l7 + 0x7C]
	fmovsleu	%icc,	%f28,	%f28
	udivx	%i7,	0x1174,	%o2
	ldsw	[%l7 + 0x6C],	%i0
	movvc	%icc,	%l2,	%l4
	ldsw	[%l7 + 0x6C],	%o0
	xorcc	%o7,	0x1C58,	%g4
	ldsw	[%l7 + 0x5C],	%g3
	edge32ln	%l6,	%i5,	%g1
	movneg	%icc,	%l5,	%i2
	fcmpes	%fcc3,	%f28,	%f19
	movg	%icc,	%l0,	%g2
	ldd	[%l7 + 0x58],	%f28
	fpack16	%f16,	%f8
	ld	[%l7 + 0x6C],	%f27
	edge16	%o3,	%i3,	%i4
	fcmpne32	%f6,	%f4,	%i6
	edge16n	%o4,	%o6,	%l1
	xnor	%i1,	0x0D97,	%g7
	fpadd16s	%f21,	%f7,	%f13
	sdivx	%o5,	0x1A15,	%o1
	and	%g6,	%l3,	%i7
	ld	[%l7 + 0x24],	%f2
	lduh	[%l7 + 0x1E],	%g5
	sethi	0x0AF0,	%i0
	addccc	%l2,	%l4,	%o2
	fmovdle	%icc,	%f11,	%f6
	or	%o7,	0x04A6,	%g4
	xorcc	%o0,	0x1A10,	%g3
	ldsh	[%l7 + 0x36],	%i5
	and	%g1,	%l5,	%i2
	mulx	%l0,	0x00BC,	%l6
	ldsh	[%l7 + 0x44],	%o3
	fmovdcc	%xcc,	%f18,	%f16
	fpadd16	%f22,	%f24,	%f30
	andncc	%g2,	%i3,	%i6
	or	%i4,	0x0BA3,	%o4
	fmovrdne	%o6,	%f8,	%f22
	or	%l1,	%i1,	%o5
	stx	%o1,	[%l7 + 0x48]
	udivx	%g7,	0x113D,	%l3
	fpack32	%f0,	%f4,	%f8
	movn	%icc,	%g6,	%g5
	movgu	%xcc,	%i7,	%i0
	movrgz	%l2,	%o2,	%o7
	pdist	%f12,	%f18,	%f2
	movcc	%xcc,	%l4,	%g4
	fpsub16	%f14,	%f28,	%f0
	edge8	%g3,	%i5,	%g1
	st	%f10,	[%l7 + 0x28]
	fabss	%f15,	%f12
	subcc	%o0,	%i2,	%l0
	sdiv	%l5,	0x126D,	%o3
	ld	[%l7 + 0x5C],	%f28
	xnor	%l6,	%i3,	%g2
	ldsh	[%l7 + 0x6C],	%i6
	srlx	%i4,	0x0B,	%o6
	ldsw	[%l7 + 0x34],	%o4
	fmovscs	%xcc,	%f15,	%f4
	fmovsge	%xcc,	%f1,	%f27
	fcmpgt16	%f0,	%f10,	%l1
	movrgez	%o5,	%i1,	%g7
	movrgz	%o1,	%l3,	%g5
	ldd	[%l7 + 0x48],	%f28
	fmovrdgez	%g6,	%f14,	%f28
	srax	%i0,	0x13,	%i7
	fmovdcs	%xcc,	%f14,	%f10
	fmul8x16	%f2,	%f26,	%f26
	alignaddrl	%o2,	%o7,	%l2
	edge32l	%l4,	%g3,	%i5
	array8	%g1,	%g4,	%o0
	umulcc	%i2,	%l5,	%l0
	fnand	%f20,	%f8,	%f16
	movl	%icc,	%l6,	%o3
	ld	[%l7 + 0x74],	%f20
	st	%f11,	[%l7 + 0x54]
	ldd	[%l7 + 0x60],	%i2
	andcc	%g2,	%i4,	%i6
	movge	%icc,	%o6,	%l1
	ldsh	[%l7 + 0x4A],	%o4
	orncc	%i1,	%g7,	%o5
	movleu	%icc,	%o1,	%l3
	ldsh	[%l7 + 0x42],	%g6
	udiv	%g5,	0x19DF,	%i0
	mulscc	%o2,	0x1706,	%o7
	subccc	%i7,	%l2,	%l4
	smulcc	%i5,	%g1,	%g4
	ldub	[%l7 + 0x29],	%o0
	lduw	[%l7 + 0x38],	%g3
	edge32l	%i2,	%l5,	%l0
	sdivcc	%l6,	0x198D,	%o3
	std	%f24,	[%l7 + 0x48]
	fmovrsgz	%i3,	%f20,	%f4
	edge16l	%g2,	%i4,	%i6
	nop
	set	0x70, %o5
	ldsh	[%l7 + %o5],	%l1
	sllx	%o4,	%o6,	%i1
	movrgz	%g7,	0x25E,	%o1
	addcc	%l3,	%o5,	%g5
	orcc	%g6,	0x05E2,	%o2
	addccc	%o7,	0x1772,	%i0
	fsrc1	%f14,	%f14
	popc	%l2,	%l4
	fmovsneg	%xcc,	%f29,	%f29
	fabss	%f16,	%f7
	ldsb	[%l7 + 0x4B],	%i5
	srax	%i7,	%g4,	%g1
	sra	%o0,	0x15,	%i2
	ldsh	[%l7 + 0x70],	%g3
	fmovspos	%xcc,	%f16,	%f30
	xnor	%l0,	%l6,	%o3
	fmul8sux16	%f30,	%f6,	%f8
	ld	[%l7 + 0x60],	%f29
	fpsub32	%f20,	%f28,	%f24
	stw	%l5,	[%l7 + 0x2C]
	ldub	[%l7 + 0x7C],	%g2
	orn	%i3,	0x1724,	%i4
	movcc	%icc,	%l1,	%o4
	fcmpeq32	%f22,	%f10,	%i6
	alignaddrl	%i1,	%o6,	%g7
	array16	%l3,	%o5,	%o1
	edge16n	%g6,	%g5,	%o2
	mulx	%o7,	%l2,	%l4
	fmovse	%xcc,	%f22,	%f31
	movne	%xcc,	%i0,	%i5
	movrgz	%i7,	%g1,	%g4
	edge16n	%i2,	%o0,	%g3
	lduh	[%l7 + 0x08],	%l0
	fmovrsne	%l6,	%f20,	%f26
	srax	%o3,	0x0C,	%l5
	array32	%g2,	%i4,	%l1
	fornot2s	%f2,	%f7,	%f11
	srl	%o4,	%i3,	%i6
	edge8	%o6,	%i1,	%g7
	xnor	%l3,	%o1,	%g6
	fmovdvs	%xcc,	%f6,	%f4
	movrne	%o5,	%g5,	%o2
	subc	%l2,	%l4,	%o7
	udivcc	%i5,	0x00BB,	%i0
	fand	%f14,	%f0,	%f24
	edge16	%i7,	%g1,	%g4
	array32	%o0,	%g3,	%l0
	sdivx	%l6,	0x0AB7,	%i2
	fnot2	%f22,	%f12
	sir	0x05EE
	umulcc	%o3,	0x0D4C,	%g2
	fands	%f9,	%f31,	%f25
	sllx	%i4,	0x0B,	%l1
	sdivcc	%o4,	0x1AC8,	%i3
	ldsh	[%l7 + 0x70],	%l5
	edge16l	%i6,	%o6,	%g7
	nop
	set	0x08, %l0
	ldd	[%l7 + %l0],	%f22
	stx	%l3,	[%l7 + 0x60]
	stx	%o1,	[%l7 + 0x70]
	orcc	%i1,	%o5,	%g6
	movleu	%xcc,	%g5,	%l2
	umulcc	%l4,	0x0E0F,	%o2
	edge32n	%o7,	%i0,	%i5
	edge8	%g1,	%g4,	%o0
	movne	%xcc,	%i7,	%g3
	andncc	%l6,	%l0,	%o3
	ldub	[%l7 + 0x4C],	%i2
	xor	%g2,	%i4,	%l1
	xor	%i3,	%l5,	%o4
	fzeros	%f1
	subc	%o6,	0x08C3,	%i6
	stx	%l3,	[%l7 + 0x50]
	fmuld8sux16	%f7,	%f20,	%f4
	fcmped	%fcc2,	%f16,	%f24
	fmovsgu	%xcc,	%f30,	%f18
	xor	%g7,	0x06B6,	%i1
	udivcc	%o5,	0x14AD,	%g6
	sdivx	%o1,	0x07B8,	%g5
	orcc	%l4,	0x1377,	%l2
	movrgz	%o2,	%o7,	%i5
	fnand	%f10,	%f30,	%f24
	or	%i0,	0x1D06,	%g4
	umul	%o0,	%i7,	%g1
	fabss	%f0,	%f16
	ldsh	[%l7 + 0x22],	%l6
	stw	%g3,	[%l7 + 0x34]
	fmovdcs	%xcc,	%f10,	%f16
	xnor	%l0,	%o3,	%i2
	movrne	%i4,	%l1,	%g2
	move	%xcc,	%i3,	%l5
	subccc	%o4,	0x089F,	%o6
	edge32n	%l3,	%g7,	%i6
	sir	0x0E32
	st	%f13,	[%l7 + 0x5C]
	ldsb	[%l7 + 0x29],	%o5
	fmovda	%xcc,	%f10,	%f4
	edge16n	%g6,	%i1,	%o1
	srl	%l4,	%g5,	%o2
	fnot1s	%f10,	%f25
	edge32ln	%o7,	%i5,	%l2
	fmovdgu	%xcc,	%f9,	%f13
	edge16l	%i0,	%g4,	%o0
	movg	%icc,	%i7,	%l6
	fandnot2s	%f17,	%f2,	%f17
	movrgz	%g1,	0x1ED,	%l0
	fpsub16s	%f23,	%f15,	%f10
	movleu	%xcc,	%g3,	%o3
	edge16ln	%i2,	%i4,	%g2
	sethi	0x194F,	%i3
	ldsh	[%l7 + 0x74],	%l1
	smulcc	%l5,	%o6,	%l3
	movleu	%xcc,	%g7,	%o4
	save %o5, 0x1969, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f6,	%f27,	%f30
	srlx	%g6,	0x05,	%i1
	for	%f24,	%f0,	%f12
	movl	%icc,	%o1,	%l4
	fsrc2s	%f5,	%f2
	fornot1	%f12,	%f30,	%f28
	move	%icc,	%o2,	%g5
	movn	%icc,	%i5,	%l2
	addc	%o7,	0x1324,	%i0
	sdivcc	%o0,	0x0272,	%g4
	alignaddrl	%l6,	%i7,	%l0
	sra	%g3,	%o3,	%i2
	ldsw	[%l7 + 0x18],	%i4
	edge8	%g1,	%i3,	%l1
	orcc	%g2,	%l5,	%l3
	sir	0x1DED
	andcc	%g7,	%o4,	%o5
	fandnot1s	%f1,	%f21,	%f9
	std	%f4,	[%l7 + 0x48]
	srax	%i6,	%g6,	%i1
	andcc	%o6,	0x03E3,	%o1
	faligndata	%f6,	%f20,	%f22
	and	%l4,	%o2,	%g5
	sllx	%i5,	0x08,	%l2
	sethi	0x0C65,	%o7
	alignaddr	%o0,	%g4,	%l6
	udivcc	%i0,	0x1000,	%l0
	edge8l	%g3,	%i7,	%i2
	movne	%icc,	%o3,	%i4
	ldsw	[%l7 + 0x08],	%g1
	alignaddr	%l1,	%g2,	%l5
	sir	0x08A9
	ldub	[%l7 + 0x57],	%i3
	movcs	%xcc,	%l3,	%o4
	edge16l	%o5,	%i6,	%g7
	ldd	[%l7 + 0x30],	%f28
	sll	%g6,	0x10,	%o6
	sll	%i1,	%l4,	%o1
	nop
	set	0x70, %l6
	ldx	[%l7 + %l6],	%o2
	fornot1	%f18,	%f0,	%f30
	movvc	%icc,	%g5,	%i5
	movne	%xcc,	%o7,	%l2
	subc	%o0,	0x00E9,	%l6
	ldsw	[%l7 + 0x5C],	%i0
	and	%g4,	0x0784,	%g3
	sub	%i7,	%i2,	%o3
	add	%l0,	0x0CD9,	%g1
	fmul8x16al	%f2,	%f7,	%f30
	movg	%xcc,	%i4,	%g2
	movl	%icc,	%l1,	%l5
	st	%f1,	[%l7 + 0x3C]
	edge8n	%l3,	%o4,	%o5
	array32	%i6,	%i3,	%g7
	fmovsgu	%xcc,	%f10,	%f26
	fmovrdgez	%o6,	%f30,	%f28
	sll	%g6,	%i1,	%o1
	movg	%icc,	%o2,	%l4
	fmovrdgz	%g5,	%f28,	%f0
	mova	%icc,	%o7,	%i5
	fmovrdne	%o0,	%f30,	%f30
	fmovsl	%xcc,	%f24,	%f0
	faligndata	%f26,	%f30,	%f30
	addccc	%l6,	0x160F,	%i0
	fmovrslz	%l2,	%f7,	%f2
	sra	%g3,	0x0D,	%g4
	sll	%i7,	%i2,	%o3
	nop
	set	0x20, %o0
	std	%f4,	[%l7 + %o0]
	umulcc	%l0,	0x0D39,	%g1
	movre	%i4,	%g2,	%l1
	andcc	%l3,	%l5,	%o4
	lduw	[%l7 + 0x20],	%o5
	subcc	%i6,	%i3,	%g7
	movrlz	%g6,	%i1,	%o6
	andn	%o1,	0x0E0B,	%l4
	edge8	%g5,	%o2,	%o7
	movre	%o0,	%l6,	%i0
	fmovsleu	%icc,	%f7,	%f8
	movg	%icc,	%i5,	%g3
	andn	%l2,	%g4,	%i2
	sdivx	%i7,	0x13DB,	%o3
	fmul8x16	%f8,	%f14,	%f12
	ldsh	[%l7 + 0x70],	%g1
	xnorcc	%i4,	%l0,	%l1
	edge32ln	%g2,	%l3,	%o4
	fpadd32	%f24,	%f2,	%f20
	fornot2s	%f7,	%f4,	%f6
	sir	0x14DB
	fmovdl	%xcc,	%f6,	%f14
	sllx	%l5,	0x19,	%o5
	movgu	%icc,	%i6,	%i3
	xnorcc	%g6,	0x1F9C,	%i1
	fmovrsne	%g7,	%f21,	%f9
	edge16l	%o6,	%o1,	%g5
	addc	%l4,	%o2,	%o7
	fmovspos	%icc,	%f1,	%f11
	fcmpne32	%f24,	%f2,	%l6
	fmovdgu	%icc,	%f8,	%f23
	ldsw	[%l7 + 0x0C],	%o0
	sll	%i0,	%i5,	%l2
	addc	%g3,	%g4,	%i7
	fpmerge	%f29,	%f3,	%f22
	add	%o3,	%g1,	%i4
	orcc	%l0,	%l1,	%g2
	fcmpd	%fcc1,	%f22,	%f18
	fxor	%f16,	%f8,	%f24
	sir	0x1B42
	movrgez	%i2,	%l3,	%l5
	movcs	%icc,	%o4,	%i6
	mulx	%i3,	%g6,	%o5
	movle	%icc,	%g7,	%i1
	sdivcc	%o6,	0x0280,	%o1
	movpos	%icc,	%g5,	%l4
	alignaddrl	%o2,	%l6,	%o0
	stb	%i0,	[%l7 + 0x13]
	movle	%xcc,	%i5,	%o7
	movrgez	%l2,	%g4,	%i7
	sth	%g3,	[%l7 + 0x26]
	edge8n	%g1,	%o3,	%i4
	restore %l1, 0x1FEE, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%i2,	%g2,	%l5
	fandnot1	%f14,	%f24,	%f0
	fnot1s	%f7,	%f14
	andn	%o4,	%i6,	%i3
	and	%l3,	0x00D3,	%o5
	fmovs	%f26,	%f22
	fcmps	%fcc1,	%f24,	%f24
	ld	[%l7 + 0x28],	%f3
	movgu	%icc,	%g6,	%g7
	fmovdcs	%xcc,	%f24,	%f26
	std	%f22,	[%l7 + 0x60]
	fmovrdlz	%i1,	%f2,	%f14
	orcc	%o1,	0x1E9E,	%o6
	alignaddrl	%l4,	%g5,	%o2
	addccc	%l6,	%o0,	%i5
	ldd	[%l7 + 0x50],	%i0
	fmovrslez	%l2,	%f23,	%f17
	fmovdpos	%icc,	%f7,	%f8
	st	%f29,	[%l7 + 0x40]
	movgu	%xcc,	%o7,	%i7
	subcc	%g3,	0x07D5,	%g4
	popc	%g1,	%o3
	alignaddrl	%i4,	%l1,	%l0
	fcmpes	%fcc0,	%f25,	%f9
	andncc	%i2,	%g2,	%o4
	orn	%l5,	0x14B0,	%i6
	ldsb	[%l7 + 0x7A],	%i3
	ldsb	[%l7 + 0x1B],	%o5
	fmovdcs	%icc,	%f8,	%f0
	array8	%l3,	%g6,	%i1
	mulx	%g7,	0x080A,	%o6
	ldsh	[%l7 + 0x26],	%l4
	addcc	%o1,	0x08AF,	%g5
	fnors	%f10,	%f6,	%f28
	st	%f31,	[%l7 + 0x50]
	umul	%o2,	%l6,	%o0
	fpadd16s	%f4,	%f17,	%f9
	movcs	%xcc,	%i5,	%i0
	fpadd16	%f26,	%f2,	%f10
	fmovrdgez	%l2,	%f8,	%f22
	udivx	%o7,	0x15A1,	%g3
	ldd	[%l7 + 0x10],	%f22
	mulscc	%g4,	%g1,	%o3
	fmovrde	%i4,	%f30,	%f22
	orcc	%l1,	%l0,	%i2
	save %i7, 0x0C3C, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	%l5,	%i3
	movgu	%icc,	%i6,	%o5
	fnegs	%f26,	%f13
	movgu	%icc,	%l3,	%i1
	orcc	%g6,	%g7,	%o6
	ldd	[%l7 + 0x48],	%f14
	std	%f6,	[%l7 + 0x70]
	edge32ln	%l4,	%g5,	%o2
	addcc	%l6,	0x0E98,	%o0
	st	%f7,	[%l7 + 0x60]
	sllx	%i5,	0x0B,	%o1
	srax	%l2,	0x0A,	%i0
	udiv	%g3,	0x0B05,	%g4
	alignaddrl	%g1,	%o3,	%o7
	subccc	%l1,	%l0,	%i4
	nop
	set	0x54, %g4
	lduw	[%l7 + %g4],	%i7
	fmovda	%xcc,	%f7,	%f4
	fand	%f10,	%f30,	%f26
	andncc	%o4,	%i2,	%l5
	edge32ln	%g2,	%i3,	%i6
	fmovrdlz	%o5,	%f2,	%f8
	ldsh	[%l7 + 0x72],	%i1
	movl	%xcc,	%l3,	%g7
	addccc	%g6,	0x19F4,	%o6
	xor	%g5,	%o2,	%l4
	nop
	set	0x78, %l2
	ldd	[%l7 + %l2],	%i6
	stw	%i5,	[%l7 + 0x10]
	and	%o0,	%o1,	%l2
	fmovdvc	%icc,	%f0,	%f0
	sethi	0x1184,	%i0
	fors	%f23,	%f4,	%f25
	fmovspos	%xcc,	%f17,	%f1
	stw	%g3,	[%l7 + 0x48]
	addc	%g1,	0x0EC7,	%g4
	fmovsg	%xcc,	%f21,	%f6
	edge16n	%o3,	%l1,	%o7
	ldx	[%l7 + 0x68],	%l0
	mova	%xcc,	%i4,	%o4
	st	%f10,	[%l7 + 0x58]
	std	%f12,	[%l7 + 0x70]
	popc	%i2,	%i7
	popc	0x042B,	%l5
	subc	%i3,	0x1FCF,	%g2
	xnor	%o5,	%i1,	%i6
	addcc	%g7,	0x1281,	%g6
	movrgz	%o6,	%g5,	%l3
	umulcc	%o2,	%l6,	%i5
	lduw	[%l7 + 0x4C],	%l4
	fone	%f24
	std	%f22,	[%l7 + 0x78]
	orncc	%o1,	0x1F1D,	%l2
	sdiv	%o0,	0x0B13,	%i0
	move	%xcc,	%g1,	%g4
	addcc	%g3,	0x10D4,	%o3
	fmul8sux16	%f18,	%f24,	%f16
	sdivcc	%o7,	0x17AB,	%l0
	sll	%l1,	0x19,	%o4
	fmovrslez	%i2,	%f19,	%f14
	movpos	%icc,	%i4,	%i7
	sdivx	%i3,	0x1795,	%g2
	fabss	%f21,	%f25
	fmovdle	%icc,	%f24,	%f17
	subc	%o5,	%l5,	%i6
	movcs	%xcc,	%i1,	%g7
	edge16n	%o6,	%g5,	%l3
	edge32n	%g6,	%o2,	%i5
	edge32	%l6,	%l4,	%o1
	xnorcc	%o0,	0x1F2A,	%l2
	movl	%xcc,	%g1,	%i0
	mova	%icc,	%g3,	%g4
	srax	%o3,	%l0,	%o7
	fandnot1	%f10,	%f20,	%f16
	movrlez	%o4,	%i2,	%i4
	fones	%f3
	fxor	%f16,	%f8,	%f2
	xnorcc	%l1,	%i3,	%i7
	movcs	%icc,	%o5,	%g2
	fcmpes	%fcc3,	%f27,	%f13
	addc	%i6,	0x194B,	%i1
	addcc	%g7,	0x0891,	%o6
	fmovsa	%icc,	%f14,	%f1
	fmovrse	%l5,	%f0,	%f15
	ldx	[%l7 + 0x38],	%g5
	smulcc	%l3,	0x091B,	%o2
	movn	%xcc,	%i5,	%g6
	umul	%l6,	%l4,	%o1
	srlx	%o0,	%l2,	%i0
	udivx	%g1,	0x1EA9,	%g4
	ldd	[%l7 + 0x60],	%f30
	fmovsneg	%xcc,	%f27,	%f0
	ldsh	[%l7 + 0x74],	%o3
	movneg	%xcc,	%l0,	%o7
	movcs	%icc,	%o4,	%g3
	udivcc	%i2,	0x1729,	%l1
	movvs	%icc,	%i3,	%i4
	xnor	%o5,	0x0B1F,	%g2
	st	%f17,	[%l7 + 0x40]
	orcc	%i7,	0x1C16,	%i1
	fmovscs	%xcc,	%f1,	%f11
	subc	%g7,	%o6,	%i6
	std	%f12,	[%l7 + 0x18]
	udivcc	%g5,	0x11C9,	%l5
	movgu	%xcc,	%o2,	%l3
	subcc	%i5,	0x0E2A,	%l6
	fcmpgt16	%f4,	%f4,	%g6
	mova	%icc,	%l4,	%o0
	sdivcc	%l2,	0x0BF1,	%i0
	movge	%icc,	%o1,	%g1
	fmovrsgez	%g4,	%f28,	%f30
	array16	%o3,	%o7,	%l0
	movrne	%o4,	%g3,	%i2
	fornot2	%f28,	%f8,	%f10
	addcc	%i3,	%l1,	%i4
	srl	%g2,	0x15,	%i7
	nop
	set	0x2D, %g1
	ldub	[%l7 + %g1],	%o5
	array16	%g7,	%o6,	%i1
	movre	%i6,	0x08C,	%l5
	udiv	%o2,	0x18B6,	%l3
	fmovsvc	%xcc,	%f10,	%f5
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	fandnot1	%f26,	%f14,	%f28
	movvs	%xcc,	%g6,	%l6
	udivx	%l4,	0x1FAC,	%o0
	udivcc	%l2,	0x0488,	%i0
	addc	%g1,	0x01DB,	%g4
	movl	%icc,	%o1,	%o3
	movneg	%xcc,	%l0,	%o4
	restore %g3, %i2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvc	%icc,	%f3,	%f20
	orn	%o7,	0x03B5,	%i4
	sir	0x16CB
	movre	%l1,	%i7,	%g2
	fmovsle	%xcc,	%f10,	%f17
	edge8n	%o5,	%o6,	%i1
	edge32l	%g7,	%i6,	%l5
	array8	%o2,	%i5,	%l3
	edge32ln	%g5,	%l6,	%g6
	andn	%l4,	0x037C,	%o0
	srlx	%l2,	0x14,	%g1
	movle	%icc,	%i0,	%o1
	edge8ln	%o3,	%g4,	%l0
	addccc	%o4,	%i2,	%i3
	movge	%icc,	%g3,	%i4
	andn	%l1,	0x0B2A,	%o7
	fpack32	%f16,	%f18,	%f20
	movrlez	%g2,	0x2EF,	%i7
	sdivx	%o6,	0x059D,	%o5
	save %i1, 0x0927, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i6,	0x1340,	%o2
	srax	%i5,	%l3,	%g5
	movne	%xcc,	%l5,	%l6
	fnor	%f4,	%f0,	%f28
	movge	%icc,	%g6,	%o0
	edge16n	%l4,	%g1,	%i0
	and	%l2,	%o1,	%g4
	orn	%l0,	%o4,	%o3
	fmovdge	%xcc,	%f12,	%f2
	edge16l	%i3,	%i2,	%g3
	pdist	%f12,	%f18,	%f8
	fandnot1	%f22,	%f20,	%f20
	udivx	%i4,	0x02F6,	%l1
	movrlz	%o7,	%g2,	%i7
	orcc	%o5,	%o6,	%g7
	movpos	%icc,	%i1,	%i6
	fmuld8ulx16	%f13,	%f17,	%f28
	move	%icc,	%o2,	%i5
	fornot1s	%f15,	%f1,	%f17
	srax	%l3,	0x02,	%l5
	movneg	%icc,	%g5,	%g6
	sra	%o0,	0x12,	%l4
	xor	%g1,	0x0AD2,	%i0
	srax	%l6,	%l2,	%g4
	movneg	%xcc,	%l0,	%o1
	edge16n	%o3,	%i3,	%i2
	fmovdne	%icc,	%f27,	%f13
	movrgz	%g3,	0x2E1,	%o4
	fmovd	%f28,	%f18
	movvs	%icc,	%l1,	%i4
	fzero	%f4
	fpsub32	%f6,	%f16,	%f8
	andcc	%g2,	0x0147,	%i7
	subcc	%o7,	%o5,	%g7
	or	%i1,	%o6,	%i6
	stb	%o2,	[%l7 + 0x4F]
	subcc	%i5,	0x0E08,	%l5
	sir	0x1C0F
	fornot1	%f2,	%f24,	%f24
	ldd	[%l7 + 0x20],	%g4
	fxors	%f5,	%f24,	%f18
	xorcc	%l3,	0x1A19,	%g6
	smul	%l4,	%o0,	%g1
	fone	%f22
	edge32	%i0,	%l2,	%l6
	xor	%l0,	0x048D,	%o1
	fpsub16	%f20,	%f6,	%f20
	sethi	0x06EC,	%o3
	array32	%i3,	%i2,	%g3
	popc	0x1D18,	%o4
	edge8	%g4,	%l1,	%g2
	edge16ln	%i4,	%i7,	%o5
	alignaddrl	%o7,	%i1,	%o6
	fmovde	%icc,	%f31,	%f19
	movvc	%icc,	%g7,	%o2
	move	%icc,	%i6,	%l5
	edge16ln	%i5,	%l3,	%g5
	popc	%l4,	%g6
	movcs	%xcc,	%g1,	%i0
	xorcc	%l2,	%o0,	%l6
	array32	%o1,	%l0,	%i3
	subccc	%i2,	%o3,	%g3
	smul	%g4,	0x1BF6,	%l1
	st	%f13,	[%l7 + 0x58]
	ldsh	[%l7 + 0x4A],	%g2
	movpos	%xcc,	%i4,	%o4
	move	%icc,	%i7,	%o5
	movcs	%xcc,	%o7,	%i1
	fcmpes	%fcc2,	%f10,	%f8
	edge32ln	%o6,	%o2,	%g7
	movge	%xcc,	%i6,	%l5
	movrgez	%i5,	%l3,	%g5
	fmovdle	%xcc,	%f17,	%f21
	sra	%l4,	%g1,	%i0
	udiv	%g6,	0x0217,	%o0
	udivx	%l2,	0x0612,	%l6
	fmovrslz	%l0,	%f12,	%f16
	fmovdle	%xcc,	%f8,	%f10
	sdivcc	%i3,	0x1B5C,	%i2
	fmovrde	%o1,	%f2,	%f16
	xnor	%o3,	0x0D3C,	%g4
	lduh	[%l7 + 0x24],	%l1
	fcmpne32	%f10,	%f2,	%g3
	save %i4, %g2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%i7,	%o7,	%o5
	and	%o6,	0x03A6,	%i1
	and	%o2,	0x0672,	%i6
	subccc	%l5,	0x0BB3,	%i5
	edge16	%l3,	%g5,	%l4
	ldd	[%l7 + 0x18],	%f2
	ldsh	[%l7 + 0x62],	%g7
	popc	0x1E81,	%i0
	movge	%icc,	%g1,	%o0
	movle	%icc,	%l2,	%l6
	alignaddrl	%g6,	%i3,	%i2
	ldsw	[%l7 + 0x1C],	%l0
	addccc	%o1,	%g4,	%o3
	stx	%g3,	[%l7 + 0x40]
	sir	0x0796
	addccc	%i4,	%g2,	%o4
	umul	%i7,	%l1,	%o7
	std	%f20,	[%l7 + 0x28]
	ldx	[%l7 + 0x70],	%o6
	addcc	%i1,	0x0BB2,	%o2
	edge32n	%o5,	%i6,	%l5
	fpsub32	%f0,	%f20,	%f22
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	movvc	%icc,	%g5,	%g7
	std	%f6,	[%l7 + 0x30]
	subc	%g1,	0x085D,	%o0
	ldsh	[%l7 + 0x12],	%i0
	movne	%xcc,	%l2,	%g6
	move	%icc,	%i3,	%i2
	movpos	%xcc,	%l0,	%o1
	fornot1	%f10,	%f22,	%f12
	st	%f26,	[%l7 + 0x08]
	movrlez	%l6,	%o3,	%g4
	lduh	[%l7 + 0x42],	%i4
	umul	%g3,	0x00A6,	%g2
	mova	%xcc,	%o4,	%i7
	move	%icc,	%l1,	%o6
	nop
	set	0x18, %o6
	ldx	[%l7 + %o6],	%o7
	movcc	%xcc,	%o2,	%i1
	udivx	%i6,	0x14C6,	%l5
	fmovdne	%xcc,	%f3,	%f9
	movvs	%icc,	%i5,	%o5
	sir	0x17EB
	fmovsle	%xcc,	%f8,	%f18
	fcmpgt16	%f22,	%f2,	%l3
	addc	%g5,	0x15B0,	%l4
	or	%g7,	%g1,	%o0
	smul	%i0,	0x1EF9,	%g6
	mulx	%l2,	0x1FE1,	%i2
	edge16ln	%i3,	%l0,	%l6
	movle	%icc,	%o3,	%o1
	movrne	%i4,	0x29C,	%g3
	mulx	%g4,	%o4,	%g2
	movpos	%icc,	%l1,	%o6
	andcc	%i7,	0x1407,	%o2
	fcmple16	%f24,	%f22,	%i1
	movre	%i6,	%l5,	%i5
	andn	%o7,	%o5,	%g5
	ldsh	[%l7 + 0x56],	%l4
	fmovrslez	%g7,	%f15,	%f11
	ldd	[%l7 + 0x78],	%g0
	fnot2	%f16,	%f30
	sth	%o0,	[%l7 + 0x56]
	fnot1	%f2,	%f0
	srlx	%i0,	%g6,	%l2
	stx	%l3,	[%l7 + 0x68]
	fmul8sux16	%f28,	%f16,	%f30
	fpadd32	%f18,	%f10,	%f0
	fmovdn	%icc,	%f12,	%f14
	srl	%i3,	0x0A,	%i2
	movn	%icc,	%l6,	%o3
	st	%f31,	[%l7 + 0x78]
	lduh	[%l7 + 0x24],	%o1
	restore %l0, 0x183A, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g4,	%g3,	%o4
	fmovscc	%xcc,	%f21,	%f31
	fnands	%f29,	%f22,	%f25
	array8	%g2,	%l1,	%i7
	ldd	[%l7 + 0x70],	%o2
	andcc	%o6,	0x0681,	%i1
	fmul8x16au	%f23,	%f4,	%f26
	popc	%l5,	%i6
	andn	%o7,	0x156D,	%i5
	save %g5, %o5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g7,	%o0,	%i0
	smulcc	%g1,	%l2,	%l3
	srl	%g6,	0x10,	%i3
	stx	%l6,	[%l7 + 0x58]
	addccc	%i2,	0x039A,	%o1
	movg	%icc,	%o3,	%l0
	umul	%g4,	0x16EF,	%i4
	fmovdn	%icc,	%f20,	%f8
	array32	%g3,	%g2,	%o4
	udiv	%l1,	0x16DA,	%i7
	and	%o6,	%o2,	%l5
	andcc	%i1,	0x048D,	%i6
	faligndata	%f26,	%f2,	%f24
	edge8l	%i5,	%o7,	%o5
	fabss	%f22,	%f27
	lduw	[%l7 + 0x28],	%l4
	movne	%icc,	%g5,	%o0
	fmul8x16	%f3,	%f6,	%f18
	movre	%i0,	0x3EE,	%g7
	andncc	%l2,	%l3,	%g1
	fand	%f22,	%f8,	%f26
	array32	%g6,	%i3,	%i2
	stb	%o1,	[%l7 + 0x29]
	movcs	%icc,	%l6,	%l0
	sir	0x0072
	fmul8x16	%f19,	%f22,	%f0
	movg	%xcc,	%g4,	%o3
	sethi	0x17A9,	%i4
	movvc	%icc,	%g3,	%o4
	udiv	%g2,	0x18CC,	%i7
	fornot2s	%f21,	%f14,	%f17
	edge8n	%l1,	%o2,	%o6
	xnor	%i1,	%l5,	%i5
	movne	%icc,	%o7,	%i6
	movrne	%l4,	0x10F,	%g5
	smul	%o0,	%o5,	%i0
	mulscc	%l2,	%g7,	%g1
	fsrc1	%f30,	%f4
	mova	%xcc,	%g6,	%l3
	addcc	%i3,	0x14B8,	%i2
	fpack32	%f10,	%f6,	%f22
	edge8	%l6,	%o1,	%g4
	xorcc	%l0,	0x0CD5,	%o3
	mulscc	%g3,	0x1626,	%i4
	fmul8ulx16	%f16,	%f10,	%f26
	save %g2, %i7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%o4,	%f14,	%f17
	addccc	%o6,	0x0855,	%o2
	fmovrslz	%i1,	%f26,	%f21
	edge16l	%i5,	%o7,	%i6
	edge8n	%l4,	%g5,	%l5
	xor	%o0,	%i0,	%l2
	fmovrde	%g7,	%f22,	%f26
	add	%o5,	0x07C2,	%g6
	sdivx	%g1,	0x199C,	%i3
	sdivx	%l3,	0x15C8,	%i2
	movge	%xcc,	%o1,	%l6
	lduh	[%l7 + 0x1A],	%g4
	addcc	%l0,	%g3,	%i4
	srlx	%g2,	%i7,	%o3
	fcmple32	%f6,	%f16,	%o4
	orcc	%l1,	0x1348,	%o6
	save %o2, %i1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	addcc	%i6,	0x1B22,	%l5
	alignaddr	%i0,	%l2,	%o0
	movpos	%xcc,	%o5,	%g7
	array32	%g6,	%i3,	%g1
	edge32l	%i2,	%l3,	%l6
	ldd	[%l7 + 0x60],	%f8
	srl	%g4,	0x05,	%l0
	sth	%o1,	[%l7 + 0x20]
	fsrc1	%f0,	%f12
	fpack32	%f4,	%f18,	%f18
	umul	%i4,	0x084B,	%g3
	xorcc	%i7,	%o3,	%g2
	xorcc	%l1,	0x192B,	%o4
	edge32l	%o6,	%o2,	%i1
	fmovsvc	%icc,	%f27,	%f17
	srlx	%i5,	0x04,	%o7
	edge8l	%l4,	%i6,	%l5
	edge16l	%i0,	%l2,	%o0
	orn	%g5,	%g7,	%g6
	addc	%o5,	0x193C,	%g1
	smul	%i2,	%l3,	%i3
	movcc	%icc,	%l6,	%g4
	smulcc	%l0,	%o1,	%i4
	ldsh	[%l7 + 0x68],	%g3
	edge8l	%i7,	%o3,	%l1
	edge8n	%o4,	%g2,	%o2
	sllx	%i1,	0x1F,	%o6
	subc	%o7,	%l4,	%i5
	siam	0x7
	umul	%l5,	0x07BA,	%i0
	fmovsg	%xcc,	%f30,	%f5
	ldd	[%l7 + 0x58],	%i6
	subc	%l2,	%o0,	%g5
	edge32	%g6,	%o5,	%g1
	movrlz	%g7,	%l3,	%i2
	mova	%xcc,	%l6,	%g4
	fandnot1	%f0,	%f30,	%f20
	movcc	%xcc,	%l0,	%o1
	edge16	%i3,	%g3,	%i4
	array16	%i7,	%l1,	%o4
	movn	%xcc,	%o3,	%g2
	fcmpgt16	%f16,	%f22,	%o2
	sll	%o6,	%o7,	%i1
	stw	%i5,	[%l7 + 0x54]
	sdivx	%l4,	0x12A3,	%l5
	movcc	%xcc,	%i0,	%l2
	addcc	%o0,	%i6,	%g5
	andncc	%o5,	%g6,	%g7
	edge32n	%l3,	%i2,	%l6
	alignaddrl	%g1,	%g4,	%o1
	movvc	%xcc,	%l0,	%i3
	array32	%g3,	%i4,	%i7
	edge16	%l1,	%o3,	%g2
	fmovdleu	%icc,	%f11,	%f27
	edge16ln	%o2,	%o6,	%o4
	stx	%o7,	[%l7 + 0x28]
	edge16ln	%i5,	%l4,	%l5
	save %i0, %i1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l2,	0x18FA,	%i6
	array16	%o5,	%g5,	%g7
	movcs	%icc,	%l3,	%i2
	movneg	%icc,	%l6,	%g1
	movl	%icc,	%g4,	%o1
	popc	0x17B2,	%l0
	sub	%g6,	%i3,	%i4
	alignaddr	%g3,	%i7,	%l1
	udivx	%o3,	0x1760,	%g2
	stx	%o6,	[%l7 + 0x50]
	fmovde	%xcc,	%f25,	%f11
	smulcc	%o2,	%o4,	%o7
	smulcc	%i5,	%l4,	%i0
	movneg	%icc,	%i1,	%o0
	movne	%xcc,	%l2,	%l5
	stb	%i6,	[%l7 + 0x7D]
	smul	%g5,	%g7,	%l3
	fpmerge	%f0,	%f4,	%f30
	andncc	%i2,	%o5,	%g1
	xorcc	%g4,	%l6,	%l0
	xorcc	%g6,	%o1,	%i4
	ldub	[%l7 + 0x2F],	%g3
	stx	%i3,	[%l7 + 0x08]
	movrlez	%l1,	0x21E,	%i7
	orcc	%g2,	0x0DAB,	%o6
	mulx	%o2,	%o4,	%o7
	ldsh	[%l7 + 0x76],	%o3
	mulx	%i5,	0x0288,	%i0
	movne	%xcc,	%i1,	%l4
	nop
	set	0x68, %o2
	stw	%o0,	[%l7 + %o2]
	ldsb	[%l7 + 0x2F],	%l5
	xorcc	%i6,	%l2,	%g7
	movvs	%icc,	%g5,	%i2
	addc	%l3,	0x1726,	%g1
	addc	%o5,	0x1F3D,	%l6
	std	%f0,	[%l7 + 0x60]
	mulscc	%l0,	%g6,	%o1
	fmovsa	%xcc,	%f11,	%f17
	orcc	%i4,	0x0195,	%g3
	nop
	set	0x6C, %l5
	lduw	[%l7 + %l5],	%g4
	array16	%l1,	%i3,	%g2
	sdiv	%o6,	0x174A,	%i7
	movge	%xcc,	%o2,	%o7
	ldub	[%l7 + 0x25],	%o4
	edge8ln	%i5,	%i0,	%i1
	alignaddrl	%l4,	%o3,	%o0
	edge8l	%i6,	%l5,	%g7
	fmovsne	%xcc,	%f0,	%f15
	edge8l	%g5,	%l2,	%i2
	udivcc	%l3,	0x0002,	%o5
	sllx	%l6,	%g1,	%l0
	fmovdgu	%icc,	%f16,	%f7
	movrgz	%o1,	%i4,	%g3
	stx	%g4,	[%l7 + 0x60]
	fmovspos	%icc,	%f1,	%f23
	subcc	%g6,	%l1,	%i3
	edge32l	%g2,	%o6,	%i7
	edge32n	%o2,	%o4,	%i5
	subcc	%i0,	%o7,	%i1
	edge8ln	%l4,	%o0,	%i6
	array8	%o3,	%l5,	%g5
	xorcc	%g7,	%l2,	%i2
	array8	%l3,	%o5,	%l6
	movvc	%xcc,	%g1,	%o1
	edge32	%l0,	%i4,	%g3
	edge16ln	%g4,	%l1,	%i3
	addcc	%g6,	0x162D,	%g2
	edge16ln	%o6,	%o2,	%i7
	fmovsn	%xcc,	%f14,	%f1
	lduh	[%l7 + 0x58],	%o4
	andn	%i5,	0x1CB9,	%o7
	addc	%i1,	%l4,	%o0
	movg	%icc,	%i6,	%o3
	movn	%icc,	%i0,	%g5
	edge8	%l5,	%l2,	%i2
	mulx	%l3,	%g7,	%l6
	stx	%g1,	[%l7 + 0x38]
	fnands	%f28,	%f30,	%f27
	ld	[%l7 + 0x50],	%f15
	sra	%o1,	0x0E,	%o5
	fmovsgu	%icc,	%f23,	%f18
	lduh	[%l7 + 0x4A],	%i4
	fmul8sux16	%f2,	%f10,	%f14
	nop
	set	0x7C, %g5
	lduw	[%l7 + %g5],	%g3
	array8	%g4,	%l0,	%l1
	sdivcc	%g6,	0x09FD,	%g2
	fandnot2	%f16,	%f6,	%f10
	array8	%i3,	%o2,	%o6
	fmovrsgez	%o4,	%f24,	%f26
	fnands	%f4,	%f14,	%f11
	sir	0x0635
	fcmpgt32	%f12,	%f0,	%i7
	sllx	%o7,	%i5,	%i1
	movre	%l4,	%o0,	%i6
	mulscc	%i0,	0x0B51,	%g5
	fmovse	%icc,	%f16,	%f14
	movpos	%xcc,	%o3,	%l5
	fors	%f26,	%f5,	%f19
	movleu	%icc,	%l2,	%l3
	st	%f14,	[%l7 + 0x1C]
	array16	%g7,	%i2,	%g1
	array16	%o1,	%o5,	%i4
	movrne	%g3,	%g4,	%l6
	fmovdneg	%icc,	%f20,	%f16
	edge16	%l0,	%g6,	%l1
	edge8ln	%g2,	%i3,	%o6
	movpos	%xcc,	%o4,	%o2
	movneg	%xcc,	%i7,	%o7
	lduh	[%l7 + 0x78],	%i1
	edge8l	%l4,	%o0,	%i5
	stw	%i0,	[%l7 + 0x2C]
	sdivcc	%g5,	0x1EA1,	%o3
	udivx	%l5,	0x1B9B,	%l2
	addc	%i6,	%g7,	%l3
	smulcc	%g1,	0x0BCC,	%i2
	edge16	%o1,	%i4,	%o5
	sir	0x04B7
	smulcc	%g4,	%g3,	%l6
	movcs	%xcc,	%l0,	%l1
	array8	%g2,	%i3,	%g6
	movcs	%xcc,	%o4,	%o6
	subccc	%i7,	%o2,	%o7
	fmovsvs	%icc,	%f18,	%f29
	fabss	%f2,	%f16
	umulcc	%l4,	0x1A52,	%o0
	ld	[%l7 + 0x18],	%f15
	movn	%icc,	%i5,	%i0
	movneg	%xcc,	%g5,	%o3
	fnot2	%f20,	%f10
	fcmps	%fcc1,	%f11,	%f0
	xorcc	%l5,	%i1,	%i6
	orn	%l2,	%g7,	%g1
	fmovscs	%icc,	%f25,	%f31
	fnor	%f14,	%f14,	%f24
	movre	%i2,	%l3,	%i4
	fmovspos	%icc,	%f16,	%f5
	ld	[%l7 + 0x3C],	%f28
	fandnot1s	%f13,	%f18,	%f30
	movre	%o1,	0x32F,	%g4
	save %g3, 0x1CFF, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f18,	%f6,	%l6
	fnors	%f18,	%f15,	%f28
	fmovsa	%icc,	%f9,	%f30
	orncc	%l1,	%l0,	%g2
	fmovscs	%xcc,	%f1,	%f5
	sllx	%i3,	%g6,	%o6
	fmuld8sux16	%f22,	%f28,	%f10
	edge32n	%i7,	%o2,	%o7
	edge16ln	%l4,	%o0,	%i5
	mulscc	%i0,	%o4,	%g5
	ldx	[%l7 + 0x60],	%o3
	addccc	%l5,	0x0E0F,	%i1
	lduh	[%l7 + 0x3E],	%l2
	edge32n	%i6,	%g7,	%i2
	fsrc2s	%f20,	%f1
	alignaddr	%l3,	%g1,	%o1
	fpadd16	%f2,	%f24,	%f8
	sir	0x0ED4
	subcc	%g4,	%i4,	%o5
	array8	%g3,	%l6,	%l1
	sllx	%g2,	0x1A,	%l0
	fcmpeq16	%f10,	%f2,	%g6
	ldsh	[%l7 + 0x46],	%o6
	smul	%i7,	0x16CF,	%o2
	xnor	%i3,	%l4,	%o0
	edge8l	%o7,	%i0,	%i5
	movle	%xcc,	%o4,	%g5
	mova	%icc,	%l5,	%i1
	edge16n	%l2,	%i6,	%g7
	mulscc	%i2,	0x0340,	%o3
	movrlez	%g1,	0x2DD,	%o1
	ldx	[%l7 + 0x70],	%g4
	fmovsn	%icc,	%f17,	%f27
	fmovdcc	%icc,	%f1,	%f7
	edge8ln	%l3,	%o5,	%i4
	fnor	%f12,	%f4,	%f4
	fmovsvc	%icc,	%f17,	%f11
	fmovrslez	%g3,	%f6,	%f23
	udivx	%l1,	0x1441,	%l6
	addcc	%l0,	%g6,	%g2
	andcc	%i7,	%o2,	%i3
	ldsh	[%l7 + 0x1A],	%l4
	orn	%o6,	0x1DDE,	%o0
	srl	%o7,	0x1A,	%i0
	sdiv	%o4,	0x0A12,	%g5
	add	%l5,	%i1,	%i5
	sllx	%l2,	%i6,	%g7
	fornot1	%f26,	%f20,	%f8
	mova	%xcc,	%i2,	%g1
	edge8n	%o1,	%g4,	%o3
	movrgez	%o5,	0x1CF,	%i4
	mova	%icc,	%l3,	%l1
	edge8n	%l6,	%l0,	%g6
	stx	%g3,	[%l7 + 0x50]
	fmovsn	%xcc,	%f0,	%f23
	array32	%i7,	%g2,	%i3
	ldub	[%l7 + 0x11],	%o2
	edge32n	%o6,	%o0,	%l4
	fmovrslez	%i0,	%f15,	%f13
	sth	%o4,	[%l7 + 0x6C]
	movne	%icc,	%o7,	%g5
	udivx	%i1,	0x137C,	%l5
	ld	[%l7 + 0x64],	%f21
	fsrc1	%f10,	%f26
	st	%f9,	[%l7 + 0x40]
	sethi	0x03D6,	%l2
	sethi	0x13C8,	%i5
	xnorcc	%g7,	0x0EBC,	%i2
	fone	%f22
	sethi	0x1612,	%g1
	movne	%icc,	%i6,	%o1
	edge8l	%o3,	%o5,	%g4
	srax	%l3,	0x07,	%i4
	fmul8ulx16	%f8,	%f18,	%f8
	ldsw	[%l7 + 0x48],	%l6
	movvc	%xcc,	%l0,	%g6
	array8	%g3,	%i7,	%l1
	srax	%g2,	0x1A,	%i3
	ldub	[%l7 + 0x56],	%o2
	umul	%o6,	%o0,	%l4
	array8	%i0,	%o7,	%g5
	sra	%i1,	%o4,	%l2
	subccc	%l5,	%i5,	%i2
	movrne	%g1,	%i6,	%g7
	orcc	%o1,	0x0583,	%o5
	fpack16	%f16,	%f4
	stb	%o3,	[%l7 + 0x3B]
	umulcc	%l3,	0x0B43,	%g4
	edge16	%l6,	%l0,	%g6
	orn	%i4,	0x0741,	%g3
	lduh	[%l7 + 0x08],	%l1
	edge16	%i7,	%i3,	%g2
	udivcc	%o2,	0x1164,	%o0
	alignaddr	%l4,	%o6,	%o7
	stx	%g5,	[%l7 + 0x50]
	orcc	%i1,	%o4,	%l2
	fcmpd	%fcc3,	%f14,	%f12
	fnot2s	%f20,	%f3
	smulcc	%l5,	0x126A,	%i0
	fnot2	%f2,	%f8
	fmovrsgz	%i2,	%f9,	%f28
	addcc	%i5,	0x0C62,	%i6
	ldd	[%l7 + 0x50],	%g0
	fcmpeq16	%f20,	%f14,	%o1
	addc	%g7,	%o5,	%o3
	andn	%l3,	%l6,	%l0
	fnegd	%f4,	%f16
	movvc	%xcc,	%g4,	%i4
	array32	%g3,	%l1,	%i7
	movvs	%icc,	%g6,	%g2
	fmovdneg	%xcc,	%f1,	%f25
	mulx	%i3,	0x1EAB,	%o0
	orncc	%l4,	%o2,	%o6
	ldub	[%l7 + 0x1B],	%o7
	edge32n	%i1,	%g5,	%l2
	edge32n	%l5,	%i0,	%o4
	srl	%i5,	0x11,	%i6
	sdivx	%g1,	0x1C27,	%i2
	fmul8x16al	%f30,	%f23,	%f4
	edge8n	%g7,	%o1,	%o5
	movgu	%icc,	%o3,	%l6
	ldx	[%l7 + 0x28],	%l0
	xnorcc	%g4,	%l3,	%g3
	xor	%i4,	0x1D09,	%l1
	movrlez	%g6,	%i7,	%i3
	fmovrsgz	%o0,	%f21,	%f20
	subcc	%l4,	%o2,	%o6
	save %g2, 0x1598, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g5,	%o7,	%l2
	fcmpeq16	%f6,	%f8,	%i0
	add	%o4,	0x18A4,	%l5
	srlx	%i6,	%g1,	%i5
	fnor	%f22,	%f22,	%f14
	movpos	%xcc,	%i2,	%g7
	fpmerge	%f2,	%f30,	%f22
	sll	%o1,	0x1F,	%o5
	fmovdgu	%xcc,	%f0,	%f18
	andn	%l6,	0x0085,	%o3
	xor	%l0,	%l3,	%g4
	fandnot2	%f18,	%f4,	%f24
	lduw	[%l7 + 0x18],	%g3
	udivx	%i4,	0x0AAF,	%l1
	movrgez	%i7,	%g6,	%o0
	alignaddrl	%l4,	%o2,	%i3
	ldd	[%l7 + 0x48],	%o6
	array32	%i1,	%g2,	%g5
	move	%xcc,	%l2,	%o7
	siam	0x4
	fmovdneg	%xcc,	%f3,	%f13
	movrlz	%i0,	0x1E8,	%o4
	edge32l	%i6,	%g1,	%i5
	std	%f12,	[%l7 + 0x70]
	fmovsg	%xcc,	%f19,	%f18
	fmovspos	%icc,	%f27,	%f2
	smul	%i2,	0x0CF2,	%l5
	nop
	set	0x6C, %o4
	ldsw	[%l7 + %o4],	%g7
	sll	%o1,	0x00,	%o5
	sir	0x18FE
	smulcc	%l6,	%l0,	%l3
	xnor	%g4,	0x0F82,	%o3
	fxor	%f0,	%f24,	%f18
	smulcc	%g3,	%i4,	%l1
	xorcc	%g6,	%i7,	%l4
	movn	%icc,	%o0,	%o2
	fmul8x16au	%f19,	%f15,	%f22
	edge32n	%i3,	%i1,	%g2
	fcmpne32	%f0,	%f26,	%o6
	andn	%l2,	0x1858,	%g5
	sth	%o7,	[%l7 + 0x44]
	orn	%o4,	0x1590,	%i0
	subcc	%i6,	0x122B,	%g1
	fcmpeq16	%f12,	%f24,	%i2
	orn	%l5,	%i5,	%o1
	xor	%g7,	0x1487,	%l6
	movneg	%icc,	%o5,	%l3
	fxnor	%f26,	%f8,	%f22
	fpackfix	%f0,	%f2
	fcmple32	%f18,	%f0,	%g4
	array16	%o3,	%l0,	%g3
	subccc	%l1,	0x0A63,	%g6
	restore %i4, 0x12C4, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o0,	%i7,	%i3
	fmovdge	%xcc,	%f22,	%f14
	addccc	%i1,	0x0236,	%o2
	movrgez	%o6,	%g2,	%l2
	fmovdcs	%icc,	%f9,	%f12
	fabsd	%f4,	%f10
	fmovde	%icc,	%f7,	%f19
	lduh	[%l7 + 0x0A],	%o7
	sth	%o4,	[%l7 + 0x0E]
	andcc	%g5,	%i6,	%i0
	array8	%i2,	%l5,	%i5
	fmovscc	%xcc,	%f3,	%f26
	mulx	%o1,	0x0727,	%g7
	andcc	%l6,	%o5,	%l3
	std	%f22,	[%l7 + 0x20]
	alignaddrl	%g1,	%g4,	%o3
	stb	%l0,	[%l7 + 0x10]
	fmovdvc	%icc,	%f2,	%f4
	fmul8x16au	%f26,	%f0,	%f14
	orcc	%g3,	%l1,	%i4
	edge16l	%g6,	%l4,	%i7
	lduw	[%l7 + 0x54],	%i3
	fmovdge	%xcc,	%f10,	%f25
	smul	%o0,	%o2,	%i1
	sdivcc	%o6,	0x0263,	%l2
	alignaddr	%g2,	%o7,	%o4
	orncc	%g5,	0x0D89,	%i0
	ldsh	[%l7 + 0x28],	%i2
	smulcc	%i6,	0x14B4,	%i5
	fmovdl	%xcc,	%f29,	%f2
	srax	%l5,	%o1,	%l6
	fpsub32s	%f14,	%f16,	%f28
	fands	%f29,	%f6,	%f9
	movle	%icc,	%g7,	%l3
	ldsh	[%l7 + 0x6A],	%o5
	umul	%g4,	0x0F0C,	%o3
	ldd	[%l7 + 0x60],	%g0
	xorcc	%l0,	0x1DB5,	%g3
	srl	%l1,	0x1B,	%i4
	fcmpne32	%f18,	%f8,	%g6
	umulcc	%l4,	%i7,	%o0
	fpadd16	%f8,	%f16,	%f18
	siam	0x7
	array32	%i3,	%o2,	%i1
	fzeros	%f12
	movle	%xcc,	%o6,	%g2
	edge8	%l2,	%o7,	%g5
	sub	%i0,	%o4,	%i2
	fones	%f1
	smulcc	%i5,	%i6,	%l5
	fmul8sux16	%f20,	%f16,	%f28
	fmovda	%xcc,	%f30,	%f15
	fcmple32	%f18,	%f14,	%o1
	fpackfix	%f16,	%f17
	sir	0x01BB
	add	%g7,	%l3,	%o5
	fpadd32s	%f21,	%f7,	%f25
	xnorcc	%l6,	%g4,	%g1
	fone	%f4
	fcmpd	%fcc2,	%f8,	%f10
	sir	0x1E38
	andncc	%l0,	%g3,	%l1
	sth	%o3,	[%l7 + 0x3C]
	sethi	0x05E7,	%g6
	subcc	%i4,	%l4,	%i7
	fpack32	%f6,	%f24,	%f22
	movneg	%xcc,	%o0,	%i3
	umul	%o2,	%i1,	%o6
	movre	%l2,	0x2C5,	%o7
	movvc	%icc,	%g5,	%g2
	subccc	%o4,	0x0E95,	%i0
	sllx	%i5,	%i6,	%l5
	sth	%o1,	[%l7 + 0x3C]
	ldsb	[%l7 + 0x25],	%g7
	sll	%i2,	%l3,	%o5
	sir	0x170E
	edge16l	%g4,	%g1,	%l0
	array32	%g3,	%l1,	%l6
	edge16	%o3,	%g6,	%l4
	orn	%i4,	0x01E9,	%i7
	orncc	%i3,	%o2,	%i1
	fmovdg	%icc,	%f10,	%f22
	fmovdgu	%xcc,	%f9,	%f30
	st	%f19,	[%l7 + 0x14]
	popc	0x0601,	%o0
	fmovrdne	%o6,	%f20,	%f0
	fcmpeq16	%f12,	%f8,	%o7
	fsrc1s	%f30,	%f8
	smul	%g5,	0x031F,	%g2
	movg	%xcc,	%o4,	%i0
	fones	%f13
	array32	%i5,	%l2,	%l5
	xor	%i6,	%o1,	%i2
	fmovrsne	%g7,	%f31,	%f23
	movn	%xcc,	%l3,	%g4
	fmovdn	%xcc,	%f1,	%f28
	fnors	%f25,	%f28,	%f10
	andcc	%o5,	0x0A6D,	%g1
	edge8n	%l0,	%g3,	%l6
	fmovrsgz	%o3,	%f21,	%f8
	udivx	%l1,	0x0142,	%l4
	sth	%i4,	[%l7 + 0x38]
	fmuld8sux16	%f29,	%f25,	%f22
	subcc	%i7,	0x0158,	%i3
	fmovdneg	%xcc,	%f31,	%f5
	subccc	%g6,	%i1,	%o2
	edge32n	%o6,	%o7,	%g5
	fmul8x16au	%f26,	%f24,	%f0
	orncc	%o0,	0x1B63,	%g2
	orcc	%o4,	0x16F7,	%i0
	fmovrdlez	%l2,	%f30,	%f28
	movpos	%xcc,	%l5,	%i6
	lduh	[%l7 + 0x72],	%i5
	movre	%i2,	%o1,	%l3
	fpsub16s	%f16,	%f26,	%f21
	or	%g4,	%g7,	%g1
	umul	%l0,	0x1E9B,	%o5
	save %l6, %o3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l1,	%l4
	movg	%icc,	%i7,	%i3
	sllx	%i4,	%g6,	%o2
	or	%o6,	0x0EE0,	%i1
	nop
	set	0x20, %l1
	lduh	[%l7 + %l1],	%o7
	alignaddrl	%g5,	%o0,	%o4
	ld	[%l7 + 0x4C],	%f26
	alignaddr	%g2,	%l2,	%l5
	andcc	%i6,	%i0,	%i2
	srax	%i5,	0x11,	%l3
	lduw	[%l7 + 0x6C],	%g4
	movle	%icc,	%g7,	%o1
	edge16n	%g1,	%o5,	%l0
	udivcc	%l6,	0x01D9,	%o3
	umulcc	%g3,	%l1,	%l4
	srlx	%i3,	%i4,	%i7
	fones	%f15
	nop
	set	0x70, %o1
	stx	%g6,	[%l7 + %o1]
	fandnot1s	%f3,	%f6,	%f23
	movcc	%icc,	%o6,	%o2
	movge	%icc,	%o7,	%i1
	ldd	[%l7 + 0x38],	%g4
	fmovd	%f4,	%f14
	ldsb	[%l7 + 0x22],	%o0
	edge8n	%o4,	%l2,	%g2
	movre	%l5,	0x180,	%i0
	st	%f11,	[%l7 + 0x14]
	srl	%i2,	0x11,	%i5
	sll	%l3,	%i6,	%g4
	fand	%f16,	%f30,	%f18
	xnor	%o1,	0x0FFF,	%g1
	and	%g7,	0x0FBF,	%o5
	fcmpd	%fcc1,	%f26,	%f14
	xorcc	%l0,	%o3,	%g3
	ldd	[%l7 + 0x50],	%f20
	movvs	%icc,	%l6,	%l1
	andn	%l4,	%i4,	%i7
	nop
	set	0x58, %o3
	ldsw	[%l7 + %o3],	%g6
	and	%i3,	%o6,	%o2
	xorcc	%i1,	%o7,	%o0
	umulcc	%g5,	0x1A79,	%l2
	nop
	set	0x78, %g2
	ldd	[%l7 + %g2],	%f20
	for	%f14,	%f24,	%f4
	xnor	%o4,	0x0CFD,	%g2
	fnors	%f9,	%f26,	%f22
	umul	%l5,	0x1C14,	%i2
	fmovscc	%xcc,	%f0,	%f15
	fpadd16	%f22,	%f20,	%f12
	sdiv	%i5,	0x0EC3,	%i0
	subc	%l3,	%g4,	%i6
	movle	%xcc,	%o1,	%g7
	fand	%f26,	%f4,	%f26
	ldx	[%l7 + 0x40],	%o5
	edge16	%l0,	%o3,	%g1
	srl	%g3,	%l6,	%l1
	nop
	set	0x30, %i2
	std	%f16,	[%l7 + %i2]
	nop
	set	0x78, %o7
	ldsw	[%l7 + %o7],	%i4
	smul	%i7,	%l4,	%i3
	fnors	%f3,	%f24,	%f7
	smul	%g6,	0x0482,	%o6
	edge32l	%i1,	%o2,	%o7
	addc	%g5,	0x0863,	%l2
	ldsh	[%l7 + 0x62],	%o0
	mova	%icc,	%g2,	%o4
	edge16n	%i2,	%i5,	%l5
	movneg	%icc,	%i0,	%l3
	lduw	[%l7 + 0x64],	%i6
	movrne	%g4,	%g7,	%o5
	array8	%o1,	%o3,	%g1
	fmovdleu	%icc,	%f4,	%f6
	st	%f4,	[%l7 + 0x1C]
	edge32n	%g3,	%l6,	%l1
	edge8ln	%l0,	%i7,	%i4
	fsrc1s	%f24,	%f11
	movrlez	%i3,	%l4,	%g6
	edge16l	%o6,	%o2,	%i1
	movrlz	%g5,	0x14B,	%l2
	edge32l	%o0,	%o7,	%o4
	array32	%i2,	%i5,	%g2
	std	%f30,	[%l7 + 0x20]
	umulcc	%l5,	%i0,	%l3
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%g4
	movge	%icc,	%g7,	%o5
	stb	%i6,	[%l7 + 0x42]
	xnorcc	%o1,	0x141B,	%o3
	ldsh	[%l7 + 0x3A],	%g1
	orn	%l6,	%l1,	%l0
	udiv	%g3,	0x04A5,	%i4
	fmovsleu	%xcc,	%f16,	%f14
	edge16n	%i7,	%i3,	%l4
	fxnors	%f1,	%f25,	%f27
	stx	%o6,	[%l7 + 0x40]
	ldd	[%l7 + 0x10],	%f20
	movne	%icc,	%g6,	%i1
	movpos	%xcc,	%g5,	%o2
	srl	%o0,	%l2,	%o4
	popc	%i2,	%i5
	sll	%o7,	%g2,	%l5
	fmuld8sux16	%f24,	%f17,	%f18
	fmovdvc	%icc,	%f13,	%f8
	sllx	%i0,	%l3,	%g7
	sllx	%g4,	%o5,	%i6
	movpos	%icc,	%o3,	%o1
	xnor	%l6,	%g1,	%l1
	or	%l0,	%i4,	%g3
	ldsw	[%l7 + 0x54],	%i3
	srl	%i7,	%o6,	%g6
	fcmple32	%f12,	%f12,	%l4
	sra	%i1,	%g5,	%o0
	subc	%l2,	0x047D,	%o2
	movrlez	%i2,	%i5,	%o7
	add	%o4,	%l5,	%g2
	fmovsne	%xcc,	%f28,	%f20
	ldx	[%l7 + 0x20],	%l3
	ldx	[%l7 + 0x38],	%i0
	sir	0x02A4
	sethi	0x0325,	%g7
	fmovrslez	%g4,	%f23,	%f30
	nop
	set	0x18, %l4
	ldx	[%l7 + %l4],	%i6
	fpsub16s	%f15,	%f19,	%f5
	movrlez	%o5,	0x189,	%o3
	xor	%l6,	0x0E3B,	%g1
	st	%f14,	[%l7 + 0x6C]
	addc	%o1,	%l1,	%l0
	sra	%g3,	0x07,	%i4
	fmovdvc	%icc,	%f16,	%f21
	movleu	%icc,	%i3,	%o6
	movcc	%icc,	%g6,	%i7
	edge16l	%l4,	%i1,	%o0
	xnor	%g5,	%o2,	%i2
	movleu	%icc,	%l2,	%o7
	subcc	%i5,	0x085C,	%o4
	andcc	%l5,	%l3,	%g2
	umulcc	%g7,	%g4,	%i0
	movcs	%icc,	%o5,	%i6
	srax	%l6,	%g1,	%o3
	lduw	[%l7 + 0x0C],	%l1
	ldsb	[%l7 + 0x56],	%l0
	srax	%g3,	%i4,	%i3
	movrne	%o1,	0x0DE,	%o6
	alignaddr	%i7,	%g6,	%i1
	andncc	%l4,	%o0,	%o2
	movrlez	%g5,	0x3CE,	%i2
	subc	%o7,	0x0A00,	%i5
	sub	%o4,	%l2,	%l5
	orncc	%g2,	%l3,	%g7
	movrlz	%g4,	%i0,	%o5
	ldsb	[%l7 + 0x0F],	%l6
	fornot1	%f6,	%f28,	%f0
	fmovdge	%icc,	%f30,	%f5
	edge32l	%i6,	%g1,	%l1
	addccc	%o3,	%l0,	%i4
	ldsb	[%l7 + 0x5C],	%i3
	sra	%o1,	%o6,	%g3
	xnor	%g6,	%i1,	%l4
	array8	%i7,	%o0,	%g5
	fmovrdgz	%o2,	%f12,	%f10
	addc	%i2,	%i5,	%o7
	lduh	[%l7 + 0x2A],	%l2
	ldub	[%l7 + 0x21],	%l5
	ld	[%l7 + 0x68],	%f26
	mova	%xcc,	%o4,	%g2
	ldd	[%l7 + 0x60],	%g6
	xnorcc	%l3,	%g4,	%i0
	subcc	%l6,	%o5,	%g1
	addc	%l1,	%o3,	%i6
	addccc	%i4,	%l0,	%o1
	std	%f26,	[%l7 + 0x08]
	mulx	%o6,	%g3,	%g6
	edge8ln	%i3,	%l4,	%i7
	fpsub32	%f10,	%f10,	%f24
	addc	%o0,	%g5,	%o2
	edge32n	%i1,	%i2,	%i5
	ldd	[%l7 + 0x68],	%l2
	srlx	%o7,	0x0E,	%o4
	move	%icc,	%l5,	%g2
	edge16n	%g7,	%l3,	%i0
	xor	%g4,	%o5,	%l6
	fmovdn	%icc,	%f19,	%f7
	subccc	%g1,	0x0DD1,	%l1
	sra	%i6,	%o3,	%l0
	sdiv	%i4,	0x1B55,	%o6
	subccc	%o1,	0x1106,	%g3
	ldsw	[%l7 + 0x68],	%i3
	fcmpne16	%f22,	%f30,	%l4
	fmovd	%f10,	%f28
	fmovda	%xcc,	%f23,	%f3
	edge8n	%i7,	%o0,	%g6
	fcmped	%fcc1,	%f8,	%f30
	nop
	set	0x1E, %i6
	ldsb	[%l7 + %i6],	%o2
	stx	%g5,	[%l7 + 0x18]
	ldd	[%l7 + 0x68],	%f6
	alignaddr	%i2,	%i1,	%i5
	movrgz	%o7,	0x28E,	%o4
	array32	%l2,	%g2,	%g7
	fxors	%f29,	%f16,	%f11
	alignaddr	%l3,	%i0,	%l5
	sir	0x0771
	edge32l	%g4,	%l6,	%g1
	movne	%icc,	%l1,	%o5
	movrgez	%o3,	%i6,	%l0
	add	%i4,	0x09F2,	%o1
	movne	%icc,	%o6,	%g3
	smul	%i3,	%i7,	%o0
	movrlez	%l4,	%o2,	%g6
	smulcc	%i2,	%g5,	%i5
	addcc	%i1,	%o4,	%l2
	srl	%o7,	0x13,	%g2
	fmovdvc	%icc,	%f20,	%f8
	smulcc	%l3,	0x1D0D,	%g7
	movne	%xcc,	%i0,	%g4
	addccc	%l5,	%g1,	%l6
	movrlz	%l1,	%o3,	%o5
	or	%i6,	0x0D82,	%l0
	orn	%i4,	%o1,	%o6
	fnegd	%f26,	%f0
	orncc	%g3,	%i7,	%i3
	edge16n	%l4,	%o2,	%o0
	ldd	[%l7 + 0x70],	%g6
	fcmpes	%fcc0,	%f25,	%f4
	xorcc	%g5,	0x1058,	%i5
	movvc	%icc,	%i1,	%o4
	udivx	%i2,	0x1F9E,	%l2
	or	%g2,	0x127E,	%l3
	fmul8x16au	%f16,	%f20,	%f14
	udiv	%o7,	0x0CE6,	%i0
	fmovsvc	%xcc,	%f26,	%f14
	fcmpgt32	%f0,	%f6,	%g4
	subcc	%g7,	0x09F0,	%l5
	addccc	%l6,	%g1,	%l1
	andcc	%o5,	%i6,	%l0
	udiv	%i4,	0x0E38,	%o1
	fpadd16	%f12,	%f20,	%f12
	nop
	set	0x54, %g3
	stw	%o3,	[%l7 + %g3]
	orcc	%o6,	0x0DE5,	%g3
	ldd	[%l7 + 0x18],	%i6
	move	%icc,	%l4,	%o2
	fmovdge	%xcc,	%f8,	%f20
	movleu	%xcc,	%o0,	%g6
	ldd	[%l7 + 0x20],	%i2
	st	%f14,	[%l7 + 0x4C]
	fpmerge	%f21,	%f16,	%f12
	nop
	set	0x68, %l3
	ldx	[%l7 + %l3],	%i5
	edge32ln	%g5,	%i1,	%i2
	edge32n	%l2,	%o4,	%l3
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	sth	%g2,	[%l7 + 0x68]
	movrgez	%g7,	0x306,	%g4
	sethi	0x02DB,	%l5
	ldsw	[%l7 + 0x0C],	%g1
	ldsh	[%l7 + 0x14],	%l6
	fcmpgt32	%f26,	%f6,	%l1
	udiv	%i6,	0x00D6,	%o5
	movrne	%i4,	0x1C0,	%o1
	movleu	%icc,	%o3,	%l0
	fmovdg	%icc,	%f16,	%f7
	fmovrdne	%g3,	%f6,	%f12
	andn	%i7,	%l4,	%o2
	ldsh	[%l7 + 0x3C],	%o0
	fmovdg	%xcc,	%f17,	%f16
	fandnot2s	%f29,	%f3,	%f31
	edge16l	%o6,	%g6,	%i5
	movpos	%xcc,	%g5,	%i1
	fands	%f24,	%f30,	%f20
	andncc	%i2,	%i3,	%o4
	lduw	[%l7 + 0x70],	%l2
	fzeros	%f21
	fmovrdlez	%o7,	%f24,	%f10
	addcc	%i0,	%g2,	%l3
	smulcc	%g7,	0x0250,	%l5
	mulscc	%g1,	0x014A,	%l6
	andncc	%g4,	%l1,	%i6
	edge8ln	%o5,	%o1,	%o3
	sdivcc	%i4,	0x03D3,	%l0
	fmovsge	%icc,	%f28,	%f31
	array32	%g3,	%i7,	%l4
	alignaddr	%o0,	%o6,	%g6
	smul	%o2,	0x07C2,	%g5
	fones	%f28
	fmovda	%xcc,	%f28,	%f6
	udiv	%i1,	0x1201,	%i5
	xnorcc	%i2,	0x19A3,	%o4
	srl	%i3,	0x06,	%l2
	fmovscs	%icc,	%f23,	%f9
	addcc	%o7,	%i0,	%g2
	stb	%g7,	[%l7 + 0x47]
	xnorcc	%l5,	0x141A,	%l3
	sra	%g1,	%g4,	%l6
	sir	0x1116
	and	%l1,	0x17A7,	%i6
	array8	%o5,	%o3,	%o1
	fxor	%f30,	%f24,	%f22
	array32	%i4,	%l0,	%i7
	array32	%g3,	%o0,	%o6
	fmovse	%xcc,	%f27,	%f19
	stw	%g6,	[%l7 + 0x58]
	and	%o2,	%l4,	%i1
	alignaddr	%i5,	%i2,	%g5
	stb	%i3,	[%l7 + 0x19]
	sllx	%l2,	0x15,	%o4
	fcmpgt16	%f16,	%f24,	%i0
	sethi	0x04FB,	%o7
	udivcc	%g7,	0x0DFC,	%l5
	addcc	%g2,	%g1,	%g4
	andn	%l3,	0x01AB,	%l6
	andncc	%l1,	%o5,	%i6
	mulx	%o1,	%o3,	%l0
	mulx	%i4,	0x0694,	%i7
	stx	%o0,	[%l7 + 0x78]
	edge8n	%o6,	%g6,	%o2
	edge32ln	%g3,	%i1,	%l4
	fornot2	%f24,	%f4,	%f22
	orncc	%i2,	0x14D6,	%i5
	srl	%g5,	0x1B,	%i3
	umulcc	%o4,	0x1E5B,	%l2
	addc	%o7,	0x15B6,	%i0
	movcs	%icc,	%l5,	%g7
	stw	%g2,	[%l7 + 0x6C]
	fmovsg	%icc,	%f14,	%f27
	subcc	%g4,	%g1,	%l3
	lduw	[%l7 + 0x40],	%l6
	edge32ln	%l1,	%i6,	%o5
	srlx	%o3,	0x14,	%o1
	movrne	%i4,	%l0,	%o0
	restore %o6, 0x18E8, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x78],	%f14
	addcc	%i7,	0x149F,	%o2
	movrlz	%i1,	%g3,	%i2
	sdiv	%i5,	0x1D9E,	%g5
	sllx	%i3,	%l4,	%l2
	andncc	%o4,	%o7,	%l5
	smul	%g7,	%i0,	%g4
	mulscc	%g1,	0x0AA8,	%g2
	stw	%l6,	[%l7 + 0x24]
	edge32ln	%l3,	%l1,	%o5
	smul	%i6,	%o3,	%o1
	addcc	%l0,	0x03D2,	%i4
	edge16n	%o6,	%g6,	%o0
	fabss	%f18,	%f30
	ldd	[%l7 + 0x38],	%f10
	save %o2, %i1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%i7,	%i2
	fpsub32s	%f4,	%f11,	%f10
	fandnot1s	%f16,	%f27,	%f31
	sub	%g5,	0x041A,	%i5
	smulcc	%i3,	%l4,	%l2
	siam	0x3
	ld	[%l7 + 0x48],	%f31
	udivx	%o4,	0x1AF9,	%o7
	edge8ln	%g7,	%i0,	%g4
	ldsb	[%l7 + 0x2B],	%g1
	edge8n	%g2,	%l5,	%l3
	stw	%l1,	[%l7 + 0x60]
	movn	%icc,	%o5,	%l6
	edge32l	%o3,	%i6,	%o1
	srax	%i4,	%o6,	%l0
	edge32	%o0,	%o2,	%i1
	sll	%g6,	%i7,	%i2
	fands	%f8,	%f7,	%f11
	movvc	%icc,	%g5,	%g3
	edge8ln	%i5,	%l4,	%i3
	orcc	%o4,	%o7,	%g7
	andncc	%i0,	%g4,	%l2
	edge8n	%g1,	%g2,	%l3
	movneg	%icc,	%l5,	%o5
	stw	%l6,	[%l7 + 0x10]
	fzero	%f6
	movcs	%xcc,	%l1,	%o3
	movpos	%xcc,	%i6,	%o1
	orncc	%o6,	0x04BF,	%i4
	edge32n	%l0,	%o0,	%o2
	ldub	[%l7 + 0x5B],	%g6
	mulscc	%i1,	%i2,	%g5
	fmovsle	%xcc,	%f13,	%f15
	edge32l	%g3,	%i5,	%i7
	edge16n	%l4,	%o4,	%i3
	edge16ln	%g7,	%i0,	%o7
	udiv	%l2,	0x1443,	%g1
	fmovsg	%icc,	%f6,	%f8
	udivcc	%g4,	0x14B7,	%g2
	movrgz	%l5,	%l3,	%l6
	fmovspos	%xcc,	%f3,	%f12
	fmovrde	%l1,	%f6,	%f4
	edge32l	%o3,	%o5,	%i6
	ldub	[%l7 + 0x0D],	%o1
	subc	%o6,	0x1BB4,	%l0
	save %i4, %o0, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i1,	%o2,	%i2
	udivx	%g3,	0x16B7,	%i5
	sll	%g5,	%l4,	%i7
	fmovdvc	%xcc,	%f25,	%f9
	movrgz	%i3,	0x3FD,	%g7
	orcc	%o4,	0x117B,	%o7
	sethi	0x1104,	%i0
	orcc	%l2,	0x1891,	%g1
	xorcc	%g2,	%g4,	%l5
	fpadd32s	%f16,	%f25,	%f18
	ldub	[%l7 + 0x21],	%l6
	fpsub32s	%f14,	%f24,	%f3
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	xorcc	%o5,	%o1,	%o6
	xnorcc	%i6,	%i4,	%l0
	movl	%icc,	%g6,	%o0
	sth	%i1,	[%l7 + 0x2C]
	movrlz	%i2,	%g3,	%i5
	ld	[%l7 + 0x3C],	%f4
	movle	%icc,	%o2,	%l4
	fpsub16s	%f5,	%f24,	%f18
	fmovrse	%g5,	%f26,	%f16
	fandnot1	%f14,	%f8,	%f28
	fmovs	%f14,	%f5
	movrgez	%i7,	0x271,	%i3
	stx	%o4,	[%l7 + 0x10]
	subc	%o7,	%g7,	%i0
	fpsub32	%f20,	%f8,	%f20
	addc	%l2,	%g2,	%g4
	ldsw	[%l7 + 0x34],	%g1
	movgu	%xcc,	%l6,	%l1
	fmovdleu	%xcc,	%f29,	%f26
	movge	%icc,	%l5,	%o3
	movneg	%icc,	%o5,	%l3
	edge32ln	%o1,	%i6,	%i4
	fabss	%f29,	%f10
	movrne	%l0,	0x129,	%g6
	fpmerge	%f2,	%f21,	%f16
	mova	%xcc,	%o6,	%i1
	add	%o0,	%g3,	%i2
	xnor	%i5,	%o2,	%g5
	fmovscs	%xcc,	%f23,	%f6
	edge8	%l4,	%i3,	%i7
	ldsh	[%l7 + 0x56],	%o4
	smulcc	%o7,	0x082D,	%g7
	nop
	set	0x66, %i0
	ldsh	[%l7 + %i0],	%i0
	ldsw	[%l7 + 0x10],	%g2
	for	%f16,	%f2,	%f6
	mulx	%g4,	%l2,	%g1
	fandnot1s	%f25,	%f31,	%f27
	sdivx	%l1,	0x0C86,	%l6
	umulcc	%l5,	%o3,	%o5
	sllx	%o1,	0x04,	%i6
	popc	%l3,	%i4
	alignaddrl	%g6,	%l0,	%i1
	movpos	%xcc,	%o0,	%o6
	alignaddrl	%i2,	%g3,	%i5
	andn	%g5,	0x0CF1,	%o2
	addcc	%l4,	%i7,	%i3
	movrne	%o7,	0x1DE,	%g7
	movl	%icc,	%o4,	%g2
	udivcc	%i0,	0x0B16,	%l2
	fmovdn	%icc,	%f1,	%f7
	movcs	%icc,	%g1,	%g4
	fmovscc	%xcc,	%f12,	%f0
	nop
	set	0x40, %g7
	ldd	[%l7 + %g7],	%i6
	umulcc	%l5,	%l1,	%o3
	fmul8x16	%f31,	%f16,	%f24
	edge8	%o5,	%o1,	%l3
	srl	%i6,	%i4,	%l0
	sdivcc	%i1,	0x1177,	%o0
	edge32l	%g6,	%i2,	%g3
	movne	%icc,	%i5,	%g5
	movrgz	%o6,	0x18A,	%l4
	ldd	[%l7 + 0x18],	%f8
	st	%f17,	[%l7 + 0x70]
	xorcc	%o2,	%i7,	%i3
	addcc	%g7,	%o7,	%g2
	fmovrse	%i0,	%f8,	%f12
	mulx	%l2,	0x10AC,	%g1
	mulx	%g4,	0x0D10,	%o4
	popc	0x1CA9,	%l6
	xnorcc	%l5,	0x1CA1,	%l1
	orncc	%o3,	0x1F41,	%o5
	sdiv	%l3,	0x0744,	%i6
	xnorcc	%o1,	0x02BC,	%i4
	alignaddr	%l0,	%i1,	%g6
	edge16	%o0,	%i2,	%g3
	restore %i5, %o6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%o2,	%i7
	mulscc	%g5,	0x1242,	%i3
	subc	%o7,	%g2,	%g7
	fnot2s	%f26,	%f20
	orn	%l2,	0x0EA8,	%i0
	fcmped	%fcc2,	%f22,	%f16
	movne	%xcc,	%g4,	%g1
	movne	%icc,	%l6,	%l5
	fnegs	%f13,	%f7
	mulscc	%o4,	0x0C9B,	%o3
	andcc	%o5,	%l1,	%l3
	ldsw	[%l7 + 0x48],	%i6
	edge16n	%o1,	%l0,	%i4
	edge16ln	%g6,	%o0,	%i1
	std	%f4,	[%l7 + 0x10]
	movcc	%icc,	%g3,	%i5
	udivx	%i2,	0x0B50,	%o6
	stw	%o2,	[%l7 + 0x30]
	and	%l4,	0x0D44,	%i7
	edge32ln	%i3,	%g5,	%g2
	fnot2	%f26,	%f14
	sub	%g7,	%l2,	%o7
	move	%xcc,	%i0,	%g1
	st	%f15,	[%l7 + 0x10]
	mulscc	%l6,	%l5,	%g4
	fxors	%f18,	%f13,	%f21
	movle	%xcc,	%o3,	%o4
	edge32n	%o5,	%l3,	%i6
	edge16l	%o1,	%l0,	%l1
	fandnot1	%f22,	%f22,	%f14
	popc	0x05AE,	%g6
	save %o0, %i4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i1,	0x13FD,	%i2
	mulx	%i5,	%o6,	%l4
	fmovrdgz	%i7,	%f28,	%f22
	ld	[%l7 + 0x60],	%f22
	xnorcc	%o2,	0x0794,	%g5
	lduh	[%l7 + 0x54],	%i3
	fmovs	%f17,	%f25
	fmovsne	%icc,	%f19,	%f11
	lduw	[%l7 + 0x58],	%g7
	subcc	%g2,	%o7,	%l2
	sdiv	%g1,	0x1002,	%i0
	edge8ln	%l5,	%g4,	%l6
	movre	%o3,	%o4,	%o5
	fxnor	%f28,	%f18,	%f14
	fsrc2	%f28,	%f24
	movge	%icc,	%i6,	%o1
	srlx	%l0,	%l3,	%l1
	subccc	%o0,	%g6,	%g3
	andncc	%i4,	%i2,	%i1
	fornot2s	%f30,	%f30,	%f14
	edge16l	%o6,	%l4,	%i5
	fcmpes	%fcc2,	%f23,	%f23
	fzeros	%f18
	fpadd16s	%f26,	%f3,	%f11
	andn	%i7,	0x1C35,	%g5
	umulcc	%o2,	0x04DF,	%g7
	movg	%xcc,	%g2,	%i3
	srlx	%o7,	%l2,	%g1
	umulcc	%l5,	%g4,	%i0
	fmovsl	%icc,	%f18,	%f28
	orn	%l6,	0x0839,	%o4
	movl	%xcc,	%o3,	%i6
	xor	%o1,	%l0,	%o5
	edge8l	%l1,	%o0,	%l3
	movrgz	%g6,	0x18D,	%i4
	edge32n	%g3,	%i2,	%o6
	ldd	[%l7 + 0x20],	%l4
	stx	%i1,	[%l7 + 0x20]
	umul	%i5,	%g5,	%i7
	fmovscc	%icc,	%f10,	%f26
	edge16l	%o2,	%g2,	%i3
	edge32	%o7,	%g7,	%l2
	ldsw	[%l7 + 0x30],	%l5
	sth	%g4,	[%l7 + 0x5C]
	ld	[%l7 + 0x64],	%f24
	movrgez	%i0,	0x246,	%l6
	subc	%o4,	%o3,	%i6
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	fpadd16	%f2,	%f0,	%f24
	edge32ln	%l0,	%o0,	%l1
	sth	%l3,	[%l7 + 0x40]
	smulcc	%i4,	%g6,	%g3
	fexpand	%f8,	%f18
	mulscc	%o6,	%l4,	%i1
	edge16n	%i2,	%g5,	%i7
	sub	%i5,	%g2,	%o2
	ldd	[%l7 + 0x20],	%i2
	fcmpgt32	%f22,	%f28,	%o7
	sra	%l2,	0x1B,	%g7
	edge32	%l5,	%i0,	%g4
	edge8l	%o4,	%o3,	%l6
	umul	%i6,	0x1993,	%g1
	movcc	%icc,	%o1,	%l0
	sdiv	%o0,	0x1E15,	%o5
	fmovrsgez	%l1,	%f24,	%f6
	fmovdgu	%icc,	%f17,	%f14
	bshuffle	%f28,	%f30,	%f8
	sir	0x051D
	movrgez	%i4,	0x130,	%g6
	movpos	%icc,	%g3,	%o6
	fmovrde	%l3,	%f26,	%f4
	orn	%i1,	0x12C7,	%i2
	array8	%g5,	%i7,	%l4
	fornot2	%f28,	%f20,	%f10
	mulx	%i5,	0x1ADC,	%o2
	sir	0x02AF
	move	%icc,	%g2,	%o7
	movcs	%icc,	%i3,	%g7
	movcc	%icc,	%l5,	%l2
	subcc	%i0,	%o4,	%g4
	ld	[%l7 + 0x2C],	%f11
	subc	%o3,	%i6,	%l6
	smulcc	%g1,	0x15A4,	%o1
	ldsw	[%l7 + 0x6C],	%l0
	fmul8sux16	%f20,	%f8,	%f16
	movvc	%icc,	%o0,	%l1
	std	%f14,	[%l7 + 0x48]
	ldsb	[%l7 + 0x77],	%o5
	alignaddrl	%i4,	%g6,	%o6
	srl	%g3,	%l3,	%i2
	fcmple32	%f0,	%f0,	%g5
	movcc	%icc,	%i1,	%l4
	fpack16	%f14,	%f14
	xorcc	%i7,	%o2,	%g2
	ldsw	[%l7 + 0x38],	%i5
	fand	%f18,	%f28,	%f28
	lduw	[%l7 + 0x3C],	%o7
	popc	0x0E10,	%i3
	sra	%l5,	%l2,	%g7
	st	%f26,	[%l7 + 0x30]
	fpsub32	%f4,	%f14,	%f14
	fmovsne	%xcc,	%f0,	%f22
	stb	%o4,	[%l7 + 0x3D]
	fmovspos	%icc,	%f28,	%f2
	sllx	%g4,	%i0,	%o3
	save %i6, 0x1B83, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f4,	%f31,	%f19
	ldsh	[%l7 + 0x68],	%o1
	edge32	%g1,	%l0,	%o0
	ld	[%l7 + 0x5C],	%f31
	array16	%o5,	%i4,	%l1
	std	%f24,	[%l7 + 0x60]
	movleu	%xcc,	%g6,	%o6
	edge16ln	%l3,	%g3,	%i2
	movrgz	%g5,	%i1,	%l4
	movrne	%o2,	%g2,	%i7
	fand	%f28,	%f4,	%f28
	edge8l	%i5,	%o7,	%i3
	array16	%l5,	%l2,	%o4
	smul	%g7,	0x16F3,	%i0
	fnot2s	%f16,	%f10
	stx	%o3,	[%l7 + 0x20]
	movcc	%icc,	%g4,	%l6
	st	%f26,	[%l7 + 0x6C]
	ld	[%l7 + 0x08],	%f31
	ldsh	[%l7 + 0x40],	%i6
	udiv	%o1,	0x1335,	%l0
	nop
	set	0x1E, %i4
	ldub	[%l7 + %i4],	%g1
	srax	%o0,	%i4,	%l1
	fmovdgu	%xcc,	%f6,	%f10
	fnand	%f18,	%f20,	%f28
	alignaddrl	%g6,	%o6,	%l3
	sdiv	%o5,	0x174D,	%i2
	fmovrsne	%g3,	%f9,	%f17
	fxnors	%f21,	%f10,	%f17
	movre	%g5,	%i1,	%o2
	movneg	%xcc,	%g2,	%l4
	edge32ln	%i7,	%o7,	%i5
	andn	%i3,	%l2,	%o4
	fandnot1s	%f0,	%f4,	%f25
	fmovrsne	%g7,	%f9,	%f1
	smul	%l5,	0x0447,	%i0
	fandnot1s	%f14,	%f22,	%f15
	srlx	%o3,	0x17,	%g4
	fnors	%f4,	%f18,	%f7
	array8	%l6,	%i6,	%l0
	or	%g1,	0x0451,	%o0
	fmovda	%xcc,	%f1,	%f16
	and	%o1,	%i4,	%g6
	fnegd	%f26,	%f28
	subcc	%l1,	%o6,	%l3
	movrlz	%o5,	%i2,	%g3
	fmovsleu	%xcc,	%f18,	%f23
	stx	%i1,	[%l7 + 0x20]
	edge16	%o2,	%g5,	%l4
	fmovrdlez	%i7,	%f12,	%f28
	edge8l	%g2,	%i5,	%i3
	alignaddrl	%l2,	%o4,	%g7
	fornot1	%f14,	%f24,	%f14
	ldx	[%l7 + 0x50],	%l5
	movne	%icc,	%i0,	%o3
	movleu	%xcc,	%o7,	%g4
	fcmpgt32	%f6,	%f4,	%l6
	edge16	%l0,	%i6,	%g1
	fmul8x16al	%f9,	%f16,	%f6
	fabss	%f22,	%f23
	srlx	%o1,	%o0,	%i4
	fmovsneg	%icc,	%f29,	%f12
	xor	%g6,	0x0720,	%l1
	mulscc	%l3,	%o6,	%i2
	andncc	%o5,	%i1,	%o2
	sth	%g5,	[%l7 + 0x22]
	fmovrse	%l4,	%f19,	%f20
	fpackfix	%f24,	%f2
	fmul8x16al	%f17,	%f13,	%f26
	movvs	%xcc,	%g3,	%g2
	fandnot1s	%f19,	%f6,	%f4
	movl	%icc,	%i7,	%i3
	or	%l2,	%o4,	%i5
	subccc	%l5,	%g7,	%i0
	sdivx	%o3,	0x0C6A,	%o7
	st	%f12,	[%l7 + 0x5C]
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f20
	movl	%xcc,	%g4,	%l6
	udiv	%l0,	0x1DCA,	%i6
	stx	%o1,	[%l7 + 0x10]
	xorcc	%g1,	0x1DFB,	%i4
	movgu	%xcc,	%g6,	%o0
	alignaddrl	%l1,	%o6,	%i2
	movneg	%icc,	%o5,	%i1
	sllx	%o2,	0x07,	%g5
	fmovsn	%icc,	%f22,	%f5
	movre	%l3,	%g3,	%l4
	alignaddr	%g2,	%i3,	%l2
	fnand	%f12,	%f14,	%f6
	addccc	%o4,	0x1CFE,	%i5
	mulscc	%i7,	0x1D0B,	%g7
	andncc	%i0,	%o3,	%l5
	lduh	[%l7 + 0x76],	%g4
	fpack32	%f24,	%f8,	%f14
	xnor	%o7,	%l6,	%i6
	movvs	%icc,	%o1,	%l0
	fnot2	%f0,	%f12
	umulcc	%i4,	%g1,	%g6
	fmovdn	%icc,	%f21,	%f31
	edge32	%l1,	%o0,	%i2
	fmul8sux16	%f0,	%f28,	%f16
	xorcc	%o6,	%i1,	%o5
	ld	[%l7 + 0x44],	%f24
	restore %g5, %l3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%g3,	%g2
	st	%f21,	[%l7 + 0x34]
	edge32	%i3,	%l4,	%o4
	fmovdle	%icc,	%f14,	%f25
	movg	%xcc,	%i5,	%i7
	alignaddrl	%l2,	%g7,	%o3
	sdivx	%l5,	0x1D31,	%i0
	fpsub16	%f12,	%f30,	%f12
	fors	%f7,	%f29,	%f9
	sir	0x128B
	orncc	%g4,	%l6,	%i6
	andn	%o7,	%l0,	%o1
	and	%g1,	0x1BB3,	%g6
	sllx	%i4,	0x10,	%o0
	add	%i2,	0x0009,	%l1
	mulscc	%i1,	%o5,	%o6
	movvc	%xcc,	%l3,	%o2
	fpadd32	%f2,	%f4,	%f18
	sdiv	%g5,	0x1B3E,	%g2
	edge32ln	%g3,	%l4,	%o4
	movre	%i5,	%i3,	%i7
	sth	%g7,	[%l7 + 0x1E]
	movcc	%icc,	%l2,	%l5
	movl	%icc,	%i0,	%g4
	fzero	%f12
	sub	%o3,	0x0B7F,	%i6
	lduw	[%l7 + 0x18],	%l6
	sth	%o7,	[%l7 + 0x20]
	fcmple16	%f30,	%f24,	%o1
	movge	%icc,	%g1,	%g6
	move	%xcc,	%i4,	%o0
	popc	0x17E0,	%i2
	ld	[%l7 + 0x3C],	%f16
	edge8l	%l0,	%l1,	%o5
	xnor	%i1,	%o6,	%o2
	movg	%icc,	%g5,	%g2
	movn	%xcc,	%g3,	%l4
	fmovdg	%xcc,	%f31,	%f2
	fors	%f19,	%f2,	%f25
	fmovsn	%xcc,	%f14,	%f5
	fmovscs	%icc,	%f19,	%f29
	sir	0x1401
	fmovdpos	%xcc,	%f29,	%f23
	addc	%l3,	0x115B,	%i5
	edge32	%i3,	%o4,	%i7
	mulx	%g7,	%l5,	%l2
	movle	%xcc,	%g4,	%o3
	subccc	%i6,	0x0136,	%l6
	edge8ln	%o7,	%i0,	%o1
	fornot2	%f14,	%f28,	%f2
	edge32ln	%g6,	%i4,	%g1
	sllx	%i2,	0x1B,	%o0
	udiv	%l0,	0x1313,	%o5
	srlx	%i1,	%l1,	%o6
	addcc	%o2,	%g5,	%g3
	fmovsl	%xcc,	%f0,	%f10
	edge32l	%g2,	%l4,	%i5
	edge8l	%i3,	%o4,	%i7
	sll	%l3,	%g7,	%l5
	sethi	0x1C49,	%l2
	fsrc2	%f2,	%f2
	movre	%o3,	0x204,	%i6
	array32	%g4,	%o7,	%i0
	xnorcc	%o1,	0x0F8C,	%l6
	stw	%g6,	[%l7 + 0x58]
	add	%i4,	0x1F9E,	%g1
	fcmpeq32	%f24,	%f28,	%i2
	movle	%icc,	%l0,	%o5
	fmovsn	%icc,	%f12,	%f24
	edge16n	%i1,	%l1,	%o0
	sethi	0x1D26,	%o2
	umulcc	%g5,	%g3,	%g2
	array16	%o6,	%l4,	%i3
	addccc	%o4,	0x1613,	%i5
	sllx	%l3,	%i7,	%l5
	movgu	%icc,	%g7,	%l2
	fmovdne	%icc,	%f12,	%f0
	fmovspos	%xcc,	%f23,	%f21
	stx	%i6,	[%l7 + 0x28]
	sra	%g4,	0x12,	%o7
	movpos	%xcc,	%o3,	%o1
	srlx	%i0,	%g6,	%l6
	orn	%i4,	%i2,	%g1
	st	%f23,	[%l7 + 0x24]
	fmul8x16al	%f22,	%f26,	%f26
	fxor	%f20,	%f8,	%f30
	fmovdvs	%xcc,	%f4,	%f4
	st	%f9,	[%l7 + 0x34]
	sdiv	%l0,	0x1FC6,	%i1
	array16	%l1,	%o0,	%o2
	movl	%icc,	%g5,	%o5
	stw	%g3,	[%l7 + 0x38]
	lduw	[%l7 + 0x70],	%g2
	fand	%f18,	%f24,	%f10
	add	%o6,	0x0FF2,	%l4
	fxnor	%f26,	%f24,	%f26
	lduw	[%l7 + 0x70],	%i3
	xor	%o4,	%i5,	%l3
	array8	%l5,	%g7,	%i7
	edge8n	%i6,	%l2,	%g4
	fmovdle	%icc,	%f11,	%f20
	lduw	[%l7 + 0x0C],	%o7
	popc	0x0A1F,	%o1
	ldsh	[%l7 + 0x6A],	%o3
	st	%f8,	[%l7 + 0x2C]
	subccc	%i0,	0x1E96,	%l6
	fandnot1s	%f24,	%f6,	%f17
	movne	%xcc,	%g6,	%i4
	fzeros	%f1
	nop
	set	0x18, %i5
	ldd	[%l7 + %i5],	%g0
	mulx	%l0,	%i1,	%i2
	sra	%o0,	%o2,	%l1
	movne	%icc,	%g5,	%g3
	movcc	%icc,	%o5,	%o6
	edge16n	%l4,	%i3,	%g2
	movleu	%icc,	%i5,	%o4
	sllx	%l3,	0x09,	%g7
	fmovdleu	%icc,	%f12,	%f11
	edge16l	%l5,	%i6,	%i7
	fmovsneg	%xcc,	%f10,	%f5
	movvs	%xcc,	%g4,	%l2
	fxnor	%f22,	%f24,	%f26
	stb	%o7,	[%l7 + 0x0D]
	udivx	%o3,	0x0AA2,	%i0
	nop
	set	0x18, %g6
	lduw	[%l7 + %g6],	%o1
	sethi	0x120A,	%l6
	movrgz	%i4,	0x39D,	%g1
	fnot2	%f10,	%f14
	andncc	%g6,	%i1,	%l0
	ld	[%l7 + 0x0C],	%f27
	edge32n	%o0,	%o2,	%i2
	fmovsvs	%xcc,	%f20,	%f16
	movl	%icc,	%g5,	%g3
	fsrc1	%f30,	%f26
	move	%xcc,	%l1,	%o5
	fmovs	%f19,	%f17
	subc	%l4,	%i3,	%o6
	movrgez	%i5,	0x3D7,	%o4
	fmovdvs	%icc,	%f12,	%f2
	movrlez	%l3,	0x149,	%g2
	edge32n	%l5,	%g7,	%i7
	sir	0x0F5E
	alignaddrl	%g4,	%i6,	%o7
	alignaddr	%o3,	%i0,	%l2
	fmovrdlez	%o1,	%f10,	%f20
	movvs	%xcc,	%i4,	%l6
	fmovdgu	%icc,	%f28,	%f14
	ldsw	[%l7 + 0x50],	%g6
	movneg	%xcc,	%g1,	%i1
	udiv	%o0,	0x0F83,	%l0
	xorcc	%i2,	0x01E6,	%g5
	srl	%o2,	%g3,	%l1
	fmovdvc	%xcc,	%f4,	%f27
	edge8n	%o5,	%i3,	%l4
	movcs	%xcc,	%i5,	%o6
	edge8ln	%l3,	%g2,	%o4
	edge32ln	%g7,	%l5,	%i7
	movre	%g4,	0x1C3,	%i6
	sethi	0x05D9,	%o3
	srl	%o7,	%l2,	%o1
	movleu	%icc,	%i4,	%l6
	fmovs	%f11,	%f19
	stx	%g6,	[%l7 + 0x78]
	edge16l	%i0,	%i1,	%g1
	movpos	%icc,	%l0,	%i2
	movleu	%icc,	%g5,	%o0
	ld	[%l7 + 0x54],	%f15
	addc	%o2,	%g3,	%o5
	sllx	%i3,	0x03,	%l4
	fmul8x16au	%f28,	%f6,	%f10
	umul	%i5,	%o6,	%l3
	sdivx	%g2,	0x0860,	%o4
	faligndata	%f4,	%f30,	%f24
	and	%l1,	0x134D,	%g7
	st	%f21,	[%l7 + 0x74]
	movn	%icc,	%i7,	%g4
	umulcc	%i6,	0x084B,	%l5
	ldx	[%l7 + 0x38],	%o7
	ldsh	[%l7 + 0x72],	%o3
	xor	%l2,	0x1315,	%o1
	fcmpne16	%f28,	%f22,	%l6
	andn	%g6,	%i4,	%i0
	srax	%i1,	%g1,	%l0
	or	%i2,	0x0D91,	%g5
	fmovsvc	%xcc,	%f15,	%f7
	fmovdne	%icc,	%f14,	%f24
	andn	%o0,	0x0988,	%g3
	sra	%o2,	%i3,	%o5
	movrlz	%l4,	0x39A,	%i5
	xnorcc	%l3,	0x062F,	%o6
	alignaddr	%g2,	%l1,	%g7
	movge	%icc,	%i7,	%g4
	stw	%i6,	[%l7 + 0x40]
	sdiv	%o4,	0x0FCA,	%o7
	fmovdle	%xcc,	%f11,	%f10
	ldsw	[%l7 + 0x38],	%o3
	lduh	[%l7 + 0x68],	%l5
	ld	[%l7 + 0x2C],	%f14
	fornot2s	%f24,	%f27,	%f20
	subcc	%o1,	%l2,	%l6
	ldd	[%l7 + 0x78],	%i4
	stw	%g6,	[%l7 + 0x10]
	sdiv	%i1,	0x19DF,	%i0
	add	%l0,	%g1,	%i2
	stb	%g5,	[%l7 + 0x32]
	srax	%o0,	0x1E,	%g3
	move	%xcc,	%o2,	%i3
	srlx	%o5,	%i5,	%l3
	movgu	%xcc,	%l4,	%o6
	array32	%l1,	%g7,	%g2
	fmovspos	%icc,	%f9,	%f19
	fmovrsne	%g4,	%f3,	%f12
	srlx	%i6,	%i7,	%o7
	nop
	set	0x58, %o5
	std	%f14,	[%l7 + %o5]
	fxnor	%f4,	%f24,	%f2
	sll	%o3,	0x0A,	%l5
	fmovda	%xcc,	%f20,	%f5
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	sll	%l6,	0x09,	%l2
	sdivx	%g6,	0x0EDB,	%i1
	fcmpne16	%f18,	%f30,	%i0
	array8	%l0,	%g1,	%i4
	nop
	set	0x4A, %l0
	lduh	[%l7 + %l0],	%g5
	movpos	%xcc,	%i2,	%o0
	smulcc	%o2,	0x01CB,	%g3
	restore %o5, 0x1208, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%i3,	[%l7 + 0x2C]
	movne	%xcc,	%l4,	%o6
	sub	%l1,	%l3,	%g7
	xorcc	%g2,	0x17BA,	%g4
	fmovrde	%i6,	%f30,	%f10
	addccc	%i7,	0x079B,	%o7
	xnor	%o3,	0x1886,	%l5
	srl	%o4,	0x0C,	%o1
	edge8	%l2,	%g6,	%i1
	fnot2s	%f14,	%f29
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	xnorcc	%i4,	%l0,	%i2
	movneg	%xcc,	%g5,	%o2
	addc	%o0,	0x04F9,	%g3
	movn	%xcc,	%o5,	%i5
	edge16n	%l4,	%i3,	%o6
	andncc	%l1,	%g7,	%l3
	fmul8x16	%f13,	%f26,	%f0
	fabss	%f17,	%f14
	movrgez	%g2,	%g4,	%i7
	movvs	%icc,	%o7,	%o3
	fandnot1s	%f10,	%f30,	%f23
	fxors	%f0,	%f3,	%f18
	fcmpne32	%f28,	%f26,	%i6
	fmovdneg	%xcc,	%f30,	%f26
	xorcc	%o4,	%o1,	%l5
	movrgez	%l2,	0x2DD,	%i1
	udivcc	%i0,	0x0BDE,	%g6
	sllx	%l6,	0x0B,	%i4
	orncc	%l0,	0x0B9B,	%g1
	sethi	0x141E,	%i2
	movrgez	%o2,	%g5,	%g3
	fmovrslz	%o5,	%f17,	%f9
	std	%f16,	[%l7 + 0x10]
	udivx	%i5,	0x0788,	%o0
	ld	[%l7 + 0x14],	%f6
	save %i3, 0x137D, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%o6,	0x0A82,	%g7
	fnegs	%f30,	%f28
	subc	%l1,	%g2,	%g4
	and	%l3,	%i7,	%o7
	movvc	%icc,	%o3,	%o4
	sra	%i6,	%l5,	%o1
	sdivx	%i1,	0x1D7E,	%i0
	edge8n	%l2,	%g6,	%l6
	fone	%f14
	andcc	%i4,	0x1BCC,	%l0
	movrgez	%i2,	%o2,	%g1
	fnot1s	%f17,	%f26
	stb	%g5,	[%l7 + 0x14]
	sll	%g3,	0x1C,	%i5
	movleu	%icc,	%o0,	%o5
	fcmple32	%f22,	%f8,	%i3
	fmovsa	%icc,	%f1,	%f31
	edge32	%o6,	%g7,	%l4
	fmul8x16	%f2,	%f4,	%f6
	movgu	%xcc,	%g2,	%g4
	edge16ln	%l3,	%l1,	%o7
	alignaddr	%i7,	%o3,	%o4
	orcc	%l5,	0x154C,	%o1
	restore %i6, 0x0FCC, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f20,	%f8
	movcc	%icc,	%i1,	%l2
	nop
	set	0x50, %l6
	ldx	[%l7 + %l6],	%l6
	stw	%g6,	[%l7 + 0x4C]
	st	%f4,	[%l7 + 0x60]
	stb	%l0,	[%l7 + 0x1E]
	edge32ln	%i2,	%o2,	%i4
	fnands	%f6,	%f9,	%f17
	fexpand	%f31,	%f10
	ldsb	[%l7 + 0x62],	%g1
	fandnot2s	%f29,	%f28,	%f24
	subcc	%g5,	0x086A,	%i5
	ldub	[%l7 + 0x32],	%g3
	stw	%o0,	[%l7 + 0x10]
	movre	%o5,	%o6,	%i3
	edge16l	%l4,	%g7,	%g4
	movvc	%xcc,	%g2,	%l1
	movrgez	%l3,	%o7,	%o3
	fmovrdlez	%i7,	%f18,	%f12
	fmovdg	%icc,	%f20,	%f6
	orncc	%o4,	%l5,	%o1
	fmovdcs	%xcc,	%f11,	%f3
	movge	%icc,	%i0,	%i1
	movrlez	%l2,	0x329,	%i6
	fcmpd	%fcc1,	%f22,	%f10
	movvs	%xcc,	%l6,	%g6
	mulscc	%l0,	0x12E5,	%o2
	udivcc	%i2,	0x0BCA,	%i4
	udivx	%g1,	0x02D7,	%g5
	fcmple16	%f18,	%f20,	%i5
	movleu	%icc,	%g3,	%o5
	fcmple16	%f14,	%f28,	%o6
	fnot1s	%f23,	%f4
	movrlz	%i3,	0x2DF,	%o0
	subcc	%l4,	0x0814,	%g4
	sethi	0x053E,	%g7
	fcmpgt16	%f28,	%f8,	%g2
	udivx	%l3,	0x1438,	%o7
	addccc	%o3,	0x056D,	%i7
	fornot1s	%f8,	%f18,	%f14
	addcc	%o4,	%l1,	%o1
	sir	0x03D3
	andncc	%l5,	%i1,	%i0
	fnot2s	%f16,	%f14
	movn	%icc,	%i6,	%l6
	movvs	%icc,	%g6,	%l0
	fmovse	%icc,	%f22,	%f22
	orn	%l2,	%i2,	%i4
	movrne	%g1,	%g5,	%i5
	fmovsne	%icc,	%f3,	%f28
	movrgz	%g3,	0x1A1,	%o5
	fmovrdgez	%o6,	%f0,	%f2
	popc	0x1915,	%o2
	edge32	%o0,	%l4,	%i3
	edge8	%g7,	%g4,	%g2
	array8	%o7,	%o3,	%l3
	xor	%i7,	%l1,	%o1
	subccc	%o4,	0x0EB8,	%i1
	sdivx	%l5,	0x0E72,	%i6
	ld	[%l7 + 0x30],	%f21
	edge16l	%l6,	%g6,	%l0
	sllx	%i0,	%i2,	%l2
	and	%i4,	0x1446,	%g5
	edge32	%i5,	%g1,	%o5
	fmovda	%xcc,	%f28,	%f18
	xor	%g3,	%o6,	%o2
	fmovda	%icc,	%f16,	%f4
	fmovd	%f6,	%f24
	array32	%o0,	%l4,	%g7
	fmovsleu	%icc,	%f20,	%f26
	udiv	%g4,	0x1E4C,	%g2
	and	%i3,	0x0B67,	%o7
	fpsub16	%f22,	%f10,	%f30
	ld	[%l7 + 0x20],	%f14
	fmovrdlz	%l3,	%f4,	%f20
	sth	%i7,	[%l7 + 0x6A]
	movne	%icc,	%o3,	%l1
	array16	%o4,	%o1,	%l5
	movrgez	%i1,	0x0F7,	%l6
	movneg	%xcc,	%i6,	%l0
	stb	%i0,	[%l7 + 0x78]
	movrgz	%i2,	%l2,	%i4
	edge8	%g5,	%g6,	%g1
	fmovrdne	%i5,	%f22,	%f30
	movrgz	%o5,	%g3,	%o6
	edge32n	%o0,	%l4,	%o2
	mulscc	%g7,	%g2,	%i3
	fnegd	%f4,	%f24
	sdiv	%g4,	0x0F05,	%l3
	udivcc	%i7,	0x0845,	%o3
	mova	%icc,	%l1,	%o7
	fmovscc	%icc,	%f26,	%f18
	movvs	%icc,	%o1,	%o4
	stw	%i1,	[%l7 + 0x28]
	addcc	%l6,	0x046D,	%i6
	movgu	%icc,	%l5,	%i0
	udivx	%i2,	0x0A22,	%l2
	fcmpgt16	%f26,	%f8,	%i4
	movge	%xcc,	%g5,	%g6
	andn	%l0,	%i5,	%o5
	alignaddr	%g3,	%g1,	%o6
	movn	%xcc,	%l4,	%o2
	movcs	%icc,	%g7,	%o0
	udiv	%i3,	0x0FDA,	%g2
	array16	%g4,	%l3,	%i7
	fmovd	%f22,	%f30
	udivcc	%l1,	0x063A,	%o3
	ldsb	[%l7 + 0x22],	%o1
	sra	%o7,	%i1,	%o4
	fmovrdne	%l6,	%f4,	%f18
	edge16ln	%l5,	%i0,	%i6
	edge16l	%l2,	%i4,	%g5
	xorcc	%g6,	%l0,	%i2
	std	%f16,	[%l7 + 0x30]
	save %o5, 0x0028, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f8,	%f14
	movvs	%icc,	%i5,	%g1
	movn	%xcc,	%o6,	%l4
	alignaddrl	%o2,	%o0,	%g7
	movrlez	%i3,	%g2,	%l3
	orncc	%g4,	0x0AD6,	%i7
	movrne	%o3,	0x23D,	%o1
	smul	%o7,	0x163B,	%i1
	fornot2s	%f21,	%f24,	%f29
	movrlez	%o4,	0x203,	%l1
	fmovdne	%icc,	%f13,	%f27
	fpadd32	%f20,	%f30,	%f20
	andncc	%l6,	%l5,	%i6
	orcc	%l2,	0x03FC,	%i0
	fmovdl	%xcc,	%f0,	%f3
	lduw	[%l7 + 0x78],	%i4
	for	%f18,	%f4,	%f22
	addc	%g6,	0x0A55,	%l0
	movre	%i2,	%g5,	%o5
	udivcc	%g3,	0x1ED0,	%i5
	ldsh	[%l7 + 0x62],	%o6
	add	%g1,	%l4,	%o2
	xorcc	%o0,	%g7,	%g2
	alignaddr	%i3,	%l3,	%g4
	fmovsl	%icc,	%f5,	%f26
	add	%i7,	%o3,	%o7
	xorcc	%i1,	0x0976,	%o4
	movge	%icc,	%l1,	%l6
	movrlz	%l5,	0x14B,	%i6
	xnorcc	%o1,	0x1D72,	%l2
	edge16l	%i0,	%g6,	%i4
	stx	%l0,	[%l7 + 0x50]
	fcmpd	%fcc0,	%f14,	%f30
	fpsub32	%f26,	%f16,	%f30
	orncc	%g5,	%o5,	%i2
	fmovs	%f18,	%f27
	udivx	%i5,	0x1DD0,	%g3
	fcmple32	%f16,	%f8,	%g1
	fxnor	%f12,	%f12,	%f26
	fmovse	%xcc,	%f5,	%f4
	andncc	%l4,	%o2,	%o0
	movgu	%xcc,	%g7,	%g2
	andn	%i3,	0x1714,	%l3
	lduw	[%l7 + 0x10],	%g4
	subc	%i7,	0x0ACC,	%o3
	ldub	[%l7 + 0x4B],	%o6
	orncc	%o7,	0x0541,	%i1
	smul	%o4,	%l6,	%l5
	ldx	[%l7 + 0x30],	%i6
	ldd	[%l7 + 0x78],	%l0
	lduh	[%l7 + 0x7E],	%o1
	ldsb	[%l7 + 0x5A],	%i0
	fmovrdne	%g6,	%f24,	%f20
	fmovsle	%icc,	%f31,	%f21
	ldsh	[%l7 + 0x0A],	%i4
	edge32ln	%l2,	%l0,	%g5
	umul	%o5,	0x0B34,	%i5
	fmovdle	%icc,	%f11,	%f6
	movle	%icc,	%i2,	%g1
	fnegs	%f27,	%f16
	fcmpeq32	%f22,	%f14,	%g3
	mova	%icc,	%l4,	%o0
	orcc	%o2,	%g7,	%i3
	srax	%g2,	%l3,	%i7
	sir	0x165C
	movcs	%xcc,	%g4,	%o3
	ldsb	[%l7 + 0x0C],	%o7
	udiv	%i1,	0x08E3,	%o6
	fmovdne	%xcc,	%f24,	%f26
	edge32l	%o4,	%l5,	%l6
	movcs	%icc,	%i6,	%o1
	add	%l1,	0x18C7,	%i0
	bshuffle	%f4,	%f20,	%f2
	lduw	[%l7 + 0x0C],	%g6
	movge	%xcc,	%l2,	%i4
	fmovrdgez	%g5,	%f28,	%f10
	fnot1	%f28,	%f8
	ldsh	[%l7 + 0x20],	%l0
	fnegs	%f9,	%f30
	ld	[%l7 + 0x14],	%f22
	ld	[%l7 + 0x7C],	%f5
	movge	%icc,	%o5,	%i5
	alignaddrl	%i2,	%g3,	%g1
	edge16	%o0,	%o2,	%g7
	movcs	%xcc,	%i3,	%g2
	fmovdgu	%icc,	%f29,	%f19
	fmovdpos	%icc,	%f25,	%f7
	save %l4, %l3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%i7,	%o3
	xor	%o7,	0x118D,	%o6
	ldd	[%l7 + 0x28],	%f20
	sth	%i1,	[%l7 + 0x52]
	ldsb	[%l7 + 0x3F],	%l5
	edge8n	%o4,	%i6,	%o1
	movleu	%xcc,	%l1,	%i0
	save %l6, 0x1862, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i4,	%g6
	movcc	%icc,	%g5,	%l0
	st	%f17,	[%l7 + 0x20]
	stx	%i5,	[%l7 + 0x18]
	stx	%i2,	[%l7 + 0x78]
	save %g3, %g1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x20],	%f3
	popc	0x0A0A,	%o2
	fmovrdgz	%g7,	%f8,	%f22
	addcc	%o5,	%i3,	%g2
	add	%l3,	%l4,	%i7
	orncc	%g4,	0x17F4,	%o7
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	sdiv	%i1,	0x1669,	%i6
	fand	%f28,	%f10,	%f14
	fcmpgt32	%f20,	%f30,	%o4
	sub	%o1,	0x18B9,	%l1
	udiv	%l6,	0x1767,	%i0
	fcmple16	%f30,	%f6,	%l2
	fmuld8sux16	%f11,	%f7,	%f24
	ldsh	[%l7 + 0x3C],	%i4
	ldd	[%l7 + 0x40],	%f28
	udiv	%g5,	0x0603,	%l0
	fmovrsgez	%i5,	%f28,	%f14
	mulx	%i2,	%g6,	%g3
	xnorcc	%g1,	%o2,	%g7
	fmovdg	%xcc,	%f3,	%f18
	lduw	[%l7 + 0x64],	%o5
	popc	0x0D3C,	%i3
	fnors	%f3,	%f3,	%f17
	fnegd	%f0,	%f8
	ld	[%l7 + 0x60],	%f16
	orn	%g2,	%o0,	%l4
	fnot2s	%f28,	%f13
	fands	%f4,	%f12,	%f29
	fmovdne	%xcc,	%f26,	%f3
	fabss	%f25,	%f24
	std	%f2,	[%l7 + 0x18]
	edge32	%l3,	%i7,	%o7
	stb	%g4,	[%l7 + 0x77]
	stx	%o3,	[%l7 + 0x08]
	andn	%l5,	0x064D,	%o6
	alignaddrl	%i1,	%i6,	%o4
	fzero	%f22
	srax	%o1,	%l6,	%i0
	ldub	[%l7 + 0x7E],	%l2
	movle	%icc,	%l1,	%g5
	popc	%i4,	%i5
	edge32n	%i2,	%l0,	%g3
	std	%f4,	[%l7 + 0x18]
	fmovrdne	%g6,	%f24,	%f16
	fnegd	%f24,	%f10
	fmovdpos	%xcc,	%f28,	%f31
	udiv	%g1,	0x1B40,	%g7
	mulscc	%o5,	%o2,	%g2
	ld	[%l7 + 0x2C],	%f15
	add	%i3,	0x1E4A,	%l4
	or	%l3,	%i7,	%o0
	sra	%g4,	0x0A,	%o3
	edge16n	%l5,	%o6,	%i1
	edge32l	%o7,	%i6,	%o1
	orn	%o4,	%i0,	%l6
	movrlez	%l2,	0x32F,	%g5
	udiv	%l1,	0x0603,	%i4
	stw	%i5,	[%l7 + 0x18]
	sllx	%l0,	0x0D,	%i2
	fmovdle	%xcc,	%f11,	%f18
	ldub	[%l7 + 0x0D],	%g3
	movrgez	%g6,	%g1,	%o5
	faligndata	%f24,	%f4,	%f22
	array16	%o2,	%g7,	%g2
	sdivx	%i3,	0x1FA7,	%l3
	fxor	%f0,	%f26,	%f6
	udiv	%i7,	0x0E03,	%l4
	edge32	%o0,	%g4,	%o3
	edge32n	%o6,	%l5,	%o7
	movneg	%xcc,	%i1,	%i6
	movne	%xcc,	%o1,	%i0
	edge32l	%o4,	%l2,	%l6
	fmovde	%xcc,	%f27,	%f6
	subc	%l1,	%i4,	%i5
	orn	%l0,	%g5,	%i2
	addc	%g6,	%g3,	%g1
	sdivcc	%o5,	0x1EB5,	%g7
	ldsb	[%l7 + 0x7A],	%g2
	faligndata	%f24,	%f18,	%f8
	stb	%i3,	[%l7 + 0x0A]
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%o2
	movcs	%icc,	%l3,	%i7
	edge8n	%l4,	%g4,	%o0
	or	%o3,	0x1BBC,	%l5
	edge16n	%o6,	%o7,	%i1
	subcc	%i6,	0x1CFC,	%o1
	pdist	%f0,	%f20,	%f8
	movrlez	%o4,	%l2,	%l6
	xorcc	%i0,	%l1,	%i4
	xorcc	%l0,	0x0682,	%i5
	movne	%xcc,	%g5,	%i2
	ldsb	[%l7 + 0x31],	%g6
	addc	%g3,	0x042C,	%g1
	orn	%o5,	0x0470,	%g2
	edge32ln	%g7,	%o2,	%i3
	ldsw	[%l7 + 0x64],	%i7
	movcc	%xcc,	%l3,	%g4
	st	%f16,	[%l7 + 0x54]
	sdivcc	%l4,	0x0CD4,	%o3
	fmovdne	%xcc,	%f17,	%f19
	stw	%o0,	[%l7 + 0x24]
	movrne	%l5,	0x3EB,	%o7
	ldub	[%l7 + 0x3B],	%o6
	edge8l	%i1,	%i6,	%o4
	sdivcc	%l2,	0x1EA3,	%l6
	subc	%o1,	%i0,	%i4
	ldsb	[%l7 + 0x27],	%l1
	stx	%l0,	[%l7 + 0x50]
	movne	%icc,	%i5,	%i2
	fmul8x16	%f11,	%f18,	%f6
	and	%g5,	0x0470,	%g3
	movg	%xcc,	%g6,	%g1
	or	%g2,	%o5,	%g7
	ldsb	[%l7 + 0x65],	%i3
	andncc	%o2,	%l3,	%g4
	movleu	%xcc,	%i7,	%l4
	orn	%o3,	%l5,	%o0
	add	%o6,	%i1,	%i6
	fsrc1	%f16,	%f10
	fnot1s	%f12,	%f18
	fpack32	%f6,	%f2,	%f18
	ldsb	[%l7 + 0x5B],	%o4
	movg	%xcc,	%o7,	%l2
	srlx	%l6,	%i0,	%i4
	smulcc	%o1,	0x04DC,	%l0
	movleu	%icc,	%l1,	%i5
	lduh	[%l7 + 0x2E],	%g5
	ldx	[%l7 + 0x60],	%g3
	xor	%g6,	0x0B88,	%g1
	fmovdle	%xcc,	%f17,	%f10
	fmovd	%f16,	%f20
	fsrc1s	%f11,	%f24
	alignaddrl	%i2,	%o5,	%g7
	orncc	%g2,	0x1C80,	%o2
	movneg	%xcc,	%l3,	%i3
	smulcc	%i7,	0x01E3,	%g4
	fmuld8ulx16	%f1,	%f14,	%f18
	array32	%o3,	%l4,	%o0
	movn	%xcc,	%l5,	%i1
	ldsh	[%l7 + 0x3C],	%i6
	umulcc	%o4,	0x1160,	%o7
	smulcc	%l2,	%l6,	%o6
	movrlez	%i4,	0x2E5,	%i0
	ldsb	[%l7 + 0x76],	%o1
	movvs	%icc,	%l0,	%l1
	addccc	%g5,	%g3,	%g6
	edge16l	%g1,	%i5,	%o5
	addccc	%i2,	0x1F19,	%g2
	fmovrde	%g7,	%f16,	%f28
	srax	%o2,	0x05,	%i3
	mova	%icc,	%i7,	%l3
	move	%xcc,	%o3,	%l4
	fmovdn	%xcc,	%f15,	%f19
	mulscc	%o0,	0x0C5B,	%l5
	fmovsa	%xcc,	%f30,	%f21
	ldx	[%l7 + 0x40],	%g4
	sub	%i6,	%o4,	%o7
	srl	%i1,	0x13,	%l2
	movle	%xcc,	%l6,	%i4
	sll	%o6,	0x07,	%i0
	sllx	%o1,	0x1B,	%l0
	movgu	%xcc,	%g5,	%g3
	movne	%icc,	%g6,	%l1
	fmul8x16au	%f26,	%f17,	%f22
	edge8	%g1,	%o5,	%i5
	sra	%g2,	%i2,	%g7
	ldd	[%l7 + 0x60],	%f8
	stb	%i3,	[%l7 + 0x26]
	fandnot2s	%f13,	%f8,	%f6
	udivcc	%i7,	0x1C18,	%l3
	fmovrdgz	%o3,	%f30,	%f10
	array16	%o2,	%o0,	%l4
	fsrc2s	%f15,	%f22
	edge32l	%l5,	%g4,	%i6
	fcmped	%fcc1,	%f10,	%f6
	edge8l	%o4,	%o7,	%l2
	movle	%xcc,	%i1,	%l6
	ldd	[%l7 + 0x30],	%o6
	fmovdn	%icc,	%f1,	%f31
	move	%icc,	%i4,	%i0
	fmovsge	%icc,	%f8,	%f23
	xorcc	%l0,	0x1E6D,	%o1
	edge16n	%g5,	%g6,	%g3
	array8	%g1,	%l1,	%i5
	fmovdcc	%icc,	%f14,	%f5
	mulscc	%o5,	%i2,	%g2
	and	%i3,	%i7,	%l3
	ldsw	[%l7 + 0x60],	%o3
	smul	%o2,	0x18A4,	%g7
	addc	%l4,	%l5,	%g4
	sdivcc	%i6,	0x111D,	%o0
	orcc	%o4,	0x195A,	%o7
	fcmpgt32	%f6,	%f18,	%l2
	srlx	%i1,	0x16,	%l6
	sub	%i4,	%i0,	%o6
	array8	%l0,	%o1,	%g5
	ldsw	[%l7 + 0x30],	%g6
	fcmped	%fcc3,	%f6,	%f2
	sdivcc	%g1,	0x08DA,	%l1
	movge	%xcc,	%i5,	%g3
	fsrc2	%f8,	%f10
	fnot1s	%f21,	%f28
	mova	%icc,	%o5,	%i2
	movg	%xcc,	%g2,	%i7
	fmul8sux16	%f4,	%f24,	%f10
	movneg	%icc,	%i3,	%l3
	movrgez	%o3,	%g7,	%o2
	xorcc	%l5,	%g4,	%l4
	movre	%i6,	0x0AF,	%o4
	movcs	%icc,	%o0,	%o7
	orcc	%l2,	0x0174,	%l6
	edge32ln	%i1,	%i0,	%o6
	umul	%l0,	%i4,	%o1
	sub	%g6,	%g5,	%g1
	fornot1	%f10,	%f2,	%f10
	srlx	%l1,	%i5,	%o5
	fmovsgu	%icc,	%f19,	%f6
	faligndata	%f2,	%f18,	%f30
	edge16l	%g3,	%g2,	%i7
	sub	%i3,	0x1392,	%l3
	fmul8x16	%f5,	%f16,	%f24
	sra	%i2,	0x0F,	%o3
	srl	%g7,	%o2,	%l5
	sdivcc	%l4,	0x1C66,	%g4
	edge16ln	%i6,	%o4,	%o7
	andncc	%l2,	%o0,	%l6
	fmovdg	%icc,	%f19,	%f11
	movge	%xcc,	%i1,	%o6
	fpadd32s	%f9,	%f21,	%f4
	stx	%i0,	[%l7 + 0x78]
	umulcc	%i4,	%l0,	%g6
	movvs	%icc,	%o1,	%g1
	sllx	%g5,	%l1,	%i5
	bshuffle	%f0,	%f12,	%f16
	movvs	%icc,	%o5,	%g3
	subc	%g2,	0x102B,	%i3
	fmovspos	%icc,	%f11,	%f3
	fcmped	%fcc2,	%f14,	%f6
	edge32	%l3,	%i7,	%i2
	lduw	[%l7 + 0x60],	%g7
	sdiv	%o3,	0x1189,	%o2
	movrlez	%l4,	0x0FF,	%g4
	fpack16	%f18,	%f23
	xorcc	%i6,	%o4,	%l5
	ldx	[%l7 + 0x68],	%o7
	edge32n	%o0,	%l2,	%l6
	fcmps	%fcc3,	%f25,	%f16
	addccc	%o6,	0x0F66,	%i1
	edge32	%i4,	%l0,	%g6
	fmuld8sux16	%f0,	%f29,	%f30
	edge32n	%o1,	%i0,	%g5
	sub	%g1,	%i5,	%o5
	fcmped	%fcc0,	%f8,	%f6
	fzeros	%f12
	movneg	%xcc,	%g3,	%g2
	sir	0x1335
	sethi	0x1594,	%i3
	fpmerge	%f5,	%f9,	%f28
	save %l3, %i7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f19,	%f9
	ldd	[%l7 + 0x48],	%i2
	udiv	%o3,	0x19A7,	%o2
	orcc	%g7,	0x1BB4,	%g4
	sllx	%l4,	%o4,	%i6
	ldub	[%l7 + 0x58],	%l5
	movre	%o0,	%o7,	%l6
	and	%o6,	0x128F,	%i1
	nop
	set	0x58, %o0
	ldsw	[%l7 + %o0],	%l2
	lduw	[%l7 + 0x48],	%i4
	fmovspos	%xcc,	%f5,	%f24
	move	%icc,	%l0,	%g6
	fmovsn	%xcc,	%f1,	%f3
	edge16l	%o1,	%i0,	%g5
	movvs	%icc,	%i5,	%g1
	movl	%icc,	%o5,	%g3
	andcc	%i3,	%l3,	%i7
	fand	%f18,	%f6,	%f8
	addc	%g2,	0x0B3D,	%i2
	fnegs	%f28,	%f10
	srlx	%l1,	%o3,	%g7
	fmovsneg	%icc,	%f24,	%f7
	movcs	%icc,	%o2,	%l4
	movcs	%icc,	%g4,	%i6
	addcc	%l5,	%o0,	%o4
	movg	%icc,	%o7,	%l6
	addcc	%i1,	0x068C,	%l2
	fsrc1s	%f15,	%f31
	nop
	set	0x34, %l2
	stw	%i4,	[%l7 + %l2]
	lduw	[%l7 + 0x1C],	%l0
	ldx	[%l7 + 0x10],	%g6
	stw	%o1,	[%l7 + 0x54]
	orcc	%o6,	0x040D,	%g5
	fmovdgu	%icc,	%f3,	%f26
	sdiv	%i0,	0x11E3,	%g1
	movge	%xcc,	%o5,	%i5
	fpadd16	%f18,	%f30,	%f28
	sdiv	%i3,	0x0CF0,	%l3
	edge16n	%g3,	%i7,	%i2
	fmovdcc	%icc,	%f3,	%f4
	andncc	%l1,	%g2,	%o3
	movcs	%icc,	%o2,	%l4
	sdivx	%g7,	0x07F7,	%g4
	xor	%l5,	0x1756,	%o0
	movvs	%icc,	%i6,	%o7
	mulx	%o4,	%i1,	%l2
	srl	%i4,	%l0,	%g6
	andcc	%l6,	%o6,	%o1
	fornot2	%f28,	%f0,	%f20
	srax	%g5,	0x02,	%g1
	sdivx	%i0,	0x1DCD,	%i5
	ldsb	[%l7 + 0x3A],	%o5
	alignaddr	%i3,	%g3,	%l3
	fmovrdlz	%i2,	%f24,	%f16
	xorcc	%l1,	%i7,	%o3
	lduw	[%l7 + 0x40],	%o2
	xnor	%g2,	0x1778,	%l4
	smulcc	%g4,	%g7,	%o0
	fpsub32s	%f4,	%f27,	%f14
	edge16l	%i6,	%l5,	%o4
	stw	%i1,	[%l7 + 0x34]
	edge32l	%l2,	%i4,	%l0
	fmovsg	%xcc,	%f27,	%f9
	edge32	%g6,	%o7,	%o6
	srlx	%o1,	0x12,	%l6
	movrlez	%g5,	0x1E3,	%g1
	movleu	%xcc,	%i5,	%o5
	sth	%i3,	[%l7 + 0x6C]
	edge32ln	%g3,	%l3,	%i0
	movge	%xcc,	%l1,	%i7
	edge8l	%i2,	%o2,	%o3
	fpadd32s	%f15,	%f5,	%f16
	fmovrde	%g2,	%f12,	%f20
	sethi	0x17D3,	%l4
	fcmpgt16	%f4,	%f22,	%g4
	fmovsa	%xcc,	%f28,	%f10
	srl	%o0,	0x00,	%i6
	smulcc	%g7,	0x1D87,	%l5
	addccc	%o4,	%l2,	%i4
	fmovdg	%icc,	%f3,	%f22
	edge32ln	%i1,	%l0,	%o7
	stx	%o6,	[%l7 + 0x18]
	fpmerge	%f5,	%f31,	%f4
	fmovsa	%icc,	%f18,	%f30
	movrgez	%g6,	0x37D,	%o1
	edge8	%g5,	%g1,	%l6
	sub	%i5,	0x0805,	%o5
	sdivx	%i3,	0x1414,	%g3
	stb	%i0,	[%l7 + 0x0A]
	fnors	%f2,	%f7,	%f7
	restore %l1, %l3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%i7,	%o2
	add	%g2,	%o3,	%l4
	sir	0x0002
	nop
	set	0x58, %g1
	ldsh	[%l7 + %g1],	%g4
	movne	%icc,	%i6,	%o0
	or	%g7,	%o4,	%l2
	ldd	[%l7 + 0x48],	%i4
	ldsw	[%l7 + 0x58],	%i1
	fmovdgu	%icc,	%f5,	%f11
	srlx	%l0,	0x01,	%l5
	movne	%xcc,	%o7,	%o6
	xor	%g6,	0x1831,	%g5
	srax	%g1,	%o1,	%i5
	movn	%xcc,	%o5,	%i3
	movge	%icc,	%l6,	%i0
	movrgz	%l1,	%g3,	%l3
	addccc	%i2,	0x11DE,	%i7
	ldsh	[%l7 + 0x40],	%g2
	xorcc	%o3,	%o2,	%l4
	srax	%g4,	%o0,	%g7
	sdiv	%o4,	0x1F77,	%i6
	addccc	%l2,	%i4,	%l0
	fnegs	%f22,	%f31
	subcc	%i1,	0x1E72,	%l5
	movrne	%o6,	0x0F1,	%g6
	movg	%xcc,	%g5,	%g1
	udivx	%o1,	0x1517,	%o7
	andn	%i5,	%i3,	%o5
	ld	[%l7 + 0x64],	%f21
	fmovspos	%xcc,	%f31,	%f18
	udiv	%l6,	0x0E63,	%i0
	fmovsleu	%icc,	%f4,	%f24
	lduw	[%l7 + 0x44],	%l1
	faligndata	%f4,	%f24,	%f18
	fnor	%f8,	%f12,	%f18
	fmovsge	%xcc,	%f18,	%f2
	andcc	%g3,	%l3,	%i7
	addccc	%i2,	0x048E,	%g2
	sir	0x1D30
	edge8l	%o2,	%l4,	%g4
	edge16ln	%o3,	%o0,	%o4
	edge32ln	%i6,	%g7,	%l2
	movre	%l0,	0x220,	%i1
	movl	%xcc,	%l5,	%o6
	udiv	%i4,	0x061F,	%g5
	fmuld8sux16	%f15,	%f1,	%f10
	movcs	%icc,	%g6,	%o1
	or	%g1,	0x0553,	%i5
	edge16l	%o7,	%o5,	%l6
	movg	%icc,	%i3,	%l1
	ldd	[%l7 + 0x30],	%g2
	umulcc	%i0,	%i7,	%l3
	ld	[%l7 + 0x68],	%f13
	orcc	%g2,	%i2,	%l4
	edge8ln	%o2,	%o3,	%o0
	stb	%o4,	[%l7 + 0x25]
	movle	%icc,	%g4,	%g7
	ld	[%l7 + 0x60],	%f25
	edge8	%i6,	%l0,	%i1
	array32	%l2,	%o6,	%i4
	addcc	%l5,	0x0090,	%g5
	xorcc	%g6,	%g1,	%i5
	movpos	%xcc,	%o7,	%o1
	fmovsvc	%xcc,	%f4,	%f10
	smul	%o5,	%i3,	%l6
	fpackfix	%f20,	%f31
	sra	%l1,	0x17,	%g3
	edge8	%i0,	%l3,	%i7
	movgu	%icc,	%g2,	%l4
	xnor	%o2,	%o3,	%o0
	movleu	%xcc,	%i2,	%g4
	fmovrslz	%o4,	%f19,	%f19
	fmovsgu	%xcc,	%f11,	%f12
	fmovrdlez	%i6,	%f16,	%f16
	udivcc	%l0,	0x136A,	%i1
	ld	[%l7 + 0x0C],	%f25
	stx	%g7,	[%l7 + 0x20]
	addc	%o6,	%l2,	%i4
	fcmple16	%f24,	%f4,	%l5
	std	%f10,	[%l7 + 0x18]
	fpmerge	%f14,	%f31,	%f8
	addc	%g6,	0x109E,	%g5
	edge16	%g1,	%o7,	%o1
	movneg	%xcc,	%o5,	%i3
	fabss	%f26,	%f23
	umulcc	%i5,	%l6,	%l1
	movleu	%icc,	%g3,	%i0
	andncc	%l3,	%i7,	%g2
	ldsh	[%l7 + 0x30],	%l4
	fcmped	%fcc2,	%f0,	%f28
	movl	%icc,	%o2,	%o3
	fpadd16s	%f10,	%f4,	%f10
	udiv	%i2,	0x0AC7,	%o0
	movgu	%icc,	%g4,	%o4
	fmovsvc	%xcc,	%f3,	%f21
	fmovscc	%xcc,	%f6,	%f1
	fornot2	%f26,	%f0,	%f18
	xor	%l0,	%i6,	%g7
	sth	%i1,	[%l7 + 0x7E]
	sdivcc	%l2,	0x0D68,	%o6
	srl	%i4,	%l5,	%g6
	edge16ln	%g5,	%g1,	%o1
	faligndata	%f0,	%f4,	%f0
	fmovde	%icc,	%f27,	%f21
	movvs	%xcc,	%o5,	%o7
	fmovs	%f25,	%f15
	umulcc	%i5,	%l6,	%l1
	movvs	%xcc,	%g3,	%i0
	xnorcc	%i3,	%i7,	%l3
	sra	%g2,	0x19,	%l4
	fmovdvc	%icc,	%f7,	%f8
	movcs	%icc,	%o2,	%i2
	alignaddrl	%o3,	%o0,	%g4
	subccc	%l0,	0x064D,	%i6
	fmul8sux16	%f30,	%f10,	%f28
	movrlez	%o4,	%g7,	%l2
	fmovs	%f3,	%f10
	movgu	%xcc,	%i1,	%o6
	movle	%icc,	%i4,	%g6
	sra	%l5,	%g1,	%o1
	udiv	%g5,	0x0500,	%o5
	fmovdneg	%xcc,	%f1,	%f21
	sub	%i5,	0x030C,	%o7
	mulx	%l1,	0x001A,	%l6
	movrlz	%g3,	%i3,	%i0
	lduh	[%l7 + 0x32],	%l3
	fzeros	%f14
	orn	%g2,	%i7,	%o2
	movrne	%i2,	0x1E4,	%l4
	ldsh	[%l7 + 0x16],	%o3
	edge16n	%o0,	%l0,	%g4
	mulx	%i6,	0x0617,	%o4
	st	%f11,	[%l7 + 0x18]
	fmovsn	%icc,	%f1,	%f2
	alignaddr	%l2,	%i1,	%o6
	fcmped	%fcc2,	%f22,	%f2
	sub	%g7,	%g6,	%l5
	edge8	%g1,	%i4,	%g5
	ldd	[%l7 + 0x78],	%o4
	alignaddr	%i5,	%o7,	%l1
	movl	%icc,	%l6,	%o1
	fcmpne32	%f6,	%f26,	%g3
	movpos	%xcc,	%i0,	%i3
	edge8ln	%l3,	%i7,	%o2
	xor	%i2,	%g2,	%o3
	mulx	%o0,	%l4,	%l0
	addc	%g4,	%i6,	%o4
	movgu	%icc,	%i1,	%o6
	add	%l2,	0x13E2,	%g6
	ldub	[%l7 + 0x6B],	%g7
	sdivx	%l5,	0x14C2,	%i4
	and	%g5,	%g1,	%i5
	movleu	%xcc,	%o7,	%o5
	movg	%xcc,	%l6,	%l1
	edge16ln	%o1,	%i0,	%g3
	for	%f16,	%f18,	%f24
	fmovsa	%xcc,	%f8,	%f28
	edge16n	%i3,	%i7,	%l3
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	movn	%icc,	%o2,	%o3
	edge16ln	%o0,	%l4,	%g4
	ld	[%l7 + 0x2C],	%f10
	mulscc	%i6,	0x1209,	%l0
	movcs	%icc,	%i1,	%o4
	edge8n	%o6,	%g6,	%g7
	alignaddrl	%l5,	%i4,	%l2
	mova	%xcc,	%g5,	%g1
	st	%f6,	[%l7 + 0x18]
	sdiv	%o7,	0x00FC,	%i5
	popc	%l6,	%l1
	movrlz	%o1,	%o5,	%g3
	ldub	[%l7 + 0x46],	%i3
	orncc	%i0,	%l3,	%i7
	st	%f16,	[%l7 + 0x70]
	lduw	[%l7 + 0x08],	%g2
	umulcc	%o2,	0x13BE,	%o3
	fcmps	%fcc2,	%f5,	%f11
	edge16ln	%o0,	%i2,	%l4
	fmovrsne	%i6,	%f1,	%f29
	fmovdvc	%icc,	%f12,	%f0
	ldd	[%l7 + 0x38],	%f4
	edge32l	%g4,	%l0,	%o4
	move	%icc,	%i1,	%o6
	ldd	[%l7 + 0x60],	%f8
	sub	%g6,	%l5,	%i4
	fmul8x16	%f5,	%f16,	%f22
	ldsh	[%l7 + 0x14],	%g7
	movcs	%xcc,	%g5,	%g1
	edge16ln	%l2,	%o7,	%l6
	nop
	set	0x2C, %g4
	ldub	[%l7 + %g4],	%l1
	umulcc	%i5,	0x1B98,	%o1
	mova	%xcc,	%g3,	%o5
	mulscc	%i0,	0x11AD,	%l3
	movcs	%icc,	%i3,	%g2
	fcmpd	%fcc2,	%f6,	%f22
	orcc	%i7,	%o2,	%o0
	fmovrdlz	%o3,	%f24,	%f8
	alignaddrl	%l4,	%i2,	%i6
	ldsh	[%l7 + 0x36],	%g4
	array8	%o4,	%l0,	%o6
	movrlez	%g6,	%l5,	%i4
	fmovrdlez	%g7,	%f16,	%f22
	add	%g5,	%i1,	%g1
	sth	%o7,	[%l7 + 0x20]
	restore %l2, %l1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f23,	[%l7 + 0x5C]
	xnor	%l6,	%o1,	%g3
	mova	%xcc,	%i0,	%o5
	andn	%l3,	%i3,	%g2
	stx	%o2,	[%l7 + 0x58]
	movle	%icc,	%i7,	%o0
	fpadd16	%f20,	%f8,	%f18
	subcc	%o3,	%i2,	%l4
	ldub	[%l7 + 0x10],	%g4
	edge8n	%i6,	%o4,	%l0
	array8	%g6,	%o6,	%i4
	orn	%l5,	%g7,	%i1
	mulscc	%g5,	%g1,	%l2
	lduw	[%l7 + 0x30],	%o7
	fcmps	%fcc1,	%f3,	%f5
	orcc	%i5,	0x128B,	%l6
	srax	%o1,	0x13,	%l1
	edge16ln	%g3,	%o5,	%l3
	edge8	%i3,	%g2,	%i0
	movleu	%icc,	%i7,	%o0
	sethi	0x127C,	%o2
	fmuld8sux16	%f23,	%f10,	%f4
	smul	%i2,	%l4,	%g4
	movgu	%icc,	%o3,	%o4
	movgu	%icc,	%i6,	%l0
	subc	%o6,	0x15D2,	%g6
	ldub	[%l7 + 0x0D],	%l5
	udiv	%g7,	0x1A36,	%i1
	fmovrsne	%i4,	%f14,	%f20
	smulcc	%g5,	0x17FD,	%g1
	edge32	%o7,	%i5,	%l6
	fzeros	%f9
	subc	%o1,	%l1,	%l2
	sir	0x0337
	fmovrslz	%g3,	%f22,	%f18
	or	%o5,	0x0C6A,	%i3
	fmovrsgez	%l3,	%f11,	%f9
	edge16l	%i0,	%i7,	%g2
	umulcc	%o2,	%o0,	%l4
	array8	%i2,	%g4,	%o3
	fmovdn	%icc,	%f15,	%f24
	fones	%f14
	edge32l	%i6,	%o4,	%l0
	popc	%o6,	%g6
	umul	%g7,	%l5,	%i1
	smul	%g5,	%g1,	%i4
	sdivcc	%i5,	0x0FB1,	%l6
	fandnot2	%f18,	%f22,	%f20
	movne	%xcc,	%o1,	%o7
	srax	%l1,	0x11,	%l2
	orncc	%g3,	%o5,	%i3
	edge8l	%l3,	%i7,	%g2
	xnorcc	%o2,	0x1BBE,	%i0
	edge32l	%o0,	%l4,	%g4
	movn	%xcc,	%o3,	%i6
	fpackfix	%f30,	%f20
	fmovsl	%icc,	%f11,	%f15
	movneg	%icc,	%i2,	%o4
	array8	%l0,	%o6,	%g7
	ldsh	[%l7 + 0x68],	%l5
	edge16ln	%g6,	%i1,	%g1
	fmovsg	%xcc,	%f1,	%f25
	fmovdne	%xcc,	%f24,	%f16
	smulcc	%i4,	%g5,	%l6
	edge32ln	%i5,	%o1,	%l1
	andncc	%o7,	%g3,	%o5
	bshuffle	%f24,	%f24,	%f26
	or	%i3,	0x1AA3,	%l3
	add	%l2,	0x0BC7,	%g2
	fmovrsgz	%o2,	%f4,	%f19
	nop
	set	0x68, %o2
	lduw	[%l7 + %o2],	%i0
	smul	%i7,	%o0,	%l4
	edge32n	%o3,	%g4,	%i2
	sll	%i6,	%o4,	%o6
	orn	%g7,	%l5,	%l0
	ldsw	[%l7 + 0x50],	%g6
	fpsub16	%f0,	%f0,	%f30
	srlx	%g1,	0x0A,	%i4
	xnor	%g5,	%i1,	%i5
	sethi	0x1F65,	%o1
	move	%xcc,	%l1,	%l6
	orcc	%o7,	0x1B20,	%g3
	srax	%i3,	0x1F,	%o5
	edge32n	%l2,	%l3,	%o2
	srl	%g2,	%i7,	%i0
	sth	%l4,	[%l7 + 0x0E]
	fcmpeq16	%f10,	%f4,	%o3
	movgu	%xcc,	%g4,	%i2
	fpmerge	%f31,	%f5,	%f4
	mulx	%i6,	0x1D36,	%o4
	fmul8x16al	%f1,	%f12,	%f6
	array8	%o6,	%g7,	%l5
	subc	%l0,	0x1C50,	%o0
	fmovsneg	%xcc,	%f8,	%f6
	fxor	%f28,	%f10,	%f6
	fmul8x16au	%f4,	%f17,	%f30
	edge16	%g1,	%g6,	%i4
	edge16	%g5,	%i1,	%i5
	fxnors	%f17,	%f14,	%f0
	ldub	[%l7 + 0x10],	%l1
	edge8ln	%l6,	%o1,	%g3
	movvc	%xcc,	%i3,	%o7
	stb	%l2,	[%l7 + 0x0C]
	edge32ln	%l3,	%o5,	%g2
	sll	%o2,	0x1B,	%i0
	edge8	%i7,	%l4,	%o3
	fmovsn	%xcc,	%f14,	%f11
	fone	%f30
	udiv	%i2,	0x0CC3,	%i6
	alignaddr	%o4,	%o6,	%g4
	ldsh	[%l7 + 0x26],	%g7
	andncc	%l0,	%l5,	%o0
	movl	%icc,	%g6,	%g1
	subc	%g5,	%i4,	%i1
	movrgez	%l1,	%l6,	%o1
	xnorcc	%i5,	%i3,	%o7
	or	%g3,	0x0A99,	%l3
	ldd	[%l7 + 0x28],	%o4
	fmovrsgz	%g2,	%f17,	%f25
	umul	%o2,	0x084E,	%i0
	umul	%l2,	0x1C10,	%l4
	edge16ln	%o3,	%i7,	%i2
	edge8	%i6,	%o4,	%g4
	array8	%g7,	%o6,	%l5
	movneg	%xcc,	%l0,	%g6
	movneg	%icc,	%o0,	%g1
	movn	%xcc,	%g5,	%i4
	ldd	[%l7 + 0x68],	%i0
	smulcc	%l6,	%l1,	%o1
	xor	%i3,	%o7,	%g3
	fmovspos	%icc,	%f19,	%f12
	sll	%i5,	0x04,	%o5
	ldsh	[%l7 + 0x78],	%l3
	movrne	%o2,	0x04F,	%i0
	fmovrslez	%l2,	%f30,	%f19
	fmovrsgez	%l4,	%f22,	%f21
	fmovrdlez	%g2,	%f8,	%f20
	movg	%xcc,	%o3,	%i7
	fmovdne	%xcc,	%f6,	%f24
	fone	%f0
	sll	%i6,	0x16,	%i2
	udivcc	%o4,	0x1C99,	%g4
	ldd	[%l7 + 0x30],	%f0
	mulscc	%g7,	%l5,	%o6
	st	%f10,	[%l7 + 0x44]
	movrgez	%l0,	%g6,	%o0
	fmovrslez	%g1,	%f16,	%f31
	srlx	%g5,	%i1,	%l6
	stb	%l1,	[%l7 + 0x0F]
	mulscc	%o1,	0x111D,	%i3
	fxor	%f4,	%f20,	%f4
	edge32l	%o7,	%g3,	%i4
	addccc	%i5,	%l3,	%o5
	orcc	%o2,	%i0,	%l4
	movneg	%icc,	%g2,	%o3
	movneg	%xcc,	%l2,	%i7
	std	%f30,	[%l7 + 0x58]
	edge32ln	%i6,	%i2,	%o4
	fones	%f22
	movrlez	%g7,	0x14E,	%g4
	fornot1s	%f22,	%f9,	%f15
	fmovrsne	%l5,	%f5,	%f13
	ldd	[%l7 + 0x10],	%f14
	movneg	%xcc,	%o6,	%l0
	sra	%g6,	%o0,	%g5
	popc	0x09A9,	%g1
	subc	%l6,	0x12C3,	%l1
	fmovdle	%icc,	%f20,	%f29
	sdivcc	%o1,	0x066F,	%i1
	movn	%xcc,	%o7,	%g3
	edge8ln	%i3,	%i4,	%l3
	sdiv	%o5,	0x103B,	%i5
	sethi	0x1AF4,	%o2
	fnot1	%f4,	%f2
	movneg	%xcc,	%i0,	%l4
	ldd	[%l7 + 0x30],	%f18
	edge8ln	%o3,	%l2,	%g2
	fpack32	%f24,	%f12,	%f26
	fnegs	%f15,	%f21
	ldsw	[%l7 + 0x44],	%i6
	addc	%i2,	%i7,	%o4
	ld	[%l7 + 0x48],	%f2
	movneg	%xcc,	%g4,	%g7
	udivx	%l5,	0x0864,	%l0
	mova	%xcc,	%g6,	%o0
	fmovsneg	%xcc,	%f17,	%f12
	fmovdcc	%xcc,	%f27,	%f29
	smulcc	%g5,	0x10AF,	%o6
	edge16	%l6,	%g1,	%o1
	sdivx	%l1,	0x10CB,	%o7
	movneg	%xcc,	%i1,	%g3
	fpmerge	%f25,	%f6,	%f2
	edge16l	%i4,	%i3,	%l3
	addccc	%i5,	%o5,	%o2
	movcs	%xcc,	%i0,	%o3
	orncc	%l4,	0x1EE6,	%l2
	umulcc	%i6,	%g2,	%i2
	array8	%i7,	%o4,	%g4
	fmovrde	%g7,	%f12,	%f18
	movre	%l5,	0x23B,	%g6
	fpmerge	%f31,	%f26,	%f6
	mulscc	%o0,	%l0,	%o6
	fmovrdlz	%l6,	%f14,	%f12
	fmovdneg	%icc,	%f20,	%f8
	xorcc	%g1,	0x0FB2,	%o1
	sethi	0x1E4C,	%g5
	movrlz	%l1,	0x16E,	%i1
	stx	%o7,	[%l7 + 0x08]
	subccc	%i4,	%i3,	%g3
	sub	%l3,	0x1028,	%i5
	fmuld8sux16	%f13,	%f28,	%f22
	sdivx	%o5,	0x0BCD,	%i0
	xnor	%o2,	%l4,	%o3
	movne	%icc,	%l2,	%g2
	fmovsleu	%xcc,	%f2,	%f25
	udivx	%i6,	0x1796,	%i2
	srlx	%i7,	0x02,	%o4
	xnor	%g4,	0x101B,	%g7
	edge32	%g6,	%o0,	%l0
	movge	%icc,	%o6,	%l5
	ldsh	[%l7 + 0x58],	%l6
	fpadd32	%f4,	%f4,	%f16
	movge	%icc,	%o1,	%g1
	add	%l1,	%g5,	%o7
	movrlz	%i1,	%i3,	%g3
	array32	%l3,	%i4,	%i5
	sir	0x1A18
	movpos	%icc,	%o5,	%i0
	fornot2	%f26,	%f10,	%f12
	edge16l	%l4,	%o3,	%o2
	ld	[%l7 + 0x6C],	%f7
	orn	%g2,	%i6,	%l2
	fcmpne32	%f8,	%f0,	%i2
	ldub	[%l7 + 0x0F],	%o4
	movrlz	%i7,	0x305,	%g7
	edge32n	%g6,	%o0,	%l0
	edge16	%o6,	%g4,	%l6
	sdiv	%l5,	0x19FC,	%g1
	movrlez	%l1,	%g5,	%o1
	stx	%i1,	[%l7 + 0x70]
	fmovdneg	%icc,	%f3,	%f24
	orncc	%i3,	%g3,	%l3
	fcmps	%fcc0,	%f0,	%f26
	fmovdne	%xcc,	%f22,	%f5
	fpackfix	%f26,	%f1
	fmovrslez	%o7,	%f15,	%f12
	xnor	%i4,	0x0C74,	%i5
	movl	%icc,	%o5,	%i0
	movrlz	%o3,	%o2,	%l4
	movpos	%xcc,	%g2,	%i6
	save %l2, %i2, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%o4,	%g7,	%g6
	udivcc	%o0,	0x0436,	%l0
	add	%o6,	%g4,	%l6
	std	%f2,	[%l7 + 0x60]
	fmul8ulx16	%f4,	%f6,	%f10
	movrgz	%g1,	0x088,	%l5
	srl	%g5,	0x14,	%l1
	movrgez	%o1,	%i1,	%g3
	orcc	%l3,	0x1B94,	%o7
	fnegd	%f8,	%f18
	fornot2	%f14,	%f26,	%f6
	fsrc2	%f6,	%f2
	edge16	%i4,	%i3,	%o5
	edge32ln	%i0,	%i5,	%o3
	fpadd16	%f8,	%f20,	%f4
	and	%o2,	0x0F5A,	%l4
	edge32l	%i6,	%g2,	%l2
	subcc	%i2,	0x1B89,	%o4
	ldx	[%l7 + 0x50],	%g7
	lduw	[%l7 + 0x44],	%i7
	ldsw	[%l7 + 0x6C],	%o0
	sdivx	%l0,	0x01C1,	%o6
	nop
	set	0x24, %l5
	ldsh	[%l7 + %l5],	%g6
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	movrgez	%g5,	%l1,	%o1
	movrlz	%i1,	0x127,	%g4
	movcs	%xcc,	%g3,	%o7
	movcs	%xcc,	%l3,	%i3
	stb	%i4,	[%l7 + 0x41]
	orncc	%i0,	%o5,	%o3
	sll	%o2,	%i5,	%i6
	fpack16	%f20,	%f21
	ld	[%l7 + 0x64],	%f30
	array32	%g2,	%l4,	%i2
	stx	%o4,	[%l7 + 0x58]
	subcc	%g7,	0x0D8D,	%l2
	edge16l	%o0,	%i7,	%l0
	orncc	%g6,	%o6,	%g1
	edge8n	%l5,	%g5,	%l6
	sdivx	%l1,	0x0329,	%i1
	stx	%g4,	[%l7 + 0x28]
	umul	%g3,	%o7,	%l3
	ldd	[%l7 + 0x48],	%o0
	smulcc	%i4,	0x0FF0,	%i3
	srl	%i0,	0x14,	%o5
	edge32ln	%o2,	%o3,	%i6
	edge8	%g2,	%i5,	%i2
	sth	%o4,	[%l7 + 0x0C]
	popc	%l4,	%l2
	xorcc	%o0,	0x09FE,	%g7
	mulx	%i7,	%l0,	%o6
	sub	%g1,	0x0FFF,	%g6
	addc	%g5,	%l5,	%l1
	sdivcc	%i1,	0x0FFC,	%g4
	movneg	%xcc,	%l6,	%g3
	lduw	[%l7 + 0x24],	%l3
	andncc	%o7,	%o1,	%i3
	edge8l	%i0,	%o5,	%o2
	sll	%i4,	%i6,	%o3
	andncc	%g2,	%i2,	%i5
	fnand	%f28,	%f22,	%f0
	udivx	%l4,	0x0841,	%l2
	array32	%o4,	%g7,	%i7
	movrlz	%l0,	%o0,	%g1
	edge16n	%g6,	%o6,	%l5
	ldub	[%l7 + 0x09],	%l1
	xor	%i1,	0x107C,	%g5
	movg	%xcc,	%g4,	%g3
	edge32n	%l6,	%l3,	%o7
	stx	%o1,	[%l7 + 0x68]
	sdivx	%i3,	0x1D9A,	%i0
	fcmpne32	%f10,	%f4,	%o5
	stb	%o2,	[%l7 + 0x0C]
	sethi	0x0DC2,	%i4
	add	%i6,	%o3,	%g2
	fmovrse	%i5,	%f8,	%f19
	movcc	%xcc,	%l4,	%l2
	movrlez	%i2,	%g7,	%i7
	srl	%l0,	0x06,	%o0
	fmovsl	%icc,	%f5,	%f11
	ld	[%l7 + 0x1C],	%f16
	smul	%g1,	0x111B,	%g6
	ldd	[%l7 + 0x70],	%o4
	umulcc	%l5,	0x0BDB,	%l1
	subccc	%o6,	0x0C27,	%g5
	stw	%g4,	[%l7 + 0x40]
	alignaddrl	%g3,	%i1,	%l6
	edge16ln	%l3,	%o7,	%i3
	sllx	%i0,	0x0A,	%o5
	nop
	set	0x7F, %o6
	stb	%o1,	[%l7 + %o6]
	orcc	%i4,	0x1FE2,	%o2
	alignaddrl	%o3,	%i6,	%i5
	udivcc	%g2,	0x07E9,	%l4
	ldsw	[%l7 + 0x34],	%l2
	and	%i2,	0x0A5D,	%i7
	movpos	%icc,	%l0,	%o0
	array16	%g7,	%g1,	%o4
	popc	0x11D1,	%l5
	fmuld8ulx16	%f23,	%f2,	%f14
	sllx	%g6,	0x1E,	%l1
	srlx	%o6,	%g5,	%g3
	movpos	%icc,	%g4,	%i1
	xnor	%l3,	0x0A2F,	%o7
	fandnot1	%f22,	%f22,	%f30
	fmovde	%xcc,	%f22,	%f19
	addccc	%l6,	%i3,	%i0
	move	%icc,	%o1,	%o5
	array8	%o2,	%i4,	%o3
	sdiv	%i6,	0x02D1,	%i5
	stw	%g2,	[%l7 + 0x1C]
	sdivcc	%l4,	0x0808,	%i2
	movvc	%xcc,	%l2,	%l0
	movcs	%xcc,	%i7,	%o0
	fcmple32	%f30,	%f4,	%g7
	fpackfix	%f6,	%f0
	andn	%o4,	%l5,	%g6
	movvc	%icc,	%l1,	%g1
	fmovscs	%icc,	%f26,	%f10
	sethi	0x01F0,	%g5
	lduh	[%l7 + 0x16],	%o6
	stb	%g4,	[%l7 + 0x0C]
	fcmpgt32	%f8,	%f20,	%i1
	nop
	set	0x5C, %o4
	sth	%l3,	[%l7 + %o4]
	array32	%g3,	%l6,	%o7
	nop
	set	0x14, %l1
	sth	%i0,	[%l7 + %l1]
	movl	%xcc,	%i3,	%o5
	movrgez	%o1,	%o2,	%o3
	ldsw	[%l7 + 0x68],	%i6
	ld	[%l7 + 0x54],	%f2
	restore %i5, 0x091F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc0,	%f11,	%f22
	srax	%l4,	%i4,	%l2
	movgu	%icc,	%l0,	%i2
	sth	%o0,	[%l7 + 0x2C]
	udivcc	%g7,	0x13D7,	%o4
	move	%icc,	%l5,	%i7
	edge8	%l1,	%g1,	%g5
	stx	%g6,	[%l7 + 0x50]
	fmovrde	%o6,	%f28,	%f26
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f10
	movgu	%xcc,	%i1,	%g4
	udivx	%l3,	0x1835,	%g3
	edge32ln	%l6,	%o7,	%i0
	srax	%o5,	0x14,	%o1
	srax	%i3,	0x12,	%o3
	array16	%i6,	%o2,	%g2
	umul	%i5,	0x1AE6,	%i4
	fnot1	%f26,	%f10
	fpackfix	%f28,	%f20
	andncc	%l2,	%l0,	%i2
	movge	%icc,	%l4,	%o0
	fnand	%f18,	%f24,	%f18
	movneg	%icc,	%o4,	%l5
	popc	0x0BE3,	%g7
	movpos	%icc,	%i7,	%g1
	and	%l1,	%g5,	%o6
	fnot1s	%f22,	%f19
	edge32l	%g6,	%i1,	%g4
	movge	%icc,	%g3,	%l6
	fcmps	%fcc2,	%f8,	%f30
	edge32	%l3,	%i0,	%o5
	xor	%o1,	%o7,	%o3
	save %i6, %i3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i5,	[%l7 + 0x76]
	or	%g2,	%l2,	%i4
	movrne	%i2,	%l0,	%l4
	movl	%xcc,	%o0,	%o4
	lduh	[%l7 + 0x28],	%g7
	lduh	[%l7 + 0x5A],	%l5
	addccc	%i7,	0x0A60,	%l1
	sth	%g1,	[%l7 + 0x0A]
	ldd	[%l7 + 0x68],	%f0
	edge32ln	%g5,	%g6,	%i1
	faligndata	%f16,	%f18,	%f26
	movrgez	%o6,	%g3,	%g4
	andncc	%l6,	%l3,	%o5
	edge8l	%o1,	%i0,	%o7
	fmovrsne	%i6,	%f19,	%f19
	siam	0x0
	fmovrdgez	%i3,	%f30,	%f16
	sth	%o2,	[%l7 + 0x0E]
	srlx	%o3,	0x05,	%i5
	fpsub32	%f10,	%f30,	%f4
	or	%g2,	%i4,	%i2
	sra	%l0,	%l4,	%o0
	fpack32	%f20,	%f2,	%f6
	edge16ln	%o4,	%l2,	%l5
	subccc	%g7,	0x0AE1,	%i7
	popc	%g1,	%g5
	movpos	%xcc,	%g6,	%i1
	sub	%o6,	%g3,	%l1
	ldub	[%l7 + 0x36],	%g4
	ldx	[%l7 + 0x78],	%l6
	edge32	%o5,	%o1,	%l3
	srax	%i0,	0x10,	%i6
	ldd	[%l7 + 0x20],	%f12
	fpackfix	%f12,	%f16
	fandnot1	%f20,	%f4,	%f10
	srlx	%o7,	0x05,	%i3
	movcc	%xcc,	%o3,	%i5
	xnorcc	%g2,	0x05B6,	%o2
	pdist	%f22,	%f10,	%f2
	movcs	%xcc,	%i4,	%l0
	fmuld8ulx16	%f12,	%f6,	%f16
	movgu	%xcc,	%i2,	%l4
	fnot1s	%f21,	%f2
	movge	%icc,	%o4,	%l2
	xnor	%l5,	0x0444,	%o0
	fornot2	%f12,	%f28,	%f30
	movcs	%xcc,	%i7,	%g1
	sethi	0x0179,	%g5
	stx	%g7,	[%l7 + 0x70]
	movpos	%xcc,	%i1,	%g6
	fsrc2s	%f31,	%f22
	udiv	%g3,	0x1A91,	%l1
	udivx	%o6,	0x11DF,	%g4
	orncc	%o5,	0x1235,	%o1
	siam	0x5
	mulscc	%l6,	0x15F0,	%l3
	sir	0x1356
	fmovsn	%xcc,	%f4,	%f15
	ldx	[%l7 + 0x40],	%i6
	fcmpd	%fcc2,	%f20,	%f2
	movrne	%i0,	%o7,	%o3
	andcc	%i5,	%i3,	%g2
	edge8	%i4,	%o2,	%i2
	std	%f10,	[%l7 + 0x48]
	subcc	%l4,	%o4,	%l2
	fmovdge	%xcc,	%f4,	%f23
	xnorcc	%l5,	%l0,	%i7
	movl	%xcc,	%o0,	%g5
	movcs	%xcc,	%g1,	%i1
	orncc	%g6,	%g3,	%g7
	movrne	%l1,	0x30A,	%g4
	umulcc	%o6,	%o1,	%l6
	fone	%f8
	movle	%xcc,	%o5,	%l3
	orcc	%i0,	0x09B5,	%o7
	ldx	[%l7 + 0x78],	%o3
	ld	[%l7 + 0x64],	%f18
	fmul8sux16	%f14,	%f30,	%f14
	array8	%i6,	%i5,	%g2
	alignaddrl	%i4,	%o2,	%i3
	edge32ln	%l4,	%i2,	%l2
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%o4
	movgu	%icc,	%l0,	%l5
	orncc	%i7,	%g5,	%o0
	andcc	%g1,	%g6,	%g3
	save %i1, %l1, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g7,	%o1
	edge8l	%o6,	%l6,	%o5
	lduw	[%l7 + 0x24],	%i0
	array32	%l3,	%o3,	%o7
	edge16ln	%i6,	%g2,	%i4
	alignaddrl	%i5,	%o2,	%l4
	movcs	%xcc,	%i3,	%l2
	movn	%icc,	%i2,	%l0
	movne	%xcc,	%l5,	%i7
	fmovrdgz	%g5,	%f14,	%f12
	fones	%f25
	ldsw	[%l7 + 0x58],	%o0
	smulcc	%o4,	0x1942,	%g1
	sub	%g3,	%g6,	%i1
	sll	%g4,	0x10,	%l1
	edge8l	%o1,	%o6,	%g7
	movrgez	%l6,	%i0,	%l3
	fmovdleu	%icc,	%f5,	%f17
	edge32n	%o3,	%o7,	%i6
	xnor	%o5,	0x163E,	%g2
	fcmped	%fcc3,	%f8,	%f24
	movrlz	%i4,	%o2,	%i5
	movrgz	%l4,	0x065,	%l2
	fpack16	%f14,	%f30
	andcc	%i2,	0x0B26,	%i3
	std	%f10,	[%l7 + 0x20]
	srlx	%l0,	%i7,	%l5
	sdivx	%o0,	0x0627,	%g5
	array8	%o4,	%g1,	%g3
	ldsb	[%l7 + 0x6A],	%g6
	fcmpeq32	%f12,	%f20,	%g4
	umul	%i1,	0x159B,	%l1
	edge32l	%o6,	%o1,	%l6
	sethi	0x068F,	%g7
	subcc	%i0,	0x0311,	%l3
	array32	%o7,	%i6,	%o3
	ldd	[%l7 + 0x78],	%f4
	fands	%f19,	%f19,	%f0
	fnor	%f6,	%f4,	%f28
	fnands	%f19,	%f22,	%f11
	movrgez	%o5,	%g2,	%o2
	movpos	%icc,	%i5,	%l4
	edge16ln	%l2,	%i4,	%i2
	sdivx	%l0,	0x16A5,	%i3
	movrgez	%i7,	%o0,	%g5
	movge	%icc,	%o4,	%g1
	nop
	set	0x34, %o3
	lduh	[%l7 + %o3],	%l5
	movne	%icc,	%g6,	%g4
	stw	%i1,	[%l7 + 0x30]
	udiv	%l1,	0x1AEE,	%g3
	smul	%o1,	0x01B9,	%l6
	and	%o6,	0x1EA7,	%g7
	ldsb	[%l7 + 0x4B],	%i0
	movrgz	%l3,	%o7,	%i6
	addcc	%o5,	0x0CC6,	%g2
	sll	%o3,	0x02,	%o2
	movg	%xcc,	%i5,	%l4
	fsrc2s	%f1,	%f30
	fnot2s	%f0,	%f19
	st	%f29,	[%l7 + 0x50]
	movle	%icc,	%l2,	%i4
	addccc	%l0,	%i3,	%i7
	movg	%xcc,	%o0,	%g5
	sub	%o4,	%g1,	%i2
	edge32l	%l5,	%g6,	%i1
	save %g4, 0x0A04, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovde	%xcc,	%f7,	%f9
	sllx	%g3,	%l6,	%o1
	edge16ln	%o6,	%i0,	%g7
	movrne	%o7,	0x130,	%l3
	fcmpgt16	%f20,	%f14,	%i6
	movg	%icc,	%g2,	%o5
	addccc	%o3,	0x04EF,	%o2
	udiv	%l4,	0x1E7F,	%l2
	fcmple32	%f30,	%f20,	%i4
	movrne	%i5,	0x16A,	%i3
	andncc	%l0,	%o0,	%i7
	stw	%g5,	[%l7 + 0x48]
	sra	%g1,	%o4,	%l5
	sdivcc	%i2,	0x1346,	%i1
	fnands	%f10,	%f11,	%f14
	mova	%icc,	%g6,	%l1
	fpadd16	%f30,	%f26,	%f8
	movcc	%xcc,	%g4,	%l6
	fmul8x16al	%f29,	%f23,	%f2
	sdivx	%o1,	0x1DB1,	%g3
	umul	%o6,	%g7,	%o7
	xnor	%i0,	%i6,	%l3
	alignaddrl	%g2,	%o3,	%o2
	sdivx	%o5,	0x0B92,	%l2
	fmuld8ulx16	%f16,	%f17,	%f8
	fmuld8sux16	%f15,	%f7,	%f12
	edge8	%l4,	%i5,	%i3
	stw	%l0,	[%l7 + 0x14]
	alignaddrl	%o0,	%i7,	%g5
	save %g1, 0x0641, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f9,	%f9
	edge32	%l5,	%i4,	%i2
	smul	%i1,	%l1,	%g6
	edge8n	%g4,	%o1,	%g3
	save %o6, 0x06A6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16s	%f27,	%f19,	%f8
	movrlez	%g7,	%o7,	%i0
	edge16ln	%i6,	%g2,	%o3
	sub	%l3,	0x1C5D,	%o5
	orcc	%o2,	%l2,	%l4
	smul	%i3,	%i5,	%o0
	movl	%icc,	%i7,	%g5
	movl	%icc,	%g1,	%l0
	sub	%o4,	%l5,	%i2
	popc	%i1,	%i4
	and	%l1,	%g4,	%g6
	andncc	%o1,	%o6,	%g3
	sra	%g7,	0x0B,	%o7
	fandnot2	%f24,	%f0,	%f30
	fnegs	%f5,	%f1
	fmuld8ulx16	%f13,	%f20,	%f2
	fcmpd	%fcc0,	%f16,	%f20
	fpsub16s	%f9,	%f18,	%f24
	array16	%i0,	%i6,	%g2
	udivcc	%o3,	0x1B71,	%l6
	edge16n	%l3,	%o2,	%o5
	fnors	%f11,	%f30,	%f4
	edge32	%l4,	%l2,	%i5
	edge32	%o0,	%i3,	%g5
	stx	%g1,	[%l7 + 0x48]
	xnor	%l0,	0x1BCC,	%i7
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%f6
	fsrc2	%f12,	%f28
	andn	%o4,	0x14BF,	%i2
	lduh	[%l7 + 0x3C],	%l5
	ldsb	[%l7 + 0x3D],	%i1
	xnorcc	%l1,	%i4,	%g4
	fmovdcc	%icc,	%f30,	%f12
	pdist	%f30,	%f30,	%f8
	nop
	set	0x30, %o7
	ldd	[%l7 + %o7],	%f0
	std	%f30,	[%l7 + 0x20]
	stx	%g6,	[%l7 + 0x28]
	ldd	[%l7 + 0x70],	%f8
	mulscc	%o1,	%g3,	%g7
	orcc	%o6,	0x0DBF,	%i0
	edge32l	%i6,	%g2,	%o3
	stw	%l6,	[%l7 + 0x44]
	mova	%xcc,	%o7,	%l3
	movpos	%icc,	%o5,	%o2
	movrne	%l2,	0x14B,	%i5
	fmovdl	%xcc,	%f22,	%f16
	subccc	%l4,	0x0A81,	%i3
	andncc	%o0,	%g5,	%g1
	std	%f16,	[%l7 + 0x28]
	edge8	%i7,	%o4,	%i2
	edge32l	%l0,	%l5,	%i1
	stx	%i4,	[%l7 + 0x20]
	addc	%l1,	%g4,	%g6
	movneg	%icc,	%g3,	%o1
	edge16	%o6,	%i0,	%i6
	movrgz	%g7,	0x3A6,	%g2
	fmovdl	%icc,	%f3,	%f11
	orncc	%o3,	0x03CF,	%o7
	fnands	%f10,	%f16,	%f21
	fmovdne	%icc,	%f8,	%f19
	movneg	%xcc,	%l3,	%o5
	edge8ln	%l6,	%o2,	%i5
	edge32n	%l2,	%l4,	%o0
	array32	%i3,	%g5,	%g1
	fexpand	%f7,	%f16
	stw	%o4,	[%l7 + 0x50]
	movrgz	%i7,	%l0,	%i2
	udivcc	%i1,	0x10A7,	%i4
	fmovsvs	%icc,	%f1,	%f14
	movcc	%icc,	%l1,	%l5
	ldsh	[%l7 + 0x2C],	%g4
	srlx	%g3,	%o1,	%g6
	fmovsneg	%icc,	%f16,	%f28
	ldx	[%l7 + 0x38],	%i0
	movrlz	%i6,	0x044,	%g7
	edge8l	%g2,	%o3,	%o7
	ldsb	[%l7 + 0x7C],	%o6
	edge8	%l3,	%l6,	%o5
	sdivx	%o2,	0x1E52,	%l2
	fmovrdgez	%i5,	%f22,	%f4
	andncc	%o0,	%i3,	%g5
	fmovrdgz	%g1,	%f16,	%f24
	edge32n	%l4,	%i7,	%l0
	srl	%i2,	0x1A,	%o4
	andncc	%i1,	%i4,	%l5
	ldd	[%l7 + 0x58],	%f2
	movgu	%icc,	%l1,	%g4
	xor	%o1,	0x0ACA,	%g6
	fxors	%f24,	%f16,	%f21
	fmul8x16au	%f24,	%f17,	%f26
	popc	0x0174,	%i0
	ld	[%l7 + 0x2C],	%f6
	array8	%g3,	%g7,	%g2
	movpos	%xcc,	%o3,	%i6
	umul	%o7,	%l3,	%l6
	lduw	[%l7 + 0x4C],	%o5
	subc	%o2,	%o6,	%l2
	fmovdcc	%icc,	%f18,	%f9
	alignaddr	%o0,	%i3,	%g5
	mulx	%g1,	%i5,	%l4
	movle	%icc,	%i7,	%l0
	addcc	%i2,	%o4,	%i1
	edge16n	%i4,	%l1,	%g4
	fandnot2s	%f21,	%f24,	%f6
	edge16l	%o1,	%l5,	%g6
	move	%icc,	%i0,	%g3
	edge16l	%g2,	%o3,	%i6
	stw	%o7,	[%l7 + 0x60]
	lduh	[%l7 + 0x74],	%g7
	edge32ln	%l6,	%o5,	%o2
	move	%icc,	%o6,	%l3
	sll	%o0,	%l2,	%i3
	fcmps	%fcc0,	%f23,	%f14
	sth	%g5,	[%l7 + 0x0C]
	movneg	%icc,	%g1,	%i5
	ldub	[%l7 + 0x58],	%l4
	fmovdle	%xcc,	%f0,	%f2
	smulcc	%l0,	%i2,	%o4
	movl	%xcc,	%i7,	%i1
	xorcc	%i4,	%l1,	%g4
	movrlz	%o1,	%l5,	%g6
	ldd	[%l7 + 0x60],	%i0
	mulx	%g3,	%o3,	%g2
	srlx	%i6,	%o7,	%g7
	edge16	%l6,	%o2,	%o6
	edge16ln	%o5,	%o0,	%l2
	mova	%icc,	%l3,	%g5
	srl	%g1,	%i3,	%l4
	sub	%i5,	%i2,	%o4
	fmovd	%f10,	%f28
	movg	%icc,	%i7,	%l0
	edge8	%i1,	%l1,	%g4
	fandnot2s	%f22,	%f6,	%f19
	movcs	%icc,	%i4,	%o1
	array16	%l5,	%i0,	%g3
	umul	%g6,	%o3,	%i6
	movrlez	%o7,	%g7,	%l6
	movrgez	%g2,	0x04A,	%o2
	pdist	%f8,	%f14,	%f14
	xorcc	%o6,	%o5,	%l2
	andn	%l3,	%g5,	%o0
	stw	%i3,	[%l7 + 0x18]
	fxors	%f6,	%f15,	%f1
	ldd	[%l7 + 0x58],	%f6
	sllx	%g1,	0x07,	%l4
	fandnot1s	%f22,	%f20,	%f18
	subcc	%i5,	%i2,	%i7
	ldub	[%l7 + 0x5E],	%l0
	ldsb	[%l7 + 0x0B],	%i1
	edge16	%o4,	%l1,	%i4
	movrlez	%g4,	0x1B0,	%l5
	stx	%i0,	[%l7 + 0x28]
	movne	%icc,	%g3,	%g6
	orn	%o1,	%o3,	%i6
	edge32n	%g7,	%o7,	%l6
	fcmpne32	%f0,	%f14,	%g2
	movn	%icc,	%o6,	%o2
	lduh	[%l7 + 0x76],	%l2
	array8	%o5,	%l3,	%g5
	array8	%o0,	%i3,	%l4
	addc	%i5,	%g1,	%i7
	andcc	%l0,	0x127A,	%i2
	srax	%i1,	%o4,	%i4
	movre	%l1,	0x3EC,	%g4
	udiv	%i0,	0x04B1,	%l5
	fsrc1	%f10,	%f24
	xnorcc	%g3,	%o1,	%g6
	fsrc1s	%f4,	%f29
	xnor	%o3,	%g7,	%o7
	udivcc	%i6,	0x0401,	%l6
	fnot1	%f30,	%f24
	edge32ln	%g2,	%o6,	%o2
	move	%icc,	%o5,	%l2
	edge32n	%l3,	%o0,	%i3
	stw	%l4,	[%l7 + 0x40]
	ldsb	[%l7 + 0x2C],	%i5
	ldd	[%l7 + 0x60],	%g0
	orcc	%i7,	%g5,	%i2
	edge32	%i1,	%l0,	%o4
	smulcc	%i4,	0x05CE,	%l1
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	fmovdge	%icc,	%f31,	%f12
	movle	%icc,	%l5,	%g3
	sdiv	%o1,	0x0B63,	%o3
	move	%xcc,	%g6,	%g7
	movneg	%xcc,	%i6,	%l6
	move	%xcc,	%o7,	%o6
	sethi	0x011F,	%o2
	alignaddr	%o5,	%l2,	%l3
	fabss	%f12,	%f28
	movleu	%icc,	%o0,	%g2
	edge32ln	%i3,	%i5,	%l4
	edge32l	%g1,	%i7,	%g5
	edge16n	%i1,	%i2,	%o4
	fmovscc	%icc,	%f2,	%f16
	movgu	%icc,	%l0,	%i4
	st	%f27,	[%l7 + 0x6C]
	fmovsa	%icc,	%f11,	%f8
	ldd	[%l7 + 0x30],	%f8
	edge16ln	%l1,	%g4,	%i0
	movgu	%xcc,	%g3,	%o1
	fornot2	%f12,	%f0,	%f16
	srax	%l5,	%g6,	%o3
	fpack32	%f10,	%f8,	%f18
	fmovrdne	%i6,	%f28,	%f0
	ldd	[%l7 + 0x10],	%f30
	st	%f22,	[%l7 + 0x10]
	movrlez	%l6,	0x1B3,	%g7
	fornot2s	%f7,	%f28,	%f6
	smulcc	%o7,	%o2,	%o5
	udivcc	%o6,	0x1C0A,	%l2
	sub	%l3,	0x1BC6,	%o0
	movge	%icc,	%g2,	%i3
	fmovd	%f26,	%f22
	for	%f12,	%f20,	%f2
	movgu	%xcc,	%l4,	%i5
	subccc	%g1,	0x097B,	%i7
	xnorcc	%i1,	%i2,	%g5
	or	%l0,	%o4,	%i4
	fpmerge	%f8,	%f14,	%f10
	std	%f12,	[%l7 + 0x40]
	movrne	%l1,	%i0,	%g3
	movre	%o1,	%g4,	%l5
	lduw	[%l7 + 0x24],	%o3
	movvc	%xcc,	%g6,	%i6
	mulscc	%g7,	0x140C,	%l6
	stb	%o7,	[%l7 + 0x30]
	fnot1s	%f26,	%f25
	movneg	%icc,	%o2,	%o5
	move	%icc,	%l2,	%o6
	or	%l3,	%o0,	%g2
	movn	%xcc,	%i3,	%i5
	fmovdgu	%xcc,	%f13,	%f29
	array32	%l4,	%i7,	%i1
	fmovdleu	%icc,	%f28,	%f3
	movrgez	%g1,	%g5,	%l0
	sethi	0x10E1,	%o4
	fmul8x16al	%f28,	%f13,	%f14
	movleu	%icc,	%i2,	%i4
	movrlz	%l1,	0x3AA,	%g3
	sllx	%i0,	0x18,	%g4
	movg	%icc,	%l5,	%o1
	fmovsn	%xcc,	%f19,	%f25
	fmovsgu	%xcc,	%f19,	%f18
	addcc	%o3,	%i6,	%g6
	edge16l	%l6,	%g7,	%o7
	sethi	0x06F4,	%o2
	orcc	%o5,	%l2,	%o6
	movg	%icc,	%l3,	%g2
	movn	%xcc,	%o0,	%i5
	movn	%xcc,	%i3,	%l4
	add	%i7,	%i1,	%g5
	add	%l0,	%o4,	%i2
	st	%f7,	[%l7 + 0x44]
	bshuffle	%f30,	%f28,	%f22
	mulscc	%g1,	0x011E,	%l1
	fmovrsgz	%i4,	%f17,	%f4
	movleu	%icc,	%i0,	%g3
	subcc	%g4,	0x03E6,	%o1
	lduh	[%l7 + 0x4E],	%l5
	edge16	%i6,	%o3,	%l6
	edge16n	%g7,	%o7,	%o2
	fmovdpos	%xcc,	%f25,	%f8
	movre	%g6,	%l2,	%o5
	restore %l3, 0x05A9, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%g2,	%i5,	%o0
	popc	%i3,	%l4
	mulx	%i1,	0x0292,	%i7
	or	%l0,	0x0852,	%g5
	movpos	%icc,	%i2,	%o4
	subc	%g1,	0x0A1A,	%l1
	sdivcc	%i4,	0x1CA5,	%g3
	fcmpd	%fcc1,	%f16,	%f20
	umulcc	%i0,	%g4,	%o1
	ldub	[%l7 + 0x18],	%l5
	fpsub16s	%f16,	%f3,	%f19
	stb	%o3,	[%l7 + 0x11]
	edge16	%i6,	%l6,	%g7
	nop
	set	0x48, %g2
	ldsb	[%l7 + %g2],	%o2
	sllx	%o7,	%g6,	%o5
	srl	%l2,	%o6,	%g2
	fmovsa	%icc,	%f9,	%f9
	addc	%l3,	0x1DE6,	%o0
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	lduh	[%l7 + 0x5E],	%l4
	nop
	set	0x50, %l4
	lduw	[%l7 + %l4],	%i7
	srax	%i1,	0x13,	%l0
	restore %g5, %i2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l1,	0x024,	%o4
	bshuffle	%f20,	%f8,	%f10
	edge32ln	%i4,	%g3,	%i0
	fzeros	%f2
	sll	%o1,	0x0A,	%g4
	fmovdvs	%icc,	%f13,	%f24
	array32	%l5,	%o3,	%i6
	stb	%g7,	[%l7 + 0x73]
	sethi	0x1031,	%o2
	std	%f2,	[%l7 + 0x20]
	udiv	%l6,	0x14CF,	%o7
	nop
	set	0x7A, %i6
	lduh	[%l7 + %i6],	%o5
	array8	%g6,	%o6,	%g2
	stw	%l2,	[%l7 + 0x50]
	fornot1	%f18,	%f0,	%f8
	fnands	%f6,	%f1,	%f31
	movleu	%icc,	%l3,	%o0
	fcmple16	%f8,	%f4,	%i5
	edge8ln	%l4,	%i3,	%i1
	movcc	%icc,	%i7,	%l0
	andncc	%g5,	%g1,	%l1
	mulx	%i2,	%i4,	%o4
	subc	%i0,	%g3,	%o1
	ldd	[%l7 + 0x08],	%g4
	fmovdl	%xcc,	%f4,	%f14
	movgu	%xcc,	%l5,	%o3
	umulcc	%i6,	%g7,	%o2
	movl	%icc,	%l6,	%o5
	sdivcc	%g6,	0x1C76,	%o7
	array32	%g2,	%l2,	%l3
	edge16ln	%o6,	%o0,	%i5
	fornot1s	%f10,	%f3,	%f23
	fmovrdgz	%l4,	%f20,	%f24
	fxnors	%f1,	%f8,	%f24
	fmovse	%icc,	%f5,	%f5
	fmovsn	%icc,	%f18,	%f21
	fmovdvc	%icc,	%f17,	%f0
	fmovrdlz	%i3,	%f20,	%f10
	fcmple16	%f8,	%f6,	%i1
	fpadd32s	%f4,	%f10,	%f16
	fzeros	%f21
	sllx	%i7,	0x0E,	%g5
	fmovsge	%xcc,	%f3,	%f8
	fornot1	%f26,	%f6,	%f22
	save %g1, %l1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i4,	%o4,	%i0
	andn	%i2,	%g3,	%o1
	edge32ln	%l5,	%o3,	%g4
	fnot2s	%f8,	%f12
	udivcc	%i6,	0x191B,	%g7
	edge8	%l6,	%o2,	%o5
	orcc	%g6,	%o7,	%g2
	movgu	%icc,	%l2,	%l3
	fnors	%f12,	%f10,	%f13
	movge	%xcc,	%o6,	%o0
	fxnors	%f17,	%f2,	%f23
	fmovscc	%icc,	%f31,	%f26
	sethi	0x0F3D,	%l4
	add	%i5,	0x0484,	%i3
	lduh	[%l7 + 0x46],	%i7
	movcc	%icc,	%i1,	%g5
	fcmple32	%f20,	%f10,	%g1
	alignaddr	%l0,	%i4,	%o4
	ldd	[%l7 + 0x58],	%f26
	ld	[%l7 + 0x2C],	%f14
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fmovsleu	%icc,	%f3,	%f25
	smul	%o1,	0x0B55,	%i0
	udivx	%l5,	0x141A,	%g4
	edge32ln	%o3,	%i6,	%g7
	fpack16	%f0,	%f30
	array32	%l6,	%o2,	%o5
	fnand	%f26,	%f18,	%f20
	edge8n	%g6,	%g2,	%o7
	fornot1	%f12,	%f20,	%f24
	movcc	%xcc,	%l3,	%l2
	movvc	%icc,	%o6,	%o0
	xnor	%l4,	%i3,	%i7
	fmovscc	%icc,	%f27,	%f28
	umulcc	%i5,	0x0A18,	%i1
	movg	%icc,	%g5,	%g1
	movpos	%xcc,	%i4,	%l0
	movvs	%icc,	%o4,	%i2
	movleu	%xcc,	%g3,	%l1
	fcmpne16	%f28,	%f10,	%o1
	sethi	0x1C06,	%l5
	xor	%g4,	0x0E8B,	%i0
	popc	0x1F51,	%i6
	edge8l	%g7,	%l6,	%o2
	andn	%o5,	0x092A,	%g6
	edge32l	%g2,	%o3,	%o7
	movle	%icc,	%l3,	%l2
	and	%o0,	%l4,	%i3
	smul	%o6,	0x135C,	%i7
	xnorcc	%i1,	0x1617,	%g5
	st	%f19,	[%l7 + 0x30]
	sdiv	%g1,	0x1B8F,	%i4
	edge8l	%i5,	%l0,	%o4
	fcmps	%fcc0,	%f6,	%f11
	alignaddrl	%i2,	%g3,	%o1
	movrgz	%l5,	%g4,	%l1
	edge8l	%i0,	%g7,	%i6
	ld	[%l7 + 0x54],	%f25
	sub	%l6,	0x14A7,	%o2
	ldd	[%l7 + 0x48],	%g6
	movge	%xcc,	%o5,	%o3
	movrlz	%g2,	0x0D0,	%l3
	array8	%o7,	%o0,	%l4
	fmovrdlz	%l2,	%f10,	%f10
	mulx	%o6,	0x1E7C,	%i3
	ldx	[%l7 + 0x30],	%i7
	fmovdgu	%xcc,	%f14,	%f26
	fnands	%f8,	%f2,	%f1
	fpsub16	%f10,	%f20,	%f20
	ldsh	[%l7 + 0x40],	%i1
	fxors	%f6,	%f26,	%f20
	movge	%xcc,	%g1,	%g5
	xorcc	%i5,	0x1F90,	%i4
	faligndata	%f4,	%f10,	%f20
	movl	%xcc,	%o4,	%i2
	andcc	%g3,	0x0656,	%o1
	edge8	%l0,	%g4,	%l5
	lduh	[%l7 + 0x2A],	%l1
	addccc	%g7,	0x076F,	%i6
	movrlz	%i0,	0x3A8,	%o2
	smul	%l6,	0x1E0E,	%o5
	st	%f30,	[%l7 + 0x08]
	siam	0x0
	bshuffle	%f0,	%f0,	%f10
	andncc	%g6,	%g2,	%o3
	fandnot2	%f2,	%f4,	%f24
	movg	%icc,	%o7,	%o0
	edge16l	%l3,	%l2,	%l4
	stb	%i3,	[%l7 + 0x24]
	movne	%icc,	%o6,	%i1
	andncc	%g1,	%i7,	%g5
	subc	%i5,	%o4,	%i2
	fmovsvs	%icc,	%f2,	%f0
	fmuld8sux16	%f24,	%f26,	%f24
	udivcc	%i4,	0x073E,	%o1
	xor	%l0,	%g3,	%l5
	movle	%icc,	%l1,	%g7
	movneg	%xcc,	%i6,	%g4
	orcc	%i0,	%l6,	%o2
	fmul8ulx16	%f28,	%f22,	%f8
	edge8l	%o5,	%g6,	%g2
	fpsub32	%f22,	%f30,	%f6
	movne	%xcc,	%o3,	%o7
	nop
	set	0x30, %g3
	stw	%l3,	[%l7 + %g3]
	smul	%l2,	%l4,	%i3
	or	%o6,	0x1D17,	%o0
	movne	%xcc,	%i1,	%i7
	array32	%g5,	%i5,	%o4
	sdivx	%i2,	0x083B,	%i4
	srl	%g1,	0x17,	%o1
	fmovs	%f0,	%f3
	or	%l0,	0x13C0,	%g3
	srlx	%l1,	%g7,	%i6
	movrlz	%l5,	0x35E,	%g4
	fones	%f7
	or	%i0,	%o2,	%l6
	srlx	%o5,	%g2,	%g6
	fmovd	%f16,	%f18
	edge8ln	%o7,	%l3,	%o3
	lduw	[%l7 + 0x7C],	%l4
	add	%i3,	%o6,	%l2
	fmovrsgz	%i1,	%f16,	%f31
	xnorcc	%i7,	%o0,	%i5
	ldsh	[%l7 + 0x74],	%o4
	siam	0x5
	umulcc	%i2,	%i4,	%g5
	udiv	%o1,	0x07E4,	%l0
	srl	%g1,	0x1A,	%l1
	siam	0x4
	fnegs	%f16,	%f30
	andncc	%g7,	%i6,	%l5
	movvs	%icc,	%g4,	%i0
	alignaddrl	%o2,	%g3,	%l6
	movneg	%xcc,	%o5,	%g6
	movneg	%icc,	%o7,	%l3
	fmovdge	%icc,	%f28,	%f1
	xnorcc	%o3,	%g2,	%l4
	movl	%icc,	%o6,	%l2
	movcc	%xcc,	%i3,	%i1
	orn	%i7,	0x07B1,	%i5
	save %o0, %o4, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%g5,	%i4,	%o1
	ldd	[%l7 + 0x38],	%f4
	fabss	%f16,	%f8
	array32	%g1,	%l1,	%g7
	ldsh	[%l7 + 0x4E],	%l0
	sra	%l5,	0x14,	%i6
	subcc	%g4,	0x18CE,	%i0
	fmovsa	%icc,	%f10,	%f12
	movne	%icc,	%g3,	%l6
	umulcc	%o2,	0x00B9,	%o5
	sllx	%g6,	%o7,	%l3
	nop
	set	0x42, %l3
	sth	%g2,	[%l7 + %l3]
	udiv	%o3,	0x16E1,	%o6
	orncc	%l2,	%i3,	%l4
	andcc	%i1,	%i5,	%i7
	fandnot2s	%f12,	%f20,	%f16
	sdivcc	%o4,	0x0C1B,	%o0
	movg	%xcc,	%g5,	%i4
	ldub	[%l7 + 0x19],	%i2
	sll	%o1,	0x12,	%g1
	ld	[%l7 + 0x44],	%f14
	ldub	[%l7 + 0x13],	%l1
	fpadd16s	%f16,	%f3,	%f15
	ldx	[%l7 + 0x50],	%g7
	array16	%l5,	%i6,	%l0
	fpadd16	%f10,	%f10,	%f30
	or	%g4,	0x1BF4,	%g3
	sra	%l6,	%o2,	%i0
	sllx	%o5,	0x07,	%g6
	array16	%l3,	%o7,	%g2
	fornot2s	%f29,	%f25,	%f17
	orncc	%o6,	0x0986,	%l2
	edge32ln	%i3,	%l4,	%o3
	srlx	%i1,	0x04,	%i7
	sdivcc	%i5,	0x1DB3,	%o0
	ldd	[%l7 + 0x08],	%g4
	addc	%o4,	0x014B,	%i4
	sdiv	%i2,	0x0135,	%g1
	srlx	%o1,	0x08,	%g7
	mulscc	%l5,	0x11DD,	%i6
	alignaddr	%l0,	%g4,	%g3
	or	%l6,	%o2,	%l1
	edge32n	%i0,	%o5,	%g6
	lduh	[%l7 + 0x50],	%o7
	movpos	%xcc,	%g2,	%o6
	sethi	0x08BF,	%l2
	save %l3, 0x1375, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o3,	%i3,	%i1
	fmovs	%f18,	%f4
	srlx	%i7,	%o0,	%g5
	udivx	%i5,	0x1577,	%i4
	fmovdge	%xcc,	%f15,	%f29
	andncc	%o4,	%g1,	%o1
	stw	%g7,	[%l7 + 0x74]
	sir	0x00D7
	alignaddr	%l5,	%i2,	%l0
	sir	0x0AED
	movg	%icc,	%i6,	%g4
	fnands	%f24,	%f30,	%f2
	andncc	%g3,	%l6,	%o2
	movcc	%xcc,	%l1,	%i0
	st	%f8,	[%l7 + 0x3C]
	movgu	%xcc,	%g6,	%o7
	orcc	%g2,	%o6,	%o5
	edge32n	%l2,	%l4,	%o3
	stw	%i3,	[%l7 + 0x0C]
	xor	%l3,	0x0C75,	%i1
	movcc	%icc,	%i7,	%g5
	sethi	0x1C0D,	%o0
	sra	%i5,	%i4,	%g1
	nop
	set	0x28, %i0
	ldd	[%l7 + %i0],	%o4
	fmovse	%xcc,	%f12,	%f4
	fabsd	%f28,	%f4
	fandnot2	%f12,	%f10,	%f10
	popc	%g7,	%l5
	fandnot2s	%f7,	%f21,	%f28
	edge16l	%i2,	%l0,	%o1
	array8	%g4,	%g3,	%i6
	edge32ln	%l6,	%o2,	%l1
	srlx	%g6,	0x04,	%o7
	smulcc	%i0,	0x0FE3,	%g2
	sdivcc	%o5,	0x0250,	%o6
	edge32ln	%l2,	%o3,	%i3
	edge16	%l4,	%i1,	%i7
	edge8ln	%g5,	%o0,	%l3
	sth	%i5,	[%l7 + 0x14]
	addccc	%g1,	0x0251,	%o4
	fcmpeq16	%f20,	%f12,	%g7
	fmovdcc	%icc,	%f18,	%f25
	ldsh	[%l7 + 0x22],	%l5
	xorcc	%i2,	0x174E,	%i4
	stb	%l0,	[%l7 + 0x36]
	ldsb	[%l7 + 0x7C],	%g4
	stx	%g3,	[%l7 + 0x28]
	fnot1	%f22,	%f8
	sra	%o1,	0x0A,	%l6
	movneg	%xcc,	%i6,	%l1
	ldsb	[%l7 + 0x5C],	%g6
	movrlz	%o2,	%o7,	%g2
	fandnot2	%f6,	%f18,	%f24
	udivx	%o5,	0x0AFF,	%i0
	movcc	%icc,	%o6,	%o3
	move	%icc,	%l2,	%i3
	fnot1s	%f26,	%f13
	subccc	%l4,	0x01A6,	%i7
	stw	%g5,	[%l7 + 0x4C]
	movgu	%xcc,	%o0,	%i1
	movneg	%icc,	%i5,	%l3
	movvs	%icc,	%g1,	%g7
	edge32ln	%o4,	%l5,	%i2
	add	%i4,	0x067D,	%g4
	udivx	%g3,	0x16ED,	%l0
	ldub	[%l7 + 0x18],	%l6
	ldsb	[%l7 + 0x24],	%i6
	fsrc1	%f6,	%f24
	fnegd	%f6,	%f24
	smulcc	%l1,	0x0283,	%o1
	movleu	%icc,	%o2,	%g6
	fornot1	%f20,	%f0,	%f22
	movrgez	%o7,	%o5,	%g2
	sdivcc	%o6,	0x0490,	%i0
	or	%l2,	0x0BBA,	%o3
	ldsh	[%l7 + 0x66],	%i3
	fand	%f2,	%f18,	%f18
	ld	[%l7 + 0x40],	%f31
	addcc	%i7,	%l4,	%g5
	movvc	%xcc,	%o0,	%i1
	subcc	%l3,	%g1,	%i5
	ldsh	[%l7 + 0x78],	%g7
	udivx	%l5,	0x1239,	%o4
	andncc	%i2,	%g4,	%i4
	fnand	%f22,	%f26,	%f28
	movg	%icc,	%l0,	%g3
	fmovdcs	%icc,	%f6,	%f10
	fpsub32	%f28,	%f20,	%f20
	alignaddrl	%l6,	%i6,	%l1
	orncc	%o2,	%g6,	%o1
	fmovdpos	%icc,	%f5,	%f21
	xnor	%o7,	%g2,	%o6
	fnegs	%f11,	%f8
	edge32	%o5,	%l2,	%o3
	fpadd16s	%f6,	%f2,	%f5
	movrgez	%i3,	0x3B1,	%i0
	fmovsleu	%icc,	%f13,	%f6
	add	%l4,	%i7,	%g5
	save %i1, 0x16EF, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%o0,	0x305,	%g1
	fmovdge	%xcc,	%f0,	%f11
	sdivcc	%g7,	0x03F8,	%l5
	edge32n	%o4,	%i5,	%g4
	std	%f6,	[%l7 + 0x18]
	fones	%f20
	sir	0x1DF2
	orncc	%i2,	%i4,	%g3
	udivx	%l6,	0x1945,	%l0
	siam	0x3
	sllx	%l1,	%i6,	%g6
	srlx	%o1,	%o7,	%g2
	fmovrdlz	%o6,	%f4,	%f6
	fmovda	%icc,	%f28,	%f7
	array32	%o5,	%o2,	%l2
	fmovscc	%icc,	%f31,	%f14
	add	%o3,	%i0,	%i3
	sub	%i7,	0x098E,	%g5
	fmovsle	%xcc,	%f10,	%f8
	orn	%i1,	0x169F,	%l3
	sdiv	%o0,	0x02AB,	%l4
	ldd	[%l7 + 0x70],	%g6
	restore %l5, %o4, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%g4,	%i2,	%g1
	movne	%xcc,	%i4,	%g3
	udiv	%l6,	0x01C5,	%l0
	or	%l1,	%g6,	%o1
	movrgez	%o7,	0x15A,	%g2
	stb	%o6,	[%l7 + 0x10]
	sllx	%i6,	%o5,	%l2
	fnors	%f20,	%f19,	%f5
	edge32l	%o3,	%o2,	%i0
	fmovrdlez	%i3,	%f4,	%f14
	addc	%g5,	0x1C82,	%i1
	fmovdcs	%icc,	%f10,	%f19
	ld	[%l7 + 0x18],	%f9
	fmovdgu	%icc,	%f26,	%f5
	save %l3, %i7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1	%f26,	%f30,	%f16
	array32	%o0,	%l5,	%o4
	nop
	set	0x52, %i7
	stb	%g7,	[%l7 + %i7]
	movpos	%xcc,	%i5,	%g4
	orn	%i2,	%i4,	%g3
	movcs	%icc,	%g1,	%l0
	fmovrdlez	%l6,	%f26,	%f4
	fmovdn	%xcc,	%f0,	%f0
	edge16n	%l1,	%g6,	%o7
	srlx	%o1,	0x0E,	%g2
	andcc	%o6,	%o5,	%l2
	movneg	%xcc,	%o3,	%i6
	andncc	%o2,	%i0,	%i3
	movvc	%icc,	%g5,	%l3
	orncc	%i7,	0x03D7,	%i1
	edge16ln	%o0,	%l5,	%o4
	fsrc2s	%f28,	%f10
	nop
	set	0x30, %g7
	ldd	[%l7 + %g7],	%l4
	add	%i5,	%g7,	%i2
	ld	[%l7 + 0x60],	%f7
	edge8	%g4,	%i4,	%g1
	xnor	%g3,	%l6,	%l1
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	fmovdge	%icc,	%f9,	%f29
	and	%g2,	%o6,	%l0
	fnands	%f31,	%f5,	%f20
	fpack16	%f8,	%f13
	movrlz	%o5,	%l2,	%o3
	lduw	[%l7 + 0x10],	%o2
	nop
	set	0x1C, %i4
	stw	%i0,	[%l7 + %i4]
	fxor	%f2,	%f4,	%f0
	edge16l	%i3,	%i6,	%l3
	stb	%i7,	[%l7 + 0x65]
	ldx	[%l7 + 0x28],	%i1
	edge16ln	%o0,	%g5,	%o4
	add	%l4,	%i5,	%l5
	popc	%g7,	%g4
	movrlez	%i4,	0x149,	%g1
	fmovdle	%icc,	%f9,	%f26
	xor	%g3,	0x1C16,	%i2
	nop
	set	0x70, %i3
	ldx	[%l7 + %i3],	%l6
	sll	%g6,	0x0C,	%o7
	sllx	%o1,	0x0E,	%l1
	andn	%o6,	0x1370,	%g2
	xor	%o5,	%l0,	%o3
	lduh	[%l7 + 0x26],	%o2
	movrgez	%i0,	%i3,	%i6
	movcs	%icc,	%l3,	%i7
	fmovsle	%xcc,	%f28,	%f28
	fand	%f28,	%f4,	%f18
	restore %l2, %i1, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f14,	%f24
	nop
	set	0x2F, %g6
	stb	%o0,	[%l7 + %g6]
	ldsh	[%l7 + 0x56],	%l4
	srl	%o4,	0x0B,	%i5
	alignaddr	%l5,	%g7,	%g4
	edge16n	%i4,	%g3,	%i2
	fcmpgt32	%f12,	%f2,	%l6
	movrgz	%g6,	%g1,	%o1
	std	%f14,	[%l7 + 0x30]
	fmovda	%xcc,	%f20,	%f0
	edge32l	%o7,	%o6,	%g2
	edge32	%l1,	%o5,	%l0
	alignaddrl	%o3,	%o2,	%i0
	ld	[%l7 + 0x24],	%f31
	sth	%i6,	[%l7 + 0x14]
	array16	%l3,	%i7,	%l2
	fone	%f30
	edge32ln	%i3,	%g5,	%i1
	smul	%o0,	%l4,	%i5
	movpos	%icc,	%l5,	%o4
	udiv	%g4,	0x0AFD,	%g7
	sdivx	%g3,	0x1FEA,	%i4
	fornot2s	%f3,	%f16,	%f17
	umul	%i2,	0x0057,	%g6
	ldsb	[%l7 + 0x58],	%g1
	movl	%xcc,	%o1,	%l6
	fmul8x16al	%f0,	%f29,	%f6
	edge8n	%o7,	%g2,	%o6
	mova	%icc,	%l1,	%l0
	subcc	%o3,	%o5,	%i0
	mova	%icc,	%i6,	%o2
	sir	0x1846
	move	%icc,	%l3,	%l2
	add	%i7,	0x1829,	%i3
	addccc	%g5,	0x1015,	%o0
	nop
	set	0x63, %i5
	ldsb	[%l7 + %i5],	%i1
	movrlez	%l4,	0x128,	%l5
	edge16n	%i5,	%o4,	%g4
	movrgez	%g3,	%g7,	%i4
	edge8l	%i2,	%g1,	%o1
	add	%g6,	%o7,	%l6
	umulcc	%o6,	0x11CF,	%g2
	sdivcc	%l1,	0x1C52,	%o3
	alignaddr	%o5,	%l0,	%i6
	andncc	%o2,	%i0,	%l2
	movl	%icc,	%i7,	%i3
	fcmpeq16	%f0,	%f24,	%g5
	subc	%o0,	%i1,	%l4
	fmovdgu	%icc,	%f12,	%f18
	movcs	%icc,	%l3,	%i5
	udivx	%o4,	0x1DE3,	%l5
	move	%xcc,	%g4,	%g3
	andn	%i4,	%g7,	%i2
	edge8n	%o1,	%g6,	%o7
	movrgez	%g1,	0x286,	%l6
	fmovspos	%icc,	%f8,	%f13
	save %o6, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x68],	%f16
	sth	%o5,	[%l7 + 0x76]
	movrne	%l0,	0x041,	%i6
	edge8	%l1,	%o2,	%i0
	movge	%icc,	%l2,	%i3
	umul	%g5,	%i7,	%i1
	xnor	%o0,	0x1FE2,	%l4
	umulcc	%l3,	%i5,	%l5
	movrgz	%o4,	%g3,	%i4
	fnor	%f16,	%f20,	%f0
	ldsb	[%l7 + 0x40],	%g7
	and	%i2,	0x1072,	%g4
	edge8	%o1,	%o7,	%g6
	save %l6, 0x103B, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o6, 0x0AE8, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f23,	%f7
	fmul8x16au	%f30,	%f3,	%f12
	edge16n	%o5,	%o3,	%i6
	stw	%l1,	[%l7 + 0x20]
	movrlz	%o2,	0x3EA,	%i0
	andn	%l2,	%l0,	%g5
	movcc	%xcc,	%i7,	%i3
	srl	%i1,	0x0A,	%l4
	move	%icc,	%l3,	%i5
	movrgez	%l5,	0x138,	%o4
	fmovdvc	%xcc,	%f26,	%f12
	sdivcc	%o0,	0x0B63,	%g3
	fmovrse	%g7,	%f24,	%f12
	popc	0x18A3,	%i2
	fmovda	%icc,	%f17,	%f20
	sdivx	%i4,	0x12FB,	%o1
	movvc	%icc,	%g4,	%g6
	fsrc1s	%f29,	%f10
	movrne	%l6,	0x014,	%o7
	srlx	%o6,	0x0D,	%g1
	ldx	[%l7 + 0x28],	%o5
	fmovsle	%xcc,	%f6,	%f2
	sdivcc	%o3,	0x1094,	%i6
	xorcc	%l1,	0x1CC2,	%o2
	umul	%g2,	%l2,	%l0
	add	%i0,	%g5,	%i3
	srl	%i7,	%l4,	%l3
	movn	%xcc,	%i5,	%l5
	edge32n	%o4,	%o0,	%g3
	fmovdg	%xcc,	%f21,	%f14
	fnor	%f16,	%f18,	%f12
	fnand	%f16,	%f2,	%f20
	udiv	%g7,	0x0171,	%i1
	fornot2	%f10,	%f26,	%f18
	alignaddrl	%i2,	%o1,	%g4
	movcs	%icc,	%i4,	%l6
	subccc	%o7,	%o6,	%g6
	fornot2	%f30,	%f12,	%f4
	srax	%o5,	0x1A,	%g1
	array8	%i6,	%o3,	%l1
	xnor	%o2,	0x1D7C,	%l2
	sll	%l0,	0x00,	%i0
	smulcc	%g2,	0x11BF,	%g5
	add	%i7,	%l4,	%l3
	edge16ln	%i5,	%i3,	%o4
	movle	%xcc,	%l5,	%o0
	mulx	%g7,	0x0EFE,	%g3
	alignaddrl	%i1,	%o1,	%i2
	or	%g4,	0x1C96,	%l6
	alignaddrl	%o7,	%i4,	%g6
	xnor	%o5,	0x1694,	%g1
	srax	%i6,	0x0C,	%o6
	edge8l	%o3,	%o2,	%l2
	edge16n	%l0,	%i0,	%g2
	array32	%g5,	%i7,	%l4
	movne	%xcc,	%l1,	%l3
	mulscc	%i3,	%o4,	%i5
	smulcc	%l5,	0x030E,	%o0
	fmul8ulx16	%f20,	%f24,	%f12
	srl	%g3,	0x01,	%i1
	udivcc	%g7,	0x135D,	%i2
	fandnot2s	%f20,	%f7,	%f3
	fmovrdne	%o1,	%f18,	%f20
	ldub	[%l7 + 0x33],	%g4
	edge16ln	%l6,	%i4,	%g6
	ld	[%l7 + 0x70],	%f15
	movrgez	%o7,	%o5,	%i6
	fand	%f12,	%f20,	%f14
	sdivcc	%g1,	0x012B,	%o6
	subc	%o2,	0x08BB,	%l2
	sir	0x1587
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	save %g2, 0x177F, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i7,	%l4
	ld	[%l7 + 0x38],	%f12
	st	%f6,	[%l7 + 0x1C]
	ldd	[%l7 + 0x40],	%g4
	orn	%l1,	0x0E2A,	%l3
	edge16ln	%o4,	%i5,	%i3
	fpsub32	%f22,	%f30,	%f20
	movrgz	%o0,	0x0F4,	%l5
	stw	%g3,	[%l7 + 0x70]
	mulx	%g7,	0x0AF3,	%i1
	or	%i2,	0x1651,	%o1
	udiv	%l6,	0x1336,	%i4
	lduh	[%l7 + 0x34],	%g6
	nop
	set	0x46, %o5
	sth	%g4,	[%l7 + %o5]
	smulcc	%o7,	0x1600,	%i6
	addccc	%g1,	%o6,	%o5
	orn	%o2,	%l2,	%l0
	movrlez	%i0,	0x0A2,	%o3
	st	%f9,	[%l7 + 0x2C]
	sra	%g2,	%i7,	%g5
	stx	%l4,	[%l7 + 0x70]
	sth	%l1,	[%l7 + 0x1A]
	edge32l	%o4,	%l3,	%i3
	andn	%o0,	0x119F,	%i5
	edge8l	%l5,	%g3,	%g7
	move	%icc,	%i1,	%o1
	sir	0x011B
	fmul8x16	%f23,	%f18,	%f10
	xorcc	%i2,	%l6,	%g6
	nop
	set	0x18, %l6
	stx	%i4,	[%l7 + %l6]
	std	%f6,	[%l7 + 0x30]
	xor	%g4,	0x146E,	%o7
	orncc	%i6,	%g1,	%o6
	udiv	%o2,	0x10ED,	%l2
	fpackfix	%f6,	%f24
	add	%o5,	0x0A2C,	%i0
	subcc	%l0,	%o3,	%g2
	edge16l	%i7,	%l4,	%g5
	movrlz	%o4,	%l1,	%l3
	movre	%i3,	0x1E3,	%i5
	sir	0x04BE
	lduh	[%l7 + 0x2A],	%o0
	fpack32	%f16,	%f12,	%f10
	addc	%g3,	%g7,	%l5
	movrgez	%o1,	0x095,	%i2
	movleu	%icc,	%i1,	%g6
	andcc	%i4,	0x0562,	%l6
	movneg	%icc,	%o7,	%i6
	srlx	%g1,	%o6,	%o2
	popc	0x0B4A,	%l2
	fmul8x16	%f15,	%f0,	%f28
	sra	%o5,	%g4,	%i0
	ldd	[%l7 + 0x58],	%o2
	fmovsgu	%icc,	%f30,	%f14
	ld	[%l7 + 0x6C],	%f16
	movrlz	%l0,	%g2,	%l4
	ldd	[%l7 + 0x60],	%g4
	edge8l	%i7,	%l1,	%o4
	fpadd32	%f20,	%f22,	%f12
	fxors	%f15,	%f4,	%f27
	movrgez	%i3,	0x204,	%l3
	fabsd	%f26,	%f12
	lduh	[%l7 + 0x30],	%i5
	addcc	%o0,	0x1C15,	%g7
	movvs	%xcc,	%l5,	%g3
	sdivcc	%o1,	0x1222,	%i1
	ld	[%l7 + 0x1C],	%f28
	sllx	%i2,	%g6,	%l6
	movl	%xcc,	%i4,	%i6
	fpsub16	%f8,	%f8,	%f16
	movrgez	%g1,	%o7,	%o2
	movrne	%l2,	0x130,	%o5
	ldd	[%l7 + 0x28],	%g4
	fmovdvs	%icc,	%f1,	%f29
	fpadd16	%f28,	%f2,	%f14
	alignaddrl	%i0,	%o6,	%o3
	edge32l	%g2,	%l4,	%g5
	sdivx	%i7,	0x11A4,	%l1
	orncc	%l0,	%i3,	%l3
	fmovdl	%icc,	%f12,	%f30
	udivcc	%i5,	0x05C7,	%o4
	srl	%g7,	%l5,	%g3
	movvs	%icc,	%o0,	%o1
	xorcc	%i2,	%i1,	%g6
	edge8n	%i4,	%i6,	%g1
	std	%f14,	[%l7 + 0x18]
	addc	%o7,	%l6,	%o2
	xnor	%o5,	%l2,	%g4
	restore %i0, %o3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o6,	0x08,	%g5
	for	%f26,	%f22,	%f6
	array16	%l4,	%l1,	%i7
	movrgz	%l0,	%l3,	%i5
	ld	[%l7 + 0x1C],	%f31
	sir	0x148C
	orn	%i3,	0x193B,	%g7
	edge16ln	%l5,	%g3,	%o0
	sdiv	%o4,	0x18C8,	%o1
	movrgz	%i2,	0x0E9,	%g6
	fmovsa	%xcc,	%f19,	%f29
	ldsw	[%l7 + 0x14],	%i1
	sth	%i6,	[%l7 + 0x0C]
	alignaddr	%i4,	%o7,	%g1
	nop
	set	0x40, %i1
	ldd	[%l7 + %i1],	%f12
	fornot1	%f2,	%f24,	%f10
	fzero	%f6
	lduh	[%l7 + 0x72],	%l6
	stb	%o2,	[%l7 + 0x0F]
	save %o5, %g4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%icc,	%f8,	%f29
	edge8l	%l2,	%o3,	%o6
	subc	%g2,	%g5,	%l1
	edge16ln	%l4,	%l0,	%i7
	smul	%l3,	%i3,	%g7
	smulcc	%l5,	%g3,	%o0
	array32	%i5,	%o4,	%o1
	fmovsl	%xcc,	%f8,	%f6
	fnegd	%f22,	%f26
	orcc	%i2,	0x0104,	%g6
	ldub	[%l7 + 0x4F],	%i6
	subc	%i4,	%o7,	%i1
	movrgez	%g1,	0x02B,	%l6
	st	%f4,	[%l7 + 0x58]
	fornot2s	%f3,	%f27,	%f30
	movneg	%icc,	%o2,	%g4
	srax	%o5,	0x09,	%l2
	fmovdne	%xcc,	%f19,	%f28
	ldsh	[%l7 + 0x62],	%o3
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	fmovscc	%xcc,	%f0,	%f7
	movrne	%g5,	%l1,	%l4
	addccc	%i7,	%l0,	%l3
	or	%g7,	%i3,	%l5
	alignaddrl	%g3,	%o0,	%o4
	sdivx	%o1,	0x1BCD,	%i2
	edge8l	%i5,	%i6,	%i4
	ldub	[%l7 + 0x64],	%g6
	ld	[%l7 + 0x3C],	%f26
	movgu	%xcc,	%o7,	%g1
	movle	%icc,	%l6,	%i1
	udivx	%g4,	0x1967,	%o2
	sth	%l2,	[%l7 + 0x2A]
	movrgez	%o3,	0x2A9,	%o5
	subc	%o6,	%i0,	%g5
	fnors	%f3,	%f16,	%f3
	sdiv	%g2,	0x189B,	%l1
	sir	0x00A6
	andncc	%l4,	%i7,	%l3
	fnot1	%f10,	%f14
	ldsh	[%l7 + 0x32],	%l0
	addcc	%i3,	%g7,	%l5
	edge16n	%g3,	%o4,	%o0
	addccc	%i2,	%i5,	%i6
	save %i4, %o1, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%g1,	%f16,	%f3
	fmovrdne	%o7,	%f6,	%f18
	fcmpes	%fcc1,	%f18,	%f18
	sra	%i1,	0x05,	%l6
	udiv	%g4,	0x1924,	%l2
	edge8	%o2,	%o5,	%o6
	orncc	%i0,	%o3,	%g2
	stw	%l1,	[%l7 + 0x40]
	ldx	[%l7 + 0x78],	%l4
	andn	%g5,	0x059C,	%l3
	edge8ln	%i7,	%l0,	%i3
	udivcc	%g7,	0x0CA4,	%g3
	xor	%l5,	0x1D56,	%o0
	fcmpd	%fcc3,	%f22,	%f16
	edge16ln	%o4,	%i5,	%i2
	stw	%i6,	[%l7 + 0x3C]
	ldub	[%l7 + 0x17],	%o1
	array8	%i4,	%g6,	%g1
	fmul8x16au	%f23,	%f5,	%f8
	movneg	%icc,	%i1,	%l6
	fmuld8sux16	%f27,	%f29,	%f2
	alignaddrl	%o7,	%l2,	%g4
	edge8	%o5,	%o2,	%o6
	orn	%o3,	0x0554,	%i0
	movvc	%xcc,	%g2,	%l1
	fxors	%f6,	%f15,	%f20
	fcmple32	%f0,	%f26,	%l4
	fnand	%f6,	%f8,	%f26
	andncc	%g5,	%l3,	%i7
	sdivcc	%i3,	0x1D61,	%l0
	subcc	%g7,	%l5,	%g3
	movre	%o0,	0x150,	%o4
	popc	0x027E,	%i5
	nop
	set	0x5C, %l0
	ldsb	[%l7 + %l0],	%i2
	sllx	%o1,	0x09,	%i6
	addccc	%g6,	%i4,	%i1
	xnorcc	%g1,	%o7,	%l6
	movre	%g4,	%o5,	%o2
	and	%l2,	%o3,	%o6
	orn	%i0,	0x0779,	%l1
	xorcc	%l4,	0x0618,	%g2
	ldsh	[%l7 + 0x5C],	%l3
	fmul8x16au	%f11,	%f6,	%f4
	movleu	%icc,	%g5,	%i3
	xnor	%l0,	0x04DD,	%i7
	edge16l	%l5,	%g3,	%o0
	sllx	%o4,	0x0F,	%i5
	move	%icc,	%i2,	%o1
	srlx	%i6,	0x0E,	%g7
	srax	%g6,	%i4,	%g1
	fmovsvs	%icc,	%f5,	%f23
	edge8l	%o7,	%i1,	%g4
	edge8n	%l6,	%o2,	%l2
	sra	%o3,	0x02,	%o5
	subcc	%i0,	0x07B5,	%l1
	fnot2	%f14,	%f12
	sra	%o6,	%l4,	%g2
	edge32ln	%g5,	%l3,	%l0
	edge32	%i3,	%i7,	%l5
	lduw	[%l7 + 0x44],	%o0
	ldd	[%l7 + 0x18],	%o4
	orn	%i5,	%g3,	%i2
	ldsb	[%l7 + 0x6A],	%i6
	fnands	%f5,	%f8,	%f31
	movleu	%icc,	%g7,	%g6
	array32	%o1,	%i4,	%o7
	subcc	%i1,	0x1A95,	%g1
	alignaddrl	%g4,	%l6,	%l2
	sll	%o2,	%o5,	%i0
	mulscc	%l1,	0x1078,	%o3
	restore %o6, %l4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%icc,	%l3,	%g5
	and	%i3,	%l0,	%l5
	xor	%i7,	0x0B6A,	%o4
	edge8n	%o0,	%g3,	%i2
	movne	%icc,	%i6,	%i5
	subcc	%g7,	%o1,	%i4
	movcs	%xcc,	%g6,	%o7
	movgu	%icc,	%g1,	%g4
	popc	0x040C,	%i1
	addc	%l6,	0x09F1,	%o2
	fandnot1	%f0,	%f30,	%f30
	and	%o5,	0x14A9,	%l2
	fpsub32s	%f26,	%f30,	%f1
	movle	%icc,	%i0,	%o3
	addcc	%l1,	%o6,	%l4
	addccc	%g2,	%l3,	%g5
	subccc	%i3,	%l0,	%i7
	andncc	%o4,	%o0,	%g3
	move	%icc,	%i2,	%i6
	addc	%l5,	%i5,	%o1
	ldd	[%l7 + 0x40],	%g6
	and	%g6,	0x120A,	%o7
	orn	%g1,	0x19D9,	%g4
	faligndata	%f28,	%f16,	%f0
	sub	%i4,	%l6,	%o2
	mova	%icc,	%i1,	%l2
	sdivx	%o5,	0x19C8,	%o3
	smul	%i0,	0x0342,	%o6
	fmovde	%icc,	%f29,	%f3
	edge8l	%l4,	%l1,	%l3
	edge8ln	%g5,	%i3,	%g2
	sth	%l0,	[%l7 + 0x50]
	fmovda	%icc,	%f16,	%f21
	lduh	[%l7 + 0x58],	%i7
	sethi	0x1E86,	%o4
	sth	%o0,	[%l7 + 0x12]
	ldd	[%l7 + 0x18],	%f0
	sethi	0x19B0,	%g3
	popc	0x0732,	%i2
	udivx	%l5,	0x04E2,	%i6
	subccc	%i5,	0x0FE2,	%o1
	andn	%g6,	0x1A34,	%g7
	popc	0x0C63,	%g1
	sdivx	%g4,	0x054D,	%i4
	ldd	[%l7 + 0x58],	%i6
	srlx	%o7,	%i1,	%l2
	edge8n	%o5,	%o3,	%o2
	ldsw	[%l7 + 0x50],	%i0
	edge32	%l4,	%l1,	%o6
	movne	%xcc,	%l3,	%i3
	mulx	%g2,	%g5,	%i7
	movcs	%xcc,	%o4,	%l0
	sllx	%g3,	%i2,	%l5
	fmovrsne	%o0,	%f8,	%f25
	edge8	%i5,	%o1,	%g6
	save %g7, 0x0F15, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g1,	0x1EAC,	%i4
	lduw	[%l7 + 0x5C],	%l6
	lduw	[%l7 + 0x7C],	%o7
	st	%f23,	[%l7 + 0x08]
	ldx	[%l7 + 0x70],	%g4
	movpos	%xcc,	%i1,	%o5
	mova	%icc,	%l2,	%o2
	add	%o3,	%i0,	%l1
	movre	%l4,	0x256,	%l3
	alignaddrl	%i3,	%g2,	%g5
	fpsub32s	%f27,	%f31,	%f2
	movrne	%o6,	0x2A3,	%o4
	edge8ln	%l0,	%i7,	%i2
	movn	%xcc,	%l5,	%o0
	addc	%g3,	%o1,	%i5
	fxnors	%f12,	%f20,	%f24
	udivcc	%g7,	0x114B,	%g6
	or	%i6,	%g1,	%l6
	movneg	%icc,	%o7,	%g4
	sth	%i1,	[%l7 + 0x60]
	ldx	[%l7 + 0x18],	%o5
	movvc	%xcc,	%i4,	%l2
	or	%o3,	0x08A0,	%i0
	alignaddr	%l1,	%l4,	%o2
	ldsh	[%l7 + 0x70],	%i3
	edge32	%l3,	%g2,	%o6
	lduw	[%l7 + 0x4C],	%o4
	xorcc	%l0,	0x0194,	%i7
	fmovsvs	%icc,	%f29,	%f0
	movg	%icc,	%g5,	%l5
	sra	%i2,	%g3,	%o0
	ldsw	[%l7 + 0x38],	%i5
	alignaddrl	%g7,	%o1,	%g6
	addcc	%i6,	0x167A,	%l6
	ldx	[%l7 + 0x38],	%o7
	sdivcc	%g1,	0x1D15,	%g4
	fmovrdgez	%i1,	%f26,	%f30
	fmovde	%icc,	%f21,	%f23
	xorcc	%i4,	%o5,	%l2
	sllx	%i0,	%o3,	%l4
	lduw	[%l7 + 0x40],	%o2
	mulx	%l1,	0x1E2B,	%l3
	edge32l	%i3,	%o6,	%g2
	fmovrsne	%o4,	%f15,	%f11
	fnors	%f9,	%f25,	%f6
	fandnot2s	%f15,	%f22,	%f12
	lduw	[%l7 + 0x18],	%i7
	edge8	%l0,	%l5,	%i2
	fmovrdgz	%g3,	%f24,	%f26
	fmovsn	%icc,	%f31,	%f15
	srlx	%g5,	0x17,	%o0
	orncc	%i5,	0x0984,	%o1
	orn	%g6,	%i6,	%l6
	subccc	%g7,	%o7,	%g4
	movvc	%xcc,	%i1,	%g1
	fcmped	%fcc1,	%f30,	%f4
	edge16n	%i4,	%o5,	%i0
	std	%f24,	[%l7 + 0x40]
	array32	%o3,	%l2,	%o2
	andcc	%l1,	%l4,	%l3
	lduw	[%l7 + 0x48],	%o6
	edge8l	%i3,	%o4,	%g2
	orcc	%l0,	0x0B7E,	%i7
	fzeros	%f2
	umul	%l5,	0x1202,	%i2
	fnand	%f28,	%f30,	%f24
	xorcc	%g5,	%o0,	%g3
	sir	0x0C53
	lduw	[%l7 + 0x44],	%o1
	orn	%i5,	0x0835,	%i6
	movvs	%xcc,	%g6,	%l6
	edge16n	%o7,	%g4,	%i1
	fornot1	%f0,	%f10,	%f16
	edge16ln	%g1,	%i4,	%o5
	mulx	%i0,	%o3,	%l2
	sll	%o2,	0x0F,	%g7
	fmovd	%f30,	%f20
	move	%xcc,	%l1,	%l3
	and	%l4,	0x17A2,	%o6
	fmul8x16al	%f28,	%f6,	%f14
	movvs	%icc,	%o4,	%g2
	move	%xcc,	%l0,	%i7
	fmovsne	%icc,	%f29,	%f17
	movneg	%icc,	%i3,	%l5
	fors	%f1,	%f0,	%f9
	fmovrslz	%i2,	%f14,	%f25
	fmuld8ulx16	%f2,	%f6,	%f18
	alignaddrl	%o0,	%g5,	%g3
	movrne	%o1,	0x17B,	%i5
	nop
	set	0x70, %l2
	ldsw	[%l7 + %l2],	%i6
	sll	%l6,	%o7,	%g4
	sllx	%g6,	%g1,	%i4
	orn	%i1,	0x1ECB,	%o5
	add	%i0,	0x1766,	%o3
	srlx	%l2,	%o2,	%l1
	sdivcc	%g7,	0x025C,	%l3
	subc	%l4,	%o4,	%o6
	srlx	%l0,	%i7,	%g2
	std	%f24,	[%l7 + 0x08]
	subc	%i3,	0x0353,	%i2
	fmovdcs	%xcc,	%f24,	%f13
	movpos	%xcc,	%l5,	%o0
	ldub	[%l7 + 0x41],	%g3
	sethi	0x1AA5,	%g5
	sth	%o1,	[%l7 + 0x0E]
	xnor	%i5,	0x18D5,	%i6
	array8	%l6,	%g4,	%g6
	edge16ln	%o7,	%i4,	%i1
	fands	%f26,	%f5,	%f23
	movrne	%o5,	%g1,	%o3
	andcc	%i0,	%o2,	%l2
	ldsh	[%l7 + 0x50],	%g7
	or	%l1,	%l4,	%o4
	mova	%icc,	%o6,	%l3
	alignaddrl	%i7,	%g2,	%l0
	sdivcc	%i2,	0x04A2,	%i3
	udivcc	%l5,	0x1681,	%g3
	ldx	[%l7 + 0x30],	%g5
	edge16	%o1,	%i5,	%i6
	fnegs	%f9,	%f2
	movrne	%o0,	0x086,	%l6
	sdiv	%g4,	0x009D,	%o7
	subcc	%i4,	0x0AE6,	%i1
	edge16ln	%o5,	%g1,	%g6
	edge32	%o3,	%o2,	%i0
	subcc	%l2,	0x02CC,	%g7
	array16	%l1,	%l4,	%o4
	movn	%xcc,	%o6,	%i7
	edge16l	%g2,	%l3,	%i2
	stw	%i3,	[%l7 + 0x64]
	movn	%xcc,	%l5,	%g3
	ldsb	[%l7 + 0x41],	%g5
	andn	%o1,	0x0183,	%l0
	sll	%i6,	0x0A,	%o0
	fnegs	%f11,	%f12
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	smul	%o7,	0x0720,	%i4
	subccc	%g4,	%i1,	%g1
	ldsh	[%l7 + 0x6A],	%g6
	movrlez	%o3,	0x22A,	%o2
	array16	%i0,	%o5,	%g7
	movre	%l2,	0x364,	%l1
	movre	%o4,	0x0D9,	%l4
	sllx	%i7,	0x05,	%o6
	fmovrdlez	%l3,	%f28,	%f18
	sub	%i2,	%i3,	%l5
	stb	%g3,	[%l7 + 0x7B]
	movrgez	%g5,	0x117,	%o1
	addc	%l0,	%i6,	%o0
	array32	%g2,	%l6,	%o7
	fmovrdgz	%i5,	%f4,	%f30
	orcc	%i4,	0x1B79,	%i1
	movle	%icc,	%g1,	%g6
	fmovsn	%xcc,	%f2,	%f31
	movrlz	%g4,	%o3,	%o2
	fpsub32s	%f3,	%f0,	%f27
	st	%f8,	[%l7 + 0x78]
	xnorcc	%o5,	%g7,	%l2
	edge8	%l1,	%o4,	%l4
	movge	%icc,	%i7,	%o6
	edge32ln	%l3,	%i0,	%i2
	movrgz	%l5,	%i3,	%g3
	movpos	%icc,	%g5,	%o1
	st	%f0,	[%l7 + 0x48]
	andncc	%l0,	%o0,	%g2
	movneg	%xcc,	%l6,	%i6
	popc	0x1B84,	%i5
	fandnot1	%f8,	%f4,	%f26
	sdivx	%i4,	0x0154,	%o7
	edge32	%g1,	%i1,	%g4
	fmovdne	%icc,	%f20,	%f31
	sub	%g6,	%o2,	%o5
	fmovsn	%xcc,	%f4,	%f4
	fmovdl	%xcc,	%f30,	%f8
	movrlz	%o3,	0x1AA,	%l2
	move	%xcc,	%g7,	%o4
	fnand	%f30,	%f0,	%f8
	edge32ln	%l1,	%l4,	%o6
	ld	[%l7 + 0x24],	%f10
	stb	%l3,	[%l7 + 0x21]
	array32	%i7,	%i0,	%i2
	array16	%i3,	%g3,	%l5
	sdivx	%g5,	0x13F5,	%o1
	movle	%xcc,	%o0,	%g2
	array32	%l6,	%i6,	%i5
	movne	%icc,	%i4,	%o7
	orn	%g1,	0x065D,	%l0
	fmovrsgz	%i1,	%f25,	%f12
	stw	%g6,	[%l7 + 0x2C]
	or	%g4,	0x1A4D,	%o5
	fpackfix	%f20,	%f8
	smul	%o2,	%l2,	%g7
	fmul8x16al	%f7,	%f17,	%f20
	restore %o3, 0x02F3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o4,	%o6,	%l4
	alignaddr	%i7,	%i0,	%i2
	andn	%i3,	0x03EE,	%g3
	stx	%l5,	[%l7 + 0x78]
	fcmpne32	%f18,	%f16,	%g5
	fmovrsgez	%o1,	%f2,	%f30
	movleu	%icc,	%o0,	%l3
	popc	0x08F6,	%l6
	movne	%icc,	%i6,	%i5
	edge32	%g2,	%o7,	%g1
	fcmpd	%fcc0,	%f0,	%f20
	edge32l	%l0,	%i1,	%i4
	fmovsneg	%icc,	%f6,	%f14
	movl	%xcc,	%g6,	%g4
	andn	%o2,	%o5,	%g7
	fones	%f17
	sir	0x0AA6
	fones	%f26
	movrlz	%o3,	0x21E,	%l2
	edge8ln	%o4,	%o6,	%l1
	fandnot2s	%f2,	%f9,	%f21
	nop
	set	0x42, %o0
	ldub	[%l7 + %o0],	%i7
	fmovsvc	%icc,	%f0,	%f16
	fnot1s	%f21,	%f16
	fxors	%f18,	%f18,	%f27
	xnor	%i0,	0x0BE7,	%i2
	ldsh	[%l7 + 0x54],	%i3
	ldsh	[%l7 + 0x1E],	%g3
	xor	%l5,	%l4,	%g5
	movge	%xcc,	%o0,	%l3
	stx	%l6,	[%l7 + 0x18]
	ld	[%l7 + 0x64],	%f26
	lduw	[%l7 + 0x68],	%i6
	xnor	%i5,	0x18DC,	%o1
	siam	0x4
	subccc	%g2,	%g1,	%o7
	fzero	%f18
	edge32n	%l0,	%i4,	%i1
	sdivcc	%g4,	0x0AA1,	%o2
	edge32	%o5,	%g6,	%g7
	movcs	%icc,	%l2,	%o3
	ldd	[%l7 + 0x20],	%o6
	movle	%xcc,	%o4,	%l1
	fands	%f3,	%f7,	%f0
	edge32	%i0,	%i7,	%i2
	edge8ln	%g3,	%i3,	%l5
	lduw	[%l7 + 0x74],	%l4
	lduw	[%l7 + 0x10],	%o0
	ldd	[%l7 + 0x08],	%g4
	nop
	set	0x08, %g1
	ldd	[%l7 + %g1],	%f16
	fmul8sux16	%f0,	%f2,	%f2
	movge	%icc,	%l6,	%l3
	edge16n	%i5,	%i6,	%g2
	edge16l	%o1,	%o7,	%l0
	subcc	%i4,	%g1,	%g4
	nop
	set	0x1C, %o2
	lduh	[%l7 + %o2],	%o2
	movrlz	%o5,	0x2A6,	%i1
	edge32	%g6,	%g7,	%l2
	edge16ln	%o6,	%o4,	%o3
	movrgz	%i0,	0x374,	%l1
	sll	%i7,	%i2,	%i3
	alignaddrl	%l5,	%g3,	%o0
	addccc	%g5,	%l4,	%l6
	ldub	[%l7 + 0x08],	%i5
	udiv	%l3,	0x1B55,	%i6
	ldd	[%l7 + 0x48],	%o0
	mulscc	%o7,	%l0,	%g2
	popc	0x0BF3,	%i4
	udivcc	%g1,	0x1EE5,	%g4
	fmovsl	%xcc,	%f10,	%f7
	movcc	%icc,	%o2,	%i1
	lduw	[%l7 + 0x6C],	%g6
	orn	%o5,	%l2,	%g7
	movrlez	%o4,	0x168,	%o3
	orn	%i0,	%o6,	%l1
	fmovda	%xcc,	%f22,	%f5
	srlx	%i7,	0x00,	%i3
	lduh	[%l7 + 0x24],	%l5
	sra	%i2,	0x04,	%o0
	xor	%g5,	%l4,	%l6
	andn	%g3,	%i5,	%i6
	mova	%icc,	%l3,	%o7
	edge32ln	%o1,	%l0,	%g2
	edge32n	%i4,	%g1,	%o2
	lduw	[%l7 + 0x34],	%g4
	movn	%xcc,	%g6,	%o5
	fsrc1	%f2,	%f30
	sdivcc	%l2,	0x168C,	%i1
	or	%g7,	%o4,	%o3
	stx	%i0,	[%l7 + 0x18]
	array8	%o6,	%i7,	%i3
	movvs	%icc,	%l1,	%i2
	fmovdge	%icc,	%f21,	%f1
	umulcc	%l5,	0x08F2,	%o0
	movne	%icc,	%l4,	%g5
	fmovs	%f25,	%f1
	alignaddrl	%g3,	%i5,	%i6
	fandnot1s	%f30,	%f26,	%f16
	sethi	0x0CFE,	%l3
	sir	0x177E
	movrne	%l6,	%o1,	%l0
	ldsw	[%l7 + 0x5C],	%g2
	orcc	%o7,	%g1,	%i4
	fcmpd	%fcc0,	%f30,	%f2
	movle	%icc,	%o2,	%g4
	smul	%g6,	0x13AC,	%l2
	movcc	%xcc,	%o5,	%i1
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	fsrc1	%f16,	%f6
	edge16n	%o4,	%o6,	%i7
	ldsw	[%l7 + 0x34],	%i0
	nop
	set	0x1C, %g4
	ldsw	[%l7 + %g4],	%i3
	movrgez	%l1,	%l5,	%o0
	sir	0x03A3
	std	%f26,	[%l7 + 0x50]
	movrne	%i2,	0x3C5,	%g5
	alignaddrl	%g3,	%l4,	%i5
	addc	%i6,	0x152A,	%l3
	fmovdcc	%icc,	%f4,	%f5
	alignaddrl	%o1,	%l0,	%l6
	movge	%icc,	%o7,	%g1
	sdivcc	%i4,	0x0E44,	%g2
	edge8l	%g4,	%g6,	%l2
	and	%o2,	0x1648,	%i1
	sth	%o5,	[%l7 + 0x6E]
	fcmps	%fcc0,	%f14,	%f12
	subccc	%g7,	%o4,	%o6
	edge16n	%i7,	%o3,	%i0
	save %i3, %l5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i2,	%l1
	ldd	[%l7 + 0x18],	%g2
	smul	%g5,	0x0652,	%l4
	movvs	%icc,	%i5,	%i6
	fpsub16	%f28,	%f6,	%f22
	andn	%o1,	0x173A,	%l3
	xorcc	%l0,	%l6,	%g1
	srlx	%i4,	0x10,	%g2
	movcs	%icc,	%g4,	%o7
	movl	%xcc,	%l2,	%o2
	edge16ln	%i1,	%o5,	%g6
	sllx	%o4,	0x02,	%o6
	fabsd	%f26,	%f8
	movle	%icc,	%i7,	%g7
	umul	%o3,	%i3,	%l5
	subccc	%o0,	0x14E3,	%i0
	ldd	[%l7 + 0x18],	%i2
	srlx	%l1,	%g5,	%l4
	edge16n	%g3,	%i6,	%o1
	fcmps	%fcc2,	%f5,	%f8
	movcc	%icc,	%l3,	%i5
	movpos	%icc,	%l0,	%l6
	subccc	%i4,	0x1E6B,	%g1
	alignaddrl	%g4,	%o7,	%l2
	fmovda	%icc,	%f15,	%f10
	movleu	%icc,	%g2,	%o2
	movgu	%icc,	%o5,	%i1
	movleu	%icc,	%g6,	%o4
	restore %i7, %g7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	edge8ln	%o0,	%l5,	%i0
	edge16	%i2,	%l1,	%g5
	fcmped	%fcc2,	%f30,	%f26
	fmovdne	%icc,	%f0,	%f17
	andn	%l4,	%g3,	%o1
	movvc	%icc,	%i6,	%i5
	move	%icc,	%l0,	%l6
	xnor	%i4,	0x0CFC,	%g1
	fmuld8sux16	%f22,	%f2,	%f28
	fcmpeq32	%f20,	%f26,	%g4
	sll	%o7,	0x14,	%l2
	alignaddrl	%g2,	%l3,	%o2
	addcc	%i1,	%o5,	%o4
	udivcc	%i7,	0x0A30,	%g7
	umulcc	%o3,	0x176E,	%g6
	array8	%i3,	%o0,	%l5
	edge8ln	%i0,	%o6,	%l1
	array16	%i2,	%g5,	%l4
	fpsub32	%f14,	%f14,	%f20
	udivcc	%o1,	0x1F96,	%g3
	array8	%i6,	%l0,	%i5
	xnor	%l6,	0x0603,	%g1
	std	%f16,	[%l7 + 0x60]
	fmul8sux16	%f10,	%f28,	%f0
	fnegs	%f7,	%f5
	sethi	0x1E45,	%g4
	array8	%i4,	%o7,	%g2
	alignaddr	%l3,	%l2,	%i1
	movcs	%icc,	%o5,	%o2
	movvs	%icc,	%o4,	%g7
	ld	[%l7 + 0x50],	%f31
	fmuld8sux16	%f12,	%f9,	%f30
	sllx	%i7,	%o3,	%g6
	udiv	%i3,	0x0AB3,	%o0
	edge16ln	%i0,	%o6,	%l1
	andcc	%i2,	0x02F9,	%l5
	fsrc2	%f28,	%f14
	edge16n	%g5,	%l4,	%g3
	movvs	%icc,	%i6,	%o1
	addc	%i5,	0x16D2,	%l0
	srax	%l6,	%g4,	%g1
	ld	[%l7 + 0x2C],	%f17
	umulcc	%o7,	%i4,	%g2
	xnor	%l3,	0x05A6,	%l2
	add	%o5,	0x082B,	%o2
	and	%o4,	0x0AE7,	%g7
	fnands	%f13,	%f7,	%f18
	and	%i1,	0x0C6D,	%o3
	fandnot2s	%f5,	%f13,	%f12
	subc	%i7,	%g6,	%o0
	fmovrslz	%i3,	%f7,	%f23
	fnot1	%f6,	%f0
	edge32	%i0,	%o6,	%l1
	umul	%l5,	0x0A60,	%g5
	andncc	%l4,	%i2,	%i6
	srl	%o1,	0x07,	%g3
	edge32ln	%i5,	%l0,	%l6
	fnors	%f0,	%f10,	%f11
	subcc	%g4,	0x1265,	%g1
	srl	%o7,	0x1F,	%g2
	fmovdgu	%icc,	%f5,	%f3
	edge16ln	%l3,	%i4,	%l2
	movgu	%xcc,	%o5,	%o2
	smul	%g7,	%i1,	%o4
	smul	%o3,	0x1101,	%g6
	ld	[%l7 + 0x28],	%f30
	movrlz	%i7,	%o0,	%i0
	fnot2	%f8,	%f26
	sub	%i3,	0x1222,	%o6
	fandnot2s	%f6,	%f28,	%f31
	array8	%l1,	%l5,	%g5
	edge8l	%l4,	%i6,	%o1
	movg	%icc,	%i2,	%g3
	andn	%l0,	%i5,	%g4
	xor	%g1,	0x1B60,	%l6
	fmovdn	%icc,	%f7,	%f7
	alignaddr	%g2,	%l3,	%i4
	movle	%icc,	%o7,	%l2
	alignaddrl	%o5,	%o2,	%g7
	fornot1s	%f5,	%f31,	%f21
	fmovdpos	%xcc,	%f19,	%f9
	fnegs	%f24,	%f20
	lduw	[%l7 + 0x38],	%i1
	movrne	%o4,	%o3,	%g6
	subccc	%i7,	0x0DE2,	%o0
	srlx	%i0,	0x08,	%o6
	movg	%icc,	%l1,	%l5
	st	%f30,	[%l7 + 0x60]
	andncc	%i3,	%g5,	%l4
	orn	%o1,	%i2,	%g3
	subcc	%i6,	%i5,	%g4
	edge32l	%l0,	%g1,	%l6
	edge32	%g2,	%l3,	%i4
	sethi	0x17D4,	%o7
	fpadd32	%f20,	%f2,	%f12
	addc	%o5,	0x1373,	%o2
	subcc	%g7,	%l2,	%i1
	sllx	%o3,	0x06,	%g6
	fornot2s	%f12,	%f23,	%f2
	fnegs	%f5,	%f13
	srlx	%i7,	%o0,	%o4
	srl	%i0,	%o6,	%l5
	sdivcc	%i3,	0x1EEE,	%g5
	movn	%xcc,	%l4,	%l1
	ld	[%l7 + 0x1C],	%f5
	umulcc	%o1,	0x0C3A,	%i2
	xorcc	%g3,	0x069A,	%i6
	fmovdne	%xcc,	%f4,	%f6
	subccc	%g4,	0x1855,	%l0
	movgu	%icc,	%i5,	%g1
	orncc	%g2,	0x1629,	%l3
	addc	%i4,	0x0E20,	%o7
	sir	0x05C8
	std	%f10,	[%l7 + 0x28]
	sllx	%l6,	0x0C,	%o2
	fpsub16s	%f20,	%f20,	%f4
	movrlz	%o5,	%g7,	%i1
	fmovdl	%xcc,	%f8,	%f15
	edge32ln	%o3,	%g6,	%l2
	faligndata	%f12,	%f20,	%f2
	array16	%i7,	%o4,	%i0
	stb	%o6,	[%l7 + 0x43]
	ld	[%l7 + 0x64],	%f17
	sth	%l5,	[%l7 + 0x0A]
	udivx	%i3,	0x1038,	%o0
	pdist	%f14,	%f26,	%f4
	subccc	%g5,	0x080B,	%l4
	lduw	[%l7 + 0x40],	%l1
	fcmpne16	%f18,	%f4,	%i2
	edge8ln	%o1,	%g3,	%i6
	fmovsleu	%icc,	%f4,	%f30
	subc	%l0,	%i5,	%g1
	movle	%xcc,	%g2,	%g4
	movne	%xcc,	%l3,	%i4
	ldd	[%l7 + 0x60],	%i6
	array8	%o7,	%o2,	%g7
	srlx	%i1,	%o5,	%g6
	smul	%o3,	%l2,	%o4
	movrlez	%i7,	0x204,	%o6
	smul	%i0,	0x0869,	%i3
	save %l5, %g5, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o0,	%i2,	%l1
	andncc	%o1,	%g3,	%i6
	sir	0x0D52
	movrgz	%i5,	0x1D8,	%l0
	movleu	%xcc,	%g1,	%g2
	smul	%l3,	0x0E1E,	%i4
	fmovde	%xcc,	%f21,	%f24
	fmovsne	%icc,	%f16,	%f28
	ldsw	[%l7 + 0x2C],	%l6
	fnegs	%f21,	%f24
	array16	%g4,	%o2,	%o7
	edge8l	%i1,	%o5,	%g6
	umul	%g7,	%l2,	%o3
	fmovsg	%icc,	%f15,	%f2
	edge16l	%o4,	%o6,	%i7
	add	%i3,	%i0,	%l5
	nop
	set	0x38, %o6
	ldx	[%l7 + %o6],	%l4
	fmovscs	%icc,	%f11,	%f29
	edge16ln	%o0,	%g5,	%i2
	fand	%f10,	%f28,	%f22
	stw	%l1,	[%l7 + 0x2C]
	array32	%g3,	%i6,	%o1
	edge8l	%i5,	%l0,	%g2
	movneg	%icc,	%l3,	%g1
	andcc	%i4,	0x15DA,	%g4
	andncc	%l6,	%o2,	%i1
	orncc	%o7,	0x06C5,	%o5
	fmovrde	%g7,	%f0,	%f20
	sethi	0x1C1E,	%l2
	lduh	[%l7 + 0x50],	%g6
	lduw	[%l7 + 0x28],	%o3
	fmovdcs	%icc,	%f18,	%f17
	andcc	%o4,	0x1972,	%i7
	fmovrsne	%i3,	%f7,	%f7
	edge32n	%i0,	%l5,	%o6
	fmovdvc	%xcc,	%f18,	%f19
	fands	%f9,	%f0,	%f13
	fone	%f12
	xnorcc	%o0,	0x0162,	%g5
	movvs	%icc,	%i2,	%l4
	fmovrdgez	%g3,	%f18,	%f8
	popc	0x01A0,	%i6
	save %l1, %o1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f10,	%f22
	fmovsvc	%xcc,	%f3,	%f7
	andncc	%g2,	%l3,	%g1
	xnorcc	%i4,	0x1FD0,	%i5
	umul	%g4,	0x13C3,	%l6
	fcmpeq16	%f26,	%f30,	%o2
	array8	%i1,	%o7,	%g7
	nop
	set	0x40, %l5
	stx	%l2,	[%l7 + %l5]
	subccc	%g6,	%o3,	%o4
	edge32l	%o5,	%i7,	%i0
	fmovdcs	%icc,	%f8,	%f25
	srl	%l5,	0x0B,	%i3
	subc	%o0,	0x0C28,	%o6
	movge	%icc,	%g5,	%i2
	std	%f12,	[%l7 + 0x38]
	fmovspos	%icc,	%f5,	%f15
	movle	%xcc,	%g3,	%i6
	movg	%xcc,	%l4,	%l1
	fnegd	%f22,	%f16
	sth	%l0,	[%l7 + 0x68]
	movneg	%icc,	%g2,	%l3
	lduh	[%l7 + 0x12],	%o1
	sra	%i4,	%i5,	%g1
	subccc	%g4,	0x149E,	%o2
	orcc	%i1,	0x1C1E,	%l6
	nop
	set	0x4C, %l1
	ldsh	[%l7 + %l1],	%o7
	movcc	%xcc,	%l2,	%g6
	array16	%o3,	%g7,	%o5
	udiv	%o4,	0x1B50,	%i7
	array16	%i0,	%i3,	%l5
	fnand	%f22,	%f30,	%f10
	array16	%o0,	%g5,	%o6
	or	%i2,	%g3,	%i6
	nop
	set	0x26, %o4
	ldsb	[%l7 + %o4],	%l1
	movne	%icc,	%l0,	%g2
	fmovrsgz	%l4,	%f13,	%f21
	udiv	%o1,	0x048B,	%i4
	fmovsa	%icc,	%f14,	%f31
	sub	%i5,	%l3,	%g4
	ld	[%l7 + 0x0C],	%f12
	edge8n	%g1,	%o2,	%i1
	edge8n	%l6,	%l2,	%o7
	fcmpne16	%f26,	%f30,	%o3
	fnot2	%f26,	%f10
	or	%g7,	%g6,	%o5
	st	%f29,	[%l7 + 0x34]
	lduw	[%l7 + 0x68],	%o4
	fcmpeq16	%f14,	%f4,	%i0
	movrlez	%i7,	%l5,	%o0
	stb	%i3,	[%l7 + 0x24]
	restore %o6, 0x13ED, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%g3,	0x0E76,	%i2
	xnorcc	%i6,	0x0C5F,	%l0
	ldsb	[%l7 + 0x61],	%g2
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	ldsb	[%l7 + 0x2A],	%l4
	addc	%i5,	0x0187,	%g4
	fnegd	%f14,	%f4
	lduw	[%l7 + 0x20],	%g1
	stw	%o2,	[%l7 + 0x5C]
	edge8l	%l3,	%l6,	%l2
	udivx	%o7,	0x0440,	%o3
	fmovdleu	%icc,	%f20,	%f19
	addcc	%g7,	%g6,	%o5
	array32	%i1,	%o4,	%i7
	stb	%i0,	[%l7 + 0x1E]
	ldub	[%l7 + 0x08],	%l5
	fmul8sux16	%f28,	%f12,	%f8
	sth	%o0,	[%l7 + 0x7A]
	edge16l	%i3,	%g5,	%g3
	alignaddr	%i2,	%i6,	%l0
	fpadd32	%f0,	%f24,	%f26
	fmovdvc	%icc,	%f26,	%f14
	ldsh	[%l7 + 0x5E],	%o6
	sra	%g2,	%l1,	%o1
	move	%xcc,	%i4,	%i5
	edge16n	%g4,	%g1,	%l4
	fmovspos	%icc,	%f26,	%f26
	ldx	[%l7 + 0x40],	%l3
	fmovscs	%xcc,	%f30,	%f30
	fcmped	%fcc3,	%f0,	%f24
	fnegd	%f22,	%f26
	movcc	%icc,	%o2,	%l2
	sdivcc	%l6,	0x0CA4,	%o7
	ldsb	[%l7 + 0x53],	%o3
	edge16	%g6,	%g7,	%i1
	restore %o5, %o4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i7,	%l5,	%i3
	xnor	%o0,	%g3,	%i2
	fmovdg	%icc,	%f21,	%f2
	addcc	%i6,	%l0,	%g5
	nop
	set	0x32, %g5
	sth	%g2,	[%l7 + %g5]
	udiv	%o6,	0x1BDA,	%l1
	ld	[%l7 + 0x10],	%f28
	save %i4, 0x0E40, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g4,	0x196D,	%i5
	alignaddrl	%g1,	%l4,	%o2
	sdivx	%l2,	0x195D,	%l6
	ld	[%l7 + 0x1C],	%f5
	stw	%o7,	[%l7 + 0x40]
	edge16n	%l3,	%o3,	%g6
	umul	%i1,	0x1BBF,	%o5
	fmuld8ulx16	%f20,	%f23,	%f0
	mulx	%g7,	%o4,	%i7
	lduh	[%l7 + 0x10],	%l5
	ldd	[%l7 + 0x10],	%f8
	sdivcc	%i0,	0x0242,	%o0
	mova	%xcc,	%i3,	%g3
	movg	%xcc,	%i6,	%i2
	sdivx	%l0,	0x0945,	%g5
	fexpand	%f24,	%f0
	alignaddrl	%o6,	%l1,	%i4
	sdiv	%o1,	0x00D6,	%g2
	movcs	%icc,	%g4,	%g1
	movpos	%xcc,	%i5,	%l4
	sub	%l2,	0x1E5B,	%l6
	edge32	%o2,	%o7,	%l3
	orcc	%g6,	0x1EA9,	%o3
	nop
	set	0x50, %o1
	sth	%o5,	[%l7 + %o1]
	srl	%i1,	%g7,	%o4
	movn	%icc,	%i7,	%l5
	movre	%i0,	0x3C3,	%i3
	std	%f14,	[%l7 + 0x78]
	fandnot1	%f6,	%f30,	%f14
	fmovda	%icc,	%f12,	%f23
	fnegd	%f10,	%f14
	alignaddrl	%o0,	%g3,	%i2
	fnot2s	%f21,	%f12
	movrgz	%i6,	0x2A5,	%l0
	addc	%o6,	0x0318,	%g5
	fcmpd	%fcc3,	%f12,	%f12
	subcc	%i4,	0x1322,	%l1
	movpos	%icc,	%o1,	%g2
	edge8l	%g1,	%g4,	%i5
	fcmpes	%fcc2,	%f3,	%f27
	fmovdpos	%icc,	%f22,	%f12
	fmovd	%f22,	%f2
	nop
	set	0x5E, %o3
	stb	%l4,	[%l7 + %o3]
	movge	%xcc,	%l6,	%l2
	udivx	%o7,	0x1EBE,	%l3
	edge32l	%g6,	%o2,	%o5
	fnors	%f24,	%f29,	%f30
	ldd	[%l7 + 0x70],	%f6
	andncc	%i1,	%o3,	%g7
	fpack32	%f2,	%f18,	%f24
	fmovdvc	%icc,	%f16,	%f29
	sethi	0x0836,	%i7
	array16	%l5,	%i0,	%o4
	save %i3, 0x0920, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o0,	%i6,	%l0
	sub	%o6,	0x1656,	%g5
	fcmpes	%fcc2,	%f25,	%f6
	nop
	set	0x55, %o7
	stb	%i4,	[%l7 + %o7]
	fcmps	%fcc0,	%f12,	%f24
	fornot2	%f18,	%f0,	%f22
	orcc	%i2,	%l1,	%g2
	lduh	[%l7 + 0x6A],	%g1
	andcc	%g4,	%i5,	%l4
	stb	%l6,	[%l7 + 0x7E]
	fpadd16s	%f10,	%f3,	%f2
	srlx	%o1,	0x05,	%o7
	fcmple16	%f22,	%f24,	%l2
	lduh	[%l7 + 0x46],	%g6
	fnor	%f12,	%f0,	%f24
	movneg	%xcc,	%o2,	%o5
	array16	%l3,	%o3,	%i1
	fmovsge	%xcc,	%f8,	%f8
	move	%xcc,	%g7,	%i7
	xor	%i0,	0x0497,	%o4
	save %i3, 0x0BFE, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%g3,	[%l7 + 0x40]
	fmovrdne	%i6,	%f18,	%f4
	xnorcc	%o0,	%o6,	%g5
	subcc	%i4,	%l0,	%i2
	fpadd16	%f4,	%f16,	%f12
	fxor	%f24,	%f14,	%f12
	fnegs	%f27,	%f28
	stx	%g2,	[%l7 + 0x10]
	movvs	%xcc,	%g1,	%g4
	movvc	%xcc,	%i5,	%l4
	movre	%l6,	%o1,	%o7
	ldx	[%l7 + 0x18],	%l2
	stb	%g6,	[%l7 + 0x27]
	mulscc	%l1,	0x19B3,	%o5
	fmovsa	%xcc,	%f27,	%f17
	fcmple32	%f24,	%f10,	%o2
	for	%f10,	%f2,	%f22
	fpadd32	%f2,	%f8,	%f0
	movrgz	%l3,	0x020,	%i1
	fnands	%f23,	%f26,	%f28
	movle	%xcc,	%g7,	%i7
	popc	0x197C,	%o3
	fmovdleu	%xcc,	%f9,	%f24
	andn	%i0,	%o4,	%i3
	edge32	%g3,	%i6,	%l5
	ld	[%l7 + 0x20],	%f20
	movvc	%icc,	%o6,	%o0
	edge32	%i4,	%l0,	%g5
	fmovspos	%xcc,	%f15,	%f27
	movvc	%icc,	%i2,	%g2
	fand	%f28,	%f30,	%f2
	edge32ln	%g4,	%i5,	%g1
	mova	%icc,	%l4,	%l6
	movcs	%icc,	%o1,	%o7
	sll	%g6,	%l1,	%o5
	edge8	%o2,	%l2,	%i1
	movrgz	%l3,	0x358,	%i7
	orn	%o3,	%i0,	%g7
	movrlz	%i3,	0x212,	%o4
	edge16n	%i6,	%g3,	%l5
	sdiv	%o0,	0x0294,	%o6
	edge16l	%i4,	%l0,	%g5
	orcc	%i2,	0x1267,	%g4
	and	%i5,	%g2,	%g1
	sdivx	%l4,	0x07A3,	%l6
	mulscc	%o1,	0x1A3F,	%g6
	addcc	%o7,	0x17AD,	%o5
	fmovd	%f28,	%f8
	umulcc	%o2,	%l1,	%i1
	sethi	0x1FFE,	%l2
	udiv	%l3,	0x120D,	%o3
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	movcc	%xcc,	%i0,	%o4
	fmovrdgez	%g3,	%f30,	%f28
	xor	%i6,	0x1960,	%l5
	xnor	%o6,	0x174A,	%i4
	orcc	%o0,	%l0,	%i2
	sllx	%g4,	0x0D,	%g5
	srlx	%i5,	0x1B,	%g2
	udivx	%l4,	0x1694,	%g1
	fmovrdgz	%o1,	%f18,	%f4
	andn	%l6,	0x0DF7,	%g6
	lduh	[%l7 + 0x5A],	%o5
	fmovdn	%icc,	%f17,	%f28
	fpadd16	%f18,	%f18,	%f18
	movcc	%xcc,	%o7,	%l1
	stw	%o2,	[%l7 + 0x6C]
	std	%f28,	[%l7 + 0x30]
	sllx	%i1,	0x1F,	%l2
	fandnot1s	%f11,	%f4,	%f28
	ldsb	[%l7 + 0x0E],	%o3
	stb	%i7,	[%l7 + 0x53]
	ldsw	[%l7 + 0x34],	%g7
	andncc	%i3,	%i0,	%o4
	array16	%l3,	%i6,	%l5
	andcc	%g3,	0x090A,	%o6
	edge8	%i4,	%o0,	%i2
	fpadd32s	%f6,	%f5,	%f27
	mova	%xcc,	%l0,	%g5
	subcc	%i5,	0x1EBF,	%g4
	sdivcc	%g2,	0x0055,	%g1
	nop
	set	0x1A, %i2
	sth	%l4,	[%l7 + %i2]
	movrgz	%l6,	%g6,	%o5
	movcs	%xcc,	%o7,	%l1
	fmul8x16al	%f4,	%f16,	%f0
	add	%o1,	%i1,	%l2
	umulcc	%o2,	0x096A,	%o3
	movcc	%icc,	%g7,	%i3
	edge16l	%i7,	%o4,	%i0
	sll	%l3,	0x07,	%i6
	movcc	%icc,	%g3,	%l5
	fmovsgu	%xcc,	%f14,	%f3
	fmovsleu	%xcc,	%f30,	%f2
	sdiv	%i4,	0x16AD,	%o0
	nop
	set	0x46, %g2
	ldsb	[%l7 + %g2],	%o6
	ldsh	[%l7 + 0x4E],	%i2
	fmovdne	%xcc,	%f7,	%f3
	ldsb	[%l7 + 0x28],	%l0
	orcc	%g5,	0x0097,	%g4
	edge8	%g2,	%i5,	%g1
	lduh	[%l7 + 0x60],	%l4
	nop
	set	0x38, %l4
	std	%f6,	[%l7 + %l4]
	umulcc	%g6,	0x1EFC,	%o5
	sth	%l6,	[%l7 + 0x38]
	sir	0x1BB1
	udiv	%l1,	0x0E4D,	%o1
	sdivx	%o7,	0x1F00,	%l2
	sir	0x1AE9
	std	%f4,	[%l7 + 0x40]
	fone	%f8
	edge16l	%o2,	%i1,	%o3
	xnorcc	%i3,	%i7,	%o4
	udiv	%g7,	0x1DFE,	%i0
	ldub	[%l7 + 0x10],	%l3
	ld	[%l7 + 0x78],	%f6
	stx	%i6,	[%l7 + 0x50]
	mova	%xcc,	%l5,	%g3
	sllx	%o0,	%i4,	%i2
	xnor	%o6,	0x18E5,	%l0
	fmovsn	%icc,	%f5,	%f13
	movrgez	%g5,	%g2,	%g4
	edge32n	%i5,	%g1,	%l4
	ldsw	[%l7 + 0x74],	%g6
	nop
	set	0x36, %g3
	lduh	[%l7 + %g3],	%o5
	movgu	%xcc,	%l1,	%l6
	movvs	%xcc,	%o7,	%o1
	sll	%l2,	0x12,	%i1
	movneg	%xcc,	%o3,	%o2
	srl	%i3,	0x16,	%o4
	fmovrslez	%i7,	%f21,	%f12
	fcmple16	%f20,	%f14,	%i0
	fmovsg	%xcc,	%f3,	%f20
	mulx	%g7,	%l3,	%l5
	nop
	set	0x2C, %i6
	ldsh	[%l7 + %i6],	%i6
	fmovd	%f2,	%f6
	sethi	0x0885,	%g3
	xnor	%o0,	0x0ED0,	%i4
	fcmple32	%f14,	%f16,	%i2
	fpsub16	%f12,	%f20,	%f6
	movrlz	%o6,	0x1D5,	%g5
	restore %l0, 0x0A42, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i5,	0x13C7,	%g1
	fmul8x16al	%f1,	%f13,	%f12
	subcc	%g4,	0x1921,	%g6
	mulx	%o5,	%l4,	%l1
	movg	%icc,	%l6,	%o7
	xor	%l2,	0x1875,	%o1
	movleu	%xcc,	%o3,	%i1
	orcc	%i3,	%o4,	%i7
	ldub	[%l7 + 0x75],	%i0
	array8	%g7,	%l3,	%o2
	movn	%icc,	%l5,	%i6
	subccc	%o0,	0x1832,	%i4
	fmovsgu	%icc,	%f11,	%f0
	ldsh	[%l7 + 0x26],	%i2
	mulscc	%g3,	%o6,	%g5
	edge16n	%g2,	%i5,	%g1
	smulcc	%g4,	%l0,	%o5
	subc	%g6,	%l4,	%l1
	fmovsvs	%xcc,	%f29,	%f18
	fnegd	%f26,	%f0
	srlx	%o7,	0x0C,	%l2
	pdist	%f22,	%f16,	%f0
	fmovsge	%icc,	%f29,	%f11
	srl	%l6,	0x04,	%o3
	andn	%i1,	0x1524,	%o1
	subc	%i3,	0x0F16,	%o4
	subc	%i0,	0x019E,	%i7
	lduh	[%l7 + 0x0E],	%l3
	fmovscs	%xcc,	%f3,	%f22
	fnot1s	%f24,	%f1
	fcmpeq16	%f10,	%f2,	%g7
	smulcc	%l5,	0x0412,	%o2
	fnot2s	%f9,	%f21
	movvc	%icc,	%i6,	%i4
	save %i2, 0x0E6A, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x77],	%o6
	ldub	[%l7 + 0x15],	%g5
	srl	%g2,	0x04,	%i5
	sdivcc	%o0,	0x04D0,	%g1
	st	%f31,	[%l7 + 0x14]
	fnands	%f3,	%f21,	%f24
	mulscc	%g4,	0x150D,	%o5
	edge8ln	%l0,	%l4,	%l1
	subcc	%g6,	0x05B8,	%o7
	movge	%xcc,	%l2,	%o3
	addcc	%i1,	%o1,	%l6
	ld	[%l7 + 0x44],	%f31
	fmovsge	%xcc,	%f29,	%f4
	fand	%f14,	%f22,	%f8
	movre	%o4,	0x335,	%i3
	subcc	%i0,	%l3,	%i7
	srlx	%g7,	0x09,	%l5
	std	%f16,	[%l7 + 0x70]
	movrgz	%i6,	%i4,	%i2
	ld	[%l7 + 0x60],	%f13
	udiv	%o2,	0x0B8F,	%g3
	edge32l	%o6,	%g2,	%i5
	movrne	%o0,	%g5,	%g4
	movrlz	%o5,	%l0,	%l4
	addccc	%l1,	0x0019,	%g1
	fmovdle	%xcc,	%f16,	%f3
	fcmple32	%f4,	%f24,	%g6
	array32	%l2,	%o7,	%i1
	movpos	%xcc,	%o1,	%l6
	array16	%o4,	%i3,	%i0
	lduh	[%l7 + 0x4A],	%l3
	popc	0x10EE,	%i7
	srl	%g7,	%o3,	%l5
	addcc	%i4,	0x160E,	%i6
	sll	%i2,	%g3,	%o2
	fabss	%f3,	%f7
	movl	%icc,	%o6,	%g2
	fnegs	%f6,	%f29
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	movrgz	%g5,	%o5,	%l4
	mova	%xcc,	%l0,	%g1
	restore %g6, 0x1AA9, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16al	%f26,	%f15,	%f14
	array16	%l2,	%o7,	%o1
	xor	%i1,	%o4,	%i3
	movvs	%icc,	%i0,	%l6
	fcmpgt32	%f26,	%f30,	%l3
	sllx	%i7,	%g7,	%l5
	fmovsn	%icc,	%f16,	%f8
	edge8	%i4,	%o3,	%i6
	fmovse	%xcc,	%f23,	%f31
	sllx	%i2,	0x1F,	%o2
	ld	[%l7 + 0x24],	%f18
	edge32ln	%o6,	%g2,	%g3
	xor	%i5,	%g4,	%g5
	siam	0x2
	fnand	%f12,	%f12,	%f30
	edge8ln	%o0,	%l4,	%o5
	edge32	%l0,	%g1,	%l1
	ldsb	[%l7 + 0x4E],	%l2
	mulx	%o7,	0x1278,	%g6
	andn	%i1,	%o4,	%o1
	fornot1s	%f23,	%f25,	%f19
	subc	%i0,	%l6,	%l3
	edge32	%i7,	%g7,	%l5
	sdiv	%i4,	0x1563,	%o3
	mova	%xcc,	%i3,	%i6
	movrgz	%o2,	%o6,	%i2
	fabss	%f2,	%f16
	array32	%g2,	%i5,	%g4
	nop
	set	0x16, %i0
	lduh	[%l7 + %i0],	%g3
	fpsub32	%f16,	%f24,	%f8
	movn	%xcc,	%o0,	%l4
	movrlz	%g5,	0x3E5,	%o5
	fmovsgu	%icc,	%f2,	%f4
	orcc	%l0,	%g1,	%l1
	sub	%o7,	0x1B1B,	%l2
	edge32	%g6,	%o4,	%o1
	movre	%i1,	%i0,	%l6
	fornot1s	%f30,	%f14,	%f1
	fmuld8ulx16	%f29,	%f29,	%f14
	sub	%l3,	%i7,	%l5
	nop
	set	0x72, %l3
	ldsh	[%l7 + %l3],	%i4
	fmovsg	%icc,	%f19,	%f10
	fmovda	%icc,	%f16,	%f17
	movcs	%icc,	%o3,	%g7
	fnand	%f22,	%f6,	%f14
	movgu	%xcc,	%i6,	%o2
	stb	%i3,	[%l7 + 0x1E]
	andcc	%i2,	%o6,	%i5
	fcmpgt16	%f18,	%f30,	%g4
	fcmpeq16	%f22,	%f28,	%g3
	stx	%g2,	[%l7 + 0x18]
	ldd	[%l7 + 0x70],	%l4
	edge8l	%o0,	%g5,	%l0
	add	%g1,	0x01D5,	%o5
	sra	%o7,	0x0C,	%l2
	stb	%l1,	[%l7 + 0x27]
	movgu	%icc,	%o4,	%g6
	edge32n	%o1,	%i0,	%i1
	smulcc	%l6,	0x19AA,	%l3
	movcs	%xcc,	%i7,	%i4
	edge8l	%o3,	%l5,	%g7
	movrlz	%o2,	0x125,	%i3
	edge32l	%i2,	%i6,	%i5
	fxor	%f20,	%f10,	%f30
	movrgz	%g4,	0x3C0,	%o6
	nop
	set	0x08, %g7
	std	%f14,	[%l7 + %g7]
	orn	%g2,	%l4,	%g3
	subc	%g5,	%l0,	%o0
	ld	[%l7 + 0x70],	%f28
	faligndata	%f4,	%f8,	%f8
	lduw	[%l7 + 0x08],	%o5
	sll	%g1,	%o7,	%l2
	edge32	%o4,	%l1,	%g6
	movle	%xcc,	%i0,	%o1
	fmul8ulx16	%f20,	%f30,	%f12
	mulscc	%l6,	%l3,	%i1
	and	%i7,	%o3,	%i4
	faligndata	%f14,	%f18,	%f14
	ldsh	[%l7 + 0x68],	%l5
	mulscc	%g7,	%i3,	%i2
	movrgz	%o2,	0x2FB,	%i6
	movn	%icc,	%g4,	%o6
	movle	%icc,	%i5,	%l4
	sth	%g2,	[%l7 + 0x42]
	fone	%f22
	udiv	%g3,	0x15AC,	%l0
	sdivx	%g5,	0x1575,	%o5
	ldx	[%l7 + 0x60],	%g1
	popc	%o7,	%l2
	fmovsa	%icc,	%f20,	%f29
	ldx	[%l7 + 0x28],	%o4
	ldsb	[%l7 + 0x35],	%l1
	subccc	%g6,	0x05EC,	%i0
	add	%o1,	0x0643,	%o0
	edge16ln	%l6,	%l3,	%i1
	fmovdvc	%icc,	%f12,	%f13
	ldd	[%l7 + 0x28],	%f16
	andn	%i7,	%o3,	%i4
	fcmped	%fcc0,	%f14,	%f18
	movrlz	%g7,	0x272,	%l5
	orn	%i3,	0x1BFE,	%o2
	edge8	%i2,	%i6,	%o6
	fone	%f6
	sdivx	%i5,	0x00BE,	%l4
	movn	%icc,	%g2,	%g3
	edge32	%g4,	%l0,	%g5
	umulcc	%o5,	0x15D4,	%g1
	save %o7, %o4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%g6,	%l2
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	movvc	%xcc,	%o1,	%l6
	fmovse	%icc,	%f21,	%f16
	mulx	%i1,	%l3,	%o3
	save %i4, 0x0E7A, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x34],	%i7
	sllx	%i3,	%l5,	%o2
	subccc	%i2,	0x1C84,	%i6
	ldsb	[%l7 + 0x38],	%i5
	or	%l4,	%o6,	%g2
	fnot1s	%f3,	%f17
	srl	%g3,	0x18,	%g4
	fmovscs	%xcc,	%f0,	%f21
	movrne	%g5,	0x0F7,	%o5
	movcc	%xcc,	%g1,	%l0
	fmovrslez	%o4,	%f16,	%f27
	ldsh	[%l7 + 0x1C],	%l1
	sethi	0x1A9A,	%o7
	andncc	%g6,	%l2,	%i0
	fmovs	%f6,	%f19
	fmovrdlez	%o0,	%f14,	%f28
	edge8	%l6,	%o1,	%i1
	fcmple16	%f30,	%f16,	%o3
	edge32ln	%l3,	%i4,	%g7
	udiv	%i7,	0x1336,	%i3
	xorcc	%o2,	%l5,	%i6
	fnor	%f4,	%f16,	%f2
	movre	%i2,	0x114,	%i5
	addccc	%l4,	0x0C3D,	%o6
	edge16ln	%g3,	%g2,	%g5
	save %o5, 0x0573, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g1,	[%l7 + 0x30]
	fandnot2	%f20,	%f18,	%f14
	subc	%l0,	%o4,	%o7
	sra	%g6,	0x01,	%l1
	ldd	[%l7 + 0x18],	%i0
	fxor	%f30,	%f22,	%f14
	fmovde	%icc,	%f20,	%f28
	addccc	%l2,	0x1A0E,	%l6
	sdivx	%o0,	0x0CA7,	%o1
	andn	%o3,	0x1F19,	%i1
	fmovrdne	%l3,	%f30,	%f6
	fmovdgu	%icc,	%f13,	%f9
	subcc	%i4,	%i7,	%g7
	fmovscc	%xcc,	%f24,	%f17
	edge32	%i3,	%l5,	%i6
	xnor	%o2,	%i5,	%i2
	siam	0x1
	orn	%o6,	%g3,	%g2
	stw	%l4,	[%l7 + 0x30]
	sll	%o5,	0x00,	%g4
	movpos	%xcc,	%g1,	%g5
	movleu	%icc,	%o4,	%l0
	sth	%o7,	[%l7 + 0x1A]
	fmovdge	%icc,	%f7,	%f4
	fmovscs	%icc,	%f11,	%f20
	sdivcc	%l1,	0x1D59,	%i0
	ld	[%l7 + 0x0C],	%f12
	ldub	[%l7 + 0x57],	%g6
	stb	%l2,	[%l7 + 0x72]
	movrlez	%l6,	%o1,	%o3
	fsrc2	%f20,	%f10
	movrne	%i1,	%o0,	%l3
	fpsub16s	%f18,	%f7,	%f21
	movrgz	%i4,	0x2E5,	%g7
	umulcc	%i3,	%i7,	%i6
	edge32n	%l5,	%i5,	%o2
	sll	%o6,	0x1E,	%g3
	ldsb	[%l7 + 0x74],	%g2
	fmovdg	%xcc,	%f17,	%f18
	fmovdpos	%icc,	%f1,	%f11
	sub	%l4,	0x05A1,	%o5
	xnor	%i2,	%g1,	%g4
	movg	%xcc,	%g5,	%l0
	ldub	[%l7 + 0x27],	%o7
	edge8	%l1,	%i0,	%o4
	movrne	%g6,	%l6,	%l2
	alignaddrl	%o3,	%o1,	%i1
	mulx	%o0,	0x1E6A,	%l3
	alignaddr	%i4,	%i3,	%i7
	orcc	%g7,	0x1953,	%l5
	subc	%i6,	%i5,	%o2
	movgu	%xcc,	%g3,	%o6
	movge	%icc,	%l4,	%o5
	subcc	%g2,	%i2,	%g4
	xnor	%g5,	%l0,	%g1
	edge16ln	%o7,	%l1,	%o4
	fmovdgu	%icc,	%f17,	%f18
	fcmpgt32	%f26,	%f14,	%i0
	edge16	%g6,	%l6,	%l2
	sdivcc	%o3,	0x0A54,	%i1
	xnorcc	%o1,	%o0,	%i4
	movne	%icc,	%i3,	%l3
	addc	%g7,	0x1748,	%i7
	sdivx	%l5,	0x17B8,	%i6
	movrlez	%i5,	%g3,	%o6
	ldsb	[%l7 + 0x7F],	%o2
	array8	%l4,	%g2,	%i2
	mulscc	%o5,	%g5,	%l0
	array8	%g1,	%o7,	%l1
	fnot2s	%f19,	%f17
	sdivx	%o4,	0x0567,	%g4
	ldsh	[%l7 + 0x6C],	%i0
	fnands	%f16,	%f18,	%f4
	movl	%xcc,	%g6,	%l2
	andn	%o3,	%i1,	%l6
	lduw	[%l7 + 0x58],	%o1
	umul	%o0,	0x1372,	%i3
	movrlez	%l3,	%i4,	%g7
	alignaddr	%i7,	%i6,	%i5
	fcmpeq16	%f30,	%f0,	%l5
	xor	%g3,	0x0513,	%o6
	andncc	%o2,	%l4,	%g2
	xor	%i2,	0x0430,	%o5
	fone	%f18
	sdivx	%g5,	0x1AB1,	%l0
	edge16n	%g1,	%l1,	%o7
	movrne	%g4,	%o4,	%g6
	movrne	%i0,	0x22B,	%o3
	restore %i1, %l6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1D49
	movvs	%xcc,	%o1,	%o0
	movg	%icc,	%i3,	%i4
	xor	%l3,	0x1BC9,	%g7
	array8	%i7,	%i5,	%i6
	edge16	%l5,	%g3,	%o6
	fors	%f31,	%f3,	%f19
	fcmpgt32	%f14,	%f24,	%o2
	stw	%g2,	[%l7 + 0x68]
	array8	%l4,	%i2,	%o5
	udivcc	%l0,	0x1C9F,	%g1
	mulscc	%g5,	%l1,	%o7
	edge8n	%g4,	%o4,	%i0
	sub	%g6,	%i1,	%o3
	edge16l	%l2,	%o1,	%l6
	edge16l	%i3,	%o0,	%i4
	movgu	%icc,	%l3,	%g7
	ldx	[%l7 + 0x18],	%i7
	andncc	%i5,	%i6,	%g3
	fmovsl	%xcc,	%f10,	%f0
	fmovdneg	%xcc,	%f26,	%f13
	ldsw	[%l7 + 0x10],	%o6
	fcmpeq32	%f6,	%f14,	%o2
	movleu	%xcc,	%l5,	%g2
	srlx	%l4,	%o5,	%l0
	xnorcc	%i2,	%g1,	%l1
	movvs	%icc,	%g5,	%o7
	umulcc	%g4,	%i0,	%g6
	movvs	%icc,	%i1,	%o3
	fmovse	%xcc,	%f28,	%f19
	sdivx	%o4,	0x1404,	%o1
	or	%l2,	%l6,	%o0
	edge16ln	%i4,	%l3,	%i3
	fexpand	%f20,	%f22
	movgu	%icc,	%g7,	%i5
	edge8n	%i6,	%g3,	%o6
	andncc	%o2,	%l5,	%g2
	addcc	%i7,	%l4,	%o5
	movrgez	%l0,	0x2E8,	%i2
	sir	0x0697
	std	%f0,	[%l7 + 0x10]
	fmovsle	%xcc,	%f23,	%f27
	srlx	%g1,	%g5,	%o7
	fmovrde	%g4,	%f0,	%f18
	movpos	%icc,	%i0,	%g6
	movrgez	%i1,	%l1,	%o3
	movvc	%icc,	%o1,	%o4
	std	%f24,	[%l7 + 0x30]
	std	%f10,	[%l7 + 0x70]
	movpos	%xcc,	%l2,	%l6
	fpmerge	%f4,	%f20,	%f6
	edge32ln	%i4,	%o0,	%i3
	siam	0x0
	srax	%l3,	0x11,	%g7
	ldd	[%l7 + 0x08],	%f4
	edge16l	%i6,	%g3,	%o6
	udivcc	%o2,	0x0D58,	%l5
	andn	%g2,	%i7,	%l4
	fmovrde	%i5,	%f0,	%f0
	edge16ln	%l0,	%i2,	%o5
	fors	%f0,	%f19,	%f17
	subccc	%g1,	%g5,	%o7
	movrgz	%i0,	%g6,	%i1
	srlx	%g4,	0x14,	%o3
	ldsh	[%l7 + 0x7C],	%l1
	edge8l	%o1,	%o4,	%l2
	sdivcc	%i4,	0x1B51,	%l6
	alignaddrl	%o0,	%l3,	%g7
	orn	%i3,	%i6,	%g3
	movrlz	%o6,	0x3AD,	%o2
	save %g2, 0x05A9, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l4,	%i5,	%l5
	move	%xcc,	%i2,	%o5
	movvs	%xcc,	%g1,	%l0
	edge16l	%o7,	%g5,	%i0
	srax	%g6,	%g4,	%i1
	fcmpes	%fcc3,	%f4,	%f10
	array8	%l1,	%o1,	%o4
	fcmped	%fcc1,	%f12,	%f24
	movre	%l2,	%o3,	%i4
	fpackfix	%f8,	%f3
	xnor	%l6,	%o0,	%l3
	sdiv	%g7,	0x0919,	%i6
	alignaddrl	%i3,	%o6,	%g3
	mulx	%g2,	%o2,	%i7
	std	%f12,	[%l7 + 0x28]
	movcc	%xcc,	%l4,	%i5
	fmovsle	%icc,	%f22,	%f14
	alignaddr	%i2,	%l5,	%o5
	fmovdgu	%icc,	%f16,	%f24
	edge8l	%l0,	%g1,	%o7
	popc	%i0,	%g5
	xnor	%g6,	0x1434,	%g4
	orncc	%l1,	0x0B33,	%i1
	array8	%o4,	%l2,	%o1
	fexpand	%f24,	%f22
	ldd	[%l7 + 0x48],	%f22
	ldd	[%l7 + 0x68],	%f12
	edge32n	%o3,	%l6,	%o0
	sethi	0x1B57,	%i4
	fandnot2	%f12,	%f28,	%f24
	fands	%f25,	%f18,	%f27
	alignaddrl	%l3,	%g7,	%i3
	fabsd	%f18,	%f16
	xnor	%i6,	%o6,	%g2
	mulx	%g3,	%i7,	%o2
	ldsb	[%l7 + 0x7D],	%i5
	smulcc	%i2,	%l5,	%l4
	xor	%l0,	%g1,	%o7
	andcc	%o5,	0x020D,	%g5
	fmovrdne	%g6,	%f8,	%f30
	fpadd32s	%f0,	%f0,	%f5
	ldx	[%l7 + 0x40],	%g4
	addc	%i0,	%i1,	%l1
	sdiv	%l2,	0x1D50,	%o4
	umulcc	%o1,	%o3,	%l6
	srlx	%i4,	%l3,	%g7
	fzeros	%f21
	sllx	%i3,	0x1D,	%o0
	movrlez	%i6,	%g2,	%o6
	sll	%i7,	%o2,	%g3
	stb	%i2,	[%l7 + 0x56]
	lduw	[%l7 + 0x34],	%l5
	fmovdne	%icc,	%f23,	%f23
	orn	%l4,	0x03F4,	%l0
	edge16ln	%g1,	%i5,	%o5
	fandnot1	%f14,	%f4,	%f30
	orncc	%g5,	%o7,	%g4
	sllx	%g6,	0x14,	%i1
	xorcc	%i0,	%l1,	%o4
	fmovsge	%xcc,	%f1,	%f26
	fzeros	%f3
	movrne	%l2,	%o3,	%l6
	udivcc	%o1,	0x02BF,	%l3
	xnorcc	%g7,	%i4,	%i3
	fnors	%f6,	%f4,	%f17
	or	%i6,	0x1150,	%g2
	fmovdg	%xcc,	%f13,	%f6
	mulscc	%o6,	%o0,	%o2
	movcc	%xcc,	%i7,	%i2
	movcs	%xcc,	%g3,	%l4
	movrgz	%l5,	0x301,	%g1
	addc	%l0,	0x0C3D,	%i5
	save %o5, 0x0736, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x5A],	%g4
	movvs	%icc,	%g6,	%i1
	sdiv	%o7,	0x15EF,	%i0
	subccc	%l1,	0x0990,	%o4
	stx	%o3,	[%l7 + 0x18]
	xnorcc	%l2,	0x10A3,	%l6
	movle	%icc,	%l3,	%o1
	fmuld8ulx16	%f2,	%f22,	%f24
	array8	%g7,	%i3,	%i4
	array16	%i6,	%o6,	%g2
	smulcc	%o0,	0x048A,	%o2
	fandnot2s	%f17,	%f10,	%f31
	sdiv	%i7,	0x1125,	%g3
	movrlez	%l4,	0x17F,	%i2
	sdivcc	%l5,	0x1F4D,	%l0
	mova	%icc,	%g1,	%o5
	ldub	[%l7 + 0x42],	%g5
	movge	%icc,	%i5,	%g6
	movrlez	%i1,	%o7,	%i0
	movvs	%icc,	%l1,	%o4
	ld	[%l7 + 0x10],	%f26
	nop
	set	0x44, %i7
	stw	%g4,	[%l7 + %i7]
	movneg	%xcc,	%l2,	%l6
	subccc	%o3,	%l3,	%o1
	nop
	set	0x0F, %i4
	stb	%i3,	[%l7 + %i4]
	movrlez	%i4,	0x107,	%g7
	array32	%o6,	%i6,	%g2
	xnorcc	%o2,	0x14DB,	%i7
	ldd	[%l7 + 0x40],	%g2
	fmuld8ulx16	%f23,	%f10,	%f10
	edge16l	%o0,	%l4,	%i2
	array32	%l0,	%g1,	%o5
	mulx	%l5,	%i5,	%g5
	fsrc1	%f20,	%f8
	udivcc	%i1,	0x02B4,	%g6
	ldd	[%l7 + 0x60],	%i0
	fcmpgt32	%f0,	%f4,	%l1
	std	%f22,	[%l7 + 0x50]
	smul	%o4,	0x1737,	%o7
	fmovrse	%g4,	%f16,	%f25
	movcc	%xcc,	%l6,	%l2
	movre	%l3,	0x224,	%o3
	edge8l	%i3,	%o1,	%g7
	or	%i4,	0x06B5,	%o6
	fnegs	%f12,	%f0
	sir	0x0A44
	sub	%g2,	%o2,	%i7
	movrne	%i6,	%g3,	%l4
	fmuld8sux16	%f4,	%f5,	%f24
	srlx	%i2,	%o0,	%l0
	popc	%o5,	%g1
	subc	%i5,	0x1767,	%g5
	ldx	[%l7 + 0x08],	%l5
	umulcc	%g6,	%i1,	%l1
	xor	%o4,	%i0,	%g4
	smulcc	%o7,	0x1373,	%l2
	fmovdcc	%xcc,	%f0,	%f10
	ldd	[%l7 + 0x60],	%f28
	xor	%l6,	0x0B26,	%o3
	edge32ln	%i3,	%l3,	%g7
	srax	%i4,	%o6,	%o1
	addcc	%o2,	0x19A5,	%g2
	array16	%i6,	%g3,	%i7
	lduh	[%l7 + 0x48],	%l4
	fcmpes	%fcc0,	%f26,	%f31
	ldd	[%l7 + 0x40],	%o0
	addc	%l0,	%i2,	%o5
	fnegs	%f14,	%f24
	srax	%i5,	%g5,	%l5
	and	%g1,	%i1,	%g6
	ldd	[%l7 + 0x60],	%o4
	fpadd32	%f8,	%f24,	%f16
	andcc	%l1,	%g4,	%i0
	xor	%o7,	0x161A,	%l2
	movgu	%icc,	%l6,	%o3
	fpadd16s	%f1,	%f17,	%f8
	srl	%i3,	0x02,	%l3
	xnorcc	%g7,	%i4,	%o1
	movle	%xcc,	%o6,	%g2
	movrgez	%i6,	0x330,	%g3
	addccc	%o2,	0x1129,	%i7
	edge32l	%o0,	%l4,	%l0
	mulscc	%o5,	0x181F,	%i5
	ldd	[%l7 + 0x68],	%f4
	umul	%g5,	0x1B22,	%l5
	movgu	%icc,	%g1,	%i1
	sdivx	%g6,	0x1653,	%i2
	lduh	[%l7 + 0x0C],	%o4
	edge16	%l1,	%i0,	%g4
	edge32	%l2,	%l6,	%o3
	addc	%i3,	%l3,	%g7
	sdiv	%o7,	0x12A2,	%o1
	srax	%o6,	%i4,	%g2
	ldsw	[%l7 + 0x30],	%g3
	sth	%i6,	[%l7 + 0x6E]
	fcmpgt32	%f14,	%f26,	%i7
	edge32ln	%o2,	%o0,	%l0
	edge16n	%l4,	%i5,	%g5
	orncc	%o5,	%l5,	%i1
	st	%f24,	[%l7 + 0x68]
	umul	%g6,	%g1,	%o4
	movvc	%xcc,	%i2,	%l1
	mova	%xcc,	%g4,	%l2
	andn	%l6,	%i0,	%o3
	movg	%xcc,	%i3,	%l3
	subcc	%o7,	0x1CEC,	%g7
	sdiv	%o6,	0x023B,	%i4
	and	%o1,	0x1373,	%g2
	lduh	[%l7 + 0x22],	%g3
	sethi	0x1946,	%i6
	movrlez	%i7,	0x2BD,	%o2
	orncc	%l0,	%o0,	%l4
	srl	%i5,	0x17,	%o5
	movrgz	%l5,	0x3C9,	%i1
	lduh	[%l7 + 0x24],	%g5
	movleu	%xcc,	%g1,	%g6
	movne	%icc,	%o4,	%l1
	movvs	%icc,	%i2,	%l2
	sdivx	%g4,	0x1628,	%l6
	ldsb	[%l7 + 0x6F],	%o3
	movgu	%xcc,	%i3,	%l3
	smul	%o7,	%i0,	%o6
	movrlz	%i4,	0x278,	%o1
	edge16	%g2,	%g3,	%g7
	fmovrse	%i7,	%f26,	%f28
	movpos	%xcc,	%o2,	%l0
	alignaddr	%o0,	%l4,	%i5
	sdiv	%i6,	0x15B1,	%l5
	movcc	%icc,	%o5,	%i1
	movrgz	%g1,	%g6,	%g5
	fandnot1s	%f20,	%f14,	%f0
	andncc	%l1,	%o4,	%l2
	sdivx	%g4,	0x100B,	%i2
	subc	%l6,	0x09D3,	%o3
	edge8l	%l3,	%i3,	%o7
	movrlz	%i0,	0x39C,	%i4
	movgu	%xcc,	%o6,	%o1
	edge16l	%g3,	%g2,	%g7
	movvs	%xcc,	%o2,	%l0
	ldd	[%l7 + 0x30],	%f4
	std	%f22,	[%l7 + 0x60]
	fmovdcs	%xcc,	%f27,	%f27
	edge8n	%o0,	%l4,	%i5
	movvs	%icc,	%i6,	%l5
	array8	%o5,	%i7,	%i1
	mulscc	%g1,	0x03B3,	%g6
	fmovsvs	%icc,	%f2,	%f7
	fmovdge	%xcc,	%f23,	%f12
	array16	%g5,	%o4,	%l1
	sdiv	%l2,	0x1B7F,	%i2
	save %l6, %g4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x71],	%l3
	xnorcc	%i3,	0x0B51,	%i0
	move	%icc,	%i4,	%o7
	orcc	%o1,	%o6,	%g3
	stw	%g7,	[%l7 + 0x34]
	movrne	%g2,	%l0,	%o2
	sir	0x1A16
	addccc	%l4,	0x1556,	%o0
	and	%i5,	%l5,	%i6
	addccc	%i7,	%o5,	%g1
	edge16n	%i1,	%g6,	%o4
	udiv	%l1,	0x05ED,	%g5
	edge32	%l2,	%i2,	%g4
	fmul8x16	%f6,	%f20,	%f18
	srlx	%l6,	0x14,	%l3
	fmovde	%xcc,	%f3,	%f3
	subccc	%i3,	%o3,	%i4
	orn	%i0,	%o1,	%o6
	movleu	%xcc,	%o7,	%g7
	subc	%g3,	%g2,	%l0
	fexpand	%f18,	%f30
	and	%l4,	0x00D7,	%o0
	fmovspos	%xcc,	%f23,	%f20
	std	%f20,	[%l7 + 0x40]
	ldsw	[%l7 + 0x58],	%o2
	sllx	%i5,	%l5,	%i6
	sethi	0x0FF0,	%i7
	alignaddr	%o5,	%g1,	%i1
	alignaddr	%o4,	%g6,	%l1
	subcc	%g5,	0x1852,	%i2
	fmovse	%xcc,	%f20,	%f0
	ldub	[%l7 + 0x42],	%g4
	xorcc	%l6,	0x1A89,	%l2
	srlx	%l3,	%i3,	%i4
	movpos	%icc,	%o3,	%i0
	fmovdge	%icc,	%f14,	%f9
	orncc	%o1,	0x10DB,	%o7
	xnor	%o6,	%g7,	%g2
	ldsh	[%l7 + 0x08],	%l0
	nop
	set	0x58, %i3
	ldsb	[%l7 + %i3],	%l4
	fnegd	%f14,	%f10
	fmovrdgez	%o0,	%f6,	%f18
	umulcc	%o2,	0x1F92,	%g3
	stx	%l5,	[%l7 + 0x10]
	movne	%xcc,	%i5,	%i7
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	sdiv	%o5,	0x028F,	%o4
	fxnors	%f6,	%f28,	%f19
	sth	%i1,	[%l7 + 0x6E]
	smulcc	%g6,	0x0612,	%l1
	lduw	[%l7 + 0x54],	%g5
	edge16l	%i2,	%g4,	%l6
	addccc	%l3,	0x15E8,	%i3
	fnot2	%f0,	%f28
	movvs	%icc,	%l2,	%i4
	addcc	%i0,	0x0080,	%o3
	orcc	%o1,	0x1B41,	%o7
	srax	%o6,	0x0F,	%g7
	sdivx	%l0,	0x0A88,	%l4
	movgu	%icc,	%o0,	%o2
	movleu	%icc,	%g2,	%l5
	edge32ln	%g3,	%i5,	%i6
	ldub	[%l7 + 0x19],	%i7
	sllx	%o5,	0x12,	%o4
	subcc	%i1,	0x1D92,	%g1
	xnor	%l1,	0x1A04,	%g5
	ldd	[%l7 + 0x08],	%f18
	sra	%g6,	%i2,	%l6
	edge8ln	%g4,	%i3,	%l3
	edge16ln	%i4,	%i0,	%l2
	std	%f10,	[%l7 + 0x60]
	sir	0x11E3
	movrgez	%o1,	%o7,	%o3
	edge16n	%o6,	%l0,	%l4
	fcmpgt16	%f10,	%f22,	%g7
	smul	%o0,	%o2,	%l5
	fands	%f4,	%f6,	%f3
	movvs	%xcc,	%g2,	%g3
	srl	%i5,	0x17,	%i6
	srax	%i7,	%o5,	%i1
	ldd	[%l7 + 0x08],	%f12
	udivcc	%o4,	0x12A2,	%g1
	movle	%icc,	%g5,	%l1
	orcc	%i2,	0x1B60,	%g6
	subccc	%l6,	0x1EEE,	%i3
	umulcc	%g4,	%l3,	%i0
	stb	%l2,	[%l7 + 0x53]
	std	%f4,	[%l7 + 0x10]
	fmovdpos	%icc,	%f23,	%f31
	movrne	%o1,	0x23D,	%o7
	fmovsg	%icc,	%f18,	%f4
	srax	%o3,	%o6,	%i4
	edge16	%l0,	%g7,	%l4
	fmovrdgz	%o2,	%f16,	%f4
	edge16l	%o0,	%g2,	%g3
	udivx	%i5,	0x1783,	%i6
	movg	%xcc,	%i7,	%l5
	sll	%i1,	0x0E,	%o5
	srl	%o4,	0x1B,	%g1
	alignaddr	%l1,	%g5,	%g6
	sdivcc	%i2,	0x0831,	%l6
	or	%g4,	0x15B1,	%l3
	edge16ln	%i3,	%l2,	%i0
	edge16	%o7,	%o1,	%o6
	edge32	%o3,	%i4,	%l0
	edge8l	%g7,	%l4,	%o0
	lduh	[%l7 + 0x3E],	%o2
	stb	%g2,	[%l7 + 0x3E]
	fmovsn	%icc,	%f1,	%f29
	orn	%i5,	0x154B,	%i6
	orcc	%g3,	%i7,	%l5
	fmovsge	%xcc,	%f31,	%f22
	and	%i1,	%o5,	%o4
	array32	%l1,	%g1,	%g6
	alignaddrl	%g5,	%l6,	%g4
	fnot2s	%f18,	%f22
	fpmerge	%f20,	%f0,	%f16
	movleu	%xcc,	%i2,	%i3
	sir	0x07B7
	fpsub32	%f22,	%f16,	%f30
	edge8	%l3,	%l2,	%i0
	array32	%o1,	%o7,	%o3
	addccc	%o6,	%l0,	%i4
	addc	%l4,	%o0,	%o2
	srlx	%g7,	0x13,	%i5
	addccc	%i6,	0x1E0C,	%g2
	sir	0x1811
	movn	%xcc,	%i7,	%g3
	sra	%l5,	%o5,	%i1
	fsrc2s	%f7,	%f9
	fcmple16	%f20,	%f8,	%o4
	andcc	%g1,	0x0B87,	%l1
	andcc	%g5,	%g6,	%g4
	orcc	%l6,	0x1528,	%i3
	edge16n	%l3,	%l2,	%i0
	fnors	%f17,	%f5,	%f28
	fcmpeq32	%f6,	%f22,	%o1
	fcmpgt32	%f10,	%f30,	%i2
	mulx	%o3,	%o6,	%o7
	fmovrdgez	%l0,	%f26,	%f28
	movre	%l4,	%i4,	%o2
	movl	%xcc,	%g7,	%i5
	sll	%o0,	0x1E,	%i6
	fandnot1	%f0,	%f6,	%f16
	movle	%icc,	%i7,	%g2
	stx	%g3,	[%l7 + 0x20]
	alignaddr	%o5,	%i1,	%l5
	array16	%g1,	%o4,	%l1
	edge8	%g6,	%g5,	%l6
	ldd	[%l7 + 0x38],	%f22
	smulcc	%g4,	%i3,	%l2
	fones	%f16
	udivcc	%l3,	0x1F6C,	%o1
	fmovda	%xcc,	%f27,	%f5
	std	%f12,	[%l7 + 0x50]
	fcmpes	%fcc2,	%f27,	%f21
	udivx	%i0,	0x089D,	%i2
	fmovsn	%icc,	%f27,	%f30
	sdivx	%o6,	0x19CB,	%o3
	movg	%xcc,	%l0,	%o7
	srax	%l4,	0x04,	%i4
	movvs	%xcc,	%g7,	%i5
	st	%f26,	[%l7 + 0x08]
	fmovda	%xcc,	%f11,	%f9
	nop
	set	0x40, %g6
	stb	%o0,	[%l7 + %g6]
	movl	%xcc,	%o2,	%i7
	movrne	%g2,	%g3,	%i6
	sth	%o5,	[%l7 + 0x22]
	mulx	%l5,	0x0218,	%i1
	fnors	%f0,	%f26,	%f20
	mulx	%o4,	0x18FD,	%g1
	mulscc	%g6,	%g5,	%l6
	fmovdleu	%xcc,	%f22,	%f4
	nop
	set	0x40, %o5
	ldd	[%l7 + %o5],	%f30
	ld	[%l7 + 0x3C],	%f31
	smul	%l1,	0x1480,	%g4
	array32	%l2,	%l3,	%i3
	or	%o1,	%i0,	%o6
	srax	%o3,	0x09,	%l0
	fand	%f6,	%f12,	%f24
	fsrc1	%f0,	%f20
	ldub	[%l7 + 0x3A],	%i2
	srl	%l4,	0x18,	%o7
	edge32n	%g7,	%i5,	%o0
	xorcc	%i4,	0x15DF,	%o2
	fxor	%f8,	%f4,	%f14
	edge8n	%g2,	%i7,	%g3
	orcc	%i6,	0x0F09,	%o5
	srlx	%l5,	%o4,	%i1
	movge	%xcc,	%g6,	%g5
	move	%xcc,	%l6,	%l1
	edge32ln	%g4,	%l2,	%l3
	movne	%xcc,	%g1,	%o1
	ldx	[%l7 + 0x10],	%i3
	sdivcc	%o6,	0x12B7,	%i0
	ldsb	[%l7 + 0x50],	%o3
	std	%f12,	[%l7 + 0x30]
	fmovd	%f22,	%f0
	movcc	%xcc,	%l0,	%l4
	fmovsle	%xcc,	%f1,	%f24
	fmovrdlez	%o7,	%f20,	%f6
	fmovda	%icc,	%f22,	%f24
	movgu	%xcc,	%i2,	%g7
	fpmerge	%f4,	%f5,	%f28
	edge8l	%o0,	%i4,	%i5
	xorcc	%g2,	0x0245,	%o2
	edge8	%g3,	%i6,	%i7
	sra	%l5,	%o5,	%i1
	movg	%xcc,	%o4,	%g5
	ldd	[%l7 + 0x78],	%f2
	fones	%f16
	xorcc	%l6,	0x1E0F,	%l1
	ldx	[%l7 + 0x40],	%g4
	udivcc	%g6,	0x151F,	%l3
	movvc	%xcc,	%l2,	%g1
	fmovdvs	%xcc,	%f13,	%f8
	ldub	[%l7 + 0x73],	%o1
	array16	%i3,	%o6,	%i0
	nop
	set	0x34, %l6
	stw	%l0,	[%l7 + %l6]
	fnand	%f14,	%f10,	%f20
	fmovdneg	%icc,	%f17,	%f25
	addccc	%o3,	0x00FD,	%l4
	edge8l	%o7,	%g7,	%i2
	ldub	[%l7 + 0x41],	%o0
	edge32l	%i4,	%g2,	%o2
	subccc	%i5,	0x0460,	%i6
	fcmple32	%f2,	%f16,	%g3
	umulcc	%i7,	%o5,	%l5
	fmul8x16	%f21,	%f4,	%f2
	srlx	%i1,	0x17,	%g5
	udivcc	%l6,	0x1628,	%o4
	fmovse	%icc,	%f28,	%f2
	edge8l	%l1,	%g4,	%l3
	fsrc1	%f24,	%f30
	move	%xcc,	%g6,	%g1
	xnor	%o1,	%i3,	%l2
	orncc	%o6,	0x0D1E,	%i0
	subc	%l0,	0x11E0,	%o3
	ldx	[%l7 + 0x08],	%l4
	edge8n	%g7,	%i2,	%o0
	fmovrdgez	%i4,	%f2,	%f26
	fsrc2s	%f28,	%f3
	orcc	%g2,	%o2,	%o7
	mulx	%i6,	0x089A,	%i5
	edge8	%g3,	%i7,	%o5
	xor	%i1,	0x1889,	%l5
	popc	%l6,	%g5
	fmovrsgez	%o4,	%f22,	%f4
	andn	%l1,	%g4,	%l3
	std	%f8,	[%l7 + 0x20]
	addc	%g1,	%g6,	%i3
	movrlz	%o1,	%o6,	%l2
	or	%l0,	0x0DDA,	%i0
	fnor	%f2,	%f24,	%f0
	edge32ln	%l4,	%o3,	%g7
	fone	%f0
	siam	0x4
	movrgez	%i2,	0x3F9,	%i4
	ldx	[%l7 + 0x70],	%g2
	edge8l	%o0,	%o2,	%o7
	orcc	%i6,	0x08D6,	%i5
	fpadd16	%f20,	%f20,	%f6
	restore %i7, 0x1ED9, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%o5,	0x1D85,	%i1
	edge32	%l5,	%g5,	%o4
	edge8n	%l1,	%g4,	%l6
	edge16n	%g1,	%l3,	%g6
	smulcc	%i3,	0x0C2A,	%o6
	sethi	0x188E,	%o1
	or	%l2,	0x12D7,	%i0
	edge8l	%l0,	%o3,	%l4
	srl	%i2,	0x16,	%g7
	alignaddrl	%i4,	%g2,	%o2
	fpadd32s	%f15,	%f26,	%f5
	movvs	%icc,	%o0,	%o7
	udivx	%i5,	0x1969,	%i6
	edge16	%i7,	%g3,	%o5
	fmovsleu	%icc,	%f16,	%f20
	ldsw	[%l7 + 0x14],	%i1
	fmovrdgez	%l5,	%f6,	%f14
	movvc	%xcc,	%o4,	%l1
	stx	%g4,	[%l7 + 0x48]
	andn	%g5,	%l6,	%l3
	movg	%xcc,	%g1,	%i3
	fnors	%f18,	%f3,	%f21
	ldd	[%l7 + 0x48],	%o6
	xnorcc	%g6,	%l2,	%o1
	movgu	%icc,	%i0,	%o3
	umulcc	%l4,	%i2,	%g7
	edge32	%i4,	%g2,	%o2
	edge32n	%o0,	%o7,	%i5
	fmovs	%f30,	%f22
	udivcc	%l0,	0x1F07,	%i7
	movcc	%icc,	%i6,	%o5
	fmovdn	%icc,	%f19,	%f26
	array8	%i1,	%g3,	%l5
	edge8ln	%o4,	%l1,	%g4
	edge8ln	%l6,	%l3,	%g1
	movneg	%icc,	%g5,	%o6
	sdivcc	%g6,	0x08DB,	%l2
	fmovscc	%icc,	%f29,	%f6
	movrlz	%o1,	%i3,	%i0
	stb	%o3,	[%l7 + 0x1D]
	fcmpgt16	%f2,	%f28,	%i2
	sth	%l4,	[%l7 + 0x58]
	movn	%xcc,	%i4,	%g7
	stw	%o2,	[%l7 + 0x74]
	movvc	%xcc,	%g2,	%o7
	movrlz	%o0,	%l0,	%i7
	sdivcc	%i5,	0x01EA,	%i6
	movrgz	%i1,	0x164,	%g3
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	sdivx	%l1,	0x125E,	%o4
	movre	%l6,	%g4,	%g1
	movl	%icc,	%l3,	%g5
	ldsb	[%l7 + 0x32],	%o6
	subc	%l2,	0x11F9,	%g6
	fcmpes	%fcc3,	%f7,	%f5
	edge32ln	%i3,	%o1,	%i0
	and	%o3,	0x1234,	%i2
	movvc	%xcc,	%l4,	%i4
	fsrc2s	%f4,	%f15
	fornot2	%f24,	%f14,	%f10
	st	%f26,	[%l7 + 0x6C]
	siam	0x3
	edge32n	%o2,	%g2,	%g7
	add	%o7,	0x1BBE,	%l0
	movg	%xcc,	%i7,	%i5
	fpadd16s	%f6,	%f31,	%f29
	fpsub16	%f14,	%f8,	%f8
	ldsb	[%l7 + 0x5A],	%i6
	fmovdpos	%icc,	%f30,	%f10
	alignaddr	%i1,	%g3,	%l5
	fmovde	%xcc,	%f27,	%f22
	addccc	%o5,	0x1ED6,	%l1
	fpmerge	%f26,	%f9,	%f16
	srl	%o0,	0x05,	%l6
	sllx	%o4,	0x1D,	%g4
	andn	%g1,	%l3,	%g5
	orn	%o6,	0x0B71,	%l2
	fornot1	%f22,	%f28,	%f2
	andncc	%g6,	%i3,	%i0
	lduh	[%l7 + 0x4E],	%o3
	lduw	[%l7 + 0x34],	%i2
	lduw	[%l7 + 0x0C],	%o1
	fpsub32s	%f9,	%f15,	%f8
	fmovsge	%icc,	%f13,	%f21
	stw	%i4,	[%l7 + 0x68]
	movrlz	%l4,	%o2,	%g2
	andncc	%o7,	%l0,	%g7
	edge8	%i7,	%i6,	%i5
	array8	%i1,	%l5,	%o5
	umulcc	%l1,	0x000C,	%o0
	movre	%g3,	%l6,	%o4
	fmovdneg	%icc,	%f29,	%f16
	subccc	%g1,	%l3,	%g4
	sir	0x035C
	save %g5, 0x0BC5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g6,	0x1DD1,	%l2
	movre	%i0,	%i3,	%i2
	st	%f8,	[%l7 + 0x70]
	ldsb	[%l7 + 0x60],	%o3
	movle	%xcc,	%i4,	%l4
	movl	%icc,	%o1,	%g2
	edge32l	%o7,	%l0,	%o2
	orn	%g7,	%i6,	%i7
	fmovdle	%xcc,	%f27,	%f8
	andn	%i5,	0x02D5,	%l5
	edge8l	%i1,	%l1,	%o0
	fmovrse	%o5,	%f11,	%f28
	movn	%icc,	%l6,	%g3
	pdist	%f8,	%f20,	%f14
	edge8ln	%g1,	%o4,	%g4
	fandnot1s	%f0,	%f8,	%f4
	fmovsvc	%xcc,	%f7,	%f11
	ldd	[%l7 + 0x60],	%f22
	fmovrslz	%g5,	%f29,	%f20
	ldx	[%l7 + 0x78],	%l3
	fmovrslez	%g6,	%f18,	%f21
	srlx	%o6,	%i0,	%i3
	fmul8x16al	%f22,	%f30,	%f14
	edge32n	%l2,	%i2,	%o3
	sth	%l4,	[%l7 + 0x16]
	stx	%o1,	[%l7 + 0x30]
	movrlz	%g2,	%o7,	%l0
	edge32	%i4,	%g7,	%i6
	lduw	[%l7 + 0x6C],	%i7
	fcmpeq16	%f22,	%f14,	%o2
	fmovdl	%xcc,	%f5,	%f11
	xnorcc	%i5,	0x08FB,	%l5
	sdiv	%i1,	0x06FF,	%l1
	orcc	%o0,	%o5,	%l6
	movn	%icc,	%g3,	%o4
	stb	%g1,	[%l7 + 0x4E]
	smul	%g5,	%l3,	%g6
	nop
	set	0x64, %i1
	ldsh	[%l7 + %i1],	%g4
	movcs	%xcc,	%i0,	%i3
	fmovscc	%xcc,	%f17,	%f31
	add	%l2,	0x0111,	%i2
	subcc	%o3,	0x108B,	%o6
	ldsh	[%l7 + 0x0C],	%o1
	subcc	%g2,	0x095A,	%o7
	ldd	[%l7 + 0x30],	%f6
	fmovdne	%icc,	%f7,	%f29
	fpadd32s	%f7,	%f24,	%f19
	edge16ln	%l0,	%l4,	%i4
	fmuld8ulx16	%f26,	%f18,	%f22
	movpos	%xcc,	%i6,	%i7
	movneg	%icc,	%g7,	%i5
	umulcc	%l5,	%i1,	%o2
	nop
	set	0x78, %i5
	lduw	[%l7 + %i5],	%o0
	sra	%l1,	%o5,	%g3
	movneg	%icc,	%o4,	%g1
	ldub	[%l7 + 0x0D],	%g5
	addccc	%l6,	%l3,	%g6
	xorcc	%g4,	0x17E9,	%i0
	fpack32	%f22,	%f10,	%f6
	fabsd	%f28,	%f20
	andn	%i3,	%l2,	%i2
	srax	%o6,	%o3,	%o1
	addc	%o7,	0x1A2D,	%g2
	addc	%l0,	0x1477,	%i4
	movcc	%icc,	%l4,	%i7
	movg	%icc,	%i6,	%g7
	edge8l	%i5,	%i1,	%l5
	movg	%xcc,	%o2,	%l1
	ldsb	[%l7 + 0x7F],	%o5
	fxnor	%f0,	%f4,	%f14
	addc	%o0,	0x15E3,	%g3
	fcmpeq16	%f8,	%f16,	%g1
	edge32n	%g5,	%o4,	%l6
	ldsh	[%l7 + 0x12],	%l3
	fcmple32	%f30,	%f8,	%g4
	ldsw	[%l7 + 0x24],	%i0
	edge16ln	%i3,	%l2,	%g6
	ldd	[%l7 + 0x78],	%f28
	subccc	%i2,	%o3,	%o6
	edge8ln	%o1,	%g2,	%o7
	xorcc	%l0,	%i4,	%i7
	edge32n	%l4,	%i6,	%g7
	st	%f15,	[%l7 + 0x54]
	mova	%xcc,	%i1,	%l5
	fpack16	%f18,	%f27
	xnor	%o2,	%l1,	%o5
	srax	%o0,	%g3,	%i5
	sdivx	%g5,	0x03B1,	%o4
	edge8ln	%l6,	%g1,	%l3
	movrlz	%g4,	%i0,	%l2
	fmovrdlz	%g6,	%f30,	%f2
	movleu	%icc,	%i3,	%i2
	sdivcc	%o6,	0x1199,	%o3
	edge16n	%o1,	%o7,	%l0
	movne	%icc,	%i4,	%i7
	ldd	[%l7 + 0x28],	%f28
	ldd	[%l7 + 0x50],	%g2
	srl	%l4,	%g7,	%i6
	smulcc	%i1,	%l5,	%o2
	sdivcc	%o5,	0x0150,	%l1
	andn	%g3,	%o0,	%g5
	fmuld8ulx16	%f24,	%f26,	%f16
	array16	%o4,	%i5,	%g1
	movrlz	%l3,	0x3FD,	%l6
	stb	%g4,	[%l7 + 0x6F]
	ldsw	[%l7 + 0x60],	%l2
	movre	%i0,	%g6,	%i2
	ldd	[%l7 + 0x08],	%f16
	nop
	set	0x4C, %l0
	stw	%i3,	[%l7 + %l0]
	fmul8x16au	%f0,	%f0,	%f12
	ldsb	[%l7 + 0x7B],	%o6
	add	%o1,	%o7,	%l0
	fcmps	%fcc2,	%f6,	%f30
	restore %o3, %i4, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x34],	%g2
	fpackfix	%f30,	%f12
	subccc	%l4,	%i6,	%g7
	ldub	[%l7 + 0x16],	%i1
	fpsub32s	%f31,	%f0,	%f17
	fpack16	%f0,	%f30
	edge32l	%o2,	%o5,	%l1
	ld	[%l7 + 0x78],	%f31
	xnorcc	%l5,	%g3,	%g5
	fmovrdlz	%o4,	%f20,	%f20
	addcc	%o0,	0x1D8B,	%g1
	fpadd32s	%f21,	%f2,	%f27
	smulcc	%i5,	0x0457,	%l3
	save %g4, 0x15DC, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%i0,	%l2
	fnand	%f28,	%f22,	%f24
	stw	%g6,	[%l7 + 0x68]
	movge	%icc,	%i2,	%o6
	fmovdgu	%xcc,	%f21,	%f13
	std	%f30,	[%l7 + 0x20]
	xorcc	%o1,	%i3,	%o7
	umul	%l0,	%i4,	%o3
	fmovrdgz	%g2,	%f12,	%f28
	array8	%i7,	%l4,	%g7
	udiv	%i1,	0x119F,	%o2
	srl	%o5,	%i6,	%l5
	movleu	%icc,	%g3,	%l1
	std	%f14,	[%l7 + 0x68]
	udivx	%g5,	0x11F8,	%o4
	fmovrdne	%g1,	%f4,	%f2
	fmovsgu	%xcc,	%f5,	%f2
	edge32	%o0,	%l3,	%g4
	movrgz	%l6,	0x0C4,	%i0
	movrlz	%i5,	%l2,	%i2
	movne	%icc,	%g6,	%o1
	siam	0x2
	andncc	%o6,	%i3,	%o7
	ldsb	[%l7 + 0x5F],	%i4
	alignaddrl	%o3,	%g2,	%l0
	mulscc	%l4,	0x0188,	%g7
	movre	%i1,	%o2,	%i7
	orncc	%o5,	0x0D30,	%i6
	fmovdl	%xcc,	%f11,	%f0
	movg	%icc,	%l5,	%l1
	ldsw	[%l7 + 0x7C],	%g3
	fmovdle	%xcc,	%f6,	%f19
	movrne	%o4,	0x375,	%g1
	st	%f2,	[%l7 + 0x6C]
	movne	%xcc,	%o0,	%g5
	edge32n	%l3,	%g4,	%i0
	sir	0x00A1
	and	%i5,	%l6,	%i2
	addccc	%l2,	%o1,	%g6
	subccc	%o6,	%o7,	%i4
	edge8l	%o3,	%i3,	%l0
	mulscc	%g2,	%g7,	%i1
	array32	%l4,	%i7,	%o5
	edge8	%o2,	%l5,	%l1
	xnor	%g3,	0x1326,	%i6
	fnegs	%f11,	%f21
	array8	%o4,	%o0,	%g5
	pdist	%f14,	%f16,	%f2
	fmovdne	%icc,	%f16,	%f3
	edge8ln	%l3,	%g1,	%g4
	subccc	%i5,	0x1840,	%i0
	smulcc	%i2,	0x1D5A,	%l6
	movne	%xcc,	%o1,	%l2
	movvs	%icc,	%g6,	%o7
	smul	%i4,	%o6,	%i3
	ldd	[%l7 + 0x68],	%l0
	stb	%o3,	[%l7 + 0x31]
	mulx	%g7,	%i1,	%g2
	srlx	%i7,	0x0E,	%l4
	array32	%o2,	%o5,	%l5
	movcs	%xcc,	%l1,	%i6
	stb	%o4,	[%l7 + 0x0B]
	movle	%icc,	%g3,	%g5
	ldsh	[%l7 + 0x14],	%l3
	stb	%g1,	[%l7 + 0x2D]
	fnot1	%f28,	%f24
	fnor	%f8,	%f4,	%f0
	movn	%icc,	%g4,	%i5
	fmovdleu	%xcc,	%f20,	%f22
	sth	%i0,	[%l7 + 0x54]
	movrgz	%o0,	0x051,	%l6
	sllx	%i2,	%o1,	%g6
	fmovdvc	%icc,	%f1,	%f5
	ldub	[%l7 + 0x0D],	%l2
	edge16	%i4,	%o7,	%o6
	movle	%xcc,	%i3,	%o3
	nop
	set	0x6E, %l2
	ldsh	[%l7 + %l2],	%g7
	sllx	%i1,	0x0A,	%l0
	orn	%g2,	0x0444,	%l4
	fzeros	%f19
	array32	%o2,	%i7,	%l5
	fmovdcs	%icc,	%f12,	%f1
	movrlz	%l1,	%i6,	%o4
	andn	%g3,	%o5,	%g5
	fone	%f18
	fones	%f19
	fpmerge	%f2,	%f0,	%f22
	ldsh	[%l7 + 0x14],	%g1
	movg	%xcc,	%g4,	%l3
	edge32	%i0,	%i5,	%l6
	array32	%o0,	%i2,	%o1
	lduw	[%l7 + 0x28],	%g6
	edge8	%l2,	%o7,	%i4
	movcs	%icc,	%o6,	%o3
	fpadd32	%f18,	%f8,	%f24
	or	%g7,	0x0BC4,	%i1
	st	%f24,	[%l7 + 0x64]
	movcc	%xcc,	%i3,	%l0
	movl	%icc,	%g2,	%l4
	movleu	%xcc,	%i7,	%l5
	movneg	%icc,	%o2,	%i6
	edge16n	%o4,	%l1,	%g3
	fmovsvs	%icc,	%f5,	%f25
	nop
	set	0x65, %g1
	ldsb	[%l7 + %g1],	%o5
	movcs	%icc,	%g5,	%g4
	nop
	set	0x18, %o0
	std	%f10,	[%l7 + %o0]
	sethi	0x0C44,	%l3
	movpos	%xcc,	%i0,	%i5
	sra	%g1,	%o0,	%l6
	movle	%xcc,	%i2,	%g6
	srax	%o1,	0x14,	%o7
	array8	%l2,	%o6,	%o3
	sethi	0x0CFC,	%g7
	fmovsne	%icc,	%f29,	%f20
	movleu	%icc,	%i4,	%i1
	srl	%l0,	%i3,	%g2
	fand	%f14,	%f2,	%f2
	edge16	%i7,	%l4,	%o2
	fmuld8sux16	%f30,	%f3,	%f26
	fmovdcc	%xcc,	%f9,	%f30
	lduw	[%l7 + 0x7C],	%i6
	nop
	set	0x08, %g4
	stx	%o4,	[%l7 + %g4]
	fmovd	%f10,	%f4
	fmovdcs	%icc,	%f12,	%f5
	ldsb	[%l7 + 0x77],	%l5
	edge8l	%l1,	%g3,	%g5
	andn	%g4,	0x1709,	%o5
	addc	%i0,	0x0AAA,	%i5
	sll	%l3,	%o0,	%l6
	lduh	[%l7 + 0x4E],	%i2
	edge32l	%g1,	%g6,	%o1
	umulcc	%o7,	0x1240,	%l2
	save %o6, 0x11B3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f2,	%f28
	edge16ln	%i4,	%i1,	%o3
	stw	%i3,	[%l7 + 0x1C]
	fmovrsgz	%g2,	%f8,	%f15
	save %i7, %l4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i6,	%l0
	edge16l	%o4,	%l1,	%l5
	addcc	%g3,	%g4,	%g5
	ldx	[%l7 + 0x60],	%o5
	sdiv	%i5,	0x1922,	%i0
	stb	%l3,	[%l7 + 0x4E]
	sdivx	%l6,	0x1AF4,	%o0
	fmuld8ulx16	%f21,	%f9,	%f24
	edge32ln	%g1,	%g6,	%o1
	movleu	%xcc,	%i2,	%o7
	movn	%xcc,	%l2,	%g7
	fnands	%f28,	%f1,	%f0
	array32	%i4,	%o6,	%o3
	and	%i3,	%g2,	%i1
	fpmerge	%f23,	%f25,	%f22
	fabsd	%f16,	%f14
	or	%l4,	0x1956,	%o2
	fnands	%f0,	%f27,	%f18
	srlx	%i7,	0x1D,	%l0
	fcmped	%fcc1,	%f24,	%f20
	sdivx	%o4,	0x1D1E,	%l1
	edge32	%l5,	%i6,	%g4
	srl	%g5,	%o5,	%i5
	sra	%g3,	0x0B,	%l3
	sdivx	%l6,	0x1B7D,	%o0
	fxor	%f28,	%f30,	%f6
	save %g1, 0x171D, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f24,	%f24,	%f6
	movrlez	%o1,	0x166,	%i2
	fandnot2	%f14,	%f30,	%f14
	movvs	%xcc,	%i0,	%o7
	alignaddrl	%g7,	%i4,	%l2
	fmovsvs	%xcc,	%f29,	%f6
	andcc	%o3,	0x1CEF,	%i3
	fones	%f26
	umulcc	%o6,	0x11F8,	%i1
	sir	0x1CAB
	addcc	%g2,	0x1DFC,	%o2
	movn	%icc,	%l4,	%l0
	fmovrde	%o4,	%f24,	%f16
	orn	%l1,	%i7,	%l5
	orncc	%g4,	0x1697,	%g5
	alignaddrl	%o5,	%i5,	%g3
	edge16n	%i6,	%l3,	%l6
	srl	%o0,	0x0B,	%g1
	addccc	%g6,	%i2,	%i0
	movrlz	%o1,	0x02D,	%o7
	edge16l	%i4,	%g7,	%o3
	udivx	%i3,	0x141E,	%o6
	ldsh	[%l7 + 0x22],	%i1
	ld	[%l7 + 0x28],	%f9
	sllx	%g2,	0x0A,	%l2
	siam	0x0
	edge32n	%o2,	%l4,	%o4
	xnorcc	%l0,	0x1696,	%i7
	ldsh	[%l7 + 0x48],	%l1
	fcmps	%fcc1,	%f9,	%f20
	edge32l	%l5,	%g5,	%g4
	sdivx	%i5,	0x1996,	%g3
	alignaddr	%i6,	%l3,	%l6
	srl	%o5,	0x0F,	%o0
	or	%g6,	0x02CF,	%g1
	fmovsneg	%icc,	%f22,	%f16
	ldub	[%l7 + 0x39],	%i0
	fpadd32	%f24,	%f22,	%f12
	sth	%i2,	[%l7 + 0x2C]
	sir	0x0FDC
	or	%o7,	%i4,	%o1
	movrlez	%g7,	%i3,	%o3
	mulscc	%i1,	0x070B,	%g2
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	st	%f19,	[%l7 + 0x74]
	sra	%l4,	%l0,	%o4
	umulcc	%i7,	0x18E1,	%l5
	movle	%xcc,	%g5,	%g4
	edge32ln	%l1,	%i5,	%g3
	movrlez	%l3,	0x3D2,	%l6
	movvc	%xcc,	%i6,	%o0
	sth	%o5,	[%l7 + 0x3A]
	udiv	%g6,	0x10CB,	%i0
	fmovrsne	%g1,	%f6,	%f14
	sdivcc	%i2,	0x0F87,	%o7
	movn	%xcc,	%i4,	%g7
	fornot1s	%f0,	%f10,	%f22
	orcc	%i3,	0x0BE8,	%o3
	movge	%xcc,	%i1,	%g2
	movrlez	%l2,	0x001,	%o6
	movl	%icc,	%o2,	%l4
	array32	%l0,	%o4,	%i7
	sub	%o1,	0x1C01,	%g5
	fmovd	%f12,	%f2
	sir	0x18A3
	udivx	%l5,	0x0A48,	%l1
	fmovrdgz	%i5,	%f18,	%f18
	fnands	%f7,	%f22,	%f19
	movn	%xcc,	%g3,	%l3
	movneg	%xcc,	%l6,	%g4
	smul	%o0,	%i6,	%g6
	xnorcc	%i0,	0x156A,	%g1
	movg	%icc,	%o5,	%o7
	fmovsge	%xcc,	%f4,	%f0
	fcmpeq32	%f2,	%f30,	%i4
	movle	%xcc,	%g7,	%i3
	edge8ln	%i2,	%o3,	%g2
	movleu	%icc,	%l2,	%i1
	sir	0x01CD
	srax	%o6,	%o2,	%l4
	movrgz	%l0,	%o4,	%i7
	addc	%g5,	0x0962,	%o1
	edge8n	%l1,	%i5,	%g3
	andncc	%l5,	%l6,	%l3
	fandnot1	%f8,	%f4,	%f16
	lduh	[%l7 + 0x6C],	%o0
	fmovrslez	%g4,	%f21,	%f23
	edge32ln	%g6,	%i0,	%i6
	addc	%o5,	0x158E,	%o7
	edge16l	%g1,	%g7,	%i4
	fornot2	%f4,	%f14,	%f24
	xnor	%i3,	0x1A87,	%i2
	save %g2, %o3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabsd	%f0,	%f0
	or	%l2,	0x116E,	%o6
	fmovspos	%xcc,	%f17,	%f2
	sdivcc	%o2,	0x17E3,	%l4
	edge8n	%l0,	%o4,	%g5
	or	%o1,	%i7,	%l1
	movre	%i5,	%l5,	%g3
	movne	%xcc,	%l3,	%l6
	andcc	%o0,	%g4,	%i0
	sdiv	%g6,	0x1718,	%i6
	srlx	%o7,	0x1E,	%g1
	move	%icc,	%o5,	%i4
	siam	0x0
	fmovdl	%xcc,	%f20,	%f7
	fmovse	%xcc,	%f27,	%f6
	ldsh	[%l7 + 0x58],	%g7
	ldx	[%l7 + 0x20],	%i2
	sub	%g2,	0x1A44,	%i3
	xor	%o3,	%i1,	%l2
	ldsb	[%l7 + 0x10],	%o2
	fnot1s	%f3,	%f26
	ldx	[%l7 + 0x40],	%o6
	orcc	%l4,	0x1115,	%l0
	restore %g5, 0x0CE9, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%i7,	%o4,	%l1
	ldd	[%l7 + 0x68],	%l4
	fands	%f9,	%f28,	%f29
	srax	%i5,	%l3,	%l6
	fmovdvc	%xcc,	%f16,	%f27
	array16	%g3,	%g4,	%i0
	stx	%o0,	[%l7 + 0x28]
	fmovspos	%icc,	%f12,	%f2
	alignaddrl	%i6,	%g6,	%g1
	addc	%o5,	%i4,	%o7
	addccc	%i2,	0x0F7E,	%g7
	fmuld8ulx16	%f4,	%f14,	%f16
	add	%g2,	%i3,	%o3
	ldsb	[%l7 + 0x3F],	%l2
	xor	%o2,	0x01BE,	%o6
	sethi	0x1032,	%i1
	orn	%l0,	0x0575,	%l4
	mulscc	%o1,	%i7,	%g5
	sir	0x064D
	sdivx	%o4,	0x0D67,	%l1
	stx	%l5,	[%l7 + 0x78]
	movrlz	%i5,	0x0CD,	%l3
	edge16	%l6,	%g3,	%g4
	orcc	%i0,	0x09EA,	%o0
	andcc	%g6,	0x08EA,	%i6
	stx	%g1,	[%l7 + 0x10]
	and	%i4,	%o5,	%i2
	mulscc	%o7,	%g7,	%i3
	ldd	[%l7 + 0x10],	%o2
	sth	%l2,	[%l7 + 0x72]
	ldsh	[%l7 + 0x2E],	%g2
	sdivcc	%o2,	0x0F54,	%i1
	subc	%l0,	%l4,	%o1
	movleu	%xcc,	%o6,	%g5
	fmovdleu	%icc,	%f2,	%f30
	fornot1	%f22,	%f2,	%f20
	fcmpd	%fcc3,	%f24,	%f28
	sethi	0x18FA,	%o4
	fmovsneg	%icc,	%f22,	%f12
	and	%l1,	0x037E,	%l5
	edge16ln	%i5,	%i7,	%l6
	movcc	%icc,	%g3,	%l3
	fornot2	%f4,	%f0,	%f10
	faligndata	%f10,	%f14,	%f14
	orncc	%i0,	0x1DA9,	%o0
	umulcc	%g4,	%i6,	%g6
	sllx	%i4,	%g1,	%i2
	sdivcc	%o7,	0x05DC,	%g7
	ld	[%l7 + 0x08],	%f4
	udivx	%o5,	0x1F11,	%i3
	edge16l	%l2,	%o3,	%g2
	ldd	[%l7 + 0x50],	%o2
	movcc	%xcc,	%i1,	%l4
	andcc	%l0,	%o1,	%o6
	fmul8sux16	%f20,	%f22,	%f28
	fcmped	%fcc0,	%f10,	%f10
	fcmpes	%fcc2,	%f2,	%f13
	andn	%g5,	0x07BA,	%o4
	movpos	%xcc,	%l5,	%l1
	fabss	%f30,	%f8
	movrgez	%i7,	%i5,	%g3
	save %l3, %l6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i0,	%i6
	fmovscs	%xcc,	%f21,	%f3
	stw	%g4,	[%l7 + 0x34]
	movvc	%icc,	%i4,	%g6
	movrlez	%i2,	%o7,	%g7
	fcmpes	%fcc2,	%f29,	%f12
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	movle	%xcc,	%l2,	%o3
	fmovdpos	%xcc,	%f13,	%f11
	fmovde	%xcc,	%f22,	%f30
	ldx	[%l7 + 0x60],	%g2
	sub	%i1,	%l4,	%l0
	edge32ln	%o1,	%o2,	%g5
	xnorcc	%o6,	0x1B00,	%l5
	udivx	%o4,	0x069B,	%i7
	sub	%l1,	%g3,	%l3
	ldd	[%l7 + 0x20],	%i4
	movvc	%xcc,	%l6,	%o0
	ldsh	[%l7 + 0x48],	%i6
	edge16l	%i0,	%i4,	%g6
	fnand	%f0,	%f22,	%f10
	fmuld8ulx16	%f23,	%f28,	%f8
	sll	%i2,	0x0B,	%g4
	fmovda	%xcc,	%f16,	%f14
	fmovrdlez	%g7,	%f30,	%f18
	xorcc	%o7,	0x09C0,	%o5
	edge16n	%i3,	%g1,	%o3
	ldx	[%l7 + 0x38],	%l2
	sdivcc	%g2,	0x1E8A,	%l4
	movrlz	%l0,	%i1,	%o2
	fnot2	%f16,	%f26
	edge32l	%o1,	%g5,	%o6
	sdiv	%l5,	0x1BA0,	%o4
	st	%f19,	[%l7 + 0x7C]
	edge32l	%i7,	%l1,	%l3
	sdiv	%g3,	0x0F93,	%i5
	subcc	%o0,	%i6,	%l6
	movpos	%icc,	%i0,	%g6
	edge32n	%i4,	%g4,	%g7
	lduw	[%l7 + 0x24],	%i2
	popc	0x0163,	%o5
	stx	%i3,	[%l7 + 0x30]
	fmovdvs	%icc,	%f26,	%f25
	or	%o7,	0x10C1,	%o3
	alignaddrl	%g1,	%l2,	%g2
	lduw	[%l7 + 0x3C],	%l0
	ldx	[%l7 + 0x70],	%l4
	array16	%o2,	%i1,	%g5
	srlx	%o1,	%l5,	%o6
	addc	%i7,	0x0719,	%l1
	edge32	%o4,	%l3,	%g3
	umulcc	%o0,	%i5,	%l6
	smul	%i6,	0x19BD,	%i0
	fpack32	%f22,	%f22,	%f24
	xorcc	%i4,	%g4,	%g7
	movn	%xcc,	%g6,	%o5
	edge8l	%i2,	%i3,	%o3
	fmovrslez	%g1,	%f10,	%f29
	addccc	%l2,	0x02EE,	%o7
	fmovdcs	%icc,	%f1,	%f24
	fmovsne	%xcc,	%f30,	%f15
	or	%g2,	%l4,	%l0
	udivcc	%o2,	0x1862,	%g5
	movrne	%o1,	%l5,	%o6
	edge8n	%i7,	%i1,	%l1
	movrgez	%l3,	%g3,	%o4
	movre	%i5,	%l6,	%i6
	fnegs	%f21,	%f12
	nop
	set	0x78, %o2
	stx	%i0,	[%l7 + %o2]
	edge32l	%i4,	%g4,	%g7
	ld	[%l7 + 0x54],	%f18
	sllx	%o0,	0x17,	%o5
	xnor	%g6,	0x041F,	%i3
	udiv	%i2,	0x0278,	%o3
	udivcc	%g1,	0x1A30,	%o7
	smul	%g2,	0x1F62,	%l4
	ldsb	[%l7 + 0x1C],	%l2
	st	%f14,	[%l7 + 0x38]
	fmovsl	%icc,	%f10,	%f20
	fcmped	%fcc2,	%f24,	%f4
	ldd	[%l7 + 0x20],	%f2
	fnot2	%f26,	%f30
	fpadd32s	%f25,	%f19,	%f1
	sllx	%o2,	0x1E,	%l0
	fmovsa	%icc,	%f7,	%f19
	fmovspos	%xcc,	%f22,	%f8
	xnor	%g5,	0x0CC4,	%l5
	subcc	%o6,	0x19F7,	%o1
	edge16n	%i7,	%l1,	%i1
	umul	%g3,	%l3,	%i5
	movl	%icc,	%l6,	%o4
	fmul8ulx16	%f12,	%f4,	%f18
	edge8	%i0,	%i4,	%i6
	ld	[%l7 + 0x54],	%f20
	movre	%g7,	%g4,	%o5
	orn	%o0,	%g6,	%i2
	edge16	%i3,	%g1,	%o7
	movn	%icc,	%o3,	%l4
	edge32l	%g2,	%o2,	%l2
	and	%g5,	%l0,	%l5
	movgu	%icc,	%o1,	%i7
	ldd	[%l7 + 0x48],	%l0
	fmovscc	%xcc,	%f21,	%f5
	udiv	%i1,	0x116C,	%o6
	fandnot2s	%f23,	%f16,	%f10
	ldsw	[%l7 + 0x58],	%l3
	stb	%g3,	[%l7 + 0x42]
	movn	%icc,	%i5,	%o4
	fmovsa	%icc,	%f6,	%f31
	restore %i0, 0x04F2, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%i6,	%g7,	%g4
	or	%o5,	%l6,	%o0
	movle	%xcc,	%i2,	%i3
	fandnot2s	%f11,	%f11,	%f26
	sllx	%g6,	%o7,	%g1
	orn	%o3,	0x197B,	%l4
	fmovd	%f22,	%f8
	movcc	%icc,	%g2,	%o2
	movn	%xcc,	%l2,	%g5
	fnot2	%f20,	%f12
	mulscc	%l5,	%o1,	%l0
	sra	%i7,	%l1,	%o6
	lduw	[%l7 + 0x34],	%i1
	orn	%g3,	0x1A65,	%i5
	array32	%l3,	%o4,	%i4
	xorcc	%i0,	%i6,	%g4
	movg	%icc,	%o5,	%l6
	edge8l	%g7,	%o0,	%i3
	fcmpgt32	%f30,	%f22,	%g6
	edge32	%o7,	%g1,	%i2
	edge16ln	%l4,	%o3,	%o2
	xnor	%g2,	0x04AF,	%l2
	movrgz	%g5,	%l5,	%o1
	movle	%xcc,	%i7,	%l1
	array16	%l0,	%o6,	%g3
	fmovrde	%i1,	%f14,	%f12
	fmovsge	%icc,	%f28,	%f14
	andn	%l3,	%i5,	%i4
	movvs	%xcc,	%o4,	%i0
	edge8l	%g4,	%o5,	%l6
	popc	%g7,	%o0
	fnegs	%f24,	%f12
	edge16n	%i3,	%g6,	%o7
	std	%f22,	[%l7 + 0x10]
	or	%i6,	0x1E6A,	%i2
	udiv	%l4,	0x083C,	%g1
	ldd	[%l7 + 0x08],	%f16
	fpack16	%f20,	%f21
	stx	%o3,	[%l7 + 0x30]
	alignaddr	%g2,	%l2,	%o2
	edge16ln	%l5,	%o1,	%i7
	edge16ln	%g5,	%l1,	%o6
	sdiv	%g3,	0x120D,	%l0
	ldsh	[%l7 + 0x60],	%l3
	fpmerge	%f26,	%f25,	%f16
	andn	%i5,	0x07F0,	%i1
	srlx	%o4,	0x03,	%i4
	movre	%g4,	0x2AE,	%o5
	mulx	%l6,	%g7,	%o0
	addcc	%i0,	%i3,	%o7
	edge8l	%g6,	%i2,	%l4
	movle	%icc,	%g1,	%o3
	movleu	%xcc,	%i6,	%g2
	movcc	%xcc,	%l2,	%o2
	movrgez	%o1,	0x25F,	%l5
	udiv	%i7,	0x02D6,	%g5
	faligndata	%f0,	%f2,	%f22
	mulx	%l1,	0x033A,	%g3
	xorcc	%l0,	%o6,	%l3
	ldd	[%l7 + 0x08],	%i4
	subc	%o4,	%i1,	%g4
	fmovspos	%xcc,	%f13,	%f31
	smul	%o5,	0x0702,	%l6
	array32	%g7,	%i4,	%i0
	smulcc	%i3,	%o7,	%o0
	ldd	[%l7 + 0x30],	%g6
	udivcc	%l4,	0x1C41,	%i2
	fmovsn	%icc,	%f27,	%f31
	movrne	%g1,	%i6,	%o3
	mulscc	%g2,	0x153A,	%l2
	sra	%o1,	%l5,	%o2
	movcs	%icc,	%g5,	%i7
	siam	0x7
	sra	%g3,	%l0,	%o6
	fmul8ulx16	%f10,	%f2,	%f14
	smul	%l3,	%i5,	%o4
	nop
	set	0x18, %o6
	ldd	[%l7 + %o6],	%f18
	ldx	[%l7 + 0x08],	%l1
	fmovs	%f29,	%f18
	umulcc	%i1,	%g4,	%o5
	stw	%l6,	[%l7 + 0x7C]
	xnor	%g7,	0x16BA,	%i0
	fsrc2s	%f6,	%f17
	addccc	%i3,	%i4,	%o0
	umul	%g6,	0x0C7F,	%l4
	movrlez	%o7,	0x1D3,	%g1
	sub	%i6,	0x0CFC,	%o3
	fmovdcc	%icc,	%f26,	%f25
	mulscc	%i2,	0x19DE,	%l2
	fsrc2s	%f30,	%f16
	sub	%o1,	0x1E91,	%l5
	xnor	%g2,	%o2,	%i7
	movne	%icc,	%g5,	%g3
	std	%f20,	[%l7 + 0x08]
	fpsub32s	%f12,	%f24,	%f7
	sth	%o6,	[%l7 + 0x60]
	add	%l3,	0x0822,	%l0
	udivx	%o4,	0x1EF9,	%l1
	movre	%i1,	%i5,	%g4
	array32	%o5,	%l6,	%i0
	movrgez	%i3,	0x014,	%i4
	srlx	%o0,	0x19,	%g7
	fornot1	%f26,	%f14,	%f6
	array32	%l4,	%g6,	%o7
	subc	%g1,	%o3,	%i6
	fors	%f14,	%f24,	%f9
	andncc	%i2,	%o1,	%l2
	srlx	%g2,	0x09,	%l5
	fone	%f6
	mulscc	%i7,	%o2,	%g3
	fmovrde	%o6,	%f20,	%f2
	sra	%l3,	%l0,	%g5
	fmovdcs	%xcc,	%f30,	%f23
	sdivx	%o4,	0x0090,	%l1
	sethi	0x0EB7,	%i1
	udivx	%i5,	0x1B90,	%o5
	fsrc1s	%f5,	%f3
	xor	%g4,	%i0,	%l6
	xnorcc	%i4,	%i3,	%g7
	array16	%o0,	%g6,	%l4
	std	%f20,	[%l7 + 0x10]
	stw	%g1,	[%l7 + 0x78]
	array32	%o7,	%i6,	%i2
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	fmul8sux16	%f18,	%f28,	%f2
	array8	%g2,	%i7,	%l5
	lduw	[%l7 + 0x0C],	%g3
	edge32	%o6,	%l3,	%o2
	xnor	%g5,	%o4,	%l0
	movrlez	%l1,	0x3BF,	%i5
	ldsb	[%l7 + 0x68],	%o5
	xnorcc	%g4,	%i1,	%i0
	movleu	%icc,	%i4,	%i3
	xor	%l6,	0x1A06,	%o0
	st	%f30,	[%l7 + 0x20]
	save %g6, %g7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f22
	lduw	[%l7 + 0x1C],	%o7
	fmuld8sux16	%f9,	%f20,	%f28
	faligndata	%f12,	%f30,	%f30
	edge8ln	%g1,	%i6,	%o3
	udivcc	%i2,	0x1F8D,	%o1
	fsrc2	%f22,	%f18
	movle	%xcc,	%g2,	%i7
	subc	%l5,	0x06CE,	%l2
	ldsw	[%l7 + 0x3C],	%g3
	fornot2s	%f31,	%f18,	%f3
	sub	%o6,	0x03E5,	%l3
	fxor	%f18,	%f24,	%f18
	movcs	%icc,	%g5,	%o4
	xor	%o2,	0x03E2,	%l0
	edge16ln	%l1,	%i5,	%g4
	srax	%i1,	%o5,	%i0
	fpadd16	%f4,	%f2,	%f22
	save %i3, %i4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o0,	0x1E0A,	%g6
	edge16n	%g7,	%l4,	%g1
	movcs	%icc,	%o7,	%o3
	edge8	%i2,	%o1,	%g2
	ld	[%l7 + 0x10],	%f23
	mova	%icc,	%i7,	%l5
	movleu	%xcc,	%i6,	%g3
	udiv	%o6,	0x0AD9,	%l2
	fcmped	%fcc2,	%f16,	%f28
	fmovsgu	%xcc,	%f27,	%f19
	fmovdvs	%icc,	%f16,	%f23
	ldd	[%l7 + 0x58],	%g4
	stx	%l3,	[%l7 + 0x70]
	movrlz	%o4,	0x06E,	%o2
	udivx	%l1,	0x02E0,	%l0
	fmovrslez	%g4,	%f11,	%f17
	movneg	%icc,	%i1,	%o5
	fxnor	%f14,	%f14,	%f22
	lduw	[%l7 + 0x24],	%i0
	fpsub16	%f22,	%f8,	%f20
	movcc	%xcc,	%i5,	%i4
	fcmpeq16	%f24,	%f20,	%i3
	edge8n	%l6,	%g6,	%g7
	edge16ln	%o0,	%g1,	%l4
	ldsh	[%l7 + 0x56],	%o7
	fsrc1	%f28,	%f26
	movrgz	%o3,	0x277,	%i2
	faligndata	%f0,	%f2,	%f20
	movrgz	%o1,	0x312,	%g2
	movvs	%icc,	%l5,	%i7
	fxnors	%f28,	%f23,	%f29
	alignaddr	%g3,	%i6,	%l2
	umul	%o6,	0x15C2,	%g5
	popc	0x06C1,	%l3
	fpsub32	%f14,	%f26,	%f2
	ldx	[%l7 + 0x10],	%o4
	sir	0x115B
	fnot2s	%f27,	%f26
	mulx	%l1,	%o2,	%l0
	lduh	[%l7 + 0x2A],	%g4
	fmul8x16au	%f4,	%f17,	%f4
	movl	%icc,	%i1,	%i0
	andn	%o5,	0x15DE,	%i4
	ldsh	[%l7 + 0x16],	%i5
	xnorcc	%l6,	0x117A,	%g6
	mulx	%i3,	0x0003,	%g7
	sra	%g1,	0x1A,	%l4
	addc	%o0,	%o3,	%i2
	fabsd	%f18,	%f2
	sllx	%o7,	0x1D,	%g2
	edge32ln	%o1,	%l5,	%g3
	sra	%i7,	%i6,	%o6
	fcmpes	%fcc2,	%f8,	%f29
	movvc	%icc,	%l2,	%g5
	movg	%icc,	%l3,	%o4
	movvc	%icc,	%o2,	%l0
	andcc	%l1,	0x1120,	%g4
	edge16n	%i1,	%i0,	%o5
	movneg	%xcc,	%i5,	%l6
	ldd	[%l7 + 0x60],	%i4
	movrlz	%i3,	%g7,	%g6
	udivcc	%l4,	0x1AED,	%o0
	movle	%icc,	%o3,	%g1
	or	%o7,	%i2,	%o1
	orncc	%l5,	%g2,	%i7
	std	%f26,	[%l7 + 0x48]
	sethi	0x0669,	%g3
	fandnot1	%f6,	%f10,	%f18
	addcc	%o6,	%l2,	%g5
	edge8l	%i6,	%o4,	%l3
	umul	%l0,	0x076F,	%o2
	fmovrsgz	%l1,	%f15,	%f23
	movrgz	%g4,	0x24C,	%i1
	movneg	%icc,	%i0,	%o5
	stb	%l6,	[%l7 + 0x45]
	fpsub16s	%f5,	%f27,	%f31
	addcc	%i5,	0x0189,	%i3
	smulcc	%i4,	%g6,	%g7
	edge8l	%o0,	%l4,	%g1
	fmuld8sux16	%f21,	%f29,	%f22
	array8	%o3,	%i2,	%o7
	fpack32	%f6,	%f26,	%f6
	array16	%l5,	%g2,	%i7
	sethi	0x0123,	%g3
	nop
	set	0x40, %l1
	std	%f20,	[%l7 + %l1]
	edge8	%o6,	%o1,	%l2
	fmul8ulx16	%f24,	%f24,	%f4
	fcmpgt32	%f20,	%f2,	%i6
	ldub	[%l7 + 0x3A],	%g5
	mulx	%l3,	%l0,	%o2
	st	%f29,	[%l7 + 0x58]
	movcc	%xcc,	%l1,	%g4
	mulx	%i1,	0x11B2,	%o4
	smul	%i0,	%l6,	%i5
	movrlz	%o5,	0x1E0,	%i3
	fmovdpos	%icc,	%f25,	%f8
	faligndata	%f16,	%f16,	%f22
	mulx	%g6,	0x07D9,	%i4
	edge16ln	%g7,	%o0,	%l4
	xorcc	%o3,	%g1,	%o7
	movrgez	%l5,	0x1F1,	%g2
	movg	%xcc,	%i2,	%g3
	fmovsl	%icc,	%f22,	%f21
	orn	%i7,	0x082C,	%o6
	movcs	%xcc,	%o1,	%l2
	fmovdl	%xcc,	%f12,	%f21
	edge16	%i6,	%g5,	%l0
	alignaddrl	%l3,	%o2,	%g4
	smul	%l1,	0x1DA4,	%i1
	srax	%i0,	0x14,	%o4
	movgu	%icc,	%i5,	%l6
	andncc	%i3,	%o5,	%i4
	srl	%g6,	%g7,	%l4
	andn	%o0,	%o3,	%g1
	movleu	%icc,	%l5,	%g2
	movle	%xcc,	%o7,	%i2
	fxnor	%f20,	%f20,	%f12
	umul	%g3,	%o6,	%o1
	ld	[%l7 + 0x58],	%f12
	edge32ln	%i7,	%i6,	%l2
	fornot1s	%f2,	%f18,	%f15
	xnorcc	%g5,	%l3,	%o2
	srlx	%g4,	0x17,	%l0
	fmovsn	%icc,	%f11,	%f7
	edge32ln	%l1,	%i0,	%o4
	fcmple32	%f14,	%f24,	%i5
	sllx	%i1,	0x00,	%l6
	sdivx	%o5,	0x04D4,	%i3
	movne	%xcc,	%g6,	%i4
	movre	%g7,	%o0,	%l4
	movle	%xcc,	%o3,	%l5
	alignaddrl	%g2,	%g1,	%i2
	fmuld8sux16	%f18,	%f12,	%f24
	fnors	%f3,	%f19,	%f15
	movrgz	%g3,	%o6,	%o7
	xnorcc	%i7,	%i6,	%l2
	alignaddr	%o1,	%g5,	%l3
	lduh	[%l7 + 0x50],	%g4
	movg	%xcc,	%o2,	%l1
	fnot2s	%f0,	%f26
	movl	%icc,	%i0,	%o4
	edge32	%i5,	%l0,	%i1
	lduh	[%l7 + 0x4C],	%l6
	ldsw	[%l7 + 0x38],	%i3
	smul	%g6,	0x1743,	%i4
	edge32l	%o5,	%g7,	%l4
	andn	%o3,	0x1963,	%o0
	movleu	%icc,	%g2,	%g1
	std	%f10,	[%l7 + 0x10]
	subcc	%i2,	%l5,	%o6
	andncc	%g3,	%i7,	%o7
	fmul8ulx16	%f22,	%f0,	%f30
	sdiv	%l2,	0x1B0F,	%i6
	xor	%g5,	%l3,	%o1
	movleu	%icc,	%g4,	%l1
	movrgez	%o2,	%i0,	%i5
	edge16	%o4,	%i1,	%l6
	edge8ln	%i3,	%l0,	%i4
	or	%g6,	0x1A93,	%o5
	movne	%icc,	%g7,	%o3
	sdivx	%o0,	0x1FA4,	%g2
	andcc	%g1,	0x0F54,	%l4
	edge8	%l5,	%o6,	%g3
	fnands	%f20,	%f1,	%f17
	edge16n	%i7,	%o7,	%l2
	lduh	[%l7 + 0x3A],	%i2
	movcs	%icc,	%i6,	%l3
	xorcc	%o1,	%g4,	%l1
	edge32ln	%o2,	%g5,	%i0
	movrlez	%o4,	0x1EF,	%i1
	popc	0x02A5,	%l6
	fcmpeq16	%f8,	%f20,	%i5
	xor	%i3,	%l0,	%i4
	edge16	%o5,	%g7,	%o3
	smulcc	%o0,	0x1EA5,	%g6
	umul	%g2,	0x12FD,	%l4
	sra	%l5,	%g1,	%g3
	movcs	%xcc,	%o6,	%i7
	srax	%o7,	%i2,	%l2
	fpadd32	%f12,	%f20,	%f8
	fmovrslz	%l3,	%f26,	%f6
	fexpand	%f27,	%f0
	sth	%o1,	[%l7 + 0x6E]
	array32	%i6,	%g4,	%o2
	orncc	%g5,	0x0AD5,	%i0
	fxnors	%f8,	%f0,	%f30
	nop
	set	0x60, %l5
	stx	%l1,	[%l7 + %l5]
	fcmpne16	%f4,	%f12,	%o4
	srlx	%l6,	%i1,	%i3
	add	%i5,	%i4,	%l0
	fmovrslez	%o5,	%f29,	%f16
	mulx	%o3,	%o0,	%g7
	fmul8ulx16	%f4,	%f26,	%f16
	umulcc	%g2,	0x1646,	%g6
	sdivcc	%l4,	0x14E9,	%g1
	std	%f30,	[%l7 + 0x28]
	movvs	%xcc,	%g3,	%l5
	fmovdgu	%icc,	%f0,	%f2
	sir	0x16A2
	movne	%icc,	%i7,	%o7
	ldsh	[%l7 + 0x5E],	%i2
	fcmpgt16	%f10,	%f22,	%o6
	popc	0x029C,	%l2
	ldsh	[%l7 + 0x64],	%l3
	movvs	%xcc,	%o1,	%g4
	restore %o2, 0x09FC, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x08],	%i0
	subc	%l1,	%g5,	%o4
	sub	%i1,	0x0C2F,	%i3
	sdivcc	%i5,	0x0356,	%l6
	subcc	%l0,	%i4,	%o5
	fmovscc	%xcc,	%f2,	%f10
	ldsb	[%l7 + 0x50],	%o3
	xor	%g7,	%o0,	%g2
	movneg	%icc,	%l4,	%g1
	stw	%g6,	[%l7 + 0x24]
	edge8n	%l5,	%g3,	%o7
	fmovrsgz	%i2,	%f19,	%f4
	fcmps	%fcc3,	%f16,	%f30
	xnor	%o6,	%i7,	%l2
	move	%xcc,	%l3,	%g4
	mulx	%o1,	0x06F6,	%o2
	ldx	[%l7 + 0x20],	%i0
	umul	%i6,	0x086B,	%l1
	fornot1	%f4,	%f4,	%f18
	nop
	set	0x58, %o4
	ldsh	[%l7 + %o4],	%o4
	ldx	[%l7 + 0x78],	%g5
	movrlez	%i1,	0x1DE,	%i3
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	lduw	[%l7 + 0x48],	%o5
	stb	%l0,	[%l7 + 0x79]
	array8	%g7,	%o0,	%o3
	movvc	%icc,	%g2,	%l4
	lduh	[%l7 + 0x64],	%g6
	ldub	[%l7 + 0x1B],	%g1
	subccc	%l5,	%o7,	%i2
	edge8l	%o6,	%g3,	%i7
	alignaddrl	%l3,	%l2,	%g4
	fcmpgt16	%f30,	%f12,	%o2
	movge	%xcc,	%i0,	%i6
	srl	%o1,	0x18,	%o4
	fornot1	%f26,	%f2,	%f20
	edge16n	%l1,	%g5,	%i1
	sllx	%i5,	%l6,	%i4
	save %o5, 0x16F7, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f1,	%f28
	orncc	%g7,	%o0,	%o3
	ldsh	[%l7 + 0x52],	%g2
	umul	%l4,	0x07D8,	%g6
	movneg	%icc,	%l0,	%g1
	array32	%o7,	%i2,	%o6
	stb	%g3,	[%l7 + 0x14]
	fsrc2s	%f7,	%f19
	sth	%l5,	[%l7 + 0x6A]
	movpos	%icc,	%i7,	%l2
	sll	%g4,	%l3,	%i0
	movneg	%xcc,	%o2,	%i6
	edge16	%o1,	%o4,	%g5
	movne	%xcc,	%i1,	%l1
	udivx	%l6,	0x0780,	%i4
	xnorcc	%o5,	%i3,	%i5
	movl	%xcc,	%o0,	%g7
	alignaddr	%o3,	%l4,	%g2
	fmovscc	%xcc,	%f0,	%f16
	addc	%l0,	%g6,	%o7
	orcc	%g1,	0x068B,	%o6
	movrgez	%g3,	%i2,	%i7
	fcmped	%fcc3,	%f18,	%f18
	movrgz	%l2,	%g4,	%l5
	sub	%l3,	%o2,	%i6
	ldsw	[%l7 + 0x14],	%o1
	edge16ln	%i0,	%g5,	%o4
	fxnor	%f8,	%f6,	%f8
	udivcc	%i1,	0x166D,	%l1
	andcc	%i4,	0x0C04,	%l6
	sdivx	%i3,	0x1226,	%i5
	add	%o0,	0x1DAA,	%g7
	sth	%o5,	[%l7 + 0x24]
	stb	%o3,	[%l7 + 0x5F]
	subcc	%g2,	0x1B8F,	%l4
	movrgz	%l0,	0x00D,	%o7
	edge8	%g1,	%o6,	%g6
	movrgz	%g3,	%i2,	%l2
	addccc	%i7,	0x104F,	%g4
	edge32l	%l3,	%l5,	%i6
	xnor	%o1,	0x1C4E,	%i0
	movge	%icc,	%o2,	%o4
	movne	%icc,	%g5,	%i1
	restore %l1, 0x1A8E, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i3,	%l6,	%i5
	movpos	%xcc,	%o0,	%g7
	array32	%o5,	%g2,	%o3
	ld	[%l7 + 0x30],	%f20
	movneg	%xcc,	%l4,	%o7
	srax	%l0,	%g1,	%o6
	alignaddr	%g3,	%i2,	%g6
	or	%i7,	0x1F5F,	%l2
	movge	%xcc,	%g4,	%l3
	array8	%i6,	%o1,	%l5
	sdiv	%i0,	0x0DCA,	%o4
	ld	[%l7 + 0x0C],	%f15
	movgu	%icc,	%g5,	%o2
	addccc	%l1,	0x018F,	%i1
	fxor	%f14,	%f16,	%f2
	alignaddr	%i3,	%l6,	%i4
	sethi	0x1A88,	%i5
	sra	%g7,	%o5,	%g2
	fcmpne32	%f22,	%f24,	%o0
	fnor	%f18,	%f18,	%f6
	movneg	%xcc,	%l4,	%o3
	stw	%o7,	[%l7 + 0x58]
	udivcc	%l0,	0x1212,	%o6
	edge32	%g3,	%i2,	%g6
	sir	0x02C3
	subcc	%g1,	0x1635,	%i7
	stx	%g4,	[%l7 + 0x08]
	orn	%l2,	%l3,	%i6
	sdiv	%o1,	0x0E28,	%i0
	fmovdcs	%icc,	%f15,	%f3
	movrlz	%l5,	0x342,	%g5
	orncc	%o2,	%l1,	%o4
	fmovrsne	%i3,	%f1,	%f22
	movrlz	%i1,	%i4,	%l6
	stb	%g7,	[%l7 + 0x5C]
	movgu	%icc,	%o5,	%g2
	umul	%o0,	%i5,	%o3
	smul	%l4,	0x0A34,	%l0
	edge32n	%o7,	%g3,	%i2
	fpadd32	%f22,	%f24,	%f6
	andn	%o6,	%g6,	%g1
	movre	%i7,	%l2,	%g4
	st	%f30,	[%l7 + 0x74]
	add	%l3,	0x0B75,	%o1
	edge16	%i0,	%i6,	%l5
	subccc	%o2,	%l1,	%g5
	and	%o4,	0x1A83,	%i1
	edge8l	%i4,	%i3,	%l6
	fxors	%f12,	%f13,	%f24
	udiv	%o5,	0x1323,	%g2
	udivx	%o0,	0x154A,	%i5
	subc	%g7,	%o3,	%l0
	smul	%l4,	%o7,	%g3
	ld	[%l7 + 0x6C],	%f5
	subccc	%i2,	0x1B0E,	%g6
	fmovrdlez	%o6,	%f26,	%f14
	addccc	%i7,	%l2,	%g1
	sdivcc	%g4,	0x1597,	%o1
	mulx	%l3,	%i0,	%l5
	movgu	%icc,	%i6,	%o2
	edge16n	%g5,	%o4,	%l1
	fmul8sux16	%f28,	%f0,	%f10
	subcc	%i4,	0x145C,	%i3
	xnorcc	%i1,	%l6,	%o5
	or	%g2,	0x0108,	%i5
	fmovrde	%g7,	%f20,	%f14
	fornot2	%f6,	%f16,	%f16
	srlx	%o3,	%o0,	%l4
	umulcc	%l0,	0x1253,	%o7
	sub	%i2,	0x1F78,	%g3
	sdivx	%o6,	0x0721,	%i7
	sdivcc	%g6,	0x1144,	%l2
	save %g4, 0x0D75, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l3,	%o1,	%i0
	save %i6, 0x1A7E, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o2,	%o4
	addc	%g5,	0x1082,	%l1
	movne	%icc,	%i4,	%i3
	fmovrdlz	%i1,	%f30,	%f18
	alignaddr	%l6,	%g2,	%i5
	movrlez	%o5,	%o3,	%o0
	xorcc	%l4,	0x0F9C,	%g7
	orn	%o7,	0x0C35,	%l0
	edge16ln	%i2,	%g3,	%o6
	xorcc	%i7,	0x0387,	%l2
	faligndata	%f18,	%f18,	%f12
	orn	%g4,	0x1CAC,	%g1
	xorcc	%g6,	0x11D6,	%o1
	stb	%l3,	[%l7 + 0x3F]
	sra	%i0,	0x1C,	%l5
	movvc	%icc,	%i6,	%o2
	andcc	%o4,	0x0920,	%l1
	nop
	set	0x28, %o1
	stx	%i4,	[%l7 + %o1]
	sub	%i3,	0x1095,	%g5
	fmuld8ulx16	%f14,	%f26,	%f14
	movleu	%icc,	%i1,	%l6
	ldsb	[%l7 + 0x5A],	%i5
	fmovde	%xcc,	%f10,	%f24
	fnands	%f31,	%f10,	%f19
	edge16ln	%g2,	%o5,	%o3
	lduw	[%l7 + 0x68],	%o0
	fmovdleu	%xcc,	%f19,	%f30
	edge16n	%l4,	%g7,	%o7
	lduh	[%l7 + 0x26],	%l0
	xor	%i2,	%g3,	%i7
	fzeros	%f19
	fmovdne	%xcc,	%f11,	%f15
	movle	%icc,	%l2,	%o6
	edge32l	%g4,	%g1,	%g6
	or	%l3,	0x1D74,	%i0
	movcs	%icc,	%o1,	%i6
	stb	%o2,	[%l7 + 0x3F]
	srl	%o4,	0x1F,	%l1
	ldd	[%l7 + 0x10],	%f12
	umulcc	%l5,	0x0AE0,	%i3
	faligndata	%f24,	%f20,	%f6
	srax	%i4,	%i1,	%l6
	movrlez	%g5,	0x119,	%g2
	ldd	[%l7 + 0x10],	%f24
	movleu	%icc,	%o5,	%o3
	fmovdn	%icc,	%f15,	%f25
	edge16ln	%o0,	%l4,	%g7
	array8	%i5,	%l0,	%i2
	smulcc	%o7,	0x1F03,	%g3
	udivx	%l2,	0x05D2,	%i7
	xnorcc	%g4,	0x0464,	%g1
	ldub	[%l7 + 0x3E],	%g6
	alignaddrl	%o6,	%l3,	%i0
	move	%xcc,	%o1,	%o2
	fands	%f24,	%f27,	%f28
	st	%f1,	[%l7 + 0x28]
	edge8ln	%o4,	%l1,	%l5
	array16	%i6,	%i4,	%i1
	ldub	[%l7 + 0x7C],	%i3
	movrlez	%g5,	%l6,	%g2
	lduh	[%l7 + 0x78],	%o3
	edge8	%o0,	%l4,	%g7
	edge8ln	%o5,	%l0,	%i2
	udivx	%i5,	0x0DBF,	%g3
	nop
	set	0x32, %g5
	ldub	[%l7 + %g5],	%o7
	alignaddrl	%l2,	%i7,	%g4
	edge16n	%g1,	%o6,	%l3
	for	%f28,	%f10,	%f10
	ldub	[%l7 + 0x57],	%g6
	add	%o1,	%o2,	%i0
	addc	%o4,	%l1,	%l5
	stb	%i4,	[%l7 + 0x48]
	nop
	set	0x70, %o3
	ldd	[%l7 + %o3],	%f30
	fmovdvs	%xcc,	%f9,	%f21
	nop
	set	0x50, %i2
	ldd	[%l7 + %i2],	%i6
	fmovrdlez	%i1,	%f18,	%f24
	edge32l	%i3,	%l6,	%g5
	sethi	0x0B1B,	%g2
	stw	%o0,	[%l7 + 0x08]
	andn	%o3,	%g7,	%o5
	udiv	%l4,	0x01B2,	%l0
	and	%i5,	0x0178,	%i2
	edge8	%o7,	%g3,	%i7
	movneg	%icc,	%g4,	%l2
	movrlez	%o6,	0x138,	%g1
	or	%g6,	%l3,	%o1
	umul	%o2,	0x1639,	%o4
	srlx	%l1,	0x07,	%i0
	popc	0x1DFD,	%l5
	subccc	%i6,	0x1FFA,	%i4
	fpadd32s	%f17,	%f10,	%f3
	udivx	%i3,	0x1420,	%l6
	popc	%i1,	%g5
	lduw	[%l7 + 0x24],	%o0
	mova	%xcc,	%o3,	%g2
	sub	%g7,	%o5,	%l0
	subcc	%i5,	%i2,	%o7
	sra	%g3,	%i7,	%l4
	edge32n	%g4,	%o6,	%g1
	alignaddr	%g6,	%l2,	%o1
	edge16ln	%l3,	%o2,	%l1
	stw	%o4,	[%l7 + 0x6C]
	for	%f14,	%f20,	%f24
	srl	%i0,	0x1B,	%l5
	alignaddrl	%i6,	%i4,	%l6
	movrne	%i1,	%i3,	%o0
	sll	%o3,	%g5,	%g7
	smulcc	%o5,	0x04AC,	%g2
	fcmpgt32	%f4,	%f0,	%l0
	srl	%i5,	%i2,	%o7
	fandnot2	%f4,	%f16,	%f2
	xnor	%g3,	0x1976,	%l4
	sra	%g4,	0x0E,	%o6
	edge32n	%g1,	%g6,	%l2
	array16	%o1,	%i7,	%l3
	fpackfix	%f28,	%f21
	xorcc	%o2,	0x1974,	%l1
	movl	%xcc,	%i0,	%o4
	andncc	%l5,	%i4,	%l6
	edge32n	%i1,	%i3,	%o0
	orn	%o3,	%g5,	%g7
	stx	%i6,	[%l7 + 0x58]
	movpos	%xcc,	%o5,	%g2
	ld	[%l7 + 0x0C],	%f19
	movgu	%xcc,	%l0,	%i5
	sra	%i2,	%g3,	%l4
	andncc	%o7,	%g4,	%g1
	movge	%icc,	%o6,	%g6
	fmovsg	%icc,	%f11,	%f28
	nop
	set	0x68, %o7
	ldx	[%l7 + %o7],	%l2
	movvc	%icc,	%o1,	%l3
	for	%f18,	%f30,	%f8
	fmovdneg	%icc,	%f20,	%f26
	movcc	%xcc,	%o2,	%l1
	ldd	[%l7 + 0x58],	%i0
	fmovscs	%icc,	%f31,	%f8
	fmovsl	%icc,	%f29,	%f19
	fpmerge	%f2,	%f2,	%f28
	movl	%xcc,	%i7,	%l5
	andn	%i4,	0x0BA1,	%o4
	stx	%l6,	[%l7 + 0x38]
	edge8l	%i3,	%i1,	%o0
	andcc	%g5,	0x0A55,	%o3
	movg	%icc,	%g7,	%i6
	sll	%g2,	0x0C,	%l0
	edge16ln	%o5,	%i2,	%i5
	fmovdpos	%icc,	%f25,	%f16
	movrgz	%g3,	%o7,	%l4
	nop
	set	0x24, %g2
	lduh	[%l7 + %g2],	%g4
	sethi	0x0D47,	%o6
	subc	%g1,	0x1D64,	%g6
	fpsub16	%f30,	%f24,	%f22
	sdivx	%l2,	0x0D5C,	%o1
	fcmped	%fcc1,	%f6,	%f14
	edge16l	%o2,	%l3,	%l1
	fabsd	%f0,	%f20
	mulscc	%i0,	0x19D8,	%i7
	ldd	[%l7 + 0x60],	%f22
	andcc	%l5,	%o4,	%l6
	ldsb	[%l7 + 0x39],	%i4
	mulx	%i1,	%o0,	%g5
	ldsw	[%l7 + 0x78],	%i3
	movpos	%xcc,	%g7,	%i6
	fands	%f29,	%f2,	%f14
	movrlez	%g2,	0x077,	%o3
	fcmps	%fcc2,	%f13,	%f0
	fpadd32	%f26,	%f10,	%f16
	fabsd	%f12,	%f28
	fcmpne16	%f26,	%f22,	%l0
	srlx	%o5,	%i2,	%i5
	movvc	%icc,	%o7,	%l4
	fmovdneg	%icc,	%f0,	%f7
	move	%icc,	%g3,	%g4
	fmovda	%xcc,	%f20,	%f10
	fmovsgu	%xcc,	%f14,	%f25
	alignaddrl	%g1,	%g6,	%l2
	movcc	%xcc,	%o6,	%o1
	movg	%icc,	%o2,	%l3
	addcc	%i0,	0x0C53,	%i7
	ldd	[%l7 + 0x28],	%l0
	smul	%o4,	0x0D66,	%l6
	movpos	%icc,	%i4,	%i1
	ldub	[%l7 + 0x2A],	%o0
	fandnot1	%f12,	%f6,	%f22
	edge8	%g5,	%l5,	%g7
	save %i3, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i6,	0x1042,	%o5
	udivcc	%l0,	0x1B1C,	%i5
	fcmps	%fcc2,	%f23,	%f11
	andcc	%i2,	%l4,	%g3
	edge16ln	%o7,	%g1,	%g6
	subcc	%g4,	0x1FCB,	%o6
	sll	%l2,	0x19,	%o2
	edge8l	%l3,	%i0,	%o1
	fmovdcs	%xcc,	%f28,	%f17
	orncc	%l1,	0x0BCD,	%o4
	fmovdg	%icc,	%f4,	%f23
	addcc	%i7,	0x1B34,	%l6
	umul	%i4,	0x1DB6,	%i1
	edge8	%g5,	%l5,	%g7
	fcmpne32	%f18,	%f30,	%i3
	mulx	%g2,	%o0,	%o3
	fandnot2	%f14,	%f24,	%f4
	fxnors	%f13,	%f28,	%f24
	nop
	set	0x60, %l4
	stx	%i6,	[%l7 + %l4]
	array16	%o5,	%l0,	%i5
	addc	%l4,	0x1F6D,	%g3
	alignaddrl	%o7,	%g1,	%i2
	ldsh	[%l7 + 0x14],	%g6
	popc	0x1B1A,	%g4
	stb	%l2,	[%l7 + 0x1E]
	sethi	0x0697,	%o6
	movrne	%o2,	%l3,	%o1
	udiv	%l1,	0x0A5E,	%i0
	fmovsleu	%xcc,	%f29,	%f8
	fornot1	%f6,	%f24,	%f18
	fcmpne32	%f10,	%f14,	%o4
	fpsub32s	%f8,	%f22,	%f16
	fmovda	%xcc,	%f3,	%f27
	fxor	%f2,	%f12,	%f8
	udivcc	%i7,	0x0AAB,	%l6
	mulx	%i4,	0x0392,	%g5
	fcmpd	%fcc0,	%f30,	%f0
	movpos	%icc,	%i1,	%l5
	fmovsn	%icc,	%f21,	%f23
	sdivx	%i3,	0x0935,	%g2
	add	%o0,	%g7,	%i6
	movn	%icc,	%o3,	%o5
	sdiv	%l0,	0x1AEC,	%i5
	orncc	%l4,	0x1D8D,	%o7
	subccc	%g3,	%g1,	%g6
	lduh	[%l7 + 0x7E],	%g4
	xnorcc	%i2,	0x16D2,	%l2
	edge32ln	%o2,	%o6,	%l3
	fmovrde	%o1,	%f18,	%f14
	sdiv	%i0,	0x0D0E,	%l1
	edge8	%o4,	%i7,	%l6
	andncc	%i4,	%g5,	%i1
	movge	%icc,	%l5,	%g2
	sth	%o0,	[%l7 + 0x32]
	sth	%g7,	[%l7 + 0x26]
	fpadd16s	%f16,	%f31,	%f27
	alignaddr	%i3,	%i6,	%o5
	orn	%o3,	0x008A,	%l0
	movge	%icc,	%i5,	%o7
	subcc	%g3,	%l4,	%g1
	fmovsn	%icc,	%f14,	%f23
	edge8n	%g4,	%g6,	%i2
	sdivx	%o2,	0x049B,	%o6
	ldsw	[%l7 + 0x30],	%l3
	smul	%l2,	0x19F2,	%o1
	srlx	%l1,	%o4,	%i0
	fcmpd	%fcc0,	%f2,	%f20
	movvc	%icc,	%i7,	%l6
	andn	%g5,	0x096F,	%i1
	edge32n	%l5,	%i4,	%o0
	movl	%xcc,	%g2,	%g7
	fmovrdgz	%i6,	%f24,	%f16
	edge8n	%o5,	%o3,	%l0
	fnot1s	%f18,	%f0
	sll	%i3,	0x16,	%o7
	movcs	%xcc,	%g3,	%i5
	ldd	[%l7 + 0x60],	%l4
	edge16ln	%g1,	%g4,	%g6
	sth	%o2,	[%l7 + 0x50]
	edge16n	%o6,	%l3,	%i2
	mulscc	%l2,	0x1B69,	%l1
	fpadd16	%f16,	%f28,	%f4
	fcmpgt32	%f4,	%f26,	%o4
	array8	%i0,	%o1,	%l6
	fcmpeq16	%f14,	%f4,	%g5
	movrlez	%i7,	0x30E,	%l5
	movle	%xcc,	%i4,	%i1
	fnot2s	%f4,	%f23
	fmovrdgz	%g2,	%f18,	%f6
	ld	[%l7 + 0x30],	%f26
	ldub	[%l7 + 0x2D],	%g7
	fcmps	%fcc3,	%f18,	%f14
	faligndata	%f10,	%f2,	%f8
	smulcc	%i6,	0x0423,	%o0
	movrgez	%o5,	%o3,	%i3
	fzero	%f30
	sllx	%o7,	0x17,	%l0
	stb	%g3,	[%l7 + 0x22]
	edge32l	%l4,	%i5,	%g1
	fmuld8sux16	%f5,	%f5,	%f0
	edge16l	%g4,	%o2,	%g6
	fmovsl	%xcc,	%f17,	%f2
	movre	%l3,	0x303,	%i2
	srlx	%l2,	0x15,	%l1
	sra	%o6,	%i0,	%o1
	movn	%icc,	%l6,	%g5
	edge32	%i7,	%l5,	%o4
	sdivcc	%i4,	0x1517,	%g2
	movge	%xcc,	%i1,	%i6
	subccc	%g7,	0x00FA,	%o0
	smulcc	%o3,	%o5,	%i3
	movge	%xcc,	%o7,	%g3
	movre	%l0,	%l4,	%g1
	mulx	%i5,	%o2,	%g4
	andn	%g6,	0x1731,	%l3
	andcc	%l2,	%l1,	%i2
	sir	0x1E59
	movleu	%icc,	%o6,	%o1
	fornot1	%f16,	%f6,	%f2
	sllx	%l6,	%g5,	%i0
	xorcc	%i7,	0x045F,	%o4
	array16	%i4,	%g2,	%i1
	movleu	%icc,	%l5,	%g7
	fpackfix	%f20,	%f4
	stw	%i6,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x2E],	%o0
	umulcc	%o5,	0x1AFE,	%i3
	andncc	%o7,	%o3,	%g3
	ldd	[%l7 + 0x30],	%l0
	movl	%xcc,	%l4,	%g1
	edge16l	%o2,	%g4,	%i5
	srlx	%l3,	0x09,	%l2
	popc	0x1307,	%l1
	ldx	[%l7 + 0x78],	%i2
	movvc	%xcc,	%g6,	%o6
	movrlz	%o1,	%g5,	%l6
	alignaddrl	%i0,	%o4,	%i7
	sub	%g2,	%i4,	%l5
	addcc	%g7,	0x115E,	%i1
	movg	%icc,	%o0,	%i6
	fnot1	%f2,	%f26
	addc	%i3,	0x16A3,	%o5
	ld	[%l7 + 0x2C],	%f24
	stb	%o3,	[%l7 + 0x61]
	ldub	[%l7 + 0x60],	%g3
	movleu	%xcc,	%l0,	%l4
	fmovsleu	%xcc,	%f14,	%f17
	ldx	[%l7 + 0x28],	%o7
	edge32n	%o2,	%g4,	%i5
	mulx	%l3,	0x0C81,	%g1
	popc	0x0737,	%l2
	fabsd	%f22,	%f16
	movrlz	%l1,	%i2,	%o6
	fnot2s	%f15,	%f15
	edge16ln	%o1,	%g6,	%l6
	orncc	%i0,	0x096A,	%o4
	stw	%i7,	[%l7 + 0x34]
	srl	%g5,	0x07,	%g2
	fmovrdlz	%l5,	%f24,	%f4
	edge32ln	%g7,	%i1,	%o0
	sir	0x1323
	edge8n	%i6,	%i3,	%i4
	movvc	%xcc,	%o5,	%o3
	movrgz	%g3,	%l0,	%l4
	fmovsneg	%icc,	%f22,	%f16
	movrne	%o2,	0x0E8,	%o7
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	movrgez	%l3,	%g1,	%l2
	sdiv	%i2,	0x1E31,	%o6
	andn	%o1,	0x0612,	%l1
	edge8	%g6,	%l6,	%o4
	orncc	%i0,	0x1889,	%i7
	orn	%g2,	%g5,	%l5
	movneg	%xcc,	%g7,	%o0
	sub	%i1,	%i3,	%i6
	siam	0x1
	movpos	%icc,	%i4,	%o5
	edge8ln	%o3,	%l0,	%l4
	umulcc	%g3,	%o2,	%o7
	ldsw	[%l7 + 0x5C],	%i5
	ldsb	[%l7 + 0x4C],	%l3
	ldsb	[%l7 + 0x4C],	%g1
	and	%g4,	0x15FA,	%l2
	movrlz	%i2,	0x230,	%o1
	ld	[%l7 + 0x24],	%f21
	fcmpd	%fcc1,	%f16,	%f14
	movgu	%icc,	%o6,	%l1
	sra	%l6,	%g6,	%i0
	addccc	%o4,	%g2,	%i7
	orn	%g5,	0x043D,	%l5
	stw	%o0,	[%l7 + 0x0C]
	movpos	%xcc,	%g7,	%i3
	fpsub16s	%f24,	%f7,	%f16
	orn	%i6,	%i4,	%o5
	ldsb	[%l7 + 0x34],	%o3
	st	%f5,	[%l7 + 0x70]
	nop
	set	0x22, %g3
	lduh	[%l7 + %g3],	%l0
	subc	%i1,	%g3,	%o2
	movgu	%xcc,	%o7,	%i5
	ldx	[%l7 + 0x78],	%l3
	sdivx	%g1,	0x0F75,	%g4
	addcc	%l4,	%l2,	%o1
	save %o6, 0x009E, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1	%f2,	%f24
	udiv	%l1,	0x12C1,	%l6
	alignaddrl	%g6,	%o4,	%g2
	udivcc	%i7,	0x0B51,	%i0
	fmovrsgez	%l5,	%f4,	%f24
	sdivcc	%g5,	0x1467,	%g7
	fmovrse	%i3,	%f28,	%f28
	alignaddrl	%i6,	%o0,	%i4
	fone	%f18
	ldx	[%l7 + 0x40],	%o5
	movvc	%icc,	%l0,	%i1
	mova	%icc,	%o3,	%g3
	movrgz	%o2,	0x343,	%o7
	lduw	[%l7 + 0x50],	%i5
	fmul8sux16	%f24,	%f6,	%f0
	fxor	%f8,	%f8,	%f10
	subcc	%l3,	0x1946,	%g1
	andn	%g4,	%l2,	%l4
	std	%f30,	[%l7 + 0x08]
	umulcc	%o1,	0x159E,	%i2
	restore %l1, 0x0AC3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovse	%icc,	%f9,	%f0
	stw	%l6,	[%l7 + 0x7C]
	fpadd16s	%f23,	%f8,	%f29
	array16	%o4,	%g2,	%g6
	fmovrdgez	%i7,	%f18,	%f2
	fcmpgt16	%f10,	%f8,	%i0
	fpadd32	%f26,	%f2,	%f18
	stb	%g5,	[%l7 + 0x53]
	movleu	%xcc,	%g7,	%i3
	array8	%l5,	%o0,	%i6
	fcmped	%fcc0,	%f26,	%f30
	fpsub32	%f28,	%f12,	%f10
	fandnot1s	%f22,	%f16,	%f24
	fpadd32s	%f18,	%f27,	%f13
	nop
	set	0x08, %i6
	stb	%o5,	[%l7 + %i6]
	sdivx	%i4,	0x121E,	%l0
	fmovsvs	%icc,	%f25,	%f16
	save %o3, %i1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f1,	%f30
	udivx	%g3,	0x1E35,	%i5
	edge32l	%o7,	%l3,	%g1
	edge32ln	%l2,	%l4,	%o1
	movre	%i2,	%g4,	%o6
	array8	%l6,	%l1,	%o4
	and	%g6,	0x0ADA,	%i7
	sethi	0x0E3E,	%i0
	edge32	%g2,	%g5,	%g7
	movrlez	%i3,	%l5,	%o0
	movl	%icc,	%o5,	%i6
	stx	%i4,	[%l7 + 0x30]
	sdivx	%o3,	0x03DB,	%i1
	ld	[%l7 + 0x08],	%f2
	movg	%icc,	%l0,	%g3
	subc	%o2,	%i5,	%o7
	sth	%g1,	[%l7 + 0x12]
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	addccc	%l3,	0x0B17,	%g4
	srl	%i2,	0x12,	%l6
	ldd	[%l7 + 0x58],	%o6
	ldsh	[%l7 + 0x40],	%o4
	ld	[%l7 + 0x18],	%f13
	sra	%l1,	%i7,	%g6
	movle	%icc,	%i0,	%g5
	fmul8x16	%f15,	%f10,	%f30
	xorcc	%g2,	%g7,	%l5
	movre	%o0,	0x09D,	%o5
	fmovscc	%xcc,	%f21,	%f16
	std	%f16,	[%l7 + 0x70]
	ldx	[%l7 + 0x10],	%i3
	ldsb	[%l7 + 0x10],	%i4
	umul	%i6,	0x19EB,	%o3
	movrgz	%l0,	0x3DB,	%g3
	fnands	%f11,	%f18,	%f22
	orncc	%i1,	0x0FB8,	%i5
	andncc	%o2,	%g1,	%o7
	movg	%xcc,	%l4,	%l2
	edge16ln	%l3,	%g4,	%o1
	ldd	[%l7 + 0x30],	%i2
	ldd	[%l7 + 0x58],	%f28
	sdivcc	%o6,	0x1A5F,	%o4
	fnot1s	%f23,	%f20
	orn	%l6,	%l1,	%g6
	movleu	%icc,	%i0,	%g5
	fmovrse	%g2,	%f12,	%f24
	sethi	0x0B07,	%i7
	fmovdleu	%icc,	%f4,	%f8
	movleu	%icc,	%g7,	%l5
	stw	%o5,	[%l7 + 0x44]
	array16	%o0,	%i3,	%i6
	sllx	%o3,	0x05,	%l0
	subcc	%g3,	0x05B9,	%i4
	move	%icc,	%i5,	%o2
	sethi	0x1E51,	%i1
	st	%f22,	[%l7 + 0x68]
	sll	%g1,	0x16,	%o7
	movrgez	%l2,	0x1AF,	%l4
	sra	%l3,	0x15,	%g4
	addc	%i2,	0x05E6,	%o1
	edge8	%o6,	%o4,	%l6
	mulscc	%l1,	%i0,	%g6
	sdivcc	%g2,	0x1AA9,	%i7
	fmovdg	%xcc,	%f2,	%f16
	sdivx	%g5,	0x0B22,	%g7
	udiv	%o5,	0x054B,	%l5
	subc	%i3,	0x0244,	%i6
	movgu	%icc,	%o0,	%l0
	smul	%o3,	%g3,	%i5
	orncc	%o2,	0x0BB8,	%i4
	subccc	%i1,	0x08D7,	%o7
	edge32	%g1,	%l2,	%l3
	addc	%g4,	%l4,	%o1
	sdivx	%i2,	0x0E11,	%o6
	srax	%l6,	0x16,	%o4
	subcc	%l1,	0x0674,	%i0
	sdivx	%g2,	0x12CA,	%g6
	fmovsleu	%icc,	%f26,	%f10
	ldsb	[%l7 + 0x09],	%g5
	mulscc	%i7,	%o5,	%g7
	popc	%l5,	%i6
	sdivcc	%i3,	0x19DD,	%l0
	movle	%xcc,	%o0,	%o3
	edge32	%i5,	%g3,	%o2
	movge	%xcc,	%i1,	%o7
	addcc	%g1,	0x0133,	%l2
	orcc	%i4,	%l3,	%l4
	restore %g4, %i2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f25,	%f22
	fmovdl	%xcc,	%f16,	%f20
	fmuld8ulx16	%f1,	%f28,	%f26
	fabsd	%f12,	%f4
	umul	%o6,	0x1F71,	%o4
	fzeros	%f6
	movne	%xcc,	%l6,	%l1
	st	%f7,	[%l7 + 0x68]
	fcmple32	%f30,	%f30,	%g2
	sllx	%i0,	0x0E,	%g5
	std	%f28,	[%l7 + 0x20]
	fcmpne16	%f18,	%f30,	%i7
	movrlz	%o5,	%g7,	%l5
	fmovspos	%icc,	%f25,	%f0
	andcc	%g6,	%i3,	%l0
	movle	%icc,	%i6,	%o3
	movre	%o0,	0x1D3,	%g3
	edge8ln	%o2,	%i5,	%i1
	add	%g1,	0x0756,	%o7
	fcmpes	%fcc1,	%f5,	%f14
	movre	%i4,	%l3,	%l4
	sllx	%l2,	0x00,	%i2
	xnorcc	%g4,	0x18A4,	%o6
	movgu	%icc,	%o1,	%l6
	ld	[%l7 + 0x48],	%f17
	umulcc	%o4,	%l1,	%g2
	addccc	%g5,	0x07C4,	%i0
	xnorcc	%i7,	%g7,	%o5
	ldx	[%l7 + 0x68],	%l5
	add	%i3,	0x1A94,	%g6
	nop
	set	0x74, %l3
	sth	%l0,	[%l7 + %l3]
	edge8n	%o3,	%o0,	%i6
	movleu	%icc,	%g3,	%i5
	fnands	%f21,	%f8,	%f21
	umul	%i1,	%o2,	%o7
	addc	%i4,	0x191D,	%l3
	addccc	%l4,	%g1,	%l2
	movcc	%icc,	%g4,	%o6
	fzeros	%f19
	std	%f2,	[%l7 + 0x20]
	movg	%icc,	%i2,	%l6
	movrgz	%o1,	%o4,	%l1
	srlx	%g2,	0x1C,	%i0
	movrlez	%i7,	0x2E2,	%g7
	subccc	%o5,	0x1446,	%g5
	movrlez	%l5,	0x38F,	%g6
	srax	%i3,	0x05,	%o3
	udivcc	%l0,	0x00E2,	%o0
	fmovspos	%xcc,	%f17,	%f16
	movrne	%g3,	%i5,	%i1
	edge8	%o2,	%o7,	%i4
	andn	%i6,	%l4,	%g1
	edge16ln	%l2,	%l3,	%o6
	st	%f5,	[%l7 + 0x2C]
	fmovsl	%icc,	%f5,	%f17
	sdivx	%i2,	0x0CDB,	%l6
	mulscc	%g4,	%o4,	%l1
	addc	%g2,	%i0,	%i7
	fmovdvs	%icc,	%f20,	%f2
	move	%icc,	%g7,	%o1
	sir	0x109D
	fmovsvs	%icc,	%f16,	%f1
	array16	%o5,	%g5,	%g6
	movcc	%icc,	%l5,	%o3
	popc	%l0,	%i3
	fmovrsne	%o0,	%f22,	%f19
	ldub	[%l7 + 0x5A],	%i5
	movn	%icc,	%g3,	%i1
	mulscc	%o7,	%i4,	%o2
	subccc	%l4,	%i6,	%g1
	movrne	%l3,	0x0ED,	%o6
	lduw	[%l7 + 0x30],	%i2
	movl	%xcc,	%l6,	%l2
	edge16	%o4,	%l1,	%g2
	edge32l	%i0,	%i7,	%g4
	fmovdvc	%xcc,	%f22,	%f24
	andcc	%g7,	%o5,	%g5
	edge32	%g6,	%l5,	%o1
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	fsrc2s	%f19,	%f6
	udiv	%o0,	0x01A4,	%i5
	alignaddr	%g3,	%i1,	%o7
	fmovrde	%o2,	%f0,	%f26
	fnot2	%f28,	%f24
	edge8n	%l4,	%i4,	%i6
	ld	[%l7 + 0x10],	%f28
	ld	[%l7 + 0x18],	%f22
	srax	%l3,	%o6,	%g1
	mova	%xcc,	%l6,	%i2
	orncc	%o4,	0x075F,	%l1
	fpackfix	%f8,	%f2
	lduh	[%l7 + 0x24],	%g2
	sethi	0x1EE0,	%l2
	fmovde	%xcc,	%f26,	%f26
	sth	%i0,	[%l7 + 0x58]
	fnot2	%f2,	%f26
	restore %g4, 0x0FD0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o5,	%g7,	%g5
	fmovdne	%icc,	%f15,	%f5
	and	%g6,	0x1A79,	%l5
	movleu	%xcc,	%o3,	%o1
	edge32l	%i3,	%l0,	%o0
	fmovdle	%xcc,	%f1,	%f10
	ldd	[%l7 + 0x58],	%f10
	udiv	%i5,	0x194E,	%g3
	fnors	%f11,	%f19,	%f30
	fnot2	%f14,	%f10
	srl	%o7,	%i1,	%l4
	fnor	%f12,	%f14,	%f8
	andn	%i4,	%i6,	%l3
	fmovdge	%xcc,	%f7,	%f22
	movrgez	%o6,	0x36F,	%o2
	lduw	[%l7 + 0x6C],	%l6
	movre	%g1,	%i2,	%l1
	edge16l	%g2,	%l2,	%o4
	fcmpeq16	%f24,	%f16,	%g4
	orcc	%i7,	%i0,	%o5
	fandnot2	%f18,	%f18,	%f14
	sra	%g5,	0x18,	%g6
	save %g7, 0x0363, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o1,	%o3,	%l0
	movleu	%icc,	%i3,	%i5
	fpack32	%f22,	%f16,	%f4
	array32	%o0,	%g3,	%i1
	fmovde	%xcc,	%f28,	%f20
	alignaddr	%l4,	%o7,	%i6
	xorcc	%l3,	%i4,	%o6
	orncc	%o2,	0x1CA4,	%l6
	andn	%i2,	%g1,	%l1
	fmul8x16au	%f24,	%f19,	%f0
	sub	%l2,	0x1F8D,	%o4
	xor	%g2,	%g4,	%i0
	smulcc	%o5,	%g5,	%g6
	fpadd32	%f2,	%f6,	%f30
	edge16ln	%g7,	%l5,	%i7
	fabsd	%f22,	%f10
	orn	%o1,	0x1059,	%o3
	fmovrdgez	%l0,	%f22,	%f24
	move	%xcc,	%i3,	%i5
	movleu	%icc,	%o0,	%g3
	move	%xcc,	%i1,	%l4
	fcmpne16	%f28,	%f18,	%o7
	movne	%xcc,	%i6,	%i4
	fmovrsgz	%o6,	%f5,	%f7
	addcc	%o2,	0x1ED5,	%l3
	umul	%l6,	0x128D,	%g1
	fmovdneg	%xcc,	%f12,	%f5
	movne	%icc,	%i2,	%l1
	fzero	%f2
	edge16l	%o4,	%g2,	%l2
	movrgz	%i0,	0x2E0,	%g4
	array8	%o5,	%g5,	%g6
	alignaddr	%l5,	%g7,	%i7
	move	%icc,	%o3,	%l0
	movrne	%i3,	%o1,	%o0
	ldsw	[%l7 + 0x44],	%g3
	movcs	%xcc,	%i1,	%i5
	srax	%l4,	%o7,	%i6
	fmovdge	%icc,	%f13,	%f14
	or	%o6,	%o2,	%i4
	umulcc	%l3,	0x0154,	%g1
	fmovdle	%icc,	%f22,	%f3
	st	%f14,	[%l7 + 0x18]
	fabss	%f2,	%f6
	addc	%l6,	%i2,	%l1
	save %g2, 0x1ECE, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x58],	%l2
	movle	%icc,	%i0,	%o5
	movn	%xcc,	%g5,	%g4
	movl	%xcc,	%l5,	%g7
	fornot2	%f24,	%f0,	%f24
	stx	%g6,	[%l7 + 0x48]
	edge8l	%o3,	%l0,	%i3
	edge8ln	%i7,	%o1,	%o0
	addcc	%i1,	%i5,	%l4
	sdivcc	%g3,	0x1AEE,	%i6
	movle	%xcc,	%o7,	%o2
	movleu	%icc,	%i4,	%o6
	sdivx	%g1,	0x1E48,	%l6
	fnot2	%f14,	%f24
	fnegs	%f21,	%f5
	sir	0x1220
	popc	%i2,	%l1
	fcmpgt32	%f30,	%f8,	%g2
	or	%o4,	0x04F0,	%l3
	mulx	%l2,	%o5,	%i0
	fandnot2s	%f27,	%f18,	%f10
	movpos	%icc,	%g5,	%l5
	array32	%g7,	%g6,	%g4
	mulscc	%l0,	0x0FAB,	%o3
	orncc	%i3,	%o1,	%i7
	sllx	%i1,	0x07,	%i5
	movl	%icc,	%o0,	%g3
	fmovdne	%icc,	%f17,	%f7
	fnand	%f20,	%f24,	%f0
	fpsub16s	%f9,	%f4,	%f13
	sll	%l4,	0x0B,	%i6
	edge16	%o2,	%i4,	%o6
	edge32ln	%o7,	%l6,	%g1
	sll	%l1,	%i2,	%o4
	popc	0x1B67,	%l3
	orncc	%g2,	%l2,	%i0
	fmovrsne	%o5,	%f26,	%f9
	add	%g5,	0x1AC5,	%g7
	edge16l	%l5,	%g6,	%g4
	fmovrde	%o3,	%f24,	%f6
	movneg	%icc,	%i3,	%o1
	mulscc	%i7,	%i1,	%l0
	fsrc2s	%f24,	%f6
	sth	%o0,	[%l7 + 0x0E]
	udivcc	%g3,	0x058D,	%i5
	udivx	%l4,	0x0744,	%o2
	srlx	%i4,	0x0C,	%i6
	array16	%o7,	%l6,	%o6
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	orn	%i2,	%o4,	%g2
	movvs	%icc,	%l3,	%l2
	fmovsne	%xcc,	%f26,	%f24
	orn	%o5,	%i0,	%g5
	edge16ln	%g7,	%l5,	%g6
	movg	%xcc,	%g4,	%i3
	ldsh	[%l7 + 0x64],	%o1
	ldd	[%l7 + 0x58],	%f24
	array32	%i7,	%o3,	%i1
	movgu	%xcc,	%o0,	%g3
	movne	%xcc,	%i5,	%l0
	movne	%xcc,	%o2,	%l4
	ldsb	[%l7 + 0x0E],	%i4
	andn	%o7,	%i6,	%o6
	udivcc	%l6,	0x0C25,	%g1
	edge32n	%l1,	%i2,	%g2
	edge32	%l3,	%l2,	%o4
	alignaddrl	%i0,	%o5,	%g5
	fzero	%f2
	movleu	%icc,	%g7,	%g6
	edge8n	%g4,	%l5,	%i3
	xnor	%i7,	%o3,	%i1
	edge32n	%o0,	%o1,	%i5
	udivx	%g3,	0x1BFC,	%o2
	fands	%f20,	%f21,	%f0
	movcs	%xcc,	%l0,	%i4
	array16	%o7,	%l4,	%i6
	edge8l	%l6,	%o6,	%l1
	movvc	%icc,	%g1,	%g2
	sll	%l3,	0x1A,	%i2
	fmovsne	%icc,	%f27,	%f2
	udivcc	%o4,	0x1D0D,	%i0
	edge8n	%o5,	%g5,	%l2
	fmovsleu	%xcc,	%f5,	%f2
	movrlz	%g7,	%g4,	%g6
	fmovscc	%xcc,	%f30,	%f25
	and	%i3,	%l5,	%o3
	sub	%i1,	%o0,	%i7
	edge8	%o1,	%i5,	%g3
	subcc	%l0,	0x0F34,	%o2
	edge32	%i4,	%o7,	%l4
	mulscc	%l6,	%i6,	%o6
	movle	%icc,	%l1,	%g2
	subccc	%l3,	0x0AA9,	%g1
	movn	%icc,	%o4,	%i2
	std	%f14,	[%l7 + 0x78]
	ld	[%l7 + 0x40],	%f18
	movvs	%xcc,	%o5,	%g5
	stb	%i0,	[%l7 + 0x76]
	movcs	%xcc,	%g7,	%g4
	fornot2s	%f15,	%f9,	%f10
	movrlz	%g6,	%l2,	%l5
	andncc	%i3,	%o3,	%o0
	fpackfix	%f10,	%f0
	movleu	%icc,	%i7,	%i1
	fpackfix	%f16,	%f28
	fpmerge	%f16,	%f30,	%f0
	mulx	%i5,	%o1,	%l0
	fmul8x16au	%f29,	%f5,	%f16
	edge16ln	%g3,	%i4,	%o2
	fmovdvs	%icc,	%f29,	%f15
	andncc	%o7,	%l4,	%l6
	orncc	%o6,	%l1,	%g2
	movvs	%icc,	%i6,	%g1
	stx	%o4,	[%l7 + 0x30]
	sll	%l3,	0x1C,	%o5
	edge16	%g5,	%i2,	%i0
	edge16l	%g4,	%g6,	%l2
	ldub	[%l7 + 0x3C],	%l5
	subcc	%i3,	0x15F5,	%g7
	movrlz	%o3,	0x3F4,	%i7
	restore %o0, %i5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%l0,	0x11FC,	%i1
	movn	%xcc,	%i4,	%o2
	fcmpgt16	%f4,	%f4,	%g3
	ldd	[%l7 + 0x60],	%o6
	fnegs	%f8,	%f0
	andncc	%l6,	%l4,	%o6
	fsrc2	%f4,	%f30
	edge8ln	%l1,	%i6,	%g1
	srlx	%g2,	0x06,	%l3
	sethi	0x0C64,	%o4
	addccc	%g5,	%i2,	%o5
	xnorcc	%i0,	%g6,	%l2
	smul	%l5,	0x1EFF,	%g4
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	orn	%i7,	0x07D8,	%o0
	movrne	%g7,	%i5,	%l0
	xnorcc	%o1,	%i1,	%o2
	popc	%g3,	%i4
	edge32n	%l6,	%o7,	%o6
	subc	%l1,	%i6,	%l4
	movre	%g1,	%g2,	%l3
	movle	%xcc,	%o4,	%i2
	add	%o5,	%g5,	%i0
	srlx	%g6,	0x18,	%l2
	fmul8sux16	%f18,	%f30,	%f20
	ldsh	[%l7 + 0x50],	%g4
	movvs	%xcc,	%i3,	%o3
	ld	[%l7 + 0x5C],	%f16
	srlx	%i7,	0x0F,	%o0
	or	%l5,	0x079B,	%g7
	array8	%l0,	%i5,	%i1
	alignaddrl	%o2,	%g3,	%i4
	sra	%l6,	0x0C,	%o1
	edge32	%o7,	%l1,	%o6
	subcc	%i6,	%l4,	%g2
	sth	%g1,	[%l7 + 0x60]
	movcc	%xcc,	%o4,	%l3
	fpsub16s	%f29,	%f7,	%f24
	and	%i2,	0x1069,	%o5
	fnegd	%f14,	%f0
	array8	%i0,	%g6,	%l2
	ld	[%l7 + 0x58],	%f13
	addc	%g4,	0x0C52,	%i3
	std	%f10,	[%l7 + 0x20]
	fcmped	%fcc0,	%f8,	%f30
	ldsb	[%l7 + 0x1C],	%o3
	alignaddrl	%i7,	%g5,	%o0
	array16	%l5,	%l0,	%g7
	edge8	%i5,	%i1,	%o2
	orncc	%g3,	0x0E15,	%i4
	ldd	[%l7 + 0x10],	%f30
	edge32ln	%o1,	%o7,	%l1
	fmovsne	%icc,	%f24,	%f20
	movl	%icc,	%l6,	%i6
	sdivx	%l4,	0x090D,	%o6
	ldd	[%l7 + 0x30],	%g0
	smulcc	%o4,	0x1726,	%g2
	subccc	%i2,	%l3,	%i0
	fmovsg	%icc,	%f23,	%f19
	sub	%g6,	%l2,	%o5
	movne	%icc,	%i3,	%g4
	edge16	%i7,	%o3,	%o0
	andn	%g5,	0x12C2,	%l5
	andcc	%g7,	0x1BE9,	%i5
	edge32	%l0,	%o2,	%i1
	edge16ln	%i4,	%g3,	%o1
	alignaddrl	%o7,	%l6,	%i6
	movle	%icc,	%l4,	%o6
	fmovsleu	%xcc,	%f5,	%f4
	sth	%g1,	[%l7 + 0x5E]
	edge16n	%o4,	%g2,	%l1
	fmul8x16au	%f3,	%f20,	%f28
	fands	%f5,	%f2,	%f21
	smulcc	%l3,	%i0,	%g6
	fmul8sux16	%f0,	%f18,	%f14
	sdivcc	%i2,	0x02FB,	%l2
	add	%o5,	%g4,	%i3
	array8	%o3,	%i7,	%o0
	fmovscc	%icc,	%f2,	%f8
	andcc	%l5,	%g5,	%i5
	movg	%icc,	%g7,	%l0
	ldsw	[%l7 + 0x68],	%o2
	sdivx	%i1,	0x0DDE,	%g3
	ldsh	[%l7 + 0x16],	%i4
	ldub	[%l7 + 0x65],	%o1
	andncc	%o7,	%l6,	%i6
	movl	%icc,	%l4,	%o6
	xnor	%g1,	0x0EF6,	%o4
	srlx	%l1,	0x0B,	%l3
	ldx	[%l7 + 0x28],	%g2
	edge8	%g6,	%i0,	%i2
	move	%xcc,	%l2,	%g4
	fmovspos	%xcc,	%f0,	%f17
	mulx	%i3,	0x0CC7,	%o5
	andcc	%o3,	0x0760,	%i7
	srlx	%o0,	%l5,	%g5
	sir	0x07C2
	movvs	%icc,	%i5,	%g7
	bshuffle	%f2,	%f18,	%f0
	fmovrde	%o2,	%f14,	%f18
	subcc	%l0,	0x0DE1,	%g3
	fcmpes	%fcc2,	%f12,	%f8
	movgu	%xcc,	%i4,	%o1
	sdiv	%i1,	0x1E49,	%l6
	sir	0x1AC9
	srlx	%o7,	%l4,	%i6
	fmovse	%icc,	%f4,	%f0
	lduh	[%l7 + 0x62],	%o6
	movge	%icc,	%g1,	%l1
	fxors	%f16,	%f4,	%f22
	xnor	%l3,	%o4,	%g6
	ldsb	[%l7 + 0x6C],	%g2
	alignaddrl	%i2,	%l2,	%g4
	nop
	set	0x70, %i0
	lduw	[%l7 + %i0],	%i0
	sethi	0x0142,	%o5
	edge8ln	%i3,	%i7,	%o3
	ld	[%l7 + 0x18],	%f14
	pdist	%f2,	%f14,	%f10
	fmovrdgez	%o0,	%f16,	%f28
	edge32ln	%g5,	%l5,	%i5
	alignaddrl	%o2,	%g7,	%l0
	movre	%g3,	0x283,	%o1
	udiv	%i1,	0x16DD,	%i4
	movvs	%xcc,	%o7,	%l4
	fcmpgt32	%f2,	%f8,	%i6
	udiv	%o6,	0x1483,	%l6
	fmovsgu	%xcc,	%f2,	%f22
	andcc	%g1,	0x0227,	%l3
	ldd	[%l7 + 0x78],	%o4
	movrgz	%g6,	%g2,	%i2
	ldsh	[%l7 + 0x5C],	%l2
	umul	%g4,	%l1,	%o5
	movneg	%xcc,	%i0,	%i7
	array16	%i3,	%o0,	%o3
	or	%l5,	0x1823,	%g5
	umul	%i5,	%g7,	%o2
	fcmpd	%fcc0,	%f14,	%f30
	edge16	%l0,	%g3,	%o1
	sdivcc	%i4,	0x1772,	%o7
	movrne	%i1,	%l4,	%o6
	edge16	%i6,	%g1,	%l6
	fcmped	%fcc3,	%f12,	%f10
	fmovrdgz	%l3,	%f4,	%f6
	mulx	%o4,	%g2,	%g6
	stx	%l2,	[%l7 + 0x70]
	nop
	set	0x3E, %i7
	ldsh	[%l7 + %i7],	%i2
	fcmpne32	%f14,	%f18,	%g4
	array8	%l1,	%o5,	%i0
	movg	%xcc,	%i3,	%o0
	fxnor	%f16,	%f12,	%f22
	smulcc	%i7,	0x160F,	%o3
	sllx	%l5,	0x11,	%g5
	movpos	%xcc,	%i5,	%g7
	save %o2, 0x13FE, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd16	%f18,	%f8,	%f10
	fandnot1	%f16,	%f4,	%f18
	xnor	%o1,	0x0AC1,	%g3
	movre	%i4,	0x29D,	%i1
	udivcc	%o7,	0x0407,	%o6
	andcc	%i6,	0x1EE8,	%l4
	add	%l6,	0x02AE,	%g1
	fabss	%f18,	%f20
	srax	%l3,	0x15,	%g2
	fmovrdne	%g6,	%f30,	%f12
	movrlez	%l2,	%o4,	%g4
	fmovdgu	%xcc,	%f17,	%f17
	siam	0x4
	ldx	[%l7 + 0x38],	%i2
	edge32l	%o5,	%l1,	%i3
	andncc	%o0,	%i7,	%o3
	edge8	%i0,	%g5,	%i5
	sth	%g7,	[%l7 + 0x2A]
	and	%l5,	0x09BF,	%o2
	or	%o1,	0x1D60,	%l0
	and	%g3,	%i4,	%o7
	fcmple16	%f12,	%f30,	%i1
	ldd	[%l7 + 0x20],	%f0
	fmuld8ulx16	%f8,	%f15,	%f6
	fmovdl	%icc,	%f7,	%f12
	andcc	%i6,	0x192A,	%o6
	fmovrsne	%l4,	%f13,	%f5
	fexpand	%f9,	%f2
	fnands	%f27,	%f24,	%f20
	orcc	%g1,	0x039D,	%l6
	subc	%l3,	%g2,	%l2
	andn	%o4,	0x062B,	%g6
	smulcc	%g4,	0x0D42,	%i2
	fmovdle	%icc,	%f22,	%f23
	fsrc1	%f10,	%f20
	fmovdl	%icc,	%f26,	%f2
	ldsb	[%l7 + 0x74],	%o5
	smulcc	%l1,	%o0,	%i3
	movrne	%i7,	%i0,	%g5
	popc	%o3,	%i5
	fabss	%f1,	%f20
	popc	0x0C2C,	%g7
	subc	%l5,	0x1601,	%o2
	edge32l	%o1,	%g3,	%i4
	popc	0x1375,	%l0
	fabss	%f31,	%f21
	lduw	[%l7 + 0x3C],	%i1
	st	%f2,	[%l7 + 0x64]
	movleu	%icc,	%i6,	%o7
	fmovsa	%xcc,	%f29,	%f3
	orn	%l4,	0x1E8A,	%g1
	sllx	%l6,	%o6,	%l3
	xor	%l2,	0x193F,	%o4
	movneg	%icc,	%g6,	%g4
	array16	%g2,	%i2,	%l1
	fsrc1	%f16,	%f4
	andncc	%o5,	%i3,	%i7
	fmovrsgz	%i0,	%f26,	%f5
	edge32l	%o0,	%g5,	%o3
	alignaddr	%g7,	%i5,	%l5
	udiv	%o2,	0x1E86,	%o1
	fornot1	%f20,	%f6,	%f6
	edge32n	%i4,	%l0,	%g3
	movpos	%xcc,	%i1,	%o7
	edge8l	%i6,	%l4,	%l6
	sll	%g1,	%o6,	%l2
	movcc	%xcc,	%l3,	%o4
	sethi	0x0D87,	%g6
	fxor	%f28,	%f22,	%f6
	fexpand	%f30,	%f12
	fmul8x16	%f25,	%f0,	%f12
	lduw	[%l7 + 0x58],	%g4
	move	%icc,	%g2,	%l1
	fsrc2s	%f29,	%f22
	nop
	set	0x70, %g7
	ldsw	[%l7 + %g7],	%o5
	st	%f23,	[%l7 + 0x4C]
	save %i2, 0x1B19, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsge	%xcc,	%f12,	%f24
	sub	%i0,	%i7,	%g5
	movg	%icc,	%o3,	%g7
	subc	%o0,	%i5,	%o2
	popc	0x079C,	%o1
	fnand	%f16,	%f10,	%f22
	array32	%l5,	%l0,	%i4
	ldsb	[%l7 + 0x34],	%i1
	sll	%o7,	%i6,	%l4
	xorcc	%l6,	%g3,	%g1
	std	%f16,	[%l7 + 0x60]
	sdivcc	%l2,	0x0988,	%o6
	edge16ln	%l3,	%o4,	%g4
	fmovsn	%xcc,	%f10,	%f6
	xorcc	%g6,	0x1884,	%g2
	edge32ln	%l1,	%o5,	%i3
	movcs	%xcc,	%i0,	%i2
	orcc	%g5,	0x0C78,	%i7
	movleu	%icc,	%g7,	%o0
	fmovdleu	%xcc,	%f13,	%f23
	movrgz	%i5,	0x00A,	%o3
	array32	%o1,	%o2,	%l5
	movvc	%xcc,	%i4,	%l0
	stb	%o7,	[%l7 + 0x77]
	fmovda	%xcc,	%f0,	%f10
	edge8l	%i1,	%i6,	%l6
	smul	%l4,	0x1C47,	%g3
	edge16n	%l2,	%g1,	%l3
	st	%f29,	[%l7 + 0x40]
	fabsd	%f24,	%f22
	sllx	%o4,	%o6,	%g4
	array8	%g2,	%l1,	%o5
	movcs	%xcc,	%g6,	%i0
	ldd	[%l7 + 0x70],	%i2
	sdivx	%i3,	0x106D,	%i7
	addccc	%g7,	%g5,	%o0
	edge16ln	%o3,	%i5,	%o1
	fmovse	%icc,	%f25,	%f6
	fpmerge	%f18,	%f29,	%f20
	xnorcc	%l5,	0x15CF,	%i4
	nop
	set	0x72, %i4
	lduh	[%l7 + %i4],	%l0
	smul	%o2,	%i1,	%i6
	xnor	%l6,	%l4,	%g3
	udivx	%o7,	0x148C,	%l2
	sdiv	%l3,	0x1CF6,	%g1
	fmovrdlz	%o6,	%f4,	%f26
	movg	%xcc,	%g4,	%o4
	sll	%l1,	0x02,	%o5
	sdiv	%g6,	0x1960,	%i0
	fabsd	%f18,	%f10
	edge32n	%i2,	%i3,	%i7
	movgu	%xcc,	%g7,	%g5
	udivcc	%o0,	0x0844,	%o3
	umulcc	%i5,	0x1740,	%g2
	movle	%icc,	%o1,	%l5
	movrlez	%i4,	0x09E,	%l0
	mulscc	%o2,	0x0C79,	%i1
	movvs	%xcc,	%l6,	%i6
	orncc	%g3,	%o7,	%l2
	ld	[%l7 + 0x3C],	%f12
	sub	%l4,	0x0DF4,	%g1
	fands	%f7,	%f29,	%f24
	xnorcc	%l3,	0x00EF,	%g4
	edge8l	%o6,	%o4,	%o5
	srlx	%l1,	0x00,	%i0
	mova	%icc,	%i2,	%i3
	movneg	%xcc,	%i7,	%g7
	fcmpd	%fcc3,	%f4,	%f10
	ldx	[%l7 + 0x40],	%g5
	fmovdge	%icc,	%f9,	%f21
	sdiv	%o0,	0x1F33,	%o3
	fone	%f24
	lduw	[%l7 + 0x08],	%g6
	nop
	set	0x68, %g6
	stb	%g2,	[%l7 + %g6]
	edge32ln	%o1,	%l5,	%i4
	movg	%xcc,	%i5,	%o2
	array8	%l0,	%l6,	%i6
	array16	%g3,	%o7,	%l2
	addc	%l4,	%g1,	%i1
	movpos	%xcc,	%l3,	%g4
	restore %o6, 0x1D97, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsle	%xcc,	%f5,	%f22
	ldsb	[%l7 + 0x4E],	%o5
	movvs	%xcc,	%i0,	%i2
	fxors	%f1,	%f0,	%f20
	addccc	%l1,	0x1186,	%i7
	pdist	%f18,	%f24,	%f12
	faligndata	%f20,	%f6,	%f6
	sth	%i3,	[%l7 + 0x6E]
	stb	%g7,	[%l7 + 0x2F]
	fmovsa	%xcc,	%f2,	%f18
	smulcc	%g5,	0x12EF,	%o3
	fmul8sux16	%f8,	%f20,	%f18
	edge32n	%g6,	%g2,	%o0
	fxors	%f11,	%f26,	%f23
	edge32ln	%o1,	%l5,	%i5
	subc	%o2,	%i4,	%l0
	fpadd32s	%f8,	%f22,	%f0
	alignaddrl	%i6,	%l6,	%o7
	sir	0x0218
	fpadd16	%f4,	%f12,	%f18
	xor	%g3,	0x0711,	%l2
	edge16	%g1,	%i1,	%l3
	orcc	%l4,	0x1ECB,	%o6
	fmul8x16al	%f28,	%f1,	%f0
	movl	%icc,	%o4,	%g4
	mulx	%o5,	0x177A,	%i2
	xnor	%l1,	%i0,	%i3
	mova	%xcc,	%g7,	%i7
	fmovsneg	%xcc,	%f7,	%f3
	edge8n	%g5,	%g6,	%o3
	xnorcc	%o0,	0x0CF6,	%g2
	and	%o1,	0x0969,	%l5
	edge16	%o2,	%i5,	%l0
	fpadd32	%f26,	%f24,	%f22
	sub	%i4,	%l6,	%o7
	srlx	%g3,	0x03,	%i6
	sethi	0x1CB9,	%g1
	movg	%icc,	%l2,	%i1
	ldsh	[%l7 + 0x44],	%l4
	ld	[%l7 + 0x60],	%f6
	movrlez	%l3,	%o4,	%o6
	fmul8x16	%f13,	%f12,	%f24
	udivx	%g4,	0x0409,	%i2
	fmovdpos	%xcc,	%f28,	%f8
	movg	%icc,	%o5,	%l1
	fabsd	%f26,	%f26
	fnegs	%f20,	%f1
	movleu	%icc,	%i0,	%i3
	stb	%i7,	[%l7 + 0x08]
	ld	[%l7 + 0x7C],	%f31
	edge16ln	%g7,	%g6,	%o3
	ldx	[%l7 + 0x18],	%o0
	lduw	[%l7 + 0x1C],	%g2
	xor	%g5,	0x1831,	%o1
	addc	%l5,	0x0850,	%i5
	movcc	%xcc,	%l0,	%i4
	addcc	%l6,	0x14FC,	%o2
	andncc	%o7,	%i6,	%g1
	ldsh	[%l7 + 0x6A],	%g3
	ldsh	[%l7 + 0x26],	%i1
	lduh	[%l7 + 0x4C],	%l2
	movne	%icc,	%l3,	%l4
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	fornot1s	%f25,	%f20,	%f21
	fmovdneg	%xcc,	%f19,	%f12
	movre	%o4,	%i2,	%l1
	smul	%o5,	%i3,	%i0
	sllx	%i7,	%g6,	%o3
	sll	%o0,	%g2,	%g7
	xorcc	%o1,	0x0EDB,	%l5
	xorcc	%i5,	0x062C,	%l0
	fcmps	%fcc0,	%f1,	%f4
	fnot1s	%f15,	%f16
	smul	%g5,	%l6,	%o2
	fpackfix	%f6,	%f1
	lduw	[%l7 + 0x38],	%i4
	array16	%o7,	%i6,	%g1
	mova	%icc,	%i1,	%g3
	stw	%l3,	[%l7 + 0x2C]
	orcc	%l2,	0x03B2,	%l4
	movne	%xcc,	%g4,	%o4
	sdivcc	%i2,	0x03AF,	%l1
	fpack32	%f20,	%f8,	%f10
	srax	%o5,	0x18,	%i3
	udiv	%o6,	0x0C8D,	%i7
	movneg	%xcc,	%g6,	%i0
	fmul8x16al	%f3,	%f20,	%f16
	addccc	%o0,	0x191F,	%g2
	fzero	%f26
	or	%o3,	0x1014,	%g7
	orncc	%l5,	%o1,	%i5
	xnor	%l0,	0x0339,	%l6
	movrlez	%g5,	%i4,	%o7
	fmovsvc	%xcc,	%f17,	%f19
	std	%f10,	[%l7 + 0x30]
	ldd	[%l7 + 0x48],	%o2
	ldsh	[%l7 + 0x12],	%i6
	xnor	%i1,	0x01E0,	%g1
	orcc	%l3,	%g3,	%l4
	movcc	%xcc,	%l2,	%g4
	edge16l	%o4,	%i2,	%l1
	sdivx	%i3,	0x10D5,	%o5
	mulx	%o6,	%g6,	%i7
	movvc	%icc,	%i0,	%o0
	save %g2, %o3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l5,	%o1,	%i5
	sra	%l6,	0x07,	%g5
	sdivcc	%l0,	0x1920,	%o7
	xnorcc	%i4,	0x151D,	%i6
	ld	[%l7 + 0x18],	%f23
	fcmpne32	%f6,	%f16,	%o2
	fone	%f24
	fmovsg	%xcc,	%f15,	%f11
	smul	%i1,	0x1EB8,	%g1
	xorcc	%g3,	%l3,	%l4
	movrgez	%g4,	0x302,	%o4
	movcs	%xcc,	%i2,	%l2
	edge32n	%l1,	%o5,	%o6
	fornot1s	%f18,	%f11,	%f8
	fmovrsne	%g6,	%f4,	%f27
	xorcc	%i3,	0x1252,	%i7
	subccc	%i0,	%g2,	%o0
	umulcc	%o3,	%g7,	%o1
	edge32l	%l5,	%i5,	%g5
	stx	%l6,	[%l7 + 0x18]
	movcs	%xcc,	%o7,	%l0
	sir	0x0A49
	sdivx	%i4,	0x0F30,	%o2
	alignaddrl	%i6,	%g1,	%i1
	stw	%l3,	[%l7 + 0x74]
	lduh	[%l7 + 0x30],	%g3
	sub	%g4,	%o4,	%l4
	edge32n	%l2,	%i2,	%o5
	orn	%l1,	0x0C6F,	%o6
	movvc	%xcc,	%g6,	%i7
	edge8n	%i0,	%g2,	%o0
	edge32n	%o3,	%g7,	%o1
	ldd	[%l7 + 0x78],	%f16
	fnors	%f6,	%f17,	%f15
	fxnors	%f31,	%f31,	%f21
	addccc	%i3,	%l5,	%i5
	ldsh	[%l7 + 0x74],	%l6
	sll	%o7,	0x0A,	%l0
	edge16l	%g5,	%o2,	%i6
	fmovdle	%icc,	%f0,	%f27
	sdivcc	%i4,	0x1BF2,	%i1
	pdist	%f20,	%f12,	%f6
	fmul8x16al	%f4,	%f0,	%f8
	edge32n	%g1,	%l3,	%g4
	fpack16	%f12,	%f30
	sdivcc	%o4,	0x0A43,	%l4
	fmovrslz	%l2,	%f30,	%f3
	ldd	[%l7 + 0x20],	%f22
	umul	%g3,	%i2,	%l1
	addcc	%o6,	0x1A90,	%g6
	smulcc	%o5,	%i7,	%g2
	srax	%i0,	%o3,	%g7
	mova	%icc,	%o0,	%o1
	fabss	%f6,	%f16
	fornot1	%f22,	%f14,	%f10
	movcs	%icc,	%i3,	%l5
	xor	%i5,	0x0A4B,	%o7
	nop
	set	0x3D, %i3
	ldub	[%l7 + %i3],	%l0
	fmovscc	%icc,	%f9,	%f22
	sdiv	%l6,	0x13F9,	%g5
	movvc	%icc,	%o2,	%i6
	umul	%i1,	%i4,	%g1
	movcs	%xcc,	%g4,	%l3
	udivcc	%l4,	0x0052,	%l2
	smulcc	%o4,	0x1790,	%i2
	andncc	%g3,	%o6,	%g6
	sth	%o5,	[%l7 + 0x1E]
	std	%f26,	[%l7 + 0x30]
	edge8l	%l1,	%g2,	%i0
	std	%f12,	[%l7 + 0x70]
	fnot1s	%f3,	%f0
	fmovdle	%xcc,	%f24,	%f28
	ldd	[%l7 + 0x78],	%i6
	ldsh	[%l7 + 0x2E],	%o3
	sdiv	%g7,	0x05D4,	%o0
	fmovrdgz	%i3,	%f16,	%f18
	sethi	0x13D9,	%l5
	stw	%o1,	[%l7 + 0x08]
	ld	[%l7 + 0x30],	%f29
	array8	%o7,	%i5,	%l0
	ldd	[%l7 + 0x48],	%i6
	mova	%icc,	%g5,	%i6
	array32	%o2,	%i1,	%i4
	addc	%g4,	%l3,	%l4
	subcc	%l2,	0x06CA,	%g1
	edge32	%i2,	%g3,	%o6
	sllx	%g6,	%o5,	%l1
	fsrc2	%f22,	%f2
	orn	%g2,	%o4,	%i7
	stx	%i0,	[%l7 + 0x18]
	sethi	0x0E4F,	%o3
	fsrc1s	%f22,	%f25
	ldsh	[%l7 + 0x14],	%o0
	sll	%g7,	0x13,	%l5
	fmovrsgz	%i3,	%f6,	%f5
	fmovdn	%icc,	%f15,	%f8
	array16	%o1,	%i5,	%o7
	subccc	%l0,	0x143D,	%g5
	array8	%l6,	%o2,	%i6
	sdiv	%i4,	0x01A7,	%g4
	movneg	%icc,	%l3,	%i1
	fmovscc	%xcc,	%f25,	%f22
	move	%xcc,	%l2,	%g1
	ldub	[%l7 + 0x77],	%i2
	edge16n	%l4,	%o6,	%g6
	array8	%o5,	%g3,	%l1
	addcc	%o4,	%g2,	%i7
	sdivx	%i0,	0x1D1B,	%o0
	ldd	[%l7 + 0x70],	%g6
	ldsb	[%l7 + 0x09],	%o3
	fmovdcc	%xcc,	%f6,	%f6
	fornot2s	%f7,	%f30,	%f21
	fcmpeq32	%f2,	%f18,	%i3
	fmovda	%icc,	%f20,	%f3
	fzeros	%f20
	fcmple16	%f4,	%f10,	%l5
	edge16n	%o1,	%i5,	%o7
	andcc	%l0,	%g5,	%o2
	andn	%i6,	%l6,	%g4
	addccc	%l3,	0x04EE,	%i1
	edge32ln	%i4,	%g1,	%l2
	add	%i2,	0x0A24,	%l4
	sub	%g6,	0x1153,	%o5
	xnorcc	%o6,	0x1997,	%g3
	stw	%l1,	[%l7 + 0x60]
	stw	%g2,	[%l7 + 0x28]
	subcc	%o4,	0x0696,	%i7
	udivcc	%o0,	0x09E7,	%i0
	mulscc	%o3,	%i3,	%g7
	movvc	%xcc,	%o1,	%i5
	or	%o7,	0x1B4B,	%l0
	save %l5, %g5, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f26,	%f20,	%i6
	alignaddrl	%l6,	%g4,	%l3
	movre	%i4,	0x1CB,	%i1
	ldx	[%l7 + 0x58],	%l2
	sdiv	%g1,	0x13AE,	%i2
	sir	0x0953
	fpsub32s	%f6,	%f31,	%f16
	array16	%g6,	%o5,	%l4
	xnorcc	%g3,	%l1,	%g2
	movrne	%o4,	%i7,	%o6
	fmovd	%f8,	%f6
	ldd	[%l7 + 0x48],	%f0
	movneg	%xcc,	%o0,	%i0
	sll	%i3,	%g7,	%o3
	sethi	0x18F0,	%o1
	subcc	%i5,	0x13BB,	%l0
	orn	%l5,	0x0ADE,	%o7
	edge8	%o2,	%i6,	%g5
	umul	%l6,	0x17E2,	%g4
	umulcc	%l3,	%i4,	%l2
	smulcc	%g1,	0x0601,	%i2
	sethi	0x071B,	%g6
	addc	%o5,	0x05C8,	%i1
	stw	%g3,	[%l7 + 0x10]
	fmovdvc	%icc,	%f0,	%f2
	fmovsneg	%icc,	%f6,	%f31
	array32	%l4,	%l1,	%o4
	movl	%icc,	%i7,	%o6
	subcc	%g2,	0x1B6F,	%i0
	xnorcc	%i3,	%g7,	%o3
	fornot1s	%f22,	%f16,	%f9
	andncc	%o0,	%i5,	%o1
	ldsh	[%l7 + 0x5A],	%l5
	movn	%xcc,	%o7,	%l0
	sdiv	%o2,	0x0326,	%g5
	sdiv	%i6,	0x1933,	%l6
	fandnot1	%f26,	%f20,	%f0
	udivx	%g4,	0x1C52,	%l3
	edge32n	%i4,	%g1,	%l2
	edge16l	%i2,	%o5,	%g6
	edge8n	%i1,	%l4,	%g3
	srax	%l1,	%o4,	%i7
	edge16	%o6,	%i0,	%g2
	edge8l	%i3,	%g7,	%o3
	subcc	%i5,	%o0,	%o1
	movg	%icc,	%l5,	%o7
	fcmple32	%f0,	%f6,	%o2
	fmovdleu	%xcc,	%f17,	%f2
	std	%f30,	[%l7 + 0x78]
	stb	%g5,	[%l7 + 0x7A]
	popc	0x1F9D,	%i6
	movn	%xcc,	%l0,	%g4
	andncc	%l6,	%l3,	%i4
	sdiv	%g1,	0x18B7,	%i2
	udivcc	%o5,	0x1F4B,	%g6
	mulscc	%i1,	0x14CA,	%l2
	fornot1	%f12,	%f2,	%f4
	orn	%l4,	0x166F,	%l1
	lduw	[%l7 + 0x3C],	%g3
	edge16	%i7,	%o4,	%o6
	ld	[%l7 + 0x2C],	%f3
	srlx	%g2,	0x16,	%i3
	fcmpd	%fcc0,	%f22,	%f24
	fmovsge	%icc,	%f13,	%f13
	addc	%i0,	%o3,	%g7
	movcc	%xcc,	%i5,	%o0
	movgu	%xcc,	%l5,	%o7
	fandnot2	%f18,	%f20,	%f18
	ldd	[%l7 + 0x60],	%o2
	fnegd	%f14,	%f24
	stb	%g5,	[%l7 + 0x18]
	edge32	%i6,	%o1,	%g4
	fors	%f29,	%f6,	%f8
	fnot2	%f12,	%f4
	move	%icc,	%l0,	%l6
	movvs	%xcc,	%l3,	%g1
	movn	%icc,	%i4,	%o5
	restore %i2, 0x0940, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f17,	[%l7 + 0x74]
	movneg	%icc,	%l2,	%l4
	ld	[%l7 + 0x1C],	%f8
	smulcc	%l1,	0x1FD0,	%g6
	st	%f28,	[%l7 + 0x70]
	fmovsl	%icc,	%f18,	%f1
	fcmps	%fcc2,	%f6,	%f4
	fmovdleu	%icc,	%f7,	%f10
	movne	%xcc,	%i7,	%g3
	nop
	set	0x74, %l6
	stb	%o4,	[%l7 + %l6]
	for	%f12,	%f8,	%f10
	movl	%xcc,	%o6,	%i3
	ldub	[%l7 + 0x43],	%g2
	movrne	%o3,	%g7,	%i0
	srl	%o0,	%l5,	%i5
	mulscc	%o2,	0x1DDF,	%o7
	movrne	%i6,	0x091,	%o1
	nop
	set	0x22, %i1
	ldsh	[%l7 + %i1],	%g5
	movcc	%xcc,	%l0,	%l6
	smul	%g4,	0x1BFE,	%g1
	udivx	%l3,	0x001C,	%i4
	sub	%i2,	0x082F,	%o5
	bshuffle	%f30,	%f16,	%f2
	fcmps	%fcc3,	%f9,	%f6
	sdivcc	%i1,	0x19D6,	%l2
	st	%f17,	[%l7 + 0x4C]
	xor	%l1,	%l4,	%i7
	sdiv	%g3,	0x13E4,	%g6
	and	%o4,	0x1681,	%i3
	save %o6, 0x00C1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g7,	0x1D91,	%i0
	smulcc	%o0,	0x0898,	%o3
	fmovrse	%i5,	%f16,	%f10
	fpackfix	%f26,	%f13
	ldub	[%l7 + 0x3F],	%o2
	edge8l	%o7,	%i6,	%l5
	fmovrdlz	%o1,	%f20,	%f6
	sdivcc	%l0,	0x1C56,	%l6
	subc	%g4,	0x042D,	%g5
	udivcc	%l3,	0x0A3B,	%g1
	array8	%i4,	%i2,	%o5
	sdivx	%l2,	0x17AB,	%i1
	st	%f19,	[%l7 + 0x50]
	save %l4, 0x14B3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g3,	0x18F1,	%g6
	fands	%f9,	%f7,	%f18
	sth	%o4,	[%l7 + 0x20]
	orcc	%i3,	0x126F,	%o6
	ldsw	[%l7 + 0x3C],	%g2
	fmovdvc	%xcc,	%f22,	%f3
	fmovsl	%xcc,	%f19,	%f21
	movrgez	%g7,	%i0,	%o0
	subcc	%o3,	0x11A0,	%l1
	addccc	%o2,	0x1CE9,	%i5
	nop
	set	0x60, %o5
	ldsb	[%l7 + %o5],	%i6
	udiv	%o7,	0x0761,	%l5
	edge8ln	%o1,	%l0,	%l6
	mulx	%g5,	%l3,	%g4
	fexpand	%f20,	%f20
	fmovsgu	%xcc,	%f17,	%f22
	add	%i4,	0x10DE,	%g1
	sra	%o5,	%l2,	%i2
	fcmpgt16	%f8,	%f24,	%i1
	ldd	[%l7 + 0x18],	%i6
	srl	%l4,	0x03,	%g6
	addccc	%o4,	%i3,	%o6
	fcmpgt32	%f10,	%f6,	%g3
	sethi	0x0489,	%g7
	alignaddrl	%i0,	%o0,	%o3
	movrlz	%g2,	%l1,	%o2
	fandnot1	%f28,	%f0,	%f6
	movrne	%i6,	%i5,	%o7
	fmovsg	%xcc,	%f21,	%f18
	fcmpeq32	%f30,	%f20,	%o1
	srax	%l5,	%l6,	%g5
	array8	%l0,	%g4,	%l3
	sdivx	%i4,	0x0A7F,	%o5
	alignaddrl	%l2,	%g1,	%i1
	andncc	%i2,	%i7,	%l4
	fone	%f4
	movvc	%xcc,	%o4,	%g6
	fnot1	%f30,	%f28
	edge16l	%i3,	%g3,	%o6
	movgu	%xcc,	%g7,	%i0
	fmovda	%icc,	%f22,	%f3
	nop
	set	0x68, %i5
	ldd	[%l7 + %i5],	%o0
	fmovdle	%xcc,	%f2,	%f25
	move	%xcc,	%o3,	%l1
	fexpand	%f0,	%f18
	movrlez	%g2,	0x0C6,	%i6
	add	%i5,	0x0B04,	%o7
	fmovsa	%icc,	%f11,	%f5
	sth	%o1,	[%l7 + 0x38]
	mova	%xcc,	%o2,	%l5
	fmovrsne	%l6,	%f16,	%f21
	lduh	[%l7 + 0x24],	%g5
	sdivx	%g4,	0x134D,	%l0
	fandnot2s	%f28,	%f15,	%f11
	nop
	set	0x4E, %l2
	stb	%l3,	[%l7 + %l2]
	edge16ln	%i4,	%o5,	%g1
	movpos	%icc,	%l2,	%i2
	nop
	set	0x71, %g1
	ldub	[%l7 + %g1],	%i7
	fone	%f30
	sdiv	%l4,	0x093A,	%o4
	sll	%g6,	0x11,	%i1
	addc	%g3,	%o6,	%g7
	sdivcc	%i3,	0x13AC,	%o0
	alignaddr	%o3,	%i0,	%g2
	xorcc	%i6,	0x1FC1,	%l1
	ldx	[%l7 + 0x30],	%o7
	alignaddrl	%i5,	%o1,	%o2
	fmovsgu	%xcc,	%f8,	%f20
	alignaddrl	%l6,	%l5,	%g4
	pdist	%f12,	%f26,	%f12
	sir	0x1D2E
	movn	%xcc,	%l0,	%g5
	lduh	[%l7 + 0x50],	%i4
	movcs	%xcc,	%o5,	%l3
	fmul8x16	%f7,	%f12,	%f28
	fandnot1	%f6,	%f8,	%f10
	smul	%g1,	%i2,	%l2
	movleu	%xcc,	%l4,	%i7
	edge8	%g6,	%i1,	%o4
	fpackfix	%f6,	%f16
	save %o6, %g3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o0,	%i3,	%o3
	xnorcc	%i0,	%g2,	%i6
	udivcc	%o7,	0x005A,	%i5
	srl	%l1,	0x08,	%o2
	movl	%xcc,	%o1,	%l6
	fmovs	%f16,	%f30
	movpos	%icc,	%l5,	%g4
	movrlez	%l0,	%i4,	%g5
	fnot2	%f18,	%f18
	movvc	%icc,	%l3,	%o5
	ldx	[%l7 + 0x70],	%i2
	fmovdpos	%xcc,	%f0,	%f6
	alignaddrl	%g1,	%l2,	%l4
	sethi	0x1155,	%i7
	movg	%icc,	%g6,	%i1
	umulcc	%o6,	%g3,	%g7
	movleu	%icc,	%o4,	%o0
	mulx	%i3,	%i0,	%g2
	sll	%i6,	%o3,	%o7
	movrne	%i5,	0x000,	%o2
	fandnot2	%f4,	%f14,	%f14
	xnor	%o1,	%l6,	%l1
	movle	%icc,	%l5,	%g4
	movre	%l0,	%g5,	%i4
	ldsh	[%l7 + 0x6A],	%l3
	fcmple16	%f10,	%f14,	%o5
	fpsub16	%f26,	%f22,	%f8
	fmul8x16au	%f25,	%f3,	%f6
	edge8l	%g1,	%l2,	%i2
	udiv	%i7,	0x072F,	%l4
	fors	%f0,	%f4,	%f21
	sdiv	%g6,	0x056A,	%o6
	save %i1, %g7, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%o4,	%f20,	%f12
	movpos	%xcc,	%i3,	%i0
	movvc	%xcc,	%g2,	%i6
	movn	%icc,	%o0,	%o3
	edge16ln	%i5,	%o2,	%o1
	movvs	%xcc,	%l6,	%l1
	addccc	%l5,	0x0E41,	%g4
	udiv	%l0,	0x1DCD,	%g5
	movrlez	%o7,	0x2BC,	%l3
	edge16l	%o5,	%i4,	%l2
	fmovscc	%xcc,	%f10,	%f7
	ldub	[%l7 + 0x36],	%i2
	movvc	%xcc,	%g1,	%i7
	addccc	%g6,	0x1FEE,	%o6
	edge8n	%i1,	%g7,	%g3
	fmovda	%xcc,	%f4,	%f13
	xorcc	%l4,	0x1846,	%o4
	fmovsa	%icc,	%f20,	%f22
	stb	%i0,	[%l7 + 0x40]
	alignaddr	%i3,	%i6,	%o0
	srlx	%o3,	0x1B,	%i5
	fmovsneg	%icc,	%f17,	%f29
	ld	[%l7 + 0x10],	%f8
	umulcc	%g2,	%o1,	%l6
	movcc	%icc,	%l1,	%l5
	movcs	%icc,	%o2,	%g4
	array8	%l0,	%o7,	%l3
	fcmple16	%f26,	%f18,	%o5
	sdivx	%g5,	0x1D2D,	%l2
	movneg	%icc,	%i2,	%i4
	xorcc	%i7,	0x090F,	%g6
	fmovdge	%xcc,	%f6,	%f5
	st	%f25,	[%l7 + 0x50]
	movge	%xcc,	%g1,	%o6
	ld	[%l7 + 0x74],	%f11
	mulx	%i1,	0x09B0,	%g7
	movrlez	%g3,	%o4,	%i0
	ldd	[%l7 + 0x50],	%l4
	edge8	%i6,	%o0,	%i3
	sll	%i5,	0x13,	%o3
	movle	%icc,	%g2,	%o1
	edge32l	%l1,	%l5,	%o2
	orncc	%l6,	0x0494,	%l0
	fmovdvs	%icc,	%f16,	%f3
	stw	%o7,	[%l7 + 0x68]
	fmovrdgz	%l3,	%f10,	%f28
	fmovrslz	%g4,	%f29,	%f19
	movne	%icc,	%g5,	%o5
	stw	%i2,	[%l7 + 0x48]
	srl	%l2,	%i4,	%g6
	fmovrsgez	%i7,	%f31,	%f0
	fabss	%f0,	%f0
	array8	%g1,	%o6,	%i1
	ldsw	[%l7 + 0x50],	%g3
	lduh	[%l7 + 0x44],	%o4
	orncc	%i0,	%g7,	%i6
	fmovdgu	%icc,	%f27,	%f25
	addc	%o0,	%l4,	%i3
	array8	%i5,	%o3,	%o1
	fpadd16	%f8,	%f12,	%f12
	xnorcc	%l1,	0x1F99,	%g2
	edge16l	%l5,	%l6,	%l0
	fcmpne16	%f26,	%f26,	%o7
	array16	%l3,	%o2,	%g4
	movg	%icc,	%g5,	%i2
	mulscc	%l2,	0x0E12,	%o5
	umulcc	%g6,	%i4,	%g1
	sdivx	%o6,	0x1015,	%i1
	fxnor	%f28,	%f4,	%f14
	sra	%i7,	0x0E,	%g3
	movgu	%xcc,	%o4,	%g7
	sub	%i6,	%o0,	%l4
	nop
	set	0x59, %l0
	ldub	[%l7 + %l0],	%i0
	fcmped	%fcc2,	%f4,	%f22
	sll	%i5,	0x00,	%o3
	sra	%o1,	%i3,	%g2
	umul	%l1,	0x0DE5,	%l6
	movvc	%icc,	%l5,	%l0
	subcc	%l3,	%o2,	%g4
	move	%icc,	%g5,	%o7
	xor	%l2,	0x0198,	%i2
	ldd	[%l7 + 0x10],	%o4
	and	%g6,	%g1,	%i4
	fcmpd	%fcc0,	%f8,	%f4
	ldub	[%l7 + 0x0C],	%i1
	subc	%i7,	0x0B54,	%g3
	srlx	%o4,	0x02,	%g7
	sir	0x1092
	and	%o6,	0x1B21,	%i6
	edge8n	%l4,	%i0,	%o0
	umulcc	%i5,	%o1,	%o3
	edge16l	%i3,	%l1,	%l6
	fmovrdne	%g2,	%f8,	%f20
	alignaddrl	%l0,	%l3,	%o2
	movcc	%xcc,	%g4,	%g5
	stb	%l5,	[%l7 + 0x44]
	alignaddrl	%l2,	%o7,	%i2
	andcc	%g6,	%g1,	%o5
	ldub	[%l7 + 0x27],	%i4
	fand	%f12,	%f22,	%f10
	fmovrsne	%i1,	%f22,	%f17
	ld	[%l7 + 0x70],	%f4
	sllx	%i7,	%o4,	%g7
	fmovscc	%xcc,	%f4,	%f24
	edge8	%o6,	%i6,	%g3
	fmovdn	%icc,	%f29,	%f25
	xnorcc	%i0,	%o0,	%i5
	fmovrslz	%o1,	%f5,	%f27
	xor	%l4,	0x0E8D,	%i3
	edge8ln	%l1,	%l6,	%g2
	fsrc2	%f18,	%f20
	sdivcc	%l0,	0x1818,	%l3
	srax	%o2,	0x01,	%o3
	sdiv	%g5,	0x0AF1,	%l5
	sub	%l2,	%g4,	%o7
	ldsw	[%l7 + 0x64],	%g6
	edge32ln	%g1,	%o5,	%i2
	udivcc	%i1,	0x1C22,	%i7
	movrlez	%o4,	%i4,	%g7
	nop
	set	0x30, %g4
	std	%f0,	[%l7 + %g4]
	movg	%icc,	%i6,	%o6
	sub	%i0,	0x1C1F,	%g3
	ldsb	[%l7 + 0x67],	%o0
	fcmple32	%f16,	%f30,	%i5
	array16	%o1,	%l4,	%l1
	subccc	%l6,	%g2,	%i3
	nop
	set	0x2C, %o2
	stw	%l3,	[%l7 + %o2]
	movne	%xcc,	%o2,	%o3
	edge32n	%l0,	%l5,	%g5
	andcc	%g4,	0x06E1,	%o7
	edge16	%g6,	%l2,	%o5
	orncc	%i2,	0x01D9,	%i1
	stx	%i7,	[%l7 + 0x60]
	udivx	%o4,	0x0029,	%i4
	fmovs	%f0,	%f28
	sdiv	%g7,	0x0EC7,	%g1
	ld	[%l7 + 0x28],	%f21
	ldsh	[%l7 + 0x6A],	%i6
	addc	%o6,	%i0,	%g3
	sdivx	%o0,	0x0C95,	%o1
	sdiv	%l4,	0x1E89,	%l1
	movrgz	%i5,	0x39A,	%g2
	stw	%i3,	[%l7 + 0x1C]
	sethi	0x1BEF,	%l3
	fmuld8sux16	%f30,	%f11,	%f8
	edge16l	%o2,	%l6,	%l0
	and	%l5,	%g5,	%g4
	nop
	set	0x58, %o6
	ldd	[%l7 + %o6],	%f6
	andncc	%o7,	%g6,	%l2
	movleu	%icc,	%o5,	%i2
	fnegd	%f6,	%f26
	movre	%i1,	%i7,	%o4
	sir	0x1A68
	movrgz	%i4,	0x295,	%o3
	sdiv	%g1,	0x018A,	%i6
	fxors	%f22,	%f26,	%f27
	movleu	%icc,	%o6,	%i0
	movrlz	%g3,	0x235,	%g7
	movge	%icc,	%o1,	%l4
	movrgz	%l1,	%o0,	%g2
	fmovdpos	%icc,	%f7,	%f2
	smulcc	%i3,	%i5,	%o2
	sdiv	%l3,	0x09D7,	%l6
	mulx	%l0,	%g5,	%g4
	srlx	%l5,	0x15,	%o7
	popc	%g6,	%o5
	fmovsne	%icc,	%f14,	%f6
	fmovrdlz	%i2,	%f22,	%f4
	movge	%xcc,	%i1,	%i7
	orncc	%l2,	%i4,	%o4
	fmovs	%f10,	%f30
	fmuld8ulx16	%f22,	%f5,	%f24
	sdiv	%o3,	0x0A6C,	%g1
	subc	%o6,	0x17E2,	%i0
	movg	%icc,	%g3,	%g7
	ldsh	[%l7 + 0x30],	%o1
	movpos	%xcc,	%i6,	%l1
	fnot1s	%f18,	%f16
	movl	%xcc,	%l4,	%o0
	movrne	%g2,	0x216,	%i3
	edge32l	%i5,	%l3,	%o2
	udiv	%l0,	0x0D77,	%l6
	movvc	%icc,	%g4,	%g5
	xorcc	%o7,	0x138B,	%g6
	movne	%icc,	%o5,	%i2
	fcmple32	%f22,	%f6,	%i1
	sethi	0x089F,	%l5
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	stx	%o3,	[%l7 + 0x40]
	movn	%icc,	%i4,	%o6
	ldsh	[%l7 + 0x20],	%g1
	edge32n	%g3,	%i0,	%g7
	movleu	%icc,	%i6,	%o1
	movn	%xcc,	%l1,	%o0
	fpmerge	%f24,	%f19,	%f22
	fcmple16	%f22,	%f6,	%l4
	edge32ln	%g2,	%i5,	%i3
	lduw	[%l7 + 0x1C],	%l3
	edge8	%l0,	%o2,	%g4
	move	%xcc,	%l6,	%g5
	add	%g6,	%o7,	%i2
	sethi	0x0F71,	%o5
	fsrc2s	%f18,	%f26
	sth	%i1,	[%l7 + 0x2C]
	edge32	%l5,	%l2,	%o4
	array8	%i7,	%o3,	%o6
	sdivcc	%i4,	0x1CB7,	%g3
	sra	%i0,	%g7,	%g1
	movg	%xcc,	%i6,	%l1
	edge32	%o0,	%l4,	%o1
	movneg	%xcc,	%i5,	%i3
	fmovrdgez	%l3,	%f18,	%f22
	fmul8ulx16	%f24,	%f12,	%f28
	andn	%l0,	0x0FBE,	%o2
	addc	%g2,	0x1738,	%l6
	st	%f31,	[%l7 + 0x48]
	fmovdle	%icc,	%f4,	%f11
	edge8	%g5,	%g6,	%o7
	or	%g4,	0x1362,	%o5
	fmovrse	%i1,	%f19,	%f25
	ldd	[%l7 + 0x70],	%i2
	fcmped	%fcc1,	%f16,	%f2
	subccc	%l5,	0x09A7,	%l2
	xor	%i7,	%o4,	%o3
	fnot2s	%f9,	%f4
	fmovdge	%icc,	%f21,	%f28
	and	%o6,	0x1B1E,	%g3
	fmovdge	%icc,	%f2,	%f8
	fnot1	%f22,	%f0
	movneg	%icc,	%i0,	%g7
	sll	%i4,	0x06,	%g1
	xor	%l1,	0x0673,	%o0
	orn	%l4,	%i6,	%o1
	edge8n	%i5,	%i3,	%l3
	sdivcc	%l0,	0x1843,	%g2
	add	%o2,	%l6,	%g6
	xnorcc	%g5,	%g4,	%o7
	fxnor	%f26,	%f24,	%f26
	addc	%i1,	%o5,	%l5
	sethi	0x0C97,	%l2
	nop
	set	0x20, %o0
	ldd	[%l7 + %o0],	%f0
	addcc	%i7,	0x0294,	%o4
	movneg	%xcc,	%o3,	%o6
	mulscc	%i2,	%i0,	%g3
	or	%g7,	0x0DB3,	%g1
	sethi	0x00F2,	%i4
	fcmps	%fcc1,	%f11,	%f18
	fcmpne16	%f14,	%f12,	%o0
	nop
	set	0x4C, %l1
	stw	%l4,	[%l7 + %l1]
	addcc	%l1,	%i6,	%o1
	movrlez	%i5,	%l3,	%i3
	fexpand	%f4,	%f10
	fmuld8ulx16	%f29,	%f23,	%f24
	sub	%l0,	%g2,	%l6
	fmovspos	%xcc,	%f17,	%f0
	sth	%g6,	[%l7 + 0x3C]
	lduw	[%l7 + 0x68],	%g5
	mulscc	%g4,	%o7,	%i1
	edge16l	%o2,	%l5,	%o5
	edge16	%l2,	%o4,	%i7
	movrlz	%o3,	0x3CC,	%o6
	fmovsg	%xcc,	%f14,	%f30
	fmovrse	%i2,	%f29,	%f13
	edge16l	%i0,	%g3,	%g7
	orcc	%i4,	0x04EB,	%g1
	edge32n	%o0,	%l4,	%i6
	smulcc	%l1,	0x0436,	%o1
	alignaddr	%l3,	%i5,	%l0
	movcs	%xcc,	%g2,	%l6
	fmovsvc	%xcc,	%f13,	%f10
	ldd	[%l7 + 0x38],	%i2
	fcmpeq16	%f6,	%f12,	%g6
	subc	%g5,	%o7,	%i1
	movg	%xcc,	%o2,	%l5
	fornot2s	%f13,	%f20,	%f28
	sra	%g4,	0x10,	%l2
	fnot2s	%f10,	%f31
	movleu	%xcc,	%o4,	%o5
	subcc	%o3,	0x05E6,	%i7
	movgu	%icc,	%o6,	%i0
	mulx	%g3,	%g7,	%i2
	sllx	%i4,	0x16,	%o0
	fpadd16s	%f7,	%f11,	%f8
	orcc	%g1,	0x1F38,	%i6
	mova	%xcc,	%l4,	%o1
	sdivx	%l1,	0x0038,	%l3
	fmovdl	%xcc,	%f16,	%f0
	movre	%l0,	0x11D,	%i5
	stx	%l6,	[%l7 + 0x48]
	edge16ln	%g2,	%g6,	%g5
	andcc	%i3,	%o7,	%i1
	movrgez	%l5,	0x240,	%o2
	edge32n	%l2,	%g4,	%o4
	fandnot2s	%f29,	%f21,	%f25
	st	%f24,	[%l7 + 0x60]
	ld	[%l7 + 0x30],	%f21
	subcc	%o3,	%i7,	%o6
	fxnors	%f12,	%f4,	%f20
	alignaddrl	%i0,	%o5,	%g7
	lduh	[%l7 + 0x20],	%g3
	restore %i4, 0x0410, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc1	%f8,	%f18
	fmovrsgz	%g1,	%f13,	%f30
	movgu	%xcc,	%i2,	%i6
	sdivx	%l4,	0x0D2D,	%o1
	fmovrslz	%l1,	%f5,	%f30
	faligndata	%f0,	%f6,	%f26
	for	%f0,	%f26,	%f26
	popc	0x1A1B,	%l0
	save %l3, %i5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l6,	%f18,	%f26
	and	%g5,	%i3,	%g6
	fpsub16s	%f20,	%f11,	%f5
	xorcc	%o7,	0x00AE,	%l5
	alignaddr	%o2,	%l2,	%i1
	fmul8x16	%f21,	%f6,	%f16
	add	%o4,	0x0A12,	%o3
	edge8ln	%i7,	%o6,	%i0
	udivx	%o5,	0x14F4,	%g7
	array32	%g4,	%g3,	%i4
	fnegd	%f24,	%f6
	fandnot1s	%f19,	%f3,	%f0
	sir	0x13F1
	ldub	[%l7 + 0x66],	%g1
	movre	%i2,	%o0,	%i6
	fnegd	%f14,	%f26
	array32	%l4,	%o1,	%l0
	movrgz	%l1,	%i5,	%l3
	std	%f0,	[%l7 + 0x78]
	movrne	%g2,	%g5,	%i3
	edge16ln	%g6,	%o7,	%l6
	fcmpeq32	%f28,	%f2,	%l5
	ldsh	[%l7 + 0x7E],	%l2
	fmovdne	%xcc,	%f6,	%f8
	fcmpgt32	%f28,	%f16,	%i1
	srlx	%o2,	%o4,	%i7
	srl	%o3,	%i0,	%o6
	fzero	%f26
	ldub	[%l7 + 0x45],	%g7
	subcc	%o5,	%g3,	%g4
	edge8	%i4,	%g1,	%o0
	ldsb	[%l7 + 0x3D],	%i6
	fmovdg	%xcc,	%f9,	%f16
	fornot2	%f2,	%f30,	%f26
	movleu	%icc,	%l4,	%i2
	andncc	%o1,	%l0,	%i5
	fmovrse	%l3,	%f2,	%f20
	movre	%g2,	0x2BE,	%l1
	umulcc	%i3,	0x10DD,	%g6
	ldsw	[%l7 + 0x6C],	%o7
	andcc	%g5,	%l5,	%l6
	mulscc	%l2,	%i1,	%o2
	movcs	%xcc,	%o4,	%i7
	sdivcc	%o3,	0x0489,	%o6
	movvs	%xcc,	%i0,	%g7
	edge16n	%g3,	%o5,	%i4
	addc	%g1,	%g4,	%i6
	movcc	%icc,	%o0,	%l4
	ldsw	[%l7 + 0x28],	%i2
	orncc	%o1,	0x0CE8,	%l0
	fnors	%f14,	%f12,	%f23
	subc	%l3,	0x14E8,	%i5
	smul	%g2,	0x09F3,	%l1
	fornot2s	%f8,	%f12,	%f8
	fnegs	%f10,	%f0
	fmovsl	%icc,	%f28,	%f21
	mulx	%i3,	%g6,	%g5
	xnor	%o7,	0x0622,	%l6
	fmovd	%f18,	%f30
	stw	%l2,	[%l7 + 0x68]
	fmovde	%icc,	%f26,	%f3
	edge32n	%l5,	%i1,	%o4
	movg	%xcc,	%o2,	%o3
	movle	%xcc,	%o6,	%i0
	ldsw	[%l7 + 0x40],	%i7
	edge32l	%g3,	%g7,	%i4
	sll	%g1,	0x08,	%g4
	sll	%o5,	0x0E,	%o0
	and	%l4,	%i6,	%i2
	mulx	%l0,	%l3,	%i5
	andncc	%o1,	%g2,	%i3
	movvc	%icc,	%g6,	%g5
	ldd	[%l7 + 0x08],	%f6
	add	%l1,	0x1249,	%o7
	edge8ln	%l2,	%l5,	%l6
	fmovsne	%icc,	%f19,	%f18
	sir	0x0F94
	movpos	%icc,	%i1,	%o4
	fandnot1s	%f26,	%f22,	%f12
	for	%f0,	%f24,	%f20
	edge16n	%o2,	%o3,	%i0
	addcc	%o6,	0x17ED,	%i7
	edge8ln	%g3,	%g7,	%i4
	andn	%g4,	0x09A5,	%g1
	fmovspos	%xcc,	%f15,	%f13
	orncc	%o0,	0x0F84,	%o5
	edge32n	%l4,	%i2,	%i6
	fmovspos	%icc,	%f23,	%f10
	mova	%xcc,	%l0,	%i5
	edge32n	%l3,	%o1,	%i3
	ldsw	[%l7 + 0x24],	%g2
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	srl	%g6,	0x0B,	%o7
	ldd	[%l7 + 0x48],	%f28
	fabss	%f16,	%f10
	restore %l2, %l5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%xcc,	%o4,	%l6
	stx	%o2,	[%l7 + 0x38]
	edge32ln	%o3,	%o6,	%i7
	edge16l	%g3,	%g7,	%i4
	sll	%g4,	0x10,	%i0
	edge32	%o0,	%g1,	%l4
	fnand	%f24,	%f2,	%f12
	edge8n	%i2,	%o5,	%l0
	sth	%i6,	[%l7 + 0x52]
	edge16n	%i5,	%l3,	%o1
	movg	%xcc,	%g2,	%i3
	array32	%l1,	%g6,	%o7
	movvs	%icc,	%l2,	%l5
	fmovrsne	%g5,	%f31,	%f21
	fandnot2s	%f24,	%f20,	%f13
	movrne	%o4,	%l6,	%i1
	ldsh	[%l7 + 0x78],	%o2
	srl	%o3,	0x1F,	%o6
	xorcc	%g3,	%g7,	%i4
	fmovsle	%icc,	%f6,	%f10
	edge32n	%i7,	%g4,	%o0
	addcc	%i0,	%l4,	%i2
	edge8n	%g1,	%o5,	%l0
	fand	%f4,	%f12,	%f10
	movrgez	%i6,	%l3,	%i5
	fmovdneg	%icc,	%f22,	%f7
	sir	0x168B
	sdiv	%o1,	0x1A73,	%i3
	edge8	%g2,	%l1,	%g6
	fsrc2s	%f12,	%f15
	fpsub32s	%f13,	%f0,	%f1
	edge8ln	%o7,	%l5,	%g5
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	udivcc	%o2,	0x06ED,	%i1
	fxor	%f30,	%f14,	%f28
	movle	%icc,	%o3,	%g3
	movcs	%xcc,	%o6,	%g7
	edge8	%i7,	%i4,	%g4
	fpmerge	%f0,	%f22,	%f30
	subccc	%o0,	%i0,	%i2
	fpsub32	%f18,	%f24,	%f8
	movcc	%icc,	%l4,	%g1
	srlx	%o5,	0x06,	%l0
	edge32	%l3,	%i6,	%o1
	subcc	%i3,	%g2,	%i5
	movrgz	%l1,	0x2A5,	%o7
	fcmpeq16	%f4,	%f4,	%g6
	movrlz	%g5,	%o4,	%l6
	fmovsleu	%xcc,	%f7,	%f20
	movcc	%xcc,	%l2,	%l5
	movne	%xcc,	%i1,	%o3
	movvc	%xcc,	%g3,	%o6
	udivx	%o2,	0x1FE7,	%g7
	alignaddr	%i4,	%i7,	%o0
	edge32ln	%g4,	%i0,	%l4
	movrlz	%g1,	%o5,	%i2
	nop
	set	0x40, %o4
	ldx	[%l7 + %o4],	%l3
	stw	%l0,	[%l7 + 0x10]
	faligndata	%f0,	%f8,	%f8
	fcmpgt16	%f6,	%f8,	%o1
	movleu	%icc,	%i6,	%g2
	lduh	[%l7 + 0x2E],	%i5
	movg	%xcc,	%l1,	%i3
	lduh	[%l7 + 0x4E],	%g6
	fornot2	%f30,	%f12,	%f22
	srl	%o7,	%g5,	%o4
	addcc	%l6,	%l5,	%i1
	fmovdne	%xcc,	%f11,	%f5
	fmovdne	%icc,	%f30,	%f12
	fmovdge	%icc,	%f27,	%f4
	movpos	%icc,	%o3,	%g3
	mulx	%o6,	0x1592,	%o2
	fmovsg	%xcc,	%f20,	%f29
	ldsh	[%l7 + 0x18],	%g7
	fmovsa	%icc,	%f1,	%f8
	subc	%l2,	%i4,	%o0
	fcmped	%fcc0,	%f20,	%f2
	edge16n	%i7,	%g4,	%i0
	addccc	%l4,	0x0442,	%o5
	edge16l	%i2,	%l3,	%g1
	fmovscs	%xcc,	%f1,	%f4
	srl	%o1,	0x04,	%l0
	subccc	%i6,	0x07E0,	%g2
	move	%xcc,	%i5,	%l1
	movle	%xcc,	%i3,	%g6
	sir	0x166B
	fmovrdgz	%o7,	%f28,	%f0
	movleu	%xcc,	%g5,	%o4
	ldsh	[%l7 + 0x3C],	%l6
	movre	%i1,	%o3,	%l5
	movrlez	%g3,	0x210,	%o6
	movvc	%xcc,	%o2,	%g7
	fzero	%f26
	orcc	%i4,	%o0,	%l2
	ldsh	[%l7 + 0x2E],	%i7
	andncc	%i0,	%g4,	%o5
	fmovsleu	%icc,	%f14,	%f22
	restore %i2, %l4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%l3,	%o1,	%l0
	ld	[%l7 + 0x1C],	%f20
	fsrc2s	%f28,	%f28
	sra	%g2,	%i6,	%l1
	popc	%i5,	%g6
	mulx	%i3,	0x115A,	%g5
	sth	%o7,	[%l7 + 0x32]
	edge8	%o4,	%i1,	%l6
	fmovda	%xcc,	%f23,	%f20
	ldd	[%l7 + 0x48],	%l4
	smulcc	%o3,	%g3,	%o2
	movrlz	%g7,	0x1C4,	%i4
	ldd	[%l7 + 0x60],	%f8
	udiv	%o0,	0x1F93,	%o6
	fmovrsgz	%i7,	%f24,	%f3
	ld	[%l7 + 0x68],	%f14
	fone	%f8
	udiv	%l2,	0x0A3E,	%i0
	edge8ln	%o5,	%g4,	%l4
	mulscc	%g1,	%l3,	%o1
	srl	%l0,	%i2,	%g2
	add	%l1,	%i6,	%i5
	stw	%g6,	[%l7 + 0x28]
	movne	%icc,	%g5,	%i3
	fnot2s	%f31,	%f9
	sll	%o7,	0x08,	%i1
	fmovdn	%icc,	%f25,	%f28
	fxors	%f24,	%f6,	%f29
	ldx	[%l7 + 0x48],	%o4
	fornot1	%f4,	%f10,	%f26
	sllx	%l5,	0x0D,	%o3
	stx	%l6,	[%l7 + 0x30]
	movrne	%o2,	0x1F7,	%g7
	sdiv	%i4,	0x1978,	%o0
	movleu	%icc,	%g3,	%o6
	ldd	[%l7 + 0x28],	%f10
	alignaddr	%l2,	%i7,	%o5
	addc	%i0,	0x1D25,	%l4
	nop
	set	0x48, %o1
	ldx	[%l7 + %o1],	%g4
	mulscc	%l3,	%g1,	%o1
	addc	%l0,	%i2,	%g2
	edge32	%i6,	%l1,	%i5
	movl	%xcc,	%g5,	%g6
	movrne	%i3,	%o7,	%i1
	smulcc	%o4,	%l5,	%o3
	fmovde	%icc,	%f6,	%f14
	array32	%l6,	%o2,	%i4
	siam	0x2
	addc	%o0,	0x154A,	%g7
	movne	%icc,	%g3,	%l2
	movcc	%icc,	%i7,	%o5
	fmovrslz	%i0,	%f3,	%f30
	andncc	%l4,	%g4,	%l3
	fornot2	%f12,	%f12,	%f4
	edge8n	%g1,	%o6,	%o1
	xorcc	%l0,	%i2,	%i6
	nop
	set	0x1F, %g5
	ldub	[%l7 + %g5],	%g2
	ldx	[%l7 + 0x38],	%l1
	srlx	%g5,	0x1E,	%g6
	fpack32	%f20,	%f10,	%f18
	fornot2s	%f2,	%f31,	%f25
	addc	%i5,	%i3,	%o7
	st	%f0,	[%l7 + 0x20]
	addc	%i1,	0x0C5E,	%o4
	nop
	set	0x26, %l5
	ldub	[%l7 + %l5],	%l5
	movrlz	%l6,	0x057,	%o3
	srlx	%i4,	%o2,	%o0
	movge	%icc,	%g3,	%l2
	fmovrsgz	%g7,	%f0,	%f7
	movrne	%o5,	0x3EB,	%i7
	movvs	%icc,	%l4,	%i0
	fcmpne32	%f26,	%f16,	%g4
	orncc	%l3,	0x1FAB,	%o6
	srl	%o1,	%l0,	%g1
	ldsb	[%l7 + 0x1C],	%i6
	movcc	%icc,	%g2,	%l1
	edge32n	%g5,	%g6,	%i5
	movgu	%icc,	%i2,	%o7
	array16	%i1,	%o4,	%i3
	fcmple16	%f8,	%f12,	%l5
	movge	%icc,	%o3,	%i4
	array8	%l6,	%o0,	%o2
	fnand	%f28,	%f24,	%f26
	movg	%xcc,	%l2,	%g7
	add	%g3,	0x0CE9,	%o5
	movrgez	%i7,	%l4,	%i0
	fpsub16s	%f1,	%f6,	%f2
	add	%l3,	0x1E65,	%g4
	popc	0x07C0,	%o6
	srl	%l0,	0x1A,	%g1
	save %o1, 0x02CE, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x5C],	%f21
	ldsw	[%l7 + 0x7C],	%g2
	xor	%g5,	%g6,	%i5
	xorcc	%l1,	%o7,	%i2
	movvc	%icc,	%o4,	%i3
	move	%xcc,	%l5,	%o3
	umulcc	%i4,	0x03A2,	%l6
	sth	%i1,	[%l7 + 0x3A]
	popc	0x1D0A,	%o0
	movleu	%xcc,	%o2,	%g7
	edge32	%g3,	%l2,	%o5
	ldsh	[%l7 + 0x18],	%i7
	add	%l4,	0x1C7A,	%i0
	fmovspos	%icc,	%f10,	%f22
	movrlez	%l3,	0x3D3,	%g4
	srax	%l0,	%o6,	%g1
	sethi	0x0540,	%i6
	srl	%o1,	%g2,	%g5
	movcc	%icc,	%g6,	%l1
	mulx	%o7,	%i5,	%o4
	subc	%i2,	%l5,	%i3
	edge32ln	%i4,	%l6,	%i1
	movle	%icc,	%o3,	%o0
	mulscc	%g7,	0x09C3,	%o2
	st	%f9,	[%l7 + 0x18]
	movl	%icc,	%l2,	%g3
	orcc	%o5,	0x08B9,	%l4
	sdiv	%i0,	0x1513,	%l3
	xnor	%g4,	0x078A,	%i7
	ldx	[%l7 + 0x70],	%o6
	fpsub32s	%f7,	%f4,	%f20
	movleu	%icc,	%g1,	%l0
	fones	%f13
	fmovsne	%icc,	%f0,	%f0
	subccc	%i6,	0x1AB0,	%g2
	movvs	%xcc,	%g5,	%g6
	edge8n	%l1,	%o7,	%i5
	popc	0x0A52,	%o4
	fmovrslez	%o1,	%f27,	%f3
	addccc	%l5,	0x18C4,	%i3
	edge16n	%i4,	%l6,	%i2
	subc	%o3,	%o0,	%i1
	movpos	%xcc,	%o2,	%g7
	movrgz	%l2,	0x089,	%g3
	andncc	%o5,	%l4,	%i0
	lduh	[%l7 + 0x5A],	%g4
	add	%i7,	%l3,	%g1
	andn	%o6,	0x1AC7,	%i6
	alignaddrl	%l0,	%g5,	%g2
	and	%l1,	0x1A83,	%o7
	fmovdne	%xcc,	%f11,	%f28
	mulscc	%g6,	0x1A15,	%o4
	umulcc	%i5,	0x1F64,	%o1
	std	%f14,	[%l7 + 0x48]
	array16	%i3,	%i4,	%l6
	movrgz	%l5,	%i2,	%o3
	fmovdcs	%icc,	%f7,	%f2
	movg	%xcc,	%i1,	%o0
	sethi	0x1BF9,	%g7
	sethi	0x0656,	%l2
	xorcc	%g3,	0x14E4,	%o2
	addccc	%l4,	0x14EB,	%i0
	edge8	%g4,	%i7,	%o5
	edge8n	%l3,	%o6,	%i6
	sethi	0x1CCC,	%l0
	movrlez	%g1,	%g5,	%l1
	fmovrse	%o7,	%f3,	%f24
	ldx	[%l7 + 0x30],	%g6
	edge32	%o4,	%i5,	%o1
	edge8n	%g2,	%i3,	%l6
	st	%f13,	[%l7 + 0x14]
	addcc	%i4,	%i2,	%l5
	subcc	%o3,	%i1,	%g7
	fmovrslz	%o0,	%f25,	%f5
	ldsb	[%l7 + 0x36],	%l2
	movre	%g3,	%l4,	%o2
	fpmerge	%f15,	%f16,	%f6
	fmovrsgz	%i0,	%f20,	%f28
	umulcc	%g4,	0x17A0,	%o5
	movrlez	%l3,	%o6,	%i7
	movvs	%xcc,	%i6,	%g1
	movcc	%xcc,	%g5,	%l0
	addccc	%l1,	%o7,	%o4
	mova	%icc,	%g6,	%o1
	sethi	0x139F,	%g2
	stw	%i3,	[%l7 + 0x78]
	movneg	%xcc,	%i5,	%l6
	movrgz	%i2,	%i4,	%l5
	edge16l	%i1,	%o3,	%g7
	movrlez	%o0,	0x06B,	%l2
	umulcc	%g3,	%o2,	%l4
	movcc	%icc,	%g4,	%o5
	mova	%xcc,	%l3,	%o6
	andncc	%i0,	%i7,	%i6
	smul	%g1,	0x071D,	%l0
	movn	%xcc,	%g5,	%l1
	xorcc	%o7,	0x107B,	%o4
	ldd	[%l7 + 0x48],	%f14
	alignaddr	%o1,	%g6,	%g2
	fsrc2	%f26,	%f0
	lduw	[%l7 + 0x10],	%i3
	fmovrse	%i5,	%f27,	%f29
	array8	%l6,	%i2,	%i4
	fmovdgu	%xcc,	%f14,	%f23
	movrlz	%i1,	%o3,	%l5
	fpack16	%f30,	%f6
	xnor	%g7,	%l2,	%g3
	or	%o0,	0x1BB4,	%o2
	lduw	[%l7 + 0x30],	%l4
	save %o5, %g4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l3,	%i0,	%i6
	xorcc	%i7,	0x15C5,	%g1
	movleu	%xcc,	%l0,	%g5
	movvc	%icc,	%o7,	%o4
	smul	%o1,	%g6,	%g2
	sethi	0x0B9B,	%i3
	sir	0x1600
	orn	%l1,	0x08A2,	%i5
	andn	%l6,	%i2,	%i4
	ldub	[%l7 + 0x1B],	%i1
	udiv	%l5,	0x044B,	%g7
	udiv	%o3,	0x1059,	%g3
	fmovde	%xcc,	%f0,	%f23
	fmovdvs	%xcc,	%f24,	%f17
	sir	0x06B8
	xnorcc	%l2,	%o0,	%l4
	fnot1s	%f2,	%f24
	movg	%icc,	%o5,	%g4
	umulcc	%o6,	%l3,	%i0
	fand	%f8,	%f10,	%f6
	srax	%o2,	%i7,	%i6
	orn	%g1,	0x1971,	%l0
	movrlz	%g5,	%o4,	%o7
	movgu	%icc,	%g6,	%g2
	fpmerge	%f16,	%f31,	%f30
	std	%f14,	[%l7 + 0x48]
	movneg	%icc,	%i3,	%l1
	fones	%f26
	addccc	%o1,	0x0303,	%l6
	fmovsvc	%xcc,	%f29,	%f30
	fandnot1s	%f20,	%f14,	%f6
	sll	%i2,	0x12,	%i4
	lduw	[%l7 + 0x34],	%i1
	fpackfix	%f30,	%f14
	movrgz	%i5,	0x013,	%l5
	edge32	%o3,	%g3,	%l2
	xor	%g7,	%o0,	%o5
	nop
	set	0x38, %o3
	ldx	[%l7 + %o3],	%l4
	xor	%o6,	%l3,	%g4
	fmovsg	%xcc,	%f9,	%f4
	fmovdg	%icc,	%f13,	%f28
	addccc	%i0,	0x1642,	%i7
	movleu	%icc,	%o2,	%i6
	alignaddrl	%l0,	%g1,	%g5
	movge	%xcc,	%o7,	%o4
	array8	%g6,	%i3,	%l1
	movge	%xcc,	%g2,	%o1
	edge8n	%l6,	%i4,	%i2
	sth	%i5,	[%l7 + 0x1A]
	movrlz	%i1,	%o3,	%g3
	movre	%l5,	0x2EB,	%l2
	movl	%xcc,	%o0,	%o5
	umulcc	%g7,	0x0D82,	%o6
	nop
	set	0x28, %i2
	lduw	[%l7 + %i2],	%l4
	sdiv	%g4,	0x016D,	%l3
	nop
	set	0x34, %g2
	ldsh	[%l7 + %g2],	%i7
	movl	%xcc,	%o2,	%i0
	movcc	%icc,	%l0,	%i6
	subcc	%g5,	%g1,	%o7
	fmovdn	%icc,	%f7,	%f26
	ldx	[%l7 + 0x78],	%o4
	edge32n	%i3,	%g6,	%g2
	stb	%l1,	[%l7 + 0x6B]
	mova	%xcc,	%l6,	%o1
	array16	%i4,	%i5,	%i1
	fcmpne16	%f26,	%f6,	%i2
	ldx	[%l7 + 0x68],	%g3
	fornot2	%f12,	%f2,	%f24
	umul	%o3,	%l5,	%l2
	edge16	%o5,	%o0,	%g7
	stw	%l4,	[%l7 + 0x40]
	edge16l	%g4,	%o6,	%i7
	fmuld8sux16	%f18,	%f16,	%f12
	mulx	%l3,	0x01DE,	%o2
	movge	%icc,	%i0,	%i6
	fcmple32	%f10,	%f10,	%g5
	ldx	[%l7 + 0x18],	%g1
	andcc	%o7,	0x085A,	%o4
	movvc	%xcc,	%i3,	%l0
	movrgz	%g6,	0x29D,	%g2
	movrlz	%l1,	%l6,	%o1
	movrgez	%i4,	%i5,	%i2
	movrgez	%g3,	%o3,	%l5
	std	%f22,	[%l7 + 0x28]
	fone	%f24
	fmovsg	%xcc,	%f3,	%f24
	edge16n	%i1,	%o5,	%o0
	movneg	%xcc,	%g7,	%l4
	sll	%l2,	%o6,	%i7
	subc	%g4,	%o2,	%i0
	andcc	%l3,	%i6,	%g5
	fmul8x16au	%f18,	%f1,	%f0
	edge32ln	%g1,	%o7,	%o4
	fpsub16s	%f3,	%f20,	%f1
	std	%f16,	[%l7 + 0x70]
	add	%l0,	0x1901,	%i3
	fmovscc	%xcc,	%f11,	%f4
	ldd	[%l7 + 0x78],	%g2
	fcmpeq32	%f0,	%f20,	%g6
	movne	%icc,	%l6,	%o1
	edge32n	%i4,	%l1,	%i5
	sllx	%g3,	%o3,	%i2
	sra	%i1,	0x1B,	%l5
	subcc	%o0,	0x0248,	%g7
	fmovdpos	%icc,	%f16,	%f0
	lduw	[%l7 + 0x20],	%o5
	stx	%l4,	[%l7 + 0x58]
	movge	%xcc,	%o6,	%l2
	xnor	%i7,	%g4,	%o2
	ldub	[%l7 + 0x61],	%i0
	move	%icc,	%l3,	%g5
	movre	%i6,	0x367,	%g1
	orncc	%o7,	0x0540,	%l0
	srax	%o4,	%g2,	%i3
	ldd	[%l7 + 0x40],	%f26
	fpsub32s	%f8,	%f13,	%f1
	movne	%icc,	%g6,	%o1
	fmuld8ulx16	%f8,	%f21,	%f2
	andncc	%l6,	%i4,	%l1
	fpackfix	%f20,	%f9
	movpos	%icc,	%i5,	%g3
	edge32n	%i2,	%i1,	%o3
	edge32ln	%o0,	%g7,	%o5
	xnorcc	%l5,	0x10DC,	%l4
	sdivcc	%l2,	0x165B,	%o6
	edge16n	%g4,	%o2,	%i7
	movcs	%xcc,	%l3,	%i0
	fsrc1	%f26,	%f0
	andcc	%i6,	%g1,	%o7
	smul	%g5,	%o4,	%g2
	edge32	%i3,	%l0,	%g6
	sra	%o1,	%i4,	%l6
	fmuld8sux16	%f3,	%f19,	%f12
	srax	%l1,	0x08,	%g3
	fmovdpos	%icc,	%f1,	%f18
	ldsh	[%l7 + 0x16],	%i2
	popc	0x11C2,	%i5
	st	%f7,	[%l7 + 0x08]
	fzero	%f12
	ld	[%l7 + 0x70],	%f12
	ldd	[%l7 + 0x38],	%i0
	movcc	%icc,	%o0,	%g7
	umulcc	%o5,	%o3,	%l4
	fpadd32s	%f14,	%f18,	%f28
	fcmps	%fcc1,	%f1,	%f4
	udivcc	%l5,	0x01CA,	%l2
	std	%f18,	[%l7 + 0x20]
	sllx	%o6,	0x0F,	%g4
	fmovdn	%icc,	%f11,	%f18
	fmovdvs	%xcc,	%f17,	%f26
	fmovrslez	%i7,	%f30,	%f22
	srlx	%o2,	0x05,	%i0
	fnand	%f0,	%f2,	%f22
	popc	%i6,	%l3
	mulscc	%o7,	%g1,	%o4
	movleu	%xcc,	%g5,	%g2
	sir	0x03CF
	save %i3, %l0, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f3,	%f30
	mulscc	%i4,	%g6,	%l1
	fabsd	%f26,	%f8
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	array32	%g3,	%i5,	%o0
	add	%g7,	0x0827,	%o5
	edge32l	%o3,	%i1,	%l5
	smulcc	%l4,	%o6,	%l2
	ldsb	[%l7 + 0x5D],	%i7
	edge8	%g4,	%o2,	%i6
	edge16	%i0,	%l3,	%g1
	movcs	%xcc,	%o7,	%o4
	array8	%g5,	%i3,	%g2
	subc	%o1,	0x09A4,	%l0
	lduw	[%l7 + 0x34],	%i4
	lduh	[%l7 + 0x76],	%g6
	ldd	[%l7 + 0x48],	%f28
	fnot1s	%f7,	%f29
	fmovdgu	%xcc,	%f0,	%f9
	subc	%l6,	0x0FFA,	%i2
	alignaddr	%g3,	%i5,	%o0
	fpadd16s	%f15,	%f0,	%f9
	sdivx	%g7,	0x1C75,	%l1
	xnorcc	%o3,	%i1,	%l5
	fmovsleu	%xcc,	%f22,	%f0
	fmovdpos	%xcc,	%f23,	%f14
	xor	%l4,	%o5,	%l2
	movcc	%icc,	%o6,	%i7
	ldub	[%l7 + 0x5E],	%g4
	ldd	[%l7 + 0x58],	%o2
	fones	%f25
	ldsw	[%l7 + 0x7C],	%i6
	movpos	%xcc,	%i0,	%g1
	xnorcc	%o7,	%l3,	%g5
	xorcc	%o4,	%g2,	%i3
	or	%o1,	0x027B,	%l0
	edge8l	%i4,	%l6,	%i2
	subccc	%g6,	0x0A30,	%g3
	orncc	%o0,	%i5,	%l1
	fmul8x16al	%f22,	%f1,	%f28
	subc	%o3,	%i1,	%g7
	movrlez	%l5,	%l4,	%l2
	orn	%o5,	0x03C2,	%i7
	udiv	%g4,	0x0457,	%o6
	alignaddrl	%i6,	%i0,	%o2
	sethi	0x0445,	%g1
	fmovda	%icc,	%f1,	%f12
	ld	[%l7 + 0x44],	%f0
	lduw	[%l7 + 0x24],	%l3
	ldd	[%l7 + 0x40],	%o6
	movcs	%xcc,	%o4,	%g2
	lduh	[%l7 + 0x10],	%i3
	ldd	[%l7 + 0x18],	%o0
	movne	%xcc,	%l0,	%g5
	sll	%l6,	%i4,	%g6
	movne	%xcc,	%i2,	%g3
	faligndata	%f28,	%f16,	%f18
	fcmps	%fcc3,	%f8,	%f11
	andn	%i5,	%l1,	%o3
	edge16l	%o0,	%i1,	%g7
	fnands	%f12,	%f30,	%f4
	movle	%icc,	%l4,	%l2
	and	%o5,	%l5,	%g4
	movneg	%icc,	%i7,	%o6
	sdivx	%i0,	0x12C3,	%i6
	alignaddrl	%o2,	%g1,	%l3
	add	%o4,	0x0FD1,	%g2
	edge32	%i3,	%o1,	%l0
	edge32	%g5,	%l6,	%i4
	movrgez	%o7,	%g6,	%i2
	st	%f14,	[%l7 + 0x10]
	umulcc	%g3,	%i5,	%l1
	srax	%o3,	%i1,	%g7
	ldd	[%l7 + 0x48],	%l4
	restore %o0, 0x048B, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l5,	0x07,	%o5
	movcs	%icc,	%g4,	%o6
	movl	%xcc,	%i7,	%i6
	sethi	0x187D,	%i0
	sir	0x11EC
	xnor	%g1,	0x0F3A,	%o2
	save %o4, %g2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x1E],	%l3
	fpsub16	%f2,	%f4,	%f30
	fmul8x16au	%f8,	%f21,	%f26
	edge16	%l0,	%o1,	%g5
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	xorcc	%o7,	%i2,	%g3
	subc	%i5,	0x0BBB,	%l1
	sdiv	%g6,	0x006C,	%o3
	sub	%g7,	%i1,	%l4
	fmovdg	%icc,	%f16,	%f31
	movrlz	%o0,	%l5,	%o5
	movre	%l2,	0x3B4,	%g4
	sth	%i7,	[%l7 + 0x34]
	sth	%i6,	[%l7 + 0x56]
	add	%i0,	0x1B34,	%g1
	srlx	%o2,	%o6,	%o4
	edge16n	%g2,	%i3,	%l3
	ldd	[%l7 + 0x58],	%f12
	edge32ln	%o1,	%g5,	%l0
	smul	%i4,	0x1A10,	%l6
	sdivcc	%i2,	0x1570,	%o7
	subc	%i5,	%l1,	%g6
	save %o3, %g3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l4,	0x11,	%g7
	edge16	%o0,	%o5,	%l2
	mulscc	%g4,	0x1742,	%i7
	fnors	%f10,	%f16,	%f16
	edge16n	%i6,	%i0,	%g1
	subccc	%o2,	0x05AE,	%o6
	subccc	%o4,	0x1653,	%g2
	sethi	0x06D5,	%i3
	edge8	%l3,	%l5,	%o1
	sra	%g5,	0x09,	%l0
	orn	%l6,	0x0AAA,	%i2
	movle	%icc,	%i4,	%o7
	ldx	[%l7 + 0x20],	%l1
	fmovse	%xcc,	%f17,	%f19
	srl	%i5,	0x0C,	%g6
	edge8	%g3,	%i1,	%l4
	movcc	%icc,	%g7,	%o0
	xorcc	%o5,	0x0160,	%o3
	fpadd32	%f20,	%f22,	%f8
	srax	%g4,	%l2,	%i6
	fmovscs	%icc,	%f8,	%f1
	sir	0x19FF
	movg	%xcc,	%i0,	%i7
	or	%o2,	0x0A2E,	%o6
	fornot1	%f24,	%f8,	%f28
	andn	%o4,	0x0B58,	%g1
	mova	%xcc,	%i3,	%l3
	ldd	[%l7 + 0x48],	%l4
	stw	%o1,	[%l7 + 0x68]
	orcc	%g5,	0x17E6,	%l0
	umul	%g2,	%i2,	%l6
	umul	%o7,	%i4,	%i5
	xnorcc	%g6,	%g3,	%l1
	srl	%l4,	0x02,	%g7
	fcmple16	%f4,	%f14,	%o0
	movn	%xcc,	%i1,	%o3
	mulx	%o5,	%g4,	%l2
	fmovd	%f20,	%f30
	movge	%xcc,	%i0,	%i6
	fand	%f14,	%f16,	%f28
	movrgez	%o2,	0x061,	%o6
	fmovdle	%icc,	%f18,	%f15
	ldsh	[%l7 + 0x62],	%i7
	or	%o4,	%g1,	%l3
	sth	%l5,	[%l7 + 0x14]
	movre	%o1,	%i3,	%g5
	alignaddrl	%l0,	%g2,	%i2
	movl	%icc,	%o7,	%l6
	fandnot2s	%f7,	%f20,	%f17
	edge16l	%i4,	%i5,	%g3
	popc	0x1980,	%g6
	or	%l4,	%l1,	%g7
	fzero	%f30
	movge	%xcc,	%o0,	%o3
	edge16n	%i1,	%g4,	%o5
	addcc	%i0,	0x1757,	%l2
	fxnors	%f20,	%f0,	%f29
	movpos	%icc,	%i6,	%o6
	udivcc	%o2,	0x0696,	%i7
	smul	%o4,	%g1,	%l3
	movl	%icc,	%l5,	%i3
	movgu	%icc,	%g5,	%l0
	fmovs	%f11,	%f1
	sll	%g2,	0x14,	%o1
	orn	%o7,	%l6,	%i4
	edge8n	%i5,	%i2,	%g6
	save %g3, 0x0723, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l1,	0x34E,	%o0
	fmovdcc	%xcc,	%f24,	%f18
	ld	[%l7 + 0x40],	%f9
	subccc	%o3,	0x153F,	%i1
	fmul8x16al	%f5,	%f12,	%f26
	ldx	[%l7 + 0x78],	%g7
	fmovsgu	%icc,	%f16,	%f28
	srax	%g4,	%i0,	%o5
	edge16n	%i6,	%o6,	%l2
	fnot1s	%f6,	%f14
	restore %i7, %o2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%g1,	%l5,	%l3
	fmovrse	%i3,	%f24,	%f5
	orcc	%l0,	%g5,	%o1
	movcc	%icc,	%o7,	%l6
	sdivx	%i4,	0x0AC9,	%i5
	fmovdvc	%icc,	%f17,	%f6
	nop
	set	0x7A, %l4
	lduh	[%l7 + %l4],	%g2
	add	%g6,	0x0157,	%g3
	movgu	%icc,	%i2,	%l4
	sethi	0x12C8,	%l1
	fmovdvc	%xcc,	%f23,	%f16
	ldsh	[%l7 + 0x5C],	%o3
	fcmpne32	%f18,	%f30,	%i1
	addcc	%g7,	0x0C1F,	%g4
	sub	%i0,	0x04E8,	%o0
	and	%o5,	%o6,	%l2
	sll	%i6,	%i7,	%o4
	movvs	%icc,	%o2,	%l5
	ldub	[%l7 + 0x55],	%g1
	orn	%l3,	0x0372,	%i3
	move	%icc,	%g5,	%o1
	udivcc	%o7,	0x16E5,	%l0
	fmul8ulx16	%f26,	%f6,	%f2
	ld	[%l7 + 0x7C],	%f3
	movge	%xcc,	%l6,	%i4
	sub	%g2,	0x09FE,	%g6
	addccc	%i5,	%i2,	%g3
	fmovsne	%xcc,	%f6,	%f1
	xnorcc	%l4,	0x13A3,	%o3
	ld	[%l7 + 0x40],	%f15
	movrlz	%i1,	0x0D9,	%g7
	sll	%g4,	%l1,	%i0
	ldx	[%l7 + 0x58],	%o0
	mulscc	%o6,	0x1649,	%l2
	fnot2	%f22,	%f4
	fmovsg	%icc,	%f22,	%f25
	ldsh	[%l7 + 0x0A],	%i6
	movcs	%icc,	%i7,	%o5
	ldsh	[%l7 + 0x38],	%o2
	fpackfix	%f2,	%f15
	ldx	[%l7 + 0x08],	%o4
	edge8n	%g1,	%l3,	%i3
	addccc	%l5,	0x11F5,	%g5
	popc	%o7,	%l0
	fcmpd	%fcc3,	%f14,	%f14
	ldx	[%l7 + 0x38],	%l6
	fpack16	%f0,	%f27
	movneg	%xcc,	%i4,	%g2
	sth	%o1,	[%l7 + 0x32]
	fpsub16s	%f15,	%f5,	%f28
	fmovda	%icc,	%f10,	%f20
	edge16n	%g6,	%i2,	%g3
	sth	%l4,	[%l7 + 0x60]
	stw	%i5,	[%l7 + 0x1C]
	movrgez	%i1,	%g7,	%g4
	fmovdl	%icc,	%f9,	%f14
	edge16l	%l1,	%o3,	%o0
	sra	%i0,	0x07,	%l2
	sth	%i6,	[%l7 + 0x26]
	subc	%o6,	%i7,	%o2
	sra	%o5,	%o4,	%l3
	edge32	%g1,	%l5,	%g5
	xorcc	%i3,	%o7,	%l6
	movneg	%xcc,	%l0,	%g2
	fmovrslez	%o1,	%f10,	%f30
	movrne	%i4,	%g6,	%g3
	fmovse	%xcc,	%f31,	%f21
	array32	%l4,	%i5,	%i1
	orncc	%g7,	0x1CE5,	%i2
	ldd	[%l7 + 0x70],	%f20
	sir	0x0F99
	ldsw	[%l7 + 0x48],	%g4
	movvs	%icc,	%l1,	%o0
	stb	%i0,	[%l7 + 0x77]
	st	%f14,	[%l7 + 0x08]
	stw	%l2,	[%l7 + 0x4C]
	subc	%o3,	0x0460,	%i6
	movge	%icc,	%i7,	%o6
	andn	%o2,	0x1CFD,	%o5
	smul	%l3,	0x02AD,	%o4
	stx	%g1,	[%l7 + 0x48]
	movneg	%icc,	%l5,	%i3
	nop
	set	0x2A, %g3
	ldsb	[%l7 + %g3],	%g5
	addc	%l6,	0x0B0C,	%l0
	mulx	%g2,	%o7,	%o1
	array32	%i4,	%g3,	%g6
	fornot1	%f20,	%f20,	%f30
	fpadd32	%f18,	%f26,	%f0
	umul	%l4,	0x0281,	%i1
	fnot1s	%f13,	%f31
	move	%icc,	%i5,	%i2
	edge8ln	%g7,	%g4,	%l1
	add	%i0,	0x0123,	%o0
	sth	%o3,	[%l7 + 0x56]
	movn	%icc,	%i6,	%i7
	fnand	%f26,	%f6,	%f10
	stx	%o6,	[%l7 + 0x30]
	or	%o2,	0x17DE,	%l2
	fmuld8sux16	%f12,	%f24,	%f8
	fmovrsne	%o5,	%f1,	%f4
	fmovsneg	%xcc,	%f29,	%f20
	ldd	[%l7 + 0x28],	%l2
	ldd	[%l7 + 0x60],	%f2
	mulscc	%o4,	0x1218,	%l5
	fmovsg	%icc,	%f23,	%f14
	movle	%icc,	%g1,	%g5
	fmovsl	%icc,	%f0,	%f8
	xnor	%l6,	%l0,	%i3
	std	%f10,	[%l7 + 0x08]
	ldsb	[%l7 + 0x27],	%o7
	edge32ln	%g2,	%i4,	%o1
	edge32l	%g3,	%l4,	%i1
	srl	%i5,	%g6,	%i2
	lduw	[%l7 + 0x7C],	%g7
	array8	%g4,	%l1,	%o0
	fpadd16	%f14,	%f8,	%f20
	udivcc	%i0,	0x0917,	%i6
	edge32n	%i7,	%o3,	%o2
	faligndata	%f18,	%f30,	%f0
	sir	0x02B2
	nop
	set	0x12, %o7
	stb	%l2,	[%l7 + %o7]
	fmovdvs	%xcc,	%f26,	%f9
	alignaddr	%o5,	%l3,	%o4
	and	%o6,	0x0B5F,	%l5
	fpack32	%f18,	%f0,	%f22
	alignaddrl	%g1,	%g5,	%l6
	movcs	%xcc,	%i3,	%o7
	andcc	%l0,	%g2,	%o1
	umulcc	%g3,	%l4,	%i4
	movrgez	%i1,	0x27E,	%i5
	ldd	[%l7 + 0x70],	%i2
	movrne	%g6,	%g4,	%l1
	lduh	[%l7 + 0x20],	%o0
	fornot2s	%f15,	%f20,	%f17
	edge32	%i0,	%i6,	%i7
	movre	%g7,	0x244,	%o2
	fpack32	%f24,	%f4,	%f24
	add	%l2,	%o5,	%l3
	ldub	[%l7 + 0x5F],	%o3
	array32	%o6,	%l5,	%o4
	umulcc	%g1,	0x1D82,	%l6
	movrlz	%g5,	0x125,	%i3
	movne	%xcc,	%o7,	%g2
	sdivx	%o1,	0x1B21,	%g3
	srax	%l0,	%l4,	%i4
	fmovd	%f6,	%f26
	fnot2s	%f4,	%f29
	ldsw	[%l7 + 0x18],	%i5
	subccc	%i1,	%g6,	%i2
	fcmps	%fcc2,	%f25,	%f15
	andncc	%g4,	%o0,	%l1
	xnor	%i6,	%i0,	%g7
	fnegs	%f15,	%f11
	sir	0x04A3
	movpos	%xcc,	%i7,	%l2
	movg	%icc,	%o2,	%o5
	srlx	%o3,	0x1F,	%l3
	movn	%icc,	%l5,	%o4
	fmovsg	%xcc,	%f15,	%f11
	mulx	%o6,	0x108D,	%l6
	std	%f6,	[%l7 + 0x58]
	stx	%g5,	[%l7 + 0x30]
	fcmpeq16	%f30,	%f28,	%g1
	sth	%i3,	[%l7 + 0x5A]
	edge32l	%g2,	%o7,	%g3
	sdiv	%o1,	0x1252,	%l0
	ldd	[%l7 + 0x78],	%f12
	addccc	%i4,	0x155B,	%i5
	ldx	[%l7 + 0x40],	%l4
	movrgez	%i1,	0x3C1,	%i2
	fnegs	%f30,	%f17
	xnorcc	%g6,	0x0328,	%o0
	or	%g4,	0x03DA,	%i6
	ldub	[%l7 + 0x2D],	%l1
	fmovda	%icc,	%f18,	%f22
	array16	%g7,	%i0,	%l2
	fmovspos	%icc,	%f6,	%f30
	movneg	%xcc,	%i7,	%o5
	movneg	%xcc,	%o2,	%l3
	movcc	%icc,	%o3,	%o4
	or	%o6,	0x1B74,	%l5
	movg	%xcc,	%g5,	%l6
	movpos	%icc,	%i3,	%g2
	fsrc1	%f18,	%f28
	movle	%icc,	%g1,	%g3
	fmovsa	%icc,	%f0,	%f27
	fmovdvc	%icc,	%f23,	%f26
	fpadd16	%f28,	%f16,	%f8
	mulscc	%o1,	0x166E,	%o7
	xnorcc	%l0,	0x142F,	%i4
	st	%f7,	[%l7 + 0x68]
	edge16n	%l4,	%i1,	%i2
	fmovda	%icc,	%f21,	%f15
	movrlz	%i5,	%o0,	%g6
	andn	%i6,	%g4,	%g7
	edge16l	%l1,	%l2,	%i0
	ld	[%l7 + 0x5C],	%f23
	movrgez	%i7,	0x1AE,	%o2
	fcmpgt32	%f20,	%f14,	%l3
	ldsh	[%l7 + 0x2E],	%o3
	fmovsa	%icc,	%f1,	%f10
	sllx	%o5,	0x07,	%o6
	sth	%o4,	[%l7 + 0x7E]
	fabsd	%f0,	%f0
	movge	%xcc,	%l5,	%g5
	mova	%xcc,	%l6,	%i3
	st	%f29,	[%l7 + 0x24]
	fnegd	%f6,	%f24
	movn	%xcc,	%g1,	%g2
	alignaddrl	%o1,	%o7,	%l0
	fors	%f18,	%f30,	%f23
	orncc	%g3,	0x0839,	%l4
	fpackfix	%f8,	%f20
	mova	%xcc,	%i4,	%i2
	udivx	%i1,	0x1901,	%i5
	xor	%g6,	0x1A87,	%i6
	movre	%g4,	0x1BC,	%g7
	movge	%xcc,	%l1,	%o0
	subccc	%l2,	%i0,	%i7
	andn	%o2,	%l3,	%o3
	fxnor	%f22,	%f10,	%f0
	sllx	%o6,	%o5,	%o4
	sir	0x1706
	movge	%icc,	%l5,	%l6
	edge16	%g5,	%g1,	%i3
	srax	%o1,	%g2,	%l0
	edge16n	%g3,	%o7,	%l4
	movneg	%icc,	%i2,	%i4
	smul	%i1,	%i5,	%i6
	edge16n	%g4,	%g7,	%g6
	sll	%l1,	%o0,	%l2
	addc	%i7,	%i0,	%o2
	srax	%l3,	0x00,	%o6
	ld	[%l7 + 0x14],	%f1
	fone	%f14
	edge16l	%o5,	%o3,	%l5
	fmovsvs	%xcc,	%f1,	%f26
	fzeros	%f13
	andn	%o4,	0x0D17,	%l6
	andncc	%g5,	%g1,	%o1
	fmovsneg	%xcc,	%f16,	%f11
	movleu	%xcc,	%i3,	%g2
	stx	%l0,	[%l7 + 0x38]
	fnot2s	%f10,	%f21
	sub	%o7,	0x1998,	%g3
	fmuld8sux16	%f0,	%f2,	%f12
	fmovrse	%l4,	%f25,	%f8
	alignaddr	%i4,	%i2,	%i1
	alignaddrl	%i5,	%g4,	%i6
	fcmpes	%fcc3,	%f6,	%f22
	movcc	%icc,	%g7,	%g6
	ldsb	[%l7 + 0x2D],	%o0
	edge16l	%l2,	%l1,	%i7
	array32	%i0,	%o2,	%l3
	fpackfix	%f2,	%f22
	mova	%xcc,	%o5,	%o3
	andncc	%l5,	%o4,	%l6
	edge16l	%g5,	%o6,	%o1
	sth	%g1,	[%l7 + 0x7A]
	fpmerge	%f6,	%f14,	%f0
	edge16	%g2,	%i3,	%l0
	umul	%o7,	%l4,	%g3
	ldub	[%l7 + 0x22],	%i2
	andncc	%i4,	%i1,	%g4
	orncc	%i6,	0x1B56,	%g7
	stw	%g6,	[%l7 + 0x58]
	nop
	set	0x0A, %l3
	ldsh	[%l7 + %l3],	%i5
	fmovsle	%xcc,	%f26,	%f11
	nop
	set	0x2B, %i0
	ldub	[%l7 + %i0],	%o0
	array16	%l1,	%l2,	%i7
	sub	%o2,	%l3,	%o5
	fmovdvc	%xcc,	%f10,	%f15
	sir	0x1AB6
	udivcc	%i0,	0x1F52,	%o3
	fmovdcs	%xcc,	%f8,	%f8
	subc	%l5,	%o4,	%l6
	sth	%g5,	[%l7 + 0x28]
	ldsw	[%l7 + 0x18],	%o1
	srl	%o6,	%g2,	%i3
	fornot2	%f22,	%f20,	%f18
	srl	%g1,	%o7,	%l4
	movpos	%icc,	%g3,	%l0
	movle	%xcc,	%i4,	%i1
	fxors	%f29,	%f21,	%f7
	movne	%xcc,	%i2,	%g4
	fmovsn	%xcc,	%f14,	%f2
	edge16ln	%g7,	%i6,	%g6
	mulscc	%i5,	0x0137,	%l1
	ldd	[%l7 + 0x30],	%f6
	fmovrde	%l2,	%f24,	%f10
	orncc	%o0,	%o2,	%l3
	sub	%o5,	0x037A,	%i7
	sir	0x117F
	edge32n	%o3,	%i0,	%o4
	and	%l5,	0x1DA5,	%l6
	edge32l	%o1,	%o6,	%g5
	fxors	%f25,	%f14,	%f4
	ldsw	[%l7 + 0x74],	%i3
	fnot1	%f2,	%f30
	edge32l	%g1,	%g2,	%l4
	ldub	[%l7 + 0x3E],	%g3
	udivx	%l0,	0x0FF0,	%i4
	fmovs	%f7,	%f10
	mulscc	%o7,	0x0FF8,	%i1
	fabsd	%f16,	%f14
	fmovscs	%xcc,	%f3,	%f17
	subcc	%g4,	%g7,	%i2
	save %g6, 0x14E3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f24,	%f12,	%f4
	addcc	%l1,	0x030C,	%l2
	fpack32	%f24,	%f26,	%f24
	edge8	%o0,	%o2,	%l3
	array16	%i6,	%i7,	%o5
	add	%i0,	%o3,	%l5
	andncc	%l6,	%o4,	%o6
	movg	%xcc,	%o1,	%g5
	sdiv	%i3,	0x11B1,	%g1
	fcmpeq16	%f2,	%f0,	%g2
	movneg	%icc,	%l4,	%g3
	edge8n	%i4,	%o7,	%i1
	mulscc	%g4,	0x003E,	%l0
	alignaddrl	%g7,	%g6,	%i2
	stb	%i5,	[%l7 + 0x12]
	movre	%l1,	%o0,	%o2
	movcc	%xcc,	%l2,	%l3
	array8	%i6,	%o5,	%i7
	andcc	%o3,	0x125B,	%l5
	ldd	[%l7 + 0x18],	%i6
	udiv	%o4,	0x1D87,	%o6
	sth	%i0,	[%l7 + 0x0E]
	ldsh	[%l7 + 0x66],	%g5
	subcc	%o1,	0x0B9D,	%g1
	ldsw	[%l7 + 0x6C],	%g2
	movrlez	%l4,	0x243,	%i3
	sllx	%g3,	%o7,	%i4
	mulx	%g4,	0x123A,	%l0
	sllx	%i1,	%g6,	%g7
	array8	%i2,	%l1,	%o0
	smulcc	%i5,	0x1156,	%o2
	sdivcc	%l3,	0x02CE,	%i6
	and	%o5,	%i7,	%l2
	mulscc	%l5,	%l6,	%o4
	movl	%icc,	%o3,	%o6
	orn	%g5,	0x1EE8,	%i0
	movrgez	%o1,	%g2,	%l4
	srax	%g1,	0x06,	%i3
	andcc	%g3,	%o7,	%g4
	lduh	[%l7 + 0x18],	%l0
	edge32n	%i4,	%g6,	%g7
	ldsh	[%l7 + 0x24],	%i2
	fmovrdgez	%i1,	%f20,	%f0
	sll	%l1,	%i5,	%o0
	edge8n	%o2,	%i6,	%o5
	fsrc2s	%f7,	%f30
	sra	%i7,	0x14,	%l3
	ldsw	[%l7 + 0x48],	%l5
	edge8n	%l2,	%l6,	%o4
	fxor	%f2,	%f10,	%f28
	sdivx	%o3,	0x063B,	%o6
	movle	%xcc,	%g5,	%i0
	movn	%xcc,	%g2,	%l4
	fmovdgu	%xcc,	%f3,	%f26
	umul	%o1,	%g1,	%g3
	edge16ln	%i3,	%o7,	%l0
	mulx	%g4,	%i4,	%g7
	andncc	%i2,	%g6,	%i1
	edge16ln	%i5,	%l1,	%o0
	addc	%i6,	%o2,	%i7
	subc	%l3,	0x0BB4,	%o5
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	fmovdcs	%xcc,	%f29,	%f21
	ldub	[%l7 + 0x36],	%o3
	subcc	%o6,	%g5,	%l2
	movvs	%xcc,	%g2,	%l4
	edge32	%o1,	%g1,	%g3
	smul	%i3,	0x0561,	%i0
	movn	%xcc,	%o7,	%g4
	addcc	%l0,	%i4,	%g7
	movrgez	%g6,	0x36C,	%i2
	sll	%i5,	%i1,	%l1
	mova	%icc,	%o0,	%o2
	movrlez	%i6,	%i7,	%l3
	sllx	%o5,	%l5,	%o4
	nop
	set	0x20, %i6
	ldd	[%l7 + %i6],	%i6
	umulcc	%o3,	0x138B,	%g5
	orncc	%l2,	0x05B2,	%o6
	xorcc	%l4,	0x155A,	%o1
	udivx	%g1,	0x07AA,	%g3
	std	%f6,	[%l7 + 0x78]
	fcmpgt16	%f4,	%f4,	%g2
	ldsw	[%l7 + 0x50],	%i3
	lduh	[%l7 + 0x5A],	%o7
	fmovdneg	%icc,	%f5,	%f22
	udivx	%i0,	0x132D,	%g4
	mulx	%l0,	0x13EF,	%g7
	sdivcc	%g6,	0x0795,	%i2
	edge32	%i5,	%i1,	%l1
	umulcc	%i4,	%o2,	%o0
	sra	%i7,	0x15,	%i6
	sll	%l3,	%l5,	%o4
	lduw	[%l7 + 0x24],	%l6
	sdivcc	%o5,	0x0F59,	%g5
	xorcc	%o3,	%o6,	%l2
	ldx	[%l7 + 0x48],	%o1
	fcmpd	%fcc3,	%f14,	%f18
	movrlez	%g1,	%g3,	%l4
	subccc	%i3,	0x06F7,	%g2
	movgu	%xcc,	%i0,	%o7
	movrlz	%l0,	0x3BC,	%g4
	save %g7, 0x0AA7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i5,	%i2,	%i1
	ldx	[%l7 + 0x68],	%l1
	fsrc2s	%f15,	%f21
	ldsh	[%l7 + 0x70],	%o2
	alignaddr	%o0,	%i7,	%i4
	fmovsleu	%xcc,	%f24,	%f27
	fpsub32	%f20,	%f2,	%f0
	fmul8sux16	%f16,	%f8,	%f4
	fcmpgt32	%f28,	%f28,	%l3
	popc	0x0238,	%l5
	ldsh	[%l7 + 0x7E],	%i6
	restore %o4, %o5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g5,	%o3,	%l2
	mulscc	%o6,	%g1,	%g3
	orn	%o1,	%l4,	%i3
	orncc	%i0,	0x16FC,	%o7
	mova	%icc,	%l0,	%g4
	ldsb	[%l7 + 0x12],	%g7
	siam	0x3
	fmovse	%xcc,	%f5,	%f17
	fxors	%f3,	%f8,	%f7
	orncc	%g2,	%i5,	%g6
	save %i2, %i1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%o0,	0x11EE,	%i7
	edge16l	%o2,	%i4,	%l3
	ldd	[%l7 + 0x78],	%f10
	save %l5, 0x0F4D, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%o5,	0x06,	%i6
	sethi	0x0F68,	%g5
	mulx	%o3,	0x1971,	%l2
	movre	%l6,	%g1,	%g3
	movvc	%xcc,	%o6,	%o1
	fcmpgt16	%f30,	%f2,	%i3
	nop
	set	0x50, %i7
	ldub	[%l7 + %i7],	%i0
	fabss	%f7,	%f8
	fpsub32s	%f22,	%f4,	%f26
	sth	%o7,	[%l7 + 0x26]
	lduw	[%l7 + 0x14],	%l4
	sethi	0x0C13,	%g4
	st	%f8,	[%l7 + 0x58]
	or	%g7,	%l0,	%i5
	ldx	[%l7 + 0x70],	%g6
	edge8	%i2,	%i1,	%g2
	st	%f14,	[%l7 + 0x4C]
	nop
	set	0x48, %g7
	stx	%o0,	[%l7 + %g7]
	fcmpd	%fcc0,	%f2,	%f30
	stw	%l1,	[%l7 + 0x18]
	fandnot2	%f18,	%f24,	%f22
	popc	0x092F,	%o2
	movrgez	%i4,	%l3,	%l5
	nop
	set	0x78, %g6
	ldd	[%l7 + %g6],	%f4
	fmovda	%icc,	%f15,	%f22
	fabss	%f1,	%f24
	sdiv	%i7,	0x092E,	%o5
	movgu	%xcc,	%i6,	%g5
	or	%o4,	%o3,	%l2
	fpackfix	%f18,	%f5
	fcmpd	%fcc2,	%f14,	%f4
	fmovdn	%xcc,	%f30,	%f8
	movneg	%icc,	%g1,	%g3
	xnor	%o6,	%l6,	%o1
	edge16	%i0,	%i3,	%l4
	orcc	%o7,	0x0661,	%g4
	fmul8ulx16	%f8,	%f30,	%f24
	edge16n	%g7,	%i5,	%g6
	fmovrsgez	%i2,	%f25,	%f4
	movgu	%xcc,	%i1,	%l0
	mulx	%o0,	0x0851,	%l1
	fmovdge	%icc,	%f29,	%f8
	array8	%o2,	%g2,	%l3
	orncc	%l5,	%i4,	%i7
	movrgz	%i6,	0x238,	%o5
	fmovsleu	%icc,	%f26,	%f13
	fmovrsgez	%g5,	%f9,	%f10
	edge8ln	%o3,	%o4,	%g1
	andncc	%l2,	%g3,	%l6
	fmovdvs	%xcc,	%f19,	%f3
	movgu	%icc,	%o6,	%i0
	sir	0x1819
	edge8l	%i3,	%o1,	%o7
	orncc	%l4,	%g7,	%g4
	mulscc	%g6,	0x1E62,	%i5
	fandnot2s	%f3,	%f24,	%f27
	movrgz	%i1,	0x18F,	%i2
	movrgz	%l0,	%o0,	%o2
	fmovspos	%xcc,	%f22,	%f12
	stw	%l1,	[%l7 + 0x3C]
	fmovdvs	%icc,	%f18,	%f8
	subcc	%l3,	0x1EA7,	%g2
	for	%f20,	%f6,	%f4
	movrgz	%i4,	0x0C7,	%l5
	edge16l	%i7,	%i6,	%g5
	fmovrde	%o5,	%f0,	%f30
	movrlz	%o4,	0x199,	%o3
	subc	%g1,	%g3,	%l2
	sdivx	%l6,	0x1249,	%o6
	subc	%i0,	%i3,	%o7
	movg	%xcc,	%l4,	%o1
	movrgz	%g7,	%g4,	%i5
	fand	%f12,	%f8,	%f22
	fnand	%f20,	%f26,	%f22
	srax	%i1,	%g6,	%i2
	movgu	%icc,	%o0,	%o2
	ld	[%l7 + 0x7C],	%f30
	movpos	%icc,	%l1,	%l0
	stx	%g2,	[%l7 + 0x58]
	orcc	%i4,	0x038A,	%l3
	fzero	%f20
	edge16l	%l5,	%i6,	%g5
	fmovdcs	%xcc,	%f20,	%f23
	movne	%icc,	%o5,	%i7
	ldsh	[%l7 + 0x18],	%o3
	fcmpgt32	%f26,	%f14,	%o4
	movle	%icc,	%g3,	%g1
	fsrc2s	%f2,	%f18
	fcmpgt16	%f8,	%f24,	%l2
	lduh	[%l7 + 0x6A],	%l6
	edge8l	%o6,	%i3,	%o7
	and	%l4,	%i0,	%o1
	movle	%xcc,	%g7,	%g4
	smulcc	%i5,	0x1CA5,	%g6
	movrlz	%i1,	0x198,	%i2
	movg	%icc,	%o2,	%o0
	fsrc1	%f0,	%f28
	sdivcc	%l0,	0x1FCA,	%l1
	edge8	%i4,	%l3,	%l5
	smul	%i6,	0x1E20,	%g5
	srax	%o5,	%g2,	%o3
	movrgez	%i7,	0x179,	%g3
	movg	%icc,	%o4,	%l2
	fsrc1	%f26,	%f2
	array32	%g1,	%l6,	%i3
	alignaddrl	%o7,	%o6,	%l4
	movrgz	%o1,	%i0,	%g4
	sethi	0x0BEB,	%i5
	array8	%g6,	%g7,	%i1
	fcmple16	%f6,	%f18,	%i2
	sdivcc	%o0,	0x05AD,	%o2
	fmovs	%f4,	%f8
	fpsub32	%f30,	%f20,	%f20
	ldsb	[%l7 + 0x61],	%l1
	subc	%i4,	0x03BF,	%l3
	fmul8ulx16	%f30,	%f10,	%f0
	std	%f26,	[%l7 + 0x30]
	fones	%f6
	fmuld8sux16	%f13,	%f26,	%f8
	fsrc2	%f14,	%f24
	fpadd16	%f26,	%f30,	%f0
	edge16	%l5,	%i6,	%g5
	fpackfix	%f0,	%f6
	sra	%o5,	0x10,	%g2
	umulcc	%l0,	%i7,	%g3
	array16	%o3,	%o4,	%g1
	add	%l2,	%l6,	%i3
	edge32	%o7,	%o6,	%o1
	lduw	[%l7 + 0x0C],	%l4
	movge	%icc,	%g4,	%i5
	fxor	%f16,	%f28,	%f20
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	ldsh	[%l7 + 0x72],	%g7
	edge16l	%i1,	%o0,	%i2
	array32	%l1,	%o2,	%l3
	movgu	%xcc,	%l5,	%i6
	ldsb	[%l7 + 0x29],	%g5
	fpackfix	%f26,	%f18
	movge	%xcc,	%o5,	%i4
	stb	%g2,	[%l7 + 0x2D]
	sub	%l0,	%g3,	%i7
	sub	%o4,	0x16AC,	%o3
	srax	%l2,	%l6,	%g1
	ldsh	[%l7 + 0x44],	%i3
	st	%f0,	[%l7 + 0x6C]
	stw	%o6,	[%l7 + 0x30]
	movneg	%icc,	%o7,	%l4
	orcc	%g4,	%o1,	%g6
	addccc	%i5,	%i0,	%i1
	fcmple32	%f20,	%f30,	%o0
	fmovda	%icc,	%f29,	%f9
	fandnot1	%f10,	%f16,	%f30
	sth	%g7,	[%l7 + 0x52]
	array32	%l1,	%i2,	%o2
	movpos	%icc,	%l3,	%i6
	ldx	[%l7 + 0x68],	%g5
	xnorcc	%o5,	%l5,	%i4
	move	%icc,	%g2,	%l0
	fmovscc	%xcc,	%f31,	%f30
	fpackfix	%f6,	%f15
	xorcc	%i7,	0x1457,	%g3
	umulcc	%o4,	%o3,	%l6
	edge8n	%g1,	%i3,	%l2
	andncc	%o7,	%o6,	%l4
	move	%xcc,	%o1,	%g4
	movrgez	%g6,	%i5,	%i1
	fmovrdne	%o0,	%f30,	%f30
	movpos	%icc,	%i0,	%g7
	array8	%l1,	%i2,	%o2
	array8	%l3,	%g5,	%i6
	fmovspos	%icc,	%f1,	%f15
	udivx	%l5,	0x1EE2,	%o5
	fnands	%f1,	%f25,	%f24
	srlx	%i4,	%g2,	%i7
	subcc	%g3,	0x04C0,	%l0
	xnorcc	%o4,	%o3,	%g1
	fpadd32	%f30,	%f8,	%f10
	add	%l6,	%i3,	%l2
	movcs	%xcc,	%o6,	%o7
	addcc	%l4,	0x19D8,	%o1
	fabss	%f30,	%f5
	andcc	%g6,	0x0FF9,	%g4
	subccc	%i1,	%i5,	%i0
	ldub	[%l7 + 0x0C],	%o0
	edge16n	%l1,	%i2,	%g7
	ldub	[%l7 + 0x0D],	%l3
	fmovrsne	%o2,	%f13,	%f13
	or	%g5,	%i6,	%l5
	stb	%i4,	[%l7 + 0x63]
	umul	%g2,	0x028A,	%i7
	andcc	%g3,	0x0CBD,	%o5
	save %o4, %l0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x54, %i4
	ldsw	[%l7 + %i4],	%l6
	fpsub32	%f2,	%f0,	%f0
	umulcc	%i3,	%l2,	%o6
	ldsw	[%l7 + 0x38],	%o7
	fnegs	%f1,	%f12
	movrne	%g1,	%l4,	%g6
	movgu	%icc,	%g4,	%o1
	xnor	%i1,	%i0,	%o0
	fcmpes	%fcc3,	%f30,	%f9
	movvs	%xcc,	%i5,	%l1
	subccc	%g7,	0x1C97,	%i2
	sethi	0x1346,	%l3
	fpmerge	%f8,	%f5,	%f4
	alignaddr	%g5,	%i6,	%l5
	movrlz	%o2,	%g2,	%i7
	nop
	set	0x2C, %l6
	ldsh	[%l7 + %l6],	%i4
	ldsb	[%l7 + 0x43],	%o5
	fmul8sux16	%f12,	%f20,	%f12
	move	%icc,	%g3,	%o4
	orncc	%l0,	%o3,	%l6
	fpadd32s	%f1,	%f29,	%f23
	std	%f8,	[%l7 + 0x40]
	fmovsgu	%xcc,	%f20,	%f27
	edge8	%l2,	%o6,	%o7
	umul	%i3,	%g1,	%g6
	fcmpes	%fcc1,	%f5,	%f24
	umul	%g4,	0x19F5,	%o1
	movrne	%i1,	0x347,	%l4
	fpack16	%f18,	%f20
	movleu	%xcc,	%o0,	%i0
	movvs	%xcc,	%i5,	%l1
	srax	%i2,	0x00,	%g7
	orcc	%l3,	0x1844,	%i6
	movcc	%icc,	%g5,	%o2
	movcs	%xcc,	%l5,	%g2
	xnorcc	%i7,	%i4,	%g3
	edge16n	%o4,	%l0,	%o5
	sll	%l6,	0x05,	%l2
	fmovs	%f19,	%f16
	movrlz	%o6,	%o7,	%o3
	fcmpgt16	%f18,	%f2,	%i3
	movn	%icc,	%g1,	%g6
	fsrc1s	%f1,	%f11
	edge8n	%g4,	%o1,	%i1
	subcc	%l4,	%o0,	%i5
	movrne	%l1,	0x31D,	%i2
	movrlz	%g7,	%i0,	%i6
	edge32l	%g5,	%o2,	%l3
	fabss	%f4,	%f31
	srlx	%l5,	0x07,	%i7
	movrne	%g2,	%i4,	%g3
	movge	%icc,	%l0,	%o5
	movre	%o4,	0x3DA,	%l2
	movrlez	%l6,	0x378,	%o7
	addccc	%o6,	%o3,	%g1
	edge8l	%g6,	%g4,	%o1
	udivx	%i1,	0x0BC0,	%i3
	movcc	%icc,	%l4,	%i5
	and	%l1,	0x13B6,	%o0
	faligndata	%f2,	%f24,	%f16
	xor	%i2,	0x08FD,	%g7
	and	%i6,	%i0,	%o2
	stb	%g5,	[%l7 + 0x4E]
	fornot1s	%f18,	%f7,	%f16
	fmovsvc	%xcc,	%f12,	%f23
	fmovde	%icc,	%f10,	%f11
	fmovdvc	%icc,	%f15,	%f9
	fmovsge	%xcc,	%f17,	%f20
	umulcc	%l3,	%l5,	%i7
	orncc	%g2,	0x0218,	%g3
	fmovrdgz	%l0,	%f20,	%f16
	movvs	%xcc,	%o5,	%o4
	movrlez	%l2,	%l6,	%o7
	fandnot1s	%f10,	%f29,	%f31
	fmovspos	%xcc,	%f29,	%f30
	fmovsneg	%icc,	%f28,	%f1
	fornot2s	%f24,	%f20,	%f2
	and	%i4,	0x0B9E,	%o3
	edge16n	%o6,	%g6,	%g1
	andncc	%g4,	%i1,	%i3
	ldd	[%l7 + 0x60],	%f8
	ldd	[%l7 + 0x68],	%o0
	umulcc	%l4,	%l1,	%i5
	movge	%xcc,	%o0,	%g7
	ldub	[%l7 + 0x1C],	%i6
	smul	%i0,	%o2,	%g5
	xnorcc	%i2,	%l3,	%l5
	sll	%g2,	%g3,	%l0
	edge8n	%o5,	%o4,	%l2
	movcs	%icc,	%i7,	%l6
	fands	%f20,	%f5,	%f28
	sdivcc	%o7,	0x01D5,	%i4
	fmovsvc	%icc,	%f29,	%f14
	movcs	%icc,	%o6,	%g6
	subccc	%g1,	%g4,	%i1
	fpadd32s	%f12,	%f31,	%f23
	save %i3, 0x0536, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o3,	%l1
	edge16	%l4,	%i5,	%g7
	fmovdl	%icc,	%f2,	%f23
	mova	%icc,	%o0,	%i0
	movn	%xcc,	%i6,	%o2
	fcmpeq32	%f24,	%f24,	%g5
	andcc	%l3,	%l5,	%i2
	fmovsg	%xcc,	%f25,	%f12
	movre	%g2,	0x0F1,	%g3
	subccc	%l0,	0x1067,	%o4
	srl	%l2,	0x01,	%i7
	array8	%l6,	%o7,	%i4
	sra	%o5,	0x16,	%g6
	fpsub16	%f28,	%f28,	%f10
	fone	%f14
	movgu	%xcc,	%o6,	%g4
	lduw	[%l7 + 0x28],	%g1
	edge8	%i3,	%o1,	%o3
	fmovdne	%xcc,	%f2,	%f11
	fands	%f22,	%f15,	%f16
	movne	%icc,	%i1,	%l4
	sth	%i5,	[%l7 + 0x7C]
	movvs	%icc,	%l1,	%o0
	movcc	%icc,	%g7,	%i6
	array32	%i0,	%g5,	%o2
	andcc	%l5,	0x1EF9,	%i2
	fmovsneg	%xcc,	%f2,	%f0
	alignaddrl	%l3,	%g2,	%l0
	xor	%g3,	%o4,	%i7
	edge32n	%l2,	%o7,	%l6
	fsrc1	%f16,	%f2
	bshuffle	%f6,	%f4,	%f24
	alignaddrl	%o5,	%i4,	%g6
	fmovse	%xcc,	%f20,	%f29
	srlx	%o6,	0x14,	%g4
	fmovsge	%icc,	%f17,	%f21
	umul	%i3,	0x1967,	%o1
	movleu	%icc,	%g1,	%i1
	fnot2	%f0,	%f8
	xnorcc	%o3,	%l4,	%l1
	fmovrdlez	%i5,	%f14,	%f10
	fmovdl	%icc,	%f3,	%f14
	edge16	%g7,	%i6,	%i0
	sdivx	%o0,	0x1BDC,	%g5
	fpackfix	%f28,	%f5
	fmovsne	%icc,	%f4,	%f6
	movn	%xcc,	%l5,	%i2
	movre	%l3,	0x26F,	%g2
	smul	%l0,	0x1C43,	%g3
	movle	%icc,	%o4,	%o2
	addc	%l2,	0x1A5A,	%i7
	movg	%xcc,	%l6,	%o5
	alignaddrl	%i4,	%o7,	%g6
	ldx	[%l7 + 0x08],	%o6
	ld	[%l7 + 0x5C],	%f18
	udiv	%i3,	0x05EF,	%o1
	fmovdcc	%xcc,	%f8,	%f2
	ldd	[%l7 + 0x60],	%f26
	lduh	[%l7 + 0x18],	%g1
	movgu	%icc,	%g4,	%o3
	movne	%icc,	%i1,	%l1
	array32	%l4,	%i5,	%i6
	xor	%i0,	%o0,	%g5
	andcc	%l5,	0x0C04,	%g7
	orn	%l3,	0x0D4F,	%g2
	ldub	[%l7 + 0x6A],	%i2
	xnor	%g3,	%o4,	%o2
	std	%f18,	[%l7 + 0x58]
	subccc	%l0,	0x17A3,	%l2
	movn	%xcc,	%i7,	%o5
	and	%l6,	%o7,	%i4
	orn	%g6,	0x161E,	%o6
	ldd	[%l7 + 0x40],	%i2
	movne	%xcc,	%o1,	%g1
	movge	%xcc,	%o3,	%g4
	fmovrslez	%i1,	%f8,	%f24
	andcc	%l4,	%l1,	%i5
	alignaddrl	%i6,	%i0,	%o0
	fmovdgu	%icc,	%f1,	%f23
	fsrc2	%f24,	%f24
	fmovrdne	%l5,	%f30,	%f26
	nop
	set	0x3A, %i1
	ldsb	[%l7 + %i1],	%g7
	movl	%icc,	%l3,	%g5
	bshuffle	%f8,	%f0,	%f14
	movle	%icc,	%g2,	%i2
	xorcc	%g3,	%o2,	%l0
	movl	%xcc,	%l2,	%i7
	move	%xcc,	%o4,	%l6
	movne	%icc,	%o5,	%i4
	std	%f28,	[%l7 + 0x48]
	movn	%xcc,	%o7,	%o6
	movrlz	%i3,	0x245,	%g6
	array32	%o1,	%g1,	%g4
	edge16l	%o3,	%i1,	%l1
	fcmpne16	%f30,	%f2,	%i5
	lduh	[%l7 + 0x12],	%l4
	lduh	[%l7 + 0x6E],	%i6
	udiv	%o0,	0x0990,	%l5
	fmovsgu	%xcc,	%f19,	%f29
	movrgz	%i0,	%l3,	%g7
	fornot2s	%f4,	%f14,	%f3
	addccc	%g2,	0x17AE,	%i2
	umulcc	%g3,	%g5,	%l0
	fornot1s	%f24,	%f6,	%f12
	fnegd	%f24,	%f2
	movle	%xcc,	%l2,	%o2
	subcc	%o4,	0x0A12,	%l6
	ldsh	[%l7 + 0x76],	%i7
	movrlez	%o5,	0x25B,	%i4
	andn	%o7,	0x1E7C,	%i3
	ldx	[%l7 + 0x48],	%g6
	fors	%f7,	%f21,	%f4
	edge32ln	%o6,	%o1,	%g1
	movge	%icc,	%o3,	%g4
	smul	%i1,	0x09B0,	%i5
	edge16l	%l1,	%i6,	%l4
	array16	%l5,	%i0,	%o0
	ldx	[%l7 + 0x10],	%l3
	movcc	%icc,	%g7,	%g2
	smul	%g3,	0x1D4B,	%i2
	movl	%icc,	%l0,	%g5
	smul	%l2,	0x19D9,	%o4
	movcc	%xcc,	%o2,	%l6
	stb	%o5,	[%l7 + 0x35]
	fmovse	%icc,	%f22,	%f24
	fxor	%f30,	%f18,	%f10
	movcc	%xcc,	%i7,	%i4
	movrlez	%i3,	%g6,	%o6
	fone	%f26
	edge8	%o1,	%o7,	%g1
	edge32	%o3,	%i1,	%g4
	xnorcc	%l1,	%i5,	%i6
	edge32	%l5,	%i0,	%o0
	movn	%icc,	%l4,	%g7
	andn	%l3,	%g2,	%g3
	fpmerge	%f4,	%f10,	%f28
	fmul8ulx16	%f0,	%f4,	%f18
	ld	[%l7 + 0x64],	%f10
	fmovrdlez	%l0,	%f22,	%f24
	edge8ln	%i2,	%g5,	%l2
	stb	%o4,	[%l7 + 0x5C]
	movrne	%o2,	%l6,	%o5
	fmovsgu	%xcc,	%f28,	%f1
	movrgz	%i7,	%i4,	%i3
	alignaddr	%g6,	%o1,	%o6
	edge16	%o7,	%o3,	%i1
	fnand	%f30,	%f6,	%f14
	movl	%xcc,	%g1,	%g4
	andncc	%l1,	%i5,	%i6
	fpmerge	%f13,	%f7,	%f6
	movrlz	%l5,	0x2A3,	%i0
	sdiv	%o0,	0x026E,	%l4
	fpmerge	%f19,	%f10,	%f14
	edge32ln	%g7,	%g2,	%g3
	mova	%icc,	%l0,	%i2
	sdiv	%l3,	0x1933,	%g5
	ldsh	[%l7 + 0x1E],	%l2
	orcc	%o2,	%l6,	%o5
	fmul8ulx16	%f16,	%f4,	%f0
	pdist	%f6,	%f28,	%f8
	edge32ln	%o4,	%i7,	%i3
	stb	%g6,	[%l7 + 0x08]
	smulcc	%i4,	%o6,	%o1
	orcc	%o3,	0x15D7,	%o7
	and	%i1,	%g1,	%l1
	addccc	%i5,	%i6,	%g4
	srl	%l5,	%i0,	%o0
	stx	%g7,	[%l7 + 0x30]
	fmovrsne	%g2,	%f3,	%f6
	movle	%xcc,	%l4,	%l0
	fmovda	%icc,	%f7,	%f24
	srax	%g3,	%l3,	%i2
	mulscc	%l2,	0x1924,	%o2
	popc	%l6,	%o5
	movrlez	%g5,	0x2D2,	%i7
	movpos	%xcc,	%i3,	%g6
	fmul8x16au	%f27,	%f11,	%f8
	orcc	%i4,	0x0B2C,	%o6
	srax	%o4,	0x17,	%o3
	fmovd	%f20,	%f30
	mova	%xcc,	%o1,	%i1
	movvc	%xcc,	%g1,	%o7
	lduw	[%l7 + 0x14],	%i5
	fmovda	%xcc,	%f31,	%f13
	movgu	%xcc,	%l1,	%g4
	edge16l	%l5,	%i0,	%o0
	fmul8sux16	%f4,	%f12,	%f20
	sll	%g7,	%i6,	%g2
	st	%f17,	[%l7 + 0x70]
	popc	0x17E1,	%l4
	movg	%icc,	%g3,	%l0
	movrlz	%l3,	0x092,	%l2
	srax	%i2,	0x12,	%l6
	stw	%o5,	[%l7 + 0x70]
	stw	%o2,	[%l7 + 0x24]
	alignaddr	%g5,	%i3,	%g6
	udivx	%i7,	0x0350,	%o6
	edge32l	%i4,	%o4,	%o1
	fmovsle	%xcc,	%f30,	%f18
	pdist	%f20,	%f28,	%f22
	fmovscc	%icc,	%f16,	%f18
	edge8	%i1,	%o3,	%o7
	or	%g1,	%l1,	%i5
	ldub	[%l7 + 0x4A],	%l5
	xnorcc	%g4,	%o0,	%i0
	restore %i6, 0x113B, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l4,	%g3,	%g2
	fmovdgu	%icc,	%f17,	%f27
	fmovdle	%icc,	%f18,	%f10
	movrlez	%l3,	%l0,	%l2
	fandnot2	%f12,	%f26,	%f16
	fand	%f0,	%f20,	%f4
	addccc	%i2,	%o5,	%l6
	fmovdn	%icc,	%f13,	%f8
	movrlez	%g5,	0x30C,	%o2
	ldub	[%l7 + 0x3C],	%g6
	movvs	%xcc,	%i3,	%o6
	save %i7, %o4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f2,	%f28,	%f8
	sll	%i1,	0x17,	%o3
	sethi	0x1D4C,	%o7
	smul	%g1,	%i4,	%i5
	fmovrsgez	%l1,	%f1,	%f2
	fnor	%f28,	%f20,	%f20
	udiv	%g4,	0x0378,	%l5
	movpos	%xcc,	%o0,	%i6
	movg	%icc,	%i0,	%g7
	smul	%g3,	0x1B2D,	%l4
	fmovsneg	%xcc,	%f30,	%f3
	movrgz	%l3,	0x358,	%g2
	fmovscc	%xcc,	%f11,	%f27
	movvs	%icc,	%l0,	%l2
	array16	%o5,	%i2,	%g5
	sub	%l6,	%g6,	%o2
	ldd	[%l7 + 0x70],	%i2
	fmul8sux16	%f20,	%f30,	%f28
	ldub	[%l7 + 0x7A],	%o6
	movne	%xcc,	%i7,	%o4
	stw	%o1,	[%l7 + 0x5C]
	fpsub16	%f28,	%f16,	%f10
	ldx	[%l7 + 0x30],	%i1
	edge32n	%o3,	%o7,	%g1
	mova	%xcc,	%i5,	%l1
	fnands	%f13,	%f14,	%f28
	smul	%g4,	%i4,	%o0
	movrlez	%i6,	%l5,	%i0
	movrgez	%g3,	0x324,	%g7
	stb	%l3,	[%l7 + 0x68]
	st	%f12,	[%l7 + 0x30]
	fmovsvs	%xcc,	%f2,	%f11
	addc	%g2,	0x1BF0,	%l0
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	smulcc	%i2,	%g5,	%l2
	popc	0x02C2,	%g6
	and	%l6,	0x139E,	%i3
	mova	%xcc,	%o6,	%o2
	andcc	%o4,	0x19ED,	%o1
	fzero	%f8
	srl	%i1,	%o3,	%o7
	movl	%icc,	%i7,	%i5
	edge32l	%g1,	%g4,	%l1
	edge16l	%i4,	%o0,	%l5
	andn	%i0,	0x0C6A,	%g3
	sdivcc	%g7,	0x1745,	%l3
	fmovrslez	%i6,	%f4,	%f21
	fcmpd	%fcc1,	%f12,	%f20
	fmovsleu	%icc,	%f14,	%f12
	stx	%l0,	[%l7 + 0x10]
	ldd	[%l7 + 0x58],	%l4
	subc	%o5,	0x0059,	%i2
	lduw	[%l7 + 0x5C],	%g2
	fmovrdgez	%g5,	%f2,	%f0
	movg	%xcc,	%l2,	%g6
	udivcc	%i3,	0x0430,	%l6
	move	%icc,	%o2,	%o4
	fnands	%f22,	%f20,	%f31
	orn	%o1,	%i1,	%o6
	edge32l	%o7,	%o3,	%i5
	move	%xcc,	%i7,	%g1
	sll	%l1,	%i4,	%o0
	fxnor	%f28,	%f8,	%f26
	fmovscs	%xcc,	%f14,	%f25
	lduw	[%l7 + 0x60],	%l5
	std	%f6,	[%l7 + 0x58]
	edge8	%g4,	%g3,	%i0
	stb	%g7,	[%l7 + 0x51]
	ldsh	[%l7 + 0x2E],	%i6
	sir	0x0AE5
	save %l3, %l0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o5,	%g2,	%i2
	movpos	%xcc,	%g5,	%g6
	srlx	%i3,	0x11,	%l6
	popc	0x0F57,	%o2
	fornot1s	%f23,	%f17,	%f11
	restore %o4, 0x107F, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o1,	%i1,	%o7
	fxor	%f4,	%f18,	%f20
	fandnot1	%f28,	%f28,	%f4
	movvs	%xcc,	%o6,	%i5
	fmul8x16al	%f18,	%f21,	%f8
	fmovrslez	%i7,	%f20,	%f30
	andncc	%o3,	%l1,	%i4
	xorcc	%o0,	%g1,	%g4
	srl	%g3,	0x0D,	%i0
	movle	%icc,	%g7,	%l5
	fmovrde	%l3,	%f22,	%f4
	fmovsa	%icc,	%f12,	%f12
	movpos	%xcc,	%i6,	%l0
	move	%xcc,	%l4,	%o5
	xnor	%i2,	%g5,	%g6
	movrgez	%i3,	%g2,	%l6
	edge32l	%o4,	%o2,	%o1
	fmovrdgz	%i1,	%f0,	%f30
	addccc	%o7,	0x1BE4,	%o6
	sir	0x1D2E
	movcc	%icc,	%i5,	%i7
	std	%f0,	[%l7 + 0x10]
	and	%o3,	0x0F34,	%l1
	fpsub16	%f16,	%f4,	%f14
	udivx	%i4,	0x158E,	%l2
	fmovrdlz	%o0,	%f6,	%f24
	stb	%g4,	[%l7 + 0x4D]
	fmovrde	%g1,	%f2,	%f12
	and	%i0,	%g7,	%g3
	srl	%l5,	0x1C,	%l3
	fpack16	%f4,	%f17
	fnot2s	%f24,	%f27
	fmovdle	%xcc,	%f25,	%f23
	mulscc	%l0,	%l4,	%i6
	fexpand	%f29,	%f30
	sdivcc	%i2,	0x1858,	%g5
	andncc	%g6,	%i3,	%g2
	fmovd	%f22,	%f6
	edge8ln	%l6,	%o5,	%o4
	sth	%o1,	[%l7 + 0x1A]
	andn	%o2,	0x169D,	%o7
	movge	%xcc,	%o6,	%i1
	movn	%xcc,	%i5,	%i7
	fands	%f1,	%f4,	%f25
	umul	%o3,	%i4,	%l2
	movl	%icc,	%l1,	%o0
	movvs	%xcc,	%g4,	%i0
	udivx	%g7,	0x1E5C,	%g3
	ldub	[%l7 + 0x37],	%l5
	sethi	0x149D,	%g1
	fmovd	%f14,	%f22
	umul	%l0,	0x0E21,	%l3
	stx	%l4,	[%l7 + 0x78]
	movrne	%i6,	0x30D,	%g5
	orn	%i2,	%i3,	%g2
	fmovscs	%icc,	%f4,	%f21
	fmovrslz	%g6,	%f2,	%f11
	movre	%l6,	%o5,	%o1
	movcc	%xcc,	%o2,	%o4
	popc	%o6,	%i1
	stw	%o7,	[%l7 + 0x54]
	smul	%i7,	%i5,	%i4
	movn	%xcc,	%o3,	%l1
	sethi	0x0744,	%l2
	sth	%g4,	[%l7 + 0x56]
	sra	%o0,	%g7,	%g3
	sra	%l5,	0x11,	%g1
	movrgz	%l0,	0x2C5,	%i0
	edge8n	%l3,	%i6,	%g5
	lduw	[%l7 + 0x64],	%l4
	alignaddr	%i3,	%g2,	%g6
	ldsb	[%l7 + 0x31],	%i2
	fmovdvc	%xcc,	%f11,	%f0
	ldd	[%l7 + 0x08],	%o4
	srax	%l6,	0x10,	%o1
	ldd	[%l7 + 0x30],	%f4
	edge32l	%o4,	%o6,	%i1
	edge32n	%o7,	%i7,	%i5
	movpos	%xcc,	%i4,	%o2
	fpmerge	%f25,	%f18,	%f22
	sub	%l1,	0x08A0,	%l2
	add	%o3,	%o0,	%g4
	udivcc	%g3,	0x1EB3,	%l5
	orncc	%g7,	%g1,	%i0
	movge	%xcc,	%l0,	%l3
	movrgez	%g5,	%i6,	%l4
	and	%g2,	%i3,	%g6
	edge8ln	%i2,	%o5,	%o1
	fnand	%f30,	%f24,	%f4
	std	%f6,	[%l7 + 0x18]
	movrgez	%l6,	%o6,	%o4
	edge8l	%o7,	%i7,	%i5
	sth	%i4,	[%l7 + 0x7E]
	fmovda	%icc,	%f0,	%f15
	stw	%i1,	[%l7 + 0x60]
	subccc	%l1,	%l2,	%o3
	movvs	%xcc,	%o2,	%o0
	ldsh	[%l7 + 0x08],	%g4
	edge8	%l5,	%g3,	%g1
	srax	%i0,	%l0,	%l3
	edge32n	%g5,	%i6,	%l4
	fabss	%f18,	%f31
	movre	%g7,	0x021,	%g2
	lduh	[%l7 + 0x20],	%i3
	fmovsneg	%xcc,	%f17,	%f26
	orncc	%i2,	0x1F88,	%o5
	ldub	[%l7 + 0x74],	%g6
	fnor	%f30,	%f18,	%f22
	array8	%o1,	%l6,	%o4
	lduw	[%l7 + 0x58],	%o6
	orn	%o7,	%i7,	%i5
	movre	%i1,	0x3B4,	%i4
	edge32ln	%l2,	%l1,	%o3
	xor	%o2,	%g4,	%l5
	udivx	%g3,	0x169A,	%g1
	add	%i0,	%o0,	%l0
	sdivx	%l3,	0x0481,	%g5
	mova	%icc,	%l4,	%g7
	sdivcc	%g2,	0x0AF3,	%i6
	fmovdpos	%icc,	%f16,	%f10
	movne	%icc,	%i2,	%o5
	edge32ln	%i3,	%o1,	%l6
	sllx	%o4,	%g6,	%o6
	edge8l	%i7,	%i5,	%i1
	alignaddr	%o7,	%l2,	%i4
	stw	%l1,	[%l7 + 0x54]
	fsrc2s	%f24,	%f8
	edge8l	%o3,	%g4,	%o2
	movvc	%icc,	%g3,	%g1
	ld	[%l7 + 0x7C],	%f7
	movrlz	%l5,	0x3CA,	%i0
	edge8ln	%o0,	%l3,	%l0
	fandnot1s	%f14,	%f4,	%f22
	fornot1	%f14,	%f2,	%f16
	fmovsvc	%icc,	%f31,	%f27
	siam	0x7
	fmovrsgez	%g5,	%f3,	%f10
	smul	%g7,	%l4,	%i6
	popc	0x1383,	%g2
	movn	%icc,	%o5,	%i2
	lduh	[%l7 + 0x16],	%o1
	andn	%l6,	0x04D3,	%i3
	move	%icc,	%o4,	%g6
	edge8l	%o6,	%i5,	%i1
	fmovrsgz	%o7,	%f31,	%f10
	xnor	%i7,	0x02EA,	%l2
	ldd	[%l7 + 0x50],	%f14
	nop
	set	0x68, %i3
	ldx	[%l7 + %i3],	%i4
	save %l1, %o3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g4,	%g1,	%l5
	stw	%i0,	[%l7 + 0x5C]
	movre	%o0,	%l3,	%g3
	lduw	[%l7 + 0x48],	%l0
	movrgez	%g7,	%l4,	%g5
	edge8n	%g2,	%i6,	%o5
	lduh	[%l7 + 0x32],	%o1
	edge16n	%i2,	%i3,	%l6
	fmovdne	%icc,	%f19,	%f0
	orncc	%g6,	%o6,	%i5
	stx	%i1,	[%l7 + 0x58]
	orn	%o4,	0x199A,	%o7
	array16	%i7,	%i4,	%l1
	smul	%o3,	%o2,	%l2
	fpmerge	%f15,	%f18,	%f14
	sdivcc	%g1,	0x024D,	%l5
	sub	%i0,	%g4,	%o0
	smul	%g3,	0x08A3,	%l3
	subc	%l0,	%g7,	%g5
	fmovdg	%icc,	%f22,	%f5
	smulcc	%l4,	%i6,	%o5
	array16	%g2,	%i2,	%o1
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	restore %i5, 0x1227, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o4,	0x0A73,	%o6
	movrgez	%o7,	0x3B1,	%i7
	move	%xcc,	%l1,	%o3
	sth	%o2,	[%l7 + 0x56]
	udivcc	%l2,	0x1A24,	%g1
	nop
	set	0x70, %i5
	ldx	[%l7 + %i5],	%l5
	movrne	%i0,	0x1DB,	%i4
	fmovdvc	%xcc,	%f28,	%f19
	subcc	%o0,	0x1553,	%g3
	ldd	[%l7 + 0x68],	%g4
	st	%f16,	[%l7 + 0x3C]
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	movcc	%xcc,	%l4,	%g5
	stw	%o5,	[%l7 + 0x0C]
	restore %i6, %g2, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x68],	%i2
	movpos	%icc,	%g6,	%l6
	xnorcc	%i5,	0x1BFD,	%i3
	movre	%i1,	%o4,	%o7
	movre	%o6,	0x07C,	%i7
	movrlez	%o3,	%l1,	%l2
	xorcc	%o2,	%g1,	%l5
	fornot1s	%f23,	%f30,	%f17
	fpadd16	%f0,	%f10,	%f28
	umul	%i0,	0x1862,	%o0
	fmovrslz	%i4,	%f22,	%f24
	fmul8sux16	%f8,	%f12,	%f8
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	sdiv	%l0,	0x013C,	%l3
	ldub	[%l7 + 0x2D],	%l4
	ldd	[%l7 + 0x18],	%g4
	fmovsn	%icc,	%f19,	%f4
	edge8l	%g7,	%o5,	%i6
	movrne	%o1,	0x188,	%i2
	sdivx	%g2,	0x15E3,	%l6
	fmovsa	%icc,	%f23,	%f11
	movcc	%xcc,	%i5,	%g6
	fmovscs	%xcc,	%f31,	%f26
	udivcc	%i1,	0x18BE,	%o4
	addccc	%i3,	0x1130,	%o7
	fnot1	%f18,	%f6
	movre	%i7,	0x219,	%o6
	lduw	[%l7 + 0x14],	%o3
	srlx	%l1,	0x02,	%o2
	edge16n	%l2,	%g1,	%l5
	edge32l	%i0,	%i4,	%o0
	array8	%g4,	%l0,	%l3
	fandnot2	%f2,	%f30,	%f20
	movl	%xcc,	%l4,	%g5
	addc	%g3,	%g7,	%i6
	smul	%o5,	0x12E5,	%i2
	movrne	%o1,	0x36D,	%l6
	sllx	%g2,	0x10,	%i5
	udiv	%g6,	0x089B,	%i1
	movrne	%o4,	%o7,	%i7
	fexpand	%f16,	%f0
	sir	0x0E17
	edge8ln	%o6,	%o3,	%l1
	save %i3, 0x1DB6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f4,	[%l7 + 0x38]
	ldub	[%l7 + 0x12],	%l2
	orn	%g1,	0x15F1,	%i0
	ld	[%l7 + 0x4C],	%f4
	fpsub16	%f22,	%f20,	%f22
	fmovsneg	%icc,	%f13,	%f18
	fmovrdne	%i4,	%f22,	%f26
	movrlz	%o0,	%l5,	%g4
	fmovrse	%l0,	%f13,	%f19
	xor	%l3,	%l4,	%g3
	stx	%g7,	[%l7 + 0x30]
	ldd	[%l7 + 0x08],	%f22
	ldx	[%l7 + 0x78],	%i6
	movge	%icc,	%o5,	%g5
	sll	%i2,	0x1F,	%l6
	stx	%g2,	[%l7 + 0x68]
	sdiv	%o1,	0x1F4D,	%i5
	fsrc1s	%f8,	%f17
	addcc	%g6,	%i1,	%o7
	sll	%i7,	0x17,	%o4
	sth	%o3,	[%l7 + 0x5E]
	smul	%o6,	0x0FE6,	%i3
	edge32n	%l1,	%l2,	%o2
	alignaddrl	%g1,	%i4,	%i0
	fmovde	%icc,	%f2,	%f21
	edge16ln	%l5,	%g4,	%l0
	restore %o0, 0x1CA2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l4,	%g7,	%i6
	movrlez	%o5,	%g5,	%i2
	sth	%g3,	[%l7 + 0x36]
	or	%g2,	%o1,	%i5
	umulcc	%g6,	0x036C,	%i1
	nop
	set	0x78, %l2
	stx	%l6,	[%l7 + %l2]
	stx	%o7,	[%l7 + 0x68]
	smul	%i7,	%o4,	%o6
	andn	%i3,	%l1,	%o3
	sra	%l2,	%o2,	%i4
	fandnot2	%f28,	%f2,	%f28
	umulcc	%g1,	%i0,	%l5
	edge32n	%g4,	%o0,	%l3
	edge32	%l4,	%g7,	%i6
	stb	%l0,	[%l7 + 0x73]
	movl	%xcc,	%g5,	%i2
	movrlz	%g3,	0x2F7,	%g2
	udivx	%o1,	0x1DF0,	%o5
	xnor	%i5,	%g6,	%l6
	andncc	%i1,	%o7,	%i7
	edge16ln	%o6,	%i3,	%l1
	fones	%f29
	save %o3, 0x1C92, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l2,	[%l7 + 0x64]
	save %o2, 0x15E5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i0,	%l5,	%g1
	or	%g4,	%l3,	%o0
	fcmpeq16	%f2,	%f6,	%g7
	save %i6, 0x1BA2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdvs	%xcc,	%f24,	%f23
	stw	%l4,	[%l7 + 0x38]
	ldx	[%l7 + 0x40],	%i2
	sdivx	%g3,	0x0AD4,	%g5
	stb	%g2,	[%l7 + 0x36]
	movpos	%xcc,	%o5,	%o1
	xor	%g6,	%i5,	%i1
	movne	%icc,	%o7,	%l6
	fmovrdne	%o6,	%f30,	%f14
	movrgez	%i3,	%l1,	%i7
	edge8n	%o3,	%l2,	%o2
	fmovspos	%icc,	%f31,	%f29
	addc	%o4,	%i4,	%i0
	movre	%l5,	%g4,	%l3
	or	%o0,	%g7,	%g1
	movge	%icc,	%l0,	%i6
	addccc	%l4,	%g3,	%g5
	udivx	%i2,	0x02A8,	%o5
	fcmpeq16	%f12,	%f14,	%g2
	addc	%g6,	%o1,	%i5
	fmovdleu	%xcc,	%f20,	%f17
	fcmpne16	%f18,	%f0,	%o7
	xorcc	%i1,	%o6,	%l6
	sethi	0x0027,	%i3
	fpackfix	%f22,	%f0
	movrgz	%i7,	0x1B1,	%o3
	popc	0x04E3,	%l1
	and	%l2,	0x0CD3,	%o2
	edge32ln	%o4,	%i0,	%l5
	st	%f18,	[%l7 + 0x7C]
	ldd	[%l7 + 0x30],	%i4
	fmovdle	%icc,	%f21,	%f30
	sth	%g4,	[%l7 + 0x60]
	movne	%icc,	%l3,	%g7
	edge32l	%g1,	%o0,	%i6
	fpadd32	%f4,	%f26,	%f24
	fexpand	%f2,	%f28
	xnor	%l0,	%l4,	%g5
	addcc	%g3,	%o5,	%i2
	fmovsa	%icc,	%f7,	%f21
	ldsb	[%l7 + 0x3F],	%g2
	fpack16	%f28,	%f22
	ldsb	[%l7 + 0x34],	%g6
	orcc	%i5,	0x0DB0,	%o7
	fsrc2	%f16,	%f6
	addcc	%o1,	%i1,	%l6
	sub	%o6,	0x0945,	%i3
	save %o3, 0x1164, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l2,	0x1CD3,	%l1
	udiv	%o2,	0x1E13,	%i0
	movvs	%icc,	%o4,	%l5
	fmovsleu	%icc,	%f7,	%f28
	edge16n	%i4,	%l3,	%g7
	or	%g1,	0x1568,	%g4
	popc	%o0,	%l0
	mulscc	%l4,	0x1E4A,	%g5
	fpsub32	%f14,	%f18,	%f28
	array8	%i6,	%g3,	%o5
	movn	%xcc,	%g2,	%i2
	movle	%xcc,	%i5,	%o7
	srl	%g6,	0x16,	%i1
	movle	%icc,	%o1,	%l6
	andncc	%o6,	%i3,	%i7
	fnot2	%f2,	%f30
	sllx	%l2,	0x18,	%o3
	andncc	%l1,	%i0,	%o4
	stb	%l5,	[%l7 + 0x49]
	andn	%i4,	0x1366,	%l3
	movneg	%xcc,	%g7,	%g1
	fmovdg	%icc,	%f23,	%f30
	and	%o2,	%o0,	%l0
	nop
	set	0x10, %g1
	ldd	[%l7 + %g1],	%f4
	edge32	%l4,	%g4,	%i6
	movge	%xcc,	%g3,	%g5
	sdivcc	%o5,	0x154F,	%g2
	movpos	%icc,	%i5,	%i2
	array32	%g6,	%i1,	%o1
	mova	%icc,	%l6,	%o6
	sdivcc	%i3,	0x1A54,	%o7
	mova	%icc,	%i7,	%l2
	sll	%l1,	%o3,	%i0
	fmovd	%f30,	%f12
	subcc	%l5,	0x19D4,	%o4
	movrgez	%i4,	0x30A,	%g7
	movvs	%xcc,	%g1,	%l3
	udiv	%o2,	0x035B,	%l0
	for	%f16,	%f26,	%f14
	lduh	[%l7 + 0x7C],	%l4
	fmovrdgz	%g4,	%f24,	%f12
	xnor	%o0,	0x09B8,	%i6
	sra	%g5,	%g3,	%g2
	array8	%o5,	%i5,	%i2
	edge16	%g6,	%o1,	%i1
	mova	%icc,	%o6,	%i3
	movrgez	%l6,	%o7,	%i7
	fxnor	%f0,	%f24,	%f24
	popc	0x00B7,	%l1
	fcmped	%fcc0,	%f26,	%f14
	sdivcc	%l2,	0x09EE,	%o3
	edge16ln	%i0,	%l5,	%i4
	ldd	[%l7 + 0x78],	%o4
	fmovdl	%xcc,	%f12,	%f28
	edge16	%g1,	%l3,	%g7
	fnands	%f4,	%f9,	%f6
	sdivx	%l0,	0x0989,	%o2
	movleu	%icc,	%g4,	%o0
	fnegs	%f28,	%f0
	ldd	[%l7 + 0x40],	%f6
	fcmple32	%f20,	%f14,	%i6
	movneg	%xcc,	%g5,	%l4
	udivx	%g3,	0x0B04,	%o5
	edge32	%g2,	%i2,	%i5
	fandnot1	%f2,	%f0,	%f18
	stw	%o1,	[%l7 + 0x1C]
	ldub	[%l7 + 0x3C],	%g6
	umul	%i1,	%o6,	%i3
	andcc	%o7,	0x1E3C,	%i7
	subccc	%l1,	%l6,	%l2
	subccc	%o3,	%i0,	%i4
	orcc	%o4,	0x0D0A,	%l5
	fcmps	%fcc0,	%f3,	%f1
	save %l3, 0x1794, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%l0,	%g1
	fcmpne16	%f24,	%f22,	%g4
	stb	%o2,	[%l7 + 0x72]
	edge32	%i6,	%o0,	%g5
	fmovsg	%icc,	%f24,	%f14
	movg	%xcc,	%l4,	%g3
	nop
	set	0x6F, %l0
	stb	%o5,	[%l7 + %l0]
	array16	%g2,	%i5,	%o1
	edge8	%g6,	%i1,	%i2
	mulscc	%o6,	%o7,	%i3
	fone	%f24
	sethi	0x0089,	%i7
	movrlez	%l1,	0x0D1,	%l2
	fsrc2s	%f31,	%f24
	smul	%l6,	0x101B,	%i0
	stb	%o3,	[%l7 + 0x79]
	fpadd32s	%f24,	%f2,	%f24
	fmovda	%xcc,	%f4,	%f18
	mulscc	%o4,	0x16B4,	%l5
	edge32l	%l3,	%g7,	%l0
	srl	%i4,	%g4,	%o2
	lduw	[%l7 + 0x18],	%i6
	lduh	[%l7 + 0x08],	%g1
	ldub	[%l7 + 0x19],	%o0
	movn	%icc,	%l4,	%g3
	array8	%o5,	%g5,	%i5
	std	%f30,	[%l7 + 0x40]
	fmovs	%f7,	%f26
	smulcc	%o1,	%g6,	%i1
	array16	%i2,	%g2,	%o6
	movl	%xcc,	%i3,	%i7
	stw	%o7,	[%l7 + 0x64]
	edge16l	%l2,	%l1,	%i0
	fnor	%f4,	%f0,	%f12
	movvs	%xcc,	%o3,	%o4
	fmovd	%f28,	%f22
	fsrc1s	%f4,	%f2
	sllx	%l6,	%l5,	%g7
	popc	0x1F3D,	%l0
	edge16	%l3,	%i4,	%g4
	addcc	%i6,	%g1,	%o0
	sllx	%o2,	%l4,	%g3
	movn	%icc,	%g5,	%o5
	movgu	%xcc,	%i5,	%g6
	addc	%i1,	%o1,	%g2
	sra	%o6,	0x05,	%i2
	sdivcc	%i3,	0x0FE7,	%i7
	fabsd	%f18,	%f22
	fpadd16	%f26,	%f10,	%f26
	fands	%f6,	%f2,	%f11
	sdivcc	%o7,	0x1E5C,	%l2
	sdivx	%l1,	0x186F,	%o3
	xorcc	%o4,	0x050E,	%l6
	fpsub16	%f14,	%f6,	%f8
	movn	%icc,	%l5,	%g7
	ldd	[%l7 + 0x58],	%l0
	subccc	%l3,	%i4,	%i0
	movrlez	%i6,	0x2EC,	%g1
	fmovrslez	%g4,	%f22,	%f18
	orn	%o2,	%o0,	%g3
	mulx	%l4,	0x1856,	%g5
	fornot1	%f26,	%f6,	%f12
	movrgez	%o5,	%g6,	%i1
	edge16ln	%i5,	%o1,	%o6
	sdivx	%i2,	0x0D0A,	%i3
	xnor	%i7,	0x0328,	%g2
	andcc	%o7,	0x06A6,	%l2
	fcmpeq16	%f2,	%f14,	%o3
	movg	%icc,	%l1,	%o4
	pdist	%f10,	%f22,	%f12
	edge32ln	%l5,	%l6,	%l0
	edge32n	%g7,	%l3,	%i0
	nop
	set	0x31, %g4
	ldsb	[%l7 + %g4],	%i6
	array32	%i4,	%g4,	%g1
	array16	%o2,	%o0,	%g3
	edge16l	%l4,	%o5,	%g6
	andn	%i1,	%i5,	%g5
	movrlez	%o1,	%o6,	%i2
	ldsb	[%l7 + 0x22],	%i3
	and	%g2,	%o7,	%i7
	addcc	%l2,	%l1,	%o4
	orn	%o3,	0x0965,	%l5
	udivcc	%l0,	0x11DE,	%g7
	edge16n	%l6,	%i0,	%i6
	movle	%icc,	%l3,	%g4
	mulscc	%g1,	0x1240,	%o2
	xorcc	%i4,	0x0745,	%g3
	umulcc	%l4,	%o5,	%g6
	fxnor	%f24,	%f18,	%f14
	sdivx	%o0,	0x0C59,	%i5
	smulcc	%g5,	0x1A72,	%i1
	movle	%icc,	%o6,	%o1
	edge16n	%i3,	%i2,	%o7
	edge32	%i7,	%l2,	%l1
	alignaddrl	%g2,	%o4,	%l5
	addccc	%o3,	0x1444,	%l0
	fcmple32	%f14,	%f16,	%l6
	edge16l	%i0,	%g7,	%i6
	movleu	%icc,	%l3,	%g4
	orn	%g1,	%o2,	%i4
	sdiv	%l4,	0x1E36,	%o5
	edge8l	%g3,	%g6,	%i5
	fcmple16	%f6,	%f30,	%o0
	fmovda	%icc,	%f8,	%f5
	fcmps	%fcc1,	%f26,	%f4
	ldsb	[%l7 + 0x11],	%i1
	movrgez	%g5,	%o1,	%i3
	movcc	%xcc,	%o6,	%i2
	subc	%i7,	0x1BFB,	%l2
	andcc	%l1,	0x0516,	%g2
	ldd	[%l7 + 0x50],	%o6
	sethi	0x07B0,	%l5
	edge8l	%o4,	%o3,	%l0
	move	%xcc,	%l6,	%g7
	addcc	%i0,	0x1223,	%i6
	popc	0x01DD,	%g4
	xnor	%g1,	%l3,	%i4
	subcc	%o2,	0x1F78,	%o5
	move	%icc,	%g3,	%l4
	smul	%i5,	%g6,	%o0
	fmovd	%f14,	%f10
	stw	%g5,	[%l7 + 0x70]
	edge16ln	%o1,	%i3,	%i1
	stx	%o6,	[%l7 + 0x60]
	srl	%i2,	%i7,	%l2
	std	%f30,	[%l7 + 0x20]
	ldsb	[%l7 + 0x54],	%g2
	fornot2	%f28,	%f30,	%f14
	fmovsgu	%icc,	%f9,	%f14
	sdivx	%o7,	0x1F11,	%l1
	orcc	%o4,	%o3,	%l5
	edge32l	%l6,	%g7,	%l0
	std	%f30,	[%l7 + 0x68]
	fornot1s	%f6,	%f22,	%f15
	movneg	%icc,	%i0,	%i6
	edge8n	%g1,	%l3,	%i4
	fpadd16s	%f26,	%f14,	%f16
	faligndata	%f24,	%f12,	%f24
	sll	%g4,	0x00,	%o5
	sdiv	%o2,	0x0093,	%l4
	edge8	%g3,	%g6,	%o0
	movrne	%i5,	%g5,	%i3
	edge16	%o1,	%i1,	%i2
	fpack16	%f28,	%f1
	fcmple16	%f20,	%f16,	%i7
	movl	%xcc,	%o6,	%l2
	edge16l	%o7,	%l1,	%o4
	fsrc2	%f30,	%f20
	orn	%o3,	0x0B9C,	%l5
	srl	%g2,	%l6,	%l0
	fmovsn	%icc,	%f17,	%f3
	for	%f12,	%f14,	%f24
	edge32	%i0,	%i6,	%g7
	edge8l	%l3,	%g1,	%i4
	fmovspos	%icc,	%f8,	%f1
	nop
	set	0x2C, %o2
	sth	%o5,	[%l7 + %o2]
	alignaddr	%g4,	%l4,	%o2
	udivx	%g6,	0x0AC2,	%o0
	fmovrdgz	%i5,	%f24,	%f0
	udivcc	%g5,	0x099F,	%i3
	xnor	%o1,	%g3,	%i2
	mulscc	%i7,	0x0EE0,	%i1
	movrlez	%l2,	%o6,	%l1
	alignaddrl	%o7,	%o3,	%l5
	alignaddr	%o4,	%g2,	%l6
	movrlez	%l0,	0x0AB,	%i0
	xnorcc	%i6,	%l3,	%g1
	movgu	%xcc,	%g7,	%o5
	sub	%g4,	%l4,	%i4
	movrlez	%o2,	0x252,	%g6
	fmovsleu	%xcc,	%f18,	%f28
	nop
	set	0x24, %o6
	lduw	[%l7 + %o6],	%o0
	alignaddrl	%g5,	%i5,	%i3
	orncc	%o1,	0x0EEF,	%i2
	movrne	%i7,	0x375,	%i1
	movle	%xcc,	%g3,	%l2
	bshuffle	%f10,	%f26,	%f10
	srax	%l1,	%o6,	%o7
	movneg	%xcc,	%l5,	%o4
	udiv	%o3,	0x0320,	%g2
	sdivx	%l0,	0x0AF0,	%i0
	fmovrslz	%l6,	%f19,	%f16
	fmovdvc	%xcc,	%f20,	%f16
	fmovdge	%xcc,	%f22,	%f12
	srlx	%l3,	%g1,	%i6
	fmovrde	%g7,	%f6,	%f26
	sdiv	%o5,	0x0719,	%l4
	fabsd	%f4,	%f20
	movge	%xcc,	%g4,	%i4
	and	%g6,	0x0DB3,	%o0
	movvs	%xcc,	%g5,	%i5
	fandnot1s	%f2,	%f22,	%f27
	fmovspos	%icc,	%f30,	%f9
	movvc	%icc,	%i3,	%o2
	ldsw	[%l7 + 0x78],	%o1
	edge32l	%i7,	%i1,	%g3
	edge16l	%l2,	%l1,	%o6
	movrne	%i2,	0x3FF,	%l5
	xnor	%o4,	%o7,	%o3
	move	%icc,	%g2,	%i0
	andncc	%l0,	%l3,	%g1
	ldsb	[%l7 + 0x5E],	%i6
	sll	%g7,	0x0F,	%l6
	movrgz	%o5,	0x235,	%l4
	mulx	%i4,	0x125F,	%g6
	ld	[%l7 + 0x50],	%f31
	bshuffle	%f30,	%f30,	%f16
	and	%g4,	0x16CC,	%o0
	umul	%i5,	%g5,	%i3
	movrlz	%o2,	0x319,	%i7
	umulcc	%i1,	%g3,	%l2
	mulscc	%l1,	%o6,	%i2
	fsrc2	%f10,	%f20
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	save %o7, %o4, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f22,	%f24,	%f22
	alignaddr	%o3,	%i0,	%l3
	orn	%l0,	0x1327,	%i6
	ld	[%l7 + 0x78],	%f26
	mulscc	%g7,	%l6,	%g1
	fornot1	%f10,	%f14,	%f28
	mova	%xcc,	%l4,	%o5
	stb	%g6,	[%l7 + 0x24]
	xnor	%g4,	0x0804,	%i4
	movrne	%o0,	%i5,	%g5
	fmovsneg	%xcc,	%f6,	%f8
	movle	%icc,	%i3,	%o2
	array16	%i1,	%i7,	%g3
	nop
	set	0x10, %o5
	ldx	[%l7 + %o5],	%l1
	umul	%l2,	%o6,	%o1
	movneg	%xcc,	%l5,	%i2
	edge32ln	%o4,	%o7,	%o3
	orn	%g2,	%l3,	%l0
	sll	%i0,	%g7,	%l6
	fpmerge	%f29,	%f29,	%f28
	movvc	%icc,	%i6,	%l4
	xnorcc	%o5,	%g6,	%g1
	movg	%xcc,	%i4,	%o0
	fmovdneg	%xcc,	%f29,	%f20
	addccc	%i5,	0x149A,	%g5
	movgu	%xcc,	%i3,	%g4
	fcmps	%fcc0,	%f18,	%f22
	alignaddr	%o2,	%i1,	%i7
	ldd	[%l7 + 0x30],	%l0
	xnor	%l2,	%o6,	%g3
	umul	%o1,	0x0E5B,	%i2
	fmovscs	%icc,	%f17,	%f13
	sdiv	%o4,	0x0420,	%l5
	edge8ln	%o7,	%o3,	%g2
	fcmped	%fcc3,	%f2,	%f12
	add	%l3,	%i0,	%g7
	sdivcc	%l0,	0x1FB6,	%i6
	movvs	%xcc,	%l6,	%l4
	movle	%icc,	%o5,	%g1
	addc	%i4,	0x123A,	%g6
	ldd	[%l7 + 0x68],	%f26
	movge	%xcc,	%i5,	%o0
	st	%f1,	[%l7 + 0x70]
	addcc	%g5,	%g4,	%o2
	movrlz	%i1,	%i7,	%l1
	fmul8x16	%f22,	%f18,	%f20
	stw	%l2,	[%l7 + 0x30]
	fcmpgt32	%f12,	%f14,	%i3
	edge16	%g3,	%o6,	%i2
	restore %o1, 0x1F31, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%o7,	0x17DE,	%o3
	movgu	%xcc,	%g2,	%l5
	movneg	%icc,	%i0,	%l3
	fornot2	%f22,	%f10,	%f0
	fandnot2	%f0,	%f4,	%f18
	or	%l0,	0x043F,	%g7
	xnorcc	%i6,	%l6,	%l4
	movrlez	%g1,	0x362,	%i4
	fmovdne	%icc,	%f3,	%f21
	ldx	[%l7 + 0x38],	%g6
	movl	%xcc,	%i5,	%o0
	fmovdg	%xcc,	%f28,	%f24
	movre	%o5,	%g4,	%g5
	sllx	%i1,	0x01,	%i7
	fmovrdne	%l1,	%f26,	%f30
	edge8l	%o2,	%i3,	%l2
	alignaddr	%o6,	%g3,	%o1
	sth	%i2,	[%l7 + 0x54]
	fabsd	%f26,	%f14
	fxor	%f24,	%f22,	%f20
	array8	%o7,	%o3,	%o4
	movrne	%g2,	%l5,	%i0
	movcc	%icc,	%l3,	%g7
	movcc	%xcc,	%l0,	%i6
	edge32	%l4,	%g1,	%l6
	addccc	%g6,	0x1AC1,	%i4
	stx	%o0,	[%l7 + 0x78]
	xor	%i5,	0x0A20,	%g4
	pdist	%f0,	%f4,	%f16
	nop
	set	0x08, %l1
	stw	%o5,	[%l7 + %l1]
	fmovdpos	%icc,	%f4,	%f15
	smul	%g5,	0x1FC0,	%i1
	andn	%l1,	0x0F03,	%i7
	ldd	[%l7 + 0x48],	%f4
	fsrc2	%f2,	%f14
	fzero	%f4
	stw	%o2,	[%l7 + 0x58]
	movvs	%xcc,	%l2,	%o6
	smulcc	%g3,	%i3,	%o1
	fandnot2	%f30,	%f30,	%f18
	srax	%i2,	%o7,	%o4
	fnegd	%f14,	%f18
	edge8l	%o3,	%l5,	%g2
	ldsw	[%l7 + 0x30],	%l3
	edge32ln	%g7,	%l0,	%i0
	fnor	%f28,	%f16,	%f26
	fmovrsgez	%i6,	%f15,	%f31
	popc	%g1,	%l6
	sra	%l4,	%g6,	%o0
	array32	%i4,	%i5,	%g4
	udiv	%o5,	0x199E,	%i1
	fmovdg	%xcc,	%f20,	%f2
	edge16ln	%l1,	%g5,	%o2
	sir	0x1657
	udivx	%i7,	0x163F,	%o6
	srax	%l2,	0x17,	%i3
	ldd	[%l7 + 0x28],	%g2
	edge16ln	%i2,	%o1,	%o4
	edge32n	%o3,	%o7,	%g2
	std	%f16,	[%l7 + 0x10]
	fmovrse	%l3,	%f12,	%f2
	fmovdn	%xcc,	%f5,	%f18
	movrlez	%l5,	%l0,	%i0
	movne	%xcc,	%g7,	%g1
	movn	%xcc,	%i6,	%l6
	stb	%g6,	[%l7 + 0x44]
	stw	%l4,	[%l7 + 0x5C]
	lduw	[%l7 + 0x34],	%o0
	edge8l	%i5,	%i4,	%o5
	alignaddrl	%g4,	%l1,	%i1
	sra	%o2,	%i7,	%o6
	srax	%l2,	0x17,	%g5
	movgu	%icc,	%g3,	%i2
	movne	%icc,	%i3,	%o4
	alignaddrl	%o1,	%o7,	%g2
	fpadd16	%f16,	%f0,	%f24
	movvs	%icc,	%o3,	%l3
	srax	%l0,	%i0,	%g7
	movre	%g1,	0x34F,	%i6
	std	%f2,	[%l7 + 0x48]
	ldd	[%l7 + 0x20],	%f28
	sdiv	%l6,	0x0433,	%g6
	addcc	%l4,	0x080E,	%o0
	subcc	%l5,	0x1876,	%i4
	ld	[%l7 + 0x78],	%f15
	and	%i5,	%o5,	%l1
	edge32l	%i1,	%g4,	%o2
	umul	%o6,	0x18B0,	%i7
	xnorcc	%l2,	0x10F6,	%g5
	nop
	set	0x29, %o4
	ldub	[%l7 + %o4],	%i2
	xorcc	%i3,	0x1FEC,	%o4
	movrlz	%o1,	%o7,	%g3
	edge32	%g2,	%o3,	%l3
	movle	%icc,	%i0,	%l0
	edge32n	%g7,	%i6,	%l6
	edge16ln	%g1,	%g6,	%l4
	array16	%o0,	%l5,	%i5
	xor	%i4,	0x07AF,	%o5
	andcc	%l1,	0x1C77,	%g4
	sra	%i1,	0x15,	%o2
	edge16l	%o6,	%l2,	%g5
	fmovsneg	%xcc,	%f24,	%f18
	and	%i7,	0x10D8,	%i3
	mova	%xcc,	%o4,	%i2
	addccc	%o1,	0x1433,	%g3
	mova	%xcc,	%g2,	%o3
	fmovscs	%xcc,	%f22,	%f8
	stw	%o7,	[%l7 + 0x48]
	fnands	%f11,	%f7,	%f12
	movrlz	%i0,	%l3,	%g7
	or	%l0,	0x0492,	%l6
	fandnot1	%f22,	%f18,	%f16
	edge32	%g1,	%i6,	%l4
	xnorcc	%g6,	0x1788,	%o0
	ldsh	[%l7 + 0x32],	%i5
	nop
	set	0x15, %o1
	ldsb	[%l7 + %o1],	%i4
	fsrc1	%f16,	%f18
	sll	%l5,	%l1,	%g4
	fmovdgu	%icc,	%f14,	%f4
	mulx	%i1,	%o2,	%o6
	fmovscs	%xcc,	%f30,	%f4
	fcmple16	%f24,	%f24,	%o5
	edge8l	%l2,	%i7,	%g5
	array32	%o4,	%i2,	%o1
	movneg	%xcc,	%g3,	%i3
	movrgz	%g2,	0x355,	%o7
	movge	%xcc,	%i0,	%l3
	fexpand	%f4,	%f0
	fpadd16	%f28,	%f8,	%f12
	xor	%o3,	0x0CE2,	%g7
	edge32	%l0,	%l6,	%i6
	stw	%l4,	[%l7 + 0x50]
	srlx	%g6,	0x0A,	%o0
	ldd	[%l7 + 0x48],	%g0
	andn	%i5,	%i4,	%l1
	orn	%g4,	%i1,	%l5
	mulx	%o2,	0x1990,	%o6
	array32	%o5,	%l2,	%i7
	sir	0x09E7
	bshuffle	%f22,	%f18,	%f20
	mulx	%o4,	0x0D9A,	%i2
	movrgz	%g5,	0x39D,	%o1
	array16	%g3,	%g2,	%o7
	movge	%icc,	%i3,	%l3
	array8	%o3,	%i0,	%g7
	stx	%l6,	[%l7 + 0x20]
	movne	%xcc,	%l0,	%l4
	movcs	%xcc,	%g6,	%i6
	udiv	%o0,	0x0779,	%g1
	fxnor	%f24,	%f16,	%f28
	xnorcc	%i4,	%i5,	%l1
	movne	%xcc,	%i1,	%g4
	movle	%xcc,	%o2,	%o6
	movg	%xcc,	%o5,	%l2
	sth	%l5,	[%l7 + 0x5E]
	edge32	%o4,	%i2,	%i7
	ldsw	[%l7 + 0x30],	%g5
	add	%g3,	%o1,	%g2
	fpsub16	%f0,	%f10,	%f8
	array16	%o7,	%l3,	%o3
	sll	%i0,	0x08,	%g7
	movrne	%i3,	%l0,	%l4
	or	%l6,	%i6,	%g6
	srl	%g1,	%i4,	%i5
	fmovda	%icc,	%f8,	%f1
	and	%o0,	0x0225,	%i1
	fsrc1	%f10,	%f4
	add	%l1,	0x1250,	%o2
	fcmpeq32	%f30,	%f6,	%g4
	udivx	%o5,	0x17E1,	%l2
	subcc	%o6,	0x033D,	%l5
	udiv	%i2,	0x0DD4,	%o4
	movrgz	%g5,	0x2D6,	%g3
	fcmple16	%f4,	%f10,	%o1
	udiv	%i7,	0x11B5,	%g2
	fmovspos	%icc,	%f29,	%f28
	andncc	%o7,	%l3,	%o3
	xnor	%i0,	%g7,	%i3
	srl	%l4,	0x04,	%l6
	array32	%i6,	%l0,	%g1
	fandnot2s	%f11,	%f7,	%f12
	movleu	%icc,	%g6,	%i5
	fpadd16s	%f22,	%f13,	%f12
	array8	%o0,	%i1,	%i4
	edge8ln	%o2,	%l1,	%o5
	fexpand	%f2,	%f20
	xnorcc	%l2,	%g4,	%l5
	xnor	%o6,	%o4,	%g5
	fcmpes	%fcc0,	%f3,	%f22
	nop
	set	0x70, %o0
	ldd	[%l7 + %o0],	%f16
	edge8l	%i2,	%o1,	%g3
	st	%f11,	[%l7 + 0x14]
	fcmpeq16	%f20,	%f10,	%g2
	fmovdg	%xcc,	%f18,	%f21
	umul	%o7,	0x142D,	%i7
	smulcc	%o3,	0x0528,	%l3
	movle	%icc,	%g7,	%i3
	lduw	[%l7 + 0x44],	%i0
	sethi	0x1B0F,	%l4
	movcs	%icc,	%i6,	%l0
	sethi	0x1A3E,	%l6
	subcc	%g1,	%g6,	%o0
	fxor	%f20,	%f6,	%f14
	popc	%i5,	%i1
	orn	%i4,	0x1B7F,	%l1
	fmovrdlz	%o5,	%f0,	%f8
	ldsh	[%l7 + 0x68],	%l2
	orcc	%g4,	%o2,	%o6
	fornot1	%f12,	%f30,	%f8
	movneg	%xcc,	%l5,	%o4
	fandnot1s	%f26,	%f25,	%f7
	ldsw	[%l7 + 0x08],	%g5
	addc	%o1,	%g3,	%g2
	movre	%o7,	%i2,	%i7
	mulscc	%o3,	0x18C6,	%g7
	andncc	%l3,	%i0,	%l4
	fcmpgt16	%f28,	%f12,	%i3
	ldsh	[%l7 + 0x16],	%i6
	subccc	%l0,	%l6,	%g1
	andncc	%o0,	%i5,	%i1
	edge8ln	%i4,	%g6,	%l1
	movleu	%icc,	%l2,	%o5
	movre	%g4,	%o2,	%l5
	movcc	%icc,	%o4,	%g5
	udivx	%o6,	0x0594,	%g3
	edge32n	%g2,	%o7,	%i2
	addc	%o1,	0x015B,	%o3
	fmovsvs	%icc,	%f31,	%f12
	lduw	[%l7 + 0x20],	%i7
	fmovrslez	%g7,	%f9,	%f16
	fmovdg	%xcc,	%f12,	%f9
	fxor	%f30,	%f10,	%f24
	movvs	%icc,	%i0,	%l3
	movrlz	%l4,	%i6,	%l0
	fmovsvc	%icc,	%f31,	%f5
	alignaddr	%i3,	%l6,	%g1
	edge8n	%o0,	%i5,	%i4
	edge16n	%g6,	%l1,	%i1
	mulx	%o5,	%g4,	%o2
	fnor	%f2,	%f20,	%f30
	move	%icc,	%l5,	%l2
	edge8n	%g5,	%o6,	%o4
	ldx	[%l7 + 0x68],	%g2
	lduh	[%l7 + 0x26],	%o7
	movrgez	%i2,	0x1CA,	%o1
	ldd	[%l7 + 0x68],	%f12
	subccc	%o3,	0x151F,	%i7
	sth	%g7,	[%l7 + 0x36]
	mulx	%g3,	%l3,	%l4
	save %i0, %i6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l0,	%g1,	%l6
	movcs	%xcc,	%i5,	%i4
	udivx	%o0,	0x0143,	%g6
	std	%f6,	[%l7 + 0x50]
	edge32	%i1,	%o5,	%g4
	fzero	%f28
	mova	%xcc,	%o2,	%l1
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3636
!	Type f   	: 5409
!	Type i   	: 15955
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x5F246874
.word 0xBBEBF5AF
.word 0x33D8FC50
.word 0x4545C150
.word 0xFF06A1AB
.word 0xC8141FC9
.word 0x3EA9D44B
.word 0x7FE0593A
.word 0xCC9A031A
.word 0x0AA4654F
.word 0x2F747EAA
.word 0xE513A276
.word 0x9B30E830
.word 0x1CA312C4
.word 0xA6A98918
.word 0x1242EC4F
.word 0x77F24692
.word 0x9938CFB1
.word 0xC59123C4
.word 0xBD955457
.word 0xDFB1F8E1
.word 0xAE213FA8
.word 0x8940C6E5
.word 0xFBC4F53F
.word 0x0337BE43
.word 0xEE941232
.word 0xD88FF7A2
.word 0x6A14DAA8
.word 0x8B758EFD
.word 0x3D2A3979
.word 0xE28A026A
.word 0x3AA23ACE
.word 0x8E0ED14E
.word 0x42E1FFDD
.word 0xFA251F15
.word 0x05D84CB7
.word 0x74A8872B
.word 0x6B06097C
.word 0xCA4350E7
.word 0x6A504EB4
.word 0xAB27248F
.word 0x70D0A005
.word 0x48A7BF1B
.word 0x05E77191
.word 0xD64234A5
.word 0x819C6D9B
.word 0x3D7E4212
.word 0x04F4FDC3
.word 0xE1C42098
.word 0xFBF5DF67
.word 0x1D85B1E1
.word 0x37ED56B5
.word 0x56D694F4
.word 0x2BD272F5
.word 0xB57F1DD3
.word 0x6236C670
.word 0x7DEF6E64
.word 0xB63B397C
.word 0x2C6DA62B
.word 0xCF911A42
.word 0xDE507E22
.word 0xEE2CBCCE
.word 0xE4F820E8
.word 0x7535075E
.end
