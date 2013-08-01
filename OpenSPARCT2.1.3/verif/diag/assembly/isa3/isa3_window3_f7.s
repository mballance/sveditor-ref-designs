/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f7.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f7.s,v 1.1 2007/05/11 17:22:39 drp Exp $"
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
	setx	0xDDBD9F12507260F5,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0xD,	%g1
	set	0x0,	%g2
	set	0xD,	%g3
	set	0xD,	%g4
	set	0x4,	%g5
	set	0x6,	%g6
	set	0xA,	%g7
	!# Input registers
	set	-0xF,	%i0
	set	-0x0,	%i1
	set	-0x5,	%i2
	set	-0x7,	%i3
	set	-0x5,	%i4
	set	-0x8,	%i5
	set	-0x3,	%i6
	set	-0x4,	%i7
	!# Local registers
	set	0x68BC2B82,	%l0
	set	0x4C4D1490,	%l1
	set	0x6E628D86,	%l2
	set	0x1863CA61,	%l3
	set	0x6F2B67EF,	%l4
	set	0x058C62DA,	%l5
	set	0x03665603,	%l6
	!# Output registers
	set	0x06E5,	%o0
	set	0x0426,	%o1
	set	-0x0F43,	%o2
	set	0x0EEE,	%o3
	set	-0x0FE2,	%o4
	set	-0x142A,	%o5
	set	-0x1C77,	%o6
	set	0x0A7C,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0x9CE57D66E5FB481E)
	INIT_TH_FP_REG(%l7,%f2,0x6E980354CACD6D6D)
	INIT_TH_FP_REG(%l7,%f4,0x961D69B81A7046F1)
	INIT_TH_FP_REG(%l7,%f6,0xB753F91261E5CF0A)
	INIT_TH_FP_REG(%l7,%f8,0x848931DF03BBAB96)
	INIT_TH_FP_REG(%l7,%f10,0x34A67A053667C11E)
	INIT_TH_FP_REG(%l7,%f12,0xE9BA9FF42142C3B5)
	INIT_TH_FP_REG(%l7,%f14,0x6BE55068620C969D)
	INIT_TH_FP_REG(%l7,%f16,0x2986DA30BBD880B7)
	INIT_TH_FP_REG(%l7,%f18,0xD6852F063C86FF16)
	INIT_TH_FP_REG(%l7,%f20,0x4951D8A8B6E5B5EA)
	INIT_TH_FP_REG(%l7,%f22,0x8D39B8BF5BC9451E)
	INIT_TH_FP_REG(%l7,%f24,0x8EA68159156516ED)
	INIT_TH_FP_REG(%l7,%f26,0x16A5846305819ACC)
	INIT_TH_FP_REG(%l7,%f28,0x7C95A240FA18BCC0)
	INIT_TH_FP_REG(%l7,%f30,0x8B57B8F81CED1494)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	%g0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	edge16ln	%i7,	%l2,	%g1
	movrlez	%g7,	%o7,	%l1
	fpsub16s	%f0,	%f6,	%f21
	smul	%g5,	%o0,	%o1
	edge16l	%i6,	%o2,	%g2
	alignaddrl	%l3,	%i2,	%g4
	movl	%xcc,	%l6,	%l4
	fxnors	%f10,	%f15,	%f29
	fmovsn	%icc,	%f10,	%f21
	popc	%i5,	%g3
	edge32l	%l0,	%o6,	%i3
	xnor	%i1,	0x1E04,	%o3
	array16	%i4,	%o5,	%i0
	stb	%o4,	[%l7 + 0x38]
	ldd	[%l7 + 0x38],	%f20
	edge32ln	%l5,	%g6,	%l2
	stb	%g1,	[%l7 + 0x0F]
	movge	%icc,	%i7,	%g7
	edge16	%o7,	%l1,	%o0
	fxnor	%f2,	%f0,	%f8
	movg	%xcc,	%o1,	%i6
	fnegd	%f10,	%f20
	edge8l	%o2,	%g2,	%l3
	sdiv	%i2,	0x1BCF,	%g4
	stx	%l6,	[%l7 + 0x78]
	fcmpd	%fcc1,	%f8,	%f24
	umulcc	%l4,	%i5,	%g5
	sdiv	%l0,	0x1E89,	%g3
	sdivx	%o6,	0x052A,	%i3
	andcc	%i1,	%i4,	%o3
	fornot1s	%f13,	%f23,	%f28
	edge8	%o5,	%o4,	%l5
	movge	%icc,	%g6,	%l2
	fmovs	%f31,	%f9
	movrgez	%g1,	%i0,	%i7
	movvc	%xcc,	%o7,	%l1
	ld	[%l7 + 0x68],	%f26
	stb	%o0,	[%l7 + 0x67]
	andn	%o1,	0x04C4,	%i6
	std	%f6,	[%l7 + 0x38]
	smulcc	%g7,	0x15BE,	%o2
	fxnors	%f25,	%f14,	%f17
	fmovsvc	%xcc,	%f23,	%f7
	edge16n	%l3,	%i2,	%g4
	lduw	[%l7 + 0x28],	%l6
	umulcc	%l4,	%g2,	%i5
	sub	%l0,	%g5,	%g3
	fmovdvs	%xcc,	%f8,	%f21
	udiv	%i3,	0x0BFE,	%o6
	movvc	%icc,	%i4,	%o3
	movg	%icc,	%o5,	%i1
	fmovsa	%icc,	%f1,	%f27
	movgu	%xcc,	%l5,	%o4
	smul	%g6,	%l2,	%i0
	fmovsge	%xcc,	%f8,	%f25
	fexpand	%f29,	%f0
	movcc	%icc,	%g1,	%i7
	movneg	%icc,	%o7,	%l1
	mova	%xcc,	%o1,	%o0
	fmovde	%xcc,	%f25,	%f9
	movcs	%xcc,	%i6,	%g7
	xnor	%l3,	0x1987,	%i2
	movrlz	%o2,	%l6,	%g4
	orn	%l4,	0x1504,	%g2
	xor	%i5,	%g5,	%g3
	movcs	%xcc,	%l0,	%o6
	addccc	%i3,	%i4,	%o3
	movvs	%icc,	%o5,	%l5
	ldx	[%l7 + 0x78],	%i1
	fpadd32	%f26,	%f12,	%f14
	edge8ln	%o4,	%g6,	%i0
	umul	%l2,	0x04A1,	%i7
	array8	%o7,	%l1,	%o1
	bshuffle	%f8,	%f16,	%f30
	udivcc	%g1,	0x1425,	%o0
	orcc	%g7,	0x0079,	%l3
	fsrc1	%f20,	%f28
	save %i2, %o2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot1s	%f23,	%f1
	movrlz	%g4,	0x13D,	%l4
	fmovrslz	%g2,	%f4,	%f30
	fmovsgu	%xcc,	%f15,	%f9
	fpmerge	%f8,	%f16,	%f14
	movpos	%icc,	%i5,	%g5
	array32	%g3,	%i6,	%o6
	edge8n	%i3,	%i4,	%l0
	st	%f30,	[%l7 + 0x2C]
	fmul8x16al	%f26,	%f18,	%f16
	fpack32	%f30,	%f24,	%f14
	orncc	%o3,	%o5,	%i1
	move	%icc,	%l5,	%g6
	addcc	%o4,	0x15B0,	%i0
	fxor	%f20,	%f2,	%f14
	movcs	%xcc,	%l2,	%i7
	ldsh	[%l7 + 0x14],	%o7
	movleu	%xcc,	%o1,	%l1
	andncc	%o0,	%g7,	%g1
	xnorcc	%l3,	%i2,	%o2
	fors	%f3,	%f24,	%f26
	fpadd32	%f20,	%f26,	%f0
	fmovscc	%icc,	%f2,	%f24
	xor	%g4,	0x1A45,	%l4
	edge16ln	%l6,	%i5,	%g2
	xnor	%g3,	0x1BBB,	%i6
	addc	%o6,	%i3,	%g5
	fmovdge	%icc,	%f22,	%f13
	addccc	%i4,	0x1DB4,	%o3
	fcmped	%fcc2,	%f0,	%f30
	addc	%l0,	%o5,	%i1
	fnors	%f2,	%f27,	%f28
	save %l5, %o4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%l2,	%i0,	%o7
	movne	%icc,	%i7,	%l1
	ldd	[%l7 + 0x40],	%o0
	std	%f24,	[%l7 + 0x78]
	ldsh	[%l7 + 0x5C],	%o1
	stb	%g7,	[%l7 + 0x73]
	edge32ln	%l3,	%g1,	%i2
	fmovsgu	%xcc,	%f30,	%f12
	ldsw	[%l7 + 0x50],	%g4
	movl	%icc,	%o2,	%l4
	ldsw	[%l7 + 0x24],	%i5
	edge32n	%l6,	%g3,	%i6
	movpos	%xcc,	%g2,	%o6
	smul	%g5,	%i4,	%i3
	movrgez	%l0,	0x374,	%o5
	xorcc	%o3,	0x03D4,	%l5
	popc	%i1,	%g6
	movgu	%xcc,	%o4,	%l2
	fmul8sux16	%f20,	%f16,	%f4
	fones	%f13
	fones	%f4
	movrne	%o7,	%i0,	%l1
	fpmerge	%f1,	%f3,	%f4
	stb	%i7,	[%l7 + 0x71]
	sth	%o1,	[%l7 + 0x32]
	sth	%g7,	[%l7 + 0x6A]
	movneg	%icc,	%l3,	%g1
	alignaddr	%o0,	%i2,	%g4
	fmul8sux16	%f20,	%f0,	%f16
	std	%f6,	[%l7 + 0x38]
	andcc	%l4,	0x120E,	%i5
	edge8n	%o2,	%g3,	%i6
	edge8n	%g2,	%l6,	%o6
	edge8	%i4,	%g5,	%i3
	fcmpne16	%f22,	%f26,	%o5
	movvs	%xcc,	%o3,	%l0
	ldsb	[%l7 + 0x39],	%i1
	lduw	[%l7 + 0x74],	%l5
	ldd	[%l7 + 0x40],	%f12
	addccc	%o4,	0x06A6,	%l2
	smul	%g6,	0x05E7,	%i0
	ldx	[%l7 + 0x28],	%o7
	subccc	%i7,	0x1605,	%o1
	smul	%g7,	%l3,	%l1
	array8	%o0,	%g1,	%g4
	ld	[%l7 + 0x20],	%f19
	edge8	%i2,	%i5,	%o2
	fpadd16	%f26,	%f6,	%f26
	fpadd32s	%f1,	%f11,	%f3
	mulscc	%g3,	%l4,	%i6
	ldd	[%l7 + 0x38],	%g2
	smulcc	%l6,	%o6,	%i4
	edge8	%g5,	%i3,	%o5
	ldd	[%l7 + 0x30],	%l0
	ld	[%l7 + 0x24],	%f30
	lduh	[%l7 + 0x12],	%i1
	ldd	[%l7 + 0x38],	%l4
	sir	0x0EEA
	stw	%o4,	[%l7 + 0x0C]
	movrlez	%l2,	0x110,	%o3
	movn	%xcc,	%i0,	%o7
	srl	%i7,	0x03,	%o1
	sdivx	%g7,	0x0D15,	%g6
	nop
	set	0x28, %i7
	std	%f0,	[%l7 + %i7]
	ldsw	[%l7 + 0x54],	%l3
	edge32	%o0,	%l1,	%g4
	sllx	%g1,	%i2,	%i5
	sub	%g3,	%o2,	%i6
	sll	%g2,	%l4,	%l6
	fpadd16	%f14,	%f4,	%f22
	movvc	%icc,	%i4,	%o6
	srlx	%i3,	0x12,	%o5
	edge8n	%g5,	%l0,	%l5
	edge32n	%i1,	%l2,	%o4
	fnands	%f15,	%f1,	%f10
	mulx	%i0,	%o7,	%o3
	fmovdcs	%xcc,	%f19,	%f25
	movleu	%xcc,	%o1,	%g7
	mulx	%i7,	0x1373,	%g6
	move	%xcc,	%l3,	%l1
	alignaddr	%o0,	%g1,	%g4
	ldx	[%l7 + 0x20],	%i5
	edge8ln	%g3,	%o2,	%i2
	sdivcc	%g2,	0x0E91,	%l4
	subcc	%l6,	0x1285,	%i4
	fmovdl	%xcc,	%f26,	%f3
	andncc	%i6,	%o6,	%i3
	edge32ln	%g5,	%l0,	%o5
	umul	%l5,	0x11FE,	%i1
	array16	%l2,	%i0,	%o7
	edge8l	%o4,	%o1,	%o3
	fsrc2s	%f17,	%f21
	array32	%i7,	%g6,	%l3
	ld	[%l7 + 0x6C],	%f13
	xnor	%g7,	%l1,	%g1
	movvc	%icc,	%g4,	%o0
	andn	%i5,	%o2,	%i2
	ldd	[%l7 + 0x08],	%f18
	mulscc	%g3,	0x1898,	%l4
	movrgez	%g2,	%i4,	%i6
	std	%f18,	[%l7 + 0x68]
	alignaddr	%o6,	%i3,	%l6
	movneg	%xcc,	%g5,	%o5
	fmovdvc	%icc,	%f25,	%f11
	ldsw	[%l7 + 0x18],	%l5
	sdivx	%i1,	0x047E,	%l2
	srl	%l0,	0x16,	%i0
	smul	%o4,	%o1,	%o7
	andn	%i7,	%g6,	%o3
	sra	%l3,	0x1E,	%l1
	movge	%xcc,	%g1,	%g4
	orn	%o0,	%i5,	%o2
	ldub	[%l7 + 0x0C],	%g7
	movgu	%xcc,	%i2,	%l4
	movcc	%xcc,	%g3,	%g2
	movl	%xcc,	%i6,	%o6
	udiv	%i4,	0x1F1E,	%i3
	fcmple16	%f18,	%f18,	%g5
	edge32l	%l6,	%l5,	%o5
	sllx	%i1,	0x04,	%l2
	edge32	%i0,	%l0,	%o1
	movrne	%o7,	%i7,	%o4
	fsrc2s	%f29,	%f4
	udivcc	%g6,	0x1FD4,	%l3
	srlx	%l1,	%g1,	%o3
	srlx	%g4,	%i5,	%o0
	lduh	[%l7 + 0x16],	%o2
	edge32	%i2,	%g7,	%l4
	sllx	%g3,	0x12,	%i6
	edge8	%g2,	%i4,	%o6
	edge32	%i3,	%g5,	%l5
	subcc	%l6,	%i1,	%l2
	addccc	%o5,	0x009F,	%l0
	ldsh	[%l7 + 0x40],	%o1
	fmovdge	%xcc,	%f21,	%f26
	sir	0x05B7
	mova	%icc,	%i0,	%i7
	fcmple16	%f0,	%f2,	%o7
	and	%g6,	0x1467,	%l3
	fmovdgu	%xcc,	%f28,	%f26
	movrgez	%l1,	%o4,	%o3
	fmovdge	%xcc,	%f21,	%f8
	fmul8ulx16	%f28,	%f10,	%f16
	std	%f4,	[%l7 + 0x18]
	edge16	%g4,	%i5,	%o0
	udivcc	%o2,	0x1B3E,	%i2
	movleu	%xcc,	%g7,	%l4
	lduh	[%l7 + 0x36],	%g1
	st	%f21,	[%l7 + 0x40]
	fmuld8ulx16	%f24,	%f0,	%f2
	sir	0x163E
	srlx	%g3,	%i6,	%i4
	addc	%g2,	%o6,	%i3
	movgu	%xcc,	%l5,	%l6
	fmovsg	%icc,	%f5,	%f29
	std	%f4,	[%l7 + 0x40]
	movvc	%icc,	%g5,	%i1
	mulscc	%l2,	%o5,	%o1
	srlx	%l0,	%i7,	%i0
	smul	%o7,	%g6,	%l3
	ldsb	[%l7 + 0x25],	%l1
	or	%o3,	%o4,	%i5
	array16	%g4,	%o2,	%o0
	umul	%g7,	0x1007,	%i2
	popc	%l4,	%g1
	sir	0x07E6
	fcmpne32	%f24,	%f20,	%g3
	udivx	%i4,	0x147B,	%g2
	fsrc1s	%f6,	%f15
	sdivx	%o6,	0x1850,	%i6
	movgu	%icc,	%l5,	%i3
	udivx	%g5,	0x11DB,	%l6
	fxor	%f6,	%f18,	%f2
	umul	%i1,	0x1814,	%l2
	ldd	[%l7 + 0x20],	%f6
	movrgz	%o1,	0x17E,	%l0
	pdist	%f4,	%f2,	%f18
	fcmpd	%fcc1,	%f30,	%f20
	sir	0x0E14
	alignaddr	%o5,	%i7,	%i0
	fpmerge	%f7,	%f20,	%f30
	fmovdcs	%xcc,	%f25,	%f7
	stw	%g6,	[%l7 + 0x1C]
	movre	%l3,	%o7,	%o3
	save %o4, 0x1C3B, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	%o2,	%o0
	or	%g7,	%i2,	%l4
	edge8l	%g1,	%l1,	%g3
	andcc	%g2,	0x1AC0,	%o6
	move	%xcc,	%i6,	%i4
	edge8l	%i3,	%g5,	%l5
	fmovrsgz	%i1,	%f28,	%f31
	stx	%l6,	[%l7 + 0x48]
	restore %l2, %o1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f18,	[%l7 + 0x18]
	fnot2	%f22,	%f6
	fornot1	%f26,	%f16,	%f16
	xnorcc	%i7,	0x0619,	%o5
	movge	%xcc,	%i0,	%g6
	andcc	%o7,	0x0A07,	%o3
	umulcc	%o4,	0x08C8,	%i5
	movcc	%xcc,	%l3,	%o2
	sll	%o0,	%g4,	%i2
	udiv	%g7,	0x1BA1,	%l4
	lduh	[%l7 + 0x1A],	%g1
	movvc	%xcc,	%l1,	%g2
	sdivcc	%g3,	0x1E2A,	%i6
	popc	0x06F9,	%o6
	fmul8ulx16	%f18,	%f8,	%f24
	orncc	%i4,	%i3,	%g5
	edge16l	%i1,	%l5,	%l2
	fpack16	%f8,	%f22
	fmovrse	%o1,	%f24,	%f8
	srl	%l6,	%l0,	%o5
	fpack32	%f4,	%f20,	%f28
	edge8l	%i7,	%i0,	%o7
	ldsh	[%l7 + 0x08],	%o3
	array16	%o4,	%g6,	%l3
	add	%o2,	%i5,	%g4
	fpadd32	%f22,	%f20,	%f16
	sir	0x01B8
	andn	%o0,	0x1EEB,	%i2
	fmovrse	%l4,	%f29,	%f21
	movleu	%icc,	%g7,	%g1
	fsrc2s	%f24,	%f3
	ldsb	[%l7 + 0x48],	%l1
	orncc	%g3,	0x1B57,	%g2
	movne	%icc,	%i6,	%i4
	fxors	%f3,	%f5,	%f1
	movcs	%icc,	%o6,	%i3
	edge16ln	%i1,	%g5,	%l2
	edge8l	%o1,	%l6,	%l5
	move	%xcc,	%l0,	%o5
	movl	%xcc,	%i0,	%o7
	alignaddr	%i7,	%o3,	%o4
	movrne	%l3,	%o2,	%i5
	st	%f14,	[%l7 + 0x28]
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	edge32l	%g6,	%l4,	%i2
	array8	%g7,	%l1,	%g1
	sll	%g2,	%g3,	%i6
	mova	%xcc,	%o6,	%i4
	movrgz	%i1,	%i3,	%l2
	fand	%f20,	%f24,	%f12
	edge32n	%g5,	%o1,	%l6
	movvs	%xcc,	%l5,	%l0
	fcmple32	%f8,	%f16,	%i0
	umulcc	%o7,	0x0DEC,	%i7
	addc	%o5,	0x1252,	%o4
	movneg	%xcc,	%l3,	%o3
	subc	%o2,	0x0912,	%i5
	save %g4, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%i2,	%l4
	popc	0x1C6B,	%g7
	fmovd	%f24,	%f18
	addc	%g1,	0x197C,	%g2
	fmuld8sux16	%f5,	%f13,	%f8
	stx	%l1,	[%l7 + 0x58]
	srl	%g3,	%i6,	%o6
	movre	%i1,	0x095,	%i3
	sdivx	%l2,	0x0B8C,	%g5
	fnand	%f30,	%f14,	%f12
	orcc	%o1,	0x1C04,	%l6
	andn	%l5,	0x1A81,	%l0
	st	%f22,	[%l7 + 0x4C]
	edge16l	%i4,	%i0,	%o7
	or	%i7,	0x172E,	%o4
	std	%f22,	[%l7 + 0x30]
	edge16ln	%l3,	%o3,	%o5
	movne	%xcc,	%i5,	%o2
	movrlz	%g6,	0x332,	%o0
	std	%f30,	[%l7 + 0x38]
	movrgz	%i2,	0x1EA,	%g4
	addccc	%g7,	%g1,	%g2
	movcs	%icc,	%l4,	%l1
	udivx	%i6,	0x04CE,	%g3
	ldsw	[%l7 + 0x24],	%i1
	sdiv	%i3,	0x027B,	%l2
	orncc	%g5,	%o6,	%o1
	and	%l6,	0x138D,	%l5
	for	%f4,	%f10,	%f8
	ldsb	[%l7 + 0x75],	%l0
	edge32	%i4,	%o7,	%i0
	udivx	%o4,	0x0C9A,	%i7
	xorcc	%l3,	0x025D,	%o3
	fmovdvc	%icc,	%f27,	%f24
	sth	%i5,	[%l7 + 0x4A]
	xnorcc	%o5,	%o2,	%g6
	orncc	%o0,	%i2,	%g7
	xor	%g4,	%g2,	%l4
	stb	%l1,	[%l7 + 0x4A]
	xorcc	%g1,	0x1D78,	%i6
	srl	%i1,	%i3,	%l2
	restore %g3, %o6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f10,	[%l7 + 0x70]
	ldx	[%l7 + 0x40],	%o1
	save %l5, 0x0FD0, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%icc,	%i4,	%o7
	fabsd	%f28,	%f20
	ld	[%l7 + 0x5C],	%f29
	udivx	%i0,	0x0929,	%o4
	ldsh	[%l7 + 0x14],	%l0
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	edge8l	%i5,	%o5,	%o3
	edge32	%g6,	%o0,	%i2
	movrgez	%g7,	0x0D8,	%g4
	movrgez	%g2,	0x1AA,	%o2
	movg	%icc,	%l1,	%g1
	mova	%xcc,	%l4,	%i6
	fmovscc	%xcc,	%f10,	%f22
	ldub	[%l7 + 0x2D],	%i3
	mulx	%i1,	0x0DEA,	%l2
	sllx	%o6,	%g3,	%o1
	stx	%l5,	[%l7 + 0x20]
	st	%f30,	[%l7 + 0x18]
	alignaddr	%l6,	%g5,	%i4
	edge16	%o7,	%o4,	%l0
	save %l3, 0x0818, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i5,	0x09A3,	%i7
	ldd	[%l7 + 0x10],	%f14
	addccc	%o3,	0x1A28,	%o5
	std	%f30,	[%l7 + 0x60]
	subccc	%g6,	0x1849,	%o0
	udivcc	%i2,	0x02C8,	%g7
	edge16n	%g4,	%o2,	%l1
	edge8n	%g1,	%g2,	%l4
	stw	%i6,	[%l7 + 0x40]
	popc	%i1,	%i3
	orncc	%l2,	%g3,	%o1
	edge32n	%o6,	%l5,	%g5
	ldsw	[%l7 + 0x1C],	%l6
	edge16l	%i4,	%o7,	%l0
	xnorcc	%l3,	%o4,	%i0
	sethi	0x1DE5,	%i7
	movvc	%xcc,	%o3,	%i5
	udivx	%o5,	0x08AA,	%o0
	movn	%icc,	%i2,	%g6
	ldsb	[%l7 + 0x3C],	%g7
	umulcc	%o2,	0x0C92,	%l1
	movneg	%xcc,	%g1,	%g4
	xorcc	%g2,	0x0A3B,	%i6
	fmovd	%f12,	%f0
	sdivcc	%l4,	0x0272,	%i3
	st	%f27,	[%l7 + 0x74]
	fornot1	%f8,	%f26,	%f4
	orn	%l2,	%i1,	%g3
	mova	%icc,	%o1,	%o6
	edge16ln	%g5,	%l5,	%l6
	orncc	%i4,	%o7,	%l3
	fand	%f14,	%f8,	%f12
	stx	%l0,	[%l7 + 0x68]
	fandnot1s	%f15,	%f30,	%f28
	fxor	%f8,	%f18,	%f14
	ldd	[%l7 + 0x20],	%o4
	movrlz	%i0,	%i7,	%i5
	movgu	%icc,	%o5,	%o3
	orncc	%o0,	0x0384,	%i2
	ldx	[%l7 + 0x78],	%g7
	umul	%g6,	%l1,	%o2
	ldd	[%l7 + 0x18],	%g0
	ldsh	[%l7 + 0x3E],	%g4
	ldx	[%l7 + 0x30],	%i6
	fabss	%f7,	%f3
	fabss	%f8,	%f10
	srl	%l4,	%g2,	%i3
	movl	%icc,	%i1,	%g3
	popc	0x145A,	%l2
	umul	%o1,	0x0F58,	%g5
	udivx	%l5,	0x1738,	%l6
	sllx	%i4,	%o6,	%l3
	movcc	%xcc,	%l0,	%o4
	xnorcc	%i0,	%o7,	%i7
	lduh	[%l7 + 0x4E],	%i5
	movl	%xcc,	%o5,	%o0
	restore %i2, %o3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%g6,	%o2,	%l1
	ldd	[%l7 + 0x38],	%f26
	movgu	%icc,	%g4,	%i6
	movrgz	%l4,	%g2,	%g1
	mulx	%i1,	0x0D66,	%g3
	sra	%l2,	%o1,	%g5
	nop
	set	0x60, %l2
	stx	%l5,	[%l7 + %l2]
	subc	%i3,	0x12AC,	%l6
	orcc	%i4,	0x0E10,	%l3
	stw	%l0,	[%l7 + 0x6C]
	andcc	%o6,	%i0,	%o7
	sra	%o4,	0x09,	%i5
	movcc	%xcc,	%o5,	%o0
	move	%icc,	%i2,	%i7
	movrlez	%g7,	0x26E,	%g6
	sllx	%o3,	%l1,	%g4
	ldsh	[%l7 + 0x5A],	%o2
	addccc	%i6,	%l4,	%g2
	srlx	%i1,	0x0D,	%g3
	movge	%xcc,	%l2,	%g1
	fzero	%f28
	fmovdcc	%xcc,	%f9,	%f23
	fandnot1	%f30,	%f16,	%f18
	edge8n	%o1,	%g5,	%l5
	pdist	%f30,	%f0,	%f6
	movge	%xcc,	%i3,	%i4
	sdivcc	%l6,	0x1EEF,	%l0
	fandnot2	%f2,	%f10,	%f4
	ldd	[%l7 + 0x30],	%o6
	movge	%icc,	%i0,	%o7
	lduw	[%l7 + 0x1C],	%l3
	fxnors	%f9,	%f3,	%f31
	fmovdge	%xcc,	%f28,	%f18
	fmovrsgz	%i5,	%f1,	%f19
	smul	%o5,	%o0,	%o4
	edge16l	%i2,	%i7,	%g7
	array32	%o3,	%l1,	%g6
	udivx	%g4,	0x12B8,	%o2
	ldx	[%l7 + 0x08],	%i6
	stw	%l4,	[%l7 + 0x1C]
	fcmpgt16	%f12,	%f18,	%g2
	srl	%i1,	%l2,	%g1
	move	%xcc,	%g3,	%o1
	fmovrse	%g5,	%f10,	%f10
	srlx	%l5,	%i4,	%i3
	sethi	0x053A,	%l0
	fmovrslez	%l6,	%f24,	%f27
	stb	%i0,	[%l7 + 0x0F]
	xorcc	%o7,	%o6,	%l3
	popc	%i5,	%o5
	lduw	[%l7 + 0x14],	%o0
	movn	%icc,	%i2,	%i7
	edge16n	%o4,	%o3,	%l1
	sir	0x106E
	orn	%g6,	0x08FF,	%g7
	movcs	%icc,	%o2,	%i6
	movl	%xcc,	%l4,	%g2
	andncc	%g4,	%i1,	%g1
	sllx	%l2,	0x0B,	%o1
	fmuld8sux16	%f10,	%f13,	%f22
	ldsh	[%l7 + 0x38],	%g5
	and	%g3,	0x0E17,	%l5
	fcmpd	%fcc2,	%f6,	%f24
	edge32	%i4,	%i3,	%l0
	ldx	[%l7 + 0x70],	%l6
	sll	%i0,	0x04,	%o6
	sdiv	%o7,	0x1C78,	%i5
	umul	%o5,	%l3,	%o0
	array8	%i7,	%o4,	%i2
	st	%f23,	[%l7 + 0x5C]
	sdiv	%l1,	0x0F4D,	%g6
	fmovsne	%icc,	%f4,	%f24
	fmovdg	%xcc,	%f28,	%f3
	ldd	[%l7 + 0x78],	%f14
	fpadd16	%f14,	%f18,	%f14
	edge16	%g7,	%o3,	%i6
	fandnot1	%f24,	%f10,	%f4
	sllx	%o2,	%g2,	%g4
	movre	%i1,	0x2AB,	%g1
	st	%f1,	[%l7 + 0x20]
	ldub	[%l7 + 0x29],	%l4
	fmovdle	%icc,	%f14,	%f20
	array8	%o1,	%l2,	%g3
	ldub	[%l7 + 0x51],	%g5
	fmovsne	%icc,	%f19,	%f19
	fnot2s	%f12,	%f24
	fcmpeq16	%f24,	%f26,	%i4
	andn	%l5,	%i3,	%l0
	sethi	0x079A,	%i0
	orcc	%o6,	0x0D70,	%l6
	fpadd16	%f30,	%f24,	%f24
	fandnot2s	%f5,	%f2,	%f25
	addccc	%o7,	%i5,	%l3
	sdivx	%o0,	0x004F,	%i7
	sdivx	%o4,	0x1C02,	%o5
	fmovdneg	%icc,	%f29,	%f8
	fcmple32	%f6,	%f8,	%l1
	ldub	[%l7 + 0x60],	%g6
	mulx	%i2,	0x1E01,	%g7
	fmovdge	%xcc,	%f18,	%f2
	movneg	%icc,	%i6,	%o3
	fmovde	%xcc,	%f17,	%f29
	mulscc	%o2,	%g2,	%i1
	mova	%xcc,	%g4,	%l4
	array8	%o1,	%l2,	%g3
	edge32l	%g5,	%g1,	%l5
	nop
	set	0x5E, %o7
	stb	%i3,	[%l7 + %o7]
	fcmped	%fcc2,	%f16,	%f2
	addccc	%l0,	0x1488,	%i4
	movneg	%icc,	%o6,	%i0
	fmovdcs	%xcc,	%f31,	%f16
	addcc	%o7,	0x1572,	%l6
	orncc	%i5,	0x1DE1,	%o0
	edge32l	%i7,	%o4,	%l3
	umul	%l1,	0x1232,	%g6
	sdiv	%i2,	0x08D5,	%g7
	subc	%o5,	%o3,	%o2
	fornot1s	%f0,	%f29,	%f6
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	ldsw	[%l7 + 0x28],	%g4
	movle	%icc,	%i1,	%l4
	ldsh	[%l7 + 0x7E],	%o1
	movle	%icc,	%g3,	%g5
	sdivcc	%l2,	0x0DD6,	%g1
	ldsb	[%l7 + 0x73],	%i3
	movrlz	%l5,	0x130,	%l0
	subccc	%o6,	0x176C,	%i0
	smulcc	%i4,	0x013F,	%l6
	subcc	%i5,	%o7,	%i7
	edge16n	%o4,	%o0,	%l1
	ldub	[%l7 + 0x63],	%l3
	alignaddrl	%i2,	%g7,	%o5
	fpadd32	%f18,	%f20,	%f30
	edge16n	%o3,	%g6,	%g2
	ld	[%l7 + 0x30],	%f0
	fmovdvc	%icc,	%f28,	%f13
	srl	%i6,	%g4,	%i1
	orn	%o2,	0x0603,	%l4
	fmovdl	%xcc,	%f19,	%f22
	sir	0x0298
	movleu	%xcc,	%o1,	%g5
	movrgz	%l2,	0x314,	%g3
	smul	%i3,	0x0479,	%l5
	save %g1, %l0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i4,	0x00F3,	%o6
	srl	%i5,	%o7,	%l6
	alignaddr	%o4,	%i7,	%o0
	umulcc	%l1,	0x1FB4,	%i2
	fcmpgt32	%f24,	%f20,	%l3
	fmovrsgez	%o5,	%f30,	%f4
	xorcc	%g7,	0x1CFE,	%g6
	fnot2s	%f19,	%f15
	fmovrdne	%o3,	%f4,	%f18
	fmovrslz	%i6,	%f9,	%f30
	movleu	%xcc,	%g4,	%i1
	array32	%o2,	%g2,	%l4
	fors	%f12,	%f12,	%f16
	sethi	0x0291,	%o1
	stw	%g5,	[%l7 + 0x78]
	xnor	%g3,	%i3,	%l2
	mulscc	%l5,	%l0,	%g1
	edge8l	%i0,	%i4,	%o6
	xnor	%i5,	0x17D5,	%l6
	srax	%o4,	0x03,	%o7
	orn	%i7,	%o0,	%l1
	movgu	%icc,	%l3,	%i2
	fornot1s	%f18,	%f15,	%f31
	addcc	%g7,	%o5,	%g6
	fmovda	%icc,	%f9,	%f25
	movrgz	%i6,	%o3,	%i1
	sdivcc	%g4,	0x162D,	%o2
	subc	%l4,	%g2,	%g5
	umulcc	%g3,	0x1A5D,	%i3
	st	%f15,	[%l7 + 0x68]
	movne	%xcc,	%o1,	%l2
	ldx	[%l7 + 0x60],	%l5
	movrlz	%g1,	%i0,	%l0
	movne	%icc,	%o6,	%i5
	edge8ln	%l6,	%o4,	%o7
	ldd	[%l7 + 0x60],	%i6
	add	%i4,	0x03F2,	%o0
	smulcc	%l3,	0x1BE9,	%i2
	subccc	%g7,	%o5,	%g6
	movre	%i6,	0x229,	%o3
	stx	%l1,	[%l7 + 0x78]
	ldsh	[%l7 + 0x2E],	%g4
	subc	%o2,	0x19D6,	%l4
	edge16	%g2,	%g5,	%i1
	movneg	%xcc,	%g3,	%i3
	movgu	%icc,	%l2,	%l5
	movrlz	%o1,	%g1,	%i0
	fmovsgu	%xcc,	%f3,	%f10
	std	%f20,	[%l7 + 0x18]
	orcc	%o6,	%i5,	%l6
	movrgez	%o4,	0x0B4,	%o7
	fmovdvs	%icc,	%f25,	%f2
	edge32l	%l0,	%i7,	%o0
	ldub	[%l7 + 0x39],	%l3
	sllx	%i4,	0x17,	%g7
	movle	%icc,	%i2,	%o5
	sth	%i6,	[%l7 + 0x60]
	ldsh	[%l7 + 0x5C],	%o3
	srlx	%l1,	0x0D,	%g4
	sll	%o2,	0x1C,	%g6
	sdivcc	%l4,	0x0A68,	%g2
	fmovdne	%icc,	%f29,	%f22
	movneg	%xcc,	%i1,	%g5
	sdiv	%i3,	0x0E97,	%g3
	sdivcc	%l2,	0x128B,	%l5
	fandnot1s	%f25,	%f11,	%f26
	fmovrslez	%o1,	%f8,	%f24
	or	%i0,	0x1684,	%o6
	movneg	%xcc,	%i5,	%l6
	sdivx	%g1,	0x0267,	%o4
	xnor	%l0,	0x03AF,	%i7
	fsrc2	%f0,	%f30
	edge16	%o7,	%o0,	%l3
	std	%f8,	[%l7 + 0x08]
	sdivx	%i4,	0x0A53,	%g7
	smul	%o5,	%i2,	%o3
	ldd	[%l7 + 0x50],	%i6
	add	%l1,	0x00C3,	%g4
	fcmpeq16	%f16,	%f16,	%g6
	movn	%xcc,	%o2,	%g2
	fmovd	%f14,	%f18
	movvc	%icc,	%l4,	%i1
	and	%i3,	%g3,	%g5
	edge16ln	%l5,	%l2,	%o1
	fzero	%f30
	sethi	0x00C3,	%o6
	addcc	%i5,	%l6,	%i0
	restore %g1, 0x03A1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%i7,	0x0887,	%o7
	sth	%o4,	[%l7 + 0x20]
	save %o0, %i4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x5A],	%g7
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	xor	%i6,	0x12B1,	%i2
	add	%l1,	%g4,	%o2
	siam	0x7
	alignaddrl	%g2,	%g6,	%l4
	addc	%i3,	0x0830,	%i1
	movrlez	%g5,	%g3,	%l5
	fsrc2	%f12,	%f6
	ldx	[%l7 + 0x28],	%o1
	xnor	%l2,	%o6,	%i5
	udiv	%i0,	0x1D34,	%l6
	alignaddr	%g1,	%l0,	%o7
	movleu	%icc,	%o4,	%o0
	edge32ln	%i7,	%i4,	%g7
	save %l3, 0x14B3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i6,	%o5,	%l1
	array8	%g4,	%o2,	%g2
	movrgez	%g6,	0x14D,	%i2
	ldub	[%l7 + 0x7F],	%l4
	fmovrsgez	%i3,	%f1,	%f10
	for	%f12,	%f14,	%f16
	movcc	%icc,	%i1,	%g3
	udiv	%l5,	0x1BE2,	%g5
	sll	%o1,	0x0F,	%o6
	movcs	%icc,	%l2,	%i0
	and	%l6,	%i5,	%g1
	addc	%l0,	0x1187,	%o4
	fmovrse	%o7,	%f11,	%f5
	movrgz	%o0,	0x3B1,	%i4
	movrlz	%i7,	%l3,	%o3
	ldx	[%l7 + 0x30],	%g7
	fmovdpos	%xcc,	%f16,	%f7
	movrgez	%i6,	0x1F6,	%o5
	mulscc	%g4,	0x01D7,	%o2
	sth	%l1,	[%l7 + 0x46]
	popc	%g6,	%i2
	smulcc	%g2,	0x06D8,	%i3
	orncc	%l4,	0x10D1,	%i1
	movre	%g3,	0x2C2,	%l5
	edge16ln	%g5,	%o1,	%o6
	sra	%l2,	0x0B,	%i0
	std	%f2,	[%l7 + 0x78]
	fzero	%f10
	smulcc	%i5,	0x1887,	%l6
	lduw	[%l7 + 0x1C],	%l0
	sdivcc	%o4,	0x01D8,	%g1
	sethi	0x0D1C,	%o0
	fandnot1s	%f20,	%f27,	%f30
	movcc	%icc,	%i4,	%i7
	lduw	[%l7 + 0x58],	%o7
	movvs	%icc,	%o3,	%l3
	movrlz	%g7,	%i6,	%o5
	edge8n	%g4,	%o2,	%l1
	xnor	%i2,	%g2,	%i3
	orncc	%l4,	0x0C0C,	%g6
	ldsb	[%l7 + 0x2A],	%i1
	xor	%l5,	%g3,	%g5
	sethi	0x0B59,	%o6
	add	%l2,	%i0,	%o1
	st	%f28,	[%l7 + 0x30]
	ldub	[%l7 + 0x62],	%i5
	popc	0x00FC,	%l6
	fnands	%f26,	%f28,	%f7
	movn	%icc,	%o4,	%g1
	edge16ln	%l0,	%i4,	%o0
	xor	%i7,	%o7,	%l3
	popc	%g7,	%o3
	fmovrslez	%o5,	%f31,	%f29
	orn	%g4,	%i6,	%l1
	andcc	%i2,	%o2,	%g2
	smul	%l4,	0x015B,	%g6
	movg	%icc,	%i1,	%i3
	srl	%g3,	%g5,	%o6
	fpsub16	%f26,	%f2,	%f8
	lduh	[%l7 + 0x30],	%l2
	stb	%l5,	[%l7 + 0x5D]
	fnot1s	%f18,	%f25
	fnors	%f21,	%f20,	%f19
	mova	%icc,	%i0,	%i5
	lduw	[%l7 + 0x7C],	%l6
	fmovrslez	%o4,	%f24,	%f14
	addc	%g1,	%l0,	%o1
	ldd	[%l7 + 0x50],	%i4
	sll	%i7,	0x0C,	%o7
	nop
	set	0x51, %g6
	stb	%o0,	[%l7 + %g6]
	fmovdl	%xcc,	%f12,	%f29
	movrlez	%g7,	%o3,	%l3
	ldsh	[%l7 + 0x74],	%o5
	fpmerge	%f19,	%f4,	%f12
	movrlz	%i6,	%l1,	%g4
	sub	%i2,	%o2,	%l4
	movrgez	%g6,	%i1,	%g2
	save %g3, %g5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l2,	0x051F,	%l5
	nop
	set	0x44, %o5
	ldsw	[%l7 + %o5],	%i0
	xnor	%o6,	0x145E,	%i5
	smulcc	%l6,	%o4,	%g1
	fmovda	%icc,	%f18,	%f17
	xorcc	%l0,	0x1E4B,	%o1
	xnor	%i4,	%i7,	%o0
	mova	%icc,	%o7,	%g7
	srlx	%l3,	%o5,	%i6
	fmovdneg	%icc,	%f13,	%f6
	alignaddrl	%l1,	%o3,	%g4
	addcc	%i2,	0x16FB,	%o2
	mulscc	%l4,	0x00E9,	%i1
	fmovrsne	%g2,	%f29,	%f0
	fmovd	%f18,	%f26
	subc	%g6,	%g5,	%i3
	xnor	%l2,	%l5,	%i0
	stw	%o6,	[%l7 + 0x48]
	movcs	%xcc,	%i5,	%l6
	addc	%o4,	%g3,	%l0
	lduw	[%l7 + 0x30],	%g1
	ldub	[%l7 + 0x47],	%i4
	edge8l	%i7,	%o0,	%o1
	lduw	[%l7 + 0x5C],	%o7
	sra	%l3,	0x00,	%o5
	sll	%g7,	%i6,	%l1
	movrgez	%g4,	%o3,	%o2
	fmovscs	%icc,	%f5,	%f18
	movleu	%icc,	%i2,	%i1
	umulcc	%l4,	0x05AE,	%g2
	sdivcc	%g6,	0x0933,	%g5
	movgu	%icc,	%l2,	%l5
	umul	%i3,	0x12E9,	%i0
	movge	%icc,	%i5,	%o6
	movvs	%xcc,	%l6,	%g3
	fabsd	%f10,	%f16
	sethi	0x0363,	%l0
	edge8ln	%g1,	%i4,	%i7
	mulx	%o4,	%o1,	%o0
	fsrc1	%f6,	%f22
	fmul8x16au	%f23,	%f13,	%f26
	andncc	%l3,	%o7,	%o5
	addcc	%i6,	%l1,	%g4
	movrgez	%g7,	0x0D0,	%o3
	fcmps	%fcc3,	%f29,	%f12
	fmovsne	%xcc,	%f2,	%f29
	umulcc	%o2,	0x0A81,	%i2
	edge8n	%i1,	%g2,	%g6
	fmul8x16	%f20,	%f18,	%f4
	fmovrsgez	%g5,	%f9,	%f17
	alignaddrl	%l2,	%l5,	%i3
	lduh	[%l7 + 0x3C],	%l4
	sir	0x1191
	stb	%i5,	[%l7 + 0x40]
	array8	%o6,	%i0,	%g3
	movgu	%icc,	%l6,	%l0
	alignaddr	%i4,	%g1,	%o4
	movre	%i7,	0x384,	%o1
	stb	%l3,	[%l7 + 0x63]
	edge8ln	%o7,	%o0,	%i6
	andcc	%o5,	0x1154,	%l1
	xnor	%g7,	0x01C9,	%g4
	fmovdvc	%icc,	%f29,	%f12
	sub	%o2,	0x00D8,	%o3
	fmovrslz	%i1,	%f1,	%f26
	fmovdpos	%icc,	%f27,	%f6
	ld	[%l7 + 0x48],	%f27
	movre	%g2,	0x14F,	%i2
	edge32n	%g5,	%g6,	%l5
	movrlz	%i3,	%l2,	%i5
	mulscc	%o6,	%i0,	%g3
	fmovdgu	%xcc,	%f22,	%f30
	srax	%l6,	%l4,	%l0
	array16	%i4,	%g1,	%i7
	ldsw	[%l7 + 0x50],	%o4
	array16	%l3,	%o7,	%o0
	stw	%o1,	[%l7 + 0x6C]
	fmovdg	%icc,	%f29,	%f1
	movvc	%xcc,	%i6,	%o5
	andcc	%g7,	%g4,	%o2
	sdivcc	%o3,	0x01A2,	%l1
	edge8ln	%g2,	%i2,	%i1
	movge	%icc,	%g5,	%g6
	sth	%l5,	[%l7 + 0x0A]
	xnorcc	%i3,	0x07E0,	%i5
	movl	%xcc,	%o6,	%l2
	movre	%i0,	0x189,	%g3
	movneg	%icc,	%l4,	%l0
	stw	%i4,	[%l7 + 0x4C]
	array8	%g1,	%l6,	%o4
	movvs	%icc,	%i7,	%o7
	ldub	[%l7 + 0x36],	%l3
	xnor	%o0,	%i6,	%o1
	subccc	%o5,	0x0CC3,	%g7
	sra	%g4,	%o2,	%o3
	edge16	%g2,	%i2,	%l1
	fmovsa	%icc,	%f28,	%f23
	edge8ln	%i1,	%g6,	%g5
	ld	[%l7 + 0x30],	%f0
	sll	%i3,	%i5,	%o6
	fsrc1	%f26,	%f28
	mulx	%l5,	0x15E0,	%l2
	or	%g3,	%l4,	%i0
	edge32n	%l0,	%i4,	%l6
	sth	%g1,	[%l7 + 0x24]
	sdivx	%i7,	0x0F4F,	%o4
	fmovsl	%icc,	%f28,	%f19
	sdivx	%o7,	0x1F22,	%l3
	st	%f1,	[%l7 + 0x08]
	alignaddrl	%i6,	%o1,	%o0
	andcc	%o5,	%g4,	%g7
	umulcc	%o3,	0x1C00,	%o2
	fmovrse	%g2,	%f22,	%f18
	fpack16	%f30,	%f22
	lduw	[%l7 + 0x14],	%l1
	fmovsleu	%xcc,	%f19,	%f15
	ldx	[%l7 + 0x48],	%i2
	ld	[%l7 + 0x38],	%f17
	fmovscs	%xcc,	%f21,	%f20
	fxors	%f30,	%f31,	%f11
	movle	%xcc,	%i1,	%g5
	sdivx	%g6,	0x1C1F,	%i5
	lduw	[%l7 + 0x54],	%o6
	sir	0x03C8
	fzero	%f30
	lduw	[%l7 + 0x60],	%i3
	stw	%l5,	[%l7 + 0x78]
	array16	%l2,	%g3,	%i0
	and	%l0,	0x1F3B,	%l4
	movvc	%xcc,	%i4,	%g1
	add	%l6,	%o4,	%o7
	udivcc	%l3,	0x0281,	%i7
	srl	%o1,	0x08,	%o0
	edge8n	%i6,	%o5,	%g7
	fmovrse	%o3,	%f3,	%f10
	restore %g4, 0x0241, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%o2,	%l1
	alignaddr	%i2,	%g5,	%g6
	fmovsgu	%icc,	%f23,	%f17
	edge32ln	%i5,	%i1,	%o6
	subcc	%l5,	%l2,	%i3
	srl	%i0,	0x14,	%l0
	movre	%l4,	%g3,	%g1
	sethi	0x019C,	%l6
	lduh	[%l7 + 0x22],	%i4
	edge32l	%o4,	%l3,	%i7
	edge8l	%o7,	%o1,	%o0
	edge8ln	%i6,	%o5,	%g7
	movpos	%icc,	%g4,	%o3
	movcc	%icc,	%g2,	%l1
	subcc	%i2,	0x08FE,	%g5
	fmovsn	%xcc,	%f9,	%f16
	edge8n	%g6,	%o2,	%i5
	movre	%i1,	%l5,	%o6
	movgu	%icc,	%l2,	%i3
	xnorcc	%l0,	0x023E,	%i0
	xor	%l4,	%g1,	%l6
	movg	%xcc,	%g3,	%o4
	umul	%i4,	0x1BDA,	%i7
	sth	%o7,	[%l7 + 0x54]
	ldd	[%l7 + 0x58],	%f16
	std	%f12,	[%l7 + 0x68]
	andn	%l3,	%o1,	%i6
	fmul8x16al	%f4,	%f13,	%f28
	fone	%f20
	addcc	%o5,	0x0C1B,	%g7
	array8	%o0,	%o3,	%g4
	movl	%xcc,	%l1,	%g2
	movg	%icc,	%g5,	%i2
	alignaddr	%o2,	%g6,	%i1
	ldsh	[%l7 + 0x4C],	%l5
	udivx	%o6,	0x0819,	%l2
	movg	%icc,	%i5,	%l0
	fcmpeq32	%f4,	%f6,	%i0
	edge32	%i3,	%l4,	%l6
	nop
	set	0x70, %g3
	ldsb	[%l7 + %g3],	%g1
	nop
	set	0x30, %o0
	ldsw	[%l7 + %o0],	%o4
	movge	%xcc,	%g3,	%i4
	movl	%icc,	%o7,	%l3
	andn	%o1,	0x03A4,	%i7
	sdiv	%o5,	0x1F1A,	%g7
	sth	%i6,	[%l7 + 0x6E]
	andncc	%o3,	%g4,	%l1
	subccc	%o0,	%g5,	%i2
	sra	%g2,	%g6,	%o2
	udivcc	%l5,	0x0587,	%o6
	edge32ln	%i1,	%l2,	%l0
	sdiv	%i5,	0x1DEE,	%i3
	edge32	%l4,	%l6,	%i0
	for	%f22,	%f4,	%f28
	addc	%g1,	0x09F1,	%g3
	sdivx	%i4,	0x0D03,	%o4
	lduw	[%l7 + 0x4C],	%o7
	edge16n	%o1,	%i7,	%l3
	xnorcc	%o5,	0x18CE,	%g7
	fmovsle	%xcc,	%f3,	%f2
	xnorcc	%i6,	%o3,	%l1
	movcc	%icc,	%o0,	%g5
	nop
	set	0x10, %i0
	ldd	[%l7 + %i0],	%f12
	ldsb	[%l7 + 0x66],	%g4
	smulcc	%g2,	0x1A07,	%i2
	fmovdleu	%icc,	%f28,	%f10
	popc	%o2,	%l5
	sra	%g6,	0x16,	%o6
	edge32ln	%i1,	%l0,	%i5
	edge8ln	%l2,	%l4,	%i3
	edge32l	%i0,	%g1,	%l6
	fmovd	%f12,	%f24
	save %i4, %o4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o7,	%o1
	umulcc	%i7,	0x065A,	%o5
	addc	%g7,	%l3,	%i6
	sra	%o3,	0x18,	%l1
	udivcc	%g5,	0x16C8,	%g4
	movvs	%xcc,	%o0,	%g2
	and	%i2,	0x1936,	%l5
	stw	%o2,	[%l7 + 0x78]
	andcc	%o6,	0x0DE1,	%i1
	fmovspos	%icc,	%f30,	%f15
	addccc	%l0,	%g6,	%l2
	sethi	0x04B2,	%l4
	alignaddr	%i5,	%i3,	%g1
	fmovdl	%icc,	%f30,	%f21
	stx	%l6,	[%l7 + 0x30]
	ldd	[%l7 + 0x40],	%f30
	ldd	[%l7 + 0x48],	%f30
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	movvs	%xcc,	%i4,	%g3
	sdivcc	%o1,	0x0977,	%o7
	movgu	%icc,	%i7,	%g7
	sllx	%l3,	%i6,	%o3
	move	%icc,	%l1,	%g5
	lduh	[%l7 + 0x42],	%g4
	lduw	[%l7 + 0x40],	%o0
	nop
	set	0x28, %g7
	ldsh	[%l7 + %g7],	%o5
	movg	%icc,	%g2,	%l5
	fmovscs	%xcc,	%f1,	%f22
	st	%f5,	[%l7 + 0x3C]
	fpsub16s	%f22,	%f29,	%f27
	andn	%i2,	0x1648,	%o2
	or	%o6,	0x0F44,	%i1
	ldsh	[%l7 + 0x68],	%l0
	alignaddr	%g6,	%l4,	%l2
	fpack16	%f0,	%f11
	fsrc1s	%f31,	%f4
	edge32n	%i3,	%g1,	%l6
	ldd	[%l7 + 0x08],	%f4
	fmovrdgz	%i5,	%f10,	%f24
	array16	%o4,	%i4,	%g3
	orn	%i0,	0x1B1C,	%o7
	fmovrdlz	%i7,	%f24,	%f8
	ldsh	[%l7 + 0x0C],	%o1
	fpadd16	%f2,	%f20,	%f10
	movrlez	%g7,	0x089,	%i6
	movvc	%xcc,	%o3,	%l3
	edge32	%l1,	%g4,	%g5
	fcmple16	%f6,	%f28,	%o0
	movge	%xcc,	%o5,	%l5
	fpsub32	%f18,	%f4,	%f10
	fnot1	%f22,	%f12
	lduw	[%l7 + 0x30],	%g2
	fpadd16s	%f22,	%f22,	%f22
	mova	%xcc,	%i2,	%o6
	save %o2, %i1, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g6,	%l2
	stx	%i3,	[%l7 + 0x30]
	movcs	%icc,	%l4,	%g1
	for	%f24,	%f0,	%f24
	fmovdvs	%xcc,	%f4,	%f21
	array16	%i5,	%l6,	%o4
	fmovrdgz	%g3,	%f30,	%f18
	popc	%i0,	%i4
	sllx	%o7,	0x10,	%i7
	move	%xcc,	%g7,	%i6
	stb	%o3,	[%l7 + 0x5D]
	array8	%o1,	%l3,	%l1
	umulcc	%g5,	%o0,	%o5
	xnor	%l5,	0x16D7,	%g4
	movrgz	%i2,	0x21D,	%g2
	movvs	%xcc,	%o6,	%i1
	subc	%l0,	%g6,	%o2
	lduh	[%l7 + 0x1E],	%l2
	xor	%l4,	0x01C2,	%i3
	andcc	%g1,	0x1497,	%l6
	ld	[%l7 + 0x78],	%f20
	xor	%i5,	0x1D4B,	%o4
	movgu	%icc,	%i0,	%i4
	xnor	%o7,	%g3,	%i7
	edge16l	%i6,	%g7,	%o1
	std	%f2,	[%l7 + 0x48]
	udivx	%l3,	0x1DFD,	%l1
	edge32n	%g5,	%o0,	%o5
	udivx	%o3,	0x1CD8,	%g4
	movgu	%icc,	%i2,	%g2
	edge32ln	%l5,	%o6,	%l0
	alignaddr	%i1,	%g6,	%o2
	sth	%l4,	[%l7 + 0x10]
	fones	%f3
	fpadd32s	%f30,	%f13,	%f12
	ldsh	[%l7 + 0x56],	%i3
	movgu	%xcc,	%g1,	%l2
	movl	%icc,	%i5,	%l6
	sdivx	%o4,	0x15CB,	%i0
	subc	%o7,	0x0D64,	%i4
	fmovde	%xcc,	%f29,	%f26
	movvs	%icc,	%i7,	%g3
	fpsub16	%f22,	%f10,	%f8
	edge16l	%g7,	%o1,	%l3
	udivcc	%l1,	0x0E11,	%i6
	fmovsn	%icc,	%f27,	%f31
	fpadd32	%f0,	%f24,	%f2
	edge16	%o0,	%o5,	%o3
	fmovrslez	%g5,	%f14,	%f3
	fmovsvs	%icc,	%f14,	%f20
	movle	%xcc,	%g4,	%i2
	fsrc1s	%f22,	%f25
	fmovdvc	%xcc,	%f8,	%f14
	edge16l	%l5,	%g2,	%o6
	udiv	%i1,	0x04F8,	%l0
	fmovdneg	%xcc,	%f28,	%f14
	fmul8sux16	%f12,	%f22,	%f2
	ldsw	[%l7 + 0x24],	%g6
	alignaddrl	%l4,	%i3,	%g1
	fcmpne32	%f10,	%f26,	%l2
	subc	%i5,	0x0989,	%l6
	st	%f17,	[%l7 + 0x6C]
	movgu	%icc,	%o2,	%o4
	fcmps	%fcc3,	%f26,	%f9
	ldub	[%l7 + 0x45],	%i0
	ldx	[%l7 + 0x28],	%i4
	fmovrse	%o7,	%f3,	%f24
	fnot2s	%f22,	%f28
	edge32	%i7,	%g3,	%o1
	fmovsvc	%icc,	%f21,	%f20
	fmul8sux16	%f12,	%f26,	%f0
	array32	%g7,	%l1,	%i6
	fmovdleu	%xcc,	%f6,	%f16
	edge8	%o0,	%l3,	%o5
	ldx	[%l7 + 0x30],	%g5
	fzero	%f6
	srlx	%o3,	0x11,	%i2
	movrne	%l5,	%g4,	%o6
	alignaddr	%i1,	%g2,	%g6
	movrgz	%l4,	0x187,	%i3
	nop
	set	0x58, %i1
	ldd	[%l7 + %i1],	%l0
	edge16ln	%g1,	%i5,	%l2
	sethi	0x0F34,	%o2
	subc	%o4,	0x1F43,	%l6
	movre	%i4,	%i0,	%i7
	movvc	%xcc,	%o7,	%o1
	fnor	%f4,	%f14,	%f14
	edge32	%g3,	%g7,	%l1
	udivx	%i6,	0x1F83,	%l3
	fsrc1s	%f5,	%f21
	fabss	%f15,	%f19
	fmovscs	%xcc,	%f0,	%f8
	sll	%o5,	0x06,	%g5
	udivx	%o0,	0x1A2D,	%i2
	fmovsge	%xcc,	%f5,	%f11
	edge16ln	%l5,	%g4,	%o6
	faligndata	%f10,	%f2,	%f4
	fnot1s	%f6,	%f31
	movrgez	%o3,	0x12A,	%g2
	movvs	%xcc,	%g6,	%i1
	sll	%i3,	0x13,	%l0
	subccc	%l4,	0x1605,	%g1
	popc	%l2,	%i5
	move	%xcc,	%o2,	%l6
	sra	%o4,	0x11,	%i4
	alignaddr	%i7,	%i0,	%o1
	move	%xcc,	%o7,	%g3
	edge8l	%l1,	%i6,	%g7
	fornot2s	%f16,	%f27,	%f7
	edge16l	%o5,	%g5,	%l3
	movcc	%icc,	%i2,	%o0
	fornot1s	%f31,	%f12,	%f14
	stb	%g4,	[%l7 + 0x60]
	array8	%o6,	%o3,	%l5
	orn	%g2,	0x0BB3,	%g6
	fmul8x16	%f20,	%f10,	%f16
	xnorcc	%i3,	%l0,	%l4
	for	%f10,	%f18,	%f14
	array32	%g1,	%i1,	%i5
	movrgz	%l2,	0x176,	%l6
	movneg	%icc,	%o2,	%i4
	xor	%i7,	%o4,	%i0
	alignaddr	%o1,	%o7,	%l1
	array16	%g3,	%i6,	%g7
	movrne	%g5,	0x3AF,	%l3
	movle	%xcc,	%i2,	%o0
	subcc	%o5,	0x19CE,	%o6
	orcc	%o3,	%l5,	%g2
	ldd	[%l7 + 0x78],	%f0
	nop
	set	0x60, %o4
	ldx	[%l7 + %o4],	%g4
	umul	%g6,	0x075B,	%i3
	orncc	%l0,	%g1,	%i1
	std	%f22,	[%l7 + 0x78]
	xnorcc	%l4,	0x1310,	%l2
	fabsd	%f0,	%f8
	ldsb	[%l7 + 0x2C],	%l6
	addccc	%i5,	%i4,	%i7
	umulcc	%o2,	0x1C08,	%o4
	srlx	%o1,	%o7,	%l1
	addccc	%g3,	0x0C87,	%i6
	ldd	[%l7 + 0x60],	%i0
	movneg	%xcc,	%g5,	%g7
	srax	%l3,	%i2,	%o0
	movpos	%icc,	%o5,	%o6
	fnands	%f25,	%f18,	%f21
	save %o3, 0x1C2B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g2,	%g6,	%i3
	std	%f8,	[%l7 + 0x08]
	lduw	[%l7 + 0x54],	%l0
	edge32n	%g1,	%i1,	%l4
	movrlz	%g4,	0x2C5,	%l6
	orncc	%i5,	0x0D19,	%l2
	movgu	%icc,	%i4,	%i7
	edge16ln	%o4,	%o1,	%o2
	fmovrde	%l1,	%f26,	%f12
	addccc	%g3,	%o7,	%i6
	ldub	[%l7 + 0x78],	%g5
	udivx	%i0,	0x12DB,	%g7
	st	%f8,	[%l7 + 0x6C]
	stx	%l3,	[%l7 + 0x78]
	array16	%o0,	%i2,	%o5
	udiv	%o6,	0x0A13,	%l5
	edge32ln	%o3,	%g2,	%g6
	edge32n	%i3,	%g1,	%l0
	movcs	%icc,	%l4,	%i1
	fpadd32s	%f11,	%f26,	%f28
	subc	%l6,	0x093C,	%i5
	umul	%g4,	%l2,	%i7
	restore %o4, 0x1F75, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f1,	%f29,	%f18
	smulcc	%o2,	%l1,	%i4
	fcmpne32	%f28,	%f12,	%o7
	edge16l	%g3,	%g5,	%i0
	edge32l	%g7,	%l3,	%o0
	umulcc	%i2,	%i6,	%o5
	movne	%xcc,	%l5,	%o6
	fmovsneg	%icc,	%f20,	%f22
	udivcc	%g2,	0x0EE0,	%o3
	movcc	%xcc,	%i3,	%g6
	st	%f15,	[%l7 + 0x28]
	addcc	%l0,	0x0FA4,	%g1
	movrlez	%i1,	%l4,	%l6
	stx	%i5,	[%l7 + 0x10]
	fpadd16s	%f26,	%f29,	%f10
	udiv	%l2,	0x0186,	%i7
	fzeros	%f11
	xnorcc	%g4,	0x1818,	%o4
	movge	%icc,	%o1,	%o2
	smulcc	%i4,	%o7,	%l1
	ldd	[%l7 + 0x08],	%f6
	addcc	%g3,	%i0,	%g7
	fmovscs	%xcc,	%f9,	%f27
	fand	%f24,	%f24,	%f18
	and	%g5,	%l3,	%o0
	subccc	%i6,	0x0863,	%o5
	movrlz	%i2,	%l5,	%o6
	fsrc1s	%f11,	%f11
	movrgz	%o3,	0x219,	%g2
	movpos	%icc,	%i3,	%l0
	st	%f31,	[%l7 + 0x40]
	ldub	[%l7 + 0x6B],	%g6
	fone	%f12
	array16	%g1,	%l4,	%l6
	edge8l	%i1,	%i5,	%i7
	edge8n	%g4,	%l2,	%o4
	fpack16	%f8,	%f27
	movrne	%o1,	0x3A8,	%o2
	movvc	%icc,	%o7,	%l1
	fmovdn	%icc,	%f10,	%f15
	edge16l	%i4,	%g3,	%i0
	subc	%g7,	0x17A9,	%l3
	movg	%xcc,	%o0,	%g5
	umulcc	%o5,	%i6,	%i2
	fnot2	%f2,	%f10
	edge16	%o6,	%o3,	%l5
	srlx	%g2,	0x1E,	%l0
	fmovsl	%xcc,	%f11,	%f7
	andncc	%i3,	%g1,	%l4
	sethi	0x04DB,	%g6
	edge32n	%i1,	%l6,	%i7
	fpmerge	%f19,	%f5,	%f0
	ldd	[%l7 + 0x58],	%g4
	umulcc	%l2,	%o4,	%o1
	fmovdl	%xcc,	%f11,	%f8
	xor	%i5,	0x1504,	%o7
	alignaddr	%l1,	%i4,	%o2
	ldd	[%l7 + 0x10],	%f26
	movg	%icc,	%i0,	%g7
	fmuld8sux16	%f13,	%f5,	%f22
	fone	%f6
	edge32n	%g3,	%l3,	%o0
	array16	%o5,	%g5,	%i2
	sllx	%o6,	%i6,	%l5
	subcc	%o3,	0x0291,	%l0
	andn	%g2,	0x137A,	%i3
	subccc	%g1,	%g6,	%i1
	std	%f20,	[%l7 + 0x40]
	mulscc	%l4,	0x1EEA,	%i7
	edge32	%l6,	%l2,	%g4
	sir	0x06A0
	fmovdl	%xcc,	%f8,	%f8
	movrgz	%o4,	0x397,	%o1
	and	%o7,	0x01AB,	%i5
	fmovde	%xcc,	%f7,	%f5
	movcs	%xcc,	%l1,	%o2
	edge16	%i0,	%i4,	%g3
	stb	%g7,	[%l7 + 0x2C]
	xorcc	%l3,	%o0,	%o5
	movg	%xcc,	%g5,	%o6
	edge8l	%i2,	%l5,	%o3
	stw	%l0,	[%l7 + 0x18]
	array16	%g2,	%i6,	%i3
	edge8ln	%g6,	%g1,	%i1
	ldd	[%l7 + 0x10],	%l4
	ldd	[%l7 + 0x30],	%i6
	orcc	%l6,	0x1F0D,	%g4
	fcmped	%fcc3,	%f0,	%f20
	movrlez	%o4,	0x1CA,	%o1
	ld	[%l7 + 0x38],	%f8
	fmovrdgz	%o7,	%f10,	%f26
	move	%icc,	%l2,	%i5
	edge8n	%l1,	%o2,	%i0
	fmovd	%f18,	%f30
	fzero	%f8
	array16	%i4,	%g7,	%l3
	edge8l	%g3,	%o0,	%o5
	fnegd	%f22,	%f30
	fmovs	%f30,	%f6
	fxors	%f21,	%f17,	%f24
	subc	%o6,	0x185C,	%g5
	edge32ln	%i2,	%l5,	%l0
	fandnot2s	%f23,	%f3,	%f30
	ldd	[%l7 + 0x28],	%f6
	movvs	%xcc,	%o3,	%g2
	addc	%i6,	%g6,	%i3
	fnot2	%f20,	%f26
	edge32n	%i1,	%g1,	%l4
	fmovdne	%icc,	%f9,	%f24
	add	%i7,	%l6,	%g4
	fcmps	%fcc3,	%f17,	%f10
	and	%o4,	0x0A2B,	%o7
	fmovdne	%icc,	%f14,	%f13
	fmovsl	%icc,	%f31,	%f1
	alignaddr	%l2,	%o1,	%i5
	fmovspos	%icc,	%f10,	%f4
	ldsb	[%l7 + 0x66],	%l1
	st	%f10,	[%l7 + 0x50]
	std	%f6,	[%l7 + 0x38]
	fpadd32s	%f3,	%f30,	%f4
	ldsh	[%l7 + 0x0E],	%i0
	movcs	%xcc,	%i4,	%g7
	umul	%l3,	0x1E17,	%o2
	movn	%xcc,	%o0,	%o5
	ldsw	[%l7 + 0x4C],	%o6
	addc	%g5,	0x0C54,	%i2
	fpadd32	%f6,	%f0,	%f20
	movcs	%xcc,	%g3,	%l0
	srlx	%l5,	%o3,	%g2
	ldsh	[%l7 + 0x1A],	%i6
	ldub	[%l7 + 0x54],	%i3
	sth	%g6,	[%l7 + 0x58]
	subcc	%i1,	%l4,	%g1
	mulx	%l6,	0x067B,	%g4
	movrlez	%o4,	%o7,	%l2
	andn	%o1,	0x02A6,	%i7
	orncc	%i5,	%i0,	%l1
	ldd	[%l7 + 0x08],	%f0
	stw	%g7,	[%l7 + 0x48]
	ldx	[%l7 + 0x18],	%i4
	save %l3, %o2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o5,	%o6,	%i2
	edge8n	%g3,	%g5,	%l5
	edge8ln	%o3,	%g2,	%i6
	smulcc	%l0,	0x19C3,	%g6
	fcmpeq16	%f18,	%f28,	%i3
	movrne	%i1,	%g1,	%l4
	alignaddr	%l6,	%o4,	%o7
	fmovscs	%icc,	%f6,	%f8
	fmovdvs	%xcc,	%f26,	%f10
	fabsd	%f2,	%f8
	sdiv	%l2,	0x0EA1,	%g4
	xor	%i7,	0x0A4B,	%i5
	alignaddrl	%o1,	%l1,	%g7
	movge	%icc,	%i4,	%i0
	fmovsleu	%icc,	%f4,	%f28
	umul	%o2,	0x1070,	%l3
	fnegs	%f21,	%f21
	popc	%o0,	%o5
	edge8ln	%o6,	%i2,	%g3
	movrne	%g5,	0x009,	%l5
	edge32	%o3,	%g2,	%l0
	fmovsge	%icc,	%f16,	%f27
	addccc	%g6,	%i6,	%i3
	umul	%g1,	0x062A,	%i1
	movne	%icc,	%l6,	%o4
	ldsw	[%l7 + 0x18],	%l4
	edge32	%l2,	%o7,	%i7
	fors	%f16,	%f12,	%f28
	andn	%i5,	0x1427,	%g4
	xorcc	%l1,	0x1A6F,	%g7
	edge16	%o1,	%i0,	%i4
	orcc	%o2,	0x162C,	%l3
	ldd	[%l7 + 0x48],	%o0
	umul	%o5,	%o6,	%g3
	siam	0x2
	array8	%g5,	%l5,	%i2
	umulcc	%o3,	%g2,	%g6
	mova	%icc,	%i6,	%l0
	move	%icc,	%i3,	%i1
	addccc	%l6,	0x1979,	%g1
	smul	%o4,	0x0E82,	%l4
	mulx	%l2,	%o7,	%i7
	fmovsge	%icc,	%f2,	%f9
	ldx	[%l7 + 0x68],	%g4
	fone	%f6
	xnor	%l1,	%g7,	%o1
	sra	%i0,	%i4,	%o2
	edge32	%i5,	%o0,	%o5
	srax	%l3,	%o6,	%g5
	movleu	%xcc,	%g3,	%i2
	srax	%l5,	0x05,	%o3
	sdivx	%g6,	0x1509,	%g2
	lduw	[%l7 + 0x64],	%i6
	edge16	%i3,	%i1,	%l6
	movge	%icc,	%g1,	%o4
	smulcc	%l0,	%l4,	%o7
	udivcc	%l2,	0x1424,	%g4
	fmovrdlz	%i7,	%f6,	%f12
	fpadd32	%f16,	%f0,	%f16
	movge	%xcc,	%g7,	%o1
	smulcc	%i0,	0x1976,	%l1
	ld	[%l7 + 0x6C],	%f27
	movle	%icc,	%o2,	%i5
	stw	%o0,	[%l7 + 0x14]
	siam	0x6
	udiv	%o5,	0x14E2,	%l3
	mulx	%i4,	0x1BED,	%o6
	edge16n	%g3,	%g5,	%l5
	orncc	%i2,	0x0731,	%o3
	fpack32	%f18,	%f8,	%f18
	sdivx	%g6,	0x0626,	%i6
	fnands	%f12,	%f19,	%f24
	andcc	%i3,	0x0A46,	%i1
	subccc	%g2,	0x1BED,	%l6
	movle	%icc,	%o4,	%g1
	fmovs	%f3,	%f16
	srax	%l0,	0x1E,	%l4
	umul	%o7,	0x09DA,	%g4
	fpack16	%f8,	%f0
	fmovdn	%icc,	%f10,	%f13
	edge8n	%l2,	%i7,	%g7
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	fmovsleu	%xcc,	%f3,	%f8
	fandnot2s	%f6,	%f8,	%f7
	edge8ln	%o2,	%i5,	%o0
	movl	%xcc,	%i0,	%l3
	fmovsne	%icc,	%f5,	%f0
	nop
	set	0x48, %o2
	std	%f26,	[%l7 + %o2]
	st	%f17,	[%l7 + 0x30]
	fexpand	%f25,	%f30
	fzero	%f12
	sra	%i4,	%o5,	%o6
	udivcc	%g5,	0x0B58,	%l5
	addccc	%g3,	%o3,	%g6
	sub	%i6,	%i2,	%i1
	fmovrdgez	%i3,	%f22,	%f28
	movrne	%g2,	0x1E4,	%o4
	fandnot1	%f24,	%f2,	%f20
	andn	%l6,	%g1,	%l0
	movre	%o7,	0x384,	%l4
	movcs	%icc,	%l2,	%g4
	movne	%xcc,	%g7,	%o1
	fabsd	%f28,	%f30
	subc	%l1,	%i7,	%o2
	movpos	%icc,	%i5,	%i0
	edge16l	%o0,	%l3,	%o5
	sdivx	%i4,	0x0C57,	%g5
	movrgez	%l5,	0x2BF,	%o6
	fmovrde	%o3,	%f6,	%f24
	array32	%g3,	%i6,	%i2
	alignaddrl	%g6,	%i1,	%g2
	sdivcc	%o4,	0x071B,	%l6
	fmovrslez	%i3,	%f17,	%f29
	ldd	[%l7 + 0x10],	%f10
	stb	%l0,	[%l7 + 0x71]
	edge8ln	%o7,	%g1,	%l4
	fcmple32	%f2,	%f14,	%l2
	save %g7, %g4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i7,	0x06C4,	%l1
	movrlz	%i5,	%o2,	%o0
	array16	%l3,	%i0,	%o5
	movvc	%xcc,	%i4,	%l5
	ldd	[%l7 + 0x50],	%g4
	fandnot2s	%f7,	%f14,	%f28
	subc	%o6,	%g3,	%o3
	mulscc	%i2,	0x0D80,	%i6
	edge32	%i1,	%g6,	%g2
	alignaddrl	%o4,	%i3,	%l0
	fmovrsgz	%o7,	%f6,	%f9
	nop
	set	0x70, %l6
	stx	%l6,	[%l7 + %l6]
	nop
	set	0x08, %l4
	ldd	[%l7 + %l4],	%l4
	andn	%l2,	0x0AA4,	%g7
	fnot1	%f8,	%f28
	srax	%g1,	0x09,	%g4
	move	%icc,	%i7,	%o1
	umulcc	%l1,	0x099A,	%i5
	restore %o0, %o2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i0,	%i4
	edge32l	%o5,	%g5,	%o6
	ldd	[%l7 + 0x70],	%g2
	fpmerge	%f11,	%f31,	%f24
	ldd	[%l7 + 0x48],	%f10
	fcmpeq16	%f28,	%f30,	%l5
	movne	%icc,	%i2,	%o3
	nop
	set	0x10, %o3
	stw	%i1,	[%l7 + %o3]
	orn	%i6,	%g6,	%o4
	sir	0x1C9E
	udivx	%g2,	0x0564,	%i3
	fmovs	%f27,	%f26
	movn	%icc,	%o7,	%l0
	fpadd32s	%f8,	%f2,	%f28
	save %l6, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g7,	%g4,	%g1
	fmovsne	%icc,	%f24,	%f2
	stx	%i7,	[%l7 + 0x28]
	sdiv	%o1,	0x186D,	%l1
	orncc	%o0,	%o2,	%i5
	lduw	[%l7 + 0x48],	%l3
	smul	%i4,	0x16B3,	%i0
	fzero	%f20
	fzero	%f30
	fmuld8sux16	%f24,	%f4,	%f12
	subcc	%g5,	%o6,	%g3
	edge8n	%o5,	%i2,	%o3
	subc	%i1,	0x09E6,	%l5
	addccc	%g6,	%o4,	%g2
	stx	%i3,	[%l7 + 0x48]
	movn	%icc,	%o7,	%i6
	edge8ln	%l6,	%l4,	%l2
	fpsub16s	%f7,	%f10,	%f0
	orncc	%g7,	%g4,	%l0
	movne	%icc,	%i7,	%g1
	fmovrdlez	%l1,	%f26,	%f28
	smul	%o0,	0x0FC2,	%o1
	movrlez	%i5,	0x157,	%o2
	fcmple32	%f28,	%f14,	%i4
	xorcc	%l3,	%g5,	%o6
	nop
	set	0x14, %l1
	ldsh	[%l7 + %l1],	%g3
	sdivcc	%i0,	0x1ECE,	%o5
	edge8n	%i2,	%i1,	%o3
	stx	%g6,	[%l7 + 0x78]
	edge8n	%o4,	%g2,	%l5
	fcmpne32	%f12,	%f2,	%i3
	ldd	[%l7 + 0x48],	%f12
	ldsw	[%l7 + 0x48],	%o7
	edge32l	%i6,	%l6,	%l4
	movrgez	%g7,	0x32D,	%l2
	edge8ln	%g4,	%l0,	%g1
	ldd	[%l7 + 0x68],	%l0
	xor	%i7,	%o0,	%o1
	movrlz	%o2,	%i4,	%i5
	umulcc	%g5,	%l3,	%o6
	ldd	[%l7 + 0x78],	%i0
	fmuld8sux16	%f10,	%f13,	%f16
	ldub	[%l7 + 0x40],	%g3
	alignaddr	%i2,	%o5,	%i1
	movvs	%icc,	%g6,	%o3
	edge8ln	%g2,	%l5,	%i3
	stw	%o7,	[%l7 + 0x40]
	movl	%xcc,	%i6,	%l6
	sth	%o4,	[%l7 + 0x6A]
	orcc	%g7,	%l4,	%l2
	fandnot1	%f22,	%f8,	%f30
	movre	%l0,	%g1,	%l1
	xnor	%g4,	%i7,	%o0
	movneg	%xcc,	%o2,	%o1
	fnot1	%f12,	%f10
	ldub	[%l7 + 0x7C],	%i5
	edge8n	%i4,	%l3,	%g5
	array32	%i0,	%g3,	%i2
	fcmpeq32	%f30,	%f0,	%o6
	fmovsleu	%icc,	%f23,	%f28
	fmovsleu	%icc,	%f2,	%f14
	movgu	%icc,	%i1,	%o5
	fmovsge	%icc,	%f18,	%f6
	sra	%g6,	%o3,	%g2
	orncc	%l5,	0x187E,	%o7
	smulcc	%i6,	0x1558,	%l6
	alignaddrl	%i3,	%o4,	%g7
	siam	0x0
	fmovrsne	%l4,	%f5,	%f19
	movrlez	%l2,	%l0,	%g1
	edge32	%g4,	%l1,	%o0
	movpos	%xcc,	%i7,	%o2
	ldub	[%l7 + 0x57],	%o1
	umulcc	%i4,	%l3,	%i5
	sdivx	%i0,	0x03A0,	%g5
	movrne	%i2,	%g3,	%i1
	subccc	%o6,	0x0A94,	%o5
	fmovdn	%icc,	%f9,	%f3
	ldd	[%l7 + 0x38],	%f12
	fpadd32s	%f17,	%f19,	%f8
	movcc	%icc,	%o3,	%g2
	fabss	%f2,	%f29
	ldd	[%l7 + 0x60],	%f12
	fmovrsgz	%g6,	%f0,	%f4
	fcmple16	%f8,	%f4,	%o7
	fmovrdne	%i6,	%f6,	%f24
	andcc	%l6,	%i3,	%l5
	udivx	%g7,	0x1362,	%l4
	fpadd16s	%f2,	%f31,	%f10
	orncc	%l2,	%o4,	%g1
	fone	%f6
	edge32l	%g4,	%l0,	%l1
	edge16ln	%o0,	%o2,	%i7
	array16	%o1,	%l3,	%i5
	pdist	%f26,	%f14,	%f22
	sll	%i4,	0x1C,	%g5
	mova	%xcc,	%i0,	%g3
	edge32ln	%i1,	%o6,	%i2
	fmovscs	%xcc,	%f4,	%f6
	fmovda	%xcc,	%f28,	%f16
	array32	%o3,	%o5,	%g2
	ld	[%l7 + 0x3C],	%f26
	andcc	%g6,	%o7,	%i6
	umulcc	%i3,	0x1EDC,	%l5
	save %l6, %l4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g7,	0x375,	%o4
	movl	%xcc,	%g1,	%g4
	srl	%l1,	0x17,	%l0
	movrgz	%o0,	0x123,	%o2
	srl	%i7,	0x07,	%o1
	fcmpes	%fcc0,	%f24,	%f31
	fmovscs	%xcc,	%f16,	%f13
	stb	%l3,	[%l7 + 0x54]
	xnor	%i5,	0x084B,	%g5
	ldd	[%l7 + 0x50],	%i0
	movvs	%icc,	%i4,	%i1
	addccc	%o6,	0x06C5,	%i2
	movle	%icc,	%g3,	%o3
	udiv	%o5,	0x1919,	%g2
	sub	%g6,	%o7,	%i6
	ldsw	[%l7 + 0x0C],	%i3
	orn	%l5,	%l6,	%l2
	movcs	%icc,	%g7,	%l4
	fands	%f1,	%f30,	%f4
	lduw	[%l7 + 0x10],	%g1
	fcmpne16	%f14,	%f10,	%g4
	fmovscs	%icc,	%f24,	%f4
	nop
	set	0x19, %i6
	stb	%l1,	[%l7 + %i6]
	ld	[%l7 + 0x5C],	%f14
	sll	%l0,	%o4,	%o2
	fmovse	%icc,	%f22,	%f11
	movgu	%icc,	%i7,	%o1
	fmovdne	%icc,	%f5,	%f26
	fmovdcc	%xcc,	%f23,	%f19
	fmovsne	%icc,	%f22,	%f4
	st	%f22,	[%l7 + 0x68]
	xor	%o0,	%l3,	%g5
	movgu	%icc,	%i0,	%i5
	edge32l	%i1,	%i4,	%i2
	mova	%icc,	%g3,	%o6
	ldsw	[%l7 + 0x70],	%o3
	edge16	%g2,	%o5,	%g6
	movrlz	%o7,	%i3,	%i6
	fcmpes	%fcc1,	%f31,	%f7
	addcc	%l6,	%l2,	%l5
	edge8	%g7,	%l4,	%g4
	orn	%g1,	0x120D,	%l0
	sdivcc	%o4,	0x1E0A,	%l1
	fmovdcc	%xcc,	%f0,	%f25
	fmovsne	%xcc,	%f14,	%f2
	fmovscs	%xcc,	%f16,	%f12
	fmovscs	%xcc,	%f4,	%f28
	bshuffle	%f30,	%f24,	%f26
	subc	%i7,	0x1702,	%o1
	smul	%o2,	0x1980,	%l3
	fmovs	%f8,	%f11
	fmovsn	%icc,	%f1,	%f6
	orncc	%g5,	0x1EE9,	%o0
	andn	%i0,	0x0658,	%i1
	edge32l	%i5,	%i4,	%g3
	udivcc	%o6,	0x1AA5,	%i2
	addc	%o3,	0x1363,	%g2
	srlx	%o5,	%o7,	%g6
	edge32n	%i6,	%l6,	%i3
	umulcc	%l2,	%l5,	%g7
	ldsb	[%l7 + 0x4D],	%l4
	mulx	%g4,	0x1AF7,	%l0
	udiv	%o4,	0x1AC1,	%l1
	array16	%g1,	%o1,	%o2
	alignaddrl	%l3,	%g5,	%o0
	fors	%f13,	%f31,	%f26
	movge	%icc,	%i0,	%i7
	fcmpeq16	%f28,	%f30,	%i1
	popc	0x1BFF,	%i5
	mulx	%i4,	0x1F9F,	%o6
	movle	%xcc,	%g3,	%o3
	srax	%i2,	%g2,	%o7
	edge8n	%o5,	%i6,	%g6
	and	%l6,	%i3,	%l5
	fmovdneg	%xcc,	%f14,	%f10
	ldsw	[%l7 + 0x10],	%g7
	fmovsle	%icc,	%f1,	%f11
	smul	%l4,	%l2,	%l0
	fmovdgu	%xcc,	%f10,	%f8
	ldsb	[%l7 + 0x0A],	%o4
	fnand	%f6,	%f6,	%f20
	fxnors	%f24,	%f22,	%f26
	bshuffle	%f12,	%f30,	%f20
	movcs	%xcc,	%g4,	%l1
	movn	%xcc,	%g1,	%o2
	fmovdle	%xcc,	%f13,	%f11
	xor	%l3,	0x1768,	%g5
	fnegs	%f9,	%f7
	ldx	[%l7 + 0x28],	%o1
	and	%i0,	%o0,	%i1
	addccc	%i7,	%i4,	%o6
	move	%xcc,	%i5,	%o3
	movcs	%xcc,	%g3,	%g2
	ldsw	[%l7 + 0x50],	%i2
	alignaddr	%o7,	%o5,	%g6
	ldsb	[%l7 + 0x7A],	%l6
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	subc	%g7,	0x0EC6,	%i6
	fmovdvs	%icc,	%f15,	%f20
	movrlez	%l4,	%l2,	%o4
	edge32n	%l0,	%g4,	%l1
	movrgz	%o2,	0x1DA,	%l3
	fmovrsne	%g5,	%f10,	%f12
	fxnors	%f1,	%f17,	%f5
	movre	%g1,	0x276,	%o1
	movgu	%icc,	%o0,	%i1
	edge16ln	%i7,	%i4,	%o6
	fpack32	%f26,	%f14,	%f24
	edge32l	%i5,	%o3,	%g3
	fmovdgu	%icc,	%f2,	%f23
	or	%g2,	0x0604,	%i2
	addccc	%i0,	%o5,	%g6
	movpos	%xcc,	%l6,	%i3
	subccc	%o7,	%l5,	%i6
	sir	0x09F4
	edge32l	%l4,	%l2,	%g7
	edge32l	%o4,	%g4,	%l1
	sra	%o2,	%l3,	%g5
	mova	%icc,	%l0,	%o1
	movn	%icc,	%o0,	%i1
	edge32n	%i7,	%g1,	%i4
	edge32	%o6,	%i5,	%g3
	fandnot1	%f16,	%f14,	%f8
	movrlz	%o3,	%i2,	%g2
	stb	%i0,	[%l7 + 0x19]
	srax	%o5,	%g6,	%i3
	umul	%l6,	%l5,	%i6
	mulscc	%o7,	%l4,	%g7
	ldd	[%l7 + 0x40],	%f24
	fmovda	%icc,	%f22,	%f8
	nop
	set	0x58, %l5
	stx	%l2,	[%l7 + %l5]
	sra	%g4,	0x03,	%l1
	fmovrdlez	%o4,	%f6,	%f4
	and	%o2,	%l3,	%g5
	alignaddrl	%l0,	%o1,	%i1
	alignaddrl	%i7,	%g1,	%i4
	ld	[%l7 + 0x54],	%f22
	srl	%o0,	0x0C,	%i5
	edge8	%g3,	%o6,	%i2
	edge16n	%g2,	%i0,	%o5
	movge	%xcc,	%g6,	%i3
	and	%o3,	0x1C97,	%l5
	sdivcc	%i6,	0x149B,	%o7
	movleu	%xcc,	%l4,	%l6
	smul	%l2,	0x190E,	%g7
	sdivcc	%g4,	0x0F02,	%o4
	stw	%o2,	[%l7 + 0x30]
	addcc	%l3,	%g5,	%l0
	xor	%o1,	%l1,	%i1
	srlx	%g1,	%i7,	%o0
	subccc	%i5,	%i4,	%o6
	stx	%g3,	[%l7 + 0x30]
	ldub	[%l7 + 0x5A],	%i2
	movrgez	%i0,	0x388,	%g2
	smulcc	%o5,	0x1186,	%i3
	sdiv	%o3,	0x146B,	%l5
	fcmps	%fcc2,	%f25,	%f2
	movrlz	%i6,	%o7,	%l4
	std	%f18,	[%l7 + 0x58]
	movne	%xcc,	%l6,	%g6
	edge8	%l2,	%g7,	%g4
	sth	%o4,	[%l7 + 0x54]
	subcc	%l3,	%g5,	%l0
	array16	%o2,	%o1,	%i1
	srlx	%l1,	0x02,	%g1
	fandnot1s	%f8,	%f27,	%f13
	sethi	0x122C,	%i7
	fornot1s	%f5,	%f10,	%f18
	std	%f22,	[%l7 + 0x30]
	fmovsle	%icc,	%f30,	%f22
	sth	%i5,	[%l7 + 0x62]
	st	%f6,	[%l7 + 0x60]
	edge32l	%o0,	%o6,	%g3
	addccc	%i4,	0x10D4,	%i0
	fmovrse	%g2,	%f11,	%f7
	fmuld8sux16	%f15,	%f26,	%f0
	pdist	%f2,	%f22,	%f20
	edge16	%o5,	%i2,	%i3
	fandnot1	%f0,	%f20,	%f24
	sra	%o3,	0x05,	%l5
	fmul8x16al	%f17,	%f4,	%f28
	alignaddr	%o7,	%l4,	%l6
	addccc	%i6,	%l2,	%g6
	sub	%g7,	0x0A27,	%g4
	ldsw	[%l7 + 0x2C],	%o4
	restore %g5, %l0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o1,	%l3,	%i1
	movg	%icc,	%l1,	%i7
	fsrc1	%f20,	%f20
	fandnot1s	%f20,	%f18,	%f11
	fpack32	%f22,	%f22,	%f24
	lduh	[%l7 + 0x6A],	%i5
	andn	%g1,	%o0,	%o6
	alignaddr	%g3,	%i0,	%i4
	edge8l	%o5,	%g2,	%i2
	sll	%i3,	%o3,	%o7
	srlx	%l5,	0x1E,	%l6
	fxors	%f30,	%f28,	%f2
	movge	%icc,	%l4,	%i6
	andn	%g6,	0x005C,	%l2
	subcc	%g7,	0x01FE,	%o4
	alignaddrl	%g4,	%l0,	%g5
	sdiv	%o1,	0x073B,	%o2
	sdivcc	%l3,	0x1998,	%l1
	fpack16	%f4,	%f17
	subc	%i1,	%i5,	%i7
	movrlz	%o0,	%o6,	%g3
	edge32n	%g1,	%i4,	%o5
	fmovsa	%xcc,	%f25,	%f4
	popc	0x0378,	%g2
	st	%f13,	[%l7 + 0x10]
	ldsh	[%l7 + 0x38],	%i0
	movneg	%xcc,	%i3,	%i2
	umulcc	%o7,	%l5,	%o3
	edge32n	%l4,	%i6,	%l6
	sethi	0x1326,	%g6
	edge16ln	%l2,	%g7,	%o4
	movneg	%xcc,	%g4,	%l0
	movneg	%xcc,	%o1,	%o2
	ldub	[%l7 + 0x49],	%g5
	stb	%l3,	[%l7 + 0x12]
	movcc	%xcc,	%i1,	%l1
	edge8ln	%i5,	%o0,	%i7
	movvc	%icc,	%g3,	%g1
	ldsb	[%l7 + 0x48],	%i4
	ld	[%l7 + 0x10],	%f13
	ldd	[%l7 + 0x60],	%o6
	edge8n	%g2,	%o5,	%i3
	fnors	%f16,	%f14,	%f20
	xorcc	%i2,	0x0834,	%o7
	fmuld8sux16	%f28,	%f4,	%f28
	fsrc2s	%f12,	%f18
	fmovda	%xcc,	%f6,	%f10
	fxnor	%f28,	%f14,	%f12
	xor	%l5,	%o3,	%i0
	movge	%xcc,	%l4,	%i6
	lduh	[%l7 + 0x66],	%l6
	movrne	%l2,	%g7,	%g6
	fmul8sux16	%f30,	%f12,	%f28
	popc	0x0C91,	%o4
	andcc	%g4,	0x0075,	%l0
	sdivx	%o1,	0x176E,	%o2
	fmovdle	%xcc,	%f25,	%f15
	popc	%l3,	%i1
	subccc	%l1,	%i5,	%g5
	array32	%o0,	%g3,	%g1
	ldx	[%l7 + 0x18],	%i4
	sllx	%i7,	%o6,	%g2
	array16	%o5,	%i2,	%o7
	udiv	%i3,	0x12B5,	%o3
	ldx	[%l7 + 0x68],	%i0
	edge8	%l4,	%i6,	%l5
	sir	0x1432
	fmovscc	%xcc,	%f10,	%f30
	fmovrsgz	%l6,	%f16,	%f5
	fnot1	%f22,	%f4
	movpos	%xcc,	%g7,	%l2
	sll	%o4,	0x03,	%g6
	edge16l	%g4,	%o1,	%o2
	fmovdcs	%icc,	%f7,	%f12
	sir	0x00E3
	movrlz	%l0,	0x158,	%i1
	movvc	%xcc,	%l3,	%l1
	fmovdle	%icc,	%f13,	%f19
	lduw	[%l7 + 0x30],	%i5
	ldub	[%l7 + 0x39],	%o0
	sub	%g5,	%g3,	%g1
	fpsub32	%f22,	%f14,	%f6
	andn	%i7,	%i4,	%o6
	ldd	[%l7 + 0x28],	%g2
	edge8ln	%i2,	%o5,	%o7
	fsrc2	%f0,	%f0
	fmovsa	%xcc,	%f1,	%f10
	fnand	%f10,	%f0,	%f22
	movleu	%xcc,	%o3,	%i0
	std	%f14,	[%l7 + 0x18]
	nop
	set	0x6B, %o1
	ldub	[%l7 + %o1],	%l4
	addcc	%i3,	%i6,	%l6
	sra	%g7,	%l5,	%o4
	xorcc	%l2,	0x0BF0,	%g4
	array16	%o1,	%g6,	%l0
	fmovrse	%i1,	%f1,	%f31
	orncc	%l3,	%l1,	%i5
	movge	%icc,	%o2,	%g5
	sth	%g3,	[%l7 + 0x62]
	alignaddr	%o0,	%g1,	%i4
	stb	%o6,	[%l7 + 0x36]
	edge8l	%i7,	%g2,	%i2
	sdiv	%o7,	0x1455,	%o5
	addccc	%i0,	0x0AB8,	%o3
	sth	%l4,	[%l7 + 0x52]
	addccc	%i6,	0x00F3,	%l6
	array32	%g7,	%l5,	%i3
	movgu	%icc,	%o4,	%g4
	fmovsneg	%icc,	%f26,	%f14
	fmul8x16au	%f17,	%f1,	%f22
	srlx	%l2,	0x09,	%g6
	edge16ln	%o1,	%i1,	%l3
	fpack16	%f12,	%f6
	edge8n	%l0,	%i5,	%l1
	fcmps	%fcc0,	%f10,	%f22
	fpsub16s	%f30,	%f19,	%f28
	fmovsg	%xcc,	%f8,	%f6
	lduw	[%l7 + 0x28],	%g5
	xorcc	%g3,	%o0,	%g1
	fxor	%f22,	%f10,	%f0
	edge8n	%i4,	%o6,	%o2
	srl	%g2,	%i7,	%i2
	fcmple32	%f28,	%f6,	%o7
	umul	%o5,	0x127E,	%o3
	ldsw	[%l7 + 0x38],	%i0
	mulx	%i6,	0x1AC9,	%l4
	fmovse	%icc,	%f10,	%f5
	fmovdcs	%icc,	%f22,	%f10
	movl	%icc,	%g7,	%l5
	fpack32	%f0,	%f14,	%f14
	movcc	%xcc,	%i3,	%l6
	fnot2	%f8,	%f8
	sllx	%g4,	%l2,	%g6
	edge8l	%o4,	%i1,	%l3
	ldsb	[%l7 + 0x19],	%l0
	fmovs	%f12,	%f27
	movg	%icc,	%o1,	%l1
	or	%i5,	%g5,	%g3
	movrne	%o0,	0x15F,	%g1
	fmovsvs	%icc,	%f7,	%f8
	bshuffle	%f30,	%f8,	%f24
	edge8n	%o6,	%o2,	%i4
	fcmped	%fcc2,	%f30,	%f14
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	fmovse	%icc,	%f17,	%f2
	smul	%g2,	%o7,	%o3
	addcc	%i0,	0x11A5,	%o5
	edge8n	%i6,	%l4,	%l5
	edge8n	%g7,	%l6,	%i3
	andcc	%l2,	0x0F24,	%g4
	movcs	%xcc,	%g6,	%i1
	xor	%l3,	0x06AB,	%l0
	srl	%o1,	0x08,	%o4
	addccc	%i5,	0x1BD7,	%g5
	fmovdl	%icc,	%f19,	%f13
	sdiv	%g3,	0x198E,	%l1
	nop
	set	0x48, %l3
	ldd	[%l7 + %l3],	%o0
	sll	%o6,	%o2,	%i4
	fpack16	%f26,	%f4
	movg	%xcc,	%g1,	%i2
	movrne	%i7,	0x3D5,	%g2
	addcc	%o3,	0x110C,	%i0
	edge8	%o5,	%o7,	%l4
	xor	%l5,	0x06F1,	%i6
	fmuld8sux16	%f16,	%f5,	%f22
	movg	%icc,	%l6,	%i3
	edge32l	%l2,	%g7,	%g6
	sra	%i1,	%l3,	%g4
	subc	%l0,	0x1064,	%o1
	xnor	%i5,	%o4,	%g5
	srlx	%g3,	%o0,	%l1
	fnors	%f31,	%f3,	%f7
	alignaddrl	%o6,	%o2,	%g1
	st	%f20,	[%l7 + 0x38]
	movrlez	%i2,	%i7,	%g2
	xor	%i4,	%o3,	%o5
	ldsb	[%l7 + 0x11],	%i0
	sll	%o7,	%l5,	%l4
	subcc	%l6,	0x0080,	%i3
	edge8	%l2,	%i6,	%g7
	xorcc	%g6,	%i1,	%g4
	addc	%l3,	0x0BC0,	%l0
	edge16	%o1,	%o4,	%g5
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%i5
	ldx	[%l7 + 0x50],	%o0
	smulcc	%l1,	%o6,	%o2
	movrlez	%g3,	0x1D3,	%i2
	fsrc1	%f6,	%f24
	movpos	%xcc,	%i7,	%g1
	orn	%i4,	%g2,	%o3
	movg	%xcc,	%o5,	%i0
	stx	%l5,	[%l7 + 0x58]
	srax	%l4,	%l6,	%i3
	movl	%icc,	%o7,	%l2
	fmovsgu	%xcc,	%f11,	%f4
	edge16ln	%g7,	%g6,	%i1
	stw	%g4,	[%l7 + 0x0C]
	edge32ln	%l3,	%l0,	%o1
	fmovrdgez	%i6,	%f18,	%f30
	stx	%o4,	[%l7 + 0x68]
	lduh	[%l7 + 0x08],	%i5
	nop
	set	0x40, %g1
	ldd	[%l7 + %g1],	%f12
	udivx	%g5,	0x15F0,	%l1
	array8	%o6,	%o2,	%o0
	fnor	%f24,	%f8,	%f18
	st	%f31,	[%l7 + 0x1C]
	mova	%xcc,	%g3,	%i7
	fmuld8ulx16	%f6,	%f9,	%f0
	ldsw	[%l7 + 0x4C],	%i2
	addcc	%i4,	%g1,	%g2
	udivcc	%o5,	0x1799,	%o3
	movrlz	%l5,	%i0,	%l4
	andcc	%i3,	0x0DC8,	%l6
	udivcc	%o7,	0x0E8E,	%g7
	edge8n	%g6,	%i1,	%g4
	fmovrsgz	%l2,	%f13,	%f14
	edge32l	%l0,	%o1,	%l3
	array32	%i6,	%i5,	%o4
	edge8n	%l1,	%o6,	%g5
	andcc	%o2,	%o0,	%i7
	andn	%g3,	0x1E17,	%i2
	movrlz	%g1,	0x2AC,	%i4
	mova	%icc,	%g2,	%o5
	movgu	%xcc,	%o3,	%i0
	array16	%l4,	%i3,	%l6
	udivx	%l5,	0x003B,	%g7
	fpadd16s	%f25,	%f19,	%f22
	fmovrslez	%g6,	%f5,	%f8
	sll	%i1,	%o7,	%g4
	movpos	%icc,	%l0,	%o1
	edge16n	%l2,	%l3,	%i5
	edge32	%o4,	%l1,	%i6
	fpadd16s	%f24,	%f7,	%f27
	edge32ln	%o6,	%g5,	%o0
	ldd	[%l7 + 0x48],	%f0
	lduh	[%l7 + 0x52],	%o2
	and	%i7,	0x0734,	%i2
	fcmple32	%f24,	%f0,	%g3
	lduh	[%l7 + 0x0A],	%i4
	move	%xcc,	%g1,	%g2
	fmovscc	%icc,	%f6,	%f23
	edge32ln	%o5,	%o3,	%l4
	xorcc	%i3,	0x1898,	%l6
	edge32l	%i0,	%g7,	%l5
	mulscc	%g6,	%i1,	%g4
	orncc	%l0,	%o7,	%o1
	fpsub32	%f24,	%f24,	%f8
	fandnot1s	%f18,	%f31,	%f28
	xor	%l3,	0x001D,	%i5
	orn	%o4,	0x1C24,	%l2
	sethi	0x1517,	%l1
	move	%xcc,	%o6,	%g5
	fnand	%f6,	%f24,	%f16
	mulscc	%o0,	0x1CF3,	%o2
	xnorcc	%i7,	0x02D7,	%i6
	ldsh	[%l7 + 0x56],	%g3
	fmovrslez	%i2,	%f16,	%f27
	srl	%g1,	0x00,	%i4
	faligndata	%f28,	%f8,	%f20
	edge8l	%o5,	%g2,	%l4
	ldx	[%l7 + 0x78],	%i3
	sllx	%l6,	0x17,	%o3
	movcc	%icc,	%i0,	%l5
	fornot2	%f12,	%f2,	%f30
	alignaddr	%g7,	%i1,	%g6
	restore %l0, 0x09CC, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x1E],	%o1
	array32	%l3,	%g4,	%o4
	alignaddrl	%i5,	%l1,	%o6
	subccc	%l2,	0x1378,	%o0
	edge32	%o2,	%g5,	%i7
	edge16	%i6,	%i2,	%g1
	movcs	%icc,	%g3,	%i4
	ldsh	[%l7 + 0x4C],	%g2
	xorcc	%l4,	%o5,	%i3
	save %o3, 0x0F09, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l5,	%i0,	%g7
	fpsub16s	%f7,	%f29,	%f11
	ldd	[%l7 + 0x60],	%i0
	sdivx	%l0,	0x0978,	%g6
	subcc	%o1,	0x03A4,	%o7
	orn	%l3,	0x13E8,	%o4
	std	%f0,	[%l7 + 0x20]
	sdivx	%g4,	0x14CF,	%i5
	ldsh	[%l7 + 0x1A],	%o6
	sll	%l1,	0x16,	%o0
	faligndata	%f4,	%f8,	%f0
	fmovsleu	%icc,	%f8,	%f25
	movge	%icc,	%l2,	%g5
	movl	%icc,	%i7,	%o2
	fmovrsne	%i2,	%f3,	%f13
	lduw	[%l7 + 0x18],	%i6
	mova	%xcc,	%g3,	%i4
	fandnot1	%f22,	%f4,	%f4
	movl	%xcc,	%g2,	%l4
	movre	%g1,	0x21F,	%o5
	xnor	%i3,	%l6,	%o3
	sll	%l5,	0x02,	%i0
	movgu	%xcc,	%i1,	%l0
	edge8	%g6,	%g7,	%o1
	sra	%o7,	%l3,	%o4
	umulcc	%g4,	0x09D2,	%i5
	edge16	%l1,	%o0,	%l2
	stb	%g5,	[%l7 + 0x0A]
	fpadd32s	%f7,	%f16,	%f26
	or	%i7,	0x134E,	%o2
	edge8n	%i2,	%i6,	%o6
	sub	%g3,	%g2,	%i4
	fmovdl	%icc,	%f27,	%f7
	udivx	%l4,	0x0B75,	%g1
	fcmpeq16	%f0,	%f26,	%o5
	fpack32	%f18,	%f6,	%f30
	save %i3, 0x0ABF, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%o3,	%l5
	sllx	%i1,	0x06,	%i0
	fmovde	%xcc,	%f22,	%f0
	xnor	%l0,	0x0369,	%g7
	xorcc	%o1,	0x0F95,	%o7
	smul	%g6,	0x1F41,	%l3
	popc	0x1597,	%o4
	movneg	%xcc,	%i5,	%l1
	andncc	%g4,	%l2,	%o0
	movneg	%xcc,	%g5,	%i7
	nop
	set	0x28, %i4
	std	%f0,	[%l7 + %i4]
	xnorcc	%i2,	%i6,	%o6
	orcc	%g3,	0x181E,	%g2
	fnot1s	%f9,	%f17
	sth	%i4,	[%l7 + 0x70]
	alignaddr	%l4,	%g1,	%o2
	fabss	%f8,	%f20
	sdivcc	%i3,	0x08C1,	%o5
	edge32	%o3,	%l5,	%i1
	subcc	%l6,	%l0,	%g7
	edge32n	%i0,	%o1,	%g6
	subcc	%o7,	0x176D,	%o4
	umul	%l3,	%i5,	%l1
	addc	%l2,	0x03D2,	%o0
	fcmpd	%fcc2,	%f0,	%f16
	movrgz	%g4,	0x244,	%i7
	std	%f0,	[%l7 + 0x50]
	fmovdge	%xcc,	%f3,	%f16
	fandnot1	%f4,	%f16,	%f20
	fsrc1	%f18,	%f30
	lduw	[%l7 + 0x58],	%i2
	movge	%xcc,	%g5,	%o6
	udiv	%g3,	0x00F2,	%g2
	fmovs	%f28,	%f20
	ldub	[%l7 + 0x11],	%i6
	smulcc	%i4,	%g1,	%o2
	array8	%l4,	%o5,	%o3
	save %l5, %i1, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x20],	%l6
	subcc	%l0,	%i0,	%g7
	fsrc1	%f28,	%f0
	xnorcc	%o1,	0x1A18,	%o7
	ldsb	[%l7 + 0x12],	%g6
	fmovda	%xcc,	%f22,	%f5
	mulx	%o4,	%l3,	%i5
	ldsw	[%l7 + 0x5C],	%l1
	sub	%l2,	%o0,	%g4
	sth	%i7,	[%l7 + 0x20]
	fmovdvc	%xcc,	%f27,	%f14
	fmovdleu	%icc,	%f16,	%f6
	movl	%xcc,	%i2,	%g5
	edge8l	%o6,	%g3,	%g2
	lduw	[%l7 + 0x24],	%i6
	fmovdn	%xcc,	%f26,	%f15
	movne	%xcc,	%g1,	%i4
	std	%f2,	[%l7 + 0x30]
	movpos	%icc,	%o2,	%o5
	lduw	[%l7 + 0x7C],	%o3
	addccc	%l4,	0x0BE5,	%i1
	orn	%i3,	0x1407,	%l6
	sdiv	%l0,	0x064A,	%i0
	movg	%xcc,	%l5,	%g7
	smul	%o1,	%o7,	%o4
	sth	%g6,	[%l7 + 0x48]
	alignaddr	%i5,	%l1,	%l2
	xnor	%l3,	0x1EE7,	%o0
	fmovdneg	%xcc,	%f27,	%f24
	fcmpgt32	%f26,	%f12,	%i7
	fmovscs	%xcc,	%f16,	%f31
	edge16	%i2,	%g4,	%o6
	fmovsn	%icc,	%f31,	%f4
	and	%g3,	%g2,	%i6
	fcmpeq32	%f30,	%f28,	%g5
	andncc	%g1,	%i4,	%o2
	fexpand	%f13,	%f10
	srax	%o3,	%o5,	%l4
	sth	%i1,	[%l7 + 0x62]
	subccc	%i3,	%l6,	%i0
	ldx	[%l7 + 0x10],	%l5
	movrlz	%l0,	0x319,	%o1
	edge32l	%g7,	%o4,	%o7
	fpadd32	%f18,	%f28,	%f6
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	fmovsne	%xcc,	%f15,	%f7
	fcmped	%fcc2,	%f30,	%f26
	alignaddr	%l1,	%l3,	%i7
	xnorcc	%i2,	%g4,	%o6
	fcmpeq16	%f20,	%f10,	%g3
	edge8ln	%g2,	%o0,	%i6
	edge16n	%g1,	%g5,	%i4
	sdiv	%o2,	0x1B04,	%o3
	movne	%icc,	%o5,	%i1
	sth	%i3,	[%l7 + 0x32]
	stb	%l4,	[%l7 + 0x35]
	edge16n	%l6,	%i0,	%l0
	movrlez	%l5,	0x2FB,	%g7
	fcmpgt32	%f30,	%f22,	%o1
	fmovsgu	%icc,	%f31,	%f25
	alignaddrl	%o7,	%o4,	%g6
	andncc	%l2,	%l1,	%l3
	fnor	%f8,	%f0,	%f30
	movcc	%xcc,	%i5,	%i7
	fnors	%f23,	%f27,	%f25
	fcmpes	%fcc2,	%f0,	%f25
	udiv	%i2,	0x0B9A,	%g4
	fnegd	%f6,	%f24
	stx	%o6,	[%l7 + 0x40]
	smulcc	%g2,	0x1303,	%g3
	fones	%f23
	st	%f23,	[%l7 + 0x0C]
	edge16	%o0,	%i6,	%g1
	ldsw	[%l7 + 0x0C],	%g5
	fmovrsne	%i4,	%f16,	%f3
	mulx	%o2,	0x1143,	%o3
	fmovdcs	%icc,	%f3,	%f16
	sll	%i1,	%o5,	%i3
	movcs	%icc,	%l4,	%i0
	fpadd16s	%f7,	%f0,	%f16
	ld	[%l7 + 0x08],	%f28
	fxnors	%f23,	%f11,	%f15
	movge	%xcc,	%l6,	%l0
	sll	%g7,	%l5,	%o7
	udivx	%o4,	0x0905,	%g6
	fmovsge	%icc,	%f28,	%f2
	movg	%icc,	%o1,	%l2
	edge8ln	%l1,	%l3,	%i5
	fmovrsgz	%i7,	%f17,	%f0
	movcc	%xcc,	%i2,	%o6
	edge16n	%g4,	%g3,	%o0
	movrgez	%g2,	%g1,	%i6
	std	%f8,	[%l7 + 0x28]
	ld	[%l7 + 0x44],	%f20
	st	%f5,	[%l7 + 0x0C]
	fmovrde	%g5,	%f28,	%f14
	save %o2, %i4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x142D,	%i1
	stw	%i3,	[%l7 + 0x3C]
	fmovsg	%icc,	%f23,	%f4
	stw	%l4,	[%l7 + 0x64]
	fsrc1	%f4,	%f20
	movgu	%icc,	%i0,	%l6
	edge8l	%o5,	%g7,	%l5
	fpadd32s	%f27,	%f25,	%f1
	addc	%o7,	0x142F,	%o4
	fcmps	%fcc2,	%f24,	%f11
	movneg	%icc,	%l0,	%g6
	fmovrse	%l2,	%f21,	%f6
	fmul8x16	%f27,	%f28,	%f8
	xor	%o1,	0x1330,	%l1
	udivx	%i5,	0x0264,	%i7
	fpadd16s	%f3,	%f23,	%f27
	fors	%f13,	%f27,	%f17
	sll	%i2,	%l3,	%g4
	addccc	%o6,	%o0,	%g2
	addccc	%g1,	0x15E9,	%i6
	movge	%icc,	%g3,	%g5
	std	%f8,	[%l7 + 0x10]
	subcc	%o2,	0x0E51,	%i4
	fmovrsgz	%i1,	%f5,	%f24
	std	%f6,	[%l7 + 0x78]
	movgu	%xcc,	%i3,	%o3
	movcc	%icc,	%l4,	%l6
	and	%i0,	%o5,	%g7
	andn	%l5,	0x17E2,	%o7
	orncc	%l0,	0x1D9E,	%o4
	fpack32	%f12,	%f14,	%f22
	nop
	set	0x13, %g4
	ldub	[%l7 + %g4],	%l2
	movneg	%xcc,	%o1,	%g6
	ldsh	[%l7 + 0x52],	%l1
	fpadd32s	%f4,	%f9,	%f22
	fsrc1	%f18,	%f28
	ldd	[%l7 + 0x60],	%f8
	fmuld8sux16	%f24,	%f4,	%f0
	ldd	[%l7 + 0x58],	%f8
	movleu	%icc,	%i7,	%i5
	siam	0x7
	ld	[%l7 + 0x6C],	%f20
	mova	%icc,	%i2,	%l3
	fmovscs	%icc,	%f19,	%f17
	edge16l	%o6,	%g4,	%g2
	sra	%o0,	%g1,	%g3
	movge	%icc,	%i6,	%g5
	move	%icc,	%i4,	%i1
	fsrc1	%f24,	%f26
	nop
	set	0x0D, %i5
	stb	%i3,	[%l7 + %i5]
	movle	%xcc,	%o2,	%o3
	lduw	[%l7 + 0x28],	%l6
	mulscc	%l4,	%i0,	%g7
	movne	%icc,	%l5,	%o7
	fmovrsgz	%l0,	%f9,	%f22
	fmul8x16al	%f6,	%f9,	%f16
	movn	%icc,	%o4,	%o5
	udivx	%l2,	0x1232,	%o1
	movrlz	%l1,	%g6,	%i7
	andncc	%i5,	%i2,	%o6
	orcc	%g4,	%g2,	%l3
	andncc	%o0,	%g1,	%g3
	ldsb	[%l7 + 0x5B],	%i6
	fmovdleu	%xcc,	%f25,	%f11
	fmovrse	%g5,	%f27,	%f9
	ldd	[%l7 + 0x38],	%f26
	movg	%icc,	%i4,	%i3
	fmovrdlz	%i1,	%f6,	%f10
	ld	[%l7 + 0x5C],	%f30
	fornot2s	%f9,	%f0,	%f23
	popc	0x12F4,	%o2
	movre	%l6,	0x290,	%l4
	fmovsvs	%xcc,	%f15,	%f21
	alignaddrl	%i0,	%g7,	%l5
	movleu	%icc,	%o7,	%o3
	ldd	[%l7 + 0x68],	%f8
	sra	%l0,	%o5,	%l2
	movcc	%icc,	%o1,	%l1
	edge8	%o4,	%g6,	%i7
	fandnot2	%f0,	%f12,	%f18
	move	%xcc,	%i2,	%i5
	movn	%xcc,	%g4,	%o6
	sll	%l3,	%o0,	%g2
	movgu	%xcc,	%g3,	%i6
	move	%xcc,	%g1,	%i4
	edge32	%g5,	%i3,	%i1
	mulx	%l6,	0x132B,	%l4
	fmul8x16au	%f10,	%f26,	%f2
	movvs	%icc,	%i0,	%o2
	movvs	%icc,	%g7,	%o7
	orncc	%l5,	%l0,	%o5
	movcc	%xcc,	%o3,	%l2
	udiv	%o1,	0x030D,	%l1
	srlx	%g6,	0x18,	%o4
	siam	0x7
	st	%f7,	[%l7 + 0x14]
	fmul8sux16	%f16,	%f20,	%f24
	add	%i2,	%i7,	%i5
	fmovrdlez	%g4,	%f14,	%f30
	or	%o6,	0x0B12,	%o0
	andcc	%g2,	0x088A,	%g3
	stw	%l3,	[%l7 + 0x78]
	xnorcc	%i6,	0x120F,	%g1
	sra	%g5,	0x0E,	%i3
	movcc	%icc,	%i1,	%l6
	addc	%i4,	%l4,	%o2
	srlx	%i0,	0x14,	%g7
	sdivx	%l5,	0x13F1,	%l0
	nop
	set	0x30, %i2
	stx	%o7,	[%l7 + %i2]
	addcc	%o5,	%l2,	%o3
	srl	%o1,	0x05,	%g6
	subc	%l1,	%i2,	%i7
	fmul8x16au	%f4,	%f31,	%f18
	fxnors	%f10,	%f0,	%f23
	fcmps	%fcc2,	%f3,	%f24
	fornot2	%f26,	%f2,	%f20
	umul	%i5,	0x1CC8,	%g4
	edge32l	%o6,	%o0,	%o4
	fmovdn	%icc,	%f0,	%f15
	sethi	0x0EE6,	%g3
	fors	%f13,	%f12,	%f5
	movvc	%xcc,	%g2,	%i6
	addcc	%g1,	0x0776,	%g5
	alignaddrl	%i3,	%l3,	%l6
	ld	[%l7 + 0x68],	%f23
	subcc	%i4,	0x0FFC,	%i1
	fcmple32	%f12,	%f0,	%l4
	edge16n	%o2,	%i0,	%g7
	ldsh	[%l7 + 0x74],	%l0
	movrgz	%o7,	%l5,	%l2
	fmovd	%f6,	%f18
	fmovsle	%icc,	%f27,	%f18
	movcc	%icc,	%o5,	%o1
	smul	%o3,	0x1091,	%g6
	sir	0x133D
	fmuld8sux16	%f12,	%f5,	%f26
	fpmerge	%f11,	%f21,	%f0
	fabss	%f18,	%f9
	sethi	0x192D,	%l1
	addccc	%i7,	0x1E44,	%i5
	edge8n	%g4,	%o6,	%o0
	udivcc	%o4,	0x04B5,	%i2
	ldsh	[%l7 + 0x70],	%g2
	movg	%xcc,	%g3,	%g1
	st	%f25,	[%l7 + 0x18]
	edge8ln	%i6,	%i3,	%g5
	addcc	%l3,	0x07FC,	%i4
	edge16n	%l6,	%l4,	%o2
	fmovsge	%icc,	%f12,	%f19
	edge16	%i0,	%g7,	%i1
	movrne	%l0,	%o7,	%l5
	popc	0x1088,	%l2
	xor	%o5,	0x0647,	%o1
	orncc	%o3,	0x12A0,	%g6
	array8	%i7,	%i5,	%g4
	fcmpes	%fcc1,	%f26,	%f11
	fzeros	%f12
	save %o6, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o4,	0x1A38,	%g2
	ldub	[%l7 + 0x61],	%i2
	xor	%g1,	0x1F30,	%g3
	ld	[%l7 + 0x78],	%f27
	smulcc	%i3,	%g5,	%l3
	stx	%i4,	[%l7 + 0x18]
	sra	%i6,	0x01,	%l4
	fand	%f14,	%f14,	%f6
	or	%l6,	0x07D5,	%i0
	array16	%o2,	%i1,	%g7
	sdiv	%o7,	0x0EAA,	%l0
	movrne	%l2,	%l5,	%o1
	ld	[%l7 + 0x30],	%f23
	nop
	set	0x29, %l0
	stb	%o5,	[%l7 + %l0]
	st	%f15,	[%l7 + 0x54]
	move	%icc,	%g6,	%o3
	edge16	%i7,	%i5,	%g4
	andcc	%o6,	%o0,	%l1
	orn	%o4,	0x1B91,	%g2
	movpos	%icc,	%g1,	%i2
	fones	%f22
	edge32ln	%i3,	%g3,	%g5
	smulcc	%i4,	%i6,	%l3
	fmovrde	%l6,	%f18,	%f20
	edge16n	%i0,	%l4,	%i1
	fmovdle	%xcc,	%f25,	%f20
	ldd	[%l7 + 0x78],	%f4
	fnegs	%f19,	%f5
	ldd	[%l7 + 0x58],	%f6
	fxnor	%f24,	%f16,	%f8
	alignaddr	%o2,	%g7,	%l0
	fors	%f17,	%f23,	%f26
	save %o7, %l5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l2,	%g6
	movl	%icc,	%o5,	%i7
	lduh	[%l7 + 0x38],	%o3
	movleu	%xcc,	%g4,	%i5
	xor	%o0,	0x0B0B,	%l1
	lduh	[%l7 + 0x5A],	%o4
	alignaddrl	%g2,	%g1,	%o6
	fmovdneg	%icc,	%f10,	%f24
	fone	%f2
	movre	%i2,	0x3A6,	%i3
	fands	%f4,	%f1,	%f28
	fandnot2s	%f10,	%f15,	%f3
	movle	%icc,	%g3,	%i4
	edge16n	%i6,	%g5,	%l3
	fone	%f18
	stb	%i0,	[%l7 + 0x2D]
	ldsw	[%l7 + 0x40],	%l4
	edge16n	%l6,	%i1,	%o2
	sdivcc	%l0,	0x1FDE,	%o7
	mulscc	%g7,	0x1585,	%l5
	movre	%o1,	%g6,	%o5
	movrlez	%l2,	0x013,	%o3
	ldub	[%l7 + 0x17],	%i7
	edge32l	%g4,	%i5,	%l1
	fcmpeq32	%f14,	%f8,	%o4
	add	%o0,	%g2,	%g1
	orn	%i2,	0x17E2,	%o6
	edge8ln	%i3,	%i4,	%g3
	fmovrse	%g5,	%f29,	%f16
	fsrc1s	%f30,	%f31
	nop
	set	0x10, %g2
	ldx	[%l7 + %g2],	%i6
	udiv	%i0,	0x049E,	%l3
	movleu	%icc,	%l6,	%l4
	andn	%o2,	%i1,	%l0
	sdivcc	%o7,	0x1A57,	%g7
	edge32l	%o1,	%g6,	%o5
	nop
	set	0x50, %g5
	std	%f24,	[%l7 + %g5]
	fnors	%f0,	%f11,	%f10
	movcs	%icc,	%l5,	%o3
	subc	%l2,	0x1AE1,	%g4
	edge8	%i7,	%i5,	%l1
	fpadd16s	%f3,	%f1,	%f2
	fmul8x16al	%f9,	%f18,	%f4
	fxnors	%f3,	%f4,	%f30
	edge8	%o4,	%o0,	%g1
	umul	%i2,	0x19FD,	%g2
	edge16n	%o6,	%i4,	%i3
	edge8ln	%g5,	%g3,	%i0
	xnorcc	%l3,	0x130E,	%i6
	movcs	%icc,	%l6,	%o2
	popc	0x10F2,	%l4
	addccc	%i1,	0x0953,	%l0
	edge16ln	%g7,	%o7,	%g6
	srl	%o1,	0x0C,	%o5
	edge16	%o3,	%l5,	%g4
	udivx	%i7,	0x0A82,	%i5
	smul	%l1,	%l2,	%o4
	std	%f2,	[%l7 + 0x08]
	subcc	%o0,	%g1,	%g2
	edge32l	%i2,	%i4,	%o6
	movrne	%i3,	0x119,	%g3
	fcmpd	%fcc2,	%f4,	%f22
	movrlez	%g5,	%i0,	%l3
	subcc	%l6,	%i6,	%l4
	ldsh	[%l7 + 0x26],	%i1
	orcc	%o2,	0x1E02,	%g7
	movle	%icc,	%o7,	%l0
	orncc	%g6,	%o5,	%o1
	addc	%l5,	0x06C2,	%o3
	ldx	[%l7 + 0x58],	%i7
	udiv	%i5,	0x16DC,	%g4
	xnorcc	%l1,	%l2,	%o4
	ldd	[%l7 + 0x30],	%f8
	fpack16	%f22,	%f14
	addcc	%g1,	0x1393,	%g2
	lduw	[%l7 + 0x3C],	%i2
	edge32n	%i4,	%o6,	%i3
	fmovdleu	%xcc,	%f6,	%f15
	orcc	%o0,	0x091F,	%g3
	udivcc	%g5,	0x0274,	%i0
	xnor	%l6,	%l3,	%i6
	fabsd	%f20,	%f16
	movgu	%xcc,	%i1,	%l4
	xnorcc	%o2,	%g7,	%l0
	fmovrsgz	%o7,	%f26,	%f18
	stx	%o5,	[%l7 + 0x70]
	fmovdgu	%icc,	%f29,	%f19
	movrlez	%g6,	%o1,	%l5
	edge8ln	%i7,	%o3,	%i5
	popc	0x18C5,	%g4
	orn	%l1,	%l2,	%g1
	udivcc	%g2,	0x1962,	%o4
	fmovdneg	%xcc,	%f23,	%f4
	movvc	%xcc,	%i4,	%o6
	fxnor	%f0,	%f10,	%f20
	edge16l	%i3,	%i2,	%o0
	nop
	set	0x4E, %o6
	sth	%g5,	[%l7 + %o6]
	lduh	[%l7 + 0x76],	%i0
	fpsub32	%f14,	%f20,	%f8
	fornot1s	%f28,	%f25,	%f16
	fors	%f20,	%f8,	%f0
	edge16	%g3,	%l3,	%l6
	srl	%i1,	%l4,	%o2
	movg	%xcc,	%i6,	%l0
	movrgz	%o7,	0x173,	%g7
	ldsb	[%l7 + 0x6A],	%o5
	srlx	%g6,	0x0B,	%l5
	sra	%o1,	%i7,	%o3
	add	%g4,	%l1,	%l2
	array8	%g1,	%g2,	%i5
	sdivcc	%o4,	0x1B64,	%o6
	ldd	[%l7 + 0x18],	%i4
	fmovsvs	%icc,	%f14,	%f0
	andcc	%i3,	0x0E47,	%i2
	fcmpeq16	%f26,	%f10,	%g5
	fnands	%f23,	%f29,	%f8
	subc	%i0,	%g3,	%o0
	andncc	%l6,	%i1,	%l4
	smul	%l3,	%i6,	%o2
	xor	%l0,	%g7,	%o5
	edge8	%o7,	%l5,	%o1
	sllx	%g6,	0x19,	%i7
	or	%o3,	%g4,	%l1
	restore %l2, 0x13EF, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%i5,	%o4,	%o6
	srlx	%i4,	0x0B,	%g1
	xor	%i3,	0x0228,	%g5
	subccc	%i0,	0x1577,	%g3
	st	%f15,	[%l7 + 0x1C]
	lduh	[%l7 + 0x2A],	%o0
	movge	%icc,	%i2,	%i1
	andn	%l4,	0x0336,	%l3
	and	%i6,	0x19EA,	%o2
	subc	%l6,	%l0,	%o5
	fmovsl	%icc,	%f27,	%f23
	srlx	%g7,	0x05,	%l5
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%o0
	xnor	%o7,	0x14DE,	%g6
	fnor	%f6,	%f18,	%f28
	fmovdg	%icc,	%f2,	%f30
	mova	%icc,	%i7,	%g4
	save %o3, 0x05AD, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l1,	%g2,	%o4
	movrgez	%i5,	0x32B,	%o6
	fmovrdne	%i4,	%f26,	%f2
	movcc	%xcc,	%i3,	%g1
	pdist	%f10,	%f16,	%f14
	edge8l	%i0,	%g5,	%o0
	stb	%i2,	[%l7 + 0x4F]
	fcmpgt32	%f22,	%f8,	%i1
	fpmerge	%f14,	%f21,	%f8
	fmovscc	%icc,	%f19,	%f22
	alignaddr	%g3,	%l4,	%l3
	fandnot2s	%f6,	%f30,	%f24
	add	%i6,	%l6,	%l0
	edge8ln	%o2,	%g7,	%o5
	xnor	%o1,	%o7,	%g6
	ldd	[%l7 + 0x78],	%i6
	fnot2s	%f6,	%f22
	fmovrdgz	%l5,	%f16,	%f28
	movrlez	%o3,	%g4,	%l1
	alignaddr	%l2,	%g2,	%o4
	sra	%o6,	0x0A,	%i4
	stw	%i5,	[%l7 + 0x50]
	xor	%g1,	0x1A1C,	%i3
	movcc	%xcc,	%i0,	%o0
	edge8l	%g5,	%i1,	%i2
	movrne	%g3,	%l3,	%i6
	edge8	%l4,	%l6,	%o2
	fmovrdgz	%g7,	%f12,	%f12
	fmovrsgz	%l0,	%f13,	%f28
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	mulscc	%o1,	0x10EA,	%i7
	fmovdne	%icc,	%f5,	%f31
	stb	%g6,	[%l7 + 0x29]
	udiv	%l5,	0x0F0F,	%g4
	stb	%l1,	[%l7 + 0x7C]
	srax	%l2,	0x1D,	%o3
	mulscc	%o4,	0x1A89,	%g2
	stx	%o6,	[%l7 + 0x18]
	movpos	%icc,	%i5,	%i4
	edge32ln	%i3,	%g1,	%o0
	fnot1s	%f6,	%f15
	stx	%g5,	[%l7 + 0x78]
	fornot2	%f0,	%f24,	%f20
	movpos	%icc,	%i0,	%i2
	addc	%i1,	%l3,	%i6
	fxnor	%f12,	%f8,	%f26
	addc	%l4,	%g3,	%l6
	andncc	%g7,	%l0,	%o2
	andncc	%o5,	%o1,	%o7
	mulx	%i7,	0x0045,	%l5
	stw	%g4,	[%l7 + 0x48]
	fmovdn	%icc,	%f17,	%f14
	fnegs	%f31,	%f17
	ldx	[%l7 + 0x50],	%g6
	fsrc1	%f18,	%f22
	ldub	[%l7 + 0x23],	%l1
	fands	%f26,	%f14,	%f13
	ld	[%l7 + 0x58],	%f16
	mulscc	%o3,	0x030E,	%o4
	fmovsvs	%icc,	%f6,	%f11
	movrlez	%g2,	0x0B4,	%o6
	ldsw	[%l7 + 0x38],	%l2
	xnorcc	%i4,	%i3,	%g1
	fmovrsgz	%i5,	%f28,	%f21
	sir	0x1C70
	stx	%g5,	[%l7 + 0x68]
	alignaddr	%i0,	%o0,	%i1
	udivcc	%i2,	0x148D,	%i6
	fmovdle	%xcc,	%f15,	%f7
	movleu	%xcc,	%l3,	%l4
	lduw	[%l7 + 0x3C],	%l6
	sth	%g3,	[%l7 + 0x52]
	fabss	%f23,	%f0
	fpsub16s	%f10,	%f30,	%f19
	sdivx	%l0,	0x188E,	%g7
	addc	%o2,	0x0D6C,	%o5
	movl	%icc,	%o7,	%o1
	nop
	set	0x08, %i7
	lduh	[%l7 + %i7],	%l5
	movrgez	%i7,	0x3A7,	%g4
	nop
	set	0x68, %o7
	ldsw	[%l7 + %o7],	%g6
	smul	%o3,	%o4,	%l1
	movvs	%xcc,	%g2,	%l2
	movg	%xcc,	%i4,	%o6
	fnot2s	%f20,	%f22
	xnorcc	%g1,	0x0575,	%i5
	umulcc	%i3,	0x0224,	%g5
	movl	%icc,	%o0,	%i1
	fmovdl	%icc,	%f31,	%f27
	mulscc	%i0,	0x01C1,	%i2
	ldsw	[%l7 + 0x38],	%l3
	mulx	%i6,	0x1DA3,	%l6
	fmovrdne	%g3,	%f0,	%f20
	movvc	%icc,	%l0,	%l4
	fabsd	%f18,	%f18
	and	%o2,	0x035F,	%g7
	smulcc	%o5,	%o1,	%l5
	movrne	%i7,	0x2C0,	%g4
	edge32l	%o7,	%o3,	%o4
	addcc	%g6,	0x0A49,	%g2
	subccc	%l1,	%i4,	%l2
	fpsub32	%f12,	%f2,	%f24
	movle	%xcc,	%o6,	%g1
	movre	%i3,	0x012,	%g5
	fmovsg	%icc,	%f7,	%f3
	popc	%o0,	%i1
	orn	%i5,	%i0,	%l3
	array16	%i6,	%l6,	%i2
	ldd	[%l7 + 0x40],	%l0
	movvc	%xcc,	%g3,	%l4
	sdivcc	%g7,	0x0B08,	%o5
	subc	%o1,	%o2,	%l5
	umulcc	%g4,	0x0B49,	%o7
	addcc	%o3,	%i7,	%g6
	andcc	%g2,	%o4,	%l1
	fnegs	%f12,	%f20
	fpackfix	%f24,	%f1
	subc	%i4,	%l2,	%o6
	movrne	%g1,	0x0DF,	%g5
	edge16ln	%o0,	%i3,	%i5
	sdiv	%i1,	0x0498,	%l3
	fmovse	%icc,	%f3,	%f11
	fmovsne	%xcc,	%f4,	%f5
	sdivx	%i0,	0x0E72,	%l6
	movre	%i2,	%i6,	%g3
	fmovsn	%xcc,	%f6,	%f2
	restore %l4, %g7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o1,	%o2,	%l0
	udivx	%g4,	0x0FC3,	%l5
	edge16n	%o3,	%o7,	%g6
	edge16ln	%g2,	%o4,	%l1
	ldd	[%l7 + 0x50],	%i6
	fmovsge	%icc,	%f10,	%f7
	movrgez	%i4,	%l2,	%g1
	andncc	%g5,	%o6,	%i3
	fmovdneg	%icc,	%f27,	%f23
	save %i5, 0x00A6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f29,	%f11,	%f28
	smulcc	%l3,	0x1D51,	%i1
	fzeros	%f30
	ldub	[%l7 + 0x11],	%l6
	ldd	[%l7 + 0x60],	%i2
	addcc	%i0,	%i6,	%g3
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	ldd	[%l7 + 0x58],	%o0
	fpack32	%f12,	%f14,	%f22
	edge32	%o2,	%l0,	%l5
	ldsw	[%l7 + 0x60],	%g4
	and	%o3,	0x12B7,	%o7
	stb	%g2,	[%l7 + 0x11]
	movneg	%icc,	%o4,	%l1
	movle	%icc,	%g6,	%i7
	udivcc	%i4,	0x0FE7,	%l2
	orn	%g5,	%g1,	%i3
	movrne	%i5,	%o0,	%o6
	fmovde	%xcc,	%f23,	%f18
	fmovsne	%icc,	%f25,	%f3
	stw	%l3,	[%l7 + 0x1C]
	ldd	[%l7 + 0x30],	%i0
	fmovspos	%xcc,	%f6,	%f3
	sdivcc	%i2,	0x0D08,	%l6
	smul	%i6,	0x10E8,	%i0
	fmovsa	%icc,	%f2,	%f30
	movn	%xcc,	%g3,	%l4
	sdivx	%o5,	0x1436,	%g7
	array16	%o1,	%o2,	%l0
	xnorcc	%g4,	%o3,	%o7
	move	%icc,	%g2,	%l5
	edge16n	%o4,	%l1,	%i7
	fandnot2	%f26,	%f30,	%f22
	fornot2s	%f1,	%f4,	%f14
	save %i4, 0x1063, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1	%f18,	%f22,	%f14
	edge32n	%g5,	%g1,	%l2
	sll	%i3,	%o0,	%o6
	movleu	%icc,	%l3,	%i1
	movl	%xcc,	%i5,	%i2
	edge8l	%i6,	%l6,	%i0
	fmovscs	%icc,	%f13,	%f15
	fand	%f14,	%f16,	%f6
	sth	%l4,	[%l7 + 0x24]
	edge8l	%g3,	%g7,	%o5
	st	%f23,	[%l7 + 0x50]
	std	%f12,	[%l7 + 0x18]
	edge8l	%o1,	%o2,	%l0
	fornot1	%f22,	%f4,	%f18
	sll	%o3,	0x0B,	%g4
	movg	%xcc,	%o7,	%l5
	fmovsg	%xcc,	%f18,	%f5
	xnorcc	%g2,	0x156D,	%l1
	udivx	%i7,	0x0DF7,	%o4
	siam	0x6
	sllx	%i4,	%g6,	%g1
	ldsw	[%l7 + 0x14],	%g5
	movcs	%icc,	%l2,	%i3
	addccc	%o0,	0x08B8,	%o6
	movl	%icc,	%l3,	%i5
	fpack32	%f30,	%f26,	%f26
	sra	%i2,	%i1,	%l6
	restore %i0, %i6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l4,	%o5
	fsrc1	%f0,	%f10
	movrgez	%o1,	0x1E8,	%o2
	stx	%l0,	[%l7 + 0x48]
	movpos	%icc,	%o3,	%g7
	alignaddr	%o7,	%l5,	%g2
	std	%f0,	[%l7 + 0x20]
	mova	%icc,	%l1,	%i7
	fcmpgt16	%f0,	%f4,	%g4
	array8	%i4,	%g6,	%o4
	sra	%g5,	0x14,	%g1
	movpos	%xcc,	%i3,	%o0
	movne	%icc,	%l2,	%l3
	fcmpd	%fcc2,	%f6,	%f26
	edge16n	%i5,	%i2,	%o6
	stw	%i1,	[%l7 + 0x58]
	subc	%i0,	0x0ADD,	%l6
	movn	%icc,	%g3,	%i6
	xor	%l4,	%o5,	%o2
	andcc	%l0,	%o1,	%g7
	movneg	%icc,	%o3,	%l5
	ldsw	[%l7 + 0x28],	%g2
	movrlez	%o7,	0x201,	%i7
	st	%f5,	[%l7 + 0x18]
	mova	%icc,	%l1,	%i4
	fpadd32	%f14,	%f16,	%f28
	ldsb	[%l7 + 0x57],	%g6
	sra	%g4,	%g5,	%g1
	sub	%o4,	%o0,	%i3
	edge32n	%l3,	%i5,	%i2
	move	%icc,	%o6,	%l2
	sll	%i1,	0x11,	%i0
	sllx	%g3,	0x0F,	%l6
	fnand	%f24,	%f26,	%f0
	movrne	%i6,	%l4,	%o2
	ldd	[%l7 + 0x08],	%f2
	fmovrsgez	%l0,	%f9,	%f8
	stw	%o1,	[%l7 + 0x38]
	edge8ln	%o5,	%g7,	%o3
	fcmple32	%f6,	%f18,	%g2
	srax	%l5,	0x04,	%o7
	stw	%l1,	[%l7 + 0x6C]
	ldsb	[%l7 + 0x76],	%i4
	array16	%i7,	%g4,	%g5
	add	%g1,	0x1CF1,	%o4
	fmovsleu	%xcc,	%f4,	%f23
	movcs	%xcc,	%g6,	%i3
	srlx	%o0,	%l3,	%i5
	movleu	%xcc,	%i2,	%l2
	fmovrde	%o6,	%f28,	%f10
	srl	%i0,	%g3,	%l6
	movgu	%xcc,	%i6,	%l4
	srlx	%i1,	%o2,	%o1
	sdivx	%l0,	0x0A04,	%o5
	addcc	%o3,	0x12B5,	%g7
	udivcc	%g2,	0x1EE0,	%o7
	lduh	[%l7 + 0x28],	%l1
	xorcc	%i4,	%l5,	%i7
	orcc	%g5,	0x1ED8,	%g1
	edge16ln	%o4,	%g4,	%g6
	edge32ln	%o0,	%i3,	%i5
	fnegs	%f17,	%f5
	xnorcc	%i2,	0x1DD0,	%l3
	movre	%l2,	0x158,	%o6
	array8	%i0,	%g3,	%l6
	movcs	%xcc,	%i6,	%i1
	movneg	%icc,	%o2,	%l4
	smul	%l0,	0x0385,	%o1
	andn	%o5,	0x0C68,	%g7
	srax	%g2,	%o7,	%o3
	movre	%i4,	0x3F2,	%l5
	sethi	0x15F1,	%l1
	fpack32	%f22,	%f0,	%f20
	lduh	[%l7 + 0x76],	%i7
	movpos	%xcc,	%g5,	%o4
	movg	%xcc,	%g4,	%g1
	st	%f27,	[%l7 + 0x48]
	edge32n	%g6,	%i3,	%i5
	fandnot1	%f22,	%f8,	%f0
	lduh	[%l7 + 0x7E],	%o0
	xor	%l3,	%l2,	%o6
	faligndata	%f16,	%f6,	%f0
	lduw	[%l7 + 0x1C],	%i2
	xor	%g3,	%l6,	%i6
	mulx	%i0,	0x1CB6,	%o2
	array32	%i1,	%l4,	%o1
	ldd	[%l7 + 0x28],	%l0
	lduh	[%l7 + 0x4C],	%g7
	xnorcc	%g2,	%o5,	%o3
	st	%f9,	[%l7 + 0x30]
	fand	%f6,	%f6,	%f14
	edge32ln	%i4,	%o7,	%l5
	smulcc	%l1,	0x15EE,	%g5
	movrne	%i7,	0x3F2,	%o4
	xnor	%g1,	0x0E0B,	%g4
	fones	%f11
	edge8ln	%g6,	%i3,	%i5
	srax	%l3,	0x01,	%o0
	orn	%o6,	0x09D2,	%l2
	alignaddrl	%i2,	%l6,	%i6
	subccc	%i0,	0x0137,	%g3
	sll	%o2,	0x08,	%l4
	fsrc1s	%f17,	%f20
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	edge32l	%g2,	%o5,	%g7
	edge8	%i4,	%o3,	%o7
	siam	0x5
	array32	%l5,	%l1,	%g5
	stx	%i7,	[%l7 + 0x40]
	ld	[%l7 + 0x58],	%f24
	orncc	%g1,	0x074A,	%g4
	lduw	[%l7 + 0x24],	%g6
	movre	%i3,	%i5,	%o4
	xnor	%l3,	0x18E0,	%o0
	fmovdcc	%xcc,	%f7,	%f29
	movge	%icc,	%l2,	%o6
	movrgez	%i2,	%l6,	%i6
	movl	%icc,	%i0,	%g3
	stw	%o2,	[%l7 + 0x44]
	movrgez	%i1,	0x186,	%o1
	movrlez	%l0,	%l4,	%g2
	movpos	%xcc,	%g7,	%i4
	fcmple32	%f22,	%f4,	%o3
	sethi	0x1592,	%o7
	edge8n	%o5,	%l5,	%l1
	fmovrdlez	%g5,	%f0,	%f30
	fmul8sux16	%f26,	%f10,	%f12
	movrlez	%g1,	0x335,	%g4
	umul	%g6,	0x07D3,	%i7
	andcc	%i3,	0x0F4C,	%i5
	umulcc	%o4,	0x0224,	%l3
	ldsw	[%l7 + 0x0C],	%l2
	sllx	%o6,	%o0,	%l6
	movrgz	%i6,	%i0,	%g3
	sllx	%i2,	0x00,	%i1
	fcmpd	%fcc0,	%f0,	%f10
	alignaddrl	%o2,	%o1,	%l4
	addcc	%l0,	%g7,	%i4
	movgu	%icc,	%o3,	%g2
	fnor	%f24,	%f30,	%f0
	fnot1	%f10,	%f2
	save %o7, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o5,	%g1
	bshuffle	%f14,	%f10,	%f14
	movgu	%icc,	%g5,	%g6
	sra	%g4,	%i3,	%i7
	fmovdneg	%xcc,	%f11,	%f23
	fpsub32s	%f9,	%f14,	%f20
	fmovsvc	%icc,	%f6,	%f7
	lduh	[%l7 + 0x62],	%o4
	movn	%icc,	%i5,	%l3
	fpackfix	%f10,	%f16
	movle	%xcc,	%l2,	%o0
	movne	%xcc,	%l6,	%o6
	restore %i6, 0x1B15, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f28,	%f10,	%f10
	fmovrdlez	%g3,	%f2,	%f30
	edge16	%i2,	%i1,	%o1
	smulcc	%l4,	0x1216,	%o2
	udiv	%l0,	0x07C9,	%i4
	subc	%g7,	%o3,	%o7
	edge16ln	%l5,	%g2,	%o5
	movleu	%xcc,	%l1,	%g5
	movcc	%xcc,	%g6,	%g4
	smul	%i3,	%g1,	%o4
	movrgez	%i5,	0x318,	%l3
	orncc	%i7,	0x1A87,	%l2
	fmovda	%icc,	%f24,	%f9
	movcc	%icc,	%l6,	%o6
	addc	%o0,	%i6,	%g3
	stb	%i2,	[%l7 + 0x3B]
	move	%icc,	%i1,	%i0
	popc	%l4,	%o1
	fnors	%f22,	%f24,	%f24
	orn	%l0,	0x19F1,	%o2
	alignaddrl	%i4,	%o3,	%g7
	array32	%o7,	%l5,	%o5
	sdivcc	%g2,	0x1E9C,	%g5
	sllx	%l1,	0x19,	%g4
	fxor	%f22,	%f28,	%f10
	and	%g6,	0x15DD,	%i3
	orn	%o4,	%i5,	%g1
	edge16	%i7,	%l3,	%l2
	popc	0x1EA2,	%l6
	edge8ln	%o6,	%i6,	%g3
	xnorcc	%o0,	0x0644,	%i1
	fands	%f17,	%f18,	%f16
	fornot2	%f18,	%f22,	%f0
	std	%f16,	[%l7 + 0x48]
	movcc	%icc,	%i0,	%i2
	fmovd	%f22,	%f26
	addcc	%o1,	%l0,	%l4
	std	%f6,	[%l7 + 0x70]
	movvs	%xcc,	%i4,	%o3
	subccc	%o2,	0x1D59,	%g7
	subc	%l5,	0x09AC,	%o5
	smul	%o7,	0x1B65,	%g5
	nop
	set	0x70, %o5
	ldx	[%l7 + %o5],	%l1
	fmovrdlz	%g4,	%f8,	%f18
	udivcc	%g6,	0x1570,	%i3
	alignaddr	%o4,	%i5,	%g2
	fpsub16s	%f18,	%f21,	%f29
	fmovdl	%xcc,	%f4,	%f25
	ldx	[%l7 + 0x30],	%g1
	fmovspos	%icc,	%f7,	%f6
	addcc	%l3,	%l2,	%i7
	orcc	%l6,	0x1F92,	%o6
	edge32l	%i6,	%g3,	%i1
	fpadd16s	%f29,	%f3,	%f19
	fzero	%f2
	fnand	%f2,	%f26,	%f26
	edge8ln	%o0,	%i2,	%o1
	movrlez	%i0,	0x08F,	%l0
	ldsh	[%l7 + 0x16],	%l4
	fmovdn	%xcc,	%f18,	%f6
	fcmpes	%fcc2,	%f15,	%f14
	movrlez	%o3,	%o2,	%i4
	ldx	[%l7 + 0x28],	%l5
	ldsb	[%l7 + 0x4E],	%o5
	stx	%o7,	[%l7 + 0x60]
	for	%f22,	%f12,	%f24
	fmovs	%f15,	%f23
	stx	%g5,	[%l7 + 0x60]
	alignaddr	%g7,	%g4,	%l1
	nop
	set	0x54, %g3
	lduh	[%l7 + %g3],	%i3
	fand	%f2,	%f18,	%f30
	nop
	set	0x58, %o0
	ldx	[%l7 + %o0],	%g6
	smul	%o4,	0x140D,	%i5
	movrgez	%g1,	0x1DC,	%g2
	array32	%l3,	%i7,	%l2
	fmovrslez	%o6,	%f3,	%f3
	array16	%l6,	%g3,	%i1
	array8	%o0,	%i6,	%o1
	fmovsvc	%xcc,	%f13,	%f21
	subc	%i2,	0x14BE,	%i0
	sra	%l0,	%l4,	%o2
	fmovsneg	%icc,	%f15,	%f10
	ldd	[%l7 + 0x70],	%f0
	fmovrsgez	%i4,	%f17,	%f30
	alignaddrl	%o3,	%l5,	%o5
	movre	%o7,	%g7,	%g5
	movneg	%xcc,	%g4,	%l1
	fmovdgu	%icc,	%f28,	%f17
	fmovsa	%xcc,	%f4,	%f5
	edge8	%i3,	%o4,	%i5
	udiv	%g1,	0x01FC,	%g6
	fnegd	%f4,	%f10
	st	%f6,	[%l7 + 0x48]
	nop
	set	0x5E, %g6
	ldub	[%l7 + %g6],	%g2
	addcc	%i7,	0x012E,	%l2
	smulcc	%l3,	0x0CCA,	%l6
	movcc	%xcc,	%g3,	%o6
	edge16ln	%o0,	%i6,	%i1
	movl	%xcc,	%o1,	%i2
	fmovdge	%xcc,	%f8,	%f7
	subcc	%i0,	0x024C,	%l4
	fmovspos	%xcc,	%f28,	%f28
	alignaddr	%o2,	%i4,	%l0
	or	%l5,	%o5,	%o3
	addc	%o7,	0x0158,	%g7
	movneg	%xcc,	%g5,	%g4
	movpos	%icc,	%i3,	%l1
	edge32ln	%o4,	%i5,	%g6
	umulcc	%g2,	%g1,	%i7
	sub	%l3,	0x0C9D,	%l6
	andncc	%g3,	%l2,	%o6
	edge32ln	%i6,	%o0,	%o1
	sir	0x171F
	lduh	[%l7 + 0x2E],	%i1
	andn	%i2,	0x1718,	%l4
	and	%i0,	0x0AF0,	%i4
	stx	%l0,	[%l7 + 0x28]
	movre	%l5,	%o2,	%o3
	fmul8ulx16	%f0,	%f24,	%f20
	fmovdpos	%icc,	%f14,	%f14
	ldsw	[%l7 + 0x2C],	%o7
	lduh	[%l7 + 0x52],	%o5
	fnegs	%f25,	%f21
	srl	%g5,	0x1B,	%g4
	fsrc1	%f30,	%f4
	movg	%xcc,	%g7,	%i3
	movle	%icc,	%l1,	%i5
	subc	%o4,	%g6,	%g2
	edge8ln	%g1,	%l3,	%l6
	array16	%g3,	%i7,	%o6
	fornot2	%f6,	%f16,	%f30
	andncc	%i6,	%l2,	%o1
	movleu	%icc,	%i1,	%o0
	edge16ln	%i2,	%i0,	%i4
	lduh	[%l7 + 0x4A],	%l0
	fcmpeq16	%f18,	%f4,	%l4
	fmovse	%icc,	%f1,	%f19
	movg	%icc,	%l5,	%o2
	movleu	%icc,	%o3,	%o5
	stb	%g5,	[%l7 + 0x22]
	mova	%xcc,	%g4,	%g7
	fmovdcc	%xcc,	%f18,	%f24
	fxor	%f22,	%f16,	%f18
	fxor	%f28,	%f14,	%f0
	subccc	%i3,	0x07DC,	%o7
	sdiv	%i5,	0x0F5C,	%o4
	move	%icc,	%g6,	%l1
	fzeros	%f8
	movne	%xcc,	%g2,	%l3
	movne	%xcc,	%g1,	%l6
	popc	%g3,	%i7
	fmovsne	%icc,	%f14,	%f12
	sethi	0x023B,	%i6
	ldx	[%l7 + 0x70],	%o6
	ldsh	[%l7 + 0x0E],	%o1
	movg	%xcc,	%i1,	%o0
	fmovsleu	%xcc,	%f30,	%f24
	movpos	%xcc,	%l2,	%i2
	ldx	[%l7 + 0x10],	%i0
	srl	%i4,	0x1B,	%l4
	stb	%l0,	[%l7 + 0x49]
	movcc	%xcc,	%o2,	%o3
	stx	%l5,	[%l7 + 0x08]
	fsrc2	%f12,	%f0
	mulscc	%g5,	0x11BF,	%o5
	udivcc	%g7,	0x07EB,	%g4
	edge16ln	%i3,	%o7,	%o4
	umulcc	%g6,	0x1FFC,	%l1
	edge32ln	%g2,	%l3,	%g1
	st	%f6,	[%l7 + 0x30]
	alignaddrl	%l6,	%g3,	%i5
	move	%icc,	%i6,	%o6
	lduw	[%l7 + 0x4C],	%o1
	movgu	%xcc,	%i7,	%o0
	sra	%i1,	%i2,	%l2
	edge32	%i0,	%i4,	%l4
	ldub	[%l7 + 0x26],	%o2
	xnorcc	%o3,	%l0,	%l5
	nop
	set	0x28, %i0
	sth	%o5,	[%l7 + %i0]
	movrgz	%g5,	0x31D,	%g7
	umul	%g4,	%o7,	%o4
	addcc	%g6,	0x03B5,	%i3
	sra	%g2,	%l3,	%g1
	fmovrdlz	%l1,	%f2,	%f18
	sethi	0x0E9E,	%g3
	fandnot2	%f22,	%f16,	%f26
	ldsw	[%l7 + 0x70],	%l6
	movcc	%xcc,	%i5,	%i6
	edge16	%o6,	%o1,	%i7
	movvc	%icc,	%i1,	%o0
	fone	%f12
	sll	%i2,	0x1C,	%l2
	movvc	%icc,	%i0,	%l4
	fcmpne32	%f12,	%f22,	%o2
	array16	%o3,	%i4,	%l5
	array16	%l0,	%g5,	%g7
	movrlez	%g4,	0x369,	%o5
	srax	%o4,	0x16,	%g6
	andn	%o7,	0x1B5F,	%g2
	movvc	%xcc,	%i3,	%g1
	orn	%l1,	%l3,	%g3
	fmovrdne	%l6,	%f24,	%f22
	sth	%i5,	[%l7 + 0x64]
	movvc	%icc,	%o6,	%i6
	ldd	[%l7 + 0x10],	%f4
	sir	0x1E1D
	sdiv	%o1,	0x1AFE,	%i1
	movn	%xcc,	%i7,	%i2
	array8	%l2,	%o0,	%l4
	sllx	%i0,	%o2,	%i4
	xor	%l5,	0x01B4,	%o3
	fnegd	%f20,	%f8
	mulscc	%l0,	%g7,	%g5
	mulscc	%g4,	%o5,	%g6
	edge16n	%o7,	%g2,	%i3
	fpack16	%f28,	%f20
	fmovrslez	%g1,	%f13,	%f5
	fpsub32s	%f13,	%f24,	%f23
	alignaddr	%o4,	%l1,	%l3
	edge16n	%l6,	%g3,	%i5
	subc	%o6,	0x14AD,	%o1
	subc	%i6,	%i1,	%i7
	addccc	%l2,	%i2,	%l4
	array16	%o0,	%o2,	%i4
	movrne	%i0,	%o3,	%l0
	subccc	%l5,	0x1833,	%g7
	fxnor	%f16,	%f4,	%f10
	xnor	%g4,	%o5,	%g6
	stx	%g5,	[%l7 + 0x38]
	udivx	%g2,	0x0E43,	%o7
	udiv	%g1,	0x0757,	%i3
	st	%f0,	[%l7 + 0x34]
	subc	%l1,	%o4,	%l3
	mulx	%l6,	0x0953,	%i5
	edge16ln	%o6,	%o1,	%i6
	alignaddr	%i1,	%g3,	%l2
	edge16ln	%i2,	%l4,	%o0
	ldsb	[%l7 + 0x60],	%i7
	fexpand	%f0,	%f26
	movpos	%xcc,	%o2,	%i4
	sethi	0x1563,	%i0
	fnegd	%f16,	%f16
	nop
	set	0x54, %g7
	lduh	[%l7 + %g7],	%o3
	edge16	%l0,	%l5,	%g7
	fcmpgt16	%f2,	%f20,	%g4
	movvs	%xcc,	%g6,	%g5
	fandnot1s	%f11,	%f1,	%f8
	fmul8x16	%f24,	%f20,	%f8
	edge8	%g2,	%o7,	%g1
	popc	0x04E9,	%i3
	fcmpd	%fcc0,	%f26,	%f14
	edge8ln	%l1,	%o5,	%o4
	addc	%l6,	%i5,	%o6
	fmovdg	%icc,	%f16,	%f26
	edge16n	%o1,	%l3,	%i6
	ldd	[%l7 + 0x08],	%i0
	popc	0x0184,	%l2
	addc	%i2,	0x0CAA,	%g3
	umulcc	%o0,	%i7,	%o2
	add	%l4,	0x00FC,	%i0
	fnands	%f28,	%f2,	%f27
	ld	[%l7 + 0x48],	%f0
	st	%f31,	[%l7 + 0x0C]
	fcmpeq32	%f2,	%f18,	%i4
	edge16	%l0,	%o3,	%g7
	stw	%l5,	[%l7 + 0x20]
	addccc	%g6,	0x0DF4,	%g4
	alignaddrl	%g2,	%g5,	%g1
	edge32	%o7,	%i3,	%l1
	fmovrslz	%o4,	%f30,	%f31
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	fandnot2	%f14,	%f24,	%f8
	ldd	[%l7 + 0x18],	%o4
	sdiv	%o1,	0x1010,	%l3
	edge16ln	%o6,	%i6,	%l2
	subc	%i2,	0x06D3,	%i1
	std	%f16,	[%l7 + 0x08]
	addcc	%o0,	%g3,	%i7
	mulscc	%l4,	%i0,	%o2
	subc	%i4,	0x1047,	%o3
	ldsh	[%l7 + 0x08],	%g7
	ldd	[%l7 + 0x58],	%l4
	movg	%xcc,	%l0,	%g6
	fnot1s	%f14,	%f21
	array8	%g4,	%g5,	%g2
	movleu	%icc,	%o7,	%i3
	movcc	%icc,	%l1,	%g1
	andn	%o4,	%i5,	%o5
	fmovsl	%xcc,	%f15,	%f5
	edge8	%o1,	%l6,	%o6
	xor	%l3,	%i6,	%i2
	fmovscc	%icc,	%f21,	%f15
	sdivx	%i1,	0x139A,	%o0
	xnorcc	%g3,	0x0D8E,	%l2
	save %i7, %l4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i4,	0x36D,	%o3
	fcmpd	%fcc3,	%f14,	%f4
	addccc	%o2,	%g7,	%l0
	fnors	%f22,	%f7,	%f11
	alignaddrl	%g6,	%l5,	%g5
	sdivx	%g4,	0x1447,	%o7
	edge16ln	%g2,	%i3,	%l1
	and	%g1,	%i5,	%o4
	fmovrde	%o1,	%f18,	%f26
	ldsb	[%l7 + 0x0A],	%o5
	edge32l	%l6,	%o6,	%i6
	sdivcc	%l3,	0x1F1B,	%i2
	restore %i1, %o0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x40],	%f10
	umulcc	%i7,	0x019B,	%l4
	movcc	%xcc,	%i0,	%g3
	edge32n	%o3,	%o2,	%g7
	alignaddr	%i4,	%l0,	%g6
	xnor	%g5,	%g4,	%o7
	fpadd16s	%f6,	%f7,	%f21
	fors	%f6,	%f17,	%f2
	movcc	%icc,	%g2,	%l5
	movpos	%xcc,	%i3,	%l1
	siam	0x3
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	edge32	%o1,	%o5,	%l6
	nop
	set	0x35, %i1
	stb	%o6,	[%l7 + %i1]
	orcc	%i6,	0x18D7,	%l3
	edge32l	%o4,	%i2,	%i1
	stx	%o0,	[%l7 + 0x58]
	sra	%i7,	%l2,	%l4
	and	%i0,	0x0C64,	%g3
	sub	%o3,	%g7,	%o2
	movvc	%xcc,	%i4,	%g6
	edge8ln	%l0,	%g4,	%o7
	fmovdvc	%icc,	%f7,	%f10
	ldd	[%l7 + 0x68],	%f20
	sub	%g5,	%g2,	%i3
	stb	%l1,	[%l7 + 0x50]
	xnor	%l5,	%g1,	%i5
	fsrc1	%f26,	%f16
	movrgez	%o5,	0x36D,	%o1
	fmovsneg	%xcc,	%f23,	%f14
	movgu	%icc,	%o6,	%i6
	addc	%l6,	%l3,	%i2
	stb	%i1,	[%l7 + 0x0C]
	or	%o0,	0x0291,	%i7
	movrne	%o4,	0x1C9,	%l2
	save %i0, 0x0951, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g3,	%g7,	%o2
	sra	%i4,	%g6,	%o3
	array32	%l0,	%o7,	%g4
	fnot1	%f28,	%f8
	fand	%f10,	%f30,	%f10
	lduh	[%l7 + 0x66],	%g2
	fone	%f12
	movcc	%icc,	%i3,	%g5
	save %l1, %g1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l5,	%o5,	%o1
	fornot1	%f2,	%f6,	%f4
	fmovrdne	%i6,	%f2,	%f22
	fabss	%f3,	%f17
	edge32n	%o6,	%l3,	%l6
	smulcc	%i1,	0x12B1,	%o0
	fandnot2s	%f23,	%f10,	%f11
	stw	%i2,	[%l7 + 0x5C]
	edge8l	%o4,	%i7,	%i0
	lduh	[%l7 + 0x22],	%l4
	fandnot2s	%f6,	%f0,	%f1
	movneg	%icc,	%l2,	%g3
	umul	%o2,	%i4,	%g7
	ldsw	[%l7 + 0x6C],	%g6
	fnegs	%f2,	%f2
	edge8	%o3,	%l0,	%g4
	movvs	%icc,	%g2,	%o7
	edge32n	%i3,	%l1,	%g1
	sub	%g5,	%i5,	%o5
	andcc	%o1,	%i6,	%l5
	movrgz	%o6,	%l3,	%i1
	movl	%xcc,	%o0,	%l6
	fandnot1s	%f4,	%f24,	%f28
	fcmple16	%f2,	%f16,	%i2
	addcc	%o4,	0x1BD4,	%i0
	ldsb	[%l7 + 0x5F],	%l4
	orn	%l2,	%i7,	%o2
	edge8l	%i4,	%g3,	%g6
	save %g7, %o3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%g4,	[%l7 + 0x5E]
	smul	%g2,	%i3,	%o7
	fmovde	%xcc,	%f26,	%f26
	fmovdleu	%icc,	%f19,	%f10
	movre	%g1,	0x118,	%l1
	fmul8x16	%f5,	%f0,	%f2
	edge32n	%g5,	%o5,	%i5
	fmovdvc	%xcc,	%f26,	%f27
	movne	%xcc,	%o1,	%l5
	sth	%i6,	[%l7 + 0x16]
	sdivx	%l3,	0x1DE4,	%i1
	edge16	%o6,	%l6,	%o0
	fnot2	%f22,	%f14
	umul	%o4,	0x0759,	%i2
	sllx	%i0,	0x01,	%l4
	movge	%xcc,	%l2,	%o2
	srlx	%i7,	%g3,	%i4
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%g7
	edge32	%o3,	%g6,	%l0
	xorcc	%g2,	%i3,	%g4
	edge16n	%g1,	%o7,	%l1
	ldsh	[%l7 + 0x3C],	%o5
	udivcc	%g5,	0x1F0F,	%o1
	sdiv	%l5,	0x12F1,	%i5
	fnors	%f5,	%f23,	%f16
	orn	%l3,	%i1,	%i6
	orn	%l6,	%o6,	%o4
	edge8ln	%i2,	%i0,	%l4
	orn	%o0,	0x1D4F,	%o2
	fors	%f6,	%f27,	%f8
	fmovdleu	%xcc,	%f5,	%f22
	smul	%l2,	%g3,	%i7
	array8	%i4,	%g7,	%g6
	subc	%o3,	0x13B7,	%l0
	stb	%g2,	[%l7 + 0x4A]
	fxors	%f6,	%f8,	%f27
	nop
	set	0x40, %o2
	lduw	[%l7 + %o2],	%i3
	edge8l	%g1,	%o7,	%l1
	sir	0x1D92
	udivx	%g4,	0x1C08,	%o5
	ldsh	[%l7 + 0x34],	%o1
	movrne	%l5,	%g5,	%i5
	and	%i1,	%l3,	%i6
	nop
	set	0x58, %l4
	lduw	[%l7 + %l4],	%l6
	lduh	[%l7 + 0x62],	%o6
	andn	%i2,	0x1280,	%o4
	nop
	set	0x26, %o3
	lduh	[%l7 + %o3],	%l4
	nop
	set	0x50, %l6
	ldub	[%l7 + %l6],	%o0
	fmovsleu	%xcc,	%f0,	%f16
	fmovsa	%icc,	%f1,	%f25
	stb	%i0,	[%l7 + 0x3A]
	sub	%o2,	0x0D0D,	%g3
	sdivx	%i7,	0x17DA,	%l2
	movle	%xcc,	%i4,	%g6
	fmovrdgez	%g7,	%f26,	%f12
	edge8l	%o3,	%l0,	%g2
	srl	%g1,	%i3,	%o7
	lduw	[%l7 + 0x4C],	%l1
	edge16ln	%g4,	%o5,	%o1
	fmovdg	%icc,	%f21,	%f7
	fmovrdne	%g5,	%f18,	%f22
	sub	%l5,	0x00FF,	%i1
	edge16ln	%l3,	%i6,	%i5
	fandnot2s	%f11,	%f16,	%f31
	addccc	%o6,	0x186F,	%i2
	edge8n	%l6,	%l4,	%o0
	stx	%o4,	[%l7 + 0x10]
	popc	0x074D,	%o2
	alignaddr	%g3,	%i0,	%l2
	srl	%i7,	%g6,	%g7
	ldub	[%l7 + 0x0C],	%i4
	xorcc	%l0,	0x0759,	%o3
	fmovsge	%xcc,	%f18,	%f8
	nop
	set	0x76, %l1
	stb	%g1,	[%l7 + %l1]
	fmovsa	%xcc,	%f8,	%f22
	sdivx	%i3,	0x16B0,	%g2
	movge	%icc,	%l1,	%o7
	fnot1	%f28,	%f28
	ldsw	[%l7 + 0x70],	%o5
	movrgez	%g4,	%g5,	%l5
	movrgez	%i1,	%o1,	%i6
	edge32n	%l3,	%o6,	%i2
	sethi	0x06A7,	%i5
	movg	%icc,	%l4,	%l6
	edge8ln	%o4,	%o0,	%g3
	ldx	[%l7 + 0x58],	%o2
	ldsw	[%l7 + 0x1C],	%i0
	array8	%i7,	%g6,	%l2
	nop
	set	0x08, %l5
	ldd	[%l7 + %l5],	%g6
	subc	%i4,	%l0,	%o3
	movrlz	%g1,	%i3,	%l1
	edge16n	%o7,	%g2,	%o5
	sir	0x0899
	orcc	%g5,	0x0EED,	%l5
	umul	%i1,	0x1F3C,	%g4
	sdiv	%o1,	0x0495,	%i6
	subc	%l3,	%o6,	%i5
	sllx	%i2,	0x1A,	%l6
	ldd	[%l7 + 0x48],	%f22
	subccc	%l4,	%o4,	%o0
	ldub	[%l7 + 0x08],	%o2
	or	%i0,	%g3,	%g6
	addc	%l2,	0x17BF,	%g7
	fornot2s	%f14,	%f10,	%f0
	array32	%i4,	%l0,	%i7
	sdiv	%g1,	0x0461,	%o3
	sethi	0x1A4A,	%l1
	edge16l	%i3,	%g2,	%o5
	mova	%xcc,	%g5,	%l5
	fmul8x16au	%f3,	%f0,	%f28
	lduh	[%l7 + 0x16],	%i1
	addccc	%o7,	%g4,	%o1
	lduh	[%l7 + 0x70],	%i6
	move	%xcc,	%o6,	%l3
	movcc	%xcc,	%i5,	%i2
	sethi	0x01DF,	%l4
	fmul8x16	%f15,	%f26,	%f8
	std	%f12,	[%l7 + 0x10]
	movrlz	%l6,	0x1B4,	%o0
	edge8	%o4,	%i0,	%o2
	fpsub32s	%f25,	%f25,	%f16
	movge	%xcc,	%g3,	%l2
	subcc	%g7,	%g6,	%i4
	sdivcc	%l0,	0x051B,	%i7
	movrlz	%g1,	0x12E,	%l1
	fandnot2	%f24,	%f14,	%f28
	edge8n	%i3,	%g2,	%o3
	fmovsleu	%icc,	%f20,	%f28
	edge32n	%o5,	%l5,	%g5
	edge32ln	%i1,	%g4,	%o7
	subcc	%i6,	%o1,	%o6
	st	%f13,	[%l7 + 0x3C]
	xor	%l3,	%i5,	%i2
	alignaddr	%l4,	%o0,	%l6
	fpsub16s	%f21,	%f17,	%f11
	mulx	%o4,	%i0,	%g3
	movrlez	%o2,	%l2,	%g6
	sdivcc	%i4,	0x17A7,	%g7
	movn	%icc,	%i7,	%g1
	lduw	[%l7 + 0x64],	%l0
	fnegs	%f31,	%f7
	ldsw	[%l7 + 0x1C],	%l1
	ldub	[%l7 + 0x4F],	%i3
	andn	%o3,	0x0FEF,	%g2
	sra	%o5,	%l5,	%i1
	orncc	%g4,	0x1E52,	%g5
	fornot2s	%f19,	%f10,	%f21
	xor	%i6,	0x0B6D,	%o1
	xorcc	%o7,	%l3,	%i5
	fmovrdgez	%o6,	%f12,	%f18
	ld	[%l7 + 0x58],	%f25
	orcc	%i2,	%l4,	%l6
	udivcc	%o4,	0x0C58,	%i0
	udivx	%g3,	0x08C8,	%o0
	edge16	%o2,	%l2,	%i4
	edge32l	%g7,	%i7,	%g1
	popc	0x1C07,	%l0
	ldd	[%l7 + 0x38],	%g6
	fmovdpos	%xcc,	%f23,	%f23
	nop
	set	0x50, %o1
	ldx	[%l7 + %o1],	%l1
	addcc	%o3,	%i3,	%g2
	fcmple32	%f30,	%f8,	%o5
	movl	%xcc,	%i1,	%l5
	fcmpeq32	%f6,	%f14,	%g5
	andn	%i6,	0x1657,	%o1
	movrlz	%g4,	0x084,	%l3
	popc	0x06CE,	%i5
	sdivx	%o7,	0x17ED,	%i2
	st	%f28,	[%l7 + 0x68]
	sth	%o6,	[%l7 + 0x74]
	fmovrdlez	%l4,	%f2,	%f30
	movrgez	%l6,	0x105,	%i0
	edge8	%o4,	%o0,	%g3
	fcmpeq32	%f26,	%f12,	%l2
	fmovdgu	%xcc,	%f13,	%f22
	movle	%xcc,	%i4,	%o2
	srax	%g7,	%g1,	%l0
	movne	%icc,	%i7,	%g6
	fmul8x16au	%f9,	%f21,	%f22
	st	%f9,	[%l7 + 0x68]
	movvs	%xcc,	%l1,	%o3
	addc	%g2,	0x1D77,	%o5
	ldd	[%l7 + 0x68],	%i2
	movrgz	%l5,	%g5,	%i1
	edge32	%i6,	%g4,	%o1
	fones	%f9
	ldsb	[%l7 + 0x7A],	%l3
	fxors	%f17,	%f16,	%f31
	sdivx	%o7,	0x1E25,	%i5
	movrlez	%i2,	%o6,	%l4
	sllx	%l6,	%o4,	%i0
	fand	%f24,	%f0,	%f18
	stx	%o0,	[%l7 + 0x78]
	orcc	%l2,	0x1013,	%i4
	smul	%g3,	%g7,	%o2
	mulscc	%g1,	0x0413,	%l0
	udivx	%i7,	0x168A,	%g6
	fornot1s	%f12,	%f13,	%f3
	nop
	set	0x48, %i6
	ldsb	[%l7 + %i6],	%l1
	fpsub32	%f4,	%f0,	%f12
	edge32n	%o3,	%o5,	%g2
	edge32n	%i3,	%g5,	%i1
	movgu	%xcc,	%l5,	%i6
	edge8	%g4,	%l3,	%o1
	sdiv	%o7,	0x1FA1,	%i5
	fmovdleu	%xcc,	%f4,	%f27
	fpsub16s	%f0,	%f22,	%f28
	movle	%xcc,	%i2,	%o6
	fpadd32	%f24,	%f0,	%f8
	udivx	%l6,	0x0076,	%o4
	addcc	%i0,	0x14CF,	%l4
	fmovdgu	%icc,	%f9,	%f30
	ldx	[%l7 + 0x58],	%l2
	fmovsa	%icc,	%f18,	%f26
	fmovrse	%o0,	%f9,	%f4
	sll	%g3,	0x09,	%g7
	stw	%o2,	[%l7 + 0x1C]
	fmovde	%icc,	%f14,	%f8
	move	%icc,	%i4,	%l0
	or	%i7,	0x13D8,	%g1
	sth	%l1,	[%l7 + 0x20]
	fexpand	%f20,	%f30
	move	%icc,	%g6,	%o3
	subccc	%o5,	%g2,	%g5
	fmovdcs	%icc,	%f25,	%f14
	sra	%i3,	%i1,	%l5
	sub	%i6,	0x0A77,	%l3
	sdivcc	%o1,	0x16FE,	%g4
	sra	%o7,	%i2,	%o6
	edge8	%i5,	%o4,	%i0
	fmul8x16al	%f29,	%f9,	%f26
	fcmple32	%f30,	%f28,	%l6
	fpack32	%f28,	%f16,	%f8
	fpack16	%f22,	%f9
	umulcc	%l2,	0x1F02,	%o0
	ldsw	[%l7 + 0x3C],	%g3
	edge8n	%l4,	%g7,	%o2
	sethi	0x0397,	%i4
	popc	0x1A11,	%l0
	movrgz	%g1,	0x09C,	%l1
	mulx	%i7,	0x130A,	%o3
	fmovspos	%icc,	%f27,	%f28
	srax	%g6,	0x01,	%o5
	andn	%g2,	%i3,	%g5
	umulcc	%l5,	%i6,	%l3
	movleu	%xcc,	%i1,	%o1
	fmovsl	%xcc,	%f2,	%f18
	fmovsl	%icc,	%f7,	%f25
	addc	%g4,	%o7,	%i2
	movvc	%xcc,	%o6,	%i5
	fsrc1	%f16,	%f26
	fmovrdgz	%o4,	%f28,	%f8
	add	%l6,	%i0,	%o0
	ldsh	[%l7 + 0x74],	%l2
	nop
	set	0x78, %l3
	lduw	[%l7 + %l3],	%g3
	edge8n	%l4,	%o2,	%i4
	fxnors	%f19,	%f21,	%f26
	mulscc	%g7,	%l0,	%g1
	nop
	set	0x20, %g1
	stx	%l1,	[%l7 + %g1]
	movg	%xcc,	%i7,	%o3
	sdivcc	%g6,	0x092F,	%o5
	fcmpeq16	%f12,	%f12,	%g2
	ld	[%l7 + 0x18],	%f8
	srlx	%g5,	%l5,	%i6
	fmovrsgz	%l3,	%f12,	%f22
	mulscc	%i3,	%i1,	%o1
	fmovrse	%g4,	%f25,	%f5
	movcs	%xcc,	%i2,	%o6
	sdivcc	%i5,	0x0F95,	%o7
	andn	%o4,	0x1611,	%l6
	sethi	0x1CE6,	%o0
	umul	%i0,	0x1779,	%g3
	movne	%xcc,	%l4,	%l2
	fpsub32s	%f22,	%f3,	%f17
	fmovdgu	%icc,	%f31,	%f28
	nop
	set	0x28, %i4
	ldd	[%l7 + %i4],	%f0
	fxnors	%f7,	%f2,	%f27
	ld	[%l7 + 0x28],	%f13
	move	%icc,	%o2,	%g7
	edge32l	%i4,	%l0,	%g1
	edge16ln	%l1,	%o3,	%g6
	umulcc	%i7,	%o5,	%g2
	stb	%g5,	[%l7 + 0x68]
	edge32n	%i6,	%l3,	%i3
	stw	%i1,	[%l7 + 0x4C]
	addcc	%o1,	0x0F08,	%g4
	srax	%l5,	%i2,	%i5
	alignaddr	%o7,	%o4,	%o6
	fcmpeq32	%f22,	%f2,	%l6
	array8	%i0,	%g3,	%o0
	stx	%l4,	[%l7 + 0x50]
	movpos	%icc,	%o2,	%g7
	fornot2	%f28,	%f20,	%f6
	orncc	%l2,	%i4,	%g1
	edge16	%l0,	%l1,	%o3
	fmovdleu	%icc,	%f0,	%f20
	udivx	%i7,	0x1B91,	%g6
	fmovsl	%xcc,	%f25,	%f12
	orncc	%o5,	0x08E9,	%g2
	array32	%g5,	%i6,	%l3
	movvs	%xcc,	%i3,	%i1
	ldub	[%l7 + 0x3B],	%o1
	fpackfix	%f2,	%f16
	fpackfix	%f18,	%f11
	ldd	[%l7 + 0x38],	%f16
	fnot1s	%f27,	%f17
	smul	%g4,	%i2,	%l5
	fmovsgu	%xcc,	%f26,	%f10
	fands	%f24,	%f15,	%f25
	srax	%i5,	0x17,	%o7
	array32	%o4,	%l6,	%i0
	xorcc	%g3,	%o6,	%l4
	movvs	%xcc,	%o0,	%g7
	array16	%o2,	%i4,	%l2
	movn	%icc,	%l0,	%g1
	edge32	%l1,	%o3,	%g6
	movpos	%xcc,	%o5,	%i7
	movleu	%xcc,	%g2,	%i6
	umul	%l3,	%i3,	%i1
	alignaddrl	%g5,	%g4,	%i2
	lduw	[%l7 + 0x44],	%o1
	addccc	%i5,	0x09AD,	%l5
	movl	%icc,	%o7,	%l6
	edge32ln	%o4,	%g3,	%i0
	andcc	%o6,	%o0,	%g7
	movvs	%icc,	%l4,	%o2
	lduw	[%l7 + 0x5C],	%l2
	edge8	%i4,	%l0,	%g1
	fmovsn	%icc,	%f19,	%f18
	pdist	%f22,	%f6,	%f14
	edge32l	%o3,	%g6,	%o5
	edge8n	%l1,	%g2,	%i7
	udivcc	%l3,	0x1608,	%i6
	movneg	%icc,	%i3,	%i1
	fcmpeq16	%f26,	%f8,	%g5
	edge32n	%g4,	%o1,	%i2
	edge32n	%l5,	%i5,	%o7
	fnegs	%f19,	%f18
	sll	%o4,	0x06,	%g3
	movrne	%l6,	%i0,	%o6
	fabss	%f29,	%f6
	sethi	0x0ADE,	%g7
	fnot1s	%f12,	%f12
	movrgz	%l4,	0x3A0,	%o0
	alignaddrl	%l2,	%i4,	%l0
	add	%o2,	0x1BE6,	%o3
	lduw	[%l7 + 0x6C],	%g1
	andcc	%o5,	%g6,	%g2
	lduw	[%l7 + 0x58],	%i7
	fxors	%f0,	%f21,	%f11
	fornot1	%f30,	%f12,	%f18
	sir	0x1DF8
	fmovdne	%xcc,	%f7,	%f28
	or	%l1,	%i6,	%l3
	addcc	%i1,	%i3,	%g4
	nop
	set	0x3C, %g4
	stw	%g5,	[%l7 + %g4]
	move	%xcc,	%o1,	%i2
	stb	%i5,	[%l7 + 0x7C]
	st	%f7,	[%l7 + 0x7C]
	orncc	%l5,	%o4,	%g3
	orn	%l6,	%i0,	%o7
	ldsh	[%l7 + 0x7C],	%g7
	movvs	%icc,	%o6,	%o0
	lduh	[%l7 + 0x08],	%l2
	fmovdcs	%xcc,	%f4,	%f16
	stw	%l4,	[%l7 + 0x3C]
	subc	%i4,	%l0,	%o3
	popc	0x05CD,	%g1
	edge32l	%o5,	%o2,	%g2
	edge16	%i7,	%g6,	%i6
	addccc	%l1,	%l3,	%i3
	sll	%i1,	0x07,	%g4
	edge16	%o1,	%i2,	%g5
	movn	%xcc,	%l5,	%o4
	sllx	%i5,	%g3,	%l6
	ldd	[%l7 + 0x78],	%f16
	sth	%i0,	[%l7 + 0x18]
	ldsb	[%l7 + 0x45],	%o7
	add	%o6,	%o0,	%g7
	mulx	%l4,	%i4,	%l2
	edge16	%o3,	%l0,	%o5
	std	%f0,	[%l7 + 0x48]
	ldub	[%l7 + 0x45],	%o2
	fpsub16	%f8,	%f14,	%f18
	fnot1s	%f23,	%f23
	fandnot2s	%f28,	%f27,	%f0
	xorcc	%g1,	%i7,	%g2
	ldd	[%l7 + 0x18],	%g6
	mulx	%l1,	%l3,	%i6
	st	%f15,	[%l7 + 0x7C]
	movgu	%xcc,	%i1,	%g4
	udivx	%o1,	0x0E12,	%i2
	ldsb	[%l7 + 0x31],	%i3
	fmovsne	%icc,	%f26,	%f26
	sdivcc	%g5,	0x0EB5,	%o4
	ldd	[%l7 + 0x28],	%f4
	movneg	%icc,	%i5,	%g3
	orn	%l5,	0x060E,	%i0
	movvc	%xcc,	%l6,	%o7
	movrlez	%o6,	0x15E,	%o0
	movrlz	%g7,	0x2AD,	%i4
	ldd	[%l7 + 0x08],	%l4
	movvs	%icc,	%l2,	%o3
	edge32l	%l0,	%o5,	%g1
	mulx	%o2,	%g2,	%g6
	ldub	[%l7 + 0x08],	%l1
	edge32n	%l3,	%i6,	%i1
	stx	%i7,	[%l7 + 0x28]
	edge32n	%g4,	%o1,	%i3
	movl	%xcc,	%g5,	%o4
	movneg	%xcc,	%i2,	%g3
	movg	%xcc,	%l5,	%i0
	addccc	%l6,	0x1A38,	%o7
	ldsb	[%l7 + 0x21],	%i5
	mova	%xcc,	%o0,	%o6
	sdivcc	%i4,	0x0795,	%l4
	fpack32	%f10,	%f26,	%f26
	movcc	%xcc,	%g7,	%l2
	xnor	%o3,	%l0,	%o5
	fmovsneg	%icc,	%f13,	%f10
	for	%f30,	%f20,	%f8
	movvs	%icc,	%g1,	%o2
	fmovrdgez	%g6,	%f4,	%f30
	addccc	%g2,	0x0C12,	%l3
	movg	%xcc,	%i6,	%l1
	edge8ln	%i7,	%g4,	%i1
	orn	%i3,	%o1,	%g5
	udivcc	%o4,	0x1B08,	%g3
	ldsh	[%l7 + 0x5E],	%i2
	edge32	%l5,	%i0,	%o7
	fmovsgu	%icc,	%f12,	%f24
	fpsub32s	%f26,	%f14,	%f19
	fcmpgt16	%f18,	%f6,	%l6
	movrlez	%i5,	0x2AF,	%o6
	xnorcc	%i4,	0x1405,	%l4
	movrlez	%g7,	0x021,	%l2
	mulscc	%o0,	%o3,	%l0
	lduh	[%l7 + 0x30],	%o5
	andncc	%o2,	%g1,	%g6
	sll	%l3,	0x06,	%g2
	fandnot2	%f14,	%f4,	%f20
	fmovscc	%xcc,	%f15,	%f7
	fpsub16s	%f25,	%f2,	%f24
	array32	%i6,	%l1,	%i7
	umulcc	%g4,	%i1,	%i3
	fmovsl	%icc,	%f29,	%f11
	andncc	%o1,	%o4,	%g5
	fmovsge	%xcc,	%f31,	%f8
	fpackfix	%f10,	%f25
	restore %i2, %g3, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%o7,	%l6,	%i5
	mulx	%o6,	%i0,	%l4
	edge16n	%i4,	%l2,	%o0
	subc	%g7,	%o3,	%l0
	smulcc	%o5,	0x0BEC,	%g1
	ldd	[%l7 + 0x78],	%f2
	fxors	%f20,	%f20,	%f4
	movcs	%xcc,	%g6,	%o2
	sdiv	%l3,	0x16C4,	%g2
	movrlz	%i6,	%l1,	%i7
	std	%f18,	[%l7 + 0x48]
	edge16	%g4,	%i3,	%i1
	subc	%o1,	0x1190,	%g5
	stb	%i2,	[%l7 + 0x25]
	fmul8x16al	%f13,	%f5,	%f24
	fmovdvs	%xcc,	%f26,	%f22
	udiv	%g3,	0x0580,	%o4
	movcs	%xcc,	%l5,	%l6
	addcc	%i5,	0x08BC,	%o6
	movleu	%icc,	%o7,	%i0
	fmovdvc	%xcc,	%f23,	%f25
	edge16n	%i4,	%l4,	%l2
	edge16	%o0,	%g7,	%o3
	stw	%l0,	[%l7 + 0x34]
	ldub	[%l7 + 0x74],	%g1
	orcc	%g6,	%o5,	%l3
	st	%f14,	[%l7 + 0x2C]
	sllx	%o2,	%g2,	%i6
	smulcc	%i7,	%g4,	%i3
	mulx	%l1,	0x1CF3,	%i1
	add	%g5,	0x139C,	%o1
	xor	%i2,	%g3,	%l5
	array16	%o4,	%l6,	%o6
	fmovscs	%xcc,	%f10,	%f14
	addcc	%i5,	%i0,	%i4
	orncc	%l4,	%o7,	%l2
	sdivcc	%o0,	0x08E3,	%o3
	fmovsneg	%xcc,	%f29,	%f11
	fandnot2	%f22,	%f30,	%f30
	ldd	[%l7 + 0x48],	%f10
	subccc	%g7,	%g1,	%l0
	add	%o5,	0x1923,	%l3
	fmuld8ulx16	%f2,	%f2,	%f6
	std	%f18,	[%l7 + 0x60]
	movvc	%xcc,	%o2,	%g6
	srl	%g2,	%i6,	%i7
	movrne	%g4,	0x25A,	%l1
	fmovsn	%icc,	%f4,	%f6
	xor	%i1,	%i3,	%g5
	fnegs	%f14,	%f13
	xorcc	%i2,	%g3,	%l5
	sethi	0x04F7,	%o1
	movrne	%o4,	%l6,	%o6
	fpadd16s	%f25,	%f18,	%f31
	fpsub16	%f16,	%f28,	%f20
	movle	%xcc,	%i0,	%i5
	fabsd	%f22,	%f30
	smul	%i4,	0x1A46,	%o7
	edge8l	%l4,	%l2,	%o0
	st	%f9,	[%l7 + 0x68]
	orncc	%g7,	0x116C,	%o3
	orn	%l0,	%g1,	%o5
	fmovrse	%o2,	%f28,	%f5
	mulscc	%g6,	0x1F8C,	%l3
	save %g2, 0x0070, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g4,	%l1,	%i7
	movleu	%icc,	%i3,	%i1
	smulcc	%g5,	0x18DD,	%g3
	array8	%i2,	%l5,	%o1
	or	%o4,	0x140A,	%o6
	edge32	%i0,	%i5,	%l6
	sth	%o7,	[%l7 + 0x1A]
	sra	%i4,	%l2,	%o0
	or	%g7,	0x1503,	%o3
	andcc	%l4,	%l0,	%o5
	ldsb	[%l7 + 0x4E],	%o2
	array32	%g6,	%l3,	%g1
	fnand	%f26,	%f24,	%f14
	movvc	%xcc,	%g2,	%g4
	sth	%i6,	[%l7 + 0x72]
	edge32ln	%i7,	%i3,	%l1
	or	%i1,	%g3,	%i2
	fcmpgt32	%f26,	%f0,	%g5
	edge16ln	%l5,	%o1,	%o4
	movgu	%icc,	%i0,	%o6
	ldsw	[%l7 + 0x1C],	%l6
	ldsw	[%l7 + 0x5C],	%i5
	fmovscc	%xcc,	%f22,	%f8
	bshuffle	%f28,	%f10,	%f22
	popc	0x00EC,	%o7
	ldsb	[%l7 + 0x19],	%i4
	movleu	%xcc,	%l2,	%g7
	st	%f28,	[%l7 + 0x38]
	umul	%o0,	0x0B86,	%l4
	sub	%o3,	%l0,	%o2
	smul	%o5,	0x077E,	%g6
	add	%g1,	%g2,	%g4
	fpadd32s	%f8,	%f5,	%f15
	fmovrde	%i6,	%f20,	%f0
	edge16ln	%l3,	%i7,	%l1
	fmovrse	%i1,	%f17,	%f24
	movne	%icc,	%i3,	%i2
	umul	%g5,	%l5,	%o1
	sdivx	%o4,	0x082C,	%i0
	xorcc	%g3,	%l6,	%i5
	movcs	%xcc,	%o7,	%i4
	fmovdgu	%icc,	%f26,	%f7
	fmovrse	%l2,	%f27,	%f22
	movrne	%o6,	0x365,	%o0
	movrne	%l4,	0x240,	%g7
	fnegd	%f16,	%f8
	fsrc2	%f0,	%f24
	movvs	%icc,	%o3,	%l0
	subc	%o2,	%o5,	%g1
	fnands	%f13,	%f17,	%f20
	sra	%g6,	%g2,	%g4
	edge16l	%l3,	%i6,	%l1
	sdivcc	%i1,	0x1B00,	%i7
	alignaddr	%i3,	%g5,	%i2
	alignaddrl	%l5,	%o1,	%i0
	udivcc	%o4,	0x0505,	%g3
	save %l6, %i5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%o7,	%l2,	%o0
	fpackfix	%f16,	%f4
	movrgz	%o6,	%l4,	%g7
	edge32n	%l0,	%o2,	%o5
	xorcc	%o3,	0x0F83,	%g6
	movl	%icc,	%g2,	%g1
	move	%icc,	%l3,	%i6
	ldsb	[%l7 + 0x48],	%l1
	alignaddr	%g4,	%i1,	%i7
	fmul8x16al	%f28,	%f13,	%f0
	or	%i3,	%i2,	%g5
	edge8ln	%o1,	%i0,	%l5
	sdiv	%g3,	0x0C38,	%o4
	array16	%i5,	%i4,	%o7
	udivx	%l2,	0x083A,	%l6
	stx	%o6,	[%l7 + 0x30]
	fcmpne16	%f24,	%f14,	%l4
	fzeros	%f15
	movrne	%g7,	%o0,	%l0
	xor	%o2,	0x0A75,	%o5
	ldsb	[%l7 + 0x77],	%g6
	fmuld8sux16	%f9,	%f4,	%f14
	or	%o3,	%g2,	%l3
	fsrc1	%f0,	%f28
	srl	%i6,	%l1,	%g4
	fmovrdgez	%i1,	%f30,	%f14
	fxnor	%f28,	%f14,	%f6
	faligndata	%f8,	%f10,	%f6
	addccc	%i7,	%g1,	%i3
	fcmpes	%fcc2,	%f4,	%f30
	fmul8x16au	%f10,	%f23,	%f0
	fpsub32s	%f25,	%f1,	%f8
	nop
	set	0x3C, %i5
	lduh	[%l7 + %i5],	%g5
	subccc	%o1,	%i0,	%l5
	fornot1	%f0,	%f12,	%f6
	xnorcc	%g3,	%o4,	%i2
	umul	%i5,	0x10F0,	%i4
	ldsw	[%l7 + 0x70],	%o7
	udivcc	%l2,	0x0B42,	%l6
	stb	%o6,	[%l7 + 0x76]
	edge16	%g7,	%o0,	%l4
	andncc	%o2,	%l0,	%g6
	edge16n	%o5,	%o3,	%l3
	fmovse	%xcc,	%f1,	%f2
	array8	%i6,	%g2,	%l1
	movre	%g4,	%i1,	%i7
	for	%f20,	%f2,	%f18
	fmovdg	%xcc,	%f24,	%f17
	mulx	%g1,	0x0C9C,	%g5
	and	%i3,	0x1E1F,	%i0
	lduh	[%l7 + 0x5C],	%l5
	subc	%o1,	%g3,	%o4
	orncc	%i5,	0x1821,	%i4
	xor	%i2,	%l2,	%o7
	movge	%xcc,	%o6,	%g7
	movleu	%xcc,	%l6,	%l4
	edge8n	%o2,	%l0,	%o0
	andcc	%o5,	%o3,	%l3
	fmovrdlz	%g6,	%f2,	%f24
	sir	0x1F67
	nop
	set	0x6F, %i3
	ldub	[%l7 + %i3],	%i6
	xor	%g2,	%g4,	%l1
	sethi	0x07D0,	%i1
	popc	0x0B4B,	%g1
	fmovrsgz	%g5,	%f22,	%f13
	fsrc2	%f12,	%f20
	ldx	[%l7 + 0x10],	%i3
	fmovdg	%xcc,	%f19,	%f11
	fmovdvc	%icc,	%f1,	%f5
	movrgez	%i7,	0x331,	%i0
	fmul8sux16	%f0,	%f22,	%f2
	fmovdneg	%xcc,	%f28,	%f31
	sll	%l5,	%g3,	%o4
	nop
	set	0x7F, %i2
	stb	%i5,	[%l7 + %i2]
	ldub	[%l7 + 0x14],	%i4
	movrlz	%o1,	0x1EE,	%i2
	or	%o7,	%l2,	%g7
	srlx	%o6,	%l4,	%o2
	movrlz	%l6,	0x06C,	%o0
	fnot1s	%f18,	%f7
	fmovsleu	%icc,	%f3,	%f13
	fnegd	%f8,	%f26
	fmovsn	%xcc,	%f4,	%f9
	array16	%o5,	%l0,	%l3
	faligndata	%f4,	%f12,	%f20
	ldsb	[%l7 + 0x22],	%o3
	mova	%xcc,	%g6,	%i6
	movg	%icc,	%g2,	%g4
	subc	%i1,	0x1F3F,	%g1
	sethi	0x06B5,	%l1
	fmul8sux16	%f6,	%f28,	%f2
	ldsw	[%l7 + 0x7C],	%i3
	xnor	%i7,	%i0,	%l5
	udivcc	%g5,	0x1483,	%g3
	movcc	%icc,	%i5,	%o4
	edge8	%o1,	%i2,	%o7
	movleu	%icc,	%i4,	%l2
	udivcc	%o6,	0x0919,	%g7
	fmovdge	%icc,	%f9,	%f14
	fandnot1s	%f0,	%f17,	%f18
	fmovdvc	%icc,	%f0,	%f29
	alignaddr	%l4,	%l6,	%o2
	sdivcc	%o0,	0x106D,	%l0
	ldsb	[%l7 + 0x33],	%o5
	edge32	%l3,	%g6,	%o3
	mulscc	%g2,	%i6,	%g4
	sub	%g1,	0x0605,	%i1
	array16	%i3,	%i7,	%i0
	movne	%icc,	%l1,	%l5
	xnor	%g3,	%i5,	%g5
	array16	%o4,	%i2,	%o1
	movneg	%xcc,	%o7,	%l2
	ldub	[%l7 + 0x5D],	%o6
	ldsb	[%l7 + 0x35],	%i4
	fnegs	%f23,	%f3
	sth	%g7,	[%l7 + 0x64]
	fsrc1	%f22,	%f18
	movrgez	%l6,	0x2F5,	%l4
	orcc	%o0,	0x1FCB,	%o2
	orncc	%o5,	0x1B30,	%l0
	fmovdvc	%xcc,	%f29,	%f3
	movn	%xcc,	%g6,	%o3
	movvs	%xcc,	%l3,	%g2
	movleu	%xcc,	%g4,	%g1
	movrlez	%i6,	%i3,	%i7
	fnands	%f5,	%f19,	%f12
	fmovdgu	%icc,	%f19,	%f4
	sdivx	%i0,	0x0F3C,	%l1
	stw	%i1,	[%l7 + 0x1C]
	movrlz	%g3,	0x104,	%l5
	movge	%icc,	%g5,	%o4
	array16	%i2,	%o1,	%i5
	siam	0x7
	fmovsn	%xcc,	%f31,	%f26
	xnor	%o7,	0x0172,	%l2
	movvs	%icc,	%i4,	%g7
	st	%f8,	[%l7 + 0x70]
	ldsw	[%l7 + 0x3C],	%l6
	stx	%l4,	[%l7 + 0x10]
	ldd	[%l7 + 0x38],	%f16
	xnor	%o6,	0x0DF8,	%o2
	add	%o0,	%l0,	%o5
	lduh	[%l7 + 0x6C],	%o3
	movpos	%icc,	%l3,	%g6
	edge32l	%g2,	%g1,	%g4
	movne	%icc,	%i3,	%i7
	sdiv	%i0,	0x04CB,	%l1
	array16	%i6,	%i1,	%l5
	edge16l	%g3,	%o4,	%i2
	orncc	%o1,	0x06EC,	%i5
	mulscc	%g5,	0x1ED2,	%o7
	fands	%f2,	%f15,	%f14
	fcmple16	%f0,	%f28,	%l2
	fnegs	%f5,	%f9
	movn	%icc,	%i4,	%g7
	save %l6, 0x16A2, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o2,	%o0
	or	%l0,	%o6,	%o3
	edge16n	%l3,	%o5,	%g2
	fornot1s	%f0,	%f29,	%f18
	fmul8x16au	%f2,	%f29,	%f16
	ldd	[%l7 + 0x18],	%f30
	srl	%g1,	0x1E,	%g4
	udivcc	%g6,	0x0FE7,	%i3
	edge16	%i0,	%l1,	%i6
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	array16	%l5,	%g3,	%o4
	movle	%icc,	%o1,	%i2
	edge16l	%i5,	%o7,	%l2
	faligndata	%f22,	%f0,	%f16
	ldd	[%l7 + 0x68],	%f22
	addc	%i4,	%g7,	%g5
	fmovrsgz	%l4,	%f31,	%f21
	umulcc	%o2,	0x0736,	%l6
	sethi	0x1FFC,	%o0
	edge8n	%l0,	%o3,	%l3
	fmovsl	%icc,	%f23,	%f4
	fxors	%f1,	%f19,	%f25
	ld	[%l7 + 0x24],	%f10
	edge32	%o6,	%g2,	%g1
	fmovdvc	%xcc,	%f12,	%f26
	movneg	%xcc,	%g4,	%o5
	add	%g6,	0x0D12,	%i0
	fones	%f17
	stb	%i3,	[%l7 + 0x53]
	stw	%i6,	[%l7 + 0x24]
	alignaddrl	%l1,	%i7,	%l5
	movrgz	%g3,	%i1,	%o1
	mova	%icc,	%i2,	%i5
	and	%o4,	0x0E19,	%l2
	ld	[%l7 + 0x24],	%f11
	edge8l	%i4,	%o7,	%g5
	edge16l	%l4,	%g7,	%l6
	lduw	[%l7 + 0x78],	%o2
	movg	%xcc,	%o0,	%l0
	xor	%o3,	0x1E13,	%o6
	movgu	%icc,	%l3,	%g2
	edge32l	%g1,	%g4,	%o5
	fornot2s	%f4,	%f17,	%f13
	sth	%i0,	[%l7 + 0x70]
	movn	%icc,	%g6,	%i6
	fcmpgt32	%f12,	%f4,	%l1
	ldub	[%l7 + 0x60],	%i7
	ldsw	[%l7 + 0x24],	%i3
	ldsw	[%l7 + 0x48],	%l5
	ldsh	[%l7 + 0x74],	%g3
	fsrc1	%f14,	%f0
	sra	%i1,	%i2,	%i5
	orncc	%o1,	0x1D07,	%o4
	save %l2, %o7, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdge	%xcc,	%f5,	%f13
	movle	%xcc,	%g5,	%l4
	lduw	[%l7 + 0x0C],	%g7
	array8	%o2,	%o0,	%l0
	add	%l6,	0x0424,	%o3
	fcmpne16	%f24,	%f4,	%l3
	fzeros	%f27
	edge8ln	%g2,	%o6,	%g4
	xnorcc	%o5,	0x1562,	%i0
	umulcc	%g6,	0x0A37,	%g1
	subc	%l1,	%i7,	%i3
	movn	%icc,	%i6,	%g3
	movneg	%icc,	%i1,	%i2
	mulscc	%l5,	%i5,	%o4
	xor	%o1,	0x0F83,	%l2
	fmovrsgz	%o7,	%f5,	%f8
	restore %g5, 0x0AFA, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x58],	%g7
	addcc	%o2,	%l4,	%l0
	movcc	%xcc,	%o0,	%o3
	ldub	[%l7 + 0x4C],	%l3
	ldsw	[%l7 + 0x28],	%l6
	fnot2	%f26,	%f14
	movrne	%g2,	0x123,	%g4
	sth	%o6,	[%l7 + 0x36]
	mulx	%o5,	0x0BEA,	%g6
	edge32	%g1,	%i0,	%i7
	ldub	[%l7 + 0x5A],	%i3
	edge8l	%l1,	%i6,	%g3
	xorcc	%i2,	%l5,	%i1
	andncc	%o4,	%o1,	%i5
	mova	%icc,	%o7,	%l2
	smulcc	%g5,	%i4,	%o2
	movrlez	%l4,	%g7,	%l0
	movcs	%xcc,	%o3,	%l3
	movl	%icc,	%o0,	%l6
	edge8	%g4,	%g2,	%o6
	movrlez	%g6,	0x283,	%o5
	fxor	%f4,	%f2,	%f0
	edge32ln	%i0,	%g1,	%i7
	edge8	%i3,	%i6,	%g3
	edge16l	%l1,	%i2,	%l5
	orcc	%o4,	%i1,	%o1
	andn	%o7,	0x0A73,	%i5
	sub	%g5,	%i4,	%o2
	array16	%l2,	%l4,	%g7
	movge	%icc,	%l0,	%l3
	edge8n	%o0,	%o3,	%g4
	std	%f14,	[%l7 + 0x18]
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	movrlz	%g6,	0x174,	%i0
	sth	%g1,	[%l7 + 0x1A]
	movre	%o5,	%i3,	%i6
	srlx	%i7,	0x0D,	%g3
	edge8ln	%i2,	%l5,	%l1
	movge	%icc,	%o4,	%i1
	sllx	%o1,	%i5,	%o7
	fcmpes	%fcc1,	%f11,	%f20
	sra	%g5,	%o2,	%i4
	subccc	%l2,	%l4,	%l0
	xnorcc	%g7,	0x1B9F,	%o0
	mulx	%l3,	%g4,	%o3
	edge8	%g2,	%l6,	%o6
	ldub	[%l7 + 0x38],	%i0
	movcs	%xcc,	%g6,	%o5
	udivcc	%i3,	0x0C19,	%i6
	movgu	%xcc,	%i7,	%g1
	mova	%xcc,	%g3,	%l5
	edge16n	%l1,	%o4,	%i2
	andn	%i1,	0x1525,	%i5
	fmovscc	%xcc,	%f17,	%f22
	edge8l	%o7,	%o1,	%g5
	xnorcc	%i4,	0x19F2,	%l2
	add	%o2,	0x09AF,	%l4
	fmovrsgz	%l0,	%f22,	%f20
	stw	%g7,	[%l7 + 0x40]
	movne	%xcc,	%o0,	%l3
	fmovsleu	%xcc,	%f2,	%f13
	udivcc	%o3,	0x1106,	%g4
	edge16ln	%l6,	%o6,	%g2
	fmovde	%icc,	%f30,	%f3
	fxors	%f1,	%f24,	%f10
	movne	%icc,	%i0,	%g6
	move	%xcc,	%i3,	%o5
	sth	%i6,	[%l7 + 0x2C]
	subcc	%g1,	%g3,	%l5
	edge32ln	%i7,	%l1,	%o4
	srlx	%i1,	0x0F,	%i2
	popc	%i5,	%o1
	fone	%f0
	udiv	%g5,	0x0283,	%o7
	move	%xcc,	%l2,	%i4
	movle	%xcc,	%l4,	%l0
	popc	0x0EAA,	%o2
	movcs	%xcc,	%g7,	%o0
	sir	0x17EF
	orncc	%o3,	0x1AFE,	%g4
	stb	%l6,	[%l7 + 0x45]
	fmovsvs	%xcc,	%f16,	%f29
	udivx	%o6,	0x0A43,	%g2
	fornot1s	%f2,	%f0,	%f31
	mova	%xcc,	%l3,	%i0
	movvs	%icc,	%i3,	%g6
	fmuld8ulx16	%f8,	%f3,	%f26
	edge16	%o5,	%g1,	%i6
	edge8	%g3,	%l5,	%l1
	fandnot1s	%f20,	%f24,	%f19
	fpadd16	%f2,	%f10,	%f24
	udivcc	%o4,	0x1931,	%i7
	fmuld8ulx16	%f30,	%f20,	%f0
	subc	%i2,	0x1674,	%i5
	umulcc	%i1,	%o1,	%o7
	edge16ln	%l2,	%i4,	%g5
	edge8	%l4,	%o2,	%g7
	fmovrslez	%l0,	%f0,	%f9
	xorcc	%o3,	%o0,	%l6
	mulscc	%g4,	%o6,	%g2
	fnot1	%f16,	%f22
	srl	%i0,	%l3,	%i3
	ldd	[%l7 + 0x58],	%g6
	edge32l	%o5,	%g1,	%i6
	array32	%g3,	%l5,	%l1
	sir	0x01D5
	movgu	%icc,	%o4,	%i2
	movcc	%xcc,	%i7,	%i5
	ldsh	[%l7 + 0x78],	%o1
	xnorcc	%i1,	0x0049,	%l2
	andn	%i4,	%o7,	%g5
	movg	%icc,	%o2,	%l4
	popc	0x1B9B,	%g7
	move	%xcc,	%o3,	%o0
	lduw	[%l7 + 0x58],	%l6
	udivx	%g4,	0x0104,	%o6
	restore %l0, %i0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0C5F,	%i3
	movne	%icc,	%g2,	%g6
	fmovdcs	%icc,	%f16,	%f26
	movn	%xcc,	%o5,	%i6
	sir	0x036C
	fandnot2s	%f8,	%f11,	%f18
	and	%g1,	%g3,	%l1
	movn	%xcc,	%o4,	%i2
	movrlz	%i7,	0x010,	%i5
	sth	%l5,	[%l7 + 0x7C]
	sll	%o1,	%l2,	%i1
	edge32	%o7,	%g5,	%i4
	ldub	[%l7 + 0x30],	%l4
	ldub	[%l7 + 0x25],	%o2
	addc	%g7,	%o0,	%l6
	ldd	[%l7 + 0x70],	%g4
	alignaddrl	%o6,	%l0,	%i0
	ld	[%l7 + 0x14],	%f5
	movvc	%icc,	%o3,	%l3
	alignaddr	%g2,	%g6,	%i3
	edge16	%o5,	%g1,	%g3
	fnot1	%f24,	%f12
	movrne	%i6,	%l1,	%i2
	edge16l	%o4,	%i5,	%l5
	ldub	[%l7 + 0x6C],	%o1
	save %i7, %l2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o7,	0x1BE5,	%i4
	save %g5, 0x0960, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o2,	%o0
	movvc	%xcc,	%l6,	%g7
	ld	[%l7 + 0x38],	%f12
	mova	%xcc,	%o6,	%g4
	movrlez	%l0,	0x107,	%o3
	array16	%l3,	%i0,	%g2
	stb	%i3,	[%l7 + 0x5F]
	movl	%icc,	%o5,	%g1
	srlx	%g3,	0x01,	%g6
	movrgez	%l1,	0x1F5,	%i6
	addccc	%i2,	0x0462,	%o4
	fmovsge	%xcc,	%f9,	%f13
	subcc	%i5,	0x1121,	%l5
	sub	%o1,	0x032E,	%l2
	ldsb	[%l7 + 0x23],	%i1
	edge32n	%i7,	%i4,	%g5
	sethi	0x1059,	%l4
	fmovsgu	%icc,	%f11,	%f22
	orncc	%o7,	0x1E42,	%o2
	for	%f20,	%f18,	%f30
	movg	%icc,	%l6,	%g7
	movleu	%icc,	%o6,	%g4
	addcc	%o0,	%o3,	%l0
	movne	%xcc,	%l3,	%i0
	xnorcc	%g2,	%o5,	%i3
	fmovrdgz	%g1,	%f24,	%f22
	edge16ln	%g6,	%l1,	%g3
	subccc	%i6,	%o4,	%i5
	fcmpgt32	%f24,	%f14,	%l5
	stw	%o1,	[%l7 + 0x2C]
	ldsh	[%l7 + 0x7C],	%i2
	ldx	[%l7 + 0x28],	%i1
	edge8n	%l2,	%i7,	%g5
	mova	%icc,	%i4,	%l4
	save %o2, 0x0CF3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x10],	%f5
	movne	%xcc,	%o7,	%g7
	movleu	%xcc,	%o6,	%o0
	movrgez	%o3,	%l0,	%g4
	fmovsvc	%icc,	%f12,	%f22
	array32	%l3,	%g2,	%i0
	orn	%o5,	0x088E,	%i3
	movrlez	%g6,	0x1F2,	%l1
	udiv	%g3,	0x05B3,	%i6
	fmovrdlz	%o4,	%f20,	%f6
	andn	%i5,	%l5,	%o1
	sdivx	%i2,	0x0BE5,	%g1
	edge8ln	%i1,	%l2,	%i7
	andncc	%g5,	%l4,	%i4
	fmovdge	%xcc,	%f1,	%f18
	stx	%o2,	[%l7 + 0x78]
	edge8l	%l6,	%g7,	%o7
	xnor	%o0,	0x058B,	%o3
	movcs	%icc,	%o6,	%g4
	movl	%icc,	%l0,	%l3
	movvs	%xcc,	%i0,	%g2
	movne	%xcc,	%o5,	%g6
	umulcc	%i3,	0x1775,	%l1
	fpackfix	%f26,	%f8
	move	%icc,	%i6,	%g3
	fmovscs	%icc,	%f3,	%f29
	ldsb	[%l7 + 0x35],	%i5
	fnot2s	%f8,	%f11
	popc	0x0714,	%l5
	sdiv	%o4,	0x04BF,	%o1
	edge16l	%i2,	%i1,	%l2
	stb	%i7,	[%l7 + 0x34]
	sra	%g1,	0x02,	%l4
	mulx	%g5,	%i4,	%l6
	movg	%xcc,	%o2,	%g7
	edge16l	%o0,	%o3,	%o6
	fmovde	%xcc,	%f18,	%f9
	std	%f24,	[%l7 + 0x70]
	sll	%g4,	%l0,	%o7
	udiv	%i0,	0x1F16,	%l3
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	fand	%f6,	%f26,	%f20
	xor	%o5,	%i3,	%i6
	movleu	%icc,	%g3,	%i5
	alignaddr	%l1,	%o4,	%l5
	fmovse	%xcc,	%f24,	%f29
	movrgez	%o1,	0x1F4,	%i1
	ldsb	[%l7 + 0x34],	%l2
	fmovs	%f13,	%f11
	ldub	[%l7 + 0x44],	%i7
	srl	%i2,	0x0E,	%g1
	udivcc	%l4,	0x0263,	%g5
	movre	%l6,	%o2,	%g7
	smul	%i4,	0x1098,	%o0
	fpadd32s	%f29,	%f7,	%f31
	edge8ln	%o3,	%g4,	%l0
	array32	%o6,	%i0,	%o7
	stx	%g2,	[%l7 + 0x08]
	movleu	%icc,	%l3,	%g6
	fnot1	%f30,	%f22
	sub	%i3,	0x10ED,	%i6
	movvs	%xcc,	%g3,	%o5
	xorcc	%i5,	0x04DB,	%o4
	movne	%icc,	%l1,	%l5
	movpos	%xcc,	%o1,	%l2
	stb	%i7,	[%l7 + 0x3B]
	fmovse	%xcc,	%f3,	%f9
	movne	%icc,	%i1,	%g1
	movrlez	%i2,	0x107,	%g5
	alignaddr	%l6,	%o2,	%g7
	subcc	%i4,	0x0CED,	%l4
	subc	%o0,	%o3,	%g4
	ldsw	[%l7 + 0x14],	%o6
	edge8l	%i0,	%l0,	%o7
	ldsh	[%l7 + 0x4E],	%l3
	sdivx	%g6,	0x0AA6,	%g2
	fmovdvc	%xcc,	%f3,	%f14
	sub	%i6,	0x0633,	%i3
	ldx	[%l7 + 0x58],	%o5
	edge16ln	%i5,	%g3,	%o4
	st	%f27,	[%l7 + 0x48]
	edge16	%l5,	%l1,	%l2
	movn	%xcc,	%i7,	%i1
	alignaddrl	%o1,	%g1,	%g5
	fmovscs	%xcc,	%f8,	%f31
	movpos	%icc,	%i2,	%l6
	srlx	%o2,	0x1F,	%i4
	movneg	%icc,	%g7,	%o0
	fxors	%f29,	%f31,	%f29
	fpmerge	%f8,	%f7,	%f8
	movcs	%xcc,	%l4,	%g4
	smulcc	%o6,	0x1369,	%o3
	xorcc	%l0,	0x1D58,	%i0
	movleu	%icc,	%o7,	%l3
	sdivcc	%g6,	0x113C,	%g2
	andcc	%i6,	0x01A8,	%i3
	ldsh	[%l7 + 0x6C],	%i5
	subcc	%o5,	0x00CA,	%g3
	sth	%l5,	[%l7 + 0x18]
	xnorcc	%l1,	%o4,	%i7
	sll	%i1,	%o1,	%l2
	restore %g1, 0x0524, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l6,	%i2,	%i4
	mova	%xcc,	%g7,	%o0
	xnorcc	%o2,	0x1C29,	%g4
	addc	%l4,	%o6,	%l0
	umul	%i0,	%o3,	%o7
	fmovdleu	%icc,	%f26,	%f18
	srax	%g6,	0x12,	%l3
	edge32n	%i6,	%i3,	%i5
	ldsw	[%l7 + 0x2C],	%g2
	movrlz	%o5,	0x2DD,	%l5
	movl	%xcc,	%l1,	%o4
	array8	%g3,	%i7,	%i1
	array16	%l2,	%g1,	%g5
	orncc	%l6,	0x0D16,	%i2
	edge16n	%i4,	%o1,	%o0
	fmovsl	%icc,	%f19,	%f8
	fmovdl	%icc,	%f26,	%f23
	addcc	%o2,	0x1E93,	%g4
	movpos	%icc,	%l4,	%o6
	sll	%l0,	%i0,	%o3
	movcs	%xcc,	%o7,	%g6
	edge8l	%l3,	%g7,	%i6
	subcc	%i3,	0x1EDE,	%g2
	movn	%xcc,	%i5,	%l5
	udiv	%l1,	0x1BFA,	%o4
	xnorcc	%g3,	0x0BB5,	%o5
	udiv	%i7,	0x1FB2,	%i1
	edge16ln	%g1,	%l2,	%g5
	fcmpgt32	%f0,	%f8,	%l6
	addc	%i4,	%o1,	%o0
	fmovse	%icc,	%f13,	%f13
	fornot1s	%f28,	%f15,	%f25
	edge16l	%i2,	%o2,	%l4
	fmovdcs	%xcc,	%f20,	%f27
	movrgz	%g4,	%o6,	%l0
	umulcc	%i0,	%o7,	%g6
	fmovrdne	%o3,	%f20,	%f6
	movrlz	%l3,	0x089,	%g7
	udiv	%i6,	0x1F77,	%g2
	fpadd16s	%f9,	%f25,	%f27
	std	%f18,	[%l7 + 0x40]
	fmovsle	%xcc,	%f19,	%f2
	fmovrdne	%i5,	%f14,	%f16
	sdivx	%i3,	0x089F,	%l1
	movcc	%icc,	%o4,	%g3
	save %l5, %i7, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i1,	%g1,	%g5
	fpsub16s	%f25,	%f13,	%f14
	edge16n	%l2,	%i4,	%l6
	fnot2s	%f3,	%f6
	edge8	%o0,	%i2,	%o2
	fmovsle	%icc,	%f21,	%f7
	move	%icc,	%o1,	%l4
	edge32n	%g4,	%l0,	%o6
	smul	%o7,	0x1263,	%g6
	array32	%o3,	%l3,	%g7
	move	%icc,	%i0,	%i6
	alignaddrl	%g2,	%i5,	%i3
	sll	%l1,	%g3,	%o4
	sdiv	%l5,	0x0F96,	%i7
	movvs	%xcc,	%i1,	%o5
	movg	%xcc,	%g5,	%l2
	movpos	%icc,	%i4,	%l6
	fcmple32	%f26,	%f0,	%g1
	ld	[%l7 + 0x34],	%f24
	ld	[%l7 + 0x30],	%f13
	addcc	%o0,	0x17FF,	%o2
	orn	%o1,	%l4,	%g4
	fmovscs	%icc,	%f4,	%f8
	fexpand	%f5,	%f10
	movrgez	%l0,	0x369,	%o6
	move	%xcc,	%o7,	%g6
	edge16ln	%o3,	%i2,	%g7
	nop
	set	0x60, %g2
	ldd	[%l7 + %g2],	%l2
	edge8	%i0,	%i6,	%g2
	movn	%icc,	%i3,	%i5
	addccc	%g3,	%l1,	%l5
	or	%o4,	0x049C,	%i1
	fnot2s	%f26,	%f16
	sdivx	%i7,	0x0F51,	%o5
	andcc	%g5,	0x016F,	%l2
	ldx	[%l7 + 0x60],	%l6
	stw	%g1,	[%l7 + 0x2C]
	udiv	%i4,	0x00D9,	%o0
	sdiv	%o2,	0x1A99,	%l4
	fpsub16	%f24,	%f14,	%f0
	movvs	%icc,	%o1,	%l0
	movrgz	%o6,	0x265,	%o7
	sethi	0x1A6F,	%g6
	edge32n	%g4,	%i2,	%o3
	ld	[%l7 + 0x14],	%f9
	and	%g7,	%l3,	%i0
	movg	%xcc,	%g2,	%i3
	fmovrdne	%i6,	%f12,	%f10
	orn	%i5,	0x1206,	%l1
	stw	%g3,	[%l7 + 0x10]
	movl	%icc,	%o4,	%l5
	sra	%i7,	%o5,	%g5
	movvs	%icc,	%l2,	%i1
	lduw	[%l7 + 0x28],	%g1
	or	%i4,	%o0,	%l6
	sethi	0x0A86,	%l4
	ldsb	[%l7 + 0x36],	%o2
	fmovsge	%xcc,	%f14,	%f11
	fone	%f16
	fmovdne	%icc,	%f27,	%f1
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	fmovscs	%icc,	%f30,	%f13
	orn	%o7,	%o6,	%g4
	sllx	%i2,	0x0A,	%g6
	subc	%o3,	%l3,	%g7
	movrne	%i0,	%g2,	%i3
	sethi	0x0202,	%i5
	fcmped	%fcc2,	%f12,	%f4
	movcs	%xcc,	%l1,	%i6
	addcc	%g3,	%l5,	%i7
	movrgez	%o5,	0x0A4,	%o4
	array8	%g5,	%i1,	%g1
	xnor	%i4,	%l2,	%l6
	udivx	%o0,	0x02A8,	%l4
	lduw	[%l7 + 0x38],	%o1
	subccc	%l0,	0x149E,	%o7
	srax	%o6,	0x12,	%g4
	fcmps	%fcc0,	%f22,	%f19
	addc	%i2,	%g6,	%o3
	xnorcc	%l3,	%o2,	%i0
	edge8	%g2,	%g7,	%i3
	movpos	%icc,	%i5,	%l1
	xorcc	%i6,	0x0D14,	%g3
	popc	0x00AE,	%l5
	movvs	%icc,	%i7,	%o4
	siam	0x0
	fmovrdlez	%o5,	%f18,	%f2
	fmul8x16au	%f6,	%f14,	%f26
	movneg	%icc,	%i1,	%g1
	edge32n	%i4,	%l2,	%l6
	udivx	%g5,	0x1577,	%l4
	stb	%o0,	[%l7 + 0x4A]
	ld	[%l7 + 0x24],	%f18
	fmovsgu	%xcc,	%f14,	%f18
	ldd	[%l7 + 0x58],	%f26
	edge16n	%o1,	%l0,	%o7
	movcc	%xcc,	%g4,	%i2
	movre	%o6,	%g6,	%o3
	edge16n	%o2,	%l3,	%i0
	std	%f6,	[%l7 + 0x68]
	movle	%xcc,	%g2,	%i3
	fmovrdgz	%i5,	%f28,	%f0
	movcc	%xcc,	%l1,	%i6
	popc	%g7,	%l5
	mulx	%i7,	%g3,	%o4
	edge16l	%i1,	%o5,	%i4
	sllx	%g1,	0x19,	%l2
	fxors	%f10,	%f15,	%f30
	movrgez	%l6,	%l4,	%o0
	or	%o1,	%l0,	%g5
	xorcc	%o7,	%i2,	%o6
	movrne	%g4,	0x257,	%g6
	movn	%icc,	%o2,	%o3
	stw	%i0,	[%l7 + 0x74]
	addccc	%l3,	%i3,	%g2
	fcmpes	%fcc1,	%f19,	%f5
	sub	%i5,	0x0275,	%l1
	move	%xcc,	%g7,	%i6
	movrlez	%i7,	0x0A5,	%l5
	movrlz	%o4,	0x161,	%i1
	movrgz	%o5,	%g3,	%i4
	umul	%l2,	0x0135,	%g1
	sub	%l6,	%l4,	%o1
	fornot1s	%f5,	%f23,	%f26
	addcc	%o0,	%g5,	%o7
	array8	%i2,	%o6,	%l0
	restore %g6, 0x16BA, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x38, %g5
	ldd	[%l7 + %g5],	%f8
	ldsh	[%l7 + 0x5C],	%g4
	fands	%f20,	%f5,	%f11
	popc	0x0DFD,	%i0
	array16	%l3,	%o3,	%i3
	mulx	%i5,	%l1,	%g7
	fnor	%f12,	%f10,	%f24
	ldsh	[%l7 + 0x60],	%i6
	ldd	[%l7 + 0x20],	%g2
	movl	%icc,	%i7,	%o4
	movrne	%i1,	0x0DE,	%l5
	fmovrslez	%g3,	%f14,	%f3
	sdivx	%i4,	0x09BE,	%o5
	fcmped	%fcc2,	%f8,	%f2
	ldsw	[%l7 + 0x7C],	%l2
	movrlez	%l6,	0x174,	%g1
	srl	%o1,	0x1E,	%o0
	mulscc	%g5,	0x1E49,	%o7
	movre	%i2,	%o6,	%l4
	edge16ln	%g6,	%o2,	%g4
	fmovsvc	%xcc,	%f19,	%f31
	sdivcc	%i0,	0x1E6B,	%l3
	ldd	[%l7 + 0x38],	%f6
	for	%f10,	%f24,	%f16
	srlx	%o3,	0x06,	%l0
	fabsd	%f10,	%f16
	movrlez	%i3,	0x247,	%i5
	andcc	%l1,	0x0E64,	%g7
	srl	%i6,	0x0B,	%i7
	fornot1	%f2,	%f0,	%f16
	movrlz	%g2,	%o4,	%l5
	movge	%icc,	%g3,	%i1
	srax	%i4,	%l2,	%o5
	addccc	%l6,	0x09AC,	%o1
	fnot2	%f0,	%f6
	fcmpgt32	%f4,	%f24,	%g1
	edge16ln	%o0,	%g5,	%o7
	orn	%i2,	0x15B5,	%l4
	movvc	%icc,	%g6,	%o2
	ldub	[%l7 + 0x3D],	%o6
	movle	%xcc,	%g4,	%l3
	and	%i0,	0x0BEC,	%o3
	fands	%f20,	%f31,	%f27
	movrgez	%i3,	0x21C,	%i5
	popc	0x03C2,	%l0
	nop
	set	0x47, %o6
	stb	%l1,	[%l7 + %o6]
	edge32n	%i6,	%g7,	%i7
	sllx	%g2,	%o4,	%g3
	fmovrsne	%l5,	%f8,	%f10
	ldsb	[%l7 + 0x19],	%i1
	fmovdne	%icc,	%f17,	%f16
	orcc	%i4,	0x07F8,	%o5
	fmuld8sux16	%f1,	%f12,	%f16
	subc	%l2,	0x0ECB,	%o1
	nop
	set	0x60, %l2
	std	%f6,	[%l7 + %l2]
	sir	0x155D
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	fornot2	%f10,	%f30,	%f12
	ldsh	[%l7 + 0x54],	%l6
	sll	%g5,	%i2,	%l4
	fpadd16	%f2,	%f24,	%f22
	stx	%g6,	[%l7 + 0x40]
	umul	%o7,	0x0275,	%o6
	stb	%g4,	[%l7 + 0x70]
	ldsb	[%l7 + 0x69],	%o2
	sllx	%i0,	0x08,	%l3
	array32	%i3,	%o3,	%l0
	addc	%l1,	%i5,	%g7
	lduh	[%l7 + 0x54],	%i6
	orn	%g2,	0x0CA0,	%i7
	edge8n	%o4,	%l5,	%i1
	fmovrdlez	%i4,	%f28,	%f22
	xor	%o5,	0x01A6,	%g3
	udiv	%l2,	0x1CD2,	%g1
	udivx	%o0,	0x1811,	%l6
	mova	%xcc,	%g5,	%o1
	fpack32	%f18,	%f22,	%f22
	fmovscc	%xcc,	%f26,	%f3
	edge8l	%l4,	%g6,	%i2
	fmovdge	%icc,	%f19,	%f25
	xnor	%o7,	0x0FB5,	%o6
	movgu	%xcc,	%g4,	%i0
	fcmpeq16	%f28,	%f6,	%o2
	subcc	%l3,	0x1C96,	%i3
	nop
	set	0x72, %i7
	ldsh	[%l7 + %i7],	%l0
	and	%o3,	0x10D2,	%i5
	fmovsgu	%xcc,	%f9,	%f19
	addccc	%g7,	0x01F3,	%l1
	andcc	%i6,	0x079E,	%g2
	movcc	%xcc,	%o4,	%i7
	edge32ln	%l5,	%i1,	%i4
	stw	%o5,	[%l7 + 0x70]
	fmovrde	%l2,	%f20,	%f16
	udivcc	%g1,	0x1FC0,	%o0
	sdivx	%l6,	0x1C3E,	%g5
	orncc	%g3,	%l4,	%o1
	edge32ln	%g6,	%o7,	%o6
	xor	%g4,	%i0,	%o2
	movg	%icc,	%i2,	%l3
	movle	%xcc,	%l0,	%i3
	st	%f8,	[%l7 + 0x28]
	lduw	[%l7 + 0x30],	%i5
	andncc	%g7,	%o3,	%l1
	lduw	[%l7 + 0x2C],	%i6
	edge32n	%g2,	%i7,	%l5
	movge	%icc,	%o4,	%i4
	edge16n	%i1,	%l2,	%o5
	fmovdcc	%icc,	%f6,	%f24
	edge16n	%g1,	%l6,	%g5
	srl	%g3,	%o0,	%l4
	edge16	%g6,	%o1,	%o6
	srlx	%g4,	%o7,	%o2
	fors	%f25,	%f25,	%f15
	ld	[%l7 + 0x28],	%f24
	fmovsleu	%icc,	%f0,	%f25
	movge	%xcc,	%i0,	%l3
	edge32l	%l0,	%i2,	%i3
	mulx	%g7,	%o3,	%l1
	edge16	%i5,	%g2,	%i6
	fands	%f15,	%f22,	%f25
	movleu	%xcc,	%i7,	%o4
	fmovdl	%icc,	%f9,	%f25
	fpack16	%f6,	%f23
	movn	%xcc,	%i4,	%l5
	fsrc2	%f14,	%f2
	edge8n	%i1,	%l2,	%g1
	ldx	[%l7 + 0x40],	%o5
	movrlez	%l6,	0x1A5,	%g3
	and	%g5,	0x0EBB,	%l4
	fcmped	%fcc3,	%f26,	%f6
	edge16l	%g6,	%o0,	%o1
	smul	%o6,	%o7,	%g4
	umulcc	%o2,	0x1B43,	%l3
	umul	%l0,	%i0,	%i3
	edge16	%g7,	%o3,	%i2
	fxors	%f12,	%f13,	%f23
	fmovrdgz	%i5,	%f6,	%f0
	movn	%xcc,	%l1,	%i6
	xorcc	%g2,	%o4,	%i7
	fandnot1	%f26,	%f12,	%f28
	fmovrse	%i4,	%f1,	%f20
	movgu	%xcc,	%l5,	%l2
	edge16	%i1,	%o5,	%l6
	ld	[%l7 + 0x64],	%f16
	fxnors	%f11,	%f9,	%f17
	edge8ln	%g3,	%g5,	%l4
	ldd	[%l7 + 0x18],	%f22
	fzeros	%f19
	edge32	%g6,	%o0,	%o1
	edge8	%g1,	%o7,	%o6
	edge8l	%g4,	%o2,	%l3
	udiv	%i0,	0x0B0C,	%i3
	ldsb	[%l7 + 0x3C],	%g7
	popc	0x1014,	%o3
	sth	%l0,	[%l7 + 0x0A]
	smulcc	%i5,	%i2,	%l1
	andcc	%g2,	0x028C,	%i6
	smul	%o4,	0x1DF1,	%i7
	movne	%xcc,	%l5,	%l2
	sllx	%i4,	0x10,	%i1
	array8	%o5,	%l6,	%g3
	movg	%icc,	%g5,	%l4
	subc	%g6,	0x0014,	%o0
	andcc	%g1,	%o1,	%o6
	movgu	%icc,	%g4,	%o7
	movle	%xcc,	%o2,	%l3
	ldsb	[%l7 + 0x6E],	%i3
	movvc	%icc,	%g7,	%o3
	edge32ln	%i0,	%i5,	%i2
	edge32n	%l0,	%g2,	%l1
	movne	%icc,	%o4,	%i7
	ldsb	[%l7 + 0x21],	%i6
	movvs	%icc,	%l2,	%l5
	save %i1, %i4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o5,	0x1F72,	%g5
	fpsub32s	%f17,	%f28,	%f21
	ldsw	[%l7 + 0x7C],	%l4
	save %g6, %g3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g1,	%o1,	%o6
	fornot1	%f14,	%f12,	%f20
	umul	%o7,	%o2,	%g4
	array32	%i3,	%l3,	%g7
	std	%f26,	[%l7 + 0x30]
	sub	%o3,	%i0,	%i5
	addcc	%l0,	0x1A87,	%g2
	xorcc	%l1,	%i2,	%i7
	movg	%icc,	%i6,	%o4
	fpmerge	%f27,	%f2,	%f12
	lduh	[%l7 + 0x6A],	%l2
	edge8	%l5,	%i4,	%i1
	andcc	%l6,	%o5,	%l4
	addccc	%g6,	%g3,	%o0
	ld	[%l7 + 0x60],	%f1
	movrgz	%g5,	0x31F,	%o1
	edge8l	%o6,	%o7,	%o2
	mulscc	%g4,	%g1,	%l3
	sth	%g7,	[%l7 + 0x0C]
	fmovrsgz	%i3,	%f9,	%f17
	edge16	%o3,	%i0,	%i5
	sth	%g2,	[%l7 + 0x1E]
	movleu	%xcc,	%l0,	%i2
	movre	%i7,	%i6,	%l1
	sdiv	%l2,	0x077E,	%l5
	ldd	[%l7 + 0x08],	%f22
	save %o4, 0x04A4, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f10,	[%l7 + 0x10]
	movcs	%icc,	%l6,	%o5
	xnor	%i4,	%g6,	%g3
	alignaddr	%l4,	%g5,	%o0
	fcmple32	%f4,	%f10,	%o1
	fpadd16	%f6,	%f26,	%f28
	movrgz	%o6,	0x01E,	%o2
	fand	%f12,	%f8,	%f2
	movpos	%icc,	%g4,	%o7
	addccc	%g1,	%g7,	%l3
	andncc	%o3,	%i0,	%i5
	array16	%i3,	%l0,	%i2
	ld	[%l7 + 0x08],	%f25
	movrgez	%i7,	%g2,	%i6
	ldd	[%l7 + 0x48],	%f6
	fandnot2s	%f28,	%f26,	%f10
	movpos	%xcc,	%l2,	%l1
	andn	%o4,	0x1F70,	%l5
	ldsh	[%l7 + 0x52],	%l6
	ldsw	[%l7 + 0x24],	%o5
	fcmpne16	%f8,	%f22,	%i1
	movvs	%xcc,	%i4,	%g6
	subcc	%g3,	0x03E1,	%g5
	movrgz	%o0,	%l4,	%o1
	udiv	%o6,	0x1CA3,	%o2
	lduw	[%l7 + 0x28],	%o7
	fxnors	%f27,	%f29,	%f7
	fmul8ulx16	%f30,	%f30,	%f28
	popc	0x0F23,	%g4
	fmovdvs	%icc,	%f7,	%f27
	fsrc1	%f6,	%f12
	fsrc1	%f2,	%f4
	fcmpeq32	%f28,	%f0,	%g7
	movleu	%xcc,	%l3,	%o3
	fmovsg	%icc,	%f1,	%f15
	smul	%g1,	%i0,	%i3
	xnorcc	%l0,	%i5,	%i2
	ldd	[%l7 + 0x40],	%g2
	udiv	%i7,	0x1276,	%l2
	orn	%l1,	0x1AAD,	%o4
	movl	%xcc,	%i6,	%l6
	movre	%o5,	%i1,	%i4
	lduw	[%l7 + 0x4C],	%g6
	movleu	%icc,	%g3,	%l5
	movgu	%icc,	%g5,	%o0
	alignaddrl	%l4,	%o6,	%o2
	movgu	%xcc,	%o7,	%g4
	mulx	%o1,	%l3,	%o3
	movcs	%icc,	%g7,	%g1
	ldsb	[%l7 + 0x40],	%i0
	fexpand	%f28,	%f30
	sethi	0x0A6E,	%l0
	ldx	[%l7 + 0x18],	%i3
	ldsh	[%l7 + 0x52],	%i2
	movvc	%xcc,	%g2,	%i5
	edge8l	%l2,	%l1,	%o4
	array32	%i7,	%l6,	%i6
	fmovde	%icc,	%f1,	%f31
	ld	[%l7 + 0x14],	%f31
	andn	%i1,	0x10B9,	%o5
	movrlez	%i4,	%g6,	%l5
	array8	%g5,	%o0,	%g3
	subccc	%o6,	0x080A,	%l4
	fmovsl	%xcc,	%f11,	%f30
	andn	%o2,	%g4,	%o7
	stx	%o1,	[%l7 + 0x48]
	fmovsl	%icc,	%f4,	%f5
	smulcc	%l3,	0x044E,	%g7
	orncc	%g1,	0x035D,	%o3
	lduh	[%l7 + 0x5C],	%l0
	edge16l	%i0,	%i3,	%g2
	umul	%i5,	%i2,	%l2
	std	%f16,	[%l7 + 0x10]
	edge8	%l1,	%o4,	%i7
	andcc	%l6,	0x0167,	%i1
	fmovdle	%icc,	%f31,	%f0
	orcc	%i6,	0x0EFD,	%i4
	edge8n	%o5,	%l5,	%g6
	array32	%g5,	%o0,	%g3
	mulscc	%o6,	%o2,	%g4
	fmovrsgz	%o7,	%f28,	%f14
	fsrc1	%f8,	%f20
	udiv	%o1,	0x16FD,	%l3
	fpack16	%f2,	%f29
	movrgez	%l4,	%g7,	%g1
	xnorcc	%o3,	0x19C0,	%l0
	mulx	%i3,	%g2,	%i0
	and	%i2,	%i5,	%l2
	fcmpeq16	%f6,	%f22,	%o4
	alignaddrl	%l1,	%i7,	%l6
	fnands	%f19,	%f7,	%f9
	orn	%i1,	%i6,	%i4
	ldx	[%l7 + 0x48],	%o5
	movge	%xcc,	%g6,	%l5
	sir	0x137C
	fcmpne16	%f16,	%f0,	%o0
	popc	0x066B,	%g5
	alignaddrl	%g3,	%o2,	%g4
	fmovs	%f1,	%f23
	orn	%o7,	0x15DC,	%o6
	restore %l3, %o1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x6E],	%l4
	movg	%icc,	%g1,	%o3
	fcmps	%fcc0,	%f18,	%f31
	ldx	[%l7 + 0x10],	%l0
	sub	%g2,	%i3,	%i0
	mova	%icc,	%i2,	%l2
	movne	%icc,	%o4,	%i5
	fcmpgt32	%f30,	%f8,	%l1
	fmovspos	%xcc,	%f8,	%f16
	edge32n	%i7,	%l6,	%i6
	smul	%i4,	0x0C36,	%o5
	stw	%g6,	[%l7 + 0x30]
	orn	%i1,	%o0,	%g5
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	subccc	%g4,	%o7,	%g3
	movpos	%xcc,	%o6,	%o1
	subcc	%l3,	0x12A2,	%g7
	subccc	%l4,	0x074B,	%o3
	andcc	%l0,	0x0F27,	%g2
	mulscc	%g1,	0x11E2,	%i3
	fmovspos	%xcc,	%f2,	%f22
	fmovs	%f5,	%f24
	udivx	%i0,	0x115A,	%i2
	movvc	%xcc,	%o4,	%i5
	edge8l	%l1,	%l2,	%l6
	move	%icc,	%i6,	%i7
	stx	%i4,	[%l7 + 0x48]
	fmovdl	%icc,	%f11,	%f22
	sllx	%g6,	%i1,	%o0
	mova	%icc,	%o5,	%g5
	fmovsn	%icc,	%f5,	%f20
	umulcc	%o2,	%l5,	%g4
	movg	%xcc,	%g3,	%o7
	movn	%xcc,	%o6,	%l3
	st	%f21,	[%l7 + 0x78]
	fand	%f30,	%f2,	%f24
	movgu	%xcc,	%o1,	%l4
	stb	%o3,	[%l7 + 0x27]
	popc	%l0,	%g7
	fmovsne	%icc,	%f31,	%f24
	movn	%icc,	%g2,	%i3
	movgu	%icc,	%i0,	%i2
	fmovsgu	%icc,	%f24,	%f5
	fornot1s	%f19,	%f14,	%f30
	std	%f6,	[%l7 + 0x08]
	ldsb	[%l7 + 0x3E],	%o4
	xorcc	%g1,	0x065C,	%l1
	edge8ln	%i5,	%l6,	%l2
	movre	%i7,	%i6,	%i4
	array32	%i1,	%g6,	%o0
	fmul8x16al	%f20,	%f3,	%f10
	movcs	%xcc,	%g5,	%o5
	ldx	[%l7 + 0x68],	%o2
	mulx	%g4,	%l5,	%o7
	movleu	%icc,	%g3,	%l3
	sll	%o6,	0x11,	%o1
	fand	%f4,	%f30,	%f6
	nop
	set	0x74, %l0
	stb	%o3,	[%l7 + %l0]
	nop
	set	0x48, %o5
	ldsw	[%l7 + %o5],	%l0
	edge32l	%l4,	%g7,	%i3
	sll	%i0,	%g2,	%o4
	fors	%f15,	%f9,	%f22
	fpsub16s	%f6,	%f20,	%f21
	ldd	[%l7 + 0x70],	%g0
	nop
	set	0x20, %g3
	lduw	[%l7 + %g3],	%l1
	udiv	%i5,	0x180E,	%i2
	fpadd16	%f2,	%f16,	%f6
	fmovsl	%icc,	%f16,	%f20
	ldub	[%l7 + 0x70],	%l2
	movgu	%xcc,	%l6,	%i7
	fmovspos	%icc,	%f27,	%f20
	fpackfix	%f2,	%f3
	srlx	%i4,	0x13,	%i1
	xorcc	%g6,	0x0DEA,	%o0
	edge32n	%g5,	%i6,	%o2
	movvc	%xcc,	%g4,	%l5
	movrne	%o5,	0x370,	%o7
	fpsub32s	%f2,	%f6,	%f8
	edge8l	%l3,	%o6,	%g3
	fmovrse	%o3,	%f3,	%f23
	mulscc	%l0,	0x1B47,	%l4
	fnand	%f0,	%f4,	%f4
	fmovda	%xcc,	%f30,	%f29
	mulx	%o1,	%i3,	%g7
	or	%i0,	0x17C5,	%o4
	movle	%icc,	%g2,	%g1
	udivcc	%l1,	0x156F,	%i5
	fmovdg	%icc,	%f5,	%f10
	edge16n	%l2,	%l6,	%i2
	fcmple16	%f4,	%f8,	%i7
	fnot1	%f20,	%f18
	sra	%i4,	0x1E,	%g6
	umul	%i1,	%o0,	%g5
	addccc	%o2,	%i6,	%l5
	ldsb	[%l7 + 0x6C],	%g4
	fandnot1s	%f25,	%f15,	%f0
	movgu	%icc,	%o5,	%o7
	movrne	%o6,	%g3,	%l3
	stb	%l0,	[%l7 + 0x14]
	movl	%xcc,	%l4,	%o3
	movrgz	%i3,	0x384,	%g7
	edge8ln	%i0,	%o4,	%g2
	edge32l	%g1,	%o1,	%i5
	fsrc1	%f0,	%f28
	xnorcc	%l2,	%l1,	%i2
	subcc	%l6,	%i4,	%g6
	array16	%i7,	%o0,	%g5
	sdiv	%i1,	0x1F8F,	%i6
	add	%l5,	%o2,	%g4
	movre	%o7,	%o6,	%g3
	nop
	set	0x52, %o0
	stb	%l3,	[%l7 + %o0]
	fsrc2	%f14,	%f16
	or	%o5,	%l0,	%o3
	std	%f22,	[%l7 + 0x10]
	fpadd16s	%f15,	%f11,	%f14
	movneg	%icc,	%l4,	%i3
	add	%g7,	0x1B11,	%o4
	fmul8sux16	%f22,	%f14,	%f8
	movrlez	%g2,	%i0,	%o1
	st	%f20,	[%l7 + 0x7C]
	edge16ln	%i5,	%g1,	%l1
	ldd	[%l7 + 0x10],	%l2
	ldx	[%l7 + 0x68],	%l6
	sdivcc	%i2,	0x0EA0,	%i4
	fmovrdgz	%g6,	%f0,	%f26
	movneg	%xcc,	%o0,	%g5
	ldd	[%l7 + 0x30],	%i0
	umulcc	%i6,	0x0095,	%i7
	fandnot1s	%f20,	%f12,	%f23
	std	%f4,	[%l7 + 0x38]
	alignaddrl	%l5,	%o2,	%o7
	sdiv	%g4,	0x115E,	%g3
	mova	%xcc,	%o6,	%o5
	std	%f10,	[%l7 + 0x18]
	fpadd16s	%f21,	%f8,	%f27
	ldsb	[%l7 + 0x36],	%l3
	fcmpeq16	%f0,	%f28,	%l0
	array32	%o3,	%l4,	%g7
	fornot1	%f12,	%f14,	%f0
	edge32n	%o4,	%g2,	%i0
	subc	%i3,	0x04FF,	%o1
	movleu	%xcc,	%g1,	%i5
	sdiv	%l2,	0x1A7B,	%l1
	move	%xcc,	%i2,	%i4
	movvc	%xcc,	%g6,	%l6
	stb	%g5,	[%l7 + 0x38]
	movgu	%icc,	%o0,	%i6
	addcc	%i7,	0x1774,	%i1
	edge32	%l5,	%o2,	%g4
	edge16l	%g3,	%o7,	%o6
	udiv	%l3,	0x07D5,	%o5
	andcc	%l0,	0x1CE8,	%l4
	nop
	set	0x26, %o7
	stb	%o3,	[%l7 + %o7]
	mulx	%o4,	0x07D2,	%g2
	xor	%i0,	%i3,	%o1
	nop
	set	0x30, %i0
	ldsh	[%l7 + %i0],	%g7
	fmovrdgz	%g1,	%f28,	%f12
	ldd	[%l7 + 0x40],	%l2
	movl	%icc,	%i5,	%i2
	std	%f20,	[%l7 + 0x58]
	andn	%l1,	0x1A58,	%i4
	movvs	%xcc,	%l6,	%g6
	movrne	%g5,	0x162,	%o0
	ldub	[%l7 + 0x0E],	%i6
	udivcc	%i7,	0x1B73,	%i1
	movneg	%icc,	%l5,	%o2
	udiv	%g4,	0x0C3E,	%g3
	ld	[%l7 + 0x60],	%f31
	movpos	%icc,	%o6,	%o7
	fpsub16s	%f24,	%f23,	%f25
	edge32n	%o5,	%l0,	%l3
	movrgez	%o3,	0x3E9,	%l4
	addcc	%o4,	%g2,	%i3
	move	%xcc,	%i0,	%o1
	stw	%g1,	[%l7 + 0x30]
	ldx	[%l7 + 0x30],	%g7
	fcmpgt32	%f30,	%f12,	%l2
	edge8	%i5,	%i2,	%i4
	stw	%l6,	[%l7 + 0x0C]
	sdivcc	%l1,	0x0D8D,	%g5
	edge8ln	%o0,	%g6,	%i6
	mova	%xcc,	%i1,	%i7
	array8	%l5,	%g4,	%o2
	movrgz	%g3,	0x2D5,	%o7
	edge16l	%o5,	%l0,	%l3
	addccc	%o3,	0x06D8,	%l4
	fmovdneg	%xcc,	%f22,	%f16
	fzeros	%f26
	udivcc	%o6,	0x1A91,	%g2
	ldx	[%l7 + 0x28],	%o4
	movrgz	%i0,	%i3,	%o1
	movn	%xcc,	%g7,	%g1
	mova	%xcc,	%l2,	%i2
	udivcc	%i5,	0x17D2,	%i4
	sllx	%l6,	0x09,	%g5
	orcc	%o0,	%l1,	%g6
	lduw	[%l7 + 0x18],	%i6
	bshuffle	%f2,	%f14,	%f18
	movne	%icc,	%i1,	%i7
	movneg	%xcc,	%g4,	%l5
	xor	%g3,	%o2,	%o7
	fnot1s	%f26,	%f5
	popc	%o5,	%l0
	nop
	set	0x74, %g6
	sth	%l3,	[%l7 + %g6]
	pdist	%f14,	%f24,	%f14
	mova	%xcc,	%l4,	%o6
	fmovsleu	%icc,	%f2,	%f15
	andncc	%g2,	%o4,	%o3
	fmovdge	%xcc,	%f27,	%f10
	fabsd	%f6,	%f0
	movleu	%xcc,	%i0,	%i3
	ldx	[%l7 + 0x58],	%o1
	fcmpgt32	%f16,	%f12,	%g1
	andcc	%g7,	0x13CB,	%i2
	fxors	%f15,	%f24,	%f20
	ldx	[%l7 + 0x78],	%l2
	edge16	%i5,	%l6,	%g5
	restore %o0, %i4, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%i1,	%i7
	movrlez	%i6,	0x274,	%g4
	movcc	%xcc,	%l5,	%g3
	srl	%o7,	%o5,	%o2
	sra	%l3,	0x1B,	%l4
	fpadd32	%f24,	%f24,	%f16
	orcc	%o6,	%l0,	%o4
	smulcc	%o3,	%g2,	%i0
	fmovdvc	%xcc,	%f0,	%f23
	alignaddr	%i3,	%g1,	%o1
	ldsw	[%l7 + 0x6C],	%g7
	ldd	[%l7 + 0x20],	%f10
	ldsh	[%l7 + 0x0E],	%l2
	subcc	%i5,	0x17B2,	%i2
	movn	%xcc,	%g5,	%l6
	fmovsvs	%icc,	%f28,	%f21
	sll	%o0,	0x0E,	%g6
	fmovdne	%icc,	%f31,	%f11
	add	%i4,	0x1016,	%i1
	fmovrdne	%l1,	%f14,	%f24
	fsrc1	%f2,	%f18
	array8	%i6,	%i7,	%l5
	fmovrsgz	%g4,	%f22,	%f9
	sth	%g3,	[%l7 + 0x78]
	edge16ln	%o7,	%o5,	%l3
	ld	[%l7 + 0x78],	%f17
	fsrc1s	%f28,	%f22
	or	%o2,	%l4,	%o6
	fmovdle	%xcc,	%f21,	%f8
	fnot1s	%f18,	%f16
	udiv	%l0,	0x0FF4,	%o3
	subccc	%o4,	0x1F94,	%g2
	fcmpne32	%f12,	%f16,	%i3
	xorcc	%i0,	%o1,	%g1
	ldub	[%l7 + 0x09],	%l2
	fcmpgt32	%f20,	%f10,	%g7
	xor	%i5,	0x016C,	%g5
	movvc	%xcc,	%i2,	%o0
	ldsw	[%l7 + 0x18],	%l6
	xorcc	%i4,	%i1,	%l1
	edge8	%i6,	%i7,	%l5
	fmovsg	%icc,	%f28,	%f28
	orcc	%g6,	%g3,	%g4
	fmovdcc	%icc,	%f20,	%f29
	fnegs	%f3,	%f14
	nop
	set	0x5C, %i1
	stb	%o7,	[%l7 + %i1]
	movrlz	%l3,	%o2,	%l4
	sub	%o5,	0x05C6,	%l0
	stw	%o3,	[%l7 + 0x58]
	ldd	[%l7 + 0x30],	%o6
	move	%xcc,	%o4,	%i3
	movneg	%icc,	%g2,	%o1
	edge32	%i0,	%g1,	%g7
	movvc	%icc,	%l2,	%g5
	edge32ln	%i2,	%i5,	%o0
	umul	%l6,	0x1905,	%i1
	alignaddr	%i4,	%i6,	%l1
	smul	%i7,	0x1A84,	%g6
	orncc	%g3,	0x0204,	%l5
	movrlz	%o7,	%l3,	%g4
	xnorcc	%o2,	0x159C,	%o5
	move	%icc,	%l0,	%o3
	stb	%l4,	[%l7 + 0x62]
	array32	%o6,	%o4,	%i3
	sllx	%g2,	0x0B,	%o1
	fmovse	%xcc,	%f10,	%f18
	ldub	[%l7 + 0x6F],	%g1
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fcmpgt32	%f12,	%f6,	%i2
	mova	%icc,	%l2,	%i5
	edge32	%o0,	%l6,	%i4
	ldsb	[%l7 + 0x33],	%i1
	stw	%i6,	[%l7 + 0x5C]
	edge32l	%i7,	%l1,	%g3
	movvs	%xcc,	%l5,	%g6
	andncc	%l3,	%g4,	%o2
	lduw	[%l7 + 0x58],	%o5
	edge8l	%l0,	%o7,	%l4
	andn	%o6,	%o3,	%o4
	xor	%g2,	%i3,	%o1
	fsrc2	%f6,	%f12
	ldsh	[%l7 + 0x1E],	%g1
	sra	%g7,	0x0E,	%g5
	udivcc	%i2,	0x1CFD,	%l2
	movg	%icc,	%i5,	%i0
	fmovdl	%icc,	%f31,	%f4
	edge16ln	%o0,	%i4,	%i1
	xorcc	%i6,	0x1A2D,	%l6
	andcc	%i7,	0x13EA,	%g3
	addc	%l5,	%g6,	%l1
	movrgz	%g4,	%l3,	%o2
	movn	%xcc,	%o5,	%o7
	mulx	%l4,	0x0FB6,	%l0
	fmovrsne	%o6,	%f30,	%f19
	udiv	%o4,	0x0D59,	%o3
	srax	%g2,	0x17,	%i3
	fmovdneg	%xcc,	%f13,	%f29
	sub	%g1,	%o1,	%g5
	orncc	%g7,	0x15E8,	%i2
	fmovsle	%icc,	%f8,	%f21
	fmovrslez	%l2,	%f27,	%f13
	alignaddr	%i5,	%o0,	%i0
	fmul8x16au	%f31,	%f18,	%f30
	edge16l	%i4,	%i1,	%i6
	fmovrdlz	%i7,	%f30,	%f6
	srl	%g3,	0x0D,	%l5
	movcc	%xcc,	%g6,	%l6
	sdivcc	%l1,	0x1799,	%l3
	ldx	[%l7 + 0x60],	%g4
	udiv	%o5,	0x1C7D,	%o2
	fandnot2	%f2,	%f2,	%f10
	fmovsvs	%icc,	%f5,	%f29
	fmovrdgez	%l4,	%f10,	%f24
	edge16	%o7,	%l0,	%o4
	sdiv	%o3,	0x1FC7,	%g2
	lduh	[%l7 + 0x4C],	%i3
	move	%xcc,	%g1,	%o1
	fmovdle	%xcc,	%f25,	%f1
	fsrc1s	%f12,	%f18
	edge32ln	%o6,	%g7,	%g5
	andn	%l2,	%i2,	%i5
	sdiv	%o0,	0x0AF1,	%i0
	fmovdne	%xcc,	%f17,	%f17
	movrlz	%i1,	%i6,	%i7
	edge16l	%i4,	%l5,	%g3
	edge16l	%l6,	%l1,	%l3
	movne	%xcc,	%g6,	%g4
	addccc	%o2,	%l4,	%o5
	fmul8ulx16	%f2,	%f2,	%f18
	fcmpd	%fcc2,	%f2,	%f4
	movgu	%icc,	%o7,	%o4
	movcs	%xcc,	%o3,	%g2
	andncc	%l0,	%i3,	%o1
	xnorcc	%g1,	0x0738,	%o6
	movge	%icc,	%g7,	%g5
	edge8ln	%l2,	%i5,	%i2
	std	%f14,	[%l7 + 0x10]
	edge16l	%o0,	%i1,	%i0
	sdiv	%i7,	0x103D,	%i6
	fpsub16	%f16,	%f18,	%f6
	movpos	%icc,	%i4,	%g3
	ld	[%l7 + 0x2C],	%f28
	stw	%l6,	[%l7 + 0x40]
	movge	%icc,	%l5,	%l3
	ld	[%l7 + 0x14],	%f18
	ldsw	[%l7 + 0x0C],	%g6
	andn	%g4,	%o2,	%l4
	fmovsleu	%xcc,	%f8,	%f27
	fmovde	%icc,	%f3,	%f26
	fmovdl	%xcc,	%f17,	%f22
	nop
	set	0x10, %g7
	ldx	[%l7 + %g7],	%l1
	xorcc	%o5,	0x0360,	%o7
	move	%xcc,	%o4,	%o3
	smul	%g2,	0x0258,	%i3
	ld	[%l7 + 0x1C],	%f9
	lduw	[%l7 + 0x18],	%o1
	stw	%g1,	[%l7 + 0x68]
	movg	%xcc,	%l0,	%g7
	xnor	%o6,	%l2,	%g5
	mulx	%i5,	%i2,	%o0
	fmovsvc	%icc,	%f1,	%f27
	ldsw	[%l7 + 0x6C],	%i0
	ldd	[%l7 + 0x58],	%f26
	fmovs	%f20,	%f3
	ldd	[%l7 + 0x70],	%i0
	sethi	0x07F3,	%i6
	fmovsgu	%xcc,	%f8,	%f6
	srl	%i4,	0x15,	%i7
	save %g3, %l6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%g6,	%l3,	%o2
	fcmpne16	%f18,	%f2,	%l4
	fmovsvs	%xcc,	%f16,	%f12
	fzero	%f10
	andncc	%g4,	%l1,	%o7
	movcc	%icc,	%o5,	%o3
	lduw	[%l7 + 0x58],	%g2
	andncc	%o4,	%o1,	%i3
	sth	%l0,	[%l7 + 0x54]
	movg	%icc,	%g7,	%g1
	movrlz	%o6,	%l2,	%g5
	save %i2, %o0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%i1,	0x1B,	%i5
	save %i6, 0x0350, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%i7,	%g3,	%l6
	std	%f8,	[%l7 + 0x30]
	mova	%icc,	%g6,	%l3
	srlx	%l5,	%o2,	%l4
	mulscc	%l1,	0x1C01,	%o7
	for	%f24,	%f20,	%f6
	srax	%g4,	%o5,	%o3
	edge32n	%o4,	%o1,	%g2
	edge16ln	%l0,	%i3,	%g7
	sth	%g1,	[%l7 + 0x54]
	udivx	%o6,	0x1A94,	%g5
	restore %i2, %l2, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrde	%o0,	%f20,	%f26
	fmul8x16al	%f11,	%f30,	%f24
	fmovscs	%icc,	%f18,	%f2
	fmovrsgz	%i1,	%f3,	%f17
	sdivcc	%i5,	0x144B,	%i6
	ldsb	[%l7 + 0x08],	%i7
	orn	%g3,	%l6,	%i4
	movcs	%xcc,	%l3,	%g6
	andncc	%l5,	%l4,	%l1
	fnot1	%f30,	%f10
	fpackfix	%f2,	%f4
	addcc	%o7,	%g4,	%o5
	sll	%o2,	0x0E,	%o3
	lduw	[%l7 + 0x4C],	%o4
	array32	%o1,	%g2,	%l0
	movvs	%icc,	%g7,	%g1
	sethi	0x0055,	%i3
	orn	%o6,	0x0590,	%i2
	udiv	%l2,	0x1FE3,	%g5
	edge16	%o0,	%i0,	%i5
	fexpand	%f20,	%f22
	addccc	%i6,	%i1,	%g3
	edge32	%l6,	%i4,	%l3
	subcc	%g6,	0x11AA,	%l5
	ldsw	[%l7 + 0x08],	%i7
	xnorcc	%l1,	%l4,	%o7
	ldsb	[%l7 + 0x75],	%o5
	fsrc1	%f16,	%f26
	addcc	%o2,	0x15D6,	%g4
	fsrc1	%f18,	%f6
	xnorcc	%o4,	%o1,	%o3
	movrlz	%g2,	%g7,	%l0
	edge32l	%i3,	%g1,	%o6
	sethi	0x0162,	%l2
	fnegs	%f7,	%f8
	andcc	%g5,	%i2,	%i0
	fcmpne16	%f26,	%f2,	%o0
	fors	%f13,	%f10,	%f13
	fnands	%f1,	%f28,	%f9
	movrgz	%i5,	%i1,	%g3
	edge8l	%i6,	%i4,	%l6
	addccc	%l3,	%g6,	%l5
	srax	%i7,	%l4,	%o7
	edge16	%o5,	%l1,	%g4
	fpadd16	%f0,	%f12,	%f30
	mulx	%o4,	0x1120,	%o1
	fmovdneg	%icc,	%f1,	%f19
	movl	%icc,	%o2,	%o3
	movle	%icc,	%g2,	%g7
	ldx	[%l7 + 0x78],	%l0
	sethi	0x07D0,	%g1
	orn	%o6,	0x1FD9,	%l2
	and	%i3,	%i2,	%i0
	srax	%o0,	0x11,	%i5
	movvc	%icc,	%g5,	%g3
	sdivx	%i6,	0x0680,	%i4
	movrlz	%l6,	%i1,	%l3
	mova	%icc,	%g6,	%i7
	fcmped	%fcc0,	%f12,	%f18
	movcs	%icc,	%l5,	%o7
	sdivx	%o5,	0x05D4,	%l4
	umul	%g4,	0x0C5A,	%l1
	edge16ln	%o1,	%o4,	%o3
	stx	%g2,	[%l7 + 0x50]
	fones	%f19
	sth	%g7,	[%l7 + 0x58]
	nop
	set	0x0C, %o2
	lduh	[%l7 + %o2],	%l0
	xorcc	%o2,	0x12D6,	%g1
	ldsb	[%l7 + 0x42],	%l2
	movvc	%xcc,	%o6,	%i2
	array16	%i0,	%o0,	%i5
	edge32	%i3,	%g3,	%i6
	fmovdvc	%xcc,	%f25,	%f31
	umulcc	%g5,	%l6,	%i1
	sub	%l3,	0x082D,	%i4
	movrlez	%i7,	0x3EB,	%g6
	addc	%l5,	0x0CCD,	%o7
	movne	%icc,	%o5,	%l4
	edge32ln	%l1,	%g4,	%o1
	stb	%o3,	[%l7 + 0x10]
	fmul8ulx16	%f18,	%f26,	%f14
	ld	[%l7 + 0x14],	%f28
	ldx	[%l7 + 0x18],	%o4
	movge	%icc,	%g7,	%g2
	edge32	%o2,	%g1,	%l0
	udiv	%l2,	0x1489,	%o6
	orn	%i2,	%i0,	%i5
	movrgez	%i3,	%o0,	%g3
	xnor	%g5,	%l6,	%i6
	fcmpes	%fcc3,	%f26,	%f21
	movrgz	%l3,	%i1,	%i4
	subcc	%g6,	0x04B1,	%l5
	fmovdleu	%icc,	%f12,	%f27
	srax	%o7,	%i7,	%l4
	addc	%l1,	0x1E23,	%o5
	orncc	%g4,	0x0320,	%o3
	movre	%o1,	0x32B,	%o4
	srax	%g2,	0x17,	%o2
	movre	%g7,	0x3B0,	%l0
	st	%f20,	[%l7 + 0x50]
	stw	%g1,	[%l7 + 0x60]
	edge32	%l2,	%o6,	%i2
	orncc	%i0,	0x04AE,	%i5
	fpadd16s	%f1,	%f1,	%f21
	umul	%o0,	%i3,	%g5
	xnor	%l6,	0x0E3D,	%i6
	fsrc1	%f24,	%f14
	edge8ln	%l3,	%g3,	%i4
	udivcc	%g6,	0x04D8,	%l5
	sdivcc	%i1,	0x0A78,	%o7
	orncc	%i7,	%l1,	%l4
	srl	%o5,	%o3,	%g4
	fpadd32s	%f27,	%f14,	%f6
	fandnot2	%f22,	%f22,	%f26
	movrgz	%o1,	%o4,	%g2
	fmuld8sux16	%f0,	%f27,	%f10
	movrlz	%o2,	%g7,	%l0
	mulx	%g1,	%l2,	%i2
	add	%i0,	0x068F,	%i5
	movle	%icc,	%o0,	%o6
	alignaddrl	%g5,	%i3,	%i6
	movrlez	%l3,	0x1AA,	%g3
	fmovse	%icc,	%f13,	%f18
	pdist	%f12,	%f2,	%f24
	fnor	%f26,	%f4,	%f12
	srax	%l6,	%i4,	%l5
	subc	%i1,	%g6,	%i7
	umulcc	%o7,	0x1EBB,	%l4
	movleu	%xcc,	%l1,	%o5
	fmovrsne	%g4,	%f23,	%f18
	fmovsl	%xcc,	%f5,	%f29
	sir	0x09BA
	edge8l	%o1,	%o3,	%g2
	andcc	%o2,	%g7,	%o4
	fmovdvc	%xcc,	%f18,	%f24
	movrlez	%l0,	0x0F5,	%g1
	edge16ln	%l2,	%i2,	%i0
	fmovsne	%icc,	%f19,	%f14
	fmul8ulx16	%f12,	%f30,	%f10
	srax	%i5,	%o6,	%g5
	ldx	[%l7 + 0x38],	%o0
	addccc	%i3,	%l3,	%i6
	sdiv	%l6,	0x1392,	%i4
	edge8n	%g3,	%i1,	%l5
	movvs	%icc,	%i7,	%o7
	addcc	%l4,	%l1,	%o5
	stw	%g6,	[%l7 + 0x74]
	xnor	%o1,	0x1DF8,	%g4
	movcs	%icc,	%g2,	%o3
	st	%f6,	[%l7 + 0x78]
	fnot2	%f14,	%f22
	fornot2	%f16,	%f12,	%f24
	mulscc	%o2,	0x0F7D,	%o4
	fpack16	%f22,	%f8
	sllx	%l0,	%g7,	%l2
	movre	%g1,	0x26F,	%i2
	movle	%xcc,	%i5,	%o6
	fpadd32	%f22,	%f24,	%f22
	fandnot2	%f30,	%f18,	%f20
	save %g5, 0x0804, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i3,	%i0,	%l3
	array32	%i6,	%l6,	%g3
	movre	%i1,	%i4,	%l5
	sub	%o7,	%l4,	%i7
	sth	%l1,	[%l7 + 0x76]
	ldsh	[%l7 + 0x2E],	%o5
	fmovdgu	%icc,	%f4,	%f16
	ldsh	[%l7 + 0x1E],	%o1
	subccc	%g4,	%g2,	%g6
	fmovrslez	%o3,	%f13,	%f6
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	andcc	%o2,	0x0C92,	%l2
	fmovsle	%xcc,	%f26,	%f20
	alignaddrl	%i2,	%i5,	%o6
	sdiv	%g1,	0x070D,	%o0
	movle	%xcc,	%g5,	%i3
	umulcc	%i0,	0x0A42,	%i6
	fmovsn	%icc,	%f20,	%f1
	fnot2	%f6,	%f28
	nop
	set	0x64, %l4
	stw	%l3,	[%l7 + %l4]
	fcmpes	%fcc0,	%f16,	%f4
	xnorcc	%g3,	%l6,	%i1
	fmuld8ulx16	%f24,	%f30,	%f16
	smul	%i4,	0x137C,	%l5
	umul	%o7,	%i7,	%l4
	ld	[%l7 + 0x30],	%f3
	movgu	%icc,	%l1,	%o5
	sdivx	%g4,	0x01B7,	%g2
	ldd	[%l7 + 0x40],	%f10
	edge16l	%o1,	%o3,	%o4
	movne	%xcc,	%l0,	%g7
	sub	%o2,	%l2,	%i2
	orncc	%g6,	%i5,	%g1
	ldsb	[%l7 + 0x0B],	%o0
	stb	%o6,	[%l7 + 0x4A]
	subcc	%i3,	0x006D,	%g5
	lduh	[%l7 + 0x5A],	%i6
	fornot1s	%f6,	%f2,	%f15
	fcmpne16	%f6,	%f26,	%i0
	nop
	set	0x2F, %o3
	ldub	[%l7 + %o3],	%g3
	stx	%l3,	[%l7 + 0x08]
	array16	%l6,	%i4,	%i1
	fmovsn	%icc,	%f17,	%f25
	restore %l5, %o7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%l1,	%o5
	sethi	0x1CE9,	%g4
	fandnot1s	%f2,	%f16,	%f13
	fmovrslz	%g2,	%f11,	%f31
	movgu	%icc,	%l4,	%o3
	xnorcc	%o1,	0x15C8,	%l0
	alignaddr	%o4,	%g7,	%l2
	sll	%i2,	%o2,	%g6
	edge32l	%g1,	%i5,	%o6
	subcc	%o0,	0x0C91,	%i3
	movneg	%icc,	%g5,	%i6
	movn	%icc,	%g3,	%l3
	umul	%l6,	0x1597,	%i0
	movne	%xcc,	%i1,	%i4
	ldx	[%l7 + 0x58],	%o7
	and	%l5,	%l1,	%i7
	edge8ln	%o5,	%g4,	%l4
	smulcc	%g2,	%o3,	%o1
	udivx	%l0,	0x0AAF,	%o4
	movrlez	%g7,	%l2,	%o2
	movne	%xcc,	%i2,	%g1
	array32	%g6,	%o6,	%i5
	umul	%i3,	%g5,	%i6
	mulscc	%g3,	0x17AA,	%l3
	fsrc2s	%f6,	%f30
	orncc	%o0,	%l6,	%i0
	movgu	%icc,	%i1,	%o7
	alignaddrl	%i4,	%l1,	%l5
	subccc	%i7,	%g4,	%o5
	edge8n	%l4,	%g2,	%o3
	sethi	0x1D54,	%o1
	movle	%icc,	%l0,	%o4
	sethi	0x1A08,	%l2
	movvc	%icc,	%o2,	%i2
	movgu	%xcc,	%g7,	%g6
	stw	%o6,	[%l7 + 0x5C]
	edge16n	%i5,	%g1,	%g5
	srlx	%i6,	0x16,	%i3
	fabss	%f26,	%f19
	or	%l3,	%o0,	%g3
	array32	%l6,	%i1,	%o7
	for	%f10,	%f18,	%f10
	xorcc	%i4,	0x18A9,	%i0
	edge16	%l5,	%i7,	%l1
	fandnot1	%f24,	%f0,	%f20
	movleu	%icc,	%o5,	%g4
	edge8ln	%g2,	%o3,	%o1
	edge32ln	%l0,	%o4,	%l2
	xnor	%l4,	0x1DD0,	%o2
	and	%g7,	0x1C40,	%i2
	ldx	[%l7 + 0x08],	%g6
	fnands	%f17,	%f7,	%f2
	fsrc2s	%f12,	%f22
	nop
	set	0x70, %o4
	ldub	[%l7 + %o4],	%i5
	ldx	[%l7 + 0x48],	%o6
	sdiv	%g1,	0x078D,	%i6
	addccc	%i3,	%l3,	%g5
	fornot1s	%f10,	%f3,	%f9
	fmovrslez	%o0,	%f31,	%f14
	srl	%l6,	0x03,	%g3
	edge8ln	%o7,	%i4,	%i1
	movcs	%xcc,	%l5,	%i0
	umulcc	%l1,	0x03C9,	%i7
	addccc	%o5,	%g2,	%o3
	movge	%xcc,	%g4,	%o1
	smul	%l0,	0x09D9,	%o4
	umul	%l4,	0x125C,	%o2
	sethi	0x1651,	%l2
	edge16l	%g7,	%g6,	%i5
	smulcc	%o6,	%g1,	%i6
	or	%i2,	0x1304,	%l3
	sth	%g5,	[%l7 + 0x78]
	fmovscc	%xcc,	%f8,	%f8
	sll	%i3,	0x08,	%l6
	ldd	[%l7 + 0x60],	%f0
	mova	%icc,	%o0,	%g3
	fnot2	%f0,	%f6
	stx	%o7,	[%l7 + 0x30]
	faligndata	%f26,	%f24,	%f18
	add	%i4,	0x1321,	%l5
	fmovdn	%xcc,	%f5,	%f28
	alignaddr	%i0,	%i1,	%i7
	movne	%xcc,	%l1,	%o5
	fnegd	%f30,	%f26
	edge8n	%g2,	%g4,	%o3
	orncc	%o1,	%l0,	%o4
	bshuffle	%f0,	%f12,	%f16
	ld	[%l7 + 0x5C],	%f0
	movpos	%xcc,	%o2,	%l2
	ldd	[%l7 + 0x68],	%f20
	fmovscc	%xcc,	%f2,	%f2
	xor	%g7,	0x1D9A,	%l4
	fmovdge	%icc,	%f30,	%f30
	movvc	%icc,	%i5,	%o6
	sub	%g6,	%g1,	%i6
	srlx	%i2,	0x0A,	%l3
	sub	%g5,	%i3,	%l6
	fnand	%f28,	%f16,	%f24
	xor	%o0,	%g3,	%o7
	addccc	%l5,	%i4,	%i0
	fpack16	%f12,	%f2
	mulscc	%i1,	0x1955,	%l1
	fmovsvc	%icc,	%f9,	%f16
	subcc	%o5,	%i7,	%g2
	mulx	%g4,	%o1,	%o3
	fmovrdgez	%o4,	%f14,	%f24
	sethi	0x1060,	%o2
	srlx	%l2,	%l0,	%l4
	subc	%g7,	%i5,	%g6
	umulcc	%g1,	%i6,	%o6
	ldub	[%l7 + 0x57],	%l3
	array16	%g5,	%i3,	%i2
	ldx	[%l7 + 0x58],	%o0
	movrlz	%g3,	%l6,	%o7
	fpack32	%f24,	%f12,	%f6
	edge32	%l5,	%i4,	%i0
	srl	%i1,	0x1C,	%o5
	sdiv	%l1,	0x04D1,	%i7
	ldsw	[%l7 + 0x2C],	%g2
	fpackfix	%f22,	%f23
	lduw	[%l7 + 0x70],	%o1
	xnorcc	%o3,	0x12D7,	%o4
	and	%g4,	0x14C4,	%o2
	umul	%l2,	0x08FE,	%l0
	edge8n	%l4,	%g7,	%g6
	alignaddr	%i5,	%g1,	%o6
	smul	%l3,	0x1541,	%g5
	ldx	[%l7 + 0x10],	%i6
	or	%i3,	%i2,	%g3
	edge32	%l6,	%o7,	%l5
	xorcc	%o0,	0x1B95,	%i0
	movg	%xcc,	%i4,	%o5
	movleu	%icc,	%i1,	%l1
	sub	%g2,	%i7,	%o3
	mulscc	%o4,	0x0553,	%o1
	movgu	%icc,	%g4,	%l2
	xor	%o2,	%l0,	%g7
	movrne	%g6,	%l4,	%g1
	edge32n	%i5,	%l3,	%o6
	movne	%xcc,	%i6,	%g5
	edge32l	%i2,	%i3,	%g3
	smul	%l6,	%o7,	%l5
	ldsb	[%l7 + 0x2D],	%i0
	stw	%o0,	[%l7 + 0x44]
	subc	%i4,	%i1,	%o5
	fmovrdne	%l1,	%f6,	%f2
	std	%f14,	[%l7 + 0x70]
	edge16n	%i7,	%o3,	%g2
	movn	%xcc,	%o1,	%g4
	movle	%icc,	%l2,	%o2
	move	%icc,	%o4,	%g7
	movrlez	%g6,	%l0,	%l4
	st	%f8,	[%l7 + 0x38]
	orncc	%g1,	0x137D,	%l3
	andcc	%o6,	%i6,	%g5
	edge32	%i2,	%i3,	%i5
	movgu	%xcc,	%l6,	%g3
	fmovspos	%xcc,	%f12,	%f14
	ldd	[%l7 + 0x28],	%f18
	movg	%icc,	%l5,	%i0
	edge32	%o0,	%i4,	%o7
	alignaddr	%i1,	%o5,	%i7
	movgu	%icc,	%l1,	%g2
	fandnot1s	%f30,	%f21,	%f8
	subc	%o1,	0x15F6,	%o3
	fmovsvs	%icc,	%f14,	%f16
	lduh	[%l7 + 0x2C],	%l2
	edge32n	%o2,	%o4,	%g4
	sth	%g6,	[%l7 + 0x78]
	movgu	%icc,	%g7,	%l4
	addccc	%l0,	%g1,	%l3
	alignaddrl	%i6,	%g5,	%o6
	fmovrsgz	%i3,	%f10,	%f4
	popc	%i5,	%l6
	array8	%g3,	%l5,	%i0
	srax	%i2,	0x17,	%o0
	fmovse	%icc,	%f11,	%f28
	ldd	[%l7 + 0x08],	%i4
	ldsh	[%l7 + 0x78],	%o7
	edge32n	%i1,	%i7,	%o5
	subcc	%l1,	0x0261,	%o1
	add	%o3,	0x09BC,	%g2
	fnot2	%f20,	%f18
	mulscc	%o2,	%o4,	%g4
	nop
	set	0x48, %l1
	ldd	[%l7 + %l1],	%g6
	ldsh	[%l7 + 0x60],	%l2
	edge16n	%g7,	%l4,	%l0
	mova	%icc,	%l3,	%g1
	alignaddrl	%g5,	%o6,	%i3
	movrne	%i6,	%i5,	%l6
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	sethi	0x08A9,	%o0
	xnor	%i4,	%i2,	%o7
	save %i7, 0x1FE1, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x4E],	%l1
	sdivcc	%o5,	0x1764,	%o1
	sll	%g2,	0x14,	%o2
	udivx	%o4,	0x1585,	%g4
	fpackfix	%f28,	%f8
	srax	%o3,	%l2,	%g6
	movge	%xcc,	%l4,	%g7
	smul	%l0,	0x066C,	%g1
	movrne	%g5,	0x0E0,	%o6
	fpack16	%f20,	%f30
	andncc	%i3,	%l3,	%i6
	fexpand	%f17,	%f16
	sth	%i5,	[%l7 + 0x70]
	ldsb	[%l7 + 0x67],	%l5
	movre	%g3,	0x140,	%i0
	sra	%l6,	0x11,	%i4
	sdiv	%o0,	0x017F,	%o7
	subc	%i7,	%i1,	%i2
	orn	%l1,	0x1A21,	%o1
	st	%f19,	[%l7 + 0x70]
	array32	%g2,	%o5,	%o2
	edge8	%o4,	%g4,	%o3
	faligndata	%f2,	%f0,	%f16
	movvc	%xcc,	%l2,	%l4
	xor	%g6,	0x0458,	%l0
	umulcc	%g7,	0x10A2,	%g5
	fmovrse	%g1,	%f11,	%f9
	ldx	[%l7 + 0x48],	%i3
	movrlz	%o6,	0x170,	%l3
	faligndata	%f26,	%f16,	%f30
	ldd	[%l7 + 0x58],	%i6
	popc	0x12FF,	%l5
	fmovsn	%xcc,	%f8,	%f9
	move	%icc,	%g3,	%i5
	ldsb	[%l7 + 0x13],	%i0
	movne	%icc,	%i4,	%l6
	alignaddr	%o0,	%o7,	%i7
	edge16	%i2,	%l1,	%o1
	fpsub32	%f30,	%f6,	%f0
	sdivx	%i1,	0x1795,	%g2
	fmovrsne	%o5,	%f15,	%f23
	stb	%o4,	[%l7 + 0x2D]
	ldsb	[%l7 + 0x3A],	%g4
	movrlez	%o2,	%o3,	%l4
	fpadd32	%f4,	%f20,	%f0
	fmovdle	%xcc,	%f18,	%f2
	ldsw	[%l7 + 0x58],	%g6
	sub	%l0,	%g7,	%l2
	addcc	%g5,	0x0FCA,	%i3
	movcc	%xcc,	%o6,	%g1
	add	%l3,	%l5,	%g3
	fmovsne	%xcc,	%f29,	%f8
	sdivcc	%i6,	0x1972,	%i0
	movre	%i5,	0x2D3,	%l6
	movleu	%icc,	%i4,	%o0
	subccc	%i7,	0x0D71,	%i2
	fcmpgt16	%f16,	%f6,	%o7
	alignaddrl	%l1,	%o1,	%g2
	orn	%o5,	%o4,	%g4
	fpadd32s	%f3,	%f6,	%f30
	sub	%o2,	0x1011,	%i1
	movrgez	%o3,	%l4,	%l0
	fnot2	%f12,	%f6
	movvc	%icc,	%g6,	%g7
	edge8l	%l2,	%g5,	%i3
	orn	%g1,	0x1684,	%o6
	fmovsneg	%xcc,	%f8,	%f15
	stw	%l3,	[%l7 + 0x70]
	movne	%xcc,	%l5,	%i6
	srl	%i0,	0x16,	%g3
	sdivcc	%l6,	0x0D66,	%i5
	mulscc	%i4,	%o0,	%i7
	movne	%icc,	%o7,	%l1
	fmovdvs	%icc,	%f15,	%f21
	fnand	%f16,	%f26,	%f18
	xnor	%i2,	0x171F,	%o1
	fcmpne32	%f2,	%f6,	%o5
	andncc	%g2,	%g4,	%o2
	movl	%xcc,	%i1,	%o3
	std	%f10,	[%l7 + 0x78]
	edge32	%o4,	%l0,	%g6
	srl	%g7,	0x19,	%l4
	fmovsleu	%xcc,	%f25,	%f20
	lduw	[%l7 + 0x3C],	%l2
	fmovdle	%xcc,	%f12,	%f14
	nop
	set	0x18, %l5
	sth	%i3,	[%l7 + %l5]
	udivcc	%g5,	0x15D3,	%g1
	nop
	set	0x3A, %l6
	ldsb	[%l7 + %l6],	%l3
	edge8n	%o6,	%i6,	%l5
	movcc	%xcc,	%i0,	%g3
	fmovdn	%icc,	%f27,	%f5
	movrgez	%l6,	0x291,	%i4
	st	%f30,	[%l7 + 0x1C]
	ldub	[%l7 + 0x0F],	%i5
	umul	%o0,	%o7,	%i7
	orcc	%l1,	0x035A,	%o1
	mova	%xcc,	%i2,	%o5
	ldsw	[%l7 + 0x28],	%g4
	umulcc	%g2,	0x05C2,	%i1
	fpack16	%f30,	%f27
	edge8l	%o3,	%o4,	%o2
	sdivx	%g6,	0x199B,	%g7
	subc	%l4,	%l0,	%l2
	stx	%i3,	[%l7 + 0x68]
	edge32n	%g5,	%l3,	%o6
	sethi	0x0883,	%i6
	fmul8ulx16	%f20,	%f22,	%f2
	alignaddr	%g1,	%i0,	%l5
	movne	%xcc,	%g3,	%i4
	fmovrde	%l6,	%f0,	%f16
	fmovd	%f22,	%f4
	sdivx	%o0,	0x1984,	%o7
	movneg	%xcc,	%i7,	%l1
	xnor	%i5,	%i2,	%o5
	fmovda	%icc,	%f14,	%f16
	edge16ln	%g4,	%o1,	%i1
	move	%xcc,	%o3,	%o4
	movle	%icc,	%o2,	%g2
	movvs	%icc,	%g6,	%l4
	movgu	%icc,	%l0,	%g7
	umul	%l2,	0x1C83,	%i3
	or	%g5,	%o6,	%l3
	fmovdcc	%xcc,	%f18,	%f21
	ld	[%l7 + 0x4C],	%f8
	ldd	[%l7 + 0x60],	%g0
	ldd	[%l7 + 0x18],	%i6
	move	%xcc,	%l5,	%g3
	addcc	%i4,	0x01AB,	%l6
	subc	%i0,	%o0,	%o7
	ldsb	[%l7 + 0x73],	%l1
	movl	%xcc,	%i5,	%i7
	alignaddrl	%o5,	%g4,	%o1
	srlx	%i2,	%o3,	%o4
	sllx	%i1,	0x14,	%g2
	addcc	%g6,	%o2,	%l0
	mova	%xcc,	%l4,	%l2
	andncc	%i3,	%g7,	%g5
	smulcc	%l3,	0x0641,	%g1
	add	%i6,	0x11A4,	%l5
	edge8n	%o6,	%g3,	%l6
	movne	%icc,	%i4,	%i0
	fpadd16s	%f29,	%f29,	%f3
	xnor	%o0,	%o7,	%l1
	edge16	%i7,	%i5,	%o5
	stw	%g4,	[%l7 + 0x58]
	sdivx	%o1,	0x143E,	%i2
	fcmpgt16	%f16,	%f20,	%o4
	fmovrdgez	%i1,	%f6,	%f14
	sth	%o3,	[%l7 + 0x54]
	fmovrse	%g2,	%f0,	%f12
	edge16l	%g6,	%o2,	%l4
	restore %l2, 0x122A, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g7,	0x1ADB,	%l0
	fmovdneg	%icc,	%f10,	%f4
	ldx	[%l7 + 0x40],	%g5
	stw	%l3,	[%l7 + 0x28]
	mulscc	%i6,	0x02B7,	%g1
	movrgez	%o6,	0x2C3,	%l5
	array16	%g3,	%l6,	%i4
	ldd	[%l7 + 0x10],	%f8
	sub	%o0,	0x10A0,	%i0
	udivx	%l1,	0x07E1,	%i7
	fones	%f31
	movgu	%xcc,	%o7,	%o5
	movrlez	%i5,	%g4,	%o1
	fmovrse	%i2,	%f1,	%f20
	smulcc	%o4,	%i1,	%g2
	movleu	%icc,	%g6,	%o3
	sub	%l4,	0x075F,	%l2
	fmovrdne	%i3,	%f6,	%f2
	movge	%icc,	%o2,	%g7
	movvs	%icc,	%l0,	%l3
	sdiv	%i6,	0x0B72,	%g1
	andcc	%o6,	0x1210,	%l5
	fmovsg	%xcc,	%f31,	%f25
	subc	%g3,	%l6,	%i4
	udiv	%o0,	0x1EB2,	%i0
	sdivcc	%g5,	0x059F,	%l1
	addc	%o7,	%i7,	%o5
	fornot1	%f10,	%f6,	%f30
	ldx	[%l7 + 0x18],	%i5
	movre	%g4,	0x26D,	%o1
	movrgz	%o4,	%i1,	%g2
	fpsub32	%f20,	%f10,	%f10
	fandnot1s	%f13,	%f17,	%f19
	addccc	%i2,	0x19C1,	%g6
	movrgz	%l4,	0x025,	%o3
	ldd	[%l7 + 0x30],	%l2
	fcmpeq32	%f0,	%f2,	%i3
	fmovsa	%icc,	%f30,	%f31
	udivcc	%o2,	0x1138,	%g7
	array16	%l0,	%i6,	%l3
	udiv	%o6,	0x07FB,	%l5
	edge8ln	%g3,	%g1,	%i4
	array8	%o0,	%i0,	%l6
	edge32n	%l1,	%o7,	%g5
	fnot2s	%f30,	%f22
	ld	[%l7 + 0x70],	%f5
	xnorcc	%i7,	0x0B6E,	%i5
	fpmerge	%f10,	%f30,	%f4
	movn	%icc,	%g4,	%o5
	udivx	%o1,	0x197D,	%i1
	mulscc	%o4,	%g2,	%i2
	sll	%g6,	0x05,	%l4
	and	%o3,	0x0BD7,	%i3
	fnot1	%f6,	%f0
	sub	%o2,	0x1D4D,	%l2
	stx	%g7,	[%l7 + 0x18]
	movvs	%xcc,	%l0,	%l3
	edge16ln	%i6,	%l5,	%o6
	movg	%icc,	%g3,	%i4
	movg	%xcc,	%g1,	%o0
	sth	%l6,	[%l7 + 0x62]
	fpack16	%f16,	%f22
	xor	%i0,	0x17A5,	%l1
	mulx	%g5,	%i7,	%i5
	fmovrsgez	%o7,	%f3,	%f25
	ldsb	[%l7 + 0x6D],	%g4
	stx	%o5,	[%l7 + 0x58]
	array8	%o1,	%o4,	%i1
	sra	%g2,	0x18,	%g6
	fcmple32	%f6,	%f28,	%l4
	fnegd	%f8,	%f2
	movrne	%o3,	%i2,	%i3
	fpsub32s	%f10,	%f17,	%f13
	edge8l	%l2,	%g7,	%o2
	fmovsleu	%icc,	%f4,	%f9
	popc	%l0,	%i6
	save %l5, %o6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscs	%icc,	%f17,	%f22
	edge16	%i4,	%g3,	%g1
	movrlz	%o0,	0x10C,	%l6
	fnands	%f18,	%f23,	%f21
	mova	%icc,	%i0,	%g5
	movrgez	%i7,	0x39B,	%l1
	fsrc1s	%f19,	%f2
	edge32n	%i5,	%o7,	%o5
	udivx	%g4,	0x0ABC,	%o1
	srl	%i1,	0x1D,	%g2
	fmovs	%f26,	%f5
	pdist	%f26,	%f24,	%f6
	subcc	%o4,	0x154F,	%g6
	fmul8ulx16	%f2,	%f0,	%f18
	fnot1	%f22,	%f8
	orn	%o3,	0x12C9,	%l4
	xor	%i2,	%l2,	%g7
	edge32	%o2,	%l0,	%i3
	fmul8ulx16	%f30,	%f10,	%f6
	st	%f0,	[%l7 + 0x34]
	mulscc	%l5,	%o6,	%i6
	siam	0x4
	addccc	%i4,	%g3,	%l3
	fcmpeq32	%f2,	%f20,	%g1
	fmovdge	%xcc,	%f13,	%f26
	edge8	%o0,	%l6,	%g5
	andcc	%i0,	%l1,	%i5
	srax	%o7,	%o5,	%i7
	srl	%g4,	0x1A,	%i1
	fnor	%f22,	%f6,	%f18
	udivcc	%o1,	0x0198,	%g2
	nop
	set	0x48, %i6
	ldx	[%l7 + %i6],	%o4
	std	%f8,	[%l7 + 0x68]
	edge16n	%g6,	%l4,	%o3
	or	%i2,	%g7,	%o2
	fpsub32	%f4,	%f26,	%f18
	fmovsne	%icc,	%f11,	%f11
	pdist	%f22,	%f28,	%f6
	movrlz	%l0,	%l2,	%l5
	srax	%o6,	0x0B,	%i3
	fmovrslz	%i4,	%f3,	%f30
	stw	%i6,	[%l7 + 0x10]
	movrne	%g3,	%l3,	%g1
	fmovrdlz	%l6,	%f30,	%f8
	movneg	%xcc,	%g5,	%o0
	movrgz	%i0,	0x0AB,	%i5
	fabsd	%f8,	%f24
	fabss	%f16,	%f17
	movre	%o7,	0x2DC,	%o5
	stw	%l1,	[%l7 + 0x64]
	edge8l	%i7,	%g4,	%o1
	sdivcc	%g2,	0x0225,	%i1
	movcc	%xcc,	%o4,	%g6
	smul	%l4,	%i2,	%o3
	fmovrsgz	%o2,	%f9,	%f18
	movre	%g7,	0x39A,	%l0
	addcc	%l2,	0x0E35,	%o6
	udiv	%l5,	0x0688,	%i4
	movle	%xcc,	%i3,	%g3
	fcmpgt16	%f24,	%f18,	%i6
	fnand	%f26,	%f22,	%f26
	edge16	%l3,	%g1,	%g5
	st	%f21,	[%l7 + 0x34]
	fmovdleu	%icc,	%f11,	%f20
	fcmpeq32	%f0,	%f22,	%l6
	movpos	%xcc,	%i0,	%i5
	smulcc	%o7,	0x1C5B,	%o0
	ldsb	[%l7 + 0x0E],	%o5
	udiv	%l1,	0x0275,	%i7
	sdivcc	%o1,	0x005C,	%g2
	movrgz	%i1,	0x302,	%g4
	save %o4, 0x19CE, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%i2,	%o3,	%g6
	sth	%g7,	[%l7 + 0x08]
	alignaddr	%o2,	%l2,	%l0
	edge8n	%o6,	%i4,	%i3
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	fnand	%f28,	%f16,	%f10
	subcc	%g1,	%g5,	%l3
	movre	%i0,	%l6,	%o7
	sllx	%o0,	%i5,	%l1
	stb	%i7,	[%l7 + 0x3F]
	smulcc	%o5,	0x1319,	%g2
	add	%i1,	0x1A25,	%g4
	orcc	%o1,	0x02AD,	%o4
	movvs	%icc,	%l4,	%i2
	umulcc	%g6,	%g7,	%o2
	ldd	[%l7 + 0x30],	%o2
	movpos	%xcc,	%l2,	%l0
	fmovscs	%icc,	%f7,	%f28
	fmovdle	%icc,	%f11,	%f14
	addc	%i4,	%i3,	%l5
	movcs	%xcc,	%o6,	%i6
	fnot1	%f22,	%f8
	ldsh	[%l7 + 0x16],	%g1
	addc	%g5,	0x1D59,	%l3
	fmovrde	%i0,	%f18,	%f10
	array8	%l6,	%g3,	%o7
	fmovsa	%xcc,	%f19,	%f3
	subc	%o0,	0x1760,	%l1
	edge32ln	%i7,	%i5,	%o5
	edge16n	%i1,	%g2,	%o1
	array32	%o4,	%l4,	%g4
	srax	%g6,	0x07,	%g7
	edge16	%i2,	%o2,	%l2
	edge32	%o3,	%i4,	%l0
	fmovdge	%icc,	%f10,	%f11
	array16	%l5,	%o6,	%i6
	fmovde	%xcc,	%f14,	%f3
	movcs	%icc,	%i3,	%g5
	add	%l3,	0x0F31,	%i0
	fpadd32s	%f28,	%f21,	%f13
	fmovscc	%xcc,	%f18,	%f8
	subccc	%g1,	%g3,	%l6
	sth	%o7,	[%l7 + 0x12]
	fpsub32s	%f15,	%f20,	%f17
	movre	%o0,	0x25E,	%i7
	movcs	%xcc,	%i5,	%o5
	sth	%l1,	[%l7 + 0x7C]
	movl	%xcc,	%g2,	%o1
	andn	%o4,	%i1,	%g4
	edge16ln	%l4,	%g7,	%g6
	sdiv	%o2,	0x09A8,	%i2
	movrne	%o3,	0x341,	%l2
	edge8	%l0,	%i4,	%o6
	alignaddr	%i6,	%i3,	%l5
	sdivx	%l3,	0x1440,	%g5
	fmovsn	%xcc,	%f25,	%f2
	fcmple32	%f26,	%f16,	%g1
	std	%f8,	[%l7 + 0x68]
	fmul8sux16	%f8,	%f6,	%f22
	mova	%xcc,	%i0,	%g3
	movge	%xcc,	%l6,	%o7
	sth	%o0,	[%l7 + 0x34]
	popc	%i7,	%i5
	fornot1	%f14,	%f30,	%f2
	nop
	set	0x28, %l3
	stx	%l1,	[%l7 + %l3]
	edge8ln	%o5,	%o1,	%g2
	sth	%i1,	[%l7 + 0x6A]
	stw	%o4,	[%l7 + 0x38]
	fcmps	%fcc1,	%f0,	%f7
	subcc	%l4,	0x0450,	%g4
	smul	%g7,	%g6,	%i2
	fmovd	%f26,	%f22
	srl	%o2,	%o3,	%l0
	ldd	[%l7 + 0x40],	%f20
	andn	%i4,	%l2,	%i6
	ld	[%l7 + 0x64],	%f9
	fpmerge	%f16,	%f7,	%f24
	sir	0x1A63
	st	%f11,	[%l7 + 0x24]
	movrgz	%o6,	%l5,	%i3
	fmovdvc	%icc,	%f16,	%f21
	addccc	%g5,	0x08AC,	%l3
	edge32	%i0,	%g3,	%g1
	edge32n	%l6,	%o7,	%o0
	movle	%icc,	%i5,	%i7
	edge8	%o5,	%o1,	%l1
	movne	%icc,	%g2,	%o4
	sdivx	%i1,	0x02D0,	%l4
	ldd	[%l7 + 0x40],	%g4
	srl	%g7,	%i2,	%g6
	fmovdl	%icc,	%f22,	%f10
	stx	%o3,	[%l7 + 0x40]
	fornot2s	%f3,	%f25,	%f28
	lduw	[%l7 + 0x68],	%o2
	udiv	%l0,	0x00F3,	%i4
	fxor	%f6,	%f2,	%f14
	sra	%i6,	%l2,	%l5
	sub	%o6,	%g5,	%i3
	addc	%i0,	%l3,	%g1
	edge8n	%l6,	%g3,	%o0
	std	%f20,	[%l7 + 0x30]
	sethi	0x1D2D,	%o7
	movpos	%xcc,	%i5,	%o5
	movge	%xcc,	%i7,	%l1
	fones	%f17
	fmovrdgez	%g2,	%f22,	%f6
	movneg	%xcc,	%o1,	%i1
	sdiv	%l4,	0x18DB,	%g4
	movcs	%icc,	%g7,	%o4
	array8	%g6,	%o3,	%o2
	movgu	%icc,	%l0,	%i2
	alignaddrl	%i4,	%i6,	%l2
	pdist	%f30,	%f28,	%f0
	fornot2	%f12,	%f6,	%f24
	fands	%f10,	%f11,	%f1
	edge32	%l5,	%o6,	%i3
	orncc	%g5,	%i0,	%g1
	udiv	%l3,	0x00C4,	%g3
	stw	%l6,	[%l7 + 0x40]
	edge8n	%o0,	%o7,	%o5
	movcc	%xcc,	%i5,	%i7
	fmovsleu	%icc,	%f22,	%f9
	fmovda	%icc,	%f27,	%f15
	fpsub16	%f10,	%f4,	%f2
	sll	%g2,	%o1,	%i1
	movn	%icc,	%l1,	%g4
	fnot2	%f4,	%f20
	fmul8sux16	%f22,	%f24,	%f24
	fmul8sux16	%f30,	%f28,	%f6
	fmovsa	%xcc,	%f2,	%f9
	movcs	%icc,	%g7,	%l4
	umulcc	%o4,	0x0C01,	%g6
	fnot1s	%f15,	%f16
	xorcc	%o2,	%l0,	%i2
	xnorcc	%i4,	%i6,	%l2
	edge32l	%o3,	%l5,	%i3
	movne	%icc,	%g5,	%o6
	edge32ln	%i0,	%g1,	%l3
	edge16	%l6,	%g3,	%o7
	fmul8x16	%f18,	%f2,	%f30
	edge16ln	%o0,	%o5,	%i5
	fmovdvs	%xcc,	%f0,	%f24
	sllx	%i7,	%o1,	%i1
	xorcc	%g2,	0x0C34,	%g4
	fmovrsne	%l1,	%f2,	%f10
	stx	%g7,	[%l7 + 0x30]
	xorcc	%l4,	%o4,	%g6
	movne	%xcc,	%o2,	%l0
	fpsub16	%f20,	%f24,	%f2
	fsrc1	%f2,	%f14
	move	%xcc,	%i4,	%i2
	fandnot2s	%f16,	%f29,	%f22
	smul	%l2,	%i6,	%l5
	ldd	[%l7 + 0x70],	%f6
	movleu	%icc,	%o3,	%g5
	movle	%icc,	%o6,	%i0
	fmul8ulx16	%f22,	%f22,	%f2
	andncc	%i3,	%g1,	%l6
	fpadd32s	%f4,	%f19,	%f11
	array32	%g3,	%l3,	%o7
	orn	%o0,	%i5,	%i7
	subc	%o1,	%o5,	%i1
	sub	%g4,	%g2,	%g7
	sra	%l1,	0x06,	%l4
	movcc	%xcc,	%g6,	%o4
	fcmple32	%f30,	%f18,	%l0
	movrlz	%i4,	%o2,	%i2
	edge32	%i6,	%l2,	%o3
	sethi	0x1E1C,	%g5
	ldx	[%l7 + 0x50],	%o6
	fmul8x16al	%f23,	%f25,	%f26
	st	%f15,	[%l7 + 0x0C]
	fmovsvs	%icc,	%f3,	%f6
	srax	%l5,	0x17,	%i3
	movge	%xcc,	%g1,	%l6
	fandnot1s	%f11,	%f11,	%f2
	orncc	%i0,	%l3,	%o7
	movvc	%icc,	%g3,	%o0
	movneg	%icc,	%i5,	%i7
	xnorcc	%o1,	0x08AF,	%i1
	fmovsneg	%xcc,	%f15,	%f24
	movn	%xcc,	%g4,	%o5
	srax	%g2,	0x1D,	%l1
	sub	%g7,	%l4,	%o4
	fornot1	%f28,	%f8,	%f28
	save %g6, %l0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i2,	0x135A,	%i6
	stx	%l2,	[%l7 + 0x60]
	movvc	%xcc,	%o3,	%g5
	subcc	%i4,	0x17F3,	%l5
	fmovrdgz	%i3,	%f6,	%f6
	mova	%icc,	%o6,	%l6
	orcc	%g1,	%l3,	%i0
	lduh	[%l7 + 0x5C],	%g3
	subccc	%o0,	0x0296,	%o7
	alignaddr	%i5,	%o1,	%i1
	ldd	[%l7 + 0x50],	%i6
	sdivx	%o5,	0x09EA,	%g2
	alignaddr	%g4,	%g7,	%l1
	fnand	%f22,	%f24,	%f4
	edge32ln	%l4,	%o4,	%g6
	xorcc	%o2,	0x161E,	%i2
	ldx	[%l7 + 0x10],	%l0
	or	%i6,	%o3,	%l2
	movvs	%xcc,	%g5,	%l5
	umul	%i4,	0x0D8C,	%o6
	fmul8ulx16	%f24,	%f20,	%f2
	edge8	%i3,	%l6,	%g1
	fcmple32	%f30,	%f28,	%i0
	edge16	%l3,	%g3,	%o7
	udivcc	%i5,	0x18DF,	%o1
	movle	%icc,	%i1,	%o0
	orcc	%i7,	0x05B3,	%o5
	addc	%g2,	%g4,	%l1
	fnot2	%f14,	%f2
	siam	0x6
	ldub	[%l7 + 0x57],	%g7
	movrne	%o4,	%g6,	%o2
	or	%l4,	%i2,	%i6
	fcmpes	%fcc1,	%f13,	%f21
	nop
	set	0x16, %g1
	lduh	[%l7 + %g1],	%l0
	movcs	%icc,	%l2,	%g5
	lduw	[%l7 + 0x40],	%o3
	fmovdge	%icc,	%f21,	%f27
	lduh	[%l7 + 0x18],	%i4
	alignaddrl	%o6,	%i3,	%l5
	movneg	%xcc,	%g1,	%i0
	st	%f27,	[%l7 + 0x78]
	addcc	%l6,	0x16FE,	%g3
	restore %l3, %i5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%o1,	[%l7 + 0x6C]
	xnor	%i1,	0x1912,	%i7
	movrlz	%o0,	%o5,	%g2
	edge32	%g4,	%g7,	%l1
	movrgz	%o4,	0x0B9,	%g6
	fmovscc	%xcc,	%f12,	%f13
	orncc	%l4,	%o2,	%i6
	movrlez	%l0,	0x203,	%i2
	sethi	0x0BAC,	%g5
	edge16l	%l2,	%i4,	%o3
	orn	%i3,	0x1A2C,	%o6
	fpsub16	%f0,	%f4,	%f28
	movre	%g1,	0x271,	%l5
	movne	%icc,	%i0,	%g3
	array16	%l6,	%l3,	%o7
	sll	%o1,	%i5,	%i1
	movge	%xcc,	%o0,	%o5
	movvc	%icc,	%i7,	%g2
	sth	%g7,	[%l7 + 0x18]
	movvs	%xcc,	%l1,	%o4
	fcmpes	%fcc0,	%f13,	%f27
	movle	%icc,	%g4,	%l4
	ld	[%l7 + 0x78],	%f19
	srl	%o2,	0x1C,	%g6
	lduh	[%l7 + 0x48],	%l0
	ldub	[%l7 + 0x69],	%i6
	movrgez	%i2,	%l2,	%g5
	xnorcc	%o3,	0x0717,	%i4
	fcmple16	%f28,	%f24,	%o6
	sdivcc	%g1,	0x1F68,	%l5
	andcc	%i0,	%i3,	%l6
	subcc	%l3,	0x107B,	%g3
	stw	%o1,	[%l7 + 0x70]
	edge16l	%o7,	%i1,	%o0
	orn	%o5,	0x07CA,	%i5
	srax	%i7,	%g2,	%l1
	xor	%o4,	%g4,	%g7
	movle	%xcc,	%l4,	%o2
	fmuld8sux16	%f28,	%f6,	%f8
	fmovsge	%icc,	%f27,	%f28
	std	%f14,	[%l7 + 0x68]
	ldsh	[%l7 + 0x10],	%g6
	addc	%i6,	%l0,	%l2
	subccc	%g5,	%o3,	%i2
	srl	%o6,	0x07,	%i4
	subccc	%l5,	%i0,	%i3
	mulscc	%l6,	%l3,	%g1
	fmovrslz	%g3,	%f2,	%f17
	mulscc	%o7,	%i1,	%o0
	fpsub32	%f6,	%f26,	%f6
	smulcc	%o1,	0x05C4,	%i5
	movre	%o5,	%i7,	%l1
	mulscc	%g2,	%g4,	%g7
	fmovrde	%l4,	%f24,	%f2
	edge32	%o2,	%g6,	%i6
	movneg	%icc,	%o4,	%l0
	mova	%xcc,	%l2,	%o3
	movrgz	%g5,	%i2,	%o6
	fnot2s	%f6,	%f5
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	ldsb	[%l7 + 0x10],	%i3
	subcc	%i4,	%l3,	%l6
	ld	[%l7 + 0x6C],	%f13
	edge16ln	%g1,	%g3,	%i1
	orcc	%o0,	%o7,	%o1
	sdivx	%o5,	0x0B64,	%i5
	fpadd32	%f6,	%f10,	%f28
	movrgez	%i7,	%g2,	%l1
	movcc	%xcc,	%g4,	%g7
	st	%f6,	[%l7 + 0x38]
	sub	%l4,	0x01E0,	%g6
	movgu	%icc,	%o2,	%i6
	fornot2s	%f25,	%f31,	%f21
	sth	%o4,	[%l7 + 0x36]
	fexpand	%f6,	%f22
	sth	%l2,	[%l7 + 0x46]
	edge16ln	%o3,	%g5,	%l0
	xorcc	%i2,	%o6,	%i0
	fmovdne	%icc,	%f23,	%f23
	mulx	%l5,	0x14B9,	%i4
	save %i3, 0x1D4C, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g1,	%g3,	%l3
	fmul8ulx16	%f10,	%f14,	%f30
	ld	[%l7 + 0x50],	%f25
	movvs	%icc,	%o0,	%i1
	mulx	%o1,	0x01B4,	%o5
	stb	%i5,	[%l7 + 0x16]
	alignaddr	%o7,	%i7,	%l1
	restore %g4, 0x197E, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f15,	%f13
	fnot2s	%f14,	%f6
	addccc	%l4,	%g6,	%g2
	sdivcc	%i6,	0x029F,	%o2
	ldsw	[%l7 + 0x60],	%l2
	stw	%o3,	[%l7 + 0x70]
	smul	%o4,	%l0,	%g5
	edge16l	%i2,	%i0,	%l5
	edge8n	%o6,	%i4,	%l6
	xnorcc	%g1,	%i3,	%g3
	save %o0, 0x15A8, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%o1,	0x05,	%o5
	movvs	%xcc,	%i5,	%i1
	movrne	%o7,	0x285,	%l1
	udiv	%i7,	0x0CE5,	%g4
	udivcc	%l4,	0x17E5,	%g7
	srax	%g6,	%i6,	%o2
	fmovsg	%icc,	%f8,	%f13
	mova	%xcc,	%g2,	%l2
	mulscc	%o3,	%o4,	%l0
	addccc	%i2,	0x1CC9,	%g5
	fmovrsgez	%l5,	%f16,	%f24
	movleu	%xcc,	%o6,	%i0
	srax	%i4,	%l6,	%i3
	movrlez	%g1,	0x270,	%o0
	movle	%icc,	%g3,	%l3
	movn	%xcc,	%o5,	%o1
	movrgz	%i1,	0x05D,	%o7
	st	%f7,	[%l7 + 0x64]
	fmovrdgez	%i5,	%f0,	%f28
	fmovdle	%xcc,	%f2,	%f14
	fmuld8ulx16	%f7,	%f10,	%f16
	movge	%xcc,	%i7,	%l1
	fsrc1	%f20,	%f28
	std	%f6,	[%l7 + 0x68]
	fsrc2s	%f11,	%f29
	movge	%xcc,	%l4,	%g4
	movrgez	%g6,	%g7,	%o2
	edge32l	%i6,	%g2,	%o3
	edge16l	%o4,	%l0,	%l2
	fsrc1s	%f8,	%f21
	alignaddr	%g5,	%i2,	%o6
	sethi	0x1000,	%l5
	xnor	%i4,	%l6,	%i0
	udiv	%g1,	0x08BE,	%o0
	sdivcc	%i3,	0x08C6,	%l3
	edge16	%g3,	%o1,	%o5
	movgu	%xcc,	%i1,	%i5
	edge16l	%o7,	%l1,	%i7
	edge8n	%g4,	%l4,	%g6
	movpos	%xcc,	%o2,	%i6
	and	%g7,	%o3,	%o4
	sra	%l0,	%l2,	%g5
	movge	%icc,	%i2,	%o6
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	array16	%i0,	%g1,	%o0
	fsrc2s	%f5,	%f8
	orncc	%i3,	0x048D,	%l3
	edge16ln	%g3,	%l6,	%o1
	fandnot1	%f6,	%f2,	%f12
	popc	%i1,	%o5
	movleu	%xcc,	%o7,	%l1
	fcmpne32	%f30,	%f8,	%i7
	srax	%i5,	0x1B,	%l4
	fmovrsne	%g4,	%f30,	%f7
	udivcc	%o2,	0x1FB0,	%g6
	fxnor	%f10,	%f8,	%f26
	subc	%i6,	%g7,	%o3
	sdiv	%o4,	0x0AF4,	%l2
	fxnors	%f12,	%f1,	%f17
	ldsh	[%l7 + 0x68],	%l0
	fmovsne	%icc,	%f7,	%f30
	xnorcc	%i2,	%g5,	%o6
	edge8l	%g2,	%i4,	%i0
	std	%f8,	[%l7 + 0x58]
	movrgez	%l5,	%o0,	%g1
	fnot1s	%f20,	%f16
	smulcc	%i3,	0x1282,	%l3
	edge8n	%g3,	%o1,	%l6
	edge16l	%i1,	%o5,	%o7
	edge8l	%i7,	%l1,	%l4
	mulx	%i5,	0x1810,	%g4
	movl	%xcc,	%g6,	%i6
	movl	%xcc,	%g7,	%o2
	udiv	%o4,	0x1BDA,	%l2
	ldub	[%l7 + 0x08],	%l0
	edge16l	%o3,	%g5,	%o6
	stx	%i2,	[%l7 + 0x50]
	ldub	[%l7 + 0x70],	%i4
	umulcc	%i0,	0x0E5A,	%g2
	edge16n	%o0,	%l5,	%g1
	fsrc1	%f22,	%f26
	sir	0x1613
	edge32l	%l3,	%g3,	%i3
	udiv	%o1,	0x1B24,	%i1
	movge	%icc,	%l6,	%o7
	fmovrdgez	%i7,	%f6,	%f30
	movg	%xcc,	%o5,	%l1
	sllx	%l4,	%i5,	%g6
	sdivx	%g4,	0x1651,	%i6
	edge32	%g7,	%o4,	%o2
	movpos	%icc,	%l0,	%o3
	bshuffle	%f8,	%f26,	%f30
	xnor	%l2,	%g5,	%i2
	subc	%o6,	%i4,	%i0
	umul	%g2,	0x1468,	%o0
	stx	%g1,	[%l7 + 0x70]
	fmovspos	%xcc,	%f21,	%f27
	andn	%l3,	0x1473,	%g3
	andncc	%i3,	%l5,	%i1
	save %l6, %o7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o5, 0x10EB, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l1,	%i5,	%l4
	save %g6, %i6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%g4,	%o2,	%o4
	andn	%l0,	%l2,	%g5
	ldsb	[%l7 + 0x20],	%i2
	smulcc	%o3,	0x1263,	%o6
	udiv	%i4,	0x05CC,	%i0
	edge16l	%o0,	%g2,	%g1
	add	%g3,	0x1E1F,	%i3
	umulcc	%l3,	%i1,	%l6
	array16	%l5,	%o7,	%o5
	subc	%i7,	0x09CA,	%o1
	stx	%i5,	[%l7 + 0x48]
	movgu	%xcc,	%l1,	%l4
	srl	%i6,	0x06,	%g7
	sdivcc	%g4,	0x0169,	%o2
	fabss	%f0,	%f20
	sllx	%o4,	0x18,	%l0
	edge16ln	%l2,	%g6,	%i2
	movl	%icc,	%o3,	%o6
	subc	%g5,	%i0,	%o0
	movne	%icc,	%g2,	%i4
	sdiv	%g3,	0x1DE5,	%i3
	move	%icc,	%g1,	%i1
	edge32l	%l6,	%l5,	%l3
	fmovdcs	%icc,	%f14,	%f13
	subcc	%o7,	%i7,	%o5
	stw	%i5,	[%l7 + 0x0C]
	andncc	%l1,	%o1,	%i6
	std	%f0,	[%l7 + 0x78]
	movrgez	%l4,	0x1A8,	%g7
	edge8l	%o2,	%o4,	%g4
	sll	%l0,	0x0C,	%l2
	udiv	%i2,	0x17DC,	%o3
	sethi	0x1A1C,	%o6
	fpsub16s	%f31,	%f5,	%f22
	edge16ln	%g5,	%g6,	%i0
	ldd	[%l7 + 0x60],	%f14
	sll	%o0,	0x01,	%i4
	movrgez	%g2,	%g3,	%i3
	movrne	%g1,	0x081,	%l6
	st	%f24,	[%l7 + 0x1C]
	fcmped	%fcc3,	%f8,	%f2
	sdivcc	%l5,	0x09CE,	%i1
	fandnot2s	%f0,	%f23,	%f1
	movg	%xcc,	%o7,	%i7
	andcc	%l3,	%i5,	%o5
	save %l1, 0x042E, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %i6, 0x0041, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	0x1D,	%o2
	fmovscs	%icc,	%f25,	%f30
	movge	%xcc,	%g4,	%o4
	movrlz	%l0,	%l2,	%i2
	xorcc	%o3,	%g5,	%g6
	movre	%i0,	%o0,	%o6
	std	%f2,	[%l7 + 0x38]
	addcc	%g2,	0x1881,	%i4
	smulcc	%g3,	%g1,	%i3
	edge32n	%l5,	%l6,	%i1
	ld	[%l7 + 0x4C],	%f19
	movg	%xcc,	%i7,	%o7
	ld	[%l7 + 0x2C],	%f0
	movcs	%xcc,	%l3,	%i5
	fornot1	%f30,	%f4,	%f6
	edge16n	%o5,	%l1,	%o1
	edge32ln	%g7,	%i6,	%l4
	stb	%g4,	[%l7 + 0x43]
	movge	%icc,	%o4,	%l0
	fpsub16s	%f30,	%f24,	%f14
	fpack16	%f22,	%f2
	lduw	[%l7 + 0x40],	%o2
	ld	[%l7 + 0x14],	%f31
	ldsh	[%l7 + 0x46],	%i2
	edge32ln	%l2,	%o3,	%g6
	fnors	%f1,	%f15,	%f19
	subccc	%g5,	0x0A1D,	%o0
	sub	%o6,	0x0AF5,	%g2
	xnor	%i0,	0x1E90,	%i4
	movrlez	%g3,	0x15F,	%g1
	fxor	%f8,	%f4,	%f28
	fmovsl	%xcc,	%f4,	%f8
	movvs	%icc,	%l5,	%l6
	movrgez	%i3,	%i1,	%o7
	edge32l	%l3,	%i7,	%o5
	addccc	%i5,	%l1,	%o1
	sdiv	%i6,	0x014E,	%l4
	edge8l	%g4,	%g7,	%l0
	edge16	%o2,	%i2,	%o4
	sir	0x1B11
	fmovsvc	%icc,	%f30,	%f10
	udivx	%o3,	0x08C4,	%l2
	fpack16	%f28,	%f29
	nop
	set	0x50, %o1
	ldsw	[%l7 + %o1],	%g6
	fnot1	%f4,	%f12
	umulcc	%o0,	%g5,	%g2
	edge32ln	%i0,	%i4,	%g3
	xor	%o6,	0x04B5,	%l5
	ldsh	[%l7 + 0x10],	%g1
	fmovsn	%icc,	%f7,	%f25
	orcc	%i3,	0x1843,	%i1
	fnegs	%f4,	%f13
	fpack16	%f8,	%f4
	xorcc	%l6,	0x0072,	%o7
	fmovdvs	%xcc,	%f4,	%f17
	fnot1	%f22,	%f0
	xor	%l3,	%i7,	%i5
	movleu	%icc,	%o5,	%l1
	srl	%o1,	%l4,	%i6
	sllx	%g7,	%l0,	%o2
	movg	%xcc,	%g4,	%o4
	nop
	set	0x58, %i4
	ldx	[%l7 + %i4],	%i2
	fmuld8ulx16	%f26,	%f20,	%f4
	array16	%o3,	%g6,	%l2
	edge32ln	%g5,	%o0,	%i0
	faligndata	%f24,	%f22,	%f6
	st	%f6,	[%l7 + 0x14]
	move	%xcc,	%i4,	%g3
	ldx	[%l7 + 0x70],	%g2
	stx	%o6,	[%l7 + 0x50]
	edge8	%l5,	%i3,	%i1
	sethi	0x14D7,	%l6
	nop
	set	0x0C, %g4
	sth	%o7,	[%l7 + %g4]
	movrgz	%g1,	0x3D1,	%l3
	xnor	%i5,	%i7,	%o5
	stw	%l1,	[%l7 + 0x0C]
	alignaddrl	%l4,	%o1,	%g7
	edge32l	%i6,	%o2,	%l0
	sdiv	%o4,	0x03B6,	%g4
	array16	%i2,	%g6,	%l2
	fsrc1s	%f29,	%f9
	fornot1	%f8,	%f22,	%f12
	ldd	[%l7 + 0x28],	%o2
	orn	%g5,	%o0,	%i4
	ldsh	[%l7 + 0x24],	%g3
	popc	0x0B6E,	%i0
	edge16l	%o6,	%g2,	%i3
	movrne	%l5,	%l6,	%o7
	ldsh	[%l7 + 0x78],	%i1
	ldsh	[%l7 + 0x3C],	%l3
	lduw	[%l7 + 0x58],	%g1
	fmovdpos	%icc,	%f1,	%f0
	smulcc	%i5,	0x15C3,	%o5
	nop
	set	0x50, %i3
	sth	%i7,	[%l7 + %i3]
	mulx	%l1,	%l4,	%g7
	stb	%i6,	[%l7 + 0x15]
	movrlz	%o1,	0x1BC,	%l0
	fcmpes	%fcc3,	%f28,	%f1
	fmul8x16	%f22,	%f10,	%f18
	subcc	%o4,	0x186E,	%g4
	orncc	%i2,	0x08E1,	%o2
	fmul8x16al	%f24,	%f22,	%f6
	mulscc	%g6,	0x02B9,	%o3
	edge32l	%l2,	%g5,	%i4
	popc	0x0062,	%g3
	lduh	[%l7 + 0x4A],	%o0
	movvs	%xcc,	%o6,	%i0
	fmovdcs	%icc,	%f4,	%f24
	movne	%icc,	%i3,	%l5
	movge	%xcc,	%g2,	%o7
	sllx	%l6,	%i1,	%g1
	movcs	%xcc,	%i5,	%l3
	lduh	[%l7 + 0x0E],	%i7
	stb	%o5,	[%l7 + 0x39]
	ldd	[%l7 + 0x50],	%l0
	fnegd	%f10,	%f12
	movvs	%icc,	%g7,	%l4
	ldsh	[%l7 + 0x28],	%i6
	srl	%l0,	0x16,	%o4
	movl	%icc,	%g4,	%o1
	mulx	%o2,	%g6,	%i2
	array32	%o3,	%l2,	%i4
	udivcc	%g5,	0x1F17,	%o0
	movne	%xcc,	%g3,	%o6
	smulcc	%i3,	%l5,	%g2
	edge8	%o7,	%i0,	%i1
	sub	%l6,	0x1886,	%i5
	movcs	%xcc,	%l3,	%g1
	mulx	%o5,	%i7,	%g7
	st	%f29,	[%l7 + 0x34]
	ldd	[%l7 + 0x28],	%f20
	fmovsl	%icc,	%f16,	%f12
	or	%l1,	0x0ACA,	%i6
	stw	%l0,	[%l7 + 0x74]
	lduw	[%l7 + 0x60],	%l4
	movcs	%icc,	%g4,	%o1
	movne	%xcc,	%o4,	%o2
	fcmpeq32	%f12,	%f24,	%g6
	fmovde	%icc,	%f3,	%f26
	mulx	%o3,	%i2,	%i4
	udivcc	%l2,	0x1465,	%o0
	addc	%g5,	%g3,	%o6
	edge16l	%i3,	%g2,	%l5
	sdivcc	%i0,	0x0A11,	%o7
	edge16l	%l6,	%i5,	%l3
	add	%g1,	0x0355,	%i1
	st	%f17,	[%l7 + 0x60]
	srax	%o5,	%i7,	%l1
	movrlez	%i6,	0x1AE,	%g7
	ldsb	[%l7 + 0x20],	%l4
	edge16n	%g4,	%o1,	%o4
	movl	%xcc,	%l0,	%g6
	lduh	[%l7 + 0x70],	%o2
	movg	%xcc,	%o3,	%i4
	edge32	%l2,	%i2,	%o0
	edge8n	%g3,	%g5,	%o6
	fxnor	%f26,	%f12,	%f2
	movle	%xcc,	%g2,	%i3
	save %l5, 0x153D, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%xcc,	%f28,	%f7
	movge	%xcc,	%l6,	%i5
	edge32n	%l3,	%g1,	%i1
	move	%icc,	%o5,	%i0
	ldsw	[%l7 + 0x24],	%i7
	nop
	set	0x08, %i2
	ldub	[%l7 + %i2],	%l1
	add	%i6,	%g7,	%l4
	save %o1, 0x1B34, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f8,	%f28
	edge32n	%o4,	%g6,	%l0
	alignaddrl	%o2,	%i4,	%l2
	std	%f0,	[%l7 + 0x50]
	edge32n	%o3,	%o0,	%g3
	sethi	0x102F,	%i2
	fexpand	%f25,	%f12
	fmovrslz	%o6,	%f7,	%f13
	xorcc	%g5,	0x1711,	%i3
	movleu	%xcc,	%l5,	%g2
	orn	%l6,	%o7,	%l3
	nop
	set	0x7A, %i5
	lduh	[%l7 + %i5],	%g1
	fmovdpos	%icc,	%f0,	%f18
	movpos	%icc,	%i1,	%o5
	fpadd16	%f24,	%f24,	%f26
	sdivx	%i5,	0x10BA,	%i0
	edge8l	%l1,	%i7,	%i6
	udivx	%g7,	0x1ACE,	%l4
	sdiv	%o1,	0x0966,	%g4
	fcmpes	%fcc3,	%f10,	%f31
	movle	%xcc,	%o4,	%g6
	sethi	0x0266,	%l0
	fcmpne32	%f10,	%f16,	%o2
	mova	%xcc,	%i4,	%o3
	ldd	[%l7 + 0x10],	%f30
	addcc	%l2,	0x0BF6,	%o0
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	edge16ln	%g3,	%i3,	%l5
	movleu	%xcc,	%g5,	%l6
	movle	%icc,	%g2,	%o7
	edge16	%l3,	%g1,	%o5
	movl	%icc,	%i1,	%i0
	fmovrdlz	%l1,	%f16,	%f26
	fxors	%f29,	%f1,	%f24
	movg	%icc,	%i7,	%i6
	fnot1	%f0,	%f24
	fcmped	%fcc3,	%f10,	%f18
	orncc	%i5,	0x1BF6,	%g7
	fsrc1	%f22,	%f30
	mova	%icc,	%l4,	%o1
	alignaddr	%g4,	%g6,	%o4
	fsrc2	%f28,	%f4
	fmovdneg	%icc,	%f3,	%f1
	save %o2, %i4, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l0,	0x01E9,	%l2
	ldd	[%l7 + 0x10],	%f22
	nop
	set	0x56, %g5
	ldub	[%l7 + %g5],	%i2
	edge32ln	%o0,	%g3,	%o6
	movvc	%xcc,	%l5,	%i3
	movrlz	%l6,	0x1A6,	%g5
	udivcc	%g2,	0x151C,	%l3
	movrne	%o7,	0x22E,	%o5
	lduh	[%l7 + 0x7A],	%g1
	movrne	%i1,	0x1A9,	%l1
	subc	%i0,	0x0A32,	%i6
	fxnor	%f16,	%f22,	%f24
	movvc	%icc,	%i5,	%g7
	subcc	%i7,	%o1,	%g4
	sdivcc	%l4,	0x02A3,	%g6
	siam	0x6
	movvc	%xcc,	%o2,	%o4
	fnot1	%f16,	%f12
	edge32ln	%i4,	%l0,	%o3
	movle	%icc,	%i2,	%l2
	fandnot1s	%f23,	%f21,	%f8
	fmovsgu	%xcc,	%f8,	%f8
	or	%g3,	0x0D70,	%o0
	array8	%o6,	%l5,	%l6
	movvs	%icc,	%g5,	%g2
	fmovdcs	%icc,	%f31,	%f15
	sub	%i3,	0x10AC,	%l3
	fmovrdgez	%o7,	%f8,	%f6
	sllx	%o5,	0x0A,	%g1
	smul	%i1,	0x1EB4,	%i0
	fcmpne32	%f12,	%f0,	%l1
	movrgez	%i5,	0x34F,	%g7
	addc	%i6,	0x1C18,	%o1
	lduw	[%l7 + 0x08],	%i7
	or	%g4,	%g6,	%o2
	edge8n	%l4,	%i4,	%l0
	ldd	[%l7 + 0x70],	%f2
	udiv	%o3,	0x1E59,	%o4
	std	%f16,	[%l7 + 0x20]
	stx	%i2,	[%l7 + 0x08]
	movre	%g3,	0x3A8,	%o0
	umul	%l2,	0x1C5E,	%o6
	sllx	%l6,	0x17,	%l5
	fmovrsgez	%g5,	%f26,	%f13
	or	%i3,	0x0D70,	%g2
	edge32ln	%l3,	%o5,	%g1
	movle	%xcc,	%i1,	%i0
	fmul8x16	%f31,	%f22,	%f6
	srax	%o7,	0x19,	%i5
	fmovdg	%icc,	%f30,	%f0
	movge	%xcc,	%g7,	%i6
	ldd	[%l7 + 0x50],	%l0
	movcc	%icc,	%o1,	%g4
	edge32l	%i7,	%o2,	%l4
	fsrc2	%f14,	%f16
	edge8l	%i4,	%l0,	%g6
	srax	%o3,	0x00,	%o4
	lduw	[%l7 + 0x30],	%i2
	orn	%g3,	%o0,	%l2
	movrlz	%l6,	%o6,	%g5
	sir	0x0CC4
	ldub	[%l7 + 0x11],	%i3
	move	%icc,	%l5,	%g2
	fpackfix	%f22,	%f31
	addc	%o5,	0x1BBC,	%l3
	movleu	%xcc,	%g1,	%i0
	fmovrse	%o7,	%f17,	%f3
	xnorcc	%i5,	%i1,	%g7
	lduw	[%l7 + 0x6C],	%i6
	edge16n	%l1,	%g4,	%i7
	sir	0x0790
	array16	%o1,	%o2,	%l4
	orncc	%i4,	%l0,	%o3
	restore %o4, %g6, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%o0,	%l2
	fpadd16s	%f27,	%f30,	%f24
	ldd	[%l7 + 0x30],	%f4
	edge8n	%l6,	%i2,	%o6
	movge	%xcc,	%i3,	%l5
	edge8n	%g5,	%o5,	%g2
	andn	%l3,	0x053B,	%g1
	array32	%i0,	%o7,	%i5
	subcc	%g7,	%i6,	%i1
	movvc	%xcc,	%l1,	%i7
	xnorcc	%g4,	%o2,	%o1
	fnot2s	%f14,	%f0
	edge32l	%i4,	%l4,	%l0
	lduw	[%l7 + 0x10],	%o4
	edge8n	%g6,	%g3,	%o0
	orncc	%l2,	0x04D7,	%l6
	smulcc	%i2,	0x1F7F,	%o6
	nop
	set	0x74, %g2
	stb	%i3,	[%l7 + %g2]
	fornot2	%f4,	%f26,	%f26
	add	%l5,	0x0A74,	%o3
	smulcc	%g5,	%o5,	%l3
	ld	[%l7 + 0x6C],	%f24
	udiv	%g1,	0x1860,	%i0
	udivcc	%o7,	0x0553,	%g2
	xnorcc	%g7,	0x0EFB,	%i5
	array8	%i1,	%i6,	%l1
	sethi	0x0E52,	%i7
	fandnot2	%f26,	%f14,	%f12
	fmovsvc	%xcc,	%f6,	%f3
	edge8ln	%g4,	%o2,	%i4
	movne	%icc,	%l4,	%l0
	fmovd	%f12,	%f12
	move	%icc,	%o4,	%o1
	fpadd32s	%f18,	%f20,	%f27
	fmovsvs	%icc,	%f8,	%f0
	sll	%g6,	0x05,	%g3
	movrgez	%o0,	0x3BC,	%l2
	movpos	%icc,	%l6,	%o6
	umulcc	%i3,	%l5,	%i2
	movrlez	%o3,	%o5,	%l3
	fmovsn	%icc,	%f28,	%f6
	nop
	set	0x3E, %l2
	stb	%g1,	[%l7 + %l2]
	move	%icc,	%g5,	%i0
	move	%xcc,	%o7,	%g7
	addcc	%i5,	%i1,	%i6
	fmovdle	%xcc,	%f17,	%f17
	sdivx	%g2,	0x050A,	%i7
	stw	%l1,	[%l7 + 0x64]
	sllx	%g4,	%o2,	%i4
	fmovdneg	%xcc,	%f2,	%f0
	andn	%l4,	0x1458,	%l0
	fmovdgu	%icc,	%f1,	%f16
	edge8l	%o1,	%g6,	%o4
	mova	%icc,	%g3,	%o0
	orcc	%l6,	0x10DD,	%o6
	ldsb	[%l7 + 0x3F],	%i3
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	move	%icc,	%i2,	%o3
	udivx	%o5,	0x0B9D,	%g1
	sth	%l3,	[%l7 + 0x2C]
	andncc	%i0,	%o7,	%g5
	movneg	%icc,	%i5,	%i1
	sub	%g7,	0x06A8,	%g2
	alignaddr	%i7,	%i6,	%g4
	edge8l	%l1,	%o2,	%i4
	edge8n	%l0,	%o1,	%g6
	addcc	%l4,	%o4,	%g3
	array8	%l6,	%o0,	%i3
	xor	%o6,	%l2,	%i2
	udivcc	%o3,	0x19AB,	%l5
	move	%icc,	%g1,	%o5
	fsrc2	%f16,	%f12
	movgu	%icc,	%i0,	%o7
	addc	%l3,	0x171C,	%i5
	movrgz	%g5,	%g7,	%g2
	array16	%i1,	%i7,	%g4
	smul	%i6,	%l1,	%o2
	lduh	[%l7 + 0x78],	%l0
	ldx	[%l7 + 0x70],	%i4
	sdivcc	%g6,	0x14F4,	%l4
	edge16ln	%o4,	%o1,	%g3
	movrlz	%l6,	0x111,	%o0
	ldub	[%l7 + 0x62],	%i3
	movre	%o6,	0x3A2,	%i2
	sub	%o3,	0x1998,	%l2
	fxors	%f27,	%f22,	%f14
	addc	%l5,	0x0836,	%o5
	fmovdn	%xcc,	%f12,	%f1
	sub	%i0,	%o7,	%g1
	movge	%xcc,	%i5,	%g5
	orncc	%g7,	0x0C96,	%l3
	std	%f0,	[%l7 + 0x48]
	movpos	%icc,	%i1,	%g2
	sdivcc	%g4,	0x17EF,	%i6
	stx	%i7,	[%l7 + 0x38]
	mova	%xcc,	%l1,	%l0
	mulscc	%i4,	0x1019,	%o2
	addc	%l4,	0x04EC,	%g6
	edge32l	%o1,	%g3,	%o4
	edge8	%o0,	%l6,	%o6
	orncc	%i2,	0x009F,	%i3
	and	%o3,	%l2,	%o5
	ld	[%l7 + 0x48],	%f6
	udivx	%l5,	0x0449,	%o7
	movpos	%icc,	%i0,	%g1
	fabsd	%f8,	%f14
	xor	%i5,	%g5,	%l3
	fnot2	%f24,	%f0
	movg	%icc,	%g7,	%g2
	smul	%i1,	0x193D,	%i6
	sra	%g4,	%l1,	%i7
	movrlz	%l0,	%i4,	%l4
	andn	%g6,	%o2,	%o1
	fmovrdlez	%o4,	%f18,	%f10
	sra	%o0,	%g3,	%o6
	sdivx	%l6,	0x1474,	%i2
	mulscc	%i3,	0x1437,	%l2
	sethi	0x1204,	%o5
	fmovsge	%icc,	%f30,	%f12
	mulscc	%l5,	0x1223,	%o3
	ldsw	[%l7 + 0x7C],	%o7
	array32	%i0,	%i5,	%g5
	fornot1	%f28,	%f16,	%f6
	alignaddr	%g1,	%l3,	%g7
	movrlez	%g2,	%i6,	%i1
	andn	%l1,	0x0FA7,	%g4
	fmovsge	%xcc,	%f25,	%f24
	fmovsneg	%xcc,	%f21,	%f23
	fmul8ulx16	%f4,	%f20,	%f16
	stx	%i7,	[%l7 + 0x78]
	subc	%i4,	0x0F2B,	%l4
	array16	%l0,	%o2,	%g6
	udiv	%o1,	0x06AF,	%o0
	ld	[%l7 + 0x2C],	%f18
	movl	%xcc,	%g3,	%o6
	srl	%l6,	%i2,	%o4
	udivx	%i3,	0x1464,	%l2
	faligndata	%f22,	%f26,	%f26
	umulcc	%l5,	%o3,	%o5
	andn	%o7,	%i0,	%i5
	edge16n	%g5,	%g1,	%g7
	xnorcc	%l3,	0x03AE,	%g2
	fmovrdlz	%i6,	%f20,	%f6
	xorcc	%l1,	0x149A,	%i1
	edge8	%g4,	%i7,	%i4
	sdiv	%l0,	0x0002,	%o2
	sub	%g6,	%l4,	%o0
	edge32l	%g3,	%o1,	%o6
	fmovs	%f20,	%f6
	edge8ln	%i2,	%o4,	%i3
	fmovsn	%xcc,	%f23,	%f22
	fxnor	%f22,	%f12,	%f28
	mulscc	%l6,	0x00F2,	%l5
	edge8l	%l2,	%o3,	%o7
	fcmps	%fcc0,	%f21,	%f16
	umul	%i0,	%o5,	%g5
	srlx	%i5,	%g7,	%l3
	nop
	set	0x28, %o6
	ldsh	[%l7 + %o6],	%g2
	movpos	%icc,	%g1,	%i6
	fmovrsgz	%l1,	%f20,	%f10
	andncc	%i1,	%i7,	%i4
	andncc	%g4,	%o2,	%g6
	fcmpne16	%f2,	%f4,	%l4
	movge	%icc,	%l0,	%g3
	movg	%xcc,	%o0,	%o6
	fmovdvc	%icc,	%f28,	%f4
	fnot1s	%f1,	%f26
	and	%i2,	%o1,	%i3
	ldd	[%l7 + 0x20],	%i6
	fmovrsgez	%l5,	%f5,	%f20
	restore %l2, 0x151E, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%o7,	%i0
	srlx	%o3,	0x17,	%o5
	fmovsl	%icc,	%f17,	%f29
	udiv	%i5,	0x05DD,	%g7
	and	%l3,	0x1533,	%g5
	lduh	[%l7 + 0x1C],	%g2
	movcc	%xcc,	%i6,	%l1
	udivcc	%i1,	0x07BB,	%g1
	fandnot1	%f4,	%f30,	%f30
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	movleu	%xcc,	%i7,	%g6
	sllx	%l4,	0x1F,	%o2
	ldub	[%l7 + 0x44],	%g3
	faligndata	%f16,	%f6,	%f24
	edge32ln	%o0,	%o6,	%l0
	add	%i2,	0x0432,	%i3
	fnor	%f16,	%f30,	%f30
	alignaddr	%o1,	%l6,	%l5
	fabss	%f4,	%f13
	fmovrse	%o4,	%f30,	%f14
	movvc	%xcc,	%o7,	%l2
	xnorcc	%i0,	0x1B12,	%o5
	movrlez	%i5,	%g7,	%o3
	fzero	%f30
	fmovsleu	%xcc,	%f27,	%f16
	array8	%l3,	%g5,	%g2
	sll	%l1,	0x0F,	%i6
	sethi	0x00ED,	%g1
	restore %i4, %i1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x78],	%f14
	lduh	[%l7 + 0x1E],	%g6
	edge8l	%g4,	%l4,	%g3
	andncc	%o0,	%o6,	%o2
	fmovdleu	%icc,	%f17,	%f15
	fornot1s	%f15,	%f12,	%f19
	fmovda	%xcc,	%f24,	%f29
	mova	%icc,	%i2,	%l0
	addcc	%o1,	0x0B75,	%l6
	edge16n	%l5,	%o4,	%o7
	fmovsn	%icc,	%f5,	%f26
	fnegs	%f7,	%f20
	fnot1	%f22,	%f10
	mulscc	%l2,	%i0,	%o5
	alignaddr	%i5,	%i3,	%g7
	fmovrde	%l3,	%f12,	%f24
	fxors	%f8,	%f19,	%f13
	srlx	%g5,	%g2,	%l1
	popc	0x0F03,	%o3
	movrlez	%g1,	%i4,	%i6
	andncc	%i1,	%i7,	%g4
	fmovdn	%xcc,	%f24,	%f7
	alignaddr	%l4,	%g3,	%g6
	fcmpeq16	%f22,	%f10,	%o0
	edge16n	%o6,	%o2,	%i2
	fcmpd	%fcc2,	%f6,	%f24
	fcmpgt16	%f8,	%f14,	%o1
	array32	%l0,	%l5,	%l6
	addcc	%o4,	0x1E94,	%l2
	fmovsgu	%xcc,	%f4,	%f1
	movvs	%icc,	%i0,	%o7
	stw	%o5,	[%l7 + 0x1C]
	ldd	[%l7 + 0x50],	%f12
	st	%f6,	[%l7 + 0x74]
	xnor	%i5,	0x1808,	%i3
	sllx	%l3,	0x19,	%g5
	orcc	%g7,	%l1,	%g2
	stb	%g1,	[%l7 + 0x15]
	save %i4, 0x0447, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f6,	%f21
	ldsb	[%l7 + 0x0F],	%i1
	edge8	%i7,	%g4,	%l4
	sdivcc	%g3,	0x077C,	%o3
	movneg	%xcc,	%o0,	%g6
	sdivx	%o6,	0x0057,	%o2
	smul	%i2,	0x0D33,	%o1
	orn	%l5,	0x0E95,	%l6
	sll	%o4,	0x03,	%l0
	sra	%l2,	0x1B,	%o7
	srax	%i0,	%i5,	%i3
	orn	%o5,	%l3,	%g7
	std	%f4,	[%l7 + 0x50]
	fmul8x16au	%f0,	%f7,	%f30
	movcs	%icc,	%l1,	%g5
	subc	%g2,	%i4,	%i6
	fzero	%f24
	fmovsl	%icc,	%f20,	%f23
	edge16	%g1,	%i1,	%i7
	fone	%f26
	fmovdge	%icc,	%f8,	%f4
	sra	%l4,	0x07,	%g3
	array8	%g4,	%o0,	%g6
	movg	%xcc,	%o6,	%o2
	movcs	%xcc,	%i2,	%o3
	movle	%xcc,	%o1,	%l5
	udivcc	%o4,	0x0EC4,	%l0
	mulx	%l2,	%l6,	%i0
	edge32l	%o7,	%i5,	%i3
	alignaddrl	%o5,	%l3,	%l1
	orncc	%g7,	%g5,	%g2
	edge32	%i6,	%i4,	%g1
	edge8	%i1,	%i7,	%g3
	udiv	%l4,	0x1DAC,	%o0
	lduh	[%l7 + 0x38],	%g4
	umul	%o6,	0x1440,	%g6
	subccc	%i2,	%o3,	%o1
	alignaddr	%l5,	%o4,	%l0
	popc	0x0CA2,	%o2
	siam	0x3
	fmovsa	%xcc,	%f30,	%f5
	umul	%l2,	0x0A0A,	%l6
	stw	%i0,	[%l7 + 0x74]
	orn	%o7,	%i5,	%o5
	fxors	%f5,	%f28,	%f6
	edge32n	%l3,	%i3,	%g7
	xnor	%l1,	%g2,	%g5
	ldub	[%l7 + 0x63],	%i6
	edge32n	%g1,	%i1,	%i7
	ld	[%l7 + 0x44],	%f22
	movn	%xcc,	%g3,	%i4
	edge8l	%o0,	%g4,	%l4
	fcmple16	%f12,	%f16,	%g6
	edge8	%i2,	%o6,	%o1
	subc	%l5,	0x1DAB,	%o3
	fpsub32s	%f12,	%f22,	%f16
	ldsh	[%l7 + 0x24],	%o4
	edge16l	%o2,	%l0,	%l2
	stx	%i0,	[%l7 + 0x20]
	fmovs	%f22,	%f24
	movpos	%xcc,	%l6,	%o7
	srlx	%o5,	0x09,	%i5
	umul	%l3,	%i3,	%l1
	fmovrdgez	%g7,	%f18,	%f0
	movrgez	%g2,	0x08F,	%g5
	fornot1	%f8,	%f26,	%f4
	sethi	0x0292,	%g1
	movrgz	%i1,	0x333,	%i7
	movleu	%xcc,	%g3,	%i4
	addcc	%o0,	%g4,	%i6
	edge8	%l4,	%g6,	%o6
	fcmpne32	%f28,	%f28,	%o1
	movl	%icc,	%l5,	%o3
	fcmpgt16	%f12,	%f22,	%o4
	fnegd	%f30,	%f18
	fmovdcs	%xcc,	%f8,	%f25
	edge8	%i2,	%l0,	%l2
	orcc	%i0,	%o2,	%o7
	edge16l	%l6,	%o5,	%i5
	edge16n	%i3,	%l1,	%g7
	edge32l	%l3,	%g2,	%g1
	alignaddr	%g5,	%i1,	%g3
	movrne	%i7,	0x30B,	%o0
	fmul8sux16	%f24,	%f26,	%f24
	orn	%i4,	%i6,	%l4
	edge16ln	%g6,	%o6,	%g4
	udivcc	%o1,	0x0F57,	%o3
	sth	%l5,	[%l7 + 0x0A]
	sdiv	%i2,	0x190F,	%l0
	orcc	%o4,	0x0F46,	%l2
	subc	%o2,	0x1CFA,	%i0
	edge32n	%l6,	%o5,	%o7
	fmovrslez	%i5,	%f22,	%f1
	srl	%l1,	0x0B,	%g7
	fmovrde	%l3,	%f20,	%f6
	lduw	[%l7 + 0x0C],	%g2
	or	%i3,	%g5,	%g1
	fmovdg	%xcc,	%f27,	%f2
	fornot1s	%f22,	%f4,	%f19
	fnot2s	%f12,	%f26
	ldsw	[%l7 + 0x48],	%i1
	edge32n	%i7,	%o0,	%i4
	movn	%icc,	%g3,	%l4
	fnegd	%f30,	%f20
	fmul8sux16	%f26,	%f24,	%f16
	fmul8sux16	%f10,	%f10,	%f0
	subccc	%g6,	%o6,	%i6
	udiv	%o1,	0x12B0,	%g4
	movne	%icc,	%l5,	%o3
	std	%f8,	[%l7 + 0x38]
	edge8	%l0,	%o4,	%l2
	edge16l	%i2,	%o2,	%i0
	ldsb	[%l7 + 0x5C],	%o5
	smul	%o7,	%i5,	%l6
	andn	%g7,	0x0E9A,	%l1
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	addc	%g5,	0x1B24,	%g2
	udivx	%i1,	0x0271,	%g1
	bshuffle	%f12,	%f4,	%f14
	ld	[%l7 + 0x24],	%f15
	sdivx	%o0,	0x0A03,	%i7
	srax	%g3,	0x18,	%i4
	sub	%l4,	%g6,	%i6
	subcc	%o6,	0x0843,	%g4
	movrlz	%l5,	0x210,	%o1
	udiv	%l0,	0x1307,	%o4
	fnands	%f0,	%f23,	%f27
	alignaddr	%o3,	%i2,	%l2
	edge16n	%o2,	%i0,	%o7
	umul	%i5,	0x13A5,	%o5
	move	%icc,	%l6,	%l1
	andncc	%g7,	%i3,	%g5
	andn	%g2,	%i1,	%l3
	udiv	%g1,	0x1D9A,	%o0
	movneg	%xcc,	%i7,	%g3
	sdiv	%l4,	0x15F3,	%i4
	fabsd	%f12,	%f2
	popc	%i6,	%o6
	movne	%xcc,	%g4,	%g6
	edge32n	%l5,	%o1,	%o4
	and	%o3,	0x0D7B,	%l0
	ldd	[%l7 + 0x10],	%f12
	movcc	%xcc,	%i2,	%l2
	andcc	%o2,	%i0,	%o7
	or	%o5,	%i5,	%l6
	std	%f4,	[%l7 + 0x28]
	ldsw	[%l7 + 0x4C],	%l1
	edge16	%i3,	%g7,	%g2
	fmovdcs	%xcc,	%f11,	%f9
	nop
	set	0x52, %l0
	lduh	[%l7 + %l0],	%i1
	stb	%g5,	[%l7 + 0x5B]
	save %g1, 0x0C8F, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%i7,	%g3,	%l4
	mulx	%o0,	%i4,	%i6
	movg	%icc,	%o6,	%g6
	srax	%l5,	0x1E,	%g4
	movg	%xcc,	%o4,	%o3
	movrne	%l0,	%i2,	%o1
	smulcc	%o2,	0x16B2,	%l2
	fmovrdlz	%i0,	%f10,	%f14
	lduw	[%l7 + 0x74],	%o7
	srax	%o5,	0x10,	%i5
	lduw	[%l7 + 0x30],	%l1
	andcc	%l6,	%g7,	%i3
	edge16l	%i1,	%g5,	%g1
	srl	%g2,	0x08,	%l3
	fmovrdne	%i7,	%f6,	%f16
	movvs	%xcc,	%l4,	%g3
	edge16l	%i4,	%o0,	%o6
	std	%f26,	[%l7 + 0x68]
	fpadd16	%f18,	%f0,	%f30
	fnot1s	%f0,	%f22
	add	%i6,	0x1B7F,	%g6
	andcc	%l5,	%g4,	%o4
	umulcc	%o3,	0x1365,	%i2
	movre	%l0,	0x151,	%o2
	srl	%l2,	%i0,	%o7
	addcc	%o1,	0x1340,	%o5
	movleu	%xcc,	%i5,	%l6
	ldx	[%l7 + 0x78],	%g7
	umulcc	%l1,	%i3,	%i1
	fabss	%f31,	%f27
	fpsub32s	%f17,	%f4,	%f9
	nop
	set	0x26, %i7
	ldsb	[%l7 + %i7],	%g1
	fornot1	%f26,	%f4,	%f24
	fmovrse	%g5,	%f20,	%f26
	alignaddrl	%g2,	%l3,	%l4
	movrne	%i7,	0x250,	%i4
	sra	%g3,	%o0,	%o6
	movre	%g6,	0x137,	%l5
	addc	%i6,	%o4,	%g4
	fpackfix	%f8,	%f26
	udiv	%o3,	0x09E3,	%l0
	xor	%i2,	%o2,	%i0
	ldsh	[%l7 + 0x72],	%o7
	mulscc	%o1,	%o5,	%i5
	fmul8x16	%f2,	%f16,	%f16
	popc	%l2,	%g7
	sub	%l6,	%i3,	%l1
	movn	%icc,	%g1,	%g5
	umulcc	%g2,	0x0891,	%l3
	subc	%l4,	%i1,	%i7
	movrlz	%g3,	%o0,	%o6
	stb	%g6,	[%l7 + 0x4B]
	xorcc	%i4,	0x1007,	%i6
	fnand	%f28,	%f16,	%f16
	fsrc2	%f24,	%f12
	addc	%l5,	0x05A6,	%g4
	movrne	%o3,	%l0,	%i2
	fmovse	%xcc,	%f0,	%f18
	smul	%o2,	%i0,	%o7
	movrgez	%o4,	%o5,	%o1
	movvc	%icc,	%i5,	%l2
	sub	%g7,	%i3,	%l6
	fmovdvs	%icc,	%f11,	%f3
	ldsb	[%l7 + 0x6A],	%g1
	popc	0x0941,	%l1
	udivx	%g5,	0x0066,	%l3
	ldd	[%l7 + 0x58],	%f10
	ldsh	[%l7 + 0x5C],	%l4
	xorcc	%g2,	0x1DE8,	%i7
	stx	%g3,	[%l7 + 0x28]
	fnor	%f8,	%f14,	%f28
	fabss	%f30,	%f13
	orcc	%o0,	%i1,	%g6
	st	%f31,	[%l7 + 0x10]
	srax	%o6,	0x12,	%i6
	sdivcc	%i4,	0x0FE0,	%l5
	edge32ln	%g4,	%l0,	%o3
	andcc	%i2,	0x11CD,	%o2
	movrgez	%i0,	0x353,	%o7
	nop
	set	0x79, %o5
	ldsb	[%l7 + %o5],	%o5
	movvc	%xcc,	%o4,	%i5
	orn	%l2,	%o1,	%i3
	ldx	[%l7 + 0x58],	%g7
	sllx	%g1,	0x05,	%l6
	ldx	[%l7 + 0x30],	%l1
	fornot1	%f14,	%f26,	%f26
	srlx	%g5,	0x1F,	%l4
	fmovrdgz	%g2,	%f16,	%f4
	movvc	%icc,	%i7,	%l3
	mulscc	%g3,	0x00D1,	%o0
	edge32	%g6,	%i1,	%o6
	pdist	%f2,	%f0,	%f8
	movne	%xcc,	%i4,	%i6
	movcc	%icc,	%l5,	%g4
	array16	%l0,	%i2,	%o3
	fmuld8sux16	%f5,	%f29,	%f26
	udivx	%i0,	0x0E68,	%o7
	movrlez	%o2,	%o5,	%o4
	st	%f3,	[%l7 + 0x50]
	sra	%i5,	%l2,	%o1
	subccc	%i3,	0x08CD,	%g7
	alignaddr	%l6,	%g1,	%l1
	sub	%l4,	%g5,	%g2
	edge8n	%i7,	%g3,	%l3
	fnot2s	%f21,	%f5
	lduh	[%l7 + 0x7E],	%o0
	save %i1, 0x03AE, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x52],	%i4
	fmovdcc	%icc,	%f14,	%f3
	stx	%i6,	[%l7 + 0x48]
	nop
	set	0x28, %g3
	std	%f16,	[%l7 + %g3]
	restore %l5, %g4, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsa	%icc,	%f0,	%f4
	fcmpd	%fcc1,	%f8,	%f30
	bshuffle	%f0,	%f8,	%f20
	edge16ln	%l0,	%o3,	%i0
	movn	%xcc,	%o7,	%o2
	edge16ln	%i2,	%o4,	%o5
	umulcc	%i5,	%l2,	%o1
	fmovse	%xcc,	%f21,	%f8
	sdivcc	%g7,	0x0793,	%l6
	mova	%icc,	%i3,	%g1
	fornot1s	%f26,	%f23,	%f28
	ldub	[%l7 + 0x14],	%l1
	andncc	%g5,	%l4,	%g2
	xnor	%i7,	%g3,	%o0
	subc	%l3,	%g6,	%i4
	movcc	%icc,	%i6,	%l5
	movcc	%xcc,	%i1,	%g4
	smul	%l0,	%o3,	%o6
	addccc	%i0,	0x1779,	%o2
	fpsub32s	%f20,	%f24,	%f6
	movge	%icc,	%i2,	%o7
	subcc	%o5,	%i5,	%o4
	popc	0x07E6,	%o1
	alignaddrl	%g7,	%l2,	%l6
	fnot1s	%f30,	%f18
	srl	%i3,	0x18,	%g1
	addc	%g5,	0x1F12,	%l4
	fpmerge	%f8,	%f13,	%f10
	fand	%f26,	%f28,	%f2
	fcmpeq16	%f22,	%f0,	%g2
	ldsh	[%l7 + 0x3E],	%l1
	andn	%g3,	%i7,	%o0
	srax	%g6,	%l3,	%i4
	stb	%i6,	[%l7 + 0x60]
	edge8l	%i1,	%g4,	%l5
	udivcc	%l0,	0x1DA4,	%o3
	subcc	%o6,	%i0,	%i2
	std	%f0,	[%l7 + 0x18]
	movvc	%icc,	%o7,	%o2
	sdivcc	%i5,	0x0E33,	%o4
	ldd	[%l7 + 0x40],	%o4
	or	%o1,	%l2,	%l6
	orn	%i3,	0x03A8,	%g7
	movgu	%icc,	%g5,	%g1
	or	%l4,	%l1,	%g2
	popc	0x0ADC,	%i7
	lduh	[%l7 + 0x58],	%g3
	save %g6, %o0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l3,	0x1598,	%i1
	subc	%i6,	0x0324,	%g4
	fsrc2	%f14,	%f24
	fxnor	%f12,	%f12,	%f10
	movrgez	%l5,	0x2BA,	%o3
	xnorcc	%l0,	0x1661,	%o6
	fxor	%f20,	%f30,	%f22
	fmovdgu	%icc,	%f4,	%f20
	array8	%i0,	%i2,	%o7
	xnorcc	%o2,	%i5,	%o5
	ldsb	[%l7 + 0x4F],	%o1
	lduw	[%l7 + 0x68],	%o4
	save %l6, %i3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l2,	%g1
	xor	%g5,	%l4,	%g2
	movpos	%icc,	%i7,	%l1
	move	%icc,	%g6,	%o0
	andncc	%i4,	%g3,	%i1
	sra	%l3,	0x18,	%i6
	fmovscs	%xcc,	%f31,	%f6
	umul	%l5,	0x0C42,	%o3
	stb	%g4,	[%l7 + 0x7C]
	array8	%l0,	%i0,	%i2
	movg	%xcc,	%o7,	%o2
	edge32l	%o6,	%o5,	%o1
	ldub	[%l7 + 0x6A],	%i5
	fmovdn	%xcc,	%f3,	%f2
	array32	%l6,	%i3,	%g7
	umulcc	%l2,	0x1E3F,	%o4
	array32	%g5,	%l4,	%g1
	fornot1s	%f27,	%f0,	%f22
	sir	0x1501
	sth	%i7,	[%l7 + 0x42]
	udivcc	%l1,	0x0346,	%g6
	edge32n	%o0,	%g2,	%i4
	orcc	%i1,	0x1786,	%l3
	stb	%i6,	[%l7 + 0x21]
	sra	%g3,	0x1D,	%l5
	sra	%o3,	%l0,	%i0
	udivx	%g4,	0x0636,	%o7
	fpsub16s	%f0,	%f20,	%f8
	edge8ln	%o2,	%i2,	%o6
	fmovsvs	%xcc,	%f2,	%f1
	edge16	%o1,	%i5,	%o5
	orncc	%l6,	%g7,	%l2
	fmovsle	%icc,	%f8,	%f16
	fexpand	%f29,	%f4
	array8	%i3,	%g5,	%o4
	fpack32	%f24,	%f28,	%f10
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	umul	%g6,	0x1DCB,	%o0
	sth	%l4,	[%l7 + 0x4A]
	movcc	%xcc,	%g2,	%i4
	sir	0x1380
	fxor	%f2,	%f26,	%f10
	subcc	%l3,	%i6,	%i1
	stw	%l5,	[%l7 + 0x6C]
	srlx	%o3,	%g3,	%l0
	mulx	%g4,	0x0420,	%i0
	fone	%f6
	movg	%icc,	%o2,	%o7
	orn	%i2,	0x004F,	%o1
	udivcc	%o6,	0x1029,	%o5
	movn	%icc,	%i5,	%g7
	stb	%l6,	[%l7 + 0x37]
	stw	%l2,	[%l7 + 0x44]
	addc	%g5,	%o4,	%i3
	or	%g1,	%i7,	%g6
	smul	%o0,	0x1138,	%l1
	fmovsleu	%icc,	%f2,	%f27
	movrgez	%g2,	%i4,	%l3
	ld	[%l7 + 0x70],	%f17
	fcmpne32	%f26,	%f16,	%l4
	sra	%i1,	0x0E,	%i6
	addccc	%l5,	%o3,	%g3
	fmovrsne	%g4,	%f1,	%f31
	movrlz	%l0,	0x242,	%i0
	lduw	[%l7 + 0x68],	%o7
	srlx	%i2,	0x0C,	%o1
	movrgez	%o6,	%o2,	%o5
	array16	%i5,	%l6,	%g7
	udivx	%l2,	0x0FDD,	%g5
	fmovdne	%xcc,	%f6,	%f29
	edge16ln	%i3,	%g1,	%o4
	edge16ln	%g6,	%o0,	%l1
	movg	%xcc,	%i7,	%i4
	std	%f8,	[%l7 + 0x38]
	fmovdpos	%xcc,	%f9,	%f13
	andn	%g2,	0x0B86,	%l3
	fands	%f29,	%f10,	%f5
	stw	%i1,	[%l7 + 0x48]
	fmovsn	%icc,	%f18,	%f5
	xnorcc	%i6,	0x0BCF,	%l4
	sir	0x05E5
	edge32n	%l5,	%o3,	%g3
	mova	%xcc,	%g4,	%i0
	or	%o7,	%l0,	%i2
	stw	%o1,	[%l7 + 0x48]
	std	%f20,	[%l7 + 0x18]
	andncc	%o6,	%o2,	%i5
	umulcc	%o5,	%g7,	%l2
	edge16l	%g5,	%l6,	%i3
	xnorcc	%g1,	0x1C58,	%g6
	movgu	%xcc,	%o0,	%l1
	ldx	[%l7 + 0x68],	%o4
	or	%i7,	0x19E7,	%g2
	srax	%i4,	0x05,	%l3
	srlx	%i1,	%l4,	%l5
	movrne	%i6,	%g3,	%g4
	edge8ln	%i0,	%o3,	%o7
	xnor	%i2,	0x0F78,	%l0
	nop
	set	0x31, %o0
	ldub	[%l7 + %o0],	%o1
	fpsub32s	%f15,	%f7,	%f21
	umulcc	%o6,	0x084F,	%i5
	fmovrdgez	%o2,	%f2,	%f12
	ldsb	[%l7 + 0x0E],	%g7
	fmuld8ulx16	%f31,	%f1,	%f12
	xnor	%l2,	%o5,	%l6
	movne	%xcc,	%i3,	%g5
	array32	%g1,	%o0,	%g6
	edge32	%o4,	%i7,	%l1
	movleu	%xcc,	%i4,	%g2
	subc	%l3,	0x1996,	%l4
	ldd	[%l7 + 0x18],	%f2
	andncc	%l5,	%i6,	%i1
	sth	%g4,	[%l7 + 0x2A]
	edge32	%i0,	%o3,	%g3
	fcmpeq32	%f18,	%f16,	%o7
	ldsb	[%l7 + 0x67],	%l0
	alignaddr	%i2,	%o6,	%o1
	mulscc	%o2,	0x1D95,	%i5
	movrlez	%g7,	0x2DB,	%l2
	ldd	[%l7 + 0x50],	%i6
	stx	%i3,	[%l7 + 0x60]
	fpadd16s	%f19,	%f20,	%f3
	std	%f4,	[%l7 + 0x08]
	movpos	%xcc,	%g5,	%g1
	fmovdge	%xcc,	%f18,	%f15
	movcs	%xcc,	%o5,	%g6
	xnor	%o4,	0x0A86,	%i7
	lduh	[%l7 + 0x14],	%o0
	or	%l1,	%g2,	%l3
	array16	%i4,	%l4,	%l5
	udivx	%i6,	0x04C8,	%g4
	andcc	%i1,	0x1455,	%o3
	sra	%g3,	%o7,	%i0
	mova	%icc,	%l0,	%i2
	fmovdneg	%xcc,	%f24,	%f13
	movrne	%o6,	%o2,	%o1
	save %i5, %l2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x1694
	fands	%f22,	%f26,	%f4
	movrgez	%g7,	%g5,	%i3
	fmuld8sux16	%f26,	%f14,	%f26
	addc	%g1,	0x1741,	%g6
	movn	%icc,	%o4,	%o5
	xorcc	%o0,	%i7,	%g2
	movn	%icc,	%l3,	%i4
	movneg	%xcc,	%l4,	%l1
	fmovsneg	%xcc,	%f16,	%f22
	edge16	%i6,	%l5,	%g4
	stw	%i1,	[%l7 + 0x20]
	movg	%icc,	%g3,	%o3
	addccc	%i0,	%o7,	%l0
	xor	%o6,	0x1324,	%o2
	fmovrslz	%o1,	%f0,	%f30
	srax	%i2,	%l2,	%l6
	stb	%i5,	[%l7 + 0x3E]
	array8	%g7,	%i3,	%g5
	orncc	%g6,	%o4,	%o5
	array16	%o0,	%g1,	%g2
	fcmple32	%f2,	%f10,	%l3
	fmovsle	%xcc,	%f27,	%f26
	popc	0x19E2,	%i4
	movcs	%icc,	%i7,	%l4
	ldsb	[%l7 + 0x71],	%l1
	ldub	[%l7 + 0x1B],	%l5
	edge8	%g4,	%i6,	%g3
	edge8ln	%i1,	%i0,	%o7
	xnor	%l0,	%o3,	%o6
	fmovdgu	%icc,	%f23,	%f8
	movrlz	%o1,	%o2,	%l2
	fones	%f24
	sth	%i2,	[%l7 + 0x40]
	addc	%i5,	%g7,	%i3
	ldsb	[%l7 + 0x54],	%g5
	sub	%g6,	%o4,	%o5
	edge8n	%l6,	%g1,	%g2
	orcc	%l3,	%i4,	%o0
	movre	%l4,	%l1,	%l5
	ldsh	[%l7 + 0x62],	%i7
	fmovsneg	%icc,	%f16,	%f8
	mova	%icc,	%i6,	%g3
	movrgz	%g4,	0x0DA,	%i0
	edge16	%o7,	%l0,	%i1
	lduh	[%l7 + 0x3E],	%o3
	fzeros	%f5
	fsrc2s	%f22,	%f7
	alignaddr	%o1,	%o6,	%l2
	fmovrsne	%o2,	%f7,	%f9
	stx	%i5,	[%l7 + 0x30]
	popc	%g7,	%i3
	fcmpeq32	%f4,	%f8,	%i2
	stb	%g6,	[%l7 + 0x64]
	ldd	[%l7 + 0x08],	%g4
	mulx	%o4,	0x1631,	%o5
	lduh	[%l7 + 0x0C],	%g1
	alignaddr	%l6,	%l3,	%g2
	edge32l	%i4,	%l4,	%o0
	edge16n	%l5,	%l1,	%i6
	edge32l	%g3,	%g4,	%i7
	ldsw	[%l7 + 0x6C],	%o7
	fmul8ulx16	%f8,	%f24,	%f28
	mova	%xcc,	%l0,	%i1
	fandnot2	%f8,	%f22,	%f6
	srl	%i0,	%o1,	%o3
	mova	%icc,	%o6,	%l2
	orcc	%o2,	%g7,	%i5
	restore %i2, %g6, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o4,	%o5,	%g5
	alignaddrl	%g1,	%l3,	%g2
	edge32n	%i4,	%l6,	%l4
	edge8ln	%l5,	%l1,	%o0
	movrgez	%i6,	%g4,	%i7
	fmovrdlez	%g3,	%f10,	%f4
	movre	%o7,	0x034,	%i1
	edge32n	%i0,	%o1,	%l0
	fcmpne16	%f14,	%f14,	%o6
	movge	%icc,	%o3,	%l2
	fmovsa	%icc,	%f1,	%f28
	movrlz	%g7,	0x278,	%i5
	movrgz	%o2,	0x183,	%i2
	movre	%i3,	0x068,	%o4
	addc	%o5,	0x0506,	%g6
	fmovscs	%icc,	%f10,	%f0
	orncc	%g1,	0x0555,	%g5
	popc	0x1B87,	%g2
	sethi	0x1DE1,	%i4
	mova	%xcc,	%l3,	%l4
	fcmpeq16	%f30,	%f4,	%l6
	movle	%icc,	%l1,	%l5
	addccc	%o0,	%g4,	%i6
	move	%icc,	%g3,	%i7
	alignaddrl	%i1,	%i0,	%o1
	nop
	set	0x60, %i0
	ldd	[%l7 + %i0],	%f18
	edge8n	%l0,	%o6,	%o3
	subcc	%l2,	0x0A22,	%g7
	movrlez	%o7,	0x29D,	%i5
	array32	%o2,	%i2,	%o4
	move	%icc,	%i3,	%o5
	edge8ln	%g6,	%g5,	%g1
	sethi	0x0F6D,	%g2
	andn	%i4,	%l3,	%l6
	addcc	%l1,	%l5,	%l4
	edge32ln	%o0,	%i6,	%g4
	fones	%f16
	fmovdvc	%xcc,	%f5,	%f8
	fxnor	%f20,	%f22,	%f10
	umulcc	%i7,	0x1C34,	%g3
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	movre	%o6,	%i0,	%l2
	edge32	%o3,	%o7,	%g7
	fmovsneg	%xcc,	%f25,	%f0
	alignaddrl	%i5,	%o2,	%i2
	st	%f30,	[%l7 + 0x24]
	movg	%icc,	%o4,	%i3
	movpos	%icc,	%g6,	%o5
	orcc	%g5,	%g1,	%i4
	fcmps	%fcc0,	%f24,	%f30
	fmovsn	%icc,	%f24,	%f26
	movcc	%icc,	%l3,	%l6
	movvs	%xcc,	%l1,	%g2
	edge16ln	%l4,	%o0,	%l5
	fmovsl	%icc,	%f23,	%f28
	fcmped	%fcc2,	%f22,	%f24
	st	%f20,	[%l7 + 0x1C]
	xnor	%i6,	%i7,	%g4
	array8	%g3,	%i1,	%l0
	smul	%o6,	%i0,	%l2
	umul	%o1,	%o3,	%o7
	fpsub32s	%f0,	%f15,	%f26
	sllx	%i5,	%g7,	%o2
	edge8l	%o4,	%i3,	%g6
	sir	0x0C9C
	udiv	%i2,	0x0DC9,	%o5
	std	%f18,	[%l7 + 0x08]
	fpmerge	%f5,	%f13,	%f24
	fcmple32	%f18,	%f14,	%g1
	srlx	%g5,	%i4,	%l6
	movrgez	%l3,	%g2,	%l1
	array32	%o0,	%l4,	%i6
	stb	%i7,	[%l7 + 0x72]
	fmuld8sux16	%f10,	%f1,	%f6
	restore %l5, 0x0750, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f18,	%f21,	%f30
	std	%f14,	[%l7 + 0x38]
	movne	%icc,	%g4,	%i1
	xnor	%l0,	%o6,	%i0
	movgu	%icc,	%l2,	%o1
	ld	[%l7 + 0x74],	%f5
	edge16ln	%o3,	%o7,	%g7
	fornot2	%f0,	%f4,	%f22
	st	%f19,	[%l7 + 0x18]
	sth	%i5,	[%l7 + 0x4C]
	fnegd	%f20,	%f14
	movneg	%xcc,	%o2,	%i3
	edge32l	%o4,	%i2,	%o5
	fcmped	%fcc2,	%f26,	%f26
	for	%f4,	%f28,	%f26
	stb	%g1,	[%l7 + 0x1A]
	sethi	0x09C1,	%g6
	stw	%i4,	[%l7 + 0x1C]
	fcmps	%fcc2,	%f1,	%f29
	ldd	[%l7 + 0x18],	%g4
	edge32	%l3,	%g2,	%l6
	movcs	%xcc,	%l1,	%l4
	fmovspos	%xcc,	%f9,	%f16
	ldsh	[%l7 + 0x38],	%o0
	movrgz	%i7,	%l5,	%i6
	fxnor	%f10,	%f10,	%f2
	movvc	%xcc,	%g3,	%g4
	edge32ln	%i1,	%o6,	%i0
	sir	0x1B62
	edge8n	%l0,	%o1,	%l2
	orn	%o7,	0x07E5,	%o3
	movl	%icc,	%i5,	%g7
	sll	%o2,	0x1F,	%o4
	edge8l	%i3,	%i2,	%g1
	fmovdneg	%xcc,	%f31,	%f10
	sdivcc	%o5,	0x1C43,	%g6
	srax	%g5,	0x1C,	%i4
	fmuld8ulx16	%f20,	%f26,	%f18
	fmovrsne	%l3,	%f11,	%f14
	fcmpgt16	%f14,	%f6,	%g2
	fmovde	%icc,	%f5,	%f28
	fzeros	%f3
	xorcc	%l6,	%l1,	%o0
	addcc	%l4,	%l5,	%i7
	sir	0x1C64
	sdivx	%i6,	0x1FB2,	%g3
	subcc	%g4,	%o6,	%i1
	fmovrdlz	%l0,	%f18,	%f6
	fmovsl	%xcc,	%f16,	%f10
	subcc	%i0,	%l2,	%o7
	orncc	%o3,	0x0596,	%i5
	nop
	set	0x48, %g6
	ldsw	[%l7 + %g6],	%g7
	or	%o1,	0x0007,	%o4
	xorcc	%o2,	0x1C2B,	%i2
	andncc	%g1,	%o5,	%i3
	fmovsg	%xcc,	%f1,	%f0
	movleu	%xcc,	%g6,	%i4
	addcc	%g5,	%l3,	%l6
	movle	%xcc,	%l1,	%o0
	sllx	%g2,	0x08,	%l4
	nop
	set	0x33, %i1
	stb	%i7,	[%l7 + %i1]
	edge16	%l5,	%g3,	%g4
	xnor	%o6,	%i1,	%l0
	sra	%i6,	%l2,	%i0
	stb	%o7,	[%l7 + 0x4A]
	fmovrde	%i5,	%f22,	%f26
	fmovrsne	%o3,	%f23,	%f2
	sdiv	%o1,	0x01F9,	%g7
	stb	%o2,	[%l7 + 0x08]
	fmovsa	%xcc,	%f24,	%f3
	save %i2, %o4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%i3,	%g6,	%o5
	addccc	%g5,	%l3,	%l6
	fpmerge	%f2,	%f16,	%f24
	movneg	%icc,	%l1,	%i4
	andn	%g2,	0x1CE1,	%o0
	edge16l	%i7,	%l4,	%l5
	movre	%g3,	%g4,	%o6
	fmovscc	%icc,	%f28,	%f9
	movn	%xcc,	%i1,	%l0
	orn	%i6,	0x1878,	%i0
	move	%xcc,	%l2,	%i5
	umul	%o3,	%o1,	%g7
	sir	0x046E
	fands	%f6,	%f28,	%f17
	stw	%o7,	[%l7 + 0x6C]
	stw	%o2,	[%l7 + 0x18]
	ldsw	[%l7 + 0x64],	%i2
	sth	%g1,	[%l7 + 0x22]
	fcmpne32	%f0,	%f20,	%o4
	movleu	%icc,	%g6,	%o5
	movg	%icc,	%i3,	%l3
	fnands	%f24,	%f11,	%f7
	orncc	%l6,	0x05DF,	%l1
	fmovs	%f16,	%f21
	sllx	%i4,	0x0D,	%g2
	edge16n	%g5,	%i7,	%o0
	sra	%l4,	0x1A,	%l5
	fmovsl	%icc,	%f24,	%f18
	movrne	%g4,	%g3,	%o6
	fmovdcs	%xcc,	%f14,	%f18
	movpos	%icc,	%l0,	%i1
	faligndata	%f10,	%f12,	%f24
	save %i0, %i6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x50],	%l2
	sethi	0x0FC3,	%o3
	add	%o1,	%g7,	%o7
	add	%i2,	%g1,	%o4
	lduh	[%l7 + 0x1A],	%g6
	fmovdcc	%xcc,	%f9,	%f17
	popc	%o2,	%o5
	edge32n	%l3,	%i3,	%l6
	edge8ln	%i4,	%l1,	%g2
	ldub	[%l7 + 0x68],	%g5
	srlx	%i7,	0x1E,	%o0
	fmovdcs	%icc,	%f1,	%f30
	movvc	%xcc,	%l5,	%g4
	movrlz	%g3,	%o6,	%l4
	ldd	[%l7 + 0x60],	%l0
	ld	[%l7 + 0x7C],	%f13
	nop
	set	0x68, %o7
	ldd	[%l7 + %o7],	%f14
	edge32l	%i0,	%i6,	%i5
	ldx	[%l7 + 0x78],	%i1
	edge8	%l2,	%o1,	%g7
	lduw	[%l7 + 0x20],	%o3
	udivcc	%i2,	0x063C,	%g1
	ldd	[%l7 + 0x10],	%o4
	ldub	[%l7 + 0x62],	%o7
	orn	%o2,	0x0308,	%g6
	ld	[%l7 + 0x2C],	%f11
	andn	%l3,	0x10F3,	%o5
	udivx	%l6,	0x0E37,	%i3
	fabss	%f23,	%f25
	movre	%i4,	%l1,	%g2
	sir	0x018C
	st	%f14,	[%l7 + 0x30]
	xorcc	%g5,	0x1B4C,	%i7
	fnot2	%f30,	%f12
	movrlez	%o0,	0x0D7,	%g4
	sllx	%g3,	%l5,	%l4
	umul	%l0,	0x0DB9,	%o6
	addc	%i0,	%i6,	%i1
	srl	%l2,	0x0C,	%o1
	ld	[%l7 + 0x60],	%f23
	ldsb	[%l7 + 0x48],	%i5
	sll	%o3,	%i2,	%g1
	sdiv	%o4,	0x1EC5,	%g7
	lduw	[%l7 + 0x08],	%o7
	sllx	%g6,	%o2,	%l3
	edge32n	%o5,	%l6,	%i3
	movneg	%xcc,	%l1,	%g2
	mulscc	%i4,	%g5,	%i7
	sdivcc	%g4,	0x1A1E,	%o0
	sdivcc	%l5,	0x1F9E,	%l4
	orn	%l0,	0x0DC5,	%g3
	movrgz	%i0,	%o6,	%i1
	orn	%i6,	0x1562,	%o1
	srl	%l2,	%i5,	%o3
	fnegs	%f8,	%f5
	lduw	[%l7 + 0x30],	%g1
	st	%f2,	[%l7 + 0x78]
	stx	%o4,	[%l7 + 0x58]
	srax	%i2,	%g7,	%o7
	addc	%g6,	0x06EE,	%o2
	array32	%l3,	%l6,	%i3
	fmul8ulx16	%f2,	%f22,	%f18
	movpos	%icc,	%l1,	%o5
	nop
	set	0x57, %o2
	stb	%i4,	[%l7 + %o2]
	mulscc	%g2,	0x18A3,	%g5
	udiv	%g4,	0x15CF,	%i7
	movrlez	%o0,	0x1A0,	%l5
	subcc	%l4,	0x1D57,	%l0
	orncc	%i0,	%o6,	%i1
	xnor	%g3,	0x0B4F,	%o1
	movneg	%icc,	%l2,	%i6
	lduh	[%l7 + 0x42],	%i5
	sll	%o3,	0x18,	%o4
	srax	%i2,	0x19,	%g7
	subcc	%g1,	0x050D,	%o7
	movrlez	%o2,	%g6,	%l3
	fones	%f19
	udivcc	%i3,	0x1FD5,	%l1
	addccc	%o5,	%i4,	%l6
	sir	0x1BE8
	movgu	%xcc,	%g5,	%g4
	lduh	[%l7 + 0x38],	%i7
	srlx	%g2,	0x07,	%l5
	xnor	%l4,	0x0933,	%l0
	movn	%icc,	%i0,	%o6
	movcc	%xcc,	%i1,	%g3
	edge16	%o1,	%o0,	%l2
	array16	%i5,	%o3,	%i6
	std	%f2,	[%l7 + 0x10]
	ld	[%l7 + 0x7C],	%f7
	edge32n	%i2,	%o4,	%g7
	fsrc2s	%f17,	%f27
	edge32n	%o7,	%o2,	%g1
	array32	%g6,	%i3,	%l3
	movcs	%icc,	%o5,	%l1
	movge	%xcc,	%i4,	%g5
	fmovd	%f18,	%f20
	movrlz	%g4,	%l6,	%i7
	orn	%g2,	%l5,	%l0
	sdiv	%i0,	0x199A,	%o6
	ld	[%l7 + 0x1C],	%f2
	sth	%i1,	[%l7 + 0x0E]
	stx	%g3,	[%l7 + 0x60]
	mulx	%l4,	0x0CE5,	%o1
	fmovrsgz	%o0,	%f16,	%f12
	udivx	%l2,	0x1CE3,	%i5
	lduw	[%l7 + 0x30],	%i6
	orcc	%o3,	%i2,	%o4
	mulscc	%g7,	0x0877,	%o2
	andn	%g1,	0x0512,	%o7
	alignaddr	%g6,	%l3,	%o5
	xor	%i3,	0x1647,	%i4
	nop
	set	0x38, %g7
	ldd	[%l7 + %g7],	%g4
	movge	%xcc,	%g4,	%l1
	sra	%i7,	%g2,	%l5
	alignaddr	%l6,	%i0,	%o6
	fnand	%f6,	%f16,	%f12
	edge32l	%l0,	%g3,	%i1
	ldub	[%l7 + 0x61],	%o1
	andncc	%l4,	%l2,	%o0
	edge16n	%i6,	%o3,	%i5
	ldsb	[%l7 + 0x6D],	%i2
	udivcc	%g7,	0x17C9,	%o4
	movrlez	%o2,	0x0CA,	%o7
	sethi	0x03D1,	%g6
	movne	%xcc,	%l3,	%o5
	fmuld8ulx16	%f17,	%f5,	%f24
	fandnot2	%f4,	%f2,	%f22
	sethi	0x0385,	%g1
	edge16ln	%i3,	%g5,	%i4
	faligndata	%f28,	%f4,	%f0
	save %l1, 0x0A74, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i7,	%l5,	%l6
	andcc	%g2,	0x16D9,	%i0
	xor	%l0,	0x1A5B,	%o6
	movle	%icc,	%g3,	%o1
	udivx	%l4,	0x131A,	%i1
	movvs	%xcc,	%l2,	%i6
	movcs	%xcc,	%o3,	%i5
	array16	%o0,	%i2,	%o4
	edge16l	%o2,	%o7,	%g6
	array8	%l3,	%g7,	%g1
	udiv	%o5,	0x0F31,	%i3
	st	%f27,	[%l7 + 0x68]
	add	%g5,	%i4,	%l1
	fmovsvc	%icc,	%f0,	%f12
	and	%i7,	0x039F,	%g4
	ldub	[%l7 + 0x54],	%l5
	ldsw	[%l7 + 0x60],	%l6
	fpack16	%f18,	%f8
	fzeros	%f22
	addc	%g2,	0x0A38,	%l0
	umulcc	%o6,	0x14B5,	%i0
	edge16ln	%o1,	%l4,	%i1
	array16	%g3,	%i6,	%o3
	fmovda	%xcc,	%f31,	%f7
	fpadd16	%f10,	%f22,	%f10
	fmovrdgz	%i5,	%f10,	%f12
	fmovrdlz	%o0,	%f26,	%f30
	movrgz	%l2,	%i2,	%o4
	ldsw	[%l7 + 0x48],	%o7
	fmovdpos	%xcc,	%f25,	%f4
	smul	%o2,	%g6,	%g7
	fxors	%f15,	%f24,	%f15
	st	%f5,	[%l7 + 0x34]
	movleu	%xcc,	%g1,	%l3
	fandnot1s	%f23,	%f3,	%f3
	sir	0x1E5A
	mova	%xcc,	%o5,	%i3
	movne	%icc,	%g5,	%i4
	nop
	set	0x3C, %o3
	stw	%l1,	[%l7 + %o3]
	udiv	%i7,	0x0EF2,	%g4
	movvc	%icc,	%l6,	%g2
	movne	%icc,	%l5,	%l0
	smulcc	%o6,	%i0,	%l4
	edge32	%i1,	%o1,	%g3
	array8	%i6,	%i5,	%o3
	movcc	%icc,	%l2,	%o0
	orncc	%o4,	%i2,	%o2
	xnorcc	%g6,	%g7,	%o7
	srax	%l3,	%g1,	%i3
	sth	%g5,	[%l7 + 0x20]
	movne	%icc,	%o5,	%l1
	fpack16	%f6,	%f24
	movge	%xcc,	%i7,	%g4
	siam	0x4
	sra	%i4,	0x19,	%l6
	movl	%icc,	%l5,	%g2
	smul	%o6,	%i0,	%l4
	orn	%l0,	%i1,	%o1
	subcc	%g3,	0x0C0E,	%i6
	edge8n	%o3,	%i5,	%l2
	movcs	%xcc,	%o4,	%i2
	sdivcc	%o2,	0x166F,	%g6
	fmovsne	%icc,	%f9,	%f8
	movrne	%g7,	0x092,	%o0
	fmovdleu	%icc,	%f24,	%f13
	edge32n	%o7,	%g1,	%l3
	movrlz	%g5,	%i3,	%o5
	srax	%l1,	%i7,	%g4
	edge8n	%l6,	%l5,	%i4
	fmovdleu	%xcc,	%f0,	%f5
	ld	[%l7 + 0x30],	%f7
	fmovdl	%icc,	%f14,	%f24
	mulx	%o6,	0x06C5,	%g2
	stw	%i0,	[%l7 + 0x7C]
	movrlz	%l4,	%i1,	%l0
	movrgez	%g3,	0x09F,	%o1
	sub	%i6,	0x0A40,	%i5
	ldsb	[%l7 + 0x39],	%o3
	fmovrde	%o4,	%f20,	%f20
	movrlz	%i2,	0x2E0,	%o2
	andn	%l2,	0x0255,	%g7
	udivx	%g6,	0x1E90,	%o7
	array16	%o0,	%l3,	%g1
	movn	%xcc,	%i3,	%g5
	array32	%l1,	%i7,	%o5
	movrne	%l6,	0x26E,	%g4
	mulx	%l5,	%i4,	%g2
	movrlez	%o6,	0x05F,	%i0
	movrlz	%l4,	%i1,	%g3
	movneg	%icc,	%l0,	%o1
	subcc	%i5,	0x04E0,	%o3
	movn	%icc,	%i6,	%o4
	mulscc	%o2,	%l2,	%g7
	sethi	0x0C27,	%i2
	edge16ln	%o7,	%g6,	%l3
	smul	%g1,	0x0323,	%o0
	movle	%xcc,	%i3,	%l1
	fmovdvs	%xcc,	%f14,	%f9
	srax	%i7,	0x1B,	%g5
	edge32l	%o5,	%l6,	%l5
	fpadd32	%f24,	%f20,	%f22
	movcs	%xcc,	%i4,	%g4
	movne	%icc,	%o6,	%g2
	movcs	%xcc,	%l4,	%i0
	nop
	set	0x1D, %l4
	ldsb	[%l7 + %l4],	%i1
	movg	%xcc,	%g3,	%o1
	ldsh	[%l7 + 0x14],	%l0
	fcmpne32	%f10,	%f12,	%o3
	array16	%i6,	%i5,	%o4
	save %o2, 0x0861, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%i2,	0x00,	%g7
	movne	%icc,	%g6,	%l3
	movre	%g1,	%o0,	%o7
	popc	0x0CD7,	%i3
	movg	%xcc,	%i7,	%l1
	orn	%g5,	%o5,	%l5
	or	%l6,	0x1BE5,	%i4
	std	%f18,	[%l7 + 0x20]
	add	%g4,	%g2,	%o6
	movg	%icc,	%i0,	%l4
	popc	%g3,	%o1
	movl	%xcc,	%l0,	%i1
	movl	%icc,	%o3,	%i6
	save %i5, %o4, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%l2,	%g7,	%i2
	fsrc1	%f2,	%f14
	fmovdcs	%icc,	%f9,	%f26
	ldsw	[%l7 + 0x7C],	%g6
	fandnot2	%f2,	%f4,	%f24
	fmovsvs	%xcc,	%f1,	%f21
	sir	0x18A6
	sll	%l3,	0x0E,	%o0
	stb	%g1,	[%l7 + 0x2E]
	ld	[%l7 + 0x4C],	%f24
	sir	0x09E7
	edge16	%o7,	%i7,	%l1
	sdivcc	%i3,	0x1ACB,	%g5
	fmovrdne	%l5,	%f22,	%f8
	array16	%o5,	%i4,	%g4
	fmovda	%icc,	%f8,	%f30
	ldsw	[%l7 + 0x44],	%g2
	stx	%l6,	[%l7 + 0x70]
	fpack16	%f28,	%f16
	stw	%o6,	[%l7 + 0x20]
	fnegd	%f8,	%f30
	array16	%i0,	%g3,	%o1
	ldd	[%l7 + 0x28],	%l4
	fand	%f12,	%f12,	%f10
	fcmps	%fcc3,	%f22,	%f1
	fmovsleu	%xcc,	%f30,	%f5
	fornot2	%f12,	%f18,	%f10
	orncc	%l0,	%o3,	%i1
	xnorcc	%i6,	%i5,	%o4
	subccc	%l2,	0x0555,	%g7
	ldub	[%l7 + 0x5A],	%o2
	fmovdl	%icc,	%f13,	%f11
	xnor	%g6,	0x0759,	%l3
	movne	%icc,	%o0,	%g1
	fpadd16	%f14,	%f2,	%f8
	udivcc	%o7,	0x0204,	%i2
	fcmpd	%fcc2,	%f16,	%f22
	fmuld8sux16	%f20,	%f6,	%f20
	ldub	[%l7 + 0x71],	%i7
	fmovrdne	%l1,	%f4,	%f22
	movge	%icc,	%i3,	%l5
	udivcc	%o5,	0x0E59,	%g5
	fcmpne32	%f4,	%f26,	%i4
	andcc	%g4,	%l6,	%g2
	nop
	set	0x28, %o4
	ldx	[%l7 + %o4],	%i0
	mova	%xcc,	%o6,	%o1
	sdivcc	%l4,	0x178E,	%l0
	edge8l	%g3,	%i1,	%o3
	alignaddrl	%i5,	%o4,	%i6
	movvs	%xcc,	%l2,	%o2
	fors	%f8,	%f30,	%f14
	st	%f24,	[%l7 + 0x08]
	popc	0x0E9D,	%g6
	movg	%icc,	%g7,	%o0
	popc	%l3,	%o7
	sdivcc	%i2,	0x15F6,	%g1
	edge32ln	%i7,	%i3,	%l5
	ldd	[%l7 + 0x60],	%o4
	movleu	%icc,	%l1,	%i4
	lduw	[%l7 + 0x40],	%g5
	fmovrsne	%g4,	%f13,	%f5
	fmovrdlez	%g2,	%f14,	%f16
	umulcc	%i0,	%l6,	%o1
	nop
	set	0x10, %l5
	ldx	[%l7 + %l5],	%l4
	fxors	%f1,	%f4,	%f16
	udiv	%l0,	0x1B8C,	%o6
	lduw	[%l7 + 0x24],	%g3
	fpmerge	%f7,	%f23,	%f24
	addcc	%i1,	%o3,	%o4
	andn	%i6,	0x09EA,	%i5
	udivx	%l2,	0x05F5,	%o2
	movcs	%icc,	%g6,	%g7
	fxor	%f6,	%f24,	%f8
	fmovde	%xcc,	%f17,	%f31
	fmovdn	%icc,	%f2,	%f29
	ldsb	[%l7 + 0x33],	%l3
	std	%f8,	[%l7 + 0x30]
	fzero	%f20
	edge32ln	%o7,	%o0,	%i2
	movn	%icc,	%g1,	%i3
	lduw	[%l7 + 0x78],	%i7
	edge32	%o5,	%l1,	%i4
	umulcc	%g5,	0x0416,	%g4
	ldd	[%l7 + 0x70],	%f8
	array16	%l5,	%i0,	%l6
	fandnot1s	%f21,	%f2,	%f11
	fmovdle	%xcc,	%f2,	%f11
	edge8l	%o1,	%l4,	%g2
	movgu	%icc,	%o6,	%l0
	xor	%i1,	0x082E,	%o3
	udivcc	%g3,	0x05C7,	%o4
	sth	%i5,	[%l7 + 0x0A]
	array16	%l2,	%i6,	%g6
	fnegs	%f25,	%f20
	subccc	%g7,	0x169D,	%l3
	fmovdpos	%icc,	%f4,	%f10
	ldd	[%l7 + 0x48],	%f20
	movpos	%icc,	%o7,	%o2
	fsrc1	%f14,	%f2
	ldx	[%l7 + 0x18],	%o0
	srax	%g1,	0x06,	%i2
	fcmpeq16	%f6,	%f4,	%i3
	movrlz	%o5,	%l1,	%i7
	subc	%i4,	0x09F7,	%g4
	movg	%icc,	%g5,	%i0
	movrne	%l5,	%o1,	%l4
	fmovdl	%xcc,	%f4,	%f29
	sdivx	%l6,	0x1EC2,	%g2
	edge32n	%l0,	%o6,	%i1
	fmuld8sux16	%f10,	%f22,	%f10
	pdist	%f22,	%f24,	%f8
	ldsb	[%l7 + 0x30],	%g3
	fcmpgt16	%f12,	%f26,	%o3
	alignaddr	%i5,	%l2,	%o4
	edge16ln	%g6,	%g7,	%i6
	xorcc	%l3,	%o7,	%o2
	xnor	%o0,	%g1,	%i3
	movge	%icc,	%i2,	%o5
	umulcc	%l1,	0x1543,	%i4
	ldsw	[%l7 + 0x10],	%g4
	ldub	[%l7 + 0x74],	%i7
	sir	0x1817
	stx	%g5,	[%l7 + 0x70]
	sll	%i0,	%l5,	%l4
	fand	%f26,	%f16,	%f22
	fandnot1s	%f19,	%f28,	%f20
	sethi	0x0A4B,	%o1
	fmovsl	%xcc,	%f27,	%f3
	popc	%g2,	%l0
	sllx	%o6,	0x1F,	%i1
	ldsb	[%l7 + 0x13],	%l6
	movrgez	%g3,	0x167,	%o3
	mova	%icc,	%l2,	%i5
	ldsh	[%l7 + 0x56],	%o4
	move	%icc,	%g7,	%g6
	andcc	%i6,	%o7,	%l3
	xorcc	%o2,	0x0FAF,	%o0
	orcc	%i3,	%i2,	%o5
	orcc	%g1,	%l1,	%g4
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	umulcc	%i0,	%l4,	%l5
	edge8n	%g2,	%l0,	%o1
	array32	%i1,	%o6,	%l6
	smulcc	%g3,	0x00D3,	%l2
	st	%f19,	[%l7 + 0x70]
	subc	%o3,	0x0C4E,	%o4
	lduh	[%l7 + 0x66],	%i5
	xorcc	%g6,	0x1992,	%i6
	edge16ln	%o7,	%l3,	%g7
	orncc	%o2,	0x15D3,	%o0
	fmovrdlez	%i3,	%f14,	%f10
	alignaddrl	%i2,	%o5,	%g1
	fcmpeq16	%f4,	%f0,	%g4
	ldd	[%l7 + 0x68],	%f4
	movne	%xcc,	%i7,	%i4
	edge8ln	%g5,	%l1,	%l4
	movvc	%icc,	%i0,	%g2
	st	%f23,	[%l7 + 0x48]
	smulcc	%l0,	%o1,	%l5
	srl	%i1,	%l6,	%g3
	fmovdcs	%icc,	%f24,	%f0
	edge32l	%o6,	%o3,	%l2
	edge8	%i5,	%o4,	%g6
	edge32ln	%i6,	%o7,	%g7
	popc	%o2,	%l3
	movvc	%icc,	%i3,	%o0
	fandnot1	%f4,	%f20,	%f28
	xnor	%i2,	0x0285,	%g1
	fandnot1	%f8,	%f0,	%f4
	movle	%xcc,	%o5,	%g4
	fmovdvc	%xcc,	%f24,	%f29
	array16	%i4,	%g5,	%l1
	bshuffle	%f30,	%f22,	%f30
	movg	%icc,	%l4,	%i0
	addcc	%i7,	%g2,	%o1
	edge8n	%l5,	%i1,	%l0
	fexpand	%f18,	%f16
	sllx	%g3,	%o6,	%o3
	sdivx	%l6,	0x1CF2,	%i5
	edge16	%l2,	%g6,	%o4
	movne	%xcc,	%o7,	%g7
	lduh	[%l7 + 0x2C],	%o2
	fmovse	%xcc,	%f22,	%f10
	ldd	[%l7 + 0x48],	%f20
	edge32ln	%i6,	%l3,	%o0
	add	%i2,	0x170F,	%g1
	movne	%icc,	%i3,	%o5
	fnot1s	%f6,	%f27
	movcs	%icc,	%g4,	%g5
	andn	%i4,	%l4,	%i0
	edge8	%i7,	%g2,	%l1
	movrlz	%l5,	%i1,	%o1
	smul	%l0,	%g3,	%o6
	move	%xcc,	%o3,	%i5
	edge32n	%l6,	%l2,	%o4
	st	%f10,	[%l7 + 0x20]
	edge8	%o7,	%g6,	%o2
	movrne	%g7,	%l3,	%o0
	addc	%i6,	0x1AD5,	%g1
	lduh	[%l7 + 0x7E],	%i2
	andn	%o5,	%i3,	%g5
	movcc	%xcc,	%i4,	%l4
	edge8l	%i0,	%i7,	%g4
	movcs	%xcc,	%l1,	%l5
	umul	%i1,	0x0785,	%o1
	andncc	%l0,	%g2,	%o6
	fmovdcs	%xcc,	%f30,	%f11
	sethi	0x03CF,	%g3
	andcc	%i5,	0x0182,	%l6
	fmovdcc	%xcc,	%f7,	%f18
	fnot1s	%f30,	%f3
	ldub	[%l7 + 0x42],	%o3
	edge32ln	%l2,	%o4,	%o7
	array16	%o2,	%g6,	%g7
	save %l3, %i6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o0,	[%l7 + 0x0D]
	srl	%o5,	%i3,	%i2
	andncc	%i4,	%g5,	%l4
	edge8n	%i7,	%g4,	%l1
	xnor	%i0,	%l5,	%i1
	fcmpgt16	%f30,	%f8,	%l0
	sth	%g2,	[%l7 + 0x28]
	fpsub16	%f14,	%f4,	%f12
	alignaddrl	%o1,	%g3,	%o6
	lduw	[%l7 + 0x08],	%l6
	movre	%i5,	0x011,	%o3
	fornot1	%f24,	%f22,	%f26
	andn	%l2,	%o7,	%o4
	sub	%o2,	0x0047,	%g7
	nop
	set	0x62, %l6
	lduh	[%l7 + %l6],	%l3
	fornot1	%f0,	%f0,	%f2
	std	%f28,	[%l7 + 0x68]
	xor	%i6,	%g6,	%o0
	movpos	%xcc,	%o5,	%g1
	fmovsvs	%xcc,	%f6,	%f10
	fors	%f2,	%f6,	%f16
	xorcc	%i3,	%i4,	%i2
	orcc	%l4,	0x13C8,	%g5
	subcc	%i7,	0x1343,	%l1
	fmovscc	%xcc,	%f10,	%f2
	movgu	%icc,	%i0,	%g4
	edge32n	%l5,	%l0,	%i1
	fmovrsne	%o1,	%f14,	%f18
	ldsw	[%l7 + 0x60],	%g3
	fandnot2	%f28,	%f14,	%f8
	subcc	%g2,	%o6,	%i5
	movneg	%icc,	%o3,	%l2
	udivcc	%o7,	0x0592,	%l6
	or	%o4,	0x1B51,	%o2
	movrlez	%l3,	0x085,	%i6
	sra	%g6,	%o0,	%g7
	addcc	%g1,	0x08C7,	%i3
	edge16	%i4,	%i2,	%o5
	ldd	[%l7 + 0x28],	%g4
	fnegs	%f15,	%f29
	xnor	%l4,	0x06D6,	%l1
	ldd	[%l7 + 0x60],	%i0
	movge	%icc,	%g4,	%l5
	fmovspos	%xcc,	%f13,	%f20
	ldd	[%l7 + 0x28],	%f28
	sllx	%i7,	%l0,	%i1
	movvs	%icc,	%g3,	%g2
	movvc	%icc,	%o1,	%i5
	movleu	%xcc,	%o6,	%o3
	fpackfix	%f30,	%f4
	fmovsge	%xcc,	%f20,	%f27
	smul	%l2,	%l6,	%o7
	edge32ln	%o2,	%l3,	%o4
	xor	%g6,	0x0E73,	%i6
	pdist	%f22,	%f30,	%f20
	andn	%g7,	%g1,	%i3
	fsrc2s	%f27,	%f5
	subc	%i4,	%o0,	%i2
	fcmps	%fcc1,	%f30,	%f20
	srax	%o5,	0x12,	%g5
	array8	%l1,	%l4,	%g4
	fmovrsgz	%l5,	%f9,	%f25
	movne	%icc,	%i7,	%i0
	and	%l0,	%g3,	%g2
	fmovdne	%icc,	%f12,	%f26
	movgu	%xcc,	%i1,	%i5
	fnands	%f6,	%f26,	%f25
	movvc	%xcc,	%o1,	%o6
	movgu	%xcc,	%o3,	%l6
	move	%xcc,	%l2,	%o7
	udivx	%o2,	0x0BF0,	%l3
	fmovscs	%xcc,	%f17,	%f16
	fabsd	%f30,	%f18
	xnor	%o4,	%i6,	%g6
	movrne	%g7,	%g1,	%i4
	fandnot2	%f22,	%f8,	%f22
	ldsb	[%l7 + 0x75],	%o0
	subccc	%i2,	0x0698,	%o5
	sllx	%g5,	%l1,	%i3
	fmovspos	%icc,	%f13,	%f22
	edge32ln	%g4,	%l4,	%l5
	fsrc1	%f20,	%f26
	restore %i7, 0x113E, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g3,	%g2,	%l0
	ldub	[%l7 + 0x59],	%i5
	sir	0x0D5F
	fsrc2	%f18,	%f20
	fpack16	%f6,	%f4
	alignaddrl	%i1,	%o6,	%o3
	movcs	%icc,	%o1,	%l6
	fnot2	%f28,	%f2
	addc	%l2,	%o2,	%o7
	fmovda	%icc,	%f28,	%f1
	array16	%l3,	%i6,	%o4
	fcmpgt16	%f10,	%f22,	%g7
	xor	%g6,	%g1,	%o0
	andncc	%i2,	%o5,	%g5
	for	%f16,	%f10,	%f24
	fmovsne	%icc,	%f10,	%f0
	fmovspos	%icc,	%f30,	%f21
	move	%xcc,	%l1,	%i4
	edge8ln	%g4,	%i3,	%l5
	movn	%icc,	%i7,	%l4
	fpmerge	%f4,	%f25,	%f6
	movvs	%icc,	%i0,	%g2
	fnands	%f23,	%f1,	%f22
	array16	%l0,	%i5,	%i1
	array32	%o6,	%o3,	%g3
	addcc	%o1,	%l2,	%l6
	fmovspos	%xcc,	%f11,	%f14
	movrgz	%o2,	%l3,	%i6
	fnot2	%f10,	%f28
	movle	%xcc,	%o7,	%o4
	movcc	%xcc,	%g6,	%g1
	edge8ln	%g7,	%i2,	%o0
	movrgez	%o5,	%g5,	%i4
	fmuld8ulx16	%f25,	%f21,	%f14
	movrne	%l1,	%i3,	%g4
	fmovsg	%icc,	%f6,	%f9
	smulcc	%l5,	%l4,	%i0
	fcmpgt16	%f28,	%f18,	%g2
	fmovrdgez	%l0,	%f18,	%f14
	edge8l	%i5,	%i1,	%i7
	umulcc	%o6,	0x005D,	%o3
	movrlz	%g3,	%l2,	%l6
	orn	%o2,	%l3,	%i6
	sdivcc	%o7,	0x05DC,	%o1
	orn	%g6,	0x0974,	%g1
	sra	%o4,	%g7,	%i2
	edge8ln	%o5,	%o0,	%i4
	fmovdvs	%xcc,	%f0,	%f4
	fmul8x16au	%f14,	%f20,	%f22
	stx	%l1,	[%l7 + 0x08]
	sdiv	%g5,	0x10C8,	%g4
	movrgz	%l5,	%i3,	%l4
	movrgez	%i0,	0x24D,	%l0
	array16	%g2,	%i1,	%i7
	srax	%i5,	%o6,	%o3
	movge	%icc,	%g3,	%l6
	movvs	%xcc,	%o2,	%l3
	movrlez	%l2,	0x3AD,	%o7
	edge32l	%i6,	%g6,	%g1
	sethi	0x1F6C,	%o4
	fmovrde	%o1,	%f10,	%f18
	mulscc	%i2,	%g7,	%o0
	move	%xcc,	%o5,	%i4
	stw	%l1,	[%l7 + 0x4C]
	fandnot2s	%f31,	%f10,	%f7
	fabss	%f17,	%f24
	movrlz	%g5,	0x382,	%g4
	srlx	%i3,	0x0C,	%l4
	movg	%icc,	%i0,	%l0
	alignaddrl	%g2,	%i1,	%l5
	edge32	%i5,	%o6,	%i7
	smul	%g3,	%o3,	%l6
	addc	%l3,	%l2,	%o7
	ldsh	[%l7 + 0x5C],	%i6
	udivx	%g6,	0x1BAE,	%o2
	xnor	%o4,	%g1,	%i2
	movpos	%icc,	%o1,	%o0
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	movvs	%icc,	%g7,	%g5
	edge32l	%i3,	%l4,	%g4
	edge16ln	%l0,	%i0,	%i1
	fors	%f19,	%f2,	%f11
	andncc	%g2,	%i5,	%l5
	add	%o6,	%i7,	%g3
	stb	%l6,	[%l7 + 0x3F]
	array16	%o3,	%l3,	%l2
	fmovdcs	%icc,	%f30,	%f8
	fmovde	%icc,	%f15,	%f2
	add	%o7,	0x0377,	%i6
	sdiv	%g6,	0x1F00,	%o4
	and	%o2,	0x1084,	%i2
	mulscc	%g1,	0x1E6F,	%o1
	fabsd	%f10,	%f10
	edge32n	%o0,	%o5,	%i4
	edge8l	%l1,	%g5,	%g7
	alignaddrl	%i3,	%l4,	%g4
	fmuld8ulx16	%f0,	%f6,	%f30
	addc	%l0,	0x1E4B,	%i1
	ldsw	[%l7 + 0x18],	%i0
	srax	%i5,	%g2,	%o6
	fmovrdgez	%l5,	%f14,	%f14
	sra	%g3,	%l6,	%o3
	fmovscc	%xcc,	%f30,	%f1
	popc	%l3,	%l2
	sdiv	%o7,	0x1FD8,	%i6
	pdist	%f14,	%f16,	%f8
	ld	[%l7 + 0x54],	%f24
	ldsh	[%l7 + 0x18],	%i7
	fornot2	%f26,	%f0,	%f0
	mulx	%o4,	%g6,	%i2
	orcc	%g1,	%o2,	%o0
	restore %o1, 0x017F, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%o5,	%l1
	xor	%g7,	0x05D2,	%i3
	smulcc	%l4,	0x000B,	%g4
	sth	%l0,	[%l7 + 0x24]
	edge32ln	%g5,	%i0,	%i5
	umul	%g2,	0x14ED,	%o6
	movge	%icc,	%l5,	%i1
	edge16n	%g3,	%o3,	%l3
	movneg	%xcc,	%l6,	%l2
	movneg	%icc,	%o7,	%i6
	udivcc	%i7,	0x1893,	%g6
	udiv	%i2,	0x0054,	%g1
	umul	%o4,	0x0B76,	%o0
	edge16l	%o1,	%o2,	%i4
	sra	%l1,	%o5,	%i3
	andcc	%l4,	%g4,	%g7
	edge8	%l0,	%g5,	%i0
	edge16ln	%i5,	%g2,	%l5
	subc	%o6,	%g3,	%i1
	orcc	%o3,	%l3,	%l6
	andcc	%o7,	0x0664,	%i6
	sir	0x1EC0
	edge32	%l2,	%i7,	%i2
	fmovsle	%xcc,	%f3,	%f22
	edge8ln	%g6,	%g1,	%o4
	save %o0, 0x1DF6, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%i4
	subcc	%l1,	0x0738,	%o5
	fmovscs	%icc,	%f10,	%f8
	srl	%i3,	%l4,	%g4
	edge32n	%g7,	%o2,	%l0
	ldsb	[%l7 + 0x34],	%g5
	ld	[%l7 + 0x70],	%f14
	fcmpes	%fcc1,	%f27,	%f5
	array8	%i0,	%i5,	%l5
	mova	%xcc,	%o6,	%g2
	movl	%icc,	%i1,	%g3
	sra	%o3,	%l6,	%l3
	srlx	%i6,	0x02,	%l2
	ld	[%l7 + 0x1C],	%f30
	stw	%o7,	[%l7 + 0x40]
	ldsw	[%l7 + 0x34],	%i2
	ldd	[%l7 + 0x30],	%i6
	umul	%g6,	%g1,	%o4
	ldx	[%l7 + 0x58],	%o1
	stw	%i4,	[%l7 + 0x38]
	ldsh	[%l7 + 0x1C],	%l1
	movleu	%xcc,	%o0,	%i3
	array16	%o5,	%g4,	%l4
	fmovdleu	%icc,	%f1,	%f15
	fzeros	%f6
	addccc	%g7,	0x0EEF,	%l0
	sra	%g5,	0x0D,	%i0
	fmovscs	%icc,	%f24,	%f22
	sra	%o2,	0x1A,	%i5
	fcmpgt16	%f24,	%f26,	%l5
	std	%f20,	[%l7 + 0x48]
	movre	%o6,	%i1,	%g3
	sdivcc	%o3,	0x1615,	%l6
	fmovdg	%icc,	%f8,	%f13
	array32	%g2,	%l3,	%l2
	addc	%i6,	%i2,	%o7
	movrgez	%i7,	0x218,	%g1
	xorcc	%o4,	0x1FC2,	%o1
	lduw	[%l7 + 0x38],	%g6
	fmovsn	%icc,	%f17,	%f4
	fmovrdgz	%l1,	%f28,	%f14
	sir	0x1DBB
	srax	%o0,	0x10,	%i3
	movg	%icc,	%o5,	%i4
	edge32	%g4,	%g7,	%l4
	fpadd32s	%f5,	%f14,	%f10
	ldd	[%l7 + 0x50],	%g4
	addc	%i0,	0x05F4,	%o2
	ldd	[%l7 + 0x68],	%f22
	srax	%i5,	%l5,	%l0
	srax	%o6,	%g3,	%i1
	movvc	%xcc,	%l6,	%o3
	sir	0x1CF2
	srl	%l3,	%l2,	%g2
	movleu	%xcc,	%i2,	%o7
	fmovdle	%icc,	%f23,	%f21
	fmovdneg	%xcc,	%f12,	%f24
	movg	%xcc,	%i6,	%g1
	edge8l	%i7,	%o4,	%g6
	udiv	%l1,	0x0FAA,	%o0
	subc	%o1,	0x0F09,	%i3
	fandnot1s	%f13,	%f17,	%f16
	fnor	%f4,	%f2,	%f24
	alignaddr	%o5,	%g4,	%i4
	sll	%l4,	%g7,	%i0
	sub	%o2,	%g5,	%i5
	array8	%l5,	%o6,	%l0
	add	%i1,	%g3,	%o3
	andn	%l3,	0x0D99,	%l2
	sth	%g2,	[%l7 + 0x5C]
	stw	%l6,	[%l7 + 0x0C]
	fmovsneg	%icc,	%f16,	%f22
	andn	%o7,	%i2,	%i6
	subccc	%g1,	%i7,	%o4
	udiv	%l1,	0x1BCB,	%g6
	fnegd	%f0,	%f6
	xnor	%o1,	0x19CA,	%o0
	fpack32	%f30,	%f4,	%f18
	array16	%o5,	%g4,	%i3
	fmovrde	%l4,	%f14,	%f30
	sll	%i4,	0x14,	%i0
	popc	%g7,	%o2
	orn	%g5,	%l5,	%i5
	movvs	%icc,	%o6,	%l0
	std	%f16,	[%l7 + 0x38]
	movrlz	%i1,	%o3,	%g3
	movgu	%xcc,	%l2,	%l3
	edge8ln	%l6,	%o7,	%i2
	edge32l	%g2,	%i6,	%g1
	fnor	%f22,	%f30,	%f14
	save %i7, 0x0C4C, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g6,	0x1ED2,	%o4
	fmovrdgz	%o1,	%f16,	%f20
	movl	%icc,	%o0,	%g4
	array32	%o5,	%l4,	%i4
	umul	%i0,	%i3,	%g7
	fandnot2	%f24,	%f30,	%f30
	fand	%f10,	%f30,	%f0
	ldsh	[%l7 + 0x72],	%g5
	fmovsge	%icc,	%f18,	%f7
	fpmerge	%f14,	%f16,	%f10
	movrgz	%o2,	%i5,	%o6
	movvc	%xcc,	%l0,	%l5
	srlx	%o3,	%g3,	%i1
	movg	%icc,	%l2,	%l6
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	ldsh	[%l7 + 0x3A],	%i2
	udivcc	%i6,	0x1BE9,	%g1
	or	%l1,	%i7,	%g6
	sub	%o1,	0x107E,	%o4
	fmovsn	%xcc,	%f9,	%f23
	save %o0, 0x1EE1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l4,	%i4,	%g4
	movvc	%xcc,	%i3,	%g7
	and	%i0,	%o2,	%i5
	sdivcc	%o6,	0x1ECA,	%g5
	edge8l	%l5,	%l0,	%o3
	edge8ln	%i1,	%g3,	%l6
	ldd	[%l7 + 0x18],	%l2
	fcmpeq16	%f20,	%f20,	%o7
	fmovsge	%xcc,	%f8,	%f2
	ldsb	[%l7 + 0x56],	%g2
	alignaddr	%i2,	%i6,	%l2
	sdiv	%g1,	0x0423,	%l1
	mova	%icc,	%g6,	%o1
	sdivcc	%o4,	0x1A2E,	%o0
	andncc	%o5,	%l4,	%i4
	edge32ln	%i7,	%i3,	%g4
	fmovsvc	%xcc,	%f20,	%f21
	srl	%i0,	%o2,	%i5
	andncc	%o6,	%g7,	%l5
	nop
	set	0x44, %i6
	lduh	[%l7 + %i6],	%l0
	xorcc	%g5,	%i1,	%o3
	fmovsgu	%icc,	%f13,	%f22
	smulcc	%l6,	%l3,	%g3
	andcc	%o7,	%i2,	%g2
	lduw	[%l7 + 0x0C],	%i6
	edge16l	%g1,	%l2,	%g6
	fpack16	%f0,	%f22
	xnor	%l1,	0x0D32,	%o4
	and	%o1,	%o0,	%o5
	edge16	%l4,	%i4,	%i7
	edge16ln	%i3,	%g4,	%o2
	edge16l	%i5,	%o6,	%g7
	fmovdcs	%xcc,	%f17,	%f16
	fornot2	%f10,	%f28,	%f24
	fmovdn	%xcc,	%f25,	%f26
	fmuld8ulx16	%f26,	%f13,	%f10
	sdivcc	%l5,	0x06E6,	%i0
	array16	%l0,	%g5,	%i1
	nop
	set	0x74, %l1
	stw	%o3,	[%l7 + %l1]
	xor	%l6,	0x04E1,	%l3
	mulscc	%o7,	%i2,	%g3
	orcc	%g2,	0x09E8,	%g1
	udivcc	%l2,	0x1207,	%i6
	subcc	%g6,	%o4,	%o1
	sdivx	%o0,	0x1C02,	%o5
	add	%l1,	%i4,	%i7
	movrgz	%l4,	%i3,	%g4
	orncc	%o2,	%i5,	%g7
	srlx	%l5,	0x1F,	%o6
	srl	%i0,	0x0E,	%l0
	sir	0x0AD0
	fmovdvs	%icc,	%f6,	%f10
	sethi	0x14CE,	%g5
	ldd	[%l7 + 0x68],	%i0
	sir	0x02E8
	movrlez	%l6,	0x24D,	%o3
	movcs	%xcc,	%o7,	%i2
	orcc	%g3,	0x0C99,	%l3
	fcmpgt32	%f22,	%f14,	%g1
	fmovrse	%l2,	%f15,	%f27
	sllx	%g2,	%i6,	%o4
	edge8n	%g6,	%o0,	%o5
	umulcc	%l1,	0x1BB4,	%o1
	srlx	%i4,	0x10,	%l4
	sdivcc	%i7,	0x05CB,	%g4
	edge16l	%o2,	%i5,	%i3
	restore %g7, %o6, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%l0,	%i0,	%g5
	ldsb	[%l7 + 0x44],	%i1
	edge32n	%l6,	%o7,	%i2
	fmovsl	%xcc,	%f17,	%f2
	fmovsl	%icc,	%f1,	%f0
	nop
	set	0x40, %l3
	std	%f28,	[%l7 + %l3]
	movrne	%o3,	0x293,	%l3
	st	%f10,	[%l7 + 0x38]
	movg	%icc,	%g3,	%l2
	fpackfix	%f10,	%f30
	xor	%g1,	%i6,	%g2
	fexpand	%f20,	%f10
	fmovdge	%icc,	%f9,	%f26
	and	%g6,	0x1271,	%o4
	nop
	set	0x74, %g1
	lduw	[%l7 + %g1],	%o5
	subccc	%o0,	%o1,	%l1
	fmovdvc	%icc,	%f10,	%f2
	edge8	%l4,	%i4,	%g4
	mova	%icc,	%i7,	%o2
	ldsb	[%l7 + 0x1E],	%i3
	stb	%g7,	[%l7 + 0x36]
	addcc	%o6,	0x0CC2,	%l5
	xnor	%i5,	%i0,	%l0
	movle	%xcc,	%i1,	%l6
	ldsw	[%l7 + 0x3C],	%g5
	ld	[%l7 + 0x08],	%f8
	xnorcc	%i2,	%o7,	%l3
	sub	%g3,	%o3,	%l2
	edge16ln	%i6,	%g2,	%g6
	std	%f10,	[%l7 + 0x78]
	smul	%o4,	0x1B5C,	%o5
	fmovscc	%icc,	%f10,	%f17
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	std	%f26,	[%l7 + 0x20]
	movrne	%l1,	%o1,	%i4
	orn	%g4,	0x133F,	%l4
	ldsh	[%l7 + 0x74],	%o2
	fxors	%f18,	%f5,	%f1
	fnors	%f11,	%f1,	%f8
	xorcc	%i7,	%g7,	%o6
	addcc	%l5,	0x108D,	%i5
	smul	%i3,	0x0C92,	%l0
	srax	%i1,	%i0,	%g5
	siam	0x1
	st	%f11,	[%l7 + 0x20]
	fmovsvs	%xcc,	%f21,	%f1
	fcmpes	%fcc0,	%f23,	%f28
	xor	%i2,	0x1178,	%l6
	restore %l3, 0x13A4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o3,	%l2,	%g3
	movneg	%icc,	%g2,	%i6
	edge8ln	%o4,	%o5,	%g1
	movg	%xcc,	%g6,	%o0
	edge32ln	%l1,	%o1,	%i4
	movvs	%xcc,	%l4,	%g4
	ldsb	[%l7 + 0x1F],	%i7
	movle	%xcc,	%o2,	%o6
	add	%g7,	%l5,	%i3
	ldd	[%l7 + 0x30],	%f8
	sra	%i5,	0x14,	%l0
	srax	%i1,	0x15,	%i0
	umul	%i2,	0x05D0,	%g5
	srlx	%l6,	0x0B,	%l3
	subc	%o3,	0x18BE,	%o7
	ld	[%l7 + 0x44],	%f7
	siam	0x1
	fmovrde	%l2,	%f4,	%f14
	ldx	[%l7 + 0x50],	%g3
	popc	%g2,	%o4
	sethi	0x010A,	%i6
	movg	%xcc,	%o5,	%g1
	fsrc1	%f28,	%f8
	sra	%g6,	%o0,	%l1
	movrne	%o1,	%i4,	%g4
	fzeros	%f6
	movrlez	%l4,	0x29E,	%i7
	fmovda	%icc,	%f20,	%f17
	addcc	%o2,	0x05C9,	%g7
	ldsh	[%l7 + 0x10],	%o6
	movrlez	%l5,	0x0F6,	%i3
	andcc	%i5,	%l0,	%i0
	smul	%i2,	0x0239,	%i1
	fand	%f6,	%f0,	%f28
	movre	%l6,	0x0AD,	%g5
	subccc	%o3,	0x02CF,	%o7
	umulcc	%l2,	%l3,	%g3
	edge8n	%g2,	%i6,	%o4
	xnorcc	%g1,	0x1C1D,	%o5
	movleu	%icc,	%o0,	%l1
	move	%icc,	%g6,	%o1
	fmovd	%f8,	%f24
	fmuld8sux16	%f3,	%f8,	%f2
	fmovdpos	%icc,	%f24,	%f25
	fpmerge	%f3,	%f5,	%f6
	lduw	[%l7 + 0x20],	%i4
	orcc	%g4,	%l4,	%i7
	pdist	%f10,	%f22,	%f14
	movle	%icc,	%o2,	%g7
	xorcc	%l5,	%o6,	%i5
	sllx	%i3,	%l0,	%i0
	ldd	[%l7 + 0x18],	%i0
	movneg	%xcc,	%i2,	%g5
	orn	%l6,	0x1782,	%o3
	sub	%o7,	0x17CE,	%l2
	edge16n	%g3,	%g2,	%l3
	ldsb	[%l7 + 0x33],	%i6
	array16	%o4,	%o5,	%g1
	fpadd32s	%f30,	%f22,	%f1
	movrgez	%o0,	%g6,	%l1
	sdivcc	%o1,	0x07B5,	%i4
	edge8n	%g4,	%l4,	%i7
	fpadd32	%f2,	%f20,	%f26
	movleu	%icc,	%o2,	%l5
	sdiv	%g7,	0x16B1,	%o6
	sth	%i3,	[%l7 + 0x24]
	fnand	%f6,	%f12,	%f24
	movneg	%xcc,	%l0,	%i0
	fors	%f22,	%f3,	%f19
	fmovdgu	%xcc,	%f11,	%f6
	fsrc2s	%f31,	%f25
	smul	%i1,	%i5,	%i2
	xnorcc	%l6,	%g5,	%o3
	xnor	%l2,	%g3,	%g2
	udivcc	%l3,	0x1CAE,	%o7
	lduw	[%l7 + 0x10],	%i6
	move	%xcc,	%o5,	%o4
	fmovscc	%xcc,	%f6,	%f5
	fcmpeq32	%f14,	%f22,	%g1
	edge16l	%o0,	%g6,	%l1
	fmovrslez	%o1,	%f16,	%f4
	move	%icc,	%g4,	%l4
	nop
	set	0x58, %o1
	lduw	[%l7 + %o1],	%i4
	edge8ln	%o2,	%l5,	%i7
	sub	%o6,	0x1C21,	%i3
	array8	%l0,	%i0,	%g7
	subccc	%i1,	%i2,	%i5
	ldsh	[%l7 + 0x74],	%g5
	movneg	%xcc,	%l6,	%l2
	fnegd	%f18,	%f20
	sdivx	%g3,	0x009D,	%g2
	edge16	%l3,	%o3,	%i6
	movvc	%icc,	%o7,	%o5
	sethi	0x1A2A,	%o4
	fnors	%f27,	%f8,	%f22
	move	%icc,	%g1,	%o0
	orn	%g6,	%l1,	%g4
	fmovspos	%icc,	%f11,	%f27
	fxor	%f4,	%f2,	%f28
	fxor	%f0,	%f2,	%f18
	alignaddr	%o1,	%i4,	%o2
	movcs	%icc,	%l4,	%l5
	edge8l	%i7,	%i3,	%l0
	fmovsl	%xcc,	%f11,	%f8
	add	%o6,	%g7,	%i1
	ldsb	[%l7 + 0x5E],	%i0
	movn	%icc,	%i5,	%i2
	sra	%l6,	%l2,	%g3
	udivx	%g2,	0x1B86,	%l3
	sethi	0x155C,	%g5
	movcc	%icc,	%i6,	%o3
	movleu	%icc,	%o7,	%o5
	xnorcc	%o4,	%o0,	%g6
	udiv	%g1,	0x13F4,	%g4
	popc	0x0964,	%l1
	sll	%i4,	%o2,	%o1
	movre	%l4,	%l5,	%i3
	fnors	%f12,	%f21,	%f1
	movvs	%icc,	%l0,	%i7
	movcc	%xcc,	%g7,	%i1
	edge16n	%o6,	%i0,	%i5
	ldx	[%l7 + 0x70],	%i2
	fnot1s	%f29,	%f28
	movpos	%xcc,	%l2,	%l6
	umulcc	%g3,	0x150D,	%g2
	xorcc	%l3,	%i6,	%o3
	movne	%xcc,	%o7,	%g5
	fornot2s	%f12,	%f11,	%f19
	movneg	%xcc,	%o5,	%o4
	array16	%o0,	%g1,	%g6
	array32	%l1,	%i4,	%g4
	xnorcc	%o2,	0x1988,	%o1
	mulx	%l4,	%l5,	%l0
	udivcc	%i3,	0x1F7C,	%g7
	fmovscc	%xcc,	%f29,	%f1
	movcs	%icc,	%i1,	%o6
	lduw	[%l7 + 0x7C],	%i7
	fmovrdlz	%i5,	%f12,	%f2
	lduh	[%l7 + 0x4A],	%i2
	andncc	%i0,	%l2,	%l6
	nop
	set	0x35, %g4
	ldsb	[%l7 + %g4],	%g3
	movrlz	%l3,	0x356,	%g2
	andncc	%i6,	%o7,	%o3
	movl	%xcc,	%g5,	%o5
	movne	%xcc,	%o0,	%o4
	ldx	[%l7 + 0x28],	%g6
	ldsh	[%l7 + 0x1A],	%l1
	udiv	%i4,	0x19F0,	%g4
	andcc	%g1,	0x1BD8,	%o1
	udiv	%o2,	0x1CB9,	%l4
	ldsw	[%l7 + 0x5C],	%l0
	popc	%l5,	%i3
	subccc	%i1,	0x1902,	%g7
	fnand	%f6,	%f4,	%f28
	fmovdcs	%icc,	%f5,	%f21
	srax	%i7,	0x05,	%i5
	ldd	[%l7 + 0x30],	%f22
	fmovsn	%icc,	%f30,	%f1
	fsrc1s	%f15,	%f16
	udiv	%o6,	0x0E85,	%i0
	udivx	%l2,	0x08EC,	%l6
	ldsh	[%l7 + 0x16],	%i2
	stw	%g3,	[%l7 + 0x78]
	alignaddrl	%g2,	%l3,	%o7
	fcmpeq16	%f20,	%f28,	%i6
	edge32ln	%o3,	%o5,	%g5
	movgu	%xcc,	%o4,	%g6
	edge32l	%o0,	%l1,	%i4
	udivcc	%g4,	0x15B3,	%o1
	fmovdpos	%xcc,	%f9,	%f7
	sth	%o2,	[%l7 + 0x66]
	udivx	%g1,	0x066B,	%l4
	fmovrdgez	%l0,	%f6,	%f20
	array32	%l5,	%i3,	%i1
	edge8	%i7,	%i5,	%g7
	movge	%xcc,	%o6,	%i0
	or	%l6,	%i2,	%l2
	orcc	%g2,	%g3,	%l3
	mulscc	%i6,	%o7,	%o3
	add	%o5,	%o4,	%g6
	fmovspos	%xcc,	%f19,	%f16
	alignaddr	%o0,	%g5,	%i4
	udivcc	%g4,	0x1ED2,	%l1
	lduw	[%l7 + 0x48],	%o2
	movpos	%icc,	%g1,	%o1
	stx	%l0,	[%l7 + 0x68]
	fxnors	%f30,	%f4,	%f20
	fandnot2s	%f17,	%f18,	%f12
	movpos	%icc,	%l5,	%i3
	sllx	%l4,	0x10,	%i1
	smul	%i5,	0x1EA5,	%i7
	edge8	%o6,	%g7,	%i0
	ldsh	[%l7 + 0x28],	%i2
	umul	%l2,	0x131D,	%g2
	sllx	%l6,	0x10,	%g3
	ldsh	[%l7 + 0x62],	%i6
	srlx	%l3,	%o3,	%o7
	movvs	%xcc,	%o4,	%o5
	orncc	%g6,	%g5,	%i4
	sethi	0x0DFF,	%o0
	fmul8x16al	%f4,	%f29,	%f6
	fnegd	%f14,	%f14
	subcc	%l1,	0x19A3,	%o2
	fsrc2s	%f12,	%f24
	andn	%g1,	%g4,	%l0
	mulx	%l5,	0x0C4F,	%o1
	movrgez	%l4,	%i3,	%i5
	movvs	%xcc,	%i7,	%o6
	fmovsle	%xcc,	%f0,	%f6
	stx	%i1,	[%l7 + 0x38]
	ldd	[%l7 + 0x20],	%i0
	edge16	%i2,	%l2,	%g2
	fmovdle	%icc,	%f7,	%f22
	movrgz	%l6,	%g7,	%g3
	edge16l	%l3,	%i6,	%o7
	xnor	%o4,	%o5,	%o3
	fcmple32	%f26,	%f0,	%g5
	popc	%g6,	%i4
	movrgez	%l1,	0x261,	%o2
	fcmpne32	%f0,	%f8,	%o0
	save %g1, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sll	%o1,	0x0F,	%l5
	lduh	[%l7 + 0x36],	%l4
	movpos	%xcc,	%i5,	%i3
	fmovdn	%xcc,	%f13,	%f0
	edge32	%o6,	%i7,	%i0
	sethi	0x059F,	%i2
	orn	%l2,	0x15C7,	%g2
	smulcc	%l6,	%g7,	%i1
	sth	%l3,	[%l7 + 0x08]
	move	%xcc,	%i6,	%g3
	umulcc	%o7,	0x168A,	%o4
	fmovsa	%icc,	%f20,	%f9
	edge32	%o5,	%g5,	%g6
	edge32	%i4,	%l1,	%o3
	and	%o0,	%g1,	%o2
	fmovrsgez	%g4,	%f14,	%f31
	edge16ln	%l0,	%o1,	%l5
	fand	%f24,	%f24,	%f0
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	fornot1	%f24,	%f2,	%f16
	st	%f14,	[%l7 + 0x48]
	subcc	%i7,	%i3,	%i2
	fcmpgt16	%f28,	%f10,	%l2
	movleu	%xcc,	%g2,	%i0
	fmovrdne	%l6,	%f10,	%f6
	nop
	set	0x38, %i4
	std	%f24,	[%l7 + %i4]
	add	%i1,	%g7,	%l3
	ldsh	[%l7 + 0x56],	%i6
	sdiv	%g3,	0x0B31,	%o7
	stx	%o5,	[%l7 + 0x18]
	stb	%o4,	[%l7 + 0x46]
	movrgz	%g6,	%g5,	%l1
	ldx	[%l7 + 0x08],	%o3
	andcc	%i4,	0x059C,	%o0
	edge8ln	%g1,	%g4,	%o2
	nop
	set	0x14, %i3
	ldub	[%l7 + %i3],	%o1
	edge32ln	%l5,	%i5,	%l0
	fmovrsgz	%o6,	%f22,	%f3
	movge	%icc,	%l4,	%i3
	edge16n	%i7,	%i2,	%g2
	movgu	%xcc,	%l2,	%l6
	stw	%i1,	[%l7 + 0x10]
	stx	%g7,	[%l7 + 0x20]
	sub	%i0,	%i6,	%l3
	smul	%o7,	%g3,	%o4
	fpackfix	%f2,	%f12
	movcs	%icc,	%o5,	%g5
	movl	%icc,	%g6,	%l1
	addcc	%i4,	0x0E2C,	%o0
	andn	%g1,	0x04F0,	%g4
	movg	%xcc,	%o3,	%o2
	stx	%o1,	[%l7 + 0x50]
	sir	0x179C
	movge	%icc,	%i5,	%l0
	fmovrdlez	%o6,	%f12,	%f16
	movcs	%xcc,	%l5,	%i3
	sdiv	%i7,	0x1589,	%i2
	addcc	%g2,	0x00E8,	%l4
	array8	%l2,	%l6,	%g7
	sdivcc	%i0,	0x0157,	%i1
	smulcc	%l3,	%i6,	%o7
	udivcc	%g3,	0x19F3,	%o5
	fandnot1	%f4,	%f6,	%f16
	movg	%xcc,	%g5,	%g6
	subccc	%l1,	0x1D20,	%i4
	movre	%o0,	%g1,	%o4
	fmovs	%f4,	%f26
	fmovrdlez	%g4,	%f30,	%f0
	fcmpeq32	%f4,	%f28,	%o2
	ldsb	[%l7 + 0x10],	%o1
	sub	%o3,	%i5,	%o6
	xorcc	%l0,	0x1439,	%l5
	srlx	%i7,	%i2,	%i3
	fcmpeq32	%f4,	%f20,	%g2
	fpadd16s	%f27,	%f14,	%f27
	move	%icc,	%l2,	%l4
	orcc	%g7,	0x0711,	%i0
	fandnot2s	%f19,	%f26,	%f28
	fands	%f21,	%f15,	%f7
	ldsh	[%l7 + 0x6E],	%i1
	sra	%l3,	0x14,	%i6
	subc	%o7,	0x18C5,	%l6
	ldsb	[%l7 + 0x7B],	%g3
	sra	%o5,	0x1E,	%g5
	udivx	%l1,	0x1515,	%g6
	sdivx	%o0,	0x0515,	%i4
	array16	%g1,	%g4,	%o2
	fmuld8ulx16	%f2,	%f31,	%f30
	movrlz	%o1,	0x25F,	%o4
	sra	%i5,	%o3,	%l0
	movleu	%xcc,	%o6,	%i7
	edge16ln	%i2,	%i3,	%l5
	xor	%l2,	%g2,	%g7
	orn	%i0,	%l4,	%l3
	edge32ln	%i6,	%o7,	%l6
	ldub	[%l7 + 0x6A],	%i1
	fsrc1	%f14,	%f8
	bshuffle	%f0,	%f6,	%f26
	add	%g3,	%o5,	%l1
	mulx	%g5,	0x159B,	%g6
	movl	%icc,	%i4,	%o0
	udivcc	%g4,	0x0CC5,	%g1
	movg	%xcc,	%o1,	%o2
	movpos	%xcc,	%i5,	%o3
	edge16	%o4,	%o6,	%i7
	movrgez	%l0,	%i2,	%l5
	movl	%icc,	%l2,	%g2
	edge32l	%i3,	%g7,	%i0
	restore %l4, %l3, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l6,	0x187F,	%i1
	fmovrsne	%g3,	%f24,	%f28
	lduh	[%l7 + 0x56],	%i6
	movrgz	%l1,	0x006,	%g5
	edge16l	%o5,	%g6,	%i4
	ldsw	[%l7 + 0x50],	%g4
	fnot2	%f20,	%f0
	fmovrdgz	%o0,	%f8,	%f28
	xnorcc	%g1,	%o2,	%i5
	edge16l	%o1,	%o4,	%o6
	array32	%i7,	%l0,	%o3
	fabss	%f27,	%f13
	ld	[%l7 + 0x6C],	%f26
	orncc	%l5,	%i2,	%l2
	edge16n	%i3,	%g7,	%i0
	edge32	%l4,	%l3,	%o7
	smul	%l6,	0x1348,	%i1
	orcc	%g3,	%g2,	%l1
	lduw	[%l7 + 0x58],	%g5
	popc	0x152A,	%o5
	orncc	%g6,	0x0B69,	%i4
	stw	%i6,	[%l7 + 0x0C]
	ld	[%l7 + 0x68],	%f9
	stx	%g4,	[%l7 + 0x20]
	stb	%g1,	[%l7 + 0x17]
	array16	%o0,	%i5,	%o2
	fmovdg	%xcc,	%f22,	%f30
	edge8l	%o4,	%o1,	%o6
	movn	%xcc,	%l0,	%o3
	fpsub32	%f12,	%f30,	%f6
	std	%f2,	[%l7 + 0x50]
	sth	%l5,	[%l7 + 0x2E]
	ldsh	[%l7 + 0x70],	%i7
	array32	%i2,	%i3,	%g7
	std	%f30,	[%l7 + 0x40]
	orn	%l2,	%l4,	%i0
	array8	%l3,	%l6,	%o7
	sth	%g3,	[%l7 + 0x26]
	mulscc	%g2,	%i1,	%g5
	xorcc	%o5,	%g6,	%i4
	ldsh	[%l7 + 0x32],	%l1
	sra	%g4,	%g1,	%o0
	xor	%i6,	0x0D2A,	%i5
	stw	%o2,	[%l7 + 0x7C]
	st	%f27,	[%l7 + 0x14]
	fmovrdlez	%o4,	%f2,	%f6
	umul	%o1,	0x0A7F,	%o6
	sdivcc	%l0,	0x0A66,	%o3
	edge8l	%i7,	%i2,	%l5
	stb	%i3,	[%l7 + 0x2B]
	umul	%g7,	%l4,	%i0
	array32	%l2,	%l3,	%o7
	fmovdg	%icc,	%f12,	%f10
	edge8ln	%l6,	%g2,	%i1
	ldsb	[%l7 + 0x5C],	%g3
	fmovsn	%icc,	%f31,	%f0
	andncc	%g5,	%g6,	%i4
	movrgez	%l1,	0x3E7,	%o5
	edge8ln	%g4,	%g1,	%i6
	smul	%o0,	%o2,	%o4
	edge32ln	%o1,	%o6,	%l0
	alignaddrl	%o3,	%i7,	%i2
	fmovsgu	%icc,	%f27,	%f4
	fmovsneg	%xcc,	%f2,	%f26
	edge8n	%l5,	%i3,	%g7
	alignaddrl	%l4,	%i0,	%l2
	udivcc	%l3,	0x1B69,	%o7
	fcmpeq16	%f28,	%f6,	%i5
	ldsw	[%l7 + 0x10],	%l6
	nop
	set	0x31, %i2
	ldsb	[%l7 + %i2],	%i1
	movn	%xcc,	%g2,	%g3
	movrne	%g6,	%i4,	%l1
	ldd	[%l7 + 0x08],	%o4
	ldub	[%l7 + 0x43],	%g5
	movvs	%xcc,	%g4,	%g1
	srax	%o0,	%o2,	%i6
	stw	%o4,	[%l7 + 0x30]
	srl	%o1,	0x1C,	%l0
	movge	%xcc,	%o6,	%o3
	move	%xcc,	%i7,	%l5
	movle	%icc,	%i2,	%i3
	mulx	%l4,	0x144B,	%i0
	subccc	%l2,	0x0EAA,	%l3
	move	%xcc,	%o7,	%g7
	ldsb	[%l7 + 0x59],	%l6
	sllx	%i5,	%g2,	%g3
	srl	%i1,	0x0A,	%i4
	fmuld8ulx16	%f24,	%f11,	%f8
	movvs	%xcc,	%l1,	%o5
	edge32ln	%g6,	%g4,	%g1
	ldd	[%l7 + 0x28],	%f18
	movpos	%icc,	%g5,	%o0
	movg	%xcc,	%o2,	%i6
	sdivx	%o1,	0x1F45,	%o4
	fxnor	%f14,	%f12,	%f30
	fmovdneg	%icc,	%f17,	%f8
	udivcc	%l0,	0x148B,	%o3
	fmovrsgz	%i7,	%f11,	%f25
	ld	[%l7 + 0x3C],	%f22
	xnor	%l5,	%o6,	%i3
	fmovrsne	%l4,	%f7,	%f1
	stb	%i0,	[%l7 + 0x7B]
	fxnor	%f24,	%f22,	%f16
	orcc	%l2,	0x1337,	%l3
	ldd	[%l7 + 0x70],	%i2
	fones	%f20
	array16	%o7,	%l6,	%i5
	movvs	%icc,	%g7,	%g2
	fmovdne	%icc,	%f16,	%f25
	ldub	[%l7 + 0x40],	%i1
	and	%i4,	%g3,	%l1
	fpack16	%f2,	%f0
	srlx	%g6,	%o5,	%g1
	alignaddr	%g5,	%o0,	%g4
	sir	0x1A76
	movvs	%icc,	%i6,	%o2
	edge8	%o1,	%l0,	%o3
	save %o4, %l5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%i3,	%i7,	%i0
	movvc	%xcc,	%l2,	%l3
	movn	%xcc,	%l4,	%i2
	fmovdl	%xcc,	%f1,	%f16
	movre	%o7,	0x2CA,	%l6
	save %i5, %g2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i4,	%g3,	%g7
	srlx	%g6,	%l1,	%g1
	edge8ln	%o5,	%o0,	%g5
	fcmpne16	%f10,	%f18,	%g4
	fmovscc	%icc,	%f11,	%f23
	mulscc	%i6,	%o1,	%o2
	movre	%l0,	%o4,	%o3
	mova	%xcc,	%l5,	%o6
	movrgz	%i7,	0x293,	%i0
	movg	%icc,	%l2,	%i3
	add	%l3,	%i2,	%l4
	xorcc	%l6,	0x1DB6,	%i5
	movrne	%g2,	0x047,	%o7
	fzeros	%f29
	nop
	set	0x62, %i5
	stb	%i1,	[%l7 + %i5]
	ldsh	[%l7 + 0x5C],	%g3
	fmovdvs	%xcc,	%f20,	%f26
	fcmpd	%fcc1,	%f8,	%f14
	addcc	%i4,	%g6,	%g7
	xnor	%g1,	0x0E2C,	%l1
	sir	0x1031
	save %o5, %g5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%icc,	%o0,	%i6
	addc	%o1,	0x0CFD,	%l0
	stb	%o4,	[%l7 + 0x68]
	orcc	%o2,	0x0883,	%o3
	fmovsvc	%icc,	%f18,	%f29
	movge	%icc,	%l5,	%o6
	movrlez	%i0,	%i7,	%i3
	edge32l	%l2,	%l3,	%l4
	smulcc	%i2,	0x0DDA,	%l6
	addcc	%g2,	%o7,	%i1
	fmuld8sux16	%f25,	%f23,	%f12
	movrlez	%g3,	%i5,	%i4
	ld	[%l7 + 0x78],	%f21
	sdivx	%g7,	0x03B8,	%g6
	movrlz	%l1,	0x15F,	%o5
	srl	%g5,	%g4,	%o0
	fnand	%f10,	%f26,	%f18
	for	%f14,	%f8,	%f22
	movg	%xcc,	%i6,	%g1
	popc	0x18BF,	%o1
	sth	%o4,	[%l7 + 0x0C]
	movrne	%o2,	%o3,	%l0
	array16	%o6,	%i0,	%i7
	fpsub16s	%f25,	%f0,	%f25
	movn	%xcc,	%l5,	%l2
	st	%f21,	[%l7 + 0x2C]
	alignaddrl	%i3,	%l3,	%i2
	xor	%l4,	0x0B04,	%l6
	fcmpd	%fcc0,	%f10,	%f2
	sethi	0x05A3,	%g2
	sth	%i1,	[%l7 + 0x30]
	sdivcc	%g3,	0x1730,	%o7
	fmovsge	%xcc,	%f22,	%f22
	movneg	%xcc,	%i5,	%g7
	popc	0x05FC,	%g6
	stx	%l1,	[%l7 + 0x60]
	array8	%o5,	%i4,	%g5
	faligndata	%f2,	%f14,	%f20
	movn	%xcc,	%g4,	%i6
	subcc	%g1,	0x11C7,	%o0
	sllx	%o4,	%o2,	%o1
	fnot1	%f14,	%f26
	addccc	%o3,	%o6,	%l0
	ldx	[%l7 + 0x38],	%i0
	edge16ln	%i7,	%l5,	%i3
	lduw	[%l7 + 0x28],	%l2
	edge16	%i2,	%l4,	%l3
	subc	%g2,	0x1543,	%l6
	movn	%icc,	%g3,	%i1
	sdivx	%o7,	0x0DE6,	%i5
	add	%g6,	%l1,	%o5
	sdiv	%g7,	0x0BFC,	%i4
	srax	%g4,	%i6,	%g5
	umul	%g1,	%o4,	%o2
	alignaddr	%o0,	%o3,	%o1
	fxors	%f30,	%f4,	%f13
	udivcc	%l0,	0x0987,	%o6
	umulcc	%i7,	%l5,	%i3
	xnor	%l2,	0x04F7,	%i0
	stx	%i2,	[%l7 + 0x78]
	subcc	%l4,	%l3,	%g2
	xorcc	%g3,	%i1,	%o7
	fmovscs	%xcc,	%f1,	%f25
	fnand	%f18,	%f14,	%f10
	movleu	%icc,	%l6,	%g6
	orncc	%l1,	%o5,	%i5
	sub	%g7,	%i4,	%i6
	lduh	[%l7 + 0x52],	%g5
	movneg	%icc,	%g1,	%o4
	stb	%o2,	[%l7 + 0x2E]
	movne	%xcc,	%g4,	%o0
	edge8l	%o3,	%l0,	%o6
	and	%o1,	%l5,	%i7
	movrlz	%i3,	%l2,	%i0
	orncc	%i2,	0x0AAE,	%l4
	subc	%g2,	%l3,	%i1
	andncc	%g3,	%l6,	%g6
	stb	%o7,	[%l7 + 0x6C]
	sll	%o5,	%l1,	%i5
	ldub	[%l7 + 0x72],	%i4
	fors	%f18,	%f26,	%f2
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	movcc	%xcc,	%g1,	%o4
	lduw	[%l7 + 0x68],	%g4
	nop
	set	0x34, %g5
	stw	%o2,	[%l7 + %g5]
	movrlez	%o3,	%l0,	%o6
	mova	%xcc,	%o1,	%o0
	for	%f18,	%f16,	%f8
	ldub	[%l7 + 0x5B],	%l5
	edge16ln	%i3,	%l2,	%i7
	move	%icc,	%i0,	%i2
	fcmple32	%f4,	%f0,	%g2
	movrgez	%l3,	%l4,	%i1
	ldsw	[%l7 + 0x14],	%g3
	fnor	%f22,	%f16,	%f4
	array8	%l6,	%g6,	%o5
	stx	%l1,	[%l7 + 0x18]
	popc	0x0C3F,	%o7
	sir	0x1954
	orn	%i5,	0x0B46,	%i4
	or	%g5,	0x0B98,	%i6
	siam	0x0
	udivcc	%g1,	0x09E3,	%g7
	movrlz	%o4,	0x1BF,	%o2
	addcc	%g4,	0x1715,	%o3
	fmovsa	%icc,	%f25,	%f2
	std	%f14,	[%l7 + 0x58]
	fmovse	%xcc,	%f13,	%f30
	andncc	%o6,	%o1,	%o0
	nop
	set	0x7C, %l2
	ldsw	[%l7 + %l2],	%l5
	edge32l	%l0,	%i3,	%l2
	sdivx	%i7,	0x1BA7,	%i2
	smulcc	%i0,	%g2,	%l3
	edge8l	%l4,	%i1,	%g3
	array16	%g6,	%o5,	%l6
	edge16ln	%l1,	%o7,	%i5
	smulcc	%g5,	%i4,	%g1
	fmovsvc	%xcc,	%f25,	%f13
	orn	%g7,	0x09AA,	%i6
	add	%o4,	0x1597,	%g4
	sdivx	%o2,	0x08BC,	%o3
	sdivcc	%o6,	0x02FE,	%o0
	fmovsa	%xcc,	%f15,	%f11
	fnor	%f12,	%f30,	%f26
	subccc	%o1,	%l0,	%i3
	edge8n	%l5,	%l2,	%i7
	edge16ln	%i2,	%g2,	%i0
	or	%l3,	%i1,	%l4
	stx	%g6,	[%l7 + 0x60]
	edge16	%g3,	%o5,	%l1
	fmovrsne	%o7,	%f30,	%f22
	ldsh	[%l7 + 0x3E],	%i5
	movn	%xcc,	%g5,	%l6
	sir	0x1AC0
	edge16l	%i4,	%g1,	%i6
	sdivcc	%o4,	0x0FA1,	%g4
	fone	%f24
	edge16l	%o2,	%g7,	%o6
	fmovrsgez	%o3,	%f2,	%f23
	fzero	%f20
	sir	0x1F5B
	umulcc	%o1,	%l0,	%o0
	addccc	%l5,	%i3,	%l2
	stb	%i2,	[%l7 + 0x7B]
	srlx	%g2,	0x1E,	%i7
	ldub	[%l7 + 0x42],	%i0
	fmovda	%icc,	%f3,	%f28
	movvc	%xcc,	%l3,	%l4
	std	%f18,	[%l7 + 0x70]
	umulcc	%g6,	%g3,	%o5
	fone	%f8
	sra	%i1,	0x10,	%l1
	movpos	%xcc,	%i5,	%o7
	mulscc	%g5,	%l6,	%g1
	stw	%i4,	[%l7 + 0x20]
	or	%i6,	0x07FF,	%g4
	udiv	%o4,	0x0DED,	%g7
	movle	%xcc,	%o2,	%o3
	umul	%o1,	%o6,	%l0
	popc	%l5,	%i3
	fornot1	%f20,	%f24,	%f30
	edge32ln	%o0,	%l2,	%i2
	movcc	%icc,	%i7,	%g2
	movgu	%xcc,	%l3,	%i0
	fmovde	%icc,	%f24,	%f5
	fmul8x16al	%f6,	%f22,	%f14
	movrlez	%g6,	0x3B2,	%g3
	fcmpne16	%f30,	%f18,	%o5
	movrgz	%l4,	%i1,	%i5
	fcmpne16	%f14,	%f4,	%l1
	lduw	[%l7 + 0x6C],	%g5
	umul	%l6,	%g1,	%o7
	sll	%i6,	%i4,	%g4
	fmovdpos	%icc,	%f25,	%f9
	fpsub16	%f18,	%f16,	%f16
	sir	0x176C
	addccc	%o4,	%g7,	%o3
	ldsb	[%l7 + 0x2D],	%o1
	edge32n	%o2,	%l0,	%l5
	movle	%icc,	%o6,	%i3
	movrlez	%o0,	%i2,	%i7
	smul	%l2,	%g2,	%i0
	fcmps	%fcc1,	%f30,	%f18
	andncc	%g6,	%g3,	%o5
	array16	%l3,	%i1,	%i5
	edge16ln	%l1,	%g5,	%l6
	andn	%l4,	0x0700,	%g1
	lduw	[%l7 + 0x1C],	%o7
	fsrc1s	%f5,	%f25
	movrne	%i4,	0x0A0,	%i6
	orncc	%o4,	0x0B52,	%g4
	array8	%o3,	%g7,	%o1
	sra	%l0,	%l5,	%o2
	fabsd	%f30,	%f28
	fmovdvs	%xcc,	%f8,	%f2
	stw	%i3,	[%l7 + 0x48]
	fxors	%f21,	%f12,	%f24
	movneg	%icc,	%o6,	%i2
	movvc	%xcc,	%o0,	%l2
	xorcc	%i7,	%g2,	%i0
	movne	%xcc,	%g3,	%o5
	sdiv	%g6,	0x0380,	%i1
	fxnor	%f20,	%f30,	%f4
	fmovrsgz	%l3,	%f17,	%f16
	nop
	set	0x65, %g2
	ldub	[%l7 + %g2],	%l1
	lduw	[%l7 + 0x10],	%g5
	fzeros	%f27
	ldd	[%l7 + 0x78],	%f16
	st	%f6,	[%l7 + 0x78]
	movrlz	%i5,	0x3C9,	%l4
	xnorcc	%g1,	%l6,	%o7
	fpsub32	%f14,	%f12,	%f24
	edge16l	%i6,	%o4,	%g4
	stw	%i4,	[%l7 + 0x40]
	edge8	%g7,	%o1,	%o3
	edge16n	%l5,	%l0,	%i3
	popc	%o2,	%i2
	fcmpgt32	%f24,	%f8,	%o0
	srax	%o6,	0x00,	%l2
	ldd	[%l7 + 0x18],	%f12
	fsrc2	%f30,	%f18
	ldsh	[%l7 + 0x6A],	%g2
	fmovd	%f14,	%f22
	fmovdg	%xcc,	%f29,	%f11
	udivcc	%i7,	0x1221,	%i0
	orncc	%g3,	0x1CF3,	%o5
	movrlez	%i1,	%g6,	%l1
	alignaddrl	%g5,	%l3,	%l4
	st	%f8,	[%l7 + 0x38]
	xnor	%g1,	%l6,	%i5
	movcs	%icc,	%i6,	%o4
	fmovrsne	%g4,	%f30,	%f26
	movpos	%xcc,	%i4,	%o7
	fcmpne16	%f22,	%f8,	%g7
	andncc	%o3,	%l5,	%l0
	fmovsgu	%xcc,	%f25,	%f15
	fmovdg	%xcc,	%f16,	%f18
	fcmpne32	%f18,	%f16,	%o1
	xnorcc	%o2,	%i3,	%o0
	movcs	%xcc,	%o6,	%l2
	fmovrdlz	%i2,	%f2,	%f0
	fmovrslz	%i7,	%f17,	%f3
	movrgez	%g2,	0x2B3,	%i0
	sdiv	%o5,	0x1653,	%i1
	sll	%g3,	0x15,	%g6
	save %l1, 0x090D, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l4,	%g5
	mulx	%g1,	0x1464,	%l6
	edge16l	%i5,	%i6,	%o4
	move	%icc,	%g4,	%o7
	addcc	%i4,	0x0E58,	%g7
	lduw	[%l7 + 0x60],	%o3
	array8	%l0,	%o1,	%l5
	stw	%i3,	[%l7 + 0x30]
	fnot1s	%f17,	%f27
	stx	%o0,	[%l7 + 0x20]
	movg	%icc,	%o2,	%l2
	fmovdpos	%icc,	%f17,	%f20
	subcc	%o6,	%i2,	%g2
	andncc	%i0,	%i7,	%i1
	alignaddrl	%o5,	%g6,	%g3
	udiv	%l1,	0x05C4,	%l3
	sth	%g5,	[%l7 + 0x1A]
	edge32n	%l4,	%g1,	%l6
	movrne	%i6,	0x0A9,	%o4
	fmovsgu	%xcc,	%f24,	%f18
	umul	%g4,	%o7,	%i5
	mulx	%i4,	%g7,	%l0
	fmul8x16al	%f1,	%f28,	%f12
	fcmped	%fcc3,	%f4,	%f14
	ldsb	[%l7 + 0x10],	%o1
	edge8	%o3,	%i3,	%l5
	nop
	set	0x30, %o6
	ldd	[%l7 + %o6],	%o0
	andncc	%o2,	%l2,	%o6
	stw	%g2,	[%l7 + 0x40]
	xor	%i0,	0x0E23,	%i2
	xnorcc	%i1,	0x0BD1,	%i7
	restore %o5, %g3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g6,	0x02,	%g5
	ld	[%l7 + 0x3C],	%f15
	fmovdg	%icc,	%f21,	%f0
	fmovdn	%xcc,	%f19,	%f28
	edge32l	%l4,	%l3,	%l6
	sdivx	%i6,	0x1A01,	%g1
	save %g4, 0x10E2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x009E,	%i5
	movpos	%xcc,	%o4,	%g7
	stx	%l0,	[%l7 + 0x48]
	movvs	%xcc,	%o1,	%i4
	sra	%o3,	%l5,	%i3
	fpack16	%f18,	%f12
	subccc	%o2,	%l2,	%o0
	ldsb	[%l7 + 0x3C],	%g2
	fmovsne	%icc,	%f1,	%f21
	array16	%o6,	%i2,	%i0
	edge32	%i1,	%o5,	%i7
	mova	%icc,	%g3,	%g6
	sll	%g5,	0x0D,	%l1
	or	%l3,	%l4,	%i6
	fpsub16s	%f21,	%f19,	%f7
	andn	%g1,	%g4,	%l6
	alignaddrl	%o7,	%i5,	%g7
	and	%o4,	%l0,	%o1
	movvs	%xcc,	%o3,	%i4
	smul	%l5,	0x18AC,	%i3
	edge16l	%l2,	%o2,	%o0
	addc	%g2,	%i2,	%o6
	ldd	[%l7 + 0x50],	%i0
	subcc	%o5,	%i7,	%i0
	andn	%g6,	%g5,	%l1
	ldsh	[%l7 + 0x26],	%l3
	save %l4, %g3, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%g4,	0x087B,	%i6
	ldd	[%l7 + 0x60],	%f20
	alignaddr	%l6,	%i5,	%o7
	mulscc	%o4,	%l0,	%o1
	or	%g7,	%o3,	%l5
	movrlz	%i4,	%l2,	%i3
	fmovsl	%xcc,	%f8,	%f29
	fandnot2s	%f10,	%f30,	%f28
	movneg	%icc,	%o0,	%o2
	fones	%f21
	fmuld8ulx16	%f21,	%f2,	%f12
	lduh	[%l7 + 0x5A],	%g2
	addcc	%i2,	0x0D17,	%i1
	sethi	0x1F63,	%o6
	movvs	%xcc,	%i7,	%o5
	lduw	[%l7 + 0x20],	%i0
	srlx	%g6,	0x08,	%g5
	fmovspos	%xcc,	%f4,	%f16
	array32	%l3,	%l4,	%l1
	add	%g3,	0x0E77,	%g1
	fmovdcs	%xcc,	%f25,	%f13
	fmovrsgz	%i6,	%f14,	%f17
	fmovsle	%icc,	%f8,	%f22
	addccc	%l6,	%i5,	%o7
	fcmpne32	%f6,	%f0,	%o4
	sdivx	%l0,	0x1146,	%o1
	fxnor	%f4,	%f0,	%f12
	movne	%icc,	%g4,	%g7
	udivcc	%o3,	0x1650,	%l5
	ldd	[%l7 + 0x70],	%l2
	fcmps	%fcc3,	%f26,	%f26
	array16	%i4,	%i3,	%o0
	fmovrdlz	%g2,	%f14,	%f10
	array32	%i2,	%i1,	%o6
	umul	%i7,	0x10C9,	%o2
	movl	%xcc,	%o5,	%g6
	movgu	%icc,	%g5,	%i0
	ldsh	[%l7 + 0x5E],	%l4
	sra	%l3,	%g3,	%g1
	movne	%xcc,	%l1,	%l6
	ldsh	[%l7 + 0x60],	%i6
	fmul8ulx16	%f30,	%f16,	%f8
	umul	%i5,	%o7,	%l0
	lduw	[%l7 + 0x60],	%o4
	edge16l	%g4,	%g7,	%o3
	movneg	%xcc,	%o1,	%l5
	sllx	%i4,	0x16,	%l2
	andncc	%o0,	%i3,	%i2
	mova	%icc,	%g2,	%o6
	movrne	%i1,	0x157,	%o2
	fmovdpos	%icc,	%f10,	%f19
	edge8ln	%i7,	%g6,	%o5
	fxnors	%f21,	%f25,	%f14
	fmovrdne	%g5,	%f20,	%f4
	xnor	%i0,	%l4,	%l3
	fmovdgu	%xcc,	%f30,	%f21
	xnorcc	%g3,	0x18A9,	%g1
	movrne	%l6,	%i6,	%l1
	fnand	%f20,	%f24,	%f30
	stb	%i5,	[%l7 + 0x56]
	orn	%o7,	0x1E69,	%l0
	fmovsleu	%xcc,	%f6,	%f12
	fmovdne	%xcc,	%f26,	%f17
	lduh	[%l7 + 0x32],	%o4
	nop
	set	0x70, %l0
	ldd	[%l7 + %l0],	%g6
	sra	%g4,	%o3,	%o1
	srlx	%l5,	%i4,	%l2
	andncc	%i3,	%o0,	%i2
	orncc	%g2,	%i1,	%o2
	umul	%i7,	0x010A,	%o6
	ldx	[%l7 + 0x28],	%o5
	ldd	[%l7 + 0x60],	%g6
	addcc	%g5,	%i0,	%l3
	ldx	[%l7 + 0x60],	%g3
	fmovdl	%xcc,	%f28,	%f20
	sir	0x1EEC
	movvs	%xcc,	%l4,	%l6
	fpack32	%f28,	%f18,	%f14
	movle	%icc,	%i6,	%l1
	save %i5, 0x17C8, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f6,	%f28,	%l0
	ldsb	[%l7 + 0x1A],	%o4
	move	%icc,	%g7,	%g4
	sir	0x09F8
	fmovrde	%o3,	%f6,	%f20
	sub	%o7,	%l5,	%o1
	edge16n	%i4,	%l2,	%i3
	udivx	%i2,	0x0031,	%o0
	stb	%i1,	[%l7 + 0x57]
	movle	%xcc,	%g2,	%i7
	orncc	%o2,	0x0D12,	%o6
	ldd	[%l7 + 0x40],	%f2
	movge	%xcc,	%g6,	%g5
	orn	%i0,	%o5,	%g3
	fornot1s	%f19,	%f17,	%f5
	movpos	%icc,	%l3,	%l4
	fmuld8sux16	%f16,	%f10,	%f6
	udivx	%l6,	0x1F78,	%l1
	subc	%i6,	0x1EF3,	%i5
	udivcc	%l0,	0x0AE0,	%g1
	subcc	%o4,	%g7,	%g4
	fnor	%f30,	%f4,	%f12
	alignaddr	%o7,	%o3,	%l5
	fmovdleu	%xcc,	%f18,	%f30
	umul	%i4,	%o1,	%l2
	sdiv	%i3,	0x1036,	%i2
	ldd	[%l7 + 0x20],	%f8
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	restore %o0, %o2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%g6
	fmovsneg	%xcc,	%f18,	%f5
	xnorcc	%g5,	0x188B,	%i0
	alignaddrl	%o5,	%i7,	%l3
	orn	%l4,	0x025F,	%l6
	fmovrdne	%g3,	%f20,	%f4
	nop
	set	0x1E, %i7
	sth	%i6,	[%l7 + %i7]
	alignaddrl	%i5,	%l1,	%l0
	stw	%o4,	[%l7 + 0x1C]
	stw	%g7,	[%l7 + 0x08]
	andcc	%g1,	0x0D6A,	%o7
	xnor	%o3,	0x1933,	%g4
	xnor	%i4,	0x1670,	%o1
	fmovrdlez	%l2,	%f8,	%f10
	save %l5, %i3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%g2,	0x00FD,	%i1
	edge16n	%o2,	%o0,	%o6
	sir	0x1C4D
	udivcc	%g5,	0x0171,	%g6
	udiv	%o5,	0x1B56,	%i7
	nop
	set	0x0F, %o5
	stb	%l3,	[%l7 + %o5]
	movge	%xcc,	%l4,	%i0
	addccc	%g3,	0x178B,	%i6
	movre	%l6,	%l1,	%i5
	fpsub32	%f18,	%f22,	%f12
	smulcc	%l0,	0x12A8,	%o4
	or	%g7,	0x15FA,	%g1
	fmovdvs	%xcc,	%f5,	%f3
	movg	%xcc,	%o7,	%g4
	edge16l	%i4,	%o1,	%l2
	sdiv	%o3,	0x05A9,	%i3
	movleu	%icc,	%i2,	%l5
	movl	%xcc,	%g2,	%o2
	sll	%i1,	%o6,	%g5
	fcmpne16	%f30,	%f10,	%g6
	fmovrdlez	%o5,	%f12,	%f4
	array32	%o0,	%i7,	%l4
	movre	%l3,	0x2E8,	%g3
	addccc	%i0,	%l6,	%l1
	xnor	%i5,	%i6,	%o4
	andcc	%l0,	%g7,	%o7
	srax	%g1,	0x01,	%i4
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	fexpand	%f16,	%f24
	umul	%o3,	0x17A7,	%o1
	orn	%i2,	0x1F9E,	%i3
	lduh	[%l7 + 0x54],	%g2
	movvs	%xcc,	%o2,	%l5
	subcc	%o6,	%i1,	%g6
	fmovse	%xcc,	%f26,	%f7
	std	%f10,	[%l7 + 0x38]
	edge8n	%g5,	%o0,	%i7
	sth	%o5,	[%l7 + 0x3A]
	nop
	set	0x7C, %o0
	lduw	[%l7 + %o0],	%l4
	save %g3, 0x17DD, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x78]
	edge8n	%l6,	%l1,	%i5
	edge8l	%i6,	%o4,	%l0
	faligndata	%f20,	%f6,	%f30
	ldsh	[%l7 + 0x3A],	%i0
	movrne	%o7,	%g1,	%g7
	srl	%i4,	0x12,	%g4
	alignaddrl	%l2,	%o1,	%i2
	lduh	[%l7 + 0x4A],	%o3
	fmul8x16au	%f15,	%f8,	%f30
	fmovsg	%xcc,	%f12,	%f7
	fmul8x16au	%f12,	%f0,	%f26
	stw	%i3,	[%l7 + 0x18]
	movrgez	%o2,	0x31B,	%l5
	array32	%g2,	%o6,	%i1
	fmovdle	%icc,	%f17,	%f31
	edge16	%g6,	%g5,	%o0
	subcc	%i7,	0x0165,	%o5
	fmovsa	%icc,	%f20,	%f6
	edge8l	%g3,	%l3,	%l6
	fpadd16	%f26,	%f14,	%f26
	fmovscs	%xcc,	%f1,	%f19
	array32	%l1,	%i5,	%l4
	sth	%i6,	[%l7 + 0x50]
	sub	%o4,	%i0,	%o7
	fpadd16	%f24,	%f18,	%f26
	udivx	%g1,	0x179A,	%l0
	andn	%i4,	0x1279,	%g7
	add	%g4,	%l2,	%i2
	siam	0x4
	array16	%o1,	%i3,	%o3
	srlx	%l5,	%g2,	%o6
	mulx	%o2,	%g6,	%g5
	sra	%o0,	0x15,	%i7
	movneg	%xcc,	%o5,	%g3
	umulcc	%i1,	%l6,	%l3
	edge32l	%i5,	%l4,	%l1
	andn	%o4,	0x093A,	%i0
	xnorcc	%i6,	%g1,	%l0
	movrne	%i4,	%o7,	%g7
	std	%f28,	[%l7 + 0x50]
	nop
	set	0x28, %i0
	sth	%g4,	[%l7 + %i0]
	and	%l2,	0x1D8C,	%i2
	fmovrsne	%i3,	%f2,	%f5
	andncc	%o3,	%l5,	%o1
	addcc	%g2,	0x1C0F,	%o6
	subccc	%g6,	%g5,	%o2
	smul	%i7,	0x0858,	%o0
	sub	%o5,	0x04E8,	%i1
	movcs	%icc,	%l6,	%g3
	fpsub16	%f24,	%f2,	%f24
	fornot2s	%f1,	%f18,	%f24
	fxors	%f9,	%f30,	%f19
	udiv	%l3,	0x0029,	%l4
	mulscc	%i5,	%o4,	%l1
	orcc	%i0,	0x0B37,	%g1
	bshuffle	%f30,	%f4,	%f4
	edge16ln	%l0,	%i6,	%o7
	stx	%g7,	[%l7 + 0x48]
	movl	%xcc,	%g4,	%i4
	and	%l2,	0x1100,	%i2
	fmovrsgez	%o3,	%f20,	%f17
	ld	[%l7 + 0x3C],	%f22
	sdiv	%l5,	0x1D59,	%i3
	smulcc	%o1,	%o6,	%g2
	subcc	%g6,	0x12B3,	%o2
	edge32	%i7,	%g5,	%o5
	array8	%i1,	%o0,	%l6
	ldd	[%l7 + 0x50],	%l2
	sub	%g3,	0x141C,	%l4
	subcc	%i5,	0x0B8B,	%l1
	movne	%icc,	%i0,	%g1
	sll	%o4,	%i6,	%o7
	sdivcc	%g7,	0x0858,	%g4
	udiv	%i4,	0x1FE2,	%l2
	movre	%i2,	%o3,	%l0
	sllx	%i3,	0x13,	%o1
	ldub	[%l7 + 0x75],	%l5
	sth	%g2,	[%l7 + 0x6E]
	movleu	%xcc,	%o6,	%g6
	fmovsleu	%xcc,	%f10,	%f11
	addcc	%o2,	%i7,	%g5
	mulscc	%i1,	%o0,	%l6
	ldd	[%l7 + 0x60],	%l2
	fxnors	%f4,	%f1,	%f18
	faligndata	%f16,	%f24,	%f0
	edge16	%g3,	%o5,	%l4
	nop
	set	0x50, %g6
	lduh	[%l7 + %g6],	%l1
	umulcc	%i0,	0x0964,	%g1
	or	%o4,	%i6,	%o7
	movrgez	%i5,	0x135,	%g4
	fand	%f2,	%f2,	%f14
	edge8	%g7,	%l2,	%i4
	udivcc	%i2,	0x0212,	%l0
	edge8n	%o3,	%o1,	%i3
	sdivcc	%g2,	0x1DD9,	%l5
	movvs	%xcc,	%g6,	%o2
	ldd	[%l7 + 0x50],	%o6
	fnands	%f8,	%f4,	%f30
	fmovscs	%xcc,	%f23,	%f14
	movcc	%xcc,	%g5,	%i1
	xor	%o0,	0x086D,	%l6
	sth	%l3,	[%l7 + 0x7A]
	edge32ln	%i7,	%g3,	%l4
	movneg	%icc,	%o5,	%i0
	fmovrslz	%g1,	%f3,	%f16
	movvc	%xcc,	%o4,	%l1
	edge32ln	%i6,	%i5,	%o7
	udivx	%g7,	0x1E2A,	%g4
	fandnot2	%f30,	%f14,	%f28
	orcc	%i4,	0x041F,	%l2
	sllx	%i2,	0x15,	%l0
	umul	%o1,	%i3,	%g2
	edge16ln	%l5,	%o3,	%g6
	fmul8ulx16	%f10,	%f26,	%f24
	movle	%xcc,	%o6,	%o2
	edge16l	%g5,	%o0,	%i1
	sdivcc	%l6,	0x16DE,	%i7
	movrlz	%g3,	0x081,	%l3
	fsrc2s	%f6,	%f29
	or	%l4,	%i0,	%g1
	xor	%o5,	0x0AA9,	%o4
	movvs	%xcc,	%l1,	%i5
	move	%icc,	%o7,	%i6
	ldub	[%l7 + 0x60],	%g4
	movn	%xcc,	%i4,	%l2
	fmovde	%icc,	%f24,	%f23
	fmovdneg	%xcc,	%f15,	%f14
	sdivx	%i2,	0x0DAC,	%l0
	andncc	%g7,	%o1,	%i3
	addccc	%g2,	%l5,	%o3
	nop
	set	0x3C, %i1
	lduw	[%l7 + %i1],	%o6
	array32	%g6,	%o2,	%o0
	ldub	[%l7 + 0x6A],	%i1
	fmovsne	%icc,	%f24,	%f30
	srax	%g5,	%l6,	%i7
	mulx	%g3,	%l3,	%l4
	fones	%f0
	movrgez	%g1,	0x010,	%i0
	movrlez	%o4,	%o5,	%i5
	ldd	[%l7 + 0x20],	%o6
	alignaddr	%l1,	%i6,	%i4
	restore %g4, 0x1BCD, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i2, 0x1AE8, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x35],	%l0
	subccc	%i3,	%g2,	%l5
	fmovdgu	%icc,	%f5,	%f9
	xnor	%o3,	0x02E9,	%o6
	movcs	%xcc,	%o1,	%o2
	for	%f8,	%f16,	%f26
	edge16	%g6,	%o0,	%g5
	ldsb	[%l7 + 0x62],	%i1
	ldd	[%l7 + 0x58],	%f12
	sdivcc	%i7,	0x0E26,	%l6
	fcmpgt16	%f10,	%f26,	%l3
	edge32l	%g3,	%l4,	%i0
	sub	%o4,	%o5,	%g1
	sdiv	%o7,	0x15FA,	%l1
	fpackfix	%f4,	%f1
	xorcc	%i6,	0x1049,	%i4
	mulscc	%g4,	%l2,	%i2
	movrlez	%i5,	%l0,	%g7
	movneg	%icc,	%i3,	%g2
	sdivcc	%o3,	0x1B93,	%o6
	edge8	%o1,	%o2,	%g6
	xor	%l5,	%o0,	%i1
	mulx	%g5,	%l6,	%l3
	fmovscc	%icc,	%f1,	%f6
	fmovdcs	%xcc,	%f20,	%f0
	movpos	%icc,	%i7,	%g3
	edge16n	%i0,	%l4,	%o5
	or	%g1,	0x1137,	%o4
	and	%l1,	%o7,	%i6
	alignaddrl	%i4,	%l2,	%i2
	andn	%g4,	0x049D,	%i5
	movne	%xcc,	%g7,	%i3
	edge8ln	%g2,	%l0,	%o3
	sdivcc	%o1,	0x0129,	%o6
	fxors	%f20,	%f1,	%f7
	fpsub16s	%f30,	%f3,	%f11
	umulcc	%o2,	%l5,	%o0
	movcs	%icc,	%g6,	%g5
	std	%f14,	[%l7 + 0x08]
	fmovdpos	%xcc,	%f25,	%f31
	lduh	[%l7 + 0x44],	%l6
	ldx	[%l7 + 0x38],	%l3
	orcc	%i1,	%g3,	%i7
	movpos	%icc,	%l4,	%o5
	subcc	%i0,	%o4,	%g1
	srlx	%o7,	%i6,	%l1
	fxnors	%f19,	%f10,	%f6
	udiv	%l2,	0x0A3A,	%i2
	fmovsn	%xcc,	%f10,	%f14
	fmovdneg	%xcc,	%f13,	%f12
	ldsw	[%l7 + 0x74],	%g4
	mova	%icc,	%i4,	%g7
	srax	%i3,	0x1C,	%i5
	fandnot1	%f10,	%f10,	%f0
	ldd	[%l7 + 0x30],	%f22
	add	%g2,	%o3,	%o1
	edge8	%o6,	%o2,	%l0
	lduw	[%l7 + 0x40],	%o0
	edge8ln	%l5,	%g6,	%l6
	srl	%g5,	%l3,	%i1
	addcc	%g3,	%i7,	%l4
	edge32l	%i0,	%o5,	%o4
	fmovdcc	%icc,	%f4,	%f3
	srax	%o7,	%i6,	%l1
	fxnor	%f0,	%f26,	%f16
	ldub	[%l7 + 0x22],	%g1
	or	%l2,	%i2,	%g4
	save %i4, %g7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g2,	0x13DB,	%o3
	addc	%i3,	0x08F8,	%o1
	fmovsvs	%xcc,	%f29,	%f14
	alignaddrl	%o2,	%o6,	%l0
	fmuld8ulx16	%f22,	%f19,	%f8
	mulscc	%l5,	%g6,	%o0
	array32	%g5,	%l6,	%i1
	subcc	%g3,	0x078E,	%l3
	fcmple16	%f12,	%f4,	%l4
	fones	%f29
	movrlz	%i7,	%i0,	%o4
	movle	%xcc,	%o7,	%i6
	fnot2s	%f8,	%f30
	st	%f10,	[%l7 + 0x78]
	subcc	%o5,	%g1,	%l1
	edge16l	%l2,	%i2,	%g4
	movleu	%icc,	%g7,	%i4
	fmovsneg	%icc,	%f7,	%f18
	movn	%xcc,	%i5,	%o3
	pdist	%f2,	%f18,	%f10
	nop
	set	0x16, %o7
	sth	%g2,	[%l7 + %o7]
	ldsb	[%l7 + 0x36],	%i3
	movvc	%xcc,	%o1,	%o6
	edge16ln	%l0,	%l5,	%g6
	edge8	%o0,	%g5,	%l6
	lduh	[%l7 + 0x72],	%o2
	add	%g3,	%l3,	%i1
	fcmpeq16	%f10,	%f10,	%i7
	edge8n	%i0,	%o4,	%l4
	bshuffle	%f26,	%f28,	%f12
	fmuld8ulx16	%f18,	%f14,	%f18
	edge32n	%i6,	%o7,	%g1
	movvc	%xcc,	%o5,	%l1
	ldsh	[%l7 + 0x5E],	%i2
	movrgz	%g4,	0x00F,	%l2
	addccc	%g7,	0x02CB,	%i5
	array32	%o3,	%g2,	%i4
	or	%o1,	%o6,	%i3
	edge8ln	%l5,	%l0,	%o0
	mova	%xcc,	%g5,	%g6
	movvc	%xcc,	%l6,	%g3
	edge16	%l3,	%o2,	%i7
	addcc	%i0,	%o4,	%l4
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	fnors	%f16,	%f30,	%f31
	fsrc1	%f6,	%f18
	subccc	%i1,	%l1,	%i2
	movgu	%xcc,	%o5,	%g4
	fmovsn	%xcc,	%f20,	%f10
	subcc	%g7,	%i5,	%o3
	movgu	%icc,	%l2,	%g2
	mulscc	%i4,	%o6,	%o1
	srlx	%l5,	%l0,	%i3
	ld	[%l7 + 0x1C],	%f19
	orn	%o0,	0x1E3C,	%g6
	fmovdvc	%xcc,	%f17,	%f5
	sdivcc	%l6,	0x080F,	%g5
	subccc	%l3,	%g3,	%o2
	alignaddr	%i7,	%i0,	%o4
	sethi	0x1C17,	%l4
	movcs	%xcc,	%o7,	%i6
	fxors	%f8,	%f25,	%f26
	fmovsneg	%xcc,	%f26,	%f23
	lduh	[%l7 + 0x34],	%g1
	edge8l	%i1,	%i2,	%o5
	smul	%l1,	0x01C5,	%g7
	movgu	%xcc,	%g4,	%o3
	andncc	%l2,	%g2,	%i5
	st	%f14,	[%l7 + 0x34]
	stw	%o6,	[%l7 + 0x70]
	sethi	0x14C0,	%i4
	fnegs	%f19,	%f17
	edge32l	%o1,	%l5,	%i3
	edge32n	%o0,	%g6,	%l6
	addccc	%g5,	%l3,	%g3
	ld	[%l7 + 0x6C],	%f7
	movn	%icc,	%l0,	%i7
	movgu	%icc,	%o2,	%o4
	movle	%xcc,	%l4,	%o7
	stx	%i6,	[%l7 + 0x60]
	orcc	%i0,	0x1D1F,	%g1
	fmovsneg	%xcc,	%f4,	%f15
	fmovrsne	%i1,	%f26,	%f31
	udivx	%o5,	0x1B62,	%l1
	movneg	%xcc,	%i2,	%g4
	movle	%xcc,	%g7,	%o3
	edge16l	%g2,	%i5,	%l2
	movrlz	%o6,	0x22E,	%o1
	movrlez	%l5,	0x2B1,	%i3
	edge16ln	%o0,	%g6,	%i4
	subcc	%l6,	%l3,	%g5
	movvc	%icc,	%g3,	%l0
	umul	%i7,	%o2,	%o4
	move	%xcc,	%l4,	%i6
	movpos	%icc,	%o7,	%g1
	movg	%icc,	%i1,	%i0
	movn	%xcc,	%o5,	%i2
	addc	%g4,	0x09A0,	%l1
	orn	%o3,	0x11B3,	%g7
	ldd	[%l7 + 0x70],	%f26
	movgu	%xcc,	%g2,	%l2
	srlx	%o6,	0x0E,	%o1
	fornot2	%f4,	%f4,	%f16
	edge8ln	%l5,	%i3,	%i5
	orcc	%g6,	0x1054,	%o0
	xor	%i4,	%l6,	%l3
	edge8n	%g5,	%g3,	%i7
	lduw	[%l7 + 0x44],	%l0
	movpos	%xcc,	%o2,	%l4
	movrne	%i6,	0x2F1,	%o4
	andcc	%o7,	%g1,	%i0
	edge32ln	%o5,	%i1,	%i2
	srax	%l1,	0x0D,	%o3
	edge32	%g7,	%g2,	%g4
	movl	%icc,	%l2,	%o1
	edge16ln	%o6,	%i3,	%l5
	sdiv	%i5,	0x102D,	%g6
	umulcc	%o0,	%l6,	%l3
	array8	%i4,	%g5,	%i7
	fmovdl	%xcc,	%f16,	%f19
	fornot2s	%f4,	%f3,	%f2
	edge8l	%g3,	%l0,	%l4
	edge16ln	%i6,	%o4,	%o2
	fmovrdlz	%g1,	%f18,	%f0
	movne	%xcc,	%o7,	%i0
	or	%i1,	%i2,	%o5
	fcmpgt32	%f18,	%f24,	%l1
	fcmpd	%fcc2,	%f28,	%f12
	ldub	[%l7 + 0x2B],	%o3
	mulx	%g2,	%g4,	%l2
	movl	%icc,	%o1,	%g7
	edge32ln	%o6,	%l5,	%i5
	xor	%g6,	%o0,	%l6
	fmovrdlez	%i3,	%f4,	%f12
	movl	%xcc,	%l3,	%i4
	xnorcc	%i7,	%g5,	%l0
	fmovrdgz	%g3,	%f0,	%f24
	edge16n	%i6,	%o4,	%o2
	fmovsleu	%icc,	%f2,	%f23
	addccc	%l4,	0x0412,	%g1
	movl	%xcc,	%o7,	%i1
	fcmpd	%fcc3,	%f26,	%f2
	move	%icc,	%i0,	%i2
	fandnot2	%f26,	%f14,	%f16
	edge32ln	%l1,	%o5,	%o3
	and	%g2,	%g4,	%l2
	andncc	%g7,	%o1,	%l5
	fxnor	%f18,	%f14,	%f16
	edge16ln	%i5,	%o6,	%g6
	movcs	%xcc,	%o0,	%i3
	sethi	0x06BB,	%l6
	movrlz	%l3,	%i7,	%g5
	sth	%l0,	[%l7 + 0x40]
	std	%f26,	[%l7 + 0x18]
	fcmpgt16	%f18,	%f24,	%g3
	fpsub16	%f18,	%f0,	%f30
	movle	%icc,	%i4,	%i6
	srl	%o4,	0x0C,	%o2
	fnegs	%f22,	%f28
	ldsw	[%l7 + 0x40],	%g1
	orncc	%o7,	0x0A0D,	%i1
	bshuffle	%f26,	%f28,	%f16
	fmovrdgz	%l4,	%f24,	%f0
	fmovdvc	%xcc,	%f1,	%f24
	lduh	[%l7 + 0x40],	%i2
	edge32	%l1,	%o5,	%i0
	movrlez	%o3,	0x30C,	%g2
	mova	%xcc,	%g4,	%g7
	edge32l	%l2,	%l5,	%i5
	ld	[%l7 + 0x44],	%f14
	mova	%xcc,	%o1,	%g6
	subc	%o0,	%i3,	%l6
	smulcc	%o6,	0x0FEF,	%l3
	sir	0x09E0
	ldd	[%l7 + 0x70],	%f28
	orn	%g5,	0x105B,	%i7
	edge16ln	%g3,	%l0,	%i6
	fnot2s	%f31,	%f15
	sll	%i4,	%o4,	%g1
	alignaddr	%o2,	%o7,	%l4
	edge32	%i1,	%i2,	%l1
	movrne	%o5,	%i0,	%o3
	movneg	%icc,	%g4,	%g7
	sth	%l2,	[%l7 + 0x5C]
	movne	%icc,	%g2,	%i5
	edge16ln	%o1,	%g6,	%l5
	movpos	%icc,	%i3,	%l6
	ldd	[%l7 + 0x78],	%o6
	std	%f14,	[%l7 + 0x28]
	pdist	%f12,	%f2,	%f14
	movrne	%o0,	%g5,	%i7
	st	%f17,	[%l7 + 0x74]
	fmovsneg	%icc,	%f17,	%f0
	fmovdg	%icc,	%f23,	%f2
	add	%l3,	%g3,	%i6
	fpack16	%f6,	%f28
	move	%icc,	%l0,	%o4
	edge8ln	%i4,	%g1,	%o7
	fpsub16	%f16,	%f26,	%f22
	andn	%o2,	0x133C,	%l4
	sll	%i1,	%l1,	%o5
	udivcc	%i2,	0x005A,	%o3
	edge16	%i0,	%g4,	%l2
	sir	0x1C48
	fmovrslz	%g7,	%f9,	%f10
	ld	[%l7 + 0x50],	%f8
	fnot2	%f24,	%f30
	fcmple32	%f4,	%f24,	%i5
	movn	%icc,	%o1,	%g6
	stw	%g2,	[%l7 + 0x2C]
	movle	%xcc,	%i3,	%l6
	fmovsg	%xcc,	%f21,	%f21
	sdivcc	%o6,	0x0477,	%l5
	edge32ln	%g5,	%i7,	%l3
	umul	%o0,	%i6,	%g3
	movre	%l0,	%i4,	%o4
	movpos	%icc,	%g1,	%o2
	siam	0x2
	alignaddr	%l4,	%o7,	%l1
	and	%i1,	0x0707,	%i2
	fpsub16s	%f1,	%f8,	%f8
	movle	%icc,	%o5,	%o3
	move	%icc,	%g4,	%i0
	edge32l	%g7,	%i5,	%o1
	edge8l	%l2,	%g6,	%i3
	subc	%g2,	%o6,	%l5
	smul	%l6,	0x130D,	%g5
	fpackfix	%f28,	%f14
	movge	%xcc,	%l3,	%o0
	movne	%icc,	%i6,	%i7
	fabss	%f15,	%f13
	ldsb	[%l7 + 0x3E],	%g3
	movleu	%icc,	%i4,	%o4
	andcc	%g1,	0x1F4E,	%l0
	ldsh	[%l7 + 0x32],	%o2
	udivcc	%o7,	0x0365,	%l1
	subc	%l4,	%i1,	%i2
	xorcc	%o5,	%g4,	%o3
	movcc	%icc,	%i0,	%i5
	or	%o1,	%g7,	%g6
	movn	%xcc,	%i3,	%l2
	udiv	%g2,	0x09B4,	%o6
	mulscc	%l6,	0x146F,	%g5
	xorcc	%l3,	0x01AA,	%o0
	orncc	%l5,	0x0901,	%i7
	fmuld8ulx16	%f0,	%f7,	%f12
	movle	%xcc,	%g3,	%i4
	sth	%i6,	[%l7 + 0x64]
	edge32l	%g1,	%o4,	%l0
	udiv	%o7,	0x17F2,	%o2
	array16	%l4,	%i1,	%l1
	lduh	[%l7 + 0x26],	%o5
	fmovdpos	%icc,	%f21,	%f1
	edge16ln	%g4,	%o3,	%i2
	fpsub16	%f14,	%f6,	%f26
	fmovrsgez	%i0,	%f4,	%f1
	sethi	0x0CF4,	%o1
	movcc	%xcc,	%i5,	%g6
	save %g7, %i3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%l2,	0x07D3,	%o6
	lduh	[%l7 + 0x0A],	%l6
	mulx	%g5,	0x057C,	%l3
	xnorcc	%l5,	0x017B,	%i7
	edge16n	%g3,	%o0,	%i4
	movrgez	%g1,	0x093,	%i6
	restore %o4, 0x00BE, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f11,	[%l7 + 0x0C]
	movvc	%xcc,	%o7,	%l4
	sub	%o2,	0x13D8,	%l1
	fmovsn	%icc,	%f30,	%f28
	xorcc	%o5,	0x118D,	%g4
	stw	%i1,	[%l7 + 0x08]
	movgu	%icc,	%o3,	%i2
	fnor	%f20,	%f8,	%f8
	edge8ln	%i0,	%o1,	%i5
	sth	%g7,	[%l7 + 0x0A]
	sethi	0x095F,	%i3
	udivx	%g6,	0x06BA,	%g2
	xor	%l2,	0x11A8,	%l6
	movcc	%icc,	%g5,	%l3
	fmuld8sux16	%f23,	%f11,	%f6
	fmuld8ulx16	%f19,	%f30,	%f10
	sdivcc	%o6,	0x17D6,	%l5
	movne	%xcc,	%g3,	%i7
	fmovdvs	%xcc,	%f30,	%f6
	ldsb	[%l7 + 0x66],	%i4
	mulscc	%o0,	%i6,	%o4
	xor	%l0,	%g1,	%o7
	lduh	[%l7 + 0x6A],	%l4
	fmovsvs	%icc,	%f21,	%f18
	movle	%xcc,	%o2,	%l1
	srl	%g4,	0x01,	%o5
	nop
	set	0x08, %o2
	ldd	[%l7 + %o2],	%f0
	std	%f12,	[%l7 + 0x40]
	edge8n	%o3,	%i2,	%i0
	orn	%o1,	%i1,	%g7
	alignaddrl	%i5,	%g6,	%i3
	movg	%icc,	%l2,	%g2
	edge8	%l6,	%l3,	%g5
	movl	%icc,	%o6,	%g3
	fnegd	%f24,	%f10
	movre	%i7,	0x3AC,	%l5
	ldsw	[%l7 + 0x30],	%i4
	udivx	%o0,	0x1E46,	%o4
	movgu	%xcc,	%i6,	%g1
	movg	%xcc,	%l0,	%o7
	movpos	%icc,	%o2,	%l1
	smul	%g4,	%l4,	%o5
	fmovrslz	%o3,	%f14,	%f27
	movcc	%xcc,	%i0,	%o1
	movneg	%icc,	%i1,	%g7
	mulscc	%i2,	0x00A7,	%g6
	fmovdvs	%icc,	%f24,	%f17
	srl	%i3,	%l2,	%g2
	movn	%xcc,	%i5,	%l6
	edge16ln	%g5,	%o6,	%g3
	fexpand	%f9,	%f28
	subccc	%l3,	%l5,	%i4
	udiv	%i7,	0x1B5E,	%o0
	andcc	%i6,	%g1,	%l0
	movvs	%icc,	%o4,	%o2
	orcc	%l1,	%o7,	%l4
	movne	%icc,	%o5,	%o3
	sub	%i0,	%o1,	%i1
	subcc	%g7,	0x03A6,	%g4
	edge32l	%g6,	%i2,	%i3
	sdiv	%g2,	0x1C35,	%l2
	movl	%xcc,	%i5,	%g5
	edge32ln	%o6,	%l6,	%g3
	mulscc	%l3,	%l5,	%i4
	fcmpgt32	%f30,	%f0,	%o0
	edge32ln	%i7,	%g1,	%l0
	lduh	[%l7 + 0x54],	%i6
	xnor	%o4,	0x0B45,	%o2
	movrne	%l1,	%o7,	%o5
	movre	%o3,	0x11E,	%l4
	movre	%i0,	0x215,	%o1
	edge16ln	%g7,	%g4,	%i1
	orn	%g6,	%i3,	%i2
	movg	%xcc,	%g2,	%i5
	edge16ln	%l2,	%o6,	%g5
	fmovdcc	%icc,	%f12,	%f6
	mulx	%l6,	%g3,	%l5
	for	%f6,	%f22,	%f16
	array16	%l3,	%i4,	%o0
	ldub	[%l7 + 0x56],	%i7
	ldd	[%l7 + 0x08],	%f4
	fmovsne	%xcc,	%f24,	%f7
	xor	%g1,	0x0B42,	%i6
	orn	%l0,	0x1400,	%o4
	movrlz	%o2,	%l1,	%o7
	save %o3, %o5, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x20],	%l4
	or	%g7,	%g4,	%o1
	stw	%g6,	[%l7 + 0x28]
	movrne	%i3,	0x24A,	%i2
	fmovspos	%icc,	%f28,	%f8
	fmul8ulx16	%f14,	%f12,	%f22
	nop
	set	0x60, %g7
	std	%f26,	[%l7 + %g7]
	subc	%i1,	%g2,	%i5
	movleu	%icc,	%l2,	%o6
	sir	0x0FD3
	movrgz	%g5,	0x242,	%g3
	mulscc	%l6,	0x1FA1,	%l5
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	movleu	%xcc,	%g1,	%i4
	fnor	%f14,	%f14,	%f6
	edge32l	%i6,	%l0,	%o2
	fone	%f4
	ldx	[%l7 + 0x78],	%o4
	fcmpgt16	%f12,	%f16,	%o7
	save %o3, %o5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%i0,	%g7,	%g4
	movl	%xcc,	%o1,	%g6
	stb	%l4,	[%l7 + 0x4B]
	movrgez	%i3,	%i2,	%g2
	or	%i5,	0x133F,	%i1
	fmovsgu	%xcc,	%f23,	%f4
	fmovse	%icc,	%f3,	%f31
	ld	[%l7 + 0x78],	%f3
	std	%f14,	[%l7 + 0x50]
	or	%l2,	%g5,	%o6
	fmovrdne	%g3,	%f12,	%f0
	alignaddrl	%l6,	%l3,	%o0
	edge32ln	%l5,	%g1,	%i7
	ldd	[%l7 + 0x30],	%i6
	orcc	%i4,	%l0,	%o4
	nop
	set	0x50, %o3
	stx	%o2,	[%l7 + %o3]
	or	%o7,	%o5,	%o3
	and	%l1,	0x0E17,	%g7
	addccc	%i0,	%o1,	%g6
	xnorcc	%l4,	0x19A3,	%g4
	lduw	[%l7 + 0x50],	%i3
	andncc	%g2,	%i5,	%i2
	fandnot1	%f4,	%f8,	%f26
	fornot1s	%f18,	%f20,	%f26
	movcc	%xcc,	%i1,	%g5
	sub	%o6,	0x0090,	%g3
	alignaddr	%l6,	%l2,	%o0
	restore %l3, %g1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %l5, 0x0145, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f27,	%f16,	%f10
	mova	%icc,	%i4,	%o4
	sethi	0x013F,	%l0
	orn	%o2,	0x1729,	%o5
	udivcc	%o3,	0x1627,	%o7
	popc	%l1,	%i0
	movg	%xcc,	%o1,	%g6
	stx	%l4,	[%l7 + 0x68]
	movl	%xcc,	%g4,	%g7
	movgu	%icc,	%g2,	%i5
	fpsub32	%f8,	%f26,	%f12
	edge8	%i2,	%i1,	%g5
	ldsw	[%l7 + 0x1C],	%o6
	fxnor	%f12,	%f6,	%f18
	subccc	%i3,	%l6,	%l2
	movleu	%icc,	%g3,	%o0
	xnorcc	%l3,	%g1,	%l5
	fcmpeq16	%f2,	%f26,	%i6
	xnorcc	%i4,	0x1F1F,	%o4
	orncc	%i7,	%l0,	%o2
	orncc	%o3,	%o7,	%o5
	nop
	set	0x20, %g3
	ldd	[%l7 + %g3],	%l0
	fmovdg	%xcc,	%f18,	%f20
	fpsub16s	%f9,	%f11,	%f26
	movn	%icc,	%i0,	%g6
	fzeros	%f6
	movcs	%xcc,	%o1,	%g4
	edge8l	%g7,	%l4,	%g2
	fmovsn	%xcc,	%f9,	%f3
	movl	%xcc,	%i5,	%i1
	ldx	[%l7 + 0x78],	%g5
	movvs	%xcc,	%i2,	%i3
	fmul8ulx16	%f24,	%f16,	%f26
	fcmpne16	%f18,	%f30,	%o6
	alignaddr	%l2,	%l6,	%g3
	movne	%icc,	%o0,	%l3
	sdivcc	%g1,	0x02FC,	%i6
	movcs	%xcc,	%i4,	%o4
	ldx	[%l7 + 0x50],	%i7
	or	%l0,	%o2,	%l5
	fmovdvc	%icc,	%f25,	%f25
	fone	%f22
	mulx	%o7,	%o5,	%l1
	xnor	%i0,	%o3,	%o1
	udiv	%g4,	0x19AE,	%g7
	fcmped	%fcc2,	%f14,	%f20
	sra	%g6,	0x07,	%l4
	ldd	[%l7 + 0x68],	%g2
	fmovdpos	%icc,	%f24,	%f25
	orncc	%i5,	%i1,	%i2
	sethi	0x1059,	%i3
	andcc	%o6,	%l2,	%l6
	movrgz	%g5,	0x32A,	%o0
	edge16l	%g3,	%g1,	%i6
	or	%i4,	%l3,	%o4
	lduh	[%l7 + 0x44],	%l0
	smul	%i7,	0x1FB5,	%o2
	fxor	%f20,	%f6,	%f16
	umulcc	%o7,	0x12B6,	%o5
	and	%l1,	0x1A5E,	%i0
	edge32ln	%l5,	%o3,	%o1
	fmovrde	%g4,	%f28,	%f28
	fpadd32	%f18,	%f14,	%f26
	movrgz	%g6,	0x28C,	%g7
	add	%g2,	0x1B62,	%l4
	movl	%xcc,	%i5,	%i2
	lduw	[%l7 + 0x14],	%i1
	movrlez	%i3,	%l2,	%o6
	fmovsvc	%xcc,	%f7,	%f22
	stb	%g5,	[%l7 + 0x41]
	sdivx	%o0,	0x09EE,	%l6
	movl	%xcc,	%g3,	%g1
	move	%xcc,	%i4,	%i6
	umulcc	%l3,	0x09A6,	%o4
	alignaddr	%i7,	%o2,	%o7
	orcc	%o5,	0x17B4,	%l1
	and	%i0,	0x053D,	%l5
	nop
	set	0x52, %o4
	sth	%o3,	[%l7 + %o4]
	ldx	[%l7 + 0x50],	%o1
	srax	%l0,	0x10,	%g6
	sethi	0x0B62,	%g4
	ldub	[%l7 + 0x64],	%g7
	movneg	%icc,	%g2,	%i5
	edge8ln	%i2,	%i1,	%i3
	addc	%l2,	0x195E,	%o6
	array16	%g5,	%l4,	%o0
	fxor	%f0,	%f28,	%f30
	fmovsg	%xcc,	%f9,	%f2
	subcc	%g3,	0x02CA,	%l6
	alignaddr	%g1,	%i4,	%i6
	xor	%l3,	%o4,	%o2
	ldsw	[%l7 + 0x38],	%o7
	umulcc	%i7,	%o5,	%l1
	fnegs	%f2,	%f17
	ldd	[%l7 + 0x48],	%f8
	smulcc	%i0,	%l5,	%o3
	edge16	%o1,	%g6,	%g4
	movneg	%xcc,	%l0,	%g7
	lduw	[%l7 + 0x78],	%i5
	ldsb	[%l7 + 0x5C],	%i2
	sub	%i1,	0x0B49,	%i3
	movrlez	%l2,	%o6,	%g5
	sth	%g2,	[%l7 + 0x3E]
	orncc	%l4,	0x0DE2,	%g3
	edge32n	%l6,	%o0,	%i4
	smulcc	%i6,	0x1F3E,	%l3
	addc	%o4,	0x11EC,	%g1
	fcmpeq16	%f30,	%f12,	%o2
	fmovrsne	%o7,	%f13,	%f1
	andcc	%i7,	%l1,	%i0
	ldub	[%l7 + 0x5E],	%o5
	array8	%o3,	%l5,	%g6
	movn	%icc,	%o1,	%g4
	movleu	%xcc,	%g7,	%i5
	edge16n	%i2,	%i1,	%l0
	fmovsa	%xcc,	%f4,	%f11
	fmovrse	%i3,	%f20,	%f24
	movrgz	%l2,	%o6,	%g2
	sethi	0x0031,	%g5
	fnand	%f12,	%f0,	%f0
	fsrc2	%f12,	%f4
	edge32l	%l4,	%g3,	%o0
	xorcc	%l6,	%i4,	%i6
	movge	%icc,	%l3,	%g1
	addcc	%o2,	0x09A6,	%o7
	stb	%i7,	[%l7 + 0x08]
	add	%l1,	0x18A7,	%o4
	xorcc	%i0,	0x0BCA,	%o3
	udivx	%o5,	0x082D,	%g6
	edge8n	%l5,	%o1,	%g4
	ldd	[%l7 + 0x58],	%g6
	fornot2s	%f11,	%f0,	%f9
	movre	%i5,	0x10C,	%i2
	movrne	%l0,	0x2C6,	%i1
	movne	%icc,	%i3,	%l2
	fnot1	%f12,	%f8
	sth	%g2,	[%l7 + 0x1E]
	movrgz	%o6,	0x104,	%l4
	fpsub16	%f28,	%f12,	%f24
	udivcc	%g3,	0x042C,	%o0
	pdist	%f26,	%f8,	%f16
	fmul8x16al	%f3,	%f16,	%f28
	edge8ln	%l6,	%i4,	%i6
	xor	%l3,	%g1,	%g5
	movle	%xcc,	%o7,	%i7
	movcs	%xcc,	%l1,	%o4
	fmovrdlz	%i0,	%f0,	%f12
	fsrc1	%f26,	%f0
	nop
	set	0x30, %l5
	lduh	[%l7 + %l5],	%o3
	xorcc	%o5,	%g6,	%l5
	add	%o2,	0x0650,	%g4
	movrne	%g7,	%i5,	%o1
	edge32	%l0,	%i1,	%i2
	stw	%l2,	[%l7 + 0x2C]
	fmovrdlz	%i3,	%f26,	%f18
	ldx	[%l7 + 0x58],	%g2
	movrgz	%l4,	%o6,	%g3
	udivx	%o0,	0x0696,	%i4
	subccc	%l6,	%i6,	%g1
	fmovdgu	%xcc,	%f29,	%f11
	mova	%xcc,	%g5,	%l3
	edge32	%i7,	%o7,	%l1
	movle	%xcc,	%i0,	%o4
	andncc	%o3,	%o5,	%l5
	fmul8x16au	%f23,	%f19,	%f0
	and	%o2,	0x189A,	%g6
	move	%icc,	%g7,	%g4
	andn	%i5,	%o1,	%i1
	array32	%i2,	%l2,	%l0
	fxors	%f3,	%f18,	%f3
	edge16l	%g2,	%l4,	%i3
	array8	%g3,	%o0,	%i4
	fpmerge	%f19,	%f0,	%f10
	fmovdcs	%xcc,	%f2,	%f7
	smulcc	%l6,	0x1AD9,	%i6
	movre	%g1,	0x1F8,	%o6
	edge8n	%l3,	%g5,	%i7
	orn	%l1,	%o7,	%i0
	fmovdge	%xcc,	%f9,	%f1
	fmovsa	%icc,	%f12,	%f30
	array32	%o3,	%o4,	%o5
	sth	%l5,	[%l7 + 0x1C]
	srlx	%o2,	0x0E,	%g6
	fmovrse	%g4,	%f11,	%f28
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	mova	%xcc,	%i1,	%i5
	fmovdgu	%icc,	%f17,	%f20
	fmovsne	%icc,	%f24,	%f20
	sir	0x0906
	xnorcc	%l2,	0x174E,	%i2
	udivx	%g2,	0x0631,	%l0
	ld	[%l7 + 0x7C],	%f23
	andn	%i3,	0x1A84,	%l4
	movvs	%xcc,	%g3,	%i4
	orncc	%l6,	%i6,	%g1
	fmovdvs	%icc,	%f7,	%f20
	sir	0x1366
	xnor	%o0,	%o6,	%g5
	orcc	%l3,	%l1,	%o7
	fcmpeq32	%f22,	%f14,	%i0
	addcc	%o3,	0x0B52,	%i7
	fcmple16	%f28,	%f16,	%o4
	array16	%o5,	%l5,	%o2
	array16	%g6,	%g4,	%g7
	mulx	%o1,	0x179D,	%i5
	fmovrslez	%i1,	%f12,	%f1
	movg	%xcc,	%i2,	%l2
	smulcc	%l0,	%g2,	%l4
	movrgz	%i3,	%g3,	%l6
	edge16n	%i6,	%i4,	%g1
	fmovscs	%icc,	%f5,	%f7
	fcmpeq16	%f22,	%f14,	%o0
	fpmerge	%f6,	%f12,	%f8
	andncc	%o6,	%l3,	%l1
	addc	%o7,	%i0,	%o3
	sethi	0x1FDD,	%i7
	fmul8sux16	%f0,	%f26,	%f22
	fmovrdgez	%o4,	%f20,	%f12
	addccc	%o5,	%l5,	%g5
	srax	%g6,	%o2,	%g4
	lduw	[%l7 + 0x10],	%o1
	st	%f12,	[%l7 + 0x4C]
	fmovrsne	%g7,	%f5,	%f5
	andcc	%i5,	%i2,	%i1
	edge16ln	%l2,	%g2,	%l4
	fmul8x16	%f12,	%f28,	%f0
	fnor	%f22,	%f0,	%f6
	ldx	[%l7 + 0x70],	%l0
	movpos	%icc,	%g3,	%l6
	array32	%i3,	%i6,	%i4
	fornot1s	%f5,	%f14,	%f19
	ldd	[%l7 + 0x60],	%g0
	ldub	[%l7 + 0x2E],	%o0
	smul	%l3,	%l1,	%o7
	stw	%o6,	[%l7 + 0x0C]
	sub	%i0,	0x17D3,	%i7
	add	%o3,	0x102F,	%o4
	and	%l5,	%g5,	%g6
	sdiv	%o2,	0x1DA6,	%o5
	smulcc	%g4,	%g7,	%o1
	nop
	set	0x6C, %l6
	ldsw	[%l7 + %l6],	%i5
	fmovdge	%icc,	%f29,	%f1
	mulx	%i2,	0x1109,	%i1
	umulcc	%g2,	0x1B4D,	%l4
	fmovsvs	%icc,	%f23,	%f31
	fmovsl	%icc,	%f10,	%f21
	ldd	[%l7 + 0x78],	%f0
	ldsw	[%l7 + 0x64],	%l0
	movgu	%xcc,	%g3,	%l2
	fone	%f12
	fmovdgu	%xcc,	%f16,	%f14
	fsrc1s	%f2,	%f8
	movneg	%icc,	%i3,	%i6
	addc	%l6,	0x04F3,	%g1
	movpos	%icc,	%o0,	%i4
	movre	%l1,	%l3,	%o6
	add	%i0,	0x0D41,	%o7
	fornot1	%f8,	%f4,	%f20
	stw	%o3,	[%l7 + 0x0C]
	ld	[%l7 + 0x38],	%f20
	andcc	%i7,	0x162A,	%o4
	movvc	%xcc,	%g5,	%g6
	sdivx	%l5,	0x08AF,	%o5
	lduh	[%l7 + 0x0E],	%o2
	edge16l	%g4,	%o1,	%i5
	andcc	%i2,	%i1,	%g7
	movrne	%l4,	%g2,	%l0
	addc	%g3,	%i3,	%l2
	movleu	%icc,	%l6,	%g1
	srlx	%i6,	0x05,	%i4
	movrlz	%o0,	0x1FA,	%l1
	add	%o6,	0x1A92,	%l3
	movvs	%xcc,	%i0,	%o3
	fpsub16	%f8,	%f20,	%f18
	edge32ln	%i7,	%o4,	%o7
	pdist	%f8,	%f0,	%f26
	fpadd16s	%f19,	%f23,	%f30
	fnand	%f0,	%f2,	%f18
	orn	%g5,	0x1E64,	%l5
	edge16n	%g6,	%o5,	%g4
	umul	%o2,	%o1,	%i2
	movcs	%icc,	%i1,	%g7
	alignaddrl	%i5,	%l4,	%g2
	fnor	%f8,	%f6,	%f4
	orncc	%l0,	%g3,	%l2
	movcc	%xcc,	%l6,	%i3
	fors	%f3,	%f29,	%f23
	subc	%i6,	0x1B36,	%i4
	movrlz	%g1,	%o0,	%l1
	array8	%o6,	%i0,	%o3
	fxnors	%f4,	%f18,	%f17
	andncc	%l3,	%o4,	%o7
	xor	%i7,	%g5,	%g6
	edge32n	%o5,	%l5,	%g4
	sdivcc	%o1,	0x0825,	%i2
	andcc	%i1,	%g7,	%i5
	sllx	%o2,	%l4,	%g2
	srax	%l0,	%g3,	%l2
	ldsb	[%l7 + 0x41],	%i3
	srlx	%i6,	0x0A,	%l6
	fxnors	%f3,	%f19,	%f17
	sdivcc	%i4,	0x1DD0,	%o0
	ld	[%l7 + 0x28],	%f7
	orn	%g1,	%l1,	%i0
	udivx	%o6,	0x1FF7,	%o3
	fmovsleu	%xcc,	%f31,	%f6
	ldsb	[%l7 + 0x57],	%o4
	fcmps	%fcc3,	%f29,	%f25
	orcc	%l3,	%o7,	%i7
	edge8n	%g5,	%o5,	%g6
	movcs	%xcc,	%l5,	%g4
	sdivcc	%o1,	0x15A2,	%i1
	smulcc	%i2,	0x003C,	%g7
	movg	%xcc,	%o2,	%i5
	movneg	%icc,	%g2,	%l4
	movre	%l0,	%g3,	%i3
	lduw	[%l7 + 0x08],	%i6
	stb	%l2,	[%l7 + 0x14]
	ldub	[%l7 + 0x65],	%i4
	fmul8ulx16	%f24,	%f26,	%f12
	sdivx	%o0,	0x19A6,	%l6
	movl	%xcc,	%l1,	%i0
	array8	%g1,	%o3,	%o4
	edge16n	%o6,	%l3,	%i7
	orn	%o7,	%o5,	%g5
	st	%f1,	[%l7 + 0x70]
	array32	%l5,	%g6,	%g4
	edge8n	%i1,	%o1,	%i2
	sir	0x084D
	edge32n	%o2,	%i5,	%g2
	fzero	%f28
	sub	%l4,	%g7,	%l0
	mova	%xcc,	%g3,	%i3
	lduw	[%l7 + 0x78],	%l2
	move	%xcc,	%i6,	%o0
	fmovsleu	%xcc,	%f30,	%f23
	addccc	%l6,	0x0FE9,	%l1
	std	%f14,	[%l7 + 0x60]
	movleu	%icc,	%i0,	%g1
	fmovrse	%o3,	%f27,	%f0
	andncc	%o4,	%i4,	%o6
	and	%i7,	%o7,	%o5
	addc	%l3,	%l5,	%g6
	ld	[%l7 + 0x70],	%f3
	fandnot2	%f22,	%f10,	%f16
	edge8n	%g4,	%g5,	%i1
	edge32	%o1,	%i2,	%i5
	fxnors	%f23,	%f7,	%f22
	for	%f20,	%f4,	%f8
	fmovsg	%icc,	%f14,	%f20
	and	%o2,	%g2,	%g7
	ldub	[%l7 + 0x64],	%l0
	udivcc	%g3,	0x03E1,	%l4
	ldsw	[%l7 + 0x40],	%l2
	fmovsn	%xcc,	%f16,	%f21
	save %i6, 0x1CC2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot2s	%f28,	%f24,	%f17
	restore %o0, 0x19B3, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x48],	%f18
	edge8	%i0,	%l6,	%o3
	sdivx	%o4,	0x15B8,	%i4
	sra	%g1,	0x19,	%i7
	fandnot1s	%f10,	%f19,	%f20
	orncc	%o7,	0x0E6F,	%o5
	fmovdpos	%xcc,	%f3,	%f8
	andn	%o6,	%l3,	%g6
	fcmpgt32	%f28,	%f6,	%l5
	movneg	%xcc,	%g4,	%i1
	fxnors	%f0,	%f15,	%f23
	fnegs	%f4,	%f30
	movge	%icc,	%g5,	%o1
	sir	0x023C
	addccc	%i2,	0x0EBF,	%i5
	movge	%icc,	%o2,	%g2
	movge	%icc,	%g7,	%l0
	sdiv	%g3,	0x064D,	%l2
	array8	%i6,	%i3,	%o0
	ldsw	[%l7 + 0x2C],	%l1
	subcc	%l4,	0x001E,	%i0
	mova	%icc,	%l6,	%o4
	sra	%i4,	%g1,	%o3
	srl	%o7,	0x1A,	%o5
	ldub	[%l7 + 0x32],	%i7
	addcc	%l3,	%g6,	%l5
	subccc	%o6,	0x1DCE,	%g4
	sethi	0x070F,	%i1
	andcc	%o1,	%i2,	%g5
	sethi	0x018E,	%o2
	edge8	%i5,	%g2,	%l0
	mova	%icc,	%g3,	%l2
	edge32l	%i6,	%g7,	%i3
	stb	%l1,	[%l7 + 0x60]
	umulcc	%o0,	%i0,	%l4
	st	%f25,	[%l7 + 0x08]
	nop
	set	0x5C, %i6
	ldsw	[%l7 + %i6],	%o4
	fnot1s	%f0,	%f22
	movvc	%xcc,	%l6,	%g1
	movrlez	%o3,	0x1A3,	%o7
	add	%i4,	0x03CE,	%i7
	orncc	%l3,	0x0A06,	%o5
	and	%l5,	%o6,	%g6
	fsrc2	%f26,	%f12
	fmovdcs	%xcc,	%f27,	%f30
	movleu	%icc,	%g4,	%i1
	smulcc	%i2,	%o1,	%o2
	edge32ln	%g5,	%g2,	%l0
	fmovrslz	%g3,	%f25,	%f19
	std	%f14,	[%l7 + 0x50]
	fmovsvs	%xcc,	%f17,	%f6
	fmovscs	%icc,	%f11,	%f8
	array16	%i5,	%i6,	%l2
	edge16l	%g7,	%l1,	%i3
	edge32n	%i0,	%o0,	%o4
	movn	%icc,	%l6,	%l4
	fnot2	%f28,	%f2
	fnot2	%f8,	%f4
	array8	%o3,	%o7,	%i4
	fandnot1s	%f8,	%f30,	%f11
	orncc	%g1,	%l3,	%o5
	fornot2	%f30,	%f10,	%f10
	alignaddrl	%i7,	%o6,	%l5
	edge8n	%g6,	%i1,	%g4
	srl	%i2,	0x15,	%o2
	fpmerge	%f16,	%f12,	%f2
	fmovda	%xcc,	%f13,	%f12
	edge32n	%g5,	%g2,	%o1
	save %g3, %l0, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array16	%l2,	%i5,	%l1
	fmovrsgez	%g7,	%f30,	%f31
	movvs	%icc,	%i0,	%o0
	fmovdpos	%icc,	%f20,	%f9
	array8	%o4,	%i3,	%l4
	movvs	%icc,	%l6,	%o7
	fmovdcc	%icc,	%f5,	%f10
	mulscc	%i4,	0x1C4B,	%o3
	fmovdle	%icc,	%f7,	%f30
	sir	0x1F6D
	fmovdcs	%xcc,	%f16,	%f21
	edge16l	%l3,	%g1,	%o5
	fpsub32s	%f15,	%f2,	%f30
	lduw	[%l7 + 0x64],	%i7
	addccc	%l5,	0x053E,	%o6
	movrne	%i1,	0x001,	%g6
	movvs	%icc,	%i2,	%o2
	edge32l	%g4,	%g5,	%o1
	orn	%g3,	%g2,	%i6
	fnot1	%f24,	%f18
	andn	%l0,	%i5,	%l2
	fmovdg	%icc,	%f5,	%f23
	alignaddr	%l1,	%g7,	%o0
	orncc	%i0,	%i3,	%o4
	edge16	%l6,	%l4,	%i4
	sdiv	%o7,	0x0B99,	%l3
	fmovrslez	%g1,	%f30,	%f0
	andcc	%o5,	%o3,	%l5
	bshuffle	%f16,	%f12,	%f10
	fcmpeq16	%f20,	%f4,	%i7
	orncc	%o6,	0x052F,	%i1
	fornot2	%f2,	%f30,	%f8
	lduw	[%l7 + 0x28],	%i2
	movpos	%xcc,	%o2,	%g6
	udivcc	%g4,	0x1315,	%o1
	fcmpne16	%f18,	%f22,	%g3
	sdivx	%g2,	0x0F93,	%g5
	smul	%i6,	0x18F5,	%i5
	fmovdneg	%xcc,	%f8,	%f27
	sll	%l0,	%l2,	%g7
	movrgz	%l1,	%o0,	%i0
	movcc	%icc,	%i3,	%o4
	movcc	%xcc,	%l6,	%i4
	fexpand	%f20,	%f10
	fzero	%f6
	ldx	[%l7 + 0x08],	%l4
	movrne	%l3,	0x009,	%g1
	move	%icc,	%o7,	%o5
	movleu	%xcc,	%l5,	%o3
	fands	%f21,	%f15,	%f9
	movcc	%xcc,	%o6,	%i7
	movcs	%icc,	%i2,	%i1
	movleu	%xcc,	%g6,	%g4
	edge16ln	%o2,	%g3,	%g2
	stx	%g5,	[%l7 + 0x68]
	mulx	%i6,	%o1,	%l0
	udivx	%i5,	0x0943,	%l2
	ldsw	[%l7 + 0x50],	%l1
	movvc	%xcc,	%g7,	%i0
	add	%i3,	0x1EF4,	%o4
	array8	%l6,	%i4,	%o0
	array16	%l3,	%l4,	%g1
	orncc	%o7,	0x0049,	%l5
	fpsub32s	%f23,	%f30,	%f19
	alignaddrl	%o5,	%o6,	%o3
	sir	0x071C
	std	%f22,	[%l7 + 0x60]
	edge16l	%i7,	%i2,	%i1
	edge32l	%g6,	%g4,	%g3
	ldsw	[%l7 + 0x78],	%o2
	nop
	set	0x60, %l1
	ldsh	[%l7 + %l1],	%g2
	movcs	%xcc,	%i6,	%g5
	fmul8x16al	%f5,	%f15,	%f20
	fmovdle	%xcc,	%f28,	%f16
	array16	%o1,	%i5,	%l0
	move	%xcc,	%l1,	%l2
	fmul8x16al	%f26,	%f30,	%f20
	edge8l	%g7,	%i3,	%i0
	movcc	%icc,	%l6,	%o4
	fsrc2s	%f29,	%f26
	ldx	[%l7 + 0x58],	%i4
	movrgez	%l3,	%l4,	%o0
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	fmovse	%xcc,	%f9,	%f30
	srlx	%o6,	0x0E,	%o7
	edge8ln	%i7,	%o3,	%i1
	fornot2	%f4,	%f22,	%f26
	sdivx	%i2,	0x0247,	%g4
	fmovrdgz	%g6,	%f18,	%f24
	subcc	%g3,	0x0674,	%g2
	nop
	set	0x12, %l4
	ldub	[%l7 + %l4],	%i6
	movg	%xcc,	%o2,	%o1
	srlx	%g5,	0x08,	%i5
	sdivcc	%l1,	0x0013,	%l0
	movre	%g7,	0x114,	%l2
	array32	%i0,	%l6,	%o4
	andcc	%i4,	%i3,	%l3
	smulcc	%l4,	0x1E3A,	%o0
	fmovdl	%icc,	%f19,	%f17
	edge8l	%g1,	%l5,	%o5
	udivx	%o7,	0x1A91,	%i7
	movn	%icc,	%o3,	%i1
	fmovsg	%xcc,	%f4,	%f15
	fnot2	%f22,	%f2
	ld	[%l7 + 0x7C],	%f16
	fcmps	%fcc0,	%f19,	%f15
	movgu	%icc,	%o6,	%i2
	fmul8sux16	%f14,	%f26,	%f20
	edge32l	%g6,	%g4,	%g2
	ldsw	[%l7 + 0x38],	%i6
	movvs	%xcc,	%o2,	%g3
	fmul8x16al	%f30,	%f30,	%f10
	ld	[%l7 + 0x6C],	%f10
	fzero	%f2
	srax	%o1,	0x01,	%i5
	mova	%icc,	%g5,	%l1
	alignaddrl	%g7,	%l0,	%l2
	movl	%icc,	%i0,	%l6
	ldsh	[%l7 + 0x12],	%i4
	fmovdleu	%xcc,	%f17,	%f24
	udiv	%o4,	0x00F1,	%l3
	fcmpne16	%f24,	%f26,	%i3
	subc	%l4,	0x1EA3,	%g1
	subcc	%l5,	%o5,	%o7
	ldx	[%l7 + 0x60],	%i7
	subccc	%o3,	%o0,	%o6
	addcc	%i1,	%i2,	%g6
	orn	%g4,	%g2,	%o2
	sdivcc	%g3,	0x1B2B,	%i6
	fmovrsgez	%i5,	%f29,	%f4
	fmovrsgez	%o1,	%f27,	%f20
	movrlez	%g5,	%g7,	%l0
	edge8l	%l2,	%i0,	%l1
	sth	%i4,	[%l7 + 0x08]
	ldub	[%l7 + 0x33],	%o4
	movrgez	%l6,	%l3,	%l4
	movge	%icc,	%g1,	%l5
	nop
	set	0x40, %l3
	ldsh	[%l7 + %l3],	%o5
	orcc	%i3,	0x01BE,	%i7
	sdivx	%o7,	0x05D8,	%o0
	xnorcc	%o3,	%i1,	%o6
	movl	%icc,	%i2,	%g6
	fpackfix	%f16,	%f30
	sub	%g4,	0x0755,	%o2
	ldd	[%l7 + 0x18],	%f22
	fpsub16	%f2,	%f4,	%f22
	edge16n	%g2,	%g3,	%i6
	subc	%i5,	%o1,	%g5
	movcc	%icc,	%l0,	%l2
	edge32n	%i0,	%l1,	%g7
	add	%i4,	%l6,	%l3
	movrgz	%l4,	0x015,	%o4
	movgu	%icc,	%g1,	%l5
	ldsw	[%l7 + 0x4C],	%o5
	fors	%f5,	%f7,	%f29
	srax	%i7,	0x13,	%o7
	sllx	%i3,	%o0,	%o3
	addccc	%o6,	0x1D20,	%i1
	sra	%g6,	0x15,	%g4
	ld	[%l7 + 0x6C],	%f11
	save %i2, 0x1552, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f12,	%f1
	andncc	%o2,	%i6,	%i5
	udivx	%o1,	0x1451,	%g5
	ldsb	[%l7 + 0x3F],	%g3
	nop
	set	0x1C, %o1
	sth	%l0,	[%l7 + %o1]
	ldsw	[%l7 + 0x78],	%l2
	srlx	%l1,	%i0,	%i4
	lduh	[%l7 + 0x58],	%l6
	xnor	%g7,	%l3,	%o4
	fcmpes	%fcc1,	%f2,	%f14
	movpos	%xcc,	%l4,	%l5
	movrne	%o5,	0x3F4,	%g1
	subcc	%o7,	0x023D,	%i3
	edge8n	%o0,	%i7,	%o3
	movneg	%xcc,	%i1,	%g6
	movle	%xcc,	%g4,	%o6
	fzeros	%f28
	movcs	%icc,	%i2,	%o2
	movrne	%g2,	%i6,	%i5
	movrgez	%g5,	0x189,	%g3
	pdist	%f0,	%f6,	%f28
	movge	%icc,	%o1,	%l2
	andn	%l0,	%l1,	%i0
	movcs	%icc,	%i4,	%g7
	srl	%l3,	0x1B,	%l6
	edge32	%l4,	%l5,	%o4
	orcc	%o5,	%g1,	%i3
	movgu	%xcc,	%o7,	%o0
	stx	%o3,	[%l7 + 0x18]
	fnot1s	%f2,	%f24
	ldub	[%l7 + 0x23],	%i7
	movl	%icc,	%i1,	%g4
	mova	%xcc,	%g6,	%i2
	subcc	%o2,	0x1A52,	%g2
	movrgz	%o6,	0x18F,	%i5
	edge8	%i6,	%g5,	%g3
	smulcc	%o1,	%l0,	%l2
	fmul8x16	%f20,	%f8,	%f26
	fnot2s	%f13,	%f28
	edge16ln	%i0,	%i4,	%g7
	andncc	%l1,	%l6,	%l4
	fmovsle	%icc,	%f15,	%f3
	andncc	%l5,	%l3,	%o5
	fmovsa	%xcc,	%f26,	%f31
	ldd	[%l7 + 0x60],	%g0
	fmovsa	%xcc,	%f24,	%f12
	fcmps	%fcc1,	%f0,	%f7
	sub	%o4,	0x08DA,	%o7
	movrgez	%o0,	0x091,	%i3
	addccc	%i7,	0x1208,	%o3
	movcs	%icc,	%g4,	%i1
	stb	%i2,	[%l7 + 0x64]
	ldd	[%l7 + 0x68],	%f4
	stw	%o2,	[%l7 + 0x0C]
	sir	0x0377
	fnors	%f0,	%f6,	%f26
	fcmpne32	%f22,	%f4,	%g6
	movcs	%icc,	%o6,	%g2
	edge16	%i5,	%i6,	%g5
	srl	%g3,	%o1,	%l0
	fmovrsne	%i0,	%f13,	%f9
	restore %l2, %i4, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%l6,	%l4,	%l5
	sub	%g7,	0x136D,	%l3
	siam	0x6
	fmovdcs	%xcc,	%f26,	%f30
	move	%xcc,	%g1,	%o4
	movneg	%icc,	%o5,	%o0
	fnot2	%f18,	%f26
	movrlz	%i3,	0x3C8,	%i7
	edge32n	%o7,	%g4,	%o3
	xnorcc	%i2,	%o2,	%g6
	mova	%xcc,	%i1,	%o6
	ldsw	[%l7 + 0x10],	%i5
	fands	%f6,	%f27,	%f22
	xnor	%i6,	0x0241,	%g5
	movleu	%xcc,	%g2,	%g3
	add	%o1,	0x0886,	%l0
	fcmple32	%f10,	%f6,	%i0
	sdiv	%l2,	0x1FF3,	%l1
	ldsh	[%l7 + 0x28],	%l6
	st	%f9,	[%l7 + 0x74]
	movre	%l4,	0x09E,	%i4
	fmovsvc	%xcc,	%f24,	%f9
	fmovd	%f0,	%f18
	ldub	[%l7 + 0x6D],	%l5
	mulscc	%l3,	0x0DE3,	%g7
	fcmped	%fcc3,	%f8,	%f30
	edge32ln	%g1,	%o4,	%o5
	ldsh	[%l7 + 0x10],	%o0
	smul	%i7,	0x19FD,	%i3
	alignaddrl	%g4,	%o3,	%o7
	ld	[%l7 + 0x50],	%f16
	fabss	%f5,	%f2
	alignaddrl	%o2,	%g6,	%i2
	xorcc	%i1,	0x110A,	%i5
	fand	%f22,	%f24,	%f26
	fcmps	%fcc3,	%f5,	%f5
	movl	%xcc,	%i6,	%o6
	andcc	%g2,	%g3,	%o1
	fzero	%f18
	edge8	%l0,	%g5,	%i0
	fmul8x16au	%f28,	%f6,	%f4
	ldd	[%l7 + 0x18],	%f6
	xorcc	%l1,	0x0BD6,	%l6
	movg	%icc,	%l2,	%i4
	fmovdne	%icc,	%f3,	%f28
	movn	%icc,	%l4,	%l3
	mulx	%l5,	0x1FD8,	%g7
	array32	%o4,	%g1,	%o5
	ldsw	[%l7 + 0x28],	%o0
	nop
	set	0x50, %g4
	lduw	[%l7 + %g4],	%i7
	fmovrdlez	%g4,	%f8,	%f16
	fornot1	%f30,	%f2,	%f10
	xor	%i3,	0x16CB,	%o3
	andcc	%o2,	0x1640,	%g6
	fmovrslez	%o7,	%f9,	%f21
	movleu	%icc,	%i2,	%i5
	edge8n	%i1,	%o6,	%g2
	ldd	[%l7 + 0x58],	%i6
	fpadd16	%f18,	%f22,	%f20
	movrne	%o1,	0x352,	%l0
	ldd	[%l7 + 0x60],	%f6
	fmovspos	%icc,	%f2,	%f14
	movrne	%g3,	0x329,	%g5
	edge8l	%i0,	%l6,	%l1
	lduw	[%l7 + 0x20],	%l2
	fmovrse	%i4,	%f3,	%f22
	movcc	%xcc,	%l4,	%l5
	sll	%g7,	0x03,	%o4
	alignaddrl	%g1,	%l3,	%o5
	fnand	%f4,	%f22,	%f10
	lduh	[%l7 + 0x50],	%o0
	subc	%g4,	0x1891,	%i7
	fpsub32	%f26,	%f20,	%f20
	movcc	%icc,	%o3,	%i3
	ldub	[%l7 + 0x56],	%o2
	st	%f30,	[%l7 + 0x48]
	sll	%g6,	0x10,	%i2
	array16	%o7,	%i1,	%o6
	fmovsvc	%icc,	%f31,	%f12
	lduh	[%l7 + 0x26],	%g2
	lduw	[%l7 + 0x50],	%i6
	movcs	%xcc,	%o1,	%l0
	fexpand	%f25,	%f16
	srax	%g3,	%i5,	%i0
	movgu	%xcc,	%g5,	%l6
	subcc	%l1,	%i4,	%l4
	and	%l5,	%g7,	%o4
	fmovse	%xcc,	%f6,	%f19
	ldsw	[%l7 + 0x78],	%g1
	andncc	%l2,	%l3,	%o0
	subccc	%o5,	%g4,	%o3
	movrlez	%i3,	0x0F9,	%o2
	edge8n	%i7,	%i2,	%g6
	sra	%o7,	%i1,	%g2
	fxnors	%f30,	%f1,	%f21
	orncc	%i6,	%o6,	%o1
	andn	%g3,	0x0FAC,	%l0
	nop
	set	0x70, %g1
	ldsh	[%l7 + %g1],	%i0
	movgu	%xcc,	%g5,	%i5
	ldsh	[%l7 + 0x44],	%l6
	ldsh	[%l7 + 0x4E],	%l1
	alignaddrl	%i4,	%l5,	%g7
	add	%o4,	0x1990,	%g1
	fmovdneg	%xcc,	%f26,	%f9
	andncc	%l2,	%l3,	%l4
	or	%o5,	0x0320,	%g4
	movvs	%icc,	%o3,	%i3
	andncc	%o2,	%o0,	%i7
	nop
	set	0x12, %i3
	ldsh	[%l7 + %i3],	%i2
	addcc	%o7,	%i1,	%g6
	fmovdvs	%xcc,	%f26,	%f20
	ldd	[%l7 + 0x40],	%g2
	sllx	%o6,	0x07,	%o1
	ldsh	[%l7 + 0x6C],	%i6
	movrlz	%l0,	%i0,	%g3
	sll	%i5,	0x1B,	%g5
	fnot1	%f26,	%f30
	movge	%xcc,	%l6,	%l1
	sethi	0x0C89,	%l5
	fmovdneg	%xcc,	%f25,	%f7
	movneg	%icc,	%g7,	%i4
	movne	%xcc,	%o4,	%g1
	edge8ln	%l2,	%l3,	%o5
	nop
	set	0x0B, %i4
	ldsb	[%l7 + %i4],	%l4
	fmovdcs	%xcc,	%f5,	%f31
	addcc	%g4,	0x1DF6,	%o3
	movneg	%xcc,	%o2,	%o0
	array32	%i3,	%i7,	%o7
	fmovde	%xcc,	%f10,	%f27
	movgu	%icc,	%i2,	%i1
	stx	%g2,	[%l7 + 0x40]
	orn	%g6,	%o1,	%i6
	sdiv	%l0,	0x061A,	%o6
	movrlz	%i0,	%i5,	%g3
	lduw	[%l7 + 0x4C],	%l6
	udivx	%g5,	0x1179,	%l5
	xorcc	%g7,	%l1,	%i4
	movrlez	%o4,	%g1,	%l3
	udivcc	%o5,	0x082F,	%l4
	edge32ln	%l2,	%o3,	%g4
	fnor	%f0,	%f16,	%f28
	edge16l	%o0,	%i3,	%o2
	movrlz	%i7,	0x20A,	%o7
	sir	0x19C5
	sth	%i1,	[%l7 + 0x68]
	movleu	%xcc,	%i2,	%g2
	add	%o1,	0x0717,	%g6
	addc	%i6,	%o6,	%i0
	fnegs	%f18,	%f6
	movrlz	%i5,	%l0,	%g3
	lduw	[%l7 + 0x10],	%g5
	sdiv	%l5,	0x022E,	%g7
	fxor	%f12,	%f8,	%f20
	sllx	%l1,	0x02,	%i4
	edge16ln	%l6,	%o4,	%g1
	fcmpd	%fcc1,	%f10,	%f2
	movrne	%o5,	0x1DE,	%l3
	popc	%l4,	%o3
	edge32ln	%l2,	%o0,	%g4
	srax	%i3,	%o2,	%i7
	edge32ln	%o7,	%i1,	%i2
	umul	%o1,	0x1BBB,	%g6
	movneg	%icc,	%g2,	%o6
	movrlz	%i0,	0x17E,	%i5
	array8	%l0,	%i6,	%g3
	nop
	set	0x30, %i5
	ldd	[%l7 + %i5],	%l4
	sdivcc	%g7,	0x1005,	%l1
	lduw	[%l7 + 0x08],	%i4
	ldsw	[%l7 + 0x0C],	%l6
	fands	%f17,	%f5,	%f14
	movne	%icc,	%g5,	%o4
	sllx	%g1,	%o5,	%l4
	edge8ln	%l3,	%l2,	%o0
	sllx	%g4,	%o3,	%o2
	fnot2s	%f6,	%f11
	fmovdvc	%xcc,	%f6,	%f7
	array16	%i3,	%i7,	%o7
	sdivcc	%i1,	0x0B4B,	%i2
	fmovdcs	%xcc,	%f13,	%f9
	movcs	%icc,	%g6,	%o1
	ldsh	[%l7 + 0x74],	%o6
	fpack32	%f2,	%f26,	%f22
	edge16l	%i0,	%g2,	%l0
	edge8ln	%i6,	%i5,	%g3
	fcmped	%fcc3,	%f8,	%f8
	movg	%icc,	%l5,	%l1
	movleu	%icc,	%i4,	%l6
	andn	%g5,	%o4,	%g1
	save %g7, %l4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f7,	%f20,	%f13
	fpsub16	%f6,	%f8,	%f18
	fzeros	%f25
	movrne	%l2,	0x1D0,	%o0
	addc	%l3,	0x0744,	%o3
	fpadd32	%f14,	%f16,	%f30
	movl	%icc,	%o2,	%i3
	fnands	%f6,	%f2,	%f5
	ldsb	[%l7 + 0x40],	%g4
	fandnot2s	%f3,	%f20,	%f12
	udivcc	%o7,	0x056C,	%i7
	lduh	[%l7 + 0x24],	%i2
	alignaddr	%g6,	%o1,	%o6
	sir	0x1C15
	add	%i0,	0x1EA9,	%g2
	fpsub32	%f12,	%f20,	%f12
	xorcc	%i1,	%i6,	%l0
	fmul8x16	%f19,	%f24,	%f22
	fxnor	%f8,	%f14,	%f12
	fones	%f2
	fpadd16	%f0,	%f10,	%f28
	fmovrslz	%i5,	%f19,	%f19
	fmovrdlz	%g3,	%f28,	%f16
	addccc	%l1,	%i4,	%l6
	sethi	0x17F8,	%g5
	umul	%o4,	%g1,	%l5
	xorcc	%g7,	0x0391,	%l4
	movrgz	%l2,	0x1E2,	%o0
	fones	%f30
	lduw	[%l7 + 0x34],	%o5
	fnot1	%f10,	%f14
	movvc	%xcc,	%o3,	%l3
	fzeros	%f16
	fcmpeq32	%f16,	%f2,	%o2
	movcs	%xcc,	%i3,	%g4
	orn	%i7,	0x0955,	%i2
	movgu	%icc,	%o7,	%o1
	udivx	%g6,	0x1213,	%o6
	movle	%xcc,	%i0,	%i1
	movre	%g2,	%i6,	%l0
	edge32n	%i5,	%l1,	%g3
	movrne	%l6,	0x3ED,	%g5
	xor	%o4,	0x10FC,	%i4
	ld	[%l7 + 0x0C],	%f11
	edge16n	%g1,	%l5,	%l4
	stx	%l2,	[%l7 + 0x38]
	mulscc	%o0,	%g7,	%o3
	ld	[%l7 + 0x7C],	%f24
	ldsb	[%l7 + 0x1B],	%o5
	fornot1s	%f7,	%f0,	%f30
	fmovrdgz	%l3,	%f18,	%f4
	sllx	%i3,	%o2,	%i7
	edge16l	%g4,	%o7,	%i2
	edge8ln	%g6,	%o6,	%o1
	movvc	%icc,	%i0,	%i1
	fcmpgt16	%f0,	%f26,	%i6
	movvc	%xcc,	%g2,	%l0
	fmovsn	%icc,	%f13,	%f28
	movn	%icc,	%i5,	%l1
	or	%l6,	0x1E39,	%g5
	fmovsleu	%icc,	%f29,	%f26
	fsrc2	%f6,	%f30
	fpadd16s	%f15,	%f13,	%f8
	andncc	%o4,	%g3,	%g1
	array8	%i4,	%l4,	%l2
	movrlz	%o0,	%g7,	%l5
	popc	0x0201,	%o5
	fmovrslz	%o3,	%f27,	%f11
	movg	%icc,	%i3,	%o2
	edge16ln	%i7,	%l3,	%o7
	ldub	[%l7 + 0x77],	%g4
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	save %g6, %o1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovd	%f22,	%f2
	ldsb	[%l7 + 0x4B],	%i6
	fandnot2	%f18,	%f30,	%f10
	umul	%g2,	0x0F32,	%i1
	movpos	%icc,	%i5,	%l1
	fmovdne	%icc,	%f10,	%f11
	sllx	%l6,	%g5,	%o4
	add	%l0,	%g1,	%i4
	udivcc	%l4,	0x07CF,	%l2
	subcc	%g3,	0x1DE3,	%g7
	movrgez	%o0,	%l5,	%o3
	fone	%f14
	udivcc	%o5,	0x09F5,	%i3
	ldub	[%l7 + 0x1C],	%o2
	fcmple16	%f20,	%f8,	%l3
	sdivcc	%i7,	0x0168,	%o7
	movleu	%icc,	%g4,	%i2
	sllx	%o6,	0x1A,	%o1
	movrne	%i0,	%i6,	%g6
	sdivx	%i1,	0x1B70,	%g2
	restore %i5, 0x0090, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l6,	%o4,	%g5
	sdiv	%g1,	0x006C,	%l0
	sub	%l4,	%l2,	%i4
	ldd	[%l7 + 0x10],	%g6
	udivcc	%g3,	0x12BC,	%o0
	fmovde	%xcc,	%f29,	%f24
	edge8	%o3,	%o5,	%l5
	fxor	%f2,	%f10,	%f20
	umulcc	%i3,	%l3,	%o2
	fpack32	%f10,	%f24,	%f24
	edge16	%o7,	%g4,	%i7
	edge16ln	%i2,	%o1,	%o6
	fcmple32	%f0,	%f28,	%i6
	fabsd	%f28,	%f6
	movge	%icc,	%i0,	%g6
	fmovrsne	%g2,	%f19,	%f17
	add	%i1,	0x13EF,	%i5
	and	%l1,	0x0728,	%o4
	movg	%icc,	%l6,	%g5
	movcs	%xcc,	%g1,	%l4
	umulcc	%l2,	%i4,	%g7
	alignaddrl	%g3,	%l0,	%o0
	sll	%o3,	%o5,	%i3
	fmovde	%icc,	%f3,	%f14
	andn	%l3,	%o2,	%l5
	fmovsne	%icc,	%f29,	%f22
	xnor	%g4,	%o7,	%i7
	st	%f30,	[%l7 + 0x70]
	movrlz	%i2,	%o1,	%o6
	move	%xcc,	%i6,	%g6
	save %i0, %i1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f10,	%f6,	%f16
	stw	%l1,	[%l7 + 0x5C]
	fone	%f12
	fpack16	%f30,	%f20
	sethi	0x1682,	%o4
	umul	%l6,	0x03C1,	%g5
	sll	%i5,	%g1,	%l2
	subc	%i4,	0x1593,	%l4
	fors	%f11,	%f5,	%f14
	andcc	%g3,	%l0,	%g7
	fcmpes	%fcc3,	%f5,	%f14
	edge32	%o0,	%o5,	%o3
	ldd	[%l7 + 0x10],	%f26
	movg	%icc,	%l3,	%i3
	mulx	%o2,	0x09E8,	%g4
	xor	%o7,	%l5,	%i7
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	fpadd16s	%f31,	%f4,	%f16
	array32	%o6,	%i0,	%g6
	fpadd32s	%f8,	%f20,	%f2
	orn	%i1,	0x08EB,	%g2
	sub	%o4,	%l6,	%l1
	addc	%g5,	%i5,	%l2
	xor	%i4,	0x0CE6,	%g1
	fcmpd	%fcc0,	%f4,	%f0
	fmul8ulx16	%f4,	%f10,	%f18
	fnand	%f4,	%f18,	%f20
	edge16l	%l4,	%g3,	%g7
	addcc	%l0,	%o0,	%o5
	movcs	%icc,	%l3,	%o3
	smul	%o2,	%i3,	%g4
	ldd	[%l7 + 0x08],	%f12
	smulcc	%l5,	%i7,	%o1
	popc	0x1C52,	%i2
	movg	%icc,	%o7,	%i6
	movrlez	%o6,	0x2E5,	%i0
	movrgez	%g6,	0x3D5,	%i1
	xnorcc	%g2,	%l6,	%o4
	edge32ln	%l1,	%g5,	%l2
	edge8l	%i4,	%g1,	%i5
	fsrc1	%f22,	%f10
	fsrc1s	%f2,	%f6
	movpos	%xcc,	%l4,	%g7
	addcc	%l0,	%g3,	%o5
	stw	%o0,	[%l7 + 0x44]
	edge32ln	%o3,	%l3,	%o2
	udivx	%i3,	0x01EA,	%l5
	bshuffle	%f10,	%f30,	%f14
	movvs	%xcc,	%i7,	%g4
	array16	%o1,	%o7,	%i2
	stb	%i6,	[%l7 + 0x32]
	subc	%i0,	%g6,	%i1
	orn	%g2,	%l6,	%o6
	fornot2	%f22,	%f14,	%f28
	fmul8x16	%f6,	%f10,	%f12
	udivcc	%o4,	0x1113,	%l1
	movrgz	%g5,	%l2,	%g1
	edge16ln	%i5,	%i4,	%l4
	sll	%l0,	0x0C,	%g7
	fsrc2s	%f13,	%f28
	ldx	[%l7 + 0x30],	%g3
	ld	[%l7 + 0x58],	%f26
	stb	%o5,	[%l7 + 0x31]
	stx	%o3,	[%l7 + 0x70]
	std	%f10,	[%l7 + 0x38]
	move	%icc,	%l3,	%o0
	restore %o2, %i3, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x33],	%g4
	smul	%o1,	%l5,	%o7
	alignaddr	%i6,	%i0,	%g6
	smul	%i1,	%i2,	%g2
	movrgz	%o6,	%o4,	%l6
	fmovs	%f13,	%f28
	mulx	%l1,	0x0522,	%l2
	subc	%g1,	%i5,	%i4
	sir	0x0DBB
	umulcc	%l4,	0x1FBD,	%g5
	nop
	set	0x0F, %g5
	stb	%l0,	[%l7 + %g5]
	andn	%g7,	%o5,	%g3
	udivcc	%o3,	0x034B,	%o0
	or	%o2,	%i3,	%i7
	fmovdleu	%xcc,	%f4,	%f4
	add	%g4,	0x02C4,	%o1
	fmovspos	%icc,	%f1,	%f11
	edge32	%l3,	%o7,	%i6
	and	%l5,	%g6,	%i1
	andn	%i0,	0x1784,	%i2
	umul	%o6,	0x07FF,	%g2
	movvs	%xcc,	%l6,	%l1
	movg	%icc,	%l2,	%o4
	movrne	%i5,	0x18B,	%g1
	andcc	%i4,	%l4,	%g5
	sll	%l0,	0x0B,	%g7
	movneg	%icc,	%g3,	%o3
	ld	[%l7 + 0x54],	%f25
	fmovdl	%xcc,	%f14,	%f15
	fpsub16s	%f1,	%f22,	%f13
	ldsb	[%l7 + 0x14],	%o0
	smulcc	%o2,	%o5,	%i7
	alignaddrl	%i3,	%o1,	%l3
	movvs	%icc,	%g4,	%i6
	fnegd	%f28,	%f24
	movge	%icc,	%l5,	%g6
	fmovsvc	%xcc,	%f31,	%f5
	udiv	%i1,	0x0904,	%o7
	sethi	0x0318,	%i0
	xnorcc	%o6,	%i2,	%l6
	movg	%icc,	%g2,	%l2
	add	%l1,	%o4,	%i5
	ldub	[%l7 + 0x40],	%i4
	xnorcc	%l4,	0x18F5,	%g1
	nop
	set	0x36, %l2
	ldub	[%l7 + %l2],	%l0
	sth	%g7,	[%l7 + 0x2A]
	sub	%g5,	0x1926,	%g3
	mulscc	%o0,	%o3,	%o5
	alignaddr	%o2,	%i3,	%i7
	edge32	%l3,	%g4,	%o1
	addcc	%i6,	0x12EB,	%l5
	sll	%i1,	0x03,	%g6
	fcmple32	%f30,	%f26,	%o7
	movrgez	%o6,	%i0,	%i2
	smul	%g2,	0x142A,	%l2
	movpos	%icc,	%l6,	%l1
	fmovrdlz	%o4,	%f28,	%f10
	edge16n	%i5,	%l4,	%g1
	movge	%xcc,	%l0,	%g7
	xor	%g5,	%i4,	%o0
	fmul8x16au	%f17,	%f12,	%f4
	fcmpd	%fcc0,	%f26,	%f10
	sethi	0x0A2C,	%g3
	orn	%o3,	0x1BC9,	%o5
	movrgz	%o2,	0x2D9,	%i3
	xnor	%i7,	%l3,	%g4
	edge32	%o1,	%l5,	%i1
	movle	%icc,	%g6,	%i6
	xorcc	%o6,	0x065F,	%o7
	addccc	%i2,	0x1DA2,	%g2
	fnot1s	%f14,	%f1
	sdiv	%l2,	0x0E2A,	%i0
	edge8l	%l6,	%o4,	%l1
	movge	%icc,	%l4,	%g1
	sub	%l0,	%i5,	%g7
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	movvc	%xcc,	%g3,	%o3
	stw	%o5,	[%l7 + 0x10]
	edge16l	%o2,	%i3,	%o0
	umul	%l3,	%i7,	%g4
	xnorcc	%l5,	0x1614,	%i1
	ld	[%l7 + 0x6C],	%f13
	ld	[%l7 + 0x6C],	%f13
	edge16l	%o1,	%i6,	%g6
	stb	%o7,	[%l7 + 0x4E]
	udivx	%i2,	0x0CD3,	%o6
	andcc	%g2,	0x103D,	%i0
	fcmpgt32	%f26,	%f8,	%l2
	edge32ln	%l6,	%o4,	%l1
	alignaddrl	%g1,	%l0,	%l4
	ldx	[%l7 + 0x68],	%g7
	addcc	%i4,	%i5,	%g5
	fmovdne	%icc,	%f23,	%f4
	fpsub16s	%f7,	%f8,	%f9
	array32	%g3,	%o5,	%o3
	movne	%icc,	%i3,	%o2
	restore %o0, %i7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l3,	0x17E9,	%l5
	bshuffle	%f16,	%f16,	%f16
	fcmps	%fcc3,	%f13,	%f16
	sll	%o1,	0x1E,	%i1
	udivcc	%g6,	0x02AC,	%o7
	sdivx	%i6,	0x00BE,	%i2
	movrne	%o6,	%i0,	%l2
	sll	%l6,	%o4,	%l1
	array16	%g2,	%g1,	%l0
	edge32l	%l4,	%g7,	%i5
	subc	%i4,	0x16E7,	%g5
	ldub	[%l7 + 0x32],	%o5
	movleu	%icc,	%o3,	%g3
	ld	[%l7 + 0x2C],	%f13
	lduw	[%l7 + 0x30],	%i3
	fpack32	%f8,	%f12,	%f28
	srlx	%o2,	%o0,	%g4
	xnorcc	%l3,	0x1175,	%l5
	std	%f16,	[%l7 + 0x20]
	addccc	%o1,	0x1339,	%i7
	edge32l	%i1,	%o7,	%g6
	subc	%i2,	0x1E8C,	%o6
	ldsb	[%l7 + 0x3A],	%i6
	umulcc	%l2,	%i0,	%o4
	edge8n	%l1,	%g2,	%g1
	edge16	%l0,	%l4,	%l6
	movg	%xcc,	%g7,	%i4
	xor	%i5,	0x0DB4,	%g5
	subcc	%o5,	%g3,	%i3
	subc	%o2,	0x1A18,	%o0
	orncc	%g4,	%o3,	%l3
	xnor	%o1,	0x1633,	%i7
	ldd	[%l7 + 0x18],	%f28
	fors	%f6,	%f17,	%f15
	orn	%l5,	%o7,	%i1
	fmovde	%xcc,	%f16,	%f16
	ld	[%l7 + 0x58],	%f23
	movg	%icc,	%g6,	%i2
	ldd	[%l7 + 0x48],	%i6
	array32	%o6,	%i0,	%l2
	xnor	%o4,	0x1867,	%g2
	alignaddr	%g1,	%l0,	%l4
	bshuffle	%f0,	%f18,	%f6
	or	%l6,	0x1221,	%g7
	subc	%l1,	%i5,	%i4
	xor	%o5,	%g3,	%g5
	andncc	%o2,	%o0,	%g4
	fandnot1s	%f0,	%f30,	%f18
	subccc	%o3,	%l3,	%o1
	umulcc	%i7,	0x0717,	%l5
	fexpand	%f4,	%f22
	fmovsne	%icc,	%f5,	%f12
	move	%xcc,	%o7,	%i3
	edge8	%g6,	%i1,	%i2
	fcmpne16	%f4,	%f10,	%i6
	save %o6, %l2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f15,	%f5,	%f10
	ldub	[%l7 + 0x79],	%g2
	st	%f23,	[%l7 + 0x3C]
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	fcmpd	%fcc1,	%f0,	%f0
	movcs	%icc,	%i0,	%g7
	udiv	%l1,	0x01DA,	%i5
	xnor	%i4,	0x1300,	%l6
	edge8ln	%o5,	%g3,	%o2
	movleu	%icc,	%o0,	%g5
	fmovdpos	%xcc,	%f13,	%f13
	fcmpeq32	%f4,	%f6,	%g4
	array16	%l3,	%o3,	%o1
	edge16ln	%l5,	%o7,	%i7
	stw	%g6,	[%l7 + 0x50]
	alignaddr	%i1,	%i3,	%i2
	sra	%o6,	%l2,	%i6
	fpsub32	%f16,	%f26,	%f10
	movgu	%xcc,	%g2,	%o4
	xnorcc	%g1,	0x06DB,	%l0
	movrlz	%l4,	0x3DF,	%i0
	xnorcc	%g7,	0x0CFA,	%i5
	fmovsleu	%icc,	%f13,	%f9
	andcc	%l1,	%i4,	%o5
	sir	0x0ADA
	movg	%xcc,	%l6,	%o2
	lduw	[%l7 + 0x14],	%o0
	addcc	%g5,	%g4,	%g3
	fcmpeq32	%f14,	%f22,	%o3
	fcmpgt32	%f30,	%f26,	%o1
	fmovsle	%xcc,	%f17,	%f30
	ldsw	[%l7 + 0x2C],	%l5
	edge8	%l3,	%o7,	%g6
	fandnot2	%f10,	%f4,	%f30
	fors	%f17,	%f4,	%f11
	sll	%i1,	%i3,	%i2
	or	%o6,	%l2,	%i6
	mulscc	%g2,	0x1672,	%o4
	fmovdge	%icc,	%f30,	%f15
	umul	%g1,	0x0C7A,	%l0
	sdiv	%l4,	0x0D7F,	%i0
	lduh	[%l7 + 0x72],	%i7
	ldsb	[%l7 + 0x63],	%g7
	xorcc	%i5,	0x083A,	%i4
	movvc	%xcc,	%l1,	%o5
	sethi	0x1984,	%o2
	movrgz	%o0,	%l6,	%g5
	umul	%g4,	%o3,	%o1
	stw	%g3,	[%l7 + 0x28]
	mulscc	%l5,	0x1C3D,	%o7
	sub	%g6,	%i1,	%l3
	umulcc	%i2,	%i3,	%l2
	movrne	%i6,	%g2,	%o6
	fmovdgu	%icc,	%f9,	%f22
	bshuffle	%f24,	%f26,	%f16
	fmovdge	%icc,	%f0,	%f6
	stw	%g1,	[%l7 + 0x2C]
	movrlez	%l0,	%l4,	%o4
	and	%i7,	%g7,	%i0
	fmovrsgez	%i5,	%f23,	%f14
	alignaddrl	%i4,	%o5,	%l1
	movrgz	%o0,	%o2,	%g5
	stx	%g4,	[%l7 + 0x40]
	movle	%icc,	%o3,	%o1
	udivx	%g3,	0x12ED,	%l6
	edge32n	%l5,	%o7,	%i1
	move	%xcc,	%l3,	%i2
	edge8	%i3,	%g6,	%l2
	fnands	%f30,	%f29,	%f30
	orn	%g2,	%o6,	%i6
	umulcc	%g1,	%l0,	%l4
	fpsub16	%f20,	%f18,	%f26
	mulscc	%i7,	0x165D,	%g7
	edge8ln	%i0,	%o4,	%i5
	addccc	%o5,	0x0A01,	%l1
	edge16n	%o0,	%i4,	%g5
	mova	%xcc,	%g4,	%o3
	orncc	%o2,	%o1,	%g3
	sir	0x11A3
	udivx	%l6,	0x15DF,	%o7
	lduh	[%l7 + 0x14],	%l5
	ldd	[%l7 + 0x70],	%f12
	movvc	%xcc,	%i1,	%l3
	or	%i2,	0x04BC,	%i3
	movrgez	%g6,	%g2,	%l2
	fmovrdlez	%o6,	%f4,	%f8
	siam	0x0
	fmovdpos	%icc,	%f29,	%f25
	fmovrsgz	%g1,	%f4,	%f30
	fmovrslez	%i6,	%f3,	%f9
	ldd	[%l7 + 0x40],	%l4
	fcmpgt16	%f22,	%f24,	%l0
	orn	%g7,	0x0850,	%i7
	edge8n	%o4,	%i5,	%o5
	fmovdle	%icc,	%f2,	%f9
	movrgez	%l1,	0x2AE,	%i0
	subcc	%i4,	%g5,	%o0
	ldsh	[%l7 + 0x2C],	%g4
	fcmpd	%fcc2,	%f20,	%f12
	ldsw	[%l7 + 0x6C],	%o3
	edge8ln	%o1,	%g3,	%o2
	movcc	%xcc,	%l6,	%o7
	popc	%i1,	%l5
	edge32l	%l3,	%i3,	%i2
	edge16l	%g6,	%l2,	%g2
	movvs	%icc,	%o6,	%i6
	sth	%l4,	[%l7 + 0x46]
	edge8l	%l0,	%g1,	%g7
	fpadd16s	%f26,	%f13,	%f27
	move	%xcc,	%o4,	%i7
	std	%f28,	[%l7 + 0x10]
	addcc	%i5,	%o5,	%i0
	fandnot2	%f14,	%f20,	%f20
	xnorcc	%i4,	0x0F84,	%g5
	xor	%l1,	%o0,	%o3
	sub	%o1,	0x1682,	%g4
	move	%xcc,	%g3,	%o2
	fpack16	%f26,	%f9
	fcmpd	%fcc3,	%f12,	%f30
	ldd	[%l7 + 0x18],	%i6
	alignaddrl	%o7,	%i1,	%l5
	fcmpgt16	%f30,	%f10,	%l3
	movne	%xcc,	%i3,	%g6
	sdivcc	%i2,	0x1F74,	%g2
	array32	%o6,	%l2,	%l4
	fmovsn	%icc,	%f14,	%f21
	udivx	%i6,	0x0DCA,	%g1
	move	%icc,	%g7,	%o4
	addccc	%i7,	%l0,	%i5
	fcmpgt32	%f28,	%f18,	%i0
	ldx	[%l7 + 0x70],	%i4
	ldub	[%l7 + 0x0F],	%o5
	fmovsle	%xcc,	%f27,	%f31
	fmovrde	%g5,	%f30,	%f20
	fpsub32	%f24,	%f10,	%f22
	fmovsgu	%icc,	%f8,	%f18
	orcc	%l1,	0x11E0,	%o3
	movrlez	%o0,	%o1,	%g3
	movrlez	%g4,	0x074,	%l6
	fnor	%f26,	%f8,	%f24
	movrlz	%o7,	0x053,	%i1
	st	%f30,	[%l7 + 0x34]
	movrne	%o2,	%l5,	%l3
	ldx	[%l7 + 0x70],	%g6
	movrlez	%i3,	0x3D9,	%i2
	popc	%g2,	%l2
	orncc	%l4,	%i6,	%o6
	xnorcc	%g1,	%o4,	%i7
	srl	%g7,	%i5,	%i0
	udiv	%l0,	0x1D63,	%o5
	sllx	%i4,	0x14,	%l1
	movgu	%xcc,	%o3,	%g5
	edge32l	%o1,	%o0,	%g4
	lduh	[%l7 + 0x2E],	%g3
	fmovdleu	%icc,	%f18,	%f26
	fmul8x16	%f18,	%f14,	%f24
	movrlz	%l6,	0x06F,	%i1
	st	%f1,	[%l7 + 0x7C]
	udiv	%o2,	0x1B50,	%o7
	xorcc	%l3,	0x1427,	%l5
	umul	%i3,	%i2,	%g2
	movleu	%xcc,	%g6,	%l2
	subc	%i6,	0x0449,	%l4
	sir	0x1080
	edge8n	%g1,	%o4,	%i7
	edge8	%o6,	%i5,	%i0
	edge8l	%l0,	%o5,	%g7
	orncc	%l1,	%o3,	%i4
	fcmpd	%fcc2,	%f2,	%f8
	fmovs	%f11,	%f25
	umulcc	%o1,	%o0,	%g5
	edge32	%g3,	%g4,	%l6
	sllx	%i1,	%o2,	%l3
	mulscc	%o7,	0x0C5F,	%l5
	nop
	set	0x40, %i2
	ldub	[%l7 + %i2],	%i3
	andncc	%i2,	%g2,	%g6
	edge8ln	%l2,	%l4,	%i6
	fpmerge	%f9,	%f6,	%f6
	addcc	%o4,	%i7,	%g1
	orcc	%i5,	%i0,	%l0
	ldsb	[%l7 + 0x0D],	%o5
	ld	[%l7 + 0x28],	%f3
	fandnot2	%f0,	%f20,	%f26
	lduw	[%l7 + 0x5C],	%g7
	fxnors	%f11,	%f31,	%f22
	xor	%l1,	0x1C52,	%o3
	siam	0x2
	addccc	%o6,	0x0F84,	%o1
	edge16l	%i4,	%g5,	%o0
	movn	%icc,	%g3,	%g4
	ldd	[%l7 + 0x58],	%i6
	stw	%o2,	[%l7 + 0x3C]
	stw	%l3,	[%l7 + 0x08]
	array8	%o7,	%i1,	%i3
	movrgez	%l5,	0x1E6,	%i2
	fmovdpos	%icc,	%f13,	%f9
	srax	%g6,	0x09,	%g2
	edge16n	%l2,	%l4,	%o4
	fmovrdgez	%i7,	%f6,	%f18
	fmovdne	%xcc,	%f10,	%f21
	subcc	%i6,	%i5,	%g1
	edge16n	%i0,	%l0,	%g7
	movvc	%xcc,	%l1,	%o3
	edge16n	%o5,	%o6,	%i4
	umul	%g5,	%o0,	%o1
	array8	%g3,	%g4,	%l6
	movrlez	%o2,	0x229,	%o7
	andncc	%i1,	%l3,	%i3
	stb	%l5,	[%l7 + 0x65]
	movpos	%xcc,	%i2,	%g2
	sdiv	%l2,	0x0411,	%l4
	mulscc	%o4,	%i7,	%i6
	fcmpgt32	%f18,	%f24,	%g6
	fmovdcc	%icc,	%f26,	%f9
	save %g1, 0x1E18, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i5,	0x189D,	%g7
	orn	%l0,	0x1D42,	%o3
	movrne	%o5,	%o6,	%i4
	movne	%icc,	%l1,	%g5
	or	%o0,	%o1,	%g3
	movn	%icc,	%g4,	%l6
	fcmped	%fcc2,	%f28,	%f24
	srax	%o7,	%i1,	%o2
	array16	%i3,	%l5,	%i2
	ldsw	[%l7 + 0x68],	%l3
	srlx	%l2,	0x0A,	%l4
	stb	%g2,	[%l7 + 0x31]
	ldd	[%l7 + 0x50],	%o4
	sdiv	%i6,	0x0445,	%i7
	fmovsne	%icc,	%f12,	%f2
	edge16	%g1,	%i0,	%i5
	orn	%g6,	0x17A3,	%l0
	smul	%o3,	%o5,	%o6
	fnot2s	%f13,	%f15
	ldsw	[%l7 + 0x40],	%i4
	mulx	%l1,	0x0539,	%g7
	fcmpeq16	%f0,	%f24,	%g5
	array16	%o0,	%o1,	%g4
	std	%f0,	[%l7 + 0x50]
	orcc	%g3,	%l6,	%o7
	st	%f2,	[%l7 + 0x2C]
	srlx	%i1,	0x15,	%o2
	fpack16	%f4,	%f26
	edge32l	%l5,	%i3,	%i2
	addcc	%l2,	0x1935,	%l4
	edge8ln	%g2,	%o4,	%i6
	fandnot2	%f26,	%f20,	%f22
	addccc	%l3,	0x0DDF,	%i7
	edge8l	%g1,	%i0,	%g6
	smulcc	%l0,	%o3,	%i5
	mova	%icc,	%o5,	%o6
	movrlz	%l1,	0x0AD,	%g7
	movl	%icc,	%g5,	%i4
	sir	0x08C2
	umulcc	%o1,	%o0,	%g4
	addcc	%g3,	0x15B5,	%o7
	save %l6, %o2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%i3,	%l5,	%l2
	movvc	%xcc,	%l4,	%i2
	xorcc	%o4,	0x089A,	%g2
	sdivx	%i6,	0x0D6F,	%i7
	movgu	%xcc,	%g1,	%i0
	fmul8x16al	%f30,	%f13,	%f26
	udivcc	%l3,	0x024D,	%g6
	restore %o3, %l0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i5,	%o6
	and	%l1,	0x04B2,	%g5
	sub	%i4,	%o1,	%o0
	edge8l	%g7,	%g3,	%o7
	subccc	%g4,	%o2,	%i1
	fpack16	%f12,	%f23
	edge16n	%l6,	%l5,	%l2
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	nop
	set	0x5B, %g2
	stb	%l4,	[%l7 + %g2]
	udivx	%o4,	0x1C19,	%g2
	fmovsa	%icc,	%f19,	%f10
	movvs	%icc,	%i6,	%g1
	movrgz	%i0,	0x0BE,	%l3
	std	%f14,	[%l7 + 0x40]
	move	%xcc,	%g6,	%i7
	srl	%l0,	0x07,	%o3
	array8	%o5,	%i5,	%o6
	sll	%l1,	%g5,	%i4
	movg	%xcc,	%o0,	%g7
	sll	%o1,	%o7,	%g3
	popc	0x0A4A,	%o2
	fabss	%f10,	%f15
	umul	%g4,	%l6,	%i1
	fpsub32	%f12,	%f26,	%f20
	srl	%l2,	0x09,	%i3
	andncc	%i2,	%l4,	%l5
	srl	%o4,	0x0E,	%i6
	ldd	[%l7 + 0x68],	%f0
	ldd	[%l7 + 0x18],	%f4
	array16	%g1,	%g2,	%i0
	andn	%g6,	0x1E65,	%l3
	subcc	%i7,	0x0462,	%o3
	udiv	%o5,	0x16B5,	%l0
	lduw	[%l7 + 0x34],	%o6
	movrlez	%l1,	0x0F5,	%i5
	sir	0x0D5F
	lduh	[%l7 + 0x32],	%i4
	addcc	%g5,	0x0A29,	%o0
	fmovscc	%icc,	%f9,	%f0
	edge16	%g7,	%o7,	%o1
	movle	%icc,	%o2,	%g3
	movvs	%xcc,	%l6,	%i1
	sethi	0x147A,	%g4
	fmovdge	%icc,	%f13,	%f9
	lduw	[%l7 + 0x34],	%i3
	fcmpne16	%f6,	%f6,	%i2
	udivcc	%l2,	0x1835,	%l5
	edge16n	%o4,	%i6,	%g1
	ldd	[%l7 + 0x10],	%l4
	fmul8sux16	%f24,	%f20,	%f14
	xor	%g2,	0x0671,	%g6
	umulcc	%i0,	%i7,	%o3
	st	%f6,	[%l7 + 0x2C]
	udiv	%o5,	0x1277,	%l3
	movvc	%xcc,	%l0,	%l1
	edge32n	%o6,	%i5,	%i4
	and	%o0,	0x12ED,	%g5
	edge8	%g7,	%o7,	%o2
	sethi	0x041F,	%g3
	movrlez	%l6,	0x1FB,	%i1
	array8	%o1,	%g4,	%i3
	movcs	%icc,	%l2,	%i2
	ldsb	[%l7 + 0x79],	%o4
	fmul8x16	%f13,	%f30,	%f6
	sll	%i6,	%g1,	%l5
	fmovdle	%icc,	%f27,	%f23
	fmovrse	%l4,	%f11,	%f9
	sir	0x15B5
	fmovrdlz	%g6,	%f4,	%f10
	andncc	%i0,	%i7,	%g2
	sdivx	%o3,	0x1229,	%l3
	fcmpeq32	%f20,	%f24,	%l0
	fmovse	%xcc,	%f8,	%f13
	fpadd32	%f26,	%f18,	%f26
	movrlez	%l1,	0x127,	%o6
	movrne	%i5,	%o5,	%i4
	fmovsvs	%icc,	%f5,	%f7
	movne	%xcc,	%o0,	%g7
	array8	%o7,	%o2,	%g5
	movleu	%xcc,	%l6,	%i1
	alignaddrl	%g3,	%g4,	%i3
	stw	%o1,	[%l7 + 0x3C]
	fpack32	%f26,	%f0,	%f14
	mulscc	%l2,	%i2,	%o4
	popc	%g1,	%l5
	movne	%xcc,	%i6,	%l4
	movn	%icc,	%g6,	%i7
	movrlez	%g2,	0x1A6,	%i0
	sth	%l3,	[%l7 + 0x12]
	fxnors	%f20,	%f11,	%f12
	fnot2s	%f12,	%f5
	movl	%icc,	%o3,	%l1
	srlx	%o6,	0x1A,	%l0
	edge16l	%i5,	%i4,	%o0
	fpsub16s	%f25,	%f0,	%f0
	fexpand	%f10,	%f22
	fmovsg	%icc,	%f16,	%f10
	fxor	%f12,	%f8,	%f16
	addc	%o5,	0x0578,	%g7
	sth	%o2,	[%l7 + 0x36]
	fmuld8ulx16	%f0,	%f27,	%f12
	bshuffle	%f20,	%f22,	%f20
	movne	%icc,	%g5,	%o7
	fmovsa	%icc,	%f3,	%f0
	xor	%l6,	0x024C,	%i1
	ldd	[%l7 + 0x08],	%g2
	fcmple32	%f6,	%f20,	%g4
	udivx	%o1,	0x099F,	%i3
	fcmpeq16	%f2,	%f20,	%l2
	save %i2, %o4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%icc,	%l5,	%l4
	fcmpne16	%f28,	%f10,	%g6
	fabsd	%f14,	%f0
	umulcc	%i7,	%g2,	%i0
	fnegs	%f21,	%f10
	andncc	%i6,	%o3,	%l1
	addcc	%l3,	0x0F19,	%l0
	array32	%i5,	%i4,	%o0
	movne	%icc,	%o6,	%g7
	fmovdleu	%xcc,	%f6,	%f10
	fpack32	%f14,	%f10,	%f30
	movre	%o5,	%g5,	%o7
	alignaddr	%o2,	%l6,	%g3
	edge8ln	%g4,	%i1,	%o1
	fmovs	%f14,	%f7
	std	%f30,	[%l7 + 0x40]
	fpsub32	%f28,	%f6,	%f0
	movcc	%xcc,	%i3,	%i2
	sir	0x0E4A
	edge32l	%l2,	%g1,	%l5
	movcs	%xcc,	%l4,	%g6
	movg	%xcc,	%i7,	%g2
	stb	%i0,	[%l7 + 0x31]
	sethi	0x0429,	%o4
	srax	%o3,	0x00,	%l1
	addccc	%l3,	0x041B,	%l0
	movl	%icc,	%i5,	%i6
	xnorcc	%o0,	0x1C47,	%o6
	move	%icc,	%g7,	%i4
	movrne	%o5,	%o7,	%g5
	andncc	%l6,	%g3,	%o2
	movrlz	%g4,	0x058,	%o1
	fpackfix	%f0,	%f24
	movcc	%xcc,	%i1,	%i2
	mulscc	%l2,	0x1996,	%g1
	fpadd32	%f30,	%f24,	%f18
	andncc	%i3,	%l4,	%l5
	st	%f24,	[%l7 + 0x68]
	ldd	[%l7 + 0x30],	%f28
	xnorcc	%g6,	%i7,	%i0
	move	%xcc,	%o4,	%o3
	movvs	%icc,	%l1,	%l3
	xorcc	%g2,	0x0FB1,	%l0
	edge32l	%i6,	%o0,	%i5
	umulcc	%o6,	%g7,	%i4
	andn	%o7,	0x050F,	%g5
	movpos	%icc,	%o5,	%l6
	fcmpd	%fcc1,	%f12,	%f8
	edge16	%g3,	%o2,	%o1
	ldsw	[%l7 + 0x30],	%g4
	edge8ln	%i1,	%l2,	%g1
	fpmerge	%f29,	%f5,	%f14
	movpos	%xcc,	%i3,	%l4
	faligndata	%f8,	%f24,	%f6
	stx	%i2,	[%l7 + 0x40]
	sdivcc	%g6,	0x005F,	%l5
	subcc	%i0,	0x1BA5,	%i7
	movre	%o3,	%o4,	%l1
	andcc	%g2,	%l3,	%i6
	alignaddrl	%o0,	%l0,	%o6
	fmovrsgez	%i5,	%f11,	%f19
	edge32l	%g7,	%i4,	%o7
	edge16l	%o5,	%g5,	%g3
	smulcc	%l6,	%o2,	%o1
	movcs	%icc,	%i1,	%g4
	or	%g1,	%i3,	%l2
	ld	[%l7 + 0x14],	%f31
	umulcc	%i2,	0x1C9B,	%g6
	ldsh	[%l7 + 0x38],	%l4
	fmovdcc	%xcc,	%f16,	%f10
	fmovdle	%icc,	%f9,	%f15
	movcc	%xcc,	%l5,	%i0
	ld	[%l7 + 0x64],	%f25
	orn	%o3,	%i7,	%o4
	restore %g2, 0x0646, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l3,	0x1150,	%o0
	fnot1	%f0,	%f20
	ldd	[%l7 + 0x70],	%l0
	xorcc	%i6,	0x154E,	%i5
	ldsb	[%l7 + 0x67],	%o6
	fors	%f24,	%f13,	%f25
	array32	%i4,	%g7,	%o5
	sdivx	%g5,	0x1644,	%g3
	fcmped	%fcc0,	%f4,	%f20
	fpack32	%f10,	%f10,	%f22
	ld	[%l7 + 0x7C],	%f3
	umul	%o7,	%l6,	%o2
	smul	%o1,	%g4,	%i1
	sethi	0x07DA,	%g1
	fpack32	%f18,	%f0,	%f26
	ldd	[%l7 + 0x38],	%l2
	sethi	0x03B7,	%i2
	st	%f14,	[%l7 + 0x10]
	move	%xcc,	%i3,	%g6
	fmovrdlez	%l4,	%f6,	%f14
	fmovdpos	%xcc,	%f3,	%f23
	fnot2s	%f13,	%f25
	subccc	%l5,	0x10D0,	%o3
	alignaddr	%i7,	%o4,	%i0
	fnor	%f26,	%f26,	%f24
	stb	%g2,	[%l7 + 0x5D]
	orn	%l3,	0x1673,	%o0
	fmovrdlz	%l1,	%f10,	%f0
	movcs	%xcc,	%i6,	%i5
	sir	0x1026
	movle	%icc,	%o6,	%l0
	edge32	%g7,	%o5,	%i4
	ldsh	[%l7 + 0x2A],	%g3
	andcc	%o7,	%g5,	%l6
	ld	[%l7 + 0x30],	%f20
	subcc	%o2,	0x07CD,	%o1
	edge32ln	%g4,	%g1,	%l2
	srlx	%i1,	%i3,	%i2
	fsrc2	%f16,	%f6
	addcc	%l4,	0x1ADA,	%g6
	lduw	[%l7 + 0x10],	%l5
	ldd	[%l7 + 0x58],	%o2
	array16	%i7,	%i0,	%g2
	fmovdvs	%icc,	%f21,	%f16
	edge8n	%o4,	%l3,	%l1
	lduw	[%l7 + 0x54],	%o0
	subcc	%i6,	%i5,	%o6
	fone	%f4
	ldsh	[%l7 + 0x4C],	%g7
	mulscc	%l0,	%i4,	%o5
	movrlz	%g3,	0x019,	%g5
	fmovrslez	%o7,	%f10,	%f17
	mulx	%o2,	0x13E9,	%l6
	add	%o1,	%g4,	%l2
	xorcc	%g1,	0x1E98,	%i3
	movrgz	%i1,	%l4,	%i2
	movre	%g6,	%l5,	%o3
	fcmpgt16	%f18,	%f4,	%i7
	movneg	%icc,	%i0,	%g2
	alignaddr	%o4,	%l1,	%o0
	orcc	%l3,	%i6,	%o6
	mulscc	%g7,	0x1E0E,	%l0
	fmovsneg	%icc,	%f19,	%f10
	andcc	%i5,	0x179C,	%i4
	save %g3, %g5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f11,	[%l7 + 0x44]
	movl	%icc,	%o5,	%l6
	edge16ln	%o2,	%g4,	%l2
	movrlez	%o1,	%g1,	%i1
	andn	%l4,	0x0183,	%i3
	movge	%xcc,	%g6,	%i2
	pdist	%f28,	%f16,	%f2
	fxnor	%f14,	%f16,	%f4
	sir	0x04C1
	movne	%xcc,	%o3,	%l5
	movg	%icc,	%i7,	%i0
	movne	%xcc,	%o4,	%l1
	edge8l	%o0,	%l3,	%i6
	nop
	set	0x08, %l0
	std	%f4,	[%l7 + %l0]
	fcmpeq16	%f6,	%f24,	%o6
	fpack16	%f24,	%f16
	edge8ln	%g2,	%l0,	%i5
	fmovdg	%icc,	%f11,	%f0
	st	%f21,	[%l7 + 0x54]
	fmul8ulx16	%f6,	%f4,	%f18
	ldx	[%l7 + 0x70],	%g7
	movn	%xcc,	%g3,	%i4
	sdiv	%o7,	0x0AB2,	%o5
	fmovsgu	%icc,	%f4,	%f1
	ldd	[%l7 + 0x30],	%g4
	fmovrdlz	%o2,	%f20,	%f30
	subcc	%l6,	%g4,	%l2
	fcmpeq16	%f30,	%f22,	%o1
	ld	[%l7 + 0x68],	%f8
	srax	%g1,	0x12,	%l4
	std	%f18,	[%l7 + 0x60]
	std	%f30,	[%l7 + 0x30]
	fzeros	%f19
	sra	%i3,	%g6,	%i2
	st	%f1,	[%l7 + 0x58]
	xnor	%i1,	0x1C43,	%l5
	movrgz	%i7,	0x291,	%o3
	umulcc	%o4,	%i0,	%o0
	udiv	%l3,	0x04DB,	%l1
	ld	[%l7 + 0x54],	%f8
	movcc	%icc,	%i6,	%g2
	move	%icc,	%l0,	%o6
	edge16ln	%g7,	%i5,	%g3
	lduh	[%l7 + 0x62],	%o7
	stw	%i4,	[%l7 + 0x08]
	movcs	%xcc,	%o5,	%g5
	fpack16	%f8,	%f7
	fpsub16s	%f25,	%f27,	%f31
	edge16n	%l6,	%g4,	%l2
	xnor	%o2,	0x1E21,	%g1
	edge8	%o1,	%l4,	%g6
	movvs	%xcc,	%i2,	%i1
	mulx	%l5,	0x1BD0,	%i7
	sub	%i3,	0x0E5F,	%o3
	srlx	%o4,	0x04,	%i0
	edge16n	%o0,	%l3,	%l1
	mova	%icc,	%g2,	%i6
	fcmped	%fcc3,	%f16,	%f22
	fandnot1	%f12,	%f0,	%f18
	move	%icc,	%o6,	%l0
	movle	%icc,	%g7,	%g3
	orcc	%i5,	%o7,	%i4
	fnors	%f12,	%f0,	%f4
	fabss	%f29,	%f31
	array16	%o5,	%g5,	%l6
	fzeros	%f23
	smulcc	%g4,	0x0443,	%l2
	fxors	%f1,	%f0,	%f21
	movvs	%xcc,	%o2,	%g1
	array32	%o1,	%g6,	%l4
	fmovse	%icc,	%f6,	%f24
	fands	%f27,	%f17,	%f21
	sethi	0x15B5,	%i1
	xnor	%i2,	0x0B41,	%l5
	stw	%i7,	[%l7 + 0x68]
	fcmped	%fcc3,	%f24,	%f0
	smulcc	%o3,	%o4,	%i3
	ld	[%l7 + 0x18],	%f4
	std	%f8,	[%l7 + 0x08]
	movgu	%icc,	%i0,	%o0
	movge	%icc,	%l3,	%l1
	udivx	%g2,	0x0A5E,	%i6
	xor	%l0,	%o6,	%g7
	array16	%g3,	%o7,	%i5
	edge32n	%o5,	%i4,	%g5
	fmovdcs	%icc,	%f8,	%f12
	fxnors	%f16,	%f20,	%f11
	andn	%l6,	%g4,	%o2
	orcc	%g1,	0x06CC,	%o1
	fmovsg	%icc,	%f8,	%f10
	udiv	%g6,	0x1A01,	%l2
	fmul8x16al	%f8,	%f0,	%f12
	umul	%i1,	0x10D2,	%l4
	edge8	%i2,	%i7,	%l5
	fxnor	%f2,	%f0,	%f28
	sth	%o4,	[%l7 + 0x5A]
	pdist	%f24,	%f22,	%f6
	fmovsa	%xcc,	%f24,	%f24
	fmul8x16au	%f8,	%f29,	%f8
	movcc	%xcc,	%i3,	%i0
	fmul8x16	%f8,	%f22,	%f26
	edge16l	%o3,	%l3,	%l1
	fandnot1s	%f22,	%f23,	%f12
	nop
	set	0x2A, %o6
	lduh	[%l7 + %o6],	%g2
	edge16ln	%i6,	%l0,	%o0
	movpos	%icc,	%o6,	%g7
	xnorcc	%g3,	0x198E,	%i5
	fpack32	%f30,	%f26,	%f8
	std	%f0,	[%l7 + 0x58]
	fandnot2s	%f8,	%f0,	%f28
	andncc	%o7,	%i4,	%g5
	sir	0x01CF
	orn	%o5,	0x018B,	%g4
	fmovsge	%xcc,	%f17,	%f8
	addccc	%o2,	%g1,	%o1
	xorcc	%g6,	0x0E43,	%l6
	udiv	%l2,	0x0B12,	%i1
	move	%xcc,	%l4,	%i7
	st	%f5,	[%l7 + 0x48]
	fandnot2s	%f30,	%f7,	%f26
	fpmerge	%f7,	%f9,	%f30
	movg	%icc,	%l5,	%i2
	fnors	%f5,	%f18,	%f22
	and	%i3,	%o4,	%i0
	fmovdne	%icc,	%f13,	%f14
	ldsw	[%l7 + 0x08],	%l3
	and	%o3,	%g2,	%i6
	fmovdneg	%xcc,	%f19,	%f16
	movvs	%icc,	%l1,	%l0
	sdivcc	%o0,	0x1BB4,	%g7
	edge16	%o6,	%g3,	%i5
	edge16l	%o7,	%i4,	%o5
	fmovsleu	%xcc,	%f16,	%f16
	popc	0x0042,	%g5
	fmovdl	%xcc,	%f21,	%f15
	fcmps	%fcc3,	%f5,	%f6
	fmovrslz	%g4,	%f3,	%f1
	popc	0x1489,	%g1
	fmovdpos	%icc,	%f19,	%f12
	fandnot2s	%f8,	%f8,	%f18
	udivcc	%o1,	0x0791,	%g6
	addc	%l6,	%l2,	%i1
	mulx	%l4,	%i7,	%l5
	movn	%icc,	%o2,	%i3
	sll	%i2,	0x0A,	%i0
	fmovdvs	%icc,	%f20,	%f3
	or	%l3,	%o4,	%g2
	umulcc	%i6,	%o3,	%l0
	movl	%xcc,	%o0,	%g7
	mova	%xcc,	%l1,	%o6
	movcs	%xcc,	%i5,	%o7
	movg	%xcc,	%g3,	%o5
	mulx	%g5,	%i4,	%g4
	sethi	0x0012,	%o1
	movle	%xcc,	%g6,	%g1
	srax	%l6,	0x09,	%i1
	fnors	%f7,	%f7,	%f15
	sdivx	%l4,	0x11FA,	%l2
	movrgez	%l5,	0x228,	%o2
	fmovdne	%xcc,	%f30,	%f30
	movne	%icc,	%i3,	%i2
	edge32l	%i7,	%l3,	%i0
	ldsb	[%l7 + 0x44],	%g2
	andncc	%o4,	%o3,	%i6
	array8	%o0,	%l0,	%g7
	srlx	%o6,	0x03,	%l1
	movrne	%i5,	0x2CF,	%o7
	andn	%g3,	%g5,	%o5
	fnot1s	%f7,	%f10
	movg	%icc,	%g4,	%o1
	movrlez	%g6,	%i4,	%l6
	array8	%g1,	%l4,	%i1
	srl	%l2,	%o2,	%l5
	edge32	%i2,	%i3,	%l3
	array32	%i0,	%i7,	%g2
	movleu	%xcc,	%o4,	%i6
	sra	%o0,	%l0,	%g7
	sir	0x0426
	movge	%icc,	%o6,	%l1
	smulcc	%i5,	0x1D58,	%o7
	edge32ln	%g3,	%o3,	%o5
	movrlz	%g4,	%g5,	%g6
	stb	%o1,	[%l7 + 0x36]
	umulcc	%l6,	0x0CAB,	%g1
	edge16n	%l4,	%i1,	%i4
	fcmpgt16	%f6,	%f0,	%o2
	edge32n	%l2,	%i2,	%i3
	sllx	%l3,	%i0,	%l5
	sir	0x0D97
	edge32	%i7,	%g2,	%i6
	stb	%o4,	[%l7 + 0x78]
	edge8	%o0,	%g7,	%l0
	popc	%l1,	%o6
	subccc	%i5,	0x03B8,	%g3
	edge8n	%o7,	%o5,	%o3
	edge8n	%g5,	%g4,	%o1
	stx	%l6,	[%l7 + 0x78]
	sdivx	%g6,	0x0E48,	%g1
	movre	%l4,	0x1B4,	%i4
	edge32ln	%i1,	%o2,	%i2
	addccc	%i3,	0x0133,	%l3
	edge8ln	%l2,	%l5,	%i7
	andcc	%g2,	%i0,	%i6
	subc	%o4,	%g7,	%l0
	movrgz	%l1,	%o0,	%o6
	addcc	%g3,	%o7,	%o5
	ldd	[%l7 + 0x28],	%f4
	movvs	%icc,	%i5,	%o3
	and	%g5,	0x0B8E,	%g4
	sll	%o1,	%l6,	%g1
	sdivcc	%l4,	0x0ADA,	%i4
	movg	%icc,	%g6,	%o2
	edge8n	%i2,	%i3,	%l3
	movgu	%xcc,	%l2,	%l5
	stw	%i1,	[%l7 + 0x24]
	xorcc	%i7,	0x1BA1,	%g2
	fcmpne16	%f24,	%f26,	%i0
	ldx	[%l7 + 0x30],	%o4
	movge	%icc,	%g7,	%l0
	orcc	%l1,	%i6,	%o0
	add	%o6,	%g3,	%o7
	movrgz	%i5,	0x1F9,	%o5
	save %g5, %o3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%l6,	%g1,	%l4
	srax	%o1,	0x1C,	%i4
	movre	%o2,	%g6,	%i2
	fmovrsgz	%i3,	%f28,	%f8
	sll	%l3,	%l2,	%l5
	edge16l	%i1,	%g2,	%i7
	srax	%i0,	%g7,	%l0
	movpos	%xcc,	%l1,	%i6
	edge16	%o4,	%o6,	%g3
	fmovsneg	%icc,	%f11,	%f16
	movne	%xcc,	%o0,	%o7
	smul	%i5,	%o5,	%o3
	fmovdcs	%icc,	%f29,	%f9
	fmovdn	%xcc,	%f10,	%f16
	ldx	[%l7 + 0x70],	%g5
	addcc	%l6,	%g1,	%l4
	array32	%o1,	%g4,	%i4
	fcmple32	%f26,	%f30,	%o2
	lduw	[%l7 + 0x1C],	%g6
	fmovsvs	%icc,	%f22,	%f8
	edge16ln	%i3,	%l3,	%i2
	sdiv	%l5,	0x077A,	%l2
	edge32l	%i1,	%i7,	%i0
	faligndata	%f12,	%f18,	%f10
	smul	%g7,	%g2,	%l1
	xor	%i6,	0x07A0,	%l0
	mulx	%o4,	0x1E0F,	%o6
	fmovspos	%xcc,	%f27,	%f20
	subc	%o0,	0x1F16,	%o7
	fnot2	%f0,	%f6
	fnands	%f17,	%f30,	%f22
	ldsw	[%l7 + 0x10],	%g3
	sethi	0x0625,	%i5
	ld	[%l7 + 0x3C],	%f13
	ldsw	[%l7 + 0x6C],	%o5
	add	%o3,	0x1CD3,	%g5
	mulx	%l6,	0x197A,	%l4
	xorcc	%o1,	%g1,	%i4
	sub	%o2,	0x1540,	%g4
	fmovd	%f24,	%f26
	sra	%g6,	%l3,	%i2
	edge16ln	%l5,	%i3,	%l2
	edge16ln	%i1,	%i7,	%g7
	array8	%g2,	%l1,	%i6
	sll	%l0,	0x17,	%o4
	ldd	[%l7 + 0x38],	%f0
	fmovrde	%o6,	%f14,	%f4
	edge16l	%o0,	%i0,	%g3
	movrlz	%o7,	0x134,	%i5
	movrgz	%o5,	%g5,	%l6
	subccc	%l4,	%o1,	%g1
	sllx	%o3,	%o2,	%g4
	popc	0x1724,	%g6
	edge32l	%l3,	%i4,	%i2
	movcs	%icc,	%l5,	%i3
	srax	%i1,	0x1C,	%l2
	fmovrdgez	%g7,	%f12,	%f18
	nop
	set	0x20, %o5
	std	%f20,	[%l7 + %o5]
	std	%f28,	[%l7 + 0x30]
	umul	%g2,	0x012B,	%l1
	fmovrslez	%i7,	%f10,	%f9
	addc	%i6,	%o4,	%l0
	fmovde	%xcc,	%f12,	%f0
	movl	%icc,	%o0,	%i0
	udivcc	%o6,	0x1627,	%g3
	movge	%icc,	%o7,	%i5
	fcmpgt32	%f20,	%f24,	%g5
	fxor	%f8,	%f30,	%f18
	fzero	%f20
	movvc	%icc,	%o5,	%l4
	array16	%l6,	%o1,	%o3
	srl	%o2,	%g1,	%g4
	fmovdcc	%icc,	%f17,	%f5
	fmovdne	%xcc,	%f14,	%f22
	subccc	%g6,	0x09DA,	%l3
	movge	%xcc,	%i2,	%l5
	edge8n	%i3,	%i1,	%l2
	edge32	%i4,	%g2,	%g7
	fmovsle	%xcc,	%f10,	%f1
	fzero	%f10
	array8	%l1,	%i7,	%i6
	ldx	[%l7 + 0x08],	%l0
	edge8n	%o4,	%i0,	%o0
	edge8ln	%o6,	%o7,	%i5
	andn	%g5,	0x0AFB,	%o5
	fcmple32	%f12,	%f2,	%l4
	smul	%g3,	0x0009,	%l6
	udiv	%o1,	0x18E9,	%o2
	fmovda	%xcc,	%f7,	%f9
	srlx	%o3,	0x0C,	%g1
	ldx	[%l7 + 0x28],	%g4
	movvs	%xcc,	%l3,	%i2
	alignaddr	%g6,	%l5,	%i3
	movre	%l2,	0x209,	%i1
	stw	%i4,	[%l7 + 0x30]
	orn	%g7,	0x1C8F,	%g2
	sll	%i7,	0x1A,	%l1
	andncc	%i6,	%l0,	%i0
	edge8l	%o0,	%o4,	%o7
	sra	%o6,	%i5,	%o5
	fornot1	%f10,	%f2,	%f26
	array8	%g5,	%g3,	%l4
	bshuffle	%f2,	%f14,	%f2
	move	%icc,	%o1,	%o2
	fabss	%f6,	%f18
	movre	%l6,	%o3,	%g4
	array16	%g1,	%i2,	%l3
	fmovsn	%xcc,	%f31,	%f19
	save %l5, 0x1EB3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x3A, %i7
	lduh	[%l7 + %i7],	%g6
	edge32n	%l2,	%i1,	%i4
	movvc	%icc,	%g7,	%i7
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	alignaddr	%l0,	%i6,	%o0
	sdiv	%o4,	0x103E,	%i0
	orcc	%o6,	%i5,	%o5
	edge16ln	%g5,	%g3,	%l4
	sdivx	%o1,	0x1A02,	%o7
	fmovdle	%xcc,	%f2,	%f18
	movleu	%icc,	%l6,	%o2
	fzeros	%f26
	movvs	%xcc,	%o3,	%g1
	andcc	%g4,	%l3,	%l5
	lduw	[%l7 + 0x10],	%i3
	mulx	%i2,	%l2,	%i1
	ldd	[%l7 + 0x10],	%g6
	addccc	%i4,	0x0173,	%i7
	stb	%g2,	[%l7 + 0x57]
	edge16ln	%g7,	%l0,	%i6
	movge	%icc,	%o0,	%o4
	or	%l1,	%o6,	%i5
	fzeros	%f16
	movvs	%icc,	%i0,	%g5
	st	%f21,	[%l7 + 0x58]
	fmovsgu	%xcc,	%f24,	%f19
	sdivcc	%g3,	0x00D9,	%l4
	subcc	%o1,	0x0D3A,	%o5
	movneg	%xcc,	%l6,	%o2
	fandnot1s	%f3,	%f30,	%f25
	fcmpeq16	%f22,	%f16,	%o3
	sub	%g1,	0x0113,	%g4
	edge16ln	%o7,	%l3,	%l5
	std	%f26,	[%l7 + 0x28]
	fzero	%f28
	srlx	%i2,	0x11,	%l2
	movcc	%icc,	%i1,	%g6
	stx	%i3,	[%l7 + 0x08]
	fandnot1	%f30,	%f6,	%f4
	mova	%xcc,	%i4,	%i7
	and	%g2,	0x0BF1,	%g7
	alignaddr	%l0,	%i6,	%o4
	array32	%l1,	%o6,	%o0
	ldsh	[%l7 + 0x40],	%i5
	stx	%g5,	[%l7 + 0x58]
	sdivcc	%g3,	0x10AA,	%l4
	udiv	%i0,	0x0F73,	%o5
	ldsh	[%l7 + 0x4E],	%l6
	addc	%o1,	%o2,	%o3
	or	%g1,	0x0E09,	%g4
	fmovdg	%xcc,	%f30,	%f11
	edge16l	%l3,	%o7,	%l5
	lduw	[%l7 + 0x2C],	%l2
	edge32l	%i2,	%i1,	%g6
	orn	%i3,	0x14F7,	%i7
	movgu	%icc,	%g2,	%i4
	umul	%l0,	0x1A89,	%g7
	alignaddr	%o4,	%l1,	%i6
	edge32n	%o0,	%i5,	%g5
	edge32ln	%o6,	%g3,	%l4
	umul	%i0,	%o5,	%o1
	umulcc	%o2,	0x1BAB,	%l6
	edge8ln	%g1,	%g4,	%o3
	fabsd	%f6,	%f4
	fnegd	%f26,	%f28
	movcc	%xcc,	%l3,	%l5
	array8	%l2,	%o7,	%i1
	mova	%icc,	%g6,	%i3
	andcc	%i2,	%i7,	%i4
	stb	%l0,	[%l7 + 0x27]
	ld	[%l7 + 0x54],	%f12
	sub	%g7,	0x0BBB,	%o4
	srl	%l1,	0x10,	%i6
	addccc	%o0,	%i5,	%g5
	movn	%icc,	%g2,	%o6
	sub	%g3,	%i0,	%o5
	ld	[%l7 + 0x6C],	%f29
	movrlez	%l4,	%o2,	%o1
	edge32	%g1,	%g4,	%l6
	addc	%o3,	0x0BD7,	%l3
	sll	%l5,	%o7,	%i1
	movg	%icc,	%l2,	%i3
	ldub	[%l7 + 0x63],	%i2
	sllx	%i7,	%i4,	%g6
	movrgz	%l0,	0x1F0,	%g7
	st	%f23,	[%l7 + 0x34]
	sir	0x19D3
	edge16	%o4,	%l1,	%i6
	andncc	%i5,	%g5,	%g2
	fmovrdlz	%o6,	%f22,	%f30
	faligndata	%f28,	%f30,	%f2
	movvs	%icc,	%o0,	%g3
	nop
	set	0x2A, %o0
	ldub	[%l7 + %o0],	%i0
	fnegd	%f8,	%f2
	fcmpne16	%f12,	%f22,	%l4
	orcc	%o5,	%o2,	%o1
	edge8n	%g4,	%g1,	%l6
	fnands	%f3,	%f21,	%f18
	orncc	%o3,	0x1242,	%l5
	array16	%o7,	%l3,	%i1
	addccc	%i3,	%i2,	%l2
	movcs	%icc,	%i4,	%i7
	edge8n	%g6,	%g7,	%l0
	ldx	[%l7 + 0x78],	%o4
	edge32	%i6,	%l1,	%i5
	ld	[%l7 + 0x10],	%f16
	movrgez	%g2,	0x1FE,	%g5
	nop
	set	0x0C, %i0
	stw	%o0,	[%l7 + %i0]
	array8	%g3,	%o6,	%i0
	fandnot2s	%f3,	%f31,	%f4
	edge16	%l4,	%o2,	%o5
	sll	%g4,	0x00,	%o1
	udivcc	%l6,	0x14EF,	%o3
	addcc	%g1,	%l5,	%o7
	fmovsvs	%icc,	%f30,	%f27
	orncc	%i1,	%i3,	%l3
	xor	%i2,	0x0F5B,	%i4
	lduw	[%l7 + 0x20],	%i7
	movneg	%icc,	%g6,	%g7
	movn	%xcc,	%l0,	%o4
	mova	%icc,	%l2,	%l1
	lduw	[%l7 + 0x64],	%i6
	edge8l	%g2,	%i5,	%o0
	edge16ln	%g3,	%o6,	%i0
	fmovrdne	%g5,	%f6,	%f4
	movle	%icc,	%l4,	%o2
	movl	%icc,	%o5,	%g4
	xorcc	%o1,	%o3,	%l6
	array8	%g1,	%l5,	%o7
	sub	%i1,	0x10DF,	%i3
	sllx	%i2,	0x03,	%i4
	srax	%l3,	0x08,	%i7
	move	%xcc,	%g6,	%l0
	subcc	%g7,	0x1D4B,	%o4
	edge8ln	%l1,	%l2,	%g2
	orn	%i5,	0x0918,	%o0
	umul	%i6,	0x17DF,	%o6
	subccc	%g3,	0x05C6,	%g5
	edge16ln	%l4,	%i0,	%o5
	fpadd16	%f22,	%f18,	%f8
	smulcc	%o2,	%g4,	%o3
	fcmple16	%f26,	%f12,	%o1
	sethi	0x1FA2,	%g1
	edge8	%l6,	%o7,	%i1
	srl	%i3,	%i2,	%l5
	edge16ln	%l3,	%i7,	%g6
	save %l0, 0x1994, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o4,	%i4
	fmuld8sux16	%f19,	%f9,	%f18
	edge32l	%l2,	%g2,	%l1
	alignaddr	%o0,	%i5,	%i6
	or	%g3,	0x055D,	%g5
	movle	%xcc,	%l4,	%i0
	edge32	%o6,	%o5,	%o2
	addcc	%g4,	0x1BA8,	%o1
	fmovde	%xcc,	%f10,	%f9
	addcc	%g1,	0x1CA7,	%o3
	movn	%icc,	%l6,	%o7
	movrlez	%i1,	0x2E2,	%i2
	fpsub16	%f24,	%f10,	%f14
	smul	%l5,	0x106E,	%i3
	fxors	%f7,	%f6,	%f8
	movg	%icc,	%l3,	%g6
	movne	%icc,	%i7,	%l0
	edge32ln	%g7,	%o4,	%i4
	fmovdgu	%xcc,	%f9,	%f29
	umulcc	%g2,	%l2,	%l1
	nop
	set	0x4C, %g6
	lduw	[%l7 + %g6],	%o0
	ldd	[%l7 + 0x78],	%i4
	movleu	%icc,	%g3,	%g5
	ldsw	[%l7 + 0x14],	%l4
	ldub	[%l7 + 0x4D],	%i0
	st	%f16,	[%l7 + 0x7C]
	stw	%i6,	[%l7 + 0x5C]
	fpack16	%f8,	%f12
	or	%o6,	%o5,	%o2
	fcmpeq16	%f28,	%f4,	%o1
	sth	%g4,	[%l7 + 0x14]
	fmovdg	%icc,	%f5,	%f24
	addccc	%g1,	0x1916,	%l6
	array16	%o7,	%o3,	%i1
	andncc	%l5,	%i3,	%l3
	fornot2	%f0,	%f26,	%f8
	nop
	set	0x28, %o7
	ldd	[%l7 + %o7],	%i2
	fmovscs	%xcc,	%f6,	%f20
	fsrc1s	%f5,	%f12
	xor	%i7,	0x111B,	%g6
	movgu	%xcc,	%g7,	%l0
	alignaddrl	%i4,	%o4,	%l2
	ldx	[%l7 + 0x68],	%l1
	array8	%g2,	%i5,	%g3
	fpadd32s	%f5,	%f24,	%f6
	fpadd16s	%f15,	%f20,	%f26
	addccc	%o0,	0x044F,	%l4
	xnor	%g5,	%i0,	%o6
	edge8n	%o5,	%o2,	%o1
	udivcc	%i6,	0x05CF,	%g4
	movrlez	%g1,	0x04D,	%l6
	array32	%o7,	%i1,	%o3
	sdivcc	%i3,	0x17B3,	%l3
	umul	%l5,	0x1665,	%i2
	fmovdne	%icc,	%f3,	%f1
	fornot2s	%f30,	%f2,	%f26
	movpos	%xcc,	%i7,	%g7
	movrlez	%g6,	%i4,	%l0
	fnor	%f6,	%f26,	%f22
	movle	%icc,	%l2,	%l1
	edge8l	%o4,	%i5,	%g3
	movg	%xcc,	%g2,	%o0
	movneg	%xcc,	%l4,	%i0
	fxor	%f0,	%f12,	%f30
	edge32l	%o6,	%g5,	%o5
	movcs	%xcc,	%o2,	%i6
	andcc	%g4,	0x0A0C,	%o1
	alignaddr	%g1,	%l6,	%i1
	edge16n	%o7,	%i3,	%o3
	srax	%l5,	%i2,	%l3
	fmovdn	%icc,	%f23,	%f4
	fpadd32	%f16,	%f20,	%f22
	mulscc	%g7,	0x1E70,	%g6
	movg	%xcc,	%i7,	%l0
	ld	[%l7 + 0x60],	%f8
	fnor	%f26,	%f16,	%f20
	save %i4, %l2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i5,	%g3,	%g2
	fpadd32	%f0,	%f24,	%f20
	fmovsle	%xcc,	%f21,	%f20
	and	%o4,	0x05F4,	%o0
	udivcc	%i0,	0x10BB,	%l4
	ldsw	[%l7 + 0x34],	%g5
	or	%o5,	0x1BEB,	%o2
	fxnors	%f22,	%f3,	%f17
	ldsh	[%l7 + 0x60],	%i6
	fmovscs	%icc,	%f25,	%f18
	movrlz	%g4,	%o6,	%g1
	stb	%o1,	[%l7 + 0x35]
	fabsd	%f26,	%f22
	fmovse	%xcc,	%f4,	%f23
	and	%l6,	%i1,	%o7
	add	%o3,	0x05D3,	%l5
	ldub	[%l7 + 0x53],	%i3
	xorcc	%i2,	%l3,	%g7
	fmovrsne	%g6,	%f8,	%f29
	mulscc	%i7,	0x13BF,	%i4
	umulcc	%l0,	%l1,	%i5
	alignaddrl	%g3,	%l2,	%o4
	movcc	%xcc,	%g2,	%o0
	sdivcc	%i0,	0x0BA4,	%l4
	xnorcc	%o5,	%o2,	%i6
	movle	%xcc,	%g5,	%o6
	st	%f14,	[%l7 + 0x14]
	alignaddr	%g4,	%g1,	%o1
	fabss	%f6,	%f10
	move	%icc,	%i1,	%o7
	xor	%l6,	%o3,	%i3
	edge8ln	%l5,	%l3,	%i2
	subcc	%g7,	%g6,	%i4
	movg	%xcc,	%l0,	%l1
	fnegs	%f10,	%f18
	movcc	%xcc,	%i5,	%i7
	movcs	%icc,	%l2,	%g3
	ldx	[%l7 + 0x60],	%g2
	movrgz	%o4,	%i0,	%o0
	srax	%o5,	0x03,	%o2
	fmovda	%icc,	%f5,	%f16
	std	%f4,	[%l7 + 0x20]
	movg	%icc,	%l4,	%i6
	edge8	%g5,	%o6,	%g1
	fxors	%f21,	%f22,	%f1
	ldsw	[%l7 + 0x38],	%o1
	movvc	%xcc,	%g4,	%i1
	fnands	%f24,	%f6,	%f22
	st	%f20,	[%l7 + 0x60]
	fmovsg	%xcc,	%f27,	%f3
	move	%icc,	%o7,	%o3
	movle	%icc,	%i3,	%l6
	sra	%l5,	0x15,	%l3
	or	%i2,	0x071C,	%g6
	fmovsneg	%xcc,	%f10,	%f0
	subc	%i4,	%g7,	%l0
	ldub	[%l7 + 0x66],	%l1
	stw	%i7,	[%l7 + 0x58]
	fmovscc	%icc,	%f10,	%f26
	sub	%i5,	%g3,	%g2
	edge8l	%o4,	%l2,	%i0
	addccc	%o0,	0x09B5,	%o2
	array8	%o5,	%i6,	%l4
	addcc	%g5,	0x0612,	%o6
	subcc	%g1,	%g4,	%i1
	fcmpne16	%f2,	%f30,	%o7
	fcmpgt16	%f24,	%f10,	%o1
	fornot2	%f12,	%f30,	%f24
	xnorcc	%o3,	0x1C0E,	%l6
	move	%xcc,	%i3,	%l3
	subc	%l5,	%i2,	%i4
	srax	%g7,	0x03,	%l0
	xorcc	%l1,	0x0A7A,	%i7
	subccc	%i5,	%g6,	%g3
	xorcc	%g2,	%l2,	%i0
	movre	%o0,	%o4,	%o5
	fmovdge	%icc,	%f31,	%f2
	ldd	[%l7 + 0x30],	%i6
	udivx	%l4,	0x0C7C,	%g5
	and	%o6,	%o2,	%g4
	fcmpes	%fcc3,	%f26,	%f24
	mulscc	%g1,	0x051B,	%o7
	fmovrsgez	%i1,	%f30,	%f14
	mulscc	%o1,	0x1333,	%l6
	movle	%xcc,	%i3,	%l3
	movrlez	%o3,	%l5,	%i4
	movpos	%xcc,	%g7,	%l0
	subc	%l1,	%i7,	%i5
	movvs	%icc,	%g6,	%g3
	fcmped	%fcc3,	%f20,	%f28
	fornot1	%f2,	%f8,	%f18
	edge32ln	%g2,	%i2,	%l2
	and	%i0,	0x0F3C,	%o4
	movvc	%xcc,	%o5,	%o0
	array32	%i6,	%l4,	%g5
	fnot1s	%f2,	%f0
	fcmpd	%fcc3,	%f20,	%f20
	srl	%o6,	0x04,	%g4
	or	%o2,	%g1,	%o7
	sdivcc	%i1,	0x1120,	%o1
	mulscc	%i3,	%l6,	%l3
	andcc	%l5,	%i4,	%o3
	popc	%l0,	%l1
	movleu	%xcc,	%g7,	%i5
	add	%g6,	0x1BC9,	%g3
	sethi	0x153E,	%g2
	fmovrdgez	%i2,	%f30,	%f8
	fpadd16	%f24,	%f8,	%f18
	movpos	%icc,	%i7,	%l2
	xnor	%i0,	%o5,	%o0
	sra	%i6,	%l4,	%o4
	udiv	%g5,	0x0B6E,	%g4
	fone	%f10
	fmovrsne	%o6,	%f26,	%f30
	edge16n	%g1,	%o7,	%i1
	movg	%xcc,	%o2,	%o1
	popc	%i3,	%l3
	movne	%icc,	%l5,	%i4
	fnegd	%f28,	%f24
	addccc	%o3,	0x0743,	%l0
	fmul8x16	%f10,	%f0,	%f16
	add	%l6,	%g7,	%i5
	fnegs	%f18,	%f11
	alignaddr	%l1,	%g3,	%g2
	fandnot2	%f10,	%f22,	%f24
	movpos	%icc,	%i2,	%i7
	add	%l2,	%g6,	%i0
	std	%f20,	[%l7 + 0x28]
	sub	%o0,	0x18E1,	%i6
	addc	%o5,	%l4,	%o4
	edge8ln	%g4,	%o6,	%g5
	restore %g1, %o7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i1,	0x1A75,	%i3
	sir	0x19E1
	sth	%o1,	[%l7 + 0x0E]
	fcmpeq16	%f10,	%f16,	%l5
	subc	%i4,	0x100C,	%o3
	stb	%l0,	[%l7 + 0x0A]
	fmovdleu	%xcc,	%f11,	%f2
	sdivcc	%l6,	0x08BA,	%g7
	sllx	%i5,	%l3,	%l1
	std	%f0,	[%l7 + 0x08]
	movre	%g2,	0x254,	%i2
	sethi	0x1A79,	%i7
	mulx	%l2,	0x1624,	%g3
	fcmpes	%fcc3,	%f31,	%f23
	orncc	%g6,	%i0,	%o0
	fmovrdne	%o5,	%f18,	%f4
	edge8n	%i6,	%o4,	%g4
	mulx	%o6,	0x14B9,	%g5
	sethi	0x10B9,	%l4
	stx	%g1,	[%l7 + 0x58]
	st	%f17,	[%l7 + 0x7C]
	fpackfix	%f18,	%f9
	fmovrslz	%o2,	%f26,	%f11
	st	%f22,	[%l7 + 0x50]
	fmovsa	%xcc,	%f7,	%f15
	sth	%i1,	[%l7 + 0x76]
	fnot1s	%f12,	%f16
	fmovsneg	%icc,	%f18,	%f15
	edge32l	%o7,	%i3,	%l5
	ldsb	[%l7 + 0x50],	%i4
	xor	%o1,	0x1400,	%l0
	movle	%icc,	%l6,	%g7
	move	%icc,	%i5,	%o3
	subc	%l1,	%l3,	%g2
	movleu	%icc,	%i7,	%i2
	andcc	%l2,	%g6,	%g3
	movg	%xcc,	%i0,	%o5
	fmovsneg	%xcc,	%f30,	%f26
	fpackfix	%f16,	%f26
	edge32l	%i6,	%o0,	%g4
	mova	%xcc,	%o6,	%o4
	movre	%g5,	%l4,	%g1
	fexpand	%f13,	%f4
	add	%i1,	%o2,	%o7
	or	%i3,	0x16AB,	%l5
	or	%o1,	%l0,	%i4
	fmovsvc	%xcc,	%f24,	%f10
	mulx	%g7,	0x1E2D,	%l6
	array16	%i5,	%l1,	%l3
	array16	%g2,	%o3,	%i2
	srl	%l2,	0x0B,	%i7
	movre	%g3,	0x1C3,	%i0
	sra	%o5,	%g6,	%o0
	std	%f8,	[%l7 + 0x18]
	array16	%g4,	%i6,	%o6
	stb	%o4,	[%l7 + 0x1A]
	edge8	%g5,	%l4,	%g1
	edge8n	%i1,	%o7,	%i3
	movne	%xcc,	%l5,	%o1
	or	%o2,	0x0988,	%i4
	edge8l	%g7,	%l0,	%i5
	fmovsa	%xcc,	%f29,	%f8
	alignaddrl	%l6,	%l1,	%g2
	fpmerge	%f18,	%f24,	%f24
	andncc	%l3,	%o3,	%l2
	mulx	%i2,	%i7,	%g3
	ldsh	[%l7 + 0x4A],	%i0
	movle	%xcc,	%o5,	%o0
	subccc	%g6,	0x16FD,	%i6
	edge32ln	%g4,	%o4,	%o6
	movrne	%g5,	0x362,	%l4
	movrgz	%i1,	0x29D,	%o7
	ldd	[%l7 + 0x08],	%g0
	stb	%i3,	[%l7 + 0x4C]
	sdiv	%l5,	0x01A7,	%o2
	ldd	[%l7 + 0x78],	%o0
	edge8n	%i4,	%l0,	%i5
	movrgez	%l6,	%g7,	%l1
	fcmpne32	%f28,	%f26,	%g2
	and	%l3,	%o3,	%i2
	lduh	[%l7 + 0x20],	%l2
	subc	%g3,	%i7,	%i0
	add	%o5,	%o0,	%i6
	stb	%g6,	[%l7 + 0x40]
	movrne	%g4,	0x1E6,	%o6
	lduw	[%l7 + 0x30],	%o4
	fpsub16s	%f5,	%f12,	%f15
	udivx	%g5,	0x0E8E,	%l4
	umul	%o7,	%g1,	%i3
	movrlz	%l5,	0x04F,	%o2
	movrne	%o1,	0x39C,	%i4
	edge16ln	%l0,	%i5,	%i1
	smulcc	%g7,	%l1,	%g2
	fmovdcs	%xcc,	%f20,	%f13
	ldsw	[%l7 + 0x0C],	%l3
	array32	%l6,	%i2,	%o3
	array32	%g3,	%i7,	%i0
	edge32l	%l2,	%o5,	%i6
	edge16ln	%g6,	%g4,	%o0
	sdivcc	%o6,	0x18CD,	%o4
	mulx	%l4,	0x13E4,	%g5
	orcc	%g1,	%o7,	%l5
	andncc	%i3,	%o1,	%i4
	movcc	%xcc,	%l0,	%o2
	subccc	%i5,	%i1,	%l1
	ldsb	[%l7 + 0x5D],	%g7
	orn	%g2,	%l3,	%i2
	orcc	%o3,	0x044E,	%g3
	srl	%i7,	0x0C,	%i0
	ldsw	[%l7 + 0x10],	%l6
	subcc	%l2,	0x1324,	%i6
	srlx	%o5,	0x0D,	%g4
	umul	%g6,	0x1329,	%o6
	sir	0x0702
	udiv	%o0,	0x09DA,	%o4
	sir	0x1992
	subccc	%g5,	0x1D63,	%g1
	ldsb	[%l7 + 0x26],	%l4
	ldd	[%l7 + 0x60],	%o6
	edge16l	%i3,	%l5,	%i4
	ldd	[%l7 + 0x28],	%f16
	movvc	%icc,	%l0,	%o1
	fmovsvs	%icc,	%f11,	%f16
	mulscc	%o2,	%i1,	%i5
	alignaddrl	%l1,	%g2,	%g7
	fmovscc	%xcc,	%f10,	%f20
	srl	%i2,	%o3,	%g3
	movg	%xcc,	%i7,	%l3
	array32	%i0,	%l6,	%i6
	fpsub16s	%f15,	%f17,	%f11
	fmovdneg	%icc,	%f22,	%f4
	or	%l2,	%g4,	%g6
	udivx	%o6,	0x0A68,	%o0
	mulx	%o4,	0x1B55,	%g5
	ldx	[%l7 + 0x30],	%o5
	edge32ln	%g1,	%l4,	%i3
	movcc	%xcc,	%o7,	%l5
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	fmovdneg	%icc,	%f20,	%f7
	sdivcc	%i4,	0x0BE2,	%i1
	xnor	%o2,	0x02F8,	%i5
	movg	%icc,	%g2,	%l1
	fnot2	%f28,	%f6
	st	%f23,	[%l7 + 0x30]
	movleu	%icc,	%i2,	%o3
	fnegd	%f8,	%f12
	sra	%g3,	%i7,	%l3
	fors	%f1,	%f7,	%f7
	st	%f4,	[%l7 + 0x5C]
	fmovsl	%icc,	%f31,	%f6
	edge8n	%i0,	%g7,	%i6
	edge16l	%l6,	%g4,	%l2
	subc	%o6,	%g6,	%o4
	sllx	%o0,	0x0A,	%g5
	orn	%g1,	0x1178,	%l4
	subc	%o5,	0x0632,	%o7
	movcc	%icc,	%l5,	%l0
	stx	%i3,	[%l7 + 0x18]
	movvs	%icc,	%o1,	%i1
	subc	%o2,	0x00B3,	%i5
	edge16l	%g2,	%i4,	%l1
	movleu	%xcc,	%o3,	%g3
	st	%f18,	[%l7 + 0x68]
	smulcc	%i2,	0x0E8A,	%l3
	alignaddrl	%i7,	%g7,	%i0
	edge32n	%l6,	%i6,	%l2
	sra	%g4,	%g6,	%o4
	ldsw	[%l7 + 0x0C],	%o6
	fnot1s	%f20,	%f23
	fsrc1	%f16,	%f2
	popc	%o0,	%g1
	save %l4, 0x07FD, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f23,	%f29,	%f3
	fmovdvc	%icc,	%f23,	%f27
	mova	%xcc,	%o7,	%g5
	fands	%f6,	%f14,	%f30
	ldd	[%l7 + 0x68],	%f30
	and	%l0,	%l5,	%o1
	and	%i1,	0x1FF6,	%o2
	st	%f30,	[%l7 + 0x64]
	and	%i3,	%g2,	%i5
	fand	%f30,	%f18,	%f16
	orcc	%i4,	%l1,	%o3
	fornot1	%f18,	%f0,	%f2
	movrgz	%g3,	%i2,	%l3
	and	%i7,	%i0,	%l6
	edge16n	%g7,	%l2,	%i6
	orcc	%g6,	0x00F8,	%g4
	sethi	0x00F5,	%o4
	edge16ln	%o0,	%o6,	%l4
	sub	%o5,	%g1,	%g5
	xorcc	%l0,	%o7,	%o1
	ldsw	[%l7 + 0x74],	%i1
	st	%f2,	[%l7 + 0x0C]
	fands	%f26,	%f20,	%f15
	fmovrslz	%o2,	%f1,	%f12
	ldub	[%l7 + 0x18],	%i3
	sethi	0x0EDF,	%l5
	subc	%i5,	%i4,	%g2
	addccc	%l1,	0x0479,	%o3
	edge16l	%g3,	%i2,	%i7
	sir	0x0B73
	srlx	%i0,	0x10,	%l3
	fmovdl	%xcc,	%f13,	%f27
	alignaddr	%l6,	%g7,	%l2
	movle	%icc,	%i6,	%g4
	xor	%o4,	%o0,	%o6
	movvc	%icc,	%g6,	%l4
	popc	0x185B,	%o5
	orn	%g5,	%l0,	%o7
	movre	%o1,	0x03A,	%g1
	movcs	%xcc,	%o2,	%i3
	movge	%xcc,	%l5,	%i1
	movrne	%i5,	%g2,	%l1
	fmovsg	%xcc,	%f27,	%f27
	edge32n	%i4,	%g3,	%i2
	fmovda	%icc,	%f5,	%f24
	fxnor	%f6,	%f26,	%f28
	edge8ln	%i7,	%i0,	%o3
	edge8n	%l3,	%g7,	%l2
	fzeros	%f29
	stb	%l6,	[%l7 + 0x49]
	or	%g4,	%o4,	%i6
	edge32n	%o6,	%o0,	%g6
	edge16ln	%o5,	%l4,	%l0
	fmovscc	%xcc,	%f28,	%f8
	movvs	%icc,	%g5,	%o1
	edge8	%o7,	%g1,	%i3
	sethi	0x009A,	%o2
	sra	%i1,	%i5,	%l5
	st	%f17,	[%l7 + 0x68]
	andncc	%l1,	%g2,	%g3
	movgu	%icc,	%i4,	%i7
	sethi	0x1179,	%i0
	fandnot2s	%f10,	%f26,	%f12
	lduh	[%l7 + 0x32],	%o3
	fmovsvc	%xcc,	%f23,	%f11
	orn	%l3,	%i2,	%l2
	add	%g7,	0x03E4,	%g4
	move	%icc,	%l6,	%o4
	smulcc	%i6,	%o6,	%g6
	orcc	%o0,	0x1CE5,	%l4
	fcmpgt16	%f14,	%f10,	%o5
	sub	%g5,	0x00CE,	%o1
	fmovsle	%xcc,	%f11,	%f5
	orncc	%l0,	%o7,	%i3
	mulscc	%o2,	0x167E,	%i1
	fmul8x16au	%f14,	%f10,	%f10
	orncc	%i5,	0x10C4,	%l5
	fmovdleu	%xcc,	%f1,	%f2
	array8	%g1,	%g2,	%g3
	nop
	set	0x18, %i1
	stw	%l1,	[%l7 + %i1]
	srax	%i7,	0x05,	%i4
	sub	%o3,	0x0C2C,	%i0
	fmovdge	%xcc,	%f17,	%f29
	edge8n	%l3,	%i2,	%g7
	mulscc	%l2,	%l6,	%g4
	movre	%i6,	%o6,	%g6
	edge16l	%o4,	%l4,	%o5
	lduh	[%l7 + 0x6E],	%o0
	st	%f20,	[%l7 + 0x5C]
	fmovspos	%xcc,	%f30,	%f22
	array16	%o1,	%l0,	%g5
	udiv	%i3,	0x1E87,	%o7
	movvc	%icc,	%i1,	%i5
	fsrc1s	%f24,	%f16
	edge32n	%l5,	%o2,	%g2
	sdiv	%g3,	0x10C5,	%g1
	edge16l	%i7,	%i4,	%l1
	edge8n	%o3,	%i0,	%l3
	sra	%g7,	%i2,	%l2
	ldx	[%l7 + 0x68],	%l6
	movg	%icc,	%i6,	%o6
	fmovdn	%xcc,	%f19,	%f27
	ldd	[%l7 + 0x58],	%f6
	fmovrdlz	%g4,	%f20,	%f22
	movpos	%icc,	%g6,	%o4
	edge8ln	%l4,	%o0,	%o1
	fzero	%f26
	restore %l0, %g5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f8,	%f29
	sra	%o7,	0x03,	%i1
	ldd	[%l7 + 0x18],	%f0
	edge16l	%i5,	%l5,	%o2
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	alignaddrl	%i7,	%i4,	%g1
	andncc	%o3,	%l1,	%i0
	ldx	[%l7 + 0x60],	%g7
	movgu	%icc,	%i2,	%l3
	edge16l	%l6,	%l2,	%o6
	popc	0x1764,	%g4
	sdiv	%i6,	0x05CD,	%o4
	fcmpeq16	%f10,	%f10,	%l4
	fmul8x16al	%f15,	%f1,	%f28
	stw	%o0,	[%l7 + 0x24]
	edge32ln	%o1,	%l0,	%g6
	sdivcc	%o5,	0x07DA,	%g5
	orn	%i1,	0x037B,	%i5
	fpadd16	%f2,	%f26,	%f12
	edge8ln	%l5,	%o7,	%o2
	ldx	[%l7 + 0x18],	%i3
	fmovrsgez	%g2,	%f18,	%f16
	subccc	%g3,	%i7,	%g1
	fnot1	%f24,	%f14
	edge16l	%i4,	%o3,	%l1
	stx	%i0,	[%l7 + 0x10]
	movre	%i2,	0x340,	%l3
	movvc	%xcc,	%g7,	%l6
	ld	[%l7 + 0x3C],	%f23
	alignaddr	%o6,	%g4,	%i6
	fpsub32s	%f28,	%f5,	%f14
	fzeros	%f0
	mova	%icc,	%o4,	%l4
	sethi	0x16E5,	%o0
	ldsb	[%l7 + 0x48],	%o1
	ldd	[%l7 + 0x08],	%l2
	fmovsne	%xcc,	%f8,	%f0
	edge16	%g6,	%o5,	%l0
	ldsh	[%l7 + 0x10],	%g5
	stw	%i5,	[%l7 + 0x78]
	fxnor	%f30,	%f30,	%f10
	movgu	%xcc,	%l5,	%i1
	movcs	%xcc,	%o2,	%o7
	movn	%xcc,	%i3,	%g3
	orncc	%g2,	%g1,	%i7
	edge16n	%o3,	%i4,	%l1
	movrne	%i2,	0x0A6,	%i0
	udiv	%g7,	0x09DF,	%l6
	udivcc	%o6,	0x11DC,	%l3
	ldsw	[%l7 + 0x30],	%g4
	array16	%o4,	%i6,	%o0
	edge32n	%o1,	%l2,	%l4
	movcc	%xcc,	%o5,	%l0
	srlx	%g5,	0x1A,	%g6
	fpack32	%f18,	%f26,	%f30
	udiv	%i5,	0x1498,	%i1
	sub	%o2,	%o7,	%i3
	movrlez	%g3,	0x120,	%l5
	udivcc	%g1,	0x1114,	%g2
	fmovscs	%icc,	%f29,	%f30
	subcc	%i7,	%i4,	%o3
	fandnot1	%f28,	%f14,	%f24
	lduw	[%l7 + 0x24],	%l1
	movle	%xcc,	%i0,	%g7
	addcc	%l6,	%i2,	%o6
	lduh	[%l7 + 0x50],	%g4
	edge32n	%o4,	%l3,	%o0
	array16	%o1,	%l2,	%l4
	save %i6, 0x17A0, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l0,	%g5,	%i5
	movrlez	%i1,	%g6,	%o7
	mova	%icc,	%i3,	%o2
	edge16ln	%l5,	%g3,	%g1
	subc	%g2,	0x1F65,	%i4
	udiv	%i7,	0x01DF,	%o3
	subcc	%l1,	0x14F9,	%i0
	movre	%l6,	0x313,	%i2
	addcc	%o6,	%g4,	%g7
	ldsb	[%l7 + 0x53],	%l3
	srax	%o4,	%o1,	%l2
	addc	%l4,	0x0003,	%o0
	ld	[%l7 + 0x7C],	%f17
	subcc	%i6,	0x1D94,	%l0
	fmovdcs	%icc,	%f22,	%f16
	mulscc	%o5,	%g5,	%i5
	movneg	%icc,	%g6,	%i1
	fpsub16	%f16,	%f0,	%f26
	fmul8x16al	%f16,	%f13,	%f16
	fpackfix	%f22,	%f2
	edge32ln	%i3,	%o2,	%o7
	udivcc	%g3,	0x0C44,	%g1
	orcc	%g2,	0x05B3,	%i4
	fsrc1	%f30,	%f24
	array16	%i7,	%l5,	%l1
	sdivx	%i0,	0x059F,	%l6
	sub	%i2,	0x0029,	%o6
	andn	%o3,	0x1409,	%g7
	sdivx	%l3,	0x120F,	%g4
	lduh	[%l7 + 0x1C],	%o4
	fmovscs	%icc,	%f28,	%f16
	orcc	%o1,	0x1A9E,	%l2
	sth	%l4,	[%l7 + 0x52]
	fmovdneg	%icc,	%f3,	%f17
	fpadd16s	%f19,	%f5,	%f23
	fmovsne	%icc,	%f2,	%f8
	umulcc	%i6,	0x179D,	%o0
	fcmpd	%fcc2,	%f2,	%f4
	fzero	%f10
	udiv	%o5,	0x11A5,	%l0
	movrne	%g5,	%g6,	%i1
	sra	%i5,	%o2,	%i3
	movrgz	%o7,	%g3,	%g2
	fsrc1s	%f15,	%f4
	movrne	%i4,	%i7,	%g1
	fors	%f14,	%f3,	%f14
	orn	%l1,	0x14A5,	%l5
	ldub	[%l7 + 0x63],	%i0
	edge8l	%l6,	%o6,	%o3
	array8	%g7,	%l3,	%g4
	std	%f10,	[%l7 + 0x48]
	umulcc	%i2,	%o1,	%o4
	srl	%l4,	0x02,	%i6
	fpsub32	%f20,	%f24,	%f12
	addccc	%l2,	0x1A1C,	%o5
	movneg	%icc,	%o0,	%g5
	or	%l0,	0x1FA2,	%i1
	fpackfix	%f14,	%f21
	movge	%xcc,	%g6,	%o2
	fsrc2	%f28,	%f8
	or	%i3,	%o7,	%i5
	xor	%g2,	%g3,	%i4
	movg	%xcc,	%g1,	%i7
	restore %l5, %i0, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f22,	%f22
	stw	%l6,	[%l7 + 0x60]
	ldsh	[%l7 + 0x50],	%o3
	edge32l	%g7,	%l3,	%g4
	edge8l	%i2,	%o1,	%o6
	movvc	%xcc,	%o4,	%i6
	movne	%xcc,	%l4,	%o5
	edge16	%l2,	%o0,	%l0
	movneg	%icc,	%i1,	%g5
	st	%f10,	[%l7 + 0x2C]
	orn	%g6,	%o2,	%o7
	andcc	%i5,	%i3,	%g2
	movrlz	%g3,	%g1,	%i4
	xorcc	%l5,	%i0,	%l1
	fmovsvc	%xcc,	%f26,	%f30
	fmovdneg	%icc,	%f0,	%f25
	lduh	[%l7 + 0x70],	%i7
	andcc	%o3,	0x1E08,	%g7
	sth	%l6,	[%l7 + 0x32]
	movne	%icc,	%l3,	%g4
	or	%o1,	0x1100,	%i2
	movvc	%xcc,	%o6,	%o4
	movg	%icc,	%i6,	%o5
	edge16	%l2,	%o0,	%l4
	fxnors	%f14,	%f18,	%f21
	fmovdcc	%icc,	%f1,	%f14
	mulx	%i1,	0x01AF,	%g5
	movge	%icc,	%g6,	%l0
	sdivx	%o7,	0x0998,	%i5
	fcmpne32	%f20,	%f30,	%i3
	udivcc	%g2,	0x09AE,	%g3
	sra	%g1,	%i4,	%l5
	ldd	[%l7 + 0x48],	%f28
	umul	%o2,	0x0DF7,	%l1
	movrgz	%i0,	%o3,	%g7
	fnot2s	%f14,	%f31
	popc	0x01B9,	%i7
	udivcc	%l6,	0x1DB8,	%l3
	fmul8sux16	%f2,	%f12,	%f10
	fpadd32s	%f26,	%f10,	%f31
	srl	%o1,	%i2,	%o6
	edge16	%g4,	%o4,	%i6
	srl	%l2,	0x14,	%o5
	add	%o0,	0x0DE4,	%l4
	std	%f8,	[%l7 + 0x78]
	fsrc1s	%f1,	%f13
	move	%xcc,	%g5,	%i1
	sdiv	%l0,	0x1D31,	%o7
	xor	%g6,	%i5,	%i3
	fmovdgu	%xcc,	%f16,	%f17
	ldsh	[%l7 + 0x48],	%g2
	sll	%g1,	0x1E,	%i4
	bshuffle	%f20,	%f10,	%f22
	nop
	set	0x3A, %o2
	lduh	[%l7 + %o2],	%g3
	srlx	%l5,	0x07,	%o2
	edge32ln	%l1,	%o3,	%g7
	movrne	%i0,	0x16E,	%i7
	movrlz	%l3,	0x13A,	%o1
	andn	%l6,	0x051B,	%o6
	udivcc	%g4,	0x0885,	%i2
	fcmpne32	%f28,	%f26,	%o4
	movrlz	%i6,	0x15C,	%l2
	mulx	%o0,	%l4,	%g5
	popc	0x09A7,	%o5
	sethi	0x0F63,	%i1
	movvs	%icc,	%l0,	%g6
	fpmerge	%f22,	%f18,	%f10
	sethi	0x0456,	%i5
	fmovs	%f14,	%f21
	add	%i3,	%o7,	%g1
	alignaddr	%g2,	%g3,	%i4
	fxor	%f28,	%f24,	%f2
	fmovdg	%xcc,	%f21,	%f7
	fcmpgt32	%f6,	%f28,	%l5
	xorcc	%o2,	%l1,	%o3
	st	%f28,	[%l7 + 0x24]
	fone	%f18
	stb	%i0,	[%l7 + 0x5C]
	orcc	%i7,	0x1D51,	%l3
	sdivx	%g7,	0x142E,	%l6
	siam	0x2
	alignaddrl	%o6,	%o1,	%i2
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	array8	%l2,	%o4,	%o0
	umul	%g5,	%o5,	%l4
	fxnors	%f18,	%f18,	%f10
	smulcc	%l0,	0x1E53,	%i1
	fmovrde	%g6,	%f0,	%f26
	fmovrslez	%i3,	%f14,	%f17
	movrgez	%o7,	%g1,	%i5
	popc	0x0068,	%g3
	movle	%xcc,	%i4,	%g2
	edge8l	%o2,	%l1,	%o3
	fmuld8ulx16	%f25,	%f28,	%f0
	subc	%i0,	%i7,	%l5
	stb	%g7,	[%l7 + 0x65]
	fmovsneg	%icc,	%f0,	%f20
	fmovsg	%icc,	%f22,	%f13
	udiv	%l3,	0x195A,	%o6
	movrlz	%o1,	0x0F4,	%l6
	edge16ln	%i2,	%g4,	%i6
	smulcc	%o4,	0x14EC,	%o0
	movrlz	%g5,	%l2,	%l4
	addccc	%o5,	0x188B,	%i1
	ldd	[%l7 + 0x50],	%f30
	andn	%l0,	%g6,	%i3
	fxor	%f28,	%f2,	%f12
	sra	%g1,	0x12,	%o7
	sub	%g3,	%i4,	%i5
	fmovdn	%icc,	%f20,	%f11
	movvs	%xcc,	%g2,	%l1
	ldsh	[%l7 + 0x2C],	%o3
	srlx	%i0,	%o2,	%i7
	stx	%g7,	[%l7 + 0x38]
	movvc	%xcc,	%l3,	%l5
	udivcc	%o1,	0x0B9F,	%l6
	fmovdleu	%icc,	%f20,	%f15
	edge16ln	%o6,	%i2,	%i6
	fcmpeq32	%f22,	%f24,	%g4
	sth	%o0,	[%l7 + 0x6A]
	fsrc1s	%f14,	%f26
	sll	%g5,	0x17,	%l2
	movre	%o4,	0x1CC,	%o5
	xorcc	%l4,	%i1,	%l0
	fmul8ulx16	%f12,	%f14,	%f30
	sir	0x1797
	movre	%g6,	%i3,	%o7
	subc	%g1,	0x0CAA,	%i4
	movpos	%icc,	%i5,	%g3
	xnorcc	%g2,	%o3,	%l1
	xnor	%i0,	0x1A59,	%i7
	movrgez	%o2,	0x2DA,	%l3
	fmovrdlz	%l5,	%f26,	%f6
	ldsw	[%l7 + 0x74],	%o1
	movneg	%icc,	%l6,	%g7
	smul	%i2,	%o6,	%i6
	edge16n	%g4,	%g5,	%l2
	fmul8x16al	%f13,	%f23,	%f24
	sra	%o0,	%o4,	%o5
	smul	%i1,	0x03AC,	%l0
	andn	%l4,	%g6,	%i3
	ldd	[%l7 + 0x38],	%g0
	andncc	%i4,	%i5,	%g3
	fmovsvs	%icc,	%f23,	%f1
	alignaddr	%g2,	%o7,	%l1
	mova	%icc,	%i0,	%o3
	movne	%icc,	%o2,	%i7
	movgu	%icc,	%l3,	%o1
	mova	%xcc,	%l6,	%g7
	stw	%i2,	[%l7 + 0x48]
	pdist	%f20,	%f16,	%f4
	nop
	set	0x34, %g7
	stw	%o6,	[%l7 + %g7]
	edge32	%l5,	%g4,	%i6
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%g5
	xor	%l2,	0x029A,	%o4
	and	%o0,	0x1973,	%i1
	edge16n	%o5,	%l0,	%l4
	mova	%xcc,	%g6,	%g1
	movrgez	%i3,	0x2AE,	%i5
	stx	%g3,	[%l7 + 0x78]
	ldsh	[%l7 + 0x08],	%g2
	fmovsne	%icc,	%f11,	%f10
	xnorcc	%i4,	0x0C3C,	%l1
	movre	%i0,	0x0A0,	%o3
	movrgz	%o2,	0x3D9,	%i7
	alignaddrl	%o7,	%o1,	%l6
	movvc	%icc,	%l3,	%g7
	movre	%i2,	%o6,	%g4
	udivx	%l5,	0x060F,	%i6
	fmovd	%f28,	%f2
	restore %l2, %o4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32ln	%o0,	%i1,	%l0
	save %l4, %o5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g6,	%i3,	%i5
	movcs	%icc,	%g2,	%i4
	ldd	[%l7 + 0x78],	%f0
	faligndata	%f4,	%f26,	%f24
	fornot1s	%f1,	%f28,	%f26
	addc	%l1,	%g3,	%o3
	subc	%i0,	0x00A9,	%i7
	srlx	%o7,	%o1,	%l6
	stb	%o2,	[%l7 + 0x7E]
	edge16	%l3,	%i2,	%o6
	fmovrdlez	%g7,	%f8,	%f14
	andncc	%g4,	%i6,	%l5
	alignaddr	%o4,	%l2,	%g5
	edge32	%i1,	%l0,	%o0
	lduw	[%l7 + 0x68],	%o5
	sll	%l4,	0x19,	%g1
	smul	%g6,	0x0712,	%i3
	movrgez	%g2,	%i5,	%l1
	fxnors	%f16,	%f26,	%f4
	movleu	%icc,	%i4,	%g3
	xnor	%o3,	%i0,	%o7
	fornot1s	%f25,	%f5,	%f15
	fmovse	%icc,	%f21,	%f27
	fnand	%f26,	%f30,	%f30
	array8	%o1,	%l6,	%o2
	orn	%i7,	0x10EE,	%l3
	movl	%xcc,	%o6,	%g7
	fxnors	%f24,	%f1,	%f18
	and	%g4,	0x19AE,	%i6
	fmovsvs	%xcc,	%f4,	%f11
	udiv	%i2,	0x0FA7,	%l5
	edge8ln	%o4,	%l2,	%g5
	fornot1	%f2,	%f2,	%f0
	fexpand	%f16,	%f24
	fnors	%f17,	%f3,	%f15
	edge32	%i1,	%l0,	%o5
	subccc	%o0,	%g1,	%g6
	fxors	%f6,	%f2,	%f9
	subc	%i3,	%g2,	%l4
	edge16	%l1,	%i4,	%i5
	subcc	%g3,	0x1864,	%o3
	nop
	set	0x70, %o4
	std	%f24,	[%l7 + %o4]
	std	%f8,	[%l7 + 0x68]
	alignaddrl	%i0,	%o7,	%l6
	udivx	%o2,	0x13DC,	%o1
	andncc	%l3,	%o6,	%i7
	udivx	%g7,	0x03C1,	%g4
	fnors	%f8,	%f17,	%f20
	mulx	%i2,	0x01CE,	%i6
	save %l5, %l2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sir	0x001C
	move	%xcc,	%i1,	%o4
	fmovrdlez	%o5,	%f16,	%f22
	popc	0x14E4,	%o0
	fmovd	%f14,	%f14
	movneg	%icc,	%g1,	%l0
	movpos	%xcc,	%g6,	%g2
	edge16	%i3,	%l1,	%l4
	xnor	%i4,	%i5,	%g3
	movcc	%xcc,	%o3,	%i0
	movn	%icc,	%o7,	%o2
	movgu	%xcc,	%l6,	%o1
	movneg	%xcc,	%o6,	%i7
	movcs	%xcc,	%g7,	%l3
	fnands	%f30,	%f0,	%f6
	srl	%i2,	0x15,	%g4
	addc	%i6,	0x1117,	%l2
	movleu	%xcc,	%g5,	%l5
	andcc	%o4,	%i1,	%o5
	fmovrse	%g1,	%f6,	%f16
	fandnot2	%f6,	%f14,	%f20
	nop
	set	0x68, %l5
	sth	%o0,	[%l7 + %l5]
	subc	%g6,	%g2,	%i3
	movl	%icc,	%l0,	%l1
	fmovscc	%xcc,	%f22,	%f23
	alignaddr	%l4,	%i5,	%i4
	fcmpgt32	%f22,	%f30,	%o3
	andncc	%i0,	%g3,	%o2
	movcc	%xcc,	%l6,	%o7
	ldd	[%l7 + 0x60],	%f26
	std	%f8,	[%l7 + 0x68]
	fpsub16	%f22,	%f0,	%f18
	fpadd16	%f20,	%f24,	%f26
	nop
	set	0x5C, %l6
	ldsb	[%l7 + %l6],	%o6
	movl	%xcc,	%o1,	%g7
	fmuld8ulx16	%f11,	%f24,	%f24
	alignaddr	%l3,	%i7,	%i2
	movn	%icc,	%i6,	%l2
	fnegd	%f28,	%f4
	umulcc	%g4,	0x1D98,	%l5
	ldsw	[%l7 + 0x3C],	%o4
	alignaddr	%i1,	%o5,	%g5
	edge8l	%o0,	%g1,	%g6
	edge16n	%g2,	%l0,	%i3
	movvc	%icc,	%l4,	%i5
	sll	%l1,	0x05,	%o3
	movn	%icc,	%i0,	%g3
	xorcc	%i4,	0x14E2,	%o2
	ldd	[%l7 + 0x28],	%f2
	stx	%o7,	[%l7 + 0x70]
	edge32l	%l6,	%o1,	%g7
	fmovs	%f25,	%f2
	orncc	%l3,	%o6,	%i2
	move	%xcc,	%i6,	%i7
	ld	[%l7 + 0x78],	%f7
	edge32l	%l2,	%g4,	%l5
	ld	[%l7 + 0x60],	%f12
	sir	0x07C9
	array16	%o4,	%o5,	%i1
	fnors	%f27,	%f11,	%f29
	ldd	[%l7 + 0x60],	%f26
	subc	%g5,	%o0,	%g6
	fcmple32	%f6,	%f18,	%g1
	sll	%l0,	0x09,	%g2
	movleu	%xcc,	%l4,	%i3
	fmovdgu	%xcc,	%f23,	%f4
	movrne	%l1,	%i5,	%i0
	sdivcc	%g3,	0x0635,	%o3
	sll	%o2,	%o7,	%l6
	subccc	%o1,	%g7,	%l3
	addccc	%i4,	0x1F0D,	%o6
	fsrc1s	%f24,	%f6
	fpadd16	%f4,	%f2,	%f16
	stx	%i6,	[%l7 + 0x08]
	ldsh	[%l7 + 0x0C],	%i7
	fpackfix	%f10,	%f13
	edge16ln	%i2,	%l2,	%l5
	edge32l	%o4,	%o5,	%g4
	edge32ln	%g5,	%o0,	%g6
	fmovsvc	%xcc,	%f15,	%f12
	smul	%g1,	0x114C,	%i1
	mulscc	%l0,	0x0456,	%g2
	subc	%i3,	0x1620,	%l4
	fmovdl	%icc,	%f4,	%f11
	addccc	%l1,	0x120D,	%i0
	fmovrslz	%i5,	%f16,	%f26
	addc	%o3,	0x019C,	%g3
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	sir	0x0869
	popc	%o1,	%g7
	orn	%l3,	0x00CB,	%o6
	lduh	[%l7 + 0x0E],	%i6
	sllx	%i7,	%i4,	%i2
	movg	%icc,	%l2,	%l5
	fnot1s	%f3,	%f4
	sth	%o5,	[%l7 + 0x4C]
	edge16l	%o4,	%g4,	%g5
	xnorcc	%g6,	0x0093,	%o0
	restore %g1, 0x0E7B, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g2,	%i1,	%i3
	andn	%l4,	0x19AC,	%i0
	fones	%f10
	fxors	%f19,	%f24,	%f30
	orcc	%l1,	%i5,	%o3
	sll	%o7,	0x00,	%l6
	sdiv	%o2,	0x1CB4,	%g3
	umul	%o1,	%g7,	%o6
	subcc	%i6,	%l3,	%i4
	edge16	%i7,	%i2,	%l5
	sdivcc	%l2,	0x1235,	%o4
	udivx	%o5,	0x10E3,	%g4
	alignaddrl	%g6,	%o0,	%g1
	ldx	[%l7 + 0x58],	%l0
	stx	%g2,	[%l7 + 0x50]
	save %g5, 0x0508, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%l4,	%i1
	movneg	%icc,	%i0,	%i5
	fpackfix	%f0,	%f21
	srax	%o3,	%o7,	%l6
	fmovdn	%xcc,	%f8,	%f10
	edge32	%l1,	%g3,	%o2
	movrlz	%g7,	%o1,	%i6
	fmuld8ulx16	%f25,	%f24,	%f20
	fmovsne	%icc,	%f20,	%f25
	orncc	%o6,	0x0614,	%i4
	edge32	%l3,	%i7,	%i2
	save %l5, %o4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g4,	%g6,	%l2
	ld	[%l7 + 0x30],	%f20
	ldx	[%l7 + 0x10],	%g1
	movrlez	%o0,	%l0,	%g2
	movrgz	%i3,	0x270,	%g5
	sra	%l4,	%i1,	%i0
	movcc	%icc,	%o3,	%o7
	subc	%i5,	0x0CE1,	%l1
	fmovsvs	%xcc,	%f27,	%f24
	movcc	%xcc,	%g3,	%l6
	movpos	%icc,	%g7,	%o1
	move	%xcc,	%o2,	%i6
	movrlz	%o6,	0x2D3,	%i4
	sir	0x07E5
	fmovsvc	%icc,	%f8,	%f18
	fmovdleu	%icc,	%f5,	%f18
	movrlez	%l3,	%i7,	%l5
	alignaddr	%i2,	%o5,	%o4
	movrne	%g6,	%g4,	%l2
	add	%o0,	%l0,	%g1
	subc	%g2,	0x1F00,	%i3
	ldd	[%l7 + 0x28],	%g4
	fmovsvs	%xcc,	%f15,	%f16
	sra	%l4,	%i1,	%o3
	movn	%xcc,	%o7,	%i0
	fone	%f16
	movneg	%icc,	%i5,	%g3
	fmovrslez	%l6,	%f24,	%f20
	edge16ln	%l1,	%g7,	%o2
	xorcc	%i6,	0x15A5,	%o1
	udivx	%o6,	0x1512,	%i4
	movre	%l3,	%l5,	%i7
	srl	%i2,	0x09,	%o5
	alignaddr	%g6,	%o4,	%g4
	ld	[%l7 + 0x60],	%f3
	fnor	%f20,	%f22,	%f0
	array8	%o0,	%l2,	%g1
	fmovd	%f16,	%f8
	edge32	%g2,	%i3,	%l0
	umul	%l4,	%i1,	%g5
	addccc	%o7,	%i0,	%o3
	movn	%xcc,	%g3,	%l6
	sdivcc	%l1,	0x01BC,	%i5
	fmovdleu	%icc,	%f16,	%f4
	movrgz	%g7,	0x360,	%i6
	fnors	%f30,	%f10,	%f28
	edge32n	%o1,	%o2,	%i4
	movn	%xcc,	%l3,	%l5
	alignaddrl	%i7,	%o6,	%i2
	or	%o5,	%o4,	%g6
	ldsw	[%l7 + 0x2C],	%g4
	movpos	%xcc,	%l2,	%g1
	alignaddr	%g2,	%o0,	%l0
	for	%f26,	%f12,	%f4
	movrgez	%i3,	%i1,	%l4
	sdiv	%g5,	0x1B50,	%i0
	movrne	%o7,	%o3,	%g3
	fnegs	%f3,	%f29
	movrne	%l1,	0x34B,	%l6
	sir	0x1D9E
	srl	%i5,	0x0B,	%i6
	array32	%g7,	%o2,	%i4
	subc	%l3,	0x1516,	%l5
	nop
	set	0x6E, %i6
	ldsh	[%l7 + %i6],	%i7
	xnorcc	%o1,	0x1146,	%i2
	movpos	%xcc,	%o5,	%o4
	orcc	%o6,	%g4,	%g6
	movleu	%icc,	%g1,	%l2
	movleu	%icc,	%o0,	%l0
	sra	%i3,	0x05,	%g2
	subc	%i1,	0x0C63,	%g5
	fone	%f22
	fandnot2	%f16,	%f28,	%f30
	movn	%xcc,	%l4,	%o7
	smulcc	%o3,	0x1FB1,	%i0
	lduw	[%l7 + 0x48],	%g3
	ldx	[%l7 + 0x70],	%l6
	umul	%i5,	%l1,	%i6
	sll	%g7,	%o2,	%i4
	fones	%f17
	srlx	%l3,	%l5,	%i7
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	or	%i2,	0x0643,	%o6
	addccc	%o4,	0x0A5A,	%g6
	addc	%g1,	%l2,	%g4
	nop
	set	0x28, %g3
	ldd	[%l7 + %g3],	%f0
	sub	%o0,	%l0,	%g2
	fmovsvs	%xcc,	%f30,	%f25
	stx	%i1,	[%l7 + 0x08]
	add	%i3,	0x1630,	%l4
	edge16ln	%g5,	%o3,	%i0
	stx	%o7,	[%l7 + 0x58]
	movvc	%icc,	%l6,	%g3
	fpsub32s	%f8,	%f11,	%f16
	sra	%i5,	%i6,	%l1
	edge16n	%o2,	%i4,	%g7
	movpos	%icc,	%l3,	%l5
	movleu	%icc,	%o1,	%i7
	mulx	%o5,	%o6,	%i2
	edge8	%g6,	%g1,	%o4
	fones	%f27
	fmul8sux16	%f28,	%f12,	%f18
	fmul8ulx16	%f30,	%f24,	%f10
	fcmpgt16	%f6,	%f4,	%l2
	array32	%g4,	%o0,	%l0
	st	%f9,	[%l7 + 0x20]
	stx	%g2,	[%l7 + 0x48]
	movneg	%icc,	%i1,	%i3
	movrne	%l4,	0x01D,	%g5
	array8	%o3,	%i0,	%o7
	orcc	%g3,	0x1AB7,	%l6
	fmovdleu	%xcc,	%f5,	%f9
	fmovrdgz	%i5,	%f20,	%f12
	restore %l1, 0x1C16, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i4,	0x12A1,	%i6
	edge32l	%l3,	%l5,	%g7
	move	%xcc,	%o1,	%i7
	add	%o6,	%o5,	%i2
	ldx	[%l7 + 0x30],	%g6
	movrgz	%g1,	0x069,	%o4
	movn	%icc,	%l2,	%g4
	xor	%l0,	%o0,	%g2
	bshuffle	%f28,	%f18,	%f4
	edge16	%i1,	%l4,	%g5
	fmovdne	%xcc,	%f14,	%f30
	fmovspos	%icc,	%f6,	%f2
	orncc	%i3,	%i0,	%o3
	popc	%o7,	%l6
	addccc	%i5,	0x0D5E,	%g3
	ldub	[%l7 + 0x6D],	%o2
	movrgz	%l1,	%i4,	%l3
	fsrc2s	%f28,	%f31
	alignaddrl	%l5,	%g7,	%i6
	st	%f8,	[%l7 + 0x64]
	sub	%i7,	0x0F2A,	%o6
	movgu	%xcc,	%o1,	%o5
	fpsub32s	%f6,	%f24,	%f2
	array32	%i2,	%g6,	%o4
	lduh	[%l7 + 0x22],	%g1
	movpos	%icc,	%g4,	%l2
	fpadd32	%f14,	%f4,	%f8
	fmul8x16	%f27,	%f8,	%f4
	sub	%l0,	%g2,	%i1
	sub	%l4,	%o0,	%g5
	fmovsneg	%xcc,	%f24,	%f12
	save %i0, %i3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o7,	%l6,	%g3
	sir	0x1C9C
	sdivcc	%i5,	0x149E,	%l1
	pdist	%f18,	%f4,	%f6
	fmovdgu	%xcc,	%f4,	%f14
	stx	%i4,	[%l7 + 0x10]
	mova	%xcc,	%o2,	%l3
	edge8ln	%l5,	%i6,	%g7
	movrgez	%i7,	0x284,	%o1
	edge8	%o5,	%i2,	%g6
	std	%f28,	[%l7 + 0x68]
	fnot2s	%f18,	%f7
	fmul8sux16	%f24,	%f22,	%f24
	mova	%xcc,	%o4,	%o6
	lduw	[%l7 + 0x7C],	%g1
	or	%g4,	%l2,	%l0
	fmovsl	%xcc,	%f18,	%f18
	sll	%i1,	0x05,	%l4
	lduh	[%l7 + 0x50],	%o0
	movge	%xcc,	%g2,	%i0
	fpadd32	%f14,	%f14,	%f14
	movne	%icc,	%i3,	%g5
	ld	[%l7 + 0x48],	%f15
	stb	%o7,	[%l7 + 0x19]
	st	%f31,	[%l7 + 0x2C]
	and	%l6,	0x1408,	%g3
	fpsub32s	%f6,	%f20,	%f7
	lduh	[%l7 + 0x0C],	%i5
	srl	%l1,	%i4,	%o3
	st	%f10,	[%l7 + 0x50]
	addc	%o2,	0x004D,	%l5
	lduw	[%l7 + 0x6C],	%l3
	fnot2s	%f27,	%f22
	orn	%g7,	0x0F83,	%i7
	movre	%i6,	%o1,	%i2
	fmovdvs	%icc,	%f28,	%f27
	fzero	%f30
	orncc	%g6,	%o4,	%o6
	ldub	[%l7 + 0x11],	%o5
	movleu	%xcc,	%g1,	%g4
	sdivcc	%l2,	0x1C57,	%i1
	sll	%l4,	%o0,	%g2
	fcmpne16	%f18,	%f30,	%l0
	ldsh	[%l7 + 0x1E],	%i0
	fandnot2	%f22,	%f8,	%f8
	sth	%i3,	[%l7 + 0x30]
	array16	%g5,	%l6,	%o7
	movvc	%xcc,	%g3,	%l1
	ldd	[%l7 + 0x50],	%i4
	sub	%i5,	0x0467,	%o3
	movle	%xcc,	%l5,	%o2
	for	%f30,	%f6,	%f12
	movle	%icc,	%l3,	%i7
	udivx	%i6,	0x0F94,	%o1
	sllx	%i2,	0x0D,	%g6
	sth	%o4,	[%l7 + 0x7C]
	addccc	%o6,	0x1DDA,	%o5
	fornot2	%f0,	%f0,	%f30
	edge16	%g1,	%g4,	%l2
	movl	%icc,	%g7,	%l4
	movg	%xcc,	%i1,	%g2
	ldd	[%l7 + 0x50],	%f10
	fmovsvc	%xcc,	%f6,	%f29
	umulcc	%o0,	0x1641,	%i0
	fmovde	%icc,	%f11,	%f8
	array8	%i3,	%l0,	%g5
	edge8l	%l6,	%g3,	%l1
	movn	%icc,	%i4,	%i5
	xor	%o3,	%o7,	%l5
	fnand	%f4,	%f30,	%f4
	fzeros	%f5
	fmovdpos	%xcc,	%f27,	%f18
	movrgez	%l3,	%o2,	%i7
	fmovs	%f14,	%f19
	movvc	%icc,	%o1,	%i6
	movcs	%icc,	%i2,	%o4
	xnor	%g6,	0x15A7,	%o5
	sdivx	%g1,	0x0D6F,	%o6
	fmovsg	%xcc,	%f5,	%f7
	sra	%l2,	%g4,	%l4
	sdivcc	%g7,	0x0AA3,	%g2
	umulcc	%i1,	%o0,	%i3
	ldsb	[%l7 + 0x46],	%l0
	ldsb	[%l7 + 0x48],	%g5
	movvs	%icc,	%l6,	%g3
	fmovsne	%xcc,	%f20,	%f25
	fands	%f20,	%f7,	%f9
	fmovrse	%l1,	%f30,	%f18
	orn	%i4,	%i5,	%o3
	fmovsg	%xcc,	%f20,	%f1
	fandnot1	%f8,	%f22,	%f22
	edge32l	%i0,	%l5,	%o7
	movleu	%xcc,	%l3,	%o2
	fpsub32	%f20,	%f22,	%f20
	udiv	%o1,	0x1DA0,	%i7
	edge8	%i2,	%i6,	%o4
	array16	%g6,	%o5,	%g1
	addc	%l2,	%g4,	%l4
	ldx	[%l7 + 0x60],	%o6
	fornot2s	%f4,	%f16,	%f10
	movrgz	%g7,	%g2,	%i1
	edge8l	%o0,	%l0,	%i3
	movle	%xcc,	%g5,	%l6
	andncc	%l1,	%g3,	%i4
	movvs	%icc,	%o3,	%i5
	andncc	%i0,	%l5,	%o7
	st	%f8,	[%l7 + 0x50]
	addcc	%l3,	0x08B4,	%o2
	ldsw	[%l7 + 0x14],	%i7
	sllx	%i2,	%i6,	%o1
	fmovsne	%icc,	%f24,	%f25
	edge8	%g6,	%o4,	%g1
	fmul8x16au	%f15,	%f11,	%f20
	andcc	%l2,	%o5,	%l4
	edge8	%o6,	%g7,	%g2
	edge32ln	%i1,	%o0,	%l0
	fmovrdne	%i3,	%f6,	%f12
	movl	%icc,	%g4,	%l6
	fmovsleu	%icc,	%f23,	%f26
	fmovrdgz	%l1,	%f6,	%f14
	edge32	%g3,	%i4,	%g5
	mulscc	%o3,	0x0576,	%i5
	fmovrde	%l5,	%f26,	%f26
	sdivx	%i0,	0x12EF,	%o7
	fpadd32s	%f18,	%f4,	%f29
	andcc	%l3,	%i7,	%i2
	fnors	%f5,	%f20,	%f30
	subcc	%o2,	%i6,	%o1
	popc	0x1C62,	%o4
	fornot1	%f24,	%f26,	%f12
	orncc	%g1,	0x0F29,	%l2
	movrlez	%o5,	0x16D,	%l4
	fnor	%f16,	%f12,	%f8
	udivcc	%g6,	0x1E47,	%g7
	sethi	0x0EA3,	%o6
	movrne	%g2,	%o0,	%i1
	pdist	%f10,	%f24,	%f8
	fpmerge	%f19,	%f21,	%f16
	fcmpne16	%f12,	%f4,	%l0
	fmovdl	%xcc,	%f13,	%f10
	subcc	%g4,	0x0241,	%l6
	lduh	[%l7 + 0x50],	%i3
	nop
	set	0x64, %l4
	ldsw	[%l7 + %l4],	%l1
	movn	%xcc,	%i4,	%g3
	fmul8ulx16	%f12,	%f24,	%f12
	and	%g5,	0x162B,	%i5
	fone	%f24
	edge32n	%o3,	%l5,	%i0
	subccc	%o7,	0x09D0,	%l3
	andcc	%i2,	%o2,	%i7
	stx	%i6,	[%l7 + 0x60]
	edge32n	%o4,	%g1,	%o1
	andncc	%o5,	%l2,	%g6
	stx	%l4,	[%l7 + 0x38]
	fones	%f20
	xor	%o6,	%g2,	%g7
	ldsw	[%l7 + 0x28],	%o0
	fcmped	%fcc1,	%f2,	%f0
	array32	%l0,	%i1,	%g4
	sub	%i3,	%l1,	%l6
	array16	%g3,	%g5,	%i5
	movgu	%xcc,	%o3,	%l5
	fmovsvc	%xcc,	%f3,	%f3
	nop
	set	0x0C, %l3
	lduw	[%l7 + %l3],	%i4
	array16	%o7,	%l3,	%i2
	fmovrdlz	%i0,	%f28,	%f20
	ldd	[%l7 + 0x08],	%i6
	movrgz	%i6,	0x38B,	%o4
	movne	%xcc,	%o2,	%g1
	andn	%o5,	%l2,	%o1
	umulcc	%l4,	%g6,	%g2
	fmovspos	%xcc,	%f19,	%f30
	ldsw	[%l7 + 0x44],	%o6
	fxor	%f12,	%f30,	%f4
	move	%icc,	%g7,	%l0
	save %o0, 0x0E8A, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i1,	%l1
	stw	%l6,	[%l7 + 0x48]
	stx	%g3,	[%l7 + 0x48]
	fpadd16s	%f10,	%f28,	%f13
	mulx	%i3,	0x0DCF,	%g5
	orn	%i5,	%o3,	%i4
	fmovdgu	%icc,	%f28,	%f7
	movge	%xcc,	%l5,	%l3
	save %o7, 0x1126, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i2,	%i7,	%o4
	orcc	%i6,	%o2,	%g1
	fcmpgt16	%f26,	%f10,	%o5
	movre	%l2,	0x024,	%o1
	xor	%l4,	0x11B7,	%g2
	edge32n	%g6,	%o6,	%g7
	udiv	%l0,	0x1497,	%g4
	movvs	%xcc,	%i1,	%l1
	fnot2s	%f17,	%f7
	sub	%l6,	%o0,	%i3
	fsrc2	%f10,	%f30
	st	%f18,	[%l7 + 0x78]
	andcc	%g5,	%g3,	%i5
	edge32l	%i4,	%o3,	%l3
	sllx	%o7,	%i0,	%i2
	movrne	%i7,	0x03C,	%l5
	ldsh	[%l7 + 0x0A],	%o4
	alignaddrl	%i6,	%g1,	%o5
	save %l2, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x5C],	%g2
	edge16l	%o2,	%o6,	%g7
	sll	%l0,	%g4,	%g6
	st	%f6,	[%l7 + 0x60]
	ldx	[%l7 + 0x20],	%i1
	fmovrsne	%l6,	%f9,	%f11
	addc	%o0,	0x00CD,	%l1
	movcc	%xcc,	%g5,	%g3
	fands	%f7,	%f28,	%f5
	movne	%xcc,	%i5,	%i3
	move	%icc,	%i4,	%l3
	stw	%o3,	[%l7 + 0x74]
	ldx	[%l7 + 0x78],	%i0
	edge8	%o7,	%i2,	%i7
	movcs	%xcc,	%o4,	%l5
	fmovrdgz	%i6,	%f4,	%f22
	fpmerge	%f4,	%f8,	%f4
	xnorcc	%g1,	%o5,	%l2
	movgu	%icc,	%o1,	%l4
	subccc	%o2,	%g2,	%g7
	ldd	[%l7 + 0x40],	%f10
	array16	%l0,	%o6,	%g4
	fnands	%f23,	%f5,	%f31
	lduw	[%l7 + 0x70],	%g6
	mova	%xcc,	%l6,	%o0
	fxnors	%f10,	%f4,	%f4
	lduw	[%l7 + 0x24],	%i1
	movn	%xcc,	%g5,	%l1
	st	%f25,	[%l7 + 0x4C]
	edge8n	%g3,	%i5,	%i3
	addccc	%i4,	0x15C3,	%l3
	fmovsa	%icc,	%f1,	%f23
	fxnors	%f1,	%f22,	%f20
	alignaddrl	%o3,	%o7,	%i2
	sdivx	%i7,	0x099F,	%o4
	fmovrslz	%l5,	%f26,	%f15
	andcc	%i6,	%i0,	%o5
	fcmple16	%f22,	%f8,	%g1
	stx	%l2,	[%l7 + 0x20]
	lduh	[%l7 + 0x28],	%l4
	fornot2	%f10,	%f6,	%f22
	sth	%o1,	[%l7 + 0x18]
	fmovsneg	%xcc,	%f8,	%f2
	movrgz	%o2,	%g2,	%l0
	stb	%g7,	[%l7 + 0x6A]
	udivx	%g4,	0x034E,	%o6
	popc	0x0AC2,	%l6
	fmovdne	%xcc,	%f3,	%f26
	srax	%g6,	0x1B,	%o0
	fmovdcc	%icc,	%f7,	%f29
	movrlez	%i1,	%l1,	%g3
	srl	%i5,	0x10,	%g5
	edge8l	%i4,	%i3,	%l3
	xnor	%o3,	0x0765,	%o7
	edge8ln	%i7,	%i2,	%l5
	array8	%i6,	%o4,	%o5
	edge16ln	%g1,	%i0,	%l2
	array32	%l4,	%o1,	%o2
	array32	%g2,	%l0,	%g4
	xnor	%g7,	0x19BA,	%l6
	addc	%o6,	%g6,	%o0
	edge8	%l1,	%g3,	%i1
	move	%xcc,	%g5,	%i5
	save %i4, %l3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%o7,	%o3,	%i7
	andncc	%i2,	%i6,	%o4
	sth	%o5,	[%l7 + 0x58]
	edge8ln	%l5,	%g1,	%l2
	fmovsgu	%icc,	%f3,	%f8
	st	%f0,	[%l7 + 0x3C]
	sdivcc	%i0,	0x1F59,	%l4
	edge8l	%o2,	%o1,	%l0
	add	%g4,	%g2,	%l6
	movvs	%icc,	%o6,	%g6
	fmovdne	%xcc,	%f27,	%f3
	orn	%g7,	0x0032,	%o0
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	fornot1	%f16,	%f4,	%f0
	sub	%g3,	%g5,	%i5
	sth	%l3,	[%l7 + 0x1A]
	fpadd16	%f30,	%f0,	%f4
	movvc	%xcc,	%i4,	%o7
	fpsub16	%f8,	%f16,	%f12
	lduh	[%l7 + 0x7E],	%i3
	nop
	set	0x3C, %l1
	ldsw	[%l7 + %l1],	%o3
	movrgez	%i2,	0x260,	%i6
	edge16l	%o4,	%o5,	%l5
	fpack16	%f28,	%f30
	ldsh	[%l7 + 0x28],	%g1
	smulcc	%i7,	0x001D,	%i0
	ldsh	[%l7 + 0x26],	%l4
	addcc	%l2,	%o2,	%l0
	edge32n	%g4,	%o1,	%g2
	xnor	%o6,	0x0994,	%l6
	fpackfix	%f16,	%f15
	edge32ln	%g6,	%o0,	%g7
	orncc	%l1,	%i1,	%g3
	movvs	%xcc,	%g5,	%l3
	udivx	%i4,	0x1974,	%i5
	smulcc	%i3,	0x0D1F,	%o3
	sdivcc	%i2,	0x03C8,	%o7
	movneg	%icc,	%o4,	%o5
	edge8	%i6,	%g1,	%i7
	sdivx	%i0,	0x108F,	%l5
	stb	%l2,	[%l7 + 0x22]
	fmovse	%xcc,	%f22,	%f20
	movvc	%xcc,	%o2,	%l0
	edge32	%g4,	%l4,	%g2
	orncc	%o6,	%o1,	%l6
	popc	%o0,	%g7
	fnot1s	%f6,	%f31
	fmovsl	%icc,	%f22,	%f16
	sir	0x1973
	popc	%g6,	%i1
	addccc	%l1,	0x0659,	%g3
	sdivx	%g5,	0x15F8,	%l3
	fcmpne32	%f30,	%f26,	%i5
	ldub	[%l7 + 0x19],	%i4
	addc	%i3,	%i2,	%o3
	sub	%o7,	%o4,	%o5
	fcmpd	%fcc3,	%f20,	%f12
	stb	%i6,	[%l7 + 0x5F]
	movge	%xcc,	%i7,	%g1
	addcc	%l5,	%i0,	%l2
	andn	%l0,	%g4,	%o2
	or	%l4,	0x0A44,	%g2
	sllx	%o6,	0x18,	%o1
	orncc	%o0,	0x0330,	%g7
	save %l6, 0x12D2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsl	%icc,	%f7,	%f8
	movne	%icc,	%l1,	%g3
	fmovrde	%i1,	%f6,	%f8
	st	%f14,	[%l7 + 0x68]
	srax	%l3,	%i5,	%g5
	edge16ln	%i3,	%i4,	%o3
	restore %i2, 0x062C, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f0,	%f8
	edge8	%o5,	%i6,	%i7
	movrne	%o7,	0x3FD,	%g1
	movl	%icc,	%i0,	%l2
	movvc	%icc,	%l0,	%l5
	fnot2	%f30,	%f4
	add	%g4,	%o2,	%l4
	fsrc2	%f0,	%f8
	sethi	0x0A63,	%g2
	udivcc	%o1,	0x1C48,	%o6
	alignaddrl	%g7,	%l6,	%g6
	bshuffle	%f12,	%f24,	%f4
	lduh	[%l7 + 0x38],	%o0
	mulscc	%l1,	0x04BD,	%i1
	movrlz	%g3,	%l3,	%g5
	stw	%i5,	[%l7 + 0x78]
	sdivx	%i4,	0x0295,	%i3
	movpos	%icc,	%o3,	%o4
	edge16ln	%i2,	%o5,	%i6
	edge16l	%o7,	%g1,	%i7
	alignaddrl	%l2,	%i0,	%l5
	fmovda	%xcc,	%f22,	%f20
	subcc	%g4,	0x0E89,	%l0
	fmovscc	%xcc,	%f9,	%f0
	sdivcc	%o2,	0x0527,	%l4
	srlx	%o1,	0x1E,	%g2
	edge8	%o6,	%l6,	%g7
	addccc	%g6,	%l1,	%i1
	subcc	%g3,	0x0568,	%l3
	movg	%xcc,	%g5,	%o0
	pdist	%f10,	%f6,	%f22
	movcc	%icc,	%i5,	%i3
	ldd	[%l7 + 0x40],	%f16
	movrgz	%i4,	0x2A3,	%o3
	ldd	[%l7 + 0x78],	%o4
	array8	%o5,	%i6,	%i2
	xnor	%g1,	0x1E1D,	%o7
	fmovsl	%icc,	%f14,	%f20
	fcmple32	%f26,	%f2,	%l2
	srl	%i0,	%i7,	%g4
	smulcc	%l0,	%o2,	%l4
	ld	[%l7 + 0x3C],	%f28
	movpos	%xcc,	%o1,	%l5
	fpsub32	%f26,	%f2,	%f28
	fornot2	%f6,	%f16,	%f28
	popc	0x1D4B,	%o6
	stx	%l6,	[%l7 + 0x50]
	xorcc	%g7,	%g2,	%l1
	and	%i1,	0x0118,	%g6
	or	%g3,	%l3,	%g5
	fandnot1s	%f10,	%f11,	%f29
	movne	%xcc,	%o0,	%i5
	edge16	%i4,	%o3,	%o4
	udivx	%o5,	0x03F3,	%i3
	fcmped	%fcc3,	%f14,	%f16
	addc	%i6,	0x18CA,	%g1
	movge	%xcc,	%i2,	%o7
	edge16n	%i0,	%i7,	%g4
	array16	%l0,	%o2,	%l2
	ldub	[%l7 + 0x49],	%l4
	movrgez	%o1,	0x35B,	%o6
	ldsw	[%l7 + 0x18],	%l6
	edge8n	%l5,	%g2,	%g7
	edge8ln	%i1,	%l1,	%g6
	edge16n	%g3,	%l3,	%g5
	fmovscc	%icc,	%f29,	%f9
	edge16l	%o0,	%i5,	%i4
	sethi	0x0379,	%o4
	xnorcc	%o3,	%i3,	%i6
	umulcc	%o5,	0x0A80,	%i2
	subccc	%o7,	%i0,	%g1
	addccc	%i7,	%l0,	%g4
	srl	%o2,	%l2,	%l4
	movvc	%icc,	%o6,	%o1
	edge16n	%l5,	%g2,	%g7
	sth	%i1,	[%l7 + 0x58]
	fones	%f25
	movrlz	%l1,	0x2DE,	%l6
	sdiv	%g6,	0x1DDD,	%l3
	sethi	0x00DE,	%g3
	subccc	%g5,	0x0FF8,	%i5
	ldd	[%l7 + 0x18],	%f4
	edge8	%i4,	%o0,	%o3
	movrne	%o4,	%i3,	%i6
	mulscc	%o5,	0x15C0,	%i2
	ldub	[%l7 + 0x57],	%i0
	fzeros	%f26
	xor	%g1,	0x13B9,	%i7
	subc	%o7,	0x14FF,	%g4
	edge8n	%o2,	%l0,	%l2
	nop
	set	0x0D, %g4
	ldub	[%l7 + %g4],	%o6
	umulcc	%o1,	0x0622,	%l4
	alignaddr	%l5,	%g2,	%i1
	array8	%g7,	%l1,	%g6
	fmovda	%icc,	%f20,	%f11
	ldd	[%l7 + 0x48],	%l2
	siam	0x6
	stx	%g3,	[%l7 + 0x20]
	srlx	%l6,	0x0D,	%i5
	movrgez	%i4,	0x251,	%g5
	fmovdleu	%icc,	%f15,	%f8
	ldx	[%l7 + 0x10],	%o3
	st	%f8,	[%l7 + 0x60]
	fmovscc	%xcc,	%f14,	%f22
	array8	%o0,	%i3,	%i6
	umulcc	%o5,	%i2,	%i0
	xorcc	%o4,	%g1,	%o7
	subcc	%g4,	0x1CF9,	%o2
	edge32	%i7,	%l0,	%l2
	edge16n	%o6,	%o1,	%l4
	ldub	[%l7 + 0x0B],	%g2
	popc	%i1,	%g7
	orncc	%l1,	0x12BB,	%l5
	sll	%g6,	%l3,	%l6
	mulx	%g3,	0x0556,	%i4
	smul	%g5,	%i5,	%o0
	movrgez	%i3,	%o3,	%i6
	srax	%i2,	0x0F,	%i0
	movge	%xcc,	%o4,	%o5
	sll	%o7,	0x1C,	%g4
	orncc	%o2,	%i7,	%l0
	or	%g1,	%l2,	%o1
	addccc	%o6,	0x09BD,	%l4
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	fmovrslz	%g7,	%f6,	%f21
	movrne	%l5,	%g6,	%l3
	xnor	%l6,	0x000E,	%g3
	std	%f20,	[%l7 + 0x58]
	srax	%i4,	%g5,	%l1
	popc	0x1FE3,	%i5
	sdiv	%i3,	0x1880,	%o3
	xnorcc	%i6,	%o0,	%i0
	umul	%i2,	0x0DB0,	%o4
	ldx	[%l7 + 0x20],	%o7
	edge8	%g4,	%o2,	%i7
	srl	%l0,	0x13,	%g1
	srax	%o5,	%o1,	%l2
	andncc	%o6,	%g2,	%l4
	movle	%xcc,	%g7,	%l5
	edge8ln	%g6,	%i1,	%l3
	orncc	%g3,	0x0C4F,	%i4
	movrne	%l6,	0x2C6,	%g5
	srlx	%i5,	0x13,	%i3
	movn	%icc,	%o3,	%i6
	mulx	%l1,	%o0,	%i2
	fmovsl	%xcc,	%f18,	%f10
	fmovrse	%i0,	%f15,	%f20
	mulscc	%o4,	%o7,	%o2
	movcc	%xcc,	%g4,	%i7
	orncc	%l0,	%o5,	%o1
	movrlz	%g1,	0x19C,	%o6
	smulcc	%g2,	0x0880,	%l4
	umulcc	%g7,	%l5,	%l2
	array8	%g6,	%i1,	%g3
	fmovdvs	%icc,	%f24,	%f22
	movvs	%xcc,	%i4,	%l6
	edge16l	%g5,	%l3,	%i3
	ld	[%l7 + 0x1C],	%f26
	movleu	%xcc,	%i5,	%i6
	popc	%o3,	%l1
	fcmpd	%fcc3,	%f6,	%f8
	fzeros	%f4
	nop
	set	0x3D, %o1
	stb	%i2,	[%l7 + %o1]
	edge32	%i0,	%o0,	%o4
	andncc	%o2,	%g4,	%o7
	save %i7, %o5, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%l0,	%g1,	%o6
	srax	%g2,	%l4,	%g7
	xnor	%l5,	%g6,	%i1
	movleu	%icc,	%l2,	%g3
	movne	%xcc,	%i4,	%l6
	fmovs	%f15,	%f26
	movl	%icc,	%l3,	%i3
	fmovde	%xcc,	%f10,	%f29
	restore %g5, 0x0301, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f31,	%f24,	%f5
	fnot1	%f22,	%f20
	andcc	%o3,	0x1E33,	%i5
	sdiv	%i2,	0x02CE,	%l1
	sir	0x0D7E
	fsrc2	%f24,	%f30
	faligndata	%f24,	%f0,	%f20
	fmovscc	%icc,	%f1,	%f26
	movg	%xcc,	%i0,	%o0
	xnorcc	%o2,	0x0932,	%g4
	mulx	%o7,	0x0924,	%o4
	sub	%o5,	%i7,	%o1
	ldsb	[%l7 + 0x1F],	%l0
	fmovsneg	%xcc,	%f3,	%f12
	movrgez	%g1,	0x05E,	%g2
	umul	%o6,	0x0E0C,	%l4
	edge16n	%g7,	%g6,	%l5
	lduh	[%l7 + 0x6A],	%l2
	sir	0x18F3
	movpos	%xcc,	%g3,	%i4
	siam	0x6
	fmovrde	%l6,	%f28,	%f24
	and	%i1,	0x0B74,	%i3
	edge32ln	%g5,	%i6,	%l3
	add	%i5,	0x1B13,	%i2
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	addcc	%o2,	0x133C,	%l1
	fmovsa	%xcc,	%f14,	%f17
	srax	%g4,	%o4,	%o5
	addc	%i7,	0x1886,	%o7
	andncc	%o1,	%l0,	%g2
	movgu	%xcc,	%o6,	%g1
	st	%f12,	[%l7 + 0x74]
	xnor	%l4,	0x1675,	%g7
	fnegs	%f19,	%f30
	orncc	%l5,	0x0CE6,	%g6
	fandnot1	%f24,	%f22,	%f2
	movrlz	%l2,	%i4,	%g3
	orncc	%i1,	%l6,	%g5
	umulcc	%i6,	0x1AA5,	%l3
	fmovscc	%xcc,	%f12,	%f13
	fmovdneg	%xcc,	%f24,	%f27
	movrgez	%i5,	%i3,	%o3
	movvc	%xcc,	%i2,	%i0
	fmovsn	%icc,	%f18,	%f7
	udivcc	%o0,	0x0B07,	%o2
	edge16l	%l1,	%o4,	%o5
	movneg	%xcc,	%i7,	%g4
	movre	%o7,	%l0,	%o1
	edge8	%o6,	%g1,	%l4
	srlx	%g7,	0x19,	%g2
	subc	%g6,	%l2,	%i4
	udivx	%l5,	0x05FD,	%i1
	xorcc	%g3,	0x1CFD,	%g5
	movl	%xcc,	%l6,	%i6
	srax	%l3,	%i5,	%o3
	lduh	[%l7 + 0x4C],	%i2
	array8	%i0,	%o0,	%i3
	movrgz	%o2,	%l1,	%o4
	edge16ln	%o5,	%i7,	%o7
	umulcc	%l0,	0x1CC1,	%g4
	movne	%icc,	%o1,	%o6
	subc	%g1,	0x1F0A,	%g7
	fmovsl	%xcc,	%f12,	%f16
	sdiv	%g2,	0x1908,	%l4
	smulcc	%l2,	0x07AF,	%g6
	stx	%l5,	[%l7 + 0x18]
	orn	%i4,	0x17A1,	%i1
	fpsub16	%f18,	%f0,	%f22
	edge8l	%g5,	%g3,	%i6
	sll	%l6,	%l3,	%i5
	fmuld8sux16	%f2,	%f3,	%f18
	fcmple32	%f4,	%f30,	%o3
	std	%f12,	[%l7 + 0x60]
	ld	[%l7 + 0x68],	%f9
	xor	%i2,	%i0,	%o0
	sllx	%i3,	0x02,	%o2
	fmovdge	%icc,	%f3,	%f1
	sir	0x0E2C
	sra	%o4,	%l1,	%o5
	umulcc	%o7,	0x0F4F,	%i7
	alignaddrl	%l0,	%o1,	%g4
	movrgez	%g1,	0x049,	%g7
	addccc	%o6,	0x11CB,	%l4
	array16	%l2,	%g6,	%g2
	fcmpgt16	%f12,	%f4,	%l5
	srl	%i1,	0x11,	%g5
	fmul8sux16	%f20,	%f28,	%f24
	movle	%icc,	%g3,	%i4
	fmovrdne	%i6,	%f4,	%f4
	movvc	%xcc,	%l3,	%l6
	sdiv	%o3,	0x0A5F,	%i5
	sub	%i2,	0x1836,	%i0
	alignaddr	%i3,	%o0,	%o4
	udiv	%o2,	0x07B4,	%o5
	edge16ln	%l1,	%o7,	%l0
	sth	%o1,	[%l7 + 0x3A]
	addc	%i7,	0x09E1,	%g4
	sub	%g1,	%o6,	%l4
	fmovdvs	%icc,	%f21,	%f14
	stw	%l2,	[%l7 + 0x7C]
	sra	%g6,	0x1F,	%g7
	alignaddrl	%g2,	%i1,	%g5
	sdivcc	%l5,	0x00AB,	%g3
	array32	%i6,	%i4,	%l3
	ldsb	[%l7 + 0x20],	%l6
	fmovrdlz	%i5,	%f22,	%f12
	orn	%o3,	0x0D7E,	%i0
	andcc	%i3,	0x14DA,	%i2
	nop
	set	0x10, %g1
	stx	%o0,	[%l7 + %g1]
	ldub	[%l7 + 0x1E],	%o4
	sir	0x0768
	fabsd	%f8,	%f10
	udiv	%o5,	0x1D3D,	%o2
	movrlz	%o7,	0x1E6,	%l1
	sllx	%l0,	0x15,	%i7
	xorcc	%g4,	0x0B52,	%g1
	umulcc	%o1,	%l4,	%o6
	stw	%l2,	[%l7 + 0x38]
	movrne	%g7,	%g6,	%i1
	xorcc	%g5,	0x1183,	%g2
	fmovde	%icc,	%f10,	%f2
	fmovsne	%xcc,	%f26,	%f16
	fmovdleu	%xcc,	%f2,	%f21
	alignaddr	%l5,	%g3,	%i6
	movrlez	%l3,	0x0EF,	%l6
	bshuffle	%f4,	%f12,	%f2
	fmovs	%f29,	%f27
	xnorcc	%i4,	0x165B,	%o3
	movne	%icc,	%i0,	%i5
	addccc	%i3,	%o0,	%o4
	ldsh	[%l7 + 0x4E],	%o5
	subccc	%i2,	0x0B2B,	%o7
	fabss	%f9,	%f27
	fmovsvs	%xcc,	%f24,	%f19
	orcc	%o2,	0x1EE0,	%l1
	andncc	%l0,	%g4,	%i7
	xorcc	%g1,	0x0DBD,	%o1
	umul	%l4,	%o6,	%l2
	array16	%g7,	%i1,	%g6
	fmovse	%xcc,	%f8,	%f15
	nop
	set	0x62, %i4
	ldsh	[%l7 + %i4],	%g5
	stb	%g2,	[%l7 + 0x2E]
	ldd	[%l7 + 0x10],	%l4
	movleu	%xcc,	%i6,	%g3
	movne	%icc,	%l6,	%i4
	sdivx	%l3,	0x1CA2,	%o3
	ld	[%l7 + 0x4C],	%f18
	fmovsge	%xcc,	%f16,	%f28
	fors	%f10,	%f11,	%f2
	udivx	%i0,	0x1CA7,	%i3
	addccc	%o0,	0x13FA,	%i5
	movne	%icc,	%o4,	%o5
	fpadd32s	%f3,	%f0,	%f22
	movleu	%icc,	%o7,	%o2
	movre	%i2,	0x000,	%l0
	addccc	%g4,	0x0563,	%l1
	sdivx	%g1,	0x0792,	%i7
	fornot1s	%f16,	%f7,	%f23
	movneg	%xcc,	%l4,	%o6
	sra	%o1,	0x1C,	%g7
	fcmpeq32	%f24,	%f8,	%l2
	fmul8ulx16	%f24,	%f2,	%f0
	edge16l	%i1,	%g6,	%g2
	edge32n	%g5,	%i6,	%l5
	array8	%l6,	%g3,	%i4
	fmovdvs	%icc,	%f3,	%f9
	lduw	[%l7 + 0x3C],	%o3
	edge32	%i0,	%i3,	%o0
	sdiv	%i5,	0x1FDD,	%l3
	xorcc	%o4,	0x12F3,	%o7
	sdivx	%o5,	0x1479,	%o2
	movrgez	%l0,	%i2,	%l1
	sra	%g4,	0x0F,	%i7
	movrgez	%l4,	0x098,	%o6
	xorcc	%g1,	0x0CBD,	%g7
	restore %o1, %l2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%g2,	%i1,	%i6
	and	%l5,	%l6,	%g3
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	edge8ln	%g5,	%i3,	%o0
	nop
	set	0x70, %i3
	ldsb	[%l7 + %i3],	%i5
	movg	%xcc,	%o4,	%l3
	movle	%xcc,	%o5,	%o7
	fmovsl	%icc,	%f0,	%f7
	addcc	%o2,	%l0,	%l1
	fcmpes	%fcc2,	%f16,	%f4
	edge8	%g4,	%i7,	%i2
	fornot2s	%f19,	%f26,	%f3
	lduw	[%l7 + 0x2C],	%o6
	edge8l	%l4,	%g7,	%g1
	xorcc	%o1,	%g6,	%l2
	nop
	set	0x58, %i5
	ldsb	[%l7 + %i5],	%g2
	fmovsa	%xcc,	%f11,	%f4
	addcc	%i1,	%i6,	%l5
	fcmpne16	%f8,	%f0,	%g3
	movne	%xcc,	%i4,	%o3
	movle	%icc,	%i0,	%l6
	movvc	%xcc,	%g5,	%o0
	udivcc	%i5,	0x161A,	%o4
	fmovsneg	%icc,	%f6,	%f23
	fmovrsne	%i3,	%f27,	%f24
	array32	%l3,	%o7,	%o2
	edge16n	%l0,	%l1,	%g4
	subcc	%o5,	0x1B30,	%i2
	sub	%i7,	0x10A1,	%l4
	movrlez	%g7,	%g1,	%o6
	subcc	%o1,	0x0628,	%g6
	orncc	%g2,	0x191F,	%i1
	sdivcc	%l2,	0x0A57,	%i6
	subccc	%g3,	0x04E3,	%l5
	ldsb	[%l7 + 0x39],	%o3
	edge8	%i4,	%l6,	%g5
	edge32	%o0,	%i0,	%o4
	sdivcc	%i3,	0x1873,	%l3
	edge8n	%i5,	%o7,	%o2
	save %l0, 0x087C, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f31,	%f30,	%f6
	ld	[%l7 + 0x20],	%f31
	andcc	%g4,	%i2,	%i7
	fmovdcs	%xcc,	%f0,	%f23
	movneg	%icc,	%l4,	%g7
	fpadd32	%f18,	%f26,	%f0
	edge8	%g1,	%o5,	%o6
	ldsb	[%l7 + 0x4D],	%o1
	restore %g2, 0x1F6D, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc1,	%f12,	%f22
	edge16l	%l2,	%i6,	%g3
	ldsw	[%l7 + 0x18],	%g6
	umul	%l5,	0x0A3F,	%i4
	movn	%icc,	%o3,	%g5
	edge32ln	%l6,	%o0,	%o4
	fpadd32	%f22,	%f0,	%f22
	xorcc	%i3,	%i0,	%l3
	orn	%o7,	0x1BFD,	%o2
	udivx	%l0,	0x0CF8,	%i5
	movrgz	%l1,	0x1BF,	%g4
	andcc	%i2,	0x1F38,	%i7
	movl	%xcc,	%g7,	%l4
	movgu	%icc,	%g1,	%o6
	ldd	[%l7 + 0x08],	%o4
	edge32l	%g2,	%i1,	%l2
	movle	%icc,	%i6,	%g3
	edge8l	%g6,	%l5,	%o1
	fsrc2	%f4,	%f2
	edge8l	%o3,	%i4,	%l6
	array16	%g5,	%o0,	%i3
	udiv	%i0,	0x0D70,	%l3
	subccc	%o7,	0x1135,	%o4
	srlx	%l0,	%i5,	%l1
	movcs	%icc,	%o2,	%g4
	stw	%i2,	[%l7 + 0x4C]
	fcmpgt32	%f4,	%f22,	%g7
	orn	%l4,	0x1913,	%g1
	edge8ln	%i7,	%o5,	%g2
	sub	%i1,	0x144B,	%l2
	and	%o6,	%g3,	%i6
	movleu	%xcc,	%l5,	%o1
	sdivx	%g6,	0x1763,	%o3
	fcmped	%fcc0,	%f24,	%f30
	fors	%f7,	%f2,	%f6
	fmovdl	%icc,	%f4,	%f21
	fsrc2s	%f19,	%f26
	fmovdg	%icc,	%f9,	%f31
	srl	%i4,	%l6,	%o0
	st	%f2,	[%l7 + 0x14]
	edge8ln	%g5,	%i3,	%l3
	fpmerge	%f18,	%f8,	%f26
	movrlez	%o7,	%o4,	%i0
	xorcc	%l0,	0x0D82,	%l1
	or	%i5,	%g4,	%i2
	stx	%g7,	[%l7 + 0x48]
	movg	%icc,	%l4,	%o2
	orcc	%i7,	0x1C11,	%o5
	movrlz	%g2,	%i1,	%l2
	sub	%o6,	%g3,	%i6
	movgu	%xcc,	%g1,	%o1
	fmovdleu	%xcc,	%f7,	%f8
	addcc	%l5,	0x0D26,	%o3
	movge	%icc,	%i4,	%l6
	orn	%g6,	%g5,	%o0
	addccc	%i3,	0x1E97,	%l3
	stx	%o7,	[%l7 + 0x70]
	fmovsa	%xcc,	%f30,	%f9
	edge16ln	%i0,	%o4,	%l1
	srlx	%i5,	%l0,	%i2
	srax	%g7,	%g4,	%l4
	movvc	%icc,	%o2,	%i7
	movrgz	%g2,	0x1D2,	%o5
	array8	%i1,	%o6,	%g3
	save %l2, %g1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpadd32	%f16,	%f30,	%f0
	ldub	[%l7 + 0x5D],	%l5
	edge8n	%o3,	%o1,	%l6
	nop
	set	0x5C, %g5
	ldsb	[%l7 + %g5],	%i4
	udivcc	%g5,	0x1996,	%o0
	movvs	%icc,	%i3,	%g6
	orncc	%o7,	%i0,	%o4
	edge32n	%l1,	%i5,	%l3
	nop
	set	0x14, %l2
	stw	%i2,	[%l7 + %l2]
	fnands	%f26,	%f20,	%f29
	fmovd	%f2,	%f20
	and	%g7,	%g4,	%l0
	std	%f20,	[%l7 + 0x50]
	movne	%icc,	%o2,	%l4
	movl	%icc,	%g2,	%i7
	fmovrdgez	%o5,	%f18,	%f16
	fandnot1	%f26,	%f30,	%f24
	ldub	[%l7 + 0x5B],	%i1
	array16	%o6,	%g3,	%l2
	array8	%g1,	%l5,	%o3
	fmovdg	%icc,	%f25,	%f24
	movrlz	%o1,	0x1EC,	%i6
	andn	%l6,	0x0A1E,	%g5
	sub	%i4,	0x062D,	%o0
	move	%icc,	%g6,	%i3
	edge8	%o7,	%o4,	%i0
	umulcc	%l1,	%i5,	%i2
	xnor	%g7,	%l3,	%l0
	move	%xcc,	%o2,	%g4
	fmovsneg	%xcc,	%f25,	%f18
	sir	0x048B
	edge32	%l4,	%i7,	%o5
	andn	%g2,	%i1,	%g3
	orn	%l2,	%g1,	%l5
	subcc	%o3,	%o6,	%i6
	smul	%o1,	0x1BF8,	%l6
	movn	%icc,	%g5,	%o0
	andncc	%i4,	%g6,	%i3
	ldsw	[%l7 + 0x08],	%o7
	popc	%i0,	%l1
	array8	%o4,	%i5,	%i2
	fandnot2s	%f12,	%f31,	%f29
	fnot1s	%f12,	%f26
	addccc	%l3,	%l0,	%g7
	fsrc2	%f8,	%f8
	mova	%xcc,	%g4,	%l4
	movrne	%o2,	%i7,	%o5
	ldsb	[%l7 + 0x58],	%i1
	sethi	0x09E5,	%g2
	udiv	%g3,	0x0747,	%l2
	movgu	%xcc,	%l5,	%o3
	movrlez	%g1,	0x297,	%i6
	sllx	%o1,	%l6,	%o6
	sllx	%o0,	%g5,	%g6
	fmovrdne	%i3,	%f28,	%f24
	edge32	%i4,	%i0,	%o7
	ldd	[%l7 + 0x50],	%f30
	fmovsa	%xcc,	%f21,	%f9
	fpsub16s	%f17,	%f21,	%f2
	fornot1	%f22,	%f22,	%f28
	edge32l	%l1,	%o4,	%i5
	add	%l3,	%i2,	%g7
	movle	%xcc,	%l0,	%l4
	alignaddrl	%g4,	%i7,	%o2
	stb	%o5,	[%l7 + 0x2E]
	lduh	[%l7 + 0x16],	%i1
	movgu	%icc,	%g3,	%l2
	edge8	%g2,	%o3,	%l5
	movvc	%icc,	%g1,	%o1
	nop
	set	0x68, %i2
	stw	%l6,	[%l7 + %i2]
	ldub	[%l7 + 0x3A],	%i6
	sir	0x1757
	fpmerge	%f30,	%f18,	%f18
	fornot1s	%f3,	%f5,	%f1
	smulcc	%o6,	0x1F04,	%g5
	edge16n	%g6,	%i3,	%o0
	fpadd32s	%f3,	%f9,	%f7
	movne	%xcc,	%i0,	%i4
	addcc	%l1,	%o4,	%i5
	movrne	%o7,	0x32D,	%l3
	fmovsleu	%icc,	%f20,	%f14
	std	%f26,	[%l7 + 0x68]
	lduh	[%l7 + 0x5E],	%i2
	fmovdneg	%icc,	%f2,	%f19
	movleu	%xcc,	%g7,	%l4
	fcmpeq32	%f28,	%f10,	%l0
	movleu	%icc,	%i7,	%g4
	srax	%o5,	%i1,	%g3
	edge8	%o2,	%g2,	%o3
	orncc	%l2,	0x0156,	%l5
	sdiv	%o1,	0x1573,	%l6
	movn	%icc,	%g1,	%o6
	edge8ln	%i6,	%g5,	%i3
	fnegd	%f10,	%f12
	udivcc	%g6,	0x156B,	%i0
	fmovrslz	%o0,	%f10,	%f10
	sra	%l1,	%i4,	%i5
	fcmped	%fcc0,	%f0,	%f10
	add	%o7,	%l3,	%o4
	ld	[%l7 + 0x78],	%f17
	movn	%xcc,	%g7,	%i2
	alignaddr	%l4,	%l0,	%g4
	stb	%i7,	[%l7 + 0x1E]
	move	%xcc,	%i1,	%g3
	andn	%o5,	%g2,	%o2
	movvs	%xcc,	%l2,	%o3
	movgu	%xcc,	%o1,	%l6
	orcc	%l5,	%o6,	%i6
	movgu	%xcc,	%g5,	%i3
	fmovdl	%xcc,	%f26,	%f9
	fmovscs	%xcc,	%f15,	%f25
	edge8n	%g6,	%g1,	%o0
	addccc	%i0,	0x13EA,	%i4
	fmul8ulx16	%f2,	%f28,	%f2
	edge32ln	%i5,	%l1,	%l3
	edge32ln	%o4,	%g7,	%i2
	udiv	%o7,	0x1F05,	%l4
	xnorcc	%l0,	0x0960,	%g4
	fandnot1s	%f26,	%f0,	%f23
	add	%i1,	0x1531,	%g3
	srlx	%o5,	0x1D,	%g2
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	xnorcc	%o1,	0x1FB5,	%o3
	st	%f0,	[%l7 + 0x74]
	sll	%l6,	%l5,	%o6
	edge8n	%i6,	%i3,	%g5
	fornot1s	%f18,	%f14,	%f16
	st	%f12,	[%l7 + 0x38]
	orcc	%g1,	0x120D,	%g6
	sdivcc	%i0,	0x0432,	%o0
	sllx	%i5,	0x19,	%l1
	edge32l	%i4,	%l3,	%g7
	edge32l	%i2,	%o7,	%o4
	ldsh	[%l7 + 0x76],	%l4
	move	%icc,	%g4,	%i1
	lduh	[%l7 + 0x14],	%l0
	addccc	%o5,	%g3,	%i7
	array32	%g2,	%o2,	%o1
	fmovdg	%xcc,	%f26,	%f7
	movg	%icc,	%o3,	%l6
	st	%f30,	[%l7 + 0x14]
	xnor	%l5,	0x0C27,	%l2
	nop
	set	0x08, %g2
	ldsw	[%l7 + %g2],	%o6
	xnor	%i3,	%g5,	%g1
	sdivcc	%i6,	0x0966,	%g6
	edge32ln	%o0,	%i5,	%i0
	subc	%l1,	0x1FD0,	%i4
	srlx	%g7,	0x1E,	%i2
	ld	[%l7 + 0x3C],	%f31
	sllx	%o7,	0x18,	%l3
	ldsb	[%l7 + 0x58],	%o4
	mulscc	%l4,	%i1,	%l0
	fmovrsne	%g4,	%f30,	%f4
	fands	%f2,	%f28,	%f18
	srlx	%o5,	%i7,	%g3
	stw	%o2,	[%l7 + 0x44]
	ldd	[%l7 + 0x68],	%f2
	movg	%xcc,	%g2,	%o1
	xor	%o3,	0x01E5,	%l5
	std	%f10,	[%l7 + 0x28]
	ldub	[%l7 + 0x50],	%l6
	fmovdg	%icc,	%f20,	%f16
	ldsh	[%l7 + 0x08],	%o6
	edge32	%i3,	%l2,	%g1
	smul	%g5,	%g6,	%i6
	fmul8x16au	%f21,	%f9,	%f22
	subc	%o0,	%i0,	%i5
	sir	0x106E
	edge32	%i4,	%l1,	%g7
	movrlez	%i2,	0x3B2,	%o7
	edge32l	%o4,	%l4,	%i1
	movvs	%xcc,	%l0,	%g4
	ldsw	[%l7 + 0x1C],	%o5
	andncc	%l3,	%g3,	%i7
	add	%o2,	0x1D3F,	%o1
	ld	[%l7 + 0x20],	%f18
	andncc	%g2,	%o3,	%l5
	nop
	set	0x2A, %o6
	ldsh	[%l7 + %o6],	%o6
	lduh	[%l7 + 0x26],	%i3
	subc	%l6,	%g1,	%g5
	edge32	%g6,	%i6,	%o0
	xor	%i0,	%l2,	%i5
	udivx	%l1,	0x01D9,	%i4
	alignaddrl	%i2,	%o7,	%g7
	orncc	%o4,	%l4,	%l0
	movpos	%xcc,	%g4,	%i1
	andncc	%o5,	%l3,	%i7
	xnorcc	%g3,	0x02F3,	%o1
	edge16ln	%o2,	%g2,	%o3
	subc	%o6,	0x0676,	%l5
	sub	%l6,	%i3,	%g1
	srax	%g6,	%g5,	%o0
	movrlz	%i0,	%l2,	%i5
	fmul8x16al	%f2,	%f18,	%f4
	andn	%i6,	%i4,	%l1
	edge16	%i2,	%g7,	%o4
	movleu	%icc,	%o7,	%l4
	mulscc	%l0,	0x06F2,	%g4
	sub	%i1,	0x0778,	%l3
	movre	%o5,	%g3,	%o1
	movneg	%xcc,	%o2,	%g2
	orcc	%o3,	%i7,	%l5
	sth	%l6,	[%l7 + 0x10]
	fxors	%f31,	%f0,	%f21
	fmovdvs	%icc,	%f15,	%f16
	or	%o6,	0x0E05,	%g1
	udiv	%g6,	0x0C16,	%g5
	fmovsle	%icc,	%f7,	%f14
	edge8	%o0,	%i3,	%l2
	mulscc	%i5,	%i6,	%i4
	save %i0, 0x05B1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x70],	%g6
	sub	%i2,	%o4,	%l4
	sethi	0x1EFF,	%l0
	movcs	%icc,	%g4,	%i1
	fpackfix	%f30,	%f25
	st	%f29,	[%l7 + 0x14]
	subccc	%l3,	0x09F7,	%o7
	fabss	%f18,	%f19
	subccc	%g3,	0x0464,	%o5
	sll	%o2,	0x0A,	%o1
	edge16n	%o3,	%g2,	%i7
	xnor	%l5,	0x0535,	%o6
	fones	%f6
	movne	%icc,	%g1,	%l6
	edge32	%g6,	%o0,	%i3
	movrne	%g5,	%i5,	%i6
	movrlez	%l2,	0x026,	%i4
	movle	%icc,	%i0,	%l1
	lduw	[%l7 + 0x44],	%g7
	addccc	%i2,	%l4,	%o4
	array16	%g4,	%i1,	%l3
	fcmpes	%fcc2,	%f27,	%f26
	movrlz	%o7,	%g3,	%o5
	movpos	%xcc,	%o2,	%l0
	andn	%o3,	0x0265,	%g2
	array8	%o1,	%l5,	%o6
	edge8n	%i7,	%l6,	%g1
	edge32l	%g6,	%o0,	%i3
	ldx	[%l7 + 0x18],	%i5
	sra	%i6,	0x16,	%l2
	array8	%g5,	%i4,	%i0
	movrne	%l1,	%i2,	%l4
	movrne	%g7,	0x026,	%o4
	array16	%g4,	%l3,	%o7
	fcmpne16	%f20,	%f10,	%g3
	stb	%i1,	[%l7 + 0x0E]
	fmuld8ulx16	%f30,	%f29,	%f28
	udivcc	%o5,	0x1E09,	%l0
	add	%o2,	0x08B4,	%o3
	fmovdvs	%icc,	%f22,	%f20
	fmovdgu	%icc,	%f11,	%f6
	fornot1s	%f6,	%f30,	%f21
	movcc	%icc,	%o1,	%l5
	edge8n	%g2,	%o6,	%l6
	movcs	%xcc,	%g1,	%g6
	fmovsl	%icc,	%f11,	%f11
	orcc	%i7,	%o0,	%i5
	alignaddrl	%i6,	%l2,	%i3
	fmovrdlz	%g5,	%f12,	%f4
	fxor	%f12,	%f6,	%f4
	lduw	[%l7 + 0x64],	%i0
	save %i4, 0x08A0, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16au	%f31,	%f12,	%f0
	addccc	%l1,	0x1864,	%l4
	sll	%o4,	0x1A,	%g7
	movg	%xcc,	%l3,	%o7
	subcc	%g3,	%g4,	%o5
	mulscc	%i1,	%o2,	%l0
	movrgz	%o1,	%o3,	%l5
	edge32	%o6,	%l6,	%g2
	fmovrsgez	%g1,	%f13,	%f7
	movgu	%xcc,	%g6,	%i7
	subcc	%i5,	0x0CBA,	%i6
	fcmpeq32	%f18,	%f24,	%o0
	ldsb	[%l7 + 0x45],	%i3
	sll	%g5,	%i0,	%i4
	movcc	%icc,	%i2,	%l2
	sll	%l4,	0x05,	%l1
	fsrc2s	%f12,	%f1
	movcc	%icc,	%g7,	%o4
	smul	%l3,	0x027E,	%g3
	fcmpne32	%f10,	%f24,	%g4
	smulcc	%o7,	%i1,	%o5
	mulx	%o2,	0x1443,	%l0
	stx	%o1,	[%l7 + 0x48]
	fcmpgt32	%f28,	%f24,	%l5
	movrgez	%o6,	%o3,	%l6
	or	%g1,	%g2,	%g6
	restore %i7, %i6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f19,	%f29,	%f10
	movcc	%xcc,	%i3,	%g5
	ldsw	[%l7 + 0x28],	%i0
	addc	%o0,	0x059A,	%i4
	fmovsne	%xcc,	%f31,	%f21
	sdivx	%i2,	0x15C5,	%l2
	edge8n	%l4,	%l1,	%g7
	and	%o4,	0x09C2,	%g3
	fmovdg	%xcc,	%f20,	%f20
	stb	%l3,	[%l7 + 0x65]
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	st	%f25,	[%l7 + 0x48]
	smulcc	%o5,	%o2,	%g4
	or	%l0,	0x114E,	%o1
	nop
	set	0x60, %o5
	stx	%l5,	[%l7 + %o5]
	movleu	%xcc,	%o6,	%o3
	sethi	0x19BA,	%g1
	move	%xcc,	%l6,	%g2
	ldsw	[%l7 + 0x28],	%i7
	ldd	[%l7 + 0x68],	%g6
	xorcc	%i6,	%i5,	%g5
	fand	%f26,	%f20,	%f16
	add	%i3,	%o0,	%i0
	srax	%i4,	%i2,	%l2
	ldub	[%l7 + 0x6B],	%l4
	edge8n	%l1,	%o4,	%g3
	andcc	%l3,	%o7,	%i1
	stx	%g7,	[%l7 + 0x48]
	orcc	%o2,	%o5,	%g4
	sllx	%o1,	%l0,	%l5
	sdivx	%o3,	0x18A2,	%o6
	sub	%l6,	%g2,	%i7
	sdivcc	%g1,	0x153B,	%g6
	sdivx	%i6,	0x0096,	%g5
	ldx	[%l7 + 0x58],	%i5
	edge32	%i3,	%o0,	%i0
	sir	0x0F06
	movn	%icc,	%i2,	%l2
	movn	%xcc,	%l4,	%l1
	sll	%i4,	%g3,	%l3
	movge	%icc,	%o7,	%o4
	umul	%g7,	0x15BB,	%o2
	move	%icc,	%i1,	%g4
	fandnot1	%f30,	%f6,	%f8
	ldsw	[%l7 + 0x78],	%o1
	lduh	[%l7 + 0x4A],	%o5
	fmul8x16au	%f9,	%f8,	%f14
	fnand	%f24,	%f2,	%f4
	movleu	%icc,	%l5,	%o3
	fand	%f0,	%f26,	%f8
	fmul8x16	%f27,	%f20,	%f28
	ldub	[%l7 + 0x3A],	%l0
	or	%l6,	0x1096,	%o6
	movne	%xcc,	%g2,	%i7
	srlx	%g1,	0x0F,	%i6
	sdivcc	%g6,	0x14A5,	%i5
	sra	%i3,	0x05,	%o0
	fpadd32	%f22,	%f4,	%f30
	addcc	%i0,	%i2,	%g5
	smulcc	%l4,	0x0B4B,	%l2
	movcc	%xcc,	%l1,	%i4
	array16	%l3,	%o7,	%g3
	andncc	%o4,	%g7,	%o2
	andn	%g4,	0x1F92,	%i1
	fmovsleu	%xcc,	%f25,	%f19
	fcmpne16	%f18,	%f10,	%o1
	xorcc	%l5,	%o3,	%l0
	mova	%icc,	%l6,	%o5
	movne	%xcc,	%g2,	%i7
	subcc	%g1,	0x14FA,	%o6
	std	%f6,	[%l7 + 0x70]
	sth	%g6,	[%l7 + 0x36]
	ldub	[%l7 + 0x0B],	%i5
	srax	%i6,	0x12,	%i3
	or	%o0,	0x1E82,	%i2
	umulcc	%i0,	0x130E,	%g5
	sra	%l2,	0x18,	%l4
	fmovdpos	%xcc,	%f20,	%f4
	sir	0x0F3D
	udivx	%i4,	0x1AFF,	%l1
	st	%f27,	[%l7 + 0x50]
	addcc	%o7,	%l3,	%o4
	sth	%g7,	[%l7 + 0x4A]
	edge8n	%o2,	%g3,	%i1
	movleu	%xcc,	%o1,	%l5
	movrlz	%o3,	%l0,	%g4
	fornot2s	%f12,	%f6,	%f27
	nop
	set	0x5D, %i7
	stb	%o5,	[%l7 + %i7]
	addc	%l6,	0x1F67,	%i7
	subcc	%g1,	%o6,	%g2
	movge	%xcc,	%g6,	%i5
	edge16	%i3,	%i6,	%i2
	edge8n	%o0,	%g5,	%l2
	ldd	[%l7 + 0x40],	%i0
	subc	%i4,	%l4,	%l1
	fones	%f30
	fone	%f16
	and	%o7,	%o4,	%l3
	movcc	%xcc,	%o2,	%g7
	edge16ln	%i1,	%o1,	%g3
	srl	%o3,	%l0,	%l5
	popc	%o5,	%g4
	sethi	0x12AA,	%l6
	stx	%g1,	[%l7 + 0x48]
	movvc	%xcc,	%i7,	%g2
	movrlez	%g6,	%o6,	%i3
	fmovsleu	%icc,	%f30,	%f23
	subc	%i5,	0x1081,	%i2
	andn	%i6,	0x0D4A,	%o0
	xor	%l2,	0x1532,	%i0
	srlx	%i4,	0x0B,	%l4
	lduh	[%l7 + 0x2C],	%l1
	st	%f23,	[%l7 + 0x48]
	movge	%icc,	%g5,	%o7
	fcmpes	%fcc1,	%f14,	%f15
	save %o4, %l3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8ulx16	%f10,	%f0,	%f6
	edge8	%o2,	%o1,	%g3
	movgu	%xcc,	%o3,	%i1
	edge16	%l5,	%o5,	%g4
	orn	%l0,	0x020C,	%g1
	edge16n	%i7,	%l6,	%g2
	fpmerge	%f1,	%f25,	%f26
	srl	%o6,	0x0B,	%i3
	fcmpeq16	%f10,	%f26,	%g6
	alignaddr	%i2,	%i6,	%i5
	std	%f16,	[%l7 + 0x10]
	movgu	%xcc,	%o0,	%l2
	addcc	%i0,	0x1BA3,	%l4
	xnor	%l1,	%g5,	%i4
	movle	%xcc,	%o7,	%o4
	fandnot1s	%f5,	%f8,	%f12
	fnegs	%f19,	%f26
	std	%f22,	[%l7 + 0x70]
	fandnot1	%f14,	%f4,	%f0
	movn	%icc,	%l3,	%g7
	ldsb	[%l7 + 0x60],	%o1
	addcc	%g3,	0x081D,	%o3
	andncc	%i1,	%l5,	%o5
	sdivx	%g4,	0x1890,	%l0
	srlx	%o2,	%g1,	%l6
	srlx	%g2,	%i7,	%i3
	movle	%xcc,	%g6,	%o6
	movrne	%i2,	%i6,	%i5
	ldub	[%l7 + 0x0B],	%o0
	fmovdle	%xcc,	%f6,	%f20
	mulscc	%i0,	%l4,	%l1
	movle	%xcc,	%l2,	%g5
	fnot1	%f22,	%f26
	fcmped	%fcc0,	%f22,	%f24
	fandnot2	%f10,	%f4,	%f0
	sdivcc	%o7,	0x0D02,	%o4
	andncc	%l3,	%i4,	%g7
	movle	%xcc,	%g3,	%o1
	movl	%xcc,	%i1,	%l5
	restore %o5, 0x06A3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o3,	0x1A75,	%o2
	fpadd16s	%f13,	%f25,	%f19
	fandnot2s	%f9,	%f2,	%f6
	ldub	[%l7 + 0x60],	%l0
	addcc	%l6,	%g2,	%g1
	xorcc	%i3,	%i7,	%o6
	smulcc	%i2,	0x1B79,	%g6
	std	%f6,	[%l7 + 0x50]
	fnands	%f26,	%f9,	%f22
	sra	%i6,	%o0,	%i5
	fsrc2	%f24,	%f16
	fmuld8sux16	%f20,	%f23,	%f10
	fmovdneg	%icc,	%f8,	%f13
	movvs	%xcc,	%i0,	%l1
	movvc	%icc,	%l2,	%g5
	save %l4, %o7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%i4,	%g7,	%l3
	edge8	%o1,	%i1,	%g3
	ldsb	[%l7 + 0x49],	%o5
	movg	%xcc,	%g4,	%o3
	fmovrsne	%o2,	%f8,	%f12
	udiv	%l0,	0x01E5,	%l6
	move	%icc,	%g2,	%l5
	lduh	[%l7 + 0x52],	%g1
	save %i7, %i3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i2,	%g6
	movle	%xcc,	%i6,	%o0
	array16	%i5,	%i0,	%l2
	fpadd16	%f18,	%f18,	%f4
	movgu	%xcc,	%l1,	%g5
	array32	%l4,	%o7,	%i4
	srl	%g7,	%l3,	%o4
	ldd	[%l7 + 0x68],	%o0
	edge8l	%i1,	%g3,	%o5
	xnorcc	%g4,	%o3,	%l0
	stx	%l6,	[%l7 + 0x40]
	edge8ln	%g2,	%l5,	%o2
	udivcc	%i7,	0x095E,	%i3
	xnor	%o6,	%g1,	%i2
	move	%xcc,	%g6,	%i6
	smul	%i5,	%i0,	%o0
	movrgez	%l2,	0x206,	%l1
	fsrc1	%f18,	%f8
	stw	%g5,	[%l7 + 0x10]
	fpackfix	%f16,	%f4
	std	%f30,	[%l7 + 0x28]
	fmovdgu	%xcc,	%f24,	%f22
	movleu	%icc,	%l4,	%i4
	movrlez	%o7,	%g7,	%o4
	mova	%icc,	%l3,	%o1
	xor	%i1,	%o5,	%g4
	movrgz	%g3,	0x398,	%l0
	edge32n	%l6,	%o3,	%g2
	fornot1	%f8,	%f2,	%f24
	addc	%l5,	%o2,	%i7
	fmuld8ulx16	%f5,	%f25,	%f8
	movvs	%xcc,	%o6,	%i3
	movneg	%icc,	%g1,	%g6
	array16	%i2,	%i6,	%i0
	std	%f6,	[%l7 + 0x28]
	nop
	set	0x68, %o0
	ldsw	[%l7 + %o0],	%i5
	fmovdpos	%icc,	%f22,	%f10
	fnot2s	%f14,	%f6
	mulscc	%o0,	0x0EF1,	%l2
	fmovdge	%icc,	%f11,	%f3
	fnands	%f3,	%f23,	%f5
	umul	%l1,	%l4,	%g5
	movg	%icc,	%i4,	%o7
	stb	%g7,	[%l7 + 0x76]
	ldx	[%l7 + 0x78],	%o4
	subc	%o1,	0x1D4E,	%i1
	stb	%o5,	[%l7 + 0x78]
	movg	%icc,	%g4,	%g3
	movleu	%icc,	%l3,	%l0
	lduh	[%l7 + 0x58],	%l6
	ldub	[%l7 + 0x21],	%o3
	lduh	[%l7 + 0x18],	%g2
	edge16ln	%l5,	%i7,	%o6
	alignaddr	%i3,	%g1,	%o2
	edge16l	%i2,	%g6,	%i6
	udivx	%i5,	0x0E6C,	%o0
	fmovrsgz	%i0,	%f21,	%f23
	edge8	%l1,	%l4,	%l2
	movrlez	%i4,	0x0BC,	%o7
	fpadd32s	%f13,	%f27,	%f22
	edge16	%g5,	%o4,	%g7
	setx loop_61, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_61: 	fxnor	%f12,	%f6,	%f22
	array16	%o5,	%l3,	%g3
	lduw	[%l7 + 0x08],	%l6
	edge32l	%o3,	%l0,	%g2
	fabss	%f28,	%f27
	fxor	%f8,	%f28,	%f14
	srax	%i7,	0x0A,	%o6
	save %i3, 0x048E, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o2, 0x097A, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f7,	%f20,	%f31
	array8	%g6,	%i2,	%i6
	fmul8ulx16	%f14,	%f6,	%f0
	array32	%o0,	%i5,	%l1
	movle	%icc,	%i0,	%l2
	movl	%icc,	%l4,	%i4
	fmovdneg	%xcc,	%f2,	%f10
	subc	%o7,	0x127B,	%o4
	fmovsleu	%xcc,	%f4,	%f30
	fmovrsgez	%g5,	%f4,	%f14
	orncc	%i1,	0x0447,	%o1
	movg	%icc,	%g4,	%o5
	fmovsa	%icc,	%f6,	%f11
	sethi	0x1629,	%g7
	smul	%l3,	%l6,	%g3
	srl	%o3,	0x16,	%l0
	fmovsneg	%icc,	%f21,	%f23
	fpsub32s	%f25,	%f15,	%f13
	addccc	%i7,	%o6,	%i3
	movrgz	%g1,	%g2,	%l5
	fsrc1	%f0,	%f22
	udiv	%g6,	0x0655,	%o2
	fandnot2s	%f28,	%f21,	%f22
	fmovse	%icc,	%f30,	%f0
	array16	%i6,	%i2,	%o0
	subcc	%l1,	0x00EA,	%i5
	fcmps	%fcc3,	%f30,	%f16
	movrlz	%i0,	0x390,	%l4
	fand	%f4,	%f26,	%f6
	sir	0x00DF
	fmovscs	%icc,	%f2,	%f29
	fpsub16	%f6,	%f4,	%f24
	fsrc2s	%f5,	%f19
	movre	%l2,	%o7,	%o4
	ldsw	[%l7 + 0x70],	%i4
	or	%i1,	0x1834,	%g5
	move	%xcc,	%o1,	%o5
	array32	%g4,	%l3,	%g7
	orncc	%l6,	0x1FB5,	%o3
	ld	[%l7 + 0x50],	%f29
	smul	%l0,	%g3,	%i7
	ldsb	[%l7 + 0x75],	%i3
	orncc	%g1,	0x0AB2,	%g2
	movle	%xcc,	%l5,	%g6
	fsrc2	%f28,	%f2
	fsrc1	%f20,	%f6
	movrgez	%o6,	%o2,	%i6
	fmovscs	%xcc,	%f1,	%f25
	fabsd	%f12,	%f22
	sll	%o0,	%i2,	%l1
	srl	%i5,	0x0C,	%l4
	edge8l	%l2,	%i0,	%o4
	fabsd	%f16,	%f4
	fmovdn	%xcc,	%f16,	%f5
	fmul8x16al	%f18,	%f8,	%f10
	and	%i4,	%o7,	%g5
	mulx	%i1,	0x0F08,	%o1
	fexpand	%f15,	%f20
	edge16l	%o5,	%g4,	%l3
	edge32n	%g7,	%o3,	%l6
	udivcc	%l0,	0x1277,	%i7
	xnorcc	%i3,	0x13F5,	%g3
	movrne	%g2,	0x327,	%g1
	xnor	%g6,	%o6,	%o2
	xnor	%l5,	0x06BA,	%i6
	array16	%o0,	%l1,	%i2
	orn	%i5,	0x06F5,	%l4
	addccc	%l2,	0x0737,	%o4
	movcc	%xcc,	%i4,	%o7
	fpack16	%f20,	%f9
	udiv	%g5,	0x0119,	%i0
	movrgez	%o1,	0x003,	%o5
	ldx	[%l7 + 0x28],	%i1
	stx	%l3,	[%l7 + 0x78]
	fmuld8sux16	%f23,	%f25,	%f16
	movcc	%xcc,	%g7,	%g4
	fmovsleu	%xcc,	%f16,	%f21
	fmovdn	%icc,	%f3,	%f20
	srlx	%o3,	0x09,	%l0
	fpackfix	%f18,	%f23
	movvc	%xcc,	%l6,	%i3
	fmovscs	%icc,	%f25,	%f27
	and	%g3,	0x0B3D,	%g2
	fmovspos	%icc,	%f19,	%f8
	move	%icc,	%i7,	%g1
	save %o6, 0x08BC, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o2,	%i6
	nop
	set	0x20, %i0
	lduw	[%l7 + %i0],	%l5
	ldsb	[%l7 + 0x6A],	%o0
	sth	%i2,	[%l7 + 0x2E]
	fmovrdgz	%l1,	%f28,	%f22
	srl	%l4,	0x0D,	%i5
	fmovscs	%icc,	%f17,	%f22
	movvs	%icc,	%l2,	%i4
	andncc	%o4,	%o7,	%g5
	fmovdge	%xcc,	%f11,	%f25
	sll	%i0,	0x1E,	%o1
	stw	%i1,	[%l7 + 0x50]
	sdivx	%o5,	0x01D6,	%g7
	movvs	%icc,	%l3,	%g4
	sethi	0x1EAA,	%o3
	umulcc	%l0,	%i3,	%g3
	andncc	%l6,	%g2,	%i7
	edge16ln	%g1,	%o6,	%o2
	xor	%g6,	%l5,	%i6
	mulx	%o0,	%i2,	%l4
	stb	%i5,	[%l7 + 0x43]
	stw	%l1,	[%l7 + 0x34]
	fmovdvs	%icc,	%f18,	%f21
	movrne	%l2,	%o4,	%o7
	movge	%xcc,	%g5,	%i0
	movrgz	%o1,	%i4,	%o5
	xnor	%g7,	%i1,	%l3
	movge	%icc,	%g4,	%o3
	fpackfix	%f4,	%f27
	ld	[%l7 + 0x54],	%f29
	smulcc	%l0,	%i3,	%l6
	ldsw	[%l7 + 0x28],	%g2
	movg	%icc,	%i7,	%g1
	fpsub32s	%f19,	%f28,	%f19
	lduh	[%l7 + 0x60],	%o6
	lduw	[%l7 + 0x38],	%o2
	movg	%icc,	%g3,	%l5
	xnor	%i6,	0x00E5,	%g6
	nop
	set	0x64, %g6
	sth	%o0,	[%l7 + %g6]
	fcmped	%fcc2,	%f26,	%f26
	xnor	%l4,	%i5,	%l1
	ldsb	[%l7 + 0x60],	%l2
	edge8	%o4,	%i2,	%g5
	smul	%i0,	0x15C0,	%o1
	movleu	%xcc,	%i4,	%o7
	edge32n	%o5,	%i1,	%g7
	fmovrdne	%l3,	%f6,	%f14
	move	%icc,	%g4,	%o3
	mova	%xcc,	%i3,	%l0
	subccc	%l6,	0x0BAA,	%g2
	subcc	%i7,	%g1,	%o6
	subc	%g3,	0x1E5F,	%o2
	movrgez	%i6,	0x1B7,	%l5
	smulcc	%o0,	%l4,	%i5
	sll	%l1,	0x06,	%l2
	movge	%icc,	%o4,	%i2
	popc	%g6,	%i0
	movvs	%icc,	%o1,	%g5
	xor	%o7,	0x1DF0,	%i4
	fcmps	%fcc2,	%f14,	%f9
	fmovsa	%xcc,	%f5,	%f30
	mulscc	%o5,	0x14FB,	%i1
	movrlez	%g7,	0x275,	%l3
	subccc	%g4,	%i3,	%l0
	fmovrde	%o3,	%f0,	%f6
	std	%f2,	[%l7 + 0x48]
	or	%g2,	%i7,	%g1
	stx	%l6,	[%l7 + 0x58]
	sdivcc	%o6,	0x1BE0,	%g3
	or	%i6,	%l5,	%o0
	ldub	[%l7 + 0x52],	%o2
	movn	%icc,	%l4,	%i5
	sethi	0x027F,	%l2
	fmovdpos	%xcc,	%f15,	%f0
	orn	%l1,	%i2,	%o4
	sra	%g6,	0x05,	%i0
	fcmpes	%fcc3,	%f10,	%f29
	udiv	%o1,	0x197F,	%g5
	edge32l	%i4,	%o7,	%i1
	movg	%icc,	%o5,	%g7
	udivcc	%g4,	0x1413,	%i3
	lduh	[%l7 + 0x30],	%l0
	fmovsneg	%icc,	%f19,	%f1
	fmovdcs	%xcc,	%f24,	%f20
	add	%l3,	0x13FF,	%g2
	sth	%i7,	[%l7 + 0x50]
	nop
	set	0x41, %o7
	stb	%g1,	[%l7 + %o7]
	alignaddr	%o3,	%l6,	%o6
	fpack32	%f8,	%f16,	%f8
	fmovdcs	%xcc,	%f8,	%f25
	xor	%g3,	0x1845,	%i6
	sdivcc	%l5,	0x165C,	%o2
	fmovrdlz	%l4,	%f4,	%f26
	lduh	[%l7 + 0x26],	%i5
	fmovda	%xcc,	%f23,	%f6
	xor	%l2,	0x1BB2,	%l1
	mulx	%o0,	%o4,	%g6
	popc	%i2,	%i0
	array16	%g5,	%o1,	%o7
	fpackfix	%f30,	%f6
	movg	%xcc,	%i1,	%o5
	edge16l	%g7,	%g4,	%i3
	edge16	%l0,	%l3,	%g2
	fmovdle	%xcc,	%f17,	%f5
	fcmpgt16	%f26,	%f22,	%i4
	fmovsvs	%xcc,	%f5,	%f1
	ldsb	[%l7 + 0x73],	%g1
	ldub	[%l7 + 0x63],	%i7
	ldd	[%l7 + 0x20],	%i6
	fmovdg	%icc,	%f26,	%f26
	xor	%o3,	%o6,	%i6
	stb	%l5,	[%l7 + 0x27]
	movne	%icc,	%o2,	%l4
	fcmple32	%f8,	%f18,	%g3
	fpadd16	%f22,	%f2,	%f30
	ldd	[%l7 + 0x40],	%f28
	popc	0x155F,	%i5
	movg	%icc,	%l2,	%o0
	movre	%o4,	%g6,	%l1
	ld	[%l7 + 0x38],	%f5
	fmovdneg	%xcc,	%f18,	%f26
	orncc	%i2,	%i0,	%o1
	fsrc2s	%f1,	%f8
	orncc	%g5,	%o7,	%i1
	movre	%o5,	%g4,	%i3
	ldsh	[%l7 + 0x66],	%g7
	ldd	[%l7 + 0x08],	%l2
	or	%g2,	%l0,	%i4
	mova	%xcc,	%i7,	%g1
	srlx	%o3,	%o6,	%l6
	ldsb	[%l7 + 0x52],	%l5
	edge8ln	%o2,	%l4,	%g3
	sllx	%i6,	0x01,	%l2
	alignaddr	%o0,	%o4,	%g6
	movvs	%xcc,	%i5,	%l1
	andncc	%i0,	%i2,	%o1
	lduh	[%l7 + 0x58],	%g5
	fpadd16s	%f21,	%f21,	%f8
	xnor	%o7,	0x1701,	%i1
	movvs	%icc,	%g4,	%o5
	udivcc	%i3,	0x0B82,	%l3
	fcmpgt16	%f28,	%f10,	%g7
	xnorcc	%g2,	%i4,	%l0
	fnors	%f14,	%f5,	%f18
	stx	%g1,	[%l7 + 0x68]
	edge32ln	%o3,	%o6,	%l6
	edge8l	%i7,	%l5,	%l4
	mulscc	%g3,	0x02EC,	%i6
	pdist	%f28,	%f8,	%f16
	xorcc	%o2,	%o0,	%o4
	edge16ln	%g6,	%i5,	%l1
	fmovsle	%icc,	%f11,	%f7
	add	%l2,	0x0B6B,	%i0
	restore %o1, %g5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq16	%f30,	%f20,	%i1
	srax	%i2,	0x15,	%g4
	movn	%icc,	%i3,	%o5
	fnot2	%f22,	%f28
	sllx	%g7,	%l3,	%g2
	sdiv	%i4,	0x0B93,	%l0
	std	%f22,	[%l7 + 0x18]
	fmovdn	%xcc,	%f5,	%f29
	nop
	set	0x64, %l0
	ldsb	[%l7 + %l0],	%o3
	edge32ln	%g1,	%l6,	%i7
	andncc	%o6,	%l5,	%g3
	mulscc	%l4,	0x16E2,	%i6
	smulcc	%o0,	%o4,	%g6
	fmovsvc	%xcc,	%f0,	%f5
	fcmps	%fcc1,	%f12,	%f16
	ldsb	[%l7 + 0x13],	%o2
	mulscc	%l1,	0x0F72,	%l2
	subcc	%i5,	0x0B46,	%i0
	movgu	%xcc,	%g5,	%o7
	stx	%i1,	[%l7 + 0x18]
	fsrc1s	%f9,	%f29
	fmovdcc	%icc,	%f12,	%f19
	andcc	%o1,	%i2,	%g4
	umul	%o5,	0x0DB7,	%g7
	fpsub32	%f6,	%f0,	%f12
	nop
	set	0x08, %i1
	stx	%l3,	[%l7 + %i1]
	xor	%g2,	%i4,	%i3
	ldsw	[%l7 + 0x38],	%o3
	alignaddrl	%l0,	%g1,	%l6
	addcc	%o6,	0x183C,	%l5
	movg	%xcc,	%i7,	%l4
	movn	%icc,	%i6,	%g3
	addccc	%o0,	0x0D90,	%g6
	xnor	%o2,	0x1AAC,	%l1
	addcc	%o4,	0x1AEA,	%l2
	movgu	%icc,	%i5,	%i0
	fmovdcc	%xcc,	%f29,	%f23
	orncc	%g5,	%i1,	%o1
	subcc	%i2,	%o7,	%g4
	movcs	%xcc,	%g7,	%o5
	nop
	set	0x10, %o2
	std	%f0,	[%l7 + %o2]
	fpack32	%f2,	%f24,	%f6
	fcmpgt32	%f18,	%f28,	%g2
	std	%f4,	[%l7 + 0x50]
	stx	%i4,	[%l7 + 0x48]
	fnors	%f2,	%f15,	%f13
	fcmped	%fcc3,	%f18,	%f20
	sir	0x157B
	edge16l	%i3,	%o3,	%l0
	fpadd32s	%f18,	%f17,	%f13
	edge8l	%l3,	%l6,	%o6
	smulcc	%g1,	%i7,	%l4
	fnands	%f26,	%f6,	%f18
	ld	[%l7 + 0x6C],	%f18
	mova	%icc,	%l5,	%i6
	udivcc	%g3,	0x1D86,	%g6
	orn	%o2,	%o0,	%o4
	fsrc1s	%f12,	%f24
	stb	%l2,	[%l7 + 0x3E]
	xnor	%l1,	%i0,	%g5
	umulcc	%i1,	0x13E1,	%i5
	srl	%i2,	0x11,	%o1
	xnorcc	%o7,	0x1744,	%g4
	array32	%o5,	%g7,	%g2
	udivcc	%i3,	0x0742,	%i4
	sll	%o3,	%l0,	%l6
	movcs	%xcc,	%l3,	%o6
	xnor	%g1,	0x12DD,	%l4
	fexpand	%f5,	%f12
	popc	0x07A6,	%l5
	fpackfix	%f12,	%f24
	sra	%i6,	0x1D,	%g3
	fmul8x16au	%f19,	%f29,	%f28
	movgu	%xcc,	%i7,	%g6
	fnegd	%f22,	%f6
	srax	%o0,	0x04,	%o4
	addccc	%l2,	0x0E25,	%o2
	fcmps	%fcc2,	%f1,	%f20
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	fpsub16	%f18,	%f18,	%f2
	ldsh	[%l7 + 0x6A],	%i1
	ld	[%l7 + 0x5C],	%f22
	lduh	[%l7 + 0x32],	%i5
	fcmple16	%f30,	%f0,	%i2
	stb	%o1,	[%l7 + 0x48]
	ldub	[%l7 + 0x39],	%g4
	fmovsneg	%xcc,	%f26,	%f25
	fmovscc	%xcc,	%f1,	%f9
	and	%o7,	0x04AF,	%g7
	fmovsn	%xcc,	%f25,	%f11
	fmovrdlez	%o5,	%f14,	%f6
	sdiv	%g2,	0x11FB,	%i3
	fsrc2	%f30,	%f4
	ldsh	[%l7 + 0x74],	%i4
	movn	%icc,	%l0,	%o3
	udivcc	%l3,	0x0AE6,	%l6
	std	%f26,	[%l7 + 0x30]
	movcc	%xcc,	%o6,	%l4
	for	%f14,	%f20,	%f24
	movre	%l5,	%i6,	%g1
	movrlez	%g3,	%g6,	%i7
	save %o4, %l2, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnors	%f21,	%f18,	%f7
	edge32l	%o2,	%i0,	%g5
	fcmpd	%fcc0,	%f8,	%f16
	movvc	%icc,	%i1,	%l1
	for	%f16,	%f28,	%f12
	xor	%i5,	%i2,	%o1
	srlx	%g4,	0x0F,	%o7
	movcc	%icc,	%o5,	%g7
	umul	%i3,	0x0558,	%i4
	addc	%l0,	0x1820,	%g2
	add	%l3,	0x091F,	%l6
	fmovsl	%xcc,	%f21,	%f13
	fmovsl	%icc,	%f2,	%f31
	nop
	set	0x62, %g7
	lduh	[%l7 + %g7],	%o3
	xnor	%l4,	%o6,	%i6
	movne	%xcc,	%l5,	%g3
	mulx	%g1,	0x0456,	%g6
	edge16n	%o4,	%i7,	%l2
	mova	%xcc,	%o0,	%i0
	umul	%o2,	0x1139,	%g5
	subccc	%l1,	0x0AB4,	%i1
	or	%i5,	0x0237,	%o1
	fmovrdgez	%g4,	%f14,	%f0
	addccc	%i2,	0x0A64,	%o5
	fcmpgt16	%f14,	%f28,	%o7
	save %i3, %g7, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i4,	%g2,	%l6
	edge16l	%o3,	%l4,	%l3
	lduh	[%l7 + 0x5A],	%o6
	nop
	set	0x0C, %o3
	ldsh	[%l7 + %o3],	%l5
	popc	0x156F,	%g3
	fmovrdgz	%i6,	%f30,	%f6
	ldx	[%l7 + 0x48],	%g6
	sir	0x13F9
	lduh	[%l7 + 0x76],	%g1
	or	%i7,	%l2,	%o4
	array16	%i0,	%o2,	%o0
	movvc	%xcc,	%g5,	%l1
	edge8	%i5,	%i1,	%g4
	popc	0x0EED,	%o1
	movneg	%xcc,	%i2,	%o5
	andncc	%i3,	%o7,	%l0
	alignaddr	%g7,	%g2,	%i4
	mulx	%o3,	%l4,	%l6
	movvc	%icc,	%o6,	%l3
	movge	%xcc,	%l5,	%g3
	lduh	[%l7 + 0x44],	%g6
	movleu	%xcc,	%i6,	%g1
	fornot2s	%f17,	%f15,	%f21
	stx	%i7,	[%l7 + 0x08]
	xnorcc	%l2,	0x0FA9,	%i0
	fmovdvs	%xcc,	%f22,	%f8
	edge16ln	%o4,	%o0,	%o2
	edge32n	%g5,	%i5,	%i1
	srl	%l1,	0x13,	%o1
	edge8l	%g4,	%o5,	%i2
	fpsub16	%f0,	%f10,	%f20
	movcs	%icc,	%o7,	%l0
	xorcc	%i3,	0x034B,	%g2
	movne	%xcc,	%i4,	%g7
	movre	%o3,	0x15C,	%l6
	edge8ln	%l4,	%o6,	%l5
	fmovsa	%xcc,	%f12,	%f1
	smulcc	%g3,	0x1B98,	%l3
	fxnor	%f10,	%f12,	%f20
	save %i6, 0x0F1A, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%i7,	0x1B9B,	%g1
	fandnot1	%f0,	%f4,	%f6
	srax	%i0,	%l2,	%o0
	fpmerge	%f16,	%f26,	%f14
	fmovrse	%o4,	%f9,	%f0
	lduw	[%l7 + 0x74],	%o2
	udiv	%i5,	0x0B47,	%i1
	xor	%l1,	0x1361,	%o1
	xor	%g5,	%o5,	%g4
	udivx	%i2,	0x0511,	%l0
	andcc	%i3,	%o7,	%g2
	fmovdvc	%icc,	%f15,	%f13
	fmovd	%f4,	%f16
	fxors	%f1,	%f23,	%f10
	bshuffle	%f6,	%f0,	%f8
	movneg	%xcc,	%g7,	%o3
	mulx	%i4,	%l6,	%l4
	array8	%l5,	%g3,	%l3
	movcs	%xcc,	%i6,	%o6
	movpos	%icc,	%g6,	%i7
	nop
	set	0x30, %o4
	std	%f20,	[%l7 + %o4]
	edge8ln	%i0,	%g1,	%o0
	smul	%l2,	0x05B1,	%o2
	orn	%o4,	%i1,	%l1
	std	%f8,	[%l7 + 0x08]
	fmovdvs	%xcc,	%f25,	%f11
	ldx	[%l7 + 0x20],	%o1
	andn	%g5,	0x1AB8,	%i5
	subcc	%o5,	0x0E89,	%g4
	add	%i2,	%i3,	%l0
	fones	%f11
	edge16n	%o7,	%g2,	%g7
	subccc	%i4,	0x054F,	%l6
	fmovrsne	%o3,	%f18,	%f9
	movvs	%icc,	%l4,	%l5
	add	%g3,	0x1584,	%i6
	orn	%o6,	%g6,	%l3
	fmovsvc	%icc,	%f4,	%f2
	movcc	%xcc,	%i0,	%i7
	edge32	%o0,	%g1,	%l2
	sub	%o2,	%i1,	%o4
	fpsub32s	%f1,	%f9,	%f18
	movleu	%xcc,	%l1,	%o1
	nop
	set	0x10, %l6
	ldd	[%l7 + %l6],	%i4
	pdist	%f20,	%f10,	%f26
	ldsh	[%l7 + 0x56],	%g5
	movcs	%icc,	%o5,	%g4
	ldsw	[%l7 + 0x28],	%i2
	sth	%l0,	[%l7 + 0x4A]
	andn	%i3,	0x190F,	%g2
	sub	%g7,	%i4,	%l6
	ldd	[%l7 + 0x20],	%o6
	orn	%l4,	%o3,	%g3
	srlx	%l5,	0x18,	%o6
	fors	%f18,	%f9,	%f29
	stx	%i6,	[%l7 + 0x60]
	umulcc	%l3,	0x1432,	%i0
	restore %i7, 0x19DD, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f9,	%f9,	%f26
	srl	%o0,	0x19,	%g1
	lduw	[%l7 + 0x5C],	%o2
	orcc	%i1,	%o4,	%l1
	sth	%l2,	[%l7 + 0x6A]
	ld	[%l7 + 0x5C],	%f5
	fmovsle	%xcc,	%f9,	%f9
	faligndata	%f2,	%f26,	%f26
	ldub	[%l7 + 0x47],	%i5
	movrlez	%o1,	0x1E5,	%o5
	ldsw	[%l7 + 0x08],	%g4
	pdist	%f8,	%f30,	%f16
	popc	%i2,	%l0
	addcc	%g5,	0x15D5,	%g2
	st	%f10,	[%l7 + 0x30]
	fcmpgt16	%f8,	%f4,	%i3
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	sll	%o7,	0x13,	%o3
	alignaddr	%l4,	%g3,	%l5
	fpadd16s	%f10,	%f14,	%f24
	sra	%o6,	0x0E,	%i6
	movre	%i0,	0x348,	%l3
	fmovdg	%icc,	%f19,	%f11
	smul	%i7,	0x1B11,	%o0
	smul	%g6,	%g1,	%o2
	andn	%i1,	%l1,	%o4
	mova	%icc,	%l2,	%i5
	orncc	%o5,	%o1,	%i2
	fxor	%f22,	%f10,	%f28
	st	%f12,	[%l7 + 0x38]
	fmovsneg	%icc,	%f24,	%f7
	udivx	%g4,	0x10A0,	%l0
	movneg	%icc,	%g5,	%i3
	fandnot1s	%f14,	%f16,	%f26
	restore %g2, 0x07B8, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%g7,	%i4
	umul	%o3,	%o7,	%g3
	fnot1s	%f30,	%f21
	udiv	%l4,	0x12CC,	%o6
	stb	%l5,	[%l7 + 0x52]
	array8	%i0,	%i6,	%l3
	edge32l	%o0,	%g6,	%i7
	edge32ln	%o2,	%g1,	%l1
	fcmple32	%f4,	%f12,	%i1
	srlx	%l2,	0x11,	%o4
	std	%f14,	[%l7 + 0x50]
	edge8ln	%i5,	%o1,	%o5
	subc	%g4,	%i2,	%l0
	smul	%i3,	%g5,	%g2
	edge8n	%g7,	%i4,	%l6
	fxor	%f4,	%f24,	%f26
	ldx	[%l7 + 0x30],	%o7
	movne	%xcc,	%g3,	%o3
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	fmovdle	%icc,	%f28,	%f14
	ldsb	[%l7 + 0x38],	%i0
	std	%f6,	[%l7 + 0x18]
	movrlz	%i6,	0x224,	%l3
	fors	%f13,	%f2,	%f8
	movrgz	%o0,	%g6,	%i7
	fpackfix	%f24,	%f23
	xnor	%o2,	%l5,	%l1
	udivx	%i1,	0x1BF6,	%g1
	edge8l	%l2,	%o4,	%o1
	sllx	%i5,	0x1E,	%g4
	udivcc	%i2,	0x0821,	%o5
	stb	%l0,	[%l7 + 0x4E]
	fabss	%f9,	%f1
	xnor	%i3,	0x00F5,	%g2
	sth	%g5,	[%l7 + 0x38]
	stb	%g7,	[%l7 + 0x18]
	fsrc1	%f30,	%f28
	edge8	%i4,	%o7,	%l6
	movcc	%xcc,	%o3,	%g3
	sllx	%o6,	0x0A,	%i0
	xorcc	%i6,	0x18B3,	%l4
	fpsub32s	%f28,	%f25,	%f14
	fnegd	%f18,	%f26
	alignaddrl	%o0,	%g6,	%i7
	edge16l	%o2,	%l5,	%l3
	fmovscc	%xcc,	%f1,	%f31
	movpos	%icc,	%i1,	%l1
	movg	%icc,	%l2,	%o4
	movvc	%xcc,	%g1,	%i5
	ldd	[%l7 + 0x10],	%f14
	std	%f12,	[%l7 + 0x48]
	srax	%g4,	%i2,	%o5
	move	%xcc,	%o1,	%i3
	fands	%f22,	%f26,	%f9
	edge8ln	%g2,	%l0,	%g5
	array16	%g7,	%i4,	%o7
	edge32l	%l6,	%o3,	%o6
	movvc	%icc,	%i0,	%i6
	smulcc	%g3,	0x1558,	%l4
	xorcc	%o0,	%i7,	%g6
	sethi	0x1A5C,	%l5
	ldub	[%l7 + 0x4B],	%o2
	sll	%l3,	%l1,	%i1
	fmovrsgez	%o4,	%f9,	%f11
	std	%f0,	[%l7 + 0x78]
	movrne	%l2,	%g1,	%g4
	movgu	%icc,	%i5,	%o5
	edge8	%i2,	%o1,	%i3
	fpsub32	%f22,	%f4,	%f24
	subcc	%l0,	0x12EB,	%g5
	array8	%g2,	%i4,	%o7
	xor	%g7,	%l6,	%o3
	stx	%i0,	[%l7 + 0x08]
	movvs	%xcc,	%i6,	%o6
	sub	%l4,	%o0,	%g3
	ldd	[%l7 + 0x30],	%g6
	andn	%i7,	%l5,	%l3
	edge16l	%l1,	%i1,	%o4
	or	%l2,	%o2,	%g4
	ldub	[%l7 + 0x11],	%i5
	sdivcc	%o5,	0x0698,	%i2
	ld	[%l7 + 0x2C],	%f27
	mova	%icc,	%o1,	%g1
	umulcc	%i3,	0x0C23,	%l0
	edge16	%g2,	%i4,	%g5
	movvs	%icc,	%g7,	%l6
	lduh	[%l7 + 0x7E],	%o3
	sll	%o7,	0x14,	%i6
	sth	%o6,	[%l7 + 0x60]
	movcc	%icc,	%l4,	%i0
	movgu	%xcc,	%o0,	%g3
	subc	%i7,	0x1206,	%g6
	stx	%l5,	[%l7 + 0x40]
	st	%f24,	[%l7 + 0x5C]
	movcs	%icc,	%l1,	%i1
	pdist	%f24,	%f18,	%f10
	fmovse	%xcc,	%f30,	%f8
	stb	%o4,	[%l7 + 0x66]
	movre	%l3,	%l2,	%o2
	movvs	%xcc,	%g4,	%i5
	fmovdvs	%icc,	%f8,	%f3
	xnor	%o5,	0x04E0,	%i2
	edge8ln	%o1,	%i3,	%l0
	fmovsleu	%icc,	%f5,	%f12
	movcc	%icc,	%g1,	%g2
	fmul8sux16	%f24,	%f22,	%f0
	fmovsvc	%xcc,	%f16,	%f4
	array16	%i4,	%g7,	%l6
	ld	[%l7 + 0x2C],	%f6
	ldub	[%l7 + 0x21],	%o3
	umulcc	%o7,	0x069E,	%g5
	edge32l	%i6,	%l4,	%i0
	fmul8ulx16	%f22,	%f0,	%f4
	fxnors	%f4,	%f21,	%f25
	andncc	%o6,	%o0,	%g3
	xorcc	%g6,	0x13AB,	%i7
	faligndata	%f26,	%f24,	%f4
	andcc	%l5,	0x1AEC,	%i1
	xnor	%o4,	0x0E2B,	%l3
	stb	%l2,	[%l7 + 0x34]
	udiv	%o2,	0x16C6,	%l1
	stw	%g4,	[%l7 + 0x5C]
	movne	%icc,	%o5,	%i5
	sethi	0x05D3,	%o1
	movcs	%xcc,	%i3,	%l0
	ldsw	[%l7 + 0x14],	%i2
	edge32n	%g2,	%i4,	%g1
	subc	%l6,	%g7,	%o3
	edge16	%o7,	%i6,	%l4
	edge16n	%i0,	%g5,	%o0
	save %g3, %o6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpmerge	%f2,	%f21,	%f26
	fmovdge	%icc,	%f24,	%f9
	fmovrslez	%l5,	%f27,	%f25
	alignaddr	%i7,	%i1,	%o4
	umul	%l2,	0x0EAF,	%l3
	srlx	%o2,	%g4,	%o5
	umulcc	%l1,	%o1,	%i3
	fmovda	%icc,	%f12,	%f12
	array16	%l0,	%i2,	%g2
	andcc	%i5,	%i4,	%g1
	sdivcc	%g7,	0x145E,	%o3
	srlx	%l6,	0x1B,	%o7
	sir	0x0ABC
	movneg	%icc,	%i6,	%i0
	subcc	%g5,	0x13ED,	%l4
	sdivcc	%g3,	0x102F,	%o0
	subc	%o6,	%l5,	%i7
	add	%g6,	0x0500,	%o4
	sth	%i1,	[%l7 + 0x0E]
	movcc	%xcc,	%l2,	%l3
	orcc	%g4,	0x1EA8,	%o2
	umul	%l1,	%o1,	%o5
	subccc	%l0,	%i3,	%g2
	sir	0x0FC8
	edge8	%i5,	%i4,	%g1
	srlx	%g7,	0x11,	%i2
	stw	%o3,	[%l7 + 0x10]
	ld	[%l7 + 0x28],	%f13
	ld	[%l7 + 0x24],	%f2
	fmovdcc	%icc,	%f15,	%f13
	fmovrde	%o7,	%f22,	%f16
	fmovsle	%icc,	%f3,	%f6
	fmovsge	%xcc,	%f20,	%f27
	std	%f4,	[%l7 + 0x40]
	ldub	[%l7 + 0x79],	%i6
	edge32n	%i0,	%g5,	%l4
	ldsb	[%l7 + 0x37],	%l6
	movcc	%icc,	%o0,	%g3
	restore %o6, 0x0DF1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	addcc	%i1,	%l2,	%l3
	udivcc	%g4,	0x08A7,	%g6
	st	%f1,	[%l7 + 0x5C]
	fmovdne	%xcc,	%f12,	%f25
	udivx	%o2,	0x097F,	%o1
	subcc	%o5,	%l1,	%l0
	fcmpes	%fcc2,	%f5,	%f3
	fpack32	%f0,	%f2,	%f24
	mulscc	%i3,	0x0261,	%i5
	mova	%icc,	%i4,	%g1
	ldsw	[%l7 + 0x28],	%g7
	add	%g2,	0x1EBF,	%i2
	mova	%xcc,	%o7,	%i6
	fpack16	%f16,	%f11
	smul	%o3,	0x1186,	%g5
	alignaddrl	%i0,	%l6,	%o0
	movcs	%xcc,	%l4,	%g3
	movrgz	%o6,	0x142,	%i7
	save %l5, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l3,	%i1,	%g6
	movvs	%icc,	%g4,	%o1
	xnor	%o5,	0x1197,	%o2
	mulscc	%l0,	0x1570,	%l1
	sethi	0x0EA0,	%i5
	ldd	[%l7 + 0x08],	%f0
	subc	%i4,	%i3,	%g1
	fmovdleu	%xcc,	%f27,	%f18
	movrgz	%g7,	0x0AA,	%i2
	andncc	%o7,	%i6,	%o3
	stb	%g5,	[%l7 + 0x08]
	fors	%f5,	%f5,	%f15
	fmovsn	%icc,	%f12,	%f14
	save %g2, %l6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l4,	0x169C,	%g3
	sll	%o6,	0x08,	%i7
	movvc	%xcc,	%l5,	%i0
	ldd	[%l7 + 0x18],	%f30
	mova	%xcc,	%l2,	%o4
	fmovrse	%l3,	%f24,	%f5
	srl	%g6,	%g4,	%i1
	addcc	%o5,	0x0A6F,	%o1
	add	%o2,	0x08D7,	%l0
	orn	%i5,	%l1,	%i3
	ldd	[%l7 + 0x08],	%f16
	srlx	%i4,	0x19,	%g1
	fmovsvs	%xcc,	%f29,	%f3
	subc	%i2,	0x094C,	%g7
	xnorcc	%o7,	0x12EE,	%o3
	xorcc	%g5,	0x03CA,	%i6
	lduh	[%l7 + 0x2A],	%g2
	ldsw	[%l7 + 0x38],	%o0
	edge16ln	%l4,	%g3,	%o6
	fmovscs	%icc,	%f11,	%f23
	fnand	%f16,	%f20,	%f12
	edge16ln	%l6,	%l5,	%i0
	xnor	%l2,	0x01E3,	%o4
	fpadd16s	%f4,	%f31,	%f18
	stb	%l3,	[%l7 + 0x62]
	movcs	%icc,	%g6,	%i7
	sethi	0x1E6F,	%i1
	ldsh	[%l7 + 0x1A],	%o5
	fpsub32s	%f13,	%f16,	%f0
	fmovdneg	%icc,	%f17,	%f4
	udivcc	%o1,	0x04B0,	%g4
	edge16	%o2,	%i5,	%l0
	edge32n	%i3,	%i4,	%l1
	addcc	%g1,	0x14BA,	%i2
	fpsub16	%f10,	%f28,	%f4
	edge8	%o7,	%g7,	%o3
	add	%i6,	%g5,	%g2
	fmovde	%xcc,	%f7,	%f5
	fmovsvs	%icc,	%f27,	%f31
	fsrc2s	%f27,	%f5
	smul	%l4,	0x1459,	%g3
	popc	0x0E72,	%o0
	orcc	%l6,	%l5,	%i0
	save %o6, 0x0AB0, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x4E],	%l3
	andn	%o4,	0x1EBB,	%i7
	fmovdneg	%xcc,	%f12,	%f12
	movvc	%icc,	%i1,	%o5
	ldsb	[%l7 + 0x17],	%o1
	udivcc	%g6,	0x0E9E,	%g4
	or	%i5,	%l0,	%o2
	xor	%i4,	0x15DF,	%i3
	add	%l1,	%g1,	%o7
	ldsw	[%l7 + 0x10],	%g7
	sll	%o3,	%i6,	%g5
	stb	%g2,	[%l7 + 0x6E]
	stw	%l4,	[%l7 + 0x18]
	fmovscs	%icc,	%f5,	%f2
	srax	%i2,	%o0,	%l6
	addcc	%l5,	%i0,	%g3
	sir	0x1313
	edge8n	%o6,	%l3,	%o4
	ldx	[%l7 + 0x40],	%i7
	movre	%i1,	0x3DC,	%o5
	movrne	%o1,	%l2,	%g6
	ldsb	[%l7 + 0x70],	%g4
	fmovdneg	%icc,	%f20,	%f26
	sllx	%i5,	%l0,	%i4
	umul	%o2,	%l1,	%g1
	fmovse	%icc,	%f0,	%f1
	alignaddrl	%o7,	%g7,	%o3
	fpackfix	%f18,	%f9
	or	%i3,	%i6,	%g2
	array32	%g5,	%l4,	%i2
	movrlez	%o0,	%l5,	%l6
	ldub	[%l7 + 0x54],	%i0
	fmovsl	%icc,	%f22,	%f8
	movrne	%o6,	%g3,	%o4
	udivcc	%i7,	0x0920,	%l3
	addcc	%o5,	0x172F,	%o1
	alignaddrl	%l2,	%g6,	%i1
	fnot2s	%f27,	%f1
	subc	%g4,	0x0A79,	%l0
	std	%f2,	[%l7 + 0x20]
	movge	%xcc,	%i4,	%i5
	movvs	%xcc,	%l1,	%g1
	edge16	%o7,	%o2,	%g7
	pdist	%f4,	%f10,	%f28
	andn	%i3,	0x0012,	%i6
	sll	%g2,	0x11,	%o3
	edge8	%l4,	%i2,	%g5
	sub	%l5,	%l6,	%i0
	andcc	%o0,	0x03ED,	%g3
	move	%icc,	%o6,	%i7
	xnorcc	%l3,	%o4,	%o5
	sth	%o1,	[%l7 + 0x22]
	movvc	%xcc,	%l2,	%i1
	stb	%g6,	[%l7 + 0x68]
	fmul8sux16	%f14,	%f26,	%f2
	lduh	[%l7 + 0x74],	%g4
	fmovsneg	%xcc,	%f16,	%f12
	edge32l	%l0,	%i4,	%i5
	alignaddr	%g1,	%l1,	%o2
	ldub	[%l7 + 0x1D],	%o7
	movleu	%icc,	%i3,	%g7
	edge32l	%g2,	%i6,	%o3
	umul	%i2,	0x1089,	%g5
	ldd	[%l7 + 0x68],	%f0
	ld	[%l7 + 0x2C],	%f23
	fxnors	%f5,	%f22,	%f20
	fandnot2s	%f24,	%f15,	%f20
	orn	%l4,	0x07A4,	%l6
	movn	%xcc,	%l5,	%o0
	fmovdvs	%icc,	%f18,	%f17
	fpack32	%f28,	%f30,	%f12
	movl	%icc,	%g3,	%o6
	move	%xcc,	%i0,	%l3
	restore %o4, %i7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%l2,	%o5,	%i1
	udiv	%g6,	0x1828,	%g4
	edge16n	%i4,	%l0,	%i5
	ldd	[%l7 + 0x08],	%l0
	fexpand	%f24,	%f2
	andn	%g1,	0x104C,	%o2
	sll	%o7,	%g7,	%i3
	ldsw	[%l7 + 0x7C],	%g2
	mulscc	%o3,	0x1B64,	%i2
	fmovdpos	%icc,	%f11,	%f22
	fmovrdlez	%i6,	%f2,	%f22
	sir	0x0AB0
	edge16ln	%l4,	%g5,	%l6
	movpos	%icc,	%o0,	%g3
	movl	%icc,	%o6,	%i0
	fpack16	%f22,	%f24
	movrlz	%l5,	%l3,	%i7
	edge8ln	%o1,	%l2,	%o5
	xor	%o4,	%i1,	%g4
	ldd	[%l7 + 0x10],	%g6
	fpadd32	%f18,	%f30,	%f0
	movne	%xcc,	%l0,	%i4
	srlx	%l1,	%i5,	%o2
	xor	%g1,	%g7,	%o7
	fmovdn	%icc,	%f18,	%f6
	andncc	%i3,	%g2,	%i2
	and	%o3,	%l4,	%g5
	sub	%i6,	%l6,	%o0
	movleu	%xcc,	%g3,	%i0
	edge8	%l5,	%o6,	%i7
	movl	%icc,	%l3,	%l2
	movrlez	%o1,	0x1DD,	%o4
	array16	%i1,	%o5,	%g4
	movrgz	%g6,	%i4,	%l0
	xorcc	%i5,	0x1DE3,	%o2
	fpsub16s	%f23,	%f16,	%f23
	edge16	%g1,	%l1,	%g7
	edge8ln	%o7,	%g2,	%i2
	sllx	%i3,	%l4,	%o3
	movrlz	%i6,	%g5,	%l6
	subc	%g3,	0x09B0,	%o0
	xnor	%i0,	%o6,	%l5
	or	%i7,	0x1A83,	%l2
	addcc	%o1,	0x1F05,	%l3
	fmovdcs	%xcc,	%f2,	%f15
	edge16l	%i1,	%o4,	%o5
	and	%g4,	0x149A,	%i4
	ldd	[%l7 + 0x60],	%g6
	movgu	%xcc,	%i5,	%l0
	for	%f12,	%f4,	%f6
	srlx	%o2,	%l1,	%g1
	sth	%o7,	[%l7 + 0x24]
	movrne	%g2,	0x023,	%g7
	edge16n	%i2,	%l4,	%i3
	movvc	%icc,	%i6,	%g5
	edge16	%l6,	%o3,	%g3
	stw	%i0,	[%l7 + 0x10]
	fxors	%f8,	%f20,	%f7
	movgu	%xcc,	%o6,	%o0
	srl	%l5,	0x0A,	%l2
	edge32l	%i7,	%o1,	%i1
	srlx	%o4,	0x09,	%l3
	edge8l	%g4,	%i4,	%o5
	nop
	set	0x32, %l5
	sth	%g6,	[%l7 + %l5]
	movle	%xcc,	%l0,	%o2
	alignaddr	%i5,	%l1,	%g1
	stx	%o7,	[%l7 + 0x78]
	sllx	%g7,	0x15,	%g2
	edge32ln	%l4,	%i3,	%i2
	array16	%i6,	%g5,	%o3
	xorcc	%g3,	0x1EDE,	%l6
	save %i0, 0x0858, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%l5,	%o0
	umulcc	%l2,	%o1,	%i1
	fmovse	%xcc,	%f22,	%f6
	fpsub16	%f4,	%f8,	%f10
	andncc	%o4,	%l3,	%i7
	fmovdcs	%icc,	%f30,	%f12
	fmul8x16au	%f8,	%f5,	%f10
	ldsb	[%l7 + 0x0D],	%i4
	movneg	%icc,	%o5,	%g4
	fsrc1	%f28,	%f16
	movn	%icc,	%g6,	%l0
	srlx	%i5,	%o2,	%l1
	xorcc	%g1,	0x0B99,	%o7
	siam	0x1
	add	%g7,	%g2,	%l4
	fnegd	%f12,	%f10
	sir	0x055B
	sllx	%i2,	%i6,	%i3
	edge32ln	%g5,	%o3,	%g3
	fmul8ulx16	%f22,	%f14,	%f2
	movle	%xcc,	%l6,	%i0
	udivx	%o6,	0x1F1F,	%l5
	fcmpd	%fcc1,	%f12,	%f30
	fmovsgu	%xcc,	%f12,	%f29
	fcmpes	%fcc2,	%f29,	%f2
	fornot2	%f2,	%f8,	%f16
	edge32ln	%l2,	%o0,	%o1
	srax	%i1,	0x1A,	%o4
	edge32ln	%l3,	%i4,	%i7
	popc	%g4,	%g6
	or	%l0,	0x0615,	%i5
	movrlz	%o2,	0x27E,	%l1
	or	%o5,	%o7,	%g7
	edge8ln	%g2,	%l4,	%i2
	edge16l	%g1,	%i6,	%i3
	ldub	[%l7 + 0x71],	%o3
	orcc	%g3,	%g5,	%l6
	sdiv	%i0,	0x1DE1,	%l5
	sdivx	%o6,	0x0E17,	%o0
	alignaddrl	%l2,	%i1,	%o1
	edge16ln	%l3,	%i4,	%i7
	ldsw	[%l7 + 0x78],	%o4
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	movrlez	%o2,	0x1AE,	%l1
	fxor	%f26,	%f4,	%f6
	lduw	[%l7 + 0x68],	%o5
	udiv	%i5,	0x038C,	%g7
	subcc	%o7,	%g2,	%i2
	ldd	[%l7 + 0x78],	%l4
	movrne	%i6,	%i3,	%o3
	orncc	%g1,	0x0A81,	%g3
	save %g5, 0x1D58, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%i0,	%o6,	%l5
	alignaddr	%l2,	%i1,	%o1
	fandnot1s	%f7,	%f27,	%f2
	movneg	%icc,	%l3,	%o0
	ldd	[%l7 + 0x48],	%f24
	or	%i4,	0x13B3,	%o4
	sethi	0x0657,	%g6
	andcc	%i7,	0x045B,	%g4
	restore %l0, 0x06B7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x1E],	%o5
	addccc	%i5,	0x0D05,	%g7
	umul	%o7,	%l1,	%i2
	movpos	%icc,	%g2,	%i6
	fmul8x16al	%f3,	%f31,	%f6
	stb	%i3,	[%l7 + 0x58]
	nop
	set	0x26, %i6
	ldub	[%l7 + %i6],	%o3
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	movvs	%xcc,	%l6,	%g5
	edge32	%i0,	%o6,	%l5
	ldsb	[%l7 + 0x67],	%i1
	orn	%o1,	0x18C2,	%l2
	nop
	set	0x3E, %g3
	stb	%o0,	[%l7 + %g3]
	orncc	%i4,	0x05AF,	%o4
	orn	%g6,	%l3,	%i7
	edge8l	%l0,	%g4,	%o5
	mulscc	%o2,	0x0957,	%i5
	and	%o7,	0x1345,	%g7
	ldx	[%l7 + 0x40],	%i2
	fcmped	%fcc0,	%f16,	%f14
	fmovdneg	%xcc,	%f16,	%f11
	movrgez	%g2,	%l1,	%i3
	fones	%f7
	fcmple32	%f24,	%f6,	%i6
	movrgez	%g1,	%o3,	%g3
	nop
	set	0x58, %l3
	ldx	[%l7 + %l3],	%l6
	fmovsvs	%xcc,	%f19,	%f8
	ld	[%l7 + 0x64],	%f22
	movle	%xcc,	%l4,	%i0
	movgu	%xcc,	%o6,	%l5
	edge8n	%i1,	%o1,	%g5
	srlx	%o0,	%i4,	%l2
	subc	%g6,	0x0B65,	%o4
	movneg	%icc,	%i7,	%l0
	edge32n	%l3,	%o5,	%o2
	orncc	%i5,	0x0CFA,	%g4
	restore %o7, %g7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l1,	%g2,	%i3
	fnot2s	%f16,	%f28
	smul	%i6,	%g1,	%g3
	subcc	%o3,	%l6,	%l4
	umul	%o6,	0x069E,	%l5
	save %i1, 0x1D93, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%o1,	%o0,	%i4
	smulcc	%l2,	%g6,	%o4
	sra	%i7,	%l0,	%g5
	edge32ln	%o5,	%o2,	%i5
	fone	%f26
	ldsh	[%l7 + 0x5C],	%g4
	sdiv	%l3,	0x0A36,	%o7
	edge32n	%g7,	%l1,	%g2
	smul	%i2,	%i3,	%i6
	edge32n	%g1,	%g3,	%o3
	movneg	%xcc,	%l6,	%o6
	array8	%l4,	%l5,	%i1
	smul	%i0,	0x0E32,	%o0
	popc	%o1,	%i4
	fmovdcs	%icc,	%f10,	%f16
	fone	%f26
	movn	%icc,	%l2,	%g6
	movg	%icc,	%o4,	%i7
	movrlz	%g5,	%o5,	%l0
	fmul8x16au	%f22,	%f27,	%f2
	save %o2, 0x0982, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0BB9,	%i5
	array16	%l3,	%o7,	%l1
	sllx	%g7,	0x19,	%g2
	movge	%icc,	%i3,	%i2
	sdivcc	%g1,	0x152F,	%i6
	smulcc	%g3,	0x12E3,	%o3
	alignaddr	%l6,	%l4,	%l5
	andn	%o6,	%i1,	%i0
	sdivcc	%o1,	0x1BA9,	%i4
	movcc	%icc,	%l2,	%o0
	sub	%g6,	0x0102,	%i7
	movrne	%o4,	%o5,	%l0
	srax	%g5,	0x06,	%o2
	edge16	%i5,	%l3,	%g4
	subc	%o7,	%g7,	%g2
	subccc	%i3,	%l1,	%g1
	fnor	%f8,	%f6,	%f4
	fxors	%f17,	%f20,	%f30
	ld	[%l7 + 0x44],	%f16
	udivcc	%i2,	0x02F3,	%g3
	andn	%o3,	0x0FCB,	%l6
	movcs	%icc,	%i6,	%l5
	fmovdvs	%xcc,	%f25,	%f16
	xnorcc	%o6,	0x0223,	%l4
	movrgez	%i0,	%o1,	%i4
	xorcc	%i1,	0x0572,	%l2
	lduh	[%l7 + 0x4A],	%o0
	movneg	%xcc,	%g6,	%i7
	xorcc	%o5,	0x1F1C,	%o4
	movpos	%xcc,	%g5,	%l0
	sll	%o2,	0x03,	%l3
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	edge32ln	%g2,	%i3,	%l1
	movrlez	%o7,	0x0EA,	%g1
	alignaddr	%g3,	%o3,	%i2
	fmovsne	%icc,	%f27,	%f17
	ldsb	[%l7 + 0x10],	%i6
	edge8n	%l6,	%l5,	%l4
	subc	%o6,	0x19E8,	%o1
	edge32	%i4,	%i0,	%l2
	fmovdg	%icc,	%f8,	%f29
	edge32ln	%o0,	%i1,	%i7
	subcc	%g6,	%o5,	%g5
	or	%o4,	%o2,	%l0
	movgu	%xcc,	%l3,	%i5
	movrgez	%g4,	0x21B,	%g2
	fsrc2	%f30,	%f10
	array32	%i3,	%g7,	%l1
	andncc	%g1,	%g3,	%o3
	movn	%icc,	%i2,	%o7
	fmovd	%f10,	%f28
	fmovda	%icc,	%f11,	%f14
	edge8ln	%l6,	%i6,	%l5
	mulscc	%l4,	0x14A5,	%o6
	sllx	%o1,	0x01,	%i0
	edge32ln	%l2,	%i4,	%i1
	restore %o0, %g6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpgt32	%f8,	%f4,	%g5
	smulcc	%o4,	0x1443,	%o2
	stx	%l0,	[%l7 + 0x70]
	sethi	0x02E4,	%l3
	edge32l	%i5,	%g4,	%g2
	udiv	%i7,	0x152E,	%g7
	fpmerge	%f9,	%f0,	%f12
	movn	%xcc,	%l1,	%i3
	movrne	%g1,	0x38E,	%g3
	andcc	%i2,	0x078B,	%o3
	sth	%o7,	[%l7 + 0x48]
	edge8ln	%i6,	%l6,	%l5
	lduh	[%l7 + 0x44],	%o6
	edge8l	%l4,	%i0,	%o1
	fnot2	%f0,	%f14
	sll	%l2,	0x0E,	%i4
	sdivx	%o0,	0x145D,	%i1
	movcs	%xcc,	%g6,	%g5
	addccc	%o4,	%o5,	%o2
	subccc	%l0,	0x1EA5,	%i5
	movrlez	%l3,	%g4,	%i7
	fpadd32	%f20,	%f12,	%f22
	fors	%f12,	%f28,	%f10
	pdist	%f20,	%f26,	%f30
	st	%f13,	[%l7 + 0x2C]
	ldd	[%l7 + 0x08],	%g2
	fmovsvc	%xcc,	%f25,	%f14
	movcc	%xcc,	%l1,	%i3
	or	%g1,	%g7,	%i2
	nop
	set	0x22, %l4
	lduh	[%l7 + %l4],	%o3
	fcmped	%fcc1,	%f20,	%f28
	edge8	%o7,	%i6,	%g3
	movpos	%xcc,	%l6,	%l5
	xnorcc	%o6,	%l4,	%o1
	udivcc	%l2,	0x1073,	%i4
	edge32n	%o0,	%i1,	%i0
	move	%xcc,	%g6,	%o4
	lduh	[%l7 + 0x28],	%g5
	orn	%o2,	%l0,	%i5
	xorcc	%l3,	%o5,	%i7
	orncc	%g2,	%l1,	%i3
	fmovsneg	%icc,	%f8,	%f9
	alignaddrl	%g1,	%g4,	%i2
	fmovdg	%icc,	%f4,	%f15
	addcc	%g7,	%o3,	%i6
	sir	0x1B4A
	xorcc	%o7,	0x0478,	%l6
	movrlez	%l5,	0x0A0,	%o6
	orncc	%g3,	%l4,	%l2
	umul	%o1,	0x0A68,	%o0
	fmovsle	%xcc,	%f8,	%f20
	edge32n	%i4,	%i1,	%g6
	smulcc	%i0,	%g5,	%o2
	addcc	%l0,	%i5,	%o4
	add	%l3,	%o5,	%g2
	sth	%l1,	[%l7 + 0x38]
	fxor	%f30,	%f28,	%f12
	array8	%i7,	%i3,	%g1
	sll	%i2,	%g7,	%g4
	st	%f1,	[%l7 + 0x30]
	movrgz	%i6,	0x232,	%o3
	edge16n	%l6,	%l5,	%o7
	movrgez	%g3,	%o6,	%l4
	sir	0x17DD
	array8	%o1,	%o0,	%i4
	movle	%xcc,	%l2,	%g6
	orcc	%i0,	0x1701,	%i1
	fmovdvs	%icc,	%f1,	%f2
	edge16ln	%g5,	%o2,	%l0
	edge16	%i5,	%l3,	%o4
	edge32n	%o5,	%g2,	%l1
	ldd	[%l7 + 0x68],	%i6
	alignaddrl	%i3,	%i2,	%g1
	fmul8sux16	%f18,	%f26,	%f30
	movrlez	%g7,	%i6,	%g4
	edge8	%o3,	%l6,	%o7
	array32	%l5,	%o6,	%l4
	sth	%g3,	[%l7 + 0x4C]
	sdivcc	%o0,	0x016B,	%o1
	umul	%i4,	%l2,	%i0
	ldd	[%l7 + 0x48],	%f10
	save %g6, 0x19F5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovspos	%icc,	%f31,	%f15
	sdivx	%o2,	0x1E67,	%l0
	movneg	%icc,	%g5,	%i5
	movrlz	%o4,	0x24E,	%l3
	sir	0x0BCC
	st	%f11,	[%l7 + 0x2C]
	fpadd32s	%f24,	%f19,	%f21
	edge8l	%g2,	%o5,	%l1
	addc	%i7,	0x1305,	%i3
	addcc	%i2,	0x1208,	%g1
	sub	%i6,	0x0F3C,	%g4
	sllx	%o3,	0x14,	%l6
	udivx	%o7,	0x17EA,	%l5
	array16	%g7,	%o6,	%g3
	fmovs	%f6,	%f16
	alignaddrl	%o0,	%l4,	%o1
	movl	%xcc,	%l2,	%i4
	fnot2	%f30,	%f16
	array32	%g6,	%i0,	%o2
	subccc	%i1,	%g5,	%i5
	fmuld8sux16	%f7,	%f2,	%f24
	sdivcc	%o4,	0x01E4,	%l3
	orncc	%g2,	%l0,	%o5
	ldsh	[%l7 + 0x76],	%l1
	movrlz	%i7,	0x379,	%i3
	alignaddr	%g1,	%i6,	%i2
	xnorcc	%o3,	0x02AB,	%g4
	array8	%o7,	%l5,	%g7
	nop
	set	0x34, %l1
	ldsb	[%l7 + %l1],	%o6
	movle	%xcc,	%l6,	%g3
	edge32l	%l4,	%o0,	%l2
	sdivcc	%o1,	0x0DE6,	%i4
	ldsh	[%l7 + 0x1C],	%g6
	movre	%i0,	0x2D2,	%i1
	movne	%xcc,	%o2,	%i5
	orncc	%g5,	0x1209,	%l3
	array8	%o4,	%l0,	%g2
	sra	%o5,	%i7,	%i3
	mulx	%g1,	%i6,	%l1
	smulcc	%o3,	0x1EA3,	%g4
	xorcc	%i2,	%o7,	%l5
	smul	%g7,	0x0C2A,	%l6
	movcs	%icc,	%o6,	%l4
	edge16	%g3,	%l2,	%o0
	sethi	0x174A,	%o1
	xorcc	%g6,	%i4,	%i1
	xnor	%o2,	%i5,	%i0
	popc	%l3,	%g5
	sdiv	%l0,	0x0D56,	%o4
	movneg	%xcc,	%o5,	%g2
	xnorcc	%i3,	%g1,	%i7
	srl	%i6,	0x16,	%l1
	edge16n	%g4,	%i2,	%o3
	sra	%o7,	%g7,	%l6
	addccc	%o6,	%l4,	%l5
	edge16l	%g3,	%l2,	%o1
	movrlez	%g6,	%i4,	%i1
	udivx	%o2,	0x0BB1,	%o0
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	fsrc2s	%f15,	%f4
	movneg	%xcc,	%i0,	%g5
	srl	%l0,	0x09,	%o5
	movne	%icc,	%o4,	%g2
	or	%i3,	%g1,	%i6
	mulx	%i7,	%g4,	%i2
	sethi	0x0185,	%l1
	movneg	%xcc,	%o3,	%g7
	nop
	set	0x10, %o1
	stw	%l6,	[%l7 + %o1]
	fsrc1s	%f9,	%f17
	fmovse	%icc,	%f19,	%f28
	sllx	%o6,	0x00,	%l4
	ldub	[%l7 + 0x61],	%o7
	movle	%icc,	%g3,	%l2
	sir	0x02D7
	stw	%o1,	[%l7 + 0x58]
	fxnors	%f25,	%f3,	%f3
	movge	%icc,	%l5,	%i4
	edge16l	%g6,	%i1,	%o0
	fmovdcc	%icc,	%f3,	%f15
	edge32n	%i5,	%o2,	%l3
	edge16l	%i0,	%g5,	%l0
	udivcc	%o4,	0x1039,	%g2
	edge32ln	%i3,	%g1,	%i6
	edge16ln	%o5,	%i7,	%g4
	mulx	%l1,	0x0657,	%o3
	fmovdleu	%xcc,	%f29,	%f7
	edge16ln	%g7,	%i2,	%o6
	fmovdcs	%xcc,	%f26,	%f0
	fpsub32	%f10,	%f26,	%f16
	movcc	%xcc,	%l4,	%l6
	movre	%o7,	0x1ED,	%g3
	edge32l	%l2,	%o1,	%l5
	st	%f3,	[%l7 + 0x28]
	orncc	%g6,	0x0F30,	%i4
	smulcc	%o0,	0x108E,	%i5
	edge16l	%o2,	%i1,	%l3
	xor	%g5,	0x050E,	%l0
	stw	%i0,	[%l7 + 0x18]
	umulcc	%o4,	0x1BE4,	%g2
	sdivcc	%i3,	0x1726,	%i6
	edge16	%g1,	%o5,	%i7
	movne	%xcc,	%g4,	%o3
	fmovsneg	%xcc,	%f29,	%f0
	movcc	%xcc,	%l1,	%i2
	movrlez	%o6,	0x3E7,	%l4
	xnor	%g7,	%l6,	%g3
	addccc	%l2,	0x1302,	%o1
	ldd	[%l7 + 0x30],	%f16
	fzeros	%f16
	edge16n	%l5,	%g6,	%i4
	addc	%o0,	%i5,	%o2
	fmovrsne	%o7,	%f24,	%f0
	orn	%l3,	%i1,	%g5
	fcmpne16	%f24,	%f8,	%i0
	fmovd	%f4,	%f6
	fsrc1	%f14,	%f26
	movge	%icc,	%l0,	%g2
	movrgz	%i3,	%i6,	%o4
	udivx	%g1,	0x1ED1,	%i7
	move	%icc,	%g4,	%o5
	ldx	[%l7 + 0x58],	%o3
	movvc	%icc,	%l1,	%o6
	fsrc1s	%f28,	%f26
	fmovrsne	%i2,	%f12,	%f16
	ldsw	[%l7 + 0x08],	%l4
	ld	[%l7 + 0x24],	%f8
	udivx	%l6,	0x13EF,	%g7
	ld	[%l7 + 0x38],	%f10
	sir	0x1E7A
	subc	%g3,	0x06A7,	%o1
	ldsw	[%l7 + 0x1C],	%l5
	movgu	%icc,	%l2,	%g6
	movne	%xcc,	%o0,	%i4
	fmovda	%icc,	%f20,	%f25
	movg	%xcc,	%o2,	%i5
	add	%l3,	%o7,	%g5
	ldd	[%l7 + 0x08],	%i0
	sir	0x1648
	movl	%xcc,	%l0,	%i0
	movg	%xcc,	%g2,	%i3
	xnorcc	%i6,	0x04F9,	%g1
	edge16	%i7,	%o4,	%o5
	ldd	[%l7 + 0x40],	%g4
	sdivcc	%o3,	0x12A4,	%o6
	movrne	%i2,	0x18E,	%l1
	xnorcc	%l4,	0x19F2,	%g7
	xorcc	%l6,	0x1A3A,	%g3
	movrlz	%o1,	%l2,	%g6
	and	%l5,	%i4,	%o2
	fmul8sux16	%f8,	%f22,	%f0
	fandnot1s	%f22,	%f29,	%f13
	fmovsleu	%xcc,	%f16,	%f20
	edge8n	%o0,	%i5,	%o7
	movn	%icc,	%g5,	%i1
	movge	%icc,	%l3,	%i0
	edge8l	%g2,	%i3,	%l0
	fmovrde	%g1,	%f28,	%f8
	edge32l	%i7,	%i6,	%o4
	smulcc	%g4,	%o5,	%o3
	movleu	%icc,	%o6,	%i2
	orcc	%l4,	%l1,	%l6
	fmovsne	%xcc,	%f18,	%f31
	addccc	%g3,	0x05BC,	%g7
	for	%f6,	%f22,	%f16
	subccc	%l2,	%g6,	%l5
	st	%f16,	[%l7 + 0x34]
	sllx	%o1,	0x00,	%o2
	sll	%i4,	%o0,	%i5
	stx	%o7,	[%l7 + 0x30]
	movgu	%icc,	%g5,	%i1
	sir	0x1806
	alignaddrl	%i0,	%g2,	%i3
	fmovsleu	%xcc,	%f22,	%f22
	alignaddr	%l0,	%g1,	%i7
	alignaddr	%i6,	%o4,	%g4
	fmovdcc	%icc,	%f19,	%f3
	movneg	%xcc,	%o5,	%o3
	fcmpne32	%f14,	%f22,	%o6
	fabss	%f29,	%f15
	fmul8x16	%f18,	%f14,	%f12
	sdivx	%i2,	0x1627,	%l3
	fmovrslz	%l1,	%f31,	%f23
	movvc	%icc,	%l6,	%l4
	movvc	%xcc,	%g7,	%l2
	orn	%g3,	0x0BEA,	%g6
	movn	%xcc,	%l5,	%o1
	save %i4, 0x1CA7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i5,	0x1612,	%o7
	array16	%g5,	%o0,	%i0
	fabss	%f12,	%f21
	udivx	%i1,	0x1224,	%i3
	movl	%icc,	%l0,	%g1
	movle	%icc,	%i7,	%g2
	ld	[%l7 + 0x70],	%f21
	movrgez	%i6,	0x02C,	%g4
	fmovdl	%icc,	%f16,	%f0
	movleu	%icc,	%o4,	%o5
	andncc	%o6,	%o3,	%i2
	mulscc	%l3,	%l6,	%l4
	movrne	%l1,	0x1DE,	%g7
	addccc	%l2,	%g3,	%g6
	movrlez	%o1,	%i4,	%l5
	edge32ln	%i5,	%o7,	%o2
	save %o0, %g5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i3,	0x1F73,	%l0
	lduh	[%l7 + 0x5E],	%i0
	fmovdleu	%xcc,	%f31,	%f1
	sllx	%i7,	%g2,	%g1
	andncc	%i6,	%g4,	%o5
	popc	%o4,	%o6
	fmovsge	%xcc,	%f3,	%f19
	stw	%i2,	[%l7 + 0x40]
	subcc	%o3,	0x0E08,	%l6
	sdivx	%l3,	0x055A,	%l4
	alignaddrl	%g7,	%l2,	%g3
	movneg	%icc,	%l1,	%g6
	subcc	%o1,	%i4,	%i5
	mulscc	%l5,	0x0911,	%o2
	stw	%o7,	[%l7 + 0x18]
	fcmpeq16	%f22,	%f24,	%g5
	edge16	%i1,	%i3,	%o0
	fmul8x16au	%f7,	%f25,	%f14
	ldx	[%l7 + 0x18],	%l0
	fpackfix	%f14,	%f26
	udiv	%i7,	0x1473,	%i0
	ldsh	[%l7 + 0x60],	%g1
	fzeros	%f19
	edge16l	%i6,	%g4,	%g2
	fpmerge	%f15,	%f7,	%f16
	stx	%o4,	[%l7 + 0x58]
	array32	%o5,	%o6,	%i2
	array32	%l6,	%l3,	%o3
	smul	%g7,	0x14D2,	%l4
	mova	%icc,	%l2,	%l1
	ld	[%l7 + 0x24],	%f9
	nop
	set	0x42, %g4
	lduh	[%l7 + %g4],	%g3
	udivcc	%g6,	0x0581,	%o1
	fmovspos	%xcc,	%f9,	%f15
	alignaddr	%i5,	%i4,	%l5
	xor	%o2,	%g5,	%o7
	xor	%i1,	%o0,	%i3
	movneg	%xcc,	%i7,	%i0
	sdivx	%l0,	0x1102,	%i6
	smulcc	%g1,	0x061D,	%g4
	restore %o4, 0x1D68, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0349,	%g2
	fxors	%f10,	%f9,	%f2
	udiv	%o6,	0x1268,	%i2
	edge32ln	%l6,	%o3,	%g7
	fcmpeq32	%f22,	%f0,	%l3
	movl	%xcc,	%l2,	%l1
	sethi	0x0686,	%l4
	ld	[%l7 + 0x28],	%f7
	umul	%g3,	0x0E41,	%g6
	fmovsle	%xcc,	%f8,	%f5
	alignaddr	%i5,	%o1,	%i4
	movle	%icc,	%l5,	%g5
	andn	%o7,	%o2,	%o0
	andcc	%i1,	0x1BE2,	%i7
	ld	[%l7 + 0x68],	%f17
	movrne	%i3,	0x1A6,	%l0
	fnot1	%f16,	%f2
	movcs	%icc,	%i6,	%i0
	sllx	%g1,	0x13,	%g4
	fmovdpos	%icc,	%f18,	%f0
	fmovsge	%icc,	%f10,	%f6
	or	%o5,	0x0786,	%o4
	edge8ln	%o6,	%g2,	%i2
	ldsw	[%l7 + 0x68],	%o3
	smul	%l6,	0x1EE4,	%l3
	srl	%l2,	%g7,	%l4
	movne	%icc,	%l1,	%g6
	sdivx	%i5,	0x0C76,	%g3
	movre	%o1,	%l5,	%g5
	fmovdvs	%xcc,	%f10,	%f5
	fmovdcc	%icc,	%f14,	%f27
	fmuld8sux16	%f3,	%f12,	%f8
	subc	%o7,	0x1F13,	%o2
	save %i4, %i1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgez	%i3,	%f5,	%f12
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	umul	%i7,	0x1AF6,	%i0
	ldd	[%l7 + 0x48],	%f26
	movcs	%xcc,	%g1,	%o5
	fmovdvs	%icc,	%f7,	%f21
	movrlz	%o4,	0x2A1,	%o6
	array8	%g2,	%g4,	%i2
	movrlz	%l6,	0x31D,	%l3
	fmovdpos	%icc,	%f18,	%f30
	or	%l2,	0x1DA5,	%o3
	edge16n	%g7,	%l1,	%g6
	fand	%f22,	%f12,	%f24
	sllx	%l4,	0x0E,	%g3
	subccc	%o1,	0x0AF6,	%l5
	nop
	set	0x08, %i4
	stw	%i5,	[%l7 + %i4]
	orncc	%o7,	0x1005,	%o2
	sethi	0x00A2,	%g5
	move	%icc,	%i4,	%i1
	movg	%icc,	%i3,	%o0
	array8	%l0,	%i6,	%i0
	movpos	%icc,	%g1,	%i7
	fcmpes	%fcc1,	%f21,	%f8
	movrne	%o4,	%o5,	%o6
	fands	%f31,	%f1,	%f16
	edge16n	%g4,	%g2,	%l6
	movrlz	%i2,	%l3,	%l2
	sra	%g7,	%l1,	%o3
	edge16l	%g6,	%l4,	%g3
	fmovdg	%xcc,	%f16,	%f18
	fmovse	%xcc,	%f2,	%f4
	fmovsn	%icc,	%f16,	%f16
	sra	%o1,	%i5,	%o7
	movvc	%xcc,	%l5,	%o2
	movrne	%g5,	%i4,	%i1
	fmul8x16al	%f26,	%f22,	%f2
	restore %i3, 0x1147, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x51, %i3
	ldub	[%l7 + %i3],	%l0
	ldx	[%l7 + 0x28],	%i0
	edge16ln	%g1,	%i7,	%o4
	umulcc	%i6,	0x1C42,	%o5
	edge32	%g4,	%o6,	%g2
	stb	%l6,	[%l7 + 0x76]
	edge32n	%l3,	%i2,	%g7
	andn	%l2,	0x01F0,	%l1
	alignaddrl	%o3,	%g6,	%l4
	movneg	%xcc,	%g3,	%i5
	array16	%o7,	%o1,	%l5
	srl	%o2,	%g5,	%i4
	edge8	%i1,	%i3,	%l0
	fnot2	%f2,	%f6
	movg	%icc,	%o0,	%i0
	addccc	%g1,	0x17C6,	%i7
	ld	[%l7 + 0x58],	%f28
	fmovdl	%icc,	%f30,	%f29
	sll	%i6,	%o4,	%o5
	movrne	%g4,	%o6,	%g2
	nop
	set	0x4C, %g1
	ldsb	[%l7 + %g1],	%l6
	smulcc	%l3,	%i2,	%l2
	ldsh	[%l7 + 0x6A],	%g7
	xnorcc	%o3,	0x0960,	%l1
	movleu	%icc,	%l4,	%g6
	movl	%icc,	%g3,	%o7
	movleu	%icc,	%o1,	%l5
	movrne	%i5,	0x06B,	%g5
	sdivcc	%o2,	0x11EA,	%i1
	add	%i3,	%l0,	%o0
	subc	%i0,	0x09D6,	%i4
	movrgz	%i7,	0x162,	%i6
	save %g1, %o4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f8,	%f16
	fcmple16	%f14,	%f10,	%g4
	srax	%o6,	0x0D,	%g2
	popc	%l6,	%i2
	sdivcc	%l3,	0x0BCD,	%g7
	umulcc	%l2,	0x0AB3,	%l1
	orcc	%o3,	%g6,	%g3
	srax	%o7,	0x02,	%l4
	ldub	[%l7 + 0x36],	%l5
	ldub	[%l7 + 0x16],	%o1
	sth	%g5,	[%l7 + 0x18]
	st	%f17,	[%l7 + 0x18]
	udivcc	%i5,	0x0DB4,	%i1
	edge32n	%o2,	%l0,	%o0
	sir	0x0473
	addcc	%i3,	0x1763,	%i0
	fmovsn	%xcc,	%f9,	%f2
	st	%f14,	[%l7 + 0x28]
	edge16ln	%i7,	%i4,	%i6
	xnorcc	%g1,	0x18EC,	%o5
	fcmpd	%fcc0,	%f26,	%f22
	alignaddrl	%o4,	%o6,	%g2
	srl	%l6,	0x1B,	%i2
	edge16l	%g4,	%g7,	%l2
	popc	%l3,	%o3
	orcc	%l1,	0x1FC6,	%g6
	fmovd	%f24,	%f28
	fmovsneg	%xcc,	%f22,	%f28
	fcmpne16	%f8,	%f6,	%o7
	sra	%g3,	%l4,	%l5
	smulcc	%g5,	%o1,	%i5
	edge32ln	%o2,	%i1,	%l0
	alignaddr	%o0,	%i0,	%i3
	alignaddr	%i7,	%i6,	%g1
	sethi	0x1FE1,	%i4
	movrlz	%o5,	%o4,	%o6
	fmovsg	%icc,	%f7,	%f8
	movrgz	%g2,	0x115,	%l6
	andncc	%g4,	%i2,	%l2
	mulx	%g7,	0x080F,	%o3
	addccc	%l1,	%l3,	%g6
	array32	%g3,	%o7,	%l5
	save %l4, 0x12B8, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrsgz	%g5,	%f6,	%f31
	fmovrsne	%o2,	%f20,	%f19
	edge8l	%i5,	%l0,	%i1
	fandnot1s	%f26,	%f14,	%f5
	mulscc	%o0,	%i3,	%i0
	fmovsgu	%xcc,	%f25,	%f29
	sub	%i7,	0x12AD,	%g1
	sra	%i4,	0x02,	%o5
	edge8	%i6,	%o4,	%g2
	fmovdpos	%xcc,	%f22,	%f29
	edge32l	%l6,	%o6,	%i2
	movl	%icc,	%l2,	%g7
	orncc	%g4,	%o3,	%l3
	popc	0x1499,	%l1
	edge8l	%g3,	%o7,	%g6
	movn	%icc,	%l4,	%l5
	fmovsge	%icc,	%f8,	%f19
	lduh	[%l7 + 0x0C],	%g5
	ldsh	[%l7 + 0x4E],	%o1
	array8	%o2,	%i5,	%i1
	orcc	%o0,	0x1259,	%l0
	ld	[%l7 + 0x5C],	%f23
	edge32l	%i0,	%i7,	%g1
	fornot1s	%f25,	%f13,	%f22
	sra	%i4,	%i3,	%o5
	fcmple32	%f22,	%f26,	%o4
	fcmpes	%fcc0,	%f21,	%f10
	faligndata	%f26,	%f18,	%f26
	popc	%g2,	%l6
	add	%i6,	0x1D50,	%i2
	or	%l2,	%g7,	%g4
	movl	%icc,	%o3,	%l3
	movre	%l1,	0x39D,	%o6
	edge32n	%o7,	%g6,	%l4
	fcmps	%fcc2,	%f26,	%f29
	edge16	%l5,	%g3,	%o1
	fmovsgu	%icc,	%f9,	%f16
	and	%g5,	%i5,	%o2
	move	%xcc,	%o0,	%l0
	movcs	%icc,	%i0,	%i7
	stb	%g1,	[%l7 + 0x3A]
	subccc	%i4,	%i3,	%o5
	edge16n	%i1,	%g2,	%l6
	fmovda	%icc,	%f23,	%f26
	fnand	%f28,	%f6,	%f0
	edge32n	%i6,	%i2,	%l2
	addccc	%o4,	%g7,	%g4
	sth	%l3,	[%l7 + 0x12]
	nop
	set	0x32, %i5
	ldsb	[%l7 + %i5],	%o3
	fmovrde	%l1,	%f18,	%f12
	movne	%xcc,	%o7,	%g6
	fmuld8ulx16	%f0,	%f20,	%f12
	movre	%o6,	%l5,	%l4
	andcc	%o1,	0x0284,	%g3
	array32	%g5,	%o2,	%i5
	subc	%o0,	0x0BA6,	%l0
	sdivcc	%i0,	0x1E83,	%g1
	sub	%i4,	%i7,	%o5
	udivcc	%i3,	0x1DBE,	%i1
	movrlz	%l6,	0x018,	%i6
	ldsh	[%l7 + 0x3A],	%i2
	movcc	%xcc,	%l2,	%g2
	xnorcc	%g7,	0x1142,	%g4
	edge32n	%l3,	%o4,	%l1
	fmovd	%f30,	%f26
	movvs	%icc,	%o7,	%o3
	subccc	%o6,	%g6,	%l4
	srlx	%l5,	0x0C,	%g3
	sdivx	%g5,	0x157B,	%o2
	edge16l	%i5,	%o0,	%l0
	fxor	%f30,	%f28,	%f18
	addc	%i0,	0x041F,	%g1
	ld	[%l7 + 0x24],	%f13
	orncc	%o1,	0x0229,	%i4
	andncc	%o5,	%i7,	%i1
	smul	%i3,	%l6,	%i6
	fpsub16s	%f16,	%f4,	%f5
	sdivx	%l2,	0x02AE,	%i2
	ldd	[%l7 + 0x58],	%g6
	fmul8x16au	%f0,	%f22,	%f8
	andn	%g4,	%g2,	%o4
	orcc	%l1,	0x0DE1,	%l3
	ld	[%l7 + 0x54],	%f15
	edge32l	%o3,	%o7,	%g6
	edge32	%l4,	%l5,	%o6
	sdiv	%g5,	0x149D,	%g3
	edge32ln	%o2,	%i5,	%l0
	stx	%o0,	[%l7 + 0x60]
	save %g1, 0x0BCB, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i4,	%i0,	%i7
	move	%xcc,	%i1,	%i3
	fmovrdlez	%l6,	%f8,	%f6
	fpack32	%f8,	%f26,	%f10
	fmovsvc	%xcc,	%f2,	%f16
	stw	%i6,	[%l7 + 0x08]
	array16	%o5,	%l2,	%i2
	movpos	%xcc,	%g4,	%g2
	array32	%g7,	%l1,	%l3
	sll	%o4,	0x16,	%o3
	fmovscc	%xcc,	%f15,	%f11
	sth	%g6,	[%l7 + 0x7C]
	subccc	%o7,	0x093A,	%l4
	ldd	[%l7 + 0x58],	%f26
	xnor	%o6,	0x1843,	%g5
	sub	%l5,	0x0AC2,	%g3
	fabss	%f17,	%f27
	udiv	%o2,	0x1C95,	%i5
	array16	%l0,	%g1,	%o1
	movre	%o0,	0x21B,	%i4
	fmovdn	%xcc,	%f19,	%f20
	fmovse	%xcc,	%f26,	%f2
	stb	%i7,	[%l7 + 0x69]
	edge16	%i0,	%i1,	%i3
	udivcc	%i6,	0x0C6D,	%l6
	srax	%o5,	%i2,	%g4
	stb	%l2,	[%l7 + 0x14]
	edge8	%g2,	%l1,	%l3
	movle	%xcc,	%g7,	%o3
	sir	0x1C52
	fand	%f0,	%f2,	%f16
	movneg	%xcc,	%o4,	%o7
	fcmple32	%f14,	%f24,	%l4
	andn	%g6,	%o6,	%g5
	xorcc	%l5,	0x16D1,	%o2
	movrgz	%i5,	%l0,	%g1
	edge32ln	%g3,	%o1,	%i4
	fornot1	%f22,	%f26,	%f22
	movre	%o0,	%i0,	%i1
	movne	%xcc,	%i7,	%i6
	ldd	[%l7 + 0x48],	%i2
	movcc	%icc,	%l6,	%o5
	and	%g4,	0x03BF,	%i2
	addc	%g2,	0x004D,	%l1
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	ldd	[%l7 + 0x50],	%f6
	fmuld8sux16	%f19,	%f22,	%f20
	fcmps	%fcc1,	%f9,	%f14
	movrne	%g7,	%o4,	%o7
	fcmpne16	%f28,	%f4,	%o3
	fmuld8sux16	%f24,	%f11,	%f0
	movne	%icc,	%g6,	%o6
	sra	%g5,	0x07,	%l4
	nop
	set	0x60, %l2
	ldsh	[%l7 + %l2],	%o2
	orn	%i5,	%l5,	%g1
	edge8ln	%l0,	%g3,	%o1
	movre	%i4,	0x196,	%o0
	movneg	%icc,	%i0,	%i7
	std	%f14,	[%l7 + 0x28]
	umulcc	%i6,	%i3,	%l6
	movrlez	%o5,	0x1D3,	%g4
	movl	%icc,	%i1,	%g2
	movrlz	%l1,	0x080,	%i2
	sdivcc	%l2,	0x0393,	%g7
	movg	%icc,	%l3,	%o4
	edge8l	%o7,	%o3,	%g6
	movneg	%xcc,	%o6,	%l4
	fmovdcc	%icc,	%f3,	%f17
	edge32	%o2,	%i5,	%g5
	fnands	%f19,	%f6,	%f28
	edge16	%l5,	%l0,	%g3
	movrgz	%o1,	0x18C,	%g1
	fmovrslez	%i4,	%f29,	%f31
	edge16l	%o0,	%i0,	%i6
	movgu	%icc,	%i3,	%i7
	array16	%o5,	%l6,	%i1
	sllx	%g4,	%g2,	%l1
	fandnot1	%f18,	%f8,	%f28
	array32	%i2,	%g7,	%l3
	xnor	%o4,	0x0B50,	%o7
	lduw	[%l7 + 0x64],	%l2
	fmuld8ulx16	%f25,	%f11,	%f0
	udivx	%g6,	0x0C8D,	%o3
	movre	%o6,	%l4,	%i5
	fmovrdlez	%o2,	%f14,	%f22
	alignaddrl	%l5,	%g5,	%g3
	save %o1, 0x0B57, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%l0,	%i4
	edge8n	%i0,	%o0,	%i6
	sdiv	%i7,	0x04DB,	%o5
	movge	%xcc,	%i3,	%i1
	edge8	%l6,	%g4,	%g2
	srax	%i2,	%g7,	%l1
	subcc	%l3,	0x1D9E,	%o4
	popc	%o7,	%g6
	or	%o3,	%l2,	%l4
	fpsub32	%f16,	%f20,	%f0
	ldd	[%l7 + 0x58],	%f6
	ldx	[%l7 + 0x38],	%o6
	movre	%o2,	0x25B,	%l5
	movrlz	%i5,	0x1F4,	%g3
	xnorcc	%g5,	%o1,	%l0
	subcc	%g1,	0x003B,	%i4
	fcmple32	%f20,	%f0,	%o0
	mulx	%i0,	%i6,	%i7
	sdivx	%i3,	0x044E,	%o5
	subcc	%i1,	0x15EA,	%g4
	fpadd32s	%f12,	%f11,	%f19
	movn	%xcc,	%g2,	%i2
	fsrc1	%f18,	%f30
	std	%f6,	[%l7 + 0x50]
	mova	%icc,	%g7,	%l6
	nop
	set	0x40, %i2
	ldsh	[%l7 + %i2],	%l3
	movrne	%l1,	0x2AF,	%o4
	alignaddrl	%o7,	%g6,	%l2
	movrlez	%l4,	0x10F,	%o6
	sub	%o2,	0x159C,	%l5
	subccc	%o3,	%i5,	%g5
	ldd	[%l7 + 0x48],	%f12
	lduh	[%l7 + 0x0A],	%o1
	mova	%xcc,	%l0,	%g1
	alignaddr	%i4,	%o0,	%g3
	stw	%i6,	[%l7 + 0x44]
	andn	%i0,	%i3,	%o5
	edge32ln	%i7,	%i1,	%g4
	or	%i2,	0x1E20,	%g2
	srlx	%g7,	%l6,	%l3
	move	%xcc,	%o4,	%l1
	edge8n	%o7,	%g6,	%l2
	mulscc	%l4,	%o2,	%o6
	fornot2	%f24,	%f18,	%f16
	movneg	%xcc,	%l5,	%o3
	subccc	%i5,	0x1651,	%g5
	fmovrdgz	%l0,	%f0,	%f4
	movrgz	%o1,	%g1,	%o0
	fmovsg	%xcc,	%f6,	%f8
	bshuffle	%f28,	%f12,	%f14
	subccc	%i4,	%i6,	%g3
	udivx	%i0,	0x0C48,	%o5
	addcc	%i3,	0x0A5F,	%i7
	mulscc	%i1,	%g4,	%g2
	move	%icc,	%i2,	%l6
	lduh	[%l7 + 0x10],	%g7
	ldx	[%l7 + 0x18],	%o4
	fmovscc	%icc,	%f18,	%f4
	movre	%l3,	%o7,	%g6
	and	%l1,	%l4,	%l2
	addccc	%o2,	%l5,	%o6
	fmovde	%icc,	%f8,	%f25
	edge8l	%i5,	%o3,	%g5
	array32	%l0,	%o1,	%o0
	mova	%icc,	%g1,	%i6
	edge32	%i4,	%i0,	%g3
	alignaddr	%o5,	%i7,	%i1
	ldd	[%l7 + 0x78],	%f10
	ldd	[%l7 + 0x08],	%f22
	sdiv	%g4,	0x1473,	%i3
	nop
	set	0x50, %g2
	std	%f26,	[%l7 + %g2]
	addc	%i2,	0x10B7,	%l6
	addc	%g2,	%o4,	%l3
	fmovrse	%o7,	%f10,	%f2
	xnor	%g7,	0x060B,	%l1
	andcc	%g6,	%l2,	%o2
	edge8ln	%l5,	%l4,	%i5
	popc	%o6,	%o3
	xnorcc	%l0,	0x05AC,	%g5
	udiv	%o1,	0x09D7,	%o0
	sllx	%g1,	0x08,	%i4
	subcc	%i0,	%g3,	%i6
	edge8l	%o5,	%i1,	%i7
	andcc	%i3,	0x0BCB,	%i2
	xnor	%l6,	%g4,	%g2
	smul	%l3,	0x050F,	%o4
	stx	%o7,	[%l7 + 0x68]
	andcc	%l1,	0x17C8,	%g6
	xor	%g7,	%l2,	%o2
	or	%l4,	%i5,	%o6
	movvc	%xcc,	%l5,	%o3
	fmuld8sux16	%f29,	%f20,	%f20
	fmovdg	%xcc,	%f8,	%f27
	fabsd	%f14,	%f16
	and	%l0,	%g5,	%o1
	srl	%o0,	%g1,	%i4
	addcc	%i0,	%i6,	%g3
	udivcc	%o5,	0x01AA,	%i1
	srax	%i7,	%i3,	%l6
	move	%xcc,	%i2,	%g4
	edge8	%l3,	%o4,	%g2
	fzero	%f8
	or	%l1,	0x06EF,	%o7
	xorcc	%g7,	%l2,	%g6
	smul	%l4,	0x0A52,	%i5
	orncc	%o6,	%l5,	%o2
	xnorcc	%l0,	0x136B,	%o3
	udiv	%o1,	0x107D,	%g5
	movg	%icc,	%g1,	%o0
	array16	%i4,	%i6,	%g3
	sdivcc	%i0,	0x0F1D,	%o5
	srlx	%i7,	0x11,	%i1
	edge8l	%l6,	%i3,	%g4
	lduh	[%l7 + 0x52],	%i2
	xnor	%o4,	%g2,	%l1
	fmovsn	%icc,	%f3,	%f22
	stw	%o7,	[%l7 + 0x0C]
	fmovsn	%icc,	%f20,	%f27
	stx	%l3,	[%l7 + 0x50]
	ldsh	[%l7 + 0x60],	%g7
	edge16ln	%g6,	%l4,	%i5
	ldub	[%l7 + 0x7F],	%l2
	edge16	%l5,	%o6,	%o2
	siam	0x7
	movrgez	%l0,	%o3,	%g5
	andcc	%o1,	0x05D3,	%o0
	mulscc	%g1,	0x1E30,	%i6
	stw	%i4,	[%l7 + 0x54]
	st	%f6,	[%l7 + 0x40]
	subccc	%g3,	%i0,	%i7
	movle	%xcc,	%o5,	%i1
	fcmps	%fcc0,	%f2,	%f26
	edge32	%i3,	%g4,	%l6
	fnot2	%f14,	%f8
	movcc	%xcc,	%o4,	%g2
	or	%l1,	%i2,	%l3
	srlx	%o7,	0x16,	%g7
	edge16l	%g6,	%l4,	%l2
	movne	%icc,	%l5,	%o6
	fcmpgt32	%f30,	%f2,	%o2
	fandnot2s	%f1,	%f25,	%f2
	movcs	%icc,	%l0,	%o3
	fnegd	%f28,	%f20
	alignaddrl	%g5,	%i5,	%o1
	fmovsl	%xcc,	%f23,	%f9
	ldd	[%l7 + 0x58],	%f4
	ldd	[%l7 + 0x60],	%o0
	movle	%xcc,	%g1,	%i4
	movle	%xcc,	%g3,	%i6
	xnor	%i0,	0x133F,	%o5
	movn	%icc,	%i7,	%i1
	sdiv	%g4,	0x1561,	%l6
	lduw	[%l7 + 0x78],	%o4
	move	%xcc,	%g2,	%l1
	mulx	%i3,	0x0AC0,	%i2
	movrne	%o7,	0x36A,	%l3
	sdivx	%g6,	0x100A,	%g7
	ldsw	[%l7 + 0x68],	%l4
	edge32ln	%l2,	%l5,	%o6
	fmovrdgz	%o2,	%f18,	%f22
	nop
	set	0x48, %g5
	stx	%l0,	[%l7 + %g5]
	fors	%f24,	%f30,	%f21
	sllx	%g5,	%i5,	%o1
	movn	%xcc,	%o3,	%o0
	edge8n	%g1,	%i4,	%g3
	fsrc1s	%f21,	%f0
	fmovsleu	%icc,	%f17,	%f15
	edge16ln	%i6,	%o5,	%i7
	fmovdvc	%icc,	%f18,	%f4
	sir	0x1D37
	subc	%i1,	%g4,	%i0
	sub	%o4,	%l6,	%l1
	std	%f28,	[%l7 + 0x70]
	fpackfix	%f14,	%f6
	fmovdleu	%xcc,	%f15,	%f9
	fcmpd	%fcc0,	%f26,	%f24
	pdist	%f24,	%f18,	%f30
	ldx	[%l7 + 0x38],	%g2
	fmovdl	%icc,	%f29,	%f12
	xnor	%i2,	0x0177,	%i3
	array16	%o7,	%g6,	%g7
	ldd	[%l7 + 0x58],	%l2
	xnorcc	%l2,	0x0221,	%l5
	fnors	%f1,	%f25,	%f13
	fmul8x16al	%f26,	%f10,	%f18
	movn	%xcc,	%l4,	%o2
	xnor	%l0,	%o6,	%i5
	movcc	%xcc,	%g5,	%o1
	alignaddr	%o0,	%g1,	%i4
	edge16	%g3,	%i6,	%o5
	fmul8x16au	%f7,	%f30,	%f2
	fand	%f22,	%f4,	%f28
	xnorcc	%i7,	%i1,	%o3
	fmovdne	%icc,	%f15,	%f25
	movrgez	%g4,	0x235,	%o4
	fmovrslz	%l6,	%f13,	%f13
	stb	%l1,	[%l7 + 0x0A]
	movg	%xcc,	%i0,	%i2
	sllx	%i3,	0x13,	%g2
	nop
	set	0x70, %o6
	stw	%g6,	[%l7 + %o6]
	movneg	%icc,	%o7,	%l3
	andncc	%g7,	%l2,	%l4
	array32	%o2,	%l5,	%l0
	fmuld8sux16	%f18,	%f1,	%f18
	fmovrsgez	%i5,	%f12,	%f1
	movle	%xcc,	%o6,	%g5
	fmul8sux16	%f26,	%f22,	%f26
	array8	%o1,	%g1,	%i4
	or	%o0,	%g3,	%o5
	edge16	%i7,	%i6,	%i1
	fmovrsne	%o3,	%f2,	%f27
	movneg	%xcc,	%o4,	%l6
	fornot1s	%f3,	%f16,	%f19
	edge16l	%l1,	%i0,	%i2
	fmovdvs	%icc,	%f0,	%f0
	stb	%i3,	[%l7 + 0x31]
	movre	%g2,	0x0C6,	%g6
	movn	%icc,	%o7,	%l3
	xorcc	%g4,	0x0BDF,	%g7
	movrlz	%l2,	0x2D8,	%l4
	popc	%l5,	%l0
	fnor	%f12,	%f12,	%f30
	orcc	%o2,	%o6,	%g5
	edge32ln	%i5,	%o1,	%g1
	array16	%i4,	%o0,	%o5
	orncc	%i7,	%i6,	%g3
	fcmpes	%fcc1,	%f14,	%f31
	ldd	[%l7 + 0x38],	%f2
	andn	%i1,	0x1BF0,	%o4
	movge	%icc,	%o3,	%l6
	fcmpes	%fcc0,	%f21,	%f7
	srl	%i0,	%l1,	%i3
	fmovspos	%xcc,	%f27,	%f22
	fexpand	%f10,	%f28
	stb	%g2,	[%l7 + 0x57]
	and	%g6,	0x194C,	%o7
	or	%i2,	0x1F2B,	%l3
	xnorcc	%g7,	%g4,	%l2
	movn	%xcc,	%l5,	%l4
	and	%l0,	0x1ACC,	%o6
	xnor	%g5,	%i5,	%o1
	xnorcc	%o2,	%i4,	%g1
	movvc	%icc,	%o5,	%i7
	fmovrsgez	%o0,	%f19,	%f27
	alignaddr	%g3,	%i6,	%o4
	movvc	%icc,	%o3,	%l6
	fmovsge	%icc,	%f5,	%f27
	move	%xcc,	%i0,	%i1
	umul	%i3,	0x093F,	%l1
	stw	%g6,	[%l7 + 0x78]
	movg	%icc,	%g2,	%i2
	sth	%o7,	[%l7 + 0x40]
	fmul8x16	%f30,	%f22,	%f4
	or	%l3,	0x035F,	%g7
	edge8l	%g4,	%l2,	%l5
	ldd	[%l7 + 0x08],	%f18
	umul	%l0,	0x191B,	%l4
	movrgz	%g5,	%i5,	%o1
	alignaddr	%o6,	%i4,	%g1
	nop
	set	0x30, %o5
	std	%f22,	[%l7 + %o5]
	and	%o5,	0x0B52,	%i7
	edge16n	%o2,	%g3,	%i6
	popc	0x0D1D,	%o4
	alignaddrl	%o0,	%l6,	%i0
	movneg	%icc,	%i1,	%o3
	std	%f0,	[%l7 + 0x20]
	edge8n	%l1,	%i3,	%g2
	subccc	%i2,	0x1D32,	%g6
	orcc	%l3,	%o7,	%g7
	fmul8x16	%f15,	%f6,	%f4
	edge16l	%g4,	%l2,	%l0
	sdiv	%l4,	0x05C2,	%l5
	fpack16	%f2,	%f23
	and	%g5,	%i5,	%o6
	edge32l	%i4,	%g1,	%o5
	edge8ln	%i7,	%o1,	%o2
	movrlz	%i6,	%g3,	%o4
	fornot2	%f18,	%f16,	%f26
	fornot2	%f6,	%f12,	%f28
	sdivcc	%o0,	0x1A55,	%l6
	sub	%i1,	%i0,	%l1
	ldsw	[%l7 + 0x0C],	%o3
	fpadd16s	%f21,	%f14,	%f7
	sub	%i3,	%i2,	%g2
	andcc	%l3,	0x10D8,	%g6
	edge32n	%o7,	%g4,	%l2
	fpadd32s	%f16,	%f4,	%f12
	addc	%l0,	%g7,	%l4
	sdivcc	%g5,	0x1E52,	%l5
	move	%xcc,	%i5,	%o6
	sdivx	%g1,	0x108B,	%o5
	ld	[%l7 + 0x38],	%f17
	movne	%xcc,	%i7,	%i4
	fxor	%f26,	%f16,	%f2
	subc	%o2,	%i6,	%g3
	fors	%f12,	%f0,	%f6
	sub	%o1,	0x10C6,	%o0
	movrgez	%l6,	%o4,	%i1
	array32	%l1,	%i0,	%o3
	ldx	[%l7 + 0x18],	%i3
	movvc	%xcc,	%g2,	%i2
	ldd	[%l7 + 0x10],	%f6
	stx	%l3,	[%l7 + 0x40]
	fcmpd	%fcc1,	%f0,	%f22
	fornot2s	%f0,	%f9,	%f12
	array8	%g6,	%o7,	%l2
	fmovdcs	%icc,	%f26,	%f26
	sra	%l0,	%g4,	%l4
	movl	%xcc,	%g7,	%l5
	lduw	[%l7 + 0x4C],	%g5
	addcc	%i5,	%o6,	%g1
	movne	%icc,	%i7,	%i4
	popc	%o2,	%i6
	array32	%g3,	%o5,	%o0
	edge32	%o1,	%l6,	%i1
	fnor	%f8,	%f22,	%f8
	movl	%xcc,	%l1,	%i0
	xnor	%o3,	0x0AA5,	%i3
	movl	%icc,	%g2,	%i2
	bshuffle	%f18,	%f20,	%f10
	array16	%l3,	%g6,	%o4
	array32	%o7,	%l2,	%g4
	mulscc	%l0,	0x03ED,	%l4
	fcmpne16	%f22,	%f26,	%l5
	edge16n	%g5,	%i5,	%g7
	fmovsle	%xcc,	%f26,	%f6
	fornot2s	%f11,	%f24,	%f8
	fnegs	%f8,	%f7
	fnands	%f19,	%f31,	%f16
	addcc	%g1,	%i7,	%o6
	fmul8sux16	%f24,	%f6,	%f14
	lduh	[%l7 + 0x7E],	%o2
	edge16	%i6,	%i4,	%o5
	orn	%g3,	0x173B,	%o0
	edge32	%o1,	%l6,	%l1
	alignaddrl	%i0,	%i1,	%o3
	sth	%i3,	[%l7 + 0x1E]
	edge8n	%g2,	%i2,	%g6
	fmul8ulx16	%f12,	%f24,	%f10
	orn	%l3,	0x1D62,	%o7
	std	%f28,	[%l7 + 0x60]
	andcc	%o4,	0x143F,	%l2
	fnot2	%f10,	%f30
	fnegd	%f28,	%f8
	xnorcc	%g4,	0x0F94,	%l4
	edge16ln	%l5,	%l0,	%i5
	ldsh	[%l7 + 0x52],	%g7
	edge32n	%g1,	%i7,	%o6
	srax	%o2,	%g5,	%i6
	movpos	%icc,	%i4,	%g3
	addc	%o0,	%o5,	%o1
	fmovrslez	%l6,	%f21,	%f30
	fcmps	%fcc3,	%f22,	%f20
	mulscc	%l1,	%i1,	%i0
	edge16	%o3,	%g2,	%i3
	mulx	%i2,	0x1B2C,	%l3
	fmovspos	%xcc,	%f20,	%f13
	fmul8x16au	%f2,	%f21,	%f10
	fmovsle	%xcc,	%f31,	%f27
	fmovrslez	%o7,	%f11,	%f4
	stw	%o4,	[%l7 + 0x1C]
	xor	%g6,	0x04B5,	%g4
	fcmpd	%fcc3,	%f18,	%f20
	stb	%l4,	[%l7 + 0x66]
	alignaddr	%l5,	%l0,	%l2
	udivx	%i5,	0x154C,	%g7
	fands	%f12,	%f8,	%f3
	movre	%g1,	0x34A,	%i7
	ldsw	[%l7 + 0x10],	%o2
	sth	%g5,	[%l7 + 0x78]
	fmovsge	%xcc,	%f7,	%f4
	movge	%icc,	%i6,	%o6
	movn	%xcc,	%i4,	%o0
	fmovde	%xcc,	%f4,	%f7
	fsrc1s	%f1,	%f6
	andncc	%g3,	%o5,	%o1
	srax	%l6,	0x15,	%i1
	ld	[%l7 + 0x68],	%f9
	udivcc	%l1,	0x04F7,	%o3
	ldd	[%l7 + 0x10],	%g2
	movrlz	%i3,	%i2,	%l3
	srl	%i0,	%o7,	%g6
	subccc	%o4,	%l4,	%g4
	edge8l	%l0,	%l5,	%i5
	movvs	%icc,	%g7,	%l2
	fmovdl	%xcc,	%f19,	%f30
	edge16l	%g1,	%i7,	%g5
	fnot1s	%f26,	%f24
	ldub	[%l7 + 0x56],	%o2
	orn	%i6,	%o6,	%o0
	andncc	%i4,	%o5,	%o1
	sll	%l6,	0x0E,	%g3
	edge8	%i1,	%l1,	%o3
	ldd	[%l7 + 0x68],	%i2
	xnorcc	%g2,	%l3,	%i2
	fmovs	%f13,	%f24
	xor	%o7,	%g6,	%i0
	movge	%icc,	%l4,	%o4
	smulcc	%l0,	%g4,	%l5
	ldd	[%l7 + 0x68],	%i4
	andncc	%l2,	%g7,	%g1
	fmovrdne	%g5,	%f26,	%f30
	mulscc	%i7,	0x09E9,	%i6
	srax	%o2,	0x02,	%o6
	subccc	%o0,	0x0814,	%o5
	movg	%xcc,	%i4,	%o1
	fpadd32s	%f3,	%f17,	%f31
	subcc	%l6,	0x037B,	%i1
	edge32	%l1,	%o3,	%i3
	sth	%g3,	[%l7 + 0x10]
	subcc	%g2,	%i2,	%o7
	subccc	%l3,	%g6,	%i0
	lduh	[%l7 + 0x14],	%o4
	pdist	%f28,	%f10,	%f10
	lduw	[%l7 + 0x48],	%l4
	smul	%l0,	0x08E0,	%g4
	sll	%l5,	0x1B,	%l2
	fmovrde	%g7,	%f20,	%f8
	srlx	%g1,	%i5,	%g5
	move	%xcc,	%i7,	%o2
	sdiv	%o6,	0x1CF6,	%i6
	fmovdcc	%xcc,	%f21,	%f21
	subc	%o0,	%o5,	%i4
	fcmpne32	%f22,	%f20,	%o1
	andn	%l6,	0x0316,	%i1
	subccc	%l1,	0x0D9B,	%i3
	movcc	%xcc,	%o3,	%g2
	stw	%g3,	[%l7 + 0x50]
	fnot1	%f4,	%f26
	udivx	%i2,	0x1DBE,	%o7
	lduw	[%l7 + 0x2C],	%l3
	nop
	set	0x60, %i7
	ldsb	[%l7 + %i7],	%g6
	movvc	%icc,	%i0,	%l4
	lduh	[%l7 + 0x78],	%o4
	fmuld8sux16	%f10,	%f18,	%f26
	smulcc	%g4,	0x121E,	%l5
	edge16	%l0,	%g7,	%g1
	addcc	%l2,	0x16DF,	%i5
	sth	%g5,	[%l7 + 0x30]
	array32	%o2,	%i7,	%i6
	movneg	%icc,	%o0,	%o5
	umul	%i4,	%o1,	%o6
	save %i1, 0x02F3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fone	%f2
	sdiv	%i3,	0x1A6F,	%o3
	umul	%g2,	%g3,	%i2
	udiv	%o7,	0x1FA8,	%l3
	edge8ln	%l1,	%g6,	%l4
	xorcc	%i0,	0x0833,	%g4
	fxnor	%f20,	%f22,	%f12
	ldx	[%l7 + 0x40],	%o4
	fones	%f2
	edge16	%l5,	%l0,	%g1
	st	%f1,	[%l7 + 0x28]
	movrgez	%l2,	%i5,	%g5
	stw	%g7,	[%l7 + 0x08]
	fzeros	%f4
	movcs	%xcc,	%i7,	%o2
	sth	%i6,	[%l7 + 0x34]
	sra	%o5,	%o0,	%i4
	stw	%o1,	[%l7 + 0x10]
	std	%f4,	[%l7 + 0x48]
	addc	%o6,	%l6,	%i1
	fcmpeq32	%f4,	%f6,	%i3
	srl	%g2,	0x0B,	%g3
	fmovrdne	%i2,	%f24,	%f16
	fmul8sux16	%f4,	%f16,	%f26
	fandnot2s	%f0,	%f19,	%f3
	ld	[%l7 + 0x1C],	%f14
	fnot2	%f12,	%f16
	xorcc	%o3,	%o7,	%l3
	movg	%icc,	%g6,	%l4
	edge16n	%i0,	%l1,	%o4
	movpos	%xcc,	%l5,	%l0
	edge8n	%g4,	%l2,	%g1
	ldsb	[%l7 + 0x6C],	%g5
	ldsh	[%l7 + 0x52],	%g7
	fmovde	%xcc,	%f5,	%f22
	edge32ln	%i5,	%o2,	%i7
	sdivcc	%i6,	0x1D47,	%o0
	mulscc	%i4,	%o1,	%o5
	xnor	%l6,	0x19A5,	%i1
	edge16	%i3,	%g2,	%g3
	subccc	%o6,	%o3,	%i2
	fmovdleu	%icc,	%f0,	%f9
	orcc	%o7,	%g6,	%l4
	edge16	%l3,	%l1,	%i0
	mulscc	%l5,	%o4,	%l0
	edge8l	%l2,	%g1,	%g4
	fmovsleu	%xcc,	%f23,	%f26
	ldsb	[%l7 + 0x3A],	%g5
	alignaddrl	%g7,	%o2,	%i7
	fmovsge	%icc,	%f15,	%f16
	array32	%i6,	%i5,	%i4
	subc	%o1,	0x0598,	%o0
	ldd	[%l7 + 0x08],	%o4
	umulcc	%l6,	%i3,	%i1
	movge	%icc,	%g3,	%o6
	fnot1	%f14,	%f16
	std	%f20,	[%l7 + 0x58]
	fmovrdgz	%g2,	%f12,	%f18
	sdivcc	%i2,	0x0A91,	%o7
	fsrc1	%f2,	%f12
	umulcc	%g6,	%o3,	%l3
	mulx	%l1,	0x1A0B,	%l4
	sll	%i0,	0x10,	%l5
	sra	%l0,	%l2,	%o4
	lduh	[%l7 + 0x48],	%g1
	movleu	%xcc,	%g5,	%g7
	fnands	%f31,	%f18,	%f26
	popc	%o2,	%g4
	edge32ln	%i7,	%i5,	%i4
	movl	%icc,	%i6,	%o0
	movn	%icc,	%o5,	%o1
	fmovdle	%icc,	%f1,	%f15
	andcc	%i3,	0x1257,	%i1
	fcmpgt16	%f12,	%f28,	%l6
	fmovspos	%icc,	%f29,	%f21
	addcc	%g3,	0x1B95,	%o6
	alignaddr	%i2,	%g2,	%o7
	fand	%f10,	%f2,	%f2
	ldsw	[%l7 + 0x08],	%o3
	srlx	%g6,	%l3,	%l4
	movpos	%xcc,	%l1,	%i0
	ldsh	[%l7 + 0x60],	%l0
	sub	%l2,	%o4,	%l5
	addcc	%g5,	0x1E30,	%g7
	sdivx	%g1,	0x081A,	%o2
	or	%i7,	%i5,	%g4
	edge16l	%i6,	%o0,	%o5
	ldsh	[%l7 + 0x20],	%o1
	orcc	%i4,	%i3,	%i1
	xor	%g3,	%o6,	%i2
	edge32ln	%g2,	%o7,	%o3
	movrlez	%l6,	0x0C7,	%g6
	movg	%icc,	%l3,	%l4
	ldd	[%l7 + 0x48],	%f20
	movne	%icc,	%i0,	%l0
	mulx	%l2,	0x0AEC,	%l1
	sra	%o4,	0x01,	%l5
	edge16	%g5,	%g7,	%g1
	edge16ln	%o2,	%i5,	%i7
	fmovda	%icc,	%f19,	%f3
	xorcc	%i6,	%g4,	%o5
	and	%o1,	%o0,	%i4
	movpos	%xcc,	%i1,	%i3
	alignaddr	%o6,	%g3,	%g2
	movleu	%icc,	%i2,	%o7
	edge16l	%l6,	%g6,	%l3
	fmovsvc	%icc,	%f14,	%f15
	sub	%l4,	%i0,	%l0
	orncc	%l2,	%l1,	%o3
	array8	%l5,	%o4,	%g5
	xnor	%g1,	0x0648,	%o2
	edge8n	%i5,	%g7,	%i7
	movleu	%icc,	%g4,	%i6
	fmovsgu	%xcc,	%f0,	%f15
	orncc	%o5,	0x17C4,	%o1
	fpsub16s	%f8,	%f31,	%f29
	fcmpeq16	%f0,	%f24,	%i4
	bshuffle	%f24,	%f10,	%f4
	movleu	%xcc,	%o0,	%i3
	fmovsvc	%xcc,	%f27,	%f23
	ldd	[%l7 + 0x48],	%o6
	or	%i1,	0x111E,	%g3
	movle	%xcc,	%i2,	%g2
	movleu	%icc,	%l6,	%g6
	edge8n	%o7,	%l4,	%l3
	fcmple16	%f30,	%f12,	%l0
	fnands	%f5,	%f0,	%f6
	stw	%l2,	[%l7 + 0x70]
	alignaddr	%l1,	%o3,	%i0
	popc	0x116D,	%o4
	smul	%g5,	%l5,	%g1
	edge32	%o2,	%i5,	%i7
	udivx	%g4,	0x074F,	%i6
	sethi	0x147B,	%o5
	mova	%xcc,	%o1,	%g7
	fpack32	%f22,	%f28,	%f28
	movn	%xcc,	%i4,	%o0
	fnegs	%f27,	%f23
	edge32l	%i3,	%i1,	%g3
	restore %i2, 0x1432, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%l6,	0x3AB,	%g6
	movn	%icc,	%o7,	%o6
	std	%f6,	[%l7 + 0x68]
	edge8ln	%l4,	%l3,	%l2
	addcc	%l1,	0x1486,	%o3
	edge16l	%i0,	%o4,	%g5
	fmovsneg	%icc,	%f9,	%f17
	fmovdg	%icc,	%f5,	%f30
	sdivcc	%l0,	0x1574,	%g1
	fpackfix	%f10,	%f6
	fmul8x16	%f11,	%f16,	%f20
	array32	%l5,	%i5,	%i7
	movneg	%xcc,	%g4,	%i6
	movn	%xcc,	%o5,	%o1
	movle	%icc,	%o2,	%i4
	movrlez	%o0,	0x1E8,	%i3
	movl	%xcc,	%i1,	%g7
	ldsb	[%l7 + 0x23],	%g3
	movl	%icc,	%i2,	%l6
	udivx	%g2,	0x000C,	%o7
	mova	%icc,	%g6,	%l4
	orcc	%l3,	0x063A,	%l2
	fmovrdgz	%o6,	%f16,	%f20
	subcc	%l1,	0x1051,	%o3
	ld	[%l7 + 0x20],	%f12
	save %i0, %o4, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x5C],	%g5
	subccc	%g1,	%i5,	%l5
	edge16l	%g4,	%i7,	%i6
	fmovsvs	%xcc,	%f3,	%f15
	st	%f5,	[%l7 + 0x40]
	ldsh	[%l7 + 0x40],	%o5
	srax	%o1,	0x09,	%i4
	ldsb	[%l7 + 0x52],	%o0
	ldx	[%l7 + 0x68],	%o2
	fmovdcc	%icc,	%f19,	%f31
	fmovdle	%xcc,	%f23,	%f12
	fnot2s	%f23,	%f29
	srl	%i1,	0x1F,	%g7
	xnor	%i3,	%g3,	%l6
	stx	%i2,	[%l7 + 0x60]
	fmovrsgz	%g2,	%f30,	%f2
	xnorcc	%o7,	%l4,	%g6
	edge32	%l2,	%l3,	%l1
	fmovd	%f28,	%f18
	sdivcc	%o3,	0x1E11,	%i0
	fnegd	%f20,	%f10
	movleu	%icc,	%o6,	%l0
	movl	%icc,	%g5,	%o4
	edge16	%g1,	%l5,	%g4
	andn	%i5,	0x1E30,	%i7
	andcc	%o5,	0x0FF0,	%i6
	ldsw	[%l7 + 0x44],	%i4
	ldsb	[%l7 + 0x39],	%o0
	srl	%o1,	0x1D,	%o2
	sdivcc	%g7,	0x0A1A,	%i1
	fmovsg	%xcc,	%f4,	%f20
	fmovda	%icc,	%f7,	%f24
	xorcc	%g3,	%l6,	%i3
	ld	[%l7 + 0x08],	%f5
	and	%g2,	0x1D71,	%o7
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%l4
	fmovspos	%icc,	%f13,	%f2
	subcc	%g6,	%l2,	%i2
	movcs	%xcc,	%l1,	%o3
	fornot1	%f4,	%f18,	%f16
	movrlez	%l3,	%i0,	%l0
	srax	%o6,	%o4,	%g5
	addccc	%l5,	0x0F05,	%g1
	edge16ln	%i5,	%g4,	%o5
	sdiv	%i7,	0x196F,	%i6
	add	%i4,	0x1549,	%o0
	array8	%o1,	%g7,	%i1
	movne	%icc,	%g3,	%o2
	sdiv	%l6,	0x0365,	%g2
	lduw	[%l7 + 0x28],	%i3
	movrgez	%l4,	%o7,	%g6
	fmovsle	%icc,	%f21,	%f30
	and	%i2,	%l2,	%l1
	fcmpne16	%f8,	%f8,	%o3
	edge8l	%i0,	%l0,	%o6
	fpadd16	%f26,	%f10,	%f12
	mulx	%o4,	0x1A80,	%g5
	stb	%l5,	[%l7 + 0x33]
	andcc	%g1,	0x0AC2,	%l3
	fornot2	%f10,	%f18,	%f18
	fcmpes	%fcc3,	%f17,	%f26
	fmovdn	%xcc,	%f24,	%f13
	fpsub32	%f14,	%f8,	%f16
	movne	%xcc,	%g4,	%o5
	sllx	%i7,	%i6,	%i4
	ldd	[%l7 + 0x60],	%i4
	st	%f10,	[%l7 + 0x4C]
	fmovdvc	%icc,	%f3,	%f20
	smulcc	%o1,	%o0,	%i1
	fornot1	%f2,	%f6,	%f16
	umulcc	%g3,	0x16FA,	%o2
	sdivcc	%l6,	0x0955,	%g7
	fandnot1	%f2,	%f6,	%f2
	movneg	%xcc,	%i3,	%l4
	array8	%g2,	%o7,	%g6
	edge32l	%i2,	%l2,	%o3
	movn	%icc,	%i0,	%l1
	mulx	%l0,	%o6,	%g5
	stx	%l5,	[%l7 + 0x10]
	fornot2	%f6,	%f22,	%f26
	fnot2	%f16,	%f0
	mulx	%o4,	0x0FBD,	%g1
	ldd	[%l7 + 0x50],	%l2
	movvc	%xcc,	%o5,	%i7
	fmovrse	%i6,	%f20,	%f26
	fandnot1s	%f15,	%f15,	%f16
	ldsb	[%l7 + 0x23],	%i4
	fcmpgt32	%f18,	%f18,	%g4
	edge16n	%o1,	%o0,	%i1
	movne	%xcc,	%g3,	%o2
	orn	%i5,	%l6,	%i3
	sllx	%l4,	%g2,	%g7
	fand	%f8,	%f28,	%f30
	array8	%o7,	%i2,	%l2
	movgu	%icc,	%o3,	%g6
	fpadd16s	%f26,	%f9,	%f9
	ld	[%l7 + 0x18],	%f1
	subcc	%l1,	0x0B01,	%l0
	movge	%icc,	%i0,	%g5
	sll	%o6,	%o4,	%g1
	fmovrde	%l3,	%f24,	%f30
	ldx	[%l7 + 0x78],	%o5
	edge8	%l5,	%i7,	%i4
	movne	%xcc,	%i6,	%o1
	edge8ln	%o0,	%g4,	%g3
	xnor	%i1,	0x1061,	%o2
	fone	%f22
	addc	%l6,	%i5,	%i3
	srl	%g2,	0x1F,	%g7
	movrgez	%l4,	%i2,	%l2
	addc	%o3,	0x03C2,	%g6
	addc	%l1,	%l0,	%i0
	sra	%o7,	0x18,	%o6
	umulcc	%g5,	%g1,	%l3
	stw	%o4,	[%l7 + 0x50]
	sdivcc	%o5,	0x1DE5,	%i7
	movn	%xcc,	%l5,	%i4
	fornot2s	%f1,	%f19,	%f27
	orcc	%o1,	0x05E4,	%i6
	ldd	[%l7 + 0x20],	%g4
	fcmpne16	%f26,	%f26,	%o0
	fcmple16	%f14,	%f24,	%i1
	fmuld8ulx16	%f22,	%f29,	%f28
	fmovrdne	%o2,	%f26,	%f14
	addcc	%g3,	%i5,	%i3
	udivx	%l6,	0x08BC,	%g2
	edge8l	%g7,	%i2,	%l2
	umulcc	%l4,	%g6,	%o3
	umulcc	%l1,	%i0,	%o7
	ldsw	[%l7 + 0x2C],	%l0
	fcmpeq16	%f6,	%f6,	%o6
	movn	%icc,	%g5,	%g1
	or	%l3,	0x0869,	%o5
	movne	%xcc,	%i7,	%l5
	movre	%o4,	%i4,	%o1
	faligndata	%f28,	%f26,	%f12
	movrlez	%i6,	0x089,	%g4
	lduh	[%l7 + 0x4A],	%o0
	addcc	%o2,	0x0A59,	%g3
	sethi	0x0FB0,	%i1
	std	%f24,	[%l7 + 0x58]
	movg	%xcc,	%i3,	%l6
	udivcc	%i5,	0x1C61,	%g7
	fmovdcc	%xcc,	%f25,	%f0
	st	%f11,	[%l7 + 0x5C]
	movre	%i2,	0x0B1,	%g2
	fpmerge	%f22,	%f6,	%f28
	movrgez	%l4,	0x3D0,	%l2
	andcc	%o3,	0x1EC6,	%l1
	nop
	set	0x5C, %g6
	lduw	[%l7 + %g6],	%g6
	edge8ln	%i0,	%o7,	%o6
	fxor	%f20,	%f10,	%f8
	andn	%g5,	%l0,	%l3
	sethi	0x0786,	%g1
	fmovsleu	%xcc,	%f20,	%f10
	alignaddrl	%i7,	%o5,	%l5
	edge16ln	%o4,	%o1,	%i6
	orn	%g4,	%i4,	%o2
	movvc	%icc,	%o0,	%g3
	fmul8x16al	%f6,	%f11,	%f4
	stb	%i1,	[%l7 + 0x2A]
	subccc	%i3,	0x06B8,	%l6
	xnor	%g7,	%i5,	%g2
	fpadd32s	%f12,	%f23,	%f14
	movvc	%icc,	%i2,	%l2
	sdiv	%l4,	0x1790,	%l1
	srax	%o3,	%i0,	%g6
	movrlez	%o7,	%g5,	%o6
	ldsh	[%l7 + 0x64],	%l3
	fands	%f25,	%f15,	%f22
	udiv	%g1,	0x05DA,	%l0
	orn	%i7,	%l5,	%o4
	addc	%o1,	0x0854,	%o5
	orncc	%i6,	%g4,	%o2
	edge16	%i4,	%g3,	%i1
	edge8l	%i3,	%l6,	%o0
	stx	%i5,	[%l7 + 0x58]
	sir	0x0387
	fmovsleu	%xcc,	%f26,	%f19
	sll	%g7,	%i2,	%l2
	mulscc	%g2,	%l1,	%l4
	fmovsleu	%icc,	%f17,	%f31
	st	%f14,	[%l7 + 0x74]
	fornot2	%f18,	%f18,	%f10
	st	%f17,	[%l7 + 0x54]
	subc	%i0,	%o3,	%g6
	movge	%icc,	%o7,	%g5
	nop
	set	0x1C, %o7
	ldub	[%l7 + %o7],	%o6
	std	%f30,	[%l7 + 0x78]
	save %g1, %l0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%l5,	0x1630,	%i7
	edge16l	%o1,	%o5,	%i6
	edge8ln	%o4,	%g4,	%o2
	fornot1	%f0,	%f30,	%f6
	fpadd16s	%f2,	%f29,	%f9
	movrgez	%i4,	0x3A5,	%i1
	sra	%g3,	0x0B,	%i3
	ldub	[%l7 + 0x28],	%o0
	ldd	[%l7 + 0x20],	%i6
	sethi	0x0CDE,	%g7
	move	%xcc,	%i2,	%i5
	array8	%g2,	%l1,	%l2
	movpos	%icc,	%i0,	%l4
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	edge32	%o6,	%g6,	%g1
	movvs	%xcc,	%l0,	%l3
	ldd	[%l7 + 0x50],	%f2
	or	%l5,	0x1E14,	%o1
	addccc	%o5,	%i7,	%o4
	fmovsgu	%xcc,	%f8,	%f15
	fones	%f17
	mulscc	%g4,	0x0F98,	%i6
	addcc	%i4,	%i1,	%g3
	siam	0x2
	subcc	%i3,	0x17CE,	%o0
	movrne	%l6,	%g7,	%i2
	movrne	%i5,	%g2,	%o2
	ldd	[%l7 + 0x48],	%f28
	movg	%icc,	%l1,	%i0
	movvs	%icc,	%l4,	%o3
	movrlz	%o7,	%g5,	%l2
	movvs	%xcc,	%g6,	%g1
	movg	%xcc,	%o6,	%l0
	orcc	%l3,	0x098A,	%l5
	stx	%o5,	[%l7 + 0x30]
	sdiv	%i7,	0x05C6,	%o4
	ldsw	[%l7 + 0x78],	%o1
	fsrc2	%f28,	%f24
	nop
	set	0x10, %i0
	ldx	[%l7 + %i0],	%i6
	bshuffle	%f8,	%f10,	%f12
	ldd	[%l7 + 0x10],	%f28
	movl	%icc,	%i4,	%g4
	sdiv	%g3,	0x091D,	%i1
	add	%i3,	0x1127,	%l6
	srax	%o0,	%g7,	%i2
	stw	%i5,	[%l7 + 0x4C]
	popc	0x0C32,	%g2
	edge8	%o2,	%l1,	%i0
	fpack16	%f4,	%f5
	addcc	%l4,	0x08F8,	%o7
	edge8l	%o3,	%g5,	%g6
	andncc	%l2,	%g1,	%o6
	and	%l3,	%l5,	%l0
	movn	%xcc,	%o5,	%i7
	andncc	%o4,	%i6,	%i4
	subcc	%o1,	0x0D38,	%g4
	for	%f16,	%f12,	%f14
	movpos	%xcc,	%i1,	%i3
	udiv	%g3,	0x11F6,	%o0
	lduw	[%l7 + 0x30],	%g7
	fornot1	%f28,	%f16,	%f0
	fmovrsgez	%l6,	%f26,	%f14
	subccc	%i5,	0x06B4,	%g2
	edge8l	%i2,	%o2,	%i0
	fcmpgt32	%f10,	%f18,	%l1
	fcmpd	%fcc3,	%f10,	%f22
	ldx	[%l7 + 0x10],	%l4
	ldsw	[%l7 + 0x54],	%o3
	andcc	%g5,	0x15E9,	%g6
	and	%l2,	0x0DE7,	%g1
	edge8n	%o7,	%o6,	%l3
	sethi	0x1AC8,	%l5
	addc	%l0,	0x1E87,	%i7
	edge32n	%o4,	%o5,	%i4
	array32	%o1,	%g4,	%i6
	movn	%xcc,	%i3,	%i1
	movge	%xcc,	%o0,	%g7
	movrlz	%g3,	%l6,	%i5
	fcmped	%fcc2,	%f24,	%f6
	lduh	[%l7 + 0x1C],	%g2
	array8	%i2,	%o2,	%l1
	fand	%f18,	%f10,	%f6
	ldsb	[%l7 + 0x4A],	%i0
	mulscc	%o3,	0x0AD1,	%g5
	siam	0x3
	fpmerge	%f15,	%f17,	%f28
	std	%f16,	[%l7 + 0x38]
	ldsb	[%l7 + 0x69],	%g6
	subcc	%l2,	%g1,	%o7
	xor	%l4,	0x0524,	%l3
	ldd	[%l7 + 0x60],	%f10
	fnor	%f6,	%f12,	%f30
	add	%o6,	0x04AF,	%l0
	movrne	%l5,	0x1D8,	%o4
	stx	%o5,	[%l7 + 0x50]
	or	%i7,	0x0DE7,	%o1
	ldd	[%l7 + 0x30],	%f18
	fpadd16s	%f15,	%f19,	%f20
	ldd	[%l7 + 0x18],	%f22
	ldd	[%l7 + 0x10],	%i4
	fnands	%f22,	%f28,	%f27
	fpsub32s	%f22,	%f2,	%f19
	edge32n	%g4,	%i3,	%i1
	smulcc	%o0,	%i6,	%g7
	umulcc	%g3,	0x14BE,	%l6
	lduh	[%l7 + 0x24],	%i5
	sethi	0x17A1,	%i2
	nop
	set	0x20, %i1
	std	%f2,	[%l7 + %i1]
	sub	%g2,	0x1A3B,	%l1
	orcc	%i0,	0x0D7E,	%o2
	sdivx	%g5,	0x0977,	%o3
	mulscc	%g6,	0x0FE8,	%l2
	udivx	%o7,	0x1EF5,	%g1
	fmovde	%xcc,	%f5,	%f20
	xor	%l3,	0x0305,	%o6
	subcc	%l4,	0x0E52,	%l0
	movgu	%xcc,	%l5,	%o4
	fnot1	%f30,	%f6
	sdiv	%i7,	0x1499,	%o1
	stb	%o5,	[%l7 + 0x72]
	ldsw	[%l7 + 0x44],	%g4
	mulx	%i3,	%i1,	%o0
	fpackfix	%f16,	%f21
	fmovsl	%icc,	%f0,	%f16
	movrne	%i4,	0x3AE,	%g7
	sir	0x036C
	movgu	%icc,	%i6,	%g3
	popc	0x1871,	%i5
	movne	%xcc,	%i2,	%l6
	ldd	[%l7 + 0x60],	%f14
	fandnot2	%f8,	%f6,	%f16
	andncc	%g2,	%i0,	%l1
	fmovdvs	%xcc,	%f24,	%f18
	and	%o2,	0x156D,	%g5
	movcc	%icc,	%o3,	%g6
	andn	%o7,	0x1BA5,	%l2
	lduw	[%l7 + 0x40],	%g1
	srax	%o6,	0x04,	%l4
	save %l3, %l5, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i7,	%o1
	fmovrsne	%o4,	%f4,	%f3
	edge8ln	%o5,	%i3,	%i1
	ldd	[%l7 + 0x28],	%o0
	movvc	%xcc,	%i4,	%g7
	srl	%g4,	0x02,	%g3
	fmovdcs	%xcc,	%f26,	%f27
	udivx	%i5,	0x17AE,	%i2
	fmovrsne	%l6,	%f14,	%f30
	movleu	%icc,	%g2,	%i0
	fmovd	%f30,	%f24
	fmovdneg	%xcc,	%f12,	%f24
	array8	%l1,	%o2,	%i6
	movcs	%xcc,	%o3,	%g6
	orncc	%g5,	0x0AB5,	%o7
	movre	%g1,	0x380,	%o6
	movge	%xcc,	%l4,	%l2
	edge16n	%l3,	%l0,	%i7
	edge16	%l5,	%o4,	%o1
	or	%i3,	%o5,	%o0
	subccc	%i1,	0x1FA7,	%g7
	fcmps	%fcc3,	%f8,	%f19
	xorcc	%g4,	%g3,	%i4
	xorcc	%i2,	%i5,	%g2
	edge32l	%i0,	%l6,	%o2
	movneg	%xcc,	%l1,	%o3
	movrgz	%i6,	0x11B,	%g6
	fmovrse	%g5,	%f29,	%f19
	movneg	%icc,	%g1,	%o7
	sllx	%l4,	0x1E,	%l2
	fmovsa	%xcc,	%f1,	%f4
	umulcc	%l3,	0x0A6C,	%o6
	movre	%l0,	0x369,	%i7
	and	%o4,	%l5,	%i3
	or	%o5,	%o1,	%o0
	ldub	[%l7 + 0x12],	%i1
	subc	%g4,	0x1ED3,	%g3
	fxor	%f8,	%f2,	%f10
	ldd	[%l7 + 0x18],	%f4
	movn	%xcc,	%i4,	%g7
	movrlez	%i5,	%g2,	%i0
	movvc	%icc,	%i2,	%l6
	array32	%o2,	%o3,	%l1
	xorcc	%i6,	%g5,	%g1
	ld	[%l7 + 0x20],	%f4
	edge32n	%g6,	%o7,	%l4
	umul	%l2,	0x19AD,	%o6
	movge	%icc,	%l3,	%i7
	fmovrslez	%o4,	%f5,	%f26
	srlx	%l5,	0x15,	%i3
	edge16	%o5,	%o1,	%l0
	edge32ln	%o0,	%g4,	%g3
	xor	%i4,	0x18D4,	%g7
	sllx	%i1,	0x1E,	%g2
	fpmerge	%f11,	%f19,	%f16
	fpsub32	%f26,	%f8,	%f20
	ld	[%l7 + 0x40],	%f4
	edge16ln	%i0,	%i2,	%l6
	fmovsl	%icc,	%f21,	%f1
	fmovsneg	%icc,	%f4,	%f17
	fmovdcs	%icc,	%f11,	%f16
	srl	%i5,	0x0E,	%o2
	subc	%o3,	%l1,	%g5
	movrlz	%g1,	%i6,	%o7
	movpos	%xcc,	%l4,	%g6
	fmovde	%icc,	%f17,	%f27
	fmul8sux16	%f14,	%f10,	%f30
	udivx	%o6,	0x1A8E,	%l3
	movn	%icc,	%l2,	%i7
	fandnot1s	%f6,	%f19,	%f19
	movvc	%xcc,	%o4,	%i3
	sdivx	%o5,	0x1BD8,	%l5
	ldsb	[%l7 + 0x0B],	%o1
	orn	%l0,	0x1F42,	%g4
	fcmpes	%fcc2,	%f19,	%f1
	andcc	%o0,	0x0F63,	%i4
	xorcc	%g3,	0x0B32,	%i1
	movvc	%xcc,	%g2,	%i0
	orcc	%g7,	0x0197,	%l6
	xor	%i5,	%o2,	%i2
	ldsh	[%l7 + 0x30],	%l1
	fmovd	%f30,	%f6
	popc	0x0A70,	%o3
	udiv	%g5,	0x02E6,	%i6
	movrne	%g1,	%o7,	%l4
	fmovrsgz	%o6,	%f17,	%f18
	sllx	%g6,	%l2,	%i7
	ldsb	[%l7 + 0x35],	%o4
	fpadd16	%f4,	%f2,	%f12
	fpsub16s	%f15,	%f22,	%f11
	addcc	%l3,	%o5,	%i3
	fmovsne	%icc,	%f13,	%f8
	fmovsge	%icc,	%f23,	%f1
	ldd	[%l7 + 0x50],	%l4
	ldub	[%l7 + 0x2B],	%o1
	ldsh	[%l7 + 0x44],	%g4
	andn	%o0,	%l0,	%i4
	movn	%xcc,	%g3,	%i1
	ldd	[%l7 + 0x58],	%g2
	fmovrse	%g7,	%f6,	%f20
	fnegd	%f24,	%f12
	fnands	%f20,	%f23,	%f28
	popc	0x10AD,	%l6
	edge32n	%i5,	%i0,	%o2
	fandnot1s	%f9,	%f25,	%f31
	movle	%icc,	%i2,	%l1
	ldd	[%l7 + 0x08],	%f30
	movrgez	%o3,	0x007,	%i6
	nop
	set	0x58, %o2
	sth	%g5,	[%l7 + %o2]
	pdist	%f14,	%f26,	%f8
	fcmpgt32	%f0,	%f2,	%o7
	fcmpd	%fcc2,	%f10,	%f6
	fpsub32	%f8,	%f6,	%f16
	movn	%icc,	%g1,	%o6
	sub	%g6,	0x1BF0,	%l4
	udivx	%l2,	0x1D3E,	%i7
	mova	%icc,	%l3,	%o5
	sir	0x0F1E
	movgu	%icc,	%o4,	%i3
	std	%f10,	[%l7 + 0x40]
	udivx	%l5,	0x00FA,	%o1
	fmul8ulx16	%f16,	%f6,	%f0
	srl	%o0,	%g4,	%l0
	stb	%g3,	[%l7 + 0x4B]
	fmovs	%f1,	%f20
	mulscc	%i1,	0x05D4,	%g2
	subccc	%i4,	%g7,	%l6
	andncc	%i5,	%o2,	%i0
	xnorcc	%l1,	%i2,	%i6
	edge16l	%g5,	%o7,	%g1
	std	%f22,	[%l7 + 0x78]
	edge32n	%o6,	%g6,	%o3
	edge8n	%l4,	%l2,	%i7
	sdivx	%l3,	0x187D,	%o4
	move	%xcc,	%i3,	%l5
	lduh	[%l7 + 0x12],	%o1
	fpadd16	%f10,	%f18,	%f22
	subcc	%o0,	0x1F02,	%g4
	array16	%o5,	%g3,	%l0
	fmovsvs	%icc,	%f24,	%f21
	stb	%g2,	[%l7 + 0x25]
	edge32ln	%i1,	%i4,	%l6
	fpmerge	%f16,	%f17,	%f30
	edge16n	%i5,	%g7,	%o2
	movcs	%icc,	%i0,	%i2
	subcc	%l1,	0x0AC6,	%i6
	andncc	%g5,	%o7,	%g1
	fmul8x16al	%f14,	%f4,	%f4
	addcc	%g6,	0x0C9C,	%o6
	fmovde	%xcc,	%f31,	%f10
	movleu	%icc,	%l4,	%o3
	xnorcc	%l2,	%l3,	%o4
	edge32	%i7,	%l5,	%i3
	and	%o1,	0x0F3E,	%g4
	movle	%xcc,	%o5,	%o0
	std	%f22,	[%l7 + 0x20]
	movre	%l0,	%g2,	%g3
	edge32ln	%i1,	%l6,	%i4
	fmul8x16al	%f26,	%f13,	%f18
	fcmpne32	%f30,	%f20,	%g7
	addccc	%i5,	0x0E64,	%o2
	movrlez	%i2,	%i0,	%i6
	srax	%g5,	%l1,	%o7
	fmovrdgez	%g1,	%f14,	%f22
	sllx	%o6,	0x1A,	%l4
	movvc	%xcc,	%o3,	%g6
	xnor	%l3,	0x1379,	%l2
	mova	%xcc,	%i7,	%l5
	sllx	%o4,	0x12,	%i3
	orncc	%g4,	%o1,	%o0
	restore %l0, %o5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i1,	%l6
	movvs	%xcc,	%i4,	%g7
	sth	%g2,	[%l7 + 0x2C]
	movcs	%icc,	%o2,	%i2
	fcmpeq32	%f24,	%f22,	%i5
	movl	%xcc,	%i6,	%g5
	sdivx	%l1,	0x0DA0,	%i0
	movrlz	%g1,	0x2AD,	%o7
	fnors	%f26,	%f29,	%f31
	xnor	%l4,	%o6,	%o3
	array16	%l3,	%g6,	%l2
	udivx	%i7,	0x01D5,	%o4
	save %l5, 0x099B, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f26,	%f1,	%f28
	srax	%o1,	0x02,	%i3
	xnorcc	%l0,	%o0,	%g3
	fmovrslez	%o5,	%f24,	%f23
	umul	%l6,	%i4,	%i1
	fmovsvs	%xcc,	%f1,	%f29
	sdivx	%g7,	0x14DB,	%o2
	movvc	%icc,	%g2,	%i2
	movrgez	%i5,	0x1E0,	%g5
	movrgez	%i6,	0x324,	%l1
	fpadd32	%f14,	%f6,	%f26
	movle	%xcc,	%g1,	%i0
	fmovdpos	%icc,	%f24,	%f9
	udiv	%l4,	0x1F4E,	%o6
	nop
	set	0x58, %l0
	ldsh	[%l7 + %l0],	%o3
	nop
	set	0x10, %o3
	ldsw	[%l7 + %o3],	%o7
	xorcc	%g6,	0x0407,	%l2
	subccc	%l3,	0x0CF6,	%o4
	ldsh	[%l7 + 0x40],	%l5
	udiv	%g4,	0x11BA,	%o1
	movvs	%xcc,	%i7,	%i3
	movre	%o0,	0x0BB,	%l0
	edge16ln	%o5,	%l6,	%i4
	smul	%i1,	%g7,	%o2
	orcc	%g3,	%i2,	%i5
	movleu	%icc,	%g2,	%i6
	array16	%g5,	%g1,	%i0
	edge32l	%l4,	%o6,	%l1
	fmovsl	%icc,	%f22,	%f4
	movrlz	%o3,	%o7,	%l2
	sll	%l3,	%g6,	%o4
	smul	%l5,	0x16B6,	%o1
	array32	%i7,	%g4,	%i3
	edge32n	%l0,	%o0,	%l6
	movrgez	%o5,	0x117,	%i4
	xorcc	%g7,	0x1712,	%o2
	ldsw	[%l7 + 0x4C],	%i1
	fornot2	%f6,	%f30,	%f6
	movrlz	%g3,	%i5,	%g2
	andncc	%i6,	%g5,	%i2
	nop
	set	0x7A, %o4
	lduh	[%l7 + %o4],	%i0
	sll	%g1,	0x1C,	%o6
	fmovrslz	%l1,	%f31,	%f11
	ldub	[%l7 + 0x2E],	%o3
	movpos	%icc,	%l4,	%o7
	sllx	%l3,	%l2,	%g6
	ldd	[%l7 + 0x08],	%f22
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	mova	%xcc,	%i7,	%i3
	sth	%g4,	[%l7 + 0x62]
	st	%f27,	[%l7 + 0x50]
	movl	%xcc,	%l0,	%o0
	sdivcc	%l6,	0x0E2C,	%o5
	sub	%i4,	0x1497,	%g7
	sir	0x0818
	fzeros	%f8
	edge16l	%i1,	%o2,	%i5
	fmul8x16au	%f21,	%f5,	%f18
	xnor	%g2,	%g3,	%i6
	fmovrdgz	%g5,	%f12,	%f14
	orn	%i2,	%i0,	%g1
	popc	0x1C02,	%o6
	udiv	%l1,	0x1299,	%l4
	array16	%o7,	%l3,	%l2
	movvs	%xcc,	%g6,	%o3
	movpos	%icc,	%o1,	%l5
	nop
	set	0x22, %g7
	stb	%o4,	[%l7 + %g7]
	movl	%xcc,	%i7,	%i3
	ld	[%l7 + 0x40],	%f18
	movrne	%l0,	%o0,	%g4
	xnor	%o5,	%i4,	%l6
	fmovsvc	%xcc,	%f21,	%f13
	fmovsne	%xcc,	%f0,	%f12
	alignaddr	%g7,	%i1,	%i5
	fmovrslz	%g2,	%f3,	%f21
	edge16n	%g3,	%i6,	%g5
	add	%i2,	%o2,	%g1
	addccc	%o6,	%l1,	%i0
	movne	%xcc,	%o7,	%l3
	movge	%icc,	%l2,	%l4
	movpos	%xcc,	%o3,	%g6
	ldub	[%l7 + 0x40],	%o1
	addcc	%o4,	0x09F4,	%l5
	fmovsge	%icc,	%f20,	%f21
	add	%i7,	%i3,	%o0
	fmovrsgez	%g4,	%f6,	%f22
	movrgz	%l0,	0x3A9,	%i4
	edge16ln	%o5,	%l6,	%i1
	movrgez	%g7,	0x3D7,	%i5
	edge8n	%g3,	%i6,	%g2
	fmovscs	%xcc,	%f21,	%f0
	srl	%g5,	0x12,	%i2
	movrne	%g1,	0x0C5,	%o6
	edge8	%o2,	%l1,	%i0
	orcc	%o7,	%l3,	%l4
	andncc	%l2,	%o3,	%o1
	lduh	[%l7 + 0x22],	%g6
	subcc	%l5,	0x04F7,	%i7
	mulx	%i3,	%o0,	%o4
	orn	%g4,	0x1CF7,	%i4
	movvc	%xcc,	%l0,	%o5
	sir	0x193D
	ldub	[%l7 + 0x40],	%i1
	edge16n	%l6,	%g7,	%g3
	movrlez	%i6,	0x180,	%g2
	udivcc	%g5,	0x06F7,	%i5
	movl	%xcc,	%i2,	%o6
	fmovsgu	%icc,	%f15,	%f11
	edge8n	%o2,	%g1,	%l1
	addcc	%i0,	%l3,	%l4
	fandnot2s	%f25,	%f11,	%f15
	fnot2s	%f27,	%f2
	movn	%xcc,	%o7,	%o3
	fnors	%f13,	%f13,	%f6
	edge16l	%l2,	%o1,	%g6
	for	%f14,	%f24,	%f28
	alignaddrl	%i7,	%i3,	%l5
	movpos	%icc,	%o4,	%g4
	movleu	%icc,	%o0,	%i4
	fmovdpos	%icc,	%f3,	%f2
	ldd	[%l7 + 0x20],	%o4
	movvc	%icc,	%l0,	%l6
	fmovdgu	%icc,	%f14,	%f26
	andncc	%g7,	%i1,	%g3
	movrlz	%i6,	%g5,	%i5
	sdiv	%g2,	0x0C55,	%i2
	fmovsge	%icc,	%f8,	%f8
	edge16l	%o2,	%o6,	%l1
	lduw	[%l7 + 0x0C],	%i0
	fnands	%f1,	%f1,	%f15
	fmovd	%f18,	%f8
	or	%g1,	0x142F,	%l4
	fone	%f16
	nop
	set	0x48, %l5
	std	%f16,	[%l7 + %l5]
	movpos	%xcc,	%o7,	%l3
	udivcc	%o3,	0x139A,	%o1
	alignaddrl	%g6,	%i7,	%i3
	xor	%l5,	0x0192,	%o4
	ldsb	[%l7 + 0x27],	%g4
	movrne	%o0,	0x1C7,	%l2
	array16	%o5,	%i4,	%l0
	nop
	set	0x20, %l6
	ldd	[%l7 + %l6],	%f10
	fornot1	%f22,	%f16,	%f6
	sllx	%g7,	0x19,	%l6
	fnands	%f24,	%f17,	%f26
	fcmple32	%f12,	%f18,	%i1
	fnors	%f18,	%f21,	%f17
	sub	%g3,	%g5,	%i5
	fpsub32	%f26,	%f4,	%f30
	edge16l	%i6,	%g2,	%i2
	array16	%o6,	%o2,	%l1
	movcc	%xcc,	%i0,	%g1
	std	%f6,	[%l7 + 0x40]
	movpos	%icc,	%l4,	%l3
	edge32	%o7,	%o1,	%g6
	edge8n	%o3,	%i7,	%i3
	orncc	%o4,	0x1BCA,	%l5
	edge8l	%o0,	%l2,	%g4
	lduw	[%l7 + 0x3C],	%o5
	andcc	%l0,	%g7,	%i4
	subc	%i1,	%l6,	%g3
	movle	%xcc,	%i5,	%i6
	xnor	%g2,	%i2,	%o6
	ldsh	[%l7 + 0x2C],	%o2
	movrlz	%g5,	0x06D,	%i0
	stw	%g1,	[%l7 + 0x38]
	sth	%l1,	[%l7 + 0x7C]
	movge	%xcc,	%l3,	%o7
	st	%f6,	[%l7 + 0x4C]
	smulcc	%o1,	%l4,	%o3
	srlx	%g6,	%i7,	%i3
	andcc	%o4,	0x0584,	%o0
	movrlez	%l5,	0x3E5,	%g4
	movl	%xcc,	%o5,	%l2
	movgu	%xcc,	%g7,	%i4
	fmuld8ulx16	%f0,	%f5,	%f18
	addcc	%l0,	0x1BB3,	%i1
	xnorcc	%l6,	0x089A,	%i5
	movrne	%i6,	0x276,	%g2
	restore %i2, 0x063D, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%o2,	%g3,	%g5
	edge16l	%g1,	%i0,	%l1
	smul	%l3,	0x0752,	%o7
	stb	%o1,	[%l7 + 0x58]
	udivx	%o3,	0x0FA3,	%g6
	smulcc	%i7,	0x16DA,	%i3
	sethi	0x1CC7,	%o4
	movrlz	%l4,	0x3D9,	%l5
	or	%o0,	0x094D,	%g4
	ld	[%l7 + 0x30],	%f31
	sub	%o5,	0x0C8A,	%g7
	fcmple16	%f14,	%f20,	%i4
	movcc	%icc,	%l2,	%l0
	umul	%l6,	%i1,	%i6
	sllx	%g2,	0x1A,	%i2
	ldub	[%l7 + 0x7D],	%o6
	movvc	%xcc,	%o2,	%g3
	fpsub32s	%f5,	%f5,	%f16
	movcs	%icc,	%g5,	%i5
	xorcc	%g1,	0x19B0,	%i0
	fmovda	%icc,	%f4,	%f7
	addcc	%l3,	%o7,	%o1
	srlx	%o3,	%l1,	%g6
	movgu	%icc,	%i3,	%i7
	addc	%l4,	0x1B83,	%o4
	lduw	[%l7 + 0x78],	%l5
	array32	%o0,	%g4,	%o5
	fcmpne16	%f24,	%f14,	%g7
	sth	%i4,	[%l7 + 0x7A]
	fand	%f10,	%f30,	%f28
	xnor	%l2,	%l6,	%l0
	movpos	%icc,	%i1,	%i6
	movg	%xcc,	%g2,	%o6
	mulx	%i2,	0x017B,	%o2
	popc	%g3,	%i5
	movvc	%icc,	%g5,	%g1
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	fmul8sux16	%f22,	%f0,	%f12
	ldsb	[%l7 + 0x72],	%o1
	ldd	[%l7 + 0x68],	%l2
	fornot2s	%f17,	%f31,	%f9
	edge16l	%l1,	%o3,	%i3
	andcc	%g6,	%i7,	%o4
	fmovscs	%xcc,	%f7,	%f14
	ldsb	[%l7 + 0x1D],	%l4
	stw	%l5,	[%l7 + 0x5C]
	movneg	%xcc,	%o0,	%g4
	fnot1s	%f13,	%f11
	fsrc2	%f10,	%f6
	movrgz	%g7,	0x231,	%o5
	fmul8x16	%f23,	%f6,	%f0
	edge32n	%l2,	%i4,	%l0
	srax	%i1,	%l6,	%g2
	udivx	%o6,	0x0BBE,	%i6
	alignaddrl	%o2,	%i2,	%i5
	fmovsn	%icc,	%f0,	%f4
	fmovdle	%xcc,	%f30,	%f5
	ldd	[%l7 + 0x08],	%g4
	edge8n	%g1,	%g3,	%i0
	fmovdvs	%xcc,	%f25,	%f27
	edge16ln	%o7,	%o1,	%l1
	orn	%o3,	0x1EA5,	%l3
	edge16l	%g6,	%i3,	%o4
	mulscc	%l4,	%l5,	%o0
	fmovrdgez	%g4,	%f6,	%f24
	fcmpgt32	%f10,	%f2,	%g7
	addccc	%o5,	%l2,	%i7
	movrlez	%i4,	%i1,	%l6
	sir	0x10AB
	sdiv	%g2,	0x1D11,	%l0
	array8	%i6,	%o2,	%o6
	movre	%i2,	0x041,	%g5
	movrgez	%i5,	%g3,	%i0
	fornot2s	%f1,	%f10,	%f8
	xnorcc	%g1,	%o7,	%l1
	fpsub32	%f6,	%f2,	%f10
	fmuld8sux16	%f22,	%f1,	%f28
	movrgez	%o1,	%l3,	%o3
	ld	[%l7 + 0x70],	%f29
	lduh	[%l7 + 0x5C],	%g6
	fornot1s	%f31,	%f23,	%f4
	movpos	%icc,	%i3,	%l4
	fand	%f22,	%f22,	%f6
	array32	%o4,	%l5,	%o0
	mova	%icc,	%g4,	%g7
	ldd	[%l7 + 0x60],	%l2
	sdivx	%o5,	0x0FCA,	%i7
	movcs	%xcc,	%i4,	%i1
	sdivcc	%g2,	0x0941,	%l0
	lduw	[%l7 + 0x68],	%l6
	fcmped	%fcc0,	%f18,	%f14
	andncc	%o2,	%o6,	%i6
	fmovrdgz	%g5,	%f22,	%f2
	popc	%i2,	%g3
	movrlz	%i0,	0x05D,	%i5
	stw	%o7,	[%l7 + 0x48]
	mulscc	%l1,	%g1,	%l3
	srlx	%o1,	0x15,	%o3
	fsrc2s	%f24,	%f29
	udiv	%g6,	0x1DFF,	%l4
	subc	%o4,	0x1165,	%l5
	umul	%o0,	0x0230,	%g4
	restore %g7, %l2, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%i7,	%i4
	umulcc	%i1,	%g2,	%i3
	fandnot1s	%f19,	%f18,	%f7
	lduw	[%l7 + 0x7C],	%l6
	movcs	%icc,	%l0,	%o2
	ldub	[%l7 + 0x55],	%i6
	orcc	%o6,	0x1FED,	%i2
	ldd	[%l7 + 0x20],	%g4
	umulcc	%g3,	%i5,	%i0
	edge32	%o7,	%l1,	%l3
	orcc	%g1,	0x1368,	%o1
	xorcc	%o3,	%g6,	%l4
	lduw	[%l7 + 0x34],	%o4
	andn	%l5,	%g4,	%g7
	edge32n	%o0,	%o5,	%i7
	smulcc	%i4,	0x1B51,	%l2
	edge32ln	%i1,	%g2,	%l6
	movrgz	%i3,	0x139,	%o2
	array8	%l0,	%i6,	%o6
	movpos	%xcc,	%g5,	%i2
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	xnorcc	%l1,	0x056C,	%l3
	ldsb	[%l7 + 0x57],	%o7
	mulx	%o1,	%g1,	%g6
	std	%f10,	[%l7 + 0x48]
	edge32	%o3,	%o4,	%l4
	fxors	%f18,	%f28,	%f28
	edge32	%g4,	%g7,	%l5
	fmovsa	%icc,	%f28,	%f9
	lduw	[%l7 + 0x68],	%o5
	sth	%i7,	[%l7 + 0x14]
	srlx	%o0,	%l2,	%i1
	fmovsne	%icc,	%f0,	%f23
	sub	%i4,	%l6,	%i3
	movvs	%xcc,	%o2,	%g2
	sdiv	%l0,	0x10E7,	%i6
	fnands	%f4,	%f22,	%f21
	movre	%g5,	%o6,	%i5
	fmovrdgz	%i2,	%f4,	%f20
	ldsw	[%l7 + 0x6C],	%g3
	fexpand	%f5,	%f30
	addc	%i0,	%l3,	%o7
	movrlz	%o1,	0x316,	%g1
	fcmps	%fcc1,	%f20,	%f28
	array32	%g6,	%l1,	%o4
	ldub	[%l7 + 0x2D],	%l4
	edge32l	%o3,	%g7,	%l5
	movrne	%g4,	0x3D3,	%o5
	sdivcc	%o0,	0x01BE,	%l2
	udiv	%i1,	0x1248,	%i7
	lduh	[%l7 + 0x72],	%l6
	andn	%i3,	%i4,	%g2
	fmul8x16	%f31,	%f22,	%f14
	sth	%o2,	[%l7 + 0x22]
	sir	0x0AE7
	lduw	[%l7 + 0x54],	%i6
	movle	%xcc,	%g5,	%l0
	or	%i5,	%o6,	%i2
	fmovsle	%xcc,	%f16,	%f10
	edge32n	%g3,	%i0,	%o7
	save %o1, 0x0C8C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%g6,	%l3,	%l1
	fmovrdgez	%o4,	%f0,	%f18
	sdivx	%o3,	0x0C95,	%g7
	edge32	%l4,	%l5,	%g4
	fmovdvc	%xcc,	%f1,	%f16
	ld	[%l7 + 0x10],	%f16
	movrne	%o0,	0x235,	%o5
	movre	%l2,	%i1,	%i7
	sllx	%l6,	%i3,	%g2
	fmul8x16	%f18,	%f4,	%f14
	orncc	%o2,	%i4,	%g5
	fpack16	%f2,	%f2
	umul	%l0,	%i6,	%o6
	edge8n	%i2,	%g3,	%i0
	subcc	%i5,	0x0CB0,	%o7
	fmul8x16al	%f27,	%f13,	%f18
	edge8ln	%g1,	%o1,	%g6
	movge	%icc,	%l1,	%o4
	smulcc	%l3,	0x1E72,	%g7
	fexpand	%f16,	%f24
	andn	%l4,	%l5,	%g4
	fexpand	%f7,	%f30
	udiv	%o0,	0x068B,	%o3
	subccc	%l2,	0x1849,	%o5
	edge16n	%i7,	%l6,	%i1
	popc	%i3,	%g2
	orn	%i4,	%g5,	%l0
	movn	%xcc,	%o2,	%i6
	sdiv	%i2,	0x1751,	%g3
	edge8l	%i0,	%i5,	%o7
	umulcc	%g1,	%o6,	%o1
	ld	[%l7 + 0x10],	%f5
	sub	%g6,	%l1,	%l3
	movgu	%icc,	%g7,	%o4
	faligndata	%f22,	%f30,	%f10
	ldx	[%l7 + 0x40],	%l4
	edge32	%g4,	%l5,	%o0
	edge16l	%o3,	%o5,	%l2
	fzeros	%f5
	movrlz	%i7,	0x399,	%l6
	udivx	%i3,	0x1717,	%i1
	edge32ln	%g2,	%i4,	%g5
	fmovdvc	%icc,	%f29,	%f19
	fnor	%f28,	%f18,	%f8
	edge8ln	%l0,	%i6,	%o2
	fmovrsgz	%g3,	%f13,	%f14
	edge16	%i2,	%i5,	%i0
	fmovspos	%xcc,	%f27,	%f7
	ldsw	[%l7 + 0x50],	%o7
	srax	%o6,	%o1,	%g1
	movrne	%g6,	0x25C,	%l3
	ld	[%l7 + 0x08],	%f13
	restore %g7, 0x0365, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldd	[%l7 + 0x38],	%f0
	movrgz	%l4,	%o4,	%l5
	sth	%o0,	[%l7 + 0x62]
	fcmple16	%f24,	%f24,	%o3
	alignaddrl	%g4,	%o5,	%i7
	and	%l6,	0x1E39,	%l2
	fmovscc	%icc,	%f16,	%f17
	xnor	%i1,	%i3,	%i4
	stw	%g2,	[%l7 + 0x50]
	xor	%g5,	%l0,	%o2
	subccc	%i6,	%g3,	%i5
	ldd	[%l7 + 0x48],	%f18
	fcmpne16	%f30,	%f28,	%i0
	fzeros	%f17
	fabss	%f24,	%f19
	sll	%i2,	0x1D,	%o7
	srlx	%o6,	%o1,	%g6
	movl	%xcc,	%g1,	%g7
	fmovscs	%xcc,	%f24,	%f9
	edge8n	%l1,	%l4,	%l3
	movleu	%icc,	%o4,	%o0
	movcs	%icc,	%o3,	%g4
	sdivcc	%o5,	0x0C58,	%i7
	edge16ln	%l6,	%l5,	%l2
	edge16	%i3,	%i4,	%g2
	stw	%g5,	[%l7 + 0x2C]
	edge8l	%l0,	%o2,	%i1
	sethi	0x1E2C,	%g3
	fmovd	%f30,	%f28
	stw	%i6,	[%l7 + 0x74]
	movgu	%icc,	%i5,	%i0
	fmovdpos	%icc,	%f24,	%f21
	movre	%i2,	0x042,	%o6
	umulcc	%o7,	0x1DC5,	%g6
	movg	%icc,	%o1,	%g1
	smulcc	%l1,	0x1F23,	%g7
	andcc	%l4,	%l3,	%o0
	fone	%f30
	sra	%o3,	%o4,	%g4
	fexpand	%f18,	%f30
	movleu	%xcc,	%i7,	%o5
	movne	%xcc,	%l5,	%l2
	fcmple32	%f12,	%f20,	%l6
	fmovsl	%xcc,	%f26,	%f21
	orcc	%i4,	0x000C,	%i3
	fmovsa	%icc,	%f7,	%f30
	popc	%g2,	%l0
	movrgz	%o2,	%g5,	%i1
	andn	%g3,	%i6,	%i0
	fornot2	%f24,	%f14,	%f0
	fmovrsne	%i5,	%f17,	%f5
	udivcc	%i2,	0x0035,	%o7
	mulscc	%g6,	%o1,	%g1
	siam	0x5
	movn	%xcc,	%o6,	%g7
	movgu	%icc,	%l1,	%l4
	movvc	%icc,	%l3,	%o0
	fabss	%f5,	%f4
	array16	%o4,	%o3,	%g4
	orn	%i7,	0x1E6D,	%l5
	udivx	%l2,	0x1BA0,	%o5
	orncc	%l6,	0x0122,	%i4
	edge32	%i3,	%l0,	%o2
	st	%f18,	[%l7 + 0x0C]
	movcc	%icc,	%g5,	%g2
	fmovrsgez	%g3,	%f6,	%f8
	xnorcc	%i1,	%i0,	%i6
	mulscc	%i5,	0x064A,	%o7
	move	%xcc,	%g6,	%o1
	fnegs	%f22,	%f26
	movl	%icc,	%i2,	%g1
	stw	%g7,	[%l7 + 0x60]
	lduw	[%l7 + 0x50],	%l1
	edge32	%l4,	%l3,	%o0
	fnegd	%f16,	%f30
	movle	%icc,	%o4,	%o3
	sethi	0x1B4F,	%g4
	movvc	%icc,	%o6,	%i7
	movrlz	%l2,	%o5,	%l5
	xnor	%l6,	0x19C6,	%i3
	mulscc	%i4,	0x132D,	%l0
	ldsb	[%l7 + 0x54],	%g5
	sethi	0x05DF,	%g2
	save %g3, 0x1470, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%i0,	%i1,	%i5
	movpos	%icc,	%i6,	%g6
	fcmple32	%f30,	%f16,	%o1
	and	%o7,	%g1,	%i2
	pdist	%f4,	%f20,	%f0
	orncc	%g7,	%l4,	%l1
	fmovdge	%icc,	%f22,	%f24
	fmovde	%icc,	%f11,	%f13
	ldsh	[%l7 + 0x56],	%o0
	movcs	%icc,	%l3,	%o3
	pdist	%f20,	%f2,	%f26
	fnand	%f10,	%f10,	%f4
	fmovdgu	%icc,	%f31,	%f22
	xnorcc	%o4,	0x09C1,	%g4
	fmul8x16au	%f13,	%f21,	%f20
	fcmpgt32	%f22,	%f30,	%o6
	fmovdvs	%xcc,	%f0,	%f21
	fmovdl	%xcc,	%f31,	%f5
	sdivcc	%l2,	0x0287,	%i7
	fmovsne	%xcc,	%f27,	%f10
	edge8l	%l5,	%l6,	%o5
	fcmple32	%f12,	%f30,	%i3
	movpos	%icc,	%i4,	%g5
	orcc	%g2,	%l0,	%g3
	sdivcc	%i0,	0x187B,	%i1
	edge16n	%o2,	%i6,	%i5
	nop
	set	0x74, %g3
	ldsh	[%l7 + %g3],	%o1
	movne	%xcc,	%g6,	%g1
	fsrc1s	%f22,	%f20
	and	%o7,	0x0AAE,	%g7
	fmovdvs	%xcc,	%f2,	%f21
	fmovs	%f16,	%f29
	ldub	[%l7 + 0x46],	%l4
	edge8	%i2,	%l1,	%l3
	edge8l	%o3,	%o4,	%o0
	alignaddrl	%g4,	%l2,	%i7
	lduh	[%l7 + 0x74],	%o6
	movle	%xcc,	%l5,	%o5
	subc	%l6,	%i4,	%g5
	fcmple16	%f28,	%f18,	%i3
	sethi	0x0ACD,	%l0
	movvc	%xcc,	%g2,	%i0
	movrne	%i1,	0x2FC,	%o2
	ldub	[%l7 + 0x08],	%i6
	and	%i5,	0x19D3,	%g3
	ldsh	[%l7 + 0x16],	%o1
	fmovrdgz	%g6,	%f8,	%f0
	alignaddr	%g1,	%g7,	%l4
	edge32l	%o7,	%l1,	%l3
	fmovsa	%xcc,	%f5,	%f22
	movge	%icc,	%o3,	%o4
	fpadd32	%f20,	%f4,	%f12
	ld	[%l7 + 0x40],	%f25
	umulcc	%i2,	%o0,	%l2
	edge32n	%g4,	%i7,	%l5
	fmovsg	%xcc,	%f28,	%f14
	fmul8x16	%f11,	%f4,	%f22
	ldd	[%l7 + 0x60],	%o4
	fxor	%f12,	%f10,	%f2
	fandnot1	%f8,	%f18,	%f30
	stw	%l6,	[%l7 + 0x74]
	fnegs	%f1,	%f21
	fmuld8ulx16	%f3,	%f12,	%f20
	movne	%xcc,	%o6,	%g5
	fnegd	%f12,	%f26
	fsrc1	%f18,	%f18
	fxors	%f14,	%f19,	%f25
	move	%icc,	%i4,	%i3
	ldsw	[%l7 + 0x54],	%g2
	sll	%l0,	%i0,	%i1
	array32	%i6,	%o2,	%i5
	orcc	%g3,	0x13BA,	%g6
	xorcc	%g1,	0x0636,	%o1
	movn	%xcc,	%g7,	%l4
	fmovs	%f27,	%f20
	xnor	%l1,	%l3,	%o7
	fmovdcc	%icc,	%f26,	%f2
	fmul8x16au	%f17,	%f26,	%f14
	ldd	[%l7 + 0x10],	%o2
	edge16ln	%o4,	%i2,	%o0
	movgu	%xcc,	%l2,	%i7
	ldsh	[%l7 + 0x0C],	%l5
	mulscc	%g4,	%o5,	%l6
	udivcc	%o6,	0x1A62,	%g5
	fsrc1	%f16,	%f8
	fors	%f7,	%f23,	%f29
	alignaddrl	%i4,	%g2,	%i3
	fmovdpos	%xcc,	%f15,	%f25
	fmovrdlz	%l0,	%f26,	%f2
	subcc	%i0,	%i1,	%o2
	lduh	[%l7 + 0x46],	%i6
	mova	%icc,	%i5,	%g3
	bshuffle	%f16,	%f6,	%f10
	sra	%g1,	0x18,	%o1
	nop
	set	0x68, %i6
	ldd	[%l7 + %i6],	%g6
	edge16l	%g7,	%l1,	%l4
	addc	%l3,	%o7,	%o3
	fpadd16	%f24,	%f10,	%f20
	movrlez	%o4,	%o0,	%l2
	fpackfix	%f0,	%f20
	udivcc	%i7,	0x1803,	%l5
	mulx	%i2,	%g4,	%o5
	udiv	%o6,	0x1ACF,	%l6
	ldsb	[%l7 + 0x1F],	%i4
	mulx	%g2,	%g5,	%l0
	subc	%i3,	0x1404,	%i1
	fxors	%f22,	%f8,	%f28
	edge8	%i0,	%i6,	%i5
	or	%o2,	%g3,	%g1
	orn	%g6,	%g7,	%l1
	fzeros	%f15
	subccc	%l4,	%o1,	%l3
	movge	%xcc,	%o7,	%o3
	movn	%xcc,	%o4,	%o0
	array16	%l2,	%l5,	%i7
	fmul8x16al	%f16,	%f13,	%f12
	fpadd16	%f18,	%f22,	%f20
	ldd	[%l7 + 0x40],	%f26
	sir	0x0C6A
	movcc	%xcc,	%i2,	%g4
	fpmerge	%f24,	%f25,	%f18
	movrgz	%o5,	0x3FA,	%o6
	move	%xcc,	%l6,	%i4
	movrgz	%g2,	0x1C8,	%g5
	popc	%i3,	%l0
	srlx	%i1,	%i0,	%i6
	fcmps	%fcc1,	%f18,	%f7
	movleu	%xcc,	%o2,	%i5
	sll	%g3,	%g1,	%g6
	movvc	%xcc,	%l1,	%g7
	move	%icc,	%o1,	%l3
	sllx	%l4,	0x1F,	%o3
	array16	%o7,	%o0,	%o4
	fnors	%f19,	%f29,	%f2
	umul	%l5,	0x03EB,	%l2
	faligndata	%f12,	%f16,	%f16
	fors	%f18,	%f10,	%f1
	array8	%i7,	%g4,	%i2
	orncc	%o6,	0x024A,	%o5
	sethi	0x081E,	%i4
	fornot2s	%f3,	%f14,	%f17
	edge8n	%g2,	%l6,	%g5
	addc	%l0,	0x1BC6,	%i3
	ldx	[%l7 + 0x38],	%i0
	subccc	%i6,	0x0B80,	%o2
	move	%xcc,	%i5,	%g3
	fnors	%f14,	%f25,	%f3
	fmovsg	%xcc,	%f15,	%f18
	andn	%g1,	%g6,	%l1
	movgu	%icc,	%i1,	%g7
	movrgz	%o1,	0x006,	%l3
	xor	%l4,	%o7,	%o3
	movcc	%icc,	%o0,	%l5
	sdiv	%o4,	0x1D30,	%i7
	movcs	%icc,	%l2,	%i2
	fpackfix	%f8,	%f2
	addccc	%o6,	0x1352,	%g4
	srax	%i4,	%g2,	%o5
	movcc	%icc,	%g5,	%l6
	movrne	%l0,	0x318,	%i3
	edge32n	%i0,	%o2,	%i6
	movcs	%xcc,	%g3,	%g1
	ldsh	[%l7 + 0x66],	%g6
	fcmped	%fcc1,	%f24,	%f2
	st	%f19,	[%l7 + 0x30]
	alignaddrl	%i5,	%i1,	%g7
	edge8ln	%l1,	%o1,	%l4
	sethi	0x0A10,	%l3
	stw	%o7,	[%l7 + 0x28]
	fmovdneg	%xcc,	%f20,	%f24
	srax	%o0,	%l5,	%o3
	movcs	%xcc,	%i7,	%l2
	orcc	%o4,	0x034B,	%i2
	movneg	%xcc,	%o6,	%g4
	fxor	%f26,	%f14,	%f30
	edge16	%g2,	%i4,	%g5
	fmovdpos	%xcc,	%f0,	%f12
	fmovdn	%xcc,	%f31,	%f8
	fmovrdne	%o5,	%f20,	%f26
	ldub	[%l7 + 0x66],	%l0
	movge	%icc,	%l6,	%i0
	ldd	[%l7 + 0x40],	%i2
	lduh	[%l7 + 0x62],	%o2
	for	%f14,	%f24,	%f6
	alignaddrl	%g3,	%i6,	%g6
	fnegd	%f18,	%f4
	addc	%i5,	0x11ED,	%i1
	movneg	%icc,	%g1,	%g7
	ld	[%l7 + 0x08],	%f15
	sub	%o1,	0x033D,	%l4
	or	%l3,	%l1,	%o0
	fpadd16	%f8,	%f12,	%f2
	addcc	%o7,	%l5,	%i7
	umul	%o3,	%l2,	%o4
	move	%icc,	%i2,	%o6
	move	%xcc,	%g4,	%g2
	addccc	%i4,	%o5,	%g5
	sethi	0x1314,	%l6
	sll	%i0,	%i3,	%l0
	fpsub16s	%f8,	%f13,	%f19
	fmul8x16	%f13,	%f28,	%f30
	ldsb	[%l7 + 0x64],	%g3
	edge16n	%i6,	%o2,	%i5
	fzeros	%f29
	fnot1	%f18,	%f26
	udiv	%i1,	0x1C50,	%g6
	srlx	%g1,	0x0E,	%o1
	nop
	set	0x32, %l3
	stb	%l4,	[%l7 + %l3]
	udivcc	%g7,	0x0E81,	%l1
	andcc	%l3,	0x0345,	%o0
	fand	%f14,	%f30,	%f16
	fmovscs	%icc,	%f6,	%f11
	fmovdcs	%xcc,	%f25,	%f29
	mova	%icc,	%l5,	%o7
	nop
	set	0x50, %l1
	ldx	[%l7 + %l1],	%o3
	sdivcc	%l2,	0x0CB7,	%i7
	movcc	%xcc,	%o4,	%i2
	ldd	[%l7 + 0x40],	%f22
	array8	%g4,	%o6,	%g2
	lduw	[%l7 + 0x28],	%i4
	edge8	%g5,	%o5,	%i0
	fnot1s	%f30,	%f28
	movvc	%xcc,	%i3,	%l6
	edge8	%l0,	%g3,	%i6
	ldsh	[%l7 + 0x16],	%i5
	mulx	%o2,	0x1DB0,	%i1
	movre	%g6,	0x0DA,	%g1
	or	%o1,	0x1389,	%g7
	nop
	set	0x12, %l4
	sth	%l1,	[%l7 + %l4]
	subc	%l3,	0x0D73,	%o0
	subccc	%l5,	0x1D0D,	%o7
	movrgez	%l4,	0x381,	%l2
	movrgez	%o3,	%o4,	%i7
	edge8l	%g4,	%i2,	%o6
	edge32ln	%i4,	%g5,	%o5
	fmovrsgez	%g2,	%f18,	%f3
	edge32ln	%i3,	%l6,	%i0
	fmovspos	%icc,	%f0,	%f7
	edge16ln	%g3,	%i6,	%l0
	movrlez	%i5,	%i1,	%o2
	and	%g1,	0x05EA,	%g6
	nop
	set	0x20, %o1
	std	%f12,	[%l7 + %o1]
	srl	%g7,	%o1,	%l3
	stw	%o0,	[%l7 + 0x54]
	srax	%l1,	0x1D,	%l5
	fnegs	%f4,	%f16
	stb	%l4,	[%l7 + 0x58]
	sth	%o7,	[%l7 + 0x40]
	edge16ln	%l2,	%o3,	%o4
	fmovsg	%icc,	%f6,	%f7
	movvs	%xcc,	%i7,	%g4
	ldx	[%l7 + 0x70],	%o6
	alignaddr	%i4,	%g5,	%i2
	mulx	%o5,	0x0D54,	%i3
	smul	%g2,	%i0,	%g3
	fnors	%f26,	%f31,	%f9
	and	%i6,	%l0,	%i5
	add	%l6,	0x0A9F,	%i1
	ldd	[%l7 + 0x40],	%f8
	edge16n	%o2,	%g6,	%g7
	fands	%f12,	%f4,	%f29
	ldd	[%l7 + 0x40],	%f24
	sllx	%g1,	%l3,	%o1
	ld	[%l7 + 0x2C],	%f7
	ldsh	[%l7 + 0x22],	%l1
	subcc	%o0,	0x0D2E,	%l5
	mova	%xcc,	%l4,	%l2
	movleu	%icc,	%o7,	%o4
	edge16n	%o3,	%i7,	%o6
	movl	%icc,	%g4,	%i4
	fmovsneg	%icc,	%f6,	%f20
	sth	%g5,	[%l7 + 0x44]
	xor	%o5,	0x1A0D,	%i3
	srlx	%i2,	%g2,	%i0
	ld	[%l7 + 0x70],	%f1
	fors	%f10,	%f2,	%f23
	fcmpd	%fcc2,	%f16,	%f4
	sir	0x1A7A
	fcmpeq32	%f8,	%f20,	%g3
	add	%i6,	0x0FB6,	%l0
	fnot1s	%f27,	%f31
	fandnot1s	%f15,	%f14,	%f25
	fmovdneg	%xcc,	%f2,	%f21
	ldub	[%l7 + 0x36],	%i5
	movpos	%icc,	%i1,	%l6
	srax	%g6,	0x06,	%o2
	edge32l	%g1,	%g7,	%l3
	movleu	%icc,	%o1,	%l1
	movg	%xcc,	%o0,	%l4
	array32	%l5,	%l2,	%o4
	fmovrsgez	%o7,	%f5,	%f24
	nop
	set	0x68, %g4
	stx	%i7,	[%l7 + %g4]
	alignaddr	%o3,	%o6,	%i4
	orcc	%g4,	0x0836,	%g5
	faligndata	%f30,	%f24,	%f10
	alignaddr	%o5,	%i2,	%g2
	movrgez	%i3,	%i0,	%g3
	movrlez	%i6,	0x10E,	%i5
	srax	%l0,	0x17,	%i1
	movrgz	%l6,	0x365,	%g6
	save %g1, 0x142A, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g7,	%l3,	%o1
	umul	%o0,	0x0C67,	%l1
	lduw	[%l7 + 0x6C],	%l4
	st	%f29,	[%l7 + 0x18]
	fcmple16	%f30,	%f14,	%l2
	fmovrde	%l5,	%f8,	%f14
	movrlez	%o7,	%o4,	%i7
	nop
	set	0x13, %i3
	ldub	[%l7 + %i3],	%o3
	smul	%o6,	%g4,	%g5
	ld	[%l7 + 0x10],	%f15
	movneg	%icc,	%o5,	%i2
	umulcc	%g2,	0x1D60,	%i3
	sir	0x0E27
	move	%xcc,	%i0,	%i4
	sra	%g3,	%i5,	%i6
	fsrc2	%f18,	%f16
	fors	%f8,	%f31,	%f29
	ld	[%l7 + 0x3C],	%f18
	fmuld8sux16	%f23,	%f26,	%f30
	movrne	%l0,	%l6,	%i1
	edge8ln	%g6,	%o2,	%g7
	fnand	%f16,	%f4,	%f6
	movleu	%xcc,	%g1,	%o1
	fpmerge	%f7,	%f13,	%f12
	edge16ln	%o0,	%l1,	%l4
	sdivx	%l3,	0x1526,	%l5
	edge32	%l2,	%o7,	%o4
	move	%xcc,	%o3,	%o6
	edge16l	%g4,	%i7,	%g5
	sth	%o5,	[%l7 + 0x2E]
	for	%f22,	%f2,	%f30
	fmovsne	%icc,	%f22,	%f15
	movne	%xcc,	%g2,	%i2
	xnorcc	%i3,	%i4,	%g3
	fexpand	%f17,	%f12
	movvs	%icc,	%i0,	%i6
	stw	%i5,	[%l7 + 0x4C]
	lduw	[%l7 + 0x50],	%l6
	srax	%i1,	%g6,	%o2
	sir	0x109A
	array16	%l0,	%g7,	%g1
	edge8l	%o1,	%o0,	%l1
	addccc	%l4,	%l5,	%l2
	fxnors	%f9,	%f5,	%f27
	sdiv	%o7,	0x1F7B,	%l3
	bshuffle	%f18,	%f16,	%f28
	ldd	[%l7 + 0x20],	%o2
	edge16l	%o4,	%g4,	%o6
	edge8	%g5,	%i7,	%o5
	fmovsl	%xcc,	%f23,	%f7
	movneg	%icc,	%i2,	%i3
	subcc	%i4,	0x196E,	%g2
	mulscc	%i0,	0x086F,	%i6
	movgu	%xcc,	%i5,	%g3
	fmovse	%xcc,	%f5,	%f29
	fzero	%f10
	sub	%i1,	%g6,	%l6
	fpsub32s	%f2,	%f28,	%f24
	movre	%o2,	%g7,	%g1
	fmovde	%xcc,	%f30,	%f15
	stx	%l0,	[%l7 + 0x18]
	srl	%o1,	%l1,	%l4
	alignaddrl	%l5,	%o0,	%o7
	udivcc	%l2,	0x015E,	%l3
	fmovrdne	%o4,	%f24,	%f24
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	fmovsg	%xcc,	%f17,	%f28
	edge32l	%o6,	%i7,	%g5
	alignaddrl	%o5,	%i3,	%i2
	srl	%i4,	0x1B,	%g2
	movrlz	%i0,	%i5,	%i6
	orn	%g3,	%i1,	%g6
	stx	%o2,	[%l7 + 0x70]
	sdiv	%l6,	0x02C0,	%g1
	sra	%l0,	0x08,	%o1
	ldx	[%l7 + 0x50],	%l1
	ldd	[%l7 + 0x70],	%l4
	subccc	%l5,	%o0,	%g7
	movrgez	%o7,	0x1DF,	%l2
	fsrc2	%f6,	%f24
	addccc	%l3,	0x122F,	%g4
	std	%f10,	[%l7 + 0x50]
	xnorcc	%o4,	%o6,	%i7
	ldub	[%l7 + 0x13],	%o3
	lduh	[%l7 + 0x34],	%g5
	fabss	%f3,	%f2
	popc	0x0A92,	%o5
	stw	%i3,	[%l7 + 0x50]
	fzero	%f0
	udivx	%i4,	0x126D,	%g2
	array32	%i2,	%i0,	%i5
	fmovrslez	%i6,	%f21,	%f11
	ldd	[%l7 + 0x38],	%f2
	movrgez	%g3,	%g6,	%i1
	movcs	%xcc,	%l6,	%o2
	movrlez	%l0,	%g1,	%o1
	udivx	%l4,	0x0715,	%l1
	xor	%o0,	0x07D9,	%l5
	fmovsvs	%xcc,	%f15,	%f10
	fabsd	%f6,	%f22
	movrlz	%o7,	%g7,	%l3
	addc	%g4,	%o4,	%l2
	popc	0x0515,	%o6
	alignaddr	%o3,	%i7,	%g5
	udivcc	%i3,	0x0340,	%i4
	edge8	%g2,	%i2,	%i0
	subccc	%o5,	%i5,	%g3
	edge16ln	%i6,	%i1,	%g6
	fmovsleu	%xcc,	%f13,	%f23
	umulcc	%o2,	0x1CB9,	%l0
	udiv	%l6,	0x0C06,	%o1
	srlx	%g1,	%l1,	%o0
	alignaddrl	%l5,	%o7,	%g7
	sra	%l3,	%l4,	%o4
	or	%g4,	0x0FC4,	%o6
	edge32	%o3,	%i7,	%g5
	movgu	%xcc,	%i3,	%i4
	xnorcc	%g2,	0x00FD,	%l2
	sdiv	%i2,	0x176B,	%o5
	fmovsle	%xcc,	%f22,	%f31
	fmovd	%f8,	%f20
	movleu	%xcc,	%i0,	%i5
	umul	%g3,	0x0AF6,	%i6
	array8	%i1,	%o2,	%l0
	xnorcc	%g6,	%o1,	%l6
	movvs	%icc,	%l1,	%g1
	mulx	%o0,	0x0B7C,	%l5
	movpos	%xcc,	%g7,	%o7
	ldsh	[%l7 + 0x34],	%l3
	edge16l	%l4,	%o4,	%g4
	restore %o3, %i7, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%o6,	[%l7 + 0x74]
	andcc	%i4,	%g2,	%i3
	fxnors	%f14,	%f7,	%f24
	subcc	%l2,	0x11DE,	%o5
	movvs	%icc,	%i2,	%i0
	srl	%g3,	0x14,	%i5
	ldx	[%l7 + 0x30],	%i1
	movg	%icc,	%i6,	%l0
	fmovse	%icc,	%f5,	%f14
	fmovdcs	%xcc,	%f30,	%f11
	edge32	%o2,	%o1,	%l6
	fnot2	%f20,	%f8
	ldub	[%l7 + 0x7E],	%l1
	fmovse	%xcc,	%f26,	%f2
	umul	%g1,	%o0,	%l5
	addcc	%g6,	%g7,	%l3
	add	%l4,	%o4,	%g4
	andncc	%o7,	%i7,	%o3
	sll	%g5,	%i4,	%g2
	movne	%xcc,	%o6,	%i3
	umulcc	%l2,	0x1DF3,	%i2
	fcmple16	%f8,	%f4,	%i0
	fmovse	%icc,	%f2,	%f29
	mulx	%o5,	%i5,	%g3
	save %i1, %l0, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%xcc,	%i6,	%l6
	ldx	[%l7 + 0x08],	%o1
	sllx	%g1,	0x0D,	%l1
	movrgz	%l5,	0x055,	%o0
	fmovdl	%icc,	%f3,	%f21
	mulx	%g6,	%l3,	%l4
	std	%f0,	[%l7 + 0x18]
	addccc	%o4,	0x11D2,	%g4
	nop
	set	0x76, %i4
	lduh	[%l7 + %i4],	%g7
	subccc	%o7,	0x1737,	%i7
	stw	%g5,	[%l7 + 0x78]
	movgu	%xcc,	%o3,	%g2
	fzero	%f30
	addcc	%o6,	%i3,	%i4
	fmovrde	%l2,	%f18,	%f24
	nop
	set	0x70, %i5
	ldd	[%l7 + %i5],	%f30
	andn	%i0,	%i2,	%i5
	movrgz	%g3,	%o5,	%i1
	udivcc	%o2,	0x027E,	%i6
	srax	%l0,	%l6,	%o1
	fmovs	%f26,	%f19
	edge16l	%g1,	%l5,	%o0
	fmovsle	%icc,	%f1,	%f18
	movrgz	%g6,	%l1,	%l4
	smul	%l3,	0x07BF,	%g4
	addccc	%o4,	%o7,	%i7
	ldsw	[%l7 + 0x64],	%g7
	popc	0x0F3E,	%o3
	movn	%xcc,	%g2,	%o6
	fpadd32	%f20,	%f6,	%f6
	edge16n	%i3,	%g5,	%i4
	sllx	%i0,	0x07,	%i2
	edge32l	%l2,	%i5,	%g3
	udiv	%i1,	0x1610,	%o5
	move	%icc,	%i6,	%l0
	movne	%xcc,	%o2,	%o1
	sdiv	%l6,	0x1879,	%g1
	andn	%l5,	0x0EFA,	%g6
	alignaddrl	%l1,	%l4,	%o0
	stb	%l3,	[%l7 + 0x6A]
	subcc	%g4,	0x1CC4,	%o4
	edge32l	%o7,	%g7,	%i7
	lduh	[%l7 + 0x78],	%o3
	orn	%o6,	%i3,	%g2
	addc	%i4,	0x0BD9,	%g5
	fmul8x16al	%f24,	%f11,	%f28
	sub	%i2,	%l2,	%i5
	array32	%g3,	%i1,	%o5
	orncc	%i6,	0x0446,	%l0
	fmovrde	%i0,	%f0,	%f6
	movrlez	%o2,	%o1,	%l6
	stb	%g1,	[%l7 + 0x1E]
	smulcc	%l5,	0x0975,	%l1
	or	%l4,	0x1BF1,	%g6
	nop
	set	0x18, %l2
	std	%f30,	[%l7 + %l2]
	ldsw	[%l7 + 0x38],	%o0
	array8	%l3,	%o4,	%o7
	fmovdgu	%icc,	%f7,	%f21
	smul	%g4,	0x172F,	%g7
	mulscc	%i7,	%o6,	%o3
	movpos	%xcc,	%i3,	%g2
	movrne	%g5,	%i2,	%l2
	array32	%i5,	%g3,	%i1
	fones	%f2
	sra	%o5,	0x0A,	%i4
	fnands	%f9,	%f31,	%f22
	srlx	%l0,	0x18,	%i0
	lduw	[%l7 + 0x0C],	%i6
	srax	%o2,	%o1,	%g1
	ld	[%l7 + 0x08],	%f25
	xor	%l6,	%l1,	%l5
	edge32n	%g6,	%l4,	%l3
	edge16n	%o0,	%o4,	%o7
	sir	0x1D5C
	fnors	%f2,	%f22,	%f17
	movne	%xcc,	%g4,	%i7
	sth	%g7,	[%l7 + 0x30]
	addc	%o6,	0x0E6A,	%o3
	edge32l	%i3,	%g2,	%i2
	fmovrdne	%g5,	%f2,	%f6
	edge32ln	%i5,	%l2,	%i1
	fandnot2	%f4,	%f22,	%f4
	movne	%xcc,	%g3,	%i4
	array16	%l0,	%o5,	%i6
	st	%f26,	[%l7 + 0x0C]
	sth	%o2,	[%l7 + 0x12]
	sub	%o1,	0x19DA,	%i0
	orn	%g1,	0x0D5C,	%l1
	move	%icc,	%l6,	%g6
	movgu	%icc,	%l5,	%l3
	srax	%l4,	%o0,	%o4
	stx	%g4,	[%l7 + 0x08]
	fsrc2s	%f12,	%f7
	mulscc	%o7,	0x0D18,	%i7
	subccc	%o6,	0x1787,	%o3
	subcc	%g7,	0x1F31,	%g2
	fmovdn	%xcc,	%f24,	%f27
	movgu	%xcc,	%i3,	%g5
	array16	%i2,	%l2,	%i1
	udivcc	%i5,	0x0206,	%i4
	ldd	[%l7 + 0x58],	%f28
	edge8l	%l0,	%g3,	%i6
	popc	%o2,	%o1
	fmovsneg	%xcc,	%f15,	%f14
	ld	[%l7 + 0x3C],	%f15
	movn	%xcc,	%o5,	%i0
	sethi	0x0F9A,	%l1
	edge8l	%g1,	%l6,	%g6
	mova	%xcc,	%l3,	%l4
	fors	%f10,	%f7,	%f19
	st	%f29,	[%l7 + 0x64]
	edge32l	%l5,	%o0,	%g4
	sra	%o7,	0x10,	%o4
	ldd	[%l7 + 0x58],	%o6
	udiv	%i7,	0x0A4A,	%g7
	mulscc	%g2,	0x1BCE,	%o3
	edge32	%g5,	%i2,	%l2
	mulx	%i3,	0x0977,	%i5
	udivx	%i4,	0x027D,	%i1
	nop
	set	0x34, %i2
	stw	%l0,	[%l7 + %i2]
	subc	%g3,	0x1604,	%i6
	array8	%o2,	%o5,	%o1
	edge16n	%i0,	%l1,	%l6
	movneg	%icc,	%g6,	%l3
	fcmpne16	%f22,	%f10,	%g1
	edge16n	%l4,	%l5,	%g4
	udivcc	%o7,	0x03A4,	%o4
	movrne	%o0,	0x21A,	%o6
	movl	%xcc,	%i7,	%g2
	sir	0x0D15
	movleu	%xcc,	%g7,	%o3
	sdivcc	%i2,	0x1709,	%g5
	movcc	%xcc,	%i3,	%i5
	mulscc	%l2,	%i1,	%i4
	fnot2s	%f14,	%f31
	sllx	%g3,	%l0,	%i6
	std	%f30,	[%l7 + 0x58]
	movn	%xcc,	%o5,	%o1
	movcs	%icc,	%o2,	%l1
	movvc	%xcc,	%i0,	%l6
	smul	%l3,	%g1,	%l4
	mulx	%l5,	%g6,	%g4
	movge	%xcc,	%o7,	%o0
	udivx	%o6,	0x1796,	%o4
	stb	%g2,	[%l7 + 0x2E]
	fmovdleu	%icc,	%f7,	%f4
	edge32l	%i7,	%o3,	%g7
	udivx	%i2,	0x19C2,	%i3
	lduh	[%l7 + 0x44],	%i5
	fpsub16s	%f5,	%f20,	%f8
	movne	%xcc,	%l2,	%i1
	ldsh	[%l7 + 0x66],	%g5
	movrgez	%i4,	0x358,	%l0
	addc	%g3,	%o5,	%i6
	add	%o2,	0x1D23,	%l1
	addccc	%o1,	0x0D1F,	%l6
	save %i0, 0x1BCD, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f12,	[%l7 + 0x64]
	smulcc	%l4,	0x10CA,	%l5
	fone	%f22
	alignaddr	%l3,	%g6,	%g4
	edge16l	%o7,	%o6,	%o0
	movleu	%icc,	%o4,	%i7
	move	%icc,	%g2,	%o3
	fzero	%f8
	add	%i2,	%i3,	%i5
	fmovdg	%xcc,	%f13,	%f22
	smul	%g7,	%i1,	%g5
	stx	%i4,	[%l7 + 0x28]
	edge8l	%l2,	%l0,	%g3
	fone	%f12
	udiv	%i6,	0x10FE,	%o5
	fpadd16s	%f14,	%f29,	%f13
	alignaddr	%o2,	%l1,	%o1
	umul	%i0,	%l6,	%l4
	movcc	%icc,	%g1,	%l3
	lduh	[%l7 + 0x70],	%g6
	popc	0x1E7C,	%g4
	movrgez	%o7,	0x314,	%o6
	mova	%xcc,	%o0,	%l5
	movrlz	%i7,	%o4,	%g2
	sll	%o3,	%i2,	%i3
	movpos	%xcc,	%i5,	%i1
	sub	%g5,	%g7,	%l2
	edge8ln	%i4,	%l0,	%i6
	xnor	%o5,	%o2,	%g3
	stx	%o1,	[%l7 + 0x18]
	alignaddrl	%l1,	%l6,	%l4
	sub	%g1,	%i0,	%g6
	sll	%l3,	0x03,	%o7
	mova	%icc,	%g4,	%o6
	movrlez	%o0,	0x30B,	%i7
	or	%o4,	%l5,	%o3
	edge16ln	%g2,	%i3,	%i5
	umulcc	%i1,	%i2,	%g5
	addc	%g7,	%i4,	%l2
	movne	%xcc,	%i6,	%o5
	addc	%o2,	%l0,	%o1
	ldub	[%l7 + 0x4B],	%g3
	fmovsvs	%icc,	%f2,	%f10
	edge32n	%l6,	%l1,	%g1
	movrgez	%l4,	%i0,	%l3
	sth	%o7,	[%l7 + 0x18]
	fcmple16	%f12,	%f10,	%g6
	popc	%o6,	%o0
	andncc	%g4,	%o4,	%i7
	ldx	[%l7 + 0x08],	%o3
	movleu	%icc,	%l5,	%i3
	ldub	[%l7 + 0x1D],	%i5
	stw	%g2,	[%l7 + 0x38]
	stb	%i1,	[%l7 + 0x19]
	alignaddrl	%g5,	%g7,	%i2
	sub	%i4,	0x070C,	%l2
	array32	%i6,	%o5,	%l0
	movvs	%xcc,	%o2,	%g3
	xor	%l6,	%l1,	%g1
	movge	%xcc,	%l4,	%o1
	umulcc	%l3,	%i0,	%o7
	fsrc1s	%f23,	%f23
	nop
	set	0x0A, %g1
	lduh	[%l7 + %g1],	%o6
	ldsh	[%l7 + 0x48],	%g6
	udiv	%g4,	0x0C6C,	%o4
	orcc	%o0,	0x0B97,	%o3
	add	%i7,	0x0731,	%l5
	subccc	%i3,	%g2,	%i1
	lduh	[%l7 + 0x78],	%g5
	stx	%g7,	[%l7 + 0x30]
	stw	%i5,	[%l7 + 0x18]
	edge8	%i2,	%l2,	%i4
	smulcc	%o5,	%l0,	%o2
	movne	%icc,	%g3,	%i6
	fandnot2	%f4,	%f24,	%f14
	fmovdg	%icc,	%f1,	%f12
	bshuffle	%f24,	%f30,	%f0
	edge16l	%l6,	%l1,	%l4
	xnorcc	%o1,	%g1,	%l3
	bshuffle	%f0,	%f28,	%f0
	fandnot1s	%f22,	%f31,	%f23
	array16	%o7,	%o6,	%g6
	save %i0, %o4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%g4,	%i7,	%l5
	smulcc	%i3,	%o3,	%g2
	ldd	[%l7 + 0x60],	%g4
	fnot1	%f4,	%f28
	movre	%g7,	%i1,	%i2
	fmovdle	%icc,	%f17,	%f27
	sllx	%i5,	%l2,	%i4
	stw	%o5,	[%l7 + 0x78]
	array8	%l0,	%g3,	%i6
	movrgez	%o2,	%l6,	%l1
	movre	%o1,	0x248,	%g1
	fand	%f18,	%f30,	%f8
	xor	%l4,	0x16FF,	%l3
	fpack16	%f14,	%f6
	orn	%o6,	%g6,	%o7
	edge16ln	%o4,	%o0,	%i0
	movn	%xcc,	%i7,	%l5
	stw	%i3,	[%l7 + 0x1C]
	bshuffle	%f8,	%f12,	%f2
	movgu	%xcc,	%o3,	%g2
	alignaddr	%g5,	%g4,	%g7
	fnors	%f5,	%f13,	%f17
	movrgez	%i1,	%i5,	%l2
	sll	%i2,	0x1C,	%o5
	edge8n	%i4,	%l0,	%i6
	edge16ln	%o2,	%l6,	%g3
	edge8	%o1,	%l1,	%l4
	xnorcc	%l3,	0x0A00,	%g1
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	stx	%o4,	[%l7 + 0x48]
	movg	%xcc,	%g6,	%o0
	andn	%i7,	%l5,	%i0
	mulscc	%i3,	0x1DEB,	%o3
	addccc	%g2,	%g4,	%g5
	edge32ln	%g7,	%i5,	%i1
	movne	%xcc,	%i2,	%o5
	edge8l	%l2,	%l0,	%i4
	move	%xcc,	%o2,	%i6
	movneg	%icc,	%l6,	%o1
	mulscc	%g3,	0x1AE3,	%l1
	movrlz	%l3,	%l4,	%g1
	movrgz	%o6,	0x1C3,	%o4
	andn	%o7,	0x1B5B,	%g6
	fpadd32s	%f15,	%f8,	%f7
	smulcc	%i7,	0x09F5,	%l5
	fmovdg	%xcc,	%f8,	%f8
	xnor	%o0,	0x11BD,	%i3
	fcmpeq32	%f30,	%f8,	%i0
	sllx	%o3,	%g2,	%g5
	movge	%icc,	%g4,	%i5
	lduh	[%l7 + 0x48],	%g7
	fnor	%f12,	%f28,	%f26
	movgu	%icc,	%i2,	%o5
	sub	%l2,	0x1887,	%l0
	sir	0x1035
	or	%i1,	0x174F,	%o2
	smul	%i6,	%i4,	%o1
	movvc	%xcc,	%g3,	%l6
	movcc	%xcc,	%l1,	%l4
	mova	%xcc,	%g1,	%o6
	sth	%l3,	[%l7 + 0x0E]
	nop
	set	0x1C, %g5
	lduh	[%l7 + %g5],	%o4
	lduh	[%l7 + 0x6C],	%g6
	popc	%i7,	%l5
	movrgz	%o0,	0x3A2,	%o7
	restore %i3, %i0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fands	%f13,	%f20,	%f18
	movpos	%icc,	%o3,	%g5
	fmovdcs	%xcc,	%f14,	%f29
	fpsub32	%f14,	%f24,	%f18
	edge32ln	%g4,	%i5,	%i2
	edge8ln	%o5,	%g7,	%l0
	srax	%l2,	%i1,	%o2
	movrne	%i4,	%i6,	%g3
	array8	%l6,	%o1,	%l4
	andcc	%g1,	0x1000,	%o6
	fpadd16s	%f8,	%f26,	%f2
	fmovdn	%icc,	%f29,	%f2
	st	%f28,	[%l7 + 0x28]
	pdist	%f2,	%f26,	%f4
	edge16ln	%l1,	%o4,	%g6
	sub	%i7,	%l3,	%o0
	ldd	[%l7 + 0x20],	%f2
	movn	%xcc,	%o7,	%i3
	fandnot1	%f2,	%f2,	%f22
	fxnors	%f3,	%f30,	%f29
	ldd	[%l7 + 0x50],	%f14
	sth	%l5,	[%l7 + 0x08]
	edge8n	%i0,	%g2,	%g5
	stb	%o3,	[%l7 + 0x26]
	add	%g4,	%i2,	%o5
	movleu	%icc,	%i5,	%g7
	movne	%xcc,	%l0,	%l2
	array16	%i1,	%o2,	%i4
	popc	%g3,	%l6
	and	%i6,	%o1,	%l4
	array16	%o6,	%g1,	%l1
	orcc	%g6,	%o4,	%l3
	move	%icc,	%i7,	%o7
	fmovdg	%icc,	%f27,	%f6
	andcc	%i3,	%o0,	%l5
	edge32ln	%g2,	%g5,	%i0
	edge16n	%g4,	%i2,	%o5
	umulcc	%o3,	0x1AD4,	%g7
	fxnor	%f12,	%f16,	%f6
	array8	%i5,	%l0,	%l2
	fmovrslez	%i1,	%f10,	%f1
	xorcc	%o2,	%i4,	%l6
	fmovsgu	%xcc,	%f4,	%f7
	movpos	%xcc,	%g3,	%i6
	edge32ln	%o1,	%l4,	%g1
	movne	%icc,	%l1,	%o6
	movn	%xcc,	%g6,	%o4
	movrlz	%l3,	%o7,	%i7
	edge8n	%o0,	%i3,	%g2
	fcmped	%fcc0,	%f0,	%f4
	fzero	%f24
	movrlz	%l5,	%i0,	%g5
	fzeros	%f14
	movvs	%xcc,	%g4,	%o5
	movl	%icc,	%i2,	%g7
	array32	%o3,	%l0,	%i5
	lduh	[%l7 + 0x50],	%l2
	alignaddr	%o2,	%i1,	%i4
	smul	%g3,	%l6,	%i6
	fcmpgt32	%f10,	%f10,	%o1
	lduw	[%l7 + 0x54],	%g1
	edge16ln	%l4,	%o6,	%l1
	addcc	%o4,	%g6,	%l3
	addcc	%o7,	%o0,	%i7
	srlx	%g2,	%l5,	%i3
	array8	%g5,	%i0,	%o5
	smul	%g4,	0x05B2,	%g7
	move	%xcc,	%i2,	%l0
	array32	%o3,	%l2,	%i5
	nop
	set	0x68, %g2
	lduw	[%l7 + %g2],	%o2
	sethi	0x0DDD,	%i1
	orcc	%g3,	0x031E,	%l6
	umul	%i4,	%i6,	%o1
	popc	0x06F8,	%l4
	save %o6, 0x1186, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpeq32	%f2,	%f8,	%o4
	movrgz	%g1,	0x1BE,	%g6
	mova	%icc,	%o7,	%l3
	fmovsleu	%xcc,	%f20,	%f25
	sdivcc	%o0,	0x1804,	%i7
	fnot2s	%f5,	%f4
	movne	%icc,	%g2,	%i3
	movre	%g5,	0x390,	%i0
	edge16l	%l5,	%g4,	%o5
	umul	%g7,	0x0EB8,	%i2
	fmovrdgez	%l0,	%f12,	%f20
	lduw	[%l7 + 0x70],	%o3
	andn	%l2,	0x0CAF,	%o2
	fmovrslz	%i5,	%f25,	%f0
	movne	%icc,	%g3,	%i1
	udivx	%l6,	0x069E,	%i6
	fnors	%f16,	%f23,	%f15
	movge	%icc,	%o1,	%l4
	xor	%i4,	%o6,	%o4
	fmovrdlez	%l1,	%f30,	%f16
	movcs	%xcc,	%g6,	%o7
	edge32l	%l3,	%g1,	%o0
	add	%g2,	0x1122,	%i3
	or	%g5,	0x015B,	%i0
	ldsb	[%l7 + 0x59],	%i7
	movcc	%xcc,	%g4,	%l5
	and	%o5,	0x026B,	%g7
	movle	%icc,	%l0,	%o3
	st	%f16,	[%l7 + 0x64]
	addccc	%i2,	%o2,	%l2
	nop
	set	0x24, %o6
	ldsw	[%l7 + %o6],	%g3
	alignaddrl	%i1,	%i5,	%i6
	fnand	%f22,	%f18,	%f14
	move	%icc,	%o1,	%l4
	save %l6, 0x1968, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x1C72,	%o6
	sllx	%o4,	%l1,	%o7
	sra	%l3,	%g6,	%g1
	movn	%xcc,	%g2,	%i3
	ldsw	[%l7 + 0x50],	%o0
	movn	%icc,	%i0,	%i7
	stb	%g5,	[%l7 + 0x47]
	orcc	%g4,	%o5,	%l5
	movvs	%xcc,	%l0,	%o3
	ldsh	[%l7 + 0x68],	%i2
	ldsb	[%l7 + 0x47],	%o2
	fmovsgu	%icc,	%f13,	%f5
	xor	%l2,	0x0A00,	%g3
	edge8ln	%g7,	%i1,	%i5
	movcc	%icc,	%i6,	%l4
	movge	%xcc,	%o1,	%l6
	stx	%i4,	[%l7 + 0x48]
	subcc	%o4,	%l1,	%o7
	fpadd16s	%f29,	%f30,	%f30
	andcc	%l3,	0x1E73,	%g6
	alignaddr	%o6,	%g2,	%g1
	udiv	%i3,	0x1001,	%i0
	fmovsvs	%xcc,	%f21,	%f30
	ld	[%l7 + 0x10],	%f9
	fmovrslez	%i7,	%f0,	%f29
	fmuld8sux16	%f15,	%f14,	%f26
	fandnot2s	%f17,	%f7,	%f1
	movrlez	%o0,	%g4,	%o5
	subccc	%l5,	0x1B36,	%g5
	st	%f5,	[%l7 + 0x30]
	movrlez	%o3,	%i2,	%o2
	sdivx	%l0,	0x1368,	%l2
	add	%g3,	%g7,	%i1
	xnor	%i6,	%l4,	%o1
	movpos	%xcc,	%i5,	%l6
	fnegs	%f18,	%f5
	st	%f30,	[%l7 + 0x4C]
	save %o4, %l1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%l3,	[%l7 + 0x0C]
	edge16ln	%g6,	%o6,	%o7
	popc	0x0761,	%g2
	ldub	[%l7 + 0x4B],	%g1
	array8	%i3,	%i0,	%i7
	mova	%icc,	%g4,	%o0
	xorcc	%o5,	%l5,	%o3
	movgu	%xcc,	%g5,	%o2
	ldsw	[%l7 + 0x58],	%i2
	std	%f8,	[%l7 + 0x38]
	edge16	%l0,	%l2,	%g7
	edge32l	%i1,	%i6,	%g3
	ld	[%l7 + 0x28],	%f27
	fmovsvc	%icc,	%f2,	%f21
	udivcc	%o1,	0x07CE,	%i5
	subccc	%l4,	%o4,	%l1
	movne	%icc,	%i4,	%l6
	sra	%l3,	0x12,	%o6
	bshuffle	%f10,	%f16,	%f26
	xorcc	%g6,	0x0CA2,	%o7
	fpack16	%f26,	%f28
	fxors	%f21,	%f5,	%f14
	edge16l	%g2,	%g1,	%i0
	movvc	%xcc,	%i3,	%i7
	fxors	%f8,	%f13,	%f7
	xnorcc	%g4,	0x1536,	%o5
	fnot1s	%f24,	%f24
	sub	%l5,	%o0,	%o3
	fcmpne16	%f8,	%f14,	%o2
	mulx	%g5,	0x008E,	%i2
	sdiv	%l0,	0x0C86,	%g7
	ldd	[%l7 + 0x18],	%l2
	fpsub16	%f12,	%f30,	%f14
	addc	%i1,	%i6,	%o1
	subccc	%g3,	%l4,	%o4
	stx	%l1,	[%l7 + 0x50]
	fsrc1s	%f8,	%f5
	umul	%i4,	0x092E,	%l6
	xorcc	%l3,	0x0DDC,	%i5
	ldsb	[%l7 + 0x48],	%o6
	movle	%icc,	%g6,	%o7
	orcc	%g1,	0x18B3,	%i0
	fpmerge	%f0,	%f2,	%f2
	lduw	[%l7 + 0x10],	%g2
	stx	%i7,	[%l7 + 0x20]
	fpsub32s	%f0,	%f16,	%f15
	addcc	%i3,	%g4,	%o5
	sth	%o0,	[%l7 + 0x14]
	ldsb	[%l7 + 0x52],	%o3
	fandnot2	%f6,	%f16,	%f2
	edge8n	%o2,	%g5,	%l5
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	stb	%l2,	[%l7 + 0x2F]
	edge16	%i6,	%i1,	%o1
	array32	%l4,	%g3,	%o4
	fmovrsgez	%l1,	%f6,	%f18
	xor	%i4,	%l3,	%i5
	fabss	%f1,	%f5
	edge32ln	%l6,	%g6,	%o6
	array16	%g1,	%o7,	%g2
	movcc	%xcc,	%i0,	%i7
	edge32l	%g4,	%o5,	%i3
	ldub	[%l7 + 0x79],	%o3
	srl	%o2,	0x04,	%o0
	movvc	%icc,	%l5,	%g5
	subcc	%i2,	%l0,	%l2
	fmovsvs	%icc,	%f28,	%f5
	fmovrsgz	%g7,	%f16,	%f14
	movrgz	%i6,	0x3DA,	%i1
	edge8ln	%l4,	%o1,	%g3
	alignaddrl	%l1,	%o4,	%l3
	movgu	%xcc,	%i5,	%l6
	std	%f4,	[%l7 + 0x70]
	sdivcc	%g6,	0x1703,	%o6
	movle	%icc,	%i4,	%o7
	edge16n	%g2,	%i0,	%g1
	srlx	%g4,	%i7,	%i3
	movg	%icc,	%o3,	%o2
	or	%o0,	0x1BFF,	%o5
	fnands	%f21,	%f8,	%f11
	movvc	%xcc,	%l5,	%g5
	edge8ln	%l0,	%i2,	%g7
	movn	%xcc,	%i6,	%l2
	movl	%xcc,	%i1,	%l4
	sra	%o1,	0x1E,	%g3
	movne	%xcc,	%l1,	%l3
	movleu	%xcc,	%i5,	%l6
	ldx	[%l7 + 0x08],	%o4
	sdivcc	%o6,	0x1037,	%i4
	movcc	%xcc,	%g6,	%o7
	fmovsgu	%icc,	%f7,	%f15
	fcmps	%fcc0,	%f31,	%f28
	subc	%g2,	0x12BC,	%g1
	movvc	%icc,	%g4,	%i0
	orncc	%i7,	0x1952,	%o3
	sethi	0x0F64,	%o2
	fcmpes	%fcc3,	%f20,	%f0
	ldsh	[%l7 + 0x38],	%o0
	fmovd	%f26,	%f28
	array32	%i3,	%o5,	%g5
	orcc	%l0,	%i2,	%l5
	edge8l	%g7,	%i6,	%i1
	fmovrdgz	%l4,	%f10,	%f18
	orn	%o1,	0x07E3,	%l2
	alignaddrl	%l1,	%g3,	%i5
	andcc	%l3,	0x0E77,	%o4
	array16	%o6,	%l6,	%i4
	addc	%g6,	%g2,	%g1
	fcmple16	%f18,	%f16,	%g4
	andncc	%o7,	%i0,	%o3
	movvs	%icc,	%o2,	%i7
	fmul8x16al	%f9,	%f7,	%f28
	ld	[%l7 + 0x68],	%f24
	orn	%i3,	%o5,	%g5
	fcmpeq32	%f20,	%f18,	%o0
	ldub	[%l7 + 0x4C],	%l0
	fmovrdgz	%i2,	%f12,	%f6
	sdivcc	%g7,	0x1DC5,	%i6
	movgu	%icc,	%i1,	%l4
	edge32	%o1,	%l5,	%l2
	add	%g3,	0x1552,	%l1
	movvc	%xcc,	%i5,	%l3
	movvc	%xcc,	%o6,	%o4
	fmovrdlez	%l6,	%f8,	%f28
	sethi	0x1BFF,	%i4
	or	%g2,	0x1FFF,	%g1
	edge16	%g4,	%g6,	%i0
	array32	%o3,	%o7,	%i7
	fmuld8sux16	%f31,	%f30,	%f14
	save %i3, 0x19ED, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpd	%fcc0,	%f28,	%f6
	sdiv	%g5,	0x06C2,	%o0
	edge8	%l0,	%o2,	%i2
	mulx	%i6,	0x0742,	%i1
	fmovd	%f22,	%f26
	fands	%f5,	%f8,	%f26
	srl	%g7,	%l4,	%o1
	xnorcc	%l2,	%l5,	%g3
	edge16	%l1,	%l3,	%o6
	move	%icc,	%i5,	%o4
	edge8ln	%i4,	%g2,	%g1
	mova	%xcc,	%l6,	%g6
	edge16ln	%i0,	%o3,	%o7
	movgu	%icc,	%g4,	%i3
	edge8n	%i7,	%g5,	%o5
	orn	%o0,	%l0,	%i2
	andcc	%o2,	0x0FE8,	%i1
	nop
	set	0x08, %o5
	lduw	[%l7 + %o5],	%i6
	fmovrsgez	%l4,	%f23,	%f21
	movn	%icc,	%o1,	%l2
	ldub	[%l7 + 0x22],	%g7
	movcc	%icc,	%l5,	%l1
	movpos	%xcc,	%g3,	%o6
	lduh	[%l7 + 0x5A],	%i5
	fornot1s	%f15,	%f26,	%f15
	edge32ln	%o4,	%l3,	%g2
	subcc	%g1,	0x12AE,	%i4
	sethi	0x13E3,	%g6
	edge16l	%i0,	%l6,	%o3
	sdiv	%g4,	0x084F,	%o7
	udivcc	%i3,	0x1A81,	%g5
	ld	[%l7 + 0x24],	%f2
	srl	%o5,	0x0C,	%i7
	fpsub16	%f18,	%f14,	%f8
	sub	%o0,	%i2,	%o2
	umulcc	%i1,	0x0824,	%i6
	edge8n	%l0,	%l4,	%o1
	edge32n	%l2,	%g7,	%l1
	edge32n	%g3,	%o6,	%l5
	udiv	%o4,	0x0B9D,	%i5
	ldsb	[%l7 + 0x64],	%l3
	move	%icc,	%g1,	%g2
	fpadd16s	%f19,	%f31,	%f26
	edge16n	%g6,	%i0,	%l6
	edge16n	%o3,	%i4,	%o7
	fpack32	%f28,	%f12,	%f30
	mulscc	%i3,	0x1651,	%g5
	fmovrdlez	%o5,	%f20,	%f4
	movn	%xcc,	%i7,	%o0
	std	%f24,	[%l7 + 0x50]
	edge16n	%i2,	%o2,	%i1
	edge32ln	%g4,	%l0,	%i6
	alignaddrl	%l4,	%l2,	%g7
	andn	%o1,	0x14FF,	%l1
	sdivx	%g3,	0x0256,	%l5
	subcc	%o4,	%o6,	%l3
	movneg	%xcc,	%i5,	%g2
	alignaddr	%g6,	%g1,	%l6
	fabss	%f17,	%f22
	edge32ln	%o3,	%i0,	%i4
	edge16	%i3,	%g5,	%o7
	sethi	0x01DF,	%i7
	movcs	%xcc,	%o5,	%i2
	stw	%o2,	[%l7 + 0x50]
	fmuld8sux16	%f3,	%f17,	%f2
	popc	%i1,	%g4
	fcmpgt16	%f8,	%f24,	%o0
	andcc	%l0,	%l4,	%i6
	array8	%g7,	%l2,	%l1
	smulcc	%o1,	%l5,	%g3
	sdivx	%o6,	0x1A16,	%l3
	edge8l	%i5,	%g2,	%g6
	fxors	%f6,	%f13,	%f7
	movre	%o4,	0x31B,	%l6
	movrlez	%o3,	%i0,	%g1
	edge32l	%i4,	%i3,	%g5
	fandnot1s	%f10,	%f6,	%f29
	fpmerge	%f2,	%f27,	%f22
	movl	%icc,	%i7,	%o5
	movl	%icc,	%i2,	%o2
	fmovdne	%xcc,	%f6,	%f8
	movvs	%icc,	%i1,	%g4
	sdivx	%o7,	0x0DEC,	%o0
	movleu	%xcc,	%l0,	%l4
	sllx	%g7,	%l2,	%i6
	movrlz	%l1,	%o1,	%g3
	srl	%l5,	0x15,	%l3
	movre	%o6,	%i5,	%g6
	sllx	%o4,	0x1D,	%g2
	addc	%l6,	0x1501,	%o3
	srl	%i0,	0x15,	%i4
	movrlz	%g1,	%g5,	%i3
	ldsw	[%l7 + 0x54],	%o5
	array16	%i2,	%o2,	%i7
	fandnot1s	%f16,	%f1,	%f23
	fpack32	%f8,	%f12,	%f24
	ldsb	[%l7 + 0x6C],	%g4
	fornot1s	%f2,	%f21,	%f11
	umulcc	%i1,	%o7,	%o0
	fcmpeq16	%f6,	%f6,	%l4
	subccc	%l0,	%l2,	%g7
	sir	0x15A3
	mova	%icc,	%i6,	%o1
	fnand	%f22,	%f20,	%f4
	srl	%l1,	0x1A,	%l5
	xor	%l3,	%o6,	%g3
	lduh	[%l7 + 0x5A],	%i5
	stw	%o4,	[%l7 + 0x38]
	addccc	%g2,	0x03F8,	%l6
	fmovde	%icc,	%f22,	%f13
	edge8l	%o3,	%g6,	%i4
	xor	%i0,	0x1A99,	%g5
	udivcc	%i3,	0x1E01,	%g1
	edge32l	%o5,	%o2,	%i2
	fmovrdlz	%g4,	%f24,	%f10
	fmovrdlz	%i1,	%f18,	%f2
	sir	0x0051
	smul	%o7,	%i7,	%o0
	orn	%l0,	%l2,	%l4
	sdivx	%i6,	0x1E38,	%g7
	edge32l	%l1,	%o1,	%l3
	mulx	%l5,	%o6,	%g3
	movrne	%i5,	0x0F8,	%g2
	fornot2s	%f9,	%f10,	%f13
	popc	0x1C5A,	%l6
	sll	%o4,	%g6,	%o3
	add	%i0,	%g5,	%i3
	xnor	%g1,	0x1C24,	%o5
	umulcc	%o2,	0x08B7,	%i4
	fmovdcs	%xcc,	%f21,	%f9
	edge32	%i2,	%g4,	%i1
	movg	%xcc,	%i7,	%o7
	sethi	0x11A0,	%l0
	save %o0, %l4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x185B,	%l2
	andn	%g7,	0x06B9,	%o1
	sdivx	%l3,	0x1683,	%l1
	alignaddrl	%o6,	%g3,	%l5
	orcc	%i5,	%l6,	%o4
	movleu	%xcc,	%g2,	%o3
	movcc	%xcc,	%i0,	%g6
	movl	%xcc,	%i3,	%g1
	fxnors	%f9,	%f1,	%f26
	subcc	%o5,	0x15BC,	%o2
	sll	%i4,	0x1E,	%i2
	ldx	[%l7 + 0x08],	%g4
	mulscc	%i1,	0x0B70,	%g5
	fnegd	%f20,	%f16
	fcmpne16	%f18,	%f30,	%o7
	siam	0x7
	sir	0x021C
	fmovd	%f30,	%f10
	movre	%l0,	%o0,	%i7
	xorcc	%i6,	0x010D,	%l2
	movg	%xcc,	%l4,	%g7
	umulcc	%l3,	%o1,	%o6
	mova	%icc,	%l1,	%g3
	fpadd16s	%f4,	%f1,	%f4
	fmovsgu	%xcc,	%f25,	%f16
	movle	%xcc,	%i5,	%l6
	udiv	%l5,	0x12CE,	%g2
	fornot2	%f28,	%f30,	%f4
	edge32ln	%o4,	%o3,	%i0
	xnor	%i3,	0x13A1,	%g1
	or	%g6,	%o5,	%o2
	movleu	%xcc,	%i2,	%i4
	orncc	%i1,	0x0B7E,	%g4
	fnors	%f11,	%f1,	%f27
	edge8	%g5,	%o7,	%o0
	movleu	%icc,	%l0,	%i7
	array8	%l2,	%i6,	%l4
	mulscc	%g7,	%o1,	%o6
	movg	%xcc,	%l3,	%l1
	or	%i5,	0x19A5,	%l6
	movrlez	%l5,	0x324,	%g2
	fcmped	%fcc3,	%f12,	%f0
	smulcc	%g3,	%o3,	%o4
	and	%i3,	%i0,	%g1
	fcmpgt32	%f12,	%f14,	%o5
	addcc	%o2,	0x074B,	%g6
	fmovsge	%xcc,	%f11,	%f30
	sll	%i4,	0x15,	%i2
	sir	0x0DF1
	move	%xcc,	%g4,	%i1
	ldd	[%l7 + 0x58],	%f12
	movgu	%xcc,	%g5,	%o7
	fnands	%f15,	%f17,	%f7
	mulx	%o0,	0x10E1,	%l0
	sub	%l2,	0x1697,	%i7
	movvs	%xcc,	%i6,	%g7
	movvc	%icc,	%o1,	%o6
	fmovrdne	%l3,	%f6,	%f18
	sdivcc	%l4,	0x1D4E,	%l1
	fmovsge	%xcc,	%f17,	%f23
	edge8l	%i5,	%l6,	%l5
	edge32n	%g3,	%o3,	%g2
	andn	%i3,	%i0,	%o4
	move	%icc,	%o5,	%o2
	movgu	%xcc,	%g6,	%i4
	alignaddr	%g1,	%g4,	%i2
	fmovsvs	%xcc,	%f26,	%f21
	fmovrde	%i1,	%f6,	%f2
	and	%o7,	%o0,	%g5
	movre	%l0,	%l2,	%i7
	fcmple16	%f18,	%f4,	%i6
	std	%f20,	[%l7 + 0x70]
	fcmple16	%f18,	%f6,	%g7
	addcc	%o1,	%o6,	%l4
	siam	0x6
	ldd	[%l7 + 0x10],	%l2
	subcc	%i5,	%l1,	%l6
	ldsb	[%l7 + 0x14],	%g3
	restore %o3, 0x0E0D, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i3,	%g2,	%i0
	fmovscc	%icc,	%f11,	%f5
	fandnot1	%f4,	%f12,	%f16
	movneg	%icc,	%o5,	%o4
	ldsh	[%l7 + 0x74],	%g6
	fmovsa	%icc,	%f18,	%f31
	xnor	%i4,	0x003E,	%g1
	fpadd16	%f12,	%f16,	%f6
	movrlez	%o2,	0x3CA,	%g4
	save %i2, 0x0A06, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%o0,	%i1,	%g5
	fornot2	%f24,	%f26,	%f20
	stw	%l2,	[%l7 + 0x34]
	umul	%l0,	0x06E8,	%i7
	movre	%g7,	0x278,	%i6
	movrne	%o1,	%l4,	%l3
	movrlz	%i5,	0x01F,	%l1
	alignaddr	%o6,	%g3,	%o3
	fcmpne16	%f18,	%f26,	%l6
	fmovsvs	%icc,	%f10,	%f15
	edge16l	%i3,	%g2,	%l5
	fands	%f3,	%f15,	%f5
	smulcc	%i0,	%o4,	%o5
	fmovrde	%i4,	%f18,	%f2
	movleu	%icc,	%g1,	%o2
	fmul8x16au	%f13,	%f31,	%f6
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	umul	%g4,	%o0,	%i1
	fmovscc	%icc,	%f28,	%f30
	stx	%o7,	[%l7 + 0x50]
	ldx	[%l7 + 0x60],	%l2
	st	%f30,	[%l7 + 0x18]
	fmovdg	%icc,	%f13,	%f6
	edge32n	%g5,	%i7,	%g7
	siam	0x3
	or	%i6,	0x1B21,	%l0
	edge16n	%o1,	%l3,	%l4
	popc	0x068C,	%i5
	sir	0x0775
	fnor	%f22,	%f8,	%f16
	xnor	%o6,	0x0674,	%l1
	ldd	[%l7 + 0x50],	%f6
	smulcc	%g3,	%l6,	%o3
	alignaddrl	%g2,	%l5,	%i3
	movne	%icc,	%i0,	%o4
	movre	%o5,	0x169,	%i4
	edge8ln	%g1,	%g6,	%i2
	fmovs	%f22,	%f27
	ldd	[%l7 + 0x38],	%f12
	xnorcc	%g4,	0x001F,	%o2
	sra	%o0,	0x0E,	%i1
	fornot1	%f6,	%f0,	%f30
	movrlez	%o7,	%g5,	%i7
	fcmpd	%fcc1,	%f8,	%f8
	fornot1s	%f30,	%f31,	%f11
	alignaddrl	%g7,	%i6,	%l2
	ldsh	[%l7 + 0x10],	%l0
	pdist	%f8,	%f14,	%f6
	edge32l	%l3,	%l4,	%i5
	edge32ln	%o6,	%o1,	%g3
	sdiv	%l1,	0x0B0E,	%o3
	fmul8x16au	%f19,	%f15,	%f6
	edge16l	%g2,	%l5,	%l6
	umulcc	%i3,	0x1538,	%o4
	andncc	%o5,	%i0,	%i4
	srlx	%g6,	0x01,	%i2
	umul	%g1,	0x0D7A,	%g4
	movle	%xcc,	%o0,	%o2
	udivcc	%i1,	0x123D,	%o7
	srl	%i7,	0x05,	%g5
	stw	%i6,	[%l7 + 0x08]
	subcc	%g7,	0x1238,	%l2
	edge32n	%l3,	%l4,	%l0
	stb	%i5,	[%l7 + 0x29]
	fmovsg	%icc,	%f26,	%f30
	alignaddr	%o1,	%g3,	%o6
	addccc	%o3,	%g2,	%l5
	subcc	%l6,	%l1,	%o4
	edge32ln	%o5,	%i3,	%i0
	ldx	[%l7 + 0x18],	%i4
	movrlez	%g6,	%g1,	%g4
	ldsh	[%l7 + 0x38],	%i2
	add	%o0,	0x18B6,	%i1
	ldx	[%l7 + 0x50],	%o2
	smul	%o7,	0x140E,	%g5
	umulcc	%i7,	0x081D,	%g7
	addcc	%i6,	%l2,	%l4
	edge8	%l3,	%i5,	%l0
	fmovdge	%xcc,	%f28,	%f4
	fpadd32	%f0,	%f20,	%f18
	andn	%o1,	0x19F6,	%g3
	xorcc	%o6,	%o3,	%l5
	lduw	[%l7 + 0x20],	%g2
	ldx	[%l7 + 0x70],	%l1
	edge8n	%l6,	%o4,	%i3
	movcs	%xcc,	%i0,	%o5
	and	%i4,	0x0FC4,	%g6
	sth	%g4,	[%l7 + 0x0E]
	fsrc2s	%f11,	%f9
	xorcc	%i2,	0x1D58,	%o0
	edge16ln	%g1,	%o2,	%o7
	array16	%g5,	%i1,	%i7
	andn	%g7,	0x0245,	%i6
	sth	%l2,	[%l7 + 0x20]
	lduh	[%l7 + 0x64],	%l3
	nop
	set	0x45, %i7
	stb	%i5,	[%l7 + %i7]
	fpsub16	%f20,	%f14,	%f28
	st	%f1,	[%l7 + 0x74]
	fmovsgu	%xcc,	%f20,	%f5
	stx	%l0,	[%l7 + 0x28]
	udivx	%l4,	0x1E0C,	%o1
	movrgz	%o6,	%o3,	%g3
	edge16ln	%g2,	%l5,	%l1
	xnor	%l6,	%o4,	%i3
	orncc	%o5,	%i4,	%i0
	edge16n	%g4,	%i2,	%o0
	sdivcc	%g1,	0x1C0F,	%g6
	fsrc1s	%f28,	%f9
	or	%o2,	%o7,	%i1
	sll	%i7,	%g7,	%i6
	ldsh	[%l7 + 0x1C],	%l2
	sdivcc	%g5,	0x0DBE,	%l3
	sth	%l0,	[%l7 + 0x3E]
	orcc	%i5,	0x0DA0,	%o1
	edge16	%o6,	%l4,	%g3
	movn	%xcc,	%g2,	%o3
	fnot2s	%f13,	%f16
	xnor	%l1,	%l5,	%l6
	movrlz	%i3,	0x229,	%o5
	xor	%o4,	0x1F5E,	%i4
	udivx	%i0,	0x0771,	%g4
	stx	%o0,	[%l7 + 0x60]
	fmuld8sux16	%f0,	%f8,	%f10
	array16	%i2,	%g1,	%g6
	srlx	%o2,	0x0B,	%i1
	sdiv	%i7,	0x1CFD,	%g7
	xnor	%i6,	0x19F9,	%l2
	fmovs	%f10,	%f31
	fmovdl	%xcc,	%f17,	%f22
	fmovdvs	%xcc,	%f12,	%f17
	subccc	%o7,	%g5,	%l0
	nop
	set	0x60, %g6
	ldd	[%l7 + %g6],	%f28
	movneg	%xcc,	%i5,	%l3
	stb	%o1,	[%l7 + 0x55]
	ldsw	[%l7 + 0x18],	%o6
	fmovsvs	%xcc,	%f12,	%f7
	edge32l	%g3,	%g2,	%l4
	alignaddrl	%o3,	%l5,	%l6
	movle	%icc,	%i3,	%l1
	orn	%o4,	%o5,	%i0
	smulcc	%i4,	%o0,	%g4
	fsrc1s	%f24,	%f28
	fcmpgt32	%f16,	%f30,	%g1
	edge16ln	%i2,	%o2,	%i1
	edge16l	%g6,	%g7,	%i6
	movg	%xcc,	%i7,	%l2
	movne	%xcc,	%o7,	%g5
	movcs	%icc,	%l0,	%i5
	srl	%l3,	0x0C,	%o6
	move	%icc,	%o1,	%g2
	fnot2s	%f4,	%f22
	ldsh	[%l7 + 0x28],	%l4
	movl	%xcc,	%g3,	%l5
	movcs	%icc,	%o3,	%i3
	movpos	%icc,	%l1,	%l6
	fmovsle	%icc,	%f2,	%f20
	orcc	%o4,	0x1BEA,	%o5
	stb	%i0,	[%l7 + 0x3D]
	fmovdg	%xcc,	%f8,	%f25
	stw	%i4,	[%l7 + 0x24]
	alignaddr	%g4,	%g1,	%i2
	fmovdpos	%xcc,	%f18,	%f31
	restore %o2, 0x1127, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g6,	%g7,	%o0
	movre	%i6,	%i7,	%o7
	subc	%l2,	%l0,	%g5
	movvs	%xcc,	%l3,	%o6
	edge8l	%i5,	%o1,	%l4
	ldsw	[%l7 + 0x0C],	%g3
	add	%g2,	0x198B,	%o3
	fpmerge	%f2,	%f12,	%f28
	fone	%f10
	for	%f18,	%f12,	%f14
	andncc	%i3,	%l5,	%l6
	fmovdg	%icc,	%f28,	%f16
	movvs	%icc,	%o4,	%l1
	andncc	%i0,	%o5,	%g4
	fands	%f31,	%f13,	%f23
	mulscc	%g1,	%i4,	%o2
	movrne	%i1,	%g6,	%g7
	edge32l	%o0,	%i6,	%i2
	edge32l	%i7,	%l2,	%l0
	srax	%g5,	0x19,	%o7
	st	%f0,	[%l7 + 0x50]
	fpackfix	%f14,	%f17
	movg	%icc,	%l3,	%o6
	subc	%o1,	%i5,	%g3
	stb	%g2,	[%l7 + 0x43]
	fpadd16s	%f30,	%f9,	%f8
	popc	%o3,	%l4
	lduh	[%l7 + 0x46],	%i3
	udivcc	%l6,	0x0253,	%l5
	sub	%l1,	0x1937,	%i0
	orncc	%o4,	%g4,	%g1
	fmovrse	%o5,	%f25,	%f30
	smulcc	%o2,	%i4,	%g6
	edge16	%i1,	%g7,	%o0
	fands	%f28,	%f10,	%f30
	fands	%f23,	%f15,	%f21
	movn	%icc,	%i2,	%i6
	add	%l2,	%l0,	%g5
	srl	%i7,	0x10,	%l3
	movrlez	%o6,	%o7,	%i5
	fmovdne	%icc,	%f0,	%f7
	edge32l	%g3,	%o1,	%o3
	and	%l4,	0x1338,	%g2
	movn	%xcc,	%l6,	%l5
	srax	%i3,	%l1,	%i0
	movre	%o4,	0x3CE,	%g4
	subc	%o5,	0x1EBC,	%g1
	array32	%i4,	%o2,	%i1
	save %g7, 0x1155, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%i2,	%g6,	%i6
	edge32l	%l2,	%g5,	%i7
	nop
	set	0x34, %o0
	sth	%l3,	[%l7 + %o0]
	udiv	%l0,	0x0BB4,	%o7
	smul	%i5,	%o6,	%o1
	edge32ln	%o3,	%g3,	%l4
	fmovrdne	%g2,	%f14,	%f0
	movvc	%icc,	%l6,	%l5
	movneg	%icc,	%i3,	%l1
	sth	%o4,	[%l7 + 0x46]
	sra	%i0,	0x04,	%g4
	st	%f15,	[%l7 + 0x18]
	fmovscc	%xcc,	%f14,	%f5
	edge32	%o5,	%g1,	%o2
	or	%i1,	0x1D60,	%g7
	udiv	%o0,	0x072E,	%i2
	stw	%i4,	[%l7 + 0x18]
	addc	%i6,	%g6,	%l2
	fzero	%f6
	edge32	%i7,	%g5,	%l0
	addcc	%o7,	0x18F2,	%i5
	alignaddrl	%l3,	%o1,	%o6
	umulcc	%g3,	%l4,	%o3
	sllx	%l6,	%l5,	%i3
	movleu	%xcc,	%l1,	%o4
	sethi	0x08D0,	%g2
	edge8	%g4,	%i0,	%g1
	subcc	%o5,	0x157B,	%o2
	xor	%g7,	%i1,	%i2
	ldsb	[%l7 + 0x4C],	%i4
	fpsub32s	%f19,	%f19,	%f20
	array8	%o0,	%g6,	%i6
	edge16n	%i7,	%g5,	%l2
	movrne	%o7,	0x3D2,	%l0
	fmovdle	%icc,	%f10,	%f1
	ld	[%l7 + 0x30],	%f3
	ldd	[%l7 + 0x18],	%l2
	andn	%i5,	0x1F53,	%o1
	movne	%icc,	%o6,	%l4
	movre	%o3,	0x1D2,	%g3
	add	%l6,	%i3,	%l1
	add	%o4,	%g2,	%l5
	edge32l	%i0,	%g1,	%o5
	movl	%icc,	%o2,	%g7
	ldd	[%l7 + 0x70],	%g4
	fornot1s	%f16,	%f12,	%f9
	movrgez	%i1,	0x29B,	%i2
	fornot1	%f8,	%f22,	%f2
	subc	%i4,	%g6,	%o0
	movvs	%xcc,	%i7,	%i6
	addccc	%g5,	0x15A9,	%o7
	sdivcc	%l0,	0x06E0,	%l2
	movle	%xcc,	%l3,	%o1
	or	%o6,	0x144D,	%l4
	movpos	%xcc,	%i5,	%o3
	movcs	%xcc,	%g3,	%i3
	fmovsa	%xcc,	%f15,	%f30
	ldd	[%l7 + 0x50],	%f18
	umulcc	%l1,	0x0F40,	%o4
	or	%g2,	0x0D3F,	%l5
	lduw	[%l7 + 0x28],	%l6
	udiv	%i0,	0x08BC,	%g1
	movge	%icc,	%o5,	%o2
	edge32l	%g4,	%g7,	%i2
	umul	%i1,	%i4,	%g6
	subccc	%o0,	0x0470,	%i7
	sth	%g5,	[%l7 + 0x10]
	ldsw	[%l7 + 0x4C],	%o7
	andn	%i6,	0x0ADF,	%l0
	sdiv	%l2,	0x0FA9,	%l3
	movne	%icc,	%o6,	%l4
	ldsh	[%l7 + 0x64],	%o1
	udivx	%i5,	0x1271,	%g3
	udivx	%o3,	0x08D0,	%l1
	subccc	%i3,	%g2,	%l5
	fmovsg	%xcc,	%f5,	%f28
	lduw	[%l7 + 0x1C],	%l6
	sllx	%o4,	0x11,	%i0
	movre	%o5,	0x172,	%g1
	xor	%o2,	%g4,	%g7
	movg	%icc,	%i2,	%i1
	edge8	%i4,	%o0,	%g6
	xorcc	%g5,	%o7,	%i6
	fpadd32s	%f6,	%f14,	%f8
	movge	%xcc,	%l0,	%i7
	movpos	%xcc,	%l2,	%l3
	ldd	[%l7 + 0x30],	%o6
	edge8ln	%o1,	%l4,	%g3
	ldd	[%l7 + 0x30],	%o2
	srax	%l1,	0x01,	%i5
	edge16	%i3,	%l5,	%g2
	sra	%o4,	0x0F,	%i0
	fmovsg	%icc,	%f8,	%f22
	fcmps	%fcc3,	%f20,	%f1
	mova	%icc,	%l6,	%o5
	sth	%g1,	[%l7 + 0x26]
	udivcc	%g4,	0x0C99,	%o2
	fsrc2	%f4,	%f10
	std	%f28,	[%l7 + 0x08]
	umulcc	%i2,	%i1,	%i4
	fcmpeq32	%f6,	%f6,	%g7
	mulx	%g6,	%g5,	%o7
	movleu	%icc,	%i6,	%l0
	stx	%i7,	[%l7 + 0x78]
	move	%xcc,	%o0,	%l2
	fmovse	%xcc,	%f30,	%f5
	edge16l	%o6,	%l3,	%o1
	nop
	set	0x48, %o7
	std	%f10,	[%l7 + %o7]
	subc	%g3,	%o3,	%l4
	andcc	%i5,	0x17DB,	%l1
	sth	%l5,	[%l7 + 0x5C]
	addccc	%g2,	%o4,	%i0
	udivcc	%l6,	0x0894,	%o5
	movrlz	%i3,	0x215,	%g1
	xorcc	%g4,	%o2,	%i2
	sethi	0x1C3E,	%i4
	add	%g7,	0x1AC2,	%i1
	ld	[%l7 + 0x5C],	%f18
	st	%f8,	[%l7 + 0x7C]
	movleu	%xcc,	%g5,	%o7
	st	%f31,	[%l7 + 0x7C]
	xnorcc	%i6,	%l0,	%g6
	sllx	%o0,	0x1C,	%l2
	movge	%xcc,	%o6,	%i7
	std	%f16,	[%l7 + 0x18]
	orncc	%o1,	%l3,	%o3
	ldd	[%l7 + 0x70],	%f12
	or	%g3,	0x1C8E,	%i5
	stb	%l4,	[%l7 + 0x42]
	edge8l	%l5,	%l1,	%o4
	fcmpes	%fcc0,	%f14,	%f11
	ldd	[%l7 + 0x78],	%f2
	array8	%g2,	%i0,	%o5
	fcmpes	%fcc2,	%f25,	%f30
	orncc	%i3,	0x02DD,	%g1
	move	%icc,	%g4,	%o2
	orcc	%i2,	%l6,	%g7
	movn	%xcc,	%i1,	%i4
	movpos	%xcc,	%o7,	%g5
	lduh	[%l7 + 0x7A],	%l0
	fcmped	%fcc0,	%f18,	%f26
	fornot1	%f20,	%f16,	%f22
	stx	%i6,	[%l7 + 0x18]
	edge16l	%o0,	%l2,	%o6
	fmovdn	%icc,	%f23,	%f1
	lduh	[%l7 + 0x08],	%g6
	edge16l	%i7,	%o1,	%l3
	edge32ln	%o3,	%g3,	%i5
	add	%l4,	0x1127,	%l1
	sdivx	%l5,	0x0827,	%g2
	fmovsg	%xcc,	%f5,	%f18
	array16	%i0,	%o4,	%o5
	save %g1, %g4, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%o2,	%l6,	%g7
	ldd	[%l7 + 0x08],	%f2
	fnot1s	%f12,	%f29
	fandnot2	%f18,	%f0,	%f26
	fsrc1	%f12,	%f28
	edge16	%i1,	%i4,	%o7
	alignaddr	%i2,	%g5,	%l0
	popc	%i6,	%o0
	sll	%l2,	0x06,	%g6
	umulcc	%i7,	%o1,	%o6
	movg	%xcc,	%o3,	%l3
	movrlez	%i5,	%l4,	%l1
	sra	%g3,	0x0D,	%g2
	addcc	%i0,	0x0FC5,	%l5
	edge8	%o4,	%g1,	%o5
	fmovs	%f0,	%f22
	fmovrde	%i3,	%f2,	%f12
	ldd	[%l7 + 0x40],	%g4
	smulcc	%o2,	%g7,	%l6
	xorcc	%i1,	0x1B76,	%i4
	sdivcc	%o7,	0x1495,	%i2
	fcmpeq32	%f10,	%f30,	%g5
	fmovda	%xcc,	%f26,	%f8
	st	%f21,	[%l7 + 0x1C]
	orn	%i6,	0x1776,	%o0
	movcc	%xcc,	%l0,	%g6
	movrlz	%l2,	0x182,	%i7
	stx	%o1,	[%l7 + 0x58]
	mova	%icc,	%o6,	%o3
	std	%f28,	[%l7 + 0x20]
	fmovrdlez	%l3,	%f6,	%f6
	st	%f21,	[%l7 + 0x58]
	sir	0x1923
	alignaddrl	%l4,	%l1,	%i5
	smul	%g3,	0x1E3A,	%g2
	mulx	%l5,	0x19FC,	%i0
	subccc	%o4,	%g1,	%o5
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	movleu	%xcc,	%g7,	%l6
	sra	%o2,	0x06,	%i4
	edge32n	%o7,	%i2,	%i1
	fandnot2s	%f29,	%f6,	%f8
	movpos	%xcc,	%i6,	%g5
	movrgz	%l0,	0x35D,	%g6
	movl	%icc,	%o0,	%l2
	fcmpeq16	%f28,	%f20,	%i7
	edge8	%o1,	%o3,	%o6
	orcc	%l4,	0x069C,	%l3
	edge16ln	%l1,	%g3,	%i5
	stx	%g2,	[%l7 + 0x58]
	sethi	0x1AA1,	%l5
	movrne	%i0,	%o4,	%g1
	movcs	%xcc,	%o5,	%g4
	addcc	%i3,	%l6,	%o2
	fxors	%f18,	%f19,	%f29
	fnot1s	%f14,	%f27
	array16	%i4,	%g7,	%o7
	alignaddrl	%i2,	%i1,	%g5
	movvc	%xcc,	%i6,	%l0
	subcc	%g6,	%l2,	%i7
	xnorcc	%o0,	%o1,	%o6
	movne	%xcc,	%l4,	%l3
	fones	%f25
	movre	%l1,	%g3,	%o3
	array8	%i5,	%l5,	%g2
	movg	%xcc,	%o4,	%i0
	fmovsgu	%icc,	%f9,	%f26
	std	%f2,	[%l7 + 0x20]
	ldd	[%l7 + 0x68],	%o4
	edge8	%g1,	%g4,	%i3
	movvs	%icc,	%l6,	%o2
	udivcc	%g7,	0x0794,	%o7
	fzero	%f8
	andcc	%i4,	0x036B,	%i2
	sir	0x1811
	bshuffle	%f28,	%f6,	%f12
	fmovsle	%xcc,	%f28,	%f10
	fone	%f6
	alignaddrl	%i1,	%i6,	%g5
	edge16ln	%l0,	%g6,	%i7
	ldsw	[%l7 + 0x58],	%o0
	srax	%o1,	%l2,	%o6
	fmovdg	%xcc,	%f30,	%f6
	movvc	%icc,	%l4,	%l3
	sth	%g3,	[%l7 + 0x1A]
	subccc	%l1,	0x1AF4,	%o3
	array8	%i5,	%l5,	%g2
	fmovdcc	%icc,	%f23,	%f14
	fmovse	%icc,	%f17,	%f3
	movgu	%xcc,	%o4,	%o5
	fcmpd	%fcc2,	%f30,	%f4
	alignaddrl	%g1,	%i0,	%i3
	fcmpd	%fcc3,	%f20,	%f10
	movneg	%icc,	%g4,	%o2
	udivx	%l6,	0x03B2,	%g7
	edge32l	%o7,	%i2,	%i1
	sub	%i4,	0x1165,	%g5
	andcc	%l0,	0x0A26,	%i6
	fmovsneg	%icc,	%f16,	%f2
	fcmpne16	%f10,	%f26,	%i7
	xnorcc	%o0,	0x13F1,	%g6
	fmovdleu	%icc,	%f31,	%f16
	movrgz	%l2,	%o6,	%o1
	add	%l4,	%l3,	%l1
	fpadd32s	%f12,	%f1,	%f31
	fmul8x16al	%f12,	%f26,	%f10
	edge32	%g3,	%o3,	%l5
	fmuld8sux16	%f1,	%f12,	%f4
	subc	%g2,	0x0D16,	%o4
	nop
	set	0x64, %i0
	lduh	[%l7 + %i0],	%o5
	sethi	0x06C3,	%g1
	xor	%i5,	%i3,	%g4
	movrlez	%i0,	%l6,	%g7
	movgu	%xcc,	%o7,	%o2
	fmovrdlz	%i1,	%f10,	%f22
	nop
	set	0x64, %i1
	lduw	[%l7 + %i1],	%i2
	subccc	%i4,	%g5,	%l0
	array16	%i7,	%o0,	%i6
	sllx	%g6,	0x0B,	%l2
	ldx	[%l7 + 0x60],	%o1
	mulscc	%l4,	0x15ED,	%l3
	sll	%o6,	%l1,	%o3
	fxors	%f18,	%f19,	%f19
	fpmerge	%f13,	%f1,	%f22
	fornot1	%f2,	%f6,	%f22
	alignaddrl	%g3,	%l5,	%g2
	movn	%xcc,	%o5,	%o4
	fmovrdgz	%i5,	%f16,	%f24
	srlx	%i3,	0x00,	%g4
	fmovrdlez	%i0,	%f16,	%f10
	smulcc	%l6,	%g7,	%o7
	fandnot2s	%f29,	%f4,	%f23
	array8	%o2,	%i1,	%i2
	ldub	[%l7 + 0x5F],	%i4
	ldsw	[%l7 + 0x3C],	%g5
	fmovdleu	%xcc,	%f10,	%f21
	array8	%l0,	%i7,	%g1
	lduh	[%l7 + 0x78],	%o0
	addc	%g6,	0x0763,	%l2
	fnegd	%f28,	%f28
	orncc	%i6,	%l4,	%o1
	edge32l	%o6,	%l3,	%o3
	ldd	[%l7 + 0x48],	%g2
	movne	%xcc,	%l5,	%g2
	ldx	[%l7 + 0x68],	%o5
	movneg	%icc,	%o4,	%l1
	edge8ln	%i3,	%g4,	%i0
	fornot2	%f8,	%f28,	%f16
	movvc	%xcc,	%i5,	%g7
	edge32l	%l6,	%o7,	%i1
	ldsb	[%l7 + 0x60],	%o2
	xor	%i4,	%i2,	%l0
	ld	[%l7 + 0x64],	%f0
	subc	%g5,	%g1,	%i7
	edge32ln	%o0,	%l2,	%g6
	edge16	%l4,	%o1,	%i6
	fnot2s	%f6,	%f4
	srl	%l3,	%o6,	%g3
	movrgez	%o3,	%g2,	%l5
	or	%o5,	0x1D20,	%o4
	edge32	%i3,	%g4,	%i0
	udivx	%l1,	0x02CD,	%g7
	edge16ln	%i5,	%o7,	%i1
	andncc	%l6,	%i4,	%i2
	movneg	%xcc,	%l0,	%g5
	popc	%g1,	%o2
	fmovd	%f26,	%f14
	alignaddrl	%i7,	%l2,	%g6
	edge16ln	%o0,	%l4,	%i6
	stb	%l3,	[%l7 + 0x4B]
	for	%f6,	%f24,	%f28
	st	%f19,	[%l7 + 0x7C]
	movrgz	%o6,	%g3,	%o1
	stx	%o3,	[%l7 + 0x08]
	fpmerge	%f4,	%f6,	%f20
	ldsw	[%l7 + 0x5C],	%l5
	subc	%o5,	%g2,	%i3
	udiv	%g4,	0x1D5B,	%o4
	lduw	[%l7 + 0x5C],	%i0
	srl	%g7,	0x05,	%i5
	xnorcc	%o7,	0x0AA3,	%i1
	udivx	%l6,	0x1050,	%l1
	andn	%i4,	%l0,	%g5
	srax	%i2,	%g1,	%i7
	ldd	[%l7 + 0x68],	%o2
	movge	%icc,	%g6,	%o0
	andcc	%l2,	0x051C,	%l4
	movn	%xcc,	%i6,	%l3
	stw	%o6,	[%l7 + 0x38]
	edge32	%o1,	%g3,	%o3
	fmovse	%icc,	%f4,	%f2
	movcs	%xcc,	%o5,	%g2
	lduh	[%l7 + 0x36],	%i3
	xnor	%l5,	%o4,	%i0
	ldub	[%l7 + 0x72],	%g7
	fornot1	%f8,	%f18,	%f2
	xnorcc	%i5,	0x0134,	%o7
	movge	%icc,	%g4,	%i1
	movvc	%xcc,	%l6,	%l1
	orcc	%i4,	0x190F,	%g5
	fcmple16	%f28,	%f8,	%l0
	xorcc	%i2,	%g1,	%i7
	orcc	%o2,	%g6,	%o0
	xorcc	%l4,	%i6,	%l2
	edge8n	%l3,	%o6,	%o1
	fone	%f0
	fsrc1	%f8,	%f12
	movcc	%xcc,	%g3,	%o5
	addc	%g2,	0x0C25,	%i3
	xorcc	%o3,	%l5,	%o4
	ldd	[%l7 + 0x30],	%f24
	sethi	0x13CD,	%g7
	st	%f24,	[%l7 + 0x28]
	fpackfix	%f6,	%f10
	ldsh	[%l7 + 0x58],	%i0
	alignaddrl	%i5,	%g4,	%o7
	edge32l	%l6,	%l1,	%i1
	movneg	%icc,	%g5,	%l0
	stb	%i2,	[%l7 + 0x1A]
	xor	%i4,	0x0F25,	%i7
	sub	%o2,	0x0D7E,	%g6
	fcmple32	%f22,	%f0,	%g1
	stx	%o0,	[%l7 + 0x30]
	ldd	[%l7 + 0x28],	%f2
	xorcc	%l4,	0x08C9,	%l2
	nop
	set	0x14, %l0
	lduw	[%l7 + %l0],	%l3
	movle	%icc,	%o6,	%o1
	andcc	%i6,	%o5,	%g3
	udivcc	%g2,	0x1130,	%o3
	movrlez	%i3,	0x22F,	%o4
	movneg	%icc,	%l5,	%g7
	save %i0, %i5, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%g4,	0x1A4,	%l1
	ldd	[%l7 + 0x38],	%i6
	sub	%i1,	0x1F1E,	%g5
	fornot2s	%f20,	%f30,	%f7
	ldd	[%l7 + 0x38],	%f26
	ldsw	[%l7 + 0x10],	%i2
	edge8ln	%i4,	%i7,	%o2
	movgu	%xcc,	%g6,	%l0
	edge16	%o0,	%l4,	%l2
	fmovdne	%icc,	%f7,	%f20
	addccc	%l3,	%g1,	%o6
	add	%o1,	%i6,	%g3
	movrlz	%g2,	0x363,	%o5
	sdivx	%o3,	0x000A,	%o4
	addccc	%l5,	%i3,	%g7
	smul	%i0,	0x05FE,	%i5
	srlx	%g4,	0x15,	%o7
	edge32n	%l6,	%i1,	%g5
	edge16	%l1,	%i4,	%i2
	mulscc	%o2,	0x09A6,	%i7
	orcc	%g6,	0x1D39,	%o0
	and	%l4,	0x0B03,	%l0
	lduh	[%l7 + 0x6E],	%l3
	stb	%g1,	[%l7 + 0x16]
	for	%f12,	%f12,	%f6
	restore %l2, %o1, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o6,	%g3
	movneg	%xcc,	%g2,	%o3
	stb	%o4,	[%l7 + 0x36]
	movvc	%icc,	%l5,	%o5
	alignaddr	%g7,	%i3,	%i0
	fornot1s	%f24,	%f24,	%f18
	xnor	%g4,	%o7,	%i5
	mulx	%i1,	%g5,	%l1
	movrne	%l6,	%i4,	%i2
	fmovdn	%icc,	%f28,	%f5
	fmovrsgz	%o2,	%f6,	%f7
	orcc	%i7,	0x1FB8,	%o0
	movg	%xcc,	%l4,	%g6
	xor	%l3,	%g1,	%l0
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	andncc	%o6,	%g3,	%g2
	edge16l	%o3,	%i6,	%l5
	fpsub32s	%f0,	%f22,	%f25
	fpadd32	%f28,	%f28,	%f22
	lduh	[%l7 + 0x3E],	%o4
	subc	%o5,	0x0C63,	%g7
	stw	%i0,	[%l7 + 0x58]
	udivcc	%i3,	0x035B,	%g4
	fabsd	%f0,	%f8
	fsrc2	%f18,	%f18
	fmovdl	%xcc,	%f17,	%f31
	fandnot1	%f14,	%f24,	%f24
	edge16n	%i5,	%o7,	%i1
	popc	0x14CF,	%g5
	movg	%icc,	%l6,	%l1
	umulcc	%i4,	%o2,	%i7
	fornot2s	%f10,	%f4,	%f7
	fmovrsgz	%i2,	%f21,	%f22
	addc	%o0,	%g6,	%l4
	edge16	%l3,	%l0,	%g1
	ldsb	[%l7 + 0x5C],	%l2
	addccc	%o1,	%g3,	%g2
	xnor	%o6,	0x0312,	%o3
	srl	%l5,	%o4,	%o5
	add	%i6,	0x1F30,	%i0
	fxnor	%f22,	%f12,	%f16
	orncc	%g7,	%g4,	%i3
	fmul8sux16	%f30,	%f12,	%f20
	fmovrsgez	%i5,	%f26,	%f12
	movleu	%icc,	%i1,	%o7
	andn	%g5,	0x0B85,	%l1
	orcc	%l6,	%i4,	%o2
	add	%i7,	0x01A0,	%o0
	edge32	%i2,	%g6,	%l3
	st	%f11,	[%l7 + 0x68]
	smulcc	%l4,	0x17BC,	%l0
	addcc	%g1,	%l2,	%g3
	orn	%g2,	%o6,	%o3
	fmovsgu	%icc,	%f17,	%f15
	fnands	%f21,	%f25,	%f20
	movvs	%icc,	%l5,	%o1
	sdivx	%o4,	0x0125,	%i6
	and	%i0,	%g7,	%o5
	sdivx	%i3,	0x1078,	%i5
	fnot2	%f24,	%f24
	fmovrsgz	%i1,	%f15,	%f0
	andncc	%o7,	%g4,	%l1
	movl	%xcc,	%l6,	%i4
	fpsub32s	%f26,	%f4,	%f27
	lduh	[%l7 + 0x08],	%g5
	udiv	%o2,	0x11E4,	%i7
	or	%o0,	%i2,	%l3
	movrgez	%l4,	%g6,	%g1
	fpadd32	%f28,	%f0,	%f28
	movle	%icc,	%l0,	%l2
	xor	%g2,	0x0E40,	%g3
	orcc	%o6,	%l5,	%o3
	edge16n	%o1,	%i6,	%o4
	movne	%xcc,	%i0,	%g7
	edge16	%i3,	%i5,	%o5
	fnot1	%f4,	%f6
	smulcc	%i1,	0x0FED,	%g4
	sdivx	%l1,	0x0613,	%l6
	move	%xcc,	%i4,	%g5
	fxor	%f2,	%f0,	%f16
	sir	0x0A30
	fnands	%f11,	%f8,	%f30
	fcmpgt16	%f4,	%f28,	%o7
	xorcc	%i7,	0x1070,	%o2
	movl	%xcc,	%i2,	%l3
	movle	%icc,	%o0,	%l4
	andncc	%g6,	%g1,	%l0
	edge8ln	%g2,	%g3,	%o6
	movpos	%icc,	%l5,	%l2
	add	%o3,	%o1,	%i6
	edge8n	%o4,	%g7,	%i0
	subccc	%i5,	0x0748,	%i3
	fpsub32s	%f9,	%f30,	%f22
	fcmpd	%fcc3,	%f16,	%f18
	umul	%o5,	0x09D3,	%g4
	edge8n	%i1,	%l6,	%i4
	array32	%g5,	%l1,	%o7
	fmovsvc	%icc,	%f4,	%f29
	movg	%xcc,	%i7,	%o2
	edge8n	%l3,	%o0,	%i2
	ldx	[%l7 + 0x70],	%g6
	fcmpgt32	%f24,	%f16,	%l4
	siam	0x0
	sdivx	%l0,	0x0364,	%g1
	movrgez	%g3,	0x2BB,	%g2
	movpos	%xcc,	%l5,	%o6
	edge16n	%o3,	%l2,	%o1
	ldd	[%l7 + 0x38],	%f4
	fnegd	%f6,	%f4
	nop
	set	0x28, %o3
	ldx	[%l7 + %o3],	%o4
	edge32	%i6,	%g7,	%i0
	movcs	%icc,	%i5,	%i3
	array32	%g4,	%i1,	%l6
	udivcc	%o5,	0x1856,	%i4
	st	%f15,	[%l7 + 0x7C]
	sra	%l1,	%g5,	%i7
	add	%o7,	0x0918,	%o2
	edge32	%l3,	%o0,	%g6
	popc	%l4,	%l0
	lduh	[%l7 + 0x2C],	%g1
	movre	%i2,	%g2,	%g3
	udivx	%o6,	0x0891,	%l5
	udivx	%o3,	0x0E18,	%o1
	fpsub16s	%f14,	%f27,	%f4
	movrne	%o4,	%i6,	%l2
	alignaddrl	%g7,	%i5,	%i0
	movl	%icc,	%g4,	%i3
	nop
	set	0x60, %o4
	stw	%i1,	[%l7 + %o4]
	std	%f20,	[%l7 + 0x48]
	addccc	%o5,	0x13DD,	%l6
	st	%f10,	[%l7 + 0x7C]
	movgu	%icc,	%i4,	%g5
	edge16ln	%i7,	%l1,	%o2
	lduw	[%l7 + 0x60],	%o7
	movl	%icc,	%l3,	%g6
	ldx	[%l7 + 0x50],	%l4
	fpmerge	%f5,	%f3,	%f28
	movle	%icc,	%o0,	%l0
	fcmpd	%fcc2,	%f4,	%f10
	xnorcc	%i2,	%g1,	%g2
	movg	%xcc,	%o6,	%g3
	nop
	set	0x2F, %o2
	ldsb	[%l7 + %o2],	%o3
	edge8ln	%o1,	%l5,	%o4
	edge32l	%i6,	%g7,	%l2
	fmovsl	%xcc,	%f12,	%f18
	umulcc	%i0,	0x1605,	%g4
	edge32n	%i3,	%i5,	%i1
	smulcc	%l6,	0x0EA9,	%i4
	movvs	%xcc,	%o5,	%i7
	movn	%xcc,	%l1,	%o2
	ldsw	[%l7 + 0x38],	%o7
	edge8l	%l3,	%g6,	%g5
	andcc	%l4,	0x06B8,	%l0
	fmovsg	%xcc,	%f12,	%f7
	andn	%o0,	%g1,	%g2
	sllx	%i2,	%g3,	%o3
	edge32n	%o1,	%l5,	%o4
	xnorcc	%i6,	0x06A0,	%o6
	movcs	%icc,	%g7,	%i0
	fmovrdne	%g4,	%f4,	%f18
	movre	%l2,	%i5,	%i3
	movvc	%xcc,	%l6,	%i4
	sdivcc	%i1,	0x1F98,	%i7
	save %l1, %o2, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o5,	%l3
	xorcc	%g6,	0x10D1,	%l4
	sll	%l0,	%g5,	%o0
	fxnors	%f18,	%f9,	%f11
	ldd	[%l7 + 0x50],	%f6
	edge32	%g2,	%i2,	%g1
	udivx	%g3,	0x16EE,	%o1
	ld	[%l7 + 0x60],	%f0
	fandnot1s	%f0,	%f1,	%f17
	sdiv	%l5,	0x18DC,	%o3
	movrne	%o4,	0x125,	%i6
	addc	%o6,	%g7,	%g4
	xnor	%i0,	0x0D21,	%i5
	xor	%i3,	0x1D83,	%l6
	movvc	%icc,	%i4,	%l2
	ldsb	[%l7 + 0x67],	%i7
	alignaddrl	%l1,	%i1,	%o7
	mulx	%o2,	%o5,	%l3
	nop
	set	0x40, %l5
	ldx	[%l7 + %l5],	%l4
	movrgez	%g6,	0x2B1,	%g5
	sub	%l0,	%g2,	%i2
	umul	%g1,	0x1CB7,	%o0
	movcc	%xcc,	%g3,	%o1
	nop
	set	0x46, %l6
	lduh	[%l7 + %l6],	%o3
	edge16ln	%o4,	%i6,	%l5
	sllx	%o6,	%g7,	%i0
	save %i5, 0x1B04, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i3,	%i4,	%l6
	addccc	%l2,	0x10B4,	%l1
	movle	%icc,	%i1,	%i7
	std	%f16,	[%l7 + 0x78]
	movvs	%icc,	%o2,	%o7
	fmovsn	%icc,	%f29,	%f10
	sdiv	%l3,	0x08A3,	%l4
	and	%g6,	0x0500,	%o5
	fxor	%f28,	%f16,	%f4
	xor	%g5,	%l0,	%g2
	sdivcc	%i2,	0x057F,	%g1
	andn	%g3,	%o1,	%o0
	andn	%o3,	%o4,	%l5
	mulx	%i6,	%g7,	%i0
	fmovrdlz	%o6,	%f28,	%f4
	subcc	%i5,	0x1D5E,	%g4
	array32	%i4,	%l6,	%i3
	subc	%l2,	0x06F5,	%i1
	sra	%i7,	%o2,	%l1
	stx	%l3,	[%l7 + 0x30]
	edge16n	%o7,	%l4,	%o5
	movl	%xcc,	%g5,	%g6
	movge	%icc,	%l0,	%g2
	movge	%icc,	%g1,	%i2
	sllx	%o1,	%g3,	%o3
	fmovdgu	%xcc,	%f7,	%f4
	srax	%o0,	0x03,	%l5
	stb	%i6,	[%l7 + 0x28]
	st	%f1,	[%l7 + 0x14]
	sdivx	%o4,	0x0ECE,	%i0
	fmovsvc	%xcc,	%f0,	%f14
	mulscc	%g7,	%i5,	%o6
	move	%xcc,	%i4,	%g4
	ldub	[%l7 + 0x5E],	%i3
	mulscc	%l2,	%l6,	%i1
	movcc	%xcc,	%o2,	%i7
	fand	%f2,	%f20,	%f22
	edge32l	%l3,	%o7,	%l1
	fornot1s	%f27,	%f4,	%f8
	fxor	%f18,	%f16,	%f8
	movcc	%icc,	%o5,	%g5
	fmovrse	%l4,	%f0,	%f10
	sdivx	%g6,	0x19C3,	%l0
	fmovdg	%icc,	%f23,	%f13
	array32	%g1,	%g2,	%o1
	xnor	%i2,	0x0633,	%g3
	movle	%icc,	%o3,	%l5
	fornot2s	%f16,	%f30,	%f20
	ldsh	[%l7 + 0x0E],	%i6
	and	%o0,	0x0D14,	%o4
	subccc	%g7,	0x12FC,	%i5
	xor	%o6,	0x1006,	%i0
	movrgez	%g4,	%i4,	%i3
	subccc	%l6,	0x040E,	%i1
	restore %o2, %i7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f3,	%f18
	xor	%o7,	0x0223,	%l1
	movvs	%icc,	%o5,	%l2
	movl	%xcc,	%l4,	%g6
	fmovrdlez	%g5,	%f10,	%f6
	ldsb	[%l7 + 0x18],	%l0
	addc	%g2,	%g1,	%i2
	edge32n	%g3,	%o3,	%l5
	alignaddr	%i6,	%o0,	%o4
	xor	%g7,	%o1,	%o6
	addc	%i5,	0x056D,	%i0
	alignaddrl	%g4,	%i4,	%l6
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	umulcc	%l3,	0x0C77,	%o7
	fpmerge	%f10,	%f17,	%f8
	xorcc	%l1,	%o5,	%l2
	fcmpne32	%f20,	%f8,	%o2
	edge16	%g6,	%l4,	%l0
	fnot2s	%f26,	%f4
	fandnot1	%f12,	%f14,	%f16
	movneg	%icc,	%g5,	%g1
	srax	%i2,	%g2,	%o3
	fcmped	%fcc0,	%f10,	%f10
	ldsh	[%l7 + 0x74],	%g3
	ldd	[%l7 + 0x10],	%i6
	edge16	%o0,	%o4,	%g7
	movvs	%icc,	%l5,	%o1
	fmovdle	%icc,	%f0,	%f23
	edge8n	%o6,	%i0,	%g4
	edge16l	%i5,	%i4,	%i1
	movcs	%xcc,	%i3,	%l6
	edge32n	%i7,	%l3,	%o7
	movleu	%xcc,	%l1,	%o5
	fmovdl	%xcc,	%f2,	%f29
	fexpand	%f5,	%f18
	edge16l	%l2,	%g6,	%o2
	movle	%icc,	%l0,	%g5
	movvc	%xcc,	%l4,	%g1
	popc	%g2,	%o3
	fnot1	%f2,	%f18
	ldx	[%l7 + 0x28],	%g3
	andncc	%i2,	%i6,	%o0
	andcc	%o4,	0x15C0,	%l5
	umul	%g7,	%o6,	%o1
	lduw	[%l7 + 0x40],	%i0
	edge16	%i5,	%g4,	%i4
	edge32ln	%i3,	%l6,	%i1
	fpmerge	%f23,	%f20,	%f0
	movg	%xcc,	%l3,	%i7
	ldsb	[%l7 + 0x0F],	%l1
	sllx	%o5,	0x13,	%o7
	fmovrsgez	%l2,	%f22,	%f21
	alignaddr	%o2,	%l0,	%g6
	popc	0x1701,	%g5
	udiv	%g1,	0x1E00,	%g2
	udivx	%l4,	0x1C59,	%o3
	fmovsge	%icc,	%f4,	%f19
	movl	%icc,	%i2,	%g3
	edge32n	%i6,	%o4,	%l5
	edge32	%g7,	%o0,	%o1
	array8	%i0,	%o6,	%i5
	or	%g4,	0x0C89,	%i4
	addcc	%l6,	0x1BFB,	%i3
	movrne	%i1,	0x35D,	%i7
	sir	0x0F2C
	alignaddr	%l1,	%o5,	%l3
	movrne	%l2,	0x05F,	%o2
	srl	%l0,	0x12,	%g6
	xor	%o7,	0x0FE2,	%g1
	edge32	%g2,	%l4,	%o3
	ldsb	[%l7 + 0x32],	%i2
	addccc	%g3,	%i6,	%o4
	addc	%l5,	0x0F85,	%g5
	movrlez	%g7,	0x06F,	%o1
	edge8ln	%o0,	%i0,	%i5
	ld	[%l7 + 0x54],	%f5
	movge	%icc,	%o6,	%i4
	andn	%g4,	0x13E1,	%l6
	movneg	%icc,	%i1,	%i7
	srlx	%i3,	0x03,	%o5
	for	%f0,	%f24,	%f16
	movrne	%l3,	0x3E2,	%l2
	srlx	%l1,	0x0A,	%o2
	andncc	%g6,	%l0,	%g1
	movne	%xcc,	%o7,	%l4
	ldd	[%l7 + 0x58],	%g2
	lduw	[%l7 + 0x50],	%i2
	movne	%xcc,	%g3,	%o3
	movrgez	%i6,	%l5,	%g5
	fmovdcc	%xcc,	%f15,	%f28
	subccc	%o4,	%o1,	%o0
	and	%i0,	%i5,	%g7
	stw	%i4,	[%l7 + 0x70]
	addc	%o6,	%l6,	%i1
	subcc	%i7,	0x1107,	%i3
	umul	%g4,	%o5,	%l2
	ldd	[%l7 + 0x28],	%f10
	ldsb	[%l7 + 0x09],	%l3
	movre	%l1,	0x260,	%g6
	ld	[%l7 + 0x2C],	%f0
	sra	%o2,	0x01,	%g1
	movcc	%xcc,	%l0,	%l4
	movg	%xcc,	%g2,	%i2
	orn	%g3,	%o3,	%i6
	mulscc	%o7,	%g5,	%l5
	array32	%o4,	%o0,	%i0
	movpos	%icc,	%i5,	%g7
	edge16n	%o1,	%i4,	%l6
	fcmps	%fcc1,	%f5,	%f1
	fornot2	%f14,	%f26,	%f22
	xnorcc	%i1,	0x023F,	%i7
	movre	%o6,	%i3,	%o5
	fcmpne32	%f4,	%f12,	%l2
	fcmpes	%fcc2,	%f18,	%f25
	nop
	set	0x44, %g3
	lduw	[%l7 + %g3],	%g4
	ldd	[%l7 + 0x78],	%f22
	fmovsleu	%icc,	%f24,	%f16
	movre	%l1,	0x236,	%l3
	srlx	%o2,	%g6,	%l0
	st	%f5,	[%l7 + 0x54]
	sdivx	%g1,	0x192F,	%l4
	alignaddrl	%i2,	%g3,	%g2
	movvs	%xcc,	%i6,	%o7
	movgu	%xcc,	%g5,	%o3
	udiv	%o4,	0x0F2E,	%l5
	edge8l	%i0,	%i5,	%g7
	edge16	%o0,	%i4,	%l6
	restore %o1, %i1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%i3,	%o6
	fpsub32s	%f10,	%f27,	%f1
	sir	0x1391
	fandnot1s	%f28,	%f7,	%f2
	fxor	%f6,	%f18,	%f6
	mulx	%l2,	%o5,	%l1
	orncc	%l3,	0x1F2E,	%o2
	lduw	[%l7 + 0x6C],	%g4
	smulcc	%l0,	%g6,	%g1
	andcc	%i2,	0x142A,	%g3
	and	%l4,	0x1FFA,	%i6
	movleu	%icc,	%g2,	%g5
	fmovdg	%icc,	%f22,	%f26
	edge32ln	%o3,	%o4,	%o7
	umul	%i0,	%i5,	%g7
	fpmerge	%f20,	%f4,	%f14
	movrgez	%o0,	0x2B1,	%i4
	srl	%l6,	%l5,	%i1
	std	%f22,	[%l7 + 0x08]
	std	%f22,	[%l7 + 0x50]
	edge8ln	%o1,	%i3,	%o6
	edge8l	%l2,	%i7,	%l1
	stw	%o5,	[%l7 + 0x6C]
	sdivx	%o2,	0x192E,	%l3
	subcc	%g4,	%l0,	%g1
	save %g6, %g3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16s	%f16,	%f24,	%f27
	lduw	[%l7 + 0x44],	%i6
	sir	0x03FC
	edge16	%l4,	%g2,	%g5
	subc	%o3,	%o4,	%i0
	fpsub16s	%f5,	%f9,	%f7
	fornot2	%f20,	%f28,	%f18
	std	%f18,	[%l7 + 0x28]
	fornot2s	%f23,	%f17,	%f1
	orcc	%i5,	0x1F55,	%o7
	fandnot1s	%f7,	%f16,	%f30
	popc	%o0,	%g7
	fpack16	%f6,	%f29
	sth	%i4,	[%l7 + 0x62]
	addcc	%l6,	%l5,	%i1
	fmovse	%icc,	%f24,	%f3
	mova	%xcc,	%o1,	%i3
	fmovdne	%xcc,	%f23,	%f3
	addccc	%l2,	0x16A4,	%i7
	fmovdne	%xcc,	%f5,	%f19
	movl	%icc,	%o6,	%l1
	array32	%o5,	%l3,	%o2
	fmovsg	%icc,	%f9,	%f11
	sir	0x0C8B
	movleu	%xcc,	%l0,	%g1
	array16	%g6,	%g3,	%i2
	edge16n	%g4,	%l4,	%g2
	srl	%i6,	%o3,	%g5
	subc	%o4,	0x1478,	%i0
	fmovrdgez	%o7,	%f30,	%f8
	ldsw	[%l7 + 0x08],	%o0
	edge8n	%i5,	%g7,	%i4
	movrgez	%l5,	%l6,	%o1
	sub	%i1,	%l2,	%i7
	addcc	%i3,	%o6,	%o5
	sll	%l3,	0x13,	%l1
	movge	%xcc,	%l0,	%g1
	subcc	%o2,	%g3,	%g6
	fmovdgu	%xcc,	%f28,	%f0
	movrgz	%i2,	%l4,	%g4
	sra	%g2,	%o3,	%g5
	movge	%xcc,	%i6,	%o4
	movcs	%icc,	%i0,	%o7
	fones	%f29
	fmovrsgez	%i5,	%f28,	%f14
	alignaddr	%g7,	%i4,	%o0
	fmovscs	%xcc,	%f15,	%f1
	fsrc1	%f0,	%f24
	movcs	%icc,	%l6,	%o1
	ld	[%l7 + 0x34],	%f28
	movvs	%icc,	%i1,	%l5
	fones	%f6
	stw	%l2,	[%l7 + 0x6C]
	edge32l	%i7,	%i3,	%o6
	alignaddrl	%l3,	%l1,	%o5
	edge32	%g1,	%l0,	%o2
	edge8ln	%g6,	%g3,	%l4
	andcc	%g4,	0x19C0,	%i2
	xnor	%o3,	0x172E,	%g2
	fabsd	%f28,	%f26
	smul	%g5,	0x0D39,	%i6
	fnot1s	%f16,	%f3
	movrlez	%o4,	%i0,	%o7
	subc	%i5,	0x0697,	%g7
	std	%f2,	[%l7 + 0x58]
	movge	%icc,	%o0,	%i4
	ldub	[%l7 + 0x40],	%l6
	lduh	[%l7 + 0x48],	%o1
	ldd	[%l7 + 0x08],	%l4
	addcc	%l2,	0x19A3,	%i7
	st	%f21,	[%l7 + 0x20]
	add	%i1,	%i3,	%l3
	movne	%xcc,	%l1,	%o5
	nop
	set	0x78, %i6
	ldd	[%l7 + %i6],	%f0
	movgu	%icc,	%o6,	%l0
	fmovdge	%xcc,	%f15,	%f14
	movvs	%icc,	%o2,	%g6
	sdivx	%g1,	0x0F54,	%g3
	alignaddrl	%g4,	%i2,	%o3
	fmovdne	%icc,	%f14,	%f9
	movgu	%xcc,	%l4,	%g2
	or	%g5,	%o4,	%i6
	srl	%i0,	%i5,	%o7
	fmovrdgz	%o0,	%f24,	%f14
	ldd	[%l7 + 0x78],	%i4
	fxors	%f30,	%f22,	%f4
	lduw	[%l7 + 0x74],	%l6
	udiv	%g7,	0x1CEA,	%o1
	fmovscs	%xcc,	%f14,	%f17
	array8	%l5,	%i7,	%i1
	add	%l2,	%l3,	%l1
	movcs	%icc,	%i3,	%o5
	xnor	%l0,	%o2,	%g6
	srl	%g1,	%g3,	%o6
	movvs	%xcc,	%i2,	%o3
	faligndata	%f30,	%f30,	%f24
	fmovdcc	%xcc,	%f15,	%f2
	movvc	%xcc,	%g4,	%g2
	edge16l	%g5,	%o4,	%i6
	fmovrdlez	%l4,	%f14,	%f30
	fsrc2	%f0,	%f18
	movrlez	%i0,	%i5,	%o0
	movrne	%i4,	%o7,	%g7
	fmul8ulx16	%f6,	%f16,	%f22
	fmovda	%xcc,	%f10,	%f10
	move	%icc,	%o1,	%l6
	fcmple16	%f22,	%f12,	%i7
	udivx	%i1,	0x0560,	%l2
	nop
	set	0x50, %g7
	ldd	[%l7 + %g7],	%l4
	nop
	set	0x28, %l3
	ldd	[%l7 + %l3],	%f22
	sth	%l3,	[%l7 + 0x0C]
	array8	%l1,	%i3,	%l0
	edge16n	%o5,	%o2,	%g6
	movl	%xcc,	%g3,	%g1
	ldsb	[%l7 + 0x26],	%o6
	sdivx	%i2,	0x1AD5,	%g4
	stb	%o3,	[%l7 + 0x0D]
	edge8	%g2,	%g5,	%i6
	movvs	%icc,	%o4,	%i0
	ldsh	[%l7 + 0x56],	%l4
	or	%i5,	0x1BD8,	%o0
	xor	%o7,	0x0E65,	%g7
	fmovda	%icc,	%f26,	%f26
	alignaddr	%o1,	%l6,	%i7
	fmul8x16au	%f5,	%f4,	%f22
	movg	%icc,	%i1,	%i4
	movne	%xcc,	%l2,	%l3
	fcmpd	%fcc1,	%f30,	%f6
	ld	[%l7 + 0x08],	%f28
	mova	%icc,	%l1,	%i3
	fand	%f20,	%f4,	%f16
	addc	%l5,	%o5,	%l0
	edge8l	%g6,	%o2,	%g1
	sdiv	%o6,	0x093C,	%i2
	edge16ln	%g3,	%o3,	%g2
	lduh	[%l7 + 0x6C],	%g5
	movcs	%xcc,	%g4,	%i6
	fabss	%f31,	%f18
	xorcc	%i0,	0x1CB4,	%l4
	addc	%o4,	%o0,	%o7
	fsrc1s	%f2,	%f23
	sdivx	%g7,	0x1397,	%i5
	andn	%o1,	%i7,	%l6
	stx	%i4,	[%l7 + 0x40]
	fnot2s	%f20,	%f4
	movneg	%icc,	%i1,	%l2
	array8	%l1,	%l3,	%i3
	edge16l	%o5,	%l0,	%g6
	mulscc	%l5,	0x0FBE,	%o2
	movrlz	%g1,	%o6,	%i2
	fcmpeq32	%f4,	%f10,	%o3
	edge8ln	%g2,	%g3,	%g4
	edge16	%g5,	%i6,	%l4
	movpos	%icc,	%i0,	%o0
	fmovrdne	%o7,	%f18,	%f20
	fmovrse	%g7,	%f18,	%f4
	movcc	%xcc,	%o4,	%o1
	movg	%icc,	%i7,	%l6
	save %i4, 0x06AB, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%l2,	0x1D,	%i5
	movrgez	%l3,	%l1,	%o5
	movcs	%xcc,	%l0,	%g6
	fmovrslz	%l5,	%f28,	%f12
	fmul8x16	%f19,	%f14,	%f30
	srlx	%o2,	0x1E,	%i3
	movvs	%icc,	%g1,	%o6
	movn	%xcc,	%i2,	%o3
	edge32l	%g2,	%g3,	%g4
	nop
	set	0x2E, %l4
	lduh	[%l7 + %l4],	%g5
	lduw	[%l7 + 0x64],	%i6
	sdivcc	%i0,	0x0D85,	%l4
	edge16l	%o7,	%g7,	%o4
	and	%o0,	%o1,	%l6
	ld	[%l7 + 0x74],	%f7
	stx	%i4,	[%l7 + 0x28]
	edge32l	%i1,	%l2,	%i7
	fone	%f0
	addccc	%i5,	0x0826,	%l1
	alignaddr	%o5,	%l0,	%g6
	xnorcc	%l5,	%l3,	%o2
	edge16ln	%g1,	%o6,	%i3
	subccc	%i2,	0x0CB8,	%g2
	orncc	%o3,	0x0524,	%g3
	movneg	%xcc,	%g4,	%i6
	movge	%icc,	%i0,	%g5
	st	%f0,	[%l7 + 0x18]
	fcmple16	%f12,	%f18,	%l4
	edge16	%g7,	%o7,	%o4
	udivcc	%o0,	0x1FCA,	%l6
	orcc	%i4,	0x1E1F,	%i1
	st	%f8,	[%l7 + 0x38]
	umul	%l2,	%o1,	%i5
	movrlz	%l1,	%o5,	%l0
	movrgz	%g6,	0x105,	%l5
	udiv	%i7,	0x008F,	%l3
	fmovdge	%icc,	%f13,	%f18
	movrne	%o2,	%g1,	%o6
	fmovscc	%xcc,	%f0,	%f2
	movcc	%xcc,	%i3,	%i2
	ldsh	[%l7 + 0x52],	%o3
	movgu	%xcc,	%g2,	%g3
	fmovrde	%g4,	%f2,	%f28
	movvc	%icc,	%i6,	%g5
	fandnot2	%f10,	%f14,	%f2
	umulcc	%l4,	%g7,	%i0
	srl	%o4,	%o7,	%o0
	udivx	%i4,	0x1894,	%l6
	movre	%l2,	0x248,	%o1
	srl	%i1,	0x1D,	%i5
	fmovda	%icc,	%f26,	%f19
	addccc	%o5,	0x18B3,	%l1
	popc	%g6,	%l0
	movrgez	%i7,	%l5,	%l3
	ldsw	[%l7 + 0x30],	%o2
	sllx	%g1,	%o6,	%i2
	movge	%icc,	%i3,	%g2
	edge16	%g3,	%g4,	%i6
	subcc	%g5,	0x16F4,	%o3
	stb	%l4,	[%l7 + 0x3D]
	movl	%icc,	%i0,	%g7
	movg	%xcc,	%o7,	%o0
	fmovrdgez	%i4,	%f16,	%f26
	fnegs	%f17,	%f2
	fcmpeq32	%f10,	%f22,	%l6
	xnorcc	%l2,	%o1,	%o4
	movleu	%icc,	%i5,	%i1
	xorcc	%l1,	%g6,	%o5
	fmovdpos	%xcc,	%f21,	%f19
	orn	%l0,	0x1C9A,	%i7
	bshuffle	%f10,	%f8,	%f28
	movleu	%xcc,	%l5,	%o2
	subcc	%g1,	0x1C67,	%l3
	sdivx	%i2,	0x159E,	%i3
	alignaddrl	%o6,	%g3,	%g2
	movrne	%g4,	%i6,	%g5
	fmovspos	%xcc,	%f8,	%f26
	and	%o3,	0x031F,	%l4
	edge8l	%g7,	%i0,	%o0
	std	%f20,	[%l7 + 0x30]
	st	%f13,	[%l7 + 0x58]
	fcmpgt16	%f16,	%f22,	%o7
	movre	%l6,	0x143,	%l2
	lduh	[%l7 + 0x62],	%o1
	movgu	%xcc,	%i4,	%o4
	addc	%i5,	0x126A,	%i1
	subcc	%g6,	0x166F,	%o5
	movle	%icc,	%l1,	%i7
	fcmpgt32	%f30,	%f26,	%l0
	ldsb	[%l7 + 0x6D],	%l5
	udivx	%g1,	0x1B2C,	%o2
	edge16n	%i2,	%i3,	%l3
	fpack32	%f30,	%f6,	%f26
	lduh	[%l7 + 0x70],	%g3
	std	%f6,	[%l7 + 0x28]
	ldx	[%l7 + 0x38],	%o6
	xnor	%g2,	0x03D4,	%i6
	fmovrslz	%g4,	%f11,	%f6
	xnorcc	%g5,	0x0FE8,	%o3
	fmovrdne	%l4,	%f26,	%f20
	edge16	%g7,	%o0,	%i0
	addccc	%o7,	%l2,	%o1
	fmovdcc	%icc,	%f7,	%f6
	sdivx	%i4,	0x14F7,	%o4
	sir	0x06E7
	fornot2s	%f19,	%f30,	%f20
	edge32n	%i5,	%i1,	%g6
	orncc	%o5,	%l1,	%i7
	movne	%icc,	%l0,	%l5
	stb	%g1,	[%l7 + 0x44]
	array16	%l6,	%i2,	%o2
	array8	%l3,	%g3,	%i3
	fmovsl	%xcc,	%f24,	%f20
	std	%f26,	[%l7 + 0x38]
	subc	%g2,	%i6,	%o6
	fors	%f10,	%f1,	%f19
	fandnot1	%f28,	%f20,	%f30
	stb	%g5,	[%l7 + 0x2C]
	fmovrde	%o3,	%f24,	%f28
	mulscc	%l4,	%g4,	%g7
	stw	%i0,	[%l7 + 0x1C]
	movcc	%icc,	%o7,	%l2
	popc	%o0,	%o1
	nop
	set	0x50, %l1
	ldd	[%l7 + %l1],	%o4
	lduh	[%l7 + 0x60],	%i4
	movn	%xcc,	%i5,	%i1
	sethi	0x00B1,	%o5
	edge16	%g6,	%i7,	%l0
	fexpand	%f2,	%f16
	add	%l5,	0x17E2,	%g1
	stx	%l6,	[%l7 + 0x60]
	srlx	%i2,	0x1B,	%l1
	stb	%l3,	[%l7 + 0x12]
	or	%g3,	0x01D1,	%i3
	andn	%g2,	%o2,	%i6
	ldsh	[%l7 + 0x7E],	%o6
	popc	%o3,	%l4
	nop
	set	0x4C, %g4
	lduw	[%l7 + %g4],	%g5
	fors	%f17,	%f9,	%f26
	fnands	%f23,	%f8,	%f24
	movleu	%icc,	%g4,	%i0
	movrlez	%o7,	%g7,	%l2
	edge16n	%o1,	%o4,	%i4
	movneg	%icc,	%i5,	%i1
	popc	0x13C6,	%o5
	sub	%g6,	%i7,	%l0
	fcmpes	%fcc1,	%f12,	%f1
	edge32ln	%o0,	%g1,	%l6
	sth	%l5,	[%l7 + 0x52]
	udivcc	%i2,	0x02AD,	%l3
	fcmpne16	%f6,	%f14,	%l1
	subcc	%i3,	%g3,	%g2
	stx	%o2,	[%l7 + 0x18]
	fmovrde	%i6,	%f26,	%f24
	movrlz	%o3,	0x224,	%o6
	fpackfix	%f6,	%f12
	edge32l	%g5,	%g4,	%i0
	xnorcc	%o7,	0x105D,	%g7
	subcc	%l4,	0x0151,	%o1
	umulcc	%l2,	0x0C02,	%i4
	alignaddrl	%i5,	%i1,	%o4
	addc	%o5,	%i7,	%g6
	fxor	%f4,	%f16,	%f14
	fornot1s	%f1,	%f12,	%f13
	alignaddrl	%l0,	%o0,	%g1
	fmovdne	%icc,	%f27,	%f27
	xorcc	%l6,	0x1536,	%l5
	std	%f2,	[%l7 + 0x68]
	movvs	%xcc,	%l3,	%i2
	fnot1	%f22,	%f30
	subccc	%i3,	%g3,	%g2
	srlx	%o2,	0x0A,	%i6
	movrgez	%o3,	%l1,	%g5
	movre	%o6,	%i0,	%o7
	fmovsg	%icc,	%f18,	%f17
	movrlz	%g7,	%g4,	%l4
	srax	%l2,	%i4,	%i5
	fone	%f14
	sdivx	%i1,	0x1670,	%o1
	fandnot2s	%f1,	%f22,	%f12
	movleu	%xcc,	%o4,	%i7
	mova	%xcc,	%o5,	%l0
	edge8l	%g6,	%g1,	%o0
	fpack32	%f18,	%f24,	%f18
	alignaddr	%l6,	%l5,	%l3
	lduh	[%l7 + 0x78],	%i3
	ldd	[%l7 + 0x10],	%f24
	movrne	%g3,	0x230,	%g2
	alignaddrl	%o2,	%i2,	%i6
	movrne	%l1,	0x2DB,	%g5
	fzero	%f30
	ldd	[%l7 + 0x58],	%o2
	sub	%o6,	%o7,	%g7
	addc	%g4,	%l4,	%i0
	ld	[%l7 + 0x38],	%f9
	sdivcc	%i4,	0x0B73,	%i5
	sethi	0x17B5,	%i1
	fandnot2s	%f17,	%f6,	%f4
	sub	%l2,	0x1388,	%o1
	move	%icc,	%o4,	%i7
	st	%f13,	[%l7 + 0x18]
	srl	%o5,	%l0,	%g6
	alignaddrl	%g1,	%l6,	%o0
	stx	%l3,	[%l7 + 0x48]
	orncc	%i3,	%l5,	%g2
	sdivcc	%o2,	0x026C,	%g3
	movvs	%icc,	%i6,	%i2
	orncc	%g5,	0x056B,	%o3
	movrgz	%l1,	0x0F8,	%o6
	edge16ln	%g7,	%g4,	%o7
	array8	%i0,	%i4,	%l4
	fpsub16s	%f11,	%f8,	%f2
	fcmps	%fcc0,	%f3,	%f25
	for	%f10,	%f2,	%f22
	udivcc	%i1,	0x0182,	%l2
	ldsw	[%l7 + 0x3C],	%i5
	andcc	%o1,	%i7,	%o5
	addc	%o4,	0x0E32,	%l0
	fcmpes	%fcc0,	%f0,	%f17
	fmovrsgez	%g1,	%f9,	%f21
	ldsb	[%l7 + 0x7D],	%l6
	mulscc	%o0,	%g6,	%l3
	sdivcc	%i3,	0x1797,	%g2
	alignaddrl	%l5,	%g3,	%o2
	alignaddrl	%i2,	%i6,	%o3
	nop
	set	0x3E, %i3
	sth	%l1,	[%l7 + %i3]
	sll	%o6,	0x02,	%g5
	addccc	%g7,	0x1F61,	%o7
	xnorcc	%g4,	%i4,	%l4
	edge16l	%i1,	%l2,	%i5
	ldub	[%l7 + 0x2B],	%o1
	orcc	%i7,	%o5,	%i0
	udiv	%o4,	0x1EBF,	%l0
	srl	%g1,	0x08,	%l6
	fmovrsgez	%o0,	%f11,	%f30
	fexpand	%f18,	%f12
	fand	%f30,	%f18,	%f10
	srax	%g6,	%i3,	%g2
	movleu	%icc,	%l5,	%g3
	movneg	%xcc,	%o2,	%i2
	movl	%icc,	%l3,	%i6
	fmovdpos	%icc,	%f28,	%f4
	fnot1s	%f29,	%f13
	mulscc	%l1,	0x1506,	%o6
	smulcc	%g5,	0x0518,	%o3
	movne	%xcc,	%g7,	%g4
	and	%o7,	0x022F,	%l4
	movrne	%i4,	%i1,	%i5
	srax	%o1,	%i7,	%l2
	fmovrde	%i0,	%f26,	%f26
	fcmpne16	%f6,	%f20,	%o5
	fcmple16	%f6,	%f10,	%o4
	smul	%g1,	%l6,	%l0
	fmovdvc	%icc,	%f19,	%f15
	srax	%g6,	0x13,	%o0
	fmovde	%xcc,	%f14,	%f5
	movrne	%i3,	%g2,	%l5
	xor	%g3,	%i2,	%o2
	xorcc	%i6,	0x1230,	%l3
	sllx	%l1,	%g5,	%o6
	movrgez	%g7,	0x121,	%g4
	smulcc	%o3,	0x148C,	%o7
	fexpand	%f1,	%f26
	subccc	%l4,	%i4,	%i5
	xorcc	%i1,	0x137C,	%i7
	fmovrdne	%l2,	%f20,	%f4
	ldd	[%l7 + 0x38],	%f18
	srax	%i0,	%o1,	%o5
	srlx	%g1,	%o4,	%l6
	fcmpd	%fcc2,	%f4,	%f22
	fmovdvc	%icc,	%f19,	%f3
	fmovdcs	%icc,	%f30,	%f15
	fnot1	%f30,	%f2
	edge32	%g6,	%l0,	%i3
	sethi	0x15A7,	%g2
	fmovsne	%xcc,	%f0,	%f2
	movgu	%icc,	%o0,	%g3
	andncc	%i2,	%o2,	%l5
	or	%i6,	%l3,	%l1
	for	%f10,	%f26,	%f0
	sdiv	%g5,	0x00D6,	%o6
	array8	%g4,	%g7,	%o7
	smul	%l4,	0x152D,	%i4
	andn	%o3,	%i5,	%i1
	subc	%l2,	0x0BE6,	%i7
	sethi	0x0D84,	%o1
	ldsb	[%l7 + 0x4C],	%o5
	movle	%xcc,	%g1,	%i0
	stb	%o4,	[%l7 + 0x11]
	fmovrse	%g6,	%f23,	%f13
	alignaddr	%l0,	%i3,	%l6
	fmovdgu	%xcc,	%f2,	%f19
	udivx	%g2,	0x0981,	%o0
	sir	0x0D2E
	srlx	%g3,	0x0D,	%o2
	edge32n	%i2,	%i6,	%l5
	xor	%l3,	0x09A5,	%l1
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	edge32n	%o6,	%l4,	%i4
	edge16	%o3,	%o7,	%i1
	stw	%l2,	[%l7 + 0x10]
	movvc	%icc,	%i7,	%i5
	srlx	%o5,	%o1,	%g1
	movgu	%xcc,	%o4,	%i0
	xnor	%l0,	%g6,	%i3
	ld	[%l7 + 0x50],	%f14
	subcc	%g2,	0x1C63,	%o0
	ldsw	[%l7 + 0x1C],	%l6
	addc	%o2,	0x16CB,	%i2
	st	%f23,	[%l7 + 0x54]
	movcc	%xcc,	%g3,	%l5
	umulcc	%i6,	0x07BE,	%l3
	smulcc	%l1,	0x01AC,	%g4
	edge8l	%g7,	%o6,	%g5
	umul	%i4,	0x0BDF,	%o3
	movne	%icc,	%o7,	%l4
	mulx	%i1,	0x0439,	%i7
	subcc	%i5,	%o5,	%l2
	fmovsvs	%icc,	%f21,	%f1
	fsrc2	%f22,	%f22
	subcc	%o1,	%g1,	%i0
	or	%o4,	%g6,	%l0
	fsrc2	%f20,	%f22
	fmovsg	%icc,	%f28,	%f6
	edge16	%g2,	%i3,	%o0
	move	%icc,	%l6,	%i2
	pdist	%f4,	%f26,	%f28
	addccc	%g3,	%l5,	%o2
	umulcc	%i6,	%l1,	%l3
	restore %g7, %g4, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	st	%f24,	[%l7 + 0x64]
	andcc	%o6,	%o3,	%i4
	edge32n	%o7,	%l4,	%i1
	movn	%icc,	%i5,	%i7
	or	%o5,	0x036E,	%l2
	xorcc	%g1,	%i0,	%o1
	alignaddrl	%g6,	%o4,	%g2
	movge	%icc,	%i3,	%l0
	std	%f28,	[%l7 + 0x68]
	fmovrsne	%l6,	%f26,	%f22
	addcc	%i2,	%g3,	%o0
	edge8l	%o2,	%i6,	%l1
	fmuld8ulx16	%f4,	%f5,	%f18
	movle	%xcc,	%l5,	%l3
	ldx	[%l7 + 0x70],	%g4
	popc	0x15A4,	%g5
	fmovsgu	%icc,	%f6,	%f31
	alignaddrl	%o6,	%o3,	%g7
	srlx	%i4,	0x19,	%o7
	andcc	%l4,	%i1,	%i7
	alignaddrl	%o5,	%l2,	%g1
	fmovdg	%icc,	%f23,	%f6
	movne	%icc,	%i5,	%o1
	subcc	%g6,	0x1AC4,	%o4
	fandnot1s	%f10,	%f2,	%f17
	sth	%i0,	[%l7 + 0x66]
	fmovrsne	%i3,	%f5,	%f16
	st	%f25,	[%l7 + 0x64]
	edge8ln	%g2,	%l6,	%l0
	movneg	%xcc,	%i2,	%g3
	andcc	%o2,	%o0,	%i6
	umulcc	%l1,	0x1AF2,	%l3
	sdivx	%l5,	0x17C8,	%g5
	edge16n	%o6,	%o3,	%g7
	mova	%icc,	%g4,	%i4
	subcc	%o7,	%l4,	%i1
	orn	%i7,	%o5,	%g1
	lduh	[%l7 + 0x0E],	%i5
	sra	%l2,	%o1,	%g6
	movrgz	%i0,	0x1DE,	%o4
	and	%g2,	0x1FC8,	%i3
	udiv	%l6,	0x1EC3,	%i2
	fmovsvs	%icc,	%f14,	%f16
	mulscc	%l0,	0x0ADF,	%g3
	fxnor	%f12,	%f14,	%f28
	movvs	%xcc,	%o2,	%i6
	edge8	%l1,	%o0,	%l5
	movl	%xcc,	%g5,	%o6
	ld	[%l7 + 0x5C],	%f3
	fmovrslez	%l3,	%f17,	%f0
	sdivcc	%o3,	0x1790,	%g7
	fexpand	%f26,	%f2
	sth	%i4,	[%l7 + 0x54]
	alignaddr	%o7,	%l4,	%i1
	srax	%i7,	%o5,	%g4
	sll	%g1,	0x09,	%i5
	fcmpd	%fcc1,	%f12,	%f30
	edge16l	%l2,	%o1,	%i0
	movleu	%xcc,	%o4,	%g6
	mulx	%g2,	0x0CDF,	%i3
	fnot1	%f14,	%f0
	edge16l	%l6,	%i2,	%l0
	movrlz	%g3,	%o2,	%l1
	ldx	[%l7 + 0x48],	%o0
	fmovrdgez	%i6,	%f26,	%f26
	movgu	%xcc,	%l5,	%o6
	movgu	%icc,	%l3,	%g5
	fmovsg	%icc,	%f25,	%f23
	array16	%o3,	%g7,	%o7
	nop
	set	0x60, %i4
	ldd	[%l7 + %i4],	%l4
	fpadd32	%f22,	%f10,	%f30
	udiv	%i4,	0x1EC2,	%i1
	ldd	[%l7 + 0x70],	%o4
	lduh	[%l7 + 0x32],	%g4
	edge16ln	%g1,	%i7,	%l2
	movpos	%xcc,	%o1,	%i5
	udivcc	%i0,	0x0B18,	%g6
	orcc	%o4,	%i3,	%l6
	ldsb	[%l7 + 0x7F],	%g2
	mulscc	%l0,	%i2,	%o2
	nop
	set	0x20, %o1
	stw	%l1,	[%l7 + %o1]
	and	%o0,	%g3,	%i6
	fmovde	%xcc,	%f5,	%f12
	movneg	%icc,	%l5,	%o6
	edge32n	%g5,	%l3,	%o3
	movrne	%g7,	%o7,	%i4
	addcc	%l4,	0x196E,	%o5
	mulscc	%g4,	%i1,	%g1
	movn	%icc,	%i7,	%o1
	or	%i5,	%l2,	%g6
	alignaddr	%o4,	%i3,	%i0
	movcs	%xcc,	%g2,	%l0
	srl	%i2,	%l6,	%o2
	subccc	%o0,	0x0226,	%g3
	andcc	%i6,	0x038F,	%l1
	sth	%o6,	[%l7 + 0x20]
	fmovdgu	%xcc,	%f24,	%f21
	sdivx	%g5,	0x04D2,	%l3
	array16	%l5,	%o3,	%g7
	edge32ln	%o7,	%l4,	%o5
	sethi	0x13D6,	%i4
	fmovdcs	%xcc,	%f30,	%f23
	alignaddrl	%i1,	%g1,	%g4
	fmovdcs	%icc,	%f14,	%f4
	sdiv	%o1,	0x1461,	%i7
	movrgez	%l2,	0x04B,	%i5
	umulcc	%o4,	%g6,	%i0
	edge16	%i3,	%l0,	%i2
	fors	%f16,	%f1,	%f26
	orncc	%g2,	0x1C08,	%o2
	umulcc	%o0,	%l6,	%i6
	movvs	%icc,	%g3,	%o6
	smulcc	%g5,	0x0A5B,	%l1
	sllx	%l3,	0x12,	%l5
	move	%icc,	%g7,	%o7
	edge32l	%l4,	%o3,	%i4
	fmovspos	%xcc,	%f10,	%f12
	movvs	%icc,	%i1,	%o5
	sdiv	%g4,	0x1A64,	%g1
	edge8l	%i7,	%o1,	%l2
	xnor	%o4,	%g6,	%i5
	ldsh	[%l7 + 0x58],	%i0
	std	%f26,	[%l7 + 0x58]
	orcc	%i3,	0x1904,	%i2
	edge32n	%g2,	%l0,	%o2
	addccc	%o0,	%i6,	%g3
	edge8	%o6,	%g5,	%l6
	fcmpes	%fcc1,	%f7,	%f28
	movre	%l1,	0x22F,	%l3
	subc	%g7,	0x06C4,	%o7
	add	%l4,	%o3,	%i4
	fmovdge	%xcc,	%f28,	%f0
	subccc	%i1,	%o5,	%l5
	sir	0x063C
	movrlz	%g4,	0x337,	%i7
	subccc	%o1,	%l2,	%g1
	mova	%xcc,	%g6,	%i5
	array8	%o4,	%i3,	%i0
	faligndata	%f12,	%f6,	%f24
	save %i2, 0x05FE, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%o2,	0x0B94,	%o0
	ld	[%l7 + 0x4C],	%f29
	fmul8x16au	%f4,	%f18,	%f20
	sub	%g2,	0x18E2,	%g3
	fnor	%f0,	%f22,	%f14
	udiv	%i6,	0x1967,	%g5
	fmuld8sux16	%f30,	%f4,	%f16
	xnor	%o6,	0x1826,	%l1
	ld	[%l7 + 0x6C],	%f27
	xnor	%l3,	%l6,	%g7
	edge8	%l4,	%o3,	%o7
	smul	%i4,	0x0C92,	%i1
	orn	%o5,	%l5,	%g4
	fnands	%f26,	%f3,	%f28
	sdivx	%o1,	0x1328,	%i7
	movrgez	%l2,	0x393,	%g6
	sdivcc	%i5,	0x08C9,	%o4
	fsrc1	%f14,	%f2
	lduw	[%l7 + 0x6C],	%g1
	ldd	[%l7 + 0x40],	%i0
	orncc	%i3,	0x01AE,	%i2
	fmovdcc	%icc,	%f26,	%f0
	lduh	[%l7 + 0x16],	%o2
	popc	%l0,	%o0
	subccc	%g2,	0x0A49,	%g3
	ldub	[%l7 + 0x6A],	%i6
	subcc	%g5,	0x0301,	%o6
	alignaddr	%l3,	%l6,	%g7
	fandnot2s	%f3,	%f10,	%f12
	edge16	%l4,	%l1,	%o7
	fmovsg	%xcc,	%f17,	%f26
	sir	0x1F21
	subccc	%o3,	0x151D,	%i1
	stx	%i4,	[%l7 + 0x30]
	srlx	%o5,	%l5,	%g4
	edge8l	%i7,	%o1,	%l2
	fmovrdgez	%i5,	%f20,	%f12
	ldx	[%l7 + 0x48],	%o4
	sra	%g1,	%g6,	%i0
	edge8l	%i2,	%o2,	%i3
	fmovda	%icc,	%f14,	%f31
	movleu	%icc,	%l0,	%g2
	fmovsvc	%xcc,	%f26,	%f12
	fmovd	%f8,	%f2
	fmovdne	%xcc,	%f27,	%f16
	mulscc	%g3,	0x1499,	%o0
	nop
	set	0x60, %i5
	ldsw	[%l7 + %i5],	%i6
	fornot2s	%f14,	%f8,	%f28
	addc	%g5,	0x11EE,	%l3
	movleu	%icc,	%o6,	%l6
	movneg	%xcc,	%g7,	%l4
	edge16l	%l1,	%o3,	%i1
	add	%o7,	%o5,	%l5
	fmovdvs	%xcc,	%f10,	%f14
	movle	%xcc,	%g4,	%i7
	fpsub16	%f4,	%f10,	%f30
	umul	%i4,	%l2,	%i5
	edge8	%o1,	%g1,	%o4
	ldsw	[%l7 + 0x38],	%i0
	alignaddr	%i2,	%o2,	%g6
	movleu	%icc,	%i3,	%l0
	stx	%g3,	[%l7 + 0x18]
	edge8	%g2,	%i6,	%g5
	addccc	%o0,	0x16CF,	%l3
	fmovsgu	%icc,	%f31,	%f17
	alignaddr	%l6,	%g7,	%l4
	fpadd16	%f16,	%f8,	%f4
	stw	%l1,	[%l7 + 0x2C]
	fmovrsgz	%o6,	%f24,	%f16
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	st	%f4,	[%l7 + 0x68]
	edge16ln	%l5,	%o3,	%g4
	stw	%i7,	[%l7 + 0x28]
	andn	%l2,	%i4,	%o1
	movle	%xcc,	%i5,	%g1
	sll	%o4,	0x1D,	%i2
	or	%i0,	%o2,	%g6
	fmovsn	%icc,	%f3,	%f24
	or	%l0,	%g3,	%i3
	fcmpgt32	%f8,	%f28,	%g2
	nop
	set	0x24, %i2
	lduw	[%l7 + %i2],	%i6
	movpos	%icc,	%g5,	%l3
	edge16	%o0,	%l6,	%l4
	orncc	%l1,	0x0A6D,	%o6
	fmovdvs	%icc,	%f14,	%f23
	fornot1	%f22,	%f12,	%f22
	addc	%i1,	0x1655,	%o7
	move	%xcc,	%o5,	%l5
	fmovdcs	%xcc,	%f2,	%f13
	movleu	%icc,	%o3,	%g7
	xorcc	%g4,	%i7,	%l2
	mulscc	%o1,	0x0D03,	%i5
	fnot1s	%f10,	%f30
	edge8n	%g1,	%i4,	%o4
	edge8	%i0,	%i2,	%g6
	sll	%l0,	0x1E,	%g3
	umul	%i3,	0x124C,	%o2
	fsrc2s	%f5,	%f23
	sethi	0x009F,	%g2
	umulcc	%g5,	%i6,	%o0
	st	%f18,	[%l7 + 0x2C]
	movg	%icc,	%l6,	%l3
	nop
	set	0x38, %l2
	lduw	[%l7 + %l2],	%l1
	nop
	set	0x13, %g1
	ldub	[%l7 + %g1],	%o6
	addc	%l4,	0x1798,	%i1
	sdiv	%o7,	0x18D7,	%l5
	andncc	%o3,	%g7,	%g4
	movrgz	%i7,	0x2A8,	%l2
	addccc	%o5,	0x17D9,	%i5
	save %o1, %g1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o4,	0x140A,	%i2
	andn	%g6,	0x0C28,	%i0
	restore %l0, %g3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%o2,	%g2,	%g5
	mulscc	%o0,	%i6,	%l6
	sll	%l3,	0x09,	%o6
	mova	%icc,	%l1,	%i1
	ldub	[%l7 + 0x12],	%o7
	fmovs	%f12,	%f23
	fcmpgt16	%f28,	%f12,	%l5
	edge16n	%o3,	%l4,	%g4
	orcc	%g7,	0x162E,	%i7
	and	%l2,	%o5,	%i5
	orncc	%g1,	%i4,	%o1
	sth	%o4,	[%l7 + 0x26]
	st	%f31,	[%l7 + 0x2C]
	array16	%i2,	%g6,	%l0
	faligndata	%f12,	%f16,	%f28
	xnorcc	%g3,	%i0,	%o2
	sra	%g2,	%g5,	%o0
	nop
	set	0x30, %g2
	lduh	[%l7 + %g2],	%i3
	fmovrse	%i6,	%f26,	%f2
	alignaddrl	%l3,	%o6,	%l6
	srlx	%i1,	%l1,	%o7
	ldd	[%l7 + 0x38],	%o2
	movcc	%icc,	%l4,	%l5
	fpadd16s	%f7,	%f6,	%f26
	stb	%g7,	[%l7 + 0x28]
	edge16n	%g4,	%i7,	%o5
	fcmple32	%f6,	%f24,	%i5
	edge16	%g1,	%l2,	%o1
	umulcc	%o4,	0x1FFF,	%i2
	sub	%g6,	%i4,	%g3
	umulcc	%i0,	%o2,	%g2
	nop
	set	0x6B, %g5
	ldub	[%l7 + %g5],	%g5
	array16	%l0,	%o0,	%i6
	fmovrse	%i3,	%f9,	%f8
	edge8n	%o6,	%l3,	%l6
	edge32	%l1,	%o7,	%o3
	movrgz	%i1,	%l5,	%g7
	movleu	%xcc,	%l4,	%g4
	fpsub32	%f2,	%f16,	%f8
	smul	%o5,	0x1278,	%i7
	ldx	[%l7 + 0x70],	%i5
	array32	%g1,	%l2,	%o1
	srlx	%i2,	%g6,	%i4
	fmovrde	%o4,	%f16,	%f14
	fornot1s	%f24,	%f17,	%f4
	orncc	%g3,	%i0,	%o2
	movn	%icc,	%g5,	%l0
	fmovdg	%icc,	%f9,	%f2
	mulscc	%g2,	0x1A71,	%i6
	array16	%o0,	%i3,	%o6
	addcc	%l3,	0x0C1E,	%l1
	lduw	[%l7 + 0x24],	%o7
	ldub	[%l7 + 0x68],	%l6
	fcmpeq16	%f20,	%f20,	%i1
	mova	%xcc,	%l5,	%g7
	sll	%o3,	0x1C,	%g4
	edge16ln	%o5,	%i7,	%i5
	move	%xcc,	%l4,	%g1
	xnor	%l2,	0x11C3,	%i2
	movcs	%xcc,	%o1,	%g6
	movrlez	%i4,	0x063,	%o4
	sll	%i0,	%o2,	%g5
	srlx	%l0,	%g3,	%i6
	st	%f18,	[%l7 + 0x1C]
	movl	%xcc,	%g2,	%o0
	fcmpne16	%f6,	%f4,	%o6
	fxnors	%f31,	%f5,	%f12
	addccc	%i3,	0x19CF,	%l3
	sllx	%o7,	0x05,	%l1
	srlx	%l6,	%i1,	%g7
	addc	%o3,	%l5,	%g4
	fmovrde	%o5,	%f22,	%f6
	ldsb	[%l7 + 0x29],	%i7
	fmovsvc	%icc,	%f24,	%f30
	save %l4, 0x16BD, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l2,	%i2,	%i5
	movgu	%xcc,	%g6,	%i4
	addcc	%o1,	0x1F11,	%o4
	fmovdcs	%xcc,	%f10,	%f21
	fabss	%f4,	%f13
	ldx	[%l7 + 0x58],	%i0
	addccc	%o2,	%l0,	%g5
	movneg	%icc,	%g3,	%g2
	edge16l	%i6,	%o6,	%o0
	fmovdne	%xcc,	%f0,	%f24
	nop
	set	0x08, %o5
	ldx	[%l7 + %o5],	%l3
	movle	%icc,	%o7,	%i3
	sll	%l6,	0x19,	%i1
	fornot2	%f12,	%f0,	%f14
	fmovdle	%xcc,	%f6,	%f23
	fand	%f12,	%f16,	%f24
	xorcc	%g7,	%o3,	%l5
	move	%xcc,	%g4,	%l1
	st	%f17,	[%l7 + 0x20]
	sir	0x1652
	fzeros	%f11
	sethi	0x002B,	%i7
	movpos	%xcc,	%o5,	%l4
	movrgz	%g1,	0x226,	%l2
	fnot2s	%f26,	%f15
	subc	%i5,	0x116B,	%i2
	edge8n	%i4,	%g6,	%o1
	movleu	%xcc,	%i0,	%o2
	movrlez	%l0,	%g5,	%g3
	and	%g2,	0x1CF3,	%o4
	movle	%icc,	%i6,	%o0
	std	%f14,	[%l7 + 0x40]
	ldsh	[%l7 + 0x24],	%o6
	fexpand	%f4,	%f12
	addcc	%l3,	%o7,	%i3
	fmovse	%icc,	%f27,	%f2
	subc	%i1,	0x195D,	%l6
	st	%f29,	[%l7 + 0x10]
	sethi	0x0B5F,	%g7
	xorcc	%l5,	0x1CF5,	%g4
	fand	%f14,	%f14,	%f18
	ldx	[%l7 + 0x10],	%o3
	movgu	%xcc,	%l1,	%o5
	movrgez	%l4,	0x33B,	%g1
	addcc	%l2,	%i5,	%i7
	ld	[%l7 + 0x28],	%f29
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	array32	%i4,	%i0,	%o1
	fnot1	%f8,	%f8
	move	%xcc,	%o2,	%l0
	movle	%icc,	%g3,	%g2
	add	%g5,	0x02BC,	%o4
	ldsb	[%l7 + 0x72],	%i6
	fmovdvc	%icc,	%f24,	%f8
	movgu	%xcc,	%o0,	%o6
	smulcc	%l3,	%i3,	%o7
	popc	0x1D68,	%l6
	alignaddr	%g7,	%i1,	%g4
	addcc	%o3,	%l1,	%o5
	fmovsn	%xcc,	%f23,	%f13
	movpos	%icc,	%l5,	%g1
	movl	%xcc,	%l2,	%l4
	sdivcc	%i5,	0x1FA8,	%i2
	fpackfix	%f8,	%f15
	fmul8x16au	%f16,	%f29,	%f10
	sllx	%i7,	0x17,	%g6
	sub	%i0,	0x0C7E,	%i4
	xor	%o2,	%l0,	%g3
	fnand	%f12,	%f28,	%f8
	fmovdneg	%xcc,	%f30,	%f27
	array16	%o1,	%g5,	%o4
	std	%f28,	[%l7 + 0x38]
	ldsb	[%l7 + 0x26],	%i6
	edge32	%g2,	%o6,	%l3
	movcc	%xcc,	%i3,	%o7
	fmovscc	%icc,	%f27,	%f10
	fnor	%f28,	%f4,	%f10
	move	%icc,	%l6,	%o0
	addcc	%i1,	%g4,	%o3
	xorcc	%g7,	0x163D,	%o5
	fmovs	%f9,	%f11
	smulcc	%l5,	0x06A0,	%l1
	std	%f28,	[%l7 + 0x78]
	edge16n	%l2,	%l4,	%i5
	fnot2s	%f26,	%f1
	addc	%g1,	0x0EBB,	%i7
	subccc	%i2,	0x10A0,	%g6
	udivcc	%i0,	0x0232,	%i4
	std	%f6,	[%l7 + 0x70]
	fnors	%f9,	%f13,	%f16
	fmul8x16au	%f0,	%f7,	%f20
	andn	%l0,	%g3,	%o2
	movcs	%icc,	%g5,	%o1
	xnor	%i6,	0x058B,	%g2
	andncc	%o4,	%o6,	%i3
	andcc	%l3,	%o7,	%o0
	xorcc	%l6,	0x0A2F,	%g4
	andn	%i1,	%g7,	%o5
	fpadd16	%f22,	%f30,	%f0
	fcmpeq32	%f12,	%f26,	%o3
	edge8ln	%l1,	%l2,	%l4
	fmovda	%xcc,	%f8,	%f15
	movne	%xcc,	%l5,	%i5
	movl	%xcc,	%g1,	%i2
	fmovrdgz	%g6,	%f12,	%f24
	edge16ln	%i7,	%i0,	%l0
	fmul8x16al	%f29,	%f29,	%f18
	subcc	%g3,	%i4,	%o2
	edge32	%g5,	%o1,	%i6
	lduh	[%l7 + 0x54],	%g2
	smulcc	%o6,	0x15E4,	%o4
	lduh	[%l7 + 0x26],	%l3
	popc	%i3,	%o0
	fmovsvs	%icc,	%f2,	%f21
	array16	%l6,	%o7,	%i1
	sdivcc	%g4,	0x0264,	%g7
	smul	%o5,	%l1,	%l2
	nop
	set	0x7C, %i7
	stb	%l4,	[%l7 + %i7]
	move	%icc,	%l5,	%i5
	sub	%g1,	0x189C,	%o3
	sethi	0x1E90,	%g6
	fnot1	%f0,	%f30
	movne	%icc,	%i2,	%i7
	std	%f6,	[%l7 + 0x08]
	ldsw	[%l7 + 0x20],	%l0
	sllx	%g3,	0x0E,	%i4
	array16	%o2,	%g5,	%i0
	edge32n	%o1,	%i6,	%g2
	xnorcc	%o4,	%o6,	%l3
	subcc	%o0,	%i3,	%l6
	stx	%i1,	[%l7 + 0x30]
	andncc	%g4,	%o7,	%o5
	fmovscc	%xcc,	%f10,	%f31
	subccc	%l1,	0x1C01,	%l2
	popc	0x1BA6,	%g7
	ldsb	[%l7 + 0x2B],	%l4
	array32	%i5,	%l5,	%o3
	fmovrsgz	%g1,	%f4,	%f17
	movpos	%icc,	%g6,	%i2
	fnegd	%f30,	%f30
	fnegs	%f22,	%f7
	lduw	[%l7 + 0x74],	%l0
	movneg	%xcc,	%i7,	%g3
	edge16ln	%o2,	%i4,	%g5
	movrlez	%o1,	%i6,	%g2
	ldub	[%l7 + 0x26],	%o4
	edge32ln	%i0,	%o6,	%l3
	mulscc	%o0,	%i3,	%l6
	sdivx	%g4,	0x0427,	%o7
	ldsb	[%l7 + 0x58],	%i1
	ldx	[%l7 + 0x70],	%l1
	fmovrdlz	%l2,	%f4,	%f0
	fmovdleu	%xcc,	%f28,	%f29
	umul	%o5,	%l4,	%i5
	sllx	%g7,	%l5,	%o3
	edge32n	%g1,	%i2,	%l0
	sll	%i7,	0x03,	%g6
	sub	%o2,	%i4,	%g5
	ldsh	[%l7 + 0x38],	%o1
	sub	%g3,	0x0D86,	%i6
	smulcc	%o4,	0x180D,	%g2
	ldx	[%l7 + 0x48],	%i0
	edge32n	%l3,	%o0,	%i3
	st	%f30,	[%l7 + 0x48]
	sll	%o6,	%g4,	%l6
	fpsub32s	%f18,	%f4,	%f11
	std	%f12,	[%l7 + 0x58]
	stx	%i1,	[%l7 + 0x78]
	orcc	%l1,	0x1DF5,	%o7
	stx	%l2,	[%l7 + 0x30]
	fmovscs	%icc,	%f22,	%f14
	stw	%o5,	[%l7 + 0x24]
	movpos	%xcc,	%l4,	%i5
	movre	%g7,	%o3,	%l5
	std	%f28,	[%l7 + 0x38]
	fnor	%f14,	%f14,	%f6
	movcs	%xcc,	%i2,	%l0
	movcc	%icc,	%i7,	%g6
	ldsb	[%l7 + 0x7D],	%g1
	fmul8x16au	%f24,	%f4,	%f22
	bshuffle	%f22,	%f22,	%f30
	sub	%o2,	%g5,	%o1
	fmul8x16au	%f17,	%f18,	%f20
	movleu	%xcc,	%g3,	%i6
	edge16ln	%o4,	%g2,	%i0
	movgu	%icc,	%i4,	%o0
	fsrc2s	%f25,	%f3
	st	%f21,	[%l7 + 0x1C]
	move	%xcc,	%i3,	%o6
	ldd	[%l7 + 0x18],	%f2
	movneg	%xcc,	%l3,	%g4
	movpos	%icc,	%i1,	%l6
	edge16l	%l1,	%o7,	%l2
	sdivx	%o5,	0x1B4A,	%l4
	fsrc1	%f18,	%f22
	alignaddrl	%g7,	%o3,	%l5
	array8	%i2,	%i5,	%i7
	edge8	%g6,	%l0,	%g1
	smulcc	%g5,	0x1F00,	%o2
	srax	%o1,	0x04,	%i6
	ldd	[%l7 + 0x70],	%o4
	movrgez	%g2,	0x27B,	%i0
	movrlz	%i4,	0x309,	%g3
	edge8ln	%i3,	%o0,	%l3
	addccc	%g4,	%i1,	%o6
	sllx	%l1,	%o7,	%l2
	movrlz	%o5,	%l6,	%l4
	fmovdneg	%icc,	%f25,	%f24
	ldx	[%l7 + 0x48],	%g7
	xor	%o3,	%i2,	%i5
	fcmpne16	%f10,	%f22,	%l5
	edge16n	%i7,	%l0,	%g6
	restore %g5, %g1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o1,	0x1928,	%i6
	fors	%f10,	%f29,	%f28
	fmovrdlz	%g2,	%f20,	%f12
	fmovdl	%icc,	%f5,	%f5
	fmovrdne	%i0,	%f24,	%f18
	fpackfix	%f8,	%f15
	movne	%icc,	%i4,	%o4
	fpsub16	%f18,	%f0,	%f28
	ldd	[%l7 + 0x50],	%g2
	fnand	%f0,	%f28,	%f12
	addcc	%i3,	%l3,	%g4
	fpadd16s	%f31,	%f13,	%f29
	edge8	%i1,	%o0,	%o6
	subcc	%l1,	%o7,	%l2
	movl	%xcc,	%o5,	%l6
	mulscc	%g7,	%o3,	%i2
	andn	%l4,	0x1587,	%i5
	ldx	[%l7 + 0x60],	%i7
	and	%l0,	%l5,	%g6
	fmovdle	%icc,	%f18,	%f22
	popc	0x08BC,	%g1
	fzero	%f12
	add	%o2,	%g5,	%i6
	or	%g2,	0x0E8E,	%o1
	andncc	%i0,	%i4,	%g3
	xorcc	%i3,	%l3,	%o4
	fnot2	%f6,	%f2
	andcc	%g4,	%i1,	%o0
	sra	%o6,	0x1C,	%l1
	pdist	%f26,	%f0,	%f2
	stx	%l2,	[%l7 + 0x18]
	addccc	%o7,	0x030A,	%o5
	mulscc	%g7,	%l6,	%i2
	fmovsne	%icc,	%f9,	%f14
	movrgez	%l4,	%i5,	%o3
	sth	%l0,	[%l7 + 0x30]
	sir	0x0E78
	xnor	%i7,	%g6,	%l5
	movneg	%icc,	%g1,	%o2
	ldd	[%l7 + 0x48],	%f8
	edge32l	%i6,	%g5,	%o1
	sdiv	%g2,	0x1808,	%i4
	movre	%g3,	%i0,	%i3
	subccc	%o4,	0x10D0,	%l3
	nop
	set	0x48, %o6
	ldub	[%l7 + %o6],	%g4
	movrne	%i1,	0x319,	%o6
	movcc	%icc,	%l1,	%o0
	and	%l2,	%o7,	%o5
	fcmpeq32	%f28,	%f4,	%g7
	subccc	%i2,	0x1A9E,	%l4
	lduh	[%l7 + 0x6A],	%i5
	edge8	%l6,	%o3,	%i7
	fandnot2	%f4,	%f12,	%f22
	edge32	%g6,	%l5,	%l0
	edge8n	%g1,	%i6,	%g5
	movle	%xcc,	%o2,	%o1
	fexpand	%f7,	%f22
	movcc	%xcc,	%g2,	%g3
	movvs	%icc,	%i0,	%i3
	smul	%i4,	%l3,	%g4
	fmuld8sux16	%f6,	%f29,	%f2
	edge16	%o4,	%i1,	%o6
	smulcc	%o0,	%l2,	%l1
	movcc	%xcc,	%o7,	%o5
	fmovd	%f4,	%f6
	smulcc	%g7,	%i2,	%i5
	movrne	%l6,	%o3,	%i7
	sth	%l4,	[%l7 + 0x4E]
	udivcc	%g6,	0x1863,	%l5
	udivcc	%g1,	0x1AEE,	%l0
	ldd	[%l7 + 0x18],	%i6
	ldsw	[%l7 + 0x3C],	%o2
	lduw	[%l7 + 0x7C],	%o1
	array32	%g5,	%g3,	%i0
	nop
	set	0x34, %g6
	lduw	[%l7 + %g6],	%g2
	stw	%i3,	[%l7 + 0x40]
	movl	%icc,	%l3,	%i4
	subccc	%o4,	%i1,	%o6
	movg	%icc,	%o0,	%l2
	std	%f30,	[%l7 + 0x58]
	move	%xcc,	%l1,	%o7
	ldub	[%l7 + 0x53],	%o5
	movl	%icc,	%g7,	%g4
	movge	%icc,	%i2,	%l6
	sdivx	%o3,	0x0462,	%i5
	fsrc2	%f30,	%f14
	nop
	set	0x4C, %o7
	ldsw	[%l7 + %o7],	%i7
	movle	%icc,	%l4,	%l5
	fmovsle	%xcc,	%f5,	%f5
	movrgz	%g6,	0x1FB,	%g1
	orn	%i6,	0x11E0,	%l0
	fmovdl	%xcc,	%f6,	%f17
	movrgz	%o1,	%o2,	%g3
	sth	%i0,	[%l7 + 0x74]
	movl	%icc,	%g5,	%g2
	edge8l	%l3,	%i4,	%i3
	edge16l	%o4,	%i1,	%o6
	orncc	%o0,	0x0C0E,	%l2
	array8	%l1,	%o5,	%g7
	udivcc	%g4,	0x1E18,	%o7
	ld	[%l7 + 0x1C],	%f17
	edge8l	%i2,	%l6,	%i5
	fxnors	%f21,	%f30,	%f1
	umul	%i7,	0x1B94,	%o3
	orn	%l5,	0x008A,	%l4
	std	%f30,	[%l7 + 0x28]
	edge16n	%g1,	%g6,	%i6
	fpadd16	%f22,	%f24,	%f22
	umul	%o1,	0x010C,	%o2
	addcc	%g3,	%i0,	%g5
	st	%f1,	[%l7 + 0x48]
	edge32n	%l0,	%g2,	%l3
	sir	0x0223
	movl	%icc,	%i4,	%i3
	fmul8x16au	%f1,	%f26,	%f18
	ldd	[%l7 + 0x68],	%f2
	mulscc	%o4,	0x0EC0,	%i1
	movneg	%xcc,	%o6,	%l2
	fmovscs	%xcc,	%f9,	%f12
	mulscc	%l1,	0x1E13,	%o0
	umul	%o5,	0x1497,	%g7
	orcc	%o7,	%i2,	%l6
	udivcc	%g4,	0x00EC,	%i7
	popc	0x0F55,	%o3
	fnot1s	%f10,	%f18
	srl	%i5,	0x17,	%l4
	udivx	%l5,	0x1616,	%g6
	or	%i6,	0x12D7,	%o1
	add	%o2,	0x0190,	%g1
	xorcc	%g3,	%g5,	%l0
	edge16n	%g2,	%i0,	%i4
	sdivcc	%l3,	0x17DF,	%o4
	sethi	0x0095,	%i1
	edge8n	%i3,	%l2,	%l1
	fmovrdne	%o0,	%f30,	%f2
	fcmple32	%f22,	%f20,	%o5
	ldsb	[%l7 + 0x11],	%g7
	ld	[%l7 + 0x30],	%f24
	st	%f20,	[%l7 + 0x40]
	edge8	%o6,	%o7,	%l6
	fnot1s	%f16,	%f29
	add	%i2,	%i7,	%g4
	fnot2s	%f4,	%f19
	xnorcc	%o3,	%l4,	%l5
	fsrc1	%f6,	%f4
	ldsh	[%l7 + 0x20],	%i5
	ldsb	[%l7 + 0x16],	%g6
	ldd	[%l7 + 0x30],	%f18
	fcmple16	%f28,	%f24,	%o1
	array16	%o2,	%i6,	%g1
	ldx	[%l7 + 0x40],	%g3
	edge8l	%l0,	%g2,	%i0
	mulscc	%g5,	%l3,	%o4
	fmovrde	%i4,	%f6,	%f8
	fmul8sux16	%f24,	%f18,	%f0
	array8	%i3,	%i1,	%l2
	mova	%xcc,	%l1,	%o5
	alignaddrl	%o0,	%g7,	%o7
	alignaddrl	%o6,	%i2,	%l6
	fornot1	%f20,	%f2,	%f30
	alignaddr	%g4,	%o3,	%i7
	movleu	%icc,	%l4,	%l5
	fabss	%f10,	%f15
	edge16ln	%g6,	%o1,	%i5
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	fpsub32	%f20,	%f14,	%f20
	edge16	%g3,	%g2,	%i0
	andcc	%g5,	0x1289,	%l0
	edge32ln	%l3,	%i4,	%o4
	sra	%i3,	0x0E,	%l2
	umulcc	%i1,	%l1,	%o0
	movrlez	%o5,	%g7,	%o6
	subc	%i2,	%o7,	%l6
	ldd	[%l7 + 0x38],	%o2
	srax	%g4,	%l4,	%i7
	ldd	[%l7 + 0x78],	%l4
	andn	%g6,	0x13B3,	%i5
	movpos	%xcc,	%i6,	%o1
	addcc	%g1,	%g3,	%o2
	smulcc	%i0,	%g2,	%l0
	mova	%xcc,	%g5,	%l3
	fnors	%f23,	%f10,	%f28
	movl	%xcc,	%i4,	%o4
	edge16	%i3,	%l2,	%i1
	edge32n	%o0,	%l1,	%o5
	fnot1s	%f12,	%f20
	mulscc	%o6,	0x0004,	%i2
	fornot1	%f4,	%f12,	%f8
	movrgz	%g7,	0x1BA,	%l6
	addc	%o7,	0x1E97,	%g4
	add	%l4,	%i7,	%l5
	fpsub32s	%f17,	%f12,	%f3
	fornot1	%f22,	%f4,	%f18
	sllx	%g6,	0x14,	%o3
	movrlez	%i5,	%o1,	%i6
	edge32	%g1,	%o2,	%i0
	mulx	%g2,	%g3,	%g5
	movrgz	%l3,	%l0,	%o4
	movgu	%xcc,	%i3,	%i4
	fnot1	%f26,	%f2
	umul	%i1,	%o0,	%l1
	subcc	%o5,	%l2,	%o6
	udivcc	%g7,	0x100B,	%i2
	xnor	%l6,	%g4,	%o7
	sdivcc	%i7,	0x05CF,	%l5
	srl	%l4,	0x04,	%g6
	nop
	set	0x28, %o0
	stx	%i5,	[%l7 + %o0]
	edge16n	%o1,	%o3,	%i6
	edge32	%g1,	%o2,	%i0
	movvc	%xcc,	%g2,	%g5
	movcs	%xcc,	%l3,	%l0
	addccc	%o4,	%g3,	%i3
	smulcc	%i4,	0x1313,	%o0
	sdivcc	%i1,	0x0228,	%o5
	fpsub16	%f10,	%f16,	%f2
	movgu	%xcc,	%l2,	%o6
	save %l1, %i2, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%g7,	0x1FDC,	%o7
	fmovrsgz	%g4,	%f25,	%f30
	sdivcc	%i7,	0x1224,	%l4
	alignaddrl	%l5,	%g6,	%o1
	andncc	%i5,	%o3,	%g1
	fmovda	%xcc,	%f18,	%f23
	movcc	%xcc,	%o2,	%i0
	restore %i6, %g5, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%l0,	0x0C70,	%l3
	movpos	%xcc,	%o4,	%i3
	edge32ln	%i4,	%g3,	%o0
	umul	%i1,	%o5,	%l2
	andncc	%o6,	%l1,	%l6
	srax	%g7,	%i2,	%o7
	fmovrde	%i7,	%f28,	%f12
	ldx	[%l7 + 0x60],	%l4
	alignaddr	%l5,	%g6,	%g4
	smul	%o1,	%i5,	%o3
	addccc	%g1,	0x1EBD,	%i0
	edge32ln	%i6,	%g5,	%g2
	sdiv	%l0,	0x09E2,	%l3
	sra	%o2,	0x0C,	%i3
	movrgez	%i4,	0x12F,	%g3
	addccc	%o4,	0x0AF6,	%i1
	mova	%xcc,	%o0,	%o5
	fpmerge	%f4,	%f22,	%f8
	orn	%l2,	0x016F,	%o6
	sll	%l6,	%l1,	%g7
	edge16ln	%i2,	%o7,	%l4
	sra	%i7,	%l5,	%g4
	alignaddrl	%o1,	%i5,	%g6
	subcc	%g1,	0x1E6B,	%o3
	addccc	%i6,	%i0,	%g2
	xor	%g5,	%l0,	%l3
	andcc	%i3,	%o2,	%g3
	orncc	%o4,	%i1,	%i4
	sdivx	%o5,	0x17A1,	%l2
	smulcc	%o0,	0x06E7,	%o6
	ldd	[%l7 + 0x38],	%f20
	movcs	%xcc,	%l6,	%l1
	fpackfix	%f24,	%f14
	fmovsa	%icc,	%f2,	%f3
	sdivx	%g7,	0x15FF,	%o7
	sub	%i2,	0x1C22,	%l4
	movleu	%xcc,	%i7,	%l5
	or	%g4,	%i5,	%o1
	stb	%g1,	[%l7 + 0x18]
	orn	%g6,	0x1E17,	%o3
	edge32ln	%i0,	%i6,	%g2
	smulcc	%l0,	0x0544,	%l3
	orn	%g5,	%o2,	%g3
	umulcc	%i3,	0x0A3B,	%i1
	edge16l	%i4,	%o5,	%o4
	andn	%l2,	0x1C74,	%o6
	movvs	%xcc,	%o0,	%l1
	add	%g7,	0x1498,	%l6
	srl	%o7,	%i2,	%l4
	fmovde	%xcc,	%f18,	%f9
	movrne	%l5,	0x211,	%g4
	xnor	%i7,	%i5,	%g1
	smulcc	%g6,	0x01C3,	%o3
	and	%o1,	0x0A8C,	%i6
	sdivcc	%i0,	0x0FBC,	%g2
	move	%icc,	%l0,	%l3
	fpadd32s	%f25,	%f25,	%f17
	std	%f22,	[%l7 + 0x38]
	array16	%g5,	%g3,	%i3
	movrlez	%i1,	%o2,	%o5
	nop
	set	0x40, %i1
	lduw	[%l7 + %i1],	%i4
	std	%f12,	[%l7 + 0x68]
	movrlez	%l2,	%o4,	%o0
	ldub	[%l7 + 0x42],	%l1
	movrlz	%o6,	%l6,	%g7
	mulscc	%i2,	%l4,	%o7
	fandnot1s	%f7,	%f24,	%f10
	movrgez	%g4,	%l5,	%i5
	addccc	%g1,	%g6,	%o3
	movge	%icc,	%i7,	%o1
	ldd	[%l7 + 0x48],	%f2
	srlx	%i6,	0x00,	%g2
	nop
	set	0x08, %l0
	sth	%l0,	[%l7 + %l0]
	fmuld8ulx16	%f21,	%f23,	%f2
	xorcc	%l3,	%g5,	%i0
	fmovsge	%icc,	%f24,	%f23
	alignaddrl	%g3,	%i3,	%o2
	addccc	%i1,	%o5,	%i4
	popc	%l2,	%o4
	stx	%o0,	[%l7 + 0x10]
	ldsh	[%l7 + 0x4C],	%o6
	andcc	%l1,	0x1123,	%l6
	ldsb	[%l7 + 0x42],	%g7
	movvs	%xcc,	%i2,	%l4
	sllx	%g4,	0x03,	%o7
	umul	%l5,	0x1E43,	%g1
	lduh	[%l7 + 0x3A],	%g6
	subccc	%i5,	0x0B48,	%o3
	orcc	%o1,	%i6,	%g2
	ldd	[%l7 + 0x38],	%l0
	sra	%i7,	%l3,	%g5
	sth	%g3,	[%l7 + 0x3A]
	edge8	%i0,	%o2,	%i3
	movvc	%xcc,	%i1,	%i4
	fmovdn	%icc,	%f11,	%f2
	movvs	%icc,	%l2,	%o5
	smulcc	%o0,	0x0073,	%o4
	fandnot1s	%f24,	%f27,	%f9
	mova	%xcc,	%o6,	%l1
	movrgez	%l6,	%g7,	%i2
	movrlez	%g4,	0x38C,	%o7
	movl	%xcc,	%l4,	%g1
	ldsw	[%l7 + 0x40],	%g6
	umul	%i5,	%o3,	%l5
	fmovscs	%xcc,	%f31,	%f0
	save %o1, 0x114C, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i6,	[%l7 + 0x10]
	std	%f30,	[%l7 + 0x68]
	srax	%i7,	0x1E,	%l0
	fandnot2	%f24,	%f4,	%f28
	fmovrslez	%l3,	%f2,	%f10
	nop
	set	0x2F, %o3
	stb	%g3,	[%l7 + %o3]
	smulcc	%i0,	0x1C26,	%o2
	addc	%g5,	0x17E6,	%i1
	movgu	%xcc,	%i3,	%l2
	edge8	%o5,	%i4,	%o4
	ldx	[%l7 + 0x78],	%o6
	save %o0, %l1, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgez	%l6,	0x39E,	%i2
	fmovsvs	%xcc,	%f14,	%f25
	movrlz	%g4,	%o7,	%l4
	edge8n	%g6,	%g1,	%o3
	fors	%f7,	%f12,	%f9
	movvs	%xcc,	%l5,	%i5
	edge8ln	%o1,	%g2,	%i6
	movge	%xcc,	%l0,	%i7
	fornot1s	%f5,	%f19,	%f5
	alignaddrl	%l3,	%i0,	%o2
	edge32n	%g3,	%g5,	%i3
	edge8l	%i1,	%l2,	%i4
	popc	0x1E0E,	%o5
	orn	%o6,	%o4,	%o0
	movpos	%xcc,	%l1,	%g7
	fcmpes	%fcc3,	%f29,	%f13
	movcc	%xcc,	%l6,	%i2
	fornot1	%f8,	%f2,	%f28
	st	%f4,	[%l7 + 0x0C]
	sdivcc	%o7,	0x0448,	%l4
	movgu	%icc,	%g4,	%g1
	edge32l	%g6,	%l5,	%i5
	edge8ln	%o3,	%g2,	%o1
	sdiv	%i6,	0x0F6A,	%l0
	fpadd16s	%f19,	%f29,	%f13
	movcs	%icc,	%i7,	%i0
	fpadd16	%f30,	%f22,	%f14
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	udivx	%o2,	0x17B9,	%g5
	edge32ln	%i1,	%i3,	%i4
	udivx	%l2,	0x02AD,	%o5
	edge8n	%o4,	%o0,	%o6
	edge32ln	%l1,	%l6,	%g7
	fpadd32s	%f6,	%f10,	%f21
	fpadd16	%f26,	%f0,	%f22
	edge32l	%i2,	%l4,	%o7
	fmovdne	%xcc,	%f1,	%f30
	sub	%g1,	0x0D9E,	%g4
	stb	%g6,	[%l7 + 0x36]
	sub	%i5,	0x00A3,	%o3
	fmovrslz	%g2,	%f29,	%f20
	movpos	%xcc,	%o1,	%i6
	orncc	%l5,	%i7,	%l0
	add	%i0,	0x1DF8,	%l3
	fmovsneg	%icc,	%f30,	%f24
	stw	%g3,	[%l7 + 0x50]
	srax	%g5,	0x0D,	%o2
	fmovsleu	%xcc,	%f31,	%f4
	edge32	%i1,	%i4,	%i3
	udivcc	%l2,	0x11B1,	%o5
	movrgz	%o4,	%o0,	%o6
	stb	%l6,	[%l7 + 0x45]
	edge32n	%l1,	%i2,	%l4
	faligndata	%f18,	%f2,	%f16
	array8	%g7,	%o7,	%g1
	ldx	[%l7 + 0x20],	%g4
	movre	%i5,	%o3,	%g2
	movrlz	%g6,	0x127,	%o1
	fmovdgu	%xcc,	%f13,	%f20
	movrne	%l5,	%i6,	%l0
	mulscc	%i0,	%l3,	%i7
	fone	%f30
	movleu	%xcc,	%g5,	%g3
	srl	%i1,	0x17,	%i4
	nop
	set	0x54, %o4
	lduh	[%l7 + %o4],	%i3
	edge8n	%o2,	%l2,	%o5
	subccc	%o0,	0x1662,	%o4
	umulcc	%l6,	%o6,	%l1
	fmovrdne	%i2,	%f8,	%f24
	movleu	%xcc,	%l4,	%g7
	fmovdl	%xcc,	%f3,	%f3
	array16	%g1,	%o7,	%i5
	movl	%icc,	%g4,	%o3
	edge16	%g6,	%g2,	%l5
	std	%f30,	[%l7 + 0x40]
	addccc	%o1,	%l0,	%i6
	movn	%xcc,	%i0,	%i7
	umul	%g5,	%g3,	%i1
	udivcc	%l3,	0x07ED,	%i3
	sllx	%o2,	%i4,	%l2
	restore %o5, %o4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o0,	%o6,	%l1
	orn	%i2,	%l4,	%g7
	movvs	%icc,	%o7,	%i5
	fmovdle	%xcc,	%f13,	%f26
	movl	%icc,	%g4,	%o3
	smul	%g1,	0x18C0,	%g6
	ldd	[%l7 + 0x28],	%f10
	movrne	%g2,	%l5,	%l0
	andcc	%i6,	0x1EF0,	%o1
	movrlez	%i7,	%g5,	%g3
	fmovdne	%xcc,	%f14,	%f16
	ldub	[%l7 + 0x44],	%i0
	orn	%l3,	%i3,	%i1
	stx	%o2,	[%l7 + 0x78]
	andcc	%l2,	0x0CF1,	%o5
	or	%o4,	0x186F,	%i4
	stw	%o0,	[%l7 + 0x6C]
	edge8	%l6,	%l1,	%o6
	umul	%i2,	%g7,	%l4
	add	%i5,	%g4,	%o7
	save %o3, 0x17DB, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g2,	[%l7 + 0x7D]
	udivcc	%g1,	0x02BD,	%l5
	ldsw	[%l7 + 0x6C],	%i6
	fmovdvs	%xcc,	%f0,	%f24
	array32	%o1,	%i7,	%g5
	fmuld8ulx16	%f16,	%f2,	%f18
	movrlz	%g3,	%l0,	%i0
	movleu	%icc,	%l3,	%i1
	movcc	%icc,	%o2,	%i3
	or	%o5,	%l2,	%o4
	srl	%o0,	%i4,	%l6
	movvc	%icc,	%l1,	%o6
	sth	%g7,	[%l7 + 0x4E]
	ldsw	[%l7 + 0x14],	%l4
	edge8l	%i2,	%i5,	%o7
	add	%o3,	0x176D,	%g4
	movvs	%xcc,	%g6,	%g1
	array16	%g2,	%l5,	%i6
	edge16	%o1,	%i7,	%g3
	sub	%l0,	%i0,	%g5
	popc	0x0400,	%l3
	movrlez	%o2,	0x1EB,	%i1
	fnot1	%f2,	%f22
	movl	%icc,	%o5,	%l2
	fcmpne32	%f10,	%f22,	%o4
	stx	%o0,	[%l7 + 0x58]
	fmovd	%f8,	%f2
	orcc	%i3,	%l6,	%i4
	fmovsge	%xcc,	%f27,	%f4
	addcc	%l1,	%g7,	%o6
	xnor	%i2,	%l4,	%i5
	srax	%o3,	0x1C,	%o7
	ldd	[%l7 + 0x28],	%f22
	sll	%g6,	%g1,	%g4
	ldsb	[%l7 + 0x3C],	%g2
	mulx	%l5,	0x13DD,	%i6
	udivx	%o1,	0x1161,	%g3
	fandnot2	%f30,	%f28,	%f30
	edge8ln	%i7,	%i0,	%l0
	ldsb	[%l7 + 0x24],	%g5
	addc	%l3,	%i1,	%o2
	fnands	%f22,	%f29,	%f1
	fmovrslz	%l2,	%f18,	%f10
	movrgz	%o4,	0x1D2,	%o0
	umulcc	%i3,	0x0B5A,	%l6
	udivcc	%o5,	0x14F9,	%i4
	ldx	[%l7 + 0x20],	%l1
	orcc	%g7,	0x0040,	%o6
	edge16ln	%l4,	%i5,	%i2
	stb	%o7,	[%l7 + 0x1F]
	edge8l	%o3,	%g6,	%g1
	alignaddrl	%g4,	%g2,	%i6
	ldsb	[%l7 + 0x56],	%o1
	movg	%xcc,	%g3,	%l5
	fmovsvs	%icc,	%f3,	%f22
	array16	%i7,	%l0,	%g5
	orncc	%i0,	%l3,	%o2
	lduh	[%l7 + 0x4E],	%l2
	array8	%i1,	%o0,	%o4
	smul	%i3,	%o5,	%l6
	andncc	%i4,	%g7,	%l1
	or	%o6,	%l4,	%i2
	xnorcc	%i5,	0x01CD,	%o3
	sethi	0x17E8,	%g6
	fmovd	%f0,	%f10
	ldub	[%l7 + 0x28],	%g1
	movcs	%xcc,	%o7,	%g4
	orn	%g2,	%o1,	%g3
	xor	%l5,	0x148A,	%i7
	fabsd	%f10,	%f0
	fpsub16	%f2,	%f10,	%f2
	ldub	[%l7 + 0x6A],	%l0
	fcmpes	%fcc1,	%f24,	%f5
	udivx	%i6,	0x12A3,	%i0
	subcc	%g5,	0x0EAC,	%o2
	movpos	%icc,	%l2,	%l3
	movcs	%icc,	%i1,	%o4
	sethi	0x007B,	%i3
	alignaddrl	%o5,	%l6,	%i4
	nop
	set	0x28, %o2
	ldd	[%l7 + %o2],	%f28
	movrlz	%g7,	%o0,	%l1
	addcc	%l4,	0x18FA,	%i2
	fpmerge	%f12,	%f13,	%f2
	sir	0x1185
	sdivcc	%o6,	0x18B9,	%i5
	movrlz	%o3,	0x188,	%g6
	fcmple16	%f30,	%f18,	%g1
	edge16n	%o7,	%g2,	%g4
	movcs	%icc,	%g3,	%l5
	alignaddrl	%o1,	%i7,	%i6
	sethi	0x1791,	%i0
	fmovrse	%l0,	%f25,	%f23
	movle	%icc,	%o2,	%g5
	ldsw	[%l7 + 0x18],	%l3
	fpadd32	%f20,	%f20,	%f0
	sethi	0x0F0C,	%l2
	fmovsne	%xcc,	%f16,	%f0
	sub	%i1,	%o4,	%i3
	umul	%l6,	%i4,	%g7
	alignaddr	%o5,	%l1,	%l4
	movrgz	%i2,	0x219,	%o6
	edge16n	%i5,	%o3,	%g6
	xnorcc	%o0,	0x0164,	%g1
	udiv	%g2,	0x1ACA,	%g4
	orcc	%g3,	0x0716,	%o7
	fcmple16	%f2,	%f10,	%o1
	fmovdcc	%icc,	%f4,	%f31
	fmul8x16au	%f8,	%f4,	%f8
	st	%f29,	[%l7 + 0x5C]
	movcc	%icc,	%i7,	%i6
	fmovscs	%xcc,	%f12,	%f3
	movg	%icc,	%i0,	%l5
	popc	%o2,	%l0
	ldub	[%l7 + 0x0C],	%l3
	fcmpeq16	%f28,	%f8,	%g5
	orcc	%l2,	0x1B83,	%i1
	edge16l	%i3,	%o4,	%l6
	fmovd	%f24,	%f16
	fmovrdne	%g7,	%f24,	%f16
	movrlez	%o5,	%l1,	%i4
	addc	%l4,	0x0DC3,	%o6
	ldx	[%l7 + 0x40],	%i2
	umul	%i5,	0x14CC,	%g6
	movl	%icc,	%o0,	%g1
	fpadd32	%f10,	%f20,	%f28
	nop
	set	0x10, %i0
	std	%f8,	[%l7 + %i0]
	umul	%g2,	%g4,	%o3
	movn	%xcc,	%o7,	%o1
	ld	[%l7 + 0x40],	%f12
	edge8ln	%g3,	%i6,	%i7
	sra	%i0,	0x04,	%l5
	add	%l0,	%l3,	%o2
	fpack32	%f14,	%f28,	%f4
	movn	%xcc,	%l2,	%i1
	andncc	%g5,	%o4,	%l6
	udiv	%g7,	0x123C,	%i3
	array16	%o5,	%l1,	%i4
	fmovdgu	%xcc,	%f15,	%f20
	xnor	%l4,	%o6,	%i2
	stb	%i5,	[%l7 + 0x6B]
	alignaddr	%g6,	%o0,	%g2
	orcc	%g1,	%o3,	%o7
	sub	%g4,	0x02FC,	%o1
	sdivcc	%i6,	0x0459,	%i7
	srlx	%i0,	%g3,	%l0
	ldsw	[%l7 + 0x64],	%l3
	ld	[%l7 + 0x68],	%f21
	movcs	%xcc,	%o2,	%l5
	ld	[%l7 + 0x24],	%f28
	sethi	0x11AA,	%l2
	sdivcc	%g5,	0x17CB,	%o4
	movcs	%icc,	%l6,	%i1
	movcs	%icc,	%g7,	%i3
	edge16n	%l1,	%i4,	%o5
	edge8n	%o6,	%l4,	%i5
	sllx	%i2,	%o0,	%g2
	orn	%g6,	0x0324,	%o3
	movge	%icc,	%g1,	%o7
	addcc	%o1,	%g4,	%i7
	xor	%i0,	%g3,	%i6
	alignaddrl	%l3,	%l0,	%l5
	movcs	%xcc,	%o2,	%l2
	umul	%g5,	0x0A33,	%o4
	sll	%l6,	%g7,	%i1
	smulcc	%i3,	%l1,	%o5
	and	%i4,	%o6,	%l4
	sth	%i2,	[%l7 + 0x1E]
	fmovspos	%xcc,	%f3,	%f10
	stb	%o0,	[%l7 + 0x2D]
	edge8n	%g2,	%i5,	%o3
	stw	%g1,	[%l7 + 0x70]
	mova	%icc,	%o7,	%o1
	movgu	%xcc,	%g4,	%i7
	mulx	%i0,	%g6,	%i6
	movgu	%icc,	%g3,	%l3
	mulx	%l5,	%l0,	%o2
	subccc	%g5,	0x12AF,	%o4
	ldub	[%l7 + 0x74],	%l6
	fcmped	%fcc3,	%f8,	%f20
	edge8ln	%l2,	%g7,	%i1
	fors	%f10,	%f23,	%f7
	ldx	[%l7 + 0x18],	%l1
	movrgez	%o5,	0x1DD,	%i4
	mulx	%i3,	0x0191,	%l4
	add	%o6,	%i2,	%o0
	array16	%i5,	%o3,	%g1
	fpsub32	%f8,	%f18,	%f18
	fand	%f28,	%f28,	%f24
	fpack16	%f28,	%f25
	fmovse	%xcc,	%f5,	%f2
	move	%icc,	%g2,	%o1
	andn	%o7,	0x17A4,	%g4
	fmovsg	%icc,	%f13,	%f9
	ldsh	[%l7 + 0x3C],	%i0
	fpack32	%f4,	%f2,	%f22
	stw	%i7,	[%l7 + 0x30]
	srax	%g6,	%i6,	%g3
	xnorcc	%l5,	0x1A59,	%l3
	sra	%l0,	0x1F,	%g5
	movleu	%icc,	%o4,	%l6
	sllx	%l2,	0x1B,	%g7
	umul	%i1,	%o2,	%l1
	smulcc	%i4,	%o5,	%l4
	nop
	set	0x38, %l6
	ldsw	[%l7 + %l6],	%i3
	fmovsl	%xcc,	%f29,	%f3
	sethi	0x0D66,	%i2
	fmovrdlz	%o6,	%f4,	%f28
	udivx	%i5,	0x0ED0,	%o3
	xorcc	%o0,	0x0B52,	%g2
	bshuffle	%f14,	%f26,	%f4
	orncc	%o1,	0x01B8,	%g1
	orcc	%g4,	0x0B00,	%i0
	movvs	%icc,	%o7,	%g6
	edge16n	%i7,	%g3,	%l5
	xnorcc	%i6,	0x0892,	%l0
	lduw	[%l7 + 0x40],	%l3
	sub	%g5,	%o4,	%l6
	mova	%xcc,	%g7,	%i1
	popc	%l2,	%o2
	edge16n	%l1,	%i4,	%l4
	subccc	%i3,	0x109C,	%o5
	fmuld8sux16	%f9,	%f20,	%f6
	fmovdcc	%xcc,	%f27,	%f6
	addccc	%o6,	%i5,	%i2
	subcc	%o3,	0x157C,	%g2
	addccc	%o0,	0x15F9,	%o1
	fmovspos	%xcc,	%f6,	%f30
	sth	%g4,	[%l7 + 0x50]
	andn	%g1,	0x0035,	%o7
	andncc	%i0,	%g6,	%g3
	move	%xcc,	%l5,	%i7
	ldsw	[%l7 + 0x40],	%i6
	and	%l3,	0x0999,	%g5
	edge8n	%o4,	%l0,	%g7
	edge16	%l6,	%l2,	%i1
	fpsub32	%f18,	%f14,	%f22
	sdiv	%o2,	0x0FF4,	%l1
	movrgez	%i4,	%l4,	%i3
	fpadd32	%f22,	%f24,	%f10
	ldd	[%l7 + 0x08],	%f24
	move	%xcc,	%o6,	%i5
	alignaddrl	%o5,	%o3,	%g2
	smul	%o0,	%o1,	%i2
	srax	%g4,	%g1,	%i0
	movrne	%o7,	%g3,	%g6
	andn	%i7,	%l5,	%l3
	sdivcc	%g5,	0x0B66,	%o4
	edge32l	%l0,	%i6,	%g7
	faligndata	%f10,	%f22,	%f14
	fmovrsne	%l2,	%f11,	%f28
	edge32	%l6,	%i1,	%l1
	movre	%o2,	%l4,	%i3
	ldd	[%l7 + 0x50],	%i4
	mulscc	%o6,	%i5,	%o3
	sdiv	%o5,	0x1030,	%g2
	movrgz	%o0,	0x279,	%i2
	movrne	%o1,	%g4,	%g1
	movge	%xcc,	%o7,	%g3
	fsrc2	%f16,	%f4
	sdivcc	%i0,	0x1259,	%i7
	nop
	set	0x5B, %g3
	stb	%g6,	[%l7 + %g3]
	std	%f26,	[%l7 + 0x60]
	orncc	%l5,	0x1B99,	%g5
	edge8l	%o4,	%l3,	%l0
	movl	%icc,	%i6,	%g7
	sll	%l6,	0x0B,	%l2
	save %i1, %l1, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%xcc,	%f13,	%f22
	movg	%xcc,	%i3,	%l4
	fands	%f25,	%f19,	%f14
	ldsh	[%l7 + 0x2C],	%i4
	movcs	%xcc,	%o6,	%o3
	fnand	%f6,	%f22,	%f16
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	srax	%o0,	0x00,	%i2
	addc	%o1,	%g1,	%o7
	ld	[%l7 + 0x34],	%f16
	movle	%xcc,	%g4,	%g3
	array32	%i7,	%i0,	%g6
	movge	%icc,	%g5,	%l5
	mulscc	%l3,	%o4,	%l0
	ldd	[%l7 + 0x40],	%f6
	fnot2	%f26,	%f24
	stx	%i6,	[%l7 + 0x30]
	movg	%xcc,	%l6,	%g7
	xnor	%i1,	0x1C8B,	%l1
	fnot2	%f6,	%f14
	fnors	%f7,	%f6,	%f4
	sub	%l2,	%o2,	%l4
	movcs	%icc,	%i3,	%o6
	movre	%i4,	%o3,	%o5
	st	%f25,	[%l7 + 0x08]
	and	%i5,	%g2,	%o0
	alignaddrl	%i2,	%o1,	%g1
	movg	%xcc,	%o7,	%g4
	fcmpeq16	%f28,	%f16,	%g3
	ldsw	[%l7 + 0x78],	%i0
	movre	%i7,	0x1FD,	%g5
	ldd	[%l7 + 0x78],	%l4
	movpos	%icc,	%l3,	%g6
	movge	%icc,	%l0,	%o4
	move	%xcc,	%i6,	%g7
	ldd	[%l7 + 0x30],	%i0
	mulx	%l6,	%l1,	%l2
	st	%f31,	[%l7 + 0x0C]
	fcmple32	%f12,	%f28,	%l4
	movvs	%xcc,	%o2,	%o6
	restore %i4, %i3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%o3,	%g2
	xnor	%o0,	%i2,	%i5
	sth	%o1,	[%l7 + 0x38]
	ldsh	[%l7 + 0x2E],	%o7
	movl	%xcc,	%g1,	%g4
	addc	%i0,	%g3,	%g5
	or	%i7,	%l3,	%g6
	orn	%l0,	%o4,	%l5
	fzeros	%f10
	fnegd	%f4,	%f4
	movrlez	%i6,	0x232,	%g7
	addcc	%l6,	0x185A,	%i1
	udiv	%l2,	0x1261,	%l4
	fpsub16	%f28,	%f22,	%f20
	movg	%icc,	%o2,	%o6
	movl	%xcc,	%l1,	%i3
	stb	%i4,	[%l7 + 0x71]
	xor	%o5,	%o3,	%g2
	edge8	%i2,	%i5,	%o0
	xorcc	%o7,	%g1,	%o1
	fmovspos	%icc,	%f2,	%f27
	or	%i0,	%g4,	%g3
	umul	%g5,	0x163B,	%l3
	sdiv	%g6,	0x135C,	%i7
	fmovrsne	%l0,	%f16,	%f20
	addc	%l5,	%o4,	%i6
	sth	%g7,	[%l7 + 0x4C]
	or	%l6,	0x1868,	%l2
	sdiv	%i1,	0x1D08,	%l4
	add	%o2,	0x03C5,	%o6
	ldsw	[%l7 + 0x1C],	%l1
	fmovdleu	%icc,	%f31,	%f22
	edge32n	%i3,	%o5,	%i4
	fexpand	%f28,	%f4
	sllx	%g2,	0x1E,	%i2
	fone	%f22
	umulcc	%o3,	%o0,	%i5
	movle	%xcc,	%o7,	%o1
	stb	%g1,	[%l7 + 0x65]
	and	%g4,	0x1AD9,	%g3
	ldx	[%l7 + 0x58],	%g5
	movrlz	%i0,	%l3,	%g6
	srlx	%i7,	%l0,	%o4
	array8	%i6,	%g7,	%l5
	pdist	%f26,	%f10,	%f10
	mulx	%l2,	%l6,	%i1
	movn	%icc,	%l4,	%o6
	and	%l1,	%o2,	%o5
	andn	%i4,	0x11C1,	%g2
	andcc	%i2,	%o3,	%o0
	orn	%i3,	%i5,	%o1
	addcc	%g1,	%o7,	%g3
	movgu	%xcc,	%g4,	%g5
	addccc	%l3,	0x0106,	%i0
	edge8	%i7,	%g6,	%o4
	stw	%i6,	[%l7 + 0x44]
	ldsb	[%l7 + 0x79],	%l0
	smulcc	%l5,	0x0C4D,	%l2
	sdivcc	%l6,	0x02E3,	%i1
	edge8	%g7,	%o6,	%l1
	smul	%l4,	0x165C,	%o5
	edge8	%i4,	%o2,	%g2
	edge16n	%i2,	%o0,	%o3
	andcc	%i5,	%o1,	%g1
	fandnot1	%f14,	%f16,	%f26
	fxnors	%f23,	%f21,	%f26
	edge16	%i3,	%g3,	%o7
	mulscc	%g5,	0x0EA8,	%l3
	or	%g4,	0x0E25,	%i0
	and	%i7,	0x05A8,	%g6
	sllx	%o4,	0x09,	%l0
	movgu	%xcc,	%l5,	%i6
	ldd	[%l7 + 0x60],	%f14
	fmovrsgz	%l2,	%f20,	%f27
	mulscc	%i1,	%g7,	%l6
	nop
	set	0x50, %i6
	stx	%l1,	[%l7 + %i6]
	subcc	%o6,	%o5,	%l4
	movrgez	%i4,	0x126,	%g2
	movrgz	%o2,	%i2,	%o0
	fmovrse	%o3,	%f23,	%f27
	array32	%i5,	%g1,	%o1
	movrlz	%i3,	0x1C7,	%g3
	sub	%g5,	0x138C,	%o7
	movrgz	%g4,	%l3,	%i0
	fabsd	%f16,	%f30
	array8	%i7,	%g6,	%l0
	edge16n	%l5,	%o4,	%i6
	lduh	[%l7 + 0x10],	%i1
	movrgez	%g7,	0x344,	%l2
	movpos	%icc,	%l1,	%o6
	popc	0x0FDE,	%l6
	stw	%o5,	[%l7 + 0x14]
	addcc	%l4,	0x1519,	%g2
	ldsh	[%l7 + 0x0E],	%i4
	save %o2, 0x1778, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i2,	%o3,	%g1
	edge16	%o1,	%i5,	%g3
	orn	%g5,	0x1676,	%o7
	fmovspos	%xcc,	%f23,	%f1
	fmovsg	%icc,	%f22,	%f29
	umulcc	%i3,	0x0C25,	%l3
	fandnot2s	%f13,	%f20,	%f6
	and	%g4,	%i0,	%i7
	move	%xcc,	%l0,	%l5
	edge32	%o4,	%i6,	%g6
	movrlz	%g7,	%l2,	%i1
	array16	%o6,	%l6,	%l1
	stx	%l4,	[%l7 + 0x08]
	fsrc1	%f8,	%f6
	smulcc	%o5,	%g2,	%o2
	nop
	set	0x7E, %l5
	ldsh	[%l7 + %l5],	%o0
	fnegd	%f10,	%f0
	udivx	%i2,	0x11D8,	%i4
	and	%o3,	%o1,	%g1
	umulcc	%g3,	0x0901,	%g5
	and	%i5,	%o7,	%l3
	movrgez	%g4,	0x314,	%i0
	ldsb	[%l7 + 0x65],	%i3
	ldsb	[%l7 + 0x2E],	%l0
	subccc	%l5,	%i7,	%i6
	sdivcc	%g6,	0x0CE4,	%g7
	save %o4, %i1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%o6,	%l6,	%l1
	subccc	%o5,	0x1778,	%l4
	edge8n	%o2,	%o0,	%i2
	movvc	%icc,	%i4,	%o3
	movre	%g2,	%o1,	%g3
	save %g5, 0x16D3, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f24,	[%l7 + 0x68]
	fands	%f7,	%f15,	%f4
	edge16ln	%o7,	%g1,	%l3
	bshuffle	%f30,	%f26,	%f8
	sllx	%i0,	0x1A,	%i3
	edge32n	%g4,	%l0,	%l5
	addc	%i6,	0x13A4,	%g6
	movvs	%xcc,	%i7,	%g7
	edge8n	%i1,	%o4,	%o6
	sub	%l2,	%l1,	%l6
	movvs	%xcc,	%l4,	%o2
	array16	%o0,	%o5,	%i4
	fexpand	%f26,	%f20
	fmovrsgz	%o3,	%f26,	%f7
	movrne	%g2,	%i2,	%g3
	stx	%g5,	[%l7 + 0x10]
	ldd	[%l7 + 0x38],	%f22
	movrgz	%o1,	%o7,	%i5
	ldsb	[%l7 + 0x65],	%g1
	add	%i0,	0x0EC6,	%i3
	ld	[%l7 + 0x08],	%f22
	edge32	%l3,	%l0,	%l5
	edge8n	%g4,	%i6,	%g6
	stw	%i7,	[%l7 + 0x38]
	bshuffle	%f8,	%f24,	%f8
	edge32l	%i1,	%g7,	%o4
	movrne	%l2,	0x3F4,	%o6
	sra	%l1,	%l4,	%l6
	ld	[%l7 + 0x68],	%f16
	fmovscs	%xcc,	%f0,	%f28
	movge	%xcc,	%o0,	%o2
	fcmpgt16	%f6,	%f4,	%i4
	subccc	%o5,	%g2,	%o3
	fzeros	%f6
	and	%g3,	%g5,	%i2
	mova	%icc,	%o7,	%i5
	edge16n	%o1,	%g1,	%i0
	orcc	%l3,	%i3,	%l5
	lduh	[%l7 + 0x2E],	%l0
	smul	%g4,	%g6,	%i6
	edge16l	%i7,	%i1,	%g7
	stx	%o4,	[%l7 + 0x60]
	alignaddr	%o6,	%l2,	%l1
	stw	%l6,	[%l7 + 0x10]
	sdivx	%l4,	0x0B59,	%o2
	andn	%i4,	%o5,	%o0
	alignaddrl	%g2,	%o3,	%g5
	movrgez	%g3,	%o7,	%i5
	umulcc	%i2,	0x048F,	%o1
	movvs	%icc,	%i0,	%l3
	movrlez	%i3,	%l5,	%l0
	fornot1	%f14,	%f28,	%f10
	addc	%g4,	0x0586,	%g1
	movvc	%xcc,	%g6,	%i7
	fcmpeq32	%f12,	%f22,	%i6
	lduh	[%l7 + 0x74],	%i1
	lduw	[%l7 + 0x3C],	%g7
	edge32	%o4,	%l2,	%l1
	fmovsgu	%xcc,	%f20,	%f3
	addc	%l6,	0x1204,	%l4
	ldd	[%l7 + 0x28],	%o6
	addccc	%o2,	%i4,	%o0
	movne	%xcc,	%g2,	%o5
	srax	%o3,	0x10,	%g3
	xor	%g5,	0x1F1F,	%i5
	umulcc	%i2,	0x0146,	%o1
	movcc	%xcc,	%i0,	%l3
	udiv	%o7,	0x0B87,	%l5
	nop
	set	0x31, %l3
	stb	%l0,	[%l7 + %l3]
	movcc	%xcc,	%i3,	%g4
	orcc	%g6,	%g1,	%i6
	movvc	%xcc,	%i7,	%g7
	fmovsa	%icc,	%f6,	%f11
	addccc	%o4,	0x1F69,	%i1
	smul	%l2,	0x077C,	%l6
	edge8	%l4,	%o6,	%o2
	fnot2s	%f12,	%f23
	smul	%l1,	%o0,	%g2
	fmuld8ulx16	%f19,	%f27,	%f10
	fpadd32	%f20,	%f6,	%f14
	orcc	%o5,	0x19DC,	%o3
	movpos	%icc,	%g3,	%g5
	movrlez	%i4,	%i5,	%i2
	fpadd32s	%f1,	%f19,	%f17
	xnorcc	%o1,	0x16A8,	%l3
	andn	%i0,	%o7,	%l0
	movgu	%icc,	%l5,	%g4
	movrlez	%i3,	%g6,	%g1
	smulcc	%i6,	0x1167,	%i7
	movcs	%xcc,	%o4,	%i1
	or	%l2,	%g7,	%l4
	movvs	%xcc,	%l6,	%o6
	lduw	[%l7 + 0x54],	%l1
	fcmpes	%fcc0,	%f28,	%f23
	ldd	[%l7 + 0x48],	%f30
	fmovdge	%xcc,	%f8,	%f0
	subcc	%o2,	0x09D1,	%g2
	array8	%o5,	%o0,	%g3
	ldsb	[%l7 + 0x26],	%o3
	move	%xcc,	%i4,	%i5
	ldsb	[%l7 + 0x40],	%g5
	movn	%icc,	%i2,	%o1
	nop
	set	0x58, %l4
	std	%f26,	[%l7 + %l4]
	movrgz	%i0,	%o7,	%l3
	lduw	[%l7 + 0x70],	%l0
	ldd	[%l7 + 0x40],	%l4
	fmul8ulx16	%f2,	%f4,	%f16
	sdivx	%g4,	0x0F83,	%g6
	movrgz	%i3,	%i6,	%i7
	srlx	%o4,	%i1,	%g1
	movrlz	%g7,	%l4,	%l6
	fandnot1	%f20,	%f20,	%f22
	std	%f28,	[%l7 + 0x68]
	umulcc	%o6,	0x1FE7,	%l1
	or	%l2,	%o2,	%g2
	lduw	[%l7 + 0x2C],	%o5
	movpos	%icc,	%g3,	%o3
	ldd	[%l7 + 0x20],	%f18
	add	%i4,	%o0,	%i5
	sir	0x012E
	sdivcc	%i2,	0x05AD,	%o1
	movrlz	%g5,	0x16A,	%i0
	movleu	%xcc,	%o7,	%l3
	move	%xcc,	%l5,	%l0
	edge8ln	%g6,	%g4,	%i6
	edge32ln	%i7,	%i3,	%i1
	movg	%xcc,	%g1,	%g7
	ldsh	[%l7 + 0x18],	%o4
	fmovrdne	%l6,	%f4,	%f18
	fmovsvs	%icc,	%f20,	%f22
	udiv	%o6,	0x1D92,	%l4
	edge16n	%l1,	%l2,	%g2
	mulx	%o5,	%g3,	%o2
	fmovsn	%xcc,	%f23,	%f14
	umulcc	%o3,	%i4,	%i5
	edge32ln	%o0,	%o1,	%g5
	st	%f2,	[%l7 + 0x30]
	std	%f20,	[%l7 + 0x30]
	edge32	%i2,	%i0,	%o7
	ldsw	[%l7 + 0x54],	%l5
	movleu	%xcc,	%l0,	%g6
	movrlz	%l3,	%g4,	%i7
	mova	%xcc,	%i6,	%i1
	udivcc	%g1,	0x00CC,	%g7
	movrne	%i3,	%l6,	%o4
	fmovdpos	%xcc,	%f23,	%f6
	lduw	[%l7 + 0x28],	%l4
	edge8ln	%o6,	%l1,	%l2
	array8	%g2,	%o5,	%g3
	fzero	%f18
	fmovsle	%xcc,	%f31,	%f25
	fone	%f26
	movcc	%xcc,	%o2,	%o3
	addcc	%i5,	0x135B,	%i4
	fornot2s	%f6,	%f17,	%f5
	or	%o1,	%o0,	%g5
	edge16ln	%i0,	%i2,	%l5
	st	%f10,	[%l7 + 0x44]
	alignaddr	%o7,	%g6,	%l0
	xnorcc	%g4,	0x03AC,	%i7
	edge8	%i6,	%i1,	%g1
	andncc	%l3,	%g7,	%l6
	fpadd16s	%f18,	%f19,	%f24
	addc	%i3,	%l4,	%o4
	bshuffle	%f22,	%f4,	%f10
	movne	%icc,	%o6,	%l1
	movleu	%icc,	%l2,	%o5
	fmovrdgez	%g3,	%f10,	%f2
	edge16n	%o2,	%g2,	%o3
	st	%f25,	[%l7 + 0x18]
	umulcc	%i5,	0x0870,	%i4
	edge16n	%o0,	%o1,	%i0
	fmovdvs	%icc,	%f5,	%f21
	fmovdvc	%xcc,	%f18,	%f13
	movrgz	%i2,	%g5,	%o7
	sth	%l5,	[%l7 + 0x34]
	movne	%icc,	%l0,	%g4
	addcc	%g6,	%i7,	%i1
	movvs	%icc,	%i6,	%l3
	setx loop_89, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_89: 	movcc	%xcc,	%l6,	%o4
	addccc	%l4,	0x0ABC,	%l1
	sllx	%o6,	0x13,	%l2
	addccc	%o5,	0x0930,	%g3
	udiv	%g2,	0x0E12,	%o2
	fmovdgu	%icc,	%f24,	%f11
	xorcc	%i5,	%i4,	%o0
	umul	%o1,	%o3,	%i0
	orcc	%i2,	%o7,	%l5
	smul	%l0,	%g4,	%g5
	xnor	%i7,	%g6,	%i6
	array16	%i1,	%l3,	%g7
	movl	%xcc,	%i3,	%l6
	array16	%g1,	%o4,	%l1
	edge16ln	%l4,	%o6,	%l2
	edge32l	%o5,	%g2,	%o2
	mulscc	%i5,	%i4,	%g3
	srax	%o1,	%o3,	%o0
	orcc	%i2,	0x02B3,	%i0
	udiv	%o7,	0x0330,	%l5
	ldub	[%l7 + 0x25],	%g4
	movrgz	%l0,	0x39A,	%g5
	movcc	%xcc,	%i7,	%i6
	stx	%g6,	[%l7 + 0x30]
	fmovdge	%icc,	%f14,	%f30
	edge32ln	%l3,	%i1,	%g7
	fcmpgt16	%f0,	%f12,	%i3
	sethi	0x1B2C,	%l6
	array16	%g1,	%o4,	%l4
	fmovrdgz	%l1,	%f10,	%f0
	sll	%o6,	%l2,	%g2
	sll	%o5,	0x05,	%i5
	ld	[%l7 + 0x68],	%f30
	lduw	[%l7 + 0x64],	%i4
	sub	%g3,	0x015B,	%o2
	edge16ln	%o1,	%o0,	%o3
	movge	%xcc,	%i2,	%o7
	edge16ln	%l5,	%i0,	%l0
	movrgez	%g4,	%g5,	%i6
	movle	%icc,	%g6,	%i7
	st	%f15,	[%l7 + 0x6C]
	movrlz	%l3,	%g7,	%i3
	fcmpne16	%f8,	%f26,	%i1
	stb	%g1,	[%l7 + 0x7E]
	stb	%o4,	[%l7 + 0x70]
	movne	%xcc,	%l4,	%l1
	fmovdle	%xcc,	%f24,	%f3
	movle	%icc,	%l6,	%l2
	fcmpes	%fcc1,	%f15,	%f30
	xnorcc	%g2,	%o5,	%i5
	fsrc2s	%f6,	%f29
	sll	%i4,	0x01,	%o6
	restore %o2, 0x1E61, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%g3,	%o0,	%o3
	srl	%o7,	%l5,	%i2
	udivcc	%i0,	0x006E,	%l0
	move	%xcc,	%g5,	%g4
	movrgz	%i6,	%g6,	%l3
	sethi	0x1A53,	%g7
	ldsb	[%l7 + 0x2D],	%i7
	movgu	%xcc,	%i1,	%i3
	stb	%o4,	[%l7 + 0x51]
	edge32	%l4,	%g1,	%l1
	andcc	%l6,	%l2,	%o5
	ldsw	[%l7 + 0x44],	%i5
	sub	%i4,	%g2,	%o2
	and	%o6,	0x1289,	%g3
	sdivx	%o1,	0x0721,	%o3
	fone	%f30
	fabsd	%f20,	%f16
	edge32	%o7,	%o0,	%l5
	sllx	%i2,	%l0,	%i0
	array8	%g5,	%g4,	%i6
	movvs	%icc,	%g6,	%g7
	movvs	%icc,	%l3,	%i7
	fnands	%f21,	%f16,	%f21
	fmovdcc	%xcc,	%f11,	%f22
	fpsub16	%f14,	%f22,	%f20
	movcc	%icc,	%i1,	%i3
	mulscc	%o4,	%l4,	%g1
	std	%f8,	[%l7 + 0x78]
	srax	%l1,	%l6,	%l2
	edge32ln	%i5,	%o5,	%g2
	fors	%f8,	%f10,	%f21
	fmovsa	%icc,	%f8,	%f31
	andn	%o2,	0x1066,	%i4
	fmovrsne	%o6,	%f9,	%f29
	xorcc	%o1,	%g3,	%o7
	fmovsa	%icc,	%f16,	%f4
	udivcc	%o0,	0x0702,	%l5
	addc	%o3,	0x01E8,	%l0
	array16	%i2,	%i0,	%g5
	ldd	[%l7 + 0x40],	%f22
	movrlez	%g4,	%i6,	%g7
	fmovsne	%xcc,	%f27,	%f19
	udivx	%l3,	0x00CC,	%g6
	edge32n	%i7,	%i1,	%i3
	ldx	[%l7 + 0x28],	%l4
	udivcc	%o4,	0x031E,	%g1
	movrlz	%l6,	%l2,	%i5
	sra	%o5,	%g2,	%l1
	edge16ln	%o2,	%o6,	%i4
	movge	%xcc,	%g3,	%o7
	addcc	%o1,	%l5,	%o3
	movpos	%icc,	%o0,	%l0
	ldx	[%l7 + 0x50],	%i2
	sllx	%i0,	%g5,	%g4
	mulx	%g7,	%l3,	%i6
	sethi	0x0EA2,	%g6
	movle	%xcc,	%i1,	%i3
	andncc	%l4,	%o4,	%g1
	srax	%l6,	0x13,	%i7
	ld	[%l7 + 0x7C],	%f14
	fmovsgu	%xcc,	%f1,	%f15
	edge8n	%i5,	%o5,	%g2
	ldd	[%l7 + 0x48],	%f22
	andncc	%l2,	%l1,	%o6
	xor	%i4,	%o2,	%o7
	subc	%g3,	0x133D,	%o1
	stx	%l5,	[%l7 + 0x48]
	edge8	%o0,	%l0,	%i2
	movge	%xcc,	%i0,	%g5
	stx	%o3,	[%l7 + 0x10]
	fmuld8ulx16	%f16,	%f7,	%f0
	movcs	%xcc,	%g4,	%l3
	sdivcc	%i6,	0x0DD4,	%g7
	fandnot1	%f6,	%f20,	%f12
	movge	%icc,	%g6,	%i1
	movneg	%xcc,	%l4,	%i3
	movl	%xcc,	%o4,	%l6
	ldub	[%l7 + 0x0F],	%g1
	mova	%xcc,	%i7,	%o5
	srax	%g2,	0x1D,	%i5
	ld	[%l7 + 0x3C],	%f16
	movle	%xcc,	%l1,	%l2
	fpadd32	%f22,	%f20,	%f4
	xorcc	%i4,	%o2,	%o7
	movvc	%icc,	%g3,	%o6
	edge16ln	%o1,	%l5,	%o0
	smul	%i2,	%l0,	%g5
	movvc	%icc,	%o3,	%i0
	fpackfix	%f12,	%f28
	fmovd	%f14,	%f22
	sdivx	%l3,	0x14AF,	%g4
	movg	%xcc,	%i6,	%g7
	movvs	%icc,	%g6,	%i1
	move	%icc,	%i3,	%o4
	fpackfix	%f28,	%f1
	ldd	[%l7 + 0x30],	%f18
	fandnot2	%f28,	%f12,	%f28
	fmovsne	%icc,	%f30,	%f26
	ldsw	[%l7 + 0x14],	%l6
	addc	%l4,	0x1862,	%i7
	movleu	%xcc,	%o5,	%g1
	std	%f14,	[%l7 + 0x20]
	fpadd16s	%f0,	%f16,	%f3
	udivx	%i5,	0x1F4B,	%l1
	edge32n	%l2,	%g2,	%i4
	sllx	%o2,	0x0A,	%g3
	umul	%o6,	%o7,	%l5
	edge8ln	%o0,	%o1,	%l0
	andncc	%i2,	%o3,	%i0
	umulcc	%l3,	0x035E,	%g5
	subcc	%g4,	0x1FBC,	%g7
	srl	%g6,	%i6,	%i1
	array16	%o4,	%l6,	%i3
	movcs	%icc,	%l4,	%o5
	udivx	%g1,	0x025C,	%i5
	fmovse	%icc,	%f5,	%f26
	fcmpgt16	%f2,	%f14,	%i7
	alignaddr	%l1,	%g2,	%l2
	xnor	%o2,	%g3,	%o6
	movpos	%icc,	%o7,	%l5
	movrlz	%o0,	0x142,	%i4
	sdiv	%o1,	0x1863,	%l0
	sth	%i2,	[%l7 + 0x76]
	fnegd	%f4,	%f28
	udiv	%o3,	0x1F99,	%l3
	mova	%icc,	%g5,	%g4
	sethi	0x16D8,	%g7
	ldsw	[%l7 + 0x5C],	%g6
	movne	%xcc,	%i6,	%i0
	mulscc	%i1,	%o4,	%i3
	edge32n	%l6,	%o5,	%l4
	fpadd32s	%f20,	%f22,	%f24
	movg	%icc,	%i5,	%g1
	xorcc	%l1,	0x1CC8,	%g2
	fmovsneg	%xcc,	%f3,	%f15
	movrgez	%l2,	%i7,	%o2
	std	%f20,	[%l7 + 0x68]
	ldd	[%l7 + 0x18],	%f14
	xnorcc	%o6,	0x07BE,	%g3
	ldx	[%l7 + 0x20],	%l5
	edge8	%o7,	%i4,	%o0
	andncc	%o1,	%i2,	%l0
	fcmple32	%f28,	%f22,	%o3
	movl	%xcc,	%l3,	%g4
	movleu	%icc,	%g5,	%g6
	movge	%icc,	%i6,	%g7
	std	%f20,	[%l7 + 0x20]
	fand	%f10,	%f16,	%f28
	fandnot2s	%f0,	%f9,	%f12
	edge16l	%i0,	%i1,	%o4
	move	%icc,	%i3,	%l6
	move	%xcc,	%o5,	%l4
	subcc	%g1,	0x0159,	%l1
	edge32	%i5,	%l2,	%i7
	ldsw	[%l7 + 0x4C],	%g2
	ldub	[%l7 + 0x4B],	%o6
	edge16l	%g3,	%l5,	%o7
	ldsw	[%l7 + 0x40],	%o2
	nop
	set	0x77, %g7
	ldsb	[%l7 + %g7],	%o0
	movvs	%icc,	%o1,	%i4
	popc	0x1E9A,	%i2
	fmovsa	%icc,	%f6,	%f7
	movgu	%xcc,	%l0,	%o3
	fornot1s	%f27,	%f28,	%f6
	orncc	%g4,	0x18C6,	%l3
	sdivx	%g6,	0x1BA6,	%g5
	smulcc	%g7,	0x00C2,	%i0
	fxnor	%f18,	%f2,	%f28
	xnorcc	%i6,	%o4,	%i3
	udivx	%l6,	0x0788,	%o5
	srl	%l4,	0x1D,	%i1
	addc	%l1,	0x041E,	%i5
	fmovdpos	%xcc,	%f19,	%f28
	ldsb	[%l7 + 0x22],	%g1
	fmovrse	%i7,	%f26,	%f25
	fcmpgt32	%f24,	%f0,	%l2
	edge32ln	%o6,	%g2,	%l5
	alignaddr	%o7,	%o2,	%o0
	edge8l	%o1,	%i4,	%i2
	addc	%g3,	0x0E8E,	%l0
	ldub	[%l7 + 0x3D],	%g4
	lduh	[%l7 + 0x5C],	%o3
	andncc	%g6,	%l3,	%g7
	movvs	%xcc,	%g5,	%i0
	edge16ln	%o4,	%i6,	%l6
	movn	%xcc,	%i3,	%o5
	stb	%l4,	[%l7 + 0x1B]
	sethi	0x1C9E,	%l1
	fxnor	%f12,	%f24,	%f20
	movcc	%icc,	%i5,	%i1
	mulx	%g1,	0x1B3E,	%l2
	edge32l	%o6,	%g2,	%l5
	srl	%o7,	0x09,	%i7
	srlx	%o2,	%o1,	%o0
	movvs	%icc,	%i4,	%i2
	fzero	%f2
	sir	0x1A3F
	fmovse	%icc,	%f6,	%f13
	orcc	%g3,	0x1EE5,	%g4
	udivx	%l0,	0x1069,	%o3
	sir	0x1284
	ld	[%l7 + 0x64],	%f28
	sll	%g6,	0x0A,	%g7
	lduw	[%l7 + 0x28],	%g5
	movrlez	%i0,	%l3,	%o4
	fcmple16	%f0,	%f12,	%l6
	sdivcc	%i3,	0x0D64,	%o5
	addc	%i6,	%l1,	%i5
	fpack32	%f22,	%f28,	%f4
	add	%i1,	0x1E84,	%g1
	fmovde	%xcc,	%f26,	%f7
	movrlez	%l2,	%o6,	%g2
	fmovrsgz	%l5,	%f24,	%f28
	fmovsle	%icc,	%f27,	%f31
	subc	%o7,	0x0D11,	%i7
	smul	%o2,	%l4,	%o1
	movg	%xcc,	%i4,	%o0
	movcs	%xcc,	%g3,	%g4
	fnand	%f28,	%f4,	%f4
	smul	%l0,	%o3,	%i2
	and	%g6,	%g7,	%g5
	save %i0, 0x1062, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmuld8sux16	%f21,	%f6,	%f16
	siam	0x0
	fzero	%f22
	xor	%l6,	0x072C,	%l3
	srl	%i3,	%i6,	%o5
	ld	[%l7 + 0x20],	%f24
	save %l1, 0x071A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g1,	%l2,	%o6
	movrlez	%i5,	0x32B,	%g2
	movcs	%xcc,	%o7,	%l5
	movne	%xcc,	%i7,	%o2
	xnorcc	%o1,	0x0FC4,	%i4
	fnegs	%f2,	%f27
	fones	%f12
	ldx	[%l7 + 0x10],	%o0
	movn	%icc,	%g3,	%l4
	fpsub16s	%f8,	%f7,	%f30
	sir	0x129A
	subcc	%l0,	0x0E52,	%o3
	edge8l	%i2,	%g6,	%g7
	xnorcc	%g4,	0x0426,	%i0
	srax	%o4,	%l6,	%l3
	edge32	%g5,	%i3,	%i6
	sra	%l1,	0x13,	%o5
	st	%f22,	[%l7 + 0x24]
	fcmpeq16	%f8,	%f0,	%g1
	fmovdg	%icc,	%f7,	%f21
	array32	%i1,	%o6,	%l2
	fmovscc	%icc,	%f4,	%f15
	movcs	%icc,	%g2,	%o7
	move	%icc,	%i5,	%i7
	andncc	%o2,	%l5,	%i4
	fcmped	%fcc1,	%f30,	%f0
	ldsw	[%l7 + 0x70],	%o1
	fmovrdlz	%g3,	%f26,	%f22
	edge8	%o0,	%l0,	%l4
	ldd	[%l7 + 0x38],	%f12
	edge32	%i2,	%g6,	%o3
	edge16n	%g4,	%i0,	%g7
	orcc	%o4,	%l6,	%l3
	andncc	%i3,	%g5,	%l1
	subc	%i6,	0x0A20,	%g1
	fmovdg	%icc,	%f28,	%f6
	movg	%xcc,	%o5,	%o6
	movre	%i1,	0x24A,	%l2
	or	%g2,	0x06F0,	%o7
	fxnors	%f10,	%f7,	%f13
	udivx	%i5,	0x0C8D,	%o2
	udivx	%i7,	0x187D,	%l5
	edge32n	%o1,	%i4,	%g3
	fones	%f18
	fcmpeq16	%f10,	%f28,	%o0
	fabsd	%f28,	%f4
	fmovsvs	%icc,	%f9,	%f12
	alignaddr	%l4,	%i2,	%l0
	movrgez	%g6,	%g4,	%i0
	fxnors	%f14,	%f3,	%f8
	std	%f24,	[%l7 + 0x48]
	movre	%o3,	%g7,	%o4
	subcc	%l3,	0x1B73,	%i3
	movpos	%xcc,	%l6,	%l1
	fandnot1	%f14,	%f0,	%f14
	srlx	%g5,	0x18,	%i6
	movvs	%icc,	%o5,	%o6
	udiv	%g1,	0x071E,	%l2
	addcc	%i1,	%g2,	%i5
	ldsh	[%l7 + 0x7E],	%o2
	nop
	set	0x5A, %g4
	sth	%i7,	[%l7 + %g4]
	edge32	%o7,	%l5,	%i4
	edge8l	%o1,	%g3,	%l4
	subcc	%o0,	0x1CF7,	%i2
	fpsub16	%f26,	%f8,	%f8
	fpadd32s	%f27,	%f25,	%f31
	fcmpne16	%f4,	%f24,	%l0
	movrne	%g4,	0x0D7,	%i0
	movcs	%xcc,	%o3,	%g6
	movvs	%xcc,	%o4,	%l3
	movgu	%icc,	%i3,	%g7
	fnot1s	%f8,	%f16
	movne	%icc,	%l6,	%g5
	andcc	%i6,	%l1,	%o5
	nop
	set	0x38, %i3
	std	%f6,	[%l7 + %i3]
	smulcc	%o6,	%l2,	%g1
	edge32ln	%i1,	%i5,	%g2
	fmovrde	%i7,	%f24,	%f6
	udivcc	%o7,	0x1345,	%l5
	fcmps	%fcc3,	%f4,	%f0
	fnot2s	%f21,	%f23
	sdivcc	%i4,	0x1F00,	%o1
	movneg	%icc,	%o2,	%g3
	or	%l4,	%i2,	%o0
	fcmpgt16	%f16,	%f4,	%l0
	movge	%xcc,	%i0,	%o3
	andncc	%g6,	%g4,	%o4
	andcc	%l3,	0x104D,	%i3
	fpsub32	%f30,	%f24,	%f24
	movpos	%xcc,	%l6,	%g7
	array8	%i6,	%l1,	%o5
	mulx	%g5,	%o6,	%l2
	srlx	%i1,	0x02,	%g1
	ld	[%l7 + 0x34],	%f17
	orn	%g2,	%i7,	%o7
	fmovde	%xcc,	%f23,	%f23
	addc	%i5,	%l5,	%o1
	movgu	%icc,	%o2,	%g3
	movrgez	%l4,	0x1AF,	%i4
	array16	%o0,	%l0,	%i2
	udivx	%i0,	0x00C5,	%o3
	umul	%g4,	%o4,	%l3
	subcc	%g6,	%l6,	%g7
	sub	%i3,	0x1D48,	%l1
	subcc	%i6,	%g5,	%o5
	fmovrsne	%o6,	%f0,	%f15
	alignaddrl	%l2,	%i1,	%g2
	fpsub32s	%f16,	%f30,	%f1
	movrgz	%g1,	0x0A6,	%o7
	smul	%i5,	0x12C4,	%i7
	edge32ln	%o1,	%l5,	%o2
	mulx	%g3,	%l4,	%o0
	orn	%i4,	0x0878,	%i2
	movge	%icc,	%i0,	%o3
	fmovsleu	%icc,	%f3,	%f16
	andcc	%l0,	%g4,	%o4
	smul	%g6,	0x0B12,	%l6
	udivx	%l3,	0x1D16,	%i3
	fnot1s	%f0,	%f10
	andcc	%l1,	0x09A0,	%i6
	movleu	%icc,	%g7,	%g5
	fnors	%f16,	%f30,	%f3
	movle	%xcc,	%o5,	%l2
	sir	0x0C8E
	xorcc	%o6,	%g2,	%i1
	fnegs	%f17,	%f3
	edge32ln	%o7,	%i5,	%i7
	sdiv	%g1,	0x0943,	%o1
	mulx	%o2,	0x0138,	%g3
	sdivcc	%l5,	0x19F4,	%o0
	movpos	%icc,	%l4,	%i2
	subcc	%i4,	%i0,	%l0
	fcmpeq32	%f14,	%f24,	%o3
	fcmps	%fcc3,	%f10,	%f9
	movrlz	%o4,	0x3FE,	%g6
	st	%f9,	[%l7 + 0x38]
	mulx	%g4,	%l6,	%l3
	movge	%xcc,	%l1,	%i6
	alignaddrl	%g7,	%i3,	%g5
	fmovdne	%xcc,	%f23,	%f13
	edge16n	%l2,	%o6,	%g2
	srl	%o5,	%i1,	%i5
	sllx	%i7,	%o7,	%g1
	sdivcc	%o1,	0x1C73,	%g3
	smulcc	%l5,	0x0F67,	%o2
	std	%f20,	[%l7 + 0x28]
	array8	%l4,	%o0,	%i4
	lduh	[%l7 + 0x72],	%i2
	ldd	[%l7 + 0x20],	%l0
	sra	%o3,	0x00,	%i0
	mova	%xcc,	%o4,	%g6
	movge	%icc,	%g4,	%l3
	xorcc	%l1,	%l6,	%g7
	save %i6, 0x0F4F, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%l2,	[%l7 + 0x2E]
	movrne	%o6,	0x1AB,	%g5
	addccc	%g2,	%o5,	%i1
	mulscc	%i5,	0x08EA,	%i7
	addcc	%g1,	0x1535,	%o7
	fxnors	%f25,	%f8,	%f20
	andncc	%g3,	%o1,	%l5
	nop
	set	0x20, %l1
	ldx	[%l7 + %l1],	%o2
	lduw	[%l7 + 0x34],	%o0
	movrgez	%i4,	%i2,	%l0
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%l4
	ldx	[%l7 + 0x08],	%o3
	umul	%i0,	%g6,	%o4
	movpos	%icc,	%g4,	%l1
	srlx	%l6,	0x05,	%l3
	mova	%icc,	%g7,	%i6
	movcs	%icc,	%i3,	%l2
	sdivcc	%g5,	0x1C1A,	%o6
	save %o5, %g2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f10,	%f24,	%f28
	umul	%i1,	%g1,	%o7
	sll	%i7,	0x1B,	%o1
	sir	0x095C
	fmovrdlez	%l5,	%f2,	%f16
	ldd	[%l7 + 0x58],	%f14
	srlx	%g3,	%o0,	%i4
	subcc	%o2,	0x0330,	%i2
	fands	%f16,	%f18,	%f22
	lduw	[%l7 + 0x4C],	%l4
	mulscc	%o3,	0x0A29,	%l0
	addc	%g6,	0x01BD,	%i0
	array32	%o4,	%g4,	%l1
	xnorcc	%l6,	%g7,	%i6
	orncc	%i3,	0x1274,	%l3
	fmovrdlez	%g5,	%f22,	%f14
	fmovdl	%icc,	%f10,	%f2
	sll	%l2,	%o6,	%o5
	smulcc	%i5,	0x0DE3,	%i1
	sethi	0x0E2A,	%g1
	smul	%g2,	%o7,	%o1
	fandnot2s	%f8,	%f26,	%f20
	sethi	0x066C,	%l5
	xor	%g3,	%i7,	%i4
	setx loop_90, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_90: 	alignaddrl	%i2,	%l0,	%g6
	ldsh	[%l7 + 0x52],	%o3
	fxnor	%f26,	%f24,	%f8
	sdiv	%o4,	0x06E4,	%g4
	movleu	%icc,	%i0,	%l6
	fmovrsne	%l1,	%f24,	%f10
	stx	%i6,	[%l7 + 0x48]
	umul	%g7,	%i3,	%g5
	edge32ln	%l2,	%l3,	%o6
	andn	%i5,	%i1,	%g1
	edge32l	%o5,	%g2,	%o1
	edge32n	%o7,	%g3,	%i7
	add	%i4,	%o0,	%o2
	edge16	%l5,	%i2,	%l0
	edge32l	%g6,	%o3,	%l4
	umulcc	%g4,	0x114E,	%i0
	movcs	%icc,	%o4,	%l1
	fxors	%f12,	%f9,	%f21
	fcmpgt32	%f26,	%f14,	%l6
	stw	%g7,	[%l7 + 0x10]
	array16	%i6,	%g5,	%i3
	ldsw	[%l7 + 0x28],	%l3
	subccc	%l2,	0x1928,	%i5
	movpos	%icc,	%o6,	%i1
	ldx	[%l7 + 0x48],	%o5
	umul	%g2,	0x1A03,	%g1
	ldd	[%l7 + 0x78],	%f20
	edge8ln	%o1,	%g3,	%o7
	movgu	%xcc,	%i7,	%i4
	fmovsneg	%xcc,	%f16,	%f25
	movrlz	%o2,	%o0,	%i2
	xorcc	%l0,	0x1139,	%g6
	move	%xcc,	%o3,	%l5
	movvs	%icc,	%l4,	%i0
	fcmpgt32	%f2,	%f6,	%g4
	udivcc	%o4,	0x0579,	%l6
	lduh	[%l7 + 0x3A],	%l1
	movrlz	%i6,	%g7,	%i3
	subcc	%l3,	0x0EDD,	%g5
	movpos	%icc,	%i5,	%o6
	fcmped	%fcc3,	%f24,	%f30
	smulcc	%i1,	%l2,	%g2
	fnot1s	%f11,	%f12
	ldsh	[%l7 + 0x20],	%g1
	movrne	%o5,	%g3,	%o7
	movleu	%icc,	%o1,	%i7
	ldub	[%l7 + 0x39],	%o2
	mova	%icc,	%i4,	%o0
	movn	%xcc,	%i2,	%g6
	fzeros	%f21
	move	%icc,	%o3,	%l5
	alignaddrl	%l0,	%l4,	%i0
	lduh	[%l7 + 0x4C],	%o4
	movvs	%icc,	%g4,	%l6
	fmovsa	%icc,	%f30,	%f15
	subc	%i6,	0x12A7,	%l1
	addccc	%g7,	%l3,	%i3
	fornot1	%f14,	%f2,	%f8
	orncc	%g5,	0x0A15,	%o6
	fabsd	%f8,	%f16
	fmul8x16al	%f13,	%f11,	%f10
	array16	%i1,	%i5,	%g2
	mulscc	%g1,	%o5,	%l2
	udiv	%o7,	0x1F66,	%o1
	edge32	%g3,	%i7,	%o2
	mulx	%o0,	0x16C9,	%i4
	restore %g6, %i2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l0,	%l4,	%l5
	stw	%i0,	[%l7 + 0x68]
	lduh	[%l7 + 0x26],	%g4
	srax	%o4,	0x13,	%i6
	sir	0x0A7D
	movrgz	%l6,	0x122,	%l1
	sll	%l3,	0x09,	%i3
	edge8n	%g7,	%g5,	%i1
	movvs	%xcc,	%i5,	%g2
	edge32ln	%g1,	%o5,	%o6
	fornot1s	%f20,	%f6,	%f14
	alignaddr	%o7,	%o1,	%l2
	ldd	[%l7 + 0x50],	%i6
	orn	%g3,	%o2,	%i4
	lduh	[%l7 + 0x12],	%o0
	ldx	[%l7 + 0x70],	%g6
	faligndata	%f30,	%f20,	%f18
	lduw	[%l7 + 0x7C],	%i2
	andcc	%l0,	%l4,	%o3
	sll	%l5,	0x16,	%i0
	array16	%g4,	%o4,	%i6
	fmovdcc	%icc,	%f5,	%f31
	andn	%l6,	%l1,	%l3
	andn	%g7,	%i3,	%i1
	fcmps	%fcc0,	%f5,	%f18
	fxors	%f22,	%f21,	%f16
	movrlz	%g5,	%g2,	%i5
	andncc	%o5,	%o6,	%o7
	fpack16	%f24,	%f25
	popc	%o1,	%g1
	orn	%i7,	%l2,	%g3
	ldd	[%l7 + 0x68],	%f16
	ldd	[%l7 + 0x48],	%i4
	mova	%xcc,	%o2,	%g6
	movgu	%xcc,	%o0,	%l0
	movvs	%xcc,	%i2,	%o3
	stb	%l5,	[%l7 + 0x56]
	movrne	%l4,	0x208,	%g4
	fmul8x16al	%f10,	%f4,	%f0
	sllx	%o4,	%i6,	%l6
	ldsh	[%l7 + 0x7E],	%i0
	sra	%l3,	%g7,	%i3
	sllx	%i1,	0x04,	%g5
	fxnor	%f8,	%f22,	%f16
	edge32l	%l1,	%g2,	%i5
	edge16	%o6,	%o7,	%o5
	xnorcc	%g1,	%o1,	%l2
	nop
	set	0x14, %i5
	lduw	[%l7 + %i5],	%g3
	fcmpne32	%f12,	%f20,	%i4
	movpos	%icc,	%i7,	%o2
	orcc	%o0,	%g6,	%l0
	fpsub32	%f16,	%f18,	%f16
	movneg	%icc,	%o3,	%i2
	mulx	%l4,	0x005A,	%g4
	mova	%xcc,	%l5,	%o4
	array8	%l6,	%i0,	%l3
	movvc	%xcc,	%i6,	%g7
	stb	%i3,	[%l7 + 0x0E]
	movvs	%icc,	%i1,	%l1
	fones	%f6
	ldd	[%l7 + 0x28],	%f24
	xnorcc	%g2,	0x0126,	%i5
	edge8	%g5,	%o7,	%o6
	ldsb	[%l7 + 0x66],	%o5
	fnors	%f25,	%f26,	%f26
	xorcc	%g1,	%o1,	%g3
	stx	%l2,	[%l7 + 0x40]
	lduh	[%l7 + 0x58],	%i7
	stx	%i4,	[%l7 + 0x78]
	fornot2	%f8,	%f12,	%f26
	andcc	%o2,	0x07B3,	%o0
	stw	%g6,	[%l7 + 0x20]
	sra	%o3,	0x11,	%l0
	xorcc	%i2,	%l4,	%l5
	edge16n	%g4,	%l6,	%o4
	nop
	set	0x68, %i2
	stw	%l3,	[%l7 + %i2]
	movleu	%icc,	%i6,	%i0
	movne	%icc,	%g7,	%i1
	movcs	%icc,	%l1,	%g2
	movle	%icc,	%i3,	%g5
	smulcc	%i5,	0x171C,	%o6
	edge8n	%o5,	%g1,	%o7
	movrne	%g3,	%o1,	%i7
	movpos	%xcc,	%l2,	%i4
	ld	[%l7 + 0x7C],	%f24
	popc	%o2,	%o0
	edge32l	%g6,	%l0,	%o3
	ldd	[%l7 + 0x48],	%i2
	sub	%l4,	%l5,	%g4
	ldd	[%l7 + 0x68],	%i6
	xnorcc	%l3,	%i6,	%o4
	movge	%xcc,	%i0,	%g7
	move	%icc,	%i1,	%g2
	move	%icc,	%i3,	%g5
	edge32l	%l1,	%i5,	%o5
	edge32l	%o6,	%g1,	%o7
	movrlz	%o1,	%g3,	%l2
	edge8n	%i7,	%i4,	%o2
	lduh	[%l7 + 0x64],	%g6
	xorcc	%o0,	0x0934,	%o3
	fmuld8sux16	%f19,	%f0,	%f18
	popc	0x03EE,	%l0
	save %l4, 0x085E, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x0D],	%g4
	fmul8sux16	%f8,	%f6,	%f26
	addc	%l6,	%l5,	%i6
	movneg	%xcc,	%o4,	%l3
	movcs	%xcc,	%i0,	%i1
	fnot1s	%f0,	%f1
	st	%f22,	[%l7 + 0x2C]
	ldsb	[%l7 + 0x28],	%g7
	udivcc	%i3,	0x0753,	%g2
	and	%g5,	0x1A26,	%i5
	andncc	%o5,	%o6,	%g1
	edge8ln	%o7,	%o1,	%g3
	fxors	%f0,	%f1,	%f8
	fcmped	%fcc3,	%f8,	%f20
	movvc	%icc,	%l1,	%l2
	nop
	set	0x58, %o1
	stx	%i4,	[%l7 + %o1]
	mova	%icc,	%i7,	%o2
	lduw	[%l7 + 0x44],	%o0
	array32	%g6,	%o3,	%l4
	stx	%i2,	[%l7 + 0x70]
	movvs	%xcc,	%g4,	%l6
	movrlz	%l0,	0x2F6,	%i6
	edge16n	%l5,	%l3,	%o4
	fcmpes	%fcc3,	%f9,	%f16
	xor	%i0,	0x17F1,	%g7
	srax	%i1,	0x19,	%i3
	fmovdvc	%xcc,	%f1,	%f30
	orcc	%g2,	%i5,	%g5
	smulcc	%o5,	%g1,	%o7
	udivx	%o1,	0x1719,	%o6
	movge	%icc,	%l1,	%g3
	movre	%l2,	%i4,	%o2
	srl	%i7,	0x0E,	%g6
	fmovrsne	%o3,	%f8,	%f13
	setx loop_91, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_91: 	ldx	[%l7 + 0x50],	%o0
	edge32	%l6,	%l0,	%g4
	stw	%i6,	[%l7 + 0x74]
	srl	%l3,	%l5,	%o4
	nop
	set	0x70, %g1
	ldd	[%l7 + %g1],	%f18
	fmovsge	%icc,	%f2,	%f0
	fpadd32s	%f31,	%f1,	%f31
	array32	%g7,	%i1,	%i0
	orn	%g2,	0x147E,	%i5
	fpsub32	%f8,	%f12,	%f4
	subcc	%g5,	0x195A,	%o5
	ldub	[%l7 + 0x47],	%g1
	fmovdn	%icc,	%f0,	%f11
	udiv	%i3,	0x1C13,	%o7
	andn	%o6,	%l1,	%o1
	edge16ln	%l2,	%i4,	%o2
	lduw	[%l7 + 0x6C],	%i7
	edge16ln	%g3,	%o3,	%g6
	srax	%i2,	0x1F,	%o0
	mulx	%l4,	0x1300,	%l6
	popc	%l0,	%g4
	andncc	%l3,	%l5,	%i6
	edge16	%o4,	%g7,	%i0
	edge8ln	%i1,	%g2,	%g5
	popc	%o5,	%i5
	smulcc	%g1,	0x1B0F,	%o7
	umulcc	%o6,	0x156C,	%i3
	subc	%o1,	%l1,	%l2
	movre	%o2,	0x2B1,	%i7
	sllx	%i4,	%g3,	%g6
	fmovdvc	%xcc,	%f28,	%f12
	stw	%i2,	[%l7 + 0x14]
	ldsw	[%l7 + 0x10],	%o3
	movn	%icc,	%l4,	%l6
	and	%l0,	0x082C,	%g4
	std	%f0,	[%l7 + 0x18]
	ldx	[%l7 + 0x20],	%o0
	fmovrde	%l3,	%f4,	%f8
	movrlez	%l5,	%o4,	%g7
	fmovsle	%xcc,	%f23,	%f25
	edge16	%i0,	%i1,	%i6
	sir	0x0851
	edge8n	%g2,	%o5,	%g5
	edge32	%i5,	%g1,	%o7
	smul	%o6,	%o1,	%i3
	mova	%xcc,	%l1,	%l2
	fmovscs	%xcc,	%f15,	%f16
	mova	%icc,	%o2,	%i4
	subcc	%i7,	0x0663,	%g3
	fmovdvs	%xcc,	%f14,	%f1
	lduh	[%l7 + 0x56],	%g6
	popc	%i2,	%o3
	ldsh	[%l7 + 0x28],	%l6
	ldsb	[%l7 + 0x73],	%l0
	movrne	%g4,	%o0,	%l3
	edge32l	%l4,	%o4,	%l5
	xor	%i0,	%i1,	%g7
	array32	%g2,	%i6,	%o5
	fmovse	%icc,	%f13,	%f1
	mova	%icc,	%i5,	%g1
	fone	%f24
	fmovrse	%g5,	%f11,	%f6
	fnands	%f6,	%f17,	%f0
	movgu	%icc,	%o6,	%o1
	edge32l	%i3,	%l1,	%l2
	subcc	%o2,	0x1B57,	%i4
	nop
	set	0x48, %l2
	ldub	[%l7 + %l2],	%i7
	lduw	[%l7 + 0x3C],	%o7
	fxnor	%f18,	%f0,	%f26
	fmovsa	%xcc,	%f15,	%f16
	mulscc	%g6,	%i2,	%g3
	movneg	%xcc,	%l6,	%o3
	fones	%f29
	or	%l0,	%o0,	%l3
	sdiv	%l4,	0x10C2,	%g4
	fexpand	%f1,	%f24
	fxors	%f3,	%f20,	%f30
	ldsw	[%l7 + 0x3C],	%l5
	movvc	%xcc,	%o4,	%i0
	or	%g7,	0x0263,	%g2
	movne	%xcc,	%i1,	%i6
	edge32ln	%o5,	%i5,	%g5
	subc	%o6,	0x111B,	%o1
	or	%i3,	0x10F7,	%g1
	stw	%l1,	[%l7 + 0x24]
	nop
	set	0x6A, %g2
	ldsh	[%l7 + %g2],	%l2
	movcc	%xcc,	%i4,	%i7
	movre	%o7,	%g6,	%i2
	umulcc	%g3,	%o2,	%l6
	add	%o3,	%l0,	%l3
	orncc	%l4,	0x0FF3,	%o0
	movl	%icc,	%g4,	%l5
	or	%i0,	%g7,	%o4
	faligndata	%f0,	%f16,	%f8
	fpadd32s	%f27,	%f19,	%f26
	fxors	%f4,	%f17,	%f10
	siam	0x6
	fnands	%f3,	%f17,	%f30
	srax	%i1,	0x1E,	%i6
	st	%f29,	[%l7 + 0x08]
	movcs	%xcc,	%g2,	%o5
	sllx	%i5,	0x08,	%o6
	fmovdne	%xcc,	%f0,	%f14
	edge32l	%g5,	%i3,	%g1
	fsrc2	%f26,	%f22
	fmovsa	%xcc,	%f10,	%f17
	sdivx	%o1,	0x158D,	%l2
	ldsw	[%l7 + 0x30],	%i4
	fpsub16	%f26,	%f4,	%f8
	fcmpgt16	%f14,	%f28,	%l1
	movneg	%xcc,	%o7,	%g6
	fmovsn	%xcc,	%f17,	%f20
	st	%f5,	[%l7 + 0x54]
	edge16l	%i2,	%g3,	%o2
	movgu	%icc,	%i7,	%o3
	andn	%l0,	%l6,	%l4
	movvs	%xcc,	%l3,	%o0
	movge	%xcc,	%l5,	%g4
	movg	%xcc,	%g7,	%o4
	sir	0x0D18
	bshuffle	%f12,	%f26,	%f26
	fpadd16s	%f5,	%f23,	%f25
	movn	%icc,	%i0,	%i1
	fmovrde	%g2,	%f4,	%f26
	edge16	%o5,	%i5,	%o6
	fmovdg	%icc,	%f0,	%f13
	subc	%i6,	%g5,	%g1
	std	%f6,	[%l7 + 0x10]
	xnorcc	%o1,	0x0779,	%i3
	edge32l	%l2,	%i4,	%o7
	edge32n	%g6,	%i2,	%l1
	movrne	%o2,	0x3AD,	%g3
	fmovdgu	%xcc,	%f1,	%f30
	sra	%i7,	0x05,	%o3
	fmovrsne	%l6,	%f0,	%f30
	srl	%l0,	0x1B,	%l4
	movn	%icc,	%o0,	%l5
	fcmpeq16	%f2,	%f22,	%l3
	and	%g4,	%o4,	%g7
	movvc	%icc,	%i0,	%g2
	andncc	%i1,	%i5,	%o5
	mulx	%o6,	0x1B21,	%g5
	fornot1	%f4,	%f22,	%f18
	fcmpeq32	%f18,	%f20,	%g1
	addc	%i6,	%o1,	%l2
	sth	%i3,	[%l7 + 0x1A]
	ldd	[%l7 + 0x18],	%f20
	movrne	%o7,	0x18F,	%g6
	fmovsvs	%xcc,	%f1,	%f30
	alignaddr	%i4,	%i2,	%o2
	move	%xcc,	%g3,	%i7
	fmovrdgez	%o3,	%f14,	%f20
	movn	%icc,	%l1,	%l0
	fcmpgt16	%f20,	%f20,	%l6
	stb	%l4,	[%l7 + 0x1E]
	fmul8x16al	%f17,	%f10,	%f14
	edge16l	%l5,	%l3,	%g4
	restore %o0, 0x1DE0, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i0,	0x1995,	%g2
	alignaddr	%g7,	%i1,	%o5
	movrlz	%o6,	%i5,	%g5
	udivcc	%i6,	0x0984,	%g1
	fmovrse	%o1,	%f24,	%f8
	movg	%xcc,	%i3,	%o7
	addccc	%l2,	%i4,	%g6
	fmovsgu	%icc,	%f14,	%f17
	orn	%i2,	0x0883,	%o2
	movrlez	%g3,	0x2AA,	%i7
	fnot2s	%f12,	%f0
	mulscc	%o3,	%l1,	%l0
	fnands	%f18,	%f25,	%f26
	movne	%icc,	%l4,	%l6
	addcc	%l5,	%l3,	%g4
	ldd	[%l7 + 0x60],	%f22
	fornot2s	%f27,	%f26,	%f26
	xor	%o0,	%o4,	%g2
	edge16n	%i0,	%i1,	%g7
	xnor	%o6,	%o5,	%i5
	movg	%icc,	%i6,	%g5
	movrgez	%g1,	0x1E6,	%o1
	sdivcc	%i3,	0x1301,	%l2
	popc	%o7,	%i4
	movre	%i2,	0x2BB,	%o2
	movpos	%icc,	%g3,	%g6
	array16	%i7,	%l1,	%o3
	edge8ln	%l4,	%l0,	%l5
	movre	%l3,	%l6,	%o0
	movle	%xcc,	%o4,	%g2
	sllx	%i0,	%i1,	%g4
	sdiv	%g7,	0x12AD,	%o6
	umul	%i5,	%i6,	%g5
	fmovdge	%xcc,	%f23,	%f28
	stb	%o5,	[%l7 + 0x63]
	save %g1, %i3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16	%l2,	%i4,	%o7
	umul	%i2,	%o2,	%g3
	array16	%g6,	%l1,	%o3
	movn	%xcc,	%l4,	%l0
	fpsub16	%f28,	%f26,	%f22
	fmovrsgez	%i7,	%f31,	%f6
	srax	%l5,	0x0A,	%l6
	movrgez	%o0,	0x36D,	%o4
	subccc	%l3,	0x1B97,	%i0
	movl	%icc,	%i1,	%g2
	st	%f17,	[%l7 + 0x0C]
	movrgz	%g4,	%o6,	%g7
	edge32n	%i6,	%g5,	%o5
	lduw	[%l7 + 0x08],	%g1
	xnorcc	%i3,	%o1,	%l2
	movrgez	%i4,	0x277,	%o7
	movge	%icc,	%i2,	%o2
	edge16ln	%g3,	%g6,	%i5
	fandnot1	%f22,	%f22,	%f0
	movneg	%icc,	%l1,	%l4
	ldd	[%l7 + 0x20],	%l0
	nop
	set	0x38, %o5
	ldsw	[%l7 + %o5],	%i7
	ld	[%l7 + 0x30],	%f7
	stx	%o3,	[%l7 + 0x20]
	fzeros	%f19
	movvc	%icc,	%l5,	%l6
	edge16ln	%o0,	%o4,	%l3
	movl	%xcc,	%i1,	%i0
	nop
	set	0x18, %g5
	stw	%g2,	[%l7 + %g5]
	movvs	%icc,	%g4,	%o6
	edge32l	%i6,	%g5,	%g7
	array16	%g1,	%o5,	%o1
	ld	[%l7 + 0x28],	%f11
	move	%xcc,	%i3,	%i4
	subc	%l2,	%i2,	%o2
	array8	%g3,	%o7,	%i5
	andcc	%g6,	%l1,	%l0
	lduh	[%l7 + 0x76],	%i7
	ldsw	[%l7 + 0x60],	%l4
	movne	%icc,	%l5,	%o3
	sdiv	%l6,	0x065A,	%o0
	movl	%xcc,	%o4,	%i1
	movn	%xcc,	%i0,	%l3
	setx loop_92, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_92: 	fnors	%f12,	%f20,	%f18
	fcmpgt32	%f4,	%f28,	%g2
	addcc	%g7,	%g5,	%o5
	sir	0x1C20
	andcc	%g1,	0x0298,	%o1
	smulcc	%i4,	0x0C4E,	%l2
	srax	%i3,	0x1B,	%i2
	udivcc	%o2,	0x036C,	%g3
	mulscc	%o7,	0x0090,	%g6
	fpadd16	%f16,	%f12,	%f28
	andcc	%l1,	0x0690,	%l0
	fmovdg	%xcc,	%f1,	%f29
	fpadd32s	%f14,	%f0,	%f15
	restore %i5, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %i7, %l6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o4,	%i1
	fandnot1	%f28,	%f30,	%f2
	andn	%o3,	0x1C3A,	%i0
	fmovrsgez	%g4,	%f16,	%f3
	andncc	%l3,	%o6,	%i6
	fmul8ulx16	%f10,	%f8,	%f12
	movrgez	%g2,	0x04A,	%g5
	stx	%o5,	[%l7 + 0x50]
	stx	%g7,	[%l7 + 0x70]
	sllx	%g1,	%i4,	%l2
	movl	%xcc,	%i3,	%o1
	sdivx	%i2,	0x1493,	%o2
	array32	%o7,	%g3,	%g6
	movleu	%icc,	%l0,	%l1
	fcmpgt16	%f24,	%f24,	%i5
	xorcc	%l4,	0x1076,	%l5
	fxnors	%f20,	%f15,	%f3
	st	%f16,	[%l7 + 0x58]
	fmovdg	%xcc,	%f0,	%f8
	movge	%xcc,	%l6,	%i7
	st	%f7,	[%l7 + 0x3C]
	ld	[%l7 + 0x0C],	%f8
	fcmpne32	%f22,	%f0,	%o4
	movvc	%xcc,	%o0,	%i1
	andn	%o3,	%g4,	%l3
	move	%icc,	%i0,	%o6
	movrgz	%i6,	0x312,	%g2
	fmovse	%xcc,	%f1,	%f29
	ldx	[%l7 + 0x08],	%o5
	stx	%g7,	[%l7 + 0x10]
	movrlez	%g5,	%i4,	%g1
	add	%i3,	%o1,	%i2
	movg	%xcc,	%o2,	%l2
	fxors	%f22,	%f16,	%f13
	smul	%g3,	0x1F06,	%g6
	fands	%f4,	%f15,	%f15
	addc	%l0,	0x03E3,	%o7
	ldsh	[%l7 + 0x26],	%i5
	fcmple32	%f12,	%f24,	%l1
	movne	%xcc,	%l5,	%l4
	mova	%xcc,	%i7,	%o4
	sdivx	%l6,	0x0107,	%o0
	ld	[%l7 + 0x54],	%f25
	faligndata	%f22,	%f28,	%f0
	array32	%o3,	%i1,	%l3
	movn	%icc,	%g4,	%o6
	edge8n	%i0,	%i6,	%o5
	sll	%g2,	0x00,	%g5
	mulscc	%i4,	%g1,	%g7
	fpadd16s	%f29,	%f24,	%f21
	ldsw	[%l7 + 0x68],	%o1
	fornot1	%f20,	%f28,	%f22
	fcmpne16	%f6,	%f18,	%i2
	fzeros	%f22
	movcc	%xcc,	%i3,	%o2
	fcmps	%fcc3,	%f16,	%f10
	array32	%g3,	%l2,	%l0
	fmovrsgez	%o7,	%f14,	%f31
	edge16n	%g6,	%l1,	%i5
	movle	%icc,	%l5,	%i7
	edge16ln	%o4,	%l6,	%l4
	array16	%o3,	%i1,	%l3
	movl	%xcc,	%g4,	%o6
	xorcc	%i0,	0x1F43,	%o0
	and	%i6,	0x0DDC,	%g2
	srax	%o5,	0x12,	%g5
	fcmpgt16	%f26,	%f10,	%i4
	fmovrslz	%g7,	%f12,	%f25
	lduw	[%l7 + 0x4C],	%g1
	movrlez	%o1,	0x20E,	%i2
	addcc	%i3,	0x06EF,	%o2
	popc	0x03B4,	%g3
	fmovdl	%icc,	%f2,	%f1
	stb	%l2,	[%l7 + 0x2F]
	sir	0x1AD1
	fmovscs	%icc,	%f1,	%f23
	sdiv	%o7,	0x1E27,	%l0
	fsrc2s	%f2,	%f0
	save %l1, 0x1265, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%g6,	%l5
	smulcc	%i7,	0x05FD,	%l6
	array32	%o4,	%o3,	%i1
	or	%l4,	0x1AFC,	%l3
	movleu	%icc,	%g4,	%i0
	move	%icc,	%o0,	%i6
	fmuld8ulx16	%f12,	%f31,	%f14
	addc	%g2,	0x12F3,	%o5
	edge8n	%g5,	%i4,	%g7
	fzero	%f20
	fabsd	%f20,	%f10
	mulx	%o6,	0x10CE,	%g1
	fxnors	%f16,	%f19,	%f17
	edge8l	%i2,	%i3,	%o1
	fmovscs	%xcc,	%f30,	%f15
	fmovdvs	%xcc,	%f21,	%f0
	edge16	%o2,	%l2,	%g3
	array32	%l0,	%o7,	%l1
	array16	%g6,	%i5,	%l5
	fxnor	%f30,	%f26,	%f2
	fandnot2s	%f9,	%f19,	%f20
	mulx	%l6,	%o4,	%o3
	or	%i1,	%l4,	%i7
	edge8	%g4,	%l3,	%i0
	sir	0x1476
	srax	%i6,	%o0,	%o5
	fmul8x16al	%f27,	%f10,	%f0
	movvs	%xcc,	%g5,	%i4
	fpadd32	%f24,	%f18,	%f22
	ldx	[%l7 + 0x28],	%g2
	umulcc	%g7,	%o6,	%g1
	sir	0x0C66
	fpsub32s	%f3,	%f6,	%f13
	srlx	%i3,	%o1,	%o2
	xnorcc	%i2,	0x1AEE,	%g3
	fmul8x16	%f3,	%f4,	%f2
	mova	%icc,	%l2,	%o7
	addc	%l1,	0x18A4,	%g6
	st	%f9,	[%l7 + 0x24]
	movrne	%i5,	0x2E2,	%l5
	move	%icc,	%l0,	%o4
	fmovsle	%xcc,	%f4,	%f0
	stx	%o3,	[%l7 + 0x40]
	or	%i1,	%l4,	%i7
	ldsh	[%l7 + 0x34],	%l6
	udivx	%l3,	0x0410,	%g4
	movpos	%icc,	%i0,	%i6
	fpack32	%f4,	%f12,	%f2
	movrne	%o5,	0x1A6,	%g5
	movcs	%xcc,	%i4,	%o0
	movg	%icc,	%g2,	%o6
	fmovsa	%icc,	%f2,	%f6
	fmovdg	%xcc,	%f10,	%f20
	fmul8sux16	%f6,	%f16,	%f8
	fmovsgu	%xcc,	%f5,	%f7
	fmovspos	%icc,	%f19,	%f8
	fones	%f12
	movgu	%xcc,	%g1,	%i3
	lduw	[%l7 + 0x08],	%g7
	ldsw	[%l7 + 0x24],	%o2
	std	%f6,	[%l7 + 0x10]
	fexpand	%f8,	%f24
	movcs	%xcc,	%o1,	%g3
	edge16n	%l2,	%i2,	%l1
	movrlz	%g6,	%o7,	%i5
	orncc	%l5,	%l0,	%o4
	edge16ln	%i1,	%o3,	%l4
	udivx	%l6,	0x142D,	%l3
	fxor	%f8,	%f16,	%f30
	alignaddrl	%i7,	%i0,	%g4
	fmul8ulx16	%f16,	%f26,	%f4
	fands	%f4,	%f0,	%f25
	fones	%f23
	srlx	%o5,	0x04,	%g5
	fors	%f22,	%f18,	%f29
	fcmpeq16	%f22,	%f26,	%i4
	edge32l	%o0,	%g2,	%o6
	edge32n	%i6,	%g1,	%i3
	movne	%xcc,	%g7,	%o2
	subcc	%o1,	%g3,	%l2
	edge32ln	%i2,	%l1,	%g6
	udiv	%o7,	0x151D,	%l5
	ldx	[%l7 + 0x38],	%l0
	orncc	%i5,	0x0578,	%o4
	fxnors	%f3,	%f18,	%f13
	edge8n	%i1,	%o3,	%l4
	fcmped	%fcc0,	%f6,	%f24
	alignaddr	%l3,	%i7,	%l6
	edge32l	%g4,	%o5,	%i0
	fnot2	%f28,	%f10
	fmovsneg	%icc,	%f21,	%f19
	fmul8x16al	%f19,	%f0,	%f28
	udivcc	%i4,	0x0447,	%g5
	mova	%icc,	%g2,	%o6
	and	%i6,	0x0292,	%g1
	movrgz	%o0,	0x31C,	%g7
	xnor	%i3,	%o2,	%o1
	fmovsg	%icc,	%f7,	%f10
	movrlez	%g3,	0x2F9,	%i2
	fnegd	%f30,	%f24
	movne	%icc,	%l2,	%l1
	umulcc	%o7,	0x0BB2,	%g6
	nop
	set	0x38, %i7
	lduh	[%l7 + %i7],	%l5
	edge8ln	%i5,	%l0,	%o4
	stx	%o3,	[%l7 + 0x50]
	edge32	%l4,	%l3,	%i7
	sdivcc	%i1,	0x1BB2,	%l6
	std	%f20,	[%l7 + 0x18]
	movcc	%xcc,	%o5,	%g4
	udiv	%i4,	0x05A2,	%i0
	stw	%g5,	[%l7 + 0x30]
	ldub	[%l7 + 0x10],	%o6
	save %g2, 0x053B, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o0,	%g1
	stb	%g7,	[%l7 + 0x21]
	sth	%o2,	[%l7 + 0x3A]
	fmovspos	%icc,	%f21,	%f21
	edge16l	%i3,	%o1,	%g3
	save %i2, 0x184D, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmped	%fcc0,	%f2,	%f16
	std	%f10,	[%l7 + 0x68]
	fnot2	%f24,	%f26
	array8	%o7,	%l2,	%l5
	lduh	[%l7 + 0x38],	%g6
	fnands	%f9,	%f31,	%f1
	addcc	%l0,	0x1241,	%i5
	edge8ln	%o4,	%o3,	%l4
	edge16	%l3,	%i1,	%i7
	fcmps	%fcc3,	%f10,	%f19
	movvs	%xcc,	%l6,	%o5
	movre	%g4,	%i4,	%g5
	stx	%o6,	[%l7 + 0x20]
	movgu	%icc,	%i0,	%i6
	movvs	%xcc,	%g2,	%o0
	edge16n	%g7,	%o2,	%g1
	fzero	%f14
	setx loop_93, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_93: 	fmovrdlz	%i2,	%f16,	%f20
	stw	%o1,	[%l7 + 0x18]
	fandnot2s	%f31,	%f29,	%f7
	ldd	[%l7 + 0x50],	%l0
	fandnot1s	%f25,	%f8,	%f27
	srlx	%o7,	0x15,	%l2
	siam	0x5
	smulcc	%g6,	%l5,	%i5
	movne	%xcc,	%o4,	%l0
	fmovdvc	%xcc,	%f28,	%f24
	move	%icc,	%o3,	%l3
	fnand	%f24,	%f14,	%f24
	st	%f12,	[%l7 + 0x30]
	orn	%l4,	%i7,	%l6
	movcc	%xcc,	%o5,	%g4
	fpsub16s	%f30,	%f31,	%f15
	fors	%f7,	%f14,	%f22
	sth	%i4,	[%l7 + 0x2A]
	fmovdgu	%icc,	%f18,	%f24
	save %g5, %o6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%i6,	%g2,	%i0
	orcc	%g7,	0x0098,	%o2
	edge16	%g1,	%i3,	%o0
	restore %i2, %o1, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	faligndata	%f26,	%f12,	%f20
	stx	%o7,	[%l7 + 0x28]
	movleu	%icc,	%l1,	%g6
	ldsb	[%l7 + 0x10],	%l5
	orcc	%i5,	%l2,	%o4
	fand	%f26,	%f18,	%f8
	std	%f28,	[%l7 + 0x38]
	sethi	0x1425,	%l0
	fornot1	%f10,	%f30,	%f10
	edge32n	%o3,	%l4,	%l3
	lduw	[%l7 + 0x7C],	%l6
	for	%f0,	%f14,	%f30
	lduh	[%l7 + 0x74],	%o5
	mulscc	%i7,	0x1904,	%g4
	edge8l	%g5,	%o6,	%i1
	stx	%i4,	[%l7 + 0x70]
	fcmpeq16	%f24,	%f26,	%i6
	orn	%g2,	0x1E25,	%g7
	alignaddr	%o2,	%g1,	%i3
	edge16n	%o0,	%i0,	%i2
	sir	0x045E
	ldd	[%l7 + 0x40],	%f22
	mova	%xcc,	%o1,	%g3
	movl	%icc,	%o7,	%g6
	orcc	%l1,	0x1EB2,	%i5
	edge8n	%l5,	%l2,	%o4
	ldsh	[%l7 + 0x16],	%l0
	movpos	%xcc,	%l4,	%o3
	addcc	%l3,	%o5,	%l6
	fmul8sux16	%f20,	%f26,	%f18
	fmovsneg	%icc,	%f1,	%f2
	movl	%xcc,	%g4,	%i7
	movvs	%icc,	%g5,	%o6
	fabsd	%f4,	%f18
	ldub	[%l7 + 0x4F],	%i4
	array8	%i1,	%i6,	%g7
	sll	%o2,	0x12,	%g2
	fornot1s	%f22,	%f23,	%f12
	movn	%xcc,	%g1,	%i3
	ldd	[%l7 + 0x58],	%o0
	orncc	%i0,	0x1A05,	%o1
	umul	%g3,	0x0B2D,	%o7
	movpos	%xcc,	%g6,	%l1
	movre	%i2,	0x3AE,	%l5
	array32	%i5,	%l2,	%o4
	fmuld8sux16	%f24,	%f0,	%f4
	orncc	%l4,	%o3,	%l3
	movrlez	%l0,	%l6,	%o5
	fmovsne	%icc,	%f30,	%f21
	umulcc	%g4,	0x04D0,	%g5
	fornot2	%f26,	%f0,	%f12
	fcmpeq16	%f26,	%f0,	%o6
	fpadd32s	%f10,	%f29,	%f26
	sdivcc	%i4,	0x17CF,	%i7
	sir	0x14B7
	edge32n	%i6,	%i1,	%o2
	fone	%f20
	umulcc	%g7,	%g2,	%g1
	addccc	%o0,	0x1B55,	%i0
	edge16ln	%o1,	%g3,	%o7
	udiv	%i3,	0x0E88,	%l1
	movl	%xcc,	%g6,	%l5
	popc	0x063E,	%i5
	ld	[%l7 + 0x3C],	%f3
	alignaddrl	%i2,	%o4,	%l2
	edge32l	%l4,	%o3,	%l3
	xnor	%l6,	%o5,	%g4
	addcc	%g5,	%l0,	%i4
	addc	%i7,	%o6,	%i6
	fmovse	%icc,	%f28,	%f20
	array8	%o2,	%g7,	%g2
	edge16ln	%i1,	%o0,	%i0
	udivx	%g1,	0x0A98,	%o1
	sethi	0x0C1E,	%g3
	array8	%o7,	%l1,	%i3
	smulcc	%l5,	0x1117,	%g6
	fpsub16s	%f24,	%f24,	%f10
	fnot1s	%f10,	%f14
	fcmps	%fcc2,	%f17,	%f3
	array32	%i5,	%o4,	%i2
	srlx	%l2,	%o3,	%l3
	mulscc	%l4,	0x0773,	%o5
	movcc	%icc,	%l6,	%g5
	edge8n	%l0,	%g4,	%i7
	faligndata	%f14,	%f0,	%f6
	stw	%o6,	[%l7 + 0x40]
	stb	%i6,	[%l7 + 0x14]
	addcc	%o2,	%i4,	%g7
	fmovrsgez	%g2,	%f24,	%f5
	fmovsne	%xcc,	%f4,	%f30
	xnorcc	%o0,	0x1F25,	%i1
	fmovsleu	%icc,	%f24,	%f20
	orcc	%g1,	0x048E,	%i0
	movre	%o1,	0x13A,	%g3
	ldd	[%l7 + 0x78],	%f10
	ldsb	[%l7 + 0x5B],	%l1
	edge8ln	%o7,	%l5,	%g6
	edge8ln	%i3,	%o4,	%i5
	srax	%l2,	%o3,	%i2
	fcmpgt32	%f24,	%f2,	%l3
	alignaddr	%l4,	%l6,	%g5
	bshuffle	%f28,	%f20,	%f14
	std	%f28,	[%l7 + 0x18]
	popc	%l0,	%o5
	fcmpd	%fcc2,	%f4,	%f14
	add	%i7,	0x1899,	%o6
	alignaddrl	%i6,	%o2,	%i4
	sdiv	%g4,	0x0916,	%g7
	fsrc1s	%f29,	%f14
	fpackfix	%f18,	%f4
	alignaddr	%g2,	%i1,	%o0
	edge32n	%g1,	%o1,	%g3
	ldsw	[%l7 + 0x30],	%i0
	ldub	[%l7 + 0x14],	%o7
	addcc	%l1,	%l5,	%i3
	sra	%o4,	%i5,	%g6
	sethi	0x0B8C,	%l2
	udiv	%o3,	0x09D7,	%i2
	movneg	%icc,	%l4,	%l3
	or	%g5,	0x0080,	%l6
	subccc	%o5,	0x0A9C,	%l0
	orn	%i7,	0x1E31,	%i6
	srlx	%o6,	0x06,	%i4
	save %g4, %o2, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%g7,	%i1
	nop
	set	0x21, %g6
	ldub	[%l7 + %g6],	%o0
	sll	%o1,	%g1,	%i0
	sethi	0x1A29,	%o7
	movneg	%xcc,	%g3,	%l5
	popc	%l1,	%i3
	nop
	set	0x68, %o6
	std	%f26,	[%l7 + %o6]
	sth	%o4,	[%l7 + 0x42]
	fnot1s	%f13,	%f9
	movcc	%icc,	%i5,	%l2
	xnor	%g6,	%o3,	%l4
	sra	%l3,	0x17,	%i2
	fexpand	%f15,	%f28
	movvc	%icc,	%g5,	%l6
	fpackfix	%f8,	%f19
	edge16n	%o5,	%l0,	%i7
	and	%i6,	%o6,	%g4
	fmovrse	%i4,	%f14,	%f18
	fmovrse	%o2,	%f6,	%f27
	subc	%g7,	0x1DB1,	%i1
	movn	%xcc,	%g2,	%o0
	sra	%g1,	0x13,	%i0
	xor	%o1,	%g3,	%o7
	xorcc	%l5,	0x1049,	%l1
	umulcc	%o4,	%i3,	%i5
	addc	%g6,	%o3,	%l4
	fexpand	%f8,	%f24
	andncc	%l3,	%l2,	%g5
	array16	%i2,	%o5,	%l0
	fpack32	%f8,	%f26,	%f6
	edge32ln	%l6,	%i6,	%o6
	fmovrsne	%g4,	%f7,	%f2
	fmovsvc	%xcc,	%f10,	%f12
	movrgz	%i7,	%o2,	%g7
	ldsh	[%l7 + 0x5A],	%i1
	movrgz	%g2,	%i4,	%g1
	sir	0x090A
	fxnors	%f0,	%f23,	%f8
	sir	0x1298
	umul	%i0,	0x0969,	%o1
	edge16	%g3,	%o0,	%o7
	fmovrdlez	%l5,	%f18,	%f20
	umulcc	%o4,	%i3,	%l1
	sdivcc	%i5,	0x07DB,	%o3
	fmovrdgez	%g6,	%f8,	%f10
	srl	%l4,	0x15,	%l3
	sdivx	%l2,	0x1223,	%i2
	umul	%g5,	%l0,	%l6
	fnand	%f8,	%f30,	%f26
	fmul8x16al	%f4,	%f28,	%f26
	smul	%o5,	%i6,	%g4
	movleu	%icc,	%i7,	%o6
	fmovsleu	%xcc,	%f11,	%f1
	edge8	%o2,	%i1,	%g7
	xor	%g2,	0x0D18,	%g1
	fzero	%f18
	udivx	%i4,	0x1153,	%i0
	and	%o1,	0x037F,	%g3
	edge32ln	%o0,	%l5,	%o4
	std	%f10,	[%l7 + 0x38]
	fmovrdne	%o7,	%f8,	%f22
	ld	[%l7 + 0x3C],	%f0
	srl	%l1,	0x0D,	%i3
	srlx	%o3,	0x17,	%i5
	fmovdpos	%xcc,	%f10,	%f8
	xnor	%g6,	0x0164,	%l4
	orcc	%l2,	%l3,	%g5
	fmovscc	%icc,	%f15,	%f30
	fmovrslez	%l0,	%f5,	%f17
	for	%f0,	%f16,	%f16
	fmuld8ulx16	%f22,	%f0,	%f0
	ldx	[%l7 + 0x48],	%i2
	movle	%icc,	%o5,	%l6
	movle	%icc,	%g4,	%i6
	movneg	%icc,	%i7,	%o2
	fmovdcc	%xcc,	%f25,	%f23
	movge	%icc,	%o6,	%g7
	movgu	%icc,	%i1,	%g1
	mulscc	%g2,	%i0,	%i4
	smul	%o1,	0x0A01,	%g3
	fmovsg	%xcc,	%f13,	%f6
	xor	%o0,	%o4,	%l5
	setx loop_94, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_94: 	edge8ln	%o3,	%g6,	%i5
	fsrc2s	%f12,	%f16
	sir	0x116B
	or	%l4,	0x0A51,	%l2
	srlx	%l3,	0x0D,	%l0
	srl	%i2,	0x1C,	%g5
	movn	%xcc,	%l6,	%o5
	fsrc2s	%f13,	%f22
	edge32l	%g4,	%i7,	%i6
	andncc	%o6,	%o2,	%i1
	movcs	%icc,	%g1,	%g7
	edge16	%g2,	%i4,	%i0
	andn	%o1,	%o0,	%o4
	sllx	%g3,	0x14,	%l1
	ld	[%l7 + 0x64],	%f13
	stb	%l5,	[%l7 + 0x79]
	smul	%i3,	%o7,	%g6
	movrlez	%i5,	%l4,	%o3
	movrgz	%l3,	%l2,	%i2
	array16	%g5,	%l0,	%o5
	alignaddr	%g4,	%i7,	%l6
	st	%f29,	[%l7 + 0x24]
	srax	%o6,	%o2,	%i1
	edge32n	%i6,	%g7,	%g2
	alignaddr	%g1,	%i0,	%o1
	sllx	%i4,	0x17,	%o4
	movl	%xcc,	%g3,	%l1
	udivx	%l5,	0x025F,	%o0
	andncc	%i3,	%g6,	%o7
	fmovdcs	%xcc,	%f27,	%f17
	array16	%i5,	%l4,	%l3
	lduh	[%l7 + 0x3A],	%l2
	fmovsn	%icc,	%f29,	%f25
	fands	%f18,	%f31,	%f2
	fmovrdlez	%i2,	%f30,	%f20
	xnor	%g5,	%l0,	%o5
	xnorcc	%g4,	0x0A81,	%o3
	sdiv	%l6,	0x074E,	%o6
	udiv	%i7,	0x1ADF,	%i1
	movpos	%icc,	%o2,	%i6
	sdivx	%g7,	0x093D,	%g1
	ldsh	[%l7 + 0x6A],	%g2
	mulscc	%i0,	%o1,	%i4
	edge32l	%g3,	%l1,	%o4
	andncc	%o0,	%i3,	%l5
	array16	%o7,	%g6,	%l4
	fmovrsne	%i5,	%f1,	%f23
	mulscc	%l3,	0x05CB,	%l2
	xnorcc	%i2,	0x09CD,	%g5
	fcmps	%fcc2,	%f19,	%f5
	orncc	%o5,	0x1687,	%g4
	udiv	%l0,	0x1BBF,	%l6
	and	%o3,	0x1E1E,	%i7
	movg	%icc,	%i1,	%o2
	movrlez	%o6,	0x387,	%i6
	st	%f1,	[%l7 + 0x70]
	udivx	%g1,	0x1290,	%g2
	movn	%icc,	%i0,	%g7
	fpadd16	%f14,	%f26,	%f24
	umul	%o1,	0x1475,	%i4
	ldub	[%l7 + 0x6F],	%l1
	fpadd32	%f26,	%f22,	%f30
	addc	%o4,	0x0577,	%o0
	restore %i3, 0x0232, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnot2	%f18,	%f10
	fpack32	%f16,	%f26,	%f10
	udivcc	%l5,	0x00A2,	%o7
	andcc	%l4,	%i5,	%g6
	edge16l	%l3,	%i2,	%g5
	xnor	%o5,	%l2,	%l0
	fmovdvs	%xcc,	%f7,	%f28
	edge32ln	%l6,	%g4,	%o3
	fmuld8ulx16	%f31,	%f28,	%f8
	srl	%i7,	%o2,	%i1
	xorcc	%i6,	%g1,	%o6
	movpos	%icc,	%g2,	%g7
	subcc	%i0,	0x0184,	%o1
	edge16	%l1,	%o4,	%i4
	addc	%o0,	%g3,	%l5
	array16	%i3,	%o7,	%i5
	edge8ln	%l4,	%g6,	%i2
	udivcc	%l3,	0x1364,	%g5
	addc	%l2,	%o5,	%l0
	sethi	0x17C8,	%g4
	movrlz	%o3,	0x07F,	%l6
	movrlz	%o2,	%i7,	%i1
	fmovdvc	%xcc,	%f15,	%f5
	stw	%g1,	[%l7 + 0x28]
	movrgz	%o6,	0x10E,	%i6
	movcs	%xcc,	%g2,	%i0
	array32	%o1,	%l1,	%g7
	ldsb	[%l7 + 0x69],	%i4
	edge8l	%o4,	%o0,	%l5
	fxnor	%f22,	%f8,	%f6
	orn	%i3,	%o7,	%i5
	fxnor	%f18,	%f26,	%f4
	sth	%g3,	[%l7 + 0x60]
	fmovrsgz	%l4,	%f16,	%f30
	edge32ln	%g6,	%i2,	%l3
	fmovs	%f0,	%f11
	orn	%g5,	0x034B,	%o5
	movcc	%icc,	%l0,	%g4
	movneg	%icc,	%l2,	%o3
	fmovrdlz	%o2,	%f16,	%f26
	fornot2	%f12,	%f8,	%f30
	edge16l	%l6,	%i7,	%i1
	ldsb	[%l7 + 0x42],	%o6
	faligndata	%f14,	%f6,	%f12
	addc	%i6,	%g1,	%g2
	fmovrdlez	%o1,	%f28,	%f6
	xor	%i0,	%g7,	%i4
	movn	%icc,	%o4,	%o0
	fmovscs	%xcc,	%f8,	%f18
	xor	%l5,	0x072D,	%l1
	array32	%i3,	%i5,	%g3
	stw	%l4,	[%l7 + 0x4C]
	sth	%o7,	[%l7 + 0x36]
	movcs	%xcc,	%i2,	%l3
	movneg	%icc,	%g5,	%o5
	save %g6, 0x1AEE, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l0,	%l2,	%o3
	ldsh	[%l7 + 0x40],	%l6
	edge16ln	%o2,	%i7,	%o6
	movcc	%icc,	%i1,	%g1
	fandnot1s	%f22,	%f13,	%f29
	sllx	%i6,	%o1,	%i0
	fandnot1	%f0,	%f14,	%f14
	edge32l	%g2,	%i4,	%o4
	udiv	%o0,	0x0E2B,	%l5
	movrlz	%l1,	%i3,	%g7
	edge32n	%i5,	%l4,	%g3
	and	%i2,	0x1D85,	%o7
	or	%l3,	0x08BA,	%g5
	udivx	%o5,	0x040C,	%g6
	srl	%g4,	%l0,	%o3
	movl	%icc,	%l6,	%l2
	ldub	[%l7 + 0x1F],	%i7
	fpadd32	%f20,	%f0,	%f22
	popc	%o6,	%i1
	subcc	%o2,	%i6,	%g1
	bshuffle	%f8,	%f10,	%f30
	xnorcc	%i0,	0x1BA4,	%o1
	edge32ln	%g2,	%o4,	%i4
	movrlez	%l5,	%l1,	%o0
	popc	0x1448,	%i3
	edge8l	%i5,	%l4,	%g3
	ldub	[%l7 + 0x0D],	%g7
	movvs	%xcc,	%o7,	%l3
	fsrc2s	%f0,	%f20
	fpsub16	%f30,	%f18,	%f4
	and	%i2,	0x0DE1,	%o5
	srl	%g6,	%g5,	%g4
	or	%o3,	0x0B31,	%l0
	fnot1s	%f19,	%f11
	fmovrsgz	%l2,	%f29,	%f24
	fmul8x16	%f17,	%f30,	%f28
	save %i7, %o6, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f25,	%f9,	%f18
	xnorcc	%o2,	%l6,	%i6
	movge	%icc,	%i0,	%o1
	movle	%xcc,	%g2,	%g1
	st	%f20,	[%l7 + 0x78]
	setx loop_95, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_95: 	lduw	[%l7 + 0x64],	%l5
	std	%f26,	[%l7 + 0x08]
	move	%xcc,	%o0,	%i3
	xor	%i5,	%l1,	%l4
	move	%xcc,	%g3,	%o7
	fand	%f10,	%f26,	%f10
	fmovrse	%l3,	%f13,	%f6
	ldd	[%l7 + 0x28],	%f28
	sdivx	%g7,	0x08DF,	%o5
	and	%i2,	%g5,	%g6
	xorcc	%g4,	%o3,	%l2
	restore %i7, 0x17A3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%i1,	%o2
	fcmple16	%f14,	%f20,	%l6
	ldsb	[%l7 + 0x66],	%o6
	movge	%xcc,	%i0,	%i6
	fpadd32	%f14,	%f6,	%f2
	ldub	[%l7 + 0x52],	%g2
	fpsub32s	%f29,	%f26,	%f22
	andncc	%g1,	%o1,	%i4
	udiv	%o4,	0x1EAC,	%l5
	edge16	%o0,	%i5,	%i3
	xnor	%l1,	%l4,	%g3
	fmovs	%f23,	%f16
	fmovsneg	%icc,	%f23,	%f23
	srl	%l3,	0x19,	%g7
	edge8ln	%o7,	%i2,	%o5
	edge16n	%g6,	%g5,	%o3
	fmovsn	%icc,	%f7,	%f26
	movle	%icc,	%l2,	%i7
	edge32n	%g4,	%l0,	%o2
	add	%l6,	%o6,	%i0
	sdiv	%i6,	0x1D29,	%g2
	fandnot1s	%f13,	%f12,	%f15
	fxnors	%f3,	%f31,	%f14
	ldsh	[%l7 + 0x6A],	%g1
	udivx	%o1,	0x19F7,	%i4
	movgu	%icc,	%o4,	%l5
	nop
	set	0x59, %o7
	ldsb	[%l7 + %o7],	%i1
	movgu	%icc,	%o0,	%i3
	save %l1, 0x11F0, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g3,	0x1B2E,	%l3
	alignaddr	%i5,	%o7,	%i2
	sllx	%o5,	%g7,	%g6
	movne	%icc,	%o3,	%g5
	sth	%l2,	[%l7 + 0x48]
	sth	%i7,	[%l7 + 0x38]
	movcs	%xcc,	%g4,	%o2
	fpsub16s	%f25,	%f29,	%f0
	fsrc1s	%f12,	%f17
	andn	%l6,	%o6,	%i0
	edge16ln	%i6,	%g2,	%l0
	fmovrde	%g1,	%f10,	%f10
	movcc	%icc,	%o1,	%i4
	bshuffle	%f18,	%f24,	%f24
	ldd	[%l7 + 0x48],	%l4
	fexpand	%f11,	%f6
	stb	%i1,	[%l7 + 0x34]
	lduw	[%l7 + 0x20],	%o0
	edge32	%i3,	%o4,	%l1
	ld	[%l7 + 0x34],	%f0
	and	%l4,	0x16E3,	%l3
	fzeros	%f4
	fmovdcs	%xcc,	%f9,	%f12
	ldd	[%l7 + 0x58],	%i4
	edge16l	%o7,	%g3,	%o5
	movvs	%xcc,	%g7,	%i2
	stx	%o3,	[%l7 + 0x28]
	sll	%g5,	0x10,	%l2
	fxor	%f24,	%f2,	%f16
	sdivx	%g6,	0x0BA0,	%i7
	save %g4, 0x1222, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f19,	%f26
	fsrc2	%f10,	%f20
	edge8n	%l6,	%i0,	%o6
	sethi	0x0C50,	%i6
	movrlez	%l0,	0x0C3,	%g1
	fmovdgu	%xcc,	%f22,	%f4
	add	%o1,	0x1AE1,	%i4
	nop
	set	0x38, %o0
	ldd	[%l7 + %o0],	%l4
	edge32n	%i1,	%o0,	%g2
	edge16ln	%i3,	%o4,	%l4
	fcmped	%fcc2,	%f4,	%f20
	mulscc	%l1,	%l3,	%o7
	mova	%icc,	%g3,	%o5
	movne	%xcc,	%i5,	%i2
	fnands	%f6,	%f13,	%f20
	edge8l	%g7,	%o3,	%l2
	ldub	[%l7 + 0x27],	%g5
	sethi	0x03D7,	%g6
	ldub	[%l7 + 0x68],	%i7
	ldsw	[%l7 + 0x64],	%o2
	umul	%g4,	%l6,	%o6
	mulx	%i6,	%l0,	%g1
	edge8ln	%o1,	%i4,	%l5
	ldx	[%l7 + 0x78],	%i1
	fmovrdgz	%i0,	%f4,	%f28
	orcc	%g2,	0x04B8,	%i3
	sdivx	%o0,	0x1FEF,	%l4
	setx loop_96, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_96: 	edge8	%l3,	%g3,	%o5
	movleu	%icc,	%o7,	%i2
	ldub	[%l7 + 0x49],	%i5
	movcc	%xcc,	%g7,	%o3
	addcc	%l2,	0x0654,	%g6
	mulx	%g5,	0x1918,	%i7
	ldsb	[%l7 + 0x40],	%o2
	edge16l	%l6,	%o6,	%i6
	orcc	%l0,	%g4,	%g1
	edge32ln	%o1,	%l5,	%i4
	or	%i1,	%i0,	%g2
	alignaddrl	%o0,	%i3,	%l4
	xnor	%l1,	0x08B0,	%o4
	fmovdge	%xcc,	%f15,	%f17
	umul	%g3,	0x1FBB,	%l3
	fandnot1	%f12,	%f12,	%f30
	lduw	[%l7 + 0x78],	%o7
	save %i2, %i5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdpos	%icc,	%f11,	%f27
	edge8n	%o3,	%o5,	%l2
	array32	%g6,	%g5,	%o2
	fmovrdlez	%l6,	%f14,	%f10
	fmovse	%icc,	%f28,	%f29
	fandnot2s	%f11,	%f3,	%f16
	subccc	%i7,	%i6,	%o6
	fones	%f2
	srax	%l0,	0x05,	%g4
	sllx	%g1,	%o1,	%i4
	movpos	%icc,	%i1,	%i0
	edge32ln	%g2,	%o0,	%l5
	movg	%xcc,	%i3,	%l4
	subcc	%l1,	0x1739,	%o4
	mulx	%g3,	0x1FB4,	%o7
	movvs	%xcc,	%i2,	%l3
	movrlez	%i5,	0x15C,	%g7
	restore %o5, 0x0D8E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32	%l2,	%g6,	%g5
	movcc	%icc,	%o2,	%l6
	ldx	[%l7 + 0x18],	%i7
	addccc	%i6,	%l0,	%g4
	movrlz	%g1,	%o6,	%o1
	fmovd	%f0,	%f24
	edge8l	%i4,	%i0,	%g2
	sethi	0x1038,	%o0
	array16	%l5,	%i1,	%i3
	movleu	%icc,	%l4,	%o4
	movne	%xcc,	%l1,	%o7
	srlx	%i2,	0x03,	%g3
	stb	%l3,	[%l7 + 0x7E]
	fmovscs	%icc,	%f20,	%f29
	edge8ln	%i5,	%o5,	%g7
	movgu	%icc,	%l2,	%g6
	ldd	[%l7 + 0x68],	%f22
	st	%f29,	[%l7 + 0x5C]
	and	%o3,	0x0ECE,	%o2
	edge16l	%g5,	%i7,	%i6
	movpos	%icc,	%l6,	%l0
	fsrc2	%f24,	%f10
	fones	%f14
	andcc	%g1,	%o6,	%o1
	edge32	%i4,	%i0,	%g2
	sra	%o0,	%l5,	%i1
	movl	%xcc,	%g4,	%i3
	edge16ln	%l4,	%l1,	%o4
	edge16ln	%o7,	%g3,	%l3
	ld	[%l7 + 0x68],	%f14
	fmovdcs	%xcc,	%f2,	%f7
	ldd	[%l7 + 0x68],	%i4
	mulx	%i2,	%g7,	%l2
	umulcc	%g6,	%o5,	%o3
	edge16l	%g5,	%o2,	%i7
	stb	%i6,	[%l7 + 0x2D]
	fandnot2s	%f6,	%f23,	%f25
	fmovd	%f12,	%f12
	stx	%l0,	[%l7 + 0x10]
	sethi	0x1EE6,	%g1
	ldd	[%l7 + 0x40],	%i6
	fmovrse	%o1,	%f0,	%f30
	sdivcc	%o6,	0x0E27,	%i4
	popc	%i0,	%g2
	mulx	%l5,	%o0,	%g4
	movle	%xcc,	%i1,	%i3
	sdivcc	%l1,	0x0E2E,	%o4
	movrne	%o7,	0x05E,	%l4
	mulscc	%g3,	%l3,	%i2
	ld	[%l7 + 0x70],	%f10
	movge	%icc,	%g7,	%l2
	movvs	%xcc,	%g6,	%i5
	fnot2	%f24,	%f2
	ldd	[%l7 + 0x08],	%o4
	move	%icc,	%g5,	%o3
	fmovdneg	%xcc,	%f12,	%f0
	edge8	%i7,	%i6,	%o2
	ldx	[%l7 + 0x40],	%g1
	movle	%xcc,	%l6,	%l0
	subccc	%o1,	0x0C03,	%o6
	array16	%i4,	%g2,	%i0
	stw	%o0,	[%l7 + 0x24]
	fmovrde	%g4,	%f16,	%f26
	or	%i1,	%i3,	%l1
	movne	%xcc,	%l5,	%o7
	movrgez	%o4,	0x023,	%g3
	fnot2s	%f8,	%f13
	srax	%l4,	0x1F,	%i2
	fmovrslz	%g7,	%f17,	%f21
	fsrc2	%f4,	%f22
	sethi	0x1931,	%l2
	sir	0x0AC2
	movneg	%icc,	%l3,	%g6
	movrgez	%i5,	0x305,	%g5
	ldx	[%l7 + 0x40],	%o3
	addccc	%o5,	0x0A8A,	%i6
	movrgz	%i7,	0x343,	%o2
	movge	%icc,	%l6,	%g1
	edge16	%l0,	%o1,	%i4
	fabss	%f8,	%f19
	umulcc	%o6,	%i0,	%o0
	fcmpne32	%f6,	%f28,	%g4
	movrgz	%g2,	%i1,	%i3
	stw	%l5,	[%l7 + 0x50]
	ldsw	[%l7 + 0x5C],	%l1
	move	%icc,	%o7,	%g3
	or	%l4,	0x0888,	%i2
	nop
	set	0x52, %i1
	sth	%o4,	[%l7 + %i1]
	ldsh	[%l7 + 0x48],	%l2
	edge16	%l3,	%g7,	%g6
	ldsh	[%l7 + 0x3E],	%g5
	alignaddr	%o3,	%i5,	%i6
	ldsb	[%l7 + 0x35],	%o5
	smulcc	%i7,	%l6,	%g1
	srl	%o2,	%l0,	%i4
	orn	%o6,	0x13AE,	%o1
	addccc	%o0,	%i0,	%g4
	move	%icc,	%g2,	%i1
	movvc	%xcc,	%l5,	%l1
	edge8n	%i3,	%o7,	%g3
	movvs	%icc,	%l4,	%o4
	movle	%icc,	%l2,	%i2
	orcc	%l3,	0x1D95,	%g7
	movle	%icc,	%g5,	%o3
	fornot1	%f20,	%f6,	%f26
	sub	%g6,	0x1A93,	%i5
	edge16	%i6,	%i7,	%l6
	fmuld8sux16	%f25,	%f31,	%f8
	fmovdle	%icc,	%f19,	%f27
	fexpand	%f18,	%f24
	fandnot2	%f2,	%f8,	%f8
	sth	%o5,	[%l7 + 0x78]
	mova	%icc,	%o2,	%g1
	stb	%i4,	[%l7 + 0x6B]
	xnor	%l0,	%o1,	%o6
	subcc	%o0,	0x14C2,	%i0
	fmovdpos	%xcc,	%f19,	%f17
	pdist	%f26,	%f0,	%f4
	fmovsneg	%xcc,	%f13,	%f6
	ld	[%l7 + 0x20],	%f27
	stb	%g4,	[%l7 + 0x31]
	sll	%g2,	%i1,	%l5
	movn	%icc,	%i3,	%l1
	smulcc	%o7,	0x1931,	%l4
	edge32	%o4,	%g3,	%i2
	orncc	%l2,	%l3,	%g7
	ldsh	[%l7 + 0x14],	%g5
	fmul8x16	%f25,	%f16,	%f12
	sllx	%g6,	0x0F,	%o3
	edge32ln	%i6,	%i7,	%l6
	fcmpes	%fcc0,	%f13,	%f15
	movpos	%xcc,	%i5,	%o5
	fmovsvc	%icc,	%f4,	%f25
	edge8ln	%o2,	%g1,	%l0
	fmovse	%xcc,	%f1,	%f26
	movcs	%icc,	%i4,	%o1
	or	%o0,	%o6,	%i0
	mova	%icc,	%g4,	%g2
	xnor	%i1,	0x1289,	%i3
	movvs	%xcc,	%l1,	%l5
	edge32l	%o7,	%l4,	%o4
	fzeros	%f13
	fmovdg	%xcc,	%f5,	%f7
	andn	%i2,	%l2,	%l3
	edge8ln	%g3,	%g5,	%g7
	movrlz	%o3,	%i6,	%i7
	udiv	%l6,	0x0427,	%i5
	xnor	%o5,	0x0EDE,	%o2
	array16	%g1,	%l0,	%i4
	edge16ln	%o1,	%o0,	%g6
	edge8n	%o6,	%g4,	%i0
	movgu	%icc,	%g2,	%i1
	fmovdle	%icc,	%f22,	%f27
	movg	%xcc,	%i3,	%l1
	movn	%icc,	%o7,	%l5
	move	%xcc,	%o4,	%i2
	ldx	[%l7 + 0x50],	%l2
	alignaddrl	%l3,	%g3,	%l4
	udiv	%g5,	0x0A42,	%o3
	fmovrdgez	%g7,	%f4,	%f24
	movge	%xcc,	%i7,	%i6
	fmul8x16al	%f23,	%f12,	%f16
	edge32ln	%l6,	%o5,	%o2
	xnor	%g1,	0x026A,	%i5
	fpack16	%f0,	%f4
	array32	%l0,	%i4,	%o0
	andn	%o1,	0x0DA2,	%o6
	fandnot2s	%f17,	%f26,	%f12
	umul	%g6,	0x1BB2,	%g4
	ldx	[%l7 + 0x70],	%g2
	fpadd16	%f10,	%f26,	%f24
	addccc	%i0,	%i1,	%i3
	udiv	%l1,	0x08D7,	%o7
	edge16n	%o4,	%l5,	%i2
	fcmpgt32	%f4,	%f28,	%l3
	mova	%xcc,	%l2,	%l4
	ldsh	[%l7 + 0x18],	%g3
	fors	%f9,	%f23,	%f6
	movvc	%icc,	%g5,	%g7
	ldx	[%l7 + 0x38],	%i7
	array16	%i6,	%o3,	%o5
	stw	%l6,	[%l7 + 0x38]
	edge16ln	%o2,	%g1,	%i5
	fmovdl	%icc,	%f28,	%f4
	movl	%xcc,	%i4,	%o0
	alignaddrl	%l0,	%o6,	%o1
	fmuld8sux16	%f21,	%f21,	%f20
	sllx	%g4,	%g2,	%i0
	nop
	set	0x0E, %l0
	ldsh	[%l7 + %l0],	%g6
	andn	%i3,	0x16E0,	%i1
	orncc	%o7,	0x05EC,	%l1
	fcmpgt32	%f2,	%f6,	%o4
	sir	0x0A8D
	subcc	%l5,	%i2,	%l2
	xnorcc	%l4,	0x1845,	%l3
	alignaddr	%g3,	%g7,	%g5
	movl	%icc,	%i7,	%i6
	sth	%o5,	[%l7 + 0x62]
	xnor	%o3,	0x1E08,	%o2
	andncc	%g1,	%l6,	%i5
	edge16n	%o0,	%i4,	%l0
	fpadd32	%f10,	%f10,	%f12
	fmovrsgez	%o6,	%f25,	%f18
	movcc	%xcc,	%o1,	%g2
	umul	%g4,	%g6,	%i0
	movpos	%icc,	%i1,	%o7
	movleu	%icc,	%l1,	%o4
	ldd	[%l7 + 0x20],	%l4
	fmovrsne	%i2,	%f8,	%f18
	subccc	%i3,	0x037A,	%l4
	ldsb	[%l7 + 0x6E],	%l3
	udivx	%g3,	0x00DD,	%g7
	ld	[%l7 + 0x78],	%f15
	smul	%g5,	%i7,	%l2
	udivcc	%i6,	0x1E63,	%o5
	fands	%f18,	%f4,	%f6
	fnor	%f14,	%f8,	%f24
	sdiv	%o3,	0x12B4,	%g1
	sdivx	%o2,	0x05F2,	%i5
	sra	%o0,	0x13,	%i4
	fmovrsne	%l0,	%f21,	%f26
	movvs	%icc,	%l6,	%o1
	save %o6, 0x1CDA, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%g4,	%i0,	%i1
	subcc	%o7,	%l1,	%o4
	fsrc1s	%f27,	%f4
	popc	%l5,	%i2
	udiv	%i3,	0x0E52,	%l4
	smulcc	%l3,	0x05BE,	%g3
	smul	%g7,	%g5,	%g6
	edge8ln	%l2,	%i7,	%o5
	sdivcc	%i6,	0x1CC5,	%o3
	fmovde	%xcc,	%f4,	%f4
	fpadd16	%f22,	%f0,	%f26
	movcs	%xcc,	%o2,	%i5
	std	%f22,	[%l7 + 0x70]
	fxors	%f8,	%f21,	%f24
	movle	%icc,	%o0,	%g1
	movrgz	%i4,	0x381,	%l6
	movn	%xcc,	%l0,	%o1
	lduw	[%l7 + 0x70],	%g2
	alignaddrl	%g4,	%o6,	%i1
	fcmpgt32	%f12,	%f8,	%i0
	move	%xcc,	%o7,	%l1
	andncc	%l5,	%o4,	%i3
	mova	%icc,	%i2,	%l3
	movne	%xcc,	%g3,	%l4
	ldsw	[%l7 + 0x38],	%g7
	sdivcc	%g5,	0x1D86,	%g6
	fmovde	%xcc,	%f11,	%f7
	stx	%i7,	[%l7 + 0x38]
	setx loop_97, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_97: 	fnot1s	%f19,	%f8
	edge16ln	%l2,	%o2,	%i5
	fpmerge	%f1,	%f11,	%f20
	fmovrdlez	%o0,	%f12,	%f2
	movcc	%xcc,	%i4,	%g1
	restore %l0, 0x0AD1, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8ulx16	%f2,	%f14,	%f30
	movcc	%icc,	%g2,	%g4
	array16	%o1,	%i1,	%o6
	edge32	%o7,	%i0,	%l1
	xnorcc	%o4,	0x0972,	%i3
	ldd	[%l7 + 0x20],	%l4
	movg	%icc,	%i2,	%g3
	movre	%l4,	0x34A,	%g7
	lduh	[%l7 + 0x18],	%g5
	udivx	%g6,	0x1929,	%i7
	movle	%icc,	%o5,	%i6
	edge8n	%o3,	%l2,	%o2
	movpos	%xcc,	%l3,	%i5
	smulcc	%o0,	%g1,	%i4
	fandnot1	%f14,	%f10,	%f26
	sethi	0x0399,	%l0
	save %g2, %g4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x30],	%l6
	fands	%f22,	%f30,	%f13
	movvs	%xcc,	%o6,	%i1
	srax	%i0,	%o7,	%o4
	stb	%l1,	[%l7 + 0x63]
	fornot2	%f6,	%f6,	%f16
	sir	0x17C4
	st	%f15,	[%l7 + 0x38]
	pdist	%f26,	%f12,	%f22
	nop
	set	0x2A, %o4
	stb	%i3,	[%l7 + %o4]
	xnor	%i2,	0x0AE7,	%g3
	edge32l	%l4,	%l5,	%g5
	stb	%g6,	[%l7 + 0x37]
	popc	0x014F,	%g7
	std	%f4,	[%l7 + 0x50]
	fxor	%f16,	%f6,	%f24
	movg	%xcc,	%i7,	%o5
	fmovsvc	%xcc,	%f3,	%f25
	addcc	%o3,	0x1C3F,	%i6
	movneg	%icc,	%o2,	%l3
	stb	%i5,	[%l7 + 0x70]
	edge32	%l2,	%g1,	%i4
	sdivx	%l0,	0x12A0,	%g2
	fcmple32	%f0,	%f24,	%o0
	edge16n	%g4,	%o1,	%o6
	smul	%i1,	0x1A58,	%l6
	ldub	[%l7 + 0x1D],	%o7
	srlx	%i0,	0x1F,	%o4
	fmovdcs	%icc,	%f16,	%f11
	sdivcc	%i3,	0x0844,	%l1
	movgu	%icc,	%g3,	%l4
	st	%f2,	[%l7 + 0x3C]
	stw	%i2,	[%l7 + 0x24]
	sll	%g5,	0x0B,	%l5
	ldx	[%l7 + 0x40],	%g7
	sdivx	%i7,	0x16AC,	%g6
	st	%f9,	[%l7 + 0x40]
	array8	%o3,	%i6,	%o5
	array8	%l3,	%o2,	%i5
	fcmpeq16	%f10,	%f20,	%g1
	umul	%i4,	0x1E86,	%l0
	udivx	%g2,	0x0B59,	%l2
	xor	%g4,	%o1,	%o0
	fmovdg	%icc,	%f3,	%f26
	fcmps	%fcc2,	%f1,	%f29
	udiv	%o6,	0x04E7,	%i1
	movn	%icc,	%o7,	%i0
	umul	%l6,	0x0DDA,	%o4
	mova	%xcc,	%l1,	%i3
	edge16l	%g3,	%l4,	%g5
	umul	%l5,	%i2,	%g7
	orn	%g6,	%o3,	%i6
	subccc	%i7,	0x0721,	%l3
	fmovse	%xcc,	%f13,	%f30
	and	%o2,	0x1FEA,	%i5
	save %o5, %i4, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%l0,	%g2,	%g4
	orn	%l2,	0x0819,	%o1
	fnand	%f22,	%f14,	%f4
	srlx	%o6,	0x09,	%o0
	fmovsle	%icc,	%f6,	%f18
	fmul8x16	%f3,	%f12,	%f12
	fpack32	%f26,	%f6,	%f8
	array32	%i1,	%i0,	%o7
	array32	%o4,	%l6,	%l1
	ldd	[%l7 + 0x70],	%i2
	fmovrsne	%g3,	%f26,	%f25
	edge16ln	%g5,	%l4,	%l5
	orn	%i2,	0x0A55,	%g6
	fmovsn	%icc,	%f5,	%f14
	edge16	%g7,	%o3,	%i6
	array8	%i7,	%o2,	%i5
	ldub	[%l7 + 0x42],	%l3
	movleu	%xcc,	%i4,	%g1
	edge8ln	%l0,	%g2,	%o5
	subccc	%g4,	%l2,	%o6
	movneg	%icc,	%o0,	%i1
	popc	0x01F7,	%o1
	alignaddrl	%o7,	%i0,	%o4
	add	%l1,	%l6,	%i3
	movrne	%g5,	%g3,	%l4
	st	%f20,	[%l7 + 0x78]
	array32	%l5,	%i2,	%g6
	and	%g7,	0x166A,	%o3
	alignaddr	%i6,	%o2,	%i5
	sllx	%l3,	%i4,	%i7
	andn	%l0,	%g1,	%o5
	ldsb	[%l7 + 0x1E],	%g2
	std	%f6,	[%l7 + 0x58]
	srl	%l2,	0x04,	%o6
	sth	%g4,	[%l7 + 0x76]
	fmovrsgz	%o0,	%f1,	%f5
	fmovrslez	%i1,	%f2,	%f29
	fxors	%f15,	%f27,	%f3
	edge8ln	%o7,	%o1,	%i0
	movpos	%xcc,	%l1,	%l6
	movpos	%icc,	%o4,	%i3
	ldsh	[%l7 + 0x5E],	%g3
	addccc	%g5,	0x0C51,	%l4
	mulscc	%i2,	0x1E11,	%g6
	ldub	[%l7 + 0x3A],	%g7
	smul	%l5,	0x1F35,	%i6
	fnands	%f10,	%f11,	%f28
	sdivcc	%o3,	0x008B,	%o2
	orncc	%i5,	%i4,	%i7
	sra	%l3,	0x0B,	%l0
	subcc	%g1,	%g2,	%o5
	movg	%xcc,	%o6,	%l2
	xnor	%o0,	%g4,	%i1
	movrne	%o7,	%o1,	%i0
	fcmple32	%f4,	%f4,	%l6
	srlx	%l1,	%i3,	%g3
	setx loop_98, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_98: 	stx	%l4,	[%l7 + 0x40]
	xorcc	%i2,	%g6,	%g7
	restore %i6, 0x0694, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o2,	0x0D,	%l5
	srlx	%i5,	0x11,	%i4
	movgu	%xcc,	%l3,	%i7
	edge32n	%l0,	%g2,	%g1
	edge32n	%o6,	%o5,	%o0
	st	%f24,	[%l7 + 0x20]
	sdiv	%g4,	0x1B67,	%l2
	or	%i1,	%o1,	%i0
	umulcc	%o7,	%l6,	%i3
	fmovsn	%icc,	%f25,	%f6
	movg	%xcc,	%l1,	%o4
	edge16n	%g5,	%g3,	%i2
	orn	%l4,	%g6,	%g7
	xnorcc	%o3,	%i6,	%l5
	alignaddrl	%o2,	%i4,	%l3
	edge32ln	%i7,	%l0,	%g2
	fand	%f18,	%f8,	%f18
	srlx	%i5,	%g1,	%o6
	fmovscc	%xcc,	%f27,	%f1
	andncc	%o0,	%o5,	%g4
	ldd	[%l7 + 0x78],	%f0
	xorcc	%l2,	%i1,	%o1
	subcc	%i0,	0x1977,	%o7
	st	%f24,	[%l7 + 0x30]
	movge	%xcc,	%l6,	%i3
	array8	%o4,	%g5,	%l1
	sra	%g3,	%l4,	%g6
	fmovsvs	%icc,	%f7,	%f20
	edge16ln	%g7,	%i2,	%o3
	array16	%l5,	%i6,	%o2
	andcc	%l3,	%i4,	%l0
	fmovdle	%icc,	%f9,	%f11
	fmovrdgz	%g2,	%f0,	%f22
	stx	%i5,	[%l7 + 0x70]
	fcmps	%fcc2,	%f21,	%f2
	nop
	set	0x58, %o2
	stw	%g1,	[%l7 + %o2]
	andncc	%o6,	%i7,	%o5
	movrgz	%o0,	%l2,	%g4
	sll	%o1,	%i1,	%i0
	movleu	%xcc,	%o7,	%i3
	save %o4, %g5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	for	%f16,	%f14,	%f30
	edge8	%l6,	%g3,	%g6
	fornot1s	%f5,	%f16,	%f7
	fpsub16	%f22,	%f4,	%f14
	sdivcc	%l4,	0x0EAD,	%g7
	addc	%i2,	0x0352,	%l5
	edge32ln	%o3,	%i6,	%l3
	movpos	%icc,	%o2,	%l0
	movn	%xcc,	%i4,	%i5
	mulscc	%g1,	0x0988,	%o6
	umul	%g2,	%i7,	%o5
	edge16ln	%l2,	%g4,	%o1
	array8	%i1,	%i0,	%o7
	edge16	%o0,	%o4,	%g5
	sub	%i3,	0x07D7,	%l6
	fcmped	%fcc3,	%f20,	%f30
	sir	0x02B6
	movrne	%g3,	0x3F5,	%g6
	popc	0x156B,	%l4
	movrlz	%l1,	0x308,	%g7
	fornot2	%f6,	%f8,	%f30
	andncc	%l5,	%o3,	%i6
	popc	%i2,	%o2
	fpadd32s	%f9,	%f14,	%f13
	xnorcc	%l3,	%l0,	%i4
	movg	%xcc,	%i5,	%o6
	udivx	%g2,	0x08E3,	%g1
	array16	%i7,	%o5,	%g4
	addcc	%l2,	%i1,	%o1
	subc	%i0,	0x0181,	%o0
	mova	%xcc,	%o7,	%g5
	udivx	%i3,	0x12B0,	%l6
	movrlez	%g3,	%g6,	%l4
	mulscc	%o4,	%g7,	%l5
	movrlez	%l1,	0x1C5,	%o3
	sethi	0x1E54,	%i6
	array32	%i2,	%o2,	%l3
	movl	%xcc,	%i4,	%i5
	edge32l	%l0,	%g2,	%g1
	subccc	%i7,	%o5,	%g4
	move	%xcc,	%o6,	%l2
	orcc	%o1,	0x0061,	%i0
	edge8	%o0,	%i1,	%g5
	xor	%o7,	0x1B2B,	%i3
	edge16n	%l6,	%g6,	%g3
	add	%o4,	%g7,	%l5
	movne	%xcc,	%l1,	%l4
	andn	%i6,	0x164E,	%o3
	andcc	%o2,	0x08CC,	%l3
	sir	0x1822
	movneg	%xcc,	%i2,	%i4
	fornot1	%f18,	%f26,	%f4
	movgu	%xcc,	%l0,	%i5
	edge16n	%g1,	%i7,	%g2
	bshuffle	%f12,	%f8,	%f30
	fmovsne	%icc,	%f7,	%f26
	movl	%icc,	%g4,	%o5
	fxnor	%f30,	%f0,	%f22
	movpos	%xcc,	%l2,	%o6
	sir	0x0ABA
	fsrc2s	%f13,	%f1
	fmovdcc	%icc,	%f18,	%f31
	edge32ln	%o1,	%i0,	%o0
	sra	%g5,	0x10,	%o7
	ld	[%l7 + 0x48],	%f4
	lduh	[%l7 + 0x24],	%i1
	subcc	%l6,	%g6,	%g3
	setx loop_99, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_99: 	fpadd16	%f4,	%f22,	%f30
	fnand	%f10,	%f30,	%f18
	smul	%l5,	0x0F7C,	%i3
	movcs	%icc,	%l1,	%i6
	fpsub32	%f22,	%f30,	%f24
	fmovrdgz	%l4,	%f14,	%f22
	movvs	%xcc,	%o3,	%l3
	ld	[%l7 + 0x74],	%f10
	andcc	%o2,	0x1C19,	%i2
	fmul8ulx16	%f18,	%f30,	%f4
	ldsw	[%l7 + 0x64],	%i4
	save %i5, %g1, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%l0,	%g4,	%o5
	fpadd32	%f20,	%f24,	%f12
	movrgez	%g2,	%o6,	%o1
	fmovsge	%icc,	%f9,	%f9
	sir	0x00B3
	edge8	%l2,	%i0,	%o0
	fnor	%f2,	%f8,	%f28
	edge32ln	%g5,	%i1,	%l6
	edge16ln	%g6,	%o7,	%o4
	movrlez	%g3,	0x060,	%g7
	sdivx	%i3,	0x1EAC,	%l1
	fmovrde	%l5,	%f2,	%f30
	edge32ln	%l4,	%o3,	%l3
	andn	%i6,	0x030A,	%o2
	udivcc	%i4,	0x13BE,	%i2
	alignaddr	%g1,	%i5,	%i7
	subcc	%l0,	0x1EC1,	%g4
	movpos	%icc,	%o5,	%o6
	umul	%g2,	%l2,	%o1
	smul	%i0,	%g5,	%o0
	andn	%l6,	%g6,	%o7
	movcc	%xcc,	%i1,	%o4
	fmovrdlz	%g3,	%f8,	%f10
	restore %g7, 0x09F7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f4,	%f22,	%i3
	orncc	%l4,	0x063F,	%l5
	ldx	[%l7 + 0x58],	%o3
	fmul8x16al	%f24,	%f9,	%f0
	umul	%l3,	%o2,	%i4
	edge16l	%i2,	%i6,	%i5
	fnegs	%f19,	%f19
	udivx	%g1,	0x168C,	%l0
	fmovdleu	%icc,	%f18,	%f9
	fmovdl	%icc,	%f18,	%f20
	array32	%i7,	%g4,	%o5
	movle	%xcc,	%o6,	%g2
	fxors	%f22,	%f29,	%f13
	ld	[%l7 + 0x24],	%f4
	sllx	%l2,	0x08,	%i0
	ldsb	[%l7 + 0x32],	%g5
	pdist	%f28,	%f2,	%f22
	fmovrdlz	%o1,	%f0,	%f14
	ldd	[%l7 + 0x28],	%o0
	mova	%xcc,	%g6,	%l6
	srl	%o7,	0x00,	%i1
	stb	%g3,	[%l7 + 0x48]
	array16	%o4,	%g7,	%l1
	movleu	%xcc,	%l4,	%l5
	addccc	%o3,	0x1B08,	%i3
	fone	%f22
	fcmple32	%f10,	%f16,	%o2
	subcc	%l3,	%i2,	%i6
	ldub	[%l7 + 0x21],	%i5
	lduh	[%l7 + 0x38],	%g1
	alignaddr	%l0,	%i7,	%g4
	xnorcc	%i4,	%o6,	%g2
	movrne	%l2,	%i0,	%g5
	lduh	[%l7 + 0x52],	%o1
	sdiv	%o5,	0x13A2,	%g6
	mulscc	%o0,	%o7,	%l6
	array32	%g3,	%i1,	%g7
	andcc	%o4,	0x0A4D,	%l4
	movrne	%l1,	0x052,	%o3
	sir	0x0732
	movre	%l5,	0x25B,	%o2
	umulcc	%l3,	0x1983,	%i2
	movge	%icc,	%i3,	%i6
	subccc	%g1,	0x08CC,	%i5
	stw	%l0,	[%l7 + 0x3C]
	ldd	[%l7 + 0x50],	%f26
	movrgez	%g4,	%i4,	%o6
	or	%i7,	0x14D0,	%g2
	fmovrsne	%i0,	%f4,	%f18
	edge16	%l2,	%g5,	%o5
	st	%f16,	[%l7 + 0x34]
	movle	%icc,	%g6,	%o0
	movrgez	%o7,	0x3C6,	%l6
	edge16l	%o1,	%i1,	%g7
	fmovspos	%xcc,	%f14,	%f7
	umulcc	%g3,	0x1372,	%o4
	movvc	%icc,	%l4,	%l1
	fmovdl	%xcc,	%f30,	%f29
	movne	%icc,	%l5,	%o3
	ldub	[%l7 + 0x19],	%l3
	array16	%i2,	%i3,	%i6
	addcc	%g1,	%o2,	%l0
	nop
	set	0x48, %i0
	std	%f2,	[%l7 + %i0]
	fpadd32s	%f7,	%f9,	%f10
	fmovdneg	%xcc,	%f24,	%f20
	orn	%g4,	%i5,	%o6
	fnot1s	%f4,	%f11
	addcc	%i4,	%g2,	%i7
	movrgez	%l2,	%g5,	%o5
	ldub	[%l7 + 0x40],	%i0
	setx loop_100, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_100: 	fpsub16	%f28,	%f22,	%f20
	fpack32	%f30,	%f18,	%f16
	edge16l	%g6,	%i1,	%o1
	mulx	%g3,	%o4,	%g7
	udivcc	%l4,	0x1513,	%l5
	movre	%l1,	%l3,	%o3
	xnorcc	%i2,	0x0EA1,	%i3
	edge32	%g1,	%i6,	%o2
	restore %l0, 0x142E, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%o6,	%g4,	%i4
	subc	%g2,	0x0146,	%i7
	ldsw	[%l7 + 0x18],	%g5
	fmul8sux16	%f20,	%f8,	%f8
	movge	%xcc,	%o5,	%l2
	sll	%i0,	0x01,	%o7
	movne	%xcc,	%o0,	%g6
	edge8l	%i1,	%o1,	%g3
	movl	%icc,	%l6,	%g7
	udiv	%l4,	0x07E3,	%o4
	udivcc	%l1,	0x088D,	%l5
	movrne	%o3,	%i2,	%l3
	movn	%xcc,	%g1,	%i6
	ldub	[%l7 + 0x0C],	%i3
	fmovrdgez	%o2,	%f4,	%f28
	fmovrdne	%l0,	%f12,	%f2
	fmovsvc	%xcc,	%f9,	%f12
	xorcc	%i5,	0x10CB,	%o6
	subccc	%g4,	%g2,	%i4
	edge16n	%i7,	%o5,	%g5
	fmovrdne	%i0,	%f8,	%f18
	array32	%o7,	%l2,	%g6
	fands	%f3,	%f21,	%f0
	fsrc2s	%f2,	%f9
	lduw	[%l7 + 0x3C],	%o0
	orncc	%i1,	0x0ACA,	%g3
	xnor	%l6,	%g7,	%o1
	sdivcc	%l4,	0x1736,	%l1
	orn	%o4,	0x1464,	%l5
	movleu	%icc,	%o3,	%l3
	ldd	[%l7 + 0x78],	%i2
	fcmple32	%f28,	%f12,	%i6
	fzero	%f6
	xnor	%i3,	0x001C,	%g1
	fnegs	%f9,	%f16
	movcc	%xcc,	%l0,	%i5
	umulcc	%o2,	0x0484,	%o6
	ldd	[%l7 + 0x60],	%g2
	fmuld8ulx16	%f19,	%f20,	%f8
	alignaddr	%i4,	%g4,	%o5
	addccc	%g5,	0x1B53,	%i0
	movn	%icc,	%o7,	%i7
	fsrc2s	%f26,	%f31
	edge8	%g6,	%l2,	%o0
	move	%xcc,	%i1,	%g3
	movrlez	%g7,	%l6,	%l4
	stw	%l1,	[%l7 + 0x58]
	lduh	[%l7 + 0x74],	%o4
	udivx	%o1,	0x1686,	%o3
	movrlz	%l5,	%i2,	%i6
	smulcc	%i3,	%l3,	%l0
	ldsb	[%l7 + 0x4D],	%i5
	array8	%g1,	%o6,	%g2
	sll	%i4,	%g4,	%o5
	fmovdneg	%xcc,	%f4,	%f29
	edge32	%g5,	%i0,	%o7
	lduw	[%l7 + 0x40],	%i7
	edge16n	%g6,	%l2,	%o2
	std	%f8,	[%l7 + 0x58]
	bshuffle	%f8,	%f30,	%f22
	fmovspos	%icc,	%f30,	%f9
	fmul8x16au	%f13,	%f6,	%f4
	fmovdvc	%xcc,	%f19,	%f16
	edge8	%o0,	%i1,	%g3
	ldd	[%l7 + 0x38],	%f26
	stb	%l6,	[%l7 + 0x4F]
	xorcc	%g7,	%l4,	%o4
	fsrc2s	%f18,	%f5
	add	%o1,	0x0728,	%l1
	movge	%icc,	%o3,	%l5
	edge16l	%i6,	%i2,	%l3
	ldd	[%l7 + 0x30],	%f6
	ldsh	[%l7 + 0x20],	%i3
	fpsub32	%f10,	%f14,	%f20
	addc	%l0,	%g1,	%o6
	ldsh	[%l7 + 0x3A],	%i5
	sub	%i4,	0x1811,	%g4
	ld	[%l7 + 0x58],	%f26
	subccc	%g2,	%g5,	%o5
	mulscc	%i0,	%i7,	%o7
	array16	%l2,	%g6,	%o0
	save %i1, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x75],	%o2
	fmovscs	%icc,	%f29,	%f23
	edge8l	%g7,	%o4,	%l4
	addccc	%l1,	%o3,	%l5
	srl	%o1,	0x07,	%i6
	fmovsge	%xcc,	%f7,	%f20
	orncc	%i2,	%i3,	%l3
	fmovdcc	%xcc,	%f3,	%f8
	sth	%g1,	[%l7 + 0x5E]
	ldd	[%l7 + 0x18],	%f16
	movrlez	%o6,	%i5,	%i4
	orn	%g4,	%l0,	%g2
	lduh	[%l7 + 0x10],	%g5
	lduw	[%l7 + 0x34],	%o5
	xor	%i7,	%o7,	%l2
	mova	%xcc,	%g6,	%i0
	std	%f8,	[%l7 + 0x60]
	sethi	0x1588,	%i1
	movvc	%xcc,	%g3,	%o0
	stw	%l6,	[%l7 + 0x24]
	smul	%g7,	%o2,	%o4
	andcc	%l1,	0x1A2F,	%l4
	fxnor	%f10,	%f0,	%f10
	orncc	%o3,	0x063D,	%l5
	fxors	%f3,	%f20,	%f14
	edge8l	%i6,	%i2,	%i3
	mulscc	%o1,	%l3,	%g1
	xnorcc	%o6,	%i4,	%g4
	fpsub16	%f24,	%f0,	%f0
	edge16ln	%i5,	%l0,	%g2
	xnorcc	%g5,	%i7,	%o7
	popc	%l2,	%o5
	ld	[%l7 + 0x64],	%f20
	orcc	%g6,	0x190E,	%i0
	mova	%xcc,	%g3,	%o0
	fmovsa	%icc,	%f26,	%f14
	and	%i1,	0x0862,	%g7
	edge8l	%l6,	%o4,	%o2
	movrlz	%l4,	%o3,	%l1
	movpos	%xcc,	%i6,	%i2
	array16	%l5,	%o1,	%l3
	fxors	%f30,	%f4,	%f13
	fcmple16	%f14,	%f16,	%i3
	addcc	%g1,	0x092C,	%i4
	srl	%g4,	%i5,	%o6
	save %l0, %g2, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3643
!	Type f   	: 5341
!	Type i   	: 16016
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x071C57FD
.word 0xBAF2FC65
.word 0xED3CB7BD
.word 0xAFDAA8D1
.word 0xD8FF562F
.word 0x9B3D9969
.word 0x7EB6CDCA
.word 0x3A263033
.word 0x92495D2D
.word 0x0C88825C
.word 0x21ABF817
.word 0x733C8EC8
.word 0x84EA0901
.word 0xB2CA0E8D
.word 0xBF19D2EB
.word 0x30BB0919
.word 0x420A0AEE
.word 0x43716627
.word 0x526F32E0
.word 0x10F3F75C
.word 0x58EA7580
.word 0x7572E721
.word 0x38373130
.word 0x6DED1529
.word 0x4ACB5D12
.word 0x49017031
.word 0x39AAFC76
.word 0x3F9D71EB
.word 0x1520333F
.word 0xC9ECF70B
.word 0xCAE46A19
.word 0x4A32975F
.word 0x416A6FE4
.word 0x74C6E213
.word 0xD98A152B
.word 0xA8E2CA03
.word 0x8B2D44D3
.word 0xBF4EA91D
.word 0x4B09720E
.word 0x87DA8E1A
.word 0x3F6E84C5
.word 0x961747DE
.word 0x4F4ED098
.word 0x3AC3B97E
.word 0x87E94E14
.word 0x29ACEE1F
.word 0xB0E0B508
.word 0x150A499F
.word 0xD4571EF7
.word 0x400847D5
.word 0x90585D7D
.word 0xBF9183F5
.word 0xA9C9E790
.word 0xA3DBBFD8
.word 0x905F881E
.word 0xB9E0402F
.word 0xD7179825
.word 0xCCAFA6C0
.word 0x7CF6AF00
.word 0x3C6ADD85
.word 0xA1D62828
.word 0xA89769E2
.word 0x5468B7BC
.word 0x8319AA50
.end
