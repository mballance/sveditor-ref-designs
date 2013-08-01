/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: isa3_window3_f18.s
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
.ident "Using Instruction Hash for Focus :$Id: isa3_window3_f18.s,v 1.1 2007/05/11 17:22:37 drp Exp $"
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
	setx	0x12ED5927604C331E,	%l0,	%l6
	stx	%l6,	[%l7 + 0x0]
	ldx	[%l7 + 0x0],	%fsr
!
! Thread 0 Start
!
main_t0:

	!# Initialize registers ..

	!# Global registers
	set	0x7,	%g1
	set	0x7,	%g2
	set	0x5,	%g3
	set	0xC,	%g4
	set	0xF,	%g5
	set	0xD,	%g6
	set	0x1,	%g7
	!# Input registers
	set	-0x7,	%i0
	set	-0xC,	%i1
	set	-0x4,	%i2
	set	-0x9,	%i3
	set	-0xC,	%i4
	set	-0x3,	%i5
	set	-0x3,	%i6
	set	-0x6,	%i7
	!# Local registers
	set	0x04B0F325,	%l0
	set	0x0DDB9DCB,	%l1
	set	0x4DF39A02,	%l2
	set	0x080C75E0,	%l3
	set	0x1BB09E62,	%l4
	set	0x34AC01BB,	%l5
	set	0x0899394B,	%l6
	!# Output registers
	set	0x1289,	%o0
	set	0x1E23,	%o1
	set	0x1AEA,	%o2
	set	0x0FD9,	%o3
	set	-0x0375,	%o4
	set	-0x1099,	%o5
	set	0x112B,	%o6
	set	-0x011A,	%o7
	!# Float registers
	INIT_TH_FP_REG(%l7,%f0,0xA9358C777932D891)
	INIT_TH_FP_REG(%l7,%f2,0xF2EF74BB69F3C9B2)
	INIT_TH_FP_REG(%l7,%f4,0x05B67F3333A9263B)
	INIT_TH_FP_REG(%l7,%f6,0x6FD0BF0F300746FE)
	INIT_TH_FP_REG(%l7,%f8,0x2FF1AA80C0921313)
	INIT_TH_FP_REG(%l7,%f10,0xCE84FB1D84ABE01A)
	INIT_TH_FP_REG(%l7,%f12,0x23BAC20AC3B74840)
	INIT_TH_FP_REG(%l7,%f14,0x97F29C9E2238236E)
	INIT_TH_FP_REG(%l7,%f16,0xDB9CF64C6217669D)
	INIT_TH_FP_REG(%l7,%f18,0xDB388AC17F0CF231)
	INIT_TH_FP_REG(%l7,%f20,0x5C8742066303FD16)
	INIT_TH_FP_REG(%l7,%f22,0x6FFD41A3553F80AC)
	INIT_TH_FP_REG(%l7,%f24,0x40BE68405CBDC541)
	INIT_TH_FP_REG(%l7,%f26,0x71FF7232872397FD)
	INIT_TH_FP_REG(%l7,%f28,0xC1E9E337BAA87861)
	INIT_TH_FP_REG(%l7,%f30,0xCD78B44AFA165CAF)
	!# Other state
	
	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0

	or 	%g0, 	0x8, 	%l0
	sllx 	%l0, 	0x3c, 	%l0
	wrhpr 	%l0, 	0x1E0, 	%hsys_tick_cmpr


	!# Execute Main Diag ..

	movrlez	%g3,	0x3D9,	%i3
	stw	%g7,	[%l7 + 0x50]
	movre	%g1,	0x3B2,	%i6
	orn	%i4,	0x1B6E,	%o7
	movne	%xcc,	%i5,	%i7
	fpsub16	%f0,	%f30,	%f22
	subc	%o3,	0x163D,	%g6
	edge8ln	%l6,	%i1,	%o6
	mova	%icc,	%l4,	%l1
	subcc	%o1,	%o5,	%o4
	array8	%o0,	%i2,	%i0
	movge	%icc,	%g2,	%l2
	fmovdg	%xcc,	%f22,	%f22
	movcs	%xcc,	%l3,	%o2
	xorcc	%l0,	0x1326,	%g4
	fmovsg	%icc,	%f10,	%f30
	movvc	%xcc,	%l5,	%g3
	edge16n	%i3,	%g7,	%g1
	ldd	[%l7 + 0x18],	%f16
	fandnot1	%f24,	%f6,	%f4
	sllx	%i6,	0x10,	%i4
	ldx	[%l7 + 0x48],	%g5
	subc	%o7,	%i7,	%o3
	addccc	%i5,	0x0176,	%g6
	ld	[%l7 + 0x1C],	%f15
	movrlez	%i1,	0x1A9,	%o6
	fmovsne	%icc,	%f11,	%f27
	std	%f30,	[%l7 + 0x48]
	xnor	%l4,	%l1,	%l6
	fabsd	%f6,	%f6
	xor	%o1,	%o5,	%o4
	fcmpd	%fcc2,	%f8,	%f14
	fmovsne	%icc,	%f7,	%f18
	andn	%i2,	0x16F5,	%o0
	edge8ln	%g2,	%l2,	%i0
	fpsub16s	%f9,	%f14,	%f22
	sth	%o2,	[%l7 + 0x20]
	ldd	[%l7 + 0x10],	%f24
	array8	%l3,	%l0,	%l5
	nop
	set	0x60, %i3
	stx	%g3,	[%l7 + %i3]
	save %i3, 0x11B8, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g7,	0x0CFF,	%i6
	sir	0x08EF
	smul	%g1,	%i4,	%g5
	movvs	%xcc,	%i7,	%o7
	sdiv	%o3,	0x1336,	%g6
	std	%f10,	[%l7 + 0x78]
	xorcc	%i1,	0x1C4B,	%i5
	movrgez	%o6,	%l4,	%l6
	udivcc	%o1,	0x1E33,	%o5
	fandnot1	%f8,	%f14,	%f10
	bshuffle	%f30,	%f8,	%f0
	orn	%o4,	0x021F,	%i2
	movneg	%icc,	%l1,	%o0
	movg	%xcc,	%g2,	%l2
	fmovrde	%o2,	%f22,	%f16
	andn	%i0,	%l3,	%l0
	sir	0x185A
	edge8	%g3,	%i3,	%g4
	stb	%l5,	[%l7 + 0x0E]
	edge16ln	%g7,	%i6,	%i4
	array8	%g5,	%g1,	%i7
	mulx	%o3,	%g6,	%o7
	st	%f27,	[%l7 + 0x78]
	xor	%i1,	0x16DD,	%i5
	fcmpne16	%f12,	%f0,	%l4
	edge32n	%l6,	%o6,	%o1
	movneg	%xcc,	%o4,	%i2
	andn	%l1,	%o0,	%g2
	fone	%f26
	movl	%xcc,	%o5,	%l2
	udiv	%o2,	0x18DE,	%l3
	sub	%l0,	0x1132,	%g3
	movre	%i0,	0x221,	%g4
	orn	%i3,	%l5,	%g7
	ldd	[%l7 + 0x78],	%i6
	movge	%icc,	%i4,	%g5
	edge8ln	%g1,	%o3,	%g6
	std	%f18,	[%l7 + 0x40]
	orn	%o7,	0x122A,	%i7
	movrgz	%i5,	%i1,	%l4
	smulcc	%o6,	%o1,	%o4
	nop
	set	0x16, %i7
	sth	%l6,	[%l7 + %i7]
	movrlez	%l1,	0x262,	%i2
	fsrc1s	%f26,	%f22
	fmul8x16al	%f18,	%f20,	%f26
	movle	%icc,	%g2,	%o0
	movl	%xcc,	%l2,	%o2
	fmovrdgez	%o5,	%f28,	%f0
	move	%xcc,	%l0,	%l3
	ldub	[%l7 + 0x6D],	%g3
	ldd	[%l7 + 0x38],	%i0
	sll	%g4,	%l5,	%i3
	fcmps	%fcc0,	%f18,	%f20
	edge16ln	%i6,	%g7,	%i4
	lduw	[%l7 + 0x70],	%g1
	movpos	%icc,	%g5,	%g6
	movle	%xcc,	%o7,	%o3
	add	%i7,	%i1,	%i5
	fmovsge	%icc,	%f12,	%f22
	fxnors	%f28,	%f5,	%f25
	edge8	%l4,	%o1,	%o4
	mulscc	%l6,	0x026B,	%o6
	udivcc	%i2,	0x08E8,	%g2
	fmovscc	%icc,	%f29,	%f29
	movvs	%icc,	%l1,	%o0
	mova	%xcc,	%o2,	%o5
	andn	%l0,	%l2,	%g3
	sir	0x0EC3
	fand	%f8,	%f24,	%f0
	smul	%l3,	%i0,	%g4
	fcmpne32	%f30,	%f30,	%i3
	udivcc	%l5,	0x157E,	%i6
	mulscc	%g7,	0x0355,	%g1
	nop
	set	0x2C, %o5
	lduw	[%l7 + %o5],	%i4
	edge8	%g5,	%g6,	%o3
	movge	%xcc,	%o7,	%i7
	mulx	%i1,	%l4,	%i5
	ldsw	[%l7 + 0x34],	%o4
	mulscc	%o1,	%l6,	%o6
	edge16ln	%g2,	%i2,	%l1
	fcmpne16	%f6,	%f20,	%o0
	ldsh	[%l7 + 0x58],	%o5
	lduw	[%l7 + 0x24],	%o2
	addc	%l2,	%l0,	%g3
	subccc	%i0,	0x1C48,	%l3
	movn	%icc,	%i3,	%l5
	lduw	[%l7 + 0x18],	%g4
	stw	%g7,	[%l7 + 0x68]
	fpadd32s	%f9,	%f21,	%f15
	fands	%f1,	%f11,	%f21
	movl	%icc,	%g1,	%i6
	movcs	%xcc,	%i4,	%g6
	and	%g5,	0x0323,	%o7
	movvs	%icc,	%o3,	%i7
	stx	%l4,	[%l7 + 0x20]
	addccc	%i5,	%i1,	%o4
	edge8	%o1,	%o6,	%g2
	alignaddrl	%i2,	%l1,	%l6
	sir	0x0F43
	ldsw	[%l7 + 0x2C],	%o5
	edge32	%o2,	%o0,	%l2
	siam	0x4
	or	%g3,	0x1E6D,	%i0
	ldub	[%l7 + 0x17],	%l3
	fpsub32s	%f12,	%f0,	%f21
	edge8	%i3,	%l5,	%l0
	fmovsl	%icc,	%f28,	%f18
	edge16n	%g7,	%g4,	%i6
	xor	%g1,	0x042B,	%g6
	andn	%i4,	%g5,	%o3
	movcs	%icc,	%i7,	%l4
	addccc	%i5,	0x0D0F,	%o7
	edge16l	%i1,	%o4,	%o1
	fnot1	%f20,	%f14
	fabss	%f17,	%f28
	fmovrsne	%g2,	%f18,	%f24
	xor	%i2,	0x123A,	%o6
	movleu	%xcc,	%l1,	%o5
	edge32l	%o2,	%o0,	%l6
	edge8ln	%l2,	%i0,	%g3
	fmovsvc	%xcc,	%f9,	%f26
	fmul8x16	%f19,	%f0,	%f18
	ldsw	[%l7 + 0x24],	%l3
	edge16l	%i3,	%l0,	%g7
	orn	%l5,	0x05D0,	%g4
	sdivcc	%g1,	0x188F,	%g6
	sra	%i6,	%g5,	%i4
	movneg	%icc,	%o3,	%l4
	movre	%i7,	%i5,	%o7
	stx	%o4,	[%l7 + 0x28]
	edge8	%i1,	%o1,	%g2
	orncc	%o6,	0x073B,	%i2
	stb	%o5,	[%l7 + 0x08]
	fmovscs	%xcc,	%f4,	%f2
	movcs	%icc,	%o2,	%l1
	fmovsa	%icc,	%f16,	%f17
	popc	0x0FE6,	%l6
	movcc	%xcc,	%o0,	%l2
	fornot1	%f24,	%f20,	%f20
	stb	%i0,	[%l7 + 0x49]
	movcc	%xcc,	%l3,	%g3
	movneg	%xcc,	%i3,	%g7
	save %l0, 0x09AA, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g1,	0x007A,	%l5
	andcc	%g6,	%i6,	%g5
	ldd	[%l7 + 0x28],	%f12
	fmovdle	%xcc,	%f0,	%f5
	mulscc	%o3,	%i4,	%i7
	fmovsgu	%xcc,	%f23,	%f2
	stb	%i5,	[%l7 + 0x1E]
	fcmpd	%fcc3,	%f0,	%f16
	addccc	%o7,	0x014E,	%l4
	fmovdl	%xcc,	%f15,	%f17
	xor	%i1,	%o4,	%g2
	ldub	[%l7 + 0x40],	%o6
	movrne	%i2,	0x1C0,	%o5
	ldsw	[%l7 + 0x10],	%o1
	move	%icc,	%l1,	%l6
	srax	%o2,	0x15,	%o0
	fpadd32s	%f28,	%f7,	%f23
	edge8n	%l2,	%i0,	%g3
	movneg	%icc,	%i3,	%g7
	fmovrsgez	%l3,	%f6,	%f7
	fmovrslz	%g4,	%f29,	%f17
	movcc	%xcc,	%l0,	%l5
	sra	%g6,	0x0D,	%i6
	movpos	%xcc,	%g5,	%o3
	andn	%i4,	%g1,	%i5
	fpsub32s	%f26,	%f0,	%f1
	movcc	%icc,	%o7,	%l4
	fsrc1s	%f23,	%f18
	array8	%i7,	%o4,	%g2
	edge32l	%i1,	%o6,	%o5
	edge8l	%o1,	%l1,	%i2
	fmovsle	%xcc,	%f27,	%f23
	udivcc	%l6,	0x0F11,	%o0
	movge	%icc,	%l2,	%o2
	edge32l	%i0,	%g3,	%g7
	xorcc	%i3,	0x1D3B,	%g4
	edge32n	%l3,	%l5,	%g6
	fmovde	%xcc,	%f4,	%f30
	movn	%xcc,	%l0,	%i6
	movvs	%xcc,	%o3,	%i4
	mulx	%g1,	%g5,	%i5
	ldx	[%l7 + 0x30],	%l4
	fmovdle	%icc,	%f11,	%f21
	save %i7, %o7, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x1F47,	%i1
	movneg	%xcc,	%o6,	%g2
	restore %o5, %o1, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smulcc	%l1,	0x030C,	%l6
	smulcc	%o0,	%l2,	%i0
	umul	%o2,	%g3,	%g7
	orn	%g4,	0x1910,	%l3
	mulx	%i3,	0x1B74,	%l5
	movne	%xcc,	%g6,	%i6
	edge16ln	%l0,	%i4,	%o3
	srl	%g1,	%i5,	%g5
	fcmpes	%fcc1,	%f8,	%f21
	alignaddr	%l4,	%o7,	%o4
	movcs	%xcc,	%i7,	%i1
	stw	%o6,	[%l7 + 0x10]
	movg	%icc,	%o5,	%g2
	fnand	%f26,	%f16,	%f0
	move	%xcc,	%o1,	%l1
	orn	%l6,	0x1B5C,	%i2
	lduh	[%l7 + 0x7E],	%o0
	std	%f14,	[%l7 + 0x50]
	fornot1	%f30,	%f2,	%f0
	stx	%l2,	[%l7 + 0x58]
	fcmpeq32	%f12,	%f0,	%i0
	st	%f0,	[%l7 + 0x64]
	nop
	set	0x28, %o7
	stx	%o2,	[%l7 + %o7]
	orn	%g3,	%g7,	%l3
	setx loop_0, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_0: 	ldsw	[%l7 + 0x18],	%g6
	edge32n	%i3,	%i6,	%i4
	subccc	%o3,	0x1F77,	%g1
	umulcc	%l0,	0x0D22,	%g5
	mova	%xcc,	%i5,	%o7
	umulcc	%l4,	0x1648,	%o4
	fmovd	%f30,	%f18
	udiv	%i1,	0x02AF,	%i7
	movvs	%xcc,	%o6,	%g2
	mulx	%o1,	%o5,	%l6
	array32	%l1,	%i2,	%o0
	move	%xcc,	%i0,	%l2
	fsrc2s	%f8,	%f9
	std	%f12,	[%l7 + 0x38]
	bshuffle	%f18,	%f16,	%f16
	alignaddrl	%g3,	%g7,	%l3
	smul	%g4,	%o2,	%l5
	array16	%g6,	%i3,	%i6
	fmul8x16au	%f12,	%f27,	%f8
	mulx	%i4,	%g1,	%o3
	ld	[%l7 + 0x78],	%f16
	addccc	%g5,	0x00AF,	%i5
	add	%o7,	0x06FD,	%l4
	fsrc2	%f12,	%f8
	movne	%icc,	%o4,	%l0
	subccc	%i1,	%o6,	%g2
	fmovrdne	%o1,	%f8,	%f28
	stb	%o5,	[%l7 + 0x24]
	edge8	%i7,	%l1,	%i2
	movne	%icc,	%o0,	%l6
	xnorcc	%i0,	%l2,	%g7
	fcmps	%fcc2,	%f21,	%f10
	st	%f11,	[%l7 + 0x74]
	orcc	%g3,	%l3,	%g4
	fmovrdlez	%l5,	%f0,	%f24
	movg	%icc,	%g6,	%o2
	fmovdgu	%xcc,	%f17,	%f8
	edge16n	%i6,	%i3,	%i4
	andn	%g1,	0x0037,	%o3
	edge16n	%i5,	%o7,	%g5
	array32	%o4,	%l4,	%l0
	edge8ln	%i1,	%o6,	%g2
	stw	%o5,	[%l7 + 0x0C]
	lduh	[%l7 + 0x70],	%i7
	alignaddrl	%o1,	%i2,	%l1
	edge8n	%l6,	%i0,	%o0
	lduw	[%l7 + 0x50],	%l2
	movre	%g7,	0x05C,	%l3
	fors	%f16,	%f27,	%f0
	fpsub16s	%f1,	%f8,	%f2
	stb	%g3,	[%l7 + 0x22]
	orcc	%l5,	0x0758,	%g6
	srax	%g4,	0x03,	%o2
	array8	%i6,	%i4,	%g1
	movne	%xcc,	%i3,	%i5
	movcs	%icc,	%o3,	%g5
	fmovsleu	%icc,	%f20,	%f15
	smul	%o7,	%o4,	%l4
	stw	%i1,	[%l7 + 0x28]
	or	%l0,	%g2,	%o6
	fmovrslez	%o5,	%f7,	%f29
	edge16n	%i7,	%i2,	%o1
	ldsh	[%l7 + 0x5E],	%l1
	fmovdcc	%xcc,	%f13,	%f27
	ldd	[%l7 + 0x30],	%i0
	movge	%icc,	%l6,	%l2
	xor	%g7,	%l3,	%o0
	movneg	%icc,	%g3,	%l5
	addccc	%g4,	%g6,	%o2
	move	%icc,	%i4,	%i6
	movleu	%icc,	%g1,	%i5
	edge32n	%i3,	%o3,	%g5
	sir	0x0442
	andn	%o4,	%o7,	%l4
	fpackfix	%f24,	%f14
	save %i1, 0x1D78, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%o6,	%o5
	movn	%icc,	%g2,	%i7
	movrlez	%i2,	0x24A,	%l1
	and	%o1,	%l6,	%i0
	edge32ln	%g7,	%l2,	%o0
	fcmpne32	%f8,	%f24,	%l3
	edge16l	%l5,	%g4,	%g3
	srl	%g6,	0x0E,	%o2
	edge32l	%i6,	%i4,	%i5
	add	%g1,	0x0C5F,	%o3
	mulx	%i3,	%o4,	%o7
	sub	%l4,	0x1928,	%g5
	subcc	%i1,	%l0,	%o6
	sdivcc	%g2,	0x0F03,	%o5
	movl	%icc,	%i7,	%i2
	movcc	%xcc,	%l1,	%o1
	subc	%i0,	%l6,	%g7
	and	%o0,	0x1CCE,	%l3
	fzero	%f4
	ldub	[%l7 + 0x75],	%l2
	move	%xcc,	%g4,	%g3
	movvs	%xcc,	%g6,	%o2
	and	%l5,	%i6,	%i4
	move	%xcc,	%g1,	%i5
	alignaddr	%i3,	%o4,	%o7
	xnorcc	%o3,	%g5,	%l4
	ldx	[%l7 + 0x70],	%i1
	ldx	[%l7 + 0x60],	%l0
	lduw	[%l7 + 0x2C],	%g2
	ldd	[%l7 + 0x58],	%f10
	umul	%o5,	%i7,	%i2
	fone	%f14
	fpsub32s	%f29,	%f31,	%f9
	ld	[%l7 + 0x74],	%f25
	fmovdcs	%icc,	%f4,	%f13
	fnor	%f0,	%f14,	%f24
	fmovrdne	%l1,	%f18,	%f4
	fandnot1s	%f11,	%f14,	%f27
	orncc	%o1,	%o6,	%i0
	movrne	%g7,	%o0,	%l3
	edge32	%l2,	%g4,	%l6
	save %g6, 0x19EF, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f2,	%f6
	ldsh	[%l7 + 0x14],	%l5
	sllx	%g3,	0x11,	%i4
	fpack32	%f24,	%f6,	%f10
	fmovscs	%icc,	%f29,	%f13
	std	%f22,	[%l7 + 0x30]
	movre	%i6,	%g1,	%i5
	edge32n	%o4,	%i3,	%o3
	bshuffle	%f20,	%f14,	%f16
	ld	[%l7 + 0x68],	%f22
	ldsw	[%l7 + 0x4C],	%o7
	alignaddr	%g5,	%l4,	%l0
	fmovdle	%icc,	%f14,	%f21
	udivx	%g2,	0x0B93,	%o5
	fmovrdgz	%i7,	%f24,	%f16
	fcmple16	%f10,	%f26,	%i1
	movleu	%xcc,	%i2,	%o1
	edge8n	%l1,	%o6,	%i0
	addc	%g7,	%l3,	%l2
	fands	%f27,	%f18,	%f14
	andn	%o0,	0x0A17,	%g4
	fcmpeq16	%f2,	%f8,	%g6
	srax	%l6,	0x19,	%l5
	sth	%o2,	[%l7 + 0x7C]
	sll	%i4,	0x0D,	%i6
	alignaddr	%g1,	%i5,	%o4
	stx	%g3,	[%l7 + 0x50]
	srl	%i3,	%o3,	%g5
	fsrc1s	%f21,	%f27
	fmovs	%f23,	%f28
	ldd	[%l7 + 0x20],	%f16
	ldd	[%l7 + 0x18],	%f28
	stw	%l4,	[%l7 + 0x5C]
	sth	%o7,	[%l7 + 0x3E]
	array8	%g2,	%o5,	%i7
	srlx	%l0,	%i2,	%o1
	xnorcc	%l1,	0x105C,	%i1
	xnorcc	%o6,	%i0,	%g7
	lduh	[%l7 + 0x44],	%l2
	fabsd	%f16,	%f12
	movl	%xcc,	%l3,	%g4
	sllx	%g6,	0x05,	%o0
	addc	%l5,	0x1D57,	%o2
	move	%xcc,	%l6,	%i4
	add	%g1,	%i5,	%i6
	andn	%g3,	0x1C1F,	%o4
	movl	%icc,	%i3,	%g5
	fands	%f4,	%f17,	%f29
	fpadd16s	%f22,	%f20,	%f22
	orn	%l4,	%o3,	%g2
	srax	%o7,	0x18,	%i7
	andcc	%l0,	0x1507,	%o5
	smulcc	%i2,	%o1,	%i1
	and	%l1,	%o6,	%g7
	sdivcc	%i0,	0x0C86,	%l3
	ldd	[%l7 + 0x18],	%l2
	stb	%g6,	[%l7 + 0x69]
	popc	0x010E,	%g4
	orcc	%o0,	0x089D,	%o2
	edge8n	%l5,	%i4,	%g1
	fxor	%f14,	%f18,	%f6
	movl	%icc,	%l6,	%i5
	edge16n	%i6,	%o4,	%g3
	alignaddrl	%i3,	%g5,	%o3
	move	%xcc,	%g2,	%o7
	edge8n	%l4,	%i7,	%l0
	andn	%o5,	0x0B93,	%i2
	fandnot2s	%f7,	%f19,	%f15
	ldx	[%l7 + 0x60],	%i1
	movl	%icc,	%o1,	%l1
	sdiv	%g7,	0x0782,	%o6
	movl	%icc,	%l3,	%l2
	umul	%g6,	%i0,	%o0
	movcc	%icc,	%o2,	%g4
	fornot1s	%f0,	%f22,	%f13
	subccc	%l5,	0x09E4,	%i4
	addcc	%l6,	0x171F,	%g1
	add	%i5,	%i6,	%g3
	fmovsleu	%xcc,	%f18,	%f19
	and	%i3,	0x0303,	%g5
	ldsw	[%l7 + 0x60],	%o3
	mova	%xcc,	%o4,	%o7
	ldsb	[%l7 + 0x4D],	%l4
	sdivx	%g2,	0x0A08,	%i7
	srlx	%o5,	0x0B,	%i2
	movneg	%icc,	%l0,	%i1
	stw	%l1,	[%l7 + 0x58]
	fmovrsgz	%o1,	%f19,	%f1
	umul	%g7,	%o6,	%l3
	fnegd	%f16,	%f26
	ldsh	[%l7 + 0x42],	%l2
	orcc	%g6,	0x01BE,	%o0
	sra	%i0,	0x17,	%g4
	edge32n	%l5,	%o2,	%l6
	xorcc	%i4,	%g1,	%i6
	srax	%g3,	0x06,	%i5
	fmul8ulx16	%f28,	%f20,	%f6
	edge8n	%i3,	%o3,	%o4
	movrgz	%o7,	0x3F7,	%g5
	movrgez	%g2,	%i7,	%o5
	sdivcc	%i2,	0x087E,	%l0
	st	%f20,	[%l7 + 0x44]
	edge8n	%i1,	%l1,	%l4
	alignaddr	%g7,	%o6,	%o1
	udivcc	%l3,	0x00D4,	%l2
	movcs	%xcc,	%o0,	%i0
	xor	%g4,	0x0D89,	%l5
	sub	%o2,	0x15B8,	%l6
	fmovdleu	%xcc,	%f27,	%f5
	fmovsvc	%icc,	%f20,	%f23
	movcc	%xcc,	%i4,	%g6
	nop
	set	0x48, %i1
	std	%f22,	[%l7 + %i1]
	fabsd	%f20,	%f26
	edge32l	%g1,	%g3,	%i5
	movre	%i6,	0x139,	%o3
	andncc	%o4,	%o7,	%i3
	fmovsvc	%xcc,	%f28,	%f6
	edge16l	%g5,	%i7,	%g2
	movrne	%i2,	%l0,	%i1
	movg	%xcc,	%o5,	%l4
	mulscc	%l1,	%g7,	%o1
	edge32ln	%l3,	%o6,	%l2
	movge	%icc,	%i0,	%o0
	xnor	%g4,	0x02F6,	%l5
	fpsub16	%f0,	%f0,	%f10
	andncc	%l6,	%o2,	%i4
	sth	%g6,	[%l7 + 0x2E]
	fandnot1	%f4,	%f20,	%f22
	move	%icc,	%g3,	%g1
	sub	%i6,	%i5,	%o3
	fxnor	%f14,	%f0,	%f30
	movcc	%xcc,	%o7,	%o4
	sdivcc	%g5,	0x1D4B,	%i7
	ldd	[%l7 + 0x48],	%g2
	xor	%i3,	%l0,	%i2
	movre	%i1,	%o5,	%l4
	fandnot1s	%f16,	%f15,	%f3
	edge8	%l1,	%o1,	%l3
	ldsw	[%l7 + 0x54],	%o6
	andn	%g7,	0x0F64,	%l2
	orcc	%o0,	%g4,	%i0
	ldx	[%l7 + 0x58],	%l5
	movre	%l6,	0x141,	%o2
	stx	%g6,	[%l7 + 0x28]
	movrgz	%g3,	%g1,	%i4
	stw	%i5,	[%l7 + 0x30]
	sdiv	%i6,	0x0A03,	%o7
	fpsub32s	%f19,	%f18,	%f16
	sdivx	%o3,	0x123B,	%o4
	movrlz	%i7,	%g2,	%i3
	fpadd32	%f6,	%f16,	%f22
	ldd	[%l7 + 0x60],	%f14
	xor	%l0,	%g5,	%i2
	edge16n	%o5,	%l4,	%l1
	movcc	%icc,	%o1,	%l3
	subccc	%o6,	%g7,	%i1
	fmovdvs	%xcc,	%f20,	%f3
	movrlz	%l2,	%o0,	%i0
	fpsub32s	%f20,	%f7,	%f11
	ldd	[%l7 + 0x60],	%f18
	ldub	[%l7 + 0x5D],	%g4
	movrgz	%l5,	0x39D,	%l6
	movre	%g6,	%o2,	%g3
	st	%f7,	[%l7 + 0x38]
	movne	%icc,	%i4,	%i5
	edge32ln	%g1,	%o7,	%o3
	fandnot2	%f8,	%f20,	%f18
	fmovd	%f30,	%f30
	fone	%f10
	fornot1	%f2,	%f30,	%f2
	stb	%o4,	[%l7 + 0x4F]
	movg	%xcc,	%i6,	%i7
	stw	%g2,	[%l7 + 0x7C]
	fcmped	%fcc0,	%f4,	%f2
	andn	%i3,	0x04EA,	%l0
	fmovsge	%icc,	%f11,	%f0
	fcmpne32	%f12,	%f22,	%g5
	movvs	%icc,	%o5,	%i2
	srax	%l4,	0x0B,	%o1
	fnot1	%f4,	%f30
	st	%f29,	[%l7 + 0x7C]
	add	%l1,	0x1699,	%l3
	sdiv	%o6,	0x0F96,	%g7
	fpsub16	%f28,	%f4,	%f2
	movrne	%l2,	%i1,	%i0
	fnors	%f6,	%f29,	%f27
	movleu	%xcc,	%o0,	%g4
	orn	%l6,	%g6,	%o2
	edge8ln	%g3,	%l5,	%i5
	fxnors	%f4,	%f31,	%f13
	alignaddrl	%g1,	%i4,	%o3
	orcc	%o4,	0x02D7,	%o7
	edge16	%i6,	%g2,	%i3
	movvc	%icc,	%i7,	%l0
	ldd	[%l7 + 0x58],	%f4
	ld	[%l7 + 0x4C],	%f0
	fmovsneg	%xcc,	%f16,	%f8
	andn	%g5,	0x196F,	%o5
	umulcc	%l4,	%i2,	%l1
	fornot2	%f26,	%f4,	%f24
	fone	%f4
	movrlz	%o1,	%o6,	%l3
	edge32	%g7,	%i1,	%i0
	array16	%o0,	%g4,	%l6
	movrlez	%l2,	%g6,	%o2
	edge8n	%l5,	%i5,	%g1
	movrgez	%g3,	%i4,	%o4
	ldd	[%l7 + 0x68],	%o2
	fcmpgt16	%f4,	%f18,	%o7
	sdivx	%i6,	0x0AB4,	%g2
	fmovdne	%xcc,	%f3,	%f27
	fmovse	%icc,	%f25,	%f25
	movneg	%icc,	%i7,	%i3
	ld	[%l7 + 0x20],	%f28
	udiv	%l0,	0x16DA,	%g5
	ldd	[%l7 + 0x18],	%f10
	fone	%f26
	movneg	%xcc,	%o5,	%i2
	movgu	%icc,	%l1,	%o1
	fcmped	%fcc1,	%f0,	%f14
	umulcc	%l4,	0x0C04,	%o6
	lduw	[%l7 + 0x18],	%g7
	xnor	%i1,	0x0C4F,	%i0
	fcmpne16	%f22,	%f22,	%l3
	edge16n	%g4,	%l6,	%o0
	movn	%xcc,	%g6,	%o2
	mova	%icc,	%l2,	%i5
	ldx	[%l7 + 0x28],	%g1
	movcs	%xcc,	%l5,	%i4
	std	%f0,	[%l7 + 0x70]
	edge32ln	%g3,	%o3,	%o7
	fmovd	%f14,	%f8
	save %o4, 0x1DA6, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f14,	[%l7 + 0x08]
	edge16l	%i7,	%g2,	%i3
	fpsub32	%f20,	%f20,	%f18
	movcc	%icc,	%g5,	%l0
	stx	%o5,	[%l7 + 0x68]
	movrlz	%i2,	%o1,	%l1
	fmovsvc	%icc,	%f28,	%f1
	movrgez	%l4,	%g7,	%i1
	movneg	%xcc,	%i0,	%l3
	andcc	%o6,	%l6,	%o0
	movcc	%xcc,	%g4,	%g6
	smulcc	%l2,	0x017E,	%i5
	movrgez	%o2,	%l5,	%g1
	smul	%i4,	0x10DC,	%g3
	lduw	[%l7 + 0x28],	%o7
	andn	%o4,	0x01E9,	%o3
	sethi	0x0D0B,	%i7
	std	%f0,	[%l7 + 0x08]
	edge8	%i6,	%i3,	%g2
	xorcc	%l0,	%g5,	%i2
	movn	%icc,	%o5,	%o1
	movg	%icc,	%l1,	%g7
	sth	%l4,	[%l7 + 0x36]
	edge16n	%i1,	%l3,	%o6
	sdiv	%l6,	0x1E18,	%i0
	movneg	%xcc,	%o0,	%g4
	edge16n	%g6,	%l2,	%i5
	fmul8ulx16	%f4,	%f8,	%f20
	ldd	[%l7 + 0x48],	%l4
	smul	%o2,	%i4,	%g1
	movcs	%icc,	%g3,	%o7
	sdiv	%o3,	0x0189,	%o4
	fsrc2	%f0,	%f24
	sllx	%i6,	%i3,	%i7
	umulcc	%l0,	0x0438,	%g5
	movrlz	%g2,	%o5,	%o1
	sra	%i2,	0x16,	%g7
	edge8	%l4,	%i1,	%l3
	srlx	%o6,	0x18,	%l6
	fmovda	%xcc,	%f11,	%f30
	ldsb	[%l7 + 0x67],	%i0
	fmovde	%icc,	%f25,	%f29
	mulscc	%l1,	0x0E14,	%g4
	add	%g6,	%o0,	%i5
	movrlz	%l2,	%o2,	%i4
	faligndata	%f20,	%f4,	%f14
	sdivcc	%g1,	0x0B1E,	%l5
	edge8n	%o7,	%g3,	%o4
	srlx	%o3,	%i6,	%i7
	lduw	[%l7 + 0x4C],	%l0
	movrlez	%i3,	%g5,	%g2
	sdivcc	%o1,	0x1E89,	%i2
	mulx	%o5,	%g7,	%l4
	movge	%xcc,	%l3,	%o6
	udiv	%i1,	0x1AA0,	%l6
	sir	0x079E
	srlx	%i0,	0x0D,	%g4
	mulx	%g6,	%o0,	%i5
	ldub	[%l7 + 0x5C],	%l2
	fzero	%f24
	std	%f16,	[%l7 + 0x08]
	edge32ln	%l1,	%i4,	%o2
	edge32n	%l5,	%o7,	%g1
	alignaddr	%o4,	%g3,	%o3
	fmovsgu	%icc,	%f31,	%f23
	array16	%i6,	%i7,	%l0
	fnand	%f20,	%f18,	%f8
	fmul8x16au	%f28,	%f20,	%f24
	nop
	set	0x78, %i4
	ldsh	[%l7 + %i4],	%i3
	move	%xcc,	%g5,	%o1
	add	%i2,	%o5,	%g7
	orncc	%g2,	0x151C,	%l4
	fpack16	%f28,	%f23
	fmovdleu	%xcc,	%f11,	%f10
	array8	%o6,	%l3,	%l6
	fabsd	%f14,	%f18
	sra	%i0,	0x19,	%i1
	movrgez	%g4,	%o0,	%i5
	movrlez	%l2,	0x1D5,	%l1
	alignaddrl	%g6,	%o2,	%i4
	movne	%xcc,	%l5,	%o7
	fnot1s	%f24,	%f6
	edge32	%o4,	%g3,	%o3
	st	%f20,	[%l7 + 0x5C]
	fornot1	%f28,	%f16,	%f10
	and	%i6,	%g1,	%i7
	lduh	[%l7 + 0x36],	%i3
	fpadd32s	%f8,	%f27,	%f17
	fsrc2	%f16,	%f10
	stb	%l0,	[%l7 + 0x72]
	std	%f4,	[%l7 + 0x60]
	array32	%o1,	%i2,	%o5
	fmovrslez	%g5,	%f16,	%f10
	edge32	%g2,	%g7,	%o6
	bshuffle	%f12,	%f8,	%f24
	array16	%l4,	%l6,	%l3
	or	%i0,	0x035F,	%g4
	movvs	%icc,	%i1,	%i5
	srl	%o0,	%l2,	%l1
	movleu	%xcc,	%g6,	%o2
	bshuffle	%f24,	%f20,	%f22
	movrgez	%i4,	0x3FD,	%l5
	edge32l	%o7,	%g3,	%o4
	movrgz	%i6,	%o3,	%g1
	restore %i3, 0x1F9C, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%o1,	%i7,	%o5
	movneg	%icc,	%i2,	%g5
	xnorcc	%g7,	%g2,	%l4
	fandnot1s	%f23,	%f29,	%f11
	movgu	%icc,	%l6,	%o6
	fcmpne32	%f18,	%f26,	%i0
	fmovdn	%xcc,	%f29,	%f7
	lduw	[%l7 + 0x38],	%g4
	xorcc	%l3,	%i1,	%i5
	fcmpgt16	%f8,	%f18,	%l2
	movn	%xcc,	%o0,	%l1
	mulscc	%o2,	0x0501,	%i4
	edge8	%l5,	%g6,	%o7
	stx	%o4,	[%l7 + 0x18]
	fmovdgu	%icc,	%f23,	%f25
	fmul8ulx16	%f14,	%f22,	%f16
	fandnot1	%f26,	%f30,	%f18
	subc	%g3,	%o3,	%i6
	srl	%g1,	%l0,	%o1
	or	%i7,	0x1CD0,	%o5
	lduw	[%l7 + 0x3C],	%i2
	std	%f12,	[%l7 + 0x40]
	ldd	[%l7 + 0x60],	%f26
	movrgz	%i3,	0x1F0,	%g7
	sdivcc	%g5,	0x0220,	%l4
	movrgz	%l6,	0x2EE,	%o6
	edge8n	%i0,	%g2,	%l3
	movrgez	%i1,	%g4,	%i5
	ldd	[%l7 + 0x10],	%f26
	fmovdleu	%xcc,	%f19,	%f30
	movl	%icc,	%l2,	%l1
	smul	%o0,	%o2,	%i4
	sethi	0x158C,	%g6
	movn	%xcc,	%l5,	%o7
	fmovdleu	%xcc,	%f20,	%f12
	edge32l	%g3,	%o3,	%o4
	movl	%icc,	%i6,	%g1
	orncc	%l0,	%i7,	%o5
	fpadd16s	%f18,	%f15,	%f19
	ldd	[%l7 + 0x70],	%f14
	fornot1s	%f30,	%f1,	%f14
	orn	%o1,	%i2,	%i3
	addc	%g7,	0x05FD,	%g5
	andn	%l6,	0x111D,	%o6
	udivcc	%i0,	0x04E6,	%g2
	subccc	%l3,	0x0526,	%i1
	edge16n	%l4,	%i5,	%g4
	stw	%l1,	[%l7 + 0x58]
	srax	%l2,	0x13,	%o0
	setx loop_1, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_1: 	edge8ln	%l5,	%i4,	%o7
	movpos	%xcc,	%g3,	%o3
	edge32	%i6,	%o4,	%l0
	fandnot2s	%f28,	%f21,	%f25
	fmovdvc	%icc,	%f15,	%f17
	andncc	%g1,	%i7,	%o5
	orcc	%i2,	%i3,	%o1
	edge16	%g7,	%l6,	%o6
	st	%f1,	[%l7 + 0x68]
	ldsh	[%l7 + 0x18],	%g5
	fnot2s	%f24,	%f26
	array16	%g2,	%l3,	%i0
	stx	%i1,	[%l7 + 0x48]
	xor	%i5,	0x046B,	%l4
	or	%l1,	0x0B30,	%l2
	fand	%f16,	%f14,	%f4
	fsrc1	%f14,	%f20
	xor	%o0,	%o2,	%g4
	edge8	%g6,	%i4,	%l5
	std	%f14,	[%l7 + 0x10]
	st	%f15,	[%l7 + 0x74]
	xorcc	%o7,	0x043D,	%g3
	udivcc	%i6,	0x01B6,	%o4
	movrgz	%o3,	0x35A,	%l0
	sth	%g1,	[%l7 + 0x4E]
	orcc	%i7,	0x0AF5,	%o5
	movrgez	%i3,	0x0A6,	%i2
	fmovdleu	%icc,	%f1,	%f18
	andn	%o1,	%g7,	%o6
	fabss	%f22,	%f19
	udivx	%g5,	0x1A6B,	%l6
	sethi	0x07B8,	%g2
	movge	%icc,	%l3,	%i1
	sub	%i0,	0x1BBD,	%i5
	fzero	%f20
	sdiv	%l4,	0x0150,	%l1
	edge16	%l2,	%o0,	%g4
	umul	%o2,	0x056A,	%i4
	movgu	%icc,	%g6,	%l5
	ldd	[%l7 + 0x10],	%f20
	sllx	%g3,	%i6,	%o7
	alignaddrl	%o3,	%l0,	%g1
	fnegs	%f8,	%f26
	fmovrslez	%o4,	%f22,	%f22
	movl	%xcc,	%o5,	%i3
	move	%icc,	%i7,	%o1
	fmovde	%icc,	%f28,	%f9
	movleu	%xcc,	%g7,	%i2
	edge32l	%g5,	%l6,	%g2
	edge8l	%o6,	%l3,	%i1
	fmovrsgz	%i5,	%f27,	%f13
	siam	0x0
	orn	%i0,	%l1,	%l2
	edge32	%o0,	%g4,	%o2
	edge8	%i4,	%g6,	%l5
	xnorcc	%l4,	%i6,	%o7
	udivcc	%g3,	0x04D8,	%o3
	edge8	%l0,	%o4,	%g1
	udiv	%i3,	0x0E3A,	%i7
	stw	%o5,	[%l7 + 0x68]
	edge32ln	%g7,	%o1,	%i2
	fmovsne	%xcc,	%f7,	%f28
	fcmple16	%f24,	%f22,	%l6
	umulcc	%g2,	%g5,	%l3
	bshuffle	%f20,	%f24,	%f0
	andn	%i1,	%i5,	%o6
	sethi	0x0A1F,	%l1
	xorcc	%i0,	%l2,	%o0
	fmovdg	%icc,	%f4,	%f3
	fmovscs	%icc,	%f3,	%f7
	edge16l	%o2,	%g4,	%g6
	addccc	%i4,	0x1C36,	%l5
	fand	%f18,	%f16,	%f8
	st	%f11,	[%l7 + 0x38]
	fmovrse	%l4,	%f31,	%f16
	smulcc	%o7,	%i6,	%g3
	edge8ln	%o3,	%o4,	%g1
	sdivcc	%i3,	0x139C,	%i7
	sllx	%o5,	0x12,	%g7
	lduw	[%l7 + 0x4C],	%o1
	xnor	%l0,	0x04BA,	%i2
	smulcc	%l6,	0x1BAD,	%g5
	or	%g2,	%l3,	%i5
	fcmpeq32	%f2,	%f18,	%o6
	or	%l1,	0x05AF,	%i1
	subccc	%l2,	%o0,	%i0
	std	%f10,	[%l7 + 0x10]
	ldsb	[%l7 + 0x1A],	%o2
	srax	%g6,	0x1A,	%i4
	andncc	%g4,	%l5,	%o7
	stx	%l4,	[%l7 + 0x58]
	movre	%g3,	0x29B,	%i6
	andncc	%o4,	%o3,	%g1
	ld	[%l7 + 0x0C],	%f15
	movn	%icc,	%i7,	%i3
	xnorcc	%g7,	%o5,	%o1
	fmuld8ulx16	%f14,	%f16,	%f20
	nop
	set	0x2E, %o2
	sth	%i2,	[%l7 + %o2]
	ldx	[%l7 + 0x08],	%l6
	sll	%g5,	0x09,	%l0
	movneg	%xcc,	%g2,	%l3
	udiv	%i5,	0x04D6,	%o6
	fornot1	%f10,	%f4,	%f30
	sth	%l1,	[%l7 + 0x56]
	mulx	%l2,	%o0,	%i0
	mulx	%o2,	0x0E00,	%i1
	ldsw	[%l7 + 0x68],	%g6
	fnand	%f10,	%f28,	%f6
	movrgz	%g4,	%i4,	%l5
	alignaddr	%o7,	%l4,	%i6
	fxors	%f8,	%f0,	%f24
	fcmple16	%f2,	%f8,	%o4
	srlx	%g3,	0x12,	%g1
	sll	%i7,	0x17,	%i3
	array8	%g7,	%o5,	%o1
	ldd	[%l7 + 0x60],	%i2
	smul	%o3,	0x05E5,	%g5
	xnor	%l6,	0x0301,	%l0
	smulcc	%l3,	%g2,	%i5
	fabsd	%f6,	%f12
	std	%f22,	[%l7 + 0x18]
	fmovsleu	%xcc,	%f31,	%f2
	fpackfix	%f4,	%f29
	udivx	%o6,	0x1C28,	%l2
	movgu	%xcc,	%l1,	%o0
	edge32l	%i0,	%i1,	%o2
	or	%g4,	0x1048,	%g6
	array8	%l5,	%i4,	%o7
	srax	%l4,	%i6,	%o4
	ldsh	[%l7 + 0x3E],	%g3
	fmul8x16al	%f29,	%f30,	%f8
	ldx	[%l7 + 0x08],	%g1
	sethi	0x16EE,	%i7
	edge8n	%i3,	%o5,	%g7
	orncc	%i2,	0x1CA1,	%o3
	st	%f20,	[%l7 + 0x58]
	fpackfix	%f26,	%f25
	addcc	%g5,	%o1,	%l0
	movn	%icc,	%l3,	%l6
	alignaddr	%g2,	%i5,	%o6
	or	%l1,	%o0,	%l2
	sdivx	%i0,	0x0194,	%o2
	subc	%i1,	%g6,	%g4
	fmovsge	%xcc,	%f28,	%f24
	alignaddrl	%l5,	%i4,	%o7
	movcs	%xcc,	%l4,	%o4
	ldd	[%l7 + 0x10],	%i6
	ldsh	[%l7 + 0x6A],	%g3
	nop
	set	0x0C, %g4
	stw	%g1,	[%l7 + %g4]
	ldsh	[%l7 + 0x32],	%i7
	movpos	%xcc,	%o5,	%i3
	fcmple16	%f2,	%f30,	%i2
	movneg	%icc,	%g7,	%g5
	edge32ln	%o3,	%o1,	%l3
	udivcc	%l6,	0x0F5A,	%l0
	ldx	[%l7 + 0x58],	%i5
	edge32n	%g2,	%o6,	%l1
	fcmps	%fcc1,	%f28,	%f17
	andcc	%l2,	%i0,	%o2
	xor	%o0,	0x194E,	%g6
	fmovdgu	%icc,	%f20,	%f22
	fmovspos	%icc,	%f11,	%f26
	lduw	[%l7 + 0x08],	%g4
	siam	0x3
	sll	%i1,	0x14,	%l5
	edge8n	%o7,	%i4,	%l4
	fzeros	%f12
	fnor	%f2,	%f16,	%f28
	udiv	%i6,	0x002A,	%g3
	fcmpne32	%f16,	%f26,	%o4
	fcmpgt32	%f22,	%f14,	%g1
	alignaddr	%i7,	%o5,	%i2
	alignaddrl	%g7,	%g5,	%i3
	movre	%o3,	0x399,	%o1
	udivcc	%l6,	0x04B1,	%l3
	movrlz	%l0,	0x04C,	%i5
	fmovs	%f3,	%f16
	fmovscc	%xcc,	%f26,	%f14
	edge32	%g2,	%o6,	%l1
	stb	%l2,	[%l7 + 0x3A]
	andcc	%i0,	0x1D32,	%o0
	movge	%xcc,	%o2,	%g4
	ldx	[%l7 + 0x40],	%i1
	movn	%icc,	%g6,	%l5
	fand	%f30,	%f2,	%f20
	move	%icc,	%i4,	%o7
	fmovsn	%xcc,	%f10,	%f30
	mova	%xcc,	%l4,	%i6
	movrlz	%o4,	0x1F2,	%g3
	sth	%i7,	[%l7 + 0x50]
	mulscc	%g1,	%i2,	%o5
	udivx	%g7,	0x0EEE,	%g5
	smul	%o3,	%i3,	%o1
	movrlez	%l3,	%l0,	%l6
	sethi	0x1F19,	%g2
	orn	%o6,	0x1749,	%i5
	fmovdle	%icc,	%f10,	%f9
	andcc	%l1,	0x0A1C,	%i0
	subcc	%l2,	%o2,	%g4
	smul	%o0,	0x0300,	%g6
	sdivx	%i1,	0x1A4B,	%l5
	add	%o7,	0x058F,	%l4
	for	%f18,	%f18,	%f28
	andcc	%i6,	0x1198,	%o4
	mova	%icc,	%g3,	%i4
	movvs	%icc,	%g1,	%i2
	sll	%o5,	%g7,	%g5
	edge16	%o3,	%i3,	%i7
	srax	%l3,	0x17,	%l0
	alignaddr	%l6,	%o1,	%g2
	subcc	%i5,	0x107A,	%l1
	ldd	[%l7 + 0x58],	%f8
	fmovdle	%icc,	%f8,	%f22
	stw	%o6,	[%l7 + 0x0C]
	restore %l2, %i0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o2,	0x1B,	%g6
	orcc	%i1,	0x00C8,	%l5
	edge16l	%o7,	%o0,	%l4
	fsrc1	%f28,	%f12
	andncc	%o4,	%i6,	%i4
	sllx	%g1,	%g3,	%o5
	movpos	%xcc,	%g7,	%g5
	fmovsleu	%xcc,	%f26,	%f14
	nop
	set	0x42, %i6
	lduh	[%l7 + %i6],	%o3
	fxnors	%f10,	%f23,	%f11
	edge8l	%i2,	%i7,	%i3
	mulx	%l3,	0x15B5,	%l0
	array16	%l6,	%g2,	%o1
	movpos	%xcc,	%i5,	%l1
	lduw	[%l7 + 0x6C],	%l2
	lduw	[%l7 + 0x60],	%i0
	orcc	%o6,	%g4,	%o2
	movrgez	%g6,	%l5,	%i1
	subcc	%o7,	%l4,	%o4
	sub	%i6,	0x0921,	%o0
	xnor	%i4,	%g1,	%g3
	fmovdpos	%xcc,	%f9,	%f21
	sll	%g7,	0x03,	%o5
	edge16n	%g5,	%o3,	%i7
	smul	%i3,	%i2,	%l3
	or	%l0,	0x08EF,	%l6
	edge32l	%g2,	%o1,	%l1
	fcmpd	%fcc2,	%f16,	%f22
	ldd	[%l7 + 0x40],	%l2
	fmovsvc	%icc,	%f15,	%f23
	mova	%icc,	%i5,	%o6
	addccc	%i0,	%o2,	%g6
	fmovdleu	%icc,	%f20,	%f9
	fnot1	%f8,	%f18
	or	%g4,	%l5,	%i1
	orcc	%l4,	0x17A5,	%o4
	movvc	%xcc,	%o7,	%o0
	sllx	%i4,	%i6,	%g1
	alignaddr	%g3,	%o5,	%g5
	fmovd	%f16,	%f30
	fcmped	%fcc1,	%f14,	%f26
	movvs	%icc,	%o3,	%g7
	xnorcc	%i3,	0x016C,	%i7
	edge8	%i2,	%l3,	%l0
	fmovspos	%xcc,	%f11,	%f13
	stx	%l6,	[%l7 + 0x38]
	ldx	[%l7 + 0x50],	%o1
	fpadd32	%f4,	%f26,	%f22
	add	%l1,	%l2,	%i5
	movpos	%xcc,	%g2,	%i0
	xor	%o6,	0x096C,	%g6
	movcc	%xcc,	%o2,	%l5
	edge16n	%g4,	%l4,	%i1
	edge16l	%o7,	%o0,	%i4
	st	%f24,	[%l7 + 0x68]
	array8	%o4,	%g1,	%g3
	movg	%xcc,	%i6,	%g5
	ld	[%l7 + 0x44],	%f17
	edge32	%o5,	%g7,	%o3
	xorcc	%i3,	0x03A2,	%i7
	subcc	%l3,	0x1EE3,	%l0
	fpadd16s	%f12,	%f12,	%f22
	movgu	%xcc,	%l6,	%i2
	movge	%xcc,	%l1,	%o1
	fmovrdlez	%i5,	%f14,	%f28
	udivcc	%g2,	0x1BC7,	%l2
	fmuld8sux16	%f18,	%f3,	%f22
	movg	%xcc,	%o6,	%i0
	std	%f16,	[%l7 + 0x28]
	ldsb	[%l7 + 0x46],	%g6
	addcc	%l5,	%g4,	%o2
	save %i1, %o7, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i4,	%o0,	%o4
	fpsub16s	%f24,	%f1,	%f17
	sdivcc	%g1,	0x06CC,	%g3
	movrne	%i6,	%g5,	%g7
	movcc	%xcc,	%o3,	%i3
	fand	%f2,	%f24,	%f10
	movne	%icc,	%o5,	%l3
	alignaddrl	%i7,	%l6,	%l0
	fmovdgu	%xcc,	%f26,	%f7
	edge32ln	%l1,	%i2,	%i5
	edge32l	%o1,	%l2,	%g2
	umul	%i0,	%o6,	%g6
	lduh	[%l7 + 0x46],	%l5
	fpsub32	%f8,	%f16,	%f2
	array8	%o2,	%g4,	%i1
	srlx	%l4,	0x15,	%o7
	movvs	%icc,	%o0,	%o4
	xor	%g1,	0x128C,	%g3
	movrne	%i6,	%g5,	%g7
	movvc	%icc,	%o3,	%i4
	movpos	%xcc,	%o5,	%l3
	movn	%xcc,	%i3,	%i7
	xnor	%l6,	0x127F,	%l0
	fmuld8ulx16	%f17,	%f9,	%f20
	sdiv	%l1,	0x0CD6,	%i2
	andn	%o1,	0x17F5,	%l2
	andn	%i5,	0x1A60,	%g2
	lduh	[%l7 + 0x56],	%i0
	subc	%o6,	0x1CB9,	%l5
	movleu	%xcc,	%o2,	%g4
	movleu	%xcc,	%i1,	%g6
	movg	%icc,	%l4,	%o0
	fnot1	%f22,	%f18
	sir	0x0FAB
	std	%f12,	[%l7 + 0x48]
	fmovdg	%icc,	%f14,	%f0
	movg	%icc,	%o4,	%g1
	fmovrsne	%o7,	%f13,	%f17
	sethi	0x178B,	%i6
	udivcc	%g5,	0x189D,	%g7
	movvc	%xcc,	%g3,	%i4
	movrlez	%o5,	0x3CF,	%l3
	smul	%i3,	0x0ABB,	%i7
	fabss	%f22,	%f27
	edge32ln	%l6,	%o3,	%l0
	array8	%l1,	%i2,	%o1
	srlx	%l2,	0x1F,	%g2
	array8	%i0,	%i5,	%l5
	sll	%o6,	%o2,	%g4
	xnorcc	%i1,	%g6,	%l4
	edge8l	%o4,	%o0,	%o7
	fmovrde	%g1,	%f14,	%f0
	edge8	%i6,	%g5,	%g7
	umul	%g3,	0x1B97,	%o5
	movleu	%icc,	%i4,	%i3
	ldsb	[%l7 + 0x4A],	%l3
	movpos	%xcc,	%l6,	%i7
	alignaddr	%l0,	%o3,	%l1
	mulscc	%i2,	%o1,	%l2
	fmul8ulx16	%f28,	%f2,	%f2
	mulscc	%i0,	%g2,	%i5
	fcmple32	%f26,	%f20,	%l5
	fcmple16	%f12,	%f12,	%o6
	ldsb	[%l7 + 0x5C],	%o2
	subcc	%i1,	0x1840,	%g4
	edge32n	%l4,	%o4,	%o0
	edge16	%o7,	%g6,	%g1
	alignaddrl	%i6,	%g5,	%g3
	edge32ln	%g7,	%o5,	%i3
	orn	%i4,	0x1109,	%l3
	xnorcc	%i7,	0x1018,	%l0
	andn	%l6,	%o3,	%l1
	edge8l	%o1,	%i2,	%i0
	movvc	%xcc,	%l2,	%g2
	edge32	%i5,	%o6,	%o2
	movre	%l5,	0x2E3,	%g4
	array32	%i1,	%o4,	%l4
	stb	%o0,	[%l7 + 0x2B]
	stw	%g6,	[%l7 + 0x54]
	ldd	[%l7 + 0x50],	%f16
	fcmpgt16	%f24,	%f14,	%g1
	movne	%icc,	%o7,	%i6
	fnot2s	%f16,	%f18
	ldd	[%l7 + 0x58],	%g2
	edge32	%g7,	%o5,	%g5
	xnor	%i4,	0x19C5,	%i3
	ldub	[%l7 + 0x58],	%i7
	fmul8ulx16	%f14,	%f24,	%f22
	ldsw	[%l7 + 0x18],	%l3
	movrlz	%l6,	0x0DC,	%o3
	srlx	%l1,	0x12,	%o1
	edge8l	%i2,	%i0,	%l0
	xor	%l2,	%i5,	%g2
	addccc	%o2,	0x16D7,	%l5
	ldsb	[%l7 + 0x25],	%o6
	fmovsge	%xcc,	%f9,	%f7
	ldd	[%l7 + 0x78],	%g4
	fzero	%f30
	ldsw	[%l7 + 0x44],	%o4
	setx loop_2, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_2: 	udivcc	%i1,	0x03B3,	%o7
	fmovrsne	%g1,	%f6,	%f4
	nop
	set	0x50, %g2
	std	%f6,	[%l7 + %g2]
	smul	%g3,	0x05B9,	%g7
	edge16n	%i6,	%o5,	%g5
	fors	%f13,	%f0,	%f19
	fmovdg	%xcc,	%f28,	%f27
	st	%f17,	[%l7 + 0x24]
	ldsh	[%l7 + 0x70],	%i4
	sra	%i7,	%l3,	%i3
	movleu	%xcc,	%o3,	%l6
	srax	%o1,	0x18,	%i2
	array16	%i0,	%l1,	%l0
	fmovsneg	%xcc,	%f15,	%f6
	movrgez	%i5,	0x028,	%l2
	fmovdvs	%icc,	%f31,	%f27
	addc	%g2,	0x125D,	%l5
	addcc	%o2,	0x1C85,	%o6
	ldd	[%l7 + 0x10],	%f4
	add	%g4,	%l4,	%o4
	fmovse	%icc,	%f9,	%f16
	udiv	%o0,	0x1A01,	%i1
	andcc	%o7,	%g6,	%g3
	edge16n	%g1,	%g7,	%i6
	orcc	%o5,	%g5,	%i4
	srlx	%l3,	%i7,	%o3
	fmovrsgez	%i3,	%f22,	%f28
	smul	%l6,	%i2,	%o1
	array32	%i0,	%l1,	%l0
	ldd	[%l7 + 0x28],	%i4
	fpadd16	%f20,	%f12,	%f10
	fmovd	%f16,	%f8
	movneg	%icc,	%l2,	%l5
	smul	%o2,	0x128B,	%o6
	movcc	%icc,	%g4,	%l4
	movg	%xcc,	%o4,	%g2
	subcc	%i1,	%o7,	%g6
	and	%g3,	0x1DEF,	%g1
	andcc	%o0,	0x0810,	%i6
	smulcc	%g7,	0x1CD4,	%g5
	udiv	%o5,	0x10E1,	%l3
	faligndata	%f24,	%f28,	%f12
	movneg	%icc,	%i7,	%i4
	fnegs	%f3,	%f4
	edge16	%o3,	%i3,	%l6
	lduh	[%l7 + 0x4C],	%i2
	smul	%o1,	0x14AB,	%l1
	srax	%i0,	0x05,	%i5
	edge16	%l0,	%l5,	%l2
	fpackfix	%f4,	%f23
	array32	%o6,	%g4,	%o2
	subcc	%l4,	0x1C6B,	%o4
	fnot1	%f6,	%f12
	fmovsvc	%icc,	%f28,	%f23
	sllx	%i1,	0x18,	%g2
	sethi	0x1CAB,	%g6
	movg	%xcc,	%g3,	%g1
	edge16ln	%o0,	%o7,	%g7
	andcc	%g5,	0x0D98,	%i6
	ldx	[%l7 + 0x50],	%o5
	lduh	[%l7 + 0x3A],	%i7
	ldd	[%l7 + 0x70],	%f16
	edge16n	%l3,	%o3,	%i4
	movrlz	%l6,	%i2,	%o1
	sdivx	%i3,	0x0F00,	%i0
	fmovspos	%xcc,	%f27,	%f26
	edge8l	%l1,	%i5,	%l0
	nop
	set	0x08, %g5
	lduw	[%l7 + %g5],	%l5
	fcmps	%fcc2,	%f19,	%f17
	edge32n	%o6,	%l2,	%g4
	movl	%xcc,	%o2,	%o4
	fpadd16	%f2,	%f14,	%f4
	orncc	%l4,	0x0463,	%g2
	lduh	[%l7 + 0x74],	%g6
	pdist	%f14,	%f18,	%f10
	smulcc	%g3,	0x066B,	%i1
	movrlz	%o0,	%g1,	%g7
	sub	%g5,	0x0544,	%o7
	addc	%o5,	%i6,	%l3
	movpos	%xcc,	%i7,	%i4
	fmovdl	%icc,	%f16,	%f17
	pdist	%f28,	%f10,	%f6
	fsrc1s	%f15,	%f21
	smulcc	%l6,	0x078F,	%o3
	fcmpes	%fcc2,	%f31,	%f15
	fmovdvs	%xcc,	%f9,	%f0
	ldd	[%l7 + 0x50],	%o0
	movrlz	%i3,	0x36D,	%i2
	fmovsg	%icc,	%f6,	%f5
	std	%f18,	[%l7 + 0x58]
	xnor	%i0,	%i5,	%l0
	fsrc2s	%f12,	%f23
	ldx	[%l7 + 0x28],	%l1
	stb	%l5,	[%l7 + 0x1C]
	fmovdn	%xcc,	%f4,	%f16
	fmovsneg	%xcc,	%f13,	%f7
	sra	%l2,	0x15,	%o6
	fmuld8ulx16	%f11,	%f28,	%f16
	movre	%o2,	%g4,	%l4
	orcc	%o4,	%g2,	%g3
	xorcc	%i1,	0x1AD6,	%g6
	movle	%icc,	%g1,	%g7
	movrgez	%g5,	0x321,	%o0
	umulcc	%o5,	0x1A64,	%o7
	movcc	%xcc,	%l3,	%i6
	movleu	%icc,	%i4,	%l6
	movrlz	%i7,	0x05F,	%o3
	orn	%o1,	0x06F4,	%i3
	udiv	%i0,	0x0D8E,	%i2
	xnor	%l0,	0x1B30,	%i5
	fmovdpos	%xcc,	%f23,	%f4
	sllx	%l1,	%l5,	%l2
	fnot2s	%f6,	%f26
	movg	%icc,	%o2,	%g4
	sdiv	%o6,	0x0CEB,	%l4
	movl	%icc,	%o4,	%g3
	andn	%i1,	0x0B53,	%g6
	sdivx	%g2,	0x030D,	%g1
	addccc	%g5,	%g7,	%o5
	ld	[%l7 + 0x54],	%f19
	subccc	%o7,	0x0E8A,	%o0
	edge16l	%l3,	%i4,	%i6
	ldsb	[%l7 + 0x37],	%l6
	sth	%i7,	[%l7 + 0x5E]
	fmovsge	%icc,	%f9,	%f0
	fmovrdne	%o3,	%f20,	%f16
	movg	%xcc,	%i3,	%o1
	andcc	%i2,	%l0,	%i5
	stw	%i0,	[%l7 + 0x38]
	subccc	%l5,	%l2,	%l1
	edge32n	%o2,	%g4,	%o6
	fmovrsgz	%o4,	%f28,	%f29
	fmovdgu	%icc,	%f13,	%f29
	xor	%l4,	%i1,	%g3
	stw	%g6,	[%l7 + 0x6C]
	restore %g1, %g2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%g5,	0x02,	%o7
	sethi	0x04BF,	%o5
	edge16n	%l3,	%o0,	%i6
	fabsd	%f22,	%f16
	addcc	%l6,	%i7,	%o3
	andn	%i4,	%o1,	%i3
	stw	%i2,	[%l7 + 0x20]
	or	%i5,	0x0629,	%l0
	edge16l	%l5,	%l2,	%l1
	lduw	[%l7 + 0x48],	%i0
	array16	%g4,	%o2,	%o4
	sllx	%l4,	%o6,	%i1
	ldsh	[%l7 + 0x18],	%g6
	edge32l	%g1,	%g3,	%g7
	xor	%g2,	%g5,	%o7
	fandnot1s	%f12,	%f7,	%f16
	alignaddrl	%o5,	%o0,	%i6
	nop
	set	0x58, %o3
	lduw	[%l7 + %o3],	%l6
	alignaddr	%i7,	%l3,	%i4
	srl	%o1,	0x14,	%o3
	ldx	[%l7 + 0x18],	%i2
	edge16	%i5,	%l0,	%l5
	movne	%xcc,	%i3,	%l2
	smul	%l1,	0x062F,	%i0
	edge8n	%g4,	%o4,	%o2
	stw	%o6,	[%l7 + 0x6C]
	movrne	%l4,	0x0C4,	%i1
	ldx	[%l7 + 0x78],	%g6
	movpos	%xcc,	%g3,	%g1
	fpack16	%f0,	%f29
	subc	%g7,	0x0724,	%g2
	movn	%xcc,	%g5,	%o7
	stw	%o5,	[%l7 + 0x74]
	fpackfix	%f20,	%f27
	subcc	%o0,	%i6,	%l6
	fmovdne	%icc,	%f2,	%f16
	smul	%l3,	%i4,	%i7
	std	%f12,	[%l7 + 0x48]
	andn	%o3,	%i2,	%o1
	st	%f28,	[%l7 + 0x68]
	umulcc	%i5,	0x11C3,	%l5
	fxnor	%f30,	%f24,	%f14
	array32	%l0,	%l2,	%l1
	fmovsgu	%icc,	%f19,	%f28
	sllx	%i3,	0x04,	%i0
	movrne	%g4,	%o4,	%o2
	fands	%f31,	%f30,	%f14
	addcc	%l4,	0x1197,	%i1
	sdiv	%g6,	0x154F,	%g3
	stb	%g1,	[%l7 + 0x1B]
	fmovrslez	%g7,	%f2,	%f7
	movrne	%o6,	%g5,	%g2
	fxnors	%f9,	%f11,	%f18
	udivx	%o5,	0x04F9,	%o0
	fxnor	%f2,	%f22,	%f22
	movle	%icc,	%o7,	%i6
	lduw	[%l7 + 0x10],	%l6
	movg	%xcc,	%l3,	%i7
	sdivcc	%i4,	0x18BF,	%i2
	fcmps	%fcc1,	%f3,	%f0
	movg	%xcc,	%o1,	%i5
	movrgz	%l5,	%o3,	%l0
	movge	%icc,	%l2,	%l1
	orncc	%i0,	0x0B4B,	%i3
	sdiv	%o4,	0x08CF,	%g4
	st	%f13,	[%l7 + 0x60]
	smul	%o2,	0x0D82,	%i1
	fmul8x16	%f8,	%f20,	%f6
	fcmpeq16	%f0,	%f14,	%l4
	edge16	%g6,	%g1,	%g7
	st	%f17,	[%l7 + 0x54]
	sdivcc	%o6,	0x0285,	%g3
	and	%g2,	%o5,	%g5
	alignaddr	%o0,	%i6,	%o7
	ldub	[%l7 + 0x24],	%l3
	fmovdne	%icc,	%f0,	%f26
	subccc	%l6,	%i4,	%i2
	xorcc	%o1,	%i7,	%i5
	andncc	%l5,	%o3,	%l2
	lduw	[%l7 + 0x70],	%l0
	fmovdcc	%icc,	%f12,	%f11
	movge	%xcc,	%l1,	%i0
	fone	%f30
	fmuld8sux16	%f31,	%f24,	%f10
	umul	%o4,	0x0BF9,	%g4
	srax	%i3,	0x07,	%i1
	stw	%l4,	[%l7 + 0x6C]
	movpos	%xcc,	%o2,	%g1
	stx	%g7,	[%l7 + 0x60]
	save %o6, %g3, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x50],	%f7
	edge16n	%g2,	%g5,	%o0
	movre	%i6,	0x06A,	%o7
	ldd	[%l7 + 0x70],	%f18
	fcmpne16	%f20,	%f12,	%l3
	ldd	[%l7 + 0x48],	%o4
	ldd	[%l7 + 0x50],	%i6
	subc	%i2,	0x040F,	%o1
	st	%f1,	[%l7 + 0x64]
	movcs	%icc,	%i4,	%i5
	ldd	[%l7 + 0x10],	%f10
	stb	%l5,	[%l7 + 0x60]
	andcc	%i7,	0x1A5B,	%l2
	ldub	[%l7 + 0x28],	%o3
	fmovrslz	%l0,	%f25,	%f17
	and	%i0,	%o4,	%g4
	fnors	%f27,	%f21,	%f9
	subccc	%l1,	0x19FF,	%i1
	edge32	%i3,	%o2,	%l4
	sethi	0x1D52,	%g1
	add	%g7,	0x02AF,	%g3
	movre	%o6,	0x3C6,	%g6
	srax	%g5,	0x18,	%o0
	alignaddr	%g2,	%i6,	%o7
	edge16n	%l3,	%o5,	%l6
	or	%i2,	%o1,	%i4
	st	%f19,	[%l7 + 0x18]
	xnor	%l5,	%i7,	%i5
	movvs	%xcc,	%l2,	%o3
	xor	%i0,	0x0BCB,	%l0
	move	%icc,	%g4,	%l1
	alignaddrl	%i1,	%o4,	%i3
	lduw	[%l7 + 0x58],	%o2
	mulx	%g1,	0x0992,	%l4
	orn	%g3,	0x077F,	%o6
	edge8n	%g6,	%g5,	%g7
	stx	%g2,	[%l7 + 0x68]
	edge8	%o0,	%i6,	%l3
	edge8n	%o5,	%o7,	%i2
	movrlez	%o1,	0x1EF,	%i4
	andn	%l5,	0x1023,	%l6
	sethi	0x15A3,	%i5
	mulscc	%i7,	0x060A,	%o3
	movle	%xcc,	%i0,	%l0
	sdivx	%g4,	0x155F,	%l1
	edge8	%l2,	%i1,	%o4
	move	%xcc,	%o2,	%i3
	subccc	%g1,	0x0B6B,	%g3
	movcc	%xcc,	%l4,	%o6
	movpos	%icc,	%g5,	%g6
	fsrc2s	%f12,	%f5
	srax	%g2,	0x11,	%o0
	sth	%i6,	[%l7 + 0x64]
	sethi	0x1F12,	%l3
	array16	%o5,	%o7,	%g7
	edge32ln	%i2,	%o1,	%l5
	edge32	%l6,	%i5,	%i4
	fmovrdlz	%o3,	%f2,	%f26
	andcc	%i0,	%l0,	%i7
	array32	%l1,	%g4,	%i1
	sethi	0x0341,	%l2
	smulcc	%o4,	%o2,	%i3
	addccc	%g1,	%g3,	%l4
	fmovdvc	%icc,	%f10,	%f10
	udivcc	%o6,	0x1187,	%g6
	srlx	%g5,	0x16,	%o0
	movrgz	%g2,	%i6,	%l3
	lduw	[%l7 + 0x14],	%o5
	xnorcc	%g7,	0x1972,	%o7
	edge8l	%i2,	%o1,	%l5
	ldub	[%l7 + 0x1A],	%l6
	umulcc	%i5,	%i4,	%i0
	movleu	%icc,	%l0,	%o3
	movgu	%icc,	%i7,	%g4
	udivx	%i1,	0x18E7,	%l1
	movrgz	%o4,	0x264,	%o2
	srax	%i3,	%l2,	%g1
	movrne	%g3,	%o6,	%g6
	fmovsvc	%icc,	%f10,	%f3
	fcmpne32	%f10,	%f2,	%l4
	fmovrde	%g5,	%f6,	%f20
	movvs	%icc,	%o0,	%g2
	movre	%l3,	0x008,	%o5
	edge8	%g7,	%o7,	%i6
	smulcc	%o1,	%i2,	%l6
	movgu	%xcc,	%i5,	%l5
	mova	%xcc,	%i4,	%i0
	edge8l	%o3,	%i7,	%l0
	movvs	%xcc,	%i1,	%l1
	srlx	%o4,	0x03,	%o2
	movn	%xcc,	%g4,	%l2
	movcs	%xcc,	%i3,	%g1
	sdivcc	%o6,	0x1368,	%g6
	fmovdcc	%xcc,	%f26,	%f29
	udivcc	%g3,	0x1DF9,	%g5
	fmovdvc	%xcc,	%f2,	%f11
	sub	%o0,	0x1333,	%g2
	xor	%l4,	%o5,	%l3
	fmul8x16au	%f8,	%f11,	%f12
	sdiv	%o7,	0x0D4F,	%g7
	edge32	%o1,	%i2,	%l6
	array16	%i5,	%l5,	%i4
	mulscc	%i0,	%i6,	%i7
	xnorcc	%o3,	%l0,	%i1
	xorcc	%l1,	%o2,	%o4
	edge16l	%g4,	%l2,	%i3
	edge8n	%o6,	%g6,	%g3
	addccc	%g1,	%o0,	%g2
	edge16ln	%g5,	%o5,	%l3
	edge32n	%o7,	%l4,	%o1
	save %i2, %l6, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l5,	%i5,	%i4
	lduw	[%l7 + 0x40],	%i0
	sra	%i7,	0x00,	%i6
	movge	%xcc,	%o3,	%i1
	srlx	%l1,	%o2,	%l0
	fcmped	%fcc1,	%f20,	%f4
	ldd	[%l7 + 0x40],	%f14
	stb	%g4,	[%l7 + 0x20]
	udivcc	%l2,	0x145F,	%o4
	stw	%o6,	[%l7 + 0x74]
	fmovrse	%i3,	%f11,	%f15
	mulscc	%g6,	%g3,	%o0
	ldsb	[%l7 + 0x27],	%g2
	movleu	%icc,	%g1,	%g5
	sth	%o5,	[%l7 + 0x5E]
	movrgez	%l3,	%o7,	%l4
	fmovse	%xcc,	%f26,	%f0
	or	%i2,	0x012D,	%l6
	lduw	[%l7 + 0x54],	%o1
	fornot2s	%f28,	%f8,	%f7
	stb	%g7,	[%l7 + 0x7B]
	edge16n	%l5,	%i4,	%i5
	setx loop_3, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_3: 	movcs	%icc,	%i1,	%l1
	save %o2, %l0, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movn	%icc,	%l2,	%o4
	fmovdcc	%xcc,	%f27,	%f15
	movleu	%icc,	%o6,	%i3
	edge16	%g6,	%g3,	%o0
	movrne	%g2,	%g1,	%i6
	fpmerge	%f14,	%f13,	%f10
	andn	%o5,	%g5,	%o7
	movvc	%icc,	%l4,	%i2
	fmovrsne	%l6,	%f31,	%f31
	edge16n	%l3,	%g7,	%o1
	edge16n	%i4,	%l5,	%i0
	ld	[%l7 + 0x44],	%f25
	movvs	%xcc,	%i5,	%o3
	fcmple32	%f30,	%f14,	%i7
	fmovrsgez	%l1,	%f27,	%f31
	movle	%xcc,	%i1,	%o2
	st	%f3,	[%l7 + 0x58]
	sdivx	%g4,	0x17BE,	%l2
	fmovrsne	%o4,	%f9,	%f13
	edge16l	%o6,	%l0,	%i3
	movre	%g3,	0x1B1,	%g6
	movcc	%icc,	%g2,	%g1
	fpsub32	%f28,	%f16,	%f30
	faligndata	%f0,	%f0,	%f2
	movn	%icc,	%i6,	%o0
	ldub	[%l7 + 0x7C],	%g5
	ldsh	[%l7 + 0x5C],	%o7
	sethi	0x1998,	%l4
	sll	%i2,	0x10,	%l6
	smulcc	%o5,	%l3,	%g7
	ldsh	[%l7 + 0x74],	%o1
	array32	%l5,	%i4,	%i5
	fnands	%f19,	%f31,	%f2
	fcmpeq32	%f2,	%f10,	%o3
	faligndata	%f14,	%f18,	%f24
	mova	%xcc,	%i7,	%l1
	sth	%i0,	[%l7 + 0x1A]
	fmovdcs	%xcc,	%f1,	%f9
	stb	%o2,	[%l7 + 0x6D]
	smulcc	%g4,	%i1,	%o4
	movvc	%xcc,	%l2,	%o6
	st	%f30,	[%l7 + 0x74]
	movcs	%icc,	%i3,	%g3
	fcmpgt32	%f22,	%f28,	%l0
	stb	%g6,	[%l7 + 0x3E]
	addcc	%g2,	0x0352,	%g1
	fxnor	%f26,	%f26,	%f30
	srax	%i6,	0x0A,	%g5
	fnor	%f6,	%f12,	%f18
	fandnot2s	%f3,	%f21,	%f21
	fnegs	%f0,	%f18
	fmovdl	%xcc,	%f14,	%f13
	sdivcc	%o7,	0x1484,	%o0
	fmul8x16au	%f31,	%f9,	%f26
	fmovdge	%xcc,	%f29,	%f16
	std	%f20,	[%l7 + 0x58]
	orn	%i2,	0x065A,	%l6
	orcc	%l4,	0x041B,	%l3
	fmovrde	%g7,	%f0,	%f4
	std	%f6,	[%l7 + 0x48]
	fmovdneg	%icc,	%f4,	%f3
	edge32l	%o5,	%o1,	%l5
	udivcc	%i4,	0x0003,	%i5
	fmovrdlez	%o3,	%f28,	%f10
	sdivx	%i7,	0x1668,	%i0
	edge32n	%l1,	%g4,	%i1
	fexpand	%f20,	%f24
	andn	%o2,	0x0D92,	%l2
	edge32n	%o4,	%o6,	%i3
	xnorcc	%l0,	0x0520,	%g6
	fnand	%f2,	%f16,	%f28
	st	%f12,	[%l7 + 0x40]
	srlx	%g3,	0x0C,	%g2
	edge32n	%i6,	%g5,	%g1
	restore %o0, %o7, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%i2,	[%l7 + 0x4E]
	fpsub32s	%f22,	%f3,	%f5
	fmovrdgez	%l4,	%f8,	%f26
	popc	%l3,	%g7
	movn	%icc,	%o5,	%o1
	setx loop_4, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_4: 	movrgez	%i4,	%i0,	%l1
	stx	%i7,	[%l7 + 0x58]
	fmuld8ulx16	%f10,	%f25,	%f16
	lduh	[%l7 + 0x50],	%g4
	fpadd16s	%f0,	%f17,	%f3
	fabss	%f1,	%f17
	fornot1	%f18,	%f18,	%f30
	fors	%f14,	%f16,	%f29
	fmuld8sux16	%f18,	%f16,	%f4
	mova	%icc,	%i1,	%l2
	smul	%o4,	0x124D,	%o2
	movcs	%icc,	%i3,	%l0
	subc	%g6,	%g3,	%o6
	ldd	[%l7 + 0x68],	%g2
	smulcc	%g5,	0x0B0F,	%i6
	movvc	%xcc,	%o0,	%g1
	fmovsneg	%xcc,	%f29,	%f29
	xnor	%o7,	0x07D1,	%l6
	andcc	%i2,	0x1426,	%l4
	sir	0x18B1
	orcc	%g7,	0x0F62,	%o5
	fmovrsne	%l3,	%f12,	%f20
	fmovrsgez	%l5,	%f2,	%f30
	addc	%o1,	0x0493,	%o3
	fors	%f18,	%f19,	%f31
	fandnot1s	%f13,	%f5,	%f29
	fmovsgu	%icc,	%f30,	%f14
	movge	%xcc,	%i4,	%i0
	sllx	%i5,	%l1,	%g4
	add	%i1,	%i7,	%l2
	lduw	[%l7 + 0x44],	%o2
	fmovsleu	%icc,	%f10,	%f30
	orncc	%o4,	0x02AE,	%l0
	edge16	%g6,	%i3,	%g3
	andn	%g2,	0x0044,	%g5
	array8	%i6,	%o0,	%o6
	mulx	%o7,	%g1,	%i2
	fpack32	%f24,	%f28,	%f26
	fandnot1	%f20,	%f20,	%f18
	fmovsne	%icc,	%f0,	%f15
	fmovsle	%xcc,	%f16,	%f22
	fmovd	%f22,	%f0
	andn	%l4,	%g7,	%l6
	srl	%o5,	%l5,	%o1
	array16	%l3,	%i4,	%o3
	ldd	[%l7 + 0x30],	%i4
	lduh	[%l7 + 0x18],	%i0
	ld	[%l7 + 0x48],	%f22
	movcc	%xcc,	%l1,	%i1
	sra	%g4,	0x1F,	%l2
	edge16l	%i7,	%o4,	%l0
	sdivx	%g6,	0x047D,	%i3
	fnor	%f20,	%f0,	%f8
	srl	%o2,	%g2,	%g5
	movcc	%icc,	%g3,	%o0
	fmovsg	%xcc,	%f13,	%f26
	fcmple32	%f14,	%f8,	%i6
	xnor	%o6,	%g1,	%i2
	stb	%l4,	[%l7 + 0x12]
	subccc	%o7,	%g7,	%o5
	mulx	%l6,	%l5,	%o1
	ldsb	[%l7 + 0x73],	%i4
	edge16l	%o3,	%l3,	%i0
	movrlz	%l1,	0x0F7,	%i1
	movle	%icc,	%g4,	%i5
	sir	0x126F
	sdiv	%l2,	0x01A8,	%i7
	addccc	%o4,	%g6,	%l0
	st	%f21,	[%l7 + 0x18]
	addc	%i3,	%o2,	%g2
	fcmpeq32	%f6,	%f4,	%g3
	movn	%icc,	%g5,	%i6
	ldsh	[%l7 + 0x58],	%o0
	udiv	%o6,	0x1E74,	%i2
	movn	%icc,	%l4,	%o7
	edge16	%g7,	%o5,	%g1
	array8	%l6,	%o1,	%i4
	and	%o3,	0x0743,	%l5
	stb	%l3,	[%l7 + 0x60]
	fmovde	%xcc,	%f25,	%f20
	ldub	[%l7 + 0x73],	%i0
	udivx	%i1,	0x0760,	%g4
	add	%i5,	0x1581,	%l1
	ldub	[%l7 + 0x67],	%i7
	alignaddrl	%l2,	%o4,	%l0
	ldsh	[%l7 + 0x16],	%i3
	stb	%g6,	[%l7 + 0x6A]
	fnot2	%f2,	%f12
	subcc	%g2,	0x1322,	%g3
	edge8l	%o2,	%i6,	%g5
	nop
	set	0x40, %o6
	ldub	[%l7 + %o6],	%o0
	movvs	%xcc,	%o6,	%l4
	subcc	%i2,	0x09F1,	%o7
	ldd	[%l7 + 0x28],	%f2
	stx	%g7,	[%l7 + 0x68]
	fone	%f2
	save %g1, %o5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%i4,	%o1,	%o3
	sdivx	%l3,	0x060F,	%l5
	movcs	%xcc,	%i0,	%i1
	array16	%g4,	%l1,	%i7
	sdiv	%l2,	0x1FB7,	%o4
	save %l0, %i5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g6,	%g2,	%g3
	movle	%xcc,	%o2,	%i6
	edge8ln	%o0,	%g5,	%o6
	fmovdne	%icc,	%f5,	%f27
	sra	%i2,	0x01,	%l4
	fcmple16	%f18,	%f12,	%o7
	sth	%g1,	[%l7 + 0x2E]
	fmovspos	%icc,	%f24,	%f27
	stw	%o5,	[%l7 + 0x0C]
	movvs	%icc,	%l6,	%i4
	stw	%o1,	[%l7 + 0x38]
	movvs	%xcc,	%g7,	%o3
	fmovrdgez	%l3,	%f22,	%f28
	mova	%xcc,	%l5,	%i1
	srax	%g4,	%i0,	%l1
	fmovrde	%l2,	%f6,	%f10
	smul	%i7,	%l0,	%i5
	movpos	%icc,	%i3,	%o4
	movvs	%icc,	%g2,	%g6
	alignaddr	%o2,	%g3,	%i6
	fmovrdlz	%g5,	%f20,	%f20
	and	%o0,	0x0463,	%o6
	addccc	%l4,	0x1298,	%o7
	edge16n	%i2,	%g1,	%o5
	siam	0x1
	alignaddrl	%i4,	%o1,	%g7
	movgu	%icc,	%o3,	%l6
	move	%icc,	%l5,	%i1
	ldub	[%l7 + 0x1D],	%l3
	edge16	%g4,	%i0,	%l1
	movcs	%xcc,	%i7,	%l0
	edge8	%l2,	%i3,	%i5
	fmovrdne	%g2,	%f20,	%f6
	ldsw	[%l7 + 0x28],	%o4
	movpos	%xcc,	%g6,	%o2
	ldd	[%l7 + 0x40],	%f2
	fmovdl	%xcc,	%f20,	%f21
	sub	%g3,	0x076F,	%g5
	xnor	%i6,	0x162C,	%o6
	pdist	%f16,	%f12,	%f10
	subcc	%o0,	%l4,	%o7
	alignaddr	%g1,	%i2,	%o5
	fsrc1s	%f14,	%f21
	addc	%i4,	0x0FA0,	%o1
	edge32	%g7,	%l6,	%l5
	sdiv	%o3,	0x1146,	%l3
	fpackfix	%f24,	%f27
	umulcc	%g4,	0x1531,	%i0
	andn	%i1,	0x0E20,	%i7
	sllx	%l1,	%l0,	%l2
	orncc	%i3,	0x0415,	%i5
	edge8n	%o4,	%g6,	%o2
	std	%f24,	[%l7 + 0x40]
	movrlz	%g3,	%g5,	%i6
	subc	%o6,	0x0F00,	%o0
	fnot1s	%f23,	%f18
	stx	%g2,	[%l7 + 0x10]
	edge8l	%o7,	%g1,	%l4
	fmovsa	%icc,	%f28,	%f21
	xor	%i2,	0x0B58,	%i4
	srlx	%o5,	%g7,	%o1
	movpos	%xcc,	%l6,	%l5
	fxors	%f14,	%f18,	%f14
	addcc	%l3,	0x0B57,	%o3
	fmovsvs	%xcc,	%f2,	%f22
	sdivx	%i0,	0x09E6,	%g4
	movrgez	%i1,	0x2B6,	%l1
	ldd	[%l7 + 0x38],	%f22
	sth	%l0,	[%l7 + 0x0E]
	fnand	%f14,	%f30,	%f30
	st	%f15,	[%l7 + 0x24]
	andcc	%i7,	0x074E,	%i3
	srl	%i5,	%l2,	%o4
	subccc	%o2,	0x0212,	%g3
	ldub	[%l7 + 0x7A],	%g5
	xnorcc	%i6,	%o6,	%g6
	mulx	%o0,	%o7,	%g2
	movrgez	%l4,	0x2F6,	%g1
	xor	%i4,	%i2,	%o5
	fnot2s	%f11,	%f7
	movvc	%icc,	%g7,	%l6
	movne	%icc,	%o1,	%l5
	addccc	%l3,	0x113D,	%i0
	movrlez	%o3,	%i1,	%g4
	subc	%l0,	%l1,	%i7
	srl	%i3,	%l2,	%o4
	movrlz	%o2,	0x312,	%g3
	xorcc	%g5,	0x1E6D,	%i6
	fmovdl	%icc,	%f10,	%f28
	edge32l	%i5,	%o6,	%g6
	nop
	set	0x13, %o1
	ldsb	[%l7 + %o1],	%o0
	fmuld8ulx16	%f0,	%f29,	%f20
	ldsb	[%l7 + 0x51],	%o7
	orn	%g2,	0x1862,	%l4
	movrgz	%g1,	0x20D,	%i4
	movre	%o5,	0x085,	%g7
	andcc	%l6,	%o1,	%i2
	srlx	%l3,	0x16,	%l5
	edge32n	%i0,	%i1,	%o3
	movcs	%xcc,	%l0,	%l1
	movvs	%xcc,	%i7,	%i3
	movpos	%icc,	%g4,	%o4
	sdivcc	%l2,	0x194D,	%o2
	faligndata	%f20,	%f20,	%f22
	mulx	%g3,	0x03CA,	%g5
	srlx	%i6,	%o6,	%i5
	sdivx	%o0,	0x10C1,	%g6
	edge8l	%o7,	%g2,	%g1
	udivcc	%l4,	0x06D9,	%i4
	fmovdn	%xcc,	%f16,	%f1
	umul	%g7,	0x1F2B,	%l6
	movne	%icc,	%o1,	%i2
	ldsh	[%l7 + 0x46],	%l3
	edge16n	%o5,	%l5,	%i1
	movleu	%icc,	%i0,	%o3
	mova	%xcc,	%l0,	%i7
	srl	%i3,	0x12,	%g4
	sethi	0x13E0,	%l1
	edge8	%o4,	%o2,	%g3
	fnot2s	%f8,	%f14
	fexpand	%f28,	%f12
	sll	%l2,	%g5,	%i6
	array8	%i5,	%o0,	%g6
	fnand	%f6,	%f4,	%f8
	ldx	[%l7 + 0x30],	%o7
	edge32ln	%o6,	%g2,	%l4
	fones	%f24
	movle	%xcc,	%g1,	%g7
	fornot2	%f16,	%f20,	%f18
	edge8ln	%l6,	%i4,	%o1
	fmovdne	%xcc,	%f0,	%f15
	edge32ln	%l3,	%o5,	%i2
	andcc	%i1,	%l5,	%o3
	movvs	%icc,	%i0,	%l0
	fandnot2s	%f27,	%f19,	%f15
	fpackfix	%f12,	%f7
	lduw	[%l7 + 0x10],	%i7
	fmovsleu	%icc,	%f20,	%f0
	lduw	[%l7 + 0x4C],	%i3
	xor	%l1,	0x011E,	%g4
	movge	%xcc,	%o2,	%o4
	movle	%xcc,	%l2,	%g5
	fpack32	%f24,	%f6,	%f10
	movle	%icc,	%g3,	%i5
	add	%o0,	0x17AF,	%i6
	fcmps	%fcc3,	%f5,	%f22
	movrlez	%o7,	%g6,	%o6
	andn	%g2,	0x09E2,	%l4
	fones	%f0
	xnor	%g7,	0x1290,	%l6
	mulscc	%i4,	0x1F65,	%g1
	movpos	%xcc,	%o1,	%l3
	fmovd	%f20,	%f0
	array16	%o5,	%i2,	%i1
	xor	%o3,	0x0C98,	%l5
	orcc	%i0,	0x1D13,	%i7
	popc	0x14EE,	%l0
	movrgez	%i3,	%g4,	%l1
	edge16l	%o4,	%l2,	%o2
	fmovdne	%icc,	%f30,	%f25
	sdivx	%g3,	0x1B73,	%i5
	movg	%xcc,	%o0,	%i6
	fmovrdgz	%o7,	%f22,	%f16
	srl	%g6,	0x1E,	%o6
	st	%f15,	[%l7 + 0x50]
	st	%f18,	[%l7 + 0x24]
	fmovrdlz	%g5,	%f4,	%f20
	movn	%icc,	%g2,	%g7
	std	%f8,	[%l7 + 0x20]
	orn	%l4,	%l6,	%g1
	sth	%i4,	[%l7 + 0x5A]
	xnor	%o1,	%l3,	%i2
	ldd	[%l7 + 0x58],	%i0
	movre	%o3,	0x19F,	%l5
	or	%o5,	0x1F2A,	%i7
	fmovrdne	%l0,	%f16,	%f12
	fones	%f5
	movle	%xcc,	%i3,	%i0
	stb	%l1,	[%l7 + 0x29]
	subc	%g4,	0x0F8C,	%o4
	edge32n	%l2,	%g3,	%i5
	movvs	%xcc,	%o0,	%o2
	movne	%xcc,	%o7,	%i6
	edge16l	%g6,	%o6,	%g5
	stb	%g7,	[%l7 + 0x29]
	ldsh	[%l7 + 0x34],	%l4
	fmul8ulx16	%f8,	%f28,	%f12
	ld	[%l7 + 0x08],	%f25
	edge8l	%l6,	%g1,	%g2
	andcc	%i4,	0x1039,	%o1
	lduw	[%l7 + 0x10],	%i2
	fandnot2	%f28,	%f22,	%f28
	movl	%xcc,	%i1,	%o3
	stw	%l3,	[%l7 + 0x28]
	edge16ln	%l5,	%i7,	%l0
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%f24
	array16	%o5,	%i0,	%i3
	fzeros	%f10
	fabss	%f10,	%f25
	edge16	%g4,	%l1,	%l2
	sra	%o4,	0x03,	%i5
	movrgz	%g3,	0x2DD,	%o2
	alignaddrl	%o0,	%o7,	%i6
	fxor	%f0,	%f24,	%f18
	or	%o6,	%g6,	%g5
	lduw	[%l7 + 0x58],	%g7
	srlx	%l4,	%g1,	%g2
	xorcc	%l6,	0x0A53,	%i4
	edge8	%o1,	%i2,	%i1
	fmovrde	%l3,	%f12,	%f0
	fand	%f28,	%f20,	%f14
	movvc	%xcc,	%l5,	%o3
	fmovsgu	%xcc,	%f15,	%f12
	udivx	%i7,	0x027C,	%l0
	edge8ln	%o5,	%i0,	%i3
	fsrc2	%f20,	%f10
	edge32ln	%l1,	%g4,	%l2
	array32	%o4,	%i5,	%o2
	fandnot2s	%f26,	%f11,	%f2
	lduw	[%l7 + 0x54],	%g3
	fcmpeq32	%f0,	%f30,	%o0
	st	%f7,	[%l7 + 0x4C]
	movleu	%xcc,	%i6,	%o6
	fmovdne	%xcc,	%f4,	%f21
	addccc	%g6,	%g5,	%o7
	fmovsvs	%icc,	%f11,	%f16
	addc	%g7,	0x1621,	%g1
	mova	%icc,	%g2,	%l6
	addccc	%l4,	%i4,	%o1
	addcc	%i2,	%l3,	%i1
	fcmped	%fcc1,	%f24,	%f28
	and	%l5,	%i7,	%l0
	udivcc	%o3,	0x0EF5,	%o5
	lduh	[%l7 + 0x38],	%i0
	edge8n	%i3,	%g4,	%l2
	movpos	%xcc,	%o4,	%i5
	sth	%o2,	[%l7 + 0x60]
	stw	%g3,	[%l7 + 0x3C]
	subc	%l1,	0x0B5E,	%i6
	fmovdvs	%xcc,	%f9,	%f15
	edge32l	%o6,	%g6,	%g5
	fxnor	%f16,	%f12,	%f24
	addccc	%o7,	0x1455,	%g7
	mulx	%o0,	%g1,	%g2
	udiv	%l4,	0x017A,	%l6
	array32	%i4,	%o1,	%l3
	andn	%i1,	0x1514,	%i2
	fmovsneg	%xcc,	%f19,	%f31
	edge8	%l5,	%i7,	%o3
	edge32n	%o5,	%i0,	%l0
	fornot2	%f10,	%f16,	%f4
	edge8n	%g4,	%l2,	%o4
	fornot2	%f20,	%f14,	%f16
	fpsub32s	%f12,	%f30,	%f30
	orn	%i3,	0x051C,	%o2
	and	%g3,	0x11B9,	%i5
	fmovrdne	%i6,	%f10,	%f14
	add	%l1,	%o6,	%g6
	movle	%icc,	%g5,	%o7
	ldx	[%l7 + 0x10],	%o0
	fmovsneg	%icc,	%f27,	%f31
	edge32n	%g1,	%g2,	%g7
	nop
	set	0x20, %l3
	ldx	[%l7 + %l3],	%l4
	smul	%l6,	0x0696,	%i4
	stx	%l3,	[%l7 + 0x60]
	sdivx	%i1,	0x1C2D,	%o1
	alignaddrl	%i2,	%i7,	%l5
	edge32n	%o5,	%i0,	%l0
	movg	%icc,	%o3,	%l2
	fxors	%f0,	%f10,	%f8
	movre	%o4,	%g4,	%i3
	movg	%xcc,	%o2,	%g3
	movcs	%icc,	%i5,	%i6
	fmovrsgez	%l1,	%f8,	%f3
	sllx	%o6,	%g6,	%g5
	mova	%xcc,	%o0,	%o7
	pdist	%f22,	%f18,	%f14
	ldub	[%l7 + 0x52],	%g1
	ld	[%l7 + 0x0C],	%f9
	edge8ln	%g7,	%l4,	%g2
	orncc	%i4,	%l3,	%l6
	subccc	%i1,	0x031B,	%i2
	array8	%o1,	%l5,	%o5
	fornot2s	%f22,	%f23,	%f11
	andcc	%i7,	%i0,	%o3
	sllx	%l0,	0x08,	%l2
	movneg	%xcc,	%o4,	%g4
	movg	%icc,	%o2,	%i3
	fpack32	%f4,	%f22,	%f10
	fsrc1s	%f4,	%f27
	fmovsne	%icc,	%f6,	%f17
	sll	%g3,	0x05,	%i6
	alignaddrl	%l1,	%o6,	%g6
	edge32l	%g5,	%o0,	%i5
	edge16l	%g1,	%g7,	%o7
	xorcc	%l4,	%i4,	%g2
	fmovrde	%l6,	%f0,	%f12
	mova	%icc,	%l3,	%i2
	fnand	%f10,	%f12,	%f14
	xorcc	%i1,	0x0FB1,	%l5
	edge8	%o1,	%i7,	%o5
	fmovsn	%icc,	%f16,	%f19
	bshuffle	%f2,	%f18,	%f4
	fxnor	%f22,	%f4,	%f24
	xor	%i0,	%l0,	%o3
	fcmpne32	%f30,	%f14,	%o4
	orncc	%l2,	%o2,	%g4
	move	%xcc,	%i3,	%g3
	subccc	%l1,	0x18D9,	%i6
	and	%o6,	%g5,	%o0
	edge16l	%i5,	%g1,	%g6
	alignaddrl	%g7,	%o7,	%l4
	fcmps	%fcc0,	%f6,	%f12
	addcc	%g2,	%i4,	%l3
	alignaddrl	%i2,	%l6,	%l5
	srlx	%o1,	%i1,	%i7
	ldd	[%l7 + 0x50],	%f12
	movleu	%icc,	%o5,	%l0
	ld	[%l7 + 0x3C],	%f23
	stb	%i0,	[%l7 + 0x5C]
	for	%f2,	%f10,	%f14
	alignaddrl	%o4,	%l2,	%o2
	movcc	%xcc,	%g4,	%o3
	move	%xcc,	%i3,	%g3
	std	%f14,	[%l7 + 0x70]
	orcc	%i6,	%o6,	%l1
	udivx	%o0,	0x19E3,	%g5
	udivx	%i5,	0x16E1,	%g1
	add	%g7,	%o7,	%l4
	fmovrde	%g2,	%f18,	%f8
	fmovsne	%icc,	%f23,	%f15
	edge32n	%g6,	%i4,	%l3
	sra	%l6,	0x1C,	%i2
	fnegs	%f16,	%f30
	fornot2s	%f19,	%f0,	%f2
	sir	0x1D80
	xor	%l5,	0x1F33,	%i1
	movne	%xcc,	%i7,	%o1
	save %l0, 0x19A8, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmple16	%f22,	%f22,	%o5
	array8	%o4,	%o2,	%g4
	fcmpeq32	%f24,	%f2,	%o3
	std	%f12,	[%l7 + 0x60]
	movgu	%icc,	%l2,	%g3
	std	%f0,	[%l7 + 0x30]
	movg	%xcc,	%i3,	%i6
	sir	0x1124
	movneg	%icc,	%l1,	%o6
	xor	%g5,	0x1C9E,	%i5
	save %g1, %g7, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsneg	%xcc,	%f30,	%f30
	xnorcc	%l4,	%g2,	%o0
	sir	0x12C0
	stb	%g6,	[%l7 + 0x5D]
	sir	0x1C6D
	fcmpeq32	%f2,	%f12,	%l3
	movl	%icc,	%i4,	%l6
	fmovda	%xcc,	%f28,	%f14
	movpos	%xcc,	%i2,	%i1
	srlx	%l5,	%o1,	%l0
	movgu	%xcc,	%i0,	%i7
	movre	%o5,	%o2,	%o4
	fcmpne32	%f14,	%f0,	%g4
	movrlez	%l2,	0x0CE,	%g3
	restore %i3, %i6, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%icc,	%o3,	%g5
	array32	%o6,	%g1,	%i5
	mova	%icc,	%g7,	%o7
	edge32l	%g2,	%o0,	%g6
	sth	%l3,	[%l7 + 0x44]
	mulx	%l4,	0x190D,	%i4
	sllx	%l6,	%i1,	%i2
	array32	%o1,	%l5,	%l0
	andn	%i7,	%o5,	%o2
	fmovdvs	%icc,	%f27,	%f19
	nop
	set	0x50, %l5
	ldd	[%l7 + %l5],	%f0
	fnot1s	%f6,	%f18
	xnorcc	%i0,	0x1A57,	%g4
	edge16	%o4,	%g3,	%i3
	movrlz	%l2,	0x2FD,	%i6
	fnor	%f26,	%f8,	%f28
	edge32ln	%o3,	%l1,	%g5
	st	%f24,	[%l7 + 0x10]
	orncc	%o6,	%i5,	%g1
	orcc	%o7,	0x0D80,	%g7
	mulx	%o0,	0x0C79,	%g6
	xorcc	%l3,	0x104A,	%l4
	fmovrdlez	%g2,	%f28,	%f24
	edge16	%i4,	%l6,	%i2
	fmovdcc	%icc,	%f24,	%f0
	sth	%o1,	[%l7 + 0x2E]
	add	%i1,	0x0449,	%l0
	edge32n	%l5,	%i7,	%o5
	addccc	%o2,	0x1D03,	%i0
	andn	%g4,	0x074D,	%o4
	udivx	%g3,	0x1D22,	%l2
	edge16	%i6,	%o3,	%l1
	movneg	%icc,	%i3,	%o6
	sllx	%i5,	0x1F,	%g5
	fandnot2s	%f26,	%f26,	%f2
	movle	%icc,	%o7,	%g1
	std	%f20,	[%l7 + 0x60]
	orcc	%o0,	%g7,	%l3
	srl	%l4,	%g6,	%i4
	save %g2, 0x0E21, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o1,	%i1,	%l0
	edge16ln	%l6,	%i7,	%o5
	lduw	[%l7 + 0x6C],	%l5
	popc	0x01FA,	%i0
	fmovsn	%xcc,	%f16,	%f16
	std	%f0,	[%l7 + 0x60]
	subc	%o2,	%o4,	%g4
	siam	0x7
	umulcc	%g3,	%i6,	%o3
	alignaddr	%l1,	%i3,	%o6
	fmovrslz	%i5,	%f0,	%f19
	srax	%l2,	%o7,	%g5
	fmul8x16al	%f21,	%f26,	%f26
	movpos	%icc,	%o0,	%g1
	sll	%g7,	%l4,	%l3
	movrgez	%i4,	0x24B,	%g2
	edge8ln	%g6,	%o1,	%i2
	xor	%l0,	0x1440,	%i1
	ldsw	[%l7 + 0x50],	%l6
	move	%xcc,	%o5,	%l5
	fsrc1s	%f15,	%f31
	fxnor	%f14,	%f12,	%f30
	movcs	%xcc,	%i7,	%i0
	andn	%o4,	%o2,	%g4
	movcc	%xcc,	%i6,	%o3
	udiv	%l1,	0x1008,	%g3
	movcs	%icc,	%i3,	%i5
	movgu	%icc,	%l2,	%o7
	edge16n	%o6,	%g5,	%g1
	orncc	%g7,	0x0880,	%o0
	movg	%xcc,	%l4,	%i4
	movre	%l3,	0x2C2,	%g6
	edge16	%o1,	%i2,	%l0
	movvs	%icc,	%i1,	%l6
	ldsb	[%l7 + 0x1D],	%o5
	movpos	%xcc,	%l5,	%g2
	ld	[%l7 + 0x2C],	%f30
	movre	%i7,	0x0AE,	%o4
	andn	%i0,	0x0EA3,	%g4
	udivx	%o2,	0x0B14,	%o3
	udiv	%l1,	0x1D7F,	%i6
	sir	0x02B2
	fxnors	%f2,	%f31,	%f27
	array32	%g3,	%i3,	%i5
	udivx	%l2,	0x133D,	%o6
	stw	%g5,	[%l7 + 0x28]
	fmovsvc	%icc,	%f5,	%f18
	fmovd	%f20,	%f2
	fornot1s	%f4,	%f15,	%f28
	xnorcc	%o7,	0x1B88,	%g1
	smulcc	%g7,	%o0,	%i4
	fpack32	%f16,	%f22,	%f30
	fmovrdne	%l4,	%f14,	%f18
	ldub	[%l7 + 0x1C],	%g6
	andncc	%l3,	%i2,	%o1
	sllx	%l0,	0x0D,	%l6
	movleu	%xcc,	%o5,	%i1
	smul	%l5,	%g2,	%o4
	fmovrsgz	%i7,	%f17,	%f10
	movne	%icc,	%g4,	%i0
	edge8	%o3,	%o2,	%i6
	or	%l1,	0x016A,	%g3
	ld	[%l7 + 0x78],	%f26
	sdiv	%i5,	0x17BC,	%i3
	fcmpgt16	%f14,	%f14,	%l2
	fmovdle	%xcc,	%f15,	%f27
	move	%icc,	%g5,	%o7
	or	%g1,	%g7,	%o0
	movge	%icc,	%o6,	%l4
	fmovdle	%xcc,	%f9,	%f0
	ldsh	[%l7 + 0x72],	%g6
	sll	%l3,	%i2,	%i4
	andn	%l0,	0x1B0C,	%l6
	fpmerge	%f0,	%f11,	%f30
	edge16n	%o1,	%o5,	%i1
	array32	%l5,	%o4,	%g2
	movrgz	%g4,	0x038,	%i7
	fmovdleu	%icc,	%f24,	%f19
	edge8ln	%i0,	%o2,	%i6
	xnor	%l1,	%g3,	%o3
	fmovrdlez	%i3,	%f20,	%f4
	ldd	[%l7 + 0x18],	%l2
	andncc	%i5,	%o7,	%g1
	sll	%g7,	%o0,	%g5
	fcmpne16	%f22,	%f0,	%l4
	sdivx	%g6,	0x06EA,	%o6
	xnor	%l3,	0x177F,	%i2
	subcc	%l0,	0x1660,	%l6
	umul	%o1,	%o5,	%i4
	stb	%i1,	[%l7 + 0x60]
	ldd	[%l7 + 0x38],	%l4
	movle	%xcc,	%o4,	%g2
	ldub	[%l7 + 0x24],	%i7
	umulcc	%g4,	0x0FD8,	%i0
	andcc	%i6,	%o2,	%g3
	subccc	%l1,	%i3,	%o3
	edge16	%i5,	%o7,	%g1
	andcc	%g7,	0x0888,	%l2
	edge8ln	%o0,	%g5,	%l4
	add	%o6,	0x1E42,	%g6
	orcc	%i2,	%l3,	%l0
	fmul8sux16	%f14,	%f6,	%f18
	fmovdcc	%xcc,	%f4,	%f24
	ldsb	[%l7 + 0x0D],	%l6
	fcmps	%fcc1,	%f22,	%f27
	movre	%o5,	0x3FA,	%i4
	xnorcc	%i1,	%o1,	%o4
	subccc	%g2,	%i7,	%l5
	movne	%xcc,	%g4,	%i0
	subc	%i6,	%o2,	%l1
	orncc	%g3,	0x1FD8,	%o3
	ldd	[%l7 + 0x50],	%i2
	popc	0x0341,	%i5
	fmovd	%f4,	%f10
	fcmple16	%f2,	%f0,	%g1
	fmovde	%icc,	%f17,	%f4
	array32	%g7,	%o7,	%o0
	addccc	%g5,	0x021A,	%l4
	array8	%o6,	%g6,	%i2
	sth	%l2,	[%l7 + 0x66]
	mova	%icc,	%l0,	%l3
	movl	%icc,	%o5,	%i4
	alignaddrl	%i1,	%l6,	%o1
	xorcc	%g2,	0x01B6,	%i7
	alignaddr	%o4,	%l5,	%g4
	fnot1	%f26,	%f22
	ldsb	[%l7 + 0x26],	%i6
	fmovrdgez	%o2,	%f8,	%f24
	sub	%i0,	0x0997,	%l1
	xor	%g3,	%o3,	%i5
	stb	%i3,	[%l7 + 0x3D]
	lduh	[%l7 + 0x5E],	%g1
	fmovdpos	%xcc,	%f12,	%f25
	fpsub16	%f12,	%f12,	%f20
	mulx	%g7,	%o0,	%g5
	mulx	%l4,	0x05FE,	%o6
	and	%g6,	%o7,	%l2
	fcmpd	%fcc0,	%f12,	%f24
	edge16l	%i2,	%l3,	%l0
	fpack16	%f14,	%f27
	edge8ln	%i4,	%o5,	%i1
	movge	%xcc,	%o1,	%g2
	fxor	%f2,	%f20,	%f8
	movrgz	%l6,	%o4,	%l5
	move	%icc,	%g4,	%i6
	mulscc	%i7,	%o2,	%i0
	fsrc2s	%f27,	%f17
	udiv	%l1,	0x0551,	%o3
	edge16l	%i5,	%i3,	%g3
	fmovrdlez	%g7,	%f6,	%f12
	stb	%o0,	[%l7 + 0x77]
	movvs	%xcc,	%g1,	%g5
	sllx	%o6,	0x16,	%g6
	orncc	%o7,	%l2,	%i2
	addcc	%l3,	0x09FF,	%l0
	fmovdg	%xcc,	%f20,	%f5
	ldsb	[%l7 + 0x59],	%l4
	orn	%o5,	%i4,	%i1
	stx	%o1,	[%l7 + 0x48]
	save %l6, 0x0FB9, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x0A],	%l5
	sdivx	%g2,	0x0CBF,	%g4
	orncc	%i7,	0x0441,	%o2
	move	%xcc,	%i0,	%l1
	fabsd	%f4,	%f22
	ldsw	[%l7 + 0x74],	%i6
	umul	%i5,	0x0C9E,	%i3
	edge8	%g3,	%g7,	%o0
	ldsw	[%l7 + 0x0C],	%g1
	setx loop_5, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_5: 	sth	%g6,	[%l7 + 0x26]
	udiv	%o7,	0x1051,	%l2
	ldsw	[%l7 + 0x28],	%i2
	andncc	%g5,	%l0,	%l3
	fmovscs	%xcc,	%f20,	%f11
	edge32	%l4,	%o5,	%i4
	ldd	[%l7 + 0x10],	%o0
	sth	%l6,	[%l7 + 0x0E]
	srl	%o4,	%l5,	%i1
	xor	%g4,	%g2,	%o2
	fmovdgu	%icc,	%f3,	%f2
	addc	%i7,	0x0736,	%i0
	edge16	%l1,	%i5,	%i3
	srlx	%g3,	%g7,	%i6
	edge8n	%g1,	%o0,	%o3
	ldsw	[%l7 + 0x64],	%g6
	movneg	%icc,	%o6,	%o7
	fmovrslz	%l2,	%f14,	%f29
	array8	%i2,	%l0,	%l3
	addcc	%l4,	0x1616,	%g5
	edge16n	%i4,	%o1,	%l6
	faligndata	%f24,	%f0,	%f16
	sra	%o4,	%o5,	%i1
	fpsub32s	%f13,	%f5,	%f26
	movcc	%icc,	%l5,	%g2
	lduh	[%l7 + 0x3C],	%o2
	mulx	%g4,	0x1579,	%i7
	orn	%l1,	%i0,	%i5
	fxnors	%f5,	%f16,	%f26
	smulcc	%i3,	%g7,	%g3
	fnot1	%f2,	%f2
	sra	%i6,	%g1,	%o0
	orncc	%g6,	%o6,	%o7
	and	%l2,	%o3,	%i2
	lduh	[%l7 + 0x28],	%l3
	addcc	%l0,	0x1E1C,	%g5
	sir	0x06CB
	edge8l	%l4,	%i4,	%o1
	sethi	0x120E,	%o4
	movneg	%icc,	%o5,	%i1
	ldsw	[%l7 + 0x3C],	%l6
	edge8	%g2,	%o2,	%g4
	restore %l5, %l1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fabss	%f10,	%f1
	fmovsne	%xcc,	%f8,	%f26
	add	%i5,	0x08BE,	%i7
	xorcc	%i3,	0x1FCD,	%g7
	movrlz	%i6,	0x36F,	%g3
	st	%f14,	[%l7 + 0x6C]
	stb	%o0,	[%l7 + 0x44]
	movcc	%icc,	%g6,	%o6
	orcc	%o7,	%l2,	%g1
	mulx	%o3,	%l3,	%l0
	ldsh	[%l7 + 0x7E],	%g5
	xor	%l4,	%i2,	%i4
	xnor	%o4,	%o5,	%o1
	stw	%i1,	[%l7 + 0x1C]
	stb	%g2,	[%l7 + 0x10]
	fmovrsgez	%l6,	%f12,	%f24
	udiv	%g4,	0x1BD5,	%l5
	edge16n	%o2,	%l1,	%i5
	xor	%i7,	0x16F2,	%i0
	setx loop_6, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_6: 	fcmple16	%f28,	%f8,	%g3
	st	%f25,	[%l7 + 0x2C]
	fones	%f23
	nop
	set	0x5C, %o4
	ldsw	[%l7 + %o4],	%o0
	sir	0x06D9
	fmovse	%xcc,	%f10,	%f5
	smulcc	%i3,	0x1620,	%g6
	stw	%o7,	[%l7 + 0x34]
	xnor	%l2,	0x05C8,	%g1
	edge16n	%o3,	%l3,	%o6
	edge8l	%l0,	%g5,	%l4
	movrgz	%i4,	0x223,	%o4
	fcmpes	%fcc1,	%f18,	%f18
	movl	%xcc,	%o5,	%i2
	move	%xcc,	%o1,	%g2
	subcc	%l6,	%i1,	%g4
	fsrc2s	%f13,	%f12
	edge16l	%l5,	%l1,	%i5
	fmovrde	%o2,	%f30,	%f6
	fmovsl	%icc,	%f10,	%f7
	fmovrslz	%i0,	%f15,	%f28
	addcc	%i7,	0x1BB5,	%i6
	movl	%icc,	%g3,	%g7
	fsrc1s	%f14,	%f5
	fmovsne	%xcc,	%f10,	%f3
	movvc	%xcc,	%i3,	%g6
	movge	%xcc,	%o7,	%l2
	movvc	%xcc,	%g1,	%o3
	fcmpeq32	%f14,	%f26,	%o0
	edge8	%l3,	%o6,	%g5
	fpsub16	%f24,	%f6,	%f8
	fmovsneg	%icc,	%f21,	%f23
	ldd	[%l7 + 0x20],	%f24
	movne	%icc,	%l4,	%l0
	movcc	%icc,	%o4,	%i4
	edge8ln	%o5,	%o1,	%i2
	array8	%l6,	%i1,	%g2
	srl	%g4,	%l1,	%i5
	stb	%l5,	[%l7 + 0x68]
	sir	0x01D8
	restore %o2, 0x05CC, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%i0,	%i6,	%g7
	srax	%g3,	%g6,	%o7
	save %i3, 0x13DF, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%xcc,	%o3,	%o0
	movg	%xcc,	%g1,	%l3
	srax	%g5,	%l4,	%o6
	sethi	0x1B60,	%o4
	fmovsneg	%xcc,	%f8,	%f9
	alignaddrl	%l0,	%i4,	%o1
	udivx	%i2,	0x1738,	%l6
	lduh	[%l7 + 0x5C],	%o5
	edge8	%g2,	%i1,	%g4
	fmovdvc	%xcc,	%f15,	%f31
	add	%l1,	%i5,	%l5
	ldsw	[%l7 + 0x50],	%o2
	ldx	[%l7 + 0x68],	%i0
	fmovdcs	%icc,	%f25,	%f26
	nop
	set	0x28, %l6
	std	%f24,	[%l7 + %l6]
	fmuld8ulx16	%f30,	%f13,	%f20
	alignaddrl	%i6,	%g7,	%i7
	movrgez	%g6,	%g3,	%o7
	lduh	[%l7 + 0x6E],	%l2
	fcmpgt16	%f18,	%f16,	%i3
	fnot1s	%f11,	%f3
	movn	%icc,	%o3,	%o0
	movneg	%xcc,	%g1,	%g5
	array8	%l3,	%l4,	%o6
	sdivcc	%o4,	0x1C92,	%l0
	edge16ln	%i4,	%i2,	%l6
	movcs	%icc,	%o1,	%o5
	fnands	%f31,	%f29,	%f23
	srl	%i1,	%g2,	%g4
	edge16	%i5,	%l5,	%l1
	edge32n	%i0,	%o2,	%g7
	fpmerge	%f31,	%f15,	%f24
	edge8ln	%i7,	%g6,	%i6
	fmovrdgz	%o7,	%f28,	%f14
	edge32	%l2,	%i3,	%o3
	smul	%g3,	%g1,	%o0
	fzeros	%f30
	alignaddrl	%g5,	%l3,	%l4
	orcc	%o6,	%o4,	%l0
	srax	%i2,	%l6,	%o1
	mova	%icc,	%o5,	%i1
	orcc	%g2,	%i4,	%i5
	xnorcc	%l5,	%l1,	%i0
	fcmpes	%fcc1,	%f22,	%f4
	fmovrdgz	%o2,	%f30,	%f20
	orncc	%g4,	0x1E8C,	%i7
	fpsub32	%f16,	%f10,	%f0
	alignaddr	%g7,	%i6,	%o7
	lduw	[%l7 + 0x28],	%g6
	orn	%i3,	%o3,	%g3
	fmovdvc	%icc,	%f6,	%f27
	nop
	set	0x12, %g7
	lduh	[%l7 + %g7],	%g1
	fnors	%f19,	%f23,	%f5
	movrgez	%l2,	%o0,	%l3
	ldx	[%l7 + 0x78],	%l4
	movre	%o6,	%o4,	%g5
	edge8	%l0,	%i2,	%o1
	movle	%xcc,	%l6,	%i1
	fmovdcc	%xcc,	%f12,	%f4
	array8	%g2,	%i4,	%o5
	subc	%l5,	%l1,	%i0
	fmul8x16al	%f3,	%f19,	%f8
	pdist	%f6,	%f0,	%f0
	ldd	[%l7 + 0x18],	%f18
	ldd	[%l7 + 0x30],	%f10
	ldub	[%l7 + 0x4C],	%i5
	fones	%f2
	fmovdneg	%xcc,	%f31,	%f27
	subcc	%g4,	0x0B90,	%i7
	edge32l	%g7,	%i6,	%o7
	fcmple32	%f26,	%f0,	%g6
	sra	%o2,	0x00,	%i3
	edge8n	%g3,	%o3,	%l2
	movge	%icc,	%o0,	%l3
	addcc	%l4,	%o6,	%o4
	addc	%g5,	%g1,	%i2
	setx loop_7, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_7: 	movl	%icc,	%i1,	%g2
	movn	%xcc,	%i4,	%o5
	movne	%xcc,	%l0,	%l5
	move	%icc,	%i0,	%l1
	std	%f2,	[%l7 + 0x08]
	fcmpes	%fcc1,	%f21,	%f6
	sra	%i5,	0x13,	%i7
	udivx	%g4,	0x15A8,	%i6
	for	%f2,	%f0,	%f30
	fmovd	%f14,	%f18
	sll	%o7,	%g6,	%o2
	mulx	%g7,	0x0B6A,	%g3
	orn	%o3,	%l2,	%i3
	movvc	%xcc,	%o0,	%l3
	srlx	%o6,	%o4,	%g5
	fsrc2s	%f10,	%f31
	edge8n	%l4,	%g1,	%i2
	smulcc	%l6,	%i1,	%g2
	edge16n	%o1,	%o5,	%i4
	sra	%l0,	%l5,	%l1
	movrgz	%i0,	0x307,	%i7
	ldub	[%l7 + 0x2B],	%g4
	fmovsl	%icc,	%f14,	%f29
	lduh	[%l7 + 0x16],	%i5
	umulcc	%o7,	0x063F,	%i6
	movpos	%xcc,	%g6,	%g7
	ldub	[%l7 + 0x0C],	%g3
	st	%f10,	[%l7 + 0x74]
	sth	%o3,	[%l7 + 0x0A]
	movcs	%icc,	%l2,	%o2
	movpos	%xcc,	%o0,	%i3
	subc	%l3,	%o4,	%o6
	edge8n	%g5,	%l4,	%g1
	edge32ln	%l6,	%i1,	%i2
	fmovrdlez	%g2,	%f6,	%f20
	andcc	%o5,	0x1811,	%i4
	bshuffle	%f14,	%f12,	%f20
	movcs	%icc,	%o1,	%l0
	xorcc	%l1,	0x0727,	%i0
	udivcc	%l5,	0x0D60,	%i7
	nop
	set	0x3B, %l2
	ldub	[%l7 + %l2],	%g4
	fmovs	%f16,	%f5
	edge8ln	%i5,	%i6,	%o7
	fmuld8ulx16	%f23,	%f10,	%f22
	andn	%g6,	%g3,	%o3
	movl	%xcc,	%l2,	%g7
	edge32	%o0,	%i3,	%o2
	movgu	%xcc,	%o4,	%o6
	fzeros	%f24
	fcmple16	%f24,	%f28,	%g5
	edge8ln	%l4,	%l3,	%l6
	lduw	[%l7 + 0x2C],	%g1
	fpsub16	%f28,	%f16,	%f24
	sra	%i2,	%g2,	%i1
	movrne	%o5,	%i4,	%l0
	fone	%f8
	fpsub32s	%f24,	%f28,	%f22
	sth	%l1,	[%l7 + 0x22]
	udivcc	%i0,	0x1777,	%l5
	edge32	%o1,	%g4,	%i5
	st	%f22,	[%l7 + 0x2C]
	andcc	%i6,	0x1063,	%o7
	array32	%i7,	%g6,	%g3
	popc	0x04DC,	%o3
	movrlz	%g7,	%o0,	%l2
	movcc	%icc,	%i3,	%o4
	srax	%o6,	%g5,	%o2
	lduw	[%l7 + 0x54],	%l4
	fzero	%f14
	mulx	%l6,	0x13FE,	%l3
	edge8n	%i2,	%g1,	%g2
	alignaddrl	%o5,	%i4,	%l0
	fmovscc	%xcc,	%f12,	%f3
	andcc	%i1,	0x0AF9,	%i0
	sir	0x0975
	add	%l1,	0x06C9,	%l5
	movrgz	%o1,	0x2C5,	%g4
	ldsh	[%l7 + 0x44],	%i6
	udivcc	%o7,	0x157F,	%i5
	save %g6, 0x01E7, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movneg	%xcc,	%o3,	%g7
	srl	%g3,	%o0,	%i3
	smul	%o4,	%o6,	%l2
	movvs	%icc,	%o2,	%g5
	mova	%xcc,	%l4,	%l6
	sth	%l3,	[%l7 + 0x32]
	fcmped	%fcc2,	%f20,	%f18
	fsrc1	%f16,	%f6
	movvs	%xcc,	%i2,	%g1
	umul	%o5,	%i4,	%g2
	ldsh	[%l7 + 0x16],	%l0
	restore %i1, 0x12CF, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i0,	%o1
	movgu	%xcc,	%l5,	%i6
	fpadd16s	%f1,	%f13,	%f12
	popc	%o7,	%g4
	movrgz	%i5,	0x22C,	%g6
	ldx	[%l7 + 0x28],	%i7
	addcc	%o3,	0x07D8,	%g7
	fmul8x16al	%f20,	%f5,	%f28
	orncc	%g3,	0x0436,	%i3
	movre	%o4,	0x29F,	%o6
	fmovsne	%icc,	%f4,	%f21
	bshuffle	%f30,	%f28,	%f24
	stx	%o0,	[%l7 + 0x38]
	stw	%l2,	[%l7 + 0x0C]
	udivx	%g5,	0x0BDF,	%o2
	array16	%l6,	%l3,	%i2
	movneg	%xcc,	%g1,	%o5
	orcc	%l4,	0x0E8A,	%i4
	movvc	%icc,	%l0,	%i1
	edge32	%l1,	%i0,	%g2
	edge8	%o1,	%l5,	%o7
	ldd	[%l7 + 0x38],	%f4
	fnor	%f4,	%f22,	%f26
	udiv	%i6,	0x02BA,	%g4
	subcc	%i5,	%i7,	%o3
	edge16l	%g6,	%g3,	%g7
	st	%f15,	[%l7 + 0x54]
	edge8l	%i3,	%o6,	%o4
	srl	%l2,	%o0,	%o2
	fors	%f9,	%f3,	%f29
	ldub	[%l7 + 0x47],	%g5
	ld	[%l7 + 0x48],	%f26
	movcc	%icc,	%l6,	%l3
	movrlez	%i2,	%o5,	%l4
	fcmpes	%fcc2,	%f4,	%f17
	movrgez	%i4,	%g1,	%i1
	sub	%l0,	%i0,	%l1
	orncc	%o1,	%l5,	%o7
	addc	%i6,	%g4,	%i5
	movn	%icc,	%i7,	%o3
	edge16ln	%g2,	%g6,	%g7
	udivcc	%i3,	0x1002,	%g3
	nop
	set	0x37, %i0
	ldsb	[%l7 + %i0],	%o6
	fcmpgt16	%f4,	%f24,	%l2
	edge8	%o0,	%o2,	%g5
	fmovdcs	%icc,	%f13,	%f4
	movne	%xcc,	%l6,	%o4
	edge16	%l3,	%o5,	%l4
	xorcc	%i4,	0x115D,	%g1
	bshuffle	%f20,	%f6,	%f6
	edge16ln	%i2,	%l0,	%i0
	std	%f20,	[%l7 + 0x20]
	popc	0x063E,	%l1
	smul	%o1,	0x1EE9,	%l5
	addcc	%o7,	%i1,	%i6
	sir	0x1D8F
	sdivcc	%i5,	0x0E18,	%g4
	srl	%i7,	0x02,	%g2
	for	%f24,	%f10,	%f30
	ldx	[%l7 + 0x58],	%g6
	ldsh	[%l7 + 0x30],	%o3
	edge8n	%i3,	%g3,	%g7
	fmul8sux16	%f12,	%f4,	%f10
	movpos	%icc,	%o6,	%l2
	fmovd	%f18,	%f8
	fmul8ulx16	%f8,	%f18,	%f0
	xnor	%o0,	0x16A8,	%g5
	umulcc	%l6,	%o2,	%l3
	xor	%o5,	%l4,	%i4
	andn	%o4,	%g1,	%l0
	movrgz	%i2,	0x1FD,	%l1
	movge	%icc,	%o1,	%i0
	xnorcc	%l5,	0x0C30,	%i1
	movrgz	%i6,	0x132,	%i5
	st	%f23,	[%l7 + 0x74]
	ldsw	[%l7 + 0x68],	%g4
	addc	%o7,	0x182C,	%i7
	edge32n	%g2,	%o3,	%g6
	andcc	%g3,	%g7,	%o6
	andncc	%l2,	%i3,	%o0
	sdivx	%l6,	0x1C86,	%o2
	sdivcc	%l3,	0x0696,	%o5
	movgu	%xcc,	%g5,	%i4
	faligndata	%f30,	%f24,	%f4
	ldub	[%l7 + 0x66],	%o4
	fmovrdlez	%l4,	%f18,	%f22
	fnot1	%f6,	%f14
	edge32ln	%g1,	%i2,	%l0
	fmul8ulx16	%f28,	%f26,	%f28
	alignaddr	%o1,	%l1,	%l5
	andncc	%i0,	%i6,	%i1
	fmovse	%xcc,	%f20,	%f18
	movleu	%icc,	%i5,	%o7
	andncc	%g4,	%g2,	%i7
	movg	%icc,	%o3,	%g3
	fornot2s	%f23,	%f20,	%f0
	fmul8ulx16	%f22,	%f30,	%f28
	movpos	%icc,	%g6,	%g7
	udivcc	%o6,	0x1CD9,	%l2
	mova	%icc,	%o0,	%i3
	popc	0x0D74,	%o2
	lduw	[%l7 + 0x68],	%l3
	fcmpes	%fcc0,	%f20,	%f23
	fmovda	%icc,	%f22,	%f26
	fmovd	%f8,	%f14
	sdiv	%l6,	0x0BF4,	%g5
	sdivx	%i4,	0x0872,	%o4
	sethi	0x1770,	%o5
	addc	%l4,	0x12F3,	%i2
	lduw	[%l7 + 0x28],	%g1
	fpsub16	%f10,	%f10,	%f22
	fmovsle	%xcc,	%f8,	%f18
	xnor	%l0,	%l1,	%o1
	movrgz	%i0,	%i6,	%l5
	fmovd	%f18,	%f2
	andn	%i5,	0x168E,	%o7
	movcc	%icc,	%i1,	%g2
	ldsb	[%l7 + 0x14],	%i7
	xor	%g4,	0x1D94,	%g3
	lduw	[%l7 + 0x34],	%o3
	nop
	set	0x3D, %g6
	stb	%g6,	[%l7 + %g6]
	add	%g7,	%o6,	%o0
	udivcc	%i3,	0x0C3E,	%l2
	xor	%l3,	0x0976,	%o2
	movpos	%xcc,	%l6,	%i4
	movn	%icc,	%g5,	%o5
	subcc	%o4,	0x1480,	%i2
	fxor	%f0,	%f16,	%f4
	fmovdne	%xcc,	%f5,	%f16
	sllx	%l4,	%l0,	%g1
	fmul8x16al	%f10,	%f17,	%f8
	array16	%l1,	%o1,	%i0
	edge32l	%l5,	%i5,	%o7
	xorcc	%i6,	0x0B6E,	%i1
	ldd	[%l7 + 0x40],	%f14
	andncc	%g2,	%i7,	%g4
	fornot1s	%f24,	%f27,	%f6
	movvc	%xcc,	%o3,	%g6
	fnot1	%f18,	%f18
	siam	0x2
	movle	%icc,	%g3,	%o6
	alignaddr	%o0,	%g7,	%l2
	sllx	%i3,	0x0D,	%o2
	fpmerge	%f20,	%f31,	%f26
	and	%l3,	%i4,	%g5
	fmovrdgez	%o5,	%f6,	%f0
	movre	%l6,	%o4,	%i2
	edge32n	%l4,	%l0,	%l1
	xor	%o1,	%g1,	%l5
	orcc	%i0,	0x0304,	%i5
	andcc	%o7,	0x08D7,	%i1
	movrgz	%i6,	0x040,	%g2
	smulcc	%g4,	0x0DFB,	%o3
	subc	%g6,	%i7,	%o6
	mova	%icc,	%g3,	%g7
	fpack32	%f18,	%f16,	%f12
	sth	%o0,	[%l7 + 0x66]
	fandnot1	%f10,	%f22,	%f0
	fmovdne	%xcc,	%f26,	%f5
	srlx	%i3,	0x13,	%o2
	edge8n	%l3,	%i4,	%l2
	st	%f28,	[%l7 + 0x7C]
	fxors	%f0,	%f1,	%f8
	sir	0x0F18
	xorcc	%o5,	0x1528,	%g5
	fmovs	%f16,	%f22
	stw	%o4,	[%l7 + 0x50]
	movrne	%l6,	%l4,	%l0
	movg	%xcc,	%i2,	%o1
	sdivcc	%g1,	0x0CA3,	%l1
	ldd	[%l7 + 0x48],	%l4
	movrgez	%i5,	0x102,	%o7
	edge8ln	%i0,	%i6,	%i1
	ldx	[%l7 + 0x10],	%g2
	fmovrsne	%o3,	%f1,	%f28
	setx loop_8, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_8: 	stx	%g3,	[%l7 + 0x58]
	movn	%icc,	%o6,	%g7
	fxor	%f6,	%f20,	%f8
	fmovrdlz	%o0,	%f20,	%f22
	orncc	%i3,	0x0304,	%l3
	fmovdn	%xcc,	%f1,	%f25
	movrgz	%o2,	0x048,	%l2
	fpsub32	%f14,	%f8,	%f30
	movgu	%xcc,	%o5,	%g5
	movpos	%icc,	%o4,	%l6
	ldsh	[%l7 + 0x6C],	%l4
	ld	[%l7 + 0x74],	%f4
	lduw	[%l7 + 0x18],	%l0
	movrlez	%i2,	%i4,	%g1
	st	%f15,	[%l7 + 0x64]
	sdiv	%l1,	0x1FD0,	%o1
	udivcc	%i5,	0x00A2,	%o7
	edge16	%l5,	%i6,	%i0
	ldub	[%l7 + 0x78],	%g2
	movrlez	%o3,	0x02A,	%g6
	fmovdl	%icc,	%f6,	%f1
	ldd	[%l7 + 0x10],	%f20
	lduw	[%l7 + 0x3C],	%i7
	movne	%xcc,	%i1,	%g4
	pdist	%f24,	%f22,	%f20
	fmovs	%f7,	%f22
	edge16	%g3,	%o6,	%g7
	andncc	%o0,	%l3,	%o2
	movle	%xcc,	%i3,	%o5
	edge16ln	%l2,	%g5,	%o4
	smul	%l6,	0x053C,	%l0
	edge8l	%l4,	%i2,	%i4
	sdivx	%g1,	0x01DB,	%o1
	fmovdle	%xcc,	%f31,	%f5
	alignaddr	%l1,	%o7,	%l5
	fones	%f19
	xor	%i6,	%i5,	%i0
	edge16n	%o3,	%g2,	%g6
	udivcc	%i7,	0x14F6,	%g4
	movrlz	%i1,	0x055,	%o6
	nop
	set	0x68, %g1
	stw	%g7,	[%l7 + %g1]
	fpack32	%f10,	%f4,	%f30
	xorcc	%g3,	0x0B28,	%l3
	andn	%o0,	%i3,	%o5
	sir	0x1022
	fmovdl	%xcc,	%f14,	%f15
	popc	0x1015,	%l2
	fmovspos	%xcc,	%f14,	%f22
	movrlez	%g5,	%o4,	%l6
	fmovscs	%xcc,	%f1,	%f7
	srl	%l0,	0x04,	%l4
	fpsub32	%f20,	%f4,	%f28
	movpos	%xcc,	%o2,	%i2
	fmovdgu	%xcc,	%f18,	%f28
	fmovsl	%xcc,	%f20,	%f4
	srax	%i4,	0x14,	%o1
	fmovsne	%xcc,	%f1,	%f12
	fxnors	%f7,	%f25,	%f30
	fxnors	%f27,	%f21,	%f22
	st	%f25,	[%l7 + 0x50]
	sdiv	%l1,	0x1078,	%g1
	move	%icc,	%l5,	%o7
	fmovrsgez	%i6,	%f16,	%f24
	movrlz	%i0,	%o3,	%g2
	popc	%g6,	%i7
	fcmpes	%fcc0,	%f22,	%f12
	udivcc	%g4,	0x1E5A,	%i5
	srlx	%i1,	0x1F,	%g7
	edge16	%g3,	%l3,	%o6
	addcc	%o0,	%o5,	%i3
	orncc	%l2,	0x018C,	%o4
	subccc	%g5,	%l0,	%l4
	movg	%icc,	%l6,	%i2
	edge16ln	%o2,	%i4,	%o1
	edge32	%g1,	%l5,	%l1
	movrgez	%i6,	%i0,	%o7
	fcmpne16	%f0,	%f26,	%o3
	udiv	%g2,	0x11D0,	%g6
	fsrc1	%f12,	%f22
	fmovrsgz	%i7,	%f30,	%f23
	andcc	%g4,	0x0164,	%i1
	fmovdn	%xcc,	%f23,	%f11
	ldx	[%l7 + 0x20],	%g7
	fmovdn	%icc,	%f3,	%f28
	fmul8sux16	%f8,	%f8,	%f26
	sdivcc	%g3,	0x0B4F,	%i5
	fmovdl	%icc,	%f28,	%f14
	popc	%l3,	%o6
	addcc	%o0,	0x1F4E,	%i3
	fcmpd	%fcc2,	%f16,	%f16
	and	%o5,	0x084B,	%l2
	edge8	%o4,	%l0,	%g5
	udivcc	%l4,	0x0AF2,	%i2
	edge32ln	%l6,	%o2,	%o1
	array32	%i4,	%g1,	%l5
	fmovrse	%i6,	%f2,	%f18
	edge32n	%l1,	%o7,	%i0
	movvs	%icc,	%g2,	%o3
	movrlz	%i7,	0x2A8,	%g4
	xor	%g6,	%g7,	%i1
	smulcc	%i5,	0x00FC,	%g3
	fcmple32	%f10,	%f8,	%o6
	fpsub16	%f12,	%f10,	%f30
	srlx	%l3,	%o0,	%o5
	fandnot2s	%f25,	%f30,	%f0
	udiv	%i3,	0x000F,	%l2
	fmovs	%f13,	%f19
	ldd	[%l7 + 0x50],	%l0
	andn	%o4,	0x0AFB,	%g5
	movgu	%xcc,	%l4,	%i2
	movvc	%icc,	%l6,	%o2
	andn	%i4,	%g1,	%o1
	movleu	%icc,	%i6,	%l1
	edge8n	%l5,	%o7,	%i0
	fmovscc	%xcc,	%f25,	%f28
	ldub	[%l7 + 0x2A],	%o3
	ldsh	[%l7 + 0x40],	%i7
	fsrc1	%f6,	%f0
	edge16ln	%g2,	%g6,	%g4
	stb	%g7,	[%l7 + 0x4D]
	movleu	%xcc,	%i1,	%i5
	add	%g3,	0x0B26,	%o6
	movrne	%l3,	0x28D,	%o0
	udivx	%o5,	0x07C3,	%i3
	movneg	%xcc,	%l0,	%o4
	movne	%xcc,	%g5,	%l2
	movrgz	%l4,	0x18C,	%l6
	mova	%icc,	%o2,	%i2
	mova	%xcc,	%g1,	%i4
	movvc	%icc,	%o1,	%i6
	xnorcc	%l5,	%o7,	%l1
	ld	[%l7 + 0x44],	%f11
	movrgz	%o3,	0x13B,	%i7
	edge32	%g2,	%g6,	%g4
	edge8ln	%g7,	%i0,	%i5
	movre	%i1,	0x0F5,	%g3
	sdivcc	%l3,	0x0719,	%o0
	edge32n	%o5,	%i3,	%l0
	xnor	%o4,	%o6,	%l2
	movre	%l4,	0x1CD,	%g5
	fmovdle	%xcc,	%f19,	%f22
	subcc	%o2,	0x1093,	%i2
	st	%f24,	[%l7 + 0x48]
	ldsb	[%l7 + 0x11],	%l6
	udiv	%g1,	0x11C5,	%i4
	fcmpgt32	%f20,	%f22,	%i6
	fmovdcs	%icc,	%f12,	%f30
	addc	%o1,	0x0389,	%l5
	lduh	[%l7 + 0x58],	%l1
	edge32ln	%o7,	%i7,	%g2
	edge8	%g6,	%o3,	%g7
	nop
	set	0x4A, %i2
	ldsh	[%l7 + %i2],	%i0
	umulcc	%i5,	%g4,	%i1
	edge32ln	%g3,	%o0,	%l3
	nop
	set	0x78, %o0
	ldsh	[%l7 + %o0],	%o5
	edge16l	%l0,	%o4,	%i3
	fpadd32s	%f9,	%f7,	%f30
	fxnor	%f26,	%f30,	%f8
	fmovdvc	%xcc,	%f29,	%f19
	ldd	[%l7 + 0x50],	%f24
	srlx	%l2,	0x09,	%o6
	sir	0x1158
	fmovdvc	%icc,	%f9,	%f27
	fandnot1	%f10,	%f22,	%f28
	save %g5, 0x04EB, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l4,	0x14,	%l6
	xnor	%g1,	0x136A,	%i4
	fmovsg	%icc,	%f15,	%f24
	edge32	%i6,	%i2,	%l5
	fmovsvs	%xcc,	%f15,	%f3
	lduh	[%l7 + 0x22],	%l1
	fmovdpos	%xcc,	%f21,	%f28
	array8	%o7,	%i7,	%o1
	sra	%g2,	0x0F,	%g6
	array32	%o3,	%g7,	%i5
	addc	%i0,	0x17DE,	%i1
	fones	%f13
	fmovsne	%icc,	%f24,	%f8
	edge8	%g3,	%g4,	%o0
	and	%o5,	0x06A2,	%l0
	movn	%xcc,	%o4,	%l3
	subccc	%l2,	%o6,	%g5
	edge8	%i3,	%o2,	%l6
	ldsw	[%l7 + 0x08],	%g1
	fmovrse	%l4,	%f23,	%f9
	edge8ln	%i6,	%i4,	%i2
	movre	%l5,	0x168,	%o7
	lduh	[%l7 + 0x62],	%l1
	fpmerge	%f27,	%f20,	%f26
	sll	%o1,	%i7,	%g2
	xnorcc	%g6,	%g7,	%o3
	fmovspos	%icc,	%f23,	%f22
	fmovrsgez	%i0,	%f19,	%f15
	movrlez	%i5,	%g3,	%i1
	movre	%o0,	%g4,	%o5
	alignaddrl	%l0,	%l3,	%l2
	add	%o4,	%g5,	%o6
	movle	%icc,	%o2,	%l6
	array16	%i3,	%g1,	%i6
	fmovsg	%icc,	%f2,	%f1
	fmovsa	%xcc,	%f3,	%f3
	fmovspos	%xcc,	%f5,	%f24
	array8	%i4,	%i2,	%l5
	ldub	[%l7 + 0x65],	%l4
	edge8n	%o7,	%l1,	%o1
	fmovrsne	%i7,	%f30,	%f16
	movre	%g6,	0x2C6,	%g2
	fandnot1s	%f15,	%f17,	%f1
	stx	%o3,	[%l7 + 0x60]
	fmovrdlz	%g7,	%f12,	%f28
	nop
	set	0x72, %l4
	ldsh	[%l7 + %l4],	%i5
	edge8n	%g3,	%i0,	%i1
	umul	%o0,	0x10D6,	%g4
	fandnot2	%f6,	%f18,	%f0
	ldx	[%l7 + 0x10],	%o5
	fxnors	%f15,	%f10,	%f6
	array16	%l0,	%l2,	%l3
	xnor	%o4,	0x1543,	%g5
	orcc	%o2,	0x0C8B,	%o6
	fmovsneg	%xcc,	%f28,	%f13
	fmovscc	%icc,	%f11,	%f24
	fmovdne	%xcc,	%f24,	%f17
	sra	%l6,	0x0F,	%i3
	mulscc	%i6,	%g1,	%i4
	save %l5, 0x09E6, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addccc	%o7,	0x00D4,	%l1
	alignaddr	%i2,	%o1,	%g6
	fmovrdgez	%g2,	%f18,	%f22
	fornot2s	%f0,	%f6,	%f11
	edge16l	%i7,	%o3,	%i5
	movrlz	%g7,	%i0,	%i1
	sllx	%g3,	0x1A,	%o0
	nop
	set	0x48, %l1
	stx	%o5,	[%l7 + %l1]
	alignaddrl	%g4,	%l0,	%l2
	fmovdl	%xcc,	%f8,	%f20
	edge16ln	%o4,	%g5,	%l3
	fmovdvs	%xcc,	%f31,	%f29
	movpos	%xcc,	%o2,	%o6
	fmovdne	%icc,	%f20,	%f25
	save %l6, %i6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%i3,	%i4,	%l5
	fmovdne	%icc,	%f0,	%f11
	movrne	%l4,	0x0DE,	%l1
	fmovdg	%xcc,	%f30,	%f25
	srlx	%i2,	%o1,	%o7
	movpos	%xcc,	%g2,	%i7
	movg	%xcc,	%g6,	%o3
	movrlz	%i5,	%i0,	%i1
	addc	%g7,	0x1E7F,	%g3
	fpsub32s	%f5,	%f28,	%f20
	movge	%icc,	%o5,	%o0
	sdivx	%g4,	0x07C3,	%l0
	smul	%l2,	%g5,	%o4
	save %l3, %o6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movleu	%xcc,	%i6,	%g1
	orn	%l6,	%i3,	%i4
	or	%l4,	%l5,	%l1
	and	%i2,	0x1514,	%o1
	fzero	%f12
	srax	%o7,	0x18,	%g2
	xorcc	%g6,	0x1745,	%o3
	movneg	%xcc,	%i7,	%i0
	edge16	%i1,	%i5,	%g3
	fpackfix	%f4,	%f8
	srax	%o5,	%g7,	%o0
	sub	%l0,	%l2,	%g5
	or	%g4,	0x0BAF,	%l3
	movvc	%icc,	%o6,	%o4
	fcmped	%fcc3,	%f2,	%f20
	save %i6, 0x0B4D, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%icc,	%g1,	%l6
	ldsb	[%l7 + 0x65],	%i4
	sdiv	%l4,	0x0621,	%i3
	movge	%icc,	%l1,	%l5
	array16	%o1,	%o7,	%g2
	movl	%icc,	%g6,	%i2
	mulx	%i7,	%o3,	%i1
	movrlez	%i0,	0x034,	%i5
	subcc	%g3,	0x189E,	%g7
	movl	%icc,	%o0,	%o5
	lduw	[%l7 + 0x4C],	%l0
	edge16ln	%g5,	%g4,	%l3
	subccc	%o6,	0x1957,	%o4
	for	%f26,	%f4,	%f12
	std	%f0,	[%l7 + 0x60]
	movl	%icc,	%l2,	%o2
	movn	%icc,	%i6,	%g1
	srax	%i4,	0x19,	%l4
	stw	%l6,	[%l7 + 0x70]
	st	%f28,	[%l7 + 0x54]
	sra	%l1,	0x01,	%i3
	array32	%o1,	%l5,	%o7
	edge16l	%g2,	%g6,	%i7
	smul	%i2,	%o3,	%i1
	orncc	%i5,	0x1CF3,	%i0
	movvc	%xcc,	%g3,	%g7
	fxnor	%f22,	%f2,	%f14
	orcc	%o5,	%l0,	%g5
	array32	%g4,	%o0,	%o6
	orcc	%o4,	0x1150,	%l2
	srl	%l3,	%i6,	%o2
	fcmple16	%f30,	%f26,	%g1
	lduw	[%l7 + 0x60],	%i4
	movleu	%xcc,	%l4,	%l6
	xorcc	%l1,	%o1,	%l5
	edge32ln	%o7,	%g2,	%i3
	stx	%g6,	[%l7 + 0x58]
	alignaddrl	%i2,	%o3,	%i7
	and	%i5,	%i1,	%i0
	fnands	%f25,	%f0,	%f24
	fpmerge	%f21,	%f31,	%f10
	edge8n	%g3,	%g7,	%o5
	udiv	%l0,	0x0F0C,	%g5
	sdivcc	%o0,	0x0D00,	%o6
	fand	%f6,	%f4,	%f30
	sra	%o4,	0x01,	%l2
	srax	%l3,	0x1D,	%i6
	fmovdpos	%icc,	%f18,	%f15
	movrne	%o2,	%g4,	%i4
	movvc	%xcc,	%g1,	%l4
	udivx	%l6,	0x129F,	%l1
	movleu	%icc,	%o1,	%o7
	xnorcc	%l5,	0x1F84,	%g2
	ldub	[%l7 + 0x1D],	%i3
	sdivcc	%g6,	0x14DB,	%i2
	xor	%o3,	0x0161,	%i5
	orn	%i1,	%i0,	%g3
	sdiv	%g7,	0x0F9F,	%i7
	fmovrsne	%o5,	%f8,	%f11
	and	%g5,	%o0,	%l0
	subccc	%o4,	0x0476,	%o6
	sdiv	%l3,	0x0F23,	%i6
	edge32l	%o2,	%l2,	%i4
	lduh	[%l7 + 0x70],	%g1
	movrgez	%l4,	%g4,	%l6
	ldsw	[%l7 + 0x70],	%l1
	ldd	[%l7 + 0x78],	%o6
	movrne	%l5,	0x2C7,	%g2
	add	%o1,	%i3,	%i2
	nop
	set	0x24, %i5
	stw	%g6,	[%l7 + %i5]
	andcc	%i5,	%o3,	%i1
	movl	%icc,	%g3,	%i0
	alignaddr	%i7,	%g7,	%o5
	fmovdleu	%icc,	%f24,	%f13
	movrlez	%o0,	0x3A7,	%g5
	fmovrslez	%l0,	%f17,	%f0
	movcc	%icc,	%o4,	%o6
	and	%i6,	0x1490,	%l3
	ldd	[%l7 + 0x38],	%f2
	edge16l	%o2,	%i4,	%l2
	srax	%g1,	0x18,	%l4
	orn	%l6,	0x1034,	%g4
	orcc	%o7,	%l1,	%l5
	movrne	%o1,	%i3,	%g2
	addcc	%g6,	%i2,	%o3
	mulscc	%i5,	0x0F9F,	%i1
	andn	%g3,	0x0ACB,	%i0
	stb	%i7,	[%l7 + 0x6D]
	srax	%g7,	0x0C,	%o5
	stw	%o0,	[%l7 + 0x2C]
	edge32ln	%l0,	%g5,	%o6
	restore %o4, 0x16B0, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%i6,	0x050F,	%i4
	movpos	%xcc,	%o2,	%g1
	edge32ln	%l4,	%l6,	%g4
	st	%f25,	[%l7 + 0x1C]
	movrlez	%l2,	0x158,	%o7
	xorcc	%l5,	%l1,	%i3
	ldub	[%l7 + 0x1F],	%o1
	save %g2, 0x1434, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o3,	0x0FE1,	%g6
	sub	%i5,	0x1CAB,	%i1
	fmovrdne	%i0,	%f10,	%f28
	xnor	%i7,	0x0FB7,	%g3
	st	%f10,	[%l7 + 0x34]
	ldsw	[%l7 + 0x7C],	%o5
	sdiv	%o0,	0x1D24,	%l0
	ld	[%l7 + 0x34],	%f7
	sth	%g5,	[%l7 + 0x10]
	edge16	%o6,	%o4,	%g7
	stx	%l3,	[%l7 + 0x68]
	andcc	%i6,	0x1DD0,	%i4
	udivcc	%o2,	0x12FA,	%l4
	srl	%g1,	0x08,	%g4
	andcc	%l2,	%o7,	%l5
	subc	%l6,	0x13B9,	%l1
	ldsh	[%l7 + 0x4A],	%i3
	movgu	%icc,	%o1,	%g2
	fone	%f12
	movgu	%icc,	%i2,	%o3
	fnot1s	%f20,	%f10
	umulcc	%i5,	%i1,	%i0
	ldd	[%l7 + 0x40],	%f14
	xor	%g6,	0x1F2F,	%i7
	ld	[%l7 + 0x38],	%f10
	addcc	%g3,	0x0083,	%o0
	lduh	[%l7 + 0x12],	%l0
	udiv	%g5,	0x1BE9,	%o6
	mulx	%o5,	%o4,	%l3
	ldsw	[%l7 + 0x2C],	%i6
	movle	%xcc,	%i4,	%g7
	movvc	%xcc,	%o2,	%l4
	fmovrslez	%g1,	%f11,	%f31
	movgu	%icc,	%l2,	%o7
	movneg	%icc,	%g4,	%l5
	movn	%xcc,	%l1,	%i3
	movcc	%xcc,	%o1,	%l6
	fornot1s	%f2,	%f31,	%f3
	std	%f12,	[%l7 + 0x10]
	movrlez	%g2,	0x34B,	%o3
	fandnot1	%f8,	%f2,	%f18
	fcmpes	%fcc2,	%f20,	%f15
	udivx	%i2,	0x04F6,	%i1
	fnot2	%f4,	%f6
	array16	%i0,	%g6,	%i5
	nop
	set	0x1C, %g3
	lduw	[%l7 + %g3],	%i7
	srax	%o0,	0x02,	%l0
	edge32n	%g5,	%o6,	%o5
	array32	%o4,	%l3,	%g3
	sethi	0x1931,	%i4
	fmovrdgz	%i6,	%f14,	%f10
	ldsw	[%l7 + 0x58],	%g7
	xnor	%o2,	0x00F3,	%g1
	movcc	%xcc,	%l2,	%l4
	movge	%xcc,	%o7,	%l5
	ldsw	[%l7 + 0x5C],	%l1
	movre	%i3,	%o1,	%l6
	edge32n	%g2,	%g4,	%i2
	edge16n	%o3,	%i1,	%g6
	and	%i0,	0x176A,	%i7
	smul	%i5,	%o0,	%g5
	fandnot1	%f10,	%f0,	%f18
	edge16n	%o6,	%o5,	%o4
	ldub	[%l7 + 0x27],	%l3
	fcmple32	%f0,	%f6,	%l0
	movrlz	%i4,	0x3F3,	%i6
	udivx	%g7,	0x0AC3,	%o2
	movre	%g1,	%l2,	%g3
	ldd	[%l7 + 0x40],	%l4
	stw	%l5,	[%l7 + 0x78]
	movre	%o7,	%i3,	%l1
	addc	%o1,	%l6,	%g4
	movne	%icc,	%g2,	%o3
	fsrc1s	%f0,	%f13
	fmovs	%f24,	%f0
	addcc	%i2,	0x1F49,	%i1
	edge16n	%g6,	%i0,	%i5
	edge32	%o0,	%g5,	%i7
	xnorcc	%o5,	0x17F8,	%o4
	movcs	%icc,	%o6,	%l3
	movne	%xcc,	%l0,	%i4
	sub	%i6,	0x1FFB,	%g7
	popc	%g1,	%l2
	fmovrdgz	%o2,	%f14,	%f28
	srax	%g3,	%l4,	%o7
	edge32l	%l5,	%i3,	%l1
	fmuld8sux16	%f11,	%f25,	%f20
	ldub	[%l7 + 0x64],	%l6
	edge16	%o1,	%g4,	%g2
	ldsh	[%l7 + 0x68],	%o3
	sra	%i2,	%g6,	%i0
	sdivcc	%i5,	0x0CCD,	%i1
	fnot2	%f6,	%f8
	ldx	[%l7 + 0x10],	%o0
	fsrc1	%f6,	%f26
	xor	%g5,	0x19E1,	%i7
	alignaddrl	%o5,	%o4,	%o6
	array8	%l0,	%i4,	%l3
	sdiv	%g7,	0x095D,	%i6
	mulscc	%g1,	%l2,	%g3
	xnor	%o2,	0x06FA,	%l4
	movpos	%icc,	%l5,	%o7
	smul	%l1,	%l6,	%o1
	fcmpd	%fcc2,	%f14,	%f12
	movrlz	%i3,	0x1C0,	%g4
	movvc	%xcc,	%g2,	%i2
	fcmps	%fcc0,	%f7,	%f10
	ldsb	[%l7 + 0x33],	%g6
	array8	%i0,	%o3,	%i1
	movrgez	%o0,	%i5,	%i7
	addcc	%g5,	%o5,	%o4
	smul	%l0,	%o6,	%i4
	smul	%l3,	0x0DA0,	%g7
	sra	%g1,	0x01,	%l2
	smul	%i6,	0x0006,	%g3
	fnors	%f8,	%f4,	%f14
	fzeros	%f18
	edge32	%l4,	%o2,	%l5
	array8	%o7,	%l1,	%l6
	fcmpne32	%f24,	%f22,	%o1
	xorcc	%i3,	%g4,	%g2
	movneg	%icc,	%g6,	%i0
	fone	%f22
	movcs	%xcc,	%i2,	%o3
	xorcc	%i1,	0x10C7,	%i5
	ldd	[%l7 + 0x10],	%f22
	sra	%i7,	%o0,	%g5
	fmul8x16al	%f6,	%f13,	%f24
	fmovdg	%icc,	%f21,	%f10
	mulx	%o4,	0x1D3B,	%l0
	sir	0x1B17
	fcmpeq32	%f16,	%f30,	%o5
	st	%f10,	[%l7 + 0x44]
	fmovsneg	%xcc,	%f27,	%f1
	movrgz	%i4,	0x3A9,	%l3
	fmovrsgz	%o6,	%f10,	%f0
	movpos	%icc,	%g1,	%l2
	movn	%xcc,	%i6,	%g7
	sdivx	%g3,	0x0411,	%o2
	movgu	%icc,	%l4,	%l5
	andcc	%o7,	0x1470,	%l1
	srlx	%l6,	%o1,	%g4
	fmovrse	%i3,	%f30,	%f14
	subc	%g6,	0x0E40,	%i0
	umulcc	%i2,	%o3,	%g2
	fmovsl	%xcc,	%f10,	%f11
	fmovdge	%xcc,	%f24,	%f14
	udivx	%i1,	0x0E25,	%i7
	andn	%o0,	0x0FAB,	%g5
	udivcc	%o4,	0x0066,	%l0
	mulscc	%i5,	%i4,	%o5
	fmovdle	%xcc,	%f29,	%f17
	movl	%icc,	%o6,	%g1
	fmovrsgz	%l3,	%f8,	%f30
	fornot1	%f26,	%f14,	%f4
	stx	%l2,	[%l7 + 0x10]
	smulcc	%g7,	%g3,	%i6
	edge32	%l4,	%l5,	%o7
	orcc	%l1,	%o2,	%l6
	fpadd16	%f16,	%f20,	%f14
	movrlz	%g4,	%i3,	%g6
	udiv	%o1,	0x19D1,	%i2
	move	%icc,	%i0,	%o3
	nop
	set	0x4F, %i3
	ldub	[%l7 + %i3],	%g2
	std	%f24,	[%l7 + 0x20]
	movg	%xcc,	%i7,	%o0
	fnand	%f26,	%f22,	%f0
	ldub	[%l7 + 0x56],	%g5
	mova	%icc,	%i1,	%o4
	fmovdneg	%icc,	%f13,	%f11
	fmul8sux16	%f24,	%f28,	%f18
	sdiv	%l0,	0x0370,	%i4
	smul	%o5,	%o6,	%g1
	sth	%l3,	[%l7 + 0x6C]
	edge32n	%l2,	%i5,	%g3
	stx	%g7,	[%l7 + 0x50]
	edge16ln	%l4,	%l5,	%o7
	movleu	%xcc,	%i6,	%l1
	stb	%l6,	[%l7 + 0x3A]
	movrgz	%g4,	0x2CB,	%i3
	alignaddr	%o2,	%o1,	%i2
	xorcc	%g6,	0x06B7,	%i0
	setx loop_9, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_9: 	edge8l	%g5,	%i1,	%o0
	umul	%o4,	0x01BE,	%l0
	ldx	[%l7 + 0x18],	%i4
	movrgez	%o5,	0x082,	%o6
	fxor	%f24,	%f4,	%f20
	orncc	%g1,	%l2,	%l3
	addc	%g3,	0x1998,	%g7
	alignaddrl	%l4,	%i5,	%o7
	edge16n	%i6,	%l5,	%l6
	array32	%l1,	%i3,	%o2
	xor	%o1,	%g4,	%g6
	sll	%i0,	%i2,	%o3
	udiv	%g2,	0x131B,	%g5
	save %i1, 0x1E45, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%o4,	%o0
	fsrc2	%f10,	%f24
	movle	%icc,	%i4,	%l0
	fcmpne32	%f26,	%f22,	%o5
	move	%xcc,	%g1,	%o6
	fmovrsne	%l3,	%f7,	%f2
	xnorcc	%g3,	%l2,	%l4
	movrgez	%g7,	%o7,	%i6
	mulx	%l5,	%i5,	%l1
	edge16ln	%i3,	%o2,	%l6
	edge8	%o1,	%g6,	%i0
	edge16ln	%i2,	%g4,	%o3
	edge16ln	%g2,	%i1,	%g5
	array8	%i7,	%o4,	%o0
	andcc	%l0,	0x03D4,	%i4
	fpsub16s	%f2,	%f0,	%f2
	sub	%o5,	%o6,	%g1
	fcmpne32	%f0,	%f8,	%l3
	addc	%l2,	%l4,	%g3
	orn	%g7,	%o7,	%i6
	movleu	%icc,	%i5,	%l1
	sth	%i3,	[%l7 + 0x3C]
	andcc	%o2,	%l6,	%o1
	edge16ln	%l5,	%i0,	%i2
	addccc	%g6,	0x1BCC,	%g4
	andncc	%g2,	%i1,	%g5
	fsrc1	%f8,	%f24
	fmovsle	%xcc,	%f2,	%f25
	subc	%o3,	%o4,	%o0
	movne	%xcc,	%l0,	%i4
	edge8n	%o5,	%i7,	%g1
	fmovrdgz	%l3,	%f16,	%f14
	ldub	[%l7 + 0x3A],	%l2
	fnot2s	%f14,	%f31
	xorcc	%o6,	0x0A80,	%g3
	edge16l	%g7,	%l4,	%o7
	fsrc1	%f4,	%f12
	fmovdleu	%xcc,	%f18,	%f20
	andcc	%i5,	0x1C73,	%i6
	popc	0x1DE7,	%l1
	restore %i3, 0x117C, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sth	%o1,	[%l7 + 0x36]
	lduw	[%l7 + 0x44],	%o2
	edge32ln	%i0,	%l5,	%g6
	sir	0x07B8
	fmovrslez	%g4,	%f19,	%f27
	orncc	%i2,	0x0C71,	%i1
	ldsw	[%l7 + 0x1C],	%g2
	fsrc2	%f0,	%f14
	save %g5, %o3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o4,	0x1B64,	%i4
	sdiv	%o5,	0x0367,	%l0
	array32	%i7,	%l3,	%l2
	srlx	%o6,	0x06,	%g1
	fpadd32s	%f19,	%f26,	%f28
	edge8l	%g3,	%l4,	%o7
	alignaddr	%g7,	%i6,	%i5
	addccc	%i3,	0x1708,	%l1
	udivcc	%o1,	0x0435,	%l6
	move	%xcc,	%i0,	%l5
	udiv	%g6,	0x07A3,	%g4
	fmovsn	%xcc,	%f9,	%f5
	addccc	%o2,	%i1,	%g2
	fmovrslez	%g5,	%f25,	%f10
	orn	%o3,	%o0,	%i2
	fcmpd	%fcc3,	%f20,	%f4
	fmovdleu	%xcc,	%f28,	%f28
	nop
	set	0x68, %i7
	stb	%i4,	[%l7 + %i7]
	xnorcc	%o5,	0x165F,	%l0
	xnorcc	%i7,	0x0EA1,	%o4
	movg	%xcc,	%l2,	%o6
	fmovse	%xcc,	%f13,	%f13
	fexpand	%f0,	%f26
	fsrc1s	%f4,	%f18
	fornot1s	%f10,	%f18,	%f4
	mulscc	%l3,	%g1,	%l4
	fmuld8ulx16	%f6,	%f11,	%f8
	movrlez	%o7,	0x37C,	%g3
	fnot1s	%f17,	%f18
	fcmpeq16	%f10,	%f18,	%i6
	udivx	%i5,	0x0D35,	%g7
	fandnot1s	%f22,	%f17,	%f5
	fmovsgu	%xcc,	%f3,	%f3
	ldub	[%l7 + 0x55],	%i3
	fmovde	%xcc,	%f22,	%f16
	fcmped	%fcc1,	%f18,	%f16
	or	%o1,	%l6,	%l1
	edge32	%i0,	%l5,	%g4
	edge8	%g6,	%o2,	%i1
	sllx	%g2,	%g5,	%o0
	udivx	%i2,	0x0277,	%o3
	addcc	%i4,	0x1EA1,	%o5
	sir	0x154C
	movgu	%xcc,	%l0,	%i7
	smulcc	%o4,	%o6,	%l3
	fmovsgu	%icc,	%f15,	%f7
	sra	%l2,	%l4,	%o7
	srlx	%g3,	%i6,	%i5
	movrlz	%g7,	%g1,	%o1
	umulcc	%i3,	0x01FD,	%l1
	stx	%l6,	[%l7 + 0x38]
	movg	%xcc,	%i0,	%l5
	movge	%xcc,	%g4,	%g6
	fones	%f26
	fpadd16s	%f0,	%f2,	%f12
	fcmpgt16	%f30,	%f16,	%o2
	st	%f10,	[%l7 + 0x58]
	ldd	[%l7 + 0x78],	%g2
	movvs	%xcc,	%i1,	%g5
	ldsb	[%l7 + 0x31],	%o0
	fcmpd	%fcc3,	%f2,	%f2
	edge8l	%i2,	%o3,	%i4
	udiv	%l0,	0x0FEB,	%i7
	srax	%o5,	%o6,	%o4
	udivx	%l2,	0x1656,	%l3
	fmovdleu	%icc,	%f28,	%f16
	xnor	%o7,	%g3,	%i6
	ld	[%l7 + 0x54],	%f8
	sdivcc	%l4,	0x100B,	%i5
	stb	%g1,	[%l7 + 0x4C]
	addcc	%o1,	%i3,	%g7
	fones	%f1
	stb	%l6,	[%l7 + 0x0E]
	movrgz	%l1,	0x2AE,	%i0
	xnor	%l5,	%g4,	%g6
	udivx	%g2,	0x0961,	%o2
	fmovrslez	%i1,	%f31,	%f8
	andn	%g5,	0x1CA0,	%i2
	sdivcc	%o3,	0x103B,	%o0
	movleu	%xcc,	%i4,	%i7
	sub	%l0,	0x1F16,	%o6
	fmovse	%xcc,	%f17,	%f27
	subcc	%o5,	0x0F77,	%o4
	movcs	%xcc,	%l2,	%o7
	movneg	%icc,	%g3,	%i6
	edge16n	%l4,	%l3,	%g1
	std	%f0,	[%l7 + 0x18]
	movre	%o1,	%i3,	%g7
	fmovdne	%icc,	%f2,	%f22
	ldsh	[%l7 + 0x56],	%i5
	fmuld8sux16	%f21,	%f14,	%f26
	sethi	0x0ED9,	%l6
	srax	%i0,	0x11,	%l1
	movcs	%icc,	%g4,	%g6
	ldx	[%l7 + 0x08],	%g2
	movg	%icc,	%o2,	%i1
	sdiv	%g5,	0x19BE,	%l5
	ldd	[%l7 + 0x20],	%f18
	alignaddrl	%i2,	%o3,	%i4
	fcmpne32	%f20,	%f26,	%o0
	movrlez	%i7,	%o6,	%l0
	ldsw	[%l7 + 0x08],	%o5
	fmovsneg	%icc,	%f18,	%f28
	movgu	%icc,	%o4,	%l2
	movrne	%g3,	%i6,	%l4
	fcmps	%fcc2,	%f4,	%f12
	sth	%l3,	[%l7 + 0x78]
	fmovdcs	%xcc,	%f30,	%f11
	or	%g1,	0x0204,	%o1
	edge8l	%o7,	%i3,	%i5
	edge8n	%g7,	%i0,	%l6
	fmovdvc	%icc,	%f30,	%f1
	srl	%g4,	0x0E,	%l1
	edge16n	%g6,	%g2,	%o2
	sllx	%g5,	0x1F,	%i1
	orncc	%i2,	%o3,	%i4
	movcs	%xcc,	%l5,	%o0
	movg	%xcc,	%i7,	%l0
	udivx	%o5,	0x04CE,	%o6
	udivcc	%o4,	0x043D,	%g3
	sir	0x0F23
	movre	%l2,	0x3BA,	%i6
	movgu	%icc,	%l4,	%g1
	srax	%l3,	%o1,	%i3
	sll	%i5,	%o7,	%g7
	ldd	[%l7 + 0x20],	%f26
	xorcc	%i0,	%g4,	%l1
	lduh	[%l7 + 0x0E],	%g6
	udivcc	%g2,	0x0306,	%l6
	movvc	%icc,	%g5,	%o2
	fmovrdgez	%i2,	%f26,	%f4
	orn	%i1,	%i4,	%l5
	fmovrsne	%o0,	%f5,	%f4
	smulcc	%o3,	%l0,	%i7
	fmovdn	%xcc,	%f5,	%f25
	movvc	%xcc,	%o5,	%o6
	subccc	%o4,	%l2,	%g3
	movre	%l4,	0x20E,	%g1
	sdiv	%l3,	0x1874,	%o1
	movrgz	%i6,	0x279,	%i3
	popc	0x06DC,	%o7
	edge32	%g7,	%i0,	%g4
	smulcc	%i5,	%g6,	%g2
	fmovdvc	%icc,	%f6,	%f6
	fzeros	%f15
	sub	%l6,	0x0EE0,	%l1
	stw	%g5,	[%l7 + 0x08]
	subccc	%i2,	%o2,	%i4
	movleu	%icc,	%l5,	%i1
	movle	%icc,	%o0,	%l0
	subccc	%i7,	0x0F5B,	%o5
	xorcc	%o3,	%o6,	%l2
	edge32ln	%o4,	%g3,	%g1
	subccc	%l4,	%o1,	%l3
	ldsh	[%l7 + 0x76],	%i3
	stb	%i6,	[%l7 + 0x1E]
	fxors	%f23,	%f25,	%f28
	movpos	%xcc,	%o7,	%g7
	movne	%icc,	%i0,	%g4
	fmul8sux16	%f4,	%f26,	%f16
	udivx	%g6,	0x0BC1,	%g2
	fcmpgt16	%f16,	%f10,	%i5
	fcmpne32	%f10,	%f2,	%l6
	fmovdcs	%xcc,	%f26,	%f27
	ldx	[%l7 + 0x48],	%l1
	fsrc1	%f30,	%f16
	smul	%g5,	0x0A17,	%o2
	sra	%i4,	0x1D,	%l5
	sdivx	%i2,	0x0B7C,	%i1
	orn	%l0,	%i7,	%o5
	ldd	[%l7 + 0x70],	%o2
	stw	%o0,	[%l7 + 0x3C]
	setx loop_10, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_10: 	edge8	%g1,	%l4,	%o1
	movrgz	%l3,	0x110,	%i3
	fmovsvc	%icc,	%f18,	%f21
	xorcc	%g3,	0x12C5,	%o7
	sth	%i6,	[%l7 + 0x62]
	fpsub32	%f24,	%f16,	%f4
	movl	%icc,	%i0,	%g7
	movrgz	%g6,	%g4,	%i5
	fandnot2	%f10,	%f12,	%f2
	andncc	%l6,	%l1,	%g5
	xor	%o2,	0x04E4,	%i4
	movrgez	%g2,	%l5,	%i2
	fandnot1s	%f13,	%f9,	%f28
	srl	%i1,	0x15,	%l0
	st	%f5,	[%l7 + 0x60]
	andncc	%i7,	%o3,	%o0
	movl	%icc,	%l2,	%o5
	movrlz	%o4,	%o6,	%g1
	addccc	%o1,	%l4,	%l3
	fmovdleu	%xcc,	%f29,	%f6
	fmovsg	%xcc,	%f26,	%f5
	edge8	%g3,	%i3,	%o7
	edge8	%i6,	%i0,	%g6
	nop
	set	0x1F, %o7
	ldub	[%l7 + %o7],	%g4
	andncc	%g7,	%l6,	%l1
	std	%f20,	[%l7 + 0x28]
	movge	%xcc,	%i5,	%o2
	movl	%xcc,	%i4,	%g5
	movrlz	%g2,	%l5,	%i1
	edge32n	%i2,	%l0,	%i7
	fmovdn	%xcc,	%f4,	%f30
	stw	%o0,	[%l7 + 0x24]
	addc	%o3,	0x1C53,	%o5
	ldsw	[%l7 + 0x70],	%o4
	sllx	%o6,	%g1,	%o1
	movcs	%xcc,	%l2,	%l3
	andcc	%g3,	0x06CE,	%i3
	stb	%o7,	[%l7 + 0x46]
	fmovrse	%i6,	%f28,	%f24
	sllx	%i0,	0x1C,	%g6
	orn	%g4,	%l4,	%g7
	fand	%f24,	%f28,	%f30
	st	%f27,	[%l7 + 0x0C]
	mova	%xcc,	%l1,	%l6
	edge32n	%i5,	%i4,	%g5
	fmovrdgez	%o2,	%f22,	%f10
	mova	%xcc,	%l5,	%g2
	sdivx	%i1,	0x05A1,	%i2
	fmovrsgz	%i7,	%f4,	%f23
	ldd	[%l7 + 0x50],	%l0
	nop
	set	0x30, %o5
	stx	%o3,	[%l7 + %o5]
	addc	%o0,	%o4,	%o6
	fabsd	%f20,	%f20
	movg	%icc,	%o5,	%g1
	movleu	%xcc,	%o1,	%l2
	fcmple16	%f18,	%f4,	%l3
	lduh	[%l7 + 0x58],	%g3
	stb	%o7,	[%l7 + 0x58]
	alignaddrl	%i3,	%i0,	%g6
	udivcc	%i6,	0x0F53,	%l4
	movrlz	%g7,	0x003,	%g4
	movge	%xcc,	%l1,	%l6
	andn	%i5,	%g5,	%o2
	movn	%icc,	%l5,	%g2
	andn	%i4,	%i2,	%i7
	add	%l0,	%i1,	%o3
	fmovspos	%icc,	%f22,	%f9
	movle	%xcc,	%o0,	%o4
	ldsh	[%l7 + 0x58],	%o6
	fmovrse	%o5,	%f4,	%f7
	fnot2	%f20,	%f6
	stw	%g1,	[%l7 + 0x14]
	smul	%o1,	%l2,	%l3
	udivcc	%g3,	0x0E8C,	%o7
	move	%icc,	%i0,	%i3
	nop
	set	0x12, %i4
	ldsh	[%l7 + %i4],	%g6
	fornot1s	%f22,	%f4,	%f11
	xnorcc	%l4,	%g7,	%g4
	movrne	%i6,	%l1,	%l6
	xnor	%g5,	%i5,	%l5
	nop
	set	0x50, %i1
	std	%f4,	[%l7 + %i1]
	srl	%o2,	%g2,	%i2
	fmovda	%icc,	%f9,	%f4
	ldsh	[%l7 + 0x4A],	%i7
	stx	%l0,	[%l7 + 0x38]
	fcmps	%fcc0,	%f19,	%f29
	stb	%i1,	[%l7 + 0x78]
	fmovsg	%icc,	%f26,	%f15
	orn	%i4,	0x1ED8,	%o0
	srlx	%o4,	0x1F,	%o3
	fnegs	%f14,	%f13
	andcc	%o6,	0x0F09,	%o5
	addc	%g1,	%l2,	%o1
	movge	%icc,	%l3,	%g3
	sdiv	%o7,	0x1F13,	%i3
	edge32ln	%g6,	%i0,	%l4
	array16	%g4,	%i6,	%l1
	fsrc1	%f30,	%f10
	movpos	%xcc,	%g7,	%l6
	nop
	set	0x2C, %g4
	stw	%g5,	[%l7 + %g4]
	movvs	%icc,	%i5,	%l5
	sth	%g2,	[%l7 + 0x60]
	edge16	%o2,	%i2,	%i7
	array32	%i1,	%l0,	%i4
	move	%icc,	%o4,	%o0
	movvs	%xcc,	%o6,	%o5
	fmovdgu	%icc,	%f5,	%f19
	sll	%g1,	0x16,	%l2
	sth	%o3,	[%l7 + 0x34]
	edge16n	%l3,	%o1,	%o7
	ldub	[%l7 + 0x2B],	%g3
	udiv	%i3,	0x0BF4,	%i0
	ldsw	[%l7 + 0x44],	%g6
	edge32ln	%g4,	%i6,	%l4
	std	%f28,	[%l7 + 0x48]
	subccc	%g7,	%l1,	%g5
	fors	%f19,	%f11,	%f28
	fmovsne	%xcc,	%f11,	%f27
	fone	%f18
	fmovdleu	%xcc,	%f13,	%f27
	sir	0x0A28
	ldub	[%l7 + 0x5A],	%i5
	faligndata	%f20,	%f16,	%f20
	fcmpd	%fcc3,	%f14,	%f6
	sllx	%l6,	0x1A,	%l5
	lduh	[%l7 + 0x1A],	%g2
	fcmpne32	%f8,	%f2,	%o2
	movvc	%icc,	%i7,	%i2
	movvs	%icc,	%i1,	%i4
	mova	%icc,	%o4,	%l0
	fmovdg	%xcc,	%f7,	%f10
	subcc	%o0,	0x0490,	%o5
	faligndata	%f16,	%f22,	%f14
	mulx	%g1,	0x029E,	%l2
	orncc	%o6,	%o3,	%l3
	edge8n	%o1,	%g3,	%o7
	fmovdg	%xcc,	%f26,	%f26
	sdiv	%i3,	0x1120,	%i0
	andn	%g4,	%i6,	%l4
	andcc	%g6,	%g7,	%l1
	edge16n	%g5,	%l6,	%i5
	movpos	%icc,	%g2,	%l5
	stw	%i7,	[%l7 + 0x64]
	edge32n	%o2,	%i1,	%i2
	movrne	%o4,	%i4,	%o0
	sdivcc	%l0,	0x1D5D,	%o5
	fmovsge	%icc,	%f31,	%f7
	sth	%g1,	[%l7 + 0x16]
	sdiv	%l2,	0x1B1E,	%o3
	sll	%l3,	%o6,	%o1
	movneg	%icc,	%o7,	%i3
	sub	%g3,	0x0921,	%i0
	fmovde	%icc,	%f3,	%f12
	sll	%g4,	0x05,	%i6
	addcc	%l4,	%g6,	%l1
	save %g7, 0x15F6, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%i5,	%g2
	lduh	[%l7 + 0x50],	%l5
	sdivx	%g5,	0x019F,	%i7
	fsrc2	%f16,	%f8
	alignaddrl	%i1,	%i2,	%o4
	edge8n	%i4,	%o0,	%l0
	andcc	%o2,	0x0983,	%o5
	srl	%l2,	0x02,	%g1
	movg	%icc,	%l3,	%o6
	udivcc	%o3,	0x0EB3,	%o1
	and	%i3,	%o7,	%g3
	fsrc2s	%f11,	%f3
	edge16	%i0,	%g4,	%l4
	movvs	%icc,	%i6,	%l1
	ldsb	[%l7 + 0x18],	%g6
	fpackfix	%f16,	%f20
	or	%l6,	0x0BC9,	%i5
	or	%g2,	%l5,	%g5
	movrlz	%i7,	%i1,	%g7
	andn	%o4,	0x0CBD,	%i4
	lduw	[%l7 + 0x78],	%o0
	ldsb	[%l7 + 0x51],	%i2
	array16	%l0,	%o5,	%l2
	srlx	%o2,	0x15,	%l3
	ldsb	[%l7 + 0x45],	%o6
	fcmpes	%fcc0,	%f1,	%f0
	udivcc	%g1,	0x0259,	%o1
	fmovdleu	%xcc,	%f2,	%f21
	edge16	%o3,	%i3,	%o7
	srax	%g3,	%i0,	%l4
	edge16l	%i6,	%l1,	%g4
	edge8n	%g6,	%i5,	%g2
	restore %l5, %l6, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x12],	%i7
	array32	%i1,	%g7,	%o4
	sll	%o0,	0x03,	%i4
	fmovsge	%icc,	%f30,	%f16
	edge8n	%l0,	%o5,	%i2
	fmovsg	%icc,	%f11,	%f30
	fand	%f24,	%f0,	%f6
	sdiv	%o2,	0x11A5,	%l2
	setx loop_11, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_11: 	fmovdleu	%xcc,	%f3,	%f25
	mulscc	%o3,	0x02A7,	%o1
	movg	%icc,	%o7,	%g3
	fmovsge	%icc,	%f22,	%f16
	edge8ln	%i3,	%l4,	%i6
	array32	%l1,	%g4,	%i0
	edge32	%g6,	%i5,	%g2
	sdivx	%l5,	0x126A,	%l6
	xnorcc	%i7,	0x1AB5,	%i1
	xnor	%g5,	0x1501,	%g7
	movre	%o0,	0x12B,	%o4
	fcmpeq32	%f28,	%f18,	%i4
	fmovdl	%xcc,	%f31,	%f18
	siam	0x3
	sub	%l0,	0x1AC1,	%i2
	srlx	%o5,	0x1D,	%o2
	edge32	%l2,	%g1,	%o6
	subcc	%l3,	%o3,	%o7
	smul	%o1,	0x0157,	%i3
	movle	%icc,	%g3,	%l4
	movcc	%icc,	%i6,	%l1
	sir	0x0A02
	and	%i0,	%g6,	%i5
	fmovdge	%xcc,	%f11,	%f19
	fsrc2s	%f19,	%f0
	xnorcc	%g4,	0x0941,	%g2
	movrlz	%l6,	0x313,	%i7
	fmovrdlez	%l5,	%f18,	%f6
	movl	%icc,	%g5,	%g7
	nop
	set	0x78, %o2
	stw	%i1,	[%l7 + %o2]
	srax	%o4,	0x0F,	%o0
	sra	%i4,	0x01,	%i2
	srl	%o5,	%l0,	%o2
	lduw	[%l7 + 0x68],	%g1
	array16	%l2,	%l3,	%o6
	xorcc	%o7,	%o1,	%o3
	sth	%i3,	[%l7 + 0x74]
	xnorcc	%l4,	0x13B5,	%i6
	ldsb	[%l7 + 0x7A],	%l1
	fmovrslez	%g3,	%f29,	%f28
	lduw	[%l7 + 0x7C],	%g6
	stw	%i5,	[%l7 + 0x1C]
	stw	%i0,	[%l7 + 0x2C]
	fnot1	%f4,	%f26
	edge32ln	%g2,	%l6,	%i7
	fmul8x16au	%f25,	%f28,	%f14
	xnorcc	%g4,	0x00FE,	%g5
	st	%f2,	[%l7 + 0x3C]
	siam	0x4
	fxnors	%f30,	%f3,	%f10
	smul	%g7,	0x010D,	%i1
	xnor	%l5,	0x07AB,	%o4
	nop
	set	0x53, %g2
	ldsb	[%l7 + %g2],	%i4
	fpmerge	%f19,	%f21,	%f12
	edge8l	%i2,	%o0,	%o5
	st	%f18,	[%l7 + 0x30]
	array16	%o2,	%l0,	%l2
	fcmped	%fcc2,	%f4,	%f18
	movne	%icc,	%l3,	%g1
	ldsw	[%l7 + 0x78],	%o7
	movle	%icc,	%o6,	%o1
	edge32l	%i3,	%o3,	%i6
	edge16ln	%l1,	%g3,	%l4
	movge	%icc,	%g6,	%i5
	edge8	%g2,	%l6,	%i7
	fcmps	%fcc2,	%f12,	%f4
	stx	%i0,	[%l7 + 0x18]
	andcc	%g5,	%g4,	%g7
	fxor	%f2,	%f26,	%f24
	movrgz	%i1,	%o4,	%l5
	xor	%i4,	%o0,	%o5
	movre	%o2,	0x1F6,	%i2
	edge32n	%l0,	%l2,	%l3
	movgu	%xcc,	%o7,	%o6
	edge32	%g1,	%o1,	%i3
	stx	%o3,	[%l7 + 0x28]
	alignaddrl	%l1,	%i6,	%l4
	mulscc	%g3,	%i5,	%g2
	movge	%xcc,	%g6,	%i7
	edge8	%l6,	%g5,	%i0
	move	%icc,	%g4,	%g7
	sra	%i1,	%o4,	%i4
	fmovsne	%xcc,	%f6,	%f5
	fmovdl	%icc,	%f26,	%f0
	movvs	%xcc,	%o0,	%o5
	mova	%icc,	%o2,	%l5
	edge32l	%i2,	%l2,	%l3
	ldd	[%l7 + 0x58],	%f24
	array16	%l0,	%o6,	%o7
	lduw	[%l7 + 0x24],	%o1
	stx	%i3,	[%l7 + 0x58]
	ldub	[%l7 + 0x21],	%g1
	edge8l	%l1,	%o3,	%i6
	alignaddr	%g3,	%l4,	%g2
	edge32n	%g6,	%i7,	%i5
	edge16l	%g5,	%l6,	%g4
	movcc	%xcc,	%g7,	%i1
	movrne	%i0,	%i4,	%o4
	fandnot1s	%f15,	%f16,	%f12
	edge8ln	%o5,	%o2,	%o0
	movrlz	%i2,	%l2,	%l5
	movvs	%xcc,	%l3,	%o6
	addcc	%o7,	%o1,	%i3
	xnorcc	%g1,	%l1,	%l0
	movrne	%i6,	%o3,	%l4
	sdiv	%g3,	0x0244,	%g2
	fmovdg	%icc,	%f12,	%f6
	restore %g6, %i7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x54],	%f3
	movre	%l6,	0x3DE,	%g4
	movl	%icc,	%g5,	%i1
	edge8n	%g7,	%i0,	%o4
	addc	%i4,	0x120A,	%o5
	movn	%xcc,	%o0,	%i2
	addcc	%l2,	0x07DF,	%l5
	ldsb	[%l7 + 0x4C],	%l3
	ldsw	[%l7 + 0x50],	%o6
	stx	%o7,	[%l7 + 0x68]
	fmovsa	%icc,	%f0,	%f17
	sir	0x1D7A
	fmovdleu	%icc,	%f1,	%f2
	edge16ln	%o2,	%o1,	%i3
	move	%icc,	%l1,	%l0
	subc	%g1,	%o3,	%l4
	fmovsg	%xcc,	%f24,	%f6
	srl	%g3,	0x0D,	%i6
	save %g6, 0x0CB0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcc	%xcc,	%f14,	%f23
	fmovsleu	%icc,	%f25,	%f5
	edge8l	%i5,	%l6,	%g2
	lduh	[%l7 + 0x64],	%g5
	movrlz	%g4,	0x15B,	%g7
	ldsh	[%l7 + 0x66],	%i1
	fornot1	%f26,	%f14,	%f20
	srax	%o4,	0x0E,	%i4
	movle	%icc,	%i0,	%o5
	movneg	%icc,	%i2,	%l2
	umul	%o0,	%l3,	%l5
	movrne	%o6,	0x200,	%o7
	st	%f17,	[%l7 + 0x60]
	andn	%o1,	0x15B4,	%i3
	sth	%o2,	[%l7 + 0x2E]
	fmovsleu	%xcc,	%f22,	%f11
	fmovrdlz	%l0,	%f2,	%f16
	fmovdn	%xcc,	%f25,	%f0
	edge32l	%l1,	%o3,	%l4
	movre	%g3,	%i6,	%g1
	mulscc	%g6,	%i7,	%l6
	edge32ln	%i5,	%g5,	%g4
	xnorcc	%g2,	%g7,	%o4
	movn	%xcc,	%i4,	%i1
	popc	%o5,	%i2
	addcc	%i0,	%l2,	%l3
	edge16ln	%o0,	%l5,	%o7
	stx	%o6,	[%l7 + 0x08]
	mova	%icc,	%o1,	%i3
	movvc	%xcc,	%o2,	%l0
	movgu	%xcc,	%o3,	%l4
	fmovdg	%xcc,	%f8,	%f29
	edge32ln	%g3,	%i6,	%l1
	nop
	set	0x30, %g5
	ldub	[%l7 + %g5],	%g6
	array16	%g1,	%i7,	%i5
	movrgez	%l6,	0x230,	%g5
	udiv	%g2,	0x0E5F,	%g4
	fmovscc	%xcc,	%f8,	%f24
	smul	%g7,	%i4,	%i1
	xnorcc	%o4,	%o5,	%i2
	edge32ln	%l2,	%l3,	%i0
	movle	%xcc,	%o0,	%o7
	srl	%l5,	%o1,	%o6
	addccc	%i3,	%o2,	%l0
	movvc	%xcc,	%o3,	%g3
	stb	%i6,	[%l7 + 0x6C]
	fmul8sux16	%f14,	%f6,	%f8
	xnorcc	%l1,	0x100C,	%g6
	fandnot1	%f0,	%f28,	%f24
	andcc	%l4,	%g1,	%i7
	array16	%l6,	%i5,	%g5
	fxnors	%f17,	%f0,	%f31
	movcc	%icc,	%g4,	%g7
	fpadd16s	%f9,	%f14,	%f30
	std	%f6,	[%l7 + 0x18]
	edge16	%i4,	%g2,	%o4
	xnorcc	%o5,	%i1,	%i2
	array8	%l2,	%l3,	%i0
	orn	%o0,	%l5,	%o7
	movrgez	%o1,	0x0A6,	%i3
	fornot2	%f4,	%f10,	%f4
	ldub	[%l7 + 0x47],	%o2
	fandnot2	%f6,	%f30,	%f28
	bshuffle	%f10,	%f18,	%f30
	array8	%o6,	%o3,	%l0
	fmovscc	%icc,	%f23,	%f1
	stb	%g3,	[%l7 + 0x4B]
	xorcc	%l1,	0x095D,	%g6
	movrgez	%l4,	%i6,	%g1
	fmovdvs	%xcc,	%f23,	%f10
	movrne	%l6,	%i5,	%i7
	fmovda	%icc,	%f14,	%f21
	movcc	%icc,	%g5,	%g7
	srax	%g4,	%g2,	%o4
	movcs	%xcc,	%o5,	%i4
	udivcc	%i2,	0x11DB,	%l2
	movrlez	%l3,	%i1,	%i0
	edge16	%l5,	%o0,	%o1
	edge16l	%o7,	%o2,	%o6
	fsrc2	%f6,	%f14
	fmovsg	%xcc,	%f19,	%f30
	subc	%o3,	0x135F,	%i3
	xorcc	%l0,	%l1,	%g3
	sra	%g6,	%l4,	%i6
	subc	%g1,	0x1CC5,	%i5
	andcc	%l6,	0x0764,	%g5
	fpsub32s	%f27,	%f28,	%f12
	fzeros	%f8
	orcc	%g7,	%g4,	%i7
	edge8ln	%g2,	%o4,	%i4
	fmovrslz	%i2,	%f27,	%f16
	fmovsle	%icc,	%f6,	%f12
	fpadd32	%f30,	%f10,	%f4
	edge32ln	%l2,	%o5,	%i1
	srlx	%l3,	0x02,	%i0
	subc	%o0,	0x0B09,	%l5
	movrlez	%o1,	0x053,	%o7
	edge32ln	%o2,	%o3,	%i3
	edge32l	%l0,	%o6,	%g3
	smul	%g6,	0x008B,	%l1
	fxors	%f14,	%f7,	%f31
	fsrc2	%f26,	%f10
	fcmpgt32	%f22,	%f18,	%i6
	edge8l	%g1,	%i5,	%l6
	xor	%g5,	%g7,	%l4
	fpadd32s	%f4,	%f13,	%f13
	std	%f30,	[%l7 + 0x70]
	bshuffle	%f4,	%f20,	%f0
	pdist	%f30,	%f12,	%f24
	addccc	%i7,	0x1812,	%g4
	subc	%o4,	%g2,	%i4
	add	%l2,	0x1663,	%i2
	move	%xcc,	%i1,	%o5
	edge32	%i0,	%l3,	%l5
	fpadd32s	%f23,	%f5,	%f26
	edge16ln	%o1,	%o7,	%o0
	edge32ln	%o2,	%i3,	%o3
	siam	0x5
	fmovdleu	%xcc,	%f14,	%f27
	fnands	%f2,	%f23,	%f19
	smulcc	%o6,	0x0947,	%l0
	sethi	0x15ED,	%g3
	array32	%g6,	%l1,	%g1
	lduw	[%l7 + 0x48],	%i5
	srl	%i6,	0x05,	%g5
	ldd	[%l7 + 0x68],	%i6
	fmovspos	%icc,	%f7,	%f14
	popc	%g7,	%l4
	fornot2s	%f4,	%f17,	%f22
	fmovdvc	%xcc,	%f27,	%f13
	xnor	%g4,	0x0A5D,	%i7
	mova	%xcc,	%g2,	%o4
	fmovdleu	%xcc,	%f3,	%f18
	sethi	0x1085,	%l2
	movgu	%xcc,	%i4,	%i1
	mova	%icc,	%o5,	%i0
	movge	%icc,	%i2,	%l3
	movneg	%xcc,	%l5,	%o7
	udivx	%o1,	0x1CCA,	%o2
	ldd	[%l7 + 0x48],	%f10
	sra	%i3,	%o3,	%o0
	movn	%xcc,	%o6,	%g3
	orncc	%g6,	0x0BFB,	%l0
	fnands	%f20,	%f23,	%f29
	movl	%icc,	%l1,	%g1
	stb	%i6,	[%l7 + 0x16]
	movg	%icc,	%g5,	%i5
	movcs	%icc,	%g7,	%l4
	fmovsgu	%xcc,	%f4,	%f7
	smulcc	%l6,	0x1795,	%i7
	edge16l	%g4,	%g2,	%l2
	ldx	[%l7 + 0x68],	%i4
	move	%icc,	%o4,	%o5
	fmovrdgez	%i0,	%f14,	%f18
	stw	%i1,	[%l7 + 0x10]
	fnor	%f0,	%f10,	%f18
	movpos	%xcc,	%i2,	%l3
	fmuld8sux16	%f1,	%f8,	%f24
	edge16	%o7,	%o1,	%o2
	smul	%l5,	0x1160,	%i3
	smulcc	%o0,	0x1F5C,	%o6
	movneg	%xcc,	%g3,	%g6
	array16	%l0,	%o3,	%l1
	subccc	%g1,	0x0C85,	%g5
	fpsub32	%f16,	%f24,	%f2
	fabss	%f2,	%f4
	ldd	[%l7 + 0x38],	%i6
	fcmple16	%f20,	%f8,	%g7
	fmovs	%f3,	%f4
	sra	%l4,	%l6,	%i5
	movleu	%icc,	%i7,	%g2
	edge16l	%l2,	%i4,	%g4
	for	%f30,	%f2,	%f24
	fsrc2	%f18,	%f4
	ldsh	[%l7 + 0x26],	%o4
	sll	%i0,	%i1,	%o5
	movre	%l3,	0x2F8,	%i2
	fmovse	%xcc,	%f27,	%f6
	mulscc	%o7,	%o1,	%l5
	alignaddr	%o2,	%i3,	%o0
	fmovs	%f3,	%f10
	andncc	%g3,	%o6,	%l0
	fornot1	%f4,	%f26,	%f24
	addccc	%o3,	0x03EE,	%g6
	fandnot2	%f24,	%f16,	%f20
	fmovsvc	%xcc,	%f5,	%f22
	srlx	%l1,	%g5,	%g1
	fmovsvc	%xcc,	%f20,	%f28
	movpos	%xcc,	%g7,	%i6
	array16	%l4,	%l6,	%i5
	smulcc	%i7,	%g2,	%l2
	array8	%g4,	%i4,	%o4
	mulscc	%i0,	%i1,	%l3
	popc	%i2,	%o5
	std	%f14,	[%l7 + 0x30]
	srax	%o1,	%o7,	%o2
	sir	0x1753
	sra	%i3,	0x12,	%l5
	fmovrsgez	%o0,	%f11,	%f4
	fnegd	%f20,	%f24
	smul	%o6,	%g3,	%l0
	fmovrsgez	%g6,	%f29,	%f23
	movre	%l1,	%o3,	%g1
	edge16ln	%g7,	%g5,	%i6
	smul	%l6,	0x0B98,	%l4
	movpos	%xcc,	%i7,	%g2
	fmovrde	%l2,	%f20,	%f6
	stx	%g4,	[%l7 + 0x70]
	movvc	%icc,	%i4,	%o4
	ldd	[%l7 + 0x28],	%f30
	orcc	%i0,	%i5,	%l3
	bshuffle	%f20,	%f0,	%f22
	fmul8x16au	%f3,	%f6,	%f16
	fmovrde	%i2,	%f0,	%f4
	stw	%o5,	[%l7 + 0x64]
	fmovrse	%o1,	%f8,	%f12
	alignaddrl	%i1,	%o2,	%o7
	fmovde	%xcc,	%f19,	%f31
	movpos	%icc,	%i3,	%o0
	movgu	%icc,	%o6,	%l5
	movvc	%icc,	%l0,	%g6
	movrlz	%g3,	%l1,	%o3
	lduh	[%l7 + 0x74],	%g1
	sdivcc	%g5,	0x1D46,	%i6
	sdivcc	%l6,	0x179E,	%l4
	for	%f18,	%f16,	%f24
	sub	%i7,	0x0F16,	%g2
	movvs	%icc,	%l2,	%g7
	movge	%xcc,	%i4,	%g4
	fnand	%f6,	%f6,	%f30
	and	%i0,	0x0671,	%i5
	lduw	[%l7 + 0x50],	%l3
	edge8l	%i2,	%o5,	%o1
	fmovdcc	%xcc,	%f15,	%f16
	sra	%o4,	%i1,	%o2
	edge32	%o7,	%i3,	%o6
	ldd	[%l7 + 0x38],	%l4
	udiv	%o0,	0x0129,	%g6
	lduw	[%l7 + 0x0C],	%g3
	fsrc2s	%f15,	%f0
	fpmerge	%f5,	%f5,	%f12
	sub	%l0,	%l1,	%g1
	movgu	%xcc,	%o3,	%g5
	movvc	%icc,	%l6,	%i6
	movrlz	%i7,	%l4,	%g2
	fmovrslz	%g7,	%f12,	%f15
	sub	%i4,	%l2,	%i0
	movgu	%xcc,	%g4,	%l3
	fornot1s	%f8,	%f19,	%f15
	sra	%i2,	0x1A,	%o5
	array16	%o1,	%i5,	%o4
	fmovrslz	%i1,	%f25,	%f28
	xnorcc	%o7,	0x0EBE,	%i3
	fcmpeq32	%f24,	%f24,	%o6
	fmovscc	%xcc,	%f15,	%f3
	subc	%o2,	0x1D3B,	%o0
	orn	%g6,	%g3,	%l5
	movne	%xcc,	%l0,	%l1
	alignaddrl	%g1,	%g5,	%o3
	edge16	%i6,	%i7,	%l6
	fmovsne	%icc,	%f30,	%f7
	fpmerge	%f29,	%f0,	%f2
	xor	%g2,	%g7,	%l4
	mulx	%i4,	%l2,	%g4
	orcc	%l3,	%i0,	%i2
	fsrc1	%f14,	%f14
	fand	%f6,	%f6,	%f24
	setx loop_12, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_12: 	movrne	%o4,	%o1,	%i1
	sethi	0x0CFB,	%i3
	fnegs	%f30,	%f28
	movrgz	%o6,	0x0D3,	%o7
	ldd	[%l7 + 0x20],	%o2
	stx	%o0,	[%l7 + 0x70]
	movn	%xcc,	%g3,	%l5
	fmuld8ulx16	%f26,	%f14,	%f4
	or	%g6,	0x0860,	%l1
	alignaddr	%g1,	%l0,	%g5
	std	%f18,	[%l7 + 0x38]
	fmovdpos	%xcc,	%f19,	%f1
	save %o3, 0x066B, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmps	%fcc3,	%f16,	%f25
	sethi	0x035C,	%l6
	edge32l	%i6,	%g2,	%l4
	sra	%i4,	0x14,	%g7
	alignaddrl	%g4,	%l3,	%l2
	srax	%i0,	%o5,	%i2
	sdiv	%i5,	0x0EDA,	%o4
	ld	[%l7 + 0x1C],	%f21
	ldd	[%l7 + 0x70],	%o0
	movne	%xcc,	%i3,	%o6
	fnegd	%f12,	%f22
	fmovd	%f16,	%f0
	fxor	%f28,	%f16,	%f20
	addccc	%i1,	0x0A4C,	%o7
	ldsh	[%l7 + 0x0E],	%o2
	edge16ln	%o0,	%g3,	%l5
	array8	%l1,	%g6,	%l0
	sdivcc	%g1,	0x1C3C,	%o3
	udivcc	%i7,	0x0CC6,	%g5
	smul	%i6,	0x08DF,	%g2
	srl	%l6,	0x16,	%l4
	sub	%i4,	0x1532,	%g7
	movge	%xcc,	%l3,	%l2
	movgu	%icc,	%g4,	%i0
	smulcc	%o5,	0x12C3,	%i5
	movrgez	%i2,	0x049,	%o4
	movleu	%xcc,	%o1,	%i3
	lduw	[%l7 + 0x44],	%i1
	movrgz	%o7,	0x338,	%o2
	sllx	%o6,	%g3,	%l5
	srax	%o0,	%g6,	%l0
	ldx	[%l7 + 0x38],	%l1
	edge32l	%g1,	%o3,	%g5
	udivx	%i7,	0x021A,	%i6
	edge32n	%g2,	%l4,	%l6
	fmovsne	%icc,	%f6,	%f8
	edge16ln	%g7,	%i4,	%l2
	ldd	[%l7 + 0x78],	%l2
	fcmpeq32	%f14,	%f20,	%g4
	subc	%o5,	%i5,	%i2
	movcs	%icc,	%i0,	%o1
	fcmps	%fcc0,	%f8,	%f19
	fmuld8ulx16	%f7,	%f19,	%f2
	alignaddr	%o4,	%i1,	%i3
	smulcc	%o2,	0x0907,	%o6
	fxnor	%f18,	%f20,	%f18
	stx	%g3,	[%l7 + 0x40]
	srlx	%l5,	0x11,	%o0
	andcc	%o7,	0x0C86,	%l0
	mulx	%g6,	0x1784,	%g1
	ld	[%l7 + 0x74],	%f28
	edge16ln	%l1,	%o3,	%i7
	move	%xcc,	%i6,	%g2
	movcc	%icc,	%g5,	%l4
	edge8n	%l6,	%g7,	%l2
	srl	%i4,	%g4,	%o5
	mulscc	%i5,	%i2,	%l3
	std	%f24,	[%l7 + 0x70]
	movvs	%xcc,	%o1,	%i0
	udivx	%o4,	0x1475,	%i1
	array8	%o2,	%o6,	%g3
	restore %i3, %o0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andncc	%l5,	%l0,	%g6
	orncc	%l1,	0x043C,	%g1
	sir	0x0881
	orncc	%i7,	0x066D,	%i6
	fmovdneg	%icc,	%f11,	%f15
	movcs	%xcc,	%o3,	%g5
	fmovspos	%icc,	%f2,	%f13
	mulx	%l4,	%l6,	%g2
	addcc	%l2,	%g7,	%i4
	fexpand	%f12,	%f22
	edge32	%o5,	%g4,	%i2
	edge32l	%i5,	%o1,	%i0
	movn	%icc,	%l3,	%i1
	mulscc	%o4,	0x0636,	%o2
	sdivx	%o6,	0x1D18,	%g3
	fcmple16	%f16,	%f22,	%o0
	fpadd16s	%f31,	%f0,	%f7
	movgu	%xcc,	%o7,	%l5
	edge8ln	%l0,	%i3,	%l1
	orncc	%g1,	%g6,	%i7
	fnot2s	%f3,	%f6
	setx loop_13, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_13: 	movre	%l6,	0x076,	%g2
	orcc	%l4,	0x01F7,	%g7
	array8	%i4,	%l2,	%o5
	edge16	%i2,	%i5,	%o1
	xor	%i0,	%g4,	%l3
	movle	%xcc,	%o4,	%i1
	movrgez	%o6,	%g3,	%o2
	fornot1s	%f24,	%f19,	%f15
	edge32ln	%o7,	%o0,	%l5
	stw	%l0,	[%l7 + 0x08]
	ldsb	[%l7 + 0x56],	%i3
	add	%l1,	%g1,	%g6
	udiv	%i7,	0x1C16,	%o3
	movne	%icc,	%g5,	%i6
	movcs	%xcc,	%l6,	%g2
	subcc	%g7,	%l4,	%l2
	subc	%o5,	0x09F8,	%i4
	edge32ln	%i2,	%o1,	%i5
	movrgz	%g4,	%i0,	%l3
	movneg	%icc,	%o4,	%i1
	srl	%o6,	0x05,	%g3
	mulx	%o7,	%o2,	%l5
	edge16n	%l0,	%o0,	%i3
	andcc	%l1,	0x17BC,	%g1
	udiv	%g6,	0x09E2,	%o3
	array8	%g5,	%i6,	%i7
	sllx	%g2,	0x11,	%l6
	siam	0x6
	move	%xcc,	%l4,	%l2
	srax	%g7,	%i4,	%o5
	movleu	%icc,	%i2,	%o1
	srlx	%g4,	0x0B,	%i5
	movcs	%xcc,	%i0,	%o4
	movgu	%xcc,	%l3,	%i1
	subccc	%o6,	0x1DCF,	%o7
	ldsh	[%l7 + 0x42],	%o2
	fpadd16s	%f24,	%f31,	%f14
	andn	%g3,	0x1784,	%l5
	udiv	%o0,	0x15C2,	%l0
	movl	%icc,	%i3,	%g1
	fmovrsgz	%l1,	%f9,	%f11
	ldx	[%l7 + 0x08],	%o3
	srlx	%g5,	0x12,	%g6
	sethi	0x0A21,	%i6
	movleu	%xcc,	%g2,	%l6
	fcmpeq16	%f0,	%f6,	%l4
	fmuld8sux16	%f21,	%f4,	%f24
	lduh	[%l7 + 0x70],	%i7
	sdivx	%l2,	0x171E,	%g7
	movg	%icc,	%i4,	%o5
	fcmpne32	%f12,	%f14,	%o1
	save %g4, 0x098B, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmul8x16	%f17,	%f16,	%f12
	smul	%i0,	0x021B,	%o4
	add	%l3,	%i1,	%i2
	edge16l	%o7,	%o6,	%o2
	fmovscs	%xcc,	%f3,	%f7
	movgu	%xcc,	%g3,	%l5
	bshuffle	%f10,	%f14,	%f30
	subcc	%l0,	0x0817,	%o0
	ldd	[%l7 + 0x60],	%i2
	ldsh	[%l7 + 0x14],	%l1
	ldsw	[%l7 + 0x44],	%o3
	movrlez	%g5,	%g6,	%i6
	subc	%g2,	%g1,	%l4
	orncc	%l6,	0x1A5A,	%i7
	edge32n	%g7,	%l2,	%i4
	xor	%o1,	%g4,	%i5
	array8	%i0,	%o4,	%o5
	srlx	%i1,	%l3,	%o7
	edge16ln	%o6,	%o2,	%i2
	movgu	%icc,	%l5,	%l0
	alignaddr	%g3,	%o0,	%i3
	addccc	%l1,	0x1C71,	%g5
	edge8ln	%g6,	%o3,	%i6
	array16	%g2,	%g1,	%l4
	srl	%l6,	%i7,	%g7
	edge8n	%i4,	%l2,	%g4
	fmovrdne	%i5,	%f20,	%f26
	stw	%o1,	[%l7 + 0x7C]
	fpack16	%f20,	%f3
	andn	%o4,	0x05ED,	%o5
	stx	%i1,	[%l7 + 0x40]
	array16	%i0,	%l3,	%o6
	movcs	%xcc,	%o2,	%o7
	movleu	%icc,	%i2,	%l0
	ldd	[%l7 + 0x60],	%l4
	stx	%g3,	[%l7 + 0x60]
	lduw	[%l7 + 0x38],	%i3
	fmuld8ulx16	%f10,	%f11,	%f12
	fornot2	%f20,	%f24,	%f2
	srax	%l1,	0x1E,	%o0
	umul	%g5,	0x129E,	%g6
	xnorcc	%i6,	0x1FFA,	%g2
	and	%o3,	%l4,	%l6
	fcmpd	%fcc2,	%f22,	%f16
	fmovde	%icc,	%f8,	%f27
	smul	%g1,	0x0D69,	%g7
	std	%f22,	[%l7 + 0x40]
	movrgz	%i4,	0x2B6,	%i7
	edge8l	%l2,	%g4,	%i5
	fand	%f30,	%f10,	%f28
	sdivx	%o4,	0x18DF,	%o1
	umul	%o5,	%i0,	%i1
	fnors	%f9,	%f23,	%f15
	movn	%icc,	%o6,	%l3
	andncc	%o7,	%o2,	%i2
	movle	%xcc,	%l5,	%g3
	fmovsle	%xcc,	%f21,	%f29
	sethi	0x0633,	%i3
	save %l0, 0x11C1, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fors	%f19,	%f7,	%f13
	udivx	%o0,	0x19F4,	%g5
	alignaddr	%g6,	%i6,	%g2
	stb	%o3,	[%l7 + 0x3B]
	movvs	%icc,	%l4,	%l6
	addccc	%g7,	%i4,	%g1
	ldsh	[%l7 + 0x28],	%l2
	sra	%g4,	%i5,	%o4
	ldx	[%l7 + 0x78],	%i7
	orn	%o1,	0x0B8B,	%i0
	fmovsn	%icc,	%f26,	%f15
	udiv	%i1,	0x0C58,	%o6
	edge8	%o5,	%o7,	%o2
	siam	0x6
	for	%f24,	%f12,	%f26
	lduh	[%l7 + 0x78],	%i2
	or	%l5,	0x1143,	%g3
	sethi	0x1723,	%l3
	edge32	%i3,	%l1,	%l0
	movneg	%icc,	%g5,	%o0
	fmovdg	%xcc,	%f30,	%f17
	std	%f2,	[%l7 + 0x10]
	edge32l	%g6,	%g2,	%i6
	movrne	%o3,	%l6,	%l4
	movrlez	%g7,	%i4,	%g1
	sub	%l2,	0x01A0,	%g4
	mulx	%o4,	%i7,	%i5
	fabsd	%f26,	%f10
	fcmps	%fcc0,	%f16,	%f13
	movl	%icc,	%o1,	%i0
	siam	0x4
	edge8	%i1,	%o5,	%o7
	fmovdgu	%xcc,	%f28,	%f16
	fnor	%f4,	%f8,	%f12
	edge32l	%o2,	%i2,	%l5
	fxor	%f12,	%f28,	%f30
	subcc	%o6,	0x0657,	%g3
	array8	%l3,	%l1,	%l0
	udivcc	%g5,	0x1D44,	%o0
	subc	%i3,	%g2,	%i6
	mulscc	%g6,	%o3,	%l4
	subcc	%g7,	%i4,	%g1
	fmovdge	%icc,	%f17,	%f28
	sll	%l6,	%g4,	%l2
	subc	%i7,	%o4,	%i5
	nop
	set	0x0F, %o3
	ldsb	[%l7 + %o3],	%o1
	pdist	%f20,	%f16,	%f6
	movrne	%i1,	%o5,	%o7
	subcc	%o2,	0x1DE6,	%i2
	fmovrse	%l5,	%f15,	%f30
	alignaddr	%i0,	%g3,	%o6
	ldsh	[%l7 + 0x3E],	%l1
	fmovrde	%l0,	%f22,	%f12
	srl	%l3,	%g5,	%o0
	movn	%xcc,	%g2,	%i3
	fornot2s	%f8,	%f18,	%f4
	restore %g6, 0x113C, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%l4,	%i6,	%g7
	sethi	0x029E,	%g1
	ldd	[%l7 + 0x58],	%i6
	ldub	[%l7 + 0x67],	%g4
	edge16n	%i4,	%i7,	%o4
	edge16l	%i5,	%o1,	%l2
	andcc	%i1,	%o5,	%o7
	fpsub16	%f24,	%f22,	%f2
	umul	%o2,	%i2,	%l5
	sethi	0x1C10,	%g3
	array8	%i0,	%o6,	%l0
	udivx	%l1,	0x1DDF,	%l3
	movrgz	%o0,	%g5,	%i3
	fxnor	%f12,	%f20,	%f0
	fmovdle	%xcc,	%f7,	%f29
	movrgz	%g2,	%g6,	%l4
	fxors	%f0,	%f6,	%f5
	setx loop_14, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_14: 	alignaddrl	%l6,	%o3,	%g4
	fornot2s	%f4,	%f6,	%f10
	movre	%i7,	%o4,	%i5
	alignaddrl	%i4,	%l2,	%o1
	subcc	%o5,	%i1,	%o2
	add	%o7,	0x116B,	%l5
	movrlez	%i2,	%g3,	%o6
	udivx	%l0,	0x035B,	%l1
	ldd	[%l7 + 0x38],	%l2
	sir	0x1FF5
	ldub	[%l7 + 0x66],	%o0
	movne	%xcc,	%i0,	%g5
	fpadd32	%f0,	%f2,	%f6
	ldsb	[%l7 + 0x17],	%i3
	movn	%xcc,	%g2,	%g6
	stx	%i6,	[%l7 + 0x68]
	ld	[%l7 + 0x5C],	%f27
	ldsw	[%l7 + 0x6C],	%l4
	movcc	%icc,	%g1,	%l6
	lduh	[%l7 + 0x7C],	%o3
	fmovsge	%xcc,	%f1,	%f19
	umul	%g4,	0x1B32,	%g7
	edge8	%i7,	%o4,	%i4
	movpos	%icc,	%i5,	%l2
	fnegd	%f0,	%f20
	edge16l	%o5,	%o1,	%i1
	movle	%icc,	%o7,	%o2
	movneg	%xcc,	%l5,	%g3
	stb	%i2,	[%l7 + 0x67]
	fexpand	%f18,	%f4
	ld	[%l7 + 0x1C],	%f16
	array8	%l0,	%o6,	%l3
	nop
	set	0x34, %o6
	stb	%o0,	[%l7 + %o6]
	edge8l	%l1,	%g5,	%i0
	smul	%i3,	%g6,	%i6
	subcc	%g2,	%l4,	%l6
	movrgez	%o3,	%g4,	%g7
	movleu	%icc,	%i7,	%g1
	sdivx	%i4,	0x005D,	%i5
	movne	%xcc,	%l2,	%o4
	fmovda	%icc,	%f22,	%f31
	or	%o5,	0x1BCD,	%i1
	edge8n	%o7,	%o2,	%o1
	udivx	%g3,	0x1B2C,	%i2
	movcs	%icc,	%l0,	%l5
	fnor	%f18,	%f0,	%f14
	movne	%xcc,	%l3,	%o6
	fpsub32s	%f10,	%f14,	%f10
	orcc	%o0,	%g5,	%i0
	fpmerge	%f1,	%f22,	%f0
	lduh	[%l7 + 0x64],	%l1
	mulscc	%g6,	%i6,	%g2
	movre	%l4,	%i3,	%l6
	subcc	%o3,	0x0881,	%g4
	stw	%i7,	[%l7 + 0x70]
	movn	%icc,	%g7,	%g1
	movneg	%icc,	%i4,	%l2
	movrlez	%i5,	%o5,	%o4
	movne	%xcc,	%o7,	%i1
	or	%o2,	%g3,	%i2
	fnot1	%f12,	%f16
	ldx	[%l7 + 0x60],	%l0
	movle	%icc,	%o1,	%l3
	alignaddrl	%o6,	%l5,	%o0
	fmovdgu	%icc,	%f11,	%f11
	movgu	%xcc,	%i0,	%g5
	fmovsneg	%icc,	%f5,	%f13
	sdiv	%l1,	0x14CC,	%i6
	xor	%g6,	%g2,	%i3
	fmul8sux16	%f6,	%f0,	%f2
	alignaddrl	%l4,	%l6,	%g4
	srlx	%o3,	%g7,	%i7
	fnand	%f4,	%f10,	%f2
	stb	%i4,	[%l7 + 0x5B]
	edge32ln	%l2,	%g1,	%o5
	sir	0x1782
	nop
	set	0x30, %i6
	ldd	[%l7 + %i6],	%i4
	sll	%o7,	0x08,	%i1
	udivx	%o2,	0x1EC6,	%g3
	sethi	0x020B,	%i2
	xnor	%l0,	%o4,	%o1
	ldd	[%l7 + 0x78],	%f12
	movrlz	%l3,	%o6,	%l5
	umul	%i0,	0x0C40,	%o0
	edge8	%g5,	%i6,	%g6
	sdivcc	%l1,	0x0B4F,	%g2
	smul	%l4,	0x066A,	%i3
	fzero	%f20
	edge16ln	%l6,	%g4,	%g7
	edge8ln	%i7,	%o3,	%l2
	orn	%i4,	%g1,	%i5
	edge32ln	%o7,	%o5,	%i1
	sra	%g3,	%o2,	%l0
	or	%i2,	%o1,	%l3
	lduw	[%l7 + 0x38],	%o4
	fpmerge	%f15,	%f7,	%f12
	fcmps	%fcc3,	%f17,	%f7
	ldub	[%l7 + 0x7E],	%l5
	sra	%o6,	0x0E,	%i0
	sra	%o0,	0x00,	%g5
	smul	%g6,	0x1584,	%i6
	std	%f8,	[%l7 + 0x38]
	movg	%icc,	%l1,	%g2
	stw	%i3,	[%l7 + 0x78]
	fmovsvc	%xcc,	%f30,	%f24
	edge32l	%l4,	%g4,	%g7
	sub	%l6,	%i7,	%o3
	save %i4, %g1, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%o7,	%o5
	xorcc	%l2,	%g3,	%o2
	edge16n	%l0,	%i1,	%i2
	stw	%l3,	[%l7 + 0x5C]
	edge32	%o1,	%l5,	%o4
	ldx	[%l7 + 0x40],	%i0
	fornot1s	%f26,	%f27,	%f2
	array16	%o6,	%g5,	%g6
	fpsub16	%f12,	%f10,	%f0
	movgu	%icc,	%i6,	%o0
	movrlez	%g2,	0x3E6,	%i3
	xnorcc	%l1,	%l4,	%g7
	andn	%l6,	0x1A14,	%i7
	fors	%f9,	%f23,	%f8
	fmovsneg	%icc,	%f6,	%f2
	array16	%o3,	%i4,	%g1
	movre	%i5,	%o7,	%o5
	movrlz	%g4,	%g3,	%o2
	st	%f31,	[%l7 + 0x4C]
	edge16n	%l2,	%l0,	%i2
	edge16ln	%i1,	%o1,	%l3
	fcmped	%fcc0,	%f22,	%f28
	fnot1	%f28,	%f4
	edge32	%o4,	%i0,	%o6
	edge8n	%l5,	%g6,	%i6
	pdist	%f16,	%f18,	%f14
	andn	%g5,	%g2,	%i3
	mulscc	%l1,	0x1D61,	%o0
	xnor	%l4,	0x1223,	%g7
	addc	%l6,	0x1E21,	%i7
	pdist	%f2,	%f30,	%f24
	lduw	[%l7 + 0x70],	%i4
	fmovsle	%xcc,	%f30,	%f24
	orncc	%o3,	0x15BC,	%i5
	fpadd32	%f20,	%f10,	%f14
	movrlz	%o7,	%o5,	%g4
	sth	%g1,	[%l7 + 0x08]
	movcs	%xcc,	%g3,	%o2
	mulx	%l0,	0x1C7C,	%l2
	udivx	%i2,	0x1030,	%o1
	orn	%l3,	0x1B2A,	%o4
	fcmped	%fcc3,	%f0,	%f20
	sra	%i1,	0x14,	%o6
	mulscc	%l5,	%i0,	%g6
	subccc	%i6,	%g5,	%g2
	subcc	%l1,	%o0,	%i3
	ldd	[%l7 + 0x58],	%f4
	edge32	%l4,	%g7,	%i7
	edge8ln	%l6,	%o3,	%i4
	fnors	%f22,	%f8,	%f4
	movge	%xcc,	%i5,	%o5
	edge16n	%o7,	%g1,	%g3
	movrlz	%g4,	0x106,	%o2
	array16	%l2,	%i2,	%l0
	movvs	%xcc,	%l3,	%o4
	mulx	%o1,	%i1,	%l5
	fxors	%f10,	%f1,	%f27
	stx	%i0,	[%l7 + 0x18]
	xnor	%g6,	%i6,	%g5
	st	%f5,	[%l7 + 0x1C]
	smulcc	%g2,	%l1,	%o0
	edge16n	%o6,	%i3,	%l4
	save %g7, 0x0DB5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsh	[%l7 + 0x78],	%o3
	movleu	%xcc,	%i4,	%i5
	fand	%f10,	%f0,	%f30
	umul	%o5,	%i7,	%o7
	array32	%g1,	%g3,	%g4
	movvc	%icc,	%o2,	%i2
	andncc	%l0,	%l3,	%l2
	fmovdneg	%icc,	%f14,	%f10
	nop
	set	0x38, %o1
	stx	%o1,	[%l7 + %o1]
	array16	%o4,	%l5,	%i0
	udivx	%i1,	0x1C34,	%g6
	fmovdvs	%icc,	%f26,	%f3
	udivx	%i6,	0x1E16,	%g5
	edge32ln	%l1,	%g2,	%o6
	movle	%xcc,	%o0,	%l4
	array32	%i3,	%g7,	%l6
	andn	%o3,	0x0CB4,	%i4
	add	%o5,	%i5,	%o7
	addccc	%g1,	%i7,	%g4
	array8	%g3,	%i2,	%l0
	fzero	%f14
	add	%l3,	0x0B00,	%o2
	ldsb	[%l7 + 0x4A],	%l2
	xor	%o1,	%o4,	%i0
	stb	%l5,	[%l7 + 0x7A]
	edge32n	%g6,	%i1,	%i6
	movne	%xcc,	%g5,	%l1
	movg	%icc,	%g2,	%o0
	movg	%xcc,	%l4,	%o6
	ldsw	[%l7 + 0x38],	%g7
	xorcc	%i3,	0x0CCD,	%o3
	movleu	%icc,	%i4,	%l6
	movvs	%icc,	%o5,	%i5
	movpos	%xcc,	%g1,	%o7
	lduh	[%l7 + 0x2A],	%i7
	movrne	%g4,	%g3,	%l0
	fcmple32	%f20,	%f28,	%l3
	and	%i2,	0x17E2,	%l2
	movgu	%xcc,	%o2,	%o1
	ldx	[%l7 + 0x48],	%i0
	fandnot2s	%f30,	%f31,	%f16
	xnor	%o4,	0x0324,	%g6
	andcc	%i1,	0x1000,	%i6
	movg	%icc,	%l5,	%g5
	fmul8ulx16	%f26,	%f24,	%f20
	fmul8x16au	%f11,	%f19,	%f24
	ldd	[%l7 + 0x20],	%l0
	move	%icc,	%o0,	%g2
	stb	%o6,	[%l7 + 0x4B]
	sllx	%g7,	0x00,	%i3
	fpackfix	%f2,	%f31
	movcc	%icc,	%o3,	%i4
	fmovrsgez	%l6,	%f9,	%f9
	fmovdge	%xcc,	%f30,	%f4
	ldsw	[%l7 + 0x68],	%l4
	fmovscs	%xcc,	%f31,	%f21
	st	%f31,	[%l7 + 0x4C]
	edge8l	%o5,	%i5,	%g1
	srl	%i7,	0x19,	%g4
	movcc	%xcc,	%g3,	%l0
	fpsub16	%f8,	%f26,	%f20
	edge16ln	%o7,	%i2,	%l2
	ldub	[%l7 + 0x44],	%l3
	fmovrse	%o1,	%f12,	%f11
	fmovdn	%xcc,	%f30,	%f8
	ldub	[%l7 + 0x0B],	%o2
	edge32n	%o4,	%i0,	%g6
	lduw	[%l7 + 0x70],	%i6
	andn	%i1,	%l5,	%g5
	movne	%xcc,	%o0,	%l1
	st	%f23,	[%l7 + 0x60]
	andncc	%o6,	%g2,	%i3
	fsrc2	%f30,	%f28
	ld	[%l7 + 0x48],	%f0
	st	%f6,	[%l7 + 0x78]
	movvc	%xcc,	%o3,	%g7
	ldsh	[%l7 + 0x68],	%l6
	movne	%icc,	%i4,	%l4
	umul	%o5,	%i5,	%g1
	sth	%i7,	[%l7 + 0x72]
	ldsh	[%l7 + 0x1A],	%g3
	ldd	[%l7 + 0x18],	%f28
	fmuld8sux16	%f13,	%f16,	%f0
	sdivcc	%g4,	0x1DDB,	%o7
	ldd	[%l7 + 0x20],	%i2
	xorcc	%l2,	%l0,	%o1
	fones	%f22
	fmul8x16	%f4,	%f20,	%f24
	sra	%l3,	0x1B,	%o2
	alignaddrl	%i0,	%o4,	%g6
	fandnot2	%f22,	%f12,	%f14
	ldsw	[%l7 + 0x64],	%i1
	fmovrslz	%i6,	%f22,	%f23
	popc	%g5,	%l5
	ld	[%l7 + 0x4C],	%f24
	xorcc	%l1,	%o6,	%g2
	fmovdleu	%icc,	%f1,	%f26
	fornot1s	%f28,	%f2,	%f16
	fand	%f24,	%f0,	%f30
	fxnors	%f30,	%f12,	%f14
	ld	[%l7 + 0x20],	%f2
	sth	%i3,	[%l7 + 0x1A]
	edge8n	%o3,	%g7,	%o0
	fmovdvs	%icc,	%f1,	%f8
	edge32ln	%l6,	%l4,	%o5
	edge16ln	%i4,	%i5,	%i7
	movleu	%icc,	%g1,	%g3
	and	%g4,	%i2,	%l2
	fmovsgu	%icc,	%f3,	%f5
	movle	%xcc,	%l0,	%o1
	or	%o7,	0x1DF9,	%l3
	st	%f17,	[%l7 + 0x1C]
	fcmpne32	%f4,	%f8,	%i0
	pdist	%f10,	%f16,	%f6
	addccc	%o4,	0x0805,	%g6
	edge8l	%i1,	%o2,	%i6
	ldsh	[%l7 + 0x08],	%g5
	smulcc	%l1,	0x01A7,	%o6
	fornot2	%f20,	%f8,	%f28
	stx	%l5,	[%l7 + 0x68]
	fmovdn	%xcc,	%f25,	%f31
	sth	%i3,	[%l7 + 0x6C]
	fmovsvc	%xcc,	%f7,	%f5
	mulscc	%o3,	0x136C,	%g2
	orcc	%o0,	0x014E,	%g7
	fnot1	%f24,	%f0
	addc	%l4,	%l6,	%o5
	movn	%xcc,	%i4,	%i5
	add	%g1,	%i7,	%g3
	umul	%g4,	%l2,	%i2
	fcmpeq16	%f4,	%f8,	%o1
	movcs	%icc,	%l0,	%l3
	movre	%i0,	%o7,	%o4
	edge16n	%g6,	%o2,	%i6
	movrlz	%i1,	%g5,	%o6
	nop
	set	0x14, %l0
	ldsw	[%l7 + %l0],	%l1
	movgu	%xcc,	%i3,	%o3
	subc	%l5,	0x01E6,	%o0
	xnorcc	%g7,	%l4,	%l6
	movvc	%icc,	%g2,	%o5
	andn	%i4,	%i5,	%i7
	lduw	[%l7 + 0x18],	%g3
	alignaddr	%g4,	%g1,	%i2
	stb	%o1,	[%l7 + 0x7F]
	sdiv	%l0,	0x0AC7,	%l3
	orncc	%l2,	0x0911,	%i0
	ldx	[%l7 + 0x70],	%o4
	movg	%icc,	%o7,	%o2
	stw	%i6,	[%l7 + 0x10]
	andcc	%i1,	%g6,	%o6
	smul	%g5,	0x1ED2,	%l1
	sra	%i3,	0x0A,	%o3
	fmovrdgez	%l5,	%f10,	%f28
	edge32l	%o0,	%l4,	%g7
	alignaddr	%g2,	%o5,	%l6
	fcmple32	%f22,	%f18,	%i5
	udivcc	%i4,	0x1C96,	%i7
	fmul8x16au	%f18,	%f23,	%f4
	fmovdgu	%xcc,	%f24,	%f25
	ldd	[%l7 + 0x60],	%g4
	add	%g1,	0x159A,	%g3
	add	%o1,	%i2,	%l0
	ldub	[%l7 + 0x51],	%l3
	movne	%icc,	%l2,	%o4
	movrlz	%i0,	%o2,	%o7
	movrne	%i6,	%g6,	%i1
	movle	%icc,	%o6,	%l1
	stx	%i3,	[%l7 + 0x68]
	movgu	%icc,	%g5,	%l5
	udivcc	%o0,	0x167E,	%o3
	sdiv	%l4,	0x0825,	%g2
	ldsb	[%l7 + 0x12],	%o5
	or	%l6,	0x031B,	%i5
	and	%g7,	0x1F51,	%i7
	edge16l	%i4,	%g1,	%g4
	movne	%xcc,	%g3,	%i2
	movneg	%icc,	%l0,	%l3
	popc	%o1,	%o4
	umulcc	%l2,	%i0,	%o2
	movn	%xcc,	%o7,	%g6
	std	%f26,	[%l7 + 0x58]
	movge	%xcc,	%i6,	%o6
	mulscc	%i1,	0x089B,	%i3
	subccc	%g5,	0x05AB,	%l1
	fpadd16	%f24,	%f26,	%f2
	and	%o0,	0x1F75,	%o3
	and	%l4,	0x1EC0,	%l5
	ldsb	[%l7 + 0x17],	%o5
	udivcc	%l6,	0x1F49,	%g2
	sllx	%g7,	0x0B,	%i7
	movrne	%i5,	%i4,	%g1
	fnot2s	%f12,	%f27
	movn	%icc,	%g4,	%i2
	fones	%f25
	sdivcc	%g3,	0x1DB2,	%l0
	movne	%xcc,	%o1,	%l3
	sth	%l2,	[%l7 + 0x4A]
	fand	%f0,	%f14,	%f6
	ldsb	[%l7 + 0x4E],	%o4
	edge8l	%i0,	%o2,	%g6
	fmul8ulx16	%f26,	%f12,	%f22
	or	%o7,	%o6,	%i1
	ld	[%l7 + 0x38],	%f13
	fand	%f0,	%f6,	%f26
	movrlz	%i6,	%i3,	%g5
	fmovrdne	%o0,	%f22,	%f22
	mulx	%l1,	%l4,	%o3
	faligndata	%f10,	%f10,	%f18
	srax	%l5,	0x04,	%l6
	fnor	%f28,	%f24,	%f12
	edge16ln	%o5,	%g2,	%g7
	movcs	%xcc,	%i5,	%i7
	xor	%i4,	0x1FC3,	%g4
	sub	%g1,	0x10A7,	%g3
	sdivcc	%i2,	0x1D9B,	%o1
	mulx	%l3,	0x0C85,	%l2
	edge32	%o4,	%l0,	%i0
	sll	%o2,	%o7,	%g6
	movvc	%xcc,	%o6,	%i1
	edge16l	%i3,	%i6,	%o0
	movrlz	%l1,	0x366,	%g5
	movneg	%xcc,	%l4,	%o3
	sdivcc	%l5,	0x0F9D,	%o5
	fcmple16	%f0,	%f10,	%l6
	array8	%g7,	%g2,	%i5
	fcmpeq16	%f2,	%f2,	%i7
	movvc	%icc,	%g4,	%g1
	fmovdcc	%icc,	%f2,	%f8
	stw	%g3,	[%l7 + 0x20]
	fcmple32	%f14,	%f28,	%i2
	sdivx	%o1,	0x08B3,	%i4
	fmul8x16al	%f30,	%f5,	%f26
	ldsb	[%l7 + 0x4D],	%l2
	movge	%xcc,	%o4,	%l0
	fcmpne32	%f8,	%f4,	%l3
	fcmple32	%f28,	%f28,	%o2
	andcc	%o7,	0x1D55,	%i0
	edge32ln	%g6,	%o6,	%i1
	restore %i6, 0x1C07, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%l1,	0x0132,	%g5
	subc	%l4,	0x0486,	%o3
	fmovdge	%icc,	%f21,	%f17
	sll	%l5,	%o5,	%l6
	lduw	[%l7 + 0x48],	%g7
	fxnors	%f8,	%f12,	%f14
	fexpand	%f28,	%f28
	fandnot2s	%f6,	%f18,	%f4
	fmovdvs	%xcc,	%f11,	%f5
	fcmpd	%fcc3,	%f26,	%f18
	fmovrslez	%o0,	%f9,	%f24
	ldd	[%l7 + 0x10],	%f26
	mova	%icc,	%g2,	%i7
	fands	%f10,	%f13,	%f13
	movl	%xcc,	%g4,	%g1
	fpsub16s	%f22,	%f17,	%f18
	sra	%i5,	0x07,	%g3
	sethi	0x119A,	%o1
	fornot2s	%f6,	%f30,	%f20
	addcc	%i4,	0x1620,	%l2
	umul	%o4,	0x1C8E,	%i2
	movrlz	%l3,	0x32E,	%l0
	sra	%o2,	0x16,	%i0
	array16	%o7,	%g6,	%o6
	array16	%i6,	%i1,	%l1
	sdivx	%g5,	0x0111,	%l4
	movgu	%icc,	%i3,	%l5
	movl	%icc,	%o3,	%l6
	movne	%xcc,	%o5,	%o0
	sdivx	%g7,	0x02A4,	%i7
	sllx	%g2,	%g4,	%i5
	sth	%g3,	[%l7 + 0x22]
	lduw	[%l7 + 0x54],	%o1
	fxnor	%f2,	%f14,	%f30
	movrlez	%g1,	%l2,	%i4
	orn	%i2,	%l3,	%o4
	addccc	%o2,	%i0,	%o7
	xnorcc	%g6,	0x1339,	%o6
	edge8l	%l0,	%i6,	%l1
	edge8n	%g5,	%l4,	%i1
	ldd	[%l7 + 0x70],	%i2
	ldd	[%l7 + 0x38],	%o2
	fmuld8sux16	%f8,	%f28,	%f30
	fands	%f23,	%f13,	%f16
	ldsh	[%l7 + 0x34],	%l5
	edge32l	%o5,	%o0,	%l6
	faligndata	%f8,	%f28,	%f24
	movcc	%xcc,	%i7,	%g2
	movn	%xcc,	%g4,	%i5
	udivcc	%g7,	0x0B78,	%g3
	sll	%o1,	0x04,	%g1
	movre	%i4,	0x2A9,	%l2
	fmovrslz	%l3,	%f0,	%f2
	orcc	%i2,	0x127B,	%o2
	srlx	%o4,	%o7,	%g6
	ldsw	[%l7 + 0x58],	%i0
	udivx	%l0,	0x073D,	%o6
	fnot1s	%f1,	%f22
	std	%f2,	[%l7 + 0x18]
	movg	%xcc,	%l1,	%g5
	movgu	%icc,	%i6,	%l4
	edge32l	%i3,	%i1,	%l5
	fandnot2	%f20,	%f18,	%f28
	array32	%o3,	%o5,	%o0
	movge	%xcc,	%i7,	%l6
	array32	%g4,	%i5,	%g2
	alignaddr	%g3,	%g7,	%o1
	nop
	set	0x78, %l3
	std	%f24,	[%l7 + %l3]
	fcmpne32	%f8,	%f0,	%i4
	move	%icc,	%l2,	%l3
	fabsd	%f14,	%f10
	array32	%i2,	%o2,	%o4
	edge32ln	%g1,	%o7,	%i0
	lduw	[%l7 + 0x74],	%g6
	ldx	[%l7 + 0x50],	%l0
	movneg	%xcc,	%o6,	%g5
	movge	%xcc,	%i6,	%l1
	movrlez	%i3,	0x3DB,	%l4
	srl	%i1,	%l5,	%o3
	setx loop_15, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_15: 	movrne	%g4,	0x16C,	%i7
	sth	%i5,	[%l7 + 0x52]
	movre	%g3,	0x3C7,	%g2
	fmovdg	%xcc,	%f20,	%f4
	st	%f23,	[%l7 + 0x6C]
	ldub	[%l7 + 0x5D],	%o1
	smulcc	%i4,	0x0A02,	%l2
	edge32l	%g7,	%i2,	%l3
	xorcc	%o4,	0x10C4,	%g1
	movrne	%o7,	%i0,	%g6
	movvc	%xcc,	%o2,	%o6
	edge16n	%g5,	%i6,	%l0
	fmovdne	%xcc,	%f18,	%f8
	edge8	%i3,	%l4,	%i1
	fmovdcc	%icc,	%f19,	%f27
	restore %l5, %l1, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o3,	%l6,	%g4
	fmul8x16al	%f5,	%f21,	%f2
	movleu	%icc,	%i7,	%i5
	sll	%g3,	%g2,	%o1
	stw	%i4,	[%l7 + 0x18]
	srl	%l2,	0x19,	%g7
	edge32	%o5,	%l3,	%i2
	srax	%g1,	0x17,	%o4
	movrne	%o7,	0x35D,	%i0
	st	%f25,	[%l7 + 0x44]
	fexpand	%f8,	%f22
	subcc	%o2,	%g6,	%g5
	movneg	%icc,	%i6,	%l0
	movvc	%icc,	%o6,	%i3
	alignaddr	%l4,	%l5,	%i1
	array16	%l1,	%o0,	%l6
	smul	%o3,	0x0CF3,	%g4
	ldx	[%l7 + 0x58],	%i7
	edge32l	%i5,	%g3,	%g2
	fpack32	%f12,	%f2,	%f4
	stb	%i4,	[%l7 + 0x4B]
	edge16l	%o1,	%g7,	%l2
	fmovdge	%xcc,	%f13,	%f2
	fmul8ulx16	%f26,	%f8,	%f6
	sdivcc	%o5,	0x1583,	%i2
	ldd	[%l7 + 0x58],	%f20
	movne	%xcc,	%l3,	%o4
	fand	%f30,	%f6,	%f12
	sth	%g1,	[%l7 + 0x58]
	array32	%o7,	%i0,	%o2
	movn	%xcc,	%g6,	%g5
	fornot1s	%f20,	%f14,	%f11
	movleu	%xcc,	%i6,	%o6
	alignaddr	%l0,	%l4,	%l5
	stx	%i3,	[%l7 + 0x38]
	smulcc	%i1,	%o0,	%l6
	sir	0x092E
	ldsb	[%l7 + 0x0A],	%o3
	nop
	set	0x78, %l5
	std	%f14,	[%l7 + %l5]
	sub	%l1,	0x1CDF,	%g4
	edge8n	%i7,	%g3,	%i5
	ldx	[%l7 + 0x70],	%i4
	sdivcc	%o1,	0x01DB,	%g7
	fpack16	%f4,	%f13
	ldd	[%l7 + 0x58],	%f4
	movrne	%g2,	%l2,	%i2
	movle	%xcc,	%l3,	%o5
	sth	%g1,	[%l7 + 0x48]
	sra	%o7,	0x19,	%o4
	movge	%icc,	%i0,	%g6
	and	%g5,	%o2,	%o6
	movle	%xcc,	%i6,	%l4
	movl	%xcc,	%l0,	%l5
	movrgez	%i1,	%i3,	%l6
	sdiv	%o0,	0x0528,	%o3
	addc	%g4,	%i7,	%l1
	movpos	%xcc,	%i5,	%i4
	movcs	%xcc,	%o1,	%g7
	movgu	%xcc,	%g3,	%l2
	smul	%g2,	%i2,	%l3
	fcmpeq32	%f28,	%f30,	%g1
	fmovdpos	%xcc,	%f0,	%f28
	fmovdl	%icc,	%f23,	%f3
	movre	%o7,	0x2EB,	%o4
	ldd	[%l7 + 0x40],	%i0
	subc	%g6,	%o5,	%o2
	ldx	[%l7 + 0x58],	%g5
	orncc	%o6,	0x0ECD,	%i6
	fmovspos	%xcc,	%f7,	%f12
	movcc	%xcc,	%l0,	%l5
	movne	%icc,	%i1,	%l4
	add	%i3,	0x0D79,	%l6
	fmovdl	%icc,	%f14,	%f9
	fpadd16s	%f13,	%f13,	%f18
	edge16l	%o3,	%g4,	%o0
	fcmpeq16	%f28,	%f18,	%l1
	orncc	%i5,	0x091D,	%i7
	movgu	%xcc,	%o1,	%g7
	smul	%g3,	%l2,	%g2
	edge8n	%i4,	%i2,	%l3
	ldx	[%l7 + 0x60],	%g1
	fmovsg	%icc,	%f8,	%f10
	movgu	%icc,	%o4,	%o7
	fone	%f28
	addc	%i0,	%o5,	%o2
	movre	%g6,	%g5,	%i6
	fmovsn	%icc,	%f27,	%f22
	fnegd	%f14,	%f22
	fone	%f8
	fmovsvc	%xcc,	%f3,	%f24
	mulscc	%l0,	0x1743,	%l5
	fpack16	%f22,	%f7
	fabss	%f1,	%f14
	sdivcc	%i1,	0x1FE7,	%o6
	fmovsn	%icc,	%f13,	%f19
	move	%xcc,	%i3,	%l6
	edge32ln	%o3,	%l4,	%g4
	edge8l	%l1,	%o0,	%i7
	orcc	%i5,	%o1,	%g7
	udivx	%l2,	0x0E84,	%g2
	edge32	%g3,	%i4,	%l3
	edge16l	%g1,	%o4,	%i2
	ldx	[%l7 + 0x20],	%o7
	andn	%i0,	0x0615,	%o5
	xorcc	%g6,	%o2,	%g5
	nop
	set	0x30, %o4
	ldd	[%l7 + %o4],	%l0
	orncc	%i6,	0x1F04,	%l5
	fmovrslez	%o6,	%f7,	%f10
	orn	%i1,	%l6,	%o3
	smulcc	%i3,	%l4,	%g4
	xnor	%o0,	%i7,	%l1
	movcc	%icc,	%i5,	%o1
	stx	%l2,	[%l7 + 0x48]
	alignaddrl	%g2,	%g3,	%i4
	fmul8x16au	%f30,	%f31,	%f18
	edge8l	%g7,	%l3,	%g1
	fpsub32	%f24,	%f8,	%f16
	srl	%i2,	0x16,	%o7
	ldd	[%l7 + 0x70],	%f4
	fxnors	%f13,	%f16,	%f19
	popc	%o4,	%i0
	sir	0x14F8
	subcc	%g6,	%o5,	%o2
	xor	%g5,	%i6,	%l5
	movgu	%xcc,	%o6,	%l0
	movl	%icc,	%l6,	%i1
	orcc	%o3,	0x18CA,	%i3
	sllx	%l4,	%g4,	%i7
	std	%f24,	[%l7 + 0x58]
	andcc	%o0,	%l1,	%o1
	edge32ln	%i5,	%g2,	%l2
	ldx	[%l7 + 0x68],	%i4
	std	%f0,	[%l7 + 0x78]
	addccc	%g3,	0x1A4B,	%g7
	fexpand	%f19,	%f4
	movrne	%g1,	%l3,	%i2
	movcs	%xcc,	%o4,	%i0
	movrne	%g6,	0x29A,	%o5
	array8	%o7,	%g5,	%o2
	andncc	%l5,	%i6,	%l0
	movrgez	%o6,	0x0CB,	%l6
	srax	%o3,	0x04,	%i3
	movre	%i1,	0x19D,	%l4
	fmovdn	%icc,	%f14,	%f10
	lduw	[%l7 + 0x30],	%g4
	alignaddrl	%i7,	%l1,	%o1
	mova	%icc,	%i5,	%g2
	mulx	%l2,	%o0,	%i4
	fnors	%f15,	%f0,	%f28
	edge32n	%g3,	%g7,	%l3
	fnor	%f10,	%f2,	%f24
	fmovdgu	%icc,	%f22,	%f16
	edge32l	%g1,	%o4,	%i0
	array32	%i2,	%g6,	%o5
	edge8l	%g5,	%o2,	%o7
	movvs	%xcc,	%i6,	%l0
	smulcc	%o6,	0x08DC,	%l5
	fmovsn	%icc,	%f5,	%f21
	mova	%icc,	%o3,	%l6
	fpackfix	%f6,	%f17
	xor	%i1,	0x08A8,	%i3
	andn	%l4,	%g4,	%l1
	array8	%i7,	%o1,	%g2
	movpos	%xcc,	%l2,	%o0
	movle	%icc,	%i5,	%i4
	xnor	%g7,	0x1AB4,	%l3
	alignaddr	%g1,	%g3,	%i0
	sethi	0x1490,	%o4
	xorcc	%i2,	%g6,	%g5
	mulx	%o2,	0x1B63,	%o5
	movneg	%xcc,	%o7,	%i6
	alignaddr	%l0,	%l5,	%o6
	array32	%l6,	%o3,	%i3
	fmovsgu	%xcc,	%f28,	%f20
	movleu	%xcc,	%i1,	%l4
	edge32ln	%g4,	%l1,	%i7
	std	%f2,	[%l7 + 0x50]
	ldd	[%l7 + 0x58],	%g2
	array32	%o1,	%l2,	%i5
	xorcc	%o0,	%g7,	%l3
	subcc	%i4,	0x0226,	%g3
	edge8	%g1,	%o4,	%i0
	faligndata	%f12,	%f4,	%f26
	sdivx	%i2,	0x114F,	%g5
	udivcc	%o2,	0x1B69,	%o5
	movge	%xcc,	%o7,	%g6
	andncc	%l0,	%i6,	%l5
	edge32	%o6,	%o3,	%i3
	sllx	%i1,	%l4,	%g4
	movcs	%xcc,	%l1,	%i7
	fpsub32s	%f13,	%f2,	%f15
	edge32l	%g2,	%l6,	%o1
	xor	%l2,	0x039B,	%i5
	addc	%g7,	%o0,	%i4
	fornot1s	%f1,	%f19,	%f11
	ldx	[%l7 + 0x28],	%g3
	stb	%l3,	[%l7 + 0x68]
	andcc	%g1,	%i0,	%i2
	subcc	%g5,	0x1DC5,	%o2
	ldd	[%l7 + 0x10],	%o4
	movl	%xcc,	%o5,	%g6
	mulscc	%o7,	%l0,	%l5
	movgu	%xcc,	%o6,	%o3
	fmovrsgez	%i3,	%f27,	%f10
	sdivcc	%i1,	0x03BF,	%l4
	sllx	%g4,	%l1,	%i7
	orn	%g2,	0x1BB5,	%l6
	stb	%o1,	[%l7 + 0x75]
	stx	%i6,	[%l7 + 0x60]
	popc	0x131D,	%i5
	movg	%xcc,	%g7,	%o0
	std	%f10,	[%l7 + 0x18]
	lduh	[%l7 + 0x26],	%i4
	fmovrslez	%l2,	%f2,	%f26
	fnors	%f24,	%f4,	%f17
	fmuld8ulx16	%f22,	%f21,	%f6
	andcc	%l3,	%g1,	%g3
	st	%f19,	[%l7 + 0x18]
	mulx	%i2,	%g5,	%o2
	movn	%xcc,	%i0,	%o4
	subcc	%g6,	0x1D72,	%o5
	movne	%icc,	%l0,	%o7
	fcmpgt32	%f20,	%f14,	%l5
	edge16ln	%o6,	%i3,	%o3
	sth	%l4,	[%l7 + 0x54]
	sllx	%g4,	0x19,	%i1
	movcs	%xcc,	%i7,	%g2
	movne	%xcc,	%l6,	%l1
	lduh	[%l7 + 0x16],	%o1
	ldsb	[%l7 + 0x11],	%i6
	movn	%icc,	%i5,	%g7
	subccc	%i4,	%l2,	%l3
	subcc	%o0,	%g3,	%i2
	fmul8x16	%f23,	%f4,	%f18
	edge8n	%g1,	%g5,	%i0
	xorcc	%o2,	0x0705,	%o4
	addccc	%g6,	0x1E2F,	%l0
	movneg	%xcc,	%o5,	%l5
	sllx	%o7,	%o6,	%i3
	fornot2s	%f22,	%f23,	%f19
	edge16ln	%l4,	%o3,	%i1
	subcc	%i7,	%g2,	%g4
	andncc	%l1,	%l6,	%i6
	edge16ln	%i5,	%g7,	%o1
	sllx	%l2,	%i4,	%l3
	orcc	%o0,	0x0278,	%i2
	sra	%g1,	%g5,	%g3
	fmuld8ulx16	%f29,	%f26,	%f4
	array32	%o2,	%i0,	%g6
	andncc	%l0,	%o4,	%l5
	ldd	[%l7 + 0x38],	%o4
	fmul8ulx16	%f0,	%f20,	%f8
	fpadd32s	%f17,	%f15,	%f19
	movn	%xcc,	%o7,	%i3
	fmovrdgez	%o6,	%f20,	%f28
	add	%o3,	0x052A,	%l4
	movrne	%i7,	0x21D,	%g2
	fpadd32s	%f27,	%f26,	%f26
	udivcc	%i1,	0x044D,	%g4
	ldsw	[%l7 + 0x0C],	%l1
	fmovsa	%xcc,	%f15,	%f18
	fmovdneg	%xcc,	%f4,	%f8
	andn	%i6,	0x1666,	%i5
	subccc	%g7,	0x1FF5,	%o1
	edge32n	%l2,	%l6,	%l3
	fmovrslez	%i4,	%f30,	%f20
	ldsb	[%l7 + 0x30],	%i2
	movneg	%xcc,	%o0,	%g1
	xnor	%g3,	0x0CEA,	%o2
	fmovrslez	%g5,	%f30,	%f3
	edge16n	%g6,	%l0,	%i0
	orncc	%o4,	%o5,	%o7
	nop
	set	0x49, %g7
	ldsb	[%l7 + %g7],	%l5
	srl	%i3,	%o3,	%l4
	move	%icc,	%i7,	%g2
	alignaddr	%o6,	%g4,	%i1
	movn	%icc,	%l1,	%i5
	nop
	set	0x78, %l2
	stx	%g7,	[%l7 + %l2]
	edge16	%o1,	%i6,	%l2
	fmovda	%icc,	%f7,	%f19
	movge	%icc,	%l3,	%i4
	fmovdle	%xcc,	%f27,	%f21
	andn	%i2,	%l6,	%o0
	fmovdcc	%xcc,	%f25,	%f14
	lduh	[%l7 + 0x1E],	%g3
	sth	%g1,	[%l7 + 0x6C]
	movl	%icc,	%g5,	%g6
	ldsw	[%l7 + 0x68],	%o2
	fmovdg	%xcc,	%f9,	%f7
	edge16l	%i0,	%l0,	%o5
	sth	%o7,	[%l7 + 0x74]
	sir	0x1E44
	addc	%l5,	0x0E47,	%o4
	alignaddr	%i3,	%o3,	%i7
	movleu	%icc,	%l4,	%g2
	smulcc	%g4,	%i1,	%o6
	fcmpeq16	%f16,	%f20,	%i5
	sethi	0x076E,	%g7
	fmovsleu	%icc,	%f30,	%f26
	umulcc	%o1,	0x1C11,	%l1
	fands	%f14,	%f4,	%f16
	and	%l2,	%l3,	%i4
	fabss	%f13,	%f8
	ldd	[%l7 + 0x10],	%f2
	orn	%i6,	0x009B,	%l6
	movn	%xcc,	%i2,	%g3
	save %g1, %g5, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdne	%xcc,	%f6,	%f25
	fmovsg	%xcc,	%f3,	%f2
	movcc	%xcc,	%g6,	%o2
	xor	%i0,	0x04B7,	%o5
	fmovsleu	%icc,	%f15,	%f24
	sll	%l0,	0x07,	%l5
	movl	%icc,	%o7,	%o4
	fmovspos	%icc,	%f10,	%f11
	movrgz	%i3,	%i7,	%o3
	sethi	0x0CCB,	%g2
	movgu	%icc,	%l4,	%g4
	sll	%o6,	0x1E,	%i5
	movrgez	%g7,	0x0AF,	%i1
	fpadd32s	%f14,	%f25,	%f18
	and	%l1,	0x142D,	%l2
	fpmerge	%f16,	%f2,	%f16
	ldsh	[%l7 + 0x2E],	%o1
	ld	[%l7 + 0x70],	%f19
	stb	%i4,	[%l7 + 0x1A]
	fmovrsne	%i6,	%f18,	%f19
	fmovrdgz	%l6,	%f24,	%f16
	stx	%i2,	[%l7 + 0x10]
	ldub	[%l7 + 0x58],	%l3
	subccc	%g3,	%g1,	%o0
	lduw	[%l7 + 0x18],	%g5
	fpack32	%f24,	%f4,	%f30
	array8	%g6,	%o2,	%i0
	save %o5, 0x19C3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l5,	0x13,	%o7
	mulscc	%i3,	0x0180,	%o4
	fmovdge	%xcc,	%f2,	%f25
	xnor	%o3,	%i7,	%l4
	movcs	%icc,	%g2,	%g4
	smulcc	%i5,	%o6,	%g7
	fmovrdne	%l1,	%f18,	%f30
	sdivcc	%l2,	0x012C,	%i1
	ldub	[%l7 + 0x6E],	%o1
	movcc	%icc,	%i4,	%l6
	movg	%xcc,	%i2,	%l3
	array32	%i6,	%g1,	%o0
	and	%g3,	%g5,	%g6
	fpackfix	%f18,	%f22
	edge16	%i0,	%o5,	%l0
	fmul8x16au	%f5,	%f1,	%f6
	sra	%l5,	0x01,	%o7
	ldub	[%l7 + 0x33],	%i3
	mulx	%o2,	0x188D,	%o3
	xorcc	%o4,	%i7,	%g2
	fxor	%f0,	%f6,	%f14
	ldsh	[%l7 + 0x7E],	%g4
	fpadd32s	%f0,	%f30,	%f12
	movpos	%icc,	%i5,	%o6
	alignaddr	%g7,	%l1,	%l4
	mova	%xcc,	%l2,	%i1
	umul	%i4,	%o1,	%i2
	movrlz	%l3,	%i6,	%g1
	st	%f31,	[%l7 + 0x38]
	movvc	%xcc,	%l6,	%o0
	mulx	%g5,	%g6,	%i0
	fandnot2s	%f22,	%f27,	%f18
	udivcc	%o5,	0x1A50,	%g3
	nop
	set	0x4E, %i0
	ldub	[%l7 + %i0],	%l0
	fpadd32s	%f27,	%f18,	%f25
	udivx	%l5,	0x0BEC,	%i3
	movvc	%xcc,	%o7,	%o2
	fpmerge	%f24,	%f16,	%f12
	movcc	%xcc,	%o3,	%o4
	array8	%g2,	%i7,	%i5
	fmovrsne	%g4,	%f21,	%f0
	fcmpne32	%f6,	%f16,	%o6
	movl	%icc,	%l1,	%l4
	fmovdg	%xcc,	%f29,	%f2
	movge	%xcc,	%l2,	%g7
	fmovscc	%icc,	%f27,	%f13
	addc	%i1,	%o1,	%i2
	subcc	%i4,	0x151A,	%l3
	smulcc	%g1,	0x0FC1,	%i6
	stb	%o0,	[%l7 + 0x27]
	subc	%l6,	0x1462,	%g6
	array8	%g5,	%i0,	%g3
	fnot1	%f6,	%f2
	save %l0, %l5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnands	%f15,	%f25,	%f29
	sth	%i3,	[%l7 + 0x76]
	stb	%o2,	[%l7 + 0x18]
	edge16n	%o3,	%o4,	%o7
	movle	%icc,	%i7,	%g2
	xnorcc	%i5,	%g4,	%l1
	sdivcc	%o6,	0x1EDB,	%l4
	edge16n	%g7,	%i1,	%l2
	nop
	set	0x6A, %l6
	sth	%o1,	[%l7 + %l6]
	movrne	%i2,	0x0D9,	%l3
	sdivx	%i4,	0x0EB3,	%g1
	lduw	[%l7 + 0x74],	%o0
	ldd	[%l7 + 0x20],	%f10
	fsrc1s	%f6,	%f6
	ldx	[%l7 + 0x38],	%l6
	fzero	%f2
	movrne	%i6,	0x3CB,	%g5
	movneg	%icc,	%g6,	%i0
	movn	%icc,	%g3,	%l0
	edge32n	%o5,	%l5,	%o2
	save %i3, 0x0FF3, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%o7,	%o3,	%i7
	ld	[%l7 + 0x38],	%f16
	stx	%i5,	[%l7 + 0x40]
	sllx	%g4,	%g2,	%l1
	fcmpgt16	%f10,	%f6,	%l4
	popc	%o6,	%i1
	fmovdg	%icc,	%f4,	%f19
	array16	%g7,	%l2,	%i2
	movvc	%icc,	%l3,	%o1
	fabss	%f0,	%f2
	fmovsvc	%icc,	%f23,	%f21
	xorcc	%g1,	%o0,	%l6
	smulcc	%i4,	0x0120,	%g5
	movrgez	%g6,	%i0,	%g3
	fmovdne	%xcc,	%f21,	%f13
	fnors	%f31,	%f17,	%f12
	ldsh	[%l7 + 0x68],	%l0
	srl	%o5,	%i6,	%l5
	udivcc	%i3,	0x177A,	%o2
	ldsw	[%l7 + 0x3C],	%o4
	sll	%o7,	0x09,	%o3
	movre	%i7,	%g4,	%i5
	fcmpgt16	%f4,	%f10,	%l1
	movrgez	%l4,	%o6,	%i1
	subc	%g7,	0x0002,	%g2
	edge16n	%l2,	%l3,	%o1
	ldsb	[%l7 + 0x1D],	%i2
	and	%o0,	0x174C,	%g1
	edge16l	%i4,	%l6,	%g5
	fmovdvc	%xcc,	%f24,	%f31
	movne	%icc,	%i0,	%g6
	movneg	%icc,	%g3,	%l0
	fors	%f25,	%f0,	%f29
	fnands	%f24,	%f9,	%f9
	movg	%icc,	%o5,	%l5
	xnorcc	%i3,	%i6,	%o2
	fnors	%f23,	%f11,	%f3
	edge16ln	%o7,	%o4,	%o3
	edge16n	%i7,	%i5,	%l1
	ld	[%l7 + 0x14],	%f23
	movge	%xcc,	%l4,	%g4
	fandnot2	%f14,	%f26,	%f4
	edge32n	%o6,	%i1,	%g7
	srlx	%l2,	%g2,	%o1
	ldsw	[%l7 + 0x14],	%l3
	save %i2, %o0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnegd	%f22,	%f2
	movvs	%xcc,	%l6,	%g5
	smulcc	%i0,	%g6,	%g1
	movge	%icc,	%l0,	%o5
	array16	%l5,	%g3,	%i6
	ld	[%l7 + 0x2C],	%f21
	fmovrdne	%o2,	%f8,	%f6
	umul	%o7,	0x0FE7,	%i3
	edge32l	%o3,	%i7,	%i5
	srlx	%l1,	%l4,	%g4
	movrlez	%o4,	0x38D,	%i1
	fmovdneg	%icc,	%f17,	%f0
	sdiv	%o6,	0x08B5,	%g7
	popc	0x0CFA,	%g2
	addc	%l2,	%o1,	%i2
	fpadd16s	%f0,	%f11,	%f8
	udivx	%o0,	0x0993,	%i4
	setx loop_16, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_16: 	ldsb	[%l7 + 0x56],	%g6
	sdivcc	%g1,	0x1F34,	%i0
	movrne	%o5,	%l0,	%l5
	alignaddr	%g3,	%o2,	%o7
	fmovdl	%icc,	%f28,	%f0
	movvc	%icc,	%i3,	%i6
	alignaddrl	%o3,	%i5,	%i7
	ld	[%l7 + 0x4C],	%f29
	nop
	set	0x0B, %g1
	ldsb	[%l7 + %g1],	%l4
	fmovsn	%icc,	%f3,	%f20
	fone	%f10
	fsrc2s	%f10,	%f30
	and	%g4,	%l1,	%i1
	lduw	[%l7 + 0x30],	%o4
	ldsh	[%l7 + 0x6C],	%o6
	fnegd	%f24,	%f26
	movcs	%icc,	%g7,	%g2
	stw	%o1,	[%l7 + 0x1C]
	fsrc1	%f28,	%f2
	fxor	%f2,	%f12,	%f4
	edge32n	%i2,	%l2,	%i4
	movrlez	%l6,	%g5,	%o0
	umulcc	%g6,	0x107D,	%l3
	fmovd	%f8,	%f12
	orncc	%i0,	%o5,	%l0
	stb	%l5,	[%l7 + 0x10]
	xnor	%g3,	0x1939,	%g1
	movrlz	%o2,	%i3,	%o7
	fmovdn	%icc,	%f1,	%f20
	sllx	%o3,	%i6,	%i5
	edge16ln	%i7,	%l4,	%l1
	movrlez	%i1,	%o4,	%o6
	edge16l	%g4,	%g7,	%g2
	movne	%xcc,	%i2,	%l2
	mova	%xcc,	%i4,	%l6
	movge	%icc,	%o1,	%g5
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f14
	fmovsneg	%xcc,	%f7,	%f22
	stb	%o0,	[%l7 + 0x7F]
	array8	%l3,	%i0,	%o5
	edge16l	%l0,	%g6,	%g3
	std	%f30,	[%l7 + 0x28]
	sdivx	%g1,	0x1DED,	%o2
	ldd	[%l7 + 0x70],	%f0
	fcmpeq32	%f16,	%f10,	%l5
	fandnot2	%f4,	%f22,	%f8
	ldsb	[%l7 + 0x50],	%o7
	fmovscc	%xcc,	%f20,	%f29
	fpmerge	%f0,	%f8,	%f2
	fornot1s	%f30,	%f14,	%f20
	sll	%o3,	0x02,	%i6
	edge16	%i3,	%i7,	%l4
	edge32l	%i5,	%i1,	%l1
	sir	0x115B
	movleu	%icc,	%o6,	%o4
	stw	%g7,	[%l7 + 0x20]
	nop
	set	0x3E, %o0
	ldsh	[%l7 + %o0],	%g4
	addccc	%i2,	0x0CEB,	%l2
	movg	%icc,	%g2,	%i4
	fmovdvc	%icc,	%f25,	%f31
	sdivx	%l6,	0x1160,	%g5
	movneg	%xcc,	%o0,	%o1
	fmovde	%icc,	%f14,	%f16
	smul	%i0,	0x1364,	%o5
	smulcc	%l0,	0x1E1C,	%l3
	srlx	%g3,	%g1,	%g6
	subcc	%l5,	%o2,	%o3
	mulx	%o7,	%i3,	%i7
	fmovdn	%xcc,	%f23,	%f11
	fmovsle	%icc,	%f26,	%f13
	edge16l	%i6,	%i5,	%l4
	xor	%i1,	%l1,	%o6
	nop
	set	0x10, %l4
	ldsb	[%l7 + %l4],	%g7
	save %g4, %i2, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%l2,	%g2,	%i4
	std	%f20,	[%l7 + 0x40]
	sdivcc	%g5,	0x07B1,	%l6
	sra	%o1,	0x1F,	%o0
	sllx	%o5,	0x0C,	%i0
	addccc	%l0,	%l3,	%g1
	movge	%icc,	%g6,	%l5
	sdivcc	%g3,	0x100F,	%o3
	smulcc	%o2,	0x0837,	%o7
	sllx	%i7,	%i3,	%i6
	subcc	%l4,	0x0BFB,	%i5
	edge32l	%i1,	%o6,	%g7
	movne	%icc,	%l1,	%g4
	movg	%icc,	%i2,	%l2
	restore %g2, %i4, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnor	%l6,	0x11D4,	%g5
	orcc	%o0,	%o5,	%i0
	sdivx	%l0,	0x0D43,	%l3
	fsrc2s	%f19,	%f16
	stx	%g1,	[%l7 + 0x78]
	andncc	%o1,	%g6,	%l5
	fmovdn	%icc,	%f14,	%f19
	fxor	%f2,	%f12,	%f14
	ldsh	[%l7 + 0x6C],	%g3
	fornot1s	%f18,	%f10,	%f27
	fmovdvs	%icc,	%f22,	%f31
	movcc	%icc,	%o3,	%o7
	fpadd32	%f0,	%f18,	%f10
	andncc	%i7,	%o2,	%i3
	movvs	%xcc,	%i6,	%i5
	move	%xcc,	%l4,	%i1
	edge8l	%g7,	%l1,	%g4
	sir	0x0A6E
	alignaddrl	%i2,	%l2,	%g2
	mulx	%i4,	0x1E84,	%o4
	fandnot1s	%f13,	%f18,	%f10
	edge16n	%l6,	%g5,	%o6
	sdivcc	%o0,	0x0B6E,	%i0
	movge	%icc,	%o5,	%l3
	move	%xcc,	%l0,	%g1
	andcc	%g6,	%l5,	%o1
	edge16ln	%g3,	%o3,	%i7
	setx loop_17, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_17: 	movvs	%xcc,	%i3,	%i5
	fsrc1s	%f16,	%f29
	lduw	[%l7 + 0x6C],	%l4
	edge16	%i1,	%g7,	%l1
	umulcc	%i2,	%g4,	%l2
	movrne	%g2,	%o4,	%i4
	edge8l	%g5,	%l6,	%o6
	alignaddr	%i0,	%o0,	%o5
	andncc	%l3,	%l0,	%g1
	edge8	%l5,	%g6,	%o1
	alignaddr	%o3,	%i7,	%o7
	srax	%g3,	0x1D,	%i6
	srax	%o2,	0x0F,	%i3
	fnors	%f24,	%f26,	%f11
	mova	%xcc,	%i5,	%l4
	fmovsleu	%icc,	%f7,	%f22
	movcs	%icc,	%g7,	%i1
	movpos	%icc,	%i2,	%l1
	sdivcc	%g4,	0x176D,	%g2
	st	%f6,	[%l7 + 0x28]
	fpackfix	%f12,	%f6
	ldsb	[%l7 + 0x5E],	%o4
	fmovscs	%xcc,	%f29,	%f14
	array8	%i4,	%g5,	%l6
	edge16n	%o6,	%i0,	%l2
	fnot1	%f20,	%f0
	fmovsge	%icc,	%f10,	%f18
	or	%o5,	0x127E,	%l3
	sll	%o0,	%g1,	%l0
	orcc	%l5,	%g6,	%o3
	mulx	%o1,	%i7,	%g3
	and	%i6,	%o2,	%i3
	ld	[%l7 + 0x20],	%f19
	fmovrsgz	%o7,	%f2,	%f9
	sth	%l4,	[%l7 + 0x34]
	faligndata	%f28,	%f0,	%f20
	andncc	%g7,	%i5,	%i1
	fzero	%f2
	ldx	[%l7 + 0x70],	%l1
	or	%g4,	0x19D3,	%g2
	addcc	%o4,	%i2,	%g5
	sdivx	%i4,	0x15EC,	%o6
	edge16	%l6,	%i0,	%o5
	st	%f18,	[%l7 + 0x50]
	srlx	%l2,	0x07,	%o0
	add	%l3,	%g1,	%l0
	and	%l5,	0x073A,	%o3
	andncc	%g6,	%o1,	%i7
	edge8ln	%g3,	%i6,	%o2
	fmovdge	%icc,	%f12,	%f18
	popc	%i3,	%l4
	fmovsn	%xcc,	%f15,	%f7
	movgu	%xcc,	%g7,	%i5
	fcmpd	%fcc0,	%f24,	%f6
	subcc	%o7,	%i1,	%g4
	array8	%l1,	%o4,	%g2
	srlx	%i2,	0x00,	%i4
	movle	%icc,	%g5,	%o6
	fones	%f22
	subcc	%i0,	0x1665,	%o5
	mulscc	%l6,	%o0,	%l3
	fxnors	%f1,	%f23,	%f1
	lduh	[%l7 + 0x0E],	%l2
	umulcc	%l0,	0x1CE3,	%l5
	siam	0x4
	edge8l	%g1,	%o3,	%g6
	sub	%i7,	0x1C3B,	%o1
	fandnot1s	%f28,	%f9,	%f26
	fmovdl	%xcc,	%f19,	%f12
	fmovsgu	%icc,	%f30,	%f6
	sethi	0x1EE0,	%i6
	ldub	[%l7 + 0x6B],	%g3
	edge8n	%o2,	%i3,	%l4
	movl	%xcc,	%g7,	%i5
	ldsh	[%l7 + 0x2A],	%o7
	popc	%i1,	%g4
	and	%l1,	0x1A8B,	%g2
	edge8l	%i2,	%o4,	%i4
	edge32ln	%o6,	%i0,	%g5
	sdivcc	%l6,	0x16BC,	%o0
	edge8	%l3,	%l2,	%l0
	add	%l5,	%g1,	%o3
	mova	%icc,	%g6,	%o5
	mova	%xcc,	%o1,	%i7
	fnand	%f0,	%f6,	%f2
	udiv	%i6,	0x03AB,	%g3
	fcmpeq32	%f6,	%f6,	%i3
	sub	%o2,	0x00A8,	%g7
	umul	%i5,	%o7,	%i1
	fsrc2s	%f17,	%f16
	st	%f22,	[%l7 + 0x14]
	nop
	set	0x30, %g6
	ldd	[%l7 + %g6],	%f18
	fnot2	%f24,	%f22
	fcmped	%fcc0,	%f2,	%f30
	subccc	%l4,	%g4,	%g2
	edge32l	%i2,	%l1,	%i4
	movle	%xcc,	%o6,	%i0
	ldx	[%l7 + 0x30],	%g5
	edge8	%o4,	%l6,	%o0
	movle	%icc,	%l3,	%l0
	ldd	[%l7 + 0x08],	%l4
	sra	%l2,	0x1E,	%g1
	sth	%g6,	[%l7 + 0x3A]
	fmovrdgez	%o5,	%f16,	%f26
	edge16n	%o3,	%o1,	%i6
	edge16l	%i7,	%i3,	%g3
	movvc	%xcc,	%g7,	%o2
	ldsb	[%l7 + 0x3C],	%i5
	sdivcc	%o7,	0x0877,	%l4
	smulcc	%g4,	%g2,	%i2
	movge	%xcc,	%l1,	%i1
	ldsh	[%l7 + 0x0C],	%i4
	fnors	%f8,	%f12,	%f9
	edge16n	%i0,	%o6,	%o4
	movle	%xcc,	%g5,	%o0
	sdiv	%l6,	0x18FC,	%l3
	array32	%l0,	%l2,	%l5
	umulcc	%g6,	%o5,	%o3
	ldx	[%l7 + 0x28],	%g1
	edge32l	%o1,	%i6,	%i3
	fmovrsgz	%g3,	%f31,	%f31
	movl	%xcc,	%i7,	%o2
	std	%f30,	[%l7 + 0x50]
	fmovsneg	%xcc,	%f7,	%f22
	edge16	%g7,	%i5,	%o7
	edge8l	%l4,	%g4,	%g2
	movre	%l1,	0x201,	%i1
	subc	%i4,	%i2,	%o6
	movrlez	%i0,	0x249,	%g5
	stw	%o0,	[%l7 + 0x20]
	sllx	%l6,	%l3,	%o4
	mulscc	%l2,	0x1AA4,	%l0
	fmovdcc	%xcc,	%f19,	%f21
	movgu	%xcc,	%l5,	%o5
	fmovdvs	%xcc,	%f25,	%f27
	edge8	%g6,	%o3,	%o1
	mulx	%g1,	0x0DA4,	%i6
	add	%i3,	0x12C5,	%i7
	umul	%g3,	0x0B1A,	%o2
	stx	%i5,	[%l7 + 0x70]
	sll	%o7,	0x0A,	%g7
	addcc	%g4,	%l4,	%g2
	movcc	%icc,	%l1,	%i4
	movg	%xcc,	%i2,	%i1
	fnegd	%f28,	%f26
	orncc	%o6,	0x17EC,	%i0
	movgu	%icc,	%o0,	%g5
	movneg	%xcc,	%l3,	%l6
	udivcc	%o4,	0x06DB,	%l2
	stw	%l0,	[%l7 + 0x4C]
	fnegd	%f28,	%f20
	orcc	%o5,	%g6,	%l5
	alignaddr	%o1,	%g1,	%o3
	sllx	%i6,	%i7,	%i3
	sdivcc	%o2,	0x105B,	%g3
	edge8n	%i5,	%o7,	%g4
	stw	%g7,	[%l7 + 0x20]
	fnot2s	%f30,	%f17
	umul	%g2,	%l1,	%l4
	movle	%xcc,	%i4,	%i2
	fnor	%f6,	%f28,	%f10
	ldsw	[%l7 + 0x34],	%i1
	edge32l	%i0,	%o0,	%o6
	movrlez	%l3,	0x3C8,	%l6
	move	%xcc,	%o4,	%g5
	movcc	%xcc,	%l2,	%l0
	movneg	%icc,	%o5,	%g6
	movne	%icc,	%o1,	%g1
	movgu	%icc,	%l5,	%o3
	mova	%xcc,	%i6,	%i3
	xnor	%o2,	%i7,	%g3
	srl	%i5,	0x02,	%g4
	fandnot2s	%f6,	%f5,	%f4
	sir	0x06F8
	sllx	%o7,	0x1A,	%g7
	sub	%g2,	%l1,	%l4
	array16	%i4,	%i1,	%i2
	edge16	%i0,	%o0,	%l3
	edge8n	%l6,	%o4,	%o6
	st	%f15,	[%l7 + 0x24]
	fmovrsgz	%g5,	%f14,	%f18
	fxors	%f13,	%f28,	%f28
	fnor	%f24,	%f16,	%f30
	siam	0x5
	fornot1	%f2,	%f2,	%f0
	movneg	%xcc,	%l2,	%o5
	alignaddrl	%l0,	%g6,	%g1
	fandnot1	%f14,	%f8,	%f26
	fandnot2s	%f17,	%f10,	%f29
	movrgz	%l5,	0x2CE,	%o1
	movn	%icc,	%o3,	%i6
	ld	[%l7 + 0x74],	%f19
	fmovda	%xcc,	%f7,	%f13
	addcc	%i3,	0x038B,	%i7
	alignaddrl	%o2,	%g3,	%i5
	smulcc	%o7,	0x01C9,	%g4
	fmovscc	%icc,	%f9,	%f13
	and	%g7,	%l1,	%g2
	movcc	%xcc,	%l4,	%i4
	and	%i2,	0x03AE,	%i0
	ldsb	[%l7 + 0x3D],	%i1
	sub	%l3,	%l6,	%o4
	stw	%o0,	[%l7 + 0x14]
	orn	%g5,	%l2,	%o6
	movrgez	%l0,	%o5,	%g1
	edge16	%l5,	%g6,	%o1
	movrgez	%o3,	%i3,	%i7
	udiv	%o2,	0x13B1,	%g3
	or	%i5,	%o7,	%i6
	lduw	[%l7 + 0x6C],	%g4
	sdiv	%g7,	0x1B60,	%l1
	umulcc	%l4,	%i4,	%i2
	fpackfix	%f24,	%f9
	fmovrdlz	%i0,	%f6,	%f0
	addcc	%i1,	%l3,	%l6
	stx	%o4,	[%l7 + 0x28]
	movneg	%xcc,	%o0,	%g5
	orn	%g2,	%o6,	%l0
	sub	%l2,	%o5,	%l5
	sra	%g6,	0x16,	%g1
	stx	%o1,	[%l7 + 0x68]
	fpsub32s	%f11,	%f10,	%f19
	movrgz	%i3,	%i7,	%o3
	umulcc	%o2,	%g3,	%o7
	fxnors	%f29,	%f3,	%f30
	fcmpgt32	%f8,	%f0,	%i5
	popc	%i6,	%g4
	stx	%l1,	[%l7 + 0x08]
	ldsh	[%l7 + 0x44],	%g7
	movrgez	%l4,	%i2,	%i4
	edge32n	%i1,	%i0,	%l6
	xnor	%o4,	%o0,	%l3
	movneg	%xcc,	%g5,	%g2
	add	%l0,	%o6,	%o5
	andncc	%l5,	%g6,	%l2
	orncc	%o1,	%i3,	%i7
	lduw	[%l7 + 0x10],	%g1
	movre	%o2,	0x275,	%g3
	nop
	set	0x60, %i5
	sth	%o3,	[%l7 + %i5]
	edge16l	%i5,	%i6,	%g4
	mulscc	%l1,	%o7,	%l4
	ldsw	[%l7 + 0x10],	%i2
	orncc	%i4,	%g7,	%i1
	xor	%i0,	%o4,	%o0
	stw	%l3,	[%l7 + 0x58]
	movgu	%icc,	%g5,	%g2
	umul	%l0,	%o6,	%o5
	fmovrslez	%l5,	%f15,	%f22
	subcc	%g6,	0x0018,	%l6
	addcc	%l2,	%o1,	%i3
	stx	%i7,	[%l7 + 0x10]
	sdiv	%o2,	0x063A,	%g1
	andn	%o3,	%i5,	%i6
	ldd	[%l7 + 0x28],	%g2
	fmovda	%xcc,	%f14,	%f13
	sra	%g4,	%l1,	%l4
	orcc	%o7,	%i4,	%g7
	fsrc1	%f8,	%f0
	xorcc	%i2,	0x1690,	%i1
	orn	%o4,	0x057E,	%i0
	mulscc	%l3,	%g5,	%o0
	ldsh	[%l7 + 0x18],	%l0
	sir	0x154E
	fnand	%f12,	%f10,	%f20
	andcc	%g2,	0x0B11,	%o6
	movrlz	%o5,	0x395,	%l5
	orcc	%g6,	0x1ACB,	%l6
	smul	%l2,	%i3,	%o1
	movneg	%icc,	%i7,	%o2
	or	%g1,	%i5,	%i6
	fmovrslz	%g3,	%f13,	%f17
	movrlez	%g4,	%l1,	%l4
	sir	0x111A
	sub	%o3,	0x1F19,	%o7
	edge16n	%g7,	%i4,	%i1
	fnot2s	%f6,	%f18
	edge16n	%i2,	%i0,	%o4
	addccc	%g5,	0x1B8B,	%o0
	and	%l0,	0x002E,	%l3
	orncc	%o6,	%o5,	%g2
	mulx	%g6,	%l6,	%l5
	alignaddr	%i3,	%l2,	%i7
	udiv	%o1,	0x0519,	%o2
	andncc	%g1,	%i6,	%g3
	sllx	%i5,	%l1,	%l4
	or	%o3,	%o7,	%g7
	fornot2s	%f16,	%f19,	%f21
	fmul8x16au	%f26,	%f9,	%f24
	sir	0x0092
	movrne	%g4,	0x026,	%i1
	movn	%icc,	%i4,	%i0
	movleu	%xcc,	%i2,	%g5
	fmovrslz	%o0,	%f14,	%f19
	movneg	%icc,	%l0,	%l3
	fmovscc	%xcc,	%f21,	%f1
	fmuld8ulx16	%f25,	%f16,	%f28
	fcmpes	%fcc2,	%f23,	%f23
	for	%f6,	%f14,	%f8
	addccc	%o6,	%o5,	%g2
	ld	[%l7 + 0x40],	%f0
	fone	%f26
	fmovdge	%icc,	%f19,	%f5
	addc	%o4,	0x094A,	%l6
	subccc	%l5,	0x12A4,	%i3
	ldsw	[%l7 + 0x08],	%g6
	mova	%xcc,	%i7,	%o1
	fand	%f20,	%f18,	%f8
	fpackfix	%f30,	%f8
	andn	%o2,	%l2,	%i6
	stb	%g1,	[%l7 + 0x16]
	movg	%xcc,	%i5,	%l1
	fmovdl	%xcc,	%f6,	%f25
	udivx	%l4,	0x1FBD,	%o3
	sub	%o7,	0x062B,	%g3
	movneg	%icc,	%g7,	%i1
	stb	%i4,	[%l7 + 0x5E]
	movneg	%icc,	%g4,	%i0
	mulscc	%g5,	%o0,	%i2
	edge32l	%l3,	%o6,	%l0
	st	%f1,	[%l7 + 0x1C]
	andncc	%g2,	%o4,	%o5
	fnot1	%f30,	%f14
	restore %l6, %l5, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x2C],	%f18
	stx	%i7,	[%l7 + 0x30]
	array32	%g6,	%o1,	%o2
	fsrc2s	%f24,	%f18
	edge8l	%l2,	%g1,	%i5
	udivcc	%l1,	0x11BC,	%i6
	array16	%o3,	%o7,	%l4
	sra	%g3,	%i1,	%g7
	movcc	%icc,	%i4,	%i0
	edge16n	%g4,	%o0,	%i2
	fpmerge	%f15,	%f28,	%f4
	edge32n	%l3,	%g5,	%l0
	fexpand	%f19,	%f16
	alignaddrl	%o6,	%o4,	%g2
	fmovrslez	%o5,	%f0,	%f16
	xor	%l5,	%l6,	%i3
	fpadd32s	%f6,	%f1,	%f30
	fzero	%f0
	stb	%g6,	[%l7 + 0x3A]
	andcc	%o1,	0x1886,	%i7
	addcc	%o2,	0x12F3,	%g1
	edge8ln	%i5,	%l2,	%l1
	edge8l	%o3,	%o7,	%l4
	mulx	%i6,	0x0573,	%g3
	fsrc2s	%f7,	%f25
	umulcc	%i1,	%i4,	%i0
	movrlz	%g7,	0x220,	%g4
	orn	%i2,	%o0,	%l3
	movpos	%icc,	%g5,	%l0
	movleu	%xcc,	%o6,	%o4
	sll	%o5,	0x00,	%l5
	fnand	%f12,	%f20,	%f0
	smul	%l6,	0x174C,	%g2
	subcc	%g6,	%i3,	%o1
	sdiv	%o2,	0x15BD,	%i7
	ldx	[%l7 + 0x08],	%g1
	fmovdpos	%xcc,	%f4,	%f7
	fmul8sux16	%f8,	%f10,	%f2
	setx loop_18, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_18: 	movpos	%xcc,	%o3,	%l4
	orncc	%o7,	%g3,	%i1
	sra	%i4,	%i0,	%g7
	movgu	%xcc,	%g4,	%i6
	movn	%icc,	%i2,	%o0
	andncc	%g5,	%l3,	%l0
	edge32	%o6,	%o4,	%o5
	subcc	%l6,	0x0CE3,	%l5
	addcc	%g2,	%i3,	%o1
	edge8l	%o2,	%i7,	%g1
	fpadd32s	%f20,	%f24,	%f8
	fcmpgt16	%f10,	%f16,	%g6
	sra	%l2,	%l1,	%o3
	edge32ln	%i5,	%l4,	%g3
	sllx	%i1,	%i4,	%i0
	orcc	%g7,	0x1E0F,	%g4
	movrlez	%o7,	%i6,	%o0
	srax	%i2,	0x02,	%l3
	fmovdl	%icc,	%f12,	%f16
	xnorcc	%g5,	%o6,	%l0
	movge	%icc,	%o5,	%l6
	movleu	%xcc,	%l5,	%o4
	addccc	%g2,	0x07B3,	%o1
	ldd	[%l7 + 0x30],	%f14
	movg	%icc,	%i3,	%i7
	sra	%g1,	%g6,	%o2
	array16	%l2,	%o3,	%l1
	lduw	[%l7 + 0x44],	%l4
	move	%xcc,	%g3,	%i5
	fzero	%f6
	movvc	%icc,	%i4,	%i1
	addcc	%i0,	0x1E40,	%g4
	movrne	%o7,	0x3BC,	%g7
	fsrc2	%f16,	%f8
	srl	%o0,	%i6,	%l3
	smul	%g5,	%i2,	%o6
	andcc	%o5,	0x05FE,	%l6
	addc	%l0,	0x1024,	%l5
	movg	%xcc,	%o4,	%o1
	smulcc	%i3,	%g2,	%i7
	edge8l	%g6,	%g1,	%l2
	array16	%o3,	%l1,	%o2
	sdiv	%l4,	0x1E53,	%i5
	lduw	[%l7 + 0x0C],	%g3
	ldsh	[%l7 + 0x48],	%i1
	andncc	%i0,	%g4,	%o7
	xnorcc	%i4,	0x1FA2,	%o0
	movvs	%icc,	%i6,	%l3
	edge32n	%g5,	%i2,	%o6
	sub	%o5,	%g7,	%l0
	orncc	%l6,	0x0E42,	%l5
	sll	%o4,	%i3,	%g2
	sra	%i7,	0x06,	%o1
	fmovdle	%icc,	%f5,	%f7
	ldub	[%l7 + 0x6F],	%g1
	ldsb	[%l7 + 0x24],	%g6
	lduh	[%l7 + 0x10],	%o3
	udivcc	%l1,	0x0535,	%l2
	save %l4, %o2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%i1,	%i0,	%g4
	movvc	%icc,	%g3,	%i4
	nop
	set	0x0F, %l1
	ldub	[%l7 + %l1],	%o0
	xorcc	%i6,	%o7,	%l3
	fmovse	%icc,	%f19,	%f26
	mova	%xcc,	%i2,	%o6
	movrlz	%o5,	0x2DC,	%g7
	movcc	%icc,	%g5,	%l6
	edge16l	%l0,	%o4,	%l5
	nop
	set	0x30, %g3
	ldsb	[%l7 + %g3],	%i3
	movrlez	%g2,	%i7,	%g1
	fmovrde	%o1,	%f8,	%f14
	movneg	%icc,	%g6,	%l1
	movne	%icc,	%o3,	%l2
	edge16ln	%l4,	%i5,	%i1
	sdiv	%o2,	0x1FA2,	%i0
	movvc	%xcc,	%g3,	%g4
	andncc	%i4,	%o0,	%i6
	movpos	%xcc,	%o7,	%i2
	fnot1s	%f27,	%f5
	edge32ln	%o6,	%l3,	%o5
	xnorcc	%g5,	%g7,	%l6
	fones	%f11
	umul	%l0,	%o4,	%l5
	fpsub16s	%f12,	%f5,	%f1
	mulscc	%g2,	%i3,	%i7
	movvs	%icc,	%g1,	%o1
	movl	%xcc,	%g6,	%l1
	ldd	[%l7 + 0x30],	%l2
	move	%xcc,	%l4,	%i5
	edge32ln	%o3,	%o2,	%i1
	fcmps	%fcc3,	%f1,	%f17
	ldsh	[%l7 + 0x10],	%g3
	movpos	%icc,	%g4,	%i0
	xorcc	%o0,	%i4,	%o7
	addcc	%i2,	0x1D2E,	%o6
	ldsw	[%l7 + 0x28],	%i6
	save %l3, %o5, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne16	%f8,	%f8,	%g5
	siam	0x5
	movl	%xcc,	%l0,	%l6
	fpsub32s	%f25,	%f24,	%f5
	fzero	%f30
	edge8n	%o4,	%l5,	%i3
	stw	%i7,	[%l7 + 0x14]
	movcs	%xcc,	%g1,	%o1
	sethi	0x007D,	%g6
	ldsw	[%l7 + 0x5C],	%l1
	sdivcc	%g2,	0x1074,	%l2
	movrne	%i5,	0x282,	%l4
	andncc	%o3,	%o2,	%i1
	movgu	%icc,	%g3,	%i0
	fmovscc	%icc,	%f9,	%f22
	edge32l	%o0,	%g4,	%i4
	fmovdne	%xcc,	%f30,	%f29
	edge32ln	%i2,	%o6,	%i6
	subc	%o7,	%l3,	%g7
	fnegs	%f19,	%f28
	addccc	%g5,	%o5,	%l0
	fmovdl	%xcc,	%f27,	%f20
	fandnot2s	%f3,	%f9,	%f17
	addcc	%o4,	%l5,	%i3
	sllx	%i7,	0x02,	%l6
	bshuffle	%f16,	%f14,	%f20
	xor	%g1,	0x0357,	%g6
	fandnot2s	%f2,	%f23,	%f10
	sdivx	%o1,	0x0A1D,	%l1
	stx	%g2,	[%l7 + 0x08]
	fcmpeq16	%f28,	%f0,	%l2
	stb	%l4,	[%l7 + 0x09]
	orn	%o3,	%o2,	%i1
	fandnot2s	%f30,	%f30,	%f3
	nop
	set	0x45, %i3
	ldub	[%l7 + %i3],	%i5
	ldsw	[%l7 + 0x3C],	%i0
	fandnot2s	%f30,	%f10,	%f9
	xnor	%g3,	%o0,	%i4
	fnot2	%f18,	%f14
	ldx	[%l7 + 0x28],	%g4
	movrlz	%i2,	%o6,	%o7
	andncc	%i6,	%l3,	%g7
	fmuld8sux16	%f8,	%f15,	%f20
	movre	%o5,	0x378,	%l0
	fmovsneg	%xcc,	%f8,	%f8
	fmovsvc	%icc,	%f2,	%f26
	movpos	%icc,	%o4,	%l5
	fxor	%f4,	%f22,	%f28
	nop
	set	0x12, %i7
	sth	%g5,	[%l7 + %i7]
	movpos	%xcc,	%i7,	%i3
	mulx	%g1,	0x0CB6,	%g6
	xnor	%l6,	0x0765,	%l1
	orcc	%g2,	0x05BA,	%l2
	movvc	%xcc,	%l4,	%o1
	array16	%o3,	%i1,	%o2
	movleu	%icc,	%i0,	%g3
	subccc	%o0,	0x1900,	%i5
	ldd	[%l7 + 0x48],	%f12
	edge32ln	%g4,	%i4,	%i2
	movneg	%icc,	%o7,	%o6
	edge8ln	%l3,	%g7,	%i6
	popc	%o5,	%o4
	fabss	%f7,	%f14
	move	%xcc,	%l0,	%g5
	sdiv	%i7,	0x039D,	%i3
	xnor	%l5,	%g1,	%l6
	sub	%g6,	%l1,	%g2
	stb	%l4,	[%l7 + 0x0D]
	array16	%o1,	%l2,	%o3
	sub	%i1,	0x0D89,	%i0
	st	%f26,	[%l7 + 0x5C]
	smulcc	%g3,	%o2,	%o0
	umul	%g4,	%i5,	%i4
	udivx	%o7,	0x19AF,	%i2
	array32	%o6,	%l3,	%i6
	ld	[%l7 + 0x40],	%f30
	save %g7, %o4, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%l0,	0x1F79,	%i7
	movpos	%xcc,	%g5,	%i3
	and	%g1,	0x0985,	%l5
	move	%xcc,	%l6,	%l1
	ldd	[%l7 + 0x50],	%g2
	andn	%l4,	%g6,	%o1
	sth	%l2,	[%l7 + 0x0A]
	xnor	%o3,	0x0E5F,	%i0
	andncc	%i1,	%g3,	%o2
	add	%o0,	0x0E27,	%g4
	ldd	[%l7 + 0x18],	%f28
	fxor	%f28,	%f6,	%f10
	fnegs	%f2,	%f1
	sir	0x0F0C
	addc	%i5,	0x06CA,	%o7
	smulcc	%i2,	%i4,	%o6
	lduw	[%l7 + 0x74],	%i6
	fmovda	%xcc,	%f23,	%f7
	sth	%g7,	[%l7 + 0x26]
	ldsh	[%l7 + 0x56],	%o4
	movrgz	%o5,	0x241,	%l0
	fandnot2s	%f20,	%f5,	%f29
	array16	%i7,	%g5,	%i3
	subc	%g1,	%l3,	%l6
	edge16	%l1,	%g2,	%l5
	subcc	%l4,	%g6,	%l2
	ldsh	[%l7 + 0x1A],	%o3
	smulcc	%o1,	%i0,	%g3
	fones	%f16
	movrlez	%i1,	0x1B9,	%o0
	std	%f14,	[%l7 + 0x50]
	smulcc	%o2,	0x0193,	%i5
	fmovrsne	%o7,	%f8,	%f9
	fabss	%f26,	%f18
	srl	%g4,	%i2,	%o6
	array16	%i4,	%i6,	%g7
	popc	0x060F,	%o4
	orncc	%o5,	0x0559,	%i7
	movvs	%icc,	%g5,	%i3
	addc	%l0,	%l3,	%l6
	xor	%g1,	%g2,	%l5
	subccc	%l1,	%l4,	%l2
	edge8n	%o3,	%g6,	%o1
	fcmple32	%f2,	%f16,	%g3
	edge8n	%i0,	%i1,	%o0
	fmovrslez	%i5,	%f26,	%f4
	movre	%o2,	0x142,	%o7
	fmovse	%icc,	%f25,	%f18
	fmovdg	%xcc,	%f31,	%f16
	fcmpes	%fcc0,	%f26,	%f16
	fmovrslz	%i2,	%f2,	%f21
	udivx	%o6,	0x1C05,	%g4
	sllx	%i6,	0x0D,	%i4
	fones	%f23
	fmovspos	%xcc,	%f14,	%f17
	fcmpgt32	%f24,	%f6,	%o4
	or	%o5,	%g7,	%i7
	ldx	[%l7 + 0x70],	%i3
	lduh	[%l7 + 0x2C],	%l0
	ldsb	[%l7 + 0x34],	%l3
	fmovda	%xcc,	%f11,	%f2
	ldx	[%l7 + 0x40],	%l6
	edge8n	%g1,	%g2,	%l5
	sdivx	%l1,	0x1841,	%l4
	orn	%l2,	%g5,	%g6
	addccc	%o1,	0x0DAF,	%g3
	andn	%i0,	0x0714,	%i1
	edge8	%o3,	%i5,	%o2
	sir	0x00DB
	edge8ln	%o7,	%i2,	%o6
	fpsub32s	%f15,	%f25,	%f28
	smul	%o0,	%i6,	%i4
	edge32n	%o4,	%o5,	%g7
	for	%f22,	%f18,	%f0
	udiv	%g4,	0x1116,	%i3
	fnot2s	%f6,	%f20
	fmul8sux16	%f6,	%f0,	%f6
	movle	%icc,	%i7,	%l3
	srlx	%l0,	0x05,	%l6
	smul	%g2,	%g1,	%l5
	orn	%l1,	%l4,	%l2
	stb	%g5,	[%l7 + 0x0D]
	nop
	set	0x54, %o7
	ldsw	[%l7 + %o7],	%o1
	edge32n	%g3,	%g6,	%i0
	fcmple16	%f14,	%f22,	%i1
	sdivx	%i5,	0x1E37,	%o2
	andcc	%o3,	%o7,	%o6
	smulcc	%i2,	0x0695,	%i6
	bshuffle	%f26,	%f6,	%f12
	mulx	%o0,	%i4,	%o5
	fcmpeq32	%f30,	%f8,	%g7
	andn	%g4,	%o4,	%i3
	save %i7, 0x1DE3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x58],	%l6
	sdiv	%g2,	0x0BB6,	%g1
	restore %l3, %l5, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovda	%xcc,	%f30,	%f4
	for	%f26,	%f30,	%f28
	or	%l4,	0x0CE9,	%g5
	fmovdcc	%icc,	%f4,	%f13
	orncc	%l2,	0x090B,	%o1
	fnor	%f2,	%f10,	%f0
	subc	%g6,	%g3,	%i1
	edge8ln	%i5,	%i0,	%o3
	nop
	set	0x28, %o5
	ldsh	[%l7 + %o5],	%o2
	fmovrdlez	%o7,	%f14,	%f16
	fpack16	%f24,	%f27
	stw	%o6,	[%l7 + 0x60]
	save %i6, %o0, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%i2,	0x03FE,	%o5
	smulcc	%g7,	%g4,	%i3
	nop
	set	0x58, %i4
	std	%f6,	[%l7 + %i4]
	fmovsle	%icc,	%f25,	%f5
	movpos	%icc,	%i7,	%l0
	sdivcc	%o4,	0x1736,	%g2
	edge8	%g1,	%l6,	%l5
	fmovdle	%icc,	%f29,	%f5
	edge32ln	%l1,	%l4,	%g5
	edge16ln	%l2,	%l3,	%o1
	movl	%icc,	%g3,	%g6
	sth	%i1,	[%l7 + 0x48]
	movrgz	%i5,	0x25C,	%o3
	ldx	[%l7 + 0x10],	%i0
	popc	%o2,	%o7
	sll	%o6,	%i6,	%i4
	xnor	%o0,	%i2,	%g7
	movrgz	%g4,	%i3,	%o5
	xorcc	%i7,	0x1EDE,	%o4
	alignaddr	%l0,	%g1,	%g2
	sdivcc	%l5,	0x06C2,	%l1
	fmovdpos	%icc,	%f29,	%f20
	udivx	%l4,	0x1233,	%l6
	movrne	%l2,	%g5,	%l3
	sdivcc	%o1,	0x1803,	%g3
	edge8l	%g6,	%i1,	%i5
	stb	%o3,	[%l7 + 0x27]
	subcc	%i0,	0x0BC5,	%o7
	movle	%xcc,	%o2,	%i6
	fcmpeq16	%f12,	%f26,	%i4
	fmovrdgz	%o0,	%f8,	%f24
	movpos	%xcc,	%o6,	%g7
	stx	%i2,	[%l7 + 0x20]
	edge8	%i3,	%o5,	%i7
	sll	%g4,	%o4,	%g1
	fmovda	%icc,	%f27,	%f3
	edge32l	%g2,	%l0,	%l5
	fxor	%f18,	%f26,	%f0
	fmovdge	%xcc,	%f1,	%f13
	srlx	%l4,	%l1,	%l6
	and	%g5,	0x0794,	%l3
	fxnor	%f26,	%f12,	%f10
	udivx	%l2,	0x1280,	%g3
	andncc	%o1,	%i1,	%g6
	sdivx	%i5,	0x17C9,	%o3
	sub	%o7,	%i0,	%i6
	fmovdleu	%icc,	%f31,	%f1
	smul	%i4,	%o2,	%o6
	edge8n	%g7,	%i2,	%i3
	stb	%o5,	[%l7 + 0x7C]
	fmovsvs	%icc,	%f26,	%f7
	fmovrdlz	%i7,	%f18,	%f20
	alignaddr	%o0,	%o4,	%g4
	smul	%g1,	%l0,	%l5
	nop
	set	0x58, %i1
	ldx	[%l7 + %i1],	%l4
	andcc	%g2,	%l1,	%g5
	xnor	%l6,	0x088F,	%l2
	array8	%g3,	%o1,	%i1
	edge16ln	%g6,	%i5,	%o3
	xorcc	%o7,	%i0,	%i6
	fmovsg	%icc,	%f30,	%f21
	st	%f7,	[%l7 + 0x4C]
	movrlz	%i4,	%l3,	%o6
	ldsh	[%l7 + 0x18],	%o2
	movn	%icc,	%g7,	%i2
	array16	%i3,	%o5,	%i7
	movleu	%xcc,	%o4,	%g4
	fandnot1s	%f22,	%f22,	%f24
	edge16ln	%g1,	%o0,	%l5
	subccc	%l4,	%l0,	%l1
	edge8	%g2,	%g5,	%l2
	ldub	[%l7 + 0x46],	%l6
	movg	%xcc,	%g3,	%o1
	popc	%g6,	%i1
	movre	%o3,	%o7,	%i0
	fabsd	%f30,	%f16
	std	%f18,	[%l7 + 0x68]
	subcc	%i5,	%i6,	%i4
	movrgz	%o6,	0x1C7,	%l3
	umul	%g7,	%o2,	%i2
	array16	%i3,	%i7,	%o4
	fnands	%f18,	%f27,	%f0
	movl	%xcc,	%g4,	%o5
	mulx	%o0,	0x1D0E,	%l5
	movg	%xcc,	%l4,	%g1
	fcmpeq16	%f22,	%f6,	%l1
	nop
	set	0x78, %g4
	stw	%l0,	[%l7 + %g4]
	ldd	[%l7 + 0x78],	%f28
	fxor	%f24,	%f10,	%f14
	fmovdcs	%xcc,	%f24,	%f22
	fornot2	%f8,	%f8,	%f18
	setx loop_19, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_19: 	udivcc	%g3,	0x1DD4,	%o1
	fpadd32	%f6,	%f26,	%f28
	movl	%icc,	%l6,	%g6
	fandnot2	%f20,	%f0,	%f18
	ldd	[%l7 + 0x40],	%f4
	subccc	%o3,	0x14AA,	%o7
	fxor	%f8,	%f18,	%f18
	andncc	%i1,	%i5,	%i0
	fmovdneg	%xcc,	%f13,	%f17
	fornot1s	%f3,	%f5,	%f2
	ldsb	[%l7 + 0x17],	%i6
	array16	%o6,	%i4,	%g7
	st	%f17,	[%l7 + 0x74]
	mulscc	%o2,	0x1DB6,	%i2
	ldd	[%l7 + 0x40],	%f20
	edge8ln	%i3,	%l3,	%i7
	movl	%icc,	%o4,	%o5
	std	%f22,	[%l7 + 0x78]
	sethi	0x0C3F,	%o0
	edge8	%g4,	%l4,	%g1
	subc	%l1,	%l5,	%g5
	fmovsa	%xcc,	%f31,	%f20
	array8	%g2,	%l2,	%l0
	fmovde	%xcc,	%f14,	%f19
	ldx	[%l7 + 0x40],	%g3
	sdivcc	%o1,	0x130E,	%g6
	lduw	[%l7 + 0x68],	%o3
	array32	%o7,	%i1,	%i5
	srl	%i0,	0x01,	%l6
	fexpand	%f17,	%f16
	movrgz	%i6,	%i4,	%g7
	udivcc	%o2,	0x1460,	%o6
	fmovsle	%icc,	%f13,	%f14
	fmovrslz	%i2,	%f17,	%f19
	mulx	%i3,	%l3,	%o4
	movn	%xcc,	%o5,	%o0
	fmovdg	%xcc,	%f15,	%f1
	movne	%icc,	%g4,	%i7
	fmovsvs	%icc,	%f21,	%f16
	andcc	%l4,	%l1,	%l5
	fmovd	%f28,	%f28
	ldsb	[%l7 + 0x7A],	%g5
	std	%f26,	[%l7 + 0x60]
	fnor	%f18,	%f14,	%f16
	alignaddrl	%g2,	%l2,	%l0
	ldsw	[%l7 + 0x68],	%g3
	udivx	%o1,	0x17A0,	%g1
	andncc	%o3,	%o7,	%g6
	sdivx	%i1,	0x0888,	%i5
	sub	%l6,	%i6,	%i0
	movgu	%icc,	%g7,	%i4
	ldd	[%l7 + 0x20],	%o2
	movne	%icc,	%o6,	%i3
	lduh	[%l7 + 0x4E],	%l3
	edge32ln	%i2,	%o5,	%o4
	sub	%o0,	0x0AE2,	%i7
	andncc	%g4,	%l4,	%l5
	andncc	%g5,	%l1,	%g2
	srl	%l2,	%g3,	%l0
	nop
	set	0x0E, %g2
	lduh	[%l7 + %g2],	%o1
	add	%o3,	%o7,	%g6
	movge	%xcc,	%g1,	%i1
	addccc	%i5,	0x0D7B,	%i6
	sll	%l6,	0x1F,	%i0
	fornot1	%f28,	%f12,	%f8
	edge16l	%g7,	%i4,	%o6
	edge8n	%o2,	%l3,	%i3
	ldsb	[%l7 + 0x18],	%o5
	popc	0x0E07,	%o4
	addcc	%i2,	%o0,	%g4
	save %i7, 0x0BB2, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%g5,	%l1,	%l4
	addcc	%g2,	%g3,	%l2
	sll	%l0,	0x0E,	%o1
	fmul8sux16	%f14,	%f18,	%f30
	movrlez	%o7,	0x3A5,	%o3
	fmovdleu	%icc,	%f19,	%f19
	sdivx	%g1,	0x1024,	%i1
	array16	%i5,	%i6,	%l6
	sll	%g6,	%i0,	%g7
	restore %o6, 0x0E9A, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%xcc,	%l3,	%i3
	xor	%o5,	0x1265,	%o2
	siam	0x1
	sllx	%o4,	0x09,	%o0
	save %i2, %i7, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%icc,	%f11,	%f24
	sth	%l5,	[%l7 + 0x64]
	ldsh	[%l7 + 0x7A],	%g5
	movleu	%icc,	%l4,	%g2
	movn	%xcc,	%g3,	%l2
	movneg	%icc,	%l1,	%l0
	fmovsn	%xcc,	%f31,	%f20
	fmovd	%f2,	%f26
	lduh	[%l7 + 0x38],	%o1
	ldsh	[%l7 + 0x1C],	%o7
	fmovdneg	%xcc,	%f0,	%f13
	array32	%o3,	%g1,	%i1
	and	%i5,	0x07F0,	%l6
	move	%xcc,	%i6,	%i0
	stx	%g7,	[%l7 + 0x48]
	srax	%o6,	%g6,	%i4
	addccc	%i3,	0x0A1E,	%o5
	andcc	%l3,	0x1B94,	%o2
	umulcc	%o0,	%i2,	%i7
	movne	%xcc,	%o4,	%g4
	sir	0x162C
	srl	%l5,	%g5,	%g2
	movpos	%xcc,	%g3,	%l4
	alignaddr	%l2,	%l0,	%o1
	array8	%l1,	%o3,	%g1
	mulx	%o7,	%i5,	%l6
	mulx	%i6,	%i1,	%i0
	xnorcc	%o6,	0x108C,	%g6
	sub	%i4,	%g7,	%i3
	lduw	[%l7 + 0x34],	%l3
	udivx	%o5,	0x0572,	%o0
	stb	%i2,	[%l7 + 0x17]
	smulcc	%i7,	0x05E9,	%o2
	fornot1s	%f6,	%f13,	%f7
	mova	%icc,	%g4,	%l5
	mulx	%o4,	0x084D,	%g5
	fmovdvs	%icc,	%f27,	%f0
	fmovsn	%xcc,	%f13,	%f3
	fornot1s	%f8,	%f9,	%f7
	movre	%g3,	0x25F,	%l4
	fmul8sux16	%f28,	%f24,	%f22
	subc	%l2,	%l0,	%o1
	nop
	set	0x68, %o2
	ldd	[%l7 + %o2],	%g2
	xnor	%o3,	%l1,	%g1
	fmovrslez	%o7,	%f31,	%f4
	umulcc	%i5,	0x1333,	%i6
	sdiv	%i1,	0x1664,	%l6
	edge32l	%o6,	%g6,	%i0
	fcmpeq32	%f14,	%f6,	%g7
	sethi	0x118D,	%i3
	smul	%i4,	0x0B8F,	%o5
	move	%icc,	%l3,	%i2
	addccc	%i7,	%o0,	%g4
	fabsd	%f20,	%f10
	fornot1s	%f6,	%f1,	%f1
	fnot2s	%f31,	%f11
	fandnot2	%f24,	%f12,	%f2
	stb	%o2,	[%l7 + 0x78]
	fexpand	%f25,	%f6
	fzeros	%f14
	smulcc	%o4,	%g5,	%l5
	ldub	[%l7 + 0x74],	%g3
	smul	%l4,	0x0901,	%l2
	andcc	%o1,	0x1DEC,	%g2
	edge16l	%l0,	%l1,	%g1
	ldub	[%l7 + 0x53],	%o7
	fnot1	%f18,	%f14
	fmovsl	%icc,	%f22,	%f28
	udiv	%o3,	0x1205,	%i6
	fmovrslz	%i5,	%f26,	%f15
	faligndata	%f0,	%f22,	%f30
	fnors	%f31,	%f8,	%f6
	udivcc	%l6,	0x0A08,	%i1
	movge	%xcc,	%g6,	%i0
	sllx	%g7,	0x07,	%i3
	udivcc	%i4,	0x1295,	%o6
	fmovspos	%icc,	%f19,	%f12
	ld	[%l7 + 0x30],	%f9
	fmovs	%f13,	%f21
	subccc	%l3,	0x0859,	%i2
	fabss	%f9,	%f26
	sdivcc	%i7,	0x00EF,	%o5
	movl	%icc,	%o0,	%g4
	srlx	%o4,	0x0A,	%o2
	stw	%l5,	[%l7 + 0x64]
	movn	%icc,	%g3,	%l4
	edge16ln	%l2,	%g5,	%o1
	sth	%l0,	[%l7 + 0x64]
	movvc	%xcc,	%l1,	%g1
	fnegd	%f2,	%f14
	xnor	%g2,	%o7,	%o3
	lduh	[%l7 + 0x18],	%i5
	fmovsn	%xcc,	%f5,	%f17
	udivx	%i6,	0x1659,	%i1
	subcc	%l6,	%g6,	%g7
	orn	%i3,	0x083B,	%i0
	fone	%f14
	udivx	%i4,	0x146A,	%o6
	edge8ln	%i2,	%i7,	%l3
	xnorcc	%o0,	0x13BA,	%g4
	edge16ln	%o5,	%o2,	%o4
	movn	%xcc,	%g3,	%l5
	edge32ln	%l2,	%l4,	%o1
	edge8ln	%l0,	%l1,	%g5
	xnorcc	%g2,	%o7,	%o3
	fmovsne	%xcc,	%f18,	%f19
	sethi	0x06CD,	%i5
	srax	%g1,	%i1,	%l6
	sdivcc	%i6,	0x0CF4,	%g6
	movn	%xcc,	%i3,	%i0
	edge16	%i4,	%g7,	%i2
	fpadd32s	%f18,	%f12,	%f21
	lduw	[%l7 + 0x38],	%i7
	movvc	%xcc,	%l3,	%o6
	st	%f11,	[%l7 + 0x54]
	udiv	%o0,	0x0AE3,	%o5
	fmovsgu	%xcc,	%f28,	%f22
	add	%g4,	0x14CF,	%o2
	edge32	%o4,	%g3,	%l2
	srlx	%l5,	%l4,	%o1
	std	%f20,	[%l7 + 0x20]
	fmovsgu	%icc,	%f12,	%f28
	movre	%l1,	%l0,	%g5
	stw	%g2,	[%l7 + 0x64]
	movgu	%xcc,	%o7,	%i5
	ldsw	[%l7 + 0x44],	%o3
	sdiv	%g1,	0x1311,	%i1
	fcmple32	%f4,	%f28,	%i6
	edge16ln	%l6,	%g6,	%i3
	fcmps	%fcc2,	%f24,	%f30
	smulcc	%i0,	%i4,	%g7
	addc	%i7,	0x1CB3,	%l3
	fzeros	%f10
	array16	%i2,	%o0,	%o5
	edge32ln	%o6,	%g4,	%o2
	subc	%o4,	%g3,	%l2
	edge16	%l5,	%o1,	%l1
	movrgz	%l0,	%g5,	%l4
	subcc	%g2,	0x08AC,	%o7
	fcmpne32	%f4,	%f20,	%i5
	for	%f6,	%f16,	%f24
	fmovse	%icc,	%f24,	%f25
	array16	%g1,	%o3,	%i1
	sub	%l6,	0x07FE,	%i6
	edge32ln	%g6,	%i0,	%i3
	movre	%i4,	%i7,	%g7
	udiv	%i2,	0x15DC,	%l3
	sir	0x19BE
	udiv	%o0,	0x1EE1,	%o6
	fmovrsgz	%o5,	%f31,	%f25
	srl	%g4,	%o4,	%o2
	edge16n	%g3,	%l5,	%l2
	fcmpne32	%f10,	%f8,	%o1
	sdivx	%l0,	0x0F0D,	%l1
	umulcc	%l4,	%g5,	%g2
	addcc	%i5,	0x00B0,	%o7
	edge16ln	%o3,	%g1,	%i1
	fmovdle	%xcc,	%f26,	%f15
	fcmped	%fcc0,	%f12,	%f28
	orcc	%l6,	%i6,	%g6
	movgu	%xcc,	%i0,	%i3
	mulx	%i7,	%g7,	%i4
	sllx	%l3,	%o0,	%o6
	fmovdl	%icc,	%f2,	%f19
	std	%f22,	[%l7 + 0x48]
	fmovdn	%icc,	%f29,	%f22
	sra	%o5,	%g4,	%i2
	array16	%o2,	%g3,	%o4
	mulx	%l2,	%o1,	%l0
	orcc	%l5,	%l1,	%g5
	movne	%xcc,	%l4,	%g2
	fmovrsne	%i5,	%f4,	%f29
	ldx	[%l7 + 0x68],	%o7
	alignaddr	%g1,	%i1,	%l6
	fmovrsgez	%i6,	%f20,	%f4
	udivx	%o3,	0x0348,	%g6
	andncc	%i3,	%i7,	%i0
	srlx	%i4,	%l3,	%g7
	nop
	set	0x6C, %o3
	ldsw	[%l7 + %o3],	%o0
	udiv	%o5,	0x1478,	%o6
	alignaddr	%g4,	%i2,	%g3
	xnorcc	%o2,	%l2,	%o1
	mova	%xcc,	%o4,	%l0
	movrlz	%l1,	%l5,	%g5
	xnor	%g2,	%l4,	%i5
	edge16l	%o7,	%i1,	%g1
	nop
	set	0x44, %g5
	ldsw	[%l7 + %g5],	%l6
	xorcc	%i6,	0x0531,	%o3
	popc	0x0B8A,	%i3
	fpsub16	%f20,	%f28,	%f28
	ld	[%l7 + 0x18],	%f25
	alignaddrl	%i7,	%i0,	%g6
	xnorcc	%i4,	0x0769,	%l3
	smulcc	%o0,	%o5,	%g7
	sth	%g4,	[%l7 + 0x7E]
	umulcc	%o6,	0x0065,	%i2
	movrne	%g3,	0x066,	%l2
	addcc	%o2,	%o4,	%l0
	edge16n	%l1,	%o1,	%l5
	sub	%g5,	0x1682,	%g2
	xor	%i5,	%o7,	%i1
	edge32	%l4,	%g1,	%l6
	ldsw	[%l7 + 0x7C],	%o3
	ldsb	[%l7 + 0x78],	%i6
	move	%icc,	%i7,	%i0
	sra	%i3,	%i4,	%l3
	addc	%g6,	%o5,	%o0
	alignaddrl	%g4,	%o6,	%g7
	movleu	%icc,	%i2,	%g3
	ldd	[%l7 + 0x40],	%o2
	movcc	%icc,	%o4,	%l0
	ld	[%l7 + 0x64],	%f16
	xor	%l2,	0x181D,	%o1
	setx loop_20, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_20: 	fand	%f4,	%f12,	%f18
	udiv	%g5,	0x07F4,	%o7
	ldd	[%l7 + 0x38],	%f16
	ldsh	[%l7 + 0x3E],	%i1
	movle	%icc,	%l4,	%g1
	ldsh	[%l7 + 0x54],	%l6
	edge32	%o3,	%i5,	%i6
	movvs	%xcc,	%i7,	%i3
	subc	%i0,	%l3,	%g6
	fmovdle	%xcc,	%f31,	%f10
	andcc	%i4,	%o0,	%o5
	movrne	%o6,	0x1C3,	%g4
	fmovrslez	%i2,	%f20,	%f1
	save %g3, %o2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	move	%icc,	%l0,	%l2
	ldx	[%l7 + 0x38],	%o4
	fcmpne32	%f14,	%f24,	%o1
	sir	0x15A2
	sllx	%l1,	%g2,	%g5
	movge	%xcc,	%l5,	%i1
	edge32	%l4,	%o7,	%l6
	udiv	%o3,	0x0354,	%g1
	movrgz	%i6,	0x360,	%i5
	sra	%i3,	0x15,	%i7
	array16	%i0,	%l3,	%i4
	fmovdl	%icc,	%f6,	%f15
	movvs	%icc,	%o0,	%g6
	fandnot2s	%f24,	%f3,	%f2
	orn	%o5,	0x1AAF,	%g4
	fzeros	%f29
	edge16	%i2,	%o6,	%g3
	movvs	%icc,	%g7,	%o2
	xor	%l0,	%o4,	%l2
	fmovscs	%xcc,	%f19,	%f6
	edge8ln	%l1,	%o1,	%g5
	fmovdl	%xcc,	%f13,	%f28
	addc	%g2,	0x0FFF,	%l5
	fpadd16	%f8,	%f28,	%f30
	movle	%icc,	%l4,	%i1
	fmuld8ulx16	%f13,	%f15,	%f10
	st	%f25,	[%l7 + 0x5C]
	addc	%l6,	%o7,	%g1
	fcmple32	%f14,	%f16,	%o3
	fcmpgt16	%f8,	%f2,	%i6
	move	%icc,	%i5,	%i7
	sllx	%i0,	%i3,	%l3
	xorcc	%i4,	%g6,	%o0
	sub	%g4,	0x0A65,	%i2
	fnands	%f9,	%f17,	%f1
	smulcc	%o5,	0x05DB,	%o6
	movn	%xcc,	%g7,	%o2
	subcc	%g3,	%o4,	%l2
	fmovrslz	%l1,	%f10,	%f25
	andncc	%o1,	%g5,	%l0
	orcc	%l5,	%g2,	%i1
	sth	%l6,	[%l7 + 0x30]
	fpsub32	%f0,	%f30,	%f26
	move	%xcc,	%l4,	%o7
	movvc	%icc,	%o3,	%i6
	andn	%g1,	0x0243,	%i7
	movcs	%icc,	%i0,	%i5
	movvc	%icc,	%i3,	%l3
	sethi	0x0322,	%g6
	sir	0x0959
	movgu	%xcc,	%o0,	%i4
	movcc	%xcc,	%g4,	%i2
	fpadd32s	%f22,	%f20,	%f22
	edge16ln	%o5,	%g7,	%o2
	udiv	%g3,	0x06A4,	%o4
	fxnors	%f24,	%f11,	%f6
	movge	%icc,	%o6,	%l2
	fsrc2	%f28,	%f12
	siam	0x1
	nop
	set	0x67, %i6
	ldub	[%l7 + %i6],	%l1
	ldd	[%l7 + 0x60],	%f30
	fmovdl	%xcc,	%f16,	%f18
	sub	%g5,	0x1851,	%o1
	nop
	set	0x18, %o1
	lduw	[%l7 + %o1],	%l0
	sllx	%g2,	%i1,	%l6
	subc	%l5,	%l4,	%o7
	restore %i6, 0x0D59, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sethi	0x0A39,	%i7
	xnorcc	%o3,	0x0B5C,	%i0
	umulcc	%i5,	0x1031,	%i3
	movcs	%xcc,	%g6,	%o0
	xor	%i4,	%l3,	%i2
	sll	%o5,	%g7,	%o2
	fornot1	%f18,	%f4,	%f2
	fmovrse	%g4,	%f31,	%f26
	sra	%o4,	%g3,	%l2
	movrlz	%o6,	%g5,	%o1
	edge32l	%l0,	%l1,	%g2
	fpack16	%f8,	%f6
	umulcc	%i1,	%l6,	%l5
	sll	%o7,	%i6,	%l4
	addccc	%g1,	%i7,	%i0
	stb	%o3,	[%l7 + 0x11]
	sdivx	%i3,	0x0F83,	%i5
	edge16ln	%g6,	%o0,	%l3
	srax	%i2,	%o5,	%g7
	ldsb	[%l7 + 0x36],	%i4
	movgu	%icc,	%o2,	%g4
	orcc	%g3,	0x1C93,	%l2
	subccc	%o6,	%g5,	%o4
	srlx	%o1,	0x00,	%l1
	fmovsl	%icc,	%f10,	%f31
	stb	%l0,	[%l7 + 0x56]
	orcc	%i1,	0x037F,	%l6
	mova	%icc,	%g2,	%l5
	move	%xcc,	%i6,	%o7
	addccc	%g1,	0x18F5,	%i7
	fmovsneg	%icc,	%f20,	%f28
	edge32l	%i0,	%l4,	%o3
	array32	%i5,	%g6,	%o0
	sub	%i3,	%l3,	%i2
	fmovdpos	%xcc,	%f20,	%f3
	movg	%icc,	%o5,	%i4
	lduh	[%l7 + 0x1C],	%o2
	ldx	[%l7 + 0x08],	%g7
	movl	%icc,	%g4,	%l2
	fcmpeq32	%f14,	%f26,	%o6
	xnor	%g3,	0x1420,	%g5
	edge32ln	%o1,	%l1,	%o4
	movle	%icc,	%l0,	%l6
	mulscc	%g2,	%l5,	%i6
	sub	%i1,	0x19AE,	%g1
	movrgz	%o7,	0x2FE,	%i0
	ldub	[%l7 + 0x3A],	%i7
	fnot1s	%f7,	%f11
	sethi	0x08E7,	%l4
	orncc	%o3,	%g6,	%o0
	movle	%xcc,	%i3,	%i5
	xorcc	%i2,	0x1A6A,	%l3
	fornot1s	%f16,	%f27,	%f27
	sth	%o5,	[%l7 + 0x72]
	umul	%o2,	%g7,	%g4
	fmovrdgez	%l2,	%f4,	%f12
	movgu	%icc,	%i4,	%o6
	edge32ln	%g3,	%o1,	%l1
	movcc	%xcc,	%g5,	%l0
	edge16l	%l6,	%o4,	%g2
	edge32n	%l5,	%i6,	%i1
	lduw	[%l7 + 0x40],	%g1
	fsrc1	%f30,	%f0
	movge	%icc,	%o7,	%i7
	andcc	%i0,	%o3,	%l4
	fmovscs	%xcc,	%f28,	%f22
	alignaddrl	%o0,	%g6,	%i5
	fcmpne32	%f14,	%f8,	%i3
	fpadd32	%f24,	%f20,	%f2
	subc	%l3,	0x09BC,	%o5
	addcc	%o2,	%g7,	%i2
	fornot2	%f12,	%f12,	%f2
	fcmped	%fcc0,	%f4,	%f2
	ldsw	[%l7 + 0x1C],	%g4
	srl	%i4,	0x0E,	%o6
	fmovsn	%icc,	%f15,	%f4
	fornot2	%f10,	%f16,	%f24
	movge	%icc,	%l2,	%g3
	and	%l1,	0x138B,	%g5
	sdiv	%o1,	0x0FF8,	%l6
	fmul8ulx16	%f6,	%f18,	%f4
	ld	[%l7 + 0x18],	%f18
	for	%f14,	%f24,	%f20
	edge16	%l0,	%o4,	%l5
	movvs	%xcc,	%g2,	%i6
	fandnot1s	%f15,	%f27,	%f21
	edge32	%g1,	%o7,	%i1
	lduh	[%l7 + 0x72],	%i7
	fmovrdlz	%o3,	%f28,	%f4
	movrgz	%i0,	%o0,	%l4
	lduh	[%l7 + 0x0C],	%i5
	lduh	[%l7 + 0x52],	%i3
	fmovsleu	%xcc,	%f12,	%f24
	lduh	[%l7 + 0x78],	%g6
	ldsb	[%l7 + 0x0A],	%o5
	fmovsleu	%xcc,	%f20,	%f5
	fmovsgu	%icc,	%f27,	%f16
	andn	%o2,	%l3,	%g7
	fnands	%f29,	%f23,	%f3
	edge32ln	%g4,	%i2,	%o6
	movcs	%xcc,	%i4,	%l2
	edge16	%g3,	%g5,	%o1
	fpackfix	%f26,	%f14
	fone	%f2
	ldd	[%l7 + 0x38],	%i6
	sub	%l1,	%l0,	%l5
	std	%f4,	[%l7 + 0x50]
	subc	%o4,	0x15B9,	%i6
	fcmple16	%f30,	%f16,	%g2
	fmovdvs	%xcc,	%f16,	%f21
	ldx	[%l7 + 0x10],	%o7
	orcc	%i1,	0x0BAC,	%i7
	movneg	%xcc,	%o3,	%g1
	fzero	%f22
	movre	%o0,	0x118,	%l4
	sll	%i0,	0x13,	%i5
	edge8n	%g6,	%o5,	%i3
	sllx	%o2,	%g7,	%l3
	setx loop_21, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_21: 	movrne	%o6,	0x039,	%l2
	nop
	set	0x50, %o6
	ldd	[%l7 + %o6],	%g2
	xnorcc	%g5,	0x1BC3,	%i4
	fmovsa	%icc,	%f9,	%f8
	sir	0x0316
	movneg	%icc,	%o1,	%l1
	fmovrsgez	%l6,	%f10,	%f23
	udivx	%l0,	0x1613,	%o4
	movrgz	%l5,	0x2C5,	%i6
	ldsb	[%l7 + 0x30],	%o7
	stb	%g2,	[%l7 + 0x30]
	mulx	%i1,	%o3,	%g1
	fcmps	%fcc1,	%f26,	%f28
	umul	%i7,	0x026F,	%o0
	movcc	%icc,	%i0,	%i5
	edge8ln	%l4,	%g6,	%i3
	nop
	set	0x7E, %l3
	lduh	[%l7 + %l3],	%o5
	ldsw	[%l7 + 0x2C],	%g7
	andn	%o2,	%i2,	%l3
	fmul8x16al	%f24,	%f13,	%f8
	fmovspos	%icc,	%f16,	%f24
	ldub	[%l7 + 0x70],	%g4
	movn	%xcc,	%l2,	%o6
	fnegs	%f3,	%f15
	fornot2s	%f23,	%f22,	%f28
	sth	%g5,	[%l7 + 0x74]
	fmovde	%icc,	%f23,	%f4
	ldsh	[%l7 + 0x3C],	%g3
	edge16ln	%o1,	%l1,	%l6
	or	%l0,	%i4,	%l5
	srl	%i6,	%o4,	%g2
	alignaddr	%i1,	%o3,	%g1
	alignaddr	%o7,	%o0,	%i7
	ldd	[%l7 + 0x58],	%f8
	orn	%i0,	%l4,	%g6
	umul	%i5,	0x16C9,	%o5
	std	%f4,	[%l7 + 0x70]
	srl	%g7,	%o2,	%i3
	edge32n	%i2,	%g4,	%l2
	sdivcc	%o6,	0x1911,	%g5
	fxnor	%f6,	%f6,	%f28
	movre	%l3,	0x371,	%g3
	movrlz	%o1,	0x1C9,	%l6
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%l0
	move	%xcc,	%l1,	%i4
	save %i6, 0x1BA6, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsn	%xcc,	%f27,	%f29
	andcc	%g2,	%i1,	%l5
	mova	%xcc,	%o3,	%g1
	sth	%o0,	[%l7 + 0x1E]
	popc	0x1FD4,	%o7
	fnand	%f0,	%f30,	%f28
	sir	0x0AE7
	movcc	%xcc,	%i0,	%i7
	sdivx	%l4,	0x11E3,	%g6
	fpadd32	%f22,	%f6,	%f22
	fcmped	%fcc2,	%f26,	%f20
	edge16n	%o5,	%g7,	%i5
	mulx	%o2,	%i3,	%i2
	udiv	%g4,	0x13AA,	%o6
	array8	%g5,	%l2,	%g3
	xnor	%o1,	%l3,	%l6
	fpsub32	%f6,	%f12,	%f4
	sir	0x1073
	udivcc	%l0,	0x1D1C,	%l1
	fcmpeq16	%f30,	%f2,	%i6
	ldsb	[%l7 + 0x76],	%o4
	alignaddrl	%i4,	%g2,	%l5
	fmovdneg	%icc,	%f20,	%f10
	sll	%o3,	0x0D,	%i1
	sdivx	%o0,	0x166A,	%o7
	fpadd16	%f4,	%f24,	%f18
	movn	%xcc,	%i0,	%g1
	fxors	%f9,	%f8,	%f14
	add	%l4,	%i7,	%g6
	fornot2s	%f14,	%f3,	%f7
	orcc	%o5,	0x067A,	%g7
	or	%o2,	%i5,	%i3
	movvs	%icc,	%g4,	%o6
	movcc	%xcc,	%g5,	%l2
	movpos	%icc,	%i2,	%o1
	movneg	%xcc,	%g3,	%l6
	sra	%l3,	%l1,	%i6
	fnand	%f24,	%f10,	%f6
	fmovse	%xcc,	%f12,	%f9
	sth	%l0,	[%l7 + 0x72]
	fmovscc	%icc,	%f17,	%f2
	subc	%o4,	%i4,	%g2
	movneg	%icc,	%l5,	%o3
	fmovsgu	%icc,	%f19,	%f21
	edge8n	%i1,	%o7,	%o0
	fpsub16s	%f19,	%f23,	%f17
	smul	%g1,	%i0,	%l4
	popc	0x079F,	%g6
	udivcc	%o5,	0x0D63,	%g7
	sdivx	%i7,	0x1624,	%i5
	addccc	%i3,	%o2,	%g4
	std	%f28,	[%l7 + 0x50]
	ldsw	[%l7 + 0x7C],	%g5
	xor	%o6,	%l2,	%i2
	fmovspos	%xcc,	%f6,	%f27
	st	%f2,	[%l7 + 0x10]
	sub	%o1,	0x05CF,	%l6
	fmovse	%icc,	%f3,	%f28
	xor	%g3,	0x15C7,	%l3
	fpack16	%f22,	%f28
	orncc	%i6,	%l1,	%o4
	sdivx	%i4,	0x11E9,	%g2
	fmovdcs	%icc,	%f6,	%f16
	xnorcc	%l5,	0x1E13,	%l0
	sethi	0x00F8,	%o3
	umulcc	%o7,	0x0527,	%i1
	edge32	%g1,	%o0,	%i0
	fcmpne16	%f8,	%f22,	%g6
	fmovrdlez	%o5,	%f16,	%f12
	andcc	%g7,	%l4,	%i5
	udiv	%i7,	0x0159,	%o2
	ld	[%l7 + 0x74],	%f21
	alignaddr	%g4,	%g5,	%i3
	movpos	%icc,	%o6,	%l2
	fmovrslez	%o1,	%f17,	%f17
	sub	%i2,	0x1B91,	%l6
	addccc	%g3,	%i6,	%l3
	stb	%o4,	[%l7 + 0x56]
	movrlz	%l1,	0x3EB,	%g2
	edge16l	%i4,	%l5,	%l0
	fmovse	%xcc,	%f2,	%f28
	nop
	set	0x70, %l0
	ldx	[%l7 + %l0],	%o7
	fmovspos	%icc,	%f7,	%f15
	sllx	%o3,	%g1,	%i1
	array32	%i0,	%g6,	%o0
	mulx	%o5,	0x0FEF,	%g7
	movvc	%xcc,	%l4,	%i7
	edge16	%i5,	%o2,	%g5
	edge16l	%g4,	%i3,	%l2
	subc	%o6,	0x0A86,	%o1
	sub	%i2,	%g3,	%i6
	move	%icc,	%l3,	%o4
	ld	[%l7 + 0x4C],	%f4
	xnorcc	%l1,	%g2,	%l6
	fors	%f11,	%f1,	%f27
	subccc	%i4,	%l5,	%o7
	fcmpgt32	%f6,	%f2,	%l0
	addcc	%g1,	0x00F2,	%i1
	array32	%i0,	%g6,	%o0
	subcc	%o5,	0x060A,	%o3
	sdivcc	%g7,	0x1C14,	%l4
	st	%f22,	[%l7 + 0x64]
	ldsw	[%l7 + 0x2C],	%i7
	fcmpes	%fcc1,	%f21,	%f3
	lduh	[%l7 + 0x20],	%o2
	st	%f13,	[%l7 + 0x0C]
	ldx	[%l7 + 0x60],	%i5
	edge16	%g5,	%i3,	%l2
	edge32	%o6,	%o1,	%g4
	movvs	%xcc,	%i2,	%g3
	edge32ln	%l3,	%i6,	%o4
	array8	%l1,	%l6,	%g2
	lduh	[%l7 + 0x60],	%l5
	movl	%icc,	%o7,	%l0
	fzeros	%f0
	movrlez	%i4,	%g1,	%i0
	fnot1	%f24,	%f16
	edge16l	%i1,	%o0,	%g6
	movle	%icc,	%o3,	%o5
	sethi	0x0598,	%g7
	edge32	%l4,	%o2,	%i7
	fcmpes	%fcc0,	%f5,	%f21
	movvs	%icc,	%i5,	%g5
	array32	%l2,	%i3,	%o1
	orcc	%g4,	%o6,	%i2
	movn	%xcc,	%g3,	%l3
	subc	%i6,	%l1,	%l6
	edge16n	%o4,	%l5,	%g2
	fone	%f0
	andncc	%l0,	%i4,	%o7
	addc	%i0,	%g1,	%i1
	add	%g6,	%o3,	%o5
	umulcc	%o0,	%g7,	%l4
	edge8ln	%o2,	%i7,	%g5
	fcmpgt16	%f26,	%f24,	%l2
	ldsh	[%l7 + 0x56],	%i3
	array16	%o1,	%i5,	%g4
	nop
	set	0x2C, %g7
	ldsh	[%l7 + %g7],	%i2
	movg	%icc,	%g3,	%l3
	addccc	%o6,	0x081F,	%i6
	fcmpes	%fcc2,	%f5,	%f18
	movrgz	%l6,	0x336,	%l1
	fandnot2s	%f1,	%f6,	%f23
	fpsub16	%f4,	%f10,	%f28
	sethi	0x0CF2,	%l5
	sth	%g2,	[%l7 + 0x18]
	movne	%icc,	%o4,	%l0
	fcmpne16	%f10,	%f14,	%i4
	subccc	%i0,	0x0794,	%o7
	edge8ln	%g1,	%i1,	%g6
	fabsd	%f8,	%f4
	lduh	[%l7 + 0x2A],	%o3
	movne	%xcc,	%o0,	%o5
	add	%l4,	0x01A2,	%o2
	movne	%xcc,	%g7,	%g5
	edge16n	%i7,	%i3,	%l2
	xor	%o1,	0x13BA,	%i5
	fmovdgu	%icc,	%f10,	%f10
	srlx	%i2,	0x10,	%g4
	fsrc1	%f10,	%f24
	sethi	0x07EC,	%g3
	fmovde	%icc,	%f26,	%f20
	fnegd	%f20,	%f12
	movvs	%icc,	%l3,	%i6
	fandnot2	%f24,	%f10,	%f28
	array16	%o6,	%l6,	%l1
	stw	%g2,	[%l7 + 0x24]
	fmovrslz	%l5,	%f17,	%f30
	andcc	%o4,	%l0,	%i0
	popc	%o7,	%i4
	xnor	%i1,	%g6,	%o3
	xorcc	%o0,	%o5,	%g1
	movrlz	%o2,	%g7,	%g5
	ldd	[%l7 + 0x20],	%l4
	fmovsa	%xcc,	%f10,	%f21
	smulcc	%i3,	0x1E1E,	%i7
	ldd	[%l7 + 0x70],	%l2
	fmovsn	%icc,	%f28,	%f13
	stb	%i5,	[%l7 + 0x0B]
	movrlz	%o1,	%i2,	%g4
	bshuffle	%f18,	%f26,	%f8
	edge8n	%l3,	%i6,	%g3
	ld	[%l7 + 0x40],	%f30
	fxor	%f10,	%f18,	%f2
	and	%o6,	%l1,	%l6
	fpmerge	%f10,	%f8,	%f2
	fmovdcs	%icc,	%f16,	%f2
	mova	%icc,	%g2,	%o4
	ldd	[%l7 + 0x30],	%f6
	add	%l0,	%i0,	%l5
	fxor	%f26,	%f12,	%f28
	orn	%i4,	%i1,	%o7
	addcc	%o3,	%g6,	%o0
	orncc	%o5,	0x1BD1,	%o2
	sra	%g7,	0x0E,	%g1
	st	%f2,	[%l7 + 0x20]
	mova	%icc,	%g5,	%i3
	ldsw	[%l7 + 0x08],	%l4
	fpadd16	%f22,	%f12,	%f6
	fpack16	%f16,	%f2
	movvs	%icc,	%l2,	%i7
	std	%f22,	[%l7 + 0x78]
	sth	%o1,	[%l7 + 0x6C]
	mova	%xcc,	%i2,	%g4
	sll	%i5,	%l3,	%i6
	ldsh	[%l7 + 0x18],	%o6
	fexpand	%f20,	%f0
	edge8ln	%l1,	%l6,	%g3
	movvc	%icc,	%o4,	%g2
	movrlez	%i0,	0x2C5,	%l0
	fpsub32	%f2,	%f0,	%f26
	alignaddrl	%l5,	%i1,	%i4
	alignaddr	%o3,	%g6,	%o7
	fcmpne16	%f28,	%f24,	%o0
	movvc	%xcc,	%o2,	%o5
	fzeros	%f28
	movg	%icc,	%g7,	%g1
	edge32	%i3,	%l4,	%l2
	fmovrsgez	%g5,	%f3,	%f5
	fmovsleu	%icc,	%f4,	%f27
	xor	%o1,	0x183B,	%i7
	udivcc	%g4,	0x0AE9,	%i5
	addcc	%i2,	%i6,	%o6
	sdivx	%l3,	0x1D94,	%l1
	movpos	%icc,	%g3,	%l6
	udivcc	%g2,	0x062F,	%i0
	andncc	%l0,	%o4,	%l5
	umul	%i1,	0x0930,	%i4
	orn	%g6,	0x09B5,	%o3
	and	%o0,	0x0735,	%o2
	fmul8sux16	%f4,	%f16,	%f14
	movge	%xcc,	%o5,	%g7
	movrlz	%g1,	%i3,	%o7
	edge8l	%l2,	%g5,	%l4
	array8	%i7,	%g4,	%o1
	mulx	%i2,	%i6,	%o6
	fmovsle	%xcc,	%f8,	%f11
	fzero	%f18
	fpsub32	%f28,	%f16,	%f8
	fmovsl	%xcc,	%f8,	%f28
	sdivcc	%l3,	0x1A71,	%i5
	fpackfix	%f14,	%f2
	fmovsn	%icc,	%f25,	%f31
	fsrc1	%f0,	%f30
	sir	0x1B05
	for	%f28,	%f28,	%f22
	fnot2	%f28,	%f6
	st	%f10,	[%l7 + 0x6C]
	mulx	%l1,	%l6,	%g3
	movrne	%g2,	0x042,	%i0
	edge16l	%l0,	%o4,	%l5
	xnor	%i4,	0x1077,	%i1
	edge32	%g6,	%o3,	%o2
	andcc	%o5,	%o0,	%g1
	fmovdcs	%icc,	%f23,	%f28
	fmovsvc	%xcc,	%f29,	%f15
	fmul8x16al	%f12,	%f0,	%f20
	fpadd32s	%f9,	%f13,	%f21
	mulscc	%i3,	%o7,	%l2
	and	%g7,	%l4,	%i7
	sdiv	%g5,	0x05AB,	%o1
	edge16ln	%g4,	%i2,	%i6
	save %l3, 0x0190, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsg	%xcc,	%f3,	%f4
	mova	%xcc,	%o6,	%l6
	ldd	[%l7 + 0x58],	%f0
	fpadd32	%f24,	%f14,	%f22
	umulcc	%g3,	0x13D2,	%g2
	sdivcc	%i0,	0x1646,	%l1
	ldsb	[%l7 + 0x4E],	%o4
	movrlez	%l0,	0x247,	%i4
	array16	%i1,	%g6,	%o3
	edge32ln	%o2,	%o5,	%o0
	xnor	%g1,	%l5,	%o7
	mulx	%l2,	0x154E,	%g7
	fandnot1s	%f25,	%f21,	%f0
	st	%f20,	[%l7 + 0x74]
	fornot2s	%f20,	%f5,	%f13
	xor	%l4,	0x1B37,	%i7
	movg	%icc,	%g5,	%o1
	xor	%g4,	0x0198,	%i3
	srlx	%i2,	0x14,	%i6
	movrgez	%l3,	%o6,	%l6
	fmovdcc	%xcc,	%f10,	%f22
	orcc	%g3,	0x0828,	%g2
	andncc	%i0,	%i5,	%l1
	fmuld8sux16	%f31,	%f29,	%f6
	stx	%o4,	[%l7 + 0x78]
	edge32	%l0,	%i4,	%i1
	andcc	%o3,	%o2,	%g6
	alignaddr	%o5,	%g1,	%l5
	edge8n	%o7,	%l2,	%o0
	fnands	%f22,	%f0,	%f6
	smul	%l4,	%i7,	%g5
	fcmpes	%fcc0,	%f17,	%f6
	mulx	%o1,	%g7,	%i3
	sub	%i2,	0x1C24,	%i6
	sdivcc	%l3,	0x0383,	%g4
	fmovrse	%o6,	%f7,	%f17
	fmovdge	%xcc,	%f30,	%f9
	restore %g3, 0x128F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x28],	%i0
	edge32n	%l6,	%l1,	%o4
	stw	%i5,	[%l7 + 0x2C]
	andn	%i4,	0x19A3,	%i1
	movne	%xcc,	%l0,	%o2
	edge32ln	%g6,	%o5,	%g1
	ldsh	[%l7 + 0x60],	%o3
	setx loop_22, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_22: 	movrgz	%l4,	0x3B2,	%i7
	movleu	%xcc,	%g5,	%l2
	xor	%o1,	0x09DD,	%g7
	or	%i3,	%i6,	%l3
	subc	%g4,	0x0EB3,	%i2
	sra	%o6,	0x05,	%g3
	movle	%xcc,	%i0,	%g2
	fmovsg	%xcc,	%f6,	%f29
	orn	%l6,	0x12AB,	%l1
	xor	%o4,	%i4,	%i1
	popc	%i5,	%l0
	orn	%o2,	%o5,	%g1
	ld	[%l7 + 0x30],	%f28
	movleu	%icc,	%o3,	%g6
	movneg	%icc,	%l5,	%o7
	and	%o0,	0x0D89,	%i7
	siam	0x1
	popc	0x1708,	%g5
	edge16l	%l4,	%l2,	%o1
	fabss	%f14,	%f1
	xor	%g7,	0x0440,	%i3
	andn	%i6,	0x093D,	%l3
	subccc	%i2,	0x1DAE,	%g4
	fmovdn	%icc,	%f8,	%f13
	fmovse	%xcc,	%f5,	%f29
	ldub	[%l7 + 0x79],	%g3
	fcmple16	%f30,	%f4,	%o6
	ldsb	[%l7 + 0x09],	%g2
	subccc	%l6,	%l1,	%o4
	sir	0x03F2
	lduw	[%l7 + 0x38],	%i4
	edge8l	%i0,	%i5,	%i1
	movge	%xcc,	%o2,	%l0
	edge8	%o5,	%o3,	%g1
	xor	%g6,	%l5,	%o7
	xorcc	%i7,	0x0622,	%g5
	edge32n	%l4,	%l2,	%o0
	addccc	%o1,	0x1E8A,	%g7
	edge16	%i3,	%l3,	%i2
	fmovsgu	%xcc,	%f27,	%f19
	sth	%i6,	[%l7 + 0x48]
	movcc	%xcc,	%g4,	%g3
	movneg	%icc,	%o6,	%g2
	srl	%l1,	0x07,	%o4
	subcc	%l6,	%i4,	%i5
	fmovscc	%xcc,	%f27,	%f6
	fcmpgt32	%f20,	%f0,	%i1
	fsrc1	%f20,	%f8
	stx	%o2,	[%l7 + 0x78]
	edge16ln	%l0,	%o5,	%i0
	lduw	[%l7 + 0x38],	%o3
	save %g6, %g1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%i7,	%g5,	%o7
	lduh	[%l7 + 0x26],	%l4
	sth	%o0,	[%l7 + 0x1A]
	add	%l2,	%g7,	%i3
	sdivx	%l3,	0x1F4C,	%i2
	ldsw	[%l7 + 0x38],	%o1
	fpadd32	%f16,	%f28,	%f4
	movg	%icc,	%g4,	%i6
	stx	%o6,	[%l7 + 0x70]
	nop
	set	0x60, %l2
	ldd	[%l7 + %l2],	%g2
	ldx	[%l7 + 0x38],	%l1
	fandnot2s	%f8,	%f19,	%f17
	stb	%g3,	[%l7 + 0x30]
	orncc	%l6,	%i4,	%o4
	fmovrdne	%i5,	%f28,	%f10
	ldsb	[%l7 + 0x56],	%i1
	edge8	%l0,	%o5,	%o2
	alignaddrl	%i0,	%g6,	%o3
	fcmple16	%f28,	%f8,	%l5
	movrlez	%i7,	%g1,	%o7
	sth	%l4,	[%l7 + 0x3C]
	stx	%g5,	[%l7 + 0x68]
	sll	%l2,	%o0,	%g7
	fpadd16	%f26,	%f28,	%f0
	fnot2	%f30,	%f2
	andn	%l3,	0x0E40,	%i3
	movgu	%xcc,	%i2,	%g4
	sdivx	%i6,	0x08C4,	%o1
	movpos	%icc,	%g2,	%o6
	fpadd32s	%f19,	%f8,	%f29
	sub	%g3,	0x1806,	%l6
	sir	0x05B4
	edge8n	%l1,	%i4,	%o4
	sir	0x0A4C
	andn	%i1,	%i5,	%l0
	udivcc	%o2,	0x0CC5,	%i0
	addcc	%o5,	%g6,	%l5
	edge8n	%o3,	%i7,	%g1
	ldub	[%l7 + 0x48],	%l4
	subcc	%o7,	%l2,	%o0
	edge16n	%g7,	%g5,	%i3
	for	%f0,	%f18,	%f24
	movrgez	%l3,	0x05A,	%i2
	ldsh	[%l7 + 0x56],	%g4
	movvs	%icc,	%i6,	%o1
	fornot2s	%f21,	%f11,	%f2
	restore %o6, %g3, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%l1,	%i4,	%o4
	fcmpgt32	%f8,	%f12,	%i1
	xnor	%g2,	%l0,	%o2
	ldsh	[%l7 + 0x24],	%i5
	edge32	%i0,	%g6,	%l5
	fpack32	%f12,	%f6,	%f26
	edge16ln	%o5,	%i7,	%g1
	fnot2	%f24,	%f26
	movle	%icc,	%o3,	%l4
	sllx	%o7,	%l2,	%g7
	xnorcc	%o0,	%i3,	%g5
	fmovdcs	%icc,	%f3,	%f13
	udivx	%i2,	0x064B,	%l3
	movcs	%icc,	%i6,	%g4
	edge16ln	%o1,	%g3,	%l6
	movvs	%xcc,	%l1,	%i4
	and	%o4,	0x106B,	%o6
	addcc	%i1,	%l0,	%o2
	edge16n	%g2,	%i5,	%g6
	sir	0x0228
	xnor	%i0,	0x0180,	%l5
	movne	%icc,	%o5,	%i7
	and	%o3,	0x0897,	%l4
	fmovscc	%icc,	%f19,	%f17
	stb	%o7,	[%l7 + 0x36]
	sdivx	%g1,	0x0C97,	%l2
	sethi	0x19B7,	%o0
	ldub	[%l7 + 0x3A],	%g7
	array32	%i3,	%i2,	%g5
	xorcc	%i6,	%g4,	%l3
	movrgez	%o1,	%g3,	%l6
	umulcc	%l1,	0x07A0,	%i4
	ldx	[%l7 + 0x68],	%o6
	movpos	%xcc,	%i1,	%o4
	sll	%o2,	0x09,	%l0
	alignaddr	%i5,	%g6,	%i0
	fpsub16s	%f24,	%f8,	%f26
	fmovdcs	%icc,	%f9,	%f17
	lduh	[%l7 + 0x12],	%l5
	ldd	[%l7 + 0x78],	%o4
	movleu	%icc,	%i7,	%g2
	movge	%icc,	%l4,	%o7
	ldsb	[%l7 + 0x16],	%g1
	fornot1	%f24,	%f14,	%f10
	fmovdcs	%xcc,	%f23,	%f29
	mulx	%l2,	%o3,	%o0
	movrne	%g7,	0x0A2,	%i2
	fcmpne16	%f28,	%f4,	%i3
	stb	%g5,	[%l7 + 0x6B]
	mulscc	%g4,	0x1987,	%i6
	st	%f14,	[%l7 + 0x60]
	orncc	%o1,	0x1540,	%g3
	orn	%l3,	%l1,	%l6
	sir	0x1C21
	srl	%o6,	0x11,	%i4
	subccc	%i1,	%o2,	%l0
	sll	%o4,	0x18,	%g6
	fsrc2	%f30,	%f6
	orncc	%i0,	0x089F,	%l5
	lduh	[%l7 + 0x7C],	%o5
	mova	%xcc,	%i7,	%i5
	fpsub32s	%f24,	%f16,	%f17
	edge16n	%g2,	%o7,	%g1
	stw	%l4,	[%l7 + 0x44]
	array16	%l2,	%o3,	%o0
	add	%i2,	%i3,	%g5
	subcc	%g7,	%g4,	%o1
	fmovdgu	%icc,	%f26,	%f13
	movneg	%icc,	%i6,	%g3
	lduw	[%l7 + 0x2C],	%l3
	movle	%icc,	%l1,	%o6
	sdiv	%i4,	0x14FE,	%i1
	movrgz	%o2,	%l6,	%l0
	edge8	%g6,	%o4,	%i0
	addccc	%l5,	0x1102,	%o5
	orcc	%i7,	%i5,	%g2
	lduw	[%l7 + 0x30],	%o7
	fmuld8ulx16	%f9,	%f28,	%f12
	sth	%g1,	[%l7 + 0x54]
	sth	%l4,	[%l7 + 0x5C]
	fxors	%f12,	%f0,	%f31
	edge16ln	%o3,	%o0,	%i2
	movge	%icc,	%l2,	%g5
	fmovdgu	%icc,	%f22,	%f24
	fzeros	%f13
	fcmpgt16	%f26,	%f16,	%i3
	sth	%g4,	[%l7 + 0x1E]
	fmovsa	%xcc,	%f8,	%f28
	orn	%o1,	0x0004,	%g7
	edge16l	%g3,	%i6,	%l1
	fornot1s	%f31,	%f27,	%f28
	lduw	[%l7 + 0x3C],	%l3
	udivx	%o6,	0x0104,	%i4
	umulcc	%o2,	%i1,	%l0
	orcc	%g6,	%l6,	%i0
	mova	%xcc,	%l5,	%o5
	xnorcc	%o4,	%i5,	%g2
	stw	%o7,	[%l7 + 0x24]
	movrgez	%g1,	%l4,	%o3
	orncc	%i7,	%i2,	%l2
	sdivcc	%g5,	0x0A74,	%o0
	pdist	%f16,	%f4,	%f28
	stx	%g4,	[%l7 + 0x48]
	movpos	%xcc,	%i3,	%o1
	std	%f18,	[%l7 + 0x08]
	ld	[%l7 + 0x18],	%f7
	sethi	0x1F03,	%g7
	srax	%i6,	%l1,	%l3
	alignaddr	%o6,	%i4,	%o2
	add	%g3,	%i1,	%l0
	subcc	%l6,	%g6,	%l5
	orncc	%i0,	%o5,	%o4
	sdivx	%g2,	0x1B5E,	%i5
	xor	%g1,	%l4,	%o3
	sll	%o7,	0x1A,	%i2
	fcmpne16	%f20,	%f22,	%l2
	sll	%i7,	0x14,	%o0
	fmovdge	%icc,	%f26,	%f4
	movrne	%g5,	0x03C,	%i3
	movgu	%xcc,	%g4,	%g7
	lduh	[%l7 + 0x48],	%o1
	movrlz	%l1,	%i6,	%l3
	orcc	%i4,	0x0B87,	%o6
	movcs	%xcc,	%g3,	%o2
	save %i1, 0x17A8, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpack16	%f14,	%f16
	move	%xcc,	%g6,	%l5
	movrne	%l0,	0x37F,	%o5
	xorcc	%i0,	%o4,	%i5
	fcmps	%fcc0,	%f25,	%f4
	srl	%g2,	%l4,	%o3
	sdiv	%g1,	0x01C7,	%o7
	fpmerge	%f14,	%f18,	%f4
	subcc	%i2,	%l2,	%i7
	fmovsne	%xcc,	%f11,	%f7
	stb	%g5,	[%l7 + 0x33]
	sdivcc	%o0,	0x01A7,	%g4
	fmovdl	%icc,	%f28,	%f4
	udivx	%i3,	0x1DAF,	%g7
	edge8ln	%l1,	%o1,	%i6
	fmovse	%icc,	%f18,	%f14
	movleu	%icc,	%l3,	%i4
	movvs	%xcc,	%o6,	%o2
	std	%f26,	[%l7 + 0x48]
	fmovd	%f6,	%f30
	fornot2s	%f18,	%f10,	%f4
	setx loop_23, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_23: 	ldd	[%l7 + 0x68],	%i6
	movneg	%icc,	%l5,	%l0
	fpadd16	%f18,	%f20,	%f16
	add	%g6,	%o5,	%i0
	sir	0x0C58
	sethi	0x1F9B,	%i5
	alignaddr	%g2,	%o4,	%o3
	st	%f10,	[%l7 + 0x7C]
	umul	%l4,	0x0A61,	%o7
	movrlez	%i2,	%l2,	%i7
	movrlz	%g1,	%g5,	%g4
	save %i3, %g7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%o0,	%i6
	fmovdne	%xcc,	%f3,	%f23
	fcmpeq32	%f10,	%f14,	%o1
	subcc	%i4,	0x13AB,	%l3
	edge8n	%o6,	%i1,	%g3
	sir	0x0367
	edge16ln	%o2,	%l5,	%l0
	fmovrdgz	%g6,	%f0,	%f0
	movg	%icc,	%o5,	%l6
	movle	%xcc,	%i0,	%i5
	edge8n	%g2,	%o3,	%o4
	fcmpgt32	%f6,	%f12,	%l4
	alignaddrl	%o7,	%i2,	%i7
	move	%icc,	%l2,	%g5
	movrlz	%g1,	%g4,	%g7
	sdivcc	%l1,	0x0C6F,	%i3
	fnot1s	%f30,	%f19
	edge8l	%o0,	%o1,	%i6
	edge16n	%i4,	%l3,	%o6
	movge	%icc,	%g3,	%o2
	fandnot1s	%f20,	%f0,	%f10
	nop
	set	0x0C, %o4
	stw	%l5,	[%l7 + %o4]
	sth	%i1,	[%l7 + 0x4E]
	srlx	%g6,	0x1A,	%l0
	movvs	%xcc,	%l6,	%o5
	save %i5, %i0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array32	%o3,	%l4,	%o7
	srl	%o4,	0x17,	%i7
	array32	%i2,	%g5,	%g1
	ld	[%l7 + 0x30],	%f1
	fmul8ulx16	%f0,	%f10,	%f4
	addc	%g4,	0x0403,	%l2
	movvc	%icc,	%g7,	%i3
	movl	%icc,	%o0,	%o1
	sdivx	%i6,	0x1082,	%i4
	fpack16	%f16,	%f9
	movn	%xcc,	%l3,	%o6
	or	%g3,	0x07B7,	%o2
	movn	%xcc,	%l1,	%i1
	ldub	[%l7 + 0x3F],	%l5
	srl	%l0,	%l6,	%o5
	edge8n	%g6,	%i5,	%g2
	movrlz	%o3,	%l4,	%o7
	fmovspos	%xcc,	%f28,	%f12
	addccc	%i0,	0x035D,	%o4
	ld	[%l7 + 0x14],	%f22
	fmovrsne	%i7,	%f7,	%f23
	smulcc	%i2,	%g5,	%g1
	restore %g4, 0x1B94, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%i3,	%o0,	%l2
	edge8l	%o1,	%i6,	%l3
	ldx	[%l7 + 0x48],	%i4
	movleu	%xcc,	%o6,	%g3
	movne	%icc,	%o2,	%i1
	andcc	%l1,	%l0,	%l6
	fornot1s	%f15,	%f14,	%f5
	fpadd16s	%f20,	%f20,	%f1
	ldd	[%l7 + 0x70],	%o4
	alignaddrl	%l5,	%i5,	%g2
	fcmpne16	%f4,	%f18,	%g6
	sll	%o3,	0x05,	%o7
	fpmerge	%f31,	%f7,	%f2
	array16	%i0,	%l4,	%i7
	movrlez	%o4,	%i2,	%g1
	array8	%g5,	%g7,	%i3
	ldub	[%l7 + 0x62],	%o0
	movge	%xcc,	%g4,	%o1
	fpsub16s	%f9,	%f5,	%f13
	ldd	[%l7 + 0x78],	%f30
	subc	%i6,	%l2,	%i4
	movrgz	%l3,	0x033,	%o6
	edge16l	%g3,	%i1,	%l1
	srl	%o2,	0x09,	%l6
	movre	%o5,	0x26E,	%l5
	umul	%i5,	%l0,	%g2
	movleu	%icc,	%o3,	%g6
	stx	%o7,	[%l7 + 0x18]
	lduw	[%l7 + 0x6C],	%i0
	fpadd32s	%f7,	%f1,	%f19
	movvs	%xcc,	%l4,	%o4
	xnor	%i2,	%i7,	%g1
	lduh	[%l7 + 0x3C],	%g7
	movcc	%icc,	%i3,	%o0
	fsrc2	%f14,	%f22
	movvc	%xcc,	%g4,	%o1
	sub	%g5,	%i6,	%i4
	movrgez	%l2,	0x29C,	%o6
	edge8l	%l3,	%g3,	%l1
	movleu	%xcc,	%o2,	%l6
	edge32	%i1,	%l5,	%o5
	edge32	%i5,	%g2,	%l0
	fmovsne	%xcc,	%f25,	%f30
	sethi	0x01B2,	%g6
	fmovsvs	%icc,	%f5,	%f12
	fmovsvc	%xcc,	%f10,	%f11
	movneg	%xcc,	%o7,	%o3
	fmovdpos	%icc,	%f4,	%f16
	and	%l4,	%o4,	%i2
	movgu	%xcc,	%i7,	%i0
	popc	0x19F2,	%g7
	srax	%i3,	%o0,	%g4
	ldx	[%l7 + 0x30],	%g1
	mulscc	%g5,	%i6,	%o1
	sll	%l2,	%i4,	%o6
	fpadd16	%f26,	%f12,	%f14
	andcc	%l3,	0x1F5F,	%l1
	fmovrdgz	%g3,	%f6,	%f2
	andcc	%o2,	0x0455,	%l6
	udivcc	%i1,	0x16B0,	%o5
	fmovdgu	%xcc,	%f25,	%f10
	sdivx	%i5,	0x0262,	%l5
	or	%g2,	%l0,	%o7
	edge16	%o3,	%g6,	%o4
	popc	%l4,	%i7
	fmovsneg	%xcc,	%f2,	%f22
	array8	%i2,	%g7,	%i3
	alignaddrl	%o0,	%g4,	%g1
	udivx	%g5,	0x1186,	%i0
	add	%o1,	0x1E3A,	%i6
	ldsw	[%l7 + 0x14],	%i4
	umulcc	%l2,	%o6,	%l1
	fcmpgt32	%f4,	%f18,	%l3
	lduw	[%l7 + 0x28],	%g3
	xor	%l6,	0x10A3,	%o2
	movg	%xcc,	%o5,	%i1
	fpack32	%f6,	%f26,	%f24
	fornot2s	%f15,	%f15,	%f19
	xnor	%i5,	%g2,	%l5
	fmovsleu	%icc,	%f14,	%f23
	mulx	%l0,	0x11B0,	%o3
	sth	%g6,	[%l7 + 0x0E]
	smul	%o4,	%o7,	%i7
	movneg	%xcc,	%i2,	%g7
	movg	%xcc,	%i3,	%o0
	fmovsvc	%xcc,	%f4,	%f14
	sir	0x0646
	fcmpeq16	%f22,	%f30,	%g4
	smulcc	%g1,	%l4,	%i0
	movl	%xcc,	%o1,	%g5
	stw	%i6,	[%l7 + 0x58]
	ldd	[%l7 + 0x50],	%i4
	fmuld8ulx16	%f1,	%f8,	%f14
	mulx	%l2,	%o6,	%l1
	orncc	%l3,	%l6,	%g3
	move	%icc,	%o5,	%o2
	stw	%i1,	[%l7 + 0x28]
	ldub	[%l7 + 0x5F],	%g2
	stx	%l5,	[%l7 + 0x20]
	movcc	%xcc,	%l0,	%o3
	addccc	%g6,	0x15E4,	%o4
	st	%f26,	[%l7 + 0x44]
	movrne	%o7,	0x3E8,	%i7
	move	%xcc,	%i5,	%g7
	movn	%icc,	%i3,	%i2
	andncc	%o0,	%g4,	%l4
	movvc	%icc,	%g1,	%o1
	orncc	%g5,	0x00EE,	%i6
	ldsb	[%l7 + 0x0D],	%i0
	smul	%l2,	0x1D4B,	%o6
	srlx	%l1,	0x05,	%i4
	andn	%l6,	0x1BB2,	%g3
	orcc	%l3,	%o2,	%o5
	save %i1, %g2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l5,	%o3,	%g6
	movre	%o4,	0x2F1,	%o7
	movg	%xcc,	%i7,	%g7
	fmovdcc	%icc,	%f8,	%f3
	array32	%i3,	%i5,	%o0
	addc	%i2,	0x1428,	%l4
	popc	0x149C,	%g1
	xor	%o1,	0x114D,	%g5
	nop
	set	0x64, %i0
	lduw	[%l7 + %i0],	%i6
	fmovrdgz	%g4,	%f24,	%f22
	alignaddrl	%i0,	%o6,	%l2
	fmovs	%f27,	%f9
	srax	%l1,	%i4,	%l6
	umulcc	%g3,	0x0047,	%l3
	array32	%o5,	%o2,	%i1
	fpadd16s	%f21,	%f25,	%f6
	edge16ln	%l0,	%g2,	%o3
	fcmpgt16	%f26,	%f2,	%l5
	sllx	%o4,	0x1F,	%o7
	stx	%i7,	[%l7 + 0x10]
	ldub	[%l7 + 0x49],	%g6
	sir	0x0959
	xorcc	%i3,	0x183D,	%i5
	fmovsn	%icc,	%f19,	%f28
	mulscc	%g7,	0x09D3,	%i2
	move	%xcc,	%o0,	%l4
	xorcc	%g1,	0x0541,	%o1
	movvs	%icc,	%g5,	%g4
	movne	%icc,	%i6,	%o6
	xor	%l2,	0x01A9,	%i0
	sethi	0x1345,	%l1
	edge16ln	%i4,	%g3,	%l3
	fmul8x16au	%f0,	%f23,	%f30
	and	%o5,	0x100D,	%l6
	fpack16	%f14,	%f4
	fmul8sux16	%f8,	%f16,	%f18
	movrne	%i1,	0x355,	%l0
	subcc	%g2,	%o3,	%o2
	fmovse	%icc,	%f9,	%f25
	addcc	%o4,	0x1555,	%o7
	fnands	%f7,	%f9,	%f20
	fxnor	%f8,	%f30,	%f14
	subc	%i7,	0x14B8,	%l5
	fmovdcs	%icc,	%f4,	%f17
	fmovdl	%xcc,	%f7,	%f3
	movcc	%xcc,	%g6,	%i5
	ldsb	[%l7 + 0x08],	%g7
	bshuffle	%f10,	%f22,	%f24
	st	%f28,	[%l7 + 0x40]
	sir	0x0B62
	mulscc	%i3,	0x028A,	%i2
	movcc	%xcc,	%l4,	%g1
	fnot2	%f10,	%f0
	movneg	%xcc,	%o1,	%o0
	fmuld8ulx16	%f23,	%f3,	%f26
	array8	%g4,	%i6,	%g5
	edge8n	%l2,	%o6,	%i0
	fmovdneg	%xcc,	%f18,	%f25
	fmul8x16al	%f26,	%f3,	%f0
	alignaddr	%l1,	%g3,	%l3
	movleu	%xcc,	%o5,	%l6
	edge32n	%i4,	%i1,	%g2
	movgu	%xcc,	%o3,	%l0
	andncc	%o4,	%o2,	%i7
	ld	[%l7 + 0x5C],	%f30
	fmovdge	%xcc,	%f14,	%f12
	movcs	%icc,	%o7,	%g6
	lduh	[%l7 + 0x6E],	%i5
	subccc	%g7,	%l5,	%i3
	movvc	%xcc,	%i2,	%g1
	umulcc	%o1,	0x138A,	%o0
	edge16l	%g4,	%l4,	%g5
	ldd	[%l7 + 0x40],	%i6
	fpadd32	%f2,	%f18,	%f2
	smul	%o6,	%l2,	%l1
	udivx	%i0,	0x1021,	%l3
	add	%g3,	0x026A,	%l6
	edge16l	%i4,	%o5,	%i1
	fpack16	%f4,	%f20
	movrlz	%g2,	0x0D3,	%l0
	edge16l	%o4,	%o3,	%o2
	lduw	[%l7 + 0x44],	%o7
	movne	%xcc,	%i7,	%i5
	movle	%icc,	%g7,	%g6
	andcc	%l5,	0x103C,	%i2
	edge32	%i3,	%o1,	%g1
	smul	%g4,	0x1E11,	%o0
	movcs	%xcc,	%g5,	%i6
	sub	%l4,	0x1B75,	%o6
	edge32n	%l1,	%l2,	%l3
	movrlez	%i0,	%g3,	%l6
	mulscc	%o5,	0x1AB1,	%i1
	sdiv	%i4,	0x1E28,	%g2
	fzeros	%f14
	movrlez	%o4,	%o3,	%l0
	nop
	set	0x48, %l6
	stx	%o7,	[%l7 + %l6]
	fmovrslz	%o2,	%f29,	%f25
	ldsh	[%l7 + 0x22],	%i7
	xnorcc	%g7,	0x1F7B,	%g6
	edge16n	%i5,	%i2,	%i3
	ld	[%l7 + 0x08],	%f7
	alignaddr	%o1,	%l5,	%g4
	fmovsge	%xcc,	%f9,	%f20
	sdiv	%g1,	0x094D,	%g5
	addccc	%i6,	%l4,	%o0
	edge32	%o6,	%l1,	%l3
	movrlz	%i0,	%g3,	%l6
	std	%f24,	[%l7 + 0x08]
	sir	0x0579
	xorcc	%o5,	0x0EBE,	%i1
	lduw	[%l7 + 0x24],	%i4
	fmovdcc	%icc,	%f31,	%f25
	sub	%l2,	0x1AD9,	%g2
	udivx	%o3,	0x0D42,	%l0
	ldub	[%l7 + 0x11],	%o7
	xnor	%o2,	%o4,	%g7
	umulcc	%g6,	%i7,	%i5
	sll	%i2,	%o1,	%i3
	alignaddrl	%g4,	%l5,	%g1
	edge32	%i6,	%l4,	%g5
	sdivx	%o6,	0x0EF4,	%l1
	movcs	%xcc,	%o0,	%i0
	orcc	%l3,	0x1461,	%g3
	edge32	%o5,	%i1,	%i4
	fmovrsne	%l6,	%f21,	%f28
	fmovdcc	%icc,	%f10,	%f11
	fmovrdgz	%l2,	%f2,	%f12
	alignaddr	%o3,	%l0,	%g2
	popc	0x02F4,	%o7
	sdivcc	%o2,	0x1194,	%g7
	smulcc	%g6,	%o4,	%i7
	sub	%i5,	0x0D02,	%i2
	mulscc	%i3,	%o1,	%l5
	ldd	[%l7 + 0x58],	%g4
	fnegs	%f10,	%f8
	movneg	%xcc,	%i6,	%l4
	fabss	%f14,	%f26
	movgu	%xcc,	%g1,	%g5
	fzeros	%f8
	srax	%l1,	%o0,	%o6
	ldd	[%l7 + 0x30],	%f0
	fmovdle	%icc,	%f18,	%f31
	sllx	%i0,	0x11,	%l3
	fxnor	%f16,	%f10,	%f2
	or	%o5,	0x00F1,	%i1
	subccc	%g3,	%i4,	%l6
	movrgz	%l2,	0x145,	%o3
	edge16ln	%g2,	%l0,	%o2
	srax	%o7,	0x1A,	%g7
	movleu	%icc,	%o4,	%g6
	ldsh	[%l7 + 0x7E],	%i7
	stb	%i5,	[%l7 + 0x3B]
	fmovrdgz	%i2,	%f18,	%f26
	nop
	set	0x08, %g1
	ldsh	[%l7 + %g1],	%o1
	movrlz	%l5,	0x131,	%i3
	movg	%xcc,	%i6,	%l4
	ldx	[%l7 + 0x78],	%g4
	movpos	%xcc,	%g1,	%g5
	movn	%xcc,	%l1,	%o6
	edge16l	%i0,	%l3,	%o0
	edge16ln	%o5,	%i1,	%g3
	subcc	%l6,	%i4,	%o3
	setx loop_24, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_24: 	sethi	0x05DF,	%o2
	edge16	%o7,	%g7,	%o4
	udiv	%g2,	0x0997,	%g6
	fxors	%f1,	%f1,	%f14
	srlx	%i7,	%i5,	%o1
	addccc	%l5,	%i3,	%i2
	ld	[%l7 + 0x60],	%f11
	ldsb	[%l7 + 0x61],	%l4
	fpsub16s	%f29,	%f22,	%f0
	sdiv	%g4,	0x0BC9,	%i6
	fand	%f4,	%f26,	%f26
	popc	%g5,	%l1
	fmovdneg	%xcc,	%f28,	%f4
	nop
	set	0x64, %i2
	stw	%g1,	[%l7 + %i2]
	edge8l	%o6,	%l3,	%o0
	restore %o5, %i1, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%l6,	0x15,	%i4
	or	%o3,	%l2,	%g3
	fcmpd	%fcc1,	%f2,	%f12
	and	%o2,	0x1E1A,	%l0
	add	%g7,	%o4,	%g2
	edge8n	%g6,	%i7,	%o7
	movrgz	%o1,	%l5,	%i3
	fcmpes	%fcc1,	%f20,	%f31
	andn	%i2,	0x02FA,	%l4
	umulcc	%i5,	%i6,	%g4
	movge	%icc,	%l1,	%g5
	edge32	%o6,	%g1,	%l3
	fmovsgu	%xcc,	%f12,	%f25
	fornot2s	%f19,	%f8,	%f3
	fpack32	%f12,	%f4,	%f16
	fmovs	%f12,	%f16
	edge16	%o5,	%i1,	%o0
	orcc	%i0,	%l6,	%i4
	movre	%l2,	0x2F1,	%g3
	movrne	%o2,	%l0,	%o3
	or	%g7,	%g2,	%g6
	fmovsge	%icc,	%f25,	%f8
	movrlez	%o4,	0x060,	%i7
	sdivcc	%o1,	0x1C57,	%l5
	andncc	%i3,	%o7,	%i2
	fmovrdlez	%i5,	%f8,	%f10
	movrlz	%i6,	0x29B,	%g4
	stw	%l4,	[%l7 + 0x14]
	fnegd	%f24,	%f10
	lduh	[%l7 + 0x12],	%g5
	movle	%icc,	%o6,	%l1
	movneg	%xcc,	%l3,	%g1
	edge8ln	%i1,	%o0,	%i0
	movle	%icc,	%o5,	%l6
	sdiv	%l2,	0x06E6,	%g3
	edge32l	%o2,	%l0,	%i4
	fcmpne16	%f10,	%f8,	%g7
	fmovsgu	%xcc,	%f12,	%f0
	fmovscs	%xcc,	%f4,	%f17
	xor	%g2,	0x0F3E,	%o3
	fmovsl	%xcc,	%f11,	%f0
	fandnot1	%f18,	%f6,	%f16
	st	%f25,	[%l7 + 0x50]
	fones	%f20
	fpmerge	%f22,	%f11,	%f2
	udivcc	%g6,	0x12F6,	%o4
	popc	0x1B77,	%o1
	srl	%l5,	0x08,	%i3
	lduw	[%l7 + 0x28],	%i7
	xnorcc	%i2,	0x08E9,	%i5
	udivx	%o7,	0x0F67,	%g4
	movrlez	%i6,	0x3E8,	%g5
	orcc	%l4,	%o6,	%l1
	andcc	%g1,	0x059C,	%i1
	udivcc	%o0,	0x06A6,	%i0
	orncc	%l3,	%l6,	%o5
	edge32l	%g3,	%o2,	%l2
	sub	%i4,	0x1409,	%l0
	fmul8x16	%f21,	%f26,	%f0
	movg	%xcc,	%g2,	%o3
	movrgez	%g6,	0x20B,	%o4
	fmovdne	%xcc,	%f13,	%f7
	fmovse	%xcc,	%f4,	%f18
	edge32	%o1,	%g7,	%l5
	st	%f4,	[%l7 + 0x6C]
	ldx	[%l7 + 0x68],	%i7
	sll	%i2,	0x18,	%i5
	udivcc	%o7,	0x164D,	%i3
	pdist	%f20,	%f30,	%f12
	or	%i6,	%g4,	%g5
	edge32ln	%l4,	%o6,	%g1
	edge8ln	%l1,	%o0,	%i0
	array32	%i1,	%l3,	%l6
	edge32ln	%g3,	%o5,	%o2
	fnot2	%f14,	%f30
	sdivx	%l2,	0x17FF,	%l0
	fmovsleu	%xcc,	%f21,	%f19
	fornot2s	%f19,	%f18,	%f2
	array32	%g2,	%i4,	%g6
	array16	%o4,	%o3,	%o1
	movge	%xcc,	%g7,	%i7
	movre	%i2,	%l5,	%i5
	andcc	%i3,	%i6,	%o7
	movrgz	%g5,	0x2DC,	%g4
	or	%l4,	%g1,	%l1
	xnorcc	%o0,	%i0,	%i1
	fmovdle	%xcc,	%f31,	%f0
	sth	%o6,	[%l7 + 0x3A]
	fcmpeq32	%f30,	%f10,	%l3
	fpsub32	%f12,	%f20,	%f22
	ld	[%l7 + 0x34],	%f27
	and	%g3,	0x1148,	%l6
	udivcc	%o5,	0x0382,	%l2
	sdivx	%l0,	0x0B20,	%g2
	srl	%o2,	0x08,	%i4
	edge32n	%o4,	%g6,	%o1
	ldsh	[%l7 + 0x46],	%g7
	fmovsa	%icc,	%f29,	%f20
	movrlz	%o3,	0x2C3,	%i2
	edge32ln	%i7,	%i5,	%l5
	sdiv	%i3,	0x1084,	%i6
	addccc	%o7,	0x15CE,	%g4
	movrgez	%l4,	0x12F,	%g1
	fcmpes	%fcc2,	%f25,	%f25
	fxors	%f13,	%f5,	%f13
	movne	%icc,	%g5,	%l1
	fpsub16s	%f5,	%f1,	%f11
	movrlz	%o0,	%i0,	%o6
	addcc	%i1,	%g3,	%l3
	fnot2	%f10,	%f2
	sub	%o5,	%l2,	%l6
	sll	%g2,	0x08,	%o2
	stw	%i4,	[%l7 + 0x48]
	edge32	%o4,	%l0,	%g6
	andcc	%o1,	0x0004,	%g7
	movcc	%xcc,	%i2,	%i7
	udivx	%i5,	0x0265,	%o3
	andncc	%i3,	%i6,	%l5
	fxnor	%f20,	%f0,	%f16
	edge16n	%g4,	%l4,	%g1
	subc	%g5,	0x1324,	%l1
	fnegs	%f2,	%f5
	fpmerge	%f14,	%f24,	%f12
	or	%o0,	0x18EC,	%o7
	addccc	%o6,	%i0,	%i1
	addc	%l3,	%g3,	%o5
	andn	%l2,	0x08F5,	%l6
	srl	%o2,	%g2,	%o4
	srax	%i4,	0x07,	%g6
	edge16l	%o1,	%g7,	%i2
	andn	%i7,	%l0,	%o3
	stb	%i5,	[%l7 + 0x35]
	fmovrde	%i6,	%f14,	%f30
	fmul8x16au	%f31,	%f10,	%f4
	fmovrdne	%l5,	%f14,	%f6
	edge16n	%g4,	%l4,	%g1
	fcmped	%fcc3,	%f18,	%f0
	alignaddrl	%g5,	%l1,	%i3
	edge32	%o7,	%o0,	%i0
	fmovse	%icc,	%f30,	%f6
	stb	%i1,	[%l7 + 0x6F]
	movg	%icc,	%l3,	%g3
	stx	%o6,	[%l7 + 0x50]
	sth	%o5,	[%l7 + 0x2E]
	ldsh	[%l7 + 0x22],	%l2
	movn	%icc,	%o2,	%g2
	fcmpeq32	%f16,	%f0,	%o4
	addcc	%l6,	0x07A9,	%g6
	fmovde	%xcc,	%f11,	%f1
	lduh	[%l7 + 0x12],	%o1
	fmovrdlez	%i4,	%f6,	%f2
	movcc	%xcc,	%g7,	%i2
	ld	[%l7 + 0x5C],	%f24
	movle	%xcc,	%l0,	%o3
	fmovdcc	%icc,	%f14,	%f12
	fcmple16	%f30,	%f30,	%i5
	subccc	%i7,	%l5,	%g4
	subcc	%i6,	0x0503,	%l4
	fnands	%f9,	%f8,	%f7
	movcc	%xcc,	%g5,	%g1
	movne	%xcc,	%i3,	%o7
	fmul8ulx16	%f0,	%f10,	%f20
	fornot1s	%f4,	%f5,	%f26
	sdivcc	%l1,	0x17F1,	%i0
	xnor	%o0,	0x1624,	%i1
	subccc	%g3,	0x11BC,	%l3
	edge8ln	%o6,	%o5,	%o2
	fpsub16s	%f8,	%f9,	%f3
	movrgz	%g2,	0x280,	%l2
	sub	%o4,	%l6,	%g6
	edge32	%i4,	%g7,	%o1
	fmovdvs	%icc,	%f21,	%f5
	srax	%i2,	0x03,	%o3
	movg	%icc,	%l0,	%i7
	movrlez	%i5,	%l5,	%g4
	udiv	%l4,	0x1CE8,	%i6
	fsrc1	%f18,	%f28
	fcmpes	%fcc3,	%f6,	%f12
	ldx	[%l7 + 0x78],	%g5
	movn	%icc,	%i3,	%g1
	sth	%o7,	[%l7 + 0x60]
	st	%f24,	[%l7 + 0x14]
	stw	%l1,	[%l7 + 0x60]
	smulcc	%i0,	%o0,	%g3
	fmovscc	%icc,	%f5,	%f26
	fxors	%f6,	%f31,	%f26
	xor	%i1,	%l3,	%o5
	st	%f27,	[%l7 + 0x4C]
	array32	%o2,	%g2,	%l2
	fnot2	%f28,	%f20
	smul	%o4,	0x09A9,	%o6
	subcc	%g6,	%l6,	%g7
	sllx	%i4,	%o1,	%i2
	andncc	%o3,	%l0,	%i7
	bshuffle	%f28,	%f22,	%f6
	alignaddrl	%l5,	%i5,	%g4
	edge8n	%i6,	%g5,	%i3
	andcc	%g1,	0x1426,	%l4
	sdivx	%o7,	0x12DF,	%l1
	fxnors	%f12,	%f7,	%f22
	xor	%o0,	%g3,	%i1
	std	%f18,	[%l7 + 0x60]
	stx	%l3,	[%l7 + 0x78]
	fsrc1	%f26,	%f0
	array8	%o5,	%i0,	%g2
	addccc	%o2,	%l2,	%o4
	xorcc	%g6,	%l6,	%o6
	smul	%i4,	0x19A4,	%o1
	nop
	set	0x61, %o0
	stb	%g7,	[%l7 + %o0]
	srl	%o3,	0x14,	%i2
	fandnot2s	%f22,	%f13,	%f15
	fnegd	%f14,	%f6
	movcc	%icc,	%i7,	%l5
	edge16ln	%i5,	%g4,	%l0
	sub	%g5,	0x1AFB,	%i6
	edge8	%i3,	%l4,	%o7
	fmovsle	%icc,	%f2,	%f7
	edge8	%l1,	%o0,	%g3
	ldsh	[%l7 + 0x42],	%g1
	alignaddrl	%i1,	%l3,	%i0
	fmovrslz	%o5,	%f15,	%f16
	fmuld8ulx16	%f6,	%f26,	%f0
	edge32	%o2,	%g2,	%l2
	edge32	%o4,	%g6,	%l6
	fsrc2s	%f7,	%f25
	movgu	%xcc,	%o6,	%o1
	orncc	%g7,	%o3,	%i2
	sir	0x0881
	array32	%i4,	%l5,	%i7
	lduh	[%l7 + 0x0A],	%g4
	udivcc	%l0,	0x0234,	%i5
	movvs	%icc,	%g5,	%i6
	sir	0x16CD
	and	%l4,	0x1883,	%o7
	xor	%i3,	%o0,	%g3
	nop
	set	0x38, %l4
	ldd	[%l7 + %l4],	%f24
	array32	%g1,	%i1,	%l1
	orcc	%i0,	0x01DF,	%l3
	fmovsleu	%xcc,	%f31,	%f11
	edge8	%o5,	%g2,	%o2
	movrne	%o4,	0x143,	%g6
	subccc	%l2,	0x0A58,	%o6
	fmovdcs	%icc,	%f20,	%f22
	movne	%xcc,	%o1,	%l6
	stb	%g7,	[%l7 + 0x14]
	fcmple32	%f28,	%f22,	%i2
	fmovspos	%xcc,	%f27,	%f15
	sdivx	%o3,	0x02CA,	%i4
	setx loop_25, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_25: 	st	%f23,	[%l7 + 0x78]
	movl	%xcc,	%i7,	%l0
	fpadd32	%f0,	%f12,	%f16
	fmovdgu	%icc,	%f26,	%f6
	orncc	%i5,	%g5,	%l4
	fpack16	%f24,	%f23
	fnot1s	%f4,	%f6
	popc	0x1DCF,	%o7
	ldsw	[%l7 + 0x40],	%i6
	xor	%o0,	0x1C31,	%g3
	fpack32	%f8,	%f28,	%f16
	fmovdl	%icc,	%f0,	%f5
	ldsb	[%l7 + 0x11],	%i3
	ldub	[%l7 + 0x6D],	%i1
	fmovsneg	%icc,	%f6,	%f16
	movgu	%xcc,	%l1,	%i0
	fcmple16	%f20,	%f30,	%g1
	ldx	[%l7 + 0x28],	%o5
	smul	%l3,	%o2,	%g2
	movne	%icc,	%g6,	%l2
	faligndata	%f6,	%f22,	%f18
	ldd	[%l7 + 0x10],	%f28
	umul	%o4,	%o1,	%l6
	orcc	%o6,	%i2,	%o3
	xorcc	%i4,	%l5,	%g4
	orcc	%g7,	%l0,	%i7
	subc	%i5,	%g5,	%o7
	subc	%i6,	%l4,	%o0
	restore %i3, %g3, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%l1,	0x05C4,	%g1
	movl	%xcc,	%o5,	%l3
	st	%f7,	[%l7 + 0x24]
	xor	%i0,	%g2,	%o2
	fpsub16s	%f5,	%f14,	%f5
	ldsh	[%l7 + 0x3E],	%g6
	movrne	%o4,	0x274,	%o1
	mulx	%l2,	0x0774,	%o6
	movn	%icc,	%i2,	%o3
	andn	%i4,	%l5,	%l6
	movrgz	%g7,	%g4,	%i7
	ldd	[%l7 + 0x78],	%f12
	fnot2	%f14,	%f4
	ldd	[%l7 + 0x70],	%f12
	smul	%l0,	%i5,	%g5
	ldx	[%l7 + 0x60],	%o7
	sdiv	%i6,	0x0280,	%o0
	fands	%f18,	%f21,	%f11
	movrne	%i3,	%g3,	%l4
	subccc	%i1,	%l1,	%g1
	fmovdne	%xcc,	%f4,	%f28
	sth	%l3,	[%l7 + 0x70]
	edge32ln	%i0,	%o5,	%o2
	fxor	%f30,	%f2,	%f30
	ldsb	[%l7 + 0x51],	%g2
	movn	%xcc,	%o4,	%g6
	movge	%icc,	%l2,	%o6
	movrlez	%o1,	0x236,	%o3
	alignaddr	%i4,	%l5,	%i2
	andncc	%g7,	%g4,	%l6
	movvs	%xcc,	%i7,	%i5
	orn	%l0,	0x1621,	%g5
	fornot2s	%f28,	%f10,	%f30
	or	%o7,	0x1ED5,	%i6
	movle	%xcc,	%o0,	%i3
	movn	%icc,	%l4,	%i1
	movcc	%xcc,	%g3,	%l1
	fmovdpos	%icc,	%f21,	%f31
	xorcc	%l3,	%g1,	%o5
	addc	%o2,	%g2,	%o4
	fpadd16	%f20,	%f8,	%f14
	movle	%xcc,	%g6,	%i0
	umul	%l2,	0x0707,	%o1
	fsrc2s	%f26,	%f14
	fsrc1s	%f23,	%f7
	subc	%o6,	0x0774,	%i4
	udiv	%o3,	0x10EC,	%l5
	orcc	%g7,	%g4,	%l6
	srl	%i2,	%i5,	%l0
	sra	%i7,	%g5,	%i6
	sdivcc	%o0,	0x09BA,	%i3
	srl	%l4,	%i1,	%g3
	fpsub16	%f20,	%f4,	%f28
	ldsw	[%l7 + 0x74],	%o7
	array8	%l1,	%l3,	%g1
	std	%f2,	[%l7 + 0x58]
	movcc	%xcc,	%o2,	%g2
	movrlz	%o5,	0x33B,	%g6
	lduw	[%l7 + 0x7C],	%i0
	lduh	[%l7 + 0x18],	%o4
	movrgz	%l2,	%o1,	%o6
	fmovdvc	%icc,	%f29,	%f12
	srlx	%o3,	0x09,	%i4
	movrlez	%g7,	0x2BC,	%g4
	edge16	%l5,	%l6,	%i5
	lduh	[%l7 + 0x78],	%i2
	umulcc	%i7,	%l0,	%i6
	andncc	%g5,	%i3,	%l4
	fmovs	%f0,	%f8
	nop
	set	0x74, %i5
	ldsh	[%l7 + %i5],	%o0
	movgu	%icc,	%g3,	%o7
	or	%i1,	0x0125,	%l3
	movrne	%g1,	%l1,	%g2
	edge32ln	%o5,	%g6,	%i0
	umul	%o2,	%o4,	%l2
	alignaddr	%o1,	%o3,	%o6
	xnorcc	%i4,	0x0AE6,	%g7
	movleu	%icc,	%l5,	%l6
	or	%g4,	%i2,	%i5
	edge16l	%l0,	%i6,	%i7
	stb	%g5,	[%l7 + 0x26]
	stx	%l4,	[%l7 + 0x10]
	fands	%f30,	%f27,	%f0
	fnors	%f23,	%f3,	%f4
	move	%icc,	%i3,	%g3
	andn	%o7,	0x0CA9,	%o0
	fmovsvc	%xcc,	%f5,	%f27
	edge8	%i1,	%g1,	%l3
	subc	%l1,	%o5,	%g6
	movne	%xcc,	%g2,	%i0
	edge16ln	%o4,	%l2,	%o2
	edge16l	%o3,	%o1,	%i4
	movle	%icc,	%o6,	%l5
	movcs	%icc,	%g7,	%l6
	xor	%i2,	0x1B8A,	%g4
	smul	%i5,	%l0,	%i6
	fmovsvs	%xcc,	%f11,	%f7
	sdiv	%i7,	0x00C7,	%l4
	alignaddr	%g5,	%g3,	%o7
	xorcc	%o0,	0x177D,	%i3
	sllx	%g1,	0x16,	%i1
	movvc	%icc,	%l1,	%o5
	nop
	set	0x46, %l1
	ldsb	[%l7 + %l1],	%l3
	ld	[%l7 + 0x50],	%f25
	fcmple16	%f6,	%f26,	%g2
	array32	%g6,	%i0,	%l2
	movrgez	%o4,	%o3,	%o2
	sethi	0x090D,	%i4
	edge32	%o6,	%l5,	%o1
	movrlez	%g7,	0x3E9,	%i2
	movleu	%xcc,	%g4,	%i5
	ldd	[%l7 + 0x18],	%l0
	ldd	[%l7 + 0x18],	%f4
	movgu	%xcc,	%i6,	%l6
	sllx	%i7,	%l4,	%g3
	movne	%icc,	%g5,	%o0
	movl	%icc,	%i3,	%g1
	fmovrdgz	%i1,	%f2,	%f18
	xor	%o7,	%o5,	%l1
	srax	%g2,	0x0F,	%g6
	sir	0x1027
	fornot1	%f6,	%f30,	%f28
	edge32	%l3,	%i0,	%l2
	fandnot1s	%f20,	%f8,	%f11
	sth	%o3,	[%l7 + 0x48]
	lduh	[%l7 + 0x18],	%o4
	pdist	%f12,	%f8,	%f26
	popc	%i4,	%o6
	nop
	set	0x20, %g3
	ldsh	[%l7 + %g3],	%l5
	fsrc1s	%f22,	%f31
	orcc	%o1,	%o2,	%g7
	addccc	%g4,	0x040F,	%i2
	movvc	%xcc,	%l0,	%i5
	movgu	%xcc,	%i6,	%l6
	fmovs	%f0,	%f0
	movrlez	%l4,	0x0BC,	%i7
	sdivx	%g3,	0x01E7,	%g5
	movre	%o0,	0x357,	%i3
	fmovrsgez	%g1,	%f7,	%f8
	movrlez	%i1,	0x1A7,	%o7
	edge32n	%o5,	%l1,	%g2
	nop
	set	0x78, %i3
	ldx	[%l7 + %i3],	%l3
	edge32l	%i0,	%g6,	%o3
	smul	%l2,	0x1F63,	%o4
	movn	%xcc,	%o6,	%i4
	nop
	set	0x08, %g6
	ldd	[%l7 + %g6],	%f28
	xor	%o1,	%o2,	%l5
	edge16	%g7,	%g4,	%i2
	movrlez	%i5,	%l0,	%i6
	ldsh	[%l7 + 0x58],	%l4
	movleu	%xcc,	%l6,	%i7
	fcmped	%fcc3,	%f10,	%f0
	orcc	%g3,	%o0,	%i3
	edge32n	%g1,	%g5,	%o7
	alignaddr	%o5,	%l1,	%g2
	nop
	set	0x08, %i7
	ldd	[%l7 + %i7],	%l2
	and	%i0,	%i1,	%g6
	umul	%l2,	0x0539,	%o4
	setx loop_26, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_26: 	udiv	%o1,	0x14AF,	%l5
	and	%o2,	%g4,	%g7
	movleu	%icc,	%i5,	%l0
	add	%i6,	0x17E8,	%l4
	array32	%i2,	%l6,	%i7
	edge8l	%o0,	%g3,	%g1
	add	%i3,	%g5,	%o7
	edge32ln	%l1,	%g2,	%l3
	movge	%icc,	%o5,	%i0
	ldd	[%l7 + 0x10],	%g6
	srlx	%l2,	%o4,	%o6
	sllx	%o3,	0x03,	%i1
	movl	%xcc,	%o1,	%i4
	fmovsgu	%xcc,	%f7,	%f24
	sll	%o2,	0x05,	%l5
	fnot1s	%f17,	%f3
	fmul8sux16	%f28,	%f12,	%f24
	save %g7, 0x1B5D, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g4,	%i6,	%l4
	fmovrdlez	%i2,	%f14,	%f20
	orcc	%l6,	%l0,	%o0
	restore %i7, 0x024F, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stw	%i3,	[%l7 + 0x50]
	for	%f10,	%f0,	%f22
	movrlez	%g1,	%g5,	%o7
	fmovdcs	%xcc,	%f8,	%f11
	edge32	%g2,	%l3,	%o5
	sllx	%l1,	%g6,	%i0
	movge	%xcc,	%o4,	%o6
	lduh	[%l7 + 0x5A],	%o3
	sllx	%i1,	0x12,	%o1
	move	%xcc,	%i4,	%l2
	faligndata	%f0,	%f2,	%f28
	ldsh	[%l7 + 0x68],	%l5
	ld	[%l7 + 0x08],	%f15
	movvs	%xcc,	%o2,	%i5
	nop
	set	0x58, %o7
	ldd	[%l7 + %o7],	%f30
	nop
	set	0x68, %i4
	ldx	[%l7 + %i4],	%g4
	orcc	%i6,	%l4,	%i2
	fmovspos	%xcc,	%f18,	%f5
	fmul8x16	%f14,	%f8,	%f0
	or	%g7,	%l6,	%o0
	mulscc	%l0,	0x1B54,	%i7
	fmovscs	%xcc,	%f12,	%f6
	array8	%g3,	%i3,	%g1
	lduh	[%l7 + 0x2C],	%o7
	fpack16	%f26,	%f6
	lduh	[%l7 + 0x50],	%g5
	addc	%g2,	%l3,	%l1
	mova	%xcc,	%o5,	%i0
	movcs	%xcc,	%o4,	%g6
	alignaddr	%o6,	%o3,	%i1
	movl	%icc,	%i4,	%o1
	srlx	%l5,	0x15,	%o2
	move	%icc,	%i5,	%g4
	fcmple16	%f4,	%f12,	%l2
	lduw	[%l7 + 0x10],	%l4
	ldsb	[%l7 + 0x49],	%i2
	movle	%icc,	%i6,	%l6
	fmul8x16au	%f19,	%f30,	%f22
	movg	%icc,	%o0,	%l0
	stw	%i7,	[%l7 + 0x2C]
	alignaddrl	%g7,	%i3,	%g1
	xor	%o7,	0x1B6E,	%g5
	sllx	%g3,	%l3,	%g2
	fmuld8sux16	%f26,	%f24,	%f18
	fors	%f27,	%f28,	%f18
	movrlz	%l1,	0x00F,	%i0
	movleu	%xcc,	%o4,	%g6
	udiv	%o6,	0x12FC,	%o5
	or	%o3,	%i1,	%o1
	edge8l	%i4,	%o2,	%l5
	movleu	%icc,	%i5,	%g4
	add	%l2,	%i2,	%i6
	alignaddr	%l4,	%o0,	%l6
	fmovsne	%xcc,	%f10,	%f12
	sethi	0x0F5B,	%l0
	fpadd16	%f2,	%f4,	%f6
	movrlz	%g7,	%i7,	%g1
	srlx	%o7,	%i3,	%g5
	ldsb	[%l7 + 0x4B],	%l3
	udivcc	%g2,	0x0B4C,	%g3
	fcmpgt16	%f28,	%f6,	%i0
	edge8l	%o4,	%g6,	%l1
	andncc	%o6,	%o5,	%o3
	andcc	%i1,	%i4,	%o2
	move	%icc,	%l5,	%o1
	movg	%xcc,	%i5,	%l2
	movgu	%xcc,	%i2,	%g4
	fpack16	%f22,	%f18
	save %l4, 0x05F3, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%l6,	%l0,	%g7
	edge32l	%i6,	%g1,	%i7
	edge16n	%i3,	%g5,	%l3
	mova	%xcc,	%o7,	%g2
	edge32l	%i0,	%o4,	%g3
	sll	%l1,	0x02,	%o6
	move	%xcc,	%g6,	%o3
	ldd	[%l7 + 0x78],	%f20
	edge8ln	%i1,	%i4,	%o2
	fpsub32	%f2,	%f14,	%f26
	edge32ln	%l5,	%o1,	%o5
	andncc	%i5,	%i2,	%g4
	sth	%l4,	[%l7 + 0x34]
	nop
	set	0x48, %o5
	ldd	[%l7 + %o5],	%o0
	xor	%l6,	0x17C1,	%l2
	fandnot1	%f28,	%f24,	%f20
	edge32l	%l0,	%i6,	%g1
	alignaddrl	%i7,	%i3,	%g5
	ldsw	[%l7 + 0x14],	%g7
	smulcc	%l3,	%g2,	%o7
	movvs	%icc,	%o4,	%i0
	orncc	%g3,	0x1A58,	%o6
	fornot1	%f10,	%f30,	%f0
	edge32	%g6,	%o3,	%i1
	srlx	%i4,	%l1,	%l5
	edge32n	%o2,	%o1,	%o5
	st	%f30,	[%l7 + 0x78]
	fpsub32	%f22,	%f14,	%f16
	edge8	%i5,	%i2,	%g4
	edge16n	%o0,	%l4,	%l2
	movcs	%icc,	%l6,	%l0
	fzero	%f20
	edge16l	%i6,	%g1,	%i3
	subc	%g5,	%i7,	%g7
	setx loop_27, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_27: 	edge32l	%g2,	%i0,	%g3
	andn	%o4,	0x05F8,	%g6
	movpos	%icc,	%o6,	%o3
	movle	%xcc,	%i1,	%i4
	fmovsneg	%icc,	%f14,	%f22
	edge32l	%l5,	%l1,	%o2
	or	%o1,	0x1F2D,	%o5
	andcc	%i5,	%i2,	%o0
	stw	%l4,	[%l7 + 0x5C]
	edge32	%g4,	%l6,	%l2
	sll	%l0,	0x0F,	%g1
	fmovrsgez	%i3,	%f1,	%f28
	stb	%g5,	[%l7 + 0x2A]
	nop
	set	0x50, %g4
	ldd	[%l7 + %g4],	%f28
	sethi	0x0083,	%i6
	stx	%g7,	[%l7 + 0x20]
	fmovsvc	%xcc,	%f6,	%f10
	edge8	%i7,	%l3,	%g2
	fmuld8ulx16	%f11,	%f0,	%f14
	st	%f8,	[%l7 + 0x30]
	edge32ln	%i0,	%g3,	%o4
	orcc	%o7,	0x023C,	%o6
	sth	%g6,	[%l7 + 0x40]
	srl	%i1,	%o3,	%l5
	movpos	%icc,	%l1,	%o2
	sdiv	%i4,	0x13D0,	%o5
	fpack16	%f0,	%f3
	movn	%xcc,	%o1,	%i5
	movrlz	%i2,	0x162,	%o0
	mulx	%g4,	0x1385,	%l6
	edge16ln	%l4,	%l2,	%g1
	edge16n	%l0,	%i3,	%i6
	xor	%g7,	0x0EDB,	%i7
	edge32n	%l3,	%g2,	%i0
	xor	%g5,	0x10E2,	%g3
	ldd	[%l7 + 0x28],	%o4
	fcmpne32	%f8,	%f12,	%o6
	mulx	%g6,	0x147C,	%o7
	udivcc	%i1,	0x1091,	%o3
	fxor	%f16,	%f18,	%f12
	move	%xcc,	%l5,	%l1
	std	%f0,	[%l7 + 0x30]
	movg	%icc,	%i4,	%o2
	edge8	%o5,	%o1,	%i2
	sir	0x0C29
	fnot1s	%f8,	%f22
	ld	[%l7 + 0x34],	%f26
	xorcc	%o0,	0x04FC,	%i5
	fxor	%f10,	%f4,	%f6
	andn	%g4,	%l6,	%l2
	movrne	%g1,	%l0,	%l4
	fsrc2	%f16,	%f6
	edge8n	%i6,	%g7,	%i3
	fmovdne	%xcc,	%f15,	%f29
	xor	%i7,	%l3,	%g2
	xor	%i0,	0x1C40,	%g3
	orcc	%g5,	%o4,	%o6
	fmovdgu	%xcc,	%f24,	%f13
	umulcc	%g6,	0x03C8,	%i1
	move	%xcc,	%o3,	%o7
	sth	%l5,	[%l7 + 0x26]
	andncc	%l1,	%o2,	%o5
	fsrc2s	%f29,	%f28
	xnor	%o1,	0x092B,	%i2
	edge8l	%o0,	%i4,	%g4
	srl	%l6,	0x16,	%i5
	save %l2, 0x1B5C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%l4,	%f11,	%f19
	ldub	[%l7 + 0x45],	%l0
	fxnor	%f30,	%f16,	%f12
	fcmpgt32	%f22,	%f12,	%g7
	movneg	%icc,	%i3,	%i6
	fcmpeq32	%f30,	%f28,	%l3
	ldub	[%l7 + 0x77],	%i7
	ldd	[%l7 + 0x70],	%f26
	fone	%f0
	fmovdcs	%xcc,	%f18,	%f26
	fandnot2s	%f21,	%f6,	%f4
	alignaddrl	%g2,	%i0,	%g3
	edge32n	%o4,	%o6,	%g6
	sll	%g5,	%i1,	%o3
	srax	%o7,	0x1F,	%l1
	smul	%l5,	%o2,	%o5
	movrgz	%o1,	%o0,	%i4
	smulcc	%g4,	%l6,	%i2
	fnot1	%f30,	%f20
	st	%f19,	[%l7 + 0x48]
	array16	%l2,	%i5,	%g1
	edge8n	%l0,	%l4,	%i3
	sll	%i6,	0x0D,	%g7
	ldsb	[%l7 + 0x23],	%i7
	umul	%l3,	0x16A4,	%g2
	sra	%i0,	0x01,	%o4
	xnorcc	%g3,	%g6,	%o6
	edge32ln	%g5,	%o3,	%i1
	fmul8sux16	%f16,	%f20,	%f14
	edge32	%o7,	%l5,	%o2
	movcs	%icc,	%l1,	%o5
	fnegd	%f30,	%f12
	movpos	%xcc,	%o0,	%o1
	alignaddrl	%i4,	%g4,	%l6
	movpos	%xcc,	%i2,	%i5
	sdivx	%g1,	0x035B,	%l2
	sethi	0x0DAC,	%l0
	array32	%l4,	%i3,	%i6
	sethi	0x17C5,	%g7
	srax	%i7,	0x06,	%g2
	alignaddrl	%i0,	%l3,	%o4
	movleu	%icc,	%g3,	%g6
	orcc	%o6,	%g5,	%o3
	fnegs	%f5,	%f3
	edge16ln	%i1,	%o7,	%l5
	movcc	%icc,	%l1,	%o2
	edge8ln	%o0,	%o5,	%o1
	srax	%i4,	%l6,	%g4
	fmovrdlz	%i5,	%f6,	%f30
	umulcc	%g1,	%i2,	%l2
	movle	%xcc,	%l0,	%l4
	popc	0x10FC,	%i3
	udivx	%i6,	0x15C3,	%g7
	sdiv	%g2,	0x1BCB,	%i7
	nop
	set	0x7F, %i1
	stb	%l3,	[%l7 + %i1]
	movvs	%icc,	%i0,	%o4
	umul	%g3,	%g6,	%g5
	ldsh	[%l7 + 0x1E],	%o3
	array32	%i1,	%o7,	%o6
	movneg	%icc,	%l1,	%l5
	ldd	[%l7 + 0x20],	%o0
	fmovsl	%xcc,	%f26,	%f27
	smul	%o5,	0x0D67,	%o1
	array32	%o2,	%l6,	%g4
	std	%f18,	[%l7 + 0x08]
	fmovrsne	%i5,	%f20,	%f9
	mulx	%g1,	%i4,	%l2
	xnor	%l0,	0x08C0,	%i2
	lduh	[%l7 + 0x2E],	%i3
	edge8l	%l4,	%i6,	%g7
	fnegd	%f2,	%f22
	fmul8x16al	%f0,	%f16,	%f18
	andn	%g2,	%l3,	%i0
	smulcc	%i7,	%o4,	%g6
	orcc	%g5,	%g3,	%o3
	movle	%xcc,	%i1,	%o6
	movrne	%l1,	%l5,	%o7
	movre	%o5,	%o0,	%o1
	movvc	%icc,	%o2,	%g4
	movpos	%xcc,	%i5,	%l6
	fpadd32	%f8,	%f26,	%f22
	mulx	%g1,	%i4,	%l2
	fpadd32	%f8,	%f20,	%f16
	fcmpne32	%f14,	%f0,	%l0
	mulscc	%i3,	%i2,	%i6
	fmovrslez	%g7,	%f28,	%f29
	orncc	%l4,	0x1135,	%g2
	edge32	%l3,	%i7,	%i0
	subcc	%o4,	0x0EA4,	%g6
	fpack32	%f8,	%f16,	%f16
	sllx	%g3,	0x07,	%g5
	udivx	%i1,	0x17DB,	%o3
	edge8l	%l1,	%l5,	%o7
	movne	%icc,	%o5,	%o6
	movvc	%xcc,	%o0,	%o1
	orn	%o2,	0x1AD9,	%g4
	sub	%i5,	0x087E,	%l6
	alignaddrl	%g1,	%l2,	%i4
	lduh	[%l7 + 0x1A],	%l0
	sll	%i2,	%i6,	%g7
	addccc	%i3,	%l4,	%l3
	sdivcc	%g2,	0x0ED0,	%i0
	st	%f5,	[%l7 + 0x7C]
	movgu	%icc,	%i7,	%g6
	ldsh	[%l7 + 0x14],	%g3
	edge32n	%o4,	%g5,	%o3
	edge8l	%i1,	%l5,	%o7
	udivcc	%o5,	0x14F1,	%l1
	sll	%o0,	0x19,	%o1
	xorcc	%o2,	0x191C,	%g4
	fzeros	%f3
	or	%i5,	%o6,	%g1
	edge8ln	%l2,	%l6,	%i4
	mova	%icc,	%l0,	%i2
	addcc	%g7,	0x0E5C,	%i3
	mova	%icc,	%l4,	%i6
	fmovdneg	%xcc,	%f9,	%f15
	move	%icc,	%g2,	%l3
	smulcc	%i0,	0x001C,	%g6
	addc	%g3,	0x1C90,	%o4
	ldd	[%l7 + 0x50],	%f0
	ldub	[%l7 + 0x22],	%g5
	edge8l	%i7,	%i1,	%l5
	movcs	%xcc,	%o7,	%o3
	array32	%l1,	%o5,	%o1
	nop
	set	0x14, %g2
	ldub	[%l7 + %g2],	%o2
	orn	%g4,	0x04D3,	%i5
	alignaddrl	%o6,	%o0,	%l2
	movcc	%xcc,	%g1,	%l6
	sllx	%i4,	%i2,	%g7
	orcc	%l0,	0x1602,	%l4
	andcc	%i3,	0x1476,	%i6
	fmovde	%icc,	%f16,	%f11
	xnor	%l3,	%g2,	%i0
	subcc	%g3,	0x13A4,	%o4
	ldx	[%l7 + 0x50],	%g5
	sth	%i7,	[%l7 + 0x52]
	fmovsvs	%xcc,	%f27,	%f3
	alignaddr	%g6,	%l5,	%o7
	std	%f8,	[%l7 + 0x58]
	addccc	%o3,	%i1,	%o5
	mova	%icc,	%l1,	%o2
	array8	%o1,	%i5,	%o6
	umulcc	%o0,	0x0AAC,	%g4
	srax	%g1,	%l6,	%l2
	add	%i4,	0x08CD,	%i2
	orcc	%g7,	0x0B37,	%l0
	fmovsge	%icc,	%f6,	%f10
	addc	%l4,	%i6,	%i3
	sub	%g2,	%i0,	%l3
	mulx	%g3,	0x1019,	%o4
	and	%i7,	0x0F0B,	%g5
	fmovdvs	%icc,	%f5,	%f6
	orcc	%g6,	0x11C0,	%l5
	sth	%o7,	[%l7 + 0x20]
	faligndata	%f12,	%f20,	%f10
	alignaddrl	%o3,	%i1,	%o5
	edge8ln	%l1,	%o2,	%i5
	srax	%o6,	0x16,	%o0
	fpadd32	%f20,	%f4,	%f28
	movleu	%xcc,	%o1,	%g1
	ldsh	[%l7 + 0x54],	%g4
	subcc	%l2,	%l6,	%i2
	subccc	%g7,	0x1BC6,	%l0
	fmuld8ulx16	%f3,	%f23,	%f4
	edge32ln	%l4,	%i4,	%i6
	ldd	[%l7 + 0x08],	%g2
	fmovsg	%icc,	%f25,	%f4
	addcc	%i0,	0x111D,	%i3
	st	%f2,	[%l7 + 0x44]
	fnot1	%f28,	%f30
	restore %l3, 0x1FE8, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%g3,	0x0ECC,	%g5
	movpos	%xcc,	%g6,	%i7
	edge32n	%o7,	%o3,	%l5
	siam	0x5
	lduw	[%l7 + 0x58],	%i1
	fcmpgt32	%f2,	%f28,	%o5
	udiv	%l1,	0x008A,	%i5
	movl	%icc,	%o2,	%o0
	sethi	0x1908,	%o1
	sll	%o6,	0x14,	%g1
	stx	%g4,	[%l7 + 0x28]
	fxnor	%f10,	%f2,	%f24
	ldub	[%l7 + 0x21],	%l2
	ldsw	[%l7 + 0x2C],	%i2
	sdivx	%l6,	0x1268,	%l0
	move	%icc,	%g7,	%l4
	movcc	%icc,	%i4,	%g2
	fmuld8ulx16	%f11,	%f7,	%f14
	ldd	[%l7 + 0x40],	%i0
	ldsb	[%l7 + 0x60],	%i6
	xnor	%i3,	0x0DD6,	%l3
	sdivx	%g3,	0x111C,	%g5
	subc	%g6,	%i7,	%o4
	fsrc2s	%f21,	%f9
	addccc	%o3,	%l5,	%o7
	movneg	%icc,	%o5,	%i1
	ldd	[%l7 + 0x28],	%l0
	fexpand	%f27,	%f26
	fcmpgt32	%f8,	%f18,	%i5
	or	%o0,	%o2,	%o1
	udivx	%g1,	0x03B0,	%o6
	sir	0x0E19
	movle	%xcc,	%g4,	%i2
	movrlz	%l6,	%l0,	%l2
	fandnot1s	%f7,	%f8,	%f31
	fmovdneg	%xcc,	%f18,	%f15
	or	%g7,	%l4,	%i4
	xnor	%i0,	0x0385,	%g2
	fmovdn	%icc,	%f12,	%f25
	ld	[%l7 + 0x08],	%f1
	subccc	%i3,	%i6,	%l3
	edge8l	%g3,	%g5,	%i7
	sll	%o4,	0x08,	%o3
	edge32n	%g6,	%l5,	%o7
	sll	%o5,	0x0F,	%i1
	subc	%i5,	0x1AC0,	%o0
	xor	%l1,	%o1,	%o2
	nop
	set	0x40, %o2
	lduw	[%l7 + %o2],	%g1
	sll	%g4,	%o6,	%l6
	andn	%l0,	0x0D8F,	%i2
	ldsw	[%l7 + 0x68],	%l2
	popc	0x1D59,	%l4
	ldsw	[%l7 + 0x40],	%i4
	fmovse	%icc,	%f27,	%f25
	ldsh	[%l7 + 0x18],	%g7
	edge32l	%i0,	%i3,	%g2
	andn	%i6,	0x0AF8,	%g3
	fnot1	%f28,	%f22
	and	%g5,	%i7,	%o4
	xor	%o3,	0x17A5,	%g6
	move	%icc,	%l3,	%o7
	edge8	%o5,	%l5,	%i5
	movpos	%icc,	%i1,	%l1
	fmovsa	%icc,	%f6,	%f9
	xor	%o0,	0x1409,	%o2
	srax	%g1,	%g4,	%o1
	xorcc	%l6,	0x0B65,	%o6
	fandnot1s	%f27,	%f26,	%f15
	ld	[%l7 + 0x30],	%f11
	movrgez	%l0,	0x132,	%i2
	siam	0x7
	xnorcc	%l2,	%l4,	%i4
	ld	[%l7 + 0x34],	%f24
	ldd	[%l7 + 0x18],	%i0
	alignaddrl	%i3,	%g2,	%i6
	lduw	[%l7 + 0x18],	%g7
	lduh	[%l7 + 0x5A],	%g3
	sdiv	%g5,	0x07FF,	%o4
	movrlez	%o3,	%g6,	%l3
	ldd	[%l7 + 0x08],	%i6
	fmovsgu	%icc,	%f14,	%f5
	smulcc	%o7,	0x14AA,	%l5
	edge32	%o5,	%i1,	%i5
	edge16n	%o0,	%l1,	%o2
	addccc	%g4,	%o1,	%g1
	orn	%o6,	%l6,	%l0
	std	%f18,	[%l7 + 0x20]
	smulcc	%l2,	%l4,	%i4
	nop
	set	0x5C, %o3
	ldsh	[%l7 + %o3],	%i0
	ldd	[%l7 + 0x60],	%i2
	sth	%i2,	[%l7 + 0x62]
	fmovrslz	%i6,	%f25,	%f23
	and	%g2,	0x1D37,	%g3
	array16	%g7,	%o4,	%g5
	movcc	%xcc,	%o3,	%l3
	fmovsvs	%xcc,	%f30,	%f28
	fmovsgu	%xcc,	%f26,	%f6
	edge16ln	%i7,	%o7,	%g6
	move	%icc,	%o5,	%l5
	addcc	%i1,	0x0B35,	%i5
	array32	%l1,	%o2,	%o0
	edge8n	%g4,	%o1,	%o6
	umulcc	%g1,	0x03FC,	%l0
	edge32ln	%l2,	%l6,	%i4
	movre	%i0,	0x286,	%i3
	edge8	%l4,	%i6,	%i2
	move	%xcc,	%g2,	%g7
	edge32	%g3,	%o4,	%o3
	andncc	%l3,	%g5,	%o7
	std	%f4,	[%l7 + 0x20]
	ldd	[%l7 + 0x40],	%f24
	orn	%i7,	%g6,	%l5
	movge	%icc,	%i1,	%o5
	stw	%i5,	[%l7 + 0x70]
	fmovdcs	%icc,	%f23,	%f0
	movle	%xcc,	%l1,	%o0
	fpack32	%f12,	%f16,	%f24
	addcc	%g4,	0x1D04,	%o1
	orn	%o2,	%o6,	%l0
	xnor	%g1,	%l6,	%l2
	sdivcc	%i4,	0x0A44,	%i0
	andcc	%i3,	0x0FF1,	%l4
	sdiv	%i2,	0x08AB,	%g2
	edge8l	%i6,	%g3,	%o4
	fandnot1s	%f3,	%f18,	%f29
	or	%g7,	0x1073,	%o3
	fmovda	%icc,	%f15,	%f15
	mulx	%l3,	0x0DF4,	%g5
	fmovdl	%icc,	%f14,	%f14
	movpos	%xcc,	%o7,	%i7
	save %g6, %i1, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x54],	%i5
	edge16n	%l1,	%o5,	%g4
	fmovscs	%icc,	%f3,	%f4
	and	%o0,	%o1,	%o6
	faligndata	%f0,	%f30,	%f24
	edge8	%l0,	%g1,	%o2
	movre	%l6,	%l2,	%i4
	movcc	%icc,	%i0,	%l4
	addccc	%i3,	0x0CA6,	%g2
	orn	%i6,	0x0C70,	%g3
	movle	%icc,	%o4,	%g7
	or	%i2,	%o3,	%l3
	fmovdg	%icc,	%f8,	%f14
	movleu	%xcc,	%o7,	%g5
	addccc	%g6,	%i7,	%l5
	fmovdvs	%icc,	%f13,	%f16
	lduw	[%l7 + 0x18],	%i1
	movge	%xcc,	%i5,	%o5
	fmovsa	%icc,	%f25,	%f22
	edge8	%g4,	%l1,	%o1
	srl	%o0,	0x1D,	%l0
	fpadd16	%f16,	%f16,	%f4
	edge16	%g1,	%o2,	%o6
	movle	%xcc,	%l2,	%i4
	fxor	%f24,	%f28,	%f2
	orcc	%l6,	0x06A6,	%l4
	xnor	%i0,	0x1BCD,	%g2
	popc	0x03CF,	%i6
	umul	%g3,	%i3,	%g7
	smul	%o4,	0x0004,	%o3
	save %l3, %o7, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdle	%xcc,	%f25,	%f17
	edge16ln	%g5,	%g6,	%l5
	movcs	%icc,	%i1,	%i7
	andncc	%o5,	%g4,	%i5
	movcc	%icc,	%o1,	%l1
	xnorcc	%o0,	0x0C33,	%l0
	move	%xcc,	%o2,	%g1
	orn	%l2,	%o6,	%l6
	fmovrsgez	%l4,	%f7,	%f13
	movrgz	%i4,	%i0,	%g2
	movge	%xcc,	%i6,	%i3
	movn	%xcc,	%g7,	%g3
	udivcc	%o3,	0x0411,	%l3
	addccc	%o4,	0x097B,	%o7
	movvs	%xcc,	%g5,	%i2
	fcmpd	%fcc3,	%f2,	%f10
	ld	[%l7 + 0x54],	%f27
	orcc	%l5,	%i1,	%g6
	movcs	%icc,	%o5,	%g4
	fandnot1	%f18,	%f18,	%f10
	edge32l	%i7,	%i5,	%l1
	movcc	%xcc,	%o0,	%l0
	udiv	%o1,	0x1B5A,	%g1
	subc	%o2,	%l2,	%l6
	andcc	%o6,	%i4,	%i0
	movg	%icc,	%l4,	%i6
	mova	%xcc,	%i3,	%g2
	movrne	%g7,	%o3,	%l3
	movneg	%xcc,	%g3,	%o4
	movl	%icc,	%o7,	%i2
	addcc	%l5,	0x1A43,	%g5
	addccc	%i1,	%o5,	%g6
	stw	%g4,	[%l7 + 0x5C]
	edge16	%i7,	%l1,	%i5
	addccc	%l0,	%o1,	%o0
	fmovscc	%xcc,	%f10,	%f30
	xorcc	%o2,	0x1704,	%l2
	movvc	%icc,	%g1,	%o6
	srlx	%i4,	%l6,	%i0
	addcc	%i6,	%i3,	%l4
	movpos	%icc,	%g7,	%g2
	movpos	%xcc,	%l3,	%o3
	sethi	0x0815,	%g3
	movvs	%icc,	%o7,	%i2
	or	%o4,	%g5,	%i1
	subcc	%l5,	0x0DEC,	%o5
	edge16ln	%g6,	%g4,	%l1
	fmovrslez	%i5,	%f20,	%f27
	fones	%f31
	movrne	%l0,	%o1,	%o0
	sra	%i7,	0x1D,	%o2
	orncc	%g1,	0x18D3,	%l2
	fmovsl	%icc,	%f12,	%f29
	fmovdpos	%icc,	%f22,	%f11
	fnor	%f8,	%f22,	%f20
	movne	%xcc,	%i4,	%o6
	st	%f20,	[%l7 + 0x5C]
	orn	%l6,	%i0,	%i3
	bshuffle	%f24,	%f20,	%f8
	sub	%l4,	0x1523,	%i6
	ldd	[%l7 + 0x28],	%g6
	mova	%icc,	%g2,	%o3
	edge8l	%l3,	%o7,	%i2
	udiv	%g3,	0x1693,	%g5
	umul	%i1,	%l5,	%o4
	movle	%icc,	%o5,	%g4
	orcc	%g6,	0x1F66,	%i5
	sll	%l1,	%o1,	%o0
	sll	%i7,	0x06,	%o2
	addcc	%g1,	0x0721,	%l0
	udiv	%l2,	0x0E9C,	%i4
	udiv	%o6,	0x1E35,	%i0
	andncc	%l6,	%l4,	%i3
	movl	%xcc,	%i6,	%g2
	fmovdn	%xcc,	%f23,	%f27
	fmovse	%icc,	%f4,	%f19
	xnorcc	%g7,	0x10A4,	%o3
	subc	%l3,	0x06A2,	%i2
	edge32l	%g3,	%o7,	%g5
	fmovse	%xcc,	%f26,	%f4
	edge16ln	%i1,	%o4,	%o5
	fpsub16	%f18,	%f12,	%f28
	fmovrdgz	%g4,	%f28,	%f0
	movvc	%icc,	%g6,	%l5
	ldx	[%l7 + 0x28],	%l1
	fmovrdlez	%o1,	%f20,	%f0
	orn	%i5,	0x0308,	%i7
	sethi	0x0B2C,	%o0
	edge16l	%o2,	%l0,	%l2
	movvs	%xcc,	%i4,	%g1
	edge16	%i0,	%l6,	%l4
	umul	%i3,	%i6,	%o6
	fxnors	%f3,	%f5,	%f29
	sir	0x138C
	fmovda	%icc,	%f14,	%f0
	xnorcc	%g2,	0x119A,	%g7
	nop
	set	0x20, %g5
	ldd	[%l7 + %g5],	%l2
	fmovdneg	%icc,	%f23,	%f6
	fmovdle	%icc,	%f27,	%f8
	xorcc	%o3,	0x0376,	%i2
	subc	%g3,	%o7,	%i1
	fmul8x16	%f20,	%f18,	%f22
	nop
	set	0x40, %i6
	ldd	[%l7 + %i6],	%f14
	nop
	set	0x38, %o1
	ldd	[%l7 + %o1],	%g4
	mulscc	%o5,	%g4,	%g6
	array16	%o4,	%l5,	%l1
	xnorcc	%o1,	0x1BAE,	%i7
	array32	%i5,	%o0,	%o2
	fmovrdlez	%l2,	%f18,	%f6
	smul	%i4,	0x196C,	%l0
	fors	%f29,	%f22,	%f28
	mulscc	%g1,	0x06D6,	%l6
	movcc	%xcc,	%l4,	%i0
	movrlez	%i6,	%o6,	%i3
	move	%icc,	%g2,	%l3
	fabss	%f26,	%f8
	fnot2s	%f23,	%f21
	mova	%xcc,	%g7,	%o3
	srlx	%g3,	%o7,	%i1
	fmovrslz	%i2,	%f2,	%f5
	fone	%f0
	udiv	%g5,	0x1DDD,	%o5
	ldub	[%l7 + 0x16],	%g4
	sll	%g6,	%o4,	%l1
	fands	%f14,	%f24,	%f12
	sdivcc	%l5,	0x1241,	%i7
	ldx	[%l7 + 0x18],	%o1
	orncc	%o0,	0x04F4,	%i5
	movrgez	%o2,	0x1DD,	%i4
	movn	%xcc,	%l0,	%l2
	sethi	0x0737,	%g1
	ldsh	[%l7 + 0x58],	%l6
	andncc	%i0,	%i6,	%l4
	subc	%o6,	0x0F5A,	%g2
	sir	0x1195
	fandnot1	%f26,	%f14,	%f6
	fpsub16s	%f22,	%f0,	%f19
	edge32l	%i3,	%l3,	%o3
	edge16n	%g7,	%g3,	%o7
	subcc	%i1,	0x01F7,	%i2
	movcc	%icc,	%g5,	%g4
	fornot2s	%f4,	%f30,	%f11
	fands	%f13,	%f5,	%f6
	and	%g6,	%o4,	%l1
	movrlez	%o5,	%i7,	%l5
	fmovsgu	%icc,	%f31,	%f13
	sethi	0x067D,	%o1
	std	%f0,	[%l7 + 0x20]
	fnot1	%f14,	%f4
	addcc	%o0,	%o2,	%i5
	subcc	%i4,	%l2,	%g1
	fandnot1s	%f17,	%f27,	%f2
	fornot2s	%f24,	%f20,	%f31
	fcmple32	%f10,	%f24,	%l6
	edge8l	%l0,	%i0,	%i6
	movvc	%xcc,	%l4,	%g2
	ldsw	[%l7 + 0x38],	%i3
	andn	%l3,	%o3,	%g7
	ldsh	[%l7 + 0x58],	%g3
	andncc	%o7,	%o6,	%i2
	movn	%icc,	%i1,	%g5
	andn	%g6,	%g4,	%l1
	movne	%icc,	%o5,	%o4
	orncc	%l5,	0x040B,	%o1
	alignaddrl	%o0,	%o2,	%i5
	movgu	%xcc,	%i4,	%l2
	umul	%g1,	%i7,	%l0
	movrgez	%l6,	0x221,	%i0
	fornot1s	%f16,	%f5,	%f26
	fcmple32	%f20,	%f14,	%i6
	siam	0x0
	sdivcc	%g2,	0x163B,	%l4
	edge16l	%i3,	%l3,	%g7
	fmovda	%xcc,	%f11,	%f29
	move	%icc,	%g3,	%o7
	sll	%o6,	%o3,	%i1
	smul	%i2,	0x1019,	%g6
	ldub	[%l7 + 0x51],	%g4
	smulcc	%l1,	%o5,	%o4
	sdiv	%g5,	0x1138,	%o1
	movle	%xcc,	%l5,	%o0
	subccc	%i5,	0x001A,	%o2
	fones	%f14
	sllx	%i4,	%l2,	%g1
	mova	%xcc,	%i7,	%l6
	popc	0x0F7F,	%l0
	edge32l	%i6,	%i0,	%g2
	movrgz	%i3,	0x2DE,	%l4
	movge	%icc,	%l3,	%g7
	sth	%o7,	[%l7 + 0x60]
	orn	%o6,	0x1EB8,	%g3
	orn	%i1,	%o3,	%g6
	srl	%i2,	%g4,	%l1
	fnegd	%f4,	%f28
	fornot2s	%f3,	%f30,	%f27
	movl	%xcc,	%o4,	%o5
	and	%o1,	%g5,	%o0
	alignaddr	%l5,	%o2,	%i4
	movrgez	%i5,	0x2E0,	%g1
	stb	%i7,	[%l7 + 0x64]
	movrne	%l6,	%l2,	%i6
	subc	%l0,	0x1948,	%i0
	udivcc	%i3,	0x0C03,	%g2
	edge32n	%l4,	%l3,	%g7
	fxnors	%f20,	%f10,	%f19
	subccc	%o7,	%o6,	%g3
	st	%f1,	[%l7 + 0x78]
	std	%f18,	[%l7 + 0x28]
	stx	%i1,	[%l7 + 0x50]
	sra	%o3,	%i2,	%g6
	array32	%g4,	%o4,	%o5
	edge16n	%l1,	%o1,	%g5
	fcmpgt16	%f24,	%f24,	%o0
	movpos	%icc,	%o2,	%i4
	movrlz	%l5,	0x2C6,	%g1
	fornot2s	%f25,	%f22,	%f27
	udiv	%i7,	0x1D22,	%l6
	array8	%i5,	%l2,	%i6
	edge32ln	%l0,	%i3,	%g2
	fcmpd	%fcc1,	%f0,	%f24
	smulcc	%i0,	0x149A,	%l3
	subccc	%g7,	0x1890,	%l4
	movrlz	%o7,	%g3,	%i1
	sdiv	%o6,	0x03D1,	%o3
	xnorcc	%i2,	%g4,	%o4
	movneg	%icc,	%g6,	%o5
	srax	%l1,	%o1,	%o0
	movg	%icc,	%o2,	%i4
	fmovda	%icc,	%f20,	%f3
	edge8n	%l5,	%g5,	%g1
	movrgz	%l6,	%i5,	%i7
	ld	[%l7 + 0x34],	%f13
	fpsub16s	%f17,	%f14,	%f13
	subcc	%i6,	%l0,	%i3
	fpmerge	%f21,	%f11,	%f2
	nop
	set	0x78, %o6
	std	%f14,	[%l7 + %o6]
	fmovse	%icc,	%f23,	%f20
	fandnot1s	%f23,	%f27,	%f24
	subccc	%g2,	%l2,	%i0
	srax	%l3,	%g7,	%l4
	movle	%icc,	%g3,	%o7
	movleu	%icc,	%o6,	%i1
	nop
	set	0x18, %l5
	ldd	[%l7 + %l5],	%o2
	umulcc	%g4,	%o4,	%g6
	save %i2, 0x0EB6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o1,	[%l7 + 0x20]
	st	%f22,	[%l7 + 0x4C]
	andn	%o0,	%o2,	%i4
	sdiv	%l1,	0x1382,	%l5
	sra	%g1,	%l6,	%g5
	edge8ln	%i7,	%i6,	%l0
	movn	%icc,	%i3,	%g2
	edge16n	%l2,	%i0,	%i5
	array16	%l3,	%g7,	%l4
	addccc	%g3,	0x1983,	%o6
	and	%i1,	0x06FD,	%o3
	fmovrde	%o7,	%f2,	%f24
	array8	%o4,	%g6,	%g4
	or	%o5,	0x1B30,	%i2
	srl	%o1,	0x0D,	%o0
	andn	%i4,	%o2,	%l5
	fmuld8sux16	%f26,	%f1,	%f4
	movrne	%l1,	0x160,	%g1
	addc	%l6,	0x0285,	%g5
	sethi	0x0BE7,	%i6
	edge32n	%l0,	%i7,	%i3
	xorcc	%g2,	0x12BA,	%l2
	xnorcc	%i5,	0x0CD7,	%l3
	alignaddr	%g7,	%i0,	%l4
	edge16n	%o6,	%i1,	%g3
	udivx	%o7,	0x01F5,	%o3
	fnot1s	%f12,	%f14
	mulx	%o4,	%g6,	%o5
	fmovsg	%icc,	%f24,	%f30
	andncc	%i2,	%g4,	%o1
	fmul8sux16	%f26,	%f20,	%f0
	fcmpeq16	%f8,	%f22,	%o0
	movle	%xcc,	%i4,	%l5
	ldsb	[%l7 + 0x2A],	%l1
	lduw	[%l7 + 0x44],	%g1
	movre	%l6,	0x365,	%o2
	move	%xcc,	%i6,	%l0
	fone	%f26
	fmovrdgz	%g5,	%f26,	%f2
	srlx	%i3,	0x0F,	%i7
	ldub	[%l7 + 0x5F],	%l2
	array16	%g2,	%i5,	%l3
	movge	%xcc,	%g7,	%l4
	fmovdg	%icc,	%f3,	%f28
	edge16n	%i0,	%i1,	%g3
	edge32n	%o7,	%o6,	%o4
	addc	%o3,	0x10D2,	%o5
	fmuld8ulx16	%f11,	%f10,	%f24
	addc	%i2,	%g6,	%o1
	array16	%g4,	%o0,	%l5
	fnegd	%f0,	%f10
	mulscc	%i4,	%l1,	%g1
	fnot2s	%f12,	%f22
	movneg	%xcc,	%o2,	%i6
	fpsub32	%f18,	%f24,	%f12
	movrlez	%l6,	%g5,	%i3
	movg	%xcc,	%l0,	%i7
	fmovsneg	%xcc,	%f15,	%f4
	or	%g2,	0x14B5,	%l2
	edge8l	%l3,	%i5,	%g7
	stx	%l4,	[%l7 + 0x28]
	sdiv	%i0,	0x1711,	%i1
	alignaddr	%o7,	%o6,	%o4
	andncc	%o3,	%o5,	%g3
	array8	%g6,	%i2,	%o1
	sll	%g4,	0x08,	%o0
	sth	%i4,	[%l7 + 0x12]
	edge32n	%l1,	%g1,	%l5
	ldsh	[%l7 + 0x44],	%i6
	fandnot1	%f26,	%f14,	%f0
	edge32l	%o2,	%l6,	%g5
	movrgz	%i3,	0x0A9,	%l0
	std	%f24,	[%l7 + 0x60]
	edge32ln	%g2,	%l2,	%i7
	array32	%l3,	%i5,	%l4
	addc	%g7,	0x170A,	%i0
	sth	%o7,	[%l7 + 0x0C]
	edge32	%i1,	%o6,	%o3
	mulx	%o4,	0x01F4,	%g3
	fmovsg	%icc,	%f29,	%f1
	sir	0x034E
	srlx	%o5,	%i2,	%g6
	movcc	%xcc,	%g4,	%o0
	fpsub32s	%f0,	%f25,	%f28
	std	%f2,	[%l7 + 0x38]
	movcc	%icc,	%i4,	%l1
	movpos	%xcc,	%g1,	%l5
	andcc	%o1,	0x1D10,	%o2
	movvs	%icc,	%i6,	%g5
	sethi	0x1AC7,	%i3
	edge16n	%l6,	%g2,	%l0
	bshuffle	%f4,	%f14,	%f20
	fmul8x16	%f15,	%f14,	%f18
	fnot1	%f20,	%f8
	udiv	%l2,	0x0233,	%l3
	edge8	%i5,	%i7,	%l4
	movne	%xcc,	%i0,	%o7
	orn	%g7,	0x1332,	%i1
	subccc	%o3,	0x0E78,	%o6
	mulscc	%o4,	0x0070,	%g3
	std	%f22,	[%l7 + 0x10]
	fmovsa	%xcc,	%f17,	%f12
	fmovdvc	%xcc,	%f16,	%f23
	fmovs	%f31,	%f23
	ld	[%l7 + 0x40],	%f30
	movrgez	%i2,	0x09B,	%g6
	or	%g4,	%o5,	%i4
	faligndata	%f16,	%f6,	%f12
	fxnor	%f22,	%f30,	%f24
	edge16l	%o0,	%g1,	%l1
	edge16n	%o1,	%o2,	%l5
	add	%i6,	0x158D,	%i3
	stx	%g5,	[%l7 + 0x08]
	movcs	%xcc,	%l6,	%g2
	fcmpgt16	%f22,	%f4,	%l2
	fmovdge	%xcc,	%f5,	%f25
	edge32l	%l3,	%i5,	%l0
	stx	%l4,	[%l7 + 0x40]
	ldub	[%l7 + 0x1E],	%i0
	edge16n	%i7,	%g7,	%i1
	array8	%o7,	%o3,	%o6
	fmuld8ulx16	%f1,	%f12,	%f26
	fzero	%f30
	stb	%g3,	[%l7 + 0x39]
	fpack32	%f20,	%f12,	%f4
	edge8	%o4,	%i2,	%g6
	addccc	%g4,	0x1470,	%i4
	edge16	%o5,	%g1,	%l1
	movg	%icc,	%o0,	%o2
	andn	%l5,	%i6,	%i3
	ldsw	[%l7 + 0x7C],	%o1
	setx loop_28, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_28: 	edge8n	%l2,	%l3,	%g2
	edge32	%l0,	%i5,	%l4
	std	%f12,	[%l7 + 0x50]
	umulcc	%i7,	0x1CC4,	%g7
	fmovde	%xcc,	%f22,	%f31
	ldd	[%l7 + 0x58],	%f24
	fsrc1s	%f26,	%f0
	andncc	%i1,	%i0,	%o7
	edge8ln	%o3,	%o6,	%g3
	movg	%xcc,	%i2,	%g6
	addcc	%g4,	0x0C6D,	%o4
	alignaddr	%i4,	%g1,	%l1
	sll	%o5,	0x0C,	%o0
	sll	%l5,	0x18,	%i6
	edge16	%i3,	%o1,	%l6
	fmuld8sux16	%f11,	%f23,	%f22
	stx	%g5,	[%l7 + 0x08]
	sethi	0x16A1,	%l2
	addccc	%o2,	0x19D7,	%l3
	movneg	%xcc,	%l0,	%i5
	fmovdvc	%xcc,	%f2,	%f19
	edge32l	%l4,	%i7,	%g2
	fmovrdlez	%i1,	%f20,	%f0
	ldd	[%l7 + 0x50],	%i0
	edge32n	%o7,	%o3,	%g7
	edge8n	%g3,	%i2,	%g6
	fmul8ulx16	%f10,	%f4,	%f14
	smulcc	%o6,	%o4,	%g4
	sra	%g1,	%l1,	%o5
	fmovde	%xcc,	%f6,	%f5
	array8	%i4,	%l5,	%i6
	ldsh	[%l7 + 0x3A],	%o0
	fpackfix	%f12,	%f23
	edge16	%o1,	%i3,	%g5
	save %l2, %l6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l0,	%i5,	%l3
	popc	0x1ABE,	%i7
	mulscc	%g2,	0x14CC,	%i1
	movvs	%icc,	%i0,	%o7
	edge16	%l4,	%o3,	%g3
	edge32l	%g7,	%g6,	%o6
	xnor	%i2,	0x16DA,	%g4
	mova	%xcc,	%o4,	%g1
	addc	%o5,	0x1920,	%l1
	and	%i4,	%i6,	%l5
	fornot1s	%f25,	%f12,	%f16
	udivcc	%o1,	0x0944,	%i3
	edge16n	%g5,	%l2,	%l6
	sethi	0x0472,	%o0
	edge8ln	%l0,	%o2,	%l3
	xorcc	%i7,	%g2,	%i1
	alignaddrl	%i5,	%o7,	%l4
	and	%o3,	%i0,	%g7
	movne	%xcc,	%g6,	%o6
	edge32ln	%i2,	%g3,	%g4
	movle	%icc,	%o4,	%o5
	subc	%l1,	%i4,	%i6
	udiv	%l5,	0x0440,	%o1
	movpos	%xcc,	%g1,	%i3
	subcc	%l2,	0x1006,	%g5
	umulcc	%l6,	0x1D7B,	%l0
	ldx	[%l7 + 0x58],	%o2
	movne	%xcc,	%l3,	%i7
	fmovdne	%icc,	%f23,	%f17
	orcc	%g2,	%i1,	%o0
	edge16	%i5,	%l4,	%o3
	add	%i0,	0x10FB,	%g7
	fnors	%f22,	%f6,	%f15
	edge32	%g6,	%o7,	%i2
	ldsw	[%l7 + 0x0C],	%g3
	fors	%f31,	%f15,	%f1
	subccc	%o6,	%g4,	%o5
	mulscc	%o4,	0x1E1C,	%l1
	xnorcc	%i6,	%l5,	%i4
	addcc	%g1,	0x090D,	%o1
	mulscc	%l2,	%g5,	%l6
	fandnot1s	%f16,	%f16,	%f27
	edge32n	%i3,	%l0,	%o2
	movvc	%xcc,	%i7,	%l3
	ld	[%l7 + 0x70],	%f7
	movcc	%xcc,	%g2,	%o0
	srl	%i1,	%l4,	%i5
	sub	%o3,	%i0,	%g7
	fornot2s	%f5,	%f22,	%f25
	fmovrdlez	%g6,	%f10,	%f16
	ldd	[%l7 + 0x50],	%o6
	fors	%f15,	%f23,	%f12
	fmovdvc	%icc,	%f1,	%f5
	sll	%i2,	0x12,	%o6
	movge	%xcc,	%g3,	%g4
	umulcc	%o4,	0x1C90,	%l1
	fornot2	%f18,	%f24,	%f16
	srl	%i6,	0x00,	%o5
	stb	%i4,	[%l7 + 0x50]
	fmovrsne	%g1,	%f19,	%f17
	orncc	%o1,	%l5,	%g5
	fpadd16s	%f24,	%f0,	%f18
	move	%xcc,	%l6,	%l2
	fornot1s	%f26,	%f21,	%f9
	bshuffle	%f4,	%f12,	%f0
	edge8	%i3,	%l0,	%i7
	fnand	%f6,	%f16,	%f26
	movle	%icc,	%o2,	%l3
	smulcc	%o0,	0x18F5,	%i1
	fpack16	%f26,	%f0
	fands	%f3,	%f15,	%f7
	fands	%f29,	%f1,	%f9
	fnot1s	%f2,	%f29
	fcmped	%fcc3,	%f0,	%f0
	move	%icc,	%g2,	%i5
	andcc	%o3,	0x07BD,	%l4
	fpackfix	%f16,	%f23
	movvc	%xcc,	%i0,	%g7
	ldd	[%l7 + 0x28],	%o6
	stw	%i2,	[%l7 + 0x18]
	alignaddrl	%g6,	%o6,	%g3
	movg	%icc,	%o4,	%l1
	srax	%i6,	0x0F,	%o5
	movrlez	%g4,	0x138,	%g1
	movl	%xcc,	%i4,	%l5
	save %g5, 0x0DDF, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%l2,	%i3,	%l6
	srl	%i7,	%o2,	%l0
	subc	%o0,	%i1,	%l3
	fpsub32	%f30,	%f18,	%f30
	alignaddr	%g2,	%i5,	%o3
	ldd	[%l7 + 0x70],	%f12
	movneg	%xcc,	%i0,	%l4
	addccc	%g7,	%o7,	%g6
	ldd	[%l7 + 0x40],	%f2
	fmul8x16al	%f24,	%f17,	%f22
	movrne	%i2,	0x010,	%o6
	subcc	%g3,	0x120A,	%l1
	umul	%o4,	%i6,	%o5
	xnorcc	%g1,	%i4,	%g4
	stx	%l5,	[%l7 + 0x18]
	movrgez	%o1,	0x328,	%g5
	xnor	%l2,	0x0CA4,	%i3
	alignaddr	%l6,	%o2,	%i7
	srlx	%l0,	%o0,	%i1
	sdivcc	%g2,	0x1CF3,	%l3
	sdivcc	%i5,	0x06C4,	%i0
	sdivx	%o3,	0x0331,	%g7
	sdivx	%o7,	0x03EB,	%g6
	nop
	set	0x30, %l0
	lduw	[%l7 + %l0],	%l4
	addccc	%o6,	%i2,	%g3
	fsrc1s	%f14,	%f12
	fnand	%f12,	%f18,	%f14
	movcc	%xcc,	%l1,	%o4
	movrne	%o5,	0x32B,	%i6
	subccc	%g1,	0x12B2,	%i4
	addcc	%l5,	0x150C,	%g4
	udivx	%g5,	0x00C1,	%o1
	udivcc	%l2,	0x0D48,	%i3
	orncc	%l6,	0x1F5C,	%i7
	sethi	0x1565,	%l0
	fmovs	%f15,	%f13
	xorcc	%o0,	%i1,	%o2
	move	%icc,	%l3,	%g2
	orn	%i0,	0x1086,	%o3
	xorcc	%g7,	0x0F38,	%o7
	fpackfix	%f2,	%f18
	movle	%icc,	%i5,	%g6
	movne	%icc,	%l4,	%o6
	fmuld8sux16	%f7,	%f16,	%f26
	movne	%icc,	%g3,	%l1
	sub	%i2,	%o4,	%i6
	fpadd32s	%f18,	%f16,	%f23
	ld	[%l7 + 0x48],	%f19
	sdiv	%o5,	0x0CE6,	%g1
	movre	%l5,	%i4,	%g5
	move	%xcc,	%g4,	%o1
	fmovrdlez	%i3,	%f8,	%f2
	array16	%l6,	%l2,	%l0
	edge32l	%o0,	%i1,	%o2
	udiv	%l3,	0x15E3,	%i7
	alignaddrl	%g2,	%i0,	%o3
	udivcc	%g7,	0x0814,	%i5
	movvs	%xcc,	%o7,	%g6
	movcs	%xcc,	%o6,	%l4
	movrgez	%g3,	0x3AE,	%i2
	fmul8x16	%f6,	%f18,	%f16
	udivcc	%l1,	0x05F2,	%i6
	stb	%o5,	[%l7 + 0x16]
	sllx	%o4,	0x15,	%g1
	fcmpd	%fcc1,	%f26,	%f30
	sub	%l5,	0x1CC5,	%g5
	umul	%g4,	%o1,	%i3
	ldsh	[%l7 + 0x1A],	%l6
	andcc	%i4,	%l2,	%o0
	andncc	%i1,	%o2,	%l0
	movcs	%xcc,	%i7,	%l3
	fcmpgt16	%f26,	%f26,	%g2
	sra	%o3,	0x02,	%i0
	fmovd	%f14,	%f4
	sllx	%i5,	0x0D,	%g7
	movgu	%xcc,	%o7,	%g6
	array8	%o6,	%g3,	%l4
	std	%f2,	[%l7 + 0x48]
	stx	%i2,	[%l7 + 0x28]
	fmovdcs	%xcc,	%f7,	%f10
	fandnot2s	%f22,	%f2,	%f16
	siam	0x3
	edge32n	%i6,	%o5,	%l1
	add	%o4,	0x1C7C,	%l5
	edge8n	%g5,	%g4,	%g1
	restore %o1, 0x0299, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l6,	%l2,	%o0
	edge8ln	%i1,	%i4,	%o2
	addccc	%i7,	%l0,	%l3
	fpackfix	%f12,	%f5
	setx loop_29, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_29: 	subcc	%g7,	%o7,	%g6
	stx	%o6,	[%l7 + 0x30]
	ldx	[%l7 + 0x40],	%i0
	movg	%icc,	%l4,	%i2
	srl	%i6,	0x06,	%g3
	udivx	%l1,	0x0FA9,	%o5
	sth	%o4,	[%l7 + 0x1C]
	move	%icc,	%g5,	%g4
	fmovse	%icc,	%f17,	%f30
	ldsb	[%l7 + 0x6E],	%g1
	orn	%l5,	0x0886,	%i3
	umulcc	%o1,	0x0F8C,	%l6
	movg	%icc,	%o0,	%l2
	addcc	%i1,	%i4,	%i7
	ldx	[%l7 + 0x68],	%o2
	fpmerge	%f13,	%f25,	%f10
	movcs	%icc,	%l3,	%o3
	alignaddr	%l0,	%i5,	%g7
	edge16n	%g2,	%o7,	%o6
	subccc	%i0,	0x089E,	%l4
	andcc	%g6,	%i6,	%i2
	stb	%l1,	[%l7 + 0x0E]
	orn	%o5,	0x0E8B,	%o4
	ldub	[%l7 + 0x20],	%g5
	edge16n	%g4,	%g1,	%l5
	fandnot2s	%f13,	%f3,	%f21
	edge16ln	%i3,	%g3,	%o1
	udiv	%o0,	0x0570,	%l6
	movg	%xcc,	%l2,	%i1
	fmovd	%f26,	%f4
	array32	%i7,	%o2,	%l3
	sdiv	%o3,	0x05EA,	%l0
	edge8l	%i4,	%i5,	%g7
	xnor	%g2,	%o6,	%i0
	fxnors	%f22,	%f6,	%f15
	sllx	%l4,	%o7,	%i6
	fmovde	%xcc,	%f26,	%f1
	lduh	[%l7 + 0x78],	%i2
	mulscc	%l1,	0x16FD,	%o5
	srl	%g6,	%g5,	%g4
	fmovdgu	%xcc,	%f17,	%f22
	fnor	%f20,	%f20,	%f26
	smulcc	%g1,	%o4,	%l5
	xor	%i3,	0x13E8,	%o1
	sdivx	%o0,	0x14DD,	%l6
	movg	%xcc,	%g3,	%i1
	stb	%i7,	[%l7 + 0x50]
	movrgz	%o2,	0x274,	%l3
	sdivcc	%l2,	0x10EF,	%o3
	sth	%i4,	[%l7 + 0x18]
	movrne	%i5,	0x288,	%g7
	fmovdpos	%icc,	%f23,	%f12
	movvc	%icc,	%l0,	%g2
	udiv	%i0,	0x1123,	%l4
	fxnor	%f14,	%f24,	%f14
	srax	%o6,	%i6,	%o7
	sll	%l1,	%i2,	%g6
	fmovsn	%icc,	%f1,	%f23
	addc	%o5,	0x1186,	%g4
	ldx	[%l7 + 0x78],	%g5
	movgu	%xcc,	%g1,	%o4
	edge8n	%l5,	%o1,	%o0
	movn	%xcc,	%l6,	%g3
	fmovrsne	%i3,	%f0,	%f10
	edge32	%i7,	%o2,	%l3
	fsrc2s	%f1,	%f24
	movcs	%icc,	%l2,	%o3
	addc	%i1,	0x0E90,	%i4
	movpos	%xcc,	%g7,	%l0
	fcmpd	%fcc0,	%f16,	%f24
	addcc	%i5,	%g2,	%l4
	ld	[%l7 + 0x60],	%f17
	edge8ln	%i0,	%i6,	%o7
	andncc	%o6,	%i2,	%g6
	addcc	%o5,	%l1,	%g4
	movl	%icc,	%g5,	%g1
	stx	%l5,	[%l7 + 0x60]
	movrgez	%o1,	%o4,	%o0
	nop
	set	0x4E, %l3
	ldsb	[%l7 + %l3],	%g3
	sethi	0x1B69,	%i3
	restore %i7, 0x1D85, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movpos	%icc,	%l3,	%l6
	movcc	%icc,	%o3,	%i1
	edge16n	%i4,	%l2,	%l0
	movrgz	%g7,	%i5,	%g2
	sdivx	%l4,	0x0C71,	%i6
	movvc	%icc,	%o7,	%i0
	ldd	[%l7 + 0x60],	%o6
	array32	%i2,	%o5,	%l1
	fmul8x16al	%f8,	%f15,	%f18
	popc	%g4,	%g5
	movre	%g6,	%l5,	%g1
	stw	%o1,	[%l7 + 0x20]
	movcs	%icc,	%o4,	%g3
	stw	%o0,	[%l7 + 0x08]
	movle	%xcc,	%i7,	%o2
	fcmpd	%fcc0,	%f28,	%f16
	fmovscs	%icc,	%f11,	%f19
	sth	%i3,	[%l7 + 0x36]
	sra	%l6,	0x1F,	%l3
	sra	%o3,	0x08,	%i1
	addccc	%l2,	0x01C6,	%l0
	movrlez	%i4,	0x10B,	%g7
	ldx	[%l7 + 0x18],	%i5
	xnorcc	%g2,	0x0D01,	%i6
	udivx	%o7,	0x1D07,	%i0
	stw	%l4,	[%l7 + 0x0C]
	ld	[%l7 + 0x7C],	%f18
	movvc	%xcc,	%i2,	%o5
	sra	%o6,	0x03,	%g4
	fpadd16s	%f21,	%f1,	%f25
	fnor	%f28,	%f4,	%f10
	fmovsn	%icc,	%f20,	%f0
	movne	%xcc,	%g5,	%l1
	addc	%g6,	%l5,	%o1
	movgu	%icc,	%g1,	%g3
	alignaddr	%o0,	%i7,	%o4
	sth	%i3,	[%l7 + 0x32]
	edge32	%l6,	%o2,	%l3
	edge8	%i1,	%l2,	%o3
	movvs	%icc,	%l0,	%g7
	array8	%i5,	%i4,	%g2
	mulscc	%o7,	0x08E9,	%i0
	sub	%l4,	%i6,	%i2
	sdiv	%o5,	0x0B5E,	%o6
	move	%icc,	%g4,	%g5
	fmovsneg	%xcc,	%f7,	%f15
	ld	[%l7 + 0x78],	%f18
	movre	%g6,	0x2D0,	%l1
	edge16n	%o1,	%g1,	%l5
	edge16ln	%o0,	%i7,	%g3
	fmovdvc	%icc,	%f4,	%f14
	movcc	%xcc,	%o4,	%i3
	ldsh	[%l7 + 0x44],	%l6
	fmovdle	%icc,	%f2,	%f14
	ldsw	[%l7 + 0x18],	%o2
	smulcc	%l3,	0x0B6A,	%i1
	addccc	%o3,	0x1465,	%l0
	lduh	[%l7 + 0x3E],	%l2
	fcmps	%fcc2,	%f22,	%f7
	sll	%g7,	0x10,	%i5
	xnor	%i4,	0x1A70,	%g2
	movrgez	%i0,	%o7,	%i6
	sdivx	%l4,	0x1CB8,	%i2
	edge8l	%o5,	%g4,	%g5
	movneg	%icc,	%o6,	%l1
	edge16ln	%g6,	%g1,	%l5
	movge	%icc,	%o0,	%i7
	sth	%o1,	[%l7 + 0x74]
	fcmple32	%f0,	%f14,	%o4
	edge16n	%i3,	%g3,	%l6
	movgu	%xcc,	%o2,	%i1
	edge32ln	%o3,	%l0,	%l2
	udivx	%g7,	0x1F2A,	%l3
	movvc	%icc,	%i4,	%g2
	fmovrdne	%i0,	%f0,	%f30
	std	%f26,	[%l7 + 0x20]
	mulx	%i5,	%o7,	%l4
	smul	%i2,	%i6,	%g4
	sllx	%g5,	%o5,	%l1
	st	%f25,	[%l7 + 0x3C]
	ldd	[%l7 + 0x10],	%f10
	movre	%g6,	0x282,	%o6
	subc	%l5,	0x12D6,	%o0
	movge	%icc,	%i7,	%g1
	lduw	[%l7 + 0x0C],	%o1
	movrne	%o4,	%i3,	%l6
	sdivcc	%g3,	0x1123,	%i1
	ldd	[%l7 + 0x08],	%o2
	save %o3, %l0, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduh	[%l7 + 0x08],	%l2
	ldsh	[%l7 + 0x16],	%i4
	movrlz	%g2,	0x03C,	%l3
	andcc	%i0,	%o7,	%i5
	udivx	%i2,	0x1364,	%i6
	fmovsvs	%xcc,	%f24,	%f14
	orn	%l4,	0x1851,	%g5
	alignaddr	%o5,	%l1,	%g6
	udiv	%g4,	0x1BC9,	%l5
	movcs	%xcc,	%o0,	%i7
	andn	%g1,	0x0AEB,	%o1
	fmovdneg	%icc,	%f4,	%f5
	sllx	%o4,	%i3,	%o6
	orncc	%l6,	%i1,	%g3
	smul	%o2,	%o3,	%l0
	fmovdcc	%xcc,	%f20,	%f21
	array32	%g7,	%l2,	%i4
	movl	%icc,	%g2,	%i0
	srax	%o7,	%l3,	%i5
	fnot1s	%f6,	%f25
	fors	%f7,	%f22,	%f12
	fpack16	%f8,	%f0
	edge32n	%i2,	%i6,	%g5
	fpsub16	%f4,	%f12,	%f30
	addc	%o5,	%l4,	%l1
	movg	%icc,	%g6,	%l5
	addcc	%o0,	%g4,	%i7
	udivx	%g1,	0x039B,	%o4
	nop
	set	0x62, %l2
	ldsh	[%l7 + %l2],	%i3
	udiv	%o6,	0x1447,	%o1
	fmovsa	%xcc,	%f4,	%f22
	and	%l6,	0x093D,	%g3
	stx	%i1,	[%l7 + 0x18]
	fxnor	%f22,	%f26,	%f26
	and	%o2,	%o3,	%l0
	sdiv	%g7,	0x0FDD,	%l2
	stb	%g2,	[%l7 + 0x6A]
	sra	%i4,	%o7,	%i0
	fsrc1s	%f24,	%f14
	movre	%l3,	%i2,	%i5
	array32	%g5,	%i6,	%o5
	xnor	%l4,	%g6,	%l5
	orn	%o0,	%g4,	%i7
	sth	%g1,	[%l7 + 0x3C]
	edge16ln	%o4,	%i3,	%o6
	edge16ln	%o1,	%l6,	%l1
	xnorcc	%g3,	%o2,	%o3
	sdivx	%l0,	0x0EF8,	%i1
	fmovrsgz	%l2,	%f12,	%f28
	xnorcc	%g7,	%g2,	%i4
	srl	%o7,	%l3,	%i2
	fmovrdlez	%i0,	%f10,	%f28
	edge8	%i5,	%g5,	%o5
	fmovdn	%xcc,	%f8,	%f27
	andncc	%l4,	%g6,	%i6
	xnorcc	%o0,	%g4,	%l5
	fcmpgt16	%f2,	%f0,	%i7
	fmovrdlez	%g1,	%f26,	%f0
	movge	%xcc,	%o4,	%i3
	edge16l	%o6,	%o1,	%l6
	fornot1	%f6,	%f16,	%f26
	mova	%xcc,	%g3,	%o2
	edge16ln	%o3,	%l0,	%i1
	andn	%l1,	0x174F,	%g7
	fornot1	%f28,	%f20,	%f16
	movg	%icc,	%g2,	%l2
	ldd	[%l7 + 0x50],	%o6
	movne	%xcc,	%l3,	%i4
	movgu	%xcc,	%i0,	%i2
	stw	%i5,	[%l7 + 0x44]
	sethi	0x1D63,	%o5
	orncc	%l4,	%g5,	%g6
	movg	%icc,	%o0,	%g4
	ld	[%l7 + 0x4C],	%f27
	edge32n	%i6,	%l5,	%i7
	addc	%o4,	0x09CC,	%i3
	movvc	%xcc,	%g1,	%o1
	faligndata	%f22,	%f6,	%f22
	edge16l	%o6,	%g3,	%o2
	array8	%l6,	%l0,	%o3
	movle	%icc,	%i1,	%g7
	fmovdvc	%icc,	%f5,	%f21
	movrgz	%l1,	%l2,	%o7
	fpackfix	%f12,	%f7
	edge32l	%l3,	%g2,	%i0
	fmovdcc	%xcc,	%f26,	%f23
	xnorcc	%i4,	0x1C3B,	%i5
	ldub	[%l7 + 0x33],	%i2
	movne	%icc,	%o5,	%g5
	movre	%l4,	%g6,	%g4
	sdivcc	%o0,	0x0D55,	%l5
	fandnot1s	%f21,	%f30,	%f15
	array32	%i6,	%i7,	%i3
	movn	%xcc,	%o4,	%g1
	andn	%o1,	%o6,	%o2
	fcmpgt32	%f16,	%f22,	%l6
	ld	[%l7 + 0x58],	%f1
	fcmped	%fcc1,	%f14,	%f4
	sra	%g3,	0x07,	%l0
	fmul8sux16	%f0,	%f24,	%f16
	stx	%o3,	[%l7 + 0x18]
	ldsh	[%l7 + 0x5A],	%g7
	ldub	[%l7 + 0x55],	%l1
	ldd	[%l7 + 0x30],	%f12
	fmovrde	%i1,	%f8,	%f12
	fmovrslez	%l2,	%f15,	%f7
	sra	%o7,	%l3,	%i0
	ldub	[%l7 + 0x23],	%g2
	edge32	%i4,	%i2,	%o5
	sethi	0x0539,	%i5
	movcc	%icc,	%l4,	%g5
	ldd	[%l7 + 0x60],	%g4
	edge32ln	%g6,	%o0,	%i6
	movrlez	%l5,	%i3,	%i7
	movneg	%icc,	%g1,	%o1
	sdivx	%o6,	0x13BD,	%o2
	sra	%o4,	0x02,	%l6
	fcmped	%fcc2,	%f20,	%f6
	st	%f18,	[%l7 + 0x0C]
	array8	%l0,	%g3,	%o3
	fandnot1s	%f27,	%f13,	%f27
	fpadd16s	%f4,	%f23,	%f13
	fmovscc	%icc,	%f10,	%f1
	fmul8sux16	%f6,	%f6,	%f24
	andncc	%g7,	%i1,	%l2
	movvc	%icc,	%l1,	%l3
	fnand	%f10,	%f16,	%f2
	srax	%i0,	0x06,	%o7
	fmovd	%f4,	%f4
	array16	%i4,	%g2,	%i2
	edge32	%i5,	%o5,	%l4
	save %g5, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdiv	%g4,	0x03C9,	%i6
	smul	%l5,	%i3,	%i7
	movl	%xcc,	%o1,	%o6
	stw	%o2,	[%l7 + 0x40]
	srax	%g1,	0x1A,	%o4
	or	%l0,	0x1CF5,	%l6
	edge16	%o3,	%g3,	%i1
	umulcc	%l2,	0x01BC,	%l1
	add	%g7,	%i0,	%l3
	edge16n	%i4,	%g2,	%i2
	edge32ln	%o7,	%i5,	%l4
	fsrc1	%f12,	%f20
	lduh	[%l7 + 0x28],	%o5
	fcmpne32	%f10,	%f2,	%g6
	smul	%o0,	0x09C3,	%g5
	edge8l	%i6,	%g4,	%i3
	andn	%i7,	%o1,	%o6
	std	%f6,	[%l7 + 0x60]
	fmovsvs	%xcc,	%f26,	%f15
	andcc	%o2,	0x1707,	%g1
	ldd	[%l7 + 0x48],	%f14
	movrgz	%l5,	0x387,	%o4
	alignaddr	%l0,	%o3,	%l6
	addccc	%i1,	%g3,	%l1
	lduh	[%l7 + 0x24],	%g7
	addc	%i0,	0x195E,	%l2
	fmovspos	%xcc,	%f7,	%f14
	subcc	%l3,	0x1691,	%i4
	movleu	%icc,	%i2,	%g2
	fandnot1	%f24,	%f26,	%f0
	mulx	%o7,	0x1282,	%i5
	andcc	%l4,	%g6,	%o0
	fmovspos	%icc,	%f17,	%f25
	addcc	%g5,	0x00A1,	%i6
	stx	%g4,	[%l7 + 0x60]
	srl	%o5,	0x18,	%i3
	stw	%i7,	[%l7 + 0x20]
	sub	%o6,	%o2,	%g1
	edge32l	%o1,	%o4,	%l0
	fxnors	%f23,	%f9,	%f1
	fnegs	%f24,	%f13
	fmovd	%f2,	%f18
	save %o3, %l5, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i1,	%l1
	edge32n	%g3,	%g7,	%i0
	movvs	%icc,	%l2,	%i4
	lduw	[%l7 + 0x30],	%i2
	fpack16	%f12,	%f29
	popc	0x15A1,	%g2
	mulscc	%l3,	%i5,	%l4
	edge8	%o7,	%o0,	%g6
	udiv	%i6,	0x121F,	%g5
	sdiv	%o5,	0x016B,	%i3
	subcc	%g4,	%i7,	%o6
	nop
	set	0x46, %g7
	ldsh	[%l7 + %g7],	%g1
	movgu	%icc,	%o2,	%o4
	sdivx	%l0,	0x17E6,	%o3
	edge8	%o1,	%l6,	%i1
	edge16	%l1,	%l5,	%g7
	fandnot1s	%f24,	%f25,	%f28
	sllx	%g3,	%i0,	%l2
	fmovs	%f18,	%f9
	subccc	%i2,	%i4,	%g2
	movl	%xcc,	%i5,	%l4
	ldx	[%l7 + 0x08],	%l3
	movpos	%icc,	%o7,	%g6
	fand	%f8,	%f16,	%f18
	fmovrsgz	%i6,	%f3,	%f9
	fnor	%f2,	%f20,	%f22
	movn	%icc,	%o0,	%o5
	umul	%g5,	%i3,	%g4
	movn	%xcc,	%o6,	%g1
	movpos	%xcc,	%o2,	%o4
	ldsh	[%l7 + 0x46],	%l0
	edge8ln	%o3,	%i7,	%o1
	fnand	%f24,	%f12,	%f16
	umulcc	%l6,	%l1,	%l5
	movpos	%xcc,	%g7,	%g3
	movrlz	%i0,	0x15B,	%i1
	movre	%l2,	%i4,	%i2
	stw	%i5,	[%l7 + 0x5C]
	udiv	%g2,	0x072B,	%l3
	edge16ln	%l4,	%g6,	%i6
	sethi	0x0D20,	%o7
	ldx	[%l7 + 0x20],	%o0
	edge16n	%o5,	%g5,	%g4
	stb	%o6,	[%l7 + 0x4E]
	alignaddrl	%g1,	%o2,	%o4
	movrgez	%l0,	%o3,	%i7
	lduw	[%l7 + 0x20],	%o1
	subc	%i3,	0x0570,	%l1
	xor	%l5,	%l6,	%g3
	ldd	[%l7 + 0x68],	%f30
	xnor	%i0,	0x1421,	%i1
	movpos	%icc,	%g7,	%i4
	movgu	%icc,	%l2,	%i2
	fmuld8ulx16	%f19,	%f23,	%f8
	smul	%i5,	0x0ADD,	%g2
	xor	%l4,	0x0487,	%l3
	edge8n	%i6,	%g6,	%o0
	addc	%o7,	0x01AA,	%o5
	ldx	[%l7 + 0x78],	%g4
	movrlz	%o6,	0x09D,	%g1
	fpack32	%f20,	%f30,	%f22
	movrlz	%o2,	0x363,	%g5
	ldsw	[%l7 + 0x74],	%o4
	save %l0, %i7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%o3,	%l1,	%l5
	sethi	0x0CE0,	%i3
	srl	%g3,	0x00,	%i0
	sethi	0x0FCD,	%i1
	movleu	%icc,	%l6,	%g7
	movrne	%i4,	0x309,	%l2
	addc	%i2,	%i5,	%g2
	sub	%l3,	%l4,	%i6
	sdiv	%g6,	0x1DE0,	%o0
	stx	%o7,	[%l7 + 0x08]
	sllx	%g4,	%o5,	%o6
	move	%xcc,	%o2,	%g1
	array32	%g5,	%o4,	%l0
	fnot2	%f6,	%f12
	orncc	%o1,	0x1AEE,	%o3
	srlx	%l1,	%i7,	%l5
	fmovrsgz	%g3,	%f0,	%f2
	ldsw	[%l7 + 0x5C],	%i0
	std	%f8,	[%l7 + 0x30]
	sra	%i3,	0x05,	%l6
	movn	%icc,	%g7,	%i1
	fmovrde	%i4,	%f28,	%f8
	fzero	%f2
	array8	%i2,	%i5,	%l2
	umulcc	%g2,	%l4,	%i6
	sdivx	%l3,	0x1B83,	%g6
	fmuld8sux16	%f9,	%f9,	%f28
	movvs	%xcc,	%o0,	%g4
	movpos	%xcc,	%o7,	%o5
	ldx	[%l7 + 0x68],	%o6
	xorcc	%g1,	%g5,	%o2
	array32	%o4,	%l0,	%o1
	movrne	%l1,	%o3,	%i7
	movcc	%xcc,	%l5,	%g3
	orcc	%i0,	%i3,	%g7
	edge16n	%i1,	%l6,	%i4
	fornot1s	%f11,	%f0,	%f25
	ldub	[%l7 + 0x7B],	%i2
	orncc	%i5,	%l2,	%l4
	setx loop_30, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_30: 	save %i6, %o0, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%o5,	[%l7 + 0x40]
	ldd	[%l7 + 0x48],	%g4
	array32	%g1,	%o6,	%o2
	edge32l	%g5,	%l0,	%o4
	srl	%o1,	0x00,	%l1
	ldd	[%l7 + 0x28],	%o2
	edge8n	%i7,	%g3,	%l5
	edge16l	%i0,	%i3,	%i1
	pdist	%f10,	%f16,	%f28
	fcmps	%fcc0,	%f21,	%f5
	movg	%xcc,	%g7,	%l6
	std	%f22,	[%l7 + 0x78]
	movcc	%icc,	%i4,	%i2
	edge32ln	%i5,	%l2,	%g2
	alignaddrl	%l3,	%l4,	%g6
	fpadd16	%f22,	%f16,	%f6
	edge8l	%i6,	%o0,	%o7
	array16	%o5,	%g4,	%g1
	sdivx	%o6,	0x17BF,	%g5
	edge32ln	%l0,	%o2,	%o4
	fmovdge	%icc,	%f7,	%f9
	fsrc1s	%f26,	%f14
	mulx	%o1,	%o3,	%l1
	edge32	%g3,	%i7,	%i0
	mulx	%l5,	%i1,	%i3
	fmul8sux16	%f24,	%f16,	%f24
	sllx	%l6,	0x0A,	%i4
	smulcc	%i2,	0x0A55,	%i5
	fmovsne	%icc,	%f18,	%f30
	fornot2s	%f27,	%f28,	%f19
	srl	%l2,	0x07,	%g7
	mulscc	%g2,	%l4,	%l3
	ldsb	[%l7 + 0x6D],	%g6
	movvs	%icc,	%i6,	%o0
	fand	%f10,	%f20,	%f14
	popc	%o7,	%o5
	ldsb	[%l7 + 0x5C],	%g4
	movg	%icc,	%o6,	%g1
	andcc	%g5,	%o2,	%o4
	stw	%o1,	[%l7 + 0x18]
	edge8l	%o3,	%l1,	%l0
	orncc	%i7,	0x084C,	%i0
	movleu	%icc,	%l5,	%g3
	stw	%i3,	[%l7 + 0x30]
	ldsh	[%l7 + 0x74],	%i1
	fpack32	%f8,	%f24,	%f4
	movpos	%xcc,	%i4,	%i2
	sllx	%l6,	0x18,	%l2
	st	%f23,	[%l7 + 0x5C]
	xor	%i5,	%g7,	%g2
	addc	%l3,	0x1075,	%l4
	ldx	[%l7 + 0x70],	%i6
	add	%o0,	0x1982,	%g6
	fmovdl	%xcc,	%f13,	%f1
	fmul8x16al	%f30,	%f28,	%f6
	fmovsle	%xcc,	%f27,	%f12
	fxnor	%f24,	%f12,	%f20
	fpadd32	%f10,	%f16,	%f12
	restore %o7, %o5, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot1s	%f25,	%f5,	%f7
	fpadd32s	%f20,	%f12,	%f6
	fmovrdgez	%g4,	%f0,	%f12
	udivx	%g1,	0x1DAF,	%g5
	edge8l	%o4,	%o2,	%o1
	sethi	0x02F4,	%o3
	mulscc	%l1,	0x0424,	%i7
	fpadd16s	%f5,	%f17,	%f21
	sra	%i0,	0x05,	%l5
	sdivcc	%l0,	0x10A3,	%i3
	edge32ln	%i1,	%g3,	%i4
	ldsb	[%l7 + 0x47],	%l6
	fnor	%f24,	%f8,	%f6
	subc	%l2,	%i2,	%i5
	fmovdge	%xcc,	%f12,	%f1
	std	%f4,	[%l7 + 0x58]
	movrgz	%g2,	0x129,	%g7
	stb	%l3,	[%l7 + 0x27]
	udivx	%l4,	0x1CB2,	%o0
	edge16	%i6,	%o7,	%o5
	movg	%icc,	%g6,	%g4
	fornot2s	%f12,	%f27,	%f16
	mulx	%g1,	0x1F44,	%g5
	orncc	%o6,	0x05CB,	%o4
	movcc	%icc,	%o2,	%o1
	ldd	[%l7 + 0x78],	%f20
	xorcc	%o3,	%l1,	%i0
	srl	%i7,	%l5,	%l0
	orn	%i3,	%i1,	%i4
	sth	%g3,	[%l7 + 0x46]
	umulcc	%l6,	%l2,	%i2
	fmovrdlez	%g2,	%f0,	%f8
	edge32l	%g7,	%l3,	%l4
	fandnot2s	%f27,	%f17,	%f29
	stb	%o0,	[%l7 + 0x5B]
	subccc	%i6,	%o7,	%i5
	lduw	[%l7 + 0x7C],	%g6
	alignaddr	%g4,	%o5,	%g5
	ldd	[%l7 + 0x78],	%g0
	edge8ln	%o6,	%o2,	%o4
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%o0
	move	%icc,	%l1,	%o3
	andcc	%i0,	0x1C1F,	%i7
	movre	%l0,	0x1D9,	%l5
	ldub	[%l7 + 0x29],	%i3
	ldsh	[%l7 + 0x7A],	%i1
	subcc	%g3,	%l6,	%l2
	edge32	%i4,	%g2,	%g7
	fmovspos	%xcc,	%f8,	%f17
	move	%xcc,	%l3,	%l4
	fpack32	%f26,	%f4,	%f18
	popc	0x0CB4,	%i2
	sethi	0x1749,	%i6
	ldx	[%l7 + 0x20],	%o7
	fmovsne	%xcc,	%f8,	%f1
	fmul8x16al	%f26,	%f23,	%f18
	nop
	set	0x68, %o4
	ldx	[%l7 + %o4],	%o0
	fmovrdgz	%g6,	%f30,	%f8
	lduh	[%l7 + 0x4E],	%i5
	movn	%xcc,	%o5,	%g5
	std	%f10,	[%l7 + 0x08]
	movg	%xcc,	%g1,	%o6
	fmovde	%xcc,	%f24,	%f17
	fcmple32	%f4,	%f8,	%o2
	fcmps	%fcc2,	%f0,	%f1
	udivx	%g4,	0x0306,	%o4
	nop
	set	0x58, %g1
	std	%f24,	[%l7 + %g1]
	std	%f8,	[%l7 + 0x70]
	edge32	%o1,	%l1,	%o3
	fnot1	%f8,	%f14
	fpadd16s	%f21,	%f3,	%f8
	alignaddr	%i0,	%i7,	%l0
	st	%f23,	[%l7 + 0x78]
	subccc	%i3,	%l5,	%g3
	siam	0x5
	fcmpne32	%f2,	%f18,	%l6
	ldx	[%l7 + 0x38],	%i1
	fmovdl	%icc,	%f14,	%f28
	std	%f18,	[%l7 + 0x28]
	siam	0x5
	addc	%l2,	0x0B3D,	%g2
	popc	%g7,	%l3
	movleu	%xcc,	%i4,	%l4
	mulx	%i6,	%o7,	%i2
	andn	%g6,	0x17EF,	%i5
	movle	%xcc,	%o5,	%o0
	movl	%icc,	%g1,	%g5
	sdiv	%o2,	0x0F72,	%o6
	movre	%g4,	0x092,	%o4
	fmovrsgz	%o1,	%f29,	%f14
	fmovdn	%xcc,	%f3,	%f30
	fands	%f7,	%f18,	%f31
	sdivx	%o3,	0x057A,	%i0
	movvs	%xcc,	%l1,	%i7
	sethi	0x0F11,	%l0
	ldsb	[%l7 + 0x29],	%i3
	fabsd	%f20,	%f28
	edge32	%g3,	%l5,	%i1
	alignaddr	%l2,	%g2,	%l6
	sll	%g7,	%l3,	%l4
	stw	%i4,	[%l7 + 0x40]
	edge32n	%i6,	%i2,	%g6
	popc	0x004C,	%i5
	edge8	%o5,	%o7,	%g1
	orn	%o0,	%o2,	%o6
	sth	%g4,	[%l7 + 0x3E]
	edge32l	%g5,	%o1,	%o4
	xor	%o3,	%l1,	%i7
	alignaddrl	%l0,	%i3,	%i0
	movrgez	%l5,	%i1,	%g3
	stb	%l2,	[%l7 + 0x78]
	ldub	[%l7 + 0x67],	%g2
	movge	%icc,	%l6,	%g7
	fmovs	%f29,	%f2
	fpadd16	%f12,	%f24,	%f30
	sllx	%l3,	0x0C,	%i4
	movpos	%xcc,	%l4,	%i2
	edge16n	%g6,	%i5,	%i6
	sdivcc	%o5,	0x084B,	%g1
	alignaddrl	%o7,	%o0,	%o2
	movre	%g4,	0x078,	%g5
	stb	%o1,	[%l7 + 0x6C]
	sra	%o4,	0x08,	%o3
	fmovrslz	%o6,	%f15,	%f27
	movcs	%icc,	%i7,	%l1
	fpadd16	%f10,	%f0,	%f28
	move	%xcc,	%l0,	%i3
	sdiv	%l5,	0x035D,	%i0
	orncc	%i1,	%l2,	%g2
	add	%l6,	%g7,	%g3
	or	%l3,	%l4,	%i2
	ldsh	[%l7 + 0x28],	%g6
	movcc	%xcc,	%i4,	%i6
	st	%f26,	[%l7 + 0x0C]
	ldsb	[%l7 + 0x63],	%o5
	movrgez	%g1,	0x0D2,	%i5
	sir	0x0F85
	ldsh	[%l7 + 0x5E],	%o7
	edge8	%o2,	%g4,	%o0
	array16	%g5,	%o4,	%o1
	fmovse	%icc,	%f5,	%f21
	fornot1	%f14,	%f16,	%f2
	andcc	%o3,	%i7,	%o6
	edge32ln	%l1,	%l0,	%l5
	fmovrsgez	%i0,	%f17,	%f20
	edge8ln	%i1,	%i3,	%l2
	orn	%l6,	%g7,	%g2
	fnor	%f14,	%f26,	%f12
	save %l3, %l4, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	0x0143,	%g6
	umulcc	%i4,	%i6,	%i2
	ldd	[%l7 + 0x30],	%o4
	std	%f2,	[%l7 + 0x20]
	andcc	%g1,	0x09D2,	%o7
	edge32	%o2,	%i5,	%g4
	movleu	%xcc,	%g5,	%o0
	sllx	%o1,	%o3,	%i7
	movge	%icc,	%o6,	%l1
	array8	%o4,	%l0,	%l5
	ldd	[%l7 + 0x68],	%f16
	ldd	[%l7 + 0x58],	%f28
	fmovdne	%xcc,	%f12,	%f22
	nop
	set	0x68, %i2
	std	%f12,	[%l7 + %i2]
	ldx	[%l7 + 0x28],	%i0
	movneg	%xcc,	%i1,	%l2
	sth	%i3,	[%l7 + 0x4E]
	fxors	%f0,	%f29,	%f2
	fmovdneg	%xcc,	%f26,	%f12
	add	%l6,	0x1D51,	%g2
	edge32	%l3,	%l4,	%g7
	edge16ln	%g6,	%g3,	%i4
	ldsh	[%l7 + 0x52],	%i2
	ldsb	[%l7 + 0x49],	%i6
	nop
	set	0x38, %o0
	stw	%g1,	[%l7 + %o0]
	ldd	[%l7 + 0x70],	%f0
	fcmpne32	%f6,	%f4,	%o7
	umul	%o2,	%o5,	%g4
	movrgez	%g5,	0x271,	%i5
	movcc	%xcc,	%o1,	%o0
	ld	[%l7 + 0x50],	%f0
	movgu	%xcc,	%i7,	%o3
	ldub	[%l7 + 0x40],	%o6
	orcc	%o4,	0x1836,	%l0
	fmovrde	%l1,	%f6,	%f22
	mova	%icc,	%i0,	%l5
	smul	%i1,	%i3,	%l2
	sdiv	%g2,	0x0284,	%l6
	or	%l4,	%g7,	%l3
	movvc	%icc,	%g6,	%g3
	srlx	%i2,	%i6,	%g1
	movge	%icc,	%i4,	%o2
	edge32n	%o7,	%g4,	%o5
	xnorcc	%g5,	0x0D6F,	%o1
	ldd	[%l7 + 0x70],	%f24
	stb	%i5,	[%l7 + 0x79]
	st	%f9,	[%l7 + 0x2C]
	fmovrdgz	%o0,	%f0,	%f8
	xor	%i7,	0x01FC,	%o3
	edge8n	%o6,	%l0,	%l1
	movrlz	%i0,	%l5,	%i1
	srax	%o4,	%l2,	%g2
	or	%i3,	%l6,	%g7
	std	%f18,	[%l7 + 0x68]
	srlx	%l3,	%g6,	%l4
	fnegs	%f31,	%f14
	edge8	%g3,	%i2,	%i6
	smulcc	%i4,	0x0651,	%o2
	fxnor	%f20,	%f24,	%f8
	xnorcc	%g1,	0x10B1,	%g4
	array16	%o5,	%g5,	%o7
	edge16l	%i5,	%o1,	%o0
	fmovdneg	%xcc,	%f10,	%f19
	stw	%o3,	[%l7 + 0x68]
	sra	%o6,	0x0E,	%i7
	xorcc	%l1,	0x1CB2,	%i0
	edge32	%l5,	%i1,	%o4
	array32	%l2,	%g2,	%l0
	and	%i3,	0x1154,	%l6
	and	%l3,	0x0729,	%g7
	movcs	%xcc,	%g6,	%l4
	sllx	%g3,	0x0B,	%i6
	array32	%i4,	%i2,	%o2
	movvc	%icc,	%g1,	%g4
	mulscc	%o5,	%o7,	%g5
	xnor	%o1,	%o0,	%o3
	array16	%o6,	%i5,	%l1
	edge8l	%i7,	%l5,	%i0
	xor	%i1,	%o4,	%l2
	fmovrdgz	%l0,	%f30,	%f14
	fpadd16s	%f8,	%f15,	%f1
	ldd	[%l7 + 0x20],	%g2
	fandnot1s	%f31,	%f7,	%f11
	sll	%l6,	%l3,	%g7
	edge16ln	%g6,	%l4,	%g3
	addccc	%i6,	0x0AB9,	%i3
	alignaddr	%i4,	%o2,	%i2
	lduh	[%l7 + 0x2A],	%g1
	fcmpes	%fcc1,	%f7,	%f31
	movre	%g4,	%o5,	%g5
	fmovdpos	%xcc,	%f26,	%f14
	ld	[%l7 + 0x34],	%f0
	fmovrdne	%o1,	%f26,	%f18
	movvs	%xcc,	%o0,	%o3
	fmul8x16au	%f2,	%f5,	%f22
	edge8l	%o6,	%i5,	%l1
	subccc	%i7,	%l5,	%o7
	lduh	[%l7 + 0x54],	%i1
	srlx	%i0,	%l2,	%l0
	setx loop_31, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_31: 	nop
	set	0x22, %l6
	lduh	[%l7 + %l6],	%g7
	andcc	%g6,	%l3,	%l4
	subc	%i6,	0x1C2F,	%g3
	add	%i3,	0x18D4,	%o2
	stx	%i4,	[%l7 + 0x60]
	sethi	0x1915,	%g1
	movge	%xcc,	%g4,	%i2
	fmovdcs	%icc,	%f7,	%f20
	movre	%o5,	%o1,	%g5
	andcc	%o0,	%o6,	%i5
	sll	%o3,	%i7,	%l5
	xor	%o7,	0x0177,	%i1
	orncc	%l1,	0x0FCF,	%i0
	movrlez	%l0,	%o4,	%l6
	smulcc	%g2,	0x0BEE,	%g7
	fmovsneg	%icc,	%f6,	%f26
	or	%l2,	0x1A35,	%g6
	umul	%l3,	0x0DC7,	%i6
	movrgz	%g3,	%i3,	%l4
	restore %i4, 0x1C3E, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpne32	%f6,	%f20,	%g4
	smul	%i2,	0x04CF,	%o5
	srl	%o1,	%g1,	%o0
	mulx	%g5,	%i5,	%o6
	stw	%i7,	[%l7 + 0x1C]
	sdiv	%l5,	0x1C89,	%o7
	movl	%xcc,	%i1,	%o3
	umul	%l1,	%l0,	%i0
	ldub	[%l7 + 0x61],	%o4
	st	%f10,	[%l7 + 0x50]
	movl	%icc,	%l6,	%g7
	subcc	%l2,	%g6,	%g2
	ldd	[%l7 + 0x18],	%f14
	edge16l	%i6,	%l3,	%i3
	fzeros	%f28
	movvs	%icc,	%g3,	%i4
	umulcc	%o2,	%g4,	%i2
	fmovsge	%xcc,	%f3,	%f30
	movneg	%icc,	%o5,	%o1
	stx	%g1,	[%l7 + 0x60]
	movpos	%icc,	%o0,	%l4
	andncc	%i5,	%o6,	%g5
	movg	%icc,	%i7,	%o7
	sdivcc	%l5,	0x1759,	%i1
	pdist	%f4,	%f12,	%f0
	movgu	%xcc,	%o3,	%l1
	setx loop_32, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_32: 	umul	%g7,	0x11BB,	%l2
	fmovrsgz	%l0,	%f25,	%f6
	movre	%g6,	0x3DE,	%g2
	fexpand	%f16,	%f18
	fnot1s	%f19,	%f29
	movneg	%icc,	%l3,	%i3
	addcc	%g3,	0x1F38,	%i4
	srax	%i6,	0x16,	%o2
	sub	%g4,	0x1986,	%o5
	orcc	%o1,	0x1ABD,	%i2
	fpadd16s	%f7,	%f30,	%f27
	edge16ln	%o0,	%g1,	%l4
	ldd	[%l7 + 0x78],	%o6
	fxor	%f22,	%f8,	%f0
	movrlez	%g5,	0x088,	%i7
	bshuffle	%f8,	%f20,	%f28
	fxnor	%f0,	%f2,	%f26
	sub	%o7,	0x10B1,	%i5
	orcc	%l5,	%o3,	%l1
	fcmpeq32	%f28,	%f4,	%i0
	movn	%icc,	%o4,	%i1
	array8	%l6,	%l2,	%g7
	edge8ln	%l0,	%g2,	%l3
	orn	%g6,	%i3,	%i4
	array32	%i6,	%o2,	%g3
	mulscc	%o5,	0x0D03,	%g4
	move	%xcc,	%i2,	%o1
	movneg	%xcc,	%o0,	%l4
	umul	%g1,	%g5,	%o6
	movcc	%xcc,	%o7,	%i7
	sethi	0x06F9,	%i5
	fmovsle	%xcc,	%f13,	%f27
	popc	0x11F6,	%o3
	movrgez	%l5,	0x025,	%i0
	addcc	%l1,	%o4,	%i1
	movvc	%icc,	%l6,	%l2
	smul	%l0,	%g2,	%g7
	ldd	[%l7 + 0x28],	%l2
	fxor	%f0,	%f30,	%f26
	udivcc	%i3,	0x105E,	%i4
	subc	%i6,	0x0FC3,	%o2
	fcmpne32	%f6,	%f14,	%g3
	movrlz	%g6,	0x009,	%g4
	movvc	%xcc,	%o5,	%o1
	fcmpgt16	%f6,	%f24,	%i2
	array16	%l4,	%o0,	%g5
	movge	%xcc,	%o6,	%g1
	ldd	[%l7 + 0x38],	%o6
	fmovsl	%icc,	%f7,	%f26
	movgu	%icc,	%i5,	%o3
	udiv	%l5,	0x1D74,	%i0
	stx	%i7,	[%l7 + 0x50]
	sdivcc	%o4,	0x16E0,	%i1
	fxors	%f8,	%f23,	%f14
	ldd	[%l7 + 0x60],	%f16
	movgu	%icc,	%l6,	%l1
	fnot2	%f30,	%f20
	st	%f16,	[%l7 + 0x38]
	mova	%xcc,	%l2,	%l0
	udivx	%g7,	0x1AF8,	%g2
	movge	%icc,	%l3,	%i4
	movpos	%xcc,	%i3,	%o2
	umulcc	%i6,	%g6,	%g3
	xnor	%o5,	%o1,	%g4
	fpmerge	%f26,	%f29,	%f18
	ldub	[%l7 + 0x27],	%i2
	movvc	%xcc,	%l4,	%o0
	movrlez	%o6,	%g5,	%o7
	movge	%icc,	%i5,	%o3
	srlx	%l5,	0x0B,	%g1
	add	%i0,	0x0AA2,	%i7
	udivcc	%i1,	0x1CA5,	%l6
	addc	%o4,	0x1C06,	%l2
	xnorcc	%l0,	%g7,	%l1
	movvc	%icc,	%g2,	%l3
	array8	%i3,	%i4,	%o2
	fnegd	%f24,	%f8
	fmovdl	%icc,	%f25,	%f1
	movl	%xcc,	%g6,	%g3
	sethi	0x1D09,	%o5
	array8	%o1,	%i6,	%g4
	array16	%l4,	%i2,	%o0
	sethi	0x1D99,	%o6
	edge32n	%o7,	%g5,	%o3
	sir	0x1AEF
	mulscc	%i5,	%g1,	%i0
	alignaddr	%i7,	%i1,	%l5
	fnor	%f22,	%f14,	%f22
	sethi	0x06F0,	%l6
	movle	%icc,	%l2,	%o4
	movne	%xcc,	%g7,	%l0
	sir	0x15CE
	fsrc1	%f10,	%f12
	addcc	%l1,	%l3,	%i3
	sdivcc	%g2,	0x06AA,	%o2
	mova	%icc,	%i4,	%g6
	movrlez	%o5,	0x007,	%g3
	movge	%xcc,	%i6,	%o1
	movge	%xcc,	%g4,	%i2
	movg	%xcc,	%l4,	%o6
	alignaddr	%o0,	%g5,	%o3
	sth	%o7,	[%l7 + 0x18]
	array8	%g1,	%i5,	%i7
	srax	%i1,	0x1C,	%i0
	movvc	%icc,	%l6,	%l2
	nop
	set	0x26, %l4
	sth	%o4,	[%l7 + %l4]
	srax	%g7,	%l5,	%l1
	sdivcc	%l0,	0x1DCB,	%i3
	movvs	%xcc,	%g2,	%l3
	ldd	[%l7 + 0x68],	%o2
	edge16	%g6,	%o5,	%i4
	addccc	%i6,	%o1,	%g4
	fcmpgt32	%f8,	%f0,	%g3
	stx	%l4,	[%l7 + 0x08]
	smul	%o6,	0x0708,	%o0
	fandnot2s	%f28,	%f19,	%f1
	mulx	%i2,	0x09D8,	%o3
	andncc	%o7,	%g1,	%i5
	sll	%i7,	0x14,	%i1
	subcc	%i0,	0x08DF,	%l6
	alignaddrl	%g5,	%l2,	%g7
	sir	0x1A02
	stw	%l5,	[%l7 + 0x40]
	ld	[%l7 + 0x7C],	%f0
	orncc	%o4,	0x1320,	%l1
	fmovrslez	%i3,	%f29,	%f24
	movcs	%icc,	%l0,	%g2
	fmovdcs	%icc,	%f29,	%f31
	xorcc	%o2,	0x0CD3,	%l3
	orcc	%o5,	0x18A8,	%i4
	edge8l	%g6,	%i6,	%o1
	movge	%icc,	%g4,	%g3
	fandnot1s	%f13,	%f15,	%f28
	fcmps	%fcc2,	%f2,	%f7
	fxors	%f23,	%f14,	%f29
	sub	%l4,	0x1E7D,	%o0
	sdivcc	%o6,	0x064E,	%o3
	add	%i2,	0x153E,	%o7
	fcmple32	%f28,	%f28,	%i5
	fmovrslz	%g1,	%f6,	%f28
	movl	%icc,	%i1,	%i7
	alignaddrl	%i0,	%l6,	%g5
	stw	%g7,	[%l7 + 0x5C]
	srlx	%l5,	%o4,	%l2
	save %i3, %l0, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%l1,	%l3,	%o2
	movrlez	%i4,	0x075,	%o5
	movpos	%icc,	%i6,	%o1
	lduw	[%l7 + 0x08],	%g4
	sllx	%g6,	%l4,	%o0
	fmul8x16au	%f15,	%f5,	%f6
	edge16ln	%g3,	%o3,	%i2
	movcc	%icc,	%o6,	%o7
	fmovdn	%icc,	%f3,	%f11
	smul	%i5,	0x09EC,	%g1
	umulcc	%i7,	0x0E74,	%i1
	xor	%i0,	%g5,	%g7
	and	%l6,	0x0FA9,	%o4
	edge16l	%l5,	%l2,	%l0
	xnor	%i3,	%g2,	%l1
	andcc	%l3,	%i4,	%o2
	andn	%i6,	%o5,	%o1
	umulcc	%g6,	0x0EE1,	%g4
	movge	%xcc,	%l4,	%o0
	srax	%g3,	0x0C,	%i2
	sllx	%o3,	%o6,	%i5
	edge32n	%o7,	%i7,	%i1
	move	%icc,	%i0,	%g1
	sdiv	%g7,	0x1717,	%l6
	addccc	%g5,	%l5,	%l2
	move	%icc,	%l0,	%i3
	save %o4, %l1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%i4,	0x1ACD,	%o2
	movpos	%xcc,	%i6,	%g2
	fpadd32s	%f1,	%f10,	%f18
	fcmpeq16	%f28,	%f0,	%o1
	edge32l	%g6,	%g4,	%o5
	addcc	%l4,	%o0,	%i2
	edge8	%o3,	%o6,	%i5
	movvc	%xcc,	%g3,	%i7
	srax	%i1,	0x02,	%o7
	fandnot1s	%f30,	%f18,	%f9
	movn	%icc,	%g1,	%i0
	edge8l	%g7,	%g5,	%l6
	movgu	%icc,	%l5,	%l2
	fmul8sux16	%f28,	%f4,	%f10
	sub	%i3,	%o4,	%l1
	fornot2s	%f22,	%f24,	%f10
	movrlz	%l0,	0x26F,	%l3
	addcc	%i4,	%o2,	%i6
	orncc	%g2,	%o1,	%g6
	restore %g4, 0x1652, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%xcc,	%o5,	%o0
	ldub	[%l7 + 0x1F],	%o3
	sir	0x06BE
	subc	%o6,	%i2,	%i5
	fmovdleu	%xcc,	%f7,	%f23
	ldd	[%l7 + 0x68],	%f26
	popc	0x0D9C,	%g3
	smul	%i7,	%i1,	%o7
	xnor	%i0,	0x141A,	%g1
	stx	%g7,	[%l7 + 0x78]
	subc	%l6,	%g5,	%l2
	movvs	%icc,	%l5,	%i3
	stw	%o4,	[%l7 + 0x44]
	movcs	%xcc,	%l1,	%l0
	edge16l	%i4,	%o2,	%i6
	udivcc	%l3,	0x0054,	%o1
	sdiv	%g2,	0x109D,	%g6
	fmovrdgez	%l4,	%f20,	%f4
	setx loop_33, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_33: 	fcmpes	%fcc2,	%f7,	%f4
	movle	%icc,	%o3,	%o5
	edge8n	%o6,	%i2,	%g3
	andn	%i7,	%i5,	%i1
	fornot1s	%f19,	%f26,	%f20
	fmul8ulx16	%f30,	%f6,	%f2
	movle	%icc,	%i0,	%g1
	addc	%g7,	0x17F6,	%l6
	andncc	%o7,	%l2,	%g5
	fmovrse	%l5,	%f9,	%f10
	array16	%i3,	%o4,	%l1
	movn	%icc,	%i4,	%l0
	st	%f13,	[%l7 + 0x3C]
	movrlez	%o2,	%l3,	%i6
	restore %g2, %o1, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%g6,	0x1AA4,	%g4
	nop
	set	0x7A, %l1
	sth	%o3,	[%l7 + %l1]
	movl	%xcc,	%o0,	%o5
	fnot2	%f12,	%f4
	movrlz	%i2,	%g3,	%i7
	lduh	[%l7 + 0x5A],	%o6
	orncc	%i1,	0x0411,	%i5
	fnor	%f26,	%f6,	%f12
	or	%g1,	0x0841,	%g7
	edge32ln	%i0,	%l6,	%o7
	edge8	%g5,	%l5,	%l2
	move	%icc,	%o4,	%l1
	srl	%i4,	%i3,	%l0
	udivcc	%l3,	0x023B,	%o2
	movpos	%xcc,	%i6,	%o1
	fmovdl	%icc,	%f29,	%f3
	sllx	%g2,	%g6,	%g4
	orncc	%l4,	%o0,	%o3
	edge32	%o5,	%i2,	%i7
	smul	%g3,	0x1397,	%i1
	std	%f26,	[%l7 + 0x68]
	ld	[%l7 + 0x30],	%f0
	sub	%i5,	0x0A24,	%o6
	sdiv	%g1,	0x1F8B,	%i0
	edge16	%l6,	%o7,	%g5
	ldub	[%l7 + 0x5B],	%l5
	udiv	%l2,	0x08DE,	%g7
	movge	%xcc,	%o4,	%l1
	fmul8ulx16	%f12,	%f12,	%f8
	std	%f28,	[%l7 + 0x20]
	xnor	%i3,	%i4,	%l0
	andcc	%l3,	%i6,	%o2
	movgu	%xcc,	%g2,	%o1
	andcc	%g4,	0x1EC6,	%g6
	nop
	set	0x1C, %g3
	sth	%l4,	[%l7 + %g3]
	lduh	[%l7 + 0x64],	%o0
	fabsd	%f4,	%f10
	movrlz	%o3,	0x349,	%o5
	fmovdl	%icc,	%f28,	%f15
	edge8ln	%i2,	%g3,	%i7
	udivx	%i5,	0x12C1,	%o6
	fmovde	%xcc,	%f13,	%f16
	movgu	%icc,	%i1,	%i0
	edge32l	%g1,	%o7,	%l6
	udivcc	%g5,	0x10AE,	%l5
	fcmpgt32	%f8,	%f6,	%l2
	sethi	0x1029,	%o4
	bshuffle	%f4,	%f24,	%f10
	movleu	%icc,	%g7,	%l1
	movrgz	%i4,	%i3,	%l0
	fcmple16	%f12,	%f0,	%i6
	fnor	%f12,	%f22,	%f0
	fmovrdgez	%o2,	%f16,	%f30
	edge8l	%l3,	%o1,	%g4
	sll	%g6,	0x17,	%l4
	edge32	%o0,	%o3,	%g2
	edge32ln	%i2,	%g3,	%o5
	alignaddrl	%i7,	%o6,	%i1
	edge8	%i0,	%g1,	%i5
	sllx	%o7,	0x19,	%g5
	movleu	%xcc,	%l5,	%l6
	sethi	0x1143,	%o4
	fmuld8ulx16	%f25,	%f30,	%f20
	andncc	%g7,	%l2,	%i4
	sub	%i3,	0x1616,	%l0
	andcc	%i6,	0x0E71,	%o2
	fmovrde	%l3,	%f12,	%f18
	fcmpgt16	%f24,	%f22,	%l1
	fmovde	%xcc,	%f29,	%f9
	movle	%icc,	%o1,	%g4
	subccc	%g6,	0x1802,	%l4
	edge16ln	%o3,	%o0,	%g2
	sllx	%g3,	0x0C,	%i2
	movrlz	%i7,	0x3FF,	%o6
	addccc	%i1,	0x1D15,	%o5
	fornot1	%f14,	%f12,	%f10
	nop
	set	0x38, %i3
	stx	%g1,	[%l7 + %i3]
	fcmpeq32	%f24,	%f0,	%i5
	alignaddr	%o7,	%g5,	%l5
	and	%l6,	0x0DC3,	%o4
	fmovdcc	%xcc,	%f16,	%f30
	or	%i0,	0x061D,	%l2
	movvc	%xcc,	%g7,	%i4
	xorcc	%l0,	%i3,	%i6
	xnor	%l3,	0x083D,	%l1
	fmovrdne	%o2,	%f26,	%f12
	movn	%icc,	%o1,	%g4
	sra	%g6,	%o3,	%o0
	addcc	%l4,	%g2,	%g3
	umulcc	%i7,	0x1E09,	%i2
	movre	%o6,	%o5,	%g1
	xor	%i1,	%i5,	%o7
	movrgz	%g5,	%l6,	%l5
	movcs	%xcc,	%o4,	%l2
	ldd	[%l7 + 0x38],	%f28
	lduh	[%l7 + 0x4E],	%g7
	srl	%i0,	0x12,	%i4
	xnorcc	%i3,	%l0,	%l3
	movle	%xcc,	%l1,	%o2
	nop
	set	0x72, %i5
	sth	%i6,	[%l7 + %i5]
	st	%f0,	[%l7 + 0x64]
	nop
	set	0x28, %i7
	ldd	[%l7 + %i7],	%f12
	movne	%xcc,	%o1,	%g6
	ldx	[%l7 + 0x78],	%g4
	movrlez	%o3,	%l4,	%o0
	sllx	%g2,	0x07,	%g3
	movrlez	%i2,	%i7,	%o5
	edge16n	%g1,	%i1,	%i5
	smulcc	%o6,	0x1304,	%o7
	sllx	%g5,	0x0A,	%l5
	array8	%o4,	%l2,	%l6
	fmovsl	%xcc,	%f25,	%f17
	edge32ln	%g7,	%i0,	%i4
	sth	%l0,	[%l7 + 0x66]
	movpos	%xcc,	%i3,	%l1
	edge16l	%o2,	%i6,	%o1
	sdivx	%l3,	0x0362,	%g6
	subccc	%o3,	0x0D1F,	%g4
	setx loop_34, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_34: 	andn	%o0,	0x14AA,	%i7
	umulcc	%i2,	0x1744,	%o5
	add	%g1,	%i5,	%o6
	sllx	%i1,	%o7,	%g5
	fmovsge	%icc,	%f17,	%f11
	move	%xcc,	%o4,	%l5
	fmovrdne	%l6,	%f12,	%f6
	move	%xcc,	%l2,	%i0
	fpadd16s	%f5,	%f27,	%f24
	edge8n	%g7,	%l0,	%i3
	edge16n	%i4,	%l1,	%i6
	fmovspos	%xcc,	%f15,	%f28
	alignaddr	%o1,	%o2,	%g6
	alignaddrl	%o3,	%l3,	%g4
	nop
	set	0x54, %g6
	stb	%g2,	[%l7 + %g6]
	movvc	%icc,	%l4,	%o0
	movneg	%icc,	%g3,	%i2
	udiv	%o5,	0x0BF9,	%g1
	and	%i7,	0x0E5B,	%o6
	std	%f28,	[%l7 + 0x68]
	movrlez	%i5,	%i1,	%g5
	fcmple16	%f0,	%f8,	%o7
	sdiv	%o4,	0x07CC,	%l6
	edge32ln	%l2,	%l5,	%i0
	subc	%g7,	%i3,	%l0
	ldd	[%l7 + 0x28],	%f22
	subccc	%l1,	0x1C3B,	%i6
	ldsb	[%l7 + 0x75],	%i4
	fornot1	%f8,	%f24,	%f22
	fmovsne	%xcc,	%f25,	%f6
	andcc	%o2,	%g6,	%o3
	add	%o1,	%l3,	%g4
	fmovrde	%g2,	%f16,	%f10
	stx	%l4,	[%l7 + 0x38]
	movge	%xcc,	%g3,	%i2
	or	%o5,	0x1238,	%o0
	xorcc	%i7,	0x05B9,	%o6
	movrgz	%g1,	0x139,	%i1
	stb	%g5,	[%l7 + 0x51]
	edge8n	%i5,	%o7,	%o4
	fmovs	%f6,	%f28
	stx	%l6,	[%l7 + 0x38]
	movrgz	%l2,	%l5,	%i0
	sll	%g7,	%i3,	%l0
	fandnot1s	%f7,	%f25,	%f13
	movle	%icc,	%i6,	%l1
	sub	%o2,	%i4,	%g6
	or	%o1,	%l3,	%o3
	movg	%xcc,	%g2,	%g4
	movrlz	%l4,	0x184,	%i2
	edge16ln	%o5,	%o0,	%g3
	sir	0x066F
	mulx	%o6,	0x1E82,	%i7
	array32	%g1,	%i1,	%i5
	movrlez	%o7,	%o4,	%g5
	movrlz	%l6,	%l2,	%l5
	fnot1s	%f1,	%f5
	st	%f31,	[%l7 + 0x5C]
	srax	%g7,	%i0,	%l0
	edge8l	%i3,	%i6,	%o2
	movrgez	%i4,	0x0A0,	%g6
	umulcc	%o1,	%l1,	%l3
	ldsw	[%l7 + 0x78],	%o3
	sllx	%g4,	0x12,	%l4
	umulcc	%i2,	%o5,	%g2
	sll	%o0,	0x1F,	%g3
	umul	%o6,	%g1,	%i1
	array16	%i7,	%i5,	%o4
	edge32n	%g5,	%o7,	%l2
	movrlez	%l6,	0x005,	%l5
	st	%f11,	[%l7 + 0x0C]
	fcmpeq32	%f2,	%f10,	%g7
	umul	%i0,	0x12E6,	%i3
	edge8n	%l0,	%i6,	%o2
	subcc	%i4,	%o1,	%l1
	srax	%l3,	%o3,	%g6
	srlx	%l4,	%g4,	%i2
	movgu	%icc,	%g2,	%o0
	and	%o5,	0x0781,	%o6
	fmul8sux16	%f2,	%f28,	%f20
	subc	%g1,	%i1,	%g3
	movrlez	%i5,	0x151,	%i7
	array8	%g5,	%o4,	%l2
	fones	%f12
	movneg	%xcc,	%l6,	%o7
	fornot2s	%f22,	%f7,	%f25
	ldsw	[%l7 + 0x5C],	%l5
	movvs	%icc,	%i0,	%i3
	srax	%l0,	%i6,	%g7
	pdist	%f2,	%f20,	%f8
	ldd	[%l7 + 0x50],	%o2
	edge8ln	%o1,	%i4,	%l3
	std	%f2,	[%l7 + 0x30]
	edge16n	%o3,	%l1,	%l4
	sra	%g4,	%g6,	%i2
	fnands	%f27,	%f12,	%f1
	fmuld8sux16	%f31,	%f10,	%f14
	fone	%f6
	movg	%icc,	%o0,	%o5
	array32	%o6,	%g1,	%g2
	subc	%g3,	%i5,	%i1
	fmovrsne	%g5,	%f1,	%f13
	fones	%f1
	fpadd16	%f4,	%f16,	%f24
	or	%o4,	%l2,	%i7
	sth	%o7,	[%l7 + 0x1E]
	sir	0x024C
	orn	%l5,	0x08B3,	%i0
	srl	%l6,	%i3,	%i6
	fmovrdlz	%g7,	%f30,	%f24
	fmovrde	%l0,	%f16,	%f18
	ldd	[%l7 + 0x28],	%o0
	edge16	%i4,	%l3,	%o3
	sra	%l1,	0x02,	%l4
	subccc	%o2,	0x076C,	%g4
	movn	%icc,	%g6,	%i2
	array8	%o5,	%o6,	%o0
	ld	[%l7 + 0x7C],	%f7
	fpsub16	%f6,	%f26,	%f22
	fpack32	%f10,	%f14,	%f26
	andcc	%g2,	%g3,	%i5
	mova	%xcc,	%g1,	%i1
	orcc	%o4,	%l2,	%i7
	array16	%o7,	%g5,	%i0
	fmul8sux16	%f16,	%f24,	%f20
	fnor	%f20,	%f18,	%f2
	edge32	%l5,	%l6,	%i3
	fpackfix	%f18,	%f22
	mulscc	%i6,	%l0,	%g7
	fmovsvc	%xcc,	%f7,	%f13
	add	%i4,	%o1,	%o3
	ldsh	[%l7 + 0x1A],	%l1
	edge32l	%l3,	%l4,	%g4
	save %g6, 0x1024, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdn	%xcc,	%f22,	%f20
	save %i2, 0x1F66, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%icc,	%o5,	%g2
	subcc	%g3,	%i5,	%o0
	save %g1, %o4, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fsrc2	%f6,	%f10
	xor	%i7,	%i1,	%o7
	addccc	%i0,	%g5,	%l5
	stx	%l6,	[%l7 + 0x70]
	fmovrslz	%i6,	%f22,	%f21
	edge8	%l0,	%i3,	%i4
	movg	%xcc,	%g7,	%o3
	sdiv	%o1,	0x1D25,	%l1
	fmovrse	%l3,	%f17,	%f27
	fmovdg	%icc,	%f4,	%f31
	umul	%l4,	0x12D9,	%g6
	movg	%icc,	%g4,	%i2
	fmovrdlz	%o2,	%f14,	%f8
	ldd	[%l7 + 0x18],	%f22
	movvs	%icc,	%o6,	%o5
	sllx	%g3,	%i5,	%o0
	addcc	%g1,	%g2,	%l2
	fnand	%f10,	%f22,	%f16
	sethi	0x14A5,	%o4
	ldd	[%l7 + 0x58],	%i0
	stb	%o7,	[%l7 + 0x57]
	addcc	%i7,	0x181C,	%g5
	lduh	[%l7 + 0x1A],	%i0
	movrlez	%l5,	%i6,	%l6
	subccc	%l0,	0x00CE,	%i4
	sdiv	%g7,	0x00F9,	%i3
	movneg	%xcc,	%o1,	%o3
	fcmped	%fcc1,	%f0,	%f30
	fmovdne	%xcc,	%f8,	%f25
	movn	%icc,	%l1,	%l4
	movpos	%xcc,	%l3,	%g6
	ldsh	[%l7 + 0x4A],	%g4
	nop
	set	0x48, %o7
	std	%f18,	[%l7 + %o7]
	fmovdge	%xcc,	%f26,	%f22
	stw	%i2,	[%l7 + 0x68]
	ldd	[%l7 + 0x40],	%f14
	xor	%o6,	0x1E52,	%o5
	movcs	%icc,	%g3,	%i5
	stx	%o2,	[%l7 + 0x70]
	fandnot2s	%f15,	%f12,	%f26
	array8	%o0,	%g2,	%g1
	movpos	%xcc,	%l2,	%i1
	movg	%xcc,	%o7,	%o4
	udivcc	%g5,	0x1C03,	%i0
	sra	%i7,	%l5,	%l6
	fmovrslez	%i6,	%f11,	%f23
	movrlez	%l0,	0x13E,	%g7
	ldub	[%l7 + 0x26],	%i3
	fsrc2	%f8,	%f12
	edge32	%i4,	%o1,	%l1
	edge8l	%o3,	%l3,	%l4
	umul	%g6,	%i2,	%o6
	fsrc2	%f18,	%f0
	edge32	%g4,	%o5,	%i5
	alignaddrl	%g3,	%o0,	%o2
	sllx	%g2,	0x10,	%g1
	st	%f13,	[%l7 + 0x74]
	edge8l	%i1,	%l2,	%o4
	ldd	[%l7 + 0x68],	%f24
	sir	0x07D4
	fmovsle	%xcc,	%f21,	%f0
	movle	%icc,	%g5,	%o7
	fmovsgu	%xcc,	%f26,	%f21
	edge32	%i0,	%i7,	%l5
	fands	%f22,	%f3,	%f29
	or	%i6,	%l0,	%l6
	sra	%i3,	%g7,	%i4
	fmovrdne	%l1,	%f0,	%f8
	fnot1s	%f0,	%f23
	subccc	%o1,	%l3,	%l4
	andcc	%o3,	0x05B5,	%i2
	array8	%g6,	%g4,	%o6
	movg	%icc,	%o5,	%i5
	edge16l	%g3,	%o0,	%g2
	edge16n	%g1,	%i1,	%o2
	edge16	%l2,	%g5,	%o7
	movpos	%xcc,	%o4,	%i7
	movvs	%xcc,	%l5,	%i6
	stb	%i0,	[%l7 + 0x57]
	movrgez	%l0,	0x21B,	%i3
	ldx	[%l7 + 0x78],	%l6
	fornot2s	%f28,	%f0,	%f19
	add	%i4,	%g7,	%o1
	subccc	%l3,	0x19CC,	%l1
	sir	0x041D
	sllx	%l4,	%o3,	%g6
	edge16ln	%g4,	%i2,	%o5
	popc	%o6,	%g3
	edge8l	%i5,	%g2,	%o0
	movvc	%xcc,	%i1,	%o2
	movneg	%icc,	%l2,	%g5
	srlx	%o7,	%g1,	%o4
	fmovsvc	%xcc,	%f22,	%f25
	mulx	%i7,	%i6,	%l5
	movl	%xcc,	%i0,	%l0
	fones	%f19
	fxnors	%f19,	%f13,	%f1
	movrgz	%l6,	%i4,	%i3
	fcmpne32	%f22,	%f28,	%o1
	fcmpne16	%f14,	%f26,	%g7
	ldd	[%l7 + 0x18],	%f16
	edge32	%l1,	%l3,	%o3
	stw	%l4,	[%l7 + 0x58]
	array16	%g6,	%g4,	%i2
	movrlz	%o6,	%o5,	%i5
	movrne	%g3,	0x26F,	%o0
	fnot1	%f30,	%f12
	fmovdg	%icc,	%f25,	%f16
	movcc	%xcc,	%i1,	%o2
	movrgz	%g2,	0x300,	%l2
	fmovrdgez	%o7,	%f6,	%f0
	lduh	[%l7 + 0x5C],	%g1
	movl	%icc,	%g5,	%i7
	fandnot1s	%f15,	%f2,	%f5
	movrlz	%o4,	%l5,	%i0
	stx	%i6,	[%l7 + 0x60]
	fpsub16	%f2,	%f14,	%f30
	and	%l0,	%i4,	%l6
	edge32	%o1,	%g7,	%l1
	subccc	%l3,	%o3,	%i3
	mulscc	%l4,	0x03A7,	%g6
	fmovsn	%xcc,	%f25,	%f27
	sir	0x1E00
	edge16ln	%g4,	%i2,	%o6
	addc	%i5,	%g3,	%o0
	nop
	set	0x62, %o5
	sth	%o5,	[%l7 + %o5]
	udivx	%i1,	0x168A,	%g2
	edge16	%o2,	%l2,	%g1
	move	%icc,	%o7,	%i7
	ld	[%l7 + 0x6C],	%f25
	st	%f8,	[%l7 + 0x2C]
	fabsd	%f24,	%f30
	array32	%g5,	%l5,	%i0
	movg	%icc,	%o4,	%l0
	fmovscc	%xcc,	%f20,	%f20
	orncc	%i4,	0x1FB7,	%i6
	edge8n	%o1,	%g7,	%l6
	sll	%l1,	%l3,	%o3
	fmuld8ulx16	%f17,	%f21,	%f28
	stx	%l4,	[%l7 + 0x08]
	and	%i3,	0x0E0A,	%g6
	edge8	%i2,	%g4,	%o6
	edge32	%i5,	%o0,	%g3
	sth	%o5,	[%l7 + 0x6A]
	lduw	[%l7 + 0x58],	%g2
	std	%f14,	[%l7 + 0x40]
	fmuld8ulx16	%f29,	%f17,	%f10
	fpadd32	%f12,	%f28,	%f0
	edge32n	%i1,	%l2,	%o2
	fxors	%f11,	%f27,	%f24
	fnands	%f28,	%f5,	%f23
	fcmple16	%f12,	%f12,	%o7
	srl	%i7,	%g1,	%g5
	alignaddrl	%l5,	%o4,	%i0
	addccc	%i4,	0x1E44,	%i6
	sra	%o1,	%l0,	%l6
	srl	%g7,	0x1E,	%l3
	fpadd16	%f8,	%f4,	%f6
	sdiv	%o3,	0x0E13,	%l4
	movrgz	%i3,	0x085,	%g6
	restore %i2, %l1, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%g4,	%i5,	%o0
	sdivcc	%o5,	0x02D9,	%g2
	edge16ln	%i1,	%g3,	%o2
	fmovscc	%xcc,	%f2,	%f8
	fmovdcc	%icc,	%f0,	%f18
	fors	%f16,	%f9,	%f4
	sdivcc	%o7,	0x0F81,	%i7
	move	%icc,	%l2,	%g5
	subc	%g1,	0x1CB5,	%o4
	andcc	%l5,	%i0,	%i6
	sllx	%i4,	0x1E,	%l0
	move	%icc,	%l6,	%o1
	mulx	%l3,	0x0A09,	%o3
	ld	[%l7 + 0x70],	%f15
	fmovda	%xcc,	%f9,	%f13
	edge16n	%g7,	%l4,	%g6
	orn	%i3,	0x1270,	%l1
	fmuld8ulx16	%f27,	%f26,	%f24
	edge16n	%o6,	%i2,	%g4
	mova	%xcc,	%i5,	%o5
	ldsw	[%l7 + 0x0C],	%g2
	popc	0x13E7,	%i1
	sethi	0x095E,	%g3
	fmovrslez	%o2,	%f9,	%f18
	orcc	%o7,	0x033A,	%o0
	orcc	%i7,	0x12B5,	%g5
	stb	%g1,	[%l7 + 0x63]
	array8	%o4,	%l2,	%i0
	sethi	0x0F62,	%i6
	edge8n	%i4,	%l5,	%l0
	edge8ln	%l6,	%l3,	%o1
	edge8l	%g7,	%o3,	%l4
	fmuld8sux16	%f15,	%f1,	%f16
	fcmped	%fcc2,	%f22,	%f8
	andn	%i3,	%l1,	%o6
	movrgez	%i2,	%g4,	%i5
	edge16ln	%o5,	%g6,	%g2
	edge32n	%g3,	%o2,	%i1
	edge16	%o7,	%i7,	%o0
	fmovdcc	%icc,	%f2,	%f20
	edge8l	%g5,	%o4,	%g1
	array16	%l2,	%i0,	%i6
	ldd	[%l7 + 0x28],	%f2
	movneg	%xcc,	%l5,	%l0
	movgu	%icc,	%i4,	%l6
	fornot2	%f8,	%f20,	%f4
	fnegs	%f3,	%f1
	fones	%f3
	fpadd32s	%f13,	%f7,	%f10
	lduh	[%l7 + 0x42],	%l3
	sllx	%o1,	0x0E,	%o3
	andcc	%l4,	%i3,	%g7
	edge8n	%o6,	%i2,	%g4
	movrgez	%l1,	%o5,	%g6
	movgu	%xcc,	%i5,	%g2
	movrlz	%g3,	%i1,	%o7
	movcc	%icc,	%o2,	%i7
	mulscc	%g5,	%o0,	%o4
	edge8n	%g1,	%l2,	%i6
	movcs	%xcc,	%i0,	%l0
	edge8n	%l5,	%i4,	%l3
	sir	0x0802
	sethi	0x0863,	%o1
	fmovsl	%icc,	%f24,	%f13
	ld	[%l7 + 0x78],	%f2
	subc	%l6,	0x02E7,	%o3
	movrgz	%i3,	%g7,	%o6
	fmul8sux16	%f14,	%f20,	%f22
	ldub	[%l7 + 0x1B],	%i2
	movrne	%l4,	0x2EF,	%g4
	fsrc2s	%f8,	%f0
	ldd	[%l7 + 0x38],	%f26
	std	%f20,	[%l7 + 0x78]
	fones	%f28
	movl	%xcc,	%l1,	%g6
	edge32	%i5,	%g2,	%o5
	srax	%g3,	0x1B,	%i1
	ld	[%l7 + 0x50],	%f28
	movleu	%xcc,	%o7,	%o2
	edge16	%i7,	%o0,	%g5
	sir	0x019B
	fmovrse	%g1,	%f12,	%f9
	edge8l	%l2,	%i6,	%o4
	sdivx	%i0,	0x1980,	%l5
	smulcc	%l0,	0x0211,	%l3
	orcc	%i4,	0x115B,	%o1
	fmovrsgez	%o3,	%f30,	%f17
	fmovsgu	%xcc,	%f7,	%f19
	sllx	%i3,	%g7,	%l6
	edge32ln	%o6,	%l4,	%g4
	xor	%l1,	%g6,	%i5
	movl	%xcc,	%i2,	%g2
	edge16n	%o5,	%i1,	%g3
	movleu	%xcc,	%o2,	%i7
	andcc	%o7,	0x18AC,	%g5
	lduw	[%l7 + 0x48],	%g1
	popc	%l2,	%o0
	movg	%xcc,	%i6,	%i0
	sllx	%o4,	0x13,	%l0
	fmovde	%icc,	%f6,	%f17
	edge16	%l5,	%i4,	%o1
	xnorcc	%o3,	%i3,	%l3
	mulscc	%l6,	%g7,	%o6
	movneg	%xcc,	%g4,	%l1
	fors	%f13,	%f29,	%f25
	movle	%icc,	%g6,	%l4
	stx	%i5,	[%l7 + 0x58]
	edge16	%i2,	%o5,	%i1
	array8	%g2,	%g3,	%i7
	srax	%o7,	0x18,	%o2
	edge8l	%g1,	%g5,	%o0
	movn	%xcc,	%l2,	%i6
	fmovsne	%xcc,	%f11,	%f22
	edge8ln	%i0,	%o4,	%l0
	ldx	[%l7 + 0x78],	%i4
	save %l5, 0x0567, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%icc,	%i3,	%o3
	stw	%l6,	[%l7 + 0x5C]
	movg	%icc,	%l3,	%g7
	edge32	%o6,	%l1,	%g4
	edge32	%g6,	%i5,	%l4
	movg	%xcc,	%o5,	%i2
	fmovdl	%xcc,	%f7,	%f0
	move	%icc,	%g2,	%i1
	fsrc1s	%f15,	%f20
	fmul8ulx16	%f20,	%f8,	%f16
	udivx	%g3,	0x1450,	%o7
	edge32ln	%o2,	%g1,	%g5
	udivx	%i7,	0x0D12,	%l2
	fornot2s	%f0,	%f31,	%f28
	movpos	%xcc,	%o0,	%i6
	st	%f17,	[%l7 + 0x54]
	movcs	%xcc,	%i0,	%o4
	edge8l	%l0,	%l5,	%i4
	fmul8x16	%f22,	%f10,	%f30
	fxnors	%f18,	%f17,	%f26
	fmuld8sux16	%f0,	%f4,	%f10
	xnorcc	%o1,	0x1681,	%i3
	sdiv	%o3,	0x176E,	%l6
	or	%g7,	%l3,	%l1
	fmovdne	%icc,	%f1,	%f5
	sth	%g4,	[%l7 + 0x36]
	fpack16	%f10,	%f3
	sllx	%g6,	%i5,	%o6
	ld	[%l7 + 0x74],	%f6
	orncc	%o5,	0x0BEF,	%l4
	movcc	%xcc,	%g2,	%i1
	umul	%i2,	0x0B8B,	%g3
	edge8l	%o2,	%o7,	%g5
	fmovde	%xcc,	%f16,	%f17
	fpadd16s	%f14,	%f8,	%f9
	srlx	%i7,	%l2,	%g1
	edge16l	%i6,	%i0,	%o0
	edge32l	%o4,	%l5,	%i4
	save %l0, 0x07FF, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %o3, 0x0050, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%o1,	%l3
	fmovrde	%g7,	%f6,	%f18
	movvs	%icc,	%g4,	%g6
	movgu	%icc,	%i5,	%o6
	ldd	[%l7 + 0x08],	%l0
	addcc	%o5,	%l4,	%i1
	lduw	[%l7 + 0x6C],	%g2
	xorcc	%g3,	%i2,	%o7
	stx	%o2,	[%l7 + 0x48]
	array8	%i7,	%l2,	%g1
	st	%f11,	[%l7 + 0x60]
	fmovsne	%icc,	%f26,	%f10
	and	%g5,	%i6,	%i0
	movcs	%xcc,	%o0,	%l5
	fcmpeq16	%f14,	%f8,	%i4
	popc	0x0BBB,	%o4
	or	%i3,	0x1941,	%l0
	addccc	%l6,	%o1,	%o3
	fmovrse	%g7,	%f25,	%f1
	fnegs	%f11,	%f8
	fmovsne	%xcc,	%f7,	%f2
	andn	%g4,	0x1739,	%l3
	sll	%i5,	0x11,	%o6
	mulx	%l1,	0x119A,	%o5
	movneg	%xcc,	%l4,	%i1
	udiv	%g2,	0x1C9C,	%g6
	edge8n	%i2,	%g3,	%o2
	xor	%o7,	0x0939,	%l2
	movg	%icc,	%i7,	%g1
	fcmped	%fcc3,	%f14,	%f2
	subc	%g5,	%i0,	%o0
	fcmpgt32	%f18,	%f26,	%i6
	fpmerge	%f27,	%f21,	%f28
	movle	%xcc,	%l5,	%i4
	fmovdg	%xcc,	%f31,	%f4
	edge16l	%i3,	%o4,	%l6
	addc	%l0,	0x15F3,	%o3
	fandnot2s	%f7,	%f4,	%f11
	array8	%o1,	%g4,	%g7
	fcmpd	%fcc2,	%f8,	%f30
	ldd	[%l7 + 0x78],	%i4
	std	%f28,	[%l7 + 0x10]
	orn	%o6,	0x0427,	%l3
	ldsh	[%l7 + 0x5C],	%o5
	fmovrdlz	%l1,	%f8,	%f22
	fcmpeq32	%f24,	%f18,	%l4
	movcc	%xcc,	%i1,	%g2
	movgu	%icc,	%g6,	%g3
	movle	%xcc,	%o2,	%i2
	fmovrdgez	%l2,	%f20,	%f6
	fmovsle	%icc,	%f30,	%f20
	fands	%f23,	%f28,	%f22
	sub	%i7,	%g1,	%g5
	alignaddr	%i0,	%o0,	%i6
	sub	%o7,	%i4,	%l5
	udiv	%o4,	0x1D59,	%i3
	fors	%f5,	%f20,	%f5
	movvc	%icc,	%l6,	%o3
	srl	%l0,	%o1,	%g7
	stw	%i5,	[%l7 + 0x4C]
	movcc	%icc,	%g4,	%l3
	fmovsle	%xcc,	%f29,	%f7
	fcmped	%fcc0,	%f10,	%f6
	std	%f24,	[%l7 + 0x48]
	udivcc	%o5,	0x03B6,	%o6
	edge16n	%l1,	%i1,	%l4
	movneg	%icc,	%g6,	%g3
	edge8n	%o2,	%g2,	%l2
	lduw	[%l7 + 0x48],	%i2
	edge32n	%g1,	%g5,	%i7
	fmovsvc	%icc,	%f26,	%f9
	fandnot1s	%f28,	%f20,	%f7
	umulcc	%o0,	%i0,	%o7
	fandnot1s	%f26,	%f9,	%f1
	movge	%icc,	%i6,	%i4
	sra	%l5,	%i3,	%l6
	edge8n	%o3,	%o4,	%o1
	edge16n	%l0,	%i5,	%g7
	sllx	%g4,	0x10,	%o5
	ldd	[%l7 + 0x18],	%l2
	subcc	%l1,	0x1A43,	%i1
	edge8ln	%l4,	%o6,	%g3
	edge32l	%g6,	%g2,	%l2
	movl	%icc,	%i2,	%o2
	fsrc1	%f16,	%f4
	edge16n	%g1,	%i7,	%o0
	udivx	%g5,	0x11AD,	%i0
	ldd	[%l7 + 0x30],	%i6
	fmovdle	%icc,	%f15,	%f22
	fmovsne	%xcc,	%f12,	%f12
	nop
	set	0x6E, %i4
	sth	%o7,	[%l7 + %i4]
	alignaddr	%l5,	%i3,	%i4
	std	%f6,	[%l7 + 0x68]
	fands	%f27,	%f16,	%f24
	edge32	%l6,	%o3,	%o1
	ld	[%l7 + 0x3C],	%f30
	movgu	%icc,	%l0,	%i5
	fcmpgt16	%f0,	%f16,	%o4
	movge	%xcc,	%g7,	%g4
	edge16n	%l3,	%l1,	%o5
	fmovrslez	%l4,	%f29,	%f21
	andcc	%o6,	0x1CC2,	%g3
	add	%g6,	%i1,	%g2
	movge	%icc,	%l2,	%i2
	fmovsl	%xcc,	%f20,	%f3
	edge16n	%g1,	%i7,	%o0
	fmovrslez	%g5,	%f4,	%f17
	fpsub32	%f20,	%f2,	%f20
	fmovdcc	%icc,	%f31,	%f9
	edge32ln	%o2,	%i0,	%o7
	fcmpgt32	%f8,	%f28,	%i6
	ldsh	[%l7 + 0x2E],	%l5
	srax	%i3,	0x1C,	%l6
	fxnor	%f30,	%f18,	%f22
	movn	%icc,	%i4,	%o3
	sdivx	%o1,	0x1BEF,	%l0
	movge	%xcc,	%o4,	%i5
	fmovrdlez	%g4,	%f18,	%f2
	fpadd32	%f18,	%f14,	%f14
	sethi	0x1E45,	%g7
	subc	%l1,	%l3,	%o5
	udiv	%l4,	0x102D,	%g3
	movrne	%o6,	0x362,	%i1
	sra	%g6,	%l2,	%i2
	orcc	%g1,	0x1742,	%g2
	andn	%i7,	%g5,	%o0
	xorcc	%o2,	%o7,	%i6
	movn	%icc,	%i0,	%i3
	lduw	[%l7 + 0x20],	%l5
	fandnot1	%f24,	%f26,	%f8
	ldsb	[%l7 + 0x1D],	%l6
	sdivcc	%o3,	0x1977,	%o1
	smulcc	%l0,	0x0126,	%o4
	ldd	[%l7 + 0x38],	%f12
	movvs	%icc,	%i5,	%g4
	fcmpgt16	%f6,	%f16,	%g7
	movvc	%xcc,	%i4,	%l1
	srl	%l3,	0x06,	%l4
	xor	%o5,	%g3,	%o6
	ld	[%l7 + 0x30],	%f6
	subcc	%g6,	0x0D0E,	%l2
	umul	%i1,	%i2,	%g2
	popc	%i7,	%g5
	edge16l	%g1,	%o0,	%o2
	srl	%o7,	0x1E,	%i0
	edge8	%i3,	%l5,	%l6
	fmuld8ulx16	%f9,	%f28,	%f10
	movre	%i6,	%o3,	%l0
	sdivcc	%o1,	0x0A70,	%i5
	fmovdn	%xcc,	%f16,	%f15
	orncc	%o4,	%g4,	%g7
	ldsw	[%l7 + 0x44],	%l1
	edge8l	%i4,	%l3,	%l4
	ldsb	[%l7 + 0x0E],	%o5
	setx loop_35, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_35: 	srlx	%l2,	%g3,	%i2
	fmovrsgez	%i1,	%f19,	%f14
	xorcc	%g2,	0x0740,	%g5
	sdivcc	%g1,	0x1726,	%i7
	move	%icc,	%o2,	%o7
	andn	%o0,	0x1BA9,	%i0
	movrgz	%i3,	0x06D,	%l5
	addccc	%i6,	%o3,	%l6
	fmovde	%xcc,	%f22,	%f16
	fmovdcs	%icc,	%f28,	%f28
	subccc	%l0,	0x04AC,	%o1
	faligndata	%f0,	%f14,	%f6
	srax	%o4,	%i5,	%g7
	movrlez	%g4,	0x15D,	%l1
	edge16ln	%i4,	%l3,	%l4
	fabss	%f31,	%f24
	for	%f22,	%f24,	%f0
	movre	%o5,	0x067,	%g6
	srl	%l2,	%g3,	%i2
	fnot2s	%f12,	%f1
	fmovdneg	%xcc,	%f2,	%f13
	andncc	%o6,	%g2,	%g5
	addc	%g1,	%i1,	%i7
	fxnors	%f0,	%f29,	%f17
	movrgez	%o7,	%o2,	%o0
	movne	%xcc,	%i3,	%i0
	fcmpd	%fcc0,	%f24,	%f8
	save %l5, 0x0CC3, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8n	%l6,	%l0,	%o1
	edge32l	%o4,	%o3,	%g7
	fpsub32s	%f18,	%f25,	%f26
	xorcc	%g4,	0x1414,	%i5
	edge8ln	%l1,	%i4,	%l3
	movl	%icc,	%l4,	%o5
	andn	%l2,	0x1712,	%g6
	edge32ln	%g3,	%i2,	%g2
	subcc	%o6,	0x14DE,	%g5
	mova	%icc,	%i1,	%g1
	fmuld8ulx16	%f25,	%f28,	%f24
	ldd	[%l7 + 0x58],	%f2
	fmovdneg	%icc,	%f16,	%f24
	restore %o7, 0x083D, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	lduw	[%l7 + 0x68],	%o2
	fornot1	%f26,	%f16,	%f4
	movg	%icc,	%o0,	%i0
	fcmple32	%f18,	%f24,	%i3
	fmovdvc	%xcc,	%f9,	%f27
	andn	%i6,	%l6,	%l0
	edge32n	%o1,	%o4,	%o3
	umulcc	%l5,	%g4,	%i5
	movl	%icc,	%l1,	%g7
	movl	%icc,	%l3,	%i4
	ldsb	[%l7 + 0x65],	%o5
	xor	%l2,	%g6,	%g3
	ldd	[%l7 + 0x28],	%i2
	fmovrslz	%g2,	%f10,	%f24
	fxor	%f28,	%f14,	%f14
	save %o6, %g5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g1,	0x17CD,	%o7
	movpos	%icc,	%l4,	%i7
	edge32	%o0,	%o2,	%i3
	fmul8ulx16	%f18,	%f24,	%f16
	edge16ln	%i6,	%i0,	%l0
	movn	%icc,	%o1,	%o4
	andcc	%l6,	0x087A,	%o3
	ldsb	[%l7 + 0x5A],	%l5
	movcs	%icc,	%g4,	%l1
	fabss	%f20,	%f7
	fnot1s	%f5,	%f26
	ldub	[%l7 + 0x60],	%g7
	movpos	%icc,	%l3,	%i4
	sub	%o5,	0x19D6,	%i5
	fmovsvc	%xcc,	%f6,	%f20
	sub	%g6,	0x1377,	%l2
	edge16n	%g3,	%i2,	%g2
	andcc	%g5,	%o6,	%i1
	xnor	%g1,	0x10D9,	%l4
	movcs	%icc,	%i7,	%o7
	edge16ln	%o0,	%i3,	%i6
	sethi	0x0234,	%i0
	edge16l	%o2,	%o1,	%l0
	xnorcc	%o4,	0x1716,	%o3
	edge16ln	%l6,	%g4,	%l1
	umulcc	%g7,	%l5,	%l3
	subcc	%i4,	0x0788,	%o5
	edge16	%i5,	%l2,	%g3
	movrgz	%g6,	0x141,	%g2
	srl	%i2,	%o6,	%g5
	srax	%i1,	%g1,	%l4
	edge8	%i7,	%o7,	%i3
	movg	%icc,	%i6,	%i0
	sub	%o0,	%o1,	%o2
	edge32n	%l0,	%o3,	%l6
	sdiv	%g4,	0x033E,	%l1
	stx	%g7,	[%l7 + 0x50]
	fands	%f6,	%f16,	%f16
	sll	%l5,	%o4,	%l3
	fnor	%f2,	%f0,	%f4
	fmovrsgz	%o5,	%f9,	%f22
	edge8n	%i4,	%l2,	%g3
	and	%i5,	0x0D32,	%g6
	move	%icc,	%g2,	%i2
	alignaddrl	%o6,	%g5,	%i1
	edge32l	%g1,	%i7,	%l4
	ldub	[%l7 + 0x7A],	%o7
	xnor	%i3,	%i0,	%i6
	fmovde	%xcc,	%f21,	%f7
	xor	%o1,	0x1B89,	%o2
	fmovs	%f27,	%f7
	orn	%o0,	%o3,	%l6
	ldsw	[%l7 + 0x5C],	%g4
	ldd	[%l7 + 0x50],	%l0
	ldd	[%l7 + 0x28],	%g6
	movrgz	%l5,	0x22A,	%o4
	andcc	%l3,	0x0EF6,	%l1
	srax	%i4,	%l2,	%o5
	edge8l	%i5,	%g3,	%g2
	edge8	%i2,	%o6,	%g5
	addc	%i1,	0x1DAF,	%g6
	sllx	%g1,	%l4,	%i7
	movpos	%icc,	%i3,	%o7
	movle	%icc,	%i6,	%o1
	andn	%o2,	%o0,	%o3
	subc	%i0,	0x0935,	%l6
	srl	%l0,	0x04,	%g7
	sdivx	%g4,	0x1009,	%o4
	fpadd32	%f20,	%f8,	%f20
	fmovspos	%icc,	%f13,	%f11
	fmovrse	%l5,	%f4,	%f3
	sir	0x032F
	umul	%l1,	%l3,	%i4
	add	%l2,	0x1ACA,	%o5
	std	%f18,	[%l7 + 0x70]
	movrlez	%g3,	%i5,	%g2
	fpadd32s	%f9,	%f20,	%f25
	addc	%o6,	0x1180,	%g5
	fmovdvs	%icc,	%f26,	%f5
	andn	%i1,	%g6,	%g1
	edge8ln	%l4,	%i7,	%i2
	subccc	%i3,	0x11B7,	%i6
	lduw	[%l7 + 0x70],	%o7
	andn	%o1,	%o2,	%o3
	fmovs	%f20,	%f7
	andn	%i0,	%l6,	%l0
	alignaddr	%o0,	%g7,	%o4
	edge16l	%g4,	%l5,	%l1
	edge16l	%i4,	%l3,	%o5
	fpsub16s	%f10,	%f10,	%f7
	ld	[%l7 + 0x14],	%f30
	orcc	%l2,	%i5,	%g3
	move	%xcc,	%o6,	%g5
	subccc	%i1,	0x0A86,	%g2
	edge8ln	%g6,	%g1,	%l4
	array32	%i2,	%i3,	%i7
	movcs	%icc,	%i6,	%o7
	edge32n	%o2,	%o1,	%o3
	fmovdcs	%icc,	%f10,	%f21
	smulcc	%i0,	0x04EA,	%l0
	movleu	%xcc,	%o0,	%g7
	movrne	%l6,	0x160,	%g4
	smul	%o4,	%l1,	%i4
	array32	%l3,	%o5,	%l2
	movrlz	%i5,	0x335,	%l5
	edge8n	%g3,	%g5,	%i1
	mulx	%g2,	%g6,	%g1
	fmovdn	%xcc,	%f31,	%f26
	movrlz	%l4,	0x209,	%o6
	andn	%i3,	0x0951,	%i7
	sub	%i6,	0x1F14,	%o7
	sllx	%i2,	%o1,	%o2
	mova	%icc,	%o3,	%i0
	subcc	%o0,	0x05BC,	%l0
	edge16	%g7,	%g4,	%l6
	fmovdcs	%xcc,	%f19,	%f31
	srax	%l1,	%i4,	%o4
	fcmpgt32	%f20,	%f26,	%l3
	ldub	[%l7 + 0x23],	%o5
	fmovrsgz	%i5,	%f29,	%f12
	sth	%l5,	[%l7 + 0x5E]
	sth	%g3,	[%l7 + 0x12]
	ld	[%l7 + 0x28],	%f7
	movvs	%icc,	%l2,	%i1
	fmovda	%xcc,	%f18,	%f30
	edge16l	%g2,	%g5,	%g1
	edge32n	%g6,	%l4,	%o6
	movneg	%xcc,	%i3,	%i6
	movle	%icc,	%o7,	%i2
	ldd	[%l7 + 0x18],	%i6
	nop
	set	0x50, %g4
	ldsb	[%l7 + %g4],	%o1
	lduh	[%l7 + 0x62],	%o2
	movre	%i0,	0x32B,	%o0
	stx	%l0,	[%l7 + 0x30]
	sra	%g7,	%o3,	%g4
	stw	%l6,	[%l7 + 0x20]
	orn	%i4,	0x0F69,	%o4
	setx loop_36, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_36: 	andncc	%i5,	%o5,	%g3
	fcmpeq16	%f8,	%f2,	%l2
	movrgz	%l5,	0x25E,	%i1
	edge8ln	%g5,	%g2,	%g6
	fmovsvs	%xcc,	%f11,	%f17
	sdivx	%l4,	0x19A1,	%g1
	smul	%i3,	%i6,	%o7
	for	%f26,	%f20,	%f14
	move	%icc,	%o6,	%i2
	fmovdge	%icc,	%f18,	%f2
	array32	%i7,	%o1,	%i0
	array16	%o2,	%o0,	%g7
	ldd	[%l7 + 0x08],	%f22
	stb	%l0,	[%l7 + 0x1D]
	edge32ln	%o3,	%l6,	%i4
	udiv	%o4,	0x1CF9,	%l1
	ldub	[%l7 + 0x47],	%l3
	xorcc	%i5,	0x1B9F,	%g4
	fnand	%f28,	%f24,	%f4
	mova	%xcc,	%o5,	%l2
	fmovrse	%l5,	%f2,	%f3
	sra	%g3,	0x1D,	%i1
	nop
	set	0x68, %g2
	ldd	[%l7 + %g2],	%g2
	fmovspos	%xcc,	%f24,	%f10
	orcc	%g6,	%g5,	%l4
	orn	%g1,	0x13A7,	%i6
	edge32ln	%i3,	%o6,	%o7
	edge32	%i2,	%o1,	%i7
	and	%i0,	0x0C77,	%o2
	edge8ln	%g7,	%o0,	%l0
	movle	%xcc,	%o3,	%l6
	fnands	%f1,	%f28,	%f23
	edge16n	%o4,	%i4,	%l3
	restore %i5, 0x0ED2, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%o5,	%g4,	%l2
	umul	%l5,	0x1473,	%g3
	movpos	%icc,	%g2,	%i1
	ld	[%l7 + 0x38],	%f15
	edge16l	%g5,	%l4,	%g1
	edge8ln	%g6,	%i6,	%i3
	udiv	%o6,	0x1FF8,	%i2
	fexpand	%f1,	%f0
	movrlz	%o7,	%i7,	%i0
	edge32n	%o1,	%o2,	%g7
	fmul8ulx16	%f14,	%f18,	%f8
	andn	%l0,	%o3,	%l6
	sll	%o4,	%i4,	%l3
	alignaddrl	%o0,	%i5,	%o5
	addcc	%g4,	0x12BD,	%l2
	fmovsvs	%xcc,	%f8,	%f24
	save %l5, 0x0FAE, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%l1,	%g2,	%i1
	stw	%g5,	[%l7 + 0x50]
	fnot1	%f22,	%f14
	addcc	%l4,	0x181D,	%g1
	fmovdvc	%xcc,	%f2,	%f24
	fnegd	%f0,	%f12
	edge32l	%i6,	%g6,	%i3
	array32	%o6,	%o7,	%i2
	edge32n	%i7,	%i0,	%o2
	ldd	[%l7 + 0x50],	%f10
	sra	%o1,	0x0E,	%l0
	srax	%o3,	0x15,	%l6
	xnor	%o4,	%g7,	%l3
	fand	%f26,	%f16,	%f8
	fnand	%f10,	%f20,	%f8
	array32	%o0,	%i5,	%o5
	movrlez	%g4,	0x2D2,	%i4
	movvc	%xcc,	%l2,	%l5
	sub	%g3,	%l1,	%i1
	mova	%xcc,	%g5,	%g2
	fandnot1s	%f30,	%f11,	%f28
	fxnor	%f24,	%f26,	%f26
	orncc	%l4,	%g1,	%i6
	fcmpgt16	%f10,	%f16,	%g6
	fmovdge	%icc,	%f19,	%f25
	fnot1s	%f20,	%f19
	subccc	%i3,	0x153F,	%o6
	edge16n	%o7,	%i2,	%i7
	umulcc	%o2,	0x09F3,	%o1
	lduh	[%l7 + 0x30],	%l0
	fmovsge	%icc,	%f13,	%f6
	ldd	[%l7 + 0x68],	%o2
	sdiv	%i0,	0x109A,	%l6
	edge8n	%o4,	%g7,	%o0
	edge8l	%l3,	%i5,	%g4
	addc	%o5,	%i4,	%l2
	movcs	%icc,	%l5,	%l1
	umul	%g3,	0x0980,	%i1
	fpadd16	%f16,	%f20,	%f24
	srlx	%g5,	0x0D,	%l4
	stw	%g1,	[%l7 + 0x38]
	fmul8ulx16	%f6,	%f10,	%f16
	edge8l	%g2,	%g6,	%i6
	ldsb	[%l7 + 0x45],	%o6
	movcc	%icc,	%i3,	%i2
	ldsh	[%l7 + 0x60],	%i7
	fnors	%f22,	%f21,	%f1
	movne	%icc,	%o7,	%o2
	movneg	%icc,	%l0,	%o1
	subccc	%i0,	0x1FE7,	%l6
	sethi	0x1A8E,	%o4
	mulx	%g7,	%o0,	%l3
	bshuffle	%f24,	%f4,	%f2
	fnot2s	%f22,	%f6
	orcc	%o3,	%g4,	%o5
	xorcc	%i5,	%l2,	%i4
	fpadd32	%f0,	%f10,	%f24
	movvc	%icc,	%l5,	%g3
	sdivcc	%i1,	0x0819,	%g5
	orcc	%l1,	%g1,	%l4
	mova	%xcc,	%g2,	%i6
	mulx	%g6,	%i3,	%i2
	fcmple32	%f10,	%f6,	%i7
	srlx	%o7,	0x13,	%o2
	xnor	%o6,	%o1,	%i0
	fmovdcc	%icc,	%f6,	%f0
	edge32ln	%l0,	%l6,	%g7
	fmovdleu	%xcc,	%f2,	%f18
	fpsub16s	%f14,	%f24,	%f25
	edge16n	%o0,	%l3,	%o4
	sth	%o3,	[%l7 + 0x0A]
	umul	%g4,	0x08F0,	%o5
	umul	%l2,	0x1309,	%i4
	movg	%icc,	%i5,	%g3
	stw	%i1,	[%l7 + 0x58]
	ldd	[%l7 + 0x78],	%l4
	andcc	%g5,	%l1,	%l4
	orcc	%g2,	%i6,	%g6
	sra	%i3,	0x03,	%i2
	edge8ln	%i7,	%o7,	%o2
	sub	%g1,	0x05B9,	%o1
	xor	%i0,	0x1EFA,	%o6
	ldub	[%l7 + 0x39],	%l0
	movcs	%icc,	%l6,	%o0
	mova	%icc,	%l3,	%o4
	array16	%g7,	%g4,	%o3
	edge32ln	%l2,	%i4,	%o5
	edge8	%g3,	%i5,	%l5
	fmovsn	%icc,	%f3,	%f16
	stx	%i1,	[%l7 + 0x10]
	fexpand	%f24,	%f14
	subc	%g5,	%l1,	%g2
	edge16	%l4,	%g6,	%i6
	sir	0x029B
	movle	%icc,	%i2,	%i3
	edge16	%o7,	%o2,	%g1
	addc	%o1,	0x0654,	%i7
	nop
	set	0x11, %i1
	ldub	[%l7 + %i1],	%i0
	addcc	%l0,	%o6,	%l6
	movge	%xcc,	%l3,	%o0
	sllx	%o4,	%g7,	%o3
	fpadd16	%f26,	%f2,	%f30
	movleu	%icc,	%g4,	%i4
	addc	%o5,	%l2,	%g3
	nop
	set	0x2C, %o2
	sth	%l5,	[%l7 + %o2]
	edge16n	%i1,	%g5,	%l1
	ld	[%l7 + 0x34],	%f16
	subcc	%g2,	%i5,	%l4
	sir	0x1C51
	fnors	%f22,	%f2,	%f28
	subccc	%i6,	0x0604,	%i2
	fnegs	%f13,	%f4
	sub	%i3,	%o7,	%g6
	srl	%o2,	%o1,	%i7
	edge32l	%g1,	%l0,	%i0
	movn	%icc,	%o6,	%l6
	srl	%l3,	0x04,	%o0
	popc	%o4,	%o3
	srl	%g4,	0x16,	%i4
	fcmpne32	%f6,	%f10,	%g7
	xor	%l2,	0x1C7E,	%o5
	fsrc1s	%f22,	%f1
	fmovdneg	%xcc,	%f7,	%f30
	sra	%l5,	0x02,	%i1
	edge8	%g3,	%g5,	%l1
	udiv	%g2,	0x0320,	%l4
	edge32	%i6,	%i2,	%i3
	array8	%o7,	%i5,	%g6
	movle	%xcc,	%o2,	%i7
	movrne	%g1,	0x0F7,	%l0
	andncc	%i0,	%o1,	%l6
	lduw	[%l7 + 0x14],	%o6
	andcc	%o0,	%o4,	%o3
	nop
	set	0x20, %g5
	ldsh	[%l7 + %g5],	%g4
	edge32	%i4,	%l3,	%g7
	fmovsge	%icc,	%f23,	%f21
	fpadd16	%f6,	%f14,	%f26
	edge32ln	%l2,	%l5,	%i1
	stw	%o5,	[%l7 + 0x60]
	edge16	%g5,	%g3,	%g2
	edge16ln	%l4,	%i6,	%l1
	sdivx	%i2,	0x0D96,	%i3
	fmovde	%xcc,	%f17,	%f12
	edge16	%i5,	%g6,	%o7
	udivcc	%o2,	0x1E58,	%i7
	fmovdpos	%icc,	%f6,	%f20
	xorcc	%g1,	0x1E57,	%i0
	orcc	%l0,	%o1,	%o6
	xor	%l6,	0x1D5E,	%o0
	sll	%o4,	0x07,	%o3
	movre	%g4,	0x37C,	%l3
	movle	%icc,	%i4,	%g7
	edge8l	%l5,	%i1,	%l2
	ldx	[%l7 + 0x78],	%o5
	ld	[%l7 + 0x7C],	%f5
	orncc	%g3,	%g2,	%l4
	fsrc1	%f30,	%f24
	sdivcc	%g5,	0x0425,	%i6
	stb	%l1,	[%l7 + 0x7A]
	fmovrsgez	%i3,	%f17,	%f0
	andncc	%i2,	%g6,	%o7
	movpos	%xcc,	%o2,	%i7
	or	%g1,	%i5,	%l0
	movgu	%icc,	%o1,	%o6
	fmovrdlz	%l6,	%f6,	%f4
	fmul8sux16	%f0,	%f8,	%f24
	andn	%o0,	%o4,	%i0
	alignaddrl	%o3,	%g4,	%i4
	ldd	[%l7 + 0x70],	%f30
	fmovd	%f20,	%f18
	st	%f23,	[%l7 + 0x08]
	srlx	%g7,	%l3,	%i1
	movrlez	%l5,	%l2,	%o5
	fmovdneg	%xcc,	%f2,	%f24
	fcmple16	%f0,	%f18,	%g3
	fnot1s	%f7,	%f18
	ld	[%l7 + 0x6C],	%f12
	mulx	%l4,	%g2,	%g5
	srax	%l1,	0x01,	%i3
	fmovsa	%xcc,	%f9,	%f4
	fcmpeq16	%f28,	%f10,	%i6
	or	%i2,	%o7,	%o2
	add	%g6,	%i7,	%i5
	for	%f6,	%f2,	%f10
	addccc	%g1,	0x1CEB,	%o1
	edge8ln	%o6,	%l0,	%o0
	fmovsg	%icc,	%f18,	%f5
	fmul8ulx16	%f22,	%f8,	%f0
	movge	%xcc,	%l6,	%i0
	movn	%xcc,	%o3,	%g4
	or	%o4,	%g7,	%l3
	ldsh	[%l7 + 0x56],	%i1
	fcmpeq16	%f20,	%f10,	%l5
	movg	%xcc,	%i4,	%o5
	fmovsl	%xcc,	%f22,	%f26
	subcc	%g3,	%l4,	%g2
	fornot1s	%f14,	%f30,	%f2
	movgu	%icc,	%l2,	%l1
	movleu	%icc,	%g5,	%i6
	or	%i2,	%o7,	%o2
	pdist	%f10,	%f30,	%f24
	and	%g6,	0x0AA2,	%i7
	stx	%i5,	[%l7 + 0x40]
	movl	%icc,	%g1,	%o1
	movn	%xcc,	%o6,	%l0
	stb	%o0,	[%l7 + 0x43]
	nop
	set	0x74, %o3
	stw	%l6,	[%l7 + %o3]
	fnot2	%f8,	%f6
	edge8ln	%i3,	%i0,	%g4
	movge	%xcc,	%o3,	%o4
	srax	%g7,	0x13,	%i1
	array16	%l5,	%l3,	%o5
	array8	%g3,	%i4,	%g2
	fmovsge	%xcc,	%f11,	%f27
	array16	%l2,	%l4,	%g5
	fmovdpos	%xcc,	%f9,	%f15
	sub	%l1,	%i2,	%i6
	stx	%o2,	[%l7 + 0x60]
	nop
	set	0x6E, %o1
	ldsb	[%l7 + %o1],	%o7
	st	%f24,	[%l7 + 0x48]
	orn	%g6,	0x08FA,	%i5
	std	%f8,	[%l7 + 0x60]
	movneg	%xcc,	%g1,	%i7
	edge8ln	%o6,	%l0,	%o0
	subccc	%l6,	%i3,	%i0
	mulx	%o1,	%g4,	%o4
	fcmpgt32	%f12,	%f2,	%o3
	fcmpes	%fcc1,	%f28,	%f16
	sra	%g7,	%i1,	%l5
	andncc	%l3,	%o5,	%g3
	smul	%g2,	0x0FA1,	%i4
	subcc	%l2,	0x0E3E,	%g5
	fxor	%f14,	%f4,	%f20
	sdivcc	%l4,	0x1F5A,	%i2
	ld	[%l7 + 0x68],	%f28
	andn	%i6,	%o2,	%o7
	andn	%g6,	%l1,	%i5
	xnor	%g1,	%o6,	%l0
	stb	%o0,	[%l7 + 0x0B]
	fmovsgu	%xcc,	%f2,	%f27
	xnor	%i7,	0x0C0B,	%l6
	srlx	%i0,	%o1,	%i3
	array8	%g4,	%o4,	%g7
	sub	%o3,	%l5,	%i1
	ldd	[%l7 + 0x58],	%f18
	movl	%xcc,	%l3,	%g3
	xnor	%o5,	%i4,	%l2
	sir	0x0646
	move	%xcc,	%g2,	%l4
	movge	%xcc,	%i2,	%i6
	edge32ln	%g5,	%o7,	%g6
	sllx	%l1,	%o2,	%i5
	addcc	%o6,	%g1,	%o0
	popc	0x0AA1,	%l0
	movn	%icc,	%i7,	%i0
	fmul8x16al	%f14,	%f4,	%f30
	fmovrsne	%o1,	%f20,	%f25
	edge8l	%i3,	%g4,	%l6
	sdivcc	%g7,	0x1411,	%o3
	fmovdl	%icc,	%f22,	%f24
	edge32ln	%o4,	%l5,	%l3
	movl	%icc,	%i1,	%g3
	sll	%o5,	0x1C,	%i4
	fcmpeq32	%f20,	%f8,	%g2
	ldsh	[%l7 + 0x34],	%l4
	sllx	%i2,	%l2,	%i6
	edge32l	%o7,	%g5,	%l1
	fpsub16	%f16,	%f4,	%f0
	movrgz	%g6,	0x2E5,	%o2
	movleu	%xcc,	%o6,	%i5
	sdiv	%g1,	0x06F3,	%l0
	fmovrdlz	%o0,	%f0,	%f16
	sethi	0x04F3,	%i7
	movrlez	%o1,	0x06A,	%i0
	srax	%i3,	%l6,	%g7
	srl	%o3,	%o4,	%l5
	ldsh	[%l7 + 0x12],	%g4
	stw	%l3,	[%l7 + 0x5C]
	stb	%i1,	[%l7 + 0x47]
	subccc	%o5,	%i4,	%g2
	fmovrde	%g3,	%f28,	%f22
	xnorcc	%l4,	0x0CAD,	%l2
	movvc	%xcc,	%i2,	%i6
	edge16	%o7,	%g5,	%g6
	popc	%o2,	%l1
	mulx	%o6,	%i5,	%l0
	movcc	%xcc,	%o0,	%i7
	edge32	%g1,	%o1,	%i0
	sra	%i3,	%g7,	%o3
	stx	%o4,	[%l7 + 0x08]
	fpsub16	%f18,	%f8,	%f0
	sir	0x175F
	alignaddrl	%l6,	%l5,	%g4
	stb	%l3,	[%l7 + 0x51]
	movrlez	%o5,	%i4,	%i1
	fxnor	%f0,	%f6,	%f16
	andn	%g3,	0x19B6,	%l4
	std	%f30,	[%l7 + 0x50]
	subcc	%g2,	%i2,	%i6
	nop
	set	0x5C, %o6
	lduw	[%l7 + %o6],	%o7
	array16	%g5,	%g6,	%o2
	orncc	%l2,	%o6,	%l1
	movrgz	%i5,	%o0,	%l0
	movvc	%xcc,	%g1,	%i7
	fxor	%f14,	%f16,	%f8
	lduw	[%l7 + 0x30],	%i0
	fmovrsne	%i3,	%f2,	%f27
	addcc	%o1,	0x1DA9,	%o3
	ld	[%l7 + 0x54],	%f17
	ldd	[%l7 + 0x48],	%g6
	movrgz	%o4,	%l5,	%l6
	movne	%xcc,	%g4,	%o5
	stx	%i4,	[%l7 + 0x60]
	sir	0x1D92
	sth	%l3,	[%l7 + 0x08]
	alignaddr	%g3,	%i1,	%g2
	andncc	%l4,	%i6,	%o7
	ldx	[%l7 + 0x30],	%g5
	ldsb	[%l7 + 0x2A],	%g6
	fmovdvc	%icc,	%f14,	%f30
	and	%o2,	%l2,	%o6
	save %l1, 0x09DD, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslz	%i5,	%f26,	%f20
	nop
	set	0x08, %l5
	ldx	[%l7 + %l5],	%l0
	movpos	%icc,	%g1,	%i7
	setx loop_37, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_37: 	popc	%o3,	%g7
	addc	%o0,	0x18E8,	%o4
	addcc	%l6,	%g4,	%l5
	or	%o5,	%l3,	%g3
	ld	[%l7 + 0x7C],	%f1
	alignaddr	%i4,	%g2,	%l4
	xor	%i6,	%o7,	%g5
	array8	%g6,	%i1,	%o2
	movle	%icc,	%o6,	%l2
	stb	%l1,	[%l7 + 0x70]
	stx	%i2,	[%l7 + 0x30]
	sdivcc	%i5,	0x0998,	%g1
	ldsb	[%l7 + 0x17],	%i7
	move	%xcc,	%i0,	%l0
	fmovda	%icc,	%f2,	%f9
	fcmpgt32	%f8,	%f6,	%i3
	alignaddrl	%o1,	%g7,	%o3
	std	%f12,	[%l7 + 0x20]
	fmovsleu	%icc,	%f22,	%f10
	movcc	%icc,	%o4,	%o0
	movne	%xcc,	%l6,	%l5
	addccc	%o5,	0x0498,	%l3
	smul	%g3,	0x0AA3,	%i4
	edge16ln	%g4,	%l4,	%g2
	movleu	%xcc,	%i6,	%g5
	andcc	%o7,	0x07BB,	%i1
	movrlez	%g6,	%o6,	%l2
	movne	%icc,	%o2,	%l1
	andncc	%i5,	%i2,	%g1
	andcc	%i7,	0x02AD,	%l0
	fmovdneg	%xcc,	%f12,	%f3
	ldd	[%l7 + 0x08],	%f6
	fcmps	%fcc3,	%f26,	%f4
	edge16l	%i3,	%i0,	%g7
	movrlez	%o3,	%o4,	%o1
	and	%o0,	0x1E98,	%l5
	edge16l	%o5,	%l3,	%g3
	smul	%i4,	%g4,	%l4
	orcc	%l6,	0x1D95,	%g2
	orn	%g5,	0x1C28,	%o7
	movre	%i1,	%i6,	%o6
	ldd	[%l7 + 0x10],	%f10
	sllx	%g6,	%o2,	%l2
	sll	%l1,	%i2,	%g1
	ldd	[%l7 + 0x40],	%i4
	stx	%i7,	[%l7 + 0x18]
	edge16n	%i3,	%l0,	%i0
	stb	%o3,	[%l7 + 0x08]
	smul	%g7,	0x1ECF,	%o1
	lduh	[%l7 + 0x22],	%o0
	array32	%o4,	%o5,	%l5
	movre	%g3,	0x012,	%l3
	sra	%g4,	0x16,	%l4
	ldd	[%l7 + 0x58],	%f14
	andcc	%i4,	0x1422,	%l6
	stb	%g2,	[%l7 + 0x20]
	edge8	%o7,	%g5,	%i1
	addc	%i6,	0x1FD8,	%o6
	stx	%o2,	[%l7 + 0x58]
	orncc	%l2,	%l1,	%g6
	fmovda	%icc,	%f4,	%f1
	ldsh	[%l7 + 0x24],	%i2
	fpmerge	%f4,	%f29,	%f4
	restore %g1, %i7, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddrl	%l0,	%i0,	%o3
	movcs	%xcc,	%i3,	%g7
	umul	%o1,	0x0AD7,	%o4
	sth	%o0,	[%l7 + 0x66]
	fmovde	%icc,	%f2,	%f9
	sllx	%o5,	%l5,	%g3
	xnor	%l3,	%l4,	%g4
	fcmped	%fcc3,	%f2,	%f4
	movleu	%xcc,	%l6,	%g2
	nop
	set	0x1F, %l0
	stb	%o7,	[%l7 + %l0]
	andn	%i4,	%i1,	%i6
	siam	0x5
	ldub	[%l7 + 0x10],	%o6
	move	%icc,	%g5,	%l2
	srl	%l1,	%g6,	%i2
	edge32ln	%g1,	%o2,	%i7
	umulcc	%l0,	0x199E,	%i5
	fnegs	%f24,	%f1
	movrne	%i0,	0x3C7,	%i3
	movrgz	%g7,	%o1,	%o4
	edge8l	%o3,	%o5,	%l5
	or	%g3,	%l3,	%l4
	movrlez	%g4,	0x210,	%o0
	st	%f28,	[%l7 + 0x60]
	fcmpd	%fcc0,	%f14,	%f2
	movge	%xcc,	%g2,	%l6
	fsrc1s	%f9,	%f20
	umulcc	%i4,	%i1,	%i6
	ldd	[%l7 + 0x68],	%f10
	ldsb	[%l7 + 0x6C],	%o7
	sethi	0x1C8F,	%o6
	movrne	%g5,	0x30E,	%l1
	fcmpeq16	%f6,	%f8,	%g6
	movvc	%xcc,	%l2,	%g1
	edge16l	%i2,	%o2,	%i7
	mova	%icc,	%l0,	%i5
	movrlez	%i3,	%g7,	%i0
	save %o4, %o3, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subc	%l5,	%o1,	%g3
	movrlez	%l3,	%l4,	%g4
	movvs	%icc,	%o0,	%g2
	array16	%i4,	%i1,	%i6
	movrlez	%l6,	0x220,	%o6
	srax	%o7,	0x14,	%g5
	xorcc	%g6,	%l2,	%g1
	stb	%l1,	[%l7 + 0x51]
	fmovdleu	%xcc,	%f21,	%f19
	movn	%xcc,	%o2,	%i2
	smul	%i7,	%i5,	%l0
	smulcc	%i3,	%i0,	%o4
	umulcc	%o3,	%o5,	%l5
	edge32	%g7,	%g3,	%o1
	lduw	[%l7 + 0x3C],	%l4
	save %g4, 0x0F82, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%g2,	%i4,	%i1
	fcmpes	%fcc0,	%f16,	%f8
	edge16ln	%i6,	%o0,	%o6
	std	%f24,	[%l7 + 0x70]
	movrne	%l6,	%g5,	%g6
	fone	%f0
	fpsub32s	%f25,	%f4,	%f24
	movrgz	%l2,	0x213,	%g1
	ldd	[%l7 + 0x20],	%f12
	move	%xcc,	%o7,	%l1
	movn	%icc,	%i2,	%o2
	lduh	[%l7 + 0x3A],	%i5
	sub	%i7,	%i3,	%l0
	ldsh	[%l7 + 0x28],	%o4
	array32	%o3,	%o5,	%l5
	ldd	[%l7 + 0x70],	%f10
	ldsh	[%l7 + 0x46],	%g7
	alignaddrl	%i0,	%g3,	%o1
	mulx	%l4,	0x192F,	%g4
	movneg	%icc,	%l3,	%i4
	udivx	%i1,	0x1D99,	%g2
	xor	%i6,	0x0ABD,	%o0
	addccc	%l6,	0x0022,	%o6
	faligndata	%f26,	%f0,	%f16
	edge8ln	%g6,	%l2,	%g1
	array32	%o7,	%g5,	%i2
	fmul8x16	%f0,	%f20,	%f4
	sub	%o2,	%i5,	%i7
	add	%i3,	%l1,	%l0
	umulcc	%o4,	%o5,	%l5
	movg	%icc,	%o3,	%i0
	umulcc	%g3,	%o1,	%g7
	orncc	%l4,	%g4,	%i4
	fxnor	%f22,	%f30,	%f18
	movneg	%icc,	%i1,	%l3
	movpos	%icc,	%g2,	%i6
	array8	%o0,	%o6,	%g6
	sub	%l2,	%l6,	%g1
	sir	0x105C
	movneg	%icc,	%g5,	%o7
	fmovdcs	%icc,	%f0,	%f11
	alignaddr	%o2,	%i2,	%i5
	xor	%i7,	0x1171,	%l1
	ldsb	[%l7 + 0x1C],	%i3
	ldsh	[%l7 + 0x0C],	%l0
	std	%f6,	[%l7 + 0x20]
	fmovdn	%xcc,	%f1,	%f7
	mova	%xcc,	%o5,	%l5
	addcc	%o3,	0x08A2,	%i0
	ldsh	[%l7 + 0x1A],	%o4
	ldub	[%l7 + 0x19],	%g3
	movge	%xcc,	%g7,	%l4
	edge32ln	%g4,	%i4,	%o1
	ldsb	[%l7 + 0x6B],	%i1
	udivx	%g2,	0x1151,	%l3
	fmovdn	%icc,	%f26,	%f20
	mova	%icc,	%i6,	%o0
	edge32l	%o6,	%l2,	%g6
	mulx	%l6,	%g5,	%o7
	ldsw	[%l7 + 0x6C],	%o2
	sdivcc	%g1,	0x0B3B,	%i5
	nop
	set	0x0B, %i6
	stb	%i2,	[%l7 + %i6]
	ldx	[%l7 + 0x50],	%i7
	edge8ln	%l1,	%i3,	%l0
	udiv	%l5,	0x09CC,	%o3
	movne	%xcc,	%i0,	%o5
	fmovdcs	%xcc,	%f15,	%f0
	subc	%g3,	%o4,	%g7
	fcmpeq32	%f14,	%f12,	%l4
	fmovrsgz	%i4,	%f12,	%f16
	fmovdleu	%icc,	%f2,	%f8
	movneg	%xcc,	%o1,	%i1
	edge16ln	%g4,	%g2,	%i6
	faligndata	%f24,	%f8,	%f4
	srax	%l3,	0x15,	%o6
	setx loop_38, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_38: 	sir	0x1D04
	fmovscc	%xcc,	%f16,	%f21
	srlx	%g5,	0x1C,	%o0
	ldsh	[%l7 + 0x68],	%o2
	move	%xcc,	%o7,	%g1
	array32	%i5,	%i7,	%i2
	sth	%i3,	[%l7 + 0x7E]
	movne	%icc,	%l0,	%l5
	lduh	[%l7 + 0x2E],	%o3
	srl	%l1,	%o5,	%i0
	fcmpeq32	%f30,	%f6,	%g3
	movrgez	%o4,	0x043,	%g7
	fmovdleu	%icc,	%f18,	%f5
	edge32l	%i4,	%l4,	%i1
	movneg	%xcc,	%o1,	%g2
	xor	%i6,	0x1EF4,	%l3
	ldd	[%l7 + 0x48],	%o6
	add	%l2,	%g6,	%l6
	mova	%xcc,	%g5,	%g4
	fmovrsne	%o0,	%f11,	%f18
	andncc	%o2,	%o7,	%g1
	sllx	%i5,	%i2,	%i7
	subc	%l0,	0x19B7,	%l5
	stb	%o3,	[%l7 + 0x0D]
	sdivx	%i3,	0x12E7,	%o5
	fmovsleu	%icc,	%f23,	%f23
	sdiv	%i0,	0x1AF4,	%g3
	ldd	[%l7 + 0x20],	%f2
	array16	%o4,	%g7,	%l1
	fandnot1	%f20,	%f4,	%f0
	edge32n	%l4,	%i1,	%i4
	movrne	%o1,	%i6,	%g2
	ldx	[%l7 + 0x30],	%o6
	ldd	[%l7 + 0x58],	%f12
	sethi	0x1EFB,	%l3
	xnor	%g6,	0x08E8,	%l6
	lduw	[%l7 + 0x34],	%l2
	st	%f7,	[%l7 + 0x58]
	ld	[%l7 + 0x24],	%f8
	sll	%g5,	%g4,	%o2
	ld	[%l7 + 0x40],	%f25
	movne	%xcc,	%o7,	%o0
	addccc	%g1,	%i2,	%i5
	edge16ln	%l0,	%i7,	%o3
	sdivx	%l5,	0x1902,	%i3
	movrgz	%o5,	0x107,	%g3
	ldsh	[%l7 + 0x64],	%o4
	alignaddr	%i0,	%l1,	%l4
	edge32n	%i1,	%g7,	%o1
	popc	0x15E9,	%i6
	mulscc	%i4,	%g2,	%o6
	mulx	%l3,	0x18B7,	%g6
	array8	%l2,	%l6,	%g5
	std	%f22,	[%l7 + 0x38]
	fnot1	%f0,	%f6
	subc	%g4,	0x0951,	%o2
	sethi	0x08D5,	%o0
	nop
	set	0x25, %l3
	ldsb	[%l7 + %l3],	%g1
	mova	%icc,	%o7,	%i2
	ldx	[%l7 + 0x48],	%i5
	fcmped	%fcc1,	%f12,	%f14
	fcmple32	%f18,	%f2,	%l0
	movgu	%xcc,	%i7,	%l5
	ld	[%l7 + 0x28],	%f16
	ld	[%l7 + 0x74],	%f2
	movrne	%i3,	0x37B,	%o5
	save %g3, 0x1873, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsw	[%l7 + 0x08],	%o3
	fcmps	%fcc0,	%f5,	%f0
	xnorcc	%i0,	%l4,	%l1
	edge32l	%g7,	%o1,	%i1
	srax	%i6,	0x0C,	%g2
	movrgz	%o6,	%i4,	%l3
	popc	0x12DC,	%g6
	movl	%xcc,	%l2,	%g5
	edge16l	%g4,	%l6,	%o0
	orcc	%o2,	%g1,	%o7
	restore %i2, %l0, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%l5,	%i3,	%o5
	save %i7, 0x062D, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f3,	%f12
	movrgz	%g3,	%i0,	%o3
	sra	%l1,	0x05,	%g7
	xorcc	%o1,	0x1F4D,	%l4
	movre	%i6,	%g2,	%o6
	ldx	[%l7 + 0x10],	%i1
	fones	%f14
	udiv	%l3,	0x07C6,	%i4
	array32	%g6,	%l2,	%g5
	movcs	%xcc,	%g4,	%l6
	edge32	%o0,	%g1,	%o7
	movge	%icc,	%i2,	%l0
	fpadd16	%f2,	%f0,	%f28
	subc	%o2,	%i5,	%l5
	fmovdneg	%xcc,	%f14,	%f25
	movcc	%xcc,	%o5,	%i3
	fmovsvs	%xcc,	%f20,	%f2
	subcc	%o4,	0x0A90,	%g3
	array32	%i0,	%i7,	%l1
	movpos	%xcc,	%o3,	%g7
	fnot2	%f4,	%f16
	movre	%o1,	%l4,	%g2
	array8	%o6,	%i6,	%l3
	nop
	set	0x6E, %l2
	stb	%i4,	[%l7 + %l2]
	lduh	[%l7 + 0x08],	%g6
	std	%f8,	[%l7 + 0x18]
	udivx	%i1,	0x00E7,	%g5
	sethi	0x106D,	%l2
	ldd	[%l7 + 0x58],	%f12
	edge16l	%l6,	%g4,	%g1
	addccc	%o0,	%i2,	%o7
	lduw	[%l7 + 0x08],	%l0
	mulscc	%o2,	0x0A21,	%l5
	movpos	%xcc,	%i5,	%o5
	sub	%o4,	%i3,	%g3
	movrne	%i7,	0x079,	%l1
	edge8n	%o3,	%i0,	%o1
	fmovspos	%xcc,	%f9,	%f5
	xnor	%l4,	%g7,	%g2
	edge32ln	%o6,	%i6,	%i4
	stw	%g6,	[%l7 + 0x24]
	fmovdl	%xcc,	%f4,	%f18
	andcc	%l3,	0x0C70,	%i1
	add	%l2,	0x0FD0,	%l6
	fones	%f23
	srlx	%g5,	%g1,	%g4
	srl	%i2,	0x03,	%o7
	fmovdpos	%xcc,	%f8,	%f1
	fmovspos	%xcc,	%f21,	%f25
	xnorcc	%o0,	0x184D,	%l0
	ld	[%l7 + 0x74],	%f8
	movle	%xcc,	%l5,	%i5
	move	%xcc,	%o2,	%o5
	sdiv	%i3,	0x016A,	%g3
	movre	%i7,	0x29C,	%l1
	alignaddrl	%o4,	%i0,	%o1
	fandnot2	%f14,	%f20,	%f18
	addcc	%o3,	0x14DF,	%l4
	popc	%g7,	%o6
	udivcc	%g2,	0x13C2,	%i4
	orcc	%g6,	0x1A82,	%l3
	movrgez	%i6,	0x0FF,	%i1
	and	%l6,	0x0C24,	%l2
	edge16n	%g5,	%g4,	%g1
	fmovrsne	%i2,	%f23,	%f10
	stw	%o0,	[%l7 + 0x6C]
	movle	%icc,	%l0,	%l5
	ldx	[%l7 + 0x10],	%o7
	setx loop_39, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_39: 	fcmpne16	%f2,	%f8,	%i3
	move	%xcc,	%g3,	%o5
	sub	%i7,	%o4,	%l1
	sll	%i0,	0x10,	%o3
	fmovrsgez	%l4,	%f4,	%f25
	fcmpgt16	%f6,	%f14,	%o1
	alignaddrl	%g7,	%g2,	%o6
	move	%icc,	%g6,	%l3
	std	%f24,	[%l7 + 0x78]
	stb	%i6,	[%l7 + 0x7F]
	fxor	%f4,	%f24,	%f20
	umulcc	%i4,	%l6,	%l2
	fmovrdgz	%i1,	%f28,	%f16
	ldub	[%l7 + 0x39],	%g4
	movne	%icc,	%g1,	%g5
	edge32l	%i2,	%o0,	%l5
	movg	%xcc,	%o7,	%l0
	movneg	%icc,	%i5,	%i3
	fand	%f28,	%f30,	%f8
	sll	%g3,	0x08,	%o2
	alignaddrl	%o5,	%o4,	%i7
	save %i0, %l1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	restore %l4, 0x18F1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8	%g7,	%o6,	%g6
	sub	%g2,	0x020E,	%l3
	subcc	%i4,	0x1A67,	%l6
	fmovsl	%icc,	%f4,	%f30
	andn	%l2,	%i1,	%g4
	fcmpeq32	%f6,	%f26,	%g1
	add	%g5,	%i6,	%o0
	xor	%l5,	%o7,	%l0
	edge32ln	%i2,	%i3,	%g3
	fzero	%f8
	fzeros	%f30
	mulscc	%o2,	0x0F14,	%o5
	movvs	%xcc,	%i5,	%o4
	movcs	%icc,	%i0,	%l1
	stb	%i7,	[%l7 + 0x3B]
	sll	%l4,	%o1,	%o3
	mulscc	%o6,	0x1D4A,	%g7
	mulx	%g6,	0x126E,	%l3
	fmovrsgz	%i4,	%f15,	%f4
	movleu	%icc,	%l6,	%l2
	sll	%i1,	0x12,	%g4
	movle	%icc,	%g1,	%g2
	fpack32	%f12,	%f4,	%f10
	st	%f21,	[%l7 + 0x7C]
	and	%g5,	%i6,	%o0
	edge16n	%o7,	%l5,	%l0
	srl	%i2,	%g3,	%o2
	or	%i3,	0x07D0,	%o5
	fzero	%f22
	ldd	[%l7 + 0x08],	%f24
	fmovrslez	%i5,	%f10,	%f29
	movge	%xcc,	%i0,	%o4
	xnor	%i7,	%l1,	%l4
	std	%f16,	[%l7 + 0x78]
	edge32l	%o3,	%o1,	%g7
	fcmped	%fcc3,	%f28,	%f20
	mova	%xcc,	%o6,	%g6
	orncc	%l3,	%i4,	%l6
	st	%f29,	[%l7 + 0x14]
	andn	%i1,	0x0ECA,	%l2
	movrlz	%g1,	%g4,	%g2
	edge32ln	%g5,	%i6,	%o0
	movne	%icc,	%o7,	%l0
	movleu	%icc,	%l5,	%g3
	movle	%icc,	%o2,	%i2
	movneg	%xcc,	%i3,	%i5
	edge32ln	%o5,	%i0,	%i7
	xor	%o4,	0x1627,	%l1
	subccc	%o3,	0x0A71,	%o1
	setx loop_40, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_40: 	or	%g6,	0x0D5A,	%l3
	fcmple16	%f24,	%f8,	%i4
	movrgez	%l6,	0x3D3,	%i1
	fpsub16s	%f18,	%f17,	%f19
	fone	%f12
	fcmpeq16	%f2,	%f12,	%l2
	fmovsvc	%icc,	%f12,	%f17
	movneg	%xcc,	%g1,	%g7
	restore %g4, 0x1470, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrne	%g5,	0x313,	%i6
	ldd	[%l7 + 0x50],	%f28
	addccc	%o0,	0x033A,	%l0
	array16	%o7,	%l5,	%g3
	addccc	%i2,	%i3,	%o2
	orncc	%i5,	0x072E,	%o5
	popc	%i0,	%i7
	umulcc	%l1,	0x1100,	%o3
	fmovrde	%o4,	%f12,	%f4
	fnands	%f3,	%f8,	%f29
	sub	%o1,	0x0508,	%o6
	fones	%f16
	fsrc2	%f18,	%f14
	xorcc	%g6,	0x1A44,	%l3
	or	%i4,	0x17F9,	%l6
	array32	%l4,	%l2,	%g1
	alignaddr	%i1,	%g4,	%g7
	fsrc1s	%f10,	%f15
	umul	%g5,	%g2,	%o0
	sth	%i6,	[%l7 + 0x4C]
	fandnot1s	%f27,	%f30,	%f11
	subcc	%l0,	%o7,	%l5
	andcc	%g3,	0x0DA5,	%i2
	sdiv	%i3,	0x1E70,	%i5
	andcc	%o5,	%i0,	%o2
	movrgez	%l1,	%o3,	%i7
	lduw	[%l7 + 0x58],	%o4
	save %o6, %g6, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldsb	[%l7 + 0x6C],	%o1
	add	%i4,	%l6,	%l4
	ldsh	[%l7 + 0x4E],	%g1
	movne	%xcc,	%l2,	%i1
	sethi	0x1BF6,	%g4
	movrgz	%g5,	0x224,	%g2
	sra	%g7,	0x0D,	%i6
	fmovdleu	%icc,	%f5,	%f14
	and	%o0,	0x1E56,	%l0
	addc	%l5,	%g3,	%i2
	fmul8x16al	%f24,	%f15,	%f16
	sllx	%i3,	%o7,	%i5
	movl	%icc,	%o5,	%o2
	movge	%icc,	%i0,	%l1
	sll	%o3,	%i7,	%o4
	movl	%icc,	%g6,	%l3
	nop
	set	0x16, %i0
	lduh	[%l7 + %i0],	%o6
	popc	0x1776,	%o1
	movgu	%icc,	%i4,	%l4
	movn	%icc,	%g1,	%l2
	fornot2s	%f5,	%f18,	%f19
	andn	%l6,	0x19A5,	%g4
	lduw	[%l7 + 0x34],	%i1
	mova	%icc,	%g5,	%g2
	movge	%icc,	%g7,	%i6
	array32	%l0,	%o0,	%g3
	stw	%i2,	[%l7 + 0x3C]
	movrne	%i3,	%o7,	%i5
	add	%l5,	%o2,	%o5
	fornot1	%f20,	%f14,	%f20
	mulscc	%l1,	0x15B5,	%i0
	xnor	%o3,	%o4,	%g6
	movg	%xcc,	%l3,	%i7
	stx	%o6,	[%l7 + 0x28]
	fnot1	%f4,	%f10
	addcc	%o1,	0x08BF,	%l4
	ldd	[%l7 + 0x20],	%g0
	movrlez	%l2,	%l6,	%g4
	faligndata	%f12,	%f0,	%f2
	edge32	%i4,	%g5,	%i1
	umulcc	%g2,	%g7,	%i6
	mulscc	%o0,	%g3,	%l0
	edge8l	%i3,	%o7,	%i5
	addcc	%l5,	0x1247,	%i2
	movg	%icc,	%o5,	%l1
	ld	[%l7 + 0x20],	%f31
	edge32ln	%o2,	%i0,	%o3
	umulcc	%o4,	%l3,	%g6
	ldx	[%l7 + 0x48],	%o6
	udivx	%i7,	0x13D0,	%o1
	subccc	%g1,	0x0548,	%l2
	sethi	0x1C50,	%l4
	fmovsvs	%icc,	%f23,	%f31
	fmovsn	%xcc,	%f2,	%f0
	movrlez	%g4,	%i4,	%l6
	ldx	[%l7 + 0x58],	%i1
	ldsh	[%l7 + 0x3A],	%g2
	subc	%g5,	%g7,	%o0
	movleu	%icc,	%g3,	%i6
	fmovscc	%xcc,	%f19,	%f5
	subc	%i3,	%l0,	%o7
	ldsb	[%l7 + 0x1B],	%l5
	srlx	%i2,	%i5,	%o5
	edge16l	%o2,	%l1,	%o3
	movge	%icc,	%i0,	%l3
	nop
	set	0x30, %g7
	std	%f12,	[%l7 + %g7]
	movg	%icc,	%g6,	%o6
	st	%f4,	[%l7 + 0x24]
	fmovrdlez	%i7,	%f14,	%f24
	movrne	%o1,	0x083,	%o4
	edge16ln	%l2,	%g1,	%g4
	sub	%l4,	0x1C54,	%i4
	udivx	%l6,	0x080E,	%i1
	lduh	[%l7 + 0x7C],	%g5
	movg	%icc,	%g7,	%o0
	mulx	%g2,	%i6,	%g3
	fcmped	%fcc0,	%f4,	%f24
	xorcc	%i3,	0x191C,	%l0
	move	%icc,	%l5,	%i2
	orncc	%i5,	%o5,	%o2
	movneg	%icc,	%l1,	%o7
	fmul8x16al	%f22,	%f30,	%f18
	ldsw	[%l7 + 0x34],	%o3
	fnor	%f4,	%f20,	%f30
	edge16n	%i0,	%l3,	%o6
	bshuffle	%f24,	%f18,	%f6
	std	%f30,	[%l7 + 0x08]
	std	%f6,	[%l7 + 0x70]
	addccc	%i7,	%g6,	%o4
	fmovrsgz	%l2,	%f29,	%f22
	fmovsne	%xcc,	%f21,	%f29
	alignaddr	%g1,	%g4,	%l4
	mova	%icc,	%i4,	%l6
	fmovdn	%icc,	%f16,	%f6
	lduh	[%l7 + 0x5E],	%o1
	movrgz	%g5,	0x1DA,	%g7
	fnand	%f30,	%f10,	%f0
	edge8	%i1,	%g2,	%o0
	fmovdcc	%icc,	%f2,	%f22
	movcs	%icc,	%g3,	%i6
	lduw	[%l7 + 0x3C],	%i3
	movneg	%icc,	%l0,	%l5
	udivcc	%i2,	0x01F3,	%o5
	nop
	set	0x70, %g1
	lduw	[%l7 + %g1],	%o2
	movleu	%icc,	%l1,	%i5
	ldub	[%l7 + 0x76],	%o7
	srlx	%i0,	%l3,	%o6
	fmovrsgz	%o3,	%f22,	%f9
	move	%icc,	%g6,	%i7
	fxor	%f12,	%f4,	%f2
	ldd	[%l7 + 0x28],	%l2
	st	%f1,	[%l7 + 0x18]
	fmovsa	%icc,	%f7,	%f3
	andcc	%g1,	%o4,	%l4
	xor	%g4,	%l6,	%i4
	ldx	[%l7 + 0x18],	%g5
	fnot1	%f24,	%f16
	fandnot2	%f24,	%f4,	%f12
	move	%xcc,	%g7,	%i1
	alignaddrl	%g2,	%o1,	%o0
	ld	[%l7 + 0x60],	%f5
	fsrc1s	%f29,	%f24
	sll	%g3,	0x02,	%i6
	edge8ln	%l0,	%i3,	%l5
	andncc	%i2,	%o2,	%l1
	movvs	%icc,	%o5,	%o7
	fandnot2	%f4,	%f26,	%f22
	xor	%i5,	%l3,	%o6
	srlx	%o3,	%i0,	%g6
	orncc	%i7,	%g1,	%l2
	ldd	[%l7 + 0x58],	%f26
	fmovscs	%xcc,	%f3,	%f21
	ldd	[%l7 + 0x68],	%f30
	sra	%o4,	%g4,	%l6
	xor	%i4,	%g5,	%l4
	ldsb	[%l7 + 0x24],	%g7
	movvs	%icc,	%i1,	%g2
	movrgz	%o0,	0x311,	%g3
	edge16n	%o1,	%l0,	%i3
	sub	%l5,	%i2,	%o2
	addccc	%l1,	%o5,	%o7
	movleu	%icc,	%i6,	%l3
	ldub	[%l7 + 0x5E],	%o6
	sllx	%i5,	0x0C,	%i0
	fcmpd	%fcc1,	%f24,	%f24
	movrne	%g6,	%o3,	%g1
	edge8n	%l2,	%i7,	%g4
	fpadd16s	%f22,	%f14,	%f5
	srlx	%o4,	0x16,	%i4
	fnot2s	%f17,	%f9
	fmovspos	%icc,	%f4,	%f1
	srl	%g5,	0x07,	%l6
	movn	%xcc,	%l4,	%g7
	fmovrde	%i1,	%f4,	%f22
	andn	%o0,	%g3,	%o1
	array32	%g2,	%l0,	%l5
	st	%f28,	[%l7 + 0x6C]
	xnor	%i3,	0x0BFA,	%i2
	fpack16	%f0,	%f14
	edge16	%o2,	%l1,	%o7
	array16	%o5,	%l3,	%o6
	fmovdcc	%icc,	%f3,	%f7
	srax	%i5,	0x16,	%i6
	subc	%g6,	0x0171,	%o3
	fnegd	%f16,	%f14
	ldd	[%l7 + 0x58],	%f0
	fcmple16	%f6,	%f22,	%g1
	ldd	[%l7 + 0x20],	%i0
	xor	%l2,	%i7,	%g4
	udivx	%o4,	0x007A,	%i4
	ldub	[%l7 + 0x5C],	%g5
	edge16ln	%l4,	%g7,	%l6
	edge32n	%i1,	%g3,	%o0
	orn	%g2,	0x018E,	%l0
	fornot2s	%f28,	%f28,	%f22
	ldsw	[%l7 + 0x70],	%l5
	fand	%f0,	%f14,	%f14
	sra	%o1,	0x13,	%i3
	edge8ln	%o2,	%i2,	%l1
	edge32ln	%o7,	%o5,	%o6
	edge32	%i5,	%i6,	%l3
	movrgz	%g6,	0x0E8,	%o3
	add	%i0,	0x12C9,	%l2
	fmovd	%f24,	%f30
	movpos	%xcc,	%g1,	%i7
	siam	0x2
	ldub	[%l7 + 0x33],	%o4
	edge16l	%g4,	%g5,	%l4
	edge32ln	%g7,	%l6,	%i4
	movneg	%xcc,	%g3,	%i1
	lduh	[%l7 + 0x52],	%g2
	edge16	%l0,	%l5,	%o1
	fabss	%f13,	%f0
	fmovsge	%xcc,	%f26,	%f28
	movge	%xcc,	%o0,	%i3
	movne	%xcc,	%i2,	%o2
	movvs	%icc,	%o7,	%l1
	fmovrse	%o5,	%f22,	%f18
	edge32ln	%o6,	%i5,	%l3
	fmovdne	%icc,	%f5,	%f25
	sub	%i6,	0x0F63,	%g6
	nop
	set	0x2C, %i2
	stb	%o3,	[%l7 + %i2]
	fmuld8ulx16	%f31,	%f19,	%f0
	save %i0, %l2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x0A],	%o4
	fmovda	%icc,	%f21,	%f20
	movrlez	%g4,	%g5,	%l4
	addccc	%i7,	0x1A02,	%l6
	sdivx	%i4,	0x1F10,	%g7
	fmovs	%f28,	%f18
	movle	%icc,	%g3,	%g2
	popc	%i1,	%l0
	array32	%o1,	%o0,	%l5
	movrgez	%i3,	%i2,	%o7
	fmul8sux16	%f14,	%f8,	%f28
	fmovsvc	%xcc,	%f24,	%f13
	andncc	%l1,	%o5,	%o2
	array8	%i5,	%l3,	%i6
	mulx	%g6,	0x1033,	%o3
	fornot1	%f30,	%f26,	%f16
	movg	%xcc,	%i0,	%l2
	andncc	%g1,	%o6,	%o4
	xorcc	%g4,	%g5,	%l4
	orn	%i7,	0x0EF4,	%i4
	andn	%l6,	0x059A,	%g7
	sdivx	%g3,	0x1C1B,	%i1
	orn	%g2,	%o1,	%o0
	movrgz	%l0,	0x37C,	%i3
	ldsb	[%l7 + 0x51],	%i2
	movrlz	%l5,	%o7,	%o5
	subccc	%l1,	%i5,	%o2
	sra	%i6,	%l3,	%g6
	movl	%xcc,	%i0,	%l2
	movcs	%icc,	%o3,	%o6
	orn	%o4,	0x0FAF,	%g1
	fmovscc	%icc,	%f6,	%f17
	srl	%g5,	%g4,	%l4
	sra	%i4,	0x02,	%l6
	edge8l	%i7,	%g7,	%g3
	nop
	set	0x10, %o4
	ldsw	[%l7 + %o4],	%i1
	srax	%g2,	%o0,	%o1
	xorcc	%i3,	%i2,	%l0
	sdiv	%o7,	0x06F3,	%o5
	for	%f26,	%f4,	%f26
	movrne	%l5,	%l1,	%o2
	mulscc	%i6,	0x1883,	%l3
	xor	%i5,	%g6,	%i0
	udivx	%l2,	0x170E,	%o6
	srl	%o4,	0x18,	%o3
	fmovdpos	%icc,	%f27,	%f28
	sethi	0x19E2,	%g1
	sra	%g4,	0x1C,	%g5
	movg	%icc,	%i4,	%l4
	fnot2s	%f27,	%f13
	edge32l	%l6,	%i7,	%g7
	ldsh	[%l7 + 0x5C],	%g3
	array16	%i1,	%g2,	%o1
	edge16ln	%o0,	%i3,	%l0
	fand	%f8,	%f30,	%f6
	sdivx	%i2,	0x1BA2,	%o5
	fmovsgu	%icc,	%f15,	%f28
	xnor	%o7,	%l5,	%o2
	alignaddr	%l1,	%i6,	%l3
	fmovrse	%i5,	%f6,	%f29
	ldub	[%l7 + 0x33],	%i0
	edge16ln	%l2,	%o6,	%g6
	xorcc	%o3,	%o4,	%g4
	fmul8x16au	%f6,	%f11,	%f24
	andcc	%g1,	%i4,	%l4
	lduh	[%l7 + 0x26],	%g5
	array32	%i7,	%l6,	%g7
	movcc	%xcc,	%g3,	%g2
	movvc	%xcc,	%o1,	%i1
	addccc	%o0,	0x1CF2,	%i3
	or	%i2,	0x01A4,	%l0
	lduh	[%l7 + 0x10],	%o7
	fandnot1	%f2,	%f20,	%f6
	array8	%o5,	%l5,	%o2
	edge8ln	%l1,	%i6,	%l3
	movneg	%xcc,	%i0,	%l2
	srl	%i5,	%o6,	%o3
	fmovsleu	%icc,	%f16,	%f27
	sra	%o4,	0x13,	%g4
	fpsub32s	%f28,	%f24,	%f13
	add	%g6,	%i4,	%g1
	fandnot2	%f16,	%f12,	%f8
	mova	%xcc,	%l4,	%i7
	xnor	%l6,	0x0FD2,	%g7
	for	%f14,	%f22,	%f24
	fxors	%f7,	%f27,	%f29
	stw	%g3,	[%l7 + 0x68]
	mulscc	%g5,	%g2,	%i1
	orcc	%o1,	0x0814,	%i3
	st	%f4,	[%l7 + 0x10]
	save %o0, %i2, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fand	%f24,	%f12,	%f4
	edge8ln	%o5,	%l5,	%o2
	edge16n	%l1,	%o7,	%l3
	fmul8ulx16	%f2,	%f26,	%f18
	fpmerge	%f27,	%f9,	%f0
	mulx	%i0,	0x0E6D,	%i6
	ldx	[%l7 + 0x50],	%i5
	orcc	%o6,	0x16B0,	%o3
	fabsd	%f8,	%f28
	mulscc	%l2,	0x1C1A,	%g4
	movcs	%icc,	%g6,	%o4
	nop
	set	0x4B, %l6
	ldub	[%l7 + %l6],	%i4
	ldsb	[%l7 + 0x77],	%l4
	movvc	%icc,	%g1,	%l6
	movne	%icc,	%g7,	%g3
	movrne	%g5,	0x376,	%i7
	fmovsne	%xcc,	%f16,	%f11
	fmovrde	%g2,	%f24,	%f14
	fpadd16	%f14,	%f30,	%f4
	fmovsleu	%icc,	%f19,	%f31
	srl	%o1,	0x1D,	%i3
	fmovsneg	%icc,	%f13,	%f28
	setx loop_41, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_41: 	xnorcc	%o0,	0x0D6F,	%o5
	fmovrdlz	%o2,	%f0,	%f18
	andncc	%l5,	%o7,	%l1
	lduw	[%l7 + 0x6C],	%l3
	subc	%i0,	%i6,	%i5
	ldd	[%l7 + 0x18],	%f4
	udivx	%o3,	0x08CA,	%o6
	movg	%icc,	%g4,	%l2
	fmovdpos	%xcc,	%f13,	%f12
	mova	%xcc,	%o4,	%i4
	fmovrslez	%l4,	%f27,	%f22
	fmul8x16	%f29,	%f16,	%f26
	edge32n	%g6,	%g1,	%g7
	stw	%l6,	[%l7 + 0x18]
	edge8ln	%g3,	%i7,	%g5
	orncc	%g2,	0x1B3E,	%i3
	sub	%i1,	0x1838,	%o1
	popc	0x0C32,	%l0
	fabsd	%f18,	%f26
	mulx	%i2,	0x1FFF,	%o5
	edge8n	%o0,	%l5,	%o2
	stw	%o7,	[%l7 + 0x3C]
	movrlez	%l1,	%l3,	%i0
	ldsb	[%l7 + 0x3A],	%i5
	fmovrslez	%i6,	%f18,	%f12
	movne	%xcc,	%o3,	%g4
	ldub	[%l7 + 0x6B],	%o6
	fmovrslz	%l2,	%f26,	%f3
	movcs	%xcc,	%i4,	%l4
	sub	%o4,	0x1A2E,	%g1
	umul	%g7,	0x0D93,	%l6
	fmovdn	%icc,	%f28,	%f30
	fmovda	%xcc,	%f7,	%f17
	stx	%g3,	[%l7 + 0x78]
	xnorcc	%g6,	%i7,	%g5
	xnorcc	%g2,	%i1,	%o1
	subcc	%i3,	0x1844,	%l0
	fmovdle	%xcc,	%f12,	%f31
	stx	%o5,	[%l7 + 0x40]
	fxors	%f0,	%f9,	%f2
	fsrc2	%f14,	%f22
	movrgz	%i2,	0x01D,	%o0
	fornot2	%f26,	%f6,	%f26
	array16	%l5,	%o7,	%o2
	orcc	%l3,	0x1B83,	%i0
	fexpand	%f28,	%f0
	ldx	[%l7 + 0x60],	%i5
	fmovrde	%i6,	%f26,	%f2
	edge32ln	%o3,	%l1,	%g4
	edge8ln	%l2,	%i4,	%o6
	array16	%o4,	%l4,	%g7
	smul	%l6,	0x0F00,	%g1
	fmovsg	%icc,	%f5,	%f4
	udivx	%g6,	0x05C8,	%i7
	ldsh	[%l7 + 0x12],	%g5
	umulcc	%g3,	%i1,	%o1
	addc	%g2,	%i3,	%l0
	alignaddrl	%o5,	%i2,	%o0
	fmovrse	%o7,	%f31,	%f0
	fmovsl	%xcc,	%f25,	%f28
	movn	%icc,	%l5,	%o2
	ldd	[%l7 + 0x60],	%l2
	edge16l	%i5,	%i0,	%o3
	xorcc	%i6,	0x1DD7,	%l1
	move	%icc,	%g4,	%i4
	movrne	%l2,	0x32A,	%o4
	edge8ln	%l4,	%o6,	%g7
	fmovsvs	%xcc,	%f5,	%f1
	subccc	%l6,	0x1AB5,	%g1
	movgu	%icc,	%g6,	%g5
	lduh	[%l7 + 0x48],	%i7
	mulscc	%g3,	0x0059,	%o1
	ldx	[%l7 + 0x78],	%i1
	orcc	%i3,	%l0,	%g2
	sdivx	%i2,	0x12A2,	%o5
	movn	%xcc,	%o0,	%o7
	movrgez	%l5,	0x26C,	%l3
	ldsb	[%l7 + 0x2E],	%o2
	srax	%i0,	%i5,	%i6
	sir	0x0BA6
	udivcc	%o3,	0x015A,	%g4
	ldsh	[%l7 + 0x7E],	%i4
	std	%f2,	[%l7 + 0x50]
	sllx	%l1,	0x1C,	%l2
	fmul8ulx16	%f12,	%f18,	%f0
	udivcc	%l4,	0x067B,	%o6
	movleu	%icc,	%g7,	%o4
	add	%g1,	0x1490,	%l6
	fmul8ulx16	%f30,	%f20,	%f18
	fmovdneg	%xcc,	%f9,	%f5
	mulx	%g5,	%i7,	%g6
	movneg	%icc,	%g3,	%o1
	sll	%i1,	0x0A,	%i3
	orncc	%g2,	0x01C3,	%i2
	edge8	%o5,	%o0,	%l0
	movle	%icc,	%l5,	%l3
	sdivcc	%o7,	0x0B92,	%i0
	fmul8x16au	%f31,	%f28,	%f24
	lduw	[%l7 + 0x1C],	%o2
	fmuld8ulx16	%f16,	%f12,	%f28
	bshuffle	%f10,	%f14,	%f10
	ldx	[%l7 + 0x78],	%i5
	edge8	%i6,	%o3,	%i4
	std	%f6,	[%l7 + 0x58]
	edge8	%l1,	%l2,	%g4
	srlx	%l4,	0x14,	%o6
	fpackfix	%f18,	%f25
	fmul8x16au	%f13,	%f6,	%f22
	subcc	%g7,	0x1111,	%o4
	andncc	%g1,	%l6,	%g5
	edge8l	%i7,	%g6,	%g3
	st	%f3,	[%l7 + 0x38]
	save %i1, %i3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i2,	%o5
	movne	%icc,	%o0,	%l0
	lduh	[%l7 + 0x70],	%l5
	movcc	%xcc,	%o1,	%o7
	fmovrsgz	%l3,	%f31,	%f24
	movrgez	%o2,	0x12C,	%i5
	ldub	[%l7 + 0x5F],	%i0
	add	%i6,	0x0D19,	%o3
	edge16	%i4,	%l1,	%g4
	movg	%icc,	%l2,	%o6
	movcs	%xcc,	%l4,	%g7
	alignaddrl	%g1,	%o4,	%l6
	fmovsl	%icc,	%f5,	%f15
	ldsh	[%l7 + 0x54],	%g5
	ldd	[%l7 + 0x30],	%i6
	edge8ln	%g6,	%g3,	%i3
	smul	%i1,	0x0D64,	%i2
	srax	%g2,	0x0E,	%o5
	fpmerge	%f25,	%f7,	%f12
	subcc	%l0,	%l5,	%o0
	umul	%o7,	0x0F92,	%l3
	udivcc	%o1,	0x02AD,	%i5
	xnorcc	%o2,	%i0,	%o3
	orncc	%i6,	0x066E,	%i4
	fmovsne	%icc,	%f31,	%f23
	udivcc	%g4,	0x0DB6,	%l2
	movrlz	%l1,	%l4,	%g7
	lduh	[%l7 + 0x3E],	%g1
	srlx	%o6,	%o4,	%g5
	sdiv	%i7,	0x049F,	%l6
	movg	%icc,	%g6,	%g3
	array16	%i3,	%i2,	%i1
	xorcc	%g2,	%o5,	%l5
	movrgz	%l0,	%o7,	%o0
	ldsw	[%l7 + 0x54],	%l3
	alignaddr	%i5,	%o1,	%i0
	smulcc	%o2,	0x13E6,	%o3
	fsrc1	%f26,	%f28
	orcc	%i4,	0x0C4E,	%i6
	andncc	%g4,	%l1,	%l4
	ldd	[%l7 + 0x50],	%f0
	ldsb	[%l7 + 0x5D],	%l2
	fnegd	%f28,	%f12
	movcc	%icc,	%g1,	%o6
	fpadd32	%f0,	%f6,	%f26
	fandnot1s	%f10,	%f30,	%f9
	fmovscs	%icc,	%f29,	%f22
	udiv	%o4,	0x017C,	%g7
	lduh	[%l7 + 0x5A],	%i7
	movcs	%xcc,	%g5,	%g6
	ldd	[%l7 + 0x20],	%f0
	lduh	[%l7 + 0x36],	%g3
	sir	0x1157
	movleu	%icc,	%i3,	%i2
	smul	%i1,	%l6,	%g2
	subccc	%o5,	%l5,	%o7
	subcc	%o0,	0x0D82,	%l3
	ldx	[%l7 + 0x40],	%i5
	edge8l	%o1,	%i0,	%o2
	std	%f12,	[%l7 + 0x18]
	alignaddrl	%o3,	%i4,	%i6
	restore %g4, 0x05CC, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addcc	%l1,	0x09D2,	%l2
	ldx	[%l7 + 0x30],	%g1
	movge	%icc,	%l4,	%o6
	xorcc	%o4,	0x1F67,	%g7
	edge16l	%i7,	%g5,	%g3
	array8	%g6,	%i3,	%i2
	xnorcc	%l6,	%g2,	%o5
	movge	%xcc,	%l5,	%o7
	movcc	%xcc,	%i1,	%l3
	xnorcc	%i5,	%o1,	%i0
	nop
	set	0x38, %o0
	std	%f6,	[%l7 + %o0]
	srax	%o2,	%o3,	%o0
	fornot1s	%f29,	%f6,	%f16
	andn	%i4,	%i6,	%l0
	movvc	%icc,	%l1,	%l2
	movrne	%g1,	0x3DD,	%l4
	or	%g4,	%o6,	%o4
	sth	%i7,	[%l7 + 0x54]
	sth	%g7,	[%l7 + 0x4C]
	srl	%g3,	%g5,	%g6
	udivcc	%i2,	0x135B,	%l6
	edge16	%g2,	%i3,	%l5
	fabsd	%f6,	%f26
	movrgz	%o7,	%i1,	%o5
	save %i5, %o1, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f24,	%f4,	%f30
	subc	%i0,	%o2,	%o0
	sdivx	%o3,	0x0A0B,	%i4
	smulcc	%i6,	%l1,	%l2
	fcmped	%fcc0,	%f4,	%f0
	nop
	set	0x7C, %l4
	ldsw	[%l7 + %l4],	%g1
	movpos	%icc,	%l0,	%l4
	std	%f12,	[%l7 + 0x58]
	st	%f26,	[%l7 + 0x30]
	xnorcc	%g4,	%o4,	%i7
	fones	%f5
	fmovdge	%xcc,	%f30,	%f10
	ldsb	[%l7 + 0x7B],	%o6
	addc	%g3,	%g5,	%g7
	fpadd16	%f14,	%f26,	%f24
	fpsub16	%f18,	%f10,	%f26
	movrne	%g6,	%l6,	%g2
	nop
	set	0x3C, %g3
	stb	%i3,	[%l7 + %g3]
	movge	%icc,	%i2,	%o7
	movrlz	%l5,	0x0DD,	%o5
	mova	%icc,	%i1,	%o1
	fandnot1s	%f0,	%f23,	%f22
	fsrc2	%f28,	%f6
	setx loop_42, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_42: 	std	%f22,	[%l7 + 0x08]
	xorcc	%o0,	%o3,	%l3
	fmovrsne	%i4,	%f3,	%f2
	mova	%xcc,	%l1,	%i6
	movcc	%xcc,	%l2,	%g1
	andncc	%l0,	%g4,	%o4
	movrne	%l4,	0x0ED,	%i7
	edge32	%o6,	%g3,	%g7
	subcc	%g5,	0x1707,	%g6
	fxors	%f12,	%f7,	%f24
	stw	%l6,	[%l7 + 0x58]
	fpmerge	%f11,	%f4,	%f10
	ld	[%l7 + 0x08],	%f26
	sdiv	%g2,	0x0870,	%i2
	fcmpes	%fcc2,	%f21,	%f29
	pdist	%f8,	%f18,	%f28
	fmovrde	%i3,	%f4,	%f22
	movvs	%xcc,	%o7,	%l5
	fmovrdgez	%i1,	%f8,	%f24
	movpos	%icc,	%o1,	%o5
	array32	%i0,	%o2,	%o0
	and	%i5,	0x0462,	%o3
	ldsb	[%l7 + 0x46],	%l3
	mulx	%l1,	0x0AAB,	%i4
	restore %l2, %i6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsne	%xcc,	%f7,	%f19
	andcc	%g4,	0x1CAB,	%l0
	xorcc	%l4,	0x0D91,	%o4
	edge16	%o6,	%g3,	%i7
	fcmpeq32	%f8,	%f10,	%g7
	orncc	%g5,	0x03CE,	%g6
	fmovdpos	%icc,	%f29,	%f6
	fmovrsgez	%g2,	%f14,	%f26
	fmovrsgz	%l6,	%f16,	%f9
	ldsh	[%l7 + 0x7A],	%i3
	edge32l	%i2,	%o7,	%l5
	fmovdpos	%xcc,	%f4,	%f5
	popc	%o1,	%o5
	movvs	%xcc,	%i1,	%o2
	srlx	%o0,	%i0,	%o3
	smulcc	%i5,	0x1117,	%l3
	fmovdneg	%icc,	%f24,	%f3
	sethi	0x04E7,	%l1
	edge8ln	%l2,	%i4,	%g1
	fmovsneg	%xcc,	%f11,	%f11
	movcc	%icc,	%i6,	%l0
	fmul8x16al	%f27,	%f23,	%f0
	array32	%g4,	%o4,	%o6
	sra	%g3,	%i7,	%g7
	add	%g5,	0x15F8,	%g6
	sdiv	%g2,	0x0277,	%l6
	fxnor	%f18,	%f24,	%f12
	movleu	%icc,	%l4,	%i2
	ldsb	[%l7 + 0x0A],	%i3
	movneg	%xcc,	%l5,	%o1
	movcc	%icc,	%o7,	%i1
	or	%o5,	%o0,	%i0
	movpos	%xcc,	%o2,	%i5
	sdivcc	%l3,	0x15EE,	%l1
	array8	%o3,	%i4,	%l2
	fpadd32	%f30,	%f16,	%f0
	addc	%i6,	%l0,	%g4
	udivcc	%g1,	0x1422,	%o4
	xor	%o6,	%g3,	%g7
	ldsb	[%l7 + 0x20],	%i7
	movg	%icc,	%g6,	%g5
	ldsh	[%l7 + 0x0C],	%l6
	ldd	[%l7 + 0x08],	%g2
	movge	%icc,	%l4,	%i3
	movge	%xcc,	%l5,	%o1
	ldub	[%l7 + 0x7D],	%o7
	smulcc	%i2,	%i1,	%o0
	stb	%o5,	[%l7 + 0x66]
	stx	%i0,	[%l7 + 0x78]
	xorcc	%i5,	%l3,	%l1
	ldsb	[%l7 + 0x3C],	%o2
	ld	[%l7 + 0x14],	%f26
	mulx	%o3,	%l2,	%i6
	siam	0x0
	mulx	%i4,	0x0BF4,	%g4
	smul	%g1,	%l0,	%o4
	edge16ln	%g3,	%o6,	%g7
	srlx	%g6,	0x17,	%i7
	sethi	0x0DCE,	%l6
	ldsw	[%l7 + 0x4C],	%g5
	sllx	%g2,	0x0B,	%i3
	fnot1s	%f2,	%f30
	fmovde	%xcc,	%f23,	%f30
	movrne	%l5,	%o1,	%o7
	movn	%xcc,	%l4,	%i1
	xnor	%i2,	0x122D,	%o0
	move	%xcc,	%i0,	%i5
	sdivcc	%o5,	0x1943,	%l1
	fxnors	%f31,	%f21,	%f20
	fnors	%f4,	%f18,	%f10
	alignaddr	%l3,	%o3,	%l2
	nop
	set	0x54, %l1
	sth	%o2,	[%l7 + %l1]
	sdivx	%i4,	0x1BB2,	%g4
	udivcc	%g1,	0x0937,	%l0
	std	%f30,	[%l7 + 0x60]
	udiv	%o4,	0x0FD2,	%g3
	movn	%icc,	%i6,	%g7
	sra	%o6,	0x1B,	%i7
	setx loop_43, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_43: 	andn	%g6,	0x06E1,	%i3
	smulcc	%l5,	0x17AC,	%g2
	array32	%o1,	%l4,	%o7
	movg	%icc,	%i1,	%o0
	movl	%icc,	%i0,	%i2
	addc	%i5,	0x1CAD,	%l1
	movrgez	%o5,	0x171,	%l3
	movvc	%icc,	%l2,	%o2
	addccc	%o3,	0x11EE,	%i4
	subcc	%g1,	%l0,	%g4
	movrgez	%g3,	0x194,	%o4
	umulcc	%i6,	0x09D1,	%o6
	array32	%g7,	%i7,	%l6
	movrlez	%g6,	%i3,	%l5
	fornot1	%f20,	%f4,	%f22
	nop
	set	0x5D, %i5
	stb	%g2,	[%l7 + %i5]
	sub	%g5,	0x0A54,	%o1
	move	%xcc,	%o7,	%i1
	edge32n	%l4,	%i0,	%i2
	nop
	set	0x5C, %i7
	ldsw	[%l7 + %i7],	%i5
	fmovdn	%icc,	%f17,	%f10
	srl	%o0,	0x15,	%o5
	sub	%l1,	0x0AEC,	%l2
	movne	%xcc,	%l3,	%o3
	fmul8sux16	%f18,	%f30,	%f4
	fnegs	%f8,	%f27
	edge16	%i4,	%g1,	%l0
	umulcc	%o2,	%g4,	%g3
	movrgz	%i6,	%o4,	%o6
	umul	%i7,	%l6,	%g7
	stw	%i3,	[%l7 + 0x64]
	fmovs	%f22,	%f8
	ldub	[%l7 + 0x43],	%l5
	fmovsn	%xcc,	%f15,	%f6
	xor	%g6,	0x1A1C,	%g5
	xorcc	%o1,	0x019C,	%g2
	fnot1s	%f30,	%f30
	movcs	%icc,	%i1,	%l4
	udivcc	%o7,	0x0941,	%i2
	xorcc	%i0,	0x001F,	%o0
	edge16l	%i5,	%l1,	%l2
	udivcc	%o5,	0x1ECA,	%o3
	movre	%i4,	%g1,	%l3
	movcc	%xcc,	%o2,	%g4
	udivcc	%l0,	0x02B9,	%i6
	ldd	[%l7 + 0x30],	%o4
	add	%g3,	%o6,	%i7
	movn	%xcc,	%g7,	%l6
	movge	%icc,	%l5,	%g6
	addcc	%g5,	0x1FA9,	%i3
	movg	%icc,	%g2,	%o1
	movvs	%icc,	%i1,	%o7
	srax	%i2,	0x18,	%l4
	udivcc	%o0,	0x154C,	%i5
	ldsh	[%l7 + 0x74],	%i0
	movrne	%l2,	0x2DA,	%o5
	fxnor	%f12,	%f24,	%f6
	fzero	%f12
	edge32ln	%o3,	%l1,	%i4
	mova	%icc,	%g1,	%l3
	edge8ln	%g4,	%o2,	%l0
	alignaddrl	%o4,	%g3,	%o6
	fmovrsgz	%i7,	%f18,	%f28
	st	%f26,	[%l7 + 0x30]
	ldsh	[%l7 + 0x44],	%g7
	edge16ln	%l6,	%l5,	%i6
	and	%g6,	%g5,	%g2
	sdiv	%i3,	0x0F09,	%o1
	sdivcc	%o7,	0x105B,	%i2
	sdiv	%l4,	0x1D22,	%o0
	movre	%i5,	0x14A,	%i0
	array8	%i1,	%o5,	%l2
	fzeros	%f5
	umulcc	%o3,	0x03B1,	%l1
	movre	%g1,	%l3,	%i4
	sra	%o2,	%g4,	%o4
	movle	%icc,	%g3,	%o6
	srlx	%i7,	%g7,	%l6
	sll	%l0,	0x02,	%l5
	sdiv	%g6,	0x0FD4,	%i6
	and	%g2,	0x0618,	%i3
	movle	%icc,	%o1,	%o7
	edge8l	%i2,	%l4,	%o0
	addc	%g5,	0x01E6,	%i5
	fmul8x16au	%f21,	%f16,	%f22
	edge8n	%i1,	%i0,	%l2
	fpadd16	%f0,	%f28,	%f6
	ld	[%l7 + 0x14],	%f21
	orncc	%o3,	%o5,	%g1
	fpsub16s	%f26,	%f10,	%f28
	movrgez	%l3,	0x269,	%i4
	edge32n	%l1,	%o2,	%g4
	andcc	%g3,	%o6,	%i7
	srl	%o4,	0x1C,	%l6
	mova	%icc,	%l0,	%g7
	st	%f3,	[%l7 + 0x28]
	nop
	set	0x37, %i3
	stb	%l5,	[%l7 + %i3]
	save %g6, 0x1EFC, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i3,	%o1
	ldsw	[%l7 + 0x58],	%o7
	fabsd	%f16,	%f10
	umul	%i6,	0x0899,	%l4
	movrlez	%i2,	0x133,	%g5
	std	%f0,	[%l7 + 0x40]
	movleu	%xcc,	%o0,	%i5
	fmovdneg	%xcc,	%f0,	%f19
	andncc	%i1,	%l2,	%i0
	fmovsleu	%icc,	%f10,	%f3
	movre	%o5,	%g1,	%l3
	ldx	[%l7 + 0x18],	%i4
	movneg	%xcc,	%l1,	%o3
	sir	0x1456
	srax	%o2,	%g3,	%g4
	pdist	%f2,	%f18,	%f12
	fmovdge	%icc,	%f29,	%f21
	fnands	%f6,	%f0,	%f25
	pdist	%f0,	%f20,	%f6
	srlx	%i7,	%o4,	%l6
	fcmpeq16	%f26,	%f0,	%o6
	orn	%l0,	%l5,	%g6
	edge16ln	%g2,	%g7,	%i3
	sll	%o1,	0x07,	%o7
	add	%i6,	%i2,	%l4
	movl	%icc,	%g5,	%o0
	edge8	%i1,	%i5,	%l2
	orcc	%i0,	0x1507,	%g1
	ldsb	[%l7 + 0x0B],	%o5
	ldsw	[%l7 + 0x08],	%i4
	sethi	0x0018,	%l1
	sub	%o3,	0x116D,	%o2
	fmovrdlez	%l3,	%f6,	%f6
	movle	%xcc,	%g4,	%g3
	fnand	%f18,	%f16,	%f28
	edge16ln	%o4,	%l6,	%o6
	sub	%i7,	0x1ACD,	%l0
	stx	%g6,	[%l7 + 0x68]
	move	%icc,	%l5,	%g7
	fmovspos	%icc,	%f21,	%f22
	addccc	%g2,	%i3,	%o1
	ldx	[%l7 + 0x20],	%o7
	ldsb	[%l7 + 0x78],	%i6
	edge16n	%l4,	%i2,	%g5
	sdivcc	%i1,	0x156C,	%o0
	fcmpeq32	%f24,	%f24,	%l2
	alignaddr	%i5,	%i0,	%o5
	sdivx	%i4,	0x1AD8,	%g1
	udivx	%o3,	0x1A56,	%l1
	umulcc	%l3,	%o2,	%g4
	smulcc	%o4,	0x1D59,	%g3
	fabss	%f7,	%f24
	movcs	%icc,	%l6,	%o6
	ld	[%l7 + 0x4C],	%f5
	xnor	%l0,	0x0B80,	%i7
	movneg	%icc,	%g6,	%g7
	srlx	%l5,	0x14,	%g2
	movge	%icc,	%o1,	%i3
	sdivx	%o7,	0x1DEC,	%i6
	fmovdn	%icc,	%f2,	%f5
	edge16ln	%i2,	%g5,	%l4
	stb	%o0,	[%l7 + 0x09]
	edge16	%l2,	%i5,	%i1
	edge32ln	%o5,	%i0,	%g1
	array8	%o3,	%i4,	%l3
	movneg	%xcc,	%o2,	%l1
	umulcc	%g4,	%o4,	%g3
	fmovsne	%xcc,	%f0,	%f5
	ldx	[%l7 + 0x28],	%l6
	popc	%o6,	%l0
	movvs	%xcc,	%g6,	%i7
	edge32l	%l5,	%g2,	%o1
	lduw	[%l7 + 0x08],	%g7
	umulcc	%i3,	0x0136,	%i6
	alignaddr	%o7,	%i2,	%l4
	fmovrde	%o0,	%f18,	%f12
	movrlez	%g5,	%l2,	%i5
	fmovsn	%xcc,	%f31,	%f17
	movrlez	%i1,	0x18E,	%o5
	movrgez	%i0,	0x20D,	%o3
	subcc	%g1,	0x1341,	%i4
	andn	%o2,	0x0FFF,	%l1
	movgu	%xcc,	%l3,	%g4
	addcc	%o4,	0x030D,	%l6
	edge32	%g3,	%o6,	%l0
	fands	%f27,	%f27,	%f9
	sllx	%g6,	0x1C,	%i7
	subccc	%l5,	%g2,	%o1
	sdivcc	%g7,	0x154B,	%i6
	movrne	%o7,	0x175,	%i2
	add	%i3,	%l4,	%g5
	bshuffle	%f0,	%f4,	%f18
	fnegs	%f14,	%f29
	fnand	%f20,	%f18,	%f28
	ldsb	[%l7 + 0x78],	%o0
	nop
	set	0x18, %g6
	ldub	[%l7 + %g6],	%i5
	srlx	%i1,	0x1A,	%o5
	orncc	%l2,	0x0E86,	%i0
	fnot2	%f20,	%f28
	smul	%o3,	%g1,	%i4
	fmovrdlz	%l1,	%f12,	%f8
	sll	%l3,	%o2,	%g4
	ldd	[%l7 + 0x30],	%i6
	fnot2	%f12,	%f6
	fmovda	%xcc,	%f24,	%f14
	movl	%xcc,	%o4,	%g3
	edge16	%o6,	%g6,	%i7
	udivcc	%l0,	0x0C14,	%l5
	array8	%g2,	%o1,	%i6
	xnorcc	%g7,	%o7,	%i3
	add	%i2,	%g5,	%l4
	nop
	set	0x32, %o7
	ldsb	[%l7 + %o7],	%i5
	restore %o0, 0x1282, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%o5,	0x273,	%l2
	sll	%i0,	0x0B,	%o3
	sllx	%i4,	0x05,	%l1
	sethi	0x05DA,	%l3
	ldx	[%l7 + 0x78],	%o2
	smul	%g4,	%g1,	%o4
	ldd	[%l7 + 0x18],	%f18
	movn	%icc,	%l6,	%g3
	ldd	[%l7 + 0x78],	%g6
	save %i7, 0x1C5C, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvs	%icc,	%f22,	%f29
	umul	%l0,	0x10FE,	%g2
	alignaddrl	%o1,	%i6,	%g7
	subc	%l5,	%o7,	%i3
	fabsd	%f2,	%f20
	alignaddr	%i2,	%l4,	%i5
	ldd	[%l7 + 0x48],	%f6
	edge32	%o0,	%g5,	%o5
	movg	%xcc,	%l2,	%i1
	fcmpgt16	%f22,	%f10,	%i0
	srax	%o3,	0x14,	%i4
	smulcc	%l3,	%l1,	%g4
	movle	%xcc,	%g1,	%o2
	orn	%o4,	0x16C8,	%g3
	fmovdge	%icc,	%f26,	%f27
	srlx	%l6,	0x14,	%i7
	srl	%o6,	0x1A,	%g6
	addccc	%g2,	%o1,	%l0
	fpsub32s	%f5,	%f5,	%f11
	sth	%g7,	[%l7 + 0x64]
	movvs	%xcc,	%l5,	%o7
	movgu	%xcc,	%i3,	%i2
	nop
	set	0x5E, %i4
	lduh	[%l7 + %i4],	%l4
	addcc	%i5,	0x1131,	%i6
	movvc	%icc,	%o0,	%o5
	ldx	[%l7 + 0x68],	%g5
	sra	%i1,	%l2,	%o3
	movvc	%icc,	%i0,	%i4
	orcc	%l3,	0x16F9,	%l1
	movgu	%xcc,	%g1,	%o2
	edge16l	%o4,	%g3,	%g4
	ldsh	[%l7 + 0x74],	%l6
	fmovdcs	%icc,	%f16,	%f31
	movgu	%icc,	%i7,	%g6
	movvc	%icc,	%o6,	%o1
	smul	%g2,	%l0,	%g7
	movvc	%xcc,	%o7,	%i3
	fcmpes	%fcc3,	%f30,	%f0
	movleu	%xcc,	%l5,	%l4
	fpsub32s	%f3,	%f28,	%f26
	array32	%i5,	%i2,	%i6
	fmovsvc	%icc,	%f21,	%f9
	fors	%f15,	%f3,	%f13
	add	%o5,	0x1E4E,	%o0
	add	%g5,	0x1DCE,	%i1
	addcc	%o3,	0x084C,	%i0
	srlx	%l2,	%i4,	%l3
	orcc	%l1,	%o2,	%o4
	srl	%g3,	0x19,	%g1
	smul	%l6,	0x01F9,	%i7
	fmovrslz	%g4,	%f1,	%f25
	fmovsvs	%icc,	%f20,	%f1
	xorcc	%g6,	%o1,	%g2
	st	%f6,	[%l7 + 0x2C]
	srlx	%l0,	0x02,	%g7
	fsrc1s	%f9,	%f6
	stw	%o6,	[%l7 + 0x34]
	movpos	%icc,	%i3,	%l5
	addc	%l4,	0x1B2D,	%o7
	fpmerge	%f10,	%f5,	%f18
	sra	%i5,	%i2,	%o5
	stw	%o0,	[%l7 + 0x08]
	sdiv	%g5,	0x1C74,	%i6
	fcmple32	%f6,	%f30,	%i1
	xnor	%o3,	0x0862,	%i0
	st	%f1,	[%l7 + 0x64]
	alignaddrl	%i4,	%l3,	%l1
	sllx	%l2,	0x08,	%o2
	or	%g3,	0x015B,	%o4
	fmovsl	%xcc,	%f27,	%f29
	fmovsle	%icc,	%f31,	%f5
	ldub	[%l7 + 0x2C],	%g1
	st	%f5,	[%l7 + 0x28]
	ldsb	[%l7 + 0x0B],	%i7
	stb	%g4,	[%l7 + 0x5F]
	movrgez	%g6,	%l6,	%o1
	fexpand	%f10,	%f24
	sllx	%l0,	%g7,	%o6
	ldsw	[%l7 + 0x0C],	%g2
	movneg	%xcc,	%i3,	%l4
	ldsw	[%l7 + 0x40],	%o7
	fmovrslez	%l5,	%f21,	%f10
	movrlz	%i5,	0x012,	%o5
	sdivx	%i2,	0x1519,	%g5
	fmovsn	%icc,	%f13,	%f10
	andcc	%o0,	%i1,	%o3
	fmovrslez	%i0,	%f19,	%f29
	umulcc	%i6,	%l3,	%i4
	movneg	%icc,	%l1,	%l2
	fzeros	%f8
	mulscc	%g3,	%o4,	%o2
	array8	%g1,	%i7,	%g6
	addc	%l6,	0x1C3F,	%o1
	subcc	%g4,	0x199A,	%g7
	umul	%l0,	0x047A,	%o6
	movcs	%xcc,	%i3,	%l4
	stw	%o7,	[%l7 + 0x64]
	stb	%g2,	[%l7 + 0x7E]
	udivx	%l5,	0x0834,	%i5
	fmuld8sux16	%f20,	%f26,	%f26
	movcs	%icc,	%i2,	%g5
	ldub	[%l7 + 0x39],	%o0
	popc	0x12ED,	%o5
	ldub	[%l7 + 0x7A],	%o3
	edge16n	%i1,	%i6,	%i0
	fmovsvs	%xcc,	%f12,	%f21
	fmovrdlz	%l3,	%f24,	%f28
	umul	%l1,	0x019B,	%l2
	sdiv	%i4,	0x1C96,	%g3
	array8	%o4,	%o2,	%g1
	smulcc	%g6,	0x12F4,	%i7
	sra	%l6,	%o1,	%g7
	orncc	%g4,	0x111B,	%o6
	udiv	%l0,	0x11E4,	%l4
	ldd	[%l7 + 0x30],	%f14
	stb	%o7,	[%l7 + 0x0B]
	array8	%i3,	%g2,	%l5
	stw	%i5,	[%l7 + 0x14]
	fxnors	%f2,	%f22,	%f16
	sdivx	%g5,	0x1ED0,	%i2
	fnot1s	%f22,	%f31
	st	%f12,	[%l7 + 0x28]
	fands	%f24,	%f30,	%f7
	subccc	%o0,	%o3,	%i1
	fpadd32	%f12,	%f22,	%f10
	movpos	%xcc,	%i6,	%o5
	movrne	%i0,	0x057,	%l1
	movge	%xcc,	%l2,	%i4
	fmovrsne	%l3,	%f27,	%f21
	fmovdvs	%icc,	%f28,	%f18
	alignaddrl	%o4,	%g3,	%o2
	andncc	%g6,	%i7,	%l6
	andcc	%g1,	%g7,	%o1
	sll	%o6,	%g4,	%l0
	movne	%xcc,	%l4,	%i3
	fmovse	%xcc,	%f22,	%f2
	subc	%o7,	0x1EFD,	%l5
	sth	%i5,	[%l7 + 0x14]
	ldsw	[%l7 + 0x30],	%g5
	array16	%g2,	%o0,	%o3
	fmuld8ulx16	%f16,	%f25,	%f14
	edge32	%i1,	%i2,	%i6
	fornot2	%f6,	%f20,	%f2
	udivx	%o5,	0x0EAB,	%l1
	fmovsge	%xcc,	%f0,	%f24
	movrgz	%l2,	0x31A,	%i4
	std	%f0,	[%l7 + 0x70]
	sdivcc	%l3,	0x0645,	%i0
	mulx	%o4,	0x07ED,	%g3
	fnegd	%f2,	%f20
	fnot2	%f0,	%f2
	fmul8ulx16	%f10,	%f14,	%f28
	sll	%o2,	%i7,	%l6
	movgu	%icc,	%g1,	%g7
	edge8ln	%g6,	%o6,	%o1
	udivcc	%l0,	0x0C5A,	%g4
	std	%f2,	[%l7 + 0x08]
	sllx	%i3,	%o7,	%l4
	fnot2	%f24,	%f16
	alignaddrl	%i5,	%g5,	%l5
	st	%f19,	[%l7 + 0x34]
	fmovsa	%icc,	%f4,	%f3
	sdivx	%o0,	0x186E,	%g2
	ldsh	[%l7 + 0x2A],	%o3
	edge8ln	%i1,	%i6,	%i2
	movvc	%icc,	%o5,	%l2
	movneg	%icc,	%l1,	%i4
	fmovdgu	%icc,	%f18,	%f31
	save %i0, 0x1CCF, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g3, 0x0C53, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i7,	%l6,	%g1
	movleu	%xcc,	%g7,	%g6
	xnor	%l3,	0x0560,	%o6
	and	%o1,	%g4,	%i3
	subc	%l0,	0x13FA,	%l4
	movpos	%xcc,	%o7,	%i5
	fmovrsgz	%l5,	%f28,	%f25
	edge16n	%g5,	%o0,	%g2
	fpmerge	%f16,	%f18,	%f0
	movpos	%xcc,	%o3,	%i6
	movneg	%xcc,	%i1,	%o5
	smul	%i2,	0x1836,	%l1
	alignaddr	%l2,	%i0,	%i4
	edge16	%g3,	%o2,	%o4
	edge8l	%l6,	%g1,	%g7
	nop
	set	0x0E, %o5
	lduh	[%l7 + %o5],	%g6
	sra	%l3,	%o6,	%o1
	ldsw	[%l7 + 0x1C],	%i7
	fcmpeq32	%f22,	%f20,	%i3
	edge32	%l0,	%l4,	%o7
	orncc	%g4,	%l5,	%g5
	fpsub16s	%f16,	%f17,	%f18
	lduh	[%l7 + 0x36],	%i5
	move	%xcc,	%g2,	%o0
	xnor	%o3,	%i1,	%o5
	fzeros	%f2
	smulcc	%i2,	%l1,	%i6
	movleu	%icc,	%i0,	%i4
	fmovdleu	%xcc,	%f3,	%f17
	fmovrsgez	%g3,	%f20,	%f18
	srax	%o2,	%l2,	%l6
	movn	%icc,	%g1,	%o4
	sdivcc	%g6,	0x10D5,	%g7
	fmovrsgz	%o6,	%f26,	%f6
	movne	%xcc,	%o1,	%i7
	subcc	%l3,	%l0,	%l4
	lduh	[%l7 + 0x20],	%i3
	sth	%o7,	[%l7 + 0x32]
	srax	%l5,	%g5,	%g4
	movleu	%xcc,	%g2,	%i5
	orn	%o3,	0x0981,	%o0
	fxor	%f10,	%f6,	%f8
	sdivcc	%i1,	0x1DE5,	%o5
	fcmpne32	%f26,	%f28,	%l1
	ldsw	[%l7 + 0x08],	%i6
	movrgz	%i2,	0x3EE,	%i4
	move	%xcc,	%g3,	%o2
	movcc	%icc,	%i0,	%l2
	fones	%f26
	stb	%g1,	[%l7 + 0x60]
	udiv	%o4,	0x0156,	%l6
	edge8l	%g7,	%o6,	%g6
	srlx	%i7,	0x09,	%l3
	fnegs	%f18,	%f2
	fnot2s	%f12,	%f1
	fnand	%f14,	%f18,	%f22
	smulcc	%l0,	0x00C0,	%o1
	ldd	[%l7 + 0x20],	%f2
	orn	%i3,	0x04B9,	%o7
	fandnot1	%f2,	%f26,	%f8
	edge8n	%l4,	%g5,	%g4
	xnorcc	%l5,	%g2,	%i5
	lduw	[%l7 + 0x18],	%o3
	edge16l	%i1,	%o0,	%o5
	fzero	%f0
	setx loop_44, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_44: 	andcc	%i4,	0x1C7B,	%l1
	fmovsg	%xcc,	%f28,	%f10
	movre	%o2,	%i0,	%l2
	movrne	%g3,	0x349,	%o4
	umulcc	%l6,	0x127C,	%g1
	udivcc	%g7,	0x1059,	%g6
	mulscc	%i7,	0x0215,	%o6
	sth	%l0,	[%l7 + 0x70]
	for	%f28,	%f12,	%f30
	fpsub16	%f0,	%f12,	%f2
	movrgez	%o1,	0x042,	%i3
	stb	%l3,	[%l7 + 0x23]
	mulx	%l4,	0x15A4,	%o7
	movrlez	%g4,	%g5,	%g2
	sir	0x1234
	popc	0x0969,	%i5
	smulcc	%o3,	%l5,	%o0
	fmovsa	%xcc,	%f22,	%f26
	udivx	%o5,	0x18A4,	%i6
	lduh	[%l7 + 0x36],	%i1
	fpack16	%f22,	%f24
	fors	%f5,	%f18,	%f26
	sllx	%i2,	%i4,	%o2
	movrne	%l1,	%i0,	%l2
	restore %o4, 0x1036, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%g3,	%g7,	%g6
	movne	%icc,	%g1,	%o6
	st	%f25,	[%l7 + 0x10]
	lduh	[%l7 + 0x34],	%l0
	orncc	%i7,	0x1F67,	%o1
	xor	%l3,	0x1058,	%i3
	edge16	%o7,	%g4,	%g5
	edge32n	%l4,	%i5,	%g2
	edge32n	%l5,	%o3,	%o0
	andncc	%i6,	%i1,	%o5
	movrlz	%i4,	0x031,	%i2
	fmovsneg	%xcc,	%f8,	%f9
	movpos	%xcc,	%o2,	%l1
	movcc	%icc,	%i0,	%l2
	movrne	%l6,	%o4,	%g7
	udivcc	%g6,	0x0615,	%g1
	movcc	%xcc,	%g3,	%l0
	fcmped	%fcc2,	%f14,	%f16
	fnors	%f25,	%f22,	%f16
	array32	%i7,	%o1,	%o6
	fsrc1s	%f31,	%f3
	edge8	%l3,	%i3,	%o7
	srl	%g4,	0x18,	%g5
	fnor	%f22,	%f20,	%f30
	fpsub16	%f10,	%f4,	%f4
	sllx	%i5,	%g2,	%l4
	sll	%l5,	0x18,	%o3
	lduh	[%l7 + 0x30],	%o0
	fcmpes	%fcc2,	%f5,	%f15
	movrgz	%i1,	0x001,	%i6
	ldub	[%l7 + 0x57],	%o5
	movvs	%xcc,	%i2,	%o2
	fsrc1s	%f15,	%f31
	fcmpgt32	%f24,	%f26,	%i4
	ldd	[%l7 + 0x18],	%l0
	movleu	%xcc,	%l2,	%i0
	sth	%o4,	[%l7 + 0x1E]
	subccc	%l6,	0x0369,	%g7
	movrlz	%g1,	%g3,	%l0
	movgu	%xcc,	%i7,	%g6
	pdist	%f24,	%f0,	%f10
	movpos	%icc,	%o1,	%l3
	movre	%i3,	0x24C,	%o6
	fcmped	%fcc1,	%f0,	%f6
	movle	%xcc,	%g4,	%o7
	xnor	%i5,	0x1BAC,	%g5
	std	%f22,	[%l7 + 0x60]
	ld	[%l7 + 0x08],	%f12
	bshuffle	%f0,	%f26,	%f12
	srl	%g2,	0x1E,	%l4
	fmovsgu	%xcc,	%f22,	%f14
	movne	%xcc,	%o3,	%o0
	smulcc	%l5,	0x11C4,	%i1
	movle	%icc,	%o5,	%i6
	movl	%xcc,	%o2,	%i4
	ldd	[%l7 + 0x08],	%f22
	setx loop_45, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_45: 	ldsh	[%l7 + 0x4A],	%i0
	fcmpne32	%f22,	%f24,	%i2
	orncc	%o4,	0x12C7,	%l6
	movleu	%icc,	%g7,	%g1
	fandnot2	%f24,	%f16,	%f10
	addccc	%g3,	0x0145,	%i7
	srlx	%g6,	0x04,	%l0
	ldsw	[%l7 + 0x1C],	%l3
	edge8l	%o1,	%o6,	%i3
	smul	%g4,	%i5,	%o7
	ldd	[%l7 + 0x20],	%f28
	fornot2	%f30,	%f18,	%f2
	srlx	%g2,	%l4,	%g5
	nop
	set	0x0E, %g2
	sth	%o0,	[%l7 + %g2]
	stw	%l5,	[%l7 + 0x48]
	ld	[%l7 + 0x0C],	%f7
	fmovsneg	%icc,	%f23,	%f10
	ldd	[%l7 + 0x48],	%o2
	subc	%o5,	0x150C,	%i1
	alignaddrl	%o2,	%i6,	%l1
	umulcc	%i4,	%i0,	%i2
	fpack32	%f24,	%f20,	%f10
	movvc	%xcc,	%o4,	%l2
	stx	%l6,	[%l7 + 0x10]
	fsrc1	%f0,	%f28
	ldsh	[%l7 + 0x3E],	%g1
	faligndata	%f20,	%f12,	%f26
	nop
	set	0x0C, %g4
	lduh	[%l7 + %g4],	%g3
	fnegd	%f22,	%f2
	addccc	%i7,	%g6,	%g7
	movne	%icc,	%l0,	%o1
	stx	%l3,	[%l7 + 0x70]
	lduw	[%l7 + 0x60],	%i3
	umul	%g4,	0x1C98,	%o6
	fmul8ulx16	%f12,	%f12,	%f10
	mulx	%o7,	%g2,	%i5
	fnand	%f22,	%f26,	%f26
	fmovrdne	%l4,	%f30,	%f22
	ldsw	[%l7 + 0x44],	%g5
	fmul8ulx16	%f14,	%f22,	%f2
	movpos	%xcc,	%l5,	%o0
	ldub	[%l7 + 0x15],	%o3
	srax	%i1,	0x0E,	%o5
	sdiv	%o2,	0x1957,	%l1
	fnands	%f19,	%f30,	%f12
	movrlez	%i6,	0x1DA,	%i4
	ldsb	[%l7 + 0x72],	%i0
	movne	%xcc,	%o4,	%l2
	st	%f24,	[%l7 + 0x68]
	movre	%i2,	0x208,	%g1
	sra	%g3,	%l6,	%i7
	udivx	%g6,	0x0CD6,	%g7
	and	%o1,	0x065C,	%l3
	movvs	%icc,	%i3,	%g4
	fabss	%f30,	%f7
	movrlz	%o6,	%l0,	%o7
	nop
	set	0x74, %i1
	lduw	[%l7 + %i1],	%i5
	subccc	%l4,	0x19E0,	%g2
	fpadd32	%f24,	%f12,	%f10
	popc	%g5,	%l5
	sth	%o0,	[%l7 + 0x40]
	alignaddr	%o3,	%o5,	%i1
	edge8n	%o2,	%l1,	%i6
	orncc	%i0,	%i4,	%l2
	smulcc	%o4,	0x1D46,	%i2
	stx	%g3,	[%l7 + 0x78]
	fpsub16s	%f17,	%f8,	%f11
	fmovsne	%xcc,	%f1,	%f26
	stx	%l6,	[%l7 + 0x60]
	array32	%i7,	%g1,	%g6
	ld	[%l7 + 0x3C],	%f8
	sdivx	%g7,	0x067F,	%l3
	fmul8x16	%f21,	%f26,	%f20
	sra	%i3,	0x07,	%o1
	ldsw	[%l7 + 0x4C],	%o6
	fmovsvs	%xcc,	%f15,	%f30
	udiv	%g4,	0x058E,	%l0
	ldd	[%l7 + 0x08],	%f30
	fmovrdgez	%o7,	%f8,	%f14
	orcc	%i5,	0x18D0,	%l4
	sdivcc	%g5,	0x16E5,	%g2
	array32	%l5,	%o3,	%o5
	fpsub32s	%f28,	%f7,	%f6
	movrlz	%o0,	0x3F9,	%o2
	movrne	%i1,	%l1,	%i6
	movcc	%xcc,	%i0,	%i4
	udiv	%l2,	0x1E66,	%i2
	movneg	%xcc,	%g3,	%o4
	xnor	%l6,	0x02F3,	%i7
	ldd	[%l7 + 0x60],	%f24
	edge32	%g6,	%g1,	%l3
	edge16	%g7,	%o1,	%i3
	move	%xcc,	%g4,	%o6
	std	%f22,	[%l7 + 0x58]
	fzeros	%f20
	movvs	%icc,	%l0,	%i5
	ldsw	[%l7 + 0x44],	%o7
	edge32	%g5,	%g2,	%l4
	fmovdneg	%icc,	%f11,	%f11
	fmovrdne	%o3,	%f8,	%f22
	movcc	%xcc,	%l5,	%o5
	udivx	%o0,	0x0952,	%o2
	array32	%i1,	%l1,	%i6
	subccc	%i0,	0x13E1,	%l2
	array8	%i4,	%i2,	%g3
	edge32ln	%l6,	%o4,	%g6
	sdiv	%g1,	0x1F94,	%i7
	sdivcc	%l3,	0x1056,	%o1
	sllx	%i3,	%g4,	%o6
	array16	%g7,	%i5,	%l0
	edge8	%g5,	%o7,	%g2
	move	%icc,	%o3,	%l5
	fmovrslez	%l4,	%f23,	%f12
	movle	%xcc,	%o5,	%o2
	andn	%o0,	0x02A3,	%l1
	addc	%i6,	0x0921,	%i0
	restore %l2, 0x085A, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i2,	%i4
	edge32ln	%l6,	%o4,	%g3
	andncc	%g6,	%g1,	%l3
	save %i7, 0x01D2, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%o1,	%g4,	%g7
	movrne	%o6,	0x11A,	%l0
	fnors	%f29,	%f30,	%f12
	sra	%g5,	0x0E,	%i5
	movrlz	%g2,	%o3,	%l5
	sir	0x0D34
	fmovsle	%xcc,	%f10,	%f15
	movne	%icc,	%o7,	%l4
	sra	%o2,	%o5,	%o0
	fmovrsgez	%i6,	%f15,	%f24
	movne	%xcc,	%i0,	%l2
	fmovrdgez	%l1,	%f12,	%f30
	ldd	[%l7 + 0x70],	%i0
	sll	%i2,	0x19,	%i4
	fpadd32s	%f7,	%f1,	%f8
	fone	%f28
	edge32n	%l6,	%o4,	%g6
	sth	%g3,	[%l7 + 0x64]
	ldx	[%l7 + 0x10],	%l3
	xor	%i7,	%g1,	%o1
	ldsb	[%l7 + 0x17],	%i3
	sdivcc	%g4,	0x1D4B,	%o6
	movcc	%xcc,	%g7,	%l0
	nop
	set	0x20, %o2
	ldd	[%l7 + %o2],	%f8
	movrlz	%i5,	0x22D,	%g5
	movpos	%icc,	%o3,	%l5
	ldd	[%l7 + 0x58],	%f14
	fpsub16s	%f28,	%f11,	%f12
	alignaddrl	%o7,	%g2,	%l4
	fmovdl	%xcc,	%f23,	%f24
	sth	%o2,	[%l7 + 0x54]
	udivcc	%o0,	0x0A5C,	%i6
	array32	%o5,	%i0,	%l2
	andcc	%l1,	0x0AC4,	%i2
	movcs	%xcc,	%i1,	%l6
	addcc	%o4,	%g6,	%i4
	edge8n	%g3,	%l3,	%g1
	movrlez	%i7,	0x122,	%i3
	sdivcc	%o1,	0x015D,	%o6
	movcc	%xcc,	%g7,	%g4
	subccc	%l0,	0x00E6,	%i5
	mulx	%g5,	%l5,	%o7
	bshuffle	%f10,	%f4,	%f22
	fpmerge	%f16,	%f22,	%f2
	ldd	[%l7 + 0x40],	%f16
	std	%f8,	[%l7 + 0x50]
	fabss	%f23,	%f23
	fnands	%f20,	%f2,	%f1
	fcmped	%fcc3,	%f10,	%f8
	subc	%g2,	%l4,	%o2
	edge16ln	%o0,	%i6,	%o5
	st	%f14,	[%l7 + 0x34]
	fmovde	%xcc,	%f6,	%f7
	ldub	[%l7 + 0x6D],	%o3
	udivcc	%l2,	0x0037,	%l1
	array32	%i2,	%i1,	%l6
	array32	%i0,	%g6,	%o4
	fmovrdlz	%i4,	%f6,	%f12
	fmul8x16al	%f13,	%f0,	%f14
	sra	%l3,	0x15,	%g3
	fsrc1s	%f10,	%f23
	movpos	%icc,	%i7,	%i3
	fmuld8ulx16	%f7,	%f19,	%f10
	stb	%g1,	[%l7 + 0x11]
	udivx	%o1,	0x0659,	%g7
	sra	%g4,	%o6,	%l0
	lduh	[%l7 + 0x26],	%i5
	smulcc	%l5,	%o7,	%g2
	smulcc	%l4,	%o2,	%o0
	sdivcc	%i6,	0x1D5B,	%o5
	smul	%g5,	0x0077,	%l2
	movre	%o3,	0x0C1,	%l1
	sdivx	%i1,	0x1E58,	%l6
	ldd	[%l7 + 0x58],	%i2
	st	%f6,	[%l7 + 0x48]
	sllx	%g6,	%o4,	%i0
	setx loop_46, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_46: 	popc	%i7,	%i3
	fpadd32	%f6,	%f10,	%f10
	fxnor	%f0,	%f10,	%f4
	edge8ln	%g3,	%g1,	%g7
	lduh	[%l7 + 0x72],	%g4
	mova	%icc,	%o1,	%l0
	fones	%f0
	fpsub32	%f26,	%f14,	%f0
	udiv	%o6,	0x0AF7,	%i5
	fmul8x16	%f19,	%f18,	%f22
	movn	%icc,	%l5,	%o7
	movcs	%icc,	%g2,	%o2
	movcc	%icc,	%o0,	%i6
	fmovrdgz	%l4,	%f18,	%f0
	ld	[%l7 + 0x20],	%f4
	edge16	%g5,	%o5,	%l2
	addc	%l1,	0x1D52,	%o3
	ldd	[%l7 + 0x50],	%i6
	fmovsleu	%icc,	%f27,	%f10
	srl	%i2,	0x06,	%g6
	edge8l	%o4,	%i1,	%i0
	fmovrdne	%l3,	%f12,	%f22
	movrgez	%i7,	0x3B4,	%i4
	xnor	%g3,	0x0338,	%g1
	ldsb	[%l7 + 0x58],	%g7
	ldsh	[%l7 + 0x76],	%i3
	fpsub16s	%f2,	%f13,	%f20
	sdiv	%o1,	0x0EAF,	%l0
	fcmpne32	%f0,	%f6,	%o6
	sdivcc	%g4,	0x1E88,	%l5
	fcmple16	%f30,	%f2,	%i5
	or	%o7,	0x0A75,	%o2
	ldd	[%l7 + 0x48],	%f28
	stx	%o0,	[%l7 + 0x78]
	umulcc	%g2,	%l4,	%g5
	fzero	%f10
	fmuld8sux16	%f30,	%f5,	%f2
	movvc	%icc,	%o5,	%i6
	fmovrslez	%l2,	%f25,	%f26
	stw	%o3,	[%l7 + 0x64]
	fornot1	%f6,	%f14,	%f10
	fmovrdlez	%l6,	%f26,	%f12
	fmovrsne	%l1,	%f15,	%f31
	alignaddrl	%g6,	%i2,	%i1
	xorcc	%o4,	%l3,	%i7
	and	%i0,	0x1EFF,	%i4
	edge8n	%g1,	%g7,	%g3
	fmovsvs	%icc,	%f14,	%f19
	movleu	%icc,	%o1,	%l0
	sdiv	%o6,	0x0A90,	%i3
	fnands	%f25,	%f18,	%f15
	array8	%l5,	%g4,	%i5
	ldsb	[%l7 + 0x1C],	%o2
	edge32ln	%o0,	%g2,	%o7
	fmovdleu	%xcc,	%f9,	%f29
	edge8	%g5,	%o5,	%i6
	edge16l	%l4,	%o3,	%l6
	smulcc	%l2,	0x11EC,	%l1
	ldsb	[%l7 + 0x28],	%i2
	mulscc	%g6,	0x12F8,	%o4
	and	%l3,	%i7,	%i1
	edge8n	%i0,	%i4,	%g1
	edge8	%g3,	%o1,	%g7
	sll	%l0,	0x15,	%i3
	movge	%xcc,	%l5,	%o6
	movrlz	%g4,	%i5,	%o2
	ldd	[%l7 + 0x60],	%f12
	fmovrdne	%o0,	%f10,	%f30
	xor	%o7,	%g5,	%o5
	subcc	%i6,	%g2,	%l4
	movre	%o3,	%l6,	%l2
	udivcc	%i2,	0x06DE,	%g6
	stx	%o4,	[%l7 + 0x28]
	fxnor	%f22,	%f28,	%f16
	movne	%icc,	%l1,	%i7
	movrne	%l3,	%i1,	%i0
	xor	%g1,	%g3,	%o1
	sdivcc	%i4,	0x1E53,	%l0
	fands	%f16,	%f13,	%f0
	xnorcc	%i3,	0x126B,	%l5
	movl	%xcc,	%g7,	%o6
	sra	%i5,	0x18,	%g4
	movleu	%xcc,	%o2,	%o0
	mova	%icc,	%o7,	%o5
	fcmpeq32	%f2,	%f30,	%i6
	fpadd16	%f18,	%f6,	%f30
	movge	%icc,	%g2,	%l4
	sir	0x1804
	fmovdgu	%xcc,	%f5,	%f31
	mulscc	%o3,	%g5,	%l2
	movge	%icc,	%l6,	%g6
	lduw	[%l7 + 0x50],	%o4
	movcc	%icc,	%i2,	%l1
	stx	%l3,	[%l7 + 0x78]
	fmovrslez	%i1,	%f11,	%f18
	edge16l	%i0,	%i7,	%g3
	movcc	%xcc,	%g1,	%i4
	fmovdleu	%icc,	%f4,	%f7
	sdiv	%o1,	0x0494,	%l0
	std	%f12,	[%l7 + 0x10]
	orcc	%i3,	%l5,	%o6
	udivcc	%g7,	0x0D27,	%g4
	fnot2s	%f0,	%f3
	andncc	%o2,	%o0,	%o7
	movleu	%xcc,	%i5,	%i6
	mova	%icc,	%o5,	%l4
	sdivx	%o3,	0x1CFE,	%g2
	orcc	%l2,	0x141E,	%g5
	addcc	%l6,	0x02B5,	%o4
	stb	%i2,	[%l7 + 0x38]
	fors	%f17,	%f5,	%f22
	fmovrde	%l1,	%f12,	%f24
	orncc	%g6,	0x11A8,	%i1
	movvc	%icc,	%i0,	%i7
	movrgez	%g3,	%g1,	%i4
	lduw	[%l7 + 0x74],	%o1
	sth	%l0,	[%l7 + 0x72]
	array16	%l3,	%i3,	%l5
	srlx	%o6,	0x15,	%g7
	stb	%g4,	[%l7 + 0x6C]
	umulcc	%o2,	%o7,	%i5
	sth	%i6,	[%l7 + 0x42]
	fandnot2s	%f21,	%f5,	%f0
	sdivcc	%o0,	0x091D,	%o5
	ldsh	[%l7 + 0x26],	%o3
	movle	%xcc,	%l4,	%g2
	udivcc	%l2,	0x1FE3,	%g5
	edge32ln	%l6,	%i2,	%o4
	edge32ln	%l1,	%i1,	%i0
	edge16	%i7,	%g6,	%g1
	sub	%i4,	%o1,	%g3
	fzeros	%f21
	stw	%l0,	[%l7 + 0x5C]
	sethi	0x15DA,	%i3
	movle	%icc,	%l3,	%o6
	sethi	0x132F,	%g7
	ldsb	[%l7 + 0x2B],	%l5
	fmovsg	%icc,	%f18,	%f25
	edge32l	%g4,	%o2,	%i5
	mulx	%o7,	%o0,	%i6
	ldd	[%l7 + 0x18],	%o2
	mulx	%o5,	%l4,	%g2
	lduw	[%l7 + 0x48],	%g5
	xnorcc	%l6,	%l2,	%o4
	addcc	%i2,	0x05E5,	%i1
	sth	%i0,	[%l7 + 0x2C]
	std	%f14,	[%l7 + 0x78]
	ldsb	[%l7 + 0x17],	%i7
	sdivx	%l1,	0x08E3,	%g6
	fabss	%f17,	%f11
	movrgez	%g1,	0x10B,	%o1
	sub	%g3,	0x088C,	%i4
	edge8n	%l0,	%i3,	%o6
	sdivcc	%l3,	0x1C37,	%l5
	andn	%g4,	%o2,	%i5
	stx	%g7,	[%l7 + 0x70]
	movle	%xcc,	%o7,	%o0
	subc	%o3,	%i6,	%l4
	movre	%g2,	%g5,	%o5
	movcc	%icc,	%l2,	%o4
	fcmps	%fcc1,	%f8,	%f31
	popc	%l6,	%i1
	movrgz	%i2,	0x11F,	%i7
	sub	%i0,	0x085B,	%l1
	movrlez	%g1,	%g6,	%o1
	orcc	%i4,	0x1C00,	%g3
	mulscc	%l0,	%o6,	%i3
	movrlez	%l3,	%g4,	%l5
	fand	%f14,	%f2,	%f26
	andcc	%i5,	%g7,	%o7
	edge16	%o0,	%o3,	%o2
	and	%l4,	%g2,	%g5
	fsrc2s	%f12,	%f22
	fmovda	%icc,	%f30,	%f13
	edge8l	%o5,	%i6,	%l2
	srl	%l6,	%i1,	%i2
	xnor	%i7,	0x124F,	%i0
	subcc	%l1,	0x13B9,	%g1
	ld	[%l7 + 0x0C],	%f6
	lduw	[%l7 + 0x20],	%o4
	movvs	%icc,	%o1,	%i4
	alignaddrl	%g3,	%l0,	%g6
	fnor	%f20,	%f8,	%f24
	sdivcc	%o6,	0x1510,	%l3
	fcmpgt16	%f10,	%f26,	%i3
	smulcc	%g4,	%i5,	%l5
	and	%g7,	0x1159,	%o7
	sra	%o3,	0x04,	%o0
	bshuffle	%f28,	%f2,	%f24
	edge32n	%l4,	%g2,	%g5
	movvs	%xcc,	%o5,	%o2
	edge8ln	%i6,	%l6,	%l2
	sub	%i1,	%i2,	%i0
	udivx	%i7,	0x1E5E,	%g1
	sra	%o4,	%l1,	%o1
	xnorcc	%g3,	%l0,	%i4
	ldub	[%l7 + 0x52],	%o6
	movrlez	%l3,	0x3D5,	%i3
	sllx	%g4,	0x19,	%i5
	edge16l	%g6,	%l5,	%g7
	fexpand	%f28,	%f14
	bshuffle	%f6,	%f30,	%f22
	array8	%o7,	%o3,	%l4
	fmovsneg	%xcc,	%f7,	%f17
	nop
	set	0x48, %g5
	stx	%o0,	[%l7 + %g5]
	st	%f27,	[%l7 + 0x6C]
	fcmpd	%fcc2,	%f26,	%f12
	fandnot2s	%f15,	%f25,	%f30
	umul	%g5,	%o5,	%g2
	smulcc	%i6,	0x0D9F,	%o2
	ldub	[%l7 + 0x28],	%l6
	sethi	0x1450,	%i1
	movne	%icc,	%l2,	%i2
	st	%f18,	[%l7 + 0x58]
	addccc	%i0,	0x0668,	%g1
	movre	%o4,	0x06C,	%l1
	movl	%icc,	%i7,	%o1
	array32	%g3,	%l0,	%o6
	edge16	%i4,	%l3,	%i3
	restore %g4, 0x16FE, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsleu	%xcc,	%f19,	%f0
	fmovsle	%xcc,	%f29,	%f2
	movle	%xcc,	%i5,	%g7
	movcs	%icc,	%l5,	%o7
	orcc	%l4,	%o3,	%g5
	ldub	[%l7 + 0x68],	%o0
	movvc	%icc,	%g2,	%i6
	srax	%o5,	0x0B,	%o2
	smul	%i1,	0x157A,	%l2
	movre	%i2,	%l6,	%g1
	udiv	%o4,	0x1272,	%i0
	fmovde	%icc,	%f15,	%f7
	movcs	%xcc,	%i7,	%o1
	smul	%l1,	%g3,	%l0
	edge8n	%i4,	%o6,	%l3
	sll	%g4,	0x0C,	%g6
	fpack16	%f16,	%f8
	edge16n	%i5,	%i3,	%l5
	fsrc1	%f12,	%f16
	movrgz	%o7,	%l4,	%g7
	movn	%icc,	%o3,	%o0
	ldx	[%l7 + 0x60],	%g2
	srl	%i6,	0x05,	%g5
	st	%f22,	[%l7 + 0x58]
	fmovrslz	%o2,	%f19,	%f22
	xor	%i1,	0x12CE,	%o5
	movrgez	%l2,	%i2,	%g1
	and	%o4,	%i0,	%l6
	movvc	%xcc,	%i7,	%o1
	ldsb	[%l7 + 0x2F],	%l1
	nop
	set	0x1E, %o1
	sth	%l0,	[%l7 + %o1]
	orncc	%g3,	%o6,	%l3
	movne	%xcc,	%i4,	%g6
	sub	%i5,	%i3,	%g4
	fmovrse	%l5,	%f6,	%f15
	fxnors	%f26,	%f27,	%f1
	sth	%o7,	[%l7 + 0x52]
	xor	%g7,	%o3,	%o0
	movre	%l4,	%g2,	%g5
	edge32l	%i6,	%i1,	%o5
	movg	%icc,	%l2,	%o2
	ldub	[%l7 + 0x18],	%i2
	sdiv	%o4,	0x0207,	%i0
	fmovdvs	%icc,	%f17,	%f0
	mulx	%l6,	0x0B2E,	%i7
	fmovsge	%xcc,	%f4,	%f21
	sll	%o1,	%g1,	%l1
	fmovde	%icc,	%f20,	%f20
	sdivcc	%l0,	0x184E,	%g3
	sub	%o6,	0x0AA4,	%i4
	save %l3, %g6, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sub	%i3,	%g4,	%o7
	fpmerge	%f11,	%f30,	%f30
	sdivx	%l5,	0x1FF2,	%o3
	edge8ln	%g7,	%o0,	%g2
	fnegs	%f30,	%f25
	fexpand	%f24,	%f6
	movvs	%icc,	%l4,	%g5
	movcs	%xcc,	%i1,	%i6
	orcc	%l2,	0x1EA3,	%o5
	or	%o2,	0x1720,	%o4
	edge32	%i0,	%l6,	%i2
	fmovdne	%icc,	%f25,	%f24
	addc	%i7,	%g1,	%o1
	edge32	%l1,	%l0,	%o6
	fmovsle	%icc,	%f12,	%f13
	lduw	[%l7 + 0x34],	%g3
	movle	%icc,	%l3,	%i4
	addcc	%i5,	%g6,	%i3
	fcmple16	%f20,	%f26,	%g4
	fsrc2s	%f0,	%f18
	ldd	[%l7 + 0x18],	%o6
	move	%icc,	%o3,	%g7
	array8	%l5,	%o0,	%g2
	sdiv	%g5,	0x0EDB,	%l4
	xnor	%i6,	0x1C6F,	%l2
	move	%xcc,	%o5,	%i1
	fpsub32s	%f0,	%f15,	%f13
	srax	%o4,	%o2,	%i0
	move	%icc,	%l6,	%i2
	sra	%g1,	%o1,	%l1
	stw	%i7,	[%l7 + 0x18]
	save %l0, %g3, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%i4,	%i5
	fpsub32s	%f9,	%f18,	%f15
	sllx	%g6,	0x04,	%i3
	std	%f14,	[%l7 + 0x28]
	sdivx	%l3,	0x1FF1,	%g4
	sdivx	%o7,	0x0BD5,	%g7
	array8	%o3,	%l5,	%o0
	mulx	%g5,	0x1CCC,	%l4
	edge32l	%i6,	%l2,	%o5
	ldsb	[%l7 + 0x11],	%g2
	movn	%xcc,	%o4,	%i1
	subc	%o2,	%i0,	%i2
	movpos	%xcc,	%g1,	%l6
	movle	%xcc,	%o1,	%i7
	fmovsle	%xcc,	%f16,	%f11
	edge8l	%l1,	%l0,	%o6
	fnors	%f26,	%f9,	%f1
	ldsh	[%l7 + 0x6C],	%i4
	fxnor	%f12,	%f4,	%f30
	add	%g3,	0x0703,	%g6
	fcmpes	%fcc2,	%f23,	%f9
	fmovdgu	%icc,	%f4,	%f17
	edge32ln	%i5,	%l3,	%i3
	nop
	set	0x28, %o3
	std	%f4,	[%l7 + %o3]
	subc	%o7,	%g7,	%o3
	addccc	%l5,	0x05AB,	%o0
	ldsb	[%l7 + 0x2A],	%g5
	fpadd32s	%f23,	%f8,	%f5
	andcc	%g4,	0x1872,	%i6
	fmovdcc	%xcc,	%f10,	%f16
	or	%l4,	%o5,	%l2
	setx loop_47, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_47: 	st	%f23,	[%l7 + 0x3C]
	fnor	%f4,	%f2,	%f10
	movn	%xcc,	%o2,	%i1
	movleu	%xcc,	%i0,	%g1
	movrne	%l6,	0x2FD,	%o1
	fnegs	%f29,	%f15
	fexpand	%f4,	%f20
	movl	%xcc,	%i7,	%i2
	xnor	%l1,	%o6,	%l0
	array16	%i4,	%g3,	%g6
	ldub	[%l7 + 0x68],	%i5
	srax	%i3,	0x00,	%o7
	edge32l	%g7,	%l3,	%o3
	fmovdcs	%icc,	%f24,	%f25
	orcc	%l5,	0x13D5,	%g5
	fpack32	%f22,	%f26,	%f12
	sdivcc	%o0,	0x1E34,	%g4
	edge8n	%l4,	%i6,	%o5
	orn	%l2,	0x06FC,	%g2
	movleu	%icc,	%o2,	%i1
	st	%f20,	[%l7 + 0x0C]
	movrgz	%o4,	%i0,	%l6
	sir	0x1EBE
	addc	%g1,	%i7,	%i2
	alignaddr	%l1,	%o1,	%l0
	mulx	%i4,	%o6,	%g6
	srax	%g3,	%i3,	%o7
	ldd	[%l7 + 0x78],	%g6
	fsrc2	%f4,	%f16
	ldx	[%l7 + 0x40],	%i5
	udivcc	%o3,	0x1C06,	%l3
	edge16	%g5,	%o0,	%l5
	fmovsneg	%icc,	%f6,	%f7
	lduh	[%l7 + 0x72],	%g4
	fmovdn	%icc,	%f19,	%f21
	add	%l4,	%i6,	%l2
	movl	%xcc,	%o5,	%g2
	fmovdvc	%icc,	%f28,	%f21
	srax	%i1,	%o2,	%i0
	andcc	%l6,	%o4,	%g1
	edge16ln	%i7,	%l1,	%o1
	movl	%icc,	%i2,	%i4
	mulx	%o6,	0x017F,	%l0
	sll	%g6,	0x15,	%g3
	fnot1s	%f18,	%f6
	fors	%f22,	%f30,	%f27
	move	%icc,	%i3,	%g7
	sdivx	%o7,	0x09DD,	%i5
	movl	%icc,	%o3,	%g5
	srlx	%o0,	0x02,	%l5
	edge8n	%l3,	%g4,	%i6
	and	%l4,	0x150E,	%o5
	andncc	%g2,	%i1,	%o2
	movge	%xcc,	%l2,	%i0
	sethi	0x09B3,	%l6
	fnegs	%f17,	%f11
	movn	%icc,	%g1,	%i7
	sll	%o4,	0x0D,	%l1
	restore %o1, %i2, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i4,	0x1206,	%l0
	array32	%g6,	%g3,	%g7
	udivcc	%o7,	0x0D3C,	%i3
	movre	%o3,	0x01D,	%i5
	fpmerge	%f6,	%f16,	%f26
	fmovdvc	%icc,	%f10,	%f9
	nop
	set	0x08, %l5
	std	%f4,	[%l7 + %l5]
	sdivx	%o0,	0x1A43,	%g5
	or	%l3,	%l5,	%g4
	fxor	%f0,	%f10,	%f16
	sdivx	%i6,	0x17A5,	%l4
	nop
	set	0x58, %l0
	ldd	[%l7 + %l0],	%o4
	save %g2, %o2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%i0,	0x06E6,	%l2
	and	%g1,	0x021D,	%l6
	edge8n	%o4,	%i7,	%l1
	ldsb	[%l7 + 0x1A],	%i2
	nop
	set	0x3C, %o6
	ldsw	[%l7 + %o6],	%o6
	fmovsa	%icc,	%f22,	%f23
	subc	%o1,	0x06F8,	%i4
	movgu	%xcc,	%g6,	%l0
	fcmpeq32	%f12,	%f10,	%g7
	movrgz	%o7,	%i3,	%g3
	ldsh	[%l7 + 0x4E],	%i5
	fmovsge	%xcc,	%f23,	%f23
	sdivcc	%o3,	0x0163,	%o0
	orn	%g5,	0x03D3,	%l5
	smulcc	%g4,	%l3,	%l4
	movre	%i6,	0x27F,	%g2
	fcmpgt32	%f22,	%f22,	%o5
	movg	%icc,	%o2,	%i1
	fornot2	%f0,	%f8,	%f24
	movvc	%icc,	%i0,	%g1
	edge16l	%l6,	%o4,	%i7
	fmovd	%f24,	%f24
	array32	%l2,	%l1,	%i2
	fpadd32s	%f28,	%f6,	%f19
	lduh	[%l7 + 0x64],	%o1
	movcs	%xcc,	%o6,	%g6
	edge8l	%l0,	%i4,	%g7
	lduh	[%l7 + 0x5C],	%i3
	popc	%g3,	%o7
	udivx	%o3,	0x01D9,	%o0
	mova	%icc,	%g5,	%l5
	fpsub32	%f4,	%f16,	%f14
	fpsub16	%f30,	%f16,	%f22
	umulcc	%g4,	0x06BD,	%i5
	ld	[%l7 + 0x78],	%f28
	lduh	[%l7 + 0x48],	%l4
	ldsw	[%l7 + 0x5C],	%l3
	fmovsa	%icc,	%f17,	%f14
	umulcc	%i6,	0x19D6,	%o5
	fmovd	%f16,	%f26
	nop
	set	0x30, %l3
	ldd	[%l7 + %l3],	%f4
	move	%xcc,	%g2,	%o2
	sdivx	%i0,	0x1214,	%g1
	subccc	%l6,	%i1,	%i7
	for	%f20,	%f22,	%f24
	move	%xcc,	%o4,	%l2
	ldsw	[%l7 + 0x58],	%l1
	udivcc	%i2,	0x02C4,	%o6
	fsrc2s	%f8,	%f16
	fmovdcc	%icc,	%f25,	%f28
	sir	0x1CFB
	xorcc	%g6,	%l0,	%o1
	srax	%i4,	%g7,	%i3
	movrgez	%g3,	0x22A,	%o3
	umul	%o7,	0x11B5,	%g5
	movrgz	%l5,	%g4,	%o0
	fmovrdgez	%i5,	%f24,	%f4
	movne	%xcc,	%l4,	%l3
	addcc	%o5,	%g2,	%i6
	andn	%o2,	0x1078,	%i0
	movcs	%icc,	%l6,	%g1
	ld	[%l7 + 0x5C],	%f24
	stx	%i7,	[%l7 + 0x40]
	fcmped	%fcc3,	%f20,	%f24
	ldub	[%l7 + 0x19],	%o4
	sub	%l2,	0x1526,	%i1
	sir	0x0FF6
	nop
	set	0x18, %l2
	ldx	[%l7 + %l2],	%l1
	fornot1s	%f7,	%f22,	%f28
	smul	%o6,	0x1ED9,	%i2
	fpackfix	%f6,	%f4
	fabsd	%f12,	%f8
	array16	%l0,	%o1,	%i4
	movrlez	%g6,	%i3,	%g7
	movgu	%icc,	%g3,	%o3
	fnegs	%f19,	%f16
	fxors	%f30,	%f27,	%f19
	movn	%xcc,	%g5,	%l5
	umulcc	%o7,	0x1129,	%o0
	fandnot1s	%f21,	%f26,	%f27
	fmovdle	%icc,	%f25,	%f13
	edge8n	%i5,	%l4,	%l3
	xorcc	%g4,	0x047A,	%g2
	andn	%i6,	%o5,	%o2
	sub	%i0,	%g1,	%i7
	array16	%o4,	%l2,	%i1
	movcc	%xcc,	%l1,	%l6
	mova	%icc,	%i2,	%l0
	pdist	%f2,	%f24,	%f12
	movrlez	%o6,	0x396,	%o1
	xnor	%i4,	0x04EC,	%i3
	fnand	%f6,	%f20,	%f26
	fmovdneg	%icc,	%f19,	%f22
	stw	%g6,	[%l7 + 0x5C]
	umul	%g7,	%g3,	%o3
	udiv	%g5,	0x0411,	%o7
	umul	%o0,	0x1AF0,	%l5
	nop
	set	0x52, %i0
	sth	%l4,	[%l7 + %i0]
	udivx	%l3,	0x037B,	%i5
	fsrc1	%f28,	%f8
	andcc	%g2,	%g4,	%i6
	movn	%icc,	%o5,	%o2
	smulcc	%g1,	%i0,	%o4
	fornot2	%f20,	%f22,	%f20
	umulcc	%l2,	%i7,	%i1
	udivcc	%l6,	0x059B,	%i2
	lduh	[%l7 + 0x08],	%l1
	movneg	%xcc,	%o6,	%o1
	sth	%i4,	[%l7 + 0x20]
	ldx	[%l7 + 0x50],	%l0
	mova	%xcc,	%i3,	%g7
	fmovsvs	%xcc,	%f2,	%f14
	andcc	%g3,	0x1BF3,	%o3
	srl	%g5,	0x19,	%o7
	orncc	%g6,	0x0F70,	%l5
	andcc	%l4,	%o0,	%i5
	stw	%g2,	[%l7 + 0x38]
	popc	%g4,	%l3
	ldsb	[%l7 + 0x08],	%o5
	movg	%xcc,	%i6,	%o2
	array16	%g1,	%i0,	%l2
	andn	%o4,	0x1FDB,	%i1
	udiv	%i7,	0x0CDE,	%l6
	fmovrdne	%l1,	%f26,	%f28
	fcmpne16	%f24,	%f6,	%o6
	orncc	%i2,	%o1,	%i4
	umulcc	%i3,	%l0,	%g7
	move	%xcc,	%o3,	%g3
	movgu	%icc,	%o7,	%g5
	siam	0x2
	nop
	set	0x72, %i6
	sth	%l5,	[%l7 + %i6]
	andn	%g6,	%o0,	%i5
	fpadd32	%f0,	%f22,	%f14
	alignaddrl	%l4,	%g2,	%g4
	subc	%l3,	0x1487,	%i6
	subcc	%o2,	0x0F89,	%o5
	fmovrsgz	%g1,	%f11,	%f8
	edge8	%i0,	%l2,	%i1
	st	%f18,	[%l7 + 0x78]
	ldd	[%l7 + 0x58],	%f12
	movrne	%i7,	%o4,	%l1
	sir	0x04A5
	ldsb	[%l7 + 0x38],	%l6
	stx	%o6,	[%l7 + 0x08]
	movvc	%icc,	%o1,	%i4
	fmovdvc	%icc,	%f8,	%f24
	movvs	%icc,	%i3,	%i2
	for	%f24,	%f12,	%f26
	alignaddr	%g7,	%o3,	%l0
	siam	0x2
	popc	0x0089,	%o7
	edge32	%g5,	%l5,	%g6
	ldsw	[%l7 + 0x54],	%o0
	fmovsne	%xcc,	%f6,	%f7
	sdivx	%i5,	0x08F0,	%g3
	movleu	%xcc,	%g2,	%g4
	edge8ln	%l4,	%l3,	%o2
	sth	%i6,	[%l7 + 0x48]
	movvc	%icc,	%o5,	%g1
	sdiv	%l2,	0x1BE7,	%i0
	xorcc	%i7,	0x1AA6,	%o4
	movrlz	%l1,	0x37B,	%i1
	array8	%o6,	%l6,	%i4
	edge32	%i3,	%o1,	%g7
	mova	%xcc,	%i2,	%l0
	smul	%o7,	%g5,	%l5
	nop
	set	0x78, %g7
	std	%f16,	[%l7 + %g7]
	array8	%g6,	%o0,	%i5
	array8	%o3,	%g3,	%g2
	movpos	%xcc,	%g4,	%l4
	edge32n	%l3,	%i6,	%o5
	movneg	%xcc,	%g1,	%l2
	ldsh	[%l7 + 0x54],	%o2
	stx	%i0,	[%l7 + 0x30]
	andn	%i7,	%l1,	%i1
	edge32l	%o4,	%o6,	%i4
	movrlz	%l6,	%i3,	%o1
	popc	0x1C5A,	%i2
	fmovde	%xcc,	%f8,	%f4
	udiv	%l0,	0x156B,	%g7
	movcs	%xcc,	%o7,	%g5
	ldx	[%l7 + 0x48],	%l5
	addcc	%g6,	0x1D06,	%i5
	sdivcc	%o0,	0x14E5,	%g3
	lduw	[%l7 + 0x78],	%g2
	save %g4, %l4, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovscc	%icc,	%f14,	%f6
	orn	%i6,	0x179B,	%o3
	movg	%xcc,	%o5,	%g1
	alignaddrl	%l2,	%i0,	%i7
	xnorcc	%o2,	0x0C1E,	%l1
	fpack16	%f2,	%f4
	movrne	%i1,	%o6,	%o4
	addc	%l6,	0x0144,	%i3
	movge	%xcc,	%i4,	%o1
	subccc	%l0,	0x12E4,	%i2
	edge16n	%o7,	%g7,	%g5
	ldsb	[%l7 + 0x23],	%l5
	siam	0x2
	movcs	%xcc,	%g6,	%o0
	sll	%i5,	%g2,	%g3
	smul	%l4,	0x15B3,	%l3
	ldsw	[%l7 + 0x70],	%i6
	edge8	%o3,	%g4,	%g1
	xor	%l2,	%i0,	%i7
	fnegd	%f16,	%f0
	movrgz	%o2,	%o5,	%i1
	mulx	%l1,	0x0957,	%o6
	xor	%l6,	0x1E04,	%i3
	movl	%xcc,	%o4,	%o1
	sdivcc	%l0,	0x0528,	%i4
	andncc	%o7,	%i2,	%g7
	fcmpne32	%f28,	%f2,	%g5
	movl	%xcc,	%l5,	%o0
	addccc	%i5,	%g6,	%g2
	movrlez	%l4,	%l3,	%i6
	stw	%g3,	[%l7 + 0x1C]
	fsrc1	%f18,	%f24
	edge8	%o3,	%g1,	%g4
	movpos	%icc,	%l2,	%i7
	movgu	%icc,	%i0,	%o5
	addccc	%o2,	0x1859,	%i1
	lduh	[%l7 + 0x5E],	%o6
	orn	%l6,	%i3,	%o4
	fmovdgu	%xcc,	%f0,	%f0
	movcs	%xcc,	%o1,	%l1
	edge16ln	%l0,	%o7,	%i4
	move	%xcc,	%g7,	%i2
	movvc	%icc,	%l5,	%g5
	edge32	%o0,	%g6,	%g2
	array32	%l4,	%l3,	%i6
	array16	%g3,	%o3,	%i5
	alignaddr	%g4,	%g1,	%i7
	movcs	%xcc,	%i0,	%o5
	mova	%icc,	%l2,	%o2
	andncc	%o6,	%i1,	%i3
	udivx	%o4,	0x1F6E,	%l6
	addc	%l1,	%o1,	%o7
	fmovsl	%xcc,	%f4,	%f27
	ld	[%l7 + 0x6C],	%f10
	movneg	%icc,	%i4,	%l0
	umul	%g7,	0x0FDB,	%i2
	edge8l	%l5,	%o0,	%g6
	sub	%g5,	%g2,	%l3
	fpadd32	%f4,	%f2,	%f14
	ldub	[%l7 + 0x38],	%i6
	fmovrdne	%l4,	%f26,	%f12
	sdivcc	%g3,	0x19F6,	%i5
	movge	%xcc,	%o3,	%g1
	movpos	%xcc,	%i7,	%g4
	orn	%o5,	0x0E47,	%i0
	ldd	[%l7 + 0x48],	%l2
	sll	%o2,	0x0D,	%o6
	sth	%i3,	[%l7 + 0x74]
	fmovsvs	%xcc,	%f0,	%f28
	andn	%i1,	%l6,	%l1
	edge8n	%o4,	%o1,	%o7
	movleu	%xcc,	%i4,	%g7
	fcmpne16	%f26,	%f0,	%l0
	fmovdvc	%icc,	%f6,	%f14
	fmovdge	%xcc,	%f26,	%f10
	movl	%icc,	%l5,	%i2
	alignaddrl	%g6,	%g5,	%o0
	movvs	%icc,	%l3,	%i6
	movvc	%icc,	%l4,	%g2
	movrgez	%g3,	%o3,	%g1
	or	%i7,	%g4,	%o5
	fpadd32s	%f1,	%f13,	%f23
	mulscc	%i0,	%i5,	%o2
	add	%l2,	0x15F9,	%i3
	fmovsge	%icc,	%f6,	%f8
	popc	%o6,	%l6
	umulcc	%l1,	%o4,	%o1
	sethi	0x149A,	%o7
	fmovdvs	%xcc,	%f10,	%f16
	movrlez	%i1,	0x319,	%i4
	udivx	%g7,	0x1539,	%l5
	movvs	%xcc,	%i2,	%g6
	movneg	%xcc,	%l0,	%g5
	fmul8ulx16	%f30,	%f20,	%f4
	subc	%o0,	%l3,	%l4
	xnorcc	%i6,	0x15C5,	%g2
	addcc	%g3,	%o3,	%i7
	movpos	%icc,	%g4,	%o5
	edge32l	%i0,	%i5,	%g1
	addc	%o2,	%l2,	%o6
	subc	%i3,	%l1,	%l6
	edge16ln	%o1,	%o4,	%i1
	fmovd	%f12,	%f28
	movn	%xcc,	%o7,	%i4
	sethi	0x00FC,	%g7
	ldx	[%l7 + 0x60],	%l5
	mulscc	%i2,	0x0034,	%l0
	addccc	%g5,	%g6,	%l3
	movgu	%icc,	%o0,	%i6
	edge16l	%l4,	%g2,	%g3
	std	%f10,	[%l7 + 0x58]
	edge32ln	%i7,	%g4,	%o3
	nop
	set	0x18, %i2
	ldd	[%l7 + %i2],	%f8
	fxors	%f22,	%f4,	%f19
	mulscc	%i0,	0x189E,	%o5
	udivcc	%i5,	0x136D,	%o2
	fpack32	%f2,	%f8,	%f14
	edge32	%g1,	%o6,	%l2
	subcc	%i3,	%l6,	%l1
	umulcc	%o1,	0x14DF,	%o4
	andcc	%i1,	0x0AB1,	%i4
	sth	%g7,	[%l7 + 0x26]
	edge16ln	%l5,	%o7,	%l0
	addcc	%i2,	%g5,	%g6
	fornot1	%f14,	%f0,	%f14
	fmovdvs	%xcc,	%f27,	%f10
	andn	%l3,	%o0,	%i6
	orn	%g2,	0x03DC,	%l4
	sra	%g3,	%i7,	%g4
	ldsb	[%l7 + 0x77],	%o3
	movneg	%xcc,	%i0,	%i5
	sll	%o2,	%g1,	%o6
	alignaddrl	%o5,	%i3,	%l6
	orncc	%l2,	0x12C0,	%o1
	fcmpne32	%f10,	%f14,	%l1
	sdivx	%o4,	0x0234,	%i1
	fmovdcs	%icc,	%f15,	%f5
	nop
	set	0x60, %o4
	stw	%i4,	[%l7 + %o4]
	movg	%icc,	%l5,	%g7
	alignaddr	%l0,	%i2,	%o7
	addc	%g5,	%g6,	%l3
	addc	%i6,	0x0AC9,	%g2
	fmovdleu	%xcc,	%f29,	%f23
	ldx	[%l7 + 0x58],	%l4
	fsrc1	%f22,	%f6
	smulcc	%g3,	0x0E8C,	%i7
	andn	%o0,	%g4,	%o3
	fxnor	%f20,	%f20,	%f20
	fnand	%f14,	%f4,	%f28
	fxor	%f14,	%f26,	%f14
	sub	%i5,	%o2,	%g1
	fmovdvs	%xcc,	%f25,	%f30
	lduh	[%l7 + 0x1E],	%o6
	addc	%o5,	0x18BC,	%i0
	smulcc	%i3,	0x0726,	%l2
	smulcc	%l6,	%l1,	%o1
	xnor	%i1,	0x15C7,	%i4
	edge16n	%o4,	%g7,	%l5
	umulcc	%l0,	%o7,	%i2
	mulx	%g6,	%g5,	%l3
	xorcc	%i6,	0x0D94,	%l4
	movcc	%xcc,	%g2,	%i7
	stw	%g3,	[%l7 + 0x5C]
	sdivx	%o0,	0x0F81,	%g4
	ldub	[%l7 + 0x1A],	%o3
	edge16l	%i5,	%g1,	%o6
	smul	%o5,	0x0C9B,	%i0
	st	%f1,	[%l7 + 0x64]
	alignaddrl	%o2,	%l2,	%l6
	subcc	%i3,	%l1,	%i1
	movne	%icc,	%o1,	%i4
	fands	%f15,	%f31,	%f6
	fnand	%f14,	%f2,	%f2
	alignaddrl	%o4,	%l5,	%g7
	udivx	%l0,	0x1F29,	%i2
	fcmpeq32	%f16,	%f20,	%g6
	alignaddr	%o7,	%l3,	%g5
	or	%l4,	%i6,	%i7
	movvc	%xcc,	%g2,	%o0
	array16	%g4,	%o3,	%g3
	movgu	%xcc,	%i5,	%g1
	movre	%o6,	%o5,	%i0
	mulx	%o2,	0x0228,	%l6
	edge8n	%i3,	%l2,	%i1
	ldub	[%l7 + 0x7C],	%o1
	umulcc	%l1,	0x10E5,	%i4
	andcc	%o4,	%l5,	%g7
	srl	%l0,	%i2,	%o7
	movn	%icc,	%l3,	%g6
	umulcc	%l4,	%i6,	%g5
	smul	%g2,	0x0C41,	%o0
	popc	0x0CD6,	%g4
	add	%i7,	%g3,	%i5
	alignaddr	%o3,	%o6,	%g1
	ldub	[%l7 + 0x42],	%o5
	movpos	%xcc,	%i0,	%l6
	movg	%xcc,	%o2,	%i3
	fcmpd	%fcc0,	%f24,	%f24
	subc	%i1,	0x1689,	%o1
	lduh	[%l7 + 0x0A],	%l2
	movcs	%xcc,	%l1,	%i4
	movcc	%icc,	%o4,	%l5
	smulcc	%l0,	%i2,	%o7
	udivcc	%l3,	0x116E,	%g7
	fmuld8ulx16	%f11,	%f5,	%f6
	edge32l	%g6,	%i6,	%l4
	fnegs	%f6,	%f23
	ldsw	[%l7 + 0x14],	%g2
	fnands	%f18,	%f0,	%f16
	array32	%o0,	%g4,	%g5
	xnorcc	%g3,	%i7,	%o3
	save %i5, %o6, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16ln	%i0,	%l6,	%o2
	andncc	%o5,	%i3,	%o1
	orn	%i1,	0x1C07,	%l1
	edge16	%i4,	%o4,	%l2
	edge16	%l5,	%i2,	%o7
	sethi	0x10CE,	%l3
	fmovsgu	%xcc,	%f12,	%f12
	sdivcc	%l0,	0x1C31,	%g7
	edge8l	%g6,	%l4,	%i6
	fors	%f5,	%f16,	%f28
	fandnot2s	%f29,	%f23,	%f30
	udivcc	%o0,	0x1D70,	%g4
	alignaddrl	%g5,	%g2,	%g3
	sll	%o3,	%i5,	%i7
	sra	%g1,	%o6,	%l6
	movleu	%xcc,	%o2,	%o5
	array16	%i0,	%o1,	%i3
	sdivcc	%l1,	0x0082,	%i4
	addc	%i1,	%o4,	%l5
	udiv	%i2,	0x18F6,	%o7
	edge32ln	%l2,	%l3,	%g7
	movg	%icc,	%l0,	%l4
	fexpand	%f30,	%f24
	sethi	0x1BB5,	%i6
	setx loop_48, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_48: 	fpsub32s	%f0,	%f22,	%f26
	movrlez	%g5,	%g4,	%g2
	udivx	%g3,	0x143C,	%o3
	array32	%i5,	%i7,	%o6
	fmul8x16al	%f10,	%f27,	%f4
	xnorcc	%g1,	0x0B97,	%o2
	edge16n	%l6,	%i0,	%o5
	edge32ln	%i3,	%l1,	%i4
	fnot1	%f20,	%f14
	orncc	%o1,	0x0FE3,	%i1
	andcc	%l5,	%o4,	%o7
	fcmpgt32	%f22,	%f28,	%i2
	umul	%l3,	0x07A6,	%l2
	array16	%l0,	%g7,	%l4
	fcmpd	%fcc3,	%f6,	%f12
	fxors	%f25,	%f5,	%f2
	fmovsge	%icc,	%f23,	%f8
	ldx	[%l7 + 0x60],	%g6
	ldx	[%l7 + 0x78],	%i6
	mova	%xcc,	%g5,	%g4
	stw	%o0,	[%l7 + 0x1C]
	alignaddrl	%g3,	%g2,	%i5
	addc	%o3,	%o6,	%g1
	srlx	%i7,	%o2,	%l6
	nop
	set	0x60, %g1
	ldd	[%l7 + %g1],	%f20
	array16	%o5,	%i3,	%l1
	sth	%i4,	[%l7 + 0x72]
	edge32ln	%o1,	%i1,	%i0
	fmovsgu	%xcc,	%f2,	%f31
	array8	%o4,	%o7,	%l5
	srl	%l3,	0x04,	%i2
	srl	%l2,	%l0,	%l4
	addc	%g7,	%i6,	%g5
	fone	%f28
	srlx	%g4,	%g6,	%g3
	movrgez	%o0,	0x278,	%i5
	fmovrdlez	%g2,	%f18,	%f2
	fmovdl	%icc,	%f12,	%f3
	edge8	%o6,	%o3,	%g1
	and	%o2,	0x124D,	%i7
	ldsw	[%l7 + 0x38],	%l6
	fandnot1s	%f2,	%f30,	%f1
	or	%i3,	0x1C08,	%o5
	fnot2s	%f2,	%f17
	srlx	%i4,	%l1,	%i1
	sdiv	%o1,	0x0713,	%o4
	sra	%o7,	%l5,	%l3
	fmovrsgz	%i0,	%f22,	%f14
	movl	%xcc,	%i2,	%l2
	ld	[%l7 + 0x78],	%f5
	movl	%xcc,	%l4,	%l0
	addcc	%g7,	0x1D5E,	%i6
	edge32l	%g4,	%g6,	%g3
	ldsw	[%l7 + 0x3C],	%g5
	fpsub16s	%f18,	%f4,	%f9
	udivx	%i5,	0x1EC9,	%o0
	st	%f8,	[%l7 + 0x6C]
	edge8ln	%o6,	%o3,	%g1
	udiv	%o2,	0x0696,	%g2
	smulcc	%l6,	0x1518,	%i3
	edge8	%o5,	%i4,	%l1
	smulcc	%i7,	0x0E0E,	%o1
	mulscc	%o4,	%o7,	%l5
	edge8ln	%i1,	%i0,	%l3
	array8	%i2,	%l2,	%l4
	fmovsne	%icc,	%f28,	%f9
	nop
	set	0x58, %l6
	ldx	[%l7 + %l6],	%g7
	addc	%i6,	%g4,	%l0
	fmovdge	%xcc,	%f0,	%f4
	edge8n	%g6,	%g5,	%i5
	alignaddrl	%o0,	%g3,	%o3
	restore %o6, 0x0D1C, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlz	%g2,	%l6,	%i3
	andn	%o5,	%o2,	%i4
	array32	%l1,	%o1,	%i7
	xnor	%o4,	0x04C3,	%l5
	ldub	[%l7 + 0x11],	%o7
	fxors	%f25,	%f20,	%f20
	orcc	%i1,	0x01EB,	%i0
	edge16	%l3,	%i2,	%l2
	mulx	%l4,	0x12E6,	%i6
	movgu	%xcc,	%g4,	%l0
	movgu	%icc,	%g7,	%g5
	edge16	%g6,	%i5,	%g3
	movne	%xcc,	%o3,	%o0
	fmovdn	%xcc,	%f25,	%f23
	fmovrdgz	%o6,	%f28,	%f26
	xnorcc	%g1,	0x1128,	%g2
	fmovsvs	%xcc,	%f12,	%f3
	edge8n	%l6,	%o5,	%o2
	srlx	%i3,	0x0F,	%i4
	fmovdg	%xcc,	%f16,	%f24
	mulx	%o1,	%i7,	%l1
	sra	%l5,	0x1E,	%o7
	edge8	%o4,	%i0,	%i1
	subc	%l3,	%i2,	%l4
	edge8	%l2,	%g4,	%l0
	ldub	[%l7 + 0x1C],	%i6
	fxors	%f25,	%f31,	%f30
	edge8l	%g7,	%g6,	%g5
	edge32l	%g3,	%o3,	%o0
	udivcc	%i5,	0x042C,	%o6
	srl	%g1,	%l6,	%o5
	sth	%g2,	[%l7 + 0x70]
	edge16l	%o2,	%i3,	%i4
	fmovspos	%xcc,	%f10,	%f15
	movne	%icc,	%i7,	%o1
	edge8l	%l1,	%l5,	%o7
	addcc	%o4,	%i1,	%l3
	ldub	[%l7 + 0x3C],	%i2
	ldsb	[%l7 + 0x1C],	%i0
	fmovdcc	%icc,	%f7,	%f4
	fnot1	%f16,	%f0
	srax	%l4,	0x0D,	%l2
	edge16n	%l0,	%i6,	%g4
	alignaddr	%g7,	%g6,	%g5
	fmovrdgez	%o3,	%f10,	%f14
	edge16	%g3,	%o0,	%o6
	orncc	%i5,	%g1,	%l6
	sllx	%g2,	%o2,	%i3
	xnor	%i4,	0x0B4D,	%o5
	fmovdpos	%xcc,	%f12,	%f18
	edge16l	%o1,	%l1,	%i7
	sdivx	%l5,	0x027A,	%o7
	xnor	%i1,	%l3,	%o4
	xnorcc	%i2,	0x0A30,	%l4
	movle	%xcc,	%l2,	%i0
	edge32n	%l0,	%i6,	%g4
	fsrc2	%f18,	%f8
	addc	%g7,	0x011B,	%g6
	fmovdgu	%icc,	%f30,	%f18
	movg	%icc,	%g5,	%o3
	subcc	%g3,	%o6,	%i5
	edge16	%g1,	%l6,	%o0
	movre	%o2,	0x347,	%i3
	xor	%i4,	%g2,	%o1
	ldub	[%l7 + 0x2C],	%l1
	xorcc	%i7,	0x1F2C,	%o5
	add	%l5,	%o7,	%i1
	andcc	%o4,	0x08A2,	%l3
	sllx	%i2,	%l4,	%l2
	addccc	%l0,	0x1697,	%i6
	sdiv	%g4,	0x1CC6,	%i0
	xor	%g6,	%g5,	%o3
	edge8	%g3,	%o6,	%g7
	edge16l	%g1,	%i5,	%l6
	addcc	%o2,	%o0,	%i4
	movleu	%icc,	%g2,	%i3
	edge16n	%o1,	%i7,	%l1
	umul	%l5,	%o7,	%o5
	smulcc	%o4,	%i1,	%l3
	setx loop_49, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_49: 	edge32l	%l0,	%i2,	%g4
	sdivcc	%i0,	0x0FBC,	%i6
	fpmerge	%f17,	%f12,	%f30
	array32	%g6,	%o3,	%g5
	stb	%o6,	[%l7 + 0x27]
	sdivx	%g3,	0x0A46,	%g1
	array32	%g7,	%l6,	%o2
	fmovdpos	%xcc,	%f21,	%f20
	orcc	%i5,	%i4,	%g2
	movrne	%o0,	0x337,	%i3
	andcc	%o1,	%i7,	%l5
	stb	%o7,	[%l7 + 0x2A]
	srax	%o5,	0x13,	%l1
	array8	%o4,	%l3,	%i1
	andn	%l2,	%l0,	%i2
	smul	%g4,	%i0,	%l4
	array16	%i6,	%o3,	%g6
	fmovsne	%xcc,	%f14,	%f8
	fnot1	%f6,	%f10
	std	%f22,	[%l7 + 0x40]
	subc	%g5,	%o6,	%g3
	fmovsneg	%icc,	%f9,	%f23
	movne	%xcc,	%g7,	%l6
	std	%f12,	[%l7 + 0x68]
	andcc	%o2,	%g1,	%i4
	popc	0x0AEF,	%g2
	orncc	%i5,	0x10A0,	%i3
	fmovrse	%o1,	%f24,	%f7
	sdivcc	%i7,	0x1838,	%l5
	andncc	%o7,	%o5,	%o0
	mova	%icc,	%o4,	%l3
	movcs	%icc,	%i1,	%l1
	ldd	[%l7 + 0x10],	%l0
	edge32n	%i2,	%g4,	%l2
	fornot1s	%f3,	%f20,	%f24
	srlx	%l4,	0x1C,	%i6
	fornot2	%f30,	%f14,	%f28
	fcmpeq16	%f16,	%f28,	%i0
	fmovrdgz	%o3,	%f18,	%f26
	movgu	%icc,	%g5,	%g6
	edge16n	%o6,	%g7,	%g3
	movleu	%xcc,	%l6,	%o2
	fmul8x16au	%f2,	%f2,	%f2
	fzeros	%f18
	sth	%g1,	[%l7 + 0x78]
	sdivcc	%g2,	0x189E,	%i4
	fmul8sux16	%f10,	%f2,	%f28
	fmovsge	%icc,	%f1,	%f24
	fnot2	%f10,	%f22
	andn	%i3,	%i5,	%o1
	andncc	%l5,	%o7,	%o5
	andcc	%o0,	0x1346,	%o4
	edge16n	%i7,	%l3,	%i1
	movl	%icc,	%l1,	%l0
	fsrc1	%f30,	%f30
	array8	%g4,	%i2,	%l2
	ldsh	[%l7 + 0x78],	%i6
	orncc	%i0,	%l4,	%o3
	subc	%g5,	0x1312,	%g6
	edge32l	%g7,	%g3,	%l6
	movre	%o2,	0x07F,	%g1
	movneg	%xcc,	%g2,	%i4
	move	%xcc,	%i3,	%i5
	stb	%o1,	[%l7 + 0x76]
	andcc	%l5,	0x1B09,	%o7
	sethi	0x1E07,	%o6
	save %o0, 0x15BC, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	popc	%o5,	%l3
	xor	%i1,	0x0449,	%l1
	fpsub32	%f0,	%f20,	%f22
	move	%xcc,	%i7,	%l0
	movrne	%g4,	%i2,	%i6
	lduw	[%l7 + 0x50],	%l2
	movcs	%icc,	%i0,	%o3
	or	%g5,	0x1B92,	%l4
	fzero	%f28
	or	%g6,	0x04CF,	%g3
	movneg	%icc,	%l6,	%g7
	fnot1s	%f31,	%f14
	fzeros	%f6
	orn	%g1,	%o2,	%g2
	movne	%xcc,	%i4,	%i3
	ldd	[%l7 + 0x10],	%i4
	movpos	%xcc,	%o1,	%o7
	udiv	%o6,	0x15AE,	%l5
	udivcc	%o4,	0x0D39,	%o5
	alignaddrl	%o0,	%i1,	%l1
	addccc	%l3,	%l0,	%g4
	umulcc	%i2,	%i6,	%l2
	fmovrdlz	%i7,	%f30,	%f30
	popc	0x16E9,	%o3
	fnands	%f13,	%f28,	%f8
	sdiv	%i0,	0x0631,	%l4
	movrgez	%g6,	0x162,	%g3
	umul	%g5,	%g7,	%g1
	save %l6, 0x1CE6, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%g2,	%i3
	subc	%i4,	%o1,	%o7
	addc	%o6,	%i5,	%o4
	smulcc	%l5,	%o5,	%o0
	sdivx	%l1,	0x06EB,	%i1
	fmovdne	%icc,	%f12,	%f18
	mulscc	%l3,	%g4,	%i2
	fmovrdne	%i6,	%f0,	%f30
	lduh	[%l7 + 0x1C],	%l0
	movge	%xcc,	%i7,	%o3
	restore %i0, 0x13B5, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivx	%g6,	0x0858,	%l4
	movcc	%xcc,	%g5,	%g3
	addcc	%g1,	0x19E7,	%g7
	ldsh	[%l7 + 0x3E],	%l6
	nop
	set	0x26, %o0
	ldsb	[%l7 + %o0],	%o2
	andn	%g2,	0x0E14,	%i3
	sra	%o1,	0x11,	%o7
	fmovse	%icc,	%f3,	%f2
	edge8	%i4,	%o6,	%i5
	fmovrdgz	%o4,	%f16,	%f12
	array16	%l5,	%o5,	%l1
	fmovsa	%icc,	%f18,	%f16
	lduw	[%l7 + 0x74],	%i1
	movrlez	%o0,	%l3,	%i2
	fsrc1	%f14,	%f0
	fmovsa	%xcc,	%f1,	%f22
	fmovs	%f8,	%f11
	andncc	%g4,	%l0,	%i7
	fpsub16s	%f21,	%f25,	%f13
	udiv	%i6,	0x0295,	%i0
	sth	%l2,	[%l7 + 0x18]
	addcc	%o3,	%l4,	%g6
	and	%g3,	0x1B34,	%g5
	ldx	[%l7 + 0x78],	%g7
	subcc	%l6,	%g1,	%o2
	lduh	[%l7 + 0x16],	%i3
	fmovdcs	%icc,	%f31,	%f13
	andcc	%o1,	0x004F,	%o7
	orn	%g2,	%i4,	%o6
	sdivx	%i5,	0x1804,	%l5
	fnot1s	%f29,	%f8
	edge16ln	%o4,	%o5,	%i1
	stx	%l1,	[%l7 + 0x18]
	ldub	[%l7 + 0x6B],	%l3
	fsrc2s	%f11,	%f20
	movn	%xcc,	%o0,	%i2
	edge32l	%l0,	%g4,	%i7
	edge16	%i0,	%l2,	%i6
	mulscc	%l4,	%o3,	%g3
	sth	%g6,	[%l7 + 0x0E]
	orncc	%g5,	%l6,	%g1
	edge32	%g7,	%i3,	%o1
	udiv	%o7,	0x1CD6,	%o2
	setx loop_50, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_50: 	udivx	%o6,	0x0CF9,	%o4
	udiv	%o5,	0x1A58,	%i1
	sub	%l5,	0x0E20,	%l3
	subcc	%l1,	%i2,	%o0
	ldsw	[%l7 + 0x50],	%g4
	popc	0x1833,	%i7
	ldd	[%l7 + 0x50],	%f26
	sub	%i0,	0x1034,	%l2
	addccc	%l0,	%i6,	%l4
	movvc	%icc,	%o3,	%g6
	orcc	%g3,	%l6,	%g5
	array32	%g7,	%g1,	%o1
	smulcc	%o7,	0x0643,	%i3
	udivx	%o2,	0x1058,	%i4
	save %g2, 0x075C, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvs	%xcc,	%o4,	%o5
	and	%i5,	0x1B85,	%l5
	andcc	%l3,	%l1,	%i1
	edge8l	%o0,	%g4,	%i2
	std	%f26,	[%l7 + 0x28]
	udivcc	%i0,	0x1059,	%i7
	movge	%xcc,	%l2,	%l0
	fpsub16	%f24,	%f2,	%f30
	nop
	set	0x38, %l4
	ldsw	[%l7 + %l4],	%i6
	xorcc	%o3,	%g6,	%l4
	stw	%g3,	[%l7 + 0x14]
	movl	%icc,	%l6,	%g5
	mova	%icc,	%g7,	%o1
	orcc	%g1,	0x05B8,	%o7
	edge8l	%i3,	%i4,	%g2
	array32	%o2,	%o4,	%o5
	std	%f28,	[%l7 + 0x38]
	nop
	set	0x34, %l1
	ldsb	[%l7 + %l1],	%o6
	fmovrdne	%l5,	%f16,	%f12
	edge8ln	%l3,	%i5,	%i1
	movl	%icc,	%o0,	%g4
	mulx	%i2,	0x0DC8,	%i0
	sdiv	%i7,	0x16FE,	%l2
	mulscc	%l0,	0x03B5,	%l1
	edge16n	%o3,	%i6,	%g6
	fpmerge	%f26,	%f30,	%f4
	addc	%g3,	0x1DE0,	%l6
	ldsb	[%l7 + 0x6E],	%g5
	ldub	[%l7 + 0x36],	%l4
	fcmple32	%f10,	%f18,	%o1
	fmovdge	%icc,	%f28,	%f10
	mulscc	%g1,	%o7,	%i3
	nop
	set	0x08, %g3
	stx	%i4,	[%l7 + %g3]
	sir	0x1C21
	alignaddr	%g2,	%o2,	%g7
	or	%o5,	%o4,	%o6
	edge8n	%l5,	%i5,	%i1
	movge	%xcc,	%l3,	%g4
	or	%o0,	%i2,	%i7
	sll	%i0,	0x07,	%l0
	subccc	%l1,	%o3,	%l2
	ldd	[%l7 + 0x68],	%g6
	addc	%g3,	%i6,	%l6
	smulcc	%l4,	0x0D98,	%o1
	movcs	%icc,	%g1,	%g5
	edge16n	%i3,	%o7,	%i4
	popc	0x1642,	%g2
	fmovdneg	%icc,	%f23,	%f15
	fmovrde	%o2,	%f0,	%f10
	mova	%icc,	%o5,	%o4
	movgu	%icc,	%o6,	%g7
	fornot2	%f14,	%f30,	%f8
	mulscc	%l5,	%i1,	%i5
	udivcc	%g4,	0x1FCA,	%l3
	srl	%o0,	0x1B,	%i7
	fmovsgu	%icc,	%f16,	%f12
	movn	%icc,	%i2,	%l0
	srl	%l1,	%o3,	%l2
	movneg	%icc,	%i0,	%g6
	movrgez	%g3,	0x39F,	%l6
	fcmpgt32	%f22,	%f28,	%i6
	edge16n	%l4,	%o1,	%g5
	udivcc	%i3,	0x176A,	%o7
	fsrc2s	%f26,	%f17
	ldub	[%l7 + 0x6C],	%i4
	sethi	0x01E3,	%g2
	array32	%g1,	%o5,	%o2
	edge32n	%o6,	%o4,	%g7
	sethi	0x1A6B,	%i1
	restore %l5, 0x18F3, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrslez	%l3,	%f16,	%f10
	movneg	%icc,	%i5,	%i7
	fnand	%f30,	%f14,	%f12
	smul	%i2,	0x0661,	%o0
	fmovrdlez	%l0,	%f0,	%f14
	fmovdneg	%xcc,	%f31,	%f21
	umulcc	%l1,	0x15D7,	%o3
	srl	%l2,	%i0,	%g3
	movrgz	%l6,	0x019,	%g6
	or	%i6,	%l4,	%o1
	edge32	%g5,	%o7,	%i4
	andcc	%i3,	0x053B,	%g1
	ld	[%l7 + 0x14],	%f17
	ld	[%l7 + 0x78],	%f4
	array16	%g2,	%o5,	%o2
	umul	%o6,	%o4,	%i1
	movl	%xcc,	%l5,	%g4
	alignaddr	%l3,	%i5,	%g7
	addccc	%i7,	%i2,	%o0
	edge32l	%l1,	%l0,	%o3
	movge	%icc,	%i0,	%l2
	sllx	%l6,	%g6,	%g3
	fones	%f29
	orn	%i6,	%o1,	%l4
	movpos	%xcc,	%o7,	%i4
	movn	%xcc,	%g5,	%i3
	edge32ln	%g1,	%o5,	%g2
	srax	%o6,	%o4,	%o2
	srlx	%l5,	0x0C,	%g4
	movrlz	%l3,	0x1F0,	%i5
	xorcc	%g7,	0x0864,	%i7
	fnands	%f9,	%f17,	%f16
	sra	%i2,	0x0E,	%i1
	udivcc	%l1,	0x00C8,	%o0
	andncc	%o3,	%l0,	%i0
	nop
	set	0x20, %i5
	stw	%l2,	[%l7 + %i5]
	movge	%xcc,	%g6,	%l6
	movgu	%xcc,	%i6,	%g3
	fpsub32	%f18,	%f4,	%f8
	subc	%l4,	%o1,	%o7
	sra	%g5,	%i3,	%i4
	edge16n	%g1,	%g2,	%o6
	sethi	0x1BF5,	%o4
	save %o2, %l5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldub	[%l7 + 0x31],	%g4
	fmovrsgez	%l3,	%f5,	%f21
	edge32	%g7,	%i7,	%i2
	edge32n	%i1,	%i5,	%o0
	for	%f18,	%f12,	%f0
	ldsh	[%l7 + 0x18],	%o3
	stx	%l1,	[%l7 + 0x08]
	movle	%xcc,	%i0,	%l2
	fcmps	%fcc1,	%f31,	%f5
	movle	%icc,	%g6,	%l6
	sth	%i6,	[%l7 + 0x62]
	sethi	0x0BBF,	%g3
	movl	%icc,	%l0,	%o1
	srax	%l4,	%g5,	%o7
	fabsd	%f4,	%f28
	stw	%i4,	[%l7 + 0x28]
	addc	%i3,	%g2,	%o6
	smulcc	%g1,	%o4,	%o2
	sethi	0x0A07,	%l5
	ldub	[%l7 + 0x2B],	%o5
	movge	%xcc,	%l3,	%g7
	movrlez	%g4,	%i2,	%i1
	st	%f2,	[%l7 + 0x48]
	sllx	%i7,	0x1F,	%i5
	movle	%icc,	%o3,	%o0
	lduw	[%l7 + 0x1C],	%l1
	addc	%i0,	0x1B22,	%g6
	and	%l6,	%i6,	%l2
	xnor	%g3,	0x1673,	%o1
	movgu	%xcc,	%l4,	%g5
	fnegs	%f12,	%f13
	andncc	%l0,	%o7,	%i3
	fpack16	%f2,	%f24
	andncc	%g2,	%o6,	%g1
	movrne	%i4,	0x104,	%o4
	xnorcc	%l5,	0x1F60,	%o2
	fmovdne	%xcc,	%f27,	%f19
	fones	%f0
	fmovrdlz	%o5,	%f26,	%f28
	fsrc1	%f10,	%f12
	ldx	[%l7 + 0x28],	%l3
	st	%f10,	[%l7 + 0x78]
	movl	%icc,	%g4,	%g7
	fmul8ulx16	%f10,	%f14,	%f30
	mova	%xcc,	%i1,	%i7
	movneg	%xcc,	%i5,	%o3
	edge16	%o0,	%l1,	%i2
	fmovdcs	%icc,	%f28,	%f27
	std	%f28,	[%l7 + 0x10]
	movrlez	%i0,	%l6,	%g6
	srl	%l2,	%i6,	%o1
	sdivx	%l4,	0x1870,	%g3
	xnor	%l0,	0x1D6C,	%g5
	movl	%xcc,	%i3,	%g2
	fsrc2	%f14,	%f28
	edge8	%o6,	%o7,	%g1
	subcc	%i4,	0x1733,	%o4
	movvs	%xcc,	%o2,	%l5
	st	%f1,	[%l7 + 0x30]
	movre	%o5,	0x17D,	%l3
	ld	[%l7 + 0x4C],	%f15
	movrgez	%g7,	0x2E4,	%g4
	orcc	%i7,	0x0DB6,	%i1
	movleu	%icc,	%i5,	%o3
	mulx	%o0,	%i2,	%i0
	ldsh	[%l7 + 0x70],	%l1
	andn	%l6,	0x153D,	%g6
	and	%i6,	%o1,	%l2
	movcc	%xcc,	%g3,	%l4
	for	%f10,	%f2,	%f4
	std	%f14,	[%l7 + 0x38]
	movne	%icc,	%l0,	%i3
	ld	[%l7 + 0x0C],	%f15
	umul	%g5,	%o6,	%g2
	fpsub16	%f6,	%f8,	%f8
	addcc	%o7,	%g1,	%i4
	fmovsge	%xcc,	%f17,	%f0
	movpos	%icc,	%o4,	%o2
	save %l5, %l3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srlx	%g4,	0x00,	%o5
	srax	%i1,	%i5,	%o3
	orncc	%o0,	%i2,	%i0
	std	%f6,	[%l7 + 0x68]
	and	%i7,	0x0BCA,	%l6
	fexpand	%f2,	%f4
	lduw	[%l7 + 0x08],	%l1
	array32	%g6,	%o1,	%l2
	movvs	%icc,	%g3,	%l4
	movl	%icc,	%i6,	%i3
	sdivx	%l0,	0x0995,	%g5
	ld	[%l7 + 0x60],	%f25
	array32	%o6,	%g2,	%o7
	save %i4, %g1, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%l5,	0x06A1,	%o2
	andcc	%l3,	%g7,	%g4
	save %i1, %i5, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdcs	%xcc,	%f3,	%f16
	andcc	%o5,	0x1353,	%i2
	fmovsg	%icc,	%f18,	%f27
	movrne	%o0,	%i0,	%i7
	lduh	[%l7 + 0x38],	%l1
	sdivcc	%l6,	0x1D50,	%g6
	movrgez	%l2,	0x300,	%g3
	ldsw	[%l7 + 0x14],	%o1
	sdivcc	%i6,	0x1A53,	%i3
	mulscc	%l0,	%l4,	%o6
	sllx	%g5,	%g2,	%i4
	movrgz	%g1,	%o4,	%l5
	orn	%o2,	%l3,	%g7
	fabsd	%f8,	%f22
	fandnot2s	%f3,	%f27,	%f2
	movrlez	%o7,	0x173,	%g4
	sdiv	%i5,	0x0418,	%o3
	sir	0x0A82
	sethi	0x028F,	%o5
	stx	%i1,	[%l7 + 0x60]
	edge16	%o0,	%i0,	%i7
	sdiv	%i2,	0x06FE,	%l6
	edge16l	%g6,	%l1,	%l2
	movg	%xcc,	%o1,	%g3
	edge8ln	%i6,	%i3,	%l0
	edge16l	%l4,	%o6,	%g2
	andcc	%i4,	%g5,	%g1
	xorcc	%o4,	%l5,	%l3
	sllx	%o2,	%g7,	%o7
	array32	%i5,	%o3,	%g4
	fone	%f22
	movl	%icc,	%o5,	%o0
	edge8ln	%i1,	%i0,	%i2
	or	%i7,	%g6,	%l6
	smul	%l2,	0x173D,	%o1
	andncc	%g3,	%i6,	%l1
	edge32n	%l0,	%i3,	%l4
	edge32l	%o6,	%i4,	%g2
	nop
	set	0x50, %i3
	ldd	[%l7 + %i3],	%f30
	stw	%g5,	[%l7 + 0x50]
	umulcc	%g1,	%o4,	%l5
	fcmpne32	%f20,	%f8,	%o2
	addcc	%g7,	0x1270,	%l3
	fxnors	%f19,	%f2,	%f15
	fmovdl	%icc,	%f9,	%f6
	smul	%i5,	%o3,	%o7
	edge16l	%o5,	%g4,	%o0
	fmovsleu	%xcc,	%f10,	%f4
	ldub	[%l7 + 0x74],	%i0
	edge16ln	%i1,	%i7,	%g6
	ldsb	[%l7 + 0x55],	%l6
	nop
	set	0x7C, %g6
	ldsw	[%l7 + %g6],	%l2
	fcmpd	%fcc3,	%f6,	%f10
	edge16l	%o1,	%g3,	%i6
	lduw	[%l7 + 0x74],	%l1
	udivcc	%l0,	0x0A5A,	%i2
	ld	[%l7 + 0x2C],	%f5
	xor	%i3,	0x0DE7,	%o6
	fmovdleu	%xcc,	%f9,	%f1
	subccc	%l4,	%i4,	%g2
	movne	%icc,	%g1,	%g5
	add	%l5,	%o4,	%o2
	xnorcc	%l3,	%g7,	%i5
	movl	%xcc,	%o3,	%o5
	movrlz	%o7,	0x161,	%g4
	add	%o0,	%i0,	%i7
	andcc	%i1,	0x18BF,	%g6
	sllx	%l6,	0x1C,	%o1
	ldsb	[%l7 + 0x41],	%l2
	movrlz	%i6,	%l1,	%g3
	xor	%i2,	%i3,	%o6
	edge8l	%l4,	%i4,	%g2
	fone	%f30
	ldd	[%l7 + 0x78],	%f12
	fsrc1s	%f2,	%f14
	fpackfix	%f6,	%f30
	movrlez	%g1,	%l0,	%g5
	xorcc	%l5,	0x03CC,	%o4
	stw	%o2,	[%l7 + 0x10]
	mulscc	%l3,	%g7,	%i5
	and	%o5,	0x09DD,	%o7
	ldx	[%l7 + 0x58],	%g4
	or	%o0,	%i0,	%i7
	movrlez	%i1,	%g6,	%o3
	movge	%xcc,	%o1,	%l2
	edge32l	%i6,	%l1,	%l6
	fnors	%f12,	%f22,	%f31
	edge32	%i2,	%g3,	%o6
	movrlez	%l4,	%i3,	%i4
	fmul8ulx16	%f6,	%f8,	%f4
	edge32	%g1,	%l0,	%g5
	stb	%l5,	[%l7 + 0x2A]
	andcc	%o4,	0x0E41,	%g2
	srax	%o2,	%g7,	%l3
	fandnot1s	%f3,	%f24,	%f0
	xnor	%i5,	0x0973,	%o5
	edge16	%g4,	%o7,	%i0
	ldd	[%l7 + 0x58],	%f14
	movneg	%xcc,	%o0,	%i7
	sdivcc	%g6,	0x0520,	%o3
	fmovdcc	%icc,	%f18,	%f12
	sth	%i1,	[%l7 + 0x5A]
	edge16	%l2,	%o1,	%i6
	fcmple16	%f14,	%f4,	%l6
	udiv	%l1,	0x1579,	%g3
	sll	%o6,	0x19,	%i2
	fpsub32s	%f19,	%f22,	%f30
	subc	%i3,	0x089C,	%l4
	sethi	0x1561,	%i4
	array8	%l0,	%g5,	%l5
	ldx	[%l7 + 0x20],	%o4
	srax	%g1,	0x18,	%g2
	ldsb	[%l7 + 0x79],	%g7
	subcc	%o2,	%l3,	%i5
	smulcc	%o5,	%g4,	%i0
	alignaddrl	%o0,	%i7,	%g6
	array8	%o7,	%o3,	%l2
	subccc	%i1,	0x0083,	%i6
	ldsb	[%l7 + 0x0D],	%l6
	sdiv	%o1,	0x1D82,	%l1
	edge16l	%o6,	%g3,	%i2
	ld	[%l7 + 0x34],	%f6
	array16	%i3,	%i4,	%l0
	fcmps	%fcc2,	%f18,	%f21
	movn	%xcc,	%l4,	%l5
	fmovda	%icc,	%f23,	%f1
	stx	%o4,	[%l7 + 0x30]
	fmul8sux16	%f14,	%f28,	%f16
	fxors	%f23,	%f8,	%f22
	fnot2s	%f20,	%f15
	sdiv	%g5,	0x1FDA,	%g1
	addccc	%g7,	0x0C88,	%o2
	srax	%g2,	%i5,	%l3
	movrgez	%g4,	%i0,	%o5
	fcmps	%fcc1,	%f14,	%f5
	edge16n	%i7,	%o0,	%o7
	ldub	[%l7 + 0x70],	%g6
	addcc	%o3,	%l2,	%i6
	fmuld8ulx16	%f12,	%f5,	%f20
	fnot2	%f26,	%f18
	movge	%xcc,	%l6,	%i1
	fmovdl	%icc,	%f23,	%f18
	fmovdg	%icc,	%f30,	%f11
	udiv	%l1,	0x0320,	%o1
	xnorcc	%o6,	%i2,	%g3
	fcmps	%fcc1,	%f15,	%f12
	fandnot2s	%f14,	%f29,	%f8
	movleu	%xcc,	%i3,	%l0
	stb	%l4,	[%l7 + 0x63]
	fmovda	%xcc,	%f11,	%f15
	subc	%l5,	0x03C6,	%i4
	orncc	%g5,	%g1,	%o4
	movn	%xcc,	%o2,	%g7
	setx loop_51, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_51: 	ldsh	[%l7 + 0x30],	%g4
	edge16l	%l3,	%i0,	%i7
	xorcc	%o0,	%o7,	%g6
	fcmps	%fcc2,	%f25,	%f8
	edge8n	%o3,	%o5,	%i6
	popc	0x0AA3,	%l6
	fandnot2s	%f12,	%f7,	%f15
	sethi	0x1ED7,	%l2
	edge32l	%l1,	%i1,	%o6
	orcc	%i2,	0x089A,	%g3
	fmovdcc	%xcc,	%f0,	%f8
	pdist	%f8,	%f2,	%f20
	array8	%i3,	%o1,	%l0
	ldsw	[%l7 + 0x1C],	%l5
	fsrc1s	%f28,	%f5
	edge8ln	%l4,	%i4,	%g1
	movn	%icc,	%g5,	%o2
	udivx	%o4,	0x1183,	%i5
	movrgz	%g7,	0x23B,	%g4
	ldsh	[%l7 + 0x54],	%g2
	ldsw	[%l7 + 0x24],	%l3
	movcs	%xcc,	%i0,	%o0
	movcc	%xcc,	%i7,	%o7
	fmovrsne	%o3,	%f1,	%f30
	umulcc	%g6,	0x06CD,	%o5
	or	%l6,	%l2,	%l1
	edge32l	%i6,	%i1,	%o6
	fmovscc	%icc,	%f2,	%f4
	movre	%g3,	0x190,	%i2
	fmovdneg	%icc,	%f14,	%f2
	movl	%icc,	%i3,	%o1
	array16	%l0,	%l4,	%i4
	fcmpes	%fcc0,	%f4,	%f6
	add	%l5,	%g1,	%g5
	and	%o2,	0x1580,	%o4
	fcmple16	%f22,	%f24,	%g7
	ldd	[%l7 + 0x68],	%i4
	sll	%g2,	0x0A,	%g4
	sllx	%i0,	%o0,	%i7
	fors	%f28,	%f12,	%f19
	ldsw	[%l7 + 0x24],	%l3
	subcc	%o7,	%g6,	%o5
	ldx	[%l7 + 0x78],	%l6
	nop
	set	0x78, %o7
	stx	%l2,	[%l7 + %o7]
	st	%f21,	[%l7 + 0x64]
	orcc	%l1,	%o3,	%i6
	ldd	[%l7 + 0x08],	%i0
	ldd	[%l7 + 0x10],	%f30
	or	%g3,	0x0F74,	%o6
	srl	%i3,	0x10,	%i2
	srax	%l0,	0x1E,	%o1
	movcs	%icc,	%l4,	%l5
	sdiv	%g1,	0x1405,	%i4
	or	%g5,	%o4,	%g7
	fandnot1	%f2,	%f22,	%f26
	fmovdgu	%icc,	%f16,	%f2
	fcmpne16	%f16,	%f20,	%o2
	orncc	%g2,	%g4,	%i5
	fmovdpos	%xcc,	%f22,	%f13
	fmovscs	%xcc,	%f10,	%f16
	fones	%f11
	movcs	%icc,	%i0,	%o0
	movne	%icc,	%i7,	%o7
	edge8n	%g6,	%l3,	%l6
	array16	%l2,	%l1,	%o3
	stb	%i6,	[%l7 + 0x44]
	array16	%o5,	%i1,	%g3
	fnegs	%f24,	%f3
	addcc	%o6,	%i2,	%i3
	save %o1, %l4, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g1,	%i4
	umul	%g5,	%o4,	%l0
	smulcc	%o2,	0x174C,	%g2
	ldd	[%l7 + 0x60],	%f16
	ldx	[%l7 + 0x08],	%g4
	movg	%xcc,	%g7,	%i5
	nop
	set	0x78, %i4
	ldd	[%l7 + %i4],	%f28
	fmovdn	%icc,	%f24,	%f29
	ldx	[%l7 + 0x38],	%o0
	or	%i0,	0x07B2,	%o7
	std	%f6,	[%l7 + 0x68]
	fnegd	%f18,	%f14
	srlx	%g6,	%l3,	%l6
	mulx	%i7,	%l1,	%o3
	fmovrdgz	%i6,	%f4,	%f18
	sir	0x1FBF
	srl	%l2,	%i1,	%o5
	bshuffle	%f6,	%f6,	%f6
	fmovrsgz	%g3,	%f11,	%f12
	sra	%i2,	%o6,	%i3
	movrne	%l4,	%l5,	%o1
	udiv	%g1,	0x0AC0,	%g5
	nop
	set	0x62, %o5
	stb	%i4,	[%l7 + %o5]
	fmovrdlz	%o4,	%f4,	%f2
	edge32n	%o2,	%l0,	%g2
	udivx	%g7,	0x1103,	%i5
	fmovdg	%icc,	%f7,	%f16
	fmovda	%xcc,	%f29,	%f26
	movcs	%icc,	%o0,	%g4
	ldsb	[%l7 + 0x5D],	%o7
	fmovdleu	%xcc,	%f17,	%f4
	ld	[%l7 + 0x24],	%f24
	movrlz	%i0,	%l3,	%l6
	umulcc	%g6,	0x1D41,	%l1
	edge32ln	%i7,	%i6,	%o3
	fcmped	%fcc2,	%f22,	%f30
	stb	%i1,	[%l7 + 0x2B]
	edge16l	%l2,	%g3,	%i2
	edge32	%o5,	%i3,	%o6
	movvs	%icc,	%l5,	%o1
	smulcc	%g1,	0x1658,	%l4
	ldsw	[%l7 + 0x54],	%i4
	orcc	%g5,	0x1AA0,	%o2
	movl	%icc,	%o4,	%g2
	st	%f27,	[%l7 + 0x68]
	movle	%icc,	%l0,	%i5
	fpadd16s	%f6,	%f24,	%f2
	addc	%g7,	%o0,	%o7
	fzero	%f22
	fpsub16s	%f6,	%f29,	%f6
	sdivcc	%g4,	0x185C,	%l3
	fpack32	%f10,	%f12,	%f20
	movvs	%icc,	%l6,	%g6
	sir	0x1F03
	edge32l	%i0,	%l1,	%i6
	udivcc	%i7,	0x1EFA,	%i1
	or	%o3,	%l2,	%g3
	ldsb	[%l7 + 0x7C],	%o5
	fnands	%f23,	%f21,	%f11
	lduw	[%l7 + 0x10],	%i3
	sir	0x0E4D
	srl	%i2,	0x07,	%l5
	fmovdneg	%xcc,	%f13,	%f20
	add	%o1,	%g1,	%o6
	xor	%i4,	%g5,	%l4
	fcmpne16	%f18,	%f4,	%o2
	umul	%o4,	%g2,	%i5
	fmovrse	%g7,	%f20,	%f10
	udivcc	%l0,	0x0457,	%o0
	sdivx	%o7,	0x1C4F,	%g4
	stx	%l6,	[%l7 + 0x48]
	udiv	%g6,	0x022B,	%i0
	addc	%l1,	%i6,	%l3
	orncc	%i1,	%o3,	%l2
	fmul8sux16	%f0,	%f30,	%f16
	fxnor	%f30,	%f28,	%f18
	edge32n	%i7,	%g3,	%o5
	fsrc1s	%f3,	%f17
	ldub	[%l7 + 0x72],	%i3
	fmuld8sux16	%f21,	%f13,	%f26
	smul	%i2,	%o1,	%l5
	lduh	[%l7 + 0x6A],	%o6
	andn	%g1,	0x0CB4,	%i4
	fmovdcs	%xcc,	%f4,	%f26
	ldsw	[%l7 + 0x38],	%l4
	std	%f0,	[%l7 + 0x40]
	movg	%icc,	%o2,	%o4
	edge16ln	%g5,	%i5,	%g2
	fabss	%f7,	%f1
	lduh	[%l7 + 0x16],	%g7
	addc	%o0,	%o7,	%g4
	xor	%l6,	0x0373,	%g6
	xor	%i0,	%l0,	%i6
	fmovrslez	%l3,	%f4,	%f7
	fors	%f24,	%f13,	%f9
	and	%i1,	%o3,	%l2
	edge16l	%l1,	%g3,	%i7
	nop
	set	0x24, %i7
	lduw	[%l7 + %i7],	%i3
	stx	%o5,	[%l7 + 0x68]
	smulcc	%o1,	%i2,	%l5
	movgu	%icc,	%o6,	%i4
	movge	%xcc,	%g1,	%o2
	movcc	%xcc,	%o4,	%l4
	fmovdg	%xcc,	%f17,	%f24
	movleu	%icc,	%g5,	%g2
	restore %g7, 0x1525, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umulcc	%o7,	%g4,	%o0
	movcs	%xcc,	%l6,	%i0
	fexpand	%f13,	%f8
	array32	%l0,	%i6,	%g6
	fmovdg	%xcc,	%f5,	%f24
	edge8l	%l3,	%i1,	%l2
	array32	%l1,	%o3,	%g3
	movre	%i7,	0x050,	%i3
	xor	%o1,	%o5,	%i2
	edge8l	%l5,	%i4,	%o6
	fmovdcc	%icc,	%f25,	%f25
	sub	%o2,	%o4,	%l4
	alignaddr	%g1,	%g2,	%g5
	movvs	%icc,	%i5,	%o7
	fcmple16	%f24,	%f12,	%g4
	movpos	%xcc,	%g7,	%l6
	popc	0x055B,	%o0
	fmovrse	%i0,	%f28,	%f26
	subccc	%i6,	0x0D06,	%l0
	sdiv	%g6,	0x16C9,	%l3
	andn	%i1,	0x048B,	%l1
	fcmpgt16	%f10,	%f14,	%o3
	sra	%g3,	0x01,	%l2
	fnors	%f1,	%f9,	%f23
	subccc	%i7,	0x116F,	%i3
	fpadd16s	%f13,	%f26,	%f1
	fabsd	%f6,	%f10
	fmovscc	%xcc,	%f23,	%f15
	mulx	%o1,	0x107B,	%i2
	alignaddr	%o5,	%l5,	%o6
	ld	[%l7 + 0x2C],	%f20
	edge8n	%i4,	%o2,	%o4
	fmovdne	%icc,	%f27,	%f24
	fmul8ulx16	%f30,	%f20,	%f6
	movre	%l4,	0x327,	%g1
	srl	%g5,	0x07,	%i5
	movl	%icc,	%g2,	%o7
	movne	%xcc,	%g4,	%g7
	sir	0x082F
	fmovsn	%xcc,	%f23,	%f15
	edge16	%l6,	%i0,	%i6
	smul	%o0,	%l0,	%l3
	sdiv	%g6,	0x1CF1,	%i1
	edge8l	%l1,	%g3,	%o3
	sdivx	%i7,	0x1FC7,	%l2
	stb	%o1,	[%l7 + 0x20]
	sra	%i2,	0x09,	%i3
	setx loop_52, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_52: 	movne	%icc,	%o5,	%i4
	addc	%o2,	%l4,	%o4
	fcmps	%fcc1,	%f4,	%f18
	edge32l	%g1,	%g5,	%i5
	sir	0x0CD9
	edge16l	%g2,	%o7,	%g4
	fmovde	%xcc,	%f12,	%f28
	ldsh	[%l7 + 0x6C],	%l6
	and	%i0,	%i6,	%o0
	sll	%l0,	%g7,	%g6
	movle	%icc,	%l3,	%i1
	sllx	%g3,	0x1E,	%l1
	restore %i7, 0x01A3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l2,	%f26,	%f0
	fxors	%f0,	%f29,	%f13
	ldsw	[%l7 + 0x48],	%o1
	edge32ln	%i2,	%l5,	%o6
	edge16l	%i3,	%i4,	%o2
	sllx	%l4,	%o4,	%g1
	orcc	%o5,	%i5,	%g2
	addccc	%g5,	0x0784,	%g4
	fmovrdlez	%o7,	%f20,	%f16
	movcc	%xcc,	%l6,	%i6
	move	%xcc,	%o0,	%l0
	fors	%f13,	%f20,	%f13
	edge8	%g7,	%g6,	%l3
	movgu	%xcc,	%i0,	%i1
	fnot2s	%f2,	%f0
	subcc	%l1,	0x196F,	%i7
	fmul8x16au	%f23,	%f22,	%f8
	mulx	%g3,	0x056A,	%l2
	movge	%icc,	%o3,	%o1
	sdivx	%i2,	0x14DB,	%o6
	ld	[%l7 + 0x44],	%f29
	ldsw	[%l7 + 0x50],	%l5
	udivx	%i4,	0x0B70,	%i3
	fsrc1s	%f31,	%f11
	edge16l	%l4,	%o2,	%g1
	movrlez	%o5,	%o4,	%g2
	xnor	%i5,	0x19BF,	%g4
	sllx	%o7,	%l6,	%i6
	alignaddrl	%o0,	%l0,	%g5
	movrgez	%g7,	0x3DD,	%l3
	fmovde	%xcc,	%f12,	%f24
	xorcc	%i0,	0x06D5,	%g6
	sll	%l1,	0x17,	%i7
	umulcc	%g3,	0x1D59,	%l2
	movre	%i1,	0x0DA,	%o1
	xorcc	%i2,	0x0CFA,	%o3
	xnorcc	%l5,	0x171F,	%o6
	fmovrsgz	%i3,	%f13,	%f11
	st	%f12,	[%l7 + 0x48]
	edge8	%i4,	%o2,	%l4
	setx loop_53, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_53: 	ldsw	[%l7 + 0x0C],	%g2
	addccc	%g1,	0x1641,	%i5
	fcmpne16	%f6,	%f12,	%g4
	edge16n	%o7,	%l6,	%o0
	sra	%i6,	%g5,	%l0
	sllx	%l3,	%g7,	%g6
	srlx	%l1,	%i0,	%i7
	fcmpne16	%f26,	%f20,	%g3
	sub	%l2,	%o1,	%i1
	movrgz	%i2,	0x11A,	%o3
	andcc	%l5,	%i3,	%i4
	andncc	%o6,	%l4,	%o2
	xor	%o4,	%o5,	%g2
	movneg	%xcc,	%g1,	%i5
	fands	%f27,	%f7,	%f0
	nop
	set	0x6B, %g4
	ldsb	[%l7 + %g4],	%g4
	mulx	%o7,	0x02B6,	%l6
	fmovdle	%xcc,	%f18,	%f20
	sllx	%o0,	%g5,	%i6
	ldx	[%l7 + 0x40],	%l3
	fmovdge	%xcc,	%f28,	%f1
	edge16	%l0,	%g7,	%g6
	edge32n	%l1,	%i7,	%i0
	array16	%g3,	%o1,	%i1
	movg	%xcc,	%i2,	%l2
	fcmped	%fcc3,	%f20,	%f6
	fmovrdlez	%o3,	%f12,	%f10
	xnorcc	%l5,	0x00E5,	%i4
	sdivcc	%i3,	0x1955,	%l4
	subc	%o6,	0x0C8E,	%o2
	edge16l	%o4,	%g2,	%g1
	mulx	%o5,	%g4,	%o7
	fmovdn	%icc,	%f26,	%f8
	srlx	%i5,	0x1B,	%l6
	edge16ln	%o0,	%g5,	%l3
	ldd	[%l7 + 0x10],	%l0
	edge32l	%g7,	%g6,	%l1
	edge8n	%i6,	%i0,	%i7
	stw	%o1,	[%l7 + 0x20]
	sdivcc	%i1,	0x0FA0,	%i2
	array32	%l2,	%g3,	%l5
	add	%o3,	0x1AB2,	%i3
	edge32n	%l4,	%o6,	%o2
	save %i4, 0x0458, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fornot1s	%f28,	%f17,	%f5
	fnot1s	%f11,	%f16
	xorcc	%g1,	0x1206,	%o5
	movvs	%xcc,	%g2,	%g4
	ldd	[%l7 + 0x48],	%f14
	subc	%i5,	0x0C35,	%o7
	popc	%o0,	%l6
	sra	%l3,	%g5,	%l0
	sll	%g6,	%g7,	%l1
	move	%xcc,	%i6,	%i0
	fnot1	%f26,	%f12
	popc	%i7,	%o1
	array8	%i1,	%i2,	%g3
	bshuffle	%f26,	%f0,	%f8
	fmovdpos	%xcc,	%f5,	%f4
	xorcc	%l2,	%l5,	%o3
	movgu	%xcc,	%i3,	%o6
	array16	%o2,	%l4,	%i4
	edge16	%o4,	%o5,	%g1
	movcc	%icc,	%g4,	%g2
	umul	%i5,	0x0281,	%o0
	fornot1	%f26,	%f18,	%f20
	xnorcc	%o7,	%l3,	%l6
	fcmpne16	%f2,	%f28,	%l0
	movrlz	%g6,	%g5,	%g7
	add	%i6,	0x036B,	%l1
	fmovsa	%icc,	%f8,	%f30
	fsrc2s	%f14,	%f27
	addcc	%i7,	%o1,	%i1
	mulx	%i0,	0x16EF,	%g3
	movne	%xcc,	%i2,	%l5
	ld	[%l7 + 0x44],	%f9
	fsrc1	%f2,	%f4
	subccc	%o3,	0x094B,	%l2
	fmovd	%f2,	%f24
	edge8n	%o6,	%i3,	%l4
	fmovdn	%icc,	%f27,	%f15
	fpsub32s	%f6,	%f19,	%f12
	alignaddr	%i4,	%o4,	%o5
	ldub	[%l7 + 0x37],	%o2
	fmovsle	%icc,	%f14,	%f17
	xnorcc	%g1,	0x040A,	%g4
	fmovrde	%g2,	%f26,	%f20
	movleu	%icc,	%o0,	%i5
	subc	%o7,	%l6,	%l3
	ldd	[%l7 + 0x20],	%f24
	fmovrdlez	%l0,	%f24,	%f0
	movcs	%icc,	%g5,	%g7
	movrlz	%g6,	%l1,	%i7
	fcmpeq16	%f12,	%f14,	%i6
	ldsh	[%l7 + 0x52],	%o1
	fandnot1	%f20,	%f8,	%f2
	fornot2s	%f27,	%f15,	%f29
	xor	%i1,	%i0,	%g3
	movl	%xcc,	%i2,	%o3
	fmovspos	%xcc,	%f26,	%f3
	ldsb	[%l7 + 0x21],	%l2
	nop
	set	0x5A, %i1
	ldsb	[%l7 + %i1],	%l5
	movrlez	%o6,	%i3,	%l4
	addcc	%i4,	0x04C4,	%o4
	mova	%xcc,	%o2,	%o5
	fmovrdlz	%g1,	%f22,	%f6
	movrne	%g4,	0x376,	%o0
	fand	%f14,	%f18,	%f10
	ld	[%l7 + 0x20],	%f15
	array32	%i5,	%o7,	%l6
	ldsb	[%l7 + 0x7B],	%l3
	restore %l0, 0x1B60, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%g7,	0x00B8,	%g6
	movcc	%icc,	%l1,	%g5
	fcmpne32	%f18,	%f16,	%i6
	alignaddr	%o1,	%i1,	%i7
	srl	%i0,	0x0B,	%i2
	xorcc	%g3,	%o3,	%l2
	nop
	set	0x58, %g2
	ldx	[%l7 + %g2],	%o6
	edge32	%i3,	%l4,	%i4
	stx	%o4,	[%l7 + 0x60]
	save %o2, %l5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o5,	0x1ADA,	%g4
	fmovs	%f15,	%f23
	stx	%o0,	[%l7 + 0x68]
	movvc	%icc,	%i5,	%l6
	fexpand	%f16,	%f2
	movn	%xcc,	%o7,	%l0
	fnot2	%f14,	%f26
	subc	%l3,	0x13F8,	%g7
	array32	%g6,	%l1,	%g5
	st	%f2,	[%l7 + 0x44]
	ldub	[%l7 + 0x6D],	%i6
	ldd	[%l7 + 0x10],	%o0
	fmovse	%icc,	%f7,	%f29
	movpos	%icc,	%i1,	%g2
	xorcc	%i0,	%i2,	%g3
	fmovrdgez	%i7,	%f0,	%f28
	std	%f18,	[%l7 + 0x70]
	fxors	%f9,	%f2,	%f8
	ldsw	[%l7 + 0x1C],	%l2
	movneg	%xcc,	%o6,	%i3
	move	%icc,	%o3,	%l4
	addc	%o4,	0x09D2,	%i4
	movleu	%xcc,	%l5,	%g1
	movcc	%icc,	%o5,	%g4
	mulscc	%o2,	0x097F,	%o0
	movvc	%icc,	%i5,	%l6
	setx loop_54, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_54: 	movrlez	%g6,	%g7,	%l1
	ldub	[%l7 + 0x63],	%i6
	ldd	[%l7 + 0x30],	%o0
	nop
	set	0x47, %o2
	ldsb	[%l7 + %o2],	%i1
	srax	%g5,	0x1D,	%i0
	addccc	%g2,	%i2,	%i7
	movrgez	%l2,	0x147,	%g3
	save %i3, 0x0D4E, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlez	%l4,	%f24,	%f20
	movge	%xcc,	%o4,	%o6
	movne	%icc,	%i4,	%g1
	fcmpgt16	%f26,	%f16,	%l5
	orncc	%o5,	0x09E1,	%g4
	subc	%o0,	0x036F,	%o2
	stb	%i5,	[%l7 + 0x24]
	fones	%f2
	array16	%l6,	%l3,	%l0
	movneg	%xcc,	%g6,	%g7
	edge32l	%o7,	%l1,	%o1
	movle	%icc,	%i6,	%i1
	fzeros	%f11
	and	%g5,	%i0,	%i2
	fmovdvc	%icc,	%f10,	%f30
	movcs	%xcc,	%i7,	%l2
	stw	%g2,	[%l7 + 0x20]
	movle	%icc,	%g3,	%i3
	fxor	%f16,	%f4,	%f30
	siam	0x3
	faligndata	%f18,	%f4,	%f24
	nop
	set	0x30, %o1
	ldd	[%l7 + %o1],	%l4
	sllx	%o3,	%o6,	%o4
	fmovsg	%xcc,	%f16,	%f16
	orncc	%i4,	0x0FCE,	%g1
	sub	%o5,	%l5,	%o0
	edge8l	%o2,	%g4,	%l6
	movge	%icc,	%l3,	%l0
	movge	%icc,	%i5,	%g7
	xnorcc	%o7,	0x0BC9,	%l1
	andcc	%g6,	0x0BD5,	%o1
	ldsb	[%l7 + 0x32],	%i1
	fmovsvs	%xcc,	%f11,	%f6
	fmul8sux16	%f2,	%f14,	%f26
	edge16	%g5,	%i6,	%i0
	sll	%i2,	%l2,	%i7
	andcc	%g2,	0x0D21,	%i3
	edge8	%l4,	%o3,	%o6
	sdivx	%g3,	0x0B24,	%i4
	smulcc	%o4,	%o5,	%l5
	lduw	[%l7 + 0x38],	%g1
	edge32n	%o0,	%g4,	%o2
	nop
	set	0x40, %o3
	ldsw	[%l7 + %o3],	%l6
	move	%icc,	%l3,	%l0
	edge8	%g7,	%o7,	%i5
	popc	%g6,	%o1
	fcmpgt32	%f22,	%f28,	%i1
	fcmped	%fcc1,	%f2,	%f0
	sth	%g5,	[%l7 + 0x1C]
	and	%l1,	0x02FD,	%i0
	fpadd32	%f10,	%f26,	%f2
	fmovrsgz	%i6,	%f23,	%f21
	umulcc	%l2,	%i2,	%g2
	fmovrse	%i7,	%f17,	%f2
	popc	0x18CF,	%i3
	sll	%o3,	%o6,	%g3
	fexpand	%f3,	%f0
	movrgz	%i4,	%o4,	%o5
	fmovrdne	%l5,	%f14,	%f8
	fxors	%f21,	%f8,	%f4
	sub	%g1,	0x1EE2,	%l4
	fmovse	%icc,	%f20,	%f4
	sethi	0x12D0,	%o0
	edge16l	%o2,	%g4,	%l6
	sdivx	%l0,	0x164B,	%l3
	ldub	[%l7 + 0x32],	%o7
	addc	%g7,	%i5,	%o1
	movg	%icc,	%i1,	%g5
	movcc	%xcc,	%g6,	%l1
	sth	%i0,	[%l7 + 0x7C]
	movle	%icc,	%i6,	%l2
	move	%xcc,	%i2,	%i7
	mulscc	%g2,	0x0699,	%o3
	fandnot1s	%f27,	%f14,	%f25
	andncc	%i3,	%o6,	%g3
	fmovscs	%xcc,	%f14,	%f3
	xnor	%i4,	0x0F4F,	%o4
	nop
	set	0x42, %g5
	sth	%o5,	[%l7 + %g5]
	orncc	%l5,	0x180E,	%l4
	ldd	[%l7 + 0x60],	%f16
	umulcc	%o0,	%g1,	%o2
	fandnot1	%f14,	%f4,	%f0
	movrlez	%g4,	%l0,	%l6
	edge8l	%l3,	%g7,	%i5
	edge16l	%o1,	%i1,	%g5
	edge32ln	%g6,	%o7,	%l1
	fxnors	%f26,	%f26,	%f26
	xnor	%i0,	0x1DF7,	%i6
	edge8	%l2,	%i2,	%i7
	movcc	%xcc,	%o3,	%i3
	array8	%g2,	%g3,	%i4
	fmovsge	%icc,	%f7,	%f8
	lduh	[%l7 + 0x30],	%o6
	fmovsneg	%icc,	%f23,	%f27
	movre	%o5,	%l5,	%l4
	edge32l	%o0,	%o4,	%o2
	addccc	%g1,	0x031E,	%l0
	fcmps	%fcc3,	%f9,	%f6
	edge8ln	%l6,	%l3,	%g7
	sdiv	%i5,	0x1059,	%g4
	ldd	[%l7 + 0x58],	%f12
	addccc	%i1,	0x04CC,	%g5
	srl	%g6,	%o7,	%o1
	movgu	%icc,	%l1,	%i6
	alignaddr	%l2,	%i0,	%i7
	or	%i2,	%i3,	%g2
	fmovrsne	%g3,	%f16,	%f9
	xor	%i4,	0x19D3,	%o6
	umulcc	%o3,	%o5,	%l5
	andncc	%l4,	%o4,	%o2
	movl	%icc,	%o0,	%l0
	movgu	%icc,	%g1,	%l6
	subccc	%l3,	0x1654,	%i5
	fpadd16	%f26,	%f0,	%f10
	orn	%g7,	%i1,	%g4
	sll	%g5,	%o7,	%g6
	lduh	[%l7 + 0x28],	%l1
	edge32	%i6,	%l2,	%i0
	ldd	[%l7 + 0x30],	%f30
	xnor	%o1,	%i7,	%i3
	sir	0x0354
	fcmpeq16	%f16,	%f28,	%g2
	smul	%g3,	%i4,	%o6
	fmovscc	%icc,	%f7,	%f12
	nop
	set	0x3C, %l0
	stw	%i2,	[%l7 + %l0]
	xnor	%o5,	0x0B0B,	%o3
	andcc	%l4,	%o4,	%o2
	fmovrde	%o0,	%f16,	%f10
	fzeros	%f1
	addccc	%l5,	0x186E,	%g1
	sdivx	%l6,	0x0693,	%l0
	edge16l	%l3,	%i5,	%g7
	std	%f0,	[%l7 + 0x40]
	movrgz	%i1,	0x04F,	%g5
	addccc	%o7,	0x18A8,	%g6
	movne	%icc,	%g4,	%l1
	edge16l	%l2,	%i0,	%o1
	edge8ln	%i6,	%i7,	%g2
	fmovdcs	%xcc,	%f8,	%f21
	fcmpne16	%f30,	%f8,	%i3
	orncc	%i4,	%o6,	%g3
	edge32n	%i2,	%o5,	%o3
	ldx	[%l7 + 0x70],	%l4
	udivcc	%o4,	0x191E,	%o0
	smulcc	%o2,	0x08E0,	%g1
	fmuld8sux16	%f8,	%f23,	%f30
	fors	%f3,	%f12,	%f3
	fors	%f21,	%f21,	%f24
	smul	%l5,	0x0B6D,	%l6
	srl	%l0,	%i5,	%l3
	xorcc	%i1,	0x1B9B,	%g5
	xor	%o7,	%g7,	%g6
	fnor	%f30,	%f2,	%f0
	ld	[%l7 + 0x34],	%f22
	movvc	%icc,	%l1,	%l2
	movne	%icc,	%i0,	%g4
	umul	%o1,	%i6,	%i7
	sllx	%i3,	0x16,	%g2
	ldsw	[%l7 + 0x24],	%o6
	umul	%g3,	0x1A57,	%i4
	movne	%icc,	%o5,	%o3
	xnor	%l4,	%i2,	%o0
	array16	%o2,	%o4,	%g1
	stw	%l6,	[%l7 + 0x60]
	xnor	%l0,	0x1D3E,	%i5
	fmovdne	%xcc,	%f23,	%f24
	edge8	%l3,	%i1,	%g5
	fzeros	%f2
	sdivx	%o7,	0x1C8C,	%l5
	edge8ln	%g7,	%l1,	%l2
	edge32n	%i0,	%g4,	%o1
	st	%f21,	[%l7 + 0x44]
	smul	%g6,	0x0C84,	%i6
	edge8l	%i3,	%i7,	%o6
	edge16	%g3,	%i4,	%g2
	edge32ln	%o5,	%o3,	%l4
	siam	0x6
	mulx	%i2,	%o2,	%o0
	for	%f26,	%f10,	%f28
	movrlez	%g1,	0x035,	%l6
	fcmple16	%f12,	%f18,	%o4
	fmovdne	%icc,	%f28,	%f7
	fcmpd	%fcc3,	%f28,	%f18
	movg	%icc,	%i5,	%l3
	edge32	%i1,	%l0,	%o7
	ldsb	[%l7 + 0x4D],	%l5
	movvc	%xcc,	%g7,	%g5
	movcs	%xcc,	%l1,	%i0
	movrlez	%l2,	0x107,	%g4
	smulcc	%o1,	%i6,	%i3
	xorcc	%i7,	0x15A4,	%o6
	srl	%g3,	0x0D,	%i4
	lduw	[%l7 + 0x58],	%g2
	smulcc	%o5,	%o3,	%l4
	orcc	%i2,	0x1703,	%g6
	fmovsvc	%xcc,	%f19,	%f12
	movvs	%xcc,	%o0,	%o2
	fmovdn	%xcc,	%f31,	%f21
	mulscc	%l6,	0x03A0,	%g1
	edge16	%i5,	%o4,	%i1
	fmovsge	%xcc,	%f16,	%f24
	movrgz	%l0,	%o7,	%l5
	array32	%g7,	%g5,	%l1
	andncc	%i0,	%l2,	%g4
	sdivcc	%o1,	0x1601,	%l3
	ldd	[%l7 + 0x78],	%i6
	movge	%icc,	%i7,	%o6
	movcc	%xcc,	%g3,	%i3
	movleu	%xcc,	%g2,	%i4
	fsrc1	%f24,	%f0
	sir	0x0AC4
	edge16ln	%o5,	%o3,	%i2
	movn	%xcc,	%l4,	%g6
	fones	%f17
	ldx	[%l7 + 0x08],	%o2
	fmovscs	%icc,	%f30,	%f2
	movcs	%xcc,	%l6,	%o0
	move	%icc,	%g1,	%i5
	lduh	[%l7 + 0x56],	%o4
	movre	%l0,	0x07A,	%i1
	addccc	%l5,	0x1F28,	%o7
	fmovrdgez	%g7,	%f2,	%f6
	movvs	%icc,	%g5,	%i0
	sub	%l2,	%g4,	%o1
	movcc	%icc,	%l3,	%i6
	fmovsl	%xcc,	%f29,	%f11
	fmovd	%f18,	%f22
	ld	[%l7 + 0x5C],	%f1
	movn	%icc,	%l1,	%o6
	edge32	%i7,	%i3,	%g3
	sir	0x0A65
	movn	%xcc,	%g2,	%i4
	fzero	%f14
	movpos	%icc,	%o3,	%o5
	fmovrdne	%l4,	%f20,	%f10
	fpmerge	%f23,	%f0,	%f4
	movrgz	%i2,	%g6,	%o2
	sra	%o0,	0x0D,	%g1
	edge16l	%i5,	%l6,	%l0
	fnors	%f23,	%f4,	%f16
	sllx	%i1,	0x1C,	%o4
	fornot1	%f18,	%f10,	%f28
	edge16n	%l5,	%o7,	%g5
	stb	%g7,	[%l7 + 0x3A]
	restore %l2, %g4, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%i0,	%l3,	%i6
	alignaddr	%o6,	%i7,	%l1
	alignaddr	%g3,	%i3,	%g2
	fornot1	%f20,	%f30,	%f22
	lduh	[%l7 + 0x22],	%o3
	edge16n	%i4,	%o5,	%l4
	orcc	%i2,	0x0E03,	%o2
	movg	%xcc,	%o0,	%g6
	andn	%g1,	0x0558,	%l6
	xor	%l0,	%i1,	%i5
	mulscc	%l5,	%o4,	%o7
	addc	%g5,	0x0CD8,	%l2
	array16	%g7,	%g4,	%o1
	fmovsge	%icc,	%f21,	%f1
	udivcc	%l3,	0x0F15,	%i0
	edge16n	%i6,	%o6,	%i7
	alignaddrl	%l1,	%g3,	%i3
	std	%f18,	[%l7 + 0x08]
	subc	%g2,	0x1080,	%i4
	st	%f13,	[%l7 + 0x5C]
	fmovdpos	%xcc,	%f30,	%f19
	srlx	%o5,	0x04,	%o3
	sra	%l4,	0x10,	%o2
	nop
	set	0x08, %o6
	ldub	[%l7 + %o6],	%i2
	st	%f17,	[%l7 + 0x70]
	ldsb	[%l7 + 0x10],	%g6
	fcmpne32	%f12,	%f28,	%o0
	movg	%icc,	%l6,	%g1
	ldx	[%l7 + 0x68],	%i1
	smul	%i5,	0x132C,	%l0
	movgu	%xcc,	%o4,	%o7
	movrgz	%g5,	%l5,	%g7
	edge16ln	%g4,	%o1,	%l2
	stw	%l3,	[%l7 + 0x6C]
	umul	%i0,	%i6,	%o6
	xnor	%l1,	0x1448,	%g3
	movrgz	%i3,	%g2,	%i7
	andn	%o5,	%i4,	%l4
	std	%f8,	[%l7 + 0x18]
	sra	%o2,	0x17,	%i2
	srl	%g6,	0x12,	%o0
	subccc	%l6,	0x0CE1,	%o3
	edge8l	%g1,	%i1,	%i5
	fmovdl	%icc,	%f15,	%f4
	st	%f30,	[%l7 + 0x64]
	array8	%l0,	%o7,	%o4
	fcmpes	%fcc1,	%f24,	%f1
	fmul8x16au	%f29,	%f30,	%f28
	add	%l5,	%g7,	%g5
	edge32l	%o1,	%g4,	%l2
	st	%f10,	[%l7 + 0x54]
	fmuld8ulx16	%f31,	%f2,	%f12
	srlx	%i0,	0x01,	%i6
	subcc	%o6,	0x13B5,	%l1
	st	%f9,	[%l7 + 0x20]
	ldd	[%l7 + 0x68],	%g2
	sethi	0x1550,	%l3
	orncc	%i3,	%g2,	%i7
	or	%i4,	0x0B4F,	%l4
	sethi	0x0862,	%o2
	fcmped	%fcc0,	%f20,	%f30
	ldd	[%l7 + 0x20],	%f22
	array16	%o5,	%g6,	%i2
	edge32l	%o0,	%l6,	%o3
	udivx	%i1,	0x1A0F,	%g1
	fcmpd	%fcc3,	%f18,	%f10
	alignaddrl	%l0,	%i5,	%o7
	pdist	%f6,	%f28,	%f28
	sir	0x032F
	movleu	%icc,	%o4,	%g7
	move	%icc,	%g5,	%l5
	movrlez	%g4,	0x1E9,	%l2
	ld	[%l7 + 0x60],	%f23
	subc	%o1,	%i6,	%o6
	move	%icc,	%l1,	%i0
	movpos	%icc,	%g3,	%l3
	fpsub16s	%f9,	%f4,	%f27
	movvc	%xcc,	%g2,	%i7
	fpackfix	%f14,	%f6
	ldsw	[%l7 + 0x38],	%i3
	edge32ln	%l4,	%i4,	%o2
	alignaddrl	%g6,	%o5,	%o0
	srl	%l6,	0x13,	%i2
	edge16ln	%o3,	%i1,	%l0
	xnorcc	%g1,	%o7,	%i5
	movre	%g7,	%g5,	%l5
	edge32ln	%g4,	%l2,	%o1
	fnot1s	%f6,	%f18
	move	%xcc,	%o4,	%i6
	edge32l	%l1,	%o6,	%g3
	sdivx	%l3,	0x0072,	%g2
	edge8l	%i0,	%i7,	%l4
	fmuld8ulx16	%f3,	%f8,	%f18
	ldx	[%l7 + 0x38],	%i4
	subcc	%i3,	%g6,	%o2
	movleu	%icc,	%o0,	%o5
	stx	%l6,	[%l7 + 0x38]
	fexpand	%f2,	%f6
	fmovsn	%icc,	%f20,	%f28
	fornot2	%f10,	%f10,	%f6
	add	%o3,	0x197D,	%i2
	ldsw	[%l7 + 0x44],	%i1
	fnot1	%f12,	%f10
	array16	%g1,	%l0,	%o7
	fxor	%f26,	%f30,	%f28
	fmovsa	%xcc,	%f22,	%f1
	edge8ln	%i5,	%g5,	%l5
	mulscc	%g7,	%g4,	%o1
	movne	%icc,	%l2,	%o4
	andn	%i6,	0x1A53,	%l1
	ldd	[%l7 + 0x40],	%f2
	sdivcc	%o6,	0x038B,	%g3
	mulscc	%l3,	0x04BA,	%i0
	subcc	%i7,	%l4,	%g2
	or	%i3,	0x04E8,	%g6
	subccc	%i4,	0x18C1,	%o0
	ld	[%l7 + 0x4C],	%f31
	save %o5, 0x09AE, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ld	[%l7 + 0x50],	%f11
	movcc	%xcc,	%o3,	%l6
	srax	%i1,	0x13,	%i2
	movrlez	%l0,	0x078,	%g1
	srax	%i5,	0x0A,	%g5
	smul	%l5,	%g7,	%o7
	orcc	%g4,	0x0364,	%o1
	umulcc	%o4,	%i6,	%l1
	subc	%o6,	%g3,	%l3
	movrlez	%l2,	0x308,	%i7
	movre	%i0,	%l4,	%i3
	movrlz	%g2,	0x274,	%g6
	fmovdvc	%icc,	%f31,	%f4
	movne	%xcc,	%i4,	%o0
	ldub	[%l7 + 0x45],	%o2
	ldsb	[%l7 + 0x71],	%o5
	udivx	%l6,	0x105A,	%i1
	subccc	%o3,	0x125C,	%i2
	subc	%g1,	0x02E2,	%i5
	umul	%l0,	%l5,	%g7
	setx loop_55, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_55: 	xnorcc	%o7,	0x0487,	%o4
	subccc	%l1,	%o6,	%g3
	or	%l3,	0x087B,	%i6
	save %l2, 0x041E, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcs	%xcc,	%l4,	%i0
	smul	%i3,	0x0DF9,	%g6
	fmovspos	%xcc,	%f16,	%f21
	xnor	%i4,	%o0,	%o2
	fpsub16s	%f3,	%f17,	%f1
	movgu	%xcc,	%o5,	%l6
	xorcc	%g2,	%o3,	%i1
	orcc	%i2,	0x1747,	%i5
	fexpand	%f16,	%f10
	mova	%xcc,	%l0,	%l5
	movcs	%xcc,	%g7,	%g1
	stx	%g4,	[%l7 + 0x40]
	udiv	%o1,	0x0E3B,	%o7
	sdiv	%o4,	0x0878,	%l1
	nop
	set	0x0E, %l3
	ldub	[%l7 + %l3],	%o6
	mulscc	%g3,	0x11A4,	%l3
	umul	%i6,	%l2,	%g5
	orncc	%i7,	%l4,	%i3
	restore %i0, %g6, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%o2,	0x065A,	%o5
	st	%f25,	[%l7 + 0x7C]
	orcc	%l6,	%i4,	%g2
	edge8n	%o3,	%i2,	%i5
	bshuffle	%f10,	%f16,	%f24
	fornot1	%f12,	%f20,	%f0
	stx	%l0,	[%l7 + 0x78]
	movne	%xcc,	%i1,	%l5
	fpsub16s	%f30,	%f5,	%f25
	xnor	%g1,	%g7,	%o1
	fnot2	%f4,	%f4
	edge16l	%o7,	%g4,	%o4
	ldd	[%l7 + 0x30],	%l0
	movvs	%xcc,	%g3,	%o6
	edge16ln	%l3,	%i6,	%g5
	fmovdneg	%xcc,	%f31,	%f6
	movl	%xcc,	%l2,	%l4
	srax	%i7,	%i3,	%g6
	nop
	set	0x35, %l2
	ldub	[%l7 + %l2],	%i0
	subc	%o2,	0x0B94,	%o5
	mulscc	%o0,	0x142F,	%l6
	edge32	%i4,	%g2,	%i2
	edge16	%i5,	%o3,	%i1
	fcmpeq32	%f26,	%f2,	%l5
	sub	%g1,	%g7,	%l0
	fmovdneg	%xcc,	%f19,	%f13
	xor	%o7,	0x102E,	%g4
	edge8n	%o1,	%o4,	%g3
	xnor	%o6,	%l1,	%l3
	umul	%i6,	%g5,	%l4
	alignaddr	%i7,	%l2,	%g6
	fabsd	%f28,	%f16
	fandnot1s	%f13,	%f16,	%f20
	fmovspos	%icc,	%f26,	%f15
	orcc	%i3,	%i0,	%o5
	movvc	%icc,	%o0,	%l6
	fcmpeq16	%f28,	%f26,	%o2
	umul	%i4,	%g2,	%i2
	fmovsa	%xcc,	%f0,	%f3
	movrne	%i5,	0x11C,	%o3
	lduw	[%l7 + 0x1C],	%l5
	movn	%icc,	%i1,	%g1
	movpos	%xcc,	%g7,	%l0
	fandnot1	%f26,	%f0,	%f16
	movrlz	%g4,	%o1,	%o4
	andn	%o7,	%g3,	%l1
	fones	%f9
	andn	%o6,	%i6,	%l3
	sethi	0x09A7,	%l4
	ldsb	[%l7 + 0x55],	%i7
	fmovdpos	%xcc,	%f29,	%f3
	edge8n	%g5,	%l2,	%i3
	mulscc	%i0,	%g6,	%o5
	stw	%l6,	[%l7 + 0x60]
	siam	0x4
	fabsd	%f18,	%f0
	sllx	%o2,	%i4,	%g2
	movneg	%xcc,	%i2,	%i5
	movleu	%icc,	%o0,	%o3
	ldx	[%l7 + 0x30],	%i1
	movcs	%xcc,	%g1,	%l5
	fmul8x16	%f13,	%f24,	%f20
	orn	%g7,	%g4,	%l0
	edge8n	%o4,	%o7,	%o1
	umulcc	%g3,	%o6,	%i6
	std	%f14,	[%l7 + 0x68]
	movcs	%icc,	%l1,	%l4
	array32	%i7,	%l3,	%l2
	smulcc	%g5,	%i3,	%g6
	bshuffle	%f16,	%f14,	%f4
	fmovrslz	%o5,	%f31,	%f15
	movle	%xcc,	%i0,	%o2
	alignaddr	%l6,	%g2,	%i4
	movcs	%xcc,	%i2,	%o0
	alignaddr	%i5,	%o3,	%i1
	fxor	%f8,	%f16,	%f10
	xnorcc	%g1,	0x06D0,	%l5
	edge8ln	%g4,	%g7,	%l0
	srax	%o4,	0x18,	%o1
	movg	%icc,	%g3,	%o6
	array16	%o7,	%i6,	%l4
	andcc	%l1,	%i7,	%l3
	sllx	%g5,	0x0C,	%l2
	or	%g6,	%i3,	%i0
	fmovrslz	%o5,	%f22,	%f6
	movpos	%xcc,	%o2,	%g2
	ldd	[%l7 + 0x30],	%i6
	subc	%i2,	%i4,	%o0
	popc	0x0668,	%i5
	fandnot2s	%f10,	%f15,	%f16
	fcmpgt32	%f20,	%f26,	%i1
	fnot2s	%f20,	%f17
	fmovdvs	%icc,	%f0,	%f14
	smulcc	%g1,	%l5,	%o3
	popc	%g7,	%l0
	fcmple16	%f18,	%f12,	%g4
	orn	%o1,	%o4,	%g3
	sll	%o7,	%o6,	%l4
	stw	%l1,	[%l7 + 0x60]
	subccc	%i7,	%l3,	%g5
	smulcc	%l2,	0x196F,	%i6
	edge16	%i3,	%g6,	%i0
	movne	%xcc,	%o5,	%g2
	fnors	%f9,	%f14,	%f4
	movn	%icc,	%o2,	%i2
	fmovdcs	%icc,	%f8,	%f20
	fmul8x16al	%f14,	%f24,	%f24
	orn	%i4,	0x0BD5,	%l6
	alignaddrl	%i5,	%i1,	%g1
	udivx	%o0,	0x1F8D,	%l5
	fmovdn	%icc,	%f13,	%f0
	ldsh	[%l7 + 0x10],	%o3
	st	%f9,	[%l7 + 0x3C]
	orcc	%g7,	0x0F84,	%l0
	subcc	%g4,	%o1,	%g3
	fornot2s	%f3,	%f8,	%f9
	fpack16	%f12,	%f10
	ldsb	[%l7 + 0x08],	%o7
	fmul8sux16	%f0,	%f26,	%f6
	srlx	%o6,	%o4,	%l1
	lduh	[%l7 + 0x74],	%i7
	srl	%l4,	%l3,	%g5
	fnors	%f21,	%f26,	%f15
	fsrc1	%f12,	%f26
	edge32	%l2,	%i6,	%i3
	fcmpd	%fcc0,	%f2,	%f4
	ldsw	[%l7 + 0x78],	%g6
	sethi	0x155E,	%o5
	movvs	%xcc,	%i0,	%o2
	movne	%xcc,	%g2,	%i4
	subcc	%l6,	%i5,	%i1
	edge32ln	%g1,	%o0,	%i2
	fcmpgt16	%f24,	%f26,	%o3
	sll	%g7,	0x1D,	%l5
	orn	%g4,	0x0A05,	%o1
	faligndata	%f8,	%f22,	%f24
	fandnot2	%f8,	%f18,	%f18
	xnor	%l0,	0x0A9A,	%g3
	fnot1s	%f30,	%f15
	fnors	%f3,	%f28,	%f9
	edge32l	%o6,	%o7,	%o4
	ldsw	[%l7 + 0x20],	%l1
	ldsw	[%l7 + 0x20],	%l4
	addcc	%l3,	0x0B8C,	%i7
	fmovrslz	%l2,	%f25,	%f0
	umul	%g5,	0x1341,	%i6
	movle	%icc,	%g6,	%o5
	fnot1	%f6,	%f28
	lduh	[%l7 + 0x2A],	%i0
	move	%icc,	%i3,	%o2
	fmovsn	%icc,	%f26,	%f28
	subcc	%i4,	%g2,	%l6
	array16	%i1,	%i5,	%o0
	udiv	%g1,	0x0B6A,	%i2
	sir	0x1337
	movle	%xcc,	%o3,	%l5
	smulcc	%g7,	%g4,	%o1
	stx	%l0,	[%l7 + 0x70]
	fpack16	%f12,	%f13
	edge32n	%g3,	%o7,	%o6
	stw	%l1,	[%l7 + 0x08]
	sub	%o4,	0x0C5A,	%l3
	movrgez	%l4,	0x09D,	%i7
	fmul8x16au	%f4,	%f13,	%f30
	xorcc	%l2,	%i6,	%g5
	movne	%xcc,	%g6,	%i0
	fnegs	%f16,	%f23
	ld	[%l7 + 0x0C],	%f11
	edge8n	%i3,	%o5,	%o2
	udivx	%g2,	0x056F,	%i4
	popc	0x0D1C,	%i1
	xnor	%l6,	0x192C,	%o0
	addcc	%g1,	%i2,	%o3
	sdivcc	%i5,	0x0A63,	%l5
	andcc	%g7,	0x1C35,	%o1
	sdivx	%g4,	0x1261,	%l0
	movl	%icc,	%g3,	%o6
	orncc	%o7,	0x1E98,	%l1
	stw	%o4,	[%l7 + 0x1C]
	addc	%l4,	0x13F6,	%l3
	fmovscc	%icc,	%f5,	%f10
	fmovdge	%icc,	%f14,	%f8
	edge16n	%l2,	%i6,	%i7
	fmovdcs	%icc,	%f7,	%f7
	fand	%f22,	%f16,	%f20
	movrne	%g5,	%i0,	%i3
	edge8ln	%o5,	%g6,	%o2
	fmovsleu	%xcc,	%f24,	%f14
	movge	%xcc,	%i4,	%g2
	smulcc	%i1,	0x1621,	%o0
	sdiv	%g1,	0x0FD5,	%i2
	movleu	%icc,	%l6,	%i5
	smulcc	%l5,	0x00D7,	%o3
	lduw	[%l7 + 0x5C],	%g7
	fmovde	%xcc,	%f9,	%f12
	edge8n	%g4,	%l0,	%o1
	srl	%g3,	0x0C,	%o6
	sra	%l1,	%o4,	%l4
	fmovdg	%xcc,	%f6,	%f12
	fpadd16	%f4,	%f26,	%f16
	fzero	%f30
	fands	%f27,	%f1,	%f3
	ld	[%l7 + 0x50],	%f20
	pdist	%f2,	%f30,	%f16
	xor	%o7,	0x1824,	%l2
	movrgz	%i6,	%i7,	%g5
	umul	%i0,	0x0115,	%l3
	orn	%o5,	%i3,	%o2
	addccc	%i4,	0x0CDB,	%g6
	fmovdcs	%icc,	%f15,	%f18
	sdiv	%i1,	0x11B4,	%g2
	alignaddrl	%o0,	%i2,	%g1
	fnegs	%f26,	%f21
	move	%icc,	%i5,	%l5
	edge16	%o3,	%l6,	%g4
	movre	%l0,	%g7,	%o1
	udivx	%g3,	0x0FAF,	%o6
	sth	%l1,	[%l7 + 0x7A]
	movn	%icc,	%o4,	%o7
	stb	%l4,	[%l7 + 0x46]
	subcc	%i6,	0x161E,	%i7
	fmovdvs	%xcc,	%f7,	%f14
	or	%g5,	%i0,	%l2
	fsrc2s	%f27,	%f19
	fcmpne32	%f26,	%f16,	%o5
	fornot1s	%f14,	%f5,	%f14
	ldx	[%l7 + 0x40],	%l3
	movge	%xcc,	%i3,	%i4
	movrgez	%g6,	0x03E,	%o2
	mova	%xcc,	%g2,	%o0
	fcmpne32	%f26,	%f26,	%i1
	movrlez	%g1,	%i5,	%l5
	ldd	[%l7 + 0x40],	%i2
	stb	%o3,	[%l7 + 0x4A]
	alignaddrl	%g4,	%l6,	%l0
	edge16n	%o1,	%g3,	%g7
	movpos	%xcc,	%l1,	%o4
	st	%f25,	[%l7 + 0x68]
	stw	%o6,	[%l7 + 0x50]
	move	%icc,	%l4,	%i6
	sth	%i7,	[%l7 + 0x14]
	lduw	[%l7 + 0x3C],	%g5
	sub	%i0,	%o7,	%l2
	andncc	%l3,	%i3,	%o5
	edge8ln	%g6,	%o2,	%i4
	srl	%g2,	%o0,	%g1
	movle	%xcc,	%i1,	%l5
	xorcc	%i5,	%i2,	%g4
	mova	%icc,	%l6,	%l0
	alignaddrl	%o1,	%g3,	%g7
	movle	%icc,	%o3,	%l1
	save %o6, 0x1C22, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16l	%i6,	%o4,	%i7
	save %g5, 0x0F21, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o7,	0x1B6E,	%l3
	edge32ln	%i3,	%o5,	%l2
	array32	%g6,	%o2,	%g2
	srax	%i4,	0x1E,	%o0
	std	%f22,	[%l7 + 0x50]
	add	%i1,	0x101D,	%g1
	nop
	set	0x40, %l5
	ldd	[%l7 + %l5],	%f26
	alignaddrl	%l5,	%i5,	%i2
	fmovsvc	%icc,	%f24,	%f11
	st	%f12,	[%l7 + 0x28]
	umul	%l6,	0x06A6,	%l0
	movl	%icc,	%g4,	%o1
	ldd	[%l7 + 0x08],	%g2
	fsrc2	%f10,	%f24
	subccc	%g7,	0x0B63,	%o3
	or	%o6,	0x1C48,	%l1
	mova	%xcc,	%l4,	%i6
	smulcc	%i7,	%g5,	%i0
	ldsh	[%l7 + 0x40],	%o7
	and	%o4,	0x190B,	%l3
	addc	%i3,	0x0543,	%l2
	xorcc	%g6,	%o2,	%o5
	stb	%g2,	[%l7 + 0x3C]
	fnot2	%f24,	%f16
	fcmped	%fcc1,	%f6,	%f12
	andcc	%i4,	%i1,	%g1
	fmovsl	%icc,	%f0,	%f2
	movrgez	%o0,	%i5,	%l5
	fmovsneg	%icc,	%f29,	%f7
	lduh	[%l7 + 0x62],	%i2
	sdiv	%l0,	0x1A3F,	%g4
	movrne	%o1,	%g3,	%g7
	movrgz	%l6,	0x2D0,	%o3
	movvc	%xcc,	%o6,	%l4
	udivcc	%l1,	0x0DC1,	%i7
	movrlez	%g5,	0x022,	%i0
	orcc	%o7,	%i6,	%o4
	sdiv	%i3,	0x185F,	%l2
	movgu	%xcc,	%g6,	%o2
	edge32	%o5,	%l3,	%i4
	addccc	%g2,	%g1,	%o0
	fcmpeq16	%f26,	%f6,	%i5
	ldd	[%l7 + 0x38],	%f20
	andcc	%l5,	%i2,	%i1
	movcc	%icc,	%g4,	%o1
	sra	%g3,	0x19,	%l0
	subc	%l6,	0x1DAB,	%o3
	sllx	%o6,	%g7,	%l4
	sdiv	%l1,	0x1F67,	%g5
	fmovdl	%icc,	%f9,	%f13
	movn	%xcc,	%i0,	%o7
	umulcc	%i6,	%i7,	%o4
	addccc	%i3,	%g6,	%o2
	umulcc	%l2,	0x04B1,	%l3
	alignaddrl	%i4,	%g2,	%o5
	popc	%g1,	%i5
	edge32	%l5,	%o0,	%i1
	array16	%g4,	%i2,	%o1
	orncc	%l0,	%g3,	%l6
	mulscc	%o6,	0x07CF,	%o3
	srax	%l4,	%g7,	%g5
	movvs	%icc,	%l1,	%o7
	fcmpeq32	%f14,	%f24,	%i6
	addccc	%i7,	%o4,	%i3
	udivcc	%g6,	0x024C,	%o2
	smulcc	%i0,	%l3,	%i4
	nop
	set	0x50, %i0
	ldd	[%l7 + %i0],	%g2
	ldx	[%l7 + 0x58],	%l2
	fmovrsgez	%g1,	%f6,	%f17
	setx loop_56, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_56: 	movle	%icc,	%i1,	%o0
	fpackfix	%f6,	%f12
	fsrc2	%f4,	%f22
	sdivx	%g4,	0x1FA6,	%o1
	ldub	[%l7 + 0x20],	%l0
	ldd	[%l7 + 0x68],	%i2
	movvs	%icc,	%g3,	%l6
	fmovs	%f27,	%f15
	movre	%o3,	0x3F2,	%o6
	movleu	%icc,	%l4,	%g5
	sra	%g7,	%l1,	%o7
	edge32	%i6,	%o4,	%i7
	fmovsgu	%xcc,	%f24,	%f17
	edge8	%g6,	%i3,	%o2
	subccc	%l3,	0x0DB3,	%i0
	fsrc2	%f26,	%f28
	udivcc	%i4,	0x1B78,	%g2
	movne	%xcc,	%g1,	%l2
	movl	%icc,	%o5,	%i5
	orn	%l5,	%o0,	%g4
	andncc	%i1,	%l0,	%i2
	array8	%g3,	%l6,	%o3
	fmovdgu	%icc,	%f8,	%f3
	fcmpes	%fcc0,	%f14,	%f22
	addcc	%o6,	0x1E47,	%o1
	movpos	%icc,	%g5,	%l4
	edge8l	%l1,	%o7,	%i6
	add	%o4,	0x069F,	%i7
	movre	%g7,	0x11A,	%g6
	fnegd	%f12,	%f28
	sll	%i3,	%o2,	%i0
	ldsh	[%l7 + 0x7E],	%l3
	and	%g2,	%i4,	%g1
	move	%icc,	%o5,	%l2
	fors	%f27,	%f30,	%f13
	edge8l	%l5,	%o0,	%g4
	xnorcc	%i5,	%i1,	%i2
	movle	%xcc,	%l0,	%l6
	sth	%g3,	[%l7 + 0x5A]
	fmul8ulx16	%f16,	%f8,	%f30
	edge16n	%o6,	%o1,	%g5
	movn	%icc,	%o3,	%l4
	fcmpeq16	%f18,	%f12,	%o7
	fabss	%f28,	%f31
	fmovdleu	%icc,	%f16,	%f24
	fpadd32s	%f27,	%f29,	%f31
	fmovdne	%icc,	%f5,	%f23
	udivx	%l1,	0x14FF,	%o4
	fmul8ulx16	%f26,	%f0,	%f4
	sethi	0x02D7,	%i6
	edge16n	%i7,	%g7,	%g6
	save %o2, 0x017D, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%l3,	%i3,	%i4
	movgu	%xcc,	%g2,	%g1
	movpos	%xcc,	%o5,	%l5
	orncc	%l2,	0x0F3D,	%o0
	fmovrdgez	%i5,	%f14,	%f18
	fmovsneg	%icc,	%f19,	%f0
	lduw	[%l7 + 0x78],	%i1
	sllx	%g4,	%i2,	%l6
	edge16n	%g3,	%l0,	%o6
	nop
	set	0x40, %g7
	stw	%o1,	[%l7 + %g7]
	edge16	%g5,	%o3,	%o7
	array8	%l4,	%l1,	%i6
	subccc	%o4,	0x043D,	%g7
	fmovdcc	%xcc,	%f0,	%f27
	fors	%f28,	%f10,	%f23
	popc	%i7,	%g6
	fmovs	%f15,	%f6
	or	%o2,	%l3,	%i3
	fnot2	%f6,	%f16
	mova	%xcc,	%i4,	%g2
	andncc	%i0,	%o5,	%l5
	ldub	[%l7 + 0x2D],	%l2
	movl	%icc,	%g1,	%o0
	sir	0x19A0
	add	%i5,	%g4,	%i2
	fand	%f28,	%f0,	%f20
	fmovdcs	%icc,	%f7,	%f5
	movge	%icc,	%i1,	%l6
	fandnot2	%f0,	%f10,	%f22
	smul	%l0,	0x0A70,	%g3
	sir	0x1CA1
	udivcc	%o1,	0x16FB,	%g5
	lduw	[%l7 + 0x50],	%o3
	edge32n	%o7,	%l4,	%l1
	popc	%o6,	%i6
	ldsh	[%l7 + 0x1E],	%g7
	addccc	%i7,	0x0EBD,	%g6
	srlx	%o4,	%l3,	%i3
	subc	%o2,	0x04AC,	%g2
	orcc	%i4,	%o5,	%i0
	sub	%l2,	0x0E57,	%g1
	ldd	[%l7 + 0x38],	%f24
	sth	%o0,	[%l7 + 0x4A]
	sth	%i5,	[%l7 + 0x16]
	lduw	[%l7 + 0x14],	%l5
	ldsh	[%l7 + 0x60],	%g4
	fmuld8sux16	%f6,	%f0,	%f24
	fmovsneg	%xcc,	%f22,	%f12
	orcc	%i1,	%i2,	%l0
	xnorcc	%l6,	0x0946,	%o1
	orcc	%g5,	%o3,	%g3
	edge32ln	%o7,	%l1,	%l4
	lduw	[%l7 + 0x28],	%o6
	edge32	%i6,	%i7,	%g7
	fmovspos	%icc,	%f15,	%f21
	fornot2	%f0,	%f20,	%f6
	fnors	%f31,	%f30,	%f30
	fnot2s	%f2,	%f15
	xorcc	%g6,	%o4,	%l3
	fzeros	%f10
	udivcc	%o2,	0x03DA,	%g2
	movle	%xcc,	%i4,	%o5
	fcmpeq32	%f4,	%f24,	%i3
	sdivcc	%l2,	0x1BD0,	%i0
	fmovdge	%xcc,	%f30,	%f1
	ldsb	[%l7 + 0x70],	%g1
	fmovdle	%icc,	%f21,	%f15
	lduh	[%l7 + 0x4A],	%o0
	subccc	%l5,	%i5,	%g4
	stw	%i1,	[%l7 + 0x4C]
	xnor	%l0,	0x15D2,	%l6
	edge8l	%o1,	%g5,	%o3
	subcc	%g3,	%i2,	%o7
	siam	0x4
	movpos	%xcc,	%l1,	%l4
	movrgz	%i6,	0x148,	%o6
	movpos	%xcc,	%g7,	%i7
	subccc	%o4,	%l3,	%g6
	ldd	[%l7 + 0x28],	%g2
	fmovdl	%xcc,	%f0,	%f3
	stx	%i4,	[%l7 + 0x28]
	orn	%o5,	%i3,	%o2
	array16	%l2,	%g1,	%o0
	fmovsvs	%icc,	%f4,	%f24
	edge16	%i0,	%i5,	%g4
	alignaddrl	%l5,	%i1,	%l0
	andncc	%l6,	%o1,	%g5
	ldub	[%l7 + 0x7A],	%g3
	addc	%o3,	0x0770,	%i2
	movvs	%xcc,	%l1,	%o7
	orncc	%l4,	0x168B,	%i6
	fnot2s	%f19,	%f28
	lduh	[%l7 + 0x4C],	%o6
	fxors	%f29,	%f1,	%f24
	sllx	%g7,	%i7,	%l3
	andncc	%o4,	%g2,	%g6
	restore %i4, 0x1452, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x58],	%o2
	movle	%icc,	%o5,	%g1
	movrne	%l2,	0x1A0,	%o0
	fpadd16s	%f11,	%f5,	%f26
	fmovdne	%xcc,	%f21,	%f1
	movcs	%xcc,	%i5,	%g4
	edge8l	%l5,	%i0,	%i1
	ldsh	[%l7 + 0x64],	%l0
	nop
	set	0x30, %i2
	ldx	[%l7 + %i2],	%o1
	fmovrdne	%g5,	%f6,	%f6
	xnor	%g3,	%o3,	%l6
	fpsub16	%f14,	%f0,	%f10
	fxnors	%f15,	%f22,	%f17
	xor	%i2,	0x136B,	%o7
	addccc	%l4,	0x0D0F,	%i6
	edge32	%l1,	%g7,	%i7
	mulx	%l3,	%o6,	%o4
	subccc	%g2,	%i4,	%i3
	movrlz	%o2,	%g6,	%g1
	orncc	%o5,	%l2,	%o0
	sth	%g4,	[%l7 + 0x56]
	ldd	[%l7 + 0x28],	%f4
	ldd	[%l7 + 0x48],	%f12
	lduh	[%l7 + 0x5E],	%l5
	move	%xcc,	%i5,	%i0
	stb	%i1,	[%l7 + 0x3C]
	edge32ln	%o1,	%g5,	%l0
	movne	%xcc,	%g3,	%l6
	st	%f24,	[%l7 + 0x2C]
	movgu	%icc,	%i2,	%o3
	alignaddr	%l4,	%i6,	%o7
	movneg	%xcc,	%l1,	%i7
	movvs	%icc,	%g7,	%l3
	ldub	[%l7 + 0x66],	%o4
	orcc	%g2,	%o6,	%i4
	sethi	0x0D29,	%o2
	fmovsgu	%xcc,	%f8,	%f5
	movle	%xcc,	%i3,	%g6
	mova	%icc,	%o5,	%l2
	fnegs	%f26,	%f18
	movpos	%icc,	%o0,	%g1
	move	%icc,	%g4,	%l5
	ldd	[%l7 + 0x40],	%f2
	fxnors	%f4,	%f24,	%f31
	edge16n	%i0,	%i1,	%i5
	andcc	%o1,	%l0,	%g5
	subcc	%l6,	%g3,	%o3
	movpos	%xcc,	%l4,	%i2
	sdiv	%o7,	0x1FB0,	%l1
	save %i7, %g7, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32l	%o4,	%i6,	%o6
	movcc	%icc,	%g2,	%i4
	xnor	%o2,	0x15D4,	%i3
	xnorcc	%g6,	%l2,	%o5
	edge8ln	%o0,	%g1,	%g4
	fsrc1s	%f6,	%f12
	andn	%i0,	0x1C25,	%i1
	stw	%l5,	[%l7 + 0x34]
	fmovdg	%icc,	%f2,	%f20
	fmovda	%xcc,	%f16,	%f14
	alignaddr	%o1,	%l0,	%i5
	fnot1	%f26,	%f0
	edge16	%g5,	%l6,	%g3
	andcc	%o3,	0x1B2F,	%i2
	srl	%o7,	%l4,	%i7
	edge16n	%g7,	%l3,	%o4
	and	%l1,	%i6,	%o6
	popc	%i4,	%g2
	ldx	[%l7 + 0x48],	%o2
	sth	%i3,	[%l7 + 0x34]
	andncc	%l2,	%o5,	%g6
	nop
	set	0x4B, %i6
	ldub	[%l7 + %i6],	%o0
	movrlz	%g4,	0x25B,	%g1
	fmovrdlez	%i0,	%f16,	%f6
	mulscc	%l5,	%i1,	%o1
	movre	%l0,	0x11C,	%i5
	andncc	%g5,	%g3,	%o3
	srax	%i2,	0x07,	%o7
	ldsb	[%l7 + 0x48],	%l4
	std	%f14,	[%l7 + 0x70]
	movge	%xcc,	%l6,	%g7
	movle	%xcc,	%l3,	%i7
	edge32l	%o4,	%i6,	%l1
	edge32n	%i4,	%o6,	%o2
	umul	%i3,	%g2,	%o5
	movre	%g6,	0x03F,	%l2
	save %o0, %g4, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%g1,	0x03C7,	%l5
	movpos	%xcc,	%o1,	%i1
	edge32l	%l0,	%g5,	%i5
	stx	%o3,	[%l7 + 0x58]
	smul	%i2,	%o7,	%l4
	movrne	%g3,	0x300,	%l6
	sub	%l3,	%i7,	%g7
	umul	%o4,	%i6,	%i4
	stw	%l1,	[%l7 + 0x20]
	addcc	%o6,	%o2,	%i3
	nop
	set	0x78, %o4
	lduw	[%l7 + %o4],	%o5
	orncc	%g2,	%g6,	%l2
	popc	0x0AC8,	%g4
	srl	%o0,	0x13,	%g1
	movcs	%xcc,	%l5,	%o1
	sdivcc	%i1,	0x1377,	%i0
	sra	%l0,	%i5,	%o3
	fmovdne	%xcc,	%f5,	%f30
	fnegd	%f18,	%f20
	ld	[%l7 + 0x50],	%f17
	andncc	%g5,	%o7,	%i2
	sdivx	%g3,	0x1C4C,	%l6
	sir	0x14A3
	fxors	%f4,	%f15,	%f1
	orn	%l4,	%i7,	%g7
	fcmpne32	%f4,	%f14,	%l3
	fmovdg	%xcc,	%f12,	%f16
	ld	[%l7 + 0x3C],	%f22
	fmovdl	%xcc,	%f29,	%f20
	movne	%xcc,	%i6,	%i4
	sdivx	%l1,	0x19CD,	%o4
	movrlez	%o2,	%i3,	%o6
	fmovrse	%g2,	%f7,	%f18
	movrne	%g6,	0x068,	%l2
	edge8ln	%o5,	%o0,	%g1
	movn	%xcc,	%l5,	%o1
	fones	%f26
	fpadd32s	%f23,	%f27,	%f27
	movvs	%icc,	%g4,	%i1
	fmovsa	%xcc,	%f22,	%f31
	sub	%l0,	0x16B9,	%i0
	st	%f25,	[%l7 + 0x08]
	addc	%i5,	0x190B,	%g5
	fmovsleu	%xcc,	%f5,	%f5
	ldd	[%l7 + 0x50],	%o2
	stx	%i2,	[%l7 + 0x70]
	sdivcc	%o7,	0x0367,	%g3
	addc	%l6,	%i7,	%l4
	stx	%g7,	[%l7 + 0x08]
	andcc	%i6,	%l3,	%l1
	umul	%i4,	%o4,	%o2
	smul	%o6,	%g2,	%i3
	addccc	%g6,	%l2,	%o5
	edge16l	%g1,	%l5,	%o1
	fmovscs	%xcc,	%f8,	%f7
	sllx	%o0,	%g4,	%l0
	subc	%i0,	%i5,	%g5
	fmovrslez	%i1,	%f9,	%f20
	xnor	%o3,	0x0372,	%i2
	movre	%g3,	0x1EF,	%l6
	alignaddrl	%o7,	%i7,	%g7
	edge8	%l4,	%l3,	%i6
	movl	%xcc,	%l1,	%o4
	movge	%icc,	%o2,	%o6
	movrgez	%i4,	%i3,	%g2
	or	%l2,	%g6,	%o5
	movn	%icc,	%g1,	%l5
	udiv	%o1,	0x06D0,	%g4
	stx	%l0,	[%l7 + 0x58]
	udivcc	%i0,	0x0D89,	%o0
	lduh	[%l7 + 0x64],	%g5
	srlx	%i1,	%i5,	%i2
	fsrc2s	%f1,	%f16
	fxnor	%f28,	%f16,	%f10
	movcs	%icc,	%g3,	%o3
	movvc	%icc,	%l6,	%i7
	sdiv	%o7,	0x081E,	%l4
	fmovsl	%icc,	%f11,	%f23
	movg	%xcc,	%g7,	%i6
	fmovdne	%icc,	%f27,	%f1
	fand	%f4,	%f30,	%f4
	xor	%l1,	%o4,	%l3
	ldsb	[%l7 + 0x0F],	%o2
	movl	%icc,	%i4,	%o6
	movpos	%icc,	%g2,	%l2
	movre	%g6,	0x125,	%o5
	edge32l	%i3,	%l5,	%o1
	edge16l	%g4,	%l0,	%i0
	setx loop_57, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_57: 	fand	%f28,	%f14,	%f16
	addccc	%i1,	0x02BC,	%g5
	fmovdl	%xcc,	%f22,	%f8
	fmovrslez	%i2,	%f21,	%f25
	mulx	%i5,	0x1E61,	%g3
	movne	%icc,	%l6,	%i7
	fmovscc	%xcc,	%f29,	%f11
	umulcc	%o7,	%o3,	%l4
	edge16l	%i6,	%g7,	%o4
	fmovsneg	%xcc,	%f24,	%f17
	alignaddr	%l3,	%o2,	%l1
	fmovdgu	%icc,	%f24,	%f3
	movge	%xcc,	%i4,	%o6
	xnor	%g2,	%l2,	%o5
	movn	%xcc,	%g6,	%l5
	fsrc1	%f2,	%f10
	sra	%i3,	%o1,	%l0
	edge16	%g4,	%i0,	%g1
	smul	%i1,	0x0F7B,	%o0
	addcc	%g5,	0x1AC1,	%i5
	edge16ln	%i2,	%l6,	%i7
	edge32n	%o7,	%g3,	%l4
	restore %i6, 0x0C31, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdg	%icc,	%f30,	%f18
	subc	%o4,	0x0A61,	%o3
	mulscc	%l3,	%l1,	%i4
	st	%f27,	[%l7 + 0x74]
	popc	%o6,	%g2
	save %l2, 0x0FF5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o2,	%l5,	%g6
	orncc	%o1,	0x0969,	%l0
	array8	%i3,	%i0,	%g4
	subc	%g1,	0x0F18,	%i1
	edge16n	%g5,	%i5,	%i2
	sllx	%l6,	%i7,	%o7
	xorcc	%o0,	0x0BCF,	%l4
	fmovsge	%icc,	%f9,	%f6
	fmovsle	%icc,	%f27,	%f30
	andncc	%i6,	%g3,	%g7
	xnorcc	%o4,	%o3,	%l1
	movvc	%icc,	%i4,	%o6
	ldd	[%l7 + 0x18],	%l2
	movvs	%icc,	%g2,	%o5
	movgu	%xcc,	%o2,	%l5
	xnorcc	%l2,	0x08ED,	%g6
	movrlz	%o1,	%i3,	%i0
	srl	%g4,	%g1,	%l0
	umul	%g5,	%i1,	%i5
	edge32	%l6,	%i2,	%i7
	movge	%xcc,	%o7,	%o0
	udivcc	%i6,	0x1F4B,	%g3
	sll	%g7,	%l4,	%o4
	smulcc	%l1,	%i4,	%o6
	fcmpeq32	%f26,	%f28,	%o3
	edge32l	%g2,	%o5,	%o2
	fmovrdne	%l3,	%f6,	%f18
	ldsb	[%l7 + 0x72],	%l2
	sra	%g6,	0x0E,	%l5
	fmovdcc	%xcc,	%f26,	%f11
	fcmpne16	%f16,	%f4,	%o1
	lduw	[%l7 + 0x60],	%i3
	movgu	%icc,	%g4,	%g1
	fmovscc	%xcc,	%f29,	%f11
	orncc	%l0,	0x1EDC,	%g5
	fsrc2s	%f29,	%f10
	fmovrsgez	%i0,	%f12,	%f15
	and	%i5,	%l6,	%i2
	edge8l	%i1,	%i7,	%o0
	orcc	%o7,	%g3,	%i6
	addccc	%g7,	0x1268,	%o4
	fxnor	%f2,	%f20,	%f2
	ld	[%l7 + 0x50],	%f29
	array8	%l4,	%i4,	%l1
	edge8	%o3,	%o6,	%o5
	movvc	%icc,	%g2,	%l3
	sethi	0x1A28,	%o2
	fmovdle	%xcc,	%f1,	%f28
	edge32n	%l2,	%g6,	%o1
	alignaddrl	%i3,	%l5,	%g1
	orcc	%l0,	%g5,	%g4
	xnor	%i5,	%i0,	%i2
	stb	%l6,	[%l7 + 0x20]
	array8	%i1,	%i7,	%o0
	fmovsgu	%icc,	%f21,	%f17
	movg	%icc,	%g3,	%i6
	xnorcc	%g7,	0x079F,	%o7
	setx loop_58, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_58: 	movrne	%o3,	0x205,	%l1
	sll	%o5,	0x17,	%g2
	fmovdne	%xcc,	%f25,	%f30
	andncc	%o6,	%o2,	%l2
	fmovdvc	%xcc,	%f28,	%f10
	movle	%icc,	%g6,	%o1
	movcs	%icc,	%l3,	%l5
	addccc	%g1,	0x00DF,	%l0
	sdivcc	%g5,	0x049A,	%i3
	subcc	%g4,	0x0E5C,	%i0
	movrlez	%i2,	%l6,	%i1
	movrne	%i7,	%i5,	%o0
	restore %i6, 0x1B7E, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivcc	%o7,	0x068F,	%g7
	fmovdpos	%xcc,	%f22,	%f13
	sethi	0x1A12,	%i4
	orncc	%o4,	%o3,	%l1
	sub	%o5,	0x197B,	%g2
	fmovspos	%icc,	%f21,	%f15
	movge	%xcc,	%o6,	%l4
	xorcc	%l2,	%o2,	%g6
	subc	%o1,	0x1AD5,	%l5
	alignaddr	%g1,	%l3,	%g5
	ldd	[%l7 + 0x78],	%f12
	add	%l0,	0x0559,	%i3
	andcc	%i0,	0x05C2,	%g4
	st	%f28,	[%l7 + 0x54]
	fand	%f0,	%f28,	%f0
	add	%l6,	%i1,	%i2
	fmovdle	%icc,	%f17,	%f25
	movne	%xcc,	%i7,	%o0
	subc	%i6,	0x0FB6,	%g3
	andcc	%o7,	%i5,	%g7
	fpsub32s	%f19,	%f12,	%f29
	mulx	%o4,	%i4,	%l1
	fpadd32	%f4,	%f6,	%f8
	movrlez	%o3,	%g2,	%o5
	edge16	%l4,	%l2,	%o2
	and	%o6,	0x08CE,	%o1
	sth	%g6,	[%l7 + 0x7A]
	ldsw	[%l7 + 0x14],	%l5
	alignaddrl	%g1,	%g5,	%l0
	fmovsge	%xcc,	%f6,	%f14
	mova	%xcc,	%i3,	%i0
	edge32ln	%g4,	%l3,	%l6
	orcc	%i1,	%i2,	%o0
	mova	%xcc,	%i7,	%g3
	sra	%i6,	0x02,	%o7
	umul	%g7,	0x11EA,	%o4
	smul	%i5,	0x1151,	%l1
	ld	[%l7 + 0x54],	%f14
	alignaddr	%i4,	%g2,	%o3
	popc	%o5,	%l4
	stx	%l2,	[%l7 + 0x30]
	xorcc	%o2,	%o1,	%o6
	edge16ln	%l5,	%g1,	%g5
	edge8l	%l0,	%g6,	%i3
	fmovsleu	%xcc,	%f24,	%f8
	srlx	%g4,	%i0,	%l6
	subc	%i1,	%i2,	%l3
	edge8ln	%i7,	%o0,	%g3
	stx	%o7,	[%l7 + 0x10]
	srl	%i6,	%g7,	%o4
	orn	%l1,	%i5,	%g2
	fmovdgu	%xcc,	%f12,	%f8
	edge8n	%o3,	%i4,	%l4
	edge16n	%o5,	%l2,	%o1
	fnegd	%f14,	%f24
	udivcc	%o2,	0x0F6F,	%l5
	edge8l	%o6,	%g1,	%g5
	ldub	[%l7 + 0x68],	%g6
	edge16l	%i3,	%l0,	%i0
	fmul8x16al	%f27,	%f12,	%f16
	movgu	%icc,	%l6,	%i1
	edge32	%g4,	%l3,	%i7
	sdivcc	%i2,	0x085E,	%g3
	edge16l	%o7,	%o0,	%i6
	fmovsgu	%xcc,	%f9,	%f15
	udivx	%g7,	0x13B4,	%l1
	nop
	set	0x46, %g1
	ldsb	[%l7 + %g1],	%i5
	ldsw	[%l7 + 0x50],	%g2
	edge32l	%o3,	%i4,	%l4
	edge32ln	%o4,	%l2,	%o1
	edge32l	%o5,	%l5,	%o2
	ldsh	[%l7 + 0x1A],	%o6
	fmovrdlz	%g1,	%f10,	%f22
	edge16	%g6,	%i3,	%g5
	edge8	%i0,	%l0,	%l6
	movvc	%xcc,	%i1,	%g4
	stx	%i7,	[%l7 + 0x78]
	alignaddrl	%i2,	%l3,	%o7
	ldsw	[%l7 + 0x18],	%g3
	fcmpne16	%f28,	%f28,	%i6
	movge	%xcc,	%o0,	%g7
	fnegd	%f2,	%f20
	ldsh	[%l7 + 0x30],	%l1
	andncc	%i5,	%o3,	%g2
	siam	0x5
	ld	[%l7 + 0x20],	%f24
	fnot2	%f0,	%f18
	sdivx	%l4,	0x117A,	%i4
	fmovsn	%icc,	%f20,	%f19
	ldub	[%l7 + 0x46],	%l2
	fpack16	%f6,	%f0
	sdiv	%o1,	0x01D6,	%o4
	fones	%f20
	movgu	%xcc,	%l5,	%o5
	add	%o2,	%o6,	%g6
	ldd	[%l7 + 0x70],	%g0
	movre	%g5,	0x140,	%i3
	array32	%l0,	%l6,	%i1
	fmul8x16al	%f17,	%f21,	%f6
	save %i0, 0x1142, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge16n	%i7,	%i2,	%l3
	stb	%o7,	[%l7 + 0x50]
	edge32	%i6,	%o0,	%g3
	orncc	%l1,	%g7,	%o3
	array16	%i5,	%g2,	%i4
	fxnors	%f1,	%f19,	%f9
	andcc	%l2,	%o1,	%l4
	ld	[%l7 + 0x40],	%f30
	sethi	0x0EE4,	%l5
	ldx	[%l7 + 0x50],	%o5
	or	%o2,	%o6,	%o4
	fmovdg	%xcc,	%f17,	%f10
	movrlz	%g1,	0x2A9,	%g5
	udivcc	%g6,	0x17A6,	%i3
	subccc	%l0,	%i1,	%l6
	sdivcc	%i0,	0x1952,	%g4
	srl	%i7,	0x17,	%i2
	sir	0x1689
	fpsub16s	%f15,	%f24,	%f15
	edge16n	%o7,	%l3,	%i6
	add	%g3,	%l1,	%o0
	orncc	%o3,	0x00C6,	%i5
	movl	%xcc,	%g7,	%g2
	popc	0x079C,	%i4
	movrgez	%l2,	0x037,	%l4
	ldsh	[%l7 + 0x1A],	%l5
	smul	%o1,	%o2,	%o6
	movrne	%o4,	%g1,	%g5
	nop
	set	0x58, %o0
	ldsb	[%l7 + %o0],	%o5
	movleu	%xcc,	%g6,	%l0
	smul	%i3,	%i1,	%l6
	orn	%g4,	%i7,	%i2
	edge16l	%i0,	%o7,	%l3
	movn	%xcc,	%g3,	%i6
	fnands	%f7,	%f27,	%f30
	fandnot2	%f16,	%f26,	%f22
	smulcc	%o0,	0x1406,	%l1
	mulx	%i5,	%g7,	%o3
	edge32l	%i4,	%l2,	%g2
	setx loop_59, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_59: 	array8	%o1,	%o6,	%g1
	movle	%xcc,	%g5,	%o4
	mova	%icc,	%g6,	%o5
	fpadd16s	%f31,	%f26,	%f21
	movrgez	%l0,	0x211,	%i1
	andn	%l6,	0x15AE,	%i3
	subc	%i7,	%g4,	%i0
	srl	%i2,	0x1D,	%l3
	alignaddrl	%o7,	%i6,	%o0
	sdivx	%l1,	0x189A,	%g3
	movre	%g7,	0x18A,	%o3
	fmovrdlz	%i4,	%f4,	%f30
	edge32	%i5,	%l2,	%g2
	sdivcc	%l5,	0x1B2C,	%o2
	sdiv	%l4,	0x1441,	%o1
	subccc	%o6,	0x0868,	%g5
	orn	%g1,	%g6,	%o5
	sllx	%o4,	0x07,	%l0
	ldsh	[%l7 + 0x6A],	%l6
	edge32ln	%i3,	%i7,	%g4
	edge16ln	%i1,	%i2,	%i0
	sdivcc	%l3,	0x105B,	%o7
	xorcc	%o0,	0x101B,	%i6
	orncc	%l1,	0x191F,	%g7
	udivx	%g3,	0x0A4F,	%i4
	for	%f6,	%f6,	%f20
	fmul8x16al	%f27,	%f11,	%f30
	alignaddr	%o3,	%l2,	%g2
	nop
	set	0x10, %l4
	stx	%l5,	[%l7 + %l4]
	save %o2, 0x128D, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	array8	%i5,	%o1,	%o6
	subcc	%g5,	0x08D6,	%g6
	xorcc	%g1,	%o4,	%l0
	fmovse	%xcc,	%f28,	%f9
	fmovsgu	%xcc,	%f14,	%f6
	ldsw	[%l7 + 0x28],	%o5
	mova	%icc,	%l6,	%i7
	fnands	%f29,	%f20,	%f22
	fmovscs	%xcc,	%f5,	%f30
	sth	%g4,	[%l7 + 0x7A]
	movvc	%icc,	%i3,	%i2
	fmul8ulx16	%f24,	%f12,	%f16
	st	%f30,	[%l7 + 0x40]
	or	%i0,	0x0B4C,	%l3
	addc	%o7,	0x0B1C,	%i1
	edge8n	%o0,	%i6,	%l1
	udivcc	%g7,	0x1701,	%i4
	subccc	%g3,	%l2,	%o3
	fmovrde	%l5,	%f20,	%f16
	umulcc	%o2,	0x0BB4,	%g2
	ldd	[%l7 + 0x48],	%i4
	move	%icc,	%o1,	%l4
	movrgez	%o6,	0x0B5,	%g5
	fnegs	%f4,	%f8
	srlx	%g6,	%o4,	%g1
	mova	%xcc,	%l0,	%o5
	stw	%l6,	[%l7 + 0x74]
	addc	%i7,	%g4,	%i2
	array8	%i3,	%l3,	%o7
	movn	%icc,	%i0,	%o0
	fmovdge	%icc,	%f13,	%f30
	popc	0x0397,	%i1
	orn	%l1,	%i6,	%g7
	xor	%g3,	0x0100,	%l2
	movleu	%icc,	%o3,	%l5
	addccc	%o2,	%i4,	%i5
	stb	%o1,	[%l7 + 0x09]
	sdivcc	%g2,	0x03D5,	%l4
	edge32n	%o6,	%g6,	%g5
	array32	%g1,	%o4,	%o5
	edge8	%l0,	%l6,	%g4
	fmovsa	%xcc,	%f15,	%f16
	nop
	set	0x70, %l1
	ldsw	[%l7 + %l1],	%i7
	edge8n	%i2,	%l3,	%o7
	fmovse	%xcc,	%f25,	%f22
	movneg	%xcc,	%i0,	%o0
	edge16n	%i3,	%i1,	%i6
	fpack32	%f2,	%f4,	%f22
	movvc	%icc,	%l1,	%g7
	ldsw	[%l7 + 0x68],	%g3
	mulx	%o3,	0x0E4E,	%l2
	fmovrde	%o2,	%f28,	%f18
	movleu	%xcc,	%l5,	%i5
	fmovsge	%icc,	%f29,	%f18
	edge8l	%o1,	%g2,	%l4
	ldx	[%l7 + 0x58],	%i4
	edge32ln	%o6,	%g5,	%g1
	movne	%xcc,	%o4,	%g6
	alignaddrl	%l0,	%l6,	%o5
	xnorcc	%g4,	%i7,	%i2
	movneg	%icc,	%l3,	%o7
	srax	%o0,	0x1F,	%i0
	fcmpgt16	%f16,	%f20,	%i3
	sra	%i6,	0x12,	%i1
	movl	%icc,	%g7,	%g3
	fand	%f28,	%f4,	%f16
	stw	%l1,	[%l7 + 0x24]
	fmovd	%f18,	%f12
	ldsh	[%l7 + 0x40],	%l2
	sir	0x00A5
	movrne	%o2,	0x122,	%l5
	stb	%o3,	[%l7 + 0x1F]
	ldsh	[%l7 + 0x48],	%i5
	std	%f6,	[%l7 + 0x08]
	fcmpeq16	%f28,	%f12,	%o1
	fmovsn	%xcc,	%f13,	%f17
	edge8l	%l4,	%i4,	%o6
	movcs	%icc,	%g5,	%g1
	orn	%o4,	0x0209,	%g2
	fzero	%f24
	movvs	%xcc,	%l0,	%l6
	orn	%o5,	%g6,	%g4
	edge8l	%i2,	%i7,	%l3
	fmovdl	%xcc,	%f0,	%f5
	fmovs	%f26,	%f15
	ldsh	[%l7 + 0x60],	%o7
	fones	%f2
	fmul8x16al	%f8,	%f23,	%f28
	srax	%i0,	%o0,	%i3
	udiv	%i6,	0x05B1,	%g7
	fabsd	%f4,	%f18
	subcc	%g3,	0x05B6,	%i1
	edge16l	%l2,	%l1,	%l5
	nop
	set	0x34, %g3
	ldub	[%l7 + %g3],	%o2
	movleu	%icc,	%o3,	%i5
	array8	%o1,	%l4,	%i4
	save %o6, %g5, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdlz	%g2,	%f24,	%f10
	ldsh	[%l7 + 0x6E],	%l0
	movge	%icc,	%l6,	%o5
	fnot1s	%f1,	%f1
	or	%g6,	0x1A32,	%g4
	udiv	%o4,	0x191C,	%i2
	fmovsn	%xcc,	%f14,	%f23
	fsrc2	%f6,	%f20
	addccc	%l3,	%o7,	%i0
	movge	%xcc,	%i7,	%i3
	fmovsle	%icc,	%f21,	%f14
	and	%o0,	%g7,	%g3
	edge16ln	%i1,	%i6,	%l2
	movvs	%xcc,	%l5,	%l1
	subcc	%o3,	%i5,	%o2
	xnorcc	%o1,	0x0C94,	%i4
	movgu	%icc,	%o6,	%g5
	movcc	%xcc,	%l4,	%g2
	addccc	%l0,	%g1,	%o5
	ldd	[%l7 + 0x08],	%g6
	stb	%l6,	[%l7 + 0x3B]
	fcmple32	%f22,	%f14,	%g4
	stw	%i2,	[%l7 + 0x78]
	subcc	%o4,	0x1E66,	%l3
	lduw	[%l7 + 0x18],	%i0
	sir	0x00C4
	fcmpd	%fcc2,	%f4,	%f12
	fnands	%f3,	%f13,	%f12
	srl	%i7,	%o7,	%i3
	st	%f6,	[%l7 + 0x70]
	sra	%g7,	0x08,	%g3
	movneg	%xcc,	%o0,	%i6
	orncc	%i1,	0x0A37,	%l5
	fpadd16s	%f2,	%f1,	%f26
	ldsb	[%l7 + 0x6B],	%l2
	std	%f10,	[%l7 + 0x40]
	srl	%l1,	%o3,	%i5
	edge32	%o1,	%o2,	%i4
	ldd	[%l7 + 0x68],	%o6
	movcc	%xcc,	%l4,	%g5
	mulscc	%g2,	%g1,	%o5
	fornot2	%f20,	%f12,	%f14
	fmovse	%xcc,	%f4,	%f3
	xnorcc	%l0,	%g6,	%l6
	fmovsge	%xcc,	%f11,	%f14
	xorcc	%g4,	0x1975,	%i2
	sub	%l3,	%o4,	%i0
	save %o7, 0x1E76, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	add	%i7,	0x1477,	%g3
	lduh	[%l7 + 0x18],	%g7
	edge32l	%i6,	%o0,	%l5
	mulx	%l2,	0x1A31,	%l1
	fmovdle	%icc,	%f7,	%f27
	orn	%i1,	0x0E89,	%o3
	movpos	%icc,	%o1,	%i5
	mulscc	%i4,	%o6,	%o2
	fnot1	%f24,	%f0
	xnorcc	%l4,	0x05CB,	%g2
	edge16	%g1,	%o5,	%l0
	edge8	%g6,	%g5,	%g4
	andcc	%i2,	%l6,	%l3
	ld	[%l7 + 0x24],	%f2
	smulcc	%o4,	0x0B6A,	%o7
	move	%xcc,	%i3,	%i0
	movleu	%icc,	%g3,	%i7
	sth	%i6,	[%l7 + 0x74]
	edge8ln	%g7,	%o0,	%l2
	movrgez	%l5,	0x117,	%i1
	udivcc	%o3,	0x0AC2,	%l1
	pdist	%f6,	%f16,	%f26
	lduw	[%l7 + 0x68],	%i5
	movrgez	%i4,	0x168,	%o1
	fsrc2s	%f8,	%f21
	fmul8sux16	%f8,	%f18,	%f0
	edge8	%o6,	%o2,	%l4
	udiv	%g1,	0x1CF9,	%o5
	movrlez	%l0,	0x37C,	%g6
	fmovscc	%xcc,	%f25,	%f29
	save %g2, 0x0783, %g5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%g4,	%l6
	fpadd16	%f22,	%f16,	%f12
	srl	%l3,	0x0C,	%o4
	umul	%o7,	%i3,	%i0
	edge8n	%g3,	%i2,	%i7
	movcc	%icc,	%g7,	%o0
	fcmpd	%fcc3,	%f20,	%f20
	sdiv	%i6,	0x1EE6,	%l5
	sllx	%l2,	%o3,	%l1
	fmovrde	%i1,	%f24,	%f10
	movl	%icc,	%i4,	%i5
	orn	%o6,	%o1,	%l4
	movneg	%xcc,	%o2,	%g1
	movvc	%xcc,	%o5,	%g6
	edge16ln	%g2,	%l0,	%g5
	xor	%l6,	%l3,	%o4
	movle	%xcc,	%o7,	%g4
	fmovrsne	%i3,	%f16,	%f5
	movne	%xcc,	%g3,	%i2
	smul	%i0,	%g7,	%i7
	fxnor	%f18,	%f4,	%f20
	movneg	%icc,	%i6,	%o0
	movrlz	%l2,	0x10F,	%o3
	edge32ln	%l1,	%l5,	%i1
	stb	%i4,	[%l7 + 0x15]
	movrne	%i5,	0x3C0,	%o1
	fnegs	%f23,	%f16
	movge	%xcc,	%o6,	%o2
	sdivx	%g1,	0x1459,	%l4
	sub	%o5,	0x1A7D,	%g6
	fmul8x16au	%f10,	%f19,	%f24
	edge8n	%l0,	%g5,	%l6
	stw	%g2,	[%l7 + 0x30]
	sdiv	%o4,	0x1145,	%o7
	udiv	%g4,	0x1C19,	%i3
	sub	%g3,	%i2,	%l3
	udivcc	%i0,	0x15D7,	%g7
	edge32	%i6,	%o0,	%l2
	orncc	%o3,	%l1,	%l5
	st	%f25,	[%l7 + 0x20]
	fpadd32s	%f26,	%f0,	%f31
	fcmpgt32	%f12,	%f28,	%i7
	save %i4, %i1, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	and	%o6,	0x06A4,	%o2
	sra	%g1,	0x13,	%i5
	fnands	%f18,	%f18,	%f10
	array32	%o5,	%l4,	%l0
	fornot2	%f10,	%f16,	%f16
	fmovs	%f17,	%f5
	restore %g5, 0x0E81, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%g6,	%g2,	%o4
	addccc	%g4,	0x09DD,	%o7
	umulcc	%i3,	0x06FE,	%i2
	mulx	%l3,	0x04B4,	%i0
	ldd	[%l7 + 0x58],	%g2
	srlx	%i6,	0x01,	%o0
	ldd	[%l7 + 0x78],	%l2
	xorcc	%o3,	0x18CD,	%g7
	movl	%icc,	%l1,	%l5
	fsrc2s	%f26,	%f22
	ld	[%l7 + 0x48],	%f9
	sir	0x1EC3
	lduw	[%l7 + 0x54],	%i4
	subcc	%i1,	0x1E25,	%i7
	array8	%o1,	%o2,	%o6
	fandnot1s	%f3,	%f24,	%f30
	move	%xcc,	%g1,	%i5
	fcmped	%fcc3,	%f0,	%f2
	fmovrdne	%l4,	%f22,	%f8
	ldd	[%l7 + 0x30],	%l0
	fcmpne16	%f18,	%f22,	%o5
	addcc	%g5,	%l6,	%g6
	xor	%g2,	%g4,	%o7
	addccc	%o4,	%i2,	%i3
	fmovsa	%xcc,	%f7,	%f5
	std	%f20,	[%l7 + 0x30]
	edge8	%l3,	%i0,	%i6
	andn	%o0,	0x1344,	%g3
	fmovsgu	%xcc,	%f4,	%f7
	move	%xcc,	%l2,	%g7
	movre	%o3,	%l1,	%i4
	srlx	%i1,	%l5,	%i7
	subcc	%o2,	0x08BA,	%o6
	fmovsa	%xcc,	%f0,	%f1
	movrlz	%g1,	%o1,	%l4
	array32	%i5,	%l0,	%o5
	movre	%l6,	0x319,	%g6
	movleu	%icc,	%g2,	%g4
	edge32l	%g5,	%o4,	%i2
	srax	%o7,	%l3,	%i0
	fnegd	%f2,	%f26
	movrlez	%i3,	%i6,	%o0
	srax	%g3,	0x0D,	%l2
	andn	%g7,	%o3,	%i4
	udiv	%i1,	0x1AD0,	%l5
	fcmpeq16	%f16,	%f0,	%l1
	orncc	%i7,	0x196F,	%o6
	edge8ln	%o2,	%g1,	%o1
	add	%i5,	0x0DCA,	%l4
	xnor	%o5,	%l6,	%g6
	edge8ln	%g2,	%l0,	%g5
	edge32n	%o4,	%i2,	%g4
	mulscc	%o7,	%l3,	%i3
	movpos	%xcc,	%i6,	%i0
	sra	%o0,	0x07,	%l2
	sdivx	%g7,	0x05D2,	%o3
	add	%i4,	%g3,	%i1
	movg	%xcc,	%l5,	%l1
	sth	%i7,	[%l7 + 0x7E]
	movleu	%xcc,	%o2,	%g1
	fpmerge	%f3,	%f8,	%f28
	mulscc	%o6,	0x1B4B,	%o1
	movre	%l4,	%o5,	%i5
	fsrc2	%f2,	%f6
	fmovdle	%icc,	%f5,	%f22
	edge32	%l6,	%g6,	%g2
	movneg	%xcc,	%l0,	%o4
	mova	%xcc,	%i2,	%g5
	fmovspos	%xcc,	%f23,	%f1
	srax	%g4,	0x0A,	%o7
	movleu	%xcc,	%l3,	%i3
	orn	%i0,	%o0,	%i6
	fxnor	%f2,	%f0,	%f12
	ldub	[%l7 + 0x35],	%g7
	movre	%o3,	%l2,	%i4
	bshuffle	%f28,	%f26,	%f20
	umulcc	%i1,	0x0C43,	%l5
	movre	%l1,	0x3A0,	%g3
	edge32l	%i7,	%o2,	%g1
	edge32l	%o6,	%l4,	%o5
	array16	%o1,	%i5,	%g6
	ldx	[%l7 + 0x08],	%l6
	srax	%g2,	0x09,	%l0
	movl	%xcc,	%i2,	%o4
	fnegs	%f9,	%f6
	movrgz	%g4,	%g5,	%o7
	movrlez	%l3,	0x28F,	%i3
	faligndata	%f4,	%f30,	%f2
	movne	%icc,	%o0,	%i0
	subc	%i6,	0x07E3,	%o3
	fpsub32	%f26,	%f10,	%f30
	fmuld8sux16	%f8,	%f21,	%f4
	umulcc	%g7,	%l2,	%i1
	andn	%i4,	0x19F6,	%l1
	xnor	%g3,	0x0D71,	%i7
	edge32n	%l5,	%g1,	%o6
	orcc	%o2,	0x0426,	%l4
	ldub	[%l7 + 0x5E],	%o1
	udivx	%o5,	0x1754,	%i5
	fmovrsgez	%l6,	%f3,	%f8
	movne	%icc,	%g2,	%g6
	sll	%i2,	%l0,	%g4
	stx	%g5,	[%l7 + 0x40]
	sir	0x0ACC
	edge8ln	%o7,	%l3,	%o4
	edge8	%i3,	%o0,	%i6
	sdivx	%o3,	0x1429,	%g7
	ldub	[%l7 + 0x75],	%l2
	mova	%icc,	%i1,	%i4
	fmul8x16al	%f15,	%f20,	%f2
	umul	%i0,	%l1,	%i7
	popc	0x124A,	%g3
	st	%f20,	[%l7 + 0x70]
	fornot2s	%f16,	%f26,	%f21
	fmovdge	%icc,	%f4,	%f5
	fornot2	%f8,	%f18,	%f22
	movrlez	%l5,	0x05C,	%g1
	udivx	%o6,	0x15D3,	%l4
	sub	%o1,	%o5,	%o2
	ldd	[%l7 + 0x10],	%i6
	movle	%icc,	%g2,	%i5
	mulx	%i2,	0x172B,	%l0
	movvc	%icc,	%g4,	%g6
	fmovdg	%xcc,	%f26,	%f11
	movg	%xcc,	%g5,	%o7
	movn	%icc,	%o4,	%i3
	fmul8sux16	%f16,	%f2,	%f28
	smul	%o0,	%l3,	%o3
	sdivcc	%i6,	0x10E8,	%g7
	ld	[%l7 + 0x14],	%f31
	fxor	%f22,	%f10,	%f16
	fmovsne	%xcc,	%f4,	%f5
	fornot2	%f6,	%f2,	%f10
	array8	%l2,	%i1,	%i0
	add	%i4,	%l1,	%g3
	movcs	%icc,	%l5,	%i7
	movle	%icc,	%o6,	%l4
	fandnot2	%f14,	%f14,	%f26
	movl	%icc,	%g1,	%o1
	movgu	%xcc,	%o5,	%o2
	fmovda	%xcc,	%f28,	%f6
	movge	%xcc,	%g2,	%i5
	edge16	%l6,	%l0,	%g4
	fone	%f0
	ldd	[%l7 + 0x78],	%f28
	movneg	%xcc,	%i2,	%g5
	movle	%icc,	%o7,	%o4
	sir	0x192A
	sir	0x1EC8
	sir	0x1101
	edge16n	%g6,	%o0,	%i3
	std	%f22,	[%l7 + 0x50]
	and	%o3,	%l3,	%g7
	fmovrdgez	%l2,	%f18,	%f8
	array8	%i6,	%i0,	%i1
	nop
	set	0x28, %i5
	ldx	[%l7 + %i5],	%i4
	sdivx	%l1,	0x0A20,	%l5
	and	%g3,	%i7,	%l4
	add	%o6,	%o1,	%o5
	nop
	set	0x30, %i3
	stw	%g1,	[%l7 + %i3]
	fmovsle	%icc,	%f31,	%f20
	sdivx	%g2,	0x1AF9,	%i5
	movge	%xcc,	%l6,	%l0
	fmovrde	%g4,	%f20,	%f6
	movrgz	%i2,	%o2,	%g5
	stb	%o4,	[%l7 + 0x2A]
	save %g6, 0x1427, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovdl	%xcc,	%f30,	%f9
	xorcc	%o7,	0x04D7,	%o3
	fand	%f30,	%f4,	%f2
	udivx	%l3,	0x0908,	%g7
	mova	%icc,	%i3,	%l2
	umulcc	%i6,	%i0,	%i1
	fnors	%f2,	%f20,	%f24
	addc	%l1,	0x02F0,	%l5
	orcc	%i4,	0x0B8A,	%i7
	movneg	%xcc,	%g3,	%l4
	ldsh	[%l7 + 0x52],	%o6
	edge16n	%o1,	%o5,	%g1
	movcc	%icc,	%g2,	%l6
	sethi	0x128F,	%l0
	movpos	%xcc,	%i5,	%g4
	sll	%i2,	0x06,	%o2
	srl	%g5,	0x0C,	%g6
	ldsb	[%l7 + 0x0A],	%o0
	movvs	%icc,	%o4,	%o3
	edge32n	%l3,	%o7,	%g7
	ldsw	[%l7 + 0x24],	%l2
	movleu	%xcc,	%i3,	%i0
	st	%f4,	[%l7 + 0x24]
	stx	%i6,	[%l7 + 0x18]
	nop
	set	0x58, %g6
	ldd	[%l7 + %g6],	%f26
	smul	%i1,	%l1,	%l5
	and	%i7,	%i4,	%g3
	mulscc	%o6,	%l4,	%o1
	sllx	%g1,	0x0D,	%o5
	srlx	%l6,	%g2,	%l0
	array8	%g4,	%i2,	%o2
	sub	%g5,	0x0EB6,	%g6
	mova	%xcc,	%i5,	%o0
	fmovdpos	%xcc,	%f26,	%f30
	movrlez	%o3,	%o4,	%o7
	fmovdne	%icc,	%f20,	%f16
	fmovdgu	%xcc,	%f20,	%f17
	lduh	[%l7 + 0x32],	%g7
	movvc	%xcc,	%l3,	%l2
	addc	%i0,	%i6,	%i1
	movne	%xcc,	%i3,	%l5
	ldd	[%l7 + 0x70],	%f8
	mulx	%l1,	0x079E,	%i4
	orcc	%g3,	0x1FA1,	%o6
	sir	0x0558
	umul	%i7,	%l4,	%o1
	array32	%g1,	%l6,	%g2
	mulx	%o5,	0x02C9,	%g4
	fpack16	%f24,	%f30
	ldsh	[%l7 + 0x2E],	%i2
	st	%f9,	[%l7 + 0x2C]
	fpsub16s	%f30,	%f13,	%f27
	lduh	[%l7 + 0x7A],	%l0
	fabsd	%f20,	%f16
	mulscc	%o2,	%g5,	%i5
	subcc	%o0,	0x1E1E,	%o3
	srl	%g6,	%o7,	%g7
	fmovsg	%icc,	%f28,	%f12
	or	%o4,	%l3,	%i0
	setx loop_60, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_60: 	andncc	%l5,	%l2,	%i4
	udivcc	%g3,	0x0EFB,	%o6
	movleu	%icc,	%l1,	%i7
	fandnot2s	%f0,	%f11,	%f1
	orncc	%o1,	0x04C8,	%l4
	nop
	set	0x18, %o7
	ldx	[%l7 + %o7],	%g1
	edge16	%l6,	%g2,	%g4
	add	%i2,	%l0,	%o2
	movleu	%icc,	%o5,	%i5
	sdivcc	%g5,	0x0B3D,	%o0
	fmovsvs	%xcc,	%f7,	%f28
	sdiv	%o3,	0x130F,	%o7
	and	%g6,	0x1474,	%g7
	fmovd	%f8,	%f0
	sll	%o4,	%i0,	%i6
	umulcc	%i1,	%i3,	%l3
	movcc	%xcc,	%l5,	%i4
	xor	%g3,	%o6,	%l1
	fmul8x16au	%f9,	%f2,	%f24
	movvc	%xcc,	%l2,	%i7
	fmovdcs	%xcc,	%f29,	%f22
	movle	%icc,	%l4,	%g1
	fmuld8sux16	%f5,	%f13,	%f16
	ldsb	[%l7 + 0x3E],	%o1
	movleu	%xcc,	%g2,	%l6
	fmovrdne	%g4,	%f16,	%f8
	edge16ln	%i2,	%l0,	%o2
	fandnot1s	%f1,	%f19,	%f10
	fmovdleu	%xcc,	%f6,	%f23
	sdivcc	%i5,	0x1919,	%o5
	edge8l	%g5,	%o0,	%o7
	srax	%g6,	%g7,	%o4
	edge16	%i0,	%o3,	%i6
	sir	0x14C1
	stx	%i3,	[%l7 + 0x28]
	ldsh	[%l7 + 0x5C],	%i1
	fnot2s	%f1,	%f16
	ldx	[%l7 + 0x60],	%l5
	stx	%l3,	[%l7 + 0x70]
	xorcc	%i4,	%o6,	%l1
	sth	%g3,	[%l7 + 0x50]
	orcc	%i7,	%l2,	%g1
	nop
	set	0x08, %i4
	stw	%o1,	[%l7 + %i4]
	sdiv	%l4,	0x1875,	%l6
	subc	%g4,	0x011A,	%g2
	xorcc	%i2,	0x033F,	%l0
	ldsb	[%l7 + 0x33],	%o2
	fcmps	%fcc3,	%f16,	%f20
	fmovsl	%xcc,	%f5,	%f8
	ldd	[%l7 + 0x78],	%i4
	edge16	%o5,	%o0,	%g5
	array8	%o7,	%g6,	%o4
	fnot2	%f20,	%f18
	fornot2s	%f17,	%f0,	%f26
	sethi	0x1223,	%g7
	add	%i0,	0x1DF9,	%i6
	mulscc	%i3,	%o3,	%l5
	orcc	%i1,	%i4,	%l3
	xnor	%o6,	%g3,	%l1
	xorcc	%l2,	0x01C5,	%i7
	stw	%o1,	[%l7 + 0x44]
	edge16l	%l4,	%l6,	%g1
	edge8l	%g2,	%i2,	%g4
	addc	%o2,	%l0,	%o5
	srax	%i5,	%g5,	%o7
	st	%f5,	[%l7 + 0x28]
	orcc	%o0,	%g6,	%g7
	ldub	[%l7 + 0x35],	%o4
	sdiv	%i6,	0x10E5,	%i0
	movrne	%i3,	%o3,	%l5
	nop
	set	0x30, %l6
	std	%f20,	[%l7 + %l6]
	andncc	%i4,	%i1,	%o6
	movrlez	%g3,	0x035,	%l1
	fornot2	%f16,	%f0,	%f22
	udivcc	%l2,	0x0FA2,	%l3
	subccc	%i7,	%o1,	%l4
	popc	0x0D16,	%g1
	fnors	%f17,	%f20,	%f13
	movgu	%xcc,	%g2,	%i2
	srlx	%g4,	0x15,	%o2
	xnorcc	%l0,	0x17A1,	%o5
	sdiv	%i5,	0x0C02,	%l6
	add	%g5,	0x0ACE,	%o7
	siam	0x0
	edge8	%g6,	%g7,	%o4
	array8	%i6,	%i0,	%i3
	alignaddr	%o0,	%o3,	%i4
	edge8	%l5,	%o6,	%g3
	ldx	[%l7 + 0x10],	%i1
	edge8l	%l1,	%l3,	%i7
	udiv	%l2,	0x0561,	%l4
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%o1
	fornot1	%f8,	%f2,	%f2
	movrlez	%g1,	0x138,	%g2
	fmul8x16au	%f21,	%f27,	%f6
	move	%xcc,	%g4,	%i2
	move	%icc,	%l0,	%o2
	mova	%icc,	%i5,	%l6
	fcmped	%fcc1,	%f20,	%f16
	udivx	%g5,	0x16CB,	%o5
	subccc	%o7,	%g6,	%g7
	sdiv	%o4,	0x0CD5,	%i6
	ldd	[%l7 + 0x60],	%f2
	movg	%xcc,	%i0,	%o0
	fand	%f24,	%f4,	%f20
	movleu	%icc,	%i3,	%o3
	xnorcc	%l5,	%o6,	%i4
	movpos	%xcc,	%i1,	%g3
	srlx	%l3,	0x1B,	%i7
	ld	[%l7 + 0x4C],	%f18
	fmovda	%xcc,	%f31,	%f3
	movcc	%icc,	%l2,	%l4
	sethi	0x049C,	%o1
	xor	%l1,	0x1E2E,	%g2
	movne	%icc,	%g4,	%i2
	xnorcc	%l0,	%g1,	%i5
	fandnot1s	%f24,	%f19,	%f11
	udivx	%l6,	0x0229,	%g5
	movpos	%icc,	%o2,	%o7
	edge32ln	%o5,	%g7,	%o4
	ldsw	[%l7 + 0x44],	%i6
	edge8	%i0,	%g6,	%i3
	movne	%icc,	%o0,	%l5
	subccc	%o6,	%i4,	%o3
	mulscc	%i1,	%g3,	%i7
	orcc	%l3,	0x0958,	%l2
	fcmped	%fcc2,	%f24,	%f10
	udivcc	%l4,	0x12DC,	%o1
	movg	%xcc,	%g2,	%g4
	sra	%l1,	0x09,	%i2
	andncc	%l0,	%g1,	%i5
	fcmple32	%f2,	%f6,	%l6
	fmovdg	%icc,	%f5,	%f6
	edge16n	%o2,	%o7,	%g5
	fpadd16s	%f13,	%f28,	%f24
	restore %g7, 0x08DC, %o4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnor	%f18,	%f30,	%f20
	movre	%i6,	%o5,	%g6
	mulscc	%i0,	%i3,	%l5
	smulcc	%o6,	0x0E93,	%o0
	movne	%xcc,	%i4,	%o3
	array8	%i1,	%g3,	%i7
	sdivcc	%l3,	0x03FD,	%l2
	sub	%l4,	%o1,	%g2
	smulcc	%g4,	0x0E02,	%i2
	ldsb	[%l7 + 0x43],	%l0
	orncc	%g1,	0x0CD9,	%i5
	andncc	%l6,	%o2,	%o7
	sub	%l1,	%g5,	%g7
	add	%i6,	0x0D0E,	%o4
	xnor	%o5,	%g6,	%i3
	xnorcc	%i0,	0x15D7,	%l5
	mulscc	%o6,	0x0489,	%i4
	edge8	%o0,	%i1,	%o3
	subc	%i7,	%g3,	%l3
	or	%l2,	0x1515,	%o1
	edge32l	%g2,	%g4,	%l4
	array8	%i2,	%g1,	%i5
	ldd	[%l7 + 0x58],	%l0
	fpack32	%f6,	%f2,	%f20
	sub	%l6,	%o7,	%l1
	fmovda	%xcc,	%f29,	%f23
	stx	%g5,	[%l7 + 0x20]
	movne	%icc,	%g7,	%o2
	orcc	%o4,	0x0D89,	%i6
	ldd	[%l7 + 0x28],	%o4
	st	%f30,	[%l7 + 0x10]
	save %i3, 0x1BF3, %i0
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
loop_61: 	fmovdn	%icc,	%f25,	%f7
	xor	%o0,	0x01DC,	%i4
	ldd	[%l7 + 0x40],	%f8
	andn	%i1,	0x076E,	%i7
	fmovrdgez	%o3,	%f16,	%f16
	fmovrde	%l3,	%f12,	%f20
	xnor	%l2,	0x14D8,	%o1
	ldsw	[%l7 + 0x34],	%g3
	movgu	%xcc,	%g4,	%l4
	fmovspos	%xcc,	%f26,	%f5
	or	%g2,	%i2,	%i5
	ldub	[%l7 + 0x2A],	%g1
	sir	0x03EF
	mova	%icc,	%l6,	%l0
	fmovdn	%xcc,	%f23,	%f26
	fmovsvs	%xcc,	%f11,	%f8
	xor	%o7,	0x01A2,	%g5
	orn	%g7,	%o2,	%l1
	movgu	%xcc,	%o4,	%i6
	addccc	%i3,	0x1840,	%i0
	save %l5, 0x00AC, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovrdgez	%g6,	%f30,	%f30
	fmovsleu	%xcc,	%f11,	%f17
	sdivx	%o0,	0x134A,	%o6
	orncc	%i1,	0x017F,	%i4
	save %i7, %l3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%l2,	0x19,	%o1
	edge16l	%g4,	%l4,	%g2
	st	%f31,	[%l7 + 0x14]
	andcc	%i2,	0x13F7,	%i5
	movneg	%icc,	%g1,	%g3
	st	%f10,	[%l7 + 0x10]
	sll	%l6,	%o7,	%l0
	movge	%icc,	%g7,	%o2
	subccc	%l1,	0x04DB,	%o4
	movne	%xcc,	%i6,	%i3
	sub	%i0,	0x17D8,	%l5
	fmovsne	%icc,	%f16,	%f6
	array8	%g5,	%o5,	%o0
	edge16n	%o6,	%i1,	%g6
	orcc	%i7,	0x01B8,	%l3
	sll	%i4,	%l2,	%o3
	movgu	%xcc,	%g4,	%o1
	movvc	%xcc,	%g2,	%l4
	siam	0x0
	fcmpeq32	%f2,	%f12,	%i2
	fcmpeq16	%f22,	%f16,	%i5
	orcc	%g1,	0x1C4E,	%g3
	st	%f16,	[%l7 + 0x4C]
	fmovsvc	%xcc,	%f4,	%f22
	lduh	[%l7 + 0x40],	%l6
	stw	%o7,	[%l7 + 0x60]
	ldsb	[%l7 + 0x0F],	%g7
	restore %l0, 0x009F, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%l1,	%i6,	%o4
	ldx	[%l7 + 0x30],	%i3
	fexpand	%f19,	%f30
	sub	%i0,	%l5,	%o5
	array16	%g5,	%o0,	%o6
	andn	%i1,	0x1D08,	%g6
	movcs	%xcc,	%i7,	%l3
	orn	%i4,	0x00BB,	%l2
	movleu	%icc,	%g4,	%o3
	andcc	%o1,	0x16A0,	%g2
	fmuld8sux16	%f25,	%f20,	%f16
	edge16	%l4,	%i5,	%i2
	movl	%xcc,	%g1,	%g3
	movl	%icc,	%o7,	%l6
	fmul8sux16	%f14,	%f18,	%f12
	movrlez	%g7,	0x0B8,	%l0
	movpos	%icc,	%o2,	%i6
	srl	%l1,	%i3,	%o4
	ldd	[%l7 + 0x70],	%i0
	sir	0x10AF
	movneg	%xcc,	%o5,	%g5
	sth	%o0,	[%l7 + 0x0C]
	sth	%l5,	[%l7 + 0x78]
	xnor	%i1,	0x076E,	%g6
	movcs	%xcc,	%i7,	%l3
	ldd	[%l7 + 0x78],	%f28
	orncc	%i4,	0x1949,	%l2
	or	%g4,	0x1CE2,	%o3
	lduw	[%l7 + 0x20],	%o1
	or	%g2,	0x1F65,	%o6
	ldsw	[%l7 + 0x30],	%i5
	fmovrsgez	%l4,	%f25,	%f30
	add	%g1,	0x00AC,	%g3
	movcc	%icc,	%o7,	%i2
	sethi	0x1DA6,	%l6
	edge8n	%l0,	%o2,	%g7
	fnot2s	%f3,	%f29
	sir	0x1A7D
	fmovsvs	%icc,	%f4,	%f11
	subc	%l1,	%i3,	%o4
	fmovdvs	%xcc,	%f15,	%f7
	edge32	%i6,	%i0,	%g5
	orncc	%o0,	0x1758,	%l5
	movvc	%icc,	%i1,	%g6
	siam	0x7
	andcc	%i7,	0x09F5,	%l3
	sethi	0x05D4,	%i4
	array32	%l2,	%o5,	%o3
	ldsh	[%l7 + 0x5E],	%o1
	movne	%xcc,	%g4,	%o6
	udivcc	%i5,	0x1FB4,	%g2
	andn	%l4,	0x0E00,	%g1
	umul	%g3,	%o7,	%i2
	fsrc2s	%f24,	%f29
	edge8l	%l6,	%o2,	%l0
	movle	%icc,	%g7,	%i3
	fmul8x16au	%f6,	%f27,	%f2
	fxnors	%f26,	%f14,	%f30
	bshuffle	%f6,	%f10,	%f4
	movneg	%xcc,	%l1,	%o4
	movleu	%icc,	%i0,	%g5
	movpos	%icc,	%i6,	%o0
	udiv	%l5,	0x0C3E,	%g6
	movrlz	%i7,	0x368,	%i1
	save %i4, %l2, %l3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_62, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_62: 	movne	%icc,	%g4,	%i5
	movre	%g2,	%l4,	%o6
	subcc	%g1,	%o7,	%g3
	movne	%xcc,	%i2,	%l6
	fmovsle	%xcc,	%f16,	%f15
	sethi	0x0148,	%o2
	subccc	%g7,	0x1CB7,	%l0
	stx	%i3,	[%l7 + 0x78]
	fandnot2	%f6,	%f30,	%f22
	ldub	[%l7 + 0x62],	%o4
	andn	%l1,	0x1B95,	%g5
	ldsb	[%l7 + 0x6E],	%i6
	udiv	%i0,	0x1F7A,	%l5
	ldsh	[%l7 + 0x42],	%o0
	fxnors	%f20,	%f9,	%f29
	movleu	%icc,	%g6,	%i7
	sra	%i4,	%i1,	%l3
	sll	%o5,	%l2,	%o3
	array32	%o1,	%i5,	%g4
	save %l4, %g2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	ldx	[%l7 + 0x48],	%o7
	movpos	%xcc,	%g3,	%i2
	edge16n	%l6,	%o6,	%o2
	movg	%xcc,	%l0,	%g7
	fnot1	%f10,	%f12
	ldsb	[%l7 + 0x2F],	%i3
	movcs	%icc,	%l1,	%o4
	and	%i6,	0x0EDB,	%i0
	nop
	set	0x74, %g4
	ldub	[%l7 + %g4],	%g5
	edge8l	%l5,	%o0,	%i7
	xor	%g6,	%i4,	%i1
	movcc	%xcc,	%l3,	%o5
	ldsh	[%l7 + 0x2A],	%l2
	and	%o1,	0x1306,	%i5
	stw	%o3,	[%l7 + 0x24]
	edge16l	%g4,	%l4,	%g2
	ldsw	[%l7 + 0x28],	%g1
	xorcc	%g3,	0x1B2B,	%o7
	ld	[%l7 + 0x2C],	%f0
	nop
	set	0x34, %o5
	ldsw	[%l7 + %o5],	%l6
	xor	%i2,	0x0718,	%o2
	orncc	%o6,	0x0F7D,	%g7
	movleu	%icc,	%l0,	%l1
	movle	%xcc,	%i3,	%i6
	subccc	%o4,	%g5,	%l5
	udivx	%i0,	0x0811,	%o0
	movvc	%xcc,	%i7,	%g6
	fmovsn	%xcc,	%f2,	%f11
	fxors	%f3,	%f3,	%f29
	movleu	%icc,	%i1,	%i4
	udivcc	%l3,	0x0F1D,	%l2
	restore %o5, 0x0812, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%o3,	%g4
	fmovrde	%i5,	%f22,	%f10
	orncc	%g2,	%l4,	%g3
	udivx	%o7,	0x1CD2,	%l6
	std	%f20,	[%l7 + 0x60]
	mulx	%g1,	%i2,	%o2
	and	%o6,	%l0,	%l1
	and	%g7,	%i6,	%o4
	edge16	%g5,	%l5,	%i3
	addc	%o0,	%i0,	%g6
	fone	%f0
	fornot2	%f0,	%f22,	%f18
	sll	%i1,	%i4,	%l3
	orncc	%i7,	%o5,	%o1
	fands	%f1,	%f5,	%f20
	sethi	0x1ED3,	%l2
	movrgz	%g4,	0x3A1,	%o3
	movcc	%icc,	%g2,	%i5
	movre	%l4,	%o7,	%g3
	smul	%l6,	0x0489,	%g1
	movrne	%i2,	%o6,	%o2
	fpackfix	%f2,	%f9
	movl	%icc,	%l0,	%l1
	sir	0x0704
	addccc	%g7,	0x099D,	%i6
	fmovsvc	%icc,	%f19,	%f29
	fpadd32s	%f15,	%f4,	%f23
	ld	[%l7 + 0x48],	%f27
	xor	%o4,	%g5,	%i3
	sdiv	%o0,	0x1464,	%l5
	fsrc1s	%f13,	%f19
	movcs	%icc,	%i0,	%g6
	save %i4, 0x0971, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%i7,	%l3,	%o1
	fnor	%f30,	%f28,	%f18
	fand	%f30,	%f0,	%f12
	andcc	%o5,	%l2,	%o3
	fpmerge	%f26,	%f5,	%f2
	movvs	%icc,	%g4,	%g2
	udiv	%i5,	0x02B2,	%l4
	umulcc	%g3,	%o7,	%g1
	addccc	%i2,	%o6,	%l6
	edge32l	%o2,	%l0,	%l1
	srax	%i6,	%g7,	%o4
	st	%f4,	[%l7 + 0x7C]
	smul	%i3,	%o0,	%l5
	sllx	%g5,	%g6,	%i0
	sub	%i1,	0x0D55,	%i7
	mulx	%l3,	0x1ADF,	%i4
	fzeros	%f30
	fornot1s	%f1,	%f21,	%f10
	fandnot1	%f26,	%f30,	%f14
	fandnot2s	%f2,	%f28,	%f8
	andncc	%o5,	%o1,	%o3
	ldx	[%l7 + 0x50],	%l2
	subcc	%g2,	0x02FD,	%g4
	fmovrde	%i5,	%f12,	%f12
	siam	0x5
	setx loop_63, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_63: 	or	%g1,	%l4,	%o6
	movcs	%xcc,	%l6,	%o2
	movg	%xcc,	%l0,	%l1
	fpadd16	%f30,	%f30,	%f10
	andcc	%i6,	%i2,	%g7
	edge32	%i3,	%o0,	%l5
	move	%xcc,	%g5,	%g6
	movgu	%xcc,	%o4,	%i1
	movrne	%i7,	0x21C,	%i0
	ldub	[%l7 + 0x7C],	%l3
	ld	[%l7 + 0x28],	%f22
	srlx	%i4,	%o1,	%o5
	lduw	[%l7 + 0x2C],	%o3
	movrgez	%g2,	%l2,	%g4
	fmovde	%icc,	%f25,	%f7
	xnor	%g3,	%o7,	%i5
	add	%g1,	0x03BA,	%o6
	xnorcc	%l4,	%l6,	%l0
	orcc	%o2,	0x061B,	%i6
	udivcc	%l1,	0x1551,	%i2
	udivcc	%i3,	0x0749,	%o0
	udivcc	%l5,	0x093E,	%g5
	ldsw	[%l7 + 0x10],	%g7
	smulcc	%o4,	%g6,	%i1
	movpos	%xcc,	%i0,	%i7
	xnorcc	%i4,	0x10FA,	%o1
	mova	%xcc,	%o5,	%l3
	smul	%o3,	0x0511,	%l2
	udivx	%g4,	0x1116,	%g3
	movvs	%icc,	%o7,	%g2
	orcc	%g1,	%o6,	%l4
	and	%i5,	0x0470,	%l0
	edge16l	%o2,	%i6,	%l6
	fexpand	%f7,	%f20
	movg	%xcc,	%i2,	%i3
	movre	%o0,	0x01B,	%l5
	stb	%l1,	[%l7 + 0x3B]
	andncc	%g5,	%g7,	%g6
	fmovrdgz	%o4,	%f0,	%f8
	movrlez	%i0,	0x3BB,	%i7
	edge8l	%i1,	%o1,	%o5
	sdiv	%l3,	0x012B,	%o3
	array16	%l2,	%g4,	%g3
	sir	0x1D38
	sdivx	%i4,	0x08E9,	%o7
	fandnot1	%f22,	%f14,	%f10
	fcmpeq32	%f30,	%f24,	%g2
	lduh	[%l7 + 0x52],	%g1
	edge32n	%o6,	%i5,	%l4
	fzeros	%f5
	udivcc	%l0,	0x109E,	%o2
	fabsd	%f30,	%f30
	or	%l6,	%i2,	%i6
	fmovs	%f26,	%f21
	smul	%i3,	0x0AB0,	%l5
	ldx	[%l7 + 0x60],	%o0
	movrlz	%g5,	%g7,	%g6
	fnors	%f11,	%f15,	%f8
	edge16ln	%o4,	%l1,	%i0
	fmovrdgez	%i7,	%f8,	%f28
	edge16n	%o1,	%i1,	%o5
	smulcc	%o3,	%l3,	%l2
	xnorcc	%g3,	%i4,	%o7
	array8	%g2,	%g1,	%o6
	fcmpeq16	%f18,	%f4,	%g4
	andncc	%i5,	%l0,	%o2
	sllx	%l4,	0x04,	%l6
	ldd	[%l7 + 0x08],	%i6
	edge32n	%i3,	%l5,	%o0
	and	%g5,	%i2,	%g7
	movg	%xcc,	%g6,	%l1
	sir	0x0924
	fnors	%f6,	%f28,	%f3
	edge16	%o4,	%i7,	%i0
	fmovrslz	%i1,	%f14,	%f17
	lduh	[%l7 + 0x4E],	%o5
	ldx	[%l7 + 0x60],	%o1
	fmovrslez	%o3,	%f11,	%f8
	ldd	[%l7 + 0x28],	%f12
	orcc	%l2,	%g3,	%l3
	fones	%f26
	xorcc	%i4,	%o7,	%g1
	fpsub16s	%f3,	%f18,	%f23
	edge8l	%g2,	%g4,	%o6
	udivx	%i5,	0x1F3E,	%o2
	movleu	%icc,	%l0,	%l6
	fabss	%f20,	%f6
	edge32n	%l4,	%i3,	%l5
	stw	%o0,	[%l7 + 0x4C]
	st	%f13,	[%l7 + 0x24]
	srlx	%g5,	0x0F,	%i2
	fandnot1	%f20,	%f26,	%f10
	fmovsgu	%xcc,	%f29,	%f4
	movn	%icc,	%i6,	%g6
	udivcc	%l1,	0x19E9,	%g7
	movle	%xcc,	%i7,	%i0
	popc	%o4,	%i1
	fnot1s	%f1,	%f4
	fcmpgt32	%f6,	%f26,	%o1
	movrgz	%o5,	0x26A,	%o3
	smul	%l2,	%g3,	%i4
	fxors	%f12,	%f2,	%f7
	edge8n	%o7,	%l3,	%g1
	sdivcc	%g4,	0x183E,	%o6
	movrne	%g2,	%i5,	%o2
	fmovdgu	%xcc,	%f0,	%f11
	sra	%l0,	%l6,	%i3
	edge16l	%l5,	%l4,	%o0
	sra	%i2,	%g5,	%i6
	alignaddrl	%g6,	%l1,	%g7
	srl	%i0,	0x02,	%o4
	fnot2	%f22,	%f22
	edge8ln	%i1,	%o1,	%i7
	addcc	%o5,	0x016D,	%l2
	andcc	%g3,	%o3,	%i4
	lduw	[%l7 + 0x20],	%o7
	ldd	[%l7 + 0x10],	%g0
	movne	%icc,	%g4,	%o6
	fmovscc	%xcc,	%f24,	%f31
	fandnot1	%f20,	%f30,	%f20
	edge32ln	%g2,	%l3,	%i5
	fornot2s	%f2,	%f18,	%f0
	alignaddrl	%o2,	%l0,	%i3
	orcc	%l6,	0x0B4F,	%l4
	srax	%o0,	%i2,	%l5
	edge8	%i6,	%g6,	%l1
	edge16n	%g7,	%i0,	%o4
	ldsw	[%l7 + 0x68],	%i1
	addccc	%o1,	0x050E,	%i7
	edge32	%g5,	%o5,	%l2
	subc	%g3,	%o3,	%o7
	fmovsvc	%icc,	%f13,	%f4
	sth	%i4,	[%l7 + 0x5A]
	udivcc	%g1,	0x0D85,	%g4
	udiv	%g2,	0x1EDB,	%l3
	orn	%o6,	%o2,	%i5
	fmovdl	%icc,	%f18,	%f22
	edge32	%l0,	%i3,	%l6
	fnot2s	%f6,	%f10
	orcc	%l4,	%o0,	%i2
	ldd	[%l7 + 0x58],	%l4
	movg	%icc,	%i6,	%g6
	alignaddrl	%l1,	%i0,	%g7
	fcmped	%fcc1,	%f12,	%f4
	and	%i1,	%o1,	%o4
	movleu	%xcc,	%i7,	%o5
	umul	%l2,	0x0322,	%g3
	nop
	set	0x18, %g2
	stx	%g5,	[%l7 + %g2]
	udivx	%o3,	0x091B,	%i4
	array8	%o7,	%g1,	%g2
	movge	%xcc,	%g4,	%l3
	fxor	%f8,	%f24,	%f14
	xorcc	%o6,	0x1839,	%o2
	mulx	%i5,	%l0,	%i3
	fandnot1s	%f21,	%f4,	%f16
	edge8n	%l4,	%o0,	%l6
	ldsh	[%l7 + 0x52],	%i2
	movgu	%xcc,	%i6,	%g6
	array8	%l5,	%i0,	%g7
	addc	%l1,	0x1076,	%o1
	movgu	%icc,	%i1,	%i7
	movrgz	%o4,	%o5,	%g3
	stx	%l2,	[%l7 + 0x18]
	ldd	[%l7 + 0x58],	%g4
	array16	%i4,	%o7,	%o3
	mulscc	%g1,	0x15B3,	%g4
	movrne	%g2,	0x361,	%o6
	array8	%l3,	%i5,	%o2
	fcmped	%fcc3,	%f8,	%f20
	fnot1	%f30,	%f14
	movcc	%icc,	%i3,	%l4
	fmul8x16	%f13,	%f20,	%f6
	mulx	%l0,	%o0,	%l6
	edge32	%i2,	%g6,	%i6
	edge32	%l5,	%i0,	%l1
	udiv	%g7,	0x0012,	%i1
	move	%icc,	%i7,	%o1
	fmovsle	%xcc,	%f17,	%f22
	fcmpne16	%f4,	%f26,	%o5
	ldsb	[%l7 + 0x13],	%o4
	andncc	%g3,	%g5,	%l2
	fmovrdlez	%o7,	%f4,	%f10
	fandnot2	%f6,	%f12,	%f4
	movrgez	%i4,	0x339,	%g1
	popc	%g4,	%g2
	srax	%o6,	%l3,	%i5
	movne	%icc,	%o3,	%o2
	movvc	%xcc,	%i3,	%l0
	movgu	%icc,	%o0,	%l6
	srl	%l4,	%g6,	%i6
	edge8l	%l5,	%i2,	%l1
	edge16l	%i0,	%g7,	%i1
	stb	%o1,	[%l7 + 0x3D]
	udivcc	%i7,	0x0FE3,	%o5
	sdiv	%g3,	0x1481,	%g5
	add	%l2,	0x0FBB,	%o4
	fpadd32s	%f8,	%f18,	%f1
	srlx	%o7,	%g1,	%g4
	movn	%xcc,	%g2,	%i4
	fmovse	%icc,	%f27,	%f3
	ldsb	[%l7 + 0x18],	%l3
	fmovrdgz	%o6,	%f0,	%f30
	fmovdle	%xcc,	%f15,	%f9
	sdivcc	%i5,	0x0148,	%o2
	movcc	%xcc,	%i3,	%o3
	orncc	%o0,	0x1BC5,	%l0
	ldd	[%l7 + 0x28],	%l4
	movrgz	%g6,	0x269,	%l6
	sir	0x1007
	ldsh	[%l7 + 0x62],	%i6
	sth	%l5,	[%l7 + 0x7C]
	edge16ln	%l1,	%i0,	%i2
	movpos	%icc,	%i1,	%g7
	udivcc	%i7,	0x19C7,	%o1
	alignaddr	%g3,	%g5,	%o5
	fmovsgu	%icc,	%f28,	%f9
	fmovrse	%o4,	%f9,	%f31
	sub	%l2,	%g1,	%o7
	fmovsge	%icc,	%f26,	%f19
	st	%f7,	[%l7 + 0x54]
	edge8	%g4,	%g2,	%i4
	stx	%o6,	[%l7 + 0x38]
	edge16ln	%l3,	%i5,	%i3
	st	%f8,	[%l7 + 0x08]
	ldsb	[%l7 + 0x61],	%o3
	fxnor	%f12,	%f8,	%f16
	fsrc2s	%f1,	%f19
	edge32n	%o2,	%o0,	%l4
	stw	%g6,	[%l7 + 0x64]
	movle	%xcc,	%l6,	%l0
	stx	%i6,	[%l7 + 0x30]
	alignaddrl	%l5,	%l1,	%i2
	fmovrdlez	%i0,	%f20,	%f26
	ldsh	[%l7 + 0x50],	%g7
	srax	%i7,	%i1,	%g3
	and	%g5,	%o1,	%o5
	movle	%xcc,	%o4,	%l2
	ldsw	[%l7 + 0x4C],	%g1
	addccc	%g4,	0x1907,	%o7
	fmovrsgez	%i4,	%f18,	%f11
	fpack16	%f6,	%f12
	orn	%g2,	0x0A0A,	%o6
	ldsw	[%l7 + 0x68],	%l3
	stb	%i5,	[%l7 + 0x0E]
	array16	%o3,	%i3,	%o2
	std	%f4,	[%l7 + 0x28]
	move	%icc,	%l4,	%g6
	sir	0x112C
	subcc	%o0,	%l0,	%l6
	sllx	%l5,	0x09,	%i6
	srl	%l1,	%i2,	%i0
	fmovdle	%icc,	%f20,	%f10
	array8	%i7,	%i1,	%g7
	fmovdge	%icc,	%f20,	%f29
	ld	[%l7 + 0x2C],	%f20
	movcs	%xcc,	%g5,	%g3
	movge	%xcc,	%o5,	%o4
	std	%f30,	[%l7 + 0x28]
	std	%f2,	[%l7 + 0x38]
	and	%o1,	%l2,	%g1
	mulscc	%o7,	%i4,	%g4
	edge8	%g2,	%l3,	%o6
	ldsb	[%l7 + 0x63],	%i5
	faligndata	%f18,	%f6,	%f30
	fmul8sux16	%f8,	%f14,	%f30
	std	%f4,	[%l7 + 0x20]
	edge32n	%i3,	%o2,	%l4
	movneg	%xcc,	%g6,	%o3
	alignaddr	%l0,	%o0,	%l5
	ldsb	[%l7 + 0x5A],	%l6
	mulx	%l1,	0x13D0,	%i2
	orn	%i6,	%i0,	%i1
	stw	%g7,	[%l7 + 0x1C]
	movneg	%xcc,	%i7,	%g5
	lduw	[%l7 + 0x54],	%g3
	udivcc	%o5,	0x173C,	%o4
	stb	%o1,	[%l7 + 0x64]
	edge8l	%g1,	%l2,	%o7
	ldd	[%l7 + 0x30],	%i4
	edge8	%g2,	%l3,	%o6
	fpsub16	%f28,	%f20,	%f30
	fmovde	%xcc,	%f9,	%f29
	mulscc	%g4,	%i3,	%i5
	restore %o2, %g6, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l4,	0x0AFD,	%l0
	lduh	[%l7 + 0x3C],	%o0
	setx loop_64, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_64: 	fmul8x16au	%f13,	%f24,	%f30
	save %i2, 0x1D71, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i6,	%i0,	%g7
	stx	%i1,	[%l7 + 0x10]
	movleu	%icc,	%g5,	%i7
	orncc	%o5,	0x0C76,	%o4
	alignaddr	%o1,	%g1,	%l2
	fmovse	%icc,	%f27,	%f21
	fcmpgt16	%f10,	%f14,	%o7
	edge16n	%g3,	%i4,	%g2
	fpsub16	%f0,	%f6,	%f26
	udivx	%l3,	0x1C35,	%g4
	restore %i3, 0x1492, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sra	%o2,	0x0D,	%g6
	andcc	%i5,	%l4,	%l0
	fpadd32	%f8,	%f2,	%f20
	movneg	%xcc,	%o3,	%l6
	edge32l	%l1,	%i2,	%o0
	ldsh	[%l7 + 0x0E],	%i6
	fcmpgt32	%f10,	%f16,	%l5
	fmovdneg	%icc,	%f29,	%f5
	movne	%icc,	%i0,	%g7
	movcc	%xcc,	%i1,	%g5
	edge8n	%i7,	%o5,	%o4
	sth	%o1,	[%l7 + 0x7C]
	movvc	%icc,	%l2,	%o7
	ldub	[%l7 + 0x32],	%g3
	movpos	%xcc,	%g1,	%i4
	sethi	0x03A9,	%g2
	mulx	%g4,	0x0A0F,	%l3
	lduw	[%l7 + 0x48],	%o6
	movcs	%xcc,	%o2,	%i3
	sub	%i5,	0x03CB,	%l4
	orncc	%l0,	%o3,	%g6
	movge	%xcc,	%l6,	%i2
	fmovdvc	%icc,	%f7,	%f31
	fmovsg	%icc,	%f28,	%f27
	udiv	%l1,	0x1C9F,	%o0
	fors	%f15,	%f15,	%f26
	smul	%l5,	%i0,	%i6
	array32	%i1,	%g7,	%i7
	edge16n	%g5,	%o4,	%o1
	fmovsa	%icc,	%f24,	%f20
	smulcc	%l2,	0x0595,	%o5
	array16	%o7,	%g3,	%i4
	stb	%g1,	[%l7 + 0x6C]
	edge8n	%g2,	%l3,	%g4
	ld	[%l7 + 0x5C],	%f14
	stw	%o2,	[%l7 + 0x68]
	andcc	%o6,	%i3,	%l4
	edge8ln	%l0,	%o3,	%i5
	movrgez	%l6,	0x23F,	%i2
	fmuld8ulx16	%f17,	%f13,	%f22
	add	%l1,	%o0,	%g6
	addc	%l5,	%i0,	%i1
	orcc	%g7,	%i7,	%g5
	subc	%i6,	%o4,	%o1
	fcmpeq16	%f18,	%f10,	%l2
	setx loop_65, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_65: 	fcmpgt16	%f8,	%f0,	%g1
	fcmple16	%f18,	%f22,	%g3
	orn	%l3,	0x0AC8,	%g4
	fmovdvs	%xcc,	%f13,	%f19
	sth	%o2,	[%l7 + 0x64]
	addc	%o6,	%i3,	%l4
	andn	%l0,	%o3,	%g2
	edge16ln	%i5,	%i2,	%l1
	subccc	%o0,	0x07C7,	%l6
	stx	%g6,	[%l7 + 0x60]
	movle	%xcc,	%i0,	%i1
	orn	%l5,	%i7,	%g7
	smul	%i6,	%o4,	%o1
	movrgz	%g5,	0x064,	%o7
	move	%icc,	%l2,	%i4
	popc	0x1388,	%o5
	movrlz	%g1,	0x34A,	%l3
	sth	%g4,	[%l7 + 0x1E]
	nop
	set	0x40, %o2
	ldd	[%l7 + %o2],	%f20
	fnors	%f9,	%f31,	%f23
	edge32ln	%o2,	%g3,	%o6
	edge32ln	%l4,	%i3,	%o3
	edge16n	%l0,	%i5,	%g2
	andcc	%l1,	%i2,	%l6
	xnor	%g6,	%i0,	%o0
	andcc	%i1,	0x18A0,	%l5
	umulcc	%i7,	0x0ACB,	%g7
	movg	%xcc,	%o4,	%i6
	orn	%o1,	%o7,	%g5
	ldx	[%l7 + 0x40],	%i4
	movleu	%icc,	%o5,	%g1
	movleu	%xcc,	%l2,	%g4
	orncc	%l3,	0x0D61,	%o2
	orncc	%g3,	%o6,	%l4
	fsrc1s	%f9,	%f0
	ldd	[%l7 + 0x60],	%i2
	array8	%l0,	%o3,	%i5
	array8	%l1,	%g2,	%l6
	movcs	%xcc,	%i2,	%g6
	sth	%i0,	[%l7 + 0x44]
	fmovsge	%xcc,	%f31,	%f9
	umulcc	%i1,	0x0B53,	%o0
	edge32l	%i7,	%l5,	%g7
	udiv	%o4,	0x17F2,	%o1
	ldsb	[%l7 + 0x4A],	%i6
	movre	%o7,	%i4,	%g5
	xnorcc	%g1,	%o5,	%g4
	movg	%xcc,	%l2,	%o2
	movneg	%xcc,	%l3,	%g3
	sub	%l4,	%o6,	%l0
	edge8ln	%o3,	%i5,	%i3
	stx	%l1,	[%l7 + 0x20]
	mova	%icc,	%g2,	%l6
	umul	%i2,	0x04F8,	%i0
	fmovsne	%icc,	%f11,	%f6
	ldub	[%l7 + 0x70],	%g6
	movneg	%xcc,	%i1,	%o0
	movre	%i7,	%g7,	%l5
	fmovdn	%icc,	%f25,	%f5
	std	%f24,	[%l7 + 0x18]
	fmovrsne	%o4,	%f3,	%f29
	xor	%o1,	0x1436,	%o7
	movrlez	%i4,	%g5,	%i6
	udiv	%o5,	0x1BE1,	%g1
	popc	%g4,	%o2
	fcmpgt32	%f16,	%f22,	%l3
	srax	%g3,	0x11,	%l2
	xnorcc	%l4,	0x095D,	%o6
	movrlez	%o3,	%i5,	%l0
	save %l1, 0x0CF6, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%l6,	[%l7 + 0x18]
	lduh	[%l7 + 0x28],	%i2
	fcmpeq32	%f30,	%f2,	%i3
	sdivx	%i0,	0x1EB2,	%g6
	stx	%o0,	[%l7 + 0x20]
	ldsw	[%l7 + 0x74],	%i7
	ldsb	[%l7 + 0x77],	%g7
	subc	%l5,	%i1,	%o4
	add	%o7,	%o1,	%g5
	fabsd	%f0,	%f24
	movcc	%xcc,	%i4,	%o5
	smulcc	%g1,	%i6,	%g4
	movne	%icc,	%l3,	%o2
	udiv	%l2,	0x049F,	%g3
	fmovsn	%icc,	%f25,	%f17
	fmovscs	%xcc,	%f1,	%f20
	movvs	%xcc,	%l4,	%o3
	xorcc	%o6,	%l0,	%l1
	fmovsneg	%xcc,	%f26,	%f5
	smul	%i5,	%l6,	%i2
	sdivx	%i3,	0x1510,	%g2
	st	%f10,	[%l7 + 0x70]
	smul	%g6,	0x1520,	%i0
	stb	%o0,	[%l7 + 0x6F]
	save %i7, %g7, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%o4,	0x14CC,	%o7
	fmovsneg	%icc,	%f1,	%f21
	fpadd32s	%f25,	%f8,	%f14
	fnegs	%f19,	%f11
	fmul8x16al	%f18,	%f9,	%f16
	movrne	%i1,	%g5,	%o1
	st	%f7,	[%l7 + 0x70]
	fmovdvc	%xcc,	%f30,	%f5
	add	%o5,	0x00A5,	%i4
	fmovd	%f16,	%f2
	fmovrde	%i6,	%f6,	%f2
	orncc	%g1,	%g4,	%o2
	ldx	[%l7 + 0x30],	%l2
	add	%l3,	%l4,	%g3
	udivcc	%o3,	0x0A18,	%l0
	fpack32	%f24,	%f6,	%f8
	nop
	set	0x24, %o1
	ldsb	[%l7 + %o1],	%l1
	edge8l	%o6,	%i5,	%i2
	sra	%i3,	0x17,	%g2
	fpackfix	%f22,	%f14
	edge16	%l6,	%g6,	%o0
	fmovrdlez	%i7,	%f24,	%f2
	movrne	%i0,	%l5,	%o4
	fmovdcs	%xcc,	%f25,	%f14
	popc	%o7,	%g7
	array8	%i1,	%g5,	%o1
	orn	%i4,	%i6,	%o5
	array8	%g1,	%g4,	%o2
	edge8l	%l2,	%l4,	%g3
	fmovdle	%xcc,	%f2,	%f26
	movl	%icc,	%o3,	%l3
	fands	%f17,	%f11,	%f11
	fnors	%f14,	%f4,	%f14
	save %l1, 0x1B69, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orn	%l0,	0x19C7,	%i5
	udivx	%i3,	0x1270,	%g2
	edge8l	%l6,	%g6,	%i2
	sir	0x17BD
	fmovdne	%icc,	%f20,	%f28
	ld	[%l7 + 0x14],	%f13
	stw	%i7,	[%l7 + 0x24]
	movg	%icc,	%o0,	%i0
	edge32l	%o4,	%o7,	%l5
	fcmpgt16	%f6,	%f8,	%i1
	fcmpgt16	%f10,	%f26,	%g7
	xnorcc	%o1,	0x09D2,	%g5
	edge16ln	%i6,	%o5,	%g1
	edge32ln	%i4,	%g4,	%o2
	sllx	%l2,	%g3,	%l4
	fpackfix	%f8,	%f29
	addcc	%l3,	%l1,	%o6
	ld	[%l7 + 0x08],	%f22
	movrlz	%o3,	0x13E,	%i5
	lduh	[%l7 + 0x48],	%i3
	lduw	[%l7 + 0x14],	%g2
	udivx	%l0,	0x0905,	%g6
	or	%i2,	%i7,	%o0
	fxor	%f18,	%f14,	%f2
	edge16	%i0,	%l6,	%o7
	restore %o4, 0x103F, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srl	%g7,	%o1,	%l5
	andcc	%g5,	%o5,	%g1
	fmovs	%f20,	%f22
	fmovda	%icc,	%f23,	%f5
	movrlez	%i4,	0x1D6,	%i6
	fmovdl	%icc,	%f9,	%f30
	sethi	0x184A,	%g4
	srax	%l2,	%g3,	%l4
	fpadd32s	%f26,	%f5,	%f19
	subccc	%o2,	0x148D,	%l3
	movrlez	%l1,	%o3,	%o6
	movre	%i3,	0x2B4,	%g2
	umul	%l0,	%i5,	%i2
	fmovsleu	%xcc,	%f17,	%f5
	and	%i7,	0x0204,	%o0
	fmovdne	%xcc,	%f3,	%f14
	fpsub16s	%f9,	%f15,	%f4
	andcc	%i0,	0x11B2,	%l6
	fmovs	%f29,	%f11
	ldd	[%l7 + 0x70],	%o6
	fandnot1s	%f21,	%f23,	%f25
	edge8n	%o4,	%g6,	%g7
	srax	%o1,	0x10,	%l5
	fandnot2	%f8,	%f26,	%f14
	array32	%i1,	%g5,	%g1
	fmul8x16	%f28,	%f28,	%f12
	edge8	%i4,	%i6,	%g4
	edge32n	%o5,	%g3,	%l4
	add	%l2,	%l3,	%l1
	array32	%o3,	%o2,	%o6
	movrgz	%i3,	0x11C,	%l0
	srlx	%g2,	0x02,	%i2
	fzero	%f0
	edge32n	%i7,	%i5,	%i0
	andn	%l6,	0x0AE7,	%o7
	for	%f12,	%f4,	%f24
	fmovdg	%icc,	%f13,	%f24
	ldsb	[%l7 + 0x32],	%o0
	alignaddr	%g6,	%g7,	%o1
	stx	%o4,	[%l7 + 0x58]
	movrgez	%l5,	0x34E,	%g5
	fmovsneg	%xcc,	%f31,	%f6
	xnorcc	%g1,	%i1,	%i4
	fmovsg	%icc,	%f29,	%f3
	movg	%xcc,	%g4,	%i6
	nop
	set	0x48, %i1
	ldd	[%l7 + %i1],	%f26
	movvc	%xcc,	%o5,	%l4
	movre	%l2,	%g3,	%l1
	fpadd16s	%f31,	%f27,	%f3
	movrne	%l3,	%o2,	%o6
	alignaddr	%o3,	%l0,	%i3
	fmovsvs	%xcc,	%f26,	%f2
	andncc	%g2,	%i2,	%i5
	edge16n	%i7,	%l6,	%i0
	addcc	%o0,	%g6,	%o7
	edge8n	%g7,	%o1,	%o4
	fcmpeq16	%f30,	%f10,	%l5
	subcc	%g5,	%g1,	%i4
	sub	%g4,	%i6,	%o5
	edge16ln	%l4,	%i1,	%l2
	stw	%l1,	[%l7 + 0x20]
	fmovdle	%xcc,	%f4,	%f18
	fcmple16	%f0,	%f24,	%g3
	ldx	[%l7 + 0x08],	%o2
	edge32n	%o6,	%o3,	%l3
	subcc	%i3,	%l0,	%i2
	movcc	%xcc,	%g2,	%i7
	edge8	%i5,	%i0,	%l6
	movvs	%xcc,	%o0,	%g6
	edge32l	%o7,	%o1,	%o4
	ldx	[%l7 + 0x28],	%g7
	fcmple16	%f20,	%f28,	%l5
	movrlz	%g1,	%i4,	%g5
	ld	[%l7 + 0x2C],	%f24
	sll	%i6,	0x13,	%o5
	fmovrslez	%l4,	%f10,	%f12
	edge8n	%i1,	%l2,	%g4
	fnands	%f7,	%f29,	%f22
	movrne	%l1,	%g3,	%o6
	edge32ln	%o3,	%l3,	%i3
	fmovdl	%xcc,	%f13,	%f10
	movrgez	%l0,	%o2,	%i2
	fcmpne16	%f22,	%f14,	%i7
	movvs	%icc,	%i5,	%g2
	ldd	[%l7 + 0x78],	%f28
	std	%f24,	[%l7 + 0x20]
	nop
	set	0x2A, %o3
	sth	%l6,	[%l7 + %o3]
	faligndata	%f30,	%f12,	%f18
	stb	%o0,	[%l7 + 0x10]
	movn	%xcc,	%i0,	%o7
	movle	%icc,	%o1,	%o4
	ldub	[%l7 + 0x3E],	%g6
	edge8n	%l5,	%g7,	%g1
	sllx	%g5,	0x11,	%i6
	fpsub16	%f14,	%f0,	%f6
	sll	%o5,	0x08,	%l4
	sir	0x0198
	xnorcc	%i4,	0x15F3,	%i1
	ldx	[%l7 + 0x50],	%g4
	movn	%xcc,	%l1,	%l2
	ldsb	[%l7 + 0x3F],	%o6
	fmovsgu	%xcc,	%f15,	%f1
	addccc	%g3,	%o3,	%l3
	movre	%l0,	%o2,	%i3
	edge8n	%i7,	%i5,	%i2
	xor	%l6,	%g2,	%o0
	fmuld8ulx16	%f0,	%f13,	%f26
	movcc	%icc,	%i0,	%o7
	movrgez	%o4,	0x120,	%o1
	subccc	%g6,	%l5,	%g7
	array8	%g5,	%g1,	%o5
	udiv	%l4,	0x1572,	%i4
	fornot2s	%f9,	%f0,	%f0
	ldsb	[%l7 + 0x3C],	%i1
	ldsb	[%l7 + 0x7A],	%i6
	edge16	%g4,	%l1,	%o6
	movvs	%icc,	%g3,	%o3
	sdivcc	%l3,	0x18D7,	%l2
	ldsb	[%l7 + 0x71],	%l0
	save %i3, %i7, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i2,	%l6,	%g2
	andn	%i5,	%o0,	%i0
	array32	%o7,	%o1,	%o4
	sth	%g6,	[%l7 + 0x5E]
	orn	%g7,	%l5,	%g5
	edge32	%g1,	%l4,	%o5
	subc	%i4,	%i1,	%g4
	edge32	%l1,	%i6,	%g3
	stb	%o6,	[%l7 + 0x22]
	sra	%o3,	0x1D,	%l3
	stx	%l2,	[%l7 + 0x18]
	movg	%xcc,	%i3,	%l0
	subc	%o2,	%i2,	%i7
	addccc	%l6,	0x06D6,	%i5
	movneg	%xcc,	%g2,	%o0
	alignaddrl	%i0,	%o7,	%o1
	fones	%f14
	faligndata	%f6,	%f8,	%f28
	nop
	set	0x70, %g5
	ldd	[%l7 + %g5],	%f16
	addcc	%o4,	%g7,	%g6
	movne	%icc,	%g5,	%g1
	fcmple16	%f12,	%f8,	%l4
	movn	%icc,	%l5,	%o5
	movcc	%icc,	%i1,	%g4
	sub	%i4,	0x1674,	%i6
	stx	%l1,	[%l7 + 0x78]
	srlx	%o6,	0x02,	%o3
	movcc	%icc,	%g3,	%l3
	sdiv	%l2,	0x062D,	%i3
	fmul8x16au	%f23,	%f2,	%f12
	fcmpgt16	%f14,	%f20,	%l0
	orn	%o2,	0x0955,	%i2
	movrgz	%l6,	%i5,	%i7
	mulscc	%o0,	%i0,	%g2
	srax	%o1,	0x0B,	%o7
	mulscc	%g7,	%o4,	%g5
	fcmple32	%f24,	%f14,	%g1
	st	%f22,	[%l7 + 0x54]
	sra	%g6,	0x11,	%l5
	fmul8sux16	%f6,	%f12,	%f28
	edge32l	%l4,	%o5,	%g4
	add	%i1,	%i4,	%i6
	fornot1	%f30,	%f4,	%f0
	or	%l1,	0x0B71,	%o6
	movneg	%icc,	%g3,	%l3
	sub	%l2,	%i3,	%o3
	movvs	%icc,	%l0,	%i2
	movrgez	%l6,	%i5,	%o2
	array16	%o0,	%i7,	%i0
	movrlez	%o1,	0x1E4,	%o7
	sll	%g2,	0x0F,	%g7
	fcmps	%fcc2,	%f25,	%f0
	movgu	%icc,	%g5,	%o4
	edge8n	%g6,	%l5,	%g1
	movl	%icc,	%l4,	%o5
	ldd	[%l7 + 0x08],	%i0
	xnorcc	%i4,	%g4,	%i6
	movge	%xcc,	%o6,	%g3
	fmovsl	%xcc,	%f0,	%f27
	fnot2s	%f29,	%f19
	movleu	%xcc,	%l1,	%l3
	movrgz	%l2,	%i3,	%o3
	xorcc	%l0,	0x001A,	%l6
	andcc	%i2,	0x113A,	%i5
	ld	[%l7 + 0x7C],	%f24
	movcs	%xcc,	%o2,	%o0
	edge16l	%i0,	%o1,	%o7
	ldsb	[%l7 + 0x4E],	%i7
	movgu	%xcc,	%g7,	%g2
	movrlz	%o4,	%g5,	%l5
	udiv	%g6,	0x03ED,	%g1
	edge16	%l4,	%o5,	%i1
	fmovd	%f12,	%f8
	umul	%g4,	%i6,	%i4
	edge16ln	%g3,	%l1,	%l3
	subc	%l2,	%i3,	%o3
	stw	%l0,	[%l7 + 0x20]
	ldsh	[%l7 + 0x6A],	%o6
	stx	%l6,	[%l7 + 0x50]
	edge32n	%i2,	%o2,	%o0
	alignaddr	%i0,	%o1,	%i5
	alignaddr	%i7,	%o7,	%g7
	fmovsl	%icc,	%f0,	%f21
	ldx	[%l7 + 0x10],	%g2
	movneg	%xcc,	%g5,	%l5
	fcmpne16	%f10,	%f0,	%g6
	ldsb	[%l7 + 0x34],	%g1
	xorcc	%l4,	%o5,	%i1
	fmovscc	%xcc,	%f19,	%f29
	orcc	%g4,	0x0BD2,	%o4
	alignaddr	%i6,	%g3,	%i4
	srax	%l1,	0x1B,	%l3
	stb	%i3,	[%l7 + 0x23]
	movrgz	%l2,	0x1EE,	%l0
	xnorcc	%o6,	0x0816,	%o3
	movl	%xcc,	%l6,	%o2
	sllx	%o0,	0x04,	%i0
	sth	%i2,	[%l7 + 0x22]
	fcmpne32	%f4,	%f30,	%o1
	mova	%icc,	%i7,	%o7
	edge8n	%g7,	%i5,	%g5
	movvc	%icc,	%g2,	%l5
	fornot1	%f24,	%f0,	%f26
	srlx	%g6,	0x01,	%l4
	fcmpd	%fcc0,	%f6,	%f20
	movrgz	%g1,	0x3E2,	%o5
	subccc	%g4,	0x030D,	%o4
	sllx	%i6,	0x1D,	%i1
	sdiv	%i4,	0x0C6B,	%l1
	movcs	%icc,	%l3,	%g3
	edge8ln	%l2,	%l0,	%i3
	ld	[%l7 + 0x6C],	%f8
	edge16ln	%o3,	%l6,	%o2
	and	%o6,	0x0AB5,	%o0
	lduw	[%l7 + 0x74],	%i0
	ldsb	[%l7 + 0x51],	%i2
	fmovrdne	%i7,	%f14,	%f12
	fxnors	%f27,	%f13,	%f18
	sll	%o7,	0x0E,	%g7
	fmovdvc	%icc,	%f16,	%f13
	movl	%xcc,	%o1,	%g5
	subccc	%i5,	%l5,	%g6
	movge	%icc,	%l4,	%g2
	lduw	[%l7 + 0x48],	%g1
	fands	%f5,	%f27,	%f31
	addc	%g4,	%o4,	%i6
	udivcc	%i1,	0x135D,	%i4
	fmovdneg	%xcc,	%f11,	%f2
	umul	%l1,	%o5,	%g3
	orcc	%l2,	0x1F67,	%l3
	movrlz	%i3,	%l0,	%l6
	movvs	%icc,	%o2,	%o6
	edge8l	%o3,	%o0,	%i0
	movge	%xcc,	%i7,	%o7
	sdiv	%g7,	0x07F9,	%o1
	addcc	%g5,	0x1B37,	%i5
	sth	%i2,	[%l7 + 0x6C]
	subcc	%g6,	%l5,	%l4
	fmovsgu	%icc,	%f27,	%f21
	fcmpeq16	%f18,	%f8,	%g2
	fpadd32	%f16,	%f2,	%f8
	srax	%g4,	%g1,	%o4
	fmovdcs	%xcc,	%f12,	%f22
	movn	%xcc,	%i1,	%i4
	ld	[%l7 + 0x7C],	%f11
	lduh	[%l7 + 0x68],	%l1
	addcc	%o5,	0x17B1,	%i6
	save %l2, %l3, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movcc	%xcc,	%i3,	%l6
	fmovsgu	%icc,	%f0,	%f8
	stb	%o2,	[%l7 + 0x78]
	fxors	%f29,	%f18,	%f16
	movneg	%icc,	%l0,	%o6
	edge32n	%o0,	%o3,	%i0
	and	%i7,	0x0EB3,	%g7
	fpackfix	%f22,	%f22
	movrne	%o7,	0x22A,	%o1
	lduw	[%l7 + 0x20],	%i5
	setx loop_66, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_66: 	fmovspos	%icc,	%f27,	%f5
	movpos	%xcc,	%g6,	%l5
	sir	0x1979
	edge32ln	%g2,	%g4,	%g1
	addcc	%l4,	%o4,	%i4
	fpadd16	%f4,	%f6,	%f16
	movle	%xcc,	%l1,	%o5
	fpsub16	%f22,	%f2,	%f26
	sub	%i6,	0x17FE,	%i1
	edge8l	%l3,	%l2,	%g3
	fsrc1s	%f30,	%f15
	lduh	[%l7 + 0x7C],	%l6
	std	%f0,	[%l7 + 0x10]
	subccc	%o2,	0x09B1,	%l0
	fxnor	%f28,	%f0,	%f24
	restore %o6, 0x1B16, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o0,	%o3,	%i0
	fmovdleu	%icc,	%f25,	%f12
	fsrc1s	%f28,	%f13
	movrgez	%i7,	%o7,	%g7
	fpsub16s	%f29,	%f20,	%f4
	edge32l	%o1,	%i5,	%g5
	sdivcc	%g6,	0x17E3,	%l5
	edge16ln	%i2,	%g4,	%g2
	edge8l	%g1,	%l4,	%o4
	orn	%l1,	%i4,	%o5
	srl	%i6,	%l3,	%l2
	move	%icc,	%i1,	%l6
	movl	%icc,	%g3,	%l0
	and	%o2,	%i3,	%o6
	alignaddr	%o3,	%o0,	%i7
	udivcc	%o7,	0x0AAC,	%g7
	orncc	%i0,	0x1334,	%i5
	movneg	%icc,	%o1,	%g5
	fmovdneg	%icc,	%f18,	%f21
	orcc	%g6,	%i2,	%l5
	addc	%g2,	0x0871,	%g1
	addccc	%l4,	0x0599,	%g4
	fnot1s	%f21,	%f30
	orcc	%o4,	%l1,	%i4
	sra	%o5,	0x0A,	%l3
	movcs	%xcc,	%l2,	%i1
	fnor	%f4,	%f0,	%f2
	edge32l	%l6,	%g3,	%l0
	fexpand	%f19,	%f18
	fmuld8sux16	%f17,	%f17,	%f22
	movle	%xcc,	%i6,	%o2
	add	%i3,	%o6,	%o3
	alignaddr	%i7,	%o0,	%g7
	fcmple16	%f18,	%f0,	%i0
	smulcc	%i5,	0x0F94,	%o7
	movge	%xcc,	%o1,	%g6
	smulcc	%g5,	0x1D16,	%l5
	ldsh	[%l7 + 0x2E],	%i2
	movpos	%icc,	%g2,	%l4
	fors	%f14,	%f2,	%f3
	fornot2	%f12,	%f20,	%f22
	mulscc	%g4,	%g1,	%o4
	edge8n	%i4,	%o5,	%l3
	addccc	%l1,	0x11B5,	%l2
	sethi	0x01BF,	%i1
	movgu	%icc,	%g3,	%l6
	fmovrdlez	%l0,	%f6,	%f20
	udivx	%i6,	0x1F54,	%o2
	srax	%o6,	%i3,	%o3
	edge16ln	%o0,	%g7,	%i7
	std	%f16,	[%l7 + 0x60]
	fmovscc	%xcc,	%f2,	%f10
	alignaddrl	%i0,	%i5,	%o7
	udivx	%o1,	0x116B,	%g6
	subccc	%g5,	%i2,	%l5
	sth	%l4,	[%l7 + 0x4C]
	fand	%f6,	%f22,	%f6
	st	%f9,	[%l7 + 0x38]
	stw	%g4,	[%l7 + 0x0C]
	fone	%f4
	fnand	%f10,	%f24,	%f16
	ldd	[%l7 + 0x40],	%f24
	movrlz	%g2,	%o4,	%i4
	srax	%o5,	0x0C,	%l3
	movg	%xcc,	%l1,	%g1
	mulx	%l2,	0x1C0A,	%g3
	sdivx	%l6,	0x0D87,	%l0
	smulcc	%i6,	0x0EAC,	%i1
	srl	%o2,	%o6,	%i3
	mulscc	%o0,	0x0ABE,	%g7
	addc	%o3,	0x122A,	%i0
	xor	%i7,	0x1EA1,	%o7
	fmovrdgez	%i5,	%f10,	%f24
	orncc	%g6,	%o1,	%g5
	alignaddr	%l5,	%i2,	%g4
	edge32l	%l4,	%g2,	%o4
	fands	%f18,	%f15,	%f22
	sethi	0x0CE1,	%i4
	xnorcc	%o5,	0x036E,	%l3
	st	%f1,	[%l7 + 0x18]
	orcc	%g1,	%l1,	%l2
	alignaddrl	%l6,	%l0,	%i6
	array32	%g3,	%i1,	%o2
	fnors	%f5,	%f0,	%f27
	ldsh	[%l7 + 0x10],	%i3
	fmovdvs	%icc,	%f28,	%f12
	fmovdg	%xcc,	%f6,	%f3
	fnegs	%f13,	%f25
	smulcc	%o6,	%g7,	%o3
	subc	%i0,	%o0,	%o7
	ldd	[%l7 + 0x18],	%i4
	sub	%i7,	0x096A,	%o1
	edge32ln	%g5,	%l5,	%g6
	umul	%i2,	0x0D50,	%l4
	fmovde	%icc,	%f13,	%f5
	edge8ln	%g4,	%o4,	%i4
	move	%icc,	%o5,	%l3
	edge8n	%g2,	%l1,	%l2
	fmovdle	%xcc,	%f6,	%f16
	fmovsgu	%xcc,	%f7,	%f26
	and	%l6,	0x0EB0,	%g1
	stw	%l0,	[%l7 + 0x60]
	ldd	[%l7 + 0x78],	%f16
	movvs	%icc,	%g3,	%i1
	mulscc	%i6,	0x0C01,	%i3
	sllx	%o6,	%g7,	%o2
	xnorcc	%i0,	0x1E8F,	%o0
	sub	%o3,	0x1224,	%o7
	lduh	[%l7 + 0x0E],	%i7
	addc	%o1,	0x15F6,	%i5
	or	%l5,	%g6,	%i2
	array32	%g5,	%l4,	%g4
	edge8n	%i4,	%o5,	%l3
	srlx	%o4,	%l1,	%l2
	ldd	[%l7 + 0x20],	%g2
	ldd	[%l7 + 0x18],	%f8
	movleu	%xcc,	%l6,	%g1
	movgu	%icc,	%l0,	%i1
	fors	%f15,	%f8,	%f27
	sll	%g3,	%i6,	%i3
	movrgez	%g7,	%o2,	%o6
	stx	%i0,	[%l7 + 0x50]
	sll	%o0,	0x02,	%o3
	fmovrslz	%o7,	%f19,	%f18
	udiv	%o1,	0x120A,	%i5
	popc	0x07BE,	%l5
	movgu	%xcc,	%i7,	%g6
	ldx	[%l7 + 0x28],	%i2
	and	%g5,	0x157A,	%l4
	save %i4, %o5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrgz	%l3,	%o4,	%l1
	nop
	set	0x20, %l0
	ldd	[%l7 + %l0],	%g2
	edge8l	%l6,	%g1,	%l2
	alignaddr	%i1,	%g3,	%l0
	fpsub16s	%f24,	%f4,	%f0
	udivcc	%i3,	0x0962,	%i6
	edge32ln	%o2,	%o6,	%g7
	fmovdleu	%xcc,	%f31,	%f11
	movrne	%o0,	%o3,	%i0
	fmuld8ulx16	%f11,	%f2,	%f24
	orn	%o7,	%i5,	%o1
	ld	[%l7 + 0x70],	%f27
	ldsw	[%l7 + 0x14],	%i7
	sth	%l5,	[%l7 + 0x7C]
	ldsb	[%l7 + 0x57],	%g6
	fornot2	%f8,	%f2,	%f26
	sir	0x0008
	orn	%g5,	0x1239,	%i2
	ld	[%l7 + 0x5C],	%f14
	edge8	%l4,	%o5,	%g4
	add	%i4,	0x0268,	%o4
	mulx	%l3,	%g2,	%l1
	edge8l	%g1,	%l6,	%i1
	umulcc	%g3,	%l2,	%l0
	fcmped	%fcc3,	%f2,	%f2
	fabsd	%f22,	%f20
	fnot1	%f24,	%f6
	alignaddr	%i6,	%o2,	%i3
	movcs	%icc,	%o6,	%g7
	fmovrdlz	%o0,	%f14,	%f22
	fmovrdgez	%i0,	%f6,	%f2
	setx loop_67, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_67: 	move	%xcc,	%o7,	%i7
	edge8	%l5,	%o1,	%g5
	edge32ln	%g6,	%l4,	%o5
	umul	%i2,	0x1FCE,	%g4
	fxor	%f18,	%f18,	%f12
	fmovdvc	%icc,	%f7,	%f28
	ldsb	[%l7 + 0x3A],	%o4
	mulx	%l3,	0x0D39,	%i4
	fmovsa	%icc,	%f25,	%f14
	fnot2s	%f0,	%f31
	fmul8sux16	%f0,	%f20,	%f22
	fandnot2	%f26,	%f8,	%f28
	udivx	%l1,	0x0160,	%g1
	orn	%l6,	0x0C06,	%i1
	srax	%g3,	0x0F,	%g2
	edge32	%l0,	%i6,	%l2
	std	%f4,	[%l7 + 0x18]
	xorcc	%o2,	%o6,	%i3
	subccc	%o0,	0x1B65,	%i0
	subc	%g7,	0x1D7C,	%o3
	edge16	%o7,	%i7,	%l5
	edge16n	%o1,	%g5,	%i5
	andn	%l4,	0x0748,	%o5
	fsrc2s	%f28,	%f25
	or	%i2,	0x06D6,	%g6
	movleu	%icc,	%g4,	%o4
	andn	%i4,	%l3,	%g1
	restore %l1, 0x0205, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fexpand	%f11,	%f22
	andncc	%g3,	%i1,	%l0
	movpos	%xcc,	%g2,	%i6
	fpack16	%f10,	%f3
	fmovsvc	%icc,	%f15,	%f7
	ld	[%l7 + 0x50],	%f7
	ld	[%l7 + 0x44],	%f8
	st	%f0,	[%l7 + 0x28]
	movrlez	%o2,	0x3AA,	%o6
	edge8n	%l2,	%o0,	%i0
	ldub	[%l7 + 0x54],	%g7
	ldsh	[%l7 + 0x3C],	%i3
	fornot2	%f20,	%f16,	%f6
	subccc	%o7,	%i7,	%l5
	smul	%o1,	0x00F4,	%o3
	movvs	%xcc,	%g5,	%l4
	udiv	%i5,	0x181C,	%i2
	sethi	0x065A,	%o5
	xor	%g6,	%o4,	%g4
	subcc	%i4,	%l3,	%l1
	srl	%g1,	%g3,	%l6
	fmovsn	%icc,	%f21,	%f8
	fandnot2s	%f9,	%f11,	%f8
	movrgz	%l0,	%g2,	%i1
	fmovsg	%xcc,	%f11,	%f1
	xor	%o2,	%o6,	%l2
	andncc	%o0,	%i6,	%g7
	srlx	%i0,	%o7,	%i3
	udivcc	%i7,	0x0427,	%l5
	stw	%o3,	[%l7 + 0x5C]
	edge32	%o1,	%l4,	%i5
	movcc	%xcc,	%i2,	%g5
	ldsh	[%l7 + 0x5C],	%o5
	fabss	%f30,	%f11
	edge32ln	%o4,	%g6,	%i4
	sra	%l3,	%g4,	%l1
	or	%g1,	%l6,	%l0
	movvs	%icc,	%g3,	%g2
	xor	%i1,	0x1304,	%o6
	lduw	[%l7 + 0x48],	%l2
	fmovrdne	%o2,	%f2,	%f18
	movvc	%icc,	%o0,	%g7
	fmovda	%icc,	%f28,	%f7
	andncc	%i6,	%i0,	%o7
	ldx	[%l7 + 0x10],	%i3
	fexpand	%f15,	%f28
	movpos	%xcc,	%i7,	%l5
	movrlz	%o1,	%l4,	%i5
	movne	%icc,	%o3,	%g5
	movrlz	%o5,	%o4,	%g6
	fcmpeq16	%f10,	%f0,	%i4
	array8	%i2,	%l3,	%l1
	ldsb	[%l7 + 0x2B],	%g4
	edge8n	%g1,	%l0,	%l6
	fcmpd	%fcc1,	%f10,	%f16
	movge	%icc,	%g2,	%i1
	fandnot2s	%f1,	%f0,	%f9
	ld	[%l7 + 0x0C],	%f1
	sir	0x0EF9
	edge8n	%g3,	%o6,	%o2
	sll	%l2,	%g7,	%o0
	udivx	%i0,	0x0E63,	%o7
	movl	%xcc,	%i6,	%i3
	sra	%i7,	%o1,	%l4
	fands	%f5,	%f13,	%f8
	sdiv	%l5,	0x0D85,	%o3
	alignaddrl	%i5,	%g5,	%o4
	fmovs	%f12,	%f1
	array16	%o5,	%g6,	%i2
	alignaddrl	%i4,	%l3,	%l1
	movrgez	%g4,	%g1,	%l6
	sdiv	%g2,	0x1967,	%l0
	fmovrsgez	%g3,	%f12,	%f29
	fpadd16s	%f5,	%f8,	%f28
	movle	%xcc,	%i1,	%o6
	sdiv	%l2,	0x030B,	%o2
	udivx	%g7,	0x0B54,	%o0
	movrne	%i0,	%o7,	%i6
	fpmerge	%f14,	%f30,	%f6
	xor	%i3,	0x10E9,	%i7
	fcmple32	%f22,	%f8,	%o1
	ldsb	[%l7 + 0x4E],	%l4
	edge32l	%l5,	%i5,	%o3
	movre	%g5,	%o4,	%g6
	ldsw	[%l7 + 0x38],	%i2
	nop
	set	0x7E, %o6
	lduh	[%l7 + %o6],	%i4
	edge32l	%o5,	%l3,	%l1
	setx loop_68, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_68: 	edge8n	%g2,	%g4,	%g3
	fmovscs	%xcc,	%f21,	%f24
	xorcc	%i1,	0x02E9,	%o6
	movle	%xcc,	%l0,	%l2
	xorcc	%o2,	0x130E,	%o0
	edge16ln	%i0,	%o7,	%g7
	sdiv	%i6,	0x15D1,	%i3
	umul	%o1,	0x14F5,	%i7
	movl	%icc,	%l4,	%l5
	stw	%o3,	[%l7 + 0x28]
	fsrc1	%f10,	%f12
	stw	%g5,	[%l7 + 0x30]
	movcc	%xcc,	%o4,	%i5
	movleu	%icc,	%g6,	%i4
	edge32n	%o5,	%l3,	%l1
	umulcc	%g1,	0x1868,	%l6
	array32	%i2,	%g2,	%g3
	umulcc	%i1,	%g4,	%l0
	fornot2s	%f11,	%f24,	%f21
	fornot1s	%f2,	%f23,	%f5
	addccc	%l2,	0x06EC,	%o2
	fand	%f0,	%f28,	%f18
	std	%f16,	[%l7 + 0x40]
	edge16	%o0,	%i0,	%o6
	nop
	set	0x30, %l2
	stx	%g7,	[%l7 + %l2]
	fmul8sux16	%f4,	%f6,	%f18
	movle	%xcc,	%i6,	%i3
	fpadd32	%f30,	%f6,	%f26
	addc	%o7,	%i7,	%o1
	add	%l4,	0x12A9,	%l5
	fpsub16	%f16,	%f26,	%f0
	nop
	set	0x20, %l3
	stb	%g5,	[%l7 + %l3]
	xor	%o4,	0x08D1,	%o3
	fnands	%f14,	%f13,	%f28
	fmul8sux16	%f18,	%f24,	%f24
	addcc	%g6,	0x0D11,	%i5
	fpadd16	%f8,	%f12,	%f26
	std	%f16,	[%l7 + 0x68]
	sth	%i4,	[%l7 + 0x38]
	edge16n	%l3,	%o5,	%l1
	udivx	%l6,	0x0AD9,	%i2
	fnot2s	%f12,	%f15
	sdivx	%g2,	0x004F,	%g1
	std	%f28,	[%l7 + 0x08]
	xnorcc	%i1,	%g3,	%l0
	edge32n	%g4,	%o2,	%o0
	mova	%xcc,	%l2,	%i0
	sdivx	%g7,	0x107A,	%o6
	addcc	%i3,	%i6,	%i7
	array32	%o1,	%l4,	%o7
	stx	%g5,	[%l7 + 0x08]
	ldsh	[%l7 + 0x20],	%l5
	srl	%o4,	0x15,	%g6
	xnor	%i5,	0x1483,	%i4
	movne	%xcc,	%l3,	%o5
	movrlz	%o3,	0x1AF,	%l1
	lduh	[%l7 + 0x60],	%i2
	movleu	%xcc,	%g2,	%g1
	orncc	%i1,	%l6,	%g3
	edge16l	%g4,	%o2,	%l0
	or	%o0,	%i0,	%l2
	fornot2s	%f0,	%f20,	%f18
	movgu	%icc,	%o6,	%g7
	sth	%i6,	[%l7 + 0x76]
	ld	[%l7 + 0x4C],	%f27
	movre	%i3,	%o1,	%l4
	edge32l	%o7,	%g5,	%i7
	edge32	%l5,	%o4,	%g6
	fands	%f22,	%f21,	%f10
	edge16ln	%i4,	%l3,	%i5
	movl	%xcc,	%o3,	%o5
	save %l1, 0x1DE1, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g1,	%i1,	%i2
	fands	%f15,	%f24,	%f9
	save %g3, 0x1B30, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxor	%f10,	%f22,	%f2
	edge16ln	%g4,	%l0,	%o0
	ldd	[%l7 + 0x38],	%f12
	smul	%i0,	%o2,	%l2
	addccc	%o6,	%g7,	%i6
	fone	%f10
	fmovdcs	%xcc,	%f28,	%f5
	edge32n	%i3,	%l4,	%o7
	ldd	[%l7 + 0x38],	%g4
	movrlez	%o1,	0x3B7,	%l5
	edge32n	%o4,	%g6,	%i7
	udiv	%i4,	0x0F9B,	%i5
	fone	%f18
	andncc	%o3,	%o5,	%l1
	fcmpeq32	%f20,	%f14,	%g2
	alignaddrl	%l3,	%g1,	%i2
	edge32	%i1,	%l6,	%g4
	st	%f22,	[%l7 + 0x50]
	fnand	%f12,	%f14,	%f28
	edge16ln	%g3,	%l0,	%i0
	std	%f10,	[%l7 + 0x20]
	fmuld8ulx16	%f3,	%f13,	%f30
	fnand	%f12,	%f12,	%f16
	fmovdvs	%xcc,	%f16,	%f31
	nop
	set	0x44, %l5
	lduh	[%l7 + %l5],	%o0
	umul	%l2,	0x0DAC,	%o2
	addccc	%g7,	0x045E,	%o6
	bshuffle	%f20,	%f6,	%f22
	movrlz	%i3,	%i6,	%o7
	or	%l4,	%g5,	%o1
	fmuld8sux16	%f25,	%f21,	%f30
	ldub	[%l7 + 0x7C],	%l5
	alignaddrl	%o4,	%i7,	%g6
	udiv	%i4,	0x1704,	%i5
	udivcc	%o5,	0x11E0,	%l1
	edge16l	%g2,	%o3,	%g1
	movleu	%icc,	%l3,	%i1
	movrgez	%i2,	%g4,	%l6
	andcc	%l0,	0x0569,	%i0
	fcmpeq32	%f6,	%f0,	%g3
	ldx	[%l7 + 0x40],	%o0
	and	%o2,	0x1411,	%l2
	popc	%o6,	%g7
	movcc	%icc,	%i6,	%i3
	srax	%o7,	0x1C,	%g5
	alignaddr	%l4,	%l5,	%o4
	movge	%icc,	%o1,	%i7
	std	%f18,	[%l7 + 0x10]
	movcs	%icc,	%i4,	%g6
	array16	%i5,	%l1,	%g2
	movrlz	%o3,	0x1D2,	%o5
	fmovdg	%icc,	%f14,	%f27
	fmovsleu	%icc,	%f6,	%f2
	fornot2s	%f13,	%f4,	%f7
	fcmpgt16	%f14,	%f28,	%g1
	addccc	%i1,	%i2,	%g4
	popc	%l6,	%l0
	edge8ln	%l3,	%i0,	%o0
	movge	%xcc,	%g3,	%l2
	umulcc	%o6,	0x097D,	%o2
	std	%f6,	[%l7 + 0x28]
	srlx	%g7,	0x18,	%i6
	mulscc	%i3,	0x0F74,	%o7
	fpsub16	%f22,	%f8,	%f4
	movleu	%xcc,	%l4,	%l5
	subccc	%o4,	0x1717,	%g5
	movn	%xcc,	%o1,	%i4
	array16	%i7,	%g6,	%i5
	fmovdn	%icc,	%f21,	%f0
	fcmps	%fcc3,	%f5,	%f18
	fmovrsgez	%g2,	%f19,	%f31
	alignaddr	%l1,	%o3,	%o5
	edge16ln	%i1,	%g1,	%g4
	xor	%l6,	0x06EA,	%i2
	movrgez	%l3,	0x09C,	%l0
	orncc	%o0,	%i0,	%l2
	ld	[%l7 + 0x68],	%f8
	addcc	%o6,	0x1DBE,	%g3
	sra	%g7,	%i6,	%i3
	edge8l	%o7,	%o2,	%l5
	orn	%l4,	%o4,	%o1
	udiv	%g5,	0x0D72,	%i4
	alignaddr	%g6,	%i5,	%i7
	edge32	%l1,	%o3,	%g2
	edge8n	%o5,	%g1,	%i1
	xnorcc	%l6,	0x046D,	%g4
	st	%f8,	[%l7 + 0x78]
	nop
	set	0x46, %g7
	ldsb	[%l7 + %g7],	%i2
	edge16n	%l0,	%o0,	%l3
	fmuld8sux16	%f25,	%f4,	%f8
	udivx	%l2,	0x0D55,	%i0
	fmovrde	%o6,	%f2,	%f8
	sra	%g3,	%g7,	%i3
	fandnot1s	%f15,	%f13,	%f15
	andcc	%o7,	%i6,	%o2
	movne	%xcc,	%l4,	%o4
	movneg	%icc,	%l5,	%o1
	fcmpgt32	%f20,	%f24,	%i4
	umul	%g5,	%g6,	%i7
	edge16n	%i5,	%o3,	%g2
	movle	%xcc,	%o5,	%l1
	edge8n	%g1,	%l6,	%i1
	addccc	%g4,	%i2,	%l0
	orcc	%o0,	%l2,	%i0
	movne	%icc,	%l3,	%o6
	ldx	[%l7 + 0x38],	%g7
	movle	%icc,	%i3,	%o7
	udivx	%g3,	0x12EC,	%i6
	movle	%xcc,	%o2,	%l4
	stb	%l5,	[%l7 + 0x2B]
	fmovrdlz	%o1,	%f20,	%f26
	sra	%i4,	%g5,	%g6
	fnot2s	%f31,	%f7
	movleu	%icc,	%i7,	%i5
	sllx	%o4,	%o3,	%o5
	umul	%l1,	0x1D2A,	%g1
	andcc	%l6,	0x1426,	%i1
	mova	%xcc,	%g4,	%i2
	movrlez	%l0,	0x3F2,	%o0
	edge32ln	%l2,	%g2,	%i0
	movcs	%xcc,	%o6,	%g7
	xorcc	%i3,	0x0F65,	%l3
	xnor	%o7,	0x1E3F,	%g3
	addc	%o2,	%l4,	%i6
	fmovsn	%icc,	%f12,	%f14
	addcc	%o1,	0x0201,	%i4
	movrlz	%l5,	%g5,	%g6
	fmovd	%f2,	%f24
	andncc	%i7,	%i5,	%o4
	fsrc1	%f28,	%f8
	fcmps	%fcc2,	%f6,	%f0
	movrne	%o3,	%o5,	%l1
	addccc	%l6,	0x1B0D,	%i1
	addcc	%g1,	0x11F7,	%g4
	st	%f0,	[%l7 + 0x40]
	ld	[%l7 + 0x50],	%f18
	move	%icc,	%i2,	%o0
	sth	%l2,	[%l7 + 0x62]
	sth	%g2,	[%l7 + 0x6A]
	ldd	[%l7 + 0x18],	%f0
	fsrc2	%f2,	%f20
	movvc	%icc,	%i0,	%l0
	addccc	%o6,	%i3,	%g7
	fmovrdlz	%o7,	%f20,	%f18
	mova	%icc,	%l3,	%o2
	popc	%l4,	%i6
	stb	%g3,	[%l7 + 0x7E]
	sdiv	%o1,	0x1A1B,	%i4
	alignaddrl	%l5,	%g5,	%g6
	sethi	0x0ABA,	%i5
	popc	%i7,	%o4
	andncc	%o3,	%o5,	%l1
	fmovdgu	%icc,	%f17,	%f8
	fcmpgt16	%f30,	%f26,	%l6
	umul	%i1,	%g1,	%i2
	sethi	0x1AB4,	%o0
	umul	%l2,	0x175E,	%g2
	smulcc	%i0,	0x0DEF,	%l0
	sth	%g4,	[%l7 + 0x34]
	addc	%i3,	0x00A7,	%g7
	lduw	[%l7 + 0x78],	%o6
	fandnot2	%f14,	%f16,	%f20
	sub	%l3,	0x17EB,	%o2
	restore %l4, %o7, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o1,	%g3,	%l5
	fnegs	%f17,	%f7
	andcc	%g5,	0x1E4E,	%i4
	mulscc	%g6,	0x1303,	%i7
	movvs	%icc,	%o4,	%o3
	udiv	%o5,	0x11D5,	%i5
	srl	%l1,	%i1,	%l6
	movge	%xcc,	%i2,	%o0
	fmovdneg	%icc,	%f18,	%f17
	array16	%g1,	%l2,	%g2
	edge8l	%i0,	%g4,	%l0
	array16	%g7,	%i3,	%o6
	movrlez	%l3,	0x0F1,	%l4
	subcc	%o7,	%i6,	%o2
	st	%f19,	[%l7 + 0x74]
	ldsb	[%l7 + 0x3C],	%g3
	fmovsle	%xcc,	%f6,	%f28
	fmovscc	%icc,	%f30,	%f19
	ld	[%l7 + 0x48],	%f1
	andncc	%l5,	%o1,	%g5
	movleu	%icc,	%i4,	%g6
	mulx	%i7,	%o4,	%o3
	srax	%o5,	0x11,	%i5
	fnot1s	%f2,	%f19
	orn	%i1,	%l6,	%l1
	fcmpeq32	%f26,	%f22,	%o0
	add	%i2,	0x12EA,	%l2
	movleu	%xcc,	%g2,	%g1
	mulscc	%i0,	0x1D0E,	%l0
	array8	%g7,	%g4,	%o6
	lduw	[%l7 + 0x54],	%l3
	sdivx	%i3,	0x09B8,	%o7
	ld	[%l7 + 0x5C],	%f6
	udivx	%l4,	0x1970,	%i6
	stw	%g3,	[%l7 + 0x64]
	subccc	%o2,	%l5,	%o1
	fsrc2s	%f13,	%f8
	mulx	%g5,	0x09D5,	%i4
	movne	%xcc,	%i7,	%o4
	movgu	%xcc,	%g6,	%o5
	orcc	%i5,	%i1,	%l6
	pdist	%f4,	%f10,	%f10
	xorcc	%l1,	0x1283,	%o3
	siam	0x6
	udiv	%i2,	0x114D,	%l2
	edge8	%g2,	%o0,	%g1
	movrgez	%l0,	%g7,	%g4
	fsrc2s	%f8,	%f13
	subccc	%o6,	%l3,	%i3
	sth	%o7,	[%l7 + 0x50]
	movrgz	%i0,	0x0AB,	%l4
	edge8	%i6,	%o2,	%l5
	fnot1s	%f15,	%f11
	array16	%o1,	%g3,	%i4
	setx loop_69, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_69: 	fmul8ulx16	%f28,	%f28,	%f28
	movrlez	%g6,	%o5,	%i5
	array32	%i1,	%l1,	%o3
	subc	%l6,	%l2,	%i2
	fnot2	%f8,	%f8
	lduw	[%l7 + 0x2C],	%g2
	fpsub16s	%f18,	%f20,	%f11
	orn	%g1,	0x0B6D,	%l0
	movneg	%icc,	%g7,	%o0
	ldub	[%l7 + 0x76],	%o6
	sra	%g4,	0x0D,	%i3
	edge16	%l3,	%i0,	%l4
	movleu	%icc,	%i6,	%o7
	fmovdvc	%xcc,	%f5,	%f0
	mova	%xcc,	%l5,	%o1
	stb	%g3,	[%l7 + 0x62]
	xnorcc	%o2,	0x0364,	%i7
	fmovrdlez	%o4,	%f4,	%f30
	addccc	%g5,	%i4,	%g6
	fornot1s	%f11,	%f3,	%f27
	restore %o5, %i5, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mova	%xcc,	%l1,	%l6
	orncc	%o3,	%l2,	%i2
	edge32l	%g2,	%l0,	%g1
	fmovdneg	%xcc,	%f4,	%f6
	mulx	%g7,	%o0,	%o6
	smul	%g4,	0x0FE0,	%i3
	movrgz	%i0,	%l3,	%i6
	array16	%l4,	%o7,	%l5
	fnands	%f30,	%f4,	%f24
	andn	%o1,	%g3,	%i7
	ldd	[%l7 + 0x18],	%f20
	movrlez	%o4,	0x31A,	%o2
	addcc	%g5,	0x13AC,	%g6
	movrgz	%i4,	0x333,	%i5
	umulcc	%o5,	0x0FCF,	%i1
	ldd	[%l7 + 0x08],	%f30
	umul	%l6,	%o3,	%l2
	movre	%i2,	%l1,	%g2
	udivcc	%l0,	0x1FE8,	%g7
	movge	%xcc,	%g1,	%o0
	mulscc	%g4,	0x03C2,	%i3
	movneg	%xcc,	%o6,	%i0
	fmovdcs	%xcc,	%f31,	%f4
	fmovdcs	%icc,	%f14,	%f26
	movleu	%xcc,	%l3,	%i6
	fpack16	%f20,	%f17
	sll	%o7,	0x17,	%l4
	srlx	%l5,	%g3,	%i7
	fsrc1s	%f2,	%f31
	st	%f19,	[%l7 + 0x0C]
	lduh	[%l7 + 0x4E],	%o4
	movne	%xcc,	%o2,	%o1
	lduh	[%l7 + 0x5E],	%g5
	nop
	set	0x44, %i0
	ldsw	[%l7 + %i0],	%i4
	fmovdneg	%xcc,	%f15,	%f23
	fmovscc	%xcc,	%f25,	%f28
	edge8ln	%g6,	%o5,	%i1
	fcmpne32	%f10,	%f18,	%i5
	fsrc1	%f8,	%f24
	movle	%icc,	%o3,	%l6
	subc	%l2,	%i2,	%l1
	array8	%g2,	%l0,	%g7
	fmovsne	%icc,	%f15,	%f19
	srl	%o0,	0x04,	%g1
	stb	%g4,	[%l7 + 0x6E]
	mulscc	%o6,	0x0D5D,	%i0
	movgu	%icc,	%l3,	%i6
	mulscc	%o7,	%l4,	%i3
	sir	0x0E8C
	addcc	%l5,	0x1489,	%g3
	movl	%xcc,	%o4,	%i7
	movrgez	%o1,	0x339,	%o2
	movvc	%icc,	%i4,	%g6
	sth	%o5,	[%l7 + 0x10]
	edge16	%g5,	%i1,	%o3
	sdiv	%l6,	0x037B,	%l2
	umul	%i2,	0x16FB,	%i5
	fmul8sux16	%f14,	%f24,	%f14
	xor	%g2,	0x093A,	%l0
	movpos	%icc,	%g7,	%l1
	stb	%g1,	[%l7 + 0x45]
	smulcc	%o0,	0x17FC,	%o6
	fmul8x16al	%f13,	%f29,	%f26
	movl	%icc,	%g4,	%l3
	ldub	[%l7 + 0x1E],	%i0
	fmovdgu	%xcc,	%f16,	%f29
	fmovde	%xcc,	%f28,	%f24
	udivx	%o7,	0x087A,	%l4
	array16	%i6,	%i3,	%l5
	ldsw	[%l7 + 0x5C],	%g3
	edge32	%o4,	%i7,	%o2
	edge16ln	%o1,	%g6,	%o5
	ldd	[%l7 + 0x58],	%f14
	movge	%xcc,	%i4,	%g5
	edge8	%o3,	%l6,	%i1
	movleu	%icc,	%l2,	%i2
	fones	%f31
	addc	%i5,	0x0C07,	%g2
	sir	0x1ECF
	sdivx	%g7,	0x1C9B,	%l0
	save %l1, 0x0104, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%o6,	0x0442,	%g4
	pdist	%f4,	%f26,	%f30
	fmovdge	%icc,	%f29,	%f5
	fsrc1s	%f4,	%f20
	movneg	%icc,	%g1,	%l3
	umul	%i0,	0x1EE0,	%o7
	fmovsvs	%xcc,	%f22,	%f17
	ldub	[%l7 + 0x0F],	%i6
	and	%i3,	0x1286,	%l5
	subccc	%l4,	0x12D1,	%g3
	fnand	%f26,	%f26,	%f14
	mova	%xcc,	%i7,	%o4
	fmovdne	%icc,	%f15,	%f8
	fmovrsne	%o2,	%f1,	%f24
	edge8l	%o1,	%o5,	%g6
	sll	%g5,	%o3,	%i4
	srlx	%i1,	0x11,	%l6
	fnors	%f16,	%f9,	%f20
	bshuffle	%f8,	%f24,	%f22
	edge8ln	%i2,	%l2,	%i5
	ldd	[%l7 + 0x08],	%g6
	ldub	[%l7 + 0x54],	%l0
	movrne	%l1,	0x3AE,	%o0
	movrgz	%g2,	%o6,	%g4
	fornot2	%f0,	%f0,	%f2
	stx	%g1,	[%l7 + 0x08]
	ldd	[%l7 + 0x28],	%i0
	movne	%icc,	%o7,	%i6
	mova	%xcc,	%i3,	%l5
	ldd	[%l7 + 0x40],	%l2
	movl	%xcc,	%l4,	%g3
	fpsub32	%f10,	%f0,	%f10
	fcmpgt16	%f10,	%f8,	%o4
	fnegd	%f18,	%f6
	subccc	%o2,	%o1,	%i7
	fmovdneg	%xcc,	%f4,	%f21
	nop
	set	0x72, %i6
	stb	%o5,	[%l7 + %i6]
	movn	%xcc,	%g5,	%g6
	fmovdcc	%icc,	%f9,	%f31
	sth	%i4,	[%l7 + 0x56]
	fzero	%f16
	array16	%i1,	%l6,	%o3
	fmovscc	%xcc,	%f14,	%f11
	movneg	%xcc,	%l2,	%i2
	subc	%i5,	0x1932,	%l0
	xorcc	%g7,	%o0,	%l1
	fmovrdgz	%o6,	%f6,	%f22
	stw	%g4,	[%l7 + 0x30]
	subccc	%g1,	%g2,	%o7
	fmovsn	%icc,	%f31,	%f6
	addc	%i6,	%i3,	%i0
	fnegd	%f10,	%f2
	popc	0x0F37,	%l5
	smul	%l4,	%l3,	%o4
	subcc	%o2,	%g3,	%i7
	stx	%o1,	[%l7 + 0x10]
	movrgez	%g5,	0x05D,	%g6
	movrlz	%i4,	%i1,	%o5
	ldsb	[%l7 + 0x40],	%l6
	movrne	%o3,	0x1E5,	%i2
	stb	%l2,	[%l7 + 0x32]
	edge16ln	%l0,	%g7,	%i5
	movrlez	%l1,	%o0,	%o6
	move	%xcc,	%g1,	%g4
	andcc	%o7,	%i6,	%g2
	mulx	%i3,	0x0F06,	%i0
	movpos	%xcc,	%l5,	%l4
	ldsb	[%l7 + 0x6A],	%o4
	edge32n	%o2,	%g3,	%l3
	movleu	%xcc,	%o1,	%g5
	fpackfix	%f22,	%f17
	orn	%i7,	%i4,	%i1
	orcc	%g6,	0x0CC2,	%l6
	st	%f24,	[%l7 + 0x60]
	setx loop_70, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_70: 	movge	%icc,	%l2,	%g7
	fmovdneg	%icc,	%f0,	%f21
	movrlez	%i5,	%l1,	%l0
	srax	%o0,	%g1,	%g4
	sra	%o6,	0x06,	%o7
	umul	%i6,	%g2,	%i0
	umulcc	%i3,	%l4,	%o4
	movneg	%icc,	%l5,	%g3
	fmovsleu	%icc,	%f10,	%f6
	edge16l	%o2,	%o1,	%g5
	fone	%f20
	ldd	[%l7 + 0x10],	%l2
	edge16l	%i4,	%i1,	%i7
	sdiv	%l6,	0x107F,	%o3
	std	%f26,	[%l7 + 0x20]
	movgu	%icc,	%i2,	%g6
	fcmple32	%f4,	%f26,	%o5
	addccc	%g7,	0x06D1,	%i5
	fmovspos	%xcc,	%f7,	%f10
	save %l1, %l0, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fcmpes	%fcc0,	%f21,	%f29
	fmovdn	%xcc,	%f5,	%f17
	fornot2	%f22,	%f10,	%f28
	faligndata	%f0,	%f22,	%f18
	add	%l2,	%g1,	%g4
	stx	%o7,	[%l7 + 0x60]
	udiv	%i6,	0x0B85,	%o6
	sra	%i0,	%g2,	%l4
	fnot2s	%f18,	%f31
	xnorcc	%i3,	0x0B88,	%o4
	subcc	%g3,	0x097D,	%l5
	fmuld8sux16	%f11,	%f28,	%f10
	ldx	[%l7 + 0x50],	%o2
	ldd	[%l7 + 0x38],	%f4
	stb	%g5,	[%l7 + 0x29]
	orcc	%l3,	0x09EC,	%i4
	xnor	%i1,	%i7,	%l6
	srlx	%o1,	0x05,	%i2
	std	%f30,	[%l7 + 0x30]
	movle	%icc,	%g6,	%o3
	fmovdgu	%xcc,	%f30,	%f8
	fcmps	%fcc1,	%f29,	%f21
	restore %g7, 0x1192, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	srax	%i5,	%l1,	%o0
	sdivcc	%l2,	0x07D9,	%l0
	stb	%g1,	[%l7 + 0x78]
	edge32ln	%g4,	%i6,	%o7
	add	%i0,	0x0CA0,	%g2
	stw	%l4,	[%l7 + 0x20]
	lduh	[%l7 + 0x2A],	%i3
	movrgz	%o6,	0x1EA,	%g3
	orncc	%l5,	%o2,	%g5
	movg	%xcc,	%l3,	%i4
	or	%o4,	0x1991,	%i1
	addc	%i7,	0x03A9,	%l6
	srl	%o1,	0x19,	%i2
	udivx	%g6,	0x1DFE,	%o3
	st	%f12,	[%l7 + 0x28]
	edge32l	%g7,	%i5,	%o5
	fornot1s	%f0,	%f12,	%f19
	addcc	%o0,	0x1A61,	%l2
	mulscc	%l0,	0x1055,	%l1
	movvc	%xcc,	%g1,	%i6
	for	%f10,	%f2,	%f12
	ldd	[%l7 + 0x70],	%g4
	movcc	%icc,	%o7,	%g2
	movge	%icc,	%i0,	%l4
	movn	%icc,	%i3,	%g3
	movre	%l5,	%o2,	%o6
	movvs	%icc,	%g5,	%i4
	umulcc	%o4,	0x10DF,	%i1
	srax	%i7,	%l6,	%l3
	add	%o1,	0x0E48,	%g6
	sth	%o3,	[%l7 + 0x38]
	movrlz	%i2,	0x34B,	%i5
	fnor	%f14,	%f18,	%f10
	fand	%f20,	%f14,	%f2
	edge32l	%g7,	%o5,	%l2
	addccc	%o0,	0x091A,	%l0
	subccc	%l1,	0x1B88,	%i6
	edge16	%g1,	%g4,	%o7
	lduh	[%l7 + 0x32],	%g2
	fmovsgu	%xcc,	%f9,	%f25
	movrlz	%l4,	%i3,	%g3
	ld	[%l7 + 0x48],	%f9
	edge16	%l5,	%i0,	%o2
	fandnot2s	%f22,	%f26,	%f23
	udivcc	%g5,	0x098B,	%i4
	fmovspos	%icc,	%f31,	%f14
	movne	%xcc,	%o6,	%o4
	fmovsge	%icc,	%f12,	%f14
	edge16l	%i1,	%l6,	%i7
	popc	0x1114,	%l3
	save %o1, %o3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udiv	%g6,	0x00E2,	%g7
	siam	0x4
	andcc	%i5,	%l2,	%o5
	ldsh	[%l7 + 0x52],	%o0
	subcc	%l0,	%i6,	%g1
	sdivcc	%g4,	0x1BA1,	%l1
	array8	%g2,	%l4,	%o7
	fmovse	%icc,	%f7,	%f22
	sth	%g3,	[%l7 + 0x3C]
	array8	%i3,	%l5,	%i0
	lduh	[%l7 + 0x12],	%g5
	edge16ln	%o2,	%i4,	%o4
	edge16	%o6,	%i1,	%i7
	xor	%l6,	%l3,	%o1
	ldsh	[%l7 + 0x18],	%i2
	edge16l	%o3,	%g6,	%i5
	edge16ln	%g7,	%o5,	%l2
	edge8ln	%l0,	%i6,	%g1
	fcmpgt16	%f22,	%f22,	%g4
	edge8	%o0,	%g2,	%l4
	subcc	%o7,	0x14C0,	%g3
	fpadd16s	%f16,	%f10,	%f4
	fmuld8sux16	%f7,	%f28,	%f28
	movrne	%l1,	%l5,	%i0
	popc	0x1FD0,	%g5
	fmovdg	%icc,	%f9,	%f29
	stb	%i3,	[%l7 + 0x40]
	for	%f22,	%f0,	%f26
	stx	%i4,	[%l7 + 0x58]
	movvs	%xcc,	%o2,	%o4
	mulx	%o6,	%i1,	%i7
	smulcc	%l6,	%o1,	%i2
	edge8ln	%o3,	%l3,	%g6
	ldd	[%l7 + 0x78],	%f8
	xor	%g7,	0x0CF6,	%i5
	umul	%l2,	0x1F40,	%l0
	addc	%o5,	%g1,	%g4
	ld	[%l7 + 0x50],	%f15
	ldub	[%l7 + 0x5E],	%o0
	andn	%g2,	0x0B6B,	%i6
	edge8n	%o7,	%l4,	%g3
	addc	%l1,	%i0,	%l5
	xnor	%g5,	%i3,	%i4
	fmovdge	%xcc,	%f19,	%f6
	fmovrdne	%o2,	%f20,	%f6
	ldd	[%l7 + 0x08],	%o6
	movgu	%xcc,	%i1,	%o4
	andncc	%l6,	%o1,	%i2
	movneg	%icc,	%o3,	%l3
	edge32	%g6,	%g7,	%i5
	array8	%i7,	%l0,	%l2
	addc	%g1,	%g4,	%o5
	movvs	%icc,	%g2,	%o0
	fmovrdgz	%o7,	%f30,	%f16
	edge16l	%l4,	%g3,	%i6
	sub	%i0,	0x0143,	%l5
	movrgez	%g5,	0x393,	%i3
	movrlez	%l1,	%i4,	%o2
	orcc	%i1,	%o6,	%o4
	fmovdne	%icc,	%f16,	%f20
	movcs	%xcc,	%l6,	%o1
	movleu	%icc,	%o3,	%l3
	ldsh	[%l7 + 0x2C],	%g6
	pdist	%f18,	%f24,	%f26
	srl	%g7,	0x1C,	%i2
	movne	%xcc,	%i5,	%l0
	xnor	%l2,	0x11C8,	%i7
	sethi	0x090F,	%g1
	edge8n	%g4,	%o5,	%g2
	srl	%o0,	%o7,	%l4
	andncc	%i6,	%g3,	%i0
	fmovsneg	%icc,	%f12,	%f27
	sdivx	%g5,	0x0209,	%l5
	srax	%l1,	0x0E,	%i4
	movrgez	%i3,	0x26A,	%o2
	save %o6, %o4, %l6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%i1,	0x11F2,	%o3
	and	%l3,	%g6,	%g7
	nop
	set	0x39, %o4
	ldub	[%l7 + %o4],	%o1
	orn	%i5,	0x1364,	%i2
	std	%f24,	[%l7 + 0x60]
	orn	%l0,	%i7,	%l2
	srl	%g4,	%o5,	%g2
	movcc	%xcc,	%g1,	%o0
	ldsh	[%l7 + 0x18],	%l4
	sdivx	%i6,	0x0DE1,	%g3
	smulcc	%o7,	0x0E4D,	%i0
	fmovse	%icc,	%f26,	%f18
	movneg	%xcc,	%l5,	%g5
	popc	0x1437,	%i4
	fnot2s	%f10,	%f23
	movrgz	%i3,	%l1,	%o6
	edge16	%o2,	%l6,	%o4
	or	%o3,	0x1D25,	%i1
	mulscc	%g6,	%g7,	%o1
	mulscc	%i5,	%l3,	%l0
	fmul8x16al	%f10,	%f7,	%f12
	ldsw	[%l7 + 0x08],	%i2
	alignaddr	%i7,	%g4,	%o5
	stb	%l2,	[%l7 + 0x77]
	lduh	[%l7 + 0x0A],	%g1
	ldub	[%l7 + 0x58],	%g2
	udivx	%l4,	0x111F,	%i6
	sub	%g3,	0x024F,	%o0
	std	%f20,	[%l7 + 0x50]
	movcs	%xcc,	%i0,	%l5
	fmovsleu	%icc,	%f13,	%f19
	std	%f8,	[%l7 + 0x38]
	ldsw	[%l7 + 0x78],	%g5
	edge8l	%o7,	%i4,	%l1
	ldsh	[%l7 + 0x70],	%o6
	orncc	%i3,	%o2,	%l6
	xnorcc	%o3,	%o4,	%g6
	fsrc1s	%f22,	%f31
	subc	%i1,	0x0E30,	%o1
	lduw	[%l7 + 0x74],	%g7
	alignaddrl	%l3,	%l0,	%i5
	sllx	%i2,	0x19,	%i7
	andcc	%o5,	%g4,	%l2
	movcs	%icc,	%g2,	%g1
	movle	%xcc,	%i6,	%g3
	umul	%o0,	%i0,	%l4
	ldd	[%l7 + 0x20],	%g4
	movl	%xcc,	%o7,	%i4
	udiv	%l5,	0x151C,	%l1
	smul	%i3,	%o6,	%l6
	fones	%f11
	fmuld8sux16	%f19,	%f26,	%f30
	edge8ln	%o3,	%o2,	%o4
	movrlz	%g6,	%i1,	%o1
	alignaddr	%l3,	%g7,	%l0
	array16	%i5,	%i2,	%i7
	edge32n	%o5,	%l2,	%g4
	array32	%g2,	%i6,	%g1
	fandnot2	%f8,	%f20,	%f8
	sub	%o0,	%i0,	%l4
	stb	%g5,	[%l7 + 0x13]
	fmovsge	%icc,	%f15,	%f4
	edge16n	%o7,	%i4,	%g3
	sdiv	%l1,	0x1505,	%i3
	andncc	%o6,	%l6,	%l5
	sethi	0x085D,	%o2
	addccc	%o4,	0x0132,	%g6
	fmovdge	%xcc,	%f31,	%f15
	edge16n	%i1,	%o3,	%l3
	fmovd	%f28,	%f18
	fmovsvc	%icc,	%f25,	%f17
	movcs	%icc,	%o1,	%l0
	sra	%i5,	%i2,	%i7
	fpadd16	%f20,	%f2,	%f10
	alignaddrl	%o5,	%l2,	%g4
	edge32l	%g7,	%g2,	%g1
	movrlez	%o0,	%i6,	%i0
	save %l4, 0x0183, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%i4,	%g3,	%g5
	smul	%l1,	%i3,	%l6
	movpos	%icc,	%l5,	%o6
	movrlez	%o4,	0x37F,	%g6
	fmuld8ulx16	%f9,	%f9,	%f24
	sdiv	%i1,	0x1AC0,	%o3
	movrgez	%o2,	0x2FC,	%l3
	mova	%icc,	%o1,	%i5
	edge32ln	%l0,	%i2,	%o5
	fandnot2	%f8,	%f24,	%f30
	stb	%l2,	[%l7 + 0x35]
	edge8n	%i7,	%g4,	%g2
	addccc	%g7,	%o0,	%g1
	popc	%i6,	%l4
	orn	%i0,	%o7,	%g3
	mulscc	%i4,	%l1,	%i3
	udiv	%l6,	0x1F04,	%l5
	addccc	%o6,	%o4,	%g6
	sdivx	%g5,	0x037C,	%i1
	ld	[%l7 + 0x5C],	%f27
	movneg	%xcc,	%o3,	%o2
	fmovscs	%xcc,	%f3,	%f28
	fmovd	%f24,	%f22
	array16	%l3,	%i5,	%l0
	movrgez	%o1,	0x181,	%i2
	fmovdl	%icc,	%f8,	%f24
	sethi	0x17EE,	%l2
	stb	%o5,	[%l7 + 0x7E]
	addccc	%g4,	%i7,	%g2
	edge8	%o0,	%g7,	%g1
	fpmerge	%f24,	%f14,	%f16
	lduh	[%l7 + 0x3E],	%i6
	edge8n	%i0,	%l4,	%g3
	fmuld8sux16	%f12,	%f25,	%f30
	fmul8x16al	%f2,	%f11,	%f10
	edge32n	%o7,	%i4,	%l1
	alignaddr	%i3,	%l5,	%l6
	sub	%o6,	0x0D54,	%g6
	xorcc	%g5,	0x188B,	%i1
	movne	%icc,	%o3,	%o4
	fornot1	%f16,	%f20,	%f0
	movvs	%xcc,	%o2,	%i5
	movvc	%icc,	%l0,	%o1
	edge16	%i2,	%l3,	%l2
	udivx	%o5,	0x06EB,	%i7
	fpsub32	%f18,	%f0,	%f2
	movn	%xcc,	%g4,	%o0
	fmovdne	%xcc,	%f13,	%f29
	movcc	%xcc,	%g2,	%g7
	fzeros	%f27
	stb	%i6,	[%l7 + 0x13]
	array32	%i0,	%l4,	%g1
	array8	%o7,	%i4,	%l1
	edge32	%g3,	%i3,	%l6
	movcs	%icc,	%l5,	%g6
	faligndata	%f24,	%f16,	%f18
	or	%g5,	0x00FC,	%i1
	srlx	%o6,	0x02,	%o4
	movrgz	%o3,	0x29D,	%o2
	srlx	%l0,	%i5,	%i2
	edge32l	%o1,	%l3,	%o5
	orn	%i7,	0x146B,	%l2
	subc	%g4,	%g2,	%o0
	sir	0x1537
	fmul8sux16	%f0,	%f20,	%f2
	movvs	%icc,	%i6,	%g7
	fmul8x16	%f10,	%f2,	%f0
	movle	%icc,	%i0,	%l4
	fcmple16	%f20,	%f26,	%o7
	alignaddr	%g1,	%l1,	%i4
	fcmpes	%fcc2,	%f21,	%f2
	and	%g3,	%i3,	%l6
	sethi	0x1B38,	%l5
	orncc	%g5,	%g6,	%o6
	edge16n	%o4,	%i1,	%o2
	movl	%xcc,	%l0,	%i5
	std	%f0,	[%l7 + 0x50]
	lduh	[%l7 + 0x18],	%i2
	and	%o3,	0x1A44,	%o1
	movg	%icc,	%o5,	%l3
	xnor	%l2,	%i7,	%g2
	stx	%g4,	[%l7 + 0x18]
	edge16n	%o0,	%g7,	%i6
	fcmple16	%f24,	%f12,	%i0
	fornot2s	%f22,	%f16,	%f0
	sub	%o7,	0x08FA,	%l4
	ldd	[%l7 + 0x20],	%l0
	setx loop_71, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_71: 	edge8	%g3,	%i3,	%l6
	edge32ln	%l5,	%g5,	%o6
	srax	%o4,	%i1,	%g6
	edge16l	%l0,	%o2,	%i5
	sethi	0x19BD,	%o3
	fmovrslez	%i2,	%f0,	%f29
	sdivcc	%o1,	0x12BE,	%l3
	or	%l2,	0x1C76,	%i7
	sub	%g2,	%g4,	%o5
	add	%g7,	0x0844,	%i6
	sub	%i0,	0x0D3E,	%o0
	fmovrsne	%l4,	%f27,	%f14
	st	%f7,	[%l7 + 0x58]
	andncc	%o7,	%l1,	%g1
	popc	%i4,	%g3
	mulx	%i3,	0x11D8,	%l5
	addc	%l6,	%g5,	%o4
	movcc	%xcc,	%o6,	%i1
	orncc	%g6,	0x0D02,	%o2
	movrlz	%l0,	0x117,	%i5
	fmovdleu	%icc,	%f29,	%f27
	sdivx	%o3,	0x164E,	%o1
	fmovse	%xcc,	%f31,	%f30
	movvs	%icc,	%i2,	%l2
	fmovda	%icc,	%f31,	%f25
	fmovsle	%xcc,	%f2,	%f11
	sdivx	%i7,	0x1485,	%l3
	stx	%g4,	[%l7 + 0x30]
	lduh	[%l7 + 0x38],	%o5
	umul	%g7,	0x0006,	%i6
	ldsh	[%l7 + 0x78],	%g2
	addccc	%o0,	0x1552,	%i0
	edge32ln	%l4,	%o7,	%g1
	subc	%l1,	0x0A44,	%g3
	umulcc	%i3,	0x098B,	%i4
	alignaddr	%l5,	%g5,	%o4
	mova	%xcc,	%o6,	%i1
	edge32	%l6,	%g6,	%l0
	edge32l	%i5,	%o2,	%o1
	fxnor	%f16,	%f12,	%f20
	sll	%o3,	0x07,	%l2
	fmovde	%xcc,	%f14,	%f31
	fmovse	%xcc,	%f12,	%f19
	lduw	[%l7 + 0x44],	%i7
	ld	[%l7 + 0x18],	%f24
	fmovd	%f16,	%f16
	orncc	%i2,	%g4,	%l3
	movrgz	%o5,	%i6,	%g7
	andncc	%o0,	%i0,	%g2
	srax	%l4,	%o7,	%g1
	and	%l1,	0x00F9,	%g3
	edge32ln	%i3,	%i4,	%l5
	srl	%o4,	0x0D,	%g5
	sth	%o6,	[%l7 + 0x30]
	fands	%f6,	%f15,	%f16
	orn	%l6,	%g6,	%i1
	sir	0x14D1
	fmovdvs	%xcc,	%f11,	%f4
	ld	[%l7 + 0x14],	%f11
	movleu	%icc,	%l0,	%o2
	movpos	%xcc,	%i5,	%o3
	movrlez	%l2,	0x18E,	%i7
	fnot2s	%f20,	%f10
	edge16n	%i2,	%o1,	%l3
	fcmpne32	%f6,	%f18,	%g4
	movneg	%icc,	%o5,	%g7
	edge32ln	%o0,	%i0,	%i6
	xor	%g2,	%l4,	%g1
	edge32ln	%l1,	%g3,	%o7
	fmovse	%icc,	%f2,	%f29
	sdiv	%i4,	0x00BB,	%l5
	fmovdge	%icc,	%f4,	%f2
	mova	%icc,	%i3,	%g5
	xnorcc	%o4,	%l6,	%g6
	fcmpne16	%f16,	%f30,	%i1
	movvc	%icc,	%l0,	%o2
	xor	%o6,	%o3,	%i5
	movn	%icc,	%i7,	%l2
	movvc	%icc,	%o1,	%l3
	srax	%i2,	%o5,	%g4
	edge16l	%o0,	%g7,	%i6
	umul	%i0,	%l4,	%g1
	array16	%l1,	%g3,	%o7
	umul	%g2,	%i4,	%i3
	std	%f30,	[%l7 + 0x30]
	sdivcc	%g5,	0x13BA,	%l5
	subccc	%o4,	%g6,	%i1
	st	%f12,	[%l7 + 0x3C]
	movrgez	%l6,	%o2,	%o6
	alignaddr	%l0,	%i5,	%o3
	udivx	%l2,	0x0D75,	%i7
	st	%f28,	[%l7 + 0x08]
	fnand	%f0,	%f22,	%f16
	edge16n	%l3,	%i2,	%o1
	xor	%g4,	%o5,	%g7
	srax	%i6,	%o0,	%l4
	movge	%icc,	%g1,	%l1
	ldsw	[%l7 + 0x2C],	%g3
	movrgez	%o7,	0x15C,	%g2
	sethi	0x1E51,	%i4
	udivx	%i0,	0x1A3F,	%g5
	movre	%i3,	0x00F,	%l5
	movpos	%xcc,	%g6,	%o4
	sir	0x1461
	nop
	set	0x28, %i2
	stx	%l6,	[%l7 + %i2]
	xor	%i1,	0x1F26,	%o2
	fxnor	%f0,	%f14,	%f10
	movrne	%l0,	%i5,	%o3
	movrgz	%o6,	0x199,	%l2
	array8	%l3,	%i2,	%i7
	movvc	%xcc,	%g4,	%o1
	udiv	%o5,	0x137E,	%i6
	fmovrsne	%o0,	%f19,	%f9
	xor	%g7,	%g1,	%l1
	xnorcc	%l4,	0x1D5D,	%g3
	andncc	%o7,	%i4,	%g2
	ldsb	[%l7 + 0x6F],	%i0
	fpack32	%f30,	%f2,	%f4
	movge	%icc,	%i3,	%l5
	fmovdge	%icc,	%f30,	%f17
	addc	%g6,	%o4,	%g5
	sdivx	%i1,	0x18FF,	%o2
	fsrc1	%f10,	%f6
	ldsh	[%l7 + 0x56],	%l0
	nop
	set	0x1C, %g1
	sth	%i5,	[%l7 + %g1]
	andcc	%l6,	%o3,	%l2
	fcmpes	%fcc2,	%f0,	%f7
	movcc	%xcc,	%l3,	%i2
	sth	%o6,	[%l7 + 0x46]
	srlx	%g4,	0x10,	%i7
	fmovrslez	%o5,	%f20,	%f6
	andn	%i6,	0x06C9,	%o1
	mulx	%g7,	0x14D0,	%g1
	fmuld8sux16	%f23,	%f24,	%f12
	fpack32	%f24,	%f30,	%f12
	addccc	%o0,	0x1D52,	%l4
	addccc	%l1,	%o7,	%i4
	ldsh	[%l7 + 0x5E],	%g2
	array8	%i0,	%i3,	%g3
	udivx	%g6,	0x0762,	%o4
	stb	%g5,	[%l7 + 0x76]
	smul	%i1,	%o2,	%l0
	edge16	%i5,	%l6,	%l5
	mulx	%l2,	%l3,	%o3
	fmovse	%xcc,	%f17,	%f23
	edge8l	%i2,	%o6,	%g4
	movg	%icc,	%o5,	%i7
	st	%f12,	[%l7 + 0x40]
	movvs	%xcc,	%i6,	%o1
	fand	%f26,	%f26,	%f28
	mova	%xcc,	%g1,	%o0
	movre	%g7,	0x21E,	%l4
	ldub	[%l7 + 0x21],	%l1
	edge32l	%i4,	%o7,	%i0
	fmovdcs	%icc,	%f6,	%f14
	fmovdcc	%icc,	%f21,	%f19
	ldsw	[%l7 + 0x34],	%g2
	alignaddrl	%g3,	%g6,	%o4
	fexpand	%f22,	%f6
	fands	%f11,	%f12,	%f23
	fmovrdlez	%g5,	%f20,	%f24
	mova	%xcc,	%i1,	%o2
	alignaddr	%i3,	%l0,	%l6
	movrgez	%i5,	%l5,	%l3
	fsrc1	%f6,	%f0
	movcc	%icc,	%o3,	%l2
	sth	%i2,	[%l7 + 0x4C]
	fmul8x16au	%f16,	%f7,	%f0
	umulcc	%o6,	%o5,	%i7
	edge8ln	%i6,	%o1,	%g1
	fmovspos	%xcc,	%f5,	%f18
	movleu	%xcc,	%o0,	%g7
	movvc	%icc,	%g4,	%l4
	fpadd32s	%f29,	%f20,	%f15
	fzeros	%f27
	movge	%icc,	%l1,	%i4
	edge32n	%o7,	%g2,	%i0
	edge16	%g6,	%g3,	%g5
	movrlz	%i1,	0x3E7,	%o2
	edge32	%i3,	%o4,	%l6
	sll	%l0,	%i5,	%l3
	fexpand	%f18,	%f20
	edge8	%o3,	%l5,	%i2
	andncc	%l2,	%o6,	%o5
	movn	%xcc,	%i7,	%o1
	fpsub16	%f26,	%f28,	%f28
	save %i6, %o0, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	alignaddr	%g7,	%l4,	%l1
	move	%xcc,	%g4,	%o7
	move	%xcc,	%i4,	%g2
	stx	%i0,	[%l7 + 0x28]
	xnorcc	%g3,	%g6,	%g5
	for	%f8,	%f26,	%f10
	movn	%icc,	%o2,	%i1
	movrlz	%i3,	%l6,	%l0
	edge16	%o4,	%l3,	%o3
	movpos	%xcc,	%i5,	%i2
	movrlez	%l2,	0x2CB,	%o6
	fmovrdgez	%o5,	%f28,	%f2
	sth	%i7,	[%l7 + 0x48]
	fmovse	%xcc,	%f11,	%f1
	edge16	%l5,	%i6,	%o0
	and	%g1,	%o1,	%l4
	andcc	%l1,	0x1552,	%g4
	movrgez	%g7,	0x076,	%o7
	fpack16	%f18,	%f9
	movrlz	%g2,	0x3F6,	%i0
	sir	0x160C
	umul	%g3,	0x04D2,	%i4
	fmovdgu	%icc,	%f7,	%f13
	edge32ln	%g6,	%o2,	%i1
	fands	%f13,	%f27,	%f4
	movrgez	%g5,	%i3,	%l0
	xorcc	%o4,	0x0573,	%l3
	orn	%o3,	0x00E3,	%l6
	movg	%xcc,	%i2,	%l2
	ldsh	[%l7 + 0x0C],	%o6
	fmul8ulx16	%f22,	%f12,	%f14
	sir	0x164B
	orcc	%i5,	0x1A1F,	%o5
	mulscc	%l5,	0x16EC,	%i7
	edge8l	%o0,	%g1,	%o1
	fmovsgu	%icc,	%f5,	%f16
	movre	%i6,	%l1,	%l4
	array32	%g4,	%g7,	%o7
	addc	%i0,	0x050D,	%g3
	fmovdpos	%xcc,	%f10,	%f1
	srax	%g2,	0x05,	%g6
	move	%xcc,	%o2,	%i4
	fpmerge	%f19,	%f21,	%f24
	mulscc	%g5,	%i1,	%l0
	and	%i3,	%l3,	%o3
	fcmpne32	%f10,	%f28,	%l6
	movrlez	%i2,	0x0EF,	%l2
	edge32	%o6,	%i5,	%o4
	ldsw	[%l7 + 0x10],	%l5
	udivcc	%o5,	0x064E,	%o0
	edge32n	%i7,	%g1,	%i6
	fcmps	%fcc0,	%f0,	%f19
	movcs	%icc,	%o1,	%l1
	movcc	%xcc,	%l4,	%g7
	stx	%g4,	[%l7 + 0x58]
	addcc	%i0,	%g3,	%o7
	stb	%g2,	[%l7 + 0x0F]
	fmovrslz	%g6,	%f9,	%f16
	sra	%o2,	%i4,	%i1
	fpmerge	%f14,	%f10,	%f0
	fmovdne	%icc,	%f5,	%f11
	add	%l0,	0x0697,	%g5
	lduw	[%l7 + 0x44],	%i3
	xnorcc	%l3,	0x03C3,	%o3
	orcc	%l6,	0x0B41,	%i2
	movvs	%xcc,	%l2,	%i5
	srlx	%o4,	0x04,	%l5
	movl	%icc,	%o5,	%o6
	move	%icc,	%o0,	%i7
	sdivcc	%g1,	0x0F06,	%i6
	movleu	%icc,	%l1,	%o1
	alignaddr	%l4,	%g7,	%g4
	andncc	%g3,	%i0,	%g2
	sdivx	%g6,	0x0A6B,	%o2
	movn	%xcc,	%o7,	%i4
	nop
	set	0x5C, %l4
	ldsh	[%l7 + %l4],	%l0
	and	%g5,	0x0147,	%i1
	add	%l3,	0x0627,	%i3
	andn	%o3,	0x1AE8,	%l6
	ldub	[%l7 + 0x7E],	%l2
	movcs	%icc,	%i5,	%i2
	ldub	[%l7 + 0x20],	%o4
	save %l5, 0x12DA, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o5,	%o0,	%g1
	nop
	set	0x30, %o0
	ldd	[%l7 + %o0],	%f4
	andncc	%i6,	%l1,	%i7
	nop
	set	0x13, %l1
	ldsb	[%l7 + %l1],	%l4
	and	%o1,	%g7,	%g4
	ldub	[%l7 + 0x0D],	%i0
	fornot1s	%f10,	%f31,	%f14
	fands	%f0,	%f28,	%f26
	movcc	%xcc,	%g3,	%g6
	array8	%o2,	%g2,	%o7
	movne	%icc,	%l0,	%g5
	ldsw	[%l7 + 0x34],	%i1
	xorcc	%i4,	%l3,	%o3
	add	%i3,	%l6,	%l2
	sdivcc	%i5,	0x029E,	%i2
	movcc	%icc,	%o4,	%o6
	sir	0x1C13
	edge32ln	%l5,	%o5,	%g1
	stb	%i6,	[%l7 + 0x30]
	fpack32	%f6,	%f16,	%f10
	fcmpne32	%f18,	%f8,	%l1
	umul	%i7,	%o0,	%l4
	movg	%xcc,	%g7,	%g4
	fmuld8sux16	%f16,	%f6,	%f18
	fmovsvc	%icc,	%f27,	%f27
	movgu	%icc,	%o1,	%i0
	movpos	%icc,	%g3,	%o2
	lduw	[%l7 + 0x08],	%g6
	movcc	%icc,	%g2,	%l0
	fands	%f4,	%f1,	%f27
	alignaddr	%o7,	%g5,	%i1
	sth	%l3,	[%l7 + 0x7E]
	movg	%icc,	%o3,	%i4
	lduh	[%l7 + 0x48],	%l6
	addcc	%i3,	0x1230,	%i5
	sdivcc	%i2,	0x0033,	%l2
	xnor	%o6,	0x0889,	%l5
	save %o4, %g1, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orncc	%i6,	0x0A6E,	%i7
	ldsb	[%l7 + 0x44],	%l1
	fcmpeq16	%f30,	%f0,	%o0
	edge16l	%g7,	%l4,	%g4
	movcc	%icc,	%o1,	%i0
	sdiv	%g3,	0x1940,	%o2
	fmovdcs	%icc,	%f25,	%f7
	fabsd	%f24,	%f6
	edge8l	%g6,	%g2,	%l0
	fmuld8sux16	%f16,	%f6,	%f24
	sir	0x10A3
	ldx	[%l7 + 0x78],	%g5
	movcc	%icc,	%o7,	%i1
	fmovdvs	%xcc,	%f5,	%f13
	movvc	%xcc,	%l3,	%o3
	orcc	%i4,	0x116C,	%i3
	st	%f0,	[%l7 + 0x2C]
	ld	[%l7 + 0x5C],	%f6
	fmovsne	%xcc,	%f16,	%f1
	array32	%l6,	%i2,	%i5
	fxnor	%f18,	%f16,	%f6
	lduh	[%l7 + 0x0E],	%l2
	mulx	%o6,	0x0334,	%l5
	ldsb	[%l7 + 0x6D],	%o4
	movvc	%icc,	%o5,	%i6
	fmul8ulx16	%f28,	%f2,	%f30
	sra	%i7,	%g1,	%o0
	andncc	%l1,	%l4,	%g4
	ldsh	[%l7 + 0x52],	%g7
	addccc	%i0,	0x080B,	%o1
	restore %g3, %o2, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%g2,	%l0,	%o7
	movleu	%xcc,	%i1,	%l3
	st	%f18,	[%l7 + 0x30]
	edge32n	%o3,	%i4,	%g5
	fpackfix	%f14,	%f9
	subc	%i3,	%l6,	%i2
	ldsw	[%l7 + 0x28],	%l2
	udiv	%o6,	0x0690,	%l5
	movvs	%xcc,	%i5,	%o5
	sll	%i6,	0x12,	%i7
	fornot2s	%f19,	%f4,	%f16
	movrgez	%g1,	%o4,	%l1
	ldub	[%l7 + 0x65],	%o0
	edge16ln	%g4,	%l4,	%i0
	sdivx	%o1,	0x1EEE,	%g7
	movrgz	%o2,	0x174,	%g3
	movn	%xcc,	%g2,	%g6
	save %l0, 0x0DD4, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8ln	%i1,	%l3,	%i4
	array8	%g5,	%i3,	%l6
	movge	%xcc,	%i2,	%l2
	st	%f10,	[%l7 + 0x54]
	move	%icc,	%o3,	%l5
	fmul8x16al	%f27,	%f8,	%f22
	fmovd	%f24,	%f0
	fabsd	%f10,	%f8
	edge32ln	%i5,	%o6,	%o5
	movne	%icc,	%i7,	%i6
	fnors	%f31,	%f19,	%f12
	movl	%icc,	%o4,	%l1
	nop
	set	0x10, %g3
	std	%f12,	[%l7 + %g3]
	xnor	%g1,	0x08F3,	%o0
	fmovrdgez	%g4,	%f8,	%f30
	edge16ln	%i0,	%l4,	%o1
	sra	%o2,	%g7,	%g2
	alignaddr	%g6,	%l0,	%g3
	and	%o7,	%l3,	%i1
	alignaddrl	%i4,	%g5,	%i3
	ldd	[%l7 + 0x08],	%i6
	subccc	%i2,	%o3,	%l2
	array8	%l5,	%o6,	%o5
	movcs	%icc,	%i7,	%i6
	subcc	%o4,	0x01B8,	%i5
	udivx	%l1,	0x003F,	%g1
	fmovdl	%xcc,	%f10,	%f19
	xnorcc	%o0,	%g4,	%l4
	sdivx	%o1,	0x1AA7,	%i0
	pdist	%f10,	%f26,	%f2
	ldsh	[%l7 + 0x4A],	%o2
	movneg	%icc,	%g2,	%g7
	st	%f17,	[%l7 + 0x68]
	alignaddrl	%g6,	%l0,	%g3
	umulcc	%l3,	%o7,	%i1
	mulscc	%g5,	%i3,	%l6
	or	%i4,	0x05FE,	%o3
	stb	%l2,	[%l7 + 0x5D]
	alignaddr	%i2,	%o6,	%o5
	sir	0x1538
	addccc	%l5,	%i6,	%o4
	fornot2	%f6,	%f22,	%f4
	movrlez	%i7,	%l1,	%i5
	movrne	%o0,	%g4,	%g1
	fmovsle	%xcc,	%f31,	%f31
	stb	%l4,	[%l7 + 0x31]
	smul	%i0,	0x0365,	%o1
	movvs	%xcc,	%o2,	%g7
	sra	%g6,	0x11,	%l0
	movneg	%xcc,	%g2,	%l3
	umulcc	%o7,	%g3,	%g5
	orn	%i3,	%l6,	%i1
	array32	%o3,	%l2,	%i2
	fpadd16	%f24,	%f18,	%f28
	fornot1	%f18,	%f16,	%f16
	movrgez	%i4,	%o6,	%o5
	fmovrsne	%l5,	%f0,	%f14
	edge8n	%i6,	%i7,	%l1
	or	%i5,	0x1301,	%o4
	udivcc	%g4,	0x00FE,	%g1
	smulcc	%o0,	0x0847,	%l4
	smul	%i0,	%o2,	%g7
	udivcc	%g6,	0x159B,	%l0
	edge16	%o1,	%l3,	%o7
	sethi	0x0A02,	%g3
	fpsub32	%f0,	%f2,	%f22
	ldd	[%l7 + 0x70],	%f22
	ld	[%l7 + 0x2C],	%f8
	add	%g2,	%i3,	%g5
	lduh	[%l7 + 0x1C],	%l6
	fpadd16	%f10,	%f14,	%f30
	xnor	%o3,	%i1,	%i2
	orn	%l2,	0x0570,	%o6
	xnorcc	%o5,	%i4,	%i6
	sir	0x1CCA
	nop
	set	0x18, %i5
	stw	%i7,	[%l7 + %i5]
	fmovsne	%icc,	%f30,	%f15
	andn	%l1,	0x17FF,	%i5
	movcs	%xcc,	%l5,	%o4
	movle	%xcc,	%g1,	%o0
	array8	%l4,	%g4,	%o2
	umulcc	%i0,	0x0932,	%g6
	fmovrslz	%g7,	%f10,	%f15
	movge	%xcc,	%o1,	%l3
	andcc	%o7,	0x1423,	%l0
	ldsw	[%l7 + 0x10],	%g2
	move	%xcc,	%g3,	%g5
	edge32ln	%i3,	%o3,	%l6
	stw	%i2,	[%l7 + 0x34]
	fmovsleu	%xcc,	%f13,	%f18
	movvs	%xcc,	%l2,	%i1
	movneg	%icc,	%o6,	%i4
	ldub	[%l7 + 0x75],	%o5
	sethi	0x0DA2,	%i7
	mulx	%l1,	%i6,	%l5
	movle	%icc,	%o4,	%i5
	ld	[%l7 + 0x24],	%f0
	mulscc	%o0,	0x1658,	%l4
	ldsw	[%l7 + 0x3C],	%g1
	add	%g4,	%o2,	%i0
	sub	%g7,	%g6,	%l3
	setx loop_72, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_72: 	edge16l	%g2,	%g3,	%l0
	nop
	set	0x0C, %i3
	lduw	[%l7 + %i3],	%g5
	movgu	%xcc,	%i3,	%o3
	fmovspos	%icc,	%f15,	%f12
	xnorcc	%i2,	0x0DB9,	%l6
	move	%xcc,	%l2,	%i1
	movcc	%xcc,	%o6,	%o5
	fone	%f4
	fpmerge	%f26,	%f26,	%f0
	move	%icc,	%i4,	%i7
	edge8ln	%i6,	%l5,	%o4
	subcc	%i5,	0x147E,	%o0
	movvs	%icc,	%l4,	%l1
	sll	%g4,	0x10,	%g1
	fmovdle	%xcc,	%f24,	%f11
	ldub	[%l7 + 0x23],	%i0
	fsrc1	%f16,	%f4
	srax	%o2,	%g7,	%g6
	edge16	%l3,	%o7,	%o1
	srax	%g2,	%l0,	%g5
	array32	%g3,	%i3,	%i2
	fmovdvc	%xcc,	%f25,	%f18
	fnot1	%f16,	%f26
	edge8l	%o3,	%l6,	%l2
	movcs	%xcc,	%i1,	%o6
	nop
	set	0x26, %g6
	sth	%o5,	[%l7 + %g6]
	fmovscc	%icc,	%f27,	%f11
	fcmpeq32	%f10,	%f6,	%i4
	fmovrdgez	%i6,	%f26,	%f20
	movl	%icc,	%l5,	%o4
	movneg	%icc,	%i7,	%i5
	edge8	%l4,	%o0,	%l1
	edge16ln	%g1,	%i0,	%g4
	addc	%g7,	%g6,	%o2
	edge8	%l3,	%o7,	%o1
	fsrc2s	%f18,	%f17
	sir	0x1189
	movne	%xcc,	%l0,	%g2
	subcc	%g3,	%g5,	%i2
	edge16	%o3,	%l6,	%l2
	movvs	%xcc,	%i3,	%o6
	edge32l	%i1,	%o5,	%i6
	edge16ln	%l5,	%o4,	%i4
	smulcc	%i7,	0x1B5D,	%l4
	srlx	%o0,	%i5,	%g1
	edge16n	%l1,	%g4,	%g7
	movre	%i0,	%o2,	%l3
	xorcc	%o7,	%o1,	%l0
	stw	%g6,	[%l7 + 0x78]
	st	%f18,	[%l7 + 0x14]
	movcc	%icc,	%g3,	%g2
	array32	%g5,	%i2,	%o3
	xnor	%l6,	%l2,	%i3
	edge32l	%o6,	%i1,	%o5
	movrgz	%i6,	%o4,	%l5
	sra	%i7,	%l4,	%i4
	movrgez	%i5,	0x2CD,	%g1
	orn	%l1,	0x002B,	%o0
	movg	%xcc,	%g7,	%i0
	orcc	%g4,	0x052C,	%o2
	movre	%o7,	0x2AA,	%l3
	fmovsge	%xcc,	%f25,	%f25
	movpos	%xcc,	%l0,	%o1
	fpadd16s	%f2,	%f19,	%f9
	subccc	%g6,	0x104A,	%g2
	movcs	%xcc,	%g5,	%i2
	alignaddr	%o3,	%g3,	%l2
	edge8n	%l6,	%o6,	%i3
	movl	%icc,	%o5,	%i6
	movg	%icc,	%i1,	%o4
	movgu	%xcc,	%l5,	%l4
	stb	%i4,	[%l7 + 0x5A]
	umulcc	%i7,	%g1,	%i5
	ldd	[%l7 + 0x60],	%l0
	movpos	%xcc,	%o0,	%g7
	movpos	%icc,	%i0,	%o2
	fmovrdgz	%o7,	%f2,	%f22
	srax	%g4,	%l0,	%l3
	fcmple32	%f12,	%f24,	%o1
	udivx	%g2,	0x1740,	%g5
	edge32	%i2,	%o3,	%g3
	fmovde	%xcc,	%f3,	%f20
	addccc	%g6,	0x1110,	%l2
	fmovrsgz	%l6,	%f14,	%f19
	fsrc2s	%f28,	%f16
	sra	%o6,	%i3,	%o5
	fpmerge	%f3,	%f1,	%f10
	andncc	%i6,	%o4,	%i1
	edge8l	%l4,	%i4,	%i7
	edge16l	%l5,	%i5,	%l1
	srl	%o0,	0x12,	%g1
	movg	%icc,	%i0,	%g7
	orcc	%o2,	0x0149,	%o7
	sdiv	%g4,	0x1998,	%l3
	edge8n	%l0,	%o1,	%g2
	fcmpeq16	%f30,	%f28,	%g5
	fmovdn	%xcc,	%f28,	%f16
	lduh	[%l7 + 0x68],	%i2
	xnorcc	%g3,	%o3,	%l2
	movvc	%icc,	%g6,	%o6
	alignaddrl	%i3,	%o5,	%l6
	smul	%i6,	%i1,	%l4
	fmuld8sux16	%f11,	%f26,	%f8
	st	%f7,	[%l7 + 0x74]
	lduh	[%l7 + 0x08],	%o4
	ldub	[%l7 + 0x37],	%i4
	subccc	%l5,	%i5,	%l1
	fxor	%f4,	%f30,	%f16
	st	%f1,	[%l7 + 0x68]
	lduh	[%l7 + 0x74],	%o0
	array32	%i7,	%g1,	%g7
	xnor	%o2,	%o7,	%i0
	fcmple32	%f28,	%f2,	%g4
	ldsw	[%l7 + 0x50],	%l3
	fpsub32	%f0,	%f24,	%f30
	movne	%icc,	%l0,	%o1
	edge32ln	%g2,	%g5,	%i2
	andncc	%o3,	%g3,	%l2
	fnot2s	%f2,	%f16
	orncc	%o6,	%i3,	%o5
	nop
	set	0x60, %i4
	lduw	[%l7 + %i4],	%l6
	andn	%g6,	0x090E,	%i6
	array8	%l4,	%o4,	%i4
	movrlez	%i1,	%l5,	%l1
	movvc	%icc,	%i5,	%i7
	stb	%o0,	[%l7 + 0x14]
	sub	%g7,	%o2,	%g1
	andcc	%i0,	0x0689,	%g4
	stx	%l3,	[%l7 + 0x30]
	fmovrsgez	%l0,	%f24,	%f25
	fnot2s	%f21,	%f17
	movrne	%o1,	%g2,	%g5
	std	%f6,	[%l7 + 0x28]
	fmul8x16	%f29,	%f30,	%f20
	andncc	%i2,	%o7,	%o3
	orn	%l2,	%g3,	%i3
	edge32n	%o6,	%l6,	%o5
	fmul8x16	%f25,	%f26,	%f20
	edge8ln	%g6,	%i6,	%l4
	ldd	[%l7 + 0x18],	%f10
	fexpand	%f14,	%f26
	stb	%o4,	[%l7 + 0x6A]
	udiv	%i4,	0x016A,	%i1
	array8	%l5,	%i5,	%i7
	fnegd	%f8,	%f2
	sethi	0x00CE,	%l1
	movrgez	%o0,	0x31A,	%g7
	movpos	%icc,	%o2,	%g1
	andncc	%g4,	%i0,	%l3
	sll	%o1,	%l0,	%g2
	movn	%icc,	%i2,	%g5
	edge8	%o3,	%l2,	%o7
	fxnor	%f30,	%f0,	%f14
	alignaddr	%i3,	%g3,	%l6
	movrlz	%o5,	0x3D0,	%g6
	move	%icc,	%i6,	%o6
	lduh	[%l7 + 0x5A],	%l4
	smul	%i4,	0x13EF,	%o4
	movrgez	%l5,	%i1,	%i5
	ldd	[%l7 + 0x50],	%l0
	ldd	[%l7 + 0x40],	%i6
	stw	%o0,	[%l7 + 0x30]
	ldsh	[%l7 + 0x4C],	%g7
	movvs	%icc,	%o2,	%g1
	addccc	%g4,	0x071A,	%i0
	andcc	%o1,	0x1457,	%l0
	sra	%l3,	%g2,	%g5
	movrgez	%i2,	%l2,	%o3
	movl	%xcc,	%o7,	%g3
	fcmpgt32	%f0,	%f8,	%i3
	sdivx	%l6,	0x08FA,	%g6
	fmovrse	%i6,	%f31,	%f15
	fcmple32	%f14,	%f12,	%o5
	andcc	%l4,	%i4,	%o6
	movl	%xcc,	%o4,	%i1
	fmovdg	%icc,	%f25,	%f9
	andncc	%l5,	%l1,	%i5
	or	%o0,	%g7,	%o2
	ld	[%l7 + 0x60],	%f18
	movn	%icc,	%g1,	%g4
	movrgz	%i7,	0x35A,	%i0
	andcc	%o1,	%l3,	%g2
	movne	%icc,	%l0,	%i2
	udivcc	%g5,	0x0DCE,	%o3
	movg	%xcc,	%o7,	%l2
	sdivx	%g3,	0x1E72,	%l6
	edge16	%g6,	%i3,	%o5
	fnot2s	%f5,	%f7
	fabss	%f23,	%f6
	edge32n	%l4,	%i6,	%o6
	fmovdl	%xcc,	%f21,	%f22
	popc	0x1E1A,	%i4
	edge32n	%o4,	%i1,	%l1
	subcc	%i5,	0x11C6,	%l5
	andn	%g7,	0x1A03,	%o2
	fmovsneg	%icc,	%f11,	%f12
	xnorcc	%g1,	0x0B15,	%o0
	edge16l	%g4,	%i0,	%o1
	fmovsn	%icc,	%f15,	%f12
	mova	%icc,	%i7,	%g2
	sdiv	%l3,	0x03A8,	%i2
	subc	%l0,	%o3,	%o7
	fcmped	%fcc3,	%f2,	%f2
	andncc	%g5,	%g3,	%l6
	lduh	[%l7 + 0x50],	%g6
	fmovscs	%icc,	%f21,	%f26
	edge16n	%l2,	%i3,	%o5
	fmul8x16	%f29,	%f10,	%f20
	fands	%f3,	%f26,	%f14
	sdivx	%l4,	0x0B5E,	%o6
	udiv	%i4,	0x1D68,	%i6
	fxor	%f6,	%f26,	%f0
	fornot1s	%f5,	%f14,	%f17
	mova	%icc,	%o4,	%l1
	st	%f20,	[%l7 + 0x3C]
	mulx	%i1,	%l5,	%i5
	fnot1s	%f25,	%f22
	fmovdcs	%xcc,	%f22,	%f6
	fmovdgu	%xcc,	%f21,	%f29
	stb	%g7,	[%l7 + 0x36]
	fmovda	%xcc,	%f4,	%f19
	subccc	%g1,	0x1C5B,	%o2
	movn	%icc,	%g4,	%o0
	edge8n	%i0,	%o1,	%i7
	smulcc	%g2,	0x015F,	%i2
	xorcc	%l3,	%l0,	%o3
	mulscc	%o7,	%g3,	%g5
	subccc	%l6,	0x1792,	%g6
	xorcc	%l2,	%o5,	%l4
	alignaddrl	%i3,	%i4,	%o6
	andcc	%i6,	%l1,	%o4
	sethi	0x100E,	%l5
	ldsb	[%l7 + 0x5D],	%i5
	movcs	%xcc,	%i1,	%g7
	fnands	%f11,	%f22,	%f22
	fpadd32	%f6,	%f22,	%f26
	edge32ln	%o2,	%g1,	%g4
	movcs	%icc,	%i0,	%o1
	fornot1s	%f30,	%f14,	%f11
	faligndata	%f0,	%f0,	%f28
	fcmped	%fcc0,	%f2,	%f16
	fors	%f0,	%f28,	%f26
	edge32n	%o0,	%g2,	%i2
	umulcc	%l3,	0x1172,	%l0
	fcmpgt16	%f2,	%f6,	%o3
	fsrc1s	%f10,	%f12
	array8	%o7,	%i7,	%g3
	subc	%g5,	%g6,	%l6
	movneg	%icc,	%l2,	%o5
	movl	%icc,	%i3,	%i4
	array32	%l4,	%i6,	%o6
	stx	%l1,	[%l7 + 0x38]
	orn	%o4,	0x1A4B,	%i5
	fmovdvs	%icc,	%f12,	%f15
	lduw	[%l7 + 0x10],	%l5
	movn	%xcc,	%i1,	%o2
	sll	%g1,	0x02,	%g4
	xnorcc	%i0,	0x0F6A,	%o1
	edge8n	%o0,	%g2,	%i2
	srax	%g7,	0x0E,	%l3
	edge16n	%l0,	%o3,	%i7
	popc	0x1ADD,	%g3
	st	%f3,	[%l7 + 0x4C]
	edge8n	%o7,	%g6,	%g5
	movrgez	%l6,	%o5,	%l2
	movneg	%icc,	%i4,	%i3
	popc	0x120D,	%l4
	orcc	%i6,	0x1974,	%l1
	andn	%o4,	0x1492,	%o6
	subc	%i5,	%l5,	%i1
	movge	%icc,	%o2,	%g4
	fpsub32	%f8,	%f26,	%f6
	movle	%icc,	%g1,	%o1
	edge8	%o0,	%i0,	%i2
	fornot1	%f14,	%f12,	%f2
	sdiv	%g7,	0x1C29,	%g2
	movrlz	%l3,	%o3,	%i7
	lduw	[%l7 + 0x64],	%g3
	fmovsvs	%icc,	%f15,	%f16
	mulscc	%o7,	%l0,	%g6
	xnorcc	%g5,	%l6,	%o5
	movcc	%xcc,	%l2,	%i4
	fmovdge	%xcc,	%f21,	%f25
	st	%f10,	[%l7 + 0x18]
	movneg	%icc,	%i3,	%l4
	fcmpes	%fcc0,	%f24,	%f6
	edge32l	%i6,	%o4,	%l1
	stw	%o6,	[%l7 + 0x28]
	sdiv	%l5,	0x0E95,	%i5
	mova	%xcc,	%i1,	%g4
	addc	%g1,	0x0839,	%o1
	array32	%o2,	%o0,	%i0
	sll	%i2,	%g2,	%l3
	orncc	%g7,	0x0EF8,	%o3
	movre	%i7,	%o7,	%l0
	edge8n	%g6,	%g5,	%g3
	fxnor	%f2,	%f12,	%f26
	smul	%l6,	%o5,	%l2
	movne	%icc,	%i4,	%l4
	save %i3, 0x0A7F, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	addc	%l1,	0x0C46,	%o4
	subc	%l5,	%i5,	%o6
	fmovdgu	%xcc,	%f26,	%f23
	sir	0x1B14
	movre	%g4,	0x2BE,	%i1
	movn	%icc,	%g1,	%o1
	umulcc	%o0,	%i0,	%o2
	ld	[%l7 + 0x68],	%f7
	movge	%xcc,	%i2,	%g2
	ldx	[%l7 + 0x08],	%g7
	movcs	%xcc,	%l3,	%i7
	edge32l	%o7,	%l0,	%g6
	fornot2	%f20,	%f8,	%f20
	movneg	%xcc,	%o3,	%g3
	movleu	%icc,	%g5,	%l6
	edge32ln	%o5,	%i4,	%l2
	movl	%icc,	%i3,	%i6
	std	%f2,	[%l7 + 0x50]
	xnor	%l1,	0x0764,	%l4
	stw	%o4,	[%l7 + 0x1C]
	mulx	%i5,	0x0F2E,	%l5
	nop
	set	0x6A, %l6
	ldsb	[%l7 + %l6],	%g4
	or	%i1,	0x03CC,	%g1
	st	%f13,	[%l7 + 0x78]
	udivcc	%o1,	0x0B1D,	%o0
	sdivcc	%o6,	0x00CE,	%o2
	smul	%i2,	%g2,	%i0
	movrlez	%g7,	%i7,	%o7
	fcmpes	%fcc1,	%f2,	%f26
	edge32	%l0,	%g6,	%o3
	edge16n	%g3,	%g5,	%l3
	fmovdvs	%icc,	%f9,	%f5
	popc	0x09F1,	%l6
	fmuld8sux16	%f20,	%f30,	%f26
	mova	%xcc,	%o5,	%i4
	fmovsl	%xcc,	%f30,	%f18
	movvc	%icc,	%i3,	%l2
	movrgez	%l1,	%l4,	%i6
	fornot2	%f6,	%f12,	%f28
	movrgz	%o4,	%i5,	%g4
	sir	0x00EC
	fmovrslz	%l5,	%f17,	%f10
	st	%f11,	[%l7 + 0x18]
	sub	%g1,	0x0140,	%i1
	fmovrslez	%o0,	%f1,	%f11
	array16	%o6,	%o1,	%o2
	or	%g2,	%i2,	%g7
	subcc	%i7,	0x18D8,	%o7
	mova	%icc,	%l0,	%g6
	lduw	[%l7 + 0x5C],	%o3
	ldsb	[%l7 + 0x0F],	%g3
	movn	%icc,	%i0,	%g5
	ld	[%l7 + 0x34],	%f21
	smul	%l3,	%o5,	%i4
	movpos	%icc,	%l6,	%i3
	array32	%l2,	%l1,	%i6
	fmul8x16al	%f9,	%f9,	%f0
	movrgez	%o4,	0x0B6,	%l4
	andncc	%g4,	%i5,	%g1
	orncc	%l5,	%i1,	%o6
	array32	%o0,	%o2,	%o1
	sdiv	%i2,	0x1F79,	%g7
	movle	%icc,	%g2,	%i7
	sra	%l0,	%o7,	%g6
	edge8l	%g3,	%i0,	%o3
	udivcc	%g5,	0x1EC7,	%l3
	movl	%icc,	%o5,	%l6
	st	%f31,	[%l7 + 0x44]
	fands	%f19,	%f5,	%f15
	movneg	%xcc,	%i4,	%l2
	movleu	%icc,	%i3,	%i6
	fpackfix	%f12,	%f21
	movne	%xcc,	%l1,	%o4
	subc	%l4,	%g4,	%i5
	sir	0x0CE3
	fmovrdgez	%l5,	%f22,	%f24
	movpos	%icc,	%i1,	%g1
	addcc	%o0,	%o2,	%o6
	srax	%o1,	%i2,	%g7
	subcc	%g2,	0x1E03,	%i7
	ldd	[%l7 + 0x18],	%f26
	fmovda	%icc,	%f0,	%f28
	stw	%o7,	[%l7 + 0x64]
	movn	%icc,	%l0,	%g3
	andcc	%g6,	0x07C9,	%i0
	umul	%o3,	0x07A1,	%l3
	addccc	%g5,	%o5,	%l6
	movvs	%icc,	%l2,	%i3
	fmovdge	%xcc,	%f20,	%f8
	ldd	[%l7 + 0x50],	%f20
	fcmped	%fcc0,	%f8,	%f0
	ldsh	[%l7 + 0x2E],	%i4
	move	%xcc,	%l1,	%i6
	movrgz	%o4,	0x352,	%l4
	movrgz	%i5,	%g4,	%l5
	movvs	%xcc,	%g1,	%o0
	mulscc	%i1,	%o6,	%o2
	fmovrdne	%o1,	%f12,	%f26
	udivcc	%g7,	0x19A4,	%g2
	movrgez	%i2,	0x045,	%i7
	movrgez	%o7,	0x198,	%l0
	xnorcc	%g3,	0x0F2A,	%i0
	udivcc	%o3,	0x0D09,	%l3
	edge8l	%g6,	%g5,	%l6
	addcc	%o5,	%l2,	%i4
	fsrc2	%f18,	%f10
	fmovde	%xcc,	%f10,	%f13
	fmovsleu	%icc,	%f5,	%f16
	or	%l1,	%i6,	%i3
	ldd	[%l7 + 0x20],	%f28
	array32	%l4,	%i5,	%o4
	edge16	%l5,	%g4,	%o0
	fcmpne16	%f24,	%f2,	%g1
	fandnot1s	%f0,	%f9,	%f29
	array16	%i1,	%o2,	%o1
	sethi	0x14EC,	%g7
	andcc	%g2,	%o6,	%i7
	sdivx	%i2,	0x1BE8,	%l0
	sll	%o7,	%i0,	%o3
	subc	%g3,	%g6,	%g5
	ldd	[%l7 + 0x18],	%l2
	fcmpeq32	%f2,	%f14,	%l6
	fexpand	%f1,	%f6
	fsrc2s	%f0,	%f21
	nop
	set	0x25, %o7
	ldsb	[%l7 + %o7],	%o5
	fmovsa	%xcc,	%f17,	%f27
	or	%l2,	%l1,	%i4
	edge8l	%i6,	%l4,	%i3
	fcmped	%fcc0,	%f10,	%f22
	add	%o4,	%l5,	%i5
	srlx	%o0,	%g1,	%i1
	movcc	%xcc,	%o2,	%g4
	srl	%o1,	%g2,	%g7
	fmovd	%f8,	%f2
	umulcc	%o6,	%i7,	%l0
	fpsub16	%f12,	%f22,	%f30
	alignaddrl	%i2,	%o7,	%o3
	fmovdg	%icc,	%f29,	%f28
	ldd	[%l7 + 0x58],	%f12
	srl	%i0,	0x07,	%g3
	fornot1	%f8,	%f8,	%f24
	alignaddrl	%g5,	%l3,	%l6
	add	%g6,	0x01E2,	%l2
	lduh	[%l7 + 0x4E],	%o5
	fmovrsgez	%i4,	%f2,	%f24
	sth	%i6,	[%l7 + 0x2E]
	srax	%l4,	%l1,	%i3
	array16	%l5,	%o4,	%o0
	fzero	%f12
	fnand	%f8,	%f28,	%f12
	stb	%i5,	[%l7 + 0x6A]
	orncc	%g1,	0x00A0,	%o2
	edge8	%i1,	%g4,	%g2
	fmul8ulx16	%f8,	%f24,	%f16
	movrlez	%o1,	%o6,	%i7
	edge32	%g7,	%i2,	%l0
	movre	%o3,	0x1F4,	%o7
	sdivcc	%i0,	0x0223,	%g3
	umul	%g5,	0x0D15,	%l6
	sir	0x0A2A
	faligndata	%f6,	%f14,	%f6
	smul	%l3,	0x13B8,	%l2
	srlx	%o5,	0x04,	%i4
	orn	%g6,	%i6,	%l1
	movg	%icc,	%l4,	%i3
	edge16l	%l5,	%o0,	%o4
	movrgez	%i5,	%g1,	%i1
	movneg	%xcc,	%g4,	%g2
	sll	%o1,	0x1C,	%o2
	sdivx	%o6,	0x1AA4,	%g7
	fpmerge	%f17,	%f0,	%f28
	xnor	%i2,	0x072B,	%l0
	edge8ln	%i7,	%o3,	%o7
	movg	%xcc,	%g3,	%i0
	srax	%l6,	%l3,	%g5
	lduw	[%l7 + 0x18],	%o5
	movvs	%icc,	%i4,	%g6
	fcmple32	%f0,	%f20,	%i6
	umul	%l1,	%l2,	%l4
	fmovsvc	%xcc,	%f0,	%f11
	umul	%i3,	%l5,	%o4
	edge32ln	%i5,	%g1,	%o0
	edge32	%i1,	%g4,	%g2
	edge16n	%o1,	%o6,	%o2
	stw	%i2,	[%l7 + 0x34]
	popc	%g7,	%i7
	srlx	%l0,	%o3,	%g3
	sth	%o7,	[%l7 + 0x0C]
	movl	%icc,	%i0,	%l6
	lduw	[%l7 + 0x44],	%l3
	udiv	%g5,	0x1A65,	%o5
	sdivx	%g6,	0x17EA,	%i4
	mulx	%i6,	%l1,	%l2
	edge16	%l4,	%i3,	%o4
	movvc	%xcc,	%l5,	%g1
	fmovrslz	%i5,	%f1,	%f8
	fcmped	%fcc0,	%f22,	%f18
	alignaddrl	%o0,	%i1,	%g2
	orcc	%o1,	%o6,	%g4
	orn	%o2,	0x1D63,	%i2
	movgu	%icc,	%i7,	%l0
	ldd	[%l7 + 0x28],	%f22
	sll	%g7,	0x08,	%o3
	subccc	%o7,	%i0,	%g3
	bshuffle	%f20,	%f12,	%f28
	add	%l3,	0x0E64,	%g5
	fabsd	%f2,	%f16
	popc	%o5,	%g6
	or	%l6,	0x12DE,	%i6
	fmul8x16al	%f3,	%f20,	%f12
	array8	%l1,	%l2,	%i4
	ldsb	[%l7 + 0x4C],	%i3
	movrne	%l4,	0x0B3,	%o4
	edge32n	%g1,	%i5,	%o0
	fxor	%f6,	%f18,	%f10
	addcc	%i1,	%g2,	%o1
	andn	%l5,	%g4,	%o6
	movrlez	%i2,	0x03B,	%o2
	fmovrsne	%i7,	%f18,	%f31
	stx	%g7,	[%l7 + 0x68]
	array32	%o3,	%o7,	%l0
	ld	[%l7 + 0x7C],	%f5
	xor	%i0,	%g3,	%l3
	fcmps	%fcc3,	%f2,	%f21
	orncc	%o5,	0x0725,	%g6
	add	%g5,	0x0F5B,	%i6
	fmovsneg	%icc,	%f1,	%f18
	srlx	%l6,	%l2,	%l1
	edge16n	%i3,	%l4,	%o4
	movrne	%i4,	%g1,	%i5
	fzero	%f30
	sub	%o0,	%i1,	%g2
	ldd	[%l7 + 0x70],	%l4
	ldd	[%l7 + 0x68],	%f22
	sir	0x17A5
	array32	%g4,	%o1,	%i2
	sethi	0x1559,	%o2
	add	%o6,	%i7,	%g7
	sdivcc	%o3,	0x0CB1,	%o7
	nop
	set	0x08, %i7
	stb	%l0,	[%l7 + %i7]
	movge	%icc,	%g3,	%i0
	movle	%icc,	%o5,	%g6
	xorcc	%g5,	%l3,	%i6
	edge8ln	%l2,	%l6,	%i3
	movrne	%l4,	%o4,	%i4
	movge	%xcc,	%l1,	%g1
	sdivcc	%i5,	0x0B14,	%i1
	ld	[%l7 + 0x5C],	%f10
	fornot2s	%f12,	%f0,	%f9
	stx	%o0,	[%l7 + 0x38]
	orcc	%g2,	0x15F7,	%g4
	movcs	%xcc,	%l5,	%o1
	sra	%i2,	0x1D,	%o2
	movne	%xcc,	%o6,	%i7
	mulscc	%o3,	0x03AF,	%o7
	restore %g7, %l0, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	smul	%g3,	0x18FA,	%o5
	or	%g5,	0x0028,	%l3
	movge	%icc,	%g6,	%l2
	movgu	%icc,	%i6,	%i3
	or	%l4,	%o4,	%l6
	fmovdvs	%icc,	%f29,	%f23
	sdivx	%i4,	0x119C,	%g1
	addc	%l1,	0x06DD,	%i5
	udivcc	%o0,	0x1E06,	%g2
	xorcc	%i1,	%l5,	%o1
	nop
	set	0x08, %o5
	stw	%i2,	[%l7 + %o5]
	sllx	%g4,	0x06,	%o2
	fmul8x16	%f18,	%f28,	%f22
	ldd	[%l7 + 0x28],	%i6
	fsrc1	%f28,	%f14
	edge8ln	%o3,	%o7,	%o6
	edge8n	%l0,	%g7,	%i0
	sdivcc	%g3,	0x074B,	%o5
	movpos	%icc,	%l3,	%g5
	movrlz	%g6,	%i6,	%i3
	lduw	[%l7 + 0x5C],	%l4
	fnand	%f22,	%f12,	%f6
	sth	%o4,	[%l7 + 0x7A]
	udivcc	%l6,	0x1B13,	%l2
	fornot2	%f4,	%f6,	%f30
	mulscc	%g1,	0x1A10,	%l1
	ldd	[%l7 + 0x18],	%i4
	mulscc	%o0,	%g2,	%i1
	movvc	%icc,	%i4,	%o1
	alignaddr	%l5,	%g4,	%o2
	andcc	%i2,	0x1219,	%o3
	array16	%i7,	%o6,	%o7
	andn	%g7,	0x1895,	%l0
	fxnors	%f6,	%f27,	%f20
	movrlz	%g3,	%o5,	%i0
	xnorcc	%g5,	0x172E,	%g6
	fpadd16	%f6,	%f12,	%f18
	smulcc	%i6,	%i3,	%l3
	std	%f18,	[%l7 + 0x50]
	movrgz	%o4,	%l4,	%l6
	sdiv	%l2,	0x1973,	%l1
	edge16	%i5,	%g1,	%g2
	sir	0x0E38
	fmovdleu	%xcc,	%f15,	%f14
	subccc	%o0,	%i4,	%o1
	movl	%icc,	%i1,	%g4
	udivcc	%o2,	0x073D,	%i2
	fmovdgu	%xcc,	%f11,	%f28
	movl	%xcc,	%l5,	%i7
	addcc	%o6,	0x0F9C,	%o3
	edge32ln	%g7,	%o7,	%g3
	fandnot2s	%f2,	%f25,	%f13
	movg	%icc,	%o5,	%l0
	movge	%icc,	%i0,	%g6
	movcc	%xcc,	%g5,	%i3
	fandnot2s	%f6,	%f28,	%f19
	or	%i6,	%o4,	%l3
	array16	%l6,	%l4,	%l2
	for	%f16,	%f28,	%f20
	subc	%i5,	0x020B,	%l1
	fabsd	%f10,	%f20
	andn	%g1,	%o0,	%i4
	fpsub16	%f4,	%f0,	%f20
	movn	%xcc,	%o1,	%g2
	stb	%i1,	[%l7 + 0x1A]
	save %o2, 0x1A23, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	umul	%i2,	0x0EFD,	%i7
	fcmpgt32	%f14,	%f4,	%l5
	subcc	%o3,	%g7,	%o7
	fmovdleu	%icc,	%f4,	%f12
	movvc	%xcc,	%g3,	%o6
	sdivcc	%o5,	0x190A,	%i0
	sir	0x12A0
	fmovsle	%icc,	%f20,	%f27
	ldd	[%l7 + 0x40],	%g6
	movrgez	%l0,	0x2CC,	%g5
	fmovrdlez	%i6,	%f2,	%f10
	fmovsle	%xcc,	%f17,	%f0
	edge8l	%o4,	%l3,	%i3
	movle	%icc,	%l6,	%l2
	sra	%i5,	%l4,	%l1
	movg	%icc,	%g1,	%i4
	fpsub16	%f20,	%f8,	%f22
	subccc	%o0,	%g2,	%o1
	fnot1s	%f29,	%f18
	setx loop_73, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_73: 	ldd	[%l7 + 0x18],	%f4
	ldd	[%l7 + 0x18],	%f8
	orcc	%g4,	%i7,	%i2
	umul	%o3,	%g7,	%o7
	xnor	%g3,	%o6,	%o5
	fmovsne	%icc,	%f1,	%f11
	fones	%f30
	fnot1	%f16,	%f12
	fands	%f12,	%f21,	%f21
	sdivcc	%i0,	0x1B4F,	%l5
	fsrc2s	%f1,	%f4
	smulcc	%l0,	0x0D35,	%g5
	movcs	%icc,	%g6,	%i6
	udiv	%o4,	0x1189,	%i3
	and	%l3,	%l2,	%i5
	fpadd32s	%f26,	%f5,	%f4
	fmovdcc	%xcc,	%f9,	%f27
	std	%f10,	[%l7 + 0x68]
	addc	%l4,	0x04B8,	%l1
	movl	%icc,	%l6,	%i4
	fmovsl	%icc,	%f24,	%f29
	popc	%g1,	%o0
	fandnot1s	%f26,	%f23,	%f2
	edge8ln	%o1,	%g2,	%o2
	xnorcc	%i1,	0x0CD6,	%g4
	stx	%i7,	[%l7 + 0x40]
	array32	%o3,	%g7,	%o7
	udivx	%g3,	0x0FA1,	%i2
	movpos	%icc,	%o5,	%i0
	sth	%l5,	[%l7 + 0x7E]
	fmovdle	%xcc,	%f27,	%f10
	fmovsle	%xcc,	%f24,	%f10
	sdiv	%l0,	0x1580,	%o6
	movrgz	%g6,	%g5,	%i6
	ldsb	[%l7 + 0x53],	%i3
	movrlez	%l3,	0x244,	%o4
	movne	%xcc,	%i5,	%l4
	sdiv	%l2,	0x0C63,	%l6
	mulx	%i4,	0x11B7,	%g1
	movle	%icc,	%l1,	%o1
	movrgez	%g2,	%o0,	%i1
	xnorcc	%o2,	%i7,	%o3
	fmovdvc	%icc,	%f17,	%f10
	add	%g4,	%g7,	%o7
	sllx	%g3,	%o5,	%i0
	fcmped	%fcc3,	%f22,	%f20
	fpadd32	%f22,	%f6,	%f14
	stw	%i2,	[%l7 + 0x68]
	movcs	%icc,	%l5,	%l0
	xnor	%o6,	%g6,	%i6
	xorcc	%g5,	%l3,	%o4
	movrlez	%i3,	0x2F4,	%i5
	move	%xcc,	%l2,	%l6
	ldd	[%l7 + 0x70],	%l4
	movneg	%xcc,	%g1,	%l1
	ldd	[%l7 + 0x50],	%f10
	edge16ln	%i4,	%g2,	%o1
	stw	%i1,	[%l7 + 0x34]
	edge16	%o2,	%o0,	%i7
	addc	%o3,	0x06E8,	%g7
	fmovdcc	%icc,	%f28,	%f31
	addccc	%g4,	%o7,	%o5
	fmovdcc	%xcc,	%f12,	%f14
	fmovse	%icc,	%f27,	%f18
	and	%g3,	0x0BD7,	%i2
	ldd	[%l7 + 0x68],	%f26
	movre	%l5,	0x11F,	%l0
	orn	%o6,	%g6,	%i6
	movrgez	%g5,	0x32F,	%i0
	orn	%o4,	0x072F,	%i3
	fnot1	%f16,	%f26
	smulcc	%i5,	%l2,	%l6
	movle	%xcc,	%l4,	%l3
	sll	%l1,	0x1E,	%g1
	fpack32	%f28,	%f14,	%f28
	fpsub16s	%f26,	%f2,	%f29
	edge16l	%i4,	%g2,	%i1
	sth	%o1,	[%l7 + 0x18]
	smul	%o0,	%i7,	%o3
	sethi	0x0654,	%g7
	sdiv	%g4,	0x1BC8,	%o2
	movvs	%icc,	%o7,	%g3
	udivx	%o5,	0x0780,	%i2
	movvc	%xcc,	%l0,	%l5
	restore %o6, %i6, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f23,	%f4,	%f25
	udivx	%i0,	0x19A0,	%g5
	and	%i3,	%i5,	%l2
	ld	[%l7 + 0x40],	%f31
	movg	%xcc,	%l6,	%l4
	fcmple32	%f14,	%f0,	%l3
	umul	%o4,	0x137B,	%g1
	ldsh	[%l7 + 0x14],	%i4
	orn	%l1,	0x0F57,	%g2
	fmovdg	%xcc,	%f25,	%f23
	smul	%i1,	%o0,	%o1
	alignaddr	%i7,	%o3,	%g7
	udivx	%o2,	0x0D65,	%g4
	movrgz	%o7,	%o5,	%g3
	udiv	%l0,	0x02E3,	%i2
	sll	%l5,	0x0D,	%i6
	fnand	%f28,	%f6,	%f10
	std	%f6,	[%l7 + 0x50]
	fzeros	%f24
	movrlz	%g6,	0x0E4,	%o6
	udivcc	%g5,	0x0135,	%i0
	fpsub32	%f30,	%f0,	%f28
	movcc	%xcc,	%i5,	%l2
	edge16ln	%l6,	%i3,	%l3
	alignaddr	%o4,	%l4,	%i4
	fnot1	%f0,	%f24
	sdivx	%l1,	0x1342,	%g1
	ldsb	[%l7 + 0x4F],	%i1
	lduh	[%l7 + 0x46],	%o0
	orcc	%o1,	0x156C,	%i7
	xnorcc	%g2,	0x0516,	%g7
	mulscc	%o3,	0x1944,	%g4
	movcc	%xcc,	%o7,	%o5
	stb	%g3,	[%l7 + 0x21]
	edge8l	%l0,	%i2,	%o2
	movrne	%l5,	%i6,	%o6
	movle	%icc,	%g5,	%i0
	andcc	%g6,	0x1BBB,	%l2
	movre	%l6,	0x190,	%i3
	orncc	%i5,	%l3,	%o4
	fmovscs	%icc,	%f27,	%f6
	edge8l	%l4,	%l1,	%i4
	edge32	%g1,	%o0,	%o1
	orn	%i1,	%i7,	%g2
	movrlez	%o3,	%g7,	%g4
	sll	%o5,	%o7,	%g3
	fmovdl	%icc,	%f0,	%f16
	andn	%l0,	%o2,	%i2
	or	%i6,	0x077B,	%o6
	edge16	%l5,	%i0,	%g6
	fands	%f30,	%f13,	%f3
	orn	%l2,	%l6,	%g5
	movrgz	%i3,	%l3,	%i5
	bshuffle	%f16,	%f12,	%f30
	fmovrdgez	%o4,	%f30,	%f26
	move	%icc,	%l4,	%l1
	fcmped	%fcc1,	%f20,	%f30
	movvc	%icc,	%i4,	%o0
	nop
	set	0x14, %g2
	ldsw	[%l7 + %g2],	%o1
	stx	%g1,	[%l7 + 0x20]
	array8	%i1,	%g2,	%o3
	umulcc	%g7,	0x0567,	%g4
	xor	%o5,	0x092A,	%i7
	movre	%g3,	0x189,	%o7
	lduw	[%l7 + 0x6C],	%l0
	xorcc	%o2,	%i6,	%i2
	xnorcc	%o6,	0x0C38,	%l5
	fpadd32	%f12,	%f4,	%f0
	xnor	%g6,	%l2,	%i0
	movpos	%icc,	%l6,	%i3
	ld	[%l7 + 0x58],	%f25
	xorcc	%l3,	0x1D1B,	%i5
	fmovrsgez	%o4,	%f28,	%f0
	alignaddrl	%l4,	%l1,	%g5
	sir	0x1CF2
	edge32	%i4,	%o0,	%g1
	lduh	[%l7 + 0x2C],	%i1
	addc	%o1,	0x0304,	%g2
	movrne	%g7,	%g4,	%o3
	fnot1	%f28,	%f22
	move	%icc,	%i7,	%o5
	andcc	%g3,	%o7,	%o2
	movvc	%xcc,	%i6,	%i2
	nop
	set	0x3F, %g4
	ldub	[%l7 + %g4],	%l0
	movge	%xcc,	%o6,	%g6
	fxnors	%f1,	%f1,	%f26
	fandnot1s	%f6,	%f7,	%f13
	smul	%l5,	%i0,	%l2
	smulcc	%l6,	%i3,	%i5
	movgu	%xcc,	%l3,	%o4
	udivcc	%l4,	0x1D69,	%g5
	ldd	[%l7 + 0x08],	%f18
	ldd	[%l7 + 0x30],	%i4
	alignaddrl	%l1,	%g1,	%i1
	ldsw	[%l7 + 0x4C],	%o0
	ldsb	[%l7 + 0x13],	%o1
	orcc	%g2,	%g7,	%g4
	movcs	%xcc,	%i7,	%o5
	addc	%o3,	%o7,	%g3
	siam	0x5
	umulcc	%i6,	%o2,	%l0
	smulcc	%i2,	%g6,	%o6
	stx	%i0,	[%l7 + 0x48]
	movcc	%icc,	%l5,	%l2
	lduh	[%l7 + 0x4E],	%l6
	edge16n	%i5,	%i3,	%l3
	srax	%l4,	%g5,	%i4
	umulcc	%o4,	%l1,	%i1
	movcs	%icc,	%g1,	%o1
	movg	%xcc,	%g2,	%g7
	orncc	%g4,	%i7,	%o0
	orn	%o3,	0x07E8,	%o5
	addc	%g3,	%i6,	%o7
	xnorcc	%o2,	0x0F27,	%l0
	edge16	%g6,	%o6,	%i0
	setx loop_74, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_74: 	fmovsvc	%icc,	%f18,	%f8
	fcmped	%fcc2,	%f0,	%f28
	orcc	%l6,	%i5,	%i3
	smulcc	%l4,	%l3,	%g5
	fcmps	%fcc2,	%f1,	%f28
	fmovsne	%xcc,	%f26,	%f13
	movrlez	%i4,	%o4,	%l1
	fmovdvs	%icc,	%f13,	%f0
	movneg	%icc,	%g1,	%o1
	mulscc	%g2,	0x1EBB,	%g7
	fnands	%f30,	%f5,	%f25
	xnorcc	%i1,	%i7,	%g4
	edge8	%o3,	%o0,	%g3
	fmovdvs	%icc,	%f11,	%f21
	fmovscc	%icc,	%f19,	%f4
	movcc	%xcc,	%i6,	%o5
	array8	%o2,	%o7,	%g6
	popc	0x0079,	%o6
	fornot2s	%f5,	%f24,	%f20
	edge8n	%l0,	%l5,	%i0
	std	%f22,	[%l7 + 0x70]
	movrlz	%l2,	%l6,	%i2
	fmovdg	%xcc,	%f22,	%f21
	sethi	0x005B,	%i3
	sdivcc	%l4,	0x1E5A,	%i5
	fcmpeq16	%f6,	%f6,	%g5
	andncc	%i4,	%l3,	%o4
	udiv	%l1,	0x083D,	%g1
	andncc	%g2,	%g7,	%o1
	fsrc1	%f8,	%f26
	ldub	[%l7 + 0x33],	%i7
	fpadd32s	%f0,	%f14,	%f20
	fands	%f3,	%f15,	%f12
	stw	%i1,	[%l7 + 0x60]
	xorcc	%o3,	0x1AD4,	%o0
	edge8	%g3,	%i6,	%g4
	mulscc	%o2,	0x07CB,	%o5
	subcc	%o7,	%o6,	%g6
	smulcc	%l5,	0x1EA6,	%i0
	movneg	%xcc,	%l0,	%l2
	sll	%l6,	0x0D,	%i3
	fcmped	%fcc1,	%f20,	%f30
	movcc	%xcc,	%i2,	%i5
	fmovsge	%icc,	%f19,	%f15
	ldd	[%l7 + 0x30],	%l4
	edge16	%i4,	%g5,	%l3
	movrlz	%l1,	%g1,	%g2
	movpos	%xcc,	%g7,	%o4
	smul	%o1,	%i7,	%i1
	ldsh	[%l7 + 0x18],	%o0
	edge8n	%o3,	%g3,	%g4
	edge16l	%o2,	%i6,	%o7
	movcc	%icc,	%o6,	%o5
	lduh	[%l7 + 0x6A],	%g6
	fpackfix	%f28,	%f8
	ldd	[%l7 + 0x40],	%l4
	umulcc	%l0,	0x13EE,	%i0
	fxors	%f5,	%f15,	%f26
	xnorcc	%l2,	%l6,	%i3
	add	%i2,	0x051D,	%l4
	fmovsleu	%xcc,	%f9,	%f16
	movrgz	%i4,	0x10F,	%i5
	fpsub32	%f16,	%f20,	%f0
	fnot1	%f20,	%f12
	udiv	%g5,	0x19DE,	%l3
	srlx	%l1,	0x06,	%g1
	ldx	[%l7 + 0x08],	%g2
	std	%f6,	[%l7 + 0x10]
	sdiv	%g7,	0x1CDD,	%o4
	lduw	[%l7 + 0x78],	%o1
	edge8l	%i1,	%o0,	%i7
	fnor	%f20,	%f26,	%f18
	ldub	[%l7 + 0x40],	%g3
	movrgez	%o3,	0x027,	%g4
	addc	%i6,	%o2,	%o7
	nop
	set	0x28, %o1
	ldd	[%l7 + %o1],	%o4
	mova	%xcc,	%g6,	%o6
	sra	%l5,	%l0,	%i0
	st	%f26,	[%l7 + 0x6C]
	popc	0x12F1,	%l6
	edge16	%l2,	%i2,	%i3
	movvs	%icc,	%i4,	%i5
	addccc	%g5,	%l3,	%l1
	ldd	[%l7 + 0x50],	%g0
	ldd	[%l7 + 0x30],	%l4
	xnorcc	%g7,	%o4,	%o1
	xorcc	%i1,	0x192E,	%g2
	movneg	%icc,	%i7,	%g3
	fcmpes	%fcc2,	%f20,	%f17
	lduh	[%l7 + 0x2C],	%o0
	udivcc	%o3,	0x0ED4,	%g4
	fmovdge	%icc,	%f29,	%f4
	ld	[%l7 + 0x64],	%f12
	ld	[%l7 + 0x0C],	%f15
	fandnot2s	%f28,	%f7,	%f25
	movn	%xcc,	%o2,	%i6
	movle	%xcc,	%o7,	%o5
	mova	%xcc,	%g6,	%o6
	siam	0x1
	edge16l	%l0,	%l5,	%l6
	ldx	[%l7 + 0x20],	%l2
	movrne	%i0,	%i3,	%i4
	sll	%i2,	0x12,	%g5
	or	%i5,	%l1,	%g1
	fnot2s	%f22,	%f7
	edge16	%l4,	%l3,	%g7
	st	%f20,	[%l7 + 0x70]
	fands	%f17,	%f10,	%f9
	fabsd	%f2,	%f6
	lduw	[%l7 + 0x2C],	%o4
	sth	%o1,	[%l7 + 0x6E]
	array8	%g2,	%i7,	%g3
	sdivcc	%o0,	0x01BE,	%o3
	smul	%g4,	0x0FE8,	%i1
	edge8n	%o2,	%i6,	%o7
	movrgz	%g6,	0x37E,	%o5
	fmovd	%f8,	%f4
	nop
	set	0x54, %o2
	lduw	[%l7 + %o2],	%l0
	sethi	0x086A,	%l5
	movrlez	%o6,	0x020,	%l6
	fsrc1	%f30,	%f28
	sethi	0x0CE9,	%l2
	fmovdcc	%xcc,	%f14,	%f24
	srax	%i3,	%i4,	%i2
	sllx	%g5,	%i0,	%l1
	edge32n	%i5,	%l4,	%g1
	alignaddrl	%l3,	%o4,	%o1
	st	%f14,	[%l7 + 0x64]
	edge32n	%g7,	%i7,	%g3
	movle	%xcc,	%g2,	%o0
	edge16n	%g4,	%i1,	%o2
	movneg	%xcc,	%i6,	%o7
	sdivx	%o3,	0x1DCA,	%g6
	movn	%icc,	%l0,	%l5
	edge16l	%o5,	%l6,	%l2
	array32	%o6,	%i3,	%i2
	sll	%i4,	%i0,	%l1
	umulcc	%i5,	%l4,	%g1
	movpos	%icc,	%l3,	%g5
	array32	%o1,	%g7,	%o4
	sdivcc	%i7,	0x01C8,	%g2
	mova	%xcc,	%g3,	%g4
	sethi	0x0068,	%i1
	edge32ln	%o0,	%o2,	%i6
	mulx	%o3,	0x0830,	%g6
	subccc	%l0,	%l5,	%o5
	subc	%l6,	%o7,	%l2
	orncc	%o6,	%i3,	%i4
	fmovdvs	%xcc,	%f25,	%f21
	addc	%i2,	%l1,	%i0
	ldsh	[%l7 + 0x50],	%i5
	orn	%g1,	%l3,	%g5
	udivcc	%o1,	0x0225,	%l4
	movrne	%o4,	0x10E,	%i7
	addc	%g7,	0x0939,	%g2
	mulx	%g3,	0x1C1F,	%g4
	sdivx	%i1,	0x02EA,	%o2
	movg	%xcc,	%i6,	%o3
	array32	%o0,	%g6,	%l0
	fnot1s	%f0,	%f8
	ldsh	[%l7 + 0x30],	%l5
	srl	%o5,	0x0A,	%l6
	umul	%l2,	%o7,	%i3
	ldsw	[%l7 + 0x50],	%o6
	and	%i4,	%i2,	%i0
	mova	%icc,	%l1,	%g1
	udiv	%l3,	0x08C2,	%g5
	sdivcc	%i5,	0x0A2B,	%l4
	edge16ln	%o1,	%o4,	%g7
	udiv	%g2,	0x11FA,	%g3
	edge32	%g4,	%i1,	%i7
	mova	%icc,	%i6,	%o3
	ldx	[%l7 + 0x10],	%o2
	popc	%o0,	%g6
	fmovdg	%icc,	%f23,	%f16
	fornot1s	%f7,	%f30,	%f31
	alignaddr	%l0,	%o5,	%l5
	fmovsvs	%icc,	%f22,	%f0
	movne	%icc,	%l2,	%o7
	fmovsle	%icc,	%f10,	%f6
	fmovsl	%xcc,	%f17,	%f21
	edge16n	%l6,	%i3,	%i4
	fandnot2s	%f17,	%f25,	%f29
	ldub	[%l7 + 0x37],	%o6
	stx	%i2,	[%l7 + 0x30]
	movcs	%icc,	%l1,	%g1
	nop
	set	0x38, %o3
	stw	%l3,	[%l7 + %o3]
	fmovdvc	%xcc,	%f16,	%f21
	movrgez	%i0,	%g5,	%i5
	ldsw	[%l7 + 0x5C],	%l4
	ldsh	[%l7 + 0x26],	%o4
	fmovdcs	%icc,	%f1,	%f0
	fmovrsne	%g7,	%f25,	%f20
	movrne	%o1,	%g3,	%g2
	and	%i1,	%i7,	%i6
	ldsb	[%l7 + 0x6E],	%g4
	add	%o2,	0x1682,	%o3
	smul	%o0,	%l0,	%o5
	stx	%g6,	[%l7 + 0x20]
	movrne	%l5,	%o7,	%l2
	srl	%i3,	0x11,	%i4
	alignaddrl	%o6,	%l6,	%i2
	smulcc	%l1,	0x01AB,	%g1
	sth	%l3,	[%l7 + 0x0C]
	andncc	%g5,	%i0,	%l4
	edge32n	%i5,	%g7,	%o1
	fnors	%f31,	%f2,	%f3
	fmovdcs	%icc,	%f17,	%f5
	sth	%g3,	[%l7 + 0x6C]
	udivcc	%g2,	0x0A80,	%o4
	ldx	[%l7 + 0x08],	%i7
	orn	%i6,	0x00DC,	%g4
	stw	%o2,	[%l7 + 0x58]
	xnorcc	%o3,	0x1F88,	%o0
	edge8	%l0,	%i1,	%g6
	xor	%l5,	%o7,	%o5
	movrgz	%l2,	%i3,	%o6
	sub	%l6,	%i4,	%i2
	fmovsl	%icc,	%f26,	%f14
	edge32n	%g1,	%l3,	%l1
	sdivcc	%g5,	0x0051,	%l4
	andncc	%i5,	%i0,	%g7
	movrlez	%g3,	%g2,	%o1
	ldd	[%l7 + 0x60],	%f6
	edge16n	%i7,	%i6,	%g4
	udiv	%o2,	0x0666,	%o3
	edge32	%o4,	%o0,	%i1
	fmovscc	%icc,	%f21,	%f29
	subcc	%g6,	%l5,	%l0
	alignaddr	%o7,	%l2,	%o5
	fmovdcs	%xcc,	%f12,	%f11
	movcc	%icc,	%o6,	%l6
	fcmpgt32	%f10,	%f16,	%i4
	movcs	%xcc,	%i3,	%i2
	subcc	%g1,	0x042E,	%l1
	subcc	%l3,	0x1069,	%l4
	movg	%icc,	%g5,	%i0
	sdivx	%i5,	0x1A12,	%g3
	stw	%g7,	[%l7 + 0x30]
	array8	%g2,	%o1,	%i6
	sdivcc	%g4,	0x0C81,	%o2
	fnot2	%f22,	%f30
	popc	%o3,	%o4
	sll	%i7,	%i1,	%o0
	andcc	%g6,	%l0,	%l5
	movrgz	%l2,	0x0D8,	%o5
	fmovdge	%icc,	%f10,	%f2
	fones	%f27
	andcc	%o7,	0x1870,	%l6
	fcmpeq32	%f2,	%f0,	%i4
	add	%i3,	0x139E,	%o6
	udivcc	%i2,	0x14C6,	%g1
	ldsh	[%l7 + 0x3A],	%l3
	movrgz	%l1,	0x152,	%l4
	movcs	%xcc,	%i0,	%i5
	movgu	%xcc,	%g3,	%g5
	movrlz	%g2,	0x1C1,	%g7
	fnot2	%f24,	%f14
	fmovrdgez	%o1,	%f2,	%f20
	movrlez	%g4,	%o2,	%o3
	umul	%o4,	0x1F3E,	%i6
	fones	%f0
	orncc	%i7,	0x10F8,	%o0
	udivx	%i1,	0x1420,	%l0
	faligndata	%f6,	%f12,	%f28
	ldub	[%l7 + 0x41],	%l5
	movrgez	%g6,	%l2,	%o5
	edge16n	%l6,	%o7,	%i4
	edge32	%o6,	%i3,	%g1
	array32	%l3,	%i2,	%l1
	movne	%xcc,	%l4,	%i0
	fmuld8sux16	%f6,	%f27,	%f28
	movrgez	%g3,	0x1EA,	%g5
	and	%g2,	0x11EA,	%g7
	stw	%o1,	[%l7 + 0x7C]
	restore %i5, %o2, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subcc	%o3,	0x1D83,	%o4
	fmovrdgz	%i6,	%f6,	%f2
	addc	%o0,	%i7,	%l0
	edge8ln	%i1,	%l5,	%g6
	orcc	%o5,	%l2,	%l6
	movne	%icc,	%i4,	%o6
	std	%f4,	[%l7 + 0x18]
	faligndata	%f4,	%f18,	%f24
	sdiv	%o7,	0x18FA,	%i3
	bshuffle	%f12,	%f14,	%f24
	movle	%icc,	%l3,	%g1
	ldd	[%l7 + 0x78],	%l0
	fmovspos	%icc,	%f14,	%f2
	sethi	0x1044,	%i2
	orncc	%l4,	%g3,	%g5
	move	%xcc,	%g2,	%g7
	ldx	[%l7 + 0x48],	%o1
	sub	%i5,	%o2,	%i0
	edge16ln	%o3,	%o4,	%i6
	sethi	0x18CA,	%g4
	movle	%xcc,	%o0,	%l0
	movrlez	%i1,	0x183,	%i7
	sdivcc	%g6,	0x112A,	%l5
	save %o5, %l6, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%i4,	0x0BE4,	%o7
	sll	%o6,	0x16,	%i3
	lduw	[%l7 + 0x10],	%g1
	fmovdleu	%icc,	%f16,	%f16
	fcmpne16	%f20,	%f30,	%l3
	fands	%f3,	%f7,	%f6
	fcmpeq32	%f22,	%f14,	%i2
	orn	%l4,	%l1,	%g5
	movle	%icc,	%g2,	%g7
	fzero	%f18
	alignaddrl	%o1,	%g3,	%i5
	edge8n	%i0,	%o2,	%o3
	fmovrdgz	%i6,	%f2,	%f0
	subc	%o4,	%g4,	%l0
	sethi	0x125E,	%o0
	lduh	[%l7 + 0x10],	%i7
	edge8n	%g6,	%i1,	%o5
	subccc	%l5,	%l6,	%i4
	xnor	%o7,	0x06CB,	%o6
	movl	%icc,	%l2,	%g1
	stb	%l3,	[%l7 + 0x3E]
	umul	%i3,	0x1E46,	%i2
	sdiv	%l4,	0x013A,	%l1
	movcc	%xcc,	%g2,	%g7
	movle	%xcc,	%g5,	%o1
	edge32	%i5,	%g3,	%o2
	udivcc	%o3,	0x1A9B,	%i0
	ldub	[%l7 + 0x0A],	%o4
	sra	%g4,	%i6,	%l0
	ldd	[%l7 + 0x10],	%f18
	edge32l	%o0,	%g6,	%i1
	fmovd	%f30,	%f8
	sdivx	%o5,	0x17FC,	%l5
	movcc	%xcc,	%i7,	%l6
	edge8	%i4,	%o7,	%o6
	subc	%g1,	%l2,	%i3
	umul	%l3,	%l4,	%i2
	fmovspos	%xcc,	%f22,	%f17
	movgu	%xcc,	%l1,	%g7
	edge8l	%g2,	%o1,	%g5
	stw	%g3,	[%l7 + 0x48]
	ldsb	[%l7 + 0x11],	%i5
	fmovrde	%o2,	%f2,	%f26
	ldsh	[%l7 + 0x10],	%o3
	edge32	%o4,	%i0,	%g4
	movcs	%icc,	%i6,	%o0
	edge16ln	%g6,	%i1,	%l0
	movge	%xcc,	%l5,	%i7
	movcs	%xcc,	%l6,	%o5
	udivx	%o7,	0x0149,	%o6
	fnands	%f9,	%f29,	%f7
	fmovrdgz	%g1,	%f18,	%f18
	umulcc	%l2,	%i3,	%i4
	alignaddrl	%l3,	%l4,	%l1
	alignaddrl	%i2,	%g7,	%o1
	sth	%g2,	[%l7 + 0x34]
	stx	%g5,	[%l7 + 0x28]
	array8	%g3,	%o2,	%i5
	movvc	%icc,	%o4,	%i0
	addc	%g4,	0x056F,	%o3
	mulscc	%i6,	0x065C,	%g6
	fnand	%f14,	%f6,	%f28
	umul	%o0,	%l0,	%l5
	fmovdcc	%xcc,	%f16,	%f1
	xor	%i7,	0x15D1,	%i1
	setx loop_75, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_75: 	fnor	%f8,	%f0,	%f14
	popc	0x1585,	%l6
	add	%l2,	%i3,	%i4
	udiv	%g1,	0x1749,	%l4
	ldub	[%l7 + 0x14],	%l3
	srax	%l1,	%i2,	%g7
	save %g2, 0x1CF3, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	orcc	%g3,	%o2,	%i5
	for	%f24,	%f20,	%f12
	array16	%g5,	%o4,	%g4
	edge8n	%i0,	%o3,	%i6
	movn	%icc,	%g6,	%o0
	fmovrse	%l5,	%f0,	%f20
	sdivx	%l0,	0x016F,	%i7
	edge16	%i1,	%o5,	%o6
	lduw	[%l7 + 0x20],	%o7
	fmovs	%f13,	%f7
	or	%l2,	0x1A3B,	%i3
	alignaddrl	%l6,	%g1,	%l4
	movrgz	%l3,	%l1,	%i4
	ldd	[%l7 + 0x30],	%i2
	movvs	%icc,	%g2,	%o1
	sth	%g7,	[%l7 + 0x78]
	sth	%g3,	[%l7 + 0x5E]
	xorcc	%o2,	%g5,	%o4
	mova	%xcc,	%i5,	%g4
	movgu	%icc,	%o3,	%i6
	srax	%i0,	0x02,	%g6
	movle	%xcc,	%o0,	%l5
	sth	%l0,	[%l7 + 0x62]
	movle	%xcc,	%i7,	%o5
	movrgz	%o6,	0x150,	%o7
	addcc	%i1,	0x1D64,	%l2
	ldd	[%l7 + 0x48],	%f20
	fzeros	%f14
	fpsub16	%f4,	%f10,	%f18
	pdist	%f24,	%f12,	%f30
	fmovd	%f12,	%f30
	fmovrsne	%i3,	%f1,	%f6
	ldx	[%l7 + 0x38],	%g1
	mulx	%l6,	%l3,	%l4
	umulcc	%i4,	0x0BB9,	%l1
	move	%xcc,	%g2,	%o1
	edge16ln	%i2,	%g7,	%o2
	movrlz	%g3,	0x303,	%g5
	movvc	%xcc,	%o4,	%g4
	addcc	%i5,	0x06D0,	%o3
	mulx	%i0,	%i6,	%o0
	umul	%l5,	%l0,	%g6
	fpack16	%f12,	%f16
	udivx	%i7,	0x10F4,	%o6
	mulscc	%o7,	%i1,	%o5
	sth	%l2,	[%l7 + 0x26]
	movvc	%xcc,	%i3,	%l6
	ldub	[%l7 + 0x30],	%g1
	movneg	%xcc,	%l3,	%l4
	fpadd16	%f28,	%f10,	%f24
	edge8n	%i4,	%g2,	%o1
	edge32ln	%l1,	%g7,	%o2
	ldsb	[%l7 + 0x25],	%i2
	srl	%g3,	0x1C,	%o4
	movrlz	%g4,	%g5,	%o3
	movvs	%icc,	%i5,	%i0
	fmovsge	%icc,	%f20,	%f15
	sdivcc	%o0,	0x0663,	%i6
	siam	0x2
	movg	%icc,	%l0,	%g6
	umulcc	%l5,	0x1456,	%o6
	umulcc	%i7,	%i1,	%o7
	ldx	[%l7 + 0x50],	%l2
	fpadd32s	%f2,	%f7,	%f2
	restore %i3, %l6, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g1,	[%l7 + 0x58]
	mova	%icc,	%l3,	%i4
	sra	%l4,	0x12,	%o1
	movgu	%icc,	%g2,	%g7
	fcmpes	%fcc3,	%f26,	%f11
	edge16	%o2,	%l1,	%i2
	andcc	%o4,	0x16DF,	%g3
	mulx	%g4,	%g5,	%o3
	edge8l	%i5,	%o0,	%i0
	fxnors	%f22,	%f8,	%f4
	orcc	%i6,	0x12F4,	%l0
	fpadd16	%f30,	%f24,	%f12
	movge	%icc,	%g6,	%o6
	smul	%l5,	0x06C3,	%i7
	or	%o7,	0x0687,	%i1
	for	%f0,	%f8,	%f30
	stx	%i3,	[%l7 + 0x60]
	subc	%l6,	%l2,	%o5
	st	%f0,	[%l7 + 0x70]
	xnorcc	%g1,	0x0FB5,	%l3
	orn	%i4,	0x0E2F,	%l4
	umul	%o1,	%g7,	%g2
	ldx	[%l7 + 0x20],	%l1
	edge16n	%i2,	%o4,	%g3
	fzero	%f0
	fmul8x16au	%f23,	%f10,	%f0
	fcmpd	%fcc1,	%f28,	%f18
	fsrc1s	%f1,	%f1
	edge32ln	%o2,	%g5,	%o3
	fmovde	%icc,	%f7,	%f3
	movcc	%xcc,	%i5,	%g4
	sth	%o0,	[%l7 + 0x2A]
	fcmpne16	%f26,	%f6,	%i0
	ldx	[%l7 + 0x48],	%i6
	ldx	[%l7 + 0x38],	%g6
	movrlez	%o6,	%l0,	%l5
	ldsh	[%l7 + 0x52],	%i7
	alignaddrl	%i1,	%i3,	%o7
	alignaddr	%l6,	%l2,	%g1
	setx loop_76, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_76: 	subccc	%l4,	%g7,	%g2
	sll	%o1,	%l1,	%o4
	fmovsg	%icc,	%f17,	%f0
	pdist	%f18,	%f4,	%f12
	subccc	%g3,	%o2,	%g5
	edge16ln	%o3,	%i5,	%g4
	orncc	%o0,	%i2,	%i6
	fpsub32	%f18,	%f14,	%f4
	fmovrslz	%g6,	%f15,	%f26
	edge8	%i0,	%l0,	%o6
	ldx	[%l7 + 0x40],	%l5
	ldsh	[%l7 + 0x52],	%i7
	fpadd32s	%f21,	%f22,	%f15
	subcc	%i3,	0x0B6A,	%i1
	movne	%xcc,	%o7,	%l6
	stx	%l2,	[%l7 + 0x38]
	fmovscs	%icc,	%f6,	%f1
	smulcc	%l3,	0x1F09,	%g1
	lduh	[%l7 + 0x1A],	%o5
	fmovsneg	%xcc,	%f28,	%f20
	orncc	%i4,	0x0623,	%l4
	st	%f9,	[%l7 + 0x7C]
	edge32	%g2,	%o1,	%l1
	fexpand	%f8,	%f10
	lduh	[%l7 + 0x2E],	%o4
	movgu	%icc,	%g7,	%o2
	movrlz	%g3,	%g5,	%i5
	bshuffle	%f16,	%f20,	%f12
	andncc	%g4,	%o3,	%i2
	fexpand	%f13,	%f26
	edge8	%i6,	%o0,	%i0
	srax	%g6,	0x05,	%l0
	movrgz	%o6,	0x0F3,	%l5
	ldub	[%l7 + 0x29],	%i3
	sdivcc	%i1,	0x05F8,	%o7
	xorcc	%i7,	%l2,	%l6
	fmovsa	%xcc,	%f23,	%f29
	orcc	%l3,	%o5,	%g1
	umul	%l4,	%g2,	%i4
	sll	%l1,	%o4,	%g7
	fmovsn	%xcc,	%f5,	%f10
	fmul8x16al	%f30,	%f31,	%f18
	orncc	%o2,	%o1,	%g3
	movneg	%xcc,	%i5,	%g4
	edge16l	%g5,	%i2,	%o3
	fxors	%f2,	%f23,	%f20
	edge32n	%o0,	%i6,	%g6
	movrlez	%l0,	%i0,	%o6
	nop
	set	0x24, %i1
	sth	%i3,	[%l7 + %i1]
	movrne	%l5,	%o7,	%i1
	fors	%f3,	%f11,	%f21
	ldub	[%l7 + 0x0C],	%i7
	ldsw	[%l7 + 0x6C],	%l6
	fmovsneg	%icc,	%f24,	%f19
	mulx	%l2,	%o5,	%l3
	move	%xcc,	%g1,	%l4
	fsrc2s	%f20,	%f4
	movcc	%icc,	%g2,	%i4
	array32	%l1,	%o4,	%g7
	sra	%o1,	%o2,	%i5
	stx	%g4,	[%l7 + 0x20]
	mulx	%g3,	%i2,	%g5
	udivcc	%o3,	0x1E2E,	%o0
	movrgz	%g6,	0x0B8,	%l0
	fmovrdgz	%i6,	%f30,	%f12
	st	%f4,	[%l7 + 0x48]
	movge	%icc,	%i0,	%o6
	movrgez	%i3,	%l5,	%i1
	fmovsg	%icc,	%f17,	%f0
	movn	%xcc,	%o7,	%i7
	edge32	%l2,	%o5,	%l6
	orn	%g1,	0x1D74,	%l4
	ldsw	[%l7 + 0x2C],	%l3
	ldsb	[%l7 + 0x5D],	%i4
	fnands	%f28,	%f27,	%f12
	fmul8ulx16	%f6,	%f18,	%f22
	fmovdleu	%icc,	%f19,	%f31
	sethi	0x0B8E,	%l1
	smulcc	%g2,	%o4,	%g7
	orncc	%o2,	0x1DB5,	%i5
	mova	%icc,	%g4,	%o1
	mulx	%i2,	0x1CAD,	%g5
	fmovdvs	%icc,	%f4,	%f23
	fpadd32s	%f18,	%f24,	%f7
	movl	%icc,	%o3,	%o0
	edge8ln	%g6,	%g3,	%l0
	fornot2	%f12,	%f0,	%f0
	udivcc	%i6,	0x1FA2,	%o6
	edge16l	%i3,	%l5,	%i1
	mova	%xcc,	%i0,	%o7
	fmovdl	%icc,	%f20,	%f17
	fxnor	%f28,	%f6,	%f18
	nop
	set	0x1E, %g5
	sth	%l2,	[%l7 + %g5]
	ldx	[%l7 + 0x50],	%o5
	ldsh	[%l7 + 0x78],	%i7
	sllx	%l6,	0x02,	%l4
	movne	%icc,	%l3,	%i4
	nop
	set	0x34, %o6
	sth	%l1,	[%l7 + %o6]
	srax	%g1,	%o4,	%g2
	fpadd32s	%f12,	%f8,	%f14
	addcc	%o2,	0x07C4,	%g7
	stw	%g4,	[%l7 + 0x24]
	stx	%i5,	[%l7 + 0x20]
	subc	%i2,	%o1,	%g5
	fcmple32	%f10,	%f10,	%o3
	stb	%g6,	[%l7 + 0x18]
	sdivcc	%o0,	0x1E43,	%l0
	fpadd32	%f0,	%f12,	%f2
	stw	%i6,	[%l7 + 0x74]
	edge16l	%o6,	%i3,	%g3
	edge16n	%l5,	%i0,	%i1
	movg	%xcc,	%l2,	%o7
	fandnot1	%f12,	%f0,	%f18
	sll	%o5,	%l6,	%i7
	movrgez	%l3,	0x078,	%i4
	xnorcc	%l1,	0x100B,	%l4
	ldsh	[%l7 + 0x22],	%g1
	edge32	%g2,	%o2,	%g7
	xor	%o4,	0x0B80,	%i5
	edge8l	%g4,	%i2,	%o1
	edge16l	%o3,	%g6,	%g5
	fpmerge	%f5,	%f6,	%f14
	orn	%l0,	0x19FA,	%i6
	fabss	%f29,	%f25
	fpack16	%f8,	%f19
	sdivcc	%o6,	0x12F9,	%i3
	orn	%o0,	0x1301,	%g3
	fnegd	%f30,	%f16
	smul	%l5,	%i0,	%i1
	add	%o7,	0x17C7,	%o5
	udivcc	%l6,	0x0E5A,	%i7
	edge32	%l2,	%i4,	%l1
	edge16ln	%l3,	%l4,	%g1
	movpos	%icc,	%g2,	%g7
	xorcc	%o2,	%i5,	%o4
	array8	%g4,	%i2,	%o1
	bshuffle	%f26,	%f24,	%f18
	sir	0x19B3
	std	%f28,	[%l7 + 0x20]
	move	%xcc,	%o3,	%g6
	fnand	%f30,	%f14,	%f22
	nop
	set	0x3C, %l0
	ldsw	[%l7 + %l0],	%l0
	mulx	%i6,	%g5,	%i3
	movre	%o6,	0x11E,	%o0
	fandnot2	%f10,	%f12,	%f4
	smul	%g3,	0x01EE,	%l5
	stx	%i0,	[%l7 + 0x60]
	fpadd16s	%f8,	%f16,	%f9
	smulcc	%o7,	%o5,	%i1
	add	%i7,	%l2,	%l6
	movpos	%icc,	%i4,	%l3
	umul	%l4,	%l1,	%g1
	udivx	%g2,	0x0EFC,	%o2
	xnor	%i5,	%o4,	%g7
	movvc	%xcc,	%g4,	%i2
	addc	%o3,	0x1D97,	%o1
	fmovrdlz	%g6,	%f0,	%f18
	udivx	%i6,	0x1078,	%g5
	st	%f2,	[%l7 + 0x7C]
	fmovdvc	%icc,	%f8,	%f5
	movrlez	%i3,	0x3AA,	%l0
	fmovrdne	%o6,	%f0,	%f2
	sllx	%g3,	%o0,	%i0
	umulcc	%l5,	%o5,	%o7
	sethi	0x08A0,	%i7
	xor	%i1,	%l6,	%l2
	movle	%icc,	%l3,	%i4
	movneg	%xcc,	%l1,	%g1
	fmovs	%f9,	%f1
	fcmps	%fcc0,	%f9,	%f16
	std	%f12,	[%l7 + 0x38]
	popc	0x11E4,	%g2
	edge32n	%o2,	%i5,	%l4
	fmovdvs	%xcc,	%f8,	%f18
	fmovdn	%xcc,	%f2,	%f31
	sth	%g7,	[%l7 + 0x2C]
	movgu	%icc,	%g4,	%o4
	move	%icc,	%o3,	%i2
	movcs	%icc,	%g6,	%o1
	sra	%i6,	%i3,	%l0
	mova	%xcc,	%o6,	%g5
	fpack32	%f22,	%f12,	%f18
	stb	%g3,	[%l7 + 0x2F]
	fones	%f2
	movpos	%icc,	%i0,	%l5
	andn	%o0,	%o7,	%i7
	lduw	[%l7 + 0x18],	%o5
	edge8ln	%l6,	%i1,	%l2
	alignaddr	%l3,	%i4,	%l1
	udivcc	%g1,	0x1844,	%g2
	orncc	%o2,	%i5,	%g7
	sll	%g4,	%o4,	%o3
	sra	%i2,	%l4,	%g6
	edge32n	%o1,	%i6,	%l0
	andn	%i3,	0x0633,	%o6
	xnorcc	%g5,	%g3,	%l5
	fands	%f2,	%f29,	%f2
	movge	%icc,	%i0,	%o0
	movl	%icc,	%i7,	%o7
	movrlz	%o5,	0x296,	%i1
	sdivcc	%l6,	0x0A56,	%l2
	save %l3, 0x0158, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andcc	%l1,	0x0B72,	%g1
	xnorcc	%o2,	%g2,	%i5
	udiv	%g4,	0x102A,	%g7
	sll	%o4,	%o3,	%i2
	udivx	%g6,	0x0F70,	%l4
	movn	%icc,	%o1,	%i6
	edge32	%i3,	%o6,	%g5
	sra	%g3,	%l5,	%l0
	st	%f4,	[%l7 + 0x50]
	fmovdl	%icc,	%f15,	%f11
	movle	%xcc,	%i0,	%o0
	fxors	%f17,	%f1,	%f13
	movleu	%xcc,	%i7,	%o5
	udivcc	%i1,	0x112A,	%l6
	fmovscc	%icc,	%f20,	%f2
	fcmpne32	%f22,	%f6,	%l2
	edge8l	%o7,	%l3,	%l1
	orcc	%g1,	%i4,	%o2
	xnorcc	%g2,	0x1D83,	%g4
	fmovsvc	%icc,	%f10,	%f25
	stw	%i5,	[%l7 + 0x2C]
	smul	%g7,	%o4,	%o3
	movl	%xcc,	%g6,	%l4
	movrgez	%i2,	%i6,	%i3
	movg	%xcc,	%o6,	%g5
	nop
	set	0x0C, %l2
	lduw	[%l7 + %l2],	%g3
	sth	%o1,	[%l7 + 0x12]
	for	%f30,	%f20,	%f26
	movrne	%l5,	%l0,	%i0
	stx	%i7,	[%l7 + 0x50]
	srax	%o0,	0x05,	%o5
	sub	%i1,	%l2,	%l6
	xnorcc	%l3,	%l1,	%o7
	movvs	%xcc,	%g1,	%i4
	andn	%o2,	0x08D7,	%g2
	xnorcc	%g4,	%i5,	%g7
	mova	%xcc,	%o3,	%o4
	addccc	%l4,	%g6,	%i6
	edge8ln	%i2,	%o6,	%i3
	sra	%g5,	%g3,	%l5
	andn	%l0,	0x0E15,	%i0
	add	%i7,	%o0,	%o5
	fandnot1	%f0,	%f10,	%f18
	subccc	%i1,	%o1,	%l6
	array8	%l2,	%l1,	%l3
	ldsw	[%l7 + 0x30],	%o7
	mova	%xcc,	%i4,	%o2
	fmovrde	%g2,	%f28,	%f4
	restore %g1, %i5, %g4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movne	%icc,	%g7,	%o4
	save %l4, 0x19E7, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f6,	%f4,	%f6
	movvc	%xcc,	%i6,	%g6
	stb	%o6,	[%l7 + 0x59]
	move	%xcc,	%i2,	%i3
	array8	%g3,	%l5,	%l0
	xnor	%g5,	%i0,	%i7
	edge16ln	%o5,	%o0,	%o1
	movrgez	%i1,	%l2,	%l6
	smul	%l3,	%o7,	%l1
	fmovsn	%icc,	%f23,	%f19
	mulx	%i4,	0x1673,	%g2
	lduh	[%l7 + 0x40],	%g1
	nop
	set	0x4C, %l3
	lduh	[%l7 + %l3],	%o2
	fornot1s	%f10,	%f11,	%f11
	addc	%g4,	0x0B6E,	%g7
	fmovrse	%i5,	%f16,	%f0
	stb	%o4,	[%l7 + 0x68]
	edge32l	%o3,	%l4,	%i6
	movrlez	%o6,	0x264,	%i2
	mova	%icc,	%i3,	%g6
	addcc	%g3,	%l0,	%g5
	xnor	%i0,	%i7,	%o5
	subccc	%l5,	0x1544,	%o0
	fxor	%f16,	%f12,	%f6
	andncc	%i1,	%o1,	%l6
	movvs	%xcc,	%l3,	%l2
	addccc	%l1,	%o7,	%i4
	addcc	%g2,	0x0F3F,	%g1
	srax	%o2,	%g7,	%g4
	fmovsvc	%icc,	%f9,	%f2
	sllx	%i5,	%o4,	%l4
	array32	%o3,	%o6,	%i6
	and	%i2,	0x1F62,	%g6
	fpackfix	%f0,	%f29
	fmul8x16au	%f17,	%f25,	%f26
	sll	%i3,	0x07,	%l0
	setx loop_77, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_77: 	andcc	%i0,	0x13DB,	%l5
	movrlez	%o5,	%i1,	%o0
	and	%o1,	0x1433,	%l3
	sub	%l2,	%l6,	%o7
	edge8ln	%i4,	%g2,	%l1
	sethi	0x0F89,	%g1
	edge16	%g7,	%o2,	%i5
	xnorcc	%g4,	%o4,	%o3
	movrgez	%l4,	0x3A5,	%i6
	movne	%xcc,	%o6,	%i2
	movne	%icc,	%i3,	%g6
	stw	%l0,	[%l7 + 0x24]
	edge16n	%g3,	%g5,	%i7
	fsrc1	%f22,	%f10
	fornot2s	%f25,	%f17,	%f2
	subcc	%l5,	%i0,	%i1
	movne	%xcc,	%o0,	%o1
	fornot1	%f0,	%f22,	%f26
	fnand	%f18,	%f16,	%f6
	fpsub32	%f14,	%f18,	%f28
	fnot1s	%f10,	%f29
	siam	0x1
	movvs	%xcc,	%o5,	%l2
	fnand	%f4,	%f20,	%f16
	pdist	%f28,	%f14,	%f16
	fand	%f16,	%f10,	%f14
	fmovrdlz	%l6,	%f22,	%f12
	save %o7, %l3, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%l1,	%i4
	addcc	%g7,	0x1F7B,	%g1
	smul	%i5,	%o2,	%g4
	sethi	0x19EB,	%o4
	mulx	%o3,	%l4,	%o6
	st	%f14,	[%l7 + 0x74]
	fnegs	%f29,	%f3
	fxnor	%f20,	%f16,	%f14
	edge32l	%i6,	%i2,	%i3
	fcmpgt16	%f24,	%f18,	%g6
	fornot1	%f22,	%f22,	%f28
	udiv	%l0,	0x0862,	%g3
	ldsw	[%l7 + 0x14],	%g5
	fpackfix	%f22,	%f30
	andcc	%l5,	%i0,	%i7
	fnot2	%f22,	%f12
	lduh	[%l7 + 0x36],	%i1
	srlx	%o0,	0x13,	%o1
	st	%f31,	[%l7 + 0x44]
	nop
	set	0x34, %g7
	sth	%o5,	[%l7 + %g7]
	srax	%l2,	0x1C,	%l6
	movgu	%xcc,	%o7,	%g2
	fexpand	%f12,	%f0
	fcmpes	%fcc0,	%f16,	%f19
	movpos	%icc,	%l3,	%l1
	stw	%g7,	[%l7 + 0x78]
	fsrc1	%f28,	%f2
	edge8ln	%g1,	%i5,	%o2
	andcc	%g4,	%o4,	%o3
	movge	%icc,	%l4,	%i4
	ldd	[%l7 + 0x60],	%f28
	fmovsne	%icc,	%f13,	%f3
	sdiv	%i6,	0x1BB0,	%o6
	movg	%xcc,	%i2,	%g6
	edge32	%l0,	%g3,	%g5
	movvs	%icc,	%l5,	%i0
	fmul8x16au	%f20,	%f24,	%f8
	std	%f12,	[%l7 + 0x28]
	smul	%i3,	%i1,	%o0
	orncc	%o1,	%o5,	%l2
	fnot2	%f4,	%f6
	edge8l	%l6,	%i7,	%o7
	edge32l	%l3,	%g2,	%l1
	xnorcc	%g1,	0x0EFF,	%i5
	movgu	%xcc,	%o2,	%g4
	save %o4, %o3, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movle	%icc,	%i4,	%l4
	fmovdg	%icc,	%f2,	%f14
	alignaddr	%o6,	%i2,	%g6
	movvs	%xcc,	%i6,	%g3
	sub	%l0,	%l5,	%g5
	fmovsvc	%xcc,	%f11,	%f6
	movrlez	%i0,	%i1,	%o0
	array16	%i3,	%o1,	%l2
	movrgez	%l6,	0x139,	%o5
	or	%o7,	0x0E73,	%i7
	fcmple32	%f6,	%f14,	%g2
	fmovsgu	%xcc,	%f11,	%f19
	alignaddrl	%l1,	%g1,	%i5
	ldx	[%l7 + 0x20],	%l3
	add	%g4,	%o2,	%o4
	fzero	%f24
	movleu	%icc,	%o3,	%i4
	movcc	%xcc,	%l4,	%g7
	xnor	%i2,	0x0C73,	%g6
	fnot2s	%f10,	%f4
	nop
	set	0x6C, %l5
	ldsh	[%l7 + %l5],	%i6
	ldd	[%l7 + 0x48],	%o6
	sub	%g3,	0x1291,	%l5
	addcc	%l0,	0x112F,	%g5
	fmovsneg	%icc,	%f11,	%f7
	edge16n	%i1,	%o0,	%i3
	movge	%icc,	%i0,	%o1
	fmovspos	%xcc,	%f21,	%f5
	fzero	%f30
	umul	%l6,	0x1331,	%l2
	edge8n	%o7,	%i7,	%o5
	movge	%icc,	%g2,	%l1
	xnor	%i5,	%g1,	%l3
	sdivx	%o2,	0x1C32,	%o4
	xnorcc	%g4,	0x10FE,	%o3
	subc	%l4,	0x120B,	%g7
	fpsub16s	%f9,	%f5,	%f15
	movrgz	%i4,	0x092,	%g6
	udiv	%i2,	0x1E84,	%i6
	fmovdvc	%xcc,	%f19,	%f3
	stw	%g3,	[%l7 + 0x4C]
	sdiv	%l5,	0x09EE,	%l0
	fone	%f8
	edge32	%g5,	%i1,	%o6
	move	%xcc,	%i3,	%o0
	edge8n	%i0,	%o1,	%l2
	array16	%l6,	%i7,	%o7
	ldx	[%l7 + 0x30],	%o5
	andcc	%l1,	%g2,	%i5
	addc	%g1,	%o2,	%l3
	edge16n	%g4,	%o3,	%l4
	mulx	%g7,	0x179B,	%o4
	lduh	[%l7 + 0x6C],	%i4
	edge16l	%g6,	%i6,	%g3
	lduh	[%l7 + 0x1C],	%l5
	fxors	%f4,	%f4,	%f13
	ld	[%l7 + 0x1C],	%f27
	movcs	%icc,	%i2,	%g5
	sir	0x1BF9
	subccc	%i1,	%l0,	%o6
	umulcc	%i3,	%i0,	%o1
	fmuld8ulx16	%f25,	%f1,	%f12
	xnor	%l2,	0x0D33,	%l6
	add	%i7,	0x0123,	%o0
	subc	%o7,	%l1,	%g2
	movpos	%xcc,	%i5,	%o5
	ldsh	[%l7 + 0x36],	%g1
	fzeros	%f0
	faligndata	%f6,	%f22,	%f26
	srax	%o2,	%g4,	%o3
	movrgz	%l3,	0x322,	%l4
	edge8ln	%g7,	%i4,	%g6
	fmovda	%xcc,	%f21,	%f4
	fzero	%f18
	edge16l	%o4,	%g3,	%l5
	edge16n	%i6,	%g5,	%i2
	fexpand	%f20,	%f14
	ldx	[%l7 + 0x78],	%i1
	subc	%l0,	0x1CFA,	%i3
	movgu	%icc,	%o6,	%i0
	xorcc	%o1,	0x09A0,	%l6
	fzero	%f2
	array16	%i7,	%l2,	%o0
	udivx	%l1,	0x00BE,	%o7
	st	%f4,	[%l7 + 0x20]
	save %g2, %i5, %o5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%g1,	%g4,	%o2
	ldd	[%l7 + 0x20],	%o2
	sth	%l4,	[%l7 + 0x44]
	srlx	%g7,	%i4,	%l3
	nop
	set	0x18, %i0
	ldx	[%l7 + %i0],	%g6
	add	%g3,	0x07EA,	%o4
	movre	%i6,	%g5,	%i2
	move	%icc,	%i1,	%l5
	edge32n	%i3,	%o6,	%l0
	fnot2	%f4,	%f10
	fmovdcc	%icc,	%f17,	%f31
	fxor	%f22,	%f10,	%f22
	srax	%i0,	0x12,	%l6
	fpmerge	%f21,	%f24,	%f22
	ldd	[%l7 + 0x78],	%f6
	array8	%o1,	%l2,	%o0
	movgu	%icc,	%i7,	%o7
	edge8n	%l1,	%g2,	%i5
	array32	%o5,	%g1,	%o2
	orn	%o3,	0x1ED5,	%l4
	movg	%xcc,	%g4,	%i4
	alignaddr	%g7,	%g6,	%g3
	movpos	%icc,	%o4,	%l3
	lduw	[%l7 + 0x2C],	%g5
	xnorcc	%i2,	%i1,	%i6
	srlx	%l5,	%i3,	%l0
	nop
	set	0x70, %o4
	sth	%o6,	[%l7 + %o4]
	fmovsneg	%xcc,	%f11,	%f9
	ldub	[%l7 + 0x49],	%i0
	edge8l	%l6,	%l2,	%o0
	save %o1, 0x1B4B, %o7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sllx	%l1,	0x04,	%i7
	nop
	set	0x1F, %i6
	ldub	[%l7 + %i6],	%g2
	smulcc	%o5,	%i5,	%o2
	edge8n	%g1,	%o3,	%g4
	movle	%xcc,	%i4,	%l4
	fcmpes	%fcc3,	%f10,	%f16
	fpsub16s	%f25,	%f18,	%f8
	movleu	%icc,	%g6,	%g7
	ldub	[%l7 + 0x38],	%g3
	fcmpes	%fcc1,	%f23,	%f23
	fmovdvs	%xcc,	%f13,	%f15
	movn	%icc,	%l3,	%o4
	fmovrslz	%i2,	%f3,	%f10
	sethi	0x1853,	%g5
	fandnot2	%f12,	%f8,	%f10
	fmovdl	%icc,	%f9,	%f5
	xnorcc	%i6,	0x140D,	%l5
	save %i1, 0x12E3, %l0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fmovsvc	%icc,	%f15,	%f14
	fnot1s	%f20,	%f18
	edge32n	%i3,	%o6,	%i0
	st	%f31,	[%l7 + 0x14]
	fmovsneg	%xcc,	%f14,	%f25
	stw	%l6,	[%l7 + 0x38]
	stw	%l2,	[%l7 + 0x40]
	fmovdcc	%icc,	%f15,	%f8
	mulx	%o0,	0x12F0,	%o1
	movge	%icc,	%o7,	%i7
	alignaddrl	%l1,	%o5,	%i5
	fmovsl	%icc,	%f13,	%f29
	restore %o2, %g2, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%g4,	%g1,	%i4
	srax	%g6,	%g7,	%g3
	addccc	%l4,	%o4,	%i2
	movge	%icc,	%g5,	%l3
	stx	%i6,	[%l7 + 0x68]
	lduh	[%l7 + 0x6A],	%i1
	sdivx	%l0,	0x1D48,	%l5
	ldd	[%l7 + 0x60],	%o6
	mova	%xcc,	%i3,	%i0
	umulcc	%l6,	0x07E2,	%l2
	udivcc	%o0,	0x1307,	%o7
	addccc	%o1,	%i7,	%l1
	move	%icc,	%i5,	%o2
	fabsd	%f22,	%f2
	sdivx	%o5,	0x0284,	%g2
	sir	0x0C51
	fpadd16s	%f19,	%f9,	%f15
	edge16l	%o3,	%g1,	%i4
	edge16ln	%g6,	%g7,	%g4
	edge32n	%l4,	%g3,	%o4
	orncc	%g5,	0x146E,	%l3
	andncc	%i2,	%i6,	%i1
	nop
	set	0x1D, %g1
	ldsb	[%l7 + %g1],	%l5
	sdivx	%o6,	0x063D,	%l0
	ldx	[%l7 + 0x28],	%i0
	fmovdgu	%icc,	%f7,	%f21
	ldd	[%l7 + 0x28],	%f12
	subccc	%l6,	0x0044,	%i3
	subcc	%l2,	%o7,	%o1
	movneg	%xcc,	%i7,	%o0
	fornot2s	%f0,	%f13,	%f5
	sdivx	%i5,	0x0C96,	%l1
	sdivx	%o5,	0x1BF7,	%g2
	edge16ln	%o3,	%o2,	%g1
	andn	%g6,	%i4,	%g7
	edge8l	%l4,	%g3,	%o4
	array8	%g4,	%l3,	%i2
	movrgez	%g5,	0x184,	%i1
	lduh	[%l7 + 0x66],	%i6
	ld	[%l7 + 0x0C],	%f5
	fmovrslz	%l5,	%f15,	%f9
	fnands	%f21,	%f18,	%f26
	movrne	%o6,	%i0,	%l0
	fxors	%f19,	%f9,	%f27
	smulcc	%i3,	0x03BD,	%l2
	fmovrdne	%o7,	%f8,	%f16
	sub	%l6,	%o1,	%o0
	edge16l	%i7,	%l1,	%i5
	umul	%o5,	0x0DD5,	%o3
	subccc	%o2,	0x1DAC,	%g2
	alignaddrl	%g6,	%g1,	%g7
	xorcc	%l4,	0x026F,	%i4
	sllx	%g3,	%g4,	%l3
	movl	%icc,	%i2,	%g5
	xnorcc	%i1,	%i6,	%l5
	sir	0x0828
	ld	[%l7 + 0x74],	%f10
	edge8l	%o4,	%o6,	%i0
	movcs	%icc,	%l0,	%l2
	std	%f16,	[%l7 + 0x10]
	fcmpne32	%f20,	%f24,	%o7
	edge32	%i3,	%l6,	%o1
	fcmpeq16	%f2,	%f22,	%o0
	sdivcc	%l1,	0x1547,	%i5
	movvs	%icc,	%o5,	%i7
	edge8l	%o3,	%o2,	%g6
	sir	0x0C59
	ldd	[%l7 + 0x68],	%f22
	edge8ln	%g2,	%g7,	%l4
	ldd	[%l7 + 0x58],	%g0
	subccc	%g3,	0x13D1,	%g4
	sdivx	%i4,	0x11C3,	%l3
	xorcc	%i2,	0x1C0B,	%g5
	sdiv	%i1,	0x0C4E,	%i6
	xorcc	%l5,	%o4,	%i0
	fpsub16	%f2,	%f6,	%f14
	orn	%o6,	0x18C9,	%l0
	array8	%l2,	%i3,	%o7
	move	%xcc,	%o1,	%l6
	fmovrsne	%o0,	%f7,	%f7
	sdiv	%l1,	0x1681,	%o5
	udiv	%i7,	0x1376,	%i5
	edge32l	%o2,	%o3,	%g2
	stw	%g6,	[%l7 + 0x08]
	movg	%xcc,	%l4,	%g7
	sdivcc	%g1,	0x171B,	%g4
	fmovdl	%xcc,	%f13,	%f17
	fmovs	%f15,	%f19
	mulscc	%g3,	%i4,	%i2
	udivcc	%g5,	0x00D4,	%i1
	fcmple16	%f26,	%f2,	%i6
	ldd	[%l7 + 0x48],	%l4
	ldub	[%l7 + 0x7B],	%o4
	fmovde	%xcc,	%f1,	%f10
	movcc	%xcc,	%i0,	%l3
	stw	%o6,	[%l7 + 0x6C]
	setx loop_78, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_78: 	faligndata	%f18,	%f18,	%f0
	fmovsgu	%xcc,	%f31,	%f14
	edge32ln	%o1,	%i3,	%l6
	mova	%xcc,	%l1,	%o0
	lduw	[%l7 + 0x1C],	%o5
	edge8n	%i7,	%i5,	%o3
	and	%g2,	%g6,	%l4
	popc	%g7,	%o2
	srl	%g1,	%g3,	%g4
	edge32n	%i2,	%g5,	%i4
	array8	%i6,	%l5,	%i1
	edge16	%i0,	%o4,	%l3
	lduw	[%l7 + 0x14],	%o6
	fandnot1	%f6,	%f24,	%f28
	movpos	%xcc,	%l2,	%l0
	edge32	%o7,	%o1,	%l6
	edge8l	%l1,	%i3,	%o5
	xor	%o0,	0x1A0F,	%i7
	udivx	%i5,	0x1712,	%o3
	sllx	%g2,	%g6,	%l4
	fmul8x16	%f18,	%f28,	%f4
	sllx	%o2,	%g1,	%g7
	srl	%g4,	%i2,	%g5
	srl	%g3,	%i4,	%l5
	stw	%i6,	[%l7 + 0x70]
	fabsd	%f20,	%f18
	movrgz	%i1,	%o4,	%l3
	mova	%xcc,	%i0,	%l2
	addc	%l0,	0x132B,	%o7
	umul	%o1,	0x1C53,	%l6
	udivx	%l1,	0x074B,	%i3
	edge32l	%o5,	%o0,	%i7
	sub	%i5,	%o3,	%g2
	sllx	%o6,	0x07,	%g6
	fmovsge	%icc,	%f16,	%f24
	ldd	[%l7 + 0x38],	%f22
	nop
	set	0x58, %l4
	ldd	[%l7 + %l4],	%l4
	ld	[%l7 + 0x0C],	%f17
	alignaddrl	%g1,	%g7,	%o2
	fmovdle	%icc,	%f23,	%f22
	xnor	%g4,	0x1D27,	%g5
	fmovdcs	%xcc,	%f17,	%f15
	ldub	[%l7 + 0x58],	%i2
	udivx	%i4,	0x00E8,	%l5
	srax	%i6,	%i1,	%o4
	fmovse	%xcc,	%f30,	%f20
	alignaddrl	%g3,	%l3,	%l2
	xorcc	%i0,	%o7,	%l0
	and	%o1,	0x1E4A,	%l1
	orncc	%l6,	0x09A2,	%o5
	sub	%i3,	0x0495,	%i7
	srlx	%o0,	%o3,	%g2
	edge32n	%o6,	%i5,	%g6
	fmovdvs	%xcc,	%f16,	%f15
	sll	%g1,	%g7,	%o2
	array8	%l4,	%g4,	%i2
	movn	%xcc,	%i4,	%l5
	fxnor	%f14,	%f4,	%f22
	udiv	%g5,	0x1B37,	%i6
	array8	%i1,	%o4,	%g3
	fzero	%f6
	fandnot1s	%f5,	%f28,	%f24
	orn	%l2,	%i0,	%o7
	movvc	%xcc,	%l0,	%o1
	edge8ln	%l3,	%l6,	%o5
	fmovdpos	%xcc,	%f26,	%f28
	movvs	%icc,	%l1,	%i3
	popc	%o0,	%i7
	fsrc2	%f28,	%f30
	ldx	[%l7 + 0x18],	%o3
	and	%g2,	0x1A04,	%o6
	movg	%icc,	%i5,	%g6
	addccc	%g7,	0x0134,	%g1
	fmovrdlz	%l4,	%f8,	%f12
	std	%f24,	[%l7 + 0x58]
	xnor	%o2,	%i2,	%i4
	fpadd16	%f14,	%f10,	%f30
	edge8n	%g4,	%l5,	%i6
	ldsb	[%l7 + 0x53],	%g5
	fnot1s	%f14,	%f2
	movrgz	%o4,	%g3,	%l2
	movgu	%xcc,	%i0,	%o7
	ld	[%l7 + 0x54],	%f30
	stw	%i1,	[%l7 + 0x1C]
	lduw	[%l7 + 0x70],	%l0
	srl	%l3,	0x1B,	%o1
	fandnot2	%f4,	%f16,	%f20
	sdivcc	%o5,	0x1C75,	%l6
	sllx	%i3,	%l1,	%o0
	sllx	%i7,	0x1B,	%g2
	xorcc	%o6,	0x1598,	%o3
	ld	[%l7 + 0x48],	%f1
	movneg	%xcc,	%g6,	%i5
	array32	%g7,	%g1,	%o2
	movcc	%xcc,	%i2,	%l4
	udiv	%i4,	0x1221,	%l5
	movle	%xcc,	%i6,	%g5
	popc	0x1FFD,	%o4
	fornot1s	%f28,	%f16,	%f17
	fxnors	%f14,	%f7,	%f12
	and	%g4,	%l2,	%g3
	ldub	[%l7 + 0x12],	%i0
	fcmpgt32	%f30,	%f22,	%o7
	movge	%icc,	%i1,	%l0
	edge32n	%l3,	%o1,	%l6
	sdivcc	%i3,	0x0A76,	%l1
	movge	%icc,	%o5,	%i7
	fmul8sux16	%f30,	%f20,	%f24
	udivx	%g2,	0x08CD,	%o0
	sdivcc	%o6,	0x06BF,	%g6
	orncc	%i5,	0x1841,	%g7
	addccc	%g1,	0x0875,	%o3
	ld	[%l7 + 0x20],	%f28
	ldx	[%l7 + 0x60],	%i2
	edge32l	%l4,	%o2,	%l5
	udiv	%i4,	0x1BA5,	%g5
	sir	0x1B49
	movgu	%xcc,	%o4,	%i6
	ld	[%l7 + 0x50],	%f28
	fandnot1	%f0,	%f28,	%f18
	edge8l	%l2,	%g4,	%g3
	std	%f2,	[%l7 + 0x48]
	alignaddr	%o7,	%i1,	%l0
	fmul8sux16	%f22,	%f30,	%f18
	fmuld8sux16	%f1,	%f5,	%f0
	orn	%l3,	%o1,	%l6
	fandnot2	%f22,	%f20,	%f10
	ldx	[%l7 + 0x20],	%i3
	fmovsle	%xcc,	%f29,	%f3
	andcc	%l1,	0x1841,	%i0
	addc	%i7,	0x17DB,	%g2
	edge32	%o5,	%o6,	%g6
	fpadd32	%f20,	%f2,	%f26
	umulcc	%i5,	0x1D7A,	%o0
	movcc	%icc,	%g1,	%g7
	addc	%i2,	%o3,	%l4
	alignaddrl	%l5,	%o2,	%g5
	st	%f21,	[%l7 + 0x58]
	lduw	[%l7 + 0x20],	%o4
	sethi	0x1C63,	%i4
	movrlez	%i6,	%g4,	%g3
	fpsub32s	%f7,	%f17,	%f5
	movrlz	%l2,	%o7,	%l0
	udivcc	%i1,	0x1130,	%l3
	edge16n	%l6,	%i3,	%o1
	fxnors	%f22,	%f27,	%f6
	fand	%f8,	%f16,	%f26
	orncc	%l1,	0x1763,	%i0
	std	%f4,	[%l7 + 0x20]
	fxor	%f0,	%f16,	%f20
	fpadd32s	%f18,	%f23,	%f5
	srax	%i7,	%g2,	%o6
	or	%o5,	%g6,	%i5
	ldsh	[%l7 + 0x40],	%g1
	fmovscc	%icc,	%f20,	%f12
	for	%f28,	%f28,	%f28
	ldub	[%l7 + 0x5C],	%g7
	andcc	%i2,	%o0,	%l4
	save %o3, 0x0D5B, %l5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stx	%g5,	[%l7 + 0x20]
	lduh	[%l7 + 0x20],	%o2
	fmovsneg	%icc,	%f10,	%f26
	movpos	%xcc,	%o4,	%i6
	fnot2s	%f10,	%f12
	xorcc	%g4,	%g3,	%l2
	add	%i4,	0x17FE,	%l0
	edge8ln	%i1,	%l3,	%l6
	ldx	[%l7 + 0x18],	%o7
	sub	%o1,	%l1,	%i3
	movne	%xcc,	%i0,	%g2
	movneg	%icc,	%o6,	%i7
	std	%f12,	[%l7 + 0x50]
	movre	%o5,	0x067,	%i5
	movn	%icc,	%g1,	%g7
	movcc	%icc,	%i2,	%o0
	fsrc1s	%f10,	%f26
	sub	%g6,	0x064D,	%o3
	orcc	%l5,	%l4,	%o2
	and	%g5,	%o4,	%g4
	movleu	%xcc,	%i6,	%g3
	alignaddr	%i4,	%l0,	%l2
	or	%l3,	%l6,	%o7
	edge32ln	%o1,	%i1,	%l1
	movneg	%xcc,	%i0,	%i3
	fmovdle	%xcc,	%f29,	%f0
	ld	[%l7 + 0x6C],	%f22
	edge32ln	%g2,	%o6,	%o5
	movle	%xcc,	%i7,	%g1
	move	%icc,	%i5,	%g7
	ldd	[%l7 + 0x38],	%f6
	umulcc	%i2,	0x05B4,	%g6
	std	%f24,	[%l7 + 0x08]
	fmovdleu	%icc,	%f0,	%f18
	addc	%o0,	0x0813,	%o3
	fmovrdgz	%l4,	%f14,	%f2
	udivx	%o2,	0x099F,	%l5
	udiv	%o4,	0x0F79,	%g4
	fmovrdgz	%g5,	%f24,	%f4
	sth	%i6,	[%l7 + 0x26]
	edge8n	%g3,	%l0,	%i4
	movle	%xcc,	%l2,	%l6
	movvs	%xcc,	%o7,	%l3
	sll	%o1,	%l1,	%i0
	srax	%i1,	0x05,	%i3
	sth	%g2,	[%l7 + 0x3E]
	nop
	set	0x20, %i2
	std	%f24,	[%l7 + %i2]
	lduh	[%l7 + 0x4E],	%o6
	addcc	%o5,	0x130B,	%g1
	fnegd	%f22,	%f30
	smulcc	%i7,	%g7,	%i5
	nop
	set	0x5E, %l1
	ldub	[%l7 + %l1],	%g6
	movrgz	%o0,	%o3,	%i2
	st	%f5,	[%l7 + 0x54]
	subc	%o2,	%l4,	%l5
	mulx	%g4,	0x1CEE,	%o4
	fmovs	%f9,	%f9
	alignaddrl	%i6,	%g5,	%l0
	fmovrsgez	%g3,	%f27,	%f12
	xnor	%i4,	0x0787,	%l2
	movleu	%icc,	%o7,	%l6
	st	%f17,	[%l7 + 0x10]
	lduh	[%l7 + 0x58],	%o1
	sra	%l1,	%i0,	%l3
	fmovda	%icc,	%f2,	%f16
	movne	%xcc,	%i3,	%g2
	orn	%o6,	%i1,	%o5
	and	%g1,	%i7,	%i5
	or	%g7,	0x18C6,	%o0
	andn	%o3,	%g6,	%i2
	ldub	[%l7 + 0x1F],	%o2
	mulscc	%l5,	0x0042,	%l4
	subc	%o4,	%g4,	%i6
	movn	%xcc,	%g5,	%l0
	sll	%g3,	0x1F,	%i4
	array32	%l2,	%l6,	%o1
	subcc	%l1,	%o7,	%i0
	srax	%i3,	0x0C,	%g2
	edge32n	%o6,	%l3,	%i1
	edge8l	%o5,	%g1,	%i7
	fpsub32	%f16,	%f12,	%f12
	edge32	%g7,	%o0,	%o3
	smulcc	%g6,	0x1F49,	%i2
	fcmpne16	%f20,	%f2,	%o2
	andn	%i5,	%l5,	%l4
	sth	%o4,	[%l7 + 0x24]
	ldsb	[%l7 + 0x11],	%g4
	srlx	%i6,	%g5,	%l0
	fmovsle	%xcc,	%f30,	%f10
	movrgez	%g3,	%l2,	%i4
	sdivcc	%l6,	0x0A39,	%o1
	fmovse	%xcc,	%f12,	%f11
	fmovsn	%icc,	%f28,	%f2
	ldsw	[%l7 + 0x50],	%l1
	andn	%i0,	0x1D2D,	%i3
	std	%f28,	[%l7 + 0x50]
	xnorcc	%o7,	0x09F2,	%o6
	fcmpne16	%f0,	%f16,	%l3
	edge8ln	%i1,	%o5,	%g2
	fcmpd	%fcc0,	%f18,	%f12
	fmovda	%xcc,	%f26,	%f7
	ldx	[%l7 + 0x60],	%i7
	movne	%icc,	%g7,	%o0
	ldd	[%l7 + 0x78],	%f28
	orn	%o3,	0x135A,	%g6
	subcc	%i2,	0x053D,	%g1
	movge	%icc,	%i5,	%l5
	edge32n	%l4,	%o2,	%g4
	fmovd	%f10,	%f22
	array8	%i6,	%o4,	%g5
	fmovdge	%icc,	%f10,	%f1
	sir	0x10EE
	stw	%l0,	[%l7 + 0x68]
	fmovrdlz	%l2,	%f30,	%f30
	xorcc	%i4,	%g3,	%o1
	siam	0x2
	fpmerge	%f26,	%f9,	%f24
	restore %l1, 0x0949, %i0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	nop
	set	0x20, %o0
	ldx	[%l7 + %o0],	%i3
	movrgez	%l6,	0x1D1,	%o7
	umul	%o6,	0x0896,	%i1
	mulx	%o5,	%g2,	%l3
	fmovsleu	%xcc,	%f6,	%f31
	or	%g7,	%o0,	%i7
	fsrc1	%f2,	%f2
	movneg	%xcc,	%o3,	%g6
	fmovdle	%xcc,	%f3,	%f11
	alignaddr	%i2,	%g1,	%l5
	bshuffle	%f24,	%f28,	%f0
	movrne	%l4,	0x0BA,	%o2
	fandnot1s	%f15,	%f13,	%f16
	xnor	%g4,	%i5,	%o4
	ldx	[%l7 + 0x50],	%g5
	sethi	0x1C47,	%i6
	movvs	%xcc,	%l2,	%i4
	fornot1s	%f28,	%f21,	%f15
	addc	%g3,	%o1,	%l0
	fabss	%f23,	%f20
	movge	%icc,	%l1,	%i0
	smul	%l6,	%o7,	%i3
	fxnor	%f14,	%f8,	%f18
	std	%f26,	[%l7 + 0x50]
	orncc	%o6,	%o5,	%i1
	fmul8x16al	%f15,	%f22,	%f8
	sub	%g2,	%l3,	%g7
	and	%o0,	%i7,	%o3
	movvs	%xcc,	%g6,	%i2
	ldd	[%l7 + 0x50],	%f18
	sllx	%l5,	%l4,	%o2
	edge16	%g1,	%i5,	%o4
	addc	%g4,	0x0BE3,	%i6
	fcmpeq32	%f10,	%f0,	%l2
	udivcc	%g5,	0x047B,	%i4
	edge8n	%o1,	%l0,	%g3
	sth	%i0,	[%l7 + 0x0A]
	sth	%l6,	[%l7 + 0x48]
	edge32	%o7,	%l1,	%o6
	sdiv	%i3,	0x0BA2,	%i1
	orcc	%o5,	0x0B71,	%l3
	fpsub32	%f24,	%f0,	%f22
	movleu	%icc,	%g7,	%g2
	alignaddrl	%o0,	%i7,	%o3
	movvs	%xcc,	%g6,	%i2
	ldub	[%l7 + 0x20],	%l4
	popc	%o2,	%l5
	fmovrsgz	%i5,	%f10,	%f24
	movl	%icc,	%g1,	%g4
	movleu	%icc,	%o4,	%i6
	fmovrsgez	%g5,	%f22,	%f4
	movrne	%l2,	0x14B,	%o1
	fcmpd	%fcc0,	%f10,	%f24
	edge32ln	%i4,	%l0,	%i0
	fcmple32	%f8,	%f8,	%g3
	andn	%l6,	%o7,	%o6
	fcmple16	%f12,	%f30,	%l1
	srlx	%i1,	%o5,	%i3
	addcc	%g7,	0x183B,	%g2
	fcmped	%fcc1,	%f20,	%f14
	edge16l	%o0,	%l3,	%o3
	movrlez	%g6,	%i2,	%i7
	sra	%o2,	%l4,	%i5
	addc	%l5,	0x1B1C,	%g4
	ldsw	[%l7 + 0x18],	%o4
	mova	%xcc,	%i6,	%g5
	movvc	%icc,	%l2,	%g1
	movne	%xcc,	%i4,	%l0
	fsrc2s	%f3,	%f30
	fmovrdne	%o1,	%f6,	%f28
	ld	[%l7 + 0x7C],	%f28
	fcmpne32	%f16,	%f26,	%i0
	addcc	%l6,	0x1517,	%g3
	fnot2	%f0,	%f18
	movg	%xcc,	%o7,	%l1
	udivcc	%i1,	0x06A8,	%o5
	smul	%i3,	0x1D2A,	%g7
	ldsh	[%l7 + 0x70],	%o6
	sra	%g2,	%o0,	%l3
	faligndata	%f18,	%f2,	%f30
	fandnot2	%f14,	%f8,	%f28
	umul	%o3,	0x0DDD,	%i2
	fmovdgu	%xcc,	%f13,	%f11
	ldx	[%l7 + 0x38],	%i7
	fpadd16s	%f27,	%f28,	%f26
	save %g6, 0x1F82, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%o2,	%l5
	nop
	set	0x36, %i5
	sth	%g4,	[%l7 + %i5]
	mova	%xcc,	%i5,	%o4
	srl	%g5,	0x1A,	%l2
	fxors	%f26,	%f9,	%f22
	ldd	[%l7 + 0x50],	%i6
	addc	%g1,	0x131D,	%i4
	add	%o1,	0x19A2,	%i0
	movpos	%xcc,	%l6,	%l0
	xorcc	%o7,	%g3,	%l1
	fmovdgu	%icc,	%f7,	%f21
	fmovdpos	%icc,	%f1,	%f13
	umul	%o5,	0x1C2E,	%i3
	fmuld8sux16	%f22,	%f3,	%f8
	fxors	%f4,	%f9,	%f6
	movneg	%xcc,	%i1,	%g7
	array8	%o6,	%o0,	%l3
	edge16	%g2,	%i2,	%o3
	movle	%xcc,	%i7,	%l4
	andcc	%g6,	0x0866,	%o2
	fnegs	%f10,	%f27
	fornot1	%f18,	%f30,	%f18
	smulcc	%l5,	0x0509,	%g4
	stw	%o4,	[%l7 + 0x58]
	ld	[%l7 + 0x0C],	%f26
	udiv	%g5,	0x1C53,	%l2
	nop
	set	0x70, %g3
	ldx	[%l7 + %g3],	%i6
	mova	%icc,	%g1,	%i5
	movpos	%xcc,	%i4,	%o1
	add	%i0,	%l0,	%l6
	edge32ln	%g3,	%l1,	%o7
	movne	%xcc,	%i3,	%i1
	fnors	%f10,	%f25,	%f11
	save %o5, 0x0988, %o6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movrlez	%g7,	%l3,	%g2
	stw	%i2,	[%l7 + 0x4C]
	ldub	[%l7 + 0x0F],	%o3
	movge	%xcc,	%o0,	%i7
	add	%l4,	%o2,	%g6
	movre	%l5,	%g4,	%g5
	sra	%l2,	%o4,	%i6
	movrgz	%i5,	%g1,	%o1
	andcc	%i4,	%i0,	%l6
	setx loop_79, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_79: 	array8	%l1,	%i1,	%o5
	fmovd	%f26,	%f24
	fmovsg	%icc,	%f10,	%f29
	bshuffle	%f30,	%f14,	%f2
	edge16l	%o6,	%g7,	%l3
	movne	%xcc,	%g2,	%i2
	andcc	%o3,	%o0,	%i3
	sdiv	%i7,	0x00FF,	%o2
	sllx	%g6,	%l4,	%l5
	fpsub32	%f0,	%f0,	%f24
	sth	%g5,	[%l7 + 0x26]
	stx	%g4,	[%l7 + 0x20]
	xorcc	%l2,	0x001A,	%o4
	movrlz	%i6,	%i5,	%g1
	edge16	%i4,	%i0,	%l6
	or	%o1,	0x0BA9,	%l0
	movleu	%icc,	%g3,	%l1
	udiv	%o7,	0x10C3,	%o5
	movrgz	%i1,	0x27D,	%g7
	movn	%xcc,	%o6,	%g2
	fmovdne	%xcc,	%f14,	%f12
	popc	%l3,	%i2
	edge32n	%o3,	%o0,	%i3
	andcc	%i7,	0x0AD3,	%o2
	xorcc	%g6,	0x1382,	%l4
	fmovsl	%xcc,	%f4,	%f21
	sir	0x0B1D
	smul	%g5,	%l5,	%l2
	movrlz	%g4,	0x195,	%o4
	ldsb	[%l7 + 0x5F],	%i6
	fpackfix	%f4,	%f10
	edge8	%g1,	%i4,	%i0
	addc	%l6,	0x16AD,	%i5
	sdiv	%l0,	0x1617,	%g3
	sdivx	%l1,	0x07AA,	%o1
	sdiv	%o7,	0x18E3,	%i1
	fpack32	%f22,	%f28,	%f8
	movn	%icc,	%o5,	%g7
	sub	%o6,	%l3,	%g2
	fmovrsne	%o3,	%f31,	%f25
	srax	%o0,	%i3,	%i7
	fands	%f28,	%f1,	%f21
	fmovdl	%xcc,	%f10,	%f4
	andncc	%i2,	%o2,	%g6
	fmovsle	%icc,	%f5,	%f12
	fmovrde	%l4,	%f26,	%f18
	edge8l	%g5,	%l5,	%g4
	fmovrsgez	%l2,	%f28,	%f0
	mulscc	%i6,	0x035E,	%g1
	movpos	%icc,	%o4,	%i0
	xor	%i4,	%l6,	%l0
	and	%g3,	0x0944,	%l1
	srl	%o1,	%o7,	%i5
	movrne	%o5,	%g7,	%i1
	fmovdneg	%xcc,	%f22,	%f8
	sir	0x12F0
	movle	%xcc,	%l3,	%g2
	subcc	%o6,	%o0,	%i3
	fzero	%f18
	ldd	[%l7 + 0x60],	%f22
	movcs	%xcc,	%i7,	%o3
	st	%f3,	[%l7 + 0x54]
	sub	%i2,	0x1B31,	%o2
	lduh	[%l7 + 0x3A],	%g6
	sub	%g5,	0x1022,	%l4
	edge8	%g4,	%l2,	%i6
	edge32	%g1,	%o4,	%l5
	fmovdvc	%xcc,	%f27,	%f23
	addcc	%i0,	0x0517,	%l6
	sethi	0x0D5F,	%l0
	fpadd16s	%f30,	%f7,	%f6
	andn	%g3,	%i4,	%l1
	fmovdcs	%icc,	%f31,	%f23
	ldsw	[%l7 + 0x40],	%o7
	movge	%icc,	%i5,	%o5
	array8	%o1,	%i1,	%g7
	subcc	%l3,	%g2,	%o6
	xnor	%o0,	%i3,	%o3
	xnor	%i7,	0x0187,	%i2
	movl	%icc,	%g6,	%g5
	movle	%icc,	%l4,	%o2
	movvc	%xcc,	%g4,	%l2
	sdivcc	%g1,	0x0A38,	%o4
	or	%i6,	0x1D1A,	%l5
	std	%f14,	[%l7 + 0x78]
	array16	%l6,	%i0,	%l0
	fcmpes	%fcc3,	%f20,	%f15
	smul	%g3,	0x05F4,	%i4
	alignaddr	%o7,	%i5,	%l1
	andncc	%o1,	%i1,	%o5
	srax	%g7,	0x06,	%l3
	udivcc	%g2,	0x1179,	%o6
	edge8l	%o0,	%o3,	%i7
	std	%f0,	[%l7 + 0x30]
	fxor	%f20,	%f28,	%f14
	sdiv	%i3,	0x0582,	%i2
	fcmps	%fcc3,	%f9,	%f10
	fabss	%f13,	%f15
	udivcc	%g5,	0x058A,	%g6
	subcc	%l4,	0x18AF,	%o2
	ldx	[%l7 + 0x78],	%g4
	mova	%xcc,	%g1,	%o4
	movcs	%icc,	%i6,	%l5
	stb	%l2,	[%l7 + 0x33]
	movne	%xcc,	%i0,	%l6
	fmuld8ulx16	%f3,	%f18,	%f10
	fmovrsgez	%l0,	%f10,	%f11
	fmovdgu	%xcc,	%f18,	%f13
	edge32n	%i4,	%o7,	%i5
	sra	%g3,	%l1,	%i1
	fpadd16s	%f12,	%f3,	%f8
	subc	%o1,	0x048C,	%g7
	lduw	[%l7 + 0x28],	%o5
	udivx	%g2,	0x0513,	%l3
	stb	%o0,	[%l7 + 0x09]
	xor	%o3,	0x11FE,	%o6
	fmul8x16au	%f23,	%f1,	%f6
	edge8l	%i3,	%i7,	%i2
	sdivcc	%g5,	0x0EBC,	%l4
	udivx	%o2,	0x0B14,	%g4
	movrne	%g6,	%o4,	%i6
	ldx	[%l7 + 0x48],	%l5
	subccc	%l2,	%i0,	%g1
	edge16	%l0,	%i4,	%o7
	udivcc	%i5,	0x1382,	%l6
	movcc	%icc,	%g3,	%l1
	and	%o1,	0x079B,	%g7
	sth	%o5,	[%l7 + 0x5A]
	fmovrdlez	%i1,	%f24,	%f6
	srax	%g2,	0x11,	%l3
	udivcc	%o0,	0x1B4E,	%o3
	fmovrslez	%o6,	%f18,	%f30
	smul	%i7,	%i3,	%g5
	popc	0x17F7,	%l4
	edge8ln	%o2,	%i2,	%g4
	sllx	%o4,	%g6,	%i6
	lduh	[%l7 + 0x14],	%l5
	mova	%xcc,	%l2,	%i0
	fmovrse	%g1,	%f9,	%f29
	srlx	%l0,	0x14,	%i4
	srlx	%i5,	0x13,	%o7
	popc	0x1B97,	%g3
	fpackfix	%f8,	%f18
	sdivx	%l1,	0x0FC0,	%l6
	and	%g7,	0x002E,	%o1
	pdist	%f8,	%f22,	%f28
	fzeros	%f9
	movrne	%o5,	%i1,	%g2
	orncc	%o0,	%l3,	%o3
	for	%f12,	%f26,	%f0
	edge32ln	%o6,	%i3,	%g5
	movcc	%icc,	%i7,	%o2
	alignaddrl	%i2,	%l4,	%g4
	addccc	%g6,	0x182B,	%i6
	smulcc	%l5,	0x1A3F,	%o4
	movg	%xcc,	%i0,	%l2
	umul	%l0,	%g1,	%i5
	movgu	%icc,	%i4,	%g3
	edge8	%o7,	%l6,	%l1
	movrne	%o1,	0x239,	%o5
	stb	%i1,	[%l7 + 0x42]
	movrlez	%g7,	0x209,	%o0
	srl	%g2,	0x11,	%l3
	fpsub16s	%f17,	%f7,	%f22
	orcc	%o3,	0x10E3,	%i3
	sir	0x161C
	ldub	[%l7 + 0x21],	%g5
	fandnot2s	%f30,	%f2,	%f16
	udivx	%o6,	0x1FFE,	%o2
	udivcc	%i7,	0x1885,	%i2
	fxnors	%f19,	%f24,	%f3
	sdivx	%l4,	0x0DD0,	%g6
	edge16	%g4,	%l5,	%i6
	add	%o4,	0x04B0,	%l2
	sll	%i0,	%g1,	%i5
	movpos	%xcc,	%i4,	%l0
	movrgez	%g3,	%o7,	%l1
	mova	%xcc,	%o1,	%l6
	movn	%icc,	%i1,	%g7
	movvc	%xcc,	%o0,	%o5
	fmovrslz	%l3,	%f30,	%f31
	sethi	0x1EE2,	%o3
	movge	%xcc,	%i3,	%g5
	alignaddr	%o6,	%g2,	%i7
	fpadd16s	%f4,	%f3,	%f30
	edge16n	%o2,	%l4,	%i2
	srlx	%g4,	0x0B,	%g6
	umulcc	%l5,	0x03CF,	%o4
	fnors	%f14,	%f21,	%f18
	movrlez	%l2,	%i0,	%g1
	edge8	%i6,	%i4,	%l0
	xorcc	%g3,	0x1301,	%o7
	movrne	%l1,	0x024,	%o1
	addc	%l6,	%i5,	%i1
	sub	%o0,	%g7,	%o5
	movvs	%icc,	%o3,	%l3
	movneg	%xcc,	%i3,	%o6
	addcc	%g2,	0x1D0B,	%i7
	smulcc	%g5,	0x19A6,	%o2
	fmuld8ulx16	%f14,	%f31,	%f2
	std	%f24,	[%l7 + 0x08]
	xorcc	%i2,	%g4,	%g6
	fmuld8sux16	%f21,	%f17,	%f16
	sub	%l4,	0x16F4,	%o4
	subcc	%l5,	%l2,	%i0
	fsrc1s	%f11,	%f4
	subc	%g1,	0x0CED,	%i4
	ldsb	[%l7 + 0x27],	%i6
	andcc	%g3,	0x1713,	%o7
	movne	%icc,	%l1,	%l0
	fcmps	%fcc1,	%f18,	%f13
	fmovdl	%xcc,	%f16,	%f6
	movrgez	%l6,	0x0C3,	%i5
	array8	%o1,	%i1,	%o0
	ldub	[%l7 + 0x52],	%g7
	movvc	%xcc,	%o5,	%o3
	sdivcc	%i3,	0x02E2,	%o6
	srl	%g2,	0x13,	%i7
	xor	%l3,	%g5,	%o2
	addc	%g4,	0x1A13,	%g6
	movl	%xcc,	%i2,	%l4
	edge8	%l5,	%o4,	%l2
	subcc	%i0,	%g1,	%i4
	umul	%g3,	%o7,	%i6
	umulcc	%l0,	0x170D,	%l6
	udivcc	%i5,	0x0EF6,	%l1
	fmovsge	%xcc,	%f25,	%f27
	sdivcc	%i1,	0x125B,	%o0
	movn	%xcc,	%g7,	%o1
	xorcc	%o5,	0x1383,	%o3
	stw	%o6,	[%l7 + 0x40]
	movgu	%icc,	%i3,	%g2
	xor	%i7,	0x1A83,	%l3
	edge8ln	%o2,	%g4,	%g6
	subcc	%i2,	%g5,	%l4
	xor	%o4,	0x114C,	%l2
	ldd	[%l7 + 0x70],	%f6
	smulcc	%l5,	0x18DA,	%i0
	ldsb	[%l7 + 0x2B],	%g1
	movrlez	%i4,	%g3,	%o7
	movrgez	%l0,	0x0E1,	%l6
	and	%i5,	%i6,	%l1
	xnor	%o0,	0x111E,	%i1
	sdivx	%o1,	0x096A,	%o5
	ldub	[%l7 + 0x69],	%g7
	orn	%o3,	%o6,	%g2
	fnegs	%f9,	%f17
	andn	%i7,	0x0786,	%i3
	edge8n	%o2,	%l3,	%g4
	movvs	%icc,	%g6,	%i2
	udivcc	%l4,	0x0173,	%g5
	movcs	%xcc,	%o4,	%l2
	movpos	%xcc,	%l5,	%i0
	lduh	[%l7 + 0x68],	%g1
	srax	%g3,	0x02,	%o7
	subc	%l0,	0x0AF4,	%i4
	srlx	%l6,	0x06,	%i5
	sub	%l1,	0x09A8,	%i6
	fmovsvc	%icc,	%f10,	%f28
	fnands	%f0,	%f6,	%f23
	ld	[%l7 + 0x34],	%f14
	smulcc	%i1,	0x0651,	%o0
	ldx	[%l7 + 0x08],	%o5
	movgu	%icc,	%g7,	%o1
	fcmpeq32	%f4,	%f20,	%o6
	orn	%g2,	0x15AF,	%i7
	fmovdne	%icc,	%f0,	%f3
	fmul8sux16	%f22,	%f0,	%f2
	addcc	%o3,	0x1430,	%o2
	ldsb	[%l7 + 0x5B],	%l3
	andcc	%i3,	%g6,	%i2
	add	%g4,	%g5,	%l4
	sethi	0x01A3,	%l2
	ldsh	[%l7 + 0x3C],	%l5
	move	%xcc,	%i0,	%o4
	st	%f7,	[%l7 + 0x50]
	fmovdne	%icc,	%f3,	%f2
	umul	%g1,	%o7,	%g3
	smulcc	%l0,	0x19A6,	%l6
	addc	%i4,	0x0965,	%l1
	ldd	[%l7 + 0x40],	%f26
	movn	%icc,	%i6,	%i5
	fpsub16s	%f7,	%f2,	%f19
	fmovrsgez	%o0,	%f2,	%f22
	lduh	[%l7 + 0x32],	%i1
	movrgez	%g7,	0x348,	%o5
	sub	%o6,	%o1,	%g2
	ldub	[%l7 + 0x4C],	%i7
	xnor	%o3,	%l3,	%o2
	ld	[%l7 + 0x24],	%f22
	movle	%xcc,	%i3,	%i2
	xnor	%g6,	0x192E,	%g5
	movn	%icc,	%l4,	%g4
	ldx	[%l7 + 0x38],	%l2
	movrgez	%i0,	0x155,	%o4
	fmuld8sux16	%f1,	%f15,	%f8
	movne	%xcc,	%l5,	%g1
	fors	%f31,	%f17,	%f1
	fmovdneg	%icc,	%f7,	%f27
	fmovsne	%icc,	%f17,	%f26
	edge16n	%g3,	%l0,	%o7
	stw	%l6,	[%l7 + 0x2C]
	lduw	[%l7 + 0x7C],	%i4
	ldd	[%l7 + 0x28],	%i6
	edge32l	%l1,	%o0,	%i1
	fpadd32s	%f28,	%f30,	%f22
	fzeros	%f9
	movrlez	%g7,	%o5,	%o6
	edge32	%o1,	%g2,	%i5
	movrne	%i7,	0x168,	%o3
	fexpand	%f26,	%f20
	edge8l	%l3,	%i3,	%i2
	udivcc	%g6,	0x002E,	%g5
	ld	[%l7 + 0x5C],	%f30
	fornot1s	%f18,	%f21,	%f15
	ldd	[%l7 + 0x60],	%o2
	fzeros	%f3
	mulscc	%l4,	%g4,	%l2
	fmovdn	%xcc,	%f0,	%f8
	subcc	%o4,	0x0825,	%i0
	edge8	%g1,	%l5,	%g3
	ld	[%l7 + 0x44],	%f17
	addc	%o7,	%l0,	%i4
	edge8ln	%i6,	%l1,	%o0
	movge	%icc,	%l6,	%i1
	movcc	%xcc,	%g7,	%o6
	edge16l	%o1,	%g2,	%i5
	fmovs	%f1,	%f3
	or	%o5,	%o3,	%i7
	alignaddr	%i3,	%l3,	%g6
	xorcc	%i2,	%o2,	%l4
	xorcc	%g4,	0x174A,	%l2
	edge16	%g5,	%o4,	%g1
	fpsub16s	%f31,	%f9,	%f11
	ldsh	[%l7 + 0x54],	%l5
	edge8	%i0,	%g3,	%l0
	move	%icc,	%o7,	%i4
	movpos	%icc,	%l1,	%i6
	subcc	%l6,	%i1,	%g7
	movge	%icc,	%o0,	%o6
	andn	%o1,	%g2,	%i5
	fnegs	%f21,	%f24
	subccc	%o3,	%o5,	%i3
	stw	%i7,	[%l7 + 0x20]
	fmovdne	%icc,	%f16,	%f23
	edge32	%g6,	%i2,	%o2
	sdiv	%l3,	0x03D4,	%l4
	ldd	[%l7 + 0x30],	%g4
	fmovdle	%icc,	%f25,	%f20
	movn	%xcc,	%g5,	%o4
	movneg	%xcc,	%l2,	%l5
	movgu	%icc,	%g1,	%g3
	mulscc	%l0,	0x180B,	%o7
	movl	%icc,	%i4,	%i0
	movcc	%icc,	%i6,	%l6
	fmul8x16	%f4,	%f14,	%f8
	sllx	%l1,	0x1F,	%g7
	fmovrdne	%i1,	%f12,	%f14
	movvc	%icc,	%o0,	%o6
	orncc	%g2,	%i5,	%o1
	movrgz	%o5,	%o3,	%i3
	edge8n	%i7,	%i2,	%g6
	ldsh	[%l7 + 0x74],	%l3
	fmovdg	%icc,	%f13,	%f24
	array32	%o2,	%l4,	%g5
	ldsb	[%l7 + 0x08],	%g4
	edge16l	%l2,	%o4,	%l5
	pdist	%f22,	%f26,	%f24
	udivcc	%g1,	0x182F,	%g3
	movneg	%icc,	%o7,	%i4
	udivx	%i0,	0x082E,	%i6
	popc	0x1294,	%l6
	std	%f4,	[%l7 + 0x50]
	save %l1, %l0, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%xcc,	%g7,	%o6
	fmovscs	%xcc,	%f27,	%f31
	umul	%o0,	%g2,	%o1
	smul	%o5,	%o3,	%i3
	ld	[%l7 + 0x68],	%f19
	bshuffle	%f14,	%f14,	%f14
	restore %i7, %i2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	save %g6, %l3, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%l4,	%g4,	%g5
	std	%f8,	[%l7 + 0x10]
	subc	%l2,	0x12A4,	%o4
	fsrc2s	%f9,	%f0
	andncc	%g1,	%g3,	%l5
	popc	%i4,	%i0
	sra	%i6,	0x0B,	%l6
	xnorcc	%o7,	%l1,	%i1
	movleu	%icc,	%l0,	%o6
	ldd	[%l7 + 0x60],	%o0
	fmovdn	%xcc,	%f29,	%f19
	movge	%xcc,	%g7,	%o1
	alignaddrl	%o5,	%g2,	%o3
	lduh	[%l7 + 0x2E],	%i3
	sra	%i2,	0x1C,	%i5
	ldsh	[%l7 + 0x08],	%g6
	edge16ln	%l3,	%i7,	%o2
	sra	%g4,	0x09,	%l4
	sdiv	%g5,	0x01DC,	%o4
	movle	%icc,	%g1,	%l2
	stx	%g3,	[%l7 + 0x38]
	smul	%l5,	%i0,	%i6
	fmovsneg	%icc,	%f19,	%f29
	fxor	%f14,	%f18,	%f28
	fmovrdne	%l6,	%f20,	%f22
	movvc	%xcc,	%i4,	%l1
	fmovscs	%icc,	%f28,	%f20
	nop
	set	0x18, %i3
	ldub	[%l7 + %i3],	%o7
	fcmped	%fcc1,	%f30,	%f28
	umulcc	%l0,	0x0773,	%i1
	setx loop_80, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_80: 	lduh	[%l7 + 0x28],	%g7
	fands	%f0,	%f20,	%f13
	srl	%o1,	0x04,	%g2
	restore %o5, %i3, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%i2,	0x0C36,	%g6
	sub	%l3,	0x1281,	%i5
	movgu	%xcc,	%o2,	%g4
	andn	%i7,	%g5,	%l4
	and	%o4,	0x1F0F,	%g1
	edge16n	%l2,	%l5,	%g3
	lduw	[%l7 + 0x6C],	%i0
	sdivx	%i6,	0x0702,	%i4
	lduh	[%l7 + 0x48],	%l6
	movvc	%icc,	%o7,	%l1
	edge32l	%l0,	%i1,	%o0
	fmovdl	%icc,	%f29,	%f12
	movrne	%g7,	%o6,	%g2
	lduw	[%l7 + 0x40],	%o5
	orncc	%i3,	%o1,	%i2
	fornot2	%f18,	%f26,	%f20
	xor	%g6,	0x0925,	%o3
	save %l3, %o2, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	udivx	%g4,	0x125F,	%i7
	fmovsvs	%icc,	%f30,	%f31
	movre	%l4,	0x14A,	%o4
	fmovrdlez	%g1,	%f12,	%f14
	movneg	%xcc,	%l2,	%l5
	andn	%g3,	0x04C7,	%i0
	udivx	%g5,	0x0C14,	%i6
	edge32	%i4,	%l6,	%o7
	lduw	[%l7 + 0x1C],	%l0
	fpadd16s	%f27,	%f13,	%f22
	movre	%l1,	0x162,	%o0
	fmul8x16	%f13,	%f26,	%f12
	movcs	%icc,	%g7,	%i1
	smulcc	%g2,	%o6,	%o5
	fmovd	%f12,	%f22
	srax	%i3,	%i2,	%g6
	movl	%xcc,	%o1,	%o3
	popc	0x0C53,	%o2
	sth	%i5,	[%l7 + 0x7C]
	fxors	%f24,	%f4,	%f6
	fmovsleu	%icc,	%f16,	%f20
	movrne	%g4,	%l3,	%l4
	lduw	[%l7 + 0x64],	%i7
	array8	%o4,	%l2,	%g1
	setx loop_81, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_81: 	movre	%g5,	%i6,	%l6
	sll	%o7,	%l0,	%l1
	sdivcc	%o0,	0x1B10,	%g7
	edge8	%i1,	%g2,	%o6
	stb	%i4,	[%l7 + 0x2D]
	subcc	%o5,	%i3,	%i2
	sdiv	%g6,	0x1E74,	%o1
	subccc	%o2,	%i5,	%g4
	udivx	%o3,	0x1848,	%l4
	array32	%i7,	%l3,	%o4
	andncc	%g1,	%l2,	%l5
	alignaddrl	%i0,	%g5,	%g3
	fxnors	%f16,	%f19,	%f21
	array32	%i6,	%l6,	%o7
	ld	[%l7 + 0x14],	%f1
	subccc	%l0,	0x1B2F,	%l1
	sdiv	%o0,	0x1BE2,	%g7
	add	%g2,	%o6,	%i1
	edge8l	%i4,	%o5,	%i2
	edge16ln	%i3,	%o1,	%o2
	array16	%i5,	%g6,	%g4
	udiv	%l4,	0x165E,	%o3
	ldsh	[%l7 + 0x12],	%l3
	movne	%icc,	%i7,	%o4
	movcc	%xcc,	%g1,	%l5
	fcmpeq16	%f26,	%f6,	%l2
	fmovrsgz	%g5,	%f13,	%f25
	edge32l	%i0,	%g3,	%i6
	sth	%o7,	[%l7 + 0x22]
	add	%l6,	%l0,	%l1
	fxors	%f31,	%f11,	%f22
	ldx	[%l7 + 0x60],	%g7
	sir	0x1E15
	subccc	%o0,	%g2,	%i1
	xnor	%o6,	0x12C8,	%o5
	mulscc	%i2,	0x0570,	%i4
	sir	0x0D09
	fsrc2s	%f22,	%f21
	edge16	%o1,	%o2,	%i5
	addccc	%i3,	%g6,	%l4
	movvs	%icc,	%g4,	%l3
	andncc	%o3,	%i7,	%g1
	xorcc	%l5,	%l2,	%o4
	subccc	%g5,	0x1FA3,	%i0
	std	%f12,	[%l7 + 0x08]
	movvs	%xcc,	%i6,	%o7
	fabsd	%f2,	%f26
	fnegs	%f21,	%f22
	orcc	%g3,	%l6,	%l1
	fmovsl	%xcc,	%f27,	%f6
	edge16n	%l0,	%o0,	%g7
	fpack16	%f22,	%f5
	fsrc2s	%f26,	%f15
	sllx	%i1,	0x17,	%o6
	fpmerge	%f0,	%f13,	%f0
	fnegs	%f19,	%f2
	ldub	[%l7 + 0x39],	%g2
	fornot2	%f22,	%f10,	%f0
	fmovsleu	%icc,	%f8,	%f21
	movre	%i2,	%o5,	%i4
	xnorcc	%o2,	0x1AB1,	%o1
	alignaddr	%i5,	%i3,	%l4
	movge	%icc,	%g4,	%g6
	movcs	%xcc,	%o3,	%i7
	mova	%icc,	%g1,	%l5
	sdivx	%l2,	0x1133,	%o4
	fmul8x16au	%f8,	%f13,	%f4
	movrne	%g5,	0x046,	%i0
	stw	%l3,	[%l7 + 0x64]
	movre	%i6,	0x15D,	%o7
	fexpand	%f22,	%f16
	movle	%xcc,	%l6,	%g3
	fmovdg	%xcc,	%f6,	%f21
	srl	%l1,	%o0,	%g7
	add	%i1,	%l0,	%o6
	subcc	%i2,	%o5,	%g2
	xnor	%o2,	0x053A,	%i4
	movre	%o1,	0x08A,	%i5
	fmovrslz	%i3,	%f0,	%f9
	movrgez	%g4,	%l4,	%o3
	or	%i7,	0x0188,	%g1
	fmul8ulx16	%f4,	%f16,	%f18
	fandnot1s	%f28,	%f10,	%f7
	mulscc	%g6,	0x0903,	%l2
	ldsw	[%l7 + 0x0C],	%o4
	fmovrse	%g5,	%f24,	%f9
	array16	%i0,	%l3,	%l5
	or	%o7,	%i6,	%l6
	std	%f24,	[%l7 + 0x68]
	srax	%g3,	%o0,	%g7
	movg	%xcc,	%l1,	%l0
	movle	%icc,	%o6,	%i2
	array16	%o5,	%i1,	%o2
	orcc	%i4,	0x02E9,	%g2
	mova	%xcc,	%o1,	%i5
	movrgz	%g4,	0x376,	%l4
	sdivcc	%o3,	0x1B78,	%i3
	lduh	[%l7 + 0x72],	%g1
	xor	%i7,	0x1685,	%l2
	fmul8ulx16	%f0,	%f8,	%f2
	xnor	%g6,	%g5,	%i0
	fnors	%f8,	%f20,	%f3
	stx	%l3,	[%l7 + 0x48]
	edge16	%o4,	%o7,	%l5
	andcc	%l6,	%i6,	%o0
	movrlez	%g3,	%g7,	%l1
	stb	%o6,	[%l7 + 0x41]
	restore %l0, %i2, %i1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	subccc	%o2,	%i4,	%g2
	alignaddrl	%o5,	%i5,	%g4
	edge8n	%l4,	%o3,	%i3
	fcmps	%fcc1,	%f18,	%f25
	edge16n	%o1,	%g1,	%l2
	movcc	%icc,	%g6,	%i7
	sdivx	%i0,	0x03B5,	%g5
	edge16ln	%o4,	%o7,	%l5
	xnor	%l3,	0x17FD,	%i6
	smulcc	%o0,	0x038F,	%l6
	xnorcc	%g7,	%g3,	%o6
	mulx	%l1,	0x1A3F,	%l0
	fmovrse	%i1,	%f31,	%f24
	addc	%o2,	0x1612,	%i2
	fmovscc	%xcc,	%f4,	%f8
	fpsub16s	%f8,	%f16,	%f26
	lduh	[%l7 + 0x58],	%i4
	edge8l	%o5,	%i5,	%g4
	movle	%icc,	%g2,	%l4
	mova	%xcc,	%o3,	%o1
	udivcc	%g1,	0x01F6,	%i3
	sdivx	%g6,	0x1BC8,	%l2
	srl	%i7,	0x03,	%i0
	sdivx	%g5,	0x0362,	%o4
	popc	%l5,	%o7
	nop
	set	0x38, %i4
	lduw	[%l7 + %i4],	%i6
	lduh	[%l7 + 0x52],	%l3
	movn	%xcc,	%o0,	%g7
	fandnot2s	%f10,	%f27,	%f7
	subccc	%g3,	%l6,	%l1
	subccc	%o6,	0x136C,	%i1
	smulcc	%l0,	%o2,	%i4
	movrlz	%i2,	0x0DB,	%o5
	movrgez	%g4,	0x146,	%i5
	ldsw	[%l7 + 0x44],	%g2
	mova	%xcc,	%o3,	%o1
	stw	%g1,	[%l7 + 0x48]
	alignaddrl	%l4,	%g6,	%l2
	edge32l	%i3,	%i0,	%g5
	stw	%o4,	[%l7 + 0x14]
	fmovdne	%xcc,	%f8,	%f14
	sir	0x0FCA
	movre	%i7,	0x1B3,	%l5
	fmul8x16	%f12,	%f2,	%f18
	fpadd16s	%f16,	%f9,	%f24
	subc	%o7,	0x1521,	%i6
	edge32n	%o0,	%g7,	%l3
	movle	%icc,	%g3,	%l6
	orcc	%l1,	%i1,	%o6
	movleu	%xcc,	%l0,	%i4
	movrgz	%i2,	0x0A4,	%o5
	smul	%o2,	%i5,	%g4
	movge	%xcc,	%o3,	%g2
	xnorcc	%o1,	%l4,	%g1
	stw	%g6,	[%l7 + 0x14]
	fornot2s	%f1,	%f29,	%f17
	fexpand	%f5,	%f4
	xorcc	%l2,	%i3,	%i0
	sdivx	%o4,	0x04F4,	%g5
	move	%icc,	%l5,	%o7
	addcc	%i7,	0x1ECA,	%o0
	edge16ln	%g7,	%i6,	%l3
	edge8	%g3,	%l6,	%i1
	ldx	[%l7 + 0x30],	%o6
	fmul8sux16	%f20,	%f4,	%f0
	edge16ln	%l0,	%i4,	%i2
	smul	%l1,	0x1187,	%o5
	fpsub16s	%f0,	%f20,	%f1
	umul	%o2,	0x1AB7,	%g4
	edge16l	%o3,	%i5,	%g2
	stw	%o1,	[%l7 + 0x74]
	movrgz	%g1,	0x19D,	%l4
	srax	%l2,	0x1C,	%g6
	popc	%i3,	%o4
	fnot2	%f22,	%f2
	mulx	%g5,	%i0,	%o7
	udivcc	%i7,	0x02F5,	%l5
	edge32l	%g7,	%i6,	%o0
	fpackfix	%f26,	%f12
	addcc	%g3,	0x1491,	%l6
	stx	%l3,	[%l7 + 0x18]
	sdiv	%o6,	0x004C,	%i1
	movrgez	%l0,	0x068,	%i2
	fmovrdgez	%i4,	%f18,	%f18
	ldx	[%l7 + 0x08],	%l1
	movre	%o5,	0x063,	%g4
	movle	%icc,	%o2,	%o3
	movcs	%icc,	%i5,	%o1
	mulscc	%g2,	0x1231,	%g1
	fnors	%f24,	%f24,	%f14
	stw	%l2,	[%l7 + 0x28]
	edge8	%g6,	%l4,	%o4
	ldx	[%l7 + 0x58],	%g5
	edge8	%i0,	%i3,	%i7
	ldub	[%l7 + 0x20],	%o7
	orncc	%g7,	%i6,	%l5
	movre	%o0,	%l6,	%l3
	movpos	%icc,	%g3,	%i1
	movne	%xcc,	%l0,	%i2
	xorcc	%i4,	0x136C,	%o6
	lduh	[%l7 + 0x66],	%l1
	fmovsl	%xcc,	%f30,	%f10
	movcs	%icc,	%o5,	%g4
	sdiv	%o2,	0x0DEA,	%o3
	movrne	%o1,	%i5,	%g2
	orcc	%l2,	%g1,	%g6
	move	%xcc,	%l4,	%o4
	fnands	%f16,	%f15,	%f22
	fcmped	%fcc0,	%f22,	%f26
	edge32l	%g5,	%i0,	%i3
	stx	%i7,	[%l7 + 0x38]
	edge16ln	%g7,	%i6,	%o7
	fmul8x16au	%f12,	%f11,	%f0
	edge16	%l5,	%o0,	%l6
	addcc	%g3,	%i1,	%l0
	fornot2s	%f26,	%f14,	%f6
	movre	%i2,	%l3,	%i4
	edge8	%l1,	%o6,	%o5
	srax	%g4,	%o2,	%o3
	movgu	%xcc,	%o1,	%g2
	srax	%l2,	0x1E,	%i5
	sra	%g6,	0x16,	%g1
	ld	[%l7 + 0x70],	%f3
	ldub	[%l7 + 0x13],	%l4
	movvs	%xcc,	%g5,	%i0
	ldd	[%l7 + 0x10],	%i2
	movcc	%icc,	%i7,	%g7
	ldsw	[%l7 + 0x40],	%i6
	fones	%f23
	or	%o7,	%o4,	%l5
	movre	%l6,	%g3,	%o0
	movl	%xcc,	%l0,	%i1
	udiv	%l3,	0x1483,	%i2
	sdiv	%l1,	0x1359,	%o6
	ldsb	[%l7 + 0x2F],	%i4
	sethi	0x1EE7,	%g4
	smul	%o5,	0x1170,	%o3
	edge8n	%o2,	%o1,	%l2
	or	%g2,	%g6,	%g1
	sdivx	%i5,	0x1BA5,	%l4
	xnor	%i0,	0x1B2A,	%i3
	fmovscc	%xcc,	%f20,	%f28
	fmovdg	%icc,	%f28,	%f22
	setx loop_82, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_82: 	addc	%i6,	0x0D3F,	%o4
	orncc	%l5,	%l6,	%o7
	fpadd32s	%f8,	%f16,	%f25
	ld	[%l7 + 0x24],	%f20
	ldub	[%l7 + 0x71],	%o0
	fmovs	%f21,	%f14
	mova	%icc,	%l0,	%i1
	edge16n	%g3,	%i2,	%l1
	subc	%l3,	%i4,	%g4
	fpadd16s	%f14,	%f5,	%f25
	fsrc2s	%f9,	%f2
	movn	%xcc,	%o5,	%o3
	fnot2s	%f22,	%f4
	fmovdneg	%icc,	%f16,	%f22
	fmovde	%xcc,	%f6,	%f9
	smulcc	%o6,	0x0B6A,	%o2
	ldub	[%l7 + 0x65],	%l2
	fand	%f2,	%f0,	%f12
	movge	%xcc,	%g2,	%o1
	sdivcc	%g1,	0x1A5D,	%g6
	orcc	%l4,	0x1462,	%i0
	edge16n	%i5,	%g5,	%i3
	fsrc1	%f10,	%f30
	addccc	%g7,	0x1B8F,	%i6
	movl	%xcc,	%o4,	%i7
	udiv	%l6,	0x0EDC,	%l5
	edge8n	%o7,	%o0,	%i1
	fpadd32s	%f1,	%f11,	%f5
	srax	%l0,	%g3,	%i2
	movrlz	%l3,	0x1F6,	%l1
	movpos	%xcc,	%i4,	%g4
	movrgz	%o5,	0x0DD,	%o3
	addccc	%o6,	%o2,	%l2
	movneg	%icc,	%o1,	%g1
	movne	%xcc,	%g6,	%l4
	fxnor	%f14,	%f0,	%f18
	lduh	[%l7 + 0x2A],	%i0
	edge16l	%i5,	%g5,	%i3
	alignaddrl	%g2,	%g7,	%o4
	movg	%xcc,	%i7,	%l6
	fcmpeq32	%f10,	%f14,	%l5
	movleu	%xcc,	%o7,	%i6
	or	%o0,	0x0CDF,	%l0
	popc	0x15DF,	%g3
	srl	%i2,	0x00,	%i1
	addc	%l1,	%i4,	%l3
	fmovsgu	%icc,	%f4,	%f31
	array8	%g4,	%o3,	%o6
	sdivx	%o2,	0x05C7,	%l2
	fmovrsgez	%o1,	%f7,	%f26
	mova	%xcc,	%o5,	%g1
	umul	%g6,	0x1A67,	%l4
	movgu	%xcc,	%i0,	%i5
	fmovdg	%icc,	%f6,	%f28
	udivx	%i3,	0x0EC5,	%g2
	ld	[%l7 + 0x54],	%f18
	andcc	%g5,	0x1898,	%g7
	xor	%o4,	0x1223,	%l6
	movn	%icc,	%l5,	%i7
	pdist	%f28,	%f24,	%f16
	and	%o7,	%i6,	%o0
	fmovdvc	%icc,	%f4,	%f29
	addcc	%g3,	%l0,	%i2
	edge16n	%l1,	%i4,	%l3
	edge8n	%g4,	%o3,	%i1
	sdivcc	%o2,	0x0E01,	%l2
	movvc	%xcc,	%o1,	%o6
	fpadd16s	%f21,	%f1,	%f1
	alignaddr	%o5,	%g6,	%l4
	movvs	%xcc,	%g1,	%i5
	movvs	%icc,	%i0,	%i3
	fnot1	%f12,	%f2
	edge16l	%g5,	%g7,	%g2
	andcc	%l6,	0x1611,	%o4
	fmovscs	%xcc,	%f19,	%f28
	sdiv	%l5,	0x1AF1,	%i7
	smulcc	%o7,	0x1F62,	%i6
	udivx	%o0,	0x04A6,	%l0
	std	%f22,	[%l7 + 0x60]
	movl	%xcc,	%i2,	%l1
	fcmpgt16	%f24,	%f4,	%g3
	fmovdgu	%icc,	%f23,	%f31
	orncc	%l3,	%g4,	%i4
	fmovda	%icc,	%f8,	%f0
	subccc	%o3,	%i1,	%l2
	array16	%o1,	%o6,	%o5
	fmovrsne	%g6,	%f22,	%f18
	fpadd16	%f28,	%f0,	%f22
	fmuld8sux16	%f23,	%f20,	%f10
	movne	%xcc,	%l4,	%o2
	std	%f2,	[%l7 + 0x20]
	movrgz	%g1,	0x371,	%i5
	mulx	%i3,	%g5,	%g7
	ldsw	[%l7 + 0x64],	%i0
	movvc	%icc,	%l6,	%o4
	nop
	set	0x44, %g6
	ldsw	[%l7 + %g6],	%l5
	fmovsne	%xcc,	%f1,	%f14
	ld	[%l7 + 0x14],	%f30
	sdiv	%g2,	0x10E2,	%i7
	subccc	%i6,	%o7,	%l0
	lduw	[%l7 + 0x60],	%o0
	movrlez	%i2,	0x020,	%g3
	alignaddrl	%l1,	%l3,	%g4
	fornot2	%f12,	%f14,	%f12
	mova	%xcc,	%o3,	%i1
	movrne	%i4,	0x330,	%l2
	edge32	%o1,	%o6,	%o5
	movge	%icc,	%l4,	%o2
	andcc	%g1,	%g6,	%i3
	orncc	%i5,	0x086D,	%g5
	fmovdleu	%xcc,	%f27,	%f2
	srl	%i0,	%g7,	%o4
	sllx	%l5,	%l6,	%i7
	sub	%g2,	%o7,	%l0
	movrgz	%o0,	%i2,	%g3
	movge	%xcc,	%i6,	%l3
	ldsb	[%l7 + 0x5C],	%l1
	edge8l	%g4,	%o3,	%i1
	add	%i4,	0x07C1,	%l2
	fmovse	%icc,	%f17,	%f16
	srlx	%o1,	%o5,	%l4
	smul	%o2,	%o6,	%g1
	ldd	[%l7 + 0x68],	%i2
	edge32n	%g6,	%g5,	%i5
	fcmpgt32	%f24,	%f28,	%g7
	ldsh	[%l7 + 0x2E],	%i0
	alignaddr	%l5,	%o4,	%i7
	mulscc	%g2,	0x1BEC,	%l6
	movvc	%xcc,	%l0,	%o0
	edge8ln	%o7,	%g3,	%i2
	or	%i6,	0x14E3,	%l1
	fnand	%f0,	%f2,	%f12
	fmovdleu	%icc,	%f4,	%f31
	subccc	%l3,	0x064D,	%g4
	movneg	%icc,	%o3,	%i4
	ldx	[%l7 + 0x28],	%l2
	move	%icc,	%i1,	%o5
	std	%f20,	[%l7 + 0x20]
	fmuld8sux16	%f23,	%f8,	%f18
	edge8ln	%l4,	%o2,	%o1
	sth	%o6,	[%l7 + 0x26]
	ldsh	[%l7 + 0x2C],	%g1
	ldub	[%l7 + 0x12],	%g6
	fmovrdgez	%i3,	%f16,	%f16
	udiv	%g5,	0x0FE3,	%i5
	fmovsge	%xcc,	%f23,	%f27
	sdiv	%g7,	0x05D4,	%l5
	edge16ln	%i0,	%o4,	%g2
	fnor	%f28,	%f14,	%f4
	movrlz	%i7,	0x09F,	%l0
	move	%xcc,	%o0,	%o7
	andcc	%l6,	0x12DF,	%i2
	movrgz	%g3,	0x168,	%i6
	andn	%l1,	0x177D,	%l3
	fornot2	%f14,	%f10,	%f22
	move	%xcc,	%g4,	%i4
	array16	%l2,	%o3,	%o5
	fandnot1	%f24,	%f28,	%f10
	or	%i1,	0x1062,	%o2
	fmuld8ulx16	%f21,	%f31,	%f6
	movre	%o1,	0x39F,	%o6
	fmovsge	%icc,	%f23,	%f2
	orn	%l4,	0x1F89,	%g6
	fornot2s	%f12,	%f13,	%f5
	ldub	[%l7 + 0x69],	%g1
	fmovrslez	%i3,	%f7,	%f12
	srlx	%i5,	0x08,	%g7
	mova	%icc,	%g5,	%i0
	udiv	%o4,	0x07A2,	%l5
	edge8	%i7,	%l0,	%g2
	lduw	[%l7 + 0x40],	%o0
	addccc	%l6,	%o7,	%g3
	sllx	%i2,	%l1,	%i6
	mulscc	%l3,	0x0608,	%g4
	ldub	[%l7 + 0x3B],	%i4
	movpos	%xcc,	%o3,	%l2
	udiv	%i1,	0x1F65,	%o5
	edge32ln	%o1,	%o2,	%o6
	sdivcc	%g6,	0x1CC8,	%l4
	ldsw	[%l7 + 0x70],	%g1
	umul	%i3,	0x03CA,	%g7
	edge32l	%g5,	%i0,	%o4
	add	%i5,	0x089C,	%l5
	edge8ln	%i7,	%l0,	%g2
	edge16l	%l6,	%o7,	%g3
	alignaddrl	%o0,	%l1,	%i6
	st	%f12,	[%l7 + 0x54]
	andncc	%l3,	%g4,	%i4
	stx	%i2,	[%l7 + 0x58]
	mova	%icc,	%o3,	%i1
	sdivx	%o5,	0x19F4,	%l2
	ldub	[%l7 + 0x7A],	%o2
	mulscc	%o1,	0x06B9,	%o6
	sra	%l4,	0x15,	%g1
	addc	%i3,	%g7,	%g5
	edge8ln	%i0,	%o4,	%i5
	alignaddr	%g6,	%l5,	%i7
	movcc	%icc,	%g2,	%l6
	fabsd	%f28,	%f30
	andn	%l0,	0x0CFD,	%g3
	movleu	%xcc,	%o0,	%l1
	movrlz	%o7,	%i6,	%l3
	edge16n	%i4,	%i2,	%g4
	std	%f22,	[%l7 + 0x40]
	fmovdn	%icc,	%f28,	%f19
	xnor	%i1,	%o5,	%o3
	lduh	[%l7 + 0x26],	%o2
	array16	%l2,	%o6,	%o1
	move	%xcc,	%l4,	%i3
	ldub	[%l7 + 0x20],	%g1
	ldsb	[%l7 + 0x41],	%g7
	fmovdvc	%xcc,	%f10,	%f31
	edge16ln	%i0,	%o4,	%i5
	fcmpes	%fcc1,	%f14,	%f18
	andncc	%g6,	%l5,	%g5
	sdivx	%g2,	0x0B22,	%i7
	orn	%l6,	%l0,	%g3
	array16	%l1,	%o0,	%o7
	fornot2s	%f25,	%f30,	%f31
	lduh	[%l7 + 0x14],	%i6
	movleu	%icc,	%i4,	%i2
	movrlez	%l3,	0x0B6,	%i1
	edge32n	%o5,	%o3,	%o2
	sdivx	%l2,	0x1995,	%g4
	move	%icc,	%o1,	%o6
	sdivcc	%l4,	0x0FA4,	%g1
	orncc	%i3,	0x0CF3,	%i0
	stb	%g7,	[%l7 + 0x4B]
	fmovrslz	%o4,	%f13,	%f12
	umul	%g6,	0x0D1F,	%l5
	std	%f4,	[%l7 + 0x40]
	umulcc	%g5,	%g2,	%i7
	udiv	%l6,	0x150C,	%i5
	sir	0x01DC
	edge32ln	%g3,	%l0,	%l1
	movvc	%icc,	%o0,	%o7
	addcc	%i6,	%i2,	%i4
	stx	%l3,	[%l7 + 0x68]
	udiv	%i1,	0x08A3,	%o5
	fpadd32s	%f25,	%f1,	%f2
	fmul8x16	%f25,	%f4,	%f4
	nop
	set	0x70, %o7
	stw	%o3,	[%l7 + %o7]
	xorcc	%l2,	%g4,	%o2
	ldsb	[%l7 + 0x28],	%o1
	fpsub32s	%f7,	%f22,	%f4
	mulscc	%l4,	%o6,	%i3
	array16	%i0,	%g7,	%o4
	fxor	%f10,	%f4,	%f6
	edge16	%g6,	%g1,	%l5
	mulscc	%g2,	%g5,	%i7
	fmovscs	%icc,	%f21,	%f10
	movcc	%xcc,	%l6,	%g3
	addccc	%i5,	0x13D4,	%l0
	fnand	%f10,	%f26,	%f8
	fnegs	%f28,	%f16
	edge8n	%l1,	%o7,	%i6
	fmovdpos	%icc,	%f6,	%f15
	subccc	%o0,	0x0A30,	%i4
	movn	%xcc,	%l3,	%i2
	orcc	%i1,	%o5,	%o3
	or	%l2,	0x17E9,	%g4
	movl	%icc,	%o1,	%o2
	subc	%o6,	0x1245,	%i3
	sllx	%i0,	0x1E,	%g7
	fmovdn	%xcc,	%f18,	%f22
	smul	%o4,	0x0A81,	%l4
	ldub	[%l7 + 0x34],	%g6
	smul	%l5,	%g2,	%g1
	andn	%g5,	0x1047,	%l6
	sdivx	%i7,	0x14A1,	%g3
	lduw	[%l7 + 0x24],	%i5
	udivx	%l0,	0x1B0F,	%l1
	fabsd	%f2,	%f6
	sll	%i6,	%o7,	%o0
	orcc	%l3,	0x05B3,	%i2
	sdivx	%i4,	0x176E,	%o5
	addccc	%i1,	%o3,	%l2
	ldsb	[%l7 + 0x4B],	%g4
	subcc	%o1,	0x0152,	%o6
	fmovsgu	%xcc,	%f16,	%f9
	ldd	[%l7 + 0x08],	%i2
	addc	%o2,	0x1A33,	%g7
	movcs	%xcc,	%o4,	%l4
	fandnot2s	%f31,	%f15,	%f14
	ldub	[%l7 + 0x67],	%g6
	or	%l5,	%i0,	%g2
	ld	[%l7 + 0x2C],	%f7
	ldsb	[%l7 + 0x6D],	%g5
	addc	%l6,	0x0522,	%g1
	movrne	%g3,	0x13C,	%i7
	edge8ln	%l0,	%i5,	%i6
	edge32	%l1,	%o7,	%o0
	movrne	%l3,	%i4,	%o5
	stb	%i1,	[%l7 + 0x71]
	ldsb	[%l7 + 0x2C],	%i2
	movneg	%icc,	%o3,	%l2
	movrlz	%g4,	%o1,	%i3
	movvc	%xcc,	%o6,	%g7
	st	%f19,	[%l7 + 0x18]
	fmul8x16al	%f22,	%f5,	%f8
	movgu	%xcc,	%o2,	%o4
	add	%l4,	%l5,	%g6
	fmovsa	%xcc,	%f18,	%f9
	fabss	%f11,	%f30
	udivcc	%i0,	0x18CB,	%g5
	sub	%g2,	%g1,	%l6
	fmovrsne	%i7,	%f5,	%f28
	addc	%l0,	%g3,	%i5
	fmovrdgz	%l1,	%f26,	%f14
	udivx	%o7,	0x0DDB,	%o0
	fmovdpos	%icc,	%f2,	%f12
	fnot2	%f12,	%f16
	fmovdge	%icc,	%f0,	%f11
	fandnot2	%f22,	%f6,	%f0
	edge32	%l3,	%i6,	%i4
	movrgez	%o5,	0x2FD,	%i1
	sdivcc	%o3,	0x1403,	%i2
	addcc	%l2,	%g4,	%o1
	fmovdcs	%icc,	%f20,	%f22
	mulscc	%i3,	%o6,	%o2
	fnand	%f28,	%f20,	%f8
	movrgz	%o4,	%l4,	%l5
	srl	%g7,	%g6,	%g5
	fors	%f12,	%f28,	%f17
	ldx	[%l7 + 0x70],	%g2
	xor	%g1,	%l6,	%i0
	array8	%l0,	%i7,	%i5
	orn	%l1,	0x1A45,	%g3
	or	%o7,	0x1579,	%l3
	edge16	%i6,	%o0,	%o5
	edge8l	%i4,	%o3,	%i1
	sllx	%l2,	%i2,	%o1
	movleu	%icc,	%i3,	%o6
	sth	%o2,	[%l7 + 0x0E]
	popc	0x0C23,	%o4
	xnorcc	%g4,	0x027B,	%l4
	movrgz	%l5,	%g7,	%g5
	fmovdn	%icc,	%f1,	%f30
	ldsw	[%l7 + 0x18],	%g2
	fzeros	%f24
	addccc	%g1,	%l6,	%g6
	subcc	%i0,	%i7,	%l0
	ldub	[%l7 + 0x0F],	%i5
	sethi	0x1ED6,	%l1
	fcmpeq32	%f14,	%f20,	%o7
	fnor	%f0,	%f22,	%f20
	fmovsl	%icc,	%f22,	%f16
	xnorcc	%l3,	0x0493,	%i6
	srlx	%g3,	%o5,	%o0
	edge32l	%i4,	%i1,	%l2
	add	%o3,	0x0332,	%o1
	fsrc1	%f24,	%f20
	fmovsvc	%xcc,	%f9,	%f27
	std	%f28,	[%l7 + 0x58]
	subc	%i2,	0x020D,	%o6
	fmul8x16al	%f13,	%f31,	%f8
	addcc	%i3,	0x0ED0,	%o4
	sth	%g4,	[%l7 + 0x4C]
	movvc	%icc,	%l4,	%l5
	movcs	%xcc,	%o2,	%g5
	array32	%g2,	%g1,	%l6
	ldsb	[%l7 + 0x4A],	%g7
	edge8l	%i0,	%g6,	%l0
	nop
	set	0x60, %l6
	lduh	[%l7 + %l6],	%i5
	umulcc	%l1,	%o7,	%l3
	fmuld8ulx16	%f25,	%f5,	%f20
	movgu	%icc,	%i7,	%g3
	movge	%xcc,	%o5,	%i6
	movne	%xcc,	%o0,	%i4
	xor	%l2,	%o3,	%i1
	movne	%icc,	%o1,	%o6
	fornot1	%f26,	%f14,	%f28
	edge32	%i2,	%o4,	%g4
	ldsh	[%l7 + 0x0A],	%l4
	fpsub16	%f28,	%f18,	%f14
	fnot2	%f10,	%f26
	movge	%icc,	%i3,	%o2
	sdivx	%l5,	0x00A1,	%g2
	sll	%g5,	0x0B,	%g1
	edge16l	%g7,	%l6,	%i0
	movneg	%xcc,	%l0,	%i5
	fmul8x16au	%f11,	%f13,	%f28
	edge32l	%l1,	%o7,	%g6
	sdivcc	%i7,	0x1947,	%g3
	popc	%l3,	%o5
	array8	%o0,	%i4,	%l2
	fmovsvs	%icc,	%f24,	%f1
	move	%icc,	%o3,	%i6
	udivx	%i1,	0x0DA2,	%o6
	xnorcc	%i2,	0x05AE,	%o4
	nop
	set	0x5C, %o5
	ldsw	[%l7 + %o5],	%g4
	mova	%xcc,	%o1,	%i3
	fmul8x16au	%f13,	%f16,	%f0
	ldsh	[%l7 + 0x74],	%l4
	stw	%l5,	[%l7 + 0x1C]
	edge16l	%g2,	%g5,	%o2
	umulcc	%g1,	0x16A2,	%l6
	fmovdne	%xcc,	%f19,	%f11
	umul	%i0,	%l0,	%g7
	orncc	%l1,	%o7,	%i5
	udiv	%i7,	0x1662,	%g3
	ldsw	[%l7 + 0x64],	%l3
	ldsh	[%l7 + 0x3A],	%g6
	sethi	0x1E9B,	%o5
	edge16l	%o0,	%i4,	%l2
	udivx	%i6,	0x081E,	%o3
	smulcc	%i1,	%i2,	%o4
	ldd	[%l7 + 0x38],	%f28
	fpsub32	%f26,	%f4,	%f16
	srax	%o6,	%o1,	%g4
	subcc	%i3,	0x0A7B,	%l5
	edge16l	%l4,	%g2,	%o2
	udivcc	%g5,	0x1E50,	%l6
	movpos	%icc,	%i0,	%l0
	fmovsleu	%icc,	%f8,	%f20
	nop
	set	0x12, %g2
	stb	%g7,	[%l7 + %g2]
	srlx	%g1,	0x05,	%l1
	fcmpes	%fcc0,	%f31,	%f28
	edge16l	%i5,	%o7,	%g3
	add	%l3,	0x05C4,	%g6
	restore %o5, %o0, %i7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movge	%icc,	%i4,	%i6
	sth	%l2,	[%l7 + 0x58]
	edge8ln	%o3,	%i1,	%o4
	udivx	%o6,	0x0C4D,	%o1
	fnot1	%f8,	%f24
	fpadd16	%f30,	%f24,	%f28
	sdivx	%i2,	0x06DA,	%i3
	addc	%l5,	0x1825,	%l4
	srl	%g2,	0x15,	%g4
	orcc	%g5,	%l6,	%i0
	fmovsne	%icc,	%f9,	%f15
	fmovspos	%icc,	%f31,	%f1
	edge32l	%l0,	%o2,	%g1
	siam	0x2
	sdiv	%g7,	0x1132,	%i5
	sllx	%o7,	%g3,	%l3
	movgu	%icc,	%l1,	%g6
	ldd	[%l7 + 0x78],	%f2
	fmovrdgz	%o0,	%f6,	%f6
	fmovscs	%icc,	%f19,	%f9
	edge16	%i7,	%o5,	%i4
	fzero	%f20
	movvc	%icc,	%i6,	%l2
	srlx	%i1,	0x1E,	%o4
	fmovsge	%xcc,	%f8,	%f31
	movne	%xcc,	%o3,	%o6
	movgu	%xcc,	%o1,	%i2
	popc	0x1DF2,	%i3
	movvc	%xcc,	%l4,	%l5
	fmovsgu	%xcc,	%f5,	%f17
	fmovrde	%g2,	%f26,	%f10
	edge8	%g4,	%g5,	%l6
	fnot2s	%f10,	%f19
	edge16	%i0,	%l0,	%g1
	edge8n	%o2,	%i5,	%g7
	sra	%o7,	0x13,	%g3
	bshuffle	%f30,	%f18,	%f4
	mulx	%l1,	%l3,	%o0
	array32	%i7,	%o5,	%i4
	fxnor	%f18,	%f30,	%f6
	addc	%g6,	0x13CF,	%i6
	movne	%xcc,	%l2,	%o4
	edge8ln	%o3,	%o6,	%i1
	movneg	%xcc,	%o1,	%i3
	andcc	%l4,	0x0B79,	%l5
	fpack16	%f8,	%f12
	movrlz	%i2,	0x18E,	%g4
	siam	0x0
	subcc	%g2,	0x0234,	%g5
	movre	%i0,	0x026,	%l6
	fmovrdlz	%g1,	%f6,	%f22
	ldub	[%l7 + 0x15],	%l0
	edge8n	%o2,	%g7,	%o7
	std	%f16,	[%l7 + 0x18]
	xor	%g3,	%i5,	%l3
	smulcc	%l1,	%i7,	%o5
	mulx	%i4,	%o0,	%i6
	save %l2, 0x18E7, %g6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulscc	%o3,	%o4,	%i1
	fcmpd	%fcc2,	%f8,	%f24
	edge32l	%o6,	%i3,	%l4
	udivx	%l5,	0x172B,	%i2
	fcmple32	%f26,	%f8,	%o1
	sll	%g2,	%g5,	%g4
	smulcc	%i0,	0x10F2,	%l6
	stx	%l0,	[%l7 + 0x48]
	sdivcc	%o2,	0x1154,	%g1
	fnand	%f8,	%f10,	%f10
	fmovdle	%xcc,	%f23,	%f5
	fpadd16s	%f27,	%f6,	%f10
	movrlez	%g7,	0x03F,	%g3
	fnot2	%f14,	%f10
	subcc	%i5,	%l3,	%o7
	movrgez	%l1,	%i7,	%o5
	save %o0, %i4, %i6
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	std	%f0,	[%l7 + 0x78]
	movpos	%xcc,	%l2,	%o3
	subcc	%g6,	%i1,	%o6
	movneg	%xcc,	%o4,	%i3
	ldub	[%l7 + 0x51],	%l4
	sth	%l5,	[%l7 + 0x34]
	fcmpd	%fcc0,	%f20,	%f16
	sllx	%i2,	%g2,	%o1
	fmovsleu	%xcc,	%f5,	%f16
	sth	%g4,	[%l7 + 0x16]
	movcs	%xcc,	%g5,	%i0
	lduh	[%l7 + 0x78],	%l0
	fcmpgt32	%f12,	%f6,	%l6
	umulcc	%g1,	0x1246,	%o2
	fcmpne32	%f14,	%f22,	%g3
	srlx	%i5,	%l3,	%g7
	ldd	[%l7 + 0x10],	%o6
	std	%f16,	[%l7 + 0x40]
	fmovsa	%icc,	%f13,	%f16
	alignaddr	%i7,	%o5,	%o0
	umulcc	%i4,	0x1FDA,	%l1
	stx	%l2,	[%l7 + 0x58]
	setx loop_83, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_83: 	movge	%icc,	%o3,	%o4
	srl	%o6,	0x18,	%i3
	orcc	%l4,	0x07AD,	%i2
	xor	%l5,	0x1EAC,	%g2
	sethi	0x1F65,	%o1
	stb	%g5,	[%l7 + 0x2F]
	fmovscs	%xcc,	%f20,	%f31
	srlx	%i0,	0x0B,	%g4
	edge8l	%l6,	%l0,	%o2
	lduh	[%l7 + 0x46],	%g3
	srlx	%g1,	0x00,	%l3
	addccc	%i5,	%o7,	%i7
	umulcc	%o5,	0x17AB,	%g7
	fmovdleu	%xcc,	%f27,	%f22
	edge16l	%o0,	%i4,	%l1
	orn	%i6,	%g6,	%i1
	fsrc1s	%f19,	%f4
	ldsw	[%l7 + 0x50],	%l2
	add	%o4,	%o6,	%i3
	srl	%o3,	%i2,	%l4
	edge32l	%l5,	%g2,	%o1
	fxors	%f17,	%f2,	%f3
	xor	%i0,	0x0D29,	%g5
	fxors	%f4,	%f9,	%f6
	movrlz	%g4,	0x00B,	%l6
	ld	[%l7 + 0x40],	%f3
	subc	%l0,	0x167C,	%g3
	edge16ln	%g1,	%l3,	%i5
	ldd	[%l7 + 0x58],	%o2
	fmovdvc	%xcc,	%f17,	%f19
	sra	%i7,	%o7,	%g7
	ldsb	[%l7 + 0x20],	%o0
	edge8ln	%i4,	%o5,	%i6
	xorcc	%l1,	%i1,	%g6
	movpos	%icc,	%l2,	%o4
	edge8	%i3,	%o6,	%o3
	movn	%xcc,	%i2,	%l5
	or	%g2,	0x1898,	%o1
	alignaddr	%l4,	%g5,	%i0
	edge32l	%l6,	%g4,	%l0
	fsrc2s	%f0,	%f0
	edge32ln	%g1,	%l3,	%i5
	fabss	%f25,	%f24
	edge16l	%g3,	%i7,	%o2
	edge16ln	%o7,	%g7,	%o0
	sethi	0x167C,	%i4
	fandnot1	%f26,	%f4,	%f28
	nop
	set	0x47, %g4
	ldub	[%l7 + %g4],	%i6
	movl	%xcc,	%o5,	%i1
	edge16l	%l1,	%l2,	%g6
	sllx	%o4,	%o6,	%o3
	movge	%xcc,	%i3,	%i2
	fornot1s	%f2,	%f0,	%f6
	xor	%l5,	%g2,	%l4
	edge16l	%g5,	%i0,	%o1
	ldd	[%l7 + 0x78],	%f2
	move	%icc,	%l6,	%g4
	stw	%g1,	[%l7 + 0x20]
	mulx	%l0,	%l3,	%i5
	mova	%xcc,	%i7,	%g3
	movvs	%xcc,	%o7,	%g7
	movl	%icc,	%o2,	%i4
	add	%i6,	0x0C7D,	%o0
	mulscc	%i1,	%l1,	%o5
	mova	%xcc,	%l2,	%g6
	fnegd	%f26,	%f8
	or	%o6,	0x1320,	%o3
	edge16n	%o4,	%i3,	%l5
	movre	%g2,	0x0B4,	%i2
	ldsb	[%l7 + 0x78],	%l4
	and	%i0,	0x1192,	%g5
	sll	%l6,	0x0D,	%o1
	movpos	%xcc,	%g1,	%g4
	fmovrdlez	%l0,	%f16,	%f12
	udiv	%l3,	0x1C5F,	%i5
	sth	%g3,	[%l7 + 0x12]
	stw	%o7,	[%l7 + 0x20]
	ldd	[%l7 + 0x28],	%f28
	movl	%icc,	%g7,	%o2
	ld	[%l7 + 0x08],	%f2
	fmovsvc	%xcc,	%f15,	%f27
	mulx	%i7,	0x1706,	%i4
	fandnot1	%f0,	%f24,	%f4
	fmovdvc	%xcc,	%f12,	%f19
	alignaddrl	%i6,	%i1,	%l1
	array32	%o5,	%o0,	%l2
	movvs	%xcc,	%o6,	%o3
	edge16ln	%o4,	%g6,	%i3
	movgu	%icc,	%l5,	%i2
	movrlez	%g2,	%l4,	%g5
	ld	[%l7 + 0x10],	%f20
	fpsub16s	%f4,	%f4,	%f26
	mulx	%i0,	0x1F18,	%o1
	edge16ln	%g1,	%l6,	%g4
	stw	%l0,	[%l7 + 0x48]
	edge8ln	%i5,	%g3,	%o7
	stx	%l3,	[%l7 + 0x30]
	fmovrdlez	%g7,	%f8,	%f6
	fmovscc	%icc,	%f11,	%f14
	sllx	%o2,	%i7,	%i6
	movcs	%xcc,	%i4,	%i1
	sub	%o5,	0x15CA,	%l1
	edge16ln	%o0,	%l2,	%o6
	udiv	%o4,	0x0903,	%g6
	edge8n	%o3,	%i3,	%l5
	movrlz	%i2,	%l4,	%g5
	movrgz	%i0,	0x0A0,	%g2
	edge32n	%o1,	%l6,	%g1
	fmovsle	%xcc,	%f28,	%f22
	and	%l0,	0x181F,	%i5
	add	%g4,	%g3,	%l3
	smulcc	%o7,	%o2,	%i7
	udivcc	%i6,	0x1796,	%g7
	movrne	%i4,	0x11F,	%o5
	ldx	[%l7 + 0x30],	%i1
	stw	%o0,	[%l7 + 0x6C]
	ldsw	[%l7 + 0x0C],	%l2
	sethi	0x1F31,	%o6
	edge32	%l1,	%g6,	%o3
	sll	%i3,	0x11,	%o4
	xorcc	%i2,	0x1DC8,	%l5
	edge32	%g5,	%i0,	%l4
	lduw	[%l7 + 0x4C],	%o1
	subccc	%g2,	0x1468,	%g1
	andcc	%l6,	0x143E,	%i5
	st	%f15,	[%l7 + 0x74]
	edge32l	%l0,	%g4,	%l3
	sth	%g3,	[%l7 + 0x2A]
	movvs	%icc,	%o7,	%o2
	umulcc	%i7,	0x1BD4,	%i6
	fmovdge	%xcc,	%f9,	%f18
	movg	%xcc,	%g7,	%i4
	movcs	%icc,	%i1,	%o0
	movcc	%xcc,	%l2,	%o6
	edge16	%l1,	%o5,	%o3
	fpack32	%f18,	%f14,	%f28
	ldd	[%l7 + 0x78],	%f14
	sllx	%g6,	%o4,	%i2
	lduw	[%l7 + 0x14],	%i3
	std	%f8,	[%l7 + 0x08]
	fzero	%f0
	sdivx	%l5,	0x1793,	%i0
	movrgz	%l4,	%g5,	%o1
	restore %g1, 0x139F, %g2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	sdivcc	%l6,	0x0D1C,	%i5
	edge16l	%g4,	%l0,	%g3
	fmovsa	%xcc,	%f14,	%f11
	movle	%xcc,	%o7,	%o2
	st	%f17,	[%l7 + 0x08]
	xnorcc	%i7,	%i6,	%l3
	save %g7, %i1, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	mulx	%o0,	0x0692,	%l2
	ldub	[%l7 + 0x7C],	%o6
	fmovspos	%icc,	%f10,	%f15
	array16	%o5,	%l1,	%o3
	sra	%g6,	0x01,	%o4
	movgu	%xcc,	%i3,	%i2
	ldub	[%l7 + 0x1B],	%l5
	sra	%l4,	0x14,	%g5
	fmovdleu	%xcc,	%f26,	%f8
	edge32l	%i0,	%o1,	%g2
	xorcc	%g1,	0x1566,	%l6
	save %g4, %i5, %g3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	andn	%l0,	%o7,	%i7
	udiv	%i6,	0x06C0,	%l3
	movn	%icc,	%g7,	%i1
	srlx	%i4,	0x09,	%o0
	fmul8sux16	%f22,	%f30,	%f14
	fexpand	%f12,	%f16
	orncc	%o2,	%o6,	%l2
	fmovdneg	%xcc,	%f24,	%f16
	movrgz	%o5,	0x03E,	%l1
	udivx	%g6,	0x020C,	%o3
	fmovsvs	%icc,	%f15,	%f12
	fnegd	%f28,	%f24
	edge32n	%o4,	%i3,	%i2
	ldsh	[%l7 + 0x3A],	%l4
	and	%g5,	0x1C08,	%l5
	mulscc	%o1,	0x0F51,	%g2
	udivcc	%i0,	0x1866,	%l6
	movrne	%g1,	%g4,	%i5
	fmovsleu	%xcc,	%f0,	%f9
	edge8ln	%l0,	%g3,	%i7
	xorcc	%o7,	0x0A04,	%i6
	alignaddr	%g7,	%l3,	%i4
	stw	%o0,	[%l7 + 0x34]
	popc	%i1,	%o2
	sdivcc	%o6,	0x07C7,	%o5
	edge8ln	%l2,	%l1,	%g6
	fzero	%f10
	fsrc1s	%f14,	%f24
	movvs	%xcc,	%o4,	%i3
	sdivx	%i2,	0x0E4F,	%o3
	ld	[%l7 + 0x4C],	%f18
	addcc	%l4,	%g5,	%l5
	subccc	%o1,	0x01F3,	%i0
	fpmerge	%f27,	%f0,	%f28
	and	%l6,	0x15BB,	%g1
	addc	%g2,	%i5,	%g4
	and	%l0,	0x158D,	%g3
	xorcc	%i7,	%o7,	%i6
	sllx	%l3,	0x0F,	%i4
	udivx	%o0,	0x0AE4,	%i1
	edge32l	%g7,	%o2,	%o6
	fmovscs	%xcc,	%f18,	%f17
	srlx	%o5,	%l2,	%l1
	lduh	[%l7 + 0x68],	%o4
	udiv	%g6,	0x0459,	%i2
	smul	%i3,	0x0000,	%l4
	movre	%g5,	0x212,	%l5
	movcs	%xcc,	%o1,	%i0
	sll	%o3,	0x03,	%l6
	udivx	%g2,	0x1F20,	%g1
	move	%icc,	%i5,	%l0
	xorcc	%g3,	0x09F9,	%i7
	orn	%g4,	%i6,	%l3
	fandnot1s	%f29,	%f11,	%f15
	edge32ln	%o7,	%i4,	%o0
	smul	%i1,	%o2,	%g7
	fmovrse	%o5,	%f12,	%f27
	nop
	set	0x68, %i7
	ldx	[%l7 + %i7],	%o6
	stx	%l2,	[%l7 + 0x28]
	sub	%o4,	%l1,	%i2
	smul	%g6,	%l4,	%i3
	movrlez	%l5,	0x28A,	%o1
	stx	%i0,	[%l7 + 0x10]
	movrlez	%g5,	0x226,	%l6
	fnands	%f20,	%f12,	%f30
	xorcc	%g2,	0x17E7,	%o3
	xorcc	%i5,	%l0,	%g3
	array32	%i7,	%g4,	%g1
	fmovscc	%xcc,	%f16,	%f15
	move	%icc,	%i6,	%o7
	edge16ln	%l3,	%i4,	%i1
	movg	%icc,	%o0,	%o2
	fnot1	%f4,	%f12
	move	%icc,	%o5,	%g7
	setx loop_84, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_84: 	xorcc	%o4,	%i2,	%g6
	stx	%l4,	[%l7 + 0x68]
	fandnot1	%f12,	%f10,	%f26
	subcc	%l1,	%i3,	%l5
	movl	%xcc,	%o1,	%g5
	mova	%icc,	%l6,	%i0
	fmovrdne	%o3,	%f6,	%f24
	srlx	%i5,	%l0,	%g3
	fmuld8sux16	%f16,	%f12,	%f8
	fmovdpos	%xcc,	%f3,	%f18
	fcmple16	%f6,	%f16,	%i7
	movneg	%xcc,	%g4,	%g2
	andn	%i6,	0x06FB,	%g1
	or	%o7,	%l3,	%i1
	fmovdneg	%xcc,	%f17,	%f5
	movneg	%xcc,	%o0,	%o2
	ldsb	[%l7 + 0x20],	%i4
	ldx	[%l7 + 0x78],	%o5
	sth	%g7,	[%l7 + 0x46]
	xor	%l2,	0x1DD6,	%o4
	edge16l	%o6,	%g6,	%l4
	restore %l1, 0x01F3, %i2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fnand	%f30,	%f22,	%f10
	popc	%i3,	%l5
	fsrc1	%f6,	%f4
	sra	%g5,	%o1,	%l6
	nop
	set	0x4B, %o2
	ldsb	[%l7 + %o2],	%o3
	edge8ln	%i5,	%i0,	%l0
	sth	%i7,	[%l7 + 0x36]
	fmovrslez	%g3,	%f27,	%f1
	fpack32	%f20,	%f22,	%f28
	fmovs	%f7,	%f28
	smulcc	%g4,	%g2,	%i6
	edge16ln	%g1,	%o7,	%i1
	addc	%l3,	0x057F,	%o2
	fpsub16s	%f12,	%f31,	%f11
	edge16n	%o0,	%i4,	%g7
	fmovdleu	%icc,	%f3,	%f31
	edge8n	%o5,	%l2,	%o6
	fnand	%f0,	%f16,	%f10
	movne	%icc,	%o4,	%g6
	ldd	[%l7 + 0x20],	%l0
	fmovrsgez	%i2,	%f3,	%f16
	fsrc1s	%f23,	%f26
	alignaddrl	%l4,	%l5,	%g5
	movl	%icc,	%o1,	%l6
	umulcc	%o3,	0x14CB,	%i5
	alignaddr	%i3,	%i0,	%l0
	fornot2	%f6,	%f26,	%f20
	ldd	[%l7 + 0x48],	%i6
	movle	%icc,	%g4,	%g3
	ld	[%l7 + 0x64],	%f25
	fmovsa	%xcc,	%f3,	%f27
	movrgez	%i6,	%g1,	%g2
	sra	%o7,	0x03,	%l3
	lduw	[%l7 + 0x50],	%o2
	move	%icc,	%i1,	%o0
	udivcc	%i4,	0x0672,	%o5
	addccc	%l2,	%g7,	%o6
	fpsub16s	%f9,	%f3,	%f25
	nop
	set	0x24, %o1
	sth	%o4,	[%l7 + %o1]
	umul	%g6,	%l1,	%i2
	move	%icc,	%l5,	%l4
	udivx	%g5,	0x12CD,	%l6
	fsrc2	%f10,	%f14
	movneg	%xcc,	%o3,	%i5
	movn	%icc,	%i3,	%i0
	edge32l	%o1,	%i7,	%g4
	movneg	%icc,	%l0,	%g3
	ldub	[%l7 + 0x4B],	%i6
	ldd	[%l7 + 0x30],	%g0
	srax	%o7,	%l3,	%g2
	edge32	%o2,	%o0,	%i1
	movrlez	%o5,	%l2,	%g7
	or	%i4,	0x0E7D,	%o6
	or	%g6,	0x079B,	%o4
	and	%i2,	%l5,	%l4
	ldsb	[%l7 + 0x77],	%g5
	srlx	%l1,	%o3,	%i5
	srax	%i3,	0x0E,	%i0
	umul	%o1,	0x0A11,	%i7
	fmovsle	%icc,	%f16,	%f6
	movle	%xcc,	%g4,	%l0
	movle	%xcc,	%l6,	%g3
	movge	%xcc,	%i6,	%o7
	movn	%icc,	%g1,	%g2
	udiv	%o2,	0x1BC3,	%l3
	fcmple16	%f22,	%f12,	%o0
	ldsw	[%l7 + 0x70],	%i1
	movcc	%xcc,	%l2,	%g7
	fandnot2	%f10,	%f2,	%f12
	ldd	[%l7 + 0x30],	%f18
	fmovsvc	%icc,	%f21,	%f27
	ldx	[%l7 + 0x58],	%o5
	umul	%i4,	0x1203,	%o6
	fmovdvc	%icc,	%f26,	%f6
	sllx	%o4,	%i2,	%l5
	lduh	[%l7 + 0x1C],	%l4
	ldsb	[%l7 + 0x1F],	%g5
	array32	%g6,	%o3,	%l1
	ldsw	[%l7 + 0x28],	%i3
	popc	0x0BFD,	%i0
	movrlez	%i5,	%o1,	%i7
	sra	%l0,	%l6,	%g4
	fmovsne	%xcc,	%f11,	%f25
	popc	%i6,	%g3
	andn	%g1,	0x0889,	%o7
	edge16ln	%o2,	%g2,	%l3
	movleu	%icc,	%i1,	%o0
	udivcc	%g7,	0x16BF,	%l2
	movge	%icc,	%o5,	%o6
	nop
	set	0x68, %o3
	ldsb	[%l7 + %o3],	%o4
	edge32	%i2,	%i4,	%l4
	stb	%g5,	[%l7 + 0x44]
	ld	[%l7 + 0x1C],	%f8
	movrlz	%g6,	0x17B,	%o3
	movrgez	%l5,	%l1,	%i0
	add	%i3,	%i5,	%o1
	movcs	%xcc,	%i7,	%l6
	addcc	%l0,	%g4,	%g3
	edge32n	%i6,	%g1,	%o2
	fpsub16s	%f27,	%f25,	%f8
	edge32	%o7,	%g2,	%l3
	fcmple32	%f20,	%f26,	%o0
	fxnors	%f9,	%f21,	%f11
	xorcc	%g7,	0x0941,	%i1
	sir	0x1C20
	sll	%l2,	%o5,	%o4
	movrne	%i2,	%i4,	%o6
	udivx	%l4,	0x1F7B,	%g5
	xnor	%o3,	%l5,	%g6
	mulx	%l1,	0x10A6,	%i0
	std	%f12,	[%l7 + 0x10]
	fpsub32s	%f19,	%f1,	%f0
	srlx	%i5,	%i3,	%i7
	stb	%o1,	[%l7 + 0x52]
	movneg	%xcc,	%l6,	%l0
	sdivx	%g4,	0x15B5,	%g3
	xnorcc	%i6,	0x06BE,	%o2
	add	%g1,	0x041F,	%o7
	edge8	%g2,	%o0,	%g7
	addccc	%l3,	%l2,	%i1
	movn	%icc,	%o5,	%o4
	xnorcc	%i4,	0x150D,	%i2
	movre	%o6,	0x009,	%l4
	fmul8x16au	%f3,	%f15,	%f12
	udivcc	%o3,	0x1398,	%g5
	stw	%l5,	[%l7 + 0x54]
	umul	%g6,	%l1,	%i0
	sllx	%i5,	0x0E,	%i3
	edge8n	%o1,	%i7,	%l0
	edge32l	%l6,	%g3,	%i6
	udiv	%o2,	0x1925,	%g1
	fmovsgu	%xcc,	%f3,	%f28
	stw	%g4,	[%l7 + 0x38]
	movl	%xcc,	%g2,	%o7
	fornot1	%f14,	%f4,	%f12
	mulx	%o0,	%l3,	%g7
	edge8n	%l2,	%i1,	%o4
	movneg	%icc,	%o5,	%i4
	ldd	[%l7 + 0x48],	%f18
	mova	%icc,	%i2,	%l4
	movcs	%icc,	%o6,	%g5
	fsrc2	%f28,	%f10
	srlx	%o3,	0x10,	%g6
	sub	%l5,	%l1,	%i5
	addccc	%i0,	%o1,	%i3
	movrgez	%l0,	0x1C2,	%i7
	fmovrsne	%g3,	%f27,	%f10
	fmovdne	%icc,	%f15,	%f3
	sllx	%i6,	0x12,	%o2
	mulx	%g1,	0x1D67,	%g4
	array16	%l6,	%o7,	%g2
	movleu	%xcc,	%o0,	%g7
	edge32n	%l3,	%l2,	%o4
	edge16	%i1,	%o5,	%i4
	std	%f30,	[%l7 + 0x70]
	subc	%l4,	%i2,	%g5
	st	%f8,	[%l7 + 0x40]
	movrlz	%o6,	%o3,	%l5
	fmovrdlez	%g6,	%f8,	%f6
	edge32ln	%i5,	%i0,	%o1
	ldsw	[%l7 + 0x44],	%i3
	fmovdn	%icc,	%f22,	%f16
	edge8n	%l0,	%i7,	%g3
	subccc	%i6,	0x0036,	%l1
	fsrc2	%f2,	%f28
	std	%f22,	[%l7 + 0x78]
	sdivcc	%o2,	0x1B3F,	%g1
	fmovsvc	%xcc,	%f11,	%f25
	movrgez	%l6,	%g4,	%o7
	edge32ln	%g2,	%g7,	%o0
	ldd	[%l7 + 0x20],	%l2
	fands	%f7,	%f29,	%f28
	movneg	%xcc,	%l2,	%o4
	smulcc	%o5,	0x1F02,	%i1
	array32	%i4,	%i2,	%l4
	sdivx	%o6,	0x1407,	%o3
	ldub	[%l7 + 0x17],	%l5
	movvs	%icc,	%g5,	%g6
	edge8l	%i0,	%o1,	%i5
	andcc	%i3,	0x0A6E,	%l0
	subcc	%g3,	%i6,	%i7
	move	%xcc,	%l1,	%o2
	stw	%l6,	[%l7 + 0x4C]
	alignaddr	%g4,	%g1,	%g2
	umulcc	%o7,	0x169B,	%o0
	subcc	%l3,	%g7,	%l2
	stb	%o5,	[%l7 + 0x7E]
	andn	%o4,	%i4,	%i2
	st	%f10,	[%l7 + 0x30]
	movrlz	%l4,	0x142,	%i1
	movvs	%icc,	%o6,	%o3
	edge16l	%l5,	%g6,	%i0
	popc	0x0CCA,	%g5
	movl	%icc,	%i5,	%i3
	movrlz	%o1,	%l0,	%i6
	xorcc	%i7,	0x1B30,	%l1
	movneg	%icc,	%g3,	%l6
	udivcc	%o2,	0x1479,	%g1
	array32	%g2,	%o7,	%o0
	sir	0x1551
	fmovrdlz	%g4,	%f26,	%f28
	movrlz	%l3,	0x324,	%g7
	edge16	%o5,	%o4,	%i4
	movge	%xcc,	%l2,	%l4
	stw	%i2,	[%l7 + 0x6C]
	movgu	%icc,	%o6,	%i1
	addccc	%l5,	%g6,	%i0
	fcmple16	%f4,	%f20,	%g5
	sra	%o3,	%i5,	%i3
	edge16ln	%o1,	%i6,	%i7
	fmovrde	%l0,	%f4,	%f0
	ldx	[%l7 + 0x28],	%g3
	popc	0x1DD6,	%l6
	fmovrslez	%o2,	%f28,	%f11
	edge32n	%l1,	%g2,	%o7
	fmovsvc	%icc,	%f3,	%f8
	alignaddr	%o0,	%g1,	%l3
	srax	%g7,	%g4,	%o5
	sethi	0x0471,	%i4
	smulcc	%o4,	0x1623,	%l2
	sethi	0x1FB4,	%i2
	movre	%l4,	%o6,	%l5
	ld	[%l7 + 0x44],	%f18
	array32	%g6,	%i1,	%g5
	popc	%o3,	%i5
	std	%f20,	[%l7 + 0x60]
	ld	[%l7 + 0x50],	%f17
	sllx	%i3,	%o1,	%i6
	and	%i0,	0x1D79,	%i7
	edge32l	%l0,	%l6,	%g3
	srax	%o2,	%l1,	%o7
	stw	%g2,	[%l7 + 0x64]
	sub	%g1,	%l3,	%o0
	umul	%g4,	0x0702,	%g7
	alignaddr	%i4,	%o5,	%o4
	edge16l	%l2,	%l4,	%i2
	ldsw	[%l7 + 0x08],	%o6
	movn	%xcc,	%g6,	%i1
	movgu	%icc,	%g5,	%o3
	movleu	%icc,	%i5,	%l5
	move	%icc,	%o1,	%i3
	fcmpne32	%f24,	%f18,	%i0
	sth	%i6,	[%l7 + 0x4E]
	movpos	%icc,	%l0,	%i7
	fpsub32	%f10,	%f30,	%f0
	fmovdvc	%icc,	%f13,	%f14
	smulcc	%g3,	0x0AFA,	%l6
	ldx	[%l7 + 0x38],	%o2
	orcc	%l1,	0x1686,	%o7
	fmovdcc	%xcc,	%f24,	%f31
	fmovsg	%icc,	%f31,	%f22
	fandnot2	%f10,	%f4,	%f6
	fcmpeq32	%f20,	%f2,	%g2
	std	%f16,	[%l7 + 0x08]
	srlx	%g1,	%o0,	%l3
	smulcc	%g7,	%g4,	%o5
	fpsub32s	%f5,	%f1,	%f14
	move	%icc,	%o4,	%l2
	subc	%i4,	0x033F,	%i2
	movre	%l4,	%o6,	%i1
	edge16l	%g6,	%g5,	%o3
	smul	%i5,	0x1BE3,	%o1
	addc	%l5,	%i3,	%i0
	subcc	%l0,	0x094E,	%i6
	add	%i7,	0x1466,	%l6
	mulscc	%g3,	0x0753,	%o2
	srlx	%l1,	0x1E,	%o7
	fpack32	%f26,	%f22,	%f12
	udivx	%g2,	0x045B,	%o0
	edge8ln	%g1,	%l3,	%g7
	ld	[%l7 + 0x78],	%f13
	movvc	%icc,	%g4,	%o4
	fandnot2	%f12,	%f18,	%f26
	fpsub16s	%f30,	%f30,	%f24
	alignaddr	%l2,	%o5,	%i4
	movrlez	%i2,	0x0E5,	%l4
	fmovdn	%icc,	%f23,	%f3
	edge16	%o6,	%i1,	%g6
	movpos	%xcc,	%g5,	%o3
	xnorcc	%o1,	%l5,	%i3
	fmovspos	%xcc,	%f21,	%f15
	ldsh	[%l7 + 0x58],	%i0
	movpos	%xcc,	%l0,	%i5
	std	%f10,	[%l7 + 0x38]
	alignaddrl	%i7,	%l6,	%i6
	movrgez	%g3,	%o2,	%o7
	sllx	%l1,	0x1D,	%g2
	edge32ln	%g1,	%o0,	%l3
	edge32	%g7,	%o4,	%l2
	movne	%icc,	%o5,	%i4
	smul	%i2,	0x099B,	%l4
	movn	%icc,	%o6,	%i1
	movgu	%xcc,	%g6,	%g4
	sllx	%o3,	0x15,	%g5
	fmovsa	%xcc,	%f11,	%f1
	ldx	[%l7 + 0x48],	%o1
	ldd	[%l7 + 0x78],	%i2
	sra	%i0,	%l0,	%l5
	sdivx	%i7,	0x1071,	%i5
	movn	%xcc,	%l6,	%i6
	fmovde	%icc,	%f26,	%f22
	ld	[%l7 + 0x3C],	%f14
	or	%g3,	%o2,	%l1
	movg	%xcc,	%g2,	%o7
	fmovrdne	%o0,	%f24,	%f8
	array8	%l3,	%g1,	%g7
	edge32l	%l2,	%o5,	%i4
	fsrc2	%f14,	%f30
	save %i2, 0x1065, %l4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge32n	%o4,	%o6,	%i1
	fmovsvs	%xcc,	%f27,	%f0
	fmovrde	%g4,	%f10,	%f20
	udivcc	%g6,	0x02C3,	%o3
	fpsub32s	%f20,	%f31,	%f0
	udivx	%o1,	0x01D5,	%g5
	addccc	%i0,	%i3,	%l5
	edge8	%i7,	%l0,	%i5
	andncc	%i6,	%g3,	%o2
	std	%f16,	[%l7 + 0x30]
	orncc	%l1,	0x1BF2,	%g2
	edge16n	%o7,	%o0,	%l3
	array32	%l6,	%g1,	%g7
	movleu	%icc,	%o5,	%i4
	fandnot1	%f24,	%f24,	%f6
	movrlz	%l2,	0x1E1,	%i2
	move	%icc,	%l4,	%o4
	sir	0x1FB3
	sub	%o6,	%g4,	%i1
	array8	%o3,	%g6,	%g5
	edge8l	%i0,	%i3,	%o1
	fzero	%f2
	ldd	[%l7 + 0x20],	%i6
	andcc	%l0,	0x0133,	%l5
	sll	%i5,	0x00,	%i6
	fexpand	%f28,	%f14
	movle	%icc,	%o2,	%g3
	movl	%icc,	%g2,	%l1
	fmovrdgz	%o0,	%f20,	%f2
	edge32	%l3,	%l6,	%o7
	movge	%icc,	%g1,	%o5
	subccc	%g7,	0x0EE8,	%l2
	fmovdcc	%icc,	%f2,	%f24
	movleu	%xcc,	%i2,	%l4
	st	%f29,	[%l7 + 0x24]
	mulx	%o4,	%o6,	%i4
	subcc	%g4,	0x1F22,	%i1
	fone	%f0
	udivx	%g6,	0x07E2,	%g5
	addccc	%i0,	%i3,	%o1
	movge	%xcc,	%i7,	%l0
	fmovrdgz	%o3,	%f20,	%f2
	array32	%i5,	%i6,	%o2
	subcc	%l5,	0x1951,	%g3
	mulx	%g2,	%l1,	%o0
	movre	%l3,	0x0EA,	%o7
	sth	%g1,	[%l7 + 0x10]
	subccc	%l6,	0x12E6,	%g7
	edge32ln	%l2,	%o5,	%l4
	fpadd32	%f22,	%f6,	%f2
	fmovsvs	%icc,	%f25,	%f28
	fmuld8sux16	%f27,	%f11,	%f6
	fcmple16	%f26,	%f14,	%o4
	movne	%xcc,	%i2,	%i4
	sdivx	%o6,	0x0D0A,	%i1
	fpadd16s	%f18,	%f26,	%f0
	udivcc	%g6,	0x0D74,	%g4
	nop
	set	0x10, %i1
	ldd	[%l7 + %i1],	%f28
	srl	%i0,	%i3,	%o1
	andcc	%i7,	0x13F7,	%g5
	ld	[%l7 + 0x60],	%f1
	edge16	%o3,	%l0,	%i6
	fcmpeq32	%f28,	%f0,	%i5
	ldx	[%l7 + 0x50],	%o2
	movgu	%xcc,	%g3,	%l5
	udiv	%l1,	0x0B98,	%o0
	fpadd16s	%f27,	%f9,	%f16
	lduh	[%l7 + 0x42],	%g2
	fcmpd	%fcc3,	%f12,	%f8
	fxnor	%f16,	%f2,	%f10
	fornot2s	%f7,	%f29,	%f29
	edge8n	%l3,	%o7,	%l6
	fmovsl	%icc,	%f14,	%f29
	fpadd32s	%f27,	%f26,	%f8
	xorcc	%g1,	0x0A0E,	%l2
	movgu	%xcc,	%o5,	%g7
	edge32n	%o4,	%i2,	%i4
	edge8ln	%l4,	%o6,	%g6
	umul	%g4,	%i1,	%i3
	fmovsge	%xcc,	%f7,	%f28
	fpadd32s	%f9,	%f1,	%f3
	save %i0, %i7, %o1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movl	%xcc,	%g5,	%l0
	edge32ln	%i6,	%i5,	%o3
	sllx	%g3,	0x0E,	%o2
	mova	%icc,	%l5,	%l1
	xorcc	%g2,	0x0781,	%l3
	movrne	%o0,	0x0D0,	%l6
	edge32	%g1,	%l2,	%o5
	xorcc	%o7,	0x1D72,	%o4
	ldd	[%l7 + 0x38],	%f0
	orn	%g7,	0x1060,	%i2
	fmovda	%icc,	%f17,	%f29
	stx	%i4,	[%l7 + 0x50]
	sub	%o6,	0x115D,	%l4
	ldx	[%l7 + 0x20],	%g6
	fmovscc	%icc,	%f14,	%f15
	fmovdcc	%icc,	%f6,	%f30
	udivcc	%g4,	0x1D0E,	%i1
	array8	%i0,	%i7,	%o1
	ldsw	[%l7 + 0x74],	%i3
	array16	%g5,	%i6,	%l0
	lduw	[%l7 + 0x38],	%o3
	movleu	%xcc,	%i5,	%g3
	movvc	%xcc,	%l5,	%l1
	nop
	set	0x68, %g5
	ldd	[%l7 + %g5],	%f0
	move	%xcc,	%g2,	%l3
	fmovscs	%icc,	%f28,	%f13
	and	%o2,	0x079B,	%l6
	fmul8x16	%f1,	%f6,	%f10
	sllx	%g1,	0x1B,	%l2
	add	%o0,	0x02B0,	%o5
	movvs	%icc,	%o7,	%g7
	mova	%xcc,	%o4,	%i4
	fmul8sux16	%f10,	%f24,	%f24
	fmovdleu	%xcc,	%f15,	%f15
	umulcc	%i2,	0x09E5,	%o6
	fcmpgt32	%f20,	%f22,	%l4
	andncc	%g6,	%i1,	%g4
	orcc	%i0,	0x0172,	%i7
	mulx	%o1,	%i3,	%i6
	movrne	%g5,	0x270,	%o3
	sdivcc	%i5,	0x0F4E,	%g3
	mulx	%l0,	%l5,	%l1
	std	%f8,	[%l7 + 0x48]
	addcc	%l3,	%o2,	%g2
	ldsh	[%l7 + 0x3A],	%g1
	sub	%l2,	0x19C6,	%l6
	stx	%o5,	[%l7 + 0x60]
	sir	0x12DF
	edge32	%o7,	%o0,	%o4
	or	%g7,	0x1113,	%i2
	st	%f26,	[%l7 + 0x54]
	xnor	%o6,	%l4,	%g6
	edge16l	%i1,	%g4,	%i4
	movneg	%xcc,	%i0,	%i7
	movpos	%xcc,	%i3,	%o1
	fpmerge	%f5,	%f17,	%f4
	edge8	%i6,	%g5,	%o3
	edge32l	%i5,	%g3,	%l5
	fmovsn	%xcc,	%f31,	%f6
	fpack32	%f2,	%f18,	%f26
	or	%l1,	0x164C,	%l3
	subccc	%o2,	%l0,	%g2
	lduw	[%l7 + 0x3C],	%g1
	movrlz	%l6,	0x0A4,	%o5
	edge16n	%o7,	%l2,	%o0
	fcmple32	%f0,	%f14,	%g7
	orn	%i2,	%o6,	%l4
	edge8	%o4,	%i1,	%g6
	stb	%g4,	[%l7 + 0x45]
	movleu	%icc,	%i0,	%i7
	umul	%i3,	0x158B,	%i4
	movne	%icc,	%i6,	%g5
	movgu	%icc,	%o1,	%o3
	movvc	%xcc,	%i5,	%l5
	edge32	%g3,	%l1,	%o2
	fand	%f28,	%f14,	%f26
	srax	%l3,	%g2,	%l0
	pdist	%f14,	%f2,	%f26
	addccc	%l6,	%g1,	%o7
	subcc	%o5,	%o0,	%l2
	st	%f28,	[%l7 + 0x58]
	alignaddr	%i2,	%g7,	%l4
	edge16ln	%o4,	%o6,	%i1
	fpack16	%f16,	%f4
	srl	%g6,	%i0,	%i7
	umul	%g4,	0x0C0A,	%i4
	movrlz	%i6,	%g5,	%o1
	ldd	[%l7 + 0x30],	%o2
	umulcc	%i5,	%l5,	%i3
	movg	%xcc,	%g3,	%l1
	edge32ln	%l3,	%g2,	%l0
	fcmpes	%fcc3,	%f1,	%f13
	subccc	%o2,	0x1F9C,	%l6
	movpos	%xcc,	%g1,	%o7
	bshuffle	%f4,	%f10,	%f4
	movne	%xcc,	%o0,	%o5
	save %i2, %l2, %g7
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	edge8l	%l4,	%o4,	%i1
	movpos	%icc,	%o6,	%g6
	movg	%icc,	%i7,	%g4
	addcc	%i0,	%i6,	%g5
	fmovsg	%icc,	%f30,	%f1
	movvc	%icc,	%i4,	%o1
	edge16n	%o3,	%i5,	%l5
	subc	%g3,	0x06B1,	%l1
	subccc	%i3,	0x16CC,	%l3
	sethi	0x10F4,	%l0
	movneg	%icc,	%o2,	%g2
	umulcc	%l6,	%o7,	%o0
	nop
	set	0x60, %l0
	ldd	[%l7 + %l0],	%f24
	fcmple16	%f2,	%f20,	%o5
	addcc	%g1,	0x1C40,	%i2
	andncc	%g7,	%l4,	%o4
	or	%l2,	%i1,	%o6
	fmovscc	%icc,	%f15,	%f19
	movrlz	%i7,	%g6,	%g4
	fpsub16s	%f27,	%f11,	%f30
	add	%i6,	%g5,	%i4
	edge16	%o1,	%i0,	%o3
	xnorcc	%l5,	%g3,	%i5
	stb	%l1,	[%l7 + 0x27]
	movn	%icc,	%l3,	%l0
	fmul8x16	%f2,	%f18,	%f18
	array32	%i3,	%g2,	%l6
	stb	%o2,	[%l7 + 0x40]
	movcs	%icc,	%o7,	%o0
	ldsh	[%l7 + 0x0C],	%o5
	srlx	%i2,	0x02,	%g1
	edge8n	%g7,	%l4,	%o4
	sllx	%l2,	%i1,	%o6
	stx	%g6,	[%l7 + 0x50]
	movrlez	%g4,	0x215,	%i6
	edge32	%i7,	%i4,	%g5
	fnot2	%f6,	%f2
	xnorcc	%o1,	%i0,	%o3
	save %l5, 0x0B38, %i5
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	stb	%g3,	[%l7 + 0x5E]
	sra	%l3,	%l0,	%i3
	movne	%icc,	%l1,	%g2
	alignaddr	%o2,	%l6,	%o7
	and	%o0,	0x0495,	%i2
	stx	%o5,	[%l7 + 0x38]
	movne	%icc,	%g1,	%l4
	movneg	%icc,	%o4,	%g7
	andn	%i1,	%o6,	%g6
	fsrc2s	%f24,	%f30
	xorcc	%g4,	0x0D1D,	%i6
	sra	%i7,	%i4,	%l2
	movpos	%xcc,	%o1,	%g5
	ldsw	[%l7 + 0x70],	%i0
	mova	%xcc,	%l5,	%i5
	stw	%g3,	[%l7 + 0x64]
	srax	%o3,	0x18,	%l0
	movge	%xcc,	%i3,	%l1
	st	%f14,	[%l7 + 0x34]
	fpsub32s	%f20,	%f23,	%f8
	fmovrdlez	%g2,	%f16,	%f0
	addcc	%o2,	0x03AE,	%l6
	stb	%l3,	[%l7 + 0x18]
	udivx	%o0,	0x1282,	%i2
	ldub	[%l7 + 0x0D],	%o7
	movge	%xcc,	%o5,	%g1
	fmovdl	%icc,	%f9,	%f13
	ldub	[%l7 + 0x42],	%l4
	movre	%g7,	0x3CB,	%o4
	popc	%o6,	%g6
	andncc	%g4,	%i6,	%i7
	sdiv	%i4,	0x1EE3,	%l2
	movneg	%xcc,	%i1,	%g5
	array32	%i0,	%o1,	%i5
	edge8n	%l5,	%g3,	%l0
	edge16ln	%o3,	%l1,	%i3
	movn	%icc,	%o2,	%g2
	srl	%l6,	%o0,	%i2
	ld	[%l7 + 0x2C],	%f31
	umul	%l3,	0x08B1,	%o7
	srl	%o5,	%l4,	%g1
	movcs	%xcc,	%o4,	%g7
	edge32ln	%o6,	%g4,	%i6
	edge8n	%g6,	%i7,	%i4
	sth	%i1,	[%l7 + 0x58]
	movrlez	%l2,	0x03F,	%g5
	subccc	%i0,	0x1DB9,	%o1
	sll	%l5,	%i5,	%l0
	fmovsle	%icc,	%f8,	%f10
	edge8ln	%o3,	%l1,	%g3
	bshuffle	%f6,	%f18,	%f16
	fpsub32s	%f29,	%f29,	%f15
	mova	%icc,	%o2,	%i3
	fmovdgu	%icc,	%f19,	%f16
	stx	%l6,	[%l7 + 0x38]
	edge8ln	%o0,	%g2,	%l3
	fcmpd	%fcc3,	%f22,	%f8
	mulx	%o7,	%o5,	%l4
	movl	%xcc,	%i2,	%g1
	umulcc	%o4,	0x08AD,	%g7
	addc	%o6,	0x1D5F,	%g4
	andcc	%g6,	0x122F,	%i7
	fcmpne16	%f24,	%f6,	%i6
	srax	%i1,	%i4,	%l2
	stx	%g5,	[%l7 + 0x58]
	edge8	%o1,	%l5,	%i5
	fmovde	%xcc,	%f12,	%f17
	fors	%f6,	%f13,	%f0
	sdivx	%l0,	0x0B3F,	%o3
	stb	%i0,	[%l7 + 0x5E]
	fpack16	%f26,	%f15
	umul	%g3,	%l1,	%o2
	movvc	%xcc,	%l6,	%o0
	movrgez	%i3,	%l3,	%g2
	pdist	%f6,	%f20,	%f18
	edge8ln	%o7,	%l4,	%i2
	fmovrde	%g1,	%f10,	%f10
	fcmpgt32	%f30,	%f16,	%o5
	ld	[%l7 + 0x34],	%f21
	stb	%o4,	[%l7 + 0x6B]
	srl	%o6,	0x1D,	%g4
	ldd	[%l7 + 0x30],	%f18
	edge16n	%g7,	%g6,	%i7
	orncc	%i1,	%i6,	%i4
	sllx	%g5,	0x0A,	%l2
	fcmpgt32	%f26,	%f28,	%l5
	sub	%o1,	0x1759,	%i5
	fnot2	%f16,	%f6
	udivx	%l0,	0x0FBB,	%o3
	fnot2s	%f1,	%f14
	fmovrslez	%i0,	%f23,	%f12
	movleu	%xcc,	%g3,	%o2
	mulx	%l1,	%l6,	%i3
	movrgz	%l3,	%g2,	%o7
	fmuld8sux16	%f5,	%f20,	%f2
	edge32	%o0,	%i2,	%g1
	orcc	%o5,	0x0A0D,	%o4
	edge8l	%o6,	%g4,	%g7
	movneg	%xcc,	%l4,	%i7
	nop
	set	0x50, %l2
	ldd	[%l7 + %l2],	%i0
	ldub	[%l7 + 0x43],	%i6
	ldub	[%l7 + 0x45],	%g6
	movre	%g5,	%i4,	%l2
	nop
	set	0x08, %o6
	stw	%o1,	[%l7 + %o6]
	addcc	%l5,	%i5,	%o3
	fcmple32	%f12,	%f26,	%i0
	movre	%l0,	%o2,	%l1
	alignaddrl	%g3,	%i3,	%l6
	sllx	%g2,	0x1C,	%o7
	save %l3, %i2, %g1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xorcc	%o5,	%o0,	%o4
	sll	%o6,	0x09,	%g7
	ldsb	[%l7 + 0x40],	%l4
	stw	%g4,	[%l7 + 0x24]
	mulx	%i7,	%i6,	%i1
	movge	%xcc,	%g6,	%i4
	edge8	%l2,	%g5,	%l5
	fcmpne32	%f22,	%f2,	%i5
	edge32	%o3,	%o1,	%l0
	nop
	set	0x5C, %l3
	ldsh	[%l7 + %l3],	%o2
	st	%f23,	[%l7 + 0x34]
	smul	%i0,	%l1,	%i3
	fmovdn	%xcc,	%f21,	%f14
	fcmpd	%fcc2,	%f2,	%f18
	edge8	%g3,	%g2,	%l6
	orcc	%l3,	0x1D61,	%o7
	fcmpeq32	%f2,	%f22,	%g1
	movrlz	%o5,	0x3FA,	%o0
	fmovde	%icc,	%f21,	%f8
	alignaddr	%o4,	%i2,	%o6
	ld	[%l7 + 0x5C],	%f8
	edge32l	%g7,	%l4,	%g4
	xorcc	%i7,	0x1DAE,	%i1
	movgu	%icc,	%i6,	%g6
	xnor	%l2,	0x16DF,	%g5
	edge8	%l5,	%i4,	%i5
	lduh	[%l7 + 0x28],	%o1
	fcmpne16	%f24,	%f30,	%o3
	ldd	[%l7 + 0x40],	%o2
	array16	%l0,	%l1,	%i0
	orncc	%i3,	%g3,	%l6
	subc	%g2,	%l3,	%g1
	movn	%xcc,	%o7,	%o0
	mulx	%o4,	%i2,	%o6
	addc	%g7,	0x14D1,	%o5
	fmovspos	%icc,	%f8,	%f27
	fmovrslez	%g4,	%f22,	%f6
	fnands	%f1,	%f26,	%f8
	sll	%i7,	%i1,	%i6
	alignaddrl	%g6,	%l4,	%l2
	setx loop_85, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_85: 	orncc	%i5,	0x0D08,	%o1
	movg	%xcc,	%o3,	%o2
	edge32	%l1,	%i0,	%l0
	fmovrsgez	%i3,	%f31,	%f15
	edge8n	%l6,	%g3,	%g2
	movle	%icc,	%l3,	%g1
	sth	%o0,	[%l7 + 0x38]
	udivx	%o4,	0x0271,	%o7
	stw	%o6,	[%l7 + 0x2C]
	subcc	%i2,	0x072C,	%g7
	mova	%icc,	%g4,	%i7
	lduw	[%l7 + 0x44],	%o5
	st	%f25,	[%l7 + 0x4C]
	fcmple32	%f6,	%f18,	%i6
	sllx	%g6,	%l4,	%l2
	fnegd	%f10,	%f2
	stx	%g5,	[%l7 + 0x40]
	movrlez	%i1,	0x23A,	%i4
	stb	%i5,	[%l7 + 0x57]
	ldx	[%l7 + 0x10],	%o1
	mulscc	%l5,	0x1DB4,	%o2
	fmovrde	%l1,	%f2,	%f0
	fones	%f19
	fmovsleu	%icc,	%f22,	%f12
	orncc	%o3,	%i0,	%l0
	fmovrse	%l6,	%f2,	%f12
	fmovda	%xcc,	%f30,	%f0
	xnorcc	%i3,	%g3,	%g2
	add	%l3,	%g1,	%o0
	smul	%o4,	0x13E9,	%o7
	movg	%icc,	%o6,	%g7
	fcmpne32	%f30,	%f26,	%g4
	orn	%i2,	0x16F1,	%o5
	popc	0x1813,	%i7
	edge8n	%g6,	%l4,	%i6
	fpack32	%f22,	%f4,	%f16
	fone	%f8
	xnor	%g5,	%i1,	%l2
	fones	%f7
	addc	%i5,	0x1BCF,	%i4
	edge32n	%o1,	%l5,	%o2
	edge32	%o3,	%i0,	%l1
	stb	%l0,	[%l7 + 0x5B]
	ldsb	[%l7 + 0x71],	%i3
	udivcc	%l6,	0x0BA1,	%g3
	subcc	%l3,	%g1,	%g2
	movneg	%xcc,	%o4,	%o0
	movgu	%xcc,	%o7,	%o6
	xor	%g7,	%i2,	%o5
	fmovdleu	%xcc,	%f2,	%f17
	sir	0x17A9
	sdivx	%i7,	0x194B,	%g4
	mova	%xcc,	%l4,	%g6
	save %g5, %i1, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xnorcc	%i5,	0x190D,	%i4
	fcmple16	%f28,	%f0,	%o1
	fnands	%f21,	%f1,	%f4
	addcc	%l5,	0x021E,	%i6
	restore %o2, %i0, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movvc	%icc,	%l0,	%l1
	movvs	%xcc,	%l6,	%g3
	fsrc2s	%f27,	%f20
	movrgez	%i3,	%g1,	%l3
	edge8n	%o4,	%g2,	%o0
	edge16n	%o6,	%o7,	%g7
	movrgez	%i2,	%i7,	%o5
	edge16ln	%g4,	%g6,	%g5
	alignaddr	%i1,	%l4,	%l2
	array8	%i4,	%i5,	%o1
	move	%xcc,	%i6,	%l5
	save %o2, 0x12E8, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movgu	%xcc,	%l0,	%l1
	edge16ln	%i0,	%g3,	%l6
	lduh	[%l7 + 0x5C],	%g1
	or	%l3,	0x159B,	%o4
	ldsb	[%l7 + 0x49],	%i3
	udivx	%o0,	0x11B0,	%o6
	andncc	%o7,	%g2,	%g7
	movge	%icc,	%i2,	%o5
	ldd	[%l7 + 0x60],	%f8
	ldub	[%l7 + 0x50],	%g4
	movgu	%xcc,	%g6,	%g5
	setx loop_86, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_86: 	movcs	%icc,	%i4,	%i5
	srax	%l4,	0x10,	%i6
	xorcc	%l5,	0x0394,	%o1
	and	%o2,	%o3,	%l0
	andn	%i0,	0x1AED,	%l1
	srax	%l6,	%g1,	%l3
	movvc	%xcc,	%g3,	%o4
	ldub	[%l7 + 0x6C],	%i3
	mulscc	%o0,	%o6,	%g2
	movge	%xcc,	%o7,	%g7
	xor	%o5,	%i2,	%g6
	sll	%g4,	%i7,	%g5
	ldd	[%l7 + 0x30],	%f24
	movrlz	%i1,	0x001,	%i4
	movre	%i5,	0x1BE,	%l4
	fsrc1s	%f28,	%f17
	array16	%l2,	%i6,	%o1
	srax	%l5,	0x0B,	%o3
	xorcc	%o2,	%l0,	%i0
	edge32n	%l1,	%g1,	%l3
	or	%g3,	0x139A,	%o4
	fmovsa	%xcc,	%f26,	%f4
	sdiv	%l6,	0x0CC2,	%i3
	mulscc	%o0,	0x1E6B,	%g2
	edge16ln	%o6,	%g7,	%o5
	edge8ln	%o7,	%g6,	%g4
	stx	%i7,	[%l7 + 0x70]
	lduh	[%l7 + 0x1E],	%i2
	ldsw	[%l7 + 0x40],	%g5
	movcs	%xcc,	%i4,	%i5
	mulx	%i1,	%l4,	%i6
	fmovrsgz	%o1,	%f1,	%f19
	fmovda	%icc,	%f6,	%f12
	edge8ln	%l5,	%o3,	%o2
	subccc	%l0,	0x0985,	%l2
	edge32ln	%l1,	%i0,	%g1
	srax	%g3,	0x1A,	%l3
	ldsb	[%l7 + 0x3D],	%l6
	restore %o4, 0x1F17, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fxors	%f8,	%f26,	%f4
	movcs	%xcc,	%o0,	%g2
	addccc	%g7,	0x1891,	%o5
	fxnor	%f10,	%f30,	%f22
	fmovdleu	%icc,	%f0,	%f2
	fcmpeq32	%f18,	%f20,	%o7
	xnor	%g6,	0x03A5,	%o6
	ldsw	[%l7 + 0x60],	%g4
	fmul8sux16	%f30,	%f16,	%f4
	xorcc	%i2,	0x021F,	%g5
	fmovdcc	%xcc,	%f29,	%f0
	movgu	%icc,	%i4,	%i7
	fmovsl	%xcc,	%f11,	%f13
	fmovrdgez	%i1,	%f14,	%f22
	pdist	%f26,	%f16,	%f30
	fmovd	%f6,	%f12
	fmovscc	%icc,	%f6,	%f26
	or	%l4,	0x0004,	%i5
	array32	%o1,	%i6,	%l5
	movcs	%icc,	%o2,	%o3
	for	%f6,	%f18,	%f8
	fcmpgt32	%f24,	%f2,	%l0
	alignaddr	%l2,	%i0,	%g1
	edge8ln	%g3,	%l3,	%l6
	udivx	%l1,	0x0C36,	%o4
	movgu	%xcc,	%i3,	%o0
	movvc	%icc,	%g2,	%g7
	sra	%o5,	0x0A,	%g6
	udivx	%o7,	0x14BA,	%g4
	ldub	[%l7 + 0x30],	%i2
	fcmple32	%f18,	%f18,	%g5
	bshuffle	%f28,	%f20,	%f14
	movpos	%xcc,	%o6,	%i4
	andcc	%i1,	%i7,	%l4
	st	%f13,	[%l7 + 0x4C]
	ldd	[%l7 + 0x10],	%i4
	ldub	[%l7 + 0x1C],	%o1
	fornot1	%f8,	%f22,	%f18
	edge8n	%l5,	%i6,	%o2
	movrgez	%o3,	%l0,	%i0
	movgu	%icc,	%l2,	%g1
	addccc	%l3,	0x1148,	%g3
	addc	%l6,	0x1AA6,	%o4
	fmovrdlz	%i3,	%f22,	%f24
	xnor	%l1,	0x1D6D,	%o0
	or	%g2,	%g7,	%o5
	st	%f23,	[%l7 + 0x5C]
	ldsh	[%l7 + 0x08],	%o7
	std	%f30,	[%l7 + 0x28]
	xnorcc	%g4,	%i2,	%g6
	sub	%g5,	0x1199,	%o6
	fmovdpos	%icc,	%f5,	%f2
	andncc	%i4,	%i7,	%i1
	movneg	%xcc,	%l4,	%i5
	mova	%icc,	%o1,	%l5
	save %o2, 0x13C1, %o3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fpsub16	%f18,	%f26,	%f26
	std	%f30,	[%l7 + 0x40]
	movcs	%xcc,	%l0,	%i0
	lduh	[%l7 + 0x0E],	%i6
	movneg	%icc,	%g1,	%l3
	xnor	%l2,	0x1E25,	%l6
	andn	%o4,	0x12A7,	%i3
	ldsb	[%l7 + 0x3E],	%l1
	movneg	%icc,	%o0,	%g2
	fmovsn	%icc,	%f6,	%f31
	addc	%g3,	0x0E22,	%g7
	subc	%o7,	0x1871,	%g4
	fpadd32s	%f5,	%f25,	%f23
	nop
	set	0x44, %l5
	stw	%i2,	[%l7 + %l5]
	fpackfix	%f28,	%f1
	addcc	%g6,	%o5,	%o6
	umul	%g5,	%i7,	%i4
	edge16l	%l4,	%i5,	%o1
	sdiv	%l5,	0x154E,	%i1
	fpsub32s	%f2,	%f7,	%f27
	ldsh	[%l7 + 0x0A],	%o3
	mulscc	%o2,	%l0,	%i6
	nop
	set	0x3C, %i0
	stb	%g1,	[%l7 + %i0]
	movne	%icc,	%i0,	%l3
	setx loop_87, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_87: 	mova	%xcc,	%o4,	%l1
	fmovrde	%i3,	%f26,	%f26
	movl	%xcc,	%o0,	%g3
	movrgz	%g7,	%g2,	%g4
	movvs	%icc,	%i2,	%o7
	stb	%g6,	[%l7 + 0x31]
	stx	%o5,	[%l7 + 0x18]
	nop
	set	0x4C, %o4
	lduw	[%l7 + %o4],	%g5
	lduw	[%l7 + 0x20],	%i7
	edge8l	%i4,	%o6,	%i5
	edge16l	%o1,	%l4,	%l5
	alignaddrl	%i1,	%o2,	%l0
	popc	0x12C9,	%i6
	fmovrse	%g1,	%f13,	%f12
	fpsub16s	%f23,	%f23,	%f29
	movge	%xcc,	%i0,	%o3
	or	%l6,	%l3,	%l2
	fcmped	%fcc0,	%f28,	%f8
	fmovsvs	%icc,	%f15,	%f24
	movge	%xcc,	%l1,	%o4
	edge16n	%o0,	%i3,	%g7
	fmovdg	%xcc,	%f0,	%f30
	xnorcc	%g2,	%g4,	%i2
	movle	%xcc,	%g3,	%g6
	array8	%o7,	%o5,	%i7
	fmovs	%f20,	%f17
	ldsb	[%l7 + 0x3B],	%g5
	std	%f10,	[%l7 + 0x30]
	edge32	%o6,	%i5,	%o1
	ldsh	[%l7 + 0x54],	%i4
	edge8ln	%l5,	%i1,	%l4
	st	%f31,	[%l7 + 0x0C]
	movg	%icc,	%l0,	%o2
	xor	%i6,	%g1,	%o3
	fandnot1	%f12,	%f0,	%f4
	edge16ln	%i0,	%l6,	%l2
	ldx	[%l7 + 0x10],	%l1
	fcmpne32	%f10,	%f8,	%l3
	movn	%xcc,	%o0,	%i3
	fpmerge	%f7,	%f5,	%f6
	andncc	%o4,	%g7,	%g2
	sdivx	%i2,	0x0007,	%g3
	edge32n	%g4,	%g6,	%o5
	fandnot2	%f28,	%f2,	%f24
	sdivx	%o7,	0x08FF,	%g5
	popc	0x18C9,	%i7
	fmovrsgez	%i5,	%f24,	%f18
	edge32ln	%o6,	%i4,	%l5
	andncc	%i1,	%o1,	%l4
	edge16l	%o2,	%l0,	%g1
	edge8	%o3,	%i0,	%l6
	fcmped	%fcc3,	%f4,	%f2
	sethi	0x0400,	%l2
	srlx	%i6,	0x1D,	%l3
	popc	%o0,	%i3
	fmovs	%f19,	%f31
	xnor	%o4,	%g7,	%l1
	edge16n	%i2,	%g2,	%g3
	smulcc	%g4,	0x0F89,	%g6
	array32	%o7,	%g5,	%o5
	sdivcc	%i5,	0x0517,	%i7
	array8	%i4,	%o6,	%l5
	xnor	%i1,	0x0477,	%o1
	sethi	0x17C3,	%l4
	addccc	%l0,	0x10AA,	%g1
	srax	%o3,	%o2,	%i0
	movvc	%xcc,	%l2,	%i6
	movge	%icc,	%l6,	%l3
	mova	%xcc,	%i3,	%o4
	movge	%icc,	%g7,	%o0
	fmovsleu	%xcc,	%f11,	%f22
	popc	0x181F,	%l1
	and	%g2,	%g3,	%g4
	smulcc	%i2,	0x1C96,	%o7
	sra	%g5,	0x02,	%g6
	alignaddr	%i5,	%o5,	%i7
	sethi	0x1403,	%i4
	nop
	set	0x18, %g7
	ldsw	[%l7 + %g7],	%o6
	subccc	%l5,	0x09A1,	%i1
	array16	%l4,	%l0,	%g1
	subcc	%o3,	%o1,	%i0
	lduw	[%l7 + 0x50],	%o2
	ldsw	[%l7 + 0x78],	%i6
	fmovdvc	%xcc,	%f14,	%f14
	sdiv	%l6,	0x0235,	%l3
	ldsh	[%l7 + 0x1E],	%i3
	fxors	%f9,	%f14,	%f11
	fmovrde	%o4,	%f8,	%f24
	fnegd	%f22,	%f26
	udivx	%l2,	0x1D7A,	%g7
	fnegd	%f10,	%f22
	fnegs	%f21,	%f22
	ld	[%l7 + 0x08],	%f29
	andcc	%l1,	%o0,	%g3
	udivx	%g4,	0x0F52,	%g2
	stx	%i2,	[%l7 + 0x30]
	fmovrslz	%g5,	%f14,	%f2
	mova	%xcc,	%g6,	%o7
	addccc	%o5,	%i7,	%i4
	movn	%xcc,	%i5,	%o6
	fors	%f6,	%f16,	%f4
	std	%f16,	[%l7 + 0x28]
	udivcc	%i1,	0x08E0,	%l4
	addcc	%l5,	0x125B,	%l0
	sra	%o3,	%o1,	%g1
	sdiv	%i0,	0x0444,	%o2
	fcmpeq16	%f22,	%f12,	%l6
	fcmped	%fcc2,	%f20,	%f20
	fmovsgu	%icc,	%f10,	%f15
	fcmpd	%fcc0,	%f30,	%f22
	edge16l	%i6,	%l3,	%i3
	edge16	%o4,	%g7,	%l2
	movge	%icc,	%o0,	%g3
	addc	%l1,	%g2,	%i2
	andncc	%g4,	%g5,	%o7
	movrne	%g6,	0x228,	%i7
	sub	%i4,	%i5,	%o5
	movrgez	%i1,	%l4,	%l5
	st	%f26,	[%l7 + 0x24]
	sethi	0x0D26,	%o6
	fmovsg	%icc,	%f8,	%f5
	ldx	[%l7 + 0x68],	%l0
	addcc	%o1,	%o3,	%i0
	fpadd32	%f28,	%f28,	%f10
	movne	%icc,	%o2,	%g1
	ldsh	[%l7 + 0x56],	%l6
	sll	%i6,	0x15,	%l3
	fmovd	%f30,	%f30
	edge8	%i3,	%o4,	%l2
	lduw	[%l7 + 0x34],	%g7
	addcc	%o0,	0x0736,	%l1
	udiv	%g3,	0x1334,	%i2
	sllx	%g4,	0x08,	%g5
	udivx	%g2,	0x15A1,	%g6
	fnot2s	%f26,	%f25
	fmul8x16al	%f3,	%f21,	%f14
	srl	%o7,	%i7,	%i5
	movle	%icc,	%i4,	%i1
	stx	%l4,	[%l7 + 0x10]
	edge8	%o5,	%o6,	%l5
	std	%f20,	[%l7 + 0x60]
	movn	%icc,	%l0,	%o1
	movn	%xcc,	%o3,	%o2
	stw	%g1,	[%l7 + 0x78]
	fcmple32	%f0,	%f20,	%l6
	sll	%i6,	0x01,	%i0
	array32	%i3,	%l3,	%o4
	fmovdleu	%icc,	%f8,	%f24
	orncc	%g7,	%l2,	%l1
	and	%o0,	%i2,	%g3
	movpos	%icc,	%g5,	%g4
	movleu	%xcc,	%g6,	%g2
	fpadd32s	%f26,	%f29,	%f27
	edge8	%o7,	%i5,	%i7
	edge8l	%i4,	%i1,	%l4
	edge32n	%o6,	%l5,	%o5
	ldd	[%l7 + 0x50],	%f6
	movneg	%icc,	%l0,	%o1
	smulcc	%o2,	%o3,	%g1
	fmul8sux16	%f4,	%f26,	%f6
	srl	%i6,	0x12,	%l6
	movrlz	%i0,	0x1F2,	%l3
	lduw	[%l7 + 0x58],	%o4
	save %i3, %g7, %l1
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	xor	%l2,	%i2,	%g3
	movgu	%icc,	%o0,	%g4
	movrlez	%g5,	0x128,	%g6
	addcc	%o7,	0x0CF1,	%g2
	movge	%xcc,	%i5,	%i7
	array16	%i1,	%i4,	%o6
	array16	%l5,	%o5,	%l4
	sub	%l0,	%o2,	%o3
	fpsub16s	%f27,	%f19,	%f19
	sub	%o1,	%i6,	%g1
	addccc	%l6,	%l3,	%o4
	mulx	%i0,	%i3,	%l1
	movpos	%icc,	%l2,	%g7
	edge8n	%i2,	%g3,	%g4
	and	%o0,	0x0E67,	%g6
	fmovrdgez	%o7,	%f2,	%f16
	alignaddr	%g5,	%i5,	%i7
	nop
	set	0x38, %g1
	ldx	[%l7 + %g1],	%i1
	orn	%i4,	0x1084,	%g2
	alignaddr	%o6,	%o5,	%l5
	sllx	%l0,	0x03,	%l4
	popc	%o2,	%o1
	stb	%i6,	[%l7 + 0x57]
	umul	%o3,	%g1,	%l3
	xorcc	%l6,	0x199D,	%i0
	udivcc	%i3,	0x05B0,	%o4
	fmovdpos	%icc,	%f1,	%f10
	smul	%l1,	%g7,	%l2
	fpack32	%f0,	%f0,	%f24
	stb	%g3,	[%l7 + 0x67]
	sdivcc	%g4,	0x133F,	%i2
	fmovdneg	%icc,	%f11,	%f25
	fmovsvs	%xcc,	%f16,	%f6
	edge16n	%o0,	%g6,	%o7
	andncc	%i5,	%i7,	%g5
	fmovdvc	%icc,	%f9,	%f25
	ldub	[%l7 + 0x26],	%i1
	udiv	%g2,	0x0BD5,	%o6
	fzero	%f24
	fnot2	%f22,	%f0
	lduh	[%l7 + 0x46],	%i4
	edge8	%o5,	%l5,	%l0
	xor	%o2,	0x0DFD,	%o1
	movvs	%icc,	%i6,	%o3
	alignaddrl	%l4,	%l3,	%l6
	movpos	%xcc,	%i0,	%g1
	fnand	%f26,	%f26,	%f30
	ldd	[%l7 + 0x58],	%f2
	stw	%o4,	[%l7 + 0x38]
	restore %l1, %i3, %l2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	or	%g7,	%g3,	%g4
	ldx	[%l7 + 0x18],	%i2
	sth	%o0,	[%l7 + 0x5A]
	movleu	%icc,	%o7,	%g6
	edge32ln	%i5,	%g5,	%i7
	sethi	0x1FA2,	%g2
	movrne	%i1,	0x227,	%o6
	xnorcc	%i4,	0x1CFB,	%l5
	movvs	%icc,	%o5,	%o2
	orn	%l0,	0x1223,	%o1
	sdiv	%o3,	0x19E4,	%l4
	edge8l	%i6,	%l6,	%l3
	stb	%i0,	[%l7 + 0x12]
	movrgz	%g1,	0x3BB,	%o4
	udivcc	%l1,	0x0A39,	%l2
	fmovdvc	%xcc,	%f9,	%f12
	udiv	%i3,	0x1ACE,	%g7
	edge16n	%g3,	%i2,	%g4
	fpack16	%f16,	%f19
	ldsb	[%l7 + 0x33],	%o0
	orcc	%g6,	%i5,	%o7
	smul	%g5,	0x1EB6,	%i7
	addcc	%i1,	0x11DB,	%g2
	srlx	%o6,	%i4,	%o5
	edge32n	%l5,	%l0,	%o2
	fmovdleu	%xcc,	%f1,	%f25
	std	%f30,	[%l7 + 0x68]
	orncc	%o3,	0x0466,	%o1
	fmovrse	%i6,	%f17,	%f9
	stw	%l6,	[%l7 + 0x14]
	fmuld8sux16	%f5,	%f30,	%f8
	fors	%f30,	%f23,	%f9
	movcc	%icc,	%l3,	%i0
	movcs	%xcc,	%l4,	%g1
	addcc	%l1,	%o4,	%l2
	fpadd32	%f26,	%f18,	%f10
	fmovdgu	%xcc,	%f23,	%f15
	orn	%i3,	%g3,	%g7
	save %i2, %g4, %o0
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movg	%xcc,	%i5,	%o7
	orncc	%g6,	%i7,	%g5
	fsrc1s	%f28,	%f7
	andcc	%i1,	0x1B71,	%g2
	alignaddr	%i4,	%o5,	%o6
	sethi	0x0D7A,	%l0
	edge32	%o2,	%o3,	%o1
	fmovscc	%xcc,	%f1,	%f15
	movcc	%icc,	%i6,	%l6
	mulscc	%l3,	%l5,	%i0
	movrgez	%g1,	%l4,	%o4
	movl	%xcc,	%l2,	%i3
	ldd	[%l7 + 0x78],	%f28
	fornot1s	%f1,	%f1,	%f20
	ldsb	[%l7 + 0x33],	%g3
	stb	%l1,	[%l7 + 0x18]
	movgu	%xcc,	%g7,	%i2
	fcmpes	%fcc1,	%f10,	%f12
	alignaddrl	%g4,	%o0,	%o7
	st	%f21,	[%l7 + 0x48]
	mulscc	%g6,	%i7,	%i5
	orncc	%i1,	0x0329,	%g2
	edge8	%i4,	%o5,	%o6
	lduh	[%l7 + 0x12],	%g5
	movrne	%o2,	%o3,	%o1
	movleu	%icc,	%i6,	%l0
	sir	0x0616
	sdiv	%l6,	0x152C,	%l5
	nop
	set	0x3C, %l4
	ldsw	[%l7 + %l4],	%i0
	fmovrdlez	%g1,	%f18,	%f28
	edge16l	%l3,	%o4,	%l4
	ldd	[%l7 + 0x20],	%f14
	edge32	%i3,	%l2,	%l1
	edge16n	%g7,	%g3,	%i2
	stb	%g4,	[%l7 + 0x6E]
	stb	%o0,	[%l7 + 0x2F]
	nop
	set	0x54, %i2
	ldsb	[%l7 + %i2],	%g6
	fmovsgu	%xcc,	%f24,	%f12
	edge16ln	%i7,	%o7,	%i1
	alignaddrl	%i5,	%g2,	%i4
	lduh	[%l7 + 0x24],	%o5
	siam	0x2
	fmul8ulx16	%f2,	%f2,	%f6
	andncc	%g5,	%o2,	%o3
	alignaddrl	%o1,	%o6,	%i6
	xnor	%l0,	%l5,	%l6
	std	%f6,	[%l7 + 0x68]
	sll	%g1,	%i0,	%o4
	fpsub16	%f14,	%f26,	%f22
	fnands	%f30,	%f3,	%f29
	save %l3, 0x1CA3, %i3
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	setx loop_88, %l0, %l1
	return %l1
	nop
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
loop_88: 	add	%g7,	%g3,	%l4
	fandnot1s	%f19,	%f28,	%f8
	or	%g4,	%o0,	%i2
	stx	%g6,	[%l7 + 0x50]
	fmovd	%f22,	%f0
	movrlez	%i7,	%i1,	%i5
	movn	%xcc,	%o7,	%g2
	movne	%icc,	%i4,	%g5
	fnors	%f18,	%f7,	%f30
	restore %o5, 0x118A, %o2
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	fandnot2	%f30,	%f8,	%f22
	andncc	%o3,	%o6,	%i6
	andncc	%l0,	%l5,	%l6
	edge8l	%o1,	%i0,	%o4
	move	%icc,	%g1,	%l3
	srlx	%l2,	0x16,	%l1
	movrne	%g7,	0x2E9,	%i3
	fnegd	%f22,	%f30
	subcc	%g3,	%l4,	%o0
	smulcc	%i2,	0x098F,	%g6
	xor	%i7,	0x0BF2,	%i1
	nop
	set	0x38, %i6
	stx	%g4,	[%l7 + %i6]
	fxors	%f27,	%f15,	%f4
	save %o7, %i5, %i4
	rdpr    %cwp,           %g1
	rdpr    %cansave,       %g2
	rdpr    %canrestore,    %g3
	rdpr    %cleanwin,      %g4
	rdpr    %otherwin,      %g5
	rdpr    %wstate,        %g6
	movre	%g2,	0x249,	%o5
	movneg	%icc,	%o2,	%o3
	fornot1	%f2,	%f16,	%f20
	sir	0x1ACC
	edge8n	%g5,	%i6,	%l0
	ld	[%l7 + 0x4C],	%f22
	edge32n	%o6,	%l5,	%o1
	smul	%l6,	0x12AD,	%o4
	movne	%xcc,	%g1,	%l3
	fcmpes	%fcc2,	%f5,	%f3
	mulscc	%l2,	%l1,	%g7
	edge16	%i0,	%g3,	%l4
	xnorcc	%o0,	%i2,	%g6
	mova	%xcc,	%i7,	%i1
	lduw	[%l7 + 0x40],	%i3
	addcc	%o7,	%i5,	%i4
	ldub	[%l7 + 0x2B],	%g4
	udivx	%o5,	0x0478,	%g2
	andncc	%o2,	%g5,	%i6
	fcmpeq16	%f8,	%f4,	%o3
	addcc	%o6,	%l0,	%l5
	movrne	%o1,	0x015,	%o4
	xnorcc	%g1,	0x120D,	%l6
	move	%xcc,	%l3,	%l2
	fornot1s	%f30,	%f5,	%f20
	srax	%g7,	%i0,	%g3
	smul	%l1,	%o0,	%l4
	popc	0x038C,	%g6
	sdivcc	%i2,	0x04AD,	%i1
	andcc	%i7,	%o7,	%i5
	fcmpeq16	%f18,	%f6,	%i4
	mova	%xcc,	%i3,	%o5
	orcc	%g4,	0x0AA2,	%g2
	fmovsg	%icc,	%f7,	%f16
	movg	%icc,	%g5,	%o2
	ldub	[%l7 + 0x1C],	%i6
	subccc	%o3,	0x1DA3,	%l0
	fsrc1	%f12,	%f24
	fmovsg	%xcc,	%f12,	%f16
	st	%f16,	[%l7 + 0x30]
	movrlz	%o6,	0x1D9,	%o1
	edge16n	%o4,	%l5,	%g1
	fcmpgt16	%f18,	%f12,	%l3
	fmovspos	%icc,	%f24,	%f1
	edge8n	%l2,	%g7,	%i0
	fcmpne16	%f30,	%f30,	%l6
	nop
	set	0x67, %l1
	ldsb	[%l7 + %l1],	%l1
	edge16l	%o0,	%g3,	%g6
	orn	%i2,	0x19FF,	%i1
	edge16n	%l4,	%i7,	%i5
	smul	%i4,	0x1A7D,	%i3
	sdivx	%o5,	0x15F6,	%o7
	array32	%g2,	%g4,	%o2
	udivcc	%i6,	0x1250,	%o3
	ldsw	[%l7 + 0x54],	%l0
	movl	%icc,	%o6,	%g5
	mulx	%o4,	0x0FC7,	%l5
	movg	%icc,	%o1,	%g1
	fmovsg	%xcc,	%f18,	%f10
	fmovd	%f18,	%f24
	subcc	%l3,	%l2,	%g7
	movrlez	%l6,	0x31D,	%l1
	ldsw	[%l7 + 0x24],	%i0
	array16	%g3,	%g6,	%o0
	umul	%i2,	%l4,	%i1
	smul	%i7,	%i5,	%i3
	stb	%o5,	[%l7 + 0x2F]
	orncc	%i4,	0x14CB,	%o7
	movrgz	%g4,	%g2,	%o2
	alignaddr	%o3,	%i6,	%o6
	ldsh	[%l7 + 0x50],	%g5
	srax	%o4,	%l0,	%o1
	fnegd	%f28,	%f18
	fmovsle	%icc,	%f28,	%f20
	xor	%g1,	%l3,	%l5
	umul	%g7,	%l6,	%l2
	addc	%i0,	0x037B,	%g3
	std	%f16,	[%l7 + 0x60]
	edge16ln	%g6,	%o0,	%i2
	xor	%l4,	%l1,	%i7
	andncc	%i5,	%i3,	%o5
	alignaddr	%i1,	%o7,	%g4
	xor	%i4,	0x181B,	%o2
	array32	%o3,	%i6,	%g2
	array32	%g5,	%o4,	%o6
	fmovdleu	%xcc,	%f5,	%f0
	xorcc	%o1,	%l0,	%l3
	lduh	[%l7 + 0x20],	%l5
	fmovrsne	%g7,	%f1,	%f7
	xnor	%l6,	0x0024,	%l2
	fmovsleu	%xcc,	%f16,	%f29
	movrgez	%i0,	%g1,	%g6
	sethi	0x1BE7,	%g3
	edge32l	%i2,	%o0,	%l4
	movrlez	%l1,	0x03B,	%i5
	fone	%f30
	EXIT_GOOD



!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
!	Stats for Thread 0:
!
!	Type l   	: 3667
!	Type f   	: 5351
!	Type i   	: 15982
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	EXIT_GOOD	/* test finish  */

/************************************************************************
   Test case data start
 ************************************************************************/
.data
user_data_start:
scratch_area:
.word 0x0933C089
.word 0x28C77E64
.word 0x9573F830
.word 0x155FDBC8
.word 0x53979508
.word 0x1CC11E67
.word 0x356DD6ED
.word 0x90C067B6
.word 0x059B6721
.word 0x4911FBE3
.word 0xCCF12251
.word 0x43D96E61
.word 0x9AC19887
.word 0x1758CA4E
.word 0xBF84A5CE
.word 0x12FF50EB
.word 0xF3786E86
.word 0xDE0774FA
.word 0xD6CEEEDC
.word 0xF87E3B9F
.word 0x61E45F96
.word 0x782D445B
.word 0x2B2D0DFC
.word 0xACB72DE5
.word 0x27A4E9D9
.word 0x16817C1F
.word 0x2C507429
.word 0x851B8FA4
.word 0xDEE9B843
.word 0xAFDBBBE5
.word 0x7B212933
.word 0x292EAB83
.word 0xBB900595
.word 0xC40C35DE
.word 0xB532C515
.word 0xE08C4A29
.word 0x893D9B99
.word 0x9344D0C9
.word 0x7CC2A205
.word 0x4880B9BA
.word 0x835DF583
.word 0xE427E74F
.word 0xCF3B7385
.word 0x762A2FB6
.word 0x74B73B35
.word 0x21919FFB
.word 0x3D1FBCD3
.word 0x988D0F7B
.word 0x26C8A49D
.word 0x3CE02249
.word 0x6AA702E2
.word 0x6F600B09
.word 0xDEE5D41A
.word 0xE15E3803
.word 0xBC5CA819
.word 0xA631254C
.word 0x21BDB3F6
.word 0x35F978F9
.word 0x896D4F15
.word 0xC8B99C38
.word 0xFD880605
.word 0x8C30E6DC
.word 0x2A2DB9D7
.word 0xF52EF217
.end
